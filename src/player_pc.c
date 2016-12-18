#include "global.h"
#include "item.h"
#include "task.h"
#include "menu.h"

extern void DisplayItemMessageOnField(u8, u8*, TaskFunc, u16);

extern u16 gNewGamePCItems[];

extern u8 gOtherText_WhatWillYouDo[];

extern u8 *gUnknown_02039314;
extern struct MenuAction gUnknown_08406298[];
extern u8 gUnknown_084062B8[];
extern u8 gUnknown_084062BC[];
extern u8 gUnknown_030007B4;

void InitPlayerPCMenu(u8 taskId);
void PlayerPCProcessMenuInput(u8 taskId);

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
