#ifndef GUARD_FIELD_CAMERA_H
#define GUARD_FIELD_CAMERA_H

struct FieldCamera
{
    void (*callback)(struct FieldCamera *);
    u32 trackedSpriteId;
    s32 movementSpeedX;
    s32 movementSpeedY;
    s32 curMovementOffsetX;
    s32 curMovementOffsetY;
};

extern struct Camera gCamera;

void move_tilemap_camera_to_upper_left_corner(void);
void sub_8057A58(void);
void sub_8057B14(u16 *a, u16 *b);
void DrawWholeMapView(void);
void CurrentMapDrawMetatileAt(int a, int b);
void DrawDoorMetatileAt(int x, int y, u16 *arr);
void ResetCameraUpdateInfo(void);
u32 InitCameraUpdateCallback(u8 a);
void CameraUpdate(void);
void SetCameraPanningCallback(void (*a)(void));
void SetCameraPanning(s16 a, s16 b);
void InstallCameraPanAheadCallback(void);
void UpdateCameraPanning(void);

#endif // GUARD_FIELD_CAMERA_H
