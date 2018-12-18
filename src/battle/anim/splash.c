#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;

static void AnimTask_SplashStep(u8 taskId);

// splash (splash effect of hopping up and down)
// Used in Splash, Mud Sport, and Sketch.

const union AffineAnimCmd gSpriteAffineAnim_83D76F4[] =
{
    AFFINEANIMCMD_FRAME(-6, 4, 0, 8),
    AFFINEANIMCMD_FRAME(10, -10, 0, 8),
    AFFINEANIMCMD_FRAME(-4, 6, 0, 8),
    AFFINEANIMCMD_END,
};

// Task to facilitate expanding and hopping effect seen in Splash.
// arg 0: anim battler
// arg 1: num hops
void AnimTask_Splash(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    if (gBattleAnimArgs[1] == 0)
    {
        DestroyAnimVisualTask(taskId);
    }
    else
    {
        u8 spriteId = GetAnimBattlerSpriteId(gBattleAnimArgs[0]);
        task->data[0] = spriteId;
        task->data[1] = 0;
        task->data[2] = gBattleAnimArgs[1];
        task->data[3] = 0;
        task->data[4] = 0;
        sub_80798F4(task, spriteId, &gSpriteAffineAnim_83D76F4);
        task->func = AnimTask_SplashStep;
    }
}

void AnimTask_SplashStep(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    switch (task->data[1])
    {
    case 0:
        sub_807992C(task);
        task->data[4] += 3;
        gSprites[task->data[0]].pos2.y += task->data[4];
        if (++task->data[3] > 7)
        {
            task->data[3] = 0;
            task->data[1]++;
        }
        break;
    case 1:
        sub_807992C(task);
        gSprites[task->data[0]].pos2.y += task->data[4];
        if (++task->data[3] > 7)
        {
            task->data[3] = 0;
            task->data[1]++;
        }
        break;
    case 2:
        if (task->data[4] != 0)
        {
            gSprites[task->data[0]].pos2.y -= 2;
            task->data[4] -= 2;
        }
        else
            task->data[1]++;
        break;
    case 3:
        if (!sub_807992C(task))
        {
            if (--task->data[2] == 0)
            {
                gSprites[task->data[0]].pos2.y = 0;
                DestroyAnimVisualTask(taskId);
            }
            else
            {
                sub_80798F4(task, task->data[0], &gSpriteAffineAnim_83D76F4);
                task->data[1] = 0;
            }
        }
        break;
    }
}
