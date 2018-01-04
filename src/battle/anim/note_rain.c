#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern u16 gUnknown_083D7A5C[5];

// note_rain (notes rain from a source point, usually a bell.)
// Used in Heal Bell.

void sub_80D1BA8(struct Sprite* sprite, u8 a, u8 b)
{
    u8 tile;
    tile = (b & 1);
    tile = ((-tile | tile) >> 31) & 32;
    sprite->oam.tileNum += tile + (a << 2);
    sprite->oam.paletteNum = IndexOfSpritePaletteTag(gUnknown_083D7A5C[b >> 1]);
}

void sub_80D1C08(struct Sprite* sprite)
{
    sub_80787B0(sprite, 0);
    if (GetBankSide(gAnimBankAttacker) != 0)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = GetBankPosition(gAnimBankAttacker, 0) + gBattleAnimArgs[2];
    sprite->data[4] = GetBankPosition(gAnimBankAttacker, 1) + gBattleAnimArgs[3];
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sub_80D1BA8(sprite, gBattleAnimArgs[5], gBattleAnimArgs[6]);
}
