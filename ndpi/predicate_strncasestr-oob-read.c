/*
 * Predicate: strncasestr-oob-read
 * Source: vulnerable/ndpi_strncasestr.c (nDPI 4.2, ndpi_main.c:7100-7118)
 * Sink: for-loop at ndpi_main.c:7109 — unsigned underflow of
 *       (str1_len - str2_len + 1) when str1_len < str2_len drives the
 *       loop bound to ~2^64, causing OOB READ of str1.
 *
 * Return 1 iff str1_len < str2_len (the underflow condition that produces
 * an enormous loop bound and unconditionally reads past str1's buffer).
 *
 * No project-specific structs; this function is self-contained in the original.
 *
 * Trace returning 1: str1="ab" (len=4, str1_len=2), str2="abcdef" (str2_len=6)
 *   → 2 < 6 → return 1.
 *
 * Trace returning 0: str1="abcdef" (str1_len=6), str2="ab" (str2_len=2)
 *   → 6 >= 2 → loop bound = 5, no underflow → return 0.
 */

#include <string.h>   /* strnlen, strlen */

int predicate_strncasestr_oob_read(const char *str1, const char *str2,
                                    size_t len)
{
  if (str1 == NULL || str2 == NULL) return 0;
  if (len == 0) return 0;

  size_t str1_len = strnlen(str1, len);
  size_t str2_len = strlen(str2);

  if (str2_len == 0) return 0; /* loop runs exactly once, i<1, no underflow */

  /*
   * SINK: for(i = 0; i < (str1_len - str2_len + 1); i++) at ndpi_main.c:7109
   * When str1_len < str2_len the subtraction wraps to a huge value
   * and the loop reads str1 far past its len-byte buffer.
   */
  if (str1_len < str2_len) return 1;

  return 0;
}
