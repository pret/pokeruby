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
static void sub_80DCAEC(struct Sprite *sprite);
static void sub_80DCB5C(struct Sprite *sprite);
static void sub_80DCBB4(struct Sprite *sprite);
void sub_80DCD78(struct Sprite *sprite);

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

    InitAnimSpritePos(sprite, 1);
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
        SetAverageBattlerPositions(gAnimBankTarget, 1, &sprite->data[2], &sprite->data[4]);
    }

    sub_8078BD4(sprite);
    sprite->data[5] = gBattleAnimArgs[3];
    sprite->callback = sub_80DCA38;
}

static void sub_80DCA38(struct Sprite *sprite)
{
    if (TranslateAnimSpriteByDeltas(sprite))
    {
        DestroyAnimSprite(sprite);
        return;
    }

    sprite->pos2.x += Sin(sprite->data[6], sprite->data[5]);
    sprite->data[6] = (sprite->data[6] + 13) & 0xFF;
}

// used in Move_STRING_SHOT
void sub_80DCA70(struct Sprite *sprite)
{
    SetAverageBattlerPositions(gAnimBankTarget, 0, &sprite->pos1.x, &sprite->pos1.y);
    if (GetBankSide(gAnimBankAttacker))
        sprite->pos1.x -= gBattleAnimArgs[0];
    else
        sprite->pos1.x += gBattleAnimArgs[0];

    sprite->pos1.y += gBattleAnimArgs[1];
    if (!GetBankSide(gAnimBankTarget))
        sprite->pos1.y += 8;

    sprite->callback = sub_80DCAEC;
}

static void sub_80DCAEC(struct Sprite *sprite)
{
    if (++sprite->data[0] == 3)
    {
        sprite->data[0] = 0;
        sprite->invisible ^= 1;
    }

    if (++sprite->data[1] == 51)
    {
        DestroyAnimSprite(sprite);
    }
}

// used in Move_SPIDER_WEB
void sub_80DCB38(struct Sprite *sprite)
{
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = 16;

    sprite->data[0] = 16;
    sprite->callback = sub_80DCB5C;
}

static void sub_80DCB5C(struct Sprite *sprite)
{
    if (sprite->data[2] < 20)
    {
        sprite->data[2]++;
    }
    else if (sprite->data[1]++ & 1)
    {
        sprite->data[0]--;
        REG_BLDALPHA = sprite->data[0] | ((16 - sprite->data[0]) << 8);

        if (sprite->data[0] == 0)
        {
            sprite->invisible = TRUE;
            sprite->callback = sub_80DCBB4;
        }
    }
}

static void sub_80DCBB4(struct Sprite *sprite)
{
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    DestroyAnimSprite(sprite);
}

// used in 3 moves:
//         Move_POISON_STING, Move_TWINEEDLE, Move_SPIKE_CANNON
void sub_80DCBCC(struct Sprite *sprite)
{
    s16 lVarX, lVarY;
    u16 rot;

    if (IsContest())
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }
    else
    {
        if (GetBankSide(gAnimBankAttacker))
        {
            gBattleAnimArgs[2] = -gBattleAnimArgs[2];
            gBattleAnimArgs[1] = -gBattleAnimArgs[1];
            gBattleAnimArgs[3] = -gBattleAnimArgs[3];
        }
    }

    if (!IsContest())
    {
        if (GetBankSide(gAnimBankAttacker) == GetBankSide(gAnimBankTarget))
        {
            if (GetBankIdentity(gAnimBankTarget) == 0 || GetBankIdentity(gAnimBankTarget) == 1)
            {
                s16 temp1, temp2;

                temp1 = gBattleAnimArgs[2];
                gBattleAnimArgs[2] = -temp1;

                temp2 = gBattleAnimArgs[0];
                gBattleAnimArgs[0] = -temp2;
            }
        }
    }

    InitAnimSpritePos(sprite, 1);

    lVarX = GetBankPosition(gAnimBankTarget, 2) + gBattleAnimArgs[2];
    lVarY = GetBankPosition(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    rot = sub_80790F0(lVarX - sprite->pos1.x, lVarY - sprite->pos1.y);
    rot += 0xC000;
    sub_8078FDC(sprite, FALSE, 0x100, 0x100, rot);

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = lVarX;
    sprite->data[4] = lVarY;

    sprite->callback = sub_8078B34;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

// used in 2 moves:
//         Move_PIN_MISSILE, Move_ICICLE_SPEAR
void sub_80DCCFC(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);

    if (GetBankSide(gAnimBankAttacker))
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = GetBankPosition(gAnimBankTarget, 2) + gBattleAnimArgs[2];
    sprite->data[4] = GetBankPosition(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[5];
    sub_80786EC(sprite);

    sprite->callback = sub_80DCD78;
    sprite->invisible = TRUE;
}

void sub_80DCD78(struct Sprite *sprite)
{
    sprite->invisible = FALSE;

    if (TranslateAnimSpriteLinearAndSine(sprite))
    {
        DestroyAnimSprite(sprite);
    }
    else
    {
        s16 tempData[8];
        u16 *data = sprite->data;
        u16 x1 = sprite->pos1.x;
        s16 x2 = sprite->pos2.x;
        u16 y1 = sprite->pos1.y;
        s16 y2 = sprite->pos2.y;
        int i;

        for (i = 0; i < 8; i++)
            tempData[i] = data[i];

        x2 += x1;
        y2 += y1;

        if (!TranslateAnimSpriteLinearAndSine(sprite))
        {
            u16 rot = sub_80790F0(sprite->pos1.x + sprite->pos2.x - x2,
                                  sprite->pos1.y + sprite->pos2.y - y2);
            rot += 0xC000;
            sub_8078FDC(sprite, FALSE, 0x100, 0x100, rot);

            for (i = 0; i < 8; i++)
                data[i] = tempData[i];
        }
    }
}

void sub_80DCE40(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBankPosition(gAnimBankAttacker, 2);
        sprite->pos1.y = GetBankPosition(gAnimBankAttacker, 3) + 18;
    }
    else
    {
        sprite->pos1.x = GetBankPosition(gAnimBankTarget, 2);
        sprite->pos1.y = GetBankPosition(gAnimBankTarget, 3) + 18;
    }

    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_80785E4;
}
