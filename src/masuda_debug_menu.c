#include "global.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "task.h"
#include "link.h"

#define BIT(n) (1 << (n))

extern u8 gUnknown_0203869A;
extern u8 gUnknown_0203869B;
extern u8 gUnknown_02038695;
extern u16 gScriptContestCategory;
extern u8 (*gCallback_03004AE8)(void);
extern void sub_80AF668(void);
extern void sub_80C2358(void);
extern void sub_8071C20(void);
extern void sub_80AA10C(void);
extern void sub_80A9C98(u8);
extern void sub_80C8734(void);
extern void sub_80A9CC0(u8);
extern void sub_80C88AC(u8);
extern void sub_80A9CDC(u8);
extern void sub_80C8E1C(u8);
extern void sub_80A9D58(u8);
extern void sub_80C8EBC(u8);
extern void sub_80A9DBC(u8);
extern u8 sub_80C4B34(u8 *);
extern void sub_80B0F28(u8);
extern void sub_80C8F34(u8);
extern void sub_80A9DD8(u8);
extern void sub_80A9F10(u8);

extern struct Window gMenuWindow;

extern u16 gUnknown_030042A4;
extern u16 gUnknown_030042A0;
extern u16 gUnknown_030042C0;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_03004288;
extern u16 gUnknown_03004280;
extern u16 gUnknown_030041B0;
extern u16 gUnknown_030041B8;

extern u32 gUnknown_083C9228;

extern bool8 gReceivedRemoteLinkPlayers;
extern u16 gBlockRecvBuffer[MAX_LINK_PLAYERS][BLOCK_BUFFER_SIZE / 2];

struct DebugMenuAction
{
   u8 *text;
   u8 (*func)(void);
};

extern struct DebugMenuAction gMasudaDebugMenuActions[];

s8 sub_80A9B78(void);
void sub_80A9BE4(u8 taskId);
void sub_80A9E04(u8 taskId);
void sub_80A9E3C(u8 taskId);
void sub_80A9ED8(u8);
void sub_80A9E80(u8);

u8 unref_sub_80A9B28(void)
{
	MenuZeroFillScreen();
	MenuDrawTextWindow(0, 0, 17, 18);
	PrintMenuItems(1, 1, 7, gMasudaDebugMenuActions);
	InitMenu(0, 1, 1, 7, 0, 16);
	gCallback_03004AE8 = sub_80A9B78;
	return 0;
}

s8 sub_80A9B78(void)
{
	s8 choice = ProcessMenuInput();
	
    switch(choice)
    {
	case -2:
        return 0;
	default:
        gCallback_03004AE8 = gMasudaDebugMenuActions[choice].func;
        return 0;
	case -1:
        sub_8071C20();
        return 1;
    }
}

s8 sub_80A9BBC(void)
{
	BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, 0);
	CreateTask(sub_80A9BE4, 0xFF);
	return 1;
}

void sub_80A9BE4(u8 taskId)
{
	if(!gPaletteFade.active)
	{
		DestroyTask(taskId);

		if(!(gUnknown_0203869A & 1))
			sub_80AF668();

		sub_80C2358();
	}
}

s8 sub_80A9C1C(void)
{
	gUnknown_0203869A = 0;
	sub_80AA10C();
	return 0;
}

s8 sub_80A9C34(void)
{
	sub_80AA10C();
	return 0;
}

s8 sub_80A9C40(void)
{
	u8 newTaskId;
	u8 newTaskId2;
	
	newTaskId = CreateTask(sub_80A9E3C, 0);
	SetTaskFuncWithFollowupFunc(newTaskId, sub_80A9E3C, sub_80A9C98);
	newTaskId2 = CreateTask(sub_80A9E04, 1);
	gTasks[newTaskId2].data[10] = newTaskId;
	gTasks[newTaskId].data[10] = newTaskId2;
	return 1;
}

void sub_80A9C98(u8 taskId)
{
	sub_80AE098(0);
	SetTaskFuncWithFollowupFunc(taskId, sub_80C8734, sub_80A9CC0);
}

void sub_80A9CC0(u8 taskId)
{
	SetTaskFuncWithFollowupFunc(taskId, sub_80C88AC, sub_80A9CDC);
}

void sub_80A9CDC(u8 taskId)
{
	SetTaskFuncWithFollowupFunc(taskId, sub_80C8E1C, sub_80A9D58);
}

void sub_80A9CF8(u8 taskId)
{
	if(gReceivedRemoteLinkPlayers == FALSE)
	{
		DestroyTask(gTasks[taskId].data[10]);
		DestroyTask(taskId);
		sub_8071C20();
	}
}

void sub_80A9D30(u8 taskId)
{
	sub_800832C();
	gTasks[taskId].func = sub_80A9CF8;
}

void sub_80A9D58(u8 taskId)
{
   int i;
   u8 dest[4];

   for(i = 0; i < 4; i++)
       dest[i] = gTasks[taskId].data[5 + i];

   gUnknown_0203869B = sub_80C4B34(&dest);
   sub_80AE82C((u8)gScriptContestCategory);
   sub_80B0F28(0);
   SetTaskFuncWithFollowupFunc(taskId, sub_80C8EBC, sub_80A9DBC);
}

void sub_80A9DBC(u8 taskId)
{
	SetTaskFuncWithFollowupFunc(taskId, sub_80C8F34, sub_80A9DD8);
}

void sub_80A9DD8(u8 taskId)
{
	DestroyTask(gTasks[taskId].data[10]);
	DestroyTask(taskId);
	sub_8071C20();
}

void sub_80A9E04(u8 taskId)
{
	if(gMain.newKeys == 2)
		gTasks[(u8)gTasks[taskId].data[10]].func = sub_80A9D30;
}

void sub_80A9E3C(u8 taskId)
{
	u8 i;
	
	OpenLink();

	for(i = 0; i < 4; i++)
		gBlockRecvBuffer[i][0] = 255;

	gTasks[taskId].data[0] = 0;
	gTasks[taskId].func = sub_80A9E80;
}

void sub_80A9E80(u8 taskId)
{
	TaskFunc func;

	if(gTasks[taskId].data[0] < 10)
		gTasks[taskId].data[0]++;
	else
	{
		if(GetLinkPlayerCount_2() > 3)
		{
			gTasks[taskId].data[0] = 0;
	
			if(IsLinkMaster())
			{
				func = sub_80A9ED8;
				gTasks[taskId].func = (TaskFunc)func;
			}
			else
			{
				func = sub_80A9F10;
				gTasks[taskId].func = (TaskFunc)func;
			}
		}
	}
}

void sub_80A9ED8(u8 taskId)
{
	gTasks[taskId].data[0] = gTasks[taskId].data[0] + 1;
	if((gTasks[taskId].data[0]) == 101)
	{
		sub_8007F4C();
		gTasks[taskId].data[0] = 0;
		gTasks[taskId].func = sub_80A9F10;
	}
}

void sub_80A9F10(u8 taskId)
{
	if(gReceivedRemoteLinkPlayers)
	{
		gUnknown_02038695 = GetMultiplayerId();
		if(GetLinkPlayerCount() == 4)
		{
			gUnknown_0203869A = 1;
			SwitchTaskToFollowupFunc(taskId);
		}
	}
}

void sub_80A9F50(void)
{
	REG_DISPCNT = DISPCNT_OBJ_1D_MAP;
	REG_DISPCNT |= DISPCNT_OBJ_ON | DISPCNT_BG0_ON;
	SetUpWindowConfig(&gWindowConfig_81E6C3C);
	InitWindowFromConfig(&gMenuWindow, &gWindowConfig_81E6C3C);
	REG_MOSAIC = 0;
	REG_BLDCNT = 0;
	REG_BLDALPHA = 0;
	REG_BLDY = 0;
	REG_BG0HOFS = 0;
	REG_BG0VOFS = 0;
	gUnknown_030042A4 = 0;
	gUnknown_030042A0 = 0;
	gUnknown_030042C0 = 0;
	gUnknown_030041B4 = 0;
	gUnknown_03004288 = 0;
	gUnknown_03004280 = 0;
	gUnknown_030041B0 = 0;
	gUnknown_030041B8 = 0;
}

/*void sub_80A9FE4(void)
{
	s32 var;
	u32 i;
	u8 ptr[5];
	int ptr2; // huh?
	
	memcpy(&ptr, &gUnknown_083C9228, 5);
	var = 0x6000000;

	for(i = 0x18000; i > 0x1000; i -= 0x1000)
	{
		ptr2 = 0;
		REG_DMA3SAD = &ptr2; // huh?
		REG_DMA3DAD = var;
		REG_DMA3CNT = 0x85000400;
		var += 0x1000;
	}
	ptr2 = 0;
	REG_DMA3SAD = &ptr2;
	REG_DMA3DAD = var;
	REG_DMA3CNT = (i >> 2) | 0x85000000;
	sub_80034D4(0x6000000, &ptr);
	LoadFontDefaultPalette(&gWindowConfig_81E6C3C);
}*/

/*
	thumb_func_start sub_80A9FE4
sub_80A9FE4: @ 80A9FE4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r1, _080AA054 @ =gUnknown_083C9228
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	add r5, sp, 0x8
	movs r6, 0
	ldr r1, _080AA058 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	mov r12, r5
	ldr r7, _080AA05C @ =0x85000400
	movs r0, 0x85
	lsls r0, 24
	mov r8, r0
_080AA012:
	str r6, [sp, 0x8]
	mov r0, r12
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080AA012
	str r6, [sp, 0x8]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xC0
	lsls r0, 19
	mov r1, sp
	bl sub_80034D4
	ldr r0, _080AA060 @ =gWindowConfig_81E6C3C
	bl LoadFontDefaultPalette
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA054: .4byte gUnknown_083C9228
_080AA058: .4byte 0x040000d4
_080AA05C: .4byte 0x85000400
_080AA060: .4byte gWindowConfig_81E6C3C
	thumb_func_end sub_80A9FE4
*/