/*
 * Project : nDPI (ntop/nDPI)
 * Version : 4.2                (tag "4.2", commit tagged 2022-02-01)
 * Source  : src/lib/ndpi_main.c
 * Bug     : arvo:44482  (oss-fuzz 44482)
 * Sink    : src/lib/ndpi_main.c:7109  (unsigned underflow drives an OOB read)
 * Type    : Heap-buffer-overflow READ
 *
 * Signature:
 *   const char *ndpi_strncasestr(const char *str1, const char *str2, size_t len);
 *
 * Parameters:
 *   str1 - the haystack buffer to be searched (NOT guaranteed NUL-terminated;
 *          only `len` bytes are valid / owned).
 *   str2 - the needle, a NUL-terminated C string to search for (case-insensitive).
 *   len  - the number of valid bytes available in str1 (upper bound for strnlen).
 *
 * The exact crash sink (root cause), src/lib/ndpi_main.c:7109 :
 *
 *     for(i = 0; i < (str1_len - str2_len + 1); i++){
 *
 *   `i`, `str1_len` and `str2_len` are all `size_t` (unsigned). When the
 *   haystack is shorter than the needle (str1_len < str2_len), the expression
 *   `str1_len - str2_len + 1` wraps around to a huge unsigned value. The loop
 *   then iterates far past the end of `str1`, and the body dereferences
 *   `str1[0]` (line 7110) and reads `str2_len` bytes of `str1` via
 *   `strncasecmp(str1, str2, str2_len)` (line 7112) well beyond the `len`-byte
 *   buffer -> heap-buffer-overflow READ.
 *
 * The fix (commit f229068fd384) changes `i` to a *signed* int and casts the
 * loop bound to (int), so when str1_len < str2_len the bound is <= 0 and the
 * loop body never runs.
 *
 * ------------------------------------------------------------------------
 * Minimal dependency closure (everything the function references):
 *   - strnlen(const char*, size_t)         : standard C library (string.h)
 *   - strlen(const char*)                  : standard C library (string.h)
 *   - strncasecmp(const char*, const char*, size_t) :
 *         POSIX / <strings.h>. NOTE: on platforms lacking it, nDPI ships its
 *         own charmap-based fallback in src/lib/ndpi_utils.c (int strncasecmp(
 *         const char *s1, const char *s2, size_t n)) which does a table
 *         lookup `cm[*us1]` -- i.e. it still reads bytes of s1 and is the
 *         concrete over-read site when the loop over-iterates.
 *   - No project-specific macros, typedefs, structs, enums, globals, or
 *     helpers are referenced (no ndpi_toupper etc.). The function is fully
 *     self-contained apart from the three libc string routines above.
 * ------------------------------------------------------------------------
 */

#include <string.h>   /* strnlen, strlen */
#include <strings.h>  /* strncasecmp */

/* ===== COMPLETE verbatim pre-patch function, as shipped at tag 4.2 ===== */
/* src/lib/ndpi_main.c, lines 7100-7118 at tag 4.2                        */

/*
 * Same as ndpi_strnstr but case-insensitive
 */
const char * ndpi_strncasestr(const char *str1, const char *str2, size_t len) {
  size_t str1_len = strnlen(str1, len);
  size_t str2_len = strlen(str2);
  size_t i;

  for(i = 0; i < (str1_len - str2_len + 1); i++){   /* <-- SINK: unsigned underflow when str1_len < str2_len */
    if(str1[0] == '\0')
      return NULL;
    else if(strncasecmp(str1, str2, str2_len) == 0)
      return(str1);

    str1++;
  }

  return NULL;
}
