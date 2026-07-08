# issue-6158

**Project:** mruby
**Type:** Heap-buffer-overflow (misaligned read 8B) in string search
**Vulnerable file:** `src/string.c` → `mrb_memsearch_ss`
**Harness / driver:** `mruby_fuzzer.c`
**Fix commit:** `e61a2881a7c9adc895416fdd409e7362130198d3`
**Vulnerable commit (parent of fix):** `219cfd63e151360efe664728e3b5dbcf6e102d44`
**Upstream issue:** https://github.com/mruby/mruby/issues/6158
**ARVO / OSS-Fuzz local ID:** arvo:66208
**ARVO repro:** `docker run -it n132/arvo:66208-vul arvo`

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
