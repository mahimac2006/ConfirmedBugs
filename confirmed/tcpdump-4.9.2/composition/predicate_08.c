/*
 * predicate_08 — tcpdump-4.9.2 print-babel.c out-of-bounds read (CWE-125)
 *
 * Bug:   babel_print -> babel_print_v2 -> format_prefix
 * Crash: print-babel.c:127, format_prefix, ASan heap-buffer-overflow (READ).
 *
 * Faithful to harness/print-babel.c: format_prefix(ndo, prefix, plen) reads
 * bytes from `prefix` with NO bounds check against the packet end (snapend):
 *   - if (plen >= 96 && memcmp(prefix, v4prefix, 12) == 0)
 *         ipaddr_string(ndo, prefix + 12)   -> reads prefix[0..15]  (12 + 4)
 *     else
 *         ip6addr_string(ndo, prefix)        -> reads prefix[0..15]  (16 bytes)
 * Either path dereferences up to 16 bytes starting at `prefix`, so when
 * `prefix` sits within 16 bytes of the packet end the read runs off the end.
 *
 * The driver reaches format_prefix through babel_print -> babel_print_v2 with
 * prefix = start of packet and plen = 0 (driver sets buf[0]=buf[1]=0), so the
 * `else` branch (ip6addr_string, a 16-byte read) is taken.  Here we add the
 * missing guard before that read and return 1 exactly when the sink
 * (SAILOR_SINK_REACHED at format_prefix) is reached.
 */

typedef unsigned char u_char;
typedef unsigned int  u_int;

/* copied from harness: the v4-mapped-IPv6 prefix format_prefix compares against */
static const unsigned char v4prefix[16] =
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xFF, 0xFF, 0, 0, 0, 0};

int predicate_08(const unsigned char *buf, unsigned int len)
{
    const u_char *bp = buf;          /* packet start                        */
    const u_char *ep = buf + len;    /* packet end (ndo_snapend analog)      */

    /* driver: babel_print(ndo, cp, length) -> babel_print_v2 -> format_prefix.
     * prefix points at the packet, plen comes from the packet (0 in driver). */
    const u_char *prefix = bp;
    unsigned char plen   = 0;        /* driver value (buf[0]=buf[1]=0)       */

    /* SPINE_PROBE:babel_print:ENTRY */
    /* SPINE_PROBE:babel_print_v2:ENTRY */
    /* SPINE_PROBE:format_prefix:ENTRY */

    if (plen >= 96) {
        /* memcmp(prefix, v4prefix, 12) reads prefix[0..11]; on match,
         * ipaddr_string(ndo, prefix + 12) reads prefix[12..15]. In both cases
         * up to 16 bytes from prefix are dereferenced with no bounds check. */
        if (prefix + 16 > ep)
            return 0;                /* too short: over-read would occur      */
        {
            int i, match = 1;
            for (i = 0; i < 12; i++)
                if (prefix[i] != v4prefix[i]) { match = 0; break; }
            (void)match;             /* ipaddr_string(prefix + 12): 4 bytes   */
        }
    } else {
        /* ip6addr_string(ndo, prefix) reads prefix[0..15] (16 bytes) with no
         * bounds check in the real code — this is the over-read site. */
        if (prefix + 16 > ep)
            return 0;                /* too short: over-read would occur      */
    }

    /* SAILOR_SINK_REACHED: execution reached the vulnerable read in
     * format_prefix (print-babel.c:127). */
    return 1;
}
