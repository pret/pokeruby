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

extern struct ItemSlot gNewGamePCItems[];

extern u8 InitPlayerPCMenu;
extern u8 gOtherText_WhatWillYouDo[];

extern u32 gUnknown_02039314;
extern u32 gUnknown_084062B8[];
extern u32 gUnknown_084062BC[];
extern u8 gUnknown_030007B4[][2];

// this function is insane. It functionally matches, but the compiler is extremely insistent on gNewGamePCItems going in r5 instead of r1.
#ifdef NONMATCHING
void NewGameInitPCItems(void)
{
	u8 i = 0;

	ClearItemSlots(gSaveBlock1.pcItems, 0x32);
	
	for(;gNewGamePCItems[i].itemId && gNewGamePCItems[i].quantity; i++)
		if(AddPCItem(gNewGamePCItems[i].itemId, gNewGamePCItems[i].quantity) != 1)
			return;
}
#else
__attribute__((naked))
void NewGameInitPCItems(void)
{
	asm(".syntax unified\n\
	push {r4-r6,lr}\n\
	movs r4, 0\n\
	ldr r0, _08139C6C @ =gSaveBlock1 + 0x498\n\
	movs r1, 0x32\n\
	bl ClearItemSlots\n\
	ldr r1, _08139C70 @ =gNewGamePCItems\n\
	ldrh r0, [r1]\n\
	cmp r0, 0\n\
	beq _08139C64\n\
	ldrh r0, [r1, 0x2]\n\
	cmp r0, 0\n\
	beq _08139C64\n\
	adds r5, r1, 0\n\
	adds r6, r5, 0x2\n\
_08139C36:\n\
	lsls r1, r4, 2\n\
	adds r0, r1, r5\n\
	ldrh r0, [r0]\n\
	adds r1, r6\n\
	ldrh r1, [r1]\n\
	bl AddPCItem\n\
	lsls r0, 24\n\
	lsrs r0, 24\n\
	cmp r0, 0x1\n\
	bne _08139C64\n\
	adds r0, r4, 0x1\n\
	lsls r0, 24\n\
	lsrs r4, r0, 24\n\
	lsls r1, r4, 2\n\
	adds r0, r1, r5\n\
	ldrh r0, [r0]\n\
	cmp r0, 0\n\
	beq _08139C64\n\
	adds r0, r1, r6\n\
	ldrh r0, [r0]\n\
	cmp r0, 0\n\
	bne _08139C36\n\
_08139C64:\n\
	pop {r4-r6}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_08139C6C: .4byte gSaveBlock1 + 0x498\n\
_08139C70: .4byte gNewGamePCItems\n\
	.syntax divided");
}
#endif

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
