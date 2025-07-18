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
#include <ctype.h>
#include <libgen.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "soap4.h"
#include "unpack4.h"

#define MAX_HALF_WORDS (1024*1024)

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

#define LEN(x) (sizeof(x)/sizeof(x[0]))

#define DEBUG(...) { if (debug) fprintf(stderr, __VA_ARGS__); }
#define DUMP_RAW(...) { fprintf(stderr, __VA_ARGS__); }
#define DUMP_VHDL(...) { fprintf(stdout, __VA_ARGS__); }

#define LEFT_HALF_WORD(x) ((x >> 18) & 0777777)
#define RIGHT_HALF_WORD(x) (x & 0777777)

#define X_WORD(x) LEFT_HALF_WORD(x)
#define Y_WORD(x) RIGHT_HALF_WORD(x)

#define PIN_ID_OF_POINT_ID(point_id) LEFT_HALF_WORD(point_id)
#define BODY_ID_OF_POINT_ID(point_id) RIGHT_HALF_WORD(point_id)

#define DEBUG_HALF_WORD(name, value) \
    DEBUG("%s %u\n", name, value)

#define DEBUG_WORD(name, value) \
    DEBUG("%s %llu\n", name, value)

#define DEBUG_ID_PAIR(s, id) \
    DEBUG("%s id(%u, %u) (#o%06o, #o%06o)\n", s, \
        id.x, id.y, id.x, id.y)

#define DEBUG_ID(s, id) \
    DEBUG("%s id(%u) (#o%06o)\n", s, id, id)

#define DEBUG_XY(s, xy) DEBUG("%s xy(%d, %d)\n", s, xy.x, xy.y)

static void
DEBUG_BITS(char *s, HALF_WORD bits)
{
    DEBUG("%s #o%06o #b", s, bits);
    for (int i = 0; i < 18; i++) {
        DEBUG("%c", (bits & (1 << (17 - i))) ? '1' : '0');
    }
    DEBUG("\n");
}

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

static void 
parser_push()
{
    assert (half_words_idx_stack_idx < LEN(half_words_idx_stack));
    half_words_idx_stack[half_words_idx_stack_idx++] = half_words_idx;
}

static void 
parser_pop()
{
    assert (half_words_idx_stack_idx > 0);
    half_words_idx = half_words_idx_stack[--half_words_idx_stack_idx];
}

// read 18-bit half-word without debug output
static HALF_WORD 
read_half_word_no_debug(void) {
    assert (half_words_idx < half_words_len);
    HALF_WORD result = half_words[half_words_idx++] & 0777777;
    return result;
}

// 18-bit half-word
static HALF_WORD 
read_half_word(void) {
    HALF_WORD result = read_half_word_no_debug();
    if (debug_parsing) printf("read_half_word #o%06o\n", result);
    return result;
}

// 36-bit word
// word = half-word1 << 18 | half-word2
static WORD 
read_word(void) {
    WORD w1 = read_half_word_no_debug();
    WORD w2 = read_half_word_no_debug();
    WORD result = (w1 << 18) | w2;
    if (debug_parsing) printf("read_word #o%012llo (#o%06llo, #o%06llo)\n", 
        result, w1, w2);
    return result;
}

// 36-bit word to x,y signed int
static void 
read_pair(struct pair_s *result) {
    result->x = read_half_word_no_debug();
    result->y = read_half_word_no_debug();
    if (debug_parsing) printf("read_pair %d %d (#o%06o, #o%06o)\n", 
        result->x, result->y, result->x, result->y);
}

/* sign extend the half word */
SIGNED_HALF_WORD
int18(HALF_WORD n)
{
	if (n & (1 << 17)) return n | 0xfffc0000;
	return n;
}

// 36-bit word to x,y signed int
static void 
read_signed_pair(struct signed_pair_s *result) {
    HALF_WORD w1 = read_half_word_no_debug();
    HALF_WORD w2 = read_half_word_no_debug();
    result->x = int18(w1);
    result->y = int18(w2);
    if (debug_parsing) printf("read_signed_pair %d %d (#o%06o, #o%06o)\n", 
        result->x, result->y, w1, w2);
}

static WORD 
peek_word() {
    parser_push();
    WORD w1 = read_half_word_no_debug();
    WORD w2 = read_half_word_no_debug();
    parser_pop();
    WORD result = (w1 << 18) | w2;
    if (debug_parsing) printf("peek_word #o%012llo (#o%06llo, #o%06llo)\n", 
        result, w1, w2);
    return result;
} 

struct body_def_s *
find_body_def(char *name)
{
    assert (name != NULL);
    assert (name[0] != 0);

    for (size_t i = 0; i < body_defs_count; i++) {
        struct body_def_s *bd = &body_defs[i];
        if (bd->name == NULL) continue;
        if (bd->name[0] == 0) continue;
        if (strcmp(bd->name, name) == 0) return bd;
    }

    return NULL;
}

struct point_s *
find_point_by_pin_id_and_body_id(HALF_WORD pin_id, HALF_WORD body_id)
{
    for (size_t i = 0; i < points_count; i++) {
        struct point_s *p = &points[i];
        if (p->down_id.x == pin_id && p->down_id.y == body_id) return p;
        if (p->up_id.x == pin_id && p->up_id.y == body_id) return p;
        if (p->left_id.x == pin_id && p->left_id.y == body_id) return p;
        if (p->right_id.x == pin_id && p->right_id.y == body_id) return p;
    }

    return NULL;
}

struct prop_s *
find_prop(struct prop_s *props, size_t prop_count, char *name)
{
    for (size_t i = 0; i < prop_count; i++) {
        struct prop_s *p = &props[i];
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

#define MAX_MANAGED_STRDUPS 10000
static size_t managed_strdups_count = 0;
static char *managed_strdups[MAX_MANAGED_STRDUPS] = {0};

static char*
managed_strdup(char *s)
{
    assert (managed_strdups_count < MAX_MANAGED_STRDUPS);
    char *managed_s = strdup(s);
    assert (managed_s != NULL);
    managed_strdups[managed_strdups_count++] = managed_s;
    return managed_s;
}

static void
free_managed_strdups(void)
{
    for (size_t i = 0; i < managed_strdups_count; i++) {
        free(managed_strdups[i]);
    }

    managed_strdups_count = 0;
}

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

    // this looks like an infinite loop but EOF is asserted in read_word
    // an assertion means the file is corrupted
    while (1) {
        WORD word = read_word();
        for (size_t i = 0; i < chars_per_word; i++) {
            uint16_t c = (word >> (36 - bit_per_char*(i+1))) & mask;
            assert (s_idx < LEN(buffer));
            buffer[s_idx++] = conversion_func(c);
            if (c == 0) {
                return managed_strdup(buffer);
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

    // this looks like an infinite loop but EOF is asserted in read_word
    // an assertion means the file is corrupted
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

	while (1) {
		BREAK_IF_NEXT_WORD_IS(0);
        DEBUG("\tBODY_DEF(%zu)\n", half_words_idx);                

        assert (body_defs_count < MAX_BODY_DEFS);
        struct body_def_s *bd = &body_defs[body_defs_count++];

        bd->name = parse_7bit_ascii();
        DEBUG("\t\tname '%s'\n", bd->name);

        // dont know what this is
        // it exists in original soap.c but not described in suds.txt
        parse_7bit_ascii();

        bd->bits = read_half_word();
        DEBUG_BITS("\t\tbits", bd->bits);

        // unused
        read_half_word();

		read_signed_pair(&bd->loc_offset);
        DEBUG_XY("\t\tloc_offset", bd->loc_offset);

		read_signed_pair(&bd->loc_char_offset);
        DEBUG_XY("\t\tloc_char_offset", bd->loc_char_offset);

        DEBUG("\t\tpins:\n");

		while (1) {
			BREAK_IF_NEXT_WORD_IS(0400000);

            assert (bd->pin_count < MAX_BODY_DEF_PINS);

            struct pin_s *pin = &bd->pins[bd->pin_count++];

			read_signed_pair(&pin->loc_of_pin);
            DEBUG_XY("\t\t\tloc_of_pin", pin->loc_of_pin);

			pin->bits = read_half_word();
            DEBUG_BITS("\t\t\tpin bits", pin->bits);

			pin->id = read_half_word();
            DEBUG_ID("\t\t\tpin id %d",  pin->id);

			pin->pos = read_half_word();
            DEBUG_HALF_WORD("\t\t\tpin pos", pin->pos);
			
            pin->name = read_half_word();
            DEBUG_HALF_WORD("\t\t\tpin name", pin->name);
		}

		while (1) {
            BREAK_IF_NEXT_WORD_IS(0400000);
            read_word();
			bd->line_count++;
		}

        DEBUG("\t\t# of lines: %zu\n", bd->line_count);

        DEBUG("\t\tprops:\n");

		while (1) {
            BREAK_IF_NEXT_WORD_IS(0);

            assert (bd->prop_count < MAX_BODY_DEF_PROPS);

			struct prop_s *prop = &bd->props[bd->prop_count++];

            prop->value = parse_7bit_ascii();
			prop->name = parse_7bit_ascii();

            DEBUG("\t\t\t'%s' -> '%s'\n", prop->name, prop->value);

			prop->text_size = read_word();

			read_signed_pair(&prop->text_location);
			read_signed_pair(&prop->constant_offset);
		}

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

	while (1) {
        BREAK_IF_NEXT_WORD_IS(0400000);
        
		DEBUG("\tBODY(%zu)\n", half_words_idx);

        assert (bodies_count < MAX_BODIES);
        struct body_s *b = &bodies[bodies_count++];

		read_signed_pair(&b->loc);
        DEBUG_XY("\t\tloc_of_body", b->loc);

		b->orientation = read_word();

        // ORIENTATION+400000 (IF LOCATION FOLLOWS)
		if (b->orientation >= 0400000) {

            b->card_loc = read_half_word();
            DEBUG_HALF_WORD("\t\tcard_loc", b->card_loc);

            b->body_loc = read_half_word();
            DEBUG_HALF_WORD("\t\tbody_loc", b->body_loc);

            // create the reference designator
            b->refdes[0] = '0' + ((b->body_loc >> 15) & 7);
            b->refdes[1] = ('A'-1) + ((b->body_loc >> 12) & 7);
            const int n = (b->body_loc >> 6) & 077;
            sprintf(&b->refdes[2], "%02d", n);
            b->refdes[4] = 0;
            DEBUG("\t\trefdes '%s'\n", b->refdes);

            read_signed_pair(&b->const_offset);
            read_signed_pair(&b->char_offset);

        }

		b->bits = read_half_word();
        DEBUG_BITS("\t\tbody bits", b->bits);

		b->id = read_half_word();
        DEBUG_ID("\t\tbody id", b->id);

        b->name_of_body_def = parse_7bit_ascii();
        DEBUG("\t\tname_of_body_def %s\n", b->name_of_body_def);

        DEBUG("\t\tprops:\n");

		while (1) {
            BREAK_IF_NEXT_WORD_IS(0);

            assert (b->prop_count < MAX_BODY_DEF_PROPS);

			struct prop_s *prop = &b->props[b->prop_count++];

            prop->value = parse_7bit_ascii();
            prop->name = parse_7bit_ascii();

            DEBUG("\t\t\t'%s' -> '%s'\n", prop->name, prop->value);

			prop->text_size = read_word();

			read_signed_pair(&prop->text_location);
			read_signed_pair(&prop->constant_offset);
        }

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

        assert (points_count < MAX_POINTS);
	    struct point_s *pnt = &points[points_count++];

        read_signed_pair(&pnt->loc);
        DEBUG_XY("\t\tloc_of_point", pnt->loc);

        read_pair(&pnt->id);
        DEBUG_ID_PAIR("\t\tpoint id", pnt->id);

		read_pair(&pnt->down_id);
        DEBUG_ID_PAIR("\t\tdown_id", pnt->down_id);

		read_pair(&pnt->up_id);
        DEBUG_ID_PAIR("\t\tup_id", pnt->up_id);

        read_pair(&pnt->left_id);
        DEBUG_ID_PAIR("\t\tleft_id", pnt->left_id);

        read_pair(&pnt->right_id);
        DEBUG_ID_PAIR("\t\tright_id", pnt->right_id);

		pnt->bits = read_half_word();
        DEBUG_BITS("\t\tbits", pnt->bits);

        pnt->pin_name = read_half_word();
        DEBUG_HALF_WORD("\t\tpin_name", pnt->pin_name);

		pnt->size_of_text = read_word();
        DEBUG_WORD("\t\tsize_of_text", pnt->size_of_text);
    
        // IF SIZE OF TEXT NOT 0, THE NEXT TWO FOLLOW
        if (pnt->size_of_text != 0) {
            read_signed_pair(&pnt->const_offset_from_point_loc);
            pnt->name = parse_7bit_ascii();
            DEBUG("\t\tname '%s'\n", pnt->name);
            // IF CPIN ON IN BITS
            // bit 16 is not written anywhere, it is identified experimentally
            if ((pnt->bits & (1 << 16)) != 0) {
                DEBUG("\t\tCPIN ON\n");

                pnt->card_loc = read_half_word();
                DEBUG_HALF_WORD("\t\tcard_loc", pnt->card_loc);

                pnt->io_loc = read_half_word();
                DEBUG_HALF_WORD("\t\tio_loc", pnt->io_loc);

                read_signed_pair(&pnt->const_offset);
            }
        }

        DEBUG("\t/POINT(%zu)\n", half_words_idx);

	}
	
    DEBUG("/POINTs(%zu)\n", half_words_idx);
}

static void
parse_set_centers(void)
{
	DEBUG("SET_CENTER(%zu)\n", half_words_idx);

	while (1) {
        BREAK_IF_NEXT_WORD_IS(0400000);

        DEBUG("\tSET_CENTER(%zu)\n", half_words_idx);

        //assert (set_center_count < MAX_SET_CENTERS);
		//struct set_center_s *sc = &set_centers[set_center_count++];

        struct set_center_s set_center;
        struct set_center_s *sc = &set_center;

		/* loc of set center */
		read_signed_pair(&sc->loc);
        DEBUG_XY("\t\tloc", sc->loc);

        sc->body_id_count = 0;
        sc->point_id_count = 0;

		while (1) {
            BREAK_IF_NEXT_WORD_IS(0);
            read_word();
            sc->body_id_count++;
		}

        DEBUG("\t\t# of body ids: %zu\n", sc->body_id_count);
		
		while (1) {
            BREAK_IF_NEXT_WORD_IS(0);
            read_word();
            sc->point_id_count++;
		}

        DEBUG("\t\t# of point ids: %zu\n", sc->point_id_count);

        DEBUG("\t/SET_CENTER(%zu)\n", half_words_idx);
	}

    DEBUG("/SET_CENTER(%zu)\n", half_words_idx);
}

static void
parse_trailer(void)
{
    DEBUG("TRAILER(%zu)\n", half_words_idx);

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

        char *part_number = parse_7bit_ascii();
        DEBUG("\tpart number '%s'\n", part_number);

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

        char *property_name = parse_7bit_ascii();
        DEBUG("\tproperty name '%s'\n", property_name);

        char *property_value = parse_7bit_ascii();
        DEBUG("\tproperty value '%s'\n", property_value);
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
    }

    DEBUG("/WIRE_RULE_CHECKS(%zu)\n", half_words_idx);
}

static void
parse_initialize(bool clear_body_defs)
{
    // clear counters and memory
    memset(header, 0, sizeof(struct header_s));
    if (clear_body_defs) {
        body_defs_count = 0;
        memset(body_defs, 0, sizeof(body_defs));
    }
    bodies_count = 0;
    memset(bodies, 0, sizeof(bodies));
    points_count = 0;
    memset(&points, 0, sizeof(points));
    set_centers_count = 0;
    memset(set_centers, 0, sizeof(set_centers));
    memset(trailer, 0, sizeof(struct trailer_s));
}

static void
parse_suds()
{
    // start parsing from word 0
	half_words_idx = 0;

    DEBUG("PARSE_SUDS(%zu)\n", half_words_idx);
    DEBUG("body_defs_count: %zu\n", body_defs_count);

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

/* ---------------------------------------------------------------- */

static char *
strlwr(char *s)
{
	for (char *p = s; *p; p++)
		*p = tolower(*p);
	return s;
}

static char *
format_signal_name(char *s)
{
	static char b[256];

	if (strchr(s, ' ') || s[0] == '-' || s[0] == '@' || strchr(s, '=') || strchr(s, '.') || strchr(s, '/') || strchr(s, '-')) {
		sprintf(b, "\\%s\\", s);
		return strlwr(b);
	}

	return strlwr(s);
}

static void
dump_vhdl(
    const char *page_name, 
    const char *architecture_name, 
    const char *entity_name)
{
    DEBUG("DUMP_VHDL('%s', '%s', '%s')\n", page_name, architecture_name, entity_name);

    if (trailer->title_line_2 != NULL && trailer->title_line_2[0] != 0) {

        DUMP_VHDL("-- %s -- %s\n",
            page_name,
            trailer->title_line_2);

    } else {

        DUMP_VHDL("-- %s\n", page_name);
        
    }

    DUMP_VHDL("library work;\n");
    DUMP_VHDL("use work.dip.all;\n");
    DUMP_VHDL("use work.misc.all;\n");
    DUMP_VHDL("\n");

	DUMP_VHDL("architecture %s of cadr_%s is\n", 
        architecture_name,
        entity_name);
	DUMP_VHDL("begin\n");

	for (size_t i = 0; i < bodies_count; i++) {

        struct body_s *b = &bodies[i];

        DEBUG_ID("body id", b->id);

        if (b->id == 0) continue;
        if (b->name_of_body_def == NULL) continue;
        if (b->name_of_body_def[0] == 0) continue;
        if (b->refdes[0] == 0) continue;

        DEBUG("body refdes '%s'\n", b->refdes);
        DEBUG("body def name '%s'\n", b->name_of_body_def);

        struct body_def_s *bd = find_body_def(b->name_of_body_def);
        assert (bd != NULL);

        struct prop_s *diptype_prop = find_prop(bd->props, bd->prop_count, "DIPTYPE");
        assert (diptype_prop != NULL);

        DEBUG("body def diptype '%s'\n", diptype_prop->value);

        // component is dip_<name>
		char component_name[64];
        char *diptype_lower = managed_strdup(diptype_prop->value);
        assert (strlen(diptype_lower) < 32);
        snprintf(component_name, LEN(component_name), "dip_%s", 
            strlwr(diptype_lower));            

		// replace / and - with _ in the dip file
		// for example dip_sip220/330-8 becomes dip_sip220_330_8
		char* pcomponent_name = component_name;
		while (*pcomponent_name != '\0') {
			if (*pcomponent_name == '/') *pcomponent_name = '_';
			if (*pcomponent_name == '-') *pcomponent_name = '_';
			pcomponent_name++;
		}

        DEBUG("component name '%s'\n", component_name);

        // component instanatiation label is <PAGE>_<REFDES>
        char component_label[64];
        char *refdes_lower = managed_strdup(b->refdes);
        assert (strlen(page_name) < 32);
        assert (strlen(refdes_lower) < 32);
        snprintf(component_label, LEN(component_label), "%s_%s", 
            page_name, 
            strlwr(refdes_lower));

        DEBUG("component label '%s'\n", component_label);

        // <PAGE>_<REFDES> : dip_<BODY_NAME> port map
		DUMP_VHDL("%s : %s port map (", component_label, component_name);

        bool printed_once = false;
        
        // there is a need for tracing from a body def pin to anything it can 
        // reach through points

        for (size_t j = 0; j < bd->pin_count; j++) {

            struct pin_s *pin = &bd->pins[j];

            DEBUG_ID("pin id", pin->id);

            for (size_t k = 0; k < points_count; k++) {

                struct point_s *point = &points[k];

                if ((point->down_id.x == pin->id && point->down_id.y == b->id) ||
                    (point->up_id.x == pin->id && point->up_id.y == b->id) ||
                    (point->left_id.x == pin->id && point->left_id.y == b->id) ||
                    (point->right_id.x == pin->id && point->right_id.y == b->id)) {

                    DEBUG_ID_PAIR("point id", point->id);

                    if (point == NULL) continue;
                    if (point->name == NULL) continue;

                    // p<PIN_NUMBER> => <NAME_OF_PIN>
                    if (printed_once) DUMP_VHDL(", ");
                    DUMP_VHDL("p%u => %s",
                        pin->id,
                        format_signal_name(point->name));
                    printed_once = true;

                }

            }
        }

		DUMP_VHDL(");\n");
	}

	DUMP_VHDL("end architecture;\n");

    DEBUG("/DUMP_VHDL\n");
}

static void
usage(char *argv[])
{
	fprintf(stderr, "usage: %s [-d] [-p] [-e <suds library file>] [-r or -v or -w] <suds file>\n", argv[0]);
	fprintf(stderr, "-d	enable debug (stderr)\n");
    fprintf(stderr, "-p enable debug parsing (stderr)\n");
    fprintf(stderr, "-e	also load body definitions from <suds library file>\n");
    fprintf(stderr, "-r	dump raw 18-bit words (stdout)\n");
    fprintf(stderr, "-v	dump VHDL (stdout)\n");
    fprintf(stderr, "-w	dump raw 18-bit words, wide format (stdout)\n");
	exit(0);
}

extern char *optarg;
extern int optind;

int main(int argc, char *argv[])
{
	int c;

    char *library_suds_filename = NULL;
    int dump_vhdl_flag = 0;
    int dump_raw_flag = 0;

	while ((c = getopt(argc, argv, "dpe:vrw")) != -1) {
		switch (c) {
		case 'd':
			debug++;
			break;
        case 'p':
            debug_parsing++;
            break;
        case 'e':
            library_suds_filename = managed_strdup(optarg);
            break;
		case 'r':
			dump_raw_flag = 1;
			break;
        case 'v':
			dump_vhdl_flag = 1;
			break;
        case 'w':
			dump_raw_flag = 2;
			break;
		}
	}

	if (optind >= argc) usage(argv);
    
    char *suds_filename = argv[optind];      

    half_words = (uint32_t *) malloc(
        MAX_HALF_WORDS * sizeof(uint32_t));

    if (dump_raw_flag > 0) {

        half_words_len = unpack(
            suds_filename, half_words, MAX_HALF_WORDS);

        dump_raw(dump_raw_flag, suds_filename);        

    } else {

        // clear everything
        parse_initialize(true);

        if (library_suds_filename != NULL) {

            half_words_len = unpack(
                library_suds_filename, 
                half_words,
                MAX_HALF_WORDS);

            parse_suds();

            // clear everything but body defs
            parse_initialize(false);
        }

        half_words_len = unpack(
            suds_filename, half_words, MAX_HALF_WORDS);

        parse_suds();

        DEBUG("%s\n", suds_filename);
        DEBUG("%zu words (18-bit)\n", half_words_len);

        // page name is base file name without extension
        char *page_name_copy = managed_strdup(basename(suds_filename));
        const char *page_name = page_name_copy;
        char *dot = strchr(page_name_copy, '.');
        if (dot != NULL) *dot = 0;

        assert (strlen(page_name) < 16);

        if (dump_vhdl_flag) {
            const char *architecture_name = "suds";
            // entity name is as same as the page name
            dump_vhdl(page_name, architecture_name, page_name);
        }

        free_managed_strdups();

    }

    free(half_words);

	exit(0);
}



