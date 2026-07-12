// NO_HARNESS_TYPES
#include <stdlib.h>
#include <stdint.h>
#include <klee/klee.h>

typedef unsigned char u_char;

typedef struct netdissect_options {
    int ndo_vflag;
    const u_char *ndo_snapend;
} netdissect_options;

extern void bgp_print(netdissect_options *ndo, const u_char *dat, int length);

int main(void) {
    netdissect_options *ndo = (netdissect_options *)calloc(1, sizeof(*ndo));
    u_char *buf = (u_char *)calloc(1, 512);
    klee_make_symbolic(buf, 512, "buf");
    ndo->ndo_vflag = 1;
    ndo->ndo_snapend = buf + 512;
    bgp_print(ndo, buf, 512);
    return 0;
}
