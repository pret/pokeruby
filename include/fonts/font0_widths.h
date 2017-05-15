#if ENGLISH
#define GLYPH_F0_10_WIDTH 6
#define GLYPH_F0_25_WIDTH 6
#elif GERMAN
#define GLYPH_F0_10_WIDTH 8
#define GLYPH_F0_25_WIDTH 8
#endif

#if ENGLISH && REVISION == 0
#define GLYPH_F0_1E_WIDTH 5
#define GLYPH_F0_2C_WIDTH 6
#define GLYPH_F0_30_WIDTH 7
#define GLYPH_F0_31_WIDTH 7
#define GLYPH_F0_32_WIDTH 7
#define GLYPH_F0_36_WIDTH 7
#define GLYPH_F0_52_WIDTH 3
#define GLYPH_F0_68_WIDTH 8
#define GLYPH_F0_6F_WIDTH 6
#define GLYPH_F0_84_WIDTH 7
#define GLYPH_F0_85_WIDTH 7
#define GLYPH_F0_86_WIDTH 7
#define GLYPH_F0_88_WIDTH 6
#define GLYPH_F0_A0_WIDTH 7
#else
#define GLYPH_F0_1E_WIDTH 4
#define GLYPH_F0_2C_WIDTH 8
#define GLYPH_F0_30_WIDTH 8
#define GLYPH_F0_31_WIDTH 8
#define GLYPH_F0_32_WIDTH 8
#define GLYPH_F0_36_WIDTH 3
#define GLYPH_F0_52_WIDTH 4
#define GLYPH_F0_68_WIDTH 6
#define GLYPH_F0_6F_WIDTH 4
#define GLYPH_F0_84_WIDTH 5
#define GLYPH_F0_85_WIDTH 6
#define GLYPH_F0_86_WIDTH 6
#define GLYPH_F0_88_WIDTH 8
#define GLYPH_F0_A0_WIDTH 8
#endif

#define W(IDX) GLYPH_F0_ ## IDX ## _WIDTH

static const u8 sFont0Widths[] =
{
        3,     6,     6,     6,     6,     6,     6,     6,
        6,     6,     8,     6,     6,     6,     6,     6,
    W(10),     6,     6,     6,     6,     6,     6,     6,
        8,     6,     6,     6,     6,     6, W(1E),     8,
        6,     6,     6,     6,     6, W(25),     6,     6,
        6,     6,     6,     6, W(2C),     6,     6,     8,
    W(30), W(31), W(32),     8,     8,     8, W(36),     8,
        8,     8,     8,     8,     8,     8,     8,     8,
        8,     8,     8,     8,     8,     8,     8,     8,
        8,     8,     8,     8,     8,     8,     8,     8,
        7,     6, W(52),     8,     8,     8,     7,     8,
        8,     4,     6,     6,     4,     4,     8,     8,
        8,     8,     8,     8,     8,     8,     8,     8,
    W(68),     7,     8,     7,     7,     8,     8, W(6F),
        7,     8,     8,     8,     8,     8,     7,     8,
        7,     7,     7,     7,     7,     7,     8,     7,
        7,     7,     7,     7, W(84), W(85), W(86),     8,
    W(88),     8,     8,     8,     8,     8,     8,     8,
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
