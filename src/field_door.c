#include "global.h"
#include "task.h"

extern u8 sub_8056EAC(u8);

struct UnknownStruct
{
    u16 unk0;
    u8 unk2;
    u8 filler3;
    u32 unk4;
    u8 filler8[4];
};

extern u8 gUnknown_0830F87C[];
extern u8 gUnknown_0830F890[];
extern struct UnknownStruct gDoorAnimGraphicsTable[];

void sub_8058378(void *src)
{
    CpuFastSet(src, (void *)(VRAM + 0x7F00), 0x40);
}

void door_build_blockdef(u16 *a, u16 b, u8 *c)
{
    int i;
    u16 unk;
    
    for(i = 0; i < 4; i++)
    {
        unk = *(c++) << 12;
        a[i] = unk | (b + i);
    }
    for(; i < 8; i++)
    {
        unk = *(c++) << 12;
        a[i] = unk;
    }
}

void sub_80583CC(u32 a, u32 b, u8 *c)
{
    u16 arr[8];
    
    door_build_blockdef(arr, 0x3F8, c);
    DrawDoorMetatileAt(a, b - 1, arr);
    door_build_blockdef(arr, 0x3FC, c + 4);
    DrawDoorMetatileAt(a, b, arr);
}

void sub_805840C(u32 a, u32 b)
{
    CurrentMapDrawMetatileAt(a, b - 1);
    CurrentMapDrawMetatileAt(a, b);
}

void sub_8058428(u32 *a, u16 *b, u32 c, u32 d)
{
    if(b[1] == 0xFFFF)
        sub_805840C(c, d);
    else
    {
        sub_8058378(a[1] + b[1]);
        sub_80583CC(c, d, a[2]);
    }
}

bool32 sub_8058464(u32 *a, u8 *b, s16 *c)
{
    if(c[5] == 0)
    {
        sub_8058428(a, &b[c[4] * 4], c[6], c[7]);
    }
    if(c[5] == b[c[4] * 4])
    {
        c[5] = 0;
        c[4]++;
        if(b[c[4] * 4] == 0)
            return FALSE;
        else
            return TRUE;
    }
    c[5]++;
    return TRUE;
}

void task50_overworld_door(u8 taskId)
{
    u16 *taskData = gTasks[taskId].data;
    u32 unk1 = taskData[0] << 16 | taskData[1];
    u32 unk2 = taskData[2] << 16 | taskData[3];
    
    if(sub_8058464(unk2, unk1, taskData) == FALSE)
        DestroyTask(taskId);
}

u8 *door_frame_last(u8 *a, u8 *unused)
{
    while(*a != 0)
        a += 4;
    return a - 4;
}

struct UnknownStruct *door_find(struct UnknownStruct *a, u16 b)
{
    while(a->unk4 != 0)
    {
        if(a->unk0 == b)
            return a;
        a++;
    }
    return NULL;
}

s8 task_overworld_door_add_if_inactive(u32 a, u32 b, u32 c, u32 d)
{
    if(FuncIsActiveTask(task50_overworld_door) == TRUE)
        return -1;
    else
    {
        u8 taskId = CreateTask(task50_overworld_door, 0x50);
        s16 *taskData = gTasks[taskId].data;
        
        taskData[6] = c;
        taskData[7] = d;
        taskData[1] = b;
        taskData[0] = b >> 16;
        taskData[3] = a;
        taskData[2] = a >> 16;
        return taskId;
    }
}

void sub_805859C(u32 unused, u32 b, u32 c)
{
    sub_805840C(b, c);
}

void sub_80585AC(struct UnknownStruct *a, u32 b, u32 c)
{
    a = door_find(a, MapGridGetMetatileIdAt(b, c));
    if(a != NULL)
    {
        sub_8058428(a, door_frame_last(gUnknown_0830F87C, gUnknown_0830F87C), b, c);
    }
}

s8 sub_80585EC(struct UnknownStruct *a, u32 b, u32 c)
{
    a = door_find(a, MapGridGetMetatileIdAt(b, c));
    if(a == NULL)
        return -1;
    else
        return task_overworld_door_add_if_inactive(a, gUnknown_0830F87C, b, c);
}

s8 sub_805862C(struct UnknownStruct *a, u32 b, u32 c)
{
    a = door_find(a, MapGridGetMetatileIdAt(b, c));
    if(a == NULL)
        return -1;
    else
        return task_overworld_door_add_if_inactive(a, gUnknown_0830F890, b, c);
}

s8 cur_mapdata_get_door_x2_at(struct UnknownStruct *a, u32 b, u32 c)
{
    a = door_find(a, MapGridGetMetatileIdAt(b, c));
    if(a == NULL)
        return -1;
    else
        return a->unk2;
}

void unref_sub_805869C(u32 a, u32 b)
{
    sub_80585EC(gDoorAnimGraphicsTable, a, b);
}

void sub_80586B4(u32 a, u32 b)
{
    if(sub_8056EAC(MapGridGetMetatileBehaviorAt(a, b)) != 0)
        sub_80585AC(gDoorAnimGraphicsTable, a, b);
}

void sub_80586E0(u32 a, u32 b)
{
    if(sub_8056EAC(MapGridGetMetatileBehaviorAt(a, b)) != 0)
        sub_805859C(gDoorAnimGraphicsTable, a, b);
}

s8 sub_805870C(u32 a, u32 b)
{
    if(sub_8056EAC(MapGridGetMetatileBehaviorAt(a, b)) == 0)
        return -1;
    else
        return sub_805862C(gDoorAnimGraphicsTable, a, b);
}

s8 task_overworld_door_add_if_role_69_for_opening_door_at(u32 a, u32 b)
{
    if(sub_8056EAC(MapGridGetMetatileBehaviorAt(a, b)) == 0)
        return -1;
    else
        return sub_80585EC(gDoorAnimGraphicsTable, a, b);
}

bool8 sub_805877C(void)
{
    return FuncIsActiveTask(task50_overworld_door);
}

u8 sub_8058790(u32 a, u32 b)
{
    if(cur_mapdata_get_door_x2_at(gDoorAnimGraphicsTable, a, b) == 0)
        return 8;
    else
        return 18;
}
