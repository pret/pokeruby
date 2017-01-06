#include "global.h"
#include "start_menu.h"
#include "asm.h"
#include "field_player_avatar.h"
#include "event_data.h"
#include "load_save.h"
#include "main.h"
#include "map_obj_lock.h"
#include "menu.h"
#include "option_menu.h"
#include "palette.h"
#include "pokedex.h"
#include "rom4.h"
#include "safari_zone.h"
#include "save.h"
#include "save_menu_util.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "trainer_card.h"
#include "weather.h"

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

static u8 (*saveDialogCallback)(void);
static u8 saveDialogTimer;    //Number of frames to keep the window on screen after save was completed
static bool8 savingComplete;

extern bool8 gUnknown_020297EC;
extern u16 gSaveFileStatus;
extern u16 gScriptResult;
extern u8 (*gCallback_03004AE8)(void);
extern u8 gUnknown_03004860;
extern u8 gNumSafariBalls;

EWRAM_DATA static u8 sStartMenuCursorPos = 0;
EWRAM_DATA static u8 sNumStartMenuActions = 0;
EWRAM_DATA static u8 sCurrentStartMenuActions[10] = {0};

//Text strings
extern u8 gSystemText_Saving[];
extern u8 gSaveText_PlayerSavedTheGame[];
extern u8 gSaveText_DontTurnOff[];
extern u8 gSystemText_SaveErrorExchangeBackup[];
extern u8 gSaveText_ThereIsAlreadyAFile[];
extern u8 gSaveText_ThereIsADifferentFile[];
extern u8 gSaveText_WouldYouLikeToSave[];
extern u8 gOtherText_SafariStock[];
extern u8 SystemText_Pokedex[];
extern u8 SystemText_Pokemon[];
extern u8 SystemText_BAG[];
extern u8 SystemText_Pokenav[];
extern u8 SystemText_Player[];
extern u8 SystemText_Save[];
extern u8 SystemText_Option[];
extern u8 SystemText_Exit[];
extern u8 SystemText_Retire[];
extern u8 SystemText_Player[];

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
static void DisplaySaveMessageWithCallback(u8 *ptr, u8 (*func)(void));
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


static void BuildStartMenuActions(void)
{
    sNumStartMenuActions = 0;
    if(is_c1_link_related_active() == TRUE)
        BuildStartMenuActions_Link();
    else
    {
        if(GetSafariZoneFlag() == TRUE)
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
    if(FlagGet(SYS_POKEDEX_GET) == TRUE)
        AddStartMenuAction(MENU_ACTION_POKEDEX);
    if(FlagGet(SYS_POKEMON_GET) == TRUE)
        AddStartMenuAction(MENU_ACTION_POKEMON);
    AddStartMenuAction(MENU_ACTION_BAG);
    if(FlagGet(SYS_POKENAV_GET) == TRUE)
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
    if(FlagGet(SYS_POKENAV_GET) == TRUE)
        AddStartMenuAction(MENU_ACTION_POKENAV);
    AddStartMenuAction(MENU_ACTION_PLAYER_LINK);
    AddStartMenuAction(MENU_ACTION_OPTION);
    AddStartMenuAction(MENU_ACTION_EXIT);    
}

//Show number of safari balls left
static void DisplaySafariBallsWindow(void)
{
    sub_8072C44(gStringVar1, gNumSafariBalls, 12, 1);
    MenuDrawTextWindow(0, 0, 10, 5);
    MenuPrint(gOtherText_SafariStock, 1, 1);
}

//Prints n menu items starting at *index
static bool32 PrintStartMenuItemsMultistep(s16 *index, u32 n)
{
    int _index = *index;
    
    do
    {
        MenuPrint(sStartMenuItems[sCurrentStartMenuActions[_index]].text, 23, 2 + _index * 2);
        _index++;
        if(_index >= sNumStartMenuActions)
        {
            *index = _index;
            return TRUE;
        }
    }
    while(--n != 0);
    *index = _index;
    return FALSE;
}

static bool32 InitStartMenuMultistep(s16 *step, s16 *index)
{
    switch(*step)
    {
        case 1:
            BuildStartMenuActions();
            (*step)++;
            break;
        case 2:
            MenuDrawTextWindow(22, 0, 29, sNumStartMenuActions * 2 + 3);
            *index = 0;
            (*step)++;
            break;
        case 3:
            if(GetSafariZoneFlag())
                DisplaySafariBallsWindow();
            (*step)++;
            break;
        case 4:
            if(PrintStartMenuItemsMultistep(index, 2))
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
    
    while(InitStartMenuMultistep(&step, &index) == FALSE)
        ;
}

static void Task_StartMenu(u8 taskId)
{
    if(InitStartMenuMultistep(gTasks[taskId].data, gTasks[taskId].data + 1) == TRUE)
    {
        *gTasks[taskId].data = 0;
        SwitchTaskToFollowupFunc(taskId);
    }
}

void CreateStartMenuTask(void (*func)(u8))
{
    u8 taskId;
    
    InitMenuWindow(&gWindowConfig_81E6CE4);
    taskId = CreateTask(Task_StartMenu, 0x50);
    SetTaskFuncWithFollowupFunc(taskId, Task_StartMenu, func);
}

struct MyTask {
    TaskFunc func;
    bool8 isActive;
    u8 prev;
    u8 next;
    u8 priority;
    s16 var1;
};

void sub_80712B4(u8 taskId)
{
    switch(((struct MyTask *)&gTasks[taskId])->var1)
    {
        case 0:
            gCallback_03004AE8 = StartMenu_InputProcessCallback;
            ((struct MyTask *)&gTasks[taskId])->var1++;
            break;
        case 1:
            if(gCallback_03004AE8() == 1)
                DestroyTask(taskId);
            break;
    }
}

void sub_8071310(void)
{
    if(!is_c1_link_related_active())
    {
        FreezeMapObjects();
        sub_80594C0();
        sub_80597F4();
    }
    CreateStartMenuTask(sub_80712B4);
    ScriptContext2_Enable();
}

static u8 StartMenu_InputProcessCallback(void)
{
    if(gMain.newKeys & DPAD_UP)
    {
        PlaySE(SE_SELECT);
        sStartMenuCursorPos = MoveMenuCursor(-1);
    }
    if(gMain.newKeys & DPAD_DOWN)
    {
        PlaySE(SE_SELECT);
        sStartMenuCursorPos = MoveMenuCursor(1);
    }
    if(gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        if(sStartMenuItems[sCurrentStartMenuActions[sStartMenuCursorPos]].func == StartMenu_PokedexCallback)
        {
            if(GetNationalPokedexCount(0) == 0)
                return 0;
        }
        gCallback_03004AE8 = sStartMenuItems[sCurrentStartMenuActions[sStartMenuCursorPos]].func;
        if(gCallback_03004AE8 != StartMenu_SaveCallback &&
           gCallback_03004AE8 != StartMenu_ExitCallback &&
           gCallback_03004AE8 != StartMenu_RetireCallback)
            fade_screen(1, 0);
        return 0;
    }
    if(gMain.newKeys & (START_BUTTON | B_BUTTON))
    {
        CloseMenu();
        return 1;
    }
    return 0;
}

//When player selects POKEDEX
static u8 StartMenu_PokedexCallback(void)
{
    if(!gPaletteFade.active)
    {
        sav12_xor_increment(0x29);
        PlayRainSoundEffect();
        SetMainCallback2(CB2_InitPokedex);
        return 1;
    }
    return 0;
}

//When player selects POKEMON
static u8 StartMenu_PokemonCallback(void)
{
    if(!gPaletteFade.active)
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
    if(!gPaletteFade.active)
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
    if(!gPaletteFade.active)
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
    if(!gPaletteFade.active)
    {
        PlayRainSoundEffect();
        sub_8093110(sub_805469C);
        return 1;
    }
    return 0;
}

//When player selects SAVE
static u8 StartMenu_SaveCallback(void)
{
    sub_8072DEC();
    gCallback_03004AE8 = SaveCallback1;
    return 0;
}

//When player selects OPTION
static u8 StartMenu_OptionCallback(void)
{
    if(!gPaletteFade.active)
    {
        PlayRainSoundEffect();
        SetMainCallback2(CB2_InitOptionMenu);
        gMain.savedCallback = sub_805469C;
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
    if(!gPaletteFade.active)
    {
        PlayRainSoundEffect();
        sub_8093130(gUnknown_03004860, sub_805469C);
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
    gCallback_03004AE8 = SaveCallback2;
    return FALSE;
}

static u8 SaveCallback2(void)
{
    switch(RunSaveDialogCallback())
    {
        case SAVE_IN_PROGRESS:
            return FALSE;
        case SAVE_CANCELED:
            //Go back to start menu
            MenuZeroFillScreen();
            InitStartMenu();
            gCallback_03004AE8 = StartMenu_InputProcessCallback;
            return FALSE;
        case SAVE_SUCCESS:
        case SAVE_ERROR:
            MenuZeroFillScreen();
            sub_8064E2C();
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
    if(savingComplete)
    {
        if(!MenuUpdateWindowText())
            return 0;
    }
    savingComplete = FALSE;
    return saveDialogCallback();
}

void InitSaveDialog(void)
{
    sub_807160C();
    CreateTask(Task_SaveDialog, 0x50);
}

static void DisplaySaveMessageWithCallback(u8 *ptr, u8 (*func)(void))
{
    StringExpandPlaceholders(gStringVar4, ptr);
    MenuDisplayMessageBox();
    sub_8072044(gStringVar4);
    savingComplete = TRUE;
    saveDialogCallback = func;
}

static void Task_SaveDialog(u8 taskId)
{
    u8 status = RunSaveDialogCallback();
    
    switch(status)
    {
        case SAVE_CANCELED:
        case SAVE_ERROR:
            gScriptResult = 0;
            break;        
        case SAVE_SUCCESS:
            gScriptResult = status;
            break;
        case SAVE_IN_PROGRESS:
            return;
    }
    DestroyTask(taskId);
    EnableBothScriptContexts();
}

static void sub_8071700(void)
{
    sub_80946C8(0, 0);
}

static void HideSaveDialog(void)
{
    MenuZeroFillWindowRect(20, 8, 26, 13);
}

static void SaveDialogStartTimeout(void)
{
    saveDialogTimer = 60;
}

static bool8 SaveDialogCheckForTimeoutOrKeypress(void)
{
    saveDialogTimer--;
    if(gMain.heldKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        return TRUE;
    }
    else if(saveDialogTimer == 0)
        return TRUE;
    return FALSE;
}

static bool8 SaveDialogCheckForTimeoutAndKeypress(void)
{
    if(saveDialogTimer != 0)
        saveDialogTimer--;
    else if(gMain.heldKeys & A_BUTTON)
        return TRUE;
    return FALSE;
}

static u8 SaveDialogCB_DisplayConfirmMessage(void)
{
    MenuZeroFillScreen();
    HandleDrawSaveWindowInfo(0, 0);
    //"Would you like to save the game?"
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
    switch(ProcessMenuInputNoWrap_())
    {
        case 0:     //YES
            HideSaveDialog();
            switch(gSaveFileStatus)
            {
                case 0:
                case 2:
                    if(gUnknown_020297EC == FALSE)
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
      gUnknown_020297EC == TRUE ? gSaveText_ThereIsADifferentFile : gSaveText_ThereIsAlreadyAFile,
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
    switch(ProcessMenuInputNoWrap_())
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
    u8 a;
    
    sav12_xor_increment(0);
    if(gUnknown_020297EC == TRUE)
    {
        a = sub_8125D44(4);
        gUnknown_020297EC = FALSE;
    }
    else
    {
        a = sub_8125D44(0);
    }
    
    if(a == 1)
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
    if(MenuUpdateWindowText())
    {
        PlaySE(SE_SAVE);
        saveDialogCallback = SaveDialogCB_ReturnSuccess;
    }
    return SAVE_IN_PROGRESS;
}

static u8 SaveDialogCB_ReturnSuccess(void)
{
    if(!IsSEPlaying() && SaveDialogCheckForTimeoutOrKeypress())
    {
        sub_8071700();
        return SAVE_SUCCESS;
    }
    else
        return SAVE_IN_PROGRESS;
}

static u8 SaveDialogCB_SaveError(void)
{
    if(MenuUpdateWindowText())
    {
        PlaySE(SE_BOO);
        saveDialogCallback = SaveDialogCB_ReturnError;
    }
    return SAVE_IN_PROGRESS;
}

static u8 SaveDialogCB_ReturnError(void)
{
    if(!SaveDialogCheckForTimeoutAndKeypress())
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
    switch(*step)
    {
        case 0:
        {
            u8 *addr;
            u32 size;
            
            REG_DISPCNT = 0;
            SetVBlankCallback(NULL);
            remove_some_task();
            DmaClear16(3, PLTT, PLTT_SIZE);
            addr = (void *)VRAM;
            size = 0x18000;
            while(1)
            {
                DmaFill16(3, 0, addr, 0x1000);
                addr += 0x1000;
                size -= 0x1000;
                if(size <= 0x1000)
                {
                    DmaFill16(3, 0, addr, size);
                    break;
                }
            }
            break;
        }
        case 1:
            ResetSpriteData();
            ResetTasks();
            ResetPaletteFade();
            dp12_8087EA4();
            break;
        case 2:
            SetUpWindowConfig(&gWindowConfig_81E6CE4);
            InitMenuWindow(&gWindowConfig_81E6CE4);
            REG_DISPCNT = 0x100;
            break;
        case 3:
        {
            u32 savedIme;
            
            BlendPalettes(-1, 0x10, 0);
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
    if(sub_80719FC(&gMain.state))
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
    
    if(!gPaletteFade.active)
    {
        switch(*step)
        {
            case 0:
                MenuDisplayMessageBox();
                MenuPrint(gSystemText_Saving, 2, 15);
                BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
                (*step)++;
                break;
            case 1:
                SetSecretBase2Field_9_AndHideBG();
                sub_8125E2C();
                (*step)++;
                break;
            case 2:
                if(!sub_8125E6C())
                    break;
                ClearSecretBase2Field_9_2();
                (*step)++;
                break;
            case 3:
                BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
                (*step)++;
                break;
            case 4:
                SetMainCallback2(gMain.savedCallback);
                DestroyTask(taskId);
                break;                
        }
    }
}
