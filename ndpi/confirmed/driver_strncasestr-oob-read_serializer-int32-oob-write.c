/*
 * Joint driver: strncasestr-oob-read × serializer-int32-oob-write
 *
 * Shared buffer: buf[MAX_BUF] is the haystack (str1) for strncasestr AND
 * the serializer output buffer (buffer.data) for serializer-int32.
 *
 * strncasestr OOB: strnlen(buf, MAX_BUF) < strlen(needle).
 * serializer OOB: fmt=CSV, buff_diff>=11, csv_pre separator branch, then
 *                 snprintf sink reached.
 *
 * Note: serializer writes into buf starting at buf[size_used]; strncasestr
 * reads buf as a string.  The shared constraint is only the physical buffer;
 * the byte content satisfies both predicates' guards simultaneously.
 */

#include <klee/klee.h>
#include <assert.h>
#include <stdint.h>
#include <string.h>

#define MAX_BUF 256

int predicate_strncasestr_oob_read(const char *, const char *, size_t);

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

  /* needle longer than any strnlen(buf, MAX_BUF) */
  char needle[MAX_BUF + 2];
  klee_make_symbolic(needle, sizeof(needle), "needle");
  needle[MAX_BUF + 1] = '\0';
  for (int k = 0; k < MAX_BUF; k++)
    klee_assume(needle[k] != '\0');

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

  int r_str = predicate_strncasestr_oob_read((const char *)buf, needle,
                                              MAX_BUF);
  int r_ser = predicate_serializer_int32_oob_write(sser, "k", value);

  klee_assume(r_str == 1 && r_ser == 1);
  klee_assert(0 && "REACHED_BOTH_strncasestr-oob-read_serializer-int32-oob-write");
  return 0;
}
