#include "global.h"
#include "event_obj_lock.h"
#include "event_object_movement.h"
#include "field_player_avatar.h"
#include "script_movement.h"
#include "task.h"

extern u16 gSpecialVar_Facing;

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

void ScriptFreezeEventObjects(void)
{
    FreezeEventObjects();
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
    if (!task->data[1] && !gEventObjects[gSelectedEventObject].singleMovementActive)
    {
        FreezeEventObject(&gEventObjects[gSelectedEventObject]);
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

void LockSelectedEventObject(void)
{
    u8 taskId;
    FreezeEventObjectsExceptOne(gSelectedEventObject);
    taskId = CreateTask(sub_8064D38, 80);
    if (!gEventObjects[gSelectedEventObject].singleMovementActive)
    {
        FreezeEventObject(&gEventObjects[gSelectedEventObject]);
        gTasks[taskId].data[1] = 1;
    }
}

void ScriptUnfreezeEventObjects(void)
{
    u8 playerObjectId = GetEventObjectIdByLocalIdAndMap(0xFF, 0, 0);
    EventObjectClearHeldMovementIfFinished(&gEventObjects[playerObjectId]);
    sub_80A2178();
    UnfreezeEventObjects();
}

void unref_sub_8064E5C(void)
{
    u8 playerObjectId;

    if (gEventObjects[gSelectedEventObject].active)
        EventObjectClearHeldMovementIfFinished(&gEventObjects[gSelectedEventObject]);
    playerObjectId = GetEventObjectIdByLocalIdAndMap(0xFF, 0, 0);
    EventObjectClearHeldMovementIfFinished(&gEventObjects[playerObjectId]);
    sub_80A2178();
    UnfreezeEventObjects();
}

void sub_8064EAC(void)
{
    EventObjectFaceOppositeDirection(&gEventObjects[gSelectedEventObject], gSpecialVar_Facing);
}

void sub_8064ED4(void)
{
    EventObjectClearHeldMovementIfActive(&gEventObjects[gSelectedEventObject]);
}
