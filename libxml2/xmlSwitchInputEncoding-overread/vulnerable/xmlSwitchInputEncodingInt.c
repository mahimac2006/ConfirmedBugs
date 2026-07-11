/*
 * Project:  libxml2, version 2.10.4 (tag v2.10.4)
 * Bug id:   arvo:57521  (root cause of arvo:57223 in htmlParseHTMLAttribute)
 * Sink:     parserInternals.c:1124  (the unguarded `return (-1);`)
 *
 * Signature:
 *   static int
 *   xmlSwitchInputEncodingInt(xmlParserCtxtPtr ctxt, xmlParserInputPtr input,
 *                             xmlCharEncodingHandlerPtr handler, int len);
 *
 * Parameters:
 *   ctxt    - the parser context (state machine driving the parse)
 *   input   - the input stream whose encoding is being switched
 *   handler - the encoding handler to install on input->buf
 *   len     - number of bytes to convert for the first line, or -1 for "all"
 *
 * Exact crash sink (parserInternals.c:1124, inside `if (nbchars < 0)`):
 *
 *       return (-1);
 *
 * Root cause:
 *   When xmlCharEncInput()/xmlCharEncFirstLineInput() reports an encoding
 *   error (nbchars < 0), the function logs the error via xmlErrInternal and
 *   returns -1 but does NOT halt the parser (no xmlHaltParser(ctxt) call).
 *   Because the parser is not halted, higher-level HTML parsing routines keep
 *   consuming the (now inconsistent / partially-converted) input buffer and
 *   read past its end. The over-read ultimately manifests as a
 *   use-of-uninitialized-value / buffer over-read in htmlParseHTMLAttribute
 *   (a separate crash, arvo:57223). This function is the ROOT CAUSE.
 *
 * Fix (commit 0e42adce77a9c115402d7f24d8d3b0130f841ed1):
 *   Insert `xmlHaltParser(ctxt);` immediately before the `return (-1);` in the
 *   `if (nbchars < 0)` block so that no further input is consumed after an
 *   encoding-switch failure.
 *
 * ---------------------------------------------------------------------------
 * Minimal dependency closure (types / helpers referenced by the function).
 * Deep helpers are only prototyped; source file noted in comments.
 * ---------------------------------------------------------------------------
 */

/* --- opaque/forward types (see include/libxml/{parser,tree,encoding}.h) --- */
typedef struct _xmlParserCtxt          xmlParserCtxt;
typedef xmlParserCtxt                 *xmlParserCtxtPtr;
typedef struct _xmlParserInput         xmlParserInput;
typedef xmlParserInput                *xmlParserInputPtr;
typedef struct _xmlParserInputBuffer   xmlParserInputBuffer;
typedef xmlParserInputBuffer          *xmlParserInputBufferPtr;
typedef struct _xmlCharEncodingHandler xmlCharEncodingHandler;
typedef xmlCharEncodingHandler        *xmlCharEncodingHandlerPtr;
typedef struct _xmlBuf                 xmlBuf;
typedef xmlBuf                        *xmlBufPtr;
typedef unsigned char                  xmlChar;

/* XML_CHAR_ENCODING_UTF8 is a member of enum xmlCharEncoding
 * (include/libxml/encoding.h). Value 1 at v2.10.4. */
#define XML_CHAR_ENCODING_UTF8 1

/*
 * Only the fields touched by this function are listed; the real structs are
 * much larger. See include/libxml/parser.h and tree.h.
 */
struct _xmlParserInputBuffer {
    xmlCharEncodingHandlerPtr encoder; /* installed encoding handler        */
    xmlBufPtr buffer;                  /* decoded/output buffer             */
    xmlBufPtr raw;                     /* raw (undecoded) input buffer      */
    unsigned long rawconsumed;         /* raw bytes already consumed        */
    /* ... */
};

struct _xmlParserInput {
    xmlParserInputBufferPtr buf;       /* backing input buffer              */
    const xmlChar *base;               /* base of the current window        */
    const xmlChar *cur;                /* current read pointer              */
    /* ... */
};

struct _xmlParserCtxt {
    int charset;                       /* current char encoding of the ctxt */
    int html;                          /* non-zero when parsing HTML        */
    xmlParserInputPtr input;           /* current input stream              */
    /* ... */
};

/* --- helper prototypes (deep helpers; source file noted) --- */
/* buf.h / buf.c */
xmlBufPtr xmlBufCreate(void);
size_t    xmlBufUse(const xmlBufPtr buf);
int       xmlBufIsEmpty(const xmlBufPtr buf);
size_t    xmlBufShrink(xmlBufPtr buf, size_t len);
int       xmlBufResetInput(xmlBufPtr buf, xmlParserInputPtr input);
/* enc.h / encoding.c */
int       xmlCharEncInput(xmlParserInputBufferPtr input, int flush);
int       xmlCharEncFirstLineInput(xmlParserInputBufferPtr input, int len);
/* encoding.h / encoding.c */
int       xmlCharEncCloseFunc(xmlCharEncodingHandler *handler);
/* error reporting; parserInternals.c (static) */
static void xmlErrInternal(xmlParserCtxtPtr ctxt, const char *msg,
                           const xmlChar *str);
/* parser.c (static at v2.10.4); the fix calls this before return(-1) */
static void xmlHaltParser(xmlParserCtxtPtr ctxt);
/* string helpers used only in commented-out code, listed for completeness */
int       strcmp(const char *, const char *);

/* ===========================================================================
 * COMPLETE verbatim pre-patch function body, exactly as shipped in v2.10.4
 * (parserInternals.c lines 1013-1140). The vulnerable sink is the
 * `return (-1);` at line 1124 (marked below).
 * ===========================================================================
 */
static int
xmlSwitchInputEncodingInt(xmlParserCtxtPtr ctxt, xmlParserInputPtr input,
                          xmlCharEncodingHandlerPtr handler, int len)
{
    int nbchars;

    if (handler == NULL)
        return (-1);
    if (input == NULL)
        return (-1);
    if (input->buf != NULL) {
	ctxt->charset = XML_CHAR_ENCODING_UTF8;

        if (input->buf->encoder != NULL) {
            /*
             * Check in case the auto encoding detection triggered
             * in already.
             */
            if (input->buf->encoder == handler)
                return (0);

            /*
             * "UTF-16" can be used for both LE and BE
             if ((!xmlStrncmp(BAD_CAST input->buf->encoder->name,
             BAD_CAST "UTF-16", 6)) &&
             (!xmlStrncmp(BAD_CAST handler->name,
             BAD_CAST "UTF-16", 6))) {
             return(0);
             }
             */

            /*
             * Note: this is a bit dangerous, but that's what it
             * takes to use nearly compatible signature for different
             * encodings.
             *
             * FIXME: Encoders might buffer partial byte sequences, so
             * this probably can't work. We should return an error and
             * make sure that callers never try to switch the encoding
             * twice.
             */
            xmlCharEncCloseFunc(input->buf->encoder);
            input->buf->encoder = handler;
            return (0);
        }
        input->buf->encoder = handler;

        /*
         * Is there already some content down the pipe to convert ?
         */
        if (xmlBufIsEmpty(input->buf->buffer) == 0) {
            int processed;
	    unsigned int use;

            /*
             * Specific handling of the Byte Order Mark for
             * UTF-16
             */
            if ((handler->name != NULL) &&
                (!strcmp(handler->name, "UTF-16LE") ||
                 !strcmp(handler->name, "UTF-16")) &&
                (input->cur[0] == 0xFF) && (input->cur[1] == 0xFE)) {
                input->cur += 2;
            }
            if ((handler->name != NULL) &&
                (!strcmp(handler->name, "UTF-16BE")) &&
                (input->cur[0] == 0xFE) && (input->cur[1] == 0xFF)) {
                input->cur += 2;
            }
            /*
             * Errata on XML-1.0 June 20 2001
             * Specific handling of the Byte Order Mark for
             * UTF-8
             */
            if ((handler->name != NULL) &&
                (!strcmp(handler->name, "UTF-8")) &&
                (input->cur[0] == 0xEF) &&
                (input->cur[1] == 0xBB) && (input->cur[2] == 0xBF)) {
                input->cur += 3;
            }

            /*
             * Shrink the current input buffer.
             * Move it as the raw buffer and create a new input buffer
             */
            processed = input->cur - input->base;
            xmlBufShrink(input->buf->buffer, processed);
            input->buf->raw = input->buf->buffer;
            input->buf->buffer = xmlBufCreate();
	    input->buf->rawconsumed = processed;
	    use = xmlBufUse(input->buf->raw);

            if (ctxt->html) {
                /*
                 * convert as much as possible of the buffer
                 */
                nbchars = xmlCharEncInput(input->buf, 1);
            } else {
                /*
                 * convert just enough to get
                 * '<?xml version="1.0" encoding="xxx"?>'
                 * parsed with the autodetected encoding
                 * into the parser reading buffer.
                 */
                nbchars = xmlCharEncFirstLineInput(input->buf, len);
            }
            xmlBufResetInput(input->buf->buffer, input);
            if (nbchars < 0) {
                xmlErrInternal(ctxt,
                               "switching encoding: encoder error\n",
                               NULL);
                return (-1);      /* <-- SINK (parserInternals.c:1124):
                                   * parser NOT halted; caller keeps consuming
                                   * input and over-reads. Fix inserts
                                   * xmlHaltParser(ctxt); before this return. */
            }
	    input->buf->rawconsumed += use - xmlBufUse(input->buf->raw);
        }
        return (0);
    } else {
	xmlErrInternal(ctxt,
                "static memory buffer doesn't support encoding\n", NULL);
        /*
         * Callers assume that the input buffer takes ownership of the
         * encoding handler. xmlCharEncCloseFunc frees unregistered
         * handlers and avoids a memory leak.
         */
        xmlCharEncCloseFunc(handler);
	return (-1);
    }
}
