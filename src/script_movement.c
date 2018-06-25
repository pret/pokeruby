#include "global.h"
#include "script_movement.h"
#include "event_object_movement.h"
#include "task.h"
#include "util.h"

static EWRAM_DATA const u8 *gUnknown_020384F8[16] = {0};

static void sub_80A2198(u8);
static u8 sub_80A21E0(void);
static bool8 sub_80A21F4(u8, u8, const u8 *);
static u8 sub_80A2260(u8, u8);
static bool8 sub_80A2370(u8, u8);
static void sub_80A23C8(u8, u8, u8, const u8 *);
static void UnfreezeObjects(u8);
static void Task_80A244C(u8);
static void sub_80A2490(u8, u8, u8, const u8 *);

bool8 ScriptMovement_StartObjectMovementScript(u8 localId, u8 mapNum, u8 mapGroup, const u8 *movementScript)
{
    u8 eventObjId;

    if (TryGetEventObjectIdByLocalIdAndMap(localId, mapNum, mapGroup, &eventObjId))
        return TRUE;
    if (!FuncIsActiveTask(Task_80A244C))
        sub_80A2198(50);
    return sub_80A21F4(sub_80A21E0(), eventObjId, movementScript);
}

bool8 ScriptMovement_IsObjectMovementFinished(u8 localId, u8 mapNum, u8 mapBank)
{
    u8 eventObjId;
    u8 r4;
    u8 r1;

    if (TryGetEventObjectIdByLocalIdAndMap(localId, mapNum, mapBank, &eventObjId))
        return TRUE;
    r4 = sub_80A21E0();
    r1 = sub_80A2260(r4, eventObjId);
    if (r1 == 16)
        return TRUE;
    return sub_80A2370(r4, r1);
}

void sub_80A2178(void)
{
    u8 taskId;

    taskId = sub_80A21E0();
    if (taskId != 0xFF)
    {
        UnfreezeObjects(taskId);
        DestroyTask(taskId);
    }
}

static void sub_80A2198(u8 priority)
{
    u8 taskId;
    u8 i;

    taskId = CreateTask(Task_80A244C, priority);
    for (i = 1; i < 16; i++)
        gTasks[taskId].data[i] = 0xFFFF;
}

static u8 sub_80A21E0(void)
{
    return FindTaskIdByFunc(Task_80A244C);
}

static bool8 sub_80A21F4(u8 taskId, u8 eventObjId, const u8 *movementScript)
{
    u8 r4;

    r4 = sub_80A2260(taskId, eventObjId);
    if (r4 != 16)
    {
        if (sub_80A2370(taskId, r4) == 0)
        {
            return TRUE;
        }
        else
        {
            sub_80A23C8(taskId, r4, eventObjId, movementScript);
            return FALSE;
        }
    }
    r4 = sub_80A2260(taskId, 0xFF);
    if (r4 == 16)
    {
        return TRUE;
    }
    else
    {
        sub_80A23C8(taskId, r4, eventObjId, movementScript);
        return FALSE;
    }
}

static u8 sub_80A2260(u8 taskId, u8 b)
{
    u8 *ptr;
    u8 i;

    ptr = (u8 *)&gTasks[taskId].data[1];
    for (i = 0; i < 16; i++, ptr++)
    {
        if (*ptr == b)
            return i;
    }
    return 16;
}

static void sub_80A229C(u8 taskId, u8 b, u8 **c)
{
    u8 i;

    *c = (u8 *)&gTasks[taskId].data[1];
    for (i = 0; i < b; i++, (*c)++)
        ;
}

static void sub_80A22D0(u8 taskId, u8 b, u8 c)
{
    u8 *ptr;

    sub_80A229C(taskId, b, &ptr);
    *ptr = c;  //what is this supposed to do?
}

static void sub_80A22F4(u8 taskId, u8 b, u8 *c)
{
    u8 *ptr;

    sub_80A229C(taskId, b, &ptr);
    *c = *ptr;
}

static void sub_80A2318(u8 a, u8 b)
{
    u16 var = ~gBitTable[b];

    gTasks[a].data[0] &= var;
}

static void sub_80A2348(u8 taskId, u8 b)
{
    gTasks[taskId].data[0] |= gBitTable[b];
}

static bool8 sub_80A2370(u8 taskId, u8 b)
{
    u16 var = (u16)gTasks[taskId].data[0] & gBitTable[b];

    if (var != 0)
        return TRUE;
    else
        return FALSE;
}

static void npc_obj_offscreen_culling_and_flag_update(u8 a, const u8 *movementScript)
{
    gUnknown_020384F8[a] = movementScript;
}

static const u8 *sub_80A23B8(u8 a)
{
    return gUnknown_020384F8[a];
}

static void sub_80A23C8(u8 taskId, u8 b, u8 eventObjId, const u8 *movementScript)
{
    sub_80A2318(taskId, b);
    npc_obj_offscreen_culling_and_flag_update(b, movementScript);
    sub_80A22D0(taskId, b, eventObjId);
}

static void UnfreezeObjects(u8 taskId)
{
    u8 *pEventObjId;
    u8 i;

    pEventObjId = (u8 *)&gTasks[taskId].data[1];
    for (i = 0; i < 16; i++, pEventObjId++)
    {
        if (*pEventObjId != 0xFF)
            UnfreezeEventObject(&gEventObjects[*pEventObjId]);
    }
}

static void Task_80A244C(u8 taskId)
{
    u8 i;
    u8 var;

    for (i = 0; i < 16; i++)
    {
        sub_80A22F4(taskId, i, &var);
        if (var != 0xFF)
            sub_80A2490(taskId, i, var, sub_80A23B8(i));
    }
}

static void sub_80A2490(u8 taskId, u8 b, u8 eventObjId, const u8 *d)
{
    u8 var;

    if (EventObjectIsHeldMovementActive(&gEventObjects[eventObjId])
     && !EventObjectClearHeldMovementIfFinished(&gEventObjects[eventObjId]))
        return;

    var = *d;
    if (var == 0xFE)
    {
        sub_80A2348(taskId, b);
        FreezeEventObject(&gEventObjects[eventObjId]);
    }
    else
    {
        if (!EventObjectSetHeldMovement(&gEventObjects[eventObjId], var))
        {
            d++;
            npc_obj_offscreen_culling_and_flag_update(b, d);
        }
    }
}
