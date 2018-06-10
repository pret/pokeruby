#include "global.h"
#include "mystery_event_menu.h"
#include "link.h"
#include "main.h"
#include "menu.h"
#include "mystery_event_script.h"
#include "palette.h"
#include "save.h"
#include "constants/songs.h"
#include "sound.h"
#include "sprite.h"
#include "string_util.h"
#include "strings2.h"
#include "task.h"
#include "text.h"
#include "title_screen.h"
#include "ewram.h"
#include "debug.h"

static EWRAM_DATA u8 gUnknown_02039338 = 0;

static void VBlankCB(void);
static bool8 CheckLanguageMatch(void);
static bool8 GetEventLoadMessage(u8 *dest, u32 status);
static void CB2_MysteryEventMenu(void);

static void VBlankCB(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
}

static bool8 CheckLanguageMatch(void)
{
    bool8 val = FALSE;

    if (gLinkPlayers[0].language == gLinkPlayers[1].language)
        val = TRUE;

    return val;
}

void CB2_InitMysteryEventMenu(void)
{
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    SetVBlankCallback(VBlankCB);
    Text_LoadWindowTemplate(&gMenuTextWindowTemplate);
    InitMenuWindow(&gMenuTextWindowTemplate);
    Menu_EraseScreen();
    REG_DISPCNT = DISPCNT_MODE_0 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON;
    REG_BLDCNT = 0;
    CreateTask(Task_DestroySelf, 0);
    StopMapMusic();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    FillPalette(0, 0, 2);
    SetMainCallback2(CB2_MysteryEventMenu);
}

static bool8 GetEventLoadMessage(u8 *dest, u32 status)
{
    bool8 retVal = 1;

    if (status == 0)
    {
        StringCopy(dest, gSystemText_EventLoadSuccess);
        retVal = 0;
    }

    if (status == 2)
        retVal = 0;

    if (status == 1)
        StringCopy(dest, gSystemText_LoadingError);

    return retVal;
}

static void CB2_MysteryEventMenu(void)
{
    u16 unkVal;

    switch (gMain.state)
    {
    case 0:
        Menu_DrawStdWindowFrame(0, 14, 29, 19);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        gMain.state++;
        break;
    case 1:
        if (gPaletteFade.active)
            break;
        MenuPrintMessageDefaultCoords(gSystemText_LinkStandby);
        gMain.state++;
        break;
    case 2:
        if (Menu_UpdateWindowText())
        {
            gMain.state++;
            gLinkType = 21761;
            OpenLink();
        }
        break;
    case 3:
        if ((gLinkStatus & 0x20) && (gLinkStatus & 0x1C) > 4)
        {
            PlaySE(SE_PIN);
            MenuPrintMessageDefaultCoords(gSystemText_LoadEventPressA);
            gMain.state++;
        }
        if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            CloseLink();
            gMain.state = 15;
        }
        break;
    case 4:
        if (Menu_UpdateWindowText())
            gMain.state++;
        break;
#ifdef NONMATCHING
    case 5:
        if (GetLinkPlayerCount_2() != 2)
        {
            GetEventLoadMessage(gStringVar4, 1);
            MenuPrintMessageDefaultCoords(gStringVar4);
            gMain.state = 13;
            break;
        }
        if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            sub_8007F4C();
            Menu_DrawStdWindowFrame(6, 5, 23, 8);
            Menu_PrintText(gSystemText_LoadingEvent, 7, 6);
            gMain.state++;
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            CloseLink();
            gMain.state = 15;
        }
        break;
    case 6:
        if (IsLinkConnectionEstablished())
        {
            if (!gReceivedRemoteLinkPlayers)
                break;

            if (GetLinkPlayerDataExchangeStatusTimed() == 3)
            {
                sub_800832C();
                Menu_EraseWindowRect(6, 5, 23, 8);
                GetEventLoadMessage(gStringVar4, 1);
                MenuPrintMessageDefaultCoords(gStringVar4);
                gMain.state = 13;
                break;
            }
            else if (CheckLanguageMatch())
            {
                MenuPrintMessageDefaultCoords(gSystemText_DontCutLink);
                gMain.state++;
                break;
            }
            else
            {
                CloseLink();
                Menu_EraseWindowRect(6, 5, 23, 8);
                GetEventLoadMessage(gStringVar4, 1);
                MenuPrintMessageDefaultCoords(gStringVar4);
                gMain.state = 13;
                break;
            }
        }
        if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            CloseLink();
            gMain.state = 15;
            break;
        }
        break;
#else
    case 5:
        if (GetLinkPlayerCount_2() != 2)
        {
            goto label;
        }
        if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            sub_8007F4C();
            Menu_DrawStdWindowFrame(6, 5, 23, 8);
            Menu_PrintText(gSystemText_LoadingEvent, 7, 6);
            gMain.state++;
        }
        else if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            CloseLink();
            gMain.state = 15;
        }
        break;
    case 6:
        if (IsLinkConnectionEstablished())
        {
            register u8 *ptr asm("r0");
            register u32 offset1 asm("r2");
            register u32 offset2 asm("r1");

            if (!gReceivedRemoteLinkPlayers)
                break;

            if (GetLinkPlayerDataExchangeStatusTimed() == 3)
            {
                sub_800832C();
                Menu_EraseWindowRect(6, 5, 23, 8);
                GetEventLoadMessage(gStringVar4, 1);
                MenuPrintMessageDefaultCoords(gStringVar4);
                ptr = (u8 *)&gMain;
                offset1 = offsetof(struct Main, state);
                asm("" ::: "r1");
                ptr += offset1;
                *ptr = 13;
            }
            else if (CheckLanguageMatch())
            {
                register u8 *ptr2 asm("r1");
                register int offset3 asm("r0");
                register int dummy asm("r2");
                MenuPrintMessageDefaultCoords(gSystemText_DontCutLink);
                ptr2 = (u8 *)&gMain;
                offset3 = offsetof(struct Main, state);
                if (dummy)
                    dummy++;
                ptr2 += offset3;
                (*ptr2)++;
                break;
            }
            else
            {
                CloseLink();
                Menu_EraseWindowRect(6, 5, 23, 8);
            label:
                GetEventLoadMessage(gStringVar4, 1);
                MenuPrintMessageDefaultCoords(gStringVar4);
                ptr = (u8 *)&gMain;
                offset2 = offsetof(struct Main, state);
                ptr += offset2;
                *ptr = 13;
            }
            break;
        }
        if (gMain.newKeys & B_BUTTON)
        {
            PlaySE(SE_SELECT);
            CloseLink();
            gMain.state = 15;
            break;
        }
        break;
#endif
    case 7:
        if (Menu_UpdateWindowText())
            gMain.state++;
        break;
    case 8:
        if (GetBlockReceivedStatus())
        {
            ResetBlockReceivedFlags();
            gMain.state++;
        }
        break;
    case 9:
        gMain.state++;
        break;
    case 10:
        sub_800832C();
        gMain.state++;
        break;
    case 11:
        if (gReceivedRemoteLinkPlayers)
            break;
        unkVal = RunMysteryEventScript(gSharedMem);
        CpuFill32(0, gSharedMem, 0x7D4);
        if (!GetEventLoadMessage(gStringVar4, unkVal))
            Save_WriteData(SAVE_NORMAL);
        gMain.state++;
        break;
    case 12:
        MenuPrintMessageDefaultCoords(gStringVar4);
        gMain.state++;
        break;
    case 13:
        Menu_EraseWindowRect(6, 5, 23, 8);
        if (Menu_UpdateWindowText())
        {
            gMain.state++;
            gUnknown_02039338 = 0;
        }
        break;
    case 14:
        if (gMain.newKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            gMain.state++;
        }
        break;
    case 15:
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
        gMain.state++;
        break;
    case 16:
        if (!gPaletteFade.active)
            DoSoftReset();
        break;
    }

    if (gLinkStatus & 0x40)
    {
        if (!IsLinkMaster())
        {
            CloseLink();
            Menu_EraseWindowRect(6, 5, 23, 8);
            GetEventLoadMessage(gStringVar4, 1);
            MenuPrintMessageDefaultCoords(gStringVar4);
            gMain.state = 13;
        }
    }

    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

#if DEBUG

static const u8 Str_843DA70[] = _("CARDーE　emulation。。。");
static const u8 Str_843DA84[] = _("LR:　select　A:　send。");
static const u8 Str_843DA98[] = _("sending。。。");
static const u8 Str_843DAA3[] = _("completed。");


void debug_sub_815D1D8();

void debug_sub_815D04C(u8 taskId)
{
    if (gTasks[taskId].data[0] == 0)
    {
        Menu_DrawStdWindowFrame(4, 4, 13, 7);
        Menu_PrintText(gUnknown_Debug_842E2D0[gTasks[taskId].data[1]].text, 5, 5);
        gTasks[taskId].data[0]++;
    }

    if (gMain.newKeys & 0x20)
    {
        if (gTasks[taskId].data[1] == 0)
            gTasks[taskId].data[1] = gUnknown_Debug_842E350 - 1;
        else
            gTasks[taskId].data[1]--;
        gTasks[taskId].data[0] = 0;
    }
    if (gMain.newKeys & 0x10)
    {
        if (gTasks[taskId].data[1] == gUnknown_Debug_842E350 - 1)
            gTasks[taskId].data[1] = 0;
        else
            gTasks[taskId].data[1]++;
        gTasks[taskId].data[0] = 0;
    }
    if (gMain.newKeys & A_BUTTON)
    {
        // TODO: fix this
        s32 var = gTasks[taskId].data[1];
        asm(""::"r"(var * 8));
        gUnknown_Debug_842E2D0[var].func(gSharedMem + 0x4000);

        gMain.state++;
        DestroyTask(taskId);
    }
}

void debug_sub_815D15C(void)
{
    ResetSpriteData();
    FreeAllSpritePalettes();
    ResetTasks();
    SetVBlankCallback(VBlankCB);
    Text_LoadWindowTemplate(&gMenuTextWindowTemplate);
    InitMenuWindow(&gMenuTextWindowTemplate);
    Menu_EraseScreen();
    REG_DISPCNT = DISPCNT_BG0_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_0;
    REG_BLDCNT = 0;

    CreateTask(Task_DestroySelf, 0);
    StopMapMusic();
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
    FillPalette(0, 0, 2);
    SetMainCallback2(debug_sub_815D1D8);
}

void debug_sub_815D1D8(void)
{
    switch (gMain.state)
    {
    case 0:
        Menu_DrawStdWindowFrame(3, 14, 27, 19);
        BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
        gMain.state++;
        break;
    case 1:
        if (!gPaletteFade.active)
        {
            if (gMain.heldKeys & 0x100)
                gUnknown_Debug_30030E0++;
            MenuPrintMessage(Str_843DA70, 4, 15);
            gMain.state++;
        }
        break;
    case 2:
        if (Menu_UpdateWindowText())
        {
            gMain.state++;
            gLinkType = 0x5501;
            OpenLink();
        }
        break;
    case 3:
        if (gReceivedRemoteLinkPlayers != 0)
        {
            gMain.state++;
            MenuPrintMessage(Str_843DA84, 4, 15);
        }
        break;
    case 4:
        if (Menu_UpdateWindowText())
        {
            CreateTask(debug_sub_815D04C, 10);
            gMain.state++;
        }
        break;
    case 6:
        MenuPrintMessage(Str_843DA98, 4, 15);
        SendBlock(0, gSharedMem + 0x4000, 0x2004);
        gMain.state++;
        break;
    case 7:
        Menu_UpdateWindowText();
        if (IsLinkTaskFinished())
            gMain.state++;
        break;
    case 8:
        sub_800832C();
        gMain.state++;
        break;
    case 9:
        if (gReceivedRemoteLinkPlayers == 0)
        {
            Menu_BlankWindowRect(4, 15, 26, 18);
            Menu_PrintText(Str_843DAA3, 4, 15);
            gMain.state++;
        }
        break;
    case 10:
        if (gMain.newKeys & A_BUTTON)
        {
            BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
            gMain.state++;
        }
        break;
    case 11:
        if (!gPaletteFade.active)
            SetMainCallback2(CB2_InitTitleScreen);
        break;
    }
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

#endif
