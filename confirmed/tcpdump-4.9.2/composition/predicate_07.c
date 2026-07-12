/*
 * predicate_07 — tcpdump-4.9.2 print-cip.c heap-buffer-overflow (CWE-125 OOB read)
 *
 * Bug:   cip_if_print / cip_print  (crash reported at print-cip.c:50, ASan
 *        heap-buffer-overflow, READ of size 8).
 * Crash: reached via cip_if_print. The driver hands cip_if_print a packet
 *        buffer of only 4 real bytes (malloc(4)) while claiming caplen = 6 and
 *        length = 6.
 *
 * Faithful to harness/print-cip.c: cip_if_print() computes
 *     cmplen = sizeof(rfcllc) (== 6), then clamps cmplen down to caplen and to
 *     length (both 6 from the driver), so cmplen stays 6. It then executes
 *     memcmp(rfcllc, p, cmplen);   // reads cmplen (6) bytes at p
 * with NO check that the actual captured buffer holds cmplen bytes. Because the
 * real buffer is shorter than the claimed caplen, this memcmp over-reads past
 * the buffer end -> heap over-read. Here we add the missing guard and return 1
 * exactly when the vulnerable sink (the unchecked memcmp read of `p`) is
 * reached with enough bytes in bounds. The driver sets ndo_eflag = 0, so the
 * cip_print() branch is not taken on this path.
 */

typedef unsigned char u_char;
typedef unsigned int  u_int;

int predicate_07(const unsigned char *buf, unsigned int len)
{
    const u_char *p  = buf;          /* packet cursor (p)                */
    const u_char *ep = buf + len;    /* packet end   (ndo_snapend / ep)  */

    /* driver config: ndo_eflag = 0, ndo_suppress_default_print = 1 */
    int ndo_eflag = 0;
    int ndo_suppress_default_print = 1;
    (void)ndo_suppress_default_print;

    /* driver metadata: h->caplen = 6, h->len = 6 (claimed lengths) */
    u_int caplen = 6;
    u_int length = 6;

    /* rfcllc marker, copied from harness ("\xAA\xAA\x03\x00\x00\x00"). */
    static const u_char rfcllc[6] = { 0xAA, 0xAA, 0x03, 0x00, 0x00, 0x00 };

    unsigned int cmplen;
    int llc_hdrlen;

    /* SPINE_PROBE:cip_if_print:ENTRY */
    cmplen = (unsigned int)sizeof(rfcllc);   /* 6 */
    if (cmplen > caplen)
        cmplen = caplen;
    if (cmplen > length)
        cmplen = length;

    if (ndo_eflag) {
        /* cip_print(ndo, length) — not taken with ndo_eflag == 0 */
    }

    if (cmplen == 0) {
        /* ND_PRINT("[|cip]"); real code returns 0 here. */
        return 0;                    /* nothing compared: sink not reached */
    }

    /* memcmp(rfcllc, p, cmplen) — reads cmplen bytes at p with NO bounds
     * check that the actual buffer holds cmplen bytes.  Guard the over-read. */
    if (p + cmplen > ep)
        return 0;                    /* too short: over-read avoided, sink not reached */

    /* model memcmp(rfcllc, p, cmplen): result selects branch but both branches
     * fall through to the SAILOR_SINK marker in the harness. */
    {
        unsigned int i;
        int equal = 1;
        for (i = 0; i < cmplen; i++) {
            if (p[i] != rfcllc[i]) { equal = 0; break; }
        }
        if (equal) {
            /* LLC header present: llc_print()/default-print path */
            llc_hdrlen = 0;
        } else {
            /* LLC header absent: ip_print() path */
            llc_hdrlen = 0;
        }
    }
    (void)llc_hdrlen;

    /* SAILOR_SINK_REACHED: execution reached the unchecked memcmp read of `p`
     * (the vulnerable sink in cip_if_print). */
    return 1;
}
