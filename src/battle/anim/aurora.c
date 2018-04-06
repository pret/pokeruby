#include "global.h"
#include "battle_anim.h"
#include "palette.h"
#include "rom_8077ABC.h"
#include "sprite.h"
#include "task.h"

extern s16 gBattleAnimArgs[8];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80D344C(struct Sprite *);
static void sub_80D34D4(u8);

void sub_80D33B4(struct Sprite *sprite)
{
    s16 r6;

    InitAnimSpritePos(sprite, 1);
    if (GetBattlerSide(gAnimBankAttacker) != 0)
        r6 = -gBattleAnimArgs[2];
    else
        r6 = gBattleAnimArgs[2];
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBankPosition(gAnimBankTarget, 2) + r6;
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBankPosition(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    InitAnimSpriteTranslationDeltas(sprite);
    sprite->callback = sub_80D344C;
    sprite->affineAnimPaused = TRUE;
    sprite->callback(sprite);
}

static void sub_80D344C(struct Sprite *sprite)
{
    if ((u16)gBattleAnimArgs[7] == 0xFFFF)
    {
        StartSpriteAnim(sprite, 1);
        sprite->affineAnimPaused = FALSE;
    }
    if (TranslateAnimSpriteByDeltas(sprite) != 0)
        DestroyAnimSprite(sprite);
}

void sub_80D3490(u8 taskId)
{
    gTasks[taskId].data[0] = gBattleAnimArgs[0];
    gTasks[taskId].data[2] = 0x100 + IndexOfSpritePaletteTag(0x279C) * 16;
    gTasks[taskId].func = sub_80D34D4;
}

static void sub_80D34D4(u8 taskId)
{
    gTasks[taskId].data[10]++;
    if (gTasks[taskId].data[10] == 3)
    {
        u16 r5;
        u16 r6;
        s32 i;

        gTasks[taskId].data[10] = 0;
        r5 = gTasks[taskId].data[2] + 1;
        r6 = gPlttBufferFaded[r5];
        for (i = 1; i < 8; i++)
            gPlttBufferFaded[r5 + i - 1] = gPlttBufferFaded[r5 + i];
        gPlttBufferFaded[r5 + 7] = r6;
    }
    gTasks[taskId].data[11]++;
    if (gTasks[taskId].data[11] == gTasks[taskId].data[0])
        DestroyAnimVisualTask(taskId);
}
