/*
 * Joint driver: cert-elements-oob-write × serializer-int32-oob-write
 *
 * Shared buffer: buf[MAX_BUF] is the TLS certificate payload for
 * cert-elements AND the serializer output buffer (buffer.data) for
 * serializer-int32.
 *
 * For serializer-int32 the OOB condition requires:
 *   fmt == CSV, buff_diff >= 11, csv_pre fires separator branch (size_used>0),
 *   then snprintf is called with needed=10 → return 1.
 * The serializer struct fields (size, size_used, fmt, flags) are scalar and
 * are constrained independently; only buffer.data is coupled to buf.
 */

#include <klee/klee.h>
#include <assert.h>
#include <stdint.h>
#include <string.h>

#define MAX_BUF 256

/* cert-elements types */
struct ce_tls_quic { char *server_names; uint16_t server_names_len; };
struct ce_flow   { union { struct ce_tls_quic tls_quic; } protos; };
struct ce_packet { const uint8_t *payload; uint16_t payload_packet_len; };
struct ce_module { struct ce_packet packet; };

int predicate_cert_elements_oob_write(struct ce_module *, struct ce_flow *,
                                       uint16_t, uint16_t);

/* serializer-int32 types (must match predicate_serializer-int32-oob-write.c) */
typedef enum { ser_fmt_unknown=0, ser_fmt_tlv, ser_fmt_json, ser_fmt_csv }
  ser_format;
#define SER_STATUS_EOR (1u<<2)
typedef struct { uint32_t size_used; } ser_buf_status;
typedef struct { uint32_t flags; ser_buf_status buffer; } ser_status;
typedef struct { uint32_t size; uint8_t *data; } ser_buffer;
typedef struct {
  ser_status status; ser_buffer buffer; ser_format fmt; char csv_separator[2];
} ser_private;
typedef struct { char c[sizeof(ser_private)]; } ser_serializer;

int predicate_serializer_int32_oob_write(ser_serializer *, const char *,
                                          int32_t);

int main(void) {
  uint8_t buf[MAX_BUF];
  klee_make_symbolic(buf, sizeof(buf), "buf");

  /* --- cert-elements setup --- */
  struct ce_module ce_mod;
  struct ce_flow   ce_flow;
  memset(&ce_mod,  0, sizeof(ce_mod));
  memset(&ce_flow, 0, sizeof(ce_flow));

  ce_mod.packet.payload            = buf;
  ce_mod.packet.payload_packet_len = MAX_BUF;

  static char existing_names[1];
  ce_flow.protos.tls_quic.server_names = existing_names;

  uint16_t srv_len;
  klee_make_symbolic(&srv_len, sizeof(srv_len), "srv_len");
  klee_assume(srv_len >= 65534u);
  ce_flow.protos.tls_quic.server_names_len = srv_len;

  uint16_t p_offset;
  klee_make_symbolic(&p_offset, sizeof(p_offset), "p_offset");
  klee_assume(p_offset < MAX_BUF);

  /* --- serializer-int32 setup --- */
  ser_private ser;
  memset(&ser, 0, sizeof(ser));

  ser.fmt                      = ser_fmt_csv;
  ser.buffer.data              = buf;          /* shared buffer */
  ser.csv_separator[0]         = ',';

  /* size and size_used: need buff_diff = size - size_used >= 11,
   * and size_used > 0 so csv_pre fires the separator branch */
  uint32_t su;
  klee_make_symbolic(&su, sizeof(su), "size_used");
  klee_assume(su > 0);
  klee_assume(su + 11u <= MAX_BUF);           /* buff_diff >= 11 within buffer */
  ser.status.buffer.size_used  = su;
  ser.buffer.size              = MAX_BUF;
  ser.status.flags             = 0;           /* no EOR */

  int32_t value;
  klee_make_symbolic(&value, sizeof(value), "value");
  /* 10-digit unsigned: value interpreted as uint32_t >= 1000000000 */
  klee_assume((uint32_t)value >= 1000000000u);

  ser_serializer *sser = (ser_serializer *)&ser;

  int r_ce  = predicate_cert_elements_oob_write(&ce_mod, &ce_flow,
                                                 p_offset, MAX_BUF);
  int r_ser = predicate_serializer_int32_oob_write(sser, "k", value);

  klee_assume(r_ce == 1 && r_ser == 1);
  klee_assert(0 && "REACHED_BOTH_cert-elements-oob-write_serializer-int32-oob-write");
  return 0;
}
