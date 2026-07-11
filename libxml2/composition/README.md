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
