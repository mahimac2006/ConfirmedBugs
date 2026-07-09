# bittorrent-oob-read

**Project:** ndpi
**Type:** Heap-buffer-overflow (read); BitTorrent dissector
**Vulnerable file:** `src/lib/protocols/bittorrent.c` → `ndpi_search_bittorrent`
**Harness / driver:** `fuzz_ndpi_reader.c`
**Fix commit:** `f95bdaf625a540cbd040508bfbb8808223f97aed`
**Vulnerable commit (parent of fix):** `edb8165ab9b70cf8c152b6a3dfbec9c8a4853eef`
**ARVO / OSS-Fuzz local ID:** arvo:55218
**ARVO repro:** `docker run -it n132/arvo:55218-vul arvo`

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
