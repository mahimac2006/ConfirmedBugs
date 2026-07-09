# tls-clienthello-oob-read

**Project:** ndpi
**Type:** Heap-buffer-overflow (read); TLS ClientHello parse
**Vulnerable file:** `src/lib/protocols/tls.c` → `processClientServerHello`
**Harness / driver:** `fuzz_ndpi_reader.c`
**Fix commit:** `308f71a6e80751eae09f08cdfdc996a77510e5a5`
**Vulnerable commit (parent of fix):** `d886a6107fd05a9e41de8ec3414cb4b353bda10e`
**ARVO / OSS-Fuzz local ID:** arvo:65362
**ARVO repro:** `docker run -it n132/arvo:65362-vul arvo`

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
