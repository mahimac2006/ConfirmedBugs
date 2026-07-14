/*
 * Predicate: cert-elements-oob-write
 * Source: vulnerable/processCertificateElements.c (nDPI 4.2, tls.c)
 * Sink: server_names[server_names_len] = ',' (OOB WRITE, tls.c:593)
 *
 * Return 1 iff the u_int16_t addition server_names_len + dNSName_len + 1
 * overflows (> 65535), which causes ndpi_realloc to receive a wrapped
 * (too-small) size while the write still targets the old server_names_len
 * index — producing an out-of-bounds write.
 *
 * Struct types are prefixed "ce_" to avoid conflicts when included
 * alongside other predicate files in joint drivers.
 *
 * Trace returning 1: p_offset=0, certificate_len=40, payload contains
 *   0x55 0x1D 0x11 at [0], then valid BIT-STRING/SEQUENCE headers,
 *   general_name_type=0x82, len=2, server_names != NULL,
 *   server_names_len=65534 → 65534+2+1=65537 > 65535 → return 1.
 *
 * Trace returning 0: same as above but server_names=NULL (first entry
 *   path) → no overflow check reached → return 0.
 */

#include <stdint.h>
#include <string.h>

typedef uint8_t  u_int8_t;
typedef uint16_t u_int16_t;
typedef uint32_t u_int32_t;

/* Minimal struct closure — only fields touched on the buggy path */
struct ce_tls_quic {
  char     *server_names;
  u_int16_t server_names_len;
};

struct ce_flow {
  union { struct ce_tls_quic tls_quic; } protos;
};

struct ce_packet {
  const u_int8_t *payload;
  u_int16_t       payload_packet_len;
};

struct ce_module {
  struct ce_packet packet;
};

int predicate_cert_elements_oob_write(
    struct ce_module *ndpi_struct,
    struct ce_flow   *flow,
    u_int16_t         p_offset,
    u_int16_t         certificate_len)
{
  struct ce_packet *packet = &ndpi_struct->packet;
  u_int16_t i;

  for (i = p_offset; i < certificate_len; i++) {
    /* Guard: i+2 must be within payload before reading the OID triple */
    if ((u_int32_t)i + 2 >= packet->payload_packet_len) return 0;

    if ((packet->payload[i]   == 0x55) &&
        (packet->payload[i+1] == 0x1d) &&
        (packet->payload[i+2] == 0x11)) {

      /* subjectAltName branch */
      i += 3;
      if (i >= packet->payload_packet_len) return 0;

      /* skip first type byte; unguarded in original — guard here */
      if (packet->payload[i] == 0x04) i++;
      else                             i += 4;
      if (i >= packet->payload_packet_len) return 0;

      /* skip BIT STRING length (existing guard restored) */
      i += (packet->payload[i] & 0x80) ? (packet->payload[i] & 0x7F) : 0;
      if (i >= packet->payload_packet_len) return 0;

      i += 2; /* skip SEQUENCE type+tag */
      if (i >= packet->payload_packet_len) return 0;

      /* skip SEQUENCE length */
      i += (packet->payload[i] & 0x80) ? (packet->payload[i] & 0x7F) : 0;
      i++;

      while (i < packet->payload_packet_len) {
        u_int8_t gn_type = packet->payload[i];

        if (gn_type == 0x81 || gn_type == 0x82 || gn_type == 0x87) {
          /* Guard: need i+1 in bounds for length byte */
          if (i + 1 >= packet->payload_packet_len) return 0;

          u_int8_t  len      = packet->payload[i + 1];
          u_int16_t dNSName_len;

          /* existing guard */
          if (!((i < (packet->payload_packet_len - 1)) &&
                ((u_int32_t)(i + len + 2) < packet->payload_packet_len)))
            return 0;

          i += 2;
          if (len == 0) return 0;

          /* Guard: i+len within payload */
          if ((u_int32_t)i + len > packet->payload_packet_len) return 0;

          /* Use len as proxy for dNSName_len (worst-case; no embedded NULs) */
          dNSName_len = len;

          if (flow->protos.tls_quic.server_names != NULL) {
            /* SINK: check for u_int16_t overflow in newstr_len */
            if ((u_int32_t)flow->protos.tls_quic.server_names_len +
                (u_int32_t)dNSName_len + 1U > 65535U)
              return 1; /* OOB WRITE: wrapped newstr_len, realloc too small */
            /* If no overflow, accumulate and continue */
            flow->protos.tls_quic.server_names_len =
              (u_int16_t)(flow->protos.tls_quic.server_names_len + dNSName_len + 1);
          } else {
            flow->protos.tls_quic.server_names     = (char *)(uintptr_t)1; /* sentinel non-NULL */
            flow->protos.tls_quic.server_names_len = dNSName_len;
          }

          i += len;
        } else {
          break;
        }
      }
    }
  }
  return 0;
}
