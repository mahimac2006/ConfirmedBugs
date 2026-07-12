/* predicate_11 — tcpdump-4.9.2 bug 11: dvmrp_print cursor-lookahead missing bytes check (CWE-125)
 * Sink: `type = bp[1];` at print-dvmrp.c:80 (harness line 57 / ASan line 75).
 * The real code checks `if (bp >= ep) return;` (guards bp[0] only) but the original
 * ND_TCHECK(bp[1]) is missing in the sliced vulnerable code, so bp[1] over-reads when
 * exactly 1 byte remains (driver: len=1, snapend=buf+1).
 */

typedef unsigned char u_char;
typedef unsigned int u_int;

int predicate_11(const unsigned char *buf, unsigned int len)
{
	const u_char *bp = buf;
	const u_char *ep = buf + len;      /* ndo_snapend analog / packet end */

	/* Recreate config the harness driver uses (ndo_vflag = 0). Not needed to reach
	 * the sink, which precedes the switch, but kept for fidelity. */
	int ndo_vflag = 0;
	(void)ndo_vflag;

	/* Original code: if (bp >= ep) return; — guards bp[0] only. */
	if (bp >= ep)
		return 0;

	/* Missing bounds check that caused the OOB: ND_TCHECK(bp[1]).
	 * Guard before the lookahead read of bp[1]. */
	if (bp + 2 > ep)
		return 0;

	/* type = bp[1];  <-- SAILOR_SINK_REACHED (over-read site). */
	(void)bp[1];
	return 1;
}
