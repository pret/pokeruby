#include "global.h"
#include "task.h"
#include "gba/gba.h"


#define asm_comment(x) asm volatile("@ -- " x " -- ");


extern u32 sub_8148970(void);
void sub_8148830(u8);
extern void sub_81488BC(u8);

extern u8 gSystemText_ClearAllSaveDataPrompt;
extern u8 * gUnknown_08376D74[][2];


// 8148800
void c2_clear_save_data_screen_2()
{
	u32 temp = sub_8148970();
	
	if ((temp << 24) != 0x0)
	{
		CreateTask(sub_8148830, 0);
	}
	
	asm_comment("_08148814:")
	// _08148814:
	// ...
	// _08148818: .4byte sub_8148830
}

// 814881C
void sub_814881C(void)
{
	LoadOam();
	ProcessSpriteCopyRequests();
	TransferPlttBuffer();
}

// 8148830
void sub_8148830(u8 in_r0)
{
	//u32 arr[2];
	
	//u8 r4 = in_r0;
	
	ResetSpriteData();
	
	// FL4SHK Note:  I don't feel like figuring out exactly what it's doing
	// to REG_DISPCNT
	REG_DISPCNT = (0xCA << 5);
	
	SetVBlankCallback(sub_814881C);
	MenuDrawTextWindow(0x2, 0xE, 0x1B, 0x13);
	MenuPrint(&gSystemText_ClearAllSaveDataPrompt, 0x3, 0xF);
	
	MenuDrawTextWindow(0x2, 0x1, 0x8, 0x6);
	PrintMenuItems(0x3, 0x2, 0x2, gUnknown_08376D74);
	InitMenu(0x0, 0x3, 0x2, 0x2, 0x1, 0x5);
	
	gTasks[in_r0].func = sub_81488BC;
}


