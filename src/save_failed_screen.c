#include "global.h"
#include "main.h"
#include "sprite.h"
#include "palette.h"
#include "task.h"
#include "text.h"
#include "menu.h"
#include "save.h"
#include "m4a.h"
#include "gba/flash_internal.h"
#include "asm.h"

struct SaveFailedStruct
{
    u16 unk0;
    u16 unk2;
};

extern u8 unk_2000000[];

extern u16 gUnknown_0203933C;
extern struct SaveFailedStruct gUnknown_0203933E;
extern u32 gUnknown_03005EA8;
extern u32 gUnknown_03005EBC;

extern struct OamData gUnknown_08411940;
extern u8 gUnknown_08411948[][3];

extern u8 gBirchHelpGfx[];

extern u8 gSystemText_SaveFailedBackupCheck[];
extern u8 gSystemText_CheckCompleteSaveAttempt[];
extern u8 gSystemText_BackupDamagedGameContinue[];
extern u8 gSystemText_SaveCompletedPressA[];
extern u8 gSystemText_SaveCompletedGameEnd[];
extern u8 gSystemText_GameplayEnded[];

extern u8 gBirchGrassTilemap[];
extern u8 gBirchBagTilemap[];

extern const u8 gSaveFailedClockGfx[];
extern const u8 gSaveFailedClockPal[];
extern u8 gBirchBagGrassPal[];

void sub_8146E50(void);
void sub_8147048(void);
void sub_8147154(void);
void sub_81471A4(void);
void sub_81471EC(void);
void sub_8147218(void);
bool8 sub_814737C(u32);

void fullscreen_save_activate(u8 var)
{
	SetMainCallback2(sub_8146E50);
	gUnknown_0203933C = var;
	gUnknown_0203933E.unk0 = 0;
}

void sub_8146E3C(void)
{
	LoadOam();
	ProcessSpriteCopyRequests();
	TransferPlttBuffer();
}

void sub_8146E50(void)
{
	u16 ime;

	switch(gMain.state)
	{
		case 0:
		default:
			SetVBlankCallback(0);
			REG_DISPCNT = 0;
			REG_BG3CNT = 0;
			REG_BG2CNT = 0;
			REG_BG1CNT = 0;
			REG_BG0CNT = 0;
			REG_BG3HOFS = 0;
			REG_BG3VOFS = 0;
			REG_BG2HOFS = 0;
			REG_BG2VOFS = 0;
			REG_BG1HOFS = 0;
			REG_BG1VOFS = 0;
			REG_BG0HOFS = 0;
			REG_BG0VOFS = 0;
			DmaFill16(3, 0, VRAM, VRAM_SIZE);
			DmaFill32(3, 0, OAM, OAM_SIZE);
			DmaFill16(3, 0, PLTT, PLTT_SIZE);
			LZ77UnCompVram(&gBirchHelpGfx, (void *)VRAM);
			LZ77UnCompVram(&gBirchBagTilemap, (void *)(VRAM + 0x3000));
			LZ77UnCompVram(&gBirchGrassTilemap, (void *)(VRAM + 0x3800));
			LZ77UnCompVram(&gSaveFailedClockGfx, (void *)(VRAM + 0x10020));
			ResetSpriteData();
			ResetTasks();
			ResetPaletteFade();
			LoadPalette(&gBirchBagGrassPal, 0, 0x40);
			LoadPalette(&gSaveFailedClockPal, 0x100, 0x20);
			SetUpWindowConfig(&gWindowConfig_81E6C3C);
			InitMenuWindow(&gWindowConfig_81E6CE4);
			// in revision 1.0, the text window is too small, causing text to overflow and create garbage. this is fixed in later revisions.
#if (REVISION >= 1)
			MenuDrawTextWindow(13, 6, 16, 9);
			MenuDrawTextWindow(1, 10, 28, 19);
			MenuPrint(gSystemText_SaveFailedBackupCheck, 2, 11);
#else
			MenuDrawTextWindow(13, 8, 16, 11);
			MenuDrawTextWindow(1, 12, 28, 19);
			MenuPrint(gSystemText_SaveFailedBackupCheck, 2, 13);
#endif
			BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, 0);
			ime = REG_IME;
			REG_IME = 0;
			REG_IE |= INTR_FLAG_VBLANK;
			REG_IME = ime;
			REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
			SetVBlankCallback(sub_8146E3C);
			REG_BG3CNT = 0x703;
			REG_BG2CNT = 0x602;
			REG_BG0CNT = 0x1f08;
			REG_DISPCNT = DISPCNT_OBJ_ON | DISPCNT_BG3_ON | DISPCNT_BG2_ON | DISPCNT_BG0_ON | DISPCNT_OBJ_1D_MAP | DISPCNT_MODE_0;
			gMain.state++;
			break;
		case 1:
			if(!UpdatePaletteFade())
			{
				SetMainCallback2(sub_8147048);
				SetVBlankCallback(sub_8147218);
			}
			break;
	}
}

void sub_8147048(void)
{
	u8 clockVal = 0;

	gUnknown_0203933E.unk0 = 1;
	
	if(gUnknown_03005EA8)
	{
		while(1) // _0814705C
		{
			if(!sub_814737C(gUnknown_03005EA8))
			{
			#if (REVISION >= 1)
				MenuDrawTextWindow(1, 10, 28, 19);
				MenuPrint(gSystemText_CheckCompleteSaveAttempt, 2, 11);
			#else
				MenuDrawTextWindow(1, 12, 28, 19);
				MenuPrint(gSystemText_CheckCompleteSaveAttempt, 2, 13);
			#endif
				sub_8125C3C(gUnknown_0203933C);
			
				if(gUnknown_03005EA8)
				#if (REVISION >= 1)
					MenuPrint(gSystemText_SaveFailedBackupCheck, 2, 11);
				#else
					MenuPrint(gSystemText_SaveFailedBackupCheck, 2, 13);
				#endif
			
				clockVal++;
			
				if(!gUnknown_03005EA8 || clockVal > 2)
					break; // go to _081470A6

				continue;
			}
			goto gotoLabel2;
		}
	}
	if(clockVal == 3) // _081470A6
	{
	#if (REVISION >= 1)
		MenuDrawTextWindow(1, 10, 28, 19);
		MenuPrint(gSystemText_BackupDamagedGameContinue, 2, 11);
	#else
		MenuDrawTextWindow(1, 12, 28, 19);
		MenuPrint(gSystemText_BackupDamagedGameContinue, 2, 13);
	#endif
		SetMainCallback2(sub_81471A4);
		goto gotoLabel; // this calls sub_81471A4 for some reason.
	}
	else // _081470E4
	{
	#if (REVISION >= 1)
		MenuDrawTextWindow(1, 10, 28, 19);
	#else
		MenuDrawTextWindow(1, 12, 28, 19);
	#endif
		
		if(!gUnknown_03005EBC) // cant continue game.
		{
		#if (REVISION >= 1)
			MenuPrint(gSystemText_SaveCompletedGameEnd, 2, 11);
		#else
			MenuPrint(gSystemText_SaveCompletedGameEnd, 2, 13);
		#endif
			goto gotoLabel;
		}
		else // can continue game.
			goto gotoLabel3;
	}
	// no matter what I do, i can't get rid of these gotos. They were seemingly labeled at the end by the developer and jumped to manually depending on the result.
gotoLabel2: // _0814710C
#if (REVISION >= 1)
	MenuDrawTextWindow(1, 10, 28, 19);
	MenuPrint(gSystemText_BackupDamagedGameContinue, 2, 11);
#else
	MenuDrawTextWindow(1, 12, 28, 19);
	MenuPrint(gSystemText_BackupDamagedGameContinue, 2, 13);
#endif
	SetMainCallback2(sub_8147154);
	return;

gotoLabel3:
#if (REVISION >= 1)
	MenuPrint(gSystemText_SaveCompletedPressA, 2, 11);
#else
	MenuPrint(gSystemText_SaveCompletedPressA, 2, 13);
#endif

gotoLabel: // _0814713E
	SetMainCallback2(sub_81471A4); // seemingly called twice?
}

void sub_8147154(void)
{
	gUnknown_0203933E.unk0 = 0;
	
	if(gMain.newKeys & A_BUTTON)
	{
	#if (REVISION >= 1)
		MenuDrawTextWindow(1, 10, 28, 19);
		MenuPrint(gSystemText_GameplayEnded, 2, 11);
	#else
		MenuDrawTextWindow(1, 12, 28, 19);
		MenuPrint(gSystemText_GameplayEnded, 2, 13);
	#endif
		SetVBlankCallback(sub_8146E3C);
		SetMainCallback2(sub_81471A4);
	}
}

void sub_81471A4(void)
{
	u8 zero;

	gUnknown_0203933E.unk0 = zero = 0;
	
	if(gMain.newKeys & A_BUTTON)
	{
		BeginNormalPaletteFade(0xFFFFFFFF, 0, zero, 16, 0);
		SetVBlankCallback(sub_8146E3C);
		SetMainCallback2(sub_81471EC);
	}
}

void sub_81471EC(void)
{
	if(!UpdatePaletteFade())
	{
		if(!gUnknown_03005EBC)
			DoSoftReset();
		else
		{
			SetMainCallback2((MainCallback)gUnknown_03005EBC);
			gUnknown_03005EBC = 0;
		}
	}
}

void sub_8147218(void)
{
    unsigned int v0 = (gMain.vblankCounter2 >> 3) & 7;

    gMain.oamBuffer[0] = gUnknown_08411940;
    gMain.oamBuffer[0].x = 112;

#if (REVISION >= 1)
    gMain.oamBuffer[0].y = 56;
#else
    gMain.oamBuffer[0].y = 72;
#endif

    if (gUnknown_0203933E.unk0)
    {
        gMain.oamBuffer[0].tileNum = gUnknown_08411948[v0][0];
        gMain.oamBuffer[0].matrixNum = (gUnknown_08411948[v0][2] << 4) | (gUnknown_08411948[v0][1] << 3);
    }
    else
    {
        gMain.oamBuffer[0].tileNum = 1;
    }

    CpuFastCopy(gMain.oamBuffer, (void *)OAM, 4);
    if (gUnknown_0203933E.unk2)
        gUnknown_0203933E.unk2--;
}

bool8 sub_81472E4(u16 var)
{
	u32 * ptr = (u32 *) unk_2000000;
	u16 i;
	
	ReadFlash(var, 0, (u8 *) ptr, 4096);

	for(i = 0; i < 0x400; i++, ptr++)
		if(*ptr)
			return TRUE;

	return FALSE;
}

bool8 sub_8147324(u16 arg0)
{
    u16 i, j;
    bool8 success = TRUE;

    for (i = 0; success && i < 130; i++)
    {
        for (j = 0; j < 0x1000; j++)
        {
            ProgramFlashByte(arg0, j, 0);
        }

        success = sub_81472E4(arg0);
    }

    return success;
}

bool8 sub_814737C(u32 var)
{
	u16 i;
	
	for(i = 0; i < 0x20; i++)
		if(var & (1 << i) && !sub_8147324(i))
			var &= ~(1 << i);

	if(var == 0)
		return FALSE;
	else
		return TRUE;
}
