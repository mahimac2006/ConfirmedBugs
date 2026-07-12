# Pairwise reachability composition — tcpdump 4.9.2 (12 bugs)

One folder, flat: a non-crashing **predicate** per confirmed bug (`predicate_01.c` …
`predicate_12.c`) and one shared-symbolic-input **driver** per pair (`driver_01_02.c` …
`driver_11_12.c`, 66 = C(12,2)). Run each driver with KLEE to ask: *is there a single packet that
reaches both bugs?*

## Bugs (all tcpdump 4.9.2, ASan-confirmed heap over-reads/overflows)

| # | Parser | Entry function | Crash file:line | CWE |
|---|---|---|---|---|
| 01 | IEEE 802.11 | `ieee802_11_if_print` (→ `parse_elements`) | print-802_11.c:2140 | 120 |
| 02 | IEEE 802.11 | `ieee802_11_print` (→ `parse_elements`) | print-802_11.c:2059 | 120 |
| 03 | BGP | `bgp_print` | print-bgp.c:2797 | 120 |
| 04 | BGP | `bgp_print` (→ `decode_labeled_prefix6`) | print-bgp.c:2797 | 120 |
| 05 | BEEP | `beep_print` (→ `l_strnstart`) | print-beep.c:67 | 125 |
| 06 | CDP | `cdp_print` | print-cdp.c:107 | 125 |
| 07 | CIP | `cip_print` (→ `cip_if_print`) | print-cip.c:50 | 125 |
| 08 | Babel | `babel_print` (→ `format_prefix`) | print-babel.c:52 | 125 |
| 09 | BGP | `bgp_print` | print-bgp.c:2797 | 125 |
| 10 | DVMRP | `dvmrp_print` | print-dvmrp.c:75 | 125 |
| 11 | DVMRP | `dvmrp_print` | print-dvmrp.c:75 | 125 |
| 12 | IEEE 802.11 | `ieee802_11_if_print` (→ `handle_action`) | print-802_11.c:2140 | 125 |

```
predicate_01.c … predicate_12.c   # one non-crashing twin per bug (12)
driver_01_02.c … driver_11_12.c   # one composition driver per pair (66)
```

## How the method works

Running the real dissector can't show one packet hitting two bugs — AddressSanitizer aborts at the
first out-of-bounds access. So each vulnerable function is rewritten as a **non-crashing predicate**
`int predicate_NN(const unsigned char *buf, unsigned int len)` that:
- treats the shared input as the packet: `bp = buf`, `ep = buf + len` (the `ndo_snapend` analog),
- replicates the dissector's control flow and pointer/length arithmetic from the confirmed harness
  slice (`<bug>/harness/print-*.c`), folding in the config the harness uses (e.g. `ndo_vflag`),
- inserts the **missing** bounds check before each unchecked read (`if (ptr + k > ep) return 0;`),
  so it never actually over-reads,
- `return 1` exactly when execution reaches the vulnerable read (the crash sink); `return 0` on
  every other exit.

The **driver** allocates one shared symbolic packet `buf[N]` + a shared symbolic `len`, calls both
predicates on the **same** input, then:
```c
if (rX == 1 && rY == 1)
    klee_assert(0 && "BOTH_REACHABLE_X_Y");
```
**SAT** → the assertion fires and KLEE writes a `.ktest`: one concrete packet reaching both bugs.
**UNSAT** → the assertion is never reached and KLEE completes with 0 errors.

> **`if`, not `klee_assume(rX==1 && rY==1)`:** each predicate returns a concrete 0/1 per path, so the
> assume form is provably-false on non-matching paths and KLEE flags it as an error. The `if` prunes
> those paths silently. The `klee_assume(len …)` stays — it constrains the symbolic input.

## Build & run one pair (predicates are in this same folder)
```sh
KS=$KLEE_SRC   # dir containing include/klee/klee.h
clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone predicate_10.c -o p10.bc
clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone predicate_11.c -o p11.bc
clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone -I$KS/include driver_10_11.c -o d.bc
llvm-link d.bc p10.bc p11.bc -o linked.bc
klee --max-time=300 linked.bc
# SAT -> "KLEE: ERROR: ... ASSERTION FAIL: 0 && \"BOTH_REACHABLE_10_11\"" + a testNNN.ktest witness
```

## Notes on fidelity
- Every predicate is normalized to `(buf, len)` so any pair composes over one shared packet, and
  `end = buf + len` is the `ndo_snapend` analog. Config flags (e.g. `ndo_vflag`) are set inside each
  predicate to the value its harness driver uses to reach the sink.
- Because the normalized signature exposes a single `len`, bugs whose real trigger is a mismatch
  between the *claimed* frame length (caplen) and the *captured* end (snapend) collapse those two
  bounds into `len` — the predicate returns 1 when `len` is large enough to reach the read. See each
  predicate's header comment for its exact sink and any modelling caveat.
- `N = 64` is a tractability knob; predicates that scan for a marker (e.g. BGP's `0xff` sync) fork
  heavily over a fully-symbolic 64-byte buffer, so lower `N` if a pair explores too long.
