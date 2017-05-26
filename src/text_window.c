#include "global.h"
#include "text_window.h"
#include "main.h"
#include "palette.h"
#include "text.h"

#define STD_MSG_BOX_LEFT 0
#define STD_MSG_BOX_TOP 14
#define STD_MSG_BOX_WIDTH 26
#define STD_MSG_BOX_HEIGHT 4

static void LoadTextWindowTiles(u8, void *);
static void LoadTextWindowPalette(u8, u8);
static void DrawTextWindowInternal(u16 *dest, u16 baseTileNum, u8 left, u8 top, u8 right, u8 bottom);
static u16 GetMessageBoxTilemapEntry(u16 tilemapEntry, u8 x, u8 y, u8 width, u8 height);
static void DrawMessageBox(struct Window *win, u8 left, u8 top, u8 width, u8 height);

static u16 sTextWindowBaseTileNum;
static u16 sMessageBoxBaseTileNum;

extern const struct FrameGraphics gUnknown_083761F0[20];

extern const u16 gMessageBoxTilemap[5][7];
extern const u8 gMessageBox_Gfx[];

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
