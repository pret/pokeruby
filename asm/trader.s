	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_810993C
sub_810993C: @ 810993C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r0, _081099C8 @ =gSaveBlock1 + 0x2D94
	mov r9, r0
	movs r2, 0
_0810994E:
	adds r1, r2, 0x1
	lsls r0, r1, 24
	lsrs r5, r0, 24
	str r1, [sp, 0xC]
	cmp r5, 0x3
	bhi _081099AC
	movs r1, 0x1
	add r1, r9
	mov r8, r1
	adds r6, r1, r2
	movs r0, 0xB
	mov r10, r0
	mov r0, r10
	muls r0, r2
	adds r0, 0x5
	mov r1, r9
	adds r7, r1, r0
_08109970:
	ldrb r0, [r6]
	cmp r0, 0
	bne _081099A2
	adds r2, r0, 0
	mov r0, r8
	adds r1, r0, r5
	ldrb r0, [r1]
	strb r0, [r6]
	strb r2, [r1]
	mov r0, sp
	adds r1, r7, 0
	bl StringCopy
	mov r4, r10
	muls r4, r5
	adds r4, 0x5
	add r4, r9
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringCopy
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
_081099A2:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _08109970
_081099AC:
	ldr r1, [sp, 0xC]
	lsls r0, r1, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _0810994E
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081099C8: .4byte gSaveBlock1 + 0x2D94
	thumb_func_end sub_810993C

	thumb_func_start sub_81099CC
sub_81099CC: @ 81099CC
	push {r4-r6,lr}
	ldr r5, _08109A14 @ =gSaveBlock1 + 0x2D94
	movs r1, 0
	movs r0, 0x2
	strb r0, [r5]
	adds r0, r5, 0
	adds r0, 0x31
	strb r1, [r0]
	movs r4, 0
	ldr r6, _08109A18 @ =gUnknown_083F62D8
_081099E0:
	movs r0, 0xB
	muls r0, r4
	adds r0, 0x5
	adds r0, r5, r0
	lsls r1, r4, 2
	adds r1, r6
	ldr r1, [r1]
	bl StringCopy
	adds r1, r5, 0x1
	adds r1, r4
	ldr r0, _08109A1C @ =gTraderDecorations
	adds r0, r4, r0
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _081099E0
	bl sub_810993C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08109A14: .4byte gSaveBlock1 + 0x2D94
_08109A18: .4byte gUnknown_083F62D8
_08109A1C: .4byte gTraderDecorations
	thumb_func_end sub_81099CC

	thumb_func_start sub_8109A20
sub_8109A20: @ 8109A20
	ldr r0, _08109A2C @ =gSaveBlock1 + 0x2D94
	adds r0, 0x31
	movs r1, 0
	strb r1, [r0]
	bx lr
	.align 2, 0
_08109A2C: .4byte gSaveBlock1 + 0x2D94
	thumb_func_end sub_8109A20

	thumb_func_start sub_8109A30
sub_8109A30: @ 8109A30
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08109A44 @ =0x00004020
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_08109A44: .4byte 0x00004020
	thumb_func_end sub_8109A30

	thumb_func_start sub_8109A48
sub_8109A48: @ 8109A48
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r6, 0x1
	movs r5, 0
	ldr r0, _08109AB8 @ =gSaveBlock1 + 0x2D94
	movs r4, 0
	adds r7, r0, 0x1
	adds r1, r7, 0
_08109A64:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _08109A72
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08109A72:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08109A64
	lsls r3, r6, 25
	movs r0, 0x80
	lsls r0, 18
	adds r3, r0
	lsrs r3, 24
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xC
	bl MenuDrawTextWindow
	movs r4, 0
	mov r1, r9
	lsls r1, 2
	mov r8, r1
_08109A98:
	adds r1, r7, r4
	ldrb r0, [r1]
	cmp r0, 0
	beq _08109ADE
	cmp r0, 0x78
	bls _08109AC0
	lsls r2, r5, 25
	movs r0, 0x80
	lsls r0, 18
	adds r2, r0
	lsrs r2, 24
	ldr r0, _08109ABC @ =gOtherText_FiveQuestionsAndSlash
	movs r1, 0x1
	bl MenuPrint
	b _08109AD8
	.align 2, 0
_08109AB8: .4byte gSaveBlock1 + 0x2D94
_08109ABC: .4byte gOtherText_FiveQuestionsAndSlash
_08109AC0:
	ldrb r0, [r1]
	lsls r0, 5
	ldr r1, _08109B28 @ =gDecorations + 0x1
	adds r0, r1
	lsls r2, r5, 25
	movs r1, 0x80
	lsls r1, 18
	adds r2, r1
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
_08109AD8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08109ADE:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08109A98
	ldr r0, _08109B2C @ =gOtherText_CancelNoTerminator
	lsls r2, r5, 25
	movs r1, 0x80
	lsls r1, 18
	adds r2, r1
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
	movs r0, 0
	str r0, [sp]
	movs r0, 0xB
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x2
	adds r3, r6, 0
	bl InitMenu
	ldr r1, _08109B30 @ =gTasks
	mov r0, r8
	add r0, r9
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0xA]
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08109B28: .4byte gDecorations + 0x1
_08109B2C: .4byte gOtherText_CancelNoTerminator
_08109B30: .4byte gTasks
	thumb_func_end sub_8109A48

	thumb_func_start sub_8109B34
sub_8109B34: @ 8109B34
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x78
	bls _08109B54
	ldr r1, _08109B4C @ =gSpecialVar_0x8004
	ldr r2, _08109B50 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
	b _08109B58
	.align 2, 0
_08109B4C: .4byte gSpecialVar_0x8004
_08109B50: .4byte 0x0000ffff
_08109B54:
	ldr r0, _08109B78 @ =gSpecialVar_0x8004
	strh r1, [r0]
_08109B58:
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0x1
	movs r2, 0xC
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109B78: .4byte gSpecialVar_0x8004
	thumb_func_end sub_8109B34

	thumb_func_start sub_8109B7C
sub_8109B7C: @ 8109B7C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r6, _08109BA4 @ =gSaveBlock1 + 0x2D94
	ldr r0, _08109BA8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08109BAC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _08109C3E
	.align 2, 0
_08109BA4: .4byte gSaveBlock1 + 0x2D94
_08109BA8: .4byte gMain
_08109BAC:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08109BC2
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _08109C3E
_08109BC2:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08109C28
	movs r0, 0x5
	bl PlaySE
	ldr r5, _08109BFC @ =gSpecialVar_0x8005
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	ldr r1, _08109C00 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	ldrh r2, [r5]
	cmp r0, r2
	bne _08109C04
	adds r0, r4, 0
	movs r1, 0
	bl sub_8109B34
	b _08109C3E
	.align 2, 0
_08109BFC: .4byte gSpecialVar_0x8005
_08109C00: .4byte gTasks
_08109C04:
	ldr r0, _08109C24 @ =gStringVar1
	movs r1, 0xB
	muls r1, r2
	adds r1, 0x5
	adds r1, r6
	bl StringCopy
	adds r0, r6, 0x1
	ldrh r5, [r5]
	adds r0, r5
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8109B34
	b _08109C3E
	.align 2, 0
_08109C24: .4byte gStringVar1
_08109C28:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08109C3E
	movs r0, 0x5
	bl PlaySE
	adds r0, r5, 0
	movs r1, 0
	bl sub_8109B34
_08109C3E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8109B7C

	thumb_func_start sub_8109C44
sub_8109C44: @ 8109C44
	ldr r0, _08109C50 @ =gSaveBlock1 + 0x2D94
	ldr r1, _08109C54 @ =gScriptResult
	adds r0, 0x31
	ldrb r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_08109C50: .4byte gSaveBlock1 + 0x2D94
_08109C54: .4byte gScriptResult
	thumb_func_end sub_8109C44

	thumb_func_start sub_8109C58
sub_8109C58: @ 8109C58
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08109C70 @ =gScriptResult
_08109C5E:
	adds r0, r4, 0
	bl sub_8134194
	lsls r0, 24
	cmp r0, 0
	beq _08109C74
	movs r0, 0
	strh r0, [r5]
	b _08109C84
	.align 2, 0
_08109C70: .4byte gScriptResult
_08109C74:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08109C5E
	ldr r1, _08109C8C @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
_08109C84:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08109C8C: .4byte gScriptResult
	thumb_func_end sub_8109C58

	thumb_func_start sub_8109C90
sub_8109C90: @ 8109C90
	push {r4-r6,lr}
	ldr r6, _08109CDC @ =gScriptResult
	movs r0, 0
	strh r0, [r6]
	ldr r4, _08109CE0 @ =gDecorations
	ldr r5, _08109CE4 @ =gSpecialVar_0x8004
	ldrh r0, [r5]
	lsls r0, 5
	adds r2, r0, r4
	ldr r0, _08109CE8 @ =gSpecialVar_0x8006
	ldrh r0, [r0]
	lsls r0, 5
	adds r0, r4
	ldrb r1, [r2, 0x13]
	ldrb r0, [r0, 0x13]
	cmp r1, r0
	beq _08109CD6
	adds r0, r1, 0
	bl sub_8133F9C
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _08109CD6
	ldr r0, _08109CEC @ =gStringVar2
	ldrh r1, [r5]
	lsls r1, 5
	adds r1, r4
	ldrb r1, [r1, 0x13]
	bl sub_80FE7D4
	movs r0, 0x1
	strh r0, [r6]
_08109CD6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08109CDC: .4byte gScriptResult
_08109CE0: .4byte gDecorations
_08109CE4: .4byte gSpecialVar_0x8004
_08109CE8: .4byte gSpecialVar_0x8006
_08109CEC: .4byte gStringVar2
	thumb_func_end sub_8109C90

	thumb_func_start sub_8109CF0
sub_8109CF0: @ 8109CF0
	push {lr}
	ldr r0, _08109D00 @ =sub_80FE7A8
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08109D00: .4byte sub_80FE7A8
	thumb_func_end sub_8109CF0

	thumb_func_start sub_8109D04
sub_8109D04: @ 8109D04
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
	ldr r0, _08109D6C @ =gUnknown_020388F7
	movs r1, 0x8
	bl sub_80F9520
	bl BuyMenuFreeMemory
	bl sub_80FEFA4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08109D8C
	ldr r5, _08109D70 @ =gSpecialVar_0x8006
	ldr r0, _08109D74 @ =gUnknown_020388F5
	ldrb r1, [r0]
	ldr r0, _08109D78 @ =gUnknown_020388D0
	ldr r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r5]
	ldr r0, _08109D7C @ =gStringVar3
	ldr r1, _08109D80 @ =gSpecialVar_0x8004
	ldrh r1, [r1]
	lsls r1, 5
	ldr r4, _08109D84 @ =gDecorations + 0x1
	adds r1, r4
	bl StringCopy
	ldr r0, _08109D88 @ =gStringVar2
	ldrh r1, [r5]
	lsls r1, 5
	adds r1, r4
	bl StringCopy
	b _08109D94
	.align 2, 0
_08109D6C: .4byte gUnknown_020388F7
_08109D70: .4byte gSpecialVar_0x8006
_08109D74: .4byte gUnknown_020388F5
_08109D78: .4byte gUnknown_020388D0
_08109D7C: .4byte gStringVar3
_08109D80: .4byte gSpecialVar_0x8004
_08109D84: .4byte gDecorations + 0x1
_08109D88: .4byte gStringVar2
_08109D8C:
	ldr r1, _08109DA4 @ =gSpecialVar_0x8006
	ldr r2, _08109DA8 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
_08109D94:
	adds r0, r6, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08109DA4: .4byte gSpecialVar_0x8006
_08109DA8: .4byte 0x0000ffff
	thumb_func_end sub_8109D04

	thumb_func_start sub_8109DAC
sub_8109DAC: @ 8109DAC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _08109DDC @ =gSpecialVar_0x8006
	movs r0, 0
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08109DDC: .4byte gSpecialVar_0x8006
	thumb_func_end sub_8109DAC

	thumb_func_start sub_8109DE0
sub_8109DE0: @ 8109DE0
	push {r4-r6,lr}
	ldr r4, _08109E20 @ =gSaveBlock1 + 0x2D94
	ldr r6, _08109E24 @ =gSpecialVar_0x8006
	ldrb r0, [r6]
	bl sub_81340A8
	ldr r0, _08109E28 @ =gSpecialVar_0x8004
	ldrb r0, [r0]
	bl IsThereStorageSpaceForDecoration
	ldr r5, _08109E2C @ =gSpecialVar_0x8005
	ldrh r1, [r5]
	movs r0, 0xB
	muls r0, r1
	adds r0, 0x5
	adds r0, r4
	ldr r1, _08109E30 @ =gSaveBlock2
	bl StringCopy
	adds r0, r4, 0x1
	ldrh r5, [r5]
	adds r0, r5
	ldrh r1, [r6]
	strb r1, [r0]
	bl sub_810993C
	adds r4, 0x31
	movs r0, 0x1
	strb r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08109E20: .4byte gSaveBlock1 + 0x2D94
_08109E24: .4byte gSpecialVar_0x8006
_08109E28: .4byte gSpecialVar_0x8004
_08109E2C: .4byte gSpecialVar_0x8005
_08109E30: .4byte gSaveBlock2
	thumb_func_end sub_8109DE0

	thumb_func_start sub_8109E34
sub_8109E34: @ 8109E34
	push {lr}
	ldr r0, _08109E4C @ =sub_8109B7C
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl sub_8109A48
	pop {r0}
	bx r0
	.align 2, 0
_08109E4C: .4byte sub_8109B7C
	thumb_func_end sub_8109E34

	.align 2, 0 @ Don't pad with nop.
