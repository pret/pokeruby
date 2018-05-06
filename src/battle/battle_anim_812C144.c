#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern u8 sub_8046234(s16 x, s16 y, u8 a3);

static void sub_812C184(struct Sprite *sprite);
static void sub_812C268(struct Sprite *sprite);
static void sub_812C2A4(struct Sprite *sprite);
extern void sub_812C380(struct Sprite *sprite);

void sub_812C144(struct Sprite *sprite)
{
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];

    if (gBattleAnimArgs[3] == 0)
        sprite->data[0] = gBattleAnimArgs[2];
    else
        sprite->data[0] = -gBattleAnimArgs[2];

    sprite->data[1] = gBattleAnimArgs[4];
    sprite->callback = sub_812C184;
}

static void sub_812C184(struct Sprite *sprite)
{
    if (sprite->data[1] > 0)
    {
        sprite->pos2.x = sprite->data[2] >> 8;
        sprite->data[2] += sprite->data[0];
        sprite->invisible ^= 1;
        sprite->data[1]--;
    }
    else
    {
        DestroyAnimSprite(sprite);
    }
}

void sub_812C1D0(u8 taskId)
{
    sub_8046234(
        GetBattlerSpriteCoord(gAnimBankTarget, 2) + 8,
        GetBattlerSpriteCoord(gAnimBankTarget, 3) + 8,
        0);
    DestroyAnimVisualTask(taskId);

}

void sub_812C220(struct Sprite *sprite)
{
    sprite->data[0] = 90;
    sprite->callback = WaitAnimForDuration;
    sprite->data[1] = 7;
    StoreSpriteCallbackInData(sprite, sub_812C268);
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = ((16 - sprite->data[1]) << 8) | sprite->data[1];
}

static void sub_812C268(struct Sprite *sprite)
{
    REG_BLDALPHA = ((16 - sprite->data[1]) << 8) | sprite->data[1];
    if (--sprite->data[1] < 0)
    {
        sprite->invisible = 1;
        sprite->callback = sub_812C2A4;
    }
}

static void sub_812C2A4(struct Sprite *sprite)
{
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    DestroyAnimSprite(sprite);
}

void sub_812C2BC(struct Sprite *sprite)
{
    u16 rotation;
    u8 x = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    u8 y = GetBattlerSpriteCoord(gAnimBankTarget, 3);

    sub_8078764(sprite, 1);

    rotation = ArcTan2Neg(sprite->pos1.x - x, sprite->pos1.y - y);
    rotation += 0x6000;
    if (IsContest())
        rotation += 0x4000;

    sub_8078FDC(sprite, 0, 0x100, 0x100, rotation);

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = x;
    sprite->data[4] = y;
    sprite->callback = StartTranslateAnimSpriteByDeltas;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_812C358(struct Sprite *sprite)
{
    REG_BLDCNT = 0x3F40;
    REG_BLDALPHA = 0x1000;
    sprite->data[0] = 4;
    sprite->callback = sub_812C380;
}
