# kerberos-oob-read

**Project:** ndpi
**Type:** Heap-buffer-overflow (read); Kerberos dissector
**Vulnerable file:** `src/lib/protocols/kerberos.c` → `ndpi_search_kerberos`
**Harness / driver:** `fuzz_ndpi_reader.c`
**Fix commit:** `7051acc0b5b8046b6415a454a2eff4fffa18396b`
**Vulnerable commit (parent of fix):** `580859a47d164b64c95de2da6df2d49332af4875`
**ARVO / OSS-Fuzz local ID:** arvo:23021
**ARVO repro:** `docker run -it n132/arvo:23021-vul arvo`

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
