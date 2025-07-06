#pragma once

#define WORD        uint64_t
#define HALF_WORD   uint32_t

#define MAX_TYPE_NAMES_OF_LIBRARY_BODIES	100
#define MAX_LIBRARY_FILE_SPECS	            100

// all char * that are result of parsing has to be freed
// they are strdup'ed

struct header_s {
	char *source_name;
    char *page_name;

    WORD version;
	char *nomenclature_type;
	char *board_type;

	size_t type_names_of_library_bodies_count;
	char *type_names_of_library_bodies[MAX_TYPE_NAMES_OF_LIBRARY_BODIES];

	size_t library_file_specs_count;
	char *library_file_specs[MAX_LIBRARY_FILE_SPECS];
};

struct trailer_s {
    char *drawn_by;
    char *title_line_1;
    char *title_line_2;
    WORD card_loc;
    char *revision;
    char *module;
    char *variable;
    char *prefix;
    char *project;
    char *page;
    char *of;
    char *drawing_code;
    char *site_line_1;
    char *site_line_2;
    char *next_higher_assembly_number;
    char *drawn_by_filespec;
    char *checked_by_filespec;
    char *engineered_by_filespec;
};

struct prop_s {
	char *value;
	char *name;
	WORD text_size;
	WORD text_location;
	WORD constant_offset;
};

#define MAX_BODY_DEF_PINS 100
#define MAX_BODY_DEF_LINES 100
#define MAX_BODY_DEF_PROPS 100

struct body_def_s {
	char *name;
    HALF_WORD bits;
	WORD loc_offset;
    WORD loc_char_offset;

	size_t pin_count;
	struct {
		WORD loc_of_pin;
		HALF_WORD bits;
        HALF_WORD pin_id;
		HALF_WORD pin_pos;
        HALF_WORD pin_name;
	} pins[MAX_BODY_DEF_PINS];

	size_t line_count;
	WORD lines[MAX_BODY_DEF_LINES];

	size_t prop_count;
	struct prop_s *props[MAX_BODY_DEF_PROPS];
};

#define MAX_BODY_NAMED_PINS 40

struct body_s {	
	WORD loc_of_body;
	WORD orientation;
	HALF_WORD card_loc;
    HALF_WORD body_loc;
	WORD const_offset;
	WORD char_offset;
	HALF_WORD body_bits;
	HALF_WORD body_id;
    char *name_of_body_def;
	size_t prop_count;
	struct prop_s *props[MAX_BODY_DEF_PROPS];

    // not-parsed
    // refdes is genearated not parsed
	char refdes[5];
    // body def is found from name_of_body_def
    struct body_def_s *body_def;
    // dip_type is found from props, no need to free this
    char *dip_type;
    // 
    int named_pin_index[MAX_BODY_NAMED_PINS];
};

#define MAX_SET_CENTERS_BODY_IDS 100
#define MAX_SET_CENTERS_POINT_IDS 100

struct set_center_s {
	WORD loc;
	size_t body_id_count;
	WORD body_id[MAX_SET_CENTERS_BODY_IDS];
	size_t point_id_count;
	WORD point_id[MAX_SET_CENTERS_POINT_IDS];
};

struct point_s {
	WORD loc_of_point;
	WORD id;
	WORD down_id, up_id, left_id, right_id;
	HALF_WORD bits;
    HALF_WORD pin_name;
	WORD size_of_text;
	WORD const_offset;
	WORD const_offset_from_point_loc;
	char *name;

    // not-parsed
	char visited;
	int named_pin_index;
};

struct signal_s {
	struct signal_s *next;
	char *name;
	WORD id;
	int pin;
	struct body_s *body;
};