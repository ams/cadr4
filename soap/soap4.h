#pragma once

#define WORD                uint64_t
#define HALF_WORD           uint32_t
#define SIGNED_HALF_WORD    int32_t

#define MAX_TYPE_NAMES_OF_LIBRARY_BODIES	100
#define MAX_LIBRARY_FILE_SPECS	            100

#define MAX_BODY_DEF_PINS    100
#define MAX_BODY_DEF_PROPS   100
#define MAX_BODY_PROPS       100

struct pair_s {
    HALF_WORD x;
    HALF_WORD y;
};

struct signed_pair_s {
    SIGNED_HALF_WORD x;
    SIGNED_HALF_WORD y;
};

struct header_s {
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
	struct signed_pair_s text_location;
	struct signed_pair_s constant_offset;
};

struct pin_s {
    struct signed_pair_s loc_of_pin;
    HALF_WORD bits;
    HALF_WORD id;
    HALF_WORD pos;
    HALF_WORD name;
};

struct body_def_s {
	char *name;
    HALF_WORD bits;
	struct signed_pair_s loc_offset;
    struct signed_pair_s loc_char_offset;

	size_t pin_count;
	struct pin_s pins[MAX_BODY_DEF_PINS];

	size_t line_count;
    //not stored because not used
	//WORD lines[MAX_BODY_DEF_LINES];

	size_t prop_count;
	struct prop_s props[MAX_BODY_DEF_PROPS];
};

struct body_s {	
	struct signed_pair_s loc;
	WORD orientation;
	HALF_WORD card_loc;
    HALF_WORD body_loc;
	struct signed_pair_s const_offset;
	struct signed_pair_s char_offset;
	HALF_WORD bits;
	HALF_WORD id;
    char *name_of_body_def;
	size_t prop_count;
	struct prop_s props[MAX_BODY_PROPS];

    // not-parsed
    // refdes is genearated not parsed
	char refdes[5];

    // used when dumping vhdl
    bool vhdl_dumped;
};

struct set_center_s {
	struct signed_pair_s loc;
	size_t body_id_count;
    //not stored because not used
	//WORD body_id[MAX_SET_CENTERS_BODY_IDS];
	size_t point_id_count;
    //not stored because not used
	//WORD point_id[MAX_SET_CENTERS_POINT_IDS];
};

struct point_s {
	struct signed_pair_s loc;
	struct pair_s id;
	struct pair_s down_id;
    struct pair_s up_id;
    struct pair_s left_id;
    struct pair_s right_id;
	HALF_WORD bits;
    HALF_WORD pin_name;
	WORD size_of_text;
	struct signed_pair_s const_offset;
	struct signed_pair_s const_offset_from_point_loc;
    // optional name
	char *name;
    // optional card_loc and io_loc
    HALF_WORD card_loc;
    HALF_WORD io_loc;
    // for BFS traversal
    bool visited;
    struct pair_s same_id;
};