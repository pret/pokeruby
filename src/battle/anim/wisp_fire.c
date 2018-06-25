#include "global.h"
#include "battle_anim.h"
#include "blend_palette.h"
#include "main.h"
#include "rom_8077ABC.h"
#include "task.h"
#include "trig.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankTarget;
extern u8 gAnimBankAttacker;
extern u8 gBankSpriteIds[];

void sub_80D5CC0(struct Sprite *sprite);
static void sub_80D5E4C(u8 taskId);

const union AnimCmd gSpriteAnim_83D9764[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(16, 5),
    ANIMCMD_FRAME(32, 5),
    ANIMCMD_FRAME(48, 5),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83D9778[] =
{
    gSpriteAnim_83D9764,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D977C =
{
    .tileTag = 10232,
    .paletteTag = 10232,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D9778,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D5CC0,
};

const s8 gUnknown_083D9794[16] =
{
    -1, -1, 0, 1, 1, 0, 0, -1, -1, 1, 1, 0, 0, -1, 0, 1,
};

const s8 gUnknown_083D97A4[16] =
{
    -1, 0, 1, 0, -1, 1, 0, -1, 0, 1, 0, -1, 0, 1, 0, 1,
};

void sub_80D5CC0(struct Sprite *sprite)
{
    if (!sprite->data[0])
    {
        sprite->data[1] = gBattleAnimArgs[0];
        sprite->data[0] += 1;
    }

    sprite->data[3] += 0xC0 * 2;
    sprite->data[4] += 0xA0;

    sprite->pos2.x = Sin(sprite->data[1], sprite->data[3] >> 8);
    sprite->pos2.y = Cos(sprite->data[1], sprite->data[4] >> 8);

    sprite->data[1] = (sprite->data[1] + 7) & 0xFF;

    if (gMain.inBattle)
    {
        if (sprite->data[1] < 64 || sprite->data[1] > 195)
            sprite->oam.priority = sub_8079ED4(gAnimBankTarget);
        else
            sprite->oam.priority = sub_8079ED4(gAnimBankTarget) + 1;
    }
    else
    {
        if (sprite->data[1] < 64 || sprite->data[1] > 195)
            sprite->subpriority = 0x1D;
        else
            sprite->subpriority = 0x1F;
    }

    if (++sprite->data[2] > 0x14)
        sprite->invisible ^= 1;

    if (sprite->data[2] == 0x1E)
        DestroyAnimSprite(sprite);
}

void sub_80D5DDC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[12] = !GetBattlerSide(gAnimBankAttacker) ? 1 : -1;
    task->data[13] = IsAnimBankSpriteVisible(gAnimBankTarget ^ 2) + 1;
    task->data[14] = GetAnimBattlerSpriteId(1);
    task->data[15] = GetAnimBattlerSpriteId(3);

    task->func = sub_80D5E4C;
}

static void sub_80D5E4C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
        case 0:
            task->data[10] += task->data[12] * 2;
            if (++task->data[1] >= 2)
            {
                task->data[1] = 0;
                task->data[2]++;
                if (task->data[2] & 1)
                    task->data[11] = 2;
                else
                    task->data[11] = -2;
            }

            for (task->data[3] = 0; task->data[3] < task->data[13]; task->data[3]++)
            {
                gSprites[task->data[task->data[3] + 14]].pos2.x = task->data[10] + task->data[11];
            }

            if (++task->data[9] == 16)
            {
                task->data[9] = 0;
                task->data[0]++;
            }
            break;
        case 1:
            if (++task->data[1] >= 5)
            {
                task->data[1] = 0;
                task->data[2]++;

                if (task->data[2] & 1)
                    task->data[11] = 2;
                else
                    task->data[11] = -2;
            }

            for (task->data[3] = 0; task->data[3] < task->data[13]; task->data[3]++)
            {
                gSprites[task->data[task->data[3] + 14]].pos2.x = task->data[10] + task->data[11];
            }

            if (++task->data[9] == 96)
            {
                task->data[9] = 0;
                task->data[0]++;
            }
            break;
        case 2:
            task->data[10] -= task->data[12] * 2;

            if (++task->data[1] >= 2)
            {
                task->data[1] = 0;
                task->data[2]++;

                if (task->data[2] & 1)
                    task->data[11] = 2;
                else
                    task->data[11] = -2;
            }

            for (task->data[3] = 0; task->data[3] < task->data[13]; task->data[3]++)
            {
                gSprites[task->data[task->data[3] + 14]].pos2.x = task->data[10] + task->data[11];
            }

            if (++task->data[9] == 16)
            {
                task->data[0]++;
            }
            break;
        case 3:
            for (task->data[3] = 0; task->data[3] < task->data[13]; task->data[3]++)
            {
                gSprites[task->data[task->data[3] + 14]].pos2.x = 0;
            }

            DestroyAnimVisualTask(taskId);
            break;
    }
}

void sub_80D6080(u8 taskId)
{
    struct Struct_sub_8078914 unk;
    sub_8078914(&unk);
    BlendPalette(unk.field_8 << 4, 16, gBattleAnimArgs[0], gBattleAnimArgs[1]); // u16 palOffset, u16 numEntries, u8 coeff, u16 blendColor
    DestroyAnimVisualTask(taskId);
}

void sub_80D60B4(u8 taskId)
{
    s8 unk;
    u8 spriteId;

    if (gTasks[taskId].data[0] == 0)
    {
        gTasks[taskId].data[1] = gBattleAnimArgs[0];
        gTasks[taskId].data[2] = gBattleAnimArgs[1];
        gTasks[taskId].data[3] = gBattleAnimArgs[2];
        gTasks[taskId].data[4] = gBattleAnimArgs[3];
    }
    gTasks[taskId].data[0]++;

    spriteId = gBankSpriteIds[gAnimBankTarget];

    if (!gTasks[taskId].data[4])
        unk = gUnknown_083D9794[gTasks[taskId].data[0] % 10];
    else
        unk = gUnknown_083D97A4[gTasks[taskId].data[0] % 10];

    if (gTasks[taskId].data[3] == 1)
        gSprites[spriteId].pos2.y = gBattleAnimArgs[1] * unk < 0 ? -(gBattleAnimArgs[1] * unk) : gBattleAnimArgs[1] * unk;
    else
        gSprites[spriteId].pos2.x = gBattleAnimArgs[1] * unk;

    if (gTasks[taskId].data[0] == gTasks[taskId].data[1])
    {
        gSprites[spriteId].pos2.x = 0;
        gSprites[spriteId].pos2.y = 0;
        DestroyAnimVisualTask(taskId);
    }
}