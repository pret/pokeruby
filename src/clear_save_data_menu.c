#include "global.h"
#include "gba/gba.h"
#include "task.h"
#include "menu.h"
#include "sprite.h"
#include "palette.h"
#include "main.h"
#include "sound.h"


#define asm_comment(x) asm volatile("@ -- " x " -- ")


//u32 sub_8148970(void);
//void sub_8148830(u8);
//void sub_81488BC(u8);
//void sub_8148930(u8);
extern void sub_8148B34(void);

extern void calls_flash_erase_block(void);


extern u8 gSystemText_ClearAllSaveDataPrompt;
extern u8 gSystemText_ClearingData;
extern u8 * const gUnknown_08376D74[][2];


// 8148800
void c2_clear_save_data_screen_2(void)
{
	u32 temp = sub_8148970();
	
	if ((temp << 24) != 0x0)
	{
		CreateTask(sub_8148830, 0);
	}
	
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
void sub_8148830(u8 r0_in)
{
	ResetSpriteData();
	
	// FL4SHK Note:  I don't feel like figuring out what flags of
	// REG_DISPCNT are being set or cleared.
	REG_DISPCNT = (0xCA << 5);
	
	SetVBlankCallback(sub_814881C);
	MenuDrawTextWindow(0x2, 0xE, 0x1B, 0x13);
	MenuPrint(&gSystemText_ClearAllSaveDataPrompt, 0x3, 0xF);
	
	MenuDrawTextWindow(0x2, 0x1, 0x8, 0x6);
	PrintMenuItems(0x3, 0x2, 0x2, gUnknown_08376D74);
	InitMenu(0x0, 0x3, 0x2, 0x2, 0x1, 0x5);
	
	gTasks[r0_in].func = sub_81488BC;
}


void sub_81488BC(u8 r0_in)
{
	switch (ProcessMenuInputNoWrap_())
	{
		case 0:
			PlaySE(0x5);
			sub_8071F40(&gSystemText_ClearingData);
			gTasks[r0_in].func = sub_8148930;
			break;
		
		case 1:
		case -1:
			PlaySE(0x5);
			DestroyTask(r0_in);
			SetMainCallback2(sub_8148B34);
			break;
	}
	
	AnimateSprites();
	BuildOamBuffer();
}


void sub_8148930(u8 r0_in)
{
	calls_flash_erase_block();
	DestroyTask(r0_in);
	SetMainCallback2(sub_8148B34);
}


void sub_8148954(void)
{
	RunTasks();
	UpdatePaletteFade();
}

// Why is this even a function?  It's literally just a wrapper calling
// another function.  At least it's only a small amount of wasted ROM.
void TransferPlttBuffer_(void)
{
	TransferPlttBuffer();
}


u32 sub_8148970(void)
{
	u16 i;
	u16 old_reg_ime;
	
	switch (gMain.state)
	{
		case 0:
		default:
			asm_comment("case not 1");
			SetVBlankCallback(0x0);
			
			REG_DISPCNT = 0x0;
			REG_BG0HOFS = 0x0;
			REG_BG0VOFS = 0x0;
			REG_BG3HOFS = 0x0;
			REG_BG3VOFS = 0x0;
			REG_WIN0H = 0x0;
			REG_WIN0V = 0x0;
			REG_WININ = 0x0;
			REG_WINOUT = 0x0;
			REG_BLDCNT = 0x0;
			REG_BLDALPHA = 0x0;
			REG_BLDY = 0x0;
			
			// Clear all of VRAM (0xc000 halfwords, 0x18000 bytes) via DMA3
			// (halfword write mode)
			asm_comment("VRAM DMA_FILL");
			DmaFill16(3, 0, (vu16 *)VRAM, 0x18000);
			
			
			// Clear all of OAM (0x0100 words, 0x0400 bytes) via DMA3 (word
			// write mode)
			asm_comment("OAM DMA_FILL");
			DmaFill32(3, 0, (vu32 *)OAM, 0x400);
			
			
			
			// Clear MOST of Palette RAM (0x01ff halfwords, 0x3fe bytes)
			// via DMA3 (halfword write mode)
			asm_comment("PLTT DMA_FILL");
			DmaFill16(3, 0, (vu16 *)(PLTT + 0x2), 0x3fe);
			
			ResetPaletteFade();
			
			gPlttBufferUnfaded[0] = 0x7fff;
			gPlttBufferFaded[0] = 0x7fff;
			gPlttBufferUnfaded[1] = 0x3945;
			gPlttBufferFaded[1] = 0x3945;
			
			asm_comment("Unsure if correct");
			
			i = 0;
			do
			{
				((vu16 *)(VRAM + 0x20))[i] = 0x1111;
				i++;
			} while (i <= 0xf);
			
			i = 0;
			do
			{
				((vu16 *)(VRAM + 0x3800))[i] = 0x0001; 
				i++;
			} while (i <= 0x04ff);
			
			ResetTasks();
			ResetSpriteData();
			
			SetUpWindowConfig(&gWindowConfig_81E6C3C);
			InitMenuWindow(&gWindowConfig_81E6CE4);
			BeginNormalPaletteFade(-1, 0, 0x10, 0, 0xffff);
			
			asm_comment("old_reg_ime = REG_IME");
			old_reg_ime = REG_IME;
			REG_IME = 0;
			REG_IE |= 1;
			REG_IME = old_reg_ime;
			REG_DISPSTAT |= 0x8;
			
			SetVBlankCallback(TransferPlttBuffer_);
			
			REG_BG3CNT = 0x0703;
			REG_DISPCNT = 0x0900;
			gMain.state = 1;
			
			return 0;
			
			break;
		
		case 1:
			asm_comment("case 1");
			UpdatePaletteFade();
			
			if (gPaletteFade.active)
			{
				return 0;
			}
			
			SetMainCallback2(sub_8148954);
			
			
			return 1;
			
			break;
		
	}
}

void sub_8148B34(void)
{
	switch (gMain.state)
	{
		case 0:
		default:
			BeginNormalPaletteFade(-1, 0, 0, 0x10, 0xffff);
			
			gMain.state = 1;
			break;
		
		case 1:
			UpdatePaletteFade();
			
			if (gPaletteFade.active)
			{
				return;
			}
			DoSoftReset();
			
			break;
	}
}

