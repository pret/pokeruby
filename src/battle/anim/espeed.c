#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

void sub_80D1A70(struct Sprite* sprite);
static void sub_80D15E0(u8 taskId);
static void sub_80D16A0(u8 taskId);
static void sub_80D1808(u8 taskId);
static void sub_80D1930(u8 taskId);

// espeed (the Pokemon's width decreases as the sprite becomes vertically compressed)
// Used in Extremespeed.

const union AffineAnimCmd gSpriteAffineAnim_83D79BC[] =
{
    AFFINEANIMCMD_FRAME(96, -13, 0, 8),
    AFFINEANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D79CC[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(4, 3),
    ANIMCMD_FRAME(8, 3),
    ANIMCMD_FRAME(4, 3),
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D79E4[] =
{
    gSpriteAnim_83D79CC,
};

const struct SpriteTemplate gSpriteTemplate_83D79E8 =
{
    .tileTag = 10207,
    .paletteTag = 10207,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83D79E4,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D1A70,
};

const s8 gUnknown_083D7A00[][2] =
{
    {30, 28},
    {-20, 24},
    {16, 26},
    {-10, 28},
};

// apply espeed
void sub_80D15A4(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBattlerSpriteId(0);
    task->data[0] = spriteId;
    sub_80798F4(task, spriteId, &gSpriteAffineAnim_83D79BC);
    task->func = sub_80D15E0;
}

void sub_80D15E0(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (sub_807992C(task) == 0)
    {
        gSprites[task->data[0]].pos2.y = 0;
        gSprites[task->data[0]].invisible = 1;
        DestroyAnimVisualTask(taskId);
    }
}

// espeed hit effect
void sub_80D1638(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[12] = 3;
    if (GetBattlerSide(gAnimBankTarget) == 0)
    {
        task->data[13] = 0xFFFF;
        task->data[14] = 8;
    }
    else
    {
        task->data[13] = 1;
        task->data[14] = -8;
    }

    task->data[15] = GetAnimBattlerSpriteId(1);
    task->func = sub_80D16A0;
}

void sub_80D16A0(u8 taskId)
{
    struct Task* task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        gSprites[task->data[15]].pos2.x += task->data[14];
        task->data[1] = 0;
        task->data[2] = 0;
        task->data[3] = 0;
        task->data[0]++;
        break;
    case 1:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            task->data[2]++;
            if (task->data[2] & 1)
                gSprites[task->data[15]].pos2.x += 6;
            else
                gSprites[task->data[15]].pos2.x -= 6;

            if (++task->data[3] > 4)
            {
                if (task->data[2] & 1)
                    gSprites[task->data[15]].pos2.x -= 6;

                task->data[0]++;
            }
        }
        break;
    case 2:
        if (--task->data[12] != 0)
            task->data[0] = 0;
        else
            task->data[0]++;
        break;
    case 3:
        gSprites[task->data[15]].pos2.x += task->data[13];
        if (gSprites[task->data[15]].pos2.x == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

// espeed poke flicker in
void sub_80D17C4(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 1;
    task->data[13] = 14;
    task->data[14] = 2;
    task->data[15] = GetAnimBattlerSpriteId(0);
    task->func = sub_80D1808;
}

void sub_80D1808(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (task->data[0] == 0 && ++task->data[1] > task->data[4])
    {
        task->data[1] = 0;
        if (++task->data[2] & 1)
            gSprites[task->data[15]].invisible = 0;
        else
            gSprites[task->data[15]].invisible = 1;

        if (++task->data[3] >= task->data[13])
        {
            if (++task->data[4] < task->data[14])
            {
                task->data[1] = 0;
                task->data[2] = 0;
                task->data[3] = 0;
            }
            else
            {
                gSprites[task->data[15]].invisible = 0;
                DestroyAnimVisualTask(taskId);
            }
        }
    }
}

// espeed smoke flicker
void sub_80D18D4(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    task->data[0] = 0;
    task->data[1] = 4;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 0;
    task->data[5] = 0;
    task->data[6] = 0;
    task->data[7] = 0;
    task->data[8] = 0;
    task->data[13] = 0;
    task->data[14] = GetBattlerSpriteCoord(gAnimBankAttacker, 0);
    task->data[15] = GetBattlerSpriteCoord(gAnimBankAttacker, 1);
    task->func = sub_80D1930;
}

void sub_80D1930(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    switch (task->data[8])
    {
    case 0:
        if (++task->data[4] > 1)
        {
            task->data[4] = 0;
            task->data[5] = (task->data[5] + 1) & 1;
            if (++task->data[6] > 20)
            {
                if (task->data[7] == 0)
                {
                    task->data[6] = 0;
                    task->data[8] = 1;
                }
                else
                    task->data[8] = 2;
            }
        }
        break;
    case 1:
        task->data[5] = 0;
        if (++task->data[4] > 20)
        {
            task->data[7] = 1;
            task->data[8] = 0;
        }
        break;
    case 2:
        task->data[5] = 1;
        break;
    }

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] > 4)
        {
            u8 spriteId;
            task->data[1] = 0;
            spriteId = CreateSprite(&gSpriteTemplate_83D79E8, task->data[14], task->data[15], 0);
            if (spriteId != MAX_SPRITES)
            {
                gSprites[spriteId].data[0] = taskId;
                gSprites[spriteId].data[1] = 13;
                gSprites[spriteId].pos2.x = gUnknown_083D7A00[task->data[2]][0];
                gSprites[spriteId].pos2.y = gUnknown_083D7A00[task->data[2]][1];
                task->data[13]++;
                if (++task->data[2] > 3)
                {
                    task->data[2] = 0;
                    if (++task->data[3] > 5)
                        task->data[0]++;
                }
            }
        }
        break;
    case 1:
        if (task->data[13] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80D1A70(struct Sprite* sprite)
{
    sprite->invisible = gTasks[sprite->data[0]].data[5];
    if (sprite->animEnded)
    {
        gTasks[sprite->data[0]].data[sprite->data[1]]--;
        DestroySprite(sprite);
    }
}
