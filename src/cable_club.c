#include "global.h"
#include "asm.h"
#include "field_message_box.h"
#include "link.h"
#include "main.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "trainer_card.h"

extern u16 gScriptResult;
extern struct TrainerCard gTrainerCards[4];

extern u8 gUnknown_03004860;
extern u8 gFieldLinkPlayerCount;

extern u8 gUnknown_081A4932[];
extern const u8 gUnknown_081A4975[];

void sub_8082D4C();
void sub_8082D60(u8, u8);
u16 sub_8082D9C(u8, u8);
u32 sub_8082DF4(u8);
u32 sub_8082E28(u8);
u32 sub_8082EB8(u8);
void sub_8082FEC(u8 taskId);
static void sub_80830E4(u8 taskId);
void sub_8083188(u8 taskId);
static void sub_8083288(u8 taskId);
static void sub_8083314(u8 taskId);
void sub_80833C4(u8 taskId);
void sub_8083418(u8 taskId);
u8 sub_8083444(u8 taskId);

void sub_808303C(u8 taskId) {
    s32 linkPlayerCount;
    s16 *taskData;

    taskData = gTasks[taskId].data;

    linkPlayerCount = GetLinkPlayerCount_2();

    if (sub_8082E28(taskId) == 1 ||
        sub_8082EB8(taskId) == 1 ||
        sub_8082DF4(taskId) == 1)
    {
        return;
    }

    sub_8082D60(taskId, linkPlayerCount);

    if (!(gMain.newKeys & A_BUTTON))
    {
        return;
    }

    if (linkPlayerCount < taskData[1])
    {
        return;
    }

    sub_80081C8(linkPlayerCount);
    sub_8082D4C();
    ConvertIntToDecimalStringN(gStringVar1, linkPlayerCount, STR_CONV_MODE_LEFT_ALIGN, 1); // r5
    ShowFieldAutoScrollMessage((u8 *) gUnknown_081A4975);
    gTasks[taskId].func = sub_80830E4;
}

#ifdef NONMATCHING
static void sub_80830E4(u8 taskId) {
    if (sub_8082E28(taskId) == 1 ||
        sub_8082EB8(taskId) == 1 ||
        sub_8082DF4(taskId) == 1 ||
        GetFieldMessageBoxMode())
    {
        return;
    }

    if (sub_800820C() == GetLinkPlayerCount_2() &&
        !(gMain.heldKeys & B_BUTTON))
    {
        ShowFieldAutoScrollMessage(gUnknown_081A4932);
        gTasks[taskId].func = sub_8082FEC;
        return;
    }

    if (gMain.heldKeys & A_BUTTON)
    {
        PlaySE(SE_SELECT);
        sub_8007F4C();
        gTasks[(u32) taskId].func = sub_8083188;
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

void sub_8083188(u8 taskId) {
    u8 local1, local2;
    u16 *result;

    local1 = gTasks[taskId].data[1];
    local2 = gTasks[taskId].data[2];


    if (sub_8082DF4(taskId) == 1 ||
        sub_8083444(taskId) == 1)
    {
        return;
    }

    if (GetLinkPlayerCount_2() != sub_800820C())
    {
        gTasks[taskId].func = sub_8083418;
        return;
    }

    result = &gScriptResult;
    *result = sub_8082D9C(local1, local2);
    if (*result)
    {
        gTasks[taskId].func = sub_8083288;
    }
}

void sub_80831F8(u8 taskId) {
    u8 local1, local2;
    u16 *result;

    local1 = gTasks[taskId].data[1];
    local2 = gTasks[taskId].data[2];

    if (sub_8082E28(taskId) == 1 ||
        sub_8082DF4(taskId) == 1)
    {
        return;
    }

    result = &gScriptResult;
    *result = sub_8082D9C(local1, local2);
    if (*result == 0)
    {
        return;
    }


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

static void sub_8083288(u8 taskId) {
    if (sub_8082DF4(taskId) == 1)
    {
        return;
    }

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

static void sub_8083314(u8 taskId) {
    u8 index;

    struct TrainerCard *trainerCards;

    if (sub_8082DF4(taskId) == 1)
    {
        return;
    }

    if (GetBlockReceivedStatus() != sub_8008198())
    {
        return;
    }

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
        u16 linkType;
        linkType = gLinkType;
        sub_8082D4C(0x00004411, linkType);
        EnableBothScriptContexts();
        DestroyTask(taskId);
        return;
    }

    sub_800832C();
    gTasks[taskId].func = sub_80833C4;
}
