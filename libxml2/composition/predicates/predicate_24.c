/* Bug 24 — xmlParseTryOrFinish (parser.c:12168, libxml2 2.10.4), heap-buffer-overflow READ.
 *
 * Real logic: on an invalid character the parser jumps to the `encoding_error:` label and builds a
 * diagnostic string with
 *     snprintf(buffer, 150, "Bytes: 0x%02X 0x%02X 0x%02X 0x%02X\n",
 *              ctxt->input->cur[0], ctxt->input->cur[1],
 *              ctxt->input->cur[2], ctxt->input->cur[3]);
 * WITHOUT first checking that at least 4 bytes remain before input->end. If the invalid byte lands
 * within 3 bytes of end, cur[1..3] over-read.
 *
 * Non-crashing predicate: `end = buf + len`. Scan to the first invalid byte (here modelled as any
 * byte >= 0x80, which fails the ASCII/UTF-8 validity check and triggers `goto encoding_error`); if
 * fewer than 4 bytes remain from that byte, return 1 (the diagnostic snprintf over-reads).
 */
int predicate_24(const unsigned char *buf, unsigned int len) {
    const unsigned char *end = buf + len;
    const unsigned char *cur = buf;
    while (cur < end) {
        unsigned int c = cur[0];
        if (c >= 0x80) {                       /* invalid char -> goto encoding_error           */
            if (end - cur < 4) return 1;       /* SINK: cur[1..3] read past end in the snprintf */
            return 0;                          /* >= 4 bytes remain: diagnostic stays in bounds  */
        }
        cur += 1;
    }
    return 0;
}
