/*
 * predicate_05 — tcpdump-4.9.2 print-beep.c out-of-bounds read (CWE-125)
 *
 * Bug:   beep_print -> l_strnstart
 * Crash: print-beep.c:67, ASan heap-buffer-overflow, oob-read.
 *
 * Faithful to harness/print-beep.c: beep_print() tries a set of fixed
 * 4-byte protocol prefixes by calling l_strnstart(tstr1, tl1=4, str2=bp, l2=len).
 * The vulnerable sink (SAILOR_SINK_REACHED) is the strncmp(tstr1, str2, tl1)
 * that reads tl1 bytes from str2 (== bp). The guards in l_strnstart are:
 *   - ND_TTEST2(*str2, tl1): str2 must have tl1 captured bytes before snapend
 *     (modelled here as str2 + tl1 <= ep).
 *   - tl1 > l2: claimed length must be at least tl1.
 * We add the missing/real bounds guard before the read and return 1 exactly
 * when the sink (the strncmp read of tl1 bytes) is reached.
 */

typedef unsigned char u_char;
typedef unsigned int  u_int;

/*
 * l_strnstart from the harness. Returns 1 iff execution reaches the
 * strncmp sink (i.e. the vulnerable tl1-byte read of str2 would occur);
 * returns 0 on every guarded early exit (no real over-read performed).
 */
static int l_strnstart_reaches(const char *tstr1, u_int tl1,
                               const u_char *str2, u_int l2,
                               const u_char *ep)
{
    /* SPINE_PROBE:l_strnstart:ENTRY */

    /* ND_TTEST2(*str2, tl1): need tl1 captured bytes at str2, i.e.
     * str2 + tl1 <= snapend(ep). Guard the read that would cross ep. */
    if (str2 + tl1 > ep)
        return 0;                /* not enough captured bytes: no over-read */

    /* tl1 > l2: claimed on-the-wire length too short for the prefix. */
    if (tl1 > l2)
        return 0;

    /* SAILOR_SINK_REACHED: strncmp(tstr1, str2, tl1) reads tl1 bytes of str2. */
    (void)tstr1;
    return 1;
}

int predicate_05(const unsigned char *buf, unsigned int len)
{
    const u_char *bp = buf;          /* packet start (bp)          */
    const u_char *ep = buf + len;    /* packet end   (ndo_snapend) */

    /* SPINE_PROBE:beep_print:ENTRY
     * beep_print tries each 4-byte prefix in turn; each call uses tl1 = 4.
     * Reaching the strncmp sink in any call means the vulnerable read site
     * was reached. */
    if (l_strnstart_reaches("MSG",  4, bp, len, ep)) return 1;
    if (l_strnstart_reaches("RPY ", 4, bp, len, ep)) return 1;
    if (l_strnstart_reaches("ERR ", 4, bp, len, ep)) return 1;
    if (l_strnstart_reaches("ANS ", 4, bp, len, ep)) return 1;
    if (l_strnstart_reaches("NUL ", 4, bp, len, ep)) return 1;
    if (l_strnstart_reaches("SEQ ", 4, bp, len, ep)) return 1;
    if (l_strnstart_reaches("END",  4, bp, len, ep)) return 1;

    return 0;                        /* no prefix reached the sink */
}
