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

#if DEBUG
extern u8 unk_2039560;
#endif //DEBUG

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
    0xc00,
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

const struct OamData gOamData_83FA1FC = {
    .shape = ST_OAM_H_RECTANGLE,
    .size = 3,
    .priority = 1
};

const struct OamData gOamData_83FA204 = {
    .shape = ST_OAM_V_RECTANGLE,
    .size = 0,
    .priority = 1
};

const struct OamData gOamData_83FA20C = {
    .shape = ST_OAM_H_RECTANGLE,
    .size = 2,
    .priority = 1
};

const struct OamData gOamData_83FA214 = {
    .shape = ST_OAM_H_RECTANGLE,
    .size = 0,
    .priority = 1
};

const struct SpriteSheet gUnknown_083FA21C[] = {
    {gRouletteCreditTiles, 0x400, 7},
    {gRouletteNumbersTiles, 0x280, 8},
    {gRouletteMultiplierTiles, 0x500, 9},
    {RouletteBallCounterTiles, 0x140, 10},
    {RouletteCursorTiles, 0x200, 11},
    {}
};

const union AnimCmd gSpriteAnim_83FA24C[] = {
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_FRAME(2, 0),
    ANIMCMD_FRAME(4, 0),
    ANIMCMD_FRAME(6, 0),
    ANIMCMD_FRAME(8, 0),
    ANIMCMD_FRAME(10, 0),
    ANIMCMD_FRAME(12, 0),
    ANIMCMD_FRAME(14, 0),
    ANIMCMD_FRAME(16, 0),
    ANIMCMD_FRAME(18, 0),
    // ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83FA274[] = {
    gSpriteAnim_83FA24C
};

const union AnimCmd gSpriteAnim_83FA278[] = {
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_FRAME(8, 0),
    ANIMCMD_FRAME(16, 0),
    ANIMCMD_FRAME(24, 0),
    ANIMCMD_FRAME(32, 0),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83FA290[] = {
    gSpriteAnim_83FA278
};

const union AnimCmd gSpriteAnim_83FA294[] = {
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_FRAME(2, 0),
    ANIMCMD_FRAME(4, 0),
    ANIMCMD_FRAME(6, 0),
    ANIMCMD_FRAME(8, 0),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83FA2AC[] = {
    gSpriteAnim_83FA294
};

const struct SpriteTemplate gSpriteTemplate_83FA2B0 = {7, 5, &gOamData_83FA1FC, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy};

const struct SpriteTemplate gSpriteTemplate_83FA2C8 = {8, 5, &gOamData_83FA204, gSpriteAnimTable_83FA274, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy};

const struct SpriteTemplate gSpriteTemplate_83FA2E0 = {9, 5, &gOamData_83FA20C, gSpriteAnimTable_83FA290, NULL, gDummySpriteAffineAnimTable, sub_81184CC};

const struct SpriteTemplate gSpriteTemplate_83FA2F8 = {10, 3, &gOamData_83FA214, gSpriteAnimTable_83FA2AC, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy};

const struct SpriteTemplate gSpriteTemplate_83FA310 = {11, 5, &gOamData_83F9EB8, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy};

const struct OamData gOamData_83FA328 = {
    .shape = ST_OAM_SQUARE,
    .size = 1,
    .priority = 2
};

const struct SpriteFrameImage gSpriteImageTable_83FA330[] = {
    {(void *)ewram17E00 + 0, 128},
    {(void *)ewram17E00 + 128, 128},
    {(void *)ewram17E00 + 0x100, 128},
    {(void *)ewram17E00 + 0x180, 128}
};

const union AnimCmd gSpriteAnim_83FA350[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_83FA364[] = {
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_FRAME(1, 10),
    ANIMCMD_FRAME(2, 10),
    ANIMCMD_FRAME(1, 10),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_83FA378[] = {
    ANIMCMD_FRAME(0, 15),
    ANIMCMD_FRAME(1, 15),
    ANIMCMD_FRAME(2, 15),
    ANIMCMD_FRAME(1, 15),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_83FA38C[] = {
    ANIMCMD_FRAME(1, 2),
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_FRAME(3, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83FA3A0[] = {
    ANIMCMD_FRAME(1, 2),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(2, 4),
    ANIMCMD_FRAME(3, 4),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83FA3B8[] = {
    ANIMCMD_FRAME(0, 2),
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_FRAME(3, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83FA3CC[] = {
    ANIMCMD_FRAME(3, 0),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83FA3D4[] = {
    ANIMCMD_FRAME(2, 2),
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(3, 5),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83FA3E8[] = {
    gSpriteAnim_83FA350,
    gSpriteAnim_83FA364,
    gSpriteAnim_83FA378,
    gSpriteAnim_83FA38C,
    gSpriteAnim_83FA3D4,
    gSpriteAnim_83FA3A0,
    gSpriteAnim_83FA3B8,
    gSpriteAnim_83FA3B8,
    gSpriteAnim_83FA3CC
};

const struct SpriteTemplate gSpriteTemplate_83FA40C = {0xffff, 2, &gOamData_83FA328, gSpriteAnimTable_83FA3E8, gSpriteImageTable_83FA330, gDummySpriteAffineAnimTable, SpriteCallbackDummy};

const struct OamData gOamData_83FA424 = {
    .y = 81,
    .affineMode = ST_OAM_AFFINE_DOUBLE,
    .shape = ST_OAM_SQUARE,
    .size = 3,
    .priority = 2
};

const struct CompressedSpriteSheet gUnknown_083FA42C = {
    gRouletteCenter_Gfx,
    0x800,
    6
};

const struct SpriteTemplate gSpriteTemplate_83FA434 = {6, 2, &gOamData_83FA424, gDummySpriteAnimTable, NULL, gDummySpriteAffineAnimTable, sub_8118554};

const struct OamData gOamData_83FA44C = {
    .shape = ST_OAM_SQUARE,
    .size = 2,
    .priority = 2
};

const struct OamData gOamData_83FA454 = {
    .shape = ST_OAM_SQUARE,
    .size = 2,
    .priority = 2
};

const struct SpriteFrameImage gSpriteImageTable_83FA45C[] = {
    {(void *)ewram17000 + 0, 0x200},
    {(void *)ewram17000 + 0x200, 0x200},
    {(void *)ewram17000 + 0x400, 0x200},
    {(void *)ewram17000 + 0x600, 0x200},
    {(void *)ewram17000 + 0x800, 0x200},
    {(void *)ewram17000 + 0xa00, 0x200},
    {(void *)ewram17000 + 0xc00, 0x200}
};

const union AnimCmd gSpriteAnim_83FA494[] = {
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(1, 6),
    // jump here
    ANIMCMD_FRAME(2, 6),
    ANIMCMD_FRAME(3, 6),
    ANIMCMD_FRAME(2, 6),
    ANIMCMD_FRAME(4, 6),
    ANIMCMD_JUMP(2)
};

const union AnimCmd gSpriteAnim_83FA4B0[] = {
    ANIMCMD_FRAME(5, 10),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83FA4B8[] = {
    ANIMCMD_FRAME(5, 10, .hFlip = TRUE),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83FA4C0[] = {
    ANIMCMD_FRAME(5, 20),
    ANIMCMD_FRAME(6, 20),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_83FA4CC[] = {
    ANIMCMD_FRAME(5, 20, .hFlip = TRUE),
    ANIMCMD_FRAME(6, 20, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_83FA4D8[] = {
    ANIMCMD_FRAME(5, 10),
    ANIMCMD_FRAME(6, 10),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_83FA4E4[] = {
    ANIMCMD_FRAME(5, 10, .hFlip = TRUE),
    ANIMCMD_FRAME(6, 10, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AnimCmd *const gSpriteAnimTable_83FA4F0[] = {
    gSpriteAnim_83FA494
};

const union AnimCmd *const gSpriteAnimTable_83FA4F4[] = {
    gSpriteAnim_83FA4B0,
    gSpriteAnim_83FA4B8,
    gSpriteAnim_83FA4C0,
    gSpriteAnim_83FA4CC,
    gSpriteAnim_83FA4D8,
    gSpriteAnim_83FA4E4
};

const struct SpriteTemplate gSpriteTemplate_83FA50C = {0xffff, 6, &gOamData_83FA44C, gSpriteAnimTable_83FA4F0, gSpriteImageTable_83FA45C, gDummySpriteAffineAnimTable, SpriteCallbackDummy};

const struct SpriteTemplate gSpriteTemplate_83FA524 = {0xffff, 7, &gOamData_83FA454, gSpriteAnimTable_83FA4F4, gSpriteImageTable_83FA45C, gDummySpriteAffineAnimTable, sub_8119D80};

const struct OamData gOamData_83FA53C = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .shape = ST_OAM_SQUARE,
    .size = 1,
    .priority = 2
};

const struct OamData gOamData_83FA544 = {
    .affineMode = ST_OAM_AFFINE_OFF,
    .shape = ST_OAM_H_RECTANGLE,
    .size = 2,
    .priority = 2
};

const struct OamData gOamData_83FA54C = {
    .affineMode = ST_OAM_AFFINE_NORMAL,
    .shape = ST_OAM_H_RECTANGLE,
    .size = 2,
    .priority = 2
};

const struct SpriteFrameImage gSpriteImageTable_83FA554[] = {
    {(void *)ewram18000 + 0, 128}
};

const struct SpriteFrameImage gSpriteImageTable_83FA55C[] = {
    {(void *)ewram18000 + 128, 0x100}
};

const union AffineAnimCmd gSpriteAffineAnim_83FA564[] = {
    AFFINEANIMCMD_FRAME(128, 128, 0,  0),
    AFFINEANIMCMD_FRAME(  2,   2, 0, 60),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gSpriteAffineAnim_83FA57C[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0,  0),
    AFFINEANIMCMD_FRAME( -2,   0, 0, 15),
    AFFINEANIMCMD_FRAME( -1,  -2, 0, 15),
    AFFINEANIMCMD_FRAME( -1,  -5, 0, 24),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83FA5A4[] = {
    gSpriteAffineAnim_83FA564
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83FA5A8[] = {
    gSpriteAffineAnim_83FA57C
};

const union AffineAnimCmd gSpriteAffineAnim_83FA5AC[] = {
    AFFINEANIMCMD_FRAME(256, 256, 0, 0),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83FA5BC[] = {
    gSpriteAffineAnim_83FA5AC
};

const struct SpriteTemplate gSpriteTemplate_83FA5C0[] = {
    {0xffff, 1, &gOamData_83FA53C, gSpriteAnimTable_83F9ED8, gSpriteImageTable_83FA554, gDummySpriteAffineAnimTable, SpriteCallbackDummy},
    {0xffff, 1, &gOamData_83FA544, gSpriteAnimTable_83F9ED8, gSpriteImageTable_83FA55C, gDummySpriteAffineAnimTable, sub_8119964}
};

const struct SpriteTemplate gSpriteTemplate_83FA5F0 = {0xffff, 1, &gOamData_83FA54C, gSpriteAnimTable_83F9ED8, gSpriteImageTable_83FA55C, gSpriteAffineAnimTable_83FA5A8, sub_8119D80};

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
    u8 spriteid = CreateSprite(r0, 116, 80, r0->oam->y);
    gSprites[spriteid].data[0]            = *r2;
    gSprites[spriteid].data[1]            = r1;
    gSprites[spriteid].coordOffsetEnabled = TRUE;
    gSprites[spriteid].animPaused         = TRUE;
    gSprites[spriteid].affineAnimPaused   = TRUE;
    temp = *r2;
    *r2 += 30;
    if (*r2 >- 360)
        *r2 = temp - 330;
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
    for (i = 0; i < 3; i++)
    {
        u8 o = i * 24;
        for (j = 0; j < 4; j++)
        {
            spriteid = eRoulette->var3C[29 + i * 4 + j] =
                CreateSprite(&gSpriteTemplate_83FA07C[j], j * 24 + 148, o + 92, 30);
            gSprites[spriteid].animPaused = TRUE;
            o += 24;
            if (o > 71)
                o = 0;
        }
    }
    for (i = 0; i < 4; i++)
    {
        spriteid = eRoulette->var3C[41 + i] =
            CreateSprite(&gSpriteTemplate_83F9FD4[i], (s16)(i * 24 + 148), 70, 30);
        gSprites[spriteid].animPaused = TRUE;
    }
    for (i = 0; i < 3; i++)
    {
        spriteid = eRoulette->var3C[45 + i] =
            CreateSprite(&gSpriteTemplate_83FA034[i], 126, (s16)(i * 24 + 92), 30);
        gSprites[spriteid].animPaused = TRUE;
    }
}

void unref_sub_8117A74(void) //destroy all sprites at 29
{
    u8 i;
    for (i = 0; i < 12; i++)
        DestroySprite(&gSprites[eRoulette->var3C[29 + i]]);
}

void sub_8117AA8(u8 r0, u8 r1)
{
    u8 i;
    switch (r0)
    {
    case 1:
        for (i = 0; i < 19; i++)
            gSprites[eRoulette->var3C[29 + i]].invisible = TRUE;
        break;
    case 0:
        for (i = 0; i < 12; i++)
        {
            if (!(eRoulette->var08 & gUnknown_083F8D90[i].var04))
                gSprites[eRoulette->var3C[29 + i]].invisible = FALSE;
            else if(!(gUnknown_083F8D90[i].var02 == r1))
                gSprites[eRoulette->var3C[29 + i]].invisible = TRUE;
            else
                gSprites[eRoulette->var3C[29 + i]].invisible = FALSE;
        }
        for (; i < 19; i++)
            gSprites[eRoulette->var3C[29 + i]].invisible = FALSE;
        break;
    }
}

void sub_8117BBC(void)
{
    u8 i;
    for (i = 0; i < 6; i++)
    {
        eRoulette->var3C[49 + i] = CreateSprite(&gSpriteTemplate_83FA40C, 116, 20, 10);
        gSprites[eRoulette->var3C[49 + i]].invisible    = TRUE;
        gSprites[eRoulette->var3C[49 + i]].data[0]      = 1;
        gSprites[eRoulette->var3C[49 + i]].callback     = &sub_81184CC;
        gSprites[eRoulette->var3C[49 + i]].oam.priority = 1;
        StartSpriteAnim(&gSprites[eRoulette->var3C[49 + i]], 8);
    }
}

void sub_8117C60(u8 r0, u8 r1)
{
    u8 i = 0;
    if (r0)
    {
        for ( ; i < 6; i++)
            gSprites[eRoulette->var3C[49 + i]].invisible = TRUE;
    }
    else
    {
        for ( ; i < 6; i++)
        {
            if (!(eRoulette->var0C[i]) || (i == r1))
            {
                gSprites[eRoulette->var3C[49 + i]].invisible = TRUE;
            }
            else
            {
                gSprites[eRoulette->var3C[49 + i]].invisible = FALSE;
                gSprites[eRoulette->var3C[49 + i]].pos1.x    = (gUnknown_083F8C00[eRoulette->var0C[i]].var03 + 1) * 8 + 4;
                gSprites[eRoulette->var3C[49 + i]].pos1.y    = (gUnknown_083F8C00[eRoulette->var0C[i]].var04 + 1) * 8 + 3;
            }
        }
    }
}

void sub_8117D68(u8 r0)
{
    if (!r0)
    {
        gSprites[eRoulette->var3C[48]].invisible = TRUE;
    }
    else
    {
        gSprites[eRoulette->var3C[48]].invisible = FALSE;
        gSprites[eRoulette->var3C[48]].pos1.x    = (gUnknown_083F8C00[r0].var03 + 2) * 8;
        gSprites[eRoulette->var3C[48]].pos1.y    = (gUnknown_083F8C00[r0].var04 + 2) * 8;
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
    k = 15;
    for (i = 0; i < 3; i++)
    {
        for (j = 0; j < 4; j++)
        {
            u8 spriteid;
            spriteid =
                eRoulette->var3C[7 + i * 4 + j] = sub_8117890(&gSpriteTemplate_83FA0DC[i * 4 + j], 40, &k);
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
    sprite->pos2.x =  sin * sprite->data[1] >> 12;
    sprite->pos2.y = -cos * sprite->data[1] >> 12;
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
    for (i = 0; i < 5; i++)
    {
        struct SpriteSheet s;
        LZ77UnCompWram(gUnknown_083FA21C[i].data, gSharedMem);
        s.data = gSharedMem;
        s.size = gUnknown_083FA21C[i].size;
        s.tag  = gUnknown_083FA21C[i].tag;
        LoadSpriteSheet(&s);
    }
    eRoulette->var3C[20] = CreateSprite(&gSpriteTemplate_83FA2B0, 208, 16, 4);
    gSprites[eRoulette->var3C[20]].animPaused = TRUE;
    for (i = 0; i < 4; i++)
    {
        eRoulette->var3C[21 + i] = CreateSprite(&gSpriteTemplate_83FA2C8, (s16)(i * 8 + 196), 24, 0);
        gSprites[eRoulette->var3C[21 + i]].invisible = TRUE;
        gSprites[eRoulette->var3C[21 + i]].animPaused = TRUE;
    }
    eRoulette->var3C[25] = CreateSprite(&gSpriteTemplate_83FA2E0, 120, 68, 4);
    gSprites[eRoulette->var3C[25]].animPaused = TRUE;
    for (i = 0; i < 3; i++)
    {
        eRoulette->var3C[26 + i] = CreateSprite(&gSpriteTemplate_83FA2F8, (s16)(i * 16 + 192), 36, 4);
        gSprites[eRoulette->var3C[26 + i]].invisible = TRUE;
        gSprites[eRoulette->var3C[26 + i]].animPaused = TRUE;
    }
    eRoulette->var3C[48] = CreateSprite(&gSpriteTemplate_83FA310, 152, 96, 9);
    gSprites[eRoulette->var3C[48]].oam.priority = 1;
    gSprites[eRoulette->var3C[48]].animPaused = TRUE;
    gSprites[eRoulette->var3C[48]].invisible = TRUE;
}

void sub_81180F4(u16 r0)
{
    u8 i;
    u16 d = 1000;
    bool8 v = FALSE;
    for (i = 0; i < 4; i++)
    {
        u8 t = r0 / d;
        gSprites[eRoulette->var3C[21 + i]].invisible = TRUE;
        if (t > 0 || v || i == 3)
        {
            gSprites[eRoulette->var3C[21 + i]].invisible = FALSE;
            gSprites[eRoulette->var3C[21 + i]].oam.tileNum =
                gSprites[eRoulette->var3C[21 + i]].sheetTileStart
                + (*gSprites[eRoulette->var3C[21 + i]].anims + t)->type;
            v = TRUE;
        }
        r0 = r0 % d;
        d = d / 10;
    }
}

u8 sub_81181E8(u8 r0)
{
    u8 t[] = {0, 1, 2, 3, 4};
    if (r0 >= 20)
        r0 = 0;
    switch (gUnknown_083F8C00[r0].var01_0)
    {
    case 3:
        r0 = r0 / 5 - 1;
        if (eRoulette->var16[r0] < 4)
            return t[((vu8 *)eRoulette->var16)[r0] + 1]; // couldn't recreate redundant loads
        break;
    case 4:
        r0--;
        if (eRoulette->var12[r0] < 3)
            return t[((vu8 *)eRoulette->var12)[r0] + 2];
        break;
    case 12:
        if (!(eRoulette->var08 & gUnknown_083F8C00[r0].var08))
            return t[4];
        break;
    }
    return 0;
}

void sub_811829C(u8 r0)
{
    struct Sprite *s = &gSprites[eRoulette->var3C[25]];
    s->animCmdIndex  = sub_81181E8(r0);
    s->oam.tileNum   =
        s->sheetTileStart
        + (*s->anims + s->animCmdIndex)->type;
}

void sub_81182F8(u8 r0)
{
    u8 i;
    u8 t = 0;
    if (eRoulette->var19 == 1)
        t = 2;
    switch (r0)
    {
    case 6:
        for (i = 0; i < 3; i++)
        {
            gSprites[eRoulette->var3C[26 + i]].invisible = FALSE;
            gSprites[eRoulette->var3C[26 + i]].oam.tileNum =
                gSprites[eRoulette->var3C[26 + i]].sheetTileStart
                + (*gSprites[eRoulette->var3C[26 + i]].anims)->type;
        }
        break;
    case 5:
        gSprites[eRoulette->var3C[28]].oam.tileNum =
            gSprites[eRoulette->var3C[28]].sheetTileStart
            + (*gSprites[eRoulette->var3C[28]].anims + t + 1)->type;
        break;
    case 4:
        gSprites[eRoulette->var3C[28]].oam.tileNum =
            gSprites[eRoulette->var3C[28]].sheetTileStart
            + (*gSprites[eRoulette->var3C[28]].anims + t + 2)->type;
        break;
    case 3:
        gSprites[eRoulette->var3C[27]].oam.tileNum =
            gSprites[eRoulette->var3C[27]].sheetTileStart
            + (*gSprites[eRoulette->var3C[27]].anims + t + 1)->type;
        break;
    case 2:
        gSprites[eRoulette->var3C[27]].oam.tileNum =
            gSprites[eRoulette->var3C[27]].sheetTileStart
            + (*gSprites[eRoulette->var3C[27]].anims + t + 2)->type;
        break;
    case 1:
        gSprites[eRoulette->var3C[26]].oam.tileNum =
            gSprites[eRoulette->var3C[26]].sheetTileStart
            + (*gSprites[eRoulette->var3C[26]].anims + t + 1)->type;
        break;
    case 0:
    default:
        for (i = 0; i < 3; i++)
        {
            gSprites[eRoulette->var3C[26 + i]].oam.tileNum =
                gSprites[eRoulette->var3C[26 + i]].sheetTileStart
                + (*gSprites[eRoulette->var3C[26 + i]].anims + t + 2)->type;
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
    spriteid = CreateSprite(&gSpriteTemplate_83FA434, 116, 80, 81);
    gSprites[spriteid].data[0]            = eRoulette->var24;
    gSprites[spriteid].data[1]            = 0;
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
    for (i = 0; i < 6; i++)
    {
        u8 spriteid =
            eRoulette->var3C[i] = CreateSprite(&gSpriteTemplate_83FA40C, 116, 80, 57 - i);
        if (spriteid != 64)
        {
            gSprites[eRoulette->var3C[i]].invisible          = TRUE;
            gSprites[eRoulette->var3C[i]].coordOffsetEnabled = TRUE;
        }
    }
}

void sub_81185E8(void)
{
    u8 t = eRoulette->var3C[0];
    u8 i;
    for (i = 0; i < 6; i++)
    {
        u8 j;
        gSprites[t].invisible = TRUE;
        gSprites[t].callback = &SpriteCallbackDummy;
        StartSpriteAnim(&gSprites[t], 0);
        for (j = 0; j < 8; j++)
            gSprites[t].data[j] = 0;
        t++;
    }
}

s16 sub_811866C(struct Sprite *sprite)
{
    if (eRoulette->var24 > sprite->data[3])
    {
        sprite->data[6] = 360 - eRoulette->var24 + sprite->data[3];
        if (sprite->data[6] > 359)
            sprite->data[6] -= 360;
    }
    else
        sprite->data[6] = sprite->data[3] - eRoulette->var24;
    return sprite->data[6];
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
    if (t == 14)
    {
        z = 0;
        return sprite->data[2] = z;
    }
    else if (t > 13)
    {
        z = (u16)(43 - t);
        return sprite->data[2] = z;
    }
    else
    {
        z = (u16)(14 - t);
        return sprite->data[2] = z;
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
    sprite->data[3] = eRoulette->var88;
    eRoulette->var98 += eRoulette->var9C;
    eRoulette->var94 += eRoulette->var98;
    sprite->data[4] = eRoulette->var94;
    sin = Sin2(sprite->data[3]);
    cos = Cos2(sprite->data[3]);
    sprite->pos2.x =  sin * sprite->data[4] >> 12;
    sprite->pos2.y = -cos * sprite->data[4] >> 12;
    if (IsSEPlaying())
    {
        m4aMPlayPanpotControl(&gMPlay_SE1, 0xffff, sprite->pos2.x);
        m4aMPlayPanpotControl(&gMPlay_SE2, 0xffff, sprite->pos2.x);
    }
}

void sub_8118834(struct Sprite *sprite)
{
    s16 sin, cos;
    sprite->data[3] = eRoulette->var24 + sprite->data[6];
    if (sprite->data[3] > 359)
        sprite->data[3] -= 360;
    sin = Sin2(sprite->data[3]);
    cos = Cos2(sprite->data[3]);
    sprite->pos2.x =  sin * sprite->data[4] >> 12;
    sprite->pos2.y = -cos * sprite->data[4] >> 12;
    sprite->pos2.y += gSpriteCoordOffsetY;
}

void sub_811889C(struct Sprite *sprite)
{
    sub_8118724(sprite);
    sprite->data[2]++;
    if ((u16)(sprite->data[4] + 132) > 212)
        sprite->invisible = TRUE;
    else
        sprite->invisible = FALSE;
    if (!(sprite->data[2] < 30))
    {
        if (!sprite->data[0])
        {
            if (eRoulette->var94 <= eRoulette->varA0 - 2.0f)
            {
                eRoulette->var7D = 255;
                eRoulette->var03_7 = 0;
                StartSpriteAnim(sprite, sprite->animCmdIndex + 3);
                sub_81186B8(sprite);
                sprite->data[4] = 30;
                sub_811866C(sprite);
                sprite->data[6] = (sprite->data[6] / 30) * 30 + 15;
                sprite->callback = &sub_8118834;
                m4aSongNumStartOrChange(SE_HASHI);
                eRoulette->var9C = eRoulette->var98 = 0.0f;
                eRoulette->var8C = -1.0f;
            }
        }
        else
        {
            if (eRoulette->var94 >= eRoulette->varA0 - 2.0f)
            {
                eRoulette->var7D = 255;
                eRoulette->var03_7 = 0;
                StartSpriteAnim(sprite, sprite->animCmdIndex + 3);
                sub_81186B8(sprite);
                sprite->data[4] = 30;
                sub_811866C(sprite);
                sprite->data[6] = (sprite->data[6] / 30) * 30 + 15;
                sprite->callback = &sub_8118834;
                m4aSongNumStartOrChange(SE_HASHI);
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
    switch (sprite->data[3])
    {
    case 0:
        if (sprite->data[0] != 1)
        {
            f0 = ((float)sprite->data[7]);
            p = &gUnknown_083F8DF4[0];
            f1 = (f0 * ((float)(s32)p[eRoulette->var04_0].var01) + (float)((s32)p[eRoulette->var04_0].var02 - 1));
            f2 = (f0 / ((float)(s32)p[eRoulette->var04_0].var0C));
        }
        else
        {
            return;
        }
        break;
    case 180:
        if (sprite->data[0] != 0)
        {
            f0 = ((float)sprite->data[7]);
            p = &gUnknown_083F8DF4[0];
            f1 = (f0 * ((float)(s32)p[eRoulette->var04_0].var01) + (float)((s32)p[eRoulette->var04_0].var02 - 1));
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
    sprite->animNum       = 0;
    sprite->animBeginning = TRUE;
    sprite->animEnded     = FALSE;
    sprite->callback      = &sub_811889C;
    sprite->data[2]     = 0;
}

void sub_8118B30(struct Sprite *sprite)
{
    sprite->pos2.y = (s32)(((float)sprite->data[2]) * 0.05f * ((float)sprite->data[2])) - 45;
    sprite->data[2]++;
    if (sprite->data[2] > 29 && sprite->pos2.y >= 0)
    {
        eRoulette->var7D   = 255;
        eRoulette->var03_7 = FALSE;
        StartSpriteAnim(sprite, sprite->animCmdIndex + 3);
        sub_81186B8(sprite);
        sprite->data[4] = 30;
        sub_811866C(sprite);
        sprite->data[6] = (sprite->data[6] / 30) * 30 + 15;
        sprite->callback  = &sub_8118834;
        m4aSongNumStartOrChange(SE_HASHI);
        eRoulette->var03_6 = TRUE;
    }
}

void sub_8118BD8(struct Sprite *sprite)
{
    if (sprite->data[2]++ < 45)
    {
        sprite->pos2.y--;
        if (sprite->data[2] == 45)
        {
            if (gSprites[eRoulette->var3C[55]].animCmdIndex == 1)
                sprite->pos2.y++;
        }
    }
    else
    {
        if (sprite->data[2] < sprite->data[7])
        {
            if (gSprites[eRoulette->var3C[55]].animDelayCounter == 0)
            {
                if (gSprites[eRoulette->var3C[55]].animCmdIndex == 1)
                    sprite->pos2.y++;
                else
                    sprite->pos2.y--;
            }
        }
        else
        {
            sprite->animPaused    = FALSE;
            sprite->animNum       = 1;
            sprite->animBeginning = TRUE;
            sprite->animEnded     = FALSE;
            sprite->data[2]     = 0;
            sprite->callback      = &sub_8118B30;
            m4aSongNumStart(SE_NAGERU);
        }
    }
}

void sub_8118CAC(struct Sprite *sprite)
{
    sub_8118724(sprite);
    switch (sprite->data[3])
    {
    case 90:
        if (sprite->data[0] != 1)
        {
            sprite->callback  = &sub_8118BD8;
            sprite->data[2] = 0;
        }
        break;
    case 270:
        if (sprite->data[0] != 0)
        {
            sprite->callback  = &sub_8118BD8;
            sprite->data[2] = 0;
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
    case 0:
        sub_8119224(sprite);
        sprite->callback = &sub_81189A8;
        break;
    case 1:
        sub_81193D4(sprite);
        sprite->callback = &sub_8118CAC;
        break;
    }
}

void sub_8118D2C(struct Sprite *sprite)
{
    sub_8118724(sprite);
    if (sprite->data[2]-- == 16)
        eRoulette->var98 *= -1.0f;
    if (sprite->data[2] == 0)
    {
        if (!sprite->data[0])
        {
            eRoulette->var7D   = 255;
            eRoulette->var03_7 = 0;
            StartSpriteAnim(sprite, sprite->animCmdIndex + 3);
            sub_81186B8(sprite);
            sprite->data[4] = 30;
            sub_811866C(sprite);
            sprite->data[6] = (sprite->data[6] / 30) * 30 + 15;
            sprite->callback  = &sub_8118834;
            m4aSongNumStartOrChange(SE_HASHI);
        }
        else
        {
            sprite->animPaused = TRUE;
            m4aSongNumStart(SE_KON);
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
    m4aSongNumStart(SE_KON);
    if (Random() & 1)
    {
        eRoulette->var8C = 0;
        eRoulette->var7F = (eRoulette->var7E + 1) % 12;
    }
    else
    {
        eRoulette->var8C = ({float f = gUnknown_083F8DF4[eRoulette->var04_0].var1C; f * 2;});
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
    sprite->data[2] = 0;
    sub_81186B8(sprite);
    if (!(gUnknown_083F8D90[eRoulette->var7E].var04 & eRoulette->var08))
    {
        eRoulette->var7D   = 255;
        eRoulette->var03_7 = 0;
        StartSpriteAnim(sprite, sprite->animCmdIndex + 3);
        sub_81186B8(sprite);
        sprite->data[4] = 30;
        sub_811866C(sprite);
        sprite->data[6] = (sprite->data[6] / 30) * 30 + 15;
        sprite->callback  = &sub_8118834;
        m4aSongNumStartOrChange(SE_HASHI);
    }
    else
    {
        u8 t;
        u32 z;
        m4aSongNumStart(SE_KON);
        if ((z = (Random() & 1)))
        {
            u32 o;
            eRoulette->var8C = 0.0f;
            o = (eRoulette->var7E + 1) % 12;
            t = o;
            eRoulette->var7F = o;
        }
        else
        {
            eRoulette->var8C = ({
                float f = gUnknown_083F8DF4[eRoulette->var04_0].var1C;
                f * 2;
            }); // couldn't replicate loads
            t = (eRoulette->var7E + 11) % 12;
            eRoulette->var7F = eRoulette->var7E;
        }
        if (gUnknown_083F8D90[t].var04 & eRoulette->var08)
        {
            sprite->data[0] = 1;
            sprite->data[2] = gUnknown_083F8DF4[eRoulette->var04_0].var02;
        }
        else
        {
            sprite->data[0] = gUnknown_083F8D90[t].var04 & eRoulette->var08;
            if (eRoulette->var04_0)
            {
                sprite->data[2] = gUnknown_083F8DF4[eRoulette->var04_0].var01;
            }
            else
            {
                sprite->data[2] = gUnknown_083F8DF4[eRoulette->var04_0].var02;
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
        sprite->data[1] = 5;
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
                / ((float)(s16)(p[eRoulette->var04_0].var04 + 1));
            sprite->data[1] = 4;
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
        sprite->animNum       = 2;
        sprite->animBeginning = TRUE;
        sprite->animEnded     = FALSE;
        sprite->data[1]     = 3;
        sprite->callback      = &sub_8118F8C;
    }
}

void sub_8119134(struct Sprite *sprite)
{
    sub_8118724(sprite);
    if (!(eRoulette->var94 > 60.0f))
    {
        m4aSongNumStartOrChange(SE_TAMAKORO_E);
        eRoulette->var98 = - (                20.0f / (float)(u16)eRoulette->var84);
        eRoulette->var90 =   ((1.0f - eRoulette->var8C) / (float)(u16)eRoulette->var84);
        sprite->animNum       = 1;
        sprite->animBeginning = TRUE;
        sprite->animEnded     = FALSE;
        sprite->data[1]     = 2;
        sprite->callback      = &sub_8119088;
    }
}

void sub_81191F4(struct Sprite *sprite)
{
    sprite->data[1] = 1;
    sprite->data[2] = 0;
    sub_8118724(sprite);
    sprite->invisible = FALSE;
    sprite->callback  = &sub_8119134;
}

void sub_8119224(struct Sprite *sprite)
{
    u16 t;
    u8 i;
    s16 s[2][2] = {
        {116, 44},
        {116, 112}
    };
    struct Roulette *p;
    t = sprite->data[7] - 2;
    p = eRoulette;
    p->var3C[55] = CreateSprite(&gSpriteTemplate_83FA50C, 36, -12, 50);
    p->var3C[56] = CreateSprite(&gSpriteTemplate_83FA5C0[0], s[sprite->data[0]][0], s[sprite->data[0]][1], 59);
    p->var3C[57] = CreateSprite(&gSpriteTemplate_83FA5C0[1], 36, 140, 51);
    gSprites[eRoulette->var3C[57]].oam.objMode = 1;
    for (i = 0; i < 3; i++)
    {
        gSprites[eRoulette->var3C[55 + i]].coordOffsetEnabled = FALSE;
        gSprites[eRoulette->var3C[55 + i]].invisible          = TRUE;
        gSprites[eRoulette->var3C[55 + i]].animPaused         = TRUE;
        gSprites[eRoulette->var3C[55 + i]].affineAnimPaused   = TRUE;
        gSprites[eRoulette->var3C[55 + i]].data[4]          = eRoulette->var3C[55];
        gSprites[eRoulette->var3C[55 + i]].data[5]          = eRoulette->var3C[56];
        gSprites[eRoulette->var3C[55 + i]].data[6]          = eRoulette->var3C[57];
        gSprites[eRoulette->var3C[55 + i]].data[2]          = t;
        gSprites[eRoulette->var3C[55 + i]].data[3]          = (sprite->data[7] * gUnknown_083F8DF4[eRoulette->var04_0].var01) +
                                                                (gUnknown_083F8DF4[eRoulette->var04_0].var02 + 0xffff);
    }
    gSprites[eRoulette->var3C[56]].coordOffsetEnabled = TRUE;
    eRoulette->var38 = sprite;
}

void sub_81193D4(struct Sprite *sprite)
{
    u8 i = 0;
    s16 t;
    s16 s[2][2] = {
        {256, 84},
        {-16, 84}
    };
    const struct StructgUnknown_083F8DF4 *p;
    t = sprite->data[7] - 2;
    eRoulette->var3C[55] = CreateSprite(&gSpriteTemplate_83FA524, s[sprite->data[0]][0], s[sprite->data[0]][1], 50);
    StartSpriteAnim(&gSprites[eRoulette->var3C[55]], sprite->data[0]);
    eRoulette->var3C[56] = CreateSprite(&gSpriteTemplate_83FA5F0, s[sprite->data[0]][0], s[sprite->data[0]][1], 51);
    gSprites[eRoulette->var3C[56]].affineAnimPaused = TRUE;
    gSprites[eRoulette->var3C[56]].animPaused       = TRUE;
    sprite->data[7] = (t * (p = &gUnknown_083F8DF4[0])[eRoulette->var04_0].var01) + (p[eRoulette->var04_0].var10 + 45);
    for (; i < 2; i++)
    {
        gSprites[eRoulette->var3C[55 + i]].data[4] = eRoulette->var3C[55];
        gSprites[eRoulette->var3C[55 + i]].data[5] = eRoulette->var3C[56];
        gSprites[eRoulette->var3C[55 + i]].data[6] = eRoulette->var3C[56];
        gSprites[eRoulette->var3C[55 + i]].data[2] = t;
        gSprites[eRoulette->var3C[55 + i]].data[3] = sprite->data[7] - 45;
    }
    eRoulette->var38 = sprite;
}

#ifdef NONMATCHING
void sub_811952C(struct Sprite *sprite)
{
    u8 i;
    u8 z;
    u16 o;
    u8 h = 0; // r10 (sp+12)
    u8 j = 5; // r9 (r9)
    u8 p = 0; // sp+12 (sp+16)
    u8 s[10] = {}; // sp+0 (sp+0)
    u16 t = Random(); // sp+16 (r10)

    eRoulette->var7D   = 1;
    eRoulette->var03_5 = TRUE;
    eRoulette->var03_6 = FALSE;
    eRoulette->var7E   = 255;
    eRoulette->var88   = sprite->data[3];
    eRoulette->var98   = 0.0f;
    eRoulette->var8C   = gUnknown_083F8DF4[eRoulette->var04_0].var1C;
    o = (eRoulette->var04_0 * 30 + 33) + (1 - eRoulette->var03_0) * 15;
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
            PlayCry1(SPECIES_TAILLOW, -63);
        }
        else
        {
            PlayCry1(SPECIES_TAILLOW, 63);
        }
    }
    else
    {
        PlayCry1(SPECIES_SHROOMISH, -63);
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
        z = (z + 1) % 12;
    }
    if ((eRoulette->var03_0 + 1) & eRoulette->var02)
    {
        if (p && (t & 255) < 192)
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
                    "\tsub sp, 20\n"
                    "\tmov r8, r0\n"
                    "\tmovs r0, 0\n"
                    "\tmov r10, r0\n"
                    "\tmovs r1, 5\n"
                    "\tmov r9, r1\n"
                    "\tmovs r2, 0\n"
                    "\tstr r2, [sp, 12]\n"
                    "\tmov r0, sp\n"
                    "\tmovs r1, 0\n"
                    "\tmovs r2, 10\n"
                    "\tbl memset\n"
                    "\tbl Random\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tstr r0, [sp, 16]\n"
                    "\tldr r7, _08119610 @ =gSharedMem + 0x19000\n"
                    "\tadds r0, r7, 0\n"
                    "\tadds r0, 125\n"
                    "\tmovs r6, 1\n"
                    "\tstrb r6, [r0]\n"
                    "\tldrb r4, [r7, 3]\n"
                    "\tmovs r0, 32\n"
                    "\torrs r4, r0\n"
                    "\tmovs r0, 65\n"
                    "\tnegs r0, r0\n"
                    "\tands r4, r0\n"
                    "\tstrb r4, [r7, 3]\n"
                    "\tadds r1, r7, 0\n"
                    "\tadds r1, 126\n"
                    "\tmovs r0, 255\n"
                    "\tstrb r0, [r1]\n"
                    "\tadds r5, r7, 0\n"
                    "\tadds r5, 136\n"
                    "\tmov r3, r8\n"
                    "\tmovs r1, 52\n"
                    "\tldrsh r0, [r3, r1]\n"
                    "\tbl __floatsisf\n"
                    "\tstr r0, [r5]\n"
                    "\tadds r1, r7, 0\n"
                    "\tadds r1, 152\n"
                    "\tldr r0, _08119614 @ =0\n"
                    "\tstr r0, [r1]\n"
                    "\tadds r3, r7, 0\n"
                    "\tadds r3, 140\n"
                    "\tldr r2, _08119618 @ =gUnknown_083F8DF4\n"
                    "\tldrb r0, [r7, 4]\n"
                    "\tlsls r0, 30\n"
                    "\tlsrs r1, r0, 25\n"
                    "\tadds r2, 28\n"
                    "\tadds r1, r2\n"
                    "\tldr r1, [r1]\n"
                    "\tstr r1, [r3]\n"
                    "\tlsrs r0, 30\n"
                    "\tlsls r1, r0, 4\n"
                    "\tsubs r1, r0\n"
                    "\tlsls r1, 1\n"
                    "\tadds r1, 33\n"
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
                    "\tmovs r0, 52\n"
                    "\tldrsh r2, [r3, r0]\n"
                    "_081195C8:\n"
                    "\tcmp r1, r2\n"
                    "\tbge _081195D4\n"
                    "\tadds r0, r1, 0\n"
                    "\tadds r0, 90\n"
                    "\tcmp r2, r0\n"
                    "\tble _08119638\n"
                    "_081195D4:\n"
                    "\tcmp r5, 3\n"
                    "\tbeq _0811961C\n"
                    "\tadds r0, r1, 0\n"
                    "\tadds r0, 90\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r1, r0, 16\n"
                    "\tadds r0, r5, 1\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r5, r0, 24\n"
                    "\tcmp r5, 3\n"
                    "\tbls _081195C8\n"
                    "_081195EA:\n"
                    "\tldr r0, _08119610 @ =gSharedMem + 0x19000\n"
                    "\tldrb r1, [r0, 3]\n"
                    "\tmovs r0, 31\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _08119664\n"
                    "\tmov r1, r8\n"
                    "\tmovs r2, 46\n"
                    "\tldrsh r0, [r1, r2]\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _08119658\n"
                    "\tmovs r0, 152\n"
                    "\tlsls r0, 1\n"
                    "\tmovs r1, 63\n"
                    "\tnegs r1, r1\n"
                    "\tbl PlayCry1\n"
                    "\tb _08119670\n"
                    "\t.align 2, 0\n"
                    "_08119610: .4byte gSharedMem + 0x19000\n"
                    "_08119614: .4byte 0\n"
                    "_08119618: .4byte gUnknown_083F8DF4\n"
                    "_0811961C:\n"
                    "\tmovs r0, 1\n"
                    "\tmov r3, r8\n"
                    "\tstrh r0, [r3, 46]\n"
                    "\tldr r2, _08119634 @ =gSharedMem + 0x19000\n"
                    "\tldrb r1, [r2, 3]\n"
                    "\tsubs r0, 33\n"
                    "\tands r0, r1\n"
                    "\tmovs r1, 1\n"
                    "\torrs r0, r1\n"
                    "\tstrb r0, [r2, 3]\n"
                    "\tb _081195EA\n"
                    "\t.align 2, 0\n"
                    "_08119634: .4byte gSharedMem + 0x19000\n"
                    "_08119638:\n"
                    "\tlsrs r0, r5, 1\n"
                    "\tmov r1, r8\n"
                    "\tstrh r0, [r1, 46]\n"
                    "\tldr r3, _08119654 @ =gSharedMem + 0x19000\n"
                    "\tmovs r1, 1\n"
                    "\tands r1, r5\n"
                    "\tldrb r2, [r3, 3]\n"
                    "\tmovs r0, 32\n"
                    "\tnegs r0, r0\n"
                    "\tands r0, r2\n"
                    "\torrs r0, r1\n"
                    "\tstrb r0, [r3, 3]\n"
                    "\tb _081195EA\n"
                    "\t.align 2, 0\n"
                    "_08119654: .4byte gSharedMem + 0x19000\n"
                    "_08119658:\n"
                    "\tmovs r0, 152\n"
                    "\tlsls r0, 1\n"
                    "\tmovs r1, 63\n"
                    "\tbl PlayCry1\n"
                    "\tb _08119670\n"
                    "_08119664:\n"
                    "\tmovs r0, 153\n"
                    "\tlsls r0, 1\n"
                    "\tmovs r1, 63\n"
                    "\tnegs r1, r1\n"
                    "\tbl PlayCry1\n"
                    "_08119670:\n"
                    "\tmovs r5, 2\n"
                    "\tldr r4, _081196A0 @ =gSharedMem + 0x19000\n"
                    "\tadds r0, r4, 0\n"
                    "\tadds r0, 127\n"
                    "\tldrb r0, [r0]\n"
                    "\tadds r0, 2\n"
                    "\tmovs r1, 12\n"
                    "\tbl __modsi3\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r3, r0, 24\n"
                    "\tldrb r1, [r4, 3]\n"
                    "\tmovs r0, 31\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 1\n"
                    "\tbne _081196A4\n"
                    "\tldrb r1, [r4, 4]\n"
                    "\tmovs r0, 3\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 1\n"
                    "\tbne _081196A4\n"
                    "\tmov r0, r9\n"
                    "\tadds r0, 6\n"
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
                    "\tldr r7, _08119738 @ =gUnknown_083F8C00 + 12\n"
                    "_081196B6:\n"
                    "\tlsls r0, r3, 3\n"
                    "\tldr r1, _0811973C @ =gUnknown_083F8D90 + 4\n"
                    "\tadds r0, r1\n"
                    "\tldr r1, [r6, 8]\n"
                    "\tldr r2, [r0]\n"
                    "\tands r1, r2\n"
                    "\tcmp r1, 0\n"
                    "\tbne _081196F8\n"
                    "\tmov r0, r10\n"
                    "\tadds r1, r0, 1\n"
                    "\tlsls r1, 24\n"
                    "\tlsrs r1, 24\n"
                    "\tmov r10, r1\n"
                    "\tadd r0, sp\n"
                    "\tstrb r5, [r0]\n"
                    "\tldr r0, [sp, 12]\n"
                    "\tcmp r0, 0\n"
                    "\tbne _081196F8\n"
                    "\tldrb r0, [r6, 26]\n"
                    "\tlsls r0, 28\n"
                    "\tlsrs r0, 28\n"
                    "\tldr r1, _08119740 @ =gSharedMem + 0x1901b\n"
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
                    "\tstr r5, [sp, 12]\n"
                    "_081196F8:\n"
                    "\tadds r0, r3, 1\n"
                    "\tmovs r1, 12\n"
                    "\tbl __modsi3\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r3, r0, 24\n"
                    "\tadds r0, r5, 1\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r5, r0, 24\n"
                    "\tcmp r5, r9\n"
                    "\tbcc _081196B6\n"
                    "_0811970E:\n"
                    "\tldrb r0, [r4, 3]\n"
                    "\tlsls r0, 27\n"
                    "\tlsrs r0, 27\n"
                    "\tadds r0, 1\n"
                    "\tldrb r1, [r4, 2]\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _08119756\n"
                    "\tldr r2, [sp, 12]\n"
                    "\tcmp r2, 0\n"
                    "\tbeq _08119744\n"
                    "\tmovs r0, 255\n"
                    "\tldr r3, [sp, 16]\n"
                    "\tands r0, r3\n"
                    "\tcmp r0, 191\n"
                    "\tbhi _08119744\n"
                    "\tmov r0, r8\n"
                    "\tstrh r2, [r0, 60]\n"
                    "\tb _08119766\n"
                    "\t.align 2, 0\n"
                    "_08119734: .4byte gSharedMem + 0x19000\n"
                    "_08119738: .4byte gUnknown_083F8C00 + 12\n"
                    "_0811973C: .4byte gUnknown_083F8D90 + 4\n"
                    "_08119740: .4byte gSharedMem + 0x1901b\n"
                    "_08119744:\n"
                    "\tldr r0, [sp, 16]\n"
                    "\tmov r1, r10\n"
                    "\tbl __modsi3\n"
                    "\tadd r0, sp\n"
                    "\tldrb r0, [r0]\n"
                    "\tmov r1, r8\n"
                    "\tstrh r0, [r1, 60]\n"
                    "\tb _08119766\n"
                    "_08119756:\n"
                    "\tldr r0, [sp, 16]\n"
                    "\tmov r1, r10\n"
                    "\tbl __modsi3\n"
                    "\tadd r0, sp\n"
                    "\tldrb r0, [r0]\n"
                    "\tmov r2, r8\n"
                    "\tstrh r0, [r2, 60]\n"
                    "_08119766:\n"
                    "\tldr r3, _0811977C @ =sub_8118CEC\n"
                    "\tmov r0, r8\n"
                    "\tstr r3, [r0, 28]\n"
                    "\tadd sp, 20\n"
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

const u16 gUnknown_083FA61E[] = {
    BLDALPHA_BLEND( 7, 9),
    BLDALPHA_BLEND( 8, 8),
    BLDALPHA_BLEND( 9, 7),
    BLDALPHA_BLEND(10, 6),
    BLDALPHA_BLEND(11, 5),
    BLDALPHA_BLEND(12, 4),
    BLDALPHA_BLEND(13, 3),
    BLDALPHA_BLEND(14, 2),
    BLDALPHA_BLEND(15, 1),
    BLDALPHA_BLEND(16, 0),
};

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
    s16 t[3][4] = {
        {-1, 0, 1, 0},
        {-2, 0, 2, 0},
        {-3, 0, 3, 0}
    };
    s32 p, z;

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
        gSpriteCoordOffsetY = 0;
        gSprites[eRoulette->var3C[55]].animPaused = FALSE;
        DestroySprite(sprite);
    }
}

void sub_8119898(struct Sprite *sprite)
{
    float t;
    sprite->data[1]++;
    t = sprite->data[1];
    sprite->pos2.y = t * 0.039f * t;
    eRoulette->var34 = gUnknown_083FA61E[(eRoulette->var01 - 1) / 2];
    if (eRoulette->var01 < 19)
        eRoulette->var01++;
    if (sprite->data[1] > 60)
    {
        sprite->data[1] = 0;
        sprite->callback = &sub_8119780;
        gSprites[sprite->data[6]].callback  = &sub_8119780;
        gSprites[sprite->data[6]].data[1] = -2;
        gSprites[sprite->data[5]].invisible = FALSE;
        gSprites[sprite->data[5]].callback  = &sub_81197D8;
        m4aSongNumStart(SE_W070);
    }
}

void sub_8119964(struct Sprite *sprite)
{
    if (sprite->data[7] == 0)
    {
        register u32 t asm("r2");
        u32 z ;
        if (eRoulette->var38->data[0] == 0)
        {
            t = eRoulette->var38->data[3];
            z = gUnknown_083F8DF4[eRoulette->var04_0].var08;
        }
        else
        {
            t = eRoulette->var38->data[3];
            z = gUnknown_083F8DF4[eRoulette->var04_0].var08;
            z += 180;
        }
        if (t == z)
        {
            sprite->invisible = FALSE;
            sprite->data[7]++;
            m4aSongNumStart(SE_RU_HYUU);
            eRoulette->var01 = 1;
            eRoulette->var34 = gUnknown_083FA61E[0];
        }
    }
    else
    {
        u32 t, z;
        eRoulette->var34 = gUnknown_083FA61E[(eRoulette->var01 - 1) / 2];
        if (eRoulette->var01 < 19)
            eRoulette->var01++;
        if (eRoulette->var38->data[0] == 0)
        {
            t = eRoulette->var38->data[3];
            z = gUnknown_083F8DF4[eRoulette->var04_0].var0A;
        }
        else
        {
            t = eRoulette->var38->data[3];
            z = gUnknown_083F8DF4[eRoulette->var04_0].var0A ;
            z += 180;
        }
        if (t == z)
        {
            gSprites[sprite->data[4]].callback  = &sub_8119898;
            gSprites[sprite->data[4]].invisible = FALSE;
            sprite->callback  = &SpriteCallbackDummy;
            sprite->data[7] = 0;
        }
    }
}

void sub_8119A90(struct Sprite *sprite)
{
    sprite->invisible ^= 1;
}

void sub_8119AAC(struct Sprite *sprite)
{
    if (sprite->pos1.y > -16)
    {
        sprite->pos1.y--;
    }
    else
    {
        sprite->callback   = &SpriteCallbackDummy;
        sprite->invisible  = TRUE;
        sprite->animPaused = TRUE;
        m4aSongNumStop(SE_BASABASA);
        DestroySprite(sprite);
        FreeOamMatrix(gSprites[eRoulette->var3C[56]].oam.matrixNum);
        DestroySprite(&gSprites[eRoulette->var3C[56]]);
    }
}

void sub_8119B24(struct Sprite *sprite)
{
    if (sprite->data[1] >= 0)
    {
        sprite->data[1]--;
        sprite->pos1.y--;
        if (sprite->data[1] == 0 && sprite->animCmdIndex == 1)
            sprite->pos2.y++;
    }
    else
    {
        if (sprite->data[3] >= 0)
        {
            sprite->data[3]--;
            if (sprite->animDelayCounter == 0)
            {
                if (sprite->animCmdIndex == 1)
                    sprite->pos2.y++;
                else
                    sprite->pos2.y--;
            }
        }
        else
        {
            m4aSongNumStart(SE_RU_HYUU);
            StartSpriteAnim(sprite, eRoulette->var38->data[0] + 4);
            sprite->callback = &sub_8119AAC;
            gSprites[sprite->data[6]].affineAnimPaused = FALSE;
        }
    }
}

void sub_8119BCC(struct Sprite *sprite)
{
    s8 t[2] = {-1, 1}; //sign
    s8 z[8][2] = {
        {2,  0},
        {2,  0},
        {2, -1},
        {2, -1},
        {2, -1},
        {2, -1},
        {2, -2},
        {2, -2}
    };
    if (sprite->data[1]-- > 7)
    {
        sprite->pos1.x += t[eRoulette->var38->data[0]] * 2;
        if (IsSEPlaying())
        {
            s8 u =  -((116 - sprite->pos1.x) / 2);
            m4aMPlayPanpotControl(&gMPlay_SE1, 0xffff, u);
            m4aMPlayPanpotControl(&gMPlay_SE2, 0xffff, u);
        }
    }
    else
    {
        if (sprite->data[1] >= 0)
        {
            sprite->pos1.x += t[eRoulette->var38->data[0]] * z[7 - sprite->data[1]][0];
            sprite->pos1.y += z[7 - sprite->data[1]][1];
        }
        else
        {
            m4aSongNumStartOrChange(SE_BASABASA);
            if (eRoulette->var38->data[0] == 0)
                PlayCry1(SPECIES_TAILLOW, 63);
            else
                PlayCry1(SPECIES_TAILLOW, -63);
            StartSpriteAnim(sprite, eRoulette->var38->data[0] + 2);
            sprite->data[1] = 45;
            sprite->callback = &sub_8119B24;
        }
    }
}

void sub_8119D08(struct Sprite *sprite)
{
    s8 t[2] = {-1, 1}; //sign
    if (sprite->data[1]-- >= 0)
    {
        sprite->pos1.x += t[eRoulette->var38->data[0]] * 2;
        gSprites[sprite->data[6]].invisible ^= 1;
    }
    else
    {
        sprite->callback = &sub_8119A90;
    }
}

void sub_8119D80(struct Sprite *sprite)
{
    if (eRoulette->var38->data[0] == 0)
    {
        if (eRoulette->var38->data[3] == gUnknown_083F8DF4[eRoulette->var04_0].var12 + 90)
        {
            gSprites[sprite->data[6]].data[1] = 52;
            gSprites[sprite->data[4]].data[1] = 52;
        }
        else
        {
            return;
        }
    }
    else
    {
        if (eRoulette->var38->data[3] == gUnknown_083F8DF4[eRoulette->var04_0].var14 + 270)
        {
            gSprites[sprite->data[6]].data[1] = 46;
            gSprites[sprite->data[4]].data[1] = 46;
        }
        else
        {
            return;
        }
    }
    gSprites[sprite->data[6]].callback = &sub_8119D08;
    gSprites[sprite->data[4]].callback = &sub_8119BCC;
    m4aSongNumStart(SE_RU_HYUU);
}
