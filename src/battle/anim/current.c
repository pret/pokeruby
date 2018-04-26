#include "global.h"
#include "battle_anim.h"
#include "main.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "constants/battle_constants.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80D6514(struct Sprite *sprite);
static void sub_80D672C(struct Sprite *sprite);
extern void sub_80D6874(u8 taskId);


void sub_80D648C(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);

    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);

    InitAnimSpriteTranslationDeltas(sprite);
    sprite->data[5] = gBattleAnimArgs[2];
    sprite->data[6] = gBattleAnimArgs[5];
    sprite->data[7] = gBattleAnimArgs[4];
    sprite->oam.tileNum += gBattleAnimArgs[6] * 4;

    sprite->callback = sub_80D6514;
    sprite->callback(sprite);
}

static void sub_80D6514(struct Sprite *sprite)
{
    if (!TranslateAnimSpriteByDeltas(sprite))
    {
        sprite->pos2.x += Sin(sprite->data[7], sprite->data[5]);
        sprite->pos2.y += Cos(sprite->data[7], sprite->data[5]);

        sprite->data[7] = (sprite->data[7] + sprite->data[6]) & 0xFF;
        if (sprite->data[7] % 3 == 0)
        {
            sprite->invisible ^= 1;
        }
    }
    else
    {
        DestroyAnimSprite(sprite);
    }
}

static void sub_80D658C(struct Sprite *sprite)
{
    if (--sprite->data[5] == -1)
    {
        sprite->invisible ^= 1;
        sprite->data[5] = sprite->data[4];
    }

    if (sprite->data[3]-- <= 0)
    {
        DestroyAnimSprite(sprite);
    }
}

void sub_80D65DC(struct Sprite *sprite)
{
    if (!gMain.inBattle || GetBattlerSide(gAnimBankTarget) == B_SIDE_PLAYER)
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];

    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 2) + gBattleAnimArgs[1];
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[2];
    sprite->data[3] = gBattleAnimArgs[0];
    sprite->data[4] = gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[3];
    sprite->callback = sub_80D658C;
}

void sub_80D6658(struct Sprite *sprite)
{
    u8 bank;

    sprite->data[0] = gBattleAnimArgs[3];
    if (gBattleAnimArgs[7] & 0x8000)
        bank = gAnimBankTarget;
    else
        bank = gAnimBankAttacker;

    if (!gMain.inBattle || GetBattlerSide(bank) == B_SIDE_PLAYER)
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];

    sprite->pos1.x = GetBattlerSpriteCoord(bank, 2) + gBattleAnimArgs[0];
    sprite->pos1.y = GetBattlerSpriteCoord(bank, 3) + gBattleAnimArgs[1];

    sprite->data[4] = gBattleAnimArgs[7] & 0x7FFF;
    sprite->data[5] = gBattleAnimArgs[2];
    sprite->data[6] = gBattleAnimArgs[5];
    sprite->data[7] = gBattleAnimArgs[4];

    sprite->oam.tileNum += gBattleAnimArgs[6] * 4;
    sprite->callback = sub_80D672C;
    sprite->callback(sprite);
}

static void sub_80D672C(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[7], sprite->data[5]);
    sprite->pos2.y = Cos(sprite->data[7], sprite->data[5]);

    sprite->data[7] = (sprite->data[7] + sprite->data[6]) & 0xFF;
    if (sprite->data[7] % sprite->data[4] == 0)
        sprite->invisible ^= 1;

    if (sprite->data[0]-- <= 0)
        DestroyAnimSprite(sprite);
}

void sub_80D679C(struct Sprite *sprite)
{
    sub_8078764(sprite, 0);
    sprite->oam.tileNum += gBattleAnimArgs[3] * 4;

    if (gBattleAnimArgs[3] == 1)
        sprite->oam.matrixNum = 8;
    else if (gBattleAnimArgs[3] == 2)
        sprite->oam.matrixNum = 16;

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->callback = WaitAnimForDuration;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80D681C(u8 taskId)
{
    gTasks[taskId].data[0] = GetBattlerSpriteCoord(gAnimBankTarget, 0) + gBattleAnimArgs[0];
    gTasks[taskId].data[1] = GetBattlerSpriteCoord(gAnimBankTarget, 1) + gBattleAnimArgs[1];
    gTasks[taskId].data[2] = gBattleAnimArgs[2];
    gTasks[taskId].func = sub_80D6874;
}
