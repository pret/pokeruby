#include "global.h"
#include "text_window.h"
#include "main.h"
#include "palette.h"
#include "text.h"

#define STD_MSG_BOX_LEFT    0
#define STD_MSG_BOX_TOP    14
#define STD_MSG_BOX_WIDTH  26
#define STD_MSG_BOX_HEIGHT  4

static void LoadTextWindowTiles(u8, void *);
static void LoadTextWindowPalette(u8, u8);
static void DrawTextWindowInternal(u16 *dest, u16 baseTileNum, u8 left, u8 top, u8 right, u8 bottom);
static u16 GetMessageBoxTilemapEntry(u16 tilemapEntry, u8 x, u8 y, u8 width, u8 height);
static void DrawMessageBox(struct Window *win, u8 left, u8 top, u8 width, u8 height);

static u16 sTextWindowBaseTileNum;
static u16 sMessageBoxBaseTileNum;

extern const u8 gTextWindowFrame1_Gfx[];
extern const u8 gTextWindowFrame2_Gfx[];
extern const u8 gTextWindowFrame3_Gfx[];
extern const u8 gTextWindowFrame4_Gfx[];
extern const u8 gTextWindowFrame5_Gfx[];
extern const u8 gTextWindowFrame6_Gfx[];
extern const u8 gTextWindowFrame7_Gfx[];
extern const u8 gTextWindowFrame8_Gfx[];
extern const u8 gTextWindowFrame9_Gfx[];
extern const u8 gTextWindowFrame10_Gfx[];
extern const u8 gTextWindowFrame11_Gfx[];
extern const u8 gTextWindowFrame12_Gfx[];
extern const u8 gTextWindowFrame13_Gfx[];
extern const u8 gTextWindowFrame14_Gfx[];
extern const u8 gTextWindowFrame15_Gfx[];
extern const u8 gTextWindowFrame16_Gfx[];
extern const u8 gTextWindowFrame17_Gfx[];
extern const u8 gTextWindowFrame18_Gfx[];
extern const u8 gTextWindowFrame19_Gfx[];
extern const u8 gTextWindowFrame20_Gfx[];

extern const u16 gTextWindowFrame1_Pal[];
extern const u16 gTextWindowFrame2_Pal[];
extern const u16 gTextWindowFrame3_Pal[];
extern const u16 gTextWindowFrame4_Pal[];
extern const u16 gTextWindowFrame5_Pal[];
extern const u16 gTextWindowFrame6_Pal[];
extern const u16 gTextWindowFrame7_Pal[];
extern const u16 gTextWindowFrame8_Pal[];
extern const u16 gTextWindowFrame9_Pal[];
extern const u16 gTextWindowFrame10_Pal[];
extern const u16 gTextWindowFrame11_Pal[];
extern const u16 gTextWindowFrame12_Pal[];
extern const u16 gTextWindowFrame13_Pal[];
extern const u16 gTextWindowFrame14_Pal[];
extern const u16 gTextWindowFrame15_Pal[];
extern const u16 gTextWindowFrame16_Pal[];
extern const u16 gTextWindowFrame17_Pal[];
extern const u16 gTextWindowFrame18_Pal[];
extern const u16 gTextWindowFrame19_Pal[];
extern const u16 gTextWindowFrame20_Pal[];

extern const u8 gMessageBox_Gfx[];

static const struct FrameGraphics gUnknown_083761F0[20] =
{
    {gTextWindowFrame1_Gfx, gTextWindowFrame1_Pal},
    {gTextWindowFrame2_Gfx, gTextWindowFrame2_Pal},
    {gTextWindowFrame3_Gfx, gTextWindowFrame3_Pal},
    {gTextWindowFrame4_Gfx, gTextWindowFrame4_Pal},
    {gTextWindowFrame5_Gfx, gTextWindowFrame5_Pal},
    {gTextWindowFrame6_Gfx, gTextWindowFrame6_Pal},
    {gTextWindowFrame7_Gfx, gTextWindowFrame7_Pal},
    {gTextWindowFrame8_Gfx, gTextWindowFrame8_Pal},
    {gTextWindowFrame9_Gfx, gTextWindowFrame9_Pal},
    {gTextWindowFrame10_Gfx, gTextWindowFrame10_Pal},
    {gTextWindowFrame11_Gfx, gTextWindowFrame11_Pal},
    {gTextWindowFrame12_Gfx, gTextWindowFrame12_Pal},
    {gTextWindowFrame13_Gfx, gTextWindowFrame13_Pal},
    {gTextWindowFrame14_Gfx, gTextWindowFrame14_Pal},
    {gTextWindowFrame15_Gfx, gTextWindowFrame15_Pal},
    {gTextWindowFrame16_Gfx, gTextWindowFrame16_Pal},
    {gTextWindowFrame17_Gfx, gTextWindowFrame17_Pal},
    {gTextWindowFrame18_Gfx, gTextWindowFrame18_Pal},
    {gTextWindowFrame19_Gfx, gTextWindowFrame19_Pal},
    {gTextWindowFrame20_Gfx, gTextWindowFrame20_Pal},
};

//static const u16 gMessageBoxTilemap[5][7] = INCBIN_U16("graphics/text_window/message_box_map.bin");
// 01 00 03 00 04 00 04 00 05 00 06 00 09 00
// 0B 00 09 00 09 00 09 00 09 00 0B 04 09 00
// 07 00 09 00 09 00 09 00 09 00 0A 00 09 00
// 0B 08 09 00 09 00 09 00 09 00 0B 0C 09 00
// 01 08 03 08 04 08 04 08 05 08 06 08 09 00
static const u16 gMessageBoxTilemap[5][7] =
{
    {1,      3,      4,      4,      5,      6,      9},
    {11,     9,      9,      9,      9,      0x040B, 9},
    {7,      9,      9,      9,      9,      10,     9},
    {0x080B, 9,      9,      9,      9,      0x0C0B, 9},
    {0x0801, 0x0803, 0x0804, 0x0804, 0x0805, 0x0806, 9},
};

u16 SetTextWindowBaseTileNum(u16 baseTileNum)
{
    sTextWindowBaseTileNum = baseTileNum;
    return baseTileNum + 9;
}

void LoadTextWindowGraphics(struct Window *win)
{
    u8 *tileData = win->config->tileData + TILE_SIZE_4BPP * sTextWindowBaseTileNum;
    LoadTextWindowTiles(gSaveBlock2.optionsWindowFrameType, tileData);
    LoadTextWindowPalette(gSaveBlock2.optionsWindowFrameType, 0xE);
}

void LoadTextWindowGraphics_OverridePalSlot(struct Window *win, u8 palSlot)
{
    u8 *tileData = win->config->tileData + TILE_SIZE_4BPP * sTextWindowBaseTileNum;
    LoadTextWindowTiles(gSaveBlock2.optionsWindowFrameType, tileData);
    LoadTextWindowPalette(gSaveBlock2.optionsWindowFrameType, palSlot);
}

void LoadTextWindowGraphics_OverrideFrameType(struct Window *win, u8 frameType)
{
    u8 *tileData = win->config->tileData + TILE_SIZE_4BPP * sTextWindowBaseTileNum;
    LoadTextWindowTiles(frameType, tileData);
    LoadTextWindowPalette(frameType, 0xE);
}

void DrawTextWindow(struct Window *win, u8 left, u8 top, u8 right, u8 bottom)
{
    DrawTextWindowInternal(win->config->tilemap, sTextWindowBaseTileNum, left, top, right, bottom);
}

const struct FrameGraphics *GetTextWindowFrameGraphics(u8 frameType)
{
    if (frameType > 19)
        return &gUnknown_083761F0[0];
    else
        return &gUnknown_083761F0[frameType];
}

static void LoadTextWindowTiles(u8 frameType, void *dest)
{
    const struct FrameGraphics *frameGraphics = GetTextWindowFrameGraphics(frameType);
    CpuFastCopy(frameGraphics->tiles, dest, 9 * TILE_SIZE_4BPP);
}

static void LoadTextWindowPalette(u8 frameType, u8 palSlot)
{
    const struct FrameGraphics *frameGraphics = GetTextWindowFrameGraphics(frameType);
    LoadPalette(frameGraphics->palette, 16 * palSlot, 0x20);
}

static void DrawTextWindowInternal(u16 *dest, u16 baseTileNum, u8 left, u8 top, u8 right, u8 bottom)
{
    u8 x, y;
    u8 startX, endX;
    u8 startY, endY;

    startX = (left < right) ? left : right;
    endX = (right > left) ? right : left;

    startY = (top < bottom) ? top : bottom;
    endY = (bottom > top) ? bottom : top;

    dest[32 * startY + startX] = baseTileNum | 0xE000;

    for (x = startX + 1; x < endX; x++)
        dest[32 * startY + x] = (baseTileNum + 1) | 0xE000;

    dest[32 * startY + endX] = (baseTileNum + 2) | 0xE000;

    for (y = startY + 1; y < endY; y++)
    {
        dest[32 * y + startX] = (baseTileNum + 3) | 0xE000;

        for (x = startX + 1; x < endX; x++)
            dest[32 * y + x] = (baseTileNum + 4) | 0xE000;

        dest[32 * y + endX] = (baseTileNum + 5) | 0xE000;
    }

    dest[32 * endY + startX] = (baseTileNum + 6) | 0xE000;

    for (x = startX + 1; x < endX; x++)
        dest[32 * endY + x] = (baseTileNum + 7) | 0xE000;

    dest[32 * endY + endX] = (baseTileNum + 8) | 0xE000;
}

u16 SetMessageBoxBaseTileNum(u16 baseTileNum)
{
    sMessageBoxBaseTileNum = baseTileNum;
    return baseTileNum + 14;
}

void unref_sub_80651DC(struct Window *win, u8 *text)
{
    sub_8002EB0(win, text, sMessageBoxBaseTileNum + 14, 2, 15);
}

void DisplayMessageBox(struct Window *win)
{
    LoadMessageBoxTiles(win);
    DrawStandardMessageBox(win);
}

static u16 GetMessageBoxTilemapEntry(u16 baseTilemapEntry, u8 x, u8 y, u8 width, u8 height)
{
    u16 tilemapEntry = 9;

    if (y >= height)
        y = y - height + 3;
    else if (y > 1)
        y = 2;

    if (x >= width + 2)
        x = x - (width + 2) + 4;
    else if (x > 2)
        x = 3;

    if (x <= 6 && y <= 4)
        tilemapEntry = gMessageBoxTilemap[y][x];

    tilemapEntry += baseTilemapEntry;

    return tilemapEntry;
}

static void DrawMessageBox(struct Window *win, u8 left, u8 top, u8 width, u8 height)
{
    u8 i, j;
    u16 tilemapEntry = (win->paletteNum << 12) | sMessageBoxBaseTileNum;
    u16 *tilemap = win->config->tilemap;

    for (i = 0; i < height + 2; i++)
        for (j = 0; j < width + 6; j++)
            tilemap[(left + j) + 32 * (top + i)] = (win->paletteNum << 12) | GetMessageBoxTilemapEntry(tilemapEntry, j, i, width, height);
}

void DrawStandardMessageBox(struct Window *win)
{
    DrawMessageBox(win, STD_MSG_BOX_LEFT, STD_MSG_BOX_TOP, STD_MSG_BOX_WIDTH, STD_MSG_BOX_HEIGHT);
}

void LoadMessageBoxTiles(struct Window *win)
{
    u8 *tileData = win->config->tileData;
    CpuFastCopy(gMessageBox_Gfx, tileData + 32 * sMessageBoxBaseTileNum, 14 * TILE_SIZE_4BPP);
}

void ClearStandardMessageBox(struct Window *win)
{
    u8 i;
    u16 *tilemap = win->config->tilemap + (STD_MSG_BOX_TOP * 32);
    u16 tilemapEntry = win->paletteNum << 12;

    for (i = 0; i < ((STD_MSG_BOX_HEIGHT + 2) * 32); i++)
        tilemap[i] = tilemapEntry;
}
