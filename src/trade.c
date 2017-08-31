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
    u8 *unk00;
    u8 fil04[8];
    u8 *unk0C;
    u8 fil10[8];
    u8 *unk18;
    u8 fil1C[4];
    void *unk20;
};

void sub_8047EC0(void);
void sub_804AFB8(const struct WindowConfig *, u8 *, const u8 *, u8);
void sub_804ACD8(const u8 *, u8 *, u8);
void nullsub_5(u8, u8);

extern struct UnkStructE gUnknown_020296CC;

const u8 *const gUnknown_0820C14C[] = {
    TradeText_Cancel,
    TradeText_ChoosePoke,
    TradeText_Summary1,
    TradeText_Trade1,
    TradeText_CancelTradePrompt,
    TradeText_PressBToExit
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
    sub_804AFB8(&gWindowConfig_81E725C, gUnknown_020296CC.unk00, gSaveBlock2.playerName, 0xC);
    mpId = GetMultiplayerId();
    sub_804AFB8(&gWindowConfig_81E725C, gUnknown_020296CC.unk0C, gLinkPlayers[mpId ^ 1].name, 0xC);
    sub_804AFB8(&gWindowConfig_81E725C, gUnknown_020296CC.unk18, gUnknown_0820C14C[0], 0x8);
    sub_804ACD8(gUnknown_0820C14C[1], gUnknown_020296CC.unk20, 0x14);
    nullsub_5(3, 0);
}

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
