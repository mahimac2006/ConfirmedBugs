/* Bug 18 — htmlCurrentChar (HTMLparser.c:474, libxml2 2.10.4), global-buffer-overflow READ.
 *
 * Real logic: for a byte >= 0x80 the UTF-8 decoder computes a sequence length from the lead-byte
 * class and reads the continuation bytes cur[1..seqlen-1] WITHOUT checking they lie before
 * input->end. A truncated multi-byte lead at end-of-input over-reads.
 *
 * Non-crashing predicate: `end = buf + len` is the input->end (snapend) analog. Scan the shared
 * buffer as the decoder advances, and `return 1` where the original would read a continuation byte
 * past `end` (the crash sink) — no real out-of-bounds access. Every safe exit returns 0.
 */
int predicate_18(const unsigned char *buf, unsigned int len) {
    const unsigned char *end = buf + len;
    const unsigned char *cur = buf;
    while (cur < end) {
        unsigned int c = cur[0];
        if (c < 0x80) { cur += 1; continue; }              /* ASCII: single byte           */
        int seqlen = (c < 0xE0) ? 2 : (c < 0xF0) ? 3 : 4;  /* lead-byte class -> 2/3/4 bytes */
        if (cur + seqlen > end) return 1;                  /* SINK: cur[1..seqlen-1] past end */
        cur += seqlen;
    }
    return 0;
}
