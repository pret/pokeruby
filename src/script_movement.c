#include "global.h"
#include "asm.h"
#include "field_map_obj_helpers.h"
#include "task.h"

extern const u32 gBitTable[];
extern u8 *gUnknown_020384F8[];

extern void UnfreezeMapObject(struct MapObject *);
extern bool8 FieldObjectIsSpecialAnimActive(struct MapObject *);

static void sub_80A2198(u8);
static u8 sub_80A21E0(void);
static bool8 sub_80A21F4(u8, u8, u8 *);
static u8 sub_80A2260(u8, u8);
static bool8 sub_80A2370(u8, u8);
static void sub_80A23C8(u8, u8, u8, u8 *);
static void sub_80A2408(u8);
static void Task_80A244C(u8);
static void sub_80A2490(u8, u8, u8, u8 *);

bool8 exec_movement(u8 a, u8 b, u8 c, u8 *d)
{
    u8 mapObjId;
    
    if (TryGetFieldObjectIdByLocalIdAndMap(a, b, c, &mapObjId))
        return TRUE;
    if (!FuncIsActiveTask(Task_80A244C))
        sub_80A2198(50);
    return sub_80A21F4(sub_80A21E0(), mapObjId, d);
}

bool8 sub_80A212C(u8 a, u8 b, u8 c)
{
    u8 mapObjId;
    u8 r4;
    u8 r1;
    
    if (TryGetFieldObjectIdByLocalIdAndMap(a, b, c, &mapObjId))
        return 1;
    r4 = sub_80A21E0();
    r1 = sub_80A2260(r4, mapObjId);
    if (r1 == 16)
        return 1;
    return sub_80A2370(r4, r1);
}

void sub_80A2178(void)
{
    u8 taskId;
    
    taskId = sub_80A21E0();
    if (taskId != 0xFF)
    {
        sub_80A2408(taskId);
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

static bool8 sub_80A21F4(u8 taskId, u8 b, u8 *c)
{
    u8 r4;
    
    r4 = sub_80A2260(taskId, b);
    if (r4 != 16)
    {
        if (sub_80A2370(taskId, r4) == 0)
            return TRUE;
        else
        {
            sub_80A23C8(taskId, r4, b, c);
            return FALSE;
        }
    }
    r4 = sub_80A2260(taskId, 0xFF);
    if (r4 == 16)
        return TRUE;
    else
    {
        sub_80A23C8(taskId, r4, b, c);
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

static void npc_obj_offscreen_culling_and_flag_update(u8 a, u8 *b)
{
    gUnknown_020384F8[a] = b;
}

static u8 *sub_80A23B8(u8 a)
{
    return gUnknown_020384F8[a];
}

static void sub_80A23C8(u8 taskId, u8 b, u8 c, u8 *d)
{
    sub_80A2318(taskId, b);
    npc_obj_offscreen_culling_and_flag_update(b, d);
    sub_80A22D0(taskId, b, c);
}

static void sub_80A2408(u8 a)
{
    u8 *ptr;
    u8 i;
    
    ptr = (u8 *)&gTasks[a].data[1];
    for (i = 0; i < 16; i++, ptr++)
    {
        if (*ptr != 0xFF)
            UnfreezeMapObject(&gMapObjects[*ptr]);
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

static void sub_80A2490(u8 taskId, u8 b, u8 c, u8 *d)
{
    u8 var;
    
    if (FieldObjectIsSpecialAnimActive(&gMapObjects[c])
     && !FieldObjectClearAnimIfSpecialAnimFinished(&gMapObjects[c]))
        return;
    
    var = *d;
    if (var == 0xFE)
    {
        sub_80A2348(taskId, b);
        FreezeMapObject(&gMapObjects[c]);
    }
    else
    {
        if (!FieldObjectSetSpecialAnim(&gMapObjects[c], var))
        {
            d++;
            npc_obj_offscreen_culling_and_flag_update(b, d);
        }
    }
}
