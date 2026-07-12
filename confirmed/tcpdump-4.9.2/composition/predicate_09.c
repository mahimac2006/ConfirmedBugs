/*
 * predicate_09 — tcpdump-4.9.2 print-bgp.c out-of-bounds read (CWE-125)
 *
 * Bug:   bgp_print
 * Crash: print-bgp.c:2797 (bgp_print), ASan heap-buffer-overflow (READ of size 8).
 *
 * Faithful to harness/print-bgp.c: bgp_print scans the packet for the 16-byte
 * BGP marker (16 bytes of 0xff).  Inside the scan loop, as soon as a byte equals
 * 0xff it performs an unchecked "cursor lookahead":
 *
 *     while (p < ep) {
 *         if (p[0] != 0xff) { p++; continue; }
 *         if (memcmp(p, marker, sizeof(marker)) != 0) { p++; continue; }  // reads 16 bytes
 *         memcpy(&bgp, p, BGP_SIZE);                                      // reads 19 bytes
 *         ...
 *     }
 *
 * The only bounds guarantee is `p < ep`, i.e. p[0] is in bounds.  The
 * memcmp(p, marker, 16) reads 16 bytes ahead of the cursor with NO check that
 * 16 bytes remain before ep (the "cursor-lookahead-missing-bytes-check"), so
 * when p sits within 16 bytes of the packet end the read runs off the end.
 *
 * The driver reaches this with ndo_vflag = 1 and buf[0..3] = 0xff so the loop
 * enters the marker branch on the very first byte.  Here we replicate the loop,
 * add the missing guard before the 16-byte lookahead read, and return 1 exactly
 * when the sink (the unchecked lookahead read in bgp_print) is reached.
 */

typedef unsigned char u_char;
typedef unsigned int  u_int;

#ifndef BGP_SIZE
#define BGP_SIZE 19
#endif

/* copied from harness: the 16-byte BGP marker (all 0xff) */
static const u_char bgp_marker[16] = {
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
};

int predicate_09(const unsigned char *buf, unsigned int len)
{
    const u_char *bp = buf;          /* packet start                       */
    const u_char *ep = buf + len;    /* packet end (ndo_snapend analog)     */

    /* driver: ndo->ndo_vflag = 1 */
    int ndo_vflag = 1;

    const u_char *p = bp;

    /* SPINE_PROBE:bgp_print:ENTRY */
    if (ndo_vflag < 1)
        return 0;                    /* wrong config: not the vulnerable path */

    while (p < ep) {
        /* p[0] is in bounds because p < ep */
        if (p[0] != 0xff) {
            p++;
            continue;
        }

        /* memcmp(p, marker, sizeof(marker)) reads 16 bytes ahead of the cursor
         * with no check that 16 bytes remain before ep — the missing bytes
         * check (CWE-125).  Guard prevents the predicate from over-reading. */
        if (p + sizeof(bgp_marker) > ep)
            return 0;                /* too short: the over-read would occur  */

        /* SAILOR_SINK_REACHED: execution reached the unchecked 16-byte cursor
         * lookahead read (memcmp / then memcpy of BGP_SIZE) in bgp_print. */
        return 1;
    }

    return 0;                        /* scanned whole packet, marker branch never entered */
}
