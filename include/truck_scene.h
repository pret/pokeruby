#ifndef GUARD_TRUCK_SCENE_H
#define GUARD_TRUCK_SCENE_H

#include "gba/types.h"

s32 GetTruckCameraBobbingY(int a1);
s32 GetTruckBoxMovement(int a1);
void Task_Truck1(u8 taskId);
void Task_Truck2(u8 taskId);
void Task_Truck3(u8 taskId);
void Task_HandleTruckSequence(u8 taskId);
void ExecuteTruckSequence();
void EndTruckSequence();

#endif // GUARD_TRUCK_SCENE_H
