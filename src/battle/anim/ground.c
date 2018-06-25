#include "global.h"
#include "battle.h"
#include "battle_anim.h"
#include "scanline_effect.h"
#include "random.h"
#include "rom_8077ABC.h"
#include "task.h"
#include "trig.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern u16 gBattle_BG1_X;
extern u16 gBattle_BG1_Y;
extern u16 gBattle_BG2_X;
extern u16 gBattle_BG2_Y;
extern u16 gBattle_BG3_X;
extern u16 gBattle_BG3_Y;
extern u16 gAnimMovePower;
extern u8 gBankSpriteIds[];

static void sub_80E0F1C(struct Sprite *sprite);
static void sub_80E0F84(struct Sprite *sprite);
static void sub_80E0FE8(struct Sprite *sprite);
static void sub_80E1004(struct Sprite *sprite);
static void sub_80E1078(struct Sprite *sprite);
static void sub_80E1108(struct Sprite *sprite);
static void sub_80E1198(struct Sprite *sprite);
static void sub_80E11D4(struct Sprite *sprite);
static void sub_80E1284(u8 taskId);
static void sub_80E1668(u8, s16, s16);
static void sub_80E143C(u8 taskId);
static void sub_80E14DC(u8 taskId);
static void sub_80E1560(u8 taskId);
static void sub_80E1728(struct Sprite *sprite);
static void sub_80E17B0(struct Sprite *sprite);
static void sub_80E17CC(struct Sprite *sprite);
static void sub_80E1934(u8 taskId);
static void sub_80E1A2C(u8 taskId);
static void sub_80E1B10(struct Task *task);
static void sub_80E1C58(u8 taskId);

const union AffineAnimCmd gSpriteAffineAnim_83DB2A0[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 15, 1),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd gSpriteAffineAnim_83DB2B0[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 20, 1),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DB2C0[] =
{
    gSpriteAffineAnim_83DB2A0,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83DB2C4[] =
{
    gSpriteAffineAnim_83DB2B0,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB2C8 =
{
    .tileTag = 10000,
    .paletteTag = 10000,
    .oam = &gOamData_837DF94,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB2C0,
    .callback = sub_80E0F1C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB2E0 =
{
    .tileTag = 10000,
    .paletteTag = 10000,
    .oam = &gOamData_837DF94,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83DB2C4,
    .callback = sub_80E1004,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB2F8 =
{
    .tileTag = 10074,
    .paletteTag = 10074,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E1078,
};

const union AnimCmd gSpriteAnim_83DB310[] =
{
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83DB318[] =
{
    gSpriteAnim_83DB310,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB31C =
{
    .tileTag = 10074,
    .paletteTag = 10074,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83DB318,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E1078,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB334 =
{
    .tileTag = 10074,
    .paletteTag = 10074,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E1108,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB34C =
{
    .tileTag = 10074,
    .paletteTag = 10074,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E1728,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83DB364 =
{
    .tileTag = 10281,
    .paletteTag = 10281,
    .oam = &gOamData_837DF54,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80E17CC,
};

static void sub_80E0F1C(struct Sprite *sprite)
{
    sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
    sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
    sprite->data[0] = 20;
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    sprite->data[5] = -40;
    InitAnimSpriteTranslationOverDuration(sprite);
    sprite->callback = sub_80E0F84;
}

static void sub_80E0F84(struct Sprite *sprite)
{
    if (TranslateAnimSpriteLinearAndSine(sprite))
    {
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;
        sprite->data[0] = 20;
        sprite->data[2] = GetBattlerSpriteCoord(gAnimBankAttacker, 2);
        sprite->data[4] = GetBattlerSpriteCoord(gAnimBankAttacker, 3);
        sprite->data[5] = 40;
        InitAnimSpriteTranslationOverDuration(sprite);
        sprite->callback = sub_80E0FE8;
    }
}

static void sub_80E0FE8(struct Sprite *sprite)
{
    if (TranslateAnimSpriteLinearAndSine(sprite))
        DestroyAnimSprite(sprite);
}

static void sub_80E1004(struct Sprite *sprite)
{
    sub_8078764(sprite, 1);
    if (GetBattlerSide(gAnimBankAttacker) != B_SIDE_PLAYER)
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    
    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = GetBattlerSpriteCoord(gAnimBankTarget, 2) + gBattleAnimArgs[2];
    sprite->data[4] = GetBattlerSpriteCoord(gAnimBankTarget, 3) + gBattleAnimArgs[3];
    sprite->callback = StartTranslateAnimSpriteByDeltas;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}

static void sub_80E1078(struct Sprite *sprite)
{
    u8 targetXPos, targetYPos;
    s16 xOffset, yOffset;

    InitAnimSpritePos(sprite, 1);

    targetXPos = sub_8077EE4(gAnimBankTarget, 2);
    targetYPos = sub_8077EE4(gAnimBankTarget, 3);

    xOffset = Random() & 0x1F;
    yOffset = Random() & 0x1F;
    if (xOffset > 16)
        xOffset = 16 - xOffset;
    if (yOffset > 16)
        yOffset = 16 - yOffset;

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[2] = targetXPos + xOffset;
    sprite->data[4] = targetYPos + yOffset;
    sprite->callback = StartTranslateAnimSpriteByDeltas;
    StoreSpriteCallbackInData(sprite, move_anim_8074EE0);
}

static void sub_80E1108(struct Sprite *sprite)
{
    sprite->oam.tileNum++;
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->pos1.x = GetBattlerSpriteCoord(gAnimBankAttacker, 2) + gBattleAnimArgs[1];
        sprite->pos1.y = GetBattlerSpriteCoord(gAnimBankAttacker, 3) + gBattleAnimArgs[2];
        sprite->data[0] = gBattleAnimArgs[1] > 0 ? 1 : -1;
        sprite->callback = sub_80E1198;
    }
    else
    {
        sprite->pos1.x = gBattleAnimArgs[1];
        sprite->pos1.y = gBattleAnimArgs[2];
        sprite->pos2.y = -gBattleAnimArgs[2];
        sprite->callback = sub_80E11D4;
    }
}

static void sub_80E1198(struct Sprite *sprite)
{
    if (++sprite->data[1] > 1)
    {
        sprite->data[1] = 0;
        sprite->pos1.x += sprite->data[0];
    }

    sprite->pos1.y -= 4;
    if (sprite->pos1.y < -4)
        DestroyAnimSprite(sprite);
}

static void sub_80E11D4(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->pos2.y += 4;
        if (sprite->pos2.y >= 0)
        {
            sprite->pos2.y = 0;
            sprite->data[0]++;
        }
        break;
    case 1:
        if (++sprite->data[1] > 0)
        {
            sprite->data[1] = 0;
            sprite->invisible ^= 1;
            if (++sprite->data[2] == 10)
                DestroyAnimSprite(sprite);
        }
        break;
    }
}

void sub_80E1244(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (gBattleAnimArgs[0] == 0)
        task->func = sub_80E1284;
    else
        task->func = sub_80E143C;

    task->func(taskId);
}

static void sub_80E1284(u8 taskId)
{
    u8 var0;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[10] = GetAnimBattlerSpriteId(0);
        task->data[11] = GetBattlerPosition_permutated(gAnimBankAttacker);
        if (task->data[11] == 1)
        {
            task->data[12] = gBattle_BG1_X;
            task->data[13] = gBattle_BG1_Y;
        }
        else
        {
            task->data[12] = gBattle_BG2_X;
            task->data[13] = gBattle_BG2_Y;
        }

        var0 = sub_8077FC0(gAnimBankAttacker);
        task->data[14] = var0 - 32;
        task->data[15] = var0 + 32;
        if (task->data[14] < 0)
            task->data[14] = 0;

        gSprites[task->data[10]].invisible = 1;
        task->data[0]++;
        break;
    case 1:
        sub_80E1668(task->data[11], task->data[14], task->data[15]);
        task->data[0]++;
        break;
    case 2:
        task->data[2] = (task->data[2] + 6) & 0x7F;
        if (++task->data[4] > 2)
        {
            task->data[4] = 0;
            task->data[3]++;
        }

        task->data[5] = task->data[3] + (gSineTable[task->data[2]] >> 4);
        if (task->data[11] == 1)
            gBattle_BG1_Y = task->data[13] - task->data[5];
        else
            gBattle_BG2_Y = task->data[13] - task->data[5];

        if (task->data[5] > 63)
        {
            task->data[5] = 120 - task->data[14];
            if (task->data[11] == 1)
                gBattle_BG1_Y = task->data[13] - task->data[5];
            else
                gBattle_BG2_Y = task->data[13] - task->data[5];

            gSprites[task->data[10]].pos2.x = 272 - gSprites[task->data[10]].pos1.x;
            task->data[0]++;
        }
        break;
    case 3:
        gScanlineEffect.state = 3;
        task->data[0]++;
        break;
    case 4:
        DestroyAnimVisualTask(taskId);
        gSprites[task->data[10]].invisible = 1;
        break;
    }
}

static void sub_80E143C(u8 taskId)
{
    u8 spriteId = GetAnimBattlerSpriteId(0);
    gSprites[spriteId].invisible = 1;
    gSprites[spriteId].pos2.x = 0;
    gSprites[spriteId].pos2.y = 0;

    if (GetBattlerPosition_permutated(gAnimBankAttacker) == 1)
        gBattle_BG1_Y = 0;
    else
        gBattle_BG2_Y = 0;

    DestroyAnimVisualTask(taskId);
}

void sub_80E149C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (gBattleAnimArgs[0] == 0)
        task->func = sub_80E14DC;
    else
        task->func = sub_80E1560;

    task->func(taskId);
}

static void sub_80E14DC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[10] = GetAnimBattlerSpriteId(0);
        gSprites[task->data[10]].invisible = 0;
        gSprites[task->data[10]].pos2.x = 0;
        gSprites[task->data[10]].pos2.y = 160 - gSprites[task->data[10]].pos1.y;
        task->data[0]++;
        break;
    case 1:
        DestroyAnimVisualTask(taskId);
    }
}

static void sub_80E1560(u8 taskId)
{
    u8 var0;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[10] = GetAnimBattlerSpriteId(0);
        task->data[11] = GetBattlerPosition_permutated(gAnimBankAttacker);
        if (task->data[11] == 1)
            task->data[12] = gBattle_BG1_X;
        else
            task->data[12] = gBattle_BG2_X;

        var0 =  sub_8077FC0(gAnimBankAttacker);
        task->data[14] = var0 - 32;
        task->data[15] = var0 + 32;
        task->data[0]++;
        break;
    case 1:
        sub_80E1668(task->data[11], 0, task->data[15]);
        task->data[0]++;
        break;
    case 2:
        gSprites[task->data[10]].pos2.y = 96;
        task->data[0]++;
        break;
    case 3:
        gSprites[task->data[10]].pos2.y -= 8;
        if (gSprites[task->data[10]].pos2.y == 0)
        {
            gScanlineEffect.state = 3;
            task->data[0]++;
        }
        break;
    case 4:
        DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_80E1668(u8 useBG1, s16 y, s16 endY)
{
    s16 bgX;
    struct ScanlineEffectParams scanlineParams;

    if (useBG1 == 1)
    {
        bgX = gBattle_BG1_X;
        scanlineParams.dmaDest = &REG_BG1HOFS;
    }
    else
    {
        bgX = gBattle_BG2_X;
        scanlineParams.dmaDest = &REG_BG2HOFS;
    }

    if (y < 0)
        y = 0;

    while (y < endY)
    {
        gScanlineEffectRegBuffers[0][y] = bgX;
        gScanlineEffectRegBuffers[1][y] = bgX;
        y++;
    }

    while (y < 160)
    {
        gScanlineEffectRegBuffers[0][y] = bgX + 240;
        gScanlineEffectRegBuffers[1][y] = bgX + 240;
        y++;
    }

    scanlineParams.dmaControl = SCANLINE_EFFECT_DMACNT_16BIT;
    scanlineParams.initState = 1;
    scanlineParams.unused9 = 0;
    ScanlineEffect_SetParams(scanlineParams);
}

static void sub_80E1728(struct Sprite *sprite)
{
    s8 battler;
    s16 xOffset;

    if (gBattleAnimArgs[0] == 0)
        battler = gAnimBankAttacker;
    else
        battler = gAnimBankTarget;

    xOffset = 24;
    if (gBattleAnimArgs[1] == 1)
    {
        xOffset *= -1;
        gBattleAnimArgs[2] *= -1;
    }

    sprite->pos1.x = GetBattlerSpriteCoord(battler, 2) + xOffset;
    sprite->pos1.y = sub_8077FC0(battler) + 30;
    sprite->data[0] = gBattleAnimArgs[5];
    sprite->data[2] = sprite->pos1.x + gBattleAnimArgs[2];
    sprite->data[4] = sprite->pos1.y + gBattleAnimArgs[3];
    sprite->data[5] = gBattleAnimArgs[4];
    InitAnimSpriteTranslationOverDuration(sprite);
    sprite->callback = sub_80E17B0;
}

static void sub_80E17B0(struct Sprite *sprite)
{
    if (TranslateAnimSpriteLinearAndSine(sprite))
        DestroyAnimSprite(sprite);
}

static void sub_80E17CC(struct Sprite *sprite)
{
    s8 battler;

    if (gBattleAnimArgs[0] == 0)
        battler = gAnimBankAttacker;
    else
        battler = gAnimBankTarget;

    sprite->pos1.x = GetBattlerSpriteCoord(battler, 0) - 16 + (gBattleAnimArgs[1] * 32);
    sprite->pos1.y = sub_8077FC0(battler) + 32;
    sprite->oam.tileNum += gBattleAnimArgs[1] * 8;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->callback = WaitAnimForDuration;
}

void sub_80E1864(u8 taskId)
{
    u16 i;
    struct Task *task = &gTasks[taskId];

    if (gBattleAnimArgs[1])
        task->data[14] = task->data[15] = gBattleAnimArgs[1] + 3;
    else
        task->data[14] = task->data[15] = (gAnimMovePower / 10) + 3;

    task->data[3] = gBattleAnimArgs[2];
    switch (gBattleAnimArgs[0])
    {
    case 5:
        task->data[13] = gBattle_BG3_X;
        task->func = sub_80E1934;
        break;
    case 4:
        task->data[13] = 0;
        for (i = 0; i < 4; i++)
        {
            if (IsAnimBankSpriteVisible(i))
            {
                task->data[task->data[13] + 9] = gBankSpriteIds[i];
                task->data[13]++;
            }
        }
        task->func = sub_80E1A2C;
        break;
    default:
        task->data[9] = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
        if (task->data[9] == 0xFF)
        {
            DestroyAnimVisualTask(taskId);
        }
        else
        {
            task->data[13] = 1;
            task->func = sub_80E1A2C;
        }

        break;
    }
}

static void sub_80E1934(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            if ((task->data[2] & 1) == 0)
                gBattle_BG3_X = task->data[13] + task->data[15];
            else
                gBattle_BG3_X = task->data[13] - task->data[15];

            if (++task->data[2] == task->data[3])
            {
                task->data[2] = 0;
                task->data[14]--;
                task->data[0]++;
            }
        }
        break;
    case 1:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            if ((task->data[2] & 1) == 0)
                gBattle_BG3_X = task->data[13] + task->data[14];
            else
                gBattle_BG3_X = task->data[13] - task->data[14];

            if (++task->data[2] == 4)
            {
                task->data[2] = 0;
                if (--task->data[14] == 0)
                    task->data[0]++;
            }
        }
        break;
    case 2:
        gBattle_BG3_X = task->data[13];
        DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_80E1A2C(u8 taskId)
{
    u16 i;
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            sub_80E1B10(task);
            if (++task->data[2] == task->data[3])
            {
                task->data[2] = 0;
                task->data[14]--;
                task->data[0]++;
            }
        }
        break;
    case 1:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            sub_80E1B10(task);
            if (++task->data[2] == 4)
            {
                task->data[2] = 0;
                if (--task->data[14] == 0)
                    task->data[0]++;
            }
        }
        break;
    case 2:
        for (i = 0; i < task->data[13]; i++)
            gSprites[task->data[9 + i]].pos2.x = 0;

        DestroyAnimVisualTask(taskId);
        break;
    }
}

static void sub_80E1B10(struct Task *task)
{
    u16 i;
    u16 xOffset;

    if ((task->data[2] & 1) == 0)
        xOffset = (task->data[14] / 2) + (task->data[14] & 1);
    else
        xOffset = -(task->data[14] / 2);

    for (i = 0; i < task->data[13]; i++)
    {
        gSprites[task->data[9 + i]].pos2.x = xOffset;
    }
}

void sub_80E1B88(u8 taskId)
{
    gBattleAnimArgs[15] = gAnimMovePower > 99;
    DestroyAnimVisualTask(taskId);
}

void sub_80E1BB0(u8 taskId)
{
    struct Task *newTask;
    u8 battler = (gBattleAnimArgs[0] & 1) ? gAnimBankTarget : gAnimBankAttacker;

    if (gBattleAnimArgs[0] > 1)
        battler ^= 2;

    newTask = &gTasks[CreateTask(sub_80E1C58, gBattleAnimArgs[1])];
    newTask->data[1] = (32 - GetBattlerSpriteCoord(battler, 2)) & 0x1FF;
    newTask->data[2] = (64 - GetBattlerSpriteCoord(battler, 3)) & 0xFF;
    gBattle_BG3_X = newTask->data[1];
    gBattle_BG3_Y = newTask->data[2];
    newTask->data[3] = gBattleAnimArgs[2];
    DestroyAnimVisualTask(taskId);
}

static void sub_80E1C58(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (gBattleAnimArgs[7] == task->data[3])
    {
        gBattle_BG3_X = 0;
        gBattle_BG3_Y = 0;
        DestroyTask(taskId);
    }
    else
    {
        gBattle_BG3_X = task->data[1];
        gBattle_BG3_Y = task->data[2];
    }
}
