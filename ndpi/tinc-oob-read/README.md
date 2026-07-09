# tinc-oob-read

**Project:** ndpi
**Type:** Heap-buffer-overflow (read); TINC dissector
**Vulnerable file:** `src/lib/protocols/tinc.c` → `ndpi_check_tinc`
**Harness / driver:** `fuzz_ndpi_reader.c`
**Fix commit:** `06a0abb6fdf8fb7a446ef5aafdf2c7d24608977f`
**Vulnerable commit (parent of fix):** `e3faecf9de165adececbf77cbe54a8cbe373a91c`
**ARVO / OSS-Fuzz local ID:** arvo:46499
**ARVO repro:** `docker run -it n132/arvo:46499-vul arvo`

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
