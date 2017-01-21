#include "global.h"
#include "asm.h"
#include "task.h"

void sub_80A2198(u8);
u8 sub_80A21E0();
u8 sub_80A21F4(u8, u8, u8 *);
void sub_80A244C(u8);
u8 sub_80A2260(u8, u8);
u8 sub_80A2370();
void sub_80A2408();
void sub_80A23C8();

u8 exec_movement(u8 a, u8 b, u8 c, u8 *d)
{
    u8 mapObjId;
    
    if (TryGetFieldObjectIdByLocalIdAndMap(a, b, c, &mapObjId))
        return 1;
    if (!FuncIsActiveTask(sub_80A244C))
        sub_80A2198(50);
    return sub_80A21F4(sub_80A21E0(), mapObjId, d);
}

u8 sub_80A212C(u8 a, u8 b, u8 c)
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
    u8 r4;
    
    r4 = sub_80A21E0();
    if (r4 != 0xFF)
    {
        sub_80A2408(r4);
        DestroyTask(r4);
    }
}

void sub_80A2198(u8 priority)
{
    u8 taskId;
    u8 i;
    
    taskId = CreateTask(sub_80A244C, priority);
    for (i = 1; i < 16; i++)
    {
        gTasks[taskId].data[i] = 0xFFFF;
    }
}

u8 sub_80A21E0(void)
{
    return FindTaskIdByFunc(sub_80A244C);
}

u8 sub_80A21F4(u8 a, u8 b, u8 *c)
{
    u8 r4;
    
    r4 = sub_80A2260(a, b);
    if (r4 != 16)
    {
        if (sub_80A2370(a, r4) == 0)
            return 1;
        else
        {
            sub_80A23C8(a, r4, b, c);
            return 0;
        }
    }
    r4 = sub_80A2260(a, 0xFF);
    if (r4 == 16)
        return 1;
    else
    {
        sub_80A23C8(a, r4, b, c);
        return 0;
    }
}

u8 sub_80A2260(u8 a, u8 b)
{
    u8 *arr;
    u8 i;
    
    arr = (u8 *)&gTasks[a].data[1];
    for (i = 0; i < 16; i++, arr++)
    {
        if (*arr == b)
            return i;
    }
    return 16;
}

/*
void sub_80A229C(u8 a, u8 b, u8 **c)
{
    u8 i;
    u8 *ptr;
    
    ptr = (u8 *)&gTasks[a].data[1];
    for (i = 0; i < b; i++)
    {
        if ()
    }
}
*/

