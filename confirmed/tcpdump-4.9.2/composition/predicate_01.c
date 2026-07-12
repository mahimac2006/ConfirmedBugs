/*
 * predicate_01 — tcpdump-4.9.2 print-802_11.c heap-buffer-overflow (CWE-120)
 *
 * Bug:   ieee802_11_if_print -> ieee802_11_print -> parse_elements
 * Crash: print-802_11.c:2140, ASan heap-buffer-overflow, READ of size 4.
 *
 * Faithful to harness/print-802_11.c: the vulnerable code is parse_elements()
 * with pbody->element == E_CF. It memcpy()s 2 bytes (then possibly 6 more)
 * from p+offset WITHOUT any bounds check against the packet end (snapend),
 * so it over-reads past the buffer. Here we add the missing guards and
 * return 1 exactly when the sink (SAILOR_SINK_REACHED) is reached.
 */

typedef unsigned char u_char;
typedef unsigned int  u_int;

/* copied from harness */
struct cf_t { unsigned char length; unsigned char count[6]; };

#ifndef E_CF
#define E_CF 1
#endif

int predicate_01(const unsigned char *buf, unsigned int len)
{
    const u_char *bp = buf;          /* packet start (p)                */
    const u_char *ep = buf + len;    /* packet end   (ndo_snapend)      */

    /* driver: ieee802_11_if_print(ndo, h, p) with h->len = len,
     * -> ieee802_11_print(p, len, ...) -> parse_elements(p, offset=0, len)
     * with pbody->element = E_CF.                                       */
    int   element = E_CF;
    int   offset  = 0;
    u_int length  = len;             /* length passed into parse_elements */

    struct cf_t cf;

    /* SPINE_PROBE:parse_elements:ENTRY */
    switch (element) {
    default:
        break;

    case E_CF:
        /* SPINE_PROBE:parse_elements:CASE_E_CF */

        /* memcpy(&cf, p + offset, 2) — reads 2 bytes at p+offset with no
         * bounds check in the real code. Guard before the over-read. */
        if (bp + offset + 2 > ep)
            return 0;                /* too short: vulnerable path not reached */
        cf.length   = bp[offset + 0];
        cf.count[0] = bp[offset + 1];
        offset += 2;
        length -= 2;

        if (cf.length != 6) {
            offset += cf.length;
            length -= cf.length;
            break;
        }

        /* memcpy(&cf.count, p + offset, 6) — reads 6 bytes at p+offset with
         * no bounds check in the real code. Guard before the over-read. */
        if (bp + offset + 6 > ep)
            return 0;                /* too short: vulnerable path not reached */
        cf.count[0] = bp[offset + 0];
        cf.count[1] = bp[offset + 1];
        cf.count[2] = bp[offset + 2];
        cf.count[3] = bp[offset + 3];
        cf.count[4] = bp[offset + 4];
        cf.count[5] = bp[offset + 5];
        offset += 6;
        length -= 6;
        break;
    }

    /* SAILOR_SINK_REACHED: execution reached the vulnerable sink. */
    return 1;
}
