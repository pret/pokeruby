#include "global.h"
#include "battle_anim.h"
#include "sprite.h"

extern s16 gBattleAnimArgs[8];

void sub_80D2BE8(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
        StartSpriteAnim(sprite, gBattleAnimArgs[2]);
        sprite->data[0]++;
    }
    else if (sprite->animEnded)
    {
        move_anim_8072740(sprite);
    }
}
