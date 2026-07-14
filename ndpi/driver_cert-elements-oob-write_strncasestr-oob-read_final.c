/*
 * Joint driver: cert-elements-oob-write × strncasestr-oob-read
 *
 * Shared buffer: buf[] is the cert payload AND the str1 haystack.
 * Separate needle[] for strncasestr str2.
 *
 * cert-elements: needs to find 0x55 0x1D 0x11 and trigger overflow
 * strncasestr: needs strnlen(str1, len) < strlen(str2)
 *
 * Expected: SAT (constraints are compatible).
 *
 * Buffer size: cert-elements needs ≥10 bytes for full parsing path.
 * Use 64 bytes as a reasonable size that:
 * - Satisfies cert-elements' parsing requirements
 * - Allows strncasestr condition (buf can have no NUL, needle can be longer)
 * - Small enough for KLEE to explore efficiently
 */

#include <klee/klee.h>
#include <assert.h>
#include <stdint.h>
#include <string.h>

#define BUF_SIZE 64

struct ce_tls_quic { char *server_names; uint16_t server_names_len; };
struct ce_flow   { union { struct ce_tls_quic tls_quic; } protos; };
struct ce_packet { const uint8_t *payload; uint16_t payload_packet_len; };
struct ce_module { struct ce_packet packet; };

int predicate_cert_elements_oob_write(struct ce_module *, struct ce_flow *,
                                       uint16_t, uint16_t);
int predicate_strncasestr_oob_read(const char *, const char *, size_t);

int main(void) {
  uint8_t buf[BUF_SIZE];
  klee_make_symbolic(buf, sizeof(buf), "buf");

  /* Needle array: to satisfy strncasestr OOB (strlen(needle) > strnlen(buf, BUF_SIZE)),
   * make needle longer than BUF_SIZE. Array size = BUF_SIZE + 2 to hold
   * BUF_SIZE+1 non-NUL bytes + terminating NUL. */
  char needle[BUF_SIZE + 2];
  klee_make_symbolic(needle, sizeof(needle), "needle");

  /* Force NUL terminator at the end */
  needle[BUF_SIZE + 1] = '\0';

  /* Constrain needle[0..BUF_SIZE] to have no NUL → strlen(needle) = BUF_SIZE + 1 */
  for (int k = 0; k <= BUF_SIZE; k++)
    klee_assume(needle[k] != '\0');

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

  uint16_t p_offset = 0;
  uint16_t cert_len = BUF_SIZE;

  /* --- strncasestr setup: str1=buf, str2=needle, len=BUF_SIZE --- */
  int r_ce  = predicate_cert_elements_oob_write(&ce_mod, &ce_flow,
                                                 p_offset, cert_len);
  int r_str = predicate_strncasestr_oob_read((const char *)buf, needle,
                                              BUF_SIZE);

  klee_assume(r_ce == 1 && r_str == 1);
  klee_assert(0 && "REACHED_BOTH_cert-elements-oob-write_strncasestr-oob-read");
  return 0;
}
