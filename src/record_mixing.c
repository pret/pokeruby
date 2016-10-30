#include "global.h"
#include "link.h"
#include "menu.h"
#include "pokemon.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "task.h"

extern void *gUnknown_083D026C;
extern void *gUnknown_083D0270;
extern void *gUnknown_083D0274;
extern void *gUnknown_083D0278;
extern void *gUnknown_083D027C;
extern void *gUnknown_083D0280;
extern void *gUnknown_083D0284;
extern u8 gUnknown_02038738[];  //Don't know what type this is
extern u16 gUnknown_0202E8CE;
extern u8 gUnknown_03000718;
extern u8 gOtherText_MixingComplete[];
extern u8 gOtherText_MixingRecordsWithFriend[];
extern bool8 gReceivedRemoteLinkPlayers;
extern u8 gBlockSendBuffer[];

extern void sub_8041324(struct BoxPokemon *, void *);
extern void sub_80BD674(void *, u32, u8);
extern void sub_80BFD44(void *, u32, u8);
extern void sub_80C0514(void *, u32, u8);
extern void sub_80B9B1C(void *, u32, u8);
extern void sub_80FA4E4(void *, u32, u8);
extern void sub_80B9C6C(void *, u32, u8, void *);
extern void sub_80B9B70(void *, u32, u8);
extern void sub_80B9F3C(void *, u8);
extern u16 sub_8126338(void);
extern bool8 VarSet(u16, u8);
extern u8 FlagSet(u16);
extern u8 sub_8083664(void);
extern void sub_80720B0(void);

void sub_80B9484(u8);
void sub_80B95F0(u8);
void sub_80BA00C(u8);
void sub_80B97DC(u8);
void sub_80B9890(u8);
void sub_80B9A1C(u8);
u8 sub_80B9A58(void);
void sub_80B9A50(void *, u16 *);
void *sub_80B9A44(void *);

void sub_80B929C(void)
{
    sub_8083A84(sub_80B9484);
}

struct UnkStruct {
    u8 filler0[0xC80];
    u8 fillerC80[0x384];
    u8 filler1004[0x40];
    u8 filler1044[0x40];
    u8 filler1084[0x28];
    u8 filler10AC[0x78];
    u8 filler1124[0xA4];
    u16 filler11C8[1];   //Don't know how long this is
};

extern struct UnkStruct unk_2008000;
extern struct UnkStruct unk_2018000;

#ifdef NONMATCHING
void sub_80B92AC(void)
{
    sub_80BC300();
    sub_80C045C();
    
    gSaveBlock1.money;
    
    memcpy(unk_2018000.filler0, gUnknown_083D026C, 0xC80);
    memcpy(unk_2018000.fillerC80, gUnknown_083D0270, 0x384);
    memcpy(unk_2018000.filler1004, gUnknown_083D0274, 0x40);
    memcpy(unk_2018000.filler1044, gUnknown_083D0278, 0x40);
    memcpy(unk_2018000.filler1084, gUnknown_083D027C, 0x28);
    memcpy(gUnknown_02038738, gSaveBlock1.filler_303C, 0x38);
    memcpy(gUnknown_02038738 + 0x38, gSaveBlock1.filler_3074, 0x38);
    sub_8041324(gSaveBlock1.filler_2F9C, gUnknown_02038738);
    memcpy(unk_2018000.filler10AC, gUnknown_083D0280, 0x78);
    memcpy(unk_2018000.filler1124, gUnknown_083D0284, 0xA4);
    
    if(GetMultiplayerId() == 0)
    {
        unk_2018000.unk11C8 = sub_8126338();
    }
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
	ldr r0, _080B9368 @ =gUnknown_083D026C\n\
	ldr r1, [r0]\n\
	movs r2, 0xC8\n\
	lsls r2, 4\n\
	adds r0, r6, 0\n\
	bl memcpy\n\
	movs r1, 0xC8\n\
	lsls r1, 4\n\
	adds r0, r6, r1\n\
	ldr r1, _080B936C @ =gUnknown_083D0270\n\
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
	ldr r1, _080B9384 @ =gUnknown_083D027C\n\
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
_080B9368: .4byte gUnknown_083D026C\n\
_080B936C: .4byte gUnknown_083D0270\n\
_080B9370: .4byte 0x00001004\n\
_080B9374: .4byte gUnknown_083D0274\n\
_080B9378: .4byte 0x00001044\n\
_080B937C: .4byte gUnknown_083D0278\n\
_080B9380: .4byte 0x00001084\n\
_080B9384: .4byte gUnknown_083D027C\n\
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


void sub_80B93B0(u32 a)
{
    sub_80BD674(unk_2008000.filler0, 0x1230, a);
    sub_80BFD44(unk_2008000.fillerC80, 0x1230, a);
    sub_80C0514(unk_2008000.filler1004, 0x1230, a);
    sub_80B9B1C(unk_2008000.filler1044, 0x1230, a);
    sub_80FA4E4(unk_2008000.filler1084, 0x1230, a);
    sub_80B9C6C(unk_2008000.filler10AC, 0x1230, a, unk_2008000.fillerC80);
    sub_80B9B70(unk_2008000.filler1124, 0x1230, a);
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

void sub_80B9484(u8 taskId)
{
    s16 *taskData = gTasks[taskId].data;
    
    switch(taskData[0])
    {
    case 0:
        sub_8007270(gUnknown_0202E8CE);
        VarSet(0x4000, 1);
        gUnknown_03000718 = 0;
        sub_80B92AC();
        CreateRecordMixingSprite();
        taskData[0] = 1;
        taskData[10] = CreateTask(sub_80B95F0, 0x50);
        taskData[15] = CreateTask(sub_80B9450, 0x51);
        break;
    case 1:
        if(!gTasks[taskData[10]].isActive)
        {
            taskData[0] = 2;
            FlagSet(0x834);
            DestroyRecordMixingSprite();
            DestroyTask(taskData[15]);
        }
        break;
    case 2:
        taskData[10] = CreateTask(sub_80BA00C, 10);
        taskData[0] = 3;
        PlaySE(SE_W226);
        break;
    case 3:
        if(!gTasks[taskData[10]].isActive)
        {
            taskData[0] = 4;
            taskData[10] = sub_8083664();
            sub_80720B0();
            MenuPrint(gOtherText_MixingComplete, 2, 15);
            taskData[8] = 0;
        }
        break;
    case 4:
        taskData[8]++;
        if(taskData[8] > 0x3C)
            taskData[0] = 5;
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
    
    switch(task->data[0])
    {
        case 0:
            sub_80B9A78();
            MenuDisplayMessageBox();
            MenuPrint(gOtherText_MixingRecordsWithFriend, 2, 15);
            task->data[8] = 0x708;
            task->data[0] = 0x190;
            ClearLinkCallback_2();
            break;
        case 100:
            task->data[12]++;
            if(task->data[12] > 0x14)
            {
                task->data[12] = 0;
                task->data[0] = 0x65;
            }
            break;
        case 0x65:
        {
            u8 players = GetLinkPlayerCount_2();
            
            if(IsLinkMaster() == 1)
            {
                if(players == sub_800820C())
                {
                    PlaySE(0x15);
                    task->data[0] = 0xC9;
                    task->data[12] = 0;
                }
            }
            else
            {
                //_080B96C2
                PlaySE(0x16);
                task->data[0] = 0x12D;
            }
            break;
        }
        case 0xC9:
        {
            //u8 r4 = sub_800820C();
            
            if(sub_800820C() == GetLinkPlayerCount_2())
            {
                //task->data[12]++;
                
                if(++task->data[12] > GetLinkPlayerCount_2() * 30)
                {
                    sub_8007F4C();
                    task->data[0] = 1;
                }
            }
            break;
        }
        case 0x12D:
            if(sub_800820C() == GetLinkPlayerCount_2())
                task->data[0] = 1;
            break;
        case 0x190:
            task->data[12]++;
            if(task->data[12] > 0x14)
            {
                task->data[0] = 1;
                task->data[12] = 0;
            }
            break;
        case 1:
            if(gReceivedRemoteLinkPlayers)
            {
                ConvertIntToDecimalStringN(gStringVar1, sub_80B9A58(), 2, 2);
                task->data[0] = 5;
            }
            break;
        case 2:
        {
            u8 subTaskId;
            
            task->data[6] = GetLinkPlayerCount_2();
            task->data[0] = 0;
            task->data[5] = sub_80B9A58();
            task->func = sub_80B97DC;
            sub_80B9A50(unk_2018000.filler0, &task->data[2]);
            subTaskId = CreateTask(sub_80B9890, 0x50);
            task->data[10] = subTaskId;
            gTasks[subTaskId].data[0] = taskId;
            //sub_80B9A50(unk_2008000.filler0, &gTasks[subTaskId].data[5]);
            sub_80B9A50(unk_2018000.filler0 - 0x10000, &gTasks[subTaskId].data[5]);
            break;
        }
        case 5:
            task->data[10]++;
            if(task->data[10] > 0x3C)
            {
                task->data[10] = 0;
                task->data[0] = 2;
            }
            break;
    }
}

void sub_80B97DC(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    
    switch(task->data[0])
    {
        case 0:
        {
            void *src = (u8 *)sub_80B9A44(&task->data[2]) + 0xC8 * task->data[4];
            
            memcpy(gBlockSendBuffer, src, 0xC8);
            task->data[0]++;
            break;
        }
        case 1:
            if(GetMultiplayerId() == 0)
                sub_8007E9C(1);
            task->data[0]++;
            break;
        case 2:
            break;
        case 3:
            task->data[4]++;
            if((u16)task->data[4] == 0x18)
                task->data[0]++;
            else
                task->data[0] = 0;
            break;
        case 4:
            if(!gTasks[task->data[10]].isActive)
                task->func = sub_80B9A1C;
    }
}
