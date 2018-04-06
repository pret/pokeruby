#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"
#include "battle_interface.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern u8 gNoOfAllBanks;
extern u8 gHealthboxIDs[];

static void sub_80CE1AC(struct Sprite* sprite);

// tile_out (makes a tile fly inward into a center point.)
// Used in Conversion 2.

void sub_80CE17C(struct Sprite* sprite)
{
    sub_8078764(sprite, 0);
    sprite->animPaused = 1;
    sprite->data[0] = gBattleAnimArgs[2];
    sprite->callback = sub_80CE1AC;
}

void sub_80CE1AC(struct Sprite* sprite)
{
    if (sprite->data[0])
    {
        sprite->data[0]--;
    }
    else
    {
        sprite->animPaused = 0;
        sprite->data[0] = 30;
        sprite->data[2] = GetBankPosition(gAnimBankAttacker, 2);
        sprite->data[4] = GetBankPosition(gAnimBankAttacker, 3);
        sprite->callback = StartTranslateAnimSpriteByDeltas;
        StoreSpriteCallbackInData(sprite, DestroyAnimSprite);
    }
}

void sub_80CE210(u8 taskId)
{
    if (++gTasks[taskId].data[0] == 4)
    {
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1]++;
        REG_BLDALPHA = gTasks[taskId].data[1] | ((16 - gTasks[taskId].data[1]) << 8);
        if (gTasks[taskId].data[1] == 16)
            DestroyAnimVisualTask(taskId);
    }
}

void unref_sub_80CE260(u8 taskId)
{
    u8 i;
    for (i = 0; i < gNoOfAllBanks; i++)
    {
        if (gBattleAnimArgs[0] == 1 && GetBattlerSide(i) == 0)
            sub_8043DB0(gHealthboxIDs[i]);

        if (gBattleAnimArgs[1] == 1 && GetBattlerSide(i) == 1)
            sub_8043DB0(gHealthboxIDs[i]);
    }

    DestroyAnimVisualTask(taskId);
}

void unref_sub_80CE2D4(u8 taskId)
{
    u8 i;
    for (i = 0; i < gNoOfAllBanks; i++)
    {
        sub_8043DFC(gHealthboxIDs[i]);
    }

    DestroyAnimVisualTask(taskId);
}
