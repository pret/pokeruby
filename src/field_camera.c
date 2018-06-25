#include "global.h"
#include "field_camera.h"
#include "berry.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "rotating_gate.h"
#include "sprite.h"
#include "text.h"

EWRAM_DATA bool8 gUnusedBikeCameraAheadPanback = FALSE;

struct FieldCameraOffset
{
    u8 xPixelOffset;
    u8 yPixelOffset;
    u8 xTileOffset;
    u8 yTileOffset;
    bool8 copyBGToVRAM;
};

static struct FieldCameraOffset sFieldCameraOffset;
static u16 sHorizontalCameraPan;
static s16 sVerticalCameraPan;
static u8 gUnknown_0300059C;
static void (*sFieldCameraPanningCallback)(void);

extern struct FieldCamera gFieldCamera;
extern u16 gTotalCameraPixelOffsetY;
extern u16 gTotalCameraPixelOffsetX;

static void RedrawMapSliceNorth(struct FieldCameraOffset*, struct MapLayout*);
static void RedrawMapSliceSouth(struct FieldCameraOffset*, struct MapLayout*);
static void RedrawMapSliceEast(struct FieldCameraOffset*, struct MapLayout*);
static void RedrawMapSliceWest(struct FieldCameraOffset*, struct MapLayout*);
static s32 MapPosToBgTilemapOffset(struct FieldCameraOffset*, s32, s32);

static void DrawWholeMapViewInternal(int x, int y, struct MapLayout*);
static void DrawMetatileAt(struct MapLayout*, u16, int, int);
static void DrawMetatile(s32, u16*, u16);
static void CameraPanningCB_PanAhead(void);

static void move_tilemap_camera_to_upper_left_corner_(struct FieldCameraOffset *cameraOffset)
{
    cameraOffset->xTileOffset = 0;
    cameraOffset->yTileOffset = 0;
    cameraOffset->xPixelOffset = 0;
    cameraOffset->yPixelOffset = 0;
    cameraOffset->copyBGToVRAM = TRUE;
}

static void tilemap_move_something(struct FieldCameraOffset *cameraOffset, u32 b, u32 c)
{
    cameraOffset->xTileOffset += b;
    cameraOffset->xTileOffset %= 32;
    cameraOffset->yTileOffset += c;
    cameraOffset->yTileOffset %= 32;
}

static void coords8_add(struct FieldCameraOffset *cameraOffset, u32 b, u32 c)
{
    cameraOffset->xPixelOffset += b;
    cameraOffset->yPixelOffset += c;
}

void move_tilemap_camera_to_upper_left_corner(void)
{
    move_tilemap_camera_to_upper_left_corner_(&sFieldCameraOffset);
    CpuFill16(0, gBGTilemapBuffers[2], 0x800);
    CpuFill16(0, gBGTilemapBuffers[1], 0x800);
    CpuFill16(0x3014, gBGTilemapBuffers[3], 0x800);
}

void sub_8057A58(void)
{
    *gBGHOffsetRegs[1] = sFieldCameraOffset.xPixelOffset + sHorizontalCameraPan;
    *gBGVOffsetRegs[1] = sFieldCameraOffset.yPixelOffset + sVerticalCameraPan + 8;
    *gBGHOffsetRegs[2] = sFieldCameraOffset.xPixelOffset + sHorizontalCameraPan;
    *gBGVOffsetRegs[2] = sFieldCameraOffset.yPixelOffset + sVerticalCameraPan + 8;
    *gBGHOffsetRegs[3] = sFieldCameraOffset.xPixelOffset + sHorizontalCameraPan;
    *gBGVOffsetRegs[3] = sFieldCameraOffset.yPixelOffset + sVerticalCameraPan + 8;

    if (sFieldCameraOffset.copyBGToVRAM)
    {
        DmaCopy16(3, gBGTilemapBuffers[1], (void *)(VRAM + 0xE800), 0x800);
        DmaCopy16(3, gBGTilemapBuffers[2], (void *)(VRAM + 0xE000), 0x800);
        DmaCopy16(3, gBGTilemapBuffers[3], (void *)(VRAM + 0xF000), 0x800);
        sFieldCameraOffset.copyBGToVRAM = FALSE;
    }
}

void sub_8057B14(u16 *a, u16 *b)
{
    *a = sFieldCameraOffset.xPixelOffset + sHorizontalCameraPan;
    *b = sFieldCameraOffset.yPixelOffset + sVerticalCameraPan + 8;
}

void DrawWholeMapView(void)
{
    DrawWholeMapViewInternal(gSaveBlock1.pos.x, gSaveBlock1.pos.y, gMapHeader.mapLayout);
    sFieldCameraOffset.copyBGToVRAM = TRUE;
}

static void DrawWholeMapViewInternal(int x, int y, struct MapLayout *mapLayout)
{
    u8 i;
    u8 j;
    u32 r6;
    u8 temp;

    for (i = 0; i < 32; i += 2)
    {
        temp = sFieldCameraOffset.yTileOffset + i;
        if (temp >= 32)
            temp -= 32;
        r6 = temp * 32;
        for (j = 0; j < 32; j += 2)
        {
            temp = sFieldCameraOffset.xTileOffset + j;
            if (temp >= 32)
                temp -= 32;
            DrawMetatileAt(mapLayout, r6 + temp, x + j / 2, y + i / 2);
        }
    }
}

static void RedrawMapSlicesForCameraUpdate(struct FieldCameraOffset *cameraOffset, int x, int y)
{
    struct MapLayout *mapLayout = gMapHeader.mapLayout;

    if (x > 0)
        RedrawMapSliceWest(cameraOffset, mapLayout);
    if (x < 0)
        RedrawMapSliceEast(cameraOffset, mapLayout);
    if (y > 0)
        RedrawMapSliceNorth(cameraOffset, mapLayout);
    if (y < 0)
        RedrawMapSliceSouth(cameraOffset, mapLayout);
    cameraOffset->copyBGToVRAM = TRUE;
}

static void RedrawMapSliceNorth(struct FieldCameraOffset *cameraOffset, struct MapLayout *mapLayout)
{
    u8 i;
    u8 temp;
    u32 r7;

    temp = cameraOffset->yTileOffset + 28;
    if (temp >= 32)
        temp -= 32;
    r7 = temp * 32;
    for (i = 0; i < 32; i += 2)
    {
        temp = cameraOffset->xTileOffset + i;
        if (temp >= 32)
            temp -= 32;
        DrawMetatileAt(mapLayout, r7 + temp, gSaveBlock1.pos.x + i / 2, gSaveBlock1.pos.y + 14);
    }
}

static void RedrawMapSliceSouth(struct FieldCameraOffset *cameraOffset, struct MapLayout *mapLayout)
{
    u8 i;
    u8 temp;
    u32 r7 = cameraOffset->yTileOffset * 32;

    for (i = 0; i < 32; i += 2)
    {
        temp = cameraOffset->xTileOffset + i;
        if (temp >= 32)
            temp -= 32;
        DrawMetatileAt(mapLayout, r7 + temp, gSaveBlock1.pos.x + i / 2, gSaveBlock1.pos.y);
    }
}

static void RedrawMapSliceEast(struct FieldCameraOffset *cameraOffset, struct MapLayout *mapLayout)
{
    u8 i;
    u8 temp;
    u32 r6 = cameraOffset->xTileOffset;

    for (i = 0; i < 32; i += 2)
    {
        temp = cameraOffset->yTileOffset + i;
        if (temp >= 32)
            temp -= 32;
        DrawMetatileAt(mapLayout, temp * 32 + r6, gSaveBlock1.pos.x, gSaveBlock1.pos.y + i / 2);
    }
}

static void RedrawMapSliceWest(struct FieldCameraOffset *cameraOffset, struct MapLayout *mapLayout)
{
    u8 i;
    u8 temp;
    u8 r5 = cameraOffset->xTileOffset + 28;

    if (r5 >= 32)
        r5 -= 32;
    for (i = 0; i < 32; i += 2)
    {
        temp = cameraOffset->yTileOffset + i;
        if (temp >= 32)
            temp -= 32;
        DrawMetatileAt(mapLayout, temp * 32 + r5, gSaveBlock1.pos.x + 14, gSaveBlock1.pos.y + i / 2);
    }
}

void CurrentMapDrawMetatileAt(int x, int y)
{
    int offset = MapPosToBgTilemapOffset(&sFieldCameraOffset, x, y);

    if (offset >= 0)
    {
        DrawMetatileAt(gMapHeader.mapLayout, offset, x, y);
        sFieldCameraOffset.copyBGToVRAM = TRUE;
    }
}

void DrawDoorMetatileAt(int x, int y, u16 *arr)
{
    int offset = MapPosToBgTilemapOffset(&sFieldCameraOffset, x, y);

    if (offset >= 0)
    {
        DrawMetatile(1, arr, offset);
        sFieldCameraOffset.copyBGToVRAM = TRUE;
    }
}

static void DrawMetatileAt(struct MapLayout *mapLayout, u16 offset, int x, int y)
{
    u16 *metatiles;
    u16 metatileId = MapGridGetMetatileIdAt(x, y);

    if (metatileId > 0x400)
        metatileId = 0;

    if (metatileId < 0x200)
    {
        metatiles = mapLayout->primaryTileset->metatiles;
    }
    else
    {
        metatiles = mapLayout->secondaryTileset->metatiles;
        metatileId -= 0x200;
    }

    DrawMetatile(MapGridGetMetatileLayerTypeAt(x, y), metatiles + metatileId * 8, offset);
}

static void DrawMetatile(s32 metatileLayerType, u16 *metatiles, u16 offset)
{
    switch (metatileLayerType)
    {
    case 2: // LAYER_TYPE_
        // Draw metatile's bottom layer to the bottom background layer.
        gBGTilemapBuffers[3][offset] = metatiles[0];
        gBGTilemapBuffers[3][offset + 1] = metatiles[1];
        gBGTilemapBuffers[3][offset + 0x20] = metatiles[2];
        gBGTilemapBuffers[3][offset + 0x21] = metatiles[3];

        // Draw transparent tiles to the middle background layer.
        gBGTilemapBuffers[2][offset] = 0;
        gBGTilemapBuffers[2][offset + 1] = 0;
        gBGTilemapBuffers[2][offset + 0x20] = 0;
        gBGTilemapBuffers[2][offset + 0x21] = 0;

        // Draw metatile's top layer to the top background layer.
        gBGTilemapBuffers[1][offset] = metatiles[4];
        gBGTilemapBuffers[1][offset + 1] = metatiles[5];
        gBGTilemapBuffers[1][offset + 0x20] = metatiles[6];
        gBGTilemapBuffers[1][offset + 0x21] = metatiles[7];
        break;
    case 1: // LAYER_TYPE_COVERED_BY_OBJECTS
        // Draw metatile's bottom layer to the bottom background layer.
        gBGTilemapBuffers[3][offset] = metatiles[0];
        gBGTilemapBuffers[3][offset + 1] = metatiles[1];
        gBGTilemapBuffers[3][offset + 0x20] = metatiles[2];
        gBGTilemapBuffers[3][offset + 0x21] = metatiles[3];

        // Draw metatile's top layer to the middle background layer.
        gBGTilemapBuffers[2][offset] = metatiles[4];
        gBGTilemapBuffers[2][offset + 1] = metatiles[5];
        gBGTilemapBuffers[2][offset + 0x20] = metatiles[6];
        gBGTilemapBuffers[2][offset + 0x21] = metatiles[7];

        // Draw transparent tiles to the top background layer.
        gBGTilemapBuffers[1][offset] = 0;
        gBGTilemapBuffers[1][offset + 1] = 0;
        gBGTilemapBuffers[1][offset + 0x20] = 0;
        gBGTilemapBuffers[1][offset + 0x21] = 0;
        break;
    case 0: // LAYER_TYPE_NORMAL
        // Draw garbage to the bottom background layer.
        gBGTilemapBuffers[3][offset] = 0x3014;
        gBGTilemapBuffers[3][offset + 1] = 0x3014;
        gBGTilemapBuffers[3][offset + 0x20] = 0x3014;
        gBGTilemapBuffers[3][offset + 0x21] = 0x3014;

        // Draw metatile's bottom layer to the middle background layer.
        gBGTilemapBuffers[2][offset] = metatiles[0];
        gBGTilemapBuffers[2][offset + 1] = metatiles[1];
        gBGTilemapBuffers[2][offset + 0x20] = metatiles[2];
        gBGTilemapBuffers[2][offset + 0x21] = metatiles[3];

        // Draw metatile's top layer to the top background layer, which covers event object sprites.
        gBGTilemapBuffers[1][offset] = metatiles[4];
        gBGTilemapBuffers[1][offset + 1] = metatiles[5];
        gBGTilemapBuffers[1][offset + 0x20] = metatiles[6];
        gBGTilemapBuffers[1][offset + 0x21] = metatiles[7];
        break;
    }
}

static s32 MapPosToBgTilemapOffset(struct FieldCameraOffset *cameraOffset, s32 x, s32 y)
{
    x -= gSaveBlock1.pos.x;
    x *= 2;
    if (x >= 32 || x < 0)
        return -1;
    x = x + cameraOffset->xTileOffset;
    if (x >= 32)
        x -= 32;

    y = (y - gSaveBlock1.pos.y) * 2;
    if (y >= 32 || y < 0)
        return -1;
    y = y + cameraOffset->yTileOffset;
    if (y >= 32)
        y -= 32;

    return y * 32 + x;
}

static void CameraUpdateCallback(struct FieldCamera *fieldCamera)
{
    if (fieldCamera->trackedSpriteId != 0)
    {
        fieldCamera->movementSpeedX = gSprites[fieldCamera->trackedSpriteId].data[2];
        fieldCamera->movementSpeedY = gSprites[fieldCamera->trackedSpriteId].data[3];
    }
}

void ResetCameraUpdateInfo(void)
{
    gFieldCamera.movementSpeedX = 0;
    gFieldCamera.movementSpeedY = 0;
    gFieldCamera.curMovementOffsetX = 0;
    gFieldCamera.curMovementOffsetY = 0;
    gFieldCamera.trackedSpriteId = 0;
    gFieldCamera.callback = NULL;
}

u32 InitCameraUpdateCallback(u8 trackedSpriteId)
{
    if (gFieldCamera.trackedSpriteId != 0)
        DestroySprite(&gSprites[gFieldCamera.trackedSpriteId]);

    gFieldCamera.trackedSpriteId = AddCameraObject(trackedSpriteId);
    gFieldCamera.callback = CameraUpdateCallback;
    return 0;
}

void CameraUpdate(void)
{
    int deltaX;
    int deltaY;
    int curMovementOffsetY;
    int curMovementOffsetX;
    int movementSpeedX;
    int movementSpeedY;

    if (gFieldCamera.callback != NULL)
        gFieldCamera.callback(&gFieldCamera);
    movementSpeedX = gFieldCamera.movementSpeedX;
    movementSpeedY = gFieldCamera.movementSpeedY;
    deltaX = 0;
    deltaY = 0;
    curMovementOffsetX = gFieldCamera.curMovementOffsetX;
    curMovementOffsetY = gFieldCamera.curMovementOffsetY;


    if (curMovementOffsetX == 0 && movementSpeedX != 0)
    {
        if (movementSpeedX > 0)
            deltaX = 1;
        else
            deltaX = -1;
    }
    if (curMovementOffsetY == 0 && movementSpeedY != 0)
    {
        if (movementSpeedY > 0)
            deltaY = 1;
        else
            deltaY = -1;
    }
    if (curMovementOffsetX != 0 && curMovementOffsetX == -movementSpeedX)
    {
        if (movementSpeedX > 0)
            deltaX = 1;
        else
            deltaX = -1;
    }
    if (curMovementOffsetY != 0 && curMovementOffsetY == -movementSpeedY)
    {
        if (movementSpeedY > 0)
            deltaX = 1;
        else
            deltaX = -1;
    }

    gFieldCamera.curMovementOffsetX += movementSpeedX;
    gFieldCamera.curMovementOffsetX = gFieldCamera.curMovementOffsetX - 16 * (gFieldCamera.curMovementOffsetX / 16);
    gFieldCamera.curMovementOffsetY += movementSpeedY;
    gFieldCamera.curMovementOffsetY = gFieldCamera.curMovementOffsetY - 16 * (gFieldCamera.curMovementOffsetY / 16);

    if (deltaX != 0 || deltaY != 0)
    {
        CameraMove(deltaX, deltaY);
        UpdateEventObjectsForCameraUpdate(deltaX, deltaY);
        RotatingGatePuzzleCameraUpdate(deltaX, deltaY);
        ResetBerryTreeSparkleFlags();
        tilemap_move_something(&sFieldCameraOffset, deltaX * 2, deltaY * 2);
        RedrawMapSlicesForCameraUpdate(&sFieldCameraOffset, deltaX * 2, deltaY * 2);
    }

    coords8_add(&sFieldCameraOffset, movementSpeedX, movementSpeedY);
    gTotalCameraPixelOffsetX -= movementSpeedX;
    gTotalCameraPixelOffsetY -= movementSpeedY;
}

void MoveCameraAndRedrawMap(int deltaX, int deltaY)
{
    CameraMove(deltaX, deltaY);
    UpdateEventObjectsForCameraUpdate(deltaX, deltaY);
    DrawWholeMapView();
    gTotalCameraPixelOffsetX -= deltaX * 16;
    gTotalCameraPixelOffsetY -= deltaY * 16;
}

void SetCameraPanningCallback(void (*callback)(void))
{
    sFieldCameraPanningCallback = callback;
}

void SetCameraPanning(s16 a, s16 b)
{
    sHorizontalCameraPan = a;
    sVerticalCameraPan = b + 32;
}

void InstallCameraPanAheadCallback(void)
{
    sFieldCameraPanningCallback = CameraPanningCB_PanAhead;
    gUnknown_0300059C = 0;
    sHorizontalCameraPan = 0;
    sVerticalCameraPan = 32;
}

void UpdateCameraPanning(void)
{
    if (sFieldCameraPanningCallback != NULL)
        sFieldCameraPanningCallback();
    //Update sprite offset of overworld objects
    gSpriteCoordOffsetX = gTotalCameraPixelOffsetX - sHorizontalCameraPan;
    gSpriteCoordOffsetY = gTotalCameraPixelOffsetY - sVerticalCameraPan - 8;
}

static void CameraPanningCB_PanAhead(void)
{
    u8 var;

    if (gUnusedBikeCameraAheadPanback == FALSE)
    {
        InstallCameraPanAheadCallback();
    }
    else
    {
        // this code is never reached.
        if (gPlayerAvatar.tileTransitionState == T_TILE_TRANSITION)
        {
            gUnknown_0300059C ^= 1;
            if (gUnknown_0300059C == 0)
                return;
        }
        else
        {
            gUnknown_0300059C = 0;
        }

        var = GetPlayerMovementDirection();
        if (var == 2)
        {
            if (sVerticalCameraPan > -8)
                sVerticalCameraPan -= 2;
        }
        else if (var == 1)
        {
            if (sVerticalCameraPan < 72)
                sVerticalCameraPan += 2;
        }
        else if (sVerticalCameraPan < 32)
        {
            sVerticalCameraPan += 2;
        }
        else if (sVerticalCameraPan > 32)
        {
            sVerticalCameraPan -= 2;
        }
    }
}
