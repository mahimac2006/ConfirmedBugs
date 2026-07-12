#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <netdissect-stdinc.h>
#include <string.h>
#include "netdissect.h"
#include <klee/klee.h>

static int l_strnstart(netdissect_options *ndo, const char *tstr1, u_int tl1,
    const char *str2, u_int l2)
{
    klee_warning_once("SPINE_PROBE:l_strnstart:ENTRY");
    if (!ND_TTEST2(*str2, tl1)) return 0;
    if (tl1 > l2) return 0;
    klee_assert(0 && "SAILOR_SINK_REACHED");
    return (strncmp(tstr1, str2, tl1) == 0 ? 1 : 0);
}

void beep_print(netdissect_options *ndo, const u_char *bp, u_int length)
{
    klee_warning_once("SPINE_PROBE:beep_print:ENTRY");
    if (l_strnstart(ndo, "MSG", 4, (const char *)bp, length))
        ND_PRINT((ndo, " BEEP MSG"));
    else if (l_strnstart(ndo, "RPY ", 4, (const char *)bp, length))
        ND_PRINT((ndo, " BEEP RPY"));
    else if (l_strnstart(ndo, "ERR ", 4, (const char *)bp, length))
        ND_PRINT((ndo, " BEEP ERR"));
    else if (l_strnstart(ndo, "ANS ", 4, (const char *)bp, length))
        ND_PRINT((ndo, " BEEP ANS"));
    else if (l_strnstart(ndo, "NUL ", 4, (const char *)bp, length))
        ND_PRINT((ndo, " BEEP NUL"));
    else if (l_strnstart(ndo, "SEQ ", 4, (const char *)bp, length))
        ND_PRINT((ndo, " BEEP SEQ"));
    else if (l_strnstart(ndo, "END", 4, (const char *)bp, length))
        ND_PRINT((ndo, " BEEP END"));
    else
        ND_PRINT((ndo, " BEEP (payload or undecoded)"));
}
