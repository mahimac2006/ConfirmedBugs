/*
 * Joint driver: strncasestr-oob-read × printable-string-oob-read
 *
 * Shared buffer: buf[MAX_BUF] is both the haystack (str1) for strncasestr
 * AND the character buffer scanned by printable-string.
 *
 * strncasestr OOB: strnlen(buf, MAX_BUF) < strlen(needle).
 * printable-string OOB: ps_len > MAX_BUF.
 *
 * These two conditions are independent (one constrains buf content via
 * strnlen, the other constrains a separate scalar ps_len), so a joint
 * witness is possible whenever needle is long enough.
 */

#include <klee/klee.h>
#include <assert.h>
#include <stdint.h>
#include <string.h>

#define MAX_BUF 256

int predicate_strncasestr_oob_read(const char *, const char *, size_t);
int predicate_printable_string_oob_read(char * const, size_t, size_t);

int main(void) {
  uint8_t buf[MAX_BUF];
  klee_make_symbolic(buf, sizeof(buf), "buf");

  /* needle strictly longer than any strnlen(buf, MAX_BUF) */
  char needle[MAX_BUF + 2];
  klee_make_symbolic(needle, sizeof(needle), "needle");
  needle[MAX_BUF + 1] = '\0';
  for (int k = 0; k < MAX_BUF; k++)
    klee_assume(needle[k] != '\0');

  /* ps_len > MAX_BUF for printable-string OOB */
  size_t ps_len;
  klee_make_symbolic(&ps_len, sizeof(ps_len), "ps_len");
  klee_assume(ps_len > MAX_BUF);
  klee_assume(ps_len <= (size_t)MAX_BUF * 2);

  int r_str = predicate_strncasestr_oob_read((const char *)buf, needle,
                                              MAX_BUF);
  int r_ps  = predicate_printable_string_oob_read((char *)buf, ps_len,
                                                   MAX_BUF);

  klee_assume(r_str == 1 && r_ps == 1);
  klee_assert(0 && "REACHED_BOTH_strncasestr-oob-read_printable-string-oob-read");
  return 0;
}
