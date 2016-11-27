#ifndef GUARD_FIELD_CAMERA_H
#define GUARD_FIELD_CAMERA_H

#include "gba/types.h"

void move_tilemap_camera_to_upper_left_corner();
void sub_8057A58();
void sub_8057B14(u16 *a, u16 *b);
void DrawWholeMapView();
void CurrentMapDrawMetatileAt(int a, int b);
void DrawDoorMetatileAt(int x, int y, u16 *arr);
void ResetCameraUpdateInfo();
u32 InitCameraUpdateCallback(u8 a);
void CameraUpdate();
void SetCameraPanningCallback(void (*a)(void));
void SetCameraPanning(s16 a, s16 b);
void InstallCameraPanAheadCallback();
void UpdateCameraPanning();

#endif // GUARD_FIELD_CAMERA_H
