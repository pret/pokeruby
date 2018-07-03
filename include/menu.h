#ifndef GUARD_MENU_H
#define GUARD_MENU_H

#include "task.h"
#include "text.h"

typedef bool8 (*MenuFunc)();

struct MenuAction
{
   const u8 *text;
   MenuFunc func;
};

struct MenuAction2
{
    const u8 *text;
    TaskFunc func;
};

extern const struct MenuAction gMenuYesNoItems[];

extern struct Window gMenuWindow;
extern struct Window *gMenuWindowPtr;
extern u16 gMenuTextTileOffset;
extern u16 gMenuTextWindowContentTileOffset;
extern u16 gMenuMessageBoxContentTileOffset;

void CloseMenu(void);
void AppendToList(u8 *list, u8 *pindex, u32 value);
void InitMenuWindow(const struct WindowTemplate *);
void MultistepInitMenuWindowBegin(const struct WindowTemplate *);
bool32 MultistepInitMenuWindowContinue(void);
void unref_sub_8071DA4(struct WindowTemplate *, u16);
void Menu_LoadStdFrameGraphicsOverrideStyle(u8);
void Menu_LoadStdFrameGraphics(void);
void BasicInitMenuWindow(const struct WindowTemplate *);
void Menu_PrintText(const u8 *, u8, u8);
void Menu_EraseWindowRect(u8, u8, u8, u8);
void Menu_BlankWindowRect(u8, u8, u8, u8);
void Menu_EraseScreen(void);
void Menu_DrawStdWindowFrame(u8, u8, u8, u8);
void sub_8071F40(const u8 *);
void sub_8071F60(u8, u8, u8);
u16 unref_sub_8071F98(u8, u8);
void unref_sub_8071FBC(u16, u8, u8, u8, u8);
void Menu_DisplayDialogueFrame(void);
void MenuPrintMessage(const u8 *, u8, u8);
void MenuPrintMessageDefaultCoords(const u8 *);
void Menu_SetText(const u8 *);
u8 Menu_UpdateWindowText(void);
u8 unref_sub_8072098(void);
void Menu_ClearWindowText(void);
u8 Menu_MoveCursor(s8);
u8 Menu_MoveCursorNoWrap(s8);
u8 Menu_GetCursorPos(void);
s8 Menu_ProcessInput(void);
s8 Menu_ProcessInputNoWrap(void);
void sub_807274C(u8, u8, u8, u8, const struct MenuAction[], u8, u32);
s8 Menu_ProcessInputGridLayout(void);
u8 Menu_GetColumnXCoord(u8);
void Menu_PrintItems(u8, u8, u8, const void *);
void Menu_PrintItemsReordered(u8 left, u8 top, u8 menuItemCount, const void * menuItems, const u8 *order);
void InitYesNoMenu(u8, u8, u8);
void DisplayYesNoMenu(u8, u8, u32);
s8 Menu_ProcessInputNoWrap_(void);
u8 Menu_PrintTextPixelCoords(const u8 *, u8, u16, u8);
u8 sub_8072A18(const u8 *, u8, u16, u8, u32);
u8 unref_sub_8072A5C(u8 *, u8 *, u8, u16, u8, u32);
int sub_8072AB0(const u8 *, u8, u16, u8, u8, u32);
void MenuPrint_RightAligned(const u8 *, u8, u8);
void sub_8072B80(const u8 *, u8, u8, const u8 *);
void MenuPrint_Centered(const u8 *, u8, u8, u16);
u8 *AlignInt1InMenuWindow(u8 *, s32, u8, u8);
u8 *AlignInt2InMenuWindow(u8 *, s32, u8, u8);
u8 *AlignStringInMenuWindow(u8 *, const u8 *, u8, u8);
u8 GetStringWidthInMenuWindow(const u8 *s);
u8 Menu_GetTextWindowPaletteNum(void);
void Menu_GetTextColors(u8 *, u8 *, u8 *);
u32 Menu_UpdateWindowTextOverrideLineLength(u8);
struct Window * unref_sub_8072D0C(void);
u8 InitMenu(u8, u8, u8, u8, u8, u8);
void unref_sub_8072DC0(void);
void sub_8072DCC(u8);
void sub_8072DDC(u8);
void Menu_DestroyCursor(void);

#if GERMAN
u8 *de_sub_8073174(u8 *name, const u8 *format);
#endif

#endif // GUARD_MENU_H
