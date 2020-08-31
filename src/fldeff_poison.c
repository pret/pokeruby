#include "global.h"
#include "fldeff_poison.h"
#include "task.h"
#include "constants/songs.h"
#include "sound.h"

static void Task_FieldPoisonEffect(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[0])
    {
    case 0:
        data[1] += 2;
        if (data[1] > 8)
        {
            data[0]++;
        }
        break;
    case 1:
        data[1] -= 2;
        if (data[1] == 0)
        {
            data[0]++;
        }
        break;
    case 2:
        DestroyTask(taskId);
        return;
    }

    REG_MOSAIC = (data[1] << 4) | data[1];
}

void FldeffPoison_Start(void)
{
    PlaySE(SE_DOKU);
    CreateTask(Task_FieldPoisonEffect, 80);
}

bool32 FldeffPoison_IsActive(void)
{
    return FuncIsActiveTask(Task_FieldPoisonEffect);
}
