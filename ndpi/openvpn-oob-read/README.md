# openvpn-oob-read

**Project:** ndpi
**Type:** Heap-buffer-overflow (read); OpenVPN dissector
**Vulnerable file:** `src/lib/protocols/openvpn.c` → `ndpi_search_openvpn`
**Harness / driver:** `fuzz_ndpi_reader.c`
**Fix commit:** `8e7b1ea7a136cc4e4aa9880072ec2d69900a825e`
**Vulnerable commit (parent of fix):** `e90c5c7c3223d033467aa359d8b1e264f961fde1`
**ARVO / OSS-Fuzz local ID:** arvo:22244
**ARVO repro:** `docker run -it n132/arvo:22244-vul arvo`

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
