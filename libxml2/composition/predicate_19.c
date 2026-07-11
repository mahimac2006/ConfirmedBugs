/* Bug 19 — htmlParseSystemLiteral (HTMLparser.c:3004, libxml2 2.10.4), global-buffer-overflow READ.
 *
 * Real logic: a SYSTEM literal is the quoted string after SYSTEM/PUBLIC. The scanner advances cur
 * from the opening quote to the matching closing quote, then `xmlStrndup(start, cur - start)` copies
 * the span. If the closing quote never appears before input->end, cur runs past the buffer and the
 * strndup over-reads.
 *
 * Non-crashing predicate: `end = buf + len`. Scan the buffer for an opening quote (the literal is
 * preceded by `<!DOCTYPE ... SYSTEM ` in a real document, so it is NOT at offset 0); return 1 if any
 * opening quote has no matching closing quote before `end` (the unterminated-literal over-read).
 */
int predicate_19(const unsigned char *buf, unsigned int len) {
    const unsigned char *end = buf + len;
    const unsigned char *cur = buf;
    while (cur < end) {
        unsigned char c = cur[0];
        if (c == '"' || c == '\'') {                 /* opening quote of a SYSTEM literal */
            unsigned char q = c;
            const unsigned char *p = cur + 1;
            while (p < end && p[0] != q) p += 1;     /* scan for the closing quote        */
            if (p >= end) return 1;                  /* SINK: unterminated -> over-read   */
            cur = p + 1;                             /* skip the closed literal, continue */
        } else {
            cur += 1;
        }
    }
    return 0;
}
