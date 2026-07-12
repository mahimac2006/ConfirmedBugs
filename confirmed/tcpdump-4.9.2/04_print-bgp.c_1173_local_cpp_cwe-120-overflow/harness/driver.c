#include "harness_types.h"
#include <klee/klee.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

extern void bgp_print(netdissect_options *ndo, const u_char *dat, int length);

int main(void) {
    netdissect_options *ndo = (netdissect_options *)calloc(1, sizeof(netdissect_options));
    if (!ndo) return 0;

    ndo->ndo_vflag = 1;

    int len = 64;
    u_char *buf = (u_char *)calloc(1, len);
    if (!buf) return 0;
    klee_make_symbolic(buf, len, "bgp_input");

    buf[0] = 0xff; buf[1] = 0xff; buf[2] = 0xff; buf[3] = 0xff;
    buf[4] = 0xff; buf[5] = 0xff; buf[6] = 0xff; buf[7] = 0xff;
    buf[8] = 0xff; buf[9] = 0xff; buf[10] = 0xff; buf[11] = 0xff;
    buf[12] = 0xff; buf[13] = 0xff; buf[14] = 0xff; buf[15] = 0xff;
    buf[16] = 0x00;
    buf[17] = 0x20;
    buf[18] = 0x02;
    buf[19] = 0x18;
    buf[20] = 0x00;
    buf[21] = 0x00;
    buf[22] = 0x01;

    ndo->ndo_snapend = buf + len;
    bgp_print(ndo, buf, len);
    return 0;
}
