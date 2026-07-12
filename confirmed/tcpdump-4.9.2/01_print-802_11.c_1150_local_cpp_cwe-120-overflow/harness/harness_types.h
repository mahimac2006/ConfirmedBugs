/* AUTO-GENERATED from harness preamble */
#pragma once

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stddef.h>
#include <arpa/inet.h>
#include <netinet/in.h>

typedef unsigned char u_char;
typedef unsigned int u_int;

typedef struct pcap_pkthdr {
    uint32_t len;
    uint32_t caplen;
} pcap_pkthdr;

typedef struct netdissect_options {
    int dummy;
} netdissect_options;

struct cf_t { unsigned char length; unsigned char count[6]; };
struct mgmt_body_t { int element; int cf_present; struct cf_t cf; };
struct ssid_t { int dummy; };
struct challenge_t { int dummy; };
struct rates_t { int dummy; };
struct ds_t { int dummy; };
struct tim_t { int dummy; };

#ifndef E_CF
#define E_CF 1
#endif

static int parse_elements(netdissect_options *ndo,
               struct mgmt_body_t *pbody, const u_char *p, int offset,
