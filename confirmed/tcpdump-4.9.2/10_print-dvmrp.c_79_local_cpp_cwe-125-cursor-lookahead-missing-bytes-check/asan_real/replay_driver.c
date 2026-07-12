#include <string.h>
#include "harness_types.h"
#include <stdlib.h>
// klee removed for replay

int main(void) {
    netdissect_options *ndo = (netdissect_options *)calloc(1, sizeof(*ndo));
    u_char *buf = (u_char *)malloc(1);
    { static const unsigned char buf_data[] = {0x00}; memcpy(buf, buf_data, (1 < sizeof(buf_data)) ? 1 : sizeof(buf_data)); };

    ndo->ndo_snapend = buf + 1;
    ndo->ndo_vflag = 2;

    dvmrp_print(ndo, buf, 1);
    return 0;
}
