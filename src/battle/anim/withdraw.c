#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gAnimBankAttacker;
extern u8 gAnimBankTarget;

extern u8 gBankSpriteIds[];

static void sub_80CF514(u8 taskId);

// withdraw (where a Pokemon leans inward to mimic the effect of withdrawing into a shell.)
// Used in Withdraw.

void sub_80CF4D8(u8 taskId)
{
    sub_8078E70(gBankSpriteIds[gAnimBankAttacker], 0);
    gTasks[taskId].func = sub_80CF514;
}

void sub_80CF514(u8 taskId)
{
    u8 a = gBankSpriteIds[gAnimBankAttacker];
    s16 b;
    if (GetBattlerSide(gAnimBankAttacker) == 0)
    {
        b = -gTasks[taskId].data[0];
    }
    else
    {
        b = gTasks[taskId].data[0];
    }

    obj_id_set_rotscale(a, 0x100, 0x100, b);
    if (gTasks[taskId].data[1] == 0)
    {
        gTasks[taskId].data[0] += 0xB0;
        gSprites[a].pos2.y++;
    }
    else if (gTasks[taskId].data[1] == 1)
    {
        if (++gTasks[taskId].data[3] == 0x1E)
            gTasks[taskId].data[1] = 2;

        return;
    }
    else
    {
        gTasks[taskId].data[0] -= 0xB0;
        gSprites[a].pos2.y--;
    }

    sub_8078F9C(a);
    if (gTasks[taskId].data[0] == 0xF20 || gTasks[taskId].data[0] == 0)
    {
        if (gTasks[taskId].data[1] == 2)
        {
            sub_8078F40(a);
            DestroyAnimVisualTask(taskId);
        }
        else
        {
            gTasks[taskId].data[1]++;
        }
    }
}
