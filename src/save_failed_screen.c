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

extern u8 unk_2000000[];

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

void sub_8147154(void)
{
	gUnknown_0203933E = 0;
	
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

	gUnknown_0203933E = zero = 0;
	
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

// do later
__attribute__((naked))
void sub_8147218(void)
{
	asm(".syntax unified\n\
	push {r4,r5,lr}\n\
	ldr r0, _08147290 @ =gMain\n\
	mov r12, r0\n\
	ldr r0, [r0, 0x24]\n\
	lsrs r4, r0, 3\n\
	movs r0, 0x7\n\
	ands r4, r0\n\
	ldr r0, _08147294 @ =gUnknown_08411940\n\
	ldr r1, [r0, 0x4]\n\
	ldr r0, [r0]\n\
	mov r2, r12\n\
	str r0, [r2, 0x3C]\n\
	str r1, [r2, 0x40]\n\
	ldrh r1, [r2, 0x3E]\n\
	ldr r0, _08147298 @ =0xfffffe00\n\
	ands r0, r1\n\
	movs r1, 0x70\n\
	orrs r0, r1\n\
	strh r0, [r2, 0x3E]\n\
	mov r1, r12\n\
	adds r1, 0x3C\n"
#if REVISION >= 1
	"movs r0, 0x38\n"
#else
	"movs r0, 0x48\n"
#endif
	"strb r0, [r1]\n\
	ldr r0, _0814729C @ =gUnknown_0203933E\n\
	ldrh r0, [r0]\n\
	cmp r0, 0\n\
	beq _081472A8\n\
	ldr r3, _081472A0 @ =gUnknown_08411948\n\
	lsls r2, r4, 1\n\
	adds r2, r4\n\
	adds r0, r2, r3\n\
	mov r4, r12\n\
	adds r4, 0x40\n\
	ldrb r5, [r0]\n\
	ldrh r1, [r4]\n\
	ldr r0, _081472A4 @ =0xfffffc00\n\
	ands r0, r1\n\
	orrs r0, r5\n\
	strh r0, [r4]\n\
	adds r0, r3, 0x2\n\
	adds r0, r2, r0\n\
	ldrb r1, [r0]\n\
	lsls r1, 4\n\
	adds r3, 0x1\n\
	adds r2, r3\n\
	ldrb r0, [r2]\n\
	lsls r0, 3\n\
	orrs r1, r0\n\
	mov r3, r12\n\
	adds r3, 0x3F\n\
	movs r0, 0x1F\n\
	ands r1, r0\n\
	lsls r1, 1\n\
	ldrb r2, [r3]\n\
	movs r0, 0x3F\n\
	negs r0, r0\n\
	ands r0, r2\n\
	orrs r0, r1\n\
	strb r0, [r3]\n\
	b _081472B8\n\
	.align 2, 0\n\
_08147290: .4byte gMain\n\
_08147294: .4byte gUnknown_08411940\n\
_08147298: .4byte 0xfffffe00\n\
_0814729C: .4byte gUnknown_0203933E\n\
_081472A0: .4byte gUnknown_08411948\n\
_081472A4: .4byte 0xfffffc00\n\
_081472A8:\n\
	mov r2, r12\n\
	adds r2, 0x40\n\
	ldrh r1, [r2]\n\
	ldr r0, _081472D8 @ =0xfffffc00\n\
	ands r0, r1\n\
	movs r1, 0x1\n\
	orrs r0, r1\n\
	strh r0, [r2]\n\
_081472B8:\n\
	ldr r0, _081472DC @ =gMain + 0x3C\n\
	movs r1, 0xE0\n\
	lsls r1, 19\n\
	movs r2, 0x1\n\
	bl CpuFastSet\n\
	ldr r1, _081472E0 @ =gUnknown_0203933E\n\
	ldrh r0, [r1, 0x2]\n\
	cmp r0, 0\n\
	beq _081472D0\n\
	subs r0, 0x1\n\
	strh r0, [r1, 0x2]\n\
_081472D0:\n\
	pop {r4,r5}\n\
	pop {r0}\n\
	bx r0\n\
	.align 2, 0\n\
_081472D8: .4byte 0xfffffc00\n\
_081472DC: .4byte gMain + 0x3C\n\
_081472E0: .4byte gUnknown_0203933E\n\
	.syntax divided");
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

#ifdef NONMATCHING
bool8 sub_8147324(u16 arg0) {
    u16 i2;
    u16 i;
    bool8 success;

    i = 0;
    while (TRUE) {
        u32 next;

        i2 = 0;
        next = i + 1;

        for (; i2 < 0x1000; i2++) {
            ProgramFlashByte(arg0, i2, 0);
        }

        if (!(success = sub_81472E4(arg0), (i = next)) || i >= 130) // matches except it checks r0 instead of r1. both are the same value, but the compiler prefers r1 for some reason.
            break;
    }

    return success;
}
#else
__attribute__((naked))
bool8 sub_8147324(u16 arg0)
{
	asm(".syntax unified\n\
	push {r4-r7,lr}\n\
	mov r7, r8\n\
	push {r7}\n\
	lsls r0, 16\n\
	lsrs r6, r0, 16\n\
	movs r0, 0\n\
	ldr r1, _08147374 @ =0x00000fff\n\
	mov r8, r1\n\
	ldr r7, _08147378 @ =ProgramFlashByte\n\
_08147336:\n\
	movs r4, 0\n\
	adds r5, r0, 0x1\n\
_0814733A:\n\
	ldr r3, [r7]\n\
	adds r0, r6, 0\n\
	adds r1, r4, 0\n\
	movs r2, 0\n\
	bl _call_via_r3\n\
	adds r0, r4, 0x1\n\
	lsls r0, 16\n\
	lsrs r4, r0, 16\n\
	cmp r4, r8 @ compare i to var.\n\
	bls _0814733A\n\
	adds r0, r6, 0\n\
	bl sub_81472E4\n\
	lsls r0, 24\n\
	lsrs r1, r0, 24\n\
	lsls r0, r5, 16\n\
	lsrs r0, 16\n\
	cmp r1, 0\n\
	beq _08147366\n\
	cmp r0, 0x81\n\
	bls _08147336\n\
_08147366:\n\
	adds r0, r1, 0 @ add var64 to the result from sub_81472E4(var)?\n\
	pop {r3}\n\
	mov r8, r3\n\
	pop {r4-r7}\n\
	pop {r1}\n\
	bx r1\n\
	.align 2, 0\n\
_08147374: .4byte 0x00000fff\n\
_08147378: .4byte ProgramFlashByte\n\
	.syntax divided");
}
#endif

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
