#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

static void sub_80CBF5C(u8 taskId);
static s16 sub_80CC338(struct Sprite* sprite);
static void sub_80CC358(struct Task* task, u8 taskId);
static void sub_80CC408(struct Sprite* sprite);

// flying_path (guides a sprite along a specific path.)
// Used by Leaf Blade.

const union AnimCmd gSpriteAnim_83D6830[] =
{
    ANIMCMD_FRAME(28, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D6838[] =
{
    ANIMCMD_FRAME(32, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D6840[] =
{
    ANIMCMD_FRAME(20, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D6848[] =
{
    ANIMCMD_FRAME(28, 1, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D6850[] =
{
    ANIMCMD_FRAME(16, 1),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D6858[] =
{
    ANIMCMD_FRAME(16, 1, .hFlip = TRUE),
    ANIMCMD_END,
};

const union AnimCmd gSpriteAnim_83D6860[] =
{
    ANIMCMD_FRAME(28, 1),
    ANIMCMD_END,
};

const union AnimCmd *const gSpriteAnimTable_83D6868[] =
{
    gSpriteAnim_83D6830,
    gSpriteAnim_83D6838,
    gSpriteAnim_83D6840,
    gSpriteAnim_83D6848,
    gSpriteAnim_83D6850,
    gSpriteAnim_83D6858,
    gSpriteAnim_83D6860,
};

const struct SpriteTemplate gSpriteTemplate_83D6884 =
{
    .tileTag = 10063,
    .paletteTag = 10063,
    .oam = &gOamData_837DF2C,
    .anims = gSpriteAnimTable_83D6868,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = SpriteCallbackDummy,
};

void sub_80CBDF4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[4] = sub_8079E90(gAnimBankTarget) - 1;
    task->data[6] = GetBattlerSpriteCoord(gAnimBankTarget, 2);
    task->data[7] = GetBattlerSpriteCoord(gAnimBankTarget, 3);
    task->data[10] = sub_807A100(gAnimBankTarget, 1);
    task->data[11] = sub_807A100(gAnimBankTarget, 0);
    task->data[5] = (GetBattlerSide(gAnimBankTarget) == 1) ? 1 : -1;
    task->data[9] = 0x38 - (task->data[5] * 64);
    task->data[8] = task->data[7] - task->data[9] + task->data[6];
    task->data[2] = CreateSprite(&gSpriteTemplate_83D6884, task->data[8], task->data[9], task->data[4]);
    if (task->data[2] == 0x40)
        DestroyAnimVisualTask(taskId);

    gSprites[task->data[2]].data[0] = 10;
    gSprites[task->data[2]].data[1] = task->data[8];
    gSprites[task->data[2]].data[2] = task->data[6] - (task->data[10] / 2 + 10) * task->data[5];
    gSprites[task->data[2]].data[3] = task->data[9];
    gSprites[task->data[2]].data[4] = task->data[7] + (task->data[11] / 2 + 10) * task->data[5];
    gSprites[task->data[2]].data[5] = sub_80CC338(&gSprites[task->data[2]]);
    InitAnimArcTranslation(&gSprites[task->data[2]]);
    task->func = sub_80CBF5C;
}

static void sub_80CBF5C(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    struct Sprite* sprite = &gSprites[task->data[2]];
    int a = task->data[0];
    switch (a)
    {
    case 4:
        sub_80CC358(task, taskId);
        if (TranslateAnimArc(sprite) == 0)
        {
            break;
        }
        else
        {
            task->data[15] = 5;
            task->data[0] = 0xFF;
        }
        break;
    case 8:
        sub_80CC358(task, taskId);
        if (TranslateAnimArc(sprite) == 0)
        {
            break;
        }
        else
        {
            task->data[15] = 9;
            task->data[0] = 0xFF;
        }
        break;
    case 0:
        sub_80CC358(task, taskId);
        if (TranslateAnimArc(sprite) == 0)
            break;

        task->data[15] = 1;
        task->data[0] = 0xFF;
        break;
    case 1:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[6];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[7];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[4] += 2;
        task->data[3] = a;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        InitAnimArcTranslation(sprite);
        task->data[0]++;
        break;
    case 2:
        sub_80CC358(task, taskId);
        if (TranslateAnimArc(sprite) == 0)
            break;

        task->data[15] = 3;
        task->data[0] = 0xFF;
        break;
    case 3:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[6] - ((task->data[10] / 2) + 10) * task->data[5];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[7] - ((task->data[11] / 2) + 10) * task->data[5];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[3] = 2;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        InitAnimArcTranslation(sprite);
        task->data[0]++;
        break;
    case 5:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[6] + ((task->data[10] / 2) + 10) * task->data[5];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[7] + ((task->data[11] / 2) + 10) * task->data[5];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[4] -= 2;
        task->data[3] = 3;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        InitAnimArcTranslation(sprite);
        task->data[0]++;
        break;
    case 6:
        sub_80CC358(task, taskId);
        if (TranslateAnimArc(sprite) == 0)
            break;

        task->data[15] = 7;
        task->data[0] = 0xFF;
        break;
    case 7:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[6];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[7];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[4] += 2;
        task->data[3] = 4;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        InitAnimArcTranslation(sprite);
        task->data[0]++;
        break;
    case 9:
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[6] - ((task->data[10] / 2) + 10) * task->data[5];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[7] + ((task->data[11] / 2) + 10) * task->data[5];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[3] = 5;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        InitAnimArcTranslation(sprite);
        task->data[0]++;
        break;
    case 10:
        sub_80CC358(task, taskId);
        if (TranslateAnimArc(sprite) == 0)
        {
            break;
        }
        else
        {
            task->data[15] = 11;
            task->data[0] = 0xFF;
        }
        break;
    case 11:
    {
        sprite->pos1.x += sprite->pos2.x;
        sprite->pos1.y += sprite->pos2.y;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->data[0] = 10;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = task->data[8];
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = task->data[9];
        sprite->data[5] = sub_80CC338(sprite);
        task->data[4] -= 2;
        task->data[3] = 6;
        sprite->subpriority = task->data[4];
        StartSpriteAnim(sprite, task->data[3]);
        InitAnimArcTranslation(sprite);
        task->data[0]++;
        break;
    }
    case 12:
        sub_80CC358(task, taskId);
        if (TranslateAnimArc(sprite) != 0)
        {
            DestroySprite(sprite);
            task->data[0]++;
        }
        break;
    case 13:
        if (task->data[12] == 0)
        {
            DestroyAnimVisualTask(taskId);
        }
        break;
    case 255:
        task->data[1]++;
        if (task->data[1] > 5)
        {
            task->data[1] = 0;
            task->data[0] = task->data[15];
        }
        break;
    }
}

static s16 sub_80CC338(struct Sprite* sprite)
{
    s16 var = 8;
    if (sprite->data[4] < sprite->pos1.y)
        var = -var;

    return var;
}

static void sub_80CC358(struct Task* task, u8 taskId)
{
    task->data[14]++;
    if (task->data[14] > 0)
    {
        u8 spriteId;
        s16 spriteX;
        s16 spriteY;
        task->data[14] = 0;
        spriteX = gSprites[task->data[2]].pos1.x + gSprites[task->data[2]].pos2.x;
        spriteY = gSprites[task->data[2]].pos1.y + gSprites[task->data[2]].pos2.y;
        spriteId = CreateSprite(&gSpriteTemplate_83D6884, spriteX, spriteY, task->data[4]);
        if (spriteId != 0x40)
        {
            gSprites[spriteId].data[6] = taskId;
            gSprites[spriteId].data[7] = 12;
            gTasks[taskId].data[12]++;
            gSprites[spriteId].data[0] = task->data[13] & 1;
            gTasks[taskId].data[13]++;
            StartSpriteAnim(&gSprites[spriteId], task->data[3]);
            gSprites[spriteId].subpriority = task->data[4];
            gSprites[spriteId].callback = sub_80CC408;
        }
    }
}

static void sub_80CC408(struct Sprite* sprite)
{
    sprite->data[0]++;
    if (sprite->data[0] > 1)
    {
        sprite->data[0] = 0;
        sprite->invisible ^= 1;
        sprite->data[1]++;
        if (sprite->data[1] > 8)
        {
            gTasks[sprite->data[6]].data[sprite->data[7]]--;
            DestroySprite(sprite);
        }
    }
}
