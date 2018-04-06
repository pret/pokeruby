#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "random.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80CA8B4(struct Sprite* sprite);
static void sub_80CA9F8(struct Sprite* sprite);
static void sub_80CAACC(struct Sprite* sprite);

extern struct SpriteTemplate gSpriteTemplate_83D631C;

// orbs
// Used by Solar Beam, Absorb, Hyper Beam, and Leech Seed.

void sub_80CA7B0(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    sprite->callback = StartTranslateAnimSpriteByDeltas;
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
}

void sub_80CA800(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 1);
    StartSpriteAnim(sprite, gBattleAnimArgs[3]);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    sprite->callback = StartTranslateAnimSpriteByDeltas;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80CA858(struct Sprite* sprite)
{
    InitAnimSpritePos(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    InitAnimSpriteTranslationDeltas(sprite);
    sprite->data[5] = gBattleAnimArgs[3];
    sprite->callback = sub_80CA8B4;
    sub_80CA8B4(sprite);
}

void sub_80CA8B4(struct Sprite* sprite)
{
    if (TranslateAnimSpriteByDeltas(sprite))
    {
        DestroySprite(sprite);
    }
    else
    {
        if (sprite->data[5] > 0x7F)
        {
            sprite->subpriority = sub_8079E90(gAnimBankTarget) + 1;
        }
        else
        {
            sprite->subpriority = sub_8079E90(gAnimBankTarget) + 6;
        }
        sprite->pos2.x += Sin(sprite->data[5], 5);
        sprite->pos2.y += Cos(sprite->data[5], 14);
        sprite->data[5] = (sprite->data[5] + 15) & 0xFF;
    }
}

void sub_80CA928(u8 taskId)
{
    gTasks[taskId].data[0]--;
    if (gTasks[taskId].data[0] == -1)
    {
        gTasks[taskId].data[1]++;
        gTasks[taskId].data[0] = 6;
        gBattleAnimArgs[0] = 15;
        gBattleAnimArgs[1] = 0;
        gBattleAnimArgs[2] = 80;
        gBattleAnimArgs[3] = 0;
        CreateSpriteAndAnimate(&gSpriteTemplate_83D631C, 0, 0, sub_8079E90(gAnimBankTarget) + 1);
    }

    if (gTasks[taskId].data[1] == 15)
        DestroyAnimVisualTask(taskId);
}

void sub_80CA9A8(struct Sprite* sprite)
{
    sub_8078764(sprite, 1);
    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    sprite->data[5] = gBattleAnimArgs[2];
    InitAnimSpriteTranslationOverDuration(sprite);
    sprite->callback = sub_80CA9F8;
}

void sub_80CA9F8(struct Sprite* sprite)
{
    if (TranslateAnimSpriteLinearAndSine(sprite))
        DestroyAnimSprite(sprite);
}

void sub_80CAA14(struct Sprite* sprite)
{
    u16 a = Random();
    u16 b;
    
    StartSpriteAnim(sprite, a & 7);
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    if (GetBattlerSide(gAnimBankAttacker))
    {
        sprite->pos1.x -= 20;
    }
    else
    {
        sprite->pos1.x += 20;
    }

    b = Random();
    sprite->data[0] = (b & 31) + 64;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    sub_8078D60(sprite);
    sprite->data[5] = Random() & 0xFF;
    sprite->data[6] = sprite->subpriority;
    sprite->callback = sub_80CAACC;
    sub_80CAACC(sprite);
}

void sub_80CAACC(struct Sprite* sprite)
{
    if (sub_8078CE8(sprite))
    {
        DestroyAnimSprite(sprite);
    }
    else
    {
        sprite->pos2.y += Cos(sprite->data[5], 12);
        if (sprite->data[5] <= 0x7E)
        {
            sprite->subpriority = sprite->data[6];
        }
        else
        {
            sprite->subpriority = sprite->data[6] + 1;
        }

        sprite->data[5] = (sprite->data[5] + 24) & 0xFF;
    }
}
