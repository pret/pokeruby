#include "global.h"
#include "event_data.h"
#include "field_camera.h"
#include "field_effect.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "script.h"
#include "sound.h"
#include "task.h"
#include "constants/field_effects.h"
#include "constants/songs.h"

static void Task_SecretBasePCTurnOn(u8);

u32 FldEff_SecretBasePCTurnOn(void)
{
    s16 x, y;
    u8 taskId;

    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    taskId = CreateTask(Task_SecretBasePCTurnOn, 0);
    gTasks[taskId].data[0] = x;
    gTasks[taskId].data[1] = y;
    gTasks[taskId].data[2] = 0;

    return 0;
}

static void Task_SecretBasePCTurnOn(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    switch (data[2])
    {
    case 4:
    case 12:
        MapGridSetMetatileIdAt(data[0], data[1], 548);
        CurrentMapDrawMetatileAt(data[0], data[1]);
        break;
    case 8:
    case 16:
        MapGridSetMetatileIdAt(data[0], data[1], 544);
        CurrentMapDrawMetatileAt(data[0], data[1]);
        break;
    case 20:
        MapGridSetMetatileIdAt(data[0], data[1], 548);
        CurrentMapDrawMetatileAt(data[0], data[1]);
        FieldEffectActiveListRemove(FLDEFF_SECRET_BASE_PC_TURN_ON);
        EnableBothScriptContexts();
        DestroyTask(taskId);
        return;
    }

    data[2]++;
}

void DoSecretBasePCTurnOffEffect(void)
{
    s16 x, y;

    GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
    PlaySE(SE_PC_OFF);

    if (!VarGet(VAR_CURRENT_SECRET_BASE))
        MapGridSetMetatileIdAt(x, y, 3616);
    else
        MapGridSetMetatileIdAt(x, y, 3617);

    CurrentMapDrawMetatileAt(x, y);
}
