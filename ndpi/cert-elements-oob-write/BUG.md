# nDPI 4.2 — Out-of-bounds WRITE in `processCertificateElements` (arvo:57317)

## Summary
| | |
|---|---|
| Project | nDPI (`ntop/nDPI`) |
| Version / tag | 4.2 |
| CyberGym / OSS-Fuzz id | `arvo:57317` (OSS-Fuzz issue 57317) |
| Vulnerable file | `src/lib/protocols/tls.c` |
| Function | `static void processCertificateElements(...)` |
| Definition lines (tag 4.2) | 317 – 679 |
| Crash sink line (tag 4.2) | **593** |
| Crash type | Out-of-bounds WRITE (SEGV, ASan WRITE access) |
| Fix commit | `ddb9aa0f95ba263361b9be2ba0a122ea1e001be9` ("TLS: fix parsing of certificate elements (#1910)") |

## Signature and parameters
```c
static void processCertificateElements(struct ndpi_detection_module_struct *ndpi_struct,
                                       struct ndpi_flow_struct *flow,
                                       u_int16_t p_offset, u_int16_t certificate_len);
```
- `ndpi_struct` — nDPI engine/detection context; holds `packet` (the bytes being dissected).
- `flow` — per-flow state; destination for parsed certificate fields (`server_names`, `issuerDN`, `subjectDN`, validity dates, ...).
- `p_offset` — start offset into `packet->payload` for this certificate block.
- `certificate_len` — length of the certificate block to parse.

## The exact crash sink (tag 4.2, line 593)
```c
flow->protos.tls_quic.server_names[flow->protos.tls_quic.server_names_len] = ',';
```
This is inside the subjectAltName (`55 1D 11`, OID 2.5.29.17) handling, in the `else` branch that
appends a newly parsed `dNSName` to the accumulated comma-separated `server_names` list:

```c
if(flow->protos.tls_quic.server_names == NULL)
  flow->protos.tls_quic.server_names = ndpi_strdup(dNSName),
    flow->protos.tls_quic.server_names_len = strlen(dNSName);
else {
  u_int16_t newstr_len = flow->protos.tls_quic.server_names_len + dNSName_len + 1;   /* 16-bit: can WRAP */
  char *newstr = (char*)ndpi_realloc(flow->protos.tls_quic.server_names,
                                     flow->protos.tls_quic.server_names_len+1, newstr_len+1);
  if(newstr) {
    flow->protos.tls_quic.server_names = newstr;
    flow->protos.tls_quic.server_names[flow->protos.tls_quic.server_names_len] = ',';   /* <-- OOB WRITE */
    strncpy(&flow->protos.tls_quic.server_names[flow->protos.tls_quic.server_names_len+1],
            dNSName, dNSName_len+1);
    flow->protos.tls_quic.server_names[newstr_len] = '\0';
    flow->protos.tls_quic.server_names_len = newstr_len;
  }
}
```

## Root cause
The loop index `i` (and the pointer-walk arithmetic that advances it while parsing the
subjectAltName SEQUENCE) is declared `u_int16_t`:
```c
u_int16_t num_found = 0, i;
```
During subjectAltName parsing `i` is advanced by attacker-controlled length bytes:
```c
i += (packet->payload[i] & 0x80) ? (packet->payload[i] & 0x7F) : 0; /* BIT STRING / SEQUENCE length */
...
i += len;                                                           /* per dNSName */
```
Because `i` is only 16-bit, crafted certificate bytes make it wrap / mis-advance so the parser keeps
appending dNSName entries and `server_names_len` grows large. The concatenation size is then computed
in a 16-bit temporary `newstr_len = server_names_len + dNSName_len + 1`, which **wraps around 65535**.
`ndpi_realloc()` is then asked for the wrapped (too-small) `newstr_len+1` bytes, but the next statement
writes at the OLD, larger index `server_names_len`, landing outside the freshly (smaller) allocated
buffer — the out-of-bounds WRITE at line 593.

## The fix
The patch changes `i` from `u_int16_t` to `int32_t`, so the subjectAltName pointer walk can no longer
wrap within the 16-bit range and the runaway `server_names` accumulation / 16-bit `newstr_len` overflow
is avoided. See `patch/fix.patch` (exact `git show ddb9aa0f95ba -- src/lib/protocols/tls.c`):

```diff
@@ -364,7 +364,8 @@ void processCertificateElements(struct ndpi_detection_module_struct *ndpi_struct,
 				struct ndpi_flow_struct *flow,
 				u_int16_t p_offset, u_int16_t certificate_len) {
   struct ndpi_packet_struct *packet = &ndpi_struct->packet;
-  u_int16_t num_found = 0, i;
+  u_int16_t num_found = 0;
+  int32_t i;
   char buffer[64] = { '\0' }, rdnSeqBuf[2048];
   u_int rdn_len = 0;
```

## Complete function
The full verbatim pre-patch function (with the minimal compile/reason dependency closure — the
`ndpi_packet_struct`, `flow->protos.tls_quic` fields, macros, and helper prototypes/inlines) is in
[`vulnerable/processCertificateElements.c`](vulnerable/processCertificateElements.c). The sink line is
marked `<-- OOB WRITE (tag-4.2 line 593)`.

## Harness / invocation call chain
Harness at tag 4.2: `fuzz/fuzz_ndpi_reader.c`.

```
LLVMFuzzerTestOneInput(Data, Size)            fuzz/fuzz_ndpi_reader.c:41
  -> bufferToFile(pcap_path, Data, Size)      (writes fuzz input as a pcap file)
  -> pcap_open_offline(pcap_path) + read loop
  -> ndpi_detection_process_packet(...)       (per packet)
     -> ndpi_search_tls_wrapper                tls.c:2352  (registered dissector callback)
        -> ndpi_search_tls_tcp                 tls.c:873
           -> ndpi_search_tls_tcp_memory / processTLSBlock   tls.c:810 (reassembled handshake)
              -> processCertificate            tls.c:684
                 -> processCertificateElements tls.c:790 (call) / 317 (definition)  <-- OOB WRITE at 593
```

Note: The original OSS-Fuzz 57317 report reproduced this via the dedicated
`fuzz/fuzz_tls_certificate.c` harness (ASan frame `tls.c:682` in the fix-commit's parent). That harness
was added **after** tag 4.2 and is not present at this tag; at 4.2 the identical sink is reachable
through `fuzz/fuzz_ndpi_reader.c` by feeding a crafted TLS Certificate handshake.
```
```
