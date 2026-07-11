# libxml2 — `xmlParseTryOrFinish` heap-buffer-overflow READ (arvo:55980)

## Summary
| | |
|---|---|
| Project | libxml2 |
| Version | 2.10.4 |
| Tag | `v2.10.4` (`9ddf8ecda72891d1bbe8517be1a59153e8ae944d`) |
| CyberGym id | `arvo:55980` |
| Vulnerable file | `parser.c` |
| Function | `xmlParseTryOrFinish` (static) |
| Function span (at tag) | `parser.c:11201`–`parser.c:12175` |
| Crash sink line (at tag) | `parser.c:12168` (statement spans 12168–12170) |
| Crash type | Heap-buffer-overflow READ 1 |
| Fix commit | `5d55315e32b34af7070d38060ccf9a60941b9696` |

## Signature & parameters
```c
static int xmlParseTryOrFinish(xmlParserCtxtPtr ctxt, int terminate);
```
- **`ctxt`** — the XML push-parser context. The sink reads the raw input buffer
  through `ctxt->input->cur` (a `const xmlChar *` into a heap buffer);
  `ctxt->input->end` marks the end of valid bytes.
- **`terminate`** — non-zero when the caller signals the final chunk of a
  progressive/push parse.

## The vulnerable statement (crash sink)
At the `encoding_error:` label near the end of the function (`parser.c:12168`):

```c
encoding_error:
    {
        char buffer[150];

	snprintf(buffer, 149, "Bytes: 0x%02X 0x%02X 0x%02X 0x%02X\n",
			ctxt->input->cur[0], ctxt->input->cur[1],
			ctxt->input->cur[2], ctxt->input->cur[3]);
	__xmlErrEncoding(ctxt, XML_ERR_INVALID_CHAR,
		     "Input is not proper UTF-8, indicate encoding !\n%s",
		     BAD_CAST buffer, NULL);
    }
    return(0);
```

## Root cause
The function jumps to `encoding_error:` from two sites inside the
`XML_PARSER_CDATA_SECTION` handling (`parser.c:11674` and `parser.c:11697`).
Both first advance the cursor and then jump:

```c
tmp = xmlCheckCdataPush(ctxt->input->cur, base, 1);
if ((tmp < 0) || (tmp != base)) {
    tmp = -tmp;
    ctxt->input->cur += tmp;   /* advance to the offending byte */
    goto encoding_error;       /* then read cur[0..3] unconditionally */
}
```

At `encoding_error:` the `snprintf` unconditionally dereferences
`ctxt->input->cur[0]`, `[1]`, `[2]` and `[3]`. When fewer than 4 bytes remain
between `ctxt->input->cur` and `ctxt->input->end`, reading `cur[1..3]` accesses
memory past the end of the heap-allocated input buffer — a heap-buffer-overflow
READ of size 1.

## The fix
`5d55315e32b34af7070d38060ccf9a60941b9696` — *"parser: Fix OOB read when
formatting error message"*. It bounds-checks the remaining bytes before
formatting, and emits a generic message when fewer than 4 bytes are available.
See `patch/fix.patch`:

```diff
 encoding_error:
-    {
+    if (ctxt->input->end - ctxt->input->cur < 4) {
+	__xmlErrEncoding(ctxt, XML_ERR_INVALID_CHAR,
+		     "Input is not proper UTF-8, indicate encoding !\n",
+		     NULL, NULL);
+    } else {
         char buffer[150];
 
 	snprintf(buffer, 149, "Bytes: 0x%02X 0x%02X 0x%02X 0x%02X\n",
```

The vulnerable code (the unguarded `snprintf` reading `cur[0..3]`) is confirmed
present verbatim at `v2.10.4`.

## Harness / invocation call chain
Reached through the libxml2 **push parser** fuzz target `fuzz/xml.c`:

```
LLVMFuzzerTestOneInput(data, size)                 fuzz/xml.c
  -> xmlCreatePushParserCtxt(NULL, NULL, NULL, 0, docUrl)
  -> for each chunk: xmlParseChunk(ctxt, docBuffer + consumed, chunkSize, 0)
  -> xmlParseChunk(ctxt, NULL, 0, 1)               /* terminate */
       -> xmlParseTryOrFinish(ctxt, terminate)     parser.c:11201
            -> case XML_PARSER_CDATA_SECTION:
               xmlCheckCdataPush(...) < 0
               ctxt->input->cur += tmp;
               goto encoding_error;
            -> encoding_error:
               snprintf(... cur[0], cur[1], cur[2], cur[3] ...)   <-- OOB READ
```

## Files in this dossier
- `vulnerable/xmlParseTryOrFinish.c` — dependency closure (macros/typedefs/
  `struct _xmlParserInput`/helper prototypes) + the COMPLETE verbatim pre-patch
  function body.
- `patch/fix.patch` — exact `git show 5d55315e32b3 -- parser.c` output.
- `metadata.json` — machine-readable summary.
