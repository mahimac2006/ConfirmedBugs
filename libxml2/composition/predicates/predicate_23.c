/* Bug 23 — htmlParseHTMLAttribute (HTMLparser.c:2843, libxml2 2.10.4), uninitialized/over-read.
 *
 * Real logic: an attribute value is read character-by-character via CUR_CHAR (which expands to
 * htmlCurrentChar) until the closing quote. If the value is unterminated, the loop keeps calling
 * htmlCurrentChar past input->end, over-reading the multi-byte continuation bytes — i.e. bug 21's
 * sink, reached through the attribute-value path.
 *
 * Non-crashing predicate: `end = buf + len`. Model a quoted attribute value; while scanning it with
 * the same UTF-8 sequence-length logic, return 1 the moment a continuation byte would be read past
 * `end` before any closing quote.
 */
int predicate_23(const unsigned char *buf, unsigned int len) {
    const unsigned char *end = buf + len;
    const unsigned char *cur = buf;
    if (cur >= end) return 0;
    unsigned char q = cur[0];
    if (q != '"' && q != '\'') return 0;                       /* attribute value opens with a quote */
    cur += 1;
    while (cur < end && cur[0] != q) {                         /* CUR_CHAR loop over the value       */
        unsigned int c = cur[0];
        int seqlen = (c < 0x80) ? 1 : (c < 0xE0) ? 2 : (c < 0xF0) ? 3 : 4;
        if (cur + seqlen > end) return 1;                     /* SINK: htmlCurrentChar reads past end */
        cur += seqlen;
    }
    return 0;
}
