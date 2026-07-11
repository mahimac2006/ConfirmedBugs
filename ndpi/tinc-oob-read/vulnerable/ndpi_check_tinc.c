/*
 * nDPI 4.2  —  TINC dissector heap-buffer-overflow (READ 1)
 * arvo:46499   (oss-fuzz issue 46499)
 * Vulnerable file : src/lib/protocols/tinc.c
 * Sink line       : src/lib/protocols/tinc.c:105  (at tag 4.2)
 *
 * Signature:
 *   static void ndpi_check_tinc(struct ndpi_detection_module_struct *ndpi_struct,
 *                               struct ndpi_flow_struct *flow);
 * Parameters:
 *   ndpi_struct - nDPI detection module context; holds the current packet in
 *                 ndpi_struct->packet and the TINC cache in ndpi_struct->tinc_cache.
 *   flow        - per-flow detection state; holds flow->tinc_state and
 *                 flow->tinc_cache_entry.
 *
 * Exact crash sink (tinc.c:105, "case 2/3" TCP branch):
 *
 *     while((packet_payload[i] >= '0' && packet_payload[i] <= '9') ||
 *           (packet_payload[i] >= 'A' && packet_payload[i] <= 'Z')) {
 *       i++;
 *     }
 *
 * The index `i` is advanced through the packet payload with NO check against
 * payload_len (= packet->payload_packet_len). A crafted TCP payload starting
 * with "1 " followed by four space-separated numeric groups but no terminating
 * '\n' lets `i` run past the end of the 54-byte payload buffer, reading 1 byte
 * out of bounds (also reproducible at the earlier loops on lines 93/97 and the
 * dereference on line 110). The fix (commit 06a0abb6fdf8) adds `i < payload_len`
 * guards to every payload_payload[i] access in this branch.
 *
 * ----------------------------------------------------------------------------
 * Minimal dependency closure (definitions taken verbatim from nDPI 4.2)
 * ----------------------------------------------------------------------------
 */

#include <stdint.h>
#include <string.h>

typedef uint8_t  u_int8_t;
typedef uint16_t u_int16_t;
typedef uint32_t u_int32_t;

/* --- src/include/ndpi_typedefs.h:498-504 --------------------------------- */
#define TINC_CACHE_MAX_SIZE 10        /* NDPI_PROTOCOL_TINC */

/* PACK_ON / PACK_OFF are compiler packing attributes (ndpi_define.h.in).    */
PACK_ON struct tinc_cache_entry {
  u_int32_t src_address;
  u_int32_t dst_address;
  u_int16_t dst_port;
} PACK_OFF;

/* --- L4 header types actually touched (declared in ndpi_typedefs.h) ------ */
/* struct ndpi_iphdr  : has .saddr, .daddr (u_int32_t)                        */
/* struct ndpi_tcphdr : has .source, .dest (u_int16_t), .syn:1, .ack:1 bits   */
/* struct ndpi_udphdr : has .source, .dest (u_int16_t)                        */

/* --- src/include/ndpi_typedefs.h:740  (relevant fields only) ------------- */
struct ndpi_packet_struct {
  const struct ndpi_iphdr  *iph;
  const struct ndpi_tcphdr *tcp;
  const struct ndpi_udphdr *udp;
  const u_int8_t           *payload;            /* start of L4 payload       */
  /* ... */
  u_int16_t                 payload_packet_len; /* length of *payload buffer */
  /* ... */
};

/* --- src/include/ndpi_typedefs.h (module ctx, relevant fields) ----------- */
struct ndpi_detection_module_struct {
  struct ndpi_packet_struct packet;
  struct cache             *tinc_cache;         /* ndpi_typedefs.h:1065      */
  /* ... */
};

/* --- src/include/ndpi_typedefs.h:1353-1354 (flow, relevant fields) ------- */
struct ndpi_flow_struct {
  u_int8_t                 tinc_state;
  struct tinc_cache_entry  tinc_cache_entry;
  u_int16_t                detected_protocol_stack[2];
  /* ... */
};

/* --- Macros referenced (src/include/ndpi_define.h.in) -------------------- */
/* #define NDPI_CURRENT_PROTO NDPI_PROTOCOL_TINC                             */
/* line 241:                                                                 */
/*   #define NDPI_EXCLUDE_PROTO(mod,flow) \                                  */
/*     ndpi_exclude_protocol(mod, flow, NDPI_CURRENT_PROTO, __FILE__,        */
/*                           __FUNCTION__, __LINE__)                          */
/* line 207:  #define NDPI_LOG_INFO(mod, args...)  (logging, no bounds work) */

/* --- Helper prototypes (large helpers; see noted source files) ----------- */
/* libcache.h : */
int   cache_remove(struct cache *c, void *key, u_int32_t key_len);
int   cache_add(struct cache *c, void *key, u_int32_t key_len);
struct cache *cache_new(u_int32_t max_size);
#define CACHE_NO_ERROR 0
/* ndpi_main.c : */
void  ndpi_set_detected_protocol(struct ndpi_detection_module_struct *ndpi_struct,
                                 struct ndpi_flow_struct *flow,
                                 u_int16_t upper, u_int16_t lower, int confidence);

/* ============================================================================
 * COMPLETE verbatim pre-patch function  (nDPI 4.2, tinc.c:28-124)
 * ==========================================================================*/

static void ndpi_check_tinc(struct ndpi_detection_module_struct *ndpi_struct, struct ndpi_flow_struct *flow)
{
  struct ndpi_packet_struct *packet = &ndpi_struct->packet;
  const u_int8_t *packet_payload = packet->payload;
  u_int32_t payload_len = packet->payload_packet_len;

  if(packet->udp != NULL) {
    if(ndpi_struct->tinc_cache != NULL) {
      struct tinc_cache_entry tinc_cache_entry1 = {
        .src_address = packet->iph->saddr,
        .dst_address = packet->iph->daddr,
        .dst_port = packet->udp->dest
      };

      struct tinc_cache_entry tinc_cache_entry2 = {
        .src_address = packet->iph->daddr,
        .dst_address = packet->iph->saddr,
        .dst_port = packet->udp->source
      };

      if(cache_remove(ndpi_struct->tinc_cache, &tinc_cache_entry1, sizeof(tinc_cache_entry1)) == CACHE_NO_ERROR ||
	 cache_remove(ndpi_struct->tinc_cache, &tinc_cache_entry2, sizeof(tinc_cache_entry2)) == CACHE_NO_ERROR) {

        cache_remove(ndpi_struct->tinc_cache, &tinc_cache_entry1, sizeof(tinc_cache_entry1));
        cache_remove(ndpi_struct->tinc_cache, &tinc_cache_entry2, sizeof(tinc_cache_entry2));

	/* cache_free(ndpi_struct->tinc_cache); */

        NDPI_LOG_INFO(ndpi_struct, "found tinc udp connection\n");
        ndpi_set_detected_protocol(ndpi_struct, flow, NDPI_PROTOCOL_TINC, NDPI_PROTOCOL_UNKNOWN, NDPI_CONFIDENCE_DPI_CACHE);
      }
    }

    NDPI_EXCLUDE_PROTO(ndpi_struct, flow);
    return;
  } else if(packet->tcp != NULL) {
    if(payload_len == 0) {
      if(packet->tcp->syn == 1 && packet->tcp->ack == 0) {
        flow->tinc_cache_entry.src_address = packet->iph->saddr;
        flow->tinc_cache_entry.dst_address = packet->iph->daddr;
        flow->tinc_cache_entry.dst_port = packet->tcp->dest;
      }
      return;
    }

    switch(flow->tinc_state) {
    case 0:
    case 1:
      if(payload_len > 6 && memcmp(packet_payload, "0 ", 2) == 0 && packet_payload[2] != ' ') {
	u_int32_t i = 3;
	while(i < payload_len && packet_payload[i++] != ' ');
	if(i+3 == payload_len && memcmp((packet_payload+i), "17\n", 3) == 0) {
	  flow->tinc_state++;
	  return;
	}
      }
      break;

    case 2:
    case 3:
      if(payload_len > 11 && memcmp(packet_payload, "1 ", 2) == 0 && packet_payload[2] != ' ') {
	u_int16_t i = 3;
	u_int8_t numbers_left = 4;
	while(numbers_left) {
	  while(packet_payload[i] >= '0' && packet_payload[i] <= '9') {
	    i++;
	  }

	  if(packet_payload[i++] == ' ') {
	    numbers_left--;
	  }
	  else break;
	}

	if(numbers_left) break;

	while((packet_payload[i] >= '0' && packet_payload[i] <= '9') ||   /* <-- SINK: tinc.c:105, OOB READ (no i < payload_len) */
	      (packet_payload[i] >= 'A' && packet_payload[i] <= 'Z')) {
	  i++;
	}

	if(packet_payload[i] == '\n') {
	  if(++flow->tinc_state > 3) {
	    if(ndpi_struct->tinc_cache == NULL)
	      ndpi_struct->tinc_cache = cache_new(TINC_CACHE_MAX_SIZE);

	    cache_add(ndpi_struct->tinc_cache, &(flow->tinc_cache_entry), sizeof(flow->tinc_cache_entry));
	    NDPI_LOG_INFO(ndpi_struct, "found tinc tcp connection\n");
	    ndpi_set_detected_protocol(ndpi_struct, flow, NDPI_PROTOCOL_TINC, NDPI_PROTOCOL_UNKNOWN, NDPI_CONFIDENCE_DPI);
	  }
	  return;
	}
      }
      break;

    default: break;
    }
  }

  NDPI_EXCLUDE_PROTO(ndpi_struct, flow);
}
