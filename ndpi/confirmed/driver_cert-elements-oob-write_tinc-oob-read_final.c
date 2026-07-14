/*
 * Joint driver: cert-elements-oob-write × tinc-oob-read
 *
 * Shared buffer: buf[] is the packet payload for both predicates.
 *
 * cert-elements: needs to find 0x55 0x1D 0x11 and trigger overflow
 * tinc: needs "1 " + 4 digit groups format
 *
 * These require conflicting byte patterns → UNSAT.
 *
 * Buffer size: tinc predicate requires payload_len > 11 (minimum 12).
 * cert-elements needs ≥3 bytes for OID + ~7 more for parsing → minimum ~10.
 * Use 12 bytes (tinc's minimum) which is sufficient for both predicates'
 * logic to execute, even though they'll conflict on byte values.
 */

#include <klee/klee.h>
#include <assert.h>
#include <stdint.h>
#include <string.h>

/* Derived from tinc predicate guard: payload_len > 11 */
#define BUF_SIZE 12

struct ce_tls_quic { char *server_names; uint16_t server_names_len; };
struct ce_flow   { union { struct ce_tls_quic tls_quic; } protos; };
struct ce_packet { const uint8_t *payload; uint16_t payload_packet_len; };
struct ce_module { struct ce_packet packet; };

int predicate_cert_elements_oob_write(struct ce_module *, struct ce_flow *,
                                       uint16_t, uint16_t);

struct tinc_packet { const uint8_t *payload; uint16_t payload_packet_len;
                     int tcp_non_null; };
struct tinc_flow   { uint8_t tinc_state; };
struct tinc_module { struct tinc_packet packet; };

int predicate_tinc_oob_read(struct tinc_module *, struct tinc_flow *);

int main(void) {
  uint8_t buf[BUF_SIZE];
  klee_make_symbolic(buf, sizeof(buf), "buf");

  /* --- cert-elements setup --- */
  struct ce_module ce_mod;
  struct ce_flow   ce_flow;
  memset(&ce_mod,  0, sizeof(ce_mod));
  memset(&ce_flow, 0, sizeof(ce_flow));

  ce_mod.packet.payload            = buf;
  ce_mod.packet.payload_packet_len = BUF_SIZE;

  static char existing_names[1];
  ce_flow.protos.tls_quic.server_names = existing_names;
  ce_flow.protos.tls_quic.server_names_len = 65535;

  /* p_offset = 0: valid starting offset, eliminates symbolic loop bound */
  uint16_t p_offset = 0;
  uint16_t cert_len = BUF_SIZE;

  /* --- tinc setup --- */
  struct tinc_module tinc_mod;
  struct tinc_flow   tinc_flow;
  memset(&tinc_mod,  0, sizeof(tinc_mod));
  memset(&tinc_flow, 0, sizeof(tinc_flow));

  tinc_mod.packet.payload            = buf;
  tinc_mod.packet.payload_packet_len = BUF_SIZE;
  tinc_mod.packet.tcp_non_null       = 1;
  tinc_flow.tinc_state               = 2;

  /* Call both predicates */
  int r_ce   = predicate_cert_elements_oob_write(&ce_mod, &ce_flow,
                                                  p_offset, cert_len);
  int r_tinc = predicate_tinc_oob_read(&tinc_mod, &tinc_flow);

  klee_assume(r_ce == 1 && r_tinc == 1);
  klee_assert(0 && "REACHED_BOTH_cert-elements-oob-write_tinc-oob-read");
  return 0;
}
