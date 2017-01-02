	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_806A328
sub_806A328: @ 806A328
	push {lr}
	ldr r0, _0806A350 @ =0x00000835
	bl FlagSet
	bl RtcCalcLocalTime
	ldr r2, _0806A354 @ =gSaveBlock2
	adds r2, 0xA0
	ldr r3, _0806A358 @ =gLocalTime
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0806A35C @ =0x00004040
	ldrh r1, [r3]
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0806A350: .4byte 0x00000835
_0806A354: .4byte gSaveBlock2
_0806A358: .4byte gLocalTime
_0806A35C: .4byte 0x00004040
	thumb_func_end sub_806A328

	thumb_func_start DoTimeBasedEvents
DoTimeBasedEvents: @ 806A360
	push {r4,lr}
	ldr r0, _0806A388 @ =0x00000835
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0806A380
	bl RtcCalcLocalTime
	ldr r4, _0806A38C @ =gLocalTime
	adds r0, r4, 0
	bl sub_806A390
	adds r0, r4, 0
	bl sub_806A3F4
_0806A380:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A388: .4byte 0x00000835
_0806A38C: .4byte gLocalTime
	thumb_func_end DoTimeBasedEvents

	thumb_func_start sub_806A390
sub_806A390: @ 806A390
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _0806A3F0 @ =0x00004040
	bl GetVarPointer
	adds r6, r0, 0
	ldrh r0, [r6]
	movs r2, 0
	ldrsh r1, [r5, r2]
	cmp r0, r1
	beq _0806A3EA
	cmp r0, r1
	bgt _0806A3EA
	ldrh r4, [r5]
	subs r4, r0
	lsls r4, 16
	lsrs r4, 16
	bl ClearUpperFlags
	adds r0, r4, 0
	bl sub_80FA220
	adds r0, r4, 0
	bl sub_80BE8C4
	adds r0, r4, 0
	bl sub_8080834
	adds r0, r4, 0
	bl UpdatePartyPokerusTime
	adds r0, r4, 0
	bl sub_810D2F4
	adds r0, r4, 0
	bl UpdateBirchState
	adds r0, r4, 0
	bl sub_810F618
	adds r0, r4, 0
	bl sub_8145AA4
	ldrh r0, [r5]
	strh r0, [r6]
_0806A3EA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A3F0: .4byte 0x00004040
	thumb_func_end sub_806A390

	thumb_func_start sub_806A3F4
sub_806A3F4: @ 806A3F4
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	mov r4, sp
	ldr r6, _0806A448 @ =gSaveBlock2 + 0xA0
	mov r0, sp
	adds r1, r6, 0
	adds r2, r5, 0
	bl CalcTimeDifference
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 5
	movs r2, 0x2
	ldrsb r2, [r4, r2]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 2
	adds r1, r0
	movs r0, 0x3
	ldrsb r0, [r4, r0]
	adds r0, r1, r0
	cmp r0, 0
	beq _0806A43E
	cmp r0, 0
	blt _0806A43E
	bl BerryTreeTimeUpdate
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	str r0, [r6]
	str r1, [r6, 0x4]
_0806A43E:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A448: .4byte gSaveBlock2 + 0xA0
	thumb_func_end sub_806A3F4

	thumb_func_start sub_806A44C
sub_806A44C: @ 806A44C
	push {lr}
	bl sub_806A328
	ldr r0, _0806A45C @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0806A45C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_806A44C

	thumb_func_start sub_806A460
sub_806A460: @ 806A460
	push {lr}
	ldr r0, _0806A474 @ =Cb2_StartWallClock
	bl SetMainCallback2
	ldr r1, _0806A478 @ =gMain
	ldr r0, _0806A47C @ =sub_806A44C
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0806A474: .4byte Cb2_StartWallClock
_0806A478: .4byte gMain
_0806A47C: .4byte sub_806A44C
	thumb_func_end sub_806A460

	.align 2, 0 @ Don't pad with nop.
