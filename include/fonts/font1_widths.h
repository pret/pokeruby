#if ENGLISH && REVISION == 0
#define GLYPH_F1_2C_WIDTH 6
#define GLYPH_F1_2D_WIDTH 6
#define GLYPH_F1_2E_WIDTH 6
#define GLYPH_F1_5C_WIDTH 5
#define GLYPH_F1_62_WIDTH 6
#else
#define GLYPH_F1_2C_WIDTH 7
#define GLYPH_F1_2D_WIDTH 5
#define GLYPH_F1_2E_WIDTH 5
#define GLYPH_F1_5C_WIDTH 8
#define GLYPH_F1_62_WIDTH 3
#endif

#define W(IDX) GLYPH_F1_ ## IDX ## _WIDTH

static const u8 sFont1Widths[] =
{
        5,     3,     8,     8,     8,     8,     8,     8,
        8,     4,     5,     4,     4,     8,     8,     8,
        8,     8,     8,     8,     8,     8,     8,     5,
        8,     8,     8,     8,     8,     4,     8,     8,
        8,     8,     8,     8,     8,     8,     8,     8,
        8,     8,     8,     8, W(2C), W(2D), W(2E),     5,
        6,     5,     5,     5,     5,     5,     5,     5,
        5,     4,     8,     4,     4,     5,     5,     5,
        5,     5,     5,     5,     5,     5,     5,     5,
        8,     4,     5,     5,     5,     5,     4,     8,
        4,     4,     5,     5,     5,     5,     5,     5,
        5,     5,     5,     5, W(5C),     5,     6,     6,
        8,     7, W(62),     5,     3,     3,     5,     4,
        3,     6,     6,     6,     7,     7,     8,     5,
        5,     5,     3,     5,     6,     5,     5,     5,
        5,     5,     5,     5,     5,     5,     5,     5,
        5,     5,     5,     5,     5,     5,     5,     5,
        4,     5,     5,     5,     5,     5,     5,     5,
        5,     5,     5,     4,     5,     5,     5,     5,
        4,     5,     5,     5,     5,     5,     5,     5,
        5,     5,     4,     4,     5,     3,     5,     5,
        5,     5,     5,     5,     5,     5,     5,     5,
        5,     5,     5,     5,     6,     6,     7,     7,
        7,     7,     6,     7,     6,     6,     7,     6,
        7,     7,     7,     6,     7,     6,     7,     6,
        7,     6,     6,     7,     6,     6,     3,     3,
        5,     5,     5,     5,     3,     3,     5,     5,
        5,     5,     5,     5,
};

#undef W
