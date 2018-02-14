#include "global.h"
#include "battle_anim.h"
#include "heated_rock.h"
#include "rom_8077ABC.h"
#include "task.h"
#include "trig.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern struct SpriteTemplate gSpriteTemplate_83D96C4;
extern s16 gHeatedRockCoords[7][2];

void sub_80D5254(struct Sprite *);
void sub_80D5348(struct Sprite *);
void sub_80D52AC(struct Sprite *);
void sub_80D5324(struct Sprite *);
void sub_80D53F4(struct Sprite *);
void sub_80D541C(struct Sprite *);
void sub_80D54E0(u8 taskId);
void sub_80D57C4(u8 spriteId, u8 taskId, u8 a3);

void sub_80D51A8(struct Sprite *sprite)
{
    if (GetBankSide(gAnimBankAttacker) == GetBankSide(gAnimBankTarget)
        && (gAnimBankAttacker == GetBankByIdentity(2)
            || gAnimBankAttacker == GetBankByIdentity(3)))
            gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->callback = sub_8079534;
    sub_8079534(sprite);
}

struct Sprite *sub_80D5210(struct Sprite *sprite)
{
    gBattleAnimArgs[0] = -gBattleAnimArgs[0];
    gBattleAnimArgs[2] = -gBattleAnimArgs[2];

    sprite->callback = sub_8079534;
    return sprite;
}

void sub_80D522C(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);

    sprite->data[7] = gBattleAnimArgs[2];
    sprite->data[0] = 0;

    sprite->callback = sub_80D5254;
}

void sub_80D5254(struct Sprite *sprite)
{
    sub_80D5348(sprite);

    if (++sprite->data[0] == 0x12)
    {
        sprite->data[0] = 0x19;
        sprite->data[1] = sprite->pos1.x;
        sprite->data[2] = GetBankPosition(gAnimBankTarget, 2);
        sprite->data[3] = sprite->pos1.y;
        sprite->data[4] = GetBankPosition(gAnimBankTarget, 3);

        InitAnimSpriteTranslationDeltas(sprite);

        sprite->callback = sub_80D52AC;
    }
}

void sub_80D52AC(struct Sprite *sprite)
{
    if (TranslateAnimSpriteByDeltas(sprite))
    {
        sprite->data[0] = 0;

        sprite->pos1.x = GetBankPosition(gAnimBankTarget, 2);
        sprite->pos1.y = GetBankPosition(gAnimBankTarget, 3);
        sprite->pos2.y = 0;
        sprite->pos2.x = 0;

        sprite->callback = sub_80D5324;
        sub_80D5324(sprite);
    }
    else
    {
        sprite->pos2.x += Sin(sprite->data[7], 28);
        sprite->pos2.y += Cos(sprite->data[7], 28);

        sprite->data[7] = (sprite->data[7] + 20) & 0xFF;
    }
}

void sub_80D5324(struct Sprite *sprite)
{
    sub_80D5348(sprite);

    if (++sprite->data[0] == 0x1F)
        DestroyAnimSprite(sprite);
}

void sub_80D5348(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[7], 28);
    sprite->pos2.y = Cos(sprite->data[7], 28);

    sprite->data[7] = (sprite->data[7] + 20) & 0xFF;
}

void sub_80D5374(struct Sprite *sprite)
{
    sprite->pos1.x += gBattleAnimArgs[0];
    sprite->pos1.y += gBattleAnimArgs[1];

    sprite->data[0] = gBattleAnimArgs[2];
    sprite->data[1] = gBattleAnimArgs[3];
    sprite->data[2] = gBattleAnimArgs[4];

    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);

    sprite->callback = sub_8078364;
}

void sub_80D53B4(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);

    sprite->data[1] = gBattleAnimArgs[2];
    sprite->data[0] = gBattleAnimArgs[3];

    sprite->invisible = TRUE;
    sprite->callback = sub_80782D8;

    StoreSpriteCallbackInData(sprite, sub_80D53F4);
}

void sub_80D53F4(struct Sprite *sprite)
{
    sprite->invisible = FALSE;

    sprite->data[0] = sprite->data[1];
    sprite->data[1] = 0;

    sprite->callback = sub_80D541C;
    sub_80D541C(sprite);
}

void sub_80D541C(struct Sprite *sprite)
{
    sprite->pos2.x = Sin(sprite->data[1], sprite->data[2] >> 8);
    sprite->pos2.y = Cos(sprite->data[1], sprite->data[2] >> 8);

    sprite->data[1] = (sprite->data[1] + 10) & 0xFF;
    sprite->data[2] += 0xD0;

    if (--sprite->data[0] == -1)
        DestroyAnimSprite(sprite);
}

void sub_80D5470(u8 taskId) // initialize animation task for Move_ERUPTION?
{
    struct Task *task = &gTasks[taskId];

    task->data[15] = GetAnimBankSpriteId(0);

    task->data[0] = 0;
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = gSprites[task->data[15]].pos1.y;
    task->data[5] = GetBankSide(gAnimBankAttacker);
    task->data[6] = 0;

    sub_8078E70(task->data[15], 0);

    task->func = sub_80D54E0;
}

void sub_80D54E0(u8 taskId) // animate Move_ERUPTION?
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        sub_8079C08(task, task->data[15], 0x100, 0x100, 0xE0, 0x200, 0x20);

        task->data[0]++;
    case 1:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;

            if (++task->data[2] & 0x1)
                gSprites[task->data[15]].pos2.x = 3;
            else
                gSprites[task->data[15]].pos2.x = -3;
        }

        if (task->data[5])
        {
            if (++task->data[3] > 4)
            {
                task->data[3] = 0;
                gSprites[task->data[15]].pos1.y++;
            }
        }

        if(!sub_8079C74(task))
        {
            sub_8079A64(task->data[15]);
            gSprites[task->data[15]].pos2.x = 0;

            task->data[1] = 0;
            task->data[2] = 0;
            task->data[3] = 0;
            task->data[0]++;
        }
        break;
    case 2:
        if (++task->data[1] > 4)
        {
            if (task->data[5])
                sub_8079C08(task, task->data[15], 0xE0, 0x200, 0x180, 0xF0, 0x6);
            else
                sub_8079C08(task, task->data[15], 0xE0, 0x200, 0x180, 0xC0, 0x6);

            task->data[1] = 0;
            task->data[0]++;
        }
        break;
    case 3:
        if (!sub_8079C74(task))
        {
            sub_80D57C4(task->data[15], taskId, 6);

            task->data[0]++;
        }
        break;
    case 4:
        if (++task->data[1] > 1)
        {
            task->data[1] = 0;

            if (++task->data[2] & 1)
                gSprites[task->data[15]].pos2.y += 3;
            else
                gSprites[task->data[15]].pos2.y -= 3;
        }

        if (++task->data[3] > 0x18)
        {
            if (task->data[5])
                sub_8079C08(task, task->data[15], 0x180, 0xF0, 0x100, 0x100, 0x8);
            else
                sub_8079C08(task, task->data[15], 0x180, 0xC0, 0x100, 0x100, 0x8);

            if (task->data[2] & 1)
                gSprites[task->data[15]].pos2.y -= 3;

            task->data[1] = 0;
            task->data[2] = 0;
            task->data[3] = 0;
            task->data[0]++;
        }
        break;
    case 5:
        if (task->data[5])
            gSprites[task->data[15]].pos1.y--;

        if (!sub_8079C74(task))
        {
            gSprites[task->data[15]].pos1.y = task->data[4];
            sub_8078F40(task->data[15]);

            task->data[2] = 0;
            task->data[0]++;
        }
        break;
    case 6:
        if (!task->data[6])
            DestroyAnimVisualTask(taskId);

        break;
    default:
    }
}

void sub_80D57C4(u8 spriteId, u8 taskId, u8 a3)
{
    u16 i, j;
    s8 sign;

    u16 y = sub_80D5940(spriteId);
    u16 x = gSprites[spriteId].pos1.x;

    if(!GetBankSide(gAnimBankAttacker))
    {
        x -= 0xC;
        sign = 1;
    }
    else
    {
        x += 0x10;
        sign = -1;
    }

    for (i = 0, j = 0; i <= 6; i++)
    {
        u8 spriteId = CreateSprite(&gSpriteTemplate_83D96C4, x, y, 2);

        if (spriteId != 0x40)
        {
            gSprites[spriteId].oam.tileNum += j * 4 + 0x40;

            if (++j >= 5)
                j = 0;

            sub_80D5994(&gSprites[spriteId], gHeatedRockCoords[i][0] * sign, gHeatedRockCoords[i][1]);
            gSprites[spriteId].data[6] = taskId;
            gSprites[spriteId].data[7] = a3;

            gTasks[taskId].data[a3]++;
        }
    }
}