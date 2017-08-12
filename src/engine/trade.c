#include "global.h"
#include "name_string_util.h"
#include "string_util.h"
#include "text.h"

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

extern const struct InGameTrade gIngameTrades[];
extern const u16 gIngameTradeMail[][10];


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
