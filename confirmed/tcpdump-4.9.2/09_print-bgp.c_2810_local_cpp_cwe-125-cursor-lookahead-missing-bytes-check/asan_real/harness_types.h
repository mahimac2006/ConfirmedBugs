/* AUTO-GENERATED from harness preamble */
#pragma once

#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <arpa/inet.h>

#ifndef BGP_SIZE
#define BGP_SIZE 19
#endif

struct netdissect_options {
    int ndo_bflag;
    int ndo_eflag;
    int ndo_fflag;
    int ndo_Kflag;
    int ndo_nflag;
    int ndo_Nflag;
    int ndo_qflag;
    int ndo_Sflag;
    int ndo_tflag;
    int ndo_uflag;
    int ndo_vflag;
    int ndo_xflag;
    int ndo_Xflag;
    int ndo_Aflag;
    int ndo_Hflag;
    int ndo_packet_number;
    int ndo_suppress_default_print;
    const unsigned char *ndo_snapend;
};

