#include "global.h"
#include "contest.h"
#include "battle.h"
#include "battle_anim.h"
#include "blend_palette.h"
#include "constants/event_objects.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "contest_ai.h"
#include "contest_effect.h"
#include "data2.h"
#include "decompress.h"
#include "ewram.h"
#include "graphics.h"
#include "link.h"
#include "m4a.h"
#include "menu.h"
#include "palette.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "util.h"

#include "contest_internal.h"

extern void Task_LinkContest_CommunicateAppealsState(u8 taskId);
extern void Task_UpdateContestantBoxOrder(u8 taskId);

extern struct MusicPlayerInfo gMPlayInfo_SE1;
extern u8 gBattleMonForms[];
extern u8 gDisplayedStringBattle[];
extern u8 gBattlerTarget;
extern u8 gBattlerSpriteIds[];
extern struct Window gWindowTemplate_Contest_MoveDescription;
extern struct SpriteTemplate gCreatingSpriteTemplate;
extern void (*const gContestEffectFuncs[])(void);

#include "data/contest_opponents.h"

const u8 gUnknown_083CA308[][2] = {
    {19,  0},
    {19,  5},
    {19, 10},
    {19, 15},
};

const u8 gUnknown_083CA310[][2] = {
    {25,  0},
    {25,  5},
    {25, 10},
    {25, 15},
};

const u8 gUnknown_083CA318[][2] = {
    {  20,   2 },
    {  20,   7 },
    {  20,  12 },
    {  20,  17 },
    {  24,   2 },
    {  24,   7 },
    {  24,  12 },
    {  24,  17 },
    { 220,  24 },
    { 220,  64 },
    { 220, 104 },
    { 220, 144 },
};

const u8 gUnknown_083CA330[][2] = {
    { 224,  24 },
    { 224,  64 },
    { 224, 104 },
    { 224, 144 },
};

const u8 sSliderHeartYPositions[] = { 36, 76, 116, 156 };
const u8 gUnknown_083CA33C[] = { 36, 76, 116, 156 };

const u8 gUnknown_083CA340[][4] = {
    { 0, 31, 9, 39 },
    { 0, 33, 9, 39 },
    { 0, 35, 9, 39 },
    { 0, 37, 9, 39 },
};

const struct SpriteSheet sSpriteSheet_SliderHeart = {
    .data = gTiles_8D1975C,
    .size = 0x20,
    .tag = 20004
};

const struct OamData gOamData_83CA358 = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(8x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(8x8),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0
};

// Idle
const union AffineAnimCmd gSpriteAffineAnim_83CA360[] = {
    AFFINEANIMCMD_FRAME(Q_8_8(1.0), Q_8_8(1.0), 0, 0),
    AFFINEANIMCMD_END
};

// Shrink
const union AffineAnimCmd gSpriteAffineAnim_83CA370[] = {
    AFFINEANIMCMD_FRAME(256, 256,   0,  0),
    AFFINEANIMCMD_FRAME(-10, -10, -20, 20),
    AFFINEANIMCMD_END
};

// Grow
const union AffineAnimCmd gSpriteAffineAnim_83CA388[] = {
    AFFINEANIMCMD_FRAME(56, 56,  0,  0),
    AFFINEANIMCMD_FRAME(10, 10, 20, 20),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83CA3A0[] = {
    gSpriteAffineAnim_83CA360,
    gSpriteAffineAnim_83CA370,
    gSpriteAffineAnim_83CA388,
};

const struct SpriteTemplate sSpriteTemplate_SliderHeart = {
    .tileTag = 20004,
    .paletteTag = 44000,
    .oam = &gOamData_83CA358,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83CA3A0,
    .callback = SpriteCallbackDummy
};

// One graphic for each contestant.
// Yes, it's loaded four times.
const struct CompressedSpriteSheet gUnknown_083CA3C4[] = {
    { .data = gContestNextTurnGfx, .size = 0x100, .tag = 20006 },
    { .data = gContestNextTurnGfx, .size = 0x100, .tag = 20007 },
    { .data = gContestNextTurnGfx, .size = 0x100, .tag = 20008 },
    { .data = gContestNextTurnGfx, .size = 0x100, .tag = 20009 },
};

const struct SpritePalette gUnknown_083CA3E4 = {
    .data = gContestPal, .tag = 20006
};

const struct OamData gOamData_83CA3EC = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x8),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(32x8),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0
};

const struct SpriteTemplate gSpriteTemplate_83CA3F4[] = {
    { .tileTag = 20006, .paletteTag = 20006, .oam = &gOamData_83CA3EC, .anims = gDummySpriteAnimTable, .images = NULL, .affineAnims = gDummySpriteAffineAnimTable, .callback = SpriteCallbackDummy },
    { .tileTag = 20007, .paletteTag = 20006, .oam = &gOamData_83CA3EC, .anims = gDummySpriteAnimTable, .images = NULL, .affineAnims = gDummySpriteAffineAnimTable, .callback = SpriteCallbackDummy },
    { .tileTag = 20008, .paletteTag = 20006, .oam = &gOamData_83CA3EC, .anims = gDummySpriteAnimTable, .images = NULL, .affineAnims = gDummySpriteAffineAnimTable, .callback = SpriteCallbackDummy },
    { .tileTag = 20009, .paletteTag = 20006, .oam = &gOamData_83CA3EC, .anims = gDummySpriteAnimTable, .images = NULL, .affineAnims = gDummySpriteAffineAnimTable, .callback = SpriteCallbackDummy },
};

const struct Subsprite gSubspriteTable_83CA454[] = {
    { .x = -26, .y = -4, .shape = ST_OAM_H_RECTANGLE, .size = 1, .tileOffset = 0, .priority = 0 },
    { .x =   6, .y = -4, .shape = ST_OAM_H_RECTANGLE, .size = 1, .tileOffset = 4, .priority = 0 },
};

const struct SubspriteTable gSubspriteTables_83CA464[] = {
    { 2, gSubspriteTable_83CA454 },
};

const struct CompressedSpriteSheet gUnknown_083CA46C = {
    .data = gContestApplauseGfx,
    .size = 0x400,
    .tag = 44002
};

const struct SpritePalette gUnknown_083CA474 = {
    .data = gContestPal,
    .tag = 44002
};

const struct OamData gOamData_83CA47C = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x32),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x32),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0
};

const struct SpriteTemplate gSpriteTemplate_83CA484 = {
    .tileTag = 44002,
    .paletteTag = 44002,
    .oam = &gOamData_83CA47C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy
};

const struct OamData gOamData_83CA49C = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0,
    .priority = 3,
    .paletteNum = 2
};

const struct SpriteTemplate sSpriteTemplate_Judge = {
    .tileTag = 20005,
    .paletteTag = 20005,
    .oam = &gOamData_83CA49C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

const struct CompressedSpriteSheet sSpriteSheet_Judge = {
    .data = gContestJudgeGfx,
    .size = 0x800,
    .tag = 20005
};

const struct CompressedSpriteSheet sSpriteSheet_JudgeSymbols = {
    .data = gContestJudgeSymbolsGfx,
    .size = 0x380,
    .tag = 44000
};

const struct CompressedSpritePalette sSpritePalette_JudgeSymbols = {
    .data = gContest3Pal,
    .tag = 44000
};

const struct SpriteTemplate sSpriteTemplate_JudgeSpeechBubble = {
    .tileTag = 44000,
    .paletteTag = 44000,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

#if defined(ENGLISH)
#include "data/text/contest_en.h"
#elif defined(GERMAN)
#include "data/text/contest_de.h"
#endif //ENGLISH

UNUSED
const u8 ALIGNED(2) _unk_83CC3BE[] = __("ピラ");
const u8 gUnknownText_UnknownFormatting2[] = _("{COLOR GREEN}{SHADOW RED}");
const u8 gUnknownText_UnknownFormatting3[] = _("{COLOR LIGHT_GREY}");

const struct CompressedSpriteSheet gUnknown_083CC3AC = {
    .data = gContestNumbers_UnusedGfx,
    .size = 0x200,
    .tag = 20000
};

const struct CompressedSpritePalette gUnknown_083CC3B4[] = {
    { .data = gContestNumbers_UnusedPal, .tag = 20000 },
    { .data = gContestNumbers_UnusedPal, .tag = 20001 },
    { .data = gContestNumbers_UnusedPal, .tag = 20002 },
    { .data = gContestNumbers_UnusedPal, .tag = 20003 },
};

const union AnimCmd gSpriteAnim_83CC3D4[] = {
    ANIMCMD_FRAME( 0, 1),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83CC3DC[] = {
    ANIMCMD_FRAME( 4, 1),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83CC3E4[] = {
    ANIMCMD_FRAME( 8, 1),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83CC3EC[] = {
    ANIMCMD_FRAME(12, 1),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83CC3F4[] = {
    gSpriteAnim_83CC3D4,
    gSpriteAnim_83CC3DC,
    gSpriteAnim_83CC3E4,
    gSpriteAnim_83CC3EC,
};

const union AffineAnimCmd gSpriteAffineAnim_83CC404[] = {
    AFFINEANIMCMD_FRAME(0, 0, 0, 1),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gSpriteAffineAnim_83CC414[] = {
    AFFINEANIMCMD_FRAME(-15, -15, 0, 15),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gSpriteAffineAnim_83CC424[] = {
    AFFINEANIMCMD_FRAME(31, 31, 0, 0),
    AFFINEANIMCMD_FRAME(15, 15, 0, 15),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83CC43C[] = {
    gSpriteAffineAnim_83CC404,
    gSpriteAffineAnim_83CC414,
    gSpriteAffineAnim_83CC424,
    NULL,
};

const struct OamData gOamData_83CC44C = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(16x16),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(16x16),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0
};

const struct SpriteTemplate gSpriteTemplate_83CC454[] = {
    {
        .tileTag = 20000,
        .paletteTag = 20000,
        .oam = &gOamData_83CC44C,
        .anims = gSpriteAnimTable_83CC3F4,
        .images = NULL,
        .affineAnims = gSpriteAffineAnimTable_83CC43C,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = 20000,
        .paletteTag = 20001,
        .oam = &gOamData_83CC44C,
        .anims = gSpriteAnimTable_83CC3F4,
        .images = NULL,
        .affineAnims = gSpriteAffineAnimTable_83CC43C,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = 20000,
        .paletteTag = 20002,
        .oam = &gOamData_83CC44C,
        .anims = gSpriteAnimTable_83CC3F4,
        .images = NULL,
        .affineAnims = gSpriteAffineAnimTable_83CC43C,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = 20000,
        .paletteTag = 20003,
        .oam = &gOamData_83CC44C,
        .anims = gSpriteAnimTable_83CC3F4,
        .images = NULL,
        .affineAnims = gSpriteAffineAnimTable_83CC43C,
        .callback = SpriteCallbackDummy,
    },
};

const struct CompressedSpriteSheet gUnknown_083CC4B4[] = {
    { .data = gBlankGfxCompressed, .size = 0x1000, .tag = 33000 },
    { .data = gBlankGfxCompressed, .size = 0x1000, .tag = 33001 },
    { .data = gBlankGfxCompressed, .size = 0x1000, .tag = 33002 },
    { .data = gBlankGfxCompressed, .size = 0x1000, .tag = 33003 },
};

const struct SpritePalette gUnknown_083CC4D4[] = {
    { .data = eContestTempSave.cachedWindowPalettes[5], .tag = 33000 },
    { .data = eContestTempSave.cachedWindowPalettes[6], .tag = 33001 },
    { .data = eContestTempSave.cachedWindowPalettes[7], .tag = 33002 },
    { .data = eContestTempSave.cachedWindowPalettes[8], .tag = 33003 },
};

const struct OamData gOamData_83CC4F4 = {
    .y = 0,
    .affineMode = ST_OAM_AFFINE_DOUBLE,
    .objMode = ST_OAM_OBJ_BLEND,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(64x64),
    .x = 0,
    .matrixNum = 0,
    .size = SPRITE_SIZE(64x64),
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0
};

const union AffineAnimCmd gSpriteAffineAnim_83CC4FC[] = {
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gSpriteAffineAnim_83CC50C[] = {
    AFFINEANIMCMD_FRAME( 3,  3, 0, 15),
    AFFINEANIMCMD_FRAME(-3, -3, 0, 15),
    AFFINEANIMCMD_FRAME( 3,  3, 0, 15),
    AFFINEANIMCMD_FRAME(-3, -3, 0, 15),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83CC534[] = {
    gSpriteAffineAnim_83CC4FC,
    gSpriteAffineAnim_83CC50C,
};

const struct SpriteTemplate gSpriteTemplate_83CC53C[] = {
    {
        .tileTag = 33000,
        .paletteTag = 33000,
        .oam = &gOamData_83CC4F4,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gSpriteAffineAnimTable_83CC534,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = 33001,
        .paletteTag = 33001,
        .oam = &gOamData_83CC4F4,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gSpriteAffineAnimTable_83CC534,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = 33002,
        .paletteTag = 33002,
        .oam = &gOamData_83CC4F4,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gSpriteAffineAnimTable_83CC534,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = 33003,
        .paletteTag = 33003,
        .oam = &gOamData_83CC4F4,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gSpriteAffineAnimTable_83CC534,
        .callback = SpriteCallbackDummy,
    },
};

const u8 gUnknown_083CC59C[] = _("{HIGHLIGHT TRANSPARENT}{COLOR}");
const u8 gText_Slash[] = _("/");

const u16 gUnknown_083CC5A4[] = {
    RGB(19, 3, 0),
    RGB(6, 15, 6),
    RGB(19, 18, 0),
    RGB(4, 6, 19),
    RGB(31, 0, 0),
    RGB(0, 31, 0),
    RGB(31, 31, 0),
    RGB(0, 0, 31),
};

const u8 gContestExcitementTable[][5] =
{
    [CONTEST_CATEGORY_COOL] = {
        [CONTEST_CATEGORY_COOL]   = +1,
        [CONTEST_CATEGORY_BEAUTY] =  0,
        [CONTEST_CATEGORY_CUTE]   = -1,
        [CONTEST_CATEGORY_SMART]  = -1,
        [CONTEST_CATEGORY_TOUGH]  =  0
    },
    [CONTEST_CATEGORY_BEAUTY] = {
        [CONTEST_CATEGORY_COOL]   =  0,
        [CONTEST_CATEGORY_BEAUTY] = +1,
        [CONTEST_CATEGORY_CUTE]   =  0,
        [CONTEST_CATEGORY_SMART]  = -1,
        [CONTEST_CATEGORY_TOUGH]  = -1
    },
    [CONTEST_CATEGORY_CUTE] = {
        [CONTEST_CATEGORY_COOL]   = -1,
        [CONTEST_CATEGORY_BEAUTY] =  0,
        [CONTEST_CATEGORY_CUTE]   = +1,
        [CONTEST_CATEGORY_SMART]  =  0,
        [CONTEST_CATEGORY_TOUGH]  = -1
    },
    [CONTEST_CATEGORY_SMART] = {
        [CONTEST_CATEGORY_COOL]   = -1,
        [CONTEST_CATEGORY_BEAUTY] = -1,
        [CONTEST_CATEGORY_CUTE]   =  0,
        [CONTEST_CATEGORY_SMART]  = +1,
        [CONTEST_CATEGORY_TOUGH]  =  0
    },
    [CONTEST_CATEGORY_TOUGH] = {
        [CONTEST_CATEGORY_COOL]   =  0,
        [CONTEST_CATEGORY_BEAUTY] = -1,
        [CONTEST_CATEGORY_CUTE]   = -1,
        [CONTEST_CATEGORY_SMART]  =  0,
        [CONTEST_CATEGORY_TOUGH]  = +1
    }
};

#if defined(ENGLISH)
#define CONTEST_WINNER_1_NICKNAME    "TAILTA"
#define CONTEST_WINNER_1_OTNAME      "WYATT"
#define CONTEST_WINNER_2_NICKNAME    "BRELO"
#define CONTEST_WINNER_2_OTNAME      "LIANA"
#define CONTEST_WINNER_3_NICKNAME    "PELEP"
#define CONTEST_WINNER_3_OTNAME      "TIERA"
#define CONTEST_WINNER_4_NICKNAME    "PELEP"
#define CONTEST_WINNER_4_OTNAME      "TIERA"
#define CONTEST_WINNER_5_NICKNAME    "PELEP"
#define CONTEST_WINNER_5_OTNAME      "TIERA"
#define CONTEST_WINNER_6_NICKNAME    "KITSY"
#define CONTEST_WINNER_6_OTNAME      "OMAR"
#define CONTEST_WINNER_7_NICKNAME    "GULPS"
#define CONTEST_WINNER_7_OTNAME      "MACIE"
#define CONTEST_WINNER_8_NICKNAME    "LOUDED"
#define CONTEST_WINNER_8_OTNAME      "BRYANT"
#elif defined(GERMAN)
#define CONTEST_WINNER_1_NICKNAME    "SCHWALBI"
#define CONTEST_WINNER_1_OTNAME      "ROSEL"
#define CONTEST_WINNER_2_NICKNAME    "TUFUNG"
#define CONTEST_WINNER_2_OTNAME      "WITOLD"
#define CONTEST_WINNER_3_NICKNAME    "LIPPER"
#define CONTEST_WINNER_3_OTNAME      "RUFUS"
#define CONTEST_WINNER_4_NICKNAME    "LIPPER"
#define CONTEST_WINNER_4_OTNAME      "ELLEN"
#define CONTEST_WINNER_5_NICKNAME    "LIPPER"
#define CONTEST_WINNER_5_OTNAME      "AVIA"
#define CONTEST_WINNER_6_NICKNAME    "CONEC"
#define CONTEST_WINNER_6_OTNAME      "HAUBERT"
#define CONTEST_WINNER_7_NICKNAME    "SCHLUCKI"
#define CONTEST_WINNER_7_OTNAME      "HEILWIG"
#define CONTEST_WINNER_8_NICKNAME    "KEELO"
#define CONTEST_WINNER_8_OTNAME      "ISEGRIM"
#endif

const struct ContestWinner gDefaultContestWinners[] = {
    {
        .personality = 0,
        .otId = 0xFFFF,
        .species = SPECIES_TAILLOW,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .nickname = _(CONTEST_WINNER_1_NICKNAME),
        .trainerName = _(CONTEST_WINNER_1_OTNAME),
    },
    {
        .personality = 0,
        .otId = 0xFFFF,
        .species = SPECIES_BRELOOM,
        .contestCategory = CONTEST_CATEGORY_BEAUTY,
        .nickname = _(CONTEST_WINNER_2_NICKNAME),
        .trainerName = _(CONTEST_WINNER_2_OTNAME),
    },
    {
        .personality = 0,
        .otId = 0xFFFF,
        .species = SPECIES_PELIPPER,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .nickname = _(CONTEST_WINNER_3_NICKNAME),
        .trainerName = _(CONTEST_WINNER_3_OTNAME),
    },
    {
        .personality = 0,
        .otId = 0xFFFF,
        .species = SPECIES_PELIPPER,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .nickname = _(CONTEST_WINNER_4_NICKNAME),
        .trainerName = _(CONTEST_WINNER_4_OTNAME),
    },
    {
        .personality = 0,
        .otId = 0xFFFF,
        .species = SPECIES_PELIPPER,
        .contestCategory = CONTEST_CATEGORY_COOL,
        .nickname = _(CONTEST_WINNER_5_NICKNAME),
        .trainerName = _(CONTEST_WINNER_5_OTNAME),
    },
    {
        .personality = 0,
        .otId = 0xFFFF,
        .species = SPECIES_DELCATTY,
        .contestCategory = CONTEST_CATEGORY_SMART,
        .nickname = _(CONTEST_WINNER_6_NICKNAME),
        .trainerName = _(CONTEST_WINNER_6_OTNAME),
    },
    {
        .personality = 0,
        .otId = 0xFFFF,
        .species = SPECIES_GULPIN,
        .contestCategory = CONTEST_CATEGORY_CUTE,
        .nickname = _(CONTEST_WINNER_7_NICKNAME),
        .trainerName = _(CONTEST_WINNER_7_OTNAME),
    },
    {
        .personality = 0,
        .otId = 0xFFFF,
        .species = SPECIES_LOUDRED,
        .contestCategory = CONTEST_CATEGORY_TOUGH,
        .nickname = _(CONTEST_WINNER_8_NICKNAME),
        .trainerName = _(CONTEST_WINNER_8_OTNAME),
    },
};

void TryPutPlayerLast(void)
{
    if (!(gIsLinkContest & 1))
        gContestPlayerMonIndex = 3;
}

bool8 IsPlayerLinkLeader(void)
{
    if (gContestPlayerMonIndex == gContestLinkLeaderIndex)
        return TRUE;
    else
        return FALSE;
}

void Contest_CreatePlayerMon(u8 partyIndex)
{
    u8 name[20];
    u16 heldItem;
    s16 cool;
    s16 beauty;
    s16 cute;
    s16 smart;
    s16 tough;

    StringCopy(name, gSaveBlock2.playerName);
    Text_StripExtCtrlCodes(name);
    if (gIsLinkContest & 1)
    {
        u8 temp = name[5];

        name[5] = EOS;
        name[7] = temp;
    }
    memcpy(gContestMons[gContestPlayerMonIndex].trainerName, name, 8);
    if (gSaveBlock2.playerGender == MALE)
        gContestMons[gContestPlayerMonIndex].trainerGfxId = OBJ_EVENT_GFX_LINK_BRENDAN;
    else
        gContestMons[gContestPlayerMonIndex].trainerGfxId = OBJ_EVENT_GFX_LINK_MAY;
    gContestMons[gContestPlayerMonIndex].flags = 0;
    gContestMons[gContestPlayerMonIndex].unk2C[0] = 0;
    gContestMons[gContestPlayerMonIndex].species = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SPECIES);
    GetMonData(&gPlayerParty[partyIndex], MON_DATA_NICKNAME, name);
    StringGetEnd10(name);
    if (gIsLinkContest & 1)
    {
        Text_StripExtCtrlCodes(name);
        if (GetMonData(&gPlayerParty[partyIndex], MON_DATA_LANGUAGE) == LANGUAGE_JAPANESE)
        {
            name[5] = EOS;
            name[10] = EXT_CTRL_CODE_BEGIN;
        }
        else
        {
            u8 temp = name[5];

            name[5] = EOS;
            name[10] = temp;
        }
    }
    memcpy(gContestMons[gContestPlayerMonIndex].nickname, name, 11);
    gContestMons[gContestPlayerMonIndex].cool = GetMonData(&gPlayerParty[partyIndex], MON_DATA_COOL);
    gContestMons[gContestPlayerMonIndex].beauty = GetMonData(&gPlayerParty[partyIndex], MON_DATA_BEAUTY);
    gContestMons[gContestPlayerMonIndex].cute = GetMonData(&gPlayerParty[partyIndex], MON_DATA_CUTE);
    gContestMons[gContestPlayerMonIndex].smart = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SMART);
    gContestMons[gContestPlayerMonIndex].tough = GetMonData(&gPlayerParty[partyIndex], MON_DATA_TOUGH);
    gContestMons[gContestPlayerMonIndex].sheen = GetMonData(&gPlayerParty[partyIndex], MON_DATA_SHEEN);
    gContestMons[gContestPlayerMonIndex].moves[0] = GetMonData(&gPlayerParty[partyIndex], MON_DATA_MOVE1);
    gContestMons[gContestPlayerMonIndex].moves[1] = GetMonData(&gPlayerParty[partyIndex], MON_DATA_MOVE2);
    gContestMons[gContestPlayerMonIndex].moves[2] = GetMonData(&gPlayerParty[partyIndex], MON_DATA_MOVE3);
    gContestMons[gContestPlayerMonIndex].moves[3] = GetMonData(&gPlayerParty[partyIndex], MON_DATA_MOVE4);
    gContestMons[gContestPlayerMonIndex].personality = GetMonData(&gPlayerParty[partyIndex], MON_DATA_PERSONALITY);
    gContestMons[gContestPlayerMonIndex].otId = GetMonData(&gPlayerParty[partyIndex], MON_DATA_OT_ID);

    heldItem = GetMonData(&gPlayerParty[partyIndex], MON_DATA_HELD_ITEM);
    cool   = gContestMons[gContestPlayerMonIndex].cool;
    beauty = gContestMons[gContestPlayerMonIndex].beauty;
    cute   = gContestMons[gContestPlayerMonIndex].cute;
    smart  = gContestMons[gContestPlayerMonIndex].smart;
    tough  = gContestMons[gContestPlayerMonIndex].tough;
    if      (heldItem == ITEM_RED_SCARF)
        cool += 20;
    else if (heldItem == ITEM_BLUE_SCARF)
        beauty += 20;
    else if (heldItem == ITEM_PINK_SCARF)
        cute += 20;
    else if (heldItem == ITEM_GREEN_SCARF)
        smart += 20;
    else if (heldItem == ITEM_YELLOW_SCARF)
        tough += 20;
    if (cool > 255)
        cool = 255;
    if (beauty > 255)
        beauty = 255;
    if (cute > 255)
        cute = 255;
    if (smart > 255)
        smart = 255;
    if (tough > 255)
        tough = 255;
    gContestMons[gContestPlayerMonIndex].cool = cool;
    gContestMons[gContestPlayerMonIndex].beauty = beauty;
    gContestMons[gContestPlayerMonIndex].cute = cute;
    gContestMons[gContestPlayerMonIndex].smart = smart;
    gContestMons[gContestPlayerMonIndex].tough = tough;
}

void Contest_InitAllPokemon(u8 contestType, u8 rank)
{
    s32 i;
    u8 opponentsCount = 0;
    u8 opponents[ARRAY_COUNT(gContestOpponents) + 1];

    TryPutPlayerLast();

    // Find all suitable opponents
    for (i = 0; i < (s32)ARRAY_COUNT(gContestOpponents); i++)
    {
        if (rank == gContestOpponents[i].whichRank)
        {
            if      (contestType == 0 && gContestOpponents[i].aiPool_Cool)
                opponents[opponentsCount++] = i;
            else if (contestType == 1 && gContestOpponents[i].aiPool_Beauty)
                opponents[opponentsCount++] = i;
            else if (contestType == 2 && gContestOpponents[i].aiPool_Cute)
                opponents[opponentsCount++] = i;
            else if (contestType == 3 && gContestOpponents[i].aiPool_Smart)
                opponents[opponentsCount++] = i;
            else if (contestType == 4 && gContestOpponents[i].aiPool_Tough)
                opponents[opponentsCount++] = i;
        }
    }
    opponents[opponentsCount] = 0xFF;

    // Choose three random opponents from the list
    for (i = 0; i < 3; i++)
    {
        u16 rnd = Random() % opponentsCount;
        s32 j;

        gContestMons[i] = gContestOpponents[opponents[rnd]];
        for (j = rnd; opponents[j] != 0xFF; j++)
            opponents[j] = opponents[j + 1];
        opponentsCount--;
    }

#ifndef NONMATCHING
    // Compiler, please put i in r5. Thanks.
    asm(""::"r"(i));
    asm(""::"r"(i));
    asm(""::"r"(i));
    asm(""::"r"(i));
    asm(""::"r"(i));
#endif

    Contest_CreatePlayerMon(gContestMonPartyIndex);
}

// GetContestAvailability?
u8 CanMonParticipateInContest(struct Pokemon *pkmn)
{
    u8 ribbon;
    u8 retVal;

    if (GetMonData(pkmn, MON_DATA_IS_EGG))
        return 3;
    if (GetMonData(pkmn, MON_DATA_HP) == 0)
        return 4;
    switch (gSpecialVar_ContestCategory)
    {
    case CONTEST_CATEGORY_COOL:
        ribbon = GetMonData(pkmn, MON_DATA_COOL_RIBBON);
        break;
    case CONTEST_CATEGORY_BEAUTY:
        ribbon = GetMonData(pkmn, MON_DATA_BEAUTY_RIBBON);
        break;
    case CONTEST_CATEGORY_CUTE:
        ribbon = GetMonData(pkmn, MON_DATA_CUTE_RIBBON);
        break;
    case CONTEST_CATEGORY_SMART:
        ribbon = GetMonData(pkmn, MON_DATA_SMART_RIBBON);
        break;
    case CONTEST_CATEGORY_TOUGH:
        ribbon = GetMonData(pkmn, MON_DATA_TOUGH_RIBBON);
        break;
    default:
        return 0;
    }

    // Couldn't get this to match any other way.
    // Returns 2, 1, or 0 respectively if ribbon's rank is above, equal, or below
    // the current contest rank.
    if (ribbon > gSpecialVar_ContestRank)
        retVal = 2;
    else if (ribbon >= gSpecialVar_ContestRank)
        retVal = 1;
    else
        retVal = 0;
    return retVal;
}

void DrawContestantWindowText(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        Text_FillWindowRectDefPalette(
            &gWindowTemplate_Contest_MoveDescription,
            0,
            gUnknown_083CA308[gContestantTurnOrder[i]][0],
            gUnknown_083CA308[gContestantTurnOrder[i]][1],
            gUnknown_083CA310[gContestantTurnOrder[i]][0] + 5,
            gUnknown_083CA310[gContestantTurnOrder[i]][1] + 1);
        PrintContestantTrainerName(i);
        PrintContestantMonName(i);
    }
}

u8 *Contest_CopyStringWithColor(u8 *dest, const u8 *src, u8 color)
{
    dest = StringCopy(dest, gUnknown_083CC59C); // {HIGHLIGHT TRANSPARENT}{COLOR}$
    *dest++ = color;
    dest = StringCopy(dest, src);
    return dest;
}

void PrintContestantTrainerName(u8 contestant)
{
    PrintContestantTrainerNameWithColor(contestant, contestant + 10);
}

void PrintContestantTrainerNameWithColor(u8 contestant, u8 color)
{
    u8 *str = gDisplayedStringBattle;

    str = Contest_CopyStringWithColor(str, gEmptyString_81E72B0, color);
    str[0] = EXT_CTRL_CODE_BEGIN;
    str[1] = EXT_CTRL_CODE_SIZE;
    str[2] = 4;
    str += 3;

    *str++ = CHAR_SLASH;

    if ((gIsLinkContest & 1) && gLinkPlayers[contestant].language == LANGUAGE_JAPANESE)
    {
        StringCopy(str, gLinkPlayers[contestant].name);
        Text_InitWindow8004D04(
            &gWindowTemplate_Contest_MoveDescription,
            gDisplayedStringBattle,
            592 + gContestantTurnOrder[contestant] * 22,
            251 + gUnknown_083CA310[gContestantTurnOrder[contestant]][0] * 8,
            gUnknown_083CA310[gContestantTurnOrder[contestant]][1] * 8,
            1);
    }
    else
    {
        StringCopy(str, gContestMons[contestant].trainerName);
        Text_InitWindowAndPrintText(
            &gWindowTemplate_Contest_MoveDescription,
            gDisplayedStringBattle,
            592 + gContestantTurnOrder[contestant] * 22,
            gUnknown_083CA310[gContestantTurnOrder[contestant]][0],
            gUnknown_083CA310[gContestantTurnOrder[contestant]][1]);
    }
}

void PrintContestantMonName(u8 contestant)
{
    PrintContestantMonNameWithColor(contestant, contestant + 10);
}

void PrintContestantMonNameWithColor(u8 contestant, u8 color)
{
    u8 *str = gDisplayedStringBattle;

    str[0] = EXT_CTRL_CODE_BEGIN;
    str[1] = EXT_CTRL_CODE_SIZE;
    str[2] = 4;
    str += 3;

    str = Contest_CopyStringWithColor(str, gContestMons[contestant].nickname, color);
    *str = EOS;

    Text_InitWindow8004D04(
        &gWindowTemplate_Contest_MoveDescription,
        gDisplayedStringBattle,
        512 + gContestantTurnOrder[contestant] * 20,
        253 + gUnknown_083CA308[gContestantTurnOrder[contestant]][0] * 8,
        gUnknown_083CA308[gContestantTurnOrder[contestant]][1] * 8,
        1);
}

u16 CalculateContestantRound1Points(u8 who, u8 contestCategory)
{
    u8 statMain;
    u8 statSub1;
    u8 statSub2;

    switch (contestCategory)
    {
    case CONTEST_CATEGORY_COOL:
        statMain = gContestMons[who].cool;
        statSub1 = gContestMons[who].tough;
        statSub2 = gContestMons[who].beauty;
        break;
    case CONTEST_CATEGORY_BEAUTY:
        statMain = gContestMons[who].beauty;
        statSub1 = gContestMons[who].cool;
        statSub2 = gContestMons[who].cute;
        break;
    case CONTEST_CATEGORY_CUTE:
        statMain = gContestMons[who].cute;
        statSub1 = gContestMons[who].beauty;
        statSub2 = gContestMons[who].smart;
        break;
    case CONTEST_CATEGORY_SMART:
        statMain = gContestMons[who].smart;
        statSub1 = gContestMons[who].cute;
        statSub2 = gContestMons[who].tough;
        break;
    case CONTEST_CATEGORY_TOUGH:
    default:
        statMain = gContestMons[who].tough;
        statSub1 = gContestMons[who].smart;
        statSub2 = gContestMons[who].cool;
        break;
    }
    return statMain + (statSub1 + statSub2 + gContestMons[who].sheen) / 2;
}

void CalculateRound1Points(u8 contestCategory)
{
    u8 i;

    for (i = 0; i < 4; i++)
        gContestMonRound1Points[i] = CalculateContestantRound1Points(i, contestCategory);
}

u8 CreateJudgeSprite(void)
{
    u8 spriteId;

    LoadCompressedObjectPic(&sSpriteSheet_Judge);
    LoadCompressedPalette(gContest2Pal, 0x110, 32);
    spriteId = CreateSprite(&sSpriteTemplate_Judge, 112, 36, 30);
    gSprites[spriteId].oam.paletteNum = 1;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    return spriteId;
}

u8 CreateJudgeSpeechBubbleSprite(void)
{
    u8 spriteId;

    LoadCompressedObjectPic(&sSpriteSheet_JudgeSymbols);
    LoadCompressedObjectPalette(&sSpritePalette_JudgeSymbols);
    spriteId = CreateSprite(&sSpriteTemplate_JudgeSpeechBubble, 96, 10, 29);
    gSprites[spriteId].invisible = TRUE;
    gSprites[spriteId].data[0] = gSprites[spriteId].oam.tileNum;
    return spriteId;
}

UNUSED
u8 unref_sub_80AE908(void)
{
    u16 species = gContestMons[gContestPlayerMonIndex].species;
    u8 spriteId;

    DecompressPicFromTable_2(
        &gMonFrontPicTable[species],
        gMonFrontPicCoords[species].coords,
        gMonFrontPicCoords[species].y_offset,
        (void *)EWRAM,
        gMonSpriteGfx_Sprite_ptr[1],
        species);
    LoadCompressedPalette(gMonPaletteTable[species].data, 0x110, 32);
    GetMonSpriteTemplate_803C56C(gContestMons[gContestPlayerMonIndex].species, 1);
    spriteId = CreateSprite(
        &gCreatingSpriteTemplate,
        112, 80 + (8 - gMonFrontPicCoords[gContestMons[gContestPlayerMonIndex].species].coords) * 4,
        30);
    gSprites[spriteId].oam.paletteNum = 1;
    gSprites[spriteId].callback = SpriteCallbackDummy;
    gSprites[spriteId].affineAnims = gAffineAnims_BattleSpriteContest;
    StartSpriteAffineAnim(&gSprites[spriteId], 0);
    return spriteId;
}

u8 CreateContestantSprite(u16 species, u32 otId, u32 personality)
{
    const u8 *lzPaletteData;
    u8 spriteId;

    species = SanitizeSpecies(species);
    HandleLoadSpecialPokePic(
        &gMonBackPicTable[species],
        gMonBackPicCoords[species].coords,
        gMonBackPicCoords[species].y_offset,
        (void *)EWRAM,
        gMonSpriteGfx_Sprite_ptr[0],
        species,
        personality);
    lzPaletteData = GetMonSpritePalFromOtIdPersonality(species, otId, personality);
    LoadCompressedPalette(lzPaletteData, 0x120, 32);
    GetMonSpriteTemplate_803C56C(species, 0);
    spriteId = CreateSprite(&gCreatingSpriteTemplate, 112, GetBattlerSpriteFinal_Y(2, species, 0), 30);
    gSprites[spriteId].oam.paletteNum = 2;
    gSprites[spriteId].oam.priority = 2;
    gSprites[spriteId].subpriority = GetBattlerSubpriority(2);
    gSprites[spriteId].callback = SpriteCallbackDummy;
    gSprites[spriteId].data[0] = gSprites[spriteId].oam.paletteNum;
    gSprites[spriteId].data[2] = species;
    if (IsSpeciesNotUnown(species))
        gSprites[spriteId].affineAnims = gAffineAnims_BattleSpriteContest;
    else
        gSprites[spriteId].affineAnims = gAffineAnims_BattleSpriteOpponentSide;
    StartSpriteAffineAnim(&gSprites[spriteId], 0);
    return spriteId;
}

bool8 IsSpeciesNotUnown(u16 species)
{
    if (species == SPECIES_UNOWN)
        return FALSE;
    else
        return TRUE;
}

// The contestant info windows and general-purpose text box are drawn on one half, while
// the moves and move description windows are drawn on another screen. Only the first 32 * 20
// tiles are actually drawn on screen.
void SwapMoveDescAndContestTilemaps(void)
{
    __copy_tilemap((void *)(VRAM + 0xC000));
    __copy_tilemap((void *)(VRAM + 0xE000));
}

void __copy_tilemap(void *a)
{
    DmaCopy16Defvars(3, a, (u8 *)a + 0x500, 0x280);
}

u16 GetMoveEffectSymbolTileOffset(u16 move, u8 b)
{
    u16 var;

    switch (gContestEffects[gContestMoves[move].effect].effectType)
    {
    case 0:
    case 1:
    case 8:
        var = 0x9082;
        break;
    case 2:
    case 3:
        var = 0x9088;
        break;
    default:
        var = 0x9086;
        break;
    }
    var += 0x9000 + (b << 12);
    return var;
}

void PrintContestMoveDescription(u16 a)
{
    u8 category;
    u16 categoryTile;
    s32 i;
    u8 numHearts;

    Text_FillWindowRectDefPalette(&gWindowTemplate_Contest_MoveDescription, 0, 11, 31, 16, 34);

    category = gContestMoves[a].contestCategory;
    if      (category == CONTEST_CATEGORY_COOL)
        categoryTile = 0x4040;
    else if (category == CONTEST_CATEGORY_BEAUTY)
        categoryTile = 0x4045;
    else if (category == CONTEST_CATEGORY_CUTE)
        categoryTile = 0x404A;
    else if (category == CONTEST_CATEGORY_SMART)
        categoryTile = 0x406A;
    else
        categoryTile = 0x408A;

    for (i = 0; i < 5; i++)
    {
        *(u16 *)(VRAM + 0xC7D6 + i * 2) = categoryTile;
        *(u16 *)(VRAM + 0xC816 + i * 2) = categoryTile + 16;
        categoryTile++;
    }

    if (gContestEffects[gContestMoves[a].effect].appeal == 0xFF)
        numHearts = 0;
    else
        numHearts = gContestEffects[gContestMoves[a].effect].appeal / 10;
    if (numHearts > 8)
        numHearts = 8;
    for (i = 0; i < 8; i++)
    {
        if (i < numHearts) // Empty hearts
            *(u16 *)(VRAM + 0xC7EA + i * 2) = 0x5012;
        else               // Filled-in hearts
            *(u16 *)(VRAM + 0xC7EA + i * 2) = 0x5035;
    }

    if (gContestEffects[gContestMoves[a].effect].jam == 0xFF)
        numHearts = 0;
    else
        numHearts = gContestEffects[gContestMoves[a].effect].jam / 10;
    if (numHearts > 8)
        numHearts = 8;
    for (i = 0; i < 8; i++)
    {
        if (i < numHearts) // Empty hearts
            *(u16 *)(VRAM + 0xC82A + i * 2) = 0x5014;
        else               // Filled-in hearts
            *(u16 *)(VRAM + 0xC82A + i * 2) = 0x5036;
    }

    Text_InitWindowAndPrintText(&gWindowTemplate_Contest_MoveDescription, gContestEffectStrings[gContestMoves[a].effect], 868, 11, 35);
    Text_InitWindowAndPrintText(&gWindowTemplate_Contest_MoveDescription, gText_Slash, 866, 16, 31);
}

void Contest_ClearMoveDescriptionBox(void)
{
    Text_FillWindowRectDefPalette(&gWindowTemplate_Contest_MoveDescription, 0, 11, 35, 28, 40);
}

UNUSED
void DrawMoveEffectSymbol(u16 move, u8 b)
{
    u8 r5 = gContestantTurnOrder[b] * 5 + 2;

    if (!Contest_IsMonsTurnDisabled(b) && move != MOVE_NONE)
    {
        u16 tile = GetMoveEffectSymbolTileOffset(move, b);

        *(u16 *)(VRAM + 0xC028 + r5 * 64) = tile;
        *(u16 *)(VRAM + 0xC028 + r5 * 64 + 2) = tile + 1;

        *(u16 *)(VRAM + 0xC068 + r5 * 64) = tile + 16;
        *(u16 *)(VRAM + 0xC068 + r5 * 64 + 2) = tile + 17;

    }
    else
    {
        *(u16 *)(VRAM + 0xC028 + r5 * 64) = 0;
        *(u16 *)(VRAM + 0xC028 + r5 * 64 + 2) = 0;

        *(u16 *)(VRAM + 0xC068 + r5 * 64) = 0;
        *(u16 *)(VRAM + 0xC068 + r5 * 64 + 2) = 0;
    }
}

UNUSED
void DrawMoveEffectSymbols(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        DrawMoveEffectSymbol(sContestantStatus[i].currMove, i);
}

u16 GetStarTileOffset(u8 unused)
{
    return 0x2034;
}

bool8 UpdateConditionStars(u8 a, u8 b)
{
    u8 r9;
    u16 r8;
    s32 r4;

    if (sContestantStatus[a].conditionMod == 0)
        return FALSE;
    r9 = gContestantTurnOrder[a] * 5 + 2;
    if (sContestantStatus[a].conditionMod == 1)
    {
        r8 = GetStarTileOffset(a);
        r4 = 0;
        while (sContestantStatus[a].condition / 10 > r4)
        {
            *(u16 *)(VRAM + 0xC026 + (r9 + r4) * 64) = r8;
            r4++;
        }
        if (b != 0)
        {
            PlaySE(SE_EXP_MAX);
            sContestantStatus[a].conditionMod = 0;
        }
    }
    else // CONDITION_LOSE
    {
        r8 = 0;
        r4 = 3;
        while (sContestantStatus[a].condition / 10 < r4)
        {
            *(u16 *)(VRAM + 0xBFE6 + (r9 + r4) * 64) = r8;
            r4--;
        }
        if (b != 0)
        {
            PlaySE(SE_CONTEST_CONDITION_LOSE);
            sContestantStatus[a].conditionMod = 0;
        }
    }
    return TRUE;
}

void DrawConditionStars(void)
{
    s32 i;
    s32 r4;

    for (i = 0; i < 4; i++)
    {
        u8 r8 = gContestantTurnOrder[i] * 5 + 2;
        u16 r6 = GetStarTileOffset(i);

        r4 = 0;
        while (r4 < sContestantStatus[i].condition / 10)
        {
            *(u16 *)(VRAM + 0xC026 + (r8 + r4) * 64) = r6;
            r4++;
        }
        r6 = 0;
        while (r4 < 3)
        {
            *(u16 *)(VRAM + 0xC026 + (r8 + r4) * 64) = r6;
            r4++;
        }
    }
}

u16 GetStatusSymbolTileOffset(u8 unused, u8 b)
{
    u16 var = 0;

    switch (b)
    {
    case 0: // For resistant
        var = 0x80;
        break;
    case 1: // For nervous
        var = 0x84;
        break;
    case 2: // For turn skipped
        var = 0x86;
        break;
    case 3: // For jammed/unnerved
        var = 0x88;
        break;
    case 4: // Never used
        var = 0x82;
        break;
    }
    var += 0x9000;
    return var;
}

bool8 DrawStatusSymbol(u8 a)
{
    bool8 r5 = TRUE;
    u16 r4 = 0;
    u8 r6 = gContestantTurnOrder[a] * 5 + 2;

    if (sContestantStatus[a].resistant != 0 || sContestantStatus[a].immune != 0 || sContestantStatus[a].jamSafetyCount != 0 || sContestantStatus[a].jamReduction != 0)
        r4 = GetStatusSymbolTileOffset(a, 0);
    else if (sContestantStatus[a].nervous)
        r4 = GetStatusSymbolTileOffset(a, 1);
    else if (sContestantStatus[a].numTurnsSkipped != 0 || sContestantStatus[a].noMoreTurns)
        r4 = GetStatusSymbolTileOffset(a, 2);
    else
        r5 = FALSE;
    if (r5)
    {
        *(u16 *)(VRAM + 0xC028 + r6 * 64) = r4;
        *(u16 *)(VRAM + 0xC028 + r6 * 64 + 2) = r4 + 1;
        *(u16 *)(VRAM + 0xC068 + r6 * 64) = r4 + 16;
        *(u16 *)(VRAM + 0xC068 + r6 * 64 + 2) = r4 + 17;
    }
    else
    {
        *(u16 *)(VRAM + 0xC028 + r6 * 64) = 0;
        *(u16 *)(VRAM + 0xC028 + r6 * 64 + 2) = 0;
        *(u16 *)(VRAM + 0xC068 + r6 * 64) = 0;
        *(u16 *)(VRAM + 0xC068 + r6 * 64 + 2) = 0;
    }
    return r5;
}

void DrawStatusSymbols(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
        DrawStatusSymbol(i);
}

void ContestClearGeneralTextWindow(void)
{
    Text_FillWindowRectDefPalette(&gWindowTemplate_Contest_MoveDescription, 0, 1, 15, 17, 18);
}

u16 GetChosenMove(u8 a)
{
    if (Contest_IsMonsTurnDisabled(a))
        return 0;
    if (a == gContestPlayerMonIndex)
    {
        return gContestMons[a].moves[sContest.playerMoveChoice];
    }
    else
    {
        u8 moveChoice;

        ContestAI_ResetAI(a);
        moveChoice = ContestAI_GetActionToUse();
        return gContestMons[a].moves[moveChoice];
    }
}

void GetAllChosenMoves(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sContestantStatus[i].currMove = GetChosenMove(i);
}

UNUSED
void sub_80AF1E4(u8 a, u8 b)
{
    u8 r3;

    if (b == 0)
        r3 = a + 10;
    else
        r3 = 14;
    if (sContestantStatus[a].currMove == MOVE_NONE)
        Contest_CopyStringWithColor(gDisplayedStringBattle, gUnknownText_MissedTurn, r3);
    else
        Contest_CopyStringWithColor(
            gDisplayedStringBattle, gMoveNames[sContestantStatus[a].currMove], r3);
    sub_80AF2A0(a);
    Text_InitWindowAndPrintText(
        &gWindowTemplate_Contest_MoveDescription,
        gDisplayedStringBattle,
        696 + a * 20,
        gUnknown_083CA318[a][0],
        gUnknown_083CA318[a][1]);
}

UNUSED
void unref_sub_80AF280(u8 a)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sub_80AF1E4(i, a);
}

UNUSED
void sub_80AF2A0(u8 a)
{
    Text_FillWindowRectDefPalette(
        &gWindowTemplate_Contest_MoveDescription,
        0,
        gUnknown_083CA318[a][0],
        gUnknown_083CA318[a][1],
        gUnknown_083CA318[a][0] + 7,
        gUnknown_083CA318[a][1] + 1);
}

UNUSED
void unref_sub_80AF2E0(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        sub_80AF2A0(i);
}

void RankContestants(void)
{
    u8 i;
    u8 j;
    s16 arr[4];

    for (i = 0; i < 4; i++)
    {
        sContestantStatus[i].pointTotal += sContestantStatus[i].appeal;
        arr[i] = sContestantStatus[i].pointTotal;
    }

    // Sort the point totals using bubble-sort.
    for (i = 0; i < 3; i++)
    {
        for (j = 3; j > i; j--)
        {
            if (arr[j - 1] < arr[j])
            {
                u16 temp = arr[j];

                arr[j] = arr[j - 1];
                arr[j - 1] = temp;
            }
        }
    }

    // For each contestant, find the best rank with their point total.
    // Normally, each point total is different, and this will output the
    // rankings as expected. However, if two pokemon are tied, then they
    // both get the best rank for that point total.
    //
    // For example if the point totals are [100, 80, 80, 50], the ranks will
    // be [1, 2, 2, 4]. The pokemon with a point total of 80 stop looking
    // when they see the first 80 in the array, so they both share the '2'
    // rank.
    for (i = 0; i < 4; i++)
    {
        for (j = 0; j < 4; j++)
        {
            if (sContestantStatus[i].pointTotal == arr[j])
            {
                sContestantStatus[i].ranking = j;
                break;
            }
        }
    }
    SortContestants(1);
    ApplyNextTurnOrder();
}

void SetAttentionLevels(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        u8 attentionLevel;

        if (sContestantStatus[i].currMove == MOVE_NONE)
            attentionLevel = 5;
        else if (sContestantStatus[i].appeal <= 0)
            attentionLevel = 0;
        else if (sContestantStatus[i].appeal < 30)
            attentionLevel = 1;
        else if (sContestantStatus[i].appeal < 60)
            attentionLevel = 2;
        else if (sContestantStatus[i].appeal < 80)
            attentionLevel = 3;
        else
            attentionLevel = 4;

        sContestantStatus[i].attentionLevel = attentionLevel;
    }
}

bool8 ContestantCanUseTurn(u8 a)
{
    if (sContestantStatus[a].numTurnsSkipped != 0 || sContestantStatus[a].noMoreTurns)
        return FALSE;
    else
        return TRUE;
}

void SetContestantStatusesForNextRound(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        // This is bitfield hell...
        sContestantStatus[i].appeal = 0;
        sContestantStatus[i].baseAppeal = 0;
        sContestantStatus[i].jamSafetyCount = 0;
        if (sContestantStatus[i].numTurnsSkipped > 0)
            sContestantStatus[i].numTurnsSkipped--;
        sContestantStatus[i].jam = 0;
        sContestantStatus[i].resistant = 0;
        sContestantStatus[i].jamReduction = 0;
        sContestantStatus[i].immune = 0;
        sContestantStatus[i].moreEasilyStartled = 0;
        sContestantStatus[i].usedRepeatableMove = 0;
        sContestantStatus[i].nervous = 0;
        sContestantStatus[i].effectStringId = CONTEST_STRING_NONE;
        sContestantStatus[i].effectStringId2 = CONTEST_STRING_NONE;
        sContestantStatus[i].conditionMod = 0;
        sContestantStatus[i].repeatedPrevMove = sContestantStatus[i].repeatedMove;
        sContestantStatus[i].repeatedMove = FALSE;
        sContestantStatus[i].turnOrderModAction = 0;
        sContestantStatus[i].appealTripleCondition = 0;
        if (sContestantStatus[i].turnSkipped)
        {
            sContestantStatus[i].numTurnsSkipped = 1;
            sContestantStatus[i].turnSkipped = 0;
        }
        if (sContestantStatus[i].exploded)
        {
            sContestantStatus[i].noMoreTurns = 1;
            sContestantStatus[i].exploded = 0;
        }
        sContestantStatus[i].overrideCategoryExcitementMod = 0;
    }
    for (i = 0; i < 4; i++)
    {
        sContestantStatus[i].prevMove = sContestantStatus[i].currMove;
        sContest.moveHistory[sContest.appealNumber][i] = sContestantStatus[i].prevMove;
        sContest.excitementHistory[sContest.appealNumber][i] = Contest_GetMoveExcitement(sContestantStatus[i].currMove);
        sContestantStatus[i].currMove = MOVE_NONE;
    }
    eContestExcitement.excitementFrozen = 0;
}

bool8 Contest_IsMonsTurnDisabled(u8 a)
{
    if (sContestantStatus[a].numTurnsSkipped != 0 || sContestantStatus[a].noMoreTurns)
        return TRUE;
    else
        return FALSE;
}

UNUSED
bool8 unref_sub_80AF5D0(u8 a, u8 b)
{
    u8 i;

    if (a != gContestPlayerMonIndex)
        return TRUE;
    for (i = 0; i < 4; i++)
    {
        if (b == 3)
        {
            sContest.unk1920A_0 = 1;
            return TRUE;
        }
        if (b == 4)
        {
            sContest.unk1920A_1 = 1;
            return TRUE;
        }
        if (sContest.unk19206[i] == b)
            return TRUE;
        if (sContest.unk19206[i] == 0xFF)
        {
            sContest.unk19206[i] = b;
            return TRUE;
        }
    }
    return FALSE;
}

void CalculateTotalPointsForContestant(u8 a)
{
    gContestMonRound2Points[a] = GetContestantRound2Points(a);
    gContestMonTotalPoints[a] = gContestMonRound1Points[a] + gContestMonRound2Points[a];
}

void CalculateFinalScores(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        CalculateTotalPointsForContestant(i);
    DetermineFinalStandings();
}

s16 GetContestantRound2Points(u8 a)
{
    return gContestMonAppealPointTotals[a] * 2;
}

void DetermineFinalStandings(void)
{
    u16 randomOrdering[4] = {0};
    struct ContestFinalStandings standings[4];
    s32 i;

    // Seed random order in case of ties
    for (i = 0; i < 4; i++)
    {
        s32 j;
        randomOrdering[i] = Random();
        for (j = 0; j < i; j++)
        {
            if (randomOrdering[i] == randomOrdering[j])
            {
                i--;
                break;
            }
        }
    }

    for (i = 0; i < 4; i++)
    {
        standings[i].totalPoints = gContestMonTotalPoints[i];
        standings[i].round1Points = gContestMonRound1Points[i];
        standings[i].random = randomOrdering[i];
        standings[i].contestant = i;
    }

    // Rank contestants
    for (i = 0; i < 3; i++)
    {
        s32 j;
        for (j = 3; j > i; j--)
        {
            if (DidContestantPlaceHigher(j - 1, j, standings))
            {
                // Swap contestants in array
                struct ContestFinalStandings temp;

                temp.totalPoints = standings[j - 1].totalPoints;
                temp.round1Points = standings[j - 1].round1Points;
                temp.random = standings[j - 1].random;
                temp.contestant = standings[j - 1].contestant;

                standings[j - 1].totalPoints = standings[j].totalPoints;
                standings[j - 1].round1Points = standings[j].round1Points;
                standings[j - 1].random = standings[j].random;
                standings[j - 1].contestant = standings[j].contestant;

                standings[j].totalPoints = temp.totalPoints;
                standings[j].round1Points = temp.round1Points;
                standings[j].random = temp.random;
                standings[j].contestant = temp.contestant;
            }
        }
    }

    // Assign placements. i is the placing (0 is 1st, 1 is 2nd...)
    for (i = 0; i < 4; i++)
        gContestFinalStandings[standings[i].contestant] = i;
}

bool8 DidContestantPlaceHigher(s32 a, s32 b, struct ContestFinalStandings *c)
{
    bool8 retVal;

    if      (c[a].totalPoints < c[b].totalPoints)
        retVal = TRUE;
    else if (c[a].totalPoints > c[b].totalPoints)
        retVal = FALSE;
    else if (c[a].round1Points < c[b].round1Points)
        retVal = TRUE;
    else if (c[a].round1Points > c[b].round1Points)
        retVal = FALSE;
    else if (c[a].random < c[b].random)
        retVal = TRUE;
    else
        retVal = FALSE;
    return retVal;
}

void ContestPrintLinkStandby(void)
{
    gBattle_BG0_Y = 0;
    gBattle_BG2_Y = 0;
    ContestClearGeneralTextWindow();
    Text_InitWindowAndPrintText(&gMenuWindow, gUnknownText_LinkStandbyAndWinner, 776, 1, 15);
}

UNUSED
u8 unref_sub_80AF89C(s16 appealStart, s16 appealDelta, u8 tileOffs, u8 contestant)
{
    u8 taskId;
    u8 heartsStart;
    s8 heartsDelta;
    u16 baseBlock;

    eContestGfxState[contestant].updatingAppealHearts = 1;
    taskId = CreateTask(Task_unused_80AF94C, 20);
    heartsStart = GetNumHeartsFromAppealPoints(appealStart);
    heartsDelta = GetNumHeartsFromAppealPoints(appealStart + appealDelta) - heartsStart;
    baseBlock = GetAppealHeartTileOffset(contestant);
    gTasks[taskId].data[0] = heartsStart;
    gTasks[taskId].data[1] = heartsDelta;
    gTasks[taskId].data[2] = baseBlock + tileOffs;
    gTasks[taskId].data[3] = contestant;
    if (appealDelta < 0)
        nullsub_19(contestant);
    return taskId;
}

UNUSED
void Task_unused_80AF94C(u8 taskId)
{
    u8 contestant = gTasks[taskId].data[3];

    if (gTasks[taskId].data[1] == 0)
    {
        nullsub_19(contestant);
        DestroyTask(taskId);
        eContestGfxState[contestant].updatingAppealHearts = 0;
    }
    else if (++gTasks[taskId].data[10] > 29)
    {
        u8 numHearts;

        gTasks[taskId].data[10] = 0;
        if (gTasks[taskId].data[1] < 0)
        {
            numHearts = gTasks[taskId].data[0]--;
            gTasks[taskId].data[1]++;
            PlaySE(SE_BOO);
        }
        else
        {
            numHearts = ++gTasks[taskId].data[0];
            gTasks[taskId].data[1]--;
            PlaySE(SE_PIN);
        }
        if ((u16)gTasks[taskId].data[2] != 0xFFFF)
        {
            RequestSpriteCopy(
                &gTasks[taskId].data[2],
                (void *)(VRAM + 0xC000 + (147 + numHearts + contestant * 160) * 2),
                2);
        }
        else
        {
            u8 i;

            for (i = 0; i < 3; i++)
            {
                if (gTasks[taskId].data[i + 4] < 0)
                {
                    RequestSpriteCopy(
                        &gTasks[taskId].data[i + 7],
                        (void *)(VRAM + 0xC000 + (147 + numHearts + contestant * 160) * 2),
                        2);
                    gTasks[taskId].data[i + 4]++;
                    break;
                }
            }
        }
    }
}

void FillContestantWindowBgs(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        DmaClear16(3, (void *)(VRAM + 0xC000 + (86 + i * 160) * 2), 16);
        DmaClear16(3, (void *)(VRAM + 0xC000 + (118 + i * 160) * 2), 16);
    }
}

UNUSED
void unref_sub_80AFAB8(s16 a, u8 b)
{
    u8 r5 = GetNumHeartsFromAppealPoints(a);
    u16 r2;
    u8 i;
    u16 arr[9];

    if (b == 0)
        r2 = 0x50A2;
    else if (b == 1)
        r2 = 0x60A2;
    else if (b == 2)
        r2 = 0x70A2;
    else
        r2 = 0x80A2;

    for (i = 0; i < 9; i++)
    {
        if (i < r5)
            arr[i] = r2;
        else
            arr[i] = 0;
    }

    DmaCopy16Defvars(3, arr, (void *)(VRAM + 0xC000 + (148 + b * 160) * 2), sizeof(arr));
}

u16 GetAppealHeartTileOffset(u8 a)
{
    u16 var;

    if (a == 0)
        var = 0x5011;
    else if (a == 1)
        var = 0x6011;
    else if (a == 2)
        var = 0x7011;
    else
        var = 0x8011;
    return var + 1;
}

s8 GetNumHeartsFromAppealPoints(s16 a)
{
    s8 retVal = a / 10;

    if (retVal > 16)
        retVal = 16;
    else if (retVal < -16)
        retVal = -16;
    return retVal;
}

u8 UpdateAppealHearts(s16 startAppeal, s16 appealDelta, u8 contestant)
{
    u8 taskId;
    s8 startHearts;
    s8 heartsDelta;

    eContestGfxState[contestant].updatingAppealHearts = 1;
    taskId = CreateTask(Task_UpdateAppealHearts, 20);
    startHearts = GetNumHeartsFromAppealPoints(startAppeal);
    heartsDelta = GetNumHeartsFromAppealPoints(startAppeal + appealDelta) - startHearts;
    GetAppealHeartTileOffset(contestant);  // unused return value
    gTasks[taskId].data[0] = abs(startHearts);
    gTasks[taskId].data[1] = heartsDelta;
    if (startHearts > 0 || (startHearts == 0 && heartsDelta > 0))
        gTasks[taskId].data[2] = 1;
    else
        gTasks[taskId].data[2] = -1;
    gTasks[taskId].data[3] = contestant;
    if (appealDelta < 0)
        nullsub_19(contestant);
    return taskId;
}

void Task_UpdateAppealHearts(u8 taskId)
{
    u8 contestant = gTasks[taskId].data[3];
    s16 startHearts = gTasks[taskId].data[0];
    s16 heartsDelta = gTasks[taskId].data[1];

    if (++gTasks[taskId].data[10] > 14)
    {
        u16 heartOffset;
        u8 newNumHearts;
        u8 pitchMod;

        gTasks[taskId].data[10] = 0;
        if (gTasks[taskId].data[1] == 0)
        {
            nullsub_19(contestant);
            DestroyTask(taskId);
            eContestGfxState[contestant].updatingAppealHearts = 0;
            return;
        }
        else if (startHearts == 0)
        {
            if (heartsDelta < 0)
            {
                heartOffset = GetAppealHeartTileOffset(contestant) + 2;
                gTasks[taskId].data[1]++;
            }
            else
            {
                heartOffset = GetAppealHeartTileOffset(contestant);
                gTasks[taskId].data[1]--;
            }
            newNumHearts = gTasks[taskId].data[0]++;
        }
        else
        {
            if (gTasks[taskId].data[2] < 0)
            {
                if (heartsDelta < 0)
                {
                    newNumHearts = gTasks[taskId].data[0]++;
                    gTasks[taskId].data[1]++;
                    heartOffset = GetAppealHeartTileOffset(contestant) + 2;
                }
                else
                {
                    newNumHearts = --gTasks[taskId].data[0];
                    heartOffset = 0;
                    gTasks[taskId].data[1]--;
                }
            }
            else
            {
                if (heartsDelta < 0)
                {
                    newNumHearts = --gTasks[taskId].data[0];
                    heartOffset = 0;
                    gTasks[taskId].data[1]++;
                }
                else
                {
                    newNumHearts = gTasks[taskId].data[0]++;
                    gTasks[taskId].data[1]--;
                    heartOffset = GetAppealHeartTileOffset(contestant);
                }
            }
        }
        pitchMod = newNumHearts;
        if (newNumHearts >= 8)
            newNumHearts += 32 - 8; // jump to second line
        // Seriously, a 2-byte CpuFill? Why?
        CpuFill16(heartOffset, (void *)(VRAM + 0xC000 + (0x56 + newNumHearts + gContestantTurnOrder[contestant] * 160) * 2), 2);
        if (heartsDelta > 0) // Appeal
        {
            PlaySE(SE_CONTEST_HEART);
            m4aMPlayImmInit(&gMPlayInfo_SE1);
            m4aMPlayPitchControl(&gMPlayInfo_SE1, 0xFFFF, pitchMod * 256);
        }
        else // Jam
        {
            PlaySE(SE_BOO);
        }
        if (newNumHearts == 0 && heartOffset == 0)
            gTasks[taskId].data[2] = -gTasks[taskId].data[2];
    }
}

void CreateSliderHeartSprites(void)
{
    s32 i;

    LoadSpriteSheet(&sSpriteSheet_SliderHeart);
    for (i = 0; i < 4; i++)
    {
        u8 y = sSliderHeartYPositions[gContestantTurnOrder[i]];

        eContestGfxState[i].sliderHeartSpriteId = CreateSprite(&sSpriteTemplate_SliderHeart, 180, y, 1);
    }
}

void sub_80AFE78(u8 a)
{
    u8 spriteId;
    s16 r5;

    eContestGfxState[a].sliderUpdating = 1;
    spriteId = eContestGfxState[a].sliderHeartSpriteId;
    r5 = sContestantStatus[a].pointTotal / 10 * 2;
    if (r5 > 56)
        r5 = 56;
    else if (r5 < 0)
        r5 = 0;
    gSprites[spriteId].invisible = FALSE;
    gSprites[spriteId].data[0] = a;
    gSprites[spriteId].data[1] = r5;
    if (gSprites[spriteId].data[1] > gSprites[spriteId].pos2.x)
        gSprites[spriteId].data[2] = 1;
    else
        gSprites[spriteId].data[2] = -1;
    gSprites[spriteId].callback = sub_80AFF60;
}

void UpdateHeartSliders(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
        sub_80AFE78(i);
}

bool8 SlidersDoneUpdating(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (eContestGfxState[i].sliderUpdating)
            break;
    }
    if (i == 4)
        return TRUE;
    else
        return FALSE;
}

void sub_80AFF60(struct Sprite *sprite)
{
    if (sprite->pos2.x == sprite->data[1])
    {
        eContestGfxState[sprite->data[0]].sliderUpdating = 0;
        sprite->callback = SpriteCallbackDummy;
    }
    else
    {
        sprite->pos2.x += sprite->data[2];
    }
}

void UpdateSliderHeartSpriteYPositions(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
        gSprites[eContestGfxState[i].sliderHeartSpriteId].pos1.y = sSliderHeartYPositions[gContestantTurnOrder[i]];
}

void SetBottomSliderHeartsInvisibility(bool8 a)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (gContestantTurnOrder[i] > 1)
        {
            if (!a)
                gSprites[eContestGfxState[i].sliderHeartSpriteId].pos1.x = 180;
            else
                gSprites[eContestGfxState[i].sliderHeartSpriteId].pos1.x = 256;
        }
    }
}

void CreateNextTurnSprites(void)
{
    s32 i;

    LoadSpritePalette(&gUnknown_083CA3E4);
    for (i = 0; i < 4; i++)
    {
        LoadCompressedObjectPic(&gUnknown_083CA3C4[i]);
        eContestGfxState[i].nextTurnSpriteId = CreateSprite(
            &gSpriteTemplate_83CA3F4[i],
            204, gUnknown_083CA33C[gContestantTurnOrder[i]],
            0);
        SetSubspriteTables(&gSprites[eContestGfxState[i].nextTurnSpriteId], gSubspriteTables_83CA464);
        gSprites[eContestGfxState[i].nextTurnSpriteId].invisible = TRUE;
    }
}

void CreateApplauseMeterSprite(void)
{
    u8 spriteId;

    LoadCompressedObjectPic(&gUnknown_083CA46C);
    LoadSpritePalette(&gUnknown_083CA474);
    spriteId = CreateSprite(&gSpriteTemplate_83CA484, 30, 44, 1);
    gSprites[spriteId].invisible = TRUE;
    sContest.applauseMeterSpriteId = spriteId;
}

void nullsub_18(s8 unused)
{
}

void unref_sub_80B011C(void)
{
    u8 i;

    LoadCompressedObjectPic(&gUnknown_083CC3AC);
    for (i = 0; i < 4; i++)
        LoadCompressedObjectPalette(&gUnknown_083CC3B4[i]);
    for (i = 0; i < 4; i++)
    {
        u8 spriteId = CreateSprite(
            &gSpriteTemplate_83CC454[i],
            gUnknown_083CA330[i][0], gUnknown_083CA330[i][1],
            5);

        gSprites[spriteId].invisible = TRUE;
        gSprites[spriteId].data[0] = i;
        sContest.unk1920D[i] = spriteId;
    }
}

void unref_sub_80B01B0(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
        gSprites[sContest.unk1920D[i]].callback = sub_80B0238;
}

bool8 unref_sub_80B01E0(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (gSprites[sContest.unk1920D[i]].callback != SpriteCallbackDummy)
            break;
    }
    if (i == 4)
        return TRUE;
    else
        return FALSE;
}

void sub_80B0238(struct Sprite *sprite)
{
    sprite->oam.affineMode = 1;
    InitSpriteAffineAnim(sprite);
    if (sprite->invisible)
    {
        sprite->callback = sub_80B02A8;
    }
    else
    {
        StartSpriteAffineAnim(sprite, 1);
        sprite->callback = sub_80B0280;
    }
}

void sub_80B0280(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        sprite->invisible = TRUE;
        sprite->callback = sub_80B02A8;
    }
}

void sub_80B02A8(struct Sprite *sprite)
{
    sprite->invisible = FALSE;
    StartSpriteAnim(sprite, sContestantStatus[sprite->data[0]].ranking);
    StartSpriteAffineAnim(sprite, 2);
    sprite->callback = sub_80B02F4;
    PlaySE(SE_CONTEST_PLACE);
}

void sub_80B02F4(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        FreeSpriteOamMatrix(sprite);
        sprite->oam.affineMode = 0;
        sprite->callback = SpriteCallbackDummy;
    }
}

void CreateJudgeAttentionEyeTask(void)
{
    u8 i;
    u8 taskId = CreateTask(sub_80B0458, 30);

    sContest.judgeAttentionTaskId = taskId;
    for (i = 0; i < 4; i++)
        gTasks[taskId].data[i * 4] = 0xFF;
}

void sub_80B0368(u8 a)
{
    gTasks[sContest.judgeAttentionTaskId].data[a * 4 + 0] = 0;
    gTasks[sContest.judgeAttentionTaskId].data[a * 4 + 1] = 0;
}

void sub_80B03A8(u8 a)
{
    u8 taskId = CreateTask(sub_80B03D8, 31);

    gTasks[taskId].data[0] = a;
}

void sub_80B03D8(u8 taskId)
{
    u8 r4 = gTasks[taskId].data[0];

    if (gTasks[sContest.judgeAttentionTaskId].data[r4 * 4 + 0] == 0
        || gTasks[sContest.judgeAttentionTaskId].data[r4 * 4 + 0] == 0xFF)
    {
        gTasks[sContest.judgeAttentionTaskId].data[r4 * 4 + 0] = 0xFF;
        gTasks[sContest.judgeAttentionTaskId].data[r4 * 4 + 1] = 0;
        BlendPalette((sContest.prevTurnOrder[r4] + 5) * 16 + 6, 2, 0, RGB(31, 31, 18));
        DestroyTask(taskId);
    }
}

void sub_80B0458(u8 taskId)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        u8 r3 = i * 4;

        if (gTasks[taskId].data[r3 + 0] != 0xFF)
        {
            if (gTasks[taskId].data[r3 + 1] == 0)
                gTasks[taskId].data[r3 + 0]++;
            else
                gTasks[taskId].data[r3 + 0]--;

            if (gTasks[taskId].data[r3 + 0] == 16
                || gTasks[taskId].data[r3 + 0] == 0)
                gTasks[taskId].data[r3 + 1] ^= 1;

            BlendPalette(
                (sContest.prevTurnOrder[i] + 5) * 16 + 6,
                2,
                gTasks[taskId].data[r3 + 0],
                RGB(31, 31, 18));
        }
    }
}

void CreateUnusedBlendTask(void)
{
    u8 i;

    sContest.blendTaskId = CreateTask(Task_UnusedBlend, 30);
    for (i = 0; i < 4; i++)
        InitUnusedBlendTaskData(i);
}

void InitUnusedBlendTaskData(u8 contestant)
{
    gTasks[sContest.blendTaskId].data[contestant * 4 + 0] = 0xFF;
    gTasks[sContest.blendTaskId].data[contestant * 4 + 1] = 0;
}

void UpdateBlendTaskContestantsData(void)
{
    u8 i;

    for (i = 0; i < 4; i++)
        UpdateBlendTaskContestantData(i);
}

void UpdateBlendTaskContestantData(u8 contestant)
{
    InitUnusedBlendTaskData(contestant);

    // 2-byte DMA copy? Why?

    DmaCopy16Defvars(
        3,
        &gPlttBufferUnfaded[16 * (5 + contestant) + 10],
        &gPlttBufferFaded[16 * (5 + contestant) + 10],
        2);

    DmaCopy16Defvars(
        3,
        &gPlttBufferUnfaded[16 * (5 + contestant) + 12 + contestant],
        &gPlttBufferFaded[16 * (5 + contestant) + 12 + contestant],
        2);
}

void nullsub_19(int unused)
{
}

void Task_UnusedBlend(u8 taskId)
{
    u8 i;

    for (i = 0; i < 4; i++)
    {
        u8 r3 = i * 4;

        if (gTasks[taskId].data[r3 + 0] != 0xFF)
        {
            if (++gTasks[taskId].data[r3 + 2] > 2)
            {
                gTasks[taskId].data[r3 + 2] = 0;

                if (gTasks[taskId].data[r3 + 1] == 0)
                    gTasks[taskId].data[r3 + 0]++;
                else
                    gTasks[taskId].data[r3 + 0]--;

                if (gTasks[taskId].data[r3 + 0] == 16
                    || gTasks[taskId].data[r3 + 0] == 0)
                    gTasks[taskId].data[r3 + 1] ^= 1;

                BlendPalette((i + 5) * 16 + 10, 1, gTasks[taskId].data[r3 + 0], RGB(31, 31, 18));
                BlendPalette((i + 5) * 16 + 12 + i, 1, gTasks[taskId].data[r3 + 0], RGB(31, 31, 18));
            }
        }
    }
}

// This task is never used
u8 CreateUnusedBrokenBlendTask(u8 *a)
{
    u8 i;
    u8 taskId = CreateTask(Task_UnusedBrokenBlend, 10);

    for (i = 0; i < 4; i++)
    {
        u8 r0 = i * 4;

        gTasks[taskId].data[r0] = a[i];
        if (a[i] != 0)
            eContestGfxState[i].boxBlinking = TRUE;
    }
    return taskId;
}

#ifdef NONMATCHING
void Task_UnusedBrokenBlend(u8 taskId)
{
    u8 i;
    u8 r4;
    u8 r4_2;
    u8 r1;
    u8 r7;

    for (i = 0; i < 4; i++)
    {
        //#define r4 r4_2
        r4 = gContestantTurnOrder[i];
        r1 = r4 * 4;
        r7 = gTasks[taskId].data[r1 + 0];

        if (r7 != 0)
        {
            //_080B079C
            u8 r8 = gTasks[taskId].data[r1 + 1];
            u8 r5 = gTasks[taskId].data[r1 + 2];
            u8 r6 = gTasks[taskId].data[r1 + 3];

            if (r7 == 1)
            {
                r6++;
                if (r6 == 1)
                {
                    //_080B07D2
                    r6 = 0;
                    BlendPalette((r4 + 5) * 16 + 1, 3, r5, RGB(31, 31, 31));
                    if (r5 == 0 && r8 == 4)
                    {
                        gTasks[taskId].data[r1 + 0] = 0;
                        //asm("");
                    }
                    //_080B0800
                    else
                    {
                        r5 += 2;
                        if (r5 > 13)
                        {
                            r5 = 0;
                            r8++;
                        }
                    }
                }
                //to _080B08EA
            }
            //_080B0818
            else if (r7 == 2 || r7 == 4)
            {
                r6++;
                if (r6 == 3)
                {
                    r6 = 0;
                    BlendPalette((r4 + 5) * 16 + 1, 3, r5, gUnknown_083CC5A4[r4]);
                    if (r5 == 0 && r8 == 2)
                    {
                        gTasks[taskId].data[r1 + 0] = 0;
                    }
                    //_080B0858
                    else
                    {
                        r5 += 1;
                        if (r5 == 14)
                        {
                            r5 = 0;
                            r8++;
                            if (r7 == 4 && r8 == 1)
                            {
                                BlendPalette((r4 + 9) * 16 + 2, 1, 4, RGB(0, 0, 0));
                                BlendPalette((r4 + 9) * 16 + 5, 1, 4, RGB(0, 0, 0));
                            }
                        }
                    }
                }
                //to _080B08EA
            }
            //_080B0896
            else if (r7 == 3)
            {
                r6++;
                if (r6 == 12)
                {
                    r6 = 0;
                    BlendPalette((r4 + 5) * 16 + 1, 3, r5, RGB(0, 0, 0));
                    r5 += 1;
                    if (r5 == 5)
                    {
                        // What the hell? These aren't pointers.
                        // This code would crash if run.
                        DmaCopy16Defvars(3, (void *)(u32)gPlttBufferFaded[(r4 + 5) * 16 + 1],
                            (void *)(u32)gPlttBufferUnfaded[(r4 + 5) * 16 + 1], 6);
                        gTasks[taskId].data[r1 + 0] = 0;
                    }
                }
            }
            //_080B08EA
            gTasks[taskId].data[r1 + 1] = r8;
            gTasks[taskId].data[r1 + 2] = r5;
            gTasks[taskId].data[r1 + 3] = r6;
        }
        //_080B0910
    }
    //_080B0920

    #define i r4_2
    for (i = 0; i < 4; i++)  // r4 is i
    {
        if (gTasks[taskId].data[i * 4 + 0] != 0)
            break;
    }
    //_080B0958
    if (i == 4)
    {
        for (i = 0; i < 4; i++)
            eContestGfxState[i].boxBlinking = FALSE;
        DestroyTask(taskId);
    }
    #undef i
}
#else
NAKED
void Task_UnusedBrokenBlend(u8 taskId)
{
    asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, 0x20\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	str r0, [sp]\n\
	movs r0, 0\n\
	str r0, [sp, 0x4]\n\
	ldr r2, _080B07F4 @ =gTasks\n\
	movs r1, 0x8\n\
	adds r1, r2\n\
	mov r10, r1\n\
	ldr r3, [sp]\n\
	lsls r3, 2\n\
	str r3, [sp, 0x1C]\n\
	ldr r1, [sp]\n\
	adds r0, r3, r1\n\
	lsls r0, 3\n\
	str r0, [sp, 0xC]\n\
_080B0774:\n\
	ldr r0, _080B07F8 @ =gContestantTurnOrder\n\
	ldr r3, [sp, 0x4]\n\
	adds r0, r3, r0\n\
	ldrb r4, [r0]\n\
	lsls r0, r4, 26\n\
	lsrs r1, r0, 24\n\
	lsls r0, r1, 1\n\
	str r0, [sp, 0x8]\n\
	ldr r3, [sp]\n\
	lsls r0, r3, 2\n\
	adds r0, r3\n\
	lsls r6, r0, 3\n\
	ldr r3, [sp, 0x8]\n\
	adds r0, r3, r6\n\
	add r0, r10\n\
	mov r9, r0\n\
	ldrb r7, [r0]\n\
	cmp r7, 0\n\
	bne _080B079C\n\
	b _080B0910\n\
_080B079C:\n\
	adds r3, r1, 0x1\n\
	lsls r0, r3, 1\n\
	adds r0, r6\n\
	add r0, r10\n\
	ldrb r0, [r0]\n\
	mov r8, r0\n\
	adds r2, r1, 0x2\n\
	lsls r0, r2, 1\n\
	adds r0, r6\n\
	add r0, r10\n\
	ldrb r5, [r0]\n\
	adds r1, 0x3\n\
	lsls r0, r1, 1\n\
	adds r0, r6\n\
	add r0, r10\n\
	ldrb r6, [r0]\n\
	str r3, [sp, 0x10]\n\
	str r2, [sp, 0x14]\n\
	str r1, [sp, 0x18]\n\
	cmp r7, 0x1\n\
	bne _080B0818\n\
	adds r0, r6, 0x1\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	cmp r6, 0x1\n\
	beq _080B07D2\n\
	b _080B08EA\n\
_080B07D2:\n\
	movs r6, 0\n\
	adds r0, r4, 0x5\n\
	lsls r0, 4\n\
	adds r0, 0x1\n\
	movs r1, 0x3\n\
	adds r2, r5, 0\n\
	ldr r3, _080B07FC @ =0x00007fff\n\
	bl BlendPalette\n\
	cmp r5, 0\n\
	bne _080B0800\n\
	mov r0, r8\n\
	cmp r0, 0x4\n\
	bne _080B0800\n\
	mov r1, r9\n\
	strh r6, [r1]\n\
	b _080B08EA\n\
	.align 2, 0\n\
_080B07F4: .4byte gTasks\n\
_080B07F8: .4byte gContestantTurnOrder\n\
_080B07FC: .4byte 0x00007fff\n\
_080B0800:\n\
	adds r0, r5, 0x2\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	cmp r5, 0xD\n\
	bls _080B08EA\n\
	movs r5, 0\n\
	mov r0, r8\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r8, r0\n\
	b _080B08EA\n\
_080B0818:\n\
	cmp r7, 0x2\n\
	beq _080B0820\n\
	cmp r7, 0x4\n\
	bne _080B0896\n\
_080B0820:\n\
	adds r0, r6, 0x1\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	cmp r6, 0x3\n\
	bne _080B08EA\n\
	movs r6, 0\n\
	adds r0, r4, 0x5\n\
	lsls r0, 4\n\
	adds r0, 0x1\n\
	ldr r2, _080B0854 @ =gUnknown_083CC5A4\n\
	lsls r1, r4, 1\n\
	adds r1, r2\n\
	ldrh r3, [r1]\n\
	movs r1, 0x3\n\
	adds r2, r5, 0\n\
	bl BlendPalette\n\
	cmp r5, 0\n\
	bne _080B0858\n\
	mov r2, r8\n\
	cmp r2, 0x2\n\
	bne _080B0858\n\
	mov r3, r9\n\
	strh r6, [r3]\n\
	b _080B08EA\n\
	.align 2, 0\n\
_080B0854: .4byte gUnknown_083CC5A4\n\
_080B0858:\n\
	adds r0, r5, 0x1\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	cmp r5, 0xE\n\
	bne _080B08EA\n\
	movs r5, 0\n\
	mov r0, r8\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	mov r8, r0\n\
	cmp r7, 0x4\n\
	bne _080B08EA\n\
	cmp r0, 0x1\n\
	bne _080B08EA\n\
	adds r4, 0x9\n\
	lsls r4, 4\n\
	adds r0, r4, 0x2\n\
	movs r1, 0x1\n\
	movs r2, 0x4\n\
	movs r3, 0\n\
	bl BlendPalette\n\
	adds r4, 0x5\n\
	adds r0, r4, 0\n\
	movs r1, 0x1\n\
	movs r2, 0x4\n\
	movs r3, 0\n\
	bl BlendPalette\n\
	b _080B08EA\n\
_080B0896:\n\
	cmp r7, 0x3\n\
	bne _080B08EA\n\
	adds r0, r6, 0x1\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	cmp r6, 0xC\n\
	bne _080B08EA\n\
	movs r6, 0\n\
	adds r0, r4, 0x5\n\
	lsls r0, 4\n\
	adds r4, r0, 0x1\n\
	adds r0, r4, 0\n\
	movs r1, 0x3\n\
	adds r2, r5, 0\n\
	movs r3, 0\n\
	bl BlendPalette\n\
	adds r0, r5, 0x1\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	cmp r5, 0x5\n\
	bne _080B08EA\n\
	ldr r0, _080B0930 @ =gPlttBufferFaded\n\
	lsls r1, r4, 1\n\
	adds r0, r1, r0\n\
	ldrh r2, [r0]\n\
	ldr r0, _080B0934 @ =gPlttBufferUnfaded\n\
	adds r1, r0\n\
	ldrh r0, [r1]\n\
	ldr r1, _080B0938 @ =0x040000d4\n\
	str r2, [r1]\n\
	str r0, [r1, 0x4]\n\
	movs r0, 0x80\n\
	lsls r0, 24\n\
	orrs r7, r0\n\
	str r7, [r1, 0x8]\n\
	ldr r0, [r1, 0x8]\n\
	ldr r1, [sp, 0x8]\n\
	ldr r2, [sp, 0xC]\n\
	adds r0, r1, r2\n\
	add r0, r10\n\
	strh r6, [r0]\n\
_080B08EA:\n\
	ldr r3, [sp, 0x10]\n\
	lsls r0, r3, 1\n\
	ldr r1, [sp, 0xC]\n\
	adds r0, r1\n\
	add r0, r10\n\
	mov r2, r8\n\
	strh r2, [r0]\n\
	ldr r3, [sp, 0x14]\n\
	lsls r0, r3, 1\n\
	adds r0, r1\n\
	add r0, r10\n\
	strh r5, [r0]\n\
	ldr r1, [sp, 0x18]\n\
	lsls r0, r1, 1\n\
	ldr r2, [sp, 0xC]\n\
	adds r0, r2\n\
	add r0, r10\n\
	strh r6, [r0]\n\
	ldr r2, _080B093C @ =gTasks\n\
_080B0910:\n\
	ldr r0, [sp, 0x4]\n\
	adds r0, 0x1\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	str r0, [sp, 0x4]\n\
	cmp r0, 0x3\n\
	bhi _080B0920\n\
	b _080B0774\n\
_080B0920:\n\
	movs r4, 0\n\
	ldr r3, [sp, 0x1C]\n\
	ldr r1, [sp]\n\
	adds r0, r3, r1\n\
	lsls r1, r0, 3\n\
	adds r2, 0x8\n\
	adds r0, r1, r2\n\
	b _080B0950\n\
	.align 2, 0\n\
_080B0930: .4byte gPlttBufferFaded\n\
_080B0934: .4byte gPlttBufferUnfaded\n\
_080B0938: .4byte 0x040000d4\n\
_080B093C: .4byte gTasks\n\
_080B0940:\n\
	adds r0, r4, 0x1\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	cmp r4, 0x3\n\
	bhi _080B0958\n\
	lsls r0, r4, 3\n\
	adds r0, r1\n\
	adds r0, r2\n\
_080B0950:\n\
	movs r3, 0\n\
	ldrsh r0, [r0, r3]\n\
	cmp r0, 0\n\
	beq _080B0940\n\
_080B0958:\n\
	cmp r4, 0x4\n\
	bne _080B0980\n\
	movs r4, 0\n\
	ldr r3, _080B0990 @ =gSharedMem + 0x19338\n\
	movs r5, 0x3\n\
	negs r5, r5\n\
_080B0964:\n\
	lsls r1, r4, 2\n\
	adds r1, r3\n\
	ldrb r2, [r1, 0x2]\n\
	adds r0, r5, 0\n\
	ands r0, r2\n\
	strb r0, [r1, 0x2]\n\
	adds r0, r4, 0x1\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	cmp r4, 0x3\n\
	bls _080B0964\n\
	ldr r0, [sp]\n\
	bl DestroyTask\n\
_080B0980:\n\
	add sp, 0x20\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080B0990: .4byte gSharedMem + 0x19338\n\
    .syntax divided\n");
}
#endif

void unref_sub_80B0994(u8 a)
{
    if (a != 0)
        sContest.unk1920A_2 = 1;
}

void StartStopFlashJudgeAttentionEye(u8 a)
{
    if (sContestantStatus[a].hasJudgesAttention)
        sub_80B0368(a);
    else
        sub_80B03A8(a);
}

extern const struct CompressedSpriteSheet gUnknown_083CC4B4[];
extern const struct SpritePalette gUnknown_083CC4D4[];
extern const struct SpriteTemplate gSpriteTemplate_83CC53C[];

u8 CreateContestantBoxBlinkSprites(u8 a)
{
    u8 r5 = gContestantTurnOrder[a] * 40 + 32;
    u8 r8;
    u8 r6;
    volatile u8 zero;

    LoadCompressedObjectPic(&gUnknown_083CC4B4[a]);
    LoadSpritePalette(&gUnknown_083CC4D4[a]);
    r8 = CreateSprite(&gSpriteTemplate_83CC53C[a], 184, r5, 29);
    r6 = CreateSprite(&gSpriteTemplate_83CC53C[a], 248, r5, 29);
    gSprites[r6].oam.tileNum += 64;

    CopySpriteTiles(0, 3, (void *)VRAM, (u16 *)(VRAM + 0xE000 + gContestantTurnOrder[a] * 5 * 64 + 0x26), (u8 *)(VRAM + 0x10000 + gSprites[r8].oam.tileNum * 32));
    CopySpriteTiles(0, 3, (void *)VRAM, (u16 *)(VRAM + 0xE000 + gContestantTurnOrder[a] * 5 * 64 + 0x36), (u8 *)(VRAM + 0x10000 + gSprites[r6].oam.tileNum * 32));

    DmaFill32Defvars(3, 0, (void *)(VRAM + 0x10000 + (0x28 + gSprites[r8].oam.tileNum) * 32), 0x300);

    // What is this?
    zero = 0;
    zero = 0;

    DmaFill32Defvars(3, 0, (void *)(VRAM + 0x10000 + (0x28 + gSprites[r6].oam.tileNum) * 32), 0x300);

    gSprites[r8].data[0] = r6;
    gSprites[r6].data[0] = r8;
    gSprites[r8].data[1] = a;
    gSprites[r6].data[1] = a;
    return r8;
}

void DestroyContestantBoxBlinkSprites(u8 spriteId)
{
    u8 spriteId2 = gSprites[spriteId].data[0];

    FreeSpriteOamMatrix(&gSprites[spriteId2]);
    DestroySprite(&gSprites[spriteId2]);
    DestroySpriteAndFreeResources(&gSprites[spriteId]);
}

void SetBlendForContestantBoxBlink(void)
{
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = 0x0907;
}

void ResetBlendForContestantBoxBlink(void)
{
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
}

void BlinkContestantBox(u8 a, bool8 b)
{
    u8 r5;

    SetBlendForContestantBoxBlink();
    eContestGfxState[gSprites[a].data[1]].boxBlinking = 1;
    r5 = gSprites[a].data[0];
    StartSpriteAffineAnim(&gSprites[a], 1);
    StartSpriteAffineAnim(&gSprites[r5], 1);
    gSprites[a].callback = SpriteCB_BlinkContestantBox;
    gSprites[r5].callback = SpriteCallbackDummy;
    if (b == FALSE)
        PlaySE(SE_CONTEST_MONS_TURN);
    else
        PlaySE(SE_PC_LOGIN);
}

void SpriteCB_BlinkContestantBox(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        u8 r1 = sprite->data[0];

        if (gSprites[r1].affineAnimEnded)
        {
            sprite->invisible = TRUE;
            gSprites[r1].invisible = TRUE;
            sprite->callback = SpriteCB_EndBlinkContestantBox;
        }
    }
}

void SpriteCB_EndBlinkContestantBox(struct Sprite *sprite)
{
    eContestGfxState[sprite->data[1]].boxBlinking = 0;
    DestroyContestantBoxBlinkSprites(sprite->data[0]);
    ResetBlendForContestantBoxBlink();
}

void Unused_EndBlinkingState(u8 a, int unused)
{
    eContestGfxState[a].boxBlinking = 0;
}

void ContestDebugTogglePointTotal(void)
{
    eEnableContestDebugging ^= 1;
    if (eEnableContestDebugging == 0)
    {
        u8 i;

        for (i = 0; i < 4; i++)
        {
            Text_FillWindowRectDefPalette(
                &gWindowTemplate_Contest_MoveDescription,
                0,
                gUnknown_083CA308[i][0],
                gUnknown_083CA308[i][1],
                gUnknown_083CA310[i][0] + 5,
                gUnknown_083CA310[i][1] + 1);
        }
        DrawContestantWindowText();
        SwapMoveDescAndContestTilemaps();
    }
    else
    {
        ContestDebugDoPrint();
    }
}

void ContestDebugDoPrint(void)
{
    u8 r5 = 0;
    u8 sp8[8];

    if (eEnableContestDebugging != 0)
    {
        u8 i;
        s16 r2;

        for (i = 0; i < 4; i++)
        {
            Text_FillWindowRectDefPalette(
                &gWindowTemplate_Contest_MoveDescription,
                0,
                gUnknown_083CA308[i][0],
                gUnknown_083CA308[i][1],
                gUnknown_083CA310[i][0] + 5,
                gUnknown_083CA310[i][1] + 1);
        }
        for (i = 0; i < 4; i++)
        {
            r2 = sContestantStatus[i].pointTotal;
            if (r2 < 0)
            {
                r2 = -r2;
                sp8[0] = CHAR_HYPHEN;
                r5++;
            }
            ConvertIntToDecimalStringN(sp8 + r5, r2, 0, 4);
            Text_InitWindowAndPrintText(
                &gWindowTemplate_Contest_MoveDescription,
                sp8,
                592 + gContestantTurnOrder[i] * 22,
                gUnknown_083CA310[gContestantTurnOrder[i]][0],
                gUnknown_083CA310[gContestantTurnOrder[i]][1]);
            r5 = 0;
        }
        for (i = 0; i < 4; i++)
        {
            r2 = sContestantStatus[i].appeal;
            if (r2 < 0)
            {
                r2 = -r2;
                sp8[0] = CHAR_HYPHEN;
                r5++;
            }
            ConvertIntToDecimalStringN(sp8 + r5, r2, 0, 4);
            Text_InitWindowAndPrintText(
                &gWindowTemplate_Contest_MoveDescription,
                sp8,
                512 + gContestantTurnOrder[i] * 20,
                gUnknown_083CA308[gContestantTurnOrder[i]][0],
                gUnknown_083CA308[gContestantTurnOrder[i]][1]);
            r5 = 0;
        }
        SwapMoveDescAndContestTilemaps();
    }
}

void unref_sub_80B0EE8(s32 *a, s32 b)
{
    s32 i;
    s32 j;

    for (i = 0; i < b - 1; i++)
    {
        for (j = b - 1; j > i; j--)
        {
            if (a[j - 1] > a[j])
            {
                s32 temp = a[j];

                a[j] = a[j - 1];
                a[j - 1] = temp;
            }
        }
    }
}

// something to do with contest NPC opponents, I think.
void SortContestants(u8 a)
{
    u8 sp0[4];
    u16 sp4[4] = {0};
    s32 i;
    s32 r2;
    s32 r4;

    // Generate a unique random number for each contestant.
    for (i = 0; i < 4; i++)
    {
        sp4[i] = Random();

        // Loop through all the numbers generated so far.
        for (r2 = 0; r2 < i; r2++)
        {
            if (sp4[i] == sp4[r2])
            {
                // This number isn't unique; try generating again.
                i--;
                break;
            }
        }
    }

    if (a == 0)
    {
        // Order based on the results of the Conditions round using Insertion Sort.
        // Use the randomOrdering to break ties.
        for (i = 0; i < 4; i++)
        {
            // Append this contestant to the list.
            gContestantTurnOrder[i] = i;

            // Determine where the contestant should be ordered.
            for (r4 = 0; r4 < i; r4++)
            {
                if (gContestMonRound1Points[gContestantTurnOrder[r4]] < gContestMonRound1Points[i]
                    || (gContestMonRound1Points[gContestantTurnOrder[r4]] == gContestMonRound1Points[i] && sp4[gContestantTurnOrder[r4]] < sp4[i]))
                {
                    // Shift everything larger up to make room.
                    for (r2 = i; r2 > r4; r2--)
                        gContestantTurnOrder[r2] = gContestantTurnOrder[r2 - 1];

                    // Insert into the new spot.
                    gContestantTurnOrder[r4] = i;
                    break;
                }
            }

            // This is redundant.
            // Perhaps GF switched from true insertion sort to in-place insertion sort, and forgot to
            // remove this check?
            if (r4 == i)
                gContestantTurnOrder[i] = i;
        }

        // Invert gContestantTurnOrder; above, it was a list of contestant IDs. Now it's a list of turn orderings.
        //
        // For example, if contestant 3 had the first turn, then `gContestantTurnOrder[1] = 3`. The turn is the index,
        // the contestant is the data. After inverting the list, `gContestantTurnOrder[3] = 1`. The contestant is the index,
        // and the turn is the data.
        memcpy(sp0, gContestantTurnOrder, sizeof(sp0));
        for (i = 0; i < 4; i++)
            gContestantTurnOrder[sp0[i]] = i;
    }
    else
    {
        // Order contestants based on their ranking.
        // If contestants have tied ranking, fill in the next available slot.
        //
        // Note that ranking is calculated so that shared places still take up a ranking
        // space. A ranking like [1, 2, 2, 3] is not possible; it would be [1, 2, 2, 4]
        // instead.
        memset(sp0, 0xFF, sizeof(sp0));
        for (i = 0; i < 4; i++)
        {
            u8 r2_2 = sContestantStatus[i].ranking;

            while (1)
            {
                u8 *ptr = &sp0[r2_2];
                if (*ptr == 0xFF)
                {
                    *ptr = i;
                    gContestantTurnOrder[i] = r2_2;
                    break;
                }
                r2_2++;
            }
        }

        // Randomize the order of contestants with tied rankings using Selection Sort.
        //
        // Look through the array for tied ranks, and use randomOrdering to break the tie.
        // This ensures that contestants with the same rank will be randomly ordered. This
        // uses an in-place slection sort, which involves a lot of extra swapping.
        for (i = 0; i < 3; i++)
        {
            for (r4 = 3; r4 > i; r4--)
            {
                if (sContestantStatus[r4 - 1].ranking == sContestantStatus[r4].ranking && gContestantTurnOrder[r4 - 1] < gContestantTurnOrder[r4]
                    && sp4[r4 - 1] < sp4[r4])
                {
                    u8 temp = gContestantTurnOrder[r4];

                    gContestantTurnOrder[r4] = gContestantTurnOrder[r4 - 1];
                    gContestantTurnOrder[r4 - 1] = temp;
                }
            }
        }
    }
}

void DrawContestantWindows(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        s32 windowId = i + 5;
        LoadPalette(
            eContestTempSave.cachedWindowPalettes[windowId], (gContestantTurnOrder[i] + 5) * 16, 32);
    }
    DrawContestantWindowText();
}

void CalculateAppealMoveImpact(u8 contestant)
{
    bool8 r8;
    s32 i;

    sContestantStatus[contestant].appeal = 0;
    sContestantStatus[contestant].baseAppeal = 0;
    r8 = ContestantCanUseTurn(contestant);
    if (r8)
    {
        u16 move = sContestantStatus[contestant].currMove;
        u8 effect = gContestMoves[move].effect;
        u8 rnd;

        sContestantStatus[contestant].moveCategory = gContestMoves[sContestantStatus[contestant].currMove].contestCategory;
        if (sContestantStatus[contestant].currMove == sContestantStatus[contestant].prevMove && sContestantStatus[contestant].currMove != MOVE_NONE)
        {
            sContestantStatus[contestant].repeatedMove = TRUE;
            sContestantStatus[contestant].moveRepeatCount++;
        }
        else
        {
            sContestantStatus[contestant].moveRepeatCount = 0;
        }
        sContestantStatus[contestant].baseAppeal = gContestEffects[effect].appeal;
        sContestantStatus[contestant].appeal = gContestEffects[effect].appeal;
        eContestAppealResults.jam = gContestEffects[effect].jam;
        eContestAppealResults.jam2 = gContestEffects[effect].jam;
        eContestAppealResults.contestant = contestant;
        for (i = 0; i < 4; i++)
        {
            sContestantStatus[i].jam = 0;
            eContestAppealResults.unnervedPokes[i] = 0;
        }
        if (sContestantStatus[contestant].hasJudgesAttention && AreMovesContestCombo(sContestantStatus[contestant].prevMove, sContestantStatus[contestant].currMove) == 0)
            sContestantStatus[contestant].hasJudgesAttention = 0;
        gContestEffectFuncs[effect]();
        if (sContestantStatus[contestant].conditionMod == 1)
            sContestantStatus[contestant].appeal += sContestantStatus[contestant].condition - 10;
        else if (sContestantStatus[contestant].appealTripleCondition)
            sContestantStatus[contestant].appeal += sContestantStatus[contestant].condition * 3;
        else
            sContestantStatus[contestant].appeal += sContestantStatus[contestant].condition;
        sContestantStatus[contestant].completedCombo = 0;
        sContestantStatus[contestant].usedComboMove = 0;
        if (IsContestantAllowedToCombo(contestant))
        {
            u8 completedCombo = AreMovesContestCombo(sContestantStatus[contestant].prevMove, sContestantStatus[contestant].currMove);

            if (completedCombo != 0 && sContestantStatus[contestant].hasJudgesAttention)
            {
                sContestantStatus[contestant].completedCombo = completedCombo;
                sContestantStatus[contestant].usedComboMove = 1;
                sContestantStatus[contestant].hasJudgesAttention = 0;
                sContestantStatus[contestant].comboAppealBonus = sContestantStatus[contestant].baseAppeal * sContestantStatus[contestant].completedCombo;
                sContestantStatus[contestant].completedComboFlag = 1;
            }
            else
            {
                if (gContestMoves[sContestantStatus[contestant].currMove].comboStarterId != 0)
                {
                    sContestantStatus[contestant].hasJudgesAttention = 1;
                    sContestantStatus[contestant].usedComboMove = 1;
                }
                else
                {
                    sContestantStatus[contestant].hasJudgesAttention = 0;
                }
            }
        }
        if (sContestantStatus[contestant].repeatedMove)
            sContestantStatus[contestant].repeatJam = (sContestantStatus[contestant].moveRepeatCount + 1) * 10;
        if (sContestantStatus[contestant].nervous)
        {
            sContestantStatus[contestant].hasJudgesAttention = 0;
            sContestantStatus[contestant].appeal = 0;
            sContestantStatus[contestant].baseAppeal = 0;
        }
        eContestExcitement.moveExcitement = Contest_GetMoveExcitement(sContestantStatus[contestant].currMove);
        if (sContestantStatus[contestant].overrideCategoryExcitementMod)
            eContestExcitement.moveExcitement = 1;
        if (eContestExcitement.moveExcitement > 0)
        {
            if (sContest.applauseLevel + eContestExcitement.moveExcitement > 4)
                eContestExcitement.excitementAppealBonus = 60;
            else
                eContestExcitement.excitementAppealBonus = 10;
        }
        else
        {
            eContestExcitement.excitementAppealBonus = 0;
        }

        rnd = Random() % 3;
        for (i = 0; i < 4; i++)
        {
            if (i != contestant)
            {
                if (rnd == 0)
                    break;
                rnd--;
            }
        }
        sContestantStatus[contestant].contestantAnimTarget = i;
    }
}

void SetContestantEffectStringID(u8 a, u8 b)
{
    sContestantStatus[a].effectStringId = b;
}

void SetContestantEffectStringID2(u8 a, u8 b)
{
    sContestantStatus[a].effectStringId2 = b;
}

void SetStartledString(u8 contestant, u8 jam)
{
    if      (jam >= 60)
        SetContestantEffectStringID(contestant, CONTEST_STRING_TRIPPED_OVER);
    else if (jam >= 40)
        SetContestantEffectStringID(contestant, CONTEST_STRING_LEAPT_UP);
    else if (jam >= 30)
        SetContestantEffectStringID(contestant, CONTEST_STRING_UTTER_CRY);
    else if (jam >= 20)
        SetContestantEffectStringID(contestant, CONTEST_STRING_TURNED_BACK);
    else if (jam >= 10)
        SetContestantEffectStringID(contestant, CONTEST_STRING_LOOKED_DOWN);
}

void PrintAppealMoveResultText(u8 contestant, u8 stringId)
{
    StringCopy(gStringVar1, gContestMons[contestant].nickname);
    StringCopy(gStringVar2, gMoveNames[sContestantStatus[contestant].currMove]);
    if      (gContestMoves[sContestantStatus[eContestAppealResults.contestant].currMove].contestCategory == CONTEST_CATEGORY_COOL)
        StringCopy(gStringVar3, gText_Contest_Shyness);
    else if (gContestMoves[sContestantStatus[eContestAppealResults.contestant].currMove].contestCategory == CONTEST_CATEGORY_BEAUTY)
        StringCopy(gStringVar3, gText_Contest_Anxiety);
    else if (gContestMoves[sContestantStatus[eContestAppealResults.contestant].currMove].contestCategory == CONTEST_CATEGORY_CUTE)
        StringCopy(gStringVar3, gText_Contest_Laziness);
    else if (gContestMoves[sContestantStatus[eContestAppealResults.contestant].currMove].contestCategory == CONTEST_CATEGORY_SMART)
        StringCopy(gStringVar3, gText_Contest_Hesitancy);
    else
        StringCopy(gStringVar3, gText_Contest_Fear);
    StringExpandPlaceholders(gStringVar4, gUnknown_083CC188[stringId]);
    ContestClearGeneralTextWindow();
    Contest_StartTextPrinter(&gMenuWindow, gStringVar4, 776, 1, 15);
}

void MakeContestantNervous(u8 p)
{
    sContestantStatus[p].nervous = 1;
    sContestantStatus[p].currMove = MOVE_NONE;
}

// This function calculates the new turn order for the next round. The
// algorithm first checks for explicit turn assignments in the
// ContestantStatus::nextTurnOrder field of each contestant. The remaining
// turns are assigned such that the turn order will reverse.
//
// For example, if no pokemon have a defined nextTurnOrder, then the 4th
// will become 1st, the 3rd will become 2nd, etc.
//
// Note: This function assumes that multiple pokemon cannot have the same
// nextTurnOrder value.
void ApplyNextTurnOrder(void)
{
    u8 nextContestant = 0;
    s32 i;
    s32 j;
    u8 newTurnOrder[4];
    bool8 isContestantOrdered[4];

    for (i = 0; i < 4; i++)
    {
        newTurnOrder[i] = gContestantTurnOrder[i];
        isContestantOrdered[i] = FALSE;
    }

    for (i = 0; i < 4; i++)
    {
        for (j = 0; j < 4; j++)
        {
            if (sContestantStatus[j].nextTurnOrder == i)
            {
                newTurnOrder[j] = i;
                isContestantOrdered[j] = TRUE;
                break;
            }
        }
        if (j == 4)
        {
            for (j = 0; j < 4; j++)
            {
                if (isContestantOrdered[j] == 0 && sContestantStatus[j].nextTurnOrder == 0xFF)
                {
                    nextContestant = j;
                    j++;
                    break;
                }
            }
            for (; j < 4; j++)
            {
                if (isContestantOrdered[j] == 0 && sContestantStatus[j].nextTurnOrder == 0xFF
                    && gContestantTurnOrder[nextContestant] > gContestantTurnOrder[j])
                    nextContestant = j;
            }
            newTurnOrder[nextContestant] = i;
            isContestantOrdered[nextContestant] = 1;
        }
    }

    for (i = 0; i < 4; i++)
    {
        eContestAppealResults.turnOrder[i] = newTurnOrder[i];
        sContestantStatus[i].nextTurnOrder = 0xFF;
        sContestantStatus[i].turnOrderMod = 0;
        gContestantTurnOrder[i] = newTurnOrder[i];
    }
}

void SpriteCB_JudgeSpeechBubble(struct Sprite *sprite)
{
    if (sprite->data[1]++ > 84)
    {
        sprite->data[1] = 0;
        sprite->invisible = TRUE;
        sprite->callback = SpriteCallbackDummy;
        sContest.waitForJudgeSpeechBubble = 0;
    }
}

void DoJudgeSpeechBubble(u8 a)
{
    u8 spriteId = sContest.judgeSpeechBubbleSpriteId;

    switch (a)
    {
    case 0:
    case 1:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0];
        PlaySE(SE_FAILURE);
        break;
    case 2:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 4;
        PlaySE(SE_SUCCESS);
        break;
    case 3:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 8;
        PlaySE(SE_SUCCESS);
        break;
    case 4:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 12;
        PlaySE(SE_WARP_IN);
        break;
    case 5:  // exactly the same as case 4
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 12;
        PlaySE(SE_WARP_IN);
        break;
    case 6:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 16;
        PlaySE(SE_WARP_IN);
        break;
    case 8:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 24;
        PlaySE(SE_M_HEAL_BELL);
        break;
    case 7:
    default:
        gSprites[spriteId].oam.tileNum = gSprites[spriteId].data[0] + 20;
        PlaySE(SE_WARP_IN);
        break;
    }
    gSprites[spriteId].data[1] = 0;
    gSprites[spriteId].invisible = FALSE;
    gSprites[spriteId].callback = SpriteCB_JudgeSpeechBubble;
    sContest.waitForJudgeSpeechBubble = 1;
}

void UpdateApplauseMeter(void)
{
    s32 i;

    for (i = 0; i < 5; i++)
    {
        const u8 *src;

        if (i < sContest.applauseLevel)
            src = gContestApplauseMeterGfx + 64;
        else
            src = gContestApplauseMeterGfx;
        CpuCopy32(src,      (void *)(VRAM + 0x10000 + (gSprites[sContest.applauseMeterSpriteId].oam.tileNum + 17 + i) * 32), 32);
        CpuCopy32(src + 32, (void *)(VRAM + 0x10000 + (gSprites[sContest.applauseMeterSpriteId].oam.tileNum + 25 + i) * 32), 32);
        if (sContest.applauseLevel > 4)
            StartApplauseOverflowAnimation();
    }
}

UNUSED
void unref_sub_80B19D0(void)
{
    u8 str[20];
    StringCopy(str, gUnknown_083CC2EC);
    Text_InitWindowAndPrintText(&gWindowTemplate_Contest_MoveDescription, str, 680, 0, 0);
}

s8 Contest_GetMoveExcitement(u16 move)
{
    return gContestExcitementTable[gSpecialVar_ContestCategory][gContestMoves[move].contestCategory];
}

// Launches crowd movement task, maybe
u8 StartApplauseOverflowAnimation(void)
{
    u8 taskId = CreateTask(Task_ApplauseOverflowAnimation, 10);

    gTasks[taskId].data[1] = 1;
    gTasks[taskId].data[2] = IndexOfSpritePaletteTag(0x0ABE2);
    return taskId;
}

void Task_ApplauseOverflowAnimation(u8 taskId)
{
    if (++gTasks[taskId].data[0] == 1)
    {
        gTasks[taskId].data[0] = 0;
        if (gTasks[taskId].data[3] == 0)
            gTasks[taskId].data[4]++;
        else
            gTasks[taskId].data[4]--;
        BlendPalette(264 + gTasks[taskId].data[2] * 16, 1, gTasks[taskId].data[4], RGB(31, 31, 31));
        if (gTasks[taskId].data[4] == 0 || gTasks[taskId].data[4] == 16)
        {
            gTasks[taskId].data[3] ^= 1;
            if (sContest.applauseLevel < 5)
            {
                BlendPalette(264 + gTasks[taskId].data[2] * 16, 1, 0, RGB(31, 0, 0));
                DestroyTask(taskId);
            }
        }
    }
}

void SlideApplauseMeterIn(void)
{
    CreateTask(Task_SlideApplauseMeterIn, 10);
    gSprites[sContest.applauseMeterSpriteId].pos2.x = -70;
    gSprites[sContest.applauseMeterSpriteId].invisible = FALSE;
    sContest.applauseMeterIsMoving = 1;
}

void Task_SlideApplauseMeterIn(u8 taskId)
{
    struct Sprite *sprite = &gSprites[sContest.applauseMeterSpriteId];

    gTasks[taskId].data[10] += 1664;
    sprite->pos2.x += gTasks[taskId].data[10] >> 8;
    gTasks[taskId].data[10] = gTasks[taskId].data[10] & 0xFF;
    if (sprite->pos2.x > 0)
        sprite->pos2.x = 0;
    if (sprite->pos2.x == 0)
    {
        sContest.applauseMeterIsMoving = 0;
        DestroyTask(taskId);
    }
}

void SlideApplauseMeterOut(void)
{
    if (gSprites[sContest.applauseMeterSpriteId].invisible == TRUE)
    {
        sContest.applauseMeterIsMoving = 0;
    }
    else
    {
        CreateTask(Task_SlideApplauseMeterOut, 10);
        gSprites[sContest.applauseMeterSpriteId].pos2.x = 0;
        sContest.applauseMeterIsMoving = 1;
    }
}

void Task_SlideApplauseMeterOut(u8 taskId)
{
    struct Sprite *sprite = &gSprites[sContest.applauseMeterSpriteId];

    gTasks[taskId].data[10] += 1664;
    sprite->pos2.x -= gTasks[taskId].data[10] >> 8;
    gTasks[taskId].data[10] = gTasks[taskId].data[10] & 0xFF;
    if (sprite->pos2.x < -70)
        sprite->pos2.x = -70;
    if (sprite->pos2.x == -70)
    {
        sprite->invisible = TRUE;
        sContest.applauseMeterIsMoving = 0;
        DestroyTask(taskId);
    }
}

void ShowAndUpdateApplauseMeter(s8 a)
{
    u8 taskId = CreateTask(Task_ShowAndUpdateApplauseMeter, 5);

    gTasks[taskId].data[0] = a;
    sContest.isShowingApplauseMeter = 1;
}

void Task_ShowAndUpdateApplauseMeter(u8 taskId)
{
    switch (gTasks[taskId].data[10])
    {
    case 0:
        SlideApplauseMeterIn();
        gTasks[taskId].data[10]++;
        break;
    case 1:
        if (!sContest.applauseMeterIsMoving)
        {
            nullsub_18(gTasks[taskId].data[0]);
            gTasks[taskId].data[10]++;
        }
        break;
    case 2:
        if (gTasks[taskId].data[11]++ > 20)
        {
            gTasks[taskId].data[11] = 0;
            UpdateApplauseMeter();
            sContest.isShowingApplauseMeter = 0;
            DestroyTask(taskId);
        }
        break;
    }
}

UNUSED
void HideApplauseMeterNoAnim(void)
{
    gSprites[sContest.applauseMeterSpriteId].pos2.x = 0;
    gSprites[sContest.applauseMeterSpriteId].invisible = FALSE;
}

UNUSED
void ShowApplauseMeterNoAnim(void)
{
    gSprites[sContest.applauseMeterSpriteId].invisible = TRUE;
}

void AnimateAudience(void)
{
    CreateTask(Task_AnimateAudience, 15);
    sContest.animatingAudience = 1;
}

void Task_AnimateAudience(u8 taskId)
{
    if (gTasks[taskId].data[10]++ > 6)
    {
#ifndef NONMATCHING
        register struct Task *task asm("r0");
        register u32 r4 asm("r4") = taskId * 4;
#endif

        gTasks[taskId].data[10] = 0;
        if (gTasks[taskId].data[11] == 0)
        {
            DmaCopy32Defvars(3, ewram16800, (void *)(VRAM + 0x2000), 0x1000);
        }
        else
        {
            DmaCopy32Defvars(3, eUnzippedContestAudience_Gfx, (void *)(VRAM + 0x2000), 0x1000);
            gTasks[taskId].data[12]++;
        }

#ifdef NONMATCHING
        gTasks[taskId].data[11] ^= 1;
        if (gTasks[taskId].data[12] == 9)
#else
        // Why won't this match the normal way?
        asm("add %0, %1, #0\n\t"
            "add %0, %3\n\t"
            "lsl %0, #3\n\t"
            "add %0, %2\n\t"
        : "=r"(task):"r"(r4),"r"(gTasks),"r"(taskId));

        task->data[11] ^= 1;
        if (task->data[12] == 9)
#endif
        {
            sContest.animatingAudience = 0;
            DestroyTask(taskId);
        }
    }
}

#define tBlendColor data[0]
#define tBlendCoeff data[1]

void BlendAudienceBackground(s8 excitementDir, s8 blendDir)
{
    u8 taskId = CreateTask(Task_BlendAudienceBackground, 10);
    u16 blendColor;
    u8 blendCoeff;
    u8 targetBlendCoeff;

    if (excitementDir > 0)
    {
        blendColor = RGB(30, 27, 8);
        if (blendDir > 0)
        {
            blendCoeff = 0;
            targetBlendCoeff = sContest.applauseLevel * 3;
        }
        else
        {
            blendCoeff = sContest.applauseLevel * 3;
            targetBlendCoeff = 0;
        }
    }
    else
    {
        blendColor = 0;
        if (blendDir > 0)
        {
            blendCoeff = 0;
            targetBlendCoeff = 12;
        }
        else
        {
            blendCoeff = 12;
            targetBlendCoeff = 0;
        }
    }
    gTasks[taskId].tBlendColor = blendColor;
    gTasks[taskId].tBlendCoeff = blendCoeff;
    gTasks[taskId].data[2] = blendDir;
    gTasks[taskId].data[3] = targetBlendCoeff;
    // Because this isn't set to TRUE here, the main task doesn't wait for the color blend
    // Unclear if this was intentional or not (perhaps waiting added too much delay). In any case it does nothing now
    sContest.waitForAudienceBlend = 0;
}

void Task_BlendAudienceBackground(u8 taskId)
{
    if (gTasks[taskId].data[10]++ >= 0)
    {
        gTasks[taskId].data[10] = 0;
        if (gTasks[taskId].data[2] > 0)
            gTasks[taskId].tBlendCoeff++;
        else
            gTasks[taskId].tBlendCoeff--;
        BlendPalette(17, 1, gTasks[taskId].tBlendCoeff, gTasks[taskId].tBlendColor);
        BlendPalette(26, 1, gTasks[taskId].tBlendCoeff, gTasks[taskId].tBlendColor);
        if (gTasks[taskId].tBlendCoeff == gTasks[taskId].data[3])
        {
            DestroyTask(taskId);
            sContest.waitForAudienceBlend = 0;
        }
    }
}

#undef tBlendColor
#undef tBlendCoeff

void ShowHideNextTurnGfx(bool8 a)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (sContestantStatus[i].turnOrderMod != 0 && a)
        {
            CpuCopy32(
                GetTurnOrderNumberGfx(i),
                (void *)(VRAM + 0x10000 + (gSprites[eContestGfxState[i].nextTurnSpriteId].oam.tileNum + 5) * 32),
                64);
            gSprites[eContestGfxState[i].nextTurnSpriteId].pos1.y = gUnknown_083CA33C[gContestantTurnOrder[i]];
            gSprites[eContestGfxState[i].nextTurnSpriteId].invisible = FALSE;
        }
        else
        {
            gSprites[eContestGfxState[i].nextTurnSpriteId].invisible = TRUE;
        }
    }
}

const u8 *GetTurnOrderNumberGfx(u8 contestant)
{
    if (sContestantStatus[contestant].turnOrderMod != 1)
        return gContestNextTurnRandomGfx;
    else
        return gContestNextTurnNumbersGfx + sContestantStatus[contestant].nextTurnOrder * 64;
}

void DrawUnnervedSymbols(void)
{
    s32 i;

    for (i = 0; i < 4; i++)
    {
        if (eContestAppealResults.unnervedPokes[i] != 0 && !Contest_IsMonsTurnDisabled(i))
        {
            u8 r4 = gContestantTurnOrder[i] * 5 + 2;
            u16 r0 = GetStatusSymbolTileOffset(i, 3);

            *(u16 *)(VRAM + 0xC000 + r4 * 64 + 0x28) = r0;
            *(u16 *)(VRAM + 0xC000 + r4 * 64 + 0x2A) = r0 + 1;
            *(u16 *)(VRAM + 0xC000 + (r4 + 1) * 64 + 0x28) = r0 + 16;
            *(u16 *)(VRAM + 0xC000 + (r4 + 1) * 64 + 0x2A) = r0 + 17;
            PlaySE(SE_CONTEST_ICON_CHANGE);
        }
    }
}

bool8 IsContestantAllowedToCombo(u8 contestant)
{
    if (sContestantStatus[contestant].repeatedMove || sContestantStatus[contestant].nervous)
        return FALSE;
    else
        return TRUE;
}

void SetBgForCurtainDrop(void)
{
    s32 i;

    ((vBgCnt *)&REG_BG1CNT)->priority = 0;
    ((vBgCnt *)&REG_BG1CNT)->screenSize = 1;
    ((vBgCnt *)&REG_BG1CNT)->areaOverflowMode = 0;

    gBattle_BG1_X = DISPLAY_WIDTH;
    gBattle_BG1_Y = DISPLAY_HEIGHT;
    REG_BG1HOFS = DISPLAY_WIDTH;
    REG_BG1VOFS = DISPLAY_HEIGHT;

    DmaClear32(3, (void *)(VRAM + 0xF000), 0x1000);
    LZDecompressVram(gUnknown_08D17C3C, (void *)(VRAM + 0xF000));

    ((vBgCnt *)&REG_BG1CNT)->charBaseBlock = 0;

    for (i = 0; i < 4; i++)
    {
        gSprites[eContestGfxState[i].sliderHeartSpriteId].oam.priority = 1;
        gSprites[eContestGfxState[i].nextTurnSpriteId].oam.priority = 1;
    }

    ((vBgCnt *)&REG_BG2CNT)->priority = 1;
    ((vBgCnt *)&REG_BG0CNT)->priority = 1;
    ((vBgCnt *)&REG_BG1CNT)->screenSize = 2;
}

void UpdateContestantBoxOrder(void)
{
    s32 i;

    DmaClearLarge32(3, (void *)(VRAM + 0x8000), 0x2000, 0x1000);
    DmaClear32(3, (void *)(VRAM + 0xF000), 0x1000);

    gBattle_BG1_X = 0;
    gBattle_BG1_Y = 0;

    ((vBgCnt *)&REG_BG1CNT)->priority = 1;
    ((vBgCnt *)&REG_BG1CNT)->screenSize = 0;
    ((vBgCnt *)&REG_BG1CNT)->areaOverflowMode = 0;
    ((vBgCnt *)&REG_BG1CNT)->charBaseBlock = 2;

    for (i = 0; i < 4; i++)
    {
        gSprites[eContestGfxState[i].sliderHeartSpriteId].oam.priority = 0;
        gSprites[eContestGfxState[i].nextTurnSpriteId].oam.priority = 0;
    }
}

void Task_StartDropCurtainAtRoundEnd(u8 taskId)
{
    gBattle_BG1_X = 0;
    gBattle_BG1_Y = DISPLAY_HEIGHT;
    PlaySE12WithPanning(SE_CONTEST_CURTAIN_FALL, 0);
    gTasks[taskId].func = Task_UpdateCurtainDropAtRoundEnd;
}

void Task_UpdateCurtainDropAtRoundEnd(u8 taskId)
{
    if ((s16)(gBattle_BG1_Y -= 7) < 0)
        gBattle_BG1_Y = 0;
    if (gBattle_BG1_Y == 0)  // Why cast?
    {
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = 0;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].func = Task_ResetForNextRound;
    }
}

void Task_ResetForNextRound(u8 taskId)
{
    s32 i;

    switch (gTasks[taskId].data[0])
    {
    case 0:
        for (i = 0; i < 4; i++)
            sContest.prevTurnOrder[i] = gContestantTurnOrder[i];
        FillContestantWindowBgs();
        UpdateBlendTaskContestantsData();
        DrawConditionStars();
        DrawContestantWindows();
        ShowHideNextTurnGfx(TRUE);
        UpdateSliderHeartSpriteYPositions();
        gTasks[taskId].data[0] = 1;
        break;
    case 1:
        if (gIsLinkContest & 1)
        {
            u8 taskId2;

            sContest.waitForLink = 1;
            if (IsPlayerLinkLeader())
                SetContestantStatusesForNextRound();
            taskId2 = CreateTask(Task_LinkContest_CommunicateAppealsState, 0);
            SetTaskFuncWithFollowupFunc(
                taskId2, Task_LinkContest_CommunicateAppealsState, Task_EndWaitForLink);
            ContestPrintLinkStandby();
            gTasks[taskId].data[0] = 2;
        }
        else
        {
            SetContestantStatusesForNextRound();
            gTasks[taskId].data[0] = 3;
        }
        break;
    case 2:
        if (!sContest.waitForLink)
            gTasks[taskId].data[0] = 3;
        break;
    case 3:
        DrawStatusSymbols();
        SwapMoveDescAndContestTilemaps();
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = Task_WaitRaiseCurtainAtRoundEnd;
        break;
    }
}

void Task_UpdateRaiseCurtainAtRoundEnd(u8 taskId)
{
    if ((s16)(gBattle_BG1_Y += 7) > DISPLAY_HEIGHT)
        gTasks[taskId].func = Task_UpdateContestantBoxOrder;
}

void Task_WaitRaiseCurtainAtRoundEnd(u8 taskId)
{
    if (gTasks[taskId].data[2] < 10)
    {
        gTasks[taskId].data[2]++;
    }
    else
    {
        if (gTasks[taskId].data[1] == 0)
        {
            if (gTasks[taskId].data[0] == 16)
                gTasks[taskId].data[1]++;
            else
                gTasks[taskId].data[0]++;
        }
        else
        {
            if (gTasks[taskId].data[0] == 0)
            {
                gTasks[taskId].data[1] = 0;
                gTasks[taskId].data[2] = 0;
                gTasks[taskId].func = Task_StartRaiseCurtainAtRoundEnd;
            }
            else
            {
                gTasks[taskId].data[0]--;
            }
        }
    }
}

void Task_StartRaiseCurtainAtRoundEnd(u8 taskId)
{
    if (gTasks[taskId].data[2] < 10)
    {
        gTasks[taskId].data[2]++;
    }
    else
    {
        gTasks[taskId].data[2] = 0;
        PlaySE12WithPanning(SE_CONTEST_CURTAIN_RISE, 0);
        gTasks[taskId].func = Task_UpdateRaiseCurtainAtRoundEnd;
    }
}

void AnimateSliderHearts(u8 animId)
{
    s32 i;
    u8 taskId;

    for (i = 0; i < 4; i++)
    {
        gSprites[eContestGfxState[i].sliderHeartSpriteId].oam.matrixNum = AllocOamMatrix();
        gSprites[eContestGfxState[i].sliderHeartSpriteId].oam.affineMode = 1;
        StartSpriteAffineAnim(&gSprites[eContestGfxState[i].sliderHeartSpriteId], animId);
        if (animId == 2)
        {
            AnimateSprite(&gSprites[eContestGfxState[i].sliderHeartSpriteId]);
            gSprites[eContestGfxState[i].sliderHeartSpriteId].invisible = FALSE;
        }
    }
    taskId = CreateTask(Task_WaitForSliderHeartAnim, 5);
    gTasks[taskId].data[0] = animId;
    sContest.sliderHeartsAnimating = 1;
}

void Task_WaitForSliderHeartAnim(u8 taskId)
{
    s32 i;

    if (gSprites[eContestGfxState[0].sliderHeartSpriteId].affineAnimEnded)
    {
        if ((u8)gTasks[taskId].data[0] == 1)
        {
            for (i = 0; i < 4; i++)
                gSprites[eContestGfxState[i].sliderHeartSpriteId].invisible = TRUE;
        }
        for (i = 0; i < 4; i++)
            FreeSpriteOamMatrix(&gSprites[eContestGfxState[i].sliderHeartSpriteId]);
        sContest.sliderHeartsAnimating = 0;
        DestroyTask(taskId);
    }
}

u16 SanitizeMove(u16 move)
{
    if (move >= NUM_MOVES)
        move = MOVE_POUND;
    return move;
}

u16 SanitizeSpecies(u16 species)
{
    if (species >= NUM_SPECIES)
        species = SPECIES_NONE;
    return species;
}

void SetMoveSpecificAnimData(u8 contestant)
{
    s32 i;
    u16 move = SanitizeMove(sContestantStatus[contestant].currMove);
    u16 species = SanitizeSpecies(gContestMons[contestant].species);
    u8 r5_2;

    memset(&gContestResources__moveAnim, 0, sizeof(gContestResources__moveAnim));
    ClearBattleAnimationVars();
    for (i = 0; i < 4; i++)
        gBattleMonForms[i] = 0;
    switch (move)
    {
    case MOVE_CURSE:
        if (gBaseStats[species].type1 == TYPE_GHOST || gBaseStats[species].type2 == TYPE_GHOST)
            gAnimMoveTurn = 0;
        else
            gAnimMoveTurn = 1;
        break;
    case MOVE_TRANSFORM:
    case MOVE_ROLE_PLAY:
        r5_2 = sContestantStatus[contestant].contestantAnimTarget;
        gContestResources__moveAnim.targetSpecies = SanitizeSpecies(gContestMons[r5_2].species);
        gContestResources__moveAnim.unk10 = gContestMons[r5_2].personality;
        gContestResources__moveAnim.hasTargetAnim = 1;
        break;
    case MOVE_RETURN:
        gAnimFriendship = 0xFF;
        break;
    case MOVE_FRUSTRATION:
        gAnimFriendship = 0;
        break;
    case MOVE_SOLAR_BEAM:
    case MOVE_RAZOR_WIND:
    case MOVE_SKULL_BASH:
    case MOVE_SKY_ATTACK:
        if (sContest.moveAnimTurnCount == 0)
        {
            sContest.moveAnimTurnCount = 2;
            gAnimMoveTurn = 0;
        }
        else
        {
            gAnimMoveTurn = 1;
        }
        break;
    }
    SetBattleTargetSpritePosition();
}

void ClearMoveAnimData(UNUSED u8 contestant)
{
    memset(&gContestResources__moveAnim, 0, sizeof(gContestResources__moveAnim));
    if (sContest.moveAnimTurnCount != 0)
        sContest.moveAnimTurnCount--;
}

void SetMoveAnimAttackerData(u8 contestant)
{
    gContestResources__moveAnim.contestant = contestant;
    gContestResources__moveAnim.species = SanitizeSpecies(gContestMons[contestant].species);
    gContestResources__moveAnim.personality = gContestMons[contestant].personality;
    gContestResources__moveAnim.otId = gContestMons[contestant].otId;
}

void CreateInvisibleBattleTargetSprite(void)
{
    gBattlerSpriteIds[3] = CreateInvisibleSpriteWithCallback(SpriteCallbackDummy);
    InitSpriteAffineAnim(&gSprites[gBattlerSpriteIds[gBattlerTarget]]);
    SetBattleTargetSpritePosition();
}

void SetBattleTargetSpritePosition(void)
{
    struct Sprite *sprite = &gSprites[gBattlerSpriteIds[3]];

    sprite->pos2.x = 0;
    sprite->pos2.y = 0;
    sprite->pos1.x = GetBattlerSpriteCoord(3, 0);
    sprite->pos1.y = GetBattlerSpriteCoord(3, 1);
    sprite->invisible = TRUE;
}

void SelectContestMoveBankTarget(u16 move)
{
    switch (gBattleMoves[move].target)
    {
    case TARGET_UNK2:
    case TARGET_USER:
        gBattlerTarget = 2;
        break;
    case TARGET_SELECTED_POKEMON:
    case TARGET_RANDOM:
    case TARGET_BOTH_ENEMIES:
    case TARGET_ALL_EXCEPT_USER:
    default:
        gBattlerTarget = 3;
        break;
    }
}

bool8 Contest_SaveWinner(u8 rank)
{
    s32 i;
    u8 captionId = Random() % 3;

    // Get the index of the winner among the contestants
    for (i = 0; i < 3; i++)
    {
        if (gContestFinalStandings[i] == 0)
            break;
    }

    // Exit if attempting to save a Pokémon other than the player's to the museum
    if (rank == CONTEST_SAVE_FOR_MUSEUM && i != gContestPlayerMonIndex)
        return FALSE;

    // Adjust the random painting caption depending on the category
    switch (gSpecialVar_ContestCategory)
    {
    case CONTEST_CATEGORY_COOL:
        captionId += 0;
        break;
    case CONTEST_CATEGORY_BEAUTY:
        captionId += 3;
        break;
    case CONTEST_CATEGORY_CUTE:
        captionId += 6;
        break;
    case CONTEST_CATEGORY_SMART:
        captionId += 9;
        break;
    case CONTEST_CATEGORY_TOUGH:
        captionId += 12;
        break;
    }
    if (rank != CONTEST_SAVE_FOR_ARTIST)
    {
        // Save winner in the saveblock
        // Used to save any winner for the Contest Hall or the Museum
        // but excludes the temporary save used by the artist
        u8 saveIdx = GetContestWinnerSaveIdx(rank, TRUE);

        gSaveBlock1.contestWinners[saveIdx].personality = gContestMons[i].personality;
        gSaveBlock1.contestWinners[saveIdx].species = gContestMons[i].species;
        gSaveBlock1.contestWinners[saveIdx].otId = gContestMons[i].otId;
        StringCopy(gSaveBlock1.contestWinners[saveIdx].nickname, gContestMons[i].nickname);
        StringCopy(gSaveBlock1.contestWinners[saveIdx].trainerName, gContestMons[i].trainerName);
        if (rank != CONTEST_SAVE_FOR_MUSEUM)
            gSaveBlock1.contestWinners[saveIdx].contestCategory = gSpecialVar_ContestCategory;
        else
            gSaveBlock1.contestWinners[saveIdx].contestCategory = captionId;
    }
    else
    {
        eCurContestWinner.personality = gContestMons[i].personality;
        eCurContestWinner.otId = gContestMons[i].otId;
        eCurContestWinner.species = gContestMons[i].species;
        StringCopy(eCurContestWinner.nickname, gContestMons[i].nickname);
        if (gIsLinkContest & 1)
            StringCopy(eCurContestWinner.trainerName, gLinkPlayers[i].name);
        else
            StringCopy(eCurContestWinner.trainerName, gContestMons[i].trainerName);
        eCurContestWinner.contestCategory = captionId;
    }
    return TRUE;
}

// Rank is either a regular contest rank (for saving winners to show in the Contest Hall)
// Or one of two special IDs listed below (for saving winners to show in Museum, or from the artist)
// If just retrieving the index where the winner *would* go, shift is FALSE
// If actually preparing to insert the winner into the saveblock, shift is TRUE
u8 GetContestWinnerSaveIdx(u8 rank, u8 shift)
{
    s32 i;

    switch (rank)
    {
    case CONTEST_RANK_NORMAL:
    case CONTEST_RANK_SUPER:
        return rank;
    case CONTEST_RANK_HYPER:
        if (shift)
        {
            for (i = CONTEST_WINNER_HYPER_3 - 1; i > CONTEST_WINNER_HYPER_1 - 1; i--)
                memcpy(&gSaveBlock1.contestWinners[i], &gSaveBlock1.contestWinners[i - 1], sizeof(struct ContestWinner));
        }
        return CONTEST_WINNER_HYPER_1 - 1;
    case CONTEST_RANK_MASTER:
        if (shift)
        {
            for (i = CONTEST_WINNER_MASTER_3 - 1; i > CONTEST_WINNER_MASTER_1 - 1; i--)
                memcpy(&gSaveBlock1.contestWinners[i], &gSaveBlock1.contestWinners[i - 1], sizeof(struct ContestWinner));
        }
        return CONTEST_WINNER_MASTER_1 - 1;
    default:
//  case CONTEST_SAVE_FOR_MUSEUM:
//  case CONTEST_SAVE_FOR_ARTIST:
        switch (gSpecialVar_ContestCategory)
        {
        case CONTEST_CATEGORY_COOL:
            return CONTEST_WINNER_MUSEUM_COOL - 1;
        case CONTEST_CATEGORY_BEAUTY:
            return CONTEST_WINNER_MUSEUM_BEAUTY - 1;
        case CONTEST_CATEGORY_CUTE:
            return CONTEST_WINNER_MUSEUM_CUTE - 1;
        case CONTEST_CATEGORY_SMART:
            return CONTEST_WINNER_MUSEUM_SMART - 1;
        case CONTEST_CATEGORY_TOUGH:
        default:
            return CONTEST_WINNER_MUSEUM_TOUGH - 1;
        }
    }
}

void Contest_ResetWinners(void)
{
    s32 i;

    for (i = 0; i < 8; i++)
        gSaveBlock1.contestWinners[i] = gDefaultContestWinners[i];
}

