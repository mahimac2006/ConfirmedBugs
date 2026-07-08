# mruby — confirmed vulnerabilities

Source project: <https://github.com/mruby/mruby> · CyberGym count: **42** · Documented here: **13**

Each bug lives in its own subfolder with **`driver/`**, **`stubs/`**, **`vulnerable/`**, **`patch/`**, and **`poc/`** (see e.g. [`CVE-2018-10191/`](./CVE-2018-10191/)).

## Per-bug folder layout

```
mruby/<bug-id>/
├── README.md          # summary + reproduce steps
├── metadata.json      # structured fields (fix commit, issue, ARVO id, …)
├── driver/            # mruby_fuzzer harness
├── stubs/             # OSS-Fuzz build.sh, Dockerfile, project.yaml
├── vulnerable/        # pre-patch source of the crashing file
├── patch/fix.patch    # upstream fix as unified diff
└── poc/               # ground-truth crash input (or fetch instructions)
```

Re-populate or refresh from upstream with `python3 scripts/populate_bugs.py`.

## Driver / harness (common to all)

OSS-Fuzz project `mruby`, fuzz target **`mruby_fuzzer`**. Entry point `LLVMFuzzerTestOneInput`
feeds the raw input bytes to **`mrb_load_nstring(mrb, data, size, ...)`** — the fuzz input
*is* a Ruby source string.

- Harness source: <https://github.com/mruby/mruby/tree/master/oss-fuzz>
- OSS-Fuzz project dir: <https://github.com/google/oss-fuzz/tree/master/projects/mruby>

## Vulnerabilities

| # | Bug ID | Folder | Type / trigger | Vulnerable file → function |
|---|---|---|---|---|
| 1 | CVE-2018-10191 / #3995 | [`CVE-2018-10191/`](./CVE-2018-10191/) | UAF from integer overflow in env/upvar stack | `src/vm.c` → `mrb_vm_exec` |
| 2 | CVE-2018-12248 / #4038 | [`CVE-2018-12248/`](./CVE-2018-12248/) | Heap-buffer-overflow (read); Fiber + many `transfer()` args | `src/vm.c` → `mrb_vm_exec` |
| 3 | CVE-2020-15866 / #5042 | [`CVE-2020-15866/`](./CVE-2020-15866/) | Heap-buffer-overflow from incorrect VM stack handling | `src/vm.c` → `mrb_yield_with_class` |
| 4 | CVE-2025-7207 / #6509 | [`CVE-2025-7207/`](./CVE-2025-7207/) | Heap-buffer-overflow; `nregs` left uninitialized | `codegen.c` → `scope_new` |
| 5 | CVE-2025-13120 / #6649 | [`CVE-2025-13120/`](./CVE-2025-13120/) | UAF; comparator block reallocs array during sort | `src/array.c` → `mrb_ary_sort_bang` |
| 6 | issue #3926 | [`issue-3926/`](./issue-3926/) | Stack-overflow; nested self-referential `Struct.new` | `src/class.c` → `mrb_class_path` |
| 7 | issue #4027 | [`issue-4027/`](./issue-4027/) | SEGV; `(Hash::prepend Enumerable).dup()` | `src/hash.c` → `mrb_hash_keys` |
| 8 | OSS-Fuzz #30886 | [`OSS-Fuzz-30886/`](./OSS-Fuzz-30886/) | Heap-buffer-overflow (read); heredoc indentation | `parse.y` → `heredoc_remove_indent` |
| 9 | OSS-Fuzz #49255 | [`OSS-Fuzz-49255/`](./OSS-Fuzz-49255/) | Heap-buffer-overflow (read 8B); bigint XOR | `bigint.c` → `mrb_bint_xor` |
| 10 | issue #6158 | [`issue-6158/`](./issue-6158/) | Heap-buffer-overflow (misaligned read 8B) in string search | `src/string.c` → `mrb_memsearch_ss` |
| 11 | issue #6477 | [`issue-6477/`](./issue-6477/) | Heap-buffer-overflow in VM interpreter loop | `src/vm.c` → `mrb_vm_exec` |
| 12 | issue #6701 | [`issue-6701/`](./issue-6701/) | Heap-UAF; bigint GCD reduction then VM reuse | `src/vm.c` → `mrb_vm_exec` |
| 13 | issue #6704 | [`issue-6704/`](./issue-6704/) | Heap-buffer-overflow; non-ASCII source under-allocates stack | `src/vm.c` → `mrb_vm_exec` |

## Accuracy caveats

- **Crash site vs. fix site.** For several bugs the *vulnerable file* column is the crash
  location (where the over-read/UAF manifests), while the upstream **fix** lands in a
  different file that holds the root cause. Affected here: **#2** (crash `vm.c` → fix
  `mruby-fiber/src/fiber.c`), **#6** (crash `class.c` → fix `variable.c`), **#7** (crash
  `hash.c` → fix `kernel.c`), **#11/#12/#13** (crash `vm.c` → fix
  `mruby-compiler/core/codegen.c`). Each such `metadata.json` records both `file` (crash) and
  `fix_file` (patch).
- **#12 and #13** share fix commit `e50f15c…` — count as one if you require independent patches.
- Issue **#3871** is confirmed real but its closing commit could not be pinned; omitted here.
