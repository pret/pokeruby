#include "global.h"
#include "battle.h"
#include "battle_records.h"
#include "cable_club.h"
#include "event_data.h"
#include "field_message_box.h"
#include "field_specials.h"
#include "field_weather.h"
#include "link.h"
#include "load_save.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "record_mixing.h"
#include "overworld.h"
#include "script.h"
#include "script_pokemon_80C4.h"
#include "constants/songs.h"
#include "sound.h"
#include "start_menu.h"
#include "string_util.h"
#include "strings2.h"
#include "task.h"
#include "text.h"
#include "trade.h"
#include "trainer_card.h"

extern u16 gBattleTypeFlags;
extern const u8 gUnknown_081A4932[];
extern const u8 gUnknown_081A4975[];
extern const u8 gUnknown_081A49B6[];
extern const u8 gUnknown_081A490C[];
extern struct
{
    u8 field0;
    u8 field1;
} gUnknown_020297D8;

static void sub_8082F20(u8 taskId);
static void sub_8082F68(u8 taskId);
static void sub_8082FEC(u8 taskId);
static void sub_808303C(u8 taskId);
static void sub_80830E4(u8 taskId);
static void sub_8083188(u8 taskId);
static void sub_80831F8(u8 taskId);
static void sub_8083288(u8 taskId);
static void sub_8083314(u8 taskId);
static void sub_80833C4(u8 taskId);
static void sub_80833EC(u8 taskId);
static void sub_8083418(u8 taskId);
static bool8 sub_8083444(u8 taskId);
static void sub_808353C(u8 taskId);
static void sub_8083710(u8 taskId);
static void sub_8083760(u8 taskId);
static void sub_80837B4(u8 taskId);
static void sub_80837EC(u8 taskId);
static void sub_808382C(u8 taskId);
static void sub_8083958(void);
static void sub_80839DC(u8 taskId);
static void sub_8083AAC(u8 taskId);
static void sub_8083B44(u8 taskId);
static void sub_8083B6C(void);
static void sub_8083CA4(u8 taskId);
#if DEBUG
static u8 debug_sub_808B850(void);
#endif

#ifdef GERMAN
const u8 TrainerCardColorName_Bronze[] = _("BRONZE");
const u8 TrainerCardColorName_Copper[] = _("KUPFER");
const u8 TrainerCardColorName_Silver[] = _("SILBER");
const u8 TrainerCardColorName_Gold[] = _("GOLD");
#else
const u8 TrainerCardColorName_Bronze[] = _("BRONZE");
const u8 TrainerCardColorName_Copper[] = _("COPPER");
const u8 TrainerCardColorName_Silver[] = _("SILVER");
const u8 TrainerCardColorName_Gold[] = _("GOLD");
#endif

const u8 *const gTrainerCardColorNames[] =
{
    TrainerCardColorName_Bronze,
    TrainerCardColorName_Copper,
    TrainerCardColorName_Silver,
    TrainerCardColorName_Gold,
};

#if DEBUG
u8 debug_sub_808A4D0(TaskFunc func)
{
    if (func == sub_8082F68)
        return 1;
    if (func == sub_8082FEC)
        return 17;
    if (func == sub_808303C)
        return 18;
    if (func == sub_8083188)
        return 19;
    if (func == sub_80830E4)
        return 20;
    if (func == sub_80831F8)
        return 33;
    if (func == sub_8083314)
        return 2;
    if (func == sub_80833C4)
        return 3;
    return 0;
}

void debug_sub_808A55C(u8 taskId)
{
    s32 i;
    
    if (!gTasks[gTasks[taskId].data[0]].isActive)
    {
        if (gTasks[taskId].data[1] == 5)
            DestroyTask(taskId);
        gTasks[taskId].data[1]++;
    }

    PrintHex(gShouldAdvanceLinkState, 2, 0, 2);
    PrintHex((u8)gBlockSendBuffer[0], 22, 5, 4);
    for (i = 0; i < 4; i++)
    {
        PrintHex(gLinkPlayerPending[i], 5 + i * 2, 0, 1);
        PrintHex(gBlockRecvBuffer[i][0], 22, 6 + i, 4);
    }
    PrintHex(gLinkStatus, 15, 0, 8);
    PrintHex(gLink.state, 2, 10, 2);
    PrintHex(GetMultiplayerId(), 7, 12, 2);
    PrintHex(GetBlockReceivedStatus(), 7, 10, 2);
    PrintHex(gReceivedRemoteLinkPlayers, 2, 12, 1);
    PrintHex(gSpecialVar_Result, 11, 8, 2);
    PrintHex((gLinkStatus & 0x1C) >> 2, 11, 10, 2);
    PrintHex(IsLinkConnectionEstablished(), 11, 12, 1);
    PrintHex(IsLinkTaskFinished(), 15, 10, 1);
    PrintHex(debug_sub_808A4D0(gTasks[gTasks[taskId].data[0]].func), 15, 12, 2);
    PrintHex((uintptr_t)gLinkCallback, 2, 13, 8);
    PrintHex(HasLinkErrorOccurred(), 2, 2, 1);
    for (i = 0; i < 4; i++)
        PrintHex(gLinkPlayers[i].linkType, 2 + i * 6, 3, 4);
    PrintHex(REG_SIOCNT, 2, 6, 4);
    PrintHex(debug_sub_808B850(), 25, 3, 1);
}
#endif

static void sub_8082CD4(u8 arg0, u8 arg1)
{
#if DEBUG
    InitLinkTestBG_Unused(12, 0, 31, 2);
#endif
    if (FindTaskIdByFunc(sub_8082F20) == 0xFF)
    {
        u8 taskId1;
#if DEBUG
        u8 taskId2;
#endif

        taskId1 = CreateTask(sub_8082F20, 80);
        gTasks[taskId1].data[1] = arg0;
        gTasks[taskId1].data[2] = arg1;

#if DEBUG
        taskId2 = CreateTask(debug_sub_808A55C, 80);
        gTasks[taskId2].data[0] = taskId1;
#endif
    }
}

static void sub_8082D18(u32 value)
{
    ConvertIntToDecimalStringN(gStringVar1, value, STR_CONV_MODE_LEFT_ALIGN, 1);
    Menu_DrawStdWindowFrame(18, 10, 28, 13);
    MenuPrint_Centered(gOtherText_PLink, 19, 11, 72);
}

static void sub_8082D4C()
{
    Menu_EraseWindowRect(18, 10, 28, 13);
}

static void sub_8082D60(u8 taskId, u8 arg1)
{
    s16 *data = &gTasks[taskId].data[3];

    if (arg1 != *data)
    {
        if (arg1 <= 1)
            sub_8082D4C();
        else
            sub_8082D18(arg1);
        *data = arg1;
    }
}

static u32 sub_8082D9C(u8 minPlayers, u8 maxPlayers)
{
    int playerCount;

    switch (GetLinkPlayerDataExchangeStatusTimed())
    {
    case EXCHANGE_COMPLETE:
        playerCount = GetLinkPlayerCount_2();
        if (minPlayers <= playerCount && playerCount <= maxPlayers)
            return 1;
        ConvertIntToDecimalStringN(gStringVar1, playerCount, STR_CONV_MODE_LEFT_ALIGN, 1);
        return 4;
    case EXCHANGE_TIMED_OUT:
        return 0;
    case EXCHANGE_IN_PROGRESS:
        return 3;
    default:
        return 0;
    }
}

static bool32 sub_8082DF4(u8 taskId)
{
    if (HasLinkErrorOccurred() == TRUE)
    {
        gTasks[taskId].func = sub_8083418;
        return TRUE;
    }
    return FALSE;
}

static bool32 sub_8082E28(u8 taskId)
{
    if ((gMain.newKeys & B_BUTTON)
     && IsLinkConnectionEstablished() == FALSE)
    {
        gTasks[taskId].func = sub_80833EC;
        return TRUE;
    }
    return FALSE;
}

static bool32 sub_8082E6C(u8 taskId)
{
    if (IsLinkConnectionEstablished())
        SetSuppressLinkErrorMessage(TRUE);

    if (gMain.newKeys & B_BUTTON)
    {
        gTasks[taskId].func = sub_80833EC;
        return TRUE;
    }
    return FALSE;
}

static bool32 sub_8082EB8(u8 taskId)
{
    if (GetSioMultiSI() == 1)
    {
        gTasks[taskId].func = sub_8083418;
        return TRUE;
    }
    return FALSE;
}

void unref_sub_8082EEC(u8 taskId)
{
    gTasks[taskId].data[0]++;
    if (gTasks[taskId].data[0] == 10)
    {
        sub_8007E9C(2);
        DestroyTask(taskId);
    }
}

static void sub_8082F20(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (data[0] == 0)
    {
        OpenLinkTimed();
        sub_80082EC();
        ResetLinkPlayers();
    }
    else if (data[0] > 9)
    {
        gTasks[taskId].func = sub_8082F68;
    }
    data[0]++;
}

static void sub_8082F68(u8 taskId)
{
    u32 playerCount = GetLinkPlayerCount_2();

    if (sub_8082E28(taskId) == TRUE
     || sub_8082E6C(taskId) == TRUE
     || playerCount < 2)
        return;

    SetSuppressLinkErrorMessage(TRUE);
    gTasks[taskId].data[3] = 0;
    if (IsLinkMaster() == TRUE)
    {
        PlaySE(SE_PIN);
        ShowFieldAutoScrollMessage(gUnknown_081A4932);
        gTasks[taskId].func = sub_8082FEC;
    }
    else
    {
        PlaySE(SE_BOO);
        ShowFieldAutoScrollMessage(gUnknown_081A49B6);
        gTasks[taskId].func = sub_80831F8;
    }
}

static void sub_8082FEC(u8 taskId)
{
    if (sub_8082E28(taskId) == TRUE
     || sub_8082EB8(taskId) == TRUE
     || sub_8082DF4(taskId) == TRUE)
        return;

    if (GetFieldMessageBoxMode() == FIELD_MESSAGE_BOX_HIDDEN)
    {
        gTasks[taskId].data[3] = 0;
        gTasks[taskId].func = sub_808303C;
    }
}

static void sub_808303C(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;
    s32 linkPlayerCount = GetLinkPlayerCount_2();

    if (sub_8082E28(taskId) == TRUE
     || sub_8082EB8(taskId) == TRUE
     || sub_8082DF4(taskId) == TRUE)
        return;

    sub_8082D60(taskId, linkPlayerCount);

    if (!(gMain.newKeys & A_BUTTON))
        return;

#if ENGLISH
    if (linkPlayerCount < taskData[1])
        return;

    sub_80081C8(linkPlayerCount);
    sub_8082D4C();
    ConvertIntToDecimalStringN(gStringVar1, linkPlayerCount, STR_CONV_MODE_LEFT_ALIGN, 1);
    ShowFieldAutoScrollMessage((u8 *)gUnknown_081A4975);
    gTasks[taskId].func = sub_80830E4;
#elif GERMAN
    if ((gLinkType == 0x2255 && (u32)linkPlayerCount > 1)
     || (gLinkType != 0x2255 && taskData[1] <= linkPlayerCount))
    {
        sub_80081C8(linkPlayerCount);
        sub_8082D4C();
        ConvertIntToDecimalStringN(gStringVar1, linkPlayerCount, STR_CONV_MODE_LEFT_ALIGN, 1);
        ShowFieldAutoScrollMessage((u8 *)gUnknown_081A4975);
        gTasks[taskId].func = sub_80830E4;
    }
#endif
}

static void sub_80830E4(u8 taskId)
{
    if (sub_8082E28(taskId) == TRUE
     || sub_8082EB8(taskId) == TRUE
     || sub_8082DF4(taskId) == TRUE)
        return;

    if (GetFieldMessageBoxMode() == FIELD_MESSAGE_BOX_HIDDEN)
    {
        if (sub_800820C() != GetLinkPlayerCount_2())
        {
            ShowFieldAutoScrollMessage(gUnknown_081A4932);
            gTasks[taskId].func = sub_8082FEC;
        }
        else if (gMain.heldKeys & B_BUTTON)
        {
            ShowFieldAutoScrollMessage(gUnknown_081A4932);
            gTasks[taskId].func = sub_8082FEC;
        }
        else if (gMain.heldKeys & A_BUTTON)
        {
            PlaySE(SE_SELECT);
            sub_8007F4C();
            gTasks[taskId].func = sub_8083188;
        }
    }
}

static void sub_8083188(u8 taskId)
{
    u8 local1 = gTasks[taskId].data[1];
    u8 local2 = gTasks[taskId].data[2];

    if (sub_8082DF4(taskId) == TRUE
     || sub_8083444(taskId) == TRUE)
        return;

    if (GetLinkPlayerCount_2() != sub_800820C())
    {
        gTasks[taskId].func = sub_8083418;
    }
    else
    {
        gSpecialVar_Result = sub_8082D9C(local1, local2);
        if (gSpecialVar_Result != 0)
            gTasks[taskId].func = sub_8083288;
    }
}

static void sub_80831F8(u8 taskId)
{
    u8 local1, local2;

    local1 = gTasks[taskId].data[1];
    local2 = gTasks[taskId].data[2];

    if (sub_8082E28(taskId) == TRUE
     || sub_8082DF4(taskId) == TRUE)
        return;

#if DEBUG
    sub_8082D60(taskId, GetLinkPlayerCount_2());
#endif

    gSpecialVar_Result = sub_8082D9C(local1, local2);
    if (gSpecialVar_Result == 0)
        return;
    if (gSpecialVar_Result == 3)
    {
        sub_800832C();
        HideFieldMessageBox();
        gTasks[taskId].func = sub_80833C4;
    }
    else
    {
        gFieldLinkPlayerCount = GetLinkPlayerCount_2();
        gUnknown_03004860 = GetMultiplayerId();
        sub_80081C8(gFieldLinkPlayerCount);
        TrainerCard_GenerateCardForPlayer((struct TrainerCard *)gBlockSendBuffer);
        gTasks[taskId].func = sub_8083314;
    }
}

static void sub_8083288(u8 taskId)
{
    if (sub_8082DF4(taskId) == TRUE)
        return;

    if (gSpecialVar_Result == 3)
    {
        sub_800832C();
        HideFieldMessageBox();
        gTasks[taskId].func = sub_80833C4;
    }
    else
    {
        gFieldLinkPlayerCount = GetLinkPlayerCount_2();
        gUnknown_03004860 = GetMultiplayerId();
        sub_80081C8(gFieldLinkPlayerCount);
        TrainerCard_GenerateCardForPlayer((struct TrainerCard *)gBlockSendBuffer);
        gTasks[taskId].func = sub_8083314;
        sub_8007E9C(2);
    }
}

static void sub_8083314(u8 taskId)
{
    u8 index;
    struct TrainerCard *trainerCards;

    if (sub_8082DF4(taskId) == TRUE)
        return;

    if (GetBlockReceivedStatus() != sub_8008198())
        return;

    index = 0;
    trainerCards = gTrainerCards;
    for (index = 0; index < GetLinkPlayerCount(); index++)
    {
        void *src;
        src = gBlockRecvBuffer[index];
        memcpy(&trainerCards[index], src, sizeof(struct TrainerCard));
    }

    SetSuppressLinkErrorMessage(FALSE);
    ResetBlockReceivedFlags();
    HideFieldMessageBox();

    if (gSpecialVar_Result == 1)
    {
#if ENGLISH
        u16 linkType;
        linkType = gLinkType;
        // FIXME: sub_8082D4C doesn't take any arguments
        sub_8082D4C(0x4411, linkType);
#elif GERMAN
        if (gLinkType != 0x4411)
        {
            if (gLinkType == 0x6601)
                deUnkValue2 = 1;
        }
        sub_8082D4C();
#endif
        EnableBothScriptContexts();
        DestroyTask(taskId);
        return;
    }

    sub_800832C();
    gTasks[taskId].func = sub_80833C4;
}

static void sub_80833C4(u8 taskId)
{
    if (gReceivedRemoteLinkPlayers == FALSE)
    {
        sub_8082D4C();
        EnableBothScriptContexts();
        DestroyTask(taskId);
    }
}

static void sub_80833EC(u8 taskId)
{
    gSpecialVar_Result = 5;
    sub_8082D4C();
    HideFieldMessageBox();
    EnableBothScriptContexts();
    DestroyTask(taskId);
}

static void sub_8083418(u8 taskId)
{
    gSpecialVar_Result = 6;
    sub_8082D4C();
    HideFieldMessageBox();
    EnableBothScriptContexts();
    DestroyTask(taskId);
}

static bool8 sub_8083444(u8 taskId)
{
    gTasks[taskId].data[4]++;
    if (gTasks[taskId].data[4] > 600)
    {
        gTasks[taskId].func = sub_8083418;
        return TRUE;
    }

    return FALSE;
}

void sub_808347C(u8 arg0)
{
    u32 r3 = 2;
    u32 r2 = 2;

    switch (gSpecialVar_0x8004)
    {
    case 1:
        r3 = 2;
        gLinkType = 0x2233;
        break;
    case 2:
        r3 = 2;
        gLinkType = 0x2244;
        break;
    case 5:
        r3 = 4;
        r2 = 4;
        gLinkType = 0x2255;
        break;
    }

    sub_8082CD4(r3, r2);
}

void sub_80834E4(void)
{
    gLinkType = 0x1133;
    gBattleTypeFlags = 0;
    sub_8082CD4(2, 2);
}

void sub_808350C(void)
{
    gSpecialVar_Result = 0;
    gLinkType = 0x3311;
    gBattleTypeFlags = 0;
    sub_8082CD4(2, 4);
}

static void sub_808353C(u8 taskId)
{
    int playerCount;
    int i;

    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (gSpecialVar_Result == 1)
        {
            playerCount = GetLinkPlayerCount();
            for (i = 0; i < playerCount; i++)
            {
                if (gLinkPlayers[i].language == LANGUAGE_JAPANESE)
                {
                    gSpecialVar_Result = 7;
                    sub_8008480();
                    gTasks[taskId].data[0] = 1;
                    return;
                }
            }
        }
        EnableBothScriptContexts();
        DestroyTask(taskId);
        break;
    case 1:
        if (gReceivedRemoteLinkPlayers == FALSE)
        {
            EnableBothScriptContexts();
            DestroyTask(taskId);
        }
        break;
    }
}

void sub_80835D8(void)
{
    int taskId = FindTaskIdByFunc(sub_808353C);

    if (taskId == 0xFF)
    {
        taskId = CreateTask(sub_808353C, 80);
        gTasks[taskId].data[0] = 0;
    }
}

void sub_8083614(void)
{
    gLinkType = 0x4411;
    gBattleTypeFlags = 0;
    sub_8082CD4(2, 4);
}

void sub_808363C(void)
{
    gLinkType = 0x6601;
    gBattleTypeFlags = 0;
    sub_8082CD4(4, 4);
}

u8 sub_8083664(void)
{
    if (FuncIsActiveTask(sub_8083710) != FALSE)
        return 0xFF;

    switch (gSpecialVar_0x8004)
    {
    case 1:
        gLinkType = 0x2233;
        break;
    case 2:
        gLinkType = 0x2244;
        break;
    case 5:
        gLinkType = 0x2255;
        break;
    case 3:
        gLinkType = 0x1111;
        break;
    case 4:
        gLinkType = 0x3322;
        break;
    }

    return CreateTask(sub_8083710, 80);
}

static void sub_8083710(u8 taskId)
{
    s16 *data = gTasks[taskId].data;

    if (data[0] == 0)
    {
        OpenLink();
        ResetLinkPlayers();
        CreateTask(sub_8083C50, 80);
    }
    else if (data[0] >= 10)
    {
        gTasks[taskId].func = sub_8083760;
    }
    data[0]++;
}

static void sub_8083760(u8 taskId)
{
    if (GetLinkPlayerCount_2() >= 2)
    {
        if (IsLinkMaster() == TRUE)
            gTasks[taskId].func = sub_80837B4;
        else
            gTasks[taskId].func = sub_80837EC;
    }
}

static void sub_80837B4(u8 taskId)
{
    if (sub_800820C() == GetLinkPlayerCount_2())
    {
        sub_8007F4C();
        gTasks[taskId].func = sub_80837EC;
    }
}

static void sub_80837EC(u8 taskId)
{
    if (gReceivedRemoteLinkPlayers == TRUE
     && IsLinkPlayerDataExchangeComplete() == TRUE)
    {
        sub_800826C();
        sub_8007B14();
        DestroyTask(taskId);
    }
}

void sub_8083820(void)
{
    ScrSpecial_DoSaveDialog();
}

static void sub_808382C(u8 taskId)
{
    struct Task* task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        FadeScreen(1, 0);
        gLinkType = 0x2211;
        ClearLinkCallback_2();
        task->data[0]++;
        break;
    case 1:
        if (!gPaletteFade.active)
            task->data[0]++;
        break;
    case 2:
        task->data[1]++;
        if (task->data[1] > 20)
            task->data[0]++;
        break;
    case 3:
        sub_800832C();
        task->data[0]++;
        break;
    case 4:
        if (!gReceivedRemoteLinkPlayers)
            task->data[0]++;
        break;
    case 5:
        if (gLinkPlayers[0].trainerId & 1)
            current_map_music_set__default_for_battle(MUS_BATTLE32);
        else
            current_map_music_set__default_for_battle(MUS_BATTLE20);

        switch (gSpecialVar_0x8004)
        {
        case 1:
            gBattleTypeFlags = BATTLE_TYPE_TRAINER | BATTLE_TYPE_LINK;
            break;
        case 2:
            gBattleTypeFlags = BATTLE_TYPE_TRAINER | BATTLE_TYPE_LINK | BATTLE_TYPE_DOUBLE;
            break;
        case 5:
            ReducePlayerPartyToThree();
            gBattleTypeFlags = BATTLE_TYPE_TRAINER | BATTLE_TYPE_LINK | BATTLE_TYPE_DOUBLE | BATTLE_TYPE_MULTI;
            break;
        }

        SetMainCallback2(sub_800E7C4);
        gMain.savedCallback = sub_8083958;
        DestroyTask(taskId);
        break;
    }
}

static void sub_8083958(void)
{
    Overworld_ResetMapMusic();
    LoadPlayerParty();
    SavePlayerBag();
    sub_810FEFC();

    if (gSpecialVar_0x8004 != 5)
        UpdateLinkBattleRecords(gUnknown_03004860 ^ 1);

    gMain.savedCallback = sub_805465C;
    SetMainCallback2(sub_8071B28);
}

void sub_80839A4(void)
{
    if (gSpecialVar_0x8004 == 1 || gSpecialVar_0x8004 == 2 || gSpecialVar_0x8004 == 5)
    {
        LoadPlayerParty();
        SavePlayerBag();
    }
    copy_saved_warp2_bank_and_enter_x_to_warp1(0x7F);
}

void sub_80839D0(void)
{
    sub_805559C();
}

static void sub_80839DC(u8 taskId)
{
    struct Task* task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        ShowFieldMessage(gUnknown_081A490C);
        task->data[0] = 1;
        break;
    case 1:
        if (IsFieldMessageBoxHidden())
        {
            sub_8055574();
            sub_8007270(gSpecialVar_0x8005);
            task->data[0] = 2;
        }
        break;
    case 2:
        switch (sub_80554F8())
        {
        case 0:
            break;
        case 1:
            HideFieldMessageBox();
            task->data[0] = 0;
            SwitchTaskToFollowupFunc(taskId);
            break;
        case 2:
            task->data[0] = 3;
            break;
        }
        break;
    case 3:
        sub_8055588();
        HideFieldMessageBox();
        Menu_EraseScreen();
        DestroyTask(taskId);
        EnableBothScriptContexts();
        break;
    }
}

void sub_8083A84(TaskFunc followupFunc)
{
    u8 taskId = CreateTask(sub_80839DC, 80);
    SetTaskFuncWithFollowupFunc(taskId, sub_80839DC, followupFunc);
    ScriptContext1_Stop();
}

static void sub_8083AAC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[0])
    {
    case 0:
        ScriptContext2_Enable();
        FadeScreen(1, 0);
        ClearLinkCallback_2();
        task->data[0]++;
        break;
    case 1:
        if (!gPaletteFade.active)
            task->data[0]++;
        break;
    case 2:
        gUnknown_020297D8.field0 = 0;
        gUnknown_020297D8.field1 = 0;
        m4aMPlayAllStop();
        sub_800832C();
        task->data[0]++;
        break;
    case 3:
        if (!gReceivedRemoteLinkPlayers)
        {
            SetMainCallback2(sub_8047CD8);
            DestroyTask(taskId);
        }
        break;
    }
}

static void sub_8083B44(u8 taskId)
{
    sub_8083B6C();
    DestroyTask(taskId);
}

void sub_8083B5C(void)
{
    sub_8083A84(sub_8083B44);
}

static void sub_8083B6C(void)
{
    CreateTask(sub_8083AAC, 80);
}

void sub_8083B80(void)
{
    sub_8083B6C();
    ScriptContext1_Stop();
}

void sub_8083B90(void)
{
    gLinkType = 0x2211;
    sub_8083A84(sub_808382C);
}

void unref_sub_8083BB0(void)
{
    u8 taskId = CreateTask(sub_80839DC, 80);
    SetTaskFuncWithFollowupFunc(taskId, sub_80839DC, Task_RecordMixing_Main);
    ScriptContext1_Stop();
}

void sub_8083BDC(void)
{
    TrainerCard_ShowLinkCard(gSpecialVar_0x8006, c2_exit_to_overworld_1_continue_scripts_restart_music);
}

bool32 sub_8083BF4(u8 linkPlayerIndex)
{
    u32 trainerCardColorIndex;

    gSpecialVar_0x8006 = linkPlayerIndex;
    StringCopy(gStringVar1, gLinkPlayers[linkPlayerIndex].name);

    trainerCardColorIndex = sub_80934C4(linkPlayerIndex);
    if (trainerCardColorIndex == 0)
        return FALSE;

    StringCopy(gStringVar2, gTrainerCardColorNames[trainerCardColorIndex - 1]);
    return TRUE;
}

void sub_8083C50(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->data[0]++;
    if (task->data[0] > 300)
    {
        CloseLink();
        SetMainCallback2(CB2_LinkError);
        DestroyTask(taskId);
    }

    if (gReceivedRemoteLinkPlayers)
        DestroyTask(taskId);
}

#if DEBUG
extern u16 unk_3004E94;
extern u32 unk_3004E98;

static void debug_sub_808B7A8(u8);

void debug_sub_808B778(void)
{
    if (!FuncIsActiveTask(debug_sub_808B7A8))
        CreateTask(debug_sub_808B7A8, 80);
    unk_3004E98++;
}

static void debug_sub_808B7A8(u8 taskId)
{
    gTasks[taskId].data[0]++;
    if (gTasks[taskId].data[0] == 30)
    {
        gTasks[taskId].data[0] = 0;
        unk_3004E94 |= 1;
    }
}
#endif

static void sub_8083CA4(u8 taskId)
{
    if (!gReceivedRemoteLinkPlayers)
    {
        EnableBothScriptContexts();
        DestroyTask(taskId);
    }
}

void unref_sub_8083CC8(u8 taskId)
{
    sub_800832C();
    gTasks[taskId].func = sub_8083CA4;
}

#if DEBUG
EWRAM_DATA static u8 unk_2030220 = 0;

void debug_sub_808B82C(void)
{
    unk_2030220 = 0;
}

void debug_sub_808B838(u8 a)
{
    unk_2030220 |= 1 << a;
}

static u8 debug_sub_808B850(void)
{
    return unk_2030220;
}
#endif
