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

extern void sub_8064E2C(void);
extern void sub_8047A1C(void);
extern u8 sub_8125E6C(void);
extern void sub_8047A34(void);
extern void sub_8125E2C(void);
extern void remove_some_task(void);
extern u8 sub_8071764(void);
extern void sub_8071700(void);
extern void dp12_8087EA4(void);
extern void sub_8071700(void);
extern void sav12_xor_increment(u8 index);
extern u8 sub_8125D44(u8);
extern void sub_80945C0(u8, u8);
extern void sub_80946C8(u8, u8);
extern void save_serialize_map(void);
extern void sub_8071230(void);
extern u8 sub_8071338(void);
extern void play_some_sound(void);
extern void sub_8093130(u8, void (*)(void));
extern void sub_805469C(void);
extern void sub_80C823C(void);
extern u8 sub_80715A4(void);
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
extern bool32 sub_807117C(s16 *, s16 *);
extern bool32 sub_8071114(void *, u32);
extern bool32 GetSafariZoneFlag(void);
extern void sub_80710DC(void);
extern void sub_8070FB4(void);

struct MenuItem {
    u8 *text;
    u8 (*callback)(void);
};

extern u8 gSystemText_Saving[];
extern u8 (*gUnknown_030006A8)(void);
extern u8 gUnknown_020297EC;
extern u8 gSaveText_PlayerSavedTheGame[];
extern u8 gSaveText_DontTurnOff[];
extern u8 gSystemText_SaveErrorExchangeBackup[];
extern u8 gSaveText_ThereIsAlreadyAFile[];
extern u8 gSaveText_ThereIsADifferentFile[];
extern u16 gSaveFileStatus;
extern u8 gSaveText_WouldYouLikeToSave[];
extern u8 gUnknown_030006AC;
extern u16 gScriptResult;
extern u8 gUnknown_030006AD;
extern u8 (*gUnknown_03004AE8)(void);
extern u8 gUnknown_03004860;
extern struct MenuItem gStartMenuItems[];
extern u8 gUnknown_0202E8FC;
extern u8 gUnknown_0202E8FE[];
extern u8 gUnknown_0202E8FD;

static void sub_8071B64(u8 taskId);
static void sub_8071B54(void);
static bool32 sub_80719FC(u8 *ptr);
static void sub_80719F0(void);
static u8 sub_80719D4(void);
static u8 sub_8071988(void);
static u8 sub_8071960(void);
static u8 sub_80719AC(void);
static u8 sub_8071900(void);
u8 sub_80718E8(void);
static u8 sub_807189C(void);
static u8 sub_807187C(void);
u8 sub_8071850(void);
u8 sub_80717D8(void);
u8 sub_80717B8(void);
void sub_8071724(void);
u8 sub_8071730(void);
void sub_8071710(void);
void sub_8071700(void);
void sub_8071684(u8 *, u8 (*)(void));
void task50_save_game(u8 a);
u8 sub_8071794(void);
u8 sub_80715C0(void);
u8 sub_8071630(void);
void sub_807160C(void);
void sub_8071C20(void);
u8 StartMenu_Pokedex(void);
u8 sub_80714FC(void);
u8 sub_8071554(void);
u8 sub_8071560(void);
void sub_80712B4(u8);
void sub_8071284(void (*)(u8));

bool32 sub_807117C(s16 *a, s16 *b)
{
    switch(*a)
    {
        case 1:
            sub_8070FB4();
            (*a)++;
            break;
        case 2:
            MenuDrawTextWindow(22, 0, 29, ((gUnknown_0202E8FD << 25) + 0x3000000) >> 24);
            *b = 0;
            (*a)++;
            break;
        case 3:
            if(GetSafariZoneFlag())
                sub_80710DC();
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
            gUnknown_0202E8FC = InitMenu(0, 0x17, 2, gUnknown_0202E8FD, gUnknown_0202E8FC, 6);
            return 1;
    }
    return 0;
}

void sub_8071230(void)
{
    s16 a = 0;
    s16 b = 0;
    
    while(!sub_807117C(&a, &b))
        ;
}

void task50_startmenu(u8 taskId)
{
    if(sub_807117C(gTasks[taskId].data, gTasks[taskId].data + 1) == 1)
    {
        *gTasks[taskId].data = 0;
        SwitchTaskToFollowupFunc(taskId);
    }
}

void sub_8071284(void (*func)(u8))
{
    u8 taskId;
    
    InitMenuWindow(&gWindowConfig_81E6CE4);
    taskId = CreateTask(task50_startmenu, 0x50);
    SetTaskFuncWithFollowupFunc(taskId, task50_startmenu, func);
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
            gUnknown_03004AE8 = sub_8071338;
            ((struct MyTask *)&gTasks[taskId])->var1++;
            break;
        case 1:
            if(gUnknown_03004AE8() == 1)
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
    sub_8071284(sub_80712B4);
    ScriptContext2_Enable();
}

u8 sub_8071338(void)
{
    if(gMain.newKeys & 0x40)
    {
        PlaySE(SE_SELECT);
        gUnknown_0202E8FC = MoveMenuCursor(-1);
    }
    if(gMain.newKeys & 0x80)
    {
        PlaySE(SE_SELECT);
        gUnknown_0202E8FC = MoveMenuCursor(1);
    }
    if(gMain.newKeys & 1)
    {
        PlaySE(SE_SELECT);
        if(gStartMenuItems[gUnknown_0202E8FE[gUnknown_0202E8FC]].callback == StartMenu_Pokedex)
        {
            if(pokedex_count(0) == 0)
                return 0;
        }
        gUnknown_03004AE8 = gStartMenuItems[gUnknown_0202E8FE[gUnknown_0202E8FC]].callback;
        if(sub_80714FC != gUnknown_03004AE8 &&
           sub_8071554 != gUnknown_03004AE8 &&
           sub_8071560 != gUnknown_03004AE8)
            fade_screen(1, 0);
        return 0;
    }
    if(gMain.newKeys & 0xA)
    {
        sub_8071C20();
        return 1;
    }
    return 0;
}

u8 StartMenu_Pokedex(void)
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

u8 sub_807144C(void)
{
    if(!gPaletteFade.active)
    {
        play_some_sound();
        SetMainCallback2(sub_8089A70);
        return 1;
    }
    return 0;
}

u8 sub_8071478(void)
{
    if(!gPaletteFade.active)
    {
        play_some_sound();
        SetMainCallback2(sub_80A53F8);
        return 1;
    }
    return 0;
}

u8 sub_80714A4(void)
{
    if(!gPaletteFade.active)
    {
        play_some_sound();
        SetMainCallback2(sub_80EBA5C);
        return 1;
    }
    return 0;
}

u8 sub_80714D0(void)
{
    if(!gPaletteFade.active)
    {
        play_some_sound();
        sub_8093110(sub_805469C);
        return 1;
    }
    return 0;
}


u8 sub_80714FC(void)
{
    sub_8072DEC();
    gUnknown_03004AE8 = sub_80715A4;
    return 0;
}

u8 sub_8071518(void)
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

u8 sub_8071554(void)
{
    sub_8071C20();
    return 1;
}

u8 sub_8071560(void)
{
    sub_8071C20();
    sub_80C823C();
    return 1;
}

u8 sub_8071570(void)
{
    if(!gPaletteFade.active)
    {
        play_some_sound();
        sub_8093130(gUnknown_03004860, sub_805469C);
        return 1;
    }
    return 0;
}

u8 sub_80715A4(void)
{
    sub_807160C();
    gUnknown_03004AE8 = sub_80715C0;
    return 0;
}

u8 sub_80715C0(void)
{
    switch(sub_8071630())
    {
        case 0:
            return 0;
        case 2:
            MenuZeroFillScreen();
            sub_8071230();
            gUnknown_03004AE8 = sub_8071338;
            return 0;
        case 1:
        case 3:
            MenuZeroFillScreen();
            sub_8064E2C();
            ScriptContext2_Disable();
            return 1;
    }
    return 0;
} 

void sub_807160C(void)
{
    save_serialize_map();
    gUnknown_030006A8 = sub_8071794;
    gUnknown_030006AD = 0;
}

u8 sub_8071630(void)
{
    if(gUnknown_030006AD != 0)
    {
        if(MenuUpdateWindowText() == 0)
            return 0;
    }
    gUnknown_030006AD = 0;
    return gUnknown_030006A8();
}

void sub_807166C(void)
{
    sub_807160C();
    CreateTask(task50_save_game, 0x50);
}

void sub_8071684(u8 *ptr, u8 (*func)(void))
{
    StringExpandPlaceholders(gStringVar4, ptr);
    MenuDisplayMessageBox();
    sub_8072044(gStringVar4);
    gUnknown_030006AD = 1;
    gUnknown_030006A8 = func;
}

void task50_save_game(u8 a)
{
    u8 b = sub_8071630();
    
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
    DestroyTask(a);
    EnableBothScriptContexts();
}

void sub_8071700(void)
{
    sub_80946C8(0, 0);
}

void sub_8071710(void)
{
    MenuZeroFillWindowRect(20, 8, 26, 13);
}

void sub_8071724(void)
{
    gUnknown_030006AC = 0x3C;
}


u8 sub_8071730(void)
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


u8 sub_8071764(void)
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

u8 sub_8071794(void)
{
    MenuZeroFillScreen();
    sub_80945C0(0, 0);
    sub_8071684(gSaveText_WouldYouLikeToSave, sub_80717B8);
    return 0;
}

u8 sub_80717B8(void)
{
    DisplayYesNoMenu(20, 8, 1);
    gUnknown_030006A8 = sub_80717D8;
    return 0;
}

u8 sub_80717D8(void)
{
    switch(ProcessMenuInputNoWrap_())
    {
        case 0:
            sub_8071710();
            switch(gSaveFileStatus)
            {
                case 0:
                case 2:
                    if(gUnknown_020297EC == 0)
                    {
                default:
                        gUnknown_030006A8 = sub_8071850;
                        return 0;
                    }
                    gUnknown_030006A8 = sub_80718E8;
                    return 0;
            }
            break;
        case -1:
        case 1:
            sub_8071710();
            sub_8071700();
            return 2;
    }
    return 0;
}

u8 sub_8071850(void)
{
    sub_8071684(
      gUnknown_020297EC == 1 ? gSaveText_ThereIsADifferentFile : gSaveText_ThereIsAlreadyAFile,
      sub_807187C);
    return 0;
}

static u8 sub_807187C(void)
{
    DisplayYesNoMenu(20, 8, 1);
    gUnknown_030006A8 = sub_807189C;
    return 0;
}

static u8 sub_807189C(void)
{
    switch(ProcessMenuInputNoWrap_())
    {
        case 0:
            sub_8071710();
            gUnknown_030006A8 = sub_80718E8;
            break;
        case -1:
        case 1:
            sub_8071710();
            sub_8071700();
            return 2;
    }
    return 0;
}

u8 sub_80718E8(void)
{
    sub_8071684(gSaveText_DontTurnOff, sub_8071900);
    return 0;
}

static u8 sub_8071900(void)
{
    u8 a;
    
    sav12_xor_increment(0);
    if(gUnknown_020297EC == 1)
    {
        a = sub_8125D44(4);
        gUnknown_020297EC = 0;
    }
    else
    {
        a = sub_8125D44(0);
    }
    if(a == 1)
        sub_8071684(gSaveText_PlayerSavedTheGame, sub_8071960);
    else
        sub_8071684(gSystemText_SaveErrorExchangeBackup, sub_80719AC);
    sub_8071724();
    return 0;
}

static u8 sub_8071960(void)
{
    if(MenuUpdateWindowText())
    {
        PlaySE(0x37);
        gUnknown_030006A8 = sub_8071988;
    }
    return 0;
}

static u8 sub_8071988(void)
{
    if(!IsSEPlaying() && sub_8071730())
    {
        sub_8071700();
        return 1;
    }
    else
        return 0;
}

static u8 sub_80719AC(void)
{
    if(MenuUpdateWindowText())
    {
        PlaySE(0x16);
        gUnknown_030006A8 = sub_80719D4;
    }
    return 0;
}

static u8 sub_80719D4(void)
{
    if(!sub_8071764())
        return 0;
    else
    {
        sub_8071700();
        return 3;
    }
}

void sub_80719F0(void)
{
    TransferPlttBuffer();
}

bool32 sub_80719FC(u8 *ptr)
{
    register u8 *addr asm("r2");
    u32 size;
    
    switch(*ptr)
    {
        case 0:            
            REG_DISPCNT = 0;
            SetVBlankCallback(NULL);
            remove_some_task();
            
            addr = (void *)PLTT;
            
            DmaFill16(3, 0, addr, PLTT_SIZE);
            
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
        CreateTask(sub_8071B64, 0x50);
        SetMainCallback2(sub_8071B54);
    }
}

void sub_8071B54(void)
{
    RunTasks();
    UpdatePaletteFade();
}

void sub_8071B64(u8 taskId)
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
                //more stuff
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

void append_byte(u8 *a, u8 *b, u32 c)
{
    *(*b + a) = c;
    (*b)++;
}