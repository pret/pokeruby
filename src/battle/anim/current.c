#include "global.h"
#include "battle_anim.h"
#include "main.h"
#include "rom_8077ABC.h"
#include "sound.h"
#include "trig.h"
#include "constants/battle.h"
#include "constants/songs.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;
extern u8 gAnimVisualTaskCount;

extern const struct SpriteTemplate gBattleAnimSpriteTemplate_83D97D0;

void sub_80D648C(struct Sprite *sprite);
void sub_80D65DC(struct Sprite *sprite);
void sub_80D6658(struct Sprite *sprite);
void sub_80D679C(struct Sprite *sprite);
void sub_80D6A1C(struct Sprite *sprite);
void sub_80D6A6C(struct Sprite *sprite);
void sub_80D6D18(struct Sprite *sprite);
void sub_80D6D70(struct Sprite *sprite);
void sub_80D6DD8(struct Sprite *sprite);
void sub_80D7230(struct Sprite *sprite);
void sub_80D727C(struct Sprite *sprite);
void sub_80D755C(struct Sprite *sprite);
static void sub_80D6514(struct Sprite *sprite);
static void sub_80D672C(struct Sprite *sprite);
static void sub_80D6874(u8 taskId);
static void sub_80D6AF0(struct Sprite *sprite);
static void sub_80D6BB8(u8 taskId);
static void sub_80D6D00(struct Sprite *sprite);
static void sub_80D6E38(struct Sprite *sprite);
static bool8 sub_80D7194(struct Task *task, u8 taskId);
static bool8 sub_80D7470(struct Task *task, u8 taskId);
static bool8 sub_80D7654(struct Task *task, u8 taskId);
static void sub_80D76C4(struct Sprite *sprite);

const union AffineAnimCmd gSpriteAffineAnim_83D988C[] =
{
    AFFINEANIMCMD_FRAME(0x0, 0x0, 20, 1),
    AFFINEANIMCMD_JUMP(0),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D989C[] =
{
    gSpriteAffineAnim_83D988C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D98A0 =
{
    .tileTag = ANIM_TAG_SPARK_2,
    .paletteTag = ANIM_TAG_SPARK_2,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D989C,
    .callback = sub_80D648C,
};

const union AnimCmd gSpriteAnim_83D98B8[] =
{
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(16, 6),
    ANIMCMD_FRAME(32, 6),
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const gSpriteAnimTable_83D98C8[] =
{
    gSpriteAnim_83D98B8,
};

const union AffineAnimCmd gSpriteAffineAnim_83D98CC[] =
{
    AFFINEANIMCMD_FRAME(0xE8, 0xE8, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFF8, 0xFFF8, 0, 10),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 10),
    AFFINEANIMCMD_JUMP(1),
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D98EC[] =
{
    gSpriteAffineAnim_83D98CC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D98F0 =
{
    .tileTag = ANIM_TAG_SHOCK_3,
    .paletteTag = ANIM_TAG_SHOCK_3,
    .oam = &gOamData_837DF94,
    .anims = gSpriteAnimTable_83D98C8,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D98EC,
    .callback = sub_80D65DC,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9908 =
{
    .tileTag = ANIM_TAG_SPARK_2,
    .paletteTag = ANIM_TAG_SPARK_2,
    .oam = &gOamData_837DF8C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D989C,
    .callback = sub_80D6658,
};

const struct SpriteTemplate gElectricitySpriteTemplate =
{
    .tileTag = ANIM_TAG_SPARK_2,
    .paletteTag = ANIM_TAG_SPARK_2,
    .oam = &gOamData_837DF2C,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D679C,
};

const struct SpriteTemplate gSpriteTemplate_83D9938 =
{
    .tileTag = ANIM_TAG_SPARK,
    .paletteTag = ANIM_TAG_SPARK,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D6A1C,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9950 =
{
    .tileTag = ANIM_TAG_SPARK_H,
    .paletteTag = ANIM_TAG_SPARK_H,
    .oam = &gOamData_837DF54,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D6A6C,
};

const s8 gUnknown_083D9968[][2] =
{
    { 58, -60},
    {-56, -36},
    {  8, -56},
    {-16,  56},
    { 58, -10},
    {-58,  10},
    { 48, -18},
    {-8,   56},
    { 16, -56},
    {-58, -42},
    { 58,  30},
    {-48,  40},
    { 12, -48},
    { 48, -12},
    {-56,  18},
    { 48,  48},
};

const union AnimCmd gSpriteAnim_83D9988[] =
{
    ANIMCMD_FRAME(3, 1),
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D999C[] =
{
    ANIMCMD_FRAME(0, 5),
    ANIMCMD_FRAME(1, 5),
    ANIMCMD_FRAME(2, 5),
    ANIMCMD_FRAME(3, 5),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D99B0[] =
{
    gSpriteAnim_83D9988,
    gSpriteAnim_83D999C,
};

const struct SpriteTemplate gSpriteTemplate_83D99B8 =
{
    .tileTag = ANIM_TAG_ELECTRIC_ORBS,
    .paletteTag = ANIM_TAG_ELECTRIC_ORBS,
    .oam = &gOamData_837DF24,
    .anims = gSpriteAnimTable_83D99B0,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

const union AffineAnimCmd gSpriteAffineAnim_83D99D0[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_FRAME(0x4, 0x4, 0, 60),
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_LOOP(0),
    AFFINEANIMCMD_FRAME(0xFFFC, 0xFFFC, 0, 5),
    AFFINEANIMCMD_FRAME(0x4, 0x4, 0, 5),
    AFFINEANIMCMD_LOOP(10),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd gSpriteAffineAnim_83D9A10[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 30),
    AFFINEANIMCMD_FRAME(0x100, 0x100, 0, 0),
    AFFINEANIMCMD_FRAME(0xFFFC, 0xFFFC, 0, 5),
    AFFINEANIMCMD_FRAME(0x4, 0x4, 0, 5),
    AFFINEANIMCMD_JUMP(3),
};

const union AffineAnimCmd gSpriteAffineAnim_83D9A40[] =
{
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_FRAME(0x8, 0x8, 0, 30),
    AFFINEANIMCMD_FRAME(0xFFF8, 0xFFF8, 0, 30),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D9A60[] =
{
    gSpriteAffineAnim_83D99D0,
    gSpriteAffineAnim_83D9A10,
    gSpriteAffineAnim_83D9A40,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9A6C =
{
    .tileTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .paletteTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .oam = &gOamData_837E0BC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9A60,
    .callback = sub_80D6D18,
};

const union AnimCmd gSpriteAnim_83D9A84[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_FRAME(16, 3),
    ANIMCMD_FRAME(32, 3),
    ANIMCMD_FRAME(48, 3),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D9A98[] =
{
    gSpriteAnim_83D9A84,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9A9C =
{
    .tileTag = ANIM_TAG_ELECTRICITY,
    .paletteTag = ANIM_TAG_ELECTRICITY,
    .oam = &gOamData_837DF34,
    .anims = gSpriteAnimTable_83D9A98,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D6D70,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9AB4 =
{
    .tileTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .paletteTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .oam = &gOamData_837E0BC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9A60,
    .callback = sub_80D6DD8,
};

const union AnimCmd gSpriteAnim_83D9ACC[] =
{
    ANIMCMD_FRAME(0, 3),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D9AD4[] =
{
    ANIMCMD_FRAME(2, 3),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D9ADC[] =
{
    ANIMCMD_FRAME(4, 3),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D9AE4[] =
{
    ANIMCMD_FRAME(6, 3),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D9AEC[] =
{
    gSpriteAnim_83D9ACC,
    gSpriteAnim_83D9AD4,
    gSpriteAnim_83D9ADC,
    gSpriteAnim_83D9AE4,
};

const union AffineAnimCmd gSpriteAffineAnim_83D9AFC[] =
{
    AFFINEANIMCMD_FRAME(0x100, 0x100, 64, 0),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83D9B0C[] =
{
    gSpriteAffineAnim_83D9AFC,
};

const struct SpriteTemplate gSpriteTemplate_83D9B10 =
{
    .tileTag = ANIM_TAG_SPARK,
    .paletteTag = ANIM_TAG_SPARK,
    .oam = &gOamData_837E024,
    .anims = gSpriteAnimTable_83D9AEC,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9B0C,
    .callback = sub_80D7230,
};

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D9B28 =
{
    .tileTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .paletteTag = ANIM_TAG_CIRCLE_OF_LIGHT,
    .oam = &gOamData_837E0BC,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gSpriteAffineAnimTable_83D9A60,
    .callback = sub_80D727C,
};

const struct SpriteTemplate gSpriteTemplate_83D9B40 =
{
    .tileTag = ANIM_TAG_SPARK,
    .paletteTag = ANIM_TAG_SPARK,
    .oam = &gOamData_837DF24,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80D755C,
};

void sub_80D648C(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);

    sprite->data[0] = gBattleAnimArgs[3];
    sprite->data[1] = sprite->x;
    sprite->data[2] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
    sprite->data[3] = sprite->y;
    sprite->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 3);

    InitAnimLinearTranslation(sprite);
    sprite->data[5] = gBattleAnimArgs[2];
    sprite->data[6] = gBattleAnimArgs[5];
    sprite->data[7] = gBattleAnimArgs[4];
    sprite->oam.tileNum += gBattleAnimArgs[6] * 4;

    sprite->callback = sub_80D6514;
    sprite->callback(sprite);
}

static void sub_80D6514(struct Sprite *sprite)
{
    if (!TranslateAnimLinear(sprite))
    {
        sprite->x2 += Sin(sprite->data[7], sprite->data[5]);
        sprite->y2 += Cos(sprite->data[7], sprite->data[5]);

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
    if (!gMain.inBattle || GetBattlerSide(gBattleAnimTarget) == B_SIDE_PLAYER)
        gBattleAnimArgs[1] = -gBattleAnimArgs[1];

    sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, 2) + gBattleAnimArgs[1];
    sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, 3) + gBattleAnimArgs[2];
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
        bank = gBattleAnimTarget;
    else
        bank = gBattleAnimAttacker;

    if (!gMain.inBattle || GetBattlerSide(bank) == B_SIDE_PLAYER)
        gBattleAnimArgs[0] = -gBattleAnimArgs[0];

    sprite->x = GetBattlerSpriteCoord(bank, 2) + gBattleAnimArgs[0];
    sprite->y = GetBattlerSpriteCoord(bank, 3) + gBattleAnimArgs[1];

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
    sprite->x2 = Sin(sprite->data[7], sprite->data[5]);
    sprite->y2 = Cos(sprite->data[7], sprite->data[5]);

    sprite->data[7] = (sprite->data[7] + sprite->data[6]) & 0xFF;
    if (sprite->data[7] % sprite->data[4] == 0)
        sprite->invisible ^= 1;

    if (sprite->data[0]-- <= 0)
        DestroyAnimSprite(sprite);
}

void sub_80D679C(struct Sprite *sprite)
{
    InitSpritePosToAnimTarget(sprite, FALSE);
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
    gTasks[taskId].data[0] = GetBattlerSpriteCoord(gBattleAnimTarget, 0) + gBattleAnimArgs[0];
    gTasks[taskId].data[1] = GetBattlerSpriteCoord(gBattleAnimTarget, 1) + gBattleAnimArgs[1];
    gTasks[taskId].data[2] = gBattleAnimArgs[2];
    gTasks[taskId].func = sub_80D6874;
}

static void sub_80D6874(u8 taskId)
{
    u16 r8;
    u16 r2;
    s16 r12;
    u8 spriteId = 0;
    u8 r7 = 0;
    u8 sp = gTasks[taskId].data[2];
    s16 r4 = gTasks[taskId].data[0];
    s16 r6 = gTasks[taskId].data[1];

    if (gTasks[taskId].data[2] == 0)
    {
        r8 = 0;
        r2 = 1;
        r12 = 16;
    }
    else
    {
        r12 = 16;
        r8 = 8;
        r2 = 4;
    }

    switch (gTasks[taskId].data[10])
    {
    case 0:
        r12 *= 1;
        spriteId = CreateSprite(&gSpriteTemplate_83D9938, r4, r6 + r12, 2);
        r7++;
        break;
    case 2:
        r12 *= 2;
        r8 += r2;
        spriteId = CreateSprite(&gSpriteTemplate_83D9938, r4, r6 + r12, 2);
        r7++;
        break;
    case 4:
        r12 *= 3;
        r8 += r2 * 2;
        spriteId = CreateSprite(&gSpriteTemplate_83D9938, r4, r6 + r12, 2);
        r7++;
        break;
    case 6:
        r12 *= 4;
        r8 += r2 * 3;
        spriteId = CreateSprite(&gSpriteTemplate_83D9938, r4, r6 + r12, 2);
        r7++;
        break;
    case 8:
        r12 *= 5;
        spriteId = CreateSprite(&gSpriteTemplate_83D9938, r4, r6 + r12, 2);
        r7++;
        break;
    case 10:
        DestroyAnimVisualTask(taskId);
        return;
    }

    if (r7)
    {
        gSprites[spriteId].oam.tileNum += r8;
        gSprites[spriteId].data[0] = sp;
        gSprites[spriteId].callback(&gSprites[spriteId]);
    }

    gTasks[taskId].data[10]++;
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

    sprite->x += gBattleAnimArgs[0];
    sprite->y += gBattleAnimArgs[1];
    spriteId = CreateSprite(&gBattleAnimSpriteTemplate_83D9950, sprite->x + 32, sprite->y, sprite->subpriority);
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
        task->data[14] = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
        task->data[15] = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    }
    else
    {
        task->data[14] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
        task->data[15] = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
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
                sprite->x += gUnknown_083D9968[task->data[9]][0];
                sprite->y += gUnknown_083D9968[task->data[9]][1];

                sprite->data[0] = 40 - task->data[8] * 5;
                sprite->data[1] = sprite->x;
                sprite->data[2] = task->data[14];
                sprite->data[3] = sprite->y;
                sprite->data[4] = task->data[15];
                sprite->data[5] = taskId;

                InitAnimLinearTranslation(sprite);
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
    if (TranslateAnimLinear(sprite))
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
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
        sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    }
    else
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
        sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
    }

    StoreSpriteCallbackInData(sprite, DestroySpriteAndMatrix);
    sprite->callback = sub_80785E4;
}

void sub_80D6D70(struct Sprite *sprite)
{
    if (gBattleAnimArgs[0] == 0)
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
        sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    }
    else
    {
        sprite->x = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
        sprite->y = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
    }

    sprite->x2 = gBattleAnimArgs[1];
    sprite->y2 = gBattleAnimArgs[2];
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    sprite->callback = sub_8078600;
}

void sub_80D6DD8(struct Sprite *sprite)
{
    StartSpriteAffineAnim(sprite, 1);
    sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
    sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
    sprite->data[6] = GetAnimBattlerSpriteId(0);
    sprite->data[7] = 16;

    if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_OPPONENT)
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
        sprite->x += sprite->data[7];
        gSprites[sprite->data[6]].x2 += sprite->data[7];
        if ((u16)(sprite->x + 80) > 400)
        {
            DestroySpriteAndMatrix(sprite);
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
        task->data[14] = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
        if (GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER)
        {
            task->data[14] = -32;
            task->data[13] = 2;
        }
        else
        {
            task->data[14] = 32;
            task->data[13] = -2;
        }

        gSprites[task->data[15]].x2 = task->data[14];
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
                gSprites[task->data[15]].x2 = task->data[14];
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
        gSprites[task->data[15]].invisible = FALSE;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void sub_80D700C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch(task->data[0])
    {
    case 0:
        task->data[1] = GetBattlerSide(gBattleAnimAttacker) == B_SIDE_PLAYER ? 1 : -1;

        switch (gBattleAnimArgs[0])
        {
        case 0:
            task->data[3] = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
            task->data[5] = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
            task->data[4] = (task->data[1] * 128) + 120;
            break;
        case 4:
            task->data[3] = 120 - (task->data[1] * 128);
            task->data[5] = GetBattlerSpriteCoord(gBattleAnimTarget, 3);
            task->data[4] = GetBattlerSpriteCoord(gBattleAnimTarget, 2) - (task->data[1] * 32);
            break;
        default:
            if ((gBattleAnimArgs[0] & 1) != 0)
            {
                task->data[3] = 256;
                task->data[4] = -16;
            }
            else
            {
                task->data[3] = -16;
                task->data[4] = 256;
            }

            if (task->data[1] == 1)
            {
                task->data[5] = 80 - gBattleAnimArgs[0] * 10;
            }
            else
            {
                u16 temp;
                task->data[5] = gBattleAnimArgs[0] * 10 + 40;
                temp = task->data[3];
                task->data[3] = task->data[4];
                task->data[4] = temp;
            }
            break;
        }

        if (task->data[3] < task->data[4])
        {
            task->data[1] = 1;
            task->data[6] = 0;
        }
        else
        {
            task->data[1] = -1;
            task->data[6] = 3;
        }

        task->data[0]++;
        break;
    case 1:
        if (++task->data[2] > 0)
        {
            task->data[2] = 0;
            if (sub_80D7194(task, taskId) || sub_80D7194(task, taskId))
                task->data[0]++;
        }
        break;
    case 2:
        if (task->data[7] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

static bool8 sub_80D7194(struct Task *task, u8 taskId)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_83D9B10, task->data[3], task->data[5], 35);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].data[6] = taskId;
        gSprites[spriteId].data[7] = 7;
        task->data[7]++;
    }

    task->data[6] += task->data[1];
    if (task->data[6] < 0)
        task->data[6] = 3;

    if (task->data[6] > 3)
        task->data[6] = 0;

    task->data[3] += task->data[1] * 16;

    if ((task->data[1] == 1 && task->data[3] >= task->data[4])
        || (task->data[1] == -1 && task->data[3] <= task->data[4]))
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

void sub_80D7230(struct Sprite *sprite)
{
    if (++sprite->data[0] > 12)
    {
        gTasks[sprite->data[6]].data[sprite->data[7]]--;
        FreeOamMatrix(sprite->oam.matrixNum);
        DestroySprite(sprite);
    }
}

void sub_80D727C(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->x = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
        sprite->y = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
        StartSpriteAffineAnim(sprite, 2);
        sprite->data[0]++;
        break;
    case 1:
        if (sprite->affineAnimEnded)
            DestroySpriteAndMatrix(sprite);
        break;
    }
}

void sub_80D72DC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[6] = GetBattlerSpriteCoord(gBattleAnimAttacker, 2);
        task->data[7] = GetBattlerSpriteCoord(gBattleAnimAttacker, 3);
        task->data[8] = 4;
        task->data[10] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
        task->data[9] = (task->data[10] - task->data[6]) / 5;
        task->data[4] = 7;
        task->data[5] = -1;
        task->data[11] = 12;
        task->data[12] = BattleAnimAdjustPanning(task->data[11] - 76);
        task->data[13] = BattleAnimAdjustPanning(SOUND_PAN_TARGET);
        task->data[14] = task->data[12];
        task->data[15] = (task->data[13] - task->data[12]) / 3;
        task->data[0]++;
        break;
    case 1:
        if (++task->data[1] > 0)
        {
            task->data[1] = 0;
            if (sub_80D7470(task, taskId))
            {
                if (task->data[2] == 5)
                    task->data[0] = 3;
                else
                    task->data[0]++;
            }
        }

        if (task->data[11])
            task->data[11]--;
        break;
    case 2:
        if (task->data[11])
            task->data[11]--;

        if (++task->data[1] > 4)
        {
            task->data[1] = 0;
            if (task->data[2] & 1)
            {
                task->data[7] = 4;
                task->data[8] = 68;
                task->data[4] = 0;
                task->data[5] = 1;
            }
            else
            {
                task->data[7] = 68;
                task->data[8] = 4;
                task->data[4] = 7;
                task->data[5] = -1;
            }

            if (task->data[11])
                task->data[0] = 4;
            else
                task->data[0] = 1;
        }
        break;
    case 3:
        if (task->data[3] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    case 4:
        if (task->data[11])
            task->data[11]--;
        else
            task->data[0] = 1;
        break;
    }
}

static bool8 sub_80D7470(struct Task *task, u8 taskId)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_83D9B40, task->data[6], task->data[7], 35);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].oam.tileNum += task->data[4];
        task->data[4] += task->data[5];
        if (task->data[4] < 0)
            task->data[4] = 7;
        if (task->data[4] > 7)
            task->data[4] = 0;

        gSprites[spriteId].data[6] = taskId;
        gSprites[spriteId].data[7] = 3;
        task->data[3]++;
    }

    if (task->data[4] == 0 && task->data[5] > 0)
    {
        task->data[14] += task->data[15];
        PlaySE12WithPanning(SE_M_THUNDERBOLT, task->data[14]);
    }

    if ((task->data[5] < 0 && task->data[7] <= task->data[8])
        || (task->data[5] > 0 && task->data[7] >= task->data[8]))
    {
        task->data[2]++;
        task->data[6] += task->data[9];
        return TRUE;
    }
    else
    {
        task->data[7] += task->data[5] * 8;
        return FALSE;
    }
}

void sub_80D755C(struct Sprite *sprite)
{
    if (++sprite->data[0] > 12)
    {
        gTasks[sprite->data[6]].data[sprite->data[7]]--;
        DestroySprite(sprite);
    }
}

void sub_80D759C(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        task->data[15] = GetBattlerSpriteCoord(gBattleAnimTarget, 1) + 32;
        task->data[14] = task->data[15];
        while (task->data[14] > 16)
        {
            task->data[14] -= 32;
        }

        task->data[13] = GetBattlerSpriteCoord(gBattleAnimTarget, 2);
        task->data[12] = GetBattlerSubpriority(gBattleAnimTarget) - 2;
        task->data[0]++;
        break;
    case 1:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;
            if (sub_80D7654(task, taskId))
                task->data[0]++;
        }
        break;
    case 2:
        if (task->data[10] == 0)
            DestroyAnimVisualTask(taskId);
        break;
    }
}

static bool8 sub_80D7654(struct Task *task, u8 taskId)
{
    u8 spriteId = CreateSprite(&gBattleAnimSpriteTemplate_83D97D0, task->data[13], task->data[14], task->data[12]);
    if (spriteId != MAX_SPRITES)
    {
        gSprites[spriteId].callback = sub_80D76C4;
        gSprites[spriteId].data[6] = taskId;
        gSprites[spriteId].data[7] = 10;
        task->data[10]++;
    }

    if (task->data[14] >= task->data[15])
    {
        return TRUE;
    }
    else
    {
        task->data[14] += 32;
        return FALSE;
    }
}

static void sub_80D76C4(struct Sprite *sprite)
{
    if (sprite->animEnded)
    {
        gTasks[sprite->data[6]].data[sprite->data[7]]--;
        DestroySprite(sprite);
    }
}
