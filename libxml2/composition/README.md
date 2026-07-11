# Pairwise reachability composition — libxml2 2.10.4 bugs 18–22

One folder, flat: the 5 non-crashing **predicates** (`predicate_18.c` … `predicate_22.c`) and one
shared-symbolic-input **driver** per pair (`driver_18_19.c` … `driver_21_22.c`, 10 = C(5,2)). Each
predicate is written once and reused by every driver whose pair includes it. Run each driver with
KLEE to ask: *is there a single input that reaches both bugs?*

Bug numbering (all vulnerable in **libxml2 2.10.4**):

| # | Function | File:line | Type |
|---|---|---|---|
| 18 | `htmlCurrentChar` | HTMLparser.c:474 | global-buffer-overflow read |
| 19 | `htmlParseSystemLiteral` | HTMLparser.c:3004 | global-buffer-overflow read |
| 20 | `htmlParseHTMLAttribute` | HTMLparser.c:2843 | uninitialized/over-read |
| 21 | `xmlParseTryOrFinish` | parser.c:12168 | heap-buffer-overflow read |
| 22 | `xmlSwitchInputEncodingInt` | parserInternals.c:1124 | over-read root cause |

```
predicate_18.c … predicate_22.c   # one non-crashing twin per bug (5)
driver_18_19.c … driver_21_22.c   # one composition driver per pair (10)
```

## How the method works

Running the real code can't show one input hitting two bugs — AddressSanitizer aborts at the first
out-of-bounds access. So each vulnerable function is rewritten as a **non-crashing predicate** that
replicates its control-flow and bounds logic exactly (using `end = buf + len` as the libxml2
`input->end` / tcpdump `ndo_snapend` analog) and, at the exact crashing statement (the **sink**),
does `return 1` instead of the out-of-bounds access — `return 0` on every safe exit. Because it
never over-reads, one run can evaluate both predicates.

The **driver** allocates one shared symbolic buffer `buf[N]` + a shared symbolic `len`, calls both
predicates on the **same** input, then:
```c
klee_assume(rX == 1 && rY == 1);          /* force both vulnerable paths to be reached */
klee_assert(0 && "BOTH_REACHABLE_X_Y");   /* fires iff the conjunction is satisfiable  */
```
**SAT** → the assertion fires and KLEE writes a `.ktest`: one concrete `(buf, len)` reaching both
bugs. **UNSAT** → no single input reaches both on this model.

## Build & run one pair (predicates are in this same folder)
```sh
KS=$KLEE_SRC   # dir containing include/klee/klee.h
clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone predicate_18.c -o p18.bc
clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone predicate_20.c -o p20.bc
clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone -I$KS/include driver_18_20.c -o d.bc
llvm-link d.bc p18.bc p20.bc -o linked.bc
klee --max-time=300 linked.bc
# SAT -> "KLEE: ERROR: ... ASSERTION FAIL: 0 && \"BOTH_REACHABLE_18_20\"" + a testNNN.ktest witness
```

## The two prompts used to generate these files

**Prompt A — predicate generation** (once per bug, given its dossier):
> Given the complete pre-patch vulnerable function `<fn>` from `<file>` at `<version>`, its crash
> sink at `<line>`, and the fix diff, produce a self-contained C predicate
> `int predicate_<id>(const unsigned char *buf, unsigned int len)` that (1) replicates the function's
> control flow and bounds logic exactly, treating `end = buf + len` as the input-buffer end;
> (2) performs **no** real out-of-bounds access — at the point the original would do the crashing
> read/write, `return 1`; (3) returns 0 on every non-vulnerable exit. Call no libxml2 functions;
> comment the sink and note any abstraction.

**Prompt B — driver generation** (once per pair):
> Given predicates `predicate_<X>` and `predicate_<Y>` with signature
> `int(const unsigned char *, unsigned int)`, generate `driver_<X>_<Y>.c` that allocates one shared
> symbolic buffer `buf[N]` and a shared symbolic `len` in `[1,N]`, declares both prototypes, calls
> **both** with the **same** `(buf, len)`, `klee_assume(rX==1 && rY==1)`, then
> `klee_assert(0 && "BOTH_REACHABLE_<X>_<Y>")`. Include `<klee/klee.h>`.

## Notes on fidelity
- 18/19/20/21 mirror the real cursor/bounds logic closely. **22** is the most abstracted: it models
  the encoding-conversion *outcome* (`nbchars < 0`) rather than replicating `xmlCharEncInput`.
- Bugs 18 and 20 share the `htmlCurrentChar` sink, and 22 is the root cause of 20 — so several pairs
  are SAT with tiny witnesses (e.g. a truncated multi-byte lead).
- The driver simplifies the real harness (`fuzz/html.c`): it makes `buf`+`len` symbolic but assumes
  default parse options. `N = 32` is a tractability knob.
