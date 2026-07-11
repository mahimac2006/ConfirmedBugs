# nDPI 4.2 — TINC dissector heap-buffer-overflow (READ 1)

- **Project / version:** nDPI 4.2 (git tag `4.2`, repo `ntop/nDPI`)
- **Bug id:** `arvo:46499` — oss-fuzz issue 46499
- **Vulnerable file:** `src/lib/protocols/tinc.c`
- **Function:** `ndpi_check_tinc`
- **Crash type:** Heap-buffer-overflow, READ of size 1
- **Sink line (at tag 4.2):** `src/lib/protocols/tinc.c:105`
- **Fix commit:** `06a0abb6fdf8fb7a446ef5aafdf2c7d24608977f` ("TINC: fix invalid memory read (#1512)")

## Signature and parameters

```c
static void ndpi_check_tinc(struct ndpi_detection_module_struct *ndpi_struct,
                            struct ndpi_flow_struct *flow);
```

- `ndpi_struct` — nDPI detection module context. The current packet is in
  `ndpi_struct->packet` (a `struct ndpi_packet_struct`); the TINC cache is
  `ndpi_struct->tinc_cache`.
- `flow` — per-flow detection state. Holds `flow->tinc_state` (the small state
  machine 0..3) and `flow->tinc_cache_entry`.

## Packet-buffer fields used

The function reads the payload through `struct ndpi_packet_struct`:

- `packet->payload` — pointer to the start of the L4 payload (aliased locally as
  `const u_int8_t *packet_payload`).
- `packet->payload_packet_len` — length of that payload buffer (aliased locally
  as `u_int32_t payload_len`).

It also touches `packet->udp`, `packet->tcp`, `packet->iph`, and uses the nDPI
macros `NDPI_EXCLUDE_PROTO` (→ `ndpi_exclude_protocol`, `ndpi_define.h.in:241`)
and `NDPI_LOG_INFO` (`ndpi_define.h.in:207`).

## The bug

In the TCP branch, `case 2/3` handles a TINC "1 ..." control message. After
validating a `"1 "` prefix it walks an index `i` through the payload across four
space-separated numeric groups and then an alphanumeric token — but the loops
and the trailing check dereference `packet_payload[i]` **without ever comparing
`i` against `payload_len`**. A crafted TCP payload (`> 11` bytes, starting `"1 "`,
with valid digit groups but no terminating `'\n'`) drives `i` past the end of the
heap payload buffer. ASan reported the 1-byte over-read 0 bytes past a 54-byte
region.

### Exact crash sink (`tinc.c:105`)

```c
while((packet_payload[i] >= '0' && packet_payload[i] <= '9') ||
      (packet_payload[i] >= 'A' && packet_payload[i] <= 'Z')) {
  i++;
}
```

The same unchecked pattern exists on the digit loop (line 93), the space check
(line 97), and the `'\n'` check (line 110); the fix hardens all of them. Line 105
is the exact frame reported by AddressSanitizer.

The complete verbatim pre-patch function and its minimal dependency closure
(macros, `struct tinc_cache_entry`, relevant `struct ndpi_packet_struct` /
module / flow fields, `TINC_CACHE_MAX_SIZE`, helper prototypes) are in
[`vulnerable/ndpi_check_tinc.c`](vulnerable/ndpi_check_tinc.c).

## The fix

The patch adds an `i < payload_len` guard to every `packet_payload[i]` access in
the `case 2/3` branch. Full diff in [`patch/fix.patch`](patch/fix.patch). Key hunk:

```diff
-	  while(packet_payload[i] >= '0' && packet_payload[i] <= '9') {
+	  while(i < payload_len && packet_payload[i] >= '0' && packet_payload[i] <= '9') {
 	    i++;
 	  }
-	  if(packet_payload[i++] == ' ') {
+	  if(i < payload_len && packet_payload[i++] == ' ') {
...
-	while((packet_payload[i] >= '0' && packet_payload[i] <= '9') ||
-	      (packet_payload[i] >= 'A' && packet_payload[i] <= 'Z')) {
+	while(i < payload_len &&
+	      ((packet_payload[i] >= '0' && packet_payload[i] <= '9') ||
+	       (packet_payload[i] >= 'A' && packet_payload[i] <= 'Z'))) {
 	  i++;
 	}
-	if(packet_payload[i] == '\n') {
+	if(i < payload_len && packet_payload[i] == '\n') {
```

## Harness / invocation call chain

Fuzz target: `fuzz/fuzz_ndpi_reader.c`. The fuzzer writes the raw input to a
temporary pcap file, opens it with `pcap_open_offline`, and feeds each packet
into the workflow:

```
LLVMFuzzerTestOneInput (fuzz/fuzz_ndpi_reader.c:41)
  -> ndpi_workflow_process_packet (example/reader_util.c:2093)
    -> packet_processing (example/reader_util.c:1519)
      -> ndpi_detection_process_packet (src/lib/ndpi_main.c:5924)
        -> ndpi_check_flow_func (ndpi_main.c:5103)
          -> check_ndpi_tcp_flow_func (ndpi_main.c:5084)
            -> check_ndpi_detection_func (ndpi_main.c:5013)
              -> ndpi_search_tinc (src/lib/protocols/tinc.c:135)
                -> ndpi_check_tinc (tinc.c) --> OOB read at tinc.c:105
```
