# Pairwise reachability composition — libxml2 2.10.4 bugs 21–25

Non-crashing **predicates** for each of the 5 libxml2 bugs, and a shared-symbolic-input **driver**
for every pair (10 drivers = C(5,2)). Run each driver with KLEE to ask: *is there a single input
that reaches both bugs?*

Bug numbering (all vulnerable in **libxml2 2.10.4**):

| # | Function | File:line | Type |
|---|---|---|---|
| 21 | `htmlCurrentChar` | HTMLparser.c:474 | global-buffer-overflow read |
| 22 | `htmlParseSystemLiteral` | HTMLparser.c:3004 | global-buffer-overflow read |
| 23 | `htmlParseHTMLAttribute` | HTMLparser.c:2843 | uninitialized/over-read |
| 24 | `xmlParseTryOrFinish` | parser.c:12168 | heap-buffer-overflow read |
| 25 | `xmlSwitchInputEncodingInt` | parserInternals.c:1124 | over-read root cause |

```
predicates/predicate_21.c … predicate_25.c      # one non-crashing twin per bug
drivers/driver_21_22.c … driver_24_25.c          # one composition driver per pair (10)
```

## How the method works

**Problem.** Running the real vulnerable code can't tell you whether *one* input hits *two* bugs —
AddressSanitizer aborts at the first out-of-bounds access, so the second bug is never observed.

**Predicates.** Each vulnerable function is rewritten as a *non-crashing predicate* that:
1. replicates the original function's control flow and bounds logic **exactly**, using `end = buf +
   len` as the input-buffer end (the libxml2 `input->end`, i.e. the tcpdump `ndo_snapend` analog);
2. at the exact point the original would perform the crashing read/write (the **sink**), does
   `return 1` instead — "vulnerable path reached", with **no** real out-of-bounds access;
3. `return 0` on every non-vulnerable exit.

Because the predicate never actually over-reads, execution continues, so a single run can evaluate
*both* predicates.

**Driver.** The composition driver allocates **one shared symbolic buffer** `buf[N]` and shared
symbolic scalars (here just `len`; add flags/offsets if a pair needs shared mode state), calls
**both** predicates on the **same** symbolic inputs, then:
```c
klee_assume(rX == 1 && rY == 1);          /* force both vulnerable paths to be reached */
klee_assert(0 && "BOTH_REACHABLE_X_Y");   /* fires iff the conjunction is satisfiable  */
```

**KLEE.** KLEE explores the shared input space under the two predicates' constraints. If the
conjunction is **SAT**, the assertion fires and KLEE writes a `.ktest` — a single concrete
`(buf, len)` that drives **both** vulnerable paths. If **UNSAT**, no single input reaches both on
this model (the bugs are mutually exclusive for this shared input shape).

This is *reachability composition*: a satisfiability query "does one shared input reach bug X **and**
bug Y?", not real exploitation.

## Build & run one pair
```sh
KS=$KLEE_SRC   # dir containing include/klee/klee.h
clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone predicates/predicate_21.c -o p21.bc
clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone predicates/predicate_23.c -o p23.bc
clang -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone -I$KS/include drivers/driver_21_23.c -o d.bc
llvm-link d.bc p21.bc p23.bc -o linked.bc
klee --max-time=300 linked.bc
# SAT -> "KLEE: ERROR: ... ASSERTION FAIL: 0 && \"BOTH_REACHABLE_21_23\"" + a testNNN.ktest witness
```

## The two prompts used to generate these files

**Prompt A — predicate generation** (run once per bug, given its dossier):
> You are given the complete pre-patch vulnerable function `<fn>` from `<file>` at `<version>`, its
> crash sink at `<line>`, and the fix diff. Produce a self-contained C predicate
> `int predicate_<id>(const unsigned char *buf, unsigned int len)` that (1) replicates the vulnerable
> function's control flow and bounds logic exactly, treating `end = buf + len` as the input-buffer
> end (the `input->end` / snapend analog); (2) performs **no** real out-of-bounds access — at the
> exact point the original code would do the crashing read/write, `return 1`; (3) returns 0 on every
> non-vulnerable exit. Keep only the logic needed to decide reachability of the sink from
> `(buf, len)`. Call no libxml2 functions. Comment the sink line and note any abstraction.

**Prompt B — driver generation** (run once per pair):
> Given predicates `predicate_<X>` and `predicate_<Y>` with signature
> `int(const unsigned char *, unsigned int)`, generate a KLEE composition driver
> `driver_<X>_<Y>.c` that: allocates one shared symbolic buffer `buf[N]` and a shared symbolic `len`
> in `[1,N]`; declares both predicate prototypes; calls **both** predicates with the **same**
> `(buf, len)`; `klee_assume(rX == 1 && rY == 1)`; then `klee_assert(0 && "BOTH_REACHABLE_<X>_<Y>")`.
> Include `<klee/klee.h>`. The single shared symbolic input forces KLEE to find one concrete input
> reaching both vulnerable paths.

## Notes on fidelity
- Predicates 21/22/23/24 mirror the real cursor/bounds logic closely (UTF-8 sequence length, quote
  scanning, the 4-byte `encoding_error` diagnostic). Predicate **25** is the most abstracted: it
  models the *outcome* of the encoding conversion (`nbchars < 0`) rather than replicating the
  converter, because the real failure depends on `xmlCharEncInput`.
- Bugs 21 and 23 share the same underlying sink (`htmlCurrentChar`), and bug 25 is the root cause of
  bug 23 — so several pairs are expected SAT with tiny witnesses (e.g. a truncated multi-byte lead).
- `N = 32` is a tractability choice; increase it if a pair needs a longer input to satisfy both.
