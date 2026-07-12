#include "harness_types.h"
#include <stdlib.h>
#include <string.h>
// klee removed for replay

extern void dvmrp_print(netdissect_options *ndo, const u_char *bp, u_int len);

int main(void) {
    netdissect_options *ndo = (netdissect_options *)calloc(1, sizeof(netdissect_options));
    u_char *buf = (u_char *)calloc(1, sizeof(u_char));
    u_char *snap = buf + 1;

    { static const unsigned char buf_data[] = {0x00}; memcpy(buf, buf_data, (1 < sizeof(buf_data)) ? 1 : sizeof(buf_data)); };

    ndo->ndo_snapend = snap;
    ndo->ndo_vflag = 0;

    dvmrp_print(ndo, buf, 1);
    return 0;
}
