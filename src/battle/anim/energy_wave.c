#include "global.h"
#include "battle_anim.h"
#include "rom_8077ABC.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"

extern s16 gBattleAnimArgs[8];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;
extern const struct SpriteTemplate gSpriteTemplate_83D9130[];

static void sub_80D35DC(struct Sprite *);
static void sub_80D365C(u8);
static void sub_80D370C(struct Sprite *);

// energy_wave (animates steady "waves" of energy)
// Used in Hydro Pump, Mud Shot, Signal Beam, Flamethrower, Psywave, and
// Hydro Cannon.

void sub_80D3554(struct Sprite *sprite)
{
    InitAnimSpritePos(sprite, 1);

    sprite->data[0] = 30;
    sprite->data[1] = sprite->pos1.x;
    sprite->data[2] = GetBankPosition(gAnimBankTarget, 2);
    sprite->data[3] = sprite->pos1.y;
    sprite->data[4] = GetBankPosition(gAnimBankTarget, 3);

    InitAnimSpriteTranslationDeltas(sprite);

    sprite->data[5] = 0xD200 / sprite->data[0];
    sprite->data[7] = gBattleAnimArgs[3];

    if (gBattleAnimArgs[7] > 127)
    {
        sprite->data[6] = (gBattleAnimArgs[7] - 127) << 8;
        sprite->data[7] = -sprite->data[7];
    }
    else
    {
        sprite->data[6] = gBattleAnimArgs[7] << 8;
    }

    sprite->callback = sub_80D35DC;
    sprite->callback(sprite);
}

static void sub_80D35DC(struct Sprite *sprite)
{
    if (TranslateAnimSpriteByDeltas(sprite))
    {
        DestroyAnimSprite(sprite);
    }

    sprite->pos2.y += Sin(sprite->data[6] >> 8, sprite->data[7]);
    if (((sprite->data[6] + sprite->data[5]) >> 8) > 127)
    {
        sprite->data[6] = 0;
        sprite->data[7] = -sprite->data[7];
    }
    else
    {
        sprite->data[6] += sprite->data[5];
    }
}

void sub_80D3630(u8 taskId)
{
    gTasks[taskId].data[0] = gBattleAnimArgs[0];
    gBattleAnimArgs[7] = 0;
    gTasks[taskId].func = sub_80D365C;
}

static void sub_80D365C(u8 taskId)
{
    gBattleAnimArgs[7] = (gBattleAnimArgs[7] + 3) & 0xFF;
    if (--gTasks[taskId].data[0] == 0)
    {
        DestroyAnimVisualTask(taskId);
    }
}

void sub_80D3698(struct Sprite *sprite)
{
    u8 subpriority;

    sprite->pos1.x = GetBankPosition(gAnimBankAttacker, 0);
    sprite->pos1.y = GetBankPosition(gAnimBankAttacker, 1);
    sprite->pos2.y = -10;

    subpriority = sub_8079E90(gAnimBankAttacker);

    if (!IsContest())
    {
        if (GetBankSide(gAnimBankAttacker) == 0)
        {
            sprite->pos2.x = 10;
            sprite->subpriority = subpriority + 2;
        }
        else
        {
            sprite->pos2.x = -10;
            sprite->subpriority = subpriority - 2;
        }
    }
    else
    {
        sprite->pos2.x = -10;
        sprite->subpriority = subpriority + 2;
    }

    sprite->callback = sub_80D370C;
}

static void sub_80D370C(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
    {
        DestroyAnimSprite(sprite);
    }
}

void sub_80D3728(struct Sprite *sprite)
{
    int var1, var2;

    if (GetBankSide(gAnimBankAttacker) == GetBankSide(gAnimBankTarget))
    {
        gBattleAnimArgs[0] *= -1;

        if (GetBattlerPosition(gAnimBankAttacker) == 0 || GetBattlerPosition(gAnimBankAttacker) == 1)
        {
            gBattleAnimArgs[0] *= -1;
        }

    }

    if ((gBattleAnimArgs[5] & 0xFF00) == 0)
        var1 = 1;
    else
        var1 = 0;

    if ((u8)gBattleAnimArgs[5] == 0)
        var2 = 3;
    else
        var2 = 1;

    InitAnimSpritePos(sprite, var1);

    if (GetBankSide(gAnimBankAttacker) != 0)
    {
        gBattleAnimArgs[2] = -gBattleAnimArgs[2];
    }

    sprite->data[0] = gBattleAnimArgs[4];
    sprite->data[2] = GetBankPosition(gAnimBankTarget, 2) + gBattleAnimArgs[2];
    sprite->data[4] = GetBankPosition(gAnimBankTarget, var2) + gBattleAnimArgs[3];
    sprite->callback = StartTranslateAnimSpriteByDeltas;
    StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
}
