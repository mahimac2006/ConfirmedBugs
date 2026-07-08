# issue-6701

**Project:** mruby
**Type:** Heap-UAF (read 4B); memory freed in bigint GCD then reused by VM
**Vulnerable file:** `src/vm.c` → `mrb_vm_exec`
**Harness / driver:** `mruby_fuzzer.c`
**Fix commit:** `e50f15c1c6e131fa7934355eb02b8173b13df415`
**Vulnerable commit (parent of fix):** `cda2567c36ca33cd404908ce2fa7bd55ea2a8ed9`
**Upstream issue:** https://github.com/mruby/mruby/issues/6701

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
