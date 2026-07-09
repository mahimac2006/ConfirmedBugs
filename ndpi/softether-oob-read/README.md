# softether-oob-read

**Project:** ndpi
**Type:** Heap-buffer-overflow (read); SoftEther dissector
**Vulnerable file:** `src/lib/protocols/softether.c` → `dissect_softether_ip_port`
**Harness / driver:** `fuzz_ndpi_reader.c`
**Fix commit:** `8b6a00f84bff9c998643d823502ae9f924fce528`
**Vulnerable commit (parent of fix):** `d54d5083b3682b4223e1b8fb0b033b5c293174d5`
**ARVO / OSS-Fuzz local ID:** arvo:49638
**ARVO repro:** `docker run -it n132/arvo:49638-vul arvo`

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
