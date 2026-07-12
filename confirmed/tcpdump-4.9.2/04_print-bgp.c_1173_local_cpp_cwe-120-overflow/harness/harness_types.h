/* AUTO-GENERATED from harness preamble */
#pragma once

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <netinet/in.h>

#ifndef u_char
typedef unsigned char u_char;
#endif

#ifndef BGP_SIZE
#define BGP_SIZE 19
#endif

typedef struct netdissect_options {
    int ndo_vflag;
    const u_char *ndo_snapend;
} netdissect_options;

struct bgp {
    u_char bgp_marker[16];
    uint16_t bgp_len;
    u_char bgp_type;
};


