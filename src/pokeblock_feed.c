#include "global.h"
#include "task.h"
#include "palette.h"
#include "main.h"
#include "menu_helpers.h"
#include "text.h"
#include "text_window.h"
#include "menu.h"
#include "overworld.h"
#include "decompress.h"
#include "data2.h"
#include "sprite.h"
#include "item_use.h"
#include "pokeblock.h"
#include "party_menu.h"
#include "strings.h"
#include "string_util.h"
#include "m4a.h"
#include "field_effect.h"
#include "sound.h"
#include "trig.h"
#include "ewram.h"

extern struct MusicPlayerInfo gMPlay_BGM;
extern u8 gPokeblockMonID;
extern s16 gPokeblockGain;

extern const u8 gPokeblockRed_Pal[];
extern const u8 gPokeblockBlue_Pal[];
extern const u8 gPokeblockPink_Pal[];
extern const u8 gPokeblockGreen_Pal[];
extern const u8 gPokeblockYellow_Pal[];
extern const u8 gPokeblockPurple_Pal[];
extern const u8 gPokeblockIndigo_Pal[];
extern const u8 gPokeblockBrown_Pal[];
extern const u8 gPokeblockLiteBlue_Pal[];
extern const u8 gPokeblockOlive_Pal[];
extern const u8 gPokeblockGray_Pal[];
extern const u8 gPokeblockBlack_Pal[];
extern const u8 gPokeblockWhite_Pal[];
extern const u8 gPokeblockGold_Pal[];
extern const u8 gPokeblock_Gfx[];
extern const u8 gBattleTerrainTiles_Building[];
extern const u8 gUnknown_08E782FC[];
extern const u8 gBattleTerrainPalette_BattleTower[];
extern const struct CompressedSpriteSheet gUnknown_083F7F74;
extern const struct CompressedSpritePalette gUnknown_083F7F7C;

bool8 IsPokeSpriteNotFlipped(u16 species);

// this file's functions
static void sub_8147B04(void);
static void sub_81481DC(void);
static void sub_814825C(void);
static u8 sub_81480B4(void);
static u8 CreatePokeblockSprite(void);
static u8 PokeblockFeed_CreatePokeSprite(struct Pokemon* mon);
static bool8 sub_8147B20(struct Pokemon* mon);
static void LaunchPokeblockFeedTask(u8);
static void sub_8148044(u8);
static void sub_8148078(struct Sprite* sprite);
static void Task_PrintAtePokeblockText(u8 taskID);
static void Task_PaletteFadeToReturn(u8 taskID);
static void SetPokeblockFeedSpritePal(u8);
static void sub_8148108(u8, bool8);
static bool8 sub_8148540(void);
static bool8 sub_81485CC(void);
static bool8 FreePokeSpriteMatrix(void);
void sub_8148710(void);
static void SpriteCB_ThrownPokeblock(struct Sprite* sprite);
static void sub_814862C(void);

// EWRAM
EWRAM_DATA static struct CompressedSpritePalette sPokeblockFeedSpritePal = {0};

// IWRAM common
struct Sprite* gPokeblockFeedPokeSprite;
u16 gPokeblockFeedMonSpecies;
bool8 gPokeblockMonNotFlipped;
u8 gPokeblockFeedMonSpriteID;
u8 gPokeblockFeedMonNature;
u16 gUnknown_03005F34;
u8 gPokeblockFeedUnused0;
u8 gUnknown_03005F3C;
u8 gUnknown_03005F40;
struct Sprite gPokeblockFeedPokeSpriteCopy;
u16 gUnknown_03005F94;
s16 gUnknown_03005FA0[24];

// rodata

static const u8 sNatureToMonPokeblockAnim[][2] =
{
    {  0, 0 }, // HARDY
    {  3, 0 }, // LONELY
    {  4, 1 }, // BRAVE
    {  5, 0 }, // ADAMANT
    { 10, 0 }, // NAUGHTY
    { 13, 0 }, // BOLD
    { 15, 0 }, // DOCILE
    { 16, 2 }, // RELAXED
    { 18, 0 }, // IMPISH
    { 19, 0 }, // LAX
    { 20, 0 }, // TIMID
    { 25, 0 }, // HASTY
    { 27, 3 }, // SERIOUS
    { 28, 0 }, // JOLLY
    { 29, 0 }, // NAIVE
    { 33, 4 }, // MODEST
    { 36, 0 }, // MILD
    { 37, 0 }, // QUIET
    { 39, 0 }, // BASHFUL
    { 42, 0 }, // RASH
    { 45, 0 }, // CALM
    { 46, 5 }, // GENTLE
    { 47, 6 }, // SASSY
    { 48, 0 }, // CAREFUL
    { 53, 0 }, // QUIRKY
};

static const s16 sMonPokeblockAnims[][10] =
{
    // HARDY
    {   0,   4,   0,   8,  24,   0,   0,   0,  12,   0},
    {   0,   4,   0,  16,  24,   0,   0,   0,  12,   0},
    {   0,   4,   0,  32,  32,   0,   0,   0,  16,   1},

    // LONELY
    {   0,   3,   6,   0,  48,   0,   0,   0,  24,   1},

    // BRAVE
    {  64,  16, -24,   0,  32,   0,   0,   0,   0,   1},

    // ADAMANT
    {   0,   4,   8,   0,  16,   0,  -8,   0,   0,   0},
    {   0,   0,   0,   0,  16,   0,   0,   0,   0,   0},
    {   0,   4,   8,   0,  16,   0,  -8,   0,   0,   0},
    {   0,   0,   0,   0,  16,   0,   0,   0,   0,   0},
    {   0,   4, -16,   0,   4,   0,  16,   0,   0,   1},

    // NAUGHTY
    {   0,   3,   6,   0,  12,   0,   0,   0,   6,   0},
    {   0,   3,  -6,   0,  12,   0,   0,   0,   6,   0},
    {   0,  16,  16,   0,  45,   1,   0,   0,   0,   1},

    // BOLD
    {   0,  16,   0,  24,  32,   0,   0,   0,  16,   0},
    {   0,  16,   0,  23,  32,   0,   0,   0,  16,   1},

    // DOCILE
    {   0,   0,   0,   0,  80,   0,   0,   0,   0,   1},

    // RELAXED
    {   0,   2,   8,   0,  32,   0,   0,   0,   0,   0},
    {   0,   2,  -8,   0,  32,   0,   0,   0,   0,   1},

    // IMPISH
    {   0,  32,   2,   1,  48,   1,   0,   0,  24,   1},

    // LAX
    {   0,   2,  16,  16, 128,   0,   0,   0,   0,   1},

    // TIMID
    {   0,   2,  -8,   0,  48,   0, -24,   0,   0,   0},
    {   0,   0,   0,   0,   8,   0,   0,   0,   0,   0},
    {  64,  32,   2,   0,  36,   0,   0,   0,   0,   0},
    {   0,   0,   0,   0,   8,   0,   0,   0,   0,   0},
    {   0,   2,   8,   0,  48,   0,  24,   0,   0,   1},

    // HASTY
    {  64,  24,  16,   0,  32,   0,   0,   0,   0,   0},
    {   0,  28,   2,   1,  32,   1,   0,   0,  16,   1},

    // SERIOUS
    {   0,   0,   0,   0,  32,   0,   0,   0,   0,   1},

    // JOLLY
    {  64,  16, -16,   2,  48,   0,   0,   0,  32,   1},

    // NAIVE
    {   0,  12,  -8,   4,  24,   0,   8,   0,  12,   0},
    {   0,  12,   8,   8,  24,   0, -16,   0,  12,   0},
    {   0,  12,  -8,  16,  24,   0,  16,   0,  12,   0},
    {   0,  12,   8,  28,  24,   0,  -8,   0,  12,   1},

    // MODEST
    {   0,   0,   0,   0,   8,   0,   0,   0,   0,   0},
    {  64,  16,  -4,   0,  32,   0,   0,   0,   0,   0},
    {   0,   0,   0,   0,   8,   0,   0,   0,   0,   1},

    // MILD
    { 128,   4,   0,   8,  64,   0,   0,   0,   0,   1},

    // QUIET
    {   0,   2,  16,   0,  48,   0,   0,   0,   0,   0},
    { 128,   2,  16,   0,  48,   0,   0,   0,   0,   1},

    // BASHFUL
    {   0,   2,  -4,   0,  48,   0, -48,   0,   0,   0},
    {   0,   0,   0,   0,  80,   0,   0,   0,   0,   0},
    {   0,   2,   8,   0,  24,   0,  48,   0,   0,   1},

    // RASH
    {  64,   4,  64,  58,  52,   0, -88,   0,   0,   0},
    {   0,   0,   0,   0,  80,   0,   0,   0,   0,   0},
    {   0,  24,  80,   0,  32,   0,  88,   0,   0,   1},

    // CALM
    {   0,   2,  16,   4,  64,   0,   0,   0,   0,   1},

    // GENTLE
    {   0,   0,   0,   0,  32,   0,   0,   0,   0,   1},

    // SASSY
    {   0,   0,   0,   0,  42,   0,   0,   0,   0,   1},

    // CAREFUL
    {   0,   4,   0,   8,  24,   0,   0,   0,  12,   0},
    {   0,   0,   0,   0,  12,   0,   0,   0,   0,   0},
    {   0,   4,   0,  12,  24,   0,   0,   0,  12,   0},
    {   0,   0,   0,   0,  12,   0,   0,   0,   0,   0},
    {   0,   4,   0,   4,  24,   0,   0,   0,  12,   1},

    // QUIRKY
    {   0,   4,  16,  12,  64,   0,   0,   0,   0,   0},
    {   0,  -4,  16,  12,  64,   0,   0,   0,   0,   1},
};

static const union AffineAnimCmd sSpriteAffineAnim_8411E90[] =
{
    AFFINEANIMCMD_FRAME(-0x100, 0x100, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sSpriteAffineAnim_8411EA0[] =
{
    AFFINEANIMCMD_FRAME(0, 0, 12, 1),
    AFFINEANIMCMD_FRAME(0, 0, 0, 30),
    AFFINEANIMCMD_FRAME(0, 0, -12, 1),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sSpriteAffineAnim_8411EC0[] =
{
    AFFINEANIMCMD_FRAME(-0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0, 0, 12, 1),
    AFFINEANIMCMD_FRAME(0, 0, 0, 28),
    AFFINEANIMCMD_FRAME(0, 0, -4, 3),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sSpriteAffineAnim_8411EE8[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 1, 16),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -1, 32),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 1, 16),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sSpriteAffineAnim_8411F08[] =
{
    AFFINEANIMCMD_FRAME(-0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 1, 16),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -1, 32),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 1, 16),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sSpriteAffineAnim_8411F30[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -1, 8),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 16),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 1, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sSpriteAffineAnim_8411F50[] =
{
    AFFINEANIMCMD_FRAME(-0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -1, 8),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 16),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 1, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sSpriteAffineAnim_8411F78[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -1, 8),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 32),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 1, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sSpriteAffineAnim_8411F98[] =
{
    AFFINEANIMCMD_FRAME(-0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -1, 8),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 32),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 1, 8),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sSpriteAffineAnim_8411FC0[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, -1, 4),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 24),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 1, 4),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sSpriteAffineAnim_8411FE0[] =
{
    AFFINEANIMCMD_FRAME(-0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -1, 4),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 24),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 1, 4),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sSpriteAffineAnim_8412008[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 1, 24),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 16),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -12, 2),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sSpriteAffineAnim_8412028[] =
{
    AFFINEANIMCMD_FRAME(-0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 1, 24),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 16),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -12, 2),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sSpriteAffineAnimTable_8412050[] =
{
    sSpriteAffineAnim_8411E90,
    sSpriteAffineAnim_8411EA0,
    sSpriteAffineAnim_8411EE8,
    sSpriteAffineAnim_8411F30,
    sSpriteAffineAnim_8411F78,
    sSpriteAffineAnim_8411FC0,
    sSpriteAffineAnim_8412008,
    sSpriteAffineAnim_8411E90,
    sSpriteAffineAnim_8411E90,
    sSpriteAffineAnim_8411E90,
    sSpriteAffineAnim_8411E90,
    sSpriteAffineAnim_8411EC0,
    sSpriteAffineAnim_8411F08,
    sSpriteAffineAnim_8411F50,
    sSpriteAffineAnim_8411F98,
    sSpriteAffineAnim_8411FE0,
    sSpriteAffineAnim_8412028,
    sSpriteAffineAnim_8411E90,
    sSpriteAffineAnim_8411E90,
    sSpriteAffineAnim_8411E90,
    sSpriteAffineAnim_8411E90,
};

static const u8* const sPokeblocksPals[] =
{
    gPokeblockRed_Pal,
    gPokeblockBlue_Pal,
    gPokeblockPink_Pal,
    gPokeblockGreen_Pal,
    gPokeblockYellow_Pal,
    gPokeblockPurple_Pal,
    gPokeblockIndigo_Pal,
    gPokeblockBrown_Pal,
    gPokeblockLiteBlue_Pal,
    gPokeblockOlive_Pal,
    gPokeblockGray_Pal,
    gPokeblockBlack_Pal,
    gPokeblockWhite_Pal,
    gPokeblockGold_Pal
};

static const union AffineAnimCmd sSpriteAffineAnim_84120DC[] =
{
    AFFINEANIMCMD_FRAME(-0x100, 0x100, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sSpriteAffineAnimTable_84120EC[] =
{
    sSpriteAffineAnim_84120DC
};

static const union AffineAnimCmd sSpriteAffineAnim_84120F0[] =
{
    AFFINEANIMCMD_FRAME(-0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -8, 1),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -8, 1),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -8, 1),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -8, 1),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 16, 1),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 16, 1),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 16, 1),
    AFFINEANIMCMD_FRAME(-0x100, 0x100, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd sSpriteAffineAnim_8412148[] =
{
    AFFINEANIMCMD_FRAME(-0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 8, 1),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 8, 1),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 8, 1),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 8, 1),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 0, 8),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -16, 1),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -16, 1),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -16, 1),
    AFFINEANIMCMD_FRAME(-0x100, 0x100, 0, 0),
    AFFINEANIMCMD_END
};

static const union AffineAnimCmd *const sSpriteAffineAnimTable_84121A0[] =
{
    sSpriteAffineAnim_84120DC
};

static const union AffineAnimCmd *const sSpriteAffineAnimTable_84121A4[] =
{
    sSpriteAffineAnim_84120F0
};

static const union AffineAnimCmd *const sSpriteAffineAnimTable_84121A8[] =
{
    sSpriteAffineAnim_8412148
};

static const struct OamData sThrownPokeblockOamData =
{
    .y = 0,
    .affineMode = 3,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
    .affineParam = 0,
};

static const union AnimCmd sThrownPokeblockSpriteAnim[] =
{
    ANIMCMD_FRAME(0, 0),
    ANIMCMD_END
};

static const union AnimCmd *const sThrownPokeblockAnimTable[] =
{
    sThrownPokeblockSpriteAnim,
};

static const union AffineAnimCmd sSpriteAffineAnim_84121C0[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(-8, -8, 0, 1),
    AFFINEANIMCMD_JUMP(1)
};

static const union AffineAnimCmd *const sThrownPokeblockAffineAnimTable[] =
{
    sSpriteAffineAnim_84121C0
};

static const struct CompressedSpriteSheet sUnknown_084121DC =
{
    gPokeblock_Gfx, 0x20, 14818
};

static const struct SpriteTemplate sThrownPokeblockSpriteTemplate =
{
    .tileTag = 14818,
    .paletteTag = 14818,
    .oam = &sThrownPokeblockOamData,
    .anims = sThrownPokeblockAnimTable,
    .images = NULL,
    .affineAnims = sThrownPokeblockAffineAnimTable,
    .callback = SpriteCB_ThrownPokeblock
};

// code

static void CB2_PokeblockFeed(void)
{
    AnimateSprites();
    BuildOamBuffer();
    RunTasks();
    UpdatePaletteFade();
}

static void VBlankCB_PokeblockFeed(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static bool8 TransitionToPokeblockFeedScene(void)
{
    switch (gMain.state)
    {
    case 0:
        ClearVideoCallbacks();
        sub_80F9368();
        sub_8147B04();
        gMain.state++;
        break;
    case 1:
        ResetPaletteFade();
        gPaletteFade.bufferTransferDisabled = 1;
        gMain.state++;
        break;
    case 2:
        ResetSpriteData();
        gMain.state++;
        break;
    case 3:
        FreeAllSpritePalettes();
        gMain.state++;
        break;
    case 4:
        Text_LoadWindowTemplate(&gWindowTemplate_81E6E50);
        gMain.state++;
        break;
    case 5:
        MultistepInitMenuWindowBegin(&gWindowTemplate_81E6E50);
        gMain.state++;
        break;
    case 6:
        if (MultistepInitMenuWindowContinue())
        {
            ewram1FFFF = 0;
            gMain.state++;
        }
        break;
    case 7:
        if (sub_8147B20(&gPlayerParty[gPokeblockMonID]))
        {
            gMain.state++;
        }
        break;
    case 8:
        ewram1FFFD = sub_81480B4();
        gMain.state++;
        break;
    case 9:
        ewram1FFFE = PokeblockFeed_CreatePokeSprite(&gPlayerParty[gPokeblockMonID]);
        gMain.state++;
        break;
    case 10:
        Menu_DrawStdWindowFrame(0, 14, 29, 19);
        gMain.state++;
        break;
    case 11:
        if (sub_8055870() != 1)
        {
            gMain.state++;
        }
        break;
    case 12:
        {
            u16 savedIME = REG_IME;
            REG_IME = 0;
            REG_IE |= 1;
            REG_IME = savedIME;
            REG_DISPSTAT |= 8;
            SetVBlankCallback(VBlankCB_PokeblockFeed);
            gMain.state++;
        }
    case 13:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        gPaletteFade.bufferTransferDisabled = 0;
        SetMainCallback2(CB2_PokeblockFeed);
        return TRUE;
    }
    return FALSE;
}

void CB2_PreparePokeblockFeedScene(void)
{
    while (1)
    {
        if (TransitionToPokeblockFeedScene() == 1)
        {
            LaunchPokeblockFeedTask(1);
            break;
        }
        if (sub_80F9344() == 1)
            break;
    }
}

static void sub_8147B04(void)
{
    REG_BG1CNT = 0x1D02l;
    REG_DISPCNT = 0x1340;
}

static bool8 sub_8147B20(struct Pokemon* mon)
{
    u16 species;
    u32 PiD, TiD;
    switch (ewram1FFFF)
    {
    case 0:
        species = GetMonData(mon, MON_DATA_SPECIES2);
        PiD = GetMonData(mon, MON_DATA_PERSONALITY);
        HandleLoadSpecialPokePic(&gMonFrontPicTable[species], gMonFrontPicCoords[species].coords, gMonFrontPicCoords[species].y_offset, 0x2000000, gUnknown_081FAF4C[1], species, PiD);
        ewram1FFFF++;
        break;
    case 1:
        {
            const struct CompressedSpritePalette* palette;

            species = GetMonData(mon, MON_DATA_SPECIES2);
            PiD = GetMonData(mon, MON_DATA_PERSONALITY);
            TiD = GetMonData(mon, MON_DATA_OT_ID);
            palette = GetMonSpritePalStructFromOtIdPersonality(species, TiD, PiD);
            LoadCompressedObjectPalette(palette);
            GetMonSpriteTemplate_803C56C(palette->tag, 1);
            ewram1FFFF++;
        }
        break;
    case 2:
        LoadCompressedObjectPic(&gUnknown_083F7F74);
        ewram1FFFF++;
        break;
    case 3:
        LoadCompressedObjectPalette(&gUnknown_083F7F7C);
        ewram1FFFF++;
        break;
    case 4:
        LoadCompressedObjectPic(&sUnknown_084121DC);
        ewram1FFFF++;
        break;
    case 5:
        SetPokeblockFeedSpritePal(gSpecialVar_ItemId);
        LoadCompressedObjectPalette(&sPokeblockFeedSpritePal);
        ewram1FFFF++;
        break;
    case 6:
        LZDecompressVram(gBattleTerrainTiles_Building, (void*)(VRAM));
        ewram1FFFF++;
        break;
    case 7:
        LZDecompressVram(gUnknown_08E782FC, (void*)(VRAM + 0xE800));
        ewram1FFFF++;
        break;
    case 8:
        LoadCompressedPalette(gBattleTerrainPalette_BattleTower, 0x20, 0x60);
        ewram1FFFF = 0;
        return TRUE;
    }
    return FALSE;
}

static void SetPokeblockFeedSpritePal(u8 pkbID)
{
    u8 color = GetPokeblockData(&gSaveBlock1.pokeblocks[pkbID], PBLOCK_COLOR);
    sPokeblockFeedSpritePal.data = sPokeblocksPals[color - 1];
    sPokeblockFeedSpritePal.tag = 0x39E2;
}

static void sub_8147CC8(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        switch (gTasks[taskID].data[0])
        {
        case 0:
            gUnknown_03005F3C = 0;
            gUnknown_03005F94 = 0;
            sub_81481DC();
            break;
        case 255:
            sub_8148108(ewram1FFFD, gTasks[taskID].data[1]);
            break;
        case 269:
            ewram1FFFC = CreatePokeblockSprite();
            break;
        case 281:
            sub_8148044(ewram1FFFE);
            break;
        case 297:
            gTasks[taskID].func = Task_PrintAtePokeblockText;
            return;
        }
        if (gUnknown_03005F94 < gUnknown_03005F34)
            sub_814825C();
        else if (gUnknown_03005F94 == gUnknown_03005F34)
            gTasks[taskID].data[0] = 254;

        gUnknown_03005F94++;
        gTasks[taskID].data[0]++;
    }
}

static void LaunchPokeblockFeedTask(u8 a0)
{
    u8 taskID = CreateTask(sub_8147CC8, 0);
    gTasks[taskID].data[0] = 0;
    gTasks[taskID].data[1] = a0;
}

static void Task_WaitForAtePokeblockText(u8 taskID)
{
    if (Menu_UpdateWindowText() == 1)
        gTasks[taskID].func = Task_PaletteFadeToReturn;
}

static void Task_PrintAtePokeblockText(u8 taskID)
{
    struct Pokemon* mon = &gPlayerParty[gPokeblockMonID];
    struct Pokeblock* pokeblock = &gSaveBlock1.pokeblocks[gSpecialVar_ItemId];

    gPokeblockGain = PokeblockGetGain(GetNature(mon), pokeblock);
    GetMonNickname(mon, gStringVar1);
    PokeblockCopyName(pokeblock, gStringVar2);

    if (gPokeblockGain == 0)
        StringExpandPlaceholders(gStringVar4, gContestStatsText_NormallyAte);
    else if (gPokeblockGain > 0)
        StringExpandPlaceholders(gStringVar4, gContestStatsText_HappilyAte);
    else
        StringExpandPlaceholders(gStringVar4, gContestStatsText_DisdainfullyAte);

    MenuPrintMessage(gStringVar4, 1, 15);
    gTasks[taskID].func = Task_WaitForAtePokeblockText;
}

static void Task_ReturnAfterPaletteFade(u8 taskID)
{
    if (!gPaletteFade.active)
    {
        m4aMPlayVolumeControl(&gMPlay_BGM, -1, 256);
        SetMainCallback2(gMain.savedCallback);
        DestroyTask(taskID);
    }
}

static void Task_PaletteFadeToReturn(u8 taskID)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gTasks[taskID].func = Task_ReturnAfterPaletteFade;
}

static u8 PokeblockFeed_CreatePokeSprite(struct Pokemon* mon)
{
    u16 species = GetMonData(mon, MON_DATA_SPECIES2);
    u8 spriteID = CreateSprite(&gUnknown_02024E8C, 48, 80, 2);

    gPokeblockFeedMonSpecies = species;
    gPokeblockFeedMonSpriteID = spriteID;
    gPokeblockFeedMonNature = GetNature(mon);
    gSprites[spriteID].data[2] = species;
    gSprites[spriteID].callback = SpriteCallbackDummy;
    gPokeblockMonNotFlipped = 1;
    if (!IsPokeSpriteNotFlipped(species))
    {
        gSprites[spriteID].affineAnims = sSpriteAffineAnimTable_84120EC;
        gSprites[spriteID].oam.affineMode = 3;
        CalcCenterToCornerVec(&gSprites[spriteID], gSprites[spriteID].oam.shape, gSprites[spriteID].oam.size, gSprites[spriteID].oam.affineMode);
        gPokeblockMonNotFlipped = 0;
    }
    return spriteID;
}

static void sub_8148044(u8 spriteID)
{
    gSprites[spriteID].pos1.x = 48;
    gSprites[spriteID].pos1.y = 80;
    gSprites[spriteID].data[0] = -8;
    gSprites[spriteID].data[1] = 1;
    gSprites[spriteID].callback = sub_8148078;
}

static void sub_8148078(struct Sprite* sprite)
{
    sprite->pos1.x += 4;
    sprite->pos1.y += sprite->data[0];
    sprite->data[0] += sprite->data[1];
    if (sprite->data[0] == 0)
        PlayCry1(sprite->data[2], 0);
    if (sprite->data[0] == 9)
        sprite->callback = SpriteCallbackDummy;
}

static u8 sub_81480B4(void)
{
    u8 spriteID = sub_810BA50(188, 100, 2);
    gSprites[spriteID].oam.affineMode = 1;
    gSprites[spriteID].affineAnims = sSpriteAffineAnimTable_84121A0;
    gSprites[spriteID].callback = SpriteCallbackDummy;
    InitSpriteAffineAnim(&gSprites[spriteID]);
    return spriteID;
}

static void sub_8148108(u8 spriteID, bool8 a1)
{
    FreeOamMatrix(gSprites[spriteID].oam.matrixNum);
    gSprites[spriteID].oam.affineMode = 3;
    if (!a1)
        gSprites[spriteID].affineAnims = sSpriteAffineAnimTable_84121A4;
    else
        gSprites[spriteID].affineAnims = sSpriteAffineAnimTable_84121A8;
    InitSpriteAffineAnim(&gSprites[spriteID]);
}

static u8 CreatePokeblockSprite(void)
{
    u8 spriteID = CreateSprite(&sThrownPokeblockSpriteTemplate, 174, 84, 1);
    gSprites[spriteID].data[0] = -12;
    gSprites[spriteID].data[1] = 1;
    return spriteID;
}

static void SpriteCB_ThrownPokeblock(struct Sprite* sprite)
{
    sprite->pos1.x -= 4;
    sprite->pos1.y += sprite->data[0];
    sprite->data[0] += sprite->data[1];
    if (sprite->data[0] == 10)
        DestroySprite(sprite);
}

static void sub_81481DC(void)
{
    u8 animID, i;

    gUnknown_03005F34 = 1;
    animID = sNatureToMonPokeblockAnim[gPokeblockFeedMonNature][0];
    for (i = 0; i < 8; i++, animID++)
    {
        gUnknown_03005F34 += sMonPokeblockAnims[animID][4];
        if (sMonPokeblockAnims[animID][9] == 1)
            break;
    }
}

static void sub_814825C(void)
{
    switch (gUnknown_03005F3C)
    {
    case 0:
        gUnknown_03005F40 = sNatureToMonPokeblockAnim[gPokeblockFeedMonNature][0];
        gPokeblockFeedPokeSprite = &gSprites[gPokeblockFeedMonSpriteID];
        gPokeblockFeedPokeSpriteCopy = *gPokeblockFeedPokeSprite;
        gUnknown_03005F3C = 10;
        break;
    case 1 ... 9:
        break;
    case 10:
        sub_8148540();
        if (sNatureToMonPokeblockAnim[gPokeblockFeedMonNature][1] != 0)
        {
            gPokeblockFeedPokeSprite->oam.affineMode = 3;
            gPokeblockFeedPokeSprite->oam.matrixNum = 0;
            gPokeblockFeedPokeSprite->affineAnims = sSpriteAffineAnimTable_8412050;
            InitSpriteAffineAnim(gPokeblockFeedPokeSprite);
        }
        gUnknown_03005F3C = 50;
    case 50:
        if (sNatureToMonPokeblockAnim[gPokeblockFeedMonNature][1] != 0)
        {
            if (gPokeblockMonNotFlipped == 0)
                StartSpriteAffineAnim(gPokeblockFeedPokeSprite, sNatureToMonPokeblockAnim[gPokeblockFeedMonNature][1] + 10);
            else
                StartSpriteAffineAnim(gPokeblockFeedPokeSprite, sNatureToMonPokeblockAnim[gPokeblockFeedMonNature][1]);
        }
        gUnknown_03005F3C = 60;
        break;
    case 60:
        if (sub_81485CC() == 1)
        {
            if (gUnknown_03005FA0[9] == 0)
            {
                gUnknown_03005F40++;
                sub_8148540();
                gUnknown_03005F3C = 60;
            }
            else
            {
                FreeOamMatrix(gPokeblockFeedPokeSprite->oam.matrixNum);
                gUnknown_03005F3C = 70;
            }
        }
        break;
    case 70:
        FreePokeSpriteMatrix();
        gUnknown_03005F40 = 0;
        gUnknown_03005F3C = 0;
        break;
    case 71 ... 90:
        break;
    }
}

static bool8 sub_8148540(void)
{
    u8 i;
    for (i = 0; i < 10; i++)
        gUnknown_03005FA0[i] = sMonPokeblockAnims[gUnknown_03005F40][i];
    if (gUnknown_03005FA0[4] == 0)
        return TRUE;
    else
    {
        gUnknown_03005FA0[10] = Sin(gUnknown_03005FA0[0], gUnknown_03005FA0[2]);
        gUnknown_03005FA0[11] = Cos(gUnknown_03005FA0[0], gUnknown_03005FA0[3]);
        gUnknown_03005FA0[12] = gUnknown_03005FA0[4];
        gUnknown_03005FA0[13] = gPokeblockFeedPokeSprite->pos2.x;
        gUnknown_03005FA0[14] = gPokeblockFeedPokeSprite->pos2.y;
        sub_8148710();
        gUnknown_03005FA0[4] = gUnknown_03005FA0[12];
        sub_814862C();
        gUnknown_03005FA0[4] = gUnknown_03005FA0[12];
        return FALSE;
    }
}

static bool8 sub_81485CC(void)
{
    u16 var = gUnknown_03005FA0[12] - gUnknown_03005FA0[4];

    gPokeblockFeedPokeSprite->pos2.x = ewram1D000_2[var];
    gPokeblockFeedPokeSprite->pos2.y = ewram1D400[var];

    if (--gUnknown_03005FA0[4] == 0)
        return TRUE;
    else
        return FALSE;
}

static bool8 FreePokeSpriteMatrix(void)
{
    FreeSpriteOamMatrix(gPokeblockFeedPokeSprite);
    return FALSE;
}

static void sub_814862C(void)
{
    u16 i;
    u16 r8 = gUnknown_03005FA0[8];
    u16 r7 = gUnknown_03005FA0[12] - r8;
    s16 var3 = gUnknown_03005FA0[13] + gUnknown_03005FA0[6];
    s16 r9 = gUnknown_03005FA0[14] + gUnknown_03005FA0[7];

    for (i = 0; i < r7 - 1; i++)
    {
        s16* r3 = &ewram1D000_2[r8 + i];
        s16 r1 = *r3 - (var3);

        s16* r5 = &ewram1D400[r8 + i];
        s16 r4 = *r5 - r9;

        *r3 -= r1 * (i + 1) / r7;
        *r5 -= r4 * (i + 1) / r7;
    }

    ewram1D000_2[(r8 + r7) - 1] = var3;
    ewram1D400[(r8 + r7) - 1] = r9;
}

void sub_8148710(void)
{
    bool8 var_24 = FALSE;
    s16 r8 = gUnknown_03005FA0[13] - gUnknown_03005FA0[10];
    s16 r7 = gUnknown_03005FA0[14] - gUnknown_03005FA0[11];
    while (1)
    {
        u16 r5;
        u16 r4;
        u16 var;

        var = abs(gUnknown_03005FA0[5]);
        r5 = var + gUnknown_03005FA0[3];
        gUnknown_03005FA0[3] = r5;

        if (gUnknown_03005FA0[2] < 0)
            var_24 = TRUE;

        r4 = gUnknown_03005FA0[12] - gUnknown_03005FA0[4];

        if (gUnknown_03005FA0[4] == 0)
            break;

        if (!var_24)
        {
            ewram1D000_2[r4] = Sin(gUnknown_03005FA0[0], gUnknown_03005FA0[2] + r5 / 256) + r8;
            ewram1D400[r4] = Cos(gUnknown_03005FA0[0], gUnknown_03005FA0[3] + r5 / 256) + r7;
        }
        else
        {
            ewram1D000_2[r4] = Sin(gUnknown_03005FA0[0], gUnknown_03005FA0[2] - r5 / 256) + r8;
            ewram1D400[r4] = Cos(gUnknown_03005FA0[0], gUnknown_03005FA0[3] - r5 / 256) + r7;
        }

        gUnknown_03005FA0[0] += gUnknown_03005FA0[1];
        gUnknown_03005FA0[0] &= 0xFF;
        gUnknown_03005FA0[4]--;
    }
}
