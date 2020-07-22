#include "global.h"
#include "event_object_lock.h"
#include "event_object_movement.h"
#include "field_player_avatar.h"
#include "script_movement.h"
#include "task.h"

extern u16 gSpecialVar_Facing;
u8 gSelectedObjectEvent;

bool8 walkrun_is_standing_still(void)
{
    if (gPlayerAvatar.tileTransitionState == T_TILE_TRANSITION)
        return FALSE;
    else
        return TRUE;
}

void sub_8064CDC(u8 taskId)
{
    if (walkrun_is_standing_still())
    {
        sub_80594C0();
        DestroyTask(taskId);
    }
}

bool8 sub_8064CFC(void)
{
    if (FuncIsActiveTask(sub_8064CDC))
    {
        return FALSE;
    }
    else
    {
        sub_80597F4();
        return TRUE;
    }
}

void ScriptFreezeObjectEvents(void)
{
    FreezeObjectEvents();
    CreateTask(sub_8064CDC, 80);
}

void sub_8064D38(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (!task->data[0] && walkrun_is_standing_still() == TRUE)
    {
        sub_80594C0();
        task->data[0] = 1;
    }
    if (!task->data[1] && !gObjectEvents[gSelectedObjectEvent].singleMovementActive)
    {
        FreezeObjectEvent(&gObjectEvents[gSelectedObjectEvent]);
        task->data[1] = 1;
    }
    if (task->data[0] && task->data[1])
        DestroyTask(taskId);
}

bool8 sub_8064DB4(void)
{
    if (FuncIsActiveTask(sub_8064D38))
    {
        return FALSE;
    }
    else
    {
        sub_80597F4();
        return TRUE;
    }
}

void LockSelectedObjectEvent(void)
{
    u8 taskId;
    FreezeObjectEventsExceptOne(gSelectedObjectEvent);
    taskId = CreateTask(sub_8064D38, 80);
    if (!gObjectEvents[gSelectedObjectEvent].singleMovementActive)
    {
        FreezeObjectEvent(&gObjectEvents[gSelectedObjectEvent]);
        gTasks[taskId].data[1] = 1;
    }
}

void ScriptUnfreezeObjectEvents(void)
{
    u8 playerObjectId = GetObjectEventIdByLocalIdAndMap(0xFF, 0, 0);
    ObjectEventClearHeldMovementIfFinished(&gObjectEvents[playerObjectId]);
    sub_80A2178();
    UnfreezeObjectEvents();
}

void unref_sub_8064E5C(void)
{
    u8 playerObjectId;

    if (gObjectEvents[gSelectedObjectEvent].active)
        ObjectEventClearHeldMovementIfFinished(&gObjectEvents[gSelectedObjectEvent]);
    playerObjectId = GetObjectEventIdByLocalIdAndMap(0xFF, 0, 0);
    ObjectEventClearHeldMovementIfFinished(&gObjectEvents[playerObjectId]);
    sub_80A2178();
    UnfreezeObjectEvents();
}

void sub_8064EAC(void)
{
    ObjectEventFaceOppositeDirection(&gObjectEvents[gSelectedObjectEvent], gSpecialVar_Facing);
}

void sub_8064ED4(void)
{
    ObjectEventClearHeldMovementIfActive(&gObjectEvents[gSelectedObjectEvent]);
}
