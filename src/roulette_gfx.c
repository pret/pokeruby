#include "global.h"
#include "random.h"
#include "graphics.h"
#include "ewram.h"
#include "field_fadetransition.h"
#include "constants/game_stat.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "menu_cursor.h"
#include "menu_helpers.h"
#include "overworld.h"
#include "palette.h"
#include "pokemon.h"
#include "roulette.h"
#include "roulette_util.h"
#include "rtc.h"
#include "constants/songs.h"
#include "sound.h"
#include "script.h"
#include "constants/species.h"
#include "sprite.h"
#include "strings2.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "trig.h"
#include "scanline_effect.h"

asm(".include \"constants/gba_constants.inc\"");

s16 sub_811866C(struct Sprite *);
u8 sub_81186B8(struct Sprite *);
s16 sub_81186E8(struct Sprite *);
void sub_8118724(struct Sprite *);
void sub_8118834(struct Sprite *);
void sub_811889C(struct Sprite *);
void sub_81189A8(struct Sprite *);
void sub_8118B30(struct Sprite *);
void sub_8118BD8(struct Sprite *);
void sub_8118CAC(struct Sprite *);
void sub_8118CEC(struct Sprite *);
void sub_8118D2C(struct Sprite *);
void sub_8118DE4(struct Sprite *);
void sub_8118F8C(struct Sprite *);
void sub_8119088(struct Sprite *);
void sub_8119134(struct Sprite *);
void sub_8119224(struct Sprite *);
void sub_81193D4(struct Sprite *);
void sub_811952C(struct Sprite *);
void sub_8119780(struct Sprite *);
void sub_81197D8(struct Sprite *);
void sub_8119898(struct Sprite *);
void sub_8119964(struct Sprite *);
void sub_8119A90(struct Sprite *);
void sub_8119AAC(struct Sprite *);
void sub_8119B24(struct Sprite *);
void sub_8119BCC(struct Sprite *);
void sub_8119D08(struct Sprite *);
void sub_8119D80(struct Sprite *);

#ifdef ENGLISH
ALIGNED(4) const u16 RouletteSpritePalette_01[] = INCBIN_U16("graphics/roulette/shadow.gbapal");
const u16 RouletteSpritePalette_02[] = INCBIN_U16("graphics/roulette/ball.gbapal");
const u16 RouletteSpritePalette_03[] = INCBIN_U16("graphics/roulette/ball_counter.gbapal");
const u16 RouletteSpritePalette_04[] = INCBIN_U16("graphics/roulette/cursor.gbapal");
const u16 RouletteSpritePalette_05[] = INCBIN_U16("graphics/roulette/credit.gbapal");
const u16 RouletteSpritePalette_06[] = INCBIN_U16("graphics/roulette/shroomish.gbapal");
const u16 RouletteSpritePalette_07[] = INCBIN_U16("graphics/roulette/tailow.gbapal");
const u16 RouletteSpritePalette_08[] = INCBIN_U16("graphics/roulette/poke_icons.gbapal");
const u16 RouletteSpritePalette_09[] = INCBIN_U16("graphics/roulette/wynaut.gbapal");
const u16 RouletteSpritePalette_10[] = INCBIN_U16("graphics/roulette/azurill.gbapal");
const u16 RouletteSpritePalette_11[] = INCBIN_U16("graphics/roulette/skitty.gbapal");
const u16 RouletteSpritePalette_12[] = INCBIN_U16("graphics/roulette/makuhita.gbapal");
const u16 RouletteSpritePalette_13[] = INCBIN_U16("graphics/roulette/83F907C.gbapal");
const u16 RouletteSpritePalette_14[] = INCBIN_U16("graphics/roulette/83F909C.gbapal");
const u16 RouletteSpritePalette_15[] = INCBIN_U16("graphics/roulette/83F90BC.gbapal");
const u16 RouletteSpritePalette_16[] = INCBIN_U16("graphics/roulette/83F90DC.gbapal");
#else
extern const u16 RouletteSpritePalette_01[];
extern const u16 RouletteSpritePalette_02[];
extern const u16 RouletteSpritePalette_03[];
extern const u16 RouletteSpritePalette_04[];
extern const u16 RouletteSpritePalette_05[];
extern const u16 RouletteSpritePalette_06[];
extern const u16 RouletteSpritePalette_07[];
extern const u16 RouletteSpritePalette_08[];
extern const u16 RouletteSpritePalette_09[];
extern const u16 RouletteSpritePalette_10[];
extern const u16 RouletteSpritePalette_11[];
extern const u16 RouletteSpritePalette_12[];
extern const u16 RouletteSpritePalette_13[];
extern const u16 RouletteSpritePalette_14[];
extern const u16 RouletteSpritePalette_15[];
extern const u16 RouletteSpritePalette_16[];
#endif //ENGLISH

const u8 gUnknown_083F90FC[] = INCBIN_U8("graphics/roulette/ball.4bpp.lz");
const u8 RouletteBallCounterTiles[] = INCBIN_U8("graphics/roulette/ball_counter.4bpp.lz");
const u8 gUnknown_083F92A8[] = INCBIN_U8("graphics/roulette/roulette_tilt.4bpp.lz");
const u8 RoulettePokeIconsTiles[] = INCBIN_U8("graphics/roulette/poke_icons.4bpp.lz");
const u8 RoulettePokeIcons2Tiles[] = INCBIN_U8("graphics/roulette/poke_icons2.4bpp.lz");
const u8 gUnknown_083F9D3C[] = INCBIN_U8("graphics/roulette/shadow.4bpp.lz");
const u8 RouletteCursorTiles[] = INCBIN_U8("graphics/roulette/cursor.4bpp.lz");

const struct SpritePalette gUnknown_083F9E30[] = {
    {RouletteSpritePalette_01, 1 },
    {RouletteSpritePalette_02, 2 },
    {RouletteSpritePalette_03, 3 },
    {RouletteSpritePalette_04, 4 },
    {RouletteSpritePalette_05, 5 },
    {RouletteSpritePalette_06, 6 },
    {RouletteSpritePalette_07, 7 },
    {RouletteSpritePalette_08, 8 },
    {RouletteSpritePalette_09, 9 },
    {RouletteSpritePalette_10, 10},
    {RouletteSpritePalette_11, 11},
    {RouletteSpritePalette_12, 12},
    {RouletteSpritePalette_13, 13},
    {RouletteSpritePalette_14, 14},
    {RouletteSpritePalette_15, 15},
    {RouletteSpritePalette_16, 16},
    {}
};

const struct OamData gOamData_83F9EB8 = {
    .shape = ST_OAM_SQUARE,
    .size = 2,
    .priority = 1
};

const struct OamData gOamData_83F9EC0 = {
    .shape = ST_OAM_SQUARE,
    .size = 1,
    .priority = 1
};

const struct OamData gOamData_83F9EC8 = {
    .y = 60,
    .affineMode = ST_OAM_AFFINE_DOUBLE,
    .shape = ST_OAM_V_RECTANGLE,
    .size = 2,
    .priority = 2
};

const union AnimCmd gSpriteAnim_83F9ED0[] = {
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83F9ED8[] = {
    gSpriteAnim_83F9ED0
};

const union AffineAnimCmd gSpriteAffineAnim_83F9EDC[] = {
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83F9EE4[] = {
    gSpriteAffineAnim_83F9EDC
};

const struct CompressedSpriteSheet gUnknown_083F9EE8 = {
    RoulettePokeIcons2Tiles,
    0xC00,
    0
};

const union AnimCmd gSpriteAnim_83F9EF0[] = {
	ANIMCMD_FRAME(0, 0),
	ANIMCMD_FRAME(32, 0),
	ANIMCMD_FRAME(64, 0),
	ANIMCMD_FRAME(72, 0),
	ANIMCMD_FRAME(8, 0),
	ANIMCMD_FRAME(40, 0),
	ANIMCMD_FRAME(48, 0),
	ANIMCMD_FRAME(80, 0),
	ANIMCMD_FRAME(16, 0),
	ANIMCMD_FRAME(24, 0),
	ANIMCMD_FRAME(56, 0),
	ANIMCMD_FRAME(88, 0),
	ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83F9F24[] = {
    gSpriteAnim_83F9EF0 +  0
};

const union AnimCmd *const gSpriteAnimTable_83F9F28[] = {
    gSpriteAnim_83F9EF0 +  1
};

const union AnimCmd *const gSpriteAnimTable_83F9F2C[] = {
    gSpriteAnim_83F9EF0 +  2
};

const union AnimCmd *const gSpriteAnimTable_83F9F30[] = {
    gSpriteAnim_83F9EF0 +  3
};

const union AnimCmd *const gSpriteAnimTable_83F9F34[] = {
    gSpriteAnim_83F9EF0 +  4
};

const union AnimCmd *const gSpriteAnimTable_83F9F38[] = {
    gSpriteAnim_83F9EF0 +  5
};

const union AnimCmd *const gSpriteAnimTable_83F9F3C[] = {
    gSpriteAnim_83F9EF0 +  6
};

const union AnimCmd *const gSpriteAnimTable_83F9F40[] = {
    gSpriteAnim_83F9EF0 +  7
};

const union AnimCmd *const gSpriteAnimTable_83F9F44[] = {
    gSpriteAnim_83F9EF0 +  8
};

const union AnimCmd *const gSpriteAnimTable_83F9F48[] = {
    gSpriteAnim_83F9EF0 +  9
};

const union AnimCmd *const gSpriteAnimTable_83F9F4C[] = {
    gSpriteAnim_83F9EF0 + 10
};

const union AnimCmd *const gSpriteAnimTable_83F9F50[] = {
    gSpriteAnim_83F9EF0 + 11
};

const struct CompressedSpriteSheet gUnknown_083F9F54 = {
    gRouletteHeadersTiles,
    0x1600,
    4
};

const struct CompressedSpriteSheet gUnknown_083F9F5C = {
    RoulettePokeIconsTiles,
    0x400,
    5
};

const union AnimCmd gSpriteAnim_83F9F64[] = {
	ANIMCMD_FRAME(0, 0),
	ANIMCMD_FRAME(16, 0),
	ANIMCMD_FRAME(32, 0),
	ANIMCMD_FRAME(48, 0),
	ANIMCMD_FRAME(64, 0),
	ANIMCMD_FRAME(80, 0),
	ANIMCMD_FRAME(96, 0),
	ANIMCMD_FRAME(112, 0),
	ANIMCMD_FRAME(128, 0),
	ANIMCMD_FRAME(144, 0),
	ANIMCMD_FRAME(160, 0),
	ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83F9F94[] = {
	ANIMCMD_FRAME(0, 0),
	ANIMCMD_FRAME(4, 0),
	ANIMCMD_FRAME(8, 0),
	ANIMCMD_FRAME(12, 0),
	ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83F9FA8[] = {
    gSpriteAnim_83F9F64 +  0
};

const union AnimCmd *const gSpriteAnimTable_83F9FAC[] = {
    gSpriteAnim_83F9F64 +  2
};

const union AnimCmd *const gSpriteAnimTable_83F9FB0[] = {
    gSpriteAnim_83F9F64 +  4
};

const union AnimCmd *const gSpriteAnimTable_83F9FB4[] = {
    gSpriteAnim_83F9F64 +  6
};

const union AnimCmd *const gSpriteAnimTable_83F9FB8[] = {
    gSpriteAnim_83F9F64 +  8
};

const union AnimCmd *const gSpriteAnimTable_83F9FBC[] = {
    gSpriteAnim_83F9F64 +  9
};

const union AnimCmd *const gSpriteAnimTable_83F9FC0[] = {
    gSpriteAnim_83F9F64 + 10
};

const union AnimCmd *const gSpriteAnimTable_83F9FC4[] = {
    gSpriteAnim_83F9F94 + 0
};

const union AnimCmd *const gSpriteAnimTable_83F9FC8[] = {
    gSpriteAnim_83F9F94 + 1
};

const union AnimCmd *const gSpriteAnimTable_83F9FCC[] = {
    gSpriteAnim_83F9F94 + 2
};

const union AnimCmd *const gSpriteAnimTable_83F9FD0[] = {
    gSpriteAnim_83F9F94 + 3
};

const struct SpriteTemplate gSpriteTemplate_83F9FD4[] = {
    {4, 8, &gOamData_83F9EB8, gSpriteAnimTable_83F9FA8, NULL, gDummySpriteAffineAnimTable, sub_81184CC},
    {4, 8, &gOamData_83F9EB8, gSpriteAnimTable_83F9FAC, NULL, gDummySpriteAffineAnimTable, sub_81184CC},
    {4, 8, &gOamData_83F9EB8, gSpriteAnimTable_83F9FB0, NULL, gDummySpriteAffineAnimTable, sub_81184CC},
    {4, 8, &gOamData_83F9EB8, gSpriteAnimTable_83F9FB4, NULL, gDummySpriteAffineAnimTable, sub_81184CC}
};

const struct SpriteTemplate gSpriteTemplate_83FA034[] = {
    {4, 8, &gOamData_83F9EB8, gSpriteAnimTable_83F9FB8, NULL, gDummySpriteAffineAnimTable, sub_81184CC},
    {4, 8, &gOamData_83F9EB8, gSpriteAnimTable_83F9FBC, NULL, gDummySpriteAffineAnimTable, sub_81184CC},
    {4, 8, &gOamData_83F9EB8, gSpriteAnimTable_83F9FC0, NULL, gDummySpriteAffineAnimTable, sub_81184CC}
};

const struct SpriteTemplate gSpriteTemplate_83FA07C[] ={
    {5, 8, &gOamData_83F9EC0, gSpriteAnimTable_83F9FC4, NULL, gDummySpriteAffineAnimTable, sub_81184CC},
    {5, 8, &gOamData_83F9EC0, gSpriteAnimTable_83F9FC8, NULL, gDummySpriteAffineAnimTable, sub_81184CC},
    {5, 8, &gOamData_83F9EC0, gSpriteAnimTable_83F9FCC, NULL, gDummySpriteAffineAnimTable, sub_81184CC},
    {5, 8, &gOamData_83F9EC0, gSpriteAnimTable_83F9FD0, NULL, gDummySpriteAffineAnimTable, sub_81184CC}
};

const struct SpriteTemplate gSpriteTemplate_83FA0DC[] = {
    {0, 9, &gOamData_83F9EC8, gSpriteAnimTable_83F9F24, NULL, gDummySpriteAffineAnimTable, sub_8117E98},
    {0, 10, &gOamData_83F9EC8, gSpriteAnimTable_83F9F28, NULL, gDummySpriteAffineAnimTable, sub_8117E98},
    {0, 11, &gOamData_83F9EC8, gSpriteAnimTable_83F9F2C, NULL, gDummySpriteAffineAnimTable, sub_8117E98},
    {0, 12, &gOamData_83F9EC8, gSpriteAnimTable_83F9F30, NULL, gDummySpriteAffineAnimTable, sub_8117E98},
    {0, 9, &gOamData_83F9EC8, gSpriteAnimTable_83F9F34, NULL, gDummySpriteAffineAnimTable, sub_8117E98},
    {0, 10, &gOamData_83F9EC8, gSpriteAnimTable_83F9F38, NULL, gDummySpriteAffineAnimTable, sub_8117E98},
    {0, 11, &gOamData_83F9EC8, gSpriteAnimTable_83F9F3C, NULL, gDummySpriteAffineAnimTable, sub_8117E98},
    {0, 12, &gOamData_83F9EC8, gSpriteAnimTable_83F9F40, NULL, gDummySpriteAffineAnimTable, sub_8117E98},
    {0, 9, &gOamData_83F9EC8, gSpriteAnimTable_83F9F44, NULL, gDummySpriteAffineAnimTable, sub_8117E98},
    {0, 10, &gOamData_83F9EC8, gSpriteAnimTable_83F9F48, NULL, gDummySpriteAffineAnimTable, sub_8117E98},
    {0, 11, &gOamData_83F9EC8, gSpriteAnimTable_83F9F4C, NULL, gDummySpriteAffineAnimTable, sub_8117E98},
    {0, 12, &gOamData_83F9EC8, gSpriteAnimTable_83F9F50, NULL, gDummySpriteAffineAnimTable, sub_8117E98}
};

extern const struct SpriteTemplate gSpriteTemplate_83FA40C;
extern struct OamMatrix gOamMatrices[];
extern const struct SpriteSheet gUnknown_083FA21C[];
extern const struct SpriteTemplate gSpriteTemplate_83FA2B0;
extern const struct SpriteTemplate gSpriteTemplate_83FA2C8;
extern const struct SpriteTemplate gSpriteTemplate_83FA2E0;
extern const struct SpriteTemplate gSpriteTemplate_83FA2F8;
extern const struct SpriteTemplate gSpriteTemplate_83FA310;
extern const u8 gUnknown_083FA608[0x5];
extern const struct SpriteSheet gUnknown_083FA42C;
extern const struct SpriteTemplate gSpriteTemplate_83FA434;
extern void (*gFieldCallback)(void);
extern const u16 gUnknown_083FA60E[0x2][0x2];
extern const struct SpriteTemplate gSpriteTemplate_83FA50C;
extern const struct SpriteTemplate gSpriteTemplate_83FA5C0[];
extern const u16 gUnknown_083FA616[0x2][0x2];
extern const struct SpriteTemplate gSpriteTemplate_83FA524;
extern const struct SpriteTemplate gSpriteTemplate_83FA5F0;
extern const u16 gUnknown_083FA61E[0xA];
extern const u16 gUnknown_083FA632[];
extern const s8 gUnknown_083FA64A[0x2];
extern const s8 gUnknown_083FA64C[0x8][0x2];

void sub_8117838(u8 r0)
{
    if (!r0)
    {
        FreeAllSpritePalettes();
        LoadSpritePalettes(gUnknown_083F9E30);
        LZ77UnCompWram(gUnknown_083F92A8, ewram17000);
        LZ77UnCompWram(gUnknown_083F90FC, ewram17E00);
        LZ77UnCompWram(gUnknown_083F9D3C, ewram18000);
    }
    else
    {
        FreeAllSpritePalettes();
    }
}

u8 sub_8117890(const struct SpriteTemplate *r0, u8 r1, u16 *r2)
{
    u16 temp;
    u8 spriteid = CreateSprite(r0, 0x74, 0x50, r0->oam->y);
    gSprites[spriteid].data[0]            = *r2;
    gSprites[spriteid].data[1]            = r1;
    gSprites[spriteid].coordOffsetEnabled = TRUE;
    gSprites[spriteid].animPaused         = TRUE;
    gSprites[spriteid].affineAnimPaused   = TRUE;
    temp = *r2;
    *r2 += 0x1E;
    if (*r2 > 0x167)
        *r2 = temp - 0x14A;
    return spriteid;
}

void sub_8117900(void)
{
    u8 i, j;
    u8 spriteid;
    struct SpriteSheet s;
    LZ77UnCompWram(gUnknown_083F9F54.data, gSharedMem);
    s.data = gSharedMem;
    s.size = gUnknown_083F9F54.size;
    s.tag  = gUnknown_083F9F54.tag;
    LoadSpriteSheet(&s);
    LZ77UnCompWram(gUnknown_083F9F5C.data, gSharedMem);
    s.data = gSharedMem;
    s.size = gUnknown_083F9F5C.size;
    s.tag  = gUnknown_083F9F5C.tag;
    LoadSpriteSheet(&s);
    for (i = 0; i < 0x3; i++)
    {
        u8 o = i * 0x18;
        for (j = 0; j < 0x4; j++)
        {
            spriteid = eRoulette->var3C[0x1D + i * 0x4 + j] =
                CreateSprite(&gSpriteTemplate_83FA07C[j], j * 0x18 + 0x94, o + 0x5C, 0x1E);
            gSprites[spriteid].animPaused = TRUE;
            o += 0x18;
            if (o > 0x47)
                o = 0x0;
        }
    }
    for (i = 0x0; i < 0x4; i++)
    {
        spriteid = eRoulette->var3C[0x29 + i] =
            CreateSprite(&gSpriteTemplate_83F9FD4[i], (s16)(i * 0x18 + 0x94), 0x46, 0x1E);
        gSprites[spriteid].animPaused = TRUE;
    }
    for (i = 0x0; i < 0x3; i++)
    {
        spriteid = eRoulette->var3C[0x2D + i] =
            CreateSprite(&gSpriteTemplate_83FA034[i], 0x7E, (s16)(i * 0x18 + 0x5C), 0x1E);
        gSprites[spriteid].animPaused = TRUE;
    }
}

void unref_sub_8117A74(void) //destroy all sprites at 0x1D
{
    u8 i;
    for (i = 0x0; i < 0xC; i++)
        DestroySprite(&gSprites[eRoulette->var3C[0x1D + i]]);
}

void sub_8117AA8(u8 r0, u8 r1)
{
    u8 i;
    switch (r0)
    {
    case 0x1:
        for (i = 0x0; i < 0x13; i++)
            gSprites[eRoulette->var3C[0x1D + i]].invisible = TRUE;
        break;
    case 0x0:
        for (i = 0x0; i < 0xC; i++)
        {
            if (!(eRoulette->var08 & gUnknown_083F8D90[i].var04))
                gSprites[eRoulette->var3C[0x1D + i]].invisible = FALSE;
            else if(!(gUnknown_083F8D90[i].var02 == r1))
                gSprites[eRoulette->var3C[0x1D + i]].invisible = TRUE;
            else
                gSprites[eRoulette->var3C[0x1D + i]].invisible = FALSE;
        }
        for (; i < 0x13; i++)
            gSprites[eRoulette->var3C[0x1D + i]].invisible = FALSE;
        break;
    }
}

void sub_8117BBC(void)
{
    u8 i;
    for (i = 0x0; i < 0x6; i++)
    {
        eRoulette->var3C[0x31 + i] = CreateSprite(&gSpriteTemplate_83FA40C, 0x74, 0x14, 0xA);
        gSprites[eRoulette->var3C[0x31 + i]].invisible    = TRUE;
        gSprites[eRoulette->var3C[0x31 + i]].data[0]      = 0x1;
        gSprites[eRoulette->var3C[0x31 + i]].callback     = &sub_81184CC;
        gSprites[eRoulette->var3C[0x31 + i]].oam.priority = 0x1;
        StartSpriteAnim(&gSprites[eRoulette->var3C[0x31 + i]], 0x8);
    }
}

void sub_8117C60(u8 r0, u8 r1)
{
    u8 i = 0x0;
    if (r0)
    {
        for ( ; i < 0x6; i++)
            gSprites[eRoulette->var3C[0x31 + i]].invisible = TRUE;
    }
    else
    {
        for ( ; i < 0x6; i++)
        {
            if (!(eRoulette->var0C[i]) || (i == r1))
            {
                gSprites[eRoulette->var3C[0x31 + i]].invisible = TRUE;
            }
            else
            {
                gSprites[eRoulette->var3C[0x31 + i]].invisible = FALSE;
                gSprites[eRoulette->var3C[0x31 + i]].pos1.x    = (gUnknown_083F8C00[eRoulette->var0C[i]].var03 + 0x1) * 0x8 + 0x4;
                gSprites[eRoulette->var3C[0x31 + i]].pos1.y    = (gUnknown_083F8C00[eRoulette->var0C[i]].var04 + 0x1) * 0x8 + 0x3;
            }
        }
    }
}

void sub_8117D68(u8 r0)
{
    if (!r0)
    {
        gSprites[eRoulette->var3C[0x30]].invisible = TRUE;
    }
    else
    {
        gSprites[eRoulette->var3C[0x30]].invisible = FALSE;
        gSprites[eRoulette->var3C[0x30]].pos1.x    = (gUnknown_083F8C00[r0].var03 + 0x2) * 0x8;
        gSprites[eRoulette->var3C[0x30]].pos1.y    = (gUnknown_083F8C00[r0].var04 + 0x2) * 0x8;
    }
}

void sub_8117DF4(void)
{
    u8 i, j;
    u16 k;
    struct SpriteSheet s;
    LZ77UnCompWram(gUnknown_083F9EE8.data, gSharedMem);
    s.data = gSharedMem;
    s.size = gUnknown_083F9EE8.size;
    s.tag  = gUnknown_083F9EE8.tag;
    LoadSpriteSheet(&s);
    k = 0xF;
    for (i = 0x0; i < 0x3; i++)
    {
        for (j = 0x0; j < 0x4; j++)
        {
            u8 spriteid;
            spriteid =
                eRoulette->var3C[0x7 + i * 0x4 + j] = sub_8117890(&gSpriteTemplate_83FA0DC[i * 0x4 + j], 0x28, &k);
            gSprites[spriteid].animPaused       = TRUE;
            gSprites[spriteid].affineAnimPaused = TRUE;
        }
    }
}

void sub_8117E98(struct Sprite *sprite)
{
    s16 cos;
    s16 sin;
    u32 matrixNum;
    s16 angle = eRoulette->var24 + sprite->data[0];
    if (angle >= 360)
        angle -= 360;
    sin = Sin2(angle);
    cos = Cos2(angle);
    sprite->pos2.x =  sin * sprite->data[1] >> 0xC;
    sprite->pos2.y = -cos * sprite->data[1] >> 0xC;
    matrixNum = sprite->oam.matrixNum;
    sin /= 16;
    gOamMatrices[matrixNum].d = cos /= 16;
    gOamMatrices[matrixNum].a = cos;
    gOamMatrices[matrixNum].b = sin;
    gOamMatrices[matrixNum].c = -sin;
}

void sub_8117F2C(void)
{
    u8 i;
    for (i = 0x0; i < 0x5; i++)
    {
        struct SpriteSheet s;
        LZ77UnCompWram(gUnknown_083FA21C[i].data, gSharedMem);
        s.data = gSharedMem;
        s.size = gUnknown_083FA21C[i].size;
        s.tag  = gUnknown_083FA21C[i].tag;
        LoadSpriteSheet(&s);
    }
    eRoulette->var3C[0x14] = CreateSprite(&gSpriteTemplate_83FA2B0, 0xD0, 0x10, 0x4);
    gSprites[eRoulette->var3C[0x14]].animPaused = TRUE;
    for (i = 0x0; i < 0x4; i++)
    {
        eRoulette->var3C[0x15 + i] = CreateSprite(&gSpriteTemplate_83FA2C8, (s16)(i * 0x8 + 0xC4), 0x18, 0x0);
        gSprites[eRoulette->var3C[0x15 + i]].invisible = TRUE;
        gSprites[eRoulette->var3C[0x15 + i]].animPaused = TRUE;
    }
    eRoulette->var3C[0x19] = CreateSprite(&gSpriteTemplate_83FA2E0, 0x78, 0x44, 0x4);
    gSprites[eRoulette->var3C[0x19]].animPaused = TRUE;
    for (i = 0x0; i < 0x3; i++)
    {
        eRoulette->var3C[0x1A + i] = CreateSprite(&gSpriteTemplate_83FA2F8, (s16)(i * 0x10 + 0xC0), 0x24, 0x4);
        gSprites[eRoulette->var3C[0x1A + i]].invisible = TRUE;
        gSprites[eRoulette->var3C[0x1A + i]].animPaused = TRUE;
    }
    eRoulette->var3C[0x30] = CreateSprite(&gSpriteTemplate_83FA310, 0x98, 0x60, 0x9);
    gSprites[eRoulette->var3C[0x30]].oam.priority = 0x1;
    gSprites[eRoulette->var3C[0x30]].animPaused = TRUE;
    gSprites[eRoulette->var3C[0x30]].invisible = TRUE;
}

void sub_81180F4(u16 r0)
{
    u8 i;
    u16 d = 1000;
    bool8 v = FALSE;
    for (i = 0x0; i < 0x4; i++)
    {
        u8 t = r0 / d;
        gSprites[eRoulette->var3C[0x15 + i]].invisible = TRUE;
        if (t > 0x0 || v || i == 0x3)
        {
            gSprites[eRoulette->var3C[0x15 + i]].invisible = FALSE;
            gSprites[eRoulette->var3C[0x15 + i]].oam.tileNum =
                gSprites[eRoulette->var3C[0x15 + i]].sheetTileStart
                + (*gSprites[eRoulette->var3C[0x15 + i]].anims + t)->type;
            v = TRUE;
        }
        r0 = r0 % d;
        d = d / 10;
    }
}

u8 sub_81181E8(u8 r0)
{
    u8 t[5];
    memcpy(t, gUnknown_083FA608, sizeof t);
    // u8 t = {0, 1, 2, 3, 4};
    if (r0 >= 20)
        r0 = 0;
    switch (gUnknown_083F8C00[r0].var01_0)
    {
    case 0x3:
        r0 = r0 / 5 - 1;
        if (eRoulette->var16[r0] < 4)
            return t[((vu8 *)eRoulette->var16)[r0] + 1]; // couldn't recreate redundant loads
        break;
    case 0x4:
        r0--;
        if (eRoulette->var12[r0] < 3)
            return t[((vu8 *)eRoulette->var12)[r0] + 2];
        break;
    case 0xC:
        if (!(eRoulette->var08 & gUnknown_083F8C00[r0].var08))
            return t[4];
        break;
    }
    return 0;
}

void sub_811829C(u8 r0)
{
    struct Sprite *s = &gSprites[eRoulette->var3C[0x19]];
    s->animCmdIndex  = sub_81181E8(r0);
    s->oam.tileNum   =
        s->sheetTileStart
        + (*s->anims + s->animCmdIndex)->type;
}

void sub_81182F8(u8 r0)
{
    u8 i;
    u8 t = 0x0;
    if (eRoulette->var19 == 0x1)
        t = 0x2;
    switch (r0)
    {
    case 0x6:
        for (i = 0x0; i < 0x3; i++)
        {
            gSprites[eRoulette->var3C[0x1A + i]].invisible = FALSE;
            gSprites[eRoulette->var3C[0x1A + i]].oam.tileNum =
                gSprites[eRoulette->var3C[0x1A + i]].sheetTileStart
                + (*gSprites[eRoulette->var3C[0x1A + i]].anims)->type;
        }
        break;
    case 0x5:
        gSprites[eRoulette->var3C[0x1C]].oam.tileNum =
            gSprites[eRoulette->var3C[0x1C]].sheetTileStart
            + (*gSprites[eRoulette->var3C[0x1C]].anims + t + 0x1)->type;
        break;
    case 0x4:
        gSprites[eRoulette->var3C[0x1C]].oam.tileNum =
            gSprites[eRoulette->var3C[0x1C]].sheetTileStart
            + (*gSprites[eRoulette->var3C[0x1C]].anims + t + 0x2)->type;
        break;
    case 0x3:
        gSprites[eRoulette->var3C[0x1B]].oam.tileNum =
            gSprites[eRoulette->var3C[0x1B]].sheetTileStart
            + (*gSprites[eRoulette->var3C[0x1B]].anims + t + 0x1)->type;
        break;
    case 0x2:
        gSprites[eRoulette->var3C[0x1B]].oam.tileNum =
            gSprites[eRoulette->var3C[0x1B]].sheetTileStart
            + (*gSprites[eRoulette->var3C[0x1B]].anims + t + 0x2)->type;
        break;
    case 0x1:
        gSprites[eRoulette->var3C[0x1A]].oam.tileNum =
            gSprites[eRoulette->var3C[0x1A]].sheetTileStart
            + (*gSprites[eRoulette->var3C[0x1A]].anims + t + 0x1)->type;
        break;
    case 0x0:
    default:
        for (i = 0x0; i < 0x3; i++)
        {
            gSprites[eRoulette->var3C[0x1A + i]].oam.tileNum =
                gSprites[eRoulette->var3C[0x1A + i]].sheetTileStart
                + (*gSprites[eRoulette->var3C[0x1A + i]].anims + t + 2)->type;
        }
    }
}

void sub_81184CC(struct Sprite *sprite)
{
    sprite->pos2.x = eRoulette->var26;
}

void sub_81184D8(void)
{
    u8 spriteid;
    struct SpriteSheet s;
    LZ77UnCompWram(gUnknown_083FA42C.data, gSharedMem);
    s.data = gSharedMem;
    s.size = gUnknown_083FA42C.size;
    s.tag  = gUnknown_083FA42C.tag;
    LoadSpriteSheet(&s);
    spriteid = CreateSprite(&gSpriteTemplate_83FA434, 0x74, 0x50, 0x51);
    gSprites[spriteid].data[0]            = eRoulette->var24;
    gSprites[spriteid].data[1]            = 0x0;
    gSprites[spriteid].animPaused         = TRUE;
    gSprites[spriteid].affineAnimPaused   = TRUE;
    gSprites[spriteid].coordOffsetEnabled = TRUE;
}

void sub_8118554(struct Sprite *sprite)
{
    u32 t = sprite->oam.matrixNum;
    struct OamMatrix *m = &gOamMatrices[0];
    m[t].d = eRoulette->var2C.a;
    m[t].a = eRoulette->var2C.a;
    m[t].b = eRoulette->var2C.b;
    m[t].c = eRoulette->var2C.c;
}

void sub_811857C(void)
{
    u8 i;
    for (i = 0x0; i < 0x6; i++)
    {
        u8 spriteid =
            eRoulette->var3C[i] = CreateSprite(&gSpriteTemplate_83FA40C, 0x74, 0x50, 0x39 - i);
        if (spriteid != 0x40)
        {
            gSprites[eRoulette->var3C[i]].invisible          = TRUE;
            gSprites[eRoulette->var3C[i]].coordOffsetEnabled = TRUE;
        }
    }
}

void sub_81185E8(void)
{
    u8 t = eRoulette->var3C[0x0];
    u8 i;
    for (i = 0x0; i < 0x6; i++)
    {
        u8 j;
        gSprites[t].invisible = TRUE;
        gSprites[t].callback = &SpriteCallbackDummy;
        StartSpriteAnim(&gSprites[t], 0x0);
        for (j = 0x0; j < 0x8; j++)
            gSprites[t].data[j] = 0x0;
        t++;
    }
}

s16 sub_811866C(struct Sprite *sprite)
{
    if (eRoulette->var24 > sprite->data[0x3])
    {
        sprite->data[0x6] = 360 - eRoulette->var24 + sprite->data[0x3];
        if (sprite->data[0x6] > 359)
            sprite->data[0x6] -=360;
    }
    else
        sprite->data[0x6] = sprite->data[0x3] - eRoulette->var24;
    return sprite->data[0x6];
}

u8 sub_81186B8(struct Sprite *sprite)
{
    eRoulette->var7E = (u8)(((float)(s16)sub_811866C(sprite)) / 30.0f);
    return eRoulette->var7E;
}

s16 sub_81186E8(struct Sprite *sprite)
{
    s16 t = sub_811866C(sprite) % 30;
    u16 z;
    if (t == 0xE)
    {
        z = 0x0;
        return sprite->data[0x2] = z;
    }
    else if (t > 0xD)
    {
        z = (u16)(0x2B - t);
        return sprite->data[0x2] = z;
    }
    else
    {
        z = (u16)(0xE - t);
        return sprite->data[0x2] = z;
    }
}

void sub_8118724(struct Sprite *sprite)
{
    s16 sin, cos;
    eRoulette->var8C += eRoulette->var90;
    eRoulette->var88 += eRoulette->var8C;
    if (eRoulette->var88 >= 360)
        eRoulette->var88 -= 360.0f;
    else
        if (eRoulette->var88 < 0.0f)
            eRoulette->var88 += 360.0f;
    sprite->data[0x3] = eRoulette->var88;
    eRoulette->var98 += eRoulette->var9C;
    eRoulette->var94 += eRoulette->var98;
    sprite->data[0x4] = eRoulette->var94;
    sin = Sin2(sprite->data[0x3]);
    cos = Cos2(sprite->data[0x3]);
    sprite->pos2.x =  sin * sprite->data[0x4] >> 0xC;
    sprite->pos2.y = -cos * sprite->data[0x4] >> 0xC;
    if (IsSEPlaying())
    {
        m4aMPlayPanpotControl(&gMPlay_SE1, 0xFFFF, sprite->pos2.x);
        m4aMPlayPanpotControl(&gMPlay_SE2, 0xFFFF, sprite->pos2.x);
    }
}

void sub_8118834(struct Sprite *sprite)
{
    s16 sin, cos;
    sprite->data[0x3] = eRoulette->var24 + sprite->data[0x6];
    if (sprite->data[0x3] > 359)
        sprite->data[0x3] -= 360;
    sin = Sin2(sprite->data[0x3]);
    cos = Cos2(sprite->data[0x3]);
    sprite->pos2.x =  sin * sprite->data[0x4] >> 0xC;
    sprite->pos2.y = -cos * sprite->data[0x4] >> 0xC;
    sprite->pos2.y += gSpriteCoordOffsetY;
}

void sub_811889C(struct Sprite *sprite)
{
    sub_8118724(sprite);
    sprite->data[0x2]++;
    if ((u16)(sprite->data[0x4] + 0x84) > 0xD4)
        sprite->invisible = TRUE;
    else
        sprite->invisible = FALSE;
    if (!(sprite->data[0x2] < 30))
    {
        if (!sprite->data[0x0])
        {
            if (eRoulette->var94 <= eRoulette->varA0 - 2.0f)
            {
                eRoulette->var7D = 0xFF;
                eRoulette->var03_7 = 0x0;
                StartSpriteAnim(sprite, sprite->animCmdIndex + 0x3);
                sub_81186B8(sprite);
                sprite->data[0x4] = 30;
                sub_811866C(sprite);
                sprite->data[0x6] = (sprite->data[0x6] / 30) * 30 + 0xF;
                sprite->callback = &sub_8118834;
                m4aSongNumStartOrChange(0x47);
                eRoulette->var9C = eRoulette->var98 = 0.0f;
                eRoulette->var8C = -1.0f;
            }
        }
        else
        {
            if (eRoulette->var94 >= eRoulette->varA0 - 2.0f)
            {
                eRoulette->var7D = 0xFF;
                eRoulette->var03_7 = 0x0;
                StartSpriteAnim(sprite, sprite->animCmdIndex + 0x3);
                sub_81186B8(sprite);
                sprite->data[0x4] = 30;
                sub_811866C(sprite);
                sprite->data[0x6] = (sprite->data[0x6] / 30) * 30 + 0xF;
                sprite->callback = &sub_8118834;
                m4aSongNumStartOrChange(0x47);
                eRoulette->var9C = eRoulette->var98 = 0.0f;
                eRoulette->var8C = -1.0f;
            }
        }
    }
}

void sub_81189A8(struct Sprite *sprite)
{
    float f0, f1, f2;
    const struct StructgUnknown_083F8DF4 *p;
    sub_8118724(sprite);
    switch (sprite->data[0x3])
    {
    case 0:
        if (sprite->data[0x0] != 0x1)
        {
            f0 = ((float)sprite->data[0x7]);
            p = &gUnknown_083F8DF4[0];
            f1 = (f0 * ((float)(s32)p[eRoulette->var04_0].var01) + (float)((s32)p[eRoulette->var04_0].var02 - 0x1));
            f2 = (f0 / ((float)(s32)p[eRoulette->var04_0].var0C));
        }
        else
        {
            return;
        }
        break;
    case 180:
        if (sprite->data[0x0] != 0x0)
        {
            f0 = ((float)sprite->data[0x7]);
            p = &gUnknown_083F8DF4[0];
            f1 = (f0 * ((float)(s32)p[eRoulette->var04_0].var01) + (float)((s32)p[eRoulette->var04_0].var02 - 0x1));
            f2 = -(f0 / ((float)(s32)p[eRoulette->var04_0].var0C));
        }
        else
        {
            return;
        }
        break;
        default: return;
    }
    eRoulette->varA0 = eRoulette->var94;
    eRoulette->var98 = f2;
    eRoulette->var9C = -((f2 + f2) / f1 + (2.0f / (f1 * f1)));
    eRoulette->var8C = 0.0f;
    sprite->animPaused    = FALSE;
    sprite->animNum       = 0x0;
    sprite->animBeginning = TRUE;
    sprite->animEnded     = FALSE;
    sprite->callback      = &sub_811889C;
    sprite->data[0x2]     = 0x0;
}

void sub_8118B30(struct Sprite *sprite)
{
    sprite->pos2.y = (s32)(((float)sprite->data[0x2]) * 0.05f * ((float)sprite->data[0x2])) - 45;
    sprite->data[0x2]++;
    if (sprite->data[0x2] > 29 && sprite->pos2.y >= 0)
    {
        eRoulette->var7D   = 0xFF;
        eRoulette->var03_7 = FALSE;
        StartSpriteAnim(sprite, sprite->animCmdIndex + 0x3);
        sub_81186B8(sprite);
        sprite->data[0x4] = 30;
        sub_811866C(sprite);
        sprite->data[0x6] = (sprite->data[0x6] / 30) * 30 + 0xF;
        sprite->callback  = &sub_8118834;
        m4aSongNumStartOrChange(0x47);
        eRoulette->var03_6 = TRUE;
    }
}

void sub_8118BD8(struct Sprite *sprite)
{
    if (sprite->data[0x2]++ < 45)
    {
        sprite->pos2.y--;
        if (sprite->data[0x2] == 45)
        {
            if (gSprites[eRoulette->var3C[0x37]].animCmdIndex == 0x1)
                sprite->pos2.y++;
        }
    }
    else
    {
        if (sprite->data[0x2] < sprite->data[0x7])
        {
            if (gSprites[eRoulette->var3C[0x37]].animDelayCounter == 0x0)
            {
                if (gSprites[eRoulette->var3C[0x37]].animCmdIndex == 0x1)
                    sprite->pos2.y++;
                else
                    sprite->pos2.y--;
            }
        }
        else
        {
            sprite->animPaused    = FALSE;
            sprite->animNum       = 0x1;
            sprite->animBeginning = TRUE;
            sprite->animEnded     = FALSE;
            sprite->data[0x2]     = 0x0;
            sprite->callback      = &sub_8118B30;
            m4aSongNumStart(0x3D);
        }
    }
}

void sub_8118CAC(struct Sprite *sprite)
{
    sub_8118724(sprite);
    switch (sprite->data[0x3])
    {
    case 90:
        if (sprite->data[0x0] != 0x1)
        {
            sprite->callback  = &sub_8118BD8;
            sprite->data[0x2] = 0x0;
        }
        break;
    case 270:
        if (sprite->data[0x0] != 0x0)
        {
            sprite->callback  = &sub_8118BD8;
            sprite->data[0x2] = 0x0;
        }
        break;
    }
}

void sub_8118CEC(struct Sprite *sprite)
{
    sub_8118724(sprite);
    switch (eRoulette->var03_0)
    {
    default:
    case 0x0:
        sub_8119224(sprite);
        sprite->callback = &sub_81189A8;
        break;
    case 0x1:
        sub_81193D4(sprite);
        sprite->callback = &sub_8118CAC;
        break;
    }
}

void sub_8118D2C(struct Sprite *sprite)
{
    sub_8118724(sprite);
    if (sprite->data[0x2]-- == 0x10)
        eRoulette->var98 *= -1.0f;
    if (sprite->data[0x2] == 0x0)
    {
        if (!sprite->data[0x0])
        {
            eRoulette->var7D   = 0xFF;
            eRoulette->var03_7 = 0x0;
            StartSpriteAnim(sprite, sprite->animCmdIndex + 0x3);
            sub_81186B8(sprite);
            sprite->data[0x4] = 30;
            sub_811866C(sprite);
            sprite->data[0x6] = (sprite->data[0x6] / 30) * 30 + 15;
            sprite->callback  = &sub_8118834;
            m4aSongNumStartOrChange(0x47);
        }
        else
        {
            sprite->animPaused = TRUE;
            m4aSongNumStart(0x38);
            sub_811952C(sprite);
        }
    }
}

#if DEBUG

void debug_sub_812E698(struct Sprite *sprite)
{
    sub_8118724(sprite);
    sprite->data[2] = 0;
    sub_81186B8(sprite);
    m4aSongNumStart(0x38);
    if (Random() & 1)
    {
        eRoulette->var8C = 0;
        eRoulette->var7F = (eRoulette->var7E + 1) % 12;
    }
    else
    {
        eRoulette->var8C = gUnknown_083F8DF4[eRoulette->var04_0].var1C * 2;
        eRoulette->var7F = eRoulette->var7E;
    }
    sprite->data[0] = 1;
    sprite->data[2] = gUnknown_083F8DF4[eRoulette->var04_0].var02;
    eRoulette->var98 = 0.085;
    sprite->callback = sub_8118D2C;
    sprite->data[1] = 5;
}

#endif

void sub_8118DE4(struct Sprite *sprite)
{
    sub_8118724(sprite);
    sprite->data[0x2] = 0x0;
    sub_81186B8(sprite);
    if (!(gUnknown_083F8D90[eRoulette->var7E].var04 & eRoulette->var08))
    {
        eRoulette->var7D   = 0xFF;
        eRoulette->var03_7 = 0x0;
        StartSpriteAnim(sprite, sprite->animCmdIndex + 0x3);
        sub_81186B8(sprite);
        sprite->data[0x4] = 30;
        sub_811866C(sprite);
        sprite->data[0x6] = (sprite->data[0x6] / 30) * 30 + 15;
        sprite->callback  = &sub_8118834;
        m4aSongNumStartOrChange(SE_HASHI);
    }
    else
    {
        u8 t;
        u32 z;
        m4aSongNumStart(SE_KON);
        if ((z = (Random() & 0x1)))
        {
            u32 o;
            eRoulette->var8C = 0.0f;
            o = (eRoulette->var7E + 0x1) % 0xC;
            t = o;
            eRoulette->var7F = o;
        }
        else
        {
            eRoulette->var8C = ({
                float f = gUnknown_083F8DF4[eRoulette->var04_0].var1C;
                f * 2;
            }); // couldn't replicate loads
            t = (eRoulette->var7E + 0xB) % 0xC;
            eRoulette->var7F = eRoulette->var7E;
        }
        if (gUnknown_083F8D90[t].var04 & eRoulette->var08)
        {
            sprite->data[0x0] = 0x1;
            sprite->data[0x2] = gUnknown_083F8DF4[eRoulette->var04_0].var02;
        }
        else
        {
            sprite->data[0x0] = gUnknown_083F8D90[t].var04 & eRoulette->var08;
            if (eRoulette->var04_0)
            {
                sprite->data[0x2] = gUnknown_083F8DF4[eRoulette->var04_0].var01;
            }
            else
            {
                sprite->data[0x2] = gUnknown_083F8DF4[eRoulette->var04_0].var02;
                if (z)
                {
                    eRoulette->var8C = 0.5f;
                }
                else
                {
                    eRoulette->var8C = -1.5f;
                }
            }
        }
        eRoulette->var98 = 0.085f;
        sprite->callback = sub_8118D2C;
        sprite->data[0x1] = 0x5;
    }
}

void sub_8118F8C(struct Sprite *sprite)
{
    sub_8118724(sprite);
    if (!(eRoulette->var8C > 0.5f))
    {
        sub_81186B8(sprite);
        if (!sub_81186E8(sprite))
        {
            const struct StructgUnknown_083F8DF4 *p;
            eRoulette->var90 = 0.0f;
            p = &gUnknown_083F8DF4[0];
            eRoulette->var8C -= ((float)p[eRoulette->var04_0].var03)
                / ((float)(s16)(p[eRoulette->var04_0].var04 + 0x1));
            sprite->data[0x1] = 0x4;
#if DEBUG
            if (unk_2039560 != 0)
                sprite->callback = debug_sub_812E698;
            else
#endif
                sprite->callback = sub_8118DE4;
        }
        else
        {
            if (eRoulette->var90 != 0.0f)
            {
                if (eRoulette->var8C < 0.0f)
                {
                    eRoulette->var90 = 0.0f;
                    eRoulette->var8C = 0.0f;
                    eRoulette->var98 /= 1.2;
                }
            }
        }
    }
}

void sub_8119088(struct Sprite *sprite)
{
    sub_8118724(sprite);
    if (!(eRoulette->var94 > 40.f))
    {
        eRoulette->var98 = - (        4.0f / (float)(u16)eRoulette->var86);
        eRoulette->var90 = - (eRoulette->var8C / (float)(u16)eRoulette->var86);
        sprite->animNum       = 0x2;
        sprite->animBeginning = TRUE;
        sprite->animEnded     = FALSE;
        sprite->data[0x1]     = 0x3;
        sprite->callback      = &sub_8118F8C;
    }
}

void sub_8119134(struct Sprite *sprite)
{
    sub_8118724(sprite);
    if (!(eRoulette->var94 > 60.0f))
    {
        m4aSongNumStartOrChange(0x5D);
        eRoulette->var98 = - (                20.0f / (float)(u16)eRoulette->var84);
        eRoulette->var90 =   ((1.0f - eRoulette->var8C) / (float)(u16)eRoulette->var84);
        sprite->animNum       = 0x1;
        sprite->animBeginning = TRUE;
        sprite->animEnded     = FALSE;
        sprite->data[0x1]     = 0x2;
        sprite->callback      = &sub_8119088;
    }
}

void sub_81191F4(struct Sprite *sprite)
{
    sprite->data[0x1] = 0x1;
    sprite->data[0x2] = 0x0;
    sub_8118724(sprite);
    sprite->invisible = FALSE;
    sprite->callback  = &sub_8119134;
}

void sub_8119224(struct Sprite *sprite)
{
    u16 t;
    u8 i;
    s16 s[0x2][0x2];
    struct Roulette *p;
    memcpy(s, &gUnknown_083FA60E, 0x8);
    t = sprite->data[0x7] - 0x2;
    p = eRoulette;
    p->var3C[0x37] = CreateSprite(&gSpriteTemplate_83FA50C, 0x24, -0xC, 0x32);
    p->var3C[0x38] = CreateSprite(&gSpriteTemplate_83FA5C0[0x0], s[sprite->data[0x0]][0x0], s[sprite->data[0x0]][0x1], 0x3B);
    p->var3C[0x39] = CreateSprite(&gSpriteTemplate_83FA5C0[0x1], 0x24, 0x8C, 0x33);
    gSprites[eRoulette->var3C[0x39]].oam.objMode = 0x1;
    for (i = 0x0; i < 0x3; i++)
    {
        gSprites[eRoulette->var3C[0x37 + i]].coordOffsetEnabled = FALSE;
        gSprites[eRoulette->var3C[0x37 + i]].invisible          = TRUE;
        gSprites[eRoulette->var3C[0x37 + i]].animPaused         = TRUE;
        gSprites[eRoulette->var3C[0x37 + i]].affineAnimPaused   = TRUE;
        gSprites[eRoulette->var3C[0x37 + i]].data[0x4]          = eRoulette->var3C[0x37];
        gSprites[eRoulette->var3C[0x37 + i]].data[0x5]          = eRoulette->var3C[0x38];
        gSprites[eRoulette->var3C[0x37 + i]].data[0x6]          = eRoulette->var3C[0x39];
        gSprites[eRoulette->var3C[0x37 + i]].data[0x2]          = t;
        gSprites[eRoulette->var3C[0x37 + i]].data[0x3]          = (sprite->data[0x7] * gUnknown_083F8DF4[eRoulette->var04_0].var01) +
                                                                (gUnknown_083F8DF4[eRoulette->var04_0].var02 + 0xFFFF);
    }
    gSprites[eRoulette->var3C[0x38]].coordOffsetEnabled = TRUE;
    eRoulette->var38 = sprite;
}

void sub_81193D4(struct Sprite *sprite)
{
    u8 i = 0;
    s16 t;
    s16 s[0x2][0x2];
    const struct StructgUnknown_083F8DF4 *p;
    memcpy(s, &gUnknown_083FA616, 0x8);
    t = sprite->data[0x7] - 0x2;
    eRoulette->var3C[0x37] = CreateSprite(&gSpriteTemplate_83FA524, s[sprite->data[0x0]][0x0], s[sprite->data[0x0]][0x1], 0x32);
    StartSpriteAnim(&gSprites[eRoulette->var3C[0x37]], sprite->data[0x0]);
    eRoulette->var3C[0x38] = CreateSprite(&gSpriteTemplate_83FA5F0, s[sprite->data[0x0]][0x0], s[sprite->data[0x0]][0x1], 0x33);
    gSprites[eRoulette->var3C[0x38]].affineAnimPaused = TRUE;
    gSprites[eRoulette->var3C[0x38]].animPaused       = TRUE;
    sprite->data[0x7] = (t * (p = &gUnknown_083F8DF4[0])[eRoulette->var04_0].var01) + (p[eRoulette->var04_0].var10 + 0x2D);
    for (; i < 0x2; i++)
    {
        gSprites[eRoulette->var3C[0x37 + i]].data[0x4] = eRoulette->var3C[0x37];
        gSprites[eRoulette->var3C[0x37 + i]].data[0x5] = eRoulette->var3C[0x38];
        gSprites[eRoulette->var3C[0x37 + i]].data[0x6] = eRoulette->var3C[0x38];
        gSprites[eRoulette->var3C[0x37 + i]].data[0x2] = t;
        gSprites[eRoulette->var3C[0x37 + i]].data[0x3] = sprite->data[0x7] - 0x2D;
    }
    eRoulette->var38 = sprite;
}

#ifdef NONMATCHING
void sub_811952C(struct Sprite *sprite)
{
    u8 i;
    u8 z;
    u16 o;
    u8 h = 0; // r10 (sp+0xc)
    u8 j = 5; // r9 (r9)
    u8 p = 0; // sp+0xc (sp+0x10)
    u8 s[10] = {}; // sp+0 (sp+0)
    u16 t = Random(); // sp+0x10 (r10)

    eRoulette->var7D   = 1;
    eRoulette->var03_5 = TRUE;
    eRoulette->var03_6 = FALSE;
    eRoulette->var7E   = 0xFF;
    eRoulette->var88   = sprite->data[3];
    eRoulette->var98   = 0.0f;
    eRoulette->var8C   = gUnknown_083F8DF4[eRoulette->var04_0].var1C;
    o = (eRoulette->var04_0 * 30 + 33) + (0x1 - eRoulette->var03_0) * 15;
    for (i = 0; i < 4; i++)
    {
        if (o < sprite->data[3] && sprite->data[3] <= o + 90)
        {
            sprite->data[0] = i << 1;
            eRoulette->var03_0 = i & 1;
            break;
        }
        if (i == 3)
        {
            sprite->data[0] = 1;
            eRoulette->var03_0 = 1;
            break;
        }
        o += 90;
    }
    if (eRoulette->var03_0)
    {
        if (sprite->data[0])
        {
            PlayCry1(SPECIES_TAILLOW, -0x3F);
        }
        else
        {
            PlayCry1(SPECIES_TAILLOW, 0x3F);
        }
    }
    else
    {
        PlayCry1(SPECIES_SHROOMISH, -0x3F);
    }
    i = 2;
    z = (eRoulette->var7F + 2) % 12;
    if (eRoulette->var03_0 == 1 && eRoulette->var04_0 == 1)
        j += 6;
    else
        j += i;
    for (; i < j; i++)
    {
        if (!(eRoulette->var08 & gUnknown_083F8D90[z].var04))
        {
            s[h++] = i;
            if (!p && (gUnknown_083F8D90[z].var04 & gUnknown_083F8C00[eRoulette->var1B[eRoulette->var1A_0]].var00))
            {
                p = i;
            }
        }
        z = (z + 1) % 0xC;
    }
    if ((eRoulette->var03_0 + 1) & eRoulette->var02)
    {
        if (p && (t & 0xFF) < 0xc0)
        {
            sprite->data[7] = p;
        }
        else
        {
            sprite->data[7] = s[t % h];
        }
    }
    else
    {
        sprite->data[7] = s[t % h];
    }
    sprite->callback = sub_8118CEC;
}
#else
NAKED
void sub_811952C(struct Sprite *sprite)
{
    asm_unified("push {r4-r7,lr}\n"
                    "\tmov r7, r10\n"
                    "\tmov r6, r9\n"
                    "\tmov r5, r8\n"
                    "\tpush {r5-r7}\n"
                    "\tsub sp, 0x14\n"
                    "\tmov r8, r0\n"
                    "\tmovs r0, 0\n"
                    "\tmov r10, r0\n"
                    "\tmovs r1, 0x5\n"
                    "\tmov r9, r1\n"
                    "\tmovs r2, 0\n"
                    "\tstr r2, [sp, 0xC]\n"
                    "\tmov r0, sp\n"
                    "\tmovs r1, 0\n"
                    "\tmovs r2, 0xA\n"
                    "\tbl memset\n"
                    "\tbl Random\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tstr r0, [sp, 0x10]\n"
                    "\tldr r7, _08119610 @ =gSharedMem + 0x19000\n"
                    "\tadds r0, r7, 0\n"
                    "\tadds r0, 0x7D\n"
                    "\tmovs r6, 0x1\n"
                    "\tstrb r6, [r0]\n"
                    "\tldrb r4, [r7, 0x3]\n"
                    "\tmovs r0, 0x20\n"
                    "\torrs r4, r0\n"
                    "\tmovs r0, 0x41\n"
                    "\tnegs r0, r0\n"
                    "\tands r4, r0\n"
                    "\tstrb r4, [r7, 0x3]\n"
                    "\tadds r1, r7, 0\n"
                    "\tadds r1, 0x7E\n"
                    "\tmovs r0, 0xFF\n"
                    "\tstrb r0, [r1]\n"
                    "\tadds r5, r7, 0\n"
                    "\tadds r5, 0x88\n"
                    "\tmov r3, r8\n"
                    "\tmovs r1, 0x34\n"
                    "\tldrsh r0, [r3, r1]\n"
                    "\tbl __floatsisf\n"
                    "\tstr r0, [r5]\n"
                    "\tadds r1, r7, 0\n"
                    "\tadds r1, 0x98\n"
                    "\tldr r0, _08119614 @ =0x00000000\n"
                    "\tstr r0, [r1]\n"
                    "\tadds r3, r7, 0\n"
                    "\tadds r3, 0x8C\n"
                    "\tldr r2, _08119618 @ =gUnknown_083F8DF4\n"
                    "\tldrb r0, [r7, 0x4]\n"
                    "\tlsls r0, 30\n"
                    "\tlsrs r1, r0, 25\n"
                    "\tadds r2, 0x1C\n"
                    "\tadds r1, r2\n"
                    "\tldr r1, [r1]\n"
                    "\tstr r1, [r3]\n"
                    "\tlsrs r0, 30\n"
                    "\tlsls r1, r0, 4\n"
                    "\tsubs r1, r0\n"
                    "\tlsls r1, 1\n"
                    "\tadds r1, 0x21\n"
                    "\tlsls r4, 27\n"
                    "\tlsrs r4, 27\n"
                    "\tsubs r6, r4\n"
                    "\tlsls r0, r6, 4\n"
                    "\tsubs r0, r6\n"
                    "\tadds r1, r0\n"
                    "\tlsls r1, 16\n"
                    "\tlsrs r1, 16\n"
                    "\tmov r5, r10\n"
                    "\tmov r3, r8\n"
                    "\tmovs r0, 0x34\n"
                    "\tldrsh r2, [r3, r0]\n"
                    "_081195C8:\n"
                    "\tcmp r1, r2\n"
                    "\tbge _081195D4\n"
                    "\tadds r0, r1, 0\n"
                    "\tadds r0, 0x5A\n"
                    "\tcmp r2, r0\n"
                    "\tble _08119638\n"
                    "_081195D4:\n"
                    "\tcmp r5, 0x3\n"
                    "\tbeq _0811961C\n"
                    "\tadds r0, r1, 0\n"
                    "\tadds r0, 0x5A\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r1, r0, 16\n"
                    "\tadds r0, r5, 0x1\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r5, r0, 24\n"
                    "\tcmp r5, 0x3\n"
                    "\tbls _081195C8\n"
                    "_081195EA:\n"
                    "\tldr r0, _08119610 @ =gSharedMem + 0x19000\n"
                    "\tldrb r1, [r0, 0x3]\n"
                    "\tmovs r0, 0x1F\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _08119664\n"
                    "\tmov r1, r8\n"
                    "\tmovs r2, 0x2E\n"
                    "\tldrsh r0, [r1, r2]\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _08119658\n"
                    "\tmovs r0, 0x98\n"
                    "\tlsls r0, 1\n"
                    "\tmovs r1, 0x3F\n"
                    "\tnegs r1, r1\n"
                    "\tbl PlayCry1\n"
                    "\tb _08119670\n"
                    "\t.align 2, 0\n"
                    "_08119610: .4byte gSharedMem + 0x19000\n"
                    "_08119614: .4byte 0x00000000\n"
                    "_08119618: .4byte gUnknown_083F8DF4\n"
                    "_0811961C:\n"
                    "\tmovs r0, 0x1\n"
                    "\tmov r3, r8\n"
                    "\tstrh r0, [r3, 0x2E]\n"
                    "\tldr r2, _08119634 @ =gSharedMem + 0x19000\n"
                    "\tldrb r1, [r2, 0x3]\n"
                    "\tsubs r0, 0x21\n"
                    "\tands r0, r1\n"
                    "\tmovs r1, 0x1\n"
                    "\torrs r0, r1\n"
                    "\tstrb r0, [r2, 0x3]\n"
                    "\tb _081195EA\n"
                    "\t.align 2, 0\n"
                    "_08119634: .4byte gSharedMem + 0x19000\n"
                    "_08119638:\n"
                    "\tlsrs r0, r5, 1\n"
                    "\tmov r1, r8\n"
                    "\tstrh r0, [r1, 0x2E]\n"
                    "\tldr r3, _08119654 @ =gSharedMem + 0x19000\n"
                    "\tmovs r1, 0x1\n"
                    "\tands r1, r5\n"
                    "\tldrb r2, [r3, 0x3]\n"
                    "\tmovs r0, 0x20\n"
                    "\tnegs r0, r0\n"
                    "\tands r0, r2\n"
                    "\torrs r0, r1\n"
                    "\tstrb r0, [r3, 0x3]\n"
                    "\tb _081195EA\n"
                    "\t.align 2, 0\n"
                    "_08119654: .4byte gSharedMem + 0x19000\n"
                    "_08119658:\n"
                    "\tmovs r0, 0x98\n"
                    "\tlsls r0, 1\n"
                    "\tmovs r1, 0x3F\n"
                    "\tbl PlayCry1\n"
                    "\tb _08119670\n"
                    "_08119664:\n"
                    "\tmovs r0, 0x99\n"
                    "\tlsls r0, 1\n"
                    "\tmovs r1, 0x3F\n"
                    "\tnegs r1, r1\n"
                    "\tbl PlayCry1\n"
                    "_08119670:\n"
                    "\tmovs r5, 0x2\n"
                    "\tldr r4, _081196A0 @ =gSharedMem + 0x19000\n"
                    "\tadds r0, r4, 0\n"
                    "\tadds r0, 0x7F\n"
                    "\tldrb r0, [r0]\n"
                    "\tadds r0, 0x2\n"
                    "\tmovs r1, 0xC\n"
                    "\tbl __modsi3\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r3, r0, 24\n"
                    "\tldrb r1, [r4, 0x3]\n"
                    "\tmovs r0, 0x1F\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0x1\n"
                    "\tbne _081196A4\n"
                    "\tldrb r1, [r4, 0x4]\n"
                    "\tmovs r0, 0x3\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0x1\n"
                    "\tbne _081196A4\n"
                    "\tmov r0, r9\n"
                    "\tadds r0, 0x6\n"
                    "\tb _081196A8\n"
                    "\t.align 2, 0\n"
                    "_081196A0: .4byte gSharedMem + 0x19000\n"
                    "_081196A4:\n"
                    "\tmov r2, r9\n"
                    "\tadds r0, r2, r5\n"
                    "_081196A8:\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tmov r9, r0\n"
                    "\tcmp r5, r9\n"
                    "\tbcs _0811970E\n"
                    "\tldr r6, _08119734 @ =gSharedMem + 0x19000\n"
                    "\tldr r7, _08119738 @ =gUnknown_083F8C00 + 0xC\n"
                    "_081196B6:\n"
                    "\tlsls r0, r3, 3\n"
                    "\tldr r1, _0811973C @ =gUnknown_083F8D90 + 0x4\n"
                    "\tadds r0, r1\n"
                    "\tldr r1, [r6, 0x8]\n"
                    "\tldr r2, [r0]\n"
                    "\tands r1, r2\n"
                    "\tcmp r1, 0\n"
                    "\tbne _081196F8\n"
                    "\tmov r0, r10\n"
                    "\tadds r1, r0, 0x1\n"
                    "\tlsls r1, 24\n"
                    "\tlsrs r1, 24\n"
                    "\tmov r10, r1\n"
                    "\tadd r0, sp\n"
                    "\tstrb r5, [r0]\n"
                    "\tldr r0, [sp, 0xC]\n"
                    "\tcmp r0, 0\n"
                    "\tbne _081196F8\n"
                    "\tldrb r0, [r6, 0x1A]\n"
                    "\tlsls r0, 28\n"
                    "\tlsrs r0, 28\n"
                    "\tldr r1, _08119740 @ =gSharedMem + 0x1901B\n"
                    "\tadds r0, r1\n"
                    "\tldrb r1, [r0]\n"
                    "\tlsls r0, r1, 2\n"
                    "\tadds r0, r1\n"
                    "\tlsls r0, 2\n"
                    "\tadds r0, r7\n"
                    "\tldr r0, [r0]\n"
                    "\tands r2, r0\n"
                    "\tcmp r2, 0\n"
                    "\tbeq _081196F8\n"
                    "\tstr r5, [sp, 0xC]\n"
                    "_081196F8:\n"
                    "\tadds r0, r3, 0x1\n"
                    "\tmovs r1, 0xC\n"
                    "\tbl __modsi3\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r3, r0, 24\n"
                    "\tadds r0, r5, 0x1\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r5, r0, 24\n"
                    "\tcmp r5, r9\n"
                    "\tbcc _081196B6\n"
                    "_0811970E:\n"
                    "\tldrb r0, [r4, 0x3]\n"
                    "\tlsls r0, 27\n"
                    "\tlsrs r0, 27\n"
                    "\tadds r0, 0x1\n"
                    "\tldrb r1, [r4, 0x2]\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _08119756\n"
                    "\tldr r2, [sp, 0xC]\n"
                    "\tcmp r2, 0\n"
                    "\tbeq _08119744\n"
                    "\tmovs r0, 0xFF\n"
                    "\tldr r3, [sp, 0x10]\n"
                    "\tands r0, r3\n"
                    "\tcmp r0, 0xBF\n"
                    "\tbhi _08119744\n"
                    "\tmov r0, r8\n"
                    "\tstrh r2, [r0, 0x3C]\n"
                    "\tb _08119766\n"
                    "\t.align 2, 0\n"
                    "_08119734: .4byte gSharedMem + 0x19000\n"
                    "_08119738: .4byte gUnknown_083F8C00 + 0xC\n"
                    "_0811973C: .4byte gUnknown_083F8D90 + 0x4\n"
                    "_08119740: .4byte gSharedMem + 0x1901B\n"
                    "_08119744:\n"
                    "\tldr r0, [sp, 0x10]\n"
                    "\tmov r1, r10\n"
                    "\tbl __modsi3\n"
                    "\tadd r0, sp\n"
                    "\tldrb r0, [r0]\n"
                    "\tmov r1, r8\n"
                    "\tstrh r0, [r1, 0x3C]\n"
                    "\tb _08119766\n"
                    "_08119756:\n"
                    "\tldr r0, [sp, 0x10]\n"
                    "\tmov r1, r10\n"
                    "\tbl __modsi3\n"
                    "\tadd r0, sp\n"
                    "\tldrb r0, [r0]\n"
                    "\tmov r2, r8\n"
                    "\tstrh r0, [r2, 0x3C]\n"
                    "_08119766:\n"
                    "\tldr r3, _0811977C @ =sub_8118CEC\n"
                    "\tmov r0, r8\n"
                    "\tstr r3, [r0, 0x1C]\n"
                    "\tadd sp, 0x14\n"
                    "\tpop {r3-r5}\n"
                    "\tmov r8, r3\n"
                    "\tmov r9, r4\n"
                    "\tmov r10, r5\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r0}\n"
                    "\tbx r0\n"
                    "\t.align 2, 0\n"
                    "_0811977C: .4byte sub_8118CEC");
}
#endif

void sub_8119780(struct Sprite *sprite)
{
    if (sprite->data[1]++ >= sprite->data[3])
    {
    sprite->pos1.x -= 2;
        if (sprite->pos1.x < -16)
        {
            if (!eRoulette->var03_6)
                eRoulette->var03_6 = TRUE;
            DestroySprite(sprite);
            eRoulette->var01 = 0;
            eRoulette->var34 = gUnknown_083FA61E[0];
        }
    }
}

void sub_81197D8(struct Sprite *sprite)
{
    u16 t[0x3][0x4];
    s32 p, z;

    memcpy(t, &gUnknown_083FA632, 24);
    if (sprite->data[1]++ < sprite->data[3])
    {
        if (sprite->data[1] & 1)
        {
            gSpriteCoordOffsetY = t[sprite->data[2] / 2][sprite->data[7]];
            p = z = sprite->data[7] + 1;
            if (z < 0)
                p += 3;
            sprite->data[7] = z - ((p >> 2) * 4);
        }
        sprite->invisible ^= 1;
    }
    else
    {
        gSpriteCoordOffsetY = 0x0;
        gSprites[eRoulette->var3C[0x37]].animPaused = FALSE;
        DestroySprite(sprite);
    }
}

void sub_8119898(struct Sprite *sprite)
{
    float t;
    sprite->data[0x1]++;
    t = sprite->data[0x1];
    sprite->pos2.y = t * 0.039f * t;
    eRoulette->var34 = gUnknown_083FA61E[(eRoulette->var01 - 0x1) / 2];
    if (eRoulette->var01 < 0x13)
        eRoulette->var01++;
    if (sprite->data[0x1] > 0x3C)
    {
        sprite->data[0x1] = 0x0;
        sprite->callback = &sub_8119780;
        gSprites[sprite->data[0x6]].callback  = &sub_8119780;
        gSprites[sprite->data[0x6]].data[0x1] = -0x2;
        gSprites[sprite->data[0x5]].invisible = FALSE;
        gSprites[sprite->data[0x5]].callback  = &sub_81197D8;
        m4aSongNumStart(0xD6);
    }
}

void sub_8119964(struct Sprite *sprite)
{
    if (sprite->data[0x7] == 0x0)
    {
        register u32 t asm("r2");
        u32 z ;
        if (eRoulette->var38->data[0x0] == 0x0)
        {
            t = eRoulette->var38->data[0x3];
            z = gUnknown_083F8DF4[eRoulette->var04_0].var08;
        }
        else
        {
            t = eRoulette->var38->data[0x3];
            z = gUnknown_083F8DF4[eRoulette->var04_0].var08;
            z += 0xB4;
        }
        if (t == z)
        {
            sprite->invisible = FALSE;
            sprite->data[0x7]++;
            m4aSongNumStart(0x2B);
            eRoulette->var01 = 0x1;
            eRoulette->var34 = gUnknown_083FA61E[0x0];
        }
    }
    else
    {
        u32 t, z;
        eRoulette->var34 = gUnknown_083FA61E[(eRoulette->var01 - 0x1) / 2];
        if (eRoulette->var01 < 0x13)
            eRoulette->var01++;
        if (eRoulette->var38->data[0x0] == 0x0)
        {
            t = eRoulette->var38->data[0x3];
            z = gUnknown_083F8DF4[eRoulette->var04_0].var0A;
        }
        else
        {
            t = eRoulette->var38->data[0x3];
            z = gUnknown_083F8DF4[eRoulette->var04_0].var0A ;
            z += 0xB4;
        }
        if (t == z)
        {
            gSprites[sprite->data[0x4]].callback  = &sub_8119898;
            gSprites[sprite->data[0x4]].invisible = FALSE;
            sprite->callback  = &SpriteCallbackDummy;
            sprite->data[0x7] = 0x0;
        }
    }
}

void sub_8119A90(struct Sprite *sprite)
{
    sprite->invisible ^= 0x1;
}

void sub_8119AAC(struct Sprite *sprite)
{
    if (sprite->pos1.y > -0x10)
    {
        sprite->pos1.y--;
    }
    else
    {
        sprite->callback   = &SpriteCallbackDummy;
        sprite->invisible  = TRUE;
        sprite->animPaused = TRUE;
        m4aSongNumStop(0x5E);
        DestroySprite(sprite);
        FreeOamMatrix(gSprites[eRoulette->var3C[0x38]].oam.matrixNum);
        DestroySprite(&gSprites[eRoulette->var3C[0x38]]);
    }
}

void sub_8119B24(struct Sprite *sprite)
{
    if (sprite->data[0x1] >= 0x0)
    {
        sprite->data[0x1]--;
        sprite->pos1.y--;
        if (sprite->data[0x1] == 0x0 && sprite->animCmdIndex == 0x1)
            sprite->pos2.y++;
    }
    else
    {
        if (sprite->data[0x3] >= 0x0)
        {
            sprite->data[0x3]--;
            if (sprite->animDelayCounter == 0x0)
            {
                if (sprite->animCmdIndex == 0x1)
                    sprite->pos2.y++;
                else
                    sprite->pos2.y--;
            }
        }
        else
        {
            m4aSongNumStart(0x2B);
            StartSpriteAnim(sprite, eRoulette->var38->data[0x0] + 0x4);
            sprite->callback = &sub_8119AAC;
            gSprites[sprite->data[0x6]].affineAnimPaused = FALSE;
        }
    }
}

void sub_8119BCC(struct Sprite *sprite)
{
    s8 t[0x2]; //sign
    s8 z[0x8][0x2];
    memcpy(t, &gUnknown_083FA64A, 0x2);
    memcpy(z, &gUnknown_083FA64C, 0x10);
    if (sprite->data[0x1]-- > 0x7)
    {
        sprite->pos1.x += t[eRoulette->var38->data[0x0]] * 0x2;
        if (IsSEPlaying())
        {
            s8 u =  -((0x74 - sprite->pos1.x) / 0x2);
            m4aMPlayPanpotControl(&gMPlay_SE1, 0xFFFF,u);
            m4aMPlayPanpotControl(&gMPlay_SE2, 0xFFFF, u);
        }
    }
    else
    {
        if (sprite->data[0x1] >= 0x0)
        {
            sprite->pos1.x += t[eRoulette->var38->data[0x0]] * z[0x7 - sprite->data[0x1]][0x0];
            sprite->pos1.y += z[0x7 - sprite->data[0x1]][0x1];
        }
        else
        {
            m4aSongNumStartOrChange(0x5E);
            if (eRoulette->var38->data[0x0] == 0x0)
                PlayCry1(SPECIES_TAILLOW, 0x3F);
            else
                PlayCry1(SPECIES_TAILLOW, -0x3F);
            StartSpriteAnim(sprite, eRoulette->var38->data[0x0] + 0x2);
            sprite->data[0x1] = 45;
            sprite->callback = &sub_8119B24;
        }
    }
}

void sub_8119D08(struct Sprite *sprite)
{
    s8 t[0x2]; //sign
    memcpy(t, &gUnknown_083FA64A, 0x2);
    if (sprite->data[0x1]-- >= 0x0)
    {
        sprite->pos1.x += t[eRoulette->var38->data[0x0]] * 0x2;
        gSprites[sprite->data[0x6]].invisible ^= 0x1;
    }
    else
    {
        sprite->callback = &sub_8119A90;
    }
}

void sub_8119D80(struct Sprite *sprite)
{
    if (eRoulette->var38->data[0x0] == 0x0)
    {
        if (eRoulette->var38->data[0x3] == gUnknown_083F8DF4[eRoulette->var04_0].var12 + 90)
        {
            gSprites[sprite->data[0x6]].data[0x1] = 0x34;
            gSprites[sprite->data[0x4]].data[0x1] = 0x34;
        }
        else
        {
            return;
        }
    }
    else
    {
        if (eRoulette->var38->data[0x3] == gUnknown_083F8DF4[eRoulette->var04_0].var14 + 270)
        {
            gSprites[sprite->data[0x6]].data[0x1] = 0x2E;
            gSprites[sprite->data[0x4]].data[0x1] = 0x2E;
        }
        else
        {
            return;
        }
    }
    gSprites[sprite->data[0x6]].callback = &sub_8119D08;
    gSprites[sprite->data[0x4]].callback = &sub_8119BCC;
    m4aSongNumStart(0x2B);
}
