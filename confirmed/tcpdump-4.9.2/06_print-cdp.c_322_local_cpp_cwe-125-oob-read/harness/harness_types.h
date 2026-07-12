/* AUTO-GENERATED from harness preamble */
#pragma once

#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#define CDP_HEADER_LEN 4
#define CDP_TLV_HEADER_LEN 4
#define CDP_HEADER_VERSION_OFFSET 0
#define CDP_HEADER_TTL_OFFSET 1
#define CDP_HEADER_CHECKSUM_OFFSET 2
#define CDP_TLV_TYPE_OFFSET 0
#define CDP_TLV_LEN_OFFSET 2

#ifndef u_char
typedef unsigned char u_char;
#endif
#ifndef u_int
typedef unsigned int u_int;
#endif

typedef struct netdissect_options {
    int ndo_vflag;
} netdissect_options;

static const char *tstr = "truncated";
