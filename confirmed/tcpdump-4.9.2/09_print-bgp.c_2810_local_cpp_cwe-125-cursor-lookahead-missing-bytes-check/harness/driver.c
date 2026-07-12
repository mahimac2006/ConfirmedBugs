#include "harness_types.h"
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <klee/klee.h>

#ifndef BGP_SIZE
#define BGP_SIZE 19
#endif

void bgp_print(struct netdissect_options *ndo, const u_char *dat, int length);

int main(void) {
    struct netdissect_options *ndo = (struct netdissect_options *)calloc(1, sizeof(*ndo));
    u_char *buf = (u_char *)calloc(1, 64);
    int length = 64;

    if (!ndo || !buf) return 0;

    klee_make_symbolic(buf, length, "buf");
    buf[0] = 0xff;
    buf[1] = 0xff;
    buf[2] = 0xff;
    buf[3] = 0xff;

    ndo->ndo_vflag = 1;
    ndo->ndo_snapend = buf + length;

    bgp_print(ndo, buf, length);
    return 0;
}
