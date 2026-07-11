/* Bug 22 — xmlSwitchInputEncodingInt (parserInternals.c:1124, libxml2 2.10.4), over-read root cause.
 *
 * Real logic: when xmlCharEncInput() reports a conversion failure (nbchars < 0), the function logs
 * an error and `return(-1)` but does NOT call xmlHaltParser(ctxt). The parser keeps consuming input
 * and later over-reads (observed downstream as bug 20). The trigger is an input that selects a
 * multi-byte encoding (a UTF-16/UCS byte-order mark) and then fails to convert cleanly.
 *
 * Non-crashing predicate: model the failing conversion. An input opening with a UTF-16 BOM byte
 * (0xFE/0xFF) selects a 2-byte encoding; a malformed raw length (odd number of bytes) makes
 * xmlCharEncInput return < 0. Return 1 on that failure path (parser left un-halted). This is the
 * most abstracted of the five: it models the conversion outcome rather than replicating the converter.
 */
int predicate_22(const unsigned char *buf, unsigned int len) {
    if (len < 1) return 0;
    unsigned char c0 = buf[0];
    if (c0 != 0xFE && c0 != 0xFF) return 0;    /* no UTF-16 BOM -> no encoding switch attempted  */
    if ((len % 2) == 1) return 1;              /* SINK: malformed 2-byte input -> nbchars<0, not halted */
    return 0;
}
