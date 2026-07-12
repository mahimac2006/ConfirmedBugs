/*
 * predicate_04 — tcpdump-4.9.2 print-bgp.c heap-buffer-overflow (CWE-120)
 *
 * Bug:   bgp_print
 * Crash: print-bgp.c:2797, ASan heap-buffer-overflow, READ of size 8.
 *
 * Faithful to harness/print-bgp.c. bgp_print() scans the packet for the
 * 16-byte BGP marker (all 0xff), copies a BGP header, and if hlen >= BGP_SIZE
 * descends the spine call chain:
 *     bgp_print -> bgp_header_print -> bgp_update_print -> bgp_attr_print
 *              -> decode_labeled_prefix6(ndo, p + 19, hlen - 19, ...)
 * decode_labeled_prefix6() then reads:
 *     plen      = pptr[0];                 // pptr = p + 19
 *     plen     -= 24;                      // u_int underflow if pptr[0] < 24
 *     plenbytes = (plen + 7) / 8;
 *     memcpy(&addr, &pptr[4], plenbytes);  // OOB read past ep (the sink)
 *     ... pptr[1], pptr[2], pptr[3] ...    // snprintf reads
 * None of these reads is bounds-checked against ep (ndo_snapend), which is
 * the heap over-read. Here we add the missing guards and return 1 exactly
 * when the vulnerable sink (SAILOR_SINK_REACHED in decode_labeled_prefix6)
 * is reached with every read in bounds.
 */

typedef unsigned char u_char;
typedef unsigned int  u_int;

#ifndef BGP_SIZE
#define BGP_SIZE 19
#endif

int predicate_04(const unsigned char *buf, unsigned int len)
{
    const u_char *dat = buf;         /* packet start (dat)               */
    const u_char *ep  = buf + len;   /* packet end   (ndo_snapend / ep)  */

    /* driver.c: ndo->ndo_vflag = 1; ndo->ndo_snapend = buf + len. */
    int ndo_vflag = 1;

    /* 16-byte BGP marker, copied from harness. */
    static const u_char marker[] = {
        0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
        0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
    };
    const u_int marker_len = (u_int)sizeof(marker);

    /* SPINE_PROBE:bgp_print:ENTRY */
    if (ndo_vflag < 1)
        return 0;

    const u_char *p = dat;

    while (p < ep) {
        /* p[0] read — the while() already guarantees p < ep. */
        if (p[0] != 0xff) {
            p++;
            continue;
        }

        /* memcmp(p, marker, sizeof(marker)) — 16-byte read, NO bounds check
         * in the real code. Guard before the over-read. */
        if (p + marker_len > ep)
            return 0;                /* too short: vulnerable path not reached */

        /* model memcmp(p, marker, sizeof(marker)) != 0 */
        {
            u_int i;
            int mismatch = 0;
            for (i = 0; i < marker_len; i++) {
                if (p[i] != marker[i]) { mismatch = 1; break; }
            }
            if (mismatch) {
                p++;
                continue;
            }
        }

        /* memcpy(&bgp, p, BGP_SIZE) — 19-byte read, NO bounds check in the
         * real code (reads bgp_len at p[16..17]). Guard before the over-read. */
        if (p + BGP_SIZE > ep)
            return 0;                /* too short: vulnerable path not reached */

        /* hlen = ntohs(bgp.bgp_len); bgp_len is bytes p[16..17], big-endian. */
        u_int hlen = ((u_int)p[16] << 8) | (u_int)p[17];
        if (hlen < BGP_SIZE)
            break;                   /* short header: loop terminates, no sink */

        /* Spine chain: bgp_header_print -> ... ->
         *     decode_labeled_prefix6(ndo, p + 19, hlen - 19, buf, sizeof(buf))
         * SPINE_PROBE:decode_labeled_prefix6:ENTRY */
        const u_char *pptr = p + BGP_SIZE;   /* p + 19 */

        /* plen = pptr[0];  — read of pptr[0], NO bounds check. */
        if (pptr + 1 > ep)
            return 0;                /* too short: sink not reached */
        u_int plen = pptr[0];
        plen -= 24;                  /* u_int; underflows to huge if pptr[0] < 24 */

        u_int plenbytes = (plen + 7) / 8;

        /* snprintf() reads pptr[1], pptr[2], pptr[3]. Guard pptr[1..3]. */
        if (pptr + 4 > ep)
            return 0;                /* too short: sink not reached */

        /* memcpy(&addr, &pptr[4], plenbytes) — the OOB read (the sink).
         * &pptr[4] must be in bounds and plenbytes bytes must fit before ep.
         * Length-based comparison avoids pointer overflow when plenbytes is
         * huge (from the plen underflow). */
        if (pptr + 4 > ep)
            return 0;
        if (plenbytes > (u_int)(ep - (pptr + 4)))
            return 0;                /* would over-read: real crash avoided */

        /* SAILOR_SINK_REACHED: execution reached the vulnerable
         * decode_labeled_prefix6 read path with all accesses in bounds. */
        return 1;
    }

    return 0;                        /* scanned whole packet, no sink reached */
}
