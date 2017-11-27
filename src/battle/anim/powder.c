#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;

static void sub_80CA768(struct Sprite* sprite);

// powder
// Used by Sleep Powder, Stun Spore, and Poison Powder.

void sub_80CA710(struct Sprite* sprite)
{
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];

    if (GetBankSide(gBattleAnimBankAttacker))
    {
        sprite->data[3] = -gBattleAnimArgs[4];
    }
    else
    {
        sprite->data[3] = gBattleAnimArgs[4];
    }

    sprite->data[4] = gBattleAnimArgs[5];
    sprite->callback = sub_80CA768;
}

void sub_80CA768(struct Sprite* sprite)
{
    if (sprite->data[0] > 0)
    {
        sprite->data[0]--;
        sprite->pos2.y = sprite->data[2] >> 8;
        sprite->data[2] += sprite->data[1];
        sprite->pos2.x = Sin(sprite->data[5], sprite->data[3]);
        sprite->data[5] = (sprite->data[5] + sprite->data[4]) & 0xFF;
    }
    else
    {
        move_anim_8072740(sprite);
    }
}
