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

struct TradeEwramStruct {
    /*0x00000*/ u8 filler_00000[0xd000];
    /*0x0d000*/ u8 tileBuffers[13][256];
};

void sub_8047EC0(void);
void sub_804AFB8(const struct WindowConfig *, u8 *, const u8 *, u8);
void sub_804ACD8(const u8 *, u8 *, u8);
void nullsub_5(u8, u8);

extern u8 *gUnknown_020296CC[13];

extern u8 ewram[];
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
        {4, 2, 12, 12, 0, 0},
        {2, 4, 12, 12, 0, 0},
        {7, 6, 1, 0, 0, 0},
        {1, 6, 7, 0, 0, 0}
    }, {
        {5, 3, 12, 12, 0, 0},
        {3, 5, 12, 12, 0, 0},
        {0, 7, 6, 1, 0, 0},
        {6, 7, 0, 1, 0, 0}
    }, {
        {0, 0, 0, 0, 0, 0},
        {4, 0, 0, 0, 0, 0},
        {9, 8, 7, 6, 0, 0},
        {3, 1, 0, 0, 0, 0}
    }, {
        {1, 1, 1, 1, 0, 0},
        {5, 1, 1, 1, 0, 0},
        {2, 9, 8, 7, 0, 0},
        {8, 9, 6, 6, 0, 0}
    }, {
        {2, 2, 2, 2, 0, 0},
        {0, 0, 0, 0, 0, 0},
        {11, 10, 9, 8, 7, 6},
        {5, 3, 1, 0, 0, 0}
    }, {
        {3, 3, 3, 3, 0, 0},
        {1, 1, 1, 1, 0, 0},
        {4, 4, 4, 4, 0, 0},
        {10, 8, 6, 0, 0, 0}
    }, {
        {10, 8, 12, 0, 0, 0},
        {8, 10, 12, 0, 0, 0},
        {1, 0, 0, 0, 0, 0},
        {7, 0, 1, 0, 0, 0}
    }, {
        {12, 0, 0, 0, 0, 0},
        {9, 12, 0, 0, 0, 0},
        {6, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0}
    }, {
        {6, 0, 0, 0, 0, 0},
        {10, 6, 0, 0, 0, 0},
        {3, 2, 1, 0, 0, 0},
        {9, 7, 0, 0, 0, 0}
    }, {
        {7, 0, 0, 0, 0, 0},
        {11, 12, 0, 0, 0, 0},
        {8, 0, 0, 0, 0, 0},
        {2, 1, 0, 0, 0, 0}
    }, {
        {8, 0, 0, 0, 0, 0},
        {6, 0, 0, 0, 0, 0},
        {5, 4, 3, 2, 1, 0},
        {11, 9, 7, 0, 0, 0}
    }, {
        {9, 0, 0, 0, 0, 0},
        {12, 0, 0, 0, 0, 0},
        {10, 0, 0, 0, 0, 0},
        {4, 2, 0, 0, 0, 0}
    }, {
        {11, 9, 7, 6, 0, 0},
        {7, 6, 0, 0, 0, 0},
        {12, 0, 0, 0, 0, 0},
        {12, 0, 0, 0, 0, 0}
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

void sub_8047CD8(void)
{
    SetMainCallback2(sub_8047EC0);
}

void sub_8047CE8(void)
{
    u8 mpId;
    sub_804AFB8(&gWindowConfig_81E725C, gUnknown_020296CC[0], gSaveBlock2.playerName, 0xC);
    mpId = GetMultiplayerId();
    sub_804AFB8(&gWindowConfig_81E725C, gUnknown_020296CC[3], gLinkPlayers[mpId ^ 1].name, 0xC);
    sub_804AFB8(&gWindowConfig_81E725C, gUnknown_020296CC[6], gUnknown_0820C14C[0], 0x8);
    sub_804ACD8(gUnknown_0820C14C[1], gUnknown_020296CC[8], 0x14);
    nullsub_5(3, 0);
}

#ifdef NONMATCHING
void sub_8047D58(void)
{
    u8 language;
    struct SpriteTemplate spriteTemplate;
    int i;
    s16 x;
    u8 mpId;

    language = StringLength(gSaveBlock2.playerName) <= 5 ? 0 : 1;
    for (i = 0, x = gTradeUnknownSpriteCoords[language][0][0]; i < 3; x += 32, i ++)
    {
        spriteTemplate = gSpriteTemplate_820C0EC;
        spriteTemplate.tileTag += i;
        CreateSprite(&spriteTemplate, x, gTradeUnknownSpriteCoords[language][0][1], 1);
    }

    mpId = GetMultiplayerId();
    language = StringLength(gLinkPlayers[mpId ^ 1].name) <= 5 ? 0 : 1;
    for (i = 0, x = gTradeUnknownSpriteCoords[language][1][0]; i < 3; x += 32, i ++)
    {
        spriteTemplate = gSpriteTemplate_820C0EC;
        spriteTemplate.tileTag += i + 3;
        CreateSprite(&spriteTemplate, x, gTradeUnknownSpriteCoords[language][1][1], 1);
    }
    nullsub_5(5, 0);
}
#else
__attribute__((naked))
void sub_8047D58(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tmov r7, r8\n"
                    "\tpush {r7}\n"
                    "\tsub sp, 0x18\n"
                    "\tldr r0, _08047E30 @ =gSaveBlock2\n"
                    "\tbl StringLength\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tmovs r1, 0\n"
                    "\tcmp r0, 0x5\n"
                    "\tbls _08047D72\n"
                    "\tmovs r1, 0x1\n"
                    "_08047D72:\n"
                    "\tmovs r5, 0\n"
                    "\tlsls r2, r1, 2\n"
                    "\tmov r6, sp\n"
                    "\tldr r0, _08047E34 @ =gTradeUnknownSpriteCoords\n"
                    "\tadds r1, r0, 0x1\n"
                    "\tadds r1, r2\n"
                    "\tmov r8, r1\n"
                    "\tadds r0, r2, r0\n"
                    "\tldrb r0, [r0]\n"
                    "\tlsls r4, r0, 16\n"
                    "_08047D86:\n"
                    "\tmov r1, sp\n"
                    "\tldr r0, _08047E38 @ =gSpriteTemplate_820C0EC\n"
                    "\tldm r0!, {r2,r3,r7}\n"
                    "\tstm r1!, {r2,r3,r7}\n"
                    "\tldm r0!, {r2,r3,r7}\n"
                    "\tstm r1!, {r2,r3,r7}\n"
                    "\tldrh r0, [r6]\n"
                    "\tadds r0, r5\n"
                    "\tstrh r0, [r6]\n"
                    "\tasrs r1, r4, 16\n"
                    "\tmov r0, sp\n"
                    "\tmov r3, r8\n"
                    "\tldrb r2, [r3]\n"
                    "\tmovs r3, 0x1\n"
                    "\tbl CreateSprite\n"
                    "\tmovs r7, 0x80\n"
                    "\tlsls r7, 14\n"
                    "\tadds r4, r7\n"
                    "\tadds r5, 0x1\n"
                    "\tcmp r5, 0x2\n"
                    "\tble _08047D86\n"
                    "\tbl GetMultiplayerId\n"
                    "\tlsls r0, 24\n"
                    "\tmovs r1, 0x80\n"
                    "\tlsls r1, 17\n"
                    "\teors r1, r0\n"
                    "\tlsrs r1, 24\n"
                    "\tlsls r0, r1, 3\n"
                    "\tsubs r0, r1\n"
                    "\tlsls r0, 2\n"
                    "\tldr r1, _08047E3C @ =gLinkPlayers + 0x8\n"
                    "\tadds r0, r1\n"
                    "\tbl StringLength\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r0, 16\n"
                    "\tmovs r1, 0\n"
                    "\tcmp r0, 0x5\n"
                    "\tbls _08047DDA\n"
                    "\tmovs r1, 0x1\n"
                    "_08047DDA:\n"
                    "\tmovs r5, 0\n"
                    "\tlsls r2, r1, 2\n"
                    "\tmov r6, sp\n"
                    "\tldr r0, _08047E40 @ =gTradeUnknownSpriteCoords + 0x3\n"
                    "\tadds r1, r2, r0\n"
                    "\tmov r8, r1\n"
                    "\tsubs r0, 0x1\n"
                    "\tadds r0, r2, r0\n"
                    "\tldrb r0, [r0]\n"
                    "\tlsls r4, r0, 16\n"
                    "_08047DEE:\n"
                    "\tmov r1, sp\n"
                    "\tldr r0, _08047E38 @ =gSpriteTemplate_820C0EC\n"
                    "\tldm r0!, {r2,r3,r7}\n"
                    "\tstm r1!, {r2,r3,r7}\n"
                    "\tldm r0!, {r2,r3,r7}\n"
                    "\tstm r1!, {r2,r3,r7}\n"
                    "\tadds r0, r5, 0x3\n"
                    "\tldrh r1, [r6]\n"
                    "\tadds r0, r1\n"
                    "\tstrh r0, [r6]\n"
                    "\tasrs r1, r4, 16\n"
                    "\tmov r0, sp\n"
                    "\tmov r3, r8\n"
                    "\tldrb r2, [r3]\n"
                    "\tmovs r3, 0x1\n"
                    "\tbl CreateSprite\n"
                    "\tmovs r7, 0x80\n"
                    "\tlsls r7, 14\n"
                    "\tadds r4, r7\n"
                    "\tadds r5, 0x1\n"
                    "\tcmp r5, 0x2\n"
                    "\tble _08047DEE\n"
                    "\tmovs r0, 0x5\n"
                    "\tmovs r1, 0\n"
                    "\tbl nullsub_5\n"
                    "\tadd sp, 0x18\n"
                    "\tpop {r3}\n"
                    "\tmov r8, r3\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r0}\n"
                    "\tbx r0\n"
                    "\t.align 2, 0\n"
                    "_08047E30: .4byte gSaveBlock2\n"
                    "_08047E34: .4byte gTradeUnknownSpriteCoords\n"
                    "_08047E38: .4byte gSpriteTemplate_820C0EC\n"
                    "_08047E3C: .4byte gLinkPlayers + 0x8\n"
                    "_08047E40: .4byte gTradeUnknownSpriteCoords + 0x3");
}
#endif

asm(".section .text.sub_804A96C");

void sub_804A96C(struct UnkStructD *arg0, u8 left, u8 top, u16 *tilemap, u8 width, u8 height, u16 sp8) {
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

void sub_804DAD4(struct UnkStructC *arg0, struct InGameTrade *trade) {
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
