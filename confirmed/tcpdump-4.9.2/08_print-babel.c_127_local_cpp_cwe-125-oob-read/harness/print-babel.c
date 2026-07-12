#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <klee/klee.h>

typedef unsigned char u_char;
typedef unsigned int u_int;

typedef struct netdissect_options {
    int dummy;
} netdissect_options;

static const char *format_prefix(netdissect_options *ndo, const u_char *prefix, unsigned char plen) {
    klee_warning_once("SPINE_PROBE:format_prefix:ENTRY");
    static char buf[50];
    /* SAILOR: CWE-125 bounds check — injected before vulnerable call */
    if (klee_get_obj_size((void*)prefix) < (size_t)(12))
      klee_report_error(__FILE__, 0, "SAILOR OOB: buffer too small for access length", "sailor.ptr.err");
    klee_assert(0 && "SAILOR_SINK_REACHED");
    if (plen >= 96) {
        snprintf(buf, 50, "%s/%u", ipaddr_string(ndo, prefix + 12), plen - 96);
    } else {
        snprintf(buf, 50, "%s/%u", ip6addr_string(ndo, prefix), plen);
    }
    buf[49] = '\0';
    return buf;
}

void babel_print_v2(netdissect_options *ndo, const u_char *cp, u_int length) {
    format_prefix(ndo, 0, 0);  /* AUTO-INJECTED: spine call chain */

    klee_warning_once("SPINE_PROBE:babel_print_v2:ENTRY");
    (void)ndo; (void)cp; (void)length;
}

void babel_print(netdissect_options *ndo, const u_char *cp, u_int length) {
    klee_warning_once("SPINE_PROBE:babel_print:ENTRY");
    babel_print_v2(ndo, cp, length);
}
