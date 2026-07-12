#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <klee/klee.h>

typedef unsigned char u_char;
typedef unsigned int u_int;

typedef struct netdissect_options {
    const u_char *ndo_snapend;
    int ndo_vflag;
} netdissect_options;

#define ND_PRINT(x) do { } while (0)
#define ND_TCHECK(x) do { } while (0)

void dvmrp_print(netdissect_options *ndo,
                 register const u_char *bp, register u_int len)
{
    klee_warning_once("SPINE_PROBE:dvmrp_print:ENTRY");
    register const u_char *ep;
    register u_char type;

    ep = (const u_char *)ndo->ndo_snapend;
    if (bp >= ep)
        return;

    ND_TCHECK(bp[1]);
    type = bp[1];

    /* Skip IGMP header */
    bp += 8;
    len -= 8;

    switch (type) {
    case 0:
        klee_warning_once("SPINE_PROBE:dvmrp_print:CASE_0");
        ND_PRINT((ndo, " Probe"));
        if (ndo->ndo_vflag) {
            break;
        }
        break;
    case 1:
        klee_warning_once("SPINE_PROBE:dvmrp_print:CASE_1");
        ND_PRINT((ndo, " Report"));
        if (ndo->ndo_vflag > 1) {
            break;
        }
        break;
    default:
        break;
    klee_assert(0 && "SAILOR_SINK_REACHED");
    }
}
