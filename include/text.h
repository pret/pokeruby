#ifndef GUARD_TEXT_H
#define GUARD_TEXT_H

#include "characters.h"

struct WindowTemplate
{
    u8 bgNum;
    u8 charBaseBlock;
    u8 screenBaseBlock;
    u8 priority;
    u8 paletteNum;
    u8 foregroundColor;
    u8 backgroundColor;
    u8 shadowColor;
    u8 fontNum;
    u8 textMode;
    u8 spacing;
    u8 tilemapLeft;
    u8 tilemapTop;
    u8 width;
    u8 height;
    u8 *tileData;
    u16 *tilemap;
    u32 maybeUnused;
};

struct Window
{
 /*0x00*/ u8 textMode;
 /*0x01*/ u8 fontNum;
 /*0x02*/ u8 language;
 /*0x03*/ u8 foregroundColor;
 /*0x04*/ u8 backgroundColor;
 /*0x05*/ u8 shadowColor;
 /*0x06*/ u8 paletteNum;
 /*0x07*/ u8 tilemapLeft;
 /*0x08*/ u8 tilemapTop;
 /*0x09*/ u8 width;
 /*0x0A*/ u8 height;
 /*0x0B*/ u8 win_field_B;
 /*0x0C*/ u8 win_field_C;
 /*0x0D*/ u8 delayCounter;
 /*0x0E*/ u8 spacing;
 /*0x0F*/ u8 win_field_F;
 /*0x10*/ u8 cursorX;
 /*0x11*/ u8 cursorY;
 /*0x12*/ u8 left;
 /*0x14*/ u16 top; // padded to 0x14
 /*0x16*/ u16 state;
 /*0x18*/ u16 downArrowCounter;
 /*0x1A*/ u16 tileDataStartOffset;
 /*0x1C*/ u16 tileDataOffset;
 /*0x1E*/ u16 textIndex;
 /*0x20*/ const u8 *text;
 /*0x24*/ u8 *tileData;
 /*0x28*/ u16 *tilemap;
 /*0x2C*/ const struct WindowTemplate *template;
};

extern vu16 *const gBGControlRegs[];
extern vu16 *const gBGHOffsetRegs[];
extern vu16 *const gBGVOffsetRegs[];

extern const u16 gUnknown_081E29D8[];
extern const u16 gUnknown_081E29E0[];
extern const u16 gUnknown_081E29E8[];

extern const struct WindowTemplate gWindowTemplate_81E6C3C;
extern const struct WindowTemplate gWindowTemplate_81E6C58;
extern const struct WindowTemplate gWindowTemplate_81E6C74;
extern const struct WindowTemplate gWindowTemplate_81E6C90;
extern const struct WindowTemplate gWindowTemplate_81E6CAC;
extern const struct WindowTemplate gWindowTemplate_81E6CC8;
extern const struct WindowTemplate gMenuTextWindowTemplate;
extern const struct WindowTemplate gWindowTemplate_81E6D00;
extern const struct WindowTemplate gWindowTemplate_81E6D1C;
extern const struct WindowTemplate gWindowTemplate_81E6D38;
extern const struct WindowTemplate gWindowTemplate_81E6D54;
extern const struct WindowTemplate gWindowTemplate_81E6D70;
extern const struct WindowTemplate gWindowTemplate_81E6D8C;
extern const struct WindowTemplate gWindowTemplate_81E6DA8;
extern const struct WindowTemplate gWindowTemplate_TrainerCard_Back_Values;
extern const struct WindowTemplate gWindowTemplate_TrainerCard_Back_Labels;
extern const struct WindowTemplate gWindowTemplate_81E6DFC;
extern const struct WindowTemplate gWindowTemplate_81E6E18;
extern const struct WindowTemplate gWindowTemplate_81E6E34;
extern const struct WindowTemplate gWindowTemplate_81E6E50;
extern const struct WindowTemplate gWindowTemplate_81E6E6C;
extern const struct WindowTemplate gWindowTemplate_81E6E88;
extern const struct WindowTemplate gWindowTemplate_81E6EA4;
extern const struct WindowTemplate gWindowTemplate_81E6EC0;
extern const struct WindowTemplate gWindowTemplate_81E6EDC;
extern const struct WindowTemplate gWindowTemplate_81E6EF8;
extern const struct WindowTemplate gWindowTemplate_81E6F14;
extern const struct WindowTemplate gWindowTemplate_81E6F30;
extern const struct WindowTemplate gWindowTemplate_81E6F4C;
extern const struct WindowTemplate gWindowTemplate_81E6F68;
extern const struct WindowTemplate gWindowTemplate_81E6F84;
extern const struct WindowTemplate gWindowTemplate_81E6FA0;
extern const struct WindowTemplate gWindowTemplate_81E6FBC;
extern const struct WindowTemplate gWindowTemplate_81E6FD8;
extern const struct WindowTemplate gWindowTemplate_81E6FF4;
extern const struct WindowTemplate gWindowTemplate_81E7010;
extern const struct WindowTemplate gWindowTemplate_81E702C;
extern const struct WindowTemplate gWindowTemplate_81E7048;
extern const struct WindowTemplate gWindowTemplate_81E7064;
extern const struct WindowTemplate gWindowTemplate_81E7080;
extern const struct WindowTemplate gWindowTemplate_81E709C;
extern const struct WindowTemplate gWindowTemplate_81E70B8;
extern const struct WindowTemplate gWindowTemplate_81E70D4;
extern const struct WindowTemplate gWindowTemplate_81E70F0;
extern const struct WindowTemplate gWindowTemplate_81E710C;
extern const struct WindowTemplate gWindowTemplate_81E7128;
extern const struct WindowTemplate gWindowTemplate_81E7144;
extern const struct WindowTemplate gWindowTemplate_ContestPainting;
extern const struct WindowTemplate gWindowTemplate_81E717C;
extern const struct WindowTemplate gWindowTemplate_81E7198;
extern const struct WindowTemplate gWindowTemplate_81E71B4;
extern const struct WindowTemplate gWindowTemplate_81E71D0;
extern const struct WindowTemplate gWindowTemplate_81E71EC;
extern const struct WindowTemplate gWindowTemplate_81E7208;
extern const struct WindowTemplate gWindowTemplate_81E7224;
extern const struct WindowTemplate gMenuTextWindowTemplate;
extern const struct WindowTemplate gWindowTemplate_81E725C;
extern const struct WindowTemplate gWindowTemplate_81E7278;
extern const struct WindowTemplate gWindowTemplate_81E7294;

extern u16 gBGTilemapBuffers[4][0x400];

extern u8 gStringVar1[];
extern u8 gStringVar2[];
extern u8 gStringVar3[];
extern u8 gStringVar4[];
extern u8 gTileBuffer[];

void LoadFontDefaultPalette(const struct WindowTemplate *winConfig);
void Text_LoadWindowTemplate(const struct WindowTemplate *winConfig);
u16 InitWindowTileData(struct Window *win, u16 startOffset);
u32 MultistepInitWindowTileData(struct Window *win, u16 startOffset);
bool32 MultistepLoadFont(void);
void Text_InitWindowWithTemplate(struct Window *win, const struct WindowTemplate *winConfig);
void Text_InitWindow(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top);
void Text_InitWindow8002E4C(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u16 top, u32 a6);
void Text_SetWindowText(struct Window *win, const u8 *text);
void Contest_StartTextPrinter(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top);
u8 Text_PrintWindow8002F44(struct Window *win);
u8 Text_PrintWindowSimple(struct Window *win);
u8 Text_InitWindowAndPrintText(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top);
u8 sub_8003490(struct Window *win, u8 c, u16 tileDataStartOffset, u8 left, u8 top);
void RenderTextHandleBold(u8 *tileData, const u8 *text);
u8 sub_80034EC(u8 *str);
u8 *sub_8003504(u8 *dest, s32 value, u8 alignAmount, u8 alignType);
u8 *sub_8003558(u8 *dest, const u8 *src, u8 alignAmount, u8 alignType);
u8 Text_UpdateWindow(struct Window *win);
u8 Text_UpdateWindowInBattle(struct Window *win);
u8 Text_UpdateWindowAutoscroll(struct Window *win);
u8 Contest_RunTextPrinter(struct Window *win);
u32 Text_UpdateWindowOverrideLineLength(struct Window *win, u8 lineLength);
void Text_ClearWindow(struct Window *win);
u16 Text_GetWindowTilemapEntry(struct Window *win, u8 x, u8 y);
void Text_FillWindowBorder(struct Window *win, u16 tilemapEntry, u8 left, u8 top, u8 right, u8 bottom);
void DrawWindowRect_DefaultPalette(struct Window *win, u16 tileNum, u8 left, u8 top, u8 right, u8 bottom);
void Text_FillWindowRect(struct Window *win, u16 tilemapEntry, u8 left, u8 top, u8 right, u8 bottom);
void Text_FillWindowRectDefPalette(struct Window *win, u16 tileNum, u8 left, u8 top, u8 right, u8 bottom);
void Text_EraseWindowRect(struct Window *win, u8 left, u8 top, u8 right, u8 bottom);
void Text_BlankWindowRect(struct Window *win, u8 left, u8 top, u8 right, u8 bottom);
u8 GetExtCtrlCodeLength(u8 code);
u8 *AlignInt1(struct Window *win, u8 *dest, s32 value, u8 alignAmount, u8 alignType);
u8 *AlignInt2(struct Window *win, u8 *dest, s32 value, u8 alignAmount, u8 alignType);
u8 *AlignString(struct Window *win, u8 *dest, const u8 *src, u8 alignAmount, u8 alignType);
u8 GetStringWidth(struct Window *win, const u8 *s);
u8 Text_InitWindow8004D04(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u16 top, u32 a6);
u8 Text_InitWindow_RightAligned(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 right, u8 top);
u8 Text_InitWindow_Centered(struct Window *win, const u8 *text, u16 tileDataStartOffset, u8 left, u8 top, u16 a6);
u8 Text_GetWindowPaletteNum(struct Window *win);
void Text_GetTextColors(struct Window *win, u8 *foreground, u8 *background, u8 *shadow);
void Text_InitWindow8004E3C(const struct WindowTemplate *winConfig, u8 *tileData, const u8 *text);
u8 Text_GetStringWidthFromWindowTemplate(const struct WindowTemplate *winConfig, const u8 *s);
void ConvertInternationalString(u8 *s, u8 language);
void Text_StripExtCtrlCodes(u8 *str);
s32 StringCompareWithoutExtCtrlCodes(const u8 *str1, const u8 *str2);
u8 sub_8004FD0(struct Window *win, u8 *dest, const u8 *src, u16 tileDataStartOffset, u8 left, u16 top, u8 width, u32 a8);

extern const u16 gUnknownPalette_81E6692[];

#endif // GUARD_TEXT_H
