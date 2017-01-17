#include "global.h"
#include "asm.h"
#include "item.h"
#include "main.h"
#include "menu.h"
#include "palette.h"
#include "script.h"
#include "sound.h"
#include "string_util.h"
#include "task.h"
#include "weather.h"

extern void DisplayItemMessageOnField(u8, u8*, TaskFunc, u16);
extern void ItemStorageMenuProcessInput(u8);
extern void DoPlayerPCDecoration(u8);
extern void BuyMenuFreeMemory(void);
extern void DestroyVerticalScrollIndicator(u8);
extern u8 sub_813AF3C(void);
extern void sub_813AF78(void);
extern void sub_813A240(u8);
extern void sub_813B108(u8);
extern void sub_813B174(u8);
extern void sub_80A6A30(void);
extern u8 sub_807D770(void);
extern void sub_813A280(u8);
extern void sub_813AE6C(u8, u8);
extern void sub_813A240(u8);
extern void sub_813AD58(u16);
extern void sub_813AE0C(u8);
extern void sub_813ABE8(u8);
extern void sub_813AA30(u8, u8);
extern void sub_813A4B4(u8);
extern void sub_813A468(u8);

extern u8 gOtherText_NoItems[];

extern u16 gNewGamePCItems[];

extern u8 gOtherText_WhatWillYouDo[];
extern u8 gOtherText_NoMailHere[];

extern u8 *gUnknown_02039314;
extern struct MenuAction gUnknown_08406298[];
extern u8 gUnknown_084062B8[];
extern u8 gUnknown_084062BC[];
extern u8 gUnknown_030007B4;
extern u8 unk_201FE00[];

extern u8 gUnknown_08152850;
extern u8 gUnknown_08152C75;

extern u32 gUnknown_08406288[];
extern const struct MenuAction gUnknown_084062C0[];

void InitPlayerPCMenu(u8 taskId);
void PlayerPCProcessMenuInput(u8 taskId);
void InitItemStorageMenu(u8);
void ItemStorageMenuPrint(u8 *);

void NewGameInitPCItems(void)
{
    u8 i = 0;

    ClearItemSlots(gSaveBlock1.pcItems, 0x32);

    while (gNewGamePCItems[i * 2] && (gNewGamePCItems + 1)[i * 2])
    {
        if(AddPCItem(gNewGamePCItems[i * 2], (gNewGamePCItems + 1)[i * 2]) != 1)
            break;
        i++;
    }
}

void BedroomPC(void)
{
	u8 taskId;
	
	gUnknown_02039314 = gUnknown_084062B8;
	gUnknown_030007B4 = 4;
	taskId = CreateTask(TaskDummy, 0);
	DisplayItemMessageOnField(taskId, gOtherText_WhatWillYouDo, InitPlayerPCMenu, 0);
}

void PlayerPC(void)
{
	u8 taskId;
	
	gUnknown_02039314 = gUnknown_084062BC;
	gUnknown_030007B4 = 3;
	taskId = CreateTask(TaskDummy, 0);
	DisplayItemMessageOnField(taskId, gOtherText_WhatWillYouDo, InitPlayerPCMenu, 0);
}

void InitPlayerPCMenu(u8 taskId)
{
	MenuDrawTextWindow(0, 0, 10, gUnknown_030007B4 * 2 + 1);
	PrintMenuItemsReordered(1, 1, gUnknown_030007B4, gUnknown_08406298, gUnknown_02039314);
	InitMenu(0, 1, 1, gUnknown_030007B4, 0, 9);
	gTasks[taskId].func = PlayerPCProcessMenuInput;
}

void PlayerPCProcessMenuInput(u8 taskId)
{
	if(gMain.newAndRepeatedKeys & 0x40)
	{
		PlaySE(5);
		MoveMenuCursor(-1);
	}
	else if(gMain.newAndRepeatedKeys & 0x80)
	{
		PlaySE(5);
		MoveMenuCursor(1);
	}
	else if(gMain.newKeys & 0x1)
	{
		sub_8072DEC();
		PlaySE(5);
		gUnknown_08406298[gUnknown_02039314[GetMenuCursorPos()]].func(taskId);
	}
	else if(gMain.newKeys & 0x2)
	{
		sub_8072DEC();
		PlaySE(5);
		gUnknown_08406298[gUnknown_030007B4[gUnknown_02039314 - 1]].func(taskId);
	}
}

void ReshowPlayerPC(u8 var)
{
	DisplayItemMessageOnField(var, gOtherText_WhatWillYouDo, InitPlayerPCMenu, 0);
}

void PlayerPC_ItemStorage(u8 taskId)
{
	InitItemStorageMenu(0);
	gTasks[taskId].func = ItemStorageMenuProcessInput;
}

void PlayerPC_Mailbox(u8 taskId)
{
	MenuZeroFillWindowRect(0, 0, 10, 9);
	unk_201FE00[3] = sub_813AF3C();
	if(!unk_201FE00[3])
		DisplayItemMessageOnField(taskId, gOtherText_NoMailHere, ReshowPlayerPC, 0);
	else
	{
		unk_201FE00[0] = 0;
		unk_201FE00[2] = 0;
		sub_813AF78();
		sub_813A240(taskId);
		sub_813B108(taskId);
		gTasks[taskId].func = sub_813B174;
	}
}

void PlayerPC_Decoration(u8 var)
{
	MenuZeroFillWindowRect(0, 0, 10, 9);
	DoPlayerPCDecoration(var);
}

void PlayerPC_TurnOff(u8 taskId)
{
	if(gUnknown_030007B4 == 4)
	{
		MenuZeroFillWindowRect(0, 0, 0x1D, 0x13);
		if(!gSaveBlock2.playerGender)
			ScriptContext1_SetupScript(&gUnknown_08152850); // male
		else
			ScriptContext1_SetupScript(&gUnknown_08152C75); // female
	}
	else
	{
		MenuZeroFillWindowRect(0, 0, 10, 9);
		EnableBothScriptContexts();
	}
	DestroyTask(taskId);
}

void InitItemStorageMenu(u8 var)
{
	MenuZeroFillWindowRect(0, 0, 10, 9);
	MenuDrawTextWindow(0, 0, 11, 9);
	PrintMenuItems(1, 1, 4, gUnknown_084062C0);
	InitMenu(0, 1, 1, 4, var, 10);
	ItemStorageMenuPrint((u8 *)gUnknown_08406288[var]);
}

void ItemStorageMenuPrint(u8 *textPtr)
{
	MenuFillWindowRectWithBlankTile(2, 15, 27, 18);
	MenuPrint(textPtr, 2, 15);
}

void ItemStorageMenuProcessInput(u8 var)
{
	if(gMain.newAndRepeatedKeys & 0x40)
	{
		PlaySE(5);
		MoveMenuCursor(-1);
		ItemStorageMenuPrint((u8 *)gUnknown_08406288[GetMenuCursorPos()]);
	}
	else if(gMain.newAndRepeatedKeys & 0x80)
	{
		PlaySE(5);
		MoveMenuCursor(1);
		ItemStorageMenuPrint((u8 *)gUnknown_08406288[GetMenuCursorPos()]);
	}
	else if(gMain.newKeys & 0x1)
	{
		PlaySE(5);
		gUnknown_084062C0[GetMenuCursorPos()].func(var);
	}
	else if(gMain.newKeys & 0x2)
	{
		sub_8072DEC();
		PlaySE(5);
		gUnknown_084062C0[3].func(var);
	}	
}

void Task_ItemStorage_Deposit(u8 taskId)
{
	if(!gPaletteFade.active)
	{
		sub_80A6A30();
		DestroyTask(taskId);
	}
}

void ItemStorage_Deposit(u8 taskId)
{
	gTasks[taskId].func = Task_ItemStorage_Deposit;
	fade_screen(1, 0);
}

void sub_813A0C8(u8 taskId)
{
	if(sub_807D770() == 1)
		gTasks[taskId].func = ItemStorageMenuProcessInput;
}

void sub_813A0F8(void)
{
	MenuDisplayMessageBox();
	InitItemStorageMenu(1);
	CreateTask(sub_813A0C8, 0);
	pal_fill_black();
}

void ItemStorage_Withdraw(u8 taskId)
{
	u8 var;
	u16 * data = gTasks[taskId].data;
	
	sub_8072DEC();
	MenuZeroFillWindowRect(0, 0, 11, 9);
	var = CountUsedPCItemSlots();
	data[2] = var;

	if(var)
	{
		MenuZeroFillWindowRect(0, 14, 29, 19);
		data[6] = 0;
		data[0] = 0;
		data[1] = 0;
		sub_813A240(taskId);
		sub_813AE6C(taskId, 0);
		gTasks[taskId].func = sub_813A280;
	}
	else
		DisplayItemMessageOnField(taskId, gOtherText_NoItems, PlayerPC_ItemStorage, 0);
}

void ItemStorage_Toss(u8 taskId)
{
	u8 var;
	u16 * data = gTasks[taskId].data;
	
	sub_8072DEC();
	MenuZeroFillWindowRect(0, 0, 11, 9);
	var = CountUsedPCItemSlots();
	data[2] = var;

	if(var)
	{
		MenuZeroFillWindowRect(0, 14, 29, 19);
		data[6] = 2;
		data[0] = 0;
		data[1] = 0;
		sub_813A240(taskId);
		sub_813AE6C(taskId, 2);
		gTasks[taskId].func = sub_813A280;
	}
	else
		DisplayItemMessageOnField(taskId, gOtherText_NoItems, PlayerPC_ItemStorage, 0);
}

void ItemStorage_Exit(u8 var)
{
	sub_8072DEC();
	MenuZeroFillWindowRect(0, 0, 11, 9);
	ReshowPlayerPC(var);
}

void sub_813A240(u8 taskId)
{
	s16 *data = gTasks[taskId].data;

	if (data[2] > 7)
		data[4] = 8;
	else
		data[4] = data[2] + 1;

	if(unk_201FE00[3] > 7)
		unk_201FE00[1] = 8;
	else
		unk_201FE00[1] = unk_201FE00[3] + 1;
}

#ifdef NONMATCHING
void sub_813A280(u8 taskId)
{
	s16 *data = gTasks[taskId].data;
	
	if(gMain.newAndRepeatedKeys & 0x40)
	{
		if(data[0])
		{
			PlaySE(5);
			data[0] = MoveMenuCursor(-1);
			if(!data[9])
			{
				if(data[1] + data[0] == data[2])
				{
					sub_813AD58(0xFFFF);
					return;
				}
				sub_813AD58(gSaveBlock1.pcItems[data[1] + data[0]].itemId);
			}
			return;
		}
		if(!data[1])
			return;
		PlaySE(5);
		sub_813AE0C(taskId);
		if(data[9])
			MoveMenuCursor(0);
		return;
	}
	if(!(gMain.newAndRepeatedKeys & 0x80))
	{
		if(gMain.newKeys & 0x4)
		{
			if(!data[9])
			{
				if(data[0] + data[1] != data[2])
				{
					PlaySE(5);
					data[9] = 1;
					data[8] = data[0] + data[1];
					sub_813AD58(0xFFF7);
				}
				sub_813ABE8(taskId);
				return;
			}
			PlaySE(5);
			sub_813AA30(taskId, 0);
			sub_813AE0C(taskId);
			return;
		}
		if(gMain.newKeys & 0x1)
		{
			PlaySE(5);
			if(data[9])
			{
				sub_813AA30(taskId, 0);
				sub_813AE0C(taskId);
				return;
			}
			if(data[1] + data[0] != data[2])
			{
				sub_813A4B4(taskId);
				return;
			}
		}
		else
		{
			if(!(gMain.newKeys & 0x2))
				return;
			PlaySE(5);
			if(data[9])
			{
				sub_813AA30(taskId, 1);
				sub_813AE0C(taskId);
				return;
			}
			sub_8072DEC();
		}
		sub_813A468(taskId);
		return;
	}
	if(data[0] == data[4] - 1)
	{
		if(data[1] + data[0] == data[2])
			return;
		PlaySE(5);
		data[1]++;
		sub_813AE0C(taskId);
		if(data[9])
			MoveMenuCursor(0);
		return;
	}
	PlaySE(5);
	data[0] = MoveMenuCursor(1);
	if(!data[9])
	{
		if(data[1] + data[0] != data[2])
		{
			sub_813AD58(gSaveBlock1.pcItems[data[1] + data[0]].itemId);
			return;
		}
		sub_813AD58(0xFFFF);
	}
}
#else
__attribute__((naked))
void sub_813A280(u8 taskId)
{
	asm(".syntax unified\n\
	push {r4-r6,lr}\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	adds r6, r5, 0\n\
	lsls r0, r5, 2\n\
	adds r0, r5\n\
	lsls r0, 3\n\
	ldr r1, _0813A2DC @ =gTasks + 0x8\n\
	adds r4, r0, r1\n\
	ldr r2, _0813A2E0 @ =gMain\n\
	ldrh r1, [r2, 0x30]\n\
	movs r0, 0x40\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _0813A306\n\
	movs r1, 0\n\
	ldrsh r0, [r4, r1]\n\
	cmp r0, 0\n\
	beq _0813A2E4\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	movs r0, 0x1\n\
	negs r0, r0\n\
	bl MoveMenuCursor\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	strh r0, [r4]\n\
	ldrh r1, [r4, 0x2]\n\
	adds r1, r0\n\
	lsls r1, 16\n\
	lsrs r1, 16\n\
	movs r2, 0x12\n\
	ldrsh r0, [r4, r2]\n\
	cmp r0, 0\n\
	beq _0813A2CC\n\
	b _0813A460\n\
_0813A2CC:\n\
	lsls r0, r1, 16\n\
	asrs r1, r0, 16\n\
	movs r2, 0x4\n\
	ldrsh r0, [r4, r2]\n\
	cmp r1, r0\n\
	beq _0813A34C\n\
	b _0813A358\n\
	.align 2, 0\n\
_0813A2DC: .4byte gTasks + 0x8\n\
_0813A2E0: .4byte gMain\n\
_0813A2E4:\n\
	movs r1, 0x2\n\
	ldrsh r0, [r4, r1]\n\
	cmp r0, 0\n\
	bne _0813A2EE\n\
	b _0813A460\n\
_0813A2EE:\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	ldrh r0, [r4, 0x2]\n\
	subs r0, 0x1\n\
	strh r0, [r4, 0x2]\n\
	adds r0, r5, 0\n\
	bl sub_813AE0C\n\
	movs r2, 0x12\n\
	ldrsh r0, [r4, r2]\n\
	b _0813A394\n\
_0813A306:\n\
	movs r0, 0x80\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _0813A3A0\n\
	movs r0, 0\n\
	ldrsh r1, [r4, r0]\n\
	movs r2, 0x8\n\
	ldrsh r0, [r4, r2]\n\
	subs r0, 0x1\n\
	cmp r1, r0\n\
	beq _0813A370\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	movs r0, 0x1\n\
	bl MoveMenuCursor\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	strh r0, [r4]\n\
	ldrh r1, [r4, 0x2]\n\
	adds r1, r0\n\
	lsls r1, 16\n\
	lsrs r1, 16\n\
	movs r2, 0x12\n\
	ldrsh r0, [r4, r2]\n\
	cmp r0, 0\n\
	beq _0813A340\n\
	b _0813A460\n\
_0813A340:\n\
	lsls r0, r1, 16\n\
	asrs r1, r0, 16\n\
	movs r2, 0x4\n\
	ldrsh r0, [r4, r2]\n\
	cmp r1, r0\n\
	bne _0813A358\n\
_0813A34C:\n\
	ldr r0, _0813A354 @ =0x0000ffff\n\
	bl sub_813AD58\n\
	b _0813A460\n\
	.align 2, 0\n\
_0813A354: .4byte 0x0000ffff\n\
_0813A358:\n\
	ldr r0, _0813A36C @ =gSaveBlock1\n\
	lsls r1, 2\n\
	adds r1, r0\n\
	movs r0, 0x93\n\
	lsls r0, 3\n\
	adds r1, r0\n\
	ldrh r0, [r1]\n\
	bl sub_813AD58\n\
	b _0813A460\n\
	.align 2, 0\n\
_0813A36C: .4byte gSaveBlock1\n\
_0813A370:\n\
	movs r2, 0x2\n\
	ldrsh r0, [r4, r2]\n\
	adds r0, r1\n\
	movs r2, 0x4\n\
	ldrsh r1, [r4, r2]\n\
	cmp r0, r1\n\
	beq _0813A460\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	ldrh r0, [r4, 0x2]\n\
	adds r0, 0x1\n\
	strh r0, [r4, 0x2]\n\
	adds r0, r5, 0\n\
	bl sub_813AE0C\n\
	movs r1, 0x12\n\
	ldrsh r0, [r4, r1]\n\
_0813A394:\n\
	cmp r0, 0\n\
	beq _0813A460\n\
	movs r0, 0\n\
	bl MoveMenuCursor\n\
	b _0813A460\n\
_0813A3A0:\n\
	ldrh r1, [r2, 0x2E]\n\
	movs r0, 0x4\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _0813A3F0\n\
	movs r2, 0x12\n\
	ldrsh r0, [r4, r2]\n\
	cmp r0, 0\n\
	bne _0813A3E8\n\
	movs r1, 0\n\
	ldrsh r0, [r4, r1]\n\
	movs r2, 0x2\n\
	ldrsh r1, [r4, r2]\n\
	adds r0, r1\n\
	movs r2, 0x4\n\
	ldrsh r1, [r4, r2]\n\
	cmp r0, r1\n\
	beq _0813A3DC\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	movs r0, 0x1\n\
	strh r0, [r4, 0x12]\n\
	ldrh r0, [r4]\n\
	ldrh r1, [r4, 0x2]\n\
	adds r0, r1\n\
	strh r0, [r4, 0x10]\n\
	ldr r0, _0813A3E4 @ =0x0000fff7\n\
	bl sub_813AD58\n\
_0813A3DC:\n\
	adds r0, r5, 0\n\
	bl sub_813ABE8\n\
	b _0813A460\n\
	.align 2, 0\n\
_0813A3E4: .4byte 0x0000fff7\n\
_0813A3E8:\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	b _0813A420\n\
_0813A3F0:\n\
	movs r0, 0x1\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _0813A430\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	movs r2, 0x12\n\
	ldrsh r0, [r4, r2]\n\
	cmp r0, 0\n\
	bne _0813A420\n\
	movs r1, 0x2\n\
	ldrsh r0, [r4, r1]\n\
	movs r2, 0\n\
	ldrsh r1, [r4, r2]\n\
	adds r0, r1\n\
	movs r2, 0x4\n\
	ldrsh r1, [r4, r2]\n\
	cmp r0, r1\n\
	beq _0813A44A\n\
	adds r0, r5, 0\n\
	bl sub_813A4B4\n\
	b _0813A460\n\
_0813A420:\n\
	adds r0, r5, 0\n\
	movs r1, 0\n\
	bl sub_813AA30\n\
	adds r0, r5, 0\n\
	bl sub_813AE0C\n\
	b _0813A460\n\
_0813A430:\n\
	movs r0, 0x2\n\
	ands r0, r1\n\
	cmp r0, 0\n\
	beq _0813A460\n\
	movs r0, 0x5\n\
	bl PlaySE\n\
	movs r1, 0x12\n\
	ldrsh r0, [r4, r1]\n\
	cmp r0, 0\n\
	bne _0813A452\n\
	bl sub_8072DEC\n\
_0813A44A:\n\
	adds r0, r5, 0\n\
	bl sub_813A468\n\
	b _0813A460\n\
_0813A452:\n\
	adds r0, r6, 0\n\
	movs r1, 0x1\n\
	bl sub_813AA30\n\
	adds r0, r6, 0\n\
	bl sub_813AE0C\n\
_0813A460:\n\
	pop {r4-r6}\n\
	pop {r0}\n\
	bx r0\n\
	.syntax divided");
}
#endif

void sub_813A468(u8 taskId)
{
	BuyMenuFreeMemory();
	DestroyVerticalScrollIndicator(0);
	DestroyVerticalScrollIndicator(1);
	MenuZeroFillWindowRect(0, 0, 29, 19);
	MenuDisplayMessageBox();
	InitItemStorageMenu(gTasks[taskId].data[6]);
	gTasks[taskId].func = ItemStorageMenuProcessInput;
}

#ifdef NONMATCHING
void sub_813A4B4(u8 taskId)
{
	u16 *data = gTasks[taskId].data;
	u16 var = data[2] + data[0];

	sub_80F996C(0);
	sub_80F996C(1);
	
	if(data[6])
	{
		if(gSaveBlock1.pcItems[var].itemId == 1)
		{
			data[3] = 1;
			sub_813A794(taskId);
			return;
		}
		sub_813AD58(0xFFF7);
		data[3] = 1;
		MenuDrawTextWindow(6, 8, 13, 11);
		sub_80A418C(data[3], STR_CONV_MODE_RIGHT_ALIGN, 8, 9, 3);
		gTasks[taskId].func = sub_813A584;
		return;
	}
	if(gSaveBlock1.pcItems[var].itemId != 1)
	{
		sub_813AD58(0xFFF7);
		data[3] = 1;
		MenuDrawTextWindow(6, 8, 13, 11);
		sub_80A418C(data[3], STR_CONV_MODE_RIGHT_ALIGN, 8, 9, 3);
		gTasks[taskId].func = sub_813A584;
		return;
	}
	data[3] = 1;
	sub_813A6FC(taskId);
}
#else
__attribute__((naked))
void sub_813A4B4(u8 taskId)
{
	asm(".syntax unified\n\
	push {r4-r6,lr}\n\
	sub sp, 0x4\n\
	lsls r0, 24\n\
	lsrs r6, r0, 24\n\
	lsls r0, r6, 2\n\
	adds r0, r6\n\
	lsls r0, 3\n\
	ldr r1, _0813A500 @ =gTasks + 0x8\n\
	adds r4, r0, r1\n\
	ldrb r0, [r4, 0x2]\n\
	ldrb r1, [r4]\n\
	adds r0, r1\n\
	lsls r0, 24\n\
	lsrs r5, r0, 24\n\
	movs r0, 0\n\
	bl sub_80F996C\n\
	movs r0, 0x1\n\
	bl sub_80F996C\n\
	movs r1, 0xC\n\
	ldrsh r0, [r4, r1]\n\
	cmp r0, 0\n\
	bne _0813A518\n\
	ldr r1, _0813A504 @ =gSaveBlock1\n\
	lsls r0, r5, 2\n\
	adds r0, r1\n\
	ldr r1, _0813A508 @ =0x0000049a\n\
	adds r0, r1\n\
	ldrh r0, [r0]\n\
	cmp r0, 0x1\n\
	bne _0813A50C\n\
	strh r0, [r4, 0x6]\n\
	adds r0, r6, 0\n\
	bl sub_813A6FC\n\
	b _0813A570\n\
	.align 2, 0\n\
_0813A500: .4byte gTasks + 0x8\n\
_0813A504: .4byte gSaveBlock1\n\
_0813A508: .4byte 0x0000049a\n\
_0813A50C:\n\
	ldr r0, _0813A514 @ =0x0000fffe\n\
	bl sub_813AD58\n\
	b _0813A542\n\
	.align 2, 0\n\
_0813A514: .4byte 0x0000fffe\n\
_0813A518:\n\
	ldr r1, _0813A534 @ =gSaveBlock1\n\
	lsls r0, r5, 2\n\
	adds r0, r1\n\
	ldr r1, _0813A538 @ =0x0000049a\n\
	adds r0, r1\n\
	ldrh r0, [r0]\n\
	cmp r0, 0x1\n\
	bne _0813A53C\n\
	strh r0, [r4, 0x6]\n\
	adds r0, r6, 0\n\
	bl sub_813A794\n\
	b _0813A570\n\
	.align 2, 0\n\
_0813A534: .4byte gSaveBlock1\n\
_0813A538: .4byte 0x0000049a\n\
_0813A53C:\n\
	ldr r0, _0813A578 @ =0x0000fffc\n\
	bl sub_813AD58\n\
_0813A542:\n\
	movs r0, 0x1\n\
	strh r0, [r4, 0x6]\n\
	movs r0, 0x6\n\
	movs r1, 0x8\n\
	movs r2, 0xD\n\
	movs r3, 0xB\n\
	bl MenuDrawTextWindow\n\
	ldrh r0, [r4, 0x6]\n\
	movs r1, 0x3\n\
	str r1, [sp]\n\
	movs r1, 0x1\n\
	movs r2, 0x8\n\
	movs r3, 0x9\n\
	bl sub_80A418C\n\
	ldr r1, _0813A57C @ =gTasks\n\
	lsls r0, r6, 2\n\
	adds r0, r6\n\
	lsls r0, 3\n\
	adds r0, r1\n\
	ldr r1, _0813A580 @ =sub_813A584\n\
	str r1, [r0]\n\
_0813A570:\n\
	add sp, 0x4\n\
	pop {r4-r6}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_0813A578: .4byte 0x0000fffc\n\
_0813A57C: .4byte gTasks\n\
_0813A580: .4byte sub_813A584\n\
	.syntax divided");
}
#endif
