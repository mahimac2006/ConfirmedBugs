# nDPI 4.2 — Heap-buffer-overflow READ in `ndpi_strncasestr`

## Identification
- **Project / version:** nDPI (ntop/nDPI), tag **4.2** (tagged 2022-02-01)
- **Bug id:** `arvo:44482` (oss-fuzz issue 44482)
- **Vulnerable file:** `src/lib/ndpi_main.c`
- **Function:** `ndpi_strncasestr`
- **Vulnerable line (at tag 4.2):** **7109** (the loop-bound expression); the
  actual over-read is executed in the loop body at lines 7110 (`str1[0]`) and
  7112 (`strncasecmp(str1, str2, str2_len)`).
- **Crash type:** Heap-buffer-overflow READ
- **Fix commit:** `f229068fd3844cd2fd458e5ae76c20ec059c8d3e` ("Fix memory access
  in ndpi_strnstr() (#1438)", 2022-02-09)

## Signature and parameters
```c
const char *ndpi_strncasestr(const char *str1, const char *str2, size_t len);
```
- `str1` — haystack buffer to search; only `len` bytes are valid/owned (not
  guaranteed NUL-terminated).
- `str2` — NUL-terminated needle to search for, case-insensitively.
- `len`  — number of valid bytes in `str1` (upper bound passed to `strnlen`).

## The vulnerable function (verbatim, `src/lib/ndpi_main.c:7104-7118` @ 4.2)
```c
/*
 * Same as ndpi_strnstr but case-insensitive
 */
const char * ndpi_strncasestr(const char *str1, const char *str2, size_t len) {
  size_t str1_len = strnlen(str1, len);
  size_t str2_len = strlen(str2);
  size_t i;

  for(i = 0; i < (str1_len - str2_len + 1); i++){
    if(str1[0] == '\0')
      return NULL;
    else if(strncasecmp(str1, str2, str2_len) == 0)
      return(str1);

    str1++;
  }

  return NULL;
}
```
(Also captured, with its dependency notes, in `vulnerable/ndpi_strncasestr.c`.)

## Exact crash sink
```c
for(i = 0; i < (str1_len - str2_len + 1); i++){   /* ndpi_main.c:7109 */
```
`i`, `str1_len`, and `str2_len` are all unsigned `size_t`. When the haystack is
shorter than the needle (`str1_len < str2_len`), `str1_len - str2_len + 1`
underflows to a huge unsigned value. The loop then runs far past the end of the
`len`-byte `str1` buffer, dereferencing `str1[0]` and reading `str2_len` bytes
via `strncasecmp(str1, str2, str2_len)` out of bounds — a heap-buffer-overflow
READ.

## Dependency closure
The function references only libc string routines and no project-specific
types/macros/globals/helpers:
- `strnlen`, `strlen` — `<string.h>`
- `strncasecmp` — POSIX `<strings.h>`. On platforms lacking it, nDPI provides a
  charmap-based fallback in `src/lib/ndpi_utils.c`
  (`int strncasecmp(const char *s1, const char *s2, size_t n)`), which does a
  table lookup `cm[*us1]` and is the concrete over-read site when the loop
  over-iterates.
- No `ndpi_toupper` (does not exist in the tree) or other helper is used.

## The fix (see `patch/fix.patch`)
```diff
 const char * ndpi_strncasestr(const char *str1, const char *str2, size_t len) {
   size_t str1_len = strnlen(str1, len);
   size_t str2_len = strlen(str2);
-  size_t i;
+  int i; /* signed! */

-  for(i = 0; i < (str1_len - str2_len + 1); i++){
+  for(i = 0; i < (int)(str1_len - str2_len + 1); i++){
```
Making `i` signed and casting the bound to `(int)` means that when
`str1_len < str2_len` the bound is `<= 0`, so the loop body never executes.

## Harness / invocation call chain
- **Harness:** `fuzz/fuzz_ndpi_reader.c`, `LLVMFuzzerTestOneInput`.
- **Chain:** input bytes → written to a temp pcap (`bufferToFile`) →
  `pcap_open_offline` → per packet `ndpi_workflow_process_packet` →
  `ndpi_detection_process_packet` → HTTP dissector `ndpi_search_http_tcp` /
  `check_content_type_and_change_protocol` (`src/lib/protocols/http.c`) → on an
  HTTP `Authorization:` header,
  `ndpi_strncasestr(packet->authorization_line.ptr, "Basic"/"Digest",
  packet->authorization_line.len)`. An authorization value shorter than the
  5/6-byte needle yields `str1_len < str2_len` and triggers the underflow.

### Caveat
The vulnerable `ndpi_strncasestr` body is present **verbatim and unfixed at tag
4.2**. However, the specific reachable caller shown above
(`authorization_line` → `ndpi_strncasestr`) was introduced by commit
`0dd5ac89f` on **2022-02-03**, i.e. two days **after** the 4.2 tag
(2022-02-01); at exactly 4.2 the function has no in-tree caller (the HTTP
dissector at 4.2 uses `strncasecmp` directly). The oss-fuzz crash 44482 was
found and fixed on master immediately after 4.2 (fix dated 2022-02-09). The
extracted vulnerable predicate itself is exactly the 4.2 code.
