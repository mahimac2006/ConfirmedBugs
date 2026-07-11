# libxml2 2.10.4 — Global-buffer-overflow READ in `htmlParseSystemLiteral`

## Identity
- **Project / version:** libxml2 2.10.4 (tag `v2.10.4`, commit `9ddf8ecda72891d1bbe8517be1a59153e8ae944d`)
- **CyberGym / ARVO id:** `arvo:57469`
- **Upstream fix:** `1061537efdf3874c91fd50d18f98c4b8a3518e52`
  ("malloc-fail: Fix buffer overread with HTML doctype declarations", OSS-Fuzz #344)
- **Vulnerable file:** `HTMLparser.c`
- **Function:** `htmlParseSystemLiteral`
- **Crash type:** Global-buffer-overflow **READ** (over-read inside `xmlStrndup`)

## Location
- **Sink line (at tag v2.10.4):** `HTMLparser.c:3004`
- **Function definition:** `HTMLparser.c:2969-3007`

## Signature & parameters
```c
static xmlChar *htmlParseSystemLiteral(htmlParserCtxtPtr ctxt);
```
- `ctxt` — the HTML parser context. The bytes being parsed live in
  `ctxt->input->base` (buffer start) through `ctxt->input->end`, with
  `ctxt->input->cur` as the current read cursor. `BASE_PTR` expands to
  `ctxt->input->base`, `CUR_PTR` to `ctxt->input->cur`.

## Exact crash sink
```c
ret = xmlStrndup((BASE_PTR+startPosition), len);   /* HTMLparser.c:3004 */
```
`xmlStrndup(const xmlChar *cur, int len)` copies `len` bytes starting at
`cur = BASE_PTR + startPosition`. When `BASE_PTR` no longer points at the
buffer for which `startPosition`/`len` were computed, this copy reads past the
end of the (reallocated / shrunk) buffer — the ASan global/heap over-read.

## Root cause
`startPosition = CUR_PTR - BASE_PTR` is captured right after the opening quote,
*before* the literal is scanned. In the vulnerable ordering the closing quote is
consumed with `NEXT;` (`xmlNextChar`) **before** the `xmlStrndup` read:
```c
} else {
    NEXT;                                     /* consume closing quote -> may GROW buffer */
    if (err == 0)
        ret = xmlStrndup((BASE_PTR+startPosition), len);   /* read from stale BASE_PTR */
}
```
`xmlNextChar` can invoke `xmlParserInputGrow`, which may reallocate or shift the
input buffer (`ctxt->input->base`). After that, `BASE_PTR + startPosition` may
point outside the valid `[base, end)` region, so the subsequent `xmlStrndup`
over-reads. This is exercised most readily under the malloc-fail / chunked push
conditions from OSS-Fuzz.

The fix simply reorders the two statements so the read happens while the
pointers are still valid, and only then advances:
```c
} else {
    if (err == 0)
        ret = xmlStrndup((BASE_PTR+startPosition), len);
    NEXT;
}
```
(The sibling function `htmlParsePubidLiteral` had the identical bug and is fixed
the same way in the same commit.)

## Vulnerable function
The complete verbatim pre-patch body, together with the minimal dependency
closure (cursor macros `CUR`/`NEXT`/`CUR_PTR`/`BASE_PTR`, `IS_CHAR_CH` /
`xmlIsChar_ch`, the relevant `xmlParserErrors` codes, the `_xmlParserInput`
field layout, and prototypes for `xmlStrndup`, `xmlNextChar`, `htmlParseErr`,
`htmlParseErrInt`), is in
[`vulnerable/htmlParseSystemLiteral.c`](vulnerable/htmlParseSystemLiteral.c).

## Patch
See [`patch/fix.patch`](patch/fix.patch) (exact `git show 1061537efdf3 -- HTMLparser.c`):
```diff
@@ -3010,9 +3010,9 @@ htmlParseSystemLiteral(htmlParserCtxtPtr ctxt) {
         htmlParseErr(ctxt, XML_ERR_LITERAL_NOT_FINISHED,
                      "Unfinished SystemLiteral\n", NULL, NULL);
     } else {
-        NEXT;
         if (err == 0)
             ret = xmlStrndup((BASE_PTR+startPosition), len);
+        NEXT;
     }
```

## Harness / invocation call chain
Fuzz harness: `fuzz/html.c` → `LLVMFuzzerTestOneInput`.

```
LLVMFuzzerTestOneInput(data, size)                 fuzz/html.c:24
  opts = xmlFuzzReadInt(); docBuffer = xmlFuzzReadRemaining(&docSize);
  doc = htmlReadMemory(docBuffer, docSize, NULL, NULL, opts)   fuzz/html.c:45
    -> htmlDoRead
      -> htmlParseDocument
        -> htmlParseDocTypeDecl            HTMLparser.c:3664 (called ~4980)
          -> htmlParseExternalID           HTMLparser.c:3296 (called 3694)
            -> htmlParseSystemLiteral      HTMLparser.c:2970 (called 3308 / 3330)
              -> xmlStrndup(BASE_PTR+startPosition, len)   <-- SINK, HTMLparser.c:3004
```

The same harness also drives the push/chunked parser
(`htmlCreatePushParserCtxt` + `htmlParseChunk`, fuzz/html.c:59-71), which reaches
`htmlParseSystemLiteral` through `htmlParseTryOrFinish → htmlParseDocTypeDecl →
htmlParseExternalID`. The chunked path makes buffer growth/reallocation during
`NEXT` easy to trigger.

An input reaching the sink is an HTML `<!DOCTYPE ... SYSTEM "..."` (or `PUBLIC
"..." "..."`) declaration whose system-literal URI ends at a buffer boundary so
the trailing `NEXT` forces a grow/realloc before the `xmlStrndup` copy.
