# Pairwise reachability composition — libxml2 2.10.4 bugs 18–22

Everything is in **one file**, [`composition.c`](./composition.c): all 5 non-crashing predicates plus
the shared-symbolic-input driver. You choose which pair to test at **compile time** with `-DA=<x>
-DB=<y>` (a single translation unit can only have one `main`, so the pair is a compile flag rather
than 10 separate `main`s). Run each driver with KLEE to ask: *is there one input that reaches both
bugs?*

Bug numbering (all vulnerable in **libxml2 2.10.4**):

| # | Function | File:line | Type |
|---|---|---|---|
| 18 | `htmlCurrentChar` | HTMLparser.c:474 | global-buffer-overflow read |
| 19 | `htmlParseSystemLiteral` | HTMLparser.c:3004 | global-buffer-overflow read |
| 20 | `htmlParseHTMLAttribute` | HTMLparser.c:2843 | uninitialized/over-read |
| 21 | `xmlParseTryOrFinish` | parser.c:12168 | heap-buffer-overflow read |
| 22 | `xmlSwitchInputEncodingInt` | parserInternals.c:1124 | over-read root cause |

## How the method works

Running the real code can't show one input hitting two bugs — AddressSanitizer aborts at the first
out-of-bounds access. So each vulnerable function is rewritten as a **non-crashing predicate** that
replicates its control-flow and bounds logic exactly (using `end = buf + len` as the libxml2
`input->end` / tcpdump `ndo_snapend` analog) and, at the exact crashing statement (the **sink**),
does `return 1` instead of the out-of-bounds access — `return 0` on every safe exit. Because it
never over-reads, one run can evaluate both predicates.

The **driver** allocates one shared symbolic buffer `buf[N]` + a shared symbolic `len`, calls both
selected predicates on the **same** input, then:
```c
klee_assume(rA == 1 && rB == 1);      /* force both vulnerable paths to be reached */
klee_assert(0 && "BOTH_REACHABLE");   /* fires iff the conjunction is satisfiable  */
```
**SAT** → the assertion fires and KLEE writes a `.ktest`: one concrete `(buf, len)` reaching both
bugs. **UNSAT** → no single input reaches both on this model.

## Build & run

One pair:
```sh
KS=$KLEE_SRC   # dir containing include/klee/klee.h
clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone -I$KS/include \
      -DA=18 -DB=20 composition.c -o composition.bc
klee --max-time=300 composition.bc
# SAT -> "KLEE: ERROR: ... ASSERTION FAIL: 0 && \"BOTH_REACHABLE\"" + testNNN.ktest
```

All 10 pairs:
```sh
for p in 18_19 18_20 18_21 18_22 19_20 19_21 19_22 20_21 20_22 21_22; do
  A=${p%_*}; B=${p#*_}
  clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone -I$KS/include \
        -DA=$A -DB=$B composition.c -o c_$p.bc
  klee --output-dir=out_$p --max-time=300 c_$p.bc
done
```

## The two prompts used to generate this

**Prompt A — predicate generation** (once per bug, given its dossier):
> Given the complete pre-patch vulnerable function `<fn>` from `<file>` at `<version>`, its crash
> sink at `<line>`, and the fix diff, produce a self-contained C predicate
> `int predicate_<id>(const unsigned char *buf, unsigned int len)` that (1) replicates the function's
> control flow and bounds logic exactly, treating `end = buf + len` as the input-buffer end;
> (2) performs **no** real out-of-bounds access — at the point the original would perform the
> crashing read/write, `return 1`; (3) returns 0 on every non-vulnerable exit. Call no libxml2
> functions; comment the sink and note any abstraction.

**Prompt B — driver generation** (once per pair, or once parameterized):
> Given predicates with signature `int(const unsigned char *, unsigned int)`, generate a KLEE driver
> that allocates one shared symbolic buffer `buf[N]` and a shared symbolic `len` in `[1,N]`, calls
> **both** predicates with the **same** `(buf, len)`, `klee_assume(rA==1 && rB==1)`, then
> `klee_assert(0 && "BOTH_REACHABLE")`. Include `<klee/klee.h>`. (Here the pair is selected with
> `-DA`/`-DB` so all 5 predicates and the driver live in one file.)

## Notes on fidelity
- 18/19/20/21 mirror the real cursor/bounds logic closely. **22** is the most abstracted: it models
  the encoding-conversion *outcome* (`nbchars < 0`) rather than replicating `xmlCharEncInput`.
- Bugs 18 and 20 share the `htmlCurrentChar` sink, and 22 is the root cause of 20 — so several pairs
  are SAT with tiny witnesses (e.g. a truncated multi-byte lead).
- The driver simplifies the real harness (`fuzz/html.c`): it makes `buf`+`len` symbolic but assumes
  default parse options. If a bug needs a specific flag, also make the harness's 4-byte options int
  symbolic. `N = 32` is a tractability knob.
