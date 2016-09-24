#include "global.h"
#include "task.h"
#include "fieldmap.h"

extern void sub_80594C0(void);
extern void sub_80597F4(void);
extern void player_bitmagic(void);
extern void sub_80643A4(struct MapObject *);
extern void sub_8064470(u8);
extern u8 GetFieldObjectIdByLocalIdAndMap(u8, u8, u8);
extern u8 FieldObjectClearAnimIfSpecialAnimFinished(void *);
extern void sub_80A2178(void);
extern void sub_806451C(void);
extern u8 FieldObjectFaceOppositeDirection(void *, u8);

extern u16 gUnknown_0202E8E0;

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

void sub_8064D20(void)
{
    player_bitmagic();
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
        sub_80643A4(&gMapObjects[gSelectedMapObject]);
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
    sub_8064470(gSelectedMapObject);
    taskId = CreateTask(sub_8064D38, 80);
    if (!gMapObjects[gSelectedMapObject].mapobj_bit_1)
    {
        sub_80643A4(&gMapObjects[gSelectedMapObject]);
        gTasks[taskId].data[1] = 1;
    }
}

void sub_8064E2C(void)
{
    u8 objectId = GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0);
    FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[objectId]);
    sub_80A2178();
    sub_806451C();
}

void unref_sub_8064E5C(void)
{
    u8 objectId;

    if (gMapObjects[gSelectedMapObject].active)
        FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[gSelectedMapObject]);
    objectId = GetFieldObjectIdByLocalIdAndMap(0xFF, 0, 0);
    FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[objectId]);
    sub_80A2178();
    sub_806451C();
}

void sub_8064EAC(void)
{
    FieldObjectFaceOppositeDirection(&gMapObjects[gSelectedMapObject], gUnknown_0202E8E0);
}

void sub_8064ED4(void)
{
    FieldObjectClearAnimIfSpecialAnimActive(&gMapObjects[gSelectedMapObject]);
}
