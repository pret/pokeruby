#include "global.h"
#include "main.h"
#include "text.h"
#include "songs.h"
#include "text_window.h"

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

void InitMenuWindowConfig(struct WindowConfig *);
void MultistepInitMenuWindowConfigBegin(struct WindowConfig *);
void MultistepInitMenuWindowConfigInternal(struct WindowConfig *, u16);
bool32 MultistepInitMenuWindowConfigContinue(void);
void InitMenuWindowConfigInternal(struct WindowConfig *, u16);
void unref_sub_8071DA4(struct WindowConfig *, u16);
void MenuLoadTextWindowGraphics_OverrideFrameType(u8);
void MenuLoadTextWindowGraphics(void);
void BasicInitMenuWindowConfig(struct WindowConfig *);
void MenuPrint(u8 *, u8, u8);
void MenuZeroFillWindowRect(u8, u8, u8, u8);
void MenuFillWindowRectWithBlankTile(u8, u8, u8, u8);
void MenuZeroFillScreen(void);
void MenuDrawTextWindow(u8, u8, u8, u8);
void sub_8071F40(u8 *);
void sub_8071F60(u8, u8, u8, u8);
u16 unref_sub_8071F98(u8, u8);
void unref_sub_8071FBC(u16, u8, u8, u8, u8);
void MenuDisplayMessageBox(void);
void MenuPrintMessage(u8 *, u8, u8);
void sub_8072044(u8 *);
void MenuSetText(u8 *);
u8 MenuUpdateWindowText(void);
u8 unref_sub_8072098(void);
void sub_80720B0(void);
u8 MoveMenuCursor(s8);
u8 MoveMenuCursorNoWrap(s8);
u8 GetMenuCursorPos(void);
s8 ProcessMenuInput(void);
s8 ProcessMenuInputNoWrap(void);
u8 MoveMenuCursor3(s8);
u8 MoveMenuCursor4(s8);
bool8 sub_80723D4(void);
u8 sub_8072484(u8, u8, u8, u8, u8, u8, u32);
u8 sub_80724F4(u8, u8, u8, u8*[][2], u8);
void sub_8072620(u8, u8, u8, u8*[][2], u8);
void sub_807274C(u8, u8, u8, u8, u8*[][2], u8, u32);
s8 sub_80727CC(void);
u8 sub_807288C(u8);
void PrintMenuItems(u8, u8, u8, u8*[][2]);
void PrintMenuItemsReordered(u8, u8, u8, u8*[][2], u8*);
void InitYesNoMenu(u8, u8, u8);
void DisplayYesNoMenu(u8, u8, u32);
s8 ProcessMenuInputNoWrap_(void);
u8 sub_80729D8(u8 *, u8, u16, u8);
u8 sub_8072A18(u8 *, u8, u16, u8, u32);
u8 unref_sub_8072A5C(u8 *, u8 *, u8, u16, u8, u32);
int sub_8072AB0(u8 *, u8, u16, u8, u8, u32);
void sub_8072B4C(u8 *, u8, u8);
void sub_8072B80(u8 *, u8, u8, u8 *);
void sub_8072BD8(u8 *, u8, u8, u16);
u8 *sub_8072C14(u8 *, s32, u8, u8);
u8 *sub_8072C44(u8 *, s32, u8, u8);
u8 *sub_8072C74(u8 *, u8 *, u8, u8);
u8 sub_8072CA4(u8 *s);
u8 sub_8072CBC(void);
void sub_8072CD4(u8 *, u8 *, u8 *);
u32 sub_8072CF4(u8);
struct Window * unref_sub_8072D0C(void);
void sub_8072D18(u8, u8);
u8 InitMenu(u8, u8, u8, u8, u8, u8);
void RedrawMenuCursor(u8, u8);
void unref_sub_8072DC0(void);
void sub_8072DCC(u8);
void sub_8072DDC(u8);
void sub_8072DEC(void);

extern void sub_814A5C0(u8, u16, u8, u16, u8);
extern void sub_814A880(u8, u8);
extern void sub_814A904(void);
extern void sub_814A958(u8);
extern void sub_814A7FC(void);

static struct Menu gMenu;

extern struct Window gMenuWindow;
extern struct Window *gMenuWindowPtr;
extern u8 gMenuMultistepInitState;
extern u16 gMenuTextTileOffset;
extern u16 gMenuTextWindowTileOffset;
extern u16 gMenuTextWindowContentTileOffset;
extern u16 gMenuMessageBoxContentTileOffset;

extern const u8 *gUnknown_08376D74[][2];

void InitMenuWindowConfig(struct WindowConfig *winConfig)
{
    InitMenuWindowConfigInternal(winConfig, 1);
}

void MultistepInitMenuWindowConfigBegin(struct WindowConfig *winConfig)
{
    MultistepInitMenuWindowConfigInternal(winConfig, 1);
}

void MultistepInitMenuWindowConfigInternal(struct WindowConfig *winConfig, u16 tileOffset)
{
    gMenuMultistepInitState = 0;
    gMenuTextTileOffset = tileOffset;
    gMenuWindowPtr = &gMenuWindow;
    InitWindowFromConfig(&gMenuWindow, winConfig);
}

bool32 MultistepInitMenuWindowConfigContinue(void)
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
        gMenuTextWindowContentTileOffset = SetTextWindowBaseTileNum(gMenuTextWindowTileOffset);
    next:
        gMenuMultistepInitState++;
        return 0;
    case 4:
        LoadTextWindowGraphics(gMenuWindowPtr);
        gMenuMessageBoxContentTileOffset = SetMessageBoxBaseTileNum(gMenuTextWindowContentTileOffset);
        return 1;
    default:
    fail:
        return 0;
    }
}

void InitMenuWindowConfigInternal(struct WindowConfig *winConfig, u16 tileOffset)
{
    gMenuWindowPtr = &gMenuWindow;
    InitWindowFromConfig(&gMenuWindow, winConfig);
    gMenuTextTileOffset = tileOffset;
    gMenuTextWindowTileOffset = InitWindowTileData(gMenuWindowPtr, gMenuTextTileOffset);
    gMenuTextWindowContentTileOffset = SetTextWindowBaseTileNum(gMenuTextWindowTileOffset);
    LoadTextWindowGraphics(gMenuWindowPtr);
    gMenuMessageBoxContentTileOffset = SetMessageBoxBaseTileNum(gMenuTextWindowContentTileOffset);
}

void unref_sub_8071DA4(struct WindowConfig *winConfig, u16 tileOffset)
{
    gMenuWindowPtr = &gMenuWindow;
    InitWindowFromConfig(&gMenuWindow, winConfig);
    gMenuTextWindowTileOffset = tileOffset;
    gMenuTextWindowContentTileOffset = SetTextWindowBaseTileNum(gMenuTextWindowTileOffset);
    LoadTextWindowGraphics(gMenuWindowPtr);
    gMenuTextTileOffset = SetMessageBoxBaseTileNum(gMenuTextWindowContentTileOffset);
    gMenuMessageBoxContentTileOffset = InitWindowTileData(gMenuWindowPtr, gMenuTextTileOffset);
}

void MenuLoadTextWindowGraphics_OverrideFrameType(u8 frameType)
{
    LoadTextWindowGraphics_OverrideFrameType(gMenuWindowPtr, frameType);
}

void MenuLoadTextWindowGraphics(void)
{
    LoadTextWindowGraphics(gMenuWindowPtr);
}

void BasicInitMenuWindowConfig(struct WindowConfig *winConfig)
{
    InitWindowFromConfig(gMenuWindowPtr, winConfig);
    gMenuWindowPtr->tileDataStartOffset = gMenuTextTileOffset;
}

void MenuPrint(u8 *str, u8 left, u8 top)
{
    sub_8003460(gMenuWindowPtr, str, gMenuTextTileOffset, left, top);
}

void MenuZeroFillWindowRect(u8 a1, u8 a2, u8 a3, u8 a4)
{
    ZeroFillWindowRect(gMenuWindowPtr, a1, a2, a3, a4);
}

void MenuFillWindowRectWithBlankTile(u8 left, u8 top, u8 right, u8 bottom)
{
    FillWindowRectWithBlankTile(gMenuWindowPtr, left, top, right, bottom);
}

void MenuZeroFillScreen(void)
{
    MenuZeroFillWindowRect(0, 0, 29, 19);
}

void MenuDrawTextWindow(u8 left, u8 top, u8 right, u8 bottom)
{
    DrawTextWindow(gMenuWindowPtr, left, top, right, bottom);
}

void sub_8071F40(u8 *str)
{
    MenuDrawTextWindow(2, 14, 28, 19);
    MenuPrint(str, 3, 15);
}

void sub_8071F60(u8 a1, u8 a2, u8 a3, u8 a4)
{
    sub_8003490(gMenuWindowPtr, a1, gMenuTextTileOffset, a2, a3);
}

u16 unref_sub_8071F98(u8 x, u8 y)
{
    return GetWindowTilemapEntry(gMenuWindowPtr, x, y);
}

void unref_sub_8071FBC(u16 a1, u8 a2, u8 a3, u8 a4, u8 a5)
{
    DrawWindowRect(gMenuWindowPtr, a1, a2, a3, a4, a5);
}

void MenuDisplayMessageBox(void)
{
    DisplayMessageBox(gMenuWindowPtr);
}

void MenuPrintMessage(u8 *str, u8 left, u8 top)
{
    sub_8002EB0(gMenuWindowPtr, str, gMenuTextTileOffset, left, top);
}

void sub_8072044(u8 *str)
{
    sub_8002EB0(gMenuWindowPtr, str, gMenuTextTileOffset, 2, 15);
}

void MenuSetText(u8 *str)
{
    sub_8002E90(gMenuWindowPtr, str);
}

u8 MenuUpdateWindowText(void)
{
    return sub_80035AC(gMenuWindowPtr);
}

u8 unref_sub_8072098(void)
{
    return sub_8003418(gMenuWindowPtr);
}

void sub_80720B0(void)
{
    ClearWindowTextLines(gMenuWindowPtr);
}

u8 MoveMenuCursor(s8 delta)
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

u8 MoveMenuCursorNoWrap(s8 delta)
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

u8 GetMenuCursorPos(void)
{
    return gMenu.cursorPos;
}

s8 ProcessMenuInput(void)
{
    if (gMain.newKeys & A_BUTTON)
    {
        audio_play(SE_SELECT);
        if (gMenu.menu_field_7)
            sub_8072DEC();
        return gMenu.cursorPos;
    }

    if (gMain.newKeys & B_BUTTON)
    {
        if (gMenu.menu_field_7)
            sub_8072DEC();
        return -1;
    }

    if (gMain.newKeys & DPAD_UP)
    {
        audio_play(SE_SELECT);
        MoveMenuCursor(-1);
        return -2;
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        audio_play(SE_SELECT);
        MoveMenuCursor(1);
        return -2;
    }

    return -2;
}

s8 ProcessMenuInputNoWrap(void)
{
    u8 cursorPos = gMenu.cursorPos;

    if (gMain.newKeys & A_BUTTON)
    {
        audio_play(SE_SELECT);
        if (gMenu.menu_field_7)
            sub_8072DEC();
        return gMenu.cursorPos;
    }

    if (gMain.newKeys & B_BUTTON)
    {
        if (gMenu.menu_field_7)
            sub_8072DEC();
        return -1;
    }

    if (gMain.newKeys & DPAD_UP)
    {
        if (cursorPos != MoveMenuCursorNoWrap(-1))
            audio_play(SE_SELECT);
        return -2;
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        if (cursorPos != MoveMenuCursorNoWrap(1))
            audio_play(SE_SELECT);
        return -2;
    }

    MoveMenuCursorNoWrap(0);
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

u8 MoveMenuCursor4(s8 delta)
{
    if (gMenu.cursorPos + delta <= gMenu.maxCursorPos)
    {
        if (sub_80723D4() == TRUE)
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

bool8 sub_80723D4(void)
{
    if ((gMain.newKeys & DPAD_UP) && gMenu.cursorPos < gMenu.width)
        return TRUE;

    if ((gMain.newKeys & DPAD_DOWN) && gMenu.cursorPos >= (gMenu.maxCursorPos + 1) - gMenu.width)
        return TRUE;

    if ((gMain.newKeys & DPAD_LEFT)
     && ((gMenu.cursorPos - (gMenu.cursorPos % gMenu.width)) % gMenu.width == 1 // always false
         || gMenu.cursorPos == 0
         || gMenu.cursorPos % gMenu.width == 0))
         return TRUE;

    if ((gMain.newKeys & DPAD_RIGHT) && gMenu.cursorPos % gMenu.width == gMenu.width - 1)
        return TRUE;

    return FALSE;
}

u8 sub_8072484(u8 a1, u8 a2, u8 menuItemCount, u8 a4, u8 width, u8 a6, u32 a7)
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

#ifdef NONMATCHING
u8 sub_80724F4(u8 left, u8 top, u8 menuItemCount, u8 *menuItems[][2], u8 columnCount)
{
    u8 i;
    u8 maxWidth;
    s32 height;

    for (i = 0; i < 7; i++)
        gMenu.columnXCoords[i] = 0;

    maxWidth = 0;
    for (i = 0; i < menuItemCount; i++)
    {
        u8 width = (sub_8072CA4(menuItems[i][0]) + 7) / 8;

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
        u8 right;
        u8 bottom;
        u32 totalWidth;
        register s32 val asm("r1");

        val = (s8)top + height;
        bottom = val;

        totalWidth = (gMenu.columnXCoords[columnCount] + 1);
        right = left + totalWidth;

        MenuDrawTextWindow(left, top, right, bottom);
    }

    return maxWidth;
}
#else
__attribute__((naked))
u8 sub_80724F4(u8 left, u8 top, u8 menuItemCount, u8 *menuItems[][2], u8 columnCount)
{
    asm("push {r4-r7,lr}\n\
	mov r7, r10\n\
	mov r6, r9\n\
	mov r5, r8\n\
	push {r5-r7}\n\
	sub sp, #0xC\n\
	mov r8, r3\n\
	ldr r3, [sp, #0x2C]\n\
	lsl r0, #24\n\
	lsr r0, #24\n\
	str r0, [sp]\n\
	lsl r1, #24\n\
	lsr r1, #24\n\
	str r1, [sp, #0x4]\n\
	lsl r2, #24\n\
	lsr r6, r2, #24\n\
	lsl r3, #24\n\
	lsr r5, r3, #24\n\
	movs r4, #0\n\
	ldr r0, _080725D4\n\
	mov r9, r0\n\
	mov r1, r9\n\
	add r1, #0x8\n\
	movs r2, #0\n\
_08072524:\n\
	add r0, r4, r1\n\
	strb r2, [r0]\n\
	add r0, r4, #0x1\n\
	lsl r0, #24\n\
	lsr r4, r0, #24\n\
	cmp r4, #0x6\n\
	bls _08072524\n\
	movs r7, #0\n\
	movs r4, #0\n\
	lsr r2, r6, #1\n\
	mov r10, r2\n\
	ldr r0, [sp, #0x4]\n\
	lsl r0, #24\n\
	str r0, [sp, #0x8]\n\
	cmp r7, r6\n\
	bcs _08072566\n\
_08072544:\n\
	lsl r0, r4, #3\n\
	add r0, r8\n\
	ldr r0, [r0]\n\
	bl sub_8072CA4\n\
	lsl r0, #24\n\
	lsr r0, #24\n\
	add r1, r0, #0x7\n\
	lsr r0, r1, #3\n\
	cmp r0, r7\n\
	bls _0807255C\n\
	add r7, r0, #0\n\
_0807255C:\n\
	add r0, r4, #0x1\n\
	lsl r0, #24\n\
	lsr r4, r0, #24\n\
	cmp r4, r6\n\
	bcc _08072544\n\
_08072566:\n\
	movs r4, #0x1\n\
	ldr r2, _080725D4\n\
	mov r9, r2\n\
	cmp r4, r5\n\
	bhi _08072582\n\
	mov r1, r9\n\
	add r1, #0x8\n\
_08072574:\n\
	add r0, r4, r1\n\
	strb r7, [r0]\n\
	add r0, r4, #0x1\n\
	lsl r0, #24\n\
	lsr r4, r0, #24\n\
	cmp r4, r5\n\
	bls _08072574\n\
_08072582:\n\
	movs r4, #0x1\n\
	cmp r4, r5\n\
	bhi _080725A4\n\
	ldr r3, _080725D8\n\
_0807258A:\n\
	add r2, r4, r3\n\
	ldrb r1, [r2]\n\
	sub r0, r4, #0x1\n\
	add r0, r3\n\
	add r1, #0x1\n\
	ldrb r0, [r0]\n\
	add r1, r0\n\
	strb r1, [r2]\n\
	add r0, r4, #0x1\n\
	lsl r0, #24\n\
	lsr r4, r0, #24\n\
	cmp r4, r5\n\
	bls _0807258A\n\
_080725A4:\n\
	mov r1, r9\n\
	add r1, #0x8\n\
	add r1, r5, r1\n\
	ldrb r0, [r1]\n\
	sub r0, #0x1\n\
	strb r0, [r1]\n\
	cmp r10, r5\n\
	bcc _080725BC\n\
	movs r0, #0x1\n\
	and r0, r6\n\
	cmp r0, #0\n\
	beq _080725C4\n\
_080725BC:\n\
	cmp r5, #0x1\n\
	beq _080725C4\n\
	cmp r5, r6\n\
	bne _080725DC\n\
_080725C4:\n\
	add r0, r6, #0\n\
	add r1, r5, #0\n\
	bl __udivsi3\n\
	lsl r0, #24\n\
	lsr r0, #23\n\
	add r0, #0x1\n\
	b _080725EA\n\
	.align 2, 0\n\
_080725D4: .4byte 0x030006b0\n\
_080725D8: .4byte 0x030006b8\n\
_080725DC:\n\
	add r0, r6, #0\n\
	add r1, r5, #0\n\
	bl __udivsi3\n\
	lsl r0, #24\n\
	lsr r0, #23\n\
	add r0, #0x3\n\
_080725EA:\n\
	ldr r2, [sp, #0x8]\n\
	asr r1, r2, #24\n\
	add r1, r0\n\
	lsl r1, #24\n\
	lsr r3, r1, #24\n\
	mov r0, r9\n\
	add r0, #0x8\n\
	add r0, r5, r0\n\
	ldrb r2, [r0]\n\
	add r2, #0x1\n\
	ldr r0, [sp]\n\
	add r2, r0, r2\n\
	lsl r2, #24\n\
	lsr r2, #24\n\
	ldr r1, [sp, #0x4]\n\
	bl MenuDrawTextWindow\n\
	add r0, r7, #0\n\
	add sp, #0xC\n\
	pop {r3-r5}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	mov r10, r5\n\
	pop {r4-r7}\n\
	pop {r1}\n\
	bx r1\n");
}
#endif // NONMATCHING

void sub_8072620(u8 left, u8 top, u8 menuItemCount, u8 *menuItems[][2], u8 columnCount)
{
    u8 i;
    u8 maxWidth;

    for (i = 0; i < 7; i++)
        gMenu.columnXCoords[i] = 0;

    maxWidth = 0;
    for (i = 0; i < menuItemCount; i++)
    {
        u8 width = (sub_8072CA4(menuItems[i][0]) + 7) / 8;

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
            MenuPrint(menuItems[i + j][0], left + gMenu.columnXCoords[i % columnCount], top + 2 * row);
    }
}

void sub_807274C(u8 left, u8 top, u8 menuItemCount, u8 a4, u8 *menuItems[][2], u8 columnCount, u32 a7)
{
    u8 maxWidth = sub_80724F4(left, top, menuItemCount, menuItems, columnCount);

    sub_8072484(left + 1, top + 1, menuItemCount, a4, columnCount, maxWidth, a7);
    sub_8072620(left + 1, top + 1, menuItemCount, menuItems, columnCount);
}

s8 sub_80727CC(void)
{
    if (gMain.newKeys & A_BUTTON)
    {
        if (gMenu.menu_field_7)
            sub_8072DEC();
        audio_play(SE_SELECT);
        return GetMenuCursorPos();
    }

    if (gMain.newKeys & B_BUTTON)
    {
        if (gMenu.menu_field_7)
            sub_8072DEC();
        return -1;
    }

    if (gMain.newKeys & DPAD_UP)
    {
        audio_play(SE_SELECT);
        MoveMenuCursor4(-gMenu.width);
        return -2;
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        audio_play(SE_SELECT);
        MoveMenuCursor4(gMenu.width);
        return -2;
    }
    else if (gMain.newKeys & DPAD_LEFT)
    {
        audio_play(SE_SELECT);
        MoveMenuCursor4(-1);
        return -2;
    }
    else if (gMain.newKeys & DPAD_RIGHT)
    {
        audio_play(SE_SELECT);
        MoveMenuCursor4(1);
        return -2;
    }

    return -2;
}

u8 sub_807288C(u8 column)
{
    return gMenu.columnXCoords[column];
}

void PrintMenuItems(u8 left, u8 top, u8 menuItemCount, u8 *menuItems[][2])
{
    u8 i;

    for (i = 0; i < menuItemCount; i++)
        MenuPrint(menuItems[i][0], left, top + 2 * i);
}

void PrintMenuItemsReordered(u8 left, u8 top, u8 menuItemCount, u8 *menuItems[][2], u8 *order)
{
    u8 i;

    for (i = 0; i < menuItemCount; i++)
        MenuPrint(menuItems[order[i]][0], left, top + 2 * i);
}

void InitYesNoMenu(u8 left, u8 top, u8 a3)
{
    PrintMenuItems(left + 1, top + 1, 2, (void *)gUnknown_08376D74);
    InitMenu(0, left + 1, top + 1, 2, 0, a3);
}

void DisplayYesNoMenu(u8 left, u8 top, u32 a3)
{
    MenuDrawTextWindow(left, top, left + 6, top + 5);
    InitYesNoMenu(left, top, 5);
    gMenu.menu_field_7 = a3 ? -1 : 0;
}

s8 ProcessMenuInputNoWrap_(void)
{
    return ProcessMenuInputNoWrap();
}

u8 sub_80729D8(u8 *text, u8 left, u16 top, u8 a4)
{
    return sub_8004D04(gMenuWindowPtr, text, gMenuTextTileOffset, left, top, a4);
}

u8 sub_8072A18(u8 *text, u8 left, u16 top, u8 width, u32 a5)
{
    return sub_8004FD0(gMenuWindowPtr, 0, text, gMenuTextTileOffset, left, top, width, a5);
}

u8 unref_sub_8072A5C(u8 *dest, u8 *src, u8 left, u16 top, u8 width, u32 a6)
{
    return sub_8004FD0(gMenuWindowPtr, dest, src, gMenuTextTileOffset, left, top, width, a6);
}

__attribute__((naked))
int sub_8072AB0(u8 *str, u8 left, u16 top, u8 width, u8 height, u32 a6)
{
    asm("push {r4-r7,lr}\n\
	mov r7, r9\n\
	mov r6, r8\n\
	push {r6,r7}\n\
	sub sp, #0x10\n\
	mov r9, r0\n\
	add r4, r1, #0\n\
	add r5, r2, #0\n\
	ldr r0, [sp, #0x2C]\n\
	ldr r2, [sp, #0x30]\n\
	lsl r4, #24\n\
	lsr r1, r4, #24\n\
	mov r12, r1\n\
	lsl r5, #16\n\
	lsr r7, r5, #16\n\
	lsl r3, #24\n\
	lsr r6, r3, #24\n\
	lsl r0, #24\n\
	lsr r0, #24\n\
	mov r8, r0\n\
	ldr r0, _08072B44\n\
	ldr r0, [r0]\n\
	ldr r1, _08072B48\n\
	ldrh r3, [r1]\n\
	mov r1, r12\n\
	str r1, [sp]\n\
	str r7, [sp, #0x4]\n\
	str r6, [sp, #0x8]\n\
	str r2, [sp, #0xC]\n\
	movs r1, #0\n\
	mov r2, r9\n\
	bl sub_8004FD0\n\
	add r1, r0, #0\n\
	lsl r1, #24\n\
	lsr r2, r1, #24\n\
	lsr r4, #27\n\
	mov r12, r4\n\
	lsr r7, r5, #19\n\
	add r1, r6, #0x7\n\
	lsr r6, r1, #3\n\
	mov r1, r8\n\
	add r1, #0x7\n\
	asr r1, #3\n\
	lsl r1, #24\n\
	lsr r1, #24\n\
	mov r8, r1\n\
	cmp r2, r8\n\
	bcs _08072B34\n\
	lsl r1, r2, #1\n\
	add r1, r7, r1\n\
	lsl r1, #24\n\
	lsr r1, #24\n\
	mov r0, r12\n\
	add r2, r0, r6\n\
	sub r2, #0x1\n\
	lsl r2, #24\n\
	lsr r2, #24\n\
	mov r0, r8\n\
	add r3, r0, r7\n\
	sub r3, #0x1\n\
	lsl r3, #24\n\
	lsr r3, #24\n\
	mov r0, r12\n\
	bl MenuFillWindowRectWithBlankTile\n\
_08072B34:\n\
	add sp, #0x10\n\
	pop {r3,r4}\n\
	mov r8, r3\n\
	mov r9, r4\n\
	pop {r4-r7}\n\
	pop {r1}\n\
	bx r1\n\
	.align 2, 0\n\
_08072B44: .4byte 0x0202e9c8\n\
_08072B48: .4byte 0x0202e9ce\n");
}

void sub_8072B4C(u8 *str, u8 left, u8 top)
{
    sub_8004D38(gMenuWindowPtr, str, gMenuTextTileOffset, left, top);
}

void sub_8072B80(u8 *a1, u8 a2, u8 a3, u8 *a4)
{
    u8 buffer[64];
    u8 width = GetStringWidth(gMenuWindowPtr, a4);
    AlignString(gMenuWindowPtr, buffer, a1, width, 1);
    sub_8003460(gMenuWindowPtr, buffer, gMenuTextTileOffset, a2, a3);
}

void sub_8072BD8(u8 *a1, u8 a2, u8 a3, u16 a4)
{
    sub_8004DB0(gMenuWindowPtr, a1, gMenuTextTileOffset, a2, a3, a4);
}

u8 *sub_8072C14(u8 *a1, s32 a2, u8 a3, u8 a4)
{
    return AlignInt1(gMenuWindowPtr, a1, a2, a3, a4);
}

u8 *sub_8072C44(u8 *a1, s32 a2, u8 a3, u8 a4)
{
    return AlignInt2(gMenuWindowPtr, a1, a2, a3, a4);
}

u8 *sub_8072C74(u8 *a1, u8 *a2, u8 a3, u8 a4)
{
    return AlignString(gMenuWindowPtr, a1, a2, a3, a4);
}

u8 sub_8072CA4(u8 *str)
{
    return GetStringWidth(gMenuWindowPtr, str);
}

u8 sub_8072CBC()
{
    return sub_8004E24(gMenuWindowPtr);
}

void sub_8072CD4(u8 *a1, u8 *a2, u8 *a3)
{
    sub_8004E28(gMenuWindowPtr, a1, a2, a3);
}

u32 sub_8072CF4(u8 a1)
{
    return sub_80037C8(gMenuWindowPtr, a1);
}

struct Window *unref_sub_8072D0C(void)
{
    return gMenuWindowPtr;
}

void sub_8072D18(u8 a1, u8 a2)
{
    sub_814A5C0(a1, 0xFFFF, 12, 11679, 8 * a2);
}

u8 InitMenu(u8 a1, u8 left, u8 top, u8 numChoices, u8 cursorPos, u8 a6)
{
    s32 pos;

    if (a6)
        sub_8072D18(a1, a6);

    gMenu.left = left - 1;
    gMenu.top = top;
    gMenu.minCursorPos = 0;
    gMenu.maxCursorPos = numChoices - 1;
    gMenu.menu_field_7 = 0;

    pos = cursorPos;

    if (pos < 0 || pos > gMenu.maxCursorPos)
        pos = 0;

    gMenu.cursorPos = pos;
    MoveMenuCursor(0);

    return pos;
}

void RedrawMenuCursor(u8 a1, u8 a2)
{
    sub_814A880((a1 + 1) * 8, 8 * a2);
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

void sub_8072DEC(void)
{
    sub_814A7FC();
}
