#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <pcap.h>
#include <klee/klee.h>
#include "harness_types.h"

#ifndef MAX_MCS_INDEX
#define MAX_MCS_INDEX 76
#endif

extern unsigned int ieee802_11_if_print(struct netdissect_options *ndo, const struct pcap_pkthdr *h, const unsigned char *p);

int main(void) {
    struct netdissect_options *ndo = (struct netdissect_options *)calloc(1, sizeof(struct netdissect_options));
    struct pcap_pkthdr *h = (struct pcap_pkthdr *)calloc(1, sizeof(struct pcap_pkthdr));
    unsigned char *buf = (unsigned char *)calloc(1, 512);
    klee_make_symbolic(buf, 512, "buf");
    h->len = 512;
    h->caplen = 512;
    ieee802_11_if_print(ndo, h, buf);
    return 0;
}
