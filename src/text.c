#include "global.h"
#include "text.h"
#include "battle.h"
#include "main.h"
#include "palette.h"
#include "constants/songs.h"
#include "sound.h"
#include "string_util.h"

enum
{
    WIN_STATE_END,
    WIN_STATE_BEGIN,
    WIN_STATE_NORMAL,
    WIN_STATE_CHAR_DELAY,
    WIN_STATE_PAUSE,
    WIN_STATE_WAIT_BUTTON,
    WIN_STATE_NEWLINE,
    WIN_STATE_PLACEHOLDER,
    WIN_STATE_WAIT_CLEAR,
    WIN_STATE_WAIT_SCROLL,
    WIN_STATE_WAIT_SOUND,
};

enum
{
    TEXT_MODE_UNKNOWN0,
    TEXT_MODE_MONOSPACE,
    TEXT_MODE_UNKNOWN2,  // variable width?
};

enum
{
    WAIT_TYPE_NORMAL,      // allows the player to interrupt the text delay with A or B
    WAIT_TYPE_BATTLE,      // disables interrupting the text delay if in a link battle
    WAIT_TYPE_AUTOSCROLL,  // disables interrupting the text delay
    WAIT_TYPE_CONTEST,     // disables interrupting the text delay if in a link contest
};

struct Font
{
    u32 type;
    u8 *glyphs;
    u16 glyphSize;
    u16 lowerTileOffset;
};

struct GlyphBuffer
{
    // 0-7  left tile
    // 8-15 right tile (if it exists)
    u32 pixelRows[16];

    // pixel row filled with BG color
    u32 background;

    // table of color indices (not a palette)
    u32 colors[16];
};

struct GlyphTileInfo
{
    u8 textMode;
    u8 startPixel;
    u8 width;
    u8 *src;
    u32 *dest;
    u32 *colors;
};

struct ShiftAmount
{
    u32 left;
    u32 right;
};

static u16 InitVariableWidthFontTileData(struct Window *, u16);
static u16 LoadFixedWidthFont(struct Window *, u16);
static u16 LoadFixedWidthFont_Font1Latin(struct Window *, u16);
static u16 LoadFixedWidthFont_Font4Latin(struct Window *, u16);
static u16 LoadFixedWidthFont_Braille(struct Window *, u16);
static void MultistepLoadFont_LoadGlyph(struct Window *, u16, u8);
static u8 sub_8002FA0(struct Window *, const u8 *);
static u8 PrintNextChar(struct Window *);
static u8 HandleExtCtrlCode(struct Window *);
static u8 UpdateWindowText(struct Window *);
static u8 DrawGlyph_TextMode0(struct Window *, u32);
static void DrawGlyph_TextMode2(struct Window *, u32);
static void LoadFixedWidthGlyph(struct Window *, u32, u8 *);
static void WriteGlyphTilemap(struct Window *, u16, u16);
static void GetGlyphTilePointers(u8, u8, u16, u8 **, u8 **);
static u16 *GetCursorTilemapPointer(struct Window *);
static void ApplyColors_UnshadowedFont(const u8 *, u32 *, u8, u8);
static void ApplyColors_ShadowedFont(const void *, void *, u8, u8, u8);
static void SetCursorX(struct Window *, u8);
static void AddToCursorX(struct Window *, u8);
static void AddToCursorY(struct Window *, u8);
static void ClipLeft(struct Window *);
static void ClipRight(struct Window *);
static void SetWindowDefaultColors(struct Window *);
static void SetWindowBackgroundColor(struct Window *, u8);
static void SetWindowShadowColor(struct Window *, u8);
static void SetWindowForegroundColor(struct Window *, u8);
static u8 GetTextDelay(struct Window *);
static bool8 PlayerCanInterruptDelay(struct Window *);
static void ScrollWindowTextLines(struct Window *);
static void ScrollWindowTextLines_TextMode0(struct Window *);
static void DoScroll_TextMode0(struct Window *, u16);
static void ScrollWindowTextLines_TextModeMonospace(struct Window *);
static void DoScroll_TextModeMonospace(struct Window *, u16);
static void ScrollWindowTextLines_TextMode2(struct Window *);
static void DoScroll_TextMode2(struct Window *, u8);
void Text_ClearWindow(struct Window *);
static void ClearWindowTextLines_TextMode0_TextMode1(struct Window *, u8);
static void ClearWindowTextLines_TextMode2(struct Window *, u8);
static void TryEraseDownArrow(struct Window *);
static u16 GetBlankTileNum(struct Window *);
static u8 WaitWithDownArrow(struct Window *);
static void DrawInitialDownArrow(struct Window *);
static void UpdateDownArrowAnimation(struct Window *);
static u16 GetCursorTileNum(struct Window *, u32, u32);
static s32 DrawGlyphTiles(struct Window *, u32, u32);
static void UpdateTilemap(struct Window *, u32);
static u8 GetGlyphWidth(struct Window *, u32);
static s32 DrawGlyphTile_ShadowedFont(struct GlyphTileInfo *);

static void PrintGlyph_TextMode0(struct Window *, u32);
static void PrintGlyph_TextMode1(struct Window *, u32);
static void PrintGlyph_TextMode2(struct Window *, u32);

static void WriteGlyphTilemap_Font0_Font3(struct Window *, u32);
static void WriteGlyphTilemap_Font1_Font4(struct Window *, u32);
static void WriteGlyphTilemap_Font2_Font5(struct Window *, u32);
static void WriteGlyphTilemap_Font1_Font4(struct Window *, u32);
static void WriteGlyphTilemap_Font2_Font5(struct Window *, u32);
static void WriteGlyphTilemap_Font6(struct Window *, u32);

static u8 ExtCtrlCode_Nop(struct Window *);
static u8 ExtCtrlCode_ForegroundColor(struct Window *);
static u8 ExtCtrlCode_BackgroundColor(struct Window *);
static u8 ExtCtrlCode_ShadowColor(struct Window *);
static u8 ExtCtrlCode_AllColors(struct Window *);
static u8 ExtCtrlCode_Palette(struct Window *);
static u8 ExtCtrlCode_Font(struct Window *);
static u8 ExtCtrlCode_DefaultFont(struct Window *);
static u8 ExtCtrlCode_Pause(struct Window *);
static u8 ExtCtrlCode_WaitButton(struct Window *);
static u8 ExtCtrlCode_WaitSound(struct Window *);
static u8 ExtCtrlCode_PlayBGM(struct Window *);
static u8 ExtCtrlCode_Escape(struct Window *);
static u8 ExtCtrlCode_Nop2(struct Window *);
static u8 ExtCtrlCode_SetCursorY(struct Window *);
static u8 ExtCtrlCode_ClearWindowTextLines(struct Window *);
static u8 ExtCtrlCode_PlaySE(struct Window *);
static u8 ExtCtrlCode_Skip(struct Window *);
static u8 ExtCtrlCode_SetCursorX(struct Window *);
static u8 ExtCtrlCode_SkipTo(struct Window *);
static u8 ExtCtrlCode_Spacing(struct Window *);
static u8 ExtCtrlCode_Japanese(struct Window *);
static u8 ExtCtrlCode_Latin(struct Window *);

static void ShiftGlyphTile_UnshadowedFont_Width0(struct GlyphBuffer *, u8 *, u32 *, u8);
static void ShiftGlyphTile_UnshadowedFont_Width1(struct GlyphBuffer *, u8 *, u32 *, u8);
static void ShiftGlyphTile_UnshadowedFont_Width2(struct GlyphBuffer *, u8 *, u32 *, u8);
static void ShiftGlyphTile_UnshadowedFont_Width3(struct GlyphBuffer *, u8 *, u32 *, u8);
static void ShiftGlyphTile_UnshadowedFont_Width4(struct GlyphBuffer *, u8 *, u32 *, u8);
static void ShiftGlyphTile_UnshadowedFont_Width5(struct GlyphBuffer *, u8 *, u32 *, u8);
static void ShiftGlyphTile_UnshadowedFont_Width6(struct GlyphBuffer *, u8 *, u32 *, u8);
static void ShiftGlyphTile_UnshadowedFont_Width7(struct GlyphBuffer *, u8 *, u32 *, u8);
static void ShiftGlyphTile_UnshadowedFont_Width8(struct GlyphBuffer *, u8 *, u32 *, u8);

static void ShiftGlyphTile_ShadowedFont_Width0(struct GlyphBuffer *, u32 *, u32 *, u8);
static void ShiftGlyphTile_ShadowedFont_Width1(struct GlyphBuffer *, u32 *, u32 *, u8);
static void ShiftGlyphTile_ShadowedFont_Width2(struct GlyphBuffer *, u32 *, u32 *, u8);
static void ShiftGlyphTile_ShadowedFont_Width3(struct GlyphBuffer *, u32 *, u32 *, u8);
static void ShiftGlyphTile_ShadowedFont_Width4(struct GlyphBuffer *, u32 *, u32 *, u8);
static void ShiftGlyphTile_ShadowedFont_Width5(struct GlyphBuffer *, u32 *, u32 *, u8);
static void ShiftGlyphTile_ShadowedFont_Width6(struct GlyphBuffer *, u32 *, u32 *, u8);
static void ShiftGlyphTile_ShadowedFont_Width7(struct GlyphBuffer *, u32 *, u32 *, u8);
static void ShiftGlyphTile_ShadowedFont_Width8(struct GlyphBuffer *, u32 *, u32 *, u8);

static struct Window *sMultistepLoadFont_Window;
static u16 sMultistepLoadFont_StartOffset;
static u16 sMultistepLoadFont_Index;
static struct Window sTempWindow;
static u8 sWaitType;
static u8 sLineLength;
static struct GlyphBuffer sGlyphBuffer;

EWRAM_DATA u16 gBGTilemapBuffers[4][0x400] = {0};

EWRAM_DATA u8 gStringVar1[0x100] = {0};
EWRAM_DATA u8 gStringVar2[0x100] = {0};
EWRAM_DATA u8 gStringVar3[0x100] = {0};
EWRAM_DATA u8 gStringVar4[0x100] = {0};

extern u16 gBattleTypeFlags;
extern u8 gIsLinkContest;
extern u8 gTileBuffer[];

vu16 *const gBGControlRegs[] =
{
    &REG_BG0CNT,
    &REG_BG1CNT,
    &REG_BG2CNT,
    &REG_BG3CNT,
};

vu16 *const gBGHOffsetRegs[] =
{
    &REG_BG0HOFS,
    &REG_BG1HOFS,
    &REG_BG2HOFS,
    &REG_BG3HOFS,
};

vu16 *const gBGVOffsetRegs[] =
{
    &REG_BG0VOFS,
    &REG_BG1VOFS,
    &REG_BG2VOFS,
    &REG_BG3VOFS,
};

const u16 gUnknown_081E29D8[] = { 0x100, 0x200, 0x400, 0x800 };
const u16 gUnknown_081E29E0[] = { 0x100, 0x200, 0x400, 0x800 };
const u16 gUnknown_081E29E8[] = { 1, 2, 4, 8 };

static const u8 sFont0LatinGlyphs[] = INCBIN_U8("graphics/fonts/font0_lat.1bpp");
static const u8 sFont1LatinGlyphs[] = INCBIN_U8("graphics/fonts/font1_lat.1bpp");
static const u8 sFont0JapaneseGlyphs[] = INCBIN_U8("graphics/fonts/font0_jpn.1bpp");
static const u8 sFont1JapaneseGlyphs[] = INCBIN_U8("graphics/fonts/font1_jpn.1bpp");
static const u8 sBrailleGlyphs[] = INCBIN_U8("graphics/fonts/font6_braille.1bpp");
static const u32 sDownArrowTiles[] = INCBIN_U32("graphics/fonts/down_arrow.4bpp");

// clang-format off
#include "data/text/type1_map.h"
#include "data/text/type3_map.h"
#include "data/text/font1_widths.h"
#include "data/text/font4_widths.h"
#include "data/text/font0_widths.h"
#include "data/text/font3_widths.h"
// clang-format on

const u16 gUnknownPalette_81E6692[] = INCBIN_U16("graphics/fonts/unknown_81E6692.gbapal");
const u16 gFontDefaultPalette[] = INCBIN_U16("graphics/fonts/default.gbapal");

const u8 sBlankTile[8] = { 0, 0, 0, 0, 0, 0, 0, 0, };

static const u32 sGlyphMasks[9][8][3] =
{
    {
        { 0xFFFFFFFF,0xFFFFFFFF,0x00000000, },
        { 0xFFFFFFFF,0xFFFFFFFF,0x00000000, },
        { 0xFFFFFFFF,0xFFFFFFFF,0x00000000, },
        { 0xFFFFFFFF,0xFFFFFFFF,0x00000000, },
        { 0xFFFFFFFF,0xFFFFFFFF,0x00000000, },
        { 0xFFFFFFFF,0xFFFFFFFF,0x00000000, },
        { 0xFFFFFFFF,0xFFFFFFFF,0x00000000, },
        { 0xFFFFFFFF,0xFFFFFFFF,0x00000000, },
    },
    {
        { 0x00000000,0xFFFFFFFF,0xFFFFFFF0, },
        { 0x0000000F,0xFFFFFFFF,0xFFFFFF00, },
        { 0x000000FF,0xFFFFFFFF,0xFFFFF000, },
        { 0x00000FFF,0xFFFFFFFF,0xFFFF0000, },
        { 0x0000FFFF,0xFFFFFFFF,0xFFF00000, },
        { 0x000FFFFF,0xFFFFFFFF,0xFF000000, },
        { 0x00FFFFFF,0xFFFFFFFF,0xF0000000, },
        { 0x0FFFFFFF,0xFFFFFFFF,0x00000000, },
    },
    {
        { 0x00000000,0xFFFFFFFF,0xFFFFFF00, },
        { 0x0000000F,0xFFFFFFFF,0xFFFFF000, },
        { 0x000000FF,0xFFFFFFFF,0xFFFF0000, },
        { 0x00000FFF,0xFFFFFFFF,0xFFF00000, },
        { 0x0000FFFF,0xFFFFFFFF,0xFF000000, },
        { 0x000FFFFF,0xFFFFFFFF,0xF0000000, },
        { 0x00FFFFFF,0xFFFFFFFF,0x00000000, },
        { 0x0FFFFFFF,0xFFFFFFF0,0x00000000, },
    },
    {
        { 0x00000000,0xFFFFFFFF,0xFFFFF000, },
        { 0x0000000F,0xFFFFFFFF,0xFFFF0000, },
        { 0x000000FF,0xFFFFFFFF,0xFFF00000, },
        { 0x00000FFF,0xFFFFFFFF,0xFF000000, },
        { 0x0000FFFF,0xFFFFFFFF,0xF0000000, },
        { 0x000FFFFF,0xFFFFFFFF,0x00000000, },
        { 0x00FFFFFF,0xFFFFFFF0,0x00000000, },
        { 0x0FFFFFFF,0xFFFFFF00,0x00000000, },
    },
    {
        { 0x00000000,0xFFFFFFFF,0xFFFF0000, },
        { 0x0000000F,0xFFFFFFFF,0xFFF00000, },
        { 0x000000FF,0xFFFFFFFF,0xFF000000, },
        { 0x00000FFF,0xFFFFFFFF,0xF0000000, },
        { 0x0000FFFF,0xFFFFFFFF,0x00000000, },
        { 0x000FFFFF,0xFFFFFFF0,0x00000000, },
        { 0x00FFFFFF,0xFFFFFF00,0x00000000, },
        { 0x0FFFFFFF,0xFFFFF000,0x00000000, },
    },
    {
        { 0x00000000,0xFFFFFFFF,0xFFF00000, },
        { 0x0000000F,0xFFFFFFFF,0xFF000000, },
        { 0x000000FF,0xFFFFFFFF,0xF0000000, },
        { 0x00000FFF,0xFFFFFFFF,0x00000000, },
        { 0x0000FFFF,0xFFFFFFF0,0x00000000, },
        { 0x000FFFFF,0xFFFFFF00,0x00000000, },
        { 0x00FFFFFF,0xFFFFF000,0x00000000, },
        { 0x0FFFFFFF,0xFFFF0000,0x00000000, },
    },
    {
        { 0x00000000,0xFFFFFFFF,0xFF000000, },
        { 0x0000000F,0xFFFFFFFF,0xF0000000, },
        { 0x000000FF,0xFFFFFFFF,0x00000000, },
        { 0x00000FFF,0xFFFFFFF0,0x00000000, },
        { 0x0000FFFF,0xFFFFFF00,0x00000000, },
        { 0x000FFFFF,0xFFFFF000,0x00000000, },
        { 0x00FFFFFF,0xFFFF0000,0x00000000, },
        { 0x0FFFFFFF,0xFFF00000,0x00000000, },
    },
    {
        { 0x00000000,0xFFFFFFFF,0xF0000000, },
        { 0x0000000F,0xFFFFFFFF,0x00000000, },
        { 0x000000FF,0xFFFFFFF0,0x00000000, },
        { 0x00000FFF,0xFFFFFF00,0x00000000, },
        { 0x0000FFFF,0xFFFFF000,0x00000000, },
        { 0x000FFFFF,0xFFFF0000,0x00000000, },
        { 0x00FFFFFF,0xFFF00000,0x00000000, },
        { 0x0FFFFFFF,0xFF000000,0x00000000, },
    },
    {
        { 0x00000000,0xFFFFFFFF,0x00000000, },
        { 0x0000000F,0xFFFFFFF0,0x00000000, },
        { 0x000000FF,0xFFFFFF00,0x00000000, },
        { 0x00000FFF,0xFFFFF000,0x00000000, },
        { 0x0000FFFF,0xFFFF0000,0x00000000, },
        { 0x000FFFFF,0xFFF00000,0x00000000, },
        { 0x00FFFFFF,0xFF000000,0x00000000, },
        { 0x0FFFFFFF,0xF0000000,0x00000000, },
    },
};

static const struct ShiftAmount sGlyphShiftAmounts[8] =
{
    {  0, 32 },
    {  4, 28 },
    {  8, 24 },
    { 12, 20 },
    { 16, 16 },
    { 20, 12 },
    { 24,  8 },
    { 28,  4 },
};

typedef void (*PrintGlyphFunc)(struct Window *, u32);

static const PrintGlyphFunc sPrintGlyphFuncs[] =
{
    PrintGlyph_TextMode0,
    PrintGlyph_TextMode1,
    PrintGlyph_TextMode2,
};

typedef void (*WriteGlyphTilemapFunc)(struct Window *, u32);

static const WriteGlyphTilemapFunc sWriteGlyphTilemapFuncs[] =
{
    WriteGlyphTilemap_Font0_Font3,
    WriteGlyphTilemap_Font1_Font4,
    WriteGlyphTilemap_Font2_Font5,
    WriteGlyphTilemap_Font0_Font3,
    WriteGlyphTilemap_Font1_Font4,
    WriteGlyphTilemap_Font2_Font5,
    WriteGlyphTilemap_Font6,
};

static const struct Window sDefaultWindow = { .language = GAME_LANGUAGE };

typedef u8 (*ExtCtrlCodeFunc)(struct Window *);

static const ExtCtrlCodeFunc sExtCtrlCodeFuncs[] =
{
    ExtCtrlCode_Nop,
    ExtCtrlCode_ForegroundColor,
    ExtCtrlCode_BackgroundColor,
    ExtCtrlCode_ShadowColor,
    ExtCtrlCode_AllColors,
    ExtCtrlCode_Palette,
    ExtCtrlCode_Font,
    ExtCtrlCode_DefaultFont,
    ExtCtrlCode_Pause,
    ExtCtrlCode_WaitButton,
    ExtCtrlCode_WaitSound,
    ExtCtrlCode_PlayBGM,
    ExtCtrlCode_Escape,
    ExtCtrlCode_Nop2,
    ExtCtrlCode_SetCursorY,
    ExtCtrlCode_ClearWindowTextLines,
    ExtCtrlCode_PlaySE,
    ExtCtrlCode_Skip,
    ExtCtrlCode_SetCursorX,
    ExtCtrlCode_SkipTo,
    ExtCtrlCode_Spacing,
    ExtCtrlCode_Japanese,
    ExtCtrlCode_Latin,
};

extern const u32 gFont3LatinGlyphs[];
extern const u32 gFont4LatinGlyphs[];
extern const u32 gFont3JapaneseGlyphs[];
extern const u32 gFont4JapaneseGlyphs[];

// Getting rid of the u8 recasting will make the ROM no longer match due to
// a const being required to pass the elements directly to the rodata structs.
static const struct Font sFonts[] =
{
    // Japanese fonts
    { 0, (u8 *)sFont0JapaneseGlyphs, 16,   8 },
    { 1, (u8 *)sFont1JapaneseGlyphs,  8,   0 },
    { 2, (u8 *)sFont1JapaneseGlyphs,  8,   0 },
    { 4, (u8 *)gFont3JapaneseGlyphs, 64, 512 },
    { 1, (u8 *)gFont4JapaneseGlyphs, 32,   0 },
    { 2, (u8 *)gFont4JapaneseGlyphs, 32,   0 },
    { 3, (u8 *)sBrailleGlyphs,  8,   0 },
    // Latin
    { 0, (u8 *)sFont0LatinGlyphs, 16,   8 },
    { 1, (u8 *)sFont1LatinGlyphs,  8,   0 },
    { 2, (u8 *)sFont1LatinGlyphs,  8,   0 },
    { 0, (u8 *)gFont3LatinGlyphs, 64,  32 },
    { 1, (u8 *)gFont4LatinGlyphs, 32,   0 },
    { 2, (u8 *)gFont4LatinGlyphs, 32,   0 },
    { 3, (u8 *)sBrailleGlyphs,  8,   0 },
};

static const u8 sTextSpeedDelays[] = { 6, 3, 1 }; // slow, mid, fast

static const u8 sExtCtrlCodeLengths[] =
{
    1,
    2,
    2,
    2,
    4,
    2,
    2,
    1,
    2,
    1,
    1,
    3,
    2,
    2,
    2,
    1,
    3,
    2,
    2,
    2,
    2,
    1,
    1,
};

typedef void (*ShiftGlyphTileUnshadowedFunc)(struct GlyphBuffer *, u8 *, u32 *, u8);

static const ShiftGlyphTileUnshadowedFunc sShiftGlyphTileUnshadowedFuncs[] =
{
    ShiftGlyphTile_UnshadowedFont_Width0,
    ShiftGlyphTile_UnshadowedFont_Width1,
    ShiftGlyphTile_UnshadowedFont_Width2,
    ShiftGlyphTile_UnshadowedFont_Width3,
    ShiftGlyphTile_UnshadowedFont_Width4,
    ShiftGlyphTile_UnshadowedFont_Width5,
    ShiftGlyphTile_UnshadowedFont_Width6,
    ShiftGlyphTile_UnshadowedFont_Width7,
    ShiftGlyphTile_UnshadowedFont_Width8,
};

typedef void (*ShiftGlyphTileShadowedFunc)(struct GlyphBuffer *, u32 *, u32 *, u8);

static const ShiftGlyphTileShadowedFunc sShiftGlyphTileShadowedFuncs[] =
{
    ShiftGlyphTile_ShadowedFont_Width0,
    ShiftGlyphTile_ShadowedFont_Width1,
    ShiftGlyphTile_ShadowedFont_Width2,
    ShiftGlyphTile_ShadowedFont_Width3,
    ShiftGlyphTile_ShadowedFont_Width4,
    ShiftGlyphTile_ShadowedFont_Width5,
    ShiftGlyphTile_ShadowedFont_Width6,
    ShiftGlyphTile_ShadowedFont_Width7,
    ShiftGlyphTile_ShadowedFont_Width8,
};

const struct WindowTemplate gWindowTemplate_81E6C3C =
{
    0, // BG number
    2, // BG character base block
    31, // BG screen base block
    0, // BG priority
    15, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    0, // font
    0, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(31), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6C58 =
{
    0, // BG number
    0, // BG character base block
    24, // BG screen base block
    0, // BG priority
    0, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    0, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    26, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(24), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6C74 =
{
    0, // BG number
    0, // BG character base block
    0, // BG screen base block
    0, // BG priority
    0, // palette number
    1, // foreground color
    0, // background color
    3, // shadow color
    4, // font
    0, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    OBJ_VRAM0, // tile data
    NULL, // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6C90 =
{
    0, // BG number
    1, // BG character base block
    30, // BG screen base block
    2, // BG priority
    31, // palette number
    15, // foreground color
    0, // background color
    1, // shadow color
    4, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(1), // tile data
    BG_SCREEN_ADDR(30), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6CAC =
{
    0, // BG number
    0, // BG character base block
    0, // BG screen base block
    0, // BG priority
    0, // palette number
    15, // foreground color
    0, // background color
    1, // shadow color
    4, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    8, // width
    60, // height
    gTileBuffer, // tile data
    NULL, // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6CC8 =
{
    2, // BG number
    2, // BG character base block
    15, // BG screen base block
    0, // BG priority
    15, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(15), // tilemap
};

const struct WindowTemplate gMenuTextWindowTemplate =
{
    0, // BG number
    2, // BG character base block
    31, // BG screen base block
    0, // BG priority
    15, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(31), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6D00 =
{
    0, // BG number
    0, // BG character base block
    31, // BG screen base block
    0, // BG priority
    15, // palette number
    2, // foreground color
    15, // background color
    3, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(31), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6D1C =
{
    1, // BG number
    0, // BG character base block
    31, // BG screen base block
    1, // BG priority
    15, // palette number
    2, // foreground color
    15, // background color
    3, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(31), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6D38 =
{
    0, // BG number
    0, // BG character base block
    0, // BG screen base block
    0, // BG priority
    0, // palette number
    15, // foreground color
    0, // background color
    14, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    8, // width
    64, // height
    gTileBuffer, // tile data
    NULL, // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6D54 =
{
    3, // BG number
    3, // BG character base block
    15, // BG screen base block
    3, // BG priority
    2, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(3), // tile data
    BG_SCREEN_ADDR(15), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6D70 =
{
    3, // BG number
    3, // BG character base block
    15, // BG screen base block
    3, // BG priority
    3, // palette number
    1, // foreground color
    3, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(3), // tile data
    BG_SCREEN_ADDR(15), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6D8C =
{
    1, // BG number
    0, // BG character base block
    14, // BG screen base block
    1, // BG priority
    0, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(14), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6DA8 =
{
    0, // BG number
    0, // BG character base block
    12, // BG screen base block
    0, // BG priority
    15, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(11), // tilemap
};

const struct WindowTemplate gWindowTemplate_TrainerCard_Back_Values =
{
    0, // BG number
    2, // BG character base block
    30, // BG screen base block
    0, // BG priority
    15, // palette number
    1, // foreground color
    0, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(30), // tilemap
};

const struct WindowTemplate gWindowTemplate_TrainerCard_Back_Labels =
{
    0, // BG number
    2, // BG character base block
    30, // BG screen base block
    0, // BG priority
    14, // palette number
    1, // foreground color
    0, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(30), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6DFC =
{
    0, // BG number
    2, // BG character base block
    31, // BG screen base block
    0, // BG priority
    15, // palette number
    1, // foreground color
    0, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(31), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6E18 =
{
    0, // BG number
    2, // BG character base block
    31, // BG screen base block
    1, // BG priority
    15, // palette number
    1, // foreground color
    0, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(31), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6E34 =
{
    1, // BG number
    0, // BG character base block
    31, // BG screen base block
    1, // BG priority
    15, // palette number
    1, // foreground color
    0, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(31), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6E50 =
{
    0, // BG number
    2, // BG character base block
    28, // BG screen base block
    0, // BG priority
    13, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(28), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6E6C =
{
    0, // BG number
    2, // BG character base block
    30, // BG screen base block
    0, // BG priority
    13, // palette number
    15, // foreground color
    0, // background color
    10, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(30), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6E88 =
{
    0, // BG number
    0, // BG character base block
    31, // BG screen base block
    0, // BG priority
    15, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(31), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6EA4 =
{
    1, // BG number
    0, // BG character base block
    28, // BG screen base block
    1, // BG priority
    1, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    8, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(28), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6EC0 =
{
    2, // BG number
    2, // BG character base block
    29, // BG screen base block
    2, // BG priority
    1, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    8, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(29), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6EDC =
{
    1, // BG number
    0, // BG character base block
    28, // BG screen base block
    1, // BG priority
    2, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    8, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(28), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6EF8 =
{
    2, // BG number
    2, // BG character base block
    29, // BG screen base block
    2, // BG priority
    2, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    8, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(29), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6F14 =
{
    1, // BG number
    0, // BG character base block
    28, // BG screen base block
    1, // BG priority
    3, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    8, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(28), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6F30 =
{
    2, // BG number
    2, // BG character base block
    29, // BG screen base block
    2, // BG priority
    3, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    8, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(29), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6F4C =
{
    3, // BG number
    0, // BG character base block
    30, // BG screen base block
    3, // BG priority
    0, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(30), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6F68 =
{
    0, // BG number
    2, // BG character base block
    13, // BG screen base block
    0, // BG priority
    15, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(13), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6F84 =
{
    0, // BG number
    2, // BG character base block
    31, // BG screen base block
    0, // BG priority
    15, // palette number
    15, // foreground color
    0, // background color
    1, // shadow color
    3, // font
    0, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(31), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6FA0 =
{
    1, // BG number
    0, // BG character base block
    24, // BG screen base block
    3, // BG priority
    15, // palette number
    1, // foreground color
    0, // background color
    8, // shadow color
    3, // font
    0, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(24), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6FBC =
{
    0, // BG number
    0, // BG character base block
    30, // BG screen base block
    0, // BG priority
    15, // palette number
    15, // foreground color
    0, // background color
    8, // shadow color
    3, // font
    0, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(30), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6FD8 =
{
    0, // BG number
    0, // BG character base block
    24, // BG screen base block
    0, // BG priority
    15, // palette number
    15, // foreground color
    0, // background color
    8, // shadow color
    3, // font
    0, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(24), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E6FF4 =
{
    0, // BG number
    0, // BG character base block
    24, // BG screen base block
    0, // BG priority
    15, // palette number
    1, // foreground color
    0, // background color
    8, // shadow color
    3, // font
    0, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(24), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E7010 =
{
    0, // BG number
    0, // BG character base block
    30, // BG screen base block
    0, // BG priority
    15, // palette number
    1, // foreground color
    0, // background color
    8, // shadow color
    3, // font
    0, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(30), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E702C =
{
    3, // BG number
    2, // BG character base block
    15, // BG screen base block
    0, // BG priority
    15, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(15), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E7048 =
{
    2, // BG number
    2, // BG character base block
    14, // BG screen base block
    2, // BG priority
    15, // palette number
    1, // foreground color
    0, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    16, // tilemap left coordinate
    0, // tilemap top coordinate
    16, // width
    32, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(14), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E7064 =
{
    2, // BG number
    2, // BG character base block
    14, // BG screen base block
    2, // BG priority
    15, // palette number
    1, // foreground color
    0, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(14), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E7080 =
{
    3, // BG number
    0, // BG character base block
    30, // BG screen base block
    3, // BG priority
    11, // palette number
    1, // foreground color
    15, // background color
    5, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(30), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E709C =
{
    0, // BG number
    0, // BG character base block
    31, // BG screen base block
    1, // BG priority
    15, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(31), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E70B8 =
{
    2, // BG number
    0, // BG character base block
    30, // BG screen base block
    2, // BG priority
    11, // palette number
    1, // foreground color
    0, // background color
    5, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(30), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E70D4 =
{
    3, // BG number
    0, // BG character base block
    30, // BG screen base block
    3, // BG priority
    11, // palette number
    1, // foreground color
    15, // background color
    5, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(30), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E70F0 =
{
    0, // BG number
    0, // BG character base block
    0, // BG screen base block
    0, // BG priority
    0, // palette number
    15, // foreground color
    1, // background color
    14, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    32, // width
    32, // height
    gTileBuffer, // tile data
    NULL, // tilemap
};

const struct WindowTemplate gWindowTemplate_81E710C =
{
    0, // BG number
    0, // BG character base block
    31, // BG screen base block
    1, // BG priority
    15, // palette number
    1, // foreground color
    0, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(31), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E7128 =
{
    0, // BG number
    2, // BG character base block
    31, // BG screen base block
    0, // BG priority
    15, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(31), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E7144 =
{
    0, // BG number
    2, // BG character base block
    31, // BG screen base block
    0, // BG priority
    13, // palette number
    1, // foreground color
    0, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(31), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E7160 =
{
    1, // BG number
    1, // BG character base block
    10, // BG screen base block
    1, // BG priority
    14, // palette number
    1, // foreground color
    0, // background color
    8, // shadow color
    3, // font
    0, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(1), // tile data
    BG_SCREEN_ADDR(10), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E717C =
{
    0, // BG number
    3, // BG character base block
    31, // BG screen base block
    0, // BG priority
    15, // palette number
    15, // foreground color
    0, // background color
    8, // shadow color
    3, // font
    0, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(3), // tile data
    BG_SCREEN_ADDR(31), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E7198 =
{
    0, // BG number
    2, // BG character base block
    15, // BG screen base block
    0, // BG priority
    15, // palette number
    15, // foreground color
    0, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(15), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E71B4 =
{
    0, // BG number
    2, // BG character base block
    15, // BG screen base block
    0, // BG priority
    15, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(15), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E71D0 =
{
    1, // BG number
    1, // BG character base block
    28, // BG screen base block
    0, // BG priority
    5, // palette number
    13, // foreground color
    14, // background color
    15, // shadow color
    3, // font
    0, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(1), // tile data
    BG_SCREEN_ADDR(28), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E71EC =
{
    2, // BG number
    1, // BG character base block
    30, // BG screen base block
    0, // BG priority
    5, // palette number
    13, // foreground color
    14, // background color
    15, // shadow color
    3, // font
    0, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(1), // tile data
    BG_SCREEN_ADDR(30), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E7208 =
{
    0, // BG number
    2, // BG character base block
    28, // BG screen base block
    0, // BG priority
    8, // palette number
    1, // foreground color
    0, // background color
    2, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(28), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E7224 =
{
    0, // BG number
    0, // BG character base block
    31, // BG screen base block
    0, // BG priority
    15, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(0), // tile data
    BG_SCREEN_ADDR(31), // tilemap
};

const struct WindowTemplate gMoveTutorMenuFramesWindowTemplate =
{
    1, // BG number
    2, // BG character base block
    30, // BG screen base block
    0, // BG priority
    15, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    BG_CHAR_ADDR(2), // tile data
    BG_SCREEN_ADDR(30), // tilemap
};

const struct WindowTemplate gWindowTemplate_81E725C =
{
    0, // BG number
    0, // BG character base block
    0, // BG screen base block
    0, // BG priority
    0, // palette number
    15, // foreground color
    0, // background color
    14, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    30, // width
    20, // height
    OBJ_VRAM0, // tile data
    NULL, // tilemap
};

const struct WindowTemplate gWindowTemplate_81E7278 =
{
    0, // BG number
    0, // BG character base block
    0, // BG screen base block
    0, // BG priority
    0, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    3, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    16, // width
    32, // height
    gTileBuffer, // tile data
    NULL, // tilemap
};

const struct WindowTemplate gWindowTemplate_81E7294 =
{
    0, // BG number
    0, // BG character base block
    0, // BG screen base block
    0, // BG priority
    0, // palette number
    1, // foreground color
    15, // background color
    8, // shadow color
    4, // font
    2, // text mode
    0, // spacing
    0, // tilemap left coordinate
    0, // tilemap top coordinate
    16, // width
    32, // height
    gTileBuffer, // tile data
    NULL, // tilemap
};

static void UpdateBGRegs(const struct WindowTemplate *winTemplate)
{
    u8 bgNum = winTemplate->bgNum;
    *gBGHOffsetRegs[bgNum] = 0;
    *gBGVOffsetRegs[bgNum] = 0;
    *gBGControlRegs[bgNum] = winTemplate->priority | (winTemplate->screenBaseBlock << 8) | (winTemplate->charBaseBlock << 2);
}

static void ClearBGMem(const struct WindowTemplate *winTemplate)
{
    CpuFastFill(0, winTemplate->tileData, 32);

    if (winTemplate->tilemap)
        CpuFastFill(0, winTemplate->tilemap, 0x800);
}

void LoadFontDefaultPalette(const struct WindowTemplate *winTemplate)
{
    LoadPalette(gFontDefaultPalette, 16 * winTemplate->paletteNum, 32);
}

void Text_LoadWindowTemplate(const struct WindowTemplate *winTemplate)
{
    UpdateBGRegs(winTemplate);
    ClearBGMem(winTemplate);
    LoadFontDefaultPalette(winTemplate);
}

u16 InitWindowTileData(struct Window *win, u16 startOffset)
{
    u16 retVal;

    win->tileDataStartOffset = startOffset;
    retVal = 0;

    switch (win->template->textMode)
    {
    case TEXT_MODE_UNKNOWN2:
        retVal = InitVariableWidthFontTileData(win, startOffset);
        break;
    case TEXT_MODE_MONOSPACE:
        switch (win->template->fontNum)
        {
        case 0:
        case 3:
            retVal = LoadFixedWidthFont(win, startOffset);
            break;
        case 1:
        case 2:
            retVal = LoadFixedWidthFont_Font1Latin(win, startOffset);
            break;
        case 4:
        case 5:
            retVal = LoadFixedWidthFont_Font4Latin(win, startOffset);
            break;
        case 6:
            retVal = LoadFixedWidthFont_Braille(win, startOffset);
            break;
        }
        break;
    }

    return retVal;
}

static u16 InitVariableWidthFontTileData(struct Window *win, u16 startOffset)
{
    u8 *buffer;

    win->tileDataStartOffset = startOffset;
    win->tileDataOffset = 2;
    buffer =  win->tileData + 32 * win->tileDataStartOffset;
    CpuFastFill(0, buffer, 32);
    ApplyColors_UnshadowedFont(sBlankTile, (u32 *)(buffer + 32), win->template->foregroundColor, win->template->backgroundColor);
    return win->tileDataStartOffset + win->tileDataOffset + win->width * win->height;
}

static u16 LoadFixedWidthFont(struct Window *win, u16 startOffset)
{
    s32 glyph;
    u8 *buffer = win->tileData + 32 * startOffset;
    for (glyph = 0; glyph < 256; glyph++)
    {
        LoadFixedWidthGlyph(win, glyph, buffer);
        buffer += 64;
    }
    return 2 * glyph;
}

static u16 LoadFixedWidthFont_Font1Latin(struct Window *win, u16 startOffset)
{
    s32 i;
    u8 *buffer = win->tileData + 32 * startOffset;
    for (i = 0; i < 256; i++)
    {
        ApplyColors_UnshadowedFont(&sFont1LatinGlyphs[8 * i], (u32 *)buffer, win->foregroundColor, win->backgroundColor);
        buffer += 32;
    }
    return i;
}

static u16 LoadFixedWidthFont_Font4Latin(struct Window *win, u16 startOffset)
{
    s32 i;
    u8 *buffer = win->tileData + 32 * startOffset;
    for (i = 0; i < 256; i++)
    {
        ApplyColors_ShadowedFont(&gFont4LatinGlyphs[8 * i], buffer, win->foregroundColor, win->shadowColor, win->backgroundColor);
        buffer += 32;
    }
    return i;
}

static u16 LoadFixedWidthFont_Braille(struct Window *win, u16 startOffset)
{
    s32 i;
    u8 *buffer = win->tileData + 32 * startOffset;
    for (i = 0; i < 256; i++)
    {
        ApplyColors_UnshadowedFont(&sBrailleGlyphs[8 * i], (u32 *)buffer, win->foregroundColor, win->backgroundColor);
        buffer += 32;
    }
    return i;
}

u32 MultistepInitWindowTileData(struct Window *win, u16 startOffset)
{
    u32 retVal;
    sMultistepLoadFont_Window = win;
    sMultistepLoadFont_Index = 0;
    sMultistepLoadFont_StartOffset = startOffset;
    win->tileDataStartOffset = startOffset;
    retVal = 0;

    switch (win->template->textMode)
    {
    case TEXT_MODE_UNKNOWN2:
        retVal = InitVariableWidthFontTileData(win, startOffset);
        break;
    case TEXT_MODE_MONOSPACE:
        retVal = 256;
        if (win->template->fontNum == 0
         || win->template->fontNum == 3)
            retVal *= 2;
        break;
    }

    return retVal;
}

bool32 MultistepLoadFont(void)
{
    bool32 retVal = TRUE;

    if (sMultistepLoadFont_Window->template->textMode == TEXT_MODE_MONOSPACE)
    {
        s32 i;

        for (i = sMultistepLoadFont_Index; i < sMultistepLoadFont_Index + 16; i++)
            MultistepLoadFont_LoadGlyph(sMultistepLoadFont_Window, sMultistepLoadFont_StartOffset, i);

        sMultistepLoadFont_Index += 16;

        if (sMultistepLoadFont_Index < 256)
            retVal = FALSE;
    }

    return retVal;
}

static void MultistepLoadFont_LoadGlyph(struct Window *win, u16 startOffset, u8 glyph)
{
    u8 *buffer;

    switch (win->template->fontNum)
    {
    case 0:
    case 3:
        buffer = win->tileData + 32 * startOffset + 64 * glyph;
        LoadFixedWidthGlyph(win, glyph, buffer);
        break;
    case 1:
    case 2:
        buffer = win->tileData + 32 * (glyph + startOffset);
        ApplyColors_UnshadowedFont(
            &sFont1LatinGlyphs[8 * glyph],
            (u32 *)buffer,
            win->foregroundColor,
            win->backgroundColor);
        break;
    case 4:
    case 5:
        buffer = win->tileData + 32 * (glyph + startOffset);
        ApplyColors_ShadowedFont(
            &gFont4LatinGlyphs[8 * glyph],
            buffer,
            win->foregroundColor,
            win->shadowColor,
            win->backgroundColor);
        break;
    }
}

void EmptyFunc(void)
{
}

void Text_InitWindowWithTemplate(struct Window *win, const struct WindowTemplate *winTemplate)
{
    *win = sDefaultWindow;
    win->template = (struct WindowTemplate *)winTemplate;
    win->textMode = winTemplate->textMode;
    win->spacing = winTemplate->spacing;
    win->fontNum = winTemplate->fontNum;
    win->paletteNum = winTemplate->paletteNum;
    win->tilemapLeft = winTemplate->tilemapLeft;
    win->tilemapTop = winTemplate->tilemapTop;
    win->width = winTemplate->width;
    win->height = winTemplate->height;
    win->tileData = winTemplate->tileData;
    win->tilemap = winTemplate->tilemap;
    SetWindowDefaultColors(win);
    SetWindowBackgroundColor(win, winTemplate->backgroundColor);
    SetWindowShadowColor(win, winTemplate->shadowColor);
    SetWindowForegroundColor(win, winTemplate->foregroundColor);
}

void Text_InitWindow(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top)
{
    const struct WindowTemplate *winTemplate = win->template;
    win->textMode = winTemplate->textMode;
    win->fontNum = winTemplate->fontNum;
    win->language = GAME_LANGUAGE;
    win->paletteNum = winTemplate->paletteNum;
    win->win_field_B = 0;
    win->win_field_C = 0;
    win->delayCounter = 0;
    win->spacing = winTemplate->spacing;
    win->win_field_F = 0;
    win->tilemapLeft = winTemplate->tilemapLeft;
    win->tilemapTop = winTemplate->tilemapTop;
    win->width = winTemplate->width;
    win->height = winTemplate->height;
    win->text = text;
    win->textIndex = 0;
    win->tileDataStartOffset = tileDataStartOffset;
    win->tileDataOffset = 0;
    win->left = 8 * left;
    win->cursorX = 0;
    win->top = 8 * top;
    win->cursorY = 0;
    win->state = WIN_STATE_BEGIN;
    win->downArrowCounter = 0;
    win->tileData = winTemplate->tileData;
    win->tilemap = winTemplate->tilemap;
    SetWindowDefaultColors(win);
    SetWindowBackgroundColor(win, winTemplate->backgroundColor);
    SetWindowShadowColor(win, winTemplate->shadowColor);
    SetWindowForegroundColor(win, winTemplate->foregroundColor);
}

void Text_InitWindow8002E4C(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u16 top, u32 a6)
{
    u8 val;

    Text_InitWindow(win, text, tileDataStartOffset, 0, 0);
    win->left = left;
    win->top = top;
    val = 0;
    if (a6)
        val = 255;
    win->win_field_F = val;
    if (win->win_field_F)
        ClipLeft(win);
}

void Text_SetWindowText(struct Window *win, const u8 *text)
{
    win->state = WIN_STATE_NORMAL;
    win->text = text;
    win->textIndex = 0;
    win->downArrowCounter = 0;
    win->win_field_B = -1;
    win->win_field_C = 0;
    win->delayCounter = 0;
}

void Text_InitWindow8002EB0(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top)
{
    gMain.watchedKeysMask = A_BUTTON | B_BUTTON;
    gMain.watchedKeysPressed = 0;
    sWaitType = WAIT_TYPE_NORMAL;
    sLineLength = 26;
    Text_InitWindow(win, text, tileDataStartOffset, left, top);
    win->win_field_B = -1;
    if (win->textMode == TEXT_MODE_UNKNOWN0)
    {
        u16 val = GetCursorTileNum(win, 0, 0);
        u8 *buffer = win->tileData + 32 * val;
        ApplyColors_UnshadowedFont(sBlankTile, (u32 *)buffer, win->backgroundColor, win->backgroundColor);
        ApplyColors_UnshadowedFont(&sFont1LatinGlyphs[8 * 0x6E], (u32 *)(buffer + 32), win->foregroundColor, win->backgroundColor);
        win->tileDataOffset = 2;
    }
}

u8 Text_PrintWindow8002F44(struct Window *win)
{
    while (win->state != WIN_STATE_END)
    {
        if (win->state == WIN_STATE_NEWLINE)
        {
            AddToCursorY(win, 16);
            win->cursorX = 0;
            if (win->win_field_F)
                ClipLeft(win);
            win->state = WIN_STATE_NORMAL;
        }
        else if (win->state == WIN_STATE_PLACEHOLDER)
        {
            sub_8002FA0(win, GetExpandedPlaceholder(win->text[win->textIndex++]));
        }

        PrintNextChar(win);
    }
    return 1;
}

static u8 sub_8002FA0(struct Window *win, const u8 *text)
{
    u8 retVal;
    u8 savedLanguage = win->language;
    const u8 *savedText = win->text;

    u16 savedTextIndex = win->textIndex;
    win->text = text;
    win->textIndex = 0;
    win->state = WIN_STATE_NORMAL;
    retVal = Text_PrintWindow8002F44(win);
    win->text = savedText;
    win->textIndex = savedTextIndex;
    win->state = WIN_STATE_NORMAL;
    win->language = savedLanguage;
    return retVal;
}

static u8 PrintNextChar(struct Window *win)
{
    u8 c = win->text[win->textIndex++];

    // Handle special control characters
    switch (c)
    {
    case EOS:
        ClipRight(win);
        win->state = WIN_STATE_END;
        return 0;
    case PLACEHOLDER_BEGIN:
        win->state = WIN_STATE_PLACEHOLDER;
        return 2;
    case CHAR_NEWLINE:
        ClipRight(win);
        win->state = WIN_STATE_NEWLINE;
        return 2;
    case CHAR_PROMPT_CLEAR:
        DrawInitialDownArrow(win);
        win->state = WIN_STATE_WAIT_CLEAR;
        return 2;
    case CHAR_PROMPT_SCROLL:
        DrawInitialDownArrow(win);
        win->state = WIN_STATE_WAIT_SCROLL;
        return 2;
    case EXT_CTRL_CODE_BEGIN:
        return HandleExtCtrlCode(win);
    }

    sPrintGlyphFuncs[win->textMode](win, c);
    return 1;
}

// Extended 0xFC control functions

static u8 HandleExtCtrlCode(struct Window *win)
{
    return sExtCtrlCodeFuncs[win->text[win->textIndex++]](win);
}

static u8 ExtCtrlCode_Nop(struct Window *win)
{
    return 2;
}

static u8 ExtCtrlCode_ForegroundColor(struct Window *win)
{
    SetWindowForegroundColor(win, win->text[win->textIndex++]);
    return 2;
}

static u8 ExtCtrlCode_BackgroundColor(struct Window *win)
{
    SetWindowBackgroundColor(win, win->text[win->textIndex++]);
    return 2;
}

static u8 ExtCtrlCode_ShadowColor(struct Window *win)
{
    SetWindowShadowColor(win, win->text[win->textIndex++]);
    return 2;
}

static u8 ExtCtrlCode_AllColors(struct Window *win)
{
    SetWindowForegroundColor(win, win->text[win->textIndex++]);
    SetWindowBackgroundColor(win, win->text[win->textIndex++]);
    SetWindowShadowColor(win, win->text[win->textIndex++]);
    return 2;
}

static u8 ExtCtrlCode_Palette(struct Window *win)
{
    win->paletteNum = win->text[win->textIndex++];
    return 2;
}

static u8 ExtCtrlCode_Font(struct Window *win)
{
    win->fontNum = win->text[win->textIndex++];
    return 2;
}

static u8 ExtCtrlCode_DefaultFont(struct Window *win)
{
    win->fontNum = win->template->fontNum;
    return 2;
}

static u8 ExtCtrlCode_Pause(struct Window *win)
{
    ClipRight(win);
    win->state = WIN_STATE_PAUSE;
    win->delayCounter = win->text[win->textIndex++];
    return 2;
}

static u8 ExtCtrlCode_WaitButton(struct Window *win)
{
    ClipRight(win);
    win->state = WIN_STATE_WAIT_BUTTON;
    return 2;
}

static u8 ExtCtrlCode_WaitSound(struct Window *win)
{
    ClipRight(win);
    win->state = WIN_STATE_WAIT_SOUND;
    return 2;
}

static u8 ExtCtrlCode_PlayBGM(struct Window *win)
{
    u16 loByte = win->text[win->textIndex++];
    u16 hiByte = win->text[win->textIndex++] << 8;
    PlayBGM(loByte | hiByte);
    return 2;
}

static u8 ExtCtrlCode_Escape(struct Window *win)
{
    sPrintGlyphFuncs[win->textMode](win, win->text[win->textIndex++]);
    return 1;
}

u8 ExtCtrlCode_Nop2(struct Window *win)
{
    return 1;
}

static u8 ExtCtrlCode_SetCursorY(struct Window *win)
{
    ClipRight(win);
    AddToCursorY(win, 8 * win->text[win->textIndex++]);
    return 1;
}

static u8 ExtCtrlCode_ClearWindowTextLines(struct Window *win)
{
    Text_ClearWindow(win);
    return 2;
}

static u8 ExtCtrlCode_PlaySE(struct Window *win)
{
    u16 loByte = win->text[win->textIndex++];
    u16 hiByte = win->text[win->textIndex++] << 8;
    PlaySE(loByte | hiByte);
    return 2;
}

static void DrawSpace(struct Window *win)
{
    if (win->textMode == TEXT_MODE_MONOSPACE || (win->left + win->cursorX) & 7 || win->spacing <= 7)
    {
        sPrintGlyphFuncs[win->textMode](win, 0);
    }
    else
    {
        u32 val = sGlyphBuffer.background;
        u16 index = GetCursorTileNum(win, 0, 0);
        u32 *buffer = (u32 *)(win->tileData + 32 * index);
        buffer[0] = val;
        buffer[1] = val;
        buffer[2] = val;
        buffer[3] = val;
        buffer[4] = val;
        buffer[5] = val;
        buffer[6] = val;
        buffer[7] = val;
        index = GetCursorTileNum(win, 0, 1);
        buffer = (u32 *)(win->tileData + 32 * index);
        buffer[0] = val;
        buffer[1] = val;
        buffer[2] = val;
        buffer[3] = val;
        buffer[4] = val;
        buffer[5] = val;
        buffer[6] = val;
        buffer[7] = val;
        UpdateTilemap(win, 1);
        AddToCursorX(win, 8);
    }
}

static void sub_8003344(struct Window *win, u8 newX)
{
    u8 savedSpacing = win->spacing;

    if (newX - win->cursorX <= 8)
        win->spacing = newX - win->cursorX;
    else
        win->spacing = 8 - ((win->left + win->cursorX) & 7);

    while (win->cursorX < newX)
    {
        s32 spacing;
        DrawSpace(win);
        spacing = newX - win->cursorX;
        if (spacing >= 8)
            spacing = 8;
        win->spacing = spacing;
    }

    win->spacing = savedSpacing;
}

static u8 ExtCtrlCode_Skip(struct Window *win)
{
    sub_8003344(win, win->cursorX + win->text[win->textIndex++]);
    return 1;
}

static u8 ExtCtrlCode_SetCursorX(struct Window *win)
{
    ClipRight(win);
    SetCursorX(win, win->text[win->textIndex++]);
    return 1;
}

static u8 ExtCtrlCode_SkipTo(struct Window *win)
{
    sub_8003344(win, win->text[win->textIndex++]);
    return 1;
}

static u8 ExtCtrlCode_Spacing(struct Window *win)
{
    win->spacing = win->text[win->textIndex++];
    return 2;
}

static u8 ExtCtrlCode_Japanese(struct Window *win)
{
    win->language = LANGUAGE_JAPANESE;
    return 2;
}

static u8 ExtCtrlCode_Latin(struct Window *win)
{
    win->language = GAME_LANGUAGE;
    return 2;
}

// Prints the window text without expanding any placeholders
u8 Text_PrintWindowSimple(struct Window *win)
{
    u8 retVal = 1;
    while (win->state != WIN_STATE_END)
    {
        if (win->state == WIN_STATE_NEWLINE)
        {
            AddToCursorY(win, 16);
            win->cursorX = 0;
            if (win->win_field_F)
                ClipLeft(win);
            win->state = WIN_STATE_NORMAL;
        }
        if (PrintNextChar(win) == 1)
        {
            retVal = 0;
            break;
        }
    }
    return retVal;
}

u8 Text_InitWindowAndPrintText(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top)
{
    Text_InitWindow(win, text, tileDataStartOffset, left, top);
    return Text_PrintWindow8002F44(win);
}

u8 sub_8003490(struct Window *win, u8 c, u16 tileDataStartOffset, u8 left, u8 top)
{
    u8 retVal;
    u8 text[2];
    text[0] = c;
    text[1] = EOS;
    Text_InitWindow(win, text, tileDataStartOffset, left, top);
    retVal = PrintNextChar(win);
    ClipRight(win);
    return retVal;
}

void sub_80034D4(u8 *tileData, const u8 *text)
{
    Text_InitWindow8004E3C(&gWindowTemplate_81E6C74, tileData, text);
}

u8 sub_80034EC(u8 *str)
{
    return Text_GetStringWidthFromWindowTemplate((struct WindowTemplate *)&gWindowTemplate_81E6C74, str);
}

u8 *sub_8003504(u8 *dest, s32 value, u8 alignAmount, u8 alignType)
{
    sTempWindow.template = (struct WindowTemplate *)&gWindowTemplate_81E6C74;
    Text_InitWindow(&sTempWindow, 0, 0, 0, 0);
    return AlignInt2(&sTempWindow, dest, value, alignAmount, alignType);
}

u8 *sub_8003558(u8 *dest, const u8 *src, u8 alignAmount, u8 alignType)
{
    sTempWindow.template = (struct WindowTemplate *)&gWindowTemplate_81E6C74;
    Text_InitWindow(&sTempWindow, src, 0, 0, 0);
    return AlignString(&sTempWindow, dest, src, alignAmount, alignType);
}

// Updates the window text
// The text delay can be accelerated by holding the A button
u8 Text_UpdateWindow(struct Window *win)
{
    sWaitType = WAIT_TYPE_NORMAL;
    return UpdateWindowText(win);
}

// Returns TRUE when all of the text has been printed.
static u8 UpdateWindowText(struct Window *win)
{
    switch (win->state)
    {
    case WIN_STATE_WAIT_BUTTON:
        if (PlayerCanInterruptDelay(win))
        {
            if (gMain.newKeys & (A_BUTTON | B_BUTTON))
            {
                PlaySE(SE_SELECT);
            }
            else
            {
                return FALSE;
            }
        }
        else
        {
            win->delayCounter--;
            if (win->delayCounter)
                return FALSE;
        }
        win->state = WIN_STATE_NORMAL;
        return FALSE;
    case WIN_STATE_CHAR_DELAY:
        // Allow the player to speed up text by holding a button
        if (PlayerCanInterruptDelay(win)
         && (gMain.heldKeys & (A_BUTTON | B_BUTTON))
         && gMain.watchedKeysPressed == TRUE)
        {
            win->delayCounter = 0;
            win->state = WIN_STATE_NORMAL;
            break;
        }
        // fall through
    case WIN_STATE_PAUSE:
        // Wait for timer to expire, then continue printing
        if (win->delayCounter)
        {
            win->delayCounter--;
            if (win->delayCounter)
                return FALSE;
        }
        win->state = WIN_STATE_NORMAL;
        break;
    case WIN_STATE_WAIT_CLEAR:
        // Erase the text once a button is pressed
        if (WaitWithDownArrow(win))
        {
            Text_ClearWindow(win);
            win->state = WIN_STATE_NORMAL;
            asm("");
        }
        return FALSE;
    case WIN_STATE_WAIT_SCROLL:
        // Scroll the text once a button is pressed
        if (WaitWithDownArrow(win))
        {
            ScrollWindowTextLines(win);
            win->state = WIN_STATE_NORMAL;
            asm("");
        }
        return FALSE;
    case WIN_STATE_PLACEHOLDER:
        win->textIndex++;
        win->state = WIN_STATE_NORMAL;
        break;
    case WIN_STATE_NEWLINE:
        ScrollWindowTextLines(win);
        win->state = WIN_STATE_NORMAL;
        asm("");
        return FALSE;
    case WIN_STATE_BEGIN:
        Text_ClearWindow(win);
        break;
    case WIN_STATE_WAIT_SOUND:
        if (IsSEPlaying())
            return FALSE;
        win->state = WIN_STATE_NORMAL;
        break;
    case WIN_STATE_END:
        return TRUE;  // done printing text
    case WIN_STATE_NORMAL:
        break;
    default:
        win->state = WIN_STATE_END;
        return TRUE;
    }

    PrintNextChar(win);

    switch (win->state)
    {
    case WIN_STATE_END:
        return TRUE;  // done printing text
    case WIN_STATE_WAIT_BUTTON:
    case WIN_STATE_WAIT_CLEAR:
    case WIN_STATE_WAIT_SCROLL:
        if (PlayerCanInterruptDelay(win))
            return 0;
        win->delayCounter = 60;
        break;
    case WIN_STATE_PAUSE:
    case WIN_STATE_NEWLINE:
    case WIN_STATE_WAIT_SOUND:
        break;
    default:
        win->state = WIN_STATE_CHAR_DELAY;
        win->delayCounter = GetTextDelay(win);
        break;
    }

    return 0;
}

#if defined(ENGLISH)
#define SUB_800374C_LINE_LENGTH 26
#elif defined(GERMAN)
#define SUB_800374C_LINE_LENGTH 27
#endif

u8 Text_UpdateWindowInBattle(struct Window *win)
{
    u8 retVal;

    sWaitType = WAIT_TYPE_BATTLE;
    sLineLength = SUB_800374C_LINE_LENGTH;
    retVal = UpdateWindowText(win);
    sLineLength = 26;
    sWaitType = WAIT_TYPE_NORMAL;
    return retVal;
}

u8 Text_UpdateWindowAutoscroll(struct Window *win)
{
    u8 retVal;

    sWaitType = WAIT_TYPE_AUTOSCROLL;
    sLineLength = 26;
    retVal = UpdateWindowText(win);
    sWaitType = WAIT_TYPE_NORMAL;
    return retVal;
}

u8 Text_UpdateWindowInContest(struct Window *win)
{
    u8 retVal;

    sWaitType = WAIT_TYPE_CONTEST;
    sLineLength = 17;
    retVal = UpdateWindowText(win);
    sLineLength = 26;
    return retVal;
}

u32 Text_UpdateWindowOverrideLineLength(struct Window *win, u8 lineLength)
{
    u8 retVal;

    sWaitType = WAIT_TYPE_NORMAL;
    sLineLength = lineLength;
    retVal = UpdateWindowText(win);
    sLineLength = 26;
    return retVal;
}

static void PrintGlyph_TextMode0(struct Window *win, u32 glyph)
{
    AddToCursorX(win, DrawGlyph_TextMode0(win, glyph));
    if (win->win_field_B)
        ClipRight(win);
}

static u8 DrawGlyph_TextMode0(struct Window *win, u32 glyph)
{
    u8 pixelsWidth = GetGlyphWidth(win, glyph);
    u32 tilesWidth = DrawGlyphTiles(win, glyph, pixelsWidth);
    UpdateTilemap(win, tilesWidth);
    return pixelsWidth;
}

static void PrintGlyph_TextMode1(struct Window *win, u32 glyph)
{
    sWriteGlyphTilemapFuncs[win->fontNum](win, glyph);
    win->cursorX += 8;
}

static void WriteGlyphTilemap_Font0_Font3(struct Window *win, u32 glyph)
{
    s16 val = win->tileDataStartOffset + 2 * glyph;
    WriteGlyphTilemap(win, val, val + 1);
}

static void WriteGlyphTilemap_Font1_Font4(struct Window *win, u32 glyph)
{
    u32 val = glyph * 2;
    WriteGlyphTilemap(
        win,
        win->tileDataStartOffset + sFontType1Map[val],
        win->tileDataStartOffset + sFontType1Map[val + 1]);
}

static void WriteGlyphTilemap_Font2_Font5(struct Window *win, u32 glyph)
{
    WriteGlyphTilemap(
        win,
        win->tileDataStartOffset + 212,
        win->tileDataStartOffset + glyph);
}

static void WriteGlyphTilemap_Font6(struct Window *win, u32 glyph)
{
    u32 val = glyph * 2;
    WriteGlyphTilemap(
        win,
        win->tileDataStartOffset + sFontType3Map[val],
        win->tileDataStartOffset + sFontType3Map[val + 1]);
}

static void PrintGlyph_TextMode2(struct Window *win, u32 glyph)
{
    u8 width = GetGlyphWidth(win, glyph);
    DrawGlyph_TextMode2(win, glyph);
    AddToCursorX(win, width);
    if (win->win_field_B)
        ClipRight(win);
}

static void DrawGlyph_TextMode2(struct Window *win, u32 glyph)
{
    u8 pixelsWidth = GetGlyphWidth(win, glyph);
    u32 tilesWidth = DrawGlyphTiles(win, glyph, pixelsWidth);
    UpdateTilemap(win, tilesWidth);
}

static void LoadFixedWidthGlyph(struct Window *win, u32 glyph, u8 *dest)
{
    u8 *upperTile;
    u8 *lowerTile;

    GetGlyphTilePointers(win->fontNum, win->language, glyph, &upperTile, &lowerTile);

    switch (win->fontNum)
    {
    case 0:
    case 1:
    case 2:
    case 6:
        ApplyColors_UnshadowedFont(upperTile, (u32 *)dest, win->foregroundColor, win->backgroundColor);
        ApplyColors_UnshadowedFont(lowerTile, (u32 *)(dest + 32), win->foregroundColor, win->backgroundColor);
        break;
    case 3:
    case 4:
    case 5:
        ApplyColors_ShadowedFont(upperTile, dest, win->foregroundColor, win->shadowColor, win->backgroundColor);
        ApplyColors_ShadowedFont(lowerTile, dest + 32, win->foregroundColor, win->shadowColor, win->backgroundColor);
        break;
    }
}

static void WriteGlyphTilemap(struct Window *win, u16 upperTileNum, u16 lowerTileNum)
{
    u16 *buffer = GetCursorTilemapPointer(win);
    if (buffer)
    {
        u16 palette = (win->paletteNum << 12);
        buffer[0] = upperTileNum | palette;
        buffer[32] = lowerTileNum | palette;
    }
}

static void GetGlyphTilePointers(u8 fontNum, u8 language, u16 glyph, u8 **upperTilePtr, u8 **lowerTilePtr)
{
    u16 index;
    const struct Font *font;

    if (language == LANGUAGE_JAPANESE)
        language = 0;
    else
        language = 7;

    font = &sFonts[language + fontNum];

    switch (font->type)
    {
    case 0:
        *upperTilePtr = font->glyphs + glyph * font->glyphSize;
        *lowerTilePtr = *upperTilePtr + font->lowerTileOffset;
        break;
    case 1:
        index = 2 * glyph;
        *upperTilePtr = font->glyphs + sFontType1Map[index] * font->glyphSize;
        *lowerTilePtr = font->glyphs + sFontType1Map[index + 1] * font->glyphSize;
        break;
    case 2:
        *upperTilePtr = font->glyphs + 212 * font->glyphSize;
        *lowerTilePtr = font->glyphs + glyph * font->glyphSize;
        break;
    case 3:
        index = 2 * glyph;
        *upperTilePtr = font->glyphs + sFontType3Map[index] * font->glyphSize;
        *lowerTilePtr = font->glyphs + sFontType3Map[index + 1] * font->glyphSize;
        break;
    case 4:
        *upperTilePtr = font->glyphs
            + (glyph & 0xFFF0) * font->glyphSize
            + (((glyph &= 0xF) * font->glyphSize) >> 1);
        *lowerTilePtr = *upperTilePtr + font->lowerTileOffset;
        break;
    }
}

static u16 *GetCursorTilemapPointer(struct Window *win)
{
    u16 *ptr = NULL;
    if (win->tilemap)
    {
        u8 x = ((win->left + win->cursorX) >> 3) + win->tilemapLeft;
        u8 y = ((win->top + win->cursorY) >> 3) + win->tilemapTop;
        ptr = &win->tilemap[(y * 32) + x];
    }
    return ptr;
}

static void ApplyColors_UnshadowedFont(const u8 *src, u32 *dest, u8 foreground, u8 background)
{
    u32 a[2];
    s32 i;
    const u8 *srcRows = src;

    a[0] = background;
    a[1] = foreground;

    for (i = 0; i < 8; i++)
    {
        u32 destRow = a[srcRows[i] & 1]
                    | (a[(srcRows[i] >> 1) & 1] << 4)
                    | (a[(srcRows[i] >> 2) & 1] << 8)
                    | (a[(srcRows[i] >> 3) & 1] << 12)
                    | (a[(srcRows[i] >> 4) & 1] << 16)
                    | (a[(srcRows[i] >> 5) & 1] << 20)
                    | (a[(srcRows[i] >> 6) & 1] << 24)
                    | (a[(srcRows[i] >> 7)    ] << 28);
        dest[i] = destRow;
    }
}

static void ApplyColors_ShadowedFont(const void *src, void *dest, u8 foreground, u8 shadow, u8 background)
{
    u32 a[0x10];
    s32 i;
    const u32 *curSrc;
    u32 *curDest;
    u32 colorMask;

    a[0x1] = 0x1;
    a[0x2] = 0x2;
    a[0x3] = 0x3;
    a[0x4] = 0x4;
    a[0x5] = 0x5;
    a[0x6] = 0x6;
    a[0x7] = 0x7;
    a[0x8] = 0x8;
    a[0x9] = 0x9;
    a[0xA] = 0xA;
    a[0xB] = 0xB;
    a[0xC] = 0xC;
    a[0xD] = 0xD;
    a[0x0] = background;
    a[0xE] = shadow;
    a[0xF] = foreground;

    colorMask = 0xF;

    curSrc = src;
    curDest = dest;

    for (i = 7; i >= 0; i--)
    {
        u32 row = *curSrc++;
        u32 recoloredRow = a[row & colorMask]
                         | (a[(row >> 4) & colorMask] << 4)
                         | (a[(row >> 8) & colorMask] << 8)
                         | (a[(row >> 12) & colorMask] << 12)
                         | (a[(row >> 16) & colorMask] << 16)
                         | (a[(row >> 20) & colorMask] << 20)
                         | (a[(row >> 24) & colorMask] << 24)
                         | (a[(row >> 28)            ] << 28);
        *curDest++ = recoloredRow;
    }
}

static void SetCursorX(struct Window *win, u8 x)
{
    if (win->textMode == TEXT_MODE_UNKNOWN0 && ((win->left + win->cursorX) & 7))
        win->tileDataOffset += 2;
    win->cursorX = x;
}

static void AddToCursorX(struct Window *win, u8 deltaX)
{
    if (win->textMode == TEXT_MODE_UNKNOWN0)
    {
        u8 x = win->cursorX;
        win->cursorX += deltaX;
        if (((win->left + win->cursorX) & 0xF8) != ((win->left + x) & 0xF8))
            win->tileDataOffset += 2;
    }
    else
    {
        win->cursorX += deltaX;
    }
}

static void AddToCursorY(struct Window *win, u8 deltaY)
{
    if (win->textMode == TEXT_MODE_UNKNOWN0 && ((win->left + win->cursorX) & 7))
        win->tileDataOffset += 2;
    win->cursorY += deltaY;
}

static void EraseAtCursor(struct Window *win)
{
    switch (win->textMode)
    {
    case TEXT_MODE_UNKNOWN0:
    case TEXT_MODE_UNKNOWN2:
        DrawGlyphTiles(win, 0, 8);
        break;
    case TEXT_MODE_MONOSPACE:
        sWriteGlyphTilemapFuncs[win->fontNum](win, 0);
        break;
    }
}

static void ClipLeft(struct Window *win)
{
    u32 pixel = win->left & 7;

    if (win->textMode != TEXT_MODE_MONOSPACE && pixel)
    {
        const u32 *masks = sGlyphMasks[8][pixel];
        u32 outsideMask = masks[0];
        u32 insideMask = ~outsideMask;
        u32 outside = sGlyphBuffer.background & outsideMask;
        u16 tileNum = GetCursorTileNum(win, 0, 0);
        u32 *buffer = (u32 *)(win->tileData + 32 * tileNum);
        buffer[0] = (buffer[0] & insideMask) | outside;
        buffer[1] = (buffer[1] & insideMask) | outside;
        buffer[2] = (buffer[2] & insideMask) | outside;
        buffer[3] = (buffer[3] & insideMask) | outside;
        buffer[4] = (buffer[4] & insideMask) | outside;
        buffer[5] = (buffer[5] & insideMask) | outside;
        buffer[6] = (buffer[6] & insideMask) | outside;
        buffer[7] = (buffer[7] & insideMask) | outside;
        tileNum = GetCursorTileNum(win, 0, 1);
        buffer = (u32 *)(win->tileData + 32 * tileNum);
        buffer[0] = (buffer[0] & insideMask) | outside;
        buffer[1] = (buffer[1] & insideMask) | outside;
        buffer[2] = (buffer[2] & insideMask) | outside;
        buffer[3] = (buffer[3] & insideMask) | outside;
        buffer[4] = (buffer[4] & insideMask) | outside;
        buffer[5] = (buffer[5] & insideMask) | outside;
        buffer[6] = (buffer[6] & insideMask) | outside;
        buffer[7] = (buffer[7] & insideMask) | outside;
    }
}

static void ClipRight(struct Window *win)
{
    register u8 cursorX asm("r0") = win->cursorX;
    u8 left = win->left;
    u32 pixelX = (cursorX + left) & 7;

    if (win->textMode != TEXT_MODE_MONOSPACE && pixelX != 0)
    {
        const u32 *masks = sGlyphMasks[8 - pixelX][pixelX];
        u32 insideMask = masks[0];
        u32 outside = (sGlyphBuffer.background & ~insideMask);
        u16 tileNum; 
        u32 *tileData;

        tileNum = GetCursorTileNum(win, 0, 0);
        tileData = (u32 *)(win->tileData + 32 * tileNum);

        tileData[0] = (tileData[0] & insideMask) | outside;
        tileData[1] = (tileData[1] & insideMask) | outside;
        tileData[2] = (tileData[2] & insideMask) | outside;
        tileData[3] = (tileData[3] & insideMask) | outside;
        tileData[4] = (tileData[4] & insideMask) | outside;
        tileData[5] = (tileData[5] & insideMask) | outside;
        tileData[6] = (tileData[6] & insideMask) | outside;
        tileData[7] = (tileData[7] & insideMask) | outside;

        tileNum = GetCursorTileNum(win, 0, 1);
        tileData = (u32 *)(win->tileData + 32 * tileNum);

        tileData[0] = (tileData[0] & insideMask) | outside;
        tileData[1] = (tileData[1] & insideMask) | outside;
        tileData[2] = (tileData[2] & insideMask) | outside;
        tileData[3] = (tileData[3] & insideMask) | outside;
        tileData[4] = (tileData[4] & insideMask) | outside;
        tileData[5] = (tileData[5] & insideMask) | outside;
        tileData[6] = (tileData[6] & insideMask) | outside;
        tileData[7] = (tileData[7] & insideMask) | outside;

        UpdateTilemap(win, 1);
    }
}

static void SetWindowDefaultColors(struct Window *win)
{
    u32 i;

    win->backgroundColor = 0;
    win->shadowColor = 14;
    win->foregroundColor = 15;

    for (i = 0; i < 16; i++)
        sGlyphBuffer.colors[i] = i;
}

static void SetWindowBackgroundColor(struct Window *win, u8 color)
{
    u32 val1;
    u32 val2;
    u32 val3;
    win->backgroundColor = color;
    sGlyphBuffer.colors[0] = color;
    val1 = color | (color << 4);
    val2 = val1 | (val1 << 8);
    val3 = val2 | (val2 << 16);
    sGlyphBuffer.background = val3;
}

static void SetWindowShadowColor(struct Window *win, u8 color)
{
    win->shadowColor = color;
    sGlyphBuffer.colors[14] = color;
}

static void SetWindowForegroundColor(struct Window *win, u8 color)
{
    win->foregroundColor = color;
    sGlyphBuffer.colors[15] = color;
}

static u8 GetTextDelay(struct Window *win)
{
    if (!PlayerCanInterruptDelay(win))
        return 3;

    return sTextSpeedDelays[gSaveBlock2.optionsTextSpeed];
}

static bool8 PlayerCanInterruptDelay(struct Window *win)
{
    bool8 retVal = TRUE;

    switch (sWaitType)
    {
    case WAIT_TYPE_AUTOSCROLL:
        retVal = FALSE;
        break;
    case WAIT_TYPE_CONTEST:
        retVal = gIsLinkContest ? FALSE : TRUE;
        break;
    case WAIT_TYPE_BATTLE:
        retVal = (gBattleTypeFlags & BATTLE_TYPE_LINK) ? FALSE : TRUE;
        break;
    }

    return retVal;
}

static void ScrollWindowTextLines(struct Window *win)
{
    switch (win->textMode)
    {
    case TEXT_MODE_UNKNOWN0:
        ScrollWindowTextLines_TextMode0(win);
        break;
    case TEXT_MODE_MONOSPACE:
        ScrollWindowTextLines_TextModeMonospace(win);
        break;
    case TEXT_MODE_UNKNOWN2:
        ScrollWindowTextLines_TextMode2(win);
        break;
    }
}

static void ScrollWindowTextLines_TextMode0(struct Window *win)
{
    if (win->cursorY == 0)
    {
        // Advance to the next line
        win->tileDataOffset = 2 * sLineLength + 2;
        win->cursorX = 0;
        win->cursorY += 16;
    }
    else
    {
        if (win->win_field_C & 2)
            win->tileDataOffset = 2 * sLineLength + 2;
        else
            win->tileDataOffset = 2;
        win->win_field_C ^= 2;
        win->cursorX = 0;
        DoScroll_TextMode0(win, sLineLength);
    }
}

static void DoScroll_TextMode0(struct Window *win, u16 lineLength)
{
    u16 *buffer = win->tilemap;
    u32 val1 = 32 * (win->top >> 3);
    u32 val2 = (win->left >> 3);
    u16 fill;
    buffer += val1 + val2;
    fill = (win->paletteNum << 12) | GetBlankTileNum(win);
    
    // Move the bottom line up
    CpuCopy16(buffer + 64, buffer, lineLength * 2);
    CpuCopy16(buffer + 96, buffer + 32, lineLength * 2);
    
    // Clear the bottom line
    CpuFill16(fill, buffer + 64, lineLength * 2);
    CpuFill16(fill, buffer + 96, lineLength * 2);
}

static void ScrollWindowTextLines_TextModeMonospace(struct Window *win)
{
    if (win->cursorY == 0)
    {
        // Advance to the next line
        win->cursorX = 0;
        win->cursorY += 16;
    }
    else
    {
        win->win_field_C ^= 2;
        win->cursorX = 0;
        DoScroll_TextModeMonospace(win, sLineLength);
    }
}

static void DoScroll_TextModeMonospace(struct Window *win, u16 lineLength)
{
    u16 *buffer = GetCursorTilemapPointer(win);
    u16 *dest = buffer - 32;
    u16 fill = (win->paletteNum << 12) | GetBlankTileNum(win);
    
    // Move the bottom line up
    CpuCopy16(buffer + 32, dest, lineLength * 2);
    CpuCopy16(buffer + 64, buffer, lineLength * 2);
    
    // Clear the bottom line
    CpuFill16(fill, buffer + 32, lineLength * 2);
    CpuFill16(fill, buffer + 64, lineLength * 2);
}

static void ScrollWindowTextLines_TextMode2(struct Window *win)
{
    if (win->cursorY == 0)
    {
        // Advance to the next line
        win->cursorX = 0;
        win->cursorY += 16;
    }
    else
    {
        win->win_field_C ^= 2;
        win->cursorX = 0;
        DoScroll_TextMode2(win, sLineLength);
    }
}

static void DoScroll_TextMode2(struct Window *win, u8 lineLength)
{
    u8 i;
    u8 *buf1 = win->tileData + 32 * GetCursorTileNum(win, 0, -2);
    u8 *buf2 = win->tileData + 32 * GetCursorTileNum(win, 0, 0);
    u8 *buf4;
    u16 *buf3;
    u16 a[4];

    CpuFastCopy(buf2, buf1, 32 * lineLength);
    CpuFastFill(sGlyphBuffer.background, buf2, 32 * lineLength);
    buf4 = buf2 + 32 * win->width;
    CpuFastCopy(buf4, buf1 + 32 * win->width, 32 * lineLength);
    CpuFastFill(sGlyphBuffer.background, buf4, 32 * lineLength);

    buf3 = GetCursorTilemapPointer(win) - 64;

    a[0] = (win->tileDataStartOffset + win->tileDataOffset
          + ((win->top >> 3) * win->width)
          + (win->left >> 3))
         | (win->paletteNum << 12);
    a[1] = a[0] + win->width;
    a[2] = a[1] + win->width;
    a[3] = a[2] + win->width;

    for (i = 0; i < lineLength; i++)
    {
        buf3[0] = a[0]++;
        buf3[32] = a[1]++;
        buf3[64] = a[2]++;
        buf3[96] = a[3]++;
        buf3++;
    }
}

void Text_ClearWindow(struct Window *win)
{
    switch (win->textMode)
    {
    case TEXT_MODE_UNKNOWN0:
        ClearWindowTextLines_TextMode0_TextMode1(win, sLineLength);
        win->tileDataOffset = 2;
        break;
    case TEXT_MODE_MONOSPACE:
        ClearWindowTextLines_TextMode0_TextMode1(win, sLineLength);
        break;
    case TEXT_MODE_UNKNOWN2:
        ClearWindowTextLines_TextMode2(win, sLineLength);
        break;
    }
}

static void ClearWindowTextLines_TextMode0_TextMode1(struct Window *win, u8 lineLength)
{
    u8 x, y;
    u16 *buffer;
    u16 fill;

    win->cursorX = 0;
    win->cursorY = 0;
    win->win_field_C = 0;

    buffer = GetCursorTilemapPointer(win);
    fill = GetBlankTileNum(win) | (win->paletteNum << 12);

    for (y = 0; y < 4; y++)
    {
        for (x = 0; x < lineLength; x++)
            buffer[x] = fill;
        buffer += 32;
    }
}

static void ClearWindowTextLines_TextMode2(struct Window *win, u8 lineLength)
{
    u8 *buffer;

    win->cursorX = 0;
    win->cursorY = 0;
    win->win_field_C = 0;

    buffer = win->tileData + 32 * GetCursorTileNum(win, 0, 0);
    CpuFastFill(sGlyphBuffer.background, buffer, 32 * lineLength);
    buffer += 32 * win->width;
    CpuFastFill(sGlyphBuffer.background, buffer, 32 * lineLength);
    buffer += 32 * win->width;
    CpuFastFill(sGlyphBuffer.background, buffer, 32 * lineLength);
    buffer += 32 * win->width;
    CpuFastFill(sGlyphBuffer.background, buffer, 32 * lineLength);
}

static void DrawDownArrow(struct Window *win)
{
    if (PlayerCanInterruptDelay(win))
    {
        const u32 *downArrowTiles = &sDownArrowTiles[((win->downArrowCounter & 0x0F00) >> 8) * 16];

        switch (win->textMode)
        {
        case TEXT_MODE_MONOSPACE:
        {
            u8 *buffer;
            u16 tileNum = win->tileDataStartOffset + 254;
            if (win->fontNum == 0 || win->fontNum == 3)
                tileNum *= 2;
            buffer = win->tileData + 32 * tileNum;
            ApplyColors_ShadowedFont(downArrowTiles, buffer, win->foregroundColor, win->shadowColor, win->backgroundColor);
            ApplyColors_ShadowedFont(downArrowTiles + 8, buffer + 32, win->foregroundColor, win->shadowColor, win->backgroundColor);
            WriteGlyphTilemap(win, tileNum, tileNum + 1);
            break;
        }
        case TEXT_MODE_UNKNOWN0:
        case TEXT_MODE_UNKNOWN2:
        {
            struct GlyphTileInfo glyphTileInfo;
            glyphTileInfo.textMode = win->textMode;
            glyphTileInfo.startPixel = (win->left + win->cursorX) & 7;
            if (glyphTileInfo.startPixel != 0)
            {
                u8 *upperTile;
                u8 *lowerTile;
                GetGlyphTilePointers(win->fontNum, win->language, 0, &upperTile, &lowerTile);
                glyphTileInfo.width = 8 - glyphTileInfo.startPixel;
                glyphTileInfo.src = upperTile;
                glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 1, 0));
                glyphTileInfo.colors = sGlyphBuffer.colors;
                DrawGlyphTile_ShadowedFont(&glyphTileInfo);
                glyphTileInfo.src = lowerTile;
                glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 1, 1));
                DrawGlyphTile_ShadowedFont(&glyphTileInfo);
            }
            glyphTileInfo.width = 8;
            glyphTileInfo.src = (u8 *)downArrowTiles;
            glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 0));
            glyphTileInfo.colors = sGlyphBuffer.colors;
            DrawGlyphTile_ShadowedFont(&glyphTileInfo);
            glyphTileInfo.src += 32;
            glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 1));
            DrawGlyphTile_ShadowedFont(&glyphTileInfo);
            if (glyphTileInfo.startPixel != 0)
                UpdateTilemap(win, 2);
            else
                UpdateTilemap(win, 1);
            break;
        }
        }
    }
}

static u8 WaitWithDownArrow(struct Window *win)
{
    u8 retVal = TRUE;

    if (!PlayerCanInterruptDelay(win))
    {
        win->delayCounter--;
        if (!win->delayCounter)
        {
            TryEraseDownArrow(win);
        }
        else
        {
            UpdateDownArrowAnimation(win);
            retVal = FALSE;
        }
    }
    else
    {
        if (gMain.newKeys & (A_BUTTON | B_BUTTON))
        {
            PlaySE(SE_SELECT);
            TryEraseDownArrow(win);
        }
        else
        {
            UpdateDownArrowAnimation(win);
            retVal = FALSE;
        }
    }

    return retVal;
}

static void DrawInitialDownArrow(struct Window *win)
{
    win->downArrowCounter = 0;
    DrawDownArrow(win);
}

static void UpdateDownArrowAnimation(struct Window *win)
{
    u16 downArrowPos = (win->downArrowCounter & 0x0F00) >> 8;
    u16 wait = win->downArrowCounter & 0x000F;
    u16 newVal;

    wait++;

    if (wait == 6)
    {
        wait = 0;
        downArrowPos++;
        if (downArrowPos > 3)
            downArrowPos = 0;
        win->downArrowCounter = downArrowPos << 8;
        DrawDownArrow(win);
    }

    newVal = downArrowPos << 8;
    newVal |= wait;

    win->downArrowCounter = newVal;
}

static void TryEraseDownArrow(struct Window *win)
{
    win->downArrowCounter = 0;
    if (PlayerCanInterruptDelay(win) == TRUE)
        EraseAtCursor(win);
}

// unused
u16 Text_GetWindowTilemapEntry(struct Window *win, u8 x, u8 y)
{
    u16 *tilemap = win->tilemap;
    return tilemap[32 * y + x];
}

// unused
void Text_FillWindowBorder(struct Window *win, u16 tilemapEntry, u8 left, u8 top, u8 right, u8 bottom)
{
    u8 i;
    u16 *buffer = &win->tilemap[top * 32];

    // Fill top border
    for (i = left; i <= right; i++)
        buffer[i] = tilemapEntry;

    for (i = top + 1; i < bottom - 1; i++)
    {
        buffer += 32;
        // left border
        buffer[left] = tilemapEntry;
        // right border
        buffer[right] = tilemapEntry;
    }

    // Fill bottom border
    if (top != bottom)
    {
        buffer += 32;
        for (i = left; i <= right; i++)
            buffer[i] = tilemapEntry;
    }
}

// unused
void DrawWindowRect_DefaultPalette(struct Window *win, u16 tileNum, u8 left, u8 top, u8 right, u8 bottom)
{
    Text_FillWindowBorder(win, (win->paletteNum << 12) | tileNum, left, top, right, bottom);
}

// Fills the whole window area with tilemapEntry
void Text_FillWindowRect(struct Window *win, u16 tilemapEntry, u8 left, u8 top, u8 right, u8 bottom)
{
    u16 *buffer = &win->tilemap[top * 32];
    while (top++ <= bottom)
    {
        u8 x;
        for (x = left; x <= right; x++)
            buffer[x] = tilemapEntry;
        buffer += 32;
    }
}

void Text_FillWindowRectDefPalette(struct Window *win, u16 tileNum, u8 left, u8 top, u8 right, u8 bottom)
{
    Text_FillWindowRect(win, (win->paletteNum << 12) | tileNum, left, top, right, bottom);
}

void Text_EraseWindowRect(struct Window *win, u8 left, u8 top, u8 right, u8 bottom)
{
    Text_FillWindowRectDefPalette(win, 0, left, top, right, bottom);
}

void Text_BlankWindowRect(struct Window *win, u8 left, u8 top, u8 right, u8 bottom)
{
    u16 tileNum = GetBlankTileNum(win);
    Text_FillWindowRectDefPalette(win, tileNum, left, top, right, bottom);
}

static u16 GetBlankTileNum(struct Window *win)
{
    u16 retVal = win->tileDataStartOffset;

    switch (win->textMode)
    {
    case TEXT_MODE_UNKNOWN0:
        break;
    case TEXT_MODE_UNKNOWN2:
        retVal++;
        break;
    case TEXT_MODE_MONOSPACE:
        switch (win->fontNum)
        {
        case 1:
        case 2:
        case 4:
        case 5:
            retVal += 212;
        case 0:
        case 3:
        case 6:
            break;
        default:
            retVal = 0;
        }
        break;
    }

    return retVal;
}

static s32 Window_MoveCursor(struct Window *win, u8 x, u8 y)
{
    win->cursorX = x;
    win->cursorY = y & 0xF8;
}

static u8 GetGlyphWidth(struct Window *win, u32 glyph)
{
    u8 width = 8;

#ifdef BUGFIX_GLYPHWIDTH
    if (win->language != LANGUAGE_JAPANESE)
#else
    if (win->language == LANGUAGE_ENGLISH)
#endif
    {
        width = win->spacing;
        if (!win->spacing)
        {
            switch (win->fontNum)
            {
            case 3:
                width = sFont3Widths[glyph];
                break;
            case 4:
            case 5:
                width = sFont4Widths[sFontType1Map[2 * glyph + 1]];
                break;
            case 0:
                width = sFont0Widths[glyph];
                break;
            case 1:
            case 2:
                width = sFont1Widths[sFontType1Map[2 * glyph + 1]];
                break;
            case 6:
                width = 8;
                break;
            default:
                width = 8;
            }
        }
    }

    return width;
}

u8 GetExtCtrlCodeLength(u8 code)
{
    u8 length = 0;
    if (code <= 0x16)
        length = sExtCtrlCodeLengths[code];
    return length;
}

u8 *AlignInt1(struct Window *win, u8 *dest, s32 value, u8 alignAmount, u8 alignType)
{
    u8 temp[16];
    u8 width;
    switch (alignType)
    {
    case 0:
        ConvertIntToDecimalString(temp, value);
        dest = StringCopy(dest, temp);
        dest[0] = EXT_CTRL_CODE_BEGIN;
        dest[1] = 19;
        dest[2] = alignAmount;
        dest += 3;
        *dest = 0xFF;
        break;
    case 1:
        ConvertIntToDecimalString(temp, value);
        width = GetStringWidth(win, temp);
        if (alignAmount > width)
        {
            dest[0] = EXT_CTRL_CODE_BEGIN;
            dest[1] = 19;
            dest[2] = alignAmount - width;
            dest += 3;
        }
        dest = StringCopy(dest, temp);
        break;
    case 2:
        ConvertIntToDecimalString(temp, value);
        width = GetStringWidth(win, temp);
        if (alignAmount > width)
        {
            dest[0] = EXT_CTRL_CODE_BEGIN;
            dest[1] = 19;
            dest[2] = (alignAmount - width) / 2;
            dest += 3;
        }
        dest = StringCopy(dest, temp);
        if (alignAmount > width)
        {
            dest[0] = EXT_CTRL_CODE_BEGIN;
            dest[1] = 19;
            dest[2] = alignAmount;
            dest += 3;
            *dest = 0xFF;
        }
        break;
    }
    return dest;
}

u8 *AlignInt2(struct Window *win, u8 *dest, s32 value, u8 alignAmount, u8 alignType)
{
    u8 temp[16];
    u8 width;
    switch (alignType)
    {
    case 0:
        ConvertIntToDecimalString(temp, value);
        width = GetStringWidth(win, temp);
        dest = StringCopy(dest, temp);
        dest[0] = EXT_CTRL_CODE_BEGIN;
        dest[1] = 17;
        dest[2] = alignAmount - width;
        dest += 3;
        *dest = 0xFF;
        break;
    case 1:
        ConvertIntToDecimalString(temp, value);
        width = GetStringWidth(win, temp);
        if (alignAmount > width)
        {
            dest[0] = EXT_CTRL_CODE_BEGIN;
            dest[1] = 17;
            dest[2] = alignAmount - width;
            dest += 3;
        }
        dest = StringCopy(dest, temp);
        break;
    case 2:
        ConvertIntToDecimalString(temp, value);
        width = GetStringWidth(win, temp);
        if (alignAmount > width)
        {
            dest[0] = EXT_CTRL_CODE_BEGIN;
            dest[1] = 17;
            dest[2] = (alignAmount - width) / 2;
            dest += 3;
        }
        dest = StringCopy(dest, temp);
        if (alignAmount > width)
        {
            dest[0] = EXT_CTRL_CODE_BEGIN;
            dest[1] = 17;
            dest[2] = (alignAmount - width) / 2;
            dest += 3;
            *dest = 0xFF;
        }
        break;
    }
    return dest;
}

u8 *AlignString(struct Window *win, u8 *dest, const u8 *src, u8 alignAmount, u8 alignType)
{
    u8 width;
    switch (alignType)
    {
    case 0:
        dest = StringCopy(dest, src);
        dest[0] = EXT_CTRL_CODE_BEGIN;
        dest[1] = 19;
        dest[2] = alignAmount;
        dest += 3;
        *dest = 0xFF;
        break;
    case 1:
        width = GetStringWidth(win, src);
        if (alignAmount > width)
        {
            dest[0] = EXT_CTRL_CODE_BEGIN;
            dest[1] = 19;
            dest[2] = alignAmount - width;
            dest += 3;
        }
        dest = StringCopy(dest, src);
        break;
    case 2:
        width = GetStringWidth(win, src);
        if (alignAmount > width)
        {
            dest[0] = EXT_CTRL_CODE_BEGIN;
            dest[1] = 19;
            dest[2] = (alignAmount - width) / 2;
            dest += 3;
        }
        dest = StringCopy(dest, src);
        if (alignAmount > width)
        {
            dest[0] = EXT_CTRL_CODE_BEGIN;
            dest[1] = 19;
            dest[2] = alignAmount;
            dest += 3;
            *dest = 0xFF;
        }
        break;
    }
    return dest;
}

u8 GetStringWidth(struct Window *win, const u8 *s)
{
    u8 width = 0;
    u8 savedFontNum = win->fontNum;
    u8 savedLanguage = win->language;
    u8 savedSpacing = win->spacing;
    s32 i = 0;

    while (s[i] != EOS)
    {
        u8 c = s[i];
        switch (c)
        {
        case PLACEHOLDER_BEGIN:
        {
            u8 temp;
            i++;
            temp = win->language;
            width += GetStringWidth(win, GetExpandedPlaceholder(s[i]));
            win->language = temp;
            i++;
            break;
        }
        case EXT_CTRL_CODE_BEGIN:
            i++;
            switch (s[i])
            {
            case 6:
                win->fontNum = s[i + 1];
                break;
            case 7:
                win->fontNum = win->template->fontNum;
                break;
            case 0x11:
                width += s[i + 1];
                break;
            case 0x12:
            case 0x13:
                if (width < s[i + 1])
                    width = s[i + 1];
                break;
            case 0x14:
                win->spacing = s[i + 1];
                break;
            case 0x15:
                win->language = LANGUAGE_JAPANESE;
                break;
            case 0x16:
                win->language = GAME_LANGUAGE;
                break;
            }

            i += GetExtCtrlCodeLength(s[i]);
            break;
        default:
            i++;
            width += GetGlyphWidth(win, c);
        }
    }

    win->spacing = savedSpacing;
    win->language = savedLanguage;
    win->fontNum = savedFontNum;

    return width;
}

u8 Text_InitWindow8004D04(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u16 top, u32 a6)
{
    Text_InitWindow8002E4C(win, text, tileDataStartOffset, left, top, a6);
    return Text_PrintWindow8002F44(win);
}

u8 Text_InitWindow_RightAligned(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 right, u8 top)
{
    u8 width = GetStringWidth(win, text);
    Text_InitWindow(win, text, tileDataStartOffset, right - ((u32)(width + 7) >> 3), top);
    EraseAtCursor(win);
    width &= 7;
    if (width)
        width = 8 - width;
    Window_MoveCursor(win, width, 0);
    return Text_PrintWindow8002F44(win);
}

u8 Text_InitWindow_Centered(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top, u16 width)
{
    width = (u8)(width / 2 - GetStringWidth(win, text) / 2);
    left += (u8)width / 8;
    Text_InitWindow(win, text, tileDataStartOffset, left, top);
    EraseAtCursor(win);
    width &= 7;
    Window_MoveCursor(win, width, 0);
    return Text_PrintWindow8002F44(win);
}

u8 Text_GetWindowPaletteNum(struct Window *win)
{
    return win->paletteNum;
}

void Text_GetTextColors(struct Window *win, u8 *foreground, u8 *background, u8 *shadow)
{
    *foreground = win->foregroundColor;
    *background = win->backgroundColor;
    *shadow = win->shadowColor;
}

void Text_InitWindow8004E3C(const struct WindowTemplate *winTemplate, u8 *tileData, const u8 *text)
{
    sTempWindow.template = winTemplate;
    Text_InitWindow(&sTempWindow, text, 0, 0, 0);
    sTempWindow.tileData = tileData;
    Text_PrintWindow8002F44(&sTempWindow);
}

u8 Text_GetStringWidthFromWindowTemplate(const struct WindowTemplate *winTemplate, const u8 *s)
{
    sTempWindow.template = winTemplate;
    Text_InitWindow(&sTempWindow, s, 0, 0, 0);
    return GetStringWidth(&sTempWindow, s);
}

void ConvertInternationalString(u8 *s, u8 language)
{
    if (language == LANGUAGE_JAPANESE)
    {
        u8 i;

        Text_StripExtCtrlCodes(s);
        i = StringLength(s);
        s[i++] = EXT_CTRL_CODE_BEGIN;
        s[i++] = 22;
        s[i++] = EOS;

        i--;

        while (i != (u8)-1)
        {
            s[i + 2] = s[i];
            i--;
        }

        s[0] = EXT_CTRL_CODE_BEGIN;
        s[1] = 21;
    }
}

void Text_StripExtCtrlCodes(u8 *str)
{
    u16 srcIndex = 0;
    u16 destIndex = 0;
    while (str[srcIndex] != EOS)
    {
        if (str[srcIndex] == EXT_CTRL_CODE_BEGIN)
        {
            srcIndex++;
            srcIndex += GetExtCtrlCodeLength(str[srcIndex]);
        }
        else
        {
            str[destIndex++] = str[srcIndex++];
        }
    }
    str[destIndex] = EOS;
}

static const u8 *SkipExtCtrlCode(const u8 *s)
{
    while (*s == EXT_CTRL_CODE_BEGIN)
    {
        s++;
        s += GetExtCtrlCodeLength(*s);
    }

    return s;
}

s32 StringCompareWithoutExtCtrlCodes(const u8 *str1, const u8 *str2)
{
    s32 retVal = 0;

    while (1)
    {
        str1 = SkipExtCtrlCode(str1);
        str2 = SkipExtCtrlCode(str2);

        if (*str1 > *str2)
            break;

        if (*str1 < *str2)
        {
            retVal = -1;
            if (*str2 == 0xFF)
                retVal = 1;
        }

        if (*str1 == 0xFF)
            return retVal;

        str1++;
        str2++;
    }

    retVal = 1;

    if (*str1 == 0xFF)
        retVal = -1;

    return retVal;
}

u8 sub_8004FD0(struct Window *win, u8 *dest, const u8 *src, u16 tileDataStartOffset, u8 left, u16 top, u8 width, u32 a8)
{
    u8 newlineCount = 0;
    u8 extCtrlCodeLength;
    u8 *start;
    u32 endsWithoutNewline;

    if (dest == NULL)
        dest = gStringVar4;

    start = dest;
    endsWithoutNewline = FALSE;

    while (*src != 0xFF)
    {
        switch (*src)
        {
        default:
            *dest = *src;
            dest++;
            src++;
            endsWithoutNewline = TRUE;
            break;
        case 0xFC:
            extCtrlCodeLength = GetExtCtrlCodeLength(src[1]) + 1;
            memcpy(dest, src, extCtrlCodeLength);
            dest += extCtrlCodeLength;
            src += extCtrlCodeLength;
            break;
        case 0xFE:
            dest[0] = 0xFC;
            dest[1] = 19;
            dest[2] = width;
            dest[3] = 0xFE;
            dest += 4;
            src++;
            newlineCount++;
            endsWithoutNewline = FALSE;
            break;
        }
    }

    dest[0] = 0xFC;
    dest[1] = 19;
    dest[2] = width;
    dest[3] = 0xFF;

    if (endsWithoutNewline)
        newlineCount++;

    Text_InitWindow8002E4C(win, start, tileDataStartOffset, left, top, a8);
    Text_PrintWindow8002F44(win);

    return newlineCount;
}

static s32 DrawGlyphTile_UnshadowedFont(struct GlyphTileInfo *glyphTileInfo)
{
    struct GlyphBuffer *glyphBuffer = &sGlyphBuffer;
    u32 colors[2];
    u32 *buffer = glyphTileInfo->dest;
    const u32 *masks = sGlyphMasks[glyphTileInfo->width][glyphTileInfo->startPixel];
    u32 mask1 = masks[0] | masks[2];

    glyphBuffer->pixelRows[0] = buffer[0] & mask1;
    glyphBuffer->pixelRows[1] = buffer[1] & mask1;
    glyphBuffer->pixelRows[2] = buffer[2] & mask1;
    glyphBuffer->pixelRows[3] = buffer[3] & mask1;
    glyphBuffer->pixelRows[4] = buffer[4] & mask1;
    glyphBuffer->pixelRows[5] = buffer[5] & mask1;
    glyphBuffer->pixelRows[6] = buffer[6] & mask1;
    glyphBuffer->pixelRows[7] = buffer[7] & mask1;

    if (glyphTileInfo->startPixel + glyphTileInfo->width > 8)
    {
        u32 mask2 = masks[1];
        if (glyphTileInfo->textMode == TEXT_MODE_UNKNOWN2)
        {
            glyphBuffer->pixelRows[8] = buffer[8] & mask2;
            glyphBuffer->pixelRows[9] = buffer[9] & mask2;
            glyphBuffer->pixelRows[10] = buffer[10] & mask2;
            glyphBuffer->pixelRows[11] = buffer[11] & mask2;
            glyphBuffer->pixelRows[12] = buffer[12] & mask2;
            glyphBuffer->pixelRows[13] = buffer[13] & mask2;
            glyphBuffer->pixelRows[14] = buffer[14] & mask2;
            glyphBuffer->pixelRows[15] = buffer[15] & mask2;
        }
        else
        {
            glyphBuffer->pixelRows[8] = buffer[16] & mask2;
            glyphBuffer->pixelRows[9] = buffer[17] & mask2;
            glyphBuffer->pixelRows[10] = buffer[18] & mask2;
            glyphBuffer->pixelRows[11] = buffer[19] & mask2;
            glyphBuffer->pixelRows[12] = buffer[20] & mask2;
            glyphBuffer->pixelRows[13] = buffer[21] & mask2;
            glyphBuffer->pixelRows[14] = buffer[22] & mask2;
            glyphBuffer->pixelRows[15] = buffer[23] & mask2;
        }
    }

    colors[0] = glyphTileInfo->colors[0];
    colors[1] = glyphTileInfo->colors[15];

    sShiftGlyphTileUnshadowedFuncs[glyphTileInfo->width](glyphBuffer, glyphTileInfo->src, colors, glyphTileInfo->startPixel);

    buffer[0] = glyphBuffer->pixelRows[0];
    buffer[1] = glyphBuffer->pixelRows[1];
    buffer[2] = glyphBuffer->pixelRows[2];
    buffer[3] = glyphBuffer->pixelRows[3];
    buffer[4] = glyphBuffer->pixelRows[4];
    buffer[5] = glyphBuffer->pixelRows[5];
    buffer[6] = glyphBuffer->pixelRows[6];
    buffer[7] = glyphBuffer->pixelRows[7];

    if (glyphTileInfo->startPixel + glyphTileInfo->width > 8)
    {
        if (glyphTileInfo->textMode != TEXT_MODE_UNKNOWN2)
            buffer += 8;
        buffer[8] = glyphBuffer->pixelRows[8];
        buffer[9] = glyphBuffer->pixelRows[9];
        buffer[10] = glyphBuffer->pixelRows[10];
        buffer[11] = glyphBuffer->pixelRows[11];
        buffer[12] = glyphBuffer->pixelRows[12];
        buffer[13] = glyphBuffer->pixelRows[13];
        buffer[14] = glyphBuffer->pixelRows[14];
        buffer[15] = glyphBuffer->pixelRows[15];
    }

    return (glyphTileInfo->startPixel + glyphTileInfo->width) / 8;
}

static void ShiftGlyphTile_UnshadowedFont_Width0(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *a3, u8 startPixel)
{
}

static void ShiftGlyphTile_UnshadowedFont_Width1(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = colors[src[i] >> 7];
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_UnshadowedFont_Width2(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >> 7) & 1] << 0)
                | (colors[(src[i] >> 6) & 1] << 4);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_UnshadowedFont_Width3(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        // XXX: why 4?
        u32 val = (colors[(src[i] >> 7) & 1] <<  0)
                | (colors[(src[i] >> 6) & 1] <<  4)
                | (colors[(src[i] >> 5) & 1] <<  8)
                | (colors[(src[i] >> 4) & 1] << 12);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_UnshadowedFont_Width4(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >> 7) & 1] <<  0)
                | (colors[(src[i] >> 6) & 1] <<  4)
                | (colors[(src[i] >> 5) & 1] <<  8)
                | (colors[(src[i] >> 4) & 1] << 12);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_UnshadowedFont_Width5(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >> 7) & 1] <<  0)
                | (colors[(src[i] >> 6) & 1] <<  4)
                | (colors[(src[i] >> 5) & 1] <<  8)
                | (colors[(src[i] >> 4) & 1] << 12)
                | (colors[(src[i] >> 3) & 1] << 16);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_UnshadowedFont_Width6(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >> 7) & 1] <<  0)
                | (colors[(src[i] >> 6) & 1] <<  4)
                | (colors[(src[i] >> 5) & 1] <<  8)
                | (colors[(src[i] >> 4) & 1] << 12)
                | (colors[(src[i] >> 3) & 1] << 16)
                | (colors[(src[i] >> 2) & 1] << 20);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_UnshadowedFont_Width7(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >> 7) & 1] <<  0)
                | (colors[(src[i] >> 6) & 1] <<  4)
                | (colors[(src[i] >> 5) & 1] <<  8)
                | (colors[(src[i] >> 4) & 1] << 12)
                | (colors[(src[i] >> 3) & 1] << 16)
                | (colors[(src[i] >> 2) & 1] << 20)
                | (colors[(src[i] >> 1) & 1] << 24);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_UnshadowedFont_Width8(struct GlyphBuffer *glyphBuffer, u8 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >> 7) & 1] <<  0)
                | (colors[(src[i] >> 6) & 1] <<  4)
                | (colors[(src[i] >> 5) & 1] <<  8)
                | (colors[(src[i] >> 4) & 1] << 12)
                | (colors[(src[i] >> 3) & 1] << 16)
                | (colors[(src[i] >> 2) & 1] << 20)
                | (colors[(src[i] >> 1) & 1] << 24)
                | (colors[(src[i] >> 0) & 1] << 28);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static s32 DrawGlyphTile_ShadowedFont(struct GlyphTileInfo *glyphTileInfo)
{
    struct GlyphBuffer *glyphBuffer = &sGlyphBuffer;
    u32 *buffer = glyphTileInfo->dest;
    const u32 *masks = sGlyphMasks[glyphTileInfo->width][glyphTileInfo->startPixel];
    u32 mask1 = masks[0] | masks[2];

    glyphBuffer->pixelRows[0] = buffer[0] & mask1;
    glyphBuffer->pixelRows[1] = buffer[1] & mask1;
    glyphBuffer->pixelRows[2] = buffer[2] & mask1;
    glyphBuffer->pixelRows[3] = buffer[3] & mask1;
    glyphBuffer->pixelRows[4] = buffer[4] & mask1;
    glyphBuffer->pixelRows[5] = buffer[5] & mask1;
    glyphBuffer->pixelRows[6] = buffer[6] & mask1;
    glyphBuffer->pixelRows[7] = buffer[7] & mask1;

    if (glyphTileInfo->startPixel + glyphTileInfo->width > 8)
    {
        u32 mask2 = masks[1];
        if (glyphTileInfo->textMode == TEXT_MODE_UNKNOWN2)
        {
            glyphBuffer->pixelRows[8] = buffer[8] & mask2;
            glyphBuffer->pixelRows[9] = buffer[9] & mask2;
            glyphBuffer->pixelRows[10] = buffer[10] & mask2;
            glyphBuffer->pixelRows[11] = buffer[11] & mask2;
            glyphBuffer->pixelRows[12] = buffer[12] & mask2;
            glyphBuffer->pixelRows[13] = buffer[13] & mask2;
            glyphBuffer->pixelRows[14] = buffer[14] & mask2;
            glyphBuffer->pixelRows[15] = buffer[15] & mask2;
        }
        else
        {
            glyphBuffer->pixelRows[8] = buffer[16] & mask2;
            glyphBuffer->pixelRows[9] = buffer[17] & mask2;
            glyphBuffer->pixelRows[10] = buffer[18] & mask2;
            glyphBuffer->pixelRows[11] = buffer[19] & mask2;
            glyphBuffer->pixelRows[12] = buffer[20] & mask2;
            glyphBuffer->pixelRows[13] = buffer[21] & mask2;
            glyphBuffer->pixelRows[14] = buffer[22] & mask2;
            glyphBuffer->pixelRows[15] = buffer[23] & mask2;
        }
    }

    sShiftGlyphTileShadowedFuncs[glyphTileInfo->width](glyphBuffer, (u32 *)glyphTileInfo->src, glyphTileInfo->colors, glyphTileInfo->startPixel);

    buffer[0] = glyphBuffer->pixelRows[0];
    buffer[1] = glyphBuffer->pixelRows[1];
    buffer[2] = glyphBuffer->pixelRows[2];
    buffer[3] = glyphBuffer->pixelRows[3];
    buffer[4] = glyphBuffer->pixelRows[4];
    buffer[5] = glyphBuffer->pixelRows[5];
    buffer[6] = glyphBuffer->pixelRows[6];
    buffer[7] = glyphBuffer->pixelRows[7];

    if (glyphTileInfo->startPixel + glyphTileInfo->width > 8)
    {
        if (glyphTileInfo->textMode != TEXT_MODE_UNKNOWN2)
            buffer += 8;
        buffer[8] = glyphBuffer->pixelRows[8];
        buffer[9] = glyphBuffer->pixelRows[9];
        buffer[10] = glyphBuffer->pixelRows[10];
        buffer[11] = glyphBuffer->pixelRows[11];
        buffer[12] = glyphBuffer->pixelRows[12];
        buffer[13] = glyphBuffer->pixelRows[13];
        buffer[14] = glyphBuffer->pixelRows[14];
        buffer[15] = glyphBuffer->pixelRows[15];
    }

    return (glyphTileInfo->startPixel + glyphTileInfo->width) / 8;
}

static void ShiftGlyphTile_ShadowedFont_Width0(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
}

static void ShiftGlyphTile_ShadowedFont_Width1(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = colors[src[i] & 0xF];
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_ShadowedFont_Width2(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >> 0) & 0xF] << 0)
                | (colors[(src[i] >> 4) & 0xF] << 4);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_ShadowedFont_Width3(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >> 0) & 0xF] << 0)
                | (colors[(src[i] >> 4) & 0xF] << 4)
                | (colors[(src[i] >> 8) & 0xF] << 8);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

static void ShiftGlyphTile_ShadowedFont_Width4(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u8 i;
    for (i = 0; i < 8; i++)
    {
        u32 val = (colors[(src[i] >>  0) & 0xF] <<  0)
                | (colors[(src[i] >>  4) & 0xF] <<  4)
                | (colors[(src[i] >>  8) & 0xF] <<  8)
                | (colors[(src[i] >> 12) & 0xF] << 12);
        u32 *dest = &glyphBuffer->pixelRows[i];
        dest[0] |= val << shiftAmount->left;
        dest[8] |= val >> shiftAmount->right;
    }
}

#define SHIFT_GLYPH_WIDTH5_STEP(i)                          \
val = (colors[(src[i] >>  0) & 0xF] <<  0)                  \
    | (colors[(src[i] >>  4) & 0xF] <<  4)                  \
    | (colors[(src[i] >>  8) & 0xF] <<  8)                  \
    | (colors[(src[i] >> 12) & 0xF] << 12)                  \
    | (colors[(src[i] >> 16) & 0xF] << 16);                 \
glyphBuffer->pixelRows[i]     |= val << shiftAmount->left;  \
glyphBuffer->pixelRows[i + 8] |= val >> shiftAmount->right; \

static void ShiftGlyphTile_ShadowedFont_Width5(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u32 val;
    SHIFT_GLYPH_WIDTH5_STEP(0)
    SHIFT_GLYPH_WIDTH5_STEP(1)
    SHIFT_GLYPH_WIDTH5_STEP(2)
    SHIFT_GLYPH_WIDTH5_STEP(3)
    SHIFT_GLYPH_WIDTH5_STEP(4)
    SHIFT_GLYPH_WIDTH5_STEP(5)
    SHIFT_GLYPH_WIDTH5_STEP(6)
    SHIFT_GLYPH_WIDTH5_STEP(7)
}

#define SHIFT_GLYPH_WIDTH6_STEP(i)                          \
val = (colors[(src[i] >>  0) & 0xF] <<  0)                  \
    | (colors[(src[i] >>  4) & 0xF] <<  4)                  \
    | (colors[(src[i] >>  8) & 0xF] <<  8)                  \
    | (colors[(src[i] >> 12) & 0xF] << 12)                  \
    | (colors[(src[i] >> 16) & 0xF] << 16)                  \
    | (colors[(src[i] >> 20) & 0xF] << 20);                 \
glyphBuffer->pixelRows[i]     |= val << shiftAmount->left;  \
glyphBuffer->pixelRows[i + 8] |= val >> shiftAmount->right; \

static void ShiftGlyphTile_ShadowedFont_Width6(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u32 val;
    SHIFT_GLYPH_WIDTH6_STEP(0)
    SHIFT_GLYPH_WIDTH6_STEP(1)
    SHIFT_GLYPH_WIDTH6_STEP(2)
    SHIFT_GLYPH_WIDTH6_STEP(3)
    SHIFT_GLYPH_WIDTH6_STEP(4)
    SHIFT_GLYPH_WIDTH6_STEP(5)
    SHIFT_GLYPH_WIDTH6_STEP(6)
    SHIFT_GLYPH_WIDTH6_STEP(7)
}

#define SHIFT_GLYPH_WIDTH7_STEP(i)                          \
val = (colors[(src[i] >>  0) & 0xF] <<  0)                  \
    | (colors[(src[i] >>  4) & 0xF] <<  4)                  \
    | (colors[(src[i] >>  8) & 0xF] <<  8)                  \
    | (colors[(src[i] >> 12) & 0xF] << 12)                  \
    | (colors[(src[i] >> 16) & 0xF] << 16)                  \
    | (colors[(src[i] >> 20) & 0xF] << 20)                  \
    | (colors[(src[i] >> 24) & 0xF] << 24);                 \
glyphBuffer->pixelRows[i]     |= val << shiftAmount->left;  \
glyphBuffer->pixelRows[i + 8] |= val >> shiftAmount->right; \

static void ShiftGlyphTile_ShadowedFont_Width7(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u32 val;
    SHIFT_GLYPH_WIDTH7_STEP(0)
    SHIFT_GLYPH_WIDTH7_STEP(1)
    SHIFT_GLYPH_WIDTH7_STEP(2)
    SHIFT_GLYPH_WIDTH7_STEP(3)
    SHIFT_GLYPH_WIDTH7_STEP(4)
    SHIFT_GLYPH_WIDTH7_STEP(5)
    SHIFT_GLYPH_WIDTH7_STEP(6)
    SHIFT_GLYPH_WIDTH7_STEP(7)
}

#define SHIFT_GLYPH_WIDTH8_STEP(i)                          \
val = (colors[(src[i] >>  0) & 0xF] <<  0)                  \
    | (colors[(src[i] >>  4) & 0xF] <<  4)                  \
    | (colors[(src[i] >>  8) & 0xF] <<  8)                  \
    | (colors[(src[i] >> 12) & 0xF] << 12)                  \
    | (colors[(src[i] >> 16) & 0xF] << 16)                  \
    | (colors[(src[i] >> 20) & 0xF] << 20)                  \
    | (colors[(src[i] >> 24) & 0xF] << 24)                  \
    | (colors[(src[i] >> 28)      ] << 28);                 \
glyphBuffer->pixelRows[i]     |= val << shiftAmount->left;  \
glyphBuffer->pixelRows[i + 8] |= val >> shiftAmount->right; \

static void ShiftGlyphTile_ShadowedFont_Width8(struct GlyphBuffer *glyphBuffer, u32 *src, u32 *colors, u8 startPixel)
{
    const struct ShiftAmount *shiftAmount = &sGlyphShiftAmounts[startPixel];
    u32 val;
    SHIFT_GLYPH_WIDTH8_STEP(0)
    SHIFT_GLYPH_WIDTH8_STEP(1)
    SHIFT_GLYPH_WIDTH8_STEP(2)
    SHIFT_GLYPH_WIDTH8_STEP(3)
    SHIFT_GLYPH_WIDTH8_STEP(4)
    SHIFT_GLYPH_WIDTH8_STEP(5)
    SHIFT_GLYPH_WIDTH8_STEP(6)
    SHIFT_GLYPH_WIDTH8_STEP(7)
}

static s32 DrawGlyphTiles(struct Window *win, u32 glyph, u32 glyphWidth)
{
    struct GlyphTileInfo glyphTileInfo;
    u8 *upperTile;
    u8 *lowerTile;
    s32 retVal = 0;

    GetGlyphTilePointers(win->fontNum, win->language, glyph, &upperTile, &lowerTile);
    glyphTileInfo.textMode = win->textMode;
    glyphTileInfo.startPixel = (win->left + win->cursorX) & 7;
    glyphTileInfo.width = glyphWidth;
    glyphTileInfo.src = upperTile;
    glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 0));
    glyphTileInfo.colors = sGlyphBuffer.colors;

    switch (win->fontNum)
    {
    case 0:
    case 1:
    case 2:
    case 6:
        DrawGlyphTile_UnshadowedFont(&glyphTileInfo);
        glyphTileInfo.src = lowerTile;
        glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 1));
        retVal = DrawGlyphTile_UnshadowedFont(&glyphTileInfo);
        break;
    case 3:
    case 4:
    case 5:
        DrawGlyphTile_ShadowedFont(&glyphTileInfo);
        glyphTileInfo.src = lowerTile;
        glyphTileInfo.dest = (u32 *)(win->tileData + 32 * GetCursorTileNum(win, 0, 1));
        retVal = DrawGlyphTile_ShadowedFont(&glyphTileInfo);
        break;
    }

    return retVal;
}

static void UpdateTilemap(struct Window *win, u32 tilesWidth)
{
    u16 *tilemap = GetCursorTilemapPointer(win);
    if (tilesWidth && tilemap)
    {
        u16 paletteNum = (win->paletteNum << 12);
        u16 upperLeftTileNum = GetCursorTileNum(win, 0, 0);
        u16 lowerLeftTileNum = GetCursorTileNum(win, 0, 1);
        tilemap[0] = upperLeftTileNum | paletteNum;
        tilemap[32] = lowerLeftTileNum | paletteNum;
        if (tilesWidth == 2)
        {
            u16 upperRightTileNum = GetCursorTileNum(win, 1, 0);
            u16 lowerRightTileNum = GetCursorTileNum(win, 1, 1);
            tilemap[1] = upperRightTileNum | paletteNum;
            tilemap[33] = lowerRightTileNum | paletteNum;
        }
    }
}

static u16 GetCursorTileNum(struct Window *win, u32 xOffset, u32 yOffset)
{
    u16 index;

    if (win->textMode == TEXT_MODE_UNKNOWN2)
        index = win->tileDataStartOffset
              + win->tileDataOffset
              + (((win->top + win->cursorY) >> 3) + yOffset) * win->width
              + (((win->left + win->cursorX) >> 3) + xOffset);
    else
        index = win->tileDataStartOffset + win->tileDataOffset + 2 * xOffset + yOffset;

    return index;
}
