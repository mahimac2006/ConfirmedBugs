/* Bug 22 — htmlParseSystemLiteral (HTMLparser.c:3004, libxml2 2.10.4), global-buffer-overflow READ.
 *
 * Real logic: a SYSTEM literal is the quoted string after SYSTEM/PUBLIC. The scanner advances cur
 * from the opening quote to the matching closing quote, then `xmlStrndup(start, cur - start)` copies
 * the span. If the closing quote never appears before input->end, cur runs past the buffer and the
 * strndup over-reads.
 *
 * Non-crashing predicate: `end = buf + len`. Return 1 when an opening quote has no matching closing
 * quote before `end` (the unterminated-literal path that reaches the xmlStrndup over-read).
 */
int predicate_22(const unsigned char *buf, unsigned int len) {
    const unsigned char *end = buf + len;
    const unsigned char *cur = buf;
    if (cur >= end) return 0;
    unsigned char q = cur[0];
    if (q != '"' && q != '\'') return 0;        /* must open a SYSTEM literal with ' or "     */
    cur += 1;                                   /* NEXT past the opening quote                 */
    while (cur < end && cur[0] != q) cur += 1;  /* scan for the closing quote                  */
    if (cur >= end) return 1;                   /* SINK: unterminated -> xmlStrndup over-reads */
    return 0;
}
