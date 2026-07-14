/*
 * Joint driver: tinc-oob-read × serializer-int32-oob-write
 *
 * Shared buffer: buf[MAX_BUF] is the TINC TCP payload AND the serializer
 * output buffer (buffer.data) for serializer-int32.
 *
 * The two predicates parse/write into buf from different ends:
 *   tinc reads bytes sequentially from buf[0] onward.
 *   serializer writes starting at buf[size_used] onward.
 * Shared constraint: both see the same MAX_BUF bytes at the same address.
 */

#include <klee/klee.h>
#include <assert.h>
#include <stdint.h>
#include <string.h>

#define MAX_BUF 256

/* tinc types */
struct tinc_packet { const uint8_t *payload; uint16_t payload_packet_len;
                     int tcp_non_null; };
struct tinc_flow   { uint8_t tinc_state; };
struct tinc_module { struct tinc_packet packet; };

int predicate_tinc_oob_read(struct tinc_module *, struct tinc_flow *);

/* serializer-int32 types */
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

  /* --- tinc setup --- */
  struct tinc_module tinc_mod;
  struct tinc_flow   tinc_flow;
  memset(&tinc_mod,  0, sizeof(tinc_mod));
  memset(&tinc_flow, 0, sizeof(tinc_flow));

  tinc_mod.packet.payload            = buf;
  tinc_mod.packet.payload_packet_len = MAX_BUF;
  tinc_mod.packet.tcp_non_null       = 1;
  tinc_flow.tinc_state               = 2;

  /* --- serializer-int32 setup --- */
  ser_private ser;
  memset(&ser, 0, sizeof(ser));

  ser.fmt              = ser_fmt_csv;
  ser.buffer.data      = buf;      /* same shared buffer */
  ser.csv_separator[0] = ',';
  ser.buffer.size      = MAX_BUF;

  uint32_t su;
  klee_make_symbolic(&su, sizeof(su), "size_used");
  klee_assume(su > 0);
  klee_assume(su + 11u <= MAX_BUF);
  ser.status.buffer.size_used = su;
  ser.status.flags            = 0;

  int32_t value;
  klee_make_symbolic(&value, sizeof(value), "value");
  klee_assume((uint32_t)value >= 1000000000u);

  ser_serializer *sser = (ser_serializer *)&ser;

  int r_tinc = predicate_tinc_oob_read(&tinc_mod, &tinc_flow);
  int r_ser  = predicate_serializer_int32_oob_write(sser, "k", value);

  klee_assume(r_tinc == 1 && r_ser == 1);
  klee_assert(0 && "REACHED_BOTH_tinc-oob-read_serializer-int32-oob-write");
  return 0;
}
