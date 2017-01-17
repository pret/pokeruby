#include "global.h"
#include "main_menu.h"
#include "asm.h"
#include "decompress.h"
#include "event_data.h"
#include "menu.h"
#include "mystery_event_menu.h"
#include "option_menu.h"
#include "palette.h"
#include "rom4.h"
#include "rtc.h"
#include "save_menu_util.h"
#include "songs.h"
#include "sound.h"
#include "species.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "title_screen.h"

#define BirchSpeechUpdateWindowText() ((u8)MenuUpdateWindowText_OverrideLineLength(24))

struct MonCoords
{
    u8 x, y;
};

extern struct PaletteFadeControl gPaletteFade;

extern u16 gSaveFileStatus;

extern u16 gMainMenuPalette[];

extern const u8 gBirchSpeech_Welcome[];
extern const u8 gBirchSpeech_ThisIsPokemon[];
extern const u8 gBirchSpeech_WorldInhabitedByPokemon[];
extern const u8 gBirchSpeech_AndYouAre[];
extern const u8 gBirchSpeech_AreYouBoyOrGirl[];
extern const u8 gBirchSpeech_WhatsYourName[];
extern u8 gBirchSpeech_SoItsPlayer[];
extern u8 gBirchSpeech_AhOkayYouArePlayer[];
extern u8 gBirchSpeech_AreYouReady[];
extern u8 gSaveFileDeletedMessage[];
extern u8 gSaveFileCorruptMessage[];
extern u8 gBoardNotInstalledMessage[];
extern u8 gBatteryDryMessage[];
extern u8 gMainMenuString_Continue[];
extern u8 gMainMenuString_NewGame[];
extern u8 gMainMenuString_MysteryEvents[];
extern u8 gMainMenuString_Option[];
extern u8 gMainMenuString_Player[];
extern u8 gMainMenuString_Time[];
extern u8 gMainMenuString_Pokedex[];
extern u8 gMainMenuString_Badges[];

extern const struct MonCoords gMonFrontPicCoords[];
extern const struct SpriteSheet gMonFrontPicTable[];
extern const struct SpritePalette gMonPaletteTable[];
extern struct SpriteTemplate gUnknown_02024E8C;
extern void * const gUnknown_081FAF4C[];
extern u16 gUnknown_081E795C[];
extern const struct MenuAction gUnknown_081E79B0[];
extern const struct MenuAction gMalePresetNames[];
extern const struct MenuAction gFemalePresetNames[];

extern const u8 gUnknown_081E764C[];
extern const u8 gBirchIntroShadowGfx[];
extern const u8 gUnknown_081E7834[];
extern const u8 gUnknown_081E796C[];
extern const u8 gSystemText_NewPara[];

extern u8 gSpriteAffineAnimTable_81E79AC[];

extern u8 unk_2000000[];

//Task data
enum {
    TD_MENULAYOUT,
    TD_SELECTEDMENUITEM,
};

//Menu layouts
enum {
    HAS_NO_SAVED_GAME,  //NEW GAME, OPTION
    HAS_SAVED_GAME,     //CONTINUE, NEW GAME, OPTION
    HAS_MYSTERY_GIFT,   //CONTINUE, NEW GAME, MYSTERY EVENTS, OPTION
};

//Task data
enum {
    TD_TRAINER_SPRITE_ID = 2,       //Trainer sprite being displayed during gender menu
    TD_BGHOFS = 4,                  //Used to set REG_BG1HOFS and slide the platform around
    TD_SUBTASK_DONE,                //Set to true if the spawned task has finished
    TD_GENDER_SELECTION,
    TD_COUNTER,
    TD_BIRCH_SPRITE_ID,
    TD_AZURILL_SPRITE_ID,
    TD_BRENDAN_SPRITE_ID,
    TD_MAY_SPRITE_ID
};

static void CB2_MainMenu(void);
static void VBlankCB_MainMenu(void);
static void CB2_InitMainMenuFromOptions(void);
static u32 InitMainMenu(bool8 a1);
static void Task_MainMenuCheckSave(u8 taskId);
static void Task_MainMenuWaitForSaveErrorAck(u8 taskId);
static void Task_MainMenuCheckRtc(u8 taskId);
static void Task_MainMenuWaitForRtcErrorAck(u8 taskId);
static void Task_MainMenuDraw(u8 taskId);
static void Task_MainMenuHighlight(u8 taskId);
static bool8 MainMenuProcessKeyInput(u8 taskId);
static void Task_MainMenuProcessKeyInput(u8 taskId);
static void Task_MainMenuPressedA(u8 taskId);
static void Task_MainMenuPressedB(u8 taskId);
static void HighlightCurrentMenuItem(u8 layout, u8 menuItem);
static void PrintMainMenuItem(u8 *text, u8 left, u8 top);
static void PrintSaveFileInfo(void);
static void PrintPlayerName(void);
static void PrintPlayTime(void);
static void PrintPokedexCount(void);
static void PrintBadgeCount(void);
static void Task_NewGameSpeech1(u8 taskId);
static void Task_NewGameSpeech2(u8 taskId);
static void Task_NewGameSpeech3(u8 taskId);
static void Task_NewGameSpeech4(u8 taskId);
static void Task_NewGameSpeech5(u8 taskId);
static void Task_NewGameSpeech6(u8 taskId);
static void Task_NewGameSpeech7(u8 taskId);
static void Task_NewGameSpeech8(u8 taskId);
static void Task_NewGameSpeech9(u8 taskId);
static void Task_NewGameSpeech10(u8 taskId);
static void Task_NewGameSpeech11(u8 taskId);
static void Task_NewGameSpeech12(u8 taskId);
static void Task_NewGameSpeech13(u8 taskId);
static void Task_NewGameSpeech14(u8 taskId);
static void Task_NewGameSpeech15(u8 taskId);
static void Task_NewGameSpeech16(u8 taskId);
static void Task_NewGameSpeech17(u8 taskId);
static void Task_NewGameSpeech18(u8 taskId);
static void Task_NewGameSpeech19(u8 taskId);
static void Task_NewGameSpeech20(u8 taskId);
static void Task_NewGameSpeech21(u8 taskId);
static void Task_NewGameSpeech22(u8 taskId);
static void Task_NewGameSpeech23(u8 taskId);
static void Task_NewGameSpeech24(u8 taskId);
static void Task_NewGameSpeech25(u8 taskId);
static void Task_NewGameSpeech26(u8 taskId);
static void Task_NewGameSpeech27(u8 taskId);
static void Task_NewGameSpeech28(u8 taskId);
static void Task_NewGameSpeech29(u8 taskId);
static void Task_NewGameSpeech30(u8 taskId);
static void Task_NewGameSpeech31(u8 taskId);
static void Task_NewGameSpeech32(u8 taskId);
static void Task_NewGameSpeech33(u8 taskId);
static void CB_ContinueNewGameSpeechPart2();
static void nullsub_34(struct Sprite *sprite);
static void ShrinkPlayerSprite(struct Sprite *sprite);
static u8 CreateAzurillSprite(u8 x, u8 y);
static void AddBirchSpeechObjects(u8 taskId);
static void Task_SpriteFadeOut(u8 taskId);
static void StartSpriteFadeOut(u8 taskId, u8 interval);
static void Task_SpriteFadeIn(u8 taskId);
static void StartSpriteFadeIn(u8 taskId, u8 interval);
static void HandleFloorShadowFadeOut(u8 taskId);
static void StartBackgroundFadeOut(u8 taskId, u8 interval);
static void HandleFloorShadowFadeIn(u8 taskId);
static void StartBackgroundFadeIn(u8 taskId, u8 interval);
static void CreateGenderMenu(u8 left, u8 top);
static s8 GenderMenuProcessInput(void);
static void CreateNameMenu(u8 left, u8 top);
static s8 NameMenuProcessInput(void);
static void SetPresetPlayerName(u8 index);

static void CB2_MainMenu(void)
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

static void CB2_InitMainMenuFromOptions(void)
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
    InitMenuWindow((struct WindowConfig *)&gWindowConfig_81E6CE4);

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

    taskId = CreateTask(Task_MainMenuCheckSave, 0);
    gTasks[taskId].data[TD_SELECTEDMENUITEM] = 0;

    return 0;
}

void Task_MainMenuCheckSave(u8 taskId)
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
        if (IsMysteryGiftEnabled() == TRUE)
            gTasks[taskId].data[TD_MENULAYOUT] = HAS_MYSTERY_GIFT;
        else
            gTasks[taskId].data[TD_MENULAYOUT] = HAS_SAVED_GAME;

        gTasks[taskId].func = Task_MainMenuCheckRtc;
        break;
    case 2:
        MenuDrawTextWindow(2, 14, 27, 19);
        MenuPrintMessage(gSaveFileDeletedMessage, 3, 15);
        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(113, 159);
        gTasks[taskId].data[TD_MENULAYOUT] = HAS_NO_SAVED_GAME;
        gTasks[taskId].func = Task_MainMenuWaitForSaveErrorAck;
        break;
    case 255:
        MenuDrawTextWindow(2, 14, 27, 19);
        MenuPrintMessage(gSaveFileCorruptMessage, 3, 15);
        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(113, 159);
        gTasks[taskId].data[TD_MENULAYOUT] = HAS_SAVED_GAME;
        gTasks[taskId].func = Task_MainMenuWaitForSaveErrorAck;

        if (IsMysteryGiftEnabled() == TRUE)
            gTasks[taskId].data[TD_MENULAYOUT] = HAS_MYSTERY_GIFT;
        else
            gTasks[taskId].data[TD_MENULAYOUT] = HAS_SAVED_GAME;
        break;
    case 0:
    default:
        gTasks[taskId].data[TD_MENULAYOUT] = HAS_NO_SAVED_GAME;
        gTasks[taskId].func = Task_MainMenuCheckRtc;
        break;
    case 4:
        MenuDrawTextWindow(2, 14, 27, 19);
        MenuPrintMessage(gBoardNotInstalledMessage, 3, 15);
        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(113, 159);
        gTasks[taskId].data[TD_MENULAYOUT] = HAS_NO_SAVED_GAME;
        gTasks[taskId].func = Task_MainMenuWaitForSaveErrorAck;
        return;
    }
}

void Task_MainMenuWaitForSaveErrorAck(u8 taskId)
{
    if (MenuUpdateWindowText())
    {
        if (gMain.newKeys & A_BUTTON)
        {
            MenuZeroFillWindowRect(2, 14, 27, 19);
            gTasks[taskId].func = Task_MainMenuCheckRtc;
        }
    }
}

void Task_MainMenuCheckRtc(u8 taskId)
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
            gTasks[taskId].func = Task_MainMenuDraw;
        }
        else
        {
            MenuDrawTextWindow(2, 14, 27, 19);
            MenuPrintMessage(gBatteryDryMessage, 3, 15);
            REG_WIN0H = WIN_RANGE(17, 223);
            REG_WIN0V = WIN_RANGE(113, 159);
            gTasks[taskId].func = Task_MainMenuWaitForRtcErrorAck;
        }
    }
}

void Task_MainMenuWaitForRtcErrorAck(u8 taskId)
{
    if (MenuUpdateWindowText())
    {
        if ( gMain.newKeys & 1 )
        {
            MenuZeroFillWindowRect(2, 14, 27, 19);
            gTasks[taskId].func = Task_MainMenuDraw;
        }
    }
}

void Task_MainMenuDraw(u8 taskId)
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

        switch (gTasks[taskId].data[TD_MENULAYOUT])
        {
        case HAS_NO_SAVED_GAME:
        default:
            MenuDrawTextWindow(1, 0, 28, 3);
            PrintMainMenuItem(gMainMenuString_NewGame, 2, 1);
            MenuDrawTextWindow(1, 4, 28, 7);
            PrintMainMenuItem(gMainMenuString_Option, 2, 5);
            break;
        case HAS_SAVED_GAME:
            MenuDrawTextWindow(1, 0, 28, 7);
            PrintMainMenuItem(gMainMenuString_Continue, 2, 1);
            MenuDrawTextWindow(1, 8, 28, 11);
            PrintMainMenuItem(gMainMenuString_NewGame, 2, 9);
            MenuDrawTextWindow(1, 12, 28, 15);
            PrintMainMenuItem(gMainMenuString_Option, 2, 13);
            PrintSaveFileInfo();
            break;
        case HAS_MYSTERY_GIFT:
            MenuDrawTextWindow(1, 0, 28, 7);
            PrintMainMenuItem(gMainMenuString_Continue, 2, 1);
            MenuDrawTextWindow(1, 8, 28, 11);
            PrintMainMenuItem(gMainMenuString_NewGame, 2, 9);
            MenuDrawTextWindow(1, 12, 28, 15);
            PrintMainMenuItem(gMainMenuString_MysteryEvents, 2, 13);
            MenuDrawTextWindow(1, 16, 28, 19);
            PrintMainMenuItem(gMainMenuString_Option, 2, 0x11);
            PrintSaveFileInfo();
            break;
        }

        gTasks[taskId].func = Task_MainMenuHighlight;
    }
}

void Task_MainMenuHighlight(u8 taskId)
{
    HighlightCurrentMenuItem(gTasks[taskId].data[TD_MENULAYOUT], gTasks[taskId].data[TD_SELECTEDMENUITEM]);
    gTasks[taskId].func = Task_MainMenuProcessKeyInput;
}

bool8 MainMenuProcessKeyInput(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0x0000);
        gTasks[taskId].func = Task_MainMenuPressedA;
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        PlaySE(SE_SELECT);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 0x10, 0xFFFF);
        REG_WIN0H = WIN_RANGE(0, 240);
        REG_WIN0V = WIN_RANGE(0, 160);
        gTasks[taskId].func = Task_MainMenuPressedB;
    }
    else
    {
        s32 menuItemCount;

        switch (gTasks[taskId].data[TD_MENULAYOUT])
        {
        case HAS_NO_SAVED_GAME:
        default:
            menuItemCount = 2;
            break;
        case HAS_SAVED_GAME:
            menuItemCount = 3;
            break;
        case HAS_MYSTERY_GIFT:
            menuItemCount = 4;
            break;
        }

        if (gMain.newKeys & DPAD_UP)
        {
            if (gTasks[taskId].data[TD_SELECTEDMENUITEM] > 0)
            {
                gTasks[taskId].data[TD_SELECTEDMENUITEM]--;
                return TRUE;
            }
        }
        if (gMain.newKeys & DPAD_DOWN)
        {
            if (gTasks[taskId].data[TD_SELECTEDMENUITEM] < menuItemCount - 1)
            {
                gTasks[taskId].data[TD_SELECTEDMENUITEM]++;
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
        gTasks[taskId].func = Task_MainMenuHighlight;
}

void Task_MainMenuPressedA(u8 taskId)
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

    switch (gTasks[taskId].data[TD_MENULAYOUT])
    {
    case HAS_NO_SAVED_GAME:
    default:
        switch (gTasks[taskId].data[TD_SELECTEDMENUITEM])
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
    case HAS_SAVED_GAME:
        switch (gTasks[taskId].data[TD_SELECTEDMENUITEM])
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
    case HAS_MYSTERY_GIFT:
        switch (gTasks[taskId].data[TD_SELECTEDMENUITEM])
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
        gTasks[taskId].func = Task_NewGameSpeech1;
        break;
    case CONTINUE:
        gPlttBufferUnfaded[0] = 0;
        gPlttBufferFaded[0] = 0;
        SetMainCallback2(CB2_ContinueSavedGame);
        DestroyTask(taskId);
        break;
    case OPTION:
        gMain.savedCallback = CB2_InitMainMenuFromOptions;
        SetMainCallback2(CB2_InitOptionMenu);
        DestroyTask(taskId);
        break;
    case MYSTERY_EVENTS:
        SetMainCallback2(CB2_InitMysteryEventMenu);
        DestroyTask(taskId);
        break;
    }
}

void Task_MainMenuPressedB(u8 taskId)
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
    case HAS_NO_SAVED_GAME:
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
    case HAS_SAVED_GAME:
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
    case HAS_MYSTERY_GIFT:
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

    MenuPrint(buffer, left, top);
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
    MenuPrint(gMainMenuString_Player, 2, 3);
    MenuPrint(gSaveBlock2.playerName, 9, 3);
}

void PrintPlayTime(void)
{
    u8 playTime[16];
    u8 alignedPlayTime[32];

    MenuPrint_PixelCoords(gMainMenuString_Time, 124, 24, TRUE);
    FormatPlayTime(playTime, gSaveBlock2.playTimeHours, gSaveBlock2.playTimeMinutes, 1);
    sub_8072C74(alignedPlayTime, playTime, 40, 1);
    MenuPrint(alignedPlayTime, 23, 3);
}

void PrintPokedexCount(void)
{
    u8 buffer[16];

    MenuPrint(gMainMenuString_Pokedex, 2, 5);
    sub_8072C14(buffer, GetPokedexSeenCount(), 18, 0);
    MenuPrint(buffer, 9, 5);
}

void PrintBadgeCount(void)
{
    u8 buffer[16];

    MenuPrint_PixelCoords(gMainMenuString_Badges, 124, 40, TRUE);
    ConvertIntToDecimalString(buffer, GetBadgeCount());
    MenuPrint_PixelCoords(buffer, 205, 40, 1);
}

static void Task_NewGameSpeech1(u8 taskId)
{
    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    InitMenuWindow((struct WindowConfig *)&gWindowConfig_81E6CE4);
    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_WININ = 0;
    REG_WINOUT = 0;
    REG_BLDCNT = 0;
    REG_BLDALPHA = 0;
    REG_BLDY = 0;
    LZ77UnCompVram(gBirchIntroShadowGfx, (void *)BG_VRAM);
    LZ77UnCompVram(gUnknown_081E7834, (void *)(BG_VRAM + 0x3800));
    LoadPalette(gUnknown_081E764C, 0, 0x40);
    LoadPalette(gUnknown_081E796C, 1, 0x10);
    remove_some_task();
    ResetSpriteData();
    FreeAllSpritePalettes();
    AddBirchSpeechObjects(taskId);
    BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
    REG_BG1CNT = 0x00000703;
    REG_DISPCNT = DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_OBJ_ON | DISPCNT_OBJ_1D_MAP;
    gTasks[taskId].data[TD_BGHOFS] = 0;
    gTasks[taskId].func = Task_NewGameSpeech2;
    gTasks[taskId].data[TD_TRAINER_SPRITE_ID] = 0xFF;
    gTasks[taskId].data[3] = 0xFF;
    gTasks[taskId].data[TD_COUNTER] = 216;  //Wait 3.6 seconds (216 frames) before starting speech

    PlayBGM(BGM_DOORO_X4);
}

static void Task_NewGameSpeech2(u8 taskId)
{
    if (gTasks[taskId].data[TD_COUNTER] != 0)
    {
        gTasks[taskId].data[TD_COUNTER]--;
    }
    else
    {
        //Initialize Birch sprite
        u8 spriteId = gTasks[taskId].data[TD_BIRCH_SPRITE_ID];

        gSprites[spriteId].pos1.x = 136;
        gSprites[spriteId].pos1.y = 60;
        gSprites[spriteId].invisible = 0;
        gSprites[spriteId].oam.objMode = ST_OAM_OBJ_BLEND;
        StartSpriteFadeIn(taskId, 10);
        StartBackgroundFadeIn(taskId, 20);
        gTasks[taskId].data[TD_COUNTER] = 80;
        gTasks[taskId].func = Task_NewGameSpeech3;
    }
}

static void Task_NewGameSpeech3(u8 taskId)
{
    if (gTasks[taskId].data[TD_SUBTASK_DONE] != FALSE)
    {
        gSprites[gTasks[taskId].data[TD_BIRCH_SPRITE_ID]].oam.objMode = ST_OAM_OBJ_NORMAL;
        if (gTasks[taskId].data[TD_COUNTER])
        {
            gTasks[taskId].data[TD_COUNTER]--;
        }
        else
        {
            MenuDrawTextWindow(2, 13, 27, 18);
            //"Hi! Sorry to keep you waiting...
            //...But everyone calls me the POKEMON PROFESSOR."
            MenuPrintMessage(gBirchSpeech_Welcome, 3, 14);
            gTasks[taskId].func = Task_NewGameSpeech4;
        }
    }
}

static void Task_NewGameSpeech4(u8 taskId)
{
    if (!gPaletteFade.active && BirchSpeechUpdateWindowText())
    {
        gTasks[taskId].func = Task_NewGameSpeech5;
        //"This is what we call a POKEMON."
        MenuPrintMessage(gBirchSpeech_ThisIsPokemon, 3, 14);
    }
}

static void Task_NewGameSpeech5(u8 taskId)
{
    if (BirchSpeechUpdateWindowText())
        gTasks[taskId].func = Task_NewGameSpeech6;
}

static void Task_NewGameSpeech6(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[TD_AZURILL_SPRITE_ID];

    gSprites[spriteId].pos1.x = 104;
    gSprites[spriteId].pos1.y = 72;
    gSprites[spriteId].invisible = 0;
    gSprites[spriteId].data0 = 0;
    CreatePokeballSprite(spriteId, gSprites[spriteId].oam.paletteNum, 0x70, 0x3A, 0, 0, 0x20, 0x0000FFFF);
    gTasks[taskId].func = Task_NewGameSpeech7;
    gTasks[taskId].data[TD_COUNTER] = 0;
}

static void Task_NewGameSpeech7(u8 taskId)
{
    if (IsCryFinished())
    {
        //Go on to next sentence after frame 95
        if (gTasks[taskId].data[TD_COUNTER] > 95)
        {
            MenuSetText(gSystemText_NewPara);
            gTasks[taskId].func = Task_NewGameSpeech8;
        }
    }

    if (gTasks[taskId].data[TD_COUNTER] < 16384)
    {
        gTasks[taskId].data[TD_COUNTER]++;
        //Play Azurill cry at frame 32
        if (gTasks[taskId].data[TD_COUNTER] == 32)
            PlayCry1(SPECIES_AZURILL, 0);
    }
}

static void Task_NewGameSpeech8(u8 taskId)
{
    if (BirchSpeechUpdateWindowText())
    {
        //"This world is widely inhabited by POKEMON...
        //...That's what I do."
        MenuPrintMessage(gBirchSpeech_WorldInhabitedByPokemon, 3, 14);
        gTasks[taskId].func = Task_NewGameSpeech9;
    }
}

static void Task_NewGameSpeech9(u8 taskId)
{
    if (BirchSpeechUpdateWindowText())
    {
        MenuDrawTextWindow(2, 13, 27, 18);
        //"And you are?"
        MenuPrintMessage(gBirchSpeech_AndYouAre, 3, 14);
        gTasks[taskId].func = Task_NewGameSpeech10;
    }
}

static void Task_NewGameSpeech10(u8 taskId)
{
    if (BirchSpeechUpdateWindowText())
    {
        gSprites[gTasks[taskId].data[TD_BIRCH_SPRITE_ID]].oam.objMode = ST_OAM_OBJ_BLEND;
        gSprites[gTasks[taskId].data[TD_AZURILL_SPRITE_ID]].oam.objMode = ST_OAM_OBJ_BLEND;
        StartSpriteFadeOut(taskId, 2);
        StartBackgroundFadeOut(taskId, 1);
        gTasks[taskId].data[TD_COUNTER] = 64;
        gTasks[taskId].func = Task_NewGameSpeech11;
    }
}

//Slide platform away to the right
static void Task_NewGameSpeech11(u8 taskId)
{
    if (gTasks[taskId].data[TD_BGHOFS] != -60)
    {
        gTasks[taskId].data[TD_BGHOFS] -= 2;
        REG_BG1HOFS = gTasks[taskId].data[TD_BGHOFS];
    }
    else
    {
        gTasks[taskId].data[TD_BGHOFS] = -60;
        gTasks[taskId].func = Task_NewGameSpeech12;
    }
}

static void Task_NewGameSpeech12(u8 taskId)
{
    if (gTasks[taskId].data[TD_SUBTASK_DONE])
    {
        //Hide Birch and Azurill
        gSprites[gTasks[taskId].data[TD_BIRCH_SPRITE_ID]].invisible = TRUE;
        gSprites[gTasks[taskId].data[TD_AZURILL_SPRITE_ID]].invisible = TRUE;

        if (gTasks[taskId].data[TD_COUNTER])
        {
            gTasks[taskId].data[TD_COUNTER]--;
        }
        else
        {
            //Initialize Brendan sprite
            u8 spriteId = gTasks[taskId].data[TD_BRENDAN_SPRITE_ID];

            gSprites[spriteId].pos1.x = 180;
            gSprites[spriteId].pos1.y = 60;
            gSprites[spriteId].invisible = FALSE;
            gSprites[spriteId].oam.objMode = ST_OAM_OBJ_BLEND;
            gTasks[taskId].data[TD_TRAINER_SPRITE_ID] = spriteId;
            gTasks[taskId].data[TD_GENDER_SELECTION] = 0;
            StartSpriteFadeIn(taskId, 2);
            StartBackgroundFadeIn(taskId, 1);
            gTasks[taskId].func = Task_NewGameSpeech13;
        }
    }
}

static void Task_NewGameSpeech13(u8 taskId)
{
    if (gTasks[taskId].data[TD_SUBTASK_DONE])
    {
        gSprites[gTasks[taskId].data[TD_TRAINER_SPRITE_ID]].oam.objMode = ST_OAM_OBJ_NORMAL;
        gTasks[taskId].func = Task_NewGameSpeech14;
    }
}

static void Task_NewGameSpeech14(u8 taskId)
{
    MenuDrawTextWindow(2, 13, 27, 18);
    //"Are you a boy? Or are you a girl?"
    MenuPrintMessage(gBirchSpeech_AreYouBoyOrGirl, 3, 14);
    gTasks[taskId].func = Task_NewGameSpeech15;
}

static void Task_NewGameSpeech15(u8 taskId)
{
    if (BirchSpeechUpdateWindowText())
    {
        CreateGenderMenu(2, 4);
        gTasks[taskId].func = Task_NewGameSpeech16;
    }
}

//Process gender menu
static void Task_NewGameSpeech16(u8 taskId)
{
    u8 cursorPos;

    switch (GenderMenuProcessInput())
    {
    case MALE:
        sub_8072DEC();
        PlaySE(SE_SELECT);
        gSaveBlock2.playerGender = MALE;
        MenuZeroFillWindowRect(2, 4, 8, 9);
        gTasks[taskId].func = Task_NewGameSpeech19;
        break;
    case FEMALE:
        sub_8072DEC();
        PlaySE(SE_SELECT);
        gSaveBlock2.playerGender = FEMALE;
        MenuZeroFillWindowRect(2, 4, 8, 9);
        gTasks[taskId].func = Task_NewGameSpeech19;
        break;
    }

    cursorPos = GetMenuCursorPos();

    if (cursorPos != gTasks[taskId].data[TD_GENDER_SELECTION])
    {
        //Menu selection changed. Slide Brendan or May out and slide the other in
        gTasks[taskId].data[TD_GENDER_SELECTION] = cursorPos;
        gSprites[gTasks[taskId].data[TD_TRAINER_SPRITE_ID]].oam.objMode = ST_OAM_OBJ_BLEND;
        StartSpriteFadeOut(taskId, 0);
        gTasks[taskId].func = Task_NewGameSpeech17;
    }
}

//Slide old trainer sprite off right of screen
static void Task_NewGameSpeech17(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[TD_TRAINER_SPRITE_ID];

    if (gTasks[taskId].data[TD_SUBTASK_DONE] == FALSE)
    {
        gSprites[spriteId].pos1.x += 4;     //Move sprite right
    }
    else
    {
        gSprites[spriteId].invisible = TRUE;

        //Set up new trainer sprite
        if (gTasks[taskId].data[TD_GENDER_SELECTION])
            spriteId = gTasks[taskId].data[TD_MAY_SPRITE_ID];
        else
            spriteId = gTasks[taskId].data[TD_BRENDAN_SPRITE_ID];
        gSprites[spriteId].pos1.x = 240;
        gSprites[spriteId].pos1.y = 60;
        gSprites[spriteId].invisible = FALSE;
        gTasks[taskId].data[TD_TRAINER_SPRITE_ID] = spriteId;
        gSprites[spriteId].oam.objMode = ST_OAM_OBJ_BLEND;
        StartSpriteFadeIn(taskId, 0);
        gTasks[taskId].func = Task_NewGameSpeech18;
    }
}

//Slide new trainer sprite from right of screen
static void Task_NewGameSpeech18(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[TD_TRAINER_SPRITE_ID];

    if (gSprites[spriteId].pos1.x > 180)
    {
        gSprites[spriteId].pos1.x -= 4;     //Move sprite left
    }
    else
    {
        gSprites[spriteId].pos1.x = 180;
        if (gTasks[taskId].data[TD_SUBTASK_DONE])
        {
            gSprites[spriteId].oam.objMode = ST_OAM_OBJ_NORMAL;
            gTasks[taskId].func = Task_NewGameSpeech16; //Go back to gender menu
        }
    }
}

static void Task_NewGameSpeech19(u8 taskId)
{
    MenuDrawTextWindow(2, 13, 27, 18);
    //"All right. What's your name?"
    MenuPrintMessage(gBirchSpeech_WhatsYourName, 3, 14);
    gTasks[taskId].func = Task_NewGameSpeech20;
}

static void Task_NewGameSpeech20(u8 taskId)
{
    if (BirchSpeechUpdateWindowText())
    {
        CreateNameMenu(2, 1);
        gTasks[taskId].func = Task_NewGameSpeech21;
    }
}

//Handle name menu selection
static void Task_NewGameSpeech21(u8 taskId)
{
    s8 selection = NameMenuProcessInput();

    switch (selection)
    {
    case 1:     //preset names
    case 2:
    case 3:
    case 4:
        sub_8072DEC();
        PlaySE(SE_SELECT);
        MenuZeroFillWindowRect(2, 1, 22, 12);
        SetPresetPlayerName(selection);
        gTasks[taskId].func = Task_NewGameSpeech23;
        break;
    case 0:     //NEW NAME
        PlaySE(SE_SELECT);
        BeginNormalPaletteFade(-1, 0, 0, 16, 0);
        gTasks[taskId].func = Task_NewGameSpeech22;
        break;
    case -1:    //B button
        sub_8072DEC();
        PlaySE(SE_SELECT);
        MenuZeroFillWindowRect(2, 1, 22, 12);
        gTasks[taskId].func = Task_NewGameSpeech14;     //Go back to gender menu
        break;
    }
}

//Open naming screen
static void Task_NewGameSpeech22(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        SetPresetPlayerName(1);
        DoNamingScreen(0, &gSaveBlock2, gSaveBlock2.playerGender, 0, 0, CB_ContinueNewGameSpeechPart2);
    }
}

static void Task_NewGameSpeech23(u8 taskId)
{
    MenuDrawTextWindow(2, 13, 27, 18);
    //"So it's (PLAYER)?"
    StringExpandPlaceholders(gStringVar4, gBirchSpeech_SoItsPlayer);
    MenuPrintMessage(gStringVar4, 3, 14);
    gTasks[taskId].func = Task_NewGameSpeech24;
}

static void Task_NewGameSpeech24(u8 taskId)
{
    if (BirchSpeechUpdateWindowText())
    {
        DisplayYesNoMenu(2, 1, 1);
        gTasks[taskId].func = Task_NewGameSpeech25;
    }
}

//Handle yes/no menu selection
static void Task_NewGameSpeech25(u8 taskId)
{
    switch (ProcessMenuInputNoWrap_())
    {
    case 0:     //YES
        PlaySE(SE_SELECT);
        MenuZeroFillWindowRect(2, 1, 8, 7);
        gSprites[gTasks[taskId].data[TD_TRAINER_SPRITE_ID]].oam.objMode = ST_OAM_OBJ_BLEND;
        StartSpriteFadeOut(taskId, 2);
        StartBackgroundFadeOut(taskId, 1);
        gTasks[taskId].func = Task_NewGameSpeech26;     //Continue
        break;
    case -1:    //B button
    case 1:     //NO
        PlaySE(SE_SELECT);
        MenuZeroFillWindowRect(2, 1, 8, 7);
        gTasks[taskId].func = Task_NewGameSpeech14;     //Go back to gender menu
        break;
    }
}

static void Task_NewGameSpeech26(u8 taskId)
{
    if (gTasks[taskId].data[TD_BGHOFS])
    {
        gTasks[taskId].data[TD_BGHOFS] += 2;
        REG_BG1HOFS = gTasks[taskId].data[TD_BGHOFS];
    }
    else
    {
        gTasks[taskId].func = Task_NewGameSpeech27;
    }
}

static void Task_NewGameSpeech27(u8 taskId)
{
    if (gTasks[taskId].data[TD_SUBTASK_DONE])
    {
        s16 spriteId;

        //Hide Brendan and May sprites
        spriteId = gTasks[taskId].data[TD_BRENDAN_SPRITE_ID];
        gSprites[spriteId].invisible = TRUE;
        spriteId = gTasks[taskId].data[TD_MAY_SPRITE_ID];
        gSprites[spriteId].invisible = TRUE;

        //Fade in Birch and Azurill
        spriteId = (u8)gTasks[taskId].data[TD_BIRCH_SPRITE_ID];
        gSprites[spriteId].pos1.x = 136;
        gSprites[spriteId].pos1.y = 64;
        gSprites[spriteId].invisible = FALSE;
        gSprites[spriteId].oam.objMode = ST_OAM_OBJ_BLEND;
        spriteId = (u8)gTasks[taskId].data[TD_AZURILL_SPRITE_ID];
        gSprites[spriteId].pos1.x = 104;
        gSprites[spriteId].pos1.y = 72;
        gSprites[spriteId].invisible = FALSE;
        gSprites[spriteId].oam.objMode = ST_OAM_OBJ_BLEND;

        StartSpriteFadeIn(taskId, 2);
        StartBackgroundFadeIn(taskId, 1);
        MenuDrawTextWindow(2, 13, 27, 18);
        StringExpandPlaceholders(gStringVar4, gBirchSpeech_AhOkayYouArePlayer);
        //"Ah, okay! You're (PLAYER) who's moving...
        //...I get it now!"
        MenuPrintMessage(gStringVar4, 3, 14);
        gTasks[taskId].func = Task_NewGameSpeech28;
    }
}

static void Task_NewGameSpeech28(u8 taskId)
{
    if (gTasks[taskId].data[TD_SUBTASK_DONE])
    {
        s16 spriteId;

        spriteId = gTasks[taskId].data[TD_BIRCH_SPRITE_ID];
        gSprites[spriteId].oam.objMode = ST_OAM_OBJ_NORMAL;

        spriteId = gTasks[taskId].data[TD_AZURILL_SPRITE_ID];
        gSprites[spriteId].oam.objMode = ST_OAM_OBJ_NORMAL;

        if (BirchSpeechUpdateWindowText())
        {
            //Fade out Birch and Azurill
            spriteId = gTasks[taskId].data[TD_BIRCH_SPRITE_ID];
            gSprites[spriteId].oam.objMode = ST_OAM_OBJ_BLEND;
            spriteId = gTasks[taskId].data[TD_AZURILL_SPRITE_ID];
            gSprites[spriteId].oam.objMode = ST_OAM_OBJ_BLEND;

            StartSpriteFadeOut(taskId, 2);
            StartBackgroundFadeOut(taskId, 1);
            gTasks[taskId].data[TD_COUNTER] = 64;
            gTasks[taskId].func = Task_NewGameSpeech29;
        }
    }
}

static void Task_NewGameSpeech29(u8 taskId)
{
    if (gTasks[taskId].data[TD_SUBTASK_DONE])
    {
        s16 spriteId;

        //Hide Birch and Azurill
        spriteId = gTasks[taskId].data[TD_BIRCH_SPRITE_ID];
        gSprites[spriteId].invisible = TRUE;
        spriteId = gTasks[taskId].data[TD_AZURILL_SPRITE_ID];
        gSprites[spriteId].invisible = TRUE;

        if (gTasks[taskId].data[TD_COUNTER])
        {
            gTasks[taskId].data[TD_COUNTER]--;
        }
        else
        {
            u8 spriteId;

            //Fade in trainer and background
            if (gSaveBlock2.playerGender)
                spriteId = (u8)gTasks[taskId].data[TD_MAY_SPRITE_ID];
            else
                spriteId = (u8)gTasks[taskId].data[TD_BRENDAN_SPRITE_ID];
            gSprites[spriteId].pos1.x = 120;
            gSprites[spriteId].pos1.y = 60;
            gSprites[spriteId].invisible = FALSE;
            gSprites[spriteId].oam.objMode = ST_OAM_OBJ_BLEND;
            gTasks[taskId].data[TD_TRAINER_SPRITE_ID] = spriteId;

            StartSpriteFadeIn(taskId, 2);
            StartBackgroundFadeIn(taskId, 1);
            MenuDrawTextWindow(2, 13, 27, 18);
            MenuPrintMessage(gBirchSpeech_AreYouReady, 3, 14);
            gTasks[taskId].func = Task_NewGameSpeech30;
        }
    }
}

static void Task_NewGameSpeech30(u8 taskId)
{
    if (gTasks[taskId].data[TD_SUBTASK_DONE])
    {
        s16 spriteId;

        spriteId = gTasks[taskId].data[TD_TRAINER_SPRITE_ID];
        gSprites[spriteId].oam.objMode = ST_OAM_OBJ_NORMAL;

        if (BirchSpeechUpdateWindowText())
        {
            u8 spriteId;

            spriteId = gTasks[taskId].data[TD_TRAINER_SPRITE_ID];
            gSprites[spriteId].oam.affineMode = 1;
            gSprites[spriteId].affineAnims = (union AffineAnimCmd **)gSpriteAffineAnimTable_81E79AC;
            InitSpriteAffineAnim(&gSprites[spriteId]);
            StartSpriteAffineAnim(&gSprites[spriteId], 0);
            gSprites[spriteId].callback = ShrinkPlayerSprite;
            BeginNormalPaletteFade(0x0000FFFF, 0, 0, 0x10, 0);
            FadeOutBGM(4);
            gTasks[taskId].func = Task_NewGameSpeech31;
        }
    }
}

static void Task_NewGameSpeech31(u8 taskId)
{
    u8 spriteId = gTasks[taskId].data[TD_TRAINER_SPRITE_ID];

    if (gSprites[spriteId].affineAnimEnded)
        gTasks[taskId].func = Task_NewGameSpeech32;
}

static void Task_NewGameSpeech32(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        u8 spriteId = gTasks[taskId].data[TD_TRAINER_SPRITE_ID];
        gSprites[spriteId].callback = nullsub_34;
        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_OBJ_ON;
        BeginNormalPaletteFade(0xFFFF0000, 0, 0, 0x10, 0xFFFF);
        gTasks[taskId].func = Task_NewGameSpeech33;
    }
}

static void Task_NewGameSpeech33(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        //We're finished setting up. Start the new game!
        SetMainCallback2(CB2_NewGame);
        DestroyTask(taskId);
    }
}

// Re-initializes graphics state after running the naming screen
// and continues the new game speech
void CB_ContinueNewGameSpeechPart2()
{
    u8 taskId;
    u8 spriteId;
    u16 savedIme;

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
    DmaFill16(3, 0, (void *)PLTT, PLTT_SIZE);

    ResetPaletteFade();

    LZ77UnCompVram(gBirchIntroShadowGfx, (void *)BG_VRAM);
    LZ77UnCompVram(gUnknown_081E7834, (void *)(BG_VRAM + 0x3800));

    LoadPalette(gUnknown_081E764C, 0, 0x40);

    ResetTasks();

    taskId = CreateTask(Task_NewGameSpeech23, 0);

    gTasks[taskId].data[TD_BGHOFS] = -60;

    remove_some_task();
    ResetSpriteData();
    FreeAllSpritePalettes();
    AddBirchSpeechObjects(taskId);

    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    InitMenuWindow((struct WindowConfig *)&gWindowConfig_81E6CE4);

    if (gSaveBlock2.playerGender != MALE)
    {
        gTasks[taskId].data[TD_GENDER_SELECTION] = FEMALE;
        spriteId = gTasks[taskId].data[TD_MAY_SPRITE_ID];
    }
    else
    {
        gTasks[taskId].data[TD_GENDER_SELECTION] = MALE;
        spriteId = gTasks[taskId].data[TD_BRENDAN_SPRITE_ID];
    }

    gSprites[spriteId].pos1.x = 180;
    gSprites[spriteId].pos1.y = 60;
    gSprites[spriteId].invisible = FALSE;

    gTasks[taskId].data[TD_TRAINER_SPRITE_ID] = spriteId;

    REG_BG1HOFS = -60;

    BeginNormalPaletteFade(0xFFFFFFFFu, 0, 0x10, 0, 0);

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
    REG_BG1CNT = 1795;
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP |
      DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_OBJ_ON;
}

void nullsub_34(struct Sprite *sprite)
{
}

void ShrinkPlayerSprite(struct Sprite *sprite)
{
    u32 y = (sprite->pos1.y << 16) + sprite->data0 + 0xC000;
    sprite->pos1.y = y >> 16;
    sprite->data0 = y;
}

u8 CreateAzurillSprite(u8 x, u8 y)
{
    DecompressPicFromTable_2(
        &gMonFrontPicTable[SPECIES_AZURILL],
        gMonFrontPicCoords[SPECIES_AZURILL].x,
        gMonFrontPicCoords[SPECIES_AZURILL].y,
        gUnknown_081FAF4C[0],
        gUnknown_081FAF4C[1],
        SPECIES_AZURILL);
    LoadCompressedObjectPalette(&gMonPaletteTable[SPECIES_AZURILL]);
    GetMonSpriteTemplate_803C56C(SPECIES_AZURILL, 1);
    return CreateSprite(&gUnknown_02024E8C, x, y, 0);
}

void AddBirchSpeechObjects(u8 taskId)
{
    u8 spriteId;

    spriteId = CreateBirchSprite(136, 60, 1);
    gSprites[spriteId].callback = nullsub_34;
    gSprites[spriteId].oam.priority = 0;
    gSprites[spriteId].invisible = 1;
    gTasks[taskId].data[TD_BIRCH_SPRITE_ID] = spriteId;

    spriteId = CreateAzurillSprite(0x68, 0x48);
    gSprites[spriteId].callback = nullsub_34;
    gSprites[spriteId].oam.priority = 0;
    gSprites[spriteId].invisible = 1;
    gTasks[taskId].data[TD_AZURILL_SPRITE_ID] = spriteId;

    //Create Brendan sprite
    spriteId = CreateTrainerSprite_BirchSpeech(0, 120, 60, 0, unk_2000000);
    gSprites[spriteId].callback = nullsub_34;
    gSprites[spriteId].invisible = 1;
    gSprites[spriteId].oam.priority = 0;
    gTasks[taskId].data[TD_BRENDAN_SPRITE_ID] = spriteId;

    //Create May sprite
    spriteId = CreateTrainerSprite_BirchSpeech(1, 120, 60, 0, unk_2000000 + 0x800);
    gSprites[spriteId].callback = nullsub_34;
    gSprites[spriteId].invisible = 1;
    gSprites[spriteId].oam.priority = 0;
    gTasks[taskId].data[TD_MAY_SPRITE_ID] = spriteId;
}

enum {
    TD_PARENT_TASK_ID,
    TD_EVA,             //EVA coefficient of REG_BLDALPHA
    TD_EVB,             //EVB coefficient of REG_BLDALPHA
    TD_INTERVAL,
    TD_FRAMECOUNTER
};

static void Task_SpriteFadeOut(u8 taskId)
{
    if (gTasks[taskId].data[TD_EVA] == 0)
    {
        gTasks[gTasks[taskId].data[TD_PARENT_TASK_ID]].data[TD_SUBTASK_DONE] = TRUE;
        DestroyTask(taskId);
    }
    else
    {
        if (gTasks[taskId].data[TD_FRAMECOUNTER])
        {
            gTasks[taskId].data[TD_FRAMECOUNTER]--;
        }
        else
        {
            gTasks[taskId].data[TD_FRAMECOUNTER] = gTasks[taskId].data[TD_INTERVAL];
            gTasks[taskId].data[TD_EVA]--;
            gTasks[taskId].data[TD_EVB]++;
            REG_BLDALPHA = gTasks[taskId].data[TD_EVA] + (gTasks[taskId].data[TD_EVB] * 256);
        }
    }
}

//Launches a helper task to fade out sprites
static void StartSpriteFadeOut(u8 taskId, u8 interval)
{
    u8 newTaskId;

    REG_BLDCNT = 592;
    REG_BLDALPHA = 16;
    REG_BLDY = 0;
    gTasks[taskId].data[TD_SUBTASK_DONE] = FALSE;
    newTaskId = CreateTask(Task_SpriteFadeOut, 0);

    gTasks[newTaskId].data[TD_PARENT_TASK_ID] = taskId;
    gTasks[newTaskId].data[TD_EVA] = 16;
    gTasks[newTaskId].data[TD_EVB] = 0;
    gTasks[newTaskId].data[TD_INTERVAL] = interval;
    gTasks[newTaskId].data[TD_FRAMECOUNTER] = interval;
}

static void Task_SpriteFadeIn(u8 taskId)
{
    if (gTasks[taskId].data[TD_EVA] == 16)
    {
        gTasks[gTasks[taskId].data[TD_PARENT_TASK_ID]].data[TD_SUBTASK_DONE] = TRUE;
        DestroyTask(taskId);
    }
    else if (gTasks[taskId].data[TD_FRAMECOUNTER])
    {
        gTasks[taskId].data[TD_FRAMECOUNTER]--;
    }
    else
    {
        gTasks[taskId].data[TD_FRAMECOUNTER] = gTasks[taskId].data[TD_INTERVAL];
        gTasks[taskId].data[TD_EVA]++;
        gTasks[taskId].data[TD_EVB]--;
        REG_BLDALPHA = gTasks[taskId].data[TD_EVA] + (gTasks[taskId].data[TD_EVB] * 256);
    }
}

//Launches a helper task to fade in sprites
static void StartSpriteFadeIn(u8 taskId, u8 interval)
{
    u8 newTaskId;

    REG_BLDCNT = 592;
    REG_BLDALPHA = 4096;
    REG_BLDY = 0;
    gTasks[taskId].data[TD_SUBTASK_DONE] = FALSE;
    newTaskId = CreateTask(Task_SpriteFadeIn, 0);

    gTasks[newTaskId].data[TD_PARENT_TASK_ID] = taskId;
    gTasks[newTaskId].data[TD_EVA] = 0;
    gTasks[newTaskId].data[TD_EVB] = 16;
    gTasks[newTaskId].data[TD_INTERVAL] = interval;
    gTasks[newTaskId].data[TD_FRAMECOUNTER] = interval;
}

enum {
    TD_FADELEVEL = 1,
    TD_DELAY,
};

static void HandleFloorShadowFadeOut(u8 taskId)
{
    if (gTasks[taskId].data[TD_DELAY])
        gTasks[taskId].data[TD_DELAY]--;
    else
    {
        if (gTasks[taskId].data[TD_FADELEVEL] == 8)
            DestroyTask(taskId);
        else if (gTasks[taskId].data[TD_FRAMECOUNTER])
            gTasks[taskId].data[TD_FRAMECOUNTER]--;
        else
        {
            gTasks[taskId].data[TD_FRAMECOUNTER] = gTasks[taskId].data[TD_INTERVAL];
            gTasks[taskId].data[TD_FADELEVEL]++;
            LoadPalette(&gUnknown_081E795C[gTasks[taskId].data[TD_FADELEVEL]], 1, 0x10);
        }
    }
}

//Launches a helper task to fade out the background
static void StartBackgroundFadeOut(u8 taskId, u8 interval)
{
    u8 newTaskId = CreateTask(HandleFloorShadowFadeOut, 0);
    gTasks[newTaskId].data[TD_PARENT_TASK_ID] = taskId;
    gTasks[newTaskId].data[TD_FADELEVEL] = 0;
    gTasks[newTaskId].data[TD_DELAY] = 8;
    gTasks[newTaskId].data[TD_INTERVAL] = interval;
    gTasks[newTaskId].data[TD_FRAMECOUNTER] = interval;
}

static void HandleFloorShadowFadeIn(u8 taskId)
{
    if (gTasks[taskId].data[TD_DELAY])
        gTasks[taskId].data[TD_DELAY]--;
    else
    {
        if (gTasks[taskId].data[TD_FADELEVEL] == 0)
            DestroyTask(taskId);
        else
        {
            if (gTasks[taskId].data[TD_FRAMECOUNTER])
                gTasks[taskId].data[TD_FRAMECOUNTER]--;
            else
            {
                gTasks[taskId].data[TD_FRAMECOUNTER] = gTasks[taskId].data[TD_INTERVAL];
                gTasks[taskId].data[TD_FADELEVEL]--;
                LoadPalette(&gUnknown_081E795C[gTasks[taskId].data[TD_FADELEVEL]], 1, 0x10);
            }
        }
    }
}

//Launches a helper task to fade in the background
static void StartBackgroundFadeIn(u8 taskId, u8 interval)
{
    u8 newTaskId = CreateTask(HandleFloorShadowFadeIn, 0);
    gTasks[newTaskId].data[TD_PARENT_TASK_ID] = taskId;
    gTasks[newTaskId].data[TD_FADELEVEL] = 8;
    gTasks[newTaskId].data[TD_DELAY] = 8;
    gTasks[newTaskId].data[TD_INTERVAL] = interval;
    gTasks[newTaskId].data[TD_FRAMECOUNTER] = interval;
}

static void CreateGenderMenu(u8 left, u8 top)
{
    u8 menuLeft, menuTop;
    MenuDrawTextWindow(left, top, left + 6, top + 5);
    menuLeft = left + 1;
    menuTop = top + 1;
    PrintMenuItems(menuLeft, menuTop, 2, gUnknown_081E79B0);
    InitMenu(0, menuLeft, menuTop, 2, 0, 5);
}

static s8 GenderMenuProcessInput(void)
{
    return ProcessMenuInputNoWrap();
}

static void CreateNameMenu(u8 left, u8 top)
{
    MenuDrawTextWindow(left, top, left + 10, top + 11);

    if (gSaveBlock2.playerGender == MALE)
        PrintMenuItems(left + 1, top + 1, 5, gMalePresetNames);
    else
        PrintMenuItems(left + 1, top + 1, 5, gFemalePresetNames);

    InitMenu(0, left + 1, top + 1, 5, 0, 9);
}

static s8 NameMenuProcessInput(void)
{
    return ProcessMenuInput();
}

static void SetPresetPlayerName(u8 index)
{
    u8 i;
    u8 *name;

    if (gSaveBlock2.playerGender == MALE)
        name = gMalePresetNames[index].text;
    else
        name = gFemalePresetNames[index].text;

    for (i = 0; i < 7; i++)
        gSaveBlock2.playerName[i] = name[i];

    gSaveBlock2.playerName[i] = EOS;
}
