#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80CD394(struct Sprite* sprite);

// sleep (the "ZZZ" graphical effect)
// Used by Rest and the sleep turn when the Pokemon is still asleep.

void sub_80CD328(struct Sprite* sprite)
{
    sub_8078650(sprite);
    if (GetBattlerSide(gAnimBankAttacker) == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        sprite->data[3] = 1;
    }
    else
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        sprite->data[3] = 0xFFFF;
        StartSpriteAffineAnim(sprite, 1);
    }

    sprite->callback = sub_80CD394;
}

void sub_80CD394(struct Sprite* sprite)
{
    sprite->pos2.y = -(sprite->data[0] / 0x28);
    sprite->pos2.x = sprite->data[4] / 10;
    sprite->data[4] += sprite->data[3] * 2;
    sprite->data[0] += sprite->data[1];
    if (++sprite->data[1] > 0x3C)
        move_anim_8074EE0(sprite);
}
