#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

static void sub_80CD2D4(struct Sprite* sprite);

// unused_3 (seems to be some sort of popping effect with a growing diamond shape)
// yet another unused effect...

void sub_80CD274(struct Sprite* sprite)
{
    sub_8078650(sprite);
    if (GetBankSide(gBattleAnimBankAttacker) == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }
    else
    {
        sprite->pos1.x -= gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        StartSpriteAnim(sprite, 1);
    }

    sprite->callback = sub_80CD2D4;
}

void sub_80CD2D4(struct Sprite* sprite)
{
    if (++sprite->data[0] > 30)
    {
        sprite->pos2.y = (30 - sprite->data[0]) / 3;
        sprite->pos2.x = Sin(sprite->data[1] * 4, 3);
        sprite->data[1]++;
    }

    if (sprite->animEnded)
        move_anim_8072740(sprite);
}
