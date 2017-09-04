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
#include "pokemon_summary_screen.h"
#include "rom4.h"
#include "rom_8077ABC.h"
#include "daycare.h"
#include "event_data.h"
#include "strings.h"
#include "load_save.h"
#include "save.h"
#include "script.h"
#include "field_fadetransition.h"
#include "decompress.h"
#include "mail_data.h"
#include "evolution_scene.h"
#include "pokeball.h"
#include "pokedex.h"
#include "trade.h"

#ifdef ENGLISH
#define sub_804A96C_alt sub_804A96C
asm(".set sub_804A96C_alt, sub_804A96C");
#endif

#define Trade_SendData(ptr) (SendBlock(bitmask_all_link_players_but_self(), ptr->linkData, 20))

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
    /*0x00*/ u8 filler_00[8];
    /*0x08*/ void *vramAddr;
    /*0x0c*/ u8 filler_0c[4];
    /*0x10*/ u8 unk_10;
    /*0x12*/ u16 unk_12[0x400];
};

struct UnkStructE {
    /*0x00*/ u8 unk_00;
    /*0x02*/ u16 unk_02;
    /*0x04*/ u8 unk_04;
};

struct TradeEwramSubstruct {
    /*0x0000*/ u8 unk_0000;
    /*0x0001*/ u8 unk_0001;
    /*0x0004*/ struct Window window;
    /*0x0034*/ u8 partyIcons[2][6];
    /*0x0040*/ u8 tradeMenuCursorSpriteIdx;
    /*0x0041*/ u8 tradeMenuCursorPosition;
    /*0x0042*/ u8 partyCounts[2];
    /*0x0044*/ u8 tradeMenuOptionsActive[13];
    /*0x0051*/ u8 unk_0051[6];
    /*0x0057*/ u8 filler_0057[6];
    /*0x005d*/ u8 unk_005d[4][6];
    /*0x0075*/ u8 unk_0075;
    /*0x0076*/ u8 filler_0076[4];
    /*0x007a*/ u8 unk_007a;
    /*0x007b*/ u8 unk_007b;
    /*0x007c*/ u8 unk_007c;
    /*0x007d*/ u8 unk_007d;
    /*0x007e*/ u16 unk_007e;
    /*0x0080*/ u8 unk_0080[2];
    /*0x0082*/ u8 unk_0082[2];
    /*0x0084*/ u8 unk_0084;
    /*0x0085*/ u8 unk_0085;
    /*0x0086*/ u8 unk_0086;
    /*0x0087*/ u8 unk_0087;
    /*0x0088*/ u8 filler_0088[2];
    /*0x008a*/ u8 unk_008a;
    /*0x008b*/ u8 unk_008b;
    /*0x008c*/ u16 linkData[20];
    /*0x00b4*/ u8 unk_00b4;
    /*0x00b5*/ u8 unk_00b5[11];
    /*0x00c0*/ u8 filler_00c0[8];
    /*0x00c8*/ struct UnkStructD unk_00c8;
    /*0x08dc*/ struct UnkStructE unk_08dc[4];
    /*0x08fc*/ u8 filler_08fc[0x704];
};

struct UnkStructF {
    u8 filler_0000[9];
    u8 unk_0009;
    u8 filler_000a[0xff6];
};

struct TradeEwramSubstruct2 {
    /*0x0000*/ u8 filler_0000;
    /*0x0004*/ struct Window window;
    /*0x0034*/ u8 textWindowBaseTileNum;
    /*0x0038*/ struct Pokemon pokemon;
    /*0x009c*/ u8 unk_009c;
    /*0x009d*/ u8 unk_009d;
    /*0x009e*/ u16 linkData[12];
    /*0x00b6*/ u16 unk_00b6;
    // Sprite indices
    /*0x00b8*/ u8 unk_00b8;
    /*0x00b9*/ u8 unk_00b9;
    /*0x00ba*/ u8 unk_00ba;
    /*0x00bb*/ u8 unk_00bb;
    /*0x00bc*/ u8 unk_00bc;
    /*0x00bd*/ u8 unk_00bd;
    // Timer
    /*0x00c0*/ u32 unk_00c0;
    // Scene index
    /*0x00c4*/ u16 unk_00c4;
    /*0x00c6*/ u8 filler_00c6[0x3c];
    /*0x0102*/ u8 unk_0102;
    /*0x0103*/ u8 unk_0103;
    /*0x0104*/ u16 unk_0104;
    /*0x0106*/ u16 unk_0106;
    /*0x0108*/ u16 unk_0108;
    /*0x010a*/ u16 unk_010a;
    /*0x010c*/ u16 unk_010c;
    /*0x010e*/ s16 unk_010e;
    /*0x0110*/ s16 unk_0110;
    /*0x0112*/ u16 unk_0112;
    /*0x0114*/ u16 unk_0114;
    /*0x0116*/ s16 unk_0116;
    /*0x0118*/ u16 unk_0118;
    /*0x011a*/ u16 unk_011a;
    /*0x011c*/ u16 unk_011c;
    /*0x011e*/ u8 isLinkTrade;
    /*0x0120*/ u16 unk_0120;
    /*0x0122*/ u16 unk_0122;
    /*0x0124*/ u16 unk_0124;
};

struct TradeEwramStruct {
    /*0x00000*/ u8 filler_00000[0x7000];
    /*0x07000*/ struct TradeEwramSubstruct unk_07000;
    /*0x08000*/ struct UnkStructF unk_08000;
    /*0x09000*/ u8 filler_09000[0x4000];
    /*0x0d000*/ u8 tileBuffers[13][256];
    /*0x0dd00*/ u8 filler_0dd00[0x1300];
    /*0x0f000*/ struct TradeEwramSubstruct2 unk_0f000;
};

static void sub_8047EC0(void);
/*static*/ void sub_804AFB8(const struct WindowConfig *, u8 *, const u8 *, u8);
/*static*/ void sub_804ACD8(const u8 *, u8 *, u8);
static void nullsub_5(u8, u8);
static void sub_804AA88(void);
static void sub_804A964(struct UnkStructD *, void *);
static void sub_80489F4(void);
/*static*/ void sub_804AA0C(u8);
static bool8 sub_8048D44(void);
/*static*/ void sub_804AF84(void);
static bool8 sub_804ABF8(void);
/*static*/ void sub_804ACF4(u8);
static void sub_804A41C(u8);
static void sub_8048C70(void);
static void sub_8048B0C(u8);
/*static*/ void sub_804AE3C(u8);
/*static*/ void sub_804AF10(void);
static void sub_80494D8(void);
static void sub_8048AB4(void);
static void sub_804A940(struct UnkStructD *);
/*static*/ void sub_804B41C(void);
static void sub_8049DE0(void);
static void sub_804AB30(void);
static void sub_8049ED4(u8);
static void sub_804A6DC(u8);
static void sub_804A938(struct UnkStructD *);
static void sub_804A9F4(u8);
static void sub_804AA00(u8);
static void sub_8049E9C(u8);
static void sub_804AADC(u16, u8);
/*static*/ void sub_804A80C(void);
static u8 sub_80499F0(const u8 *, u8, u8);
static void sub_804A840(u8);
/*static*/ u8 sub_804A2B4(u8 *, u8, u8);
/*static*/ void sub_804A96C_alt(struct UnkStructD *, u8, u8, const u16 *, u8, u8, u16);
#ifdef NONMATCHING
static
#endif
void sub_804A33C(u8 *, u8, u8);
#ifdef NONMATCHING
static
#endif
void sub_804A51C(u8, u8, u8, u8, u8, u8);
static void sub_804D7AC(struct Sprite *);
/*static*/ void sub_804BA94(u8, u8);
/*static*/ bool8 sub_804C29C(void);
/*static*/ void sub_804DC18(void);
/*static*/ void sub_804BB78(void);
/*static*/ bool8 sub_804B2B0(void);
static void sub_804E144(void);
static void sub_804E1A0(u8);
/*static*/ void sub_804B790(void);
static void sub_804DAD4(struct MailStruct *, const struct InGameTrade *);
void sub_804D588(void);
static void sub_804DC88(void);
u8 sub_8047580(u8, u8, u8, u8, u8, u8, u8, u32);
void sub_804D6BC(struct Sprite *);
void sub_804D738(struct Sprite *);
void sub_804BBE8(u8);
void sub_804B128(void);
void sub_804B058(struct Sprite *);
void sub_804B07C(struct Sprite *);
void sub_804B0BC(struct Sprite *);
void sub_804B104(struct Sprite *);
void sub_804C0F8(u8);
bool8 sub_8040A3C(u16);
void sub_804B0E0(struct Sprite *);
void sub_804D80C(struct Sprite *);
void sub_804E1DC(void);
void sub_804BBCC(void);
void sub_804D8E4(void);
void sub_804C164(void);
void sub_804C1A8(void);
void sub_804DB84(void);

extern u8 gUnknown_020297D8[2];
extern u8 *gUnknown_020296CC[13];
extern struct TradeEwramSubstruct *gUnknown_03004824;
extern struct TradeEwramSubstruct2 *gUnknown_03004828;
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

const u8 gTradeLevelDisplayCoords[2][6][2] = {
    {
        // Your party
        {5, 4},
        {12, 4},
        {5, 9},
        {12, 9},
        {5, 14},
        {12, 14},
    },
    {
        // Friend's party
        {20, 4},
        {27, 4},
        {20, 9},
        {27, 9},
        {20, 14},
        {27, 14}
    }
};

const u8 gTradeMonBoxCoords[2][6][2] = {
    {
        // Your party
        {1, 3},
        {8, 3},
        {1, 8},
        {8, 8},
        {1, 13},
        {8, 13},
    },
    {
        // Friend's party
        {16, 3},
        {23, 3},
        {16, 8},
        {23, 8},
        {16, 13},
        {23, 13}
    }
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

const struct MenuAction2 gUnknown_0820C320[] = {
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
    {19,  3},
    { 0,  0}
};

const u16 gTradeBallPalette[] = INCBIN_U16("graphics/trade/ball.gbapal");
const u32 gTradeBallTiles[] = INCBIN_U32("graphics/trade/ball.4bpp");
const u16 gUnknown_0820C9F8[][16] = {
    INCBIN_U16("graphics/trade/unknown.gbapal"),
    INCBIN_U16("graphics/trade/gba.gbapal"),
    INCBIN_U16("graphics/trade/shadow.gbapal"),
    {},
    INCBIN_U16("graphics/trade/misc.gbapal")
};

const u32 gUnknown_0820CA98[] = INCBIN_U32("graphics/trade/gba.4bpp");
const u32 gUnknown_0820CA98_2[] = INCBIN_U32("graphics/trade/shadow.4bpp");
const u32 gUnknown_0820DD98[] = INCBIN_U32("graphics/trade/pokeball_symbol.8bpp");
const u16 gUnknown_0820F798[] = INCBIN_U16("graphics/trade/shadow_map.bin");
const u16 gUnknown_08210798[] = INCBIN_U16("graphics/trade/gba_map.bin");
const u16 gUnknown_08211798[] = INCBIN_U16("graphics/trade/cable_closeup_map.bin");
const u16 gUnknown_08211F98[] = INCBIN_U16("graphics/trade/pokeball_symbol_map.bin");
const u16 unused_08212098[] = INCBIN_U16("graphics/unused/unknown/8212098.gbapal");
const u16 gTradeCableEndPalette[] = INCBIN_U16("graphics/trade/cable_end.gbapal");
const u16 unused_082120D8[] = INCBIN_U16("graphics/unused/unknown/82120D8.gbapal");
const u16 nullpal_082120F8[16] = {};
const u16 gTradeGlowPalette[] = INCBIN_U16("graphics/trade/glow.gbapal");
const u32 gTradeGlow1Tiles[] = INCBIN_U32("graphics/trade/glow1.4bpp");
const u32 gTradeGlow2Tiles[] = INCBIN_U32("graphics/trade/glow2.4bpp");
const u32 gTradeCableEndTiles[] = INCBIN_U32("graphics/trade/cable_end.4bpp");
const u32 gTradeGBAScreenTiles[] = INCBIN_U32("graphics/trade/gba_screen.4bpp");
const u32 gUnknown_08213738[] = INCBIN_U32("graphics/trade/gba_affine.8bpp");
const u16 gUnknown_08215778[] = INCBIN_U16("graphics/trade/gba_affine_map.bin");

const struct OamData gOamData_8215878 = {
    .affineMode = 1,
    .size = 1
};

const union AnimCmd gSpriteAnim_8215880[] = {
    ANIMCMD_FRAME( 0, 3),
    ANIMCMD_FRAME( 4, 3),
    ANIMCMD_FRAME( 8, 3),
    ANIMCMD_FRAME(12, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(20, 3),
    ANIMCMD_FRAME(24, 3),
    ANIMCMD_FRAME(28, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(36, 3),
    ANIMCMD_FRAME(40, 3),
    ANIMCMD_FRAME(44, 3),
    ANIMCMD_LOOP(1),
    ANIMCMD_FRAME( 0, 3),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_82158BC[] = {
    ANIMCMD_FRAME( 0, 3),
    ANIMCMD_FRAME( 4, 3),
    ANIMCMD_FRAME( 8, 3),
    ANIMCMD_FRAME(12, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(20, 3),
    ANIMCMD_FRAME(24, 3),
    ANIMCMD_FRAME(28, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(36, 3),
    ANIMCMD_FRAME(40, 3),
    ANIMCMD_FRAME(44, 3),
    ANIMCMD_LOOP(2),
    ANIMCMD_FRAME( 0, 3),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_82158F8[] = {
    gSpriteAnim_8215880,
    gSpriteAnim_82158BC
};

const union AffineAnimCmd gSpriteAffineAnim_8215900[] = {
    AFFINEANIMCMD_FRAME(0, 0, 0, 1),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gSpriteAffineAnim_8215910[] = {
    AFFINEANIMCMD_FRAME(-8, 0, 0, 20),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd gSpriteAffineAnim_8215920[] = {
    AFFINEANIMCMD_FRAME(0x60, 0x100, 0,  0),
    AFFINEANIMCMD_FRAME(   0,     0, 0,  5),
    AFFINEANIMCMD_FRAME(   8,     0, 0, 20),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_8215940[] = {
    gSpriteAffineAnim_8215900,
    gSpriteAffineAnim_8215910,
    gSpriteAffineAnim_8215920
};

const struct SpriteSheet gUnknown_0821594C = {
    (const u8 *)gTradeBallTiles, 0x600, 5557
};

const struct SpritePalette gUnknown_08215954 = {
    gTradeBallPalette, 5558
};

const struct SpriteTemplate gSpriteTemplate_821595C = {
    5557,
    5558,
    &gOamData_8215878,
    gSpriteAnimTable_82158F8,
    NULL,
    gSpriteAffineAnimTable_8215940,
    sub_804D6BC
};

const struct OamData gOamData_8215974 = {
    .affineMode = 1,
    .objMode = 1,
    .size = 2,
    .priority = 1
};

const union AnimCmd gSpriteAnim_821597C[] = {
    ANIMCMD_FRAME(0, 5, .hFlip = TRUE, .vFlip = TRUE),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_8215984[] = {
    gSpriteAnim_821597C
};

const union AffineAnimCmd gSpriteAffineAnim_8215988[] = {
    AFFINEANIMCMD_FRAME(-10, -10, 0, 5),
    AFFINEANIMCMD_FRAME(10, 10, 0, 5),
    AFFINEANIMCMD_JUMP(0)
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_82159A0[] = {
    gSpriteAffineAnim_8215988
};

const struct SpriteSheet gUnknown_082159A4 = {
    (const u8 *)gTradeGlow1Tiles, 0x200, 5550
};

const struct SpritePalette gUnknown_082159AC = {
    gTradeGlowPalette, 5551
};

const struct SpritePalette gUnknown_082159B4 = {
    gTradeCableEndPalette, 5555
};

const struct SpriteTemplate gSpriteTemplate_82159BC = {
    5550,
    5551,
    &gOamData_8215974,
    gSpriteAnimTable_8215984,
    NULL,
    gSpriteAffineAnimTable_82159A0,
    sub_804B058
};

const struct OamData gOamData_82159D4 = {
    .shape = ST_OAM_V_RECTANGLE,
    .size = 2,
    .priority = 1
};

const union AnimCmd gSpriteAnim_82159DC[] = {
    ANIMCMD_FRAME(0, 5, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_82159E4[] = {
    ANIMCMD_FRAME(8, 5, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_82159EC[] = {
    gSpriteAnim_82159DC,
    gSpriteAnim_82159E4
};

const struct SpriteSheet gUnknown_082159F4 = {
    (const u8 *)gTradeGlow2Tiles, 0x300, 5552
};

const struct SpriteTemplate gSpriteTemplate_82159FC = {
    5552,
    5551,
    &gOamData_82159D4,
    gSpriteAnimTable_82159EC,
    NULL,
    gDummySpriteAffineAnimTable,
    sub_804B07C
};

const struct OamData gOamData_8215A14 = {
    .shape = ST_OAM_V_RECTANGLE,
    .size = 2,
    .priority = 1
};

const union AnimCmd gSpriteAnim_8215A1C[] = {
    ANIMCMD_FRAME(0, 10),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_8215A24[] = {
    gSpriteAnim_8215A1C
};

const struct SpriteSheet gUnknown_08215A28 = {
    (const u8 *)gTradeCableEndTiles, 0x100, 5554
};

const struct SpriteTemplate gSpriteTemplate_8215A30 = {
    5554,
    5555,
    &gOamData_8215A14,
    gSpriteAnimTable_8215A24,
    NULL,
    gDummySpriteAffineAnimTable,
    sub_804B0BC
};

const struct OamData gOamData_8215A48 = {
    .shape = ST_OAM_H_RECTANGLE,
    .size = 3,
    .priority = 1
};

const union AnimCmd gSpriteAnim_8215A50[] = {
    ANIMCMD_FRAME( 0, 2, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 2, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(64, 2, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(96, 2, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(64, 2, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME(32, 2, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_FRAME( 0, 2, .vFlip = TRUE, .hFlip = TRUE),
    ANIMCMD_LOOP(8),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_8215A74[] = {
    gSpriteAnim_8215A50
};

const struct SpriteSheet gUnknown_08215A78 = {
    (const u8 *)gTradeGBAScreenTiles, 0x1000, 5556
};

const struct SpriteTemplate gSpriteTemplate_8215A80 = {
    5556,
    5555,
    &gOamData_8215A48,
    gSpriteAnimTable_8215A74,
    NULL,
    gDummySpriteAffineAnimTable,
    sub_804B104
};

const u16 gTradeGlow2PaletteAnimTable[] = {
    RGB(18, 24, 31),
    RGB(18, 24, 31),
    RGB(18, 24, 31),
    RGB(31, 31, 31),
    RGB(31, 31, 31),
    RGB(31, 31, 31),
    RGB(18, 24, 31),
    RGB(18, 24, 31),
    RGB(18, 24, 31),
    RGB(31, 31, 31),
    RGB(31, 31, 31),
    RGB(31, 31, 31),
};

const union AffineAnimCmd gSpriteAffineAnim_8215AB0[] = {
    AFFINEANIMCMD_FRAME(-0x100, 0x100, 0, 0),
    AFFINEANIMCMD_JUMP(0)
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_8215AC0[] = {
    gSpriteAffineAnim_8215AB0
};

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
            gUnknown_03004824->unk_0080[0] = 0;
            gUnknown_03004824->unk_0080[1] = 0;
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
            gUnknown_03004824->partyCounts[0] = gPlayerPartyCount;
            gUnknown_03004824->partyCounts[1] = gEnemyPartyCount;
            for (i = 0; i < gUnknown_03004824->partyCounts[0]; i ++)
                gUnknown_03004824->partyIcons[0][i] = CreateMonIcon(GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2), sub_809D62C, gTradeMonSpriteCoords[i][0] * 8 + 14, gTradeMonSpriteCoords[i][1] * 8 - 12, TRUE, GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY));
            for (i = 0; i < gUnknown_03004824->partyCounts[1]; i ++)
                gUnknown_03004824->partyIcons[1][i] = CreateMonIcon(GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2, NULL), sub_809D62C, gTradeMonSpriteCoords[6 + i][0] * 8 + 14, gTradeMonSpriteCoords[6 + i][1] * 8 - 12, TRUE, GetMonData(&gEnemyParty[i], MON_DATA_PERSONALITY));
            nullsub_5(2, 0);
            gMain.state ++;
            break;
        case  7:
            LoadHeldItemIconGraphics();
            CreateHeldItemIcons(&gUnknown_03004824->partyCounts[0], gUnknown_03004824->partyIcons[0], 0);
            gMain.state ++;
            break;
        case  8:
            CreateHeldItemIcons(&gUnknown_03004824->partyCounts[0], gUnknown_03004824->partyIcons[0], 1);
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
            gUnknown_03004824->tradeMenuCursorSpriteIdx = CreateSprite(&gSpriteTemplate_820C134, gTradeMonSpriteCoords[0][0] * 8 + 32, gTradeMonSpriteCoords[0][1] * 8, 2);
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

void sub_80484F4(void)
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
            gUnknown_03004824->unk_0080[0] = 0;
            gUnknown_03004824->unk_0080[1] = 0;
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
            gUnknown_03004824->partyCounts[0] = gPlayerPartyCount;
            gUnknown_03004824->partyCounts[1] = gEnemyPartyCount;
            sub_804A41C(0);
            sub_804A41C(1);
            for (i = 0; i < gUnknown_03004824->partyCounts[0]; i ++)
                gUnknown_03004824->partyIcons[0][i] = CreateMonIcon(GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL), sub_809D62C, gTradeMonSpriteCoords[i][0] * 8 + 14, gTradeMonSpriteCoords[i][1] * 8 - 12, TRUE, GetMonData(&gPlayerParty[i], MON_DATA_PERSONALITY));
            for (i = 0; i < gUnknown_03004824->partyCounts[1]; i ++)
                gUnknown_03004824->partyIcons[1][i] = CreateMonIcon(GetMonData(&gEnemyParty[i], MON_DATA_SPECIES2, NULL), sub_809D62C, gTradeMonSpriteCoords[6 + i][0] * 8 + 14, gTradeMonSpriteCoords[6 + i][1] * 8 - 12, TRUE, GetMonData(&gEnemyParty[i], MON_DATA_PERSONALITY));
            nullsub_5(2, 0);
            gMain.state ++;
            break;
        case  7:
            LoadHeldItemIconGraphics();
            CreateHeldItemIcons(&gUnknown_03004824->partyCounts[0], gUnknown_03004824->partyIcons[0], 0);
            gMain.state ++;
            break;
        case  8:
            CreateHeldItemIcons(&gUnknown_03004824->partyCounts[0], gUnknown_03004824->partyIcons[0], 1);
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
            gUnknown_03004824->tradeMenuCursorSpriteIdx = CreateSprite(&gSpriteTemplate_820C134, gTradeMonSpriteCoords[gUnknown_03004824->tradeMenuCursorPosition][0] * 8 + 32, gTradeMonSpriteCoords[gUnknown_03004824->tradeMenuCursorPosition][1] * 8, 2);
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
        if (i < gUnknown_03004824->partyCounts[0])
        {
            gSprites[gUnknown_03004824->partyIcons[0][i]].invisible = FALSE;
            gUnknown_03004824->tradeMenuOptionsActive[i] = TRUE;
        }
        else
        {
            gUnknown_03004824->tradeMenuOptionsActive[i] = FALSE;
        }
        if (i < gUnknown_03004824->partyCounts[1])
        {
            gSprites[gUnknown_03004824->partyIcons[1][i]].invisible = FALSE;
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

static void sub_8049088(void)
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
        StartSpriteAnim(&gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx], 1);
        gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx].pos1.x = 0xe0;
        gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx].pos1.y = 0xa0;
    }
    else
    {
        StartSpriteAnim(&gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx], 0);
        gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx].pos1.x = gTradeMonSpriteCoords[newPosition][0] * 8 + 32;
        gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx].pos1.y = gTradeMonSpriteCoords[newPosition][1] * 8;
    }
    if (*tradeMenuCursorPosition != newPosition)
    {
        PlaySE(SE_SELECT);
    }
    *tradeMenuCursorPosition = newPosition;
}

static void sub_8049620(void)
{
    sub_804AA0C(0);
    gUnknown_03004824->unk_007b = 5;
    if (GetMultiplayerId() == 1)
    {
        gUnknown_03004824->linkData[0] = 0xaabb;
        gUnknown_03004824->linkData[1] = gUnknown_03004824->tradeMenuCursorPosition;
        Trade_SendData(gUnknown_03004824);
    }
    else
    {
        gUnknown_03004824->unk_0084 = 1;
    }
}

static void sub_8049680(void)
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
            PrintMenuItems(19, 15, 2, (const struct MenuAction *)gUnknown_0820C320);
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
        Trade_SendData(gUnknown_03004824);
    }
}

static void sub_8049804(void)
{
    HandleDestroyMenuCursors();
    sub_804A80C();
    gUnknown_03004824->unk_007b = 0;
    gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx].invisible = FALSE;
    sub_804ACD8(gUnknown_0820C14C[1], (u8 *)(BG_CHAR_ADDR(4) + 32 * gUnknown_03004824->unk_007e), 20);
}

static void sub_8049860(void)
{
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        gUnknown_03004824->unk_007c = MoveMenuCursor(-1);
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        gUnknown_03004824->unk_007c = MoveMenuCursor(+1);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        if (GetMenuCursorPos() == 0)
        {
            BeginNormalPaletteFade(-1, 0, 0, 16, 0);
            gUnknown_03004824->unk_007b = 2;
        }
        else if (sub_80499F0(gUnknown_03004824->unk_0051, gUnknown_03004824->partyCounts[0], gUnknown_03004824->tradeMenuCursorPosition) == 0)
        {
            sub_804AADC(3, 2);
            gUnknown_03004824->unk_007b = 8;
        }
        else
        {
            sub_8049620();
            gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx].invisible = TRUE;
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        sub_8049804();
    }
}

static void sub_8049954(void)
{
    if (gMain.newKeys & A_BUTTON || gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        sub_8049804();
    }
}

static void sub_804997C(void)
{
    if (!gPaletteFade.active)
    {
        if (gUnknown_03004824->tradeMenuCursorPosition < PARTY_SIZE)
        {
            ShowPokemonSummaryScreen(gPlayerParty, gUnknown_03004824->tradeMenuCursorPosition, gUnknown_03004824->partyCounts[0] - 1, sub_80484F4, 4);
        }
        else
        {
            ShowPokemonSummaryScreen(gEnemyParty, gUnknown_03004824->tradeMenuCursorPosition - 6, gUnknown_03004824->partyCounts[1] - 1, sub_80484F4, 4);
        }
    }
}

static u8 sub_80499F0(const u8 *src, u8 partyCount, u8 tradeMenuCursorPosition)
{
    u8 retval = 0;
    int i;
    for (i = 0; i < partyCount; i ++)
    {
        if (tradeMenuCursorPosition != i)
        {
            retval += src[i];
        }
    }
    return retval;
}

static void sub_8049A20(void)
{
    u8 unk_0051[12];
    int i;
    for (i = 0; i < gUnknown_03004824->partyCounts[0]; i ++)
    {
        unk_0051[i] = gUnknown_03004824->unk_0051[i];
    }
    if (sub_80499F0(unk_0051, gUnknown_03004824->partyCounts[0], gUnknown_03004824->tradeMenuCursorPosition) == 0)
    {
        sub_804AADC(3, 2);
        gUnknown_03004824->linkData[0] = 0xbbcc;
        sub_804AADC(0xb4, 0);
    }
    else
    {
        sub_804AADC(3, 1);
        gUnknown_03004824->linkData[0] = 0xbbbb;
        if (sub_8007ECC())
        {
            Trade_SendData(gUnknown_03004824);
        }
    }
}

static void sub_8049AC0(void)
{
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        gUnknown_03004824->unk_007c = MoveMenuCursor(-1);
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        gUnknown_03004824->unk_007c = MoveMenuCursor(+1);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        if (GetMenuCursorPos() == 0)
        {
            sub_8049A20();
        }
        else
        {
            sub_804AADC(3, 1);
            if (sub_8007ECC())
            {
                gUnknown_03004824->linkData[0] = 0xbbcc;
                Trade_SendData(gUnknown_03004824);
            }
        }
        gUnknown_03004824->unk_007b = 100;
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        sub_804AADC(3, 1);
        if (GetMenuCursorPos() == 0)
        {
            gUnknown_03004824->unk_007c = MoveMenuCursor(+1);
        }
        gUnknown_03004824->linkData[0] = 0xbbcc;
        Trade_SendData(gUnknown_03004824);
        gUnknown_03004824->unk_007b = 100;
    }
}

static void sub_8049BC0(void)
{
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        gUnknown_03004824->unk_007c = MoveMenuCursor(-1);
    }
    else if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        gUnknown_03004824->unk_007c = MoveMenuCursor(+1);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        if (GetMenuCursorPos() == 0)
        {
            sub_804AA0C(4);
            gUnknown_03004824->linkData[0] = 0xeeaa;
            gUnknown_03004824->linkData[1] = 0;
            sub_804AADC(5, 0);
            gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx].invisible = TRUE;
            gUnknown_03004824->unk_007b = 100;
        }
        else
        {
            sub_8049804();
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        sub_8049804();
    }
}

static void sub_8049C8C(void)
{
    if (GetMultiplayerId() == 0)
    {
        sub_8049E9C(gUnknown_03004824->tradeMenuCursorPosition);
        sub_8049E9C(gUnknown_03004824->unk_008a);
    }
    gUnknown_03004824->unk_007b = 7;
}

static void sub_8049CC4(void)
{
    if (gUnknown_03004824->unk_0080[0] == 5 && gUnknown_03004824->unk_0080[1] == 5)
    {
        sub_8049088();
        gUnknown_03004824->unk_007b = 14;
    }
}

static void DisplayMessageAndContinueTask(void)
{
    gUnknown_03004824->unk_00b4++;
    if (gUnknown_03004824->unk_00b4 > 120)
    {
        DrawTextWindow(&gUnknown_03004824->window, 24, 14, 29, 19);
        InitYesNoMenu(24, 14, 4);
        gUnknown_03004824->unk_00b4 = 0;
        gUnknown_03004824->unk_007b = 3;
    }
}

static void sub_8049D44(void)
{
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        sub_804A840(0);
        sub_804A840(1);
        gUnknown_03004824->unk_007b = 0;
        gSprites[gUnknown_03004824->tradeMenuCursorSpriteIdx].invisible = FALSE;
    }
}

static void sub_8049D9C(void)
{
    if (!gPaletteFade.active)
    {
        sub_800832C();
        gUnknown_03004824->unk_007b = 12;
    }
}

static void sub_8049DC4(void)
{
    if (gReceivedRemoteLinkPlayers == 0)
    {
        SetMainCallback2(sub_805465C);
    }
}

static void sub_8049DE0(void)
{
    switch (gUnknown_03004824->unk_007b)
    {
        case  0:
            sub_8049680();
            break;
        case  1:
            sub_8049860();
            break;
        case  2:
            sub_804997C();
            break;
        case  3:
            sub_8049AC0();
            break;
        case  4:
            sub_8049BC0();
            break;
        case  6:
            sub_8049C8C();
            break;
        case  7:
            sub_8049CC4();
            break;
        case  8:
            sub_8049D44();
            break;
        case  9:
            sub_8048A14();
            break;
        case 10:
            sub_8048A50();
            break;
        case 11:
            sub_8049D9C();
            break;
        case 12:
            sub_8049DC4();
            break;
        case 13:
            sub_8048A90();
            break;
        case 14:
            DisplayMessageAndContinueTask();
            break;
        case 15:
            sub_8049954();
            break;
    }
}

static void sub_8049E9C(u8 a0)
{
    u8 v0 = a0 / 6;
    if (gUnknown_03004824->unk_0080[v0] == 0)
    {
        gUnknown_03004824->unk_0080[v0] = 1;
        gUnknown_03004824->unk_0082[v0] = a0;
    }
}

// TODO: Figure out what the f**k is going on here
#ifdef NONMATCHING
static void sub_8049ED4(u8 a0)
{
    u8 i;
    s8 stringLength;
    u8 whichParty = 1;
    u8 whichPokemon;
    u8 string1[40];
    u8 string2[56];
    u8 temp0 = gUnknown_03004824->unk_0082[a0];
    if (temp0 < PARTY_SIZE)
        whichParty = 0;
    whichPokemon = temp0 % PARTY_SIZE;

    switch (gUnknown_03004824->unk_0080[a0])
    {
        case 1:
            for (i = 0; i < gUnknown_03004824->partyCounts[a0]; i ++)
            {
                gSprites[gUnknown_03004824->partyIcons[whichParty][i]].invisible = TRUE;
            }
            gSprites[gUnknown_03004824->partyIcons[whichParty][whichPokemon]].invisible = FALSE;
            gSprites[gUnknown_03004824->partyIcons[whichParty][whichPokemon]].data0 = 20;
            gSprites[gUnknown_03004824->partyIcons[whichParty][whichPokemon]].data2 = (gTradeMonSpriteCoords[6 * whichParty + whichPokemon][0] + gTradeMonSpriteCoords[6 * whichParty + whichPokemon + 1][0]) / 2 * 8 + 14;
            gSprites[gUnknown_03004824->partyIcons[whichParty][whichPokemon]].data4 = gTradeMonSpriteCoords[6 * whichParty + whichPokemon][1] * 8 - 12;
            oamt_set_x3A_32(&gSprites[gUnknown_03004824->partyIcons[whichParty][whichPokemon]], sub_809D62C);
            gUnknown_03004824->unk_0080[a0] ++;
            sub_8078A34(&gSprites[gUnknown_03004824->partyIcons[whichParty][whichPokemon]]);
            HandleDestroyMenuCursors();
            FillWindowRect_DefaultPalette(&gUnknown_03004824->window, 0, gUnknown_0820C330[whichParty][0], 0, gUnknown_0820C330[whichParty][1], 19);
            sub_804A96C_alt(&gUnknown_03004824->unk_00c8, 15 * a0, 0, gTradePartyBoxTilemap, 15, 17, 0);
            if (whichParty == 0)
            {
                sub_804A80C();
            }
            break;
        case 2:
            if (gSprites[gUnknown_03004824->partyIcons[whichParty][whichPokemon]].callback == sub_809D62C)
            {
                gUnknown_03004824->unk_0080[a0] = 3;
            }
            break;
        case 3:
            sub_804A96C_alt(&gUnknown_03004824->unk_00c8, 15 * whichParty, 0, gTradePartyBoxTilemap, 15, 17, 0);
            gSprites[gUnknown_03004824->partyIcons[whichParty][whichPokemon]].pos1.x = (gTradeMonSpriteCoords[6 * whichParty + whichPokemon ][0] + gTradeMonSpriteCoords[6 * whichParty + whichPokemon + 1][0]) / 2 * 8 + 14;
            gSprites[gUnknown_03004824->partyIcons[whichParty][whichPokemon]].pos1.y = gTradeMonSpriteCoords[6 * whichParty + whichPokemon ][1] * 8 - 12;
            gSprites[gUnknown_03004824->partyIcons[whichParty][whichPokemon]].pos2.x = 0;
            gSprites[gUnknown_03004824->partyIcons[whichParty][whichPokemon]].pos2.y = 0;
            stringLength = sub_804A2B4(string1 + 6, whichParty, whichPokemon);
            string1[0] = 0xFC;
            string1[1] = 0x06;
            string1[2] = 0x04;
            string1[3] = 0xFC;
            string1[4] = 0x11;
            string1[5] = (64 - stringLength) / 2;
            sub_8003460(&gUnknown_03004824->window, string1, gUnknown_03004824->unk_007a + whichParty * 6 * 32, gUnknown_0820C334[whichParty][0], gUnknown_0820C334[whichParty][1]);
            sub_804A33C(string2, whichParty, whichPokemon);
            sub_8003460(&gUnknown_03004824->window, gOtherText_Terminator2, gUnknown_03004824->unk_007a + whichParty * 6 * 32 + 32, gUnknown_0820C334[whichParty + 1][0], gUnknown_0820C334[whichParty + 1][1] + 1);
            sub_8003460(&gUnknown_03004824->window, string2, gUnknown_03004824->unk_007a + whichParty * 6 * 32 + 38, gUnknown_0820C334[whichParty + 1][0], gUnknown_0820C334[whichParty + 1][1] + 1);
            gUnknown_03004824->unk_0080[a0] ++;
            break;
        case 4:
            sub_804ACD8(gUnknown_0820C14C[5], (u8 *)(BG_CHAR_ADDR(4) + 32 * gUnknown_03004824->unk_007e), 20);
            sub_804A51C(a0, whichPokemon, gUnknown_0820C3D1[a0][0] + 4, gUnknown_0820C3D1[a0][1] + 1, gUnknown_0820C3D1[a0][0], gUnknown_0820C3D1[a0][1]);
            gUnknown_03004824->unk_0080[a0] ++;
            break;
    }
}
#else
__attribute__((naked))
static void sub_8049ED4(u8 a0)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tmov r7, r10\n"
                    "\tmov r6, r9\n"
                    "\tmov r5, r8\n"
                    "\tpush {r5-r7}\n"
                    "\tsub sp, 0x74\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tmov r10, r0\n"
                    "\tldr r0, _08049F24 @ =gUnknown_03004824\n"
                    "\tldr r5, [r0]\n"
                    "\tadds r0, r5, 0\n"
                    "\tadds r0, 0x82\n"
                    "\tadd r0, r10\n"
                    "\tldrb r0, [r0]\n"
                    "\tmovs r1, 0x1\n"
                    "\tstr r1, [sp, 0x6C]\n"
                    "\tcmp r0, 0x5\n"
                    "\tbhi _08049EFE\n"
                    "\tmovs r2, 0\n"
                    "\tstr r2, [sp, 0x6C]\n"
                    "_08049EFE:\n"
                    "\tmovs r1, 0x6\n"
                    "\tbl __umodsi3\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tmov r8, r0\n"
                    "\tadds r0, r5, 0\n"
                    "\tadds r0, 0x80\n"
                    "\tmov r1, r10\n"
                    "\tadds r3, r0, r1\n"
                    "\tldrb r0, [r3]\n"
                    "\tcmp r0, 0x2\n"
                    "\tbne _08049F1A\n"
                    "\tb _0804A0AC\n"
                    "_08049F1A:\n"
                    "\tcmp r0, 0x2\n"
                    "\tbgt _08049F28\n"
                    "\tcmp r0, 0x1\n"
                    "\tbeq _08049F36\n"
                    "\tb _0804A294\n"
                    "\t.align 2, 0\n"
                    "_08049F24: .4byte gUnknown_03004824\n"
                    "_08049F28:\n"
                    "\tcmp r0, 0x3\n"
                    "\tbne _08049F2E\n"
                    "\tb _0804A0E4\n"
                    "_08049F2E:\n"
                    "\tcmp r0, 0x4\n"
                    "\tbne _08049F34\n"
                    "\tb _0804A244\n"
                    "_08049F34:\n"
                    "\tb _0804A294\n"
                    "_08049F36:\n"
                    "\tmovs r4, 0\n"
                    "\tadds r0, r5, 0\n"
                    "\tadds r0, 0x42\n"
                    "\tadd r0, r10\n"
                    "\tldr r7, _0804A094 @ =gSprites\n"
                    "\tldr r2, [sp, 0x6C]\n"
                    "\tlsls r2, 1\n"
                    "\tmov r9, r2\n"
                    "\tldr r3, _0804A098 @ =gTradeMonSpriteCoords\n"
                    "\tmov r12, r3\n"
                    "\tmov r5, r10\n"
                    "\tlsls r5, 4\n"
                    "\tstr r5, [sp, 0x70]\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r4, r0\n"
                    "\tbcs _08049F8E\n"
                    "\tadds r6, r7, 0\n"
                    "\tldr r2, _0804A09C @ =gUnknown_03004824\n"
                    "\tldr r0, [sp, 0x6C]\n"
                    "\tadd r0, r9\n"
                    "\tlsls r3, r0, 1\n"
                    "\tmovs r5, 0x4\n"
                    "_08049F62:\n"
                    "\tldr r0, [r2]\n"
                    "\tadds r1, r4, r3\n"
                    "\tadds r0, 0x34\n"
                    "\tadds r0, r1\n"
                    "\tldrb r1, [r0]\n"
                    "\tlsls r0, r1, 4\n"
                    "\tadds r0, r1\n"
                    "\tlsls r0, 2\n"
                    "\tadds r0, r6\n"
                    "\tadds r0, 0x3E\n"
                    "\tldrb r1, [r0]\n"
                    "\torrs r1, r5\n"
                    "\tstrb r1, [r0]\n"
                    "\tadds r0, r4, 0x1\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r4, r0, 24\n"
                    "\tldr r0, [r2]\n"
                    "\tadds r0, 0x42\n"
                    "\tadd r0, r10\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r4, r0\n"
                    "\tbcc _08049F62\n"
                    "_08049F8E:\n"
                    "\tldr r1, _0804A09C @ =gUnknown_03004824\n"
                    "\tldr r0, [r1]\n"
                    "\tldr r5, [sp, 0x6C]\n"
                    "\tadd r5, r9\n"
                    "\tlsls r3, r5, 1\n"
                    "\tmov r2, r8\n"
                    "\tadds r6, r2, r3\n"
                    "\tadds r0, 0x34\n"
                    "\tadds r0, r6\n"
                    "\tldrb r1, [r0]\n"
                    "\tlsls r0, r1, 4\n"
                    "\tadds r0, r1\n"
                    "\tlsls r0, 2\n"
                    "\tadds r0, r7\n"
                    "\tadds r0, 0x3E\n"
                    "\tldrb r2, [r0]\n"
                    "\tmovs r1, 0x5\n"
                    "\tnegs r1, r1\n"
                    "\tands r1, r2\n"
                    "\tstrb r1, [r0]\n"
                    "\tldr r0, _0804A09C @ =gUnknown_03004824\n"
                    "\tldr r4, [r0]\n"
                    "\tadds r4, 0x34\n"
                    "\tadds r4, r6\n"
                    "\tldrb r1, [r4]\n"
                    "\tlsls r0, r1, 4\n"
                    "\tadds r0, r1\n"
                    "\tlsls r0, 2\n"
                    "\tadds r0, r7\n"
                    "\tmovs r1, 0x14\n"
                    "\tstrh r1, [r0, 0x2E]\n"
                    "\tldrb r0, [r4]\n"
                    "\tlsls r2, r0, 4\n"
                    "\tadds r2, r0\n"
                    "\tlsls r2, 2\n"
                    "\tadds r2, r7\n"
                    "\tlsls r5, 2\n"
                    "\tmov r1, r12\n"
                    "\tadds r0, r5, r1\n"
                    "\tldrb r0, [r0]\n"
                    "\tadds r3, 0x1\n"
                    "\tlsls r3, 1\n"
                    "\tadd r3, r12\n"
                    "\tldrb r1, [r3]\n"
                    "\tadds r0, r1\n"
                    "\tasrs r0, 1\n"
                    "\tlsls r0, 3\n"
                    "\tadds r0, 0xE\n"
                    "\tstrh r0, [r2, 0x32]\n"
                    "\tldrb r0, [r4]\n"
                    "\tlsls r1, r0, 4\n"
                    "\tadds r1, r0\n"
                    "\tlsls r1, 2\n"
                    "\tadds r1, r7\n"
                    "\tmov r0, r12\n"
                    "\tadds r0, 0x1\n"
                    "\tadds r5, r0\n"
                    "\tldrb r0, [r5]\n"
                    "\tlsls r0, 3\n"
                    "\tsubs r0, 0xC\n"
                    "\tstrh r0, [r1, 0x36]\n"
                    "\tldrb r1, [r4]\n"
                    "\tlsls r0, r1, 4\n"
                    "\tadds r0, r1\n"
                    "\tlsls r0, 2\n"
                    "\tadds r0, r7\n"
                    "\tldr r1, _0804A0A0 @ =sub_809D62C\n"
                    "\tbl oamt_set_x3A_32\n"
                    "\tldr r2, _0804A09C @ =gUnknown_03004824\n"
                    "\tldr r1, [r2]\n"
                    "\tadds r1, 0x80\n"
                    "\tadd r1, r10\n"
                    "\tldrb r0, [r1]\n"
                    "\tadds r0, 0x1\n"
                    "\tstrb r0, [r1]\n"
                    "\tldr r0, [r2]\n"
                    "\tadds r0, 0x34\n"
                    "\tadds r0, r6\n"
                    "\tldrb r1, [r0]\n"
                    "\tlsls r0, r1, 4\n"
                    "\tadds r0, r1\n"
                    "\tlsls r0, 2\n"
                    "\tadds r0, r7\n"
                    "\tbl sub_8078A34\n"
                    "\tbl HandleDestroyMenuCursors\n"
                    "\tldr r3, _0804A09C @ =gUnknown_03004824\n"
                    "\tldr r0, [r3]\n"
                    "\tadds r0, 0x4\n"
                    "\tldr r1, _0804A0A4 @ =gUnknown_0820C330\n"
                    "\tmov r5, r9\n"
                    "\tadds r2, r5, r1\n"
                    "\tldrb r2, [r2]\n"
                    "\tadds r1, 0x1\n"
                    "\tadd r1, r9\n"
                    "\tldrb r1, [r1]\n"
                    "\tstr r1, [sp]\n"
                    "\tmovs r1, 0x13\n"
                    "\tstr r1, [sp, 0x4]\n"
                    "\tmovs r1, 0\n"
                    "\tmovs r3, 0\n"
                    "\tbl FillWindowRect_DefaultPalette\n"
                    "\tldr r1, _0804A09C @ =gUnknown_03004824\n"
                    "\tldr r0, [r1]\n"
                    "\tadds r0, 0xC8\n"
                    "\tldr r2, [sp, 0x70]\n"
                    "\tmov r3, r10\n"
                    "\tsubs r1, r2, r3\n"
                    "\tlsls r1, 24\n"
                    "\tlsrs r1, 24\n"
                    "\tldr r3, _0804A0A8 @ =gTradePartyBoxTilemap\n"
                    "\tmovs r2, 0xF\n"
                    "\tstr r2, [sp]\n"
                    "\tmovs r2, 0x11\n"
                    "\tstr r2, [sp, 0x4]\n"
                    "\tmovs r5, 0\n"
                    "\tstr r5, [sp, 0x8]\n"
                    "\tmovs r2, 0\n"
                    "\tbl sub_804A96C_alt\n"
                    "\tldr r0, [sp, 0x6C]\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0804A08C\n"
                    "\tb _0804A294\n"
                    "_0804A08C:\n"
                    "\tbl sub_804A80C\n"
                    "\tb _0804A294\n"
                    "\t.align 2, 0\n"
                    "_0804A094: .4byte gSprites\n"
                    "_0804A098: .4byte gTradeMonSpriteCoords\n"
                    "_0804A09C: .4byte gUnknown_03004824\n"
                    "_0804A0A0: .4byte sub_809D62C\n"
                    "_0804A0A4: .4byte gUnknown_0820C330\n"
                    "_0804A0A8: .4byte gTradePartyBoxTilemap\n"
                    "_0804A0AC:\n"
                    "\tldr r2, _0804A0DC @ =gSprites\n"
                    "\tldr r1, [sp, 0x6C]\n"
                    "\tlsls r0, r1, 1\n"
                    "\tadds r0, r1\n"
                    "\tlsls r0, 1\n"
                    "\tadd r0, r8\n"
                    "\tadds r1, r5, 0\n"
                    "\tadds r1, 0x34\n"
                    "\tadds r1, r0\n"
                    "\tldrb r1, [r1]\n"
                    "\tlsls r0, r1, 4\n"
                    "\tadds r0, r1\n"
                    "\tlsls r0, 2\n"
                    "\tadds r2, 0x1C\n"
                    "\tadds r0, r2\n"
                    "\tldr r1, [r0]\n"
                    "\tldr r0, _0804A0E0 @ =sub_809D62C\n"
                    "\tcmp r1, r0\n"
                    "\tbeq _0804A0D4\n"
                    "\tb _0804A294\n"
                    "_0804A0D4:\n"
                    "\tmovs r0, 0x3\n"
                    "\tstrb r0, [r3]\n"
                    "\tb _0804A294\n"
                    "\t.align 2, 0\n"
                    "_0804A0DC: .4byte gSprites\n"
                    "_0804A0E0: .4byte sub_809D62C\n"
                    "_0804A0E4:\n"
                    "\tadds r0, r5, 0\n"
                    "\tadds r0, 0xC8\n"
                    "\tldr r2, [sp, 0x6C]\n"
                    "\tlsls r1, r2, 4\n"
                    "\tsubs r1, r2\n"
                    "\tlsls r1, 24\n"
                    "\tlsrs r1, 24\n"
                    "\tldr r3, _0804A228 @ =gTradeMovesBoxTilemap\n"
                    "\tmovs r2, 0xF\n"
                    "\tstr r2, [sp]\n"
                    "\tmovs r7, 0x11\n"
                    "\tstr r7, [sp, 0x4]\n"
                    "\tmovs r5, 0\n"
                    "\tstr r5, [sp, 0x8]\n"
                    "\tmovs r2, 0\n"
                    "\tbl sub_804A96C_alt\n"
                    "\tldr r0, _0804A22C @ =gUnknown_03004824\n"
                    "\tldr r3, [r0]\n"
                    "\tldr r1, [sp, 0x6C]\n"
                    "\tlsls r6, r1, 1\n"
                    "\tadds r1, r6\n"
                    "\tmov r9, r1\n"
                    "\tlsls r1, 1\n"
                    "\tmov r2, r8\n"
                    "\tadds r0, r2, r1\n"
                    "\tadds r3, 0x34\n"
                    "\tadds r3, r0\n"
                    "\tldrb r0, [r3]\n"
                    "\tlsls r2, r0, 4\n"
                    "\tadds r2, r0\n"
                    "\tlsls r2, 2\n"
                    "\tldr r5, _0804A230 @ =gSprites\n"
                    "\tadds r2, r5\n"
                    "\tldr r4, _0804A234 @ =gTradeMonSpriteCoords\n"
                    "\tmov r0, r9\n"
                    "\tlsls r5, r0, 2\n"
                    "\tadds r0, r5, r4\n"
                    "\tldrb r0, [r0]\n"
                    "\tadds r1, 0x1\n"
                    "\tlsls r1, 1\n"
                    "\tadds r1, r4\n"
                    "\tldrb r1, [r1]\n"
                    "\tadds r0, r1\n"
                    "\tasrs r0, 1\n"
                    "\tlsls r0, 3\n"
                    "\tadds r0, 0xE\n"
                    "\tstrh r0, [r2, 0x20]\n"
                    "\tldrb r0, [r3]\n"
                    "\tlsls r1, r0, 4\n"
                    "\tadds r1, r0\n"
                    "\tlsls r1, 2\n"
                    "\tldr r2, _0804A230 @ =gSprites\n"
                    "\tadds r1, r2\n"
                    "\tadds r4, 0x1\n"
                    "\tadds r5, r4\n"
                    "\tldrb r0, [r5]\n"
                    "\tlsls r0, 3\n"
                    "\tsubs r0, 0xC\n"
                    "\tstrh r0, [r1, 0x22]\n"
                    "\tldrb r1, [r3]\n"
                    "\tlsls r0, r1, 4\n"
                    "\tadds r0, r1\n"
                    "\tlsls r0, 2\n"
                    "\tadds r0, r2\n"
                    "\tmovs r5, 0\n"
                    "\tstrh r5, [r0, 0x24]\n"
                    "\tldrb r1, [r3]\n"
                    "\tlsls r0, r1, 4\n"
                    "\tadds r0, r1\n"
                    "\tlsls r0, 2\n"
                    "\tadds r0, r2\n"
                    "\tstrh r5, [r0, 0x26]\n"
                    "\tmov r0, sp\n"
                    "\tadds r0, 0x12\n"
                    "\tldr r1, [sp, 0x6C]\n"
                    "\tmov r2, r8\n"
                    "\tbl sub_804A2B4\n"
                    "\tadd r1, sp, 0xC\n"
                    "\tmovs r3, 0xFC\n"
                    "\tstrb r3, [r1]\n"
                    "\tadds r2, r1, 0\n"
                    "\tmovs r1, 0x6\n"
                    "\tstrb r1, [r2, 0x1]\n"
                    "\tmovs r1, 0x4\n"
                    "\tstrb r1, [r2, 0x2]\n"
                    "\tadds r1, r2, 0\n"
                    "\tstrb r3, [r1, 0x3]\n"
                    "\tstrb r7, [r1, 0x4]\n"
                    "\tlsls r0, 24\n"
                    "\tasrs r0, 24\n"
                    "\tmovs r1, 0x40\n"
                    "\tsubs r1, r0\n"
                    "\tlsrs r0, r1, 31\n"
                    "\tadds r1, r0\n"
                    "\tasrs r1, 1\n"
                    "\tstrb r1, [r2, 0x5]\n"
                    "\tldr r0, _0804A22C @ =gUnknown_03004824\n"
                    "\tldr r1, [r0]\n"
                    "\tadds r0, r1, 0x4\n"
                    "\tadds r1, 0x7A\n"
                    "\tldrb r2, [r1]\n"
                    "\tmov r1, r9\n"
                    "\tlsls r1, 6\n"
                    "\tmov r9, r1\n"
                    "\tadd r2, r9\n"
                    "\tldr r4, _0804A238 @ =gUnknown_0820C334\n"
                    "\tldr r3, [sp, 0x6C]\n"
                    "\tlsls r1, r3, 2\n"
                    "\tadds r3, r1, r4\n"
                    "\tldrb r3, [r3]\n"
                    "\tldr r5, _0804A23C @ =gUnknown_0820C334 + 0x1\n"
                    "\tadds r1, r5\n"
                    "\tldrb r1, [r1]\n"
                    "\tstr r1, [sp]\n"
                    "\tadd r1, sp, 0xC\n"
                    "\tbl sub_8003460\n"
                    "\tadd r7, sp, 0x34\n"
                    "\tadds r0, r7, 0\n"
                    "\tldr r1, [sp, 0x6C]\n"
                    "\tmov r2, r8\n"
                    "\tbl sub_804A33C\n"
                    "\tldr r0, _0804A22C @ =gUnknown_03004824\n"
                    "\tldr r2, [r0]\n"
                    "\tadds r0, r2, 0x4\n"
                    "\tldr r1, _0804A240 @ =gOtherText_Terminator2\n"
                    "\tadds r2, 0x7A\n"
                    "\tldrb r2, [r2]\n"
                    "\tadd r2, r9\n"
                    "\tadds r2, 0x20\n"
                    "\tadds r6, 0x1\n"
                    "\tlsls r6, 1\n"
                    "\tadds r4, r6, r4\n"
                    "\tldrb r5, [r4]\n"
                    "\tldr r3, _0804A23C @ =gUnknown_0820C334 + 0x1\n"
                    "\tadds r6, r3\n"
                    "\tldrb r4, [r6]\n"
                    "\tadds r4, 0x1\n"
                    "\tlsls r4, 24\n"
                    "\tlsrs r4, 24\n"
                    "\tstr r4, [sp]\n"
                    "\tadds r3, r5, 0\n"
                    "\tbl sub_8003460\n"
                    "\tldr r0, _0804A22C @ =gUnknown_03004824\n"
                    "\tldr r1, [r0]\n"
                    "\tadds r0, r1, 0x4\n"
                    "\tadds r1, 0x7A\n"
                    "\tldrb r2, [r1]\n"
                    "\tadd r2, r9\n"
                    "\tadds r2, 0x26\n"
                    "\tstr r4, [sp]\n"
                    "\tadds r1, r7, 0\n"
                    "\tadds r3, r5, 0\n"
                    "\tbl sub_8003460\n"
                    "\tldr r2, _0804A22C @ =gUnknown_03004824\n"
                    "\tldr r1, [r2]\n"
                    "\tb _0804A28A\n"
                    "\t.align 2, 0\n"
                    "_0804A228: .4byte gTradeMovesBoxTilemap\n"
                    "_0804A22C: .4byte gUnknown_03004824\n"
                    "_0804A230: .4byte gSprites\n"
                    "_0804A234: .4byte gTradeMonSpriteCoords\n"
                    "_0804A238: .4byte gUnknown_0820C334\n"
                    "_0804A23C: .4byte gUnknown_0820C334 + 0x1\n"
                    "_0804A240: .4byte gOtherText_Terminator2\n"
                    "_0804A244:\n"
                    "\tldr r0, _0804A2A4 @ =gUnknown_0820C14C\n"
                    "\tldr r0, [r0, 0x14]\n"
                    "\tadds r1, r5, 0\n"
                    "\tadds r1, 0x7E\n"
                    "\tldrh r1, [r1]\n"
                    "\tlsls r1, 5\n"
                    "\tldr r3, _0804A2A8 @ =0x06010000\n"
                    "\tadds r1, r3\n"
                    "\tmovs r2, 0x14\n"
                    "\tbl sub_804ACD8\n"
                    "\tldr r0, _0804A2AC @ =gUnknown_0820C3D1\n"
                    "\tmov r5, r10\n"
                    "\tlsls r1, r5, 1\n"
                    "\tadds r4, r1, r0\n"
                    "\tldrb r2, [r4]\n"
                    "\tadds r2, 0x4\n"
                    "\tlsls r2, 24\n"
                    "\tlsrs r2, 24\n"
                    "\tadds r0, 0x1\n"
                    "\tadds r1, r0\n"
                    "\tldrb r3, [r1]\n"
                    "\tadds r3, 0x1\n"
                    "\tlsls r3, 24\n"
                    "\tlsrs r3, 24\n"
                    "\tldrb r0, [r4]\n"
                    "\tstr r0, [sp]\n"
                    "\tldrb r0, [r1]\n"
                    "\tstr r0, [sp, 0x4]\n"
                    "\tmov r0, r10\n"
                    "\tmov r1, r8\n"
                    "\tbl sub_804A51C\n"
                    "\tldr r0, _0804A2B0 @ =gUnknown_03004824\n"
                    "\tldr r1, [r0]\n"
                    "_0804A28A:\n"
                    "\tadds r1, 0x80\n"
                    "\tadd r1, r10\n"
                    "\tldrb r0, [r1]\n"
                    "\tadds r0, 0x1\n"
                    "\tstrb r0, [r1]\n"
                    "_0804A294:\n"
                    "\tadd sp, 0x74\n"
                    "\tpop {r3-r5}\n"
                    "\tmov r8, r3\n"
                    "\tmov r9, r4\n"
                    "\tmov r10, r5\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r0}\n"
                    "\tbx r0\n"
                    "\t.align 2, 0\n"
                    "_0804A2A4: .4byte gUnknown_0820C14C\n"
                    "_0804A2A8: .4byte 0x06010000\n"
                    "_0804A2AC: .4byte gUnknown_0820C3D1\n"
                    "_0804A2B0: .4byte gUnknown_03004824");
}
#endif

u8 sub_804A2B4(u8 *a0, u8 whichParty, u8 whichPokemon)
{
    u8 string[11];
    if (whichParty == 0)
    {
        GetMonData(&gPlayerParty[whichPokemon], MON_DATA_NICKNAME, string);
        StringCopy10(a0, string);
        GetMonGender(&gPlayerParty[whichPokemon]);
        GetMonData(&gPlayerParty[whichPokemon], MON_DATA_LEVEL);
    }
    else
    {
        GetMonData(&gEnemyParty[whichPokemon], MON_DATA_NICKNAME, string);
        StringCopy10(a0, string);
        GetMonGender(&gEnemyParty[whichPokemon]);
        GetMonData(&gEnemyParty[whichPokemon], MON_DATA_LEVEL);
    }
    return GetStringWidthGivenWindowConfig(&gWindowConfig_81E7294, a0);
}

#ifdef NONMATCHING
static
#endif
void sub_804A33C(u8 *a0, u8 whichParty, u8 whichPokemon)
{
    u16 i;
    u16 moves[4];
    if (gUnknown_03004824->unk_005d[whichParty][whichPokemon] == 0)
    {
        for (i = 0; i < 4; i ++)
        {
            if (whichParty == 0)
                moves[i] = GetMonData(&gPlayerParty[whichPokemon], MON_DATA_MOVE1 + i, NULL);
            else
                moves[i] = GetMonData(&gEnemyParty[whichPokemon], MON_DATA_MOVE1 + i, NULL);
        }
        StringCopy(a0, gOtherText_Terminator);
        for (i = 0; i < 4; i ++)
        {
            if (moves[i] != 0)
            {
                StringAppend(a0, gMoveNames[moves[i]]);
            }
            StringAppend(a0, gOtherText_ControlAndMiscText);
        }
    }
    else
    {
        StringCopy(a0, gOtherText_Terminator);
        StringAppend(a0, gOtherText_FourQuestions);
    }
}

#ifdef NONMATCHING
static void sub_804A41C(u8 whichParty)
{
    u8 i;
    u8 nickname[22];
    u8 string[40];
    struct Pokemon *pokemon;

    string[0] = 0xFC;
    string[1] = 0x06;
    string[2] = 0x04;
    string[3] = 0xFC;
    string[4] = 0x11;
    string[5] = 0x00;

    for (i = 0; i < gUnknown_03004824->partyCounts[whichParty]; i ++)
    {
        pokemon = whichParty == 0 ? &gPlayerParty[i] : &gEnemyParty[i];
        GetMonData(pokemon, MON_DATA_NICKNAME, nickname);
        StringCopy10(string + 6, nickname);
        GetMonGender(pokemon);
        string[5] = (50 - GetStringWidthGivenWindowConfig(&gWindowConfig_81E7294, string + 6)) / 2;
        sub_8003460(&gUnknown_03004824->window, string, gUnknown_03004824->unk_007a + 22 * 6 * whichParty + 22 * i, gTradeMonSpriteCoords[i + 6 * whichParty][0], gTradeMonSpriteCoords[i + 6 * whichParty][1]);
    }
}
#else
__attribute__((naked))
static void sub_804A41C(u8 whichParty)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tmov r7, r10\n"
                    "\tmov r6, r9\n"
                    "\tmov r5, r8\n"
                    "\tpush {r5-r7}\n"
                    "\tsub sp, 0x44\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r5, r0, 24\n"
                    "\tadd r3, sp, 0x1C\n"
                    "\tmovs r2, 0\n"
                    "\tmovs r1, 0xFC\n"
                    "\tstrb r1, [r3]\n"
                    "\tmovs r0, 0x6\n"
                    "\tstrb r0, [r3, 0x1]\n"
                    "\tmovs r0, 0x4\n"
                    "\tstrb r0, [r3, 0x2]\n"
                    "\tstrb r1, [r3, 0x3]\n"
                    "\tmovs r0, 0x11\n"
                    "\tstrb r0, [r3, 0x4]\n"
                    "\tstrb r2, [r3, 0x5]\n"
                    "\tmovs r6, 0\n"
                    "\tldr r1, _0804A470 @ =gUnknown_03004824\n"
                    "\tldr r0, [r1]\n"
                    "\tadds r0, 0x42\n"
                    "\tadds r0, r5\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r6, r0\n"
                    "\tbcs _0804A504\n"
                    "\tmov r8, r3\n"
                    "\tadds r7, r1, 0\n"
                    "\tldr r0, _0804A474 @ =gTradeMonSpriteCoords\n"
                    "\tmov r9, r0\n"
                    "\tmovs r4, 0x1\n"
                    "\tadd r4, r9\n"
                    "\tmov r10, r4\n"
                    "_0804A462:\n"
                    "\tcmp r5, 0\n"
                    "\tbne _0804A47C\n"
                    "\tmovs r0, 0x64\n"
                    "\tadds r4, r6, 0\n"
                    "\tmuls r4, r0\n"
                    "\tldr r0, _0804A478 @ =gPlayerParty\n"
                    "\tb _0804A484\n"
                    "\t.align 2, 0\n"
                    "_0804A470: .4byte gUnknown_03004824\n"
                    "_0804A474: .4byte gTradeMonSpriteCoords\n"
                    "_0804A478: .4byte gPlayerParty\n"
                    "_0804A47C:\n"
                    "\tmovs r0, 0x64\n"
                    "\tadds r4, r6, 0\n"
                    "\tmuls r4, r0\n"
                    "\tldr r0, _0804A514 @ =gEnemyParty\n"
                    "_0804A484:\n"
                    "\tadds r4, r0\n"
                    "\tadds r0, r4, 0\n"
                    "\tmovs r1, 0x2\n"
                    "\tadd r2, sp, 0x4\n"
                    "\tbl GetMonData\n"
                    "\tmov r0, sp\n"
                    "\tadds r0, 0x22\n"
                    "\tadd r1, sp, 0x4\n"
                    "\tbl StringCopy10\n"
                    "\tadds r0, r4, 0\n"
                    "\tbl GetMonGender\n"
                    "\tmov r1, sp\n"
                    "\tadds r1, 0x22\n"
                    "\tldr r0, _0804A518 @ =gWindowConfig_81E7294\n"
                    "\tbl GetStringWidthGivenWindowConfig\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tmovs r1, 0x32\n"
                    "\tsubs r1, r0\n"
                    "\tlsrs r0, r1, 31\n"
                    "\tadds r1, r0\n"
                    "\tasrs r1, 1\n"
                    "\tmov r0, r8\n"
                    "\tstrb r1, [r0, 0x5]\n"
                    "\tldr r1, [r7]\n"
                    "\tadds r0, r1, 0x4\n"
                    "\tadds r1, 0x7A\n"
                    "\tlsls r2, r5, 5\n"
                    "\tadds r2, r5\n"
                    "\tlsls r2, 2\n"
                    "\tldrb r1, [r1]\n"
                    "\tadds r2, r1\n"
                    "\tmovs r1, 0x16\n"
                    "\tmuls r1, r6\n"
                    "\tadds r2, r1\n"
                    "\tlsls r2, 16\n"
                    "\tlsrs r2, 16\n"
                    "\tlsls r1, r5, 1\n"
                    "\tadds r1, r5\n"
                    "\tlsls r1, 1\n"
                    "\tadds r1, r6, r1\n"
                    "\tlsls r1, 1\n"
                    "\tmov r4, r9\n"
                    "\tadds r3, r1, r4\n"
                    "\tldrb r3, [r3]\n"
                    "\tadd r1, r10\n"
                    "\tldrb r1, [r1]\n"
                    "\tstr r1, [sp]\n"
                    "\tmov r1, r8\n"
                    "\tbl sub_8003460\n"
                    "\tadds r0, r6, 0x1\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r6, r0, 24\n"
                    "\tldr r0, [r7]\n"
                    "\tadds r0, 0x42\n"
                    "\tadds r0, r5\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r6, r0\n"
                    "\tbcc _0804A462\n"
                    "_0804A504:\n"
                    "\tadd sp, 0x44\n"
                    "\tpop {r3-r5}\n"
                    "\tmov r8, r3\n"
                    "\tmov r9, r4\n"
                    "\tmov r10, r5\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r0}\n"
                    "\tbx r0\n"
                    "\t.align 2, 0\n"
                    "_0804A514: .4byte gEnemyParty\n"
                    "_0804A518: .4byte gWindowConfig_81E7294");
}
#endif

#ifdef NONMATCHING
static
#endif
void sub_804A51C(u8 a0, u8 a1, u8 a2, u8 a3, u8 a4, u8 a5)
{
    u8 nickname[24];
    u8 level;
    u8 gender;
    u8 lv_div_10;
    sub_804A96C(&gUnknown_03004824->unk_00c8, a4, a5, gTradeMonBoxTilemap, 6, 3, 0);
    if (a0 == 0)
    {
        level = GetMonData(&gPlayerParty[a1], MON_DATA_LEVEL, NULL);
        gender = GetMonGender(&gPlayerParty[a1]);
        GetMonData(&gPlayerParty[a1], MON_DATA_NICKNAME, nickname);
    }
    else
    {
        level = GetMonData(&gEnemyParty[a1], MON_DATA_LEVEL, NULL);
        gender = GetMonGender(&gEnemyParty[a1]);
        GetMonData(&gEnemyParty[a1], MON_DATA_NICKNAME, nickname);
    }
    if (gUnknown_03004824->unk_005d[a0][a1] == 0)
    {
        lv_div_10 = level / 10;
        if (lv_div_10 != 0)
        {
            gUnknown_03004824->unk_00c8.unk_12[a2 + 32 * a3] = lv_div_10 + 0x60;
        }
        gUnknown_03004824->unk_00c8.unk_12[a2 + 32 * a3 + 1] = (u8)(level % 10) + 0x70;
        if (gender == MON_MALE)
        {
            if (!NameHasGenderSymbol(nickname, MON_MALE))
            {
                gUnknown_03004824->unk_00c8.unk_12[a2 + 32 * a3 - 31] += 1;
            }
        }
        else if (gender == MON_FEMALE)
        {
            if (!NameHasGenderSymbol(nickname, MON_FEMALE))
            {
                gUnknown_03004824->unk_00c8.unk_12[a2 + 32 * a3 - 31] += 2;
            }
        }
    }
    else
    {
        gUnknown_03004824->unk_00c8.unk_12[a2 + 32 * a3 - 32] = gUnknown_03004824->unk_00c8.unk_12[a2 + 32 * a3 - 33];
        gUnknown_03004824->unk_00c8.unk_12[a2 + 32 * a3 - 31] = gUnknown_03004824->unk_00c8.unk_12[a2 + 32 * a3 - 36] | 0x400;
    }
#ifdef GERMAN
    gUnknown_03004824->unk_00c8.unk_10 = 1;
#endif
}

#ifdef NONMATCHING
static void sub_804A6DC(u8 whichParty)
{
    int i;
    for (i = 0; i < gUnknown_03004824->partyCounts[whichParty]; i ++)
    {
        sub_804A51C(whichParty, i, gTradeLevelDisplayCoords[whichParty][i][0], gTradeLevelDisplayCoords[whichParty][i][1], gTradeMonBoxCoords[whichParty][i][0], gTradeMonBoxCoords[whichParty][i][1]);
    }
}
#else
__attribute__((naked))
static void sub_804A6DC(u8 whichParty)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tsub sp, 0x8\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r6, r0, 24\n"
                    "\tmovs r7, 0\n"
                    "\tldr r0, _0804A734 @ =gUnknown_03004824\n"
                    "\tldr r0, [r0]\n"
                    "\tadds r0, 0x42\n"
                    "\tadds r0, r6\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r7, r0\n"
                    "\tbge _0804A72C\n"
                    "\tlsls r0, r6, 1\n"
                    "\tadds r0, r6\n"
                    "\tldr r1, _0804A738 @ =gTradeLevelDisplayCoords\n"
                    "\tlsls r0, 2\n"
                    "\tadds r5, r0, r1\n"
                    "\tldr r1, _0804A73C @ =gTradeMonBoxCoords\n"
                    "\tadds r4, r0, r1\n"
                    "_0804A702:\n"
                    "\tlsls r1, r7, 24\n"
                    "\tlsrs r1, 24\n"
                    "\tldrb r2, [r5]\n"
                    "\tldrb r3, [r5, 0x1]\n"
                    "\tldrb r0, [r4]\n"
                    "\tstr r0, [sp]\n"
                    "\tldrb r0, [r4, 0x1]\n"
                    "\tstr r0, [sp, 0x4]\n"
                    "\tadds r0, r6, 0\n"
                    "\tbl sub_804A51C\n"
                    "\tadds r5, 0x2\n"
                    "\tadds r4, 0x2\n"
                    "\tadds r7, 0x1\n"
                    "\tldr r0, _0804A734 @ =gUnknown_03004824\n"
                    "\tldr r0, [r0]\n"
                    "\tadds r0, 0x42\n"
                    "\tadds r0, r6\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r7, r0\n"
                    "\tblt _0804A702\n"
                    "_0804A72C:\n"
                    "\tadd sp, 0x8\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r0}\n"
                    "\tbx r0\n"
                    "\t.align 2, 0\n"
                    "_0804A734: .4byte gUnknown_03004824\n"
                    "_0804A738: .4byte gTradeLevelDisplayCoords\n"
                    "_0804A73C: .4byte gTradeMonBoxCoords");
}
#endif

void sub_804A740(u8 whichParty)
{
    int i;
    for (i = 0; i < gUnknown_03004824->partyCounts[whichParty]; i ++)
    {
        gSprites[gUnknown_03004824->partyIcons[whichParty][i]].invisible = FALSE;
        gSprites[gUnknown_03004824->partyIcons[whichParty][i]].pos1.x = gTradeMonSpriteCoords[6 * whichParty + i][0] * 8 + 14;
        gSprites[gUnknown_03004824->partyIcons[whichParty][i]].pos1.y = gTradeMonSpriteCoords[6 * whichParty + i][1] * 8 - 12;
        gSprites[gUnknown_03004824->partyIcons[whichParty][i]].pos2.x = 0;
        gSprites[gUnknown_03004824->partyIcons[whichParty][i]].pos2.y = 0;
    }
}

void sub_804A80C(void)
{
    FillWindowRect_DefaultPalette(&gUnknown_03004824->window, 0, gUnknown_0820C330[1][0], 0, gUnknown_0820C330[1][1], 19);
    sub_804A41C(1);
}

static void sub_804A840(u8 whichParty)
{
    if (whichParty == 0)
    {
        FillWindowRect_DefaultPalette(&gUnknown_03004824->window, 0, gUnknown_0820C330[0][0], 0, gUnknown_0820C330[0][1], 19);
        sub_804A96C_alt(&gUnknown_03004824->unk_00c8, 0, 0, gTradePartyBoxTilemap, 15, 17, 0);
        sub_804A6DC(0);
        sub_804A41C(0);
        sub_804A740(0);
        sub_804A938(&gUnknown_03004824->unk_00c8);
    }
    else
    {
        HandleDestroyMenuCursors();
        FillWindowRect_DefaultPalette(&gUnknown_03004824->window, 0, gUnknown_0820C330[1][0], 0, gUnknown_0820C330[1][1], 19);
        sub_804A96C_alt(&gUnknown_03004824->unk_00c8, 15, 0, gTradePartyBoxTilemap, 15, 17, 0);
        sub_804A6DC(1);
        sub_804A41C(1);
        sub_804A740(1);
        sub_804A938(&gUnknown_03004824->unk_00c8);
    }
    sub_804ACD8(gUnknown_0820C14C[1], (u8 *)(BG_CHAR_ADDR(4) + 32 * gUnknown_03004824->unk_007e), 20);
    gUnknown_03004824->unk_0080[whichParty] = 0;
}

static void sub_804A938(struct UnkStructD *unkStructD)
{
    unkStructD->unk_10 = 1;
}

void sub_804A940(struct UnkStructD *unkStructD)
{
    if (unkStructD->unk_10)
    {
        CpuCopy16(unkStructD->unk_12, unkStructD->vramAddr, sizeof(unkStructD->unk_12));
        unkStructD->unk_10 = 0;
    }
}

static void sub_804A964(struct UnkStructD *unkStructD, void *dest)
{
    unkStructD->unk_10 = 0;
    unkStructD->vramAddr = dest;
}

/*static*/ void sub_804A96C(struct UnkStructD *arg0, u8 left, u8 top, const u16 *tilemap, u8 width, u8 height, u16 sp8) {
    int y, x;

    for (y = 0; y < height; y++)
    {

        for (x = 0; x < width; x++)
        {
            arg0->unk_12[(top * 32 + left) + y * 32 + x] = tilemap[width * y + x] | sp8;
        }
    }

#if ENGLISH
    arg0->unk_10 = 1;
#endif
}

#if GERMAN
void sub_804A96C_alt(struct UnkStructD *arg0, u8 left, u8 top, const u16 *tilemap, u8 width, u8 height, u16 sp8) {
    sub_804A96C(arg0, left, top, tilemap, width, height, sp8);

    arg0->unk_10 = 1;
}
#endif

static void sub_804A9F4(u8 unused)
{
    MenuZeroFillScreen();
}

static void sub_804AA00(u8 unused)
{
    MenuZeroFillScreen();
}

/*static*/ void sub_804AA0C(u8 a0)
{
    DrawTextWindow(&gUnknown_03004824->window, gTradeMessageWindowRects[a0][0], gTradeMessageWindowRects[a0][1], gTradeMessageWindowRects[a0][2], gTradeMessageWindowRects[a0][3]);
    sub_8003460(&gUnknown_03004824->window, gUnknown_0820C2F0[a0], 0x180 + gUnknown_03004824->unk_007a, gTradeMessageWindowRects[a0][0] + 1, gTradeMessageWindowRects[a0][1] + 1);
}

static void sub_804AA88(void)
{
    int i;
    for (i = 0; i < 4; i ++)
    {
        gUnknown_03004824->unk_08dc[i].unk_00 = 0;
        gUnknown_03004824->unk_08dc[i].unk_02 = 0;
        gUnknown_03004824->unk_08dc[i].unk_04 |= 0xff;
    }
}

static void sub_804AADC(u16 a0, u8 a1)
{
    int i;
    for (i = 0; i < 4; i ++)
    {
        if (gUnknown_03004824->unk_08dc[i].unk_00 == 0)
        {
            gUnknown_03004824->unk_08dc[i].unk_02 = a0;
            gUnknown_03004824->unk_08dc[i].unk_04 = a1;
            gUnknown_03004824->unk_08dc[i].unk_00 = 1;
            break;
        }
    }
}

static void sub_804AB30(void)
{
    int i;
    for (i = 0; i < 4; i ++)
    {
        if (gUnknown_03004824->unk_08dc[i].unk_00)
        {
            if (gUnknown_03004824->unk_08dc[i].unk_02 != 0)
            {
                gUnknown_03004824->unk_08dc[i].unk_02 --;
                continue;
            }
            switch (gUnknown_03004824->unk_08dc[i].unk_04)
            {
                case 0:
                    Trade_SendData(gUnknown_03004824);
                    break;
                case 1:
                    sub_804AA0C(0);
                    break;
                case 2:
                    sub_804AA0C(2);
                    break;
                case 3:
                    sub_804AA0C(3);
                    break;
                case 4:
                    sub_804AA0C(3);
                    break;
                case 5:
                    sub_804AA0C(3);
                    break;
            }
            gUnknown_03004824->unk_08dc[i].unk_00 = 0;
        }
    }
}

static bool8 sub_804ABF8(void)
{
    switch (gUnknown_03004824->unk_00b4)
    {
        case  8:
            gUnknown_03004824->unk_007e = LoadSpriteSheet(&gUnknown_0820C07C[gUnknown_03004824->unk_00b4]);
            gUnknown_03004824->unk_00b4 ++;
            return FALSE;
        case 13:
            LoadSpritePalette(&gSpritePalette_TradeScreenText);
            gUnknown_03004824->unk_00b4 ++;
            return FALSE;
        case 14:
            LoadSpritePalette(&gUnknown_0820C12C);
            gUnknown_03004824->unk_00b4 ++;
            return FALSE;
        case 15:
            LoadSpriteSheet(&gUnknown_0820C124);
            gUnknown_03004824->unk_00b4 ++;
            // fallthrough
        case 16:
            gUnknown_03004824->unk_00b4 = 0;
            return TRUE;
        default:
            LoadSpriteSheet(&gUnknown_0820C07C[gUnknown_03004824->unk_00b4]);
            gUnknown_03004824->unk_00b4 ++;
            return FALSE;
    }
}

/*static*/ void sub_804ACD8(const u8 *src, u8 *dest, u8 a2)
{
    sub_804AFB8(&gWindowConfig_81E725C, dest, src, a2);
}

asm(".section .text.sub_804DAD4");

void sub_804B210(void);

void sub_804B228(void);

void sub_804B24C(void);

void sub_804B2D0(u8, u8);

#ifdef NONMATCHING
void sub_804B41C(void)
// Link trade init
{
    switch (gMain.state)
    {
        case 0:
            REG_DISPCNT = 0;
            ResetTasks();
            CloseLink();
            gUnknown_03004828 = &ewram_2010000.unk_0f000;
            ResetSpriteData();
            FreeAllSpritePalettes();
            SetVBlankCallback(sub_804B210);
            sub_804B228();
            SetUpWindowConfig(&gWindowConfig_81E6F84);
            InitWindowFromConfig(&gUnknown_03004828->window, &gWindowConfig_81E6F84);
            gUnknown_03004828->textWindowBaseTileNum = SetTextWindowBaseTileNum(2);
            LoadTextWindowGraphics(&gUnknown_03004828->window);
            MenuZeroFillScreen();
            gLinkType = 0x1144;
            gMain.state ++;
            LZDecompressVram(gUnknown_08D00000, (void *)VRAM);
            CpuCopy16(gUnknown_08D00524, ewram, 0x1000);
            DmaCopy16Defvars(3, ewram, (void *)BG_SCREEN_ADDR(5), 0x500);
            LoadCompressedPalette(gUnknown_08D004E0, 0, 32);
            gUnknown_03004828->unk_00b6 = 0;
            gUnknown_03004828->unk_00c4 = 0;
            gUnknown_03004828->isLinkTrade = TRUE;
            gUnknown_03004828->unk_0104 = 0x40;
            gUnknown_03004828->unk_0106 = 0x40;
            gUnknown_03004828->unk_0108 = 0;
            gUnknown_03004828->unk_010a = 0;
            gUnknown_03004828->unk_010c = 0x78;
            gUnknown_03004828->unk_010e = 0x50;
            gUnknown_03004828->unk_0118 = 0x100;
            gUnknown_03004828->unk_011c = 0;
            break;
        case 1:
            OpenLink();
            gMain.state ++;
            gUnknown_03004828->unk_00c0 = 0;
            break;
        case 2:
            if (++ gUnknown_03004828->unk_00c0 > 60)
            {
                gUnknown_03004828->unk_00c0 = 0;
                gMain.state ++;
            }
            break;
        case 3:
            if (IsLinkMaster())
            {
                if (GetLinkPlayerCount_2() >= sub_800820C() && ++ gUnknown_03004828->unk_00c0 > 30)
                {
                    sub_8007F4C();
                    gMain.state ++;
                }
            }
            else
            {
                gMain.state ++;
            }
            break;
        case 4:
            sub_804B24C();
            if (gReceivedRemoteLinkPlayers == TRUE && IsLinkPlayerDataExchangeComplete() == TRUE) gMain.state ++;
            break;
        case 5:
            gUnknown_03004828->unk_009c = 0;
            gUnknown_03004828->unk_009d = 0;
            gUnknown_03004828->unk_00bd = 0;
            sub_804B2D0(0, 0);
            gMain.state ++;
            break;
        case 6:
            sub_804B2D0(0, 1);
            gMain.state ++;
            break;
        case 7:
            sub_804B2D0(1, 0);
            gMain.state ++;
            break;
        case 8:
            sub_804B2D0(1, 1);
            gMain.state ++;
            break;
        case 9:
            sub_804C164();
            LoadSpriteSheet(&gUnknown_0821594C);
            LoadSpritePalette(&gUnknown_08215954);
            REG_BG1CNT = BGCNT_PRIORITY(2) | BGCNT_SCREENBASE(5);
            gMain.state ++;
            break;
        case 10:
            gMain.state ++;
            // fallthrough
        case 11:
            sub_804BBE8(5);
            sub_804BBE8(0);
            sub_804C1A8();
            BeginNormalPaletteFade(-1, 0, 16, 0, 0);
            gMain.state ++;
            break;
        case 12:
            if (!gPaletteFade.active)
            {
                SetMainCallback2(sub_804DB84);
            }
            break;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}
#else
__attribute__((naked)) void sub_804B41C(void)
{
    asm_unified("\tpush {r4-r6,lr}\n"
                    "\tsub sp, 0x4\n"
                    "\tldr r1, _0804B43C @ =gMain\n"
                    "\tldr r2, _0804B440 @ =0x0000043c\n"
                    "\tadds r0, r1, r2\n"
                    "\tldrb r0, [r0]\n"
                    "\tadds r2, r1, 0\n"
                    "\tcmp r0, 0xC\n"
                    "\tbls _0804B430\n"
                    "\tb _0804B76E_break\n"
                    "_0804B430:\n"
                    "\tlsls r0, 2\n"
                    "\tldr r1, _0804B444 @ =_0804B448\n"
                    "\tadds r0, r1\n"
                    "\tldr r0, [r0]\n"
                    "\tmov pc, r0\n"
                    "\t.align 2, 0\n"
                    "_0804B43C: .4byte gMain\n"
                    "_0804B440: .4byte 0x0000043c\n"
                    "_0804B444: .4byte _0804B448\n"
                    "\t.align 2, 0\n"
                    "_0804B448:\n"
                    "\t.4byte _0804B47C_case00\n"
                    "\t.4byte _0804B5AC_case01\n"
                    "\t.4byte _0804B5D4_case02\n"
                    "\t.4byte _0804B5FC_case03\n"
                    "\t.4byte _0804B648_case04\n"
                    "\t.4byte _0804B678_case05\n"
                    "\t.4byte _0804B6A8_case06\n"
                    "\t.4byte _0804B6B2_case07\n"
                    "\t.4byte _0804B6CC_case08\n"
                    "\t.4byte _0804B6E4_case09\n"
                    "\t.4byte _0804B71C_case10\n"
                    "\t.4byte _0804B726_case11\n"
                    "\t.4byte _0804B75C_case12\n"
                    "_0804B47C_case00:\n"
                    "\tmovs r1, 0x80\n"
                    "\tlsls r1, 19\n"
                    "\tmovs r0, 0\n"
                    "\tstrh r0, [r1]\n"
                    "\tbl ResetTasks\n"
                    "\tbl CloseLink\n"
                    "\tldr r6, _0804B570 @ =gUnknown_03004828\n"
                    "\tldr r5, _0804B574 @ =0x0201f000\n"
                    "\tstr r5, [r6]\n"
                    "\tbl ResetSpriteData\n"
                    "\tbl FreeAllSpritePalettes\n"
                    "\tldr r0, _0804B578 @ =sub_804B210\n"
                    "\tbl SetVBlankCallback\n"
                    "\tbl sub_804B228\n"
                    "\tldr r4, _0804B57C @ =gWindowConfig_81E6F84\n"
                    "\tadds r0, r4, 0\n"
                    "\tbl SetUpWindowConfig\n"
                    "\tldr r0, [r6]\n"
                    "\tadds r0, 0x4\n"
                    "\tadds r1, r4, 0\n"
                    "\tbl InitWindowFromConfig\n"
                    "\tmovs r0, 0x2\n"
                    "\tbl SetTextWindowBaseTileNum\n"
                    "\tldr r1, [r6]\n"
                    "\tadds r1, 0x34\n"
                    "\tstrb r0, [r1]\n"
                    "\tldr r0, [r6]\n"
                    "\tadds r0, 0x4\n"
                    "\tbl LoadTextWindowGraphics\n"
                    "\tbl MenuZeroFillScreen\n"
                    "\tldr r1, _0804B580 @ =gLinkType\n"
                    "\tldr r4, _0804B584 @ =0x00001144\n"
                    "\tadds r0, r4, 0\n"
                    "\tstrh r0, [r1]\n"
                    "\tldr r1, _0804B588 @ =gMain\n"
                    "\tldr r0, _0804B58C @ =0x0000043c\n"
                    "\tadds r1, r0\n"
                    "\tldrb r0, [r1]\n"
                    "\tadds r0, 0x1\n"
                    "\tstrb r0, [r1]\n"
                    "\tldr r0, _0804B590 @ =gUnknown_08D00000\n"
                    "\tmovs r1, 0xC0\n"
                    "\tlsls r1, 19\n"
                    "\tbl LZDecompressVram\n"
                    "\tldr r0, _0804B594 @ =gUnknown_08D00524\n"
                    "\tldr r1, _0804B598 @ =0xfffe1000\n"
                    "\tadds r5, r1\n"
                    "\tmovs r2, 0x80\n"
                    "\tlsls r2, 4\n"
                    "\tadds r1, r5, 0\n"
                    "\tbl CpuSet\n"
                    "\tldr r1, _0804B59C @ =0x06002800\n"
                    "\tldr r0, _0804B5A0 @ =0x040000d4\n"
                    "\tstr r5, [r0]\n"
                    "\tstr r1, [r0, 0x4]\n"
                    "\tldr r1, _0804B5A4 @ =0x80000280\n"
                    "\tstr r1, [r0, 0x8]\n"
                    "\tldr r0, [r0, 0x8]\n"
                    "\tldr r0, _0804B5A8 @ =gUnknown_08D004E0\n"
                    "\tmovs r1, 0\n"
                    "\tmovs r2, 0x20\n"
                    "\tbl LoadCompressedPalette\n"
                    "\tldr r1, [r6]\n"
                    "\tadds r0, r1, 0\n"
                    "\tadds r0, 0xB6\n"
                    "\tmovs r2, 0\n"
                    "\tstrh r2, [r0]\n"
                    "\tadds r0, 0xE\n"
                    "\tstrh r2, [r0]\n"
                    "\tmovs r4, 0x8F\n"
                    "\tlsls r4, 1\n"
                    "\tadds r1, r4\n"
                    "\tmovs r0, 0x1\n"
                    "\tstrb r0, [r1]\n"
                    "\tldr r3, [r6]\n"
                    "\tmovs r1, 0x82\n"
                    "\tlsls r1, 1\n"
                    "\tadds r0, r3, r1\n"
                    "\tmovs r1, 0x40\n"
                    "\tstrh r1, [r0]\n"
                    "\tsubs r4, 0x18\n"
                    "\tadds r0, r3, r4\n"
                    "\tstrh r1, [r0]\n"
                    "\tadds r1, 0xC8\n"
                    "\tadds r0, r3, r1\n"
                    "\tstrh r2, [r0]\n"
                    "\tadds r4, 0x4\n"
                    "\tadds r0, r3, r4\n"
                    "\tstrh r2, [r0]\n"
                    "\tmovs r0, 0x86\n"
                    "\tlsls r0, 1\n"
                    "\tadds r1, r3, r0\n"
                    "\tmovs r0, 0x78\n"
                    "\tstrh r0, [r1]\n"
                    "\tadds r4, 0x4\n"
                    "\tadds r1, r3, r4\n"
                    "\tmovs r0, 0x50\n"
                    "\tstrh r0, [r1]\n"
                    "\tadds r0, 0xC8\n"
                    "\tadds r1, r3, r0\n"
                    "\tsubs r0, 0x18\n"
                    "\tstrh r0, [r1]\n"
                    "\tmovs r1, 0x8E\n"
                    "\tlsls r1, 1\n"
                    "\tadds r0, r3, r1\n"
                    "\tstrh r2, [r0]\n"
                    "\tb _0804B76E_break\n"
                    "\t.align 2, 0\n"
                    "_0804B570: .4byte gUnknown_03004828\n"
                    "_0804B574: .4byte 0x0201f000\n"
                    "_0804B578: .4byte sub_804B210\n"
                    "_0804B57C: .4byte gWindowConfig_81E6F84\n"
                    "_0804B580: .4byte gLinkType\n"
                    "_0804B584: .4byte 0x00001144\n"
                    "_0804B588: .4byte gMain\n"
                    "_0804B58C: .4byte 0x0000043c\n"
                    "_0804B590: .4byte gUnknown_08D00000\n"
                    "_0804B594: .4byte gUnknown_08D00524\n"
                    "_0804B598: .4byte 0xfffe1000\n"
                    "_0804B59C: .4byte 0x06002800\n"
                    "_0804B5A0: .4byte 0x040000d4\n"
                    "_0804B5A4: .4byte 0x80000280\n"
                    "_0804B5A8: .4byte gUnknown_08D004E0\n"
                    "_0804B5AC_case01:\n"
                    "\tbl OpenLink\n"
                    "\tldr r1, _0804B5C8 @ =gMain\n"
                    "\tldr r2, _0804B5CC @ =0x0000043c\n"
                    "\tadds r1, r2\n"
                    "\tldrb r0, [r1]\n"
                    "\tadds r0, 0x1\n"
                    "\tmovs r2, 0\n"
                    "\tstrb r0, [r1]\n"
                    "\tldr r0, _0804B5D0 @ =gUnknown_03004828\n"
                    "\tldr r0, [r0]\n"
                    "\tadds r0, 0xC0\n"
                    "\tstr r2, [r0]\n"
                    "\tb _0804B76E_break\n"
                    "\t.align 2, 0\n"
                    "_0804B5C8: .4byte gMain\n"
                    "_0804B5CC: .4byte 0x0000043c\n"
                    "_0804B5D0: .4byte gUnknown_03004828\n"
                    "_0804B5D4_case02:\n"
                    "\tldr r0, _0804B5F4 @ =gUnknown_03004828\n"
                    "\tldr r0, [r0]\n"
                    "\tadds r1, r0, 0\n"
                    "\tadds r1, 0xC0\n"
                    "\tldr r0, [r1]\n"
                    "\tadds r0, 0x1\n"
                    "\tstr r0, [r1]\n"
                    "\tcmp r0, 0x3C\n"
                    "\tbhi _0804B5E8\n"
                    "\tb _0804B76E_break\n"
                    "_0804B5E8:\n"
                    "\tmovs r0, 0\n"
                    "\tstr r0, [r1]\n"
                    "\tldr r4, _0804B5F8 @ =0x0000043c\n"
                    "\tadds r1, r2, r4\n"
                    "\tb _0804B74C\n"
                    "\t.align 2, 0\n"
                    "_0804B5F4: .4byte gUnknown_03004828\n"
                    "_0804B5F8: .4byte 0x0000043c\n"
                    "_0804B5FC_case03:\n"
                    "\tbl IsLinkMaster\n"
                    "\tlsls r0, 24\n"
                    "\tcmp r0, 0\n"
                    "\tbne _0804B608\n"
                    "\tb _0804B746\n"
                    "_0804B608:\n"
                    "\tbl GetLinkPlayerCount_2\n"
                    "\tadds r4, r0, 0\n"
                    "\tbl sub_800820C\n"
                    "\tlsls r4, 24\n"
                    "\tlsls r0, 24\n"
                    "\tcmp r4, r0\n"
                    "\tbcs _0804B61C\n"
                    "\tb _0804B76E_break\n"
                    "_0804B61C:\n"
                    "\tldr r0, _0804B63C @ =gUnknown_03004828\n"
                    "\tldr r1, [r0]\n"
                    "\tadds r1, 0xC0\n"
                    "\tldr r0, [r1]\n"
                    "\tadds r0, 0x1\n"
                    "\tstr r0, [r1]\n"
                    "\tcmp r0, 0x1E\n"
                    "\tbhi _0804B62E\n"
                    "\tb _0804B76E_break\n"
                    "_0804B62E:\n"
                    "\tbl sub_8007F4C\n"
                    "\tldr r1, _0804B640 @ =gMain\n"
                    "\tldr r0, _0804B644 @ =0x0000043c\n"
                    "\tadds r1, r0\n"
                    "\tb _0804B74C\n"
                    "\t.align 2, 0\n"
                    "_0804B63C: .4byte gUnknown_03004828\n"
                    "_0804B640: .4byte gMain\n"
                    "_0804B644: .4byte 0x0000043c\n"
                    "_0804B648_case04:\n"
                    "\tbl sub_804B24C\n"
                    "\tldr r0, _0804B66C @ =gReceivedRemoteLinkPlayers\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r0, 0x1\n"
                    "\tbeq _0804B656\n"
                    "\tb _0804B76E_break\n"
                    "_0804B656:\n"
                    "\tbl IsLinkPlayerDataExchangeComplete\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tcmp r0, 0x1\n"
                    "\tbeq _0804B664\n"
                    "\tb _0804B76E_break\n"
                    "_0804B664:\n"
                    "\tldr r1, _0804B670 @ =gMain\n"
                    "\tldr r4, _0804B674 @ =0x0000043c\n"
                    "\tadds r1, r4\n"
                    "\tb _0804B74C\n"
                    "\t.align 2, 0\n"
                    "_0804B66C: .4byte gReceivedRemoteLinkPlayers\n"
                    "_0804B670: .4byte gMain\n"
                    "_0804B674: .4byte 0x0000043c\n"
                    "_0804B678_case05:\n"
                    "\tldr r2, _0804B69C @ =gUnknown_03004828\n"
                    "\tldr r0, [r2]\n"
                    "\tadds r0, 0x9C\n"
                    "\tmovs r1, 0\n"
                    "\tstrb r1, [r0]\n"
                    "\tldr r0, [r2]\n"
                    "\tadds r0, 0x9D\n"
                    "\tstrb r1, [r0]\n"
                    "\tldr r0, [r2]\n"
                    "\tadds r0, 0xBD\n"
                    "\tstrb r1, [r0]\n"
                    "\tmovs r0, 0\n"
                    "\tbl sub_804B2D0\n"
                    "\tldr r1, _0804B6A0 @ =gMain\n"
                    "\tldr r0, _0804B6A4 @ =0x0000043c\n"
                    "\tadds r1, r0\n"
                    "\tb _0804B74C\n"
                    "\t.align 2, 0\n"
                    "_0804B69C: .4byte gUnknown_03004828\n"
                    "_0804B6A0: .4byte gMain\n"
                    "_0804B6A4: .4byte 0x0000043c\n"
                    "_0804B6A8_case06:\n"
                    "\tmovs r0, 0\n"
                    "\tmovs r1, 0x1\n"
                    "\tbl sub_804B2D0\n"
                    "\tb _0804B746\n"
                    "_0804B6B2_case07:\n"
                    "\tmovs r0, 0x1\n"
                    "\tmovs r1, 0\n"
                    "\tbl sub_804B2D0\n"
                    "\tldr r1, _0804B6C4 @ =gMain\n"
                    "\tldr r4, _0804B6C8 @ =0x0000043c\n"
                    "\tadds r1, r4\n"
                    "\tb _0804B74C\n"
                    "\t.align 2, 0\n"
                    "_0804B6C4: .4byte gMain\n"
                    "_0804B6C8: .4byte 0x0000043c\n"
                    "_0804B6CC_case08:\n"
                    "\tmovs r0, 0x1\n"
                    "\tmovs r1, 0x1\n"
                    "\tbl sub_804B2D0\n"
                    "\tldr r1, _0804B6DC @ =gMain\n"
                    "\tldr r0, _0804B6E0 @ =0x0000043c\n"
                    "\tadds r1, r0\n"
                    "\tb _0804B74C\n"
                    "\t.align 2, 0\n"
                    "_0804B6DC: .4byte gMain\n"
                    "_0804B6E0: .4byte 0x0000043c\n"
                    "_0804B6E4_case09:\n"
                    "\tbl sub_804C164\n"
                    "\tldr r0, _0804B704 @ =gUnknown_0821594C\n"
                    "\tbl LoadSpriteSheet\n"
                    "\tldr r0, _0804B708 @ =gUnknown_08215954\n"
                    "\tbl LoadSpritePalette\n"
                    "\tldr r1, _0804B70C @ =REG_BG1CNT\n"
                    "\tldr r2, _0804B710 @ =0x00000502\n"
                    "\tadds r0, r2, 0\n"
                    "\tstrh r0, [r1]\n"
                    "\tldr r1, _0804B714 @ =gMain\n"
                    "\tldr r4, _0804B718 @ =0x0000043c\n"
                    "\tadds r1, r4\n"
                    "\tb _0804B74C\n"
                    "\t.align 2, 0\n"
                    "_0804B704: .4byte gUnknown_0821594C\n"
                    "_0804B708: .4byte gUnknown_08215954\n"
                    "_0804B70C: .4byte REG_BG1CNT\n"
                    "_0804B710: .4byte 0x00000502\n"
                    "_0804B714: .4byte gMain\n"
                    "_0804B718: .4byte 0x0000043c\n"
                    "_0804B71C_case10:\n"
                    "\tldr r0, _0804B754 @ =0x0000043c\n"
                    "\tadds r1, r2, r0\n"
                    "\tldrb r0, [r1]\n"
                    "\tadds r0, 0x1\n"
                    "\tstrb r0, [r1]\n"
                    "_0804B726_case11:\n"
                    "\tmovs r0, 0x5\n"
                    "\tbl sub_804BBE8\n"
                    "\tmovs r0, 0\n"
                    "\tbl sub_804BBE8\n"
                    "\tbl sub_804C1A8\n"
                    "\tmovs r0, 0x1\n"
                    "\tnegs r0, r0\n"
                    "\tmovs r1, 0\n"
                    "\tstr r1, [sp]\n"
                    "\tmovs r2, 0x10\n"
                    "\tmovs r3, 0\n"
                    "\tbl BeginNormalPaletteFade\n"
                    "_0804B746:\n"
                    "\tldr r1, _0804B758 @ =gMain\n"
                    "\tldr r2, _0804B754 @ =0x0000043c\n"
                    "\tadds r1, r2\n"
                    "_0804B74C:\n"
                    "\tldrb r0, [r1]\n"
                    "\tadds r0, 0x1\n"
                    "\tstrb r0, [r1]\n"
                    "\tb _0804B76E_break\n"
                    "\t.align 2, 0\n"
                    "_0804B754: .4byte 0x0000043c\n"
                    "_0804B758: .4byte gMain\n"
                    "_0804B75C_case12:\n"
                    "\tldr r0, _0804B788 @ =gPaletteFade\n"
                    "\tldrb r1, [r0, 0x7]\n"
                    "\tmovs r0, 0x80\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbne _0804B76E_break\n"
                    "\tldr r0, _0804B78C @ =sub_804DB84\n"
                    "\tbl SetMainCallback2\n"
                    "_0804B76E_break:\n"
                    "\tbl RunTasks\n"
                    "\tbl AnimateSprites\n"
                    "\tbl BuildOamBuffer\n"
                    "\tbl UpdatePaletteFade\n"
                    "\tadd sp, 0x4\n"
                    "\tpop {r4-r6}\n"
                    "\tpop {r0}\n"
                    "\tbx r0\n"
                    "\t.align 2, 0\n"
                    "_0804B788: .4byte gPaletteFade\n"
                    "_0804B78C: .4byte sub_804DB84");
}
#endif

void sub_804B790(void)
// In-game trade init
{
    u8 otName[11];
    switch (gMain.state)
    {
        case 0:
            gUnknown_020297D8[0] = gSpecialVar_0x8005;
            gUnknown_020297D8[1] = 6;
            StringCopy(gLinkPlayers[0].name, gSaveBlock2.playerName);
            GetMonData(&gEnemyParty[0], MON_DATA_OT_NAME, otName);
            StringCopy(gLinkPlayers[1].name, otName);
            REG_DISPCNT = 0;
            ResetTasks();
            gUnknown_03004828 = &ewram_2010000.unk_0f000;
            ResetSpriteData();
            FreeAllSpritePalettes();
            SetVBlankCallback(sub_804B210);
            sub_804B228();
            SetUpWindowConfig(&gWindowConfig_81E717C);
            InitWindowFromConfig(&gUnknown_03004828->window, &gWindowConfig_81E717C);
            gUnknown_03004828->textWindowBaseTileNum = SetTextWindowBaseTileNum(2);
            LoadTextWindowGraphics(&gUnknown_03004828->window);
            MenuZeroFillScreen();
            gLinkType = 0x1144;
            gUnknown_03004828->isLinkTrade = FALSE;
            gUnknown_03004828->unk_00b6 = 0;
            gUnknown_03004828->unk_00c4 = 0;
            gUnknown_03004828->unk_0104 = 0x40;
            gUnknown_03004828->unk_0106 = 0x40;
            gUnknown_03004828->unk_0108 = 0;
            gUnknown_03004828->unk_010a = 0;
            gUnknown_03004828->unk_010c = 0x78;
            gUnknown_03004828->unk_010e = 0x50;
            gUnknown_03004828->unk_0118 = 0x100;
            gUnknown_03004828->unk_011c = 0;
            gUnknown_03004828->unk_00c0 = 0;
            gMain.state = 5;
            break;
        case 5:
            sub_804B2D0(0, 0);
            gMain.state ++;
            break;
        case 6:
            sub_804B2D0(0, 1);
            gMain.state ++;
            break;
        case 7:
            sub_804B2D0(1, 0);
            gMain.state ++;
            break;
        case 8:
            sub_804B2D0(1, 1);
            gMain.state ++;
            break;
        case 9:
            sub_804C164();
            LoadSpriteSheet(&gUnknown_0821594C);
            LoadSpritePalette(&gUnknown_08215954);
            REG_BG1CNT = BGCNT_PRIORITY(2) | BGCNT_SCREENBASE(5);
            gMain.state ++;
            break;
        case 10:
            gMain.state ++;
            // fallthrough
        case 11:
            sub_804BBE8(5);
            sub_804BBE8(0);
            sub_804C1A8();
            BeginNormalPaletteFade(-1, 0, 16, 0, 0);
            gMain.state ++;
            break;
        case 12:
            if (!gPaletteFade.active)
            {
                SetMainCallback2(sub_804BBCC);
            }
            break;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_804BA18(u8 partyIdx)
{
    struct Pokemon *pokemon = &gPlayerParty[partyIdx];
    if (!GetMonData(pokemon, MON_DATA_IS_EGG))
    {
        u16 species = SpeciesToNationalPokedexNum(GetMonData(pokemon, MON_DATA_SPECIES, NULL));
        GetNationalPokedexFlag(species, 2);
        GetNationalPokedexFlag(species, 3);
    }
}

static void sub_804BA64(void)
{
    u8 mpId = GetMultiplayerId();
    if (gLinkPlayers[mpId ^ 1].lp_field_2 == 0x8000)
        EnableNationalPokedex();
}

void sub_804BA94(u8 a0, u8 a1)
{
    u8 friendship;
    struct Pokemon *playerPokemon = &gPlayerParty[a0];
    u16 playerMail = GetMonData(playerPokemon, MON_DATA_MAIL);

    struct Pokemon *friendPokemon = &gEnemyParty[a1];
    u16 friendMail = GetMonData(friendPokemon, MON_DATA_MAIL);

    if (playerMail != 0xff)
        ClearMailStruct(&gSaveBlock1.mail[playerMail]);

    // This is where the actual trade happens!!
    gUnknown_03004828->pokemon = *playerPokemon;
    *playerPokemon = *friendPokemon;
    *friendPokemon = gUnknown_03004828->pokemon;

    friendship = 70;
    if (!GetMonData(playerPokemon, MON_DATA_IS_EGG))
        SetMonData(playerPokemon, MON_DATA_FRIENDSHIP, &friendship);

    if (friendMail != 0xff)
        GiveMailToMon2(playerPokemon, &gUnknown_02029700[friendMail]);

    sub_804BA18(a0);
    if (gReceivedRemoteLinkPlayers)
        sub_804BA64();
}

void sub_804BB78(void)
{
    switch (gUnknown_03004828->unk_00bd)
    {
        case 1:
            if (sub_8007ECC())
            {
                Trade_SendData(gUnknown_03004828);
                gUnknown_03004828->unk_00bd ++;
            }
            // fallthrough
        case 2:
            gUnknown_03004828->unk_00bd = 0;
            break;
    }
}

void sub_804BBCC(void)
{
    sub_804C29C();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_804BBE8(u8 a0)
{
    int i;
    u16 *buffer;
    switch (a0)
    {
        case 0:
            LoadPalette(gUnknown_0820C9F8, 0x10, 0xa0);
            DmaCopyLarge16(3, gUnknown_0820CA98, (void *)BG_CHAR_ADDR(1), 0x1300, 0x1000);
            DmaCopy16Defvars(3, gUnknown_0820F798, (void *)BG_SCREEN_ADDR(18), 0x1000);
            gUnknown_03004828->unk_0114 = 0;
            gUnknown_03004828->unk_0116 = 0xb4;
            REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
            REG_BG2CNT = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(18) | BGCNT_TXT512x256;
            break;
        case 1:
            gUnknown_03004828->unk_0112 = 0;
            gUnknown_03004828->unk_0110 = 0x15c;
            REG_BG1VOFS = 0x15c;
            REG_BG1CNT = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(5) | BGCNT_TXT256x512;

            DmaCopy16Defvars(3, gUnknown_08210798, (void *)BG_SCREEN_ADDR(5), 0x1000);
            DmaCopyLarge16(3, gUnknown_0820CA98, (void *)BG_CHAR_ADDR(0), 0x1300, 0x1000);
            REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_OBJ_ON;
            break;
        case 2:
            gUnknown_03004828->unk_0110 = 0;
            gUnknown_03004828->unk_0112 = 0;
            REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_OBJ_ON;
            DmaCopy16Defvars(3, gUnknown_08211798, (void *)BG_SCREEN_ADDR(5), 0x800);
            break;
        case 3:
            REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_OBJ_ON;
            gUnknown_03004828->unk_0104 = 0x40;
            gUnknown_03004828->unk_0106 = 0x40;
            gUnknown_03004828->unk_010c = 0x78;
            gUnknown_03004828->unk_010e = -0x46;
            gUnknown_03004828->unk_011c = 0;
            DmaCopyLarge16(3, gUnknown_0820DD98, (void *)BG_CHAR_ADDR(1), 0x1a00, 0x1000);
            DmaCopy16Defvars(3, gUnknown_08211F98, (void *)BG_SCREEN_ADDR(18), 0x100);
            break;
        case 4:
            REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
            REG_BG2CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_256COLOR | BGCNT_SCREENBASE(18);
            gUnknown_03004828->unk_0104 = 0x40;
            gUnknown_03004828->unk_0106 = 0x5c;
            gUnknown_03004828->unk_0118 = 0x20;
            gUnknown_03004828->unk_011a = 0x400;
            gUnknown_03004828->unk_011c = 0;
            DmaCopyLarge16(3, gUnknown_08213738, (void *)BG_CHAR_ADDR(1), 0x2040, 0x1000);
            DmaCopy16Defvars(3, gUnknown_08215778, (void *)BG_SCREEN_ADDR(18), 0x100);
            break;
        case 5:
            gUnknown_03004828->unk_0110 = 0;
            gUnknown_03004828->unk_0112 = 0;
            REG_BG1CNT = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(5);
            LZDecompressVram(gUnknown_08D00000, (void *)BG_CHAR_ADDR(0));
            CpuCopy16(gUnknown_08D00524, buffer = (u16 *)ewram, 0x1000);
            LoadCompressedPalette(gUnknown_08D004E0, 0x70, 0x20);
            FillPalette(0, 0, 2);
            for (i = 0; i < 0x280; i ++)
                buffer[i] |= 0x7000;
            DmaCopy16Defvars(3, ewram, (void *)BG_SCREEN_ADDR(5), 0x500);
            MenuZeroFillWindowRect(2, 15, 27, 18);
            break;
        case 6:
            REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
            REG_BG2CNT = BGCNT_PRIORITY(3) | BGCNT_CHARBASE(1) | BGCNT_256COLOR | BGCNT_SCREENBASE(18);
            gUnknown_03004828->unk_0104 = 0x40;
            gUnknown_03004828->unk_0106 = 0x5c;
            gUnknown_03004828->unk_0118 = 0x100;
            gUnknown_03004828->unk_011a = 0x80;
            gUnknown_03004828->unk_010c = 0x78;
            gUnknown_03004828->unk_010e = 0x50;
            gUnknown_03004828->unk_011c = 0;
            DmaCopyLarge16(3, gUnknown_08213738, (void *)BG_CHAR_ADDR(1), 0x2040, 0x1000);
            DmaCopy16Defvars(3, gUnknown_08215778, (void *)BG_SCREEN_ADDR(18), 0x100);
            break;
        case 7:
            gUnknown_03004828->unk_0114 = 0;
            gUnknown_03004828->unk_0116 = 0;
            REG_BG2CNT = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(18) | BGCNT_TXT512x256;
            LoadPalette(gUnknown_0820C9F8, 0x10, 0xa0);
            DmaCopyLarge16(3, gUnknown_0820CA98, (void *)BG_CHAR_ADDR(1), 0x1300, 0x1000);
            DmaCopy16Defvars(3, gUnknown_0820F798, (void *)BG_SCREEN_ADDR(18), 0x1000);
            break;
    }
}

void sub_804C0F8(u8 a0)
{
    if (a0 == 0)
    {
        if (gUnknown_03004828->unk_0110 < 0x10a)
        {
            gUnknown_03004828->unk_010e ++;
            gUnknown_03004828->unk_011c += 64;
        }
    }
    else
    {
        if (gUnknown_03004828->unk_010e > -0x40)
        {
            gUnknown_03004828->unk_010e --;
            gUnknown_03004828->unk_011c += 64;
        }
    }
}

void sub_804C164(void)
{
    LoadSpriteSheet(&gUnknown_082159A4);
    LoadSpriteSheet(&gUnknown_082159F4);
    LoadSpriteSheet(&gUnknown_08215A28);
    LoadSpriteSheet(&gUnknown_08215A78);
    LoadSpritePalette(&gUnknown_082159AC);
    LoadSpritePalette(&gUnknown_082159B4);
}

void sub_804C1A8(void)
{
    u8 mpId;
    u8 string[20];
    const struct InGameTrade *ingameTrade;
    if (gUnknown_03004828->isLinkTrade)
    {
        mpId = GetMultiplayerId();
        StringCopy(gStringVar1, gLinkPlayers[mpId ^ 1].name);
        GetMonData(&gEnemyParty[gUnknown_020297D8[1] % 6], MON_DATA_NICKNAME, string);
        StringCopy10(gStringVar3, string);
        GetMonData(&gPlayerParty[gUnknown_020297D8[0]], MON_DATA_NICKNAME, string);
        StringCopy10(gStringVar2, string);
    }
    else
    {
        ingameTrade = &gIngameTrades[gSpecialVar_0x8004];
        StringCopy(gStringVar1, ingameTrade->otName);
        StringCopy10(gStringVar3, ingameTrade->name);
        GetMonData(&gPlayerParty[gSpecialVar_0x8005], MON_DATA_NICKNAME, string);
        StringCopy10(gStringVar2, string);
    }
}

bool8 sub_804C29C(void)
{
    u16 evoTarget;

    switch (gUnknown_03004828->unk_00c4)
    {
        case 0:
            gSprites[gUnknown_03004828->unk_00b8].invisible = FALSE;
            gSprites[gUnknown_03004828->unk_00b8].pos2.x = -0xb4;
            gSprites[gUnknown_03004828->unk_00b8].pos2.y = gMonFrontPicCoords[gUnknown_03004828->unk_0120].y_offset;
            gUnknown_03004828->unk_00c4 ++;
            gUnknown_03004828->unk_0124 = GetCurrentMapMusic();
            PlayBGM(BGM_SHINKA);
            break;
        case 1:
            if (gUnknown_03004828->unk_0116 > 0)
            {
                gSprites[gUnknown_03004828->unk_00b8].pos2.x += 3;
                gUnknown_03004828->unk_0116 -= 3;
            }
            else
            {
                gSprites[gUnknown_03004828->unk_00b8].pos2.x = 0;
                gUnknown_03004828->unk_0116 = 0;
                gUnknown_03004828->unk_00c4 = 10;
            }
            break;

        case 10:
            StringExpandPlaceholders(gStringVar4, gTradeText_WillBeSent);
            sub_8003460(&gUnknown_03004828->window, gStringVar4, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
            gUnknown_03004828->unk_00c4 = 11;
            gUnknown_03004828->unk_00c0 = 0;
            break;
        case 11:
            if (++gUnknown_03004828->unk_00c0 == 80)
            {
                gUnknown_03004828->unk_0102 = sub_8047580(gUnknown_03004828->unk_00b8, gSprites[gUnknown_03004828->unk_00b8].oam.paletteNum, 0x78, 0x20, 0x2, 0x1, 0x14, 0xfffff);
                gUnknown_03004828->unk_00c4 ++;
                ZeroFillWindowRect(&gUnknown_03004828->window, 0, 0, 29, 19);
                StringExpandPlaceholders(gStringVar4, gTradeText_ByeBye);
                sub_8003460(&gUnknown_03004828->window, gStringVar4, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
            }
            break;
        case 12:
            if (gSprites[gUnknown_03004828->unk_0102].callback == SpriteCallbackDummy && sub_80035AC(&gUnknown_03004828->window) == TRUE)
            {
                gUnknown_03004828->unk_0103 = CreateSprite(&gSpriteTemplate_821595C, 0x78, 0x20, 0);
                gSprites[gUnknown_03004828->unk_0103].callback = sub_804D738;
                DestroySprite(&gSprites[gUnknown_03004828->unk_0102]);
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 13:
            // The game waits here for the sprite to finish its animation sequence.
            break;
        case 14:
            BeginNormalPaletteFade(-1, 0, 0, 16, 0);
            gUnknown_03004828->unk_00c4 = 20;
            break;

        case 20:
            if (!gPaletteFade.active)
            {
                sub_804BBE8(4);
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 21:
            BeginNormalPaletteFade(-1, -1, 16, 0, 0);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 22:
            if (!gPaletteFade.active)
            {
                gUnknown_03004828->unk_00c4 = 23;
            }
            break;
        case 23:
            if (gUnknown_03004828->unk_011a > 0x100)
            {
                gUnknown_03004828->unk_011a -= 0x34;
            }
            else
            {
                sub_804BBE8(1);
                gUnknown_03004828->unk_011a = 0x80;
                gUnknown_03004828->unk_00c4 ++;
                gUnknown_03004828->unk_00c0 = 0;
            }
            gUnknown_03004828->unk_0118 = 0x8000 / gUnknown_03004828->unk_011a;
            break;
        case 24:
            if (++ gUnknown_03004828->unk_00c0 > 20)
            {
                sub_804BBE8(3);
                sub_804B128();
                gUnknown_03004828->unk_00bb = CreateSprite(&gSpriteTemplate_8215A80, 0x78, 0x50, 0);
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 25:
            if (gSprites[gUnknown_03004828->unk_00bb].animEnded)
            {
                DestroySprite(&gSprites[gUnknown_03004828->unk_00bb]);
                REG_BLDCNT = 0x640;
                REG_BLDALPHA = 0x40C;
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 26:
            if (-- gUnknown_03004828->unk_0110 == 0x13C)
            {
                gUnknown_03004828->unk_00c4 ++;
            }
            if (gUnknown_03004828->unk_0110 == 0x148)
            {
                gUnknown_03004828->unk_00bc = CreateSprite(&gSpriteTemplate_8215A30, 0x80, 0x41, 0);
            }
            break;
        case 27:
            gUnknown_03004828->unk_00ba = CreateSprite(&gSpriteTemplate_82159BC, 0x80, 0x50, 3);
            gUnknown_03004828->unk_00bb = CreateSprite(&gSpriteTemplate_82159FC, 0x80, 0x50, 0);
            StartSpriteAnim(&gSprites[gUnknown_03004828->unk_00bb], 1);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 28:
            if ((gUnknown_03004828->unk_0110 -= 2) == 0xA6)
            {
                gUnknown_03004828->unk_00c4 = 200;
            }
            sub_804C0F8(0);
            REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
            break;
        case 200:
            gSprites[gUnknown_03004828->unk_00ba].pos1.y -= 2;
            gSprites[gUnknown_03004828->unk_00bb].pos1.y -= 2;
            sub_804C0F8(0);
            if (gSprites[gUnknown_03004828->unk_00ba].pos1.y < -8)
            {
                gUnknown_03004828->unk_00c4 = 29;
            }
            break;
        case 29:
            BeginNormalPaletteFade(-1, -1, 0, 16, 0);
            gUnknown_03004828->unk_00c4 = 30;
            break;
        case 30:
            if (!gPaletteFade.active)
            {
                DestroySprite(&gSprites[gUnknown_03004828->unk_00ba]);
                DestroySprite(&gSprites[gUnknown_03004828->unk_00bb]);
                sub_804BBE8(2);
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 31:
            BeginNormalPaletteFade(-1, -1, 16, 0, 0);
            gUnknown_03004828->unk_00ba = CreateSprite(&gSpriteTemplate_82159FC, 0x6f, 0xaa, 0);
            gUnknown_03004828->unk_00bb = CreateSprite(&gSpriteTemplate_82159FC, 0x81, -0xa, 0);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 32:
            if (!gPaletteFade.active)
            {
                PlaySE(SE_TK_WARPOUT);
                gUnknown_03004828->unk_00c4 ++;
            }
            gSprites[gUnknown_03004828->unk_00ba].pos2.y -= 3;
            gSprites[gUnknown_03004828->unk_00bb].pos2.y += 3;
            break;
        case 33:
            gSprites[gUnknown_03004828->unk_00ba].pos2.y -= 3;
            gSprites[gUnknown_03004828->unk_00bb].pos2.y += 3;
            if (gSprites[gUnknown_03004828->unk_00ba].pos2.y <= -0x5a)
            {
                gSprites[gUnknown_03004828->unk_00ba].data1 = 1;
                gSprites[gUnknown_03004828->unk_00bb].data1 = 1;
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 34:
            BlendPalettes(1, 16, 0xffff);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 35:
            BlendPalettes(1,  0, 0xffff);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 36:
            BlendPalettes(1, 16, 0xffff);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 37:
            if (!sub_8040A3C(gUnknown_03004828->unk_0120))
            {
                gSprites[gUnknown_03004828->unk_00b8].affineAnims = gSpriteAffineAnimTable_8215AC0;
                gSprites[gUnknown_03004828->unk_00b8].oam.affineMode = 3;
                CalcCenterToCornerVec(&gSprites[gUnknown_03004828->unk_00b8], 0, 3, 3);
                StartSpriteAffineAnim(&gSprites[gUnknown_03004828->unk_00b8], 0);
            }
            else
            {
                StartSpriteAffineAnim(&gSprites[gUnknown_03004828->unk_00b8], 0);
            }
            StartSpriteAffineAnim(&gSprites[gUnknown_03004828->unk_00b9], 0);
            gSprites[gUnknown_03004828->unk_00b8].pos1.x = 0x3c;
            gSprites[gUnknown_03004828->unk_00b9].pos1.x = 0xb4;
            gSprites[gUnknown_03004828->unk_00b8].pos1.y = 0xc0;
            gSprites[gUnknown_03004828->unk_00b9].pos1.y = -0x20;
            gSprites[gUnknown_03004828->unk_00b8].invisible = FALSE;
            gSprites[gUnknown_03004828->unk_00b9].invisible = FALSE;
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 38:
            gSprites[gUnknown_03004828->unk_00b8].pos2.y -= 3;
            gSprites[gUnknown_03004828->unk_00b9].pos2.y += 3;
            if (-0xa0 > gSprites[gUnknown_03004828->unk_00b8].pos2.y && gSprites[gUnknown_03004828->unk_00b8].pos2.y >= -0xa3)
            {
                PlaySE(SE_TK_WARPIN);
            }
            if (gSprites[gUnknown_03004828->unk_00b8].pos2.y < -0xde)
            {
                gSprites[gUnknown_03004828->unk_00ba].data1 = 0;
                gSprites[gUnknown_03004828->unk_00bb].data1 = 0;
                gUnknown_03004828->unk_00c4 ++;
                gSprites[gUnknown_03004828->unk_00b8].invisible = TRUE;
                gSprites[gUnknown_03004828->unk_00b9].invisible = TRUE;
                BlendPalettes(1,  0, 0xffff);
            }
            break;
        case 39:
            gSprites[gUnknown_03004828->unk_00ba].pos2.y -= 3;
            gSprites[gUnknown_03004828->unk_00bb].pos2.y += 3;
            if (gSprites[gUnknown_03004828->unk_00ba].pos2.y <= -0xde)
            {
                BeginNormalPaletteFade(-1, -1, 0, 16, 0);
                gUnknown_03004828->unk_00c4 ++;
                DestroySprite(&gSprites[gUnknown_03004828->unk_00ba]);
                DestroySprite(&gSprites[gUnknown_03004828->unk_00bb]);
            }
            break;
        case 40:
            if (!gPaletteFade.active)
            {
                gUnknown_03004828->unk_00c4 ++;
                sub_804BBE8(1);
                gUnknown_03004828->unk_0110 = 0xa6;
                gUnknown_03004828->unk_00ba = CreateSprite(&gSpriteTemplate_82159BC, 0x80, -0x14, 3);
                gUnknown_03004828->unk_00bb = CreateSprite(&gSpriteTemplate_82159FC, 0x80, -0x14, 0);
                StartSpriteAnim(&gSprites[gUnknown_03004828->unk_00bb], 1);
            }
            break;
        case 41:
            BeginNormalPaletteFade(-1, -1, 16, 0, 0);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 42:
            REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
            sub_804C0F8(1);
            if (!gPaletteFade.active)
            {
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 43:
            sub_804C0F8(1);
            gSprites[gUnknown_03004828->unk_00ba].pos2.y += 3;
            gSprites[gUnknown_03004828->unk_00bb].pos2.y += 3;
            if (gSprites[gUnknown_03004828->unk_00ba].pos2.y + gSprites[gUnknown_03004828->unk_00ba].pos1.y == 64)
            {
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 44:
            sub_804C0F8(1);
            if ((gUnknown_03004828->unk_0110 += 2) > 0x13c)
            {
                gUnknown_03004828->unk_0110 = 0x13c;
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 45:
            DestroySprite(&gSprites[gUnknown_03004828->unk_00ba]);
            DestroySprite(&gSprites[gUnknown_03004828->unk_00bb]);
            gUnknown_03004828->unk_00c4 ++;
            gUnknown_03004828->unk_00c0 = 0;
            break;
        case 46:
            if (++ gUnknown_03004828->unk_00c0 == 10)
            {
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 47:
            if (++ gUnknown_03004828->unk_0110 > 0x15c)
            {
                gUnknown_03004828->unk_0110 = 0x15c;
                gUnknown_03004828->unk_00c4 ++;
            }
            if (gUnknown_03004828->unk_0110 == 0x148)
                gUnknown_03004828->unk_00bc = CreateSprite(&gSpriteTemplate_8215A30, 0x80, 0x41, 0);
            gSprites[gUnknown_03004828->unk_00bc].callback = sub_804B0E0;
            break;
        case 48:
            gUnknown_03004828->unk_00bb = CreateSprite(&gSpriteTemplate_8215A80, 0x78, 0x50, 0);
            gUnknown_03004828->unk_00c4 = 50;
            break;

        case 50:
            if (gSprites[gUnknown_03004828->unk_00bb].animEnded)
            {
                DestroySprite(&gSprites[gUnknown_03004828->unk_00bb]);
                sub_804BBE8(6);
                gUnknown_03004828->unk_00c4 ++;
                PlaySE(SE_W028);
            }
            break;
        case 51:
            if (gUnknown_03004828->unk_011a < 0x400)
            {
                gUnknown_03004828->unk_011a += 0x34;
            }
            else
            {
                gUnknown_03004828->unk_011a = 0x400;
                gUnknown_03004828->unk_00c4 ++;
            }
            gUnknown_03004828->unk_0118 = 0x8000 / gUnknown_03004828->unk_011a;
            break;
        case 52:
            BeginNormalPaletteFade(-1, 0, 0, 16, 0);
            gUnknown_03004828->unk_00c4 = 60;
            break;

        case 60:
            if (!gPaletteFade.active)
            {
                sub_804BBE8(5);
                sub_804BBE8(7);
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 61:
            BeginNormalPaletteFade(-1, 0, 16, 0, 0);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 62:
            REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
            if (!gPaletteFade.active)
            {
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 63:
            gUnknown_03004828->unk_0103 = CreateSprite(&gSpriteTemplate_821595C, 0x78, -0x8, 0);
            gSprites[gUnknown_03004828->unk_0103].data3 = 0x4a;
            gSprites[gUnknown_03004828->unk_0103].callback = sub_804D80C;
            StartSpriteAnim(&gSprites[gUnknown_03004828->unk_0103], 1);
            StartSpriteAffineAnim(&gSprites[gUnknown_03004828->unk_0103], 2);
            BlendPalettes(1 << (16 + gSprites[gUnknown_03004828->unk_0103].oam.paletteNum), 16, 0xffff);
            gUnknown_03004828->unk_00c4 ++;
            gUnknown_03004828->unk_00c0 = 0;
            break;
        case 64:
            BeginNormalPaletteFade(1 << (16 + gSprites[gUnknown_03004828->unk_0103].oam.paletteNum), 1, 16, 0, 0xffff);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 65:
            if (gSprites[gUnknown_03004828->unk_0103].callback == SpriteCallbackDummy)
            {
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 66:
            gSprites[gUnknown_03004828->unk_00b9].pos1.x = 0x78;
            gSprites[gUnknown_03004828->unk_00b9].pos1.y = gMonFrontPicCoords[gUnknown_03004828->unk_0122].y_offset + 60;
            gSprites[gUnknown_03004828->unk_00b9].pos2.x = 0;
            gSprites[gUnknown_03004828->unk_00b9].pos2.y = 0;
            CreatePokeballSprite(gUnknown_03004828->unk_00b9, gSprites[gUnknown_03004828->unk_00b9].oam.paletteNum, 0x78, 0x54, 2, 1, 0x14, 0xfffff);
            FreeSpriteOamMatrix(&gSprites[gUnknown_03004828->unk_0103]);
            DestroySprite(&gSprites[gUnknown_03004828->unk_0103]);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 67:
            REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
            ZeroFillWindowRect(&gUnknown_03004828->window, 0, 0, 29, 19);
            StringExpandPlaceholders(gStringVar4, gTradeText_SentOverPoke);
            sub_8003460(&gUnknown_03004828->window, gStringVar4, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
            gUnknown_03004828->unk_00c4 ++;
            gUnknown_03004828->unk_00c0 = 0;
            break;
        case 68:
            if (++ gUnknown_03004828->unk_00c0 == 4)
            {
                PlayFanfare(BGM_FANFA5);
            }
            if (gUnknown_03004828->unk_00c0 == 0xf0)
            {
                gUnknown_03004828->unk_00c4 ++;
                ZeroFillWindowRect(&gUnknown_03004828->window, 0, 0, 29, 19);
                StringExpandPlaceholders(gStringVar4, gTradeText_TakeGoodCare);
                sub_8003460(&gUnknown_03004828->window, gStringVar4, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
                gUnknown_03004828->unk_00c0 = 0;
            }
            break;
        case 69: // OneHand
            if (++ gUnknown_03004828->unk_00c0 == 60)
            {
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 70:
            sub_804E1DC();
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 71:
            if (gUnknown_03004828->isLinkTrade)
            {
                return TRUE;
            }
            else if (gMain.newKeys & A_BUTTON)
            {
                gUnknown_03004828->unk_00c4 ++;
            }
            break;
        case 72: // Only if in-game trade
            sub_804BA94(gSpecialVar_0x8005, 0);
            gUnknown_03005E94 = sub_804BBCC;
            evoTarget = GetEvolutionTargetSpecies(&gPlayerParty[gUnknown_020297D8[0]], TRUE, ITEM_NONE);
            if (evoTarget != SPECIES_NONE)
                TradeEvolutionScene(&gPlayerParty[gUnknown_020297D8[0]], evoTarget, gUnknown_03004828->unk_00b9, gUnknown_020297D8[0]);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 73:
            BeginNormalPaletteFade(-1, 0, 0, 16, 0);
            gUnknown_03004828->unk_00c4 ++;
            break;
        case 74:
            if (!gPaletteFade.active)
            {
                PlayBGM(gUnknown_03004828->unk_0124);
                SetMainCallback2(c2_exit_to_overworld_2_switch);
                sub_804D8E4();
            }
            break;
    }
    return FALSE;
}

void sub_804D588(void)
{
    u16 evoTarget;
    switch (gMain.state)
    {
        case 0:
            gMain.state = 4;
            gSoftResetDisabled = TRUE;
            break;
        case 4:
            gUnknown_03005E94 = sub_804DC88;
            evoTarget = GetEvolutionTargetSpecies(&gPlayerParty[gUnknown_020297D8[0]], TRUE, ITEM_NONE);
            if (evoTarget != SPECIES_NONE)
                TradeEvolutionScene(&gPlayerParty[gUnknown_020297D8[0]], evoTarget, gUnknown_03004828->unk_00b9, gUnknown_020297D8[0]);
            else
                SetMainCallback2(sub_804DC88);
            gUnknown_020297D8[0] = 255;
            break;
    }
    if (!HasLinkErrorOccurred())
        RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_804D63C(void)
{
    u8 blockReceivedStatus;
    sub_804B2B0();
    blockReceivedStatus = GetBlockReceivedStatus();
    if (blockReceivedStatus & 0x01)
    {
        if (gBlockRecvBuffer[0][0] == 0xdcba)
        {
            SetMainCallback2(sub_804D588);
        }
        if (gBlockRecvBuffer[0][0] == 0xabcd)
        {
            gUnknown_03004828->unk_009c = 1;
        }
        ResetBlockReceivedFlag(0);
    }
    if (blockReceivedStatus & 0x02)
    {
        if (gBlockRecvBuffer[1][0] == 0xabcd)
        {
            gUnknown_03004828->unk_009d = 1;
        }
        ResetBlockReceivedFlag(1);
    }
}

void sub_804D6BC(struct Sprite *sprite)
{
    sprite->pos1.y += sprite->data0 / 10;
    sprite->data5 += sprite->data1;
    sprite->pos1.x = sprite->data5 / 10;
    if (sprite->pos1.y > 0x4c)
    {
        sprite->pos1.y = 0x4c;
        sprite->data0 = -(sprite->data0 * sprite->data2) / 100;
        sprite->data3 ++;
    }
    if (sprite->pos1.x == 0x78)
        sprite->data1 = 0;
    sprite->data0 += sprite->data4;
    if (sprite->data3 == 4)
    {
        sprite->data7 = 1;
        sprite->callback = SpriteCallbackDummy;
    }
}

void sub_804D738(struct Sprite *sprite)
{
    sprite->pos2.y += gTradeBallVerticalVelocityTable[sprite->data0];
    if (sprite->data0 == 22)
        PlaySE(SE_KON);
    if (++ sprite->data0 == 44)
    {
        PlaySE(SE_W025);
        sprite->callback = sub_804D7AC;
        sprite->data0 = 0;
        BeginNormalPaletteFade(1 << (16 + sprite->oam.paletteNum), -1, 0, 16, -1);
    }
}

void sub_804D7AC(struct Sprite *sprite)
{
    if (sprite->data1 == 20)
        StartSpriteAffineAnim(sprite, 1);
    if (++ sprite->data1 > 20)
    {
        sprite->pos2.y -= gTradeBallVerticalVelocityTable[sprite->data0];
        if (++ sprite->data0 == 23)
        {
            DestroySprite(sprite);
            gUnknown_03004828->unk_00c4 = 14; // Resume the master trade animation
        }
    }
}

void sub_804D80C(struct Sprite *sprite)
{
    if (sprite->data2 == 0)
    {
        if ((sprite->pos1.y += 4) > sprite->data3)
        {
            sprite->data2 ++;
            sprite->data0 = 0x16;
            PlaySE(SE_KON);
        }
    }
    else
    {
        if (sprite->data0 == 0x42)
            PlaySE(SE_KON2);
        if (sprite->data0 == 0x5c)
            PlaySE(SE_KON3);
        if (sprite->data0 == 0x6b)
            PlaySE(SE_KON4);
        sprite->pos2.y += gTradeBallVerticalVelocityTable[sprite->data0];
        if (++sprite->data0 == 0x6c)
            sprite->callback = SpriteCallbackDummy;
    }
}

u16 sub_804D89C(void)
{
    const struct InGameTrade *inGameTrade = &gIngameTrades[gSpecialVar_0x8004];
    StringCopy(gStringVar1, gSpeciesNames[inGameTrade->playerSpecies]);
    StringCopy(gStringVar2, gSpeciesNames[inGameTrade->species]);
    return inGameTrade->playerSpecies;
}

/*static*/ void sub_804D8E4(void)
{
    u8 nickname[32];
    const struct InGameTrade *inGameTrade = &gIngameTrades[gSpecialVar_0x8004];
    GetMonData(&gPlayerParty[gSpecialVar_0x8005], MON_DATA_NICKNAME, nickname);
    StringCopy10(gStringVar1, nickname);
    StringCopy(gStringVar2, gSpeciesNames[inGameTrade->species]);
}

static void sub_804D948(u8 whichPlayerMon, u8 whichInGameTrade)
{
    const struct InGameTrade *inGameTrade = &gIngameTrades[whichInGameTrade];
    u8 level = GetMonData(&gPlayerParty[whichPlayerMon], MON_DATA_LEVEL);

    struct MailStruct mail;
    u8 metLocation = 0xFE;
    u8 isMail;
    u8 *item;
    struct Pokemon *pokemon = &gEnemyParty[0];

    CreateMon(pokemon, inGameTrade->species, level, 32, TRUE, inGameTrade->personality, TRUE, inGameTrade->otId);

    SetMonData(pokemon, MON_DATA_HP_IV, &inGameTrade->ivs[0]);
    SetMonData(pokemon, MON_DATA_ATK_IV, &inGameTrade->ivs[1]);
    SetMonData(pokemon, MON_DATA_DEF_IV, &inGameTrade->ivs[2]);
    SetMonData(pokemon, MON_DATA_SPD_IV, &inGameTrade->ivs[3]);
    SetMonData(pokemon, MON_DATA_SPATK_IV, &inGameTrade->ivs[4]);
    SetMonData(pokemon, MON_DATA_SPDEF_IV, &inGameTrade->ivs[5]);
    SetMonData(pokemon, MON_DATA_NICKNAME, inGameTrade->name);
    SetMonData(pokemon, MON_DATA_OT_NAME, inGameTrade->otName);
    SetMonData(pokemon, MON_DATA_OT_GENDER, &inGameTrade->otGender);
    SetMonData(pokemon, MON_DATA_ALT_ABILITY, &inGameTrade->secondAbility);
    SetMonData(pokemon, MON_DATA_BEAUTY, &inGameTrade->stats[1]);
    SetMonData(pokemon, MON_DATA_CUTE, &inGameTrade->stats[2]);
    SetMonData(pokemon, MON_DATA_COOL, &inGameTrade->stats[0]);
    SetMonData(pokemon, MON_DATA_SMART, &inGameTrade->stats[3]);
    SetMonData(pokemon, MON_DATA_TOUGH, &inGameTrade->stats[4]);
    SetMonData(pokemon, MON_DATA_SHEEN, &inGameTrade->sheen);
    SetMonData(pokemon, MON_DATA_MET_LOCATION, &metLocation);

    isMail = FALSE;
    if (inGameTrade->heldItem != ITEM_NONE)
    {
        if (ItemIsMail(inGameTrade->heldItem))
        {
            sub_804DAD4(&mail, inGameTrade);
            gUnknown_02029700[0] = mail;
            SetMonData(pokemon, MON_DATA_MAIL, &isMail);
            SetMonData(pokemon, MON_DATA_HELD_ITEM, (u8 *)&inGameTrade->heldItem);
        }
        else
        {
            item = (u8 *)&inGameTrade->heldItem;
            SetMonData(pokemon, MON_DATA_HELD_ITEM, item);
        }
    }
    CalculateMonStats(&gEnemyParty[0]);
}

static void sub_804DAD4(struct MailStruct *mail, const struct InGameTrade *trade) {
    s32 i;

    for (i = 0; i < 9; i++)
    {
        mail->words[i] = gIngameTradeMail[trade->mailNum][i];
    }

    StringCopy(mail->playerName, trade->otName);

#if GERMAN
    PadNameString(mail->string, CHAR_SPACE);
#endif

    mail->trainerId[0] = trade->otId >> 24;
    mail->trainerId[1] = trade->otId >> 16;
    mail->trainerId[2] = trade->otId >> 8;
    mail->trainerId[3] = trade->otId;
    mail->species = trade->species;
    mail->itemId = trade->heldItem;
}

u16 sub_804DB2C(void)
{
    if (GetMonData(&gPlayerParty[gSpecialVar_0x8005], MON_DATA_IS_EGG))
        return SPECIES_NONE;
    return GetMonData(&gPlayerParty[gSpecialVar_0x8005], MON_DATA_SPECIES);
}

void sub_804DB68(void)
{
    sub_804D948(gSpecialVar_0x8005, gSpecialVar_0x8004);
}

void sub_804DB84(void)
{
    if (sub_804C29C() == TRUE)
    {
        DestroySprite(&gSprites[gUnknown_03004828->unk_00b8]);
        FreeSpriteOamMatrix(&gSprites[gUnknown_03004828->unk_00b9]);
        sub_804BA94(gUnknown_020297D8[0], gUnknown_020297D8[1] % 6);
        gUnknown_03004828->linkData[0] = 0xabcd;
        gUnknown_03004828->unk_00bd = 1;
        SetMainCallback2(sub_804DC18);
    }
    sub_804BB78();
    sub_804D63C();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_804DC18(void)
{
    u8 flag = sub_804B2B0();
    sub_804D63C();
    if (!flag && gUnknown_03004828->unk_009c == 1 && gUnknown_03004828->unk_009d == 1)
    {
        gUnknown_03004828->linkData[0] = 0xdcba;
        Trade_SendData(gUnknown_03004828);
        gUnknown_03004828->unk_009c = 2;
        gUnknown_03004828->unk_009d = 2;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_804DC88(void)
{
    switch (gMain.state)
    {
        case 0:
            gUnknown_03004828 = &ewram_2010000.unk_0f000;
            gMain.state ++;
            ZeroFillWindowRect(&gUnknown_03004828->window, 0, 0, 29, 19);
            StringExpandPlaceholders(gStringVar4, gOtherText_LinkStandby2);
            sub_8003460(&gUnknown_03004828->window, gStringVar4, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
            break;
        case 1:
            sub_80084A4();
            gMain.state = 100;
            gUnknown_03004828->unk_00c0 = 0;
            break;
        case 100:
            if (++ gUnknown_03004828->unk_00c0 > 180)
            {
                gMain.state = 101;
                gUnknown_03004828->unk_00c0 = 0;
            }
            if (sub_8007ECC())
            {
                gMain.state = 2;
            }
            break;
        case 101:
            if (sub_8007ECC())
            {
                gMain.state = 2;
            }
            break;
        case 2:
            gMain.state = 50;
            ZeroFillWindowRect(&gUnknown_03004828->window, 0, 0, 29, 19);
            sub_8003460(&gUnknown_03004828->window, gSystemText_Saving, gUnknown_03004828->textWindowBaseTileNum, 2, 15);
            break;
        case 50:
            SetSecretBase2Field_9_AndHideBG();
            IncrementGameStat(GAME_STAT_POKEMON_TRADES);
            sub_8125D80();
            gMain.state ++;
            gUnknown_03004828->unk_00c0 = 0;
            break;
        case 51:
            if (++ gUnknown_03004828->unk_00c0 == 5)
            {
                gMain.state ++;
            }
            break;
        case 52:
            if (sub_8125DA8())
            {
                ClearSecretBase2Field_9_2();
                gMain.state = 4;
            }
            else
            {
                gUnknown_03004828->unk_00c0 = 0;
                gMain.state = 51;
            }
            break;
        case 4:
            sub_8125DDC();
            gMain.state = 40;
            gUnknown_03004828->unk_00c0 = 0;
            break;
        case 40:
            if (++ gUnknown_03004828->unk_00c0 > 50)
            {
                gUnknown_03004828->unk_00c0 = 0;
                gMain.state = 41;
            }
            break;
        case 41:
            sub_80084A4();
            gMain.state = 42;
            break;
        case 42:
            if (sub_8007ECC())
            {
                sub_8125E04();
                gSoftResetDisabled = FALSE;
                gMain.state = 5;
            }
            break;
        case 5:
            if (++ gUnknown_03004828->unk_00c0 > 60)
            {
                gMain.state ++;
                sub_80084A4();
            }
            break;
        case 6:
            if (sub_8007ECC())
            {
                BeginNormalPaletteFade(-1, 0, 0, 16, 0);
                gMain.state ++;
            }
            break;
        case 7:
            if (!gPaletteFade.active)
            {
                FadeOutBGM(3);
                gMain.state ++;
            }
            break;
        case 8:
            if (IsBGMStopped() == TRUE)
            {
                sub_800832C();
                gMain.state ++;
            }
            break;
        case 9:
            if (!gReceivedRemoteLinkPlayers)
            {
                SetMainCallback2(sub_804E144);
            }
            break;
    }
    if (!HasLinkErrorOccurred())
    {
        RunTasks();
    }
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void sub_804E144(void)
{
    if (!gPaletteFade.active)
        SetMainCallback2((sub_8047CD8));
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_804E174(void)
{
    ScriptContext2_Enable();
    CreateTask(sub_804E1A0, 10);
    BeginNormalPaletteFade(-1, 0, 0, 16, 0);
}

static void sub_804E1A0(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(sub_804B790);
        gFieldCallback = sub_8080990;
        DestroyTask(taskId);
    }
}

/*static*/ void sub_804E1DC(void)
{
    u8 i;
    u8 numRibbons = 0;
    for (i = 0; i < 12; i ++)
    {
        numRibbons += GetMonData(&gEnemyParty[gUnknown_020297D8[1] % 6], MON_DATA_CHAMPION_RIBBON + i);
    }
    if (numRibbons != 0)
        FlagSet(SYS_RIBBON_GET);
}

void sub_804E22C(void)
{
    const u16 *src;
    u16 *dest;
    LZDecompressVram(gUnknown_08D00000, (u8 *)VRAM);
    CpuCopy16(gUnknown_08D00524, ewram, 0x1000);
    src = (const u16 *)ewram;
    dest = (u16 *)(BG_SCREEN_ADDR(5));
    DmaCopy16(3, src, dest, 0x500)
    LoadCompressedPalette(gUnknown_08D004E0, 0, 32);
    REG_BG1CNT = BGCNT_PRIORITY(2) | BGCNT_SCREENBASE(5);
}
