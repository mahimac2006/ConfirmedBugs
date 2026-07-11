/*
 * Project : libxml2 2.10.4  (tag v2.10.4, commit 9ddf8ecda72891d1bbe8517be1a59153e8ae944d)
 * Bug id  : arvo:57469
 * Sink    : HTMLparser.c:3004
 *
 * Signature:
 *   static xmlChar *htmlParseSystemLiteral(htmlParserCtxtPtr ctxt);
 *
 * Parameters:
 *   ctxt  - the HTML parser context. The bytes being parsed live in
 *           ctxt->input->base (buffer start) .. ctxt->input->end, with
 *           ctxt->input->cur as the current read cursor.
 *
 * Crash sink (exact statement, line 3004):
 *   ret = xmlStrndup((BASE_PTR+startPosition), len);
 *
 * Crash type: Global-buffer-overflow READ (heap/global over-read inside
 *   xmlStrndup, which does memcpy of `len` bytes starting at
 *   BASE_PTR+startPosition).
 *
 * Root cause:
 *   startPosition is captured as (CUR_PTR - BASE_PTR) BEFORE the literal is
 *   scanned. In the vulnerable ordering the closing-quote is consumed with
 *   `NEXT;` (xmlNextChar) *before* the xmlStrndup read. xmlNextChar can call
 *   xmlParserInputGrow, which may reallocate / shift the input buffer so that
 *   BASE_PTR (ctxt->input->base) now points at a different / shorter buffer.
 *   The previously computed (BASE_PTR + startPosition) then no longer bounds
 *   `len` valid bytes, so xmlStrndup reads out of bounds.
 *   The fix (commit 1061537efdf3) performs the xmlStrndup read BEFORE the
 *   trailing NEXT, so the pointers are still valid when the copy happens.
 *
 * -------------------------------------------------------------------------
 * Minimal dependency closure (definitions taken verbatim from tag v2.10.4)
 * -------------------------------------------------------------------------
 */

/* --- Parser cursor macros (HTMLparser.c:289,290,307,308) --- */
#define CUR_PTR   ctxt->input->cur
#define BASE_PTR  ctxt->input->base
#define CUR       ((int) (*ctxt->input->cur))
#define NEXT      xmlNextChar(ctxt)          /* advances cursor; may GROW/realloc buffer */

/* --- Char classification (include/libxml/parserInternals.h:125,
 *     include/libxml/chvalid.h:108) --- */
#define xmlIsChar_ch(c)  (((0x9 <= (c)) && ((c) <= 0xa)) || \
                          ((c) == 0xd) || \
                          (0x20 <= (c)))
#define IS_CHAR_CH(c)    xmlIsChar_ch(c)

/* --- Relevant error codes (include/libxml/xmlerror.h) --- */
/* XML_ERR_INVALID_CHar == 9, XML_ERR_LITERAL_NOT_STARTED == 43,
 * XML_ERR_LITERAL_NOT_FINISHED == 44 (values from the xmlParserErrors enum) */
typedef enum {
    XML_ERR_INVALID_CHAR         = 9,
    XML_ERR_LITERAL_NOT_STARTED  = 43,
    XML_ERR_LITERAL_NOT_FINISHED = 44
} xmlParserErrors;

/*
 * Relevant fields of struct _xmlParserInput (include/libxml/parser.h:52).
 * BASE_PTR/CUR_PTR expand to ctxt->input->base / ctxt->input->cur.
 *
 *   struct _xmlParserInput {
 *       ...
 *       const xmlChar *base;   // Base of the array to parse
 *       const xmlChar *cur;    // Current char being parsed
 *       const xmlChar *end;    // end of the array to parse
 *       ...
 *   };
 *
 * htmlParserCtxtPtr is a typedef alias of xmlParserCtxtPtr; ctxt->input is an
 * xmlParserInputPtr pointing at the struct above.
 */
typedef unsigned char xmlChar;
typedef struct _xmlParserCtxt xmlParserCtxt;
typedef xmlParserCtxt *xmlParserCtxtPtr;
typedef xmlParserCtxtPtr htmlParserCtxtPtr;

/* --- Helper prototypes (bodies live elsewhere in the tree) --- */

/* include/libxml/xmlstring.h:43 — copies `len` bytes from cur (THE SINK).
 *   xmlChar *xmlStrndup(const xmlChar *cur, int len); */
xmlChar *xmlStrndup(const xmlChar *cur, int len);

/* include/libxml/parserInternals.h:571 — parserInternals.c:380.
 * Advances the input cursor by one char; may call xmlParserInputGrow which
 * can reallocate/shift ctxt->input->base, invalidating BASE_PTR. */
void xmlNextChar(xmlParserCtxtPtr ctxt);

/* HTMLparser.c:93 / :120 — report a well-formedness error (does not return). */
static void htmlParseErr(xmlParserCtxtPtr ctxt, xmlParserErrors error,
                         const char *msg, const xmlChar *str1,
                         const xmlChar *str2);
static void htmlParseErrInt(xmlParserCtxtPtr ctxt, xmlParserErrors error,
                            const char *msg, int val);

/* =========================================================================
 * VERBATIM pre-patch function (HTMLparser.c, tag v2.10.4, lines 2969-3007)
 * ========================================================================= */

static xmlChar *
htmlParseSystemLiteral(htmlParserCtxtPtr ctxt) {
    size_t len = 0, startPosition = 0;
    int err = 0;
    int quote;
    xmlChar *ret = NULL;

    if ((CUR != '"') && (CUR != '\'')) {
	htmlParseErr(ctxt, XML_ERR_LITERAL_NOT_STARTED,
	             "SystemLiteral \" or ' expected\n", NULL, NULL);
        return(NULL);
    }
    quote = CUR;
    NEXT;

    if (CUR_PTR < BASE_PTR)
        return(ret);
    startPosition = CUR_PTR - BASE_PTR;

    while ((CUR != 0) && (CUR != quote)) {
        /* TODO: Handle UTF-8 */
        if (!IS_CHAR_CH(CUR)) {
            htmlParseErrInt(ctxt, XML_ERR_INVALID_CHAR,
                            "Invalid char in SystemLiteral 0x%X\n", CUR);
            err = 1;
        }
        NEXT;
        len++;
    }
    if (CUR != quote) {
        htmlParseErr(ctxt, XML_ERR_LITERAL_NOT_FINISHED,
                     "Unfinished SystemLiteral\n", NULL, NULL);
    } else {
        NEXT;                                      /* <-- vulnerable: consumes closing quote,
                                                    *     may GROW/reallocate the input buffer
                                                    *     BEFORE the read below */
        if (err == 0)
            ret = xmlStrndup((BASE_PTR+startPosition), len);   /* SINK: HTMLparser.c:3004
                                                    *     over-read of `len` bytes from a
                                                    *     possibly-stale BASE_PTR */
    }

    return(ret);
}
