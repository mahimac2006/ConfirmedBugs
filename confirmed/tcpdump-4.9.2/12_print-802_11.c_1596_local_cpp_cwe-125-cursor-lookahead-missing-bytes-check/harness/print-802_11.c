#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <klee/klee.h>

typedef unsigned int u_int;
typedef unsigned char u_char;

typedef struct netdissect_options {
    int dummy;
} netdissect_options;

typedef struct pcap_pkthdr {
    u_int len;
    u_int caplen;
} pcap_pkthdr;

static int handle_action(netdissect_options *ndo, const uint8_t *src, const u_char *p, u_int length) {
    klee_warning_once("SPINE_PROBE:handle_action:ENTRY");
    if (length < 2) return 0;
    switch (0) {
        default:
            break;
    }
    ND_PRINT((ndo, "Reserved(%d) Act#%d", p[0], p[1]));
    klee_assert(0 && "SAILOR_SINK_REACHED");
    return 0;
}

static int mgmt_body_print(netdissect_options *ndo, const u_char *p, u_int length) {
    klee_warning_once("SPINE_PROBE:mgmt_body_print:ENTRY");
    return handle_action(ndo, (const uint8_t *)p, p, length);
}

static u_int ieee802_11_print(netdissect_options *ndo, const u_char *p, u_int len, u_int caplen, int a, int b) {
    klee_warning_once("SPINE_PROBE:ieee802_11_print:ENTRY");
    return mgmt_body_print(ndo, p, caplen);
}

u_int ieee802_11_if_print(netdissect_options *ndo, const struct pcap_pkthdr *h, const u_char *p) {
    klee_warning_once("SPINE_PROBE:ieee802_11_if_print:ENTRY");
    return ieee802_11_print(ndo, p, h->len, h->caplen, 0, 0);
}
