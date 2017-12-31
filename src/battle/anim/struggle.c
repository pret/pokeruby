#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "sprite.h"

extern s16 gBattleAnimArgs[8];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80D2CC4(struct Sprite *);

void sub_80D2C38(struct Sprite *sprite)
{
    if (gBattleAnimArgs[2] == 0)
    {
        DestroyAnimSprite(sprite);
    }
    else
    {
        if (gBattleAnimArgs[0] == 0)
        {
            sprite->pos1.x = GetBankPosition(gAnimBankAttacker, 2);
            sprite->pos1.y = GetBankPosition(gAnimBankAttacker, 3);
        }
        else
        {
            sprite->pos1.x = GetBankPosition(gAnimBankTarget, 2);
            sprite->pos1.y = GetBankPosition(gAnimBankTarget, 3);
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
            DestroyAnimSprite(sprite);
    }
}
