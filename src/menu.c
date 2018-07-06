#include "global.h"
#include "menu.h"
#include "main.h"
#include "event_obj_lock.h"
#include "menu_cursor.h"
#include "script.h"
#include "constants/songs.h"
#include "sound.h"
#include "strings.h"
#include "text.h"
#include "text_window.h"
#include "string_util.h"

struct Menu
{
    u8 left;
    u8 top;
    s8 cursorPos;
    s8 minCursorPos;
    s8 maxCursorPos;
    u8 width;
    u8 height;
    u8 menu_field_7;
    u8 columnXCoords[8];
};

static void MultistepInitMenuWindowInternal(const struct WindowTemplate *, u16);
static void InitMenuWindowInternal(const struct WindowTemplate *, u16);
static bool8 IsGridCursorMovementClamped(void);
static u8 sub_8072484(u8, u8, u8, u8, u8, u8, u32);
static u8 sub_80724F4(u8, u8, u8, const struct MenuAction[], u8);
static void sub_8072620(u8, u8, u8, const struct MenuAction[], u8);
static void sub_8072D18(u8, u8);
static void RedrawMenuCursor(u8, u8);

static struct Menu gMenu;

EWRAM_DATA struct Window gMenuWindow = {0};
EWRAM_DATA u8 gFiller_202E908[0x90] = {0};
EWRAM_DATA struct Window *gMenuWindowPtr = NULL;
EWRAM_DATA u8 gMenuMultistepInitState = 0;
EWRAM_DATA u16 gMenuTextTileOffset = 0;
EWRAM_DATA u16 gMenuTextWindowTileOffset = 0;
EWRAM_DATA u16 gMenuTextWindowContentTileOffset = 0;
EWRAM_DATA u16 gMenuMessageBoxContentTileOffset = 0;

const struct MenuAction gMenuYesNoItems[] =
{
    { OtherText_Yes, NULL },
    { OtherText_No, NULL },
};

void CloseMenu(void)
{
    PlaySE(SE_SELECT);
    Menu_EraseScreen();
    ScriptUnfreezeEventObjects();
    ScriptContext2_Disable();
    Menu_DestroyCursor();
}

void AppendToList(u8 *list, u8 *pindex, u32 value)
{
    list[*pindex] = value;
    (*pindex)++;
}

void InitMenuWindow(const struct WindowTemplate *winTemplate)
{
    InitMenuWindowInternal(winTemplate, 1);
}

void MultistepInitMenuWindowBegin(const struct WindowTemplate *winTemplate)
{
    MultistepInitMenuWindowInternal(winTemplate, 1);
}

static void MultistepInitMenuWindowInternal(const struct WindowTemplate *winTemplate, u16 tileOffset)
{
    gMenuMultistepInitState = 0;
    gMenuTextTileOffset = tileOffset;
    gMenuWindowPtr = &gMenuWindow;
    Text_InitWindowWithTemplate(&gMenuWindow, winTemplate);
}

bool32 MultistepInitMenuWindowContinue(void)
{
    switch (gMenuMultistepInitState)
    {
    case 0:
        gMenuMultistepInitState++;
        return 0;
    case 1:
        gMenuTextWindowTileOffset = MultistepInitWindowTileData(gMenuWindowPtr, gMenuTextTileOffset);
        goto next;
    case 2:
        if (!MultistepLoadFont())
            goto fail;
        goto next;
    case 3:
        gMenuTextWindowContentTileOffset = TextWindow_SetBaseTileNum(gMenuTextWindowTileOffset);
    next:
        gMenuMultistepInitState++;
        return 0;
    case 4:
        TextWindow_LoadStdFrameGraphics(gMenuWindowPtr);
        gMenuMessageBoxContentTileOffset = TextWindow_SetDlgFrameBaseTileNum(gMenuTextWindowContentTileOffset);
        return 1;
    default:
    fail:
        return 0;
    }
}

static void InitMenuWindowInternal(const struct WindowTemplate *winTemplate, u16 tileOffset)
{
    gMenuWindowPtr = &gMenuWindow;
    Text_InitWindowWithTemplate(&gMenuWindow, winTemplate);
    gMenuTextTileOffset = tileOffset;
    gMenuTextWindowTileOffset = InitWindowTileData(gMenuWindowPtr, gMenuTextTileOffset);
    gMenuTextWindowContentTileOffset = TextWindow_SetBaseTileNum(gMenuTextWindowTileOffset);
    TextWindow_LoadStdFrameGraphics(gMenuWindowPtr);
    gMenuMessageBoxContentTileOffset = TextWindow_SetDlgFrameBaseTileNum(gMenuTextWindowContentTileOffset);
}

void unref_sub_8071DA4(struct WindowTemplate *winTemplate, u16 tileOffset)
{
    gMenuWindowPtr = &gMenuWindow;
    Text_InitWindowWithTemplate(&gMenuWindow, winTemplate);
    gMenuTextWindowTileOffset = tileOffset;
    gMenuTextWindowContentTileOffset = TextWindow_SetBaseTileNum(gMenuTextWindowTileOffset);
    TextWindow_LoadStdFrameGraphics(gMenuWindowPtr);
    gMenuTextTileOffset = TextWindow_SetDlgFrameBaseTileNum(gMenuTextWindowContentTileOffset);
    gMenuMessageBoxContentTileOffset = InitWindowTileData(gMenuWindowPtr, gMenuTextTileOffset);
}

void Menu_LoadStdFrameGraphicsOverrideStyle(u8 frameType)
{
    TextWindow_LoadStdFrameGraphicsOverrideStyle(gMenuWindowPtr, frameType);
}

void Menu_LoadStdFrameGraphics(void)
{
    TextWindow_LoadStdFrameGraphics(gMenuWindowPtr);
}

void BasicInitMenuWindow(const struct WindowTemplate *winTemplate)
{
    Text_InitWindowWithTemplate(gMenuWindowPtr, winTemplate);
    gMenuWindowPtr->tileDataStartOffset = gMenuTextTileOffset;
}

// Prints 
void Menu_PrintText(const u8 *str, u8 left, u8 top)
{
    Text_InitWindowAndPrintText(gMenuWindowPtr, str, gMenuTextTileOffset, left, top);
}

void Menu_EraseWindowRect(u8 left, u8 top, u8 right, u8 bottom)
{
    Text_EraseWindowRect(gMenuWindowPtr, left, top, right, bottom);
}

void Menu_BlankWindowRect(u8 left, u8 top, u8 right, u8 bottom)
{
    Text_BlankWindowRect(gMenuWindowPtr, left, top, right, bottom);
}

void Menu_EraseScreen(void)
{
    Menu_EraseWindowRect(0, 0, 29, 19);
}

void Menu_DrawStdWindowFrame(u8 left, u8 top, u8 right, u8 bottom)
{
    TextWindow_DrawStdFrame(gMenuWindowPtr, left, top, right, bottom);
}

void sub_8071F40(const u8 *str)
{
    Menu_DrawStdWindowFrame(2, 14, 28, 19);
    Menu_PrintText(str, 3, 15);
}

void sub_8071F60(u8 a1, u8 a2, u8 a3)
{
    sub_8003490(gMenuWindowPtr, a1, gMenuTextTileOffset, a2, a3);
}

u16 unref_sub_8071F98(u8 x, u8 y)
{
    return Text_GetWindowTilemapEntry(gMenuWindowPtr, x, y);
}

void unref_sub_8071FBC(u16 a1, u8 a2, u8 a3, u8 a4, u8 a5)
{
    Text_FillWindowBorder(gMenuWindowPtr, a1, a2, a3, a4, a5);
}

void Menu_DisplayDialogueFrame(void)
{
    TextWindow_DisplayDialogueFrame(gMenuWindowPtr);
}

void MenuPrintMessage(const u8 *str, u8 left, u8 top)
{
    Text_InitWindow8002EB0(gMenuWindowPtr, str, gMenuTextTileOffset, left, top);
}

void MenuPrintMessageDefaultCoords(const u8 *str)
{
    Text_InitWindow8002EB0(gMenuWindowPtr, str, gMenuTextTileOffset, 2, 15);
}

void Menu_SetText(const u8 *str)
{
    Text_SetWindowText(gMenuWindowPtr, str);
}

u8 Menu_UpdateWindowText(void)
{
    return Text_UpdateWindow(gMenuWindowPtr);
}

u8 unref_sub_8072098(void)
{
    return Text_PrintWindowSimple(gMenuWindowPtr);
}

void Menu_ClearWindowText(void)
{
    Text_ClearWindow(gMenuWindowPtr);
}

u8 Menu_MoveCursor(s8 delta)
{
    s32 newPos = gMenu.cursorPos + delta;

    if (newPos < gMenu.minCursorPos)
        gMenu.cursorPos = gMenu.maxCursorPos;
    else if (newPos > gMenu.maxCursorPos)
        gMenu.cursorPos = gMenu.minCursorPos;
    else
        gMenu.cursorPos += delta;

    RedrawMenuCursor(gMenu.left, 2 * gMenu.cursorPos + gMenu.top);
    return gMenu.cursorPos;
}

u8 Menu_MoveCursorNoWrap(s8 delta)
{
    s32 newPos = gMenu.cursorPos + delta;

    if (newPos < gMenu.minCursorPos)
        gMenu.cursorPos = gMenu.minCursorPos;
    else if (newPos > gMenu.maxCursorPos)
        gMenu.cursorPos = gMenu.maxCursorPos;
    else
        gMenu.cursorPos += delta;

    RedrawMenuCursor(gMenu.left, 2 * gMenu.cursorPos + gMenu.top);
    return gMenu.cursorPos;
}

u8 Menu_GetCursorPos(void)
{
    return gMenu.cursorPos;
}

s8 Menu_ProcessInput(void)
{
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        if (gMenu.menu_field_7)
            Menu_DestroyCursor();
        return gMenu.cursorPos;
    }

    if (gMain.newKeys & B_BUTTON)
    {
        if (gMenu.menu_field_7)
            Menu_DestroyCursor();
        return -1;
    }

    if (gMain.newKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        Menu_MoveCursor(-1);
        return -2;
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        Menu_MoveCursor(1);
        return -2;
    }

    return -2;
}

s8 Menu_ProcessInputNoWrap(void)
{
    u8 cursorPos = gMenu.cursorPos;

    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        if (gMenu.menu_field_7)
            Menu_DestroyCursor();
        return gMenu.cursorPos;
    }

    if (gMain.newKeys & B_BUTTON)
    {
        if (gMenu.menu_field_7)
            Menu_DestroyCursor();
        return -1;
    }

    if (gMain.newKeys & DPAD_UP)
    {
        if (cursorPos != Menu_MoveCursorNoWrap(-1))
            PlaySE(SE_SELECT);
        return -2;
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        if (cursorPos != Menu_MoveCursorNoWrap(1))
            PlaySE(SE_SELECT);
        return -2;
    }

    Menu_MoveCursorNoWrap(0);
    return -2;
}

u8 MoveMenuCursor3(s8 delta)
{
    u8 menuHeight = (gMenu.maxCursorPos + 1) >> 1;
    s32 newPos = gMenu.cursorPos + delta;

    if (newPos < gMenu.minCursorPos)
        gMenu.cursorPos = gMenu.maxCursorPos;
    else if (newPos > gMenu.maxCursorPos)
        gMenu.cursorPos = gMenu.minCursorPos;
    else
        gMenu.cursorPos += delta;

    RedrawMenuCursor(
        6 * (gMenu.cursorPos / menuHeight) + gMenu.left,
        2 * (gMenu.cursorPos % menuHeight) + gMenu.top);

    return gMenu.cursorPos;
}

static u8 MoveMenuCursorGridLayout(s8 delta)
{
    // Don't move cursor if it is clamped
    if (gMenu.cursorPos + delta <= gMenu.maxCursorPos)
    {
        if (IsGridCursorMovementClamped() == TRUE)
            return gMenu.cursorPos;
    }
    else
    {
        return gMenu.cursorPos;
    }

    gMenu.cursorPos += delta;

    if ((gMenu.maxCursorPos + 1) / gMenu.width == 0)
        RedrawMenuCursor(
            gMenu.left + gMenu.columnXCoords[gMenu.cursorPos % gMenu.width],
            2 * ((gMenu.cursorPos / gMenu.width) % gMenu.height) + gMenu.top);
    else
        RedrawMenuCursor(
            gMenu.left + gMenu.columnXCoords[gMenu.cursorPos % gMenu.width],
            2 * (gMenu.cursorPos / gMenu.width) + gMenu.top);

    return gMenu.cursorPos;
}

// Returns TRUE if the cursor is on an edge and cannot move in the pressed direction
static bool8 IsGridCursorMovementClamped(void)
{
    if (gMain.newKeys & DPAD_UP)
    {
        // is cursor on first row?
        if (gMenu.cursorPos < gMenu.width)
            return TRUE;
    }
    if (gMain.newKeys & DPAD_DOWN)
    {
        // is cursor on last row?
        if (gMenu.cursorPos >= gMenu.maxCursorPos + 1 - gMenu.width)
            return TRUE;
    }
    if (gMain.newKeys & DPAD_LEFT)
    {
        // is cursor on first column?
        if ((gMenu.cursorPos - gMenu.cursorPos % gMenu.width) % gMenu.width == 1 // always false
         || gMenu.cursorPos == 0  // redundant
         || gMenu.cursorPos % gMenu.width == 0)
            return TRUE;
    }
    if (gMain.newKeys & DPAD_RIGHT)
    {
        // is cursor on last column?
        if (gMenu.cursorPos % gMenu.width == gMenu.width - 1)
            return TRUE;
    }

    return FALSE;
}

static u8 sub_8072484(u8 a1, u8 a2, u8 menuItemCount, u8 a4, u8 width, u8 a6, u32 a7)
{
    u8 v7;

    gMenu.width = width;
    gMenu.height = menuItemCount / width;
    InitMenu(0, a1, a2, menuItemCount, a4, a6);
    v7 = 0;
    if (a7)
        v7 = -1;
    gMenu.menu_field_7 = v7;
    return a4;
}

static u8 sub_80724F4(u8 left, u8 top, u8 menuItemCount, const struct MenuAction menuItems[], u8 columnCount)
{
    u8 i;
    u8 maxWidth;
    s32 height;

    for (i = 0; i < 7; i++)
        gMenu.columnXCoords[i] = 0;

    maxWidth = 0;
    for (i = 0; i < menuItemCount; i++)
    {
        u8 width = (GetStringWidthInMenuWindow(menuItems[i].text) + 7) / 8;

        if (width > maxWidth)
            maxWidth = width;
    }

    for (i = 1; i <= columnCount; i++)
        gMenu.columnXCoords[i] = maxWidth;

    for (i = 1; i <= columnCount; i++)
        gMenu.columnXCoords[i] += 1 + gMenu.columnXCoords[i - 1];

    gMenu.columnXCoords[columnCount]--;

    if (!((menuItemCount / 2) < columnCount || (menuItemCount % 2 != 0))
     || columnCount == 1
     || columnCount == menuItemCount)
    {
        height = 2 * (menuItemCount / columnCount) + 1;
    }
    else
    {
        height = 2 * ((menuItemCount / columnCount) + 1) + 1;
    }

    {
        // TODO: Make this code less hideous but still match the original asm.
        u8 right;
        u8 bottom;
        u32 totalWidth;
        register s32 val asm("r1");

        val = (s8)top + height;
        val = val << 24;
        asm("" ::: "r3");
        bottom = val >> 24;

        totalWidth = (gMenu.columnXCoords[columnCount] + 1);
        right = left + totalWidth;

        Menu_DrawStdWindowFrame(left, top, right, bottom);
    }

    return maxWidth;
}

static void sub_8072620(u8 left, u8 top, u8 menuItemCount, const struct MenuAction menuItems[], u8 columnCount)
{
    u8 i;
    u8 maxWidth;

    for (i = 0; i < 7; i++)
        gMenu.columnXCoords[i] = 0;

    maxWidth = 0;
    for (i = 0; i < menuItemCount; i++)
    {
        u8 width = (GetStringWidthInMenuWindow(menuItems[i].text) + 7) / 8;

        if (width > maxWidth)
            maxWidth = width;
    }

    for (i = 1; i <= columnCount; i++)
        gMenu.columnXCoords[i] = maxWidth;

    for (i = 1; i <= columnCount; i++)
        gMenu.columnXCoords[i] += 1 + gMenu.columnXCoords[i - 1];

    gMenu.columnXCoords[columnCount]--;

    for (i = 0; i < columnCount; i++)
    {
        u8 row = 0;
        u8 j;
        for (j = 0; i + j < menuItemCount; j += columnCount, row++)
            Menu_PrintText(menuItems[i + j].text, left + gMenu.columnXCoords[i % columnCount], top + 2 * row);
    }
}

void sub_807274C(u8 left, u8 top, u8 menuItemCount, u8 a4, const struct MenuAction menuItems[], u8 columnCount, u32 a7)
{
    u8 maxWidth = sub_80724F4(left, top, menuItemCount, menuItems, columnCount);

    sub_8072484(left + 1, top + 1, menuItemCount, a4, columnCount, maxWidth, a7);
    sub_8072620(left + 1, top + 1, menuItemCount, menuItems, columnCount);
}

s8 Menu_ProcessInputGridLayout(void)
{
    if (gMain.newKeys & A_BUTTON)
    {
        if (gMenu.menu_field_7)
            Menu_DestroyCursor();
        PlaySE(SE_SELECT);
        return Menu_GetCursorPos();
    }

    if (gMain.newKeys & B_BUTTON)
    {
        if (gMenu.menu_field_7)
            Menu_DestroyCursor();
        return -1;
    }

    if (gMain.newKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        // Move up one whole row
        MoveMenuCursorGridLayout(-gMenu.width);
        return -2;
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        // Move down one whole column
        MoveMenuCursorGridLayout(gMenu.width);
        return -2;
    }
    else if (gMain.newKeys & DPAD_LEFT)
    {
        PlaySE(SE_SELECT);
        MoveMenuCursorGridLayout(-1);
        return -2;
    }
    else if (gMain.newKeys & DPAD_RIGHT)
    {
        PlaySE(SE_SELECT);
        MoveMenuCursorGridLayout(1);
        return -2;
    }

    return -2;
}

u8 Menu_GetColumnXCoord(u8 column)
{
    return gMenu.columnXCoords[column];
}

void Menu_PrintItems(u8 left, u8 top, u8 menuItemCount, const void * menuItems)
{
    u8 i;

    for (i = 0; i < menuItemCount; i++)
        Menu_PrintText(((const struct MenuAction *)menuItems)[i].text, left, top + 2 * i);
}

void Menu_PrintItemsReordered(u8 left, u8 top, u8 menuItemCount, const void * menuItems, const u8 *order)
{
    u8 i;

    for (i = 0; i < menuItemCount; i++)
        Menu_PrintText(((const struct MenuAction *)menuItems)[order[i]].text, left, top + 2 * i);
}

void InitYesNoMenu(u8 left, u8 top, u8 a3)
{
    Menu_PrintItems(left + 1, top + 1, 2, gMenuYesNoItems);
    InitMenu(0, left + 1, top + 1, 2, 0, a3);
}

void DisplayYesNoMenu(u8 left, u8 top, u32 a3)
{
    Menu_DrawStdWindowFrame(left, top, left + 6, top + 5);
    InitYesNoMenu(left, top, 5);
    gMenu.menu_field_7 = a3 ? -1 : 0;
}

s8 Menu_ProcessInputNoWrap_(void)
{
    return Menu_ProcessInputNoWrap();
}

u8 Menu_PrintTextPixelCoords(const u8 *text, u8 left, u16 top, u8 a4)
{
    return Text_InitWindow8004D04(gMenuWindowPtr, text, gMenuTextTileOffset, left, top, a4);
}

u8 sub_8072A18(const u8 *text, u8 left, u16 top, u8 width, u32 a5)
{
    return sub_8004FD0(gMenuWindowPtr, 0, text, gMenuTextTileOffset, left, top, width, a5);
}

u8 unref_sub_8072A5C(u8 *dest, u8 *src, u8 left, u16 top, u8 width, u32 a6)
{
    return sub_8004FD0(gMenuWindowPtr, dest, src, gMenuTextTileOffset, left, top, width, a6);
}

#if ENGLISH
int sub_8072AB0(const u8 *str, u8 left, u16 top, u8 width, u8 height, u32 a6)
{
    u8 newlineCount = sub_8004FD0(gMenuWindowPtr, NULL, str, gMenuTextTileOffset, left, top, width, a6);

    left /= 8;
    top /= 8;
    width = (width + 7) / 8;
    height = (height + 7) / 8;

    if (newlineCount < height)
        Menu_BlankWindowRect(left, top + 2 * newlineCount, left + width - 1, height + top - 1);
}
#elif GERMAN
NAKED
int sub_8072AB0(const u8 *str, u8 left, u16 top, u8 width, u8 height, u32 a6)
{
    asm(".syntax unified\n\
    push {r4-r7,lr}\n\
    sub sp, 0x10\n\
    mov r12, r0\n\
    ldr r0, [sp, 0x24]\n\
    ldr r4, [sp, 0x28]\n\
    str r4, [sp, 0xC]\n\
    lsls r1, 24\n\
    lsrs r5, r1, 24\n\
    lsls r2, 16\n\
    lsrs r4, r2, 16\n\
    lsls r3, 24\n\
    lsrs r6, r3, 24\n\
    lsls r0, 24\n\
    lsrs r7, r0, 24\n\
    ldr r0, _08072AF8 @ =gMenuWindowPtr\n\
    ldr r0, [r0]\n\
    ldr r1, _08072AFC @ =gMenuTextTileOffset\n\
    ldrh r3, [r1]\n\
    str r5, [sp]\n\
    str r4, [sp, 0x4]\n\
    str r6, [sp, 0x8]\n\
    movs r1, 0\n\
    mov r2, r12\n\
    bl sub_8004FD0\n\
    adds r1, r0, 0\n\
    lsls r1, 24\n\
    lsrs r2, r1, 24\n\
    movs r3, 0x7\n\
    ands r3, r5\n\
    cmp r3, 0\n\
    bne _08072B00\n\
    adds r1, r6, 0x7\n\
    asrs r1, 3\n\
    subs r1, 0x1\n\
    b _08072B0C\n\
    .align 2, 0\n\
_08072AF8: .4byte gMenuWindowPtr\n\
_08072AFC: .4byte gMenuTextTileOffset\n\
_08072B00:\n\
    adds r3, r6, r3\n\
    subs r1, r3, 0x1\n\
    cmp r1, 0\n\
    bge _08072B0A\n\
    adds r1, r3, 0x6\n\
_08072B0A:\n\
    asrs r1, 3\n\
_08072B0C:\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    adds r6, r1, 0\n\
    lsrs r5, 3\n\
    adds r1, r7, 0x7\n\
    asrs r1, 3\n\
    lsls r1, 24\n\
    lsrs r7, r1, 24\n\
    lsrs r4, 3\n\
    cmp r2, r7\n\
    bcs _08072B3E\n\
    lsls r1, r2, 1\n\
    adds r1, r4, r1\n\
    lsls r1, 24\n\
    lsrs r1, 24\n\
    adds r2, r5, r6\n\
    lsls r2, 24\n\
    lsrs r2, 24\n\
    adds r3, r7, r4\n\
    subs r3, 0x1\n\
    lsls r3, 24\n\
    lsrs r3, 24\n\
    adds r0, r5, 0\n\
    bl Menu_BlankWindowRect\n\
_08072B3E:\n\
    add sp, 0x10\n\
    pop {r4-r7}\n\
    pop {r1}\n\
    bx r1\n\
    .syntax divided\n");
}
#endif

void MenuPrint_RightAligned(const u8 *str, u8 right, u8 top)
{
    Text_InitWindow_RightAligned(gMenuWindowPtr, str, gMenuTextTileOffset, right, top);
}

void sub_8072B80(const u8 *src, u8 a2, u8 a3, const u8 *text)
{
    u8 buffer[64];
    u8 width = GetStringWidth(gMenuWindowPtr, text);
    AlignString(gMenuWindowPtr, buffer, src, width, 1);
    Text_InitWindowAndPrintText(gMenuWindowPtr, buffer, gMenuTextTileOffset, a2, a3);
}

void MenuPrint_Centered(const u8 *text, u8 left, u8 top, u16 width)
{
    Text_InitWindow_Centered(gMenuWindowPtr, text, gMenuTextTileOffset, left, top, width);
}

u8 *AlignInt1InMenuWindow(u8 *dest, s32 value, u8 alignAmount, u8 alignType)
{
    return AlignInt1(gMenuWindowPtr, dest, value, alignAmount, alignType);
}

u8 *AlignInt2InMenuWindow(u8 *dest, s32 value, u8 alignAmount, u8 alignType)
{
    return AlignInt2(gMenuWindowPtr, dest, value, alignAmount, alignType);
}

u8 *AlignStringInMenuWindow(u8 *dest, const u8 *src, u8 alignAmount, u8 alignType)
{
    return AlignString(gMenuWindowPtr, dest, src, alignAmount, alignType);
}

u8 GetStringWidthInMenuWindow(const u8 *str)
{
    return GetStringWidth(gMenuWindowPtr, str);
}

u8 Menu_GetTextWindowPaletteNum(void)
{
    return Text_GetWindowPaletteNum(gMenuWindowPtr);
}

void Menu_GetTextColors(u8 *a1, u8 *a2, u8 *a3)
{
    Text_GetTextColors(gMenuWindowPtr, a1, a2, a3);
}

u32 Menu_UpdateWindowTextOverrideLineLength(u8 lineLength)
{
    return Text_UpdateWindowOverrideLineLength(gMenuWindowPtr, lineLength);
}

struct Window *unref_sub_8072D0C(void)
{
    return gMenuWindowPtr;
}

static void sub_8072D18(u8 a1, u8 a2)
{
    MenuCursor_Create814A5C0(a1, 0xFFFF, 12, 11679, 8 * a2);
}

u8 InitMenu(u8 cursorSubpriority, u8 left, u8 top, u8 numChoices, u8 cursorPos, u8 cursorWidth)
{
    s32 pos;

    if (cursorWidth)
        sub_8072D18(cursorSubpriority, cursorWidth);

    gMenu.left = left - 1;
    gMenu.top = top;
    gMenu.minCursorPos = 0;
    gMenu.maxCursorPos = numChoices - 1;
    gMenu.menu_field_7 = 0;

    pos = cursorPos;

    if (pos < 0 || pos > gMenu.maxCursorPos)
        pos = 0;

    gMenu.cursorPos = pos;
    Menu_MoveCursor(0);

    return pos;
}

static void RedrawMenuCursor(u8 x, u8 y)
{
    MenuCursor_SetPos814A880((x + 1) * 8, 8 * y);
}

void unref_sub_8072DC0()
{
    sub_814A904();
}

void sub_8072DCC(u8 a1)
{
    sub_814A958(a1);
}

void sub_8072DDC(u8 a1)
{
    sub_8072DCC(8 * a1);
}

void Menu_DestroyCursor(void)
{
    DestroyMenuCursor();
}

#if GERMAN
void de_sub_8073110(u8 * buffer, u8 * name) {
    u8 * ptr, *ptr2, *ptr3;

    ptr2 = buffer;
    ptr = &gStringVar1[1 + StringLengthN(gStringVar1, 256)];
    ptr3 = ptr;

    for (;;)
    {
        if (*ptr2 == EOS)
            break;

        if (*ptr2 == 0xFD)
        {

            *ptr3 = EOS;
            ptr2 += 2;

            StringAppend(ptr, name);
            StringAppend(ptr, ptr2);

            buffer[0] = EOS;
            StringAppend(buffer, ptr);
            break;
        }

        *ptr3 = *ptr2;
        ptr2 += 1;
        ptr3 += 1;
    }
}

u8 *de_sub_8073174(u8 *name, const u8 *format) {
    u32 offset;
    u8 *ptr;

    offset = StringLengthN(gStringVar2, 0x100);
    ptr = &gStringVar2[1 + offset];

    StringCopy(ptr, format);

    de_sub_8073110(ptr, name);

    return StringCopy(name, ptr);
}
#endif
