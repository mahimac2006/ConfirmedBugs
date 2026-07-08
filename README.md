# ConfirmedBugs

A curated set of **confirmed, real-world vulnerabilities** selected from the
[CyberGym](https://www.cybergym.io/cybergym/) benchmark (Berkeley/Sunblaze) for use in
vulnerability-chaining research experiments.

CyberGym contains **1,507 vulnerabilities across 188 projects**, drawn largely from the
[ARVO](https://github.com/n132/ARVO-Meta) reproducible-vulnerability dataset, which is itself
built on [OSS-Fuzz](https://github.com/google/oss-fuzz). Every task is keyed by an
`arvo:<id>` or `oss-fuzz:<id>` identifier and ships the pre-patch codebase, post-patch
codebase, the ground-truth OSS-Fuzz PoC, and the ground-truth patch.

## Selected projects

Two projects were selected (Binutils excluded per requirements). Both are compact,
self-contained C codebases with a small number of well-defined fuzz harnesses, public
per-bug crash reports, and upstream fix commits — the properties that make them practical
for building reproducible exploit chains.

| Project | Bugs in CyberGym | Bugs documented here | Index |
|---|---|---|---|
| mruby   | 42 | 13 | [`mruby/vulnerabilities.md`](./mruby/vulnerabilities.md) — one subfolder per bug |
| libxml2 | 38 | 13 | [`libxml2/vulnerabilities.md`](./libxml2/vulnerabilities.md) — one subfolder per bug |

Each bug folder contains the fuzz **driver**, OSS-Fuzz **stubs**, pre-patch **vulnerable** source,
the upstream **patch**, and PoC fetch instructions. Run `python3 scripts/populate_bugs.py` to
refresh from upstream.

### Why these two

Excluding Binutils (103 bugs), CyberGym's leaders are Ghostscript (88), FFmpeg (69),
OpenSC (59), Wireshark (51), librawspeed (46), **mruby (42)**, **libxml2 (38)**,
Harfbuzz (35), MuPDF (35), ndpi (34)…

- **mruby** — a compact, self-contained C interpreter. Nearly all bugs are triggered by a
  **single harness** (`mruby_fuzzer` → `mrb_load_nstring`), where the fuzz input *is* a Ruby
  source string. Memory-corruption bugs (UAF, heap-overflow, type confusion) all live in one
  process/address space, which is ideal for leak → corrupt → control chains, and multiple
  triggers can be combined in one Ruby PoC.
- **libxml2** — a compact, self-contained, widely-embedded C library. Its bugs span distinct
  code paths (parser, DTD validation, XPath/XPointer, XInclude, schema) reachable through a
  small set of focused harnesses, giving a diverse set of multi-stage primitives with real
  downstream targets.

Both are single-language, single-binary, with publicly documented crash reports and fix
commits, so every entry is independently reproducible.

## Reproducibility

For each bug: pull the ARVO/CyberGym task by its `oss-fuzz:<id>` / `arvo:<id>` identifier
(`tasks.json` in the CyberGym data on HuggingFace `sunblaze-ucb/cybergym`), which bundles the
pre-patch tree, the fuzz target, the ground-truth PoC, and the patch. ARVO's
[`n132/ARVO-Meta`](https://github.com/n132/ARVO-Meta) per-bug JSON gives the OSS-Fuzz local ID
→ fix-commit mapping and the exact fuzz-target name, which cross-checks the file/function/commit
columns in each project file.

## Sources

- [CyberGym paper (arXiv 2506.02548)](https://arxiv.org/html/2506.02548v2)
- [CyberGym site](https://www.cybergym.io/cybergym/) · [Berkeley RDI blog](https://rdi.berkeley.edu/blog/cybergym/)
- [CyberGym GitHub](https://github.com/sunblaze-ucb/cybergym) · [ARVO-Meta](https://github.com/n132/ARVO-Meta) · [OSS-Fuzz](https://github.com/google/oss-fuzz)
- [mruby](https://github.com/mruby/mruby) · [libxml2](https://gitlab.gnome.org/GNOME/libxml2)
