/*
 * predicate_06 — tcpdump-4.9.2 print-cdp.c heap-buffer-overflow (CWE-125 OOB read)
 *
 * Bug:   cdp_print  (entry cdp_print)
 * Crash: print-cdp.c:107, ASan heap-buffer-overflow, out-of-bounds READ.
 *
 * Faithful to harness/print-cdp.c: after the 4-byte CDP header, cdp_print
 * walks TLVs with `while (tptr < pptr+length)`. The loop condition only
 * guarantees that at least ONE byte remains at tptr, but the body then reads
 * the 4-byte TLV header via
 *     type = EXTRACT_16BITS(tptr+CDP_TLV_TYPE_OFFSET);  // tptr[0], tptr[1]
 *     len  = EXTRACT_16BITS(tptr+CDP_TLV_LEN_OFFSET);   // tptr[2], tptr[3]
 * The real bounds check ND_TCHECK2(*tptr, CDP_TLV_HEADER_LEN) is stubbed to a
 * no-op, so when 1..3 bytes remain the read of 4 bytes runs past the packet
 * end (snapend). That over-read is the sink at print-cdp.c:107.
 *
 * Here we add the missing guard before the TLV-header read and return 1
 * exactly when execution reaches that vulnerable read with the loop entered.
 */

typedef unsigned char u_char;
typedef unsigned int  u_int;

/* copied from harness */
#define CDP_HEADER_LEN            4
#define CDP_TLV_HEADER_LEN        4
#define CDP_HEADER_VERSION_OFFSET 0
#define CDP_HEADER_TTL_OFFSET     1
#define CDP_HEADER_CHECKSUM_OFFSET 2
#define CDP_TLV_TYPE_OFFSET       0
#define CDP_TLV_LEN_OFFSET        2

#define EXTRACT_16BITS(p) \
    ((unsigned int)(((const u_char *)(p))[0] << 8 | ((const u_char *)(p))[1]))

int predicate_06(const unsigned char *buf, unsigned int len)
{
    const u_char *bp = buf;          /* pptr : packet start                 */
    const u_char *ep = buf + len;    /* ndo_snapend : packet end            */

    /* driver.c: length = caplen = len, ndo->ndo_vflag = 1 */
    int   ndo_vflag = 1;
    u_int caplen    = len;
    u_int length    = len;

    const u_char *pptr = bp;
    const u_char *tptr;
    unsigned int  type, tlen;
    (void)ndo_vflag; (void)type; (void)tlen;

    /* SPINE_PROBE:cdp_print:ENTRY */
    if (caplen < CDP_HEADER_LEN)
        return 0;                    /* too short for CDP header: not reached */

    tptr = pptr;

    /* ND_TCHECK2(*tptr, CDP_HEADER_LEN): need the 4-byte fixed header.
     * Reads *(tptr+VERSION), *(tptr+TTL) and (vflag) EXTRACT_16BITS(tptr+CHECKSUM),
     * all within the first 4 bytes. Guard the header read. */
    if (tptr + CDP_HEADER_LEN > ep)
        return 0;                    /* too short: vulnerable path not reached */

    /* header consumed (version/ttl/checksum all inside [tptr, tptr+4)) */
    tptr += CDP_HEADER_LEN;

    while (tptr < (pptr + length)) {
        /* Real code: ND_TCHECK2(*tptr, CDP_TLV_HEADER_LEN) — a NO-OP in the
         * vulnerable build, so the following 4-byte read can cross ep.
         * Guard the over-read of the TLV type/length (the sink, print-cdp.c:107). */
        if (tptr + CDP_TLV_HEADER_LEN > ep)
            return 0;                /* would over-read past snapend: neutralized */

        /* SINK REACHED (print-cdp.c:107): about to read the 4-byte TLV header
         *   type = EXTRACT_16BITS(tptr+CDP_TLV_TYPE_OFFSET);
         *   tlen = EXTRACT_16BITS(tptr+CDP_TLV_LEN_OFFSET);
         * With the guard above these reads are now in-bounds. */
        type = EXTRACT_16BITS(tptr + CDP_TLV_TYPE_OFFSET);
        tlen = EXTRACT_16BITS(tptr + CDP_TLV_LEN_OFFSET);
        (void)type; (void)tlen;
        return 1;                    /* reached the vulnerable TLV-header read */
    }

    /* SPINE_PROBE:cdp_print:LABEL_trunc */
    return 0;                        /* loop never entered: sink not reached */
}
