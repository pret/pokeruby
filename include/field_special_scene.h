#ifndef GUARD_FIELD_SPECIAL_SCENE_H
#define GUARD_FIELD_SPECIAL_SCENE_H

s32 GetTruckCameraBobbingY(int a1);
s32 GetTruckBoxMovement(int a1);
void Task_Truck1(u8 taskId);
void Task_Truck2(u8 taskId);
void Task_Truck3(u8 taskId);
void Task_HandleTruckSequence(u8 taskId);
void ExecuteTruckSequence(void);
void EndTruckSequence(u8);

#endif // GUARD_FIELD_SPECIAL_SCENE_H
