# issue-3926

**Project:** mruby
**Type:** Stack-overflow via unbounded recursion; nested Struct.new
**Vulnerable file:** `src/class.c` → `mrb_class_path`
**Harness / driver:** `mruby_fuzzer.c`
**Fix commit:** `e5fb21b6d281e76ed1aadf488706600739b7f787`
**Vulnerable commit (parent of fix):** `3ae621fcb32a87e65de0ad68c291a12d315a81dd`
**Upstream issue:** https://github.com/mruby/mruby/issues/3926

## Layout

| Path | Description |
|---|---|
| `driver/` | OSS-Fuzz fuzz harness(es) and shared helpers |
| `stubs/` | OSS-Fuzz build scripts (`build.sh`, `Dockerfile`, `project.yaml`) |
| `vulnerable/` | Pre-patch source of the vulnerable file at the parent of the fix commit |
| `patch/` | Upstream fix as a unified diff |
| `poc/` | Ground-truth PoC input (fetch instructions if not bundled) |

## Reproduce

1. Check out the upstream repo at the vulnerable commit (see `metadata.json`).
2. Build with ASAN using the OSS-Fuzz stubs in `stubs/` and the driver in `driver/`.
3. Run the fuzz target against the PoC in `poc/` (or fetch from ARVO if noted).
4. Apply `patch/fix.patch` and confirm the crash no longer reproduces.
