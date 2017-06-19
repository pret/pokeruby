#include "global.h"
#include "record_mixing.h"
#include "battle_tower.h"
#include "cable_club.h"
#include "daycare.h"
#include "dewford_trend.h"
#include "event_data.h"
#include "fldeff_80C5CD4.h"
#include "link.h"
#include "mauville_old_man.h"
#include "menu.h"
#include "mystery_event_script.h"
#include "rom4.h"
#include "script.h"
#include "secret_base.h"
#include "songs.h"
#include "sound.h"
#include "string_util.h"
#include "strings2.h"
#include "task.h"
#include "tv.h"


extern void *recordMixingSecretBases;
extern void *recordMixingTvShows;
extern void *gUnknown_083D0274;
extern void *gUnknown_083D0278;
extern void *recordMixingEasyChatPairs;
extern void *gUnknown_083D0284;
extern u8 gUnknown_083D0288[2];
extern u8 gUnknown_083D028A[2][3];
extern u8 gUnknown_083D0290[9][4];

extern struct RecordMixing_UnknownStruct gUnknown_02038738;  //Don't know what type this points to
extern struct RecordMixing_UnknownStruct *gUnknown_083D0280;
extern u16 gSpecialVar_0x8005;
extern u32 gUnknown_03005D2C;
extern u8 gUnknown_03000718;
extern u8 gUnknown_0300071C[];
extern bool8 gReceivedRemoteLinkPlayers;

#define BUFFER_CHUNK_SIZE 200

void sub_80B929C(void)
{
    sub_8083A84(Task_RecordMixing_Main);
}

struct PlayerRecords {
    struct SecretBaseRecord secretBases[20];
    TVShow tvShows[25];
    u8 filler1004[0x40];
    u8 filler1044[0x40];
    struct EasyChatPair easyChatPairs[5];
    struct RecordMixing_UnknownStruct filler10AC;
    u8 filler1124[0xA4];
    u16 filler11C8[0x34];
};

extern struct PlayerRecords unk_2008000;
extern struct PlayerRecords unk_2018000;

void RecordMixing_PrepareExchangePacket(void)
{
    sub_80BC300();
    sub_80C045C();

    memcpy(unk_2018000.secretBases, recordMixingSecretBases, sizeof(unk_2018000.secretBases));
    memcpy(unk_2018000.tvShows, recordMixingTvShows, sizeof(unk_2018000.tvShows));
    memcpy(unk_2018000.filler1004, gUnknown_083D0274, 0x40);
    memcpy(unk_2018000.filler1044, gUnknown_083D0278, 0x40);
    memcpy(unk_2018000.easyChatPairs, recordMixingEasyChatPairs, 0x28);
    gUnknown_02038738.data[0] = gSaveBlock1.filler_303C.data[0];
    gUnknown_02038738.data[1] = gSaveBlock1.filler_303C.data[1];
    sub_8041324(gSaveBlock1.daycareData, &gUnknown_02038738);
    memcpy(&unk_2018000.filler10AC, gUnknown_083D0280, sizeof(struct RecordMixing_UnknownStruct));
    memcpy(unk_2018000.filler1124, gUnknown_083D0284, 0xA4);

    if (GetMultiplayerId() == 0)
        unk_2018000.filler11C8[0] = sub_8126338();
}

void RecordMixing_ReceiveExchangePacket(u32 a)
{
    sub_80BD674(unk_2008000.secretBases, sizeof(struct PlayerRecords), a);
    sub_80BFD44((u8 *)unk_2008000.tvShows, sizeof(struct PlayerRecords), a);
    sub_80C0514(unk_2008000.filler1004, sizeof(struct PlayerRecords), a);
    sub_80B9B1C(unk_2008000.filler1044, sizeof(struct PlayerRecords), a);
    //UB: Too many arguments for function "sub_80FA4E4"
    sub_80FA4E4(unk_2008000.easyChatPairs, sizeof(struct PlayerRecords), a);
    sub_80B9C6C(&unk_2008000.filler10AC, sizeof(struct PlayerRecords), a, unk_2008000.tvShows);
    sub_80B9B70(unk_2008000.filler1124, sizeof(struct PlayerRecords), a);
    sub_80B9F3C(unk_2008000.filler11C8, a);
}

void Task_RecordMixing_SoundEffect(u8 taskId)
{
    gTasks[taskId].data[0]++;
    if (gTasks[taskId].data[0] == 50)
    {
        PlaySE(SE_W213);
        gTasks[taskId].data[0] = 0;
    }
}

#define TD_STATE 0
void Task_RecordMixing_Main(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;

    switch (taskData[TD_STATE])
    {
    case 0:        // init
        sub_8007270(gSpecialVar_0x8005);
        VarSet(0x4000, 1);
        gUnknown_03000718 = 0;
        RecordMixing_PrepareExchangePacket();
        CreateRecordMixingSprite();
        taskData[TD_STATE] = 1;
        taskData[10] = CreateTask(sub_80B95F0, 0x50);
        taskData[15] = CreateTask(Task_RecordMixing_SoundEffect, 0x51);
        break;
    case 1:        // wait for sub_80B95F0
        if (!gTasks[taskData[10]].isActive)
        {
            taskData[TD_STATE] = 2;
            FlagSet(SYS_MIX_RECORD);
            DestroyRecordMixingSprite();
            DestroyTask(taskData[15]);
        }
        break;
    case 2:
        taskData[10] = CreateTask(sub_80BA00C, 10);
        taskData[TD_STATE] = 3;
        PlaySE(SE_W226);
        break;
    case 3:        // wait for sub_80BA00C
        if (!gTasks[taskData[10]].isActive)
        {
            taskData[TD_STATE] = 4;
            taskData[10] = sub_8083664();
            sub_80720B0();
            MenuPrint(gOtherText_MixingComplete, 2, 15);
            taskData[8] = 0;
        }
        break;
    case 4:        // wait 60 frames
        taskData[8]++;
        if (taskData[8] > 60)
            taskData[TD_STATE] = 5;
        break;
    case 5:
        if (!gTasks[taskData[10]].isActive)
        {
            sub_8055588();
            MenuZeroFillScreen();
            DestroyTask(taskId);
            EnableBothScriptContexts();
        }
        break;
    }
}

void sub_80B95F0(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    switch (task->data[TD_STATE])
    {
    case 0:
        sub_80B9A78();
        MenuDisplayMessageBox();
        MenuPrint(gOtherText_MixingRecordsWithFriend, 2, 15);
        task->data[8] = 0x708;
        task->data[TD_STATE] = 400;
        ClearLinkCallback_2();
        break;
    case 100:        // wait 20 frames
        task->data[12]++;
        if (task->data[12] > 20)
        {
            task->data[12] = 0;
            task->data[TD_STATE] = 101;
        }
        break;
    case 101:
    {
        u8 players = GetLinkPlayerCount_2();

        if (IsLinkMaster() == 1)
        {
            if (players == sub_800820C())
            {
                PlaySE(0x15);
                task->data[TD_STATE] = 201;
                task->data[12] = 0;
            }
        }
        else
        {
            PlaySE(0x16);
            task->data[TD_STATE] = 301;
        }
        break;
    }
    case 201:
        if (sub_800820C() == GetLinkPlayerCount_2())
        {
            if (++task->data[12] > GetLinkPlayerCount_2() * 30)
            {
                sub_8007F4C();
                task->data[TD_STATE] = 1;
            }
        }
        break;
    case 301:
        if (sub_800820C() == GetLinkPlayerCount_2())
            task->data[TD_STATE] = 1;
        break;
    case 400:        // wait 20 frames
        task->data[12]++;
        if (task->data[12] > 20)
        {
            task->data[TD_STATE] = 1;
            task->data[12] = 0;
        }
        break;
    case 1:        // wait for handshake
        if (gReceivedRemoteLinkPlayers)
        {
            ConvertIntToDecimalStringN(gStringVar1, GetMultiplayerId_(), 2, 2);
            task->data[TD_STATE] = 5;
        }
        break;
    case 2:
    {
        u8 subTaskId;

        task->data[6] = GetLinkPlayerCount_2();
        task->data[TD_STATE] = 0;
        task->data[5] = GetMultiplayerId_();
        task->func = Task_RecordMixing_SendPacket;
        StorePtrInTaskData(&unk_2018000, &task->data[2]);
        subTaskId = CreateTask(Task_RecordMixing_CopyReceiveBuffer, 0x50);
        task->data[10] = subTaskId;
        gTasks[subTaskId].data[0] = taskId;
        //StorePtrInTaskData((void*)0x2008000, &gTasks[subTaskId].data[5]);
        StorePtrInTaskData((u8 *)&unk_2018000 - 0x10000, &gTasks[subTaskId].data[5]);
        break;
    }
    case 5:        // wait 60 frames
        task->data[10]++;
        if (task->data[10] > 60)
        {
            task->data[10] = 0;
            task->data[TD_STATE] = 2;
        }
        break;
    }
}

void Task_RecordMixing_SendPacket(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    // does this send the data 24 times?

    switch (task->data[TD_STATE])
    {
    case 0: //Copy record data to send buffer
    {
        void *recordData = (u8 *)LoadPtrFromTaskData(&task->data[2]) + BUFFER_CHUNK_SIZE * task->data[4];

        memcpy(gBlockSendBuffer, recordData, BUFFER_CHUNK_SIZE);
        task->data[TD_STATE]++;
        break;
    }
    case 1:
        if (GetMultiplayerId() == 0)
            sub_8007E9C(1);
        task->data[TD_STATE]++;
        break;
    case 2:
        break;
    case 3:
        task->data[4]++;
        if ((u16)task->data[4] == 24)
            task->data[TD_STATE]++;
        else
            task->data[TD_STATE] = 0;
        break;
    case 4:
        if (!gTasks[task->data[10]].isActive)
            task->func = Task_RecordMixing_SendPacket_SwitchToReceive;
    }
}

void Task_RecordMixing_CopyReceiveBuffer(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    s32 recvStatus = GetBlockReceivedStatus();
    u8 handledPlayers = 0;

    if (recvStatus == sub_8008198())
    {
        u8 player;

        for (player = 0; player < GetLinkPlayerCount(); player++)
        {
            void *src;
            u8 *dst;

            if ((recvStatus >> player) & 1)
            {
                dst = LoadPtrFromTaskData(&task->data[5]) + task->data[player + 1] * BUFFER_CHUNK_SIZE + player * sizeof(struct PlayerRecords);
                src = GetPlayerRecvBuffer(player);
                if ((task->data[player + 1] + 1) * BUFFER_CHUNK_SIZE > sizeof(struct PlayerRecords))
                    memcpy(dst, src, sizeof(struct PlayerRecords) - task->data[player + 1] * BUFFER_CHUNK_SIZE);
                else
                    memcpy(dst, src, BUFFER_CHUNK_SIZE);
                ResetBlockReceivedFlag(player);
                task->data[player + 1]++;
                if ((u16)task->data[player + 1] == 0x18)
                    handledPlayers++;
            }
        }
        gTasks[task->data[0]].data[0]++;
    }
    //_080B998A
    if (handledPlayers == GetLinkPlayerCount())
        DestroyTask(taskId);
}

void sub_80B99B4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    if (!gTasks[task->data[10]].isActive)
        DestroyTask(taskId);
}

void Task_RecordMixing_ReceivePacket(u8 taskId)
{
    struct Task *task = &gTasks[taskId];

    task->func = sub_80B99B4;
    if (gUnknown_03000718 == 1)
        RecordMixing_ReceiveExchangePacket(task->data[5]);
}

void Task_RecordMixing_SendPacket_SwitchToReceive(u8 taskId)
{
    gTasks[taskId].func = Task_RecordMixing_ReceivePacket;
    gUnknown_03000718 = 1;
}

void *LoadPtrFromTaskData(u16 *ptr)
{
    return (void *)(*ptr | *(ptr + 1) << 16);
}

void StorePtrInTaskData(void *ptr, u16 *data)
{
    *data = (u32)ptr;
    *(data + 1) = (u32)ptr >> 16;
}

u8 GetMultiplayerId_(void)
{
    return GetMultiplayerId();
}

u16 *GetPlayerRecvBuffer(u8 player)
{
    return gBlockRecvBuffer[player];
}

void sub_80B9A78(void)
{
    gUnknown_03005D2C = sizeof(struct PlayerRecords);
}

void sub_80B9A88(u8 *a)
{
    u32 i;
    u32 id;
    u32 players = GetLinkPlayerCount();

    switch (players)
    {
    case 2:
        for (i = 0; i < 2; i++)
            a[i] = gUnknown_083D0288[i];
        break;
    case 3:
        id = GetLinkPlayerTrainerId(0) % 2;
        for (i = 0; i < 3; i++)
            a[i] = gUnknown_083D028A[id][i];
        break;
    case 4:
        id = GetLinkPlayerTrainerId(0) % 9;
        for (i = 0; i < 4; i++)
            a[i] = gUnknown_083D0290[id][i];
        break;
    default:
        break;
    }
}

void sub_80B9B1C(u8 *a, size_t size, u8 index)
{
    u8 arr[4];
    u8 *ptr;

    sub_80B9A88(arr);
    //Probably not how it was originally written, but this matches.
    memcpy(a + index * size, (ptr = gUnknown_083D0278), 0x40);
    memcpy(ptr, a + arr[index] * size, 0x40);
    sub_80F7F30();
}

void sub_80B9B70(u8 *a, size_t size, u8 index)
{
    sub_80B9A88(gUnknown_0300071C);
    memcpy(a + size * index, a + size * gUnknown_0300071C[index], 0xA4);
    sub_8134AC0(a + size * index);
}

u8 sub_80B9BBC(u16 *a)
{
    return a[16];
}

#undef NONMATCHING
#ifdef NONMATCHING

void sub_80B9BC4(struct RecordMixing_UnknownStruct *a, size_t b, u8 c[][2], u8 d, u8 e)
{
    struct RecordMixing_UnknownStructSub *offA;
    struct RecordMixing_UnknownStructSub *offB;
    struct RecordMixing_UnknownStructSub v0;
    v0 = (offA = ((struct RecordMixing_UnknownStruct *)(b * c[d][0] + (u32)&a))->data)[c[d][1]];
    offA[c[d][1]] = (offB = ((struct RecordMixing_UnknownStruct *)(b * c[e][0] + (u32)&a))->data)[c[e][1]];
    offB[c[e][1]] = v0;
    //ToDo: Figure out what this strange stack usage is
}

#else
__attribute__((naked))
void sub_80B9BC4(struct RecordMixing_UnknownStruct *a, size_t b, u8 c[][2], u8 d, u8 e)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
    mov r6, r10\n\
    mov r5, r9\n\
    mov r4, r8\n\
    push {r4-r6}\n\
    sub sp, 0x38\n\
    mov r8, r0\n\
    mov r10, r1\n\
    mov r9, r2\n\
    adds r4, r3, 0\n\
    ldr r5, [sp, 0x54]\n\
    lsls r4, 24\n\
    lsls r5, 24\n\
    lsrs r5, 24\n\
    lsrs r4, 23\n\
    add r4, r9\n\
    ldrb r0, [r4]\n\
    mov r6, r10\n\
    muls r6, r0\n\
    add r6, r8\n\
    ldrb r0, [r4, 0x1]\n\
    lsls r1, r0, 3\n\
    subs r1, r0\n\
    lsls r1, 3\n\
    adds r1, r6, r1\n\
    mov r0, sp\n\
    movs r2, 0x38\n\
    bl memcpy\n\
    lsls r5, 1\n\
    add r5, r9\n\
    ldrb r0, [r5]\n\
    mov r1, r10\n\
    muls r1, r0\n\
    adds r0, r1, 0\n\
    add r8, r0\n\
    ldrb r1, [r4, 0x1]\n\
    lsls r0, r1, 3\n\
    subs r0, r1\n\
    lsls r0, 3\n\
    adds r6, r0\n\
    ldrb r0, [r5, 0x1]\n\
    lsls r1, r0, 3\n\
    subs r1, r0\n\
    lsls r1, 3\n\
    add r1, r8\n\
    adds r0, r6, 0\n\
    movs r2, 0x38\n\
    bl memcpy\n\
    ldrb r1, [r5, 0x1]\n\
    lsls r0, r1, 3\n\
    subs r0, r1\n\
    lsls r0, 3\n\
    add r8, r0\n\
    mov r0, r8\n\
    mov r1, sp\n\
    movs r2, 0x38\n\
    bl memcpy\n\
    add sp, 0x38\n\
    pop {r3-r5}\n\
    mov r8, r3\n\
    mov r9, r4\n\
    mov r10, r5\n\
    pop {r4-r6}\n\
    pop {r0}\n\
    bx r0\n\
    .syntax divided\n");
}
#endif

u8 sub_80B9C4C(u8 *a)
{
    int i;
    u8 r2 = 0;

    for (i = 0; i < 0x100; i++)
        r2 += a[i];
    return r2;
}

