/*
 * Joint driver: printable-string-oob-read × serializer-int32-oob-write
 *
 * Shared buffer: buf[MAX_BUF] is the character buffer for printable-string
 * AND the serializer output buffer (buffer.data) for serializer-int32.
 *
 * printable-string OOB: ps_len > MAX_BUF (ps_len is a symbolic scalar).
 * serializer OOB: fmt=CSV, buff_diff>=11, csv_pre separator branch,
 *                 snprintf sink reached.
 *
 * These conditions impose independent constraints: ps_len on a separate
 * scalar, serializer on struct fields, both sharing only the buffer pointer.
 */

#include <klee/klee.h>
#include <assert.h>
#include <stdint.h>
#include <string.h>

#define MAX_BUF 256

int predicate_printable_string_oob_read(char * const, size_t, size_t);

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

  /* --- printable-string setup --- */
  size_t ps_len;
  klee_make_symbolic(&ps_len, sizeof(ps_len), "ps_len");
  klee_assume(ps_len > MAX_BUF);
  klee_assume(ps_len <= (size_t)MAX_BUF * 2);

  /* --- serializer-int32 setup --- */
  ser_private ser;
  memset(&ser, 0, sizeof(ser));

  ser.fmt              = ser_fmt_csv;
  ser.buffer.data      = buf;
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

  int r_ps  = predicate_printable_string_oob_read((char *)buf, ps_len,
                                                   MAX_BUF);
  int r_ser = predicate_serializer_int32_oob_write(sser, "k", value);

  klee_assume(r_ps == 1 && r_ser == 1);
  klee_assert(0 && "REACHED_BOTH_printable-string-oob-read_serializer-int32-oob-write");
  return 0;
}
