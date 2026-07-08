# OSS-Fuzz-49255

**Project:** mruby
**Type:** Heap-buffer-overflow (read 8B); bitwise XOR on big integers
**Vulnerable file:** `mrbgems/mruby-bigint/core/bigint.c` → `mrb_bint_xor`
**Harness / driver:** `mruby_fuzzer.c`
**Fix commit:** `b84bca666fdc4fe94286b49b6f6b9a64e4c3a534`
**Vulnerable commit (parent of fix):** `a99d0036222ad4c3a300243113f7afff2618aff9`
**ARVO / OSS-Fuzz local ID:** arvo:49255
**ARVO repro:** `docker run -it n132/arvo:49255-vul arvo`

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
