#include "global.h"
#include "item.h"
#include "task.h"

/* 
this file is way too hard. I'm coming back to this one later. For one, InitPlayerPCMenu 
is treated as a u8 (wtf?) in BedroomPC and PlayerPC for some insanely stupid reason, which means
when it actually is decompiled there's almost no way this'll match anymore. script_menu.s probably
needs to be decompiled before this.
*/

extern void DisplayItemMessageOnField(u8, u8*, u8*, u16);

extern u16 gNewGamePCItems[];

extern u8 InitPlayerPCMenu;
extern u8 gOtherText_WhatWillYouDo[];

extern u32 gUnknown_02039314;
extern u32 gUnknown_084062B8[];
extern u32 gUnknown_084062BC[];
extern u8 gUnknown_030007B4[][2];

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
	
	gUnknown_02039314 = (int)&gUnknown_084062B8;
	gUnknown_030007B4[0][0] = 4;
	taskId = CreateTask(TaskDummy, 0);
	DisplayItemMessageOnField(taskId, gOtherText_WhatWillYouDo, &InitPlayerPCMenu, 0);
}

void PlayerPC(void)
{
	u8 taskId;
	
	gUnknown_02039314 = (int)&gUnknown_084062BC;
	gUnknown_030007B4[0][0] = 3;
	taskId = CreateTask(TaskDummy, 0);
	DisplayItemMessageOnField(taskId, gOtherText_WhatWillYouDo, &InitPlayerPCMenu, 0);
}

// not done
/*void InitPlayerPCMenu(u8 taskId)
{
	MenuDrawTextWindow(0, 0, 10, gUnknown_030007B4[1][0]);
	PrintMenuItemsReordered(1, 1, gUnknown_030007B4, gUnknown_08406298, gUnknown_02039314);
	InitMenu(0, 1, 1, gUnknown_030007B4, 0, 9);
	gTasks[taskId].func = PlayerPCProcessMenuInput;
}*/
