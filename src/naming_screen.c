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
    u8 unk10;
    u8 textBuffer[0x10];
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

const u32 gSpriteImage_83CE094[] = INCBIN_U32("graphics/naming_screen/pc_icon/0.4bpp");
const u32 gSpriteImage_83CE154[] = INCBIN_U32("graphics/naming_screen/pc_icon/1.4bpp");

//Some unused pointer, perhaps.
asm(".section .rodata\n\
@ XXX: what is this?\n\
	.align 2\n\
	.4byte 0x2000000\n");

extern u16 *const gUnknown_083CE28C[];
extern const struct UnknownStruct2 *const gUnknown_083CE398[];
extern const struct SubspriteTable gSubspriteTables_83CE558[];
extern const struct SubspriteTable gSubspriteTables_83CE560[];
extern const struct SubspriteTable gSubspriteTables_83CE578[];
extern const struct SubspriteTable gSubspriteTables_83CE580[];
extern const struct SpriteTemplate gSpriteTemplate_83CE5C8;
extern const struct SpriteTemplate gSpriteTemplate_83CE5E0;
extern const struct SpriteTemplate gSpriteTemplate_83CE5F8;
extern const struct SpriteTemplate gSpriteTemplate_83CE610;
extern const struct SpriteTemplate gSpriteTemplate_83CE628;
extern const struct SpriteTemplate gSpriteTemplate_83CE640;
extern const struct SpriteTemplate gSpriteTemplate_83CE658;
extern const struct SpriteTemplate gSpriteTemplate_83CE670;
extern const struct SpriteTemplate gSpriteTemplate_83CE688;

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
bool8 sub_80B7004(void);
void sub_80B6914(void);
void Task_HandleInput(u8);
void HandleDpadMovement(struct Task *);
void sub_80B64D4(u8);
void sub_80B65AC(u8);
void sub_80B65D4(struct Task *, u8, u8);
u16 sub_80B654C(u8);
extern void MultiplyInvertedPaletteRGBComponents(u16, u8, u8, u8);
void sub_80B6630(u8);
void sub_80B6C48(u8, struct Sprite *, struct Sprite *);
u8 sub_80B6F44(void);
extern u8 GetRivalAvatarGraphicsIdByStateIdAndGender(u8, u8);
extern u8 CreateMonIcon();
extern void sub_809D51C(void);
u8 sub_80B7768(s16, s16);
bool8 sub_80B7104(void);
bool8 sub_80B713C(void);
void sub_80B7174(u8);
bool8 sub_80B7198(u8);
bool8 sub_80B7264(u8);
void sub_80B7370(u8, u8);
void sub_80B73CC(u8, u8);
bool8 sub_80B71E4(u8);
void sub_80B7474(u8, u8);
void sub_80B72A4(u8, u8);
bool8 sub_80B720C(u8);

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
    memset(EWRAM_000000.textBuffer, 0xFF, 0x10);
    if (EWRAM_000000.unk34->unk0 != 0)
        StringCopy(EWRAM_000000.textBuffer, EWRAM_000000.nameBuffer);
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
        if (var)
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

#ifdef NONMATCHING
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
        //Can't get this part to match
        u16 var = sprite->data5;
        s8 r5 = var;
        s16 var2 = var / 2;
        s8 r4 = var2;
        u16 index = IndexOfSpritePaletteTag(5) * 16 + 0x0101;
        
        MultiplyInvertedPaletteRGBComponents(index, r4, r5, r5);
    }
}
#else
__attribute__((naked))
void sub_80B6998(struct Sprite *sprite)
{
    asm(".syntax unified\n\
    push {r4,r5,lr}\n\
    adds r4, r0, 0\n\
    adds r0, 0x3F\n\
    ldrb r1, [r0]\n\
    movs r0, 0x10\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080B69B0\n\
    adds r0, r4, 0\n\
    movs r1, 0\n\
    bl StartSpriteAnim\n\
_080B69B0:\n\
    ldrh r1, [r4, 0x36]\n\
    movs r0, 0xFF\n\
    ands r0, r1\n\
    adds r3, r4, 0\n\
    adds r3, 0x3E\n\
    movs r1, 0x1\n\
    ands r0, r1\n\
    lsls r0, 2\n\
    ldrb r1, [r3]\n\
    movs r2, 0x5\n\
    negs r2, r2\n\
    ands r2, r1\n\
    orrs r2, r0\n\
    strb r2, [r3]\n\
    movs r1, 0x2E\n\
    ldrsh r0, [r4, r1]\n\
    cmp r0, 0x8\n\
    bne _080B69DA\n\
    movs r0, 0x4\n\
    orrs r2, r0\n\
    strb r2, [r3]\n\
_080B69DA:\n\
    ldrb r1, [r3]\n\
    movs r0, 0x4\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _080B6A0A\n\
    movs r2, 0x36\n\
    ldrsh r0, [r4, r2]\n\
    movs r1, 0xFF\n\
    lsls r1, 8\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080B6A0A\n\
    movs r0, 0x2E\n\
    ldrsh r1, [r4, r0]\n\
    movs r2, 0x32\n\
    ldrsh r0, [r4, r2]\n\
    cmp r1, r0\n\
    bne _080B6A0A\n\
    movs r0, 0x30\n\
    ldrsh r1, [r4, r0]\n\
    movs r2, 0x34\n\
    ldrsh r0, [r4, r2]\n\
    cmp r1, r0\n\
    beq _080B6A16\n\
_080B6A0A:\n\
    movs r0, 0\n\
    strh r0, [r4, 0x38]\n\
    movs r0, 0x1\n\
    strh r0, [r4, 0x3A]\n\
    movs r0, 0x2\n\
    strh r0, [r4, 0x3C]\n\
_080B6A16:\n\
    ldrh r0, [r4, 0x3C]\n\
    subs r0, 0x1\n\
    strh r0, [r4, 0x3C]\n\
    lsls r0, 16\n\
    cmp r0, 0\n\
    bne _080B6A3E\n\
    ldrh r1, [r4, 0x3A]\n\
    ldrh r2, [r4, 0x38]\n\
    adds r0, r1, r2\n\
    strh r0, [r4, 0x38]\n\
    lsls r0, 16\n\
    asrs r0, 16\n\
    cmp r0, 0x10\n\
    beq _080B6A36\n\
    cmp r0, 0\n\
    bne _080B6A3A\n\
_080B6A36:\n\
    negs r0, r1\n\
    strh r0, [r4, 0x3A]\n\
_080B6A3A:\n\
    movs r0, 0x2\n\
    strh r0, [r4, 0x3C]\n\
_080B6A3E:\n\
    movs r1, 0x36\n\
    ldrsh r0, [r4, r1]\n\
    movs r1, 0xFF\n\
    lsls r1, 8\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080B6A74\n\
    ldrh r4, [r4, 0x38]\n\
    lsls r5, r4, 24\n\
    lsrs r5, 24\n\
    lsls r4, 16\n\
    asrs r4, 17\n\
    lsls r4, 24\n\
    lsrs r4, 24\n\
    movs r0, 0x5\n\
    bl IndexOfSpritePaletteTag\n\
    lsls r0, 24\n\
    lsrs r0, 4\n\
    ldr r2, _080B6A7C @ =0x01010000\n\
    adds r0, r2\n\
    lsrs r0, 16\n\
    adds r1, r4, 0\n\
    adds r2, r5, 0\n\
    adds r3, r5, 0\n\
    bl MultiplyInvertedPaletteRGBComponents\n\
_080B6A74:\n\
    pop {r4,r5}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_080B6A7C: .4byte 0x01010000\n\
    .syntax divided\n");
}
#endif

void sub_80B6A80(void)
{
    u8 spriteId1;
    u8 spriteId2;
    u8 spriteId3;
    
    spriteId1 = CreateSprite(&gSpriteTemplate_83CE5C8, 0xCC, 0x50, 0);
    EWRAM_000000.unk10 = spriteId1;
    SetSubspriteTables(&gSprites[spriteId1], gSubspriteTables_83CE558);
    
    spriteId2 = CreateSprite(&gSpriteTemplate_83CE5F8, 0xCC, 0x4C, 1);
    gSprites[spriteId1].data6 = spriteId2;
    SetSubspriteTables(&gSprites[spriteId2], gSubspriteTables_83CE560);
    
    spriteId3 = CreateSprite(&gSpriteTemplate_83CE5E0, 0xCC, 0x4B, 2);
    gSprites[spriteId3].oam.priority = 1;
    gSprites[spriteId1].data7 = spriteId3;
}

void sub_80B6B14(void)
{
    struct Sprite *sprite = &gSprites[EWRAM_000000.unk10];
    
    sprite->data0 = 2;
    sprite->data1 = EWRAM_000000.currentPage;
}

u8 sub_80B6B5C(struct Sprite *);
u8 sub_80B6B98(struct Sprite *);
u8 sub_80B6B9C(struct Sprite *);
u8 sub_80B6C08(struct Sprite *);

static u8 (*const gUnknown_083CE2B4[])(struct Sprite *) =
{
    sub_80B6B5C,
    sub_80B6B98,
    sub_80B6B9C,
    sub_80B6C08,
};

void sub_80B6B34(struct Sprite *sprite)
{
    while (gUnknown_083CE2B4[sprite->data0](sprite) != 0)
        ;
}

u8 sub_80B6B5C(struct Sprite *sprite)
{
    struct Sprite *sprite1 = &gSprites[sprite->data6];
    struct Sprite *sprite2 = &gSprites[sprite->data7];

    sub_80B6C48(EWRAM_000000.currentPage, sprite1, sprite2);
    sprite->data0++;
    return 0;
}

u8 sub_80B6B98(struct Sprite *sprite)
{
    return 0;
}

u8 sub_80B6B9C(struct Sprite *sprite)
{
    struct Sprite *r4 = &gSprites[sprite->data6];
    struct Sprite *r5 = &gSprites[sprite->data7];
    
    r4->pos2.y++;
    if (r4->pos2.y > 7)
    {
        sprite->data0++;
        r4->pos2.y = -4;
        r4->invisible = TRUE;
        sub_80B6C48(((u8)sprite->data1 + 1) % 3, r4, r5);
    }
    return 0;
}

u8 sub_80B6C08(struct Sprite *sprite)
{
    struct Sprite *r2 = &gSprites[sprite->data6];
    
    r2->invisible = FALSE;
    r2->pos2.y++;
    if (r2->pos2.y >= 0)
    {
        r2->pos2.y = 0;
        sprite->data0 = 1;
    }
    return 0;
}

static const u16 gUnknown_083CE2C4[] = {1, 3, 2};
static const u16 gUnknown_083CE2CA[] = {4, 6, 5};

void sub_80B6C48(u8 a, struct Sprite *b, struct Sprite *c)
{
    c->oam.paletteNum = IndexOfSpritePaletteTag(gUnknown_083CE2C4[a]);
    b->sheetTileStart = GetSpriteTileStartByTag(gUnknown_083CE2CA[a]);
    b->subspriteTableNum = a;
}

//

void sub_80B6CA8(void)
{
    u8 spriteId;
    
    spriteId = CreateSprite(&gSpriteTemplate_83CE610, 0xCC, 0x6C, 0);
    SetSubspriteTables(&gSprites[spriteId], gSubspriteTables_83CE578);
    
    spriteId = CreateSprite(&gSpriteTemplate_83CE628, 0xCC, 0x84, 0);
    SetSubspriteTables(&gSprites[spriteId], gSubspriteTables_83CE578);
}

void sub_80B6D04(void)
{
    u8 spriteId;
    s16 r1;
    u8 i;
    
    r1 = (EWRAM_000000.unk2 - 1) * 8 + 4;
    spriteId = CreateSprite(&gSpriteTemplate_83CE658, r1, 0x28, 0);
    gSprites[spriteId].oam.priority = 3;
    r1 = EWRAM_000000.unk2 * 8 + 4;
    for (i = 0; i < EWRAM_000000.unk34->unk1; i++, r1 += 8)
    {
        spriteId = CreateSprite(&gSpriteTemplate_83CE670, r1, 0x2C, 0);
        gSprites[spriteId].oam.priority = 3;
        gSprites[spriteId].data0 = i;
    }
}

void sub_80B6D9C(struct Sprite *sprite)
{
    const s16 arr[] = {0, -4, -2, -1};
    
    if (sprite->data0 == 0 || --sprite->data0 == 0)
    {
        sprite->data0 = 8;
        sprite->data1 = (sprite->data1 + 1) & 3;
    }
    sprite->pos2.x = arr[sprite->data1];
}

void sub_80B6DE8(struct Sprite *sprite)
{
    const s16 arr[] = {2, 3, 2, 1};
    u8 var;
    
    var = sub_80B6F44();
    if (var != (u8)sprite->data0)
    {
        sprite->pos2.y = 0;
        sprite->data1 = 0;
        sprite->data2 = 0;
    }
    else
    {
        sprite->pos2.y = arr[sprite->data1];
        sprite->data2++;
        if (sprite->data2 > 8)
        {
            sprite->data1 = (sprite->data1 + 1) & 3;
            sprite->data2 = 0;
        }
    }
}

//

void nullsub_40(void);
void sub_80B6E68(void);
void sub_80B6EBC(void);
void sub_80B6EFC(void);

static void (*const gUnknown_083CE2E0[])(void) =
{
    nullsub_40,
    sub_80B6E68,
    sub_80B6EBC,
    sub_80B6EFC,
};

void sub_80B6E44(void)
{
    gUnknown_083CE2E0[EWRAM_000000.unk34->unk2]();
}

void nullsub_40(void)
{
}

void sub_80B6E68(void)
{
    u8 rivalGfxId;
    u8 spriteId;
    
    rivalGfxId = GetRivalAvatarGraphicsIdByStateIdAndGender(0, EWRAM_000000.unk3E);
    spriteId = AddPseudoFieldObject(rivalGfxId, SpriteCallbackDummy, 0x38, 0x18, 0);
    gSprites[spriteId].oam.priority = 3;
    StartSpriteAnim(&gSprites[spriteId], 4);
}

void sub_80B6EBC(void)
{
    u8 spriteId;
    
    spriteId = CreateSprite(&gSpriteTemplate_83CE688, 0x34, 0x18, 0);
    SetSubspriteTables(&gSprites[spriteId], gSubspriteTables_83CE580);
    gSprites[spriteId].oam.priority = 3;
}

void sub_80B6EFC(void)
{
    u8 spriteId;
    
    sub_809D51C();
    spriteId = CreateMonIcon(EWRAM_000000.unk3E, SpriteCallbackDummy, 0x34, 0x18, 0, EWRAM_000000.unk44);
    gSprites[spriteId].oam.priority = 3;
}

u8 sub_80B6F44(void)
{
    u8 i;
    
    for (i = 0; i < EWRAM_000000.unk34->unk1; i++)
    {
        if (EWRAM_000000.textBuffer[i] == 0xFF)
            return i;
    }
    return EWRAM_000000.unk34->unk1 - 1;
}

u8 sub_80B6F84(void)
{
    s8 i;
    
    for (i = EWRAM_000000.unk34->unk1 - 1; i > 0; i--)
    {
        if (EWRAM_000000.textBuffer[i] != 0xFF)
            return i;
    }
    return 0;
}

void sub_80B6FBC(void)
{
    u8 var;
    u8 var2;
    
    var = sub_80B6F84();
    EWRAM_000000.textBuffer[var] = 0;
    sub_80B7960();
    EWRAM_000000.textBuffer[var] = 0xFF;
    var2 = sub_80B6958();
    if (var2 == 0 || var2 == 2)
        sub_80B6460(1, 0, 1);
    PlaySE(SE_BOWA);
}

bool8 sub_80B7004(void)
{
    s16 x;
    s16 y;
    u8 var;
    u8 r4;
    
    get_cursor_pos(&x, &y);
    x = sub_80B67EC(x);
    var = sub_80B7768(x, y);
    r4 = 1;
    if (var == 0xFF)
        r4 = sub_80B7104();
    else if (var == 0xFE)
        r4 = sub_80B713C();
    else
        sub_80B7174(var);
    sub_80B7960();
    PlaySE(SE_SELECT);
    if (r4 != 0)
    {
        if (sub_80B6F84() == EWRAM_000000.unk34->unk1 - 1)
            return TRUE;
    }
    return FALSE;
}

void sub_80B7090(void)
{
    u8 r5;
    u8 r4;
    
    r5 = sub_80B6F84();
    r4 = EWRAM_000000.textBuffer[r5];
    if (sub_80B7198(r4))
    {
        if (sub_80B7264(r4))
            sub_80B7370(r4, r5);
        else
            sub_80B73CC(r4, r5);
    }
    else
    {
        if (sub_80B71E4(r4))
            sub_80B7474(r4, r5);
        else
            sub_80B72A4(r4, r5);
    }
    sub_80B7960();
    PlaySE(SE_SELECT);
}

bool8 sub_80B7104(void)
{
    u8 r5;
    u8 r4;
    
    r5 = sub_80B6F84();
    r4 = EWRAM_000000.textBuffer[r5];
    if (sub_80B720C(r4))
    {
        sub_80B72A4(r4, r5);
        return TRUE;
    }
    return FALSE;
}

bool8 sub_80B713C(void)
{
    u8 r5;
    u8 r4;
    
    r5 = sub_80B6F84();
    r4 = EWRAM_000000.textBuffer[r5];
    if (sub_80B7264(r4))
    {
        sub_80B7370(r4, r5);
        return TRUE;
    }
    return FALSE;
}

void sub_80B7174(u8 a)
{
    u8 r0 = sub_80B6F44();
    
    EWRAM_000000.textBuffer[r0] = a;
}

bool8 sub_80B7198(u8 a)
{
    if ((a >= 55 && a <= 74)
     || (a >= 135 && a <= 139)
     || (a >= 140 && a <= 144)
     || (a >= 145 && a <= 149)
     || (a >= 150 && a <= 154))
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80B71E4(u8 a)
{
    if ((a >= 75 && a <= 79)
     || (a >= 155 && a <= 159))
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80B720C(u8 a)
{
    if ((a >= 6 && a <= 20)
     || (a >= 26 && a <= 30)
     || (a >= 75 && a <= 79)
     || (a >= 86 && a <= 100)
     || (a >= 106 && a <= 110)
     || (a >= 155 && a <= 159))
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80B7264(u8 a)
{
    if ((a >= 26 && a <= 30)
     || (a >= 70 && a <= 74)
     || (a >= 106 && a <= 110)
     || (a >= 150 && a <= 154))
        return TRUE;
    else
        return FALSE;
}

void sub_80B72A4(u8 a, u8 b)
{
    u8 chr = a;
    
    if (a >= 6 && a <= 10)
        chr = a + 0x31;
    else if (a >= 11 && a <= 15)
        chr = a + 0x31;
    else if (a >= 16 && a <= 20)
        chr = a + 0x31;
    else if (a >= 26 && a <= 30)
        chr = a + 0x2C;
    else if (a >= 75 && a <= 79)
        chr = a + 0xFB;
    else if (a >= 86 && a <= 90)
        chr = a + 0x31;
    else if (a >= 91 && a <= 95)
        chr = a + 0x31;
    else if (a >= 96 && a <= 100)
        chr = a + 0x31;
    else if (a >= 106 && a <= 110)
        chr = a + 0x2C;
    else if (a >= 155 && a <= 159)
        chr = a + 0xFB;
    EWRAM_000000.textBuffer[b] = chr;
}
