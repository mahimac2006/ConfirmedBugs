/*
 * predicate_10 — tcpdump-4.9.2 print-dvmrp.c heap-buffer-overflow (CWE-125)
 *
 * Bug:   dvmrp_print
 * Crash: print-dvmrp.c:75, ASan heap-buffer-overflow, READ.
 *        CWE-125 cursor-lookahead-missing-bytes-check.
 *
 * This is the canonical dvmrp example. Faithful to harness/print-dvmrp.c:
 * dvmrp_print() only checks `if (bp >= ep) return;` which guards bp[0], then
 * immediately does the lookahead read `type = bp[1]` (the ND_TCHECK(bp[1])
 * bounds check is stubbed to a no-op in the harness, so the real code reads
 * bp[1] with NO effective bounds check). With a 1-byte packet (driver:
 * ndo_snapend = buf + 1), bp[1] over-reads one byte past the buffer end.
 *
 * driver.c: ndo_vflag = 2, ndo_snapend = buf + len, dvmrp_print(ndo, buf, len).
 *
 * Here we add the missing "before the read" guard on the bp[1] lookahead and
 * return 1 exactly when execution reaches the over-reading sink. Every other
 * exit returns 0.
 */

typedef unsigned char u_char;
typedef unsigned int  u_int;

int predicate_10(const unsigned char *buf, unsigned int len)
{
    const u_char *bp = buf;          /* packet start                    */
    const u_char *ep = buf + len;    /* packet end (ndo_snapend analog)  */

    /* driver: ndo_vflag = 2 */
    int ndo_vflag = 2;
    (void)ndo_vflag;

    u_char type;

    /* SPINE_PROBE:dvmrp_print:ENTRY */

    /* Original guard only covers bp[0]. */
    if (bp >= ep)
        return 0;                    /* too short: bp[0] itself OOB      */

    /* Sink: `type = bp[1]` (the lookahead read at print-dvmrp.c:75).
     * The real code performs this read WITHOUT a valid bounds check on
     * bp[1]. Insert the missing guard before the over-read. */
    if (bp + 2 > ep)
        return 0;                    /* too short: vulnerable path not reached */

    type = bp[1];                    /* SAILOR_SINK_REACHED */
    (void)type;

    return 1;                        /* reached the lookahead sink        */
}
