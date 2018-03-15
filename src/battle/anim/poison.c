#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "trig.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80D9DD4(struct Sprite *sprite);
void sub_80D9E78(struct Sprite *sprite);
void sub_80D9EE8(struct Sprite *sprite);
void sub_80D9FF0(struct Sprite *sprite);

void sub_80D9D70(struct Sprite *sprite)
{
    if (!gBattleAnimArgs[3])
        StartSpriteAnim(sprite, 2);

    InitAnimSpritePos(sprite, 1);

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = GetBankPosition(gAnimBankTarget, 2);
    sprite->data[4] = GetBankPosition(gAnimBankTarget, 3);
    sprite->data[5] = -30;

    InitAnimSpriteTranslationOverDuration(sprite);

    sprite->callback = sub_80D9DD4;
}

void sub_80D9DD4(struct Sprite *sprite) // same as sub_80D9E78
{
    if (TranslateAnimSpriteLinearAndSine(sprite))
        DestroyAnimSprite(sprite);
}

void sub_80D9DF0(struct Sprite *sprite)
{
    s16 l1, l2;
    if (!gBattleAnimArgs[3])
        StartSpriteAnim(sprite, 2);

    InitAnimSpritePos(sprite, 1);
    SetAverageBattlerPositions(gAnimBankTarget, 1, &l1, &l2);

    if (GetBankSide(gAnimBankAttacker))
        gBattleAnimArgs[4] = -gBattleAnimArgs[4];

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = l1 + gBattleAnimArgs[4];
    sprite->data[4] = l2 + gBattleAnimArgs[5];
    sprite->data[5] = -30;

    InitAnimSpriteTranslationOverDuration(sprite);

    sprite->callback = sub_80D9E78;
}

void sub_80D9E78(struct Sprite *sprite) // same as sub_80D9DD4
{
    if (TranslateAnimSpriteLinearAndSine(sprite))
        DestroyAnimSprite(sprite);
}

void sub_80D9E94(struct Sprite *sprite)
{
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = sprite->pos1.x + gBattleAnimArgs[0];
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = sprite->pos1.y + gBattleAnimArgs[1];

    InitSpriteDataForLinearTranslation(sprite);

    sprite->data[5] = sprite->data[1] / gBattleAnimArgs[2];
    sprite->data[6] = sprite->data[2] / gBattleAnimArgs[2];

    sprite->callback = sub_80D9EE8;
}

void sub_80D9EE8(struct Sprite *sprite)
{
    sub_8078394(sprite);

    sprite->data[1] -= sprite->data[5];
    sprite->data[2] -= sprite->data[6];

    if (!sprite->data[0])
        DestroyAnimSprite(sprite);
}

void sub_80D9F14(struct Sprite *sprite)
{
    SetAverageBattlerPositions(gAnimBankTarget, TRUE, &sprite->pos1.x, &sprite->pos1.y);

    if (GetBankSide(gAnimBankAttacker))
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];

    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = sprite->pos1.x + gBattleAnimArgs[2];
    sprite->data[4] = sprite->pos1.y + sprite->data[0];

    sprite->callback = StartTranslateAnimSpriteByDeltas;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80D9F88(struct Sprite *sprite)
{
    if (!gBattleAnimArgs[2])
    {
        sub_8078764(sprite, TRUE);
    }
    else
    {
        SetAverageBattlerPositions(gAnimBankTarget, TRUE, &sprite->pos1.x, &sprite->pos1.y);

        if (GetBankSide(gAnimBankAttacker))
            gBattleAnimArgs[0] = -gBattleAnimArgs[0];

        sprite->pos1.x += gBattleAnimArgs[0];
        sprite->pos1.y += gBattleAnimArgs[1];
    }

    sprite->callback = sub_80D9FF0;
}

void sub_80D9FF0(struct Sprite *sprite)
{
    sprite->data[0] = (sprite->data[0] + 0xB) & 0xFF;
    sprite->pos2.x = Sin(sprite->data[0], 4);
    sprite->data[1] += 0x30;
    sprite->pos2.y = -(sprite->data[1] >> 8);

    if (sprite->affineAnimEnded)
        DestroyAnimSprite(sprite);
}