#include "global.h"
#include "rom_8077ABC.h"
#include "trig.h"
#include "battle_anim.h"
#include "sound.h"

extern s16 gBattleAnimArgs[];
extern u8 gBattleAnimAttacker;
extern u8 gBattleAnimTarget;

static void AnimTask_Minimize_Step(u8 taskId);
void CreateMinimizeSprite(struct Task* task, u8 taskId);
void ClonedMinimizeSprite_Step(struct Sprite* sprite);

// shadow_minimize (the minimizing-like shadow over the Pokemon effect.)
// Used in Minimize.

void AnimTask_Minimize(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    u8 spriteId = GetAnimBattlerSpriteId(0);
    task->data[0] = spriteId;
    PrepareBattlerSpriteForRotScale(spriteId, 0);
    task->data[1] = 0;
    task->data[2] = 0;
    task->data[3] = 0;
    task->data[4] = 0x100;
    task->data[5] = 0;
    task->data[6] = 0;
    task->data[7] = GetBattlerSubpriority(gBattleAnimAttacker);
    task->func = AnimTask_Minimize_Step;
}

void AnimTask_Minimize_Step(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    switch (task->data[1])
    {
    case 0:
        if (task->data[2] == 0 || task->data[2] == 3 || task->data[2] == 6)
            CreateMinimizeSprite(task, taskId);
        task->data[2]++;
        task->data[4] += 0x28;
        obj_id_set_rotscale(task->data[0], task->data[4], task->data[4], 0);
        sub_8079A64(task->data[0]);
        if (task->data[2] == 32)
        {
            task->data[5]++;
            task->data[1]++;
        }
        break;
    case 1:
        if (task->data[6] == 0)
        {
            if (task->data[5] == 3)
            {
                task->data[2] = 0;
                task->data[1] = 3;
            }
            else
            {
                task->data[2] = 0;
                task->data[3] = 0;
                task->data[4] = 0x100;
                obj_id_set_rotscale(task->data[0], task->data[4], task->data[4], 0);
                sub_8079A64(task->data[0]);
                task->data[1] = 2;
            }
        }
        break;
    case 2:
        task->data[1] = 0;
        break;
    case 3:
        if (++task->data[2] > 32)
        {
            task->data[2] = 0;
            task->data[1]++;
        }
        break;
    case 4:
        task->data[2] += 2;
        task->data[4] -= 0x50;
        obj_id_set_rotscale(task->data[0], task->data[4], task->data[4], 0);
        sub_8079A64(task->data[0]);
        if (task->data[2] == 32)
        {
            task->data[2] = 0;
            task->data[1]++;
        }
        break;
    case 5:
        sub_8078F40(task->data[0]);
        gSprites[task->data[15]].pos2.y = 0;
        DestroyAnimVisualTask(taskId);
        break;
    }
}

void CreateMinimizeSprite(struct Task* task, u8 taskId)
{
    s16 matrixNum; // u16 in Emerald
    s16 spriteId = duplicate_obj_of_side_rel2move_in_transparent_mode(0);

    if (spriteId >= 0)
    {
        matrixNum = AllocOamMatrix();
        if (matrixNum == 0xFF)
        {
            obj_delete_but_dont_free_vram(&gSprites[spriteId]);
            return;
        }
        else
        {
            gSprites[spriteId].oam.objMode = ST_OAM_OBJ_BLEND;
            gSprites[spriteId].oam.affineMode = ST_OAM_AFFINE_DOUBLE;
            gSprites[spriteId].affineAnimPaused = TRUE;
            gSprites[spriteId].oam.matrixNum = matrixNum;
            gSprites[spriteId].subpriority = task->data[7] - task->data[3];
            task->data[3]++;
            task->data[6]++;
            gSprites[spriteId].data[0] = 16; 
            gSprites[spriteId].data[1] = taskId;
            gSprites[spriteId].data[2] = 6;
            gSprites[spriteId].callback = ClonedMinimizeSprite_Step;
            obj_id_set_rotscale(spriteId, task->data[4], task->data[4], 0);
            gSprites[spriteId].oam.affineMode = 1;
            CalcCenterToCornerVec(&gSprites[spriteId], gSprites[spriteId].oam.shape, gSprites[spriteId].oam.size, gSprites[spriteId].oam.affineMode);
        }
    }
}

void ClonedMinimizeSprite_Step(struct Sprite* sprite)
{
    if (--sprite->data[0] == 0)
    {
        gTasks[sprite->data[1]].data[sprite->data[2]]--;
        FreeOamMatrix(sprite->oam.matrixNum);
        obj_delete_but_dont_free_vram(sprite);
    }
}
