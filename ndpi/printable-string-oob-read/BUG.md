# nDPI 4.2 — `ndpi_is_printable_string` buffer over-read (arvo:44280)

## Summary
- **Project / version:** nDPI (`ntop/nDPI`), tag **4.2**
- **CyberGym / oss-fuzz id:** `arvo:44280` (oss-fuzz issue 44280)
- **Vulnerable file:** `src/lib/ndpi_utils.c`
- **Function:** `ndpi_is_printable_string`
- **Vulnerable line (at tag 4.2):** `src/lib/ndpi_utils.c:2200`
- **Crash type:** Heap-buffer-overflow READ / use-of-uninitialized-value (MemorySanitizer) — over-read of the string buffer.
- **Fix commit:** `ff38d4b98008d3b10dbdee0330e9b8c62a99ce9a` — *"TLS: fix parsing of certificate elements (#1435)"*

## The function (complete, verbatim from tag 4.2)
See `vulnerable/ndpi_is_printable_string.c` for the standalone-compilable extract with its dependency closure. Body:

```c
int ndpi_is_printable_string(char * const str, size_t len) {
  int retval = 1;

  for (size_t i = 0; i < len; ++i) {
    if (ndpi_isprint(str[i]) == 0) {     /* <-- SINK: ndpi_utils.c:2200 */
      str[i] = '?';
      retval = 0;
    }
  }

  return retval;
}
```

### Signature and parameters
`int ndpi_is_printable_string(char * const str, size_t len)`
- `str` — buffer scanned; non-printable bytes rewritten in place to `'?'`. In the crashing path this is the 2048-byte on-stack `rdnSeqBuf` in `processCertificateElements`.
- `len` — number of bytes to inspect. In the crashing path this is `rdn_len`.

### Dependency closure
Only one project symbol is referenced, inlined verbatim in the extract:
```c
/* src/include/ndpi_utils.h:28 */
#define ndpi_isprint(ch) ((ch) >= 0x20 && (ch) <= 0x7e)
```

## Exact crash sink
`src/lib/ndpi_utils.c:2200`
```c
if (ndpi_isprint(str[i]) == 0) {
```
For `i` in `[0, len)` the loop reads `str[i]`. `len` (`rdn_len`) is attacker-influenced and can exceed the number of bytes actually written into `str`, so the read runs past the valid/initialized region of the buffer.

## Root cause (in the caller, `src/lib/protocols/tls.c`)
`ndpi_is_printable_string` itself is correct — it scans exactly `len` bytes. The defect is that `len` is wrong:

1. `extractRDNSequence()` appends to `rdnSeqBuf` with
   `int rc = snprintf(&rdnSeqBuf[*rdnSeqBuf_offset], rdnSeqBuf_len-(*rdnSeqBuf_offset), ...)`
   and then does `if(rc > 0) (*rdnSeqBuf_offset) += rc;`. `snprintf` returns the number of bytes that *would* have been written; on truncation `rc` exceeds the space actually available, so `rdn_len` (`rdnSeqBuf_offset`) is advanced past the bytes really present in `rdnSeqBuf`.
2. `processCertificateElements()` then calls
   `ndpi_is_printable_string(rdnSeqBuf, rdn_len)` with that over-large `rdn_len`, driving the over-read at ndpi_utils.c:2200.
3. Separately, the scan loop `for(i = p_offset; i < certificate_len; i++)` probes `payload[i]`, `payload[i+1]`, `payload[i+2]`, which can read past the packet payload near the end of the range.

## The fix
See `patch/fix.patch` (exact `git show ff38d4b98008 -- src/lib/protocols/tls.c`). Two guards are added in `tls.c`:

```diff
@@ extractRDNSequence @@
       "%s%s=%s", (*rdnSeqBuf_offset > 0) ? ", " : "",
       label, buffer);

+    if(rc > 0 && ((u_int)rc > rdnSeqBuf_len-(*rdnSeqBuf_offset)))
+      return -1; /* Truncated; not enough buffer */
     if(rc > 0)
       (*rdnSeqBuf_offset) += rc;
```
```diff
@@ processCertificateElements @@
   /* Check after handshake protocol header (5 bytes) and message header (4 bytes) */
-  for(i = p_offset; i < certificate_len; i++) {
+  for(i = p_offset; i < certificate_len - 2; i++) {
```

- The first hunk stops `rdn_len` from ever advancing past `rdnSeqBuf` on `snprintf` truncation (so the `len` passed to `ndpi_is_printable_string` stays within valid data).
- The second hunk bounds the OID probe loop by `- 2` so `payload[i+1]`/`payload[i+2]` stay in range.

## Harness / invocation call chain
Harness: `fuzz/fuzz_ndpi_reader.c`. The fuzzer writes the input bytes to a temp file, opens them as a pcap, and processes each packet:

```
LLVMFuzzerTestOneInput
  -> pcap_open_offline(input treated as a pcap capture)
  -> ndpi_workflow_process_packet
  -> ndpi_detection_process_packet / check_ndpi_detection_func   (ndpi_main.c)
  -> ndpi_search_tls_wrapper                                     (tls.c:2367)
  -> ndpi_search_tls_tcp                                         (tls.c:973)
  -> processTLSBlock                                             (tls.c:844)
  -> processCertificate                                         (tls.c:790)
  -> processCertificateElements                                 (tls.c:400)
  -> ndpi_is_printable_string(rdnSeqBuf, rdn_len)               (ndpi_utils.c:2200)  <-- crash
```
A crafted TLS certificate handshake in a single packet drives certificate-element parsing so that `rdn_len` is advanced past the data in `rdnSeqBuf`, triggering the over-read.
