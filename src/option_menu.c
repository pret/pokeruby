#include "global.h"
#include "option_menu.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "scanline_effect.h"
#include "sprite.h"
#include "strings2.h"
#include "task.h"

extern void SetPokemonCryStereo(u32 val);

// Menu items
enum
{
    MENUITEM_TEXTSPEED,
    MENUITEM_BATTLESCENE,
    MENUITEM_BATTLESTYLE,
    MENUITEM_SOUND,
    MENUITEM_BUTTONMODE,
    MENUITEM_FRAMETYPE,
    MENUITEM_CANCEL,
};

// Task data
#define tMenuSelection  data[0]
#define tOptTextSpeed   data[1]
#define tOptBattleScene data[2]
#define tOptBattleStyle data[3]
#define tOptSound       data[4]
#define tOptButtonMode  data[5]
#define tOptFrameType   data[6]

const u16 gUnknown_0839F5FC[] = INCBIN_U16("graphics/misc/option_menu_text.gbapal");
// note: this is only used in the Japanese release
const u8 gUnknown_0839F63C[] = INCBIN_U8("graphics/misc/option_menu_equals_sign.4bpp");

static void Task_OptionMenuFadeIn(u8 taskId);
static void Task_OptionMenuProcessInput(u8 taskId);
static void Task_OptionMenuSave(u8 taskId);
static void Task_OptionMenuFadeOut(u8 taskId);
static void HighlightOptionMenuItem(u8 selection);
static u8   TextSpeed_ProcessInput(u8 selection);
static void TextSpeed_DrawChoices(u8 selection);
static u8   BattleScene_ProcessInput(u8 selection);
static void BattleScene_DrawChoices(u8 selection);
static u8   BattleStyle_ProcessInput(u8 selection);
static void BattleStyle_DrawChoices(u8 selection);
static u8   Sound_ProcessInput(u8 selection);
static void Sound_DrawChoices(u8 selection);
static u8   FrameType_ProcessInput(u8 selection);
static void FrameType_DrawChoices(u8 selection);
static u8   ButtonMode_ProcessInput(u8 selection);
static void ButtonMode_DrawChoices(u8 selection);

static void MainCB(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

static void VBlankCB(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

void CB2_InitOptionMenu(void)
{
    switch (gMain.state)
    {
    default:
    case 0:
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
        DmaFill16Large(3, 0, (u8 *)VRAM, 0x18000, 0x1000);
        DmaClear32(3, OAM, OAM_SIZE);
        DmaClear16(3, PLTT, PLTT_SIZE);
        gMain.state++;
        break;
    case 1:
        ResetPaletteFade();
        ScanlineEffect_Stop();
        ResetTasks();
        ResetSpriteData();
        gMain.state++;
        break;
    case 2:
        Text_LoadWindowTemplate(&gWindowTemplate_81E71B4);
        gMain.state++;
        break;
    case 3:
        MultistepInitMenuWindowBegin(&gWindowTemplate_81E71B4);
        gMain.state++;
        break;
    case 4:
        if (!MultistepInitMenuWindowContinue())
            return;
        gMain.state++;
        break;
    case 5:
        LoadPalette(gUnknown_0839F5FC, 0x80, 0x40);
        CpuCopy16(gUnknown_0839F63C, (void *)0x0600BEE0, 0x40);
        gMain.state++;
        break;
    case 6:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        gMain.state++;
        break;
    case 7:
    {
        u16 savedIme;

        REG_WIN0H = 0;
        REG_WIN0V = 0;
        REG_WIN1H = 0;
        REG_WIN1V = 0;
        REG_WININ = 0x1111;
        REG_WINOUT = 0x31;
        REG_BLDCNT = 0xE1;
        REG_BLDALPHA = 0;
        REG_BLDY = 7;
        savedIme = REG_IME;
        REG_IME = 0;
        REG_IE |= INTR_FLAG_VBLANK;
        REG_IME = savedIme;
        REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
        SetVBlankCallback(VBlankCB);
        REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_OBJ_ON |
          DISPCNT_WIN0_ON | DISPCNT_WIN1_ON;
        gMain.state++;
        break;
    }
    case 8:
    {
        u8 taskId = CreateTask(Task_OptionMenuFadeIn, 0);

        gTasks[taskId].tMenuSelection = 0;
        gTasks[taskId].tOptTextSpeed   = gSaveBlock2.optionsTextSpeed;
        gTasks[taskId].tOptBattleScene = gSaveBlock2.optionsBattleSceneOff;
        gTasks[taskId].tOptBattleStyle = gSaveBlock2.optionsBattleStyle;
        gTasks[taskId].tOptSound       = gSaveBlock2.optionsSound;
        gTasks[taskId].tOptButtonMode  = gSaveBlock2.optionsButtonMode;
        gTasks[taskId].tOptFrameType   = gSaveBlock2.optionsWindowFrameType;

        Menu_DrawStdWindowFrame(2, 0, 27, 3);   // title box
        Menu_DrawStdWindowFrame(2, 4, 27, 19);  // options list box

        Menu_PrintText(gSystemText_OptionMenu,  4,  1);

        Menu_PrintText(gSystemText_TextSpeed,   4,  5);
        Menu_PrintText(gSystemText_BattleScene, 4,  7);
        Menu_PrintText(gSystemText_BattleStyle, 4,  9);
        Menu_PrintText(gSystemText_Sound,       4, 11);
        Menu_PrintText(gSystemText_ButtonMode,  4, 13);
        Menu_PrintText(gSystemText_Frame,       4, 15);
        Menu_PrintText(gSystemText_Cancel,      4, 17);

        TextSpeed_DrawChoices(gTasks[taskId].tOptTextSpeed);
        BattleScene_DrawChoices(gTasks[taskId].tOptBattleScene);
        BattleStyle_DrawChoices(gTasks[taskId].tOptBattleStyle);
        Sound_DrawChoices(gTasks[taskId].tOptSound);
        ButtonMode_DrawChoices(gTasks[taskId].tOptButtonMode);
        FrameType_DrawChoices(gTasks[taskId].tOptFrameType);

        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(1, 31);

        HighlightOptionMenuItem(gTasks[taskId].tMenuSelection);
        gMain.state++;
        break;
    }
    case 9:
        SetMainCallback2(MainCB);
        return;
    }
}

static void Task_OptionMenuFadeIn(u8 taskId)
{
    if (!gPaletteFade.active)
        gTasks[taskId].func = Task_OptionMenuProcessInput;
}

static void Task_OptionMenuProcessInput(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
    {
        if (gTasks[taskId].tMenuSelection == MENUITEM_CANCEL)
            gTasks[taskId].func = Task_OptionMenuSave;
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        gTasks[taskId].func = Task_OptionMenuSave;
    }
    else if (gMain.newKeys & DPAD_UP)
    {
        if (gTasks[taskId].tMenuSelection > 0)
            gTasks[taskId].tMenuSelection--;
        else
            gTasks[taskId].tMenuSelection = 6;
        HighlightOptionMenuItem(gTasks[taskId].tMenuSelection);
    }
    else if (gMain.newKeys & DPAD_DOWN)
    {
        if (gTasks[taskId].tMenuSelection < 6)
            gTasks[taskId].tMenuSelection++;
        else
            gTasks[taskId].tMenuSelection = 0;
        HighlightOptionMenuItem(gTasks[taskId].tMenuSelection);
    }
    else
    {
        switch (gTasks[taskId].tMenuSelection)
        {
        case MENUITEM_TEXTSPEED:
            gTasks[taskId].tOptTextSpeed = TextSpeed_ProcessInput(gTasks[taskId].tOptTextSpeed);
            TextSpeed_DrawChoices(gTasks[taskId].tOptTextSpeed);
            break;
        case MENUITEM_BATTLESCENE:
            gTasks[taskId].tOptBattleScene = BattleScene_ProcessInput(gTasks[taskId].tOptBattleScene);
            BattleScene_DrawChoices(gTasks[taskId].tOptBattleScene);
            break;
        case MENUITEM_BATTLESTYLE:
            gTasks[taskId].tOptBattleStyle = BattleStyle_ProcessInput(gTasks[taskId].tOptBattleStyle);
            BattleStyle_DrawChoices(gTasks[taskId].tOptBattleStyle);
            break;
        case MENUITEM_SOUND:
            gTasks[taskId].tOptSound = Sound_ProcessInput(gTasks[taskId].tOptSound);
            Sound_DrawChoices(gTasks[taskId].tOptSound);
            break;
        case MENUITEM_BUTTONMODE:
            gTasks[taskId].tOptButtonMode = ButtonMode_ProcessInput(gTasks[taskId].tOptButtonMode);
            ButtonMode_DrawChoices(gTasks[taskId].tOptButtonMode);
            break;
        case MENUITEM_FRAMETYPE:
            gTasks[taskId].tOptFrameType = FrameType_ProcessInput(gTasks[taskId].tOptFrameType);
            FrameType_DrawChoices(gTasks[taskId].tOptFrameType);
            break;
        }
    }
}

static void Task_OptionMenuSave(u8 taskId)
{
    gSaveBlock2.optionsTextSpeed       = gTasks[taskId].tOptTextSpeed;
    gSaveBlock2.optionsBattleSceneOff  = gTasks[taskId].tOptBattleScene;
    gSaveBlock2.optionsBattleStyle     = gTasks[taskId].tOptBattleStyle;
    gSaveBlock2.optionsSound           = gTasks[taskId].tOptSound;
    gSaveBlock2.optionsButtonMode      = gTasks[taskId].tOptButtonMode;
    gSaveBlock2.optionsWindowFrameType = gTasks[taskId].tOptFrameType;

    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gTasks[taskId].func = Task_OptionMenuFadeOut;
}

static void Task_OptionMenuFadeOut(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        DestroyTask(taskId);
        SetMainCallback2(gMain.savedCallback);
    }
}

//This version uses addition '+' instead of OR '|'.
#define WIN_RANGE_(a, b) (((a) << 8) + (b))

static void HighlightOptionMenuItem(u8 index)
{
    REG_WIN1H = WIN_RANGE(24, 215);
    REG_WIN1V = WIN_RANGE_(index * 16 + 40, index * 16 + 56);
}

static void DrawOptionMenuChoice(const u8 *text, u8 x, u8 y, u8 style)
{
    u8 dst[15];
    u16 i;

    for (i = 0; *text != EOS && i < 15; i++)
        dst[i] = *(text++);

    dst[2] = style;
    dst[i] = EOS;
    Menu_PrintTextPixelCoords(dst, x, y, 1);
}

static u8 TextSpeed_ProcessInput(u8 selection)
{
    if (gMain.newKeys & DPAD_RIGHT)
    {
        if (selection < 2)
            selection++;
        else
            selection = 0;
    }
    if (gMain.newKeys & DPAD_LEFT)
    {
        if (selection > 0)
            selection--;
        else
            selection = 2;
    }
    return selection;
}

#if ENGLISH
#define TEXTSPEED_SLOW_LEFT (120)
#define TEXTSPEED_MIX_LEFT (155)
#define TEXTSPEED_FAST_LEFT (184)
#endif
#if GERMAN
#define TEXTSPEED_SLOW_LEFT (120)
#define TEXTSPEED_MIX_LEFT (161)
#define TEXTSPEED_FAST_LEFT (202)
#endif

static void TextSpeed_DrawChoices(u8 selection)
{
    u8 styles[3];

    styles[0] = 0xF;
    styles[1] = 0xF;
    styles[2] = 0xF;
    styles[selection] = 0x8;

    DrawOptionMenuChoice(gSystemText_Slow, TEXTSPEED_SLOW_LEFT, 40, styles[0]);
    DrawOptionMenuChoice(gSystemText_Mid,  TEXTSPEED_MIX_LEFT,  40, styles[1]);
    DrawOptionMenuChoice(gSystemText_Fast, TEXTSPEED_FAST_LEFT, 40, styles[2]);
}

static u8 BattleScene_ProcessInput(u8 selection)
{
    if (gMain.newKeys & (DPAD_LEFT | DPAD_RIGHT))
        selection ^= 1;
    return selection;
}

static void BattleScene_DrawChoices(u8 selection)
{
    u8 styles[2];

    styles[0] = 0xF;
    styles[1] = 0xF;
    styles[selection] = 0x8;

    DrawOptionMenuChoice(gSystemText_On,  120, 56, styles[0]);
    DrawOptionMenuChoice(gSystemText_Off, 190, 56, styles[1]);
}

static u8 BattleStyle_ProcessInput(u8 selection)
{
    if (gMain.newKeys & (DPAD_LEFT | DPAD_RIGHT))
        selection ^= 1;
    return selection;
}

#if ENGLISH
#define BATTLESTYLE_SHIFT (120)
#define BATTLESTYLE_SET (190)
#elif GERMAN
#define BATTLESTYLE_SHIFT (120)
#define BATTLESTYLE_SET (178)
#endif

static void BattleStyle_DrawChoices(u8 selection)
{
    u8 styles[2];

    styles[0] = 0xF;
    styles[1] = 0xF;
    styles[selection] = 0x8;

    DrawOptionMenuChoice(gSystemText_Shift, BATTLESTYLE_SHIFT, 72, styles[0]);
    DrawOptionMenuChoice(gSystemText_Set,   BATTLESTYLE_SET,   72, styles[1]);
}

static u8 Sound_ProcessInput(u8 selection)
{
    if (gMain.newKeys & (DPAD_LEFT | DPAD_RIGHT))
    {
        selection ^= 1;
        SetPokemonCryStereo(selection);
    }
    return selection;
}

static void Sound_DrawChoices(u8 selection)
{
    u8 styles[3];

    styles[0] = 0xF;
    styles[1] = 0xF;
    styles[selection] = 0x8;

    DrawOptionMenuChoice(gSystemText_Mono,   120, 88, styles[0]);
    DrawOptionMenuChoice(gSystemText_Stereo, 172, 88, styles[1]);
}

static u8 FrameType_ProcessInput(u8 selection)
{
    if (gMain.newKeys & DPAD_RIGHT)
    {
        if (selection < 19)
            selection++;
        else
            selection = 0;
        Menu_LoadStdFrameGraphicsOverrideStyle(selection);
    }
    if (gMain.newKeys & DPAD_LEFT)
    {
        if (selection > 0)
            selection--;
        else
            selection = 19;
        Menu_LoadStdFrameGraphicsOverrideStyle(selection);
    }
    return selection;
}

#define CHAR_0 0xA1 //Character code of '0' character

#if ENGLISH
static void FrameType_DrawChoices(u8 selection)
{
    u8 text[6];
    u8 n = selection + 1;
    u16 i;

    for (i = 0; gSystemText_Terminator[i] != EOS && i < 6; i++)
        text[i] = gSystemText_Terminator[i];

    //Convert number to decimal string
    if (n / 10 != 0)
    {
        text[i] = n / 10 + CHAR_0;
        i++;
        text[i] = n % 10 + CHAR_0;
        i++;
    }
    else
    {
        text[i] = n % 10 + CHAR_0;
        i++;
        text[i] = CHAR_SPACE;
        i++;
    }

    text[i] = EOS;
    Menu_PrintText(gSystemText_Type, 15, 15);
    Menu_PrintText(text, 18, 15);
}
#elif GERMAN
NAKED
static void FrameType_DrawChoices(u8 selection)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    sub sp, 0x10\n\
    lsls r0, 24\n\
    movs r1, 0x80\n\
    lsls r1, 17\n\
    adds r0, r1\n\
    lsrs r5, r0, 24\n\
    ldr r1, _0808C368 @ =gSystemText_Type\n\
    mov r0, sp\n\
    bl StringCopy\n\
    ldr r1, _0808C36C @ =gSystemText_Terminator\n\
    mov r0, sp\n\
    bl StringAppend\n\
    adds r4, r0, 0\n\
    adds r0, r5, 0\n\
    movs r1, 0xA\n\
    bl __udivsi3\n\
    adds r1, r0, 0\n\
    lsls r0, r1, 24\n\
    lsrs r6, r0, 24\n\
    cmp r6, 0\n\
    beq _0808C370\n\
    adds r0, r1, 0\n\
    adds r0, 0xA1\n\
    strb r0, [r4]\n\
    adds r4, 0x1\n\
    adds r0, r5, 0\n\
    movs r1, 0xA\n\
    bl __umodsi3\n\
    adds r0, 0xA1\n\
    strb r0, [r4]\n\
    b _0808C380\n\
    .align 2, 0\n\
_0808C368: .4byte gSystemText_Type\n\
_0808C36C: .4byte gSystemText_Terminator\n\
_0808C370:\n\
    adds r0, r5, 0\n\
    movs r1, 0xA\n\
    bl __umodsi3\n\
    adds r0, 0xA1\n\
    strb r0, [r4]\n\
    adds r4, 0x1\n\
    strb r6, [r4]\n\
_0808C380:\n\
    adds r4, 0x1\n\
    movs r0, 0xFF\n\
    strb r0, [r4]\n\
    mov r0, sp\n\
    movs r1, 0xF\n\
    movs r2, 0xF\n\
    bl Menu_PrintText\n\
    add sp, 0x10\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n");
}
#endif

static u8 ButtonMode_ProcessInput(u8 selection)
{
    if (gMain.newKeys & DPAD_RIGHT)
    {
        if (selection < 2)
            selection++;
        else
            selection = 0;
    }
    if (gMain.newKeys & DPAD_LEFT)
    {
        if (selection > 0)
            selection--;
        else
            selection = 2;
    }
    return selection;
}

static void ButtonMode_DrawChoices(u8 selection)
{
    u8 styles[3];

    styles[0] = 0xF;
    styles[1] = 0xF;
    styles[2] = 0xF;
    styles[selection] = 0x8;

    DrawOptionMenuChoice(gSystemText_Normal, 120, 104, styles[0]);
    DrawOptionMenuChoice(gSystemText_LR,     166, 104, styles[1]);
    DrawOptionMenuChoice(gSystemText_LA,     188, 104, styles[2]);
}
