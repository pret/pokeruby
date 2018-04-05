#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

// drum (using hands to slap the Pokemon's belly in a rhythm.)
// Used in Belly Drum.

void sub_80CEDF0(struct Sprite* sprite)
{
    s16 a;
    if (gBattleAnimArgs[0] == 1)
    {
        sprite->oam.matrixNum = 8;
        a = 16;
    }
    else
    {
        a = -16;
    }

    sprite->pos1.x = GetBankPosition(gAnimBankAttacker, 2) + a;
    sprite->pos1.y = GetBankPosition(gAnimBankAttacker, 3) + 8;
    sprite->data[0] = 8;
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}
