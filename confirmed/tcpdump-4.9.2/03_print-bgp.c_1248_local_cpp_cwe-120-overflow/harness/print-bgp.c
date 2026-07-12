#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <klee/klee.h>

typedef unsigned char u_char;
typedef unsigned int u_int;

typedef struct netdissect_options {
    int ndo_vflag;
    const u_char *ndo_snapend;
} netdissect_options;

#ifndef BGP_SIZE
#define BGP_SIZE 19
#endif

int bgp_header_print(netdissect_options *ndo, const u_char *p, unsigned int hlen);
int bgp_update_print(netdissect_options *ndo, const u_char *p, unsigned int len);
int bgp_attr_print(netdissect_options *ndo, const u_char *p, unsigned int len);

void bgp_print(netdissect_options *ndo,
          const u_char *dat, int length)
{
    klee_warning_once("SPINE_PROBE:bgp_print:ENTRY");
	const u_char *p;
	const u_char *ep;
	const u_char *start;
	const u_char marker[] = {
		0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
		0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
	};
	struct bgp { uint16_t bgp_len; uint8_t bgp_type; uint8_t pad[BGP_SIZE-3]; } bgp;
	uint16_t hlen;

	ep = dat + length;
	if (ndo->ndo_snapend < dat + length)
		ep = ndo->ndo_snapend;

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
		hlen = (bgp.bgp_len >> 8) | (bgp.bgp_len << 8);
		if (hlen < BGP_SIZE)
			break;
		if (!bgp_header_print(ndo, p, hlen))
			return;
		p += hlen;
		start = p;
	}
}

static int decode_clnp_prefix(netdissect_options *ndo,
                   const u_char *pptr, char *buf, u_int buflen)
{
    klee_warning_once("SPINE_PROBE:decode_clnp_prefix:ENTRY");
        uint8_t addr[19];
	u_int plen;

	plen = pptr[0];

	if (152 < plen)
		return -1;

	memset(&addr, 0, sizeof(addr));
	memcpy(&addr, &pptr[4], (plen + 7) / 8);
	snprintf(buf, buflen, "%s/%d", "clnp", plen);

    klee_assert(0 && "SAILOR_SINK_REACHED");
	return 1 + (plen + 7) / 8;
}
