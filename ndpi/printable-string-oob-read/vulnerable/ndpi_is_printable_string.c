/*
 * Project:  nDPI (ntop/nDPI)
 * Version:  4.2  (git tag: 4.2)
 * Bug id:   arvo:44280  (oss-fuzz issue 44280)
 * Sink:     src/lib/ndpi_utils.c:2200
 *
 * Crash type: over-read / use-of-uninitialized-value of the string buffer.
 *   MemorySanitizer report:
 *     #0 ndpi_is_printable_string  ndpi/src/lib/ndpi_utils.c:2200:9
 *     #1 processCertificateElements ndpi/src/lib/protocols/tls.c:400:7
 *
 * Signature:
 *     int ndpi_is_printable_string(char * const str, size_t len);
 *
 * Parameters:
 *     str  - pointer to the character buffer to scan. Non-printable bytes are
 *            rewritten in place to '?'.  In the vulnerable path this is the
 *            2048-byte on-stack `rdnSeqBuf` filled by extractRDNSequence().
 *     len  - number of bytes of `str` to inspect. In the vulnerable path this
 *            is `rdn_len`, an accumulated offset that the caller advanced by the
 *            *return value of snprintf* -- which is the number of bytes that
 *            WOULD have been written had the buffer been large enough, NOT the
 *            number of bytes actually written.  On truncation, `rdn_len` runs
 *            past the initialized/valid region of `rdnSeqBuf`.
 *
 * Exact vulnerable statement (the crash sink, ndpi_utils.c:2200):
 *
 *         if (ndpi_isprint(str[i]) == 0) {
 *                          ^^^^^^  <-- reads str[i] for i in [0, len),
 *                                      where len (rdn_len) can exceed the
 *                                      number of valid bytes in str.
 *
 * Root cause is in the CALLER (tls.c), not in this function: the function
 * faithfully scans `len` bytes, but `len` is attacker-influenced and can be
 * larger than the amount of data actually placed in `str`. See patch/fix.patch:
 * the fix (a) makes extractRDNSequence() return -1 when snprintf reports
 * truncation instead of advancing rdn_len past the buffer, and (b) tightens the
 * scan loop in processCertificateElements() to `certificate_len - 2` so the
 * 3-byte OID probe (payload[i], payload[i+1], payload[i+2]) cannot read past
 * the packet payload.
 */

#include <stddef.h>

/* ---- Minimal dependency closure (all verbatim from nDPI 4.2) ------------- */

/* src/include/ndpi_utils.h:28
 *   Predicate: byte is a printable ASCII char (space .. tilde). */
#define ndpi_isprint(ch) ((ch) >= 0x20 && (ch) <= 0x7e)

/* -------------------------------------------------------------------------- */
/* COMPLETE verbatim pre-patch function body, src/lib/ndpi_utils.c:2196-2206  */
/* -------------------------------------------------------------------------- */

int ndpi_is_printable_string(char * const str, size_t len) {
  int retval = 1;

  for (size_t i = 0; i < len; ++i) {
    if (ndpi_isprint(str[i]) == 0) {     /* <-- SINK: ndpi_utils.c:2200 */
      str[i] = '?';
      retval = 0;
    }
  }

  return retval;
}
