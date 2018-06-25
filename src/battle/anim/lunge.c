#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern u8 gBankSpriteIds[];

void sub_80CD774(struct Sprite* sprite);
void sub_80CD9C4(struct Sprite* sprite);
static void sub_80CD7CC(struct Sprite* sprite);
static void sub_80CD81C(struct Sprite* sprite);
static void sub_80CD8A8(struct Sprite* sprite);
static void sub_80CD8F8(struct Sprite* sprite);
static void sub_80CD91C(struct Sprite* sprite);
static void sub_80CD9B8(struct Sprite* sprite);
static void sub_80CD9D4(struct Sprite* sprite);
static void sub_80CDB60(u8 taskId);
static void sub_80CDD20(u8 taskId);

// lunge_1 (makes the pokemon sprite do a "lunge" where it leans back to attack, usually with its head or horn.)
// Used in Drill Peck, Headbutt, Horn Attack, and Horn Drill.

const struct SpriteTemplate gBattleAnimSpriteTemplate_83D6DE4 =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CD774,
};

const struct SpriteTemplate gSpriteTemplate_83D6DFC =
{
    .tileTag = 0,
    .paletteTag = 0,
    .oam = &gDummyOamData,
    .anims = gDummySpriteAnimTable,
    .images = NULL,
    .affineAnims = gDummySpriteAffineAnimTable,
    .callback = sub_80CD9C4,
};

void sub_80CD774(struct Sprite* sprite)
{
    sprite->invisible = 1;
    sprite->data[0] = 0;
    switch (gBattleAnimArgs[0])
    {
    case 0:
        sprite->callback = sub_80CD7CC;
        break;
    case 1:
        sprite->callback = sub_80CD8A8;
        break;
    case 2:
        sprite->callback = sub_80CD8F8;
        break;
    default:
        sprite->callback = sub_80CD9B8;
        break;
    }
}

static void sub_80CD7CC(struct Sprite* sprite)
{
    sprite->data[0] = 6;
    sprite->data[1] = (GetBattlerSide(gAnimBankAttacker)) ? 2 : -2;
    sprite->data[2] = 0;
    sprite->data[3] = gBankSpriteIds[gAnimBankAttacker];
    StoreSpriteCallbackInData(sprite, sub_80CD81C);
    sprite->callback = TranslateMonBGUntil;
}

static void sub_80CD81C(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[3] = gBankSpriteIds[gAnimBankAttacker];
        sub_8078E70(sprite->data[3], 0);
        sprite->data[4] = (sprite->data[6] = GetBattlerSide(gAnimBankAttacker)) ? 0x300 : 0xFFFFFD00;
        sprite->data[5] = 0;
    }

    sprite->data[5] += sprite->data[4];
    obj_id_set_rotscale(sprite->data[3], 0x100, 0x100, sprite->data[5]);
    sub_8078F9C(sprite->data[3]);
    if (++sprite->data[0] > 3)
    {
        sprite->data[0] = 0;
        sprite->callback = sub_80CD9B8;
    }
}

static void sub_80CD8A8(struct Sprite* sprite)
{
    sprite->data[0] = 4;
    sprite->data[1] = (GetBattlerSide(gAnimBankAttacker)) ? -3 : 3;
    sprite->data[2] = 0;
    sprite->data[3] = gBankSpriteIds[gAnimBankAttacker];
    StoreSpriteCallbackInData(sprite, sub_80CD9B8);
    sprite->callback = TranslateMonBGUntil;
}

static void sub_80CD8F8(struct Sprite* sprite)
{
    if (++sprite->data[0] > 8)
    {
        sprite->data[0] = 0;
        sprite->callback = sub_80CD91C;
    }
}

static void sub_80CD91C(struct Sprite* sprite)
{
    if (sprite->data[0] == 0)
    {
        sprite->data[3] = gBankSpriteIds[gAnimBankAttacker];
        sprite->data[6] = GetBattlerSide(gAnimBankAttacker);
        if (GetBattlerSide(gAnimBankAttacker))
        {
            sprite->data[4] = 0xFC00;
            sprite->data[5] = 0xC00;
        }
        else
        {
            sprite->data[4] = 0x400;
            sprite->data[5] = 0xF400;
        }
    }

    sprite->data[5] += sprite->data[4];
    obj_id_set_rotscale(sprite->data[3], 0x100, 0x100, sprite->data[5]);
    sub_8078F9C(sprite->data[3]);
    if (++sprite->data[0] > 2)
    {
        sub_8078F40(sprite->data[3]);
        sprite->callback = sub_80CD9B8;
    }
}

static void sub_80CD9B8(struct Sprite* sprite)
{
    DestroyAnimSprite(sprite);
}

void sub_80CD9C4(struct Sprite* sprite)
{
    sprite->data[0] = 0;
    sprite->callback = sub_80CD9D4;
}

static void sub_80CD9D4(struct Sprite* sprite)
{
    switch (sprite->data[0])
    {
    case 0:
        sprite->data[1] = 0;
        sprite->data[2] = gBankSpriteIds[gAnimBankAttacker];
        sprite->data[3] = GetBattlerSide(gAnimBankAttacker);
        sprite->data[4] = (sprite->data[3] != 0) ? 0x200 : -0x200;
        sprite->data[5] = 0;
        sub_8078E70(sprite->data[2], 0);
        sprite->data[0]++;
    case 1:
        sprite->data[5] += sprite->data[4];
        obj_id_set_rotscale(sprite->data[2], 0x100, 0x100, sprite->data[5]);
        sub_8078F9C(sprite->data[2]);
        if (++sprite->data[1] > 3)
        {
            sprite->data[1] = 0;
            sprite->data[4] *= -1;
            sprite->data[0]++;
        }
        break;
    case 2:
        sprite->data[5] += sprite->data[4];
        obj_id_set_rotscale(sprite->data[2], 0x100, 0x100, sprite->data[5]);
        sub_8078F9C(sprite->data[2]);
        if (++sprite->data[1] > 3)
        {
            sub_8078F40(sprite->data[2]);
            DestroyAnimSprite(sprite);
        }
        break;
    }
}

void sub_80CDAC8(u8 taskId)
{
    u8 a;

    gTasks[taskId].data[0] = gBankSpriteIds[gAnimBankAttacker];
    a = GetBattlerSide(gAnimBankAttacker);
    gTasks[taskId].data[1] = a;
    gTasks[taskId].data[2] = 0;
    switch (gBattleAnimArgs[0])
    {
    default:
        DestroyAnimVisualTask(taskId);
        break;
    case 0:
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[3] = 8;
        gTasks[taskId].data[4] = 0;
        gTasks[taskId].data[5] = 3;
        if (a == 0)
            gTasks[taskId].data[5] *= -1;

        gTasks[taskId].func = sub_80CDB60;
        break;
    case 1:
        gTasks[taskId].data[3] = 8;
        gTasks[taskId].data[4] = 0x600;
        gTasks[taskId].data[5] = 0xC0;
        if (a == 0)
        {
            gTasks[taskId].data[4] = -gTasks[taskId].data[4];
            gTasks[taskId].data[5] = -gTasks[taskId].data[5];
        }

        gTasks[taskId].func = sub_80CDD20;
        break;
    }
}

void sub_80CDB60(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    switch (task->data[2])
    {
    case 0:
        if (task->data[3])
        {
            task->data[4] += task->data[5];
            gSprites[task->data[0]].pos2.x = task->data[4];
            task->data[3]--;
        }
        else
        {
            task->data[3] = 8;
            task->data[4] = 0;
            task->data[5] = (task->data[1] == 0) ? -0xC0 : 0xC0;
            sub_8078E70(task->data[0], 0);
            task->data[2]++;
        }
        break;
    case 1:
        if (task->data[3])
        {
            task->data[4] += task->data[5];
            obj_id_set_rotscale(task->data[0], 0x100, 0x100, task->data[4]);
            sub_8078F9C(task->data[0]);
            task->data[3]--;
        }
        else
        {
            task->data[3] = 8;
            task->data[4] = gSprites[task->data[0]].pos2.x;
            task->data[5] = (task->data[1] == 0) ? 0x2 : -0x2;
            task->data[6] = 1;
            task->data[2]++;
        }
        break;
    case 2:
        if (task->data[3])
        {
            if (task->data[6])
            {
                task->data[6]--;
            }
            else
            {
                if (task->data[3] & 1)
                    gSprites[task->data[0]].pos2.x = task->data[4] + task->data[5];
                else
                    gSprites[task->data[0]].pos2.x = task->data[4] - task->data[5];

                task->data[6] = 1;
                task->data[3]--;
            }
        }
        else
        {
            gSprites[task->data[0]].pos2.x = task->data[4];
            task->data[3] = 12;
            task->data[2]++;
        }
        break;
    case 3:
        if (task->data[3])
        {
            task->data[3]--;
        }
        else
        {
            task->data[3] = 3;
            task->data[4] = gSprites[task->data[0]].pos2.x;
            task->data[5] = (task->data[1] == 0) ? 8 : -8;
            task->data[2]++;
        }
        break;
    case 4:
        if (task->data[3])
        {
            task->data[4] += task->data[5];
            gSprites[task->data[0]].pos2.x = task->data[4];
            task->data[3]--;
        }
        else
        {
            DestroyAnimVisualTask(taskId);
        }
        break;
    }
}

void sub_80CDD20(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (task->data[3])
    {
        task->data[4] -= task->data[5];
        obj_id_set_rotscale(task->data[0], 0x100, 0x100, task->data[4]);
        sub_8078F9C(task->data[0]);
        task->data[3]--;
    }
    else
    {
        sub_8078F40(task->data[0]);
        DestroyAnimVisualTask(taskId);
    }
}
