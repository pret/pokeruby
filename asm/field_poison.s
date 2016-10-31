	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CheckMonIsValid
CheckMonIsValid: @ 80C5684
	push {lr}
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _080C569C
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bne _080C56A0
_080C569C:
	movs r0, 0
	b _080C56A2
_080C56A0:
	movs r0, 0x1
_080C56A2:
	pop {r1}
	bx r1
	thumb_func_end CheckMonIsValid

	thumb_func_start CheckMonFainted
CheckMonFainted: @ 80C56A8
	push {r4,r5,lr}
	ldr r4, _080C56C8 @ =gPlayerParty
	movs r5, 0
_080C56AE:
	adds r0, r4, 0
	bl CheckMonIsValid
	cmp r0, 0
	beq _080C56CC
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080C56CC
	movs r0, 0
	b _080C56D6
	.align 2, 0
_080C56C8: .4byte gPlayerParty
_080C56CC:
	adds r5, 0x1
	adds r4, 0x64
	cmp r5, 0x5
	ble _080C56AE
	movs r0, 0x1
_080C56D6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end CheckMonFainted

	thumb_func_start MonFaintFromPoisonOnField
MonFaintFromPoisonOnField: @ 80C56DC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	adds r4, r0, 0
	muls r4, r1
	ldr r0, _080C5720 @ =gPlayerParty
	adds r4, r0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x7
	bl AdjustFriendship
	adds r0, r4, 0
	movs r1, 0x37
	mov r2, sp
	bl SetMonData
	ldr r5, _080C5724 @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0x2
	adds r2, r5, 0
	bl GetMonData
	adds r0, r5, 0
	bl StringGetEnd10
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C5720: .4byte gPlayerParty
_080C5724: .4byte gStringVar1
	thumb_func_end MonFaintFromPoisonOnField

	thumb_func_start CheckMonFaintedFromPoison
CheckMonFaintedFromPoison: @ 80C5728
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _080C5764 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	bl CheckMonIsValid
	cmp r0, 0
	beq _080C5768
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _080C5768
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	bl pokemon_ailments_get_primary
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C5768
	movs r0, 0x1
	b _080C576A
	.align 2, 0
_080C5764: .4byte gPlayerParty
_080C5768:
	movs r0, 0
_080C576A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CheckMonFaintedFromPoison

	thumb_func_start Task_WhiteOut
Task_WhiteOut: @ 80C5770
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C5794 @ =gTasks + 0x8
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080C57CA
	cmp r0, 0x1
	bgt _080C5798
	cmp r0, 0
	beq _080C579E
	b _080C581A
	.align 2, 0
_080C5794: .4byte gTasks + 0x8
_080C5798:
	cmp r0, 0x2
	beq _080C57DC
	b _080C581A
_080C579E:
	ldrh r1, [r4, 0x2]
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	cmp r0, 0x5
	bgt _080C57C4
_080C57A8:
	lsls r0, r1, 24
	lsrs r0, 24
	bl CheckMonFaintedFromPoison
	cmp r0, 0
	bne _080C57F4
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	adds r1, r0, 0
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080C57A8
_080C57C4:
	movs r0, 0x2
	strh r0, [r4]
	b _080C581A
_080C57CA:
	bl IsFieldMessageBoxHidden
	lsls r0, 24
	cmp r0, 0
	beq _080C581A
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	b _080C581A
_080C57DC:
	bl CheckMonFainted
	adds r1, r0, 0
	cmp r1, 0
	beq _080C580C
	ldr r1, _080C57F0 @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
	b _080C5810
	.align 2, 0
_080C57F0: .4byte gScriptResult
_080C57F4:
	ldrb r0, [r4, 0x2]
	bl MonFaintFromPoisonOnField
	ldr r0, _080C5808 @ =UnknownString_81A1132
	bl ShowFieldMessage
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080C581A
	.align 2, 0
_080C5808: .4byte UnknownString_81A1132
_080C580C:
	ldr r0, _080C5820 @ =gScriptResult
	strh r1, [r0]
_080C5810:
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
_080C581A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C5820: .4byte gScriptResult
	thumb_func_end Task_WhiteOut

	thumb_func_start DoWhiteOut
DoWhiteOut: @ 80C5824
	push {lr}
	ldr r0, _080C5838 @ =Task_WhiteOut
	movs r1, 0x50
	bl CreateTask
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	.align 2, 0
_080C5838: .4byte Task_WhiteOut
	thumb_func_end DoWhiteOut

	thumb_func_start overworld_poison
overworld_poison: @ 80C583C
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r4, _080C58A8 @ =gPlayerParty
	movs r7, 0
	movs r6, 0
	movs r5, 0x5
_080C5848:
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _080C588C
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	bl pokemon_ailments_get_primary
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C588C
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	str r0, [sp]
	cmp r0, 0
	beq _080C587E
	subs r0, 0x1
	str r0, [sp]
	cmp r0, 0
	bne _080C5880
_080C587E:
	adds r6, 0x1
_080C5880:
	adds r0, r4, 0
	movs r1, 0x39
	mov r2, sp
	bl SetMonData
	adds r7, 0x1
_080C588C:
	adds r4, 0x64
	subs r5, 0x1
	cmp r5, 0
	bge _080C5848
	cmp r6, 0
	bne _080C589C
	cmp r7, 0
	beq _080C58A0
_080C589C:
	bl DoFieldPoisonEffect
_080C58A0:
	cmp r6, 0
	beq _080C58AC
	movs r0, 0x2
	b _080C58B6
	.align 2, 0
_080C58A8: .4byte gPlayerParty
_080C58AC:
	cmp r7, 0
	bne _080C58B4
	movs r0, 0
	b _080C58B6
_080C58B4:
	movs r0, 0x1
_080C58B6:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end overworld_poison

	.align 2, 0 @ Don't pad with nop.
