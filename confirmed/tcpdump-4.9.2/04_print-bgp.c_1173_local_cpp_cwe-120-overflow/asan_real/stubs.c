// klee removed
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#define NO_HARNESS_TYPES

#ifndef u_char
typedef unsigned char u_char;
#endif

typedef struct netdissect_options {
    int ndo_vflag;
    const u_char *ndo_snapend;
} netdissect_options;

const char *ip6addr_string(netdissect_options *ndo, const void *addr) {
    return "::";
}

int bgp_attr_get_as_size(netdissect_options *ndo) { return 2; }
