/*
 * predicate_02 — tcpdump-4.9.2 print-802_11.c heap-buffer-overflow (CWE-120)
 *
 * Bug:   ieee802_11_if_print -> ieee802_11_print -> mgmt_body_print
 *          -> handle_beacon -> parse_elements
 * Crash: ASan heap-buffer-overflow, READ of size N in ieee802_11_print /
 *        parse_elements. bug_report.json crash_line 2059; the harness line_map
 *        pins the real over-read to print-802_11.c:1180, which is the harness's
 *          memcpy(tim.bitmap, p + offset, tim.length - 3);
 *        (harness/print-802_11.c line 99, the SAILOR sink).
 *
 * Faithful to harness/print-802_11.c: parse_elements() walks the beacon element
 * list. For a TIM element (id == 5) it reads a 2-byte header, then a 3-byte
 * count, then copies (tim.length - 3) bytes into tim.bitmap[256] straight from
 * p+offset, all WITHOUT bounds-checking p+offset against the packet end
 * (snapend). The bitmap copy over-reads past the buffer -> heap overflow.
 *
 * Here we recreate that control flow exactly, add the missing "before the read"
 * guards on every input read, and return 1 exactly when execution reaches the
 * over-reading sink (the tim.bitmap memcpy). Every other exit returns 0.
 */

typedef unsigned char u_char;
typedef unsigned int  u_int;

/* copied verbatim from harness/print-802_11.c */
struct tim_t {
    u_char id;
    u_char length;
    u_char count;
    u_char period;
    u_char bitmap[256];
};

int predicate_02(const unsigned char *buf, unsigned int len)
{
    const u_char *bp = buf;          /* packet start (p)            */
    const u_char *ep = buf + len;    /* packet end   (ndo_snapend)  */

    /* driver: ieee802_11_if_print(ndo, h, p) with h->len = h->caplen = len,
     * -> ieee802_11_print(p, len, ...) -> mgmt_body_print -> handle_beacon
     * -> parse_elements(ndo, &body, p, offset = 0, length = len).       */
    int   offset  = 0;
    u_int length  = len;
    u_int elementlen;
    struct tim_t tim;

    /* SPINE_PROBE:parse_elements:ENTRY */
    while (length > 0) {

        /* switch (*(p + offset)) — reads 1 byte at p+offset with no bounds
         * check in the real code. Guard before the over-read. */
        if (bp + offset + 1 > ep)
            return 0;                /* too short: vulnerable path not reached */

        switch (bp[offset]) {
        default:
            /* Slice leaves elementlen uninitialized; the real tcpdump code
             * derives the advance from the element's length byte. Model it as
             * that length byte (guarded) so the walk stays deterministic and
             * never performs an out-of-bounds read. */
            if (bp + offset + 2 > ep)
                return 0;
            elementlen = bp[offset + 1];
            offset += 2 + (int)elementlen;
            length -= 2 + elementlen;
            break;

        case 5:
            /* SPINE_PROBE:parse_elements:CASE_5 */

            /* memcpy(&tim, p + offset, 2) — 2-byte read, no bounds check. */
            if (bp + offset + 2 > ep)
                return 0;            /* too short: vulnerable path not reached */
            tim.id     = bp[offset + 0];
            tim.length = bp[offset + 1];
            offset += 2;
            length -= 2;

            if (tim.length <= 3) {
                offset += tim.length;
                length -= tim.length;
                break;
            }

            if (tim.length - 3 > (int)sizeof tim.bitmap)
                return 0;

            /* memcpy(&tim.count, p + offset, 3) — 3-byte read, no bounds
             * check. Guard before the over-read. */
            if (bp + offset + 3 > ep)
                return 0;            /* too short: vulnerable path not reached */
            offset += 3;
            length -= 3;

            /* SAILOR_SINK_REACHED (print-802_11.c:1180):
             *   memcpy(tim.bitmap, p + offset, tim.length - 3);
             * This copies tim.length-3 bytes from p+offset with no bounds
             * check against ep -> the heap-buffer-overflow READ. Reaching this
             * site is the bug. */
            return 1;
        }
    }

    /* Element walk consumed all bytes without reaching the TIM bitmap sink. */
    return 0;
}
