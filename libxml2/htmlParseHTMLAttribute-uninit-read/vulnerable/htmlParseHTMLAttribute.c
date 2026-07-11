/*
 * Project:  libxml2  (version 2.10.4, tag v2.10.4)
 * Bug id:   arvo:57223
 * Sink:     HTMLparser.c:2843
 * Crash:    Use-of-uninitialized-value (input over-read)
 *
 * Function signature:
 *   static xmlChar *
 *   htmlParseHTMLAttribute(htmlParserCtxtPtr ctxt, const xmlChar stop);
 *
 * Parameters:
 *   ctxt  - the HTML parser context (holds ctxt->input, the current input
 *           buffer with cur/end pointers, ctxt->instate parser state, etc.)
 *   stop  - a char "stop value" (the closing quote); if 0 the value ends at
 *           the first blank / '>'.
 *
 * Returns: the parsed attribute value string, or NULL.
 *
 * Exact crash sink statement (HTMLparser.c:2843, inside the plain-char else
 * branch of the main while loop):
 *
 *       c = CUR_CHAR(l);
 *
 * CUR_CHAR expands to htmlCurrentChar(ctxt, &l).  When the parser has already
 * hit end-of-input, htmlParseCharRef/htmlParseEntityRef (called earlier in the
 * loop on malloc failure or on malformed entities) can drive the context into
 * XML_PARSER_EOF, yet the loop keeps iterating and calls htmlCurrentChar again.
 * On the multi-byte UTF-8 path htmlCurrentChar dereferences cur[1]/cur[2]/cur[3]
 * one past the (uninitialized/over-read) end of the input buffer, producing an
 * uninitialized-value read.  The fix (commit 62f199ed7d1c) adds a check right
 * after this statement: if ctxt->instate == XML_PARSER_EOF, free buffer and
 * return NULL, so the function correctly returns NULL on error/EOF.
 *
 * Below: minimal dependency closure (macros, typedefs, structs, constants,
 * helper prototypes) followed by the COMPLETE verbatim pre-patch function.
 */

/* ---------------------------------------------------------------------------
 * Dependency closure (definitions taken verbatim from the v2.10.4 tree)
 * ------------------------------------------------------------------------- */

/* Basic char type (include/libxml/xmlstring.h) */
typedef unsigned char xmlChar;

/* Parser state enum member (include/libxml/parser.h:111) */
/* enum xmlParserInputState { ... XML_PARSER_EOF = -1, ... } */

/* HTMLparser.h typedefs */
typedef xmlParserCtxtPtr htmlParserCtxtPtr;   /* include/libxml/HTMLparser.h:28 */

/* htmlEntityDesc struct (include/libxml/HTMLparser.h:75-81) */
typedef struct _htmlEntityDesc htmlEntityDesc;
struct _htmlEntityDesc {
    unsigned int value; /* the UNICODE value for the character */
    const char *name;   /* The entity name */
    const char *desc;   /* the description */
};

/* Constant (HTMLparser.c:36) */
#define HTML_PARSER_BUFFER_SIZE 100

/* Input/cursor macros (HTMLparser.c) */
#define NXT(val) ctxt->input->cur[(val)]                    /* :285 */
#define CUR ((int) (*ctxt->input->cur))                     /* :307 */
#define NEXT xmlNextChar(ctxt)                              /* :308 */
#define CUR_CHAR(l) htmlCurrentChar(ctxt, &l)               /* :326 -> SINK */

/* IS_BLANK_CH: whitespace test on a single byte (include/libxml/chvalid.h) */
#define IS_BLANK_CH(c) (((c) == 0x20) || ((0x9 <= (c)) && ((c) <= 0xa)) || ((c) == 0xd))

/* growBuffer: doubles buffer, on realloc failure frees and returns NULL
 * (HTMLparser.c:2075-2085). */
#define growBuffer(buffer) {                                            \
    xmlChar *tmp;                                                       \
    buffer##_size *= 2;                                                 \
    tmp = (xmlChar *) xmlRealloc(buffer, buffer##_size * sizeof(xmlChar)); \
    if (tmp == NULL) {                                                  \
        htmlErrMemory(ctxt, "growing buffer\n");                       \
        xmlFree(buffer);                                               \
        return(NULL);                                                  \
    }                                                                  \
    buffer = tmp;                                                       \
}

/* ---- Helper prototypes (defined elsewhere in the v2.10.4 tree) ---- */

/* Memory helpers (xmlmemory.h) */
extern void *xmlMallocAtomic(size_t size);
extern void *xmlRealloc(void *ptr, size_t size);
extern void  xmlFree(void *ptr);

/* HTMLparser.c local helper: the actual crash sink implementation.
 * static int htmlCurrentChar(xmlParserCtxtPtr ctxt, int *len);   (HTMLparser.c:400)
 * Reads the current (possibly multi-byte UTF-8) char. On the UTF-8 multi-byte
 * path it dereferences cur[1]..cur[3] -> the uninitialized/over-read access. */
extern int htmlCurrentChar(xmlParserCtxtPtr ctxt, int *len);

/* HTMLparser.c local helpers (prototypes) */
extern void htmlErrMemory(xmlParserCtxtPtr ctxt, const char *extra);   /* :~180 */
extern unsigned int htmlParseCharRef(htmlParserCtxtPtr ctxt);          /* public */
extern const htmlEntityDesc *
       htmlParseEntityRef(htmlParserCtxtPtr ctxt, const xmlChar **str);/* :~2876 */

/* ---------------------------------------------------------------------------
 * COMPLETE verbatim pre-patch function  (HTMLparser.c:2736-2861 @ v2.10.4)
 * ------------------------------------------------------------------------- */

static xmlChar *
htmlParseHTMLAttribute(htmlParserCtxtPtr ctxt, const xmlChar stop) {
    xmlChar *buffer = NULL;
    int buffer_size = 0;
    xmlChar *out = NULL;
    const xmlChar *name = NULL;
    const xmlChar *cur = NULL;
    const htmlEntityDesc * ent;

    /*
     * allocate a translation buffer.
     */
    buffer_size = HTML_PARSER_BUFFER_SIZE;
    buffer = (xmlChar *) xmlMallocAtomic(buffer_size * sizeof(xmlChar));
    if (buffer == NULL) {
	htmlErrMemory(ctxt, "buffer allocation failed\n");
	return(NULL);
    }
    out = buffer;

    /*
     * Ok loop until we reach one of the ending chars
     */
    while ((CUR != 0) && (CUR != stop)) {
	if ((stop == 0) && (CUR == '>')) break;
	if ((stop == 0) && (IS_BLANK_CH(CUR))) break;
        if (CUR == '&') {
	    if (NXT(1) == '#') {
		unsigned int c;
		int bits;

		c = htmlParseCharRef(ctxt);
		if      (c <    0x80)
		        { *out++  = c;                bits= -6; }
		else if (c <   0x800)
		        { *out++  =((c >>  6) & 0x1F) | 0xC0;  bits=  0; }
		else if (c < 0x10000)
		        { *out++  =((c >> 12) & 0x0F) | 0xE0;  bits=  6; }
		else
		        { *out++  =((c >> 18) & 0x07) | 0xF0;  bits= 12; }

		for ( ; bits >= 0; bits-= 6) {
		    *out++  = ((c >> bits) & 0x3F) | 0x80;
		}

		if (out - buffer > buffer_size - 100) {
			int indx = out - buffer;

			growBuffer(buffer);
			out = &buffer[indx];
		}
	    } else {
		ent = htmlParseEntityRef(ctxt, &name);
		if (name == NULL) {
		    *out++ = '&';
		    if (out - buffer > buffer_size - 100) {
			int indx = out - buffer;

			growBuffer(buffer);
			out = &buffer[indx];
		    }
		} else if (ent == NULL) {
		    *out++ = '&';
		    cur = name;
		    while (*cur != 0) {
			if (out - buffer > buffer_size - 100) {
			    int indx = out - buffer;

			    growBuffer(buffer);
			    out = &buffer[indx];
			}
			*out++ = *cur++;
		    }
		} else {
		    unsigned int c;
		    int bits;

		    if (out - buffer > buffer_size - 100) {
			int indx = out - buffer;

			growBuffer(buffer);
			out = &buffer[indx];
		    }
		    c = ent->value;
		    if      (c <    0x80)
			{ *out++  = c;                bits= -6; }
		    else if (c <   0x800)
			{ *out++  =((c >>  6) & 0x1F) | 0xC0;  bits=  0; }
		    else if (c < 0x10000)
			{ *out++  =((c >> 12) & 0x0F) | 0xE0;  bits=  6; }
		    else
			{ *out++  =((c >> 18) & 0x07) | 0xF0;  bits= 12; }

		    for ( ; bits >= 0; bits-= 6) {
			*out++  = ((c >> bits) & 0x3F) | 0x80;
		    }
		}
	    }
	} else {
	    unsigned int c;
	    int bits, l;

	    if (out - buffer > buffer_size - 100) {
		int indx = out - buffer;

		growBuffer(buffer);
		out = &buffer[indx];
	    }
	    c = CUR_CHAR(l);                                  /* <== SINK: HTMLparser.c:2843 */
	    if      (c <    0x80)
		    { *out++  = c;                bits= -6; }
	    else if (c <   0x800)
		    { *out++  =((c >>  6) & 0x1F) | 0xC0;  bits=  0; }
	    else if (c < 0x10000)
		    { *out++  =((c >> 12) & 0x0F) | 0xE0;  bits=  6; }
	    else
		    { *out++  =((c >> 18) & 0x07) | 0xF0;  bits= 12; }

	    for ( ; bits >= 0; bits-= 6) {
		*out++  = ((c >> bits) & 0x3F) | 0x80;
	    }
	    NEXT;
	}
    }
    *out = 0;
    return(buffer);
}
