# libxml2 2.10.4 — `htmlParseHTMLAttribute` use-of-uninitialized-value (input over-read)

- **Project / version:** libxml2, 2.10.4 (tag `v2.10.4`, commit `9ddf8ecda72891d1bbe8517be1a59153e8ae944d`)
- **Bug id:** `arvo:57223` (OSS-Fuzz, upstream issue GNOME/libxml2#344)
- **Vulnerable file:** `HTMLparser.c`
- **Function:** `htmlParseHTMLAttribute`
- **Vulnerable line (at tag):** `HTMLparser.c:2843`
- **Crash type:** Use-of-uninitialized-value (input over-read)
- **Fix commit:** `62f199ed7d1c99999030810495bd12fd5b86fee1`

## Signature and parameters

```c
static xmlChar *
htmlParseHTMLAttribute(htmlParserCtxtPtr ctxt, const xmlChar stop);
```

- `ctxt` — the HTML parser context. Holds `ctxt->input` (the input buffer with
  `cur`/`end` pointers) and `ctxt->instate` (parser state; `XML_PARSER_EOF = -1`
  once input is exhausted / an error was raised).
- `stop` — a char "stop value" (the closing quote). If `0`, the attribute value
  ends at the first blank character or `>`.

Returns the parsed attribute value string, or `NULL`.

## The crash sink

Inside the main `while` loop, in the plain-character `else` branch:

```c
c = CUR_CHAR(l);        /* HTMLparser.c:2843  <== SINK */
```

`CUR_CHAR(l)` expands to `htmlCurrentChar(ctxt, &l)` (`HTMLparser.c:326`).

Root cause: earlier in the same loop, on `&`-entity handling, the parser calls
`htmlParseCharRef` / `htmlParseEntityRef`. On a malloc failure (the class of bug
OSS-Fuzz was fuzzing) or malformed entity these can push the context into
`XML_PARSER_EOF`, but the loop condition `(CUR != 0) && (CUR != stop)` keeps
iterating and re-enters `htmlCurrentChar`. On the multi-byte UTF-8 path
(`HTMLparser.c:400`), `htmlCurrentChar` dereferences `cur[1]`, `cur[2]`,
`cur[3]` — one or more bytes past the end of the (uninitialized / over-read)
input buffer — yielding a use-of-uninitialized-value. Because the function then
keeps going and returns a non-NULL buffer, callers treat the malformed/EOF state
as a valid parse.

The full pre-patch function body is inlined verbatim (with the dependency
closure — macros, typedefs, `htmlEntityDesc` struct, `growBuffer`, and helper
prototypes) in [`vulnerable/htmlParseHTMLAttribute.c`](vulnerable/htmlParseHTMLAttribute.c).

## The fix

The fix (`62f199ed7d1c`, "malloc-fail: Add error check in
htmlParseHTMLAttribute") makes the function honor the EOF/error state by
bailing out with `NULL` immediately after reading the current char:

```diff
@@ -2844,6 +2844,10 @@ htmlParseHTMLAttribute(htmlParserCtxtPtr ctxt, const xmlChar stop) {
 		out = &buffer[indx];
 	    }
 	    c = CUR_CHAR(l);
+            if (ctxt->instate == XML_PARSER_EOF) {
+                xmlFree(buffer);
+                return(NULL);
+            }
 	    if      (c <    0x80)
 		    { *out++  = c;                bits= -6; }
 	    else if (c <   0x800)
```

Full patch: [`patch/fix.patch`](patch/fix.patch).

## Harness / invocation call chain (CyberGym)

Harness: `fuzz/html.c`. The fuzzer reads an options int then the remaining input
buffer and hands it to `htmlReadMemory`:

```
LLVMFuzzerTestOneInput            fuzz/html.c:25
  -> htmlReadMemory(docBuffer, docSize, NULL, NULL, opts)   fuzz/html.c:45
    -> htmlParseDocument
      -> htmlParseContentInternal / htmlParseElementInternal
        -> htmlParseStartTag        HTMLparser.c:3947
          -> htmlParseAttribute     HTMLparser.c:3746 (call at :4038)
            -> htmlParseAttValue    HTMLparser.c:2926 (val = htmlParseAttValue)
              -> htmlParseHTMLAttribute   HTMLparser.c:2736 (calls at 2931/2939/2949)
                -> CUR_CHAR(l) => htmlCurrentChar   HTMLparser.c:400
                   *** over-reads input buffer at SINK HTMLparser.c:2843 ***
```
