#include "field_map_obj.h"
#include "script_movement.h"
#include "global.h"
#include "map_obj_lock.h"
#include "field_map_obj_helpers.h"
#include "field_player_avatar.h"
#include "task.h"

extern u16 gScriptFacing;

bool8 walkrun_is_standing_still(void)
{
    if (gPlayerAvatar.running1 == 1)
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

void ScriptFreezeMapObjects(void)
{
    FreezeMapObjects();
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
    if (!task->data[1] && !gMapObjects[gSelectedMapObject].mapobj_bit_1)
    {
        FreezeMapObject(&gMapObjects[gSelectedMapObject]);
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

void sub_8064DD8(void)
{
    u8 taskId;
    FreezeMapObjectsExceptOne(gSelectedMapObject);
    taskId = CreateTask(sub_8064D38, 80);
    if (!gMapObjects[gSelectedMapObject].mapobj_bit_1)
    {
        FreezeMapObject(&gMapObjects[gSelectedMapObject]);
        gTasks[taskId].data[1] = 1;
    }
}

void sub_8064E2C(void)
{
    u8 objectId = GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0);
    FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[objectId]);
    sub_80A2178();
    UnfreezeMapObjects();
}

void unref_sub_8064E5C(void)
{
    u8 objectId;

    if (gMapObjects[gSelectedMapObject].active)
        FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[gSelectedMapObject]);
    objectId = GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0);
    FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[objectId]);
    sub_80A2178();
    UnfreezeMapObjects();
}

void sub_8064EAC(void)
{
    FieldObjectFaceOppositeDirection(&gMapObjects[gSelectedMapObject], gScriptFacing);
}

void sub_8064ED4(void)
{
    FieldObjectClearAnimIfSpecialAnimActive(&gMapObjects[gSelectedMapObject]);
}
