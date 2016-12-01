#include "global.h"
#include "truck_scene.h"
#include "palette.h"
#include "task.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "field_camera.h"

extern s8 gTruckCamera_HorizontalTable[];

extern void SetCameraPanning(s16 a1, s16 a2);
extern void sub_805BD90(u8 localId, u8 mapNum, u8 mapGroup, s16 x, s16 y);

s32 GetTruckCameraBobbingY(int a1)
{
    s32 result;

    if (!(a1 % 120))
        return -1;
    else if ((a1 % 10) <= 4)
        return 1;

    return 0;
}

s32 GetTruckBoxMovement(int a1) // for the box movement?
{
    s32 result;
    
    if (!((a1 + 120) % 180))
        return -1;

    return 0;
}

void Task_Truck1(u8 taskId)
{
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

    if (data[0] == 0x7530) // timer?
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
    if ((u16)data[1] == 19)
    {
        DestroyTask(taskId);
    }
    else
    {
        if (gTruckCamera_HorizontalTable[data[1]] == 2)
            gTasks[taskId].func = Task_Truck3;
        
        cameraXpan = gTruckCamera_HorizontalTable[data[1]];
        cameraYpan = GetTruckCameraBobbingY(data[2]);
        SetCameraPanning(cameraXpan, cameraYpan);
        box1 = GetTruckBoxMovement(data[2] + 30) * 4;
        sub_805BD90(1, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, 3 - cameraXpan, box1 + 3);
        box2 = GetTruckBoxMovement(data[2]) * 2;
        sub_805BD90(2, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, -cameraXpan, box2 - 3);
        box3 = GetTruckBoxMovement(data[2]) * 4;
        sub_805BD90(3, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, -3 - cameraXpan, box3);
    }
}

void Task_Truck3(u8 taskId)
{
   s16 *data = gTasks[taskId].data;
   s16 cameraXpan;
   s16 cameraYpan;

   data[0]++;

   if (data[0] > 5)
   {
       data[0] = 0;
       data[1]++;
   }

   if ((u16)data[1] == 19)
   {
       DestroyTask(taskId);
   }
   else
   {
       cameraXpan = gTruckCamera_HorizontalTable[data[1]];
       cameraYpan = 0;
       SetCameraPanning(cameraXpan, 0);
       sub_805BD90(1, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, 3 - cameraXpan, cameraYpan + 3);
       sub_805BD90(2, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, -cameraXpan, cameraYpan - 3);
       sub_805BD90(3, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, -3 - cameraXpan, cameraYpan);
   }
}

void Task_HandleTruckSequence(u8 taskId)
{
   s16 *data = gTasks[taskId].data;

   switch (data[0])
   {
       /*
       Each case has a timer which is handled with data[1], incrementing
       until it reaches the if function's condition, which sets the next task up.
       */
   case 0:
       data[1]++;
       if (data[1] == 90)
       {
           SetCameraPanningCallback(0);
           data[1] = 0; // reset the timer.
           data[2] = CreateTask(Task_Truck1, 0xA);
           data[0] = 1; // run the next case.
           PlaySE(SE_TRACK_MOVE);
       }
       break;
   case 1:
       data[1]++;
       if (data[1] == 150)
       {
           pal_fill_black();
           data[1] = 0;
           data[0] = 2;
       }
       break;
   case 2:
       data[1]++;
       if(!gPaletteFade.active && data[1] > 300)
       {
           data[1] = 0;
           DestroyTask(data[2]);
           data[3] = CreateTask(Task_Truck2, 0xA);
           data[0] = 3;
           PlaySE(SE_TRACK_STOP);
       }
       break;
   case 3:
       if (!gTasks[data[3]].isActive) // is Truck2 no longer active (is Truck3 active?)
       {
           InstallCameraPanAheadCallback();
           data[1] = 0;
           data[0] = 4;
       }
       break;
   case 4:
       data[1]++;
       if (data[1] == 90)
       {
           PlaySE(SE_TRACK_HAIK);
           data[1] = 0;
           data[0] = 5;
       }
       break;
   case 5:
       data[1]++;
       if (data[1] == 120)
       {
            MapGridSetMetatileIdAt(11, 8, 520);
            MapGridSetMetatileIdAt(11, 9, 528);
            MapGridSetMetatileIdAt(11, 10, 536);
            DrawWholeMapView();
            PlaySE(SE_TRACK_DOOR);
            DestroyTask(taskId);
            ScriptContext2_Disable();
       }
       break;
   }
}

void ExecuteTruckSequence(void)
{
    MapGridSetMetatileIdAt(11, 8, 525);
    MapGridSetMetatileIdAt(11, 9, 533);
    MapGridSetMetatileIdAt(11, 10, 541);
    DrawWholeMapView();
    ScriptContext2_Enable();
    CpuFastFill(0, gPlttBufferFaded, 0x400);
    CreateTask(Task_HandleTruckSequence, 0xA);
}

void EndTruckSequence(void)
{
    if (!FuncIsActiveTask(Task_HandleTruckSequence))
    {
        sub_805BD90(1, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, 3, 3);
        sub_805BD90(2, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, 0, -3);
        sub_805BD90(3, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, -3, 0);
    }
}
