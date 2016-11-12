#include "global.h"
#include "fieldmap.h"
#include "sprite.h"
#include "text.h"

//ToDo: argument types
extern u8 MapGridGetMetatileLayerTypeAt();

//ToDo: combine these buffers into a single 2-D array
extern u16 gBG0TilemapBuffer[][0x400];
extern u16 gBG1TilemapBuffer[];
extern u16 gBG2TilemapBuffer[];

extern u8 gUnknown_03000590[];
extern u16 gUnknown_03000598;
extern u16 gUnknown_0300059A;
extern u16 gUnknown_03004898;
extern u16 gUnknown_0300489C;

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

struct Coords8
{
    u8 x;
    u8 y;
};

void DrawWholeMapViewInternal(int x, int y, struct MapData *mapData);
void DrawMetatileAt(struct MapData *mapData, u16, int, int);
void DrawMetatile(s32 a, u16 *b, u16 c);
//ToDo: argument types
u8 AddCameraObject();

void move_tilemap_camera_to_upper_left_corner_(u8 *a)
{
    a[2] = 0;
    a[3] = 0;
    a[0] = 0;
    a[1] = 0;
    a[4] = 1;
}

/*
void tilemap_move_something(u8 *a, u32 b, u32 c)
{
    a[2] += b;
    a[2] &= 0x1F;
    a[3] += c;
    a[3] &= 0x1F;
}
*/

__attribute__((naked))
void tilemap_move_something(u8 *a, u32 b, u32 c)
{
    asm(".syntax unified\n\
    ldrb r3, [r0, 0x2]\n\
    adds r3, r1\n\
    strb r3, [r0, 0x2]\n\
    ldrb r1, [r0, 0x2]\n\
    movs r3, 0x1F\n\
    ands r1, r3\n\
    strb r1, [r0, 0x2]\n\
    ldrb r1, [r0, 0x3]\n\
    adds r1, r2\n\
    strb r1, [r0, 0x3]\n\
    ldrb r1, [r0, 0x3]\n\
    ands r1, r3\n\
    strb r1, [r0, 0x3]\n\
    bx lr\n\
    .syntax divided");
}

void coords8_add(struct Coords8 *a, u32 b, u32 c)
{
    a->x += b;
    a->y += c;
}

void move_tilemap_camera_to_upper_left_corner(void)
{
    move_tilemap_camera_to_upper_left_corner_(gUnknown_03000590);
    CpuFill16(0, gBG2TilemapBuffer, 0x800);
    CpuFill16(0, gBG2TilemapBuffer - 0x400, 0x800);
    CpuFill16(0x3014, gBG2TilemapBuffer + 0x400, 0x800);
}

void sub_8057A58(void)
{
    *gBGHOffsetRegs[1] = gUnknown_03000590[0] + gUnknown_03000598;
    *gBGVOffsetRegs[1] = gUnknown_03000590[1] + gUnknown_0300059A + 8;
    *gBGHOffsetRegs[2] = gUnknown_03000590[0] + gUnknown_03000598;
    *gBGVOffsetRegs[2] = gUnknown_03000590[1] + gUnknown_0300059A + 8;
    *gBGHOffsetRegs[3] = gUnknown_03000590[0] + gUnknown_03000598;
    *gBGVOffsetRegs[3] = gUnknown_03000590[1] + gUnknown_0300059A + 8;
    
    if(gUnknown_03000590[4] != 0)
    {
        DmaCopy16(3, gBG1TilemapBuffer, (void *)(VRAM + 0xE800), 0x800);
        DmaCopy16(3, gBG1TilemapBuffer + 0x400, (void *)(VRAM + 0xE000), 0x800);
        DmaCopy16(3, gBG1TilemapBuffer + 0x800, (void *)(VRAM + 0xF000), 0x800);
        gUnknown_03000590[4] = 0;
    }
}

void sub_8057B14(u16 *a, u16 *b)
{
    *a = gUnknown_03000590[0] + gUnknown_03000598;
    *b = gUnknown_03000590[1] + gUnknown_0300059A + 8;
}

void DrawWholeMapView(void)
{
    DrawWholeMapViewInternal(gSaveBlock1.pos.x, gSaveBlock1.pos.y, gMapHeader.mapData);
    gUnknown_03000590[4] = 1;
}

void DrawWholeMapViewInternal(int x, int y, struct MapData *mapData)
{
    u8 i;
    u8 j;
    u32 r6;
    u8 temp;
    
    for(i = 0; i < 32; i += 2)
    {
        temp = gUnknown_03000590[3] + i;
        if(temp >= 32)
            temp -= 32;
        r6 = temp * 32;
        for(j = 0; j < 32; j += 2)
        {
            temp = gUnknown_03000590[2] + j;
            if(temp >= 32)
                temp -= 32;
            DrawMetatileAt(mapData, r6 + temp, x + j / 2, y + i / 2);
        }
    }
}

void RedrawMapSlicesForCameraUpdate(u8 *a, int b, int c)
{
    struct MapData *mapData = gMapHeader.mapData;
    
    if(b > 0)
        sub_8057D48(a, mapData);
    if(b < 0)
        RedrawMapSliceEast(a, mapData);
    if(c > 0)
        sub_8057C3C(a, mapData);
    if(c < 0)
        RedrawMapSliceSouth(a, mapData);
    a[4] = 1;
}

void sub_8057C3C(u8 *a, struct MapData *mapData)
{
    u8 i;
    u8 temp;
    u32 r7;
    
    temp = a[3] + 28;
    if(temp >= 32)
        temp -= 32;
    r7 = temp * 32;
    for(i = 0; i < 32; i += 2)
    {
        temp = a[2] + i;
        if(temp >= 32)
            temp -= 32;
        DrawMetatileAt(mapData, r7 + temp, gSaveBlock1.pos.x + i / 2, gSaveBlock1.pos.y + 14);
    }
}

void RedrawMapSliceSouth(u8 *a, struct MapData *mapData)
{
    u8 i;
    u8 temp;
    u32 r7 = a[3] * 32;
    
    for(i = 0; i < 32; i += 2)
    {
        temp = a[2] + i;
        if(temp >= 32)
            temp -= 32;
        DrawMetatileAt(mapData, r7 + temp, gSaveBlock1.pos.x + i / 2, gSaveBlock1.pos.y);
    }
}

void RedrawMapSliceEast(u8 *a, struct MapData *mapData)
{
    u8 i;
    u8 temp;
    u32 r6 = a[2];
    
    for(i = 0; i < 32; i += 2)
    {
        temp = a[3] + i;
        if(temp >= 32)
            temp -= 32;
        DrawMetatileAt(mapData, temp * 32 + r6, gSaveBlock1.pos.x, gSaveBlock1.pos.y + i / 2);
    }
}

void sub_8057D48(u8 *a, struct MapData *mapData)
{
    u8 i;
    u8 temp;
    u8 r5 = a[2] + 28;
    
    if(r5 >= 32)
        r5 -= 32;
    for(i = 0; i < 32; i += 2)
    {
        temp = a[3] + i;
        if(temp >= 32)
            temp -= 32;
        DrawMetatileAt(mapData, temp * 32 + r5, gSaveBlock1.pos.x + 14, gSaveBlock1.pos.y + i / 2);
    }
}

void CurrentMapDrawMetatileAt(int a, int b)
{
    int offset = MapPosToBgTilemapOffset(gUnknown_03000590, a, b);
    
    if(offset >= 0)
    {
        DrawMetatileAt(gMapHeader.mapData, offset, a, b);
        gUnknown_03000590[4] = 1;
    }
}

void DrawDoorMetatileAt(int x, int y, u8 *arr)
{
    int offset = MapPosToBgTilemapOffset(gUnknown_03000590, x, y);
    
    if(offset >= 0)
    {
        DrawMetatile(1, arr, offset);
        gUnknown_03000590[4] = 1;
    }
}

void DrawMetatileAt(struct MapData *mapData, u16 b, int c, int d)
{
    u16 id = MapGridGetMetatileIdAt(c, d);
    void *r5;
    
    if(id > 0x400)
        id = 0;
    if(id <= 0x1FF)
        r5 = mapData->primaryTileset->metatiles;
    else
    {
        r5 = mapData->secondaryTileset->metatiles;
        id -= 512;
    }
    DrawMetatile(MapGridGetMetatileLayerTypeAt(c, d), (u8 *)r5 + id * 16, b);
}

void DrawMetatile(s32 a, u16 *b, u16 c)
{
    switch(a)
    {
        case 2:
            gBG0TilemapBuffer[3][c] = b[0];
            gBG0TilemapBuffer[3][c + 1] = b[1];
            gBG0TilemapBuffer[3][c + 0x20] = b[2];
            gBG0TilemapBuffer[3][c + 0x21] = b[3];
            
            gBG0TilemapBuffer[2][c] = 0;
            gBG0TilemapBuffer[2][c + 1] = 0;
            gBG0TilemapBuffer[2][c + 0x20] = 0;
            gBG0TilemapBuffer[2][c + 0x21] = 0;
            
            gBG0TilemapBuffer[1][c] = b[4];
            gBG0TilemapBuffer[1][c + 1] = b[5];
            gBG0TilemapBuffer[1][c + 0x20] = b[6];
            gBG0TilemapBuffer[1][c + 0x21] = b[7];
            break;
        case 1:
            gBG0TilemapBuffer[3][c] = b[0];
            gBG0TilemapBuffer[3][c + 1] = b[1];
            gBG0TilemapBuffer[3][c + 0x20] = b[2];
            gBG0TilemapBuffer[3][c + 0x21] = b[3];
            
            gBG0TilemapBuffer[2][c] = b[4];
            gBG0TilemapBuffer[2][c + 1] = b[5];
            gBG0TilemapBuffer[2][c + 0x20] = b[6];
            gBG0TilemapBuffer[2][c + 0x21] = b[7];
            
            gBG0TilemapBuffer[1][c] = 0;
            gBG0TilemapBuffer[1][c + 1] = 0;
            gBG0TilemapBuffer[1][c + 0x20] = 0;
            gBG0TilemapBuffer[1][c + 0x21] = 0;
            break;
        case 0:
            gBG0TilemapBuffer[3][c] = 0x3014;
            gBG0TilemapBuffer[3][c + 1] = 0x3014;
            gBG0TilemapBuffer[3][c + 0x20] = 0x3014;
            gBG0TilemapBuffer[3][c + 0x21] = 0x3014;
            
            gBG0TilemapBuffer[2][c] = b[0];
            gBG0TilemapBuffer[2][c + 1] = b[1];
            gBG0TilemapBuffer[2][c + 0x20] = b[2];
            gBG0TilemapBuffer[2][c + 0x21] = b[3];
            
            gBG0TilemapBuffer[1][c] = b[4];
            gBG0TilemapBuffer[1][c + 1] = b[5];
            gBG0TilemapBuffer[1][c + 0x20] = b[6];
            gBG0TilemapBuffer[1][c + 0x21] = b[7];
            break;
    }
}

/*
s32 MapPosToBgTilemapOffset(u8 *a, s32 x, s32 y)
{
    x = (x - gSaveBlock1.pos.x) * 2;
    if(x >= 32 || x < 0)
        return -1;
    x = x + a[2];
    if(x >= 32)
        x -= 32;
    
    y = (y - gSaveBlock1.pos.y) * 2;
    if(y >= 32 || y < 0)
        return -1;
    y = y + a[3];
    if(y >= 32)
        y -= 32;
    
    return y * 32 + x;
}
*/

s32 MapPosToBgTilemapOffset(u8 *a, s32 x, s32 y)
{
    x -= gSaveBlock1.pos.x;
    x *= 2;
    if(x >= 32 || x < 0)
        return -1;
    x = x + a[2];
    if(x >= 32)
        x -= 32;
    
    y = (y - gSaveBlock1.pos.y) * 2;
    if(y >= 32 || y < 0)
        return -1;
    y = y + a[3];
    if(y >= 32)
        y -= 32;
    
    return y * 32 + x;
}

void CameraUpdateCallback(struct CameraSomething *a)
{
    if(a->unk4 != 0)
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
    gUnknown_03004880.callback = 0;
}

u32 InitCameraUpdateCallback(u8 a)
{
    if(gUnknown_03004880.unk4 != 0)
        DestroySprite(&gSprites[gUnknown_03004880.unk4]);
    gUnknown_03004880.unk4 = AddCameraObject(a);
    gUnknown_03004880.callback = CameraUpdateCallback;
    return 0;
}

void CameraUpdate(void)
{
    int r4;
    int r5;
    int r0;
    int r1;
    int r7;
    int r8;
    
    if(gUnknown_03004880.callback != NULL)
        gUnknown_03004880.callback(&gUnknown_03004880);
    r7 = gUnknown_03004880.unk8;
    r8 = gUnknown_03004880.unkC;
    r4 = 0;
    r5 = 0;
    r1 = gUnknown_03004880.unk10;
    r0 = gUnknown_03004880.unk14;
    
    
    if(r1 == 0 && r7 != 0)
    {
        if(r7 > 0)
            r4 = 1;
        else
            r4 = -1;
    }
    if(r0 == 0 && r8 != 0)
    {
        if(r8 > 0)
            r5 = 1;
        else
            r5 = -1;
    }
    if(r1 != 0 && r1 == -r7)
    {
        if(r7 > 0)
            r4 = 1;
        else
            r4 = -1;
    }
    if(r0 != 0 && r0 == -r8)
    {
        if(r8 > 0)
            r4 = 1;
        else
            r4 = -1;
    }
    
    gUnknown_03004880.unk10 += r7;
    gUnknown_03004880.unk10 = gUnknown_03004880.unk10 - 16 * (gUnknown_03004880.unk10 / 16);    
    
    gUnknown_03004880.unk14 += r8;
    gUnknown_03004880.unk14 = gUnknown_03004880.unk14 - 16 * (gUnknown_03004880.unk14 / 16);
    
    if(r4 != 0 || r5 != 0)
    {
        CameraMove(r4, r5);
        UpdateFieldObjectsForCameraUpdate(r4, r5);
        RotatingGatePuzzleCameraUpdate(r4, r5);
        ResetBerryTreeSparkleFlags();
        tilemap_move_something(gUnknown_03000590, r4 * 2, r5 * 2);
        RedrawMapSlicesForCameraUpdate(gUnknown_03000590, r4 * 2, r5 * 2);
    }
    
    coords8_add(gUnknown_03000590, r7, r8);
    gUnknown_0300489C -= r7;
    gUnknown_03004898 -= r8;
}

/*
void camera_move_and_redraw(int a, int b)
{
    CameraMove(a, b);
    
}
*/