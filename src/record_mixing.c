#include "global.h"
#include "link.h"
#include "menu.h"
#include "pokemon.h"
#include "rng.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "string_util.h"
#include "task.h"
#include "flag.h"
#include "var.h"

extern void *recordMixingSecretBases;
extern void *recordMixingTvShows;
extern void *gUnknown_083D0274;
extern void *gUnknown_083D0278;
extern void *recordMixingEasyChatPairs;
extern void *gUnknown_083D0280;
extern void *gUnknown_083D0284;
extern u8 gUnknown_083D0288[2];
extern u8 gUnknown_083D028A[2][3];
extern u8 gUnknown_083D0290[9][4];

extern u8 gUnknown_02038738[];  //Don't know what type this points to
extern u16 gUnknown_0202E8CE;
extern u32 gUnknown_03005D2C;
extern u8 gUnknown_03000718;
extern u8 gUnknown_0300071C[];
extern u8 gOtherText_MixingComplete[];
extern u8 gOtherText_MixingRecordsWithFriend[];
extern bool8 gReceivedRemoteLinkPlayers;
extern u8 gBlockSendBuffer[BLOCK_BUFFER_SIZE];
extern u16 gBlockRecvBuffer[MAX_LINK_PLAYERS][BLOCK_BUFFER_SIZE / 2];

extern void sub_8083A84(TaskFunc);
extern void sub_8041324(struct BoxPokemon *, void *);
extern void sub_80BD674(void *, u32, u8);
extern void sub_80BFD44(void *, u32, u8);
extern void sub_80C0514(void *, u32, u8);
// UB: sub_80FA4E4 declared with 3 arguments instead of 2
extern void sub_80FA4E4(void *, u32, u8);
extern void sub_80B9C6C(void *, u32, u8, void *);
extern void sub_80B9F3C(void *, u8);
extern u16 sub_8126338(void);
extern u8 sub_8083664(void);
extern void sub_80720B0(void);
extern void CreateRecordMixingSprite(void);
extern void DestroyRecordMixingSprite(void);
extern u16 sub_8055588(void);
extern void sub_80F7F30(void);
extern void sub_8134AC0(void *);

void sub_80B9484(u8);
void sub_80B95F0(u8);
void sub_80BA00C(u8);
void sub_80B97DC(u8);
void Task_CopyRecvBuffer(u8);
void sub_80B9A1C(u8);
u8 GetMultiplayerId_(void);
void StorePtrInTaskData(void *, u16 *);
void *LoadPtrFromTaskData(u16 *);
void sub_80B9B1C(u8 *, size_t, u8);
void sub_80B9B70(u8 *, size_t, u8);
u16 *GetPlayerRecvBuffer(u8 player);
void sub_80B9A78(void);

#define BUFFER_CHUNK_SIZE 200

void sub_80B929C(void)
{
    sub_8083A84(sub_80B9484);
}

struct PlayerRecords {
    struct SecretBaseRecord secretBases[20];
    u8 tvShows[25][36];
    u8 filler1004[0x40];
    u8 filler1044[0x40];
    struct EasyChatPair easyChatPairs[5];
    u8 filler10AC[0x78];
    u8 filler1124[0xA4];
    u16 filler11C8[0x34];
};

extern struct PlayerRecords unk_2008000;
extern struct PlayerRecords unk_2018000;

#ifdef NONMATCHING
void sub_80B92AC(void)
{
    sub_80BC300();
    sub_80C045C();
    
    memcpy(unk_2018000.secretBases, recordMixingSecretBases, sizeof(unk_2018000.secretBases));
    memcpy(unk_2018000.tvShows, recordMixingTvShows, sizeof(unk_2018000.tvShows));
    memcpy(unk_2018000.filler1004, gUnknown_083D0274, 0x40);
    memcpy(unk_2018000.filler1044, gUnknown_083D0278, 0x40);
    memcpy(unk_2018000.easyChatPairs, recordMixingEasyChatPairs, 0x28);
    memcpy(gUnknown_02038738, gSaveBlock1.filler_303C, 0x38);
    memcpy(gUnknown_02038738 + 0x38, gSaveBlock1.filler_3074, 0x38);
    sub_8041324(gSaveBlock1.filler_2F9C, gUnknown_02038738);
    memcpy(unk_2018000.filler10AC, gUnknown_083D0280, 0x78);
    memcpy(unk_2018000.filler1124, gUnknown_083D0284, 0xA4);
    
    if(GetMultiplayerId() == 0)
        unk_2018000.filler11C8[0] = sub_8126338();
}
#else
__attribute__((naked))
void sub_80B92AC(void)
{
    asm(".syntax unified\n\
    push {r4-r6,lr}\n\
	bl sub_80BC300\n\
	bl sub_80C045C\n\
	ldr r6, _080B9364 @ =0x02018000\n\
	ldr r0, _080B9368 @ =recordMixingSecretBases\n\
	ldr r1, [r0]\n\
	movs r2, 0xC8\n\
	lsls r2, 4\n\
	adds r0, r6, 0\n\
	bl memcpy\n\
	movs r1, 0xC8\n\
	lsls r1, 4\n\
	adds r0, r6, r1\n\
	ldr r1, _080B936C @ =recordMixingTvShows\n\
	ldr r1, [r1]\n\
	movs r2, 0xE1\n\
	lsls r2, 2\n\
	bl memcpy\n\
	ldr r2, _080B9370 @ =0x00001004\n\
	adds r0, r6, r2\n\
	ldr r1, _080B9374 @ =gUnknown_083D0274\n\
	ldr r1, [r1]\n\
	movs r2, 0x40\n\
	bl memcpy\n\
	ldr r1, _080B9378 @ =0x00001044\n\
	adds r0, r6, r1\n\
	ldr r1, _080B937C @ =gUnknown_083D0278\n\
	ldr r1, [r1]\n\
	movs r2, 0x40\n\
	bl memcpy\n\
	ldr r2, _080B9380 @ =0x00001084\n\
	adds r0, r6, r2\n\
	ldr r1, _080B9384 @ =recordMixingEasyChatPairs\n\
	ldr r1, [r1]\n\
	movs r2, 0x28\n\
	bl memcpy\n\
	ldr r5, _080B9388 @ =gUnknown_02038738\n\
	ldr r4, _080B938C @ =gSaveBlock1\n\
	ldr r0, _080B9390 @ =0x0000303c\n\
	adds r1, r4, r0\n\
	adds r0, r5, 0\n\
	movs r2, 0x38\n\
	bl memcpy\n\
	ldr r2, _080B9394 @ =0x00003074\n\
	adds r1, r4, r2\n\
	adds r0, r5, 0\n\
	adds r0, 0x38\n\
	movs r2, 0x38\n\
	bl memcpy\n\
	ldr r0, _080B9398 @ =0x00002f9c\n\
	adds r4, r0\n\
	adds r0, r4, 0\n\
	adds r1, r5, 0\n\
	bl sub_8041324\n\
	ldr r1, _080B939C @ =0x000010ac\n\
	adds r0, r6, r1\n\
	ldr r1, _080B93A0 @ =gUnknown_083D0280\n\
	ldr r1, [r1]\n\
	movs r2, 0x78\n\
	bl memcpy\n\
	ldr r2, _080B93A4 @ =0x00001124\n\
	adds r0, r6, r2\n\
	ldr r1, _080B93A8 @ =gUnknown_083D0284\n\
	ldr r1, [r1]\n\
	movs r2, 0xA4\n\
	bl memcpy\n\
	bl GetMultiplayerId\n\
	lsls r0, 24\n\
	cmp r0, 0\n\
	bne _080B935C\n\
	bl sub_8126338\n\
	ldr r2, _080B93AC @ =0x000011c8\n\
	adds r1, r6, r2\n\
	strh r0, [r1]\n\
_080B935C:\n\
	pop {r4-r6}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_080B9364: .4byte 0x02018000\n\
_080B9368: .4byte recordMixingSecretBases\n\
_080B936C: .4byte recordMixingTvShows\n\
_080B9370: .4byte 0x00001004\n\
_080B9374: .4byte gUnknown_083D0274\n\
_080B9378: .4byte 0x00001044\n\
_080B937C: .4byte gUnknown_083D0278\n\
_080B9380: .4byte 0x00001084\n\
_080B9384: .4byte recordMixingEasyChatPairs\n\
_080B9388: .4byte gUnknown_02038738\n\
_080B938C: .4byte gSaveBlock1\n\
_080B9390: .4byte 0x0000303c\n\
_080B9394: .4byte 0x00003074\n\
_080B9398: .4byte 0x00002f9c\n\
_080B939C: .4byte 0x000010ac\n\
_080B93A0: .4byte gUnknown_083D0280\n\
_080B93A4: .4byte 0x00001124\n\
_080B93A8: .4byte gUnknown_083D0284\n\
_080B93AC: .4byte 0x000011c8\n\
    .syntax divided\n");
}
#endif

#undef NONMATCHING

void sub_80B93B0(u32 a)
{
    sub_80BD674(unk_2008000.secretBases, sizeof(struct PlayerRecords), a);
    sub_80BFD44(unk_2008000.tvShows, sizeof(struct PlayerRecords), a);
    sub_80C0514(unk_2008000.filler1004, sizeof(struct PlayerRecords), a);
    sub_80B9B1C(unk_2008000.filler1044, sizeof(struct PlayerRecords), a);
    //UB: Too many arguments for function "sub_80FA4E4"
    sub_80FA4E4(unk_2008000.easyChatPairs, sizeof(struct PlayerRecords), a);
    sub_80B9C6C(unk_2008000.filler10AC, sizeof(struct PlayerRecords), a, unk_2008000.tvShows);
    sub_80B9B70(unk_2008000.filler1124, sizeof(struct PlayerRecords), a);
    sub_80B9F3C(unk_2008000.filler11C8, a);
}

void sub_80B9450(u8 taskId)
{
    gTasks[taskId].data[0]++;
    if(gTasks[taskId].data[0] == 50)
    {
        PlaySE(SE_W213);
        gTasks[taskId].data[0] = 0;
    }
}

#define TD_STATE 0

void sub_80B9484(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;
    
    switch(taskData[TD_STATE])
    {
    case 0:
        sub_8007270(gUnknown_0202E8CE);
        VarSet(0x4000, 1);
        gUnknown_03000718 = 0;
        sub_80B92AC();
        CreateRecordMixingSprite();
        taskData[TD_STATE] = 1;
        taskData[10] = CreateTask(sub_80B95F0, 0x50);
        taskData[15] = CreateTask(sub_80B9450, 0x51);
        break;
    case 1:
        if(!gTasks[taskData[10]].isActive)
        {
            taskData[TD_STATE] = 2;
            FlagSet(0x834);
            DestroyRecordMixingSprite();
            DestroyTask(taskData[15]);
        }
        break;
    case 2:
        taskData[10] = CreateTask(sub_80BA00C, 10);
        taskData[TD_STATE] = 3;
        PlaySE(SE_W226);
        break;
    case 3:
        if(!gTasks[taskData[10]].isActive)
        {
            taskData[TD_STATE] = 4;
            taskData[10] = sub_8083664();
            sub_80720B0();
            MenuPrint(gOtherText_MixingComplete, 2, 15);
            taskData[8] = 0;
        }
        break;
    case 4:
        taskData[8]++;
        if(taskData[8] > 60)
            taskData[TD_STATE] = 5;
        break;
    case 5:
        if(!gTasks[taskData[10]].isActive)
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
    
    switch(task->data[TD_STATE])
    {
    case 0:
        sub_80B9A78();
        MenuDisplayMessageBox();
        MenuPrint(gOtherText_MixingRecordsWithFriend, 2, 15);
        task->data[8] = 0x708;
        task->data[TD_STATE] = 0x190;
        ClearLinkCallback_2();
        break;
    case 100:
        task->data[12]++;
        if(task->data[12] > 20)
        {
            task->data[12] = 0;
            task->data[TD_STATE] = 101;
        }
        break;
    case 101:
    {
        u8 players = GetLinkPlayerCount_2();
        
        if(IsLinkMaster() == 1)
        {
            if(players == sub_800820C())
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
        if(sub_800820C() == GetLinkPlayerCount_2())
        {
            if(++task->data[12] > GetLinkPlayerCount_2() * 30)
            {
                sub_8007F4C();
                task->data[TD_STATE] = 1;
            }
        }
        break;
    case 301:
        if(sub_800820C() == GetLinkPlayerCount_2())
            task->data[TD_STATE] = 1;
        break;
    case 400:
        task->data[12]++;
        if(task->data[12] > 20)
        {
            task->data[TD_STATE] = 1;
            task->data[12] = 0;
        }
        break;
    case 1:
        if(gReceivedRemoteLinkPlayers)
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
        task->func = sub_80B97DC;
        StorePtrInTaskData(&unk_2018000, &task->data[2]);
        subTaskId = CreateTask(Task_CopyRecvBuffer, 0x50);
        task->data[10] = subTaskId;
        gTasks[subTaskId].data[0] = taskId;
        //StorePtrInTaskData((void*)0x2008000, &gTasks[subTaskId].data[5]);
        StorePtrInTaskData((u8 *)&unk_2018000 - 0x10000, &gTasks[subTaskId].data[5]);
        break;
    }
    case 5:
        task->data[10]++;
        if(task->data[10] > 60)
        {
            task->data[10] = 0;
            task->data[TD_STATE] = 2;
        }
        break;
    }
}

void sub_80B97DC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    
    switch(task->data[TD_STATE])
    {
        case 0: //Copy record data to send buffer
        {
            void *recordData = (u8 *)LoadPtrFromTaskData(&task->data[2]) + BUFFER_CHUNK_SIZE * task->data[4];
            
            memcpy(gBlockSendBuffer, recordData, BUFFER_CHUNK_SIZE);
            task->data[TD_STATE]++;
            break;
        }
        case 1:
            if(GetMultiplayerId() == 0)
                sub_8007E9C(1);
            task->data[TD_STATE]++;
            break;
        case 2:
            break;
        case 3:
            task->data[4]++;
            if((u16)task->data[4] == 24)
                task->data[TD_STATE]++;
            else
                task->data[TD_STATE] = 0;
            break;
        case 4:
            if(!gTasks[task->data[10]].isActive)
                task->func = sub_80B9A1C;
    }
}

void Task_CopyRecvBuffer(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    s32 recvStatus = GetBlockReceivedStatus();
    u32 sp8 = 0;
    
    if(recvStatus == sub_8008198())
    {
        u8 player;
        
        for(player = 0; player < GetLinkPlayerCount(); player++)
        {
            //_080B98D4
            u8 *ptr;
            void *src;
            u8 *dst;
            
            if((recvStatus >> player) & 1)
            {
                ptr = LoadPtrFromTaskData(&task->data[5]);
                dst = ptr + task->data[player + 1] * BUFFER_CHUNK_SIZE + player * sizeof(struct PlayerRecords);
                src = GetPlayerRecvBuffer(player);
                if((u32)(task->data[player + 1] + 1) * BUFFER_CHUNK_SIZE > sizeof(struct PlayerRecords))
                    memcpy(dst, src, sizeof(struct PlayerRecords) - task->data[player + 1] * BUFFER_CHUNK_SIZE);
                else
                    memcpy(dst, src, BUFFER_CHUNK_SIZE);
                //_080B993C
                ResetBlockReceivedFlag(player);
                task->data[player + 1]++;
                if((u16)task->data[player + 1] == 0x18)
                    sp8 = (u8)(sp8 + 1);
            }
        }
        //line 828
        gTasks[task->data[0]].data[0]++;
    }
    //_080B998A
    if(sp8 == GetLinkPlayerCount())
        DestroyTask(taskId);
}

void sub_80B99B4(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    
    if(!gTasks[task->data[10]].isActive)
        DestroyTask(taskId);
}

void sub_80B99E8(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    
    task->func = sub_80B99B4;
    if(gUnknown_03000718 == 1)
        sub_80B93B0(task->data[5]);
}

void sub_80B9A1C(u8 taskId)
{
    gTasks[taskId].func = sub_80B99E8;
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
    
    switch(players)
    {
    case 2:
        for(i = 0; i < 2; i++)
            a[i] = gUnknown_083D0288[i];
        break;
    case 3:
        id = GetLinkPlayerTrainerId(0) % 2;
        for(i = 0; i < 3; i++)
            a[i] = gUnknown_083D028A[id][i];
        break;
    case 4:
        id = GetLinkPlayerTrainerId(0) % 9;
        for(i = 0; i < 4; i++)
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

#ifdef NONMATCHING

void sub_80B9BC4(u32 a, u32 b, u32 c, u32 d)
{
    //ToDo: Figure out what this strange stack usage is
}

#else
__attribute__((naked))
void sub_80B9BC4(u32 a, u32 b, u32 c, u32 d)
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
    
    for(i = 0; i < 0x100; i++)
        r2 += a[i];
    return r2;
}

struct UnkStruct1
{
    u8 unk0[4];
    u8 unk4[4];
    u8 unk8[4];
    u8 fillerC[0x10];
    u8 unk1C[4][2];
    u8 filler24[8];
    void *unk2C;
    u32 unk30;
    u32 unk34;
    void *unk38;
    u32 unk3C;
    u32 unk40;
    u8 filler44[4];
    u32 unk48;
    u32 unk4C;
    u32 unk50;
    
};

/*
//Not finished
extern void sub_80B9C6C(void *a, u32 b, u8 c, void *d)
{
    struct UnkStruct1 s;
    u16 r8;
    u16 r3;
    
    s.unk2C = a;
    s.unk30 = b;
    s.unk38 = d;
    s.unk34 = c;
    s.unk40 = Random();
    SeedRng(gLinkPlayers[0].trainerId);
    r8 = GetLinkPlayerCount();
    r3 = 0;
    
    s.unk4C = 12;
    
    while(r3 < 4)
    {

        s.unk4[r3] |= 0xFF;
        s.unk8[r3] = 0;
        
        s.unk1C[r3][0] = 0;
        s.unk1C[r3][1] = 0;
        r3++;
    }
    s.unk3C = 0;
    r3 = 0;
    s.unk50 = r8 << 16;
    s.unk48 = s.unk30 * s.unk34;
    
    if(s.unk3C < r8)
    {
        do  //_080B9D00
        {
            u32 *r6 = (u32 *)(s.unk2C + s.unk30 * r3);
            if(r6[0x1C] != 0 && r6[0x1C] > 0)
            {
                
            }
            //_080B9D3C
        }
        while(r3 < r8);
    }
    //_080B9D46
}
*/

