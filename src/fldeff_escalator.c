#include "global.h"
#include "task.h"
#include "fieldmap.h"
#include "field_camera.h"
#include "field_player_avatar.h"

extern u8 gUnknown_02038731;

void sub_80B45B4(u8 taskId, const s16 *list, u16 c)
{
    s16 r5 = gTasks[taskId].data[4] - 1;
    s16 r3 = gTasks[taskId].data[5] - 1;
    s16 r4 = gTasks[taskId].data[1];
    s16 y;
    s16 x;
    
    if (gTasks[taskId].data[2] == 0)
    {
        for (y = 0; y < 3; y++)
        {
            for (x = 0; x < 3; x++)
            {
                s16 metatileId = MapGridGetMetatileIdAt(r5 + x, r3 + y);
                
                if (list[r4] == metatileId)
                {
                    if (r4 != 2)
                        MapGridSetMetatileIdAt(r5 + x, r3 + y, c | list[r4 + 1]);
                    else
                        MapGridSetMetatileIdAt(r5 + x, r3 + y, c | list[0]);
                }
            }
        }
    }
    else
    {
        for (y = 0; y < 3; y++)
        {
            for (x = 0; x < 3; x++)
            {
                s16 metatileId = MapGridGetMetatileIdAt(r5 + x, r3 + y);
                
                if (list[2 - r4] == metatileId)
                {
                    if (r4 != 2)
                        MapGridSetMetatileIdAt(r5 + x, r3 + y, c | list[1 - r4]);
                    else
                        MapGridSetMetatileIdAt(r5 + x, r3 + y, c | list[2]);
                }
            }
        }
    }
}

const u16 gUnknown_083CC714[] = {0x284, 0x282, 0x280};
const u16 gUnknown_083CC71A[] = {0x285, 0x283, 0x281};
const u16 gUnknown_083CC720[] = {0x28C, 0x28A, 0x288};
const u16 gUnknown_083CC726[] = {0x28D, 0x28B, 0x289};
const u16 gUnknown_083CC72C[] = {0x2A0, 0x2A2, 0x2A4};
const u16 gUnknown_083CC732[] = {0x2A1, 0x2A3, 0x2A5};
const u16 gUnknown_083CC738[] = {0x2A8, 0x2AA, 0x2AC};

void sub_80B4710(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    data[3] = 1;

    switch (data[0])
    {
        case 0:
            sub_80B45B4(taskId, gUnknown_083CC714, 0);
            break;
        case 1:
            sub_80B45B4(taskId, gUnknown_083CC71A, 0);
            break;
        case 2:
            sub_80B45B4(taskId, gUnknown_083CC720, 0xC00);
            break;
        case 3:
            sub_80B45B4(taskId, gUnknown_083CC726, 0);
            break;
        case 4:
            sub_80B45B4(taskId, gUnknown_083CC72C, 0xC00);
            break;
        case 5:
            sub_80B45B4(taskId, gUnknown_083CC732, 0);
            break;
        case 6:
            sub_80B45B4(taskId, gUnknown_083CC738, 0);
            break;
    }

    data[0] = (data[0] + 1) & 7;
    if (!data[0])
    {
        DrawWholeMapView();
        data[1] = (data[1] + 1) % 3;
        data[3] = 0;
    }
}

u8 sub_80B47D8(u16 var)
{
    u8 taskId = CreateTask(sub_80B4710, 0);
    s16 *data = gTasks[taskId].data;

    PlayerGetDestCoords(&data[4], &data[5]);
    data[0] = 0;
    data[1] = 0;
    data[2] = var;
    sub_80B4710(taskId);
    return taskId;
}

void sub_80B4824(u8 var)
{
    gUnknown_02038731 = sub_80B47D8(var);
}

void sub_80B483C(void)
{
    DestroyTask(gUnknown_02038731);
}

bool8 sub_80B4850(void)
{
    if (gTasks[gUnknown_02038731].data[3] == 0 && gTasks[gUnknown_02038731].data[1] == 2)
        return FALSE;
    else
        return TRUE;
}
