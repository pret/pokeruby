#include "gba/gba.h"
#include "global.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"

//External functions
extern void sub_8064E2C(void);
extern void sub_8047A1C(void);
extern u8 sub_8125E6C(void);
extern void sub_8047A34(void);
extern void sub_8125E2C(void);
extern void remove_some_task(void);
extern void dp12_8087EA4(void);
extern void sav12_xor_increment(u8 index);
extern bool8 sub_8125D44(u8);  //Saving related
extern void sub_80945C0(u8, u8);
extern void sub_80946C8(u8, u8);
extern void save_serialize_map(void);
extern void play_some_sound(void);
extern void sub_8093130(u8, void (*)(void));
extern void sub_805469C(void);
extern void sub_80C823C(void);
extern void CB2_InitOptionMenu(void);
extern void sub_8093110(void (*)(void));
extern void sub_80EBA5C(void);
extern void sub_80A53F8(void);
extern void sub_8089A70(void);
extern void sub_808C27C(void);
extern u16 pokedex_count(u8);
extern void fade_screen(u8, u8);
extern bool32 is_c1_link_related_active();
extern void sub_80594C0(void);
extern void sub_80597F4(void);
extern void player_bitmagic(void);
extern bool32 GetSafariZoneFlag(void);
extern u8 *sub_8072C44(u8 *, s32, u8, u8);
extern u8 FlagGet(u16);
extern bool32 is_c1_link_related_active(void);

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

struct MenuItem {
    u8 *text;
    u8 (*callback)(void);
};

static u8 (*saveDialogCallback)(void);
static u8 gUnknown_030006AC;
static bool8 gUnknown_030006AD;

extern bool8 gUnknown_020297EC;
extern u16 gSaveFileStatus;
extern u16 gScriptResult;
extern u8 (*gCallback_03004AE8)(void);
extern u8 gUnknown_03004860;
extern struct MenuItem gStartMenuItems[];
extern u8 gUnknown_02038808;

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

//Public functions
void CreateStartMenuTask(void (*func)(u8));
void sub_80712B4(u8 taskId);
void sub_8071310(void);
u8 StartMenu_PokedexCallback(void);
u8 StartMenu_PokemonCallback(void);
u8 StartMenu_BagCallback(void);
u8 StartMenu_PokenavCallback(void);
u8 StartMenu_PlayerCallback(void);
u8 StartMenu_SaveCallback(void);
u8 StartMenu_OptionCallback(void);
u8 StartMenu_ExitCallback(void);
u8 StartMenu_RetireCallback(void);
u8 StartMenu_PlayerLinkCallback(void);
void InitSaveDialog(void);
void sub_8071B28(void);
void sub_8071C20(void);
void AppendToList(u8 *list, u8 *pindex, u32 value);

//Private functions
static void BuildStartMenuActions(void);
static void AddStartMenuAction(u8 action);
static void BuildStartMenuActions_Normal(void);
static void BuildStartMenuActions_SafariZone(void);
static void BuildStartMenuActions_Link(void);
static void DisplaySafariBallsWindow(void);
static bool32 sub_8071114(s16 *a, u32 b);
static bool32 sub_807117C(s16 *a, s16 *b);
static void sub_8071230(void);
static void Task_StartMenu(u8 taskId);
static u8 Callback_8071338(void);
static u8 SaveCallback1(void);
static u8 SaveCallback2(void);
static void sub_807160C(void);
static u8 RunSaveDialogCallback(void);
static void DisplaySaveMessageWithCallback(u8 *ptr, u8 (*func)(void));
static void Task_SaveDialog(u8 taskId);
static void sub_8071700(void);
static void EraseSaveDialog(void);
static void sub_8071724(void);
static u8 sub_8071730(void);
static u8 sub_8071764(void);
static u8 sub_8071764(void);
static u8 SaveDialogCB_8071794(void);
static u8 SaveDialogCB_80717B8(void);
static u8 SaveDialogCB_80717D8(void);
static u8 SaveDialogCB_SaveFileExists(void);
static u8 SaveDialogCB_DisplayOverwriteYesNoMenu(void);
static u8 SaveDialogCB_ProcessOverwriteYesNoMenu(void);
static u8 SaveDialogCB_SavingMessage(void);
static u8 SaveDialogCB_DoSave(void);
static u8 SaveDialogCB_SaveSuccess(void);
static u8 SaveDialogCB_8071988(void);
static u8 SaveDialogCB_80719AC(void);
static u8 SaveDialogCB_80719D4(void);
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
    if(FlagGet(0x801) == TRUE)
        AddStartMenuAction(MENU_ACTION_POKEDEX);
    if(FlagGet(0x800) == TRUE)
        AddStartMenuAction(MENU_ACTION_POKEMON);
    AddStartMenuAction(MENU_ACTION_BAG);
    if(FlagGet(0x802) == TRUE)
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
    if(FlagGet(0x802) == TRUE)
        AddStartMenuAction(MENU_ACTION_POKENAV);
    AddStartMenuAction(MENU_ACTION_PLAYER_LINK);
    AddStartMenuAction(MENU_ACTION_OPTION);
    AddStartMenuAction(MENU_ACTION_EXIT);    
}

//Show number of safari balls left
static void DisplaySafariBallsWindow(void)
{
    sub_8072C44(gStringVar1, gUnknown_02038808, 12, 1);
    MenuDrawTextWindow(0, 0, 10, 5);
    MenuPrint(gOtherText_SafariStock, 1, 1);
}

static bool32 sub_8071114(s16 *a, u32 b)
{
    s32 var = *a;
    
    do
    {
        MenuPrint(gStartMenuItems[sCurrentStartMenuActions[var]].text,
                  0x17, var * 2 + 2);
        var++;
        if(var >= sNumStartMenuActions)
        {
            *a = var;
            return 1;
        }
    }
    while(--b != 0);
    *a = var;
    return 0;
}

static bool32 sub_807117C(s16 *a, s16 *b)
{
    switch(*a)
    {
        case 1:
            BuildStartMenuActions();
            (*a)++;
            break;
        case 2:
            MenuDrawTextWindow(22, 0, 29, sNumStartMenuActions * 2 + 3);
            *b = 0;
            (*a)++;
            break;
        case 3:
            if(GetSafariZoneFlag())
                DisplaySafariBallsWindow();
            (*a)++;
            break;
        case 4:
            if(sub_8071114(b, 2))
                (*a)++;
            break;
        case 0:
            (*a)++;
            break;
        case 5:
            sStartMenuCursorPos = InitMenu(0, 0x17, 2, sNumStartMenuActions, sStartMenuCursorPos, 6);
            return TRUE;
    }
    return FALSE;
}

static void sub_8071230(void)
{
    s16 a = 0;
    s16 b = 0;
    
    while(sub_807117C(&a, &b) == FALSE)
        ;
}

static void Task_StartMenu(u8 taskId)
{
    if(sub_807117C(gTasks[taskId].data, gTasks[taskId].data + 1) == TRUE)
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
            gCallback_03004AE8 = Callback_8071338;
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
        player_bitmagic();
        sub_80594C0();
        sub_80597F4();
    }
    CreateStartMenuTask(sub_80712B4);
    ScriptContext2_Enable();
}

static u8 Callback_8071338(void)
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
        if(gStartMenuItems[sCurrentStartMenuActions[sStartMenuCursorPos]].callback == StartMenu_PokedexCallback)
        {
            if(pokedex_count(0) == 0)
                return 0;
        }
        gCallback_03004AE8 = gStartMenuItems[sCurrentStartMenuActions[sStartMenuCursorPos]].callback;
        if(StartMenu_SaveCallback != gCallback_03004AE8 &&
           StartMenu_ExitCallback != gCallback_03004AE8 &&
           StartMenu_RetireCallback != gCallback_03004AE8)
            fade_screen(1, 0);
        return 0;
    }
    if(gMain.newKeys & (START_BUTTON | B_BUTTON))
    {
        sub_8071C20();
        return 1;
    }
    return 0;
}

//When player selects POKEDEX
u8 StartMenu_PokedexCallback(void)
{
    if(!gPaletteFade.active)
    {
        sav12_xor_increment(0x29);
        play_some_sound();
        SetMainCallback2(sub_808C27C);
        return 1;
    }
    return 0;
}

//When player selects POKEMON
u8 StartMenu_PokemonCallback(void)
{
    if(!gPaletteFade.active)
    {
        play_some_sound();
        SetMainCallback2(sub_8089A70);
        return 1;
    }
    return 0;
}

//When player selects BAG
u8 StartMenu_BagCallback(void)
{
    if(!gPaletteFade.active)
    {
        play_some_sound();
        SetMainCallback2(sub_80A53F8);
        return 1;
    }
    return 0;
}

//When player selects POKENAV
u8 StartMenu_PokenavCallback(void)
{
    if(!gPaletteFade.active)
    {
        play_some_sound();
        SetMainCallback2(sub_80EBA5C);
        return 1;
    }
    return 0;
}

//When player selects his/her name
u8 StartMenu_PlayerCallback(void)
{
    if(!gPaletteFade.active)
    {
        play_some_sound();
        sub_8093110(sub_805469C);
        return 1;
    }
    return 0;
}

//When player selects SAVE
u8 StartMenu_SaveCallback(void)
{
    sub_8072DEC();
    gCallback_03004AE8 = SaveCallback1;
    return 0;
}

//When player selects OPTION
u8 StartMenu_OptionCallback(void)
{
    if(!gPaletteFade.active)
    {
        play_some_sound();
        SetMainCallback2(CB2_InitOptionMenu);
        gMain.field_8 = sub_805469C;
        return 1;
    }
    return 0;
}

//When player selects EXIT
u8 StartMenu_ExitCallback(void)
{
    sub_8071C20();
    return 1;
}

//When player selects RETIRE
u8 StartMenu_RetireCallback(void)
{
    sub_8071C20();
    sub_80C823C();
    return 1;
}

//When player selects their name in multiplayer mode
u8 StartMenu_PlayerLinkCallback(void)
{
    if(!gPaletteFade.active)
    {
        play_some_sound();
        sub_8093130(gUnknown_03004860, sub_805469C);
        return 1;
    }
    return 0;
}

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
        case 0:
            return FALSE;
        case 2:
            MenuZeroFillScreen();
            sub_8071230();
            gCallback_03004AE8 = Callback_8071338;
            return FALSE;
        case 1:
        case 3:
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
    saveDialogCallback = SaveDialogCB_8071794;
    gUnknown_030006AD = FALSE;
}

static u8 RunSaveDialogCallback(void)
{
    if(gUnknown_030006AD)
    {
        if(!MenuUpdateWindowText())
            return 0;
    }
    gUnknown_030006AD = FALSE;
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
    gUnknown_030006AD = TRUE;
    saveDialogCallback = func;
}

static void Task_SaveDialog(u8 taskId)
{
    u8 b = RunSaveDialogCallback();
    
    switch(b)
    {
        case 2:
        case 3:
            gScriptResult = 0;
            break;        
        case 1:
            gScriptResult = b;
            break;
        case 0:
            return;
    }
    DestroyTask(taskId);
    EnableBothScriptContexts();
}

static void sub_8071700(void)
{
    sub_80946C8(0, 0);
}

static void EraseSaveDialog(void)
{
    MenuZeroFillWindowRect(20, 8, 26, 13);
}

static void sub_8071724(void)
{
    gUnknown_030006AC = 0x3C;
}


static u8 sub_8071730(void)
{
    gUnknown_030006AC--;
    if(!(gMain.heldKeys & 1))
    {
        if(gUnknown_030006AC)
            return 0;
    }
    else
        PlaySE(SE_SELECT);
    return 1;
}


static u8 sub_8071764(void)
{
    if(gUnknown_030006AC == 0)
    {
        if(gMain.heldKeys & 1)
            return 1;
    }
    else
        gUnknown_030006AC--;
    return 0;
        
}

static u8 SaveDialogCB_8071794(void)
{
    MenuZeroFillScreen();
    sub_80945C0(0, 0);
    //"Would you like to save the game?"
    DisplaySaveMessageWithCallback(gSaveText_WouldYouLikeToSave, SaveDialogCB_80717B8);
    return 0;
}

static u8 SaveDialogCB_80717B8(void)
{
    DisplayYesNoMenu(20, 8, 1);
    saveDialogCallback = SaveDialogCB_80717D8;
    return 0;
}

static u8 SaveDialogCB_80717D8(void)
{
    switch(ProcessMenuInputNoWrap_())
    {
        case 0:     //YES
            EraseSaveDialog();
            switch(gSaveFileStatus)
            {
                case 0:
                case 2:
                    if(gUnknown_020297EC == FALSE)
                    {
                        saveDialogCallback = SaveDialogCB_SaveFileExists;
                        return 0;
                    }
                    saveDialogCallback = SaveDialogCB_SavingMessage;
                    return 0;
                default:
                    saveDialogCallback = SaveDialogCB_SaveFileExists;
                    return 0;
            }
            break;
        case -1:    //B button
        case 1:     //NO
            EraseSaveDialog();
            sub_8071700();
            return 2;
    }
    return 0;
}

static u8 SaveDialogCB_SaveFileExists(void)
{
    DisplaySaveMessageWithCallback(
      gUnknown_020297EC == TRUE ? gSaveText_ThereIsADifferentFile : gSaveText_ThereIsAlreadyAFile,
      SaveDialogCB_DisplayOverwriteYesNoMenu);
    return 0;
}

static u8 SaveDialogCB_DisplayOverwriteYesNoMenu(void)
{
    DisplayYesNoMenu(20, 8, 1);
    saveDialogCallback = SaveDialogCB_ProcessOverwriteYesNoMenu;
    return 0;
}

static u8 SaveDialogCB_ProcessOverwriteYesNoMenu(void)
{
    switch(ProcessMenuInputNoWrap_())
    {
        case 0:     //YES
            EraseSaveDialog();
            saveDialogCallback = SaveDialogCB_SavingMessage;
            break;
        case -1:    //B button
        case 1:     //NO
            EraseSaveDialog();
            sub_8071700();
            return 2;
    }
    return 0;
}

static u8 SaveDialogCB_SavingMessage(void)
{
    //"SAVING... DON'T TURN OFF THE POWER."
    DisplaySaveMessageWithCallback(gSaveText_DontTurnOff, SaveDialogCB_DoSave);
    return 0;
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
        DisplaySaveMessageWithCallback(gSystemText_SaveErrorExchangeBackup, SaveDialogCB_80719AC);
    }
    
    sub_8071724();
    return 0;
}

static u8 SaveDialogCB_SaveSuccess(void)
{
    if(MenuUpdateWindowText())
    {
        PlaySE(SE_SAVE);
        saveDialogCallback = SaveDialogCB_8071988;
    }
    return 0;
}

static u8 SaveDialogCB_8071988(void)
{
    if(!IsSEPlaying() && sub_8071730())
    {
        sub_8071700();
        return 1;
    }
    else
        return 0;
}

static u8 SaveDialogCB_80719AC(void)
{
    if(MenuUpdateWindowText())
    {
        PlaySE(SE_BOO);
        saveDialogCallback = SaveDialogCB_80719D4;
    }
    return 0;
}

static u8 SaveDialogCB_80719D4(void)
{
    if(!sub_8071764())
        return 0;
    else
    {
        sub_8071700();
        return 3;
    }
}

static void sub_80719F0(void)
{
    TransferPlttBuffer();
}

static bool32 sub_80719FC(u8 *ptr)
{
    switch(*ptr)
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
    (*ptr)++;
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
    s16 *val = gTasks[taskId].data;
    
    if(!gPaletteFade.active)
    {
        switch(*val)
        {
            case 0:
                MenuDisplayMessageBox();
                MenuPrint(gSystemText_Saving, 2, 15);
                BeginNormalPaletteFade(-1, 0, 0x10, 0, 0);
                (*val)++;
                break;
            case 1:
                sub_8047A1C();
                sub_8125E2C();
                (*val)++;
                break;
            case 2:
                if(!sub_8125E6C())
                    break;
                sub_8047A34();
                (*val)++;
                break;
            case 3:
                BeginNormalPaletteFade(-1, 0, 0, 0x10, 0);
                (*val)++;
                break;
            case 4:
                SetMainCallback2(gMain.field_8);
                DestroyTask(taskId);
                break;                
        }
    }
}

void sub_8071C20(void)
{
    PlaySE(SE_SELECT);
    MenuZeroFillScreen();
    sub_8064E2C();
    ScriptContext2_Disable();
    sub_8072DEC();
}

void AppendToList(u8 *list, u8 *pindex, u32 value)
{
    list[*pindex] = value;
    (*pindex)++;
}
