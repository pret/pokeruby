	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_80B5054
sub_80B5054: @ 80B5054
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, _080B5098 @ =sub_80B52B4
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080B50A4
	ldr r1, _080B509C @ =gScriptResult
	movs r0, 0xFF
	strh r0, [r1]
	ldr r1, _080B50A0 @ =gMultichoiceLists
	lsls r0, r4, 3
	adds r0, r1
	ldrb r2, [r0, 0x4]
	ldr r3, [r0]
	str r5, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_80B5138
	movs r0, 0x1
	b _080B50A6
	.align 2, 0
_080B5098: .4byte sub_80B52B4
_080B509C: .4byte gScriptResult
_080B50A0: .4byte gMultichoiceLists
_080B50A4:
	movs r0, 0
_080B50A6:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80B5054

	thumb_func_start sub_80B50B0
sub_80B50B0: @ 80B50B0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	ldr r4, [sp, 0x20]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B5100 @ =sub_80B52B4
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080B510C
	ldr r1, _080B5104 @ =gScriptResult
	movs r0, 0xFF
	strh r0, [r1]
	ldr r1, _080B5108 @ =gMultichoiceLists
	lsls r0, r5, 3
	adds r0, r1
	ldrb r2, [r0, 0x4]
	ldr r3, [r0]
	str r6, [sp]
	str r4, [sp, 0x4]
	mov r0, r8
	adds r1, r7, 0
	bl sub_80B5138
	movs r0, 0x1
	b _080B510E
	.align 2, 0
_080B5100: .4byte sub_80B52B4
_080B5104: .4byte gScriptResult
_080B5108: .4byte gMultichoiceLists
_080B510C:
	movs r0, 0
_080B510E:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80B50B0

	thumb_func_start GetStringWidthInTilesForScriptMenu
GetStringWidthInTilesForScriptMenu: @ 80B511C
	push {lr}
	adds r1, r0, 0
	ldr r0, _080B5134 @ =gWindowConfig_81E6CE4
	bl GetStringWidthGivenWindowConfig
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0x7
	lsrs r0, r1, 3
	pop {r1}
	bx r1
	.align 2, 0
_080B5134: .4byte gWindowConfig_81E6CE4
	thumb_func_end GetStringWidthInTilesForScriptMenu

	thumb_func_start sub_80B5138
sub_80B5138: @ 80B5138
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r10, r3
	ldr r3, [sp, 0x34]
	ldr r4, [sp, 0x38]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x8]
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0xC]
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x10]
	mov r1, r10
	ldr r0, [r1]
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r5, r0, 16
	movs r4, 0x1
	cmp r4, r8
	bcs _080B5198
_080B517A:
	lsls r0, r4, 3
	add r0, r10
	ldr r0, [r0]
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r0, 16
	cmp r5, r0
	bcs _080B518E
	adds r5, r0, 0
_080B518E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r8
	bcc _080B517A
_080B5198:
	lsls r0, r5, 24
	lsrs r7, r0, 24
	mov r1, r9
	adds r0, r7, r1
	adds r0, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x1D
	bls _080B51B8
	mov r0, r9
	adds r0, 0x1D
	subs r0, r7
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r7, 0x1D
_080B51B8:
	mov r1, r8
	lsls r0, r1, 1
	adds r0, 0x1
	ldr r1, [sp, 0x8]
	lsls r4, r1, 24
	asrs r4, 24
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	mov r0, r9
	adds r2, r7, 0
	adds r3, r4, 0
	bl MenuDrawTextWindow
	mov r6, r9
	adds r6, 0x1
	lsls r6, 24
	lsrs r6, 24
	ldr r5, [sp, 0x8]
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	adds r1, r5, 0
	mov r2, r8
	mov r3, r10
	bl PrintMenuItems
	ldr r0, [sp, 0x10]
	str r0, [sp]
	mov r1, r9
	subs r0, r7, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	adds r1, r6, 0
	adds r2, r5, 0
	mov r3, r8
	bl InitMenu
	ldr r0, [sp, 0xC]
	str r0, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	mov r0, r9
	ldr r1, [sp, 0x8]
	adds r2, r7, 0
	adds r3, r4, 0
	bl sub_80B5230
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B5138

	thumb_func_start sub_80B5230
sub_80B5230: @ 80B5230
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, [sp, 0x1C]
	mov r8, r0
	ldr r0, [sp, 0x20]
	mov r9, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _080B5298 @ =sub_80B52B4
	movs r1, 0x50
	str r3, [sp]
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B529C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	strh r5, [r1, 0xA]
	strh r6, [r1, 0xC]
	ldr r3, [sp]
	strh r3, [r1, 0xE]
	mov r0, r8
	strh r0, [r1, 0x10]
	mov r0, r9
	cmp r0, 0x3
	bls _080B52A0
	movs r0, 0x1
	b _080B52A2
	.align 2, 0
_080B5298: .4byte sub_80B52B4
_080B529C: .4byte gTasks
_080B52A0:
	movs r0, 0
_080B52A2:
	strh r0, [r1, 0x12]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B5230

	thumb_func_start sub_80B52B4
sub_80B52B4: @ 80B52B4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080B52E0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B534E
	ldr r2, _080B52E4 @ =gTasks
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r0, 3
	adds r0, r2
	movs r2, 0x12
	ldrsh r0, [r0, r2]
	adds r5, r1, 0
	cmp r0, 0
	bne _080B52E8
	bl ProcessMenuInputNoWrap
	b _080B52EC
	.align 2, 0
_080B52E0: .4byte gPaletteFade
_080B52E4: .4byte gTasks
_080B52E8:
	bl ProcessMenuInput
_080B52EC:
	lsls r0, 24
	lsrs r0, 24
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _080B534E
	adds r0, 0x1
	cmp r1, r0
	bne _080B5328
	ldr r0, _080B5320 @ =gTasks
	adds r1, r5, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0x10
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080B534E
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080B5324 @ =gScriptResult
	movs r0, 0x7F
	strh r0, [r1]
	b _080B532C
	.align 2, 0
_080B5320: .4byte gTasks
_080B5324: .4byte gScriptResult
_080B5328:
	ldr r0, _080B5354 @ =gScriptResult
	strh r1, [r0]
_080B532C:
	bl sub_8072DEC
	ldr r0, _080B5358 @ =gTasks
	adds r3, r5, r4
	lsls r3, 3
	adds r3, r0
	ldrb r0, [r3, 0x8]
	ldrb r1, [r3, 0xA]
	ldrb r2, [r3, 0xC]
	ldrb r3, [r3, 0xE]
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_080B534E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5354: .4byte gScriptResult
_080B5358: .4byte gTasks
	thumb_func_end sub_80B52B4

	thumb_func_start Multichoice
Multichoice: @ 80B535C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, _080B539C @ =sub_80B52B4
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080B53A8
	ldr r1, _080B53A0 @ =gScriptResult
	movs r0, 0xFF
	strh r0, [r1]
	ldr r1, _080B53A4 @ =gMultichoiceLists
	lsls r0, r4, 3
	adds r0, r1
	ldrb r2, [r0, 0x4]
	ldr r3, [r0]
	str r5, [sp]
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_80B53B4
	movs r0, 0x1
	b _080B53AA
	.align 2, 0
_080B539C: .4byte sub_80B52B4
_080B53A0: .4byte gScriptResult
_080B53A4: .4byte gMultichoiceLists
_080B53A8:
	movs r0, 0
_080B53AA:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end Multichoice

	thumb_func_start sub_80B53B4
sub_80B53B4: @ 80B53B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r7, r3, 0
	ldr r3, [sp, 0x28]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	ldr r0, [r7]
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r4, r0, 16
	movs r5, 0x1
	cmp r5, r6
	bcs _080B5408
_080B53EA:
	lsls r0, r5, 3
	adds r0, r7
	ldr r0, [r0]
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	bcs _080B53FE
	adds r4, r0, 0
_080B53FE:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r6
	bcc _080B53EA
_080B5408:
	lsls r4, 24
	lsrs r4, 24
	add r4, r8
	adds r4, 0x2
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r6, 1
	adds r0, 0x1
	mov r1, r9
	lsls r5, r1, 24
	asrs r5, 24
	adds r5, r0
	lsls r5, 24
	lsrs r5, 24
	mov r0, r8
	adds r2, r6, 0
	adds r3, r7, 0
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	mov r1, r8
	subs r0, r4, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	mov r2, r9
	adds r3, r6, 0
	bl InitMenu
	mov r0, r10
	str r0, [sp]
	str r6, [sp, 0x4]
	mov r0, r8
	mov r1, r9
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_80B5230
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B53B4

	thumb_func_start yes_no_box
yes_no_box: @ 80B546C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r6, _080B54B4 @ =task_yes_no_maybe
	adds r0, r6, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080B54C0
	ldr r1, _080B54B8 @ =gScriptResult
	movs r0, 0xFF
	strh r0, [r1]
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x1
	bl DisplayYesNoMenu
	adds r0, r6, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B54BC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	strh r4, [r1, 0xA]
	movs r0, 0x1
	b _080B54C2
	.align 2, 0
_080B54B4: .4byte task_yes_no_maybe
_080B54B8: .4byte gScriptResult
_080B54BC: .4byte gTasks
_080B54C0:
	movs r0, 0
_080B54C2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end yes_no_box

	thumb_func_start unref_sub_80B54C8
unref_sub_80B54C8: @ 80B54C8
	push {lr}
	ldr r0, _080B54D8 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0xFF
	beq _080B54DC
	movs r0, 0x1
	b _080B54DE
	.align 2, 0
_080B54D8: .4byte gScriptResult
_080B54DC:
	movs r0, 0
_080B54DE:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80B54C8

	thumb_func_start task_yes_no_maybe
task_yes_no_maybe: @ 80B54E4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080B5504 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0x4
	bgt _080B5508
	adds r0, r2, 0x1
	strh r0, [r1, 0xC]
	b _080B556A
	.align 2, 0
_080B5504: .4byte gTasks
_080B5508:
	bl ProcessMenuInputNoWrap
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080B552C
	cmp r1, r0
	bgt _080B5524
	subs r0, 0x1
	cmp r1, r0
	beq _080B556A
	b _080B5542
_080B5524:
	cmp r1, 0
	beq _080B553C
	cmp r1, 0x1
	bne _080B5542
_080B552C:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080B5538 @ =gScriptResult
	movs r0, 0
	b _080B5540
	.align 2, 0
_080B5538: .4byte gScriptResult
_080B553C:
	ldr r1, _080B5570 @ =gScriptResult
	movs r0, 0x1
_080B5540:
	strh r0, [r1]
_080B5542:
	ldr r0, _080B5574 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x8]
	ldrb r1, [r1, 0xA]
	adds r2, r0, 0x6
	lsls r2, 24
	lsrs r2, 24
	adds r3, r1, 0x5
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_080B556A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5570: .4byte gScriptResult
_080B5574: .4byte gTasks
	thumb_func_end task_yes_no_maybe

	thumb_func_start sub_80B5578
sub_80B5578: @ 80B5578
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r4, [sp, 0x30]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0xC]
	lsls r4, 24
	lsrs r5, r4, 24
	movs r7, 0
	ldr r0, _080B55B8 @ =sub_80B5684
	mov r10, r0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B55BC
	movs r0, 0
	b _080B5670
	.align 2, 0
_080B55B8: .4byte sub_80B5684
_080B55BC:
	ldr r1, _080B5620 @ =gScriptResult
	movs r0, 0xFF
	strh r0, [r1]
	ldr r0, _080B5624 @ =gMultichoiceLists
	lsls r4, r6, 3
	adds r0, r4, r0
	ldrb r6, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r5, [sp, 0x4]
	str r7, [sp, 0x8]
	mov r0, r9
	mov r1, r8
	adds r2, r6, 0
	movs r3, 0
	bl sub_807274C
	mov r0, r10
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r0, r6, 24
	lsrs r1, r0, 24
	lsrs r0, 25
	cmp r0, r5
	bcc _080B55FE
	movs r0, 0x1
	ands r0, r6
	cmp r0, 0
	beq _080B5606
_080B55FE:
	cmp r5, 0x1
	beq _080B5606
	cmp r1, r5
	bne _080B5628
_080B5606:
	ldr r0, _080B5624 @ =gMultichoiceLists
	adds r0, r4, r0
	ldrb r0, [r0, 0x4]
	adds r1, r5, 0
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0x1
	mov r2, r8
	lsls r1, r2, 24
	b _080B563A
	.align 2, 0
_080B5620: .4byte gScriptResult
_080B5624: .4byte gMultichoiceLists
_080B5628:
	adds r0, r6, 0
	adds r1, r5, 0
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 23
	adds r0, 0x3
	mov r3, r8
	lsls r1, r3, 24
_080B563A:
	asrs r1, 24
	adds r1, r0
	lsls r1, 24
	lsrs r7, r1, 24
	adds r0, r5, 0
	bl sub_807288C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B5680 @ =gTasks
	mov r3, r10
	lsls r1, r3, 2
	add r1, r10
	lsls r1, 3
	adds r1, r2
	mov r2, r9
	strh r2, [r1, 0x8]
	mov r3, r8
	strh r3, [r1, 0xA]
	add r0, r9
	adds r0, 0x2
	strh r0, [r1, 0xC]
	strh r7, [r1, 0xE]
	mov r0, sp
	ldrh r0, [r0, 0xC]
	strh r0, [r1, 0x10]
	movs r0, 0x1
_080B5670:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B5680: .4byte gTasks
	thumb_func_end sub_80B5578

	thumb_func_start sub_80B5684
sub_80B5684: @ 80B5684
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_80727CC
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _080B56F4
	adds r0, 0x1
	cmp r1, r0
	bne _080B56CC
	ldr r2, _080B56C4 @ =gTasks
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	adds r0, r2
	movs r2, 0x10
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0
	bne _080B56F4
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080B56C8 @ =gScriptResult
	movs r0, 0x7F
	strh r0, [r1]
	b _080B56D2
	.align 2, 0
_080B56C4: .4byte gTasks
_080B56C8: .4byte gScriptResult
_080B56CC:
	ldr r0, _080B56FC @ =gScriptResult
	strh r1, [r0]
	lsls r4, r5, 2
_080B56D2:
	bl sub_8072DEC
	ldr r0, _080B5700 @ =gTasks
	adds r3, r4, r5
	lsls r3, 3
	adds r3, r0
	ldrb r0, [r3, 0x8]
	ldrb r1, [r3, 0xA]
	ldrb r2, [r3, 0xC]
	ldrb r3, [r3, 0xE]
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_080B56F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B56FC: .4byte gScriptResult
_080B5700: .4byte gTasks
	thumb_func_end sub_80B5684

	thumb_func_start sp109_CreatePCMenu
sp109_CreatePCMenu: @ 80B5704
	push {lr}
	ldr r0, _080B5724 @ =sub_80B52B4
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080B572C
	ldr r1, _080B5728 @ =gScriptResult
	movs r0, 0xFF
	strh r0, [r1]
	bl CreatePCMenu
	movs r0, 0x1
	b _080B572E
	.align 2, 0
_080B5724: .4byte sub_80B52B4
_080B5728: .4byte gScriptResult
_080B572C:
	movs r0, 0
_080B572E:
	pop {r1}
	bx r1
	thumb_func_end sp109_CreatePCMenu

	thumb_func_start CreatePCMenu
CreatePCMenu: @ 80B5734
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r0, _080B5758 @ =gPCText_PlayersPC
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080B575C @ =gPCText_SomeonesPC
	bl GetStringWidthInTilesForScriptMenu
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	bls _080B5760
	lsls r0, r4, 24
	lsrs r5, r0, 24
	b _080B5762
	.align 2, 0
_080B5758: .4byte gPCText_PlayersPC
_080B575C: .4byte gPCText_SomeonesPC
_080B5760:
	movs r5, 0x8
_080B5762:
	ldr r0, _080B5798 @ =0x00000804
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080B57A4
	movs r7, 0x4
	adds r4, r5, 0x2
	lsls r2, r4, 24
	lsrs r2, 24
	movs r0, 0
	movs r1, 0
	movs r3, 0x9
	bl MenuDrawTextWindow
	ldr r0, _080B579C @ =gPCText_HallOfFame
	movs r1, 0x1
	movs r2, 0x5
	bl MenuPrint
	ldr r0, _080B57A0 @ =gPCText_LogOff
	movs r1, 0x1
	movs r2, 0x7
	bl MenuPrint
	b _080B57C0
	.align 2, 0
_080B5798: .4byte 0x00000804
_080B579C: .4byte gPCText_HallOfFame
_080B57A0: .4byte gPCText_LogOff
_080B57A4:
	movs r7, 0x3
	adds r4, r5, 0x2
	lsls r2, r4, 24
	lsrs r2, 24
	movs r0, 0
	movs r1, 0
	movs r3, 0x7
	bl MenuDrawTextWindow
	ldr r0, _080B57DC @ =gPCText_LogOff
	movs r1, 0x1
	movs r2, 0x5
	bl MenuPrint
_080B57C0:
	adds r6, r4, 0
	ldr r0, _080B57E0 @ =0x0000084b
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080B57E8
	ldr r0, _080B57E4 @ =gPCText_LanettesPC
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
	b _080B57F2
	.align 2, 0
_080B57DC: .4byte gPCText_LogOff
_080B57E0: .4byte 0x0000084b
_080B57E4: .4byte gPCText_LanettesPC
_080B57E8:
	ldr r0, _080B5830 @ =gPCText_SomeonesPC
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
_080B57F2:
	ldr r0, _080B5834 @ =gPCText_PlayersPC
	movs r1, 0x1
	movs r2, 0x3
	bl MenuPrint
	movs r4, 0
	str r4, [sp]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	adds r3, r7, 0
	bl InitMenu
	lsls r2, r6, 24
	lsrs r2, 24
	lsls r3, r7, 1
	adds r3, 0x1
	str r4, [sp]
	str r7, [sp, 0x4]
	movs r0, 0
	movs r1, 0
	bl sub_80B5230
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5830: .4byte gPCText_SomeonesPC
_080B5834: .4byte gPCText_PlayersPC
	thumb_func_end CreatePCMenu

	thumb_func_start sub_80B5838
sub_80B5838: @ 80B5838
	push {lr}
	bl MenuDisplayMessageBox
	ldr r0, _080B584C @ =gUnknown_081A0A01
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_080B584C: .4byte gUnknown_081A0A01
	thumb_func_end sub_80B5838

	thumb_func_start task_picbox
task_picbox: @ 80B5850
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080B5874 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080B58BE
	cmp r0, 0x1
	bgt _080B5878
	cmp r0, 0
	beq _080B5894
	b _080B58BE
	.align 2, 0
_080B5874: .4byte gTasks
_080B5878:
	cmp r0, 0x2
	beq _080B5882
	cmp r0, 0x3
	beq _080B58A0
	b _080B58BE
_080B5882:
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B589C @ =gSprites
	adds r0, r1
	bl FreeResourcesAndDestroySprite
_080B5894:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080B58BE
	.align 2, 0
_080B589C: .4byte gSprites
_080B58A0:
	ldrb r2, [r4, 0xE]
	adds r0, r2, 0
	ldrb r3, [r4, 0x10]
	adds r1, r3, 0
	adds r2, 0x9
	lsls r2, 24
	lsrs r2, 24
	adds r3, 0xA
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl DestroyTask
_080B58BE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end task_picbox

	thumb_func_start sub_80B58C4
sub_80B58C4: @ 80B58C4
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r4, _080B595C @ =task_picbox
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080B596C
	adds r2, r6, 0
	adds r2, 0x9
	lsls r2, 24
	lsrs r2, 24
	adds r3, r5, 0
	adds r3, 0xA
	lsls r3, 24
	lsrs r3, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl MenuDrawTextWindow
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B5960 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r7, [r4, 0xA]
	lsls r1, r6, 19
	movs r0, 0xA0
	lsls r0, 14
	adds r1, r0
	asrs r1, 16
	lsls r2, r5, 19
	adds r2, r0
	asrs r2, 16
	adds r0, r7, 0
	movs r3, 0
	bl CreateMonSprite_PicBox
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xC]
	strh r6, [r4, 0xE]
	strh r5, [r4, 0x10]
	ldr r3, _080B5964 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _080B5968 @ =SpriteCallbackDummy
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x5]
	movs r0, 0x1
	b _080B596E
	.align 2, 0
_080B595C: .4byte task_picbox
_080B5960: .4byte gTasks
_080B5964: .4byte gSprites
_080B5968: .4byte SpriteCallbackDummy
_080B596C:
	movs r0, 0
_080B596E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80B58C4

	thumb_func_start picbox_close
picbox_close: @ 80B5974
	push {lr}
	ldr r0, _080B5998 @ =task_picbox
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080B59A4
	ldr r0, _080B599C @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r0, _080B59A0 @ =sub_80B59AC
	b _080B59A6
	.align 2, 0
_080B5998: .4byte task_picbox
_080B599C: .4byte gTasks
_080B59A0: .4byte sub_80B59AC
_080B59A4:
	movs r0, 0
_080B59A6:
	pop {r1}
	bx r1
	thumb_func_end picbox_close

	thumb_func_start sub_80B59AC
sub_80B59AC: @ 80B59AC
	push {lr}
	ldr r0, _080B59C0 @ =task_picbox
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080B59C4
	movs r0, 0
	b _080B59C6
	.align 2, 0
_080B59C0: .4byte task_picbox
_080B59C4:
	movs r0, 0x1
_080B59C6:
	pop {r1}
	bx r1
	thumb_func_end sub_80B59AC

	.align 2, 0 @ Don't pad with nop.
