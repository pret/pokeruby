#include "global.h"
#include "asm.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "songs.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "task.h"
#include "text.h"

struct UnknownStruct2
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
    const u8 *title;
};

struct UnknownStruct1
{
    u8 unk0;  //state
    u8 unk1;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
    u8 unkC;
    u8 unkD;
    u8 unkE;
    u8 fillerF[2];
    u8 unk11[0x10];
    u8 filler21[0x13];
    /*0x34*/ const struct UnknownStruct2 *unk34;
    /*0x38*/ u8 *nameBuffer;
    u16 unk3C;  //savedKeyRepeatStartDelay
    u16 unk3E;
    u16 unk40;
    u32 unk44;
    /*0x48*/ MainCallback returnCallback;
};

extern u16 gKeyRepeatStartDelay;

extern u8 unk_2000000[];

#define EWRAM_000000 (*(struct UnknownStruct1 *)(unk_2000000))

extern const struct UnknownStruct2 *const gUnknown_083CE398[];
extern u8 (*const gUnknown_083CE218[])(struct Task *);
extern u8 (*const gUnknown_083CE240[])(u8);

void C2_NamingScreen(void);
void sub_80B5AA0(void);
//void AddNamingScreenTask();
void AddNamingScreenTask(u8, u8 *, u16, u16, u32, MainCallback);
void NamingScreen_TurnOffScreen(void);
void NamingScreen_Init(void);
void NamingScreen_ClearVram(void);
void NamingScreen_ClearOam(void);
void NamingScreen_SetUpVideoRegs(void);
void sub_80B5DC8(void);
void NamingScreen_ResetObjects(void);
void sub_80B5DFC(void);
void sub_80B5E20(void);
void sub_80B5E3C(void);
void sub_80B5C04(void);
void NamingScreenDummyTask(u8);
void sub_80B7558(void);
void sub_80B753C(void);
void sub_80B7680(void);
void sub_80B75C4(void);
void sub_80B7794(void);
void sub_80B78A8(void);
void sub_80B7960(void);
void sub_80B6774(void);
void sub_80B6A80(void);
void sub_80B6CA8(void);
void sub_80B6D04(void);
void sub_80B6E44(void);
void sub_80B61D8(void);
void sub_80B6438(void);
void sub_80B5E50(void);
void sub_80B5E70(u8);
void sub_80B6210(u8);
void sub_80B68D8();
u8 sub_80B60B8(void);
u8 sub_80B6938(void);
void sub_80B6878(void);
void sub_80B6B14(void);
void sub_80B65F0(void);
void sub_80B6888();
void sub_80B6460();
u8 sub_80B6610(void);
void sub_80B7614(void);
void sub_80B6858();
void sub_80B680C();
void sub_80B77F8(void);
void sub_80B74B0(void);
void sub_80B74FC(void);
u8 sub_80B6958(void);
u8 sub_80B61C8(void);
void sub_80B6FBC(void);
void sub_80B7090(void);
u8 sub_80B61EC(void);
u8 sub_80B7004(void);
void sub_80B6914(void);
void sub_80B623C(u8);

void DoNamingScreen(u8 a, u8 *nameBuffer, u16 c, u16 d, u32 e, MainCallback returnCallback)
{
    AddNamingScreenTask(a, nameBuffer, c, d, e, returnCallback);
    SetMainCallback2(C2_NamingScreen);
}

void C2_NamingScreen(void)
{
    switch (gMain.state)
    {
    case 0:
        NamingScreen_TurnOffScreen();
        NamingScreen_Init();
        gMain.state++;
        break;
    case 1:
        NamingScreen_ClearVram();
        gMain.state++;
        break;
    case 2:
        NamingScreen_ClearOam();
        gMain.state++;
        break;
    case 3:
        NamingScreen_SetUpVideoRegs();
        gMain.state++;
        break;
    case 4:
        sub_80B5DC8();
        gMain.state++;
        break;
    case 5:
        NamingScreen_ResetObjects();
        gMain.state++;
        break;
    case 6:
        sub_80B5DFC();
        gMain.state++;
        break;
    case 7:
        sub_80B5E20();
        sub_80B5E3C();
        sub_80B5C04();
        SetMainCallback2(sub_80B5AA0);
        break;
    }
}

void sub_80B5AA0(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_80B5AB8(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    REG_BG1VOFS = EWRAM_000000.unk4;
    REG_BG2VOFS = EWRAM_000000.unk6;
    REG_BG1CNT &= 0xFFFC;
    REG_BG1CNT |= EWRAM_000000.unk8;
    REG_BG2CNT &= 0xFFFC;
    REG_BG2CNT |= EWRAM_000000.unkA;
}

void AddNamingScreenTask(u8 a, u8 *nameBuffer, u16 c, u16 d, u32 e, MainCallback returnCallback)
{
    struct Task *task;
    
    task = &gTasks[CreateTask(NamingScreenDummyTask, 0xFF)];
    task->data[0] = a;
    task->data[1] = c;
    task->data[2] = d;
    task->data[3] = e >> 16;
    task->data[4] = e;
    StoreWordInTwoHalfwords(&task->data[5], (u32)nameBuffer);
    StoreWordInTwoHalfwords(&task->data[7], (u32)returnCallback);
}

void GetNamingScreenParameters(void)
{
    u8 taskId;
    struct Task *task;
    
    taskId = FindTaskIdByFunc(NamingScreenDummyTask);
    task = &gTasks[taskId];
    EWRAM_000000.unk1 = task->data[0];
    EWRAM_000000.unk3E = task->data[1];
    EWRAM_000000.unk40 = task->data[2];
    EWRAM_000000.unk44 = (task->data[3] << 16) | (u16)task->data[4];
    LoadWordFromTwoHalfwords(&task->data[5], (u32 *)&EWRAM_000000.nameBuffer);
    LoadWordFromTwoHalfwords(&task->data[7], (u32 *)&EWRAM_000000.returnCallback);
    DestroyTask(taskId);
}

void NamingScreenDummyTask(u8 taskId)
{
}

void NamingScreen_TurnOffScreen(void)
{
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
    REG_DISPCNT = 0;
}

void sub_80B5C04(void)
{
    u16 savedIme;
    
    SetVBlankCallback(sub_80B5AB8);
    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;
    REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON;
}

void NamingScreen_ClearVram(void)
{
    u8 *addr = (void *)VRAM;
    u32 size = 0x10000;
    
    while (1)
    {
        DmaFill16(3, 0, addr, 0x1000);
        addr += 0x1000;
        size -= 0x1000;
        if (size <= 0x1000)
        {
            DmaFill16(3, 0, addr, size);
            break;
        }
    }
}

void NamingScreen_ClearOam(void)
{
    DmaClear16(3, (void *)OAM, 0x400);
}

void NamingScreen_SetUpVideoRegs(void)
{
    REG_BG0CNT = 0;
    REG_BG1CNT = 0;
    REG_BG2CNT = 0;
    REG_BG3CNT = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
    REG_BG0CNT = 0x1F00;
    REG_BG1CNT = 0x1C01;
    REG_BG2CNT = 0x1D0A;
    REG_BG3CNT = 0x1E03;
    REG_BLDCNT = 0x640;
    REG_BLDALPHA = 0x80C;
}

void NamingScreen_Init(void)
{
    GetNamingScreenParameters();
    EWRAM_000000.unk0 = 0;
    EWRAM_000000.unk4 = 0;
    EWRAM_000000.unk6 = 0;
    EWRAM_000000.unk8 = 1;
    EWRAM_000000.unkA = 2;
    EWRAM_000000.unkC = 0;
    EWRAM_000000.unkD = 1;
    EWRAM_000000.unk34 = gUnknown_083CE398[EWRAM_000000.unk1];
    EWRAM_000000.unkE = EWRAM_000000.unk34->unk4;
    EWRAM_000000.unk2 = 14 - EWRAM_000000.unk34->unk1 / 2;
    EWRAM_000000.unk3C = gKeyRepeatStartDelay;
    memset(EWRAM_000000.unk11, 0xFF, 0x10);
    if (EWRAM_000000.unk34->unk0 != 0)
        StringCopy(EWRAM_000000.unk11, EWRAM_000000.nameBuffer);
    gKeyRepeatStartDelay = 16;
}

void sub_80B5DC8(void)
{
    SetUpWindowConfig(&gWindowConfig_81E6E88);
    InitMenuWindow(&gWindowConfig_81E6E88);
}

void NamingScreen_ResetObjects(void)
{
    ResetPaletteFade();
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
}

void sub_80B5DFC(void)
{
    sub_80B7558();
    sub_80B753C();
    sub_80B7680();
    sub_80B75C4();
    sub_80B7794();
    sub_80B78A8();
    sub_80B7960();
}

void sub_80B5E20(void)
{
    sub_80B6774();
    sub_80B6A80();
    sub_80B6CA8();
    sub_80B6D04();
    sub_80B6E44();
}

void sub_80B5E3C(void)
{
    sub_80B61D8();
    sub_80B6438();
    sub_80B5E50();
}

void sub_80B5E50(void)
{
    u8 taskId;
    
    taskId = CreateTask(sub_80B5E70, 2);
    sub_80B5E70(taskId);
}

void sub_80B5E70(u8 taskId)
{
    while (gUnknown_083CE218[EWRAM_000000.unk0](&gTasks[taskId]) != 0)
        ;
}

u8 sub_80B5EA8(struct Task *task)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
    EWRAM_000000.unk0++;
    return 0;
}

u8 sub_80B5ED0(struct Task *task)
{
    if (!gPaletteFade.active)
    {
        sub_80B6210(1);
        sub_80B68D8(1);
        EWRAM_000000.unk0++;
    }
    return 0;
}

u8 sub_80B5F00(struct Task *task)
{
    return sub_80B60B8();
}

u8 sub_80B5F10(struct Task *task)
{
    if (sub_80B6938() != 0)
    {
        sub_80B6210(1);
        sub_80B6878();
        EWRAM_000000.unk0 = 2;
    }
    return 0;
}

u8 sub_80B5F38(struct Task *task)
{
    sub_80B6210(0);
    sub_80B6B14();
    sub_80B65F0();
    sub_80B6888(1);
    sub_80B6460(0, 0, 1);
    PlaySE(SE_WIN_OPEN);
    EWRAM_000000.unk0 = 5;
    return 0;
}

u8 sub_80B5F70(struct Task *task)
{
    s16 var1;
    s16 var2;
    
    if (sub_80B6610() != 0)
    {
        EWRAM_000000.unk0 = 2;
        EWRAM_000000.unkE++;
        EWRAM_000000.unkE %= 3;
        sub_80B7614();
        sub_80B77F8();
        sub_80B6210(1);
        sub_80B6858(&var1, &var2);
        if (EWRAM_000000.unkE == 2 && (u16)(var1 - 6) <= 1)
            var1 = 5;
        sub_80B680C(var1, var2);
        sub_80B6888(0);
    }
    return 0;
}

u8 pokemon_store(struct Task *task)
{
    sub_80B74B0();
    sub_80B6210(0);
    sub_80B68D8(0);
    sub_80B6460(3, 0, 1);
    gKeyRepeatStartDelay = EWRAM_000000.unk3C;
    if (EWRAM_000000.unk1 == 2 && CalculatePlayerPartyCount() > 5)
    {
        sub_80B74FC();
        EWRAM_000000.unk0 = 7;
        return 0;
    }
    else
    {
        EWRAM_000000.unk0 = 8;
        return 1;
    }
}

u8 sub_80B604C(struct Task *task)
{
    if (MenuUpdateWindowText())
        EWRAM_000000.unk0++;
    return 0;
}

u8 sub_80B606C(struct Task *task)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    EWRAM_000000.unk0++;
    return 0;
}

u8 sub_80B6094(struct Task *task)
{
    if (!gPaletteFade.active)
        SetMainCallback2(EWRAM_000000.returnCallback);
    return 0;
}

u8 sub_80B60B8(void)
{
    u8 var = sub_80B61EC();
    u8 r0 = sub_80B6958();
    
    if (var == 8)
        return sub_80B61C8();
    else if (var == 6)
    {
        sub_80B6FBC();
        return 0;
    }
    else if (var == 7)
    {
        sub_80B7090();
        return 0;
    }
    return gUnknown_083CE240[r0](var);
}

u8 sub_80B6108(u8 a)
{
    sub_80B6460(3, 0, 0);
    if (a == 5)
    {
        u8 var = sub_80B7004();
        
        sub_80B6914();
        if (var != 0)
        {
            sub_80B6210(0);
            EWRAM_000000.unk0 = 3;
        }
    }
    return 0;
}

u8 sub_80B6148(u8 a)
{
    sub_80B6460(0, 1, 0);
    if (a == 5)
        return sub_80B61C8();
    else
        return 0;
}

u8 sub_80B6170(u8 a)
{
    sub_80B6460(1, 1, 0);
    if (a == 5)
        sub_80B6FBC();
    return 0;
}

u8 sub_80B6194(u8 a)
{
    sub_80B6460(2, 1, 0);
    if (a == 5)
    {
        PlaySE(SE_SELECT);
        EWRAM_000000.unk0 = 6;
        return 1;
    }
    else
        return 0;
}

u8 sub_80B61C8(void)
{
    EWRAM_000000.unk0 = 4;
    return 1;
}

void sub_80B61D8(void)
{
    CreateTask(sub_80B623C, 1);
}

u8 sub_80B61EC(void)
{
    u8 taskId = FindTaskIdByFunc(sub_80B623C);
    
    return gTasks[taskId].data[1];
}

void sub_80B6210(u8 a)
{
    u8 taskId = FindTaskIdByFunc(sub_80B623C);
    
    gTasks[taskId].data[0] = a;
}
