#if ENGLISH
#define GLYPH_F3_10_WIDTH 6
#define GLYPH_F3_25_WIDTH 6
#elif GERMAN
#define GLYPH_F3_10_WIDTH 8
#define GLYPH_F3_25_WIDTH 8
#endif

#if ENGLISH && REVISION == 0
#define GLYPH_F3_2C_WIDTH 6
#define GLYPH_F3_36_WIDTH 8
#define GLYPH_F3_84_WIDTH 7
#define GLYPH_F3_85_WIDTH 7
#define GLYPH_F3_86_WIDTH 7
#define GLYPH_F3_A0_WIDTH 7
#else
#define GLYPH_F3_2C_WIDTH 8
#define GLYPH_F3_36_WIDTH 3
#define GLYPH_F3_84_WIDTH 5
#define GLYPH_F3_85_WIDTH 6
#define GLYPH_F3_86_WIDTH 6
#define GLYPH_F3_A0_WIDTH 8
#endif

#define W(IDX) GLYPH_F3_ ## IDX ## _WIDTH

static const u8 sFont3Widths[] =
{
        3,     6,     6,     6,     6,     6,     6,     6,
        6,     6,     8,     6,     6,     6,     6,     6,
    W(10),     6,     6,     6,     6,     6,     6,     6,
        8,     6,     6,     6,     6,     6,     4,     8,
        6,     6,     6,     6,     6, W(25),     6,     6,
        6,     6,     6,     6, W(2C),     6,     6,     8,
        8,     8,     8,     8,     8,     8, W(36),     8,
        8,     8,     8,     8,     8,     8,     8,     8,
        8,     8,     8,     8,     8,     8,     8,     8,
        8,     8,     8,     8,     8,     8,     8,     8,
        7,     6,     4,     8,     8,     8,     7,     8,
        8,     4,     6,     6,     4,     4,     8,     8,
        8,     8,     8,     8,     8,     8,     8,     8,
        6,     7,     8,     7,     7,     8,     8,     4,
        7,     8,     8,     8,     8,     8,     7,     8,
        7,     7,     7,     7,     7,     7,     8,     7,
        7,     7,     7,     7, W(84), W(85), W(86),     8,
        8,     8,     8,     8,     8,     8,     8,     8,
        8,     8,     8,     8,     8,     8,     8,     8,
        8,     8,     8,     8,     8,     8,     8,     8,
    W(A0),     6,     6,     6,     6,     6,     6,     6,
        6,     6,     6,     3,     6,     3,     5,     3,
        6,     6,     6,     3,     3,     6,     6,     6,
        3,     6,     6,     6,     6,     6,     6,     6,
        6,     6,     6,     6,     6,     6,     6,     6,
        6,     6,     6,     6,     6,     6,     6,     6,
        6,     6,     6,     6,     6,     6,     6,     6,
        6,     6,     6,     6,     6,     4,     5,     6,
        3,     6,     6,     6,     6,     6,     5,     6,
        6,     6,     6,     6,     6,     6,     6,     7,
        3,     6,     6,     6,     6,     6,     6,     7,
        7,     7,     7,     7,     1,     1,
};

#undef W
