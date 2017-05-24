#include "global.h"
#include "field_camera.h"
#include "asm.h"
#include "asm_fieldmap.h"
#include "berry.h"
#include "field_player_avatar.h"
#include "sprite.h"
#include "text.h"

extern u8 gUnknown_0202E854;


struct UnknownStruct
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    bool8 unk4;
};

extern struct UnknownStruct gUnknown_03000590;
extern u16 gUnknown_03000598;
extern s16 gUnknown_0300059A;
extern u8 gUnknown_0300059C;
extern void (*gUnknown_030005A0)(void);

struct CameraSomething
{
    void (*callback)(struct CameraSomething *);
    u32 unk4;
    s32 unk8;
    s32 unkC;
    s32 unk10;
    s32 unk14;
};

extern struct CameraSomething gUnknown_03004880;
extern u16 gUnknown_03004898;
extern u16 gUnknown_0300489C;

static void RedrawMapSliceNorth(struct UnknownStruct *a, struct MapData *mapData);
static void RedrawMapSliceSouth(struct UnknownStruct *a, struct MapData *mapData);
static void RedrawMapSliceEast(struct UnknownStruct *a, struct MapData *mapData);
static void RedrawMapSliceWest(struct UnknownStruct *a, struct MapData *mapData);
static s32 MapPosToBgTilemapOffset(struct UnknownStruct *a, s32 x, s32 y);

static void DrawWholeMapViewInternal(int x, int y, struct MapData *mapData);
static void DrawMetatileAt(struct MapData *mapData, u16, int, int);
static void DrawMetatile(s32 a, u16 *b, u16 c);
static void CameraPanningCB_PanAhead(void);

static void move_tilemap_camera_to_upper_left_corner_(struct UnknownStruct *a)
{
    a->unk2 = 0;
    a->unk3 = 0;
    a->unk0 = 0;
    a->unk1 = 0;
    a->unk4 = TRUE;
}

static void tilemap_move_something(struct UnknownStruct *a, u32 b, u32 c)
{
    a->unk2 += b;
    a->unk2 %= 32;
    a->unk3 += c;
    a->unk3 %= 32;
}

static void coords8_add(struct UnknownStruct *a, u32 b, u32 c)
{
    a->unk0 += b;
    a->unk1 += c;
}

void move_tilemap_camera_to_upper_left_corner(void)
{
    move_tilemap_camera_to_upper_left_corner_(&gUnknown_03000590);
    CpuFill16(0, gBGTilemapBuffers[2], 0x800);
    CpuFill16(0, gBGTilemapBuffers[1], 0x800);
    CpuFill16(0x3014, gBGTilemapBuffers[3], 0x800);
}

void sub_8057A58(void)
{
    *gBGHOffsetRegs[1] = gUnknown_03000590.unk0 + gUnknown_03000598;
    *gBGVOffsetRegs[1] = gUnknown_03000590.unk1 + gUnknown_0300059A + 8;
    *gBGHOffsetRegs[2] = gUnknown_03000590.unk0 + gUnknown_03000598;
    *gBGVOffsetRegs[2] = gUnknown_03000590.unk1 + gUnknown_0300059A + 8;
    *gBGHOffsetRegs[3] = gUnknown_03000590.unk0 + gUnknown_03000598;
    *gBGVOffsetRegs[3] = gUnknown_03000590.unk1 + gUnknown_0300059A + 8;

    if (gUnknown_03000590.unk4)
    {
        DmaCopy16(3, gBGTilemapBuffers[1], (void *)(VRAM + 0xE800), 0x800);
        DmaCopy16(3, gBGTilemapBuffers[2], (void *)(VRAM + 0xE000), 0x800);
        DmaCopy16(3, gBGTilemapBuffers[3], (void *)(VRAM + 0xF000), 0x800);
        gUnknown_03000590.unk4 = FALSE;
    }
}

void sub_8057B14(u16 *a, u16 *b)
{
    *a = gUnknown_03000590.unk0 + gUnknown_03000598;
    *b = gUnknown_03000590.unk1 + gUnknown_0300059A + 8;
}

void DrawWholeMapView(void)
{
    DrawWholeMapViewInternal(gSaveBlock1.pos.x, gSaveBlock1.pos.y, gMapHeader.mapData);
    gUnknown_03000590.unk4 = TRUE;
}

static void DrawWholeMapViewInternal(int x, int y, struct MapData *mapData)
{
    u8 i;
    u8 j;
    u32 r6;
    u8 temp;

    for (i = 0; i < 32; i += 2)
    {
        temp = gUnknown_03000590.unk3 + i;
        if (temp >= 32)
            temp -= 32;
        r6 = temp * 32;
        for (j = 0; j < 32; j += 2)
        {
            temp = gUnknown_03000590.unk2 + j;
            if (temp >= 32)
                temp -= 32;
            DrawMetatileAt(mapData, r6 + temp, x + j / 2, y + i / 2);
        }
    }
}

static void RedrawMapSlicesForCameraUpdate(struct UnknownStruct *a, int x, int y)
{
    struct MapData *mapData = gMapHeader.mapData;

    if (x > 0)
        RedrawMapSliceWest(a, mapData);
    if (x < 0)
        RedrawMapSliceEast(a, mapData);
    if (y > 0)
        RedrawMapSliceNorth(a, mapData);
    if (y < 0)
        RedrawMapSliceSouth(a, mapData);
    a->unk4 = TRUE;
}

static void RedrawMapSliceNorth(struct UnknownStruct *a, struct MapData *mapData)
{
    u8 i;
    u8 temp;
    u32 r7;

    temp = a->unk3 + 28;
    if (temp >= 32)
        temp -= 32;
    r7 = temp * 32;
    for (i = 0; i < 32; i += 2)
    {
        temp = a->unk2 + i;
        if (temp >= 32)
            temp -= 32;
        DrawMetatileAt(mapData, r7 + temp, gSaveBlock1.pos.x + i / 2, gSaveBlock1.pos.y + 14);
    }
}

static void RedrawMapSliceSouth(struct UnknownStruct *a, struct MapData *mapData)
{
    u8 i;
    u8 temp;
    u32 r7 = a->unk3 * 32;

    for (i = 0; i < 32; i += 2)
    {
        temp = a->unk2 + i;
        if (temp >= 32)
            temp -= 32;
        DrawMetatileAt(mapData, r7 + temp, gSaveBlock1.pos.x + i / 2, gSaveBlock1.pos.y);
    }
}

static void RedrawMapSliceEast(struct UnknownStruct *a, struct MapData *mapData)
{
    u8 i;
    u8 temp;
    u32 r6 = a->unk2;

    for (i = 0; i < 32; i += 2)
    {
        temp = a->unk3 + i;
        if (temp >= 32)
            temp -= 32;
        DrawMetatileAt(mapData, temp * 32 + r6, gSaveBlock1.pos.x, gSaveBlock1.pos.y + i / 2);
    }
}

static void RedrawMapSliceWest(struct UnknownStruct *a, struct MapData *mapData)
{
    u8 i;
    u8 temp;
    u8 r5 = a->unk2 + 28;

    if (r5 >= 32)
        r5 -= 32;
    for (i = 0; i < 32; i += 2)
    {
        temp = a->unk3 + i;
        if (temp >= 32)
            temp -= 32;
        DrawMetatileAt(mapData, temp * 32 + r5, gSaveBlock1.pos.x + 14, gSaveBlock1.pos.y + i / 2);
    }
}

void CurrentMapDrawMetatileAt(int a, int b)
{
    int offset = MapPosToBgTilemapOffset(&gUnknown_03000590, a, b);

    if (offset >= 0)
    {
        DrawMetatileAt(gMapHeader.mapData, offset, a, b);
        gUnknown_03000590.unk4 = TRUE;
    }
}

void DrawDoorMetatileAt(int x, int y, u16 *arr)
{
    int offset = MapPosToBgTilemapOffset(&gUnknown_03000590, x, y);

    if (offset >= 0)
    {
        DrawMetatile(1, arr, offset);
        gUnknown_03000590.unk4 = TRUE;
    }
}

static void DrawMetatileAt(struct MapData *mapData, u16 b, int c, int d)
{
    u16 metatileId = MapGridGetMetatileIdAt(c, d);
    u16 *metatiles;

    if (metatileId > 1024)
        metatileId = 0;
    if (metatileId < 512)
        metatiles = mapData->primaryTileset->metatiles;
    else
    {
        metatiles = mapData->secondaryTileset->metatiles;
        metatileId -= 512;
    }
    DrawMetatile(MapGridGetMetatileLayerTypeAt(c, d), metatiles + metatileId * 8, b);
}

static void DrawMetatile(s32 a, u16 *b, u16 c)
{
    switch (a)
    {
    case 2:
        gBGTilemapBuffers[3][c] = b[0];
        gBGTilemapBuffers[3][c + 1] = b[1];
        gBGTilemapBuffers[3][c + 0x20] = b[2];
        gBGTilemapBuffers[3][c + 0x21] = b[3];

        gBGTilemapBuffers[2][c] = 0;
        gBGTilemapBuffers[2][c + 1] = 0;
        gBGTilemapBuffers[2][c + 0x20] = 0;
        gBGTilemapBuffers[2][c + 0x21] = 0;

        gBGTilemapBuffers[1][c] = b[4];
        gBGTilemapBuffers[1][c + 1] = b[5];
        gBGTilemapBuffers[1][c + 0x20] = b[6];
        gBGTilemapBuffers[1][c + 0x21] = b[7];
        break;
    case 1:
        gBGTilemapBuffers[3][c] = b[0];
        gBGTilemapBuffers[3][c + 1] = b[1];
        gBGTilemapBuffers[3][c + 0x20] = b[2];
        gBGTilemapBuffers[3][c + 0x21] = b[3];

        gBGTilemapBuffers[2][c] = b[4];
        gBGTilemapBuffers[2][c + 1] = b[5];
        gBGTilemapBuffers[2][c + 0x20] = b[6];
        gBGTilemapBuffers[2][c + 0x21] = b[7];

        gBGTilemapBuffers[1][c] = 0;
        gBGTilemapBuffers[1][c + 1] = 0;
        gBGTilemapBuffers[1][c + 0x20] = 0;
        gBGTilemapBuffers[1][c + 0x21] = 0;
        break;
    case 0:
        gBGTilemapBuffers[3][c] = 0x3014;
        gBGTilemapBuffers[3][c + 1] = 0x3014;
        gBGTilemapBuffers[3][c + 0x20] = 0x3014;
        gBGTilemapBuffers[3][c + 0x21] = 0x3014;

        gBGTilemapBuffers[2][c] = b[0];
        gBGTilemapBuffers[2][c + 1] = b[1];
        gBGTilemapBuffers[2][c + 0x20] = b[2];
        gBGTilemapBuffers[2][c + 0x21] = b[3];

        gBGTilemapBuffers[1][c] = b[4];
        gBGTilemapBuffers[1][c + 1] = b[5];
        gBGTilemapBuffers[1][c + 0x20] = b[6];
        gBGTilemapBuffers[1][c + 0x21] = b[7];
        break;
    }
}

static s32 MapPosToBgTilemapOffset(struct UnknownStruct *a, s32 x, s32 y)
{
    x -= gSaveBlock1.pos.x;
    x *= 2;
    if (x >= 32 || x < 0)
        return -1;
    x = x + a->unk2;
    if (x >= 32)
        x -= 32;

    y = (y - gSaveBlock1.pos.y) * 2;
    if (y >= 32 || y < 0)
        return -1;
    y = y + a->unk3;
    if (y >= 32)
        y -= 32;

    return y * 32 + x;
}

static void CameraUpdateCallback(struct CameraSomething *a)
{
    if (a->unk4 != 0)
    {
        a->unk8 = gSprites[a->unk4].data2;
        a->unkC = gSprites[a->unk4].data3;
    }
}

void ResetCameraUpdateInfo(void)
{
    gUnknown_03004880.unk8 = 0;
    gUnknown_03004880.unkC = 0;
    gUnknown_03004880.unk10 = 0;
    gUnknown_03004880.unk14 = 0;
    gUnknown_03004880.unk4 = 0;
    gUnknown_03004880.callback = NULL;
}

u32 InitCameraUpdateCallback(u8 a)
{
    if (gUnknown_03004880.unk4 != 0)
        DestroySprite(&gSprites[gUnknown_03004880.unk4]);
    gUnknown_03004880.unk4 = AddCameraObject(a);
    gUnknown_03004880.callback = CameraUpdateCallback;
    return 0;
}

void CameraUpdate(void)
{
    int deltaX;
    int deltaY;
    int r0;
    int r1;
    int r7;
    int r8;

    if (gUnknown_03004880.callback != NULL)
        gUnknown_03004880.callback(&gUnknown_03004880);
    r7 = gUnknown_03004880.unk8;
    r8 = gUnknown_03004880.unkC;
    deltaX = 0;
    deltaY = 0;
    r1 = gUnknown_03004880.unk10;
    r0 = gUnknown_03004880.unk14;


    if (r1 == 0 && r7 != 0)
    {
        if (r7 > 0)
            deltaX = 1;
        else
            deltaX = -1;
    }
    if (r0 == 0 && r8 != 0)
    {
        if (r8 > 0)
            deltaY = 1;
        else
            deltaY = -1;
    }
    if (r1 != 0 && r1 == -r7)
    {
        if (r7 > 0)
            deltaX = 1;
        else
            deltaX = -1;
    }
    if (r0 != 0 && r0 == -r8)
    {
        if (r8 > 0)
            deltaX = 1;
        else
            deltaX = -1;
    }

    gUnknown_03004880.unk10 += r7;
    gUnknown_03004880.unk10 = gUnknown_03004880.unk10 - 16 * (gUnknown_03004880.unk10 / 16);
    gUnknown_03004880.unk14 += r8;
    gUnknown_03004880.unk14 = gUnknown_03004880.unk14 - 16 * (gUnknown_03004880.unk14 / 16);

    if (deltaX != 0 || deltaY != 0)
    {
        CameraMove(deltaX, deltaY);
        UpdateFieldObjectsForCameraUpdate(deltaX, deltaY);
        RotatingGatePuzzleCameraUpdate(deltaX, deltaY);
        ResetBerryTreeSparkleFlags();
        tilemap_move_something(&gUnknown_03000590, deltaX * 2, deltaY * 2);
        RedrawMapSlicesForCameraUpdate(&gUnknown_03000590, deltaX * 2, deltaY * 2);
    }

    coords8_add(&gUnknown_03000590, r7, r8);
    gUnknown_0300489C -= r7;
    gUnknown_03004898 -= r8;
}

void camera_move_and_redraw(int a, int b)
{
    CameraMove(a, b);
    UpdateFieldObjectsForCameraUpdate(a, b);
    DrawWholeMapView();
    gUnknown_0300489C -= a * 16;
    gUnknown_03004898 -= b * 16;
}

void SetCameraPanningCallback(void (*a)(void))
{
    gUnknown_030005A0 = a;
}

void SetCameraPanning(s16 a, s16 b)
{
    gUnknown_03000598 = a;
    gUnknown_0300059A = b + 32;
}

void InstallCameraPanAheadCallback(void)
{
    gUnknown_030005A0 = CameraPanningCB_PanAhead;
    gUnknown_0300059C = 0;
    gUnknown_03000598 = 0;
    gUnknown_0300059A = 32;
}

void UpdateCameraPanning(void)
{
    if (gUnknown_030005A0 != NULL)
        gUnknown_030005A0();
    //Update sprite offset of overworld objects
    gSpriteCoordOffsetX = gUnknown_0300489C - gUnknown_03000598;
    gSpriteCoordOffsetY = gUnknown_03004898 - gUnknown_0300059A - 8;
}

static void CameraPanningCB_PanAhead(void)
{
    u8 var;

    if (gUnknown_0202E854 == 0)
    {
        InstallCameraPanAheadCallback();
    }
    else
    {
        if (gPlayerAvatar.running1 == 1)
        {
            gUnknown_0300059C ^= 1;
            if (gUnknown_0300059C == 0)
                return;
        }
        else
        {
            gUnknown_0300059C = 0;
        }

        var = player_get_direction_upper_nybble();
        if (var == 2)
        {
            if (gUnknown_0300059A > -8)
                gUnknown_0300059A -= 2;
        }
        else if (var == 1)
        {
            if (gUnknown_0300059A < 72)
                gUnknown_0300059A += 2;
        }
        else if (gUnknown_0300059A < 32)
        {
            gUnknown_0300059A += 2;
        }
        else if (gUnknown_0300059A > 32)
        {
            gUnknown_0300059A -= 2;
        }
    }
}
