#include "global.h"
#include "text_window.h"
#include "main.h"
#include "palette.h"
#include "text.h"

#define STD_WINDOW_PALETTE_NUM 14

// Dimensions (in tiles) of a field dialogue frame
#define STD_DLG_FRAME_LEFT    0
#define STD_DLG_FRAME_TOP    14
#define STD_DLG_FRAME_WIDTH  26
#define STD_DLG_FRAME_HEIGHT  4

static void LoadTextWindowTiles(u8, void *);
static void LoadTextWindowPalette(u8, u8);
static void DrawStandardFrame(u16 *dest, u16 baseTileNum, u8 left, u8 top, u8 right, u8 bottom);
static u16 GetDialogueFrameTilemapEntry(u16 tilemapEntry, u8 x, u8 y, u8 width, u8 height);
static void DrawDialogueFrame(struct Window *win, u8 left, u8 top, u8 width, u8 height);

static u16 sTextWindowBaseTileNum;
static u16 sDialogueFrameBaseTileNum;

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

extern const u8 gDialogueFrame_Gfx[];

static const struct FrameGraphics sTextWindowFrameGraphics[20] =
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

static const u16 sDialogueFrameTilemap[5][7] =
{
    {1,      3,      4,      4,      5,      6,      9},
    {11,     9,      9,      9,      9,      0x040B, 9},
    {7,      9,      9,      9,      9,      10,     9},
    {0x080B, 9,      9,      9,      9,      0x0C0B, 9},
    {0x0801, 0x0803, 0x0804, 0x0804, 0x0805, 0x0806, 9},
};

u16 TextWindow_SetBaseTileNum(u16 baseTileNum)
{
    sTextWindowBaseTileNum = baseTileNum;
    return baseTileNum + 9;
}

// Loads the tiles and palette of the window frame into VRAM using the selected frame type
void TextWindow_LoadStdFrameGraphics(struct Window *win)
{
    u8 *tileData = win->template->tileData + TILE_SIZE_4BPP * sTextWindowBaseTileNum;
    LoadTextWindowTiles(gSaveBlock2.optionsWindowFrameType, tileData);
    LoadTextWindowPalette(gSaveBlock2.optionsWindowFrameType, STD_WINDOW_PALETTE_NUM);
}

// Loads the tiles and palette of the window frame into VRAM with an alternate palette
void TextWindow_LoadStdFrameGraphicsOverridePal(struct Window *win, u8 palSlot)
{
    u8 *tileData = win->template->tileData + TILE_SIZE_4BPP * sTextWindowBaseTileNum;
    LoadTextWindowTiles(gSaveBlock2.optionsWindowFrameType, tileData);
    LoadTextWindowPalette(gSaveBlock2.optionsWindowFrameType, palSlot);
}

// Loads the tiles and palette of the window frame into VRAM with an alternate frame type
void TextWindow_LoadStdFrameGraphicsOverrideStyle(struct Window *win, u8 frameType)
{
    u8 *tileData = win->template->tileData + TILE_SIZE_4BPP * sTextWindowBaseTileNum;
    LoadTextWindowTiles(frameType, tileData);
    LoadTextWindowPalette(frameType, STD_WINDOW_PALETTE_NUM);
}

void TextWindow_DrawStdFrame(struct Window *win, u8 left, u8 top, u8 right, u8 bottom)
{
    DrawStandardFrame(win->template->tilemap, sTextWindowBaseTileNum, left, top, right, bottom);
}

// Returns the tile data and palette for the specified frame type
const struct FrameGraphics *TextWindow_GetFrameGraphics(u8 frameType)
{
    if (frameType > 19)
        return &sTextWindowFrameGraphics[0];
    else
        return &sTextWindowFrameGraphics[frameType];
}

static void LoadTextWindowTiles(u8 frameType, void *dest)
{
    const struct FrameGraphics *frameGraphics = TextWindow_GetFrameGraphics(frameType);
    CpuFastCopy(frameGraphics->tiles, dest, 9 * TILE_SIZE_4BPP);
}

static void LoadTextWindowPalette(u8 frameType, u8 palSlot)
{
    const struct FrameGraphics *frameGraphics = TextWindow_GetFrameGraphics(frameType);
    LoadPalette(frameGraphics->palette, 16 * palSlot, 0x20);
}

// Draws a standard window frame
static void DrawStandardFrame(u16 *tilemap, u16 baseTileNum, u8 left, u8 top, u8 right, u8 bottom)
{
    u8 startX = min(left, right);
    u8 endX = max(left, right);
    u8 startY = min(top, bottom);
    u8 endY = max(top, bottom);
    u8 x, y;

    // top left corner
    tilemap[32 * startY + startX] = baseTileNum | (STD_WINDOW_PALETTE_NUM << 12);

    // top border
    for (x = startX + 1; x < endX; x++)
        tilemap[32 * startY + x] = (baseTileNum + 1) | (STD_WINDOW_PALETTE_NUM << 12);

    // top right corner
    tilemap[32 * startY + endX] = (baseTileNum + 2) | (STD_WINDOW_PALETTE_NUM << 12);

    for (y = startY + 1; y < endY; y++)
    {
        // left border
        tilemap[32 * y + startX] = (baseTileNum + 3) | (STD_WINDOW_PALETTE_NUM << 12);

        // middle
        for (x = startX + 1; x < endX; x++)
            tilemap[32 * y + x] = (baseTileNum + 4) | (STD_WINDOW_PALETTE_NUM << 12);

        // right border
        tilemap[32 * y + endX] = (baseTileNum + 5) | (STD_WINDOW_PALETTE_NUM << 12);
    }

    // bottom left corner
    tilemap[32 * endY + startX] = (baseTileNum + 6) | (STD_WINDOW_PALETTE_NUM << 12);

    // bottom border
    for (x = startX + 1; x < endX; x++)
        tilemap[32 * endY + x] = (baseTileNum + 7) | (STD_WINDOW_PALETTE_NUM << 12);

    // bottom right corner
    tilemap[32 * endY + endX] = (baseTileNum + 8) | (STD_WINDOW_PALETTE_NUM << 12);
}

u16 TextWindow_SetDlgFrameBaseTileNum(u16 baseTileNum)
{
    sDialogueFrameBaseTileNum = baseTileNum;
    return baseTileNum + 14;
}

void unref_sub_80651DC(struct Window *win, u8 *text)
{
    Text_InitWindow8002EB0(win, text, sDialogueFrameBaseTileNum + 14, 2, 15);
}

// Loads and draws a dialogue window frame
void TextWindow_DisplayDialogueFrame(struct Window *win)
{
    TextWindow_LoadDialogueFrameTiles(win);
    TextWindow_DrawDialogueFrame(win);
}

static u16 GetDialogueFrameTilemapEntry(u16 baseTilemapEntry, u8 x, u8 y, u8 width, u8 height)
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

    if (x < 7 && y < 5)
        tilemapEntry = sDialogueFrameTilemap[y][x];

    tilemapEntry += baseTilemapEntry;

    return tilemapEntry;
}

static void DrawDialogueFrame(struct Window *win, u8 left, u8 top, u8 width, u8 height)
{
    u8 x, y;
    u16 baseTilemapEntry = (win->paletteNum << 12) | sDialogueFrameBaseTileNum;
    u16 *tilemap = win->template->tilemap;

    for (y = 0; y < height + 2; y++)
    {
        for (x = 0; x < width + 6; x++)
            tilemap[(left + x) + 32 * (top + y)] = (win->paletteNum << 12) | GetDialogueFrameTilemapEntry(baseTilemapEntry, x, y, width, height);
    }
}

// Draws an alternate styled frame used for dialogue windows that appear on the overworld
void TextWindow_DrawDialogueFrame(struct Window *win)
{
    DrawDialogueFrame(win, STD_DLG_FRAME_LEFT, STD_DLG_FRAME_TOP, STD_DLG_FRAME_WIDTH, STD_DLG_FRAME_HEIGHT);
}

// Loads the dialogue window frame tiles into VRAM
void TextWindow_LoadDialogueFrameTiles(struct Window *win)
{
    u8 *tileData = win->template->tileData;
    CpuFastCopy(gDialogueFrame_Gfx, tileData + 32 * sDialogueFrameBaseTileNum, 14 * TILE_SIZE_4BPP);
}

// Erases a dialogue window frame
void TextWindow_EraseDialogueFrame(struct Window *win)
{
    u8 i;
    u16 *tilemap = win->template->tilemap + (STD_DLG_FRAME_TOP * 32);
    u16 tilemapEntry = win->paletteNum << 12;

    for (i = 0; i < ((STD_DLG_FRAME_HEIGHT + 2) * 32); i++)
        tilemap[i] = tilemapEntry;
}
