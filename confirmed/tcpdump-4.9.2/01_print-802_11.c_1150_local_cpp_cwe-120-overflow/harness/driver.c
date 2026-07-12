// NO_HARNESS_TYPES
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <klee/klee.h>

typedef unsigned char u_char;
typedef unsigned int u_int;

typedef struct pcap_pkthdr {
    uint32_t len;
    uint32_t caplen;
} pcap_pkthdr;

typedef struct netdissect_options {
    int dummy;
} netdissect_options;

extern u_int ieee802_11_if_print(netdissect_options *ndo, const struct pcap_pkthdr *h, const u_char *p);

int main() {
    netdissect_options *ndo = (netdissect_options *)calloc(1, sizeof(netdissect_options));
    struct pcap_pkthdr *h = (struct pcap_pkthdr *)calloc(1, sizeof(struct pcap_pkthdr));
    unsigned char *buf = (unsigned char *)calloc(1, 512);
    klee_make_symbolic(buf, 512, "buf");
    h->len = 512;
    h->caplen = 512;
    ieee802_11_if_print(ndo, h, buf);
    return 0;
}