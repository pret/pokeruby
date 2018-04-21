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

struct UnknownStruct5
{
    u8 unk0;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    u32 unk10;
};

struct UnknownStruct7
{
    u8 filler0[0x180];
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

const struct CompressedSpriteSheet gUnknown_0820A784[] =
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

const struct SpriteTemplate gSpriteTemplate_820A7A4 =
{
    .tileTag = 55052,
    .paletteTag = 55056,
    .oam = &gOamData_820A4E4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8045030,
};

const struct SpriteTemplate gSpriteTemplate_820A7BC =
{
    .tileTag = 55053,
    .paletteTag = 55057,
    .oam = &gOamData_820A4E4,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_8045030,
};

const struct SpriteTemplate gSpriteTemplate_820A7D4 =
{
    .tileTag = 55060,
    .paletteTag = 55058,
    .oam = &gOamData_820A79C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_804507C,
};

const struct SpriteTemplate gSpriteTemplate_820A7EC =
{
    .tileTag = 55061,
    .paletteTag = 55059,
    .oam = &gOamData_820A79C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_804507C,
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

const u8 gUnknown_0820A864[] = _("{COLOR DARK_GREY}{HIGHLIGHT RED}              /");

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
extern u8 gBanksBySide[];
extern u8 gHealthboxIDs[];

extern u16 gBattleTypeFlags;

extern const u8 BattleText_SafariBalls[];
extern const u8 BattleText_SafariBallsLeft[];
extern const u8 BattleText_HighlightRed[];
extern const u8 gUnknown_08D1216C[][32];

extern const u16 gBattleInterfaceStatusIcons_DynPal[];

#define ABS(n) ((n) >= 0 ? (n) : -(n))
// Used for computing copy destination addresses
#define MACRO1(n) ((n) - (n) / 8 * 8) + 64 * ((n) / 8)

static void sub_8043D5C(struct Sprite *);
static const void *sub_8043CDC(u8);
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
static u8 sub_804602C(int, int, int, int *, u8 *, u8);
static void sub_8046128(struct BattleInterfaceStruct1 *a, int *b, u16 *c);

static int do_nothing(s16 unused1, s16 unused2, int unused3)
{
    return 9;
}

#ifdef NONMATCHING
void sub_8043740(s16 a, u16 *b, u8 c)
{
    u8 sp0[4];
    s8 i;
    s8 j;
    s32 r9;

    for (i = 0; i < 4; i++)
        sp0[i] = 0;

    //_0804377C
    //i = 3;
    //r9 = -1;
    for (i = 3, r9 = -1;;)
    {
        if (a > 0)
        {
            sp0[i] = a % 10;
            a /= 10;
            i--;
        }
        else
            break;
        asm(""::"r"(r9));
    }

    //_080437AA
    for (; i > r9; i--)
    {
        //asm("":"=r"(r9));
        sp0[i] = -1;
    }
    //_080437CE
    if (sp0[3] == 0xFF)
        sp0[3] = 0;

    //_080437DA
    if (c == 0)
    {
        for (i = 0, j = 0; i < 4; i++)
        {
            if (sp0[j] == 0xFF)
            {
                b[j] = (b[j] & 0xFC00) | 0x1E;
                b[i + 0x20] = (b[i + 0x20] & 0xFC00) | 0x1E;
            }
            else
            {
                b[j] = (b[j] & 0xFC00) | (sp0[j] + 0x14);
                b[i + 0x20] = (b[i + 0x20] & 0xFC00) | (sp0[i] + 0x34);
            }
            j++;
        }

    }
    //_0804386A
    else
    {
        for (i = 0; i < 4; i++)
        {
            if (sp0[i] == 0xFF)
            {
                b[i] = (b[i] & 0xFC00) | 0x1E;
                b[i + 0x20] = (b[i + 0x20] & 0xFC00) | 0x1E;
            }
            else
            {
                b[i] = (b[i] & 0xFC00) | (sp0[i] + 0x14);
                b[i + 0x20] = (b[i + 0x20] & 0xFC00) | (sp0[i] + 0x34);
            }
        }
    }
    asm(""::"r"(r9));
}
#else
NAKED
void sub_8043740(s16 a, u16 *b, u8 c)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x4\n\
    adds r7, r1, 0\n\
    lsls r0, 16\n\
    lsrs r5, r0, 16\n\
    lsls r2, 24\n\
    lsrs r2, 24\n\
    mov r10, r2\n\
    movs r3, 0\n\
    movs r2, 0\n\
_0804375C:\n\
    lsls r0, r3, 24\n\
    asrs r0, 24\n\
    mov r3, sp\n\
    adds r1, r3, r0\n\
    strb r2, [r1]\n\
    adds r0, 0x1\n\
    lsls r0, 24\n\
    lsrs r3, r0, 24\n\
    asrs r0, 24\n\
    cmp r0, 0x3\n\
    ble _0804375C\n\
    movs r3, 0x3\n\
    movs r0, 0x1\n\
    negs r0, r0\n\
    mov r9, r0\n\
    mov r8, sp\n\
_0804377C:\n\
    lsls r0, r5, 16\n\
    asrs r6, r0, 16\n\
    cmp r6, 0\n\
    ble _080437AA\n\
    lsls r4, r3, 24\n\
    asrs r4, 24\n\
    mov r1, sp\n\
    adds r5, r1, r4\n\
    adds r0, r6, 0\n\
    movs r1, 0xA\n\
    bl __modsi3\n\
    strb r0, [r5]\n\
    adds r0, r6, 0\n\
    movs r1, 0xA\n\
    bl __divsi3\n\
    lsls r0, 16\n\
    lsrs r5, r0, 16\n\
    subs r4, 0x1\n\
    lsls r4, 24\n\
    lsrs r3, r4, 24\n\
    b _0804377C\n\
_080437AA:\n\
    lsls r1, r3, 24\n\
    asrs r0, r1, 24\n\
    cmp r0, r9\n\
    ble _080437CE\n\
    movs r4, 0xFF\n\
    movs r3, 0x1\n\
    negs r3, r3\n\
_080437B8:\n\
    asrs r2, r1, 24\n\
    mov r5, sp\n\
    adds r1, r5, r2\n\
    ldrb r0, [r1]\n\
    orrs r0, r4\n\
    strb r0, [r1]\n\
    subs r2, 0x1\n\
    lsls r1, r2, 24\n\
    asrs r0, r1, 24\n\
    cmp r0, r3\n\
    bgt _080437B8\n\
_080437CE:\n\
    mov r1, r8\n\
    ldrb r0, [r1, 0x3]\n\
    cmp r0, 0xFF\n\
    bne _080437DA\n\
    movs r0, 0\n\
    strb r0, [r1, 0x3]\n\
_080437DA:\n\
    mov r2, r10\n\
    cmp r2, 0\n\
    bne _0804386A\n\
    movs r3, 0\n\
    movs r1, 0\n\
    movs r6, 0xFC\n\
    lsls r6, 8\n\
    movs r5, 0x1E\n\
    mov r12, r5\n\
_080437EC:\n\
    lsls r1, 24\n\
    asrs r2, r1, 24\n\
    mov r0, sp\n\
    adds r5, r0, r2\n\
    ldrb r0, [r5]\n\
    mov r8, r1\n\
    cmp r0, 0xFF\n\
    bne _08043822\n\
    lsls r1, r2, 1\n\
    adds r1, r7\n\
    ldrh r2, [r1]\n\
    adds r0, r6, 0\n\
    ands r0, r2\n\
    mov r2, r12\n\
    orrs r0, r2\n\
    strh r0, [r1]\n\
    lsls r3, 24\n\
    asrs r1, r3, 23\n\
    adds r1, r7\n\
    adds r1, 0x40\n\
    ldrh r2, [r1]\n\
    adds r0, r6, 0\n\
    ands r0, r2\n\
    mov r5, r12\n\
    orrs r0, r5\n\
    strh r0, [r1]\n\
    b _08043852\n\
_08043822:\n\
    lsls r2, 1\n\
    adds r2, r7\n\
    ldrh r0, [r2]\n\
    adds r1, r6, 0\n\
    ands r1, r0\n\
    ldrb r0, [r5]\n\
    adds r0, 0x14\n\
    orrs r1, r0\n\
    strh r1, [r2]\n\
    lsls r4, r3, 24\n\
    asrs r3, r4, 24\n\
    lsls r2, r3, 1\n\
    adds r2, r7\n\
    adds r2, 0x40\n\
    ldrh r0, [r2]\n\
    adds r1, r6, 0\n\
    ands r1, r0\n\
    mov r5, sp\n\
    adds r0, r5, r3\n\
    ldrb r0, [r0]\n\
    adds r0, 0x34\n\
    orrs r1, r0\n\
    strh r1, [r2]\n\
    adds r3, r4, 0\n\
_08043852:\n\
    movs r0, 0x80\n\
    lsls r0, 17\n\
    add r0, r8\n\
    lsrs r1, r0, 24\n\
    movs r2, 0x80\n\
    lsls r2, 17\n\
    adds r0, r3, r2\n\
    lsrs r3, r0, 24\n\
    asrs r0, 24\n\
    cmp r0, 0x3\n\
    ble _080437EC\n\
    b _080438CE\n\
_0804386A:\n\
    movs r3, 0\n\
    movs r4, 0xFC\n\
    lsls r4, 8\n\
    movs r6, 0x1E\n\
_08043872:\n\
    lsls r1, r3, 24\n\
    asrs r2, r1, 24\n\
    mov r3, sp\n\
    adds r5, r3, r2\n\
    ldrb r0, [r5]\n\
    adds r3, r1, 0\n\
    cmp r0, 0xFF\n\
    bne _0804389E\n\
    lsls r1, r2, 1\n\
    adds r1, r7\n\
    ldrh r2, [r1]\n\
    adds r0, r4, 0\n\
    ands r0, r2\n\
    orrs r0, r6\n\
    strh r0, [r1]\n\
    adds r1, 0x40\n\
    ldrh r2, [r1]\n\
    adds r0, r4, 0\n\
    ands r0, r2\n\
    orrs r0, r6\n\
    strh r0, [r1]\n\
    b _080438C0\n\
_0804389E:\n\
    lsls r2, 1\n\
    adds r2, r7\n\
    ldrh r0, [r2]\n\
    adds r1, r4, 0\n\
    ands r1, r0\n\
    ldrb r0, [r5]\n\
    adds r0, 0x14\n\
    orrs r1, r0\n\
    strh r1, [r2]\n\
    adds r2, 0x40\n\
    ldrh r0, [r2]\n\
    adds r1, r4, 0\n\
    ands r1, r0\n\
    ldrb r0, [r5]\n\
    adds r0, 0x34\n\
    orrs r1, r0\n\
    strh r1, [r2]\n\
_080438C0:\n\
    movs r5, 0x80\n\
    lsls r5, 17\n\
    adds r0, r3, r5\n\
    lsrs r3, r0, 24\n\
    asrs r0, 24\n\
    cmp r0, 0x3\n\
    ble _08043872\n\
_080438CE:\n\
    add sp, 0x4\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n");
}
#endif

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

    spriteId3 = CreateSpriteAtEnd(&gSpriteTemplates_820A56C[gBanksBySide[a]], 140, 60, 0);
    sprite = &gSprites[spriteId3];
    SetSubspriteTables(sprite, &gSubspriteTables_820A684[GetBattlerSide(a)]);
    sprite->subspriteMode = 2;
    sprite->oam.priority = 1;
    CpuCopy32(sub_8043CDC(1), OBJ_VRAM0 + sprite->oam.tileNum * 32, 64);

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

static const void *sub_8043CDC(u8 a)
{
    return gUnknown_08D1216C[a];
}

static void sub_8043CEC(struct Sprite *sprite)
{
    u8 r5 = sprite->data[5];

    switch (sprite->data[6])
    {
    case 0:
        sprite->pos1.x = gSprites[r5].pos1.x + 16;
        sprite->pos1.y = gSprites[r5].pos1.y;
        break;
    case 1:
        sprite->pos1.x = gSprites[r5].pos1.x + 16;
        sprite->pos1.y = gSprites[r5].pos1.y;
        break;
    default:
    case 2:
        sprite->pos1.x = gSprites[r5].pos1.x + 8;
        sprite->pos1.y = gSprites[r5].pos1.y;
        break;
    }
    sprite->pos2.x = gSprites[r5].pos2.x;
    sprite->pos2.y = gSprites[r5].pos2.y;
}

static void sub_8043D5C(struct Sprite *sprite)
{
    u8 data5 = sprite->data[5];

    sprite->pos1.x = gSprites[data5].pos1.x + 64;
    sprite->pos1.y = gSprites[data5].pos1.y;
    sprite->pos2.x = gSprites[data5].pos2.x;
    sprite->pos2.y = gSprites[data5].pos2.y;
}

void sub_8043D84(u8 a, u8 b, u32 c, u32 d, u32 e)
{
    ewram17850[a].unk0 = b;
    ewram17850[a].unk4 = c;
    ewram17850[a].unk8 = d;
    ewram17850[a].unkC = e;
    ewram17850[a].unk10 = 0xFFFF8000;
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
    gSprites[spriteId].pos1.x = x;
    gSprites[spriteId].pos1.y = y;
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

        spriteId1 = gHealthboxIDs[i];
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
    sub_8043E50(gHealthboxIDs[a], x, y);
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
        *(ptr++) = 0x11;
        *(ptr++) = 1;
        *(ptr++) = EXT_CTRL_CODE_BEGIN;
        *(ptr++) = 0x14;
        *(ptr++) = 4;
        *(ptr++) = CHAR_LV_SEPARATOR;
        *(ptr++) = EXT_CTRL_CODE_BEGIN;
        *(ptr++) = 0x14;
        *(ptr++) = 0;
        ptr = ConvertIntToDecimalStringN(ptr, b, 0, 2);
    }

    *(ptr++) = EXT_CTRL_CODE_BEGIN;
    *(ptr++) = 0x13;
    *(ptr++) = 0xF;
    *(ptr++) = EOS;
    sub_80034D4(ewram0_9(0), str);

    two = 2;
    for (i = 0; i < two; i++)
        CpuCopy32((void *)(ewram0_9(1) + i * 64), r7[i] + gSprites[a].oam.tileNum * 32, 32);
}

#ifdef NONMATCHING
void sub_80440EC(u8 a, s16 b, u8 c)
{
    u8 str[0x14];
    u8 *ptr;
    s32 foo;
    u8 *const *r4;
    s32 i;

    // TODO: make this a local variable
    memcpy(str, gUnknown_0820A864, sizeof(str));
    foo = gSprites[a].data[6];

    if (IsDoubleBattle() == TRUE || GetBattlerSide(foo) == 1)
    {
        //_08044136
        sub_8044210(a, b, c);
        return;
    }
    //
    ptr = str + 6;
    if (c == 0)
    {
        if (GetBattlerSide(gSprites[a].data[6]) == 0)
            r4 = gUnknown_0820A83C;
        else
            r4 = gUnknown_0820A848;
        c = 3;
        ptr = sub_8003504(ptr, b, 0x13, 1);
        *(ptr++) = 0xBA;
        *(ptr++) = 0xFF;
        sub_80034D4(ewram0_9(0), str);
    }
    else
    {
        if (GetBattlerSide(gSprites[a].data[6]) == 0)
            r4 = gUnknown_0820A854;
        else
            r4 = gUnknown_0820A85C;
        c = 2;
        sub_8003504(ptr, b, 0xF, 1);
        sub_80034D4(ewram0_9(0), str);
    }
    //asm(""::"r"(a));
    //_080441B6
    for (i = 0; i < c; i++)  // _080440BC
    {
        void *temp = r4[i] + gSprites[a].oam.tileNum * 32;
        CpuCopy32((void *)(ewram0_9(1) + i * 0x40), temp, 0x20);
    }
}
#else
NAKED
void sub_80440EC(u8 a, s16 b, u8 c)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    sub sp, 0x14\n\
    lsls r0, 24\n\
    lsrs r7, r0, 24\n\
    lsls r1, 16\n\
    lsrs r6, r1, 16\n\
    lsls r2, 24\n\
    lsrs r2, 24\n\
    mov r8, r2\n\
    ldr r1, _08044144 @ =gUnknown_0820A864\n\
    mov r0, sp\n\
    movs r2, 0x14\n\
    bl memcpy\n\
    ldr r1, _08044148 @ =gSprites\n\
    lsls r0, r7, 4\n\
    adds r0, r7\n\
    lsls r0, 2\n\
    adds r4, r0, r1\n\
    movs r0, 0x3A\n\
    ldrsh r5, [r4, r0]\n\
    bl IsDoubleBattle\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x1\n\
    beq _08044136\n\
    lsls r0, r5, 24\n\
    lsrs r0, 24\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x1\n\
    bne _0804414C\n\
_08044136:\n\
    lsls r1, r6, 16\n\
    asrs r1, 16\n\
    adds r0, r7, 0\n\
    mov r2, r8\n\
    bl sub_8044210\n\
    b _080441F0\n\
    .align 2, 0\n\
_08044144: .4byte gUnknown_0820A864\n\
_08044148: .4byte gSprites\n\
_0804414C:\n\
    mov r5, sp\n\
    adds r5, 0x6\n\
    mov r0, r8\n\
    cmp r0, 0\n\
    bne _08044190\n\
    ldrh r0, [r4, 0x3A]\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    ldr r4, _08044188 @ =gUnknown_0820A848\n\
    cmp r0, 0\n\
    bne _0804416A\n\
    ldr r4, _0804418C @ =gUnknown_0820A83C\n\
_0804416A:\n\
    movs r0, 0x3\n\
    mov r8, r0\n\
    lsls r1, r6, 16\n\
    asrs r1, 16\n\
    adds r0, r5, 0\n\
    movs r2, 0x13\n\
    movs r3, 0x1\n\
    bl sub_8003504\n\
    adds r5, r0, 0\n\
    movs r0, 0xBA\n\
    strb r0, [r5]\n\
    movs r0, 0xFF\n\
    strb r0, [r5, 0x1]\n\
    b _080441B6\n\
    .align 2, 0\n\
_08044188: .4byte gUnknown_0820A848\n\
_0804418C: .4byte gUnknown_0820A83C\n\
_08044190:\n\
    ldrh r0, [r4, 0x3A]\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    ldr r4, _080441FC @ =gUnknown_0820A85C\n\
    cmp r0, 0\n\
    bne _080441A4\n\
    ldr r4, _08044200 @ =gUnknown_0820A854\n\
_080441A4:\n\
    movs r0, 0x2\n\
    mov r8, r0\n\
    lsls r1, r6, 16\n\
    asrs r1, 16\n\
    adds r0, r5, 0\n\
    movs r2, 0xF\n\
    movs r3, 0x1\n\
    bl sub_8003504\n\
_080441B6:\n\
    movs r0, 0x80\n\
    lsls r0, 18\n\
    mov r1, sp\n\
    bl sub_80034D4\n\
    mov r0, r8\n\
    cmp r0, 0\n\
    beq _080441F0\n\
    ldr r1, _08044204 @ =gSprites\n\
    lsls r0, r7, 4\n\
    adds r0, r7\n\
    lsls r0, 2\n\
    adds r6, r0, r1\n\
    adds r7, r4, 0\n\
    ldr r5, _08044208 @ =gSharedMem + 0x20\n\
    mov r4, r8\n\
_080441D6:\n\
    ldrh r0, [r6, 0x4]\n\
    lsls r0, 22\n\
    lsrs r0, 17\n\
    ldm r7!, {r1}\n\
    adds r1, r0\n\
    adds r0, r5, 0\n\
    ldr r2, _0804420C @ =REG_BG0CNT\n\
    bl CpuSet\n\
    adds r5, 0x40\n\
    subs r4, 0x1\n\
    cmp r4, 0\n\
    bne _080441D6\n\
_080441F0:\n\
    add sp, 0x14\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080441FC: .4byte gUnknown_0820A85C\n\
_08044200: .4byte gUnknown_0820A854\n\
_08044204: .4byte gSprites\n\
_08044208: .4byte gSharedMem + 0x20\n\
_0804420C: .4byte 0x04000008\n\
    .syntax divided\n");
}
#endif

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
    if ((ewram17800[r4].unk0_4) == 0)
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
            CpuCopy32(sub_8043CDC(0x74), OBJ_VRAM0 + (gSprites[a].oam.tileNum + 0x34) * 32, 32);
        }
    }
    r4 = gSprites[a].data[5];
    sub_80034D4(ewram0_9(0), str);
    for (i = 0; i < r10; i++)
    {
        CpuCopy32((void *)(ewram0_9(1) + i * 0x40), r7[i] + gSprites[r4].oam.tileNum * 32, 32);
    }
}

#ifdef NONMATCHING
void sub_8044338(u8 a, struct Pokemon *pkmn)
{
    u8 str[0x14];
    u8 *r6;
    s32 r8;
    u8 nature; // = GetNature(pkmn);
    s32 r7;
    u8 i;
    u8 r5;

    // TODO: make this a local variable
    memcpy(str, gUnknown_0820A864, sizeof(str));
    r6 = ewram520[GetBattlerPosition(gSprites[a].data[6])].filler0;
    r8 = 5;
    nature = GetNature(pkmn);
    StringCopy(str + 6, gNatureNames[nature]);
    sub_80034D4(r6, str);
    r7 = 6;
    for (i = 0; i < (u32)r8; i++, r7++)  //_080443AA
    {
        u8 val;

        if ((u8)(str[r7] - 0x37) <= 0x13 || (u8)(str[r7] + 0x79) <= 0x13)
            val = 0x2C;
        //_080443DC
        else if ((u8)(str[r7] - 0x4B) <= 4 || (u8)(str[r7] + 0x65) <= 4)
            val = 0x2D;
        else
            val = 0x2B;

        CpuCopy32(sub_8043CDC(val), r6 + i * 64, 32);
    }
    //r7 = 1;
    //sp18 = a * 16;
    for (r7 = 1; r7 < r8 + 1; r7++)
    {
        int foo;

        foo = gSprites[a].oam.tileNum + MACRO1(r7);
        CpuCopy32(r6, (u8 *)0x06010000 + foo * 32, 32);
        r6 += 32;

        foo = gSprites[a].oam.tileNum + 8 + MACRO1(r7);
        CpuCopy32(r6, (u8 *)0x06010000 + foo * 32, 32);
        r6 += 32;
    }
    //_08044486
    r5 = gSprites[a].data[5];
    ConvertIntToDecimalStringN(str + 6, ewram16089, 1, 2);
    ConvertIntToDecimalStringN(str + 9, ewram16088, 1, 2);
    str[5] = 0;
    str[8] = 0xBA;
    sub_80034D4(ewram0_9(0), str);

    for (r7 = 0; r7 < 5; r7++)
    {
        if (r7 <= 1)
        {
            int foo = (gSprites[r5].oam.tileNum + 2 + r7);
            CpuCopy32(ewram0_9(1) + r7 * 0x40, (u8 *)0x06010000 + foo * 32, 32);
        }
        else
        {
            int foo = (r7 + gSprites[r5].oam.tileNum);
            CpuCopy32(ewram0_9(1) + r7 * 0x40, (u8 *)0x060100C0 + foo * 32, 32);
        }
    }
}
#else
NAKED
void sub_8044338(u8 a, struct Pokemon *pkmn)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x20\n\
    adds r4, r1, 0\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    str r0, [sp, 0x14]\n\
    ldr r1, _080443CC @ =gUnknown_0820A864\n\
    mov r0, sp\n\
    movs r2, 0x14\n\
    bl memcpy\n\
    ldr r1, _080443D0 @ =gSprites\n\
    ldr r2, [sp, 0x14]\n\
    lsls r0, r2, 4\n\
    adds r0, r2\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    ldrh r0, [r0, 0x3A]\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    bl GetBattlerPosition\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    lsls r1, r0, 1\n\
    adds r1, r0\n\
    lsls r1, 7\n\
    ldr r3, _080443D4 @ =gSharedMem + 0x520\n\
    adds r6, r1, r3\n\
    movs r0, 0x5\n\
    mov r8, r0\n\
    adds r0, r4, 0\n\
    bl GetNature\n\
    lsls r0, 24\n\
    mov r4, sp\n\
    adds r4, 0x6\n\
    ldr r1, _080443D8 @ =gNatureNames\n\
    lsrs r0, 22\n\
    adds r0, r1\n\
    ldr r1, [r0]\n\
    adds r0, r4, 0\n\
    bl StringCopy\n\
    adds r0, r6, 0\n\
    mov r1, sp\n\
    bl sub_80034D4\n\
    movs r7, 0x6\n\
    movs r5, 0\n\
    mov r1, sp\n\
    adds r1, 0x9\n\
    str r1, [sp, 0x1C]\n\
_080443AA:\n\
    mov r2, sp\n\
    adds r0, r2, r7\n\
    ldrb r1, [r0]\n\
    adds r0, r1, 0\n\
    subs r0, 0x37\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x13\n\
    bls _080443C8\n\
    adds r0, r1, 0\n\
    adds r0, 0x79\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x13\n\
    bhi _080443DC\n\
_080443C8:\n\
    movs r0, 0x2C\n\
    b _080443FA\n\
    .align 2, 0\n\
_080443CC: .4byte gUnknown_0820A864\n\
_080443D0: .4byte gSprites\n\
_080443D4: .4byte gSharedMem + 0x520\n\
_080443D8: .4byte gNatureNames\n\
_080443DC:\n\
    adds r0, r1, 0\n\
    subs r0, 0x4B\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x4\n\
    bls _080443F4\n\
    adds r0, r1, 0\n\
    adds r0, 0x65\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x4\n\
    bhi _080443F8\n\
_080443F4:\n\
    movs r0, 0x2D\n\
    b _080443FA\n\
_080443F8:\n\
    movs r0, 0x2B\n\
_080443FA:\n\
    bl sub_8043CDC\n\
    lsls r1, r5, 6\n\
    adds r1, r6, r1\n\
    ldr r2, _080444F8 @ =REG_BG0CNT\n\
    bl CpuSet\n\
    adds r0, r5, 0x1\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    adds r7, 0x1\n\
    cmp r5, r8\n\
    bcc _080443AA\n\
    movs r7, 0x1\n\
    ldr r3, [sp, 0x14]\n\
    lsls r3, 4\n\
    str r3, [sp, 0x18]\n\
    movs r0, 0x1\n\
    add r0, r8\n\
    mov r9, r0\n\
    cmp r7, r9\n\
    bge _08044486\n\
    ldr r1, _080444FC @ =gSprites\n\
    ldr r2, _080444F8 @ =REG_BG0CNT\n\
    mov r10, r2\n\
    ldr r2, [sp, 0x14]\n\
    adds r0, r3, r2\n\
    lsls r0, 2\n\
    adds r0, r1\n\
    mov r8, r0\n\
_08044436:\n\
    mov r3, r8\n\
    ldrh r0, [r3, 0x4]\n\
    lsls r0, 22\n\
    lsrs r0, 22\n\
    adds r5, r7, 0\n\
    cmp r7, 0\n\
    bge _08044446\n\
    adds r5, r7, 0x7\n\
_08044446:\n\
    asrs r5, 3\n\
    lsls r4, r5, 3\n\
    subs r4, r7, r4\n\
    adds r0, r4\n\
    lsls r5, 6\n\
    adds r0, r5\n\
    lsls r0, 5\n\
    ldr r2, _08044500 @ =0x06010000\n\
    adds r1, r0, r2\n\
    adds r0, r6, 0\n\
    mov r2, r10\n\
    bl CpuSet\n\
    adds r6, 0x20\n\
    mov r3, r8\n\
    ldrh r0, [r3, 0x4]\n\
    lsls r0, 22\n\
    lsrs r0, 22\n\
    adds r4, 0x8\n\
    adds r0, r4\n\
    adds r0, r5\n\
    lsls r0, 5\n\
    ldr r2, _08044500 @ =0x06010000\n\
    adds r1, r0, r2\n\
    adds r0, r6, 0\n\
    mov r2, r10\n\
    bl CpuSet\n\
    adds r6, 0x20\n\
    adds r7, 0x1\n\
    cmp r7, r9\n\
    blt _08044436\n\
_08044486:\n\
    ldr r6, _080444FC @ =gSprites\n\
    ldr r3, [sp, 0x18]\n\
    ldr r1, [sp, 0x14]\n\
    adds r0, r3, r1\n\
    lsls r0, 2\n\
    adds r0, r6\n\
    ldrh r5, [r0, 0x38]\n\
    lsls r5, 24\n\
    lsrs r5, 24\n\
    ldr r4, _08044504 @ =gSharedMem\n\
    ldr r2, _08044508 @ =0x00016089\n\
    adds r0, r4, r2\n\
    ldrb r1, [r0]\n\
    mov r0, sp\n\
    adds r0, 0x6\n\
    movs r2, 0x1\n\
    movs r3, 0x2\n\
    bl ConvertIntToDecimalStringN\n\
    ldr r3, _0804450C @ =0x00016088\n\
    adds r4, r3\n\
    ldrb r1, [r4]\n\
    ldr r0, [sp, 0x1C]\n\
    movs r2, 0x1\n\
    movs r3, 0x2\n\
    bl ConvertIntToDecimalStringN\n\
    mov r1, sp\n\
    movs r0, 0\n\
    strb r0, [r1, 0x5]\n\
    movs r0, 0xBA\n\
    strb r0, [r1, 0x8]\n\
    movs r0, 0x80\n\
    lsls r0, 18\n\
    bl sub_80034D4\n\
    movs r7, 0\n\
    lsls r0, r5, 4\n\
    adds r0, r5\n\
    lsls r0, 2\n\
    adds r5, r0, r6\n\
    ldr r4, _08044510 @ =gSharedMem + 0x20\n\
_080444DA:\n\
    cmp r7, 0x1\n\
    bgt _08044514\n\
    ldrh r1, [r5, 0x4]\n\
    lsls r1, 22\n\
    lsrs r1, 22\n\
    adds r0, r7, 0x2\n\
    adds r1, r0\n\
    lsls r1, 5\n\
    ldr r0, _08044500 @ =0x06010000\n\
    adds r1, r0\n\
    adds r0, r4, 0\n\
    ldr r2, _080444F8 @ =REG_BG0CNT\n\
    bl CpuSet\n\
    b _0804452A\n\
    .align 2, 0\n\
_080444F8: .4byte 0x04000008\n\
_080444FC: .4byte gSprites\n\
_08044500: .4byte 0x06010000\n\
_08044504: .4byte gSharedMem\n\
_08044508: .4byte 0x00016089\n\
_0804450C: .4byte 0x00016088\n\
_08044510: .4byte gSharedMem + 0x20\n\
_08044514:\n\
    ldrh r1, [r5, 0x4]\n\
    lsls r1, 22\n\
    lsrs r1, 22\n\
    adds r1, r7, r1\n\
    lsls r1, 5\n\
    ldr r2, _08044544 @ =0x060100c0\n\
    adds r1, r2\n\
    adds r0, r4, 0\n\
    ldr r2, _08044548 @ =REG_BG0CNT\n\
    bl CpuSet\n\
_0804452A:\n\
    adds r4, 0x40\n\
    adds r7, 0x1\n\
    cmp r7, 0x4\n\
    ble _080444DA\n\
    add sp, 0x20\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08044544: .4byte 0x060100c0\n\
_08044548: .4byte 0x04000008\n\
    .syntax divided\n");
}
#endif

extern u8 gUnknown_020297ED;

void sub_804454C(void)
{
    s32 i;
    u8 spriteId;

    for (i = 0; i < gBattlersCount; i++)
    {
        if (gSprites[gHealthboxIDs[i]].callback == SpriteCallbackDummy
#if DEBUG
         && (gUnknown_020297ED != 0 || GetBattlerSide(i) != 1)
#else
         && GetBattlerSide(i) != 1
#endif
         && (IsDoubleBattle() || GetBattlerSide(i) != 0))
        {
            u8 r6;

            ewram17800[i].unk0_4 ^= 1;
            r6 = ewram17800[i].unk0_4;
            if (GetBattlerSide(i) == 0)
            {

                if (!IsDoubleBattle())
                    continue;
                if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
                    continue;

                if (r6 == 1)
                {
                    spriteId = gSprites[gHealthboxIDs[i]].data[5];

                    CpuFill32(0, OBJ_VRAM0 + gSprites[spriteId].oam.tileNum * 32, 0x100);
                    sub_8044210(gHealthboxIDs[i], GetMonData(&gPlayerParty[gBattlerPartyIndexes[i]], MON_DATA_HP), 0);
                    sub_8044210(gHealthboxIDs[i], GetMonData(&gPlayerParty[gBattlerPartyIndexes[i]], MON_DATA_MAX_HP), 1);
                }
                else
                {
                    draw_status_ailment_maybe(gHealthboxIDs[i]);
                    sub_8045A5C(gHealthboxIDs[i], &gPlayerParty[gBattlerPartyIndexes[i]], 5);
                    CpuCopy32(sub_8043CDC(0x75), OBJ_VRAM0 + 0x680 + gSprites[gHealthboxIDs[i]].oam.tileNum * 32, 32);
                }
            }
            else
            {
                if (r6 == 1)
                {
                    if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
                    {
                        sub_8044338(gHealthboxIDs[i], &gEnemyParty[gBattlerPartyIndexes[i]]);
                    }
                    else
                    {
                        spriteId = gSprites[gHealthboxIDs[i]].data[5];

                        CpuFill32(0, OBJ_VRAM0 + gSprites[spriteId].oam.tileNum * 32, 0x100);
                        sub_8044210(gHealthboxIDs[i], GetMonData(&gEnemyParty[gBattlerPartyIndexes[i]], MON_DATA_HP), 0);
                        sub_8044210(gHealthboxIDs[i], GetMonData(&gEnemyParty[gBattlerPartyIndexes[i]], MON_DATA_MAX_HP), 1);
                    }
                }
                else
                {
                    draw_status_ailment_maybe(gHealthboxIDs[i]);
                    sub_8045A5C(gHealthboxIDs[i], &gEnemyParty[gBattlerPartyIndexes[i]], 5);
                    if (gBattleTypeFlags & BATTLE_TYPE_SAFARI)
                        sub_8045A5C(gHealthboxIDs[i], &gEnemyParty[gBattlerPartyIndexes[i]], 4);
                }
            }
            gSprites[gHealthboxIDs[i]].data[7] ^= 1;
        }
    }
}

// This function almost matches except for just two instructions around 0x08044B52 that are swapped.
#ifdef NONMATCHING
u8 sub_8044804(u8 a, const struct BattleInterfaceStruct2 *b, u8 c, u8 d)
{
    u8 r7;
    s16 x;
    s16 y;
    s16 r8;
    s16 r5;

    int i;
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

    sp14 = 0;
    for (i = 0; i < 6; i++)  //_080448A0
    {
        if (b[i].unk0 != 0xFFFF)
            sp14++;
    }

    LoadCompressedObjectPic(&gUnknown_0820A754[r7]);
    LoadSpriteSheet(&gUnknown_0820A784[r7]);
    LoadSpritePalette(&gUnknown_0820A764[r7]);
    LoadSpritePalette(&gUnknown_0820A774[r7]);

    sp18 = CreateSprite(&gSpriteTemplate_820A7A4[r7], x, y, 10);
    SetSubspriteTables(&gSprites[sp18], gSubspriteTables_820A6E4);
    gSprites[sp18].pos2.x = r8;
    gSprites[sp18].data[0] = r5;
    if (r7 != 0)
    {
        gSprites[sp18].pos1.x -= 96;
        gSprites[sp18].oam.matrixNum = 8;
    }
    else
    {
        gSprites[sp18].pos1.x += 0x60;
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
            gSprites[sp[i]].pos2.x = 0;
            gSprites[sp[i]].pos2.y = 0;
        }
        //_080449BE
        gSprites[sp[i]].data[0] = sp18;
        if (r7 == 0)
        {
            gSprites[sp[i]].pos1.x += 10 * i + 24;
            gSprites[sp[i]].data[1] = i * 7 + 10;
            gSprites[sp[i]].pos2.x = 120;
        }
        //_08044A18
        else
        {
            gSprites[sp[i]].pos1.x -= 10 * (5 - i) + 24;
            gSprites[sp[i]].data[1] = (6 - i) * 7 + 10;
            gSprites[sp[i]].pos2.x = -120;
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
                if (b[i].unk0 == 0xFFFF)
                {
                    //_08044AE6
                    gSprites[sp[i]].oam.tileNum += 1;
                    gSprites[sp[i]].data[7] = 1;
                    // to _08044B52
                }
                else if (b[i].unk0 == 0)
                {
                    gSprites[sp[i]].oam.tileNum += 3;
                    // to _08044B46
                }
                else if (b[i].unk4 != 0)
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
                    gSprites[sp[i]].oam.tileNum += 1;
                    gSprites[sp[i]].data[7] = 1;
                    // to _08044B52
                }
                else if (b[i].unk0 == 0)
                {
                    //_08044B14
                    gSprites[sp[i]].oam.tileNum += 3;
                    // to _08044B46
                }
                else if (b[i].unk4 != 0)
                {
                    gSprites[sp[i]].oam.tileNum += 2;
                }
            }
        }
    }
    //_08044B5E
    else
    {
        // Mismatch occurrs in this loop initialization
        for (i = 0; i < 6; i++)
        {
            if (gBattleTypeFlags & BATTLE_TYPE_MULTI)
            {
                if (b[i].unk0 == 0xFFFF)
                {
                    gSprites[sp[5 - i]].oam.tileNum += 1;
                    gSprites[sp[5 - i]].data[7] = 1;
                }
                else if (b[i].unk0 == 0)
                {
                    gSprites[sp[5 - i]].oam.tileNum += 3;
                }
                else if (b[i].unk4 != 0)
                {
                    gSprites[sp[5 - i]].oam.tileNum += 2;
                }
            }
            else
            {
                if (i >= sp14)
                {
                    gSprites[sp[5 - i]].oam.tileNum += 1;
                    gSprites[sp[5 - i]].data[7] = 1;
                }
                else if (b[i].unk0 == 0)
                {
                    gSprites[sp[5 - i]].oam.tileNum += 3;
                }
                else if (b[i].unk4 != 0)
                {
                    gSprites[sp[5 - i]].oam.tileNum += 2;
                }
            }
            // This corrects the initialization order, but messes up the counter update order
            asm(""::"r"(&b[i]));
        }
    }
    //_08044C38
    taskId = CreateTask(TaskDummy, 5);
    gTasks[taskId].data[0] = a;
    gTasks[taskId].data[1] = sp18;
    for (i = 0; i < 6; i++)
        gTasks[taskId].data[3 + i] = sp[i];
    gTasks[taskId].data[10] = d;
    PlaySE12WithPanning(SE_TB_START, 0);
    return taskId;
}
#else
NAKED
u8 sub_8044804(u8 a, const struct BattleInterfaceStruct2 *b, u8 c, u8 d)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x28\n\
    str r1, [sp, 0xC]\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    str r0, [sp, 0x8]\n\
    lsls r2, 24\n\
    lsrs r2, 24\n\
    adds r4, r2, 0\n\
    lsls r3, 24\n\
    lsrs r3, 24\n\
    str r3, [sp, 0x10]\n\
    cmp r4, 0\n\
    beq _08044834\n\
    bl GetBattlerPosition\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    cmp r0, 0x3\n\
    beq _08044878\n\
_08044834:\n\
    ldr r0, [sp, 0x8]\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _08044854\n\
    movs r7, 0\n\
    movs r1, 0x88\n\
    movs r2, 0x60\n\
    movs r0, 0x64\n\
    mov r8, r0\n\
    ldr r5, _08044850 @ =0x0000fffb\n\
    b _08044884\n\
    .align 2, 0\n\
_08044850: .4byte 0x0000fffb\n\
_08044854:\n\
    movs r7, 0x1\n\
    cmp r4, 0\n\
    beq _08044864\n\
    bl IsDoubleBattle\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _0804486A\n\
_08044864:\n\
    movs r1, 0x68\n\
    movs r2, 0x28\n\
    b _0804486E\n\
_0804486A:\n\
    movs r1, 0x68\n\
    movs r2, 0x10\n\
_0804486E:\n\
    ldr r3, _08044874 @ =0x0000ff9c\n\
    mov r8, r3\n\
    b _08044882\n\
    .align 2, 0\n\
_08044874: .4byte 0x0000ff9c\n\
_08044878:\n\
    movs r7, 0x1\n\
    movs r1, 0x68\n\
    movs r2, 0x28\n\
    ldr r5, _08044930 @ =0x0000ff9c\n\
    mov r8, r5\n\
_08044882:\n\
    movs r5, 0x5\n\
_08044884:\n\
    movs r6, 0\n\
    str r6, [sp, 0x14]\n\
    lsls r4, r7, 3\n\
    ldr r0, _08044934 @ =gUnknown_0820A754\n\
    mov r10, r0\n\
    lsls r3, r7, 1\n\
    mov r9, r3\n\
    lsls r1, 16\n\
    str r1, [sp, 0x20]\n\
    lsls r2, 16\n\
    str r2, [sp, 0x24]\n\
    ldr r2, _08044938 @ =0x0000ffff\n\
    ldr r1, [sp, 0xC]\n\
    movs r6, 0x5\n\
_080448A0:\n\
    ldrh r0, [r1]\n\
    cmp r0, r2\n\
    beq _080448B4\n\
    ldr r3, [sp, 0x14]\n\
    lsls r0, r3, 24\n\
    movs r3, 0x80\n\
    lsls r3, 17\n\
    adds r0, r3\n\
    lsrs r0, 24\n\
    str r0, [sp, 0x14]\n\
_080448B4:\n\
    adds r1, 0x8\n\
    subs r6, 0x1\n\
    cmp r6, 0\n\
    bge _080448A0\n\
    mov r6, r10\n\
    adds r0, r4, r6\n\
    bl LoadCompressedObjectPic\n\
    ldr r0, _0804493C @ =gUnknown_0820A784\n\
    adds r0, r4, r0\n\
    bl LoadSpriteSheet\n\
    ldr r0, _08044940 @ =gUnknown_0820A764\n\
    adds r0, r4, r0\n\
    bl LoadSpritePalette\n\
    ldr r0, _08044944 @ =gUnknown_0820A774\n\
    adds r0, r4, r0\n\
    bl LoadSpritePalette\n\
    mov r1, r9\n\
    adds r0, r1, r7\n\
    lsls r0, 3\n\
    ldr r1, _08044948 @ =gSpriteTemplate_820A7A4\n\
    adds r0, r1\n\
    ldr r2, [sp, 0x20]\n\
    asrs r1, r2, 16\n\
    ldr r3, [sp, 0x24]\n\
    asrs r2, r3, 16\n\
    movs r3, 0xA\n\
    bl CreateSprite\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    str r0, [sp, 0x18]\n\
    lsls r0, 4\n\
    ldr r6, [sp, 0x18]\n\
    adds r0, r6\n\
    lsls r0, 2\n\
    ldr r1, _0804494C @ =gSprites\n\
    adds r4, r0, r1\n\
    ldr r1, _08044950 @ =gSubspriteTables_820A6E4\n\
    adds r0, r4, 0\n\
    bl SetSubspriteTables\n\
    mov r0, r8\n\
    strh r0, [r4, 0x24]\n\
    strh r5, [r4, 0x2E]\n\
    cmp r7, 0\n\
    beq _08044954\n\
    ldrh r0, [r4, 0x20]\n\
    subs r0, 0x60\n\
    strh r0, [r4, 0x20]\n\
    ldrb r1, [r4, 0x3]\n\
    movs r0, 0x3F\n\
    negs r0, r0\n\
    ands r0, r1\n\
    movs r1, 0x10\n\
    orrs r0, r1\n\
    strb r0, [r4, 0x3]\n\
    b _0804495A\n\
    .align 2, 0\n\
_08044930: .4byte 0x0000ff9c\n\
_08044934: .4byte gUnknown_0820A754\n\
_08044938: .4byte 0x0000ffff\n\
_0804493C: .4byte gUnknown_0820A784\n\
_08044940: .4byte gUnknown_0820A764\n\
_08044944: .4byte gUnknown_0820A774\n\
_08044948: .4byte gSpriteTemplate_820A7A4\n\
_0804494C: .4byte gSprites\n\
_08044950: .4byte gSubspriteTables_820A6E4\n\
_08044954:\n\
    ldrh r0, [r4, 0x20]\n\
    adds r0, 0x60\n\
    strh r0, [r4, 0x20]\n\
_0804495A:\n\
    movs r6, 0\n\
    ldr r1, _08044A04 @ =gSprites\n\
    mov r10, r1\n\
    mov r4, sp\n\
    mov r2, r9\n\
    adds r0, r2, r7\n\
    lsls r0, 3\n\
    str r0, [sp, 0x1C]\n\
    movs r3, 0xA\n\
    mov r9, r3\n\
    mov r8, r6\n\
_08044970:\n\
    ldr r0, _08044A08 @ =gSpriteTemplate_820A7D4\n\
    ldr r5, [sp, 0x24]\n\
    ldr r1, _08044A0C @ =0xfffc0000\n\
    adds r2, r5, r1\n\
    ldr r3, [sp, 0x1C]\n\
    adds r0, r3, r0\n\
    ldr r5, [sp, 0x20]\n\
    asrs r1, r5, 16\n\
    asrs r2, 16\n\
    movs r3, 0x9\n\
    bl CreateSpriteAtEnd\n\
    strb r0, [r4]\n\
    ldr r0, [sp, 0x10]\n\
    cmp r0, 0\n\
    bne _080449A0\n\
    ldrb r0, [r4]\n\
    lsls r1, r0, 4\n\
    adds r1, r0\n\
    lsls r1, 2\n\
    ldr r2, _08044A10 @ =gSprites + 0x1C\n\
    adds r1, r2\n\
    ldr r0, _08044A14 @ =sub_8045180\n\
    str r0, [r1]\n\
_080449A0:\n\
    ldr r5, _08044A04 @ =gSprites\n\
    cmp r7, 0\n\
    bne _080449BE\n\
    ldrb r1, [r4]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    add r0, r10\n\
    strh r7, [r0, 0x24]\n\
    ldrb r1, [r4]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    add r0, r10\n\
    strh r7, [r0, 0x26]\n\
_080449BE:\n\
    ldrb r1, [r4]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r5\n\
    movs r1, 0\n\
    mov r3, sp\n\
    ldrh r3, [r3, 0x18]\n\
    strh r3, [r0, 0x2E]\n\
    cmp r7, 0\n\
    bne _08044A18\n\
    ldrb r0, [r4]\n\
    lsls r1, r0, 4\n\
    adds r1, r0\n\
    lsls r1, 2\n\
    adds r1, r5\n\
    ldrh r0, [r1, 0x20]\n\
    adds r0, 0x18\n\
    add r0, r8\n\
    strh r0, [r1, 0x20]\n\
    ldrb r1, [r4]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r5\n\
    mov r1, r9\n\
    strh r1, [r0, 0x30]\n\
    ldrb r1, [r4]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r5\n\
    movs r1, 0x78\n\
    b _08044A56\n\
    .align 2, 0\n\
_08044A04: .4byte gSprites\n\
_08044A08: .4byte gSpriteTemplate_820A7D4\n\
_08044A0C: .4byte 0xfffc0000\n\
_08044A10: .4byte gSprites + 0x1C\n\
_08044A14: .4byte sub_8045180\n\
_08044A18:\n\
    ldrb r0, [r4]\n\
    lsls r2, r0, 4\n\
    adds r2, r0\n\
    lsls r2, 2\n\
    adds r2, r5\n\
    ldrh r3, [r2, 0x20]\n\
    subs r3, 0x18\n\
    movs r1, 0x5\n\
    subs r1, r6\n\
    lsls r0, r1, 2\n\
    adds r0, r1\n\
    lsls r0, 1\n\
    subs r3, r0\n\
    strh r3, [r2, 0x20]\n\
    ldrb r0, [r4]\n\
    lsls r2, r0, 4\n\
    adds r2, r0\n\
    lsls r2, 2\n\
    adds r2, r5\n\
    movs r1, 0x6\n\
    subs r1, r6\n\
    lsls r0, r1, 3\n\
    subs r0, r1\n\
    adds r0, 0xA\n\
    strh r0, [r2, 0x30]\n\
    ldrb r1, [r4]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r5\n\
    ldr r1, _08044AC4 @ =0x0000ff88\n\
_08044A56:\n\
    strh r1, [r0, 0x24]\n\
    ldrb r1, [r4]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r5\n\
    strh r7, [r0, 0x32]\n\
    adds r4, 0x1\n\
    movs r2, 0x7\n\
    add r9, r2\n\
    movs r3, 0xA\n\
    add r8, r3\n\
    adds r6, 0x1\n\
    cmp r6, 0x5\n\
    bgt _08044A76\n\
    b _08044970\n\
_08044A76:\n\
    ldr r0, [sp, 0x8]\n\
    bl GetBattlerSide\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _08044B5E\n\
    movs r6, 0\n\
    ldr r5, _08044AC8 @ =gBattleTypeFlags\n\
    mov r10, r5\n\
    ldr r0, _08044ACC @ =0x0000ffff\n\
    mov r9, r0\n\
    ldr r7, _08044AD0 @ =gSprites\n\
    ldr r1, _08044AD4 @ =0x000003ff\n\
    mov r12, r1\n\
    ldr r2, _08044AD8 @ =0xfffffc00\n\
    mov r8, r2\n\
    mov r4, sp\n\
    ldr r5, [sp, 0xC]\n\
_08044A9A:\n\
    mov r3, r10\n\
    ldrh r1, [r3]\n\
    movs r0, 0x40\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08044ADC\n\
    ldrh r0, [r5]\n\
    cmp r0, r9\n\
    beq _08044AE6\n\
    cmp r0, 0\n\
    bne _08044B2E\n\
    ldrb r0, [r4]\n\
    lsls r2, r0, 4\n\
    adds r2, r0\n\
    lsls r2, 2\n\
    adds r2, r7\n\
    ldrh r3, [r2, 0x4]\n\
    lsls r1, r3, 22\n\
    lsrs r1, 22\n\
    adds r1, 0x3\n\
    b _08044B46\n\
    .align 2, 0\n\
_08044AC4: .4byte 0x0000ff88\n\
_08044AC8: .4byte gBattleTypeFlags\n\
_08044ACC: .4byte 0x0000ffff\n\
_08044AD0: .4byte gSprites\n\
_08044AD4: .4byte 0x000003ff\n\
_08044AD8: .4byte 0xfffffc00\n\
_08044ADC:\n\
    ldr r1, [sp, 0x14]\n\
    lsls r0, r1, 24\n\
    asrs r0, 24\n\
    cmp r6, r0\n\
    blt _08044B14\n\
_08044AE6:\n\
    ldrb r0, [r4]\n\
    lsls r2, r0, 4\n\
    adds r2, r0\n\
    lsls r2, 2\n\
    adds r2, r7\n\
    ldrh r3, [r2, 0x4]\n\
    lsls r1, r3, 22\n\
    lsrs r1, 22\n\
    adds r1, 0x1\n\
    mov r0, r12\n\
    ands r1, r0\n\
    mov r0, r8\n\
    ands r0, r3\n\
    orrs r0, r1\n\
    strh r0, [r2, 0x4]\n\
    ldrb r1, [r4]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r7\n\
    movs r1, 0x1\n\
    strh r1, [r0, 0x3C]\n\
    b _08044B52\n\
_08044B14:\n\
    ldrh r0, [r5]\n\
    cmp r0, 0\n\
    bne _08044B2E\n\
    ldrb r0, [r4]\n\
    lsls r2, r0, 4\n\
    adds r2, r0\n\
    lsls r2, 2\n\
    adds r2, r7\n\
    ldrh r3, [r2, 0x4]\n\
    lsls r1, r3, 22\n\
    lsrs r1, 22\n\
    adds r1, 0x3\n\
    b _08044B46\n\
_08044B2E:\n\
    ldr r0, [r5, 0x4]\n\
    cmp r0, 0\n\
    beq _08044B52\n\
    ldrb r0, [r4]\n\
    lsls r2, r0, 4\n\
    adds r2, r0\n\
    lsls r2, 2\n\
    adds r2, r7\n\
    ldrh r3, [r2, 0x4]\n\
    lsls r1, r3, 22\n\
    lsrs r1, 22\n\
    adds r1, 0x2\n\
_08044B46:\n\
    mov r0, r12\n\
    ands r1, r0\n\
    mov r0, r8\n\
    ands r0, r3\n\
    orrs r0, r1\n\
    strh r0, [r2, 0x4]\n\
_08044B52:\n\
    adds r4, 0x1\n\
    adds r5, 0x8\n\
    adds r6, 0x1\n\
    cmp r6, 0x5\n\
    ble _08044A9A\n\
    b _08044C38\n\
_08044B5E:\n\
    movs r6, 0\n\
    ldr r1, _08044BA4 @ =gBattleTypeFlags\n\
    mov r10, r1\n\
    ldr r2, _08044BA8 @ =0x0000ffff\n\
    mov r9, r2\n\
    ldr r7, _08044BAC @ =gSprites\n\
    ldr r3, _08044BB0 @ =0x000003ff\n\
    mov r12, r3\n\
    ldr r5, _08044BB4 @ =0xfffffc00\n\
    mov r8, r5\n\
    ldr r5, [sp, 0xC]\n\
    mov r4, sp\n\
    adds r4, 0x5\n\
_08044B78:\n\
    mov r0, r10\n\
    ldrh r1, [r0]\n\
    movs r0, 0x40\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08044BB8\n\
    ldrh r0, [r5]\n\
    cmp r0, r9\n\
    beq _08044BC2\n\
    cmp r0, 0\n\
    bne _08044C0A\n\
    ldrb r0, [r4]\n\
    lsls r2, r0, 4\n\
    adds r2, r0\n\
    lsls r2, 2\n\
    adds r2, r7\n\
    ldrh r3, [r2, 0x4]\n\
    lsls r1, r3, 22\n\
    lsrs r1, 22\n\
    adds r1, 0x3\n\
    b _08044C22\n\
    .align 2, 0\n\
_08044BA4: .4byte gBattleTypeFlags\n\
_08044BA8: .4byte 0x0000ffff\n\
_08044BAC: .4byte gSprites\n\
_08044BB0: .4byte 0x000003ff\n\
_08044BB4: .4byte 0xfffffc00\n\
_08044BB8:\n\
    ldr r1, [sp, 0x14]\n\
    lsls r0, r1, 24\n\
    asrs r0, 24\n\
    cmp r6, r0\n\
    blt _08044BF0\n\
_08044BC2:\n\
    ldrb r0, [r4]\n\
    lsls r2, r0, 4\n\
    adds r2, r0\n\
    lsls r2, 2\n\
    adds r2, r7\n\
    ldrh r3, [r2, 0x4]\n\
    lsls r1, r3, 22\n\
    lsrs r1, 22\n\
    adds r1, 0x1\n\
    mov r0, r12\n\
    ands r1, r0\n\
    mov r0, r8\n\
    ands r0, r3\n\
    orrs r0, r1\n\
    strh r0, [r2, 0x4]\n\
    ldrb r1, [r4]\n\
    lsls r0, r1, 4\n\
    adds r0, r1\n\
    lsls r0, 2\n\
    adds r0, r7\n\
    movs r1, 0x1\n\
    strh r1, [r0, 0x3C]\n\
    b _08044C2E\n\
_08044BF0:\n\
    ldrh r0, [r5]\n\
    cmp r0, 0\n\
    bne _08044C0A\n\
    ldrb r0, [r4]\n\
    lsls r2, r0, 4\n\
    adds r2, r0\n\
    lsls r2, 2\n\
    adds r2, r7\n\
    ldrh r3, [r2, 0x4]\n\
    lsls r1, r3, 22\n\
    lsrs r1, 22\n\
    adds r1, 0x3\n\
    b _08044C22\n\
_08044C0A:\n\
    ldr r0, [r5, 0x4]\n\
    cmp r0, 0\n\
    beq _08044C2E\n\
    ldrb r0, [r4]\n\
    lsls r2, r0, 4\n\
    adds r2, r0\n\
    lsls r2, 2\n\
    adds r2, r7\n\
    ldrh r3, [r2, 0x4]\n\
    lsls r1, r3, 22\n\
    lsrs r1, 22\n\
    adds r1, 0x2\n\
_08044C22:\n\
    mov r0, r12\n\
    ands r1, r0\n\
    mov r0, r8\n\
    ands r0, r3\n\
    orrs r0, r1\n\
    strh r0, [r2, 0x4]\n\
_08044C2E:\n\
    subs r4, 0x1\n\
    adds r5, 0x8\n\
    adds r6, 0x1\n\
    cmp r6, 0x5\n\
    ble _08044B78\n\
_08044C38:\n\
    ldr r0, _08044C98 @ =TaskDummy\n\
    movs r1, 0x5\n\
    bl CreateTask\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    ldr r2, _08044C9C @ =gTasks\n\
    lsls r3, r4, 2\n\
    adds r1, r3, r4\n\
    lsls r1, 3\n\
    adds r0, r1, r2\n\
    mov r5, sp\n\
    ldrh r5, [r5, 0x8]\n\
    strh r5, [r0, 0x8]\n\
    mov r6, sp\n\
    ldrh r6, [r6, 0x18]\n\
    strh r6, [r0, 0xA]\n\
    movs r6, 0\n\
    adds r0, r2, 0\n\
    adds r0, 0xE\n\
    adds r1, r0\n\
_08044C62:\n\
    mov r5, sp\n\
    adds r0, r5, r6\n\
    ldrb r0, [r0]\n\
    strh r0, [r1]\n\
    adds r1, 0x2\n\
    adds r6, 0x1\n\
    cmp r6, 0x5\n\
    ble _08044C62\n\
    adds r0, r3, r4\n\
    lsls r0, 3\n\
    adds r0, r2\n\
    ldrh r6, [r5, 0x10]\n\
    strh r6, [r0, 0x1C]\n\
    movs r0, 0x72\n\
    movs r1, 0\n\
    bl PlaySE12WithPanning\n\
    adds r0, r4, 0\n\
    add sp, 0x28\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_08044C98: .4byte TaskDummy\n\
_08044C9C: .4byte gTasks\n\
    .syntax divided\n");
}
#endif

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
    if (sprite->pos2.x != 0)
        sprite->pos2.x += sprite->data[0];
}

static void sub_8045048(struct Sprite *sprite)
{
    sprite->data[1] += 32;
    if (sprite->data[0] > 0)
        sprite->pos2.x += sprite->data[1] >> 4;
    else
        sprite->pos2.x -= sprite->data[1] >> 4;
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
        sprite->pos2.x += r2 >> 4;
        if (sprite->pos2.x > 0)
            sprite->pos2.x = 0;
    }
    else
    {
        sprite->pos2.x -= r2 >> 4;
        if (sprite->pos2.x < 0)
            sprite->pos2.x = 0;
    }
    if (sprite->pos2.x == 0)
    {
        pan = 63;
        if (r3 != 0)
            pan = -64;
        if (sprite->data[7] != 0)
            PlaySE2WithPanning(SE_TB_KARA, pan);
        else
            PlaySE1WithPanning(SE_TB_KON, pan);
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
        sprite->pos2.x += r2 >> 4;
    else
        sprite->pos2.x -= r2 >> 4;
    if (sprite->pos2.x + sprite->pos1.x > 248
     || sprite->pos2.x + sprite->pos1.x < -8)
    {
        sprite->invisible = TRUE;
        sprite->callback = SpriteCallbackDummy;
    }
}

void sub_8045180(struct Sprite *sprite)
{
    u8 spriteId = sprite->data[0];

    sprite->pos2.x = gSprites[spriteId].pos2.x;
    sprite->pos2.y = gSprites[spriteId].pos2.y;
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
    ptr = ewram520_2 + GetBattlerPosition(gSprites[a].data[6]) * 0x180;
    sub_80034D4(ptr, gDisplayedStringBattle);

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

                CpuCopy32(sub_8043CDC(r0), ptr + 0x40 * i, 32);
                i++;
                p++;
            }
        }
    }

    for (; i < _7; i++)
        CpuCopy32(sub_8043CDC(0x2B), ptr + 64 * i, 32);

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
                CpuCopy32(sub_8043CDC(0x46), OBJ_VRAM0 + (gSprites[r4].oam.tileNum + 8) * 32, 32);
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
        r6 = sub_8043CDC(sub_80457E8(0x1B, r7));
        r0 = 2;
    }
    else if (r4 & 0x88)
    {
        r6 = sub_8043CDC(sub_80457E8(0x15, r7));
        r0 = 0;
    }
    else if (r4 & 0x10)
    {
        r6 = sub_8043CDC(sub_80457E8(0x21, r7));
        r0 = 4;
    }
    else if (r4 & 0x20)
    {
        r6 = sub_8043CDC(sub_80457E8(0x1E, r7));
        r0 = 3;
    }
    else if (r4 & 0x40)
    {
        r6 = sub_8043CDC(sub_80457E8(0x18, r7));
        r0 = 1;
    }
    else
    {
        r6 = sub_8043CDC(0x27);

        for (i = 0; i < 3; i++)
            CpuCopy32(r6, OBJ_VRAM0 + (gSprites[a].oam.tileNum + r8 + i) * 32, 32);

        if (!ewram17800[r7].unk0_4)
            CpuCopy32(sub_8043CDC(1), OBJ_VRAM0 + gSprites[r10].oam.tileNum * 32, 64);

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
        if (!ewram17800[r7].unk0_4)
        {
            CpuCopy32(sub_8043CDC(0), OBJ_VRAM0 + gSprites[r10].oam.tileNum * 32, 32);
            CpuCopy32(sub_8043CDC(0x41), OBJ_VRAM0 + (gSprites[r10].oam.tileNum + 1) * 32, 32);
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

    r6 = ewram520_2 + GetBattlerPosition(gSprites[a].data[6]) * 0x180;
    r8 = 7;
    sub_80034D4(r6, BattleText_SafariBalls);
    for (i = 0; i < r8; i++)
        CpuCopy32(sub_8043CDC(0x2B), r6 + i * 64, 32);
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
    r7 = ewram520_2 + status * 0x180;
    r6 = 5;
    sub_80034D4(r7, gDisplayedStringBattle);
    r7 = ewram520_2 + status * 0x180 + 32;
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
        r6 = sub_8045F58(ewram17850[a].unk4, ewram17850[a].unk8, ewram17850[a].unkC, &ewram17850[a].unk10, 6, 1);
    }
    else
    {
        u16 r5;
        s32 r8;

        r5 = GetScaledExpFraction(ewram17850[a].unk8, ewram17850[a].unkC, ewram17850[a].unk4, 8);
        if (r5 == 0)
            r5 = 1;
        r8 = ewram17850[a].unkC;
        r5 = ABS(r8 / r5);
        r6 = sub_8045F58(ewram17850[a].unk4, ewram17850[a].unk8, r8, &ewram17850[a].unk10, 8, r5);
    }
    if (c == 1 || (c == 0 && (!ewram17800[a].unk0_4)))
        sub_8045D58(a, c);
    if (r6 == -1)
        ewram17850[a].unk10 = 0;
    return r6;
}

static void sub_8045D58(u8 a, u8 b)
{
    u8 sp8[7];
    u8 r0;
    u8 r8;
    u8 i;

    switch (b)
    {
    case 0:
        r0 = sub_804602C(ewram17850[a].unk4, ewram17850[a].unk8, ewram17850[a].unkC, &ewram17850[a].unk10, sp8, 6);
        r8 = 3;
        if (r0 <= 0x18)
        {
            r8 = 0x38;
            if (r0 > 9)
                r8 = 0x2F;
        }
        for (i = 0; i < 6; i++)
        {
            u8 r4 = gSprites[ewram17850[a].unk0].data[5];
            if (i < 2)
                CpuCopy32(sub_8043CDC(r8) + sp8[i] * 32, OBJ_VRAM0 + (gSprites[r4].oam.tileNum + 2 + i) * 32, 32);
            else
                CpuCopy32(sub_8043CDC(r8) + sp8[i] * 32, OBJ_VRAM0 + 64 + (i + gSprites[r4].oam.tileNum) * 32, 32);
        }
        break;
    case 1:
        sub_804602C(ewram17850[a].unk4, ewram17850[a].unk8, ewram17850[a].unkC, &ewram17850[a].unk10, sp8, 8);
        r0 = GetMonData(&gPlayerParty[gBattlerPartyIndexes[a]], MON_DATA_LEVEL);
        if (r0 == 100)
        {
            for (i = 0; i < 8; i++)
                sp8[i] = 0;
        }
        for (i = 0; i < 8; i++)
        {
            if (i < 4)
                CpuCopy32(sub_8043CDC(0xC) + sp8[i] * 32, OBJ_VRAM0 + (gSprites[ewram17850[a].unk0].oam.tileNum + 0x24 + i) * 32, 32);
            else
                CpuCopy32(sub_8043CDC(0xC) + sp8[i] * 32, OBJ_VRAM0 + 0xB80 + (i + gSprites[ewram17850[a].unk0].oam.tileNum) * 32, 32);
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

static u8 sub_804602C(int a, int b, int c, int *d, u8 *e, u8 f)
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

    sub_804602C(a->unk0, a->unk4, a->unk8, b, (u8 *)sp8, 6);
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
