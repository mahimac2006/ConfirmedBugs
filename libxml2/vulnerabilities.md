# libxml2 — confirmed vulnerabilities

Source project: <https://gitlab.gnome.org/GNOME/libxml2> · CyberGym count: **38** · Documented here: **13**

Each bug lives in its own subfolder with **`driver/`**, **`stubs/`**, **`vulnerable/`**, **`patch/`**, and **`poc/`** (see e.g. [`CVE-2017-9047/`](./CVE-2017-9047/)).

## Per-bug folder layout

```
libxml2/<bug-id>/
├── README.md          # summary + reproduce steps
├── metadata.json      # structured fields (fix commit, harness, ARVO id, …)
├── driver/            # fuzz harness + shared fuzz helpers
├── stubs/             # OSS-Fuzz build.sh, Dockerfile, project.yaml
├── vulnerable/        # pre-patch source of the crashing file
├── patch/fix.patch    # upstream fix as unified diff
└── poc/               # ground-truth crash input (or fetch instructions)
```

Re-populate or refresh from upstream with `python3 scripts/populate_bugs.py`.

## Drivers / harnesses

libxml2's OSS-Fuzz fuzz targets live in the repo's **`fuzz/`** directory, each an
`LLVMFuzzerTestOneInput`:

- `fuzz/xml.c` — XML parser
- `fuzz/html.c` — HTML parser
- `fuzz/reader.c` — xmlReader API
- `fuzz/xpath.c` — XPath / XPointer
- `fuzz/schema.c` — XSD schema
- `fuzz/valid.c` — DTD validation
- `fuzz/regexp.c`, `fuzz/uri.c`, `fuzz/api.c` — other paths

Shared helpers (`xmlFuzz*` input readers, option handling) are in `fuzz/fuzz.c`.

- Harnesses: <https://gitlab.gnome.org/GNOME/libxml2/-/tree/master/fuzz>
- OSS-Fuzz project dir: <https://github.com/google/oss-fuzz/tree/master/projects/libxml2>

## Vulnerabilities

| # | Bug ID | Folder | Type / trigger | Vulnerable file → function | Harness |
|---|---|---|---|---|---|
| 1 | CVE-2017-9047 | [`CVE-2017-9047/`](./CVE-2017-9047/) | Stack buffer overflow (write); malformed DTD element-content decl | `valid.c` → `xmlSnprintfElementContent` | `valid.c` / `xml.c` |
| 2 | CVE-2017-9048 | [`CVE-2017-9048/`](./CVE-2017-9048/) | Stack buffer overflow (companion `strcat` without length check) | `valid.c` → `xmlSnprintfElementContent` | `valid.c` / `xml.c` |
| 3 | CVE-2016-1762 | [`CVE-2016-1762/`](./CVE-2016-1762/) | Heap buffer over-read after parse error | `parser.c` → `xmlNextChar` | `xml.c` |
| 4 | CVE-2016-5131 | [`CVE-2016-5131/`](./CVE-2016-5131/) | Use-after-free via XPointer `range-to` | `xpointer.c` → `xmlXPtrRangeToFunction` | `xpath.c` |
| 5 | CVE-2017-8872 | [`CVE-2017-8872/`](./CVE-2017-8872/) | Heap buffer over-read in progressive HTML push parse | `HTMLparser.c` → `htmlParseTryOrFinish` | `html.c` |
| 6 | CVE-2020-24977 | [`CVE-2020-24977/`](./CVE-2020-24977/) | Global/heap over-read; truncated UTF-8 in error formatting | `xmllint.c` → `xmlHTMLEncodeSend` (CLI) | xmllint `--htmlout` |
| 7 | CVE-2021-3517 | [`CVE-2021-3517/`](./CVE-2021-3517/) | Heap-buffer-overflow (read); invalid UTF-8 attribute content | `entities.c` → `xmlEncodeEntitiesInternal` | `xml.c` |
| 8 | CVE-2021-3518 | [`CVE-2021-3518/`](./CVE-2021-3518/) | Use-after-free processing crafted XInclude | `xinclude.c` → `xmlXIncludeDoProcess` | `xml.c` |
| 9 | CVE-2021-3537 | [`CVE-2021-3537/`](./CVE-2021-3537/) | NULL-deref (DoS); errors not propagated in mixed content | `valid.c` → `xmlValidBuildAContentModel` | `xml.c` / `valid.c` |
| 10 | CVE-2022-29824 | [`CVE-2022-29824/`](./CVE-2022-29824/) | Integer overflow → OOB write in buffer grow | `buf.c` → `xmlBufAdd` | `xml.c` |
| 11 | CVE-2022-40303 | [`CVE-2022-40303/`](./CVE-2022-40303/) | Integer overflow with `XML_PARSE_HUGE` on >2³² char names | `parser.c` → `xmlParseNameComplex` | `xml.c` |
| 12 | CVE-2022-40304 | [`CVE-2022-40304/`](./CVE-2022-40304/) | UAF / double-free; bad hash for empty dict strings | `dict.c` → `xmlDictComputeFastKey` | `xml.c` |
| 13 | CVE-2023-28484 | [`CVE-2023-28484/`](./CVE-2023-28484/) | NULL-deref (DoS) parsing invalid XSD schema | `xmlschemas.c` → `xmlSchemaFixupComplexType` | `schema.c` |

## Accuracy caveats

- **Crash site vs. fix site.** For several bugs the *vulnerable file* column is the crash
  location, while the upstream **fix** lands in a different file holding the root cause:
  **#5** (crash `HTMLparser.c` → fix `parser.c`, "Free input buffer in xmlHaltParser"),
  **#9** (crash `valid.c` → fix `parser.c`, error propagation), **#12** (crash `dict.c` → fix
  `entities.c`). Each such `metadata.json` records both `file` (crash) and `fix_file` (patch).
- **#1 and #2** are two distinct overflows in the same function fixed by **one** commit
  (`932cc989…`) — treat as one patch if you need independent fixes.
- **#6 (CVE-2020-24977)** is reached through the **`xmllint` CLI** (`--htmlout`), *not* a
  `fuzz/*.c` harness. Many databases mis-attribute it to `entities.c` — that is **#7**.
- Harness attribution is a best-effort mapping; confirm per-bug via ARVO-Meta or `metadata.json`.
