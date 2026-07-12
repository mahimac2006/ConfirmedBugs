#include "harness_types.h"
#include <stdlib.h>
#include <string.h>
#include <klee/klee.h>

extern void cdp_print(netdissect_options *ndo, const u_char *pptr, u_int length, u_int caplen);

int main(void) {
    netdissect_options *ndo = (netdissect_options *)calloc(1, sizeof(*ndo));
    u_char *buf = (u_char *)calloc(64, 1);
    u_int length = 64;
    u_int caplen = 64;

    ndo->ndo_vflag = 1;

    klee_make_symbolic(buf, 64, "buf");
    buf[0] = 0x00;
    buf[1] = 0x00;
    buf[2] = 0x00;
    buf[3] = 0x10;

    cdp_print(ndo, buf, length, caplen);
    return 0;
}
