#include "global.h"
#include "battle_tower.h"
#include "start_menu.h"
#include "event_data.h"
#include "field_player_avatar.h"
#include "field_weather.h"
#include "fieldmap.h"
#include "item_menu.h"
#include "load_save.h"
#include "m4a.h"
#include "main.h"
#include "event_obj_lock.h"
#include "menu.h"
#include "new_game.h"
#include "option_menu.h"
#include "palette.h"
#include "pokedex.h"
#include "pokemon_menu.h"
#include "pokenav.h"
#include "overworld.h"
#include "safari_zone.h"
#include "save.h"
#include "save_menu_util.h"
#include "script.h"
#include "constants/songs.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "strings.h"
#include "strings2.h"
#include "task.h"
#include "trainer_card.h"
#include "scanline_effect.h"

//Menu actions
enum {
    MENU_ACTION_POKEDEX,
    MENU_ACTION_POKEMON,
    MENU_ACTION_BAG,
    MENU_ACTION_POKENAV,
    MENU_ACTION_PLAYER,
    MENU_ACTION_SAVE,
    MENU_ACTION_OPTION,
    MENU_ACTION_EXIT,
    MENU_ACTION_RETIRE,
    MENU_ACTION_PLAYER_LINK
};

#if DEBUG
static u32 _debugStartMenu_0  __attribute__((unused));
static u32 _debugStartMenu_1 __attribute__((unused));
#endif

static u8 (*saveDialogCallback)(void);
static u8 saveDialogTimer;    //Number of frames to keep the window on screen after save was completed
static bool8 savingComplete;

extern bool8 gDifferentSaveFile;
extern u16 gSaveFileStatus;
extern u16 gSpecialVar_Result;

extern u8 gUnknown_03004860;

u8 (*gMenuCallback)(void);

EWRAM_DATA static u8 sStartMenuCursorPos = 0;
EWRAM_DATA static u8 sNumStartMenuActions = 0;
EWRAM_DATA static u8 sCurrentStartMenuActions[10] = {0};

//Text strings
extern u8 gSaveText_PlayerSavedTheGame[];
extern u8 gSaveText_DontTurnOff[];
extern u8 gSaveText_ThereIsAlreadyAFile[];
extern u8 gSaveText_ThereIsADifferentFile[];
extern u8 gSaveText_WouldYouLikeToSave[];

static u8 StartMenu_PokedexCallback(void);
static u8 StartMenu_PokemonCallback(void);
static u8 StartMenu_BagCallback(void);
static u8 StartMenu_PokenavCallback(void);
static u8 StartMenu_PlayerCallback(void);
static u8 StartMenu_SaveCallback(void);
static u8 StartMenu_OptionCallback(void);
static u8 StartMenu_ExitCallback(void);
static u8 StartMenu_RetireCallback(void);
static u8 StartMenu_PlayerLinkCallback(void);

static const struct MenuAction sStartMenuItems[] =
{
    { SystemText_Pokedex, StartMenu_PokedexCallback },
    { SystemText_Pokemon, StartMenu_PokemonCallback },
    { SystemText_BAG, StartMenu_BagCallback },
    { SystemText_Pokenav, StartMenu_PokenavCallback },
    { SystemText_Player, StartMenu_PlayerCallback },
    { SystemText_Save, StartMenu_SaveCallback },
    { SystemText_Option, StartMenu_OptionCallback },
    { SystemText_Exit, StartMenu_ExitCallback },
    { SystemText_Retire, StartMenu_RetireCallback },
    { SystemText_Player, StartMenu_PlayerLinkCallback },
};

//Private functions
static void BuildStartMenuActions(void);
static void AddStartMenuAction(u8 action);
static void BuildStartMenuActions_Normal(void);
static void BuildStartMenuActions_SafariZone(void);
static void BuildStartMenuActions_Link(void);
static void DisplaySafariBallsWindow(void);
static bool32 PrintStartMenuItemsMultistep(s16 *a, u32 b);
static bool32 InitStartMenuMultistep(s16 *a, s16 *b);
static void Task_StartMenu(u8 taskId);
static u8 StartMenu_InputProcessCallback(void);
static u8 SaveCallback1(void);
static u8 SaveCallback2(void);
static void sub_807160C(void);
static u8 RunSaveDialogCallback(void);
static void DisplaySaveMessageWithCallback(const u8 *ptr, u8 (*func)(void));
static void Task_SaveDialog(u8 taskId);
static void sub_8071700(void);
static void HideSaveDialog(void);
static void SaveDialogStartTimeout(void);
static u8 SaveDialogCheckForTimeoutOrKeypress(void);
static u8 SaveDialogCheckForTimeoutAndKeypress(void);
static u8 SaveDialogCheckForTimeoutAndKeypress(void);
static u8 SaveDialogCB_DisplayConfirmMessage(void);
static u8 SaveDialogCB_DisplayConfirmYesNoMenu(void);
static u8 SaveDialogCB_ProcessConfirmYesNoMenu(void);
static u8 SaveDialogCB_SaveFileExists(void);
static u8 SaveDialogCB_DisplayOverwriteYesNoMenu(void);
static u8 SaveDialogCB_ProcessOverwriteYesNoMenu(void);
static u8 SaveDialogCB_DisplaySavingMessage(void);
static u8 SaveDialogCB_DoSave(void);
static u8 SaveDialogCB_SaveSuccess(void);
static u8 SaveDialogCB_ReturnSuccess(void);
static u8 SaveDialogCB_SaveError(void);
static u8 SaveDialogCB_ReturnError(void);
static void sub_80719F0(void);
static bool32 sub_80719FC(u8 *ptr);
static void sub_8071B54(void);
static void Task_8071B64(u8 taskId);

#if DEBUG

void debug_sub_8075D9C(void);

u8 debug_sub_8075C30(void)
{
    CloseMenu();
    debug_sub_8075D9C();
    return 1;
}

extern const u8 gUnknown_Debug_839B6D8[];

void debug_sub_8075C40(u8 taskId)
{
    s16 *data = gTasks[taskId].data;
    u16 savedIme;
    s32 i;

    switch (data[0])
    {
    case 0:
        m4aSoundVSyncOff();
        data[0]++;
        break;
    case 1:
        savedIme = REG_IME;
        REG_IME = 0;
        REG_TM2CNT_L = 0;
        REG_TM2CNT = 0x830000;
        for (i = 0; i < 0xC350; i++)
        {
            DmaSet(
                0,
                gScanlineEffectRegBuffers,
                &REG_WIN0H,
                ((DMA_ENABLE | DMA_START_HBLANK | DMA_16BIT | DMA_REPEAT | DMA_SRC_INC | DMA_DEST_RELOAD) << 16) | 1);
            DmaStop(0);
        }
        REG_TM2CNT_H = 0;
        _debugStartMenu_0 = REG_TM2CNT_L;
        REG_TM2CNT_L = 0;
        REG_IME = savedIme;
        _debugStartMenu_1 = i;
        m4aSoundVSyncOn();
        data[0]++;
        break;
    case 2:
        PlaySE(0x15);
        ConvertIntToDecimalStringN(gStringVar1, _debugStartMenu_1, 1, 8);
        ConvertIntToDecimalStringN(gStringVar2, _debugStartMenu_0, 1, 8);
        Menu_DisplayDialogueFrame();
        Menu_PrintText(gUnknown_Debug_839B6D8, 2, 15);
        data[0]++;
        break;
    case 3:
        if (gMain.newKeys & A_BUTTON)
        {
            Menu_EraseScreen();
            ScriptContext2_Disable();
            DestroyTask(taskId);
        }
        break;
    }
}

void debug_sub_8075D9C(void)
{
    CreateTask(debug_sub_8075C40, 10);
    ScriptContext2_Enable();
}

void debug_sub_8075DB4(struct BattleTowerEReaderTrainer *ereaderTrainer, const u8 *b, u32 trainerId)
{
    s32 i;
    s32 r3;

    ereaderTrainer->trainerClass = trainerId % 77;
    write_word_to_mem(trainerId, ereaderTrainer->trainerId);
    StringCopy8(ereaderTrainer->name, b);
    r3 = 7;
    for (i = 0; i < 6; i++)
    {
        ereaderTrainer->greeting[i] = gSaveBlock1.easyChats.unk2B28[i];
        ereaderTrainer->farewellPlayerLost[i] = r3;
        ereaderTrainer->farewellPlayerWon[i] = r3 + 6;
        r3++;
    }
    for (i = 0; i < 3; i++)
        sub_803AF78(&gPlayerParty[i], &ereaderTrainer->party[i]);
    SetEReaderTrainerChecksum(ereaderTrainer);
}

void unref_sub_8070F90(void)
{
    FlagSet(FLAG_SYS_POKEDEX_GET);
    FlagSet(FLAG_SYS_POKEMON_GET);
    FlagSet(FLAG_SYS_POKENAV_GET);
}

#endif

static void BuildStartMenuActions(void)
{
    sNumStartMenuActions = 0;
    if (is_c1_link_related_active() == TRUE)
        BuildStartMenuActions_Link();
    else
    {
        if (GetSafariZoneFlag() == TRUE)
            BuildStartMenuActions_SafariZone();
        else
            BuildStartMenuActions_Normal();
    }
}

static void AddStartMenuAction(u8 action)
{
    AppendToList(sCurrentStartMenuActions, &sNumStartMenuActions, action);
}

static void BuildStartMenuActions_Normal(void)
{
    if (FlagGet(FLAG_SYS_POKEDEX_GET) == TRUE)
        AddStartMenuAction(MENU_ACTION_POKEDEX);
    if (FlagGet(FLAG_SYS_POKEMON_GET) == TRUE)
        AddStartMenuAction(MENU_ACTION_POKEMON);
    AddStartMenuAction(MENU_ACTION_BAG);
    if (FlagGet(FLAG_SYS_POKENAV_GET) == TRUE)
        AddStartMenuAction(MENU_ACTION_POKENAV);
    AddStartMenuAction(MENU_ACTION_PLAYER);
    AddStartMenuAction(MENU_ACTION_SAVE);
    AddStartMenuAction(MENU_ACTION_OPTION);
    AddStartMenuAction(MENU_ACTION_EXIT);
}

static void BuildStartMenuActions_SafariZone(void)
{
    AddStartMenuAction(MENU_ACTION_RETIRE);
    AddStartMenuAction(MENU_ACTION_POKEDEX);
    AddStartMenuAction(MENU_ACTION_POKEMON);
    AddStartMenuAction(MENU_ACTION_BAG);
    AddStartMenuAction(MENU_ACTION_PLAYER);
    AddStartMenuAction(MENU_ACTION_OPTION);
    AddStartMenuAction(MENU_ACTION_EXIT);
}

static void BuildStartMenuActions_Link(void)
{
    AddStartMenuAction(MENU_ACTION_POKEMON);
    AddStartMenuAction(MENU_ACTION_BAG);
    if (FlagGet(FLAG_SYS_POKENAV_GET) == TRUE)
        AddStartMenuAction(MENU_ACTION_POKENAV);
    AddStartMenuAction(MENU_ACTION_PLAYER_LINK);
    AddStartMenuAction(MENU_ACTION_OPTION);
    AddStartMenuAction(MENU_ACTION_EXIT);
}

//Show number of safari balls left
static void DisplaySafariBallsWindow(void)
{
    AlignInt2InMenuWindow(gStringVar1, gNumSafariBalls, 12, 1);
    Menu_DrawStdWindowFrame(0, 0, 10, 5);
    Menu_PrintText(gOtherText_SafariStock, 1, 1);
}

//Prints n menu items starting at *index
static bool32 PrintStartMenuItemsMultistep(s16 *index, u32 n)
{
    int _index = *index;

    do
    {
        Menu_PrintText(sStartMenuItems[sCurrentStartMenuActions[_index]].text, 23, 2 + _index * 2);
        _index++;
        if (_index >= sNumStartMenuActions)
        {
            *index = _index;
            return TRUE;
        }
    }
    while (--n != 0);
    *index = _index;
    return FALSE;
}

static bool32 InitStartMenuMultistep(s16 *step, s16 *index)
{
    switch (*step)
    {
    case 1:
        BuildStartMenuActions();
        (*step)++;
        break;
    case 2:
        Menu_DrawStdWindowFrame(22, 0, 29, sNumStartMenuActions * 2 + 3);
        *index = 0;
        (*step)++;
        break;
    case 3:
        if (GetSafariZoneFlag())
            DisplaySafariBallsWindow();
        (*step)++;
        break;
    case 4:
        if (PrintStartMenuItemsMultistep(index, 2))
            (*step)++;
        break;
    case 0:
        (*step)++;
        break;
    case 5:
        sStartMenuCursorPos = InitMenu(0, 0x17, 2, sNumStartMenuActions, sStartMenuCursorPos, 6);
        return TRUE;
    }
    return FALSE;
}

static void InitStartMenu(void)
{
    s16 step = 0;
    s16 index = 0;

    while (InitStartMenuMultistep(&step, &index) == FALSE)
        ;
}

static void Task_StartMenu(u8 taskId)
{
    if (InitStartMenuMultistep(gTasks[taskId].data, gTasks[taskId].data + 1) == TRUE)
    {
        *gTasks[taskId].data = 0;
        SwitchTaskToFollowupFunc(taskId);
    }
}

void CreateStartMenuTask(void (*func)(u8))
{
    u8 taskId;

    InitMenuWindow(&gMenuTextWindowTemplate);
    taskId = CreateTask(Task_StartMenu, 0x50);
    SetTaskFuncWithFollowupFunc(taskId, Task_StartMenu, func);
}

void sub_80712B4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        gMenuCallback = StartMenu_InputProcessCallback;
        task->data[0]++;
        break;
    case 1:
        if (gMenuCallback() == 1)
            DestroyTask(taskId);
        break;
    }
}

void sub_8071310(void)
{
    if (!is_c1_link_related_active())
    {
        FreezeEventObjects();
        sub_80594C0();
        sub_80597F4();
    }
    CreateStartMenuTask(sub_80712B4);
    ScriptContext2_Enable();
}

static u8 StartMenu_InputProcessCallback(void)
{
    if (gMain.newKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        sStartMenuCursorPos = Menu_MoveCursor(-1);
    }
    if (gMain.newKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        sStartMenuCursorPos = Menu_MoveCursor(1);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        if (sStartMenuItems[sCurrentStartMenuActions[sStartMenuCursorPos]].func == StartMenu_PokedexCallback)
        {
            if (GetNationalPokedexCount(0) == 0)
                return 0;
        }
        gMenuCallback = sStartMenuItems[sCurrentStartMenuActions[sStartMenuCursorPos]].func;
        if (gMenuCallback != StartMenu_SaveCallback &&
           gMenuCallback != StartMenu_ExitCallback &&
           gMenuCallback != StartMenu_RetireCallback)
            FadeScreen(1, 0);
        return 0;
    }
    if (gMain.newKeys & (START_BUTTON | B_BUTTON))
    {
        CloseMenu();
        return 1;
    }
    return 0;
}

//When player selects POKEDEX
static u8 StartMenu_PokedexCallback(void)
{
    if (!gPaletteFade.active)
    {
        IncrementGameStat(GAME_STAT_CHECKED_POKEDEX);
        PlayRainSoundEffect();
        SetMainCallback2(CB2_InitPokedex);
        return 1;
    }
    return 0;
}

//When player selects POKEMON
static u8 StartMenu_PokemonCallback(void)
{
    if (!gPaletteFade.active)
    {
        PlayRainSoundEffect();
        SetMainCallback2(sub_8089A70);
        return 1;
    }
    return 0;
}

//When player selects BAG
static u8 StartMenu_BagCallback(void)
{
    if (!gPaletteFade.active)
    {
        PlayRainSoundEffect();
        SetMainCallback2(sub_80A53F8);
        return 1;
    }
    return 0;
}

//When player selects POKENAV
static u8 StartMenu_PokenavCallback(void)
{
    if (!gPaletteFade.active)
    {
        PlayRainSoundEffect();
        SetMainCallback2(sub_80EBA5C);
        return 1;
    }
    return 0;
}

//When player selects his/her name
static u8 StartMenu_PlayerCallback(void)
{
    if (!gPaletteFade.active)
    {
        PlayRainSoundEffect();
        TrainerCard_ShowPlayerCard(c2_exit_to_overworld_1_sub_8080DEC);
        return 1;
    }
    return 0;
}

//When player selects SAVE
static u8 StartMenu_SaveCallback(void)
{
    Menu_DestroyCursor();
    gMenuCallback = SaveCallback1;
    return 0;
}

//When player selects OPTION
static u8 StartMenu_OptionCallback(void)
{
    if (!gPaletteFade.active)
    {
        PlayRainSoundEffect();
        SetMainCallback2(CB2_InitOptionMenu);
        gMain.savedCallback = c2_exit_to_overworld_1_sub_8080DEC;
        return 1;
    }
    return 0;
}

//When player selects EXIT
static u8 StartMenu_ExitCallback(void)
{
    CloseMenu();
    return 1;
}

//When player selects RETIRE
static u8 StartMenu_RetireCallback(void)
{
    CloseMenu();
    SafariZoneRetirePrompt();
    return 1;
}

//When player selects their name in multiplayer mode
static u8 StartMenu_PlayerLinkCallback(void)
{
    if (!gPaletteFade.active)
    {
        PlayRainSoundEffect();
        TrainerCard_ShowLinkCard(gUnknown_03004860, c2_exit_to_overworld_1_sub_8080DEC);
        return 1;
    }
    return 0;
}

//Save dialog status
enum
{
    SAVE_IN_PROGRESS,
    SAVE_SUCCESS,
    SAVE_CANCELED,
    SAVE_ERROR,
};

static u8 SaveCallback1(void)
{
    sub_807160C();
    gMenuCallback = SaveCallback2;
    return FALSE;
}

static u8 SaveCallback2(void)
{
    switch (RunSaveDialogCallback())
    {
    case SAVE_IN_PROGRESS:
        return FALSE;
    case SAVE_CANCELED:
        //Go back to start menu
        Menu_EraseScreen();
        InitStartMenu();
        gMenuCallback = StartMenu_InputProcessCallback;
        return FALSE;
    case SAVE_SUCCESS:
    case SAVE_ERROR:
        Menu_EraseScreen();
        ScriptUnfreezeEventObjects();
        ScriptContext2_Disable();
        return TRUE;
    }
    return FALSE;
}

static void sub_807160C(void)
{
    save_serialize_map();
    saveDialogCallback = SaveDialogCB_DisplayConfirmMessage;
    savingComplete = FALSE;
}

static u8 RunSaveDialogCallback(void)
{
    if (savingComplete)
    {
        if (!Menu_UpdateWindowText())
            return 0;
    }
    savingComplete = FALSE;
    return saveDialogCallback();
}

void ScrSpecial_DoSaveDialog(void)
{
    sub_807160C();
    CreateTask(Task_SaveDialog, 0x50);
}

static void DisplaySaveMessageWithCallback(const u8 *ptr, u8 (*func)(void))
{
    StringExpandPlaceholders(gStringVar4, ptr);
    Menu_DisplayDialogueFrame();
    MenuPrintMessageDefaultCoords(gStringVar4);
    savingComplete = TRUE;
    saveDialogCallback = func;
}

static void Task_SaveDialog(u8 taskId)
{
    u8 status = RunSaveDialogCallback();

    switch (status)
    {
    case SAVE_CANCELED:
    case SAVE_ERROR:
        gSpecialVar_Result = 0;
        break;
    case SAVE_SUCCESS:
        gSpecialVar_Result = status;
        break;
    case SAVE_IN_PROGRESS:
        return;
    }
    DestroyTask(taskId);
    EnableBothScriptContexts();
}

static void sub_8071700(void)
{
    HandleCloseSaveWindow(0, 0);
}

static void HideSaveDialog(void)
{
    Menu_EraseWindowRect(20, 8, 26, 13);
}

static void SaveDialogStartTimeout(void)
{
    saveDialogTimer = 60;
}

static bool8 SaveDialogCheckForTimeoutOrKeypress(void)
{
    saveDialogTimer--;
    if (gMain.heldKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        return TRUE;
    }
    else if (saveDialogTimer == 0)
        return TRUE;
    return FALSE;
}

static bool8 SaveDialogCheckForTimeoutAndKeypress(void)
{
    if (saveDialogTimer != 0)
        saveDialogTimer--;
    else if (gMain.heldKeys & A_BUTTON)
        return TRUE;
    return FALSE;
}

static u8 SaveDialogCB_DisplayConfirmMessage(void)
{
    Menu_EraseScreen();
    HandleDrawSaveWindowInfo(0, 0);
    DisplaySaveMessageWithCallback(gSaveText_WouldYouLikeToSave, SaveDialogCB_DisplayConfirmYesNoMenu);
    return SAVE_IN_PROGRESS;
}

static u8 SaveDialogCB_DisplayConfirmYesNoMenu(void)
{
    DisplayYesNoMenu(20, 8, 1);
    saveDialogCallback = SaveDialogCB_ProcessConfirmYesNoMenu;
    return SAVE_IN_PROGRESS;
}

static u8 SaveDialogCB_ProcessConfirmYesNoMenu(void)
{
    switch (Menu_ProcessInputNoWrap_())
    {
    case 0:     //YES
        HideSaveDialog();
        switch (gSaveFileStatus)
        {
        case 0:
        case 2:
            if (gDifferentSaveFile == FALSE)
            {
                saveDialogCallback = SaveDialogCB_SaveFileExists;
                return SAVE_IN_PROGRESS;
            }
            saveDialogCallback = SaveDialogCB_DisplaySavingMessage;
            return SAVE_IN_PROGRESS;
        default:
            saveDialogCallback = SaveDialogCB_SaveFileExists;
            return SAVE_IN_PROGRESS;
        }
        break;
    case -1:    //B button
    case 1:     //NO
        HideSaveDialog();
        sub_8071700();
        return SAVE_CANCELED;
    }
    return SAVE_IN_PROGRESS;
}

static u8 SaveDialogCB_SaveFileExists(void)
{
    DisplaySaveMessageWithCallback(
      gDifferentSaveFile == TRUE ? gSaveText_ThereIsADifferentFile : gSaveText_ThereIsAlreadyAFile,
      SaveDialogCB_DisplayOverwriteYesNoMenu);
    return SAVE_IN_PROGRESS;
}

static u8 SaveDialogCB_DisplayOverwriteYesNoMenu(void)
{
    DisplayYesNoMenu(20, 8, 1);
    saveDialogCallback = SaveDialogCB_ProcessOverwriteYesNoMenu;
    return SAVE_IN_PROGRESS;
}

static u8 SaveDialogCB_ProcessOverwriteYesNoMenu(void)
{
    switch (Menu_ProcessInputNoWrap_())
    {
    case 0:     //YES
        HideSaveDialog();
        saveDialogCallback = SaveDialogCB_DisplaySavingMessage;
        break;
    case -1:    //B button
    case 1:     //NO
        HideSaveDialog();
        sub_8071700();
        return SAVE_CANCELED;
    }
    return SAVE_IN_PROGRESS;
}

static u8 SaveDialogCB_DisplaySavingMessage(void)
{
    //"SAVING... DON'T TURN OFF THE POWER."
    DisplaySaveMessageWithCallback(gSaveText_DontTurnOff, SaveDialogCB_DoSave);
    return SAVE_IN_PROGRESS;
}

static u8 SaveDialogCB_DoSave(void)
{
    u8 saveStatus;

    IncrementGameStat(GAME_STAT_SAVED_GAME);
    if (gDifferentSaveFile == TRUE)
    {
        saveStatus = Save_WriteData(SAVE_OVERWRITE_DIFFERENT_FILE);
        gDifferentSaveFile = FALSE;
    }
    else
    {
        saveStatus = Save_WriteData(SAVE_NORMAL);
    }

    if (saveStatus == SAVE_STATUS_OK)
    {
        //"(Player) saved the game."
        DisplaySaveMessageWithCallback(gSaveText_PlayerSavedTheGame, SaveDialogCB_SaveSuccess);
    }
    else
    {
        //"Save error. Please exchange the backup memory."
        DisplaySaveMessageWithCallback(gSystemText_SaveErrorExchangeBackup, SaveDialogCB_SaveError);
    }

    SaveDialogStartTimeout();
    return SAVE_IN_PROGRESS;
}

static u8 SaveDialogCB_SaveSuccess(void)
{
    if (Menu_UpdateWindowText())
    {
        PlaySE(SE_SAVE);
        saveDialogCallback = SaveDialogCB_ReturnSuccess;
    }
    return SAVE_IN_PROGRESS;
}

static u8 SaveDialogCB_ReturnSuccess(void)
{
    if (!IsSEPlaying() && SaveDialogCheckForTimeoutOrKeypress())
    {
        sub_8071700();
        return SAVE_SUCCESS;
    }
    else
        return SAVE_IN_PROGRESS;
}

static u8 SaveDialogCB_SaveError(void)
{
    if (Menu_UpdateWindowText())
    {
        PlaySE(SE_BOO);
        saveDialogCallback = SaveDialogCB_ReturnError;
    }
    return SAVE_IN_PROGRESS;
}

static u8 SaveDialogCB_ReturnError(void)
{
    if (!SaveDialogCheckForTimeoutAndKeypress())
        return SAVE_IN_PROGRESS;
    else
    {
        sub_8071700();
        return SAVE_ERROR;
    }
}

static void sub_80719F0(void)
{
    TransferPlttBuffer();
}

static bool32 sub_80719FC(u8 *step)
{
    switch (*step)
    {
    case 0:
        REG_DISPCNT = 0;
        SetVBlankCallback(NULL);
        ScanlineEffect_Stop();
        DmaClear16(3, PLTT, PLTT_SIZE);
        DmaFill16Large(3, 0, (void *)(VRAM + 0x0), 0x18000, 0x1000);
        break;
    case 1:
        ResetSpriteData();
        ResetTasks();
        ResetPaletteFade();
        ScanlineEffect_Clear();
        break;
    case 2:
        Text_LoadWindowTemplate(&gMenuTextWindowTemplate);
        InitMenuWindow(&gMenuTextWindowTemplate);
        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_BG0_ON;
        break;
    case 3:
    {
        u32 savedIme;

        BlendPalettes(0xFFFFFFFF, 16, RGB(0, 0, 0));
        SetVBlankCallback(sub_80719F0);
        savedIme = REG_IME;
        REG_IME = 0;
        REG_IE |= 1;
        REG_IME = savedIme;
        break;
    }
    case 4:
        return TRUE;
    }
    (*step)++;
    return FALSE;
}

void sub_8071B28(void)
{
    if (sub_80719FC(&gMain.state))
    {
        CreateTask(Task_8071B64, 0x50);
        SetMainCallback2(sub_8071B54);
    }
}

static void sub_8071B54(void)
{
    RunTasks();
    UpdatePaletteFade();
}

static void Task_8071B64(u8 taskId)
{
    s16 *step = gTasks[taskId].data;

    if (!gPaletteFade.active)
    {
        switch (*step)
        {
        case 0:
            Menu_DisplayDialogueFrame();
            Menu_PrintText(gSystemText_Saving, 2, 15);
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
            (*step)++;
            break;
        case 1:
            SetSecretBase2Field_9_AndHideBG();
            sub_8125E2C();
            (*step)++;
            break;
        case 2:
            if (!sub_8125E6C())
                break;
            ClearSecretBase2Field_9_2();
            (*step)++;
            break;
        case 3:
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
            (*step)++;
            break;
        case 4:
            SetMainCallback2(gMain.savedCallback);
            DestroyTask(taskId);
            break;
        }
    }
}
