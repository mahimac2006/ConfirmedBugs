#include "harness_types.h"
#include <stdlib.h>
#include <klee/klee.h>

int main(void) {
    netdissect_options *ndo = (netdissect_options *)calloc(1, sizeof(*ndo));
    u_char *buf = (u_char *)malloc(1);
    klee_make_symbolic(buf, 1, "buf");

    ndo->ndo_snapend = buf + 1;
    ndo->ndo_vflag = 2;

    dvmrp_print(ndo, buf, 1);
    return 0;
}
