/* AUTO-GENERATED from harness preamble */
#pragma once

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

typedef unsigned char u_char;
typedef unsigned int u_int;

typedef struct netdissect_options {
    int ndo_vflag;
    const u_char *ndo_snapend;
} netdissect_options;

#ifndef BGP_SIZE
#define BGP_SIZE 19
#endif


void bgp_print(netdissect_options *ndo,
