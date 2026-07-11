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
predicates on the **same** input, then guards the marker with an `if`:
```c
if (rX == 1 && rY == 1)
    klee_assert(0 && "BOTH_REACHABLE_X_Y");   /* fires iff one input reaches both bugs */
```
**SAT** → the assertion fires and KLEE writes a `.ktest`: one concrete `(buf, len)` reaching both
bugs. **UNSAT** → the assertion is never reached and KLEE completes with 0 errors.

> **Why `if`, not `klee_assume(rX==1 && rY==1)`?** Each predicate returns a *concrete* 0/1 on a given
> path, so on every non-matching path `klee_assume(rX==1 && rY==1)` would be a provably-false assume
> and KLEE reports it as an error (`invalid klee_assume call (provably false)`). The `if` prunes those
> paths silently while still firing the assertion on the satisfying path — same SAT/UNSAT answer,
> no spurious errors. The `klee_assume(len …)` on the symbolic length stays, since that constrains
> the input and is always feasible.

## Build & run one pair (predicates are in this same folder)
```sh
KS=$KLEE_SRC   # dir containing include/klee/klee.h
clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone predicate_18.c -o predicate_18.bc
clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone predicate_20.c -o predicate_20.bc
clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone -I$KS/include driver_18_20.c -o d.bc
llvm-link d.bc predicate_18.bc predicate_20.bc -o linked_18_19.bc
klee --max-time=300 linked_18_19.bc
# SAT -> "KLEE: ERROR: ... ASSERTION FAIL: 0 && \"BOTH_REACHABLE_18_20\"" + a testNNN.ktest witness
```
