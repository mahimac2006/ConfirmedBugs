/*
 * predicate_03 — tcpdump-4.9.2 print-bgp.c heap-buffer-overflow (CWE-120)
 *
 * Bug:   bgp_print
 * Crash: print-bgp.c:2797, ASan heap-buffer-overflow, READ of size 8.
 *
 * Faithful to harness/print-bgp.c: bgp_print() scans the packet for the
 * 16-byte BGP marker (all 0xff). The loop only checks `p < ep` (1 byte in
 * bounds) before executing:
 *     memcmp(p, marker, sizeof(marker));   // reads 16 bytes at p
 *     memcpy(&bgp, p, BGP_SIZE);           // reads 19 bytes at p
 * Neither read is bounds-checked against ep (ndo_snapend), so when a 0xff
 * byte sits near the packet end the reads run past the buffer -> heap
 * over-read (bgp_print). Here we add the missing guards and return 1 exactly
 * when the vulnerable sink (the unchecked memcpy of BGP_SIZE bytes) is reached.
 */

typedef unsigned char u_char;
typedef unsigned int  u_int;

#ifndef BGP_SIZE
#define BGP_SIZE 19
#endif

int predicate_03(const unsigned char *buf, unsigned int len)
{
    const u_char *p  = buf;          /* packet cursor (p / dat)          */
    const u_char *ep = buf + len;    /* packet end   (ndo_snapend / ep)  */

    /* driver: ndo_vflag = 1; not consulted on the sliced sink path. */
    int ndo_vflag = 1;
    (void)ndo_vflag;

    /* 16-byte BGP marker, copied from harness. */
    static const u_char marker[] = {
        0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
        0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
    };
    const unsigned int marker_len = (unsigned int)sizeof(marker);

    /* SPINE_PROBE:bgp_print:ENTRY */
    while (p < ep) {
        /* p[0] read — the while() already guarantees p < ep. */
        if (p[0] != 0xff) {
            p++;
            continue;
        }

        /* memcmp(p, marker, sizeof(marker)) — 16-byte read with NO bounds
         * check in the real code. Guard before the over-read. */
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

        /* memcpy(&bgp, p, BGP_SIZE) — 19-byte read with NO bounds check in
         * the real code. Guard before the over-read. */
        if (p + BGP_SIZE > ep)
            return 0;                /* too short: vulnerable path not reached */

        /* SAILOR_SINK_REACHED: execution reached the unchecked BGP_SIZE
         * memcpy — the vulnerable sink in bgp_print. */
        return 1;
    }

    return 0;                        /* scanned whole packet, no sink reached */
}
