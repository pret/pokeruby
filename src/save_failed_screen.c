#include "global.h"
#include "main.h"
#include "sprite.h"
#include "palette.h"
#include "task.h"
#include "text.h"
#include "menu.h"
#include "save.h"

extern void sub_8147218(void);
extern void sub_8147154(void);
extern void sub_81471A4(void);
extern u8 sub_814737C(u32);

extern u16 gUnknown_0203933C;
extern u16 gUnknown_0203933E;
extern u32 gUnknown_03005EA8;
extern u32 gUnknown_03005EBC;

extern u8 gBirchHelpGfx[];

extern u8 gSystemText_SaveFailedBackupCheck[];
extern u8 gSystemText_CheckCompleteSaveAttempt[];
extern u8 gSystemText_BackupDamagedGameContinue[];
extern u8 gSystemText_SaveCompletedPressA[];
extern u8 gSystemText_SaveCompletedGameEnd[];

extern u8 gBirchGrassTilemap[];
extern u8 gBirchBagTilemap[];

extern const u8 gSaveFailedClockGfx[];
extern const u8 gSaveFailedClockPal[];
extern u8 gBirchBagGrassPal[];

void sub_8146E50(void);
void sub_8147048(void);

void fullscreen_save_activate(u8 var)
{
	SetMainCallback2(sub_8146E50);
	gUnknown_0203933C = var;
	gUnknown_0203933E = 0;
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

	gUnknown_0203933E = 1;
	
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

/*
	thumb_func_start sub_8147048
sub_8147048: @ 8147048
	push {r4,r5,lr}
	movs r4, 0
	ldr r0, _081470C8 @ =gUnknown_0203933E
	movs r1, 0x1
	strh r1, [r0]
	ldr r1, _081470CC @ =gUnknown_03005EA8
	ldr r0, [r1]
	cmp r0, 0
	beq _081470A6
	adds r5, r1, 0
_0814705C:
	ldr r0, [r5]
	bl sub_814737C
	lsls r0, 24
	cmp r0, 0
	bne _0814710C
	.if REVISION >= 1
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	.else
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0x13
	.endif
	bl MenuDrawTextWindow
	ldr r0, _081470D0 @ =gSystemText_CheckCompleteSaveAttempt
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
	ldr r0, _081470D4 @ =gUnknown_0203933C
	ldrb r0, [r0]
	bl sub_8125C3C
	ldr r0, [r5]
	cmp r0, 0
	beq _08147096
	ldr r0, _081470D8 @ =gSystemText_SaveFailedBackupCheck
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
_08147096:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, [r5]
	cmp r0, 0
	beq _081470A6
	cmp r4, 0x2
	bls _0814705C
_081470A6:
	cmp r4, 0x3
	bne _081470E4
	.if REVISION >= 1
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	.else
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0x13
	.endif
	bl MenuDrawTextWindow
	ldr r0, _081470DC @ =gSystemText_BackupDamagedGameContinue
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
	ldr r0, _081470E0 @ =sub_81471A4
	bl SetMainCallback2
	b _0814713E
	.align 2, 0
_081470C8: .4byte gUnknown_0203933E
_081470CC: .4byte gUnknown_03005EA8
_081470D0: .4byte gSystemText_CheckCompleteSaveAttempt
_081470D4: .4byte gUnknown_0203933C
_081470D8: .4byte gSystemText_SaveFailedBackupCheck
_081470DC: .4byte gSystemText_BackupDamagedGameContinue
_081470E0: .4byte sub_81471A4
_081470E4:
	.if REVISION >= 1
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	.else
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0x13
	.endif
	bl MenuDrawTextWindow
	ldr r0, _08147104 @ =gUnknown_03005EBC
	ldr r0, [r0]
	cmp r0, 0
	bne _08147134
	ldr r0, _08147108 @ =gSystemText_SaveCompletedGameEnd
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
	b _0814713E
	.align 2, 0
_08147104: .4byte gUnknown_03005EBC
_08147108: .4byte gSystemText_SaveCompletedGameEnd
_0814710C:
	.if REVISION >= 1
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	.else
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0x13
	.endif
	bl MenuDrawTextWindow
	ldr r0, _0814712C @ =gSystemText_BackupDamagedGameContinue
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
	ldr r0, _08147130 @ =sub_8147154
	bl SetMainCallback2
	b _08147144
	.align 2, 0
_0814712C: .4byte gSystemText_BackupDamagedGameContinue
_08147130: .4byte sub_8147154
_08147134:
	ldr r0, _0814714C @ =gSystemText_SaveCompletedPressA
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
_0814713E:
	ldr r0, _08147150 @ =sub_81471A4
	bl SetMainCallback2
_08147144:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814714C: .4byte gSystemText_SaveCompletedPressA
_08147150: .4byte sub_81471A4
	thumb_func_end sub_8147048
*/
