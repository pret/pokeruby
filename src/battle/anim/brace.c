#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

static void sub_80CDF70(struct Sprite* sprite);

// brace (the Pokemon prepares to endure a hit)
// Used in Endure.

void sub_80CDF0C(struct Sprite* sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 0) + gBattleAnimArgs[1];
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 1) + gBattleAnimArgs[2];
    }
    else
    {
        sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 0) + gBattleAnimArgs[1];
        sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 1) + gBattleAnimArgs[2];
    }

    sprite->data[0] = 0;
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->callback = sub_80CDF70;
}

void sub_80CDF70(struct Sprite* sprite)
{
    if (++sprite->data[0] > sprite->data[1])
    {
        sprite->data[0] = 0;
        sprite->pos1.y--;
    }

    sprite->pos1.y -= sprite->data[0];
    if (sprite->animEnded)
        move_anim_8072740(sprite);
}
