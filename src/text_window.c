#include "global.h"
#include "main.h"
#include "text.h"

u16 sub_8064EF4(u16);
void sub_8064F08(struct Window *);
void sub_8064F38(struct Window *, u8);
void sub_8064F6C(struct Window *, u8);
void AddTextPrinterParametrized(struct Window *win, u8 left, u8 top, u8 right, u8 bottom);
const struct FrameGraphics *sub_8064FD4(u8 frameType);
static void sub_8064FF8(u8, void *);
static void sub_8065014(u8, u8);
static void DrawWindowInternal(u16 *dest, u16 baseTileNum, u8 left, u8 top, u8 right, u8 bottom);
u16 sub_80651C8(u16);
void unref_sub_80651DC(struct Window *, u8 *);
void copy_textbox_border_tile_patterns_to_vram(struct Window *);
static u16 draw_win_3(u16 tilemapEntry, u8 x, u8 y, u8 width, u8 height);
static void draw_win_2(struct Window *win, u8 left, u8 top, u8 width, u8 height);
void draw_win(struct Window *win);
void sub_8065348(struct Window *win);
void sub_806536C(struct Window *win);

static u16 sTextWindowBaseTileNum;
static u16 sMessageBoxBaseTileNum;

struct FrameGraphics
{
    u8 *tiles;
    u16 *palette;
};

extern const struct FrameGraphics gUnknown_083761F0[20];

extern const u16 gMessageBoxTilemap[5][7];
extern const u8 gMessageBox_Gfx[];

u16 sub_8064EF4(u16 baseTileNum)
{
    sTextWindowBaseTileNum = baseTileNum;
    return baseTileNum + 9;
}

void sub_8064F08(struct Window *win)
{
    u8 *tileData = win->config->tileData + TILE_SIZE_4BPP * sTextWindowBaseTileNum;
    sub_8064FF8(gSaveBlock2.optionsWindowFrameType, tileData);
    sub_8065014(gSaveBlock2.optionsWindowFrameType, 0xE);
}

void sub_8064F38(struct Window *win, u8 a2)
{
    u8 *tileData = win->config->tileData + TILE_SIZE_4BPP * sTextWindowBaseTileNum;
    sub_8064FF8(gSaveBlock2.optionsWindowFrameType, tileData);
    sub_8065014(gSaveBlock2.optionsWindowFrameType, a2);
}

void sub_8064F6C(struct Window *win, u8 frameType)
{
    u8 *tileData = win->config->tileData + TILE_SIZE_4BPP * sTextWindowBaseTileNum;
    sub_8064FF8(frameType, tileData);
    sub_8065014(frameType, 0xE);
}

void AddTextPrinterParametrized(struct Window *win, u8 left, u8 top, u8 right, u8 bottom)
{
    DrawWindowInternal(win->config->tilemap, sTextWindowBaseTileNum, left, top, right, bottom);
}

const struct FrameGraphics *sub_8064FD4(u8 frameType)
{
    if (frameType > 19)
        return &gUnknown_083761F0[0];
    else
        return &gUnknown_083761F0[frameType];
}

static void sub_8064FF8(u8 frameType, void *dest)
{
    const struct FrameGraphics *frameGraphics = sub_8064FD4(frameType);
    CpuFastCopy(frameGraphics->tiles, dest, 9 * TILE_SIZE_4BPP);
}

static void sub_8065014(u8 frameType, u8 palSlot)
{
    const struct FrameGraphics *frameGraphics = sub_8064FD4(frameType);
    LoadPalette(frameGraphics->palette, 16 * palSlot, 0x20);
}

static void DrawWindowInternal(u16 *dest, u16 baseTileNum, u8 left, u8 top, u8 right, u8 bottom)
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

u16 sub_80651C8(u16 a1)
{
    sMessageBoxBaseTileNum = a1;
    return a1 + 14;
}

void unref_sub_80651DC(struct Window *win, u8 *text)
{
    sub_8002EB0(win, text, sMessageBoxBaseTileNum + 14, 2, 15);
}

void copy_textbox_border_tile_patterns_to_vram(struct Window *win)
{
    sub_8065348(win);
    draw_win(win);
}

static u16 draw_win_3(u16 baseTilemapEntry, u8 x, u8 y, u8 width, u8 height)
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

static void draw_win_2(struct Window *win, u8 left, u8 top, u8 width, u8 height)
{
    u8 i, j;
    u16 tilemapEntry = (win->paletteNum << 12) | sMessageBoxBaseTileNum;
    u16 *tilemap = win->config->tilemap;

    for (i = 0; i < height + 2; i++)
        for (j = 0; j < width + 6; j++)
            tilemap[(left + j) + 32 * (top + i)] = (win->paletteNum << 12) | draw_win_3(tilemapEntry, j, i, width, height);
}

void draw_win(struct Window *win)
{
    draw_win_2(win, 0, 14, 26, 4);
}

void sub_8065348(struct Window *win)
{
    u8 *tileData = win->config->tileData;
    CpuFastCopy(gMessageBox_Gfx, tileData + 32 * sMessageBoxBaseTileNum, 14 * TILE_SIZE_4BPP);
}

void sub_806536C(struct Window *win)
{
    u8 i;
    u16 *tilemap = win->config->tilemap + 0x1C0;
    u16 tilemapEntry = win->paletteNum << 12;

    for (i = 0; i < 0xC0; i++)
        tilemap[i] = tilemapEntry;
}
