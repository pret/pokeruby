#include "global.h"
#include "battle.h"
#include "battle_interface.h"
#include "decompress.h"
#include "palette.h"
#include "pokedex.h"
#include "pokemon.h"
#include "rom_8077ABC.h"
#include "safari_zone.h"
#include "constants/songs.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "ewram.h"
#include "graphics.h"
#include "pokemon_summary_screen.h"

struct BattleBar
{
    u8 healthboxSpriteId;
    u32 maxValue;
    u32 oldValue;
    u32 receivedValue;
    int currValue;
};

static void sub_8043CEC(struct Sprite *sprite);
static void sub_8045030(struct Sprite *sprite);
static void sub_804507C(struct Sprite *sprite);

const struct OamData gOamData_820A4E4 =
{
    .shape = 1,
    .size = 3,
    .priority = 1,
};

const struct SpriteTemplate gSpriteTemplates_820A4EC[] =
{
    {
        .tileTag = 55039,
        .paletteTag = 55039,
        .oam = &gOamData_820A4E4,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = 55040,
        .paletteTag = 55039,
        .oam = &gOamData_820A4E4,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
};

const struct SpriteTemplate gSpriteTemplates_820A51C[] =
{
    {
        .tileTag = 55041,
        .paletteTag = 55039,
        .oam = &gOamData_820A4E4,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
    {
        .tileTag = 55042,
        .paletteTag = 55039,
        .oam = &gOamData_820A4E4,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = SpriteCallbackDummy,
    },
};

const struct SpriteTemplate gSpriteTemplate_820A54C =
{
    .tileTag = 55051,
    .paletteTag = 55039,
    .oam = &gOamData_820A4E4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

const struct OamData gOamData_820A564 =
{
    .shape = 1,
    .size = 1,
    .priority = 1,
};

const struct SpriteTemplate gSpriteTemplates_820A56C[] =
{
    {
        .tileTag = 55044,
        .paletteTag = 55044,
        .oam = &gOamData_820A564,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_8043CEC,
    },
    {
        .tileTag = 55045,
        .paletteTag = 55044,
        .oam = &gOamData_820A564,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_8043CEC,
    },
    {
        .tileTag = 55046,
        .paletteTag = 55044,
        .oam = &gOamData_820A564,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_8043CEC,
    },
    {
        .tileTag = 55047,
        .paletteTag = 55044,
        .oam = &gOamData_820A564,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_8043CEC,
    },
};

const struct Subsprite gSubspriteTable_820A5CC[] =
{
    { .x = -16, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =  0, .size = 3 }, // size := 64x32
    { .x =  48, .y =  0, .shape =      ST_OAM_SQUARE, .priority = 1, .tileOffset = 32, .size = 2 }, // size := 32x32
    { .x = -16, .y = 32, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset = 48, .size = 1 }, // size := 32x8
    { .x =  16, .y = 32, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset = 52, .size = 1 }, // size := 32x8
    { .x =  48, .y = 32, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset = 56, .size = 1 }, // size := 32x8
};

const struct Subsprite gSubspriteTable_820A5F4[] =
{
    { .x = -16, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset = 64, .size = 3 }, // size := 64x32
    { .x =  48, .y =  0, .shape =      ST_OAM_SQUARE, .priority = 1, .tileOffset = 96, .size = 2 }, // size := 32x32
    { .x = -16, .y = 32, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =112, .size = 1 }, // size := 32x8
    { .x =  16, .y = 32, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =116, .size = 1 }, // size := 32x8
    { .x =  48, .y = 32, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =120, .size = 1 }, // size := 32x8
};

const struct Subsprite gSubspriteTable_820A61C[] =
{
    { .x = -16, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =  0, .size = 3 }, // size := 64x32
    { .x =  48, .y =  0, .shape =      ST_OAM_SQUARE, .priority = 1, .tileOffset = 32, .size = 2 }, // size := 32x32
};

const struct Subsprite gSubspriteTable_820A62C[] =
{
    { .x = -16, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =  0, .size = 3 }, // size := 64x32
    { .x =  48, .y =  0, .shape =      ST_OAM_SQUARE, .priority = 1, .tileOffset = 32, .size = 2 }, // size := 32x32
};

const struct Subsprite gSubspriteTable_820A63C[] =
{
    { .x = -16, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =  0, .size = 1 }, // size := 32x8
    { .x =  16, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =  4, .size = 1 }, // size := 32x8
};

const struct Subsprite gSubspriteTable_820A64C[] =
{
    { .x = -16, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =  0, .size = 1 }, // size := 32x8
    { .x =  16, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =  4, .size = 1 }, // size := 32x8
    { .x = -32, .y =  0, .shape =      ST_OAM_SQUARE, .priority = 1, .tileOffset =  8, .size = 0 }, // size := 8x8
};

const struct SubspriteTable gSubspriteTables_unreferenced[] =
{
    { ARRAY_COUNT(gSubspriteTable_820A5CC), gSubspriteTable_820A5CC },
    { ARRAY_COUNT(gSubspriteTable_820A61C), gSubspriteTable_820A61C },
    { ARRAY_COUNT(gSubspriteTable_820A5F4), gSubspriteTable_820A5F4 },
    { ARRAY_COUNT(gSubspriteTable_820A62C), gSubspriteTable_820A62C },
};

const struct SubspriteTable gSubspriteTables_820A684[] =
{
    { ARRAY_COUNT(gSubspriteTable_820A63C), gSubspriteTable_820A63C },
    { ARRAY_COUNT(gSubspriteTable_820A64C), gSubspriteTable_820A64C },
};

const struct Subsprite gSubspriteTable_820A694[] =
{
    { .x = -96, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =  0, .size = 1 }, // size := 32x8
    { .x = -64, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =  4, .size = 1 }, // size := 32x8
    { .x = -32, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =  8, .size = 1 }, // size := 32x8
    { .x =   0, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset = 12, .size = 1 }, // size := 32x8
};

const struct Subsprite gSubspriteTable_820A6B4[] =
{
    { .x = -96, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =  0, .size = 1 }, // size := 32x8
    { .x = -64, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =  4, .size = 1 }, // size := 32x8
    { .x = -32, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =  8, .size = 1 }, // size := 32x8
    { .x =   0, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =  8, .size = 1 }, // size := 32x8
    { .x =  32, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset =  8, .size = 1 }, // size := 32x8
    { .x =  64, .y =  0, .shape = ST_OAM_H_RECTANGLE, .priority = 1, .tileOffset = 12, .size = 1 }, // size := 32x8
};

const struct SubspriteTable gSubspriteTables_820A6E4[] =
{
    { ARRAY_COUNT(gSubspriteTable_820A694), gSubspriteTable_820A694 },
};

const struct SubspriteTable gSubspriteTables_820A6EC[] =
{
    { ARRAY_COUNT(gSubspriteTable_820A6B4), gSubspriteTable_820A6B4 },
};

// unused dakuten/handakuten tiles
const u8 gUnusedDakuten[] = INCBIN_U8("graphics/unused/dakuten.4bpp");

const struct CompressedSpriteSheet gUnknown_0820A754[] =
{
    { gBattleGfx_BallStatusBar, 512, 0xd70c },
    { gBattleGfx_BallStatusBar, 512, 0xd70d },
};

const struct SpritePalette gUnknown_0820A764[] =
{
    { gUnknown_08D1212C, 0xd710 },
    { gUnknown_08D1212C, 0xd711 },
};

const struct SpritePalette gUnknown_0820A774[] =
{
    { gUnknown_08D1214C, 0xd712 },
    { gUnknown_08D1214C, 0xd713 },
};

const struct SpriteSheet gUnknown_0820A784[] =
{
    { Tiles_D129AC, 0x80, 0xd714 },
    { Tiles_D129AC, 0x80, 0xd715 },
};

const struct OamData gOamData_820A794 =
{
    .shape = 1,
    .size = 3,
    .priority = 1,
};

const struct OamData gOamData_820A79C =
{
    .shape = 0,
    .size = 0,
    .priority = 1,
};

const struct SpriteTemplate gSpriteTemplate_820A7A4[] =
{
    {
        .tileTag = 55052,
        .paletteTag = 55056,
        .oam = &gOamData_820A4E4,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_8045030,
    }, {
        .tileTag = 55053,
        .paletteTag = 55057,
        .oam = &gOamData_820A4E4,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_8045030,
    }
};

const struct SpriteTemplate gSpriteTemplate_820A7D4[] = {
    {
        .tileTag = 55060,
        .paletteTag = 55058,
        .oam = &gOamData_820A79C,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_804507C,
    }, {
        .tileTag = 55061,
        .paletteTag = 55059,
        .oam = &gOamData_820A79C,
        .anims = gDummySpriteAnimTable,
        .images = NULL,
        .affineAnims = gDummySpriteAffineAnimTable,
        .callback = sub_804507C,
    }
};

u8 *const gUnknown_0820A804[2] =
{
    OBJ_VRAM0 + 32 * 74,
    OBJ_VRAM0 + 32 * 75,
};

u8 *const gUnknown_0820A80C[2] =
{
    OBJ_VRAM0 + 32 * 41,
    OBJ_VRAM0 + 32 * 42,
};

u8 *const gUnknown_0820A814[2] =
{
    OBJ_VRAM0 + 32 * 42,
    OBJ_VRAM0 + 32 * 43,
};

const u8 gUnknown_0820A81C[] = __("{COLOR DARK_GREY}{HIGHLIGHT RED}                        ");

u8 *const gUnknown_0820A83C[3] =
{
    OBJ_VRAM0 + 32 * 31,
    OBJ_VRAM0 + 32 * 88,
    OBJ_VRAM0 + 32 * 89,
};

u8 *const gUnknown_0820A848[3] =
{
    OBJ_VRAM0 + 32 * 22,
    OBJ_VRAM0 + 32 * 23,
    OBJ_VRAM0 + 32 * 48,
};

u8 *const gUnknown_0820A854[2] =
{
    OBJ_VRAM0 + 32 * 90,
    OBJ_VRAM0 + 32 * 91,
};

u8 *const gUnknown_0820A85C[2] =
{
    OBJ_VRAM0 + 32 * 49,
    OBJ_VRAM0 + 32 * 50,
};

const u8 sEmptyWhiteText_GrayHighlight[] = _("{COLOR DARK_GREY}{HIGHLIGHT RED}              /");

u8 *const gUnknown_0820A87C[6] =
{
    OBJ_VRAM0 + 32 * 0,
    OBJ_VRAM0 + 32 * 1,
    OBJ_VRAM0 + 32 * 2,
    OBJ_VRAM0 + 32 * 3,
    OBJ_VRAM0 + 32 * 4,
    OBJ_VRAM0 + 32 * 5,
};

u8 *const gUnknown_0820A894[2] =
{
    OBJ_VRAM0 + 32 * 6,
    OBJ_VRAM0 + 32 * 7,
};

const u8 gUnknown_0820A89C[] = __("{COLOR DARK_GREY}{HIGHLIGHT TRANSPARENT}              ");
const u8 gUnknown_0820A8B0[] = _("{HIGHLIGHT RED}");

u8 *const gUnknown_0820A8B4[10] =
{
    OBJ_VRAM0 + 32 *  2,
    OBJ_VRAM0 + 32 *  3,
    OBJ_VRAM0 + 32 *  4,
    OBJ_VRAM0 + 32 *  5,
    OBJ_VRAM0 + 32 *  6,
    OBJ_VRAM0 + 32 *  7,
    OBJ_VRAM0 + 32 * 64,
    OBJ_VRAM0 + 32 * 65,
    OBJ_VRAM0 + 32 * 66,
    OBJ_VRAM0 + 32 * 67,
};

u8 *const gUnknown_0820A8DC[10] =
{
    OBJ_VRAM0 + 32 *  1,
    OBJ_VRAM0 + 32 *  2,
    OBJ_VRAM0 + 32 *  3,
    OBJ_VRAM0 + 32 *  4,
    OBJ_VRAM0 + 32 *  5,
    OBJ_VRAM0 + 32 *  6,
    OBJ_VRAM0 + 32 *  7,
    OBJ_VRAM0 + 32 * 32,
    OBJ_VRAM0 + 32 * 33,
    OBJ_VRAM0 + 32 * 34,
};

u8 *const gUnknown_0820A904[10] =
{
    OBJ_VRAM0 + 32 *  2,
    OBJ_VRAM0 + 32 *  3,
    OBJ_VRAM0 + 32 *  4,
    OBJ_VRAM0 + 32 *  5,
    OBJ_VRAM0 + 32 *  6,
    OBJ_VRAM0 + 32 *  7,
    OBJ_VRAM0 + 32 * 32,
    OBJ_VRAM0 + 32 * 33,
    OBJ_VRAM0 + 32 * 34,
    OBJ_VRAM0 + 32 * 35,
};

extern u8 gDisplayedStringBattle[];
extern u8 gBattlersCount;
extern u16 gBattlerPartyIndexes[];
extern u8 gBattlerPositions[];
extern u8 gHealthboxSpriteIds[];

extern u16 gBattleTypeFlags;

extern const u8 BattleText_SafariBalls[];
extern const u8 BattleText_SafariBallsLeft[];
extern const u8 BattleText_HighlightRed[];
extern const u8 gHealthboxElementsGfxTable[][32];

extern const u16 gBattleInterfaceStatusIcons_DynPal[];

#define ABS(n) ((n) >= 0 ? (n) : -(n))
// Used for computing copy destination addresses
#define MACRO1(n) ((n) - (n) / 8 * 8) + 64 * ((n) / 8)

static void sub_8043D5C(struct Sprite *);
static const void *GetHealthboxElementGfxPtr(u8);
/*static*/ void sub_8044210(u8, s16, u8);
/*static*/ void draw_status_ailment_maybe(u8);
extern void sub_8045180(struct Sprite *);
static void sub_8045110(struct Sprite *);
static void sub_8045048(struct Sprite *);
static void sub_8044F70(u8 taskId);
static void sub_8044E74(u8 taskId);
static void sub_8044ECC(u8 taskId);
static u8 sub_80457E8(u8, u8);
static int sub_8045F58(s32, s32, int, int *, u8, u16);
static u8 GetScaledExpFraction(int, int, int, u8);
static void sub_8045D58(u8, u8);
static u8 CalcBarFilledPixels(int a, int b, int c, int *d, u8 *e, u8 f);
static void sub_8046128(struct BattleInterfaceStruct1 *a, int *b, u16 *c);

static int do_nothing(s16 unused1, s16 unused2, int unused3)
{
    return 9;
}

void sub_8043740(s16 number, u16 *dest, bool8 unk)
{
    s8 i, j;
    u8 buff[4];

    for (i = 0; i < 4; i++)
    {
        buff[i] = 0;
    }

    for (i = 3; ; i--)
    {
        if (number > 0)
        {
            buff[i] = number % 10;
            number /= 10;
        }
        else
        {
            for (; i > -1; i--)
            {
                buff[i] = 0xFF;
            }
            if (buff[3] == 0xFF)
                buff[3] = 0;
            break;
        }
    }

    if (!unk)
    {
        for (i = 0, j = 0; i < 4; i++)
        {
            if (buff[j] == 0xFF)
            {
                dest[j + 0x00] &= 0xFC00;
                dest[j + 0x00] |= 0x1E;
                dest[i + 0x20] &= 0xFC00;
                dest[i + 0x20] |= 0x1E;
            }
            else
            {
                dest[j + 0x00] &= 0xFC00;
                dest[j + 0x00] |= 0x14 + buff[j];
                dest[i + 0x20] &= 0xFC00;
                dest[i + 0x20] |= 0x34 + buff[i];
            }
            j++;
        }
    }
    else
    {
        for (i = 0; i < 4; i++)
        {
            if (buff[i] == 0xFF)
            {
                dest[i + 0x00] &= 0xFC00;
                dest[i + 0x00] |= 0x1E;
                dest[i + 0x20] &= 0xFC00;
                dest[i + 0x20] |= 0x1E;
            }
            else
            {
                dest[i + 0x00] &= 0xFC00;
                dest[i + 0x00] |= 0x14 + buff[i];
                dest[i + 0x20] &= 0xFC00;
                dest[i + 0x20] |= 0x34 + buff[i];
            }
        }
    }
}

void unref_sub_80438E0(s16 a, s16 b, u16 *c)
{
    c[4] = 0x1E;
    sub_8043740(b, c, 0);
    sub_8043740(a, c + 5, 1);
}

u8 battle_make_oam_normal_battle(u8 a)
{
    int sp0 = 0;
    u8 spriteId1;
    u8 spriteId2;
    u8 spriteId3;
    struct Sprite *sprite;

    if (!IsDoubleBattle())
    {
        if (GetBattlerSide(a) == 0)
        {
            spriteId1 = CreateSprite(&gSpriteTemplates_820A4EC[0], 240, 160, 1);
            spriteId2 = CreateSpriteAtEnd(&gSpriteTemplates_820A4EC[0], 240, 160, 1);

            gSprites[spriteId1].oam.shape = 0;
            gSprites[spriteId2].oam.shape = 0;
            gSprites[spriteId2].oam.tileNum += 64;
        }
        else
        {
            spriteId1 = CreateSprite(&gSpriteTemplates_820A51C[0], 240, 160, 1);
            spriteId2 = CreateSpriteAtEnd(&gSpriteTemplates_820A51C[0], 240, 160, 1);

            gSprites[spriteId2].oam.tileNum += 32;
            sp0 = 2;
        }
        //_080439F2

        gSprites[spriteId1].oam.affineParam = spriteId2;
        gSprites[spriteId2].data[5] = spriteId1;
        gSprites[spriteId2].callback = sub_8043D5C;
    }
    //_08043A28
    else
    {
        if (GetBattlerSide(a) == 0)
        {
            spriteId1 = CreateSprite(&gSpriteTemplates_820A4EC[GetBattlerPosition(a) / 2], 240, 160, 1);
            spriteId2 = CreateSpriteAtEnd(&gSpriteTemplates_820A4EC[GetBattlerPosition(a) / 2], 240, 160, 1);

            gSprites[spriteId1].oam.affineParam = spriteId2;
            gSprites[spriteId2].data[5] = spriteId1;
            gSprites[spriteId2].oam.tileNum += 32;
            gSprites[spriteId2].callback = sub_8043D5C;
            sp0 = 1;
        }
        //_08043ACC
        else
        {
            spriteId1 = CreateSprite(&gSpriteTemplates_820A51C[GetBattlerPosition(a) / 2], 240, 160, 1);
            spriteId2 = CreateSpriteAtEnd(&gSpriteTemplates_820A51C[GetBattlerPosition(a) / 2], 240, 160, 1);

            gSprites[spriteId1].oam.affineParam = spriteId2;
            gSprites[spriteId2].data[5] = spriteId1;
            gSprites[spriteId2].oam.tileNum += 32;
            gSprites[spriteId2].callback = sub_8043D5C;
            sp0 = 2;
        }
        //_08043B4E
    }
    //_08043B50

    spriteId3 = CreateSpriteAtEnd(&gSpriteTemplates_820A56C[gBattlerPositions[a]], 140, 60, 0);
    sprite = &gSprites[spriteId3];
    SetSubspriteTables(sprite, &gSubspriteTables_820A684[GetBattlerSide(a)]);
    sprite->subspriteMode = 2;
    sprite->oam.priority = 1;
    CpuCopy32(GetHealthboxElementGfxPtr(1), OBJ_VRAM0 + sprite->oam.tileNum * 32, 64);

    gSprites[spriteId1].data[5] = spriteId3;
    gSprites[spriteId1].data[6] = a;
    gSprites[spriteId1].invisible = TRUE;
    gSprites[spriteId2].invisible = TRUE;
    sprite->data[5] = spriteId1;
    sprite->data[6] = sp0;
    sprite->invisible = TRUE;

    return spriteId1;
}

u8 battle_make_oam_safari_battle(void)
{
    u8 spriteId1 = CreateSprite(&gSpriteTemplate_820A54C, 240, 160, 1);
    u8 spriteId2 = CreateSpriteAtEnd(&gSpriteTemplate_820A54C, 240, 160, 1);

    gSprites[spriteId1].oam.shape = 0;
    gSprites[spriteId2].oam.shape = 0;
    gSprites[spriteId2].oam.tileNum += 0x40;
    gSprites[spriteId1].oam.affineParam = spriteId2;
    gSprites[spriteId2].data[5] = spriteId1;
    gSprites[spriteId2].callback = sub_8043D5C;
    return spriteId1;
}

static const void *GetHealthboxElementGfxPtr(u8 a)
{
    return gHealthboxElementsGfxTable[a];
}

static void sub_8043CEC(struct Sprite *sprite)
{
    u8 r5 = sprite->data[5];

    switch (sprite->data[6])
    {
    case 0:
        sprite->x = gSprites[r5].x + 16;
        sprite->y = gSprites[r5].y;
        break;
    case 1:
        sprite->x = gSprites[r5].x + 16;
        sprite->y = gSprites[r5].y;
        break;
    default:
    case 2:
        sprite->x = gSprites[r5].x + 8;
        sprite->y = gSprites[r5].y;
        break;
    }
    sprite->x2 = gSprites[r5].x2;
    sprite->y2 = gSprites[r5].y2;
}

static void sub_8043D5C(struct Sprite *sprite)
{
    u8 data5 = sprite->data[5];

    sprite->x = gSprites[data5].x + 64;
    sprite->y = gSprites[data5].y;
    sprite->x2 = gSprites[data5].x2;
    sprite->y2 = gSprites[data5].y2;
}

void sub_8043D84(u8 a, u8 b, u32 c, u32 d, u32 e)
{
    eBattleBars[a].healthboxSpriteId = b;
    eBattleBars[a].maxValue = c;
    eBattleBars[a].oldValue = d;
    eBattleBars[a].receivedValue = e;
    eBattleBars[a].currValue = -0x8000;
}

void sub_8043DB0(u8 a)
{
    gSprites[a].invisible = TRUE;
    gSprites[gSprites[a].data[5]].invisible = TRUE;
    gSprites[gSprites[a].oam.affineParam].invisible = TRUE;
}

void sub_8043DFC(u8 a)
{
    gSprites[a].invisible = FALSE;
    gSprites[gSprites[a].data[5]].invisible = FALSE;
    gSprites[gSprites[a].oam.affineParam].invisible = FALSE;
}

static void sub_8043E50(u8 spriteId, s16 x, s16 y)
{
    gSprites[spriteId].x = x;
    gSprites[spriteId].y = y;
}

void unref_sub_8043E70(u8 a)
{
    DestroySprite(&gSprites[gSprites[a].oam.affineParam]);
    DestroySprite(&gSprites[gSprites[a].data[5]]);
    DestroySprite(&gSprites[a]);
}

void nullsub_11()
{
}

void UpdateOamPriorityInAllHealthboxes(u8 priority)
{
    s32 i;

    for (i = 0; i < gBattlersCount; i++)
    {
        u8 spriteId1;
        u8 spriteId2;
        u8 spriteId3;

        spriteId1 = gHealthboxSpriteIds[i];
        spriteId2 = gSprites[spriteId1].oam.affineParam;
        spriteId3 = gSprites[spriteId1].data[5];
        gSprites[spriteId1].oam.priority = priority;
        gSprites[spriteId2].oam.priority = priority;
        gSprites[spriteId3].oam.priority = priority;
    }
}

void sub_8043F44(u8 a)
{
    s16 x = 0;
    s16 y = 0;

    if (!IsDoubleBattle())
    {
        if (GetBattlerSide(a) != 0)
        {
            x = 44;
            y = 30;
        }
        else
        {
            x = 158;
            y = 88;
        }
    }
    else
    {
        switch (GetBattlerPosition(a))
        {
        case 0:
            x = 159;
            y = 77;
            break;
        case 2:
            x = 171;
            y = 102;
            break;
        case 1:
            x = 44;
            y = 19;
            break;
        case 3:
            x = 32;
            y = 44;
            break;
        }
    }
    sub_8043E50(gHealthboxSpriteIds[a], x, y);
}

#if ENGLISH
#define CHAR_LV_SEPARATOR CHAR_COLON
#elif GERMAN
#define CHAR_LV_SEPARATOR CHAR_PERIOD
#endif

/*static*/ void sub_8043FC0(u8 a, u8 b)
{
    u8 str[30];
    u8 *const *r7;
    u8 *ptr;
    s32 i;
    s32 two;

    // TODO: Make this a local variable
    memcpy(str, gUnknown_0820A81C, sizeof(str));
    if (!IsDoubleBattle())
    {
        if (GetBattlerSide(gSprites[a].data[6]) == 0)
            r7 = gUnknown_0820A804;
        else
            r7 = gUnknown_0820A80C;
    }
    else
    {
        if (GetBattlerSide(gSprites[a].data[6]) == 0)
            r7 = gUnknown_0820A814;
        else
            r7 = gUnknown_0820A80C;
    }

    ptr = str + 6;
    if (b == 100)
    {
        ptr = ConvertIntToDecimalStringN(ptr, 100, 0, 3);
    }
    else
    {
        *(ptr++) = EXT_CTRL_CODE_BEGIN;
        *(ptr++) = EXT_CTRL_CODE_CLEAR;
        *(ptr++) = 1;
        *(ptr++) = EXT_CTRL_CODE_BEGIN;
        *(ptr++) = EXT_CTRL_CODE_MIN_LETTER_SPACING;
        *(ptr++) = 4;
        *(ptr++) = CHAR_LV_SEPARATOR;
        *(ptr++) = EXT_CTRL_CODE_BEGIN;
        *(ptr++) = EXT_CTRL_CODE_MIN_LETTER_SPACING;
        *(ptr++) = 0;
        ptr = ConvertIntToDecimalStringN(ptr, b, 0, 2);
    }

    *(ptr++) = EXT_CTRL_CODE_BEGIN;
    *(ptr++) = EXT_CTRL_CODE_CLEAR_TO;
    *(ptr++) = 15;
    *(ptr++) = EOS;
    RenderTextHandleBold(eBattleInterfaceGfxBuffer, str);

    two = 2;
    for (i = 0; i < two; i++)
        CpuCopy32(&eBattleInterfaceGfxBuffer[i * 64 + 32], r7[i] + gSprites[a].oam.tileNum * TILE_SIZE_4BPP, TILE_SIZE_4BPP);
}

void sub_80440EC(u8 a, s16 b, u8 c)
{
    u8 str[0x14];
    u8 *ptr;
    s32 foo;
    u8 *const *r4;
    s32 i;
    u8 r8;

    // TODO: make this a local variable
    memcpy(str, sEmptyWhiteText_GrayHighlight, sizeof(str));
    foo = gSprites[a].data[6];

    if (IsDoubleBattle() == TRUE || GetBattlerSide(foo) == 1)
    {
        //_08044136
        sub_8044210(a, b, c);
    }
    else
    {
        //
        ptr = str + 6;
        if (c == 0)
        {
            if (GetBattlerSide(gSprites[a].data[6]) == 0)
                r4 = gUnknown_0820A83C;
            else
                r4 = gUnknown_0820A848;
            r8 = 3;
            ptr = sub_8003504(ptr, b, 19, 1);
            *(ptr++) = CHAR_SLASH;
            *(ptr++) = EOS;
        }
        else
        {
            if (GetBattlerSide(gSprites[a].data[6]) == 0)
                r4 = gUnknown_0820A854;
            else
                r4 = gUnknown_0820A85C;
            r8 = 2;
            ptr = sub_8003504(ptr, b, 15, 1);
        }
        RenderTextHandleBold(eBattleInterfaceGfxBuffer, str);
        //_080441B6
        for (i = 0; i < r8; i++)  // _080440BC
        {
            CpuCopy32(
                &eBattleInterfaceGfxBuffer[i * 64 + 32],
                r4[i] + gSprites[a].oam.tileNum * 32,
                0x20
            );
        }
    }
}

/*static*/ void sub_8044210(u8 a, s16 b, u8 c)
{
    u8 str[0x14];
    u8 *ptr;
    u8 *const *r7;
    int r10;
    int r4;
    int i;

    // TODO: make this a local variable
    memcpy(str, gUnknown_0820A89C, sizeof(str));
    r4 = gSprites[a].data[6];
    if ((gBattleSpriteInfo[r4].hpNumbersNoBars) == 0)
        return;
    ptr = str + 6;
    if (c == 0)
    {
        r7 = gUnknown_0820A87C;
        r10 = 6;
        ptr = sub_8003504(ptr, b, 0x2B, 1);
        *(ptr++) = CHAR_SLASH;
        *(ptr++) = EOS;
    }
    else
    {
        r7 = gUnknown_0820A894;
        r10 = 2;
        sub_8003504(ptr, b, 0xF, 1);
        if (GetBattlerSide(r4) == 0)
        {
            CpuCopy32(GetHealthboxElementGfxPtr(0x74), OBJ_VRAM0 + (gSprites[a].oam.tileNum + 0x34) * 32, 32);
        }
    }
    r4 = gSprites[a].data[5];
    RenderTextHandleBold(eBattleInterfaceGfxBuffer, str);
    for (i = 0; i < r10; i++)
    {
        CpuCopy32((void *)(&eBattleInterfaceGfxBuffer[i * 64 + 32]), r7[i] + gSprites[r4].oam.tileNum * 32, 32);
    }
}

void PrintSafariMonInfo(u8 a, struct Pokemon *pkmn)
{
    u8 text[20];
    s32 j;
    u8* spriteTileNum;
    u8 *barFontGfx;
    u8 i, var, nature, healthBarSpriteId;

    // TODO: make this a local variable
    memcpy(text, sEmptyWhiteText_GrayHighlight, sizeof(text));
    barFontGfx = &eBattleInterfaceGfxBuffer[0x520 + GetBattlerPosition(gSprites[a].data[6]) * 0x180];
    var = 5;
    nature = GetNature(pkmn);
    StringCopy(text + 6, gNatureNames[nature]);
    RenderTextHandleBold(barFontGfx, text);

    for (j = 6, i = 0; i < var; i++, j++)
    {
        u8 elementId;

        if ((text[j] >= 55 && text[j] <= 74) || (text[j] >= 135 && text[j] <= 154))
            elementId = 44;
        else if ((text[j] >= 75 && text[j] <= 79) || (text[j] >= 155 && text[j] <= 159))
            elementId = 45;
        else
            elementId = 43;

        CpuCopy32(GetHealthboxElementGfxPtr(elementId), &barFontGfx[i * 64], 0x20);
    }

    for (j = 1; j < var + 1; j++)
    {
        spriteTileNum = (gSprites[a].oam.tileNum + MACRO1(j)) * TILE_SIZE_4BPP + (void *)OBJ_VRAM0;
        CpuCopy32(barFontGfx, spriteTileNum, 32);
        barFontGfx += 32;

        spriteTileNum = (8 + gSprites[a].oam.tileNum + MACRO1(j)) * TILE_SIZE_4BPP + (void *)OBJ_VRAM0;
        CpuCopy32(barFontGfx, spriteTileNum, 32);
        barFontGfx += 32;
    }

    healthBarSpriteId = gSprites[a].data[5];
    ConvertIntToDecimalStringN(text + 6, gBattleStruct->safariCatchFactor, 1, 2);
    ConvertIntToDecimalStringN(text + 9, gBattleStruct->safariFleeRate, 1, 2);
    text[5] = CHAR_SPACE;
    text[8] = CHAR_SLASH;
    RenderTextHandleBold(eBattleInterfaceGfxBuffer, text);

    for (j = 0; j < 5; j++)
    {
        if (j < 2)
        {
            CpuCopy32(
                &eBattleInterfaceGfxBuffer[j * 64 + 32],
                 ((gSprites[healthBarSpriteId].oam.tileNum + 2 + j) * TILE_SIZE_4BPP) + (void*)(OBJ_VRAM0),
                32
            );
        }
        else
        {
            CpuCopy32(
                &eBattleInterfaceGfxBuffer[j * 64 + 32],
                (void*)(OBJ_VRAM0) + (gSprites[healthBarSpriteId].oam.tileNum + 8 + j - 2) * TILE_SIZE_4BPP, // Must be written as "8 + j - 2" to match
                32
            );
        }
    }
}

extern u8 gUnknown_020297ED;

void SwapHpBarsWithHpText(void)
{
    s32 i;
    u8 spriteId;

    for (i = 0; i < gBattlersCount; i++)
    {
        if (gSprites[gHealthboxSpriteIds[i]].callback == SpriteCallbackDummy
#if DEBUG
         && (gUnknown_020297ED != 0 || GetBattlerSide(i) != 1)
#else
         && GetBattlerSide(i) != 1
#endif
         && (IsDoubleBattle() || GetBattlerSide(i) != 0))
        {
            u8 r6;

            gBattleSpriteInfo[i].hpNumbersNoBars ^= 1;
            r6 = gBattleSpriteInfo[i].hpNumbersNoBars;
            if (GetBattlerSide(i) == 0)
            {

                if (!IsDoubleBattle())
                    continue;
                if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
                    continue;

                if (r6 == 1)
                {
                    spriteId = gSprites[gHealthboxSpriteIds[i]].data[5];

                    CpuFill32(0, OBJ_VRAM0 + gSprites[spriteId].oam.tileNum * 32, 0x100);
                    sub_8044210(gHealthboxSpriteIds[i], GetMonData(&gPlayerParty[gBattlerPartyIndexes[i]], MON_DATA_HP), 0);
                    sub_8044210(gHealthboxSpriteIds[i], GetMonData(&gPlayerParty[gBattlerPartyIndexes[i]], MON_DATA_MAX_HP), 1);
                }
                else
                {
                    draw_status_ailment_maybe(gHealthboxSpriteIds[i]);
                    sub_8045A5C(gHealthboxSpriteIds[i], &gPlayerParty[gBattlerPartyIndexes[i]], 5);
                    CpuCopy32(GetHealthboxElementGfxPtr(0x75), OBJ_VRAM0 + 0x680 + gSprites[gHealthboxSpriteIds[i]].oam.tileNum * 32, 32);
                }
            }
            else
            {
                if (r6 == 1)
                {
                    if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
                    {
                        PrintSafariMonInfo(gHealthboxSpriteIds[i], &gEnemyParty[gBattlerPartyIndexes[i]]);
                    }
                    else
                    {
                        spriteId = gSprites[gHealthboxSpriteIds[i]].data[5];

                        CpuFill32(0, OBJ_VRAM0 + gSprites[spriteId].oam.tileNum * 32, 0x100);
                        sub_8044210(gHealthboxSpriteIds[i], GetMonData(&gEnemyParty[gBattlerPartyIndexes[i]], MON_DATA_HP), 0);
                        sub_8044210(gHealthboxSpriteIds[i], GetMonData(&gEnemyParty[gBattlerPartyIndexes[i]], MON_DATA_MAX_HP), 1);
                    }
                }
                else
                {
                    draw_status_ailment_maybe(gHealthboxSpriteIds[i]);
                    sub_8045A5C(gHealthboxSpriteIds[i], &gEnemyParty[gBattlerPartyIndexes[i]], 5);
                    if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
                        sub_8045A5C(gHealthboxSpriteIds[i], &gEnemyParty[gBattlerPartyIndexes[i]], 4);
                }
            }
            gSprites[gHealthboxSpriteIds[i]].data[7] ^= 1;
        }
    }
}

u8 CreatePartyStatusSummarySprites(u8 a, const struct HpAndStatus *b, u8 c, u8 d)
{
    u8 r7;
    s16 x;
    s16 y;
    s16 r8;
    s16 r5;

    int i, j;
    u8 sp[6];
    s8 sp14;
    u8 sp18;
    u8 taskId;

    if (c == 0 || GetBattlerPosition(a) != 3)
    {
        if (GetBattlerSide(a) == 0)
        {
            r7 = 0;
            x = 136;
            y = 96;
            r8 = 100;
            r5 = -5;
        }
        else
        {
            r7 = 1;
            if (c == 0 || !IsDoubleBattle())
            {
                x = 104;
                y = 40;
            }
            else
            {
                x = 104;
                y = 16;
            }
            r8 = -100;
            r5 = 5;
        }
    }
    else
    {
        r7 = 1;
        x = 104;
        y = 40;
        r8 = -100;
        r5 = 5;
    }
    //_08044884

    for (i = 0, sp14 = 0; i < 6; i++)  //_080448A0
    {
        if (b[i].hp != 0xFFFF)
            sp14++;
    }

    LoadCompressedObjectPic(&gUnknown_0820A754[r7]);
    LoadSpriteSheet(&gUnknown_0820A784[r7]);
    LoadSpritePalette(&gUnknown_0820A764[r7]);
    LoadSpritePalette(&gUnknown_0820A774[r7]);

    sp18 = CreateSprite(&gSpriteTemplate_820A7A4[r7], x, y, 10);
    SetSubspriteTables(&gSprites[sp18], gSubspriteTables_820A6E4);
    gSprites[sp18].x2 = r8;
    gSprites[sp18].data[0] = r5;
    if (r7 != 0)
    {
        gSprites[sp18].x -= 96;
        gSprites[sp18].oam.matrixNum = 8;
    }
    else
    {
        gSprites[sp18].x += 0x60;
    }
    //_0804495A
    for (i = 0; i < 6; i++)  //_08044970
    {
        sp[i] = CreateSpriteAtEnd(&gSpriteTemplate_820A7D4[r7], x, y - 4, 9);
        if (d == 0)
        {
            gSprites[sp[i]].callback = sub_8045180;
        }
        //_080449A0
        if (r7 == 0)
        {
            gSprites[sp[i]].x2 = 0;
            gSprites[sp[i]].y2 = 0;
        }
        //_080449BE
        gSprites[sp[i]].data[0] = sp18;
        if (r7 == 0)
        {
            gSprites[sp[i]].x += 10 * i + 24;
            gSprites[sp[i]].data[1] = 7 * i + 10;
            gSprites[sp[i]].x2 = 120;
        }
        //_08044A18
        else
        {
            gSprites[sp[i]].x -= 10 * (5 - i) + 24;
            gSprites[sp[i]].data[1] = 7 * (6 - i) + 10;
            gSprites[sp[i]].x2 = -120;
        }
        //_08044A56
        gSprites[sp[i]].data[2] = r7;
    }
    //_08044A76
    if (GetBattlerSide(a) == 0)
    {
        for (i = 0; i < 6; i++)  //_08044A9A
        {
            if (gBattleTypeFlags & BATTLE_TYPE_MULTI) // && b[i] != 0xFFFF && b[i]
            {
                if (b[i].hp == 0xFFFF)
                {
                    //_08044AE6
                    gSprites[sp[i]].oam.tileNum++;
                    gSprites[sp[i]].data[7] = 1;
                    // to _08044B52
                }
                else if (b[i].hp == 0)
                {
                    gSprites[sp[i]].oam.tileNum += 3;
                    // to _08044B46
                }
                else if (b[i].status != 0)
                {
                    gSprites[sp[i]].oam.tileNum += 2;
                }
            }
            //_08044ADC
            else
            {
                if (i >= sp14)
                {
                    //_08044AE6
                    gSprites[sp[i]].oam.tileNum++;
                    gSprites[sp[i]].data[7] = 1;
                    // to _08044B52
                }
                else if (b[i].hp == 0)
                {
                    //_08044B14
                    gSprites[sp[i]].oam.tileNum += 3;
                    // to _08044B46
                }
                else if (b[i].status != 0)
                {
                    gSprites[sp[i]].oam.tileNum += 2;
                }
            }
        }
    }
    //_08044B5E
    else
    {
        j = 5;
        for (i = 0; i < 6; i++)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                if (b[i].hp == 0xFFFF)
                {
                    gSprites[sp[j]].oam.tileNum++;
                    gSprites[sp[j]].data[7] = 1;
                }
                else if (b[i].hp == 0)
                {
                    gSprites[sp[j]].oam.tileNum += 3;
                }
                else if (b[i].status != 0)
                {
                    gSprites[sp[j]].oam.tileNum += 2;
                }
                j--;
            }
            else
            {
                if (i >= sp14)
                {
                    gSprites[sp[j]].oam.tileNum++;
                    gSprites[sp[j]].data[7] = 1;
                }
                else if (b[i].hp == 0)
                {
                    gSprites[sp[j]].oam.tileNum += 3;
                }
                else if (b[i].status != 0)
                {
                    gSprites[sp[j]].oam.tileNum += 2;
                }
                j--;
            }
        }
    }
    //_08044C38
    taskId = CreateTask(TaskDummy, 5);
    gTasks[taskId].data[0] = a;
    gTasks[taskId].data[1] = sp18;
    for (i = 0; i < 6; i++)
        gTasks[taskId].data[3 + i] = sp[i];
    gTasks[taskId].data[10] = d;
    PlaySE12WithPanning(SE_BALL_TRAY_ENTER, 0);
    return taskId;
}

void sub_8044CA0(u8 taskId)
{
    u8 sp[6];
    u8 r9;
    u8 r10;
    u8 sp8;
    s32 i;

    r9 = gTasks[taskId].data[10];
    r10 = gTasks[taskId].data[1];
    sp8 = gTasks[taskId].data[0];
    for (i = 0; i < 6; i++)
        sp[i] = gTasks[taskId].data[3 + i];

    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = 0x10;
    gTasks[taskId].data[15] = 16;
    for (i = 0; i < 6; i++)
        gSprites[sp[i]].oam.objMode = 1;
    gSprites[r10].oam.objMode = 1;
    if (r9 != 0)
    {
        for (i = 0; i < 6; i++)
        {
            if (GetBattlerSide(sp8) != 0)
            {
                gSprites[sp[5 - i]].data[1] = 7 * i;
                gSprites[sp[5 - i]].data[3] = 0;
                gSprites[sp[5 - i]].data[4] = 0;
                gSprites[sp[5 - i]].callback = sub_8045110;
            }
            else
            {
                gSprites[sp[i]].data[1] = 7 * i;
                gSprites[sp[i]].data[3] = 0;
                gSprites[sp[i]].data[4] = 0;
                gSprites[sp[i]].callback = sub_8045110;
            }
        }
        gSprites[r10].data[0] /= 2;
        gSprites[r10].data[1] = 0;
        gSprites[r10].callback = sub_8045048;
        SetSubspriteTables(&gSprites[r10], gSubspriteTables_820A6EC);
        gTasks[taskId].func = sub_8044E74;
    }
    else
    {
        gTasks[taskId].func = sub_8044F70;
    }
}

static void sub_8044E74(u8 taskId)
{
    u16 temp = gTasks[taskId].data[11]++;

    if ((temp & 1) == 0)
    {
        gTasks[taskId].data[15]--;
        if (gTasks[taskId].data[15] < 0)
            return;
        REG_BLDALPHA = (gTasks[taskId].data[15]) | ((16 - gTasks[taskId].data[15]) << 8);
    }
    if (gTasks[taskId].data[15] == 0)
        gTasks[taskId].func = sub_8044ECC;
}

static void sub_8044ECC(u8 taskId)
{
    u8 sp[6];
    s32 i;

    gTasks[taskId].data[15]--;
    if (gTasks[taskId].data[15] == -1)
    {
        u8 var = gTasks[taskId].data[1];

        for (i = 0; i < 6; i++)
            sp[i] = gTasks[taskId].data[3 + i];
        DestroySpriteAndFreeResources(&gSprites[var]);
        DestroySpriteAndFreeResources(&gSprites[sp[0]]);
        for (i = 1; i < 6; i++)
            DestroySprite(&gSprites[sp[i]]);
    }
    else if (gTasks[taskId].data[15] == -3)
    {
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        DestroyTask(taskId);
    }
}

static void sub_8044F70(u8 taskId)
{
    u8 sp[6];
    s32 i;

    gTasks[taskId].data[15]--;
    // Same as above function except with this check.
    if (gTasks[taskId].data[15] >= 0)
    {
        REG_BLDALPHA = (gTasks[taskId].data[15]) | ((16 - gTasks[taskId].data[15]) << 8);
    }
    else if (gTasks[taskId].data[15] == -1)
    {
        u8 var = gTasks[taskId].data[1];

        for (i = 0; i < 6; i++)
            sp[i] = gTasks[taskId].data[3 + i];
        DestroySpriteAndFreeResources(&gSprites[var]);
        DestroySpriteAndFreeResources(&gSprites[sp[0]]);
        for (i = 1; i < 6; i++)
            DestroySprite(&gSprites[sp[i]]);
    }
    else if (gTasks[taskId].data[15] == -3)
    {
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        DestroyTask(taskId);
    }
}

static void sub_8045030(struct Sprite *sprite)
{
    if (sprite->x2 != 0)
        sprite->x2 += sprite->data[0];
}

static void sub_8045048(struct Sprite *sprite)
{
    sprite->data[1] += 32;
    if (sprite->data[0] > 0)
        sprite->x2 += sprite->data[1] >> 4;
    else
        sprite->x2 -= sprite->data[1] >> 4;
    sprite->data[1] &= 0xF;
}

static void sub_804507C(struct Sprite *sprite)
{
    u8 r3;
    u16 r2;
    s8 pan;

    if (sprite->data[1] > 0)
    {
        sprite->data[1]--;
        return;
    }
    r3 = sprite->data[2];
    r2 = sprite->data[3];
    r2 += 56;
    sprite->data[3] = r2 & 0xFFF0;
    if (r3 != 0)
    {
        sprite->x2 += r2 >> 4;
        if (sprite->x2 > 0)
            sprite->x2 = 0;
    }
    else
    {
        sprite->x2 -= r2 >> 4;
        if (sprite->x2 < 0)
            sprite->x2 = 0;
    }
    if (sprite->x2 == 0)
    {
        pan = 63;
        if (r3 != 0)
            pan = -64;
        if (sprite->data[7] != 0)
            PlaySE2WithPanning(SE_BALL_TRAY_EXIT, pan);
        else
            PlaySE1WithPanning(SE_BALL_TRAY_BALL, pan);
        sprite->callback = SpriteCallbackDummy;
    }
}

static void sub_8045110(struct Sprite *sprite)
{
    u8 r0;
    u16 r2;

    if (sprite->data[1] > 0)
    {
        sprite->data[1]--;
        return;
    }
    r0 = sprite->data[2];
    r2 = sprite->data[3];
    r2 += 56;
    sprite->data[3] = r2 & 0xFFF0;
    if (r0 != 0)
        sprite->x2 += r2 >> 4;
    else
        sprite->x2 -= r2 >> 4;
    if (sprite->x2 + sprite->x > 248
     || sprite->x2 + sprite->x < -8)
    {
        sprite->invisible = TRUE;
        sprite->callback = SpriteCallbackDummy;
    }
}

void sub_8045180(struct Sprite *sprite)
{
    u8 spriteId = sprite->data[0];

    sprite->x2 = gSprites[spriteId].x2;
    sprite->y2 = gSprites[spriteId].y2;
}

/*static*/ void sub_80451A0(u8 a, struct Pokemon *pkmn)
{
    u8 nickname[POKEMON_NAME_LENGTH];
    u8 gender;
    u16 species;
    u8 language;
    u8 *ptr;
    s32 i;
    s32 _7;
    u8 *const *r1;

    StringCopy(gDisplayedStringBattle, gUnknown_0820A8B0);
    GetMonData(pkmn, MON_DATA_NICKNAME, nickname);
    StringGetEnd10(nickname);
    ptr = StringCopy(gDisplayedStringBattle + 3, nickname);
    ptr[0] = EXT_CTRL_CODE_BEGIN;
    ptr[1] = 3;
    ptr[2] = 2;
    ptr[3] = EXT_CTRL_CODE_BEGIN;
    ptr[4] = 1;
    ptr += 5;
    gender = GetMonGender(pkmn);
    species = GetMonData(pkmn, MON_DATA_SPECIES);
    language = GetMonData(pkmn, MON_DATA_LANGUAGE);
    if (ShouldHideGenderIconForLanguage(species, nickname, language))
        gender = 100;
    switch (gender)
    {
    default:
        ptr[0] = 0xB;
        ptr[1] = EOS;
        ptr += 1;
        break;
    case MON_MALE:
        ptr[0] = 0xB;
        ptr[1] = CHAR_MALE;
        ptr[2] = EOS;
        ptr += 2;
        break;
    case MON_FEMALE:
        ptr[0] = 0xA;
        ptr[1] = CHAR_FEMALE;
        ptr[2] = EOS;
        ptr += 2;
        break;
    }
    ptr[0] = EXT_CTRL_CODE_BEGIN;
    ptr[1] = 0x13;
    ptr[2] = 0x37;
    ptr[3] = EOS;
    ptr = &eBattleInterfaceGfxBuffer[0x520 + GetBattlerPosition(gSprites[a].data[6]) * 0x180];
    RenderTextHandleBold(ptr, gDisplayedStringBattle);

    i = 0;
    _7 = 7;
    if (GetMonData(pkmn, MON_DATA_LANGUAGE) == 1
     && GetMonData(pkmn, MON_DATA_IS_EGG) == 0)
    {
        u8 *p = gDisplayedStringBattle;

        while (*p != EOS)
        {
            if (*p == EXT_CTRL_CODE_BEGIN)
            {
                p += GetExtCtrlCodeLength(p[1]) + 1;
            }
            else
            {
                u8 r0;

                if ((*p >= 0x37 && *p <= 0x4A) || (*p >= 0x87 && *p <= 0x9A))
                    r0 = 0x2C;
                else if ((*p >= 0x4B && *p <= 0x4F) || (*p >= 0x9B && *p <= 0x9F))
                    r0 = 0x2D;
                else
                    r0 = 0x2B;

                CpuCopy32(GetHealthboxElementGfxPtr(r0), ptr + 0x40 * i, 32);
                i++;
                p++;
            }
        }
    }

    for (; i < _7; i++)
        CpuCopy32(GetHealthboxElementGfxPtr(0x2B), ptr + 64 * i, 32);

    if (GetBattlerSide(gSprites[a].data[6]) == 0 && !IsDoubleBattle())
    {
        r1 = (u8 *const *)gUnknown_0820A8B4;
        for (i = 0; i < _7; i++)
        {
            u8 *r4 = r1[i];

            r4 += gSprites[a].oam.tileNum * 32;
            CpuCopy32(ptr, r4, 32);
            ptr += 32;

            r4 += 0x100;
            CpuCopy32(ptr, r4, 32);
            ptr += 32;
        }
    }
    else
    {
        if (GetBattlerSide(gSprites[a].data[6]) == 0)
            r1 = (u8 *const *)gUnknown_0820A904;
        else
            r1 = (u8 *const *)gUnknown_0820A8DC;
        for (i = 0; i < _7; i++)
        {
            u8 *r4 = r1[i];

            r4 += gSprites[a].oam.tileNum * 32;
            CpuCopy32(ptr, r4, 32);
            ptr += 32;

            r4 += 0x100;
            CpuCopy32(ptr, r4, 32);
            ptr += 32;
        }
    }
}

static void sub_8045458(u8 a, u8 b)
{
    u8 r4;

    if (gBattleTypeFlags & 0x200)
        return;
    if (gBattleTypeFlags & 8)
        return;

    r4 = gSprites[a].data[6];
    if (GetBattlerSide(r4) != 0)
    {
        u16 species = GetMonData(&gEnemyParty[gBattlerPartyIndexes[r4]], MON_DATA_SPECIES);
        if (GetSetPokedexFlag(SpeciesToNationalPokedexNum(species), 1) != 0)
        {
            r4 = gSprites[a].data[5];
            if (b != 0)
                CpuCopy32(GetHealthboxElementGfxPtr(0x46), OBJ_VRAM0 + (gSprites[r4].oam.tileNum + 8) * 32, 32);
            else
                CpuFill32(0, OBJ_VRAM0 + (gSprites[r4].oam.tileNum + 8) * 32, 32);
        }
    }
}

/*static*/ void draw_status_ailment_maybe(u8 a)
{
    s32 r4;
    s32 r4_2;
    u8 r7;
    u8 r10;
    s16 r8;
    const u8 *r6;
    u8 r0;
    s32 i;

    r7 = gSprites[a].data[6];
    r10 = gSprites[a].data[5];
    if (GetBattlerSide(r7) == 0)
    {
        r4 = GetMonData(&gPlayerParty[gBattlerPartyIndexes[r7]], MON_DATA_STATUS);
        if (!IsDoubleBattle())
            r8 = 0x1A;
        else
            r8 = 0x12;
    }
    else
    {
        r4 = GetMonData(&gEnemyParty[gBattlerPartyIndexes[r7]], MON_DATA_STATUS);
        r8 = 0x11;
    }
    if (r4 & 7)
    {
        r6 = GetHealthboxElementGfxPtr(sub_80457E8(0x1B, r7));
        r0 = 2;
    }
    else if (r4 & 0x88)
    {
        r6 = GetHealthboxElementGfxPtr(sub_80457E8(0x15, r7));
        r0 = 0;
    }
    else if (r4 & 0x10)
    {
        r6 = GetHealthboxElementGfxPtr(sub_80457E8(0x21, r7));
        r0 = 4;
    }
    else if (r4 & 0x20)
    {
        r6 = GetHealthboxElementGfxPtr(sub_80457E8(0x1E, r7));
        r0 = 3;
    }
    else if (r4 & 0x40)
    {
        r6 = GetHealthboxElementGfxPtr(sub_80457E8(0x18, r7));
        r0 = 1;
    }
    else
    {
        r6 = GetHealthboxElementGfxPtr(0x27);

        for (i = 0; i < 3; i++)
            CpuCopy32(r6, OBJ_VRAM0 + (gSprites[a].oam.tileNum + r8 + i) * 32, 32);

        if (!gBattleSpriteInfo[r7].hpNumbersNoBars)
            CpuCopy32(GetHealthboxElementGfxPtr(1), OBJ_VRAM0 + gSprites[r10].oam.tileNum * 32, 64);

        sub_8045458(a, 1);
        return;
    }

    r4_2 = gSprites[a].oam.paletteNum * 16;
    r4_2 += r7 + 12;
    // I don't like writing the array index like this, but I can't get it to match otherwise.
    FillPalette(r0[gBattleInterfaceStatusIcons_DynPal], r4_2 + 0x100, 2);
    CpuCopy16(gPlttBufferUnfaded + 0x100 + r4_2, (void *)(OBJ_PLTT + r4_2 * 2), 2);
    CpuCopy32(r6, OBJ_VRAM0 + (gSprites[a].oam.tileNum + r8) * 32, 96);
    if (IsDoubleBattle() == TRUE || GetBattlerSide(r7) == TRUE)
    {
        if (!gBattleSpriteInfo[r7].hpNumbersNoBars)
        {
            CpuCopy32(GetHealthboxElementGfxPtr(0), OBJ_VRAM0 + gSprites[r10].oam.tileNum * 32, 32);
            CpuCopy32(GetHealthboxElementGfxPtr(0x41), OBJ_VRAM0 + (gSprites[r10].oam.tileNum + 1) * 32, 32);
        }
    }
    sub_8045458(a, 0);
}

static u8 sub_80457E8(u8 a, u8 b)
{
    u8 ret = a;

    switch (a)
    {
    case 21:
        if (b == 0)
            ret = 21;
        else if (b == 1)
            ret = 71;
        else if (b == 2)
            ret = 86;
        else
            ret = 101;
        break;
    case 24:
        if (b == 0)
            ret = 24;
        else if (b == 1)
            ret = 74;
        else if (b == 2)
            ret = 89;
        else
            ret = 104;
        break;
    case 27:
        if (b == 0)
            ret = 27;
        else if (b == 1)
            ret = 77;
        else if (b == 2)
            ret = 92;
        else
            ret = 107;
        break;
    case 30:
        if (b == 0)
            ret = 30;
        else if (b == 1)
            ret = 80;
        else if (b == 2)
            ret = 95;
        else
            ret = 110;
        break;
    case 33:
        if (b == 0)
            ret = 33;
        else if (b == 1)
            ret = 83;
        else if (b == 2)
            ret = 98;
        else
            ret = 113;
        break;
    }
    return ret;
}

/*static*/ void sub_80458B0(u8 a)
{
    u8 *r6;
    u8 r8;
    u8 i;
    s32 r7;
    u8 *addr;

    r6 = &eBattleInterfaceGfxBuffer[0x520 + GetBattlerPosition(gSprites[a].data[6]) * 0x180];
    r8 = 7;
    RenderTextHandleBold(r6, BattleText_SafariBalls);
    for (i = 0; i < r8; i++)
        CpuCopy32(GetHealthboxElementGfxPtr(0x2B), r6 + i * 64, 32);
    for (r7 = 3; r7 < 3 + r8; r7++)
    {
        addr = OBJ_VRAM0 + (gSprites[a].oam.tileNum + MACRO1(r7)) * 32;
        CpuCopy32(r6, addr, 32);
        r6 += 32;

        addr = OBJ_VRAM0 + (8 + gSprites[a].oam.tileNum + MACRO1(r7)) * 32;
        CpuCopy32(r6, addr, 32);
        r6 += 32;
    }

}

/*static*/ void sub_8045998(u8 a)
{
    u8 *r7;
    u8 status;
    s32 r6;
    s32 i;

    r7 = StringCopy(gDisplayedStringBattle, BattleText_SafariBallsLeft);
    r7 = sub_8003504(r7, gNumSafariBalls, 10, 1);
    StringAppend(r7, BattleText_HighlightRed);
    status = GetBattlerPosition(gSprites[a].data[6]);
    r7 = &eBattleInterfaceGfxBuffer[0x520 + status * 0x180];
    r6 = 5;
    RenderTextHandleBold(r7, gDisplayedStringBattle);
    r7 = &eBattleInterfaceGfxBuffer[0x520 + status * 0x180 + 32];
    for (i = 6; i < 6 + r6; i++)
    {
        CpuCopy32(r7, OBJ_VRAM0 + (gSprites[a].oam.tileNum + 0x18 + MACRO1(i)) * 32, 32);
        r7 += 64;
    }
}

void sub_8045A5C(u8 a, struct Pokemon *pkmn, u8 c)
{
    u8 r10;
    u32 maxhp;
    u32 currhp;

    r10 = gSprites[a].data[6];
    if (GetBattlerSide(r10) == 0)
    {
        if (c == 3 || c == 0)
            sub_8043FC0(a, GetMonData(pkmn, MON_DATA_LEVEL));
        if (c == 1 || c == 0)
            sub_80440EC(a, GetMonData(pkmn, MON_DATA_HP), 0);
        if (c == 2 || c == 0)
            sub_80440EC(a, GetMonData(pkmn, MON_DATA_MAX_HP), 1);
        if (c == 5 || c == 0)
        {
            load_gfxc_health_bar(0);
            maxhp = GetMonData(pkmn, MON_DATA_MAX_HP);
            currhp = GetMonData(pkmn, MON_DATA_HP);
            sub_8043D84(r10, a, maxhp, currhp, 0);
            sub_8045C78(r10, a, 0, 0);
        }
        if (!IsDoubleBattle() && (c == 6 || c == 0))
        {
            u16 species;
            u8 level;
            u32 exp;
            u32 var1;
            u32 var2;
            u32 currLevelExp;

            load_gfxc_health_bar(3);
            species = GetMonData(pkmn, MON_DATA_SPECIES);
            level = GetMonData(pkmn, MON_DATA_LEVEL);
            exp = GetMonData(pkmn, MON_DATA_EXP);
            currLevelExp = gExperienceTables[gBaseStats[species].growthRate][level];
            var1 = exp - currLevelExp;
            var2 = gExperienceTables[gBaseStats[species].growthRate][level + 1] - currLevelExp;
            sub_8043D84(r10, a, var2, var1, 0);
            sub_8045C78(r10, a, 1, 0);
        }
        if (c == 4 || c == 0)
            sub_80451A0(a, pkmn);
        if (c == 9 || c == 0)
            draw_status_ailment_maybe(a);
        if (c == 10)
            sub_80458B0(a);
        if (c == 10 || c == 11)
            sub_8045998(a);
    }
    else
    {
        if (c == 3 || c == 0)
            sub_8043FC0(a, GetMonData(pkmn, MON_DATA_LEVEL));
#if DEBUG
        if (gUnknown_020297ED == 1)
        {
            if (c == 1 || c == 0)
                sub_80440EC(a, GetMonData(pkmn, MON_DATA_HP), 0);
            if (c == 2 || c == 0)
                sub_80440EC(a, GetMonData(pkmn, MON_DATA_MAX_HP), 1);
        }
#endif
        if (c == 5 || c == 0)
        {
            load_gfxc_health_bar(0);
            maxhp = GetMonData(pkmn, MON_DATA_MAX_HP);
            currhp = GetMonData(pkmn, MON_DATA_HP);
            sub_8043D84(r10, a, maxhp, currhp, 0);
            sub_8045C78(r10, a, 0, 0);
        }
        if (c == 4 || c == 0)
            sub_80451A0(a, pkmn);
        if (c == 9 || c == 0)
            draw_status_ailment_maybe(a);
    }
}

s32 sub_8045C78(u8 a, u8 unused1, u8 c, u8 unused2)
{
    s32 r6;

    if (c == 0)
    {
        r6 = sub_8045F58(eBattleBars[a].maxValue, eBattleBars[a].oldValue, eBattleBars[a].receivedValue, &eBattleBars[a].currValue, 6, 1);
    }
    else
    {
        u16 r5;
        s32 r8;

        r5 = GetScaledExpFraction(eBattleBars[a].oldValue, eBattleBars[a].receivedValue, eBattleBars[a].maxValue, 8);
        if (r5 == 0)
            r5 = 1;
        r8 = eBattleBars[a].receivedValue;
        r5 = ABS(r8 / r5);
        r6 = sub_8045F58(eBattleBars[a].maxValue, eBattleBars[a].oldValue, r8, &eBattleBars[a].currValue, 8, r5);
    }
    if (c == 1 || (c == 0 && (!gBattleSpriteInfo[a].hpNumbersNoBars)))
        sub_8045D58(a, c);
    if (r6 == -1)
        eBattleBars[a].currValue = 0;
    return r6;
}

static void sub_8045D58(u8 a, u8 b)
{
    u8 sp8[8];
    u8 r0;
    u8 r8;
    u8 i;

    switch (b)
    {
    case 0:
        r0 = CalcBarFilledPixels(eBattleBars[a].maxValue,
            eBattleBars[a].oldValue,
            eBattleBars[a].receivedValue,
            &eBattleBars[a].currValue,
            sp8,
            6);
        r8 = 3;
        if (r0 <= 0x18)
        {
            r8 = 0x38;
            if (r0 > 9)
                r8 = 0x2F;
        }
        for (i = 0; i < 6; i++)
        {
            u8 r4 = gSprites[eBattleBars[a].healthboxSpriteId].data[5];
            if (i < 2)
                CpuCopy32(GetHealthboxElementGfxPtr(r8) + sp8[i] * 32, OBJ_VRAM0 + (gSprites[r4].oam.tileNum + 2 + i) * 32, 32);
            else
                CpuCopy32(GetHealthboxElementGfxPtr(r8) + sp8[i] * 32, OBJ_VRAM0 + 64 + (i + gSprites[r4].oam.tileNum) * 32, 32);
        }
        break;
    case 1:
        CalcBarFilledPixels(eBattleBars[a].maxValue,
            eBattleBars[a].oldValue,
            eBattleBars[a].receivedValue,
            &eBattleBars[a].currValue,
            sp8,
            8);
        r0 = GetMonData(&gPlayerParty[gBattlerPartyIndexes[a]], MON_DATA_LEVEL);
        if (r0 == 100)
        {
            for (i = 0; i < 8; i++)
                sp8[i] = 0;
        }
        for (i = 0; i < 8; i++)
        {
            if (i < 4)
                CpuCopy32(GetHealthboxElementGfxPtr(0xC) + sp8[i] * 32, OBJ_VRAM0 + (gSprites[eBattleBars[a].healthboxSpriteId].oam.tileNum + 0x24 + i) * 32, 32);
            else
                CpuCopy32(GetHealthboxElementGfxPtr(0xC) + sp8[i] * 32, OBJ_VRAM0 + 0xB80 + (i + gSprites[eBattleBars[a].healthboxSpriteId].oam.tileNum) * 32, 32);
        }
        break;
    }
}

static int sub_8045F58(s32 a, s32 b, int c, int *d, u8 e, u16 f)
{
    u8 r2 = e << 3;
    int r6;
    int ret;

    if (*d == -32768)
    {
        if (a < r2)
            *d = b << 8;
        else
            *d = b;
    }
    //_08045F8A
    b -= c;
    if (b < 0)
        b = 0;
    else if (b > a)
        b = a;
    if (a < r2)
    {
        int var = *d >> 8;

        r6 = *d;
        if (b == var && (r6 & 0xFF) == 0)
            return -1;
    }
    else
    {
        r6 = *d;
        if (b == r6)
            return -1;
    }
    //_08045FC4
    if (a < r2)
    {
        int r0 = (a << 8) / r2;

        if (c < 0)
        {
            *d = r6 + r0;
            ret = *d >> 8;
            if (ret >= b)
            {
                *d = b << 8;
                ret = b;
            }
        }
        //_08045FE2
        else
        {
            *d = r6 - r0;
            ret = *d >> 8;
            if ((*d & 0xFF) > 0)
                ret++;
            if (ret <= b)
            {
                *d = b << 8;
                ret = b;
            }
        }
    }
    else
    {
        //_08045FFE
        if (c < 0)
        {
            *d += f;
            if (*d > b)
                *d = b;
            ret = *d;
        }
        //_08046010
        else
        {
            *d -= f;
            if (*d < b)
                *d = b;
            ret = *d;
        }
    }
    return ret;
}

static u8 CalcBarFilledPixels(int a, int b, int c, int *d, u8 *e, u8 f)
{
    s32 r5 = b - c;
    u8 r3;
    u8 i;
    u8 r2;

    if (r5 < 0)
        r5 = 0;
    else if (r5 > a)
        r5 = a;
    r3 = f << 3;
    for (i = 0; i < f; i++)
        e[i] = 0;
    if (a < r3)
        r2 = *d * r3 / a >> 8;
    else
        r2 = *d * r3 / a;
    r3 = r2;
    if (r3 == 0 && r5 > 0)
    {
        e[0] = 1;
        r3 = 1;
    }
    else
    {
        for (i = 0; i < f; i++)
        {
            if (r2 >= 8)
            {
                e[i] = 8;
            }
            else
            {
                e[i] = r2;
                break;
            }
            r2 -= 8;
        }
    }
    return r3;
}

// These two functions seem as if they were made for testing the health bar.
s16 sub_80460C8(struct BattleInterfaceStruct1 *a, int *b, u16 *c, int d)
{
    u16 r7;
    s16 r1;

    r7 = sub_8045F58(a->unk0, a->unk4, a->unk8, b, 6, 1);
    sub_8046128(a, b, c);
    if (a->unk0 < 0x30)
        r1 = *b >> 8;
    else
        r1 = *b;
    do_nothing(a->unk0, r1, d);
    return r7;
}

static void sub_8046128(struct BattleInterfaceStruct1 *a, int *b, u16 *c)
{
    u8 sp8[6];
    u16 sp10[6];
    u8 i;

    CalcBarFilledPixels(a->unk0, a->unk4, a->unk8, b, (u8 *)sp8, 6);
    for (i = 0; i < 6; i++)
        sp10[i] = (a->unkC_0 << 12) | (a->unk10 + sp8[i]);
    CpuCopy16(sp10, c, sizeof(sp10));
}

static u8 GetScaledExpFraction(int a, int b, int c, u8 d)
{
    u8 r7 = d * 8;
    int r5 = a - b;
    s8 r4;
    s8 r0;
    s32 result;

    if (r5 < 0)
        r5 = 0;
    else if (r5 > c)
        r5 = c;

    r4 = a * r7 / c;
    r0 = r5 * r7 / c;
    result = r4 - r0;
    return ABS(result);
}

u8 GetScaledHPFraction(s16 hp, s16 maxhp, u8 scale)
{
    u8 result = hp * scale / maxhp;

    if (result == 0 && hp > 0)
        return 1;
    return result;
}

u8 GetHPBarLevel(s16 hp, s16 maxhp)
{
    int result;

    if (hp == maxhp)
        result = 4;
    else
    {
        u8 fraction = GetScaledHPFraction(hp, maxhp, 48);
        if (fraction >= 25)
            result = 3;
        else if (fraction >= 10)
            result = 2;
        else if (fraction > 0)
            result = 1;
        else
            result = 0;
    }
    return result;
}
