#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "sprite.h"

extern s16 gBattleAnimArgs[8];
extern u8 gBattleAnimBankAttacker;
extern u8 gBattleAnimBankTarget;

static void sub_80D2CC4(struct Sprite *);

void sub_80D2C38(struct Sprite *sprite)
{
    if (gBattleAnimArgs[2] == 0)
    {
        move_anim_8072740(sprite);
    }
    else
    {
        if (gBattleAnimArgs[0] == 0)
        {
            sprite->pos1.x = sub_8077ABC(gBattleAnimBankAttacker, 2);
            sprite->pos1.y = sub_8077ABC(gBattleAnimBankAttacker, 3);
        }
        else
        {
            sprite->pos1.x = sub_8077ABC(gBattleAnimBankTarget, 2);
            sprite->pos1.y = sub_8077ABC(gBattleAnimBankTarget, 3);
        }

        if (gBattleAnimArgs[1] == 0)
            sprite->pos1.x += 32;
        else
            sprite->pos1.x -= 32;

        sprite->data[0] = gBattleAnimArgs[2];
        sprite->data[1] = gBattleAnimArgs[1];
        StartSpriteAnim(sprite, sprite->data[1]);
        sprite->callback = sub_80D2CC4;
    }
}

static void sub_80D2CC4(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        if (--sprite->data[0] != 0)
            StartSpriteAnim(sprite, sprite->data[1]);
        else
            move_anim_8072740(sprite);
    }
}
