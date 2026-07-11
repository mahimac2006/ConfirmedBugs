/*
 * nDPI 4.2 — arvo:63179 — Heap-buffer-overflow WRITE
 * File:     src/lib/ndpi_serializer.c
 * Function: ndpi_serialize_string_int32   (CSV serialization branch)
 * Sink:     src/lib/ndpi_serializer.c:1289  (at tag 4.2)
 *             rc = snprintf((char*)&serializer->buffer.data[serializer->status.buffer.size_used],
 *                           needed, "%u", value);
 *
 * Signature:
 *   int ndpi_serialize_string_int32(ndpi_serializer *_serializer,
 *                                   const char *key, int32_t value);
 * Parameters:
 *   _serializer : opaque serializer handle (cast to ndpi_private_serializer*)
 *   key         : field name (ignored in CSV format)
 *   value       : the 32-bit integer to append to the CSV row
 *
 * Bug: in the CSV branch the output buffer is grown to `needed = 11` bytes ("10 digits +
 * separator"), then `needed--` (=10). ndpi_serialize_csv_pre() first writes the 1-byte CSV
 * separator (advancing size_used), consuming part of the reservation, and the value can be up
 * to 10 characters ("4294967295") plus the NUL that snprintf always writes. The remaining
 * space is therefore too small and the snprintf write runs one byte past the heap buffer.
 * The fix (commit 30fc89e556e5) reserves `needed = 12` (digits + separator + '\0'), recomputes
 * buff_diff AFTER the separator, and caps snprintf with the real remaining space.
 *
 * This extract is the complete pre-patch function verbatim from `git show 4.2:src/lib/ndpi_serializer.c`,
 * plus the directly-required helper (ndpi_serialize_csv_pre), the serializer structs/fields the
 * sink writes into, and the status-flag / format constants. Deep engine helpers
 * (ndpi_extend_serializer_buffer, ndpi_serializer_header_string, ndpi_serialize_binary_int32)
 * are prototyped only — their bodies are not needed to reason about the overflow.
 */

#include <stdint.h>
#include <stdio.h>
#include <string.h>

typedef uint8_t  u_int8_t;
typedef uint16_t u_int16_t;
typedef uint32_t u_int32_t;
typedef unsigned int u_int;

/* --- serialization format + status flags (src/include/ndpi_typedefs.h @ 4.2) --- */
typedef enum {
  ndpi_serialization_format_unknown = 0,
  ndpi_serialization_format_tlv,
  ndpi_serialization_format_json,
  ndpi_serialization_format_csv
} ndpi_serialization_format;

#define NDPI_SERIALIZER_STATUS_EOR      (1 << 2)   /* end-of-record            */
#define NDPI_SERIALIZER_STATUS_HDR_DONE (1 << 7)   /* CSV header already written */

/* --- serializer structs (src/include/ndpi_typedefs.h:1441-1465 @ 4.2) --- */
typedef struct {
  u_int32_t size_used;
} ndpi_private_serializer_buffer_status;

typedef struct {
  u_int32_t flags;
  ndpi_private_serializer_buffer_status buffer;
  ndpi_private_serializer_buffer_status header;
} ndpi_private_serializer_status;

typedef struct {
  u_int32_t initial_size;
  u_int32_t size;      /* total allocated size of `data`      */
  u_int8_t *data;      /* the heap output buffer (overflowed) */
} ndpi_private_serializer_buffer;

typedef struct {
  ndpi_private_serializer_status status;
  ndpi_private_serializer_buffer buffer;
  ndpi_private_serializer_buffer header;
  ndpi_serialization_format fmt;
  char csv_separator[2];
  u_int8_t has_snapshot;
  ndpi_private_serializer_status snapshot;
} ndpi_private_serializer;

/* opaque public handle */
typedef struct { char c[sizeof(ndpi_private_serializer)]; } ndpi_serializer;

/* --- deep helpers: prototypes only (bodies elsewhere in ndpi_serializer.c) --- */
int  ndpi_extend_serializer_buffer(ndpi_private_serializer_buffer *buffer, u_int32_t min_len);
int  ndpi_serializer_header_string(ndpi_private_serializer *serializer, const char *key, u_int16_t klen);
int  ndpi_serialize_binary_int32(ndpi_serializer *_serializer, const char *key, u_int16_t klen, int32_t value);

/* --- required helper: writes the CSV separator, advancing size_used (src/lib/ndpi_serializer.c:677 @ 4.2) --- */
static inline void ndpi_serialize_csv_pre(ndpi_private_serializer *serializer) {
  if(serializer->status.flags & NDPI_SERIALIZER_STATUS_EOR) {
    serializer->status.flags &= ~NDPI_SERIALIZER_STATUS_EOR;
  } else if (serializer->status.buffer.size_used == 0) {
    /* nothing to do */
  } else {
    if(serializer->buffer.size > serializer->status.buffer.size_used)
      serializer->buffer.data[serializer->status.buffer.size_used] = serializer->csv_separator[0];

    serializer->status.buffer.size_used++;   /* consumes one of the reserved bytes */
  }
}

/* ============================================================================
 * COMPLETE pre-patch vulnerable function, verbatim from 4.2:src/lib/ndpi_serializer.c
 * (only the OPTIMIZE_CSV_SERIALIZATION branch is compiled in the vulnerable build)
 * ==========================================================================*/
#define OPTIMIZE_CSV_SERIALIZATION

int ndpi_serialize_string_int32(ndpi_serializer *_serializer,
				const char *key, int32_t value) {
#ifdef OPTIMIZE_CSV_SERIALIZATION
  ndpi_private_serializer *serializer = (ndpi_private_serializer*)_serializer;

  if(serializer->fmt == ndpi_serialization_format_csv) {
    /* Key is ignored */
    u_int32_t buff_diff = serializer->buffer.size - serializer->status.buffer.size_used;
    u_int16_t needed = 11 /* 10 (billion) + CVS separator */;
    int rc;

    if(buff_diff < needed) {
      if(ndpi_extend_serializer_buffer(&serializer->buffer, needed - buff_diff) < 0)
	return(-1);
      else
	buff_diff = serializer->buffer.size - serializer->status.buffer.size_used;
    }

    if(!(serializer->status.flags & NDPI_SERIALIZER_STATUS_HDR_DONE)) {
      if(ndpi_serializer_header_string(serializer, key, strlen(key)) < 0)
	return(-1);
    }

    ndpi_serialize_csv_pre(serializer);
    needed--;

    rc = snprintf((char*)&serializer->buffer.data[serializer->status.buffer.size_used],
    needed, "%u", value);   /* <-- SINK: OOB WRITE past serializer->buffer.data */

    if(rc > 0)
      serializer->status.buffer.size_used += rc;
    return(0);
  } else
#endif
  return(ndpi_serialize_binary_int32(_serializer, key, strlen(key), value));
}
