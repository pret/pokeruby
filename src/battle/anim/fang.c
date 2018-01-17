#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

// fang
// Used by Super Fang (and probably Hyper Fang, but the actual callbacks are not in this file.)
// (Look into this one later.)

void sub_80CEA04(struct Sprite* sprite)
{
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = sub_8078600;
}
