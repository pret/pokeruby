#include "global.h"
#include "battle_anim.h"
#include "palette.h"
#include "rom_8077ABC.h"
#include "scanline_effect.h"
#include "sound.h"
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

static void sub_80DFE90(struct Sprite *sprite);
static void sub_80DFC9C(u8 taskId);
static void sub_80DFD58(u8 taskId);
static void sub_80DFF58(struct Sprite *sprite);
static void sub_80DFF98(struct Sprite *sprite);
static void sub_80E00D0(struct Sprite *sprite);
static void sub_80E02A4(u8 taskId);
static void sub_80E0620(u8 taskId);
void sub_80E08CC(u8 a);
void sub_80E079C(struct Task *task);


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
