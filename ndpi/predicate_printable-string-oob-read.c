/*
 * Predicate: printable-string-oob-read
 * Source: vulnerable/ndpi_is_printable_string.c (nDPI 4.2, ndpi_utils.c:2196-2206)
 * Sink: str[i] access at ndpi_utils.c:2200 when len (rdn_len, advanced by
 *       snprintf's return value) exceeds the actual initialized/valid bytes
 *       in str, causing an over-read.
 *
 * The function itself is a correct scan of [0, len); the bug lives in the
 * caller passing len > buf_size.  We add buf_size as an explicit parameter
 * so the predicate can detect the OOB condition without changing the logic.
 *
 * Return 1 iff len > buf_size (OOB read at str[buf_size] would occur).
 *
 * Trace returning 1: buf_size=2048, len=2100 → 2100 > 2048 → return 1.
 * Trace returning 0: buf_size=2048, len=100  → 100 <= 2048 → return 0.
 */

#include <stddef.h>

int predicate_printable_string_oob_read(char * const str, size_t len,
                                         size_t buf_size)
{
  if (str == NULL) return 0;
  if (len == 0)    return 0;

  /*
   * SINK: the loop "for(size_t i = 0; i < len; ++i) { if(ndpi_isprint(str[i])...) }"
   * reads str[buf_size] when len > buf_size, which is out of the allocated buffer.
   */
  if (len > buf_size) return 1;

  return 0;
}
