#include "global.h"
#include "main.h"
#include "sprite.h"
#include "palette.h"
#include "task.h"
#include "text.h"
#include "menu.h"

extern void sub_8147048(void);
extern void sub_8147218(void);

extern u16 gUnknown_0203933C;
extern u16 gUnknown_0203933E;

extern u8 gBirchHelpGfx[];

extern u8 gSystemText_SaveFailedBackupCheck[];
extern u8 gBirchGrassTilemap[];
extern u8 gBirchBagTilemap[];

extern const u8 gSaveFailedClockGfx[];
extern const u8 gSaveFailedClockPal[];
extern u8 gBirchBagGrassPal[];

void sub_8146E50(void);

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

/*
	thumb_func_start sub_8146E50
sub_8146E50: @ 8146E50
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	ldr r0, _08146FB0 @ =gMain
	ldr r1, _08146FB4 @ =0x0000043c
	adds r7, r0, r1
	ldrb r0, [r7]
	cmp r0, 0
	beq _08146E6C
	cmp r0, 0x1
	bne _08146E6C
	b _0814701C
_08146E6C:
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	mov r9, r0
	movs r1, 0
	strh r1, [r0]
	ldr r6, _08146FB8 @ =REG_BG3CNT
	strh r1, [r6]
	adds r0, 0xC
	mov r8, r0
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	ldr r5, _08146FBC @ =REG_BG0CNT
	strh r1, [r5]
	adds r0, 0x12
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	add r0, sp, 0x4
	strh r1, [r0]
	ldr r2, _08146FC0 @ =0x040000d4
	str r0, [r2]
	movs r1, 0xC0
	lsls r1, 19
	str r1, [r2, 0x4]
	ldr r0, _08146FC4 @ =0x8100c000
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r4, 0
	str r4, [sp, 0x8]
	add r0, sp, 0x8
	str r0, [r2]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r2, 0x4]
	ldr r0, _08146FC8 @ =0x85000100
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	add r0, sp, 0x4
	strh r4, [r0]
	str r0, [r2]
	movs r0, 0xA0
	lsls r0, 19
	str r0, [r2, 0x4]
	ldr r0, _08146FCC @ =0x81000200
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _08146FD0 @ =gUnknown_083F66F0
	bl LZ77UnCompVram
	ldr r0, _08146FD4 @ =gBirchBagTilemap
	ldr r1, _08146FD8 @ =0x06003000
	bl LZ77UnCompVram
	ldr r0, _08146FDC @ =gBirchGrassTilemap
	ldr r1, _08146FE0 @ =0x06003800
	bl LZ77UnCompVram
	ldr r0, _08146FE4 @ =gSaveFailedClockGfx_Small
	ldr r1, _08146FE8 @ =0x06010020
	bl LZ77UnCompVram
	bl ResetSpriteData
	bl ResetTasks
	bl ResetPaletteFade
	ldr r0, _08146FEC @ =gUnknown_083F62EC
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _08146FF0 @ =gUnknown_08411960
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08146FF4 @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _08146FF8 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	.if REVISION >= 1
	movs r0, 0xD
	movs r1, 0x6
	movs r2, 0x10
	movs r3, 0x9
	.else
	movs r0, 0xD
	movs r1, 0x8
	movs r2, 0x10
	movs r3, 0xB
	.endif
	bl MenuDrawTextWindow
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
	ldr r0, _08146FFC @ =gSystemText_SaveFailedBackupCheck
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r3, _08147000 @ =0x04000208 REG_IME
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _08147004 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08147008 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0814700C @ =sub_8146E3C
	bl SetVBlankCallback
	ldr r1, _08147010 @ =0x00000703
	adds r0, r1, 0
	strh r0, [r6] @ REG_BG3CNT = 0x703;
	ldr r1, _08147014 @ =0x00000602
	adds r0, r1, 0
	mov r1, r8
	strh r0, [r1] @ REG_BG2CNT = 0x602;
	ldr r1, _08147018 @ =0x00001f08
	adds r0, r1, 0
	strh r0, [r5] @ REG_BG0CNT = 0x1f08; 
	movs r1, 0xEA
	lsls r1, 5
	adds r0, r1, 0
	mov r1, r9
	strh r0, [r1]
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	b _08147032
	.align 2, 0
_08146FB0: .4byte gMain
_08146FB4: .4byte 0x0000043c
_08146FB8: .4byte REG_BG3CNT
_08146FBC: .4byte REG_BG0CNT
_08146FC0: .4byte 0x040000d4
_08146FC4: .4byte 0x8100c000
_08146FC8: .4byte 0x85000100
_08146FCC: .4byte 0x81000200
_08146FD0: .4byte gUnknown_083F66F0
_08146FD4: .4byte gBirchBagTilemap
_08146FD8: .4byte 0x06003000
_08146FDC: .4byte gBirchGrassTilemap
_08146FE0: .4byte 0x06003800
_08146FE4: .4byte gSaveFailedClockGfx_Small
_08146FE8: .4byte 0x06010020
_08146FEC: .4byte gUnknown_083F62EC
_08146FF0: .4byte gUnknown_08411960
_08146FF4: .4byte gWindowConfig_81E6C3C
_08146FF8: .4byte gWindowConfig_81E6CE4
_08146FFC: .4byte gSystemText_SaveFailedBackupCheck
_08147000: .4byte 0x04000208
_08147004: .4byte 0x04000200
_08147008: .4byte REG_DISPSTAT
_0814700C: .4byte sub_8146E3C
_08147010: .4byte 0x00000703
_08147014: .4byte 0x00000602
_08147018: .4byte 0x00001f08
_0814701C:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08147032
	ldr r0, _08147040 @ =sub_8147048
	bl SetMainCallback2
	ldr r0, _08147044 @ =sub_8147218
	bl SetVBlankCallback
_08147032:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08147040: .4byte sub_8147048
_08147044: .4byte sub_8147218
	thumb_func_end sub_8146E50
*/
