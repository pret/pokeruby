#include "global.h"
#include "naming_screen.h"
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

extern u8 GetRivalAvatarGraphicsIdByStateIdAndGender(u8, u8);
extern u8 CreateMonIcon();
extern void sub_809D51C(void);
extern void MultiplyInvertedPaletteRGBComponents(u16, u8, u8, u8);

extern u16 gKeyRepeatStartDelay;

extern u8 unk_2000000[];

#define namingScreenData (*(struct NamingScreenData *)(unk_2000000))

const u32 gSpriteImage_83CE094[] = INCBIN_U32("graphics/naming_screen/pc_icon/0.4bpp");
const u32 gSpriteImage_83CE154[] = INCBIN_U32("graphics/naming_screen/pc_icon/1.4bpp");

//Some unused pointer, perhaps.
asm(".section .rodata\n\
@ XXX: what is this?\n\
    .align 2\n\
    .4byte 0x2000000\n");

extern u16 *const gUnknown_083CE28C[];
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
extern const struct SpriteSheet gUnknown_083CE6A0[];
extern const struct SpritePalette gUnknown_083CE708[];
extern const u8 gOtherText_SentToPC[];
extern const u8 gNamingScreenMenu_Gfx[];
extern u16 gMenuMessageBoxContentTileOffset;
extern const u16 gNamingScreenPalettes[];
extern const u16 gUnknown_083CE748[];
extern const u16 gUnknown_083CEBF8[];
extern const u16 gUnknown_083CF0A8[];
extern const u16 gUnknown_08E86258[];
extern const u8 gSpeciesNames[][11];
extern const u8 OtherText_YourName[];
extern const u8 OtherText_BoxName[];
extern const u8 OtherText_PokeName[];

static void C2_NamingScreen(void);
static void sub_80B5AA0(void);
static void StoreNamingScreenParameters(u8, u8 *, u16, u16, u32, MainCallback);
static void NamingScreen_TurnOffScreen(void);
static void NamingScreen_Init(void);
static void NamingScreen_ClearVram(void);
static void NamingScreen_ClearOam(void);
static void NamingScreen_SetUpVideoRegs(void);
static void NamingScreen_SetUpWindow(void);
static void NamingScreen_ResetObjects(void);
static void sub_80B5DFC(void);
static void sub_80B5E20(void);
static void sub_80B5E3C(void);
static void NamingScreen_InitDisplayMode(void);
static void Task_DoNothing(u8);
static void sub_80B7558(void);
static void sub_80B753C(void);
static void sub_80B7680(void);
static void sub_80B75C4(void);
static void sub_80B7794(void);
static void sub_80B78A8(void);
static void sub_80B7960(void);
static void CursorInit(void);
static void sub_80B6A80(void);
static void sub_80B6CA8(void);
static void sub_80B6D04(void);
static void sub_80B6E44(void);
static void InputInit(void);
static void sub_80B6438(void);
static void sub_80B5E50(void);
static void Task_NamingScreenMain(u8);
static void SetInputState(u8);
static void sub_80B68D8(u8);
static bool8 HandleKeyboardEvent(void);
static bool8 IsCursorAnimFinished(void);
static void MoveCursorToOKButton(void);
static void sub_80B6B14(void);
static void StartPageSwapAnim(void);
static void sub_80B6888(u8);
static void sub_80B6460(u8, u8, u8);
static bool8 IsPageSwapAnimNotInProgress(void);
static void sub_80B7614(void);
static void GetCursorPos(s16 *, s16 *);
static void SetCursorPos(s16, s16);
static void sub_80B77F8(void);
static void sub_80B74B0(void);
static void DisplaySentToPCMessage(void);
static u8 GetKeyRoleAtCursorPos(void);
static u8 sub_80B61C8(void);
static void DeleteTextCharacter(void);
static void sub_80B7090(void);
static u8 GetInputEvent(void);
static bool8 sub_80B7004(void);
static void sub_80B6914(void);
static void Task_HandlePageSwapAnim(u8);
static void sub_80B6C48(u8, struct Sprite *, struct Sprite *);
static u8 GetTextCaretPosition(void);
static u8 GetCharAtKeyboardPos(s16, s16);
static bool8 sub_80B7104(void);
static bool8 sub_80B713C(void);
static void AddTextCharacter(u8);
static bool8 sub_80B7198(u8);
static bool8 sub_80B7264(u8);
static void sub_80B7370(u8, u8);
static void sub_80B73CC(u8, u8);
static bool8 sub_80B71E4(u8);
static void sub_80B7474(u8, u8);
static void sub_80B72A4(u8, u8);
static bool8 sub_80B720C(u8);
static void sub_80B7568(void);
static void sub_80B75B0(void);
static void sub_80B7698(u16 *, const u16 *);
static void sub_80B76E0();
static void nullsub_20(u8, u8);
static void PrintKeyboardCharacters(u8);

void DoNamingScreen(u8 templateNum, u8 *destBuffer, u16 c, u16 d, u32 e, MainCallback returnCallback)
{
    StoreNamingScreenParameters(templateNum, destBuffer, c, d, e, returnCallback);
    SetMainCallback2(C2_NamingScreen);
}

static void C2_NamingScreen(void)
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
        NamingScreen_SetUpWindow();
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
        NamingScreen_InitDisplayMode();
        SetMainCallback2(sub_80B5AA0);
        break;
    }
}

static void sub_80B5AA0(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void VBlankCB_NamingScreen(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    REG_BG1VOFS = namingScreenData.bg1vOffset;
    REG_BG2VOFS = namingScreenData.bg2vOffset;
    REG_BG1CNT &= 0xFFFC;
    REG_BG1CNT |= namingScreenData.unk8;
    REG_BG2CNT &= 0xFFFC;
    REG_BG2CNT |= namingScreenData.unkA;
}

static void StoreNamingScreenParameters(u8 templateNum, u8 *destBuffer, u16 c, u16 d, u32 e, MainCallback returnCallback)
{
    struct Task *task;
    
    //Create a task that does nothing, and use it as a temporary space to store parameters
    task = &gTasks[CreateTask(Task_DoNothing, 0xFF)];
    task->data[0] = templateNum;
    task->data[1] = c;
    task->data[2] = d;
    task->data[3] = e >> 16;
    task->data[4] = e;
    StoreWordInTwoHalfwords(&task->data[5], (u32)destBuffer);
    StoreWordInTwoHalfwords(&task->data[7], (u32)returnCallback);
}

static void GetNamingScreenParameters(void)
{
    u8 taskId;
    struct Task *task;
    
    taskId = FindTaskIdByFunc(Task_DoNothing);
    task = &gTasks[taskId];
    namingScreenData.templateNum = task->data[0];
    namingScreenData.unk3E = task->data[1];
    namingScreenData.unk40 = task->data[2];
    namingScreenData.unk42 = (task->data[3] << 16) | (u16)task->data[4];
    LoadWordFromTwoHalfwords(&task->data[5], (u32 *)&namingScreenData.destBuffer);
    LoadWordFromTwoHalfwords(&task->data[7], (u32 *)&namingScreenData.returnCallback);
    DestroyTask(taskId);
}

static void Task_DoNothing(u8 taskId)
{
}

static void NamingScreen_TurnOffScreen(void)
{
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
    REG_DISPCNT = 0;
}

static void NamingScreen_InitDisplayMode(void)
{
    u16 savedIme;
    
    SetVBlankCallback(VBlankCB_NamingScreen);
    savedIme = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;
    REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON;
}

static void NamingScreen_ClearVram(void)
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

static void NamingScreen_ClearOam(void)
{
    DmaClear16(3, (void *)OAM, 0x400);
}

static void NamingScreen_SetUpVideoRegs(void)
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

static const struct NamingScreenTemplate *const sNamingScreenTemplates[];  //forward declaration

static void NamingScreen_Init(void)
{
    GetNamingScreenParameters();
    namingScreenData.state = 0;
    namingScreenData.bg1vOffset = 0;
    namingScreenData.bg2vOffset = 0;
    namingScreenData.unk8 = 1;
    namingScreenData.unkA = 2;
    namingScreenData.unkC = 0;
    namingScreenData.unkD = 1;
    namingScreenData.template = sNamingScreenTemplates[namingScreenData.templateNum];
    namingScreenData.currentPage = namingScreenData.template->unk4;
    namingScreenData.unk2 = 14 - namingScreenData.template->maxChars / 2;
    namingScreenData.unk3C = gKeyRepeatStartDelay;
    memset(namingScreenData.textBuffer, 0xFF, sizeof(namingScreenData.textBuffer));
    if (namingScreenData.template->unk0 != 0)
        StringCopy(namingScreenData.textBuffer, namingScreenData.destBuffer);
    gKeyRepeatStartDelay = 16;
}

static void NamingScreen_SetUpWindow(void)
{
    SetUpWindowConfig(&gWindowConfig_81E6E88);
    InitMenuWindow(&gWindowConfig_81E6E88);
}

static void NamingScreen_ResetObjects(void)
{
    ResetPaletteFade();
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
}

static void sub_80B5DFC(void)
{
    sub_80B7558();
    sub_80B753C();
    sub_80B7680();
    sub_80B75C4();
    sub_80B7794();
    sub_80B78A8();
    sub_80B7960();
}

static void sub_80B5E20(void)
{
    CursorInit();
    sub_80B6A80();
    sub_80B6CA8();
    sub_80B6D04();
    sub_80B6E44();
}

static void sub_80B5E3C(void)
{
    InputInit();
    sub_80B6438();
    sub_80B5E50();
}

//--------------------------------------------------
// Naming screen main
//--------------------------------------------------

static bool8 MainState_BeginFadeIn(struct Task *);
static bool8 MainState_WaitFadeIn(struct Task *);
static bool8 MainState_HandleInput(struct Task *);
static bool8 MainState_MoveToOKButton(struct Task *);
static bool8 MainState_StartPageSwap(struct Task *);
static bool8 MainState_WaitPageSwap(struct Task *);
static bool8 MainState_6(struct Task *);
static bool8 MainState_UpdateSentToPCMessage(struct Task *);
static bool8 MainState_BeginFadeInOut(struct Task *);
static bool8 MainState_WaitFadeOutAndExit(struct Task *);

static bool8 (*const sMainStateFuncs[])(struct Task *) =
{
    MainState_BeginFadeIn,
    MainState_WaitFadeIn,
    MainState_HandleInput,
    MainState_MoveToOKButton,
    MainState_StartPageSwap,
    MainState_WaitPageSwap,
    MainState_6,
    MainState_UpdateSentToPCMessage,
    MainState_BeginFadeInOut,
    MainState_WaitFadeOutAndExit,
};

static void sub_80B5E50(void)
{
    u8 taskId;
    
    taskId = CreateTask(Task_NamingScreenMain, 2);
    Task_NamingScreenMain(taskId);
}

static void Task_NamingScreenMain(u8 taskId)
{
    while (sMainStateFuncs[namingScreenData.state](&gTasks[taskId]) != 0)
        ;
}

static bool8 MainState_BeginFadeIn(struct Task *task)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
    namingScreenData.state++;
    return 0;
}

static bool8 MainState_WaitFadeIn(struct Task *task)
{
    if (!gPaletteFade.active)
    {
        SetInputState(INPUT_STATE_ENABLED);
        sub_80B68D8(1);
        namingScreenData.state++;
    }
    return FALSE;
}

static bool8 MainState_HandleInput(struct Task *task)
{
    return HandleKeyboardEvent();
}

static bool8 MainState_MoveToOKButton(struct Task *task)
{
    if (IsCursorAnimFinished())
    {
        SetInputState(INPUT_STATE_ENABLED);
        MoveCursorToOKButton();
        namingScreenData.state = MAIN_STATE_HANDLE_INPUT;
    }
    return FALSE;
}

static bool8 MainState_StartPageSwap(struct Task *task)
{
    SetInputState(INPUT_STATE_DISABLED);
    sub_80B6B14();
    StartPageSwapAnim();
    sub_80B6888(1);
    sub_80B6460(0, 0, 1);
    PlaySE(SE_WIN_OPEN);
    namingScreenData.state = MAIN_STATE_WAIT_PAGE_SWAP;
    return FALSE;
}

static bool8 MainState_WaitPageSwap(struct Task *task)
{
    s16 cursorX;
    s16 cursorY;
    
    if (IsPageSwapAnimNotInProgress())
    {
        namingScreenData.state = MAIN_STATE_HANDLE_INPUT;
        namingScreenData.currentPage++;
        namingScreenData.currentPage %= 3;
        sub_80B7614();
        sub_80B77F8();
        SetInputState(INPUT_STATE_ENABLED);
        GetCursorPos(&cursorX, &cursorY);
        if (namingScreenData.currentPage == PAGE_OTHERS && (cursorX == 6 || cursorX == 7))
            cursorX = 5;
        SetCursorPos(cursorX, cursorY);
        sub_80B6888(0);
    }
    return FALSE;
}

static bool8 MainState_6(struct Task *task)
{
    sub_80B74B0();
    SetInputState(INPUT_STATE_DISABLED);
    sub_80B68D8(0);
    sub_80B6460(3, 0, 1);
    gKeyRepeatStartDelay = namingScreenData.unk3C;
    if (namingScreenData.templateNum == NAMING_SCREEN_TEMPLATE_MON_NAME
     && CalculatePlayerPartyCount() >= 6)
    {
        DisplaySentToPCMessage();
        namingScreenData.state = MAIN_STATE_UPDATE_SENT_TO_PC_MESSAGE;
        return FALSE;
    }
    else
    {
        namingScreenData.state = MAIN_STATE_BEGIN_FADE_OUT;
        return TRUE;  //Exit the naming screen
    }
}

static bool8 MainState_UpdateSentToPCMessage(struct Task *task)
{
    if (MenuUpdateWindowText())
        namingScreenData.state++;
    return FALSE;
}

static bool8 MainState_BeginFadeInOut(struct Task *task)
{
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
    namingScreenData.state++;
    return FALSE;
}

static bool8 MainState_WaitFadeOutAndExit(struct Task *task)
{
    if (!gPaletteFade.active)
        SetMainCallback2(namingScreenData.returnCallback);
    return FALSE;
}

//--------------------------------------------------
// Keyboard handling
//--------------------------------------------------

enum
{
    KEY_ROLE_CHAR,
    KEY_ROLE_PAGE,
    KEY_ROLE_BACKSPACE,
    KEY_ROLE_OK,
};


static bool8 KeyboardKeyHandler_Character(u8);
static bool8 KeyboardKeyHandler_Page(u8);
static bool8 KeyboardKeyHandler_Backspace(u8);
static bool8 KeyboardKeyHandler_OK(u8);

static bool8 (*const sKeyboardKeyHandlers[])(u8) =
{
    KeyboardKeyHandler_Character,
    KeyboardKeyHandler_Page,
    KeyboardKeyHandler_Backspace,
    KeyboardKeyHandler_OK,
};

static bool8 HandleKeyboardEvent(void)
{
    u8 event = GetInputEvent();
    u8 keyRole = GetKeyRoleAtCursorPos();
    
    if (event == KBEVENT_PRESSED_SELECT)
        return sub_80B61C8();
    else if (event == KBEVENT_PRESSED_B)
    {
        DeleteTextCharacter();
        return FALSE;
    }
    else if (event == 7)
    {
        sub_80B7090();
        return FALSE;
    }
    return sKeyboardKeyHandlers[keyRole](event);
}

static bool8 KeyboardKeyHandler_Character(u8 event)
{
    sub_80B6460(3, 0, 0);
    if (event == KBEVENT_PRESSED_A)
    {
        u8 var = sub_80B7004();
        
        sub_80B6914();
        if (var)
        {
            SetInputState(INPUT_STATE_DISABLED);
            namingScreenData.state = MAIN_STATE_MOVE_TO_OK_BUTTON;
        }
    }
    return FALSE;
}

static bool8 KeyboardKeyHandler_Page(u8 event)
{
    sub_80B6460(0, 1, 0);
    if (event == KBEVENT_PRESSED_A)
        return sub_80B61C8();
    else
        return FALSE;
}

static bool8 KeyboardKeyHandler_Backspace(u8 event)
{
    sub_80B6460(1, 1, 0);
    if (event == KBEVENT_PRESSED_A)
        DeleteTextCharacter();
    return FALSE;
}

static bool8 KeyboardKeyHandler_OK(u8 event)
{
    sub_80B6460(2, 1, 0);
    if (event == KBEVENT_PRESSED_A)
    {
        PlaySE(SE_SELECT);
        namingScreenData.state = MAIN_STATE_6;
        return TRUE;
    }
    else
        return FALSE;
}

static bool8 sub_80B61C8(void)
{
    namingScreenData.state = MAIN_STATE_START_PAGE_SWAP;
    return TRUE;
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
#define tKeyboardEvent data[1]
#define tKbFunctionKey data[2]

static void InputState_Disabled(struct Task *);
static void InputState_Enabled(struct Task *);

static void (*const sInputStateFuncs[])(struct Task *) =
{
    InputState_Disabled,
    InputState_Enabled,
};

static void Task_HandleInput(u8);
static void HandleDpadMovement(struct Task *);

static void InputInit(void)
{
    CreateTask(Task_HandleInput, 1);
}

static u8 GetInputEvent(void)
{
    u8 taskId = FindTaskIdByFunc(Task_HandleInput);
    
    return gTasks[taskId].tKeyboardEvent;
}

static void SetInputState(u8 state)
{
    u8 taskId = FindTaskIdByFunc(Task_HandleInput);
    
    gTasks[taskId].tState = state;
}

static void Task_HandleInput(u8 taskId)
{
    sInputStateFuncs[gTasks[taskId].tState](&gTasks[taskId]);
}

static void InputState_Disabled(struct Task *task)
{
    task->tKeyboardEvent = 0;
}

static void InputState_Enabled(struct Task *task)
{
    task->tKeyboardEvent = 0;
    if (gMain.newKeys & A_BUTTON)
    {
        task->tKeyboardEvent = KBEVENT_PRESSED_A;
        return;
    }
    if (gMain.newKeys & B_BUTTON)
    {
        task->tKeyboardEvent = KBEVENT_PRESSED_B;
        return;
    }
    if (gMain.newKeys & SELECT_BUTTON)
    {
        task->tKeyboardEvent = KBEVENT_PRESSED_SELECT;
        return;
    }
    if (gMain.newKeys & START_BUTTON)
    {
        task->tKeyboardEvent = KBEVENT_PRESSED_START;
        MoveCursorToOKButton();
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

static void HandleDpadMovement(struct Task *task)
{
    s16 cursorX;
    s16 cursorY;
    u16 dpadDir;
    s16 prevCursorX;
    
    GetCursorPos(&cursorX, &cursorY);
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
        if (namingScreenData.currentPage == PAGE_OTHERS && (cursorX == 6 || cursorX == 7))
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
    SetCursorPos(cursorX, cursorY);
}

#undef tState
#undef tKeyboardEvent
#undef tKbFunctionKey

//--------------------------------------------------
// 
//--------------------------------------------------

static void Task_80B64D4(u8);
static u16 sub_80B654C(u8);
static void sub_80B65AC(u8);
static void sub_80B65D4(struct Task *, u8, u8);

static void sub_80B6438(void)
{
    u8 taskId;
    
    taskId = CreateTask(Task_80B64D4, 3);
    gTasks[taskId].data[0] = 3;
}

static void sub_80B6460(u8 a, u8 b, u8 c)
{
    struct Task *task = &gTasks[FindTaskIdByFunc(Task_80B64D4)];
    
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

static void Task_80B64D4(u8 taskId)
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

static u16 sub_80B654C(u8 a)
{
    const u16 arr[] =
    {
        IndexOfSpritePaletteTag(4) * 16 + 0x10E,
        IndexOfSpritePaletteTag(6) * 16 + 0x10C,
        IndexOfSpritePaletteTag(6) * 16 + 0x10E,
    };
    
    return arr[a];
}

static void sub_80B65AC(u8 a)
{
    u16 index = sub_80B654C(a);
    
    gPlttBufferFaded[index] = gPlttBufferUnfaded[index];
}

static void sub_80B65D4(struct Task *task, u8 b, u8 c)
{
    task->data[0] = b;
    task->data[1] = c;
    task->data[2] = 1;
    task->data[3] = 15;
    task->data[4] = 1;
    task->data[5] = 0;
}

//--------------------------------------------------
// Page Swap
//--------------------------------------------------

#define tState data[0]
#define tFrameCount data[1]

static bool8 PageSwapAnimState_Init(struct Task *);
static bool8 PageSwapAnimState_1(struct Task *);
static bool8 PageSwapAnimState_2(struct Task *);
static bool8 PageSwapAnimState_Done(struct Task *);

static bool8 (*const sPageSwapAnimStateFuncs[])(struct Task *) =
{
    PageSwapAnimState_Init,
    PageSwapAnimState_1,
    PageSwapAnimState_2,
    PageSwapAnimState_Done,
};

static void StartPageSwapAnim(void)
{
    u8 taskId;
    
    taskId = CreateTask(Task_HandlePageSwapAnim, 0);
    Task_HandlePageSwapAnim(taskId);
}

static bool8 IsPageSwapAnimNotInProgress(void)
{
    if (FindTaskIdByFunc(Task_HandlePageSwapAnim) == 0xFF)
        return TRUE;
    else
        return FALSE;
}

static void Task_HandlePageSwapAnim(u8 taskId)
{
    while (sPageSwapAnimStateFuncs[gTasks[taskId].tState](&gTasks[taskId]) != 0)
        ;
}

static bool8 PageSwapAnimState_Init(struct Task *task)
{
    namingScreenData.bg1vOffset = 0;
    namingScreenData.bg2vOffset = 0;
    task->tState++;
    return 0;
}

static bool8 PageSwapAnimState_1(struct Task *task)
{
    u16 *const arr[] =
    {
        &namingScreenData.bg2vOffset,
        &namingScreenData.bg1vOffset
    };
    
    task->tFrameCount += 4;
    *arr[namingScreenData.unkC] = Sin(task->tFrameCount, 40);
    *arr[namingScreenData.unkD] = Sin((task->tFrameCount + 128) & 0xFF, 40);
    if (task->tFrameCount >= 64)
    {
        u8 temp = namingScreenData.unk8;  //Why u8 and not u16?
        
        namingScreenData.unk8 = namingScreenData.unkA;
        namingScreenData.unkA = temp;
        task->tState++;
    }
    return 0;
}

static bool8 PageSwapAnimState_2(struct Task *task)
{
    u16 *const arr[] = {&namingScreenData.bg2vOffset, &namingScreenData.bg1vOffset};
    
    task->tFrameCount += 4;
    *arr[namingScreenData.unkC] = Sin(task->tFrameCount, 40);
    *arr[namingScreenData.unkD] = Sin((task->tFrameCount + 128) & 0xFF, 40);
    if (task->tFrameCount >= 128)
    {
        u8 temp = namingScreenData.unkC;
        
        namingScreenData.unkC = namingScreenData.unkD;
        namingScreenData.unkD = temp;
        task->tState++;
    }
    return 0;
}

static bool8 PageSwapAnimState_Done(struct Task *task)
{
    DestroyTask(FindTaskIdByFunc(Task_HandlePageSwapAnim));
    return 0;
}

#undef tState
#undef tFrameCount

//--------------------------------------------------
// Cursor
//--------------------------------------------------

static void CursorInit(void)
{
    namingScreenData.cursorSpriteId = CreateSprite(&gSpriteTemplate_83CE640, 0, 0, 0);
    gSprites[namingScreenData.cursorSpriteId].oam.priority = 1;
    gSprites[namingScreenData.cursorSpriteId].oam.objMode = 1;
    gSprites[namingScreenData.cursorSpriteId].data6 = 1;
    gSprites[namingScreenData.cursorSpriteId].data6 = 2;
    SetCursorPos(0, 0);
}

static const u8 sKeyboardSymbolPositions[][9] =
{
    {1,  3,  5,  8, 10, 12, 14, 17, 19},  //Upper page
    {1,  3,  5,  8, 10, 12, 14, 17, 19},  //Lower page
    {1,  4,  7, 10, 13, 16, 16, 16, 19},  //Others page
};

static u8 CursorColToKeyboardCol(s16 x)
{
    return sKeyboardSymbolPositions[namingScreenData.currentPage][x];
}

static void SetCursorPos(s16 x, s16 y)
{
    struct Sprite *cursorSprite = &gSprites[namingScreenData.cursorSpriteId];
    
    cursorSprite->pos1.x = CursorColToKeyboardCol(x) * 8 + 27;
    cursorSprite->pos1.y = y * 16 + 80;
    cursorSprite->data2 = cursorSprite->data0;
    cursorSprite->data3 = cursorSprite->data1;
    cursorSprite->data0 = x;
    cursorSprite->data1 = y;
}

static void GetCursorPos(s16 *x, s16 *y)
{
    struct Sprite *cursorSprite = &gSprites[namingScreenData.cursorSpriteId];
    
    *x = cursorSprite->data0;
    *y = cursorSprite->data1;
}

static void MoveCursorToOKButton(void)
{
    SetCursorPos(8, 2);
}

static void sub_80B6888(u8 a)
{
    gSprites[namingScreenData.cursorSpriteId].data4 &= -256;
    gSprites[namingScreenData.cursorSpriteId].data4 |= a;
    StartSpriteAnim(&gSprites[namingScreenData.cursorSpriteId], 0);
}

static void sub_80B68D8(u8 a)
{
    gSprites[namingScreenData.cursorSpriteId].data4 &= 0xFF;
    gSprites[namingScreenData.cursorSpriteId].data4 |= a << 8;
}

static void sub_80B6914(void)
{
    StartSpriteAnim(&gSprites[namingScreenData.cursorSpriteId], 1);
}

static bool8 IsCursorAnimFinished(void)
{
    return gSprites[namingScreenData.cursorSpriteId].animEnded;
}

static u8 GetKeyRoleAtCursorPos(void)
{
    const u8 keyRoles[] = {KEY_ROLE_PAGE, KEY_ROLE_BACKSPACE, KEY_ROLE_OK};
    s16 cursorX;
    s16 cursorY;
    
    GetCursorPos(&cursorX, &cursorY);
    if (cursorX < 8)
        return KEY_ROLE_CHAR;
    else
        return keyRoles[cursorY];
}

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
    if ((sprite->data4 & 0xFF00) != 0)
    {
        s8 gb = sprite->data5;
        s8 r = sprite->data5 >> 1;
        u16 index = IndexOfSpritePaletteTag(5) * 16 + 0x0101;
        
        MultiplyInvertedPaletteRGBComponents(index, r, gb, gb);
    }
}

static void sub_80B6A80(void)
{
    u8 spriteId1;
    u8 spriteId2;
    u8 spriteId3;
    
    spriteId1 = CreateSprite(&gSpriteTemplate_83CE5C8, 0xCC, 0x50, 0);
    namingScreenData.unk10 = spriteId1;
    SetSubspriteTables(&gSprites[spriteId1], gSubspriteTables_83CE558);
    
    spriteId2 = CreateSprite(&gSpriteTemplate_83CE5F8, 0xCC, 0x4C, 1);
    gSprites[spriteId1].data6 = spriteId2;
    SetSubspriteTables(&gSprites[spriteId2], gSubspriteTables_83CE560);
    
    spriteId3 = CreateSprite(&gSpriteTemplate_83CE5E0, 0xCC, 0x4B, 2);
    gSprites[spriteId3].oam.priority = 1;
    gSprites[spriteId1].data7 = spriteId3;
}

static void sub_80B6B14(void)
{
    struct Sprite *sprite = &gSprites[namingScreenData.unk10];
    
    sprite->data0 = 2;
    sprite->data1 = namingScreenData.currentPage;
}

static u8 sub_80B6B5C(struct Sprite *);
static u8 sub_80B6B98(struct Sprite *);
static u8 sub_80B6B9C(struct Sprite *);
static u8 sub_80B6C08(struct Sprite *);

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

static u8 sub_80B6B5C(struct Sprite *sprite)
{
    struct Sprite *sprite1 = &gSprites[sprite->data6];
    struct Sprite *sprite2 = &gSprites[sprite->data7];

    sub_80B6C48(namingScreenData.currentPage, sprite1, sprite2);
    sprite->data0++;
    return 0;
}

static u8 sub_80B6B98(struct Sprite *sprite)
{
    return 0;
}

static u8 sub_80B6B9C(struct Sprite *sprite)
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

static u8 sub_80B6C08(struct Sprite *sprite)
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

static void sub_80B6C48(u8 a, struct Sprite *b, struct Sprite *c)
{
    c->oam.paletteNum = IndexOfSpritePaletteTag(gUnknown_083CE2C4[a]);
    b->sheetTileStart = GetSpriteTileStartByTag(gUnknown_083CE2CA[a]);
    b->subspriteTableNum = a;
}

//

static void sub_80B6CA8(void)
{
    u8 spriteId;
    
    spriteId = CreateSprite(&gSpriteTemplate_83CE610, 0xCC, 0x6C, 0);
    SetSubspriteTables(&gSprites[spriteId], gSubspriteTables_83CE578);
    
    spriteId = CreateSprite(&gSpriteTemplate_83CE628, 0xCC, 0x84, 0);
    SetSubspriteTables(&gSprites[spriteId], gSubspriteTables_83CE578);
}

static void sub_80B6D04(void)
{
    u8 spriteId;
    s16 r1;
    u8 i;
    
    r1 = (namingScreenData.unk2 - 1) * 8 + 4;
    spriteId = CreateSprite(&gSpriteTemplate_83CE658, r1, 0x28, 0);
    gSprites[spriteId].oam.priority = 3;
    r1 = namingScreenData.unk2 * 8 + 4;
    for (i = 0; i < namingScreenData.template->maxChars; i++, r1 += 8)
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
    
    var = GetTextCaretPosition();
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

static void nullsub_40(void);
static void sub_80B6E68(void);
static void sub_80B6EBC(void);
static void sub_80B6EFC(void);

static void (*const gUnknown_083CE2E0[])(void) =
{
    nullsub_40,
    sub_80B6E68,
    sub_80B6EBC,
    sub_80B6EFC,
};

static void sub_80B6E44(void)
{
    gUnknown_083CE2E0[namingScreenData.template->unk2]();
}

static void nullsub_40(void)
{
}

static void sub_80B6E68(void)
{
    u8 rivalGfxId;
    u8 spriteId;
    
    rivalGfxId = GetRivalAvatarGraphicsIdByStateIdAndGender(0, namingScreenData.unk3E);
    spriteId = AddPseudoFieldObject(rivalGfxId, SpriteCallbackDummy, 0x38, 0x18, 0);
    gSprites[spriteId].oam.priority = 3;
    StartSpriteAnim(&gSprites[spriteId], 4);
}

static void sub_80B6EBC(void)
{
    u8 spriteId;
    
    spriteId = CreateSprite(&gSpriteTemplate_83CE688, 0x34, 0x18, 0);
    SetSubspriteTables(&gSprites[spriteId], gSubspriteTables_83CE580);
    gSprites[spriteId].oam.priority = 3;
}

static void sub_80B6EFC(void)
{
    u8 spriteId;
    
    sub_809D51C();
    spriteId = CreateMonIcon(namingScreenData.unk3E, SpriteCallbackDummy, 0x34, 0x18, 0, namingScreenData.unk42);
    gSprites[spriteId].oam.priority = 3;
}

static u8 GetTextCaretPosition(void)
{
    u8 i;
    
    for (i = 0; i < namingScreenData.template->maxChars; i++)
    {
        if (namingScreenData.textBuffer[i] == EOS)
            return i;
    }
    return namingScreenData.template->maxChars - 1;
}

static u8 GetPreviousTextCaretPosition(void)
{
    s8 i;
    
    for (i = namingScreenData.template->maxChars - 1; i > 0; i--)
    {
        if (namingScreenData.textBuffer[i] != EOS)
            return i;
    }
    return 0;
}

static void DeleteTextCharacter(void)
{
    u8 index;
    u8 var2;
    
    index = GetPreviousTextCaretPosition();
    namingScreenData.textBuffer[index] = 0;
    sub_80B7960();
    namingScreenData.textBuffer[index] = EOS;
    var2 = GetKeyRoleAtCursorPos();
    if (var2 == 0 || var2 == 2)
        sub_80B6460(1, 0, 1);
    PlaySE(SE_BOWA);
}

static bool8 sub_80B7004(void)
{
    s16 x;
    s16 y;
    u8 ch;
    bool8 r4;
    
    GetCursorPos(&x, &y);
    x = CursorColToKeyboardCol(x);
    ch = GetCharAtKeyboardPos(x, y);
    r4 = 1;
    if (ch == 0xFF)
        r4 = sub_80B7104();
    else if (ch == 0xFE)
        r4 = sub_80B713C();
    else
        AddTextCharacter(ch);
    sub_80B7960();
    PlaySE(SE_SELECT);
    if (r4)
    {
        if (GetPreviousTextCaretPosition() == namingScreenData.template->maxChars - 1)
            return TRUE;
    }
    return FALSE;
}

static void sub_80B7090(void) // DoInput?
{
    u8 r5;
    u8 r4;
    
    r5 = GetPreviousTextCaretPosition();
    r4 = namingScreenData.textBuffer[r5];
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

static bool8 sub_80B7104(void)
{
    u8 r5;
    u8 r4;
    
    r5 = GetPreviousTextCaretPosition();
    r4 = namingScreenData.textBuffer[r5];
    if (sub_80B720C(r4))
    {
        sub_80B72A4(r4, r5);
        return TRUE;
    }
    return FALSE;
}

static bool8 sub_80B713C(void)
{
    u8 r5;
    u8 r4;
    
    r5 = GetPreviousTextCaretPosition();
    r4 = namingScreenData.textBuffer[r5];
    if (sub_80B7264(r4))
    {
        sub_80B7370(r4, r5);
        return TRUE;
    }
    return FALSE;
}

static void AddTextCharacter(u8 ch)
{
    u8 index = GetTextCaretPosition();
    
    namingScreenData.textBuffer[index] = ch;
}

static bool8 sub_80B7198(u8 a)
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

static bool8 sub_80B71E4(u8 a)
{
    if ((a >= 75 && a <= 79)
     || (a >= 155 && a <= 159))
        return TRUE;
    else
        return FALSE;
}

static bool8 sub_80B720C(u8 a)
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

static bool8 sub_80B7264(u8 a)
{
    if ((a >= 26 && a <= 30)
     || (a >= 70 && a <= 74)
     || (a >= 106 && a <= 110)
     || (a >= 150 && a <= 154))
        return TRUE;
    else
        return FALSE;
}

static void sub_80B72A4(u8 a, u8 b)
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
    namingScreenData.textBuffer[b] = chr;
}

static void sub_80B7370(u8 a, u8 b)
{
    u8 chr = a;
    
    if (a >= 26 && a <= 30)
        chr = a + 0x31;
    else if (a >= 70 && a <= 74)
        chr = a + 5;
    else if (a >= 106 && a <= 110)
        chr = a + 0x31;
    else if (a >= 150 && a <= 154)
        chr = a + 5;
    namingScreenData.textBuffer[b] = chr;
}

static void sub_80B73CC(u8 a, u8 b)
{
    u8 chr = a;
    
    if (a >= 55 && a <= 59)
        chr = a + 0xCF;
    else if (a >= 60 && a <= 64)
        chr = a + 0xCF;
    else if (a >= 65 && a <= 69)
        chr = a + 0xCF;
    else if (a >= 70 && a <= 74)
        chr = a + 0xD4;
    else if (a >= 135 && a <= 139)
        chr = a + 0xCF;
    else if (a >= 140 && a <= 144)
        chr = a + 0xCF;
    else if (a >= 145 && a <= 149)
        chr = a + 0xCF;
    else if (a >= 150 && a <= 154)
        chr = a + 0xD4;
    namingScreenData.textBuffer[b] = chr;
}

static void sub_80B7474(u8 a, u8 b)
{
    u8 chr = a;
    
    if (a >= 75 && a <= 79)
        chr = a + 0xCF;
    else if (a >= 155 && a <= 159)
        chr = a + 0xCF;
    namingScreenData.textBuffer[b] = chr;
}

static void sub_80B74B0(void)
{
    u8 i;
    
    for (i = 0; i < namingScreenData.template->maxChars; i++)
    {
        if (namingScreenData.textBuffer[i] != 0 && namingScreenData.textBuffer[i] != 0xFF)
        {
            StringCopyN(namingScreenData.destBuffer, namingScreenData.textBuffer, namingScreenData.template->maxChars + 1);
            break;
        }
    }
}

static void DisplaySentToPCMessage(void)
{
    StringCopy(gStringVar1, namingScreenData.destBuffer);
    StringExpandPlaceholders(gStringVar4, gOtherText_SentToPC);
    BasicInitMenuWindow(&gWindowConfig_81E6E88);
    MenuDisplayMessageBox();
    sub_8072044(gStringVar4);
}

static void sub_80B753C(void)
{
    LoadSpriteSheets(gUnknown_083CE6A0);
    LoadSpritePalettes(gUnknown_083CE708);
}

static void sub_80B7558(void)
{
    sub_80B7568();
    sub_80B75B0();
}

static void sub_80B7568(void)
{
    const void *src;
    void *dst;
    
    src = gNamingScreenMenu_Gfx;
    dst = (void *)(VRAM + gMenuMessageBoxContentTileOffset * 32);
    DmaCopy16(3, src, dst, 0x800);
    
    src = gNamingScreenMenu_Gfx;
    dst = (void *)(VRAM + 0x8000 + gMenuMessageBoxContentTileOffset * 32);
    DmaCopy16(3, src, dst, 0x800);
}

static void sub_80B75B0(void)
{
    LoadPalette(gNamingScreenPalettes, 0, 0x80);
}

static void sub_80B7650(u16 *);
static void sub_80B7660(u16 *);
static void sub_80B7670(u16 *);

static void (*const gUnknown_083CE2F0[][2])(u16 *) =
{
    {sub_80B7660, sub_80B7650},
    {sub_80B7650, sub_80B7670},
    {sub_80B7670, sub_80B7660},
};

static void sub_80B75C4(void)
{
    u16 *const arr[] =
    {
        (u16 *)(VRAM + 0xE000),
        (u16 *)(VRAM + 0xE800),
    };
    
    gUnknown_083CE2F0[namingScreenData.currentPage][0](arr[namingScreenData.unkC]);
    gUnknown_083CE2F0[namingScreenData.currentPage][1](arr[namingScreenData.unkD]);
}

static void sub_80B7614(void)
{
    u16 *const arr[] =
    {
        (u16 *)(VRAM + 0xE000),
        (u16 *)(VRAM + 0xE800),
    };
    
    gUnknown_083CE2F0[namingScreenData.currentPage][1](arr[namingScreenData.unkD]);
}

static void sub_80B7650(u16 *vramBuffer)
{
    sub_80B7698(vramBuffer, gUnknown_083CE748);
}

static void sub_80B7660(u16 *vramBuffer)
{
    sub_80B7698(vramBuffer, gUnknown_083CEBF8);
}

static void sub_80B7670(u16 *vramBuffer)
{
    sub_80B7698(vramBuffer, gUnknown_083CF0A8);
}

static void sub_80B7680(void)
{
    sub_80B76E0(VRAM + 0xF000, gUnknown_08E86258);
}

static void sub_80B7698(u16 *vramBuffer, const u16 *src)
{
    s16 i;
    s16 j;
    
    for (i = 0; i < 20; i++)
    {
        for (j = 0; j < 30; j++, src++)
        {
            vramBuffer[i * 32 + j] = *src + gMenuMessageBoxContentTileOffset;
        }
    }
}

static void sub_80B76E0(u16 *vramBuffer, const u16 *src)
{
    s16 i;
    s16 j;
    
    for (i = 0; i < 20; i++)
    {
        for (j = 0; j < 30; j++, src++)
        {
            vramBuffer[i * 32 + j] = *src + gMenuMessageBoxContentTileOffset;
        }
        src += 2;
    }
}

static void sub_80B772C(void)
{
    nullsub_20(namingScreenData.currentPage, namingScreenData.unkC);
}

static void sub_80B7740(void)
{
    nullsub_20((namingScreenData.currentPage + 1) % 3, namingScreenData.unkD);
}

static void nullsub_20(u8 a, u8 b)
{
}

static void sub_80B7838(void);
static void sub_80B7844(void);
static void sub_80B7850(void);

static void (*const gUnknown_083CE310[][2])(void) =
{
    sub_80B7844,
    sub_80B7838,
    sub_80B7838,
    sub_80B7850,
    sub_80B7850,
    sub_80B7844,
};

static const struct WindowConfig *const gUnknown_083CE328[][2][2] =
{
    {
        {&gWindowConfig_81E6EDC, &gWindowConfig_81E6EF8},
        {&gWindowConfig_81E6EA4, &gWindowConfig_81E6EC0},
    },
    {
        {&gWindowConfig_81E6EA4, &gWindowConfig_81E6EC0},
        {&gWindowConfig_81E6F14, &gWindowConfig_81E6F30},
    },
    {
        {&gWindowConfig_81E6F14, &gWindowConfig_81E6F30},
        {&gWindowConfig_81E6EDC, &gWindowConfig_81E6EF8},
    },
};

static void nullsub_61(void);
static void sub_80B78F8(void);

static void (*const gUnknown_083CE358[])(void) =
{
    nullsub_61,
    nullsub_61,
    sub_80B78F8,
    sub_80B78F8,
};

static void nullsub_62(void);
static void sub_80B7924(void);

static void (*const gUnknown_083CE368[])(void) =
{
    nullsub_62,
    sub_80B7924,
};

static const u8 sKeyboardCharacters[][4][20];  //forward declaration

static u8 GetCharAtKeyboardPos(s16 a, s16 b)
{
    return sKeyboardCharacters[namingScreenData.currentPage][b][a];
}

static void sub_80B7794(void)
{
    BasicInitMenuWindow(gUnknown_083CE328[namingScreenData.currentPage][0][namingScreenData.unkC]);
    gUnknown_083CE310[namingScreenData.currentPage][0]();
    BasicInitMenuWindow(gUnknown_083CE328[namingScreenData.currentPage][1][namingScreenData.unkD]);
    gUnknown_083CE310[namingScreenData.currentPage][1]();
    sub_80B772C();
    sub_80B7740();
}

static void sub_80B77F8(void)
{
    BasicInitMenuWindow(gUnknown_083CE328[namingScreenData.currentPage][1][namingScreenData.unkD]);
    gUnknown_083CE310[namingScreenData.currentPage][1]();
    sub_80B7740();
}

static void sub_80B7838(void)
{
    PrintKeyboardCharacters(1);
}

static void sub_80B7844(void)
{
    PrintKeyboardCharacters(0);
}

static void sub_80B7850(void)
{
    PrintKeyboardCharacters(2);
}

static void PrintKeyboardCharacters(u8 page)  //print letters on page
{
    s16 i;
    s16 r5;
    
    for (i = 0, r5 = 9; i < 4; i++, r5 += 2)
        MenuPrint(sKeyboardCharacters[page][i], 3, r5);
}

static void sub_80B78A8(void)
{
    BasicInitMenuWindow(&gWindowConfig_81E6F4C);
    gUnknown_083CE358[namingScreenData.templateNum]();
    gUnknown_083CE368[namingScreenData.template->unk3]();
    MenuPrint(namingScreenData.template->title, 9, 2);
}

static void nullsub_61(void)
{
}

static void sub_80B78F8(void)
{
    StringCopy(gStringVar1, gSpeciesNames[(s16)namingScreenData.unk3E]);
}

static void nullsub_62(void)
{
}

static void sub_80B7924(void)
{
    u8 genderSymbol[2] = _("♂");
    
    if ((s16)namingScreenData.unk40 != MON_GENDERLESS)
    {
        if ((s16)namingScreenData.unk40 == MON_FEMALE)
            genderSymbol[0] = 0xB6;  //female symbol
        MenuPrint(genderSymbol, 0x14, 4);
    }
}

static void sub_80B7960(void)
{
    u8 *string = gStringVar1;
    
    string[0] = 0xFC;
    string[1] = 0x14;
    string[2] = 8;
    string[3] = 0xFC;
    string[4] = 0x11;
    string[5] = 1;
    string += 6;
    StringCopy(string, namingScreenData.textBuffer);
    BasicInitMenuWindow(&gWindowConfig_81E6F4C);
    MenuPrint(gStringVar1, namingScreenData.unk2, 4);
}

//--------------------------------------------------
// Forward-declared variables
//--------------------------------------------------

static const struct NamingScreenTemplate playerNamingScreenTemplate =
{
    .unk0 = 0,
    .maxChars = 7,
    .unk2 = 1,
    .unk3 = 0,
    .unk4 = 0,
    .unk5 = 0,
    .unk6 = 0,
    .unk7 = 0,
    .title = OtherText_YourName,
};

static const struct NamingScreenTemplate pcBoxNamingTemplate =
{
    .unk0 = 0,
    .maxChars = 8,
    .unk2 = 2,
    .unk3 = 0,
    .unk4 = 0,
    .unk5 = 0,
    .unk6 = 0,
    .unk7 = 0,
    .title = OtherText_BoxName,
};

static const struct NamingScreenTemplate monNamingScreenTemplate =
{
    .unk0 = 0,
    .maxChars = 10,
    .unk2 = 3,
    .unk3 = 1,
    .unk4 = 0,
    .unk5 = 0,
    .unk6 = 0,
    .unk7 = 0,
    .title = OtherText_PokeName,
};

static const struct NamingScreenTemplate *const sNamingScreenTemplates[] =
{
    &playerNamingScreenTemplate,
    &pcBoxNamingTemplate,
    &monNamingScreenTemplate,
    &monNamingScreenTemplate,
};

static const u8 sKeyboardCharacters[][4][20] =
{
    {
        _(" A B C  D E F    . "),
        _(" G H I  J K L    , "),
        _(" M N O  P Q R S    "),
        _(" T U V  W X Y Z    "),
    },
    {
        _(" a b c  d e f    . "),
        _(" g h i  j k l    , "),
        _(" m n o  p q r s    "),
        _(" t u v  w x y z    "),
    },
    {
        _(" 0  1  2  3  4     "),
        _(" 5  6  7  8  9     "),
        _(" !  ?  ♂  ♀  /  -  "),
        _(" …  “  ”  ‘  ’     "),
    },
};

const struct OamData gOamData_83CE498 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

const struct OamData gOamData_83CE4A0 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 0,
    .x = 0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

const struct OamData gOamData_83CE4A8 =
{
    .y = 0,
    .affineMode = 0,
    .objMode = 0,
    .mosaic = 0,
    .bpp = 0,
    .shape = 1,
    .x = 0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0,
};

//TODO: dump sprite data
