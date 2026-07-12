/* AUTO-GENERATED from harness preamble */
#pragma once

#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <pcap.h>

#ifndef MAX_MCS_INDEX
#define MAX_MCS_INDEX 76
#endif

/* Minimal types needed for the spine */
typedef unsigned char u_char;
typedef unsigned int u_int;

struct netdissect_options {
  int ndo_bflag; int ndo_eflag; int ndo_fflag; int ndo_Kflag; int ndo_nflag;
  int ndo_Nflag; int ndo_qflag; int ndo_Sflag; int ndo_tflag; int ndo_uflag;
  int ndo_vflag;
};

struct tim_t {
    u_char id;
    u_char length;
    u_char count;
    u_char period;
    u_char bitmap[256];
};

struct mgmt_body_t {
    int tim_present;
    struct tim_t tim;
};
