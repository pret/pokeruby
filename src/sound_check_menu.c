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

// local task defines
#define WINDOW_SELECTED data[0]
#define BGM_INDEX data[1]
#define SE_INDEX data[2]
#define UNK_DATA3 data[3]

// window selections
enum
{
    BGM_WINDOW,
    SE_WINDOW
};

extern void sub_80BA6B8(u8);
extern void sub_80BA800(u8);
extern void sub_80BAF84(u8);
extern void sub_80BB25C(u8);
extern void sub_80BA68C(u8);
extern void sub_80BAD5C(void);
extern void sub_80BAE10(u8, u8);
extern void sub_80BAA48(u8);

struct Struct_20387B4
{
    u32 unk0;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    u32 unk10;
    u32 unk14;
    u32 unk18;
    u32 unk1C;
    u32 unk20;
};

extern struct Struct_20387B4 gUnknown_020387B4;

extern u8 gUnknown_020387B3;
extern u8 gUnknown_020387B1;
extern u8 gUnknown_020387B2;
extern u32 gUnknown_03005D30;
extern u8 gUnknown_020387D8;
extern u8 gUnknown_020387D9;
extern u8 gUnknown_020387B0;

extern u8 *gBGMNames[];
extern u8 *gSENames[];

extern u8 gDebugText_SoundCheckJap[];
extern u8 gDebugText_BGM[];
extern u8 gDebugText_SE[];
extern u8 gDebugText_ABDesc[];
extern u8 gDebugText_UpDown[];
extern u8 gDebugText_DriverTest[];
extern u8 gDebugText_BBack[];
extern u8 gDebugText_APlay[];
extern u8 gDebugText_Voice[];
extern u8 gDebugText_Volume[];
extern u8 gDebugText_Panpot[];
extern u8 gDebugText_Pitch[];
extern u8 gDebugText_Length[];
extern u8 gDebugText_Release[];
extern u8 gDebugText_Progress[];
extern u8 gDebugText_Chorus[];
extern u8 gDebugText_Priority[];
extern u8 gDebugText_Playing[];
extern u8 gDebugText_Reverse[];
extern u8 gDebugText_Stereo[];

void sub_80BA258(u8);
void sub_80BA384(u8);
void sub_80BA65C(u8);
void sub_80BA700(u16, u16, u16);
void sub_80BA79C(u8 *, u16, u16);

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

    if(gUnknown_020387B0 != 0)
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
    REG_WIN0H = 0;
    REG_WIN0V = 0;
    REG_WIN1H = 0;
    REG_WIN1V = 0;
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
    TASK.WINDOW_SELECTED = BGM_WINDOW;
    TASK.BGM_INDEX = 0;
    TASK.SE_INDEX = 0;
    TASK.UNK_DATA3 = 0;
    gUnknown_020387B0 = 0;
    TASK.UNK_DATA3 = 0; // why?
    m4aSoundInit();
}

// Task_InitSoundCheckMenu
void sub_80BA258(u8 taskId)
{
    u8 soundcheckStr[9];
    u8 bgmStr[4];
    u8 seStr[4];
    u8 abDescStr[13];
    u8 upDownStr[12];
    u8 driverStr[14];

    // these probably used size of the strings themselves, but they are not in the C file yet.
    memcpy(soundcheckStr, gDebugText_SoundCheckJap, sizeof soundcheckStr);
    memcpy(bgmStr, gDebugText_BGM, sizeof bgmStr);
    memcpy(seStr, gDebugText_SE, sizeof seStr);
    memcpy(abDescStr, gDebugText_ABDesc, sizeof abDescStr);
    memcpy(upDownStr, gDebugText_UpDown, sizeof upDownStr);
    memcpy(driverStr, gDebugText_DriverTest, sizeof driverStr);

    if(!gPaletteFade.active)
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
        TASK.FUNC = sub_80BA384;
        REG_WIN0H = 0x11DF;
        REG_WIN0V = 0x11F; 
    }
}

void sub_80BA384(u8 taskId) // Task_HandleDrawingSoundCheckMenuText
{
    sub_80BA6B8(TASK.WINDOW_SELECTED);
    sub_80BA700(TASK.BGM_INDEX + BGM_STOP, 7, 8); // print by BGM index
    sub_80BA79C(gBGMNames[TASK.BGM_INDEX], 11, 8);
    sub_80BA700(TASK.SE_INDEX, 7, 15);
    sub_80BA79C(gSENames[TASK.SE_INDEX], 11, 15);
    TASK.FUNC = sub_80BA65C;
}

#ifdef NONMATCHING
bool8 sub_80BA400(u8 taskId) // Task_ProcessSoundCheckMenuInput
{
    if(gMain.newKeys & R_BUTTON) // driver test
    {
        gTasks[taskId].func = sub_80BA800;
        return FALSE;
    }
    if(gMain.newKeys & L_BUTTON)
    {
        gTasks[taskId].func = sub_80BAF84;
        return FALSE;
    }
    if(gMain.newKeys & START_BUTTON)
    {
        gTasks[taskId].func = sub_80BB25C;
        return FALSE;
    }
    if(gMain.newKeys & A_BUTTON) // both these cases insist on non reuses of certain data variables and cause the function to not match.
    {
        if(gTasks[taskId].data[0] != 0) // is playing?
        {
            if(gTasks[taskId].data[4] != 0)
            {
                if(gTasks[taskId].data[2] != 0) // why are you insiting on a non signed halfword?
                {
                    m4aSongNumStop(gTasks[taskId].data[4]);
                }
                else
                {
                    m4aSongNumStop(gTasks[taskId].data[2]);
                    gTasks[taskId].data[4] = gTasks[taskId].data[2];
                    return FALSE;
                }
            }
            else if(gTasks[taskId].data[2] == 0) // _080BA4BA
            {
                return FALSE;
            }
            // _080BA4C4
            m4aSongNumStart(gTasks[taskId].data[2]);
            gTasks[taskId].data[4] = gTasks[taskId].data[2];
            return FALSE;
        }
        else // _080BA4D0
        {
            if(gTasks[taskId].data[3] != 0)
            {
                if(gTasks[taskId].data[1] != 0)
                {
                    m4aSongNumStop(gTasks[taskId].data[3] + BGM_STOP);
                }
                else // _080BA500
                {
                    m4aSongNumStop(gTasks[taskId].data[3] + BGM_STOP);
                    gTasks[taskId].data[3] = gTasks[taskId].data[1];
                    return FALSE;
                }
            }
            else if(gTasks[taskId].data[1] == 0) // _080BA514
                return FALSE;

            m4aSongNumStart(gTasks[taskId].data[1] + BGM_STOP);
            gTasks[taskId].data[3] = gTasks[taskId].data[1];
        }
        return FALSE;
    }
    if(gMain.newKeys & B_BUTTON)
    {
        m4aSongNumStart(5);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
        gTasks[taskId].func = sub_80BA68C;
        return FALSE;
    }
    if(gMain.newAndRepeatedKeys & DPAD_UP)
    {
        gTasks[taskId].data[8] ^= A_BUTTON; // huh?
        return TRUE;
    }
    if(gMain.newAndRepeatedKeys & DPAD_DOWN)
    {
        gTasks[taskId].data[8] ^= A_BUTTON; // huh?
        return TRUE;
    }
    else
    {
    u16 keys = gMain.newAndRepeatedKeys & DPAD_RIGHT;
    if(keys)
    {
        if(gTasks[taskId].data[0] != 0)
        {
            if(gTasks[taskId].data[2] > 0)
            {
                gTasks[taskId].data[2]--;
            }
            else
            {
                gTasks[taskId].data[2] = 0xF7;
            }
        }
        else if(gTasks[taskId].data[1] > 0)
        {
            gTasks[taskId].data[1]--;
        }
        else
        {
            gTasks[taskId].data[1] = 0x75;
        }
        return TRUE;
    }
    if(gMain.newAndRepeatedKeys & DPAD_LEFT)
    {
        if(gTasks[taskId].data[0] != 0)
        {
            if(gTasks[taskId].data[2] < 0xF7)
            {
                gTasks[taskId].data[2]++;
            }
            else
            {
                gTasks[taskId].data[2] = keys; // ??
            }
        }
        else if(gTasks[taskId].data[1] < 0x75)
        {
            gTasks[taskId].data[1]++;
            return TRUE;
        }
        else
        {
            gTasks[taskId].data[1] = gTasks[taskId].data[2];
            return TRUE;
        }
        return TRUE;
    }
    if(gMain.heldKeys & SELECT_BUTTON)
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
    if(sub_80BA400(taskId) != FALSE)
        gTasks[taskId].func = sub_80BA384;
}

void sub_80BA68C(u8 taskId)
{
    if(!gPaletteFade.active)
    {
        DestroyTask(taskId);
        SetMainCallback2(CB2_InitTitleScreen);
    }
}

void sub_80BA6B8(u8 windowType)
{
    switch(windowType)
    {
        case BGM_WINDOW:
        default:
            REG_WIN1H = 0x11DF;
            REG_WIN1V = 0x2957;
            break;
        case SE_WINDOW:
            REG_WIN1H = 0x11DF;
            REG_WIN1V = 0x618F;
            break;
    }
}

void sub_80BA700(u16 soundIndex, u16 x, u16 y) // PrintSoundNumber ?
{
    u8 i;
    u8 str[5];
    bool8 someBool;
    u8 divisorValue;

    for(i = 0; i < 3; i++)
        str[i] = 0; // initialize array

    str[3] = 0xB0;
    str[4] = 0xFF;
    someBool = FALSE;

    divisorValue = soundIndex / 100;
    if(divisorValue)
    {
        str[0] = divisorValue + 0xA1;
        someBool = TRUE;
    }

    divisorValue = (soundIndex % 100) / 10;
    if(divisorValue || someBool != FALSE)
        str[1] = divisorValue + 0xA1;

    str[2] = ((soundIndex % 100) % 10) + 0xA1;
    MenuPrint(str, x, y);
}

void sub_80BA79C(u8 *string, u16 x, u16 y)
{
    u8 i;
    u8 str[11];

    for(i = 0; i < 11; i++)
        str[i] = 0; // format string.

    str[10] = 0xFF; // the above for loop formats the last element of the array unnecessarily.

    for(i = 0; string[i] != 0xFF && i < 10; i++)
        str[i] = string[i];

    MenuPrint(str, x, y);
}

void sub_80BA800(u8 taskId)
{
    u8 bbackStr[10];
    u8 aplayStr[11];
    u8 voiceStr[10];
    u8 volumeStr[10];
    u8 panpotStr[10];
    u8 pitchStr[10];
    u8 lengthStr[10];
    u8 releaseStr[10];
    u8 progressStr[10];
    u8 chorusStr[10];
    u8 priorityStr[10];
    u8 playingStr[9];
    u8 reverseStr[9];
    u8 stereoStr[9];

    memcpy(bbackStr, gDebugText_BBack, sizeof bbackStr);
    memcpy(aplayStr, gDebugText_APlay, sizeof aplayStr);
    memcpy(voiceStr, gDebugText_Voice, sizeof voiceStr);
    memcpy(volumeStr, gDebugText_Volume, sizeof volumeStr);
    memcpy(panpotStr, gDebugText_Panpot, sizeof panpotStr);
    memcpy(pitchStr, gDebugText_Pitch, sizeof pitchStr);
    memcpy(lengthStr, gDebugText_Length, sizeof lengthStr);
    memcpy(releaseStr, gDebugText_Release, sizeof releaseStr);
    memcpy(progressStr, gDebugText_Progress, sizeof progressStr);
    memcpy(chorusStr, gDebugText_Chorus, sizeof chorusStr);
    memcpy(priorityStr, gDebugText_Priority, sizeof priorityStr);
    memcpy(playingStr, gDebugText_Playing, sizeof playingStr);
    memcpy(reverseStr, gDebugText_Reverse, sizeof reverseStr);
    memcpy(stereoStr, gDebugText_Stereo, sizeof stereoStr);

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
    REG_WIN0H = 0xF0;
    REG_WIN0V = 0xA0;
    gUnknown_020387B3 = 0;
    gUnknown_020387B1 = 0;
    gUnknown_020387B2 = 0;
    gUnknown_03005D30 = 0;
    gUnknown_020387D8 = 0;
    gUnknown_020387D9 = 1;
    gUnknown_020387B4.unk0 = 0;
    gUnknown_020387B4.unk4 = 0x78;
    gUnknown_020387B4.unk8 = 0;
    gUnknown_020387B4.unkC = 0x3C00;
    gUnknown_020387B4.unk10 = 0xB4;
    gUnknown_020387B4.unk18 = 0;
    gUnknown_020387B4.unk14 = 0;
    gUnknown_020387B4.unk1C = 0;
    gUnknown_020387B4.unk20 = 2;
    sub_80BAD5C();
    sub_80BAE10(0, 0);
    gTasks[taskId].func = sub_80BAA48;
}
