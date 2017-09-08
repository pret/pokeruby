#include "global.h"
#include "battle.h"
#include "battle_records.h"
#include "cable_club.h"
#include "field_message_box.h"
#include "field_weather.h"
#include "link.h"
#include "load_save.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "record_mixing.h"
#include "rom4.h"
#include "script.h"
#include "script_pokemon_80C4.h"
#include "songs.h"
#include "sound.h"
#include "start_menu.h"
#include "string_util.h"
#include "strings2.h"
#include "task.h"
#include "text.h"
#include "trainer_card.h"

extern u16 gScriptResult;
extern struct TrainerCard gTrainerCards[4];
extern u8 gUnknown_03004860;
extern u8 gFieldLinkPlayerCount;
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u16 gSpecialVar_0x8006;
extern u16 gBattleTypeFlags;
extern const u8 gUnknown_081A4932[];
extern const u8 gUnknown_081A4975[];
extern const u8 gUnknown_081A49B6[];
extern const u8 gUnknown_081A490C[];
extern const u8* const gTrainerCardColorNames[];
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
/*static*/ void sub_8083188(u8 taskId); /* When `sub_80830E4` matches, make this function static. */
static void sub_8083288(u8 taskId);
static void sub_8083314(u8 taskId);
static void sub_80833C4(u8 taskId);
static void sub_80833EC(u8 taskId);
static void sub_8083418(u8 taskId);
static u8 sub_8083444(u8 taskId);
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

extern void sub_80831F8(u8 taskId);
extern void call_map_music_set_to_zero(void);
extern void sub_810FEFC(void);
extern void sub_8047CD8(void);
extern void sub_805559C(void);
extern void sub_8055574(void);
extern s32 sub_80554F8(void);
extern void sub_805465C(void);

static void sub_8082CD4(u8 arg0, u8 arg1)
{
    if (FindTaskIdByFunc(sub_8082F20) == 0xFF)
    {
        u8 taskId = CreateTask(sub_8082F20, 0x50);
        
        gTasks[taskId].data[1] = arg0;
        gTasks[taskId].data[2] = arg1;
    }
}

static void sub_8082D18(u32 value)
{
    ConvertIntToDecimalStringN(gStringVar1, value, 0, 1);
    MenuDrawTextWindow(0x12, 0xA, 0x1C, 0xD);
    sub_8072BD8(gOtherText_PLink, 0x13, 0xB, 0x48);
}

static void sub_8082D4C()
{
    MenuZeroFillWindowRect(0x12, 0xA, 0x1C, 0xD);
}

static void sub_8082D60(u8 taskId, u8 arg1)
{
    s16 *ptr = &gTasks[taskId].data[3];

    if (arg1 != *ptr)
    {
        if (arg1 <= 1)
            sub_8082D4C();
        else
            sub_8082D18(arg1);
        
        *ptr = arg1;
    }
}

static u16 sub_8082D9C(u8 minPlayers, u8 maxPlayers)
{
    int playerCount;

    switch (GetLinkPlayerDataExchangeStatusTimed())
    {
    case EXCHANGE_COMPLETE:
        playerCount = GetLinkPlayerCount_2();
        if (minPlayers <= playerCount && playerCount <= maxPlayers)
            return 1;
        ConvertIntToDecimalStringN(gStringVar1, playerCount, 0, 1);
        return 4;
    case EXCHANGE_TIMED_OUT:
        return 0;
    case EXCHANGE_IN_PROGRESS:
        return 3;
    default:
        return 0;
    }
}

static u32 sub_8082DF4(u8 taskId)
{
    if (HasLinkErrorOccurred() == TRUE)
    {
        gTasks[taskId].func = sub_8083418;
        return 1;
    }
    return 0;
}

static u32 sub_8082E28(u8 taskId)
{
    if ((gMain.newKeys & B_BUTTON) &&
        IsLinkConnectionEstablished() == 0)
    {
        gTasks[taskId].func = sub_80833EC;
        return 1;
    }
    
    return 0;
}

static u32 sub_8082E6C(u8 taskId)
{
    if (IsLinkConnectionEstablished() != 0)
        SetSuppressLinkErrorMessage(1);
    
    if ((gMain.newKeys & B_BUTTON) != 0)
    {
        gTasks[taskId].func = sub_80833EC;
        return 1;
    }
    
    return 0;
}

static u32 sub_8082EB8(u8 taskId)
{
    if (GetSioMultiSI() == 1)
    {
        gTasks[taskId].func = sub_8083418;
        return 1;
    }
    
    return 0;
}

void unref_sub_8082EEC(u8 taskId)
{
    gTasks[taskId].data[0] += 1;
    
    if (gTasks[taskId].data[0] == 0xA)
    {
        sub_8007E9C(2);
        DestroyTask(taskId);
    }
}

static void sub_8082F20(u8 taskId)
{
    s16 *data = &gTasks[taskId].data[0];
    
    if (*data == 0)
    {
        OpenLinkTimed();
        sub_80082EC();
        ResetLinkPlayers();
    }
    else if (*data > 9)
        gTasks[taskId].func = sub_8082F68;
    
    *data += 1;
}

static void sub_8082F68(u8 taskId)
{
    u32 playerCount = GetLinkPlayerCount_2();
    
    if (sub_8082E28(taskId) != 1 &&
        sub_8082E6C(taskId) != 1 &&
        playerCount > 1)
    {
        SetSuppressLinkErrorMessage(1);
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
}

static void sub_8082FEC(u8 taskId)
{
    if (sub_8082E28(taskId) != 1 &&
        sub_8082EB8(taskId) != 1 &&
        sub_8082DF4(taskId) != 1)
    {
        if (GetFieldMessageBoxMode() == 0)
        {
            gTasks[taskId].data[3] = 0;
            gTasks[taskId].func = sub_808303C;
        }
    }
}

static void sub_808303C(u8 taskId)
{
    s32 linkPlayerCount;
    s16 *taskData;

    taskData = gTasks[taskId].data;

    linkPlayerCount = GetLinkPlayerCount_2();

    if (sub_8082E28(taskId) == 1 ||
        sub_8082EB8(taskId) == 1 ||
        sub_8082DF4(taskId) == 1)
        return;

    sub_8082D60(taskId, linkPlayerCount);

    if (!(gMain.newKeys & A_BUTTON))
        return;

#if ENGLISH
    if (linkPlayerCount < taskData[1])
        return;

    sub_80081C8(linkPlayerCount);
    sub_8082D4C();
    ConvertIntToDecimalStringN(gStringVar1, linkPlayerCount, STR_CONV_MODE_LEFT_ALIGN, 1); // r5
    ShowFieldAutoScrollMessage((u8 *) gUnknown_081A4975);
    gTasks[taskId].func = sub_80830E4;
#elif GERMAN
    if ((gLinkType == 0x2255 && (u32) linkPlayerCount > 1) ||
        (gLinkType != 0x2255 && taskData[1] <= linkPlayerCount))
    {
        sub_80081C8(linkPlayerCount);
        sub_8082D4C();
        ConvertIntToDecimalStringN(gStringVar1, linkPlayerCount, STR_CONV_MODE_LEFT_ALIGN, 1); // r5
        ShowFieldAutoScrollMessage((u8 *) gUnknown_081A4975);
        gTasks[taskId].func = sub_80830E4;
    }
#endif
}

#ifdef NONMATCHING
// Matches, except for a strange register allocation (redundant r6 in the original).
static void sub_80830E4(u8 taskId)
{
    if (sub_8082E28(taskId) != 1 &&
        sub_8082EB8(taskId) != 1 &&
        sub_8082DF4(taskId) != 1 &&
        GetFieldMessageBoxMode() == 0)
    {
        if (sub_800820C() != GetLinkPlayerCount_2() ||
            (gMain.heldKeys & B_BUTTON))
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
#else
__attribute__((naked))
static void sub_80830E4(u8 taskId) {
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    lsls r0, 24\n\
    lsrs r5, r0, 24\n\
    adds r6, r5, 0\n\
    adds r0, r5, 0\n\
    bl sub_8082E28\n\
    cmp r0, 0x1\n\
    beq _08083178\n\
    adds r0, r5, 0\n\
    bl sub_8082EB8\n\
    cmp r0, 0x1\n\
    beq _08083178\n\
    adds r0, r5, 0\n\
    bl sub_8082DF4\n\
    cmp r0, 0x1\n\
    beq _08083178\n\
    bl GetFieldMessageBoxMode\n\
    lsls r0, 24\n\
    cmp r0, 0\n\
    bne _08083178\n\
    bl sub_800820C\n\
    adds r4, r0, 0\n\
    bl GetLinkPlayerCount_2\n\
    lsls r4, 24\n\
    lsls r0, 24\n\
    cmp r4, r0\n\
    bne _08083132\n\
    ldr r0, _08083148 @ =gMain\n\
    ldrh r1, [r0, 0x2C]\n\
    movs r0, 0x2\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08083158\n\
_08083132:\n\
    ldr r0, _0808314C @ =gUnknown_081A4932\n\
    bl ShowFieldAutoScrollMessage\n\
    ldr r1, _08083150 @ =gTasks\n\
    lsls r0, r5, 2\n\
    adds r0, r5\n\
    lsls r0, 3\n\
    adds r0, r1\n\
    ldr r1, _08083154 @ =sub_8082FEC\n\
    str r1, [r0]\n\
    b _08083178\n\
    .align 2, 0\n\
_08083148: .4byte gMain\n\
_0808314C: .4byte gUnknown_081A4932\n\
_08083150: .4byte gTasks\n\
_08083154: .4byte sub_8082FEC\n\
_08083158:\n\
    movs r0, 0x1\n\
    ands r0, r1\n\
    cmp r0, 0\n\
    beq _08083178\n\
    movs r0, 0x5\n\
    bl PlaySE\n\
    bl sub_8007F4C\n\
    ldr r0, _08083180 @ =gTasks\n\
    lsls r1, r6, 2\n\
    adds r1, r6\n\
    lsls r1, 3\n\
    adds r1, r0\n\
    ldr r0, _08083184 @ =sub_8083188\n\
    str r0, [r1]\n\
_08083178:\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .align 2, 0\n\
_08083180: .4byte gTasks\n\
_08083184: .4byte sub_8083188\n\
    .syntax divided\n");
}
#endif

/* When the previous function matches, make this function static. */
/*static*/ void sub_8083188(u8 taskId)
{
    u8 local1, local2;
    u16 *result;

    local1 = gTasks[taskId].data[1];
    local2 = gTasks[taskId].data[2];

    if (sub_8082DF4(taskId) == 1 ||
        sub_8083444(taskId) == 1)
        return;

    if (GetLinkPlayerCount_2() != sub_800820C())
    {
        gTasks[taskId].func = sub_8083418;
        return;
    }

    result = &gScriptResult;
    *result = sub_8082D9C(local1, local2);
    if (*result)
        gTasks[taskId].func = sub_8083288;
}

void sub_80831F8(u8 taskId)
{
    u8 local1, local2;
    u16 *result;

    local1 = gTasks[taskId].data[1];
    local2 = gTasks[taskId].data[2];

    if (sub_8082E28(taskId) == 1 ||
        sub_8082DF4(taskId) == 1)
        return;

    result = &gScriptResult;
    *result = sub_8082D9C(local1, local2);
    if (*result == 0)
        return;


    if (*result == 3)
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
        sub_8093390((struct TrainerCard *) gBlockSendBuffer);
        gTasks[taskId].func = sub_8083314;
    }
}

static void sub_8083288(u8 taskId)
{
    if (sub_8082DF4(taskId) == 1)
        return;

    if (gScriptResult == 3)
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
        sub_8093390((struct TrainerCard *) gBlockSendBuffer);
        gTasks[taskId].func = sub_8083314;
        sub_8007E9C(2);
    }
}

static void sub_8083314(u8 taskId)
{
    u8 index;
    struct TrainerCard *trainerCards;

    if (sub_8082DF4(taskId) == 1)
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

    if (gScriptResult == 1)
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
    gScriptResult = 5;
    sub_8082D4C();
    HideFieldMessageBox();
    EnableBothScriptContexts();
    DestroyTask(taskId);
}

static void sub_8083418(u8 taskId)
{
    gScriptResult = 6;
    sub_8082D4C();
    HideFieldMessageBox();
    EnableBothScriptContexts();
    DestroyTask(taskId);
}

static u8 sub_8083444(u8 taskId)
{
    gTasks[taskId].data[4]++;
    if (gTasks[taskId].data[4] > 600)
    {
        gTasks[taskId].func = sub_8083418;
        return 1;
    }
    
    return 0;
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
    gScriptResult = 0;
    gLinkType = 0x3311;
    gBattleTypeFlags = 0;
    sub_8082CD4(2, 4);
}

#ifdef NONMATCHING
/* Matches except for register allocation. */
static void sub_808353C(u8 taskId)
{
    int playerCount;
    int i;
    
    switch (gTasks[taskId].data[0])
    {
    case 0:
        if (gScriptResult == 1)
        {
            playerCount = GetLinkPlayerCount();
            for (i = 0; i < playerCount; i++)
            {
                if (gLinkPlayers[i].language == LANGUAGE_JAPANESE)
                {
                    gScriptResult = 7;
                    sub_8008480();
                    gTasks[taskId].data[0] = i;
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
#else
__attribute__((naked))
void sub_808353C(u8 taskId) {
    asm(".syntax unified\n\
sub_808353C: @ 808353C                                  \n\
    push {r4,r5,lr}                                     \n\
    lsls r0, 24                                         \n\
    lsrs r5, r0, 24                                     \n\
    ldr r1, _0808355C @ =gTasks                         \n\
    lsls r0, r5, 2                                      \n\
    adds r0, r5                                         \n\
    lsls r0, 3                                          \n\
    adds r0, r1                                         \n\
    movs r1, 0x8                                        \n\
    ldrsh r0, [r0, r1]                                  \n\
    cmp r0, 0                                           \n\
    beq _08083560                                       \n\
    cmp r0, 0x1                                         \n\
    beq _080835BC                                       \n\
    b _080835CE                                         \n\
    .align 2, 0                                         \n\
_0808355C: .4byte gTasks                                \n\
_08083560:                                              \n\
    ldr r0, _08083594 @ =gScriptResult                  \n\
    ldrh r0, [r0]                                       \n\
    cmp r0, 0x1                                         \n\
    bne _08083586                                       \n\
    bl GetLinkPlayerCount                               \n\
    lsls r0, 24                                         \n\
    lsrs r0, 24                                         \n\
    movs r1, 0                                          \n\
    cmp r1, r0                                          \n\
    bge _08083586                                       \n\
    ldr r2, _08083598 @ =gLinkPlayers                   \n\
_08083578:                                              \n\
    ldrh r4, [r2, 0x1A]                                 \n\
    cmp r4, 0x1                                         \n\
    beq _0808359C                                       \n\
    adds r2, 0x1C                                       \n\
    adds r1, 0x1                                        \n\
    cmp r1, r0                                          \n\
    blt _08083578                                       \n\
_08083586:                                              \n\
    bl EnableBothScriptContexts                         \n\
    adds r0, r5, 0                                      \n\
    bl DestroyTask                                      \n\
    b _080835CE                                         \n\
    .align 2, 0                                         \n\
_08083594: .4byte gScriptResult                         \n\
_08083598: .4byte gLinkPlayers                          \n\
_0808359C:                                              \n\
    ldr r1, _080835B4 @ =gScriptResult                  \n\
    movs r0, 0x7                                        \n\
    strh r0, [r1]                                       \n\
    bl sub_8008480                                      \n\
    ldr r1, _080835B8 @ =gTasks                         \n\
    lsls r0, r5, 2                                      \n\
    adds r0, r5                                         \n\
    lsls r0, 3                                          \n\
    adds r0, r1                                         \n\
    strh r4, [r0, 0x8]                                  \n\
    b _080835CE                                         \n\
    .align 2, 0                                         \n\
_080835B4: .4byte gScriptResult                         \n\
_080835B8: .4byte gTasks                                \n\
_080835BC:                                              \n\
    ldr r0, _080835D4 @ =gReceivedRemoteLinkPlayers     \n\
    ldrb r0, [r0]                                       \n\
    cmp r0, 0                                           \n\
    bne _080835CE                                       \n\
    bl EnableBothScriptContexts                         \n\
    adds r0, r5, 0                                      \n\
    bl DestroyTask                                      \n\
_080835CE:                                              \n\
    pop {r4,r5}                                         \n\
    pop {r0}                                            \n\
    bx r0                                               \n\
    .align 2, 0                                         \n\
_080835D4: .4byte gReceivedRemoteLinkPlayers            \n\
    .syntax divided");
}
#endif

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
    
    switch (gSpecialVar_0x8004 - 1)
    {
    case 0:
        gLinkType = 0x2233;
        break;
    case 1:
        gLinkType = 0x2244;
        break;
    case 4:
        gLinkType = 0x2255;
        break;
    case 2:
        gLinkType = 0x1111;
        break;
    case 3:
        gLinkType = 0x3322;
        break;
    }
    
    return CreateTask(sub_8083710, 80);
}

static void sub_8083710(u8 taskId)
{
    s16 *data = &gTasks[taskId].data[0];
    
    if (*data == 0)
    {
        OpenLink();
        ResetLinkPlayers();
        CreateTask(sub_8083C50, 80);
    }
    else if (*data >= 10)
        gTasks[taskId].func = sub_8083760;
    
    *data += 1;
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
    if (gReceivedRemoteLinkPlayers == TRUE &&
        IsLinkPlayerDataExchangeComplete() == TRUE)
    {
        sub_800826C();
        sub_8007B14();
        DestroyTask(taskId);
    }
}

void sub_8083820(void)
{
    InitSaveDialog();
}

static void sub_808382C(u8 taskId)
{
    struct Task* task = &gTasks[taskId];
    
    switch (task->data[0])
    {
    case 0:
        fade_screen(1, 0);
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
            current_map_music_set__default_for_battle(BGM_BATTLE32);
        else
            current_map_music_set__default_for_battle(BGM_BATTLE20);
        
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
    call_map_music_set_to_zero();
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
    u16 var = gSpecialVar_0x8004;
    u16 varMinusOne = var - 1;
    
    if (varMinusOne < 2 || var == 5)
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
        MenuZeroFillScreen();
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
        fade_screen(1, 0);
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
    sub_8093130(gSpecialVar_0x8006, c2_exit_to_overworld_1_continue_scripts_restart_music);
}

s32 sub_8083BF4(u8 linkPlayerIndex)
{
    u32 trainerCardColorIndex;
    
    gSpecialVar_0x8006 = linkPlayerIndex;
    StringCopy(gStringVar1, gLinkPlayers[linkPlayerIndex].name);
    
    trainerCardColorIndex = sub_80934C4(linkPlayerIndex);
    if (trainerCardColorIndex == 0)
        return 0;
    
    StringCopy(gStringVar2, gTrainerCardColorNames[trainerCardColorIndex - 1]);
    return 1;
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