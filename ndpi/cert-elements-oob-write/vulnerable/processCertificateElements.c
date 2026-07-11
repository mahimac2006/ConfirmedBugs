/*
 * ============================================================================
 * nDPI 4.2  --  arvo:57317  (OSS-Fuzz 57317)
 * Out-of-bounds WRITE in processCertificateElements()
 * ----------------------------------------------------------------------------
 * File          : src/lib/protocols/tls.c
 * Function      : static void processCertificateElements(...)
 * Sink line     : src/lib/protocols/tls.c:593  (as shipped at tag 4.2)
 * Fix commit    : ddb9aa0f95ba263361b9be2ba0a122ea1e001be9
 *                 ("TLS: fix parsing of certificate elements (#1910)")
 *
 * Signature:
 *   static void processCertificateElements(
 *       struct ndpi_detection_module_struct *ndpi_struct,  // nDPI engine/detection ctx (holds packet)
 *       struct ndpi_flow_struct              *flow,        // per-flow state (dest of parsed cert fields)
 *       u_int16_t                             p_offset,    // start offset into packet->payload for this cert
 *       u_int16_t                             certificate_len); // length of the certificate block
 *
 * EXACT crash sink (OOB WRITE), tag-4.2 line 593:
 *
 *   flow->protos.tls_quic.server_names[flow->protos.tls_quic.server_names_len] = ',';
 *
 * Root cause:
 *   The loop counter `i` (and the subjectAltName-walking arithmetic on it) is a
 *   u_int16_t. While parsing the subjectAltName (OID 55 1D 11) list, `i` is
 *   advanced with attacker-controlled length bytes:
 *       i += (packet->payload[i] & 0x80) ? (packet->payload[i] & 0x7F) : 0;
 *       ... i += len; ...
 *   With crafted certificate bytes the 16-bit `i` wraps / mis-advances so the
 *   parser keeps appending dNSName entries and `server_names_len` grows. The
 *   concatenation length is then recomputed in a 16-bit temporary:
 *       u_int16_t newstr_len = server_names_len + dNSName_len + 1;   // wraps at 65535
 *   ndpi_realloc() is asked for the (wrapped, too-small) newstr_len+1 bytes, but
 *   the following write indexes at the OLD, larger server_names_len:
 *       server_names[server_names_len] = ',';                         // <-- OOB WRITE
 *   The fix changes `i` from `u_int16_t` to `int32_t` so the pointer walk can no
 *   longer wrap within the 16-bit range and the runaway accumulation is avoided.
 *
 * The code below is the COMPLETE verbatim pre-patch function body (tag 4.2),
 * preceded by the minimal dependency closure needed to reason about / compile
 * the vulnerable statement. Deep helpers are given as prototypes with a source
 * note; the struct fields directly touched by the sink are inlined in full.
 * ============================================================================
 */

#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include <time.h>
#include <arpa/inet.h>   /* inet_ntop, AF_INET6 */

/* ---- base integer typedefs (nDPI uses BSD-style names) ------------------- */
typedef uint8_t   u_int8_t;
typedef uint16_t  u_int16_t;
typedef uint32_t  u_int32_t;
typedef uint64_t  u_int64_t;
typedef unsigned int u_int;

/* ---- helper macros used inside the function ------------------------------ */
#define ndpi_min(a,b)  ((a < b) ? a : b)
#define ndpi_isprint(ch)  ((ch) >= 0x20 && (ch) <= 0x7e)

/* ---- risk / protocol / confidence enum constants (values illustrative) --- *
 * Real definitions: src/include/ndpi_typedefs.h, ndpi_protocol_ids.h        */
#define NDPI_PROTOCOL_UNKNOWN               0
#define NDPI_PROTOCOL_TLS                   91
#define NDPI_PROTOCOL_CATEGORY_UNSPECIFIED  0
#define NDPI_CONFIDENCE_DPI                 6
/* ndpi_risk_enum members referenced */
#define NDPI_INVALID_CHARACTERS             /* ndpi_risk_enum */ 1
#define NDPI_TLS_CERT_VALIDITY_TOO_LONG     2
#define NDPI_TLS_CERTIFICATE_EXPIRED        3
#define NDPI_TLS_CERTIFICATE_ABOUT_TO_EXPIRE 4
#define NDPI_TLS_SUSPICIOUS_EXTENSION       5
#define NDPI_TLS_CERTIFICATE_MISMATCH       6
#define NDPI_TLS_SELFSIGNED_CERTIFICATE     7

/* TLS validity heuristics thresholds (src/lib/protocols/tls.c) */
#define TLS_LIMIT_DATE   1420070400 /* 2015-01-01 */
#define TLS_THRESHOLD    (34128000 + 10000000) /* approx 13 months window */

typedef int ndpi_cipher_weakness;   /* enum, src/include/ndpi_typedefs.h */

/* ---- forward-declared aggregate types (details elsewhere) ---------------- */
struct tls_heuristics;              /* src/include/ndpi_typedefs.h */
struct ndpi_iphdr  { u_int32_t saddr, daddr; /* ... */ };
struct ndpi_tcphdr { u_int16_t source, dest; /* ... */ };

/* ndpi_protocol result triple (src/include/ndpi_typedefs.h) */
typedef struct {
  u_int16_t master_protocol, app_protocol;
  u_int8_t  category;
} ndpi_protocol;

/* singly-linked trusted-issuer list (src/include/ndpi_typedefs.h) */
typedef struct ndpi_list_struct {
  char *value;
  struct ndpi_list_struct *next;
} ndpi_list;

/* ==========================================================================
 * struct ndpi_packet_struct  (src/include/ndpi_typedefs.h:740, tag 4.2)
 * Only the fields touched by the function are shown; layout preserved.
 * ========================================================================== */
struct ndpi_packet_struct {
  const struct ndpi_iphdr  *iph;
  const struct ndpi_tcphdr *tcp;
  const u_int8_t           *payload;          /* <- indexed by i throughout */
  u_int64_t                 current_time_ms;  /* used for cert expiry checks */
  /* ... many HTTP/line fields omitted ... */
  u_int16_t                 l3_packet_len;
  u_int16_t                 payload_packet_len; /* <- bound of the payload */
  /* ... */
};

/* ==========================================================================
 * flow->protos.tls_quic sub-struct (src/include/ndpi_typedefs.h:1236, tag 4.2)
 * These are the fields written at the crash sink.
 * ========================================================================== */
struct ndpi_tls_quic_struct {
  char      *server_names, *alpn, *tls_supported_versions, *issuerDN, *subjectDN;
  u_int32_t  notBefore, notAfter;
  char       ja3_client[33], ja3_server[33];
  u_int16_t  server_cipher;
  u_int8_t   sha1_certificate_fingerprint[20];
  u_int8_t   hello_processed:1, subprotocol_detected:1, _pad:6;
  struct tls_heuristics *browser_heuristics; /* real: value, not ptr */
  u_int16_t  ssl_version, server_names_len;   /* <- index used at the sink */
  struct { u_int16_t cipher_suite; char *esni; } encrypted_sni;
  ndpi_cipher_weakness server_unsafe_cipher;
};

/* struct ndpi_flow_struct  (src/include/ndpi_typedefs.h) -- relevant fields */
struct ndpi_flow_struct {
  u_int16_t detected_protocol_stack[2];
  u_int8_t  category;
  char      host_server_name[256];
  struct { struct { struct { u_int8_t fingerprint_set:1; } tls; } tcp; } l4;
  union {
    /* ... other protocol sub-structs ... */
    struct ndpi_tls_quic_struct tls_quic;
  } protos;
  /* ... */
};

/* struct ndpi_detection_module_struct  (src/include/ndpi_typedefs.h) */
struct ndpi_automa { void *ac_automa; };
struct ndpi_detection_module_struct {
  struct ndpi_packet_struct packet;
  struct ndpi_automa        tls_cert_subject_automa;
  void                     *tls_cert_cache;      /* struct ndpi_lru_cache * */
  ndpi_list                *trusted_issuer_dn;
  u_int32_t                 tls_certificate_expire_in_x_days;
  /* ... */
};

/* ==========================================================================
 * Helper functions referenced by processCertificateElements().
 * Small local helpers are inlined verbatim; deep engine helpers are prototyped
 * with a source note (all src/lib/*.c unless stated).
 * ========================================================================== */

/* --- local, src/lib/protocols/tls.c:219 (verbatim) --- */
static void cleanupServerName(char *buffer, u_int buffer_len) {
  u_int i;

  /* Now all lowecase */
  for(i=0; i<buffer_len; i++)
    buffer[i] = tolower(buffer[i]);
}

/* --- local, src/lib/protocols/tls.c:235 (verbatim) ---
   Return: -1 error (buffer too short) / 0 not printable / 1 OK.
   Writes the RDN "label=value" text into rdnSeqBuf at *rdnSeqBuf_offset. */
static int extractRDNSequence(struct ndpi_packet_struct *packet,
			      u_int offset, char *buffer, u_int buffer_len,
			      char *rdnSeqBuf, u_int *rdnSeqBuf_offset,
			      u_int rdnSeqBuf_len,
			      const char *label) {
  u_int8_t str_len = packet->payload[offset+4], is_printable = 1;
  char *str;
  u_int len, j;

  if(*rdnSeqBuf_offset >= rdnSeqBuf_len)
    return -1;

  // packet is truncated... further inspection is not needed
  if((offset+4+str_len) >= packet->payload_packet_len)
    return(-1);

  str = (char*)&packet->payload[offset+5];

  len = (u_int)ndpi_min(str_len, buffer_len-1);
  strncpy(buffer, str, len);
  buffer[len] = '\0';

  // check string is printable
  for(j = 0; j < len; j++) {
    if(!ndpi_isprint(buffer[j])) {
      is_printable = 0;
      break;
    }
  }

  if(is_printable) {
    int rc = snprintf(&rdnSeqBuf[*rdnSeqBuf_offset],
		      rdnSeqBuf_len-(*rdnSeqBuf_offset),
		      "%s%s=%s", (*rdnSeqBuf_offset > 0) ? ", " : "",
		      label, buffer);

    if(rc > 0)
      (*rdnSeqBuf_offset) += rc;
  }

  return(is_printable);
}

/* --- deep engine helpers (prototypes only) ---
   src/lib/ndpi_main.c / ndpi_utils.c / ndpi_memory.c */
extern void *ndpi_strdup(const char *s);
extern void *ndpi_realloc(void *ptr, size_t old_size, size_t new_size);
extern int   ndpi_is_printable_string(char * const str, size_t len);
extern void  ndpi_set_risk(struct ndpi_detection_module_struct *ndpi_struct,
                           struct ndpi_flow_struct *flow, int /*ndpi_risk_enum*/ r);
extern int   ndpi_match_hostname_protocol(struct ndpi_detection_module_struct *ndpi_struct,
                                          struct ndpi_flow_struct *flow, u_int16_t master_protocol,
                                          char *name, u_int name_len);
extern int   ndpi_match_string_value(void *automa, char *string_to_match,
                                     u_int match_len, u_int32_t *num);
extern void  ndpi_set_detected_protocol(struct ndpi_detection_module_struct *ndpi_struct,
                                        struct ndpi_flow_struct *flow, u_int16_t upper,
                                        u_int16_t lower, int confidence);
extern u_int8_t ndpi_get_proto_category(struct ndpi_detection_module_struct *ndpi_struct,
                                        ndpi_protocol proto);
extern void  ndpi_check_subprotocol_risk(struct ndpi_detection_module_struct *ndpi_struct,
                                         struct ndpi_flow_struct *flow, u_int16_t subprotocol);
extern void *ndpi_lru_cache_init(u_int32_t num_entries);
extern void  ndpi_lru_add_to_cache(void *c, u_int32_t key, u_int16_t value);

/* strptime / timegm from <time.h>; inet_ntop from <arpa/inet.h> */


/* ==========================================================================
 * COMPLETE VERBATIM PRE-PATCH FUNCTION  (nDPI tag 4.2, tls.c:317-679)
 * The vulnerable write is marked "<-- OOB WRITE (tag-4.2 line 593)".
 * ========================================================================== */
static void processCertificateElements(struct ndpi_detection_module_struct *ndpi_struct,
				       struct ndpi_flow_struct *flow,
				       u_int16_t p_offset, u_int16_t certificate_len) {
  struct ndpi_packet_struct *packet = &ndpi_struct->packet;
  u_int16_t num_found = 0, i;
  char buffer[64] = { '\0' }, rdnSeqBuf[2048];
  u_int rdn_len = 0;

  rdnSeqBuf[0] = '\0';

#ifdef DEBUG_TLS
  printf("[TLS] %s() [offset: %u][certificate_len: %u]\n", __FUNCTION__, p_offset, certificate_len);
#endif

  /* Check after handshake protocol header (5 bytes) and message header (4 bytes) */
  for(i = p_offset; i < certificate_len; i++) {
    /*
      See https://www.ibm.com/support/knowledgecenter/SSFKSJ_7.5.0/com.ibm.mq.sec.doc/q009860_.htm
      for X.509 certificate labels
    */
    if((packet->payload[i] == 0x55) && (packet->payload[i+1] == 0x04) && (packet->payload[i+2] == 0x03)) {
      /* Common Name */
      int rc = extractRDNSequence(packet, i, buffer, sizeof(buffer), rdnSeqBuf, &rdn_len, sizeof(rdnSeqBuf), "CN");
      if(rc == -1) break;

#ifdef DEBUG_TLS
      printf("[TLS] %s() [%s][%s: %s]\n", __FUNCTION__, (num_found == 0) ? "Subject" : "Issuer", "Common Name", buffer);
#endif
    } else if((packet->payload[i] == 0x55) && (packet->payload[i+1] == 0x04) && (packet->payload[i+2] == 0x06)) {
      /* Country */
      int rc = extractRDNSequence(packet, i, buffer, sizeof(buffer), rdnSeqBuf, &rdn_len, sizeof(rdnSeqBuf), "C");
      if(rc == -1) break;

#ifdef DEBUG_TLS
      printf("[TLS] %s() [%s][%s: %s]\n", __FUNCTION__, (num_found == 0) ? "Subject" : "Issuer", "Country", buffer);
#endif
    } else if((packet->payload[i] == 0x55) && (packet->payload[i+1] == 0x04) && (packet->payload[i+2] == 0x07)) {
      /* Locality */
      int rc = extractRDNSequence(packet, i, buffer, sizeof(buffer), rdnSeqBuf, &rdn_len, sizeof(rdnSeqBuf), "L");
      if(rc == -1) break;

#ifdef DEBUG_TLS
      printf("[TLS] %s() [%s][%s: %s]\n", __FUNCTION__, (num_found == 0) ? "Subject" : "Issuer", "Locality", buffer);
#endif
    } else if((packet->payload[i] == 0x55) && (packet->payload[i+1] == 0x04) && (packet->payload[i+2] == 0x08)) {
      /* State or Province */
      int rc = extractRDNSequence(packet, i, buffer, sizeof(buffer), rdnSeqBuf, &rdn_len, sizeof(rdnSeqBuf), "ST");
      if(rc == -1) break;

#ifdef DEBUG_TLS
      printf("[TLS] %s() [%s][%s: %s]\n", __FUNCTION__, (num_found == 0) ? "Subject" : "Issuer", "State or Province", buffer);
#endif
    } else if((packet->payload[i] == 0x55) && (packet->payload[i+1] == 0x04) && (packet->payload[i+2] == 0x0a)) {
      /* Organization Name */
      int rc = extractRDNSequence(packet, i, buffer, sizeof(buffer), rdnSeqBuf, &rdn_len, sizeof(rdnSeqBuf), "O");
      if(rc == -1) break;

#ifdef DEBUG_TLS
      printf("[TLS] %s() [%s][%s: %s]\n", __FUNCTION__, (num_found == 0) ? "Subject" : "Issuer", "Organization Name", buffer);
#endif

    } else if((packet->payload[i] == 0x55) && (packet->payload[i+1] == 0x04) && (packet->payload[i+2] == 0x0b)) {
      /* Organization Unit */
      int rc = extractRDNSequence(packet, i, buffer, sizeof(buffer), rdnSeqBuf, &rdn_len, sizeof(rdnSeqBuf), "OU");
      if(rc == -1) break;

#ifdef DEBUG_TLS
      printf("[TLS] %s() [%s][%s: %s]\n", __FUNCTION__, (num_found == 0) ? "Subject" : "Issuer", "Organization Unit", buffer);
#endif
    } else if((packet->payload[i] == 0x30) && (packet->payload[i+1] == 0x1e) && (packet->payload[i+2] == 0x17)) {
      /* Certificate Validity */
      u_int8_t len = packet->payload[i+3];
      u_int offset = i+4;

      if(num_found == 0) {
	num_found++;

#ifdef DEBUG_TLS
	printf("[TLS] %s() IssuerDN [%s]\n", __FUNCTION__, rdnSeqBuf);
#endif

	if(rdn_len && (flow->protos.tls_quic.issuerDN == NULL)) {
	  flow->protos.tls_quic.issuerDN = ndpi_strdup(rdnSeqBuf);
	  if(ndpi_is_printable_string(rdnSeqBuf, rdn_len) == 0) {
	    ndpi_set_risk(ndpi_struct, flow, NDPI_INVALID_CHARACTERS);
	  }
	}

	rdn_len = 0; /* Reset buffer */
      }

      if((offset+len) < packet->payload_packet_len) {
	char utcDate[32];

#ifdef DEBUG_TLS
	u_int j;

	printf("[CERTIFICATE] notBefore [len: %u][", len);
	for(j=0; j<len; j++) printf("%c", packet->payload[i+4+j]);
	printf("]\n");
#endif

	if(len < (sizeof(utcDate)-1)) {
	  struct tm utc;
	  utc.tm_isdst = -1; /* Not set by strptime */

	  strncpy(utcDate, (const char*)&packet->payload[i+4], len);
	  utcDate[len] = '\0';

	  /* 141021000000Z */
	  if(strptime(utcDate, "%y%m%d%H%M%SZ", &utc) != NULL) {
	    flow->protos.tls_quic.notBefore = timegm(&utc);
#ifdef DEBUG_TLS
	    printf("[CERTIFICATE] notBefore %u [%s]\n",
		   flow->protos.tls_quic.notBefore, utcDate);
#endif
	  }
	}

	offset += len;

	if((offset+1) < packet->payload_packet_len) {
	  len = packet->payload[offset+1];

	  offset += 2;

	  if((offset+len) < packet->payload_packet_len) {
	    u_int32_t time_sec = packet->current_time_ms / 1000;
#ifdef DEBUG_TLS
	    u_int j;

	    printf("[CERTIFICATE] notAfter [len: %u][", len);
	    for(j=0; j<len; j++) printf("%c", packet->payload[offset+j]);
	    printf("]\n");
#endif

	    if(len < (sizeof(utcDate)-1)) {
	      struct tm utc;
	      utc.tm_isdst = -1; /* Not set by strptime */

	      strncpy(utcDate, (const char*)&packet->payload[offset], len);
	      utcDate[len] = '\0';

	      /* 141021000000Z */
	      if(strptime(utcDate, "%y%m%d%H%M%SZ", &utc) != NULL) {
		flow->protos.tls_quic.notAfter = timegm(&utc);
#ifdef DEBUG_TLS
		printf("[CERTIFICATE] notAfter %u [%s]\n",
		       flow->protos.tls_quic.notAfter, utcDate);
#endif
	      }
	    }

	    if(flow->protos.tls_quic.notBefore > TLS_LIMIT_DATE)
	      if((flow->protos.tls_quic.notAfter-flow->protos.tls_quic.notBefore) > TLS_THRESHOLD)
		ndpi_set_risk(ndpi_struct, flow, NDPI_TLS_CERT_VALIDITY_TOO_LONG); /* Certificate validity longer than 13 months */

	    if((time_sec < flow->protos.tls_quic.notBefore) || (time_sec > flow->protos.tls_quic.notAfter))
	      ndpi_set_risk(ndpi_struct, flow, NDPI_TLS_CERTIFICATE_EXPIRED); /* Certificate expired */
	    else if((time_sec > flow->protos.tls_quic.notBefore)
		    && (time_sec > (flow->protos.tls_quic.notAfter - (ndpi_struct->tls_certificate_expire_in_x_days * 86400))))
	      ndpi_set_risk(ndpi_struct, flow, NDPI_TLS_CERTIFICATE_ABOUT_TO_EXPIRE); /* Certificate almost expired */
	  }
	}
      }
    } else if((packet->payload[i] == 0x55) && (packet->payload[i+1] == 0x1d) && (packet->payload[i+2] == 0x11)) {
      /* Organization OID: 2.5.29.17 (subjectAltName) */
      u_int8_t matched_name = 0;

      /* If the client hello was not observed or the requested name was missing, there is no need to trigger an alert */
      if(flow->host_server_name[0] == '\0')
	matched_name = 1;

#ifdef DEBUG_TLS
      printf("******* [TLS] Found subjectAltName\n");
#endif

      i += 3 /* skip the initial patten 55 1D 11 */;

      /* skip the first type, 0x04 == BIT STRING, and jump to it's length */
      if(packet->payload[i] == 0x04) i++; else i += 4; /* 4 bytes, with the last byte set to 04 */

      if(i < packet->payload_packet_len) {
	i += (packet->payload[i] & 0x80) ? (packet->payload[i] & 0x7F) : 0; /* skip BIT STRING length */
	if(i < packet->payload_packet_len) {
	  i += 2; /* skip the second type, 0x30 == SEQUENCE, and jump to it's length */
	  if(i < packet->payload_packet_len) {
	    i += (packet->payload[i] & 0x80) ? (packet->payload[i] & 0x7F) : 0; /* skip SEQUENCE length */
	    i++;

	    while(i < packet->payload_packet_len) {
	      u_int8_t general_name_type = packet->payload[i];

	      if((general_name_type == 0x81)    /* rfc822Name */
		 || (general_name_type == 0x82) /* dNSName    */
		 || (general_name_type == 0x87) /* ipAddress  */
		 )
		{
		if((i < (packet->payload_packet_len - 1))
		   && ((i + packet->payload[i + 1] + 2) < packet->payload_packet_len)) {
		  u_int8_t len = packet->payload[i + 1];
		  char dNSName[256];
		  u_int16_t dNSName_len;

		  i += 2;

		  /* The check "len > sizeof(dNSName) - 1" will be always false. If we add it,
		     the compiler is smart enough to detect it and throws a warning */
		  if((len == 0 /* Looks something went wrong */)
		     || ((i+len) > packet->payload_packet_len))
		    break;

		  if(general_name_type == 0x87) {
		    if(len == 4 /* IPv4 */) {
		      snprintf(dNSName, sizeof(dNSName), "%u.%u.%u.%u",
			       packet->payload[i] & 0xFF,
			       packet->payload[i+1] & 0xFF,
			       packet->payload[i+2] & 0xFF,
			       packet->payload[i+3] & 0xFF);
		    } else if(len == 16 /* IPv6 */){
		      inet_ntop(AF_INET6, &packet->payload[i], dNSName, sizeof(dNSName));
		    } else {
		      /* Is that possibile? Better safe than sorry */
		      dNSName[0] = '\0';
		    }
		  } else {
		    strncpy(dNSName, (const char*)&packet->payload[i], len);
		    dNSName[len] = '\0';
		  }

		  dNSName_len = strlen(dNSName);
		  cleanupServerName(dNSName, dNSName_len);

#if DEBUG_TLS
		  printf("[TLS] dNSName %s [%s][len: %u][leftover: %d]\n", dNSName,
			 flow->host_server_name, len,
			 packet->payload_packet_len-i-len);
#endif
		  if(ndpi_is_printable_string(dNSName, dNSName_len) == 0)
		    ndpi_set_risk(ndpi_struct, flow, NDPI_INVALID_CHARACTERS);

		  if(matched_name == 0) {
#if DEBUG_TLS
		    printf("[TLS] Trying to match '%s' with '%s'\n",
			   flow->host_server_name,
			   dNSName);
#endif

		    if(flow->host_server_name[0] == '\0') {
		      matched_name = 1;	/* No SNI */
		    } else if(dNSName[0] == '*') {
		      char * label = strstr(flow->host_server_name, &dNSName[1]);

		      if(label != NULL) {
		        char * first_dot = strchr(flow->host_server_name, '.');

			if((first_dot == NULL) || (first_dot <= label)) {
                          matched_name = 1;
			}
                      }
		    }
		    else if(strcmp(flow->host_server_name, dNSName) == 0) {
		      matched_name = 1;
		    }
		  }

		  if(flow->protos.tls_quic.server_names == NULL)
		    flow->protos.tls_quic.server_names = ndpi_strdup(dNSName),
		      flow->protos.tls_quic.server_names_len = strlen(dNSName);
		  else {
		    u_int16_t newstr_len = flow->protos.tls_quic.server_names_len + dNSName_len + 1;
		    char *newstr = (char*)ndpi_realloc(flow->protos.tls_quic.server_names,
						       flow->protos.tls_quic.server_names_len+1, newstr_len+1);

		    if(newstr) {
		      flow->protos.tls_quic.server_names = newstr;
		      flow->protos.tls_quic.server_names[flow->protos.tls_quic.server_names_len] = ',';   /* <-- OOB WRITE (tag-4.2 line 593) */
		      strncpy(&flow->protos.tls_quic.server_names[flow->protos.tls_quic.server_names_len+1],
			      dNSName, dNSName_len+1);
		      flow->protos.tls_quic.server_names[newstr_len] = '\0';
		      flow->protos.tls_quic.server_names_len = newstr_len;
		    }
		  }

		  if(!flow->protos.tls_quic.subprotocol_detected)
		    if(ndpi_match_hostname_protocol(ndpi_struct, flow, NDPI_PROTOCOL_TLS, dNSName, dNSName_len))
		      flow->protos.tls_quic.subprotocol_detected = 1;

		  i += len;
		} else {
#if DEBUG_TLS
		  printf("[TLS] Leftover %u bytes", packet->payload_packet_len - i);
#endif
		  ndpi_set_risk(ndpi_struct, flow, NDPI_TLS_SUSPICIOUS_EXTENSION);
		  break;
		}
	      } else {
		break;
	      }
	    } /* while */

	    if(!matched_name)
	      ndpi_set_risk(ndpi_struct, flow, NDPI_TLS_CERTIFICATE_MISMATCH); /* Certificate mismatch */
	  }
	}
      }
    }
  } /* for */

  if(rdn_len && (flow->protos.tls_quic.subjectDN == NULL)) {
    flow->protos.tls_quic.subjectDN = ndpi_strdup(rdnSeqBuf);

    if(flow->detected_protocol_stack[1] == NDPI_PROTOCOL_UNKNOWN) {
      /* No idea what is happening behind the scenes: let's check the certificate */
      u_int32_t val;
      int rc = ndpi_match_string_value(ndpi_struct->tls_cert_subject_automa.ac_automa,
				       rdnSeqBuf, strlen(rdnSeqBuf), &val);

      if(rc == 0) {
	/* Match found */
	u_int16_t proto_id = (u_int16_t)val;
	ndpi_protocol ret = { NDPI_PROTOCOL_TLS, proto_id, NDPI_PROTOCOL_CATEGORY_UNSPECIFIED};

	ndpi_set_detected_protocol(ndpi_struct, flow, proto_id, NDPI_PROTOCOL_TLS, NDPI_CONFIDENCE_DPI);
	flow->category = ndpi_get_proto_category(ndpi_struct, ret);
	ndpi_check_subprotocol_risk(ndpi_struct, flow, proto_id);

	if(ndpi_struct->tls_cert_cache == NULL)
	  ndpi_struct->tls_cert_cache = ndpi_lru_cache_init(1024);

	if(ndpi_struct->tls_cert_cache && packet->iph) {
	  u_int32_t key = packet->iph->saddr + packet->tcp->source; /* Server */

	  ndpi_lru_add_to_cache(ndpi_struct->tls_cert_cache, key, proto_id);
	}
      }
    }
  }

  if(flow->protos.tls_quic.subjectDN && flow->protos.tls_quic.issuerDN
     && (!strcmp(flow->protos.tls_quic.subjectDN, flow->protos.tls_quic.issuerDN))) {
    /* Last resort: we check if this is a trusted issuerDN */
    ndpi_list *head = ndpi_struct->trusted_issuer_dn;

    while(head != NULL) {
#if DEBUG_TLS
      printf("TLS] %s() issuerDN %s / %s\n", __FUNCTION__,
	     flow->protos.tls_quic.issuerDN, head->value);
#endif

      if(strcmp(flow->protos.tls_quic.issuerDN, head->value) == 0)
	return; /* This is a trusted DN */
      else
	head = head->next;
    }

    ndpi_set_risk(ndpi_struct, flow, NDPI_TLS_SELFSIGNED_CERTIFICATE);
  }

#if DEBUG_TLS
  printf("[TLS] %s() SubjectDN [%s]\n", __FUNCTION__, rdnSeqBuf);
#endif
}
