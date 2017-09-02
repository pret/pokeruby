#include "global.h"
#include "name_string_util.h"
#include "string_util.h"
#include "text.h"
#include "main.h"
#include "species.h"
#include "items.h"
#include "moves.h"
#include "easy_chat.h"
#include "link.h"
#include "strings2.h"
#include "graphics.h"
#include "palette.h"
#include "task.h"
#include "menu.h"
#include "text_window.h"
#include "pokemon_icon.h"
#include "cable_club.h"
#include "party_menu.h"
#include "songs.h"
#include "sound.h"
#include "data2.h"
#include "trade.h"

#ifdef ENGLISH
#define sub_804A96C_alt sub_804A96C
#endif

struct InGameTrade {
    /*0x00*/ u8 name[11];
    /*0x0C*/ u16 species;
    /*0x0E*/ u8 ivs[6];
    /*0x14*/ bool8 secondAbility;
    /*0x18*/ u32 otId;
    /*0x1C*/ u8 stats[5];
    /*0x24*/ u32 personality;
    /*0x28*/ u16 heldItem;
    /*0x2A*/ u8 mailNum;
    /*0x2B*/ u8 otName[11];
    /*0x36*/ u8 otGender;
    /*0x37*/ u8 sheen;
    /*0x38*/ u16 playerSpecies;
};

struct UnkStructC {
    /*0x00*/ u16 words[9];
    /*0x10*/ u8 string[8];
    /*0x1A*/ u8 otId[4];
    /*0x1E*/ u16 species;
    /*0x20*/ u16 heldItem;
};

struct UnkStructD {
    /*0x00*/ u8 pad00[0x10];
    /*0x10*/ u8 var10;
    /*0x11*/ u8 pad11[1];
    /*0x12*/ u16 var12[1];
};

struct UnkStructE {
    /*0x00*/ u8 filler_00[8];
    /*0x08*/ void *vramAddr;
    /*0x0c*/ u8 filler_0c[4];
    /*0x10*/ u8 unk_10;
    /*0x12*/ u16 unk_12[0x400];
};

struct TradeEwramSubstruct {
    /*0x0000*/ u8 unk_0000;
    /*0x0001*/ u8 unk_0001;
    /*0x0004*/ struct Window window;
    /*0x0034*/ u8 playerPartyIcons[6];
    /*0x003a*/ u8 friendPartyIcons[6];
    /*0x0040*/ u8 unk_0040;
    /*0x0041*/ u8 tradeMenuCursorPosition;
    /*0x0042*/ u8 playerPartyCount;
    /*0x0043*/ u8 friendPartyCount;
    /*0x0044*/ u8 tradeMenuOptionsActive[13];
    /*0x0051*/ u8 filler_0051[0x24];
    /*0x0075*/ u8 unk_0075;
    /*0x0076*/ u8 filler_0076[4];
    /*0x007a*/ u8 unk_007a;
    /*0x007b*/ u8 unk_007b;
    /*0x007c*/ u8 unk_007c;
    /*0x007d*/ u8 unk_007d;
    /*0x007e*/ u16 unk_007e;
    /*0x0080*/ u8 unk_0080;
    /*0x0081*/ u8 unk_0081;
    /*0x0082*/ u8 filler_0082[2];
    /*0x0084*/ u8 unk_0084;
    /*0x0085*/ u8 unk_0085;
    /*0x0086*/ u8 unk_0086;
    /*0x0087*/ u8 unk_0087;
    /*0x0088*/ u8 filler_0088[2];
    /*0x008a*/ u8 unk_008a;
    /*0x008b*/ u8 unk_008b;
    /*0x008c*/ u16 linkData[20];
    /*0x00b4*/ u8 unk_00b4;
    /*0x00b5*/ u8 unk_00b5[7];
    /*0x00bc*/ u8 filler_00bc[12];
    /*0x00c8*/ struct UnkStructE unk_00c8;
    /*0x08dc*/ u8 filler_04dc[0x724];
};

struct UnkStructF {
    u8 filler_0000[9];
    u8 unk_0009;
    u8 filler_000a[0xff6];
};

struct TradeEwramStruct {
    /*0x00000*/ u8 filler_00000[0x7000];
    /*0x07000*/ struct TradeEwramSubstruct unk_07000;
    /*0x08000*/ struct UnkStructF unk_08000;
    /*0x09000*/ u8 filler_09000[0x4000];
    /*0x0d000*/ u8 tileBuffers[13][256];
};

static void sub_8047EC0(void);
/*static*/ void sub_804AFB8(const struct WindowConfig *, u8 *, const u8 *, u8);
/*static*/ void sub_804ACD8(const u8 *, u8 *, u8);
static void nullsub_5(u8, u8);
/*static*/ void sub_804AA88(void);
/*static*/ void sub_804A964(struct UnkStructE *, void *);
static void sub_80489F4(void);
/*static*/ void sub_804AA0C(u8);
static bool8 sub_8048D44(void);
/*static*/ void sub_804AF84(void);
/*static*/ bool8 sub_804ABF8(void);
/*static*/ void sub_804ACF4(u8);
/*static*/ void sub_804A41C(u8);
static void sub_8048C70(void);
static void sub_8048B0C(u8);
/*static*/ void sub_804AE3C(u8);
/*static*/ void sub_804AF10(void);
static void sub_80494D8(void);
static void sub_8048AB4(void);
/*static*/ void sub_804A940(struct UnkStructE *);
/*static*/ void sub_804B41C(void);
/*static*/ void sub_8049DE0(void);
/*static*/ void sub_804AB30(void);
/*static*/ void sub_8049ED4(u8);
/*static*/ void sub_804A6DC(u8);
/*static*/ void sub_804A938(struct UnkStructE *);
/*static*/ u8 sub_804A9F4(void);
/*static*/ u8 sub_804AA00(void);
/*static*/ void sub_8049E9C(u8);
/*static*/ void sub_804AADC(u8, u8);

extern u8 gUnknown_020297D8[2];
extern u8 *gUnknown_020296CC[13];
extern struct TradeEwramSubstruct *gUnknown_03004824;
extern u8 gUnknown_03000508;
extern struct MailStruct gUnknown_02029700[16];

#define ewram_2010000 (*(struct TradeEwramStruct *)(ewram + 0x10000))


const u32 unref_data_820ABD4[] = {
    0x00000890,
    0x00003AC0,
    0x0000001C,
    0x00000530,
    0x00000024,
    0x00000064,
    0x000004D8
};

const u16 gTradeMovesBoxTilemap[] = INCBIN_U16("graphics/trade/moves_box_map.bin");
const u16 gTradePartyBoxTilemap[] = INCBIN_U16("graphics/trade/party_box_map.bin");
const u16 gTradeStripesBG2Tilemap[] = INCBIN_U16("graphics/trade/stripes_bg2_map.bin");
const u16 gTradeStripesBG3Tilemap[] = INCBIN_U16("graphics/trade/stripes_bg3_map.bin");

const struct OamData gOamData_820BFEC = {
    .shape = ST_OAM_H_RECTANGLE,
    .size = 2,
    .priority = 1
};

const union AnimCmd gSpriteAnim_820BFF4[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_820BFFC[] = {
    ANIMCMD_FRAME(8, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_820C004[] = {
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_820C00C[] = {
    ANIMCMD_FRAME(24, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_820C014[] = {
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_820C01C[] = {
    ANIMCMD_FRAME(40, 5),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_820C024[] = {
    gSpriteAnim_820BFF4,
    gSpriteAnim_820BFFC,
    gSpriteAnim_820C004,
    gSpriteAnim_820C00C,
    gSpriteAnim_820C014,
    gSpriteAnim_820C01C
};

const u16 TradeScreenTextPalette[] = INCBIN_U16("graphics/trade/text1.gbapal");
const u16 UnrefTradeScreenTextPalette[] = INCBIN_U16("graphics/trade/text2.gbapal");

const struct SpriteSheet gUnknown_0820C07C[] = {
    {ewram_2010000.tileBuffers[ 0], 256, 200},
    {ewram_2010000.tileBuffers[ 1], 256, 201},
    {ewram_2010000.tileBuffers[ 2], 256, 202},
    {ewram_2010000.tileBuffers[ 3], 256, 203},
    {ewram_2010000.tileBuffers[ 4], 256, 204},
    {ewram_2010000.tileBuffers[ 5], 256, 205},
    {ewram_2010000.tileBuffers[ 6], 256, 206},
    {ewram_2010000.tileBuffers[ 7], 256, 207},
    {ewram_2010000.tileBuffers[ 8], 256, 208},
    {ewram_2010000.tileBuffers[ 9], 256, 209},
    {ewram_2010000.tileBuffers[10], 256, 210},
    {ewram_2010000.tileBuffers[11], 256, 211},
    {ewram_2010000.tileBuffers[12], 256, 212},
};

const struct SpritePalette gSpritePalette_TradeScreenText = {
    TradeScreenTextPalette, 4925
};

const struct SpriteTemplate gSpriteTemplate_820C0EC = {
    200,
    4925,
    &gOamData_820BFEC,
    gSpriteAnimTable_820C024,
    NULL,
    gDummySpriteAffineAnimTable,
    SpriteCallbackDummy
};

const struct OamData gOamData_820C104 = {
    .shape = ST_OAM_H_RECTANGLE,
    .size = 3,
    .priority = 1
};

const union AnimCmd gSpriteAnim_820C10C[] = {
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_820C114[] = {
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_820C11C[] = {
    gSpriteAnim_820C10C,
    gSpriteAnim_820C114
};

const struct SpriteSheet gUnknown_0820C124 = {
    gUnknown_08EA1DEC, 0x800, 300
};

const struct SpritePalette gUnknown_0820C12C = {
    gUnknown_08EA0328, 2345
};

const struct SpriteTemplate gSpriteTemplate_820C134 = {
    300,
    2345,
    &gOamData_820C104,
    gSpriteAnimTable_820C11C,
    NULL,
    gDummySpriteAffineAnimTable,
    SpriteCallbackDummy
};

const u8 *const gUnknown_0820C14C[] = {
    TradeText_Cancel,
    TradeText_ChoosePoke,
    TradeText_Summary1,
    TradeText_Trade1,
    TradeText_CancelTradePrompt,
    TradeText_PressBToExit
};

// This is used to determine the next mon to select when the D-Pad is
// pressed in a given direction.
// Note that the mons are laid out like this.
// 0-5 are the player's party and 6-11 are the trading partner's party.
// 12 is the cancel button.
//  0  1  6  7
//  2  3  8  9
//  4  5 10 11
//          12

const u8 gTradeNextSelectedMonTable[][4][6] = {
    {
        { 4,  2, 12, 12,  0,  0},
        { 2,  4, 12, 12,  0,  0},
        { 7,  6,  1,  0,  0,  0},
        { 1,  6,  7,  0,  0,  0}
    }, {
        { 5,  3, 12, 12,  0,  0},
        { 3,  5, 12, 12,  0,  0},
        { 0,  7,  6,  1,  0,  0},
        { 6,  7,  0,  1,  0,  0}
    }, {
        { 0,  0,  0,  0,  0,  0},
        { 4,  0,  0,  0,  0,  0},
        { 9,  8,  7,  6,  0,  0},
        { 3,  1,  0,  0,  0,  0}
    }, {
        { 1,  1,  1,  1,  0,  0},
        { 5,  1,  1,  1,  0,  0},
        { 2,  9,  8,  7,  0,  0},
        { 8,  9,  6,  6,  0,  0}
    }, {
        { 2,  2,  2,  2,  0,  0},
        { 0,  0,  0,  0,  0,  0},
        {11, 10,  9,  8,  7,  6},
        { 5,  3,  1,  0,  0,  0}
    }, {
        { 3,  3,  3,  3,  0,  0},
        { 1,  1,  1,  1,  0,  0},
        { 4,  4,  4,  4,  0,  0},
        {10,  8,  6,  0,  0,  0}
    }, {
        {10,  8, 12,  0,  0,  0},
        { 8, 10, 12,  0,  0,  0},
        { 1,  0,  0,  0,  0,  0},
        { 7,  0,  1,  0,  0,  0}
    }, {
        {12,  0,  0,  0,  0,  0},
        { 9, 12,  0,  0,  0,  0},
        { 6,  0,  0,  0,  0,  0},
        { 0,  0,  0,  0,  0,  0}
    }, {
        { 6,  0,  0,  0,  0,  0},
        {10,  6,  0,  0,  0,  0},
        { 3,  2,  1,  0,  0,  0},
        { 9,  7,  0,  0,  0,  0}
    }, {
        { 7,  0,  0,  0,  0,  0},
        {11, 12,  0,  0,  0,  0},
        { 8,  0,  0,  0,  0,  0},
        { 2,  1,  0,  0,  0,  0}
    }, {
        { 8,  0,  0,  0,  0,  0},
        { 6,  0,  0,  0,  0,  0},
        { 5,  4,  3,  2,  1,  0},
        {11,  9,  7,  0,  0,  0}
    }, {
        { 9,  0,  0,  0,  0,  0},
        {12,  0,  0,  0,  0,  0},
        {10,  0,  0,  0,  0,  0},
        { 4,  2,  0,  0,  0,  0}
    }, {
        {11,  9,  7,  6,  0,  0},
        { 7,  6,  0,  0,  0,  0},
        {12,  0,  0,  0,  0,  0},
        {12,  0,  0,  0,  0,  0}
    }
};

const u8 gTradeMonSpriteCoords[][2] = {
    // Your party
    {1, 5},
    {8, 5},
    {1, 10},
    {8, 10},
    {1, 15},
    {8, 15},

    // Friend's party
    {16, 5},
    {23, 5},
    {16, 10},
    {23, 10},
    {16, 15},
    {23, 15},

    {23, 18} // CANCEL
};

const u8 gTradeLevelDisplayCoords[][2] = {
    // Your party
    { 5,  4},
    {12,  4},
    { 5,  9},
    {12,  9},
    { 5, 14},
    {12, 14},

    // Friend's party
    {20,  4},
    {27,  4},
    {20,  9},
    {27,  9},
    {20, 14},
    {27, 14}
};

const u8 gTradeMonBoxCoords[][2] = {
    // Your party
    { 1,  3},
    { 8,  3},
    { 1,  8},
    { 8,  8},
    { 1, 13},
    { 8, 13},

    // Friend's party
    {16,  3},
    {23,  3},
    {16,  8},
    {23,  8},
    {16, 13},
    {23, 13}
};

const u8 gTradeUnknownSpriteCoords[][2][2] = {
    {
        { 59, 10},
        {179, 10},
    },
    {
        { 59, 10},
        {179, 10}
    }
};

const u8 *const gUnknown_0820C2F0[] = {
    TradeText_LinkStandby,
    TradeText_TradeCancelled,
    TradeText_OnlyPoke,
    TradeText_NonTradablePoke,
    TradeText_WaitingForFriend,
    TradeText_WantToTrade
};

const u8 gTradeMessageWindowRects[][4] = {
    {8, 7, 22, 12},
    {8, 7, 22, 12},
    {6, 7, 24, 12},
    {6, 7, 24, 12},
    {8, 7, 22, 12},
    {7, 7, 23, 12}
};

const struct MenuAction gUnknown_0820C320[] = {
    {TradeText_Summary2, sub_804A9F4},
    {TradeText_Trade2, sub_804AA00}
};

const u8 gUnknown_0820C330[][2] = {
    { 0, 14},
    {15, 29}
};

const u8 gUnknown_0820C334[][2] = {
    { 3,  5},
    { 3,  7},
    {18,  5},
    {18,  7}
};

const u8 gOtherText_Terminator[] = _("");
const u8 gOtherText_MaleSymbol3[] = _("♂");
const u8 gOtherText_FemaleSymbol3[] = _("♀");
const u8 gOtherText_GenderlessSymbol[] = _("$");

u8 *const unref_data_820C344 = gTileBuffer;
const u8 unref_strings_820C348[][13] = {
    _("かいめの そうしん"),
    _("かいめの じゅしん"),
    _("ポケモンアイコンセット"),
    _("OBJテキストセット"),
    _("セルセット"),
    _("OBJテキストADD"),
    _("システムメッセージADD"),
    _("はいけいセット"),
};

const u8 gUnknown_0820C3B0[] = _("ヌケニン");
const u8 unref_string_0820C3B5[] = _("こうかんせいりつ     ");
const u8 unref_string_0820C3C3[] = _("だめだたらしいよ     ");
const u8 gUnknown_0820C3D1[][2] = {
    { 4,  3},
    {19,  3}
};

asm(".section .rodata.igt");

const struct InGameTrade gIngameTrades[] = {
    {
        _("MAKIT"), SPECIES_MAKUHITA,
        5, 5, 4, 4, 4, 4,
        TRUE, 49562,
        5, 5, 5, 5, 30,
        0x9C40,
        ITEM_X_ATTACK, -1,
        _("ELYSSA"), MALE, 10,
        SPECIES_SLAKOTH
    }, {
        _("SKITIT"), SPECIES_SKITTY,
        5, 4, 4, 5, 4, 4,
        FALSE, 2259,
        5, 5, 30, 5, 5,
        0x498A2E17,
        ITEM_GLITTER_MAIL, 0,
        _("DARRELL"), FEMALE, 10,
        SPECIES_PIKACHU
    }, {
        _("COROSO"),
        SPECIES_CORSOLA,
        4, 4, 5, 4, 4, 5,
        TRUE, 50183,
        5, 30, 5, 5, 5,
        0x4C970B7F,
        ITEM_TROPIC_MAIL, 1,
        _("LANE"), FEMALE, 10,
        SPECIES_BELLOSSOM
    }
};

const u16 gIngameTradeMail[][10] = {
    {
        EC_POKEMON(PIKACHU),
        EC_WORD_THANK_YOU,
        EC_WORD_EXCL,
        EC_WORD_MY,
        EC_POKEMON(SKITTY),
        EC_WORD_EATS,
        EC_WORD_A_LOT,
        EC_WORD_NOW,
        EC_WORD_EXCL,
        0
    }, {
        EC_WORD_I,
        EC_WORD_WANT,
        EC_WORD_TO,
        EC_WORD_SEE,
        EC_WORD_A,
        EC_MOVE2(PETAL_DANCE),
        EC_WORD_IT_S,
        EC_WORD_SO,
        EC_WORD_PRETTY,
        0
    }
};

const s8 gTradeBallVerticalVelocityTable[] = {
    0,  0,  1,  0,
    1,  0,  1,  1,
    1,  1,  2,  2,
    2,  2,  3,  3,
    3,  3,  4,  4,
    4,  4, -4, -4,
    -4, -3, -3, -3,
    -3, -2, -2, -2,
    -2, -1, -1, -1,
    -1,  0, -1,  0,
    -1,  0,  0,  0,
    0,  0,  1,  0,
    1,  0,  1,  1,
    1,  1,  2,  2,
    2,  2,  3,  3,
    3,  3,  4,  4,
    4,  4, -4, -3,
    -3, -2, -2, -1,
    -1, -1,  0, -1,
    0,  0,  0,  0,
    0,  0,  1,  0,
    1,  1,  1,  2,
    2,  3,  3,  4,
    -4, -3, -2, -1,
    -1, -1,  0,  0,
    0,  0,  1,  0,
    1,  1,  2,  3
};

// .text

void sub_8047CD8(void)
{
    SetMainCallback2(sub_8047EC0);
}

static void sub_8047CE8(void)
{
    u8 mpId;
    sub_804AFB8(&gWindowConfig_81E725C, gUnknown_020296CC[0], gSaveBlock2.playerName, 0xC);
    mpId = GetMultiplayerId();
    sub_804AFB8(&gWindowConfig_81E725C, gUnknown_020296CC[3], gLinkPlayers[mpId ^ 1].name, 0xC);
    sub_804AFB8(&gWindowConfig_81E725C, gUnknown_020296CC[6], gUnknown_0820C14C[0], 0x8);
    sub_804ACD8(gUnknown_0820C14C[1], gUnknown_020296CC[8], 0x14);
    nullsub_5(3, 0);
}

static void sub_8047D58(void)
{
    struct SpriteTemplate spriteTemplate;
    int i;
    u8 mpId;
    u16 slen;
    int language;

    slen = StringLength(gSaveBlock2.playerName);
    language = slen <= 5 ? 0 : 1;
    for (i = 0; i < 3; i ++)
    {
        spriteTemplate = gSpriteTemplate_820C0EC;
        spriteTemplate.tileTag += i;
        CreateSprite(&spriteTemplate, gTradeUnknownSpriteCoords[language][0][0] + 32 * i, gTradeUnknownSpriteCoords[language][0][1], 1);
    }

    mpId = GetMultiplayerId();
    slen = StringLength(gLinkPlayers[mpId ^ 1].name);
    language = slen <= 5 ? 0 : 1;
    for (i = 0; i < 3; i ++)
    {
        spriteTemplate = gSpriteTemplate_820C0EC;
        spriteTemplate.tileTag += i + 3;
        CreateSprite(&spriteTemplate, gTradeUnknownSpriteCoords[language][1][0] + 32 * i, gTradeUnknownSpriteCoords[language][1][1], 1);
    }
    nullsub_5(5, 0);
}

static void sub_8047E44(void)
{
    struct SpriteTemplate spriteTemplate;
    int i;

    for (i = 0; i < 2; i ++)
    {
        spriteTemplate = gSpriteTemplate_820C0EC;
        spriteTemplate.tileTag += i + 6;
        CreateSprite(&spriteTemplate, 0xd6 + 32 * i, 0x98, 1);
    }

    for (i = 0; i < 5; i ++)
    {
        spriteTemplate = gSpriteTemplate_820C0EC;
        spriteTemplate.tileTag += i + 8;
        CreateSprite(&spriteTemplate, 0x18 + 32 * i, 0x96, 1);
    }
}

static void sub_8047EC0(void)
{
    int i;

    switch (gMain.state)
    {
        case  0:
            gUnknown_03004824 = &ewram_2010000.unk_07000;
            sub_804AA88();
            ResetSpriteData();
            FreeAllSpritePalettes();
            ResetTasks();
            sub_804A964(&gUnknown_03004824->unk_00c8, (void *)BG_SCREEN_ADDR(5));
            SetVBlankCallback(sub_80489F4);
            InitMenuWindow(&gWindowConfig_81E6CE4);
            SetUpWindowConfig(&gWindowConfig_81E6F84);
            InitWindowFromConfig(&gUnknown_03004824->window, &gWindowConfig_81E6F84);
            gUnknown_03004824->unk_007a = SetTextWindowBaseTileNum(20);
            LoadTextWindowGraphics(&gUnknown_03004824->window);
            MenuZeroFillScreen();
            sub_809D51C();
            gUnknown_03004824->unk_0075 = 0;
            gUnknown_03004824->unk_007b = 0;
            gUnknown_03004824->unk_007c = 0;
            gUnknown_03004824->unk_0080 = 0;
            gUnknown_03004824->unk_0081 = 0;
            gUnknown_03004824->unk_0086 = 0;
            gUnknown_03004824->unk_0087 = 0;
            gUnknown_03004824->unk_00b4 = 0;
            gUnknown_03000508 = 0;
            gMain.state ++;
            sub_804AA0C(0);
            CpuFill16(0, ewram_2010000.tileBuffers, sizeof(ewram_2010000.tileBuffers));
            for (i = 0; i < 13; i ++)
                gUnknown_020296CC[i] = ewram_2010000.tileBuffers[i];
            break;
        case  1:
            gLinkType = 0x1122;
            OpenLink();
            for (i = 0; i < PARTY_SIZE; i ++)
                CreateMon(&gEnemyParty[i], 0, 0, 0x20, FALSE, 0, FALSE, 0);
            gMain.state ++;
            gUnknown_03004824->unk_00b4 = 0;
            CreateTask(sub_8083C50, 1);
            break;
        case  2:
            gUnknown_03004824->unk_00b4 ++;
            if (gUnknown_03004824->unk_00b4 > 11)
            {
                gUnknown_03004824->unk_00b4 = 0;
                gMain.state ++;
            }
            break;
        case  3:
            if (GetLinkPlayerCount_2() >= sub_800820C())
            {
                if (IsLinkMaster())
                {
                    if (++gUnknown_03004824->unk_00b4 > 30)
                    {
                        sub_8007F4C();
                        gMain.state ++;
                    }
                }
                else
                    gMain.state ++;
            }
            break;
        case  4:
            if (gReceivedRemoteLinkPlayers == 1 && IsLinkPlayerDataExchangeComplete() == TRUE)
            {
                CalculatePlayerPartyCount();
                gMain.state ++;
            }
            break;
        case  5:
            if (sub_8048D44())
            {
                sub_804AF84();
                gMain.state ++;
            }
            break;
        case  6:
            CalculateEnemyPartyCount();
            FillWindowRect_DefaultPalette(&gUnknown_03004824->window, 0, 0, 0, 29, 19);
            REG_DISPCNT = 0;
            gUnknown_03004824->playerPartyCount = gPlayerPartyCount;
            gUnknown_03004824->friendPartyCount = gEnemyPartyCount;
            for (i = 0; i < gUnknown_03004824->playerPartyCount; i ++)
                gUnknown_03004824->playerPartyIcons[i] = CreateMonIcon(GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2), sub_809D62C, gTradeMonSpriteCoords[i][0] * 8 + 14, gTradeMonSpriteCoords[i][1] * 8 - 12, TRUE, GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY));
            for (i = 0; i < gUnknown_03004824->friendPartyCount; i ++)
                gUnknown_03004824->friendPartyIcons[i] = CreateMonIcon(GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2, NULL), sub_809D62C, gTradeMonSpriteCoords[6 + i][0] * 8 + 14, gTradeMonSpriteCoords[6 + i][1] * 8 - 12, TRUE, GetMonData(&gEnemyParty[i], MON_DATA_PERSONALITY));
            nullsub_5(2, 0);
            gMain.state ++;
            break;
        case  7:
            LoadHeldItemIconGraphics();
            CreateHeldItemIcons(&gUnknown_03004824->playerPartyCount, gUnknown_03004824->playerPartyIcons, 0);
            gMain.state ++;
            break;
        case  8:
            CreateHeldItemIcons(&gUnknown_03004824->playerPartyCount, gUnknown_03004824->playerPartyIcons, 1);
            gMain.state ++;
            break;
        case  9:
            sub_8047CE8();
            gMain.state ++;
            gUnknown_03004824->unk_00b4 = 0;
            break;
        case 10:
            nullsub_5(4, 0);
            if (sub_804ABF8())
                gMain.state ++;
            break;
        case 11:
            sub_8047D58();
            gMain.state ++;
            break;
        case 12:
            sub_8047E44();
            gUnknown_03004824->unk_0040 = CreateSprite(&gSpriteTemplate_820C134, gTradeMonSpriteCoords[0][0] * 8 + 32, gTradeMonSpriteCoords[0][1] * 8, 2);
            gUnknown_03004824->tradeMenuCursorPosition = 0;
            gMain.state ++;
            nullsub_5(6, 0);
            break;
        case 13:
            sub_804ACF4(0);
            sub_804A41C(0);
            gUnknown_03004824->unk_0000 = 0;
            gUnknown_03004824->unk_0001 = 0;
            sub_8048C70();
            gMain.state ++;
            nullsub_5(7, 0);
            PlayBGM(BGM_P_SCHOOL);
            break;
        case 14:
            sub_804ACF4(1);
            sub_804A41C(1);
            gMain.state ++;
            // fallthrough
        case 15:
            sub_8048B0C(0);
            gMain.state ++;
            break;
        case 16:
            sub_8048B0C(1);
            gMain.state ++;
            break;
        case 17:
            BeginNormalPaletteFade(-1, 0, 16, 0, 0);
            gMain.state ++;
            break;
        case 18:
            REG_DISPCNT = DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON;
            gMain.state ++;
            break;
        case 19:
            sub_804AE3C(0);
            gMain.state ++;
            break;
        case 20:
            sub_804AE3C(1);
            sub_804AF10();
            gMain.state ++;
            break;
        case 21:
            if (!gPaletteFade.active)
            {
                gMain.callback1 = sub_80494D8;
                SetMainCallback2(sub_8048AB4);
                gUnknown_03000508 = 0;
            }
            break;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

/*static*/ void sub_80484F4(void)
{
    int i;
    struct UnkStructF *unkStructF;

    switch (gMain.state)
    {
        case  0:
            gUnknown_03004824 = &ewram_2010000.unk_07000;
            ResetSpriteData();
            FreeAllSpritePalettes();
            ResetTasks();
            sub_804A964(&gUnknown_03004824->unk_00c8, (void *)BG_SCREEN_ADDR(5));
            SetVBlankCallback(sub_80489F4);
            InitMenuWindow(&gWindowConfig_81E6CE4);
            SetUpWindowConfig(&gWindowConfig_81E6F84);
            InitWindowFromConfig(&gUnknown_03004824->window, &gWindowConfig_81E6F84);
            gUnknown_03004824->unk_007a = SetTextWindowBaseTileNum(20);
            LoadTextWindowGraphics(&gUnknown_03004824->window);
            MenuZeroFillScreen();
            sub_809D51C();
            gUnknown_03004824->unk_0075 = 0;
            gUnknown_03004824->unk_007b = 0;
            gUnknown_03004824->unk_007c = 0;
            gUnknown_03004824->unk_0080 = 0;
            gUnknown_03004824->unk_0081 = 0;
            gUnknown_03004824->unk_0086 = 0;
            gUnknown_03004824->unk_0087 = 0;
            gUnknown_03004824->unk_00b4 = 0;
            gUnknown_03000508 = 0;
            gMain.state ++;
            for (i = 0; i < 13; i ++)
                gUnknown_020296CC[i] = ewram_2010000.tileBuffers[i];
            break;
        case  1:
            gMain.state ++;
            gUnknown_03004824->unk_00b4 = 0;
            break;
        case  2:
            gMain.state ++;
            break;
        case  3:
            gMain.state ++;
            break;
        case  4:
            CalculatePlayerPartyCount();
            gMain.state ++;
            break;
        case  5:
            gMain.state ++;
            break;
        case  6:
            CalculateEnemyPartyCount();
            REG_DISPCNT = 0;
            gUnknown_03004824->playerPartyCount = gPlayerPartyCount;
            gUnknown_03004824->friendPartyCount = gEnemyPartyCount;
            sub_804A41C(0);
            sub_804A41C(1);
            for (i = 0; i < gUnknown_03004824->playerPartyCount; i ++)
                gUnknown_03004824->playerPartyIcons[i] = CreateMonIcon(GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL), sub_809D62C, gTradeMonSpriteCoords[i][0] * 8 + 14, gTradeMonSpriteCoords[i][1] * 8 - 12, TRUE, GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY));
            for (i = 0; i < gUnknown_03004824->friendPartyCount; i ++)
                gUnknown_03004824->friendPartyIcons[i] = CreateMonIcon(GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2, NULL), sub_809D62C, gTradeMonSpriteCoords[6 + i][0] * 8 + 14, gTradeMonSpriteCoords[6 + i][1] * 8 - 12, TRUE, GetMonData(&gEnemyParty[i], MON_DATA_PERSONALITY));
            nullsub_5(2, 0);
            gMain.state ++;
            break;
        case  7:
            LoadHeldItemIconGraphics();
            CreateHeldItemIcons(&gUnknown_03004824->playerPartyCount, gUnknown_03004824->playerPartyIcons, 0);
            gMain.state ++;
            break;
        case  8:
            CreateHeldItemIcons(&gUnknown_03004824->playerPartyCount, gUnknown_03004824->playerPartyIcons, 1);
            gMain.state ++;
            break;
        case  9:
            sub_8047CE8();
            gMain.state ++;
            gUnknown_03004824->unk_00b4 = 0;
            break;
        case 10:
            nullsub_5(4, 0);
            if (sub_804ABF8())
            {
                gMain.state ++;
            }
            break;
        case 11:
            sub_8047D58();
            gMain.state ++;
            break;
        case 12:
            sub_8047E44();
            unkStructF = &ewram_2010000.unk_08000;
            if (gUnknown_03004824->tradeMenuCursorPosition < 6)
                gUnknown_03004824->tradeMenuCursorPosition = unkStructF->unk_0009;
            else
                gUnknown_03004824->tradeMenuCursorPosition = unkStructF->unk_0009 + 6;
            gUnknown_03004824->unk_0040 = CreateSprite(&gSpriteTemplate_820C134, gTradeMonSpriteCoords[gUnknown_03004824->tradeMenuCursorPosition][0] * 8 + 32, gTradeMonSpriteCoords[gUnknown_03004824->tradeMenuCursorPosition][1] * 8, 2);
            gMain.state = 15;
            nullsub_5(6, 0);
            break;
        case 15:
            sub_8048B0C(0);
            gMain.state ++;
            break;
        case 16:
            sub_8048B0C(1);
            gUnknown_03004824->unk_0000 = 0;
            gUnknown_03004824->unk_0001 = 0;
            sub_8048C70();
            nullsub_5(7, 0);
            gMain.state ++;
            break;
        case 17:
            BeginNormalPaletteFade(-1, 0, 16, 0, 0);
            gMain.state ++;
            break;
        case 18:
            REG_DISPCNT = DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON;
            gMain.state ++;
            break;
        case 19:
            gMain.state ++;
            break;
        case 20:
            sub_804AF10();
            gMain.state ++;
            break;
        case 21:
            if (!gPaletteFade.active)
            {
                SetMainCallback2(sub_8048AB4);
                gUnknown_03000508 = 0;
            }
            break;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_80489F4(void)
{
    sub_804A940(&gUnknown_03004824->unk_00c8);
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

/*static*/ void sub_8048A14(void)
{
    if (++gUnknown_03004824->unk_00b4 >= 16)
    {
        BeginNormalPaletteFade(-1, 0, 0, 16, 0);
        gUnknown_03004824->unk_007b = 10;
    }
}

/*static*/ void sub_8048A50(void)
{
    if (!gPaletteFade.active)
    {
        gUnknown_020297D8[0] = gUnknown_03004824->tradeMenuCursorPosition;
        gUnknown_020297D8[1] = gUnknown_03004824->unk_008a;
        sub_800832C();
        gUnknown_03004824->unk_007b = 13;
    }
}

/*static*/ void sub_8048A90(void)
{
    if (!gReceivedRemoteLinkPlayers)
    {
        gMain.callback1 = NULL;
        SetMainCallback2(sub_804B41C);
    }
}

static void sub_8048AB4(void)
{
    sub_8049DE0();
    sub_804AB30();
    sub_8049ED4(0);
    sub_8049ED4(1);
    REG_BG2HOFS = gUnknown_03004824->unk_0000++;
    REG_BG3HOFS = gUnknown_03004824->unk_0001--;
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

#ifdef NONMATCHING
// Only minor register permutations
#pragma push_macro("BLOCKSIZE")
#define BLOCKSIZE 0x800
static void sub_8048B0C(u8 a0)
{
    int i;
    u16 *dest;
    const u16 *src;
    u32 size;
    switch (a0)
    {
        case 0:
            for (i = 0; i < 48; i ++)
            {
                gPlttBufferUnfaded[i] = *(gUnknown_08EA02C8 + i);
                gPlttBufferFaded[i] = *(gUnknown_08EA02C8 + i);
            }
            src = gUnknown_08EA0348;
            dest = (u16 *)BG_VRAM;
            size = 0x1280;
            while (1)
            {
                DmaCopy16(3, src, dest, BLOCKSIZE * sizeof(u16));
                src += BLOCKSIZE;
                dest += BLOCKSIZE;
                size -= BLOCKSIZE * sizeof(u16);
                if (size <= BLOCKSIZE * sizeof(u16))
                {
                    DmaCopy16(3, src, dest, size);
                    break;
                }
            }
            for (i = 0; i < 0x400; i ++)
                gUnknown_03004824->unk_00c8.unk_12[i] = gUnknown_08EA15C8[i];
            dest = (u16 *)BG_SCREEN_ADDR(6);
            DmaCopy16(3, gTradeStripesBG2Tilemap, dest, 0x800);
            break;
        case 1:
            src = gTradeStripesBG3Tilemap;
            dest = (u16 *)BG_SCREEN_ADDR(7);
            DmaCopy16(3, src, dest, 0x800);
            sub_804A6DC(0);
            sub_804A6DC(1);
            sub_804A938(&gUnknown_03004824->unk_00c8);
            REG_BG0CNT &= ~0x03; // BGCNT_PRIORITY(0)
            REG_BG1CNT = BGCNT_PRIORITY(1) | BGCNT_SCREENBASE(5);
            REG_BG2CNT = BGCNT_PRIORITY(2) | BGCNT_SCREENBASE(6);
            REG_BG3CNT = BGCNT_PRIORITY(3) | BGCNT_SCREENBASE(7);
            REG_BG0HOFS = 0;
            REG_BG1HOFS = 0;
            REG_BG2HOFS = 0;
            REG_BG3HOFS = 0;
            REG_BG0VOFS = 0;
            REG_BG1VOFS = 0;
            REG_BG2VOFS = 0;
            REG_BG3VOFS = 0;
            break;
    }
}
#pragma pop_macro("BLOCKSIZE")
#else
asm(".include \"constants/gba_constants.inc\"");
__attribute__((naked))
static void sub_8048B0C(u8 a0)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                        "\tlsls r0, 24\n"
                        "\tlsrs r0, 24\n"
                        "\tcmp r0, 0\n"
                        "\tbeq _08048B1C\n"
                        "\tcmp r0, 0x1\n"
                        "\tbeq _08048BD0\n"
                        "\tb _08048C3A\n"
                        "_08048B1C:\n"
                        "\tldr r5, _08048BA0 @ =gUnknown_08EA0348\n"
                        "\tldr r0, _08048BA4 @ =gTradeStripesBG2Tilemap\n"
                        "\tmov r12, r0\n"
                        "\tldr r1, _08048BA8 @ =gUnknown_08EA02C8\n"
                        "\tldr r4, _08048BAC @ =gPlttBufferFaded\n"
                        "\tldr r3, _08048BB0 @ =gPlttBufferUnfaded\n"
                        "\tmovs r2, 0x2F\n"
                        "_08048B2A:\n"
                        "\tldrh r0, [r1]\n"
                        "\tstrh r0, [r3]\n"
                        "\tldrh r0, [r1]\n"
                        "\tstrh r0, [r4]\n"
                        "\tadds r1, 0x2\n"
                        "\tadds r4, 0x2\n"
                        "\tadds r3, 0x2\n"
                        "\tsubs r2, 0x1\n"
                        "\tcmp r2, 0\n"
                        "\tbge _08048B2A\n"
                        "\tadds r3, r5, 0\n"
                        "\tmovs r4, 0xC0\n"
                        "\tlsls r4, 19\n"
                        "\tmovs r5, 0x94\n"
                        "\tlsls r5, 5\n"
                        "\tldr r1, _08048BB4 @ =0x040000d4\n"
                        "\tldr r6, _08048BB8 @ =0x80000800\n"
                        "\tmovs r2, 0x80\n"
                        "\tlsls r2, 5\n"
                        "\tmovs r7, 0x80\n"
                        "\tlsls r7, 24\n"
                        "_08048B54:\n"
                        "\tstr r3, [r1]\n"
                        "\tstr r4, [r1, 0x4]\n"
                        "\tstr r6, [r1, 0x8]\n"
                        "\tldr r0, [r1, 0x8]\n"
                        "\tadds r3, r2\n"
                        "\tadds r4, r2\n"
                        "\tsubs r5, r2\n"
                        "\tcmp r5, r2\n"
                        "\tbhi _08048B54\n"
                        "\tstr r3, [r1]\n"
                        "\tstr r4, [r1, 0x4]\n"
                        "\tlsrs r0, r5, 1\n"
                        "\torrs r0, r7\n"
                        "\tstr r0, [r1, 0x8]\n"
                        "\tldr r0, [r1, 0x8]\n"
                        "\tmovs r2, 0\n"
                        "\tldr r5, _08048BBC @ =0x000003ff\n"
                        "\tldr r4, _08048BC0 @ =gUnknown_03004824\n"
                        "\tldr r3, _08048BC4 @ =gUnknown_08EA15C8\n"
                        "_08048B7A:\n"
                        "\tldr r0, [r4]\n"
                        "\tlsls r1, r2, 1\n"
                        "\tadds r0, 0xDA\n"
                        "\tadds r0, r1\n"
                        "\tldrh r1, [r3]\n"
                        "\tstrh r1, [r0]\n"
                        "\tadds r3, 0x2\n"
                        "\tadds r2, 0x1\n"
                        "\tcmp r2, r5\n"
                        "\tble _08048B7A\n"
                        "\tldr r1, _08048BC8 @ =0x06003000\n"
                        "\tldr r0, _08048BB4 @ =0x040000d4\n"
                        "\tmov r2, r12\n"
                        "\tstr r2, [r0]\n"
                        "\tstr r1, [r0, 0x4]\n"
                        "\tldr r1, _08048BCC @ =0x80000400\n"
                        "\tstr r1, [r0, 0x8]\n"
                        "\tldr r0, [r0, 0x8]\n"
                        "\tb _08048C3A\n"
                        "\t.align 2, 0\n"
                        "_08048BA0: .4byte gUnknown_08EA0348\n"
                        "_08048BA4: .4byte gTradeStripesBG2Tilemap\n"
                        "_08048BA8: .4byte gUnknown_08EA02C8\n"
                        "_08048BAC: .4byte gPlttBufferFaded\n"
                        "_08048BB0: .4byte gPlttBufferUnfaded\n"
                        "_08048BB4: .4byte 0x040000d4\n"
                        "_08048BB8: .4byte 0x80000800\n"
                        "_08048BBC: .4byte 0x000003ff\n"
                        "_08048BC0: .4byte gUnknown_03004824\n"
                        "_08048BC4: .4byte gUnknown_08EA15C8\n"
                        "_08048BC8: .4byte 0x06003000\n"
                        "_08048BCC: .4byte 0x80000400\n"
                        "_08048BD0:\n"
                        "\tldr r1, _08048C40 @ =gTradeStripesBG3Tilemap\n"
                        "\tldr r2, _08048C44 @ =0x06003800\n"
                        "\tldr r0, _08048C48 @ =0x040000d4\n"
                        "\tstr r1, [r0]\n"
                        "\tstr r2, [r0, 0x4]\n"
                        "\tldr r1, _08048C4C @ =0x80000400\n"
                        "\tstr r1, [r0, 0x8]\n"
                        "\tldr r0, [r0, 0x8]\n"
                        "\tmovs r0, 0\n"
                        "\tbl sub_804A6DC\n"
                        "\tmovs r0, 0x1\n"
                        "\tbl sub_804A6DC\n"
                        "\tldr r0, _08048C50 @ =gUnknown_03004824\n"
                        "\tldr r0, [r0]\n"
                        "\tadds r0, 0xC8\n"
                        "\tbl sub_804A938\n"
                        "\tldr r2, _08048C54 @ =REG_BG0CNT\n"
                        "\tldrh r1, [r2]\n"
                        "\tldr r0, _08048C58 @ =0x0000fffc\n"
                        "\tands r0, r1\n"
                        "\tstrh r0, [r2]\n"
                        "\tldr r1, _08048C5C @ =REG_BG1CNT\n"
                        "\tldr r2, _08048C60 @ =0x00000501\n"
                        "\tadds r0, r2, 0\n"
                        "\tstrh r0, [r1]\n"
                        "\tadds r1, 0x2\n"
                        "\tldr r2, _08048C64 @ =0x00000602\n"
                        "\tadds r0, r2, 0\n"
                        "\tstrh r0, [r1]\n"
                        "\tadds r1, 0x2\n"
                        "\tldr r2, _08048C68 @ =0x00000703\n"
                        "\tadds r0, r2, 0\n"
                        "\tstrh r0, [r1]\n"
                        "\tldr r0, _08048C6C @ =REG_BG0HOFS\n"
                        "\tmovs r1, 0\n"
                        "\tstrh r1, [r0]\n"
                        "\tadds r0, 0x4\n"
                        "\tstrh r1, [r0]\n"
                        "\tadds r0, 0x4\n"
                        "\tstrh r1, [r0]\n"
                        "\tadds r0, 0x4\n"
                        "\tstrh r1, [r0]\n"
                        "\tsubs r0, 0xA\n"
                        "\tstrh r1, [r0]\n"
                        "\tadds r0, 0x4\n"
                        "\tstrh r1, [r0]\n"
                        "\tadds r0, 0x4\n"
                        "\tstrh r1, [r0]\n"
                        "\tadds r0, 0x4\n"
                        "\tstrh r1, [r0]\n"
                        "_08048C3A:\n"
                        "\tpop {r4-r7}\n"
                        "\tpop {r0}\n"
                        "\tbx r0\n"
                        "\t.align 2, 0\n"
                        "_08048C40: .4byte gTradeStripesBG3Tilemap\n"
                        "_08048C44: .4byte 0x06003800\n"
                        "_08048C48: .4byte 0x040000d4\n"
                        "_08048C4C: .4byte 0x80000400\n"
                        "_08048C50: .4byte gUnknown_03004824\n"
                        "_08048C54: .4byte REG_BG0CNT\n"
                        "_08048C58: .4byte 0x0000fffc\n"
                        "_08048C5C: .4byte REG_BG1CNT\n"
                        "_08048C60: .4byte 0x00000501\n"
                        "_08048C64: .4byte 0x00000602\n"
                        "_08048C68: .4byte 0x00000703\n"
                        "_08048C6C: .4byte REG_BG0HOFS");
}
#endif

static void sub_8048C70(void)
{
    int i;
    for (i = 0; i < PARTY_SIZE; i ++)
    {
        if (i < gUnknown_03004824->playerPartyCount)
        {
            gSprites[gUnknown_03004824->playerPartyIcons[i]].invisible = FALSE;
            gUnknown_03004824->tradeMenuOptionsActive[i] = TRUE;
        }
        else
        {
            gUnknown_03004824->tradeMenuOptionsActive[i] = FALSE;
        }
        if (i < gUnknown_03004824->friendPartyCount)
        {
            gSprites[gUnknown_03004824->friendPartyIcons[i]].invisible = FALSE;
            gUnknown_03004824->tradeMenuOptionsActive[i + 6] = TRUE;
        }
        else
        {
            gUnknown_03004824->tradeMenuOptionsActive[i + 6] = FALSE;
        }
    }
    gUnknown_03004824->tradeMenuOptionsActive[12] = TRUE;
}

static void nullsub_5(u8 a0, u8 a1) {}

static void sub_8048D24(u8 *dest, const u8 *src, u32 size)
{
    int i;
    for (i = 0; i < size; i ++) dest[i] = src[i];
}

static bool8 sub_8048D44(void)
{
    u8 mpId = GetMultiplayerId();
    int i;
    u16 species;
    u8 nickname[11];
    struct Pokemon *pokemon;

    SetLinkDebugValues(gUnknown_03004824->unk_0075 / 100, gUnknown_03004824->unk_0075 % 100);
    switch (gUnknown_03004824->unk_0075)
    {
        case  0:
            sub_8048D24(gBlockSendBuffer, (const u8 *)&gPlayerParty[0], 2 * sizeof(struct Pokemon));
            gUnknown_03004824->unk_0075 ++;
            break;
        case  1:
            if (sub_8007ECC())
            {
                if (GetBlockReceivedStatus() == 0)
                {
                    gUnknown_03004824->unk_0075 ++;
                }
                else
                {
                    ResetBlockReceivedFlags();
                    gUnknown_03004824->unk_0075 ++;
                }
            }
            break;
        case  2:
            if (mpId == 0)
            {
                sub_8007E9C(1);
            }
            gUnknown_03004824->unk_0075 ++;
            break;
        case  3:
            if (GetBlockReceivedStatus() == 3)
            {
                sub_8048D24((u8 *)&gEnemyParty[0], (const u8 *)gBlockRecvBuffer[mpId ^ 1], 2 * sizeof(struct Pokemon));
                ResetBlockReceivedFlags();
                gUnknown_03004824->unk_0075 ++;
            }
            break;
        case  4:
            sub_8048D24(gBlockSendBuffer, (const u8 *)&gPlayerParty[2], 2 * sizeof(struct Pokemon));
            gUnknown_03004824->unk_0075 ++;
            break;
        case  5:
            if (mpId == 0)
            {
                sub_8007E9C(1);
            }
            gUnknown_03004824->unk_0075 ++;
            break;
        case  6:
            if (GetBlockReceivedStatus() == 3)
            {
                sub_8048D24((u8 *)&gEnemyParty[2], (const u8 *)gBlockRecvBuffer[mpId ^ 1], 2 * sizeof(struct Pokemon));
                ResetBlockReceivedFlags();
                gUnknown_03004824->unk_0075 ++;
            }
            break;
        case  7:
            sub_8048D24(gBlockSendBuffer, (const u8 *)&gPlayerParty[4], 2 * sizeof(struct Pokemon));
            gUnknown_03004824->unk_0075 ++;
            break;
        case  8:
            if (mpId == 0)
            {
                sub_8007E9C(1);
            }
            gUnknown_03004824->unk_0075 ++;
            break;
        case  9:
            if (GetBlockReceivedStatus() == 3)
            {
                sub_8048D24((u8 *)&gEnemyParty[4], (const u8 *)gBlockRecvBuffer[mpId ^ 1], 2 * sizeof(struct Pokemon));
                ResetBlockReceivedFlags();
                gUnknown_03004824->unk_0075 ++;
            }
            break;
        case 10:
            sub_8048D24(gBlockSendBuffer, (const u8 *)&gSaveBlock1.mail[0], 6 * sizeof(struct MailStruct) + 4);
            gUnknown_03004824->unk_0075 ++;
            break;
        case 11:
            if (mpId == 0)
            {
                sub_8007E9C(3);
            }
            gUnknown_03004824->unk_0075 ++;
            break;
        case 12:
            if (GetBlockReceivedStatus() == 3)
            {
                sub_8048D24((u8 *)&gUnknown_02029700[0], (const u8 *)gBlockRecvBuffer[mpId ^ 1], 6 * sizeof(struct MailStruct));
                ResetBlockReceivedFlags();
                gUnknown_03004824->unk_0075 ++;
            }
            break;
        case 13:
            sub_8048D24(gBlockSendBuffer, (const u8 *)gSaveBlock1.giftRibbons, 11);
            gUnknown_03004824->unk_0075 ++;
            break;
        case 14:
            if (mpId == 0)
            {
                sub_8007E9C(4);
            }
            gUnknown_03004824->unk_0075 ++;
            break;
        case 15:
            if (GetBlockReceivedStatus() == 3)
            {
                sub_8048D24((u8 *)gUnknown_03004824->unk_00b5, (const u8 *)gBlockRecvBuffer[mpId ^ 1], 11);
                ResetBlockReceivedFlags();
                gUnknown_03004824->unk_0075 ++;
            }
            break;
        case 16:
            pokemon = gEnemyParty;
            for (i = 0; i < PARTY_SIZE; i ++)
            {
                if ((species = GetMonData(pokemon, MON_DATA_SPECIES)) != SPECIES_NONE && species == SPECIES_SHEDINJA && GetMonData(pokemon, MON_DATA_LANGUAGE) != LANGUAGE_JAPANESE)
                {
                    GetMonData(pokemon, MON_DATA_NICKNAME, nickname);
                    if (!StringCompareWithoutExtCtrlCodes(nickname, gUnknown_0820C3B0))
                        SetMonData(pokemon, MON_DATA_NICKNAME, gSpeciesNames[SPECIES_SHEDINJA]);
                }
                pokemon ++;
            }
            return TRUE;
    }
    return FALSE;
}

/*static*/ void sub_8049088(void)
{
    u8 string[28];
    StringCopy(string, gTradeText_TradeOkayPrompt);
    sub_804ACD8(string, (u8 *)BG_CHAR_ADDR(4) + gUnknown_03004824->unk_007e * 32, 20);
}

static void sub_80490BC(u8 mpId, u8 a1)
{
    if (a1 & 1)
    {
        switch (gBlockRecvBuffer[mpId][0])
        {
            case 0xeeaa:
                gUnknown_03004824->unk_0084 = 2;
                break;
            case 0xaabb:
                gUnknown_03004824->unk_0084 = 1;
                break;
            case 0xbbbb:
                gUnknown_03004824->unk_0086 = 1;
                break;
            case 0xbbcc:
                gUnknown_03004824->unk_0086 = 2;
                break;
        }
        ResetBlockReceivedFlag(0);
    }
    if (a1 & 2)
    {
        switch (gBlockRecvBuffer[1][0])
        {
            case 0xeeaa:
                gUnknown_03004824->unk_0085 = 2;
                break;
            case 0xaabb:
                gUnknown_03004824->unk_008a = gBlockRecvBuffer[1][1] + 6;
                gUnknown_03004824->unk_0085 = 1;
                break;
            case 0xbbbb:
                gUnknown_03004824->unk_0087 = 1;
                break;
            case 0xbbcc:
                gUnknown_03004824->unk_0087 = 2;
                break;
        }
        ResetBlockReceivedFlag(1);
    }
}

static void sub_80491E4(u8 mpId, u8 status)
{
    if (status & 1)
    {
        switch (gBlockRecvBuffer[0][0])
        {
            case 0xeebb:
                BeginNormalPaletteFade(-1, 0, 0, 16, 0);
                sub_804AA0C(4);
                gUnknown_03004824->unk_007b = 11;
                break;
            case 0xeecc:
                sub_804AA0C(5);
                gUnknown_03004824->unk_007b = 8;
                break;
            case 0xdddd:
                gUnknown_03004824->unk_008a = ((u8 *)gBlockRecvBuffer[0])[1 * sizeof(u16)] + 6;
                sub_8049E9C(gUnknown_03004824->tradeMenuCursorPosition);
                sub_8049E9C(gUnknown_03004824->unk_008a);
                gUnknown_03004824->unk_007b = 7;
                break;
            case 0xccdd:
                BeginNormalPaletteFade(-1, 0, 0, 16, 0);
                gUnknown_03004824->unk_007b = 10;
                break;
            case 0xddee:
                sub_804AA0C(1);
                gUnknown_03004824->unk_007b = 8;
                break;
        }
        ResetBlockReceivedFlag(0);
    }
    if (status & 2)
    {
        ResetBlockReceivedFlag(1);
    }
}

static void sub_80492D8(void)
{
    if (gUnknown_03004824->unk_0084 && gUnknown_03004824->unk_0085)
    {
        if (gUnknown_03004824->unk_0084 == 1 && gUnknown_03004824->unk_0085 == 1)
        {
            gUnknown_03004824->unk_007b = 6;
            gUnknown_03004824->linkData[0] = 0xdddd;
            gUnknown_03004824->linkData[1] = gUnknown_03004824->tradeMenuCursorPosition;
            sub_804AADC(5, 0);
            gUnknown_03004824->unk_0084 = gUnknown_03004824->unk_0085 = 0;
        }
        else if (gUnknown_03004824->unk_0084 == 1 && gUnknown_03004824->unk_0085 == 2)
        {
            sub_804AA0C(1);
            gUnknown_03004824->linkData[0] = 0xeecc;
            gUnknown_03004824->linkData[1] = 0;
            sub_804AADC(5, 0);
            gUnknown_03004824->unk_0086 = gUnknown_03004824->unk_0087 = 0;
            gUnknown_03004824->unk_0084 = gUnknown_03004824->unk_0085 = 0;
            gUnknown_03004824->unk_007b = 8;
        }
        else if (gUnknown_03004824->unk_0084 == 2 && gUnknown_03004824->unk_0085 == 1)
        {
            sub_804AA0C(5);
            gUnknown_03004824->linkData[0] = 0xddee;
            gUnknown_03004824->linkData[1] = 0;
            sub_804AADC(5, 0);
            gUnknown_03004824->unk_0086 = gUnknown_03004824->unk_0087 = 0;
            gUnknown_03004824->unk_0084 = gUnknown_03004824->unk_0085 = 0;
            gUnknown_03004824->unk_007b = 8;
        }
        else if (gUnknown_03004824->unk_0084 == 2 && gUnknown_03004824->unk_0085 == 2)
        {
            gUnknown_03004824->linkData[0] = 0xeebb;
            gUnknown_03004824->linkData[1] = 0;
            sub_804AADC(5, 0);
            BeginNormalPaletteFade(-1, 0, 0, 16, 0);
            gUnknown_03004824->unk_0084 = gUnknown_03004824->unk_0085 = 0;
            gUnknown_03004824->unk_007b = 11;
        }
    }
    if (gUnknown_03004824->unk_0086 && gUnknown_03004824->unk_0087)
    {
        if (gUnknown_03004824->unk_0086 == 1 && gUnknown_03004824->unk_0087 == 1)
        {
            gUnknown_03004824->linkData[0] = 0xccdd;
            gUnknown_03004824->linkData[1] = 0;
            sub_804AADC(5, 0);
            gUnknown_03004824->unk_0086 = 0;
            gUnknown_03004824->unk_0087 = 0;
            gUnknown_03004824->unk_007b = 9;
        }
        if (gUnknown_03004824->unk_0086 == 2 || gUnknown_03004824->unk_0087 == 2)
        {
            sub_804AA0C(1);
            gUnknown_03004824->linkData[0] = 0xddee;
            gUnknown_03004824->linkData[1] = 0;
            sub_804AADC(5, 0);
            gUnknown_03004824->unk_0086 = 0;
            gUnknown_03004824->unk_0087 = 0;
            gUnknown_03004824->unk_007b = 8;
        }
    }
}

static void sub_80494D8(void)
{
    u8 mpId = GetMultiplayerId();
    u8 status;
    if ((status = GetBlockReceivedStatus()))
    {
        if (mpId == 0)
            sub_80490BC(mpId, status);
        else
            sub_80491E4(mpId, status);
        ResetBlockReceivedFlags();
    }
    if (mpId == 0)
        sub_80492D8();
}

static u8 sub_8049514(u8 oldPosition, u8 direction)
{
    int i;
    u8 newPosition = 0;
    for (i = 0; i < PARTY_SIZE; i ++)
    {
        if (gUnknown_03004824->tradeMenuOptionsActive[gTradeNextSelectedMonTable[oldPosition][direction][i]] == TRUE)
        {
            newPosition = gTradeNextSelectedMonTable[oldPosition][direction][i];
            break;
        }
    }
    return newPosition;
}

static void TradeMenuMoveCursor(u8 *tradeMenuCursorPosition, u8 direction)
{
    u8 newPosition = sub_8049514(*tradeMenuCursorPosition, direction);
    if (newPosition == 12) // CANCEL
    {
        StartSpriteAnim(&gSprites[gUnknown_03004824->unk_0040], 1);
        gSprites[gUnknown_03004824->unk_0040].pos1.x = 0xe0;
        gSprites[gUnknown_03004824->unk_0040].pos1.y = 0xa0;
    }
    else
    {
        StartSpriteAnim(&gSprites[gUnknown_03004824->unk_0040], 0);
        gSprites[gUnknown_03004824->unk_0040].pos1.x = gTradeMonSpriteCoords[newPosition][0] * 8 + 32;
        gSprites[gUnknown_03004824->unk_0040].pos1.y = gTradeMonSpriteCoords[newPosition][1] * 8;
    }
    if (*tradeMenuCursorPosition != newPosition)
    {
        PlaySE(SE_SELECT);
    }
    *tradeMenuCursorPosition = newPosition;
}

/*static*/ void sub_8049620(void)
{
    sub_804AA0C(0);
    gUnknown_03004824->unk_007b = 5;
    if (GetMultiplayerId() == 1)
    {
        gUnknown_03004824->linkData[0] = 0xaabb;
        gUnknown_03004824->linkData[1] = gUnknown_03004824->tradeMenuCursorPosition;
        SendBlock(bitmask_all_link_players_but_self(), gUnknown_03004824->linkData, 20);
    }
    else
    {
        gUnknown_03004824->unk_0084 = 1;
    }
}

/*static*/ void sub_8049680(void)
{
    int i;
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        TradeMenuMoveCursor(&gUnknown_03004824->tradeMenuCursorPosition, 0);
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        TradeMenuMoveCursor(&gUnknown_03004824->tradeMenuCursorPosition, 1);
    }
    else if (gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        TradeMenuMoveCursor(&gUnknown_03004824->tradeMenuCursorPosition, 2);
    }
    else if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
    {
        TradeMenuMoveCursor(&gUnknown_03004824->tradeMenuCursorPosition, 3);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        if (gUnknown_03004824->tradeMenuCursorPosition < PARTY_SIZE)
        {
            DrawTextWindow(&gUnknown_03004824->window, 18, 14, 28, 19);
            PrintMenuItems(19, 15, 2, gUnknown_0820C320);
            InitMenu(0, 19, 15, 2, 0, 9);
            gUnknown_03004824->unk_007b = 1;
        }
        else if (gUnknown_03004824->tradeMenuCursorPosition < 2 * PARTY_SIZE)
        {
            BeginNormalPaletteFade(-1, 0, 0, 16, 0);
            gUnknown_03004824->unk_007b = 2;
        }
        else if (gUnknown_03004824->tradeMenuCursorPosition == 2 * PARTY_SIZE)
        {
            DrawTextWindow(&gUnknown_03004824->window, 24, 14, 29, 19);
            InitYesNoMenu(24, 14, 4);
            gUnknown_03004824->unk_007b = 4;
            sub_804ACD8(gUnknown_0820C14C[4], (u8 *)(BG_CHAR_ADDR(4) + 32 * gUnknown_03004824->unk_007e), 20);
        }
    }
    if (gMain.newKeys & R_BUTTON)
    {
        for (i = 0; i < 10; i ++)
        {
            gUnknown_03004824->linkData[i] = i;
        }
        SendBlock(bitmask_all_link_players_but_self(), gUnknown_03004824->linkData, 20);
    }
}

asm(".section .text.sub_804A96C");

/*static*/ void sub_804A96C(struct UnkStructD *arg0, u8 left, u8 top, u16 *tilemap, u8 width, u8 height, u16 sp8) {
    int y, x;

    for (y = 0; y < height; y++)
    {

        for (x = 0; x < width; x++)
        {
            arg0->var12[(top * 32 + left) + y * 32 + x] = tilemap[width * y + x] | sp8;
        }
    }

#if ENGLISH
    arg0->var10 = 1;
#endif
}

#if GERMAN
void sub_804A96C_alt(struct UnkStructD *arg0, u8 left, u8 top, u16 *tilemap, u8 width, u8 height, u16 sp8) {
    sub_804A96C(arg0, left, top, tilemap, width, height, sp8);

    arg0->var10 = 1;
}
#endif

asm(".section .text.sub_804DAD4");

/*static*/ void sub_804DAD4(struct UnkStructC *arg0, struct InGameTrade *trade) {
    s32 i;

    for (i = 0; i < 9; i++)
    {
        arg0->words[i] = gIngameTradeMail[trade->mailNum][i];
    }

    StringCopy(arg0->string, trade->otName);

#if GERMAN
    PadNameString(arg0->string, CHAR_SPACE);
#endif

    arg0->otId[0] = trade->otId >> 24;
    arg0->otId[1] = trade->otId >> 16;
    arg0->otId[2] = trade->otId >> 8;
    arg0->otId[3] = trade->otId;
    arg0->species = trade->species;
    arg0->heldItem = trade->heldItem;
}
