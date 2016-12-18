#include "global.h"
#include "item.h"
#include "task.h"
#include "menu.h"
#include "sound.h"
#include "main.h"
#include "script.h"

extern void DisplayItemMessageOnField(u8, u8*, TaskFunc, u16);
extern void ItemStorageMenuProcessInput(u8);
extern void DoPlayerPCDecoration(u8);
extern u8 sub_813AF3C(void);
extern void sub_813AF78(void);
extern void sub_813A240(u8);
extern void sub_813B108(u8);
extern void sub_813B174(u8);

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
