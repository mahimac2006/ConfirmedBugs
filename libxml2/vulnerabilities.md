# libxml2 — 5 CyberGym vulnerabilities, all from **version 2.10.4**

All five bugs below are CyberGym/ARVO tasks whose vulnerable code is **present and unfixed in the
exact same release, libxml2 2.10.4** (git tag `v2.10.4`), and all were fixed in 2.11.0. Each was
verified by extracting the function from the `v2.10.4` tree and confirming the vulnerable statement
is present (candidates whose buggy code was a later master-only regression — e.g. arvo:53613 — were
dropped). They are all **input-buffer over-reads in the HTML/XML parser**, reachable through the
`fuzz/html.c` / `fuzz/xml.c` harnesses.

Per-bug folder: `metadata.json`, `BUG.md` (full dossier), `vulnerable/<function>.c` (complete
pre-patch function + the macros/structs/typedefs/globals/helpers for standalone reasoning),
`patch/fix.patch` (the upstream fix diff).

| # | Bug ID | CyberGym | File | Function | Line @2.10.4 | Type |
|---|---|---|---|---|---|---|
| 1 | [htmlCurrentChar-oob-read](./htmlCurrentChar-oob-read/) | `arvo:56964` | HTMLparser.c | `htmlCurrentChar` | :474 | global-buffer-overflow read (truncated UTF-8 lead) |
| 2 | [htmlParseSystemLiteral-oob-read](./htmlParseSystemLiteral-oob-read/) | `arvo:57469` | HTMLparser.c | `htmlParseSystemLiteral` | :3004 | global-buffer-overflow read (via `xmlStrndup`) |
| 3 | [htmlParseHTMLAttribute-uninit-read](./htmlParseHTMLAttribute-uninit-read/) | `arvo:57223` | HTMLparser.c | `htmlParseHTMLAttribute` | :2843 | uninitialized/over-read via `CUR_CHAR`→`htmlCurrentChar` |
| 4 | [xmlParseTryOrFinish-oob-read](./xmlParseTryOrFinish-oob-read/) | `arvo:55980` | parser.c | `xmlParseTryOrFinish` | :12168 | heap-buffer-overflow read (encoding-error diagnostic) |
| 5 | [xmlSwitchInputEncoding-overread](./xmlSwitchInputEncoding-overread/) | `arvo:57521` | parserInternals.c | `xmlSwitchInputEncodingInt` | :1124 | over-read root cause: parser not halted on encoding-switch failure |

## Notes / honest caveats
- **#1 and #3 share a sink:** `htmlParseHTMLAttribute` (#3) over-reads *inside* `htmlCurrentChar`
  (#1) via the `CUR_CHAR` macro — a natural shared-input composition pair.
- **#5 is the root cause of #3:** its fix message is literally *"Halt parser if switching encodings
  fails — Avoids buffer overread in `htmlParseHTMLAttribute`."* At 2.10.4 the vulnerable pattern
  lives in the static `xmlSwitchInputEncodingInt`; the upstream fix diff targets a later-refactored
  form (documented in the folder's `BUG.md`).
- Line numbers are within the **v2.10.4** source (not the fix commit's tree).
- `arvo`/`oss-fuzz` local ids cross-check each `fix_commit` against `n132/ARVO-Meta`.
