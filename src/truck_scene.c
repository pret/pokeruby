#include "global.h"
#include "task.h"

extern s8 gTruckCamera_HorizontalTable[];

extern void SetCameraPanning(s16 a1, s16 a2);
extern void sub_805BD90(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y);
extern void sub_80C7484(u8 taskId);

void Task_Truck1(u8 taskId);

s32 GetTruckCameraBobbingY(int a1)
{
    s32 result;

    if ( !(a1 % 120) )
        return -1;
    else if ( (a1 % 10) <= 4 )
        return 1;

    return 0;
}

s32 GetTruckBoxMovement(int a1) // for the box movement?
{
    s32 result;
    
    if ( !((a1 + 120) % 180) )
        return -1;

    return 0;
}

void Task_Truck1(u8 taskId)
{
    // WIP
    s16 *data = gTasks[taskId].data;
    s16 cameraYpan;
    s16 box1 = 0;
    s16 box2 = 0;
    s16 box3 = 0;
    u8 mapNum, mapGroup;
    register s16 zero asm("r4");

    box1 = GetTruckBoxMovement(data[0] + 30) * 4; // box 1 happens 30 frames earlier than the other 2.
    sub_805BD90(1, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, 3, box1 + 3);
    box2 = GetTruckBoxMovement(data[0]) * 2;
    sub_805BD90(2, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, 0, box2 - 3);
    box3 = GetTruckBoxMovement(data[0]) * 4;
    mapNum = gSaveBlock1.location.mapNum;
    mapGroup = gSaveBlock1.location.mapGroup;
    zero = 0;
    sub_805BD90(3, mapNum, mapGroup, -3, box3);

    data[0]++;

    if ( data[0] == 0x7530 ) // timer?
        data[0] = zero;

    cameraYpan = GetTruckCameraBobbingY(data[0]);
    SetCameraPanning(0, cameraYpan);
}

void Task_Truck2(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    s16 cameraYpan;
    s16 cameraXpan;
    s16 box1;
    s16 box2;
    s16 box3;
    
    data[0]++;
    data[2]++;
    
    if (data[0] > 5)
    {
        data[0] = 0;
        data[1]++;
    }
    if ((u16)data[1] == 19 )
    {
        DestroyTask(taskId);
    }
    else
    {
        if ( gTruckCamera_HorizontalTable[data[1]] == 2 )
            gTasks[taskId].func = sub_80C7484;
        
        cameraXpan = gTruckCamera_HorizontalTable[data[1]];
        cameraYpan = GetTruckCameraBobbingY(data[2]);
        SetCameraPanning(cameraXpan, cameraYpan);
        box1 = GetTruckBoxMovement(data[2] + 30) * 4;
        sub_805BD90(1, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, 3 - cameraXpan, box1 + 3);
        box2 = GetTruckBoxMovement(data[2]) * 2;
        sub_805BD90(2, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, -cameraXpan, box2 - 3);
        box3 = GetTruckBoxMovement(data[2]);
        sub_805BD90(3, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, -3 - cameraXpan, ((u16)box3 * 4));
    }
}
