/*
 * Predicate: serializer-int32-oob-write
 * Source: vulnerable/ndpi_serialize_string_int32.c (nDPI 4.2, ndpi_serializer.c)
 * Sink: snprintf at ndpi_serializer.c:1289 (OOB WRITE past buffer.data).
 *
 * The bug: in the CSV branch, needed=11 bytes are reserved (10 digits +
 * separator).  ndpi_serialize_csv_pre() writes the separator and increments
 * size_used, consuming one reserved byte.  needed-- → 10.  For a 10-digit
 * value (≥ 1 000 000 000), snprintf returns rc=10; size_used += rc advances
 * size_used to buffer.size+1, so the next write is one byte past the heap
 * buffer end.  ASAN attributes the overflow to the snprintf call itself.
 *
 * Return 1 iff:
 *   - fmt == ndpi_serialization_format_csv
 *   - buffer already has buff_diff >= 11 (we model the no-extension path)
 *   - ndpi_serialize_csv_pre fires the separator branch (not EOR, size_used>0)
 *   - After needed-- = 10, the snprintf call is reached (the sink)
 *
 * Struct types are prefixed "ser_" to avoid conflicts in joint drivers.
 *
 * Trace returning 1: fmt=csv, size=20, size_used=9, flags=0, data non-NULL
 *   → buff_diff=11 >= 11, csv_pre writes separator at data[9], size_used=10,
 *   needed=10, snprintf called → return 1.
 *
 * Trace returning 0: fmt=ndpi_serialization_format_json → return 0.
 */

#include <stdint.h>
#include <string.h>

typedef uint8_t  u_int8_t;
typedef uint16_t u_int16_t;
typedef uint32_t u_int32_t;

typedef enum {
  ser_fmt_unknown = 0,
  ser_fmt_tlv,
  ser_fmt_json,
  ser_fmt_csv
} ser_format;

#define SER_STATUS_EOR      (1u << 2)
#define SER_STATUS_HDR_DONE (1u << 7)

typedef struct { u_int32_t size_used; } ser_buf_status;

typedef struct {
  u_int32_t flags;
  ser_buf_status buffer;
} ser_status;

typedef struct {
  u_int32_t size;
  u_int8_t *data;
} ser_buffer;

typedef struct {
  ser_status  status;
  ser_buffer  buffer;
  ser_format  fmt;
  char        csv_separator[2];
} ser_private;

typedef struct { char c[sizeof(ser_private)]; } ser_serializer;

int predicate_serializer_int32_oob_write(ser_serializer *_serializer,
                                          const char     *key,
                                          int32_t         value)
{
  ser_private *serializer = (ser_private *)_serializer;

  if (serializer->fmt != ser_fmt_csv) return 0;

  /* Guard: buffer.data must be non-NULL */
  if (serializer->buffer.data == NULL) return 0;

  /* Guard: size_used must not already exceed buffer.size */
  if (serializer->status.buffer.size_used > serializer->buffer.size) return 0;

  u_int32_t buff_diff =
    serializer->buffer.size - serializer->status.buffer.size_used;
  u_int16_t needed = 11;

  /* Model: skip ndpi_extend_serializer_buffer (external, side-effecting).
   * We capture only the path where the buffer is already large enough. */
  if (buff_diff < needed) return 0;

  /*
   * Simulate ndpi_serialize_csv_pre: if not EOR and size_used > 0,
   * the separator is written and size_used is incremented.
   * We do not actually write (no side effects in predicate), but track
   * the new size_used for the buff_diff recheck.
   */
  u_int32_t size_used_after = serializer->status.buffer.size_used;
  if (!(serializer->status.flags & SER_STATUS_EOR) && size_used_after > 0) {
    /* Guard: separator write position must be in bounds */
    if (size_used_after >= serializer->buffer.size) return 0;
    size_used_after++; /* separator consumed one byte */
  }

  needed--; /* = 10 */

  /* Guard: snprintf destination must be within buffer */
  if (size_used_after >= serializer->buffer.size) return 0;

  /*
   * SINK: snprintf(&data[size_used_after], 10, "%u", value)
   * With a 10-digit value the return rc=10, size_used += 10 pushes
   * size_used to buffer.size (one past the last valid index), so the
   * NEXT serializer write is OOB.  ASAN attributes the error here.
   */
  (void)key; (void)value; (void)needed;
  return 1;
}
