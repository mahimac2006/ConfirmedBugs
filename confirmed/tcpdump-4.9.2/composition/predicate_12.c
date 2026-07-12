/*
 * predicate_12 — tcpdump-4.9.2 print-802_11.c heap-buffer-overflow (CWE-125)
 *
 * Bug:   ieee802_11_if_print -> ieee802_11_print -> mgmt_body_print
 *        -> handle_action
 * Crash: print-802_11.c:2140, ASan heap-buffer-overflow, READ of size 4.
 *
 * Faithful to harness/print-802_11.c: handle_action() gates on the claimed
 * frame length (length < 2 => return) but then reads p[0] and p[1]
 * (ND_PRINT "Reserved(%d) Act#%d") WITHOUT any bounds check against the
 * packet end (ndo_snapend). When the claimed length says >= 2 bytes are
 * present but the captured buffer ends sooner, this is a cursor-lookahead
 * over-read (CWE-125). The klee_assert(0 && "SAILOR_SINK_REACHED") in the
 * slice sits immediately after that pair of reads.
 *
 * Here we add the missing lookahead guard and return 1 exactly when the
 * sink is reached (the two-byte read past snapend would otherwise occur).
 */

typedef unsigned char u_char;
typedef unsigned int  u_int;

/* driver.c: h->len = 4, h->caplen = 4; ieee802_11_if_print(ndo, h, p)
 *   -> ieee802_11_print(p, len, caplen, ...)
 *   -> mgmt_body_print(p, caplen)
 *   -> handle_action(p, length = caplen)
 * The length threaded down is caplen; the true captured end is ndo_snapend. */

int predicate_12(const unsigned char *buf, unsigned int len)
{
    const u_char *bp = buf;          /* packet start (p)          */
    const u_char *ep = buf + len;    /* packet end (ndo_snapend)  */

    u_int length = len;              /* caplen threaded into handle_action */

    /* SPINE_PROBE:ieee802_11_if_print:ENTRY */
    /* SPINE_PROBE:ieee802_11_print:ENTRY    */
    /* SPINE_PROBE:mgmt_body_print:ENTRY     */
    /* SPINE_PROBE:handle_action:ENTRY       */

    /* handle_action: if (length < 2) return 0; */
    if (length < 2)
        return 0;                    /* claimed frame too short: sink not reached */

    switch (0) {
    default:
        break;
    }

    /* ND_PRINT((ndo, "Reserved(%d) Act#%d", p[0], p[1])) reads p[0] and p[1]
     * with no check against snapend — the missing lookahead check. Guard the
     * two-byte read before it crosses ep. */
    if (bp + 2 > ep)
        return 0;                    /* would over-read past snapend: no real OOB */

    /* reads p[0], p[1] are now in-bounds; this is the SAILOR_SINK_REACHED site */
    (void)bp[0];
    (void)bp[1];
    return 1;                        /* sink reached */
}
