#include "global.h"
#include "battle_anim.h"
#include "blend_palette.h"
#include "decompress.h"
#include "ewram.h"
#include "palette.h"
#include "rom_8077ABC.h"
#include "scanline_effect.h"
#include "sound.h"
#include "sprite.h"
#include "trig.h"
#include "constants/battle_constants.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u8 gObjectBankIDs[];
extern u16 gBattle_BG1_X;
extern u16 gBattle_BG1_Y;
extern u16 gBattle_BG2_X;
extern u16 gBattle_BG2_Y;
extern u16 gBattle_WIN0H;
extern u16 gBattle_WIN0V;
extern u16 gBattlePartyID[];
extern u8 gAnimMoveTurn;

extern const u8 gUnknown_08D1D574[];
extern const u8 gUnknown_08D1D410[];
extern const u16 gUnknown_08D1D54C[];

static void sub_80DFE90(struct Sprite *sprite);
static void sub_80DFC9C(u8 taskId);
static void sub_80DFD58(u8 taskId);
static void sub_80DFF58(struct Sprite *sprite);
static void sub_80DFF98(struct Sprite *sprite);
static void sub_80E00D0(struct Sprite *sprite);
static void sub_80E02A4(u8 taskId);
static void sub_80E0620(u8 taskId);
static void sub_80E08CC(u8 priority);
static void sub_80E079C(struct Task *task);
static void sub_80E0CD0(u8 taskId);


// used in Smoke Ball escape, Sky Attack, Feint Attack and Camouflage
void sub_80DFC24(u8 taskId)
{
    int bank;
    gTasks[taskId].data[0] = gBattleAnimArgs[0];
    bank = gAnimBankAttacker;
    gTasks[taskId].data[1] = 16;
    REG_BLDALPHA = 16;
    if (GetBankIdentity_permutated(bank) == 1)
        REG_BLDCNT = 0x3F42;
    else
        REG_BLDCNT = 0x3F44;
    gTasks[taskId].func = sub_80DFC9C;
}

static void sub_80DFC9C(u8 taskId)
{
    u8 r2 = gTasks[taskId].data[1] >> 8;
    u8 r1 = gTasks[taskId].data[1];
    if (gTasks[taskId].data[2] == (u8)gTasks[taskId].data[0])
    {
        r2++;
        r1--;
        gTasks[taskId].data[1] = (r2 << 8) | r1;
        REG_BLDALPHA = (r2 << 8) | r1;
        gTasks[taskId].data[2] = 0;
        if (r2 == 16)
        {
            gSprites[gObjectBankIDs[gAnimBankAttacker]].invisible = 1;
            DestroyAnimVisualTask(taskId);
        }
    }
    else
        gTasks[taskId].data[2]++;
}

void sub_80DFD24(u8 taskId)
{
    gTasks[taskId].data[0] = gBattleAnimArgs[0];
    gTasks[taskId].data[1] = 0x1000;
    gTasks[taskId].func = sub_80DFD58;
    REG_BLDALPHA = 0x1000;
}

void sub_80DFD58(u8 taskId)
{
    u8 r1 = gTasks[taskId].data[1] >> 8;
    u8 r5 = gTasks[taskId].data[1];
    if (gTasks[taskId].data[2] == (u8)gTasks[taskId].data[0])
    {
        r1--;
        r5++;
        gTasks[taskId].data[1] = (r1 << 8) | r5;
        REG_BLDALPHA = (r1 << 8) | r5;
        gTasks[taskId].data[2] = 0;
        if (r1 == 0)
        {
            REG_BLDCNT = 0;
            REG_BLDALPHA = 0;
            DestroyAnimVisualTask(taskId);
        }
    }
    else
        gTasks[taskId].data[2]++;
}

// unlike the above is only used in Feint Attack

void sub_80DFDC0(u8 taskId)
{
    REG_BLDALPHA = 0x1000;
    if (GetBankIdentity_permutated(gAnimBankAttacker) == 1)
        REG_BLDCNT = 0x3F42;
    else
        REG_BLDCNT = 0x3F44;
    DestroyAnimVisualTask(taskId);
}

// unused sprite template's callback

void sub_80DFE14(struct Sprite *sprite)
{
    sprite->data[1] = GetBankPosition(gAnimBankTarget, 2);
    sprite->data[2] = GetBankPosition(gAnimBankAttacker, 2);
    sprite->data[3] = GetBankPosition(gAnimBankTarget, 3);
    sprite->data[4] = GetBankPosition(gAnimBankAttacker, 3);
    sprite->data[0] = 0x7E;
    sub_8078A5C(sprite);
    sprite->data[3] = -sprite->data[1];
    sprite->data[4] = -sprite->data[2];
    sprite->data[6] = 0xFFD8;
    sprite->callback = sub_80DFE90;
    sub_80DFE90(sprite);
}

static void sub_80DFE90(struct Sprite *sprite)
{
    sprite->data[3] += sprite->data[1];
    sprite->data[4] += sprite->data[2];
    sprite->pos2.x = sprite->data[3] >> 8;
    sprite->pos2.y = sprite->data[4] >> 8;
    if (sprite->data[7] == 0)
    {
        sprite->data[3] += sprite->data[1];
        sprite->data[4] += sprite->data[2];
        sprite->pos2.x = sprite->data[3] >> 8;
        sprite->pos2.y = sprite->data[4] >> 8;
        sprite->data[0]--;
    }
    sprite->pos2.y += Sin(sprite->data[5], sprite->data[6]);
    sprite->data[5] = (sprite->data[5] + 3) & 0xFF;
    if (sprite->data[5] > 0x7F)
    {
        sprite->data[5] = 0;
        sprite->data[6] += 20;
        sprite->data[7]++;
    }
    if (--sprite->data[0] == 0)
        DestroyAnimSprite(sprite);
}

void sub_80DFF1C(struct Sprite *sprite)
{
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    StartSpriteAffineAnim(sprite, gBattleAnimArgs[2]);

    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = gBattleAnimArgs[4];
    sprite->data[2] = gBattleAnimArgs[5];
    sprite->callback = sub_80DFF58;
}

static void sub_80DFF58(struct Sprite *sprite)
{
    sprite->data[4] += sprite->data[0];
    sprite->data[5] += sprite->data[1];
    sprite->pos2.x = sprite->data[4] >> 8;
    sprite->pos2.y = sprite->data[5] >> 8;

    if (++sprite->data[3] == sprite->data[2])
        sprite->callback = sub_80DFF98;
}

static void sub_80DFF98(struct Sprite *sprite)
{
    sprite->data[4] -= sprite->data[0];
    sprite->data[5] -= sprite->data[1];
    sprite->pos2.x = sprite->data[4] >> 8;
    sprite->pos2.y = sprite->data[5] >> 8;

    if (--sprite->data[3] == 0)
        move_anim_8074EE0(sprite);
}

void sub_80DFFD0(struct Sprite *sprite)
{
    u8 bank;
    s8 xOffset;

    if (gBattleAnimArgs[0] == 0)
        bank = gAnimBankAttacker;
    else
        bank = gAnimBankTarget;

    xOffset = 20;
    sprite->oam.tileNum += 4;

    switch (gBattleAnimArgs[1])
    {
    case 0:
        sprite->pos1.x = sub_807A100(bank, 5) - 8;
        sprite->pos1.y = sub_807A100(bank, 2) + 8;
        break;
    case 1:
        sprite->pos1.x = sub_807A100(bank, 5) - 14;
        sprite->pos1.y = sub_807A100(bank, 2) + 16;
        break;
    case 2:
        sprite->pos1.x = sub_807A100(bank, 4) + 8;
        sprite->pos1.y = sub_807A100(bank, 2) + 8;
        StartSpriteAffineAnim(sprite, 1);
        xOffset = -20;
        break;
    case 3:
        sprite->pos1.x = sub_807A100(bank, 4) + 14;
        sprite->pos1.y = sub_807A100(bank, 2) + 16;
        StartSpriteAffineAnim(sprite, 1);
        xOffset = -20;
        break;
    }

    sprite->data[0] = 32;
    sprite->data[2] = sprite->pos1.x + xOffset;
    sprite->data[4] = sprite->pos1.y + 12;
    sprite->data[5] = -12;

    sub_80786EC(sprite);
    sprite->callback = sub_80E00D0;
}

static void sub_80E00D0(struct Sprite *sprite)
{
    if (sub_8078718(sprite))
        move_anim_8074EE0(sprite);
}

void sub_80E00EC(u8 taskId)
{
    struct ScanlineEffectParams scanlineParams;
    struct Struct_sub_8078914 subStruct;
    u16 i;
    u8 pos;
    int var0;
    struct Task *task = &gTasks[taskId];

    task->data[7] = GetBankPosition(gAnimBankAttacker, 1) + 31;
    task->data[6] = sub_807A100(gAnimBankAttacker, 2) - 7;
    task->data[5] = task->data[7];
    task->data[4] = task->data[6];
    task->data[13] = (task->data[7] - task->data[6]) << 8;

    pos = GetBankPosition(gAnimBankAttacker, 0);
    task->data[14] = pos - 32;
    task->data[15] = pos + 32;

    if (GetBankSide(gAnimBankAttacker) == SIDE_PLAYER)
        task->data[8] = -12;
    else
        task->data[8] = -64;

    task->data[3] = GetBankIdentity_permutated(gAnimBankAttacker);
    if (task->data[3] == 1)
    {
        sub_8078914(&subStruct);
        task->data[10] = gBattle_BG1_Y;
        REG_BLDCNT = 0x3F42;
        FillPalette(0, subStruct.field_8 << 4, 32);
        scanlineParams.dmaDest = &REG_BG1VOFS;
        var0 = 2;

        if (!IsContest())
            gBattle_BG2_X += 240;
    }
    else
    {
        task->data[10] = gBattle_BG2_Y;
        REG_BLDCNT = 0x3F44;
        FillPalette(0, 144, 32);
        scanlineParams.dmaDest = &REG_BG2VOFS;
        var0 = 4;

        if (!IsContest())
            gBattle_BG1_X += 240;
    }

    scanlineParams.dmaControl = 0xA2600001;
    scanlineParams.initState = 1;
    scanlineParams.unused9 = 0;
    task->data[11] = 0;
    task->data[12] = 16;
    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;

    sub_80E08CC(3);

    for (i = 0; i < 112; i++)
    {
        gScanlineEffectRegBuffers[0][i] = task->data[10];
        gScanlineEffectRegBuffers[1][i] = task->data[10];
    }

    ScanlineEffect_SetParams(scanlineParams);

    REG_WINOUT = 0x3F00 | (var0 ^ 0x3F);
    REG_WININ = 0x3F3F;
    gBattle_WIN0H = (task->data[14] << 8) | task->data[15];
    gBattle_WIN0V = 160;

    task->func = sub_80E02A4;
}

static void sub_80E02A4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            if (++task->data[2] & 1)
            {
                if (task->data[11] != 12)
                    task->data[11]++;
            }
            else
            {
                if (task->data[12] != 8)
                    task->data[12]--;
            }

            REG_BLDALPHA = (task->data[12] << 8) | task->data[11];

            if (task->data[11] == 12 && task->data[12] == 8)
                task->data[0]++;
        }
        break;
    case 1:
        task->data[4] -= 8;
        sub_80E079C(task);

        if (task->data[4] < task->data[8])
            task->data[0]++;
        break;
    case 2:
        task->data[4] -= 8;
        sub_80E079C(task);
        task->data[14] += 4;
        task->data[15] -= 4;

        if (task->data[14] >= task->data[15])
            task->data[14] = task->data[15];

        gBattle_WIN0H = (task->data[14] << 8) | task->data[15];

        if (task->data[14] == task->data[15])
            task->data[0]++;
        break;
    case 3:
        gScanlineEffect.state = 3;
        task->data[0]++;
        break;
    case 4:
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80E03BC(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;
    struct ScanlineEffectParams scanlineParams;
    u8 pos;
    u16 i;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        if (IsContest() == TRUE)
        {
            gBattle_WIN0H = 0;
            gBattle_WIN0V = 0;
            REG_WININ = 0x3F3F;
            REG_WINOUT = 0x3F3F;
            DestroyAnimVisualTask(taskId);
        }
        else
        {
            task->data[3] = GetBankIdentity_permutated(gAnimBankTarget);
            if (task->data[3] == 1)
            {
                REG_BLDCNT = 0x3F42;
                gBattle_BG2_X += 240;
            }
            else
            {
                REG_BLDCNT = 0x3F44;
                gBattle_BG1_X += 240;
            }

            task->data[0]++;
        }
        break;
    case 1:
        if (task->data[3] == 1)
        {
            sub_8078914(&subStruct);
            task->data[10] = gBattle_BG1_Y;
            FillPalette(0, subStruct.field_8 << 4, 32);
        }
        else
        {
            task->data[10] = gBattle_BG2_Y;
            FillPalette(0, 144, 32);
        }

        sub_80E08CC(3);
        task->data[0]++;
        break;
    case 2:
        task->data[7] = GetBankPosition(gAnimBankTarget, 1) + 31;
        task->data[6] = sub_807A100(gAnimBankTarget, 2) - 7;
        task->data[13] = (task->data[7] - task->data[6]) << 8;
        pos = GetBankPosition(gAnimBankTarget, 0);
        task->data[14] = pos - 4;
        task->data[15] = pos + 4;

        if (GetBankSide(gAnimBankTarget) == SIDE_PLAYER)
            task->data[8] = -12;
        else
            task->data[8] = -64;

        task->data[4] = task->data[8];
        task->data[5] = task->data[8];
        task->data[11] = 12;
        task->data[12] = 8;
        task->data[0]++;
        break;
    case 3:
        if (task->data[3] == 1)
            scanlineParams.dmaDest = &REG_BG1VOFS;
        else
            scanlineParams.dmaDest = &REG_BG2VOFS;

        for (i = 0; i < 112; i++)
        {
            gScanlineEffectRegBuffers[0][i] = task->data[10] + (159 - i);
            gScanlineEffectRegBuffers[1][i] = task->data[10] + (159 - i);
        }

        scanlineParams.dmaControl = 0xA2600001;
        scanlineParams.initState = 1;
        scanlineParams.unused9 = 0;
        ScanlineEffect_SetParams(scanlineParams);
        task->data[0]++;
        break;
    case 4:
        if (task->data[3] == 1)
            REG_WINOUT = 0x3F3D;
        else
            REG_WINOUT = 0x3F3B;

        REG_WININ = 0x3F3F;
        gBattle_WIN0H = (task->data[14] << 8) | task->data[15];
        gBattle_WIN0V = 160;

        task->data[0] = 0;
        task->data[1] = 0;
        task->data[2] = 0;
        REG_BLDALPHA = 0x80C;
        task->func = sub_80E0620;
        break;
    }
}

static void sub_80E0620(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[5] += 8;
        if (task->data[5] >= task->data[7])
            task->data[5] = task->data[7];

        sub_80E079C(task);

        if (task->data[5] == task->data[7])
            task->data[0]++;
        break;
    case 1:
        if (task->data[15] - task->data[14] < 64)
        {
            task->data[14] -= 4;
            task->data[15] += 4;
        }
        else
        {
            task->data[1] = 1;
        }

        gBattle_WIN0H = (task->data[14] << 8) | task->data[15];
        task->data[4] += 8;

        if (task->data[4] >= task->data[6])
            task->data[4] = task->data[6];

        sub_80E079C(task);

        if (task->data[4] == task->data[6] && task->data[1] != 0)
        {
            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 2:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            if ((++task->data[2] & 1) != 0)
            {
                if (task->data[11] != 0)
                    task->data[11]--;
            }
            else
            {
                if (task->data[12] < 16)
                    task->data[12]++;
            }

            REG_BLDALPHA = (task->data[12] << 8) | task->data[11];

            if (task->data[11] == 0 && task->data[12] == 16)
                task->data[0]++;
        }
        break;
    case 3:
        gScanlineEffect.state = 3;
        task->data[0]++;
        break;
    case 4:
        gBattle_WIN0H = 0;
        gBattle_WIN0V = 0;
        REG_WININ = 0x3F3F;
        REG_WINOUT = 0x3F3F;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

// static void sub_80E079C(struct Task *task)
// {
//     int var0, var1;
//     s16 var2;
//     s16 i, j;

//     var2 = task->data[5] - task->data[4];
//     if (var2 != 0)
//     {
//         var0 = task->data[13] / var2;
//         var1 = task->data[6];

//         for (i = 0; i < task->data[4]; i++)
//         {
//             gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = task->data[10] - (i - 159);
//         }

//         for (i = task->data[4]; i <= task->data[5]; i++)
//         {
//             if (i >= 0)
//             {
//                 gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][i] = (var1 - i) + task->data[10];
//             }

//             var1 += var0;
//         }

//         for (j = i; j < task->data[7]; j++)
//         {
//             if (j >= 0)
//             {
//                 gScanlineEffectRegBuffers[gScanlineEffect.srcBuffer][j] = (task->data[10] + 159) - j;
//             }
//         }
//     }
//     else
//     {
//         for (i = 0; i < 112; i++)
//         {
//             gScanlineEffectRegBuffers[0][i] = task->data[10] + 159 - i;
//             gScanlineEffectRegBuffers[1][i] = task->data[10] + 159 - i;
//         }
//     }
// }

__attribute__((naked))
static void sub_80E079C(struct Task *task)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    mov r7, r8\n\
    push {r7}\n\
    adds r6, r0, 0\n\
    ldrh r0, [r6, 0x12]\n\
    ldrh r4, [r6, 0x10]\n\
    subs r0, r4\n\
    lsls r0, 16\n\
    asrs r1, r0, 16\n\
    cmp r1, 0\n\
    beq _080E0890\n\
    movs r2, 0x22\n\
    ldrsh r0, [r6, r2]\n\
    bl __divsi3\n\
    mov r8, r0\n\
    movs r3, 0x14\n\
    ldrsh r0, [r6, r3]\n\
    lsls r5, r0, 8\n\
    lsls r0, r4, 16\n\
    movs r4, 0\n\
    cmp r0, 0\n\
    ble _080E07FC\n\
    ldr r0, _080E0888 @ =gScanlineEffectRegBuffers\n\
    mov r12, r0\n\
    ldr r7, _080E088C @ =gScanlineEffect\n\
_080E07D0:\n\
    lsls r2, r4, 16\n\
    asrs r2, 16\n\
    lsls r3, r2, 1\n\
    ldrb r1, [r7, 0x14]\n\
    lsls r0, r1, 4\n\
    subs r0, r1\n\
    lsls r0, 7\n\
    adds r3, r0\n\
    add r3, r12\n\
    adds r1, r2, 0\n\
    subs r1, 0x9F\n\
    ldrh r0, [r6, 0x1C]\n\
    subs r0, r1\n\
    strh r0, [r3]\n\
    adds r2, 0x1\n\
    lsls r2, 16\n\
    lsrs r4, r2, 16\n\
    asrs r2, 16\n\
    movs r1, 0x10\n\
    ldrsh r0, [r6, r1]\n\
    cmp r2, r0\n\
    blt _080E07D0\n\
_080E07FC:\n\
    ldrh r4, [r6, 0x10]\n\
    lsls r3, r4, 16\n\
    asrs r1, r3, 16\n\
    movs r2, 0x12\n\
    ldrsh r0, [r6, r2]\n\
    cmp r1, r0\n\
    bgt _080E0846\n\
    ldr r0, _080E0888 @ =gScanlineEffectRegBuffers\n\
    mov r12, r0\n\
    ldr r7, _080E088C @ =gScanlineEffect\n\
_080E0810:\n\
    asrs r4, r3, 16\n\
    cmp r4, 0\n\
    blt _080E0832\n\
    asrs r1, r5, 8\n\
    subs r1, r4\n\
    lsls r3, r4, 1\n\
    ldrb r2, [r7, 0x14]\n\
    lsls r0, r2, 4\n\
    subs r0, r2\n\
    lsls r0, 7\n\
    adds r3, r0\n\
    add r3, r12\n\
    lsls r1, 16\n\
    asrs r1, 16\n\
    ldrh r2, [r6, 0x1C]\n\
    adds r1, r2\n\
    strh r1, [r3]\n\
_080E0832:\n\
    add r5, r8\n\
    adds r0, r4, 0x1\n\
    lsls r0, 16\n\
    lsrs r4, r0, 16\n\
    lsls r3, r4, 16\n\
    asrs r1, r3, 16\n\
    movs r2, 0x12\n\
    ldrsh r0, [r6, r2]\n\
    cmp r1, r0\n\
    ble _080E0810\n\
_080E0846:\n\
    movs r3, 0x1C\n\
    ldrsh r0, [r6, r3]\n\
    adds r0, 0x9F\n\
    lsls r2, r4, 16\n\
    asrs r1, r2, 16\n\
    subs r5, r0, r1\n\
    movs r3, 0x16\n\
    ldrsh r0, [r6, r3]\n\
    cmp r1, r0\n\
    bge _080E08BE\n\
    ldr r7, _080E0888 @ =gScanlineEffectRegBuffers\n\
    ldr r4, _080E088C @ =gScanlineEffect\n\
_080E085E:\n\
    asrs r3, r2, 16\n\
    cmp r3, 0\n\
    blt _080E0876\n\
    lsls r2, r3, 1\n\
    ldrb r1, [r4, 0x14]\n\
    lsls r0, r1, 4\n\
    subs r0, r1\n\
    lsls r0, 7\n\
    adds r2, r0\n\
    adds r2, r7\n\
    strh r5, [r2]\n\
    subs r5, 0x1\n\
_080E0876:\n\
    adds r0, r3, 0x1\n\
    lsls r2, r0, 16\n\
    asrs r1, r2, 16\n\
    movs r3, 0x16\n\
    ldrsh r0, [r6, r3]\n\
    cmp r1, r0\n\
    blt _080E085E\n\
    b _080E08BE\n\
    .align 2, 0\n\
_080E0888: .4byte gScanlineEffectRegBuffers\n\
_080E088C: .4byte gScanlineEffect\n\
_080E0890:\n\
    movs r1, 0x1C\n\
    ldrsh r0, [r6, r1]\n\
    adds r5, r0, 0\n\
    adds r5, 0x9F\n\
    movs r4, 0\n\
    ldr r3, _080E08C8 @ =gScanlineEffectRegBuffers\n\
    movs r2, 0xF0\n\
    lsls r2, 3\n\
    adds r6, r3, r2\n\
_080E08A2:\n\
    lsls r0, r4, 16\n\
    asrs r0, 16\n\
    lsls r2, r0, 1\n\
    adds r1, r2, r3\n\
    strh r5, [r1]\n\
    adds r2, r6\n\
    strh r5, [r2]\n\
    subs r5, 0x1\n\
    adds r0, 0x1\n\
    lsls r0, 16\n\
    lsrs r4, r0, 16\n\
    asrs r0, 16\n\
    cmp r0, 0x6F\n\
    ble _080E08A2\n\
_080E08BE:\n\
    pop {r3}\n\
    mov r8, r3\n\
    pop {r4-r7}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080E08C8: .4byte gScanlineEffectRegBuffers\n\
    .syntax divided\n");
}

static void sub_80E08CC(u8 priority)
{
    u16 i;

    for (i = 0; i < 4; i++)
    {
        u8 spriteId = GetAnimBankSpriteId(i);
        if (spriteId != 0xFF)
            gSprites[spriteId].oam.priority = priority;
    }
}

void sub_80E0918(u8 taskId)
{
    u8 toBG2 = GetBankIdentity_permutated(gAnimBankAttacker) ^ 1 ? 1 : 0;
    sub_8076034(gAnimBankAttacker, toBG2);
    gSprites[gObjectBankIDs[gAnimBankAttacker]].invisible = 0;

    if (IsAnimBankSpriteVisible(gAnimBankAttacker ^ 2))
    {
        sub_8076034(gAnimBankAttacker ^ 2, toBG2 ^ 1);
        gSprites[gObjectBankIDs[gAnimBankAttacker ^ 2]].invisible = 0;
    }

    DestroyAnimVisualTask(taskId);
}

void sub_80E09C4(u8 taskId)
{
    u8 toBG2 = GetBankIdentity_permutated(gAnimBankAttacker) ^ 1 ? 1 : 0;
    sub_8076464(toBG2);

    if (IsAnimBankSpriteVisible(gAnimBankAttacker ^ 2))
        sub_8076464(toBG2 ^ 1);

    DestroyAnimVisualTask(taskId);
}

void sub_80E0A10(struct Sprite *sprite)
{
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];
    StartSpriteAnim(sprite, gBattleAnimArgs[2]);
    sprite->callback = sub_8078600;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

void sub_80E0A4C(u8 taskId)
{
    u16 species;
    u8 spriteId;
    u8 newSpriteId;
    u16 paletteNum;
    struct Struct_sub_8078914 subStruct;
    int var0 = 0;

    gBattle_WIN0H = var0;
    gBattle_WIN0V = var0;
    REG_WININ = 0x3F3F;
    REG_WINOUT = 0x3F3D;
    REG_DISPCNT |= DISPCNT_OBJWIN_ON;
    REG_BLDCNT = 0x3F42;
    REG_BLDALPHA = 0xC08;
    REG_BG1CNT_BITFIELD.priority = 0;
    REG_BG1CNT_BITFIELD.screenSize = 0;
    if (!IsContest())
        REG_BG1CNT_BITFIELD.charBaseBlock = 1;

    if (IsDoubleBattle() && !IsContest())
    {
        if (GetBankIdentity(gAnimBankAttacker) == 3 || GetBankIdentity(gAnimBankAttacker) == 0)
        {
            if (IsAnimBankSpriteVisible(gAnimBankAttacker ^ 2) == TRUE)
            {
                gSprites[gObjectBankIDs[gAnimBankAttacker ^ 2]].oam.priority--;
                REG_BG1CNT_BITFIELD.priority = 1;
                var0 = 1;
            }
        }
    }

    if (IsContest())
    {
        species = EWRAM_19348;
    }
    else
    {
        if (GetBankSide(gAnimBankAttacker) != SIDE_PLAYER)
            species = GetMonData(&gEnemyParty[gBattlePartyID[gAnimBankAttacker]], MON_DATA_SPECIES);
        else
            species = GetMonData(&gPlayerParty[gBattlePartyID[gAnimBankAttacker]], MON_DATA_SPECIES);
    }

    spriteId = GetAnimBankSpriteId(0);
    newSpriteId = sub_807A4A0(gAnimBankAttacker, spriteId, species);

    sub_8078914(&subStruct);
    DmaClear32(3, subStruct.field_4, 0x1000);
    LZDecompressVram(&gUnknown_08D1D574, subStruct.field_4);
    LZDecompressVram(&gUnknown_08D1D410, subStruct.field_0);
    LoadCompressedPalette(&gUnknown_08D1D54C, subStruct.field_8 << 4, 32);

    gBattle_BG1_X = -gSprites[spriteId].pos1.x + 96;
    gBattle_BG1_Y = -gSprites[spriteId].pos1.y + 32;
    paletteNum = 16 + gSprites[spriteId].oam.paletteNum;

    if (gBattleAnimArgs[1]  == 0)
        sub_8079108(paletteNum, FALSE);
    else
        BlendPalette(paletteNum * 16, 16, 11, gBattleAnimArgs[2]);

    gTasks[taskId].data[0] = newSpriteId;
    gTasks[taskId].data[1] = gBattleAnimArgs[0];
    gTasks[taskId].data[2] = gBattleAnimArgs[1];
    gTasks[taskId].data[3] = gBattleAnimArgs[2];
    gTasks[taskId].data[6] = var0;
    gTasks[taskId].func = sub_80E0CD0;
}

static void sub_80E0CD0(u8 taskId)
{
    struct Struct_sub_8078914 subStruct;
    u16 paletteNum;
    u8 spriteId;
    u8 taskIdCopy = taskId;

    gTasks[taskIdCopy].data[10] += 4;
    gBattle_BG1_X -= 4;

    if (gTasks[taskIdCopy].data[10] == 128)
    {
        gTasks[taskIdCopy].data[10] = 0;
        gBattle_BG1_X += 128;

        if (++gTasks[taskIdCopy].data[11] == 2)
        {
            sub_8076464(0);
            gBattle_WIN0H = 0;
            gBattle_WIN0V = 0;
            REG_WININ = 0x3F3F;
            REG_WINOUT = 0x3F3F;

            if (!IsContest())
                REG_BG1CNT_BITFIELD.charBaseBlock = 0;

            REG_DISPCNT ^= DISPCNT_OBJWIN_ON;
            REG_BLDCNT = 0;
            REG_BLDALPHA = 0;

            spriteId = GetAnimBankSpriteId(0);
            paletteNum = 16 + gSprites[spriteId].oam.paletteNum;
            if (gTasks[taskIdCopy].data[1] == 0)
                sub_8079108(paletteNum, 1);

            DestroySprite(&gSprites[gTasks[taskIdCopy].data[0]]);
            sub_8078914(&subStruct);
            DmaClear32(3, subStruct.field_4, 0x800);

            if (gTasks[taskIdCopy].data[6] == 1)
            {
                gSprites[gObjectBankIDs[gAnimBankAttacker ^ 2]].oam.priority++;
            }
            
            DestroyAnimVisualTask(taskIdCopy);
        }
    }
}

void sub_80E0E24(u8 taskId)
{
    u8 spriteId;
    u8 bank;
    bool8 calcSpriteId = FALSE;
    u8 identity = 0;

    switch (gBattleAnimArgs[0])
    {
    case 0:
    case 1:
    case 2:
    case 3:
        spriteId = GetAnimBankSpriteId(gBattleAnimArgs[0]);
        break;
    case 4:
        identity = IDENTITY_PLAYER_MON1;
        calcSpriteId = TRUE;
        break;
    case 5:
        identity = IDENTITY_PLAYER_MON2;
        calcSpriteId = TRUE;
        break;
    case 6:
        identity = IDENTITY_OPPONENT_MON1;
        calcSpriteId = TRUE;
        break;
    case 7:
        identity = IDENTITY_OPPONENT_MON2;
        calcSpriteId = TRUE;
        break;
    default:
        spriteId = 0xFF;
        break;
    }

    if (calcSpriteId)
    {
        bank = GetBankByIdentity(identity);
        if (IsAnimBankSpriteVisible(bank))
            spriteId = gObjectBankIDs[bank];
        else
            spriteId = 0xFF;
    }

    if (spriteId != 0xFF)
        sub_8079108(gSprites[spriteId].oam.paletteNum + 16, gBattleAnimArgs[1]);

    DestroyAnimVisualTask(taskId);
}

void sub_80E0EE8(u8 taskId)
{
    if (gAnimMoveTurn < 2)
        gBattleAnimArgs[7] = 0;

    if (gAnimMoveTurn == 2)
        gBattleAnimArgs[7] = 1;

    DestroyAnimVisualTask(taskId);
}
