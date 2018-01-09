#include "global.h"
#include "battle_anim.h"
#include "contest.h"
#include "rom_8077ABC.h"
#include "trig.h"
// #include "util.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80DCA38(struct Sprite *sprite);

// used in Move_MEGAHORN
void sub_80DC824(struct Sprite *sprite)
{
    if (IsContest())
    {
        StartSpriteAffineAnim(sprite, 2);
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    }
    else if (!GetBankSide(gAnimBankTarget))
    {
        StartSpriteAffineAnim(sprite, 1);
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
        gBattleAnimArgs[3] = -gBattleAnimArgs[3];
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    }

    sprite->pos1.x = sub_8077EE4(gAnimBankTarget, 2) + gBattleAnimArgs[0];
    sprite->pos1.y = sub_8077EE4(gAnimBankTarget, 3) + gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[4];

    sprite->data[2] = GetBankPosition(gAnimBankTarget, 2) + gBattleAnimArgs[2];
    sprite->data[4] = GetBankPosition(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// used in Move_LEECH_LIFE
void sub_80DC8F4(struct Sprite *sprite)
{
    if (IsContest())
    {
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
        StartSpriteAffineAnim(sprite, 2);
    }
    else if (!GetBankSide(gAnimBankTarget))
    {
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    }

    sprite->pos1.x = sub_8077EE4(gAnimBankTarget, 2) + gBattleAnimArgs[0];
    sprite->pos1.y = sub_8077EE4(gAnimBankTarget, 3) + gBattleAnimArgs[1];
    sprite->data[0] = gBattleAnimArgs[2];

    sprite->data[2] = GetBankPosition(gAnimBankTarget, 2);
    sprite->data[4] = GetBankPosition(gAnimBankTarget, 3);
    
    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// used in 2 moves:
//         Move_STRING_SHOT, Move_SPIDER_WEB
void sub_80DC9A0(struct Sprite *sprite)
{
    if (IsContest())
        gBattleAnimArgs[2] /= 2;

    sub_80787B0(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[3] = sprite->pos1.y;

    if (!gBattleAnimArgs[4])
    {
        sprite->data[2] = GetBankPosition(gAnimBankTarget, 2);
        sprite->data[4] = GetBankPosition(gAnimBankTarget, 3);
    }
    else
    {
        sub_807A3FC(gAnimBankTarget, 1, &sprite->data[2], &sprite->data[4]);
    }

    sub_8078BD4(sprite);
    sprite->data[5] = gBattleAnimArgs[3];
    sprite->callback = sub_80DCA38;
}

static void sub_80DCA38(struct Sprite *sprite)
{
    if (sub_8078B5C(sprite))
    {
        DestroyAnimSprite(sprite);
        return;
    }

    sprite->pos2.x += Sin(sprite->data[6], sprite->data[5]);
    sprite->data[6] = (sprite->data[6] + 13) & 0xFF;
}