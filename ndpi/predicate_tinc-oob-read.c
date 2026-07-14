/*
 * Predicate: tinc-oob-read
 * Source: vulnerable/ndpi_check_tinc.c (nDPI 4.2, tinc.c)
 * Sink: while loop at tinc.c:183 reading packet_payload[i] without
 *       checking i < payload_len (OOB READ).
 *
 * Return 1 iff we reach the sink while-loop entry with i >= payload_len,
 * which means the original loop condition evaluation would read OOB.
 *
 * Struct types are prefixed "tinc_" to avoid conflicts in joint drivers.
 *
 * Trace returning 1:
 *   tinc_state=2, payload="1 1 2 3 4 " (11+ bytes matching the prefix),
 *   4 digit-groups parsed, i ends at payload_len → return 1 at sink guard.
 *
 * Trace returning 0:
 *   tinc_state=0 → falls through switch without entering case 2/3 → return 0.
 */

#include <stdint.h>
#include <string.h>

typedef uint8_t  u_int8_t;
typedef uint16_t u_int16_t;
typedef uint32_t u_int32_t;

struct tinc_packet {
  const u_int8_t *payload;
  u_int16_t       payload_packet_len;
  int             tcp_non_null; /* 1 = tcp path, 0 = udp path */
};

struct tinc_flow {
  u_int8_t tinc_state;
};

struct tinc_module {
  struct tinc_packet packet;
};

int predicate_tinc_oob_read(struct tinc_module *ndpi_struct,
                             struct tinc_flow   *flow)
{
  const u_int8_t *packet_payload = ndpi_struct->packet.payload;
  u_int32_t       payload_len    = ndpi_struct->packet.payload_packet_len;

  /* Only the TCP path can reach the sink */
  if (!ndpi_struct->packet.tcp_non_null) return 0;
  if (payload_len == 0) return 0;

  if (flow->tinc_state != 2 && flow->tinc_state != 3) return 0;

  /* case 2/3 guard from original */
  if (payload_len <= 11) return 0;
  if (packet_payload[0] != '1') return 0;
  if (packet_payload[1] != ' ') return 0;
  if (packet_payload[2] == ' ') return 0;

  u_int16_t i           = 3;
  u_int8_t  numbers_left = 4;

  while (numbers_left) {
    /* Inner digit loop — UNGUARDED in original; guard → return 0 here */
    while (1) {
      if (i >= payload_len) return 0; /* non-sink unguarded access */
      if (!(packet_payload[i] >= '0' && packet_payload[i] <= '9')) break;
      i++;
    }
    /* Space check — UNGUARDED in original; guard → return 0 here */
    if (i >= payload_len) return 0;
    if (packet_payload[i++] == ' ')
      numbers_left--;
    else
      break;
  }

  if (numbers_left) return 0;

  /*
   * SINK: original code evaluates while(packet_payload[i] >= '0' ...)
   * with no i < payload_len guard.  We return 1 if i >= payload_len
   * (OOB read on first loop-condition evaluation).
   */
  if (i >= payload_len) return 1;

  /* Safe bounded version of the sink loop (predicate must not itself OOB) */
  while (i < payload_len &&
         ((packet_payload[i] >= '0' && packet_payload[i] <= '9') ||
          (packet_payload[i] >= 'A' && packet_payload[i] <= 'Z'))) {
    i++;
    /* If loop would next evaluate condition with i >= payload_len, that
     * is also an OOB (same sink).  Return 1. */
    if (i >= payload_len) return 1;
  }

  return 0;
}
