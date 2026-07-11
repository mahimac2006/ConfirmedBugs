/*
 * ============================================================================
 * Vulnerable function dossier
 * ============================================================================
 * Project      : libxml2  (GNOME/libxml2)
 * Version      : 2.10.4   (tag v2.10.4)
 * ARVO id      : arvo:56964
 * Location     : HTMLparser.c:474  (line number as shipped at tag v2.10.4)
 * Crash type   : Global-buffer-overflow READ 1
 *
 * Signature    : static int htmlCurrentChar(xmlParserCtxtPtr ctxt, int *len)
 *
 * Parameters:
 *   ctxt  - the HTML parser context. Supplies the current input stream
 *           (ctxt->input->cur / ->end), the charset, the parser state, etc.
 *   len   - out-parameter: the byte length of the decoded character
 *           (1, 2, 3 or 4 for UTF-8).
 *
 * Returns    : the Unicode code point of the current character, or 0/space on
 *              error, and writes the encoded byte length through *len.
 *
 * Exact crash sink (HTMLparser.c:474):
 *
 *         if (cur[1] == 0) {
 *
 * When the current byte `c = *cur` is a UTF-8 multi-byte lead byte
 * (c & 0x80), the code dereferences the *following* continuation bytes
 * cur[1], cur[2], cur[3] to validate / decode the sequence. Each of those
 * reads is guarded only by a check for a trailing NUL followed by a call to
 * xmlParserInputGrow(). For a non-growable buffer (e.g. an in-memory buffer
 * supplied by htmlReadMemory in the fuzz harness) xmlParserInputGrow() cannot
 * extend the input, so when a truncated multi-byte lead byte sits at the very
 * end of the input buffer the subsequent 1-byte read of cur[1] (and likewise
 * cur[2]/cur[3]) walks one byte past ctxt->input->end -> out-of-bounds read.
 *
 * The fix (commit 3eb6bf03869b) replaces every
 *     xmlParserInputGrow(ctxt->input, INPUT_CHUNK)
 * with
 *     xmlParserGrow(ctxt)
 * which takes the parser context and keeps the buffer / end pointer /
 * NUL-termination invariants consistent so the continuation reads stay in
 * bounds.
 * ============================================================================
 */

/* ------------------------------------------------------------------ *
 * Minimal dependency closure (definitions taken verbatim at v2.10.4) *
 * ------------------------------------------------------------------ */

/* include/libxml/parserInternals.h:89 */
#define INPUT_CHUNK	250

/* include/libxml/parser.h:111  (enum xmlParserInputState) */
#define XML_PARSER_EOF (-1)

/* include/libxml/encoding.h  (enum xmlCharEncoding) */
#define XML_CHAR_ENCODING_UTF8    1   /* line 59 */
#define XML_CHAR_ENCODING_8859_1  10  /* line 68 */

/* Error codes used by the reporting helpers (include/libxml/xmlerror.h) */
#define XML_ERR_INVALID_CHAR      9
#define XML_ERR_INVALID_ENCODING  32

/* include/libxml/xmlstring.h : cast helper */
#define BAD_CAST (xmlChar *)

/* include/libxml/chvalid.h:118 : IS_CHAR(c) == xmlIsCharQ(c) */
#define xmlIsCharQ(c)		(((c) < 0x100) ? \
				 xmlIsChar_ch((c)) :\
				(((0x100 <= (c)) && ((c) <= 0xd7ff)) || \
				 ((0xe000 <= (c)) && ((c) <= 0xfffd)) || \
				 ((0x10000 <= (c)) && ((c) <= 0x10ffff))))
/* include/libxml/parserInternals.h:117 */
#define IS_CHAR(c)   xmlIsCharQ(c)

/* Basic typedefs (include/libxml/xmlstring.h, tree.h) */
typedef unsigned char xmlChar;

/*
 * Relevant fields of the parser structures (include/libxml/parser.h).
 * struct _xmlParserInput  (typedef xmlParserInputPtr):
 *   xmlParserInputBufferPtr buf;        line 54  -- UTF-8 encoded buffer
 *   const xmlChar          *cur;        line 59  -- current char being parsed
 *   const xmlChar          *end;        line 60  -- end of the array to parse
 *   const xmlChar          *encoding;   line 71  -- the encoding string
 * struct _xmlParserCtxt   (typedef xmlParserCtxtPtr):
 *   xmlParserInputPtr input;    -- current input stream
 *   int               instate;  -- current parser state (XML_PARSER_EOF ...)
 *   int               token;    -- consumed token / lookahead
 *   int               charset;  -- encoding of the in-memory content
 * The concrete struct definitions live in include/libxml/parser.h; only the
 * fields above are touched by this function.
 */

/* ---- Helper prototypes (defined elsewhere in the tree, deep deps) ---- */

/* include/libxml/parser.h:834 -- the (mis)used grow routine */
extern int  xmlParserInputGrow(xmlParserInputPtr in, int len);

/* HTMLparser.c static error helpers */
static void htmlParseErrInt(xmlParserCtxtPtr ctxt, xmlParserErrors error,
                            const char *msg, int val);
static void htmlParseErr(xmlParserCtxtPtr ctxt, xmlParserErrors error,
                         const char *msg, const xmlChar *str1,
                         const xmlChar *str2);
/* HTMLparser.c: sniff the encoding from a <meta> declaration */
static xmlChar *htmlFindEncoding(xmlParserCtxtPtr ctxt);

/* encoding.c / parserInternals.c */
extern void xmlSwitchEncoding(xmlParserCtxtPtr ctxt, xmlCharEncoding enc);
extern void xmlSwitchToEncoding(xmlParserCtxtPtr ctxt,
                                xmlCharEncodingHandlerPtr handler);
extern xmlCharEncodingHandlerPtr
            xmlFindCharEncodingHandler(const char *name);
extern int  xmlStrEqual(const xmlChar *str1, const xmlChar *str2);
extern void xmlFree(void *mem);


/* ============================================================================
 * COMPLETE pre-patch function body, verbatim from v2.10.4 HTMLparser.c:399-573
 * ============================================================================
 */

static int
htmlCurrentChar(xmlParserCtxtPtr ctxt, int *len) {
    const unsigned char *cur;
    unsigned char c;
    unsigned int val;

    if (ctxt->instate == XML_PARSER_EOF)
	return(0);

    if (ctxt->token != 0) {
	*len = 0;
	return(ctxt->token);
    }
    if (ctxt->charset != XML_CHAR_ENCODING_UTF8) {
        xmlChar * guess;
        xmlCharEncodingHandlerPtr handler;

        /*
         * Assume it's a fixed length encoding (1) with
         * a compatible encoding for the ASCII set, since
         * HTML constructs only use < 128 chars
         */
        if ((int) *ctxt->input->cur < 0x80) {
            *len = 1;
            if ((*ctxt->input->cur == 0) &&
                (ctxt->input->cur < ctxt->input->end)) {
                htmlParseErrInt(ctxt, XML_ERR_INVALID_CHAR,
                                "Char 0x%X out of allowed range\n", 0);
                return(' ');
            }
            return((int) *ctxt->input->cur);
        }

        /*
         * Humm this is bad, do an automatic flow conversion
         */
        guess = htmlFindEncoding(ctxt);
        if (guess == NULL) {
            xmlSwitchEncoding(ctxt, XML_CHAR_ENCODING_8859_1);
        } else {
            if (ctxt->input->encoding != NULL)
                xmlFree((xmlChar *) ctxt->input->encoding);
            ctxt->input->encoding = guess;
            handler = xmlFindCharEncodingHandler((const char *) guess);
            if (handler != NULL) {
                /*
                 * Don't use UTF-8 encoder which isn't required and
                 * can produce invalid UTF-8.
                 */
                if (!xmlStrEqual(BAD_CAST handler->name, BAD_CAST "UTF-8"))
                    xmlSwitchToEncoding(ctxt, handler);
            } else {
                htmlParseErr(ctxt, XML_ERR_INVALID_ENCODING,
                             "Unsupported encoding %s", guess, NULL);
            }
        }
        ctxt->charset = XML_CHAR_ENCODING_UTF8;
    }

    /*
     * We are supposed to handle UTF8, check it's valid
     * From rfc2044: encoding of the Unicode values on UTF-8:
     *
     * UCS-4 range (hex.)           UTF-8 octet sequence (binary)
     * 0000 0000-0000 007F   0xxxxxxx
     * 0000 0080-0000 07FF   110xxxxx 10xxxxxx
     * 0000 0800-0000 FFFF   1110xxxx 10xxxxxx 10xxxxxx
     *
     * Check for the 0x110000 limit too
     */
    cur = ctxt->input->cur;
    c = *cur;
    if (c & 0x80) {
        if ((c & 0x40) == 0)
            goto encoding_error;
        if (cur[1] == 0) {                                  /* <-- SINK: HTMLparser.c:474, OOB READ 1 */
            xmlParserInputGrow(ctxt->input, INPUT_CHUNK);
            cur = ctxt->input->cur;
        }
        if ((cur[1] & 0xc0) != 0x80)
            goto encoding_error;
        if ((c & 0xe0) == 0xe0) {

            if (cur[2] == 0) {
                xmlParserInputGrow(ctxt->input, INPUT_CHUNK);
                cur = ctxt->input->cur;
            }
            if ((cur[2] & 0xc0) != 0x80)
                goto encoding_error;
            if ((c & 0xf0) == 0xf0) {
                if (cur[3] == 0) {
                    xmlParserInputGrow(ctxt->input, INPUT_CHUNK);
                    cur = ctxt->input->cur;
                }
                if (((c & 0xf8) != 0xf0) ||
                    ((cur[3] & 0xc0) != 0x80))
                    goto encoding_error;
                /* 4-byte code */
                *len = 4;
                val = (cur[0] & 0x7) << 18;
                val |= (cur[1] & 0x3f) << 12;
                val |= (cur[2] & 0x3f) << 6;
                val |= cur[3] & 0x3f;
                if (val < 0x10000)
                    goto encoding_error;
            } else {
              /* 3-byte code */
                *len = 3;
                val = (cur[0] & 0xf) << 12;
                val |= (cur[1] & 0x3f) << 6;
                val |= cur[2] & 0x3f;
                if (val < 0x800)
                    goto encoding_error;
            }
        } else {
          /* 2-byte code */
            *len = 2;
            val = (cur[0] & 0x1f) << 6;
            val |= cur[1] & 0x3f;
            if (val < 0x80)
                goto encoding_error;
        }
        if (!IS_CHAR(val)) {
            htmlParseErrInt(ctxt, XML_ERR_INVALID_CHAR,
                            "Char 0x%X out of allowed range\n", val);
        }
        return(val);
    } else {
        if ((*ctxt->input->cur == 0) &&
            (ctxt->input->cur < ctxt->input->end)) {
            htmlParseErrInt(ctxt, XML_ERR_INVALID_CHAR,
                            "Char 0x%X out of allowed range\n", 0);
            *len = 1;
            return(' ');
        }
        /* 1-byte code */
        *len = 1;
        return((int) *ctxt->input->cur);
    }

encoding_error:
    /*
     * If we detect an UTF8 error that probably mean that the
     * input encoding didn't get properly advertised in the
     * declaration header. Report the error and switch the encoding
     * to ISO-Latin-1 (if you don't like this policy, just declare the
     * encoding !)
     */
    {
        char buffer[150];

	if (ctxt->input->end - ctxt->input->cur >= 4) {
	    snprintf(buffer, 149, "Bytes: 0x%02X 0x%02X 0x%02X 0x%02X\n",
			    ctxt->input->cur[0], ctxt->input->cur[1],
			    ctxt->input->cur[2], ctxt->input->cur[3]);
	} else {
	    snprintf(buffer, 149, "Bytes: 0x%02X\n", ctxt->input->cur[0]);
	}
	htmlParseErr(ctxt, XML_ERR_INVALID_ENCODING,
		     "Input is not proper UTF-8, indicate encoding !\n",
		     BAD_CAST buffer, NULL);
    }

    /*
     * Don't switch encodings twice. Note that if there's an encoder, we
     * shouldn't receive invalid UTF-8 anyway.
     *
     * Note that if ctxt->input->buf == NULL, switching encodings is
     * impossible, see Gitlab issue #34.
     */
    if ((ctxt->input->buf != NULL) &&
        (ctxt->input->buf->encoder == NULL))
        xmlSwitchEncoding(ctxt, XML_CHAR_ENCODING_8859_1);
    *len = 1;
    return((int) *ctxt->input->cur);
}
