/*
 * Joint driver: tinc-oob-read × strncasestr-oob-read
 *
 * Shared buffer: buf[] is the TINC payload AND the str1 haystack.
 * Separate needle[] for strncasestr str2.
 *
 * tinc: requires "1 " format + 4 digit groups
 * strncasestr: requires strnlen(buf, BUF_SIZE) < strlen(needle)
 *
 * Expected: SAT (constraints are compatible).
 *
 * Buffer size: tinc requires payload_len > 11, use 12 as minimum.
 */

#include <klee/klee.h>
#include <assert.h>
#include <stdint.h>
#include <string.h>

#define BUF_SIZE 12

struct tinc_packet { const uint8_t *payload; uint16_t payload_packet_len;
                     int tcp_non_null; };
struct tinc_flow   { uint8_t tinc_state; };
struct tinc_module { struct tinc_packet packet; };

int predicate_tinc_oob_read(struct tinc_module *, struct tinc_flow *);
int predicate_strncasestr_oob_read(const char *, const char *, size_t);

int main(void) {
  uint8_t buf[BUF_SIZE];
  klee_make_symbolic(buf, sizeof(buf), "buf");

  /* Pre-constrain buf to satisfy tinc's initial format requirements.
   * These are derived from tinc predicate's guards, not arbitrary. */
  klee_assume(buf[0] == '1');
  klee_assume(buf[1] == ' ');
  klee_assume(buf[2] != ' ');

  /* Needle: to satisfy strncasestr (strlen(needle) > strnlen(buf, BUF_SIZE)),
   * make needle BUF_SIZE+2 bytes: BUF_SIZE+1 non-NUL + terminating NUL. */
  char needle[BUF_SIZE + 2];
  klee_make_symbolic(needle, sizeof(needle), "needle");

  /* Force NUL at the end */
  needle[BUF_SIZE + 1] = '\0';

  /* Ensure needle[0..BUF_SIZE] have no NUL → strlen(needle) = BUF_SIZE + 1 */
  for (int k = 0; k <= BUF_SIZE; k++)
    klee_assume(needle[k] != '\0');

  /* --- tinc setup --- */
  struct tinc_module tinc_mod;
  struct tinc_flow   tinc_flow;
  memset(&tinc_mod,  0, sizeof(tinc_mod));
  memset(&tinc_flow, 0, sizeof(tinc_flow));

  tinc_mod.packet.payload            = buf;
  tinc_mod.packet.payload_packet_len = BUF_SIZE;
  tinc_mod.packet.tcp_non_null       = 1;
  tinc_flow.tinc_state               = 2;

  /* --- strncasestr setup --- */
  int r_tinc = predicate_tinc_oob_read(&tinc_mod, &tinc_flow);
  int r_str  = predicate_strncasestr_oob_read((const char *)buf, needle,
                                               BUF_SIZE);

  klee_assume(r_tinc == 1 && r_str == 1);
  klee_assert(0 && "REACHED_BOTH_tinc-oob-read_strncasestr-oob-read");
  return 0;
}
