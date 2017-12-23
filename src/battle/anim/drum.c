#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

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

    sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2) + a;
    sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3) + 8;
    sprite->data[0] = 8;
    sprite->callback = sub_80782D8;
    StoreSpriteCallbackInData(sprite, move_anim_8072740);
}
