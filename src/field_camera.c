#include "global.h"
#include "fieldmap.h"
#include "text.h"

extern u16 gBG1TilemapBuffer[];
extern u16 gBG2TilemapBuffer[];

extern u8 gUnknown_03000590[];
extern u16 gUnknown_03000598;
extern u16 gUnknown_0300059A;

struct Coords8
{
    u8 x;
    u8 y;
};

void DrawWholeMapViewInternal(int x, int y, struct MapData *mapData);
void DrawMetatileAt(struct MapData *mapData, u16, int, int);
void DrawMetatile(u8, u8 *, u16);

void move_tilemap_camera_to_upper_left_corner_(u8 *a)
{
    a[2] = 0;
    a[3] = 0;
    a[0] = 0;
    a[1] = 0;
    a[4] = 1;
}

/*
void tilemap_move_something(u8 *a, u32 b, u32 c, u32 d)
{
    a[2] += b;
    a[2] &= 0x1F;
    a[3] += c;
    a[3] &= d;
}
*/

__attribute__((naked))
void tilemap_move_something(u8 *a, u32 b, u32 c, u32 d)
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
