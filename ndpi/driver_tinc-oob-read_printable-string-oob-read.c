/*
 * Joint driver: tinc-oob-read × printable-string-oob-read
 *
 * Shared buffer: buf[MAX_BUF] is the TINC TCP payload AND the character
 * buffer scanned by printable-string.
 *
 * tinc OOB: buf parsed as "1 <4 digit-groups> …" with i going past payload_len.
 * printable-string OOB: ps_len > MAX_BUF (ps_len is a symbolic scalar).
 */

#include <klee/klee.h>
#include <assert.h>

#include <stdint.h>
#include <string.h>

#define MAX_BUF 256

/* tinc types */
struct tinc_packet { const uint8_t *payload; uint16_t payload_packet_len;
                     int tcp_non_null; };
struct tinc_flow   { uint8_t tinc_state; };
struct tinc_module { struct tinc_packet packet; };

int predicate_tinc_oob_read(struct tinc_module *, struct tinc_flow *);
int predicate_printable_string_oob_read(char * const, size_t, size_t);

int main(void) {
  uint8_t buf[MAX_BUF];
  klee_make_symbolic(buf, sizeof(buf), "buf");

  /* --- tinc setup --- */
  struct tinc_module tinc_mod;
  struct tinc_flow   tinc_flow;
  memset(&tinc_mod,  0, sizeof(tinc_mod));
  memset(&tinc_flow, 0, sizeof(tinc_flow));

  tinc_mod.packet.payload            = buf;
  tinc_mod.packet.payload_packet_len = MAX_BUF;
  tinc_mod.packet.tcp_non_null       = 1;
  tinc_flow.tinc_state               = 2;

  /* --- printable-string setup --- */
  size_t ps_len;
  klee_make_symbolic(&ps_len, sizeof(ps_len), "ps_len");
  klee_assume(ps_len > MAX_BUF);
  klee_assume(ps_len <= (size_t)MAX_BUF * 2);

  int r_tinc = predicate_tinc_oob_read(&tinc_mod, &tinc_flow);
  int r_ps   = predicate_printable_string_oob_read((char *)buf, ps_len,
                                                    MAX_BUF);

  klee_assume(r_tinc == 1 && r_ps == 1);
  klee_assert(0 && "REACHED_BOTH_tinc-oob-read_printable-string-oob-read");
  return 0;
}
