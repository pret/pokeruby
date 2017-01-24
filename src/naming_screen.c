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
#include "trig.h"

struct UnknownStruct2
{
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;  //mode?
    u8 unk5;
    u8 unk6;
    u8 unk7;
    const u8 *title;
};

struct UnknownStruct1
{
    u8 state;  //state
    u8 mode;
    u16 unk2;
    u16 unk4;
    u16 unk6;
    u16 unk8;
    u16 unkA;
    u8 unkC;
    u8 unkD;
    u8 currentPage;  //page?
    u8 cursorSpriteId;  //spriteId
    u8 filler10[1];
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

enum
{
    NAMING_SCREEN_MODE_PLAYER_NAME,
    NAMING_SCREEN_MODE_BOX_NAME,
    NAMING_SCREEN_MODE_MON_NAME,
};

enum
{
    PAGE_UPPER,
    PAGE_LOWER,
    PAGE_OTHERS,
};

extern u16 gKeyRepeatStartDelay;

extern u8 unk_2000000[];

#define EWRAM_000000 (*(struct UnknownStruct1 *)(unk_2000000))

//TODO: include "graphics/naming_screen/pc_icon/0.4bpp" and "graphics/naming_screen/pc_icon/1.4bpp" here

//Some unused pointer, perhaps.
asm(".section .rodata\n\
@ XXX: what is this?\n\
	.align 2\n\
	.4byte 0x2000000\n");

extern u16 *const gUnknown_083CE28C[];
extern const struct UnknownStruct2 *const gUnknown_083CE398[];
extern const struct SpriteTemplate gSpriteTemplate_83CE640;

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
void InitInput(void);
void sub_80B6438(void);
void sub_80B5E50(void);
void sub_80B5E70(u8);
void SetInputState(u8);
void sub_80B68D8(u8);
u8 sub_80B60B8(void);
bool8 sub_80B6938(void);
void sub_80B6878(void);
void sub_80B6B14(void);
void sub_80B65F0(void);
void sub_80B6888(u8);
void sub_80B6460(u8, u8, u8);
bool8 sub_80B6610(void);
void sub_80B7614(void);
void get_cursor_pos(s16 *, s16 *);
void set_cursor_pos(s16, s16);
void sub_80B77F8(void);
void sub_80B74B0(void);
void sub_80B74FC(void);
u8 sub_80B6958(void);
u8 sub_80B61C8(void);
void sub_80B6FBC(void);
void sub_80B7090(void);
u8 GetInputPressedButton(void);
u8 sub_80B7004(void);
void sub_80B6914(void);
void Task_HandleInput(u8);
void HandleDpadMovement(struct Task *);
void sub_80B64D4(u8);
void sub_80B65AC(u8);
void sub_80B65D4(struct Task *, u8, u8);
u16 sub_80B654C(u8);
extern void MultiplyInvertedPaletteRGBComponents(u16, u8, u8, u8);
void sub_80B6630(u8);

#define NAMING_SCREEN_A_BUTTON 5
#define NAMING_SCREEN_B_BUTTON 6
#define NAMING_SCREEN_SELECT_BUTTON 8
#define NAMING_SCREEN_START_BUTTON 9

void DoNamingScreen(u8 mode, u8 *nameBuffer, u16 c, u16 d, u32 e, MainCallback returnCallback)
{
    AddNamingScreenTask(mode, nameBuffer, c, d, e, returnCallback);
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

void AddNamingScreenTask(u8 mode, u8 *nameBuffer, u16 c, u16 d, u32 e, MainCallback returnCallback)
{
    struct Task *task;
    
    task = &gTasks[CreateTask(NamingScreenDummyTask, 0xFF)];
    task->data[0] = mode;
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
    EWRAM_000000.mode = task->data[0];
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
    EWRAM_000000.state = 0;
    EWRAM_000000.unk4 = 0;
    EWRAM_000000.unk6 = 0;
    EWRAM_000000.unk8 = 1;
    EWRAM_000000.unkA = 2;
    EWRAM_000000.unkC = 0;
    EWRAM_000000.unkD = 1;
    EWRAM_000000.unk34 = gUnknown_083CE398[EWRAM_000000.mode];
    EWRAM_000000.currentPage = EWRAM_000000.unk34->unk4;
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
    InitInput();
    sub_80B6438();
    sub_80B5E50();
}

void sub_80B5E50(void)
{
    u8 taskId;
    
    taskId = CreateTask(sub_80B5E70, 2);
    sub_80B5E70(taskId);
}

//

u8 sub_80B5EA8(struct Task *);
u8 sub_80B5ED0(struct Task *);
u8 sub_80B5F00(struct Task *);
u8 sub_80B5F10(struct Task *);
u8 sub_80B5F38(struct Task *);
u8 sub_80B5F70(struct Task *);
u8 pokemon_store(struct Task *);
u8 sub_80B604C(struct Task *);
u8 sub_80B606C(struct Task *);
u8 sub_80B6094(struct Task *);
    
static u8 (*const gUnknown_083CE218[])(struct Task *) =
{
    sub_80B5EA8,
    sub_80B5ED0,
    sub_80B5F00,
    sub_80B5F10,
    sub_80B5F38,
    sub_80B5F70,
    pokemon_store,
    sub_80B604C,
    sub_80B606C,
    sub_80B6094,
};

void sub_80B5E70(u8 taskId)
{
    while (gUnknown_083CE218[EWRAM_000000.state](&gTasks[taskId]) != 0)
        ;
}

u8 sub_80B5EA8(struct Task *task)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
    EWRAM_000000.state++;
    return 0;
}

u8 sub_80B5ED0(struct Task *task)
{
    if (!gPaletteFade.active)
    {
        SetInputState(1);
        sub_80B68D8(1);
        EWRAM_000000.state++;
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
        SetInputState(1);
        sub_80B6878();
        EWRAM_000000.state = 2;
    }
    return 0;
}

u8 sub_80B5F38(struct Task *task)
{
    SetInputState(0);
    sub_80B6B14();
    sub_80B65F0();
    sub_80B6888(1);
    sub_80B6460(0, 0, 1);
    PlaySE(SE_WIN_OPEN);
    EWRAM_000000.state = 5;
    return 0;
}

u8 sub_80B5F70(struct Task *task)
{
    s16 cursorX;
    s16 cursorY;
    
    if (sub_80B6610())
    {
        EWRAM_000000.state = 2;
        EWRAM_000000.currentPage++;
        EWRAM_000000.currentPage %= 3;
        sub_80B7614();
        sub_80B77F8();
        SetInputState(1);
        get_cursor_pos(&cursorX, &cursorY);
        if (EWRAM_000000.currentPage == PAGE_OTHERS && (cursorX == 6 || cursorX == 7))
            cursorX = 5;
        set_cursor_pos(cursorX, cursorY);
        sub_80B6888(0);
    }
    return 0;
}

u8 pokemon_store(struct Task *task)
{
    sub_80B74B0();
    SetInputState(0);
    sub_80B68D8(0);
    sub_80B6460(3, 0, 1);
    gKeyRepeatStartDelay = EWRAM_000000.unk3C;
    if (EWRAM_000000.mode == NAMING_SCREEN_MODE_MON_NAME
     && CalculatePlayerPartyCount() > 5)
    {
        sub_80B74FC();
        EWRAM_000000.state = 7;
        return 0;
    }
    else
    {
        EWRAM_000000.state = 8;
        return 1;
    }
}

u8 sub_80B604C(struct Task *task)
{
    if (MenuUpdateWindowText())
        EWRAM_000000.state++;
    return 0;
}

u8 sub_80B606C(struct Task *task)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    EWRAM_000000.state++;
    return 0;
}

u8 sub_80B6094(struct Task *task)
{
    if (!gPaletteFade.active)
        SetMainCallback2(EWRAM_000000.returnCallback);
    return 0;
}

u8 sub_80B6108(u8);
u8 sub_80B6148(u8);
u8 sub_80B6170(u8);
u8 sub_80B6194(u8);

static u8 (*const gUnknown_083CE240[])(u8) =
{
    sub_80B6108,
    sub_80B6148,
    sub_80B6170,
    sub_80B6194,
};

u8 sub_80B60B8(void)
{
    u8 button = GetInputPressedButton();
    u8 r0 = sub_80B6958();
    
    if (button == 8)
        return sub_80B61C8();
    else if (button == 6)
    {
        sub_80B6FBC();
        return 0;
    }
    else if (button == 7)
    {
        sub_80B7090();
        return 0;
    }
    return gUnknown_083CE240[r0](button);
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
            SetInputState(0);
            EWRAM_000000.state = 3;
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
        EWRAM_000000.state = 6;
        return 1;
    }
    else
        return 0;
}

u8 sub_80B61C8(void)
{
    EWRAM_000000.state = 4;
    return 1;
}

//--------------------------------------------------
// Input handling
//--------------------------------------------------

enum
{
    FNKEY_CASE,
    FNKEY_BACK,
    FNKEY_OK,
};

#define tState data[0]
#define tPressedButton data[1]
#define tKbFunctionKey data[2]

void InitInput(void)
{
    CreateTask(Task_HandleInput, 1);
}

u8 GetInputPressedButton(void)
{
    u8 taskId = FindTaskIdByFunc(Task_HandleInput);
    
    return gTasks[taskId].tPressedButton;
}

void SetInputState(u8 state)
{
    u8 taskId = FindTaskIdByFunc(Task_HandleInput);
    
    gTasks[taskId].tState = state;
}

static void sub_80B626C(struct Task *);
static void sub_80B6274(struct Task *);

static void (*const sInputStateHandlers[])(struct Task *) =
{
    sub_80B626C,
    sub_80B6274,
};

void Task_HandleInput(u8 taskId)
{
    sInputStateHandlers[gTasks[taskId].tState](&gTasks[taskId]);
}

static void sub_80B626C(struct Task *task)
{
    task->tPressedButton = 0;
}

static void sub_80B6274(struct Task *task)
{
    task->tPressedButton = 0;
    if (gMain.newKeys & A_BUTTON)
    {
        task->tPressedButton = 5;
        return;
    }
    if (gMain.newKeys & B_BUTTON)
    {
        task->tPressedButton = 6;
        return;
    }
    if (gMain.newKeys & SELECT_BUTTON)
    {
        task->tPressedButton = 8;
        return;
    }
    if (gMain.newKeys & START_BUTTON)
    {
        task->tPressedButton = 9;
        sub_80B6878();
        return;
    }
    HandleDpadMovement(task);
}

static const s16 sDpadDeltaX[] =
{
    0,   //none
    0,   //up
    0,   //down
    -1,  //left
    1    //right
};

static const s16 sDpadDeltaY[] =
{
    0,   //none
    -1,  //up
    1,   //down
    0,   //left
    0    //right
};

static const s16 s4RowTo3RowTableY[] = {0, 1, 1, 2};
static const s16 gUnknown_083CE274[] = {0, 0, 3, 0};

void HandleDpadMovement(struct Task *task)
{
    s16 cursorX;
    s16 cursorY;
    u16 dpadDir;
    s16 prevCursorX;
    
    get_cursor_pos(&cursorX, &cursorY);
    dpadDir = 0;
    if (gMain.newAndRepeatedKeys & DPAD_UP)
        dpadDir = 1;
    if (gMain.newAndRepeatedKeys & DPAD_DOWN)
        dpadDir = 2;
    if (gMain.newAndRepeatedKeys & DPAD_LEFT)
        dpadDir = 3;
    if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
        dpadDir = 4;
    
    //Get new cursor position
    prevCursorX = cursorX;
    cursorX += sDpadDeltaX[dpadDir];
    cursorY += sDpadDeltaY[dpadDir];
    
    //Wrap cursor position in the X direction
    if (cursorX < 0)
        cursorX = 8;
    if (cursorX > 8)
        cursorX = 0;
    
    //Handle cursor movement in X direction
    if (sDpadDeltaX[dpadDir] != 0)
    {
        //The "others" page only has 5 columns
        if (EWRAM_000000.currentPage == PAGE_OTHERS && (cursorX == 6 || cursorX == 7))
        {
            if (sDpadDeltaX[dpadDir] > 0)
                cursorX = 8;
            else
                cursorX = 5;
        }
        
        if (cursorX == 8)
        {
            //We are now on the last column
            task->tKbFunctionKey = cursorY;
            cursorY = s4RowTo3RowTableY[cursorY];
        }
        else if (prevCursorX == 8)
        {
            if (cursorY == 1)
                cursorY = task->tKbFunctionKey;
            else
                cursorY = gUnknown_083CE274[cursorY];
        }
    }
    
    if (cursorX == 8)
    {
        //There are only 3 keys on the last column, unlike the others,
        //so wrap Y accordingly
        if (cursorY < 0)
            cursorY = 2;
        if (cursorY > 2)
            cursorY = 0;
        if (cursorY == 0)
            task->tKbFunctionKey = FNKEY_BACK;
        else if (cursorY == 2)
            task->tKbFunctionKey = FNKEY_OK;
    }
    else
    {
        if (cursorY < 0)
            cursorY = 3;
        if (cursorY > 3)
            cursorY = 0;
    }
    set_cursor_pos(cursorX, cursorY);
}

#undef tState
#undef tPressedButton
#undef tKbFunctionKey

//--------------------------------------------------

void sub_80B6438(void)
{
    u8 taskId;
    
    taskId = CreateTask(sub_80B64D4, 3);
    gTasks[taskId].data[0] = 3;
}

void sub_80B6460(u8 a, u8 b, u8 c)
{
    struct Task *task;
    
    task = &gTasks[FindTaskIdByFunc(sub_80B64D4)];
    if (a == task->data[0] && c == 0)
    {
        task->data[1] = b;
        task->data[2] = 1;
        return;
    }
    if (a == 3 && task->data[1] == 0 && c == 0)
        return;
    if (task->data[0] != 3)
        sub_80B65AC(task->data[0]);
    sub_80B65D4(task, a, b);
}

void sub_80B64D4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    
    if (task->data[0] == 3 || task->data[2] == 0)
        return;
    MultiplyInvertedPaletteRGBComponents(sub_80B654C(task->data[0]), task->data[3], task->data[3], task->data[3]);
    if (task->data[5] != 0)
    {
        task->data[5]--;
        if (task->data[5] != 0)
            return;
    }
    task->data[5] = 2;
    task->data[3] += task->data[4];
    if (task->data[3] == 16)
        task->data[4] = -task->data[4];
    else if (task->data[3] == 0)
    {
        task->data[2] = task->data[1];
        task->data[4] = -task->data[4];
    }
}

u16 sub_80B654C(u8 a)
{
    const u16 arr[] =
    {
        IndexOfSpritePaletteTag(4) * 16 + 0x10E,
        IndexOfSpritePaletteTag(6) * 16 + 0x10C,
        IndexOfSpritePaletteTag(6) * 16 + 0x10E,
    };
    
    return arr[a];
}

void sub_80B65AC(u8 a)
{
    u16 index = sub_80B654C(a);
    
    gPlttBufferFaded[index] = gPlttBufferUnfaded[index];
}

void sub_80B65D4(struct Task *task, u8 b, u8 c)
{
    task->data[0] = b;
    task->data[1] = c;
    task->data[2] = 1;
    task->data[3] = 15;
    task->data[4] = 1;
    task->data[5] = 0;
}

//

u8 sub_80B6668(struct Task *);
u8 sub_80B6680(struct Task *);
u8 sub_80B66EC(struct Task *);
u8 sub_80B6758(struct Task *);

u8 (*const gUnknown_083CE27C[])(struct Task *) =
{
    sub_80B6668,
    sub_80B6680,
    sub_80B66EC,
    sub_80B6758,
};

void sub_80B65F0(void)
{
    u8 taskId;
    
    taskId = CreateTask(sub_80B6630, 0);
    sub_80B6630(taskId);
}

bool8 sub_80B6610(void)
{
    if (FindTaskIdByFunc(sub_80B6630) == 0xFF)
        return TRUE;
    else
        return FALSE;
}

void sub_80B6630(u8 taskId)
{
    while (gUnknown_083CE27C[gTasks[taskId].data[0]](&gTasks[taskId]) != 0)
        ;
}

u8 sub_80B6668(struct Task *task)
{
    EWRAM_000000.unk4 = 0;
    EWRAM_000000.unk6 = 0;
    task->data[0]++;
    return 0;
}

u8 sub_80B6680(struct Task *task)
{
    u16 *const arr[] = {&EWRAM_000000.unk6, &EWRAM_000000.unk4};
    
    task->data[1] += 4;
    *arr[EWRAM_000000.unkC] = Sin(task->data[1], 0x28);
    *arr[EWRAM_000000.unkD] = Sin((task->data[1] + 0x80) & 0xFF, 0x28);
    if (task->data[1] > 0x3F)
    {
        u8 temp = EWRAM_000000.unk8;  //Why u8 and not u16?
        
        EWRAM_000000.unk8 = EWRAM_000000.unkA;
        EWRAM_000000.unkA = temp;
        task->data[0]++;
    }
    return 0;
}

u8 sub_80B66EC(struct Task *task)
{
    u16 *const arr[] = {&EWRAM_000000.unk6, &EWRAM_000000.unk4};
    
    task->data[1] += 4;
    *arr[EWRAM_000000.unkC] = Sin(task->data[1], 0x28);
    *arr[EWRAM_000000.unkD] = Sin((task->data[1] + 0x80) & 0xFF, 0x28);
    if (task->data[1] > 0x7F)
    {
        u8 temp = EWRAM_000000.unkC;
        
        EWRAM_000000.unkC = EWRAM_000000.unkD;
        EWRAM_000000.unkD = temp;
        task->data[0]++;
    }
    return 0;
}

u8 sub_80B6758(struct Task *task)
{
    DestroyTask(FindTaskIdByFunc(sub_80B6630));
    return 0;
}

//

void sub_80B6774(void)
{
    EWRAM_000000.cursorSpriteId = CreateSprite(&gSpriteTemplate_83CE640, 0, 0, 0);
    gSprites[EWRAM_000000.cursorSpriteId].oam.priority = 1;
    gSprites[EWRAM_000000.cursorSpriteId].oam.objMode = 1;
    gSprites[EWRAM_000000.cursorSpriteId].data6 = 1;
    gSprites[EWRAM_000000.cursorSpriteId].data6 = 2;
    set_cursor_pos(0, 0);
}

static const u8 sKeyboardSymbolPositions[][9] =
{
    {1,  3,  5,  8, 10, 12, 14, 17, 19},  //Upper page
    {1,  3,  5,  8, 10, 12, 14, 17, 19},  //Lower page
    {1,  4,  7, 10, 13, 16, 16, 16, 19},  //Others page
};

u8 sub_80B67EC(s16 x)
{
    return sKeyboardSymbolPositions[EWRAM_000000.currentPage][x];
}

void set_cursor_pos(s16 x, s16 y)
{
    struct Sprite *sprite = &gSprites[EWRAM_000000.cursorSpriteId];
    
    sprite->pos1.x = sub_80B67EC(x) * 8 + 27;
    sprite->pos1.y = y * 16 + 80;
    sprite->data2 = sprite->data0;
    sprite->data3 = sprite->data1;
    sprite->data0 = x;
    sprite->data1 = y;
}

void get_cursor_pos(s16 *x, s16 *y)
{
    struct Sprite *sprite = &gSprites[EWRAM_000000.cursorSpriteId];
    
    *x = sprite->data0;
    *y = sprite->data1;
}

void sub_80B6878(void)
{
    set_cursor_pos(8, 2);
}

void sub_80B6888(u8 a)
{
    gSprites[EWRAM_000000.cursorSpriteId].data4 &= -256;
    gSprites[EWRAM_000000.cursorSpriteId].data4 |= a;
    StartSpriteAnim(&gSprites[EWRAM_000000.cursorSpriteId], 0);
}

void sub_80B68D8(u8 a)
{
    gSprites[EWRAM_000000.cursorSpriteId].data4 &= 0xFF;
    gSprites[EWRAM_000000.cursorSpriteId].data4 |= a << 8;
}

void sub_80B6914(void)
{
    StartSpriteAnim(&gSprites[EWRAM_000000.cursorSpriteId], 1);
}

bool8 sub_80B6938(void)
{
    return gSprites[EWRAM_000000.cursorSpriteId].animEnded;
}

u8 sub_80B6958(void)
{
    const u8 arr[] = {1, 2, 3};
    s16 var1;
    s16 var2;
    
    get_cursor_pos(&var1, &var2);
    if (var1 < 8)
        return 0;
    else
        return arr[var2];
}

/*
void sub_80B6998(struct Sprite *sprite)
{
    if (sprite->animEnded)
        StartSpriteAnim(sprite, 0);
    sprite->invisible = (sprite->data4 & 0xFF);
    if (sprite->data0 == 8)
        sprite->invisible = TRUE;
    if (sprite->invisible || (sprite->data4 & 0xFF00) == 0
     || sprite->data0 != sprite->data2 || sprite->data1 != sprite->data3)
    {
        sprite->data5 = 0;
        sprite->data6 = 1;
        sprite->data7 = 2;
    }
    sprite->data7--;
    if (sprite->data7 == 0)
    {
        sprite->data5 += sprite->data6;
        if (sprite->data5 == 16 || sprite->data5 == 0)
            sprite->data6 = -sprite->data6;
        sprite->data7 = 2;
    }
    //_080B6A3E
    if ((sprite->data4 & 0xFF00) != 0)
    {
        s16 r4 = sprite->data5 / 2;
        u8 r5 = sprite->data5;
        u16 index = IndexOfSpritePaletteTag(5) * 16 + 0x0101;
        
        MultiplyInvertedPaletteRGBComponents(index, r4, r5, r5);
    }
}
*/
