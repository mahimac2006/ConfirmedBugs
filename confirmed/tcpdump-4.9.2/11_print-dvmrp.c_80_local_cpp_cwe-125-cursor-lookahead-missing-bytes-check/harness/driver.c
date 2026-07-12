#include "harness_types.h"
#include <stdlib.h>
#include <string.h>
#include <klee/klee.h>

extern void dvmrp_print(netdissect_options *ndo, const u_char *bp, u_int len);

int main(void) {
    netdissect_options *ndo = (netdissect_options *)calloc(1, sizeof(netdissect_options));
    u_char *buf = (u_char *)calloc(1, sizeof(u_char));
    u_char *snap = buf + 1;

    klee_make_symbolic(buf, 1, "buf");

    ndo->ndo_snapend = snap;
    ndo->ndo_vflag = 0;

    dvmrp_print(ndo, buf, 1);
    return 0;
}
