/*
 * Joint driver: cert-elements-oob-write × printable-string-oob-read
 *
 * Shared buffer: buf[MAX_BUF] is the TLS certificate payload for
 * cert-elements AND the string buffer for printable-string-oob-read.
 *
 * printable-string OOB condition: len > buf_size.
 * buf_size = MAX_BUF (the actual allocation); len is a separate symbolic
 * scalar constrained to (MAX_BUF < len <= MAX_BUF*2) so the predicate
 * returns 1.  len cannot be derived from buf bytes without creating an
 * independent symbolic object.
 */

#include <klee/klee.h>
#include <stdint.h>
#include <string.h>
#include <assert.h>

#define MAX_BUF 256

/* cert-elements types */
struct ce_tls_quic { char *server_names; uint16_t server_names_len; };
struct ce_flow   { union { struct ce_tls_quic tls_quic; } protos; };
struct ce_packet { const uint8_t *payload; uint16_t payload_packet_len; };
struct ce_module { struct ce_packet packet; };

int predicate_cert_elements_oob_write(struct ce_module *, struct ce_flow *,
                                       uint16_t, uint16_t);
int predicate_printable_string_oob_read(char * const, size_t, size_t);

int main(void) {
  uint8_t buf[MAX_BUF];
  klee_make_symbolic(buf, sizeof(buf), "buf");

  /* --- cert-elements setup --- */
  struct ce_module ce_mod;
  struct ce_flow   ce_flow;
  memset(&ce_mod,  0, sizeof(ce_mod));
  memset(&ce_flow, 0, sizeof(ce_flow));

  ce_mod.packet.payload            = buf;
  ce_mod.packet.payload_packet_len = MAX_BUF;

  static char existing_names[1];
  ce_flow.protos.tls_quic.server_names = existing_names;

  uint16_t srv_len;
  klee_make_symbolic(&srv_len, sizeof(srv_len), "srv_len");
  klee_assume(srv_len >= 65534u);
  ce_flow.protos.tls_quic.server_names_len = srv_len;

  uint16_t p_offset;
  klee_make_symbolic(&p_offset, sizeof(p_offset), "p_offset");
  klee_assume(p_offset < MAX_BUF);

  /* --- printable-string setup --- */
  /* str = (char *)buf (same buffer), buf_size = MAX_BUF */
  size_t ps_len;
  klee_make_symbolic(&ps_len, sizeof(ps_len), "ps_len");
  klee_assume(ps_len > MAX_BUF);
  klee_assume(ps_len <= (size_t)MAX_BUF * 2); /* tight upper bound */

  int r_ce = predicate_cert_elements_oob_write(&ce_mod, &ce_flow,
                                                p_offset, MAX_BUF);
  int r_ps = predicate_printable_string_oob_read((char *)buf, ps_len, MAX_BUF);

  klee_assume(r_ce == 1 && r_ps == 1);
  klee_assert(0 && "REACHED_BOTH_cert-elements-oob-write_printable-string-oob-read");
  return 0;
}
