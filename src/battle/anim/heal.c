#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

// heal (healing sparkles on a Pokemon)
// Used in Present, if the move heals instead of damages.

void sub_80CBAA4(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sub_8078764(sprite, 0);
        sprite->data[1] = gBattleAnimArgs[2];
    }

    sprite->data[0]++;
    sprite->pos2.y = sprite->data[1] * sprite->data[0];
    if (sprite->animEnded)
    {
        DestroyAnimSprite(sprite);
    }
}
