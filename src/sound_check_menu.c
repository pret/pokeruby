#include "global.h"
#include "sprite.h"
#include "palette.h"
#include "task.h"
#include "m4a.h"
#include "main.h"
#include "text.h"
#include "menu.h"
#include "songs.h"
#include "title_screen.h"
#include "sound.h"
#include "pokedex_cry_screen.h"

// local task defines
#define WINDOW_SELECTED data[0]
#define BGM_INDEX data[1]
#define SE_INDEX data[2]
#define UNK_DATA3 data[3]
#define UNK_DATA4 data[4]
// data 5-7 are not used
// i dont have a define for data 8 yet because its used in a nonmatching and I can't be sure yet its actually used.

// window selections
enum
{
    BGM_WINDOW,
    SE_WINDOW
};

// driver test cry enums
enum
{
    CRY_TEST_UNK0,
    CRY_TEST_VOLUME,
    CRY_TEST_PANPOT,
    CRY_TEST_PITCH,
    CRY_TEST_LENGTH,
    CRY_TEST_RELEASE,
    CRY_TEST_PROGRESS,
    CRY_TEST_CHORUS,
    CRY_TEST_PRIORITY
};

// minmax range enums
enum
{
    MIN,
    MAX
};

extern struct ToneData voicegroup_84537C0[];
extern struct ToneData voicegroup_8452590[];
extern struct ToneData voicegroup_8453DC0[];
extern struct ToneData voicegroup_8452B90[];
extern struct ToneData voicegroup_84543C0[];
extern struct ToneData voicegroup_8453190[];
extern struct ToneData voicegroup_84549C0[];
extern struct ToneData voicegroup_8453790[];

static EWRAM_DATA u8 gUnknown_020387B0 = 0;
static EWRAM_DATA u8 gUnknown_020387B1 = 0;
static EWRAM_DATA u8 gUnknown_020387B2 = 0;
static EWRAM_DATA s8 gUnknown_020387B3 = 0;
static EWRAM_DATA int gUnknown_020387B4[9] = {0};
static EWRAM_DATA u8 gUnknown_020387D8 = 0;
static EWRAM_DATA u8 gUnknown_020387D9 = 0;

extern u16 gUnknown_03005D34;
extern u8 gUnknown_03005E98;

struct MusicPlayerInfo *gUnknown_03005D30;

extern struct MusicPlayerInfo gMPlay_BGM;

void sub_80BA258(u8);
void sub_80BA384(u8);
void sub_80BA65C(u8);
void sub_80BA68C(u8);
void sub_80BA6B8(u8);
void sub_80BA700(u16, u16, u16);
void sub_80BA79C(const u8 *const, u16, u16);
void sub_80BA800(u8);
void sub_80BAA48(u8);
void sub_80BACDC(s8);
void sub_80BAD5C(void);
void sub_80BAE10(u8, u8);
void sub_80BAE78(int, u16, u16, u8);
void sub_80BAF84(u8);
void sub_80BB038(u8);
void sub_80BB1D4(void);
void sub_80BB25C(u8);
void sub_80BB3B4(u8);
void sub_80BB494(void);

void sub_80BA0A8(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_80BA0C0(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();

    if (gUnknown_020387B0 != 0)
    {
        m4aSoundMain();
        m4aSoundMain();
        m4aSoundMain();
    }
}

// unused
void CB2_StartSoundCheckMenu(void)
{
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
    DmaFill16(3, 0, VRAM, VRAM_SIZE);
    DmaFill32(3, 0, OAM, OAM_SIZE);
    DmaFill16(3, 0, PLTT, PLTT_SIZE);
    ResetPaletteFade();
    ResetTasks();
    ResetSpriteData();
    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
    REG_WIN0H = WIN_RANGE(0, 0);
    REG_WIN0V = WIN_RANGE(0, 0);
    REG_WIN1H = WIN_RANGE(0, 0);
    REG_WIN1V = WIN_RANGE(0, 0);
    REG_WININ = 0x1111;
    REG_WINOUT = 0x31;
    REG_BLDCNT = 0xE1;
    REG_BLDALPHA = 0;
    REG_BLDY = 7;
    REG_IE = 1; // could be a typo of REG_IME
    REG_IE |= 1;
    REG_DISPSTAT |= 8;
    SetVBlankCallback(sub_80BA0C0);
    SetMainCallback2(sub_80BA0A8);
    REG_DISPCNT = 0x7140;
    taskId = CreateTask(sub_80BA258, 0);
    gTasks[taskId].WINDOW_SELECTED = BGM_WINDOW;
    gTasks[taskId].BGM_INDEX = 0;
    gTasks[taskId].SE_INDEX = 0;
    gTasks[taskId].UNK_DATA3 = 0;
    gUnknown_020387B0 = 0;
    gTasks[taskId].UNK_DATA3 = 0; // why?
    m4aSoundInit();
}

// Task_InitSoundCheckMenu
void sub_80BA258(u8 taskId)
{
    u8 soundcheckStr[] = _("サウンドチェック");
    u8 bgmStr[] = _("BGM");
    u8 seStr[] = _("SE ");
    u8 abDescStr[] = _("A‥さいせい　B‥おわり");
    u8 upDownStr[] = _("L‥UP R‥DOWN");
    u8 driverStr[] = _("R‥DRIVER-TEST");

    if (!gPaletteFade.active)
    {
        MenuDrawTextWindow(0x2, 0, 0x1B, 0x3);
        MenuDrawTextWindow(0x2, 0x5, 0x1B, 0xA);
        MenuDrawTextWindow(0x2, 0xC, 0x1B, 0x11);
        MenuPrint(soundcheckStr, 4, 1);
        MenuPrint(abDescStr, 14, 1);
        MenuPrint(bgmStr, 4, 6);
        MenuPrint(upDownStr, 14, 6);
        MenuPrint(seStr, 4, 13);
        MenuPrint(upDownStr, 14, 13);
        MenuPrint(driverStr, 14, 18);
        gTasks[taskId].FUNC = sub_80BA384;
        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(1, 31);
    }
}

// ideally this should be a multi Coords8 struct, but it wont match when its treated like a struct.
static const u8 gUnknown_083D0300[] = { 1, 1, 1, 3, 1, 5, 1, 7, 1, 9, 1, 11, 1, 13, 1, 15, 1, 17 };

extern const u8 *const gBGMNames[];
extern const u8 *const gSENames[];

void sub_80BA384(u8 taskId) // Task_HandleDrawingSoundCheckMenuText
{
    sub_80BA6B8(gTasks[taskId].WINDOW_SELECTED);
    sub_80BA700(gTasks[taskId].BGM_INDEX + BGM_STOP, 7, 8); // print by BGM index
    sub_80BA79C(gBGMNames[gTasks[taskId].BGM_INDEX], 11, 8);
    sub_80BA700(gTasks[taskId].SE_INDEX, 7, 15);
    sub_80BA79C(gSENames[gTasks[taskId].SE_INDEX], 11, 15);
    gTasks[taskId].FUNC = sub_80BA65C;
}

#ifdef NONMATCHING
bool8 sub_80BA400(u8 taskId) // Task_ProcessSoundCheckMenuInput
{
    if (gMain.newKeys & R_BUTTON) // driver test
    {
        gTasks[taskId].FUNC = sub_80BA800;
        return FALSE;
    }
    if (gMain.newKeys & L_BUTTON)
    {
        gTasks[taskId].FUNC = sub_80BAF84;
        return FALSE;
    }
    if (gMain.newKeys & START_BUTTON)
    {
        gTasks[taskId].FUNC = sub_80BB25C;
        return FALSE;
    }
    if (gMain.newKeys & A_BUTTON) // both these cases insist on non reuses of certain data variables and cause the function to not match.
    {
        if (gTasks[taskId].WINDOW_SELECTED != 0) // is playing?
        {
            if (gTasks[taskId].UNK_DATA4 != 0)
            {
                if (gTasks[taskId].SE_INDEX != 0) // why are you insiting on a non signed halfword?
                {
                    m4aSongNumStop(gTasks[taskId].UNK_DATA4);
                }
                else
                {
                    m4aSongNumStop(gTasks[taskId].SE_INDEX);
                    gTasks[taskId].UNK_DATA4 = gTasks[taskId].SE_INDEX;
                    return FALSE;
                }
            }
            else if (gTasks[taskId].SE_INDEX == 0) // _080BA4BA
            {
                return FALSE;
            }
            // _080BA4C4
            m4aSongNumStart(gTasks[taskId].SE_INDEX);
            gTasks[taskId].UNK_DATA4 = gTasks[taskId].SE_INDEX;
            return FALSE;
        }
        else // _080BA4D0
        {
            if (gTasks[taskId].UNK_DATA3 != 0)
            {
                if (gTasks[taskId].BGM_INDEX != 0)
                {
                    m4aSongNumStop(gTasks[taskId].UNK_DATA3 + BGM_STOP);
                }
                else // _080BA500
                {
                    m4aSongNumStop(gTasks[taskId].UNK_DATA3 + BGM_STOP);
                    gTasks[taskId].UNK_DATA3 = gTasks[taskId].BGM_INDEX;
                    return FALSE;
                }
            }
            else if (gTasks[taskId].BGM_INDEX == 0) // _080BA514
                return FALSE;

            m4aSongNumStart(gTasks[taskId].BGM_INDEX + BGM_STOP);
            gTasks[taskId].UNK_DATA3 = gTasks[taskId].BGM_INDEX;
        }
        return FALSE;
    }
    if (gMain.newKeys & B_BUTTON)
    {
        m4aSongNumStart(5);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        gTasks[taskId].FUNC = sub_80BA68C;
        return FALSE;
    }
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        gTasks[taskId].data[8] ^= A_BUTTON; // huh?
        return TRUE;
    }
    if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        gTasks[taskId].data[8] ^= A_BUTTON; // huh?
        return TRUE;
    }
    else
    {
    u16 keys = gMain.newAndRepeatedKeys & DPAD_RIGHT;
    if (keys)
    {
        if (gTasks[taskId].WINDOW_SELECTED != 0)
        {
            if (gTasks[taskId].SE_INDEX > 0)
            {
                gTasks[taskId].SE_INDEX--;
            }
            else
            {
                gTasks[taskId].SE_INDEX = 0xF7;
            }
        }
        else if (gTasks[taskId].BGM_INDEX > 0)
        {
            gTasks[taskId].BGM_INDEX--;
        }
        else
        {
            gTasks[taskId].BGM_INDEX = 0x75;
        }
        return TRUE;
    }
    if (gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        if (gTasks[taskId].WINDOW_SELECTED != 0)
        {
            if (gTasks[taskId].SE_INDEX < 0xF7)
            {
                gTasks[taskId].SE_INDEX++;
            }
            else
            {
                gTasks[taskId].SE_INDEX = keys; // ??
            }
        }
        else if (gTasks[taskId].BGM_INDEX < 0x75)
        {
            gTasks[taskId].BGM_INDEX++;
            return TRUE;
        }
        else
        {
            gTasks[taskId].BGM_INDEX = gTasks[taskId].SE_INDEX;
            return TRUE;
        }
        return TRUE;
    }
    if (gMain.heldKeys & SELECT_BUTTON)
    {
        gUnknown_020387B0 = A_BUTTON;
        return FALSE;
    }
    else
    {
        gUnknown_020387B0 = (gMain.heldKeys & SELECT_BUTTON);
        return FALSE;
    }
    }
}
#else
__attribute__((naked))
bool8 sub_80BA400(u8 taskId)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    sub sp, 0x4\n\
    lsls r0, 24\n\
    lsrs r4, r0, 24\n\
    ldr r2, _080BA428 @ =gMain\n\
    ldrh r1, [r2, 0x2E]\n\
    movs r0, 0x80\n\
    lsls r0, 1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080BA434\n\
    ldr r0, _080BA42C @ =gTasks\n\
    lsls r1, r4, 2\n\
    adds r1, r4\n\
    lsls r1, 3\n\
    adds r1, r0\n\
    ldr r0, _080BA430 @ =sub_80BA800\n\
    str r0, [r1]\n\
    b _080BA64C\n\
    .align 2, 0\n\
_080BA428: .4byte gMain\n\
_080BA42C: .4byte gTasks\n\
_080BA430: .4byte sub_80BA800\n\
_080BA434:\n\
    movs r0, 0x80\n\
    lsls r0, 2\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080BA458\n\
    ldr r0, _080BA450 @ =gTasks\n\
    lsls r1, r4, 2\n\
    adds r1, r4\n\
    lsls r1, 3\n\
    adds r1, r0\n\
    ldr r0, _080BA454 @ =sub_80BAF84\n\
    str r0, [r1]\n\
    b _080BA64C\n\
    .align 2, 0\n\
_080BA450: .4byte gTasks\n\
_080BA454: .4byte sub_80BAF84\n\
_080BA458:\n\
    movs r0, 0x8\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080BA478\n\
    ldr r0, _080BA470 @ =gTasks\n\
    lsls r1, r4, 2\n\
    adds r1, r4\n\
    lsls r1, 3\n\
    adds r1, r0\n\
    ldr r0, _080BA474 @ =sub_80BB25C\n\
    str r0, [r1]\n\
    b _080BA64C\n\
    .align 2, 0\n\
_080BA470: .4byte gTasks\n\
_080BA474: .4byte sub_80BB25C\n\
_080BA478:\n\
    movs r6, 0x1\n\
    movs r5, 0x1\n\
    ands r5, r1\n\
    cmp r5, 0\n\
    beq _080BA538\n\
    ldr r0, _080BA4AC @ =gTasks\n\
    lsls r1, r4, 2\n\
    adds r1, r4\n\
    lsls r1, 3\n\
    adds r5, r1, r0\n\
    movs r1, 0x8\n\
    ldrsh r0, [r5, r1]\n\
    cmp r0, 0\n\
    beq _080BA4D0\n\
    movs r2, 0x10\n\
    ldrsh r0, [r5, r2]\n\
    cmp r0, 0\n\
    beq _080BA4BA\n\
    movs r3, 0xC\n\
    ldrsh r4, [r5, r3]\n\
    cmp r4, 0\n\
    beq _080BA4B0\n\
    ldrh r0, [r5, 0x10]\n\
    bl m4aSongNumStop\n\
    b _080BA4C4\n\
    .align 2, 0\n\
_080BA4AC: .4byte gTasks\n\
_080BA4B0:\n\
    ldrh r0, [r5, 0x10]\n\
    bl m4aSongNumStop\n\
    strh r4, [r5, 0x10]\n\
    b _080BA64C\n\
_080BA4BA:\n\
    movs r4, 0xC\n\
    ldrsh r0, [r5, r4]\n\
    cmp r0, 0\n\
    bne _080BA4C4\n\
    b _080BA64C\n\
_080BA4C4:\n\
    ldrh r0, [r5, 0xC]\n\
    bl m4aSongNumStart\n\
    ldrh r0, [r5, 0xC]\n\
    strh r0, [r5, 0x10]\n\
    b _080BA64C\n\
_080BA4D0:\n\
    ldrh r1, [r5, 0xE]\n\
    movs r2, 0xE\n\
    ldrsh r0, [r5, r2]\n\
    cmp r0, 0\n\
    beq _080BA514\n\
    movs r3, 0xA\n\
    ldrsh r4, [r5, r3]\n\
    cmp r4, 0\n\
    beq _080BA500\n\
    ldr r0, _080BA4FC @ =0x0000015d\n\
    adds r4, r0, 0\n\
    adds r0, r1, r4\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    bl m4aSongNumStop\n\
    ldrh r1, [r5, 0xA]\n\
    adds r4, r1\n\
    lsls r4, 16\n\
    lsrs r4, 16\n\
    adds r0, r4, 0\n\
    b _080BA528\n\
    .align 2, 0\n\
_080BA4FC: .4byte 0x0000015d\n\
_080BA500:\n\
    ldr r2, _080BA510 @ =0x0000015d\n\
    adds r0, r1, r2\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
    bl m4aSongNumStop\n\
    strh r4, [r5, 0xE]\n\
    b _080BA64C\n\
    .align 2, 0\n\
_080BA510: .4byte 0x0000015d\n\
_080BA514:\n\
    ldrh r1, [r5, 0xA]\n\
    movs r3, 0xA\n\
    ldrsh r0, [r5, r3]\n\
    cmp r0, 0\n\
    bne _080BA520\n\
    b _080BA64C\n\
_080BA520:\n\
    ldr r4, _080BA534 @ =0x0000015d\n\
    adds r0, r1, r4\n\
    lsls r0, 16\n\
    lsrs r0, 16\n\
_080BA528:\n\
    bl m4aSongNumStart\n\
    ldrh r0, [r5, 0xA]\n\
    strh r0, [r5, 0xE]\n\
    b _080BA64C\n\
    .align 2, 0\n\
_080BA534: .4byte 0x0000015d\n\
_080BA538:\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080BA570\n\
    movs r0, 0x5\n\
    bl m4aSongNumStart\n\
    movs r0, 0x1\n\
    negs r0, r0\n\
    str r5, [sp]\n\
    movs r1, 0\n\
    movs r2, 0\n\
    movs r3, 0x10\n\
    bl BeginNormalPaletteFade\n\
    ldr r1, _080BA568 @ =gTasks\n\
    lsls r0, r4, 2\n\
    adds r0, r4\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    ldr r1, _080BA56C @ =sub_80BA68C\n\
    str r1, [r0]\n\
    b _080BA64C\n\
    .align 2, 0\n\
_080BA568: .4byte gTasks\n\
_080BA56C: .4byte sub_80BA68C\n\
_080BA570:\n\
    ldrh r1, [r2, 0x30]\n\
    movs r0, 0x40\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    bne _080BA582\n\
    movs r0, 0x80\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080BA59C\n\
_080BA582:\n\
    ldr r0, _080BA598 @ =gTasks\n\
    lsls r1, r4, 2\n\
    adds r1, r4\n\
    lsls r1, 3\n\
    adds r1, r0\n\
    ldrh r0, [r1, 0x8]\n\
    eors r0, r6\n\
    strh r0, [r1, 0x8]\n\
_080BA592:\n\
    movs r0, 0x1\n\
    b _080BA64E\n\
    .align 2, 0\n\
_080BA598: .4byte gTasks\n\
_080BA59C:\n\
    movs r0, 0x10\n\
    ands r0, r1\n\
    lsls r0, 16\n\
    lsrs r3, r0, 16\n\
    cmp r3, 0\n\
    beq _080BA5EA\n\
    ldr r0, _080BA5CC @ =gTasks\n\
    lsls r1, r4, 2\n\
    adds r1, r4\n\
    lsls r1, 3\n\
    adds r1, r0\n\
    movs r2, 0x8\n\
    ldrsh r0, [r1, r2]\n\
    cmp r0, 0\n\
    beq _080BA5D6\n\
    ldrh r2, [r1, 0xC]\n\
    movs r3, 0xC\n\
    ldrsh r0, [r1, r3]\n\
    cmp r0, 0\n\
    ble _080BA5D0\n\
    subs r0, r2, 0x1\n\
    strh r0, [r1, 0xC]\n\
    b _080BA592\n\
    .align 2, 0\n\
_080BA5CC: .4byte gTasks\n\
_080BA5D0:\n\
    movs r0, 0xF7\n\
    strh r0, [r1, 0xC]\n\
    b _080BA592\n\
_080BA5D6:\n\
    ldrh r2, [r1, 0xA]\n\
    movs r4, 0xA\n\
    ldrsh r0, [r1, r4]\n\
    cmp r0, 0\n\
    ble _080BA5E4\n\
    subs r0, r2, 0x1\n\
    b _080BA5E6\n\
_080BA5E4:\n\
    movs r0, 0x75\n\
_080BA5E6:\n\
    strh r0, [r1, 0xA]\n\
    b _080BA592\n\
_080BA5EA:\n\
    movs r0, 0x20\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _080BA630\n\
    ldr r1, _080BA614 @ =gTasks\n\
    lsls r0, r4, 2\n\
    adds r0, r4\n\
    lsls r0, 3\n\
    adds r1, r0, r1\n\
    movs r0, 0x8\n\
    ldrsh r2, [r1, r0]\n\
    cmp r2, 0\n\
    beq _080BA61C\n\
    ldrh r2, [r1, 0xC]\n\
    movs r4, 0xC\n\
    ldrsh r0, [r1, r4]\n\
    cmp r0, 0xF6\n\
    bgt _080BA618\n\
    adds r0, r2, 0x1\n\
    strh r0, [r1, 0xC]\n\
    b _080BA592\n\
    .align 2, 0\n\
_080BA614: .4byte gTasks\n\
_080BA618:\n\
    strh r3, [r1, 0xC]\n\
    b _080BA592\n\
_080BA61C:\n\
    ldrh r3, [r1, 0xA]\n\
    movs r4, 0xA\n\
    ldrsh r0, [r1, r4]\n\
    cmp r0, 0x74\n\
    bgt _080BA62C\n\
    adds r0, r3, 0x1\n\
    strh r0, [r1, 0xA]\n\
    b _080BA592\n\
_080BA62C:\n\
    strh r2, [r1, 0xA]\n\
    b _080BA592\n\
_080BA630:\n\
    ldrh r1, [r2, 0x2C]\n\
    movs r0, 0x4\n\
    ands r0, r1\n\
    lsls r0, 16\n\
    lsrs r1, r0, 16\n\
    cmp r1, 0\n\
    beq _080BA648\n\
    ldr r0, _080BA644 @ =gUnknown_020387B0\n\
    strb r6, [r0]\n\
    b _080BA64C\n\
    .align 2, 0\n\
_080BA644: .4byte gUnknown_020387B0\n\
_080BA648:\n\
    ldr r0, _080BA658 @ =gUnknown_020387B0\n\
    strb r1, [r0]\n\
_080BA64C:\n\
    movs r0, 0\n\
_080BA64E:\n\
    add sp, 0x4\n\
    pop {r4-r6}\n\
    pop {r1}\n\
    bx r1\n\
    .align 2, 0\n\
_080BA658: .4byte gUnknown_020387B0\n\
    .syntax divided");
}
#endif

void sub_80BA65C(u8 taskId)
{
    if (sub_80BA400(taskId) != FALSE)
        gTasks[taskId].FUNC = sub_80BA384;
}

void sub_80BA68C(u8 taskId)
{
    if (!gPaletteFade.active)
    {
        DestroyTask(taskId);
        SetMainCallback2(CB2_InitTitleScreen);
    }
}

void sub_80BA6B8(u8 windowType)
{
    switch (windowType)
    {
    case BGM_WINDOW:
    default:
        REG_WIN1H = WIN_RANGE(17, 223);
        REG_WIN1V = WIN_RANGE(41, 87);
        break;
    case SE_WINDOW:
        REG_WIN1H = WIN_RANGE(17, 223);
        REG_WIN1V = WIN_RANGE(97, 143);
        break;
    }
}

void sub_80BA700(u16 soundIndex, u16 x, u16 y) // PrintSoundNumber ?
{
    u8 i;
    u8 str[5];
    bool8 someBool;
    u8 divisorValue;

    for (i = 0; i < 3; i++)
        str[i] = 0; // initialize array

    str[3] = CHAR_ELLIPSIS;
    str[4] = EOS;
    someBool = FALSE;

    divisorValue = soundIndex / 100;
    if (divisorValue)
    {
        str[0] = divisorValue + CHAR_0;
        someBool = TRUE;
    }

    divisorValue = (soundIndex % 100) / 10;
    if (divisorValue || someBool != FALSE)
        str[1] = divisorValue + CHAR_0;

    str[2] = ((soundIndex % 100) % 10) + CHAR_0;
    MenuPrint(str, x, y);
}

void sub_80BA79C(const u8 *const string, u16 x, u16 y)
{
    u8 i;
    u8 str[11];

    for (i = 0; i < 11; i++)
        str[i] = 0; // format string.

    str[10] = EOS; // the above for loop formats the last element of the array unnecessarily.

    for (i = 0; string[i] != EOS && i < 10; i++)
        str[i] = string[i];

    MenuPrint(str, x, y);
}

void sub_80BA800(u8 taskId) // Task_DrawDriverTestMenu
{

    u8 bbackStr[] = _("Bぼたんで　もどる");
    u8 aplayStr[] = _("Aぼたんで　さいせい");
    u8 voiceStr[] = _("VOICE‥‥‥‥");
    u8 volumeStr[] = _("VOLUME‥‥‥");
    u8 panpotStr[] = _("PANPOT‥‥‥");
    u8 pitchStr[] = _("PITCH‥‥‥‥");
    u8 lengthStr[] = _("LENGTH‥‥‥");
    u8 releaseStr[] = _("RELEASE‥‥");
    u8 progressStr[] = _("PROGRESS‥");
    u8 chorusStr[] = _("CHORUS‥‥‥");
    u8 priorityStr[] = _("PRIORITY‥");
    u8 playingStr[] = _("さいせいちゆう‥"); // 再生中 (playing)
    u8 reverseStr[] = _("はんてん‥‥‥‥"); // 反転 (reverse)
    u8 stereoStr[] = _("すてれお‥‥‥‥"); // stereo

    REG_DISPCNT = 0x3140;
    MenuDrawTextWindow(0, 0, 0x1D, 0x13);
    MenuPrint(bbackStr, 0x13, 0x4);
    MenuPrint(aplayStr, 0x13, 0x2);
    MenuPrint(voiceStr, 0x2, 0x1);
    MenuPrint(volumeStr, 0x2, 0x3);
    MenuPrint(panpotStr, 0x2, 0x5);
    MenuPrint(pitchStr, 0x2, 0x7);
    MenuPrint(lengthStr, 0x2, 0x9);
    MenuPrint(releaseStr, 0x2, 0xB);
    MenuPrint(progressStr, 0x2, 0xD);
    MenuPrint(chorusStr, 0x2, 0xF);
    MenuPrint(priorityStr, 0x2, 0x11);
    MenuPrint(playingStr, 0x13, 0x10);
    MenuPrint(reverseStr, 0x13, 0xE);
    MenuPrint(stereoStr, 0x13, 0xC);
    REG_WIN0H = WIN_RANGE(0, 240);
    REG_WIN0V = WIN_RANGE(0, 160);
    gUnknown_020387B3 = 0;
    gUnknown_020387B1 = 0;
    gUnknown_020387B2 = 0;
    gUnknown_03005D30 = NULL;
    gUnknown_020387D8 = 0;
    gUnknown_020387D9 = 1;
    gUnknown_020387B4[CRY_TEST_UNK0] = 0;
    gUnknown_020387B4[CRY_TEST_VOLUME] = 0x78;
    gUnknown_020387B4[CRY_TEST_PANPOT] = 0;
    gUnknown_020387B4[CRY_TEST_PITCH] = 0x3C00;
    gUnknown_020387B4[CRY_TEST_LENGTH] = 0xB4;
    gUnknown_020387B4[CRY_TEST_PROGRESS] = 0;
    gUnknown_020387B4[CRY_TEST_RELEASE] = 0;
    gUnknown_020387B4[CRY_TEST_CHORUS] = 0;
    gUnknown_020387B4[CRY_TEST_PRIORITY] = 2;
    sub_80BAD5C();
    sub_80BAE10(0, 0);
    gTasks[taskId].FUNC = sub_80BAA48;
}



void sub_80BAA48(u8 taskId) // Task_ProcessDriverTestInput
{
    if (gMain.newKeys & B_BUTTON)
    {
        REG_DISPCNT = 0x7140;
        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(1, 31);
        MenuZeroFillWindowRect(0, 0, 0x1D, 0x13);
        gTasks[taskId].FUNC = sub_80BA258;
        return;
    }
    if (gMain.newAndRepeatedKeys & DPAD_UP) // _080BAAA8
    {
        u8 backupVar = gUnknown_020387B3;
        if(--gUnknown_020387B3 < 0)
            gUnknown_020387B3 = 8;

        sub_80BAE10(backupVar, gUnknown_020387B3);
        return;
    }
    if (gMain.newAndRepeatedKeys & DPAD_DOWN) // _080BAAD0
    {
        u8 backupVar = gUnknown_020387B3;
        if(++gUnknown_020387B3 > 8)
            gUnknown_020387B3 = 0;

        sub_80BAE10(backupVar, gUnknown_020387B3);
        return;
    }
    if (gMain.newKeys & START_BUTTON) // _080BAAF8
    {
        gUnknown_020387D8 ^= 1;
        sub_80BAD5C();
        return;
    }
    if (gMain.newKeys & SELECT_BUTTON) // _080BAB14
    {
        gUnknown_020387D9 ^= 1;
        sub_80BAD5C();
        SetPokemonCryStereo(gUnknown_020387D9);
        return;
    }
    if (gMain.newAndRepeatedKeys & R_BUTTON) // _080BAB38
    {
        sub_80BACDC(10);
        sub_80BAD5C();
        return;
    }
    if (gMain.newAndRepeatedKeys & L_BUTTON) // _080BAB46
    {
        sub_80BACDC(-10);
        sub_80BAD5C();
        return;
    }
    if (gMain.newAndRepeatedKeys & DPAD_LEFT) // _080BAB56
    {
        sub_80BACDC(-1);
        sub_80BAD5C();
        return;
    }
    if (gMain.newAndRepeatedKeys & DPAD_RIGHT) // _080BAB64
    {
        sub_80BACDC(1);
        sub_80BAD5C();
        return;
    }
    if (gMain.newKeys & A_BUTTON) // _080BAB78
    {
        u8 divide, remaining;

        SetPokemonCryVolume(gUnknown_020387B4[CRY_TEST_VOLUME]);
        SetPokemonCryPanpot(gUnknown_020387B4[CRY_TEST_PANPOT]);
        SetPokemonCryPitch(gUnknown_020387B4[CRY_TEST_PITCH]);
        SetPokemonCryLength(gUnknown_020387B4[CRY_TEST_LENGTH]);
        SetPokemonCryProgress(gUnknown_020387B4[CRY_TEST_PROGRESS]);
        SetPokemonCryRelease(gUnknown_020387B4[CRY_TEST_RELEASE]);
        SetPokemonCryChorus(gUnknown_020387B4[CRY_TEST_CHORUS]);
        SetPokemonCryPriority(gUnknown_020387B4[CRY_TEST_PRIORITY]);

        remaining = gUnknown_020387B4[CRY_TEST_UNK0] % 128;
        divide = gUnknown_020387B4[CRY_TEST_UNK0] / 128;

        switch (divide)
        {
        case 0:
            if (gUnknown_020387D8)
                gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_84537C0[remaining]);
            else
                gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_8452590[remaining]);
            break;
        case 1:
            if (gUnknown_020387D8)
                gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_8453DC0[remaining]);
            else
                gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_8452B90[remaining]);
            break;
        case 2:
            if (gUnknown_020387D8)
                gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_84543C0[remaining]);
            else
                gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_8453190[remaining]);
            break;
        case 3:
            if (gUnknown_020387D8)
                gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_84549C0[remaining]);
            else
                gUnknown_03005D30 = SetPokemonCryTone(&voicegroup_8453790[remaining]);
            break;
        }
    }

    // _080BACA2
    if (gUnknown_03005D30 != NULL)
    {
        gUnknown_020387B1 = IsPokemonCryPlaying(gUnknown_03005D30);

        if (gUnknown_020387B1 != gUnknown_020387B2)
            sub_80BAD5C();

        gUnknown_020387B2 = gUnknown_020387B1;
    }
}

void sub_80BACDC(s8 var)
{
    // also ideally should be a MinMax struct, but any attempt to make this into a struct causes it to not match due to the weird multi dim access.
    int minMaxArray[16] =
    {
        0, 387,
        0, 127,
        -127, 127,
        -128, 32639,
        0, 65535,
        0, 255,
        0, 65535,
        -64, 63
    };

    gUnknown_020387B4[gUnknown_020387B3] += var;

    if (gUnknown_020387B4[gUnknown_020387B3] > minMaxArray[MULTI_DIM_ARR(gUnknown_020387B3, B_16, MAX)])
        gUnknown_020387B4[gUnknown_020387B3] = minMaxArray[MULTI_DIM_ARR(gUnknown_020387B3, B_16, MIN)];

    if (gUnknown_020387B4[gUnknown_020387B3] < minMaxArray[MULTI_DIM_ARR(gUnknown_020387B3, B_16, MIN)])
        gUnknown_020387B4[gUnknown_020387B3] = minMaxArray[MULTI_DIM_ARR(gUnknown_020387B3, B_16, MAX)];
}

void sub_80BAD5C(void)
{
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_UNK0] + 1, 0xB, 0x1, 0x5);
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_VOLUME], 0xB, 0x3, 0x5);
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_PANPOT], 0xB, 0x5, 0x5);
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_PITCH], 0xB, 0x7, 0x5);
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_LENGTH], 0xB, 0x9, 0x5);
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_RELEASE], 0xB, 0xB, 0x5);
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_PROGRESS], 0xB, 0xD, 0x5);
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_CHORUS], 0xB, 0xF, 0x5);
    sub_80BAE78(gUnknown_020387B4[CRY_TEST_PRIORITY], 0xB, 0x11, 0x5);
    sub_80BAE78(gUnknown_020387B1, 0x1B, 0x10, 0x1);
    sub_80BAE78(gUnknown_020387D8, 0x1B, 0xE, 0x1);
    sub_80BAE78(gUnknown_020387D9, 0x1B, 0xC, 0x1);
}

void sub_80BAE10(u8 var1, u8 var2)
{
    u8 str1[] = _("▶");
    u8 str2[] = _(" ");

    MenuPrint(str2, gUnknown_083D0300[MULTI_DIM_ARR(var1, B_16, 0)], gUnknown_083D0300[MULTI_DIM_ARR(var1, B_16, 1)]);
    MenuPrint(str1, gUnknown_083D0300[MULTI_DIM_ARR(var2, B_16, 0)], gUnknown_083D0300[MULTI_DIM_ARR(var2, B_16, 1)]);
}

void sub_80BAE78(int n, u16 x, u16 y, u8 digits)
{
    int powersOfTen[6] =
    {
              1,
             10,
            100,
           1000,
          10000,
         100000
    };
    u8 str[8];
    s8 i;
    s8 negative;
    s8 someVar2;

    for (i = 0; i <= digits; i++)
        str[i] = CHAR_SPACE;
    str[digits + 1] = EOS;

    negative = FALSE;
    if (n < 0)
    {
        n = -n;
        negative = TRUE;
    }

    if (digits == 1)
        someVar2 = TRUE;
    else
        someVar2 = FALSE;

    for (i = digits - 1; i >= 0; i--)
    {
        s8 d = n / powersOfTen[i];

        if (d != 0 || someVar2 || i == 0)
        {
            if (negative && !someVar2)
                str[digits - i - 1] = CHAR_HYPHEN;
            str[digits - i] = CHAR_0 + d;
            someVar2 = TRUE;
        }
        n %= powersOfTen[i];
    }

    MenuPrint(str, x, y);
}

static const s8 gUnknown_083D03F8[5] = { 0x3F, 0x00, 0xC0, 0x7F, 0x80 };

void sub_80BAF84(u8 taskId)
{
    u8 seStr[] = _("SE");
    u8 panStr[] = _("PAN");
    u8 playingStr[] = _("さいせいちゆう‥");

    REG_DISPCNT = 0x3140;
    MenuDrawTextWindow(0, 0, 0x1D, 0x13);
    MenuPrint(seStr, 3, 2);
    MenuPrint(panStr, 3, 4);
    MenuPrint(playingStr, 3, 8);
    REG_WIN0H = WIN_RANGE(0, 240);
    REG_WIN0V = WIN_RANGE(0, 160);
    gUnknown_020387B4[CRY_TEST_UNK0] = 1;
    gUnknown_020387B4[CRY_TEST_PANPOT] = 0;
    gUnknown_020387B4[CRY_TEST_CHORUS] = 0;
    gUnknown_020387B4[CRY_TEST_PROGRESS] = 0;
    gUnknown_020387B4[CRY_TEST_RELEASE] = 0;
    sub_80BB1D4();
    gTasks[taskId].FUNC = sub_80BB038;
}

void sub_80BB038(u8 taskId)
{
    sub_80BB1D4();
    if (gUnknown_020387B4[CRY_TEST_PROGRESS])
    {
        if (gUnknown_020387B4[CRY_TEST_RELEASE])
        {
            gUnknown_020387B4[CRY_TEST_RELEASE]--;
        }
        else // _080BB05C
        {
            s8 panpot = gUnknown_083D03F8[gUnknown_020387B4[CRY_TEST_PANPOT]];
            if (panpot != -128)
            {
                if (panpot == 0x7F)
                {
                    gUnknown_020387B4[CRY_TEST_CHORUS] += 2;
                    if (gUnknown_020387B4[CRY_TEST_CHORUS] < 0x3F)
                        SE12PanpotControl(gUnknown_020387B4[CRY_TEST_CHORUS]);
                }
            }
            else // _080BB08C
            {
                gUnknown_020387B4[CRY_TEST_CHORUS] -= 2;
                if (gUnknown_020387B4[CRY_TEST_CHORUS] > -0x40)
                    SE12PanpotControl(gUnknown_020387B4[CRY_TEST_CHORUS]);
            }
        }
    }
     // _080BB0A2
    if (gMain.newKeys & B_BUTTON)
    {
        REG_DISPCNT = 0x7140;
        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(1, 31);
        MenuZeroFillWindowRect(0, 0, 0x1D, 0x13);
        gTasks[taskId].FUNC = sub_80BA258;
        return;
    }
    if (gMain.newKeys & A_BUTTON) // _080BB104
    {
        s8 panpot = gUnknown_083D03F8[gUnknown_020387B4[CRY_TEST_PANPOT]];
        if (panpot != -128)
        {
            if (panpot == 0x7F)
            {
                PlaySE12WithPanning(gUnknown_020387B4[CRY_TEST_UNK0], -0x40);
                gUnknown_020387B4[CRY_TEST_CHORUS] = -0x40;
                gUnknown_020387B4[CRY_TEST_PROGRESS] = 1;
                gUnknown_020387B4[CRY_TEST_RELEASE] = 0x1E;
                return;
            }
        }
        else // _080BB140
        {
            PlaySE12WithPanning(gUnknown_020387B4[CRY_TEST_UNK0], 0x3F);
            gUnknown_020387B4[CRY_TEST_CHORUS] = 0x3F;
            gUnknown_020387B4[CRY_TEST_PROGRESS] = 1;
            gUnknown_020387B4[CRY_TEST_RELEASE] = 0x1E;
            return;
        }
        // _080BB154
        PlaySE12WithPanning(gUnknown_020387B4[CRY_TEST_UNK0], panpot);
        gUnknown_020387B4[CRY_TEST_PROGRESS] = 0;
        return;
    }
    if (gMain.newKeys & L_BUTTON) // _080BB15E
    {
        gUnknown_020387B4[CRY_TEST_PANPOT]++;
        if (gUnknown_020387B4[CRY_TEST_PANPOT] > 4)
            gUnknown_020387B4[CRY_TEST_PANPOT] = 0;
    }
    if (gMain.newKeys & R_BUTTON) // _080BB176
    {
        gUnknown_020387B4[CRY_TEST_PANPOT]--;
        if (gUnknown_020387B4[CRY_TEST_PANPOT] < 0)
            gUnknown_020387B4[CRY_TEST_PANPOT] = 4;
    }
    if (gMain.newAndRepeatedKeys & DPAD_RIGHT) // _080BB192
    {
        gUnknown_020387B4[CRY_TEST_UNK0]++;
        if (gUnknown_020387B4[CRY_TEST_UNK0] > 0xF7)
            gUnknown_020387B4[CRY_TEST_UNK0] = 0;
    }
    else if (gMain.newAndRepeatedKeys & DPAD_LEFT) // _080BB1B0
    {
        gUnknown_020387B4[CRY_TEST_UNK0]--;
        if (gUnknown_020387B4[CRY_TEST_UNK0] < 0)
            gUnknown_020387B4[CRY_TEST_UNK0] = 0xF7;
    }
}

void sub_80BB1D4(void)
{
    u8 lrStr[] = _("  LR");
    u8 rlStr[] = _("  RL");

    sub_80BAE78(gUnknown_020387B4[CRY_TEST_UNK0], 7, 2, 3);

    switch (gUnknown_083D03F8[gUnknown_020387B4[CRY_TEST_PANPOT]])
    {
    case 0x7F:
        MenuPrint(lrStr, 7, 4);
        break;
    case -0x80:
        MenuPrint(rlStr, 7, 4);
        break;
    default:
        sub_80BAE78(gUnknown_083D03F8[gUnknown_020387B4[CRY_TEST_PANPOT]], 7, 4, 3);
        break;
    }
    sub_80BAE78(IsSEPlaying(), 12, 8, 1);
}

#define SOUND_LIST_BGM \
	X(BGM_STOP, "STOP") \
	X(BGM_TETSUJI, "TETSUJI") \
	X(BGM_FIELD13, "FIELD13") \
	X(BGM_KACHI22, "KACHI22") \
	X(BGM_KACHI2, "KACHI2") \
	X(BGM_KACHI3, "KACHI3") \
	X(BGM_KACHI5, "KACHI5") \
	X(BGM_PCC, "PCC") \
	X(BGM_NIBI, "NIBI") \
	X(BGM_SUIKUN, "SUIKUN") \
	X(BGM_DOORO1, "DOORO1") \
	X(BGM_DOORO_X1, "DOORO-X1") \
	X(BGM_DOORO_X3, "DOORO-X3") \
	X(BGM_MACHI_S2, "MACHI-S2") \
	X(BGM_MACHI_S4, "MACHI-S4") \
	X(BGM_GIM, "GIM") \
	X(BGM_NAMINORI, "NAMINORI") \
	X(BGM_DAN01, "DAN01") \
	X(BGM_FANFA1, "FANFA1") \
	X(BGM_ME_ASA, "ME-ASA") \
	X(BGM_ME_BACHI, "ME-BACHI") \
	X(BGM_FANFA4, "FANFA4") \
	X(BGM_FANFA5, "FANFA5") \
	X(BGM_ME_WAZA, "ME-WAZA") \
	X(BGM_BIJYUTU, "BIJYUTU") \
	X(BGM_DOORO_X4, "DOORO-X4") \
	X(BGM_FUNE_KAN, "FUNE-KAN") \
	X(BGM_ME_SHINKA, "ME-SHINKA") \
	X(BGM_SHINKA, "SHINKA") \
	X(BGM_ME_WASURE, "ME-WASURE") \
	X(BGM_SYOUJOEYE, "SYOUJOEYE") \
	X(BGM_BOYEYE, "BOYEYE") \
	X(BGM_DAN02, "DAN02") \
	X(BGM_MACHI_S3, "MACHI-S3") \
	X(BGM_ODAMAKI, "ODAMAKI") \
	X(BGM_B_TOWER, "B-TOWER") \
	X(BGM_SWIMEYE, "SWIMEYE") \
	X(BGM_DAN03, "DAN03") \
	X(BGM_ME_KINOMI, "ME-KINOMI") \
	X(BGM_ME_TAMA, "ME-TAMA") \
	X(BGM_ME_B_BIG, "ME-B-BIG") \
	X(BGM_ME_B_SMALL, "ME-B-SMALL") \
	X(BGM_ME_ZANNEN, "ME-ZANNEN") \
	X(BGM_BD_TIME, "BD-TIME") \
	X(BGM_TEST1, "TEST1") \
	X(BGM_TEST2, "TEST2") \
	X(BGM_TEST3, "TEST3") \
	X(BGM_TEST4, "TEST4") \
	X(BGM_TEST, "TEST") \
	X(BGM_GOMACHI0, "GOMACHI0") \
	X(BGM_GOTOWN, "GOTOWN") \
	X(BGM_POKECEN, "POKECEN") \
	X(BGM_NEXTROAD, "NEXTROAD") \
	X(BGM_GRANROAD, "GRANROAD") \
	X(BGM_CYCLING, "CYCLING") \
	X(BGM_FRIENDLY, "FRIENDLY") \
	X(BGM_MISHIRO, "MISHIRO") \
	X(BGM_TOZAN, "TOZAN") \
	X(BGM_GIRLEYE, "GIRLEYE") \
	X(BGM_MINAMO, "MINAMO") \
	X(BGM_ASHROAD, "ASHROAD") \
	X(BGM_EVENT0, "EVENT0") \
	X(BGM_DEEPDEEP, "DEEPDEEP") \
	X(BGM_KACHI1, "KACHI1") \
	X(BGM_TITLE3, "TITLE3") \
	X(BGM_DEMO1, "DEMO1") \
	X(BGM_GIRL_SUP, "GIRL-SUP") \
	X(BGM_HAGESHII, "HAGESHII") \
	X(BGM_KAKKOII, "KAKKOII") \
	X(BGM_KAZANBAI, "KAZANBAI") \
	X(BGM_AQA_0, "AQA-0") \
	X(BGM_TSURETEK, "TSURETEK") \
	X(BGM_BOY_SUP, "BOY-SUP") \
	X(BGM_RAINBOW, "RAINBOW") \
	X(BGM_AYASII, "AYASII") \
	X(BGM_KACHI4, "KACHI4") \
	X(BGM_ROPEWAY, "ROPEWAY") \
	X(BGM_CASINO, "CASINO") \
	X(BGM_HIGHTOWN, "HIGHTOWN") \
	X(BGM_SAFARI, "SAFARI") \
	X(BGM_C_ROAD, "C-ROAD") \
	X(BGM_AJITO, "AJITO") \
	X(BGM_M_BOAT, "M-BOAT") \
	X(BGM_M_DUNGON, "M-DUNGON") \
	X(BGM_FINECITY, "FINECITY") \
	X(BGM_MACHUPI, "MACHUPI") \
	X(BGM_P_SCHOOL, "P-SCHOOL") \
	X(BGM_DENDOU, "DENDOU") \
	X(BGM_TONEKUSA, "TONEKUSA") \
	X(BGM_MABOROSI, "MABOROSI") \
	X(BGM_CON_FAN, "CON-FAN") \
	X(BGM_CONTEST0, "CONTEST0") \
	X(BGM_MGM0, "MGM0") \
	X(BGM_T_BATTLE, "T-BATTLE") \
	X(BGM_OOAME, "OOAME") \
	X(BGM_HIDERI, "HIDERI") \
	X(BGM_RUNECITY, "RUNECITY") \
	X(BGM_CON_K, "CON-K") \
	X(BGM_EIKOU_R, "EIKOU-R") \
	X(BGM_KARAKURI, "KARAKURI") \
	X(BGM_HUTAGO, "HUTAGO") \
	X(BGM_SITENNOU, "SITENNOU") \
	X(BGM_YAMA_EYE, "YAMA-EYE") \
	X(BGM_CONLOBBY, "CONLOBBY") \
	X(BGM_INTER_V, "INTER-V") \
	X(BGM_DAIGO, "DAIGO") \
	X(BGM_THANKFOR, "THANKFOR") \
	X(BGM_END, "END") \
	X(BGM_BATTLE27, "BATTLE27") \
	X(BGM_BATTLE31, "BATTLE31") \
	X(BGM_BATTLE20, "BATTLE20") \
	X(BGM_BATTLE32, "BATTLE32") \
	X(BGM_BATTLE33, "BATTLE33") \
	X(BGM_BATTLE36, "BATTLE36") \
	X(BGM_BATTLE34, "BATTLE34") \
	X(BGM_BATTLE35, "BATTLE35") \
	X(BGM_BATTLE38, "BATTLE38") \
	X(BGM_BATTLE30, "BATTLE30")

#define SOUND_LIST_SE \
	X(SE_STOP, "STOP") \
	X(SE_KAIFUKU, "KAIFUKU") \
	X(SE_PC_LOGON, "PC-LOGON") \
	X(SE_PC_OFF, "PC-OFF") \
	X(SE_PC_ON, "PC-ON") \
	X(SE_SELECT, "SELECT") \
	X(SE_WIN_OPEN, "WIN-OPEN") \
	X(SE_WALL_HIT, "WALL-HIT") \
	X(SE_DOOR, "DOOR") \
	X(SE_KAIDAN, "KAIDAN") \
	X(SE_DANSA, "DANSA") \
	X(SE_JITENSYA, "JITENSYA") \
	X(SE_KOUKA_L, "KOUKA-L") \
	X(SE_KOUKA_M, "KOUKA-M") \
	X(SE_KOUKA_H, "KOUKA-H") \
	X(SE_BOWA2, "BOWA2") \
	X(SE_POKE_DEAD, "POKE-DEAD") \
	X(SE_NIGERU, "NIGERU") \
	X(SE_JIDO_DOA, "JIDO-DOA") \
	X(SE_NAMINORI, "NAMINORI") \
	X(SE_BAN, "BAN") \
	X(SE_PIN, "PIN") \
	X(SE_BOO, "BOO") \
	X(SE_BOWA, "BOWA") \
	X(SE_JYUNI, "JYUNI") \
	X(SE_A, "A") \
	X(SE_I, "I") \
	X(SE_U, "U") \
	X(SE_E, "E") \
	X(SE_O, "O") \
	X(SE_N, "N") \
	X(SE_SEIKAI, "SEIKAI") \
	X(SE_HAZURE, "HAZURE") \
	X(SE_EXP, "EXP") \
	X(SE_JITE_PYOKO, "JITE-PYOKO") \
	X(SE_MU_PACHI, "MU-PACHI") \
	X(SE_TK_KASYA, "TK-KASYA") \
	X(SE_FU_ZAKU, "FU-ZAKU") \
	X(SE_FU_ZAKU2, "FU-ZAKU2") \
	X(SE_FU_ZUZUZU, "FU-ZUZUZU") \
	X(SE_RU_GASHIN, "RU-GASHIN") \
	X(SE_RU_GASYAN, "RU-GASYAN") \
	X(SE_RU_BARI, "RU-BARI") \
	X(SE_RU_HYUU, "RU-HYUU") \
	X(SE_KI_GASYAN, "KI-GASYAN") \
	X(SE_TK_WARPIN, "TK-WARPIN") \
	X(SE_TK_WARPOUT, "TK-WARPOUT") \
	X(SE_TU_SAA, "TU-SAA") \
	X(SE_HI_TURUN, "HI-TURUN") \
	X(SE_TRACK_MOVE, "TRACK-MOVE") \
	X(SE_TRACK_STOP, "TRACK-STOP") \
	X(SE_TRACK_HAIK, "TRACK-HAIK") \
	X(SE_TRACK_DOOR, "TRACK-DOOR") \
	X(SE_MOTER, "MOTER") \
	X(SE_CARD, "CARD") \
	X(SE_SAVE, "SAVE") \
	X(SE_KON, "KON") \
	X(SE_KON2, "KON2") \
	X(SE_KON3, "KON3") \
	X(SE_KON4, "KON4") \
	X(SE_SUIKOMU, "SUIKOMU") \
	X(SE_NAGERU, "NAGERU") \
	X(SE_TOY_C, "TOY-C") \
	X(SE_TOY_D, "TOY-D") \
	X(SE_TOY_E, "TOY-E") \
	X(SE_TOY_F, "TOY-F") \
	X(SE_TOY_G, "TOY-G") \
	X(SE_TOY_A, "TOY-A") \
	X(SE_TOY_B, "TOY-B") \
	X(SE_TOY_C1, "TOY-C1") \
	X(SE_MIZU, "MIZU") \
	X(SE_HASHI, "HASHI") \
	X(SE_DAUGI, "DAUGI") \
	X(SE_PINPON, "PINPON") \
	X(SE_FUUSEN1, "FUUSEN1") \
	X(SE_FUUSEN2, "FUUSEN2") \
	X(SE_FUUSEN3, "FUUSEN3") \
	X(SE_TOY_KABE, "TOY-KABE") \
	X(SE_TOY_DANGO, "TOY-DANGO") \
	X(SE_DOKU, "DOKU") \
	X(SE_ESUKA, "ESUKA") \
	X(SE_T_AME, "T-AME") \
	X(SE_T_AME_E, "T-AME-E") \
	X(SE_T_OOAME, "T-OOAME") \
	X(SE_T_OOAME_E, "T-OOAME-E") \
	X(SE_T_KOAME, "T-KOAME") \
	X(SE_T_KOAME_E, "T-KOAME-E") \
	X(SE_T_KAMI, "T-KAMI") \
	X(SE_T_KAMI2, "T-KAMI2") \
	X(SE_ELEBETA, "ELEBETA") \
	X(SE_HINSI, "HINSI") \
	X(SE_EXPMAX, "EXPMAX") \
	X(SE_TAMAKORO, "TAMAKORO") \
	X(SE_TAMAKORO_E, "TAMAKORO-E") \
	X(SE_BASABASA, "BASABASA") \
	X(SE_REGI, "REGI") \
	X(SE_C_GAJI, "C-GAJI") \
	X(SE_C_MAKU_U, "C-MAKU-U") \
	X(SE_C_MAKU_D, "C-MAKU-D") \
	X(SE_C_PASI, "C-PASI") \
	X(SE_C_SYU, "C-SYU") \
	X(SE_C_PIKON, "C-PIKON") \
	X(SE_REAPOKE, "REAPOKE") \
	X(SE_OP_BASYU, "OP-BASYU") \
	X(SE_BT_START, "BT-START") \
	X(SE_DENDOU, "DENDOU") \
	X(SE_JIHANKI, "JIHANKI") \
	X(SE_TAMA, "TAMA") \
	X(SE_Z_SCROLL, "Z-SCROLL") \
	X(SE_Z_PAGE, "Z-PAGE") \
	X(SE_PN_ON, "PN-ON") \
	X(SE_PN_OFF, "PN-OFF") \
	X(SE_Z_SEARCH, "Z-SEARCH") \
	X(SE_TAMAGO, "TAMAGO") \
	X(SE_TB_START, "TB-START") \
	X(SE_TB_KON, "TB-KON") \
	X(SE_TB_KARA, "TB-KARA") \
	X(SE_BIDORO, "BIDORO") \
	X(SE_W085, "W085") \
	X(SE_W085B, "W085B") \
	X(SE_W231, "W231") \
	X(SE_W171, "W171") \
	X(SE_W233, "W233") \
	X(SE_W233B, "W233B") \
	X(SE_W145, "W145") \
	X(SE_W145B, "W145B") \
	X(SE_W145C, "W145C") \
	X(SE_W240, "W240") \
	X(SE_W015, "W015") \
	X(SE_W081, "W081") \
	X(SE_W081B, "W081B") \
	X(SE_W088, "W088") \
	X(SE_W016, "W016") \
	X(SE_W016B, "W016B") \
	X(SE_W003, "W003") \
	X(SE_W104, "W104") \
	X(SE_W013, "W013") \
	X(SE_W196, "W196") \
	X(SE_W086, "W086") \
	X(SE_W004, "W004") \
	X(SE_W025, "W025") \
	X(SE_W025B, "W025B") \
	X(SE_W152, "W152") \
	X(SE_W026, "W026") \
	X(SE_W172, "W172") \
	X(SE_W172B, "W172B") \
	X(SE_W053, "W053") \
	X(SE_W007, "W007") \
	X(SE_W092, "W092") \
	X(SE_W221, "W221") \
	X(SE_W221B, "W221B") \
	X(SE_W052, "W052") \
	X(SE_W036, "W036") \
	X(SE_W059, "W059") \
	X(SE_W059B, "W059B") \
	X(SE_W010, "W010") \
	X(SE_W011, "W011") \
	X(SE_W017, "W017") \
	X(SE_W019, "W019") \
	X(SE_W028, "W028") \
	X(SE_W013B, "W013B") \
	X(SE_W044, "W044") \
	X(SE_W029, "W029") \
	X(SE_W057, "W057") \
	X(SE_W056, "W056") \
	X(SE_W250, "W250") \
	X(SE_W030, "W030") \
	X(SE_W039, "W039") \
	X(SE_W054, "W054") \
	X(SE_W077, "W077") \
	X(SE_W020, "W020") \
	X(SE_W082, "W082") \
	X(SE_W047, "W047") \
	X(SE_W195, "W195") \
	X(SE_W006, "W006") \
	X(SE_W091, "W091") \
	X(SE_W146, "W146") \
	X(SE_W120, "W120") \
	X(SE_W153, "W153") \
	X(SE_W071B, "W071B") \
	X(SE_W071, "W071") \
	X(SE_W103, "W103") \
	X(SE_W062, "W062") \
	X(SE_W062B, "W062B") \
	X(SE_W048, "W048") \
	X(SE_W187, "W187") \
	X(SE_W118, "W118") \
	X(SE_W155, "W155") \
	X(SE_W122, "W122") \
	X(SE_W060, "W060") \
	X(SE_W185, "W185") \
	X(SE_W014, "W014") \
	X(SE_W043, "W043") \
	X(SE_W207, "W207") \
	X(SE_W207B, "W207B") \
	X(SE_W215, "W215") \
	X(SE_W109, "W109") \
	X(SE_W173, "W173") \
	X(SE_W280, "W280") \
	X(SE_W202, "W202") \
	X(SE_W060B, "W060B") \
	X(SE_W076, "W076") \
	X(SE_W080, "W080") \
	X(SE_W100, "W100") \
	X(SE_W107, "W107") \
	X(SE_W166, "W166") \
	X(SE_W129, "W129") \
	X(SE_W115, "W115") \
	X(SE_W112, "W112") \
	X(SE_W197, "W197") \
	X(SE_W199, "W199") \
	X(SE_W236, "W236") \
	X(SE_W204, "W204") \
	X(SE_W268, "W268") \
	X(SE_W070, "W070") \
	X(SE_W063, "W063") \
	X(SE_W127, "W127") \
	X(SE_W179, "W179") \
	X(SE_W151, "W151") \
	X(SE_W201, "W201") \
	X(SE_W161, "W161") \
	X(SE_W161B, "W161B") \
	X(SE_W227, "W227") \
	X(SE_W227B, "W227B") \
	X(SE_W226, "W226") \
	X(SE_W208, "W208") \
	X(SE_W213, "W213") \
	X(SE_W213B, "W213B") \
	X(SE_W234, "W234") \
	X(SE_W260, "W260") \
	X(SE_W328, "W328") \
	X(SE_W320, "W320") \
	X(SE_W255, "W255") \
	X(SE_W291, "W291") \
	X(SE_W089, "W089") \
	X(SE_W239, "W239") \
	X(SE_W230, "W230") \
	X(SE_W281, "W281") \
	X(SE_W327, "W327") \
	X(SE_W287, "W287") \
	X(SE_W257, "W257") \
	X(SE_W253, "W253") \
	X(SE_W258, "W258") \
	X(SE_W322, "W322") \
	X(SE_W298, "W298") \
	X(SE_W287B, "W287B") \
	X(SE_W114, "W114") \
	X(SE_W063B, "W063B")

// Create BGM list
#define X(songId, name) static const u8 sBGMName_##songId[] = _(name);
SOUND_LIST_BGM
#undef X

#define X(songId, name) sBGMName_##songId,
static const u8 *const gBGMNames[] =
{
SOUND_LIST_BGM
};
#undef X

// Create SE list
#define X(songId, name) static const u8 sSEName_##songId[] = _(name);
SOUND_LIST_SE
#undef X

#define X(songId, name) sSEName_##songId,
static const u8 *const gSENames[] =
{
SOUND_LIST_SE
};
#undef X

void sub_80BB25C(u8 taskId)
{
    struct CryRelatedStruct cryStruct, cryStruct2;
    u8 zero;

    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    gUnknown_03005D34 = 1;
    ResetSpriteData();
    FreeAllSpritePalettes();

    cryStruct.unk0 = 0x2000;
    cryStruct.unk2 = 29;
    cryStruct.paletteNo = 12;
    cryStruct.yPos = 30;
    cryStruct.xPos = 4;

    zero = 0; // wtf?
    gUnknown_03005E98 = 0;

    while (sub_8119E3C(&cryStruct, 3) == FALSE);

    cryStruct2.unk0 = 0;
    cryStruct2.unk2 = 15;
    cryStruct2.paletteNo = 13;
    cryStruct2.xPos = 12;
    cryStruct2.yPos = 12;

    zero = 0; // wtf?
    gUnknown_03005E98 = 0;

    while (ShowPokedexCryScreen(&cryStruct2, 2) == FALSE);

    MenuDrawTextWindow(0, 16, 5, 19);
    sub_80BB494();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG2CNT = 0xF01;
    REG_BG3CNT = 0x1D03;
    REG_DISPCNT = 0x1d40;
    m4aMPlayFadeOutTemporarily(&gMPlay_BGM, 2);
    gTasks[taskId].FUNC = sub_80BB3B4;
}

void sub_80BB3B4(u8 taskId)
{
    sub_8119F88(3);

    if (gMain.newKeys & A_BUTTON)
    {
        sub_811A050(gUnknown_03005D34);
    }
    if (gMain.newKeys & R_BUTTON)
    {
        StopCryAndClearCrySongs();
    }
    if (gMain.newAndRepeatedKeys & DPAD_UP)
    {
        if(--gUnknown_03005D34 == 0)
            gUnknown_03005D34 = 384; // total species
        sub_80BB494();
    }
    if (gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        if(++gUnknown_03005D34 > 384)
            gUnknown_03005D34 = 1;
        sub_80BB494();
    }
    if (gMain.newKeys & B_BUTTON)
    {
        REG_DISPCNT = 0x7140;
        REG_WIN0H = WIN_RANGE(17, 223);
        REG_WIN0V = WIN_RANGE(1, 31);
        MenuZeroFillWindowRect(0, 0, 0x1D, 0x13);
        gTasks[taskId].FUNC = sub_80BA258;
        DestroyCryMeterNeedleSprite();
    }
}

void sub_80BB494(void)
{
    sub_80BAE78(gUnknown_03005D34, 1, 17, 3);
}
