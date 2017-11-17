	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start FldEff_PCTurnOn
FldEff_PCTurnOn: @ 80C6718
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldr r0, _080C6758 @ =sub_80C6760
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C675C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	mov r0, sp
	ldrh r0, [r0]
	movs r2, 0
	strh r0, [r1, 0x8]
	ldrh r0, [r4]
	strh r0, [r1, 0xA]
	strh r2, [r1, 0xC]
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C6758: .4byte sub_80C6760
_080C675C: .4byte gTasks
	thumb_func_end FldEff_PCTurnOn

	thumb_func_start sub_80C6760
sub_80C6760: @ 80C6760
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C6788 @ =gTasks + 0x8
	adds r4, r0, r1
	ldrh r0, [r4, 0x4]
	subs r0, 0x4
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bhi _080C682E
	lsls r0, 2
	ldr r1, _080C678C @ =_080C6790
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C6788: .4byte gTasks + 0x8
_080C678C: .4byte _080C6790
	.align 2, 0
_080C6790:
	.4byte _080C67D4
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C67E2
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C67D4
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C67E2
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C682E
	.4byte _080C6800
_080C67D4:
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r2, 0x89
	lsls r2, 2
	b _080C67EE
_080C67E2:
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r2, 0x88
	lsls r2, 2
_080C67EE:
	bl MapGridSetMetatileIdAt
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	b _080C682E
_080C6800:
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r2, 0x89
	lsls r2, 2
	bl MapGridSetMetatileIdAt
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	movs r0, 0x3D
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
	b _080C6834
_080C682E:
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
_080C6834:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C6760

	thumb_func_start sub_80C683C
sub_80C683C: @ 80C683C
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	movs r0, 0x3
	bl PlaySE
	ldr r0, _080C6874 @ =0x00004054
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	bne _080C6878
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r2, 0xE2
	lsls r2, 4
	bl MapGridSetMetatileIdAt
	b _080C6888
	.align 2, 0
_080C6874: .4byte 0x00004054
_080C6878:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _080C68A0 @ =0x00000e21
	bl MapGridSetMetatileIdAt
_080C6888:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C68A0: .4byte 0x00000e21
	thumb_func_end sub_80C683C

	.align 2, 0 @ Don't pad with nop.
