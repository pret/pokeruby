#include "global.h"
#include "battle_anim.h"
#include "main.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "constants/battle_constants.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gAnimVisualTaskCount;

extern const struct SpriteTemplate gSpriteTemplate_83D9938;
extern const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9950;
extern const struct SpriteTemplate gSpriteTemplate_83D99B8;
extern s8 gUnknown_083D9968[][2];

static void sub_80D6514(struct Sprite *sprite);
static void sub_80D672C(struct Sprite *sprite);
static void sub_80D6874(u8 taskId);
static void sub_80D6AF0(struct Sprite *sprite);
static void sub_80D6BB8(u8 taskId);
static void sub_80D6D00(struct Sprite *sprite);
static void sub_80D6E38(struct Sprite *sprite);


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

NAKED
static void sub_80D6874(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r10\n\
    mov r6, r9\n\
    mov r5, r8\n\
    push {r5-r7}\n\
    sub sp, 0x4\n\
    lsls r0, 24\n\
    lsrs r0, 24\n\
    mov r9, r0\n\
    movs r5, 0\n\
    movs r7, 0\n\
    ldr r1, _080D68B4 @ =gTasks\n\
    lsls r0, 2\n\
    add r0, r9\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    ldrb r2, [r0, 0xC]\n\
    str r2, [sp]\n\
    ldrh r4, [r0, 0x8]\n\
    ldrh r6, [r0, 0xA]\n\
    movs r3, 0xC\n\
    ldrsh r0, [r0, r3]\n\
    mov r10, r1\n\
    cmp r0, 0\n\
    bne _080D68B8\n\
    movs r0, 0\n\
    mov r8, r0\n\
    movs r2, 0x1\n\
    movs r1, 0x10\n\
    mov r12, r1\n\
    b _080D68C2\n\
    .align 2, 0\n\
_080D68B4: .4byte gTasks\n\
_080D68B8:\n\
    movs r2, 0x10\n\
    mov r12, r2\n\
    movs r3, 0x8\n\
    mov r8, r3\n\
    movs r2, 0x4\n\
_080D68C2:\n\
    mov r0, r9\n\
    lsls r1, r0, 2\n\
    adds r0, r1, r0\n\
    lsls r0, 3\n\
    add r0, r10\n\
    movs r3, 0x1C\n\
    ldrsh r0, [r0, r3]\n\
    mov r10, r1\n\
    cmp r0, 0xA\n\
    bhi _080D69B8\n\
    lsls r0, 2\n\
    ldr r1, _080D68E0 @ =_080D68E4\n\
    adds r0, r1\n\
    ldr r0, [r0]\n\
    mov pc, r0\n\
    .align 2, 0\n\
_080D68E0: .4byte _080D68E4\n\
    .align 2, 0\n\
_080D68E4:\n\
    .4byte _080D6910\n\
    .4byte _080D69B8\n\
    .4byte _080D6924\n\
    .4byte _080D69B8\n\
    .4byte _080D6944\n\
    .4byte _080D69B8\n\
    .4byte _080D695A\n\
    .4byte _080D69B8\n\
    .4byte _080D697C\n\
    .4byte _080D69B8\n\
    .4byte _080D69B0\n\
_080D6910:\n\
    ldr r0, _080D6920 @ =gSpriteTemplate_83D9938\n\
    lsls r1, r4, 16\n\
    asrs r1, 16\n\
    lsls r2, r6, 16\n\
    asrs r2, 16\n\
    mov r4, r12\n\
    lsls r3, r4, 16\n\
    b _080D6992\n\
    .align 2, 0\n\
_080D6920: .4byte gSpriteTemplate_83D9938\n\
_080D6924:\n\
    mov r0, r12\n\
    lsls r3, r0, 17\n\
    mov r1, r8\n\
    adds r0, r1, r2\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    mov r8, r0\n\
    ldr r0, _080D6940 @ =gSpriteTemplate_83D9938\n\
    lsls r1, r4, 16\n\
    asrs r1, 16\n\
    lsls r2, r6, 16\n\
    asrs r2, 16\n\
    b _080D6992\n\
    .align 2, 0\n\
_080D6940: .4byte gSpriteTemplate_83D9938\n\
_080D6944:\n\
    mov r3, r12\n\
    lsls r0, r3, 16\n\
    asrs r0, 16\n\
    lsls r3, r0, 1\n\
    adds r3, r0\n\
    lsls r0, r2, 1\n\
    add r0, r8\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    mov r8, r0\n\
    b _080D6986\n\
_080D695A:\n\
    mov r0, r12\n\
    lsls r3, r0, 18\n\
    lsls r0, r2, 1\n\
    adds r0, r2\n\
    add r0, r8\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    mov r8, r0\n\
    ldr r0, _080D6978 @ =gSpriteTemplate_83D9938\n\
    lsls r1, r4, 16\n\
    asrs r1, 16\n\
    lsls r2, r6, 16\n\
    asrs r2, 16\n\
    b _080D6992\n\
    .align 2, 0\n\
_080D6978: .4byte gSpriteTemplate_83D9938\n\
_080D697C:\n\
    mov r1, r12\n\
    lsls r0, r1, 16\n\
    asrs r0, 16\n\
    lsls r3, r0, 2\n\
    adds r3, r0\n\
_080D6986:\n\
    ldr r0, _080D69AC @ =gSpriteTemplate_83D9938\n\
    lsls r1, r4, 16\n\
    asrs r1, 16\n\
    lsls r2, r6, 16\n\
    asrs r2, 16\n\
    lsls r3, 16\n\
_080D6992:\n\
    asrs r3, 16\n\
    adds r2, r3\n\
    lsls r2, 16\n\
    asrs r2, 16\n\
    movs r3, 0x2\n\
    bl CreateSprite\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    adds r0, r7, 0x1\n\
    lsls r0, 24\n\
    lsrs r7, r0, 24\n\
    b _080D69B8\n\
    .align 2, 0\n\
_080D69AC: .4byte gSpriteTemplate_83D9938\n\
_080D69B0:\n\
    mov r0, r9\n\
    bl DestroyAnimVisualTask\n\
    b _080D69FC\n\
_080D69B8:\n\
    cmp r7, 0\n\
    beq _080D69EC\n\
    ldr r4, _080D6A0C @ =gSprites\n\
    lsls r3, r5, 4\n\
    adds r3, r5\n\
    lsls r3, 2\n\
    adds r0, r3, r4\n\
    ldrh r5, [r0, 0x4]\n\
    lsls r2, r5, 22\n\
    lsrs r2, 22\n\
    add r2, r8\n\
    ldr r6, _080D6A10 @ =0x000003ff\n\
    adds r1, r6, 0\n\
    ands r2, r1\n\
    ldr r1, _080D6A14 @ =0xfffffc00\n\
    ands r1, r5\n\
    orrs r1, r2\n\
    strh r1, [r0, 0x4]\n\
    mov r1, sp\n\
    ldrh r1, [r1]\n\
    strh r1, [r0, 0x2E]\n\
    adds r4, 0x1C\n\
    adds r3, r4\n\
    ldr r1, [r3]\n\
    bl _call_via_r1\n\
_080D69EC:\n\
    ldr r0, _080D6A18 @ =gTasks\n\
    mov r1, r10\n\
    add r1, r9\n\
    lsls r1, 3\n\
    adds r1, r0\n\
    ldrh r0, [r1, 0x1C]\n\
    adds r0, 0x1\n\
    strh r0, [r1, 0x1C]\n\
_080D69FC:\n\
    add sp, 0x4\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080D6A0C: .4byte gSprites\n\
_080D6A10: .4byte 0x000003ff\n\
_080D6A14: .4byte 0xfffffc00\n\
_080D6A18: .4byte gTasks\n\
    .syntax divided\n");
}

void sub_80D6A1C(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->oam.shape = 2;
        sprite->oam.size = 0;
    }
    else
    {
        sprite->oam.shape = 0;
        sprite->oam.size = 1;
    }

    if (++sprite->data[1] == 15)
        DestroySprite(sprite);
}

void sub_80D6A6C(struct Sprite *sprite)
{
    u8 spriteId;

    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    spriteId = CreateSprite(&gBattleAnimSpriteTemplate_83D9950, sprite->pos1.x + 32, sprite->pos1.y, sprite->subpriority);
    gSprites[spriteId].oam.tileNum += 8;
    gAnimVisualTaskCount++;
    gSprites[spriteId].callback = sub_80D6AF0;
    sprite->callback = sub_80D6AF0;
}

static void sub_80D6AF0(struct Sprite *sprite)
{
    if (++sprite->data[0] == 3)
    {
        sprite->data[0] = 0;
        sprite->invisible ^= 1;
    }

    if (++sprite->data[1] == 51)
        DestroyAnimSprite(sprite);
}

void sub_80D6B3C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (gBattleAnimArgs[0] == 0) 
    {
        task->data[14] = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
        task->data[15] = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    }
    else
    {
        task->data[14] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        task->data[15] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    }

    task->data[6] = gBattleAnimArgs[1];
    task->data[7] = 0;
    task->data[8] = 0;
    task->data[9] = 0;
    task->data[10] = 0;
    task->data[11] = gBattleAnimArgs[3];
    task->data[12] = 0;
    task->data[13] = gBattleAnimArgs[2];
    task->func = sub_80D6BB8;
}

static void sub_80D6BB8(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (task->data[6])
    {
        if (++task->data[12] > task->data[13])
        {
            u8 spriteId;
            task->data[12] = 0;
            spriteId = CreateSprite(&gSpriteTemplate_83D99B8, task->data[14], task->data[15], 2);
            if (spriteId != MAX_SPRITES)
            {
                struct Sprite *sprite = &gSprites[spriteId];
                sprite->pos1.x += gUnknown_083D9968[task->data[9]][0];
                sprite->pos1.y += gUnknown_083D9968[task->data[9]][1];

                sprite->data[0] = 40 - task->data[8] * 5;
                sprite->data[1] = sprite->pos1.x;
                sprite->data[2] = task->data[14];
                sprite->data[3] = sprite->pos1.y;
                sprite->data[4] = task->data[15];
                sprite->data[5] = taskId;

                InitAnimSpriteTranslationDeltas(sprite);
                StoreSpriteCallbackInData(sprite, sub_80D6D00);
                sprite->callback = sub_8078600;

                if (++task->data[9] > 15)
                    task->data[9] = 0;

                if (++task->data[10] >= task->data[11])
                {
                    task->data[10] = 0;
                    if (task->data[8] <= 5)
                        task->data[8]++;
                }

                task->data[7]++;
                task->data[6]--;
            }
        }
    }
    else
    {
        if (task->data[7] == 0)
        {
            DestroyAnimVisualTask(taskId);
        }
    }
}

static void sub_80D6CCC(struct Sprite *sprite)
{
    if (TranslateAnimSpriteByDeltas(sprite))
    {
        gTasks[sprite->data[5]].data[7]--;
        DestroySprite(sprite);
    }
}

static void sub_80D6D00(struct Sprite *sprite)
{
    StartSpriteAnim(sprite, 1);
    sprite->callback = sub_80D6CCC;
}

void sub_80D6D18(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    }

    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
    sprite->callback = sub_80785E4;
}

void sub_80D6D70(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    }
    else
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankTarget, 2);
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    }

    sprite->pos2.x = gBattleAnimArgs[1];
    sprite->pos2.y = gBattleAnimArgs[2];
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = sub_8078600;
}

void sub_80D6DD8(struct Sprite *sprite)
{
    StartSpriteAffineAnim(sprite, 1);
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    sprite->data[6] = GetAnimBattlerSpriteId(0);
    sprite->data[7] = 16;

    if (GetBattlerSide(gAnimBankAttacker) == B_SIDE_OPPONENT)
        sprite->data[7] *= -1;

    sprite->callback = sub_80D6E38;
}

static void sub_80D6E38(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        if (++sprite->data[1] > 40)
            sprite->data[0]++;
        break;
    case 1:
        sprite->pos1.x += sprite->data[7];
        gSprites[sprite->data[6]].pos2.x += sprite->data[7];
        if ((u16)(sprite->pos1.x + 80) > 400)
        {
            move_anim_8074EE0(sprite);
        }
        break;
    }
}

void sub_80D6E9C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[15] = GetAnimBattlerSpriteId(0);
        task->data[14] = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
        if (GetBattlerSide(gAnimBankAttacker) == B_SIDE_PLAYER)
        {
            task->data[14] = -32;
            task->data[13] = 2;
        }
        else
        {
            task->data[14] = 32;
            task->data[13] = -2;
        }

        gSprites[task->data[15]].pos2.x = task->data[14];
        task->data[0]++;
        break;
    case 1:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            gSprites[task->data[15]].invisible ^= 1;

            if (task->data[14])
            {
                task->data[14] += task->data[13];
                gSprites[task->data[15]].pos2.x = task->data[14];
            }
            else
            {
                task->data[0]++;
            }
        }
        break;
    case 2:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            gSprites[task->data[15]].invisible ^= 1;

            if (++task->data[2] == 8)
                task->data[0]++;
        }
        break;
    case 3:
        gSprites[task->data[15]].invisible = 0;
        DestroyAnimVisualTask(taskId);
        break;
    }
}
