/* Bug 20 — htmlParseHTMLAttribute (HTMLparser.c:2843, libxml2 2.10.4), uninitialized/over-read.
 *
 * Real logic: an attribute value is read character-by-character via CUR_CHAR (which expands to
 * htmlCurrentChar) until the closing quote. If the value is unterminated, the loop keeps calling
 * htmlCurrentChar past input->end, over-reading the multi-byte continuation bytes — i.e. bug 18's
 * sink, reached through the attribute-value path.
 *
 * Non-crashing predicate: `end = buf + len`. Scan for an opening quote (in a real document the value
 * is preceded by `<tag attr=`, so it is NOT at offset 0); inside the value, using the same UTF-8
 * sequence-length logic, return 1 the moment a continuation byte would be read past `end` before a
 * closing quote.
 */
int predicate_20(const unsigned char *buf, unsigned int len) {
    const unsigned char *end = buf + len;
    const unsigned char *cur = buf;
    while (cur < end) {
        unsigned char c = cur[0];
        if (c == '"' || c == '\'') {                          /* opening quote of the value */
            unsigned char q = c;
            const unsigned char *p = cur + 1;
            while (p < end && p[0] != q) {                    /* CUR_CHAR loop over the value */
                unsigned int cc = p[0];
                int seqlen = (cc < 0x80) ? 1 : (cc < 0xE0) ? 2 : (cc < 0xF0) ? 3 : 4;
                if (p + seqlen > end) return 1;               /* SINK: htmlCurrentChar past end */
                p += seqlen;
            }
            if (p >= end) return 0;                           /* end reached without over-read */
            cur = p + 1;                                      /* skip the closed value, continue */
        } else {
            cur += 1;
        }
    }
    return 0;
}
