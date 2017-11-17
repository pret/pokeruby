	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start Task_FieldPoisonEffect
Task_FieldPoisonEffect: @ 80C7008
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080C702C @ =gTasks + 0x8
	adds r1, r0, r1
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0x1
	beq _080C7046
	cmp r0, 0x1
	bgt _080C7030
	cmp r0, 0
	beq _080C7036
	b _080C7062
	.align 2, 0
_080C702C: .4byte gTasks + 0x8
_080C7030:
	cmp r0, 0x2
	beq _080C705A
	b _080C7062
_080C7036:
	ldrh r0, [r1, 0x2]
	adds r0, 0x2
	strh r0, [r1, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080C7062
	b _080C7052
_080C7046:
	ldrh r0, [r1, 0x2]
	subs r0, 0x2
	strh r0, [r1, 0x2]
	lsls r0, 16
	cmp r0, 0
	bne _080C7062
_080C7052:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080C7062
_080C705A:
	adds r0, r2, 0
	bl DestroyTask
	b _080C706C
_080C7062:
	ldr r2, _080C7070 @ =REG_MOSAIC
	ldrh r1, [r1, 0x2]
	lsls r0, r1, 4
	orrs r0, r1
	strh r0, [r2]
_080C706C:
	pop {r0}
	bx r0
	.align 2, 0
_080C7070: .4byte REG_MOSAIC
	thumb_func_end Task_FieldPoisonEffect

	thumb_func_start DoFieldPoisonEffect
DoFieldPoisonEffect: @ 80C7074
	push {lr}
	movs r0, 0x4F
	bl PlaySE
	ldr r0, _080C7088 @ =Task_FieldPoisonEffect
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080C7088: .4byte Task_FieldPoisonEffect
	thumb_func_end DoFieldPoisonEffect

	thumb_func_start FieldPoisonEffectIsRunning
FieldPoisonEffectIsRunning: @ 80C708C
	push {lr}
	ldr r0, _080C709C @ =Task_FieldPoisonEffect
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080C709C: .4byte Task_FieldPoisonEffect
	thumb_func_end FieldPoisonEffectIsRunning

	.align 2, 0 @ Don't pad with nop.
