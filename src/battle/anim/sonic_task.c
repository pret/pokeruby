#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "battle_anim_80CA710.h"
#include "battle.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern u8 gBanksBySide[];
extern u16 gBattleTypeFlags;
extern struct SpriteTemplate gSpriteTemplate_83D74BC;

// sonic_task (the task functions for the "sonic" effect.)
// Used in Air Cutter and Sonic Boom.

void sub_80CF9F8(u8 taskId)
{
    if (gTasks[taskId].data[1] == 0)
        DestroyAnimVisualTask(taskId);
}

void sub_80CFA20(u8 taskId)
{
    if (gTasks[taskId].data[0]-- <= 0)
    {
        u8 spriteId;
        struct Sprite* sprite;
        spriteId = CreateSprite(&gSpriteTemplate_83D74BC, gTasks[taskId].data[9], gTasks[taskId].data[10], gTasks[taskId].data[2] - gTasks[taskId].data[1]);
        sprite = &gSprites[spriteId];
        switch (gTasks[taskId].data[4])
        {
        case 1:
            sprite->oam.matrixNum |= 24;
            break;
        case 2:
            sprite->oam.matrixNum = 8;
            break;
        }

        sprite->data[0] = gTasks[taskId].data[5] - gTasks[taskId].data[6];
        sprite->data[7] = taskId;
        gTasks[taskId].data[gTasks[taskId].data[1] + 13] = spriteId;
        gTasks[taskId].data[0] = gTasks[taskId].data[3];
        gTasks[taskId].data[1]++;
        PlaySE12WithPanning(0x9A, BattleAnimAdjustPanning(-0x3F));
        if (gTasks[taskId].data[1] > 2)
            gTasks[taskId].func = sub_80CF9F8;
    }
}

void sub_80CFB04(u8 taskId)
{
    s16 r9 = 0;
    s16 r6 = 0;
    s16 sp1 = 0;
    s16 sp2 = 0;
    s16 r4;

    if (IsContest())
    {
        gTasks[taskId].data[4] = 2;
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];
        if (gBattleAnimArgs[2] & 1)
            gBattleAnimArgs[2] &= ~1;
        else
            gBattleAnimArgs[2] |= 1;
    }
    else
    {
        if ((gBanksBySide[gAnimBankTarget] & 1) == 0)
        {
            gTasks[taskId].data[4] = 1;
            gBattleAnimArgs[0] = -gBattleAnimArgs[0];
            gBattleAnimArgs[1] = -gBattleAnimArgs[1];
            if (gBattleAnimArgs[2] & 1)
                gBattleAnimArgs[2] &= ~1;
            else
                gBattleAnimArgs[2] |= 1;
        }
    }
    r6 = gTasks[taskId].data[9] = GetBankPosition(gAnimBankAttacker, 0);
    r9 = gTasks[taskId].data[10] = GetBankPosition(gAnimBankAttacker, 1);
    if ((gBattleTypeFlags & BATTLE_TYPE_DOUBLE)
        && IsAnimBankSpriteVisible(gAnimBankTarget ^ 2))
    {
        SetAverageBattlerPositions(gAnimBankTarget, 0, &sp1, &sp2);
    }
    else
    {
        sp1 = GetBankPosition(gAnimBankTarget, 0);
        sp2 = GetBankPosition(gAnimBankTarget, 1);
    }

    sp1 = gTasks[taskId].data[11] = sp1 + gBattleAnimArgs[0];
    sp2 = gTasks[taskId].data[12] = sp2 + gBattleAnimArgs[1];
    if (sp1 >= r6)
        r4 = sp1 - r6;
    else
        r4 = r6 - sp1;

    gTasks[taskId].data[5] = sub_81174C4(r4, sub_81174E0(gBattleAnimArgs[2] & ~1));
    gTasks[taskId].data[6] = sub_81174C4(gTasks[taskId].data[5], 0x80);
    gTasks[taskId].data[7] = gBattleAnimArgs[2];
    if (sp2 >= r9)
    {
        r4 = sp2 - r9;
        gTasks[taskId].data[8] = sub_81174C4(r4, sub_81174E0(gTasks[taskId].data[5])) & ~1;
    }
    else
    {
        r4 = r9 - sp2;
        gTasks[taskId].data[8] = sub_81174C4(r4, sub_81174E0(gTasks[taskId].data[5])) | 1;
    }

    gTasks[taskId].data[3] = gBattleAnimArgs[3];
    if (gBattleAnimArgs[4] & 0x80)
    {
        gBattleAnimArgs[4] ^= 0x80;
        if (gBattleAnimArgs[4] >= 64)
        {
            u16 var = sub_8079E90(gAnimBankTarget) + (gBattleAnimArgs[4] - 64);
            gTasks[taskId].data[2] = var;
        }
        else
        {
            u16 var = sub_8079E90(gAnimBankTarget) - gBattleAnimArgs[4];
            gTasks[taskId].data[2] = var;
        }
    }
    else
    {
        if (gBattleAnimArgs[4] >= 64)
        {
            u16 var = sub_8079E90(gAnimBankTarget) + (gBattleAnimArgs[4] - 64);
            gTasks[taskId].data[2] = var;
        }
        else
        {
            u16 var = sub_8079E90(gAnimBankTarget) - gBattleAnimArgs[4];
            gTasks[taskId].data[2] = var;
        }
    }

    if (gTasks[taskId].data[2] < 3)
        gTasks[taskId].data[2] = 3;

    gTasks[taskId].func = sub_80CFA20;
}
