#include "harness_types.h"
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <klee/klee.h>

int main(void) {
    netdissect_options *ndo = (netdissect_options *)calloc(1, sizeof(netdissect_options));
    unsigned char *buf = (unsigned char *)calloc(64, 1);
    klee_make_symbolic(buf, 64, "buf");
    buf[0] = 0;
    buf[1] = 0;
    babel_print(ndo, buf, 64);
    return 0;
}
