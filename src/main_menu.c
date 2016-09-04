#include "global.h"
#include "text.h"
#include "sprite.h"
#include "task.h"
#include "main.h"
#include "rtc.h"
#include "songs.h"
#include "palette.h"

extern u8 sub_8072080(void);
extern void Print(u8 *, u8, u8);
extern void CB2_ContinueSavedGame(void);
extern void CB2_InitMysteryEventMenu(void);
extern void CB2_InitOptionMenu(void);
extern void CB2_InitTitleScreen(void);
extern void FormatPlayTime(u8 *str, u16 hours, u16 minutes, bool16 colon);
extern u8 *sub_8072C74(u8 *, u8 *, u8, u8);
extern u16 GetPokedexSeenCount(void);
extern u8 *sub_8072C14(u8 *, s32, u8, u8);
extern u8 sub_80729D8(u8 *, u8, u16, u8);
extern u8 GetBadgeCount(void);
extern void Task_Birch1(u8);

extern struct PaletteFadeControl gPaletteFade;
extern u8 gSaveFileDeletedMessage[];
extern u8 gSaveFileCorruptMessage[];
extern u8 gBoardNotInstalledMessage[];
extern u8 gBatteryDryMessage[];
extern u16 gSaveFileStatus;
extern u8 gMainMenuString_Continue[];
extern u8 gMainMenuString_NewGame[];
extern u8 gMainMenuString_MysteryEvents[];
extern u8 gMainMenuString_Option[];
extern u8 gMainMenuString_Player[];
extern u8 gMainMenuString_Time[];
extern u8 gMainMenuString_Pokedex[];
extern u8 gMainMenuString_Badges[];

void CB2_MainMenu(void);
void VBlankCB_MainMenu(void);
void CB2_InitMainMenu(void);
static void sub_80096FC(void);
static u32 InitMainMenu(bool8 a1);
static void Task_CheckSave(u8 taskId);
static void Task_WaitForSaveErrorAck(u8 taskId);
static void Task_CheckRtc(u8 taskId);
static void Task_WaitForRtcErrorAck(u8 taskId);
static void Task_DrawMainMenu(u8 taskId);
static void Task_HighlightCurrentMenuItem(u8 taskId);
static bool8 MainMenuProcessKeyInput(u8 taskId);
static void Task_MainMenuProcessKeyInput(u8 taskId);
static void MainMenuPressedA(u8 taskId);
static void MainMenuPressedB(u8 taskId);
static void HighlightCurrentMenuItem(u8, u8);
static void PrintMainMenuItem(u8 *text, u8, u8);
static void PrintSaveFileInfo(void);
static void PrintPlayerName(void);
static void PrintPlayTime(void);
static void PrintPokedexCount(void);
static void PrintBadgeCount(void);

extern u16 gMainMenuPalette[];

void CB2_MainMenu(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void VBlankCB_MainMenu(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void CB2_InitMainMenu(void)
{
    InitMainMenu(FALSE);
}

static void sub_80096FC(void)
{
    InitMainMenu(TRUE);
}

u32 InitMainMenu(u8 a1)
{
    u16 savedIme;
    u8 taskId;

    SetVBlankCallback(NULL);

    REG_DISPCNT = 0;
    REG_BG2CNT = 0;
    REG_BG1CNT = 0;
    REG_BG0CNT = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;

    DmaFill16(3, 0, (void *)VRAM, VRAM_SIZE);
    DmaFill32(3, 0, (void *)OAM, OAM_SIZE);
    DmaFill16(3, 0, (void *)(PLTT + 2), PLTT_SIZE - 2);

    ResetPaletteFade();
    LoadPalette(gMainMenuPalette, 0, 32);
    remove_some_task();
    ResetTasks();
    ResetSpriteData();
    FreeAllSpritePalettes();
    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    sub_8071C4C(&gWindowConfig_81E6CE4);

    if (a1)
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0x0000); // fade to black
    else
        BeginNormalPaletteFade(-1, 0, 0x10, 0, 0xFFFF); // fade to white

    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_WININ = 0;
    REG_WINOUT = 0;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;

    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;

    SetVBlankCallback(VBlankCB_MainMenu);
    SetMainCallback2(CB2_MainMenu);

    REG_DISPCNT = DISPCNT_OBJ_1D_MAP
                | DISPCNT_BG0_ON
                | DISPCNT_OBJ_ON
                | DISPCNT_WIN0_ON;

    taskId = CreateTask(Task_CheckSave, 0);
    gTasks[taskId].data[1] = 0;

    return 0;
}

void Task_CheckSave(u8 taskId)
{
    if (gPaletteFade.active)
        return;

    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_WININ = 0x1111;
    REG_WINOUT = 49;
    REG_BLDCNT = 241;
    REG_BLDALPHA = 0;
    REG_BLDY = 7;

    switch (gSaveFileStatus)
    {
    case 1:
        if (sub_806918C() == TRUE)
            gTasks[taskId].data[0] = 2;
        else
            gTasks[taskId].data[0] = 1;

        gTasks[taskId].func = Task_CheckRtc;
        break;
    case 2:
        DrawDefaultWindow(2, 14, 27, 19);
        AddTextPrinterWithCallbackForMessage(gSaveFileDeletedMessage, 3, 15);
        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(113, 159);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = Task_WaitForSaveErrorAck;
        break;
    case 255:
        DrawDefaultWindow(2, 14, 27, 19);
        AddTextPrinterWithCallbackForMessage(gSaveFileCorruptMessage, 3, 15);
        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(113, 159);
        gTasks[taskId].data[0] = 1;
        gTasks[taskId].func = Task_WaitForSaveErrorAck;

        if (sub_806918C() == TRUE)
            gTasks[taskId].data[0] = 2;
        else
            gTasks[taskId].data[0] = 1;
        break;
    case 0:
    default:
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = Task_CheckRtc;
        break;
    case 4:
        DrawDefaultWindow(2, 14, 27, 19);
        AddTextPrinterWithCallbackForMessage(gBoardNotInstalledMessage, 3, 15);
        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(113, 159);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].func = Task_WaitForSaveErrorAck;
        return;
    }
}

void Task_WaitForSaveErrorAck(u8 taskId)
{
    if (sub_8072080())
    {
        if (gMain.newKeys & A_BUTTON)
        {
            Reset(2, 14, 27, 19);
            gTasks[taskId].func = Task_CheckRtc;
        }
    }
}

void Task_CheckRtc(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        REG_WIN0H = 0;
        REG_WIN0V = 0;
        REG_WININ = 0x1111;
        REG_WINOUT = 49;
        REG_BLDCNT = 241;
        REG_BLDALPHA = 0;
        REG_BLDY = 7;

        if (!(RtcGetErrorStatus() & RTC_ERR_FLAG_MASK))
        {
            gTasks[taskId].func = Task_DrawMainMenu;
        }
        else
        {
            DrawDefaultWindow(2, 14, 27, 19);
            AddTextPrinterWithCallbackForMessage(gBatteryDryMessage, 3, 15);
            REG_WIN0H = WIN_RANGE(17, 223);
            REG_WIN0V = WIN_RANGE(113, 159);
            gTasks[taskId].func = Task_WaitForRtcErrorAck;
        }
    }
}

void Task_WaitForRtcErrorAck(u8 taskId)
{
    if (sub_8072080())
    {
        if ( gMain.newKeys & 1 )
        {
            Reset(2, 14, 27, 19);
            gTasks[taskId].func = Task_DrawMainMenu;
        }
    }
}

void Task_DrawMainMenu(u8 taskId)
{
    u16 palette;

    if (!gPaletteFade.active)
    {
        REG_WIN0H = 0;
        REG_WIN0V = 0;
        REG_WININ = 0x1111;
        REG_WINOUT = 49;
        REG_BLDCNT = 241;
        REG_BLDALPHA = 0;
        REG_BLDY = 7;

        palette = RGB(0, 0, 0);
        LoadPalette(&palette, 254, 2);

        if (gSaveBlock2.playerGender == MALE)
        {
            palette = RGB(4, 16, 31);
            LoadPalette(&palette, 241, 2);
        }
        else
        {
            palette = RGB(31, 3, 21);
            LoadPalette(&palette, 241, 2);
        }

        switch (gTasks[taskId].data[0])
        {
        case 0:
        default:
            DrawDefaultWindow(1, 0, 28, 3);
            PrintMainMenuItem(gMainMenuString_NewGame, 2, 1);
            DrawDefaultWindow(1, 4, 28, 7);
            PrintMainMenuItem(gMainMenuString_Option, 2, 5);
            break;
        case 1:
            DrawDefaultWindow(1, 0, 28, 7);
            PrintMainMenuItem(gMainMenuString_Continue, 2, 1);
            DrawDefaultWindow(1, 8, 28, 11);
            PrintMainMenuItem(gMainMenuString_NewGame, 2, 9);
            DrawDefaultWindow(1, 12, 28, 15);
            PrintMainMenuItem(gMainMenuString_Option, 2, 13);
            PrintSaveFileInfo();
            break;
        case 2:
            DrawDefaultWindow(1, 0, 28, 7);
            PrintMainMenuItem(gMainMenuString_Continue, 2, 1);
            DrawDefaultWindow(1, 8, 28, 11);
            PrintMainMenuItem(gMainMenuString_NewGame, 2, 9);
            DrawDefaultWindow(1, 12, 28, 15);
            PrintMainMenuItem(gMainMenuString_MysteryEvents, 2, 13);
            DrawDefaultWindow(1, 16, 28, 19);
            PrintMainMenuItem(gMainMenuString_Option, 2, 0x11);
            PrintSaveFileInfo();
            break;
        }

        gTasks[taskId].func = Task_HighlightCurrentMenuItem;
    }
}

void Task_HighlightCurrentMenuItem(u8 taskId)
{
    HighlightCurrentMenuItem(gTasks[taskId].data[0], gTasks[taskId].data[1]);
    gTasks[taskId].func = Task_MainMenuProcessKeyInput;
}

bool8 MainMenuProcessKeyInput(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
    {
        audio_play(SE_SELECT);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0x0000);
        gTasks[taskId].func = MainMenuPressedA;
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        audio_play(SE_SELECT);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0xFFFF);
        REG_WIN0H = WIN_RANGE(0, 240);
        REG_WIN0V = WIN_RANGE(0, 160);
        gTasks[taskId].func = MainMenuPressedB;
    }
    else
    {
        s32 menuItemCount;

        switch (gTasks[taskId].data[0])
        {
        case 0:
        default:
            menuItemCount = 2;
            break;
        case 1:
            menuItemCount = 3;
            break;
        case 2:
            menuItemCount = 4;
            break;
        }

        if (gMain.newKeys & DPAD_UP)
        {
            if (gTasks[taskId].data[1] > 0)
            {
                gTasks[taskId].data[1]--;
                return TRUE;
            }
        }
        if (gMain.newKeys & DPAD_DOWN)
        {
            if (gTasks[taskId].data[1] < menuItemCount - 1)
            {
                gTasks[taskId].data[1]++;
                return TRUE;
            }
        }
    }

    return FALSE;
}

void Task_MainMenuProcessKeyInput(u8 taskId)
{
    bool8 currentMenuItemChanged = MainMenuProcessKeyInput(taskId);
    if (currentMenuItemChanged)
        gTasks[taskId].func = Task_HighlightCurrentMenuItem;
}

void MainMenuPressedA(u8 taskId)
{
    enum
    {
        NEW_GAME,
        CONTINUE,
        OPTION,
        MYSTERY_EVENTS,
    } action;

    if (gPaletteFade.active)
        return;

    switch (gTasks[taskId].data[0])
    {
    case 0:
    default:
        switch (gTasks[taskId].data[1])
        {
        case 0:
        default:
            action = NEW_GAME;
            break;
        case 1:
            action = OPTION;
            break;
        }
        break;
    case 1:
        switch (gTasks[taskId].data[1])
        {
        case 0:
        default:
            action = CONTINUE;
            break;
        case 1:
            action = NEW_GAME;
            break;
        case 2:
            action = OPTION;
            break;
        }
        break;
    case 2:
        switch (gTasks[taskId].data[1])
        {
        case 0:
        default:
            action = CONTINUE;
            break;
        case 1:
            action = NEW_GAME;
            break;
        case 2:
            action = MYSTERY_EVENTS;
            break;
        case 3:
            action = OPTION;
            break;
        }
        break;
    }

    switch ((int)action)
    {
    case NEW_GAME:
    default:
        gPlttBufferUnfaded[0] = 0;
        gPlttBufferFaded[0] = 0;
        gTasks[taskId].func = Task_Birch1;
        break;
    case CONTINUE:
        gPlttBufferUnfaded[0] = 0;
        gPlttBufferFaded[0] = 0;
        SetMainCallback2(CB2_ContinueSavedGame);
        DestroyTask(taskId);
        break;
    case OPTION:
        gMain.field_8 = (u32)sub_80096FC;
        SetMainCallback2(CB2_InitOptionMenu);
        DestroyTask(taskId);
        break;
    case MYSTERY_EVENTS:
        SetMainCallback2(CB2_InitMysteryEventMenu);
        DestroyTask(taskId);
        break;
    }
}

void MainMenuPressedB(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(CB2_InitTitleScreen);
        DestroyTask(taskId);
    }
}

void HighlightCurrentMenuItem(u8 layout, u8 menuItem)
{
    REG_WIN0H = WIN_RANGE(9, 231);

    switch (layout)
    {
    case 0:
    default:
        switch (menuItem)
        {
        case 0:
        default:
            REG_WIN0V = WIN_RANGE(1, 31);
            break;
        case 1:
            REG_WIN0V = WIN_RANGE(33, 63);
            break;
        }
        break;
    case 1:
        switch (menuItem)
        {
        case 0:
        default:
            REG_WIN0V = WIN_RANGE(1, 63);
            break;
        case 1:
            REG_WIN0V = WIN_RANGE(65, 95);
            break;
        case 2:
            REG_WIN0V = WIN_RANGE(97, 127);
            break;
        }
        break;
    case 2:
        switch (menuItem)
        {
        case 0:
        default:
            REG_WIN0V = WIN_RANGE(1, 63);
            break;
        case 1:
            REG_WIN0V = WIN_RANGE(65, 95);
            break;
        case 2:
            REG_WIN0V = WIN_RANGE(97, 127);
            break;
        case 3:
            REG_WIN0V = WIN_RANGE(129, 159);
            break;
        }
        break;
    }
}

void PrintMainMenuItem(u8 *text, u8 left, u8 top)
{
    u8 i;
    u8 buffer[32];

    buffer[0] = 0xFC;
    buffer[1] = 1;
    buffer[2] = 14;

    for (i = 0; i < 26; i++)
        buffer[3 + i] = text[i];

    buffer[29] = EOS;

    Print(buffer, left, top);
}

void PrintSaveFileInfo(void)
{
    PrintPlayerName();
    PrintPokedexCount();
    PrintPlayTime();
    PrintBadgeCount();
}

void PrintPlayerName(void)
{
    Print(gMainMenuString_Player, 2, 3);
    Print(gSaveBlock2.playerName, 9, 3);
}

void PrintPlayTime(void)
{
    u8 playTime[16];
    u8 alignedPlayTime[32];

    Print(gMainMenuString_Time, 16, 3);
    FormatPlayTime(playTime, gSaveBlock2.playTimeHours, gSaveBlock2.playTimeMinutes, 1);
    sub_8072C74(alignedPlayTime, playTime, 48, 1);
    Print(alignedPlayTime, 22, 3);
}

void PrintPokedexCount(void)
{
    u8 buffer[16];

    Print(gMainMenuString_Pokedex, 2, 5);
    sub_8072C14(buffer, GetPokedexSeenCount(), 18, 0);
    Print(buffer, 9, 5);
}

void PrintBadgeCount(void)
{
    u8 buffer[16];

    Print(gMainMenuString_Badges, 16, 5);
    ConvertIntToDecimalString(buffer, GetBadgeCount());
    sub_80729D8(buffer, 205, 40, 1);
}
