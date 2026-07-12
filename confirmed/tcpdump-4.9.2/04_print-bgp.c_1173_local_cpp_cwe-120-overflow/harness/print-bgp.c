#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <klee/klee.h>

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

static const char *ip6addr_string(netdissect_options *ndo, const void *addr);
static int bgp_header_print(netdissect_options *ndo, const u_char *p, u_int hlen);

void bgp_print(netdissect_options *ndo, const u_char *dat, int length)
{
    klee_warning_once("SPINE_PROBE:bgp_print:ENTRY");
	const u_char *p;
	const u_char *ep;
	const u_char *start;
	const u_char marker[] = {
		0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
		0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	};
	struct bgp bgp;
	uint16_t hlen;

	ep = dat + length;
	if (ndo->ndo_snapend < dat + length)
		ep = ndo->ndo_snapend;

	if (ndo->ndo_vflag < 1)
	        return;

	p = dat;
	start = p;
	while (p < ep) {
		if (p[0] != 0xff) {
			p++;
			continue;
		}
		if (memcmp(p, marker, sizeof(marker)) != 0) {
			p++;
			continue;
		}
		memcpy(&bgp, p, BGP_SIZE);
		hlen = ntohs(bgp.bgp_len);
		if (hlen < BGP_SIZE)
			break;
		if (1) {
			if (!bgp_header_print(ndo, p, hlen))
				return;
			p += hlen;
			start = p;
		} else {
			break;
		}
	}
	return;
}

static int decode_labeled_prefix6(netdissect_options *ndo,
                       const u_char *pptr, u_int itemlen, char *buf, u_int buflen)
{
    klee_warning_once("SPINE_PROBE:decode_labeled_prefix6:ENTRY");
	struct in6_addr addr;
	u_int plen, plenbytes;

	plen = pptr[0];
        plen-=24;
	itemlen -= 4;
	memset(&addr, 0, sizeof(addr));
	plenbytes = (plen + 7) / 8;
	memcpy(&addr, &pptr[4], plenbytes);
	snprintf(buf, buflen, "%s/%d, label:%u %s",
                 ip6addr_string(ndo, &addr),
                 plen,
                 (unsigned)((pptr[1] << 16) | (pptr[2] << 8) | pptr[3])>>4,
                 ((pptr[3]&1)==0) ? "(BOGUS: Bottom of Stack NOT set!)" : "(bottom)" );
	klee_assert(0 && "SAILOR_SINK_REACHED");
	return 4 + plenbytes;
}

/* AUTO-GENERATED: intermediate spine pass-through */

/* AUTO-GENERATED: intermediate spine pass-through */
void bgp_attr_print(netdissect_options *ndo, const u_char *p, u_int hlen) {
    decode_labeled_prefix6(ndo, 0, 0, 0, 0);  /* AUTO-INJECTED: spine call chain */

    klee_warning_once("SPINE_PROBE:bgp_attr_print:ENTRY");
}

void bgp_update_print(netdissect_options *ndo, const u_char *p, u_int hlen) {
    bgp_attr_print(ndo, p, hlen);  /* AUTO-INJECTED: spine call chain */

    klee_warning_once("SPINE_PROBE:bgp_update_print:ENTRY");
}


static int bgp_header_print(netdissect_options *ndo, const u_char *p, u_int hlen) {
    bgp_update_print(ndo, p, hlen);  /* AUTO-INJECTED: spine call chain */

    klee_warning_once("SPINE_PROBE:bgp_header_print:ENTRY");
    char buf[256];
    return decode_labeled_prefix6(ndo, p + 19, hlen - 19, buf, sizeof(buf));
}

static const char *ip6addr_string(netdissect_options *ndo, const void *addr) { return "::"; }
