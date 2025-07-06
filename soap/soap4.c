/* 
 * soap4.c: a new version of soap.c for cadr4
 */

/* Original header from soap.c:
 *
 * soap.c
 *
 * try and decode SUDS data files into an intermediate netlist
 *
 * (I just wanted to type "soap suds" :-)
 *
 * Mostly parse the data file, identify the "bodies" (chips in this case)
 * and the interconnections ("points").
 *
 * Note that like most software projects, when I started writing this I
 * didn't really understand the format of the SUDS data file.
 *
 * points are just that, points.  And the vertices's they describe
 * (up, down, left, right) are just that, verticies to a new point.
 *
 * so, there should be some generalize "traverse vertices" functions but
 * I didn't start to understand till late in the game.
 *
 * brad@heeltoe.com 10/2004
 * $Id$
 */

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>

#include "unpack4.h"
#include "soap4.h"

// 1MW is more than enough for any suds file
#define MAX_WORDS_IN_SUDS_FILE (1024*1024)

static uint32_t *half_words;
static size_t half_words_len;
static size_t half_words_idx;
static int debug = 0;
static int debug_parsing = 0;

struct header_s _header;
struct header_s *header = &_header;

#define MAX_BODY_DEFS 400
size_t body_defs_count;
struct body_def_s body_defs[MAX_BODY_DEFS];

#define MAX_BODIES 400
size_t bodies_count;
struct body_s bodies[MAX_BODIES];

#define MAX_POINTS (50*1000)
size_t points_count;
struct point_s points[MAX_POINTS];

#define MAX_SET_CENTERS 400
size_t set_centers_count;
struct set_center_s set_centers[MAX_SET_CENTERS];

struct trailer_s _trailer;
struct trailer_s *trailer = &_trailer;

#define MAX_SIGNALS 1000
size_t signals_count;
struct signal_s signals[MAX_SIGNALS];

#define LEN(x) (sizeof(x)/sizeof(x[0]))

#define BYTE_TO_BINARY_PATTERN "%c%c%c%c%c%c%c%c"
#define BYTE_TO_BINARY(byte)  \
  ((byte) & 0x80 ? '1' : '0'), \
  ((byte) & 0x40 ? '1' : '0'), \
  ((byte) & 0x20 ? '1' : '0'), \
  ((byte) & 0x10 ? '1' : '0'), \
  ((byte) & 0x08 ? '1' : '0'), \
  ((byte) & 0x04 ? '1' : '0'), \
  ((byte) & 0x02 ? '1' : '0'), \
  ((byte) & 0x01 ? '1' : '0') 

#define DEBUG(...) { if (debug) fprintf(stderr, __VA_ARGS__); }
#define DUMP_RAW(...) { fprintf(stderr, __VA_ARGS__); }
#define DUMP_VHDL(...) { fprintf(stdout, __VA_ARGS__); }

#define LEFT_HALF_WORD(x) ((x >> 32) & 0777777)
#define RIGHT_HALF_WORD(x) (x & 0777777)

#define X_WORD(x) LEFT_HALF_WORD(x)
#define Y_WORD(x) RIGHT_HALF_WORD(x)

#define PIN_ID_OF_POINT_ID(point_id) LEFT_HALF_WORD(point_id)
#define BODY_ID_OF_POINT_ID(point_id) RIGHT_HALF_WORD(point_id)

#define DEBUG_HALF_WORD(name, value) \
    DEBUG("%s %u\n", name, value)

#define DEBUG_WORD(name, value) \
    DEBUG("%s %llu\n", name, value)

#define DEBUG_ID(s, id) \
    DEBUG("%s (%llu, %llu) (%06llo, %06llo)\n", s, \
        LEFT_HALF_WORD(id), RIGHT_HALF_WORD(id), \
        LEFT_HALF_WORD(id), RIGHT_HALF_WORD(id))

#define DEBUG_XY(s, xy) DEBUG_ID(s, xy)

#define BREAK_IF_NEXT_WORD_IS(this) \
    { \
        if (peek_word() == this) \
        { \
            read_word(); \
            break; \
        } \
    }

// stack for parser state, used for peek for example
static size_t half_words_idx_stack[8];
static size_t half_words_idx_stack_idx = 0;

void parser_push()
{
    assert (half_words_idx_stack_idx < LEN(half_words_idx_stack));
    half_words_idx_stack[half_words_idx_stack_idx++] = half_words_idx;
}

void parser_pop()
{
    assert (half_words_idx_stack_idx > 0);
    half_words_idx = half_words_idx_stack[--half_words_idx_stack_idx];
}

// read 18-bit half-word without debug output
HALF_WORD read_half_word_no_debug(void) {
    assert (half_words_idx < half_words_len);
    HALF_WORD result = half_words[half_words_idx++] & 0777777;
    return result;
}

// 18-bit half-word
HALF_WORD read_half_word(void) {
    HALF_WORD result = read_half_word_no_debug();
    if (debug_parsing) printf("read_half_word %06o\n", result);
    return result;
}

// 36-bit word
// word = half-word1 << 18 | half-word2
WORD read_word(void) {
    WORD w1 = read_half_word_no_debug();
    WORD w2 = read_half_word_no_debug();
    WORD result = (w1 << 18) | w2;
    if (debug_parsing) printf("read_word %012llo (%06llo, %06llo)\n", 
        result, w1, w2);
    return result;
}

WORD peek_word() {
    parser_push();
    WORD w1 = read_half_word_no_debug();
    WORD w2 = read_half_word_no_debug();
    parser_pop();
    WORD result = (w1 << 18) | w2;
    if (debug_parsing) printf("peek_word %012llo (%06llo, %06llo)\n", 
        result, w1, w2);
    return result;
} 

void
add_body_def(struct body_def_s *bd)
{
    assert (body_defs_count < MAX_BODY_DEFS);
    memcpy(body_defs + body_defs_count, bd, sizeof(struct body_def_s));
    body_defs_count++;
}

struct body_def_s *
find_body_def(char *name)
{
    for (size_t i = 0; i < body_defs_count; i++) {
        if (strcmp(body_defs[i].name, name) == 0) return &body_defs[i];
    }

    assert (0);
}

void
add_body(struct body_s *b)
{
    memcpy(bodies + bodies_count, b, sizeof(struct body_s));
    bodies_count++;
}

struct body_s *
find_body(WORD body_id)
{
    for (size_t i = 0; i < bodies_count; i++) {
        if (bodies[i].body_id == body_id) return &bodies[i];
    }

    assert (0);
}

void
add_point(struct point_s *p)
{
    assert (points_count < MAX_POINTS);
    memcpy(points + points_count, p, sizeof(struct point_s));
    points_count++;
}

struct point_s *
find_point(WORD point_id)
{
    for (size_t i = 0; i < points_count; i++) {
        if (points[i].id == point_id) return &points[i];
    }

    assert (0);
}

void
add_signal(char *name, WORD id)
{
    assert (signals_count < MAX_SIGNALS);

    struct signal_s *s = &signals[signals_count];
    signals_count++;

    s->name = strdup(name);
	s->id = id;
}

struct signal_s *
find_signal(WORD id)
{
	for (size_t i = 0; i < signals_count; i++) {
        struct signal_s *s = &signals[i];
		if (s->id == id) return s;
    }

	assert (0);
}

struct prop_s *
new_prop()
{
	struct prop_s *pp = (struct prop_s *) malloc(sizeof(*pp));
	memset(pp, 0, sizeof(struct prop_s));
	return pp;
}

struct prop_s *
find_prop(struct prop_s **props, size_t prop_count, char *name)
{
    for (size_t i = 0; i < prop_count; i++) {
        struct prop_s *p = props[i];
        if (strcmp(p->name, name) == 0) return p;
    }
    return NULL;
}

static char
format_char_for_raw_output(HALF_WORD c)
{
	c &= 0x7f;
	if (c >= ' ' && c <= '~') {
		return c;
	}
	return '.';
}

static void
words_to_ascii(HALF_WORD w1, HALF_WORD w2, char chars[5])
{
    const HALF_WORD c1 = w1 >> 11;
    const HALF_WORD c2 = w1 >> 4;
    const HALF_WORD c3 = ((w1 & 0xf) << 3) | ((w2 >> 15) & 7);
    const HALF_WORD c4 = w2 >> 8;
    const HALF_WORD c5 = w2 >> 1;

    chars[0] = format_char_for_raw_output(c1);
    chars[1] = format_char_for_raw_output(c2);
    chars[2] = format_char_for_raw_output(c3);
    chars[3] = format_char_for_raw_output(c4);
    chars[4] = format_char_for_raw_output(c5);
}

/*
 * dump tops-10 (36-bit) file as sequence of 18-bit int tuples
 * (for debugging)
 */
static void
dump_raw(int dump_wide_flag, char *suds_filename)
{
	DUMP_RAW("%s\n", suds_filename);
    DUMP_RAW("%zu words (18-bit)\n", half_words_len);

    assert (half_words_len % 2 == 0);

    if (dump_wide_flag == 2) {

        size_t p = 0;
        const int words_per_line = 8;

        while (p < half_words_len) {
            for (size_t j = 0; j < words_per_line; j+=2) {
                if (j == 0) DUMP_RAW("%06zu ", p);
                size_t pj = p + j;
                if ((pj + 1) <  half_words_len) {
                    HALF_WORD w1 = half_words[pj];
                    HALF_WORD w2 = half_words[pj+1];
                    DUMP_RAW("%06o %06o ", w1, w2);
                } else {
                    DUMP_RAW("        ");
                }
            }
            for (size_t j = 0; j < words_per_line; j++) {
                if ((p + j + 1) <  half_words_len) {
                    HALF_WORD w1 = half_words[p + j];
                    HALF_WORD w2 = half_words[p + j + 1];
                    char chars[5];
                    words_to_ascii(w1, w2, chars);
                    DUMP_RAW("%c%c%c%c%c",
                        chars[0], chars[1], chars[2], chars[3], chars[4]);
                } else {
                    DUMP_RAW("     ");
                }
                if (j < (words_per_line - 1)) DUMP_RAW(" ");
            }
            DUMP_RAW("\n");
            p += words_per_line;
        }

    } else if (dump_wide_flag == 1) {

        for (size_t i = 0; i < half_words_len; i += 2) {
            HALF_WORD w1 = half_words[i];
            HALF_WORD w2 = half_words[i+1];
            DUMP_RAW("%06zu %06o %06o ", i, w1, w2);
            char chars[5];
            words_to_ascii(w1, w2, chars);
            DUMP_RAW("%c%c%c%c%c\n",
                chars[0], chars[1], chars[2], chars[3], chars[4]);
        }
 
    } else {
        assert (0);
    }
}

/* ---------------------------------------------------------------- */

char
six_bit_to_ascii(uint16_t c)
{
    return (c & 0x3f) + (c == 0 ? 0 : 32);
}

char
seven_bit_to_ascii(uint16_t c)
{
    return c & 0x7f;
}

char
nine_bit_to_ascii(uint16_t c)
{
    return c & 0x7f;
}

// 6-bit ascii is decimal 32 shifted (ascii 32-95 to 0-63)
// not sure but then space (ascii 32) is used as null terminator
// if 9-bit ascii is used here, top 2 bits are ignored
static char*
parse_string(int bit_per_char)
{
    assert (bit_per_char == 6 || bit_per_char == 7 || bit_per_char == 9);

    static const WORD masks[4] = { 0x3f, 0x7f, 0, 0x1ff };
    static const size_t chars_per_words[4] = { 6, 5, 0, 4 };
    static char (*conversion_funcs[4])(uint16_t) = { 
        six_bit_to_ascii, seven_bit_to_ascii, 0, nine_bit_to_ascii };
    
    const WORD mask = masks[bit_per_char-6];
    const size_t chars_per_word = chars_per_words[bit_per_char-6];
    char (*conversion_func)(uint16_t) = conversion_funcs[bit_per_char-6];

    char buffer[1024];
    size_t s_idx = 0;

    while (1) {
        WORD word = read_word();
        for (size_t i = 0; i < chars_per_word; i++) {
            uint16_t c = (word >> (36 - bit_per_char*(i+1))) & mask;
            assert (s_idx < LEN(buffer));
            buffer[s_idx++] = conversion_func(c);
            if (c == 0) {
                return strdup(buffer);
            }
        }
    }

    assert (0);
}

inline static char*
parse_6bit_ascii(void)
{
    return parse_string(6);
}

inline static char*
parse_7bit_ascii(void)
{
    return parse_string(7);
}

__attribute__((unused))
inline static char*
parse_9bit_ascii(void)
{
    return parse_string(9);
}

static void
parse_9bit_ascii_raw(uint16_t *buffer, size_t max_len)
{
    const WORD mask = 0x1ff;
    const size_t chars_per_word = 4;
    const size_t bit_per_char = 9;

    size_t s_idx = 0;

    while (1) {
        WORD word = read_word();
        for (size_t i = 0; i < chars_per_word; i++) {
            uint16_t c = (word >> (36 - bit_per_char*(i+1))) & mask;
            assert (s_idx < max_len);
            buffer[s_idx++] = c;
            if (c == 0) return;
        }
    }

    assert (0);
}

/* parse SUDS file header */
static void
parse_header(void)
{
    DEBUG("HEADER(%zu)\n", half_words_idx);

    header->version = read_word();
    DEBUG_WORD("\tversion", header->version);

    header->nomenclature_type = parse_7bit_ascii();
	DEBUG("\tnomemclature type '%s'\n", header->nomenclature_type);

	header->board_type = parse_7bit_ascii();
    DEBUG("\tboard type '%s'\n", header->board_type);

	while (1) {
        BREAK_IF_NEXT_WORD_IS(0);
        assert (header->type_names_of_library_bodies_count < MAX_TYPE_NAMES_OF_LIBRARY_BODIES);
        header->type_names_of_library_bodies[header->type_names_of_library_bodies_count] = parse_7bit_ascii();
		DEBUG("\t\ttype name '%s'\n", header->type_names_of_library_bodies[header->type_names_of_library_bodies_count]);
        header->type_names_of_library_bodies_count++;
	}

	while (1) {
		BREAK_IF_NEXT_WORD_IS(0);
        assert (header->library_file_specs_count < MAX_LIBRARY_FILE_SPECS);
        header->library_file_specs[header->library_file_specs_count] = parse_6bit_ascii();
		DEBUG("\t\tfilespec '%s'\n", header->library_file_specs[header->library_file_specs_count]);
        header->library_file_specs_count++;
	}

    DEBUG("/HEADER(%zu)\n", half_words_idx);
}

static void
parse_body_defs(void)
{
    DEBUG("BODY_DEFs(%zu)\n", half_words_idx);

    memset(&body_defs, 0, sizeof(body_defs));

	while (1) {
		BREAK_IF_NEXT_WORD_IS(0);
        DEBUG("\tBODY_DEF(%zu)\n", half_words_idx);                

        struct body_def_s body_def;
        memset(&body_def, 0, sizeof(body_def));
        struct body_def_s *bd = &body_def;

        bd->name = parse_7bit_ascii();
        DEBUG("\t\tname '%s'\n", bd->name);

        // dont know what this is
        // it exists in original soap.c but not described in suds.txt
        free(parse_7bit_ascii());

        bd->bits = read_half_word();

        // unused
        read_half_word();

		bd->loc_offset = read_word();
		bd->loc_char_offset = read_word();

        DEBUG("\t\tpins:\n");

		while (1) {
			BREAK_IF_NEXT_WORD_IS(0400000);

            assert (bd->pin_count < MAX_BODY_DEF_PINS);

			bd->pins[bd->pin_count].loc_of_pin = read_word();
			bd->pins[bd->pin_count].bits       = read_half_word();
			bd->pins[bd->pin_count].pin_id     = read_half_word();
            DEBUG("\t\t\tpin id %d %06o\n", 
                bd->pins[bd->pin_count].pin_id,
                bd->pins[bd->pin_count].pin_id);
			bd->pins[bd->pin_count].pin_pos    = read_half_word();
			bd->pins[bd->pin_count].pin_name   = read_half_word();
		}

        //DEBUG("\tlines:\n");

		while (1) {
            BREAK_IF_NEXT_WORD_IS(0400000);

            assert (bd->line_count < MAX_BODY_DEF_LINES);

			bd->lines[bd->line_count] = read_word();
            //DEBUG("\t\tline %d %d\n", bd->lines[bd->line_count][0], bd->lines[bd->line_count][1]);
			bd->line_count++;

		}

        DEBUG("\t\tprops:\n");

		while (1) {
            BREAK_IF_NEXT_WORD_IS(0);

            assert (bd->prop_count < MAX_BODY_DEF_PROPS);

			struct prop_s *pp = new_prop();
			bd->props[bd->prop_count++] = pp;

            pp->value = parse_7bit_ascii();
			pp->name = parse_7bit_ascii();

            DEBUG("\t\t\t'%s' -> '%s'\n", pp->name, pp->value);

			pp->text_size       = read_word();
			pp->text_location   = read_word();
			pp->constant_offset = read_word();
		}

        add_body_def(bd);

        DEBUG("\t/BODY_DEF(%zu)\n", half_words_idx);
	}

    DEBUG("/BODY_DEFs(%zu)\n", half_words_idx);
}

static void
parse_macros(void)
{
    DEBUG("MACROs(%zu)\n", half_words_idx);

	while (1) {
        BREAK_IF_NEXT_WORD_IS(0);

		DEBUG("MACRO(%zu)\n", half_words_idx);

        char *name = parse_7bit_ascii();
        DEBUG("\tname '%s'\n", name);
        // not used
        free(name);

        uint16_t buffer[1024];
        parse_9bit_ascii_raw(buffer, LEN(buffer));

        DEBUG("/MACRO(%zu)\n", half_words_idx);
	}

    DEBUG("/MACROs(%zu)\n", half_words_idx);
}

static void
parse_bodies(void)
{
    DEBUG("BODYs(%zu)\n", half_words_idx);

	memset(&bodies, 0, sizeof(bodies));

	while (1) {
        BREAK_IF_NEXT_WORD_IS(0400000);
        
		DEBUG("\tBODY(%zu)\n", half_words_idx);

        struct body_s body;
        memset(&body, 0, sizeof(body));
        struct body_s *b = &body;

		b->loc_of_body = read_word();
        DEBUG_XY("\t\tloc_of_body", b->loc_of_body);

		b->orientation = read_word();

        // ORIENTATION+400000 (IF LOCATION FOLLOWS)
		if (b->orientation >= 0400000) {

            b->card_loc = read_half_word();
            b->body_loc = read_half_word();

            /* create the reference designator */
            b->refdes[0] = '0' + ((b->body_loc >> 15) & 7);
            b->refdes[1] = ('A'-1) + ((b->body_loc >> 12) & 7);
            const int n = (b->body_loc >> 6) & 077;
            sprintf(&b->refdes[2], "%02d", n);
            b->refdes[4] = 0;
            DEBUG("\t\trefdes '%s'\n", b->refdes);

            b->const_offset = read_word();
            b->char_offset  = read_word();

        }

		b->body_bits = read_half_word();
        DEBUG("\t\tbody bits %d\n", b->body_bits);

		b->body_id   = read_half_word();
        DEBUG("\t\tbody id %d %06o\n", b->body_id, b->body_id);

        b->name_of_body_def = parse_7bit_ascii();
        DEBUG("\t\tname_of_body_def %s\n", b->name_of_body_def);

        DEBUG("\t\tprops:\n");

		while (1) {
            BREAK_IF_NEXT_WORD_IS(0);

            assert (b->prop_count < MAX_BODY_DEF_PROPS);

			struct prop_s *pp = new_prop();
			b->props[b->prop_count++] = pp;

            pp->value = parse_7bit_ascii();
            pp->name = parse_7bit_ascii();

            DEBUG("\t\t\t'%s' -> '%s'\n", pp->name, pp->value);

			pp->text_size       = read_word();
			pp->text_location   = read_word();
			pp->constant_offset = read_word();
        }

        add_body(b);

        DEBUG("\t/BODY(%zu)\n", half_words_idx);

	}

    DEBUG("/BODYs(%zu)\n", half_words_idx);
}

static void
parse_points(void)
{
    DEBUG("POINTs(%zu)\n", half_words_idx);	

	while (1) {
        BREAK_IF_NEXT_WORD_IS(0400000);

        DEBUG("\tPOINT(%zu)\n", half_words_idx);

        struct point_s point;
        memset(&point, 0, sizeof(point));
	    struct point_s *pnt = &point;

        pnt->loc_of_point = read_word();
        DEBUG_XY("\t\tloc_of_point", pnt->loc_of_point);

        pnt->id = read_word();
        DEBUG_ID("\t\tpoint id", pnt->id);

		pnt->down_id = read_word();
        DEBUG_ID("\t\tdown_id", pnt->down_id);

		pnt->up_id = read_word();
        DEBUG_ID("\t\tup_id", pnt->up_id);

        pnt->left_id = read_word();
        DEBUG_ID("\t\tleft_id", pnt->left_id);

        pnt->right_id = read_word();
        DEBUG_ID("\t\tright_id", pnt->right_id);

		pnt->bits = read_half_word();
        DEBUG("\t\tbits %d %06o\n", pnt->bits, pnt->bits);
        DEBUG("\t\tbits "BYTE_TO_BINARY_PATTERN" "BYTE_TO_BINARY_PATTERN" "BYTE_TO_BINARY_PATTERN"\n",
            BYTE_TO_BINARY(pnt->bits>>16), BYTE_TO_BINARY(pnt->bits>>8), BYTE_TO_BINARY(pnt->bits));

        pnt->pin_name = read_half_word();

		pnt->size_of_text = read_word();
        DEBUG_WORD("\t\tsize_of_text", pnt->size_of_text);
    
        // IF SIZE OF TEXT NOT 0, THE NEXT TWO FOLLOW
        if (pnt->size_of_text != 0) {
            pnt->const_offset_from_point_loc = read_word();
            pnt->name = parse_7bit_ascii();
            DEBUG("\t\tname '%s'\n", pnt->name);

            // IF CPIN ON IN BITS
            // bit 16 is not written anywhere, it is identified experimentally
            if ((pnt->bits & (1 << 16)) != 0) {
                DEBUG("\t\tCPIN ON\n");
                read_half_word(); // card loc
                read_half_word(); // io loc
                pnt->const_offset = read_word();
            }
        }

        /*
		if (pnt->name != NULL) {
			
            DEBUG("\t\tsignal '%s' (%d, %d)\n", 
                pnt->name, 
                pnt->id[0], 
                pnt->id[1]);

            add_signal(pnt->name, pnt->id[0], pnt->id[1]);

		} else {

			struct signal_s *s;

			if (pnt->id[0] == 0 && pnt->id[1] == 0)
				s = 0;
			else
				s = find_signal(pnt->id[0], pnt->id[1]);

			if (s) {
				if (s->pin == 0) {

					s->pin = pnt->pinname;
					s->body = find_body(pnt->id[1]);

				} else {

                    // already set

				}
			}
		}*/

		add_point(pnt);

        DEBUG("\t/POINT(%zu)\n", half_words_idx);

	}
	
    DEBUG("/POINTs(%zu)\n", half_words_idx);
}

static void
parse_set_centers(void)
{
	DEBUG("SET_CENTER(%zu)\n", half_words_idx);

    memset(&set_centers, 0, sizeof(set_centers));

	while (1) {
        BREAK_IF_NEXT_WORD_IS(0400000);

        DEBUG("\tSET_CENTER(%zu)\n", half_words_idx);

        //assert (set_center_count < MAX_SET_CENTERS);
		//struct set_center_s *sc = &set_centers[set_center_count++];

        struct set_center_s set_center;
        struct set_center_s *sc = &set_center;

		/* loc of set center */
		sc->loc = read_word();
        DEBUG_XY("\t\tloc", sc->loc);

        sc->body_id_count = 0;
        sc->point_id_count = 0;

		DEBUG("\t\tbody id's:\n");

		while (1) {
            BREAK_IF_NEXT_WORD_IS(0);
            assert (sc->body_id_count < MAX_SET_CENTERS_BODY_IDS);
            sc->body_id[sc->body_id_count] = read_word();
            sc->body_id_count++;
		}

        DEBUG("\t\tpoint id's:\n");
		
		while (1) {
            BREAK_IF_NEXT_WORD_IS(0);
            assert (sc->point_id_count < MAX_SET_CENTERS_POINT_IDS);
            sc->point_id[sc->point_id_count] = read_word();
            sc->point_id_count++;
		}

        DEBUG("\t/SET_CENTER(%zu)\n", half_words_idx);
	}

    DEBUG("/SET_CENTER(%zu)\n", half_words_idx);
}

static void
parse_trailer(void)
{
    DEBUG("TRAILER(%zu)\n", half_words_idx);

    memset(trailer, 0, sizeof(struct trailer_s));

    trailer->drawn_by = parse_7bit_ascii();
	DEBUG("\tdrawn by: '%s'\n", trailer->drawn_by);

    trailer->title_line_1 = parse_7bit_ascii();
    DEBUG("\ttitle 1: '%s'\n", trailer->title_line_1);

	trailer->title_line_2 = parse_7bit_ascii();
    DEBUG("\ttitle 2: '%s'\n", trailer->title_line_2);

    trailer->card_loc = read_word();
    DEBUG("\tcard_loc: (%llu, %llu)\n", 
        LEFT_HALF_WORD(trailer->card_loc),
        RIGHT_HALF_WORD(trailer->card_loc));

    trailer->revision = parse_7bit_ascii();
    DEBUG("\trevision: '%s'\n", trailer->revision);

    trailer->module = parse_7bit_ascii();
    DEBUG("\tmodule: '%s'\n", trailer->module);

    trailer->variable = parse_7bit_ascii();
    DEBUG("\tvariable: '%s'\n", trailer->variable);

    trailer->prefix = parse_7bit_ascii();
    DEBUG("\tprefix: '%s'\n", trailer->prefix);

    trailer->project = parse_7bit_ascii();
    DEBUG("\tproject: '%s'\n", trailer->project);

    trailer->page = parse_7bit_ascii();
    DEBUG("\tpage: '%s'\n", trailer->page);

    trailer->of = parse_7bit_ascii();
    DEBUG("\tof: '%s'\n", trailer->of);

    trailer->drawing_code = parse_7bit_ascii();
    DEBUG("\tdrawing code: '%s'\n", trailer->drawing_code);

    trailer->site_line_1 = parse_7bit_ascii();
    DEBUG("\tsite line 1: '%s'\n", trailer->site_line_1);

    trailer->site_line_2 = parse_7bit_ascii();
    DEBUG("\tsite line 2: '%s'\n", trailer->site_line_2);

    trailer->next_higher_assembly_number = parse_7bit_ascii();
    DEBUG("\tnext higher assembly number: '%s'\n", 
        trailer->next_higher_assembly_number);

    trailer->drawn_by_filespec = parse_6bit_ascii();
    DEBUG("\tdrawn by filespec: '%s'\n", trailer->drawn_by_filespec);

    trailer->checked_by_filespec = parse_6bit_ascii();
    DEBUG("\tchecked by filespec: '%s'\n", trailer->checked_by_filespec);

    trailer->engineered_by_filespec = parse_6bit_ascii();
    DEBUG("\tengineered by filespec: '%s'\n", trailer->engineered_by_filespec);

    DEBUG("/TRAILER(%zu)\n", half_words_idx);
}

static void
parse_extra_declarations(void)
{
    DEBUG("EXTRA_PARTS(%zu)\n", half_words_idx);
    
    while (1) {
        BREAK_IF_NEXT_WORD_IS(0);
        char *description = parse_7bit_ascii();
        DEBUG("\tdescription '%s'\n", description);
        // not used
        free(description);

        char *part_number = parse_7bit_ascii();
        DEBUG("\tpart number '%s'\n", part_number);
        // not used
        free(part_number);

        while (1) {
            BREAK_IF_NEXT_WORD_IS(0);
            __attribute__((unused)) WORD number_of_parts = read_word();
            __attribute__((unused)) WORD part_loc = read_word();
        }
    }

    DEBUG("/EXTRA_PARTS(%zu)\n", half_words_idx);
}

static void
parse_signals(void)
{
    DEBUG("SIGNALS(%zu)\n", half_words_idx);
    
    while (1) {
        BREAK_IF_NEXT_WORD_IS(0);
        char *name = parse_7bit_ascii();
        DEBUG("\tname '%s'\n", name);
        // not used
        free(name);

        char *property_name = parse_7bit_ascii();
        DEBUG("\tproperty name '%s'\n", property_name);
        // not used
        free(property_name);

        char *property_value = parse_7bit_ascii();
        DEBUG("\tproperty value '%s'\n", property_value);
        // not used
        free(property_value);
    }

    DEBUG("/SIGNALS(%zu)\n", half_words_idx);
}

static void
parse_dip_definitions(void)
{
    DEBUG("DIP_DEFINITIONS(%zu)\n", half_words_idx);
    
    while (1) {
        BREAK_IF_NEXT_WORD_IS(0);
        char *filespec = parse_6bit_ascii();
        DEBUG("\tdip definition filespec '%s'\n", filespec);
        // not used
        free(filespec);
    }

    DEBUG("/DIP_DEFINITIONS(%zu)\n", half_words_idx);
}

static void
parse_wire_rule_checks(void)
{
    DEBUG("WIRE_RULE_CHECKS(%zu)\n", half_words_idx);

    while (1) {
        BREAK_IF_NEXT_WORD_IS(0);
        char *filespec = parse_6bit_ascii();
        DEBUG("\twire rule check filespec '%s'\n", filespec);
        // not used
        free(filespec);
    }

    DEBUG("/WIRE_RULE_CHECKS(%zu)\n", half_words_idx);
}

static void
parse_suds()
{
    // clear counters and memory
    memset(header, 0, sizeof(struct header_s));
    body_defs_count = 0;
    memset(body_defs, 0, sizeof(body_defs));
    bodies_count = 0;
    memset(bodies, 0, sizeof(bodies));
    points_count = 0;
    memset(&points, 0, sizeof(points));
    set_centers_count = 0;
    memset(set_centers, 0, sizeof(set_centers));
    memset(trailer, 0, sizeof(struct trailer_s));
    signals_count = 0;
    memset(signals, 0, sizeof(signals));

    // start parsing from word 0
	half_words_idx = 0;

    DEBUG("PARSE_SUDS(%zu)\n", half_words_idx);

	parse_header();
	parse_body_defs();
	parse_macros();
	parse_bodies();
	parse_points();
    parse_set_centers();
    parse_trailer();
    parse_extra_declarations();
    parse_signals();
    parse_dip_definitions();
    parse_wire_rule_checks();
	
    DEBUG("/PARSE_SUDS(%zu)\n", half_words_idx);

	if (half_words_idx < half_words_len) {
		DEBUG("REACHED END OF FILE at word %zu (file has %zu words)\n", half_words_idx, half_words_len);
	}	
    
}

static void
free_suds()
{
    free(header->source_name);
    free(header->page_name);
    free(header->nomenclature_type);
    free(header->board_type);

    for (size_t i = 0; i < header->type_names_of_library_bodies_count; i++) {
        free(header->type_names_of_library_bodies[i]);
    }

    for (size_t i = 0; i < header->library_file_specs_count; i++) {
        free(header->library_file_specs[i]);
    }

    for (size_t i = 0; i < LEN(body_defs); i++) {
        struct body_def_s *bd = &body_defs[i];
        free(bd->name);
        for (size_t j = 0; j < bd->prop_count; j++) {
            free(bd->props[j]->value);
            free(bd->props[j]->name);
            free(bd->props[j]);
        }
    }

    for (size_t i = 0; i < LEN(bodies); i++) {
        struct body_s *b = &bodies[i];
        free(b->name_of_body_def);
        for (size_t j = 0; j < b->prop_count; j++) {
            free(b->props[j]->value);
            free(b->props[j]->name);
            free(b->props[j]);
        }
    }

    for (size_t i = 0; i < LEN(points); i++) {
        struct point_s *p = &points[i];
        free(p->name);
    }    

    free(trailer->drawn_by);
    free(trailer->title_line_1);
    free(trailer->title_line_2);
    free(trailer->revision);
    free(trailer->module);
    free(trailer->variable);
    free(trailer->prefix);
    free(trailer->project);
    free(trailer->page);
    free(trailer->of);
    free(trailer->drawing_code);
    free(trailer->site_line_1);
    free(trailer->site_line_2);
    free(trailer->next_higher_assembly_number);
    free(trailer->drawn_by_filespec);
    free(trailer->checked_by_filespec);
    free(trailer->engineered_by_filespec);

    for (size_t i = 0; i < LEN(signals); i++) {
        struct signal_s *s = &signals[i];
        free(s->name);
    }
}

/* ---------------------------------------------------------------- */

static void
set_name(char *filename)
{
	header->source_name = strdup(filename);

    char *p, *p1;

    char page_name[256] = {};

	p = filename;
	p1 = page_name;

	if (strchr(filename, '/')) {
		char *p2;
		p2 = filename + strlen(filename);
		while (*p2 != '/')
			p2--;
		p = p2+1;
	}

	while (*p) {
		if (*p == '.')
			break;
		*p1++ = toupper(*p);
		p++;
	}

	*p1 = 0;

    header->page_name = strdup(page_name);
}

static void
set_body_def_of_bodies(void)
{
    for (size_t i = 0; i < MAX_BODIES; i++) {
        struct body_s *b = &bodies[i];
        if (b->body_id == 0) continue;
        if (b->name_of_body_def == NULL) continue;
        b->body_def = find_body_def(b->name_of_body_def);
    }
}

static void
set_dip_type_of_bodies(void)
{
    for (size_t i = 0; i < MAX_BODIES; i++) {
        struct body_s *b = &bodies[i];
        if (b->body_id == 0) continue;
        if (b->refdes[0] == 0) continue;
        struct prop_s *prop = find_prop(b->props, b->prop_count, "DIPTYPE");
        if (prop != NULL) {
            b->dip_type = prop->value;
        } else if (b->body_def != NULL) {
            prop = find_prop(b->body_def->props, b->body_def->prop_count, "DIPTYPE");
            if (prop != NULL) {
                b->dip_type = prop->value;
            }
        }
        if (b->dip_type != NULL) {
            DEBUG("body refdes '%s' has DIPTYPE '%s'\n", b->refdes, b->dip_type);
        } else {
            DEBUG("body refdes '%s' has no DIPTYPE\n", b->refdes);
        }
    }
}

static char *
strlwr(char *s)
{
	for (char *p = s; *p; p++)
		*p = tolower(*p);
	return s;
}

__attribute__((unused))
static char *
format_name(char *s)
{
	static char b[256];

	if (strchr(s, ' ') || s[0] == '-' || s[0] == '@' || strchr(s, '=') || strchr(s, '.') || strchr(s, '/') || strchr(s, '-')) {
		sprintf(b, "\\%s\\", s);
		return strlwr(b);
	}

	return strlwr(s);
}

static int
dump_vhdl(void)
{
    if (trailer->title_line_2[0]) {

        DUMP_VHDL("-- %s -- %s\n",
            header->page_name,
            trailer->title_line_2);

    } else {

        DUMP_VHDL("-- %s\n", header->page_name);
        
    }

    DUMP_VHDL("library work;\n");
    DUMP_VHDL("use work.dip.all;\n");
    DUMP_VHDL("use work.misc.all;\n");
    DUMP_VHDL("\n");

	DUMP_VHDL("architecture suds of cadr_%s is\n", strlwr(header->page_name));
	DUMP_VHDL("begin\n");

	for (int i = 0; i < MAX_BODIES; i++) {

        struct body_s *b = find_body(i);

        if (b->body_id == 0) continue;
        if (b->body_def == NULL) continue;
        if (b->refdes[0] == 0) continue;

		/* hack */
		if (strcmp(b->body_def->name, "TABLE") == 0)
			continue;
		if (strcmp(b->body_def->name, "COMMENT") == 0)
			continue;
		if (strcmp(b->body_def->name, "BYPASS") == 0)
			continue;
		if (strcmp(b->refdes, "0@00") == 0)
			continue;

        // component is dip_<name>
		char dip_name[512];
        if (b->dip_type != NULL) {
            sprintf(dip_name, "dip_%s", strlwr(b->dip_type));
        } else {
            sprintf(dip_name, "dip_%s", strlwr(b->body_def->name));
        }
		// replace / and - with _ in the dip file
		// for example dip_sip220/330-8 becomes dip_sip220_330_8
		char* pdip_name = dip_name;
		while (*pdip_name != '\0') {
			if (*pdip_name == '/') *pdip_name = '_';
			if (*pdip_name == '-') *pdip_name = '_';
			pdip_name++;
		}

        // component instanatiation label is <PAGE>_<REFDES>
        char component_label[512];
        sprintf(component_label, "%s_%s", 
            strlwr(header->page_name), 
            strlwr(b->refdes));

        // <PAGE>_<REFDES> : dip_<BODY_NAME> port map
		DUMP_VHDL("%s : %s port map (", component_label, dip_name);

        int printed_once = 0;
        for (size_t j = 0; j < b->body_def->pin_count; j++) {
            
            struct point_s *p = &points[b->body_def->pins[j].loc_of_pin];

            if (printed_once != 0) DUMP_VHDL(", ");

            // p<PIN_NUMBER> => <NAME_OF_PIN>
            DUMP_VHDL("p%llu => %s",
                p->id,
                "");

            printed_once = 1;
        }

        /*
        int printed_once = 0;
		for (int j = 1; j < MAX_BODY_NAMED_PINS; j++) {
			int pi = b->named_pin_index[j];
			if (pi) {
				char *name_of_pin = format_name(points[pi].name);
				// ignore nc pins, because they are connected to both inputs and outputs and not helping anything
			    if (strcmp(name_of_pin, "nc") != 0) {
					if (printed_once != 0) DUMP_VHDL(", ");

                    // p<PIN_NUMBER> => <NAME_OF_PIN>
					DUMP_VHDL("p%d => %s",
						j,
						name_of_pin);

					printed_once = 1;
				}
			}
		}
        */

		DUMP_VHDL(");\n");
	}

	DUMP_VHDL("end architecture;\n");
	return 0;
}

static void
usage(char *argv[])
{
	fprintf(stderr, "usage: %s [-d] [-n] [-r] <suds file>\n", argv[0]);
	fprintf(stderr, "-d	enable debug (stderr)\n");
    fprintf(stderr, "-p enable debug parsing (stderr)\n");
    fprintf(stderr, "-n	dump VHDL (stdout)\n");
    fprintf(stderr, "-r	dump raw 18-bit words (stdout)\n");
    fprintf(stderr, "-w	dump raw 18-bit words, wide format (stdout)\n");
	exit(0);
}

extern char *optarg;
extern int optind;

int main(int argc, char *argv[])
{
	int c;

    int dump_vhdl_flag = 0;
    int dump_raw_flag = 0;

	while ((c = getopt(argc, argv, "dpnrw")) != -1) {
		switch (c) {
		case 'd':
			debug++;
			break;
        case 'p':
            debug_parsing++;
            break;
		case 'n':
			dump_vhdl_flag = 1;
			break;
		case 'r':
			dump_raw_flag = 1;
			break;
        case 'w':
			dump_raw_flag = 2;
			break;
		}
	}

	if (optind >= argc) usage(argv);
    
    char *suds_filename = argv[optind];    
    
    half_words = (uint32_t *) malloc(2*MAX_WORDS_IN_SUDS_FILE * sizeof(uint32_t));
    half_words_len = unpack(suds_filename, half_words, 2*MAX_WORDS_IN_SUDS_FILE);

    if (half_words_len > 0) {

        set_name(suds_filename);

        if (dump_raw_flag > 0) {

            dump_raw(dump_raw_flag, suds_filename);

        } else {

            DEBUG("%s\n", suds_filename);
            DEBUG("%zu words (18-bit)\n", half_words_len);

            parse_suds();
            set_body_def_of_bodies();
            set_dip_type_of_bodies();

            if (dump_vhdl_flag) {
                //find_all_net_names();
                dump_vhdl();
            }

            free_suds();

        }

    } else {

        fprintf(stderr, "error: cannot unpack %s\n", suds_filename);

    }

    free(half_words);

	exit(0);
}

