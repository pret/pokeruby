#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

// alert (red thunder from the sides of a Pokemon, simulating more alert behavior.)
// Used in Kinesis.

void sub_80CF610(struct Sprite* sprite)
{
    sub_8078650(sprite);
    sub_807867C(sprite, gBattleAnimArgs[0]);
    sprite->pos1.y += gBattleAnimArgs[1];
    if (GetBankSide(gAnimBankAttacker) != 0)
    {
        sprite->hFlip = 1;
        if (gBattleAnimArgs[2] != 0)
            sprite->vFlip = 1;
    }
    else
    {
        if (gBattleAnimArgs[2] != 0)
            sprite->vFlip = 1;
    }

    sprite->callback = sub_8078600;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}
