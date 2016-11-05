	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start unref_sub_80A9B28
unref_sub_80A9B28: @ 80A9B28
	push {lr}
	sub sp, 0x8
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0
	movs r2, 0x11
	movs r3, 0x12
	bl MenuDrawTextWindow
	ldr r3, _080A9B6C @ =gUnknown_083C91F0
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x7
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x7
	bl InitMenu
	ldr r1, _080A9B70 @ =gCallback_03004AE8
	ldr r0, _080A9B74 @ =sub_80A9B78
	str r0, [r1]
	movs r0, 0
	add sp, 0x8
	pop {r1}
	bx r1
	.align 2, 0
_080A9B6C: .4byte gUnknown_083C91F0
_080A9B70: .4byte gCallback_03004AE8
_080A9B74: .4byte sub_80A9B78
	thumb_func_end unref_sub_80A9B28

	thumb_func_start sub_80A9B78
sub_80A9B78: @ 80A9B78
	push {lr}
	bl ProcessMenuInput
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	bne _080A9B8E
	movs r0, 0
	b _080A9BB6
_080A9B8E:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _080A9BB0
	ldr r2, _080A9BA8 @ =gCallback_03004AE8
	ldr r0, _080A9BAC @ =gUnknown_083C91F0
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	str r0, [r2]
	movs r0, 0
	b _080A9BB6
	.align 2, 0
_080A9BA8: .4byte gCallback_03004AE8
_080A9BAC: .4byte gUnknown_083C91F0
_080A9BB0:
	bl sub_8071C20
	movs r0, 0x1
_080A9BB6:
	pop {r1}
	bx r1
	thumb_func_end sub_80A9B78

	thumb_func_start sub_80A9BBC
sub_80A9BBC: @ 80A9BBC
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080A9BE0 @ =sub_80A9BE4
	movs r1, 0xFF
	bl CreateTask
	movs r0, 0x1
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_080A9BE0: .4byte sub_80A9BE4
	thumb_func_end sub_80A9BBC

	thumb_func_start sub_80A9BE4
sub_80A9BE4: @ 80A9BE4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080A9C14 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080A9C10
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _080A9C18 @ =gUnknown_0203869A
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080A9C0C
	bl sub_80AF668
_080A9C0C:
	bl sub_80C2358
_080A9C10:
	pop {r0}
	bx r0
	.align 2, 0
_080A9C14: .4byte gPaletteFade
_080A9C18: .4byte gUnknown_0203869A
	thumb_func_end sub_80A9BE4

	thumb_func_start sub_80A9C1C
sub_80A9C1C: @ 80A9C1C
	push {lr}
	ldr r1, _080A9C30 @ =gUnknown_0203869A
	movs r0, 0
	strb r0, [r1]
	bl sub_80AA10C
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080A9C30: .4byte gUnknown_0203869A
	thumb_func_end sub_80A9C1C

	thumb_func_start sub_80A9C34
sub_80A9C34: @ 80A9C34
	push {lr}
	bl sub_80AA10C
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80A9C34

	thumb_func_start sub_80A9C40
sub_80A9C40: @ 80A9C40
	push {r4,r5,lr}
	ldr r5, _080A9C88 @ =sub_80A9E3C
	adds r0, r5, 0
	movs r1, 0
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _080A9C8C @ =sub_80A9C98
	adds r0, r4, 0
	adds r1, r5, 0
	bl SetTaskFuncWithFollowupFunc
	ldr r0, _080A9C90 @ =sub_80A9E04
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A9C94 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x1C]
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	strh r0, [r1, 0x1C]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A9C88: .4byte sub_80A9E3C
_080A9C8C: .4byte sub_80A9C98
_080A9C90: .4byte sub_80A9E04
_080A9C94: .4byte gTasks
	thumb_func_end sub_80A9C40

	thumb_func_start sub_80A9C98
sub_80A9C98: @ 80A9C98
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_80AE098
	ldr r1, _080A9CB8 @ =sub_80C8734
	ldr r2, _080A9CBC @ =sub_80A9CC0
	adds r0, r4, 0
	bl SetTaskFuncWithFollowupFunc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9CB8: .4byte sub_80C8734
_080A9CBC: .4byte sub_80A9CC0
	thumb_func_end sub_80A9C98

	thumb_func_start sub_80A9CC0
sub_80A9CC0: @ 80A9CC0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A9CD4 @ =sub_80C88AC
	ldr r2, _080A9CD8 @ =sub_80A9CDC
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080A9CD4: .4byte sub_80C88AC
_080A9CD8: .4byte sub_80A9CDC
	thumb_func_end sub_80A9CC0

	thumb_func_start sub_80A9CDC
sub_80A9CDC: @ 80A9CDC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A9CF0 @ =sub_80C8E1C
	ldr r2, _080A9CF4 @ =sub_80A9D58
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080A9CF0: .4byte sub_80C8E1C
_080A9CF4: .4byte sub_80A9D58
	thumb_func_end sub_80A9CDC

	thumb_func_start sub_80A9CF8
sub_80A9CF8: @ 80A9CF8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A9D28 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _080A9D20
	ldr r0, _080A9D2C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x1C]
	bl DestroyTask
	adds r0, r4, 0
	bl DestroyTask
	bl sub_8071C20
_080A9D20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9D28: .4byte gReceivedRemoteLinkPlayers
_080A9D2C: .4byte gTasks
	thumb_func_end sub_80A9CF8

	thumb_func_start sub_80A9D30
sub_80A9D30: @ 80A9D30
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_800832C
	ldr r1, _080A9D50 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A9D54 @ =sub_80A9CF8
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9D50: .4byte gTasks
_080A9D54: .4byte sub_80A9CF8
	thumb_func_end sub_80A9D30

	thumb_func_start sub_80A9D58
sub_80A9D58: @ 80A9D58
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r3, 0
	ldr r1, _080A9DA8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, 0x12
	adds r2, r0, r1
_080A9D6E:
	mov r0, sp
	adds r1, r0, r3
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _080A9D6E
	mov r0, sp
	bl sub_80C4B34
	ldr r1, _080A9DAC @ =gUnknown_0203869B
	strb r0, [r1]
	ldr r0, _080A9DB0 @ =gScriptContestCategory
	ldrb r0, [r0]
	bl sub_80AE82C
	movs r0, 0
	bl sub_80B0F28
	ldr r1, _080A9DB4 @ =sub_80C8EBC
	ldr r2, _080A9DB8 @ =sub_80A9DBC
	adds r0, r4, 0
	bl SetTaskFuncWithFollowupFunc
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9DA8: .4byte gTasks
_080A9DAC: .4byte gUnknown_0203869B
_080A9DB0: .4byte gScriptContestCategory
_080A9DB4: .4byte sub_80C8EBC
_080A9DB8: .4byte sub_80A9DBC
	thumb_func_end sub_80A9D58

	thumb_func_start sub_80A9DBC
sub_80A9DBC: @ 80A9DBC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A9DD0 @ =sub_80C8F34
	ldr r2, _080A9DD4 @ =sub_80A9DD8
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080A9DD0: .4byte sub_80C8F34
_080A9DD4: .4byte sub_80A9DD8
	thumb_func_end sub_80A9DBC

	thumb_func_start sub_80A9DD8
sub_80A9DD8: @ 80A9DD8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080A9E00 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x1C]
	bl DestroyTask
	adds r0, r4, 0
	bl DestroyTask
	bl sub_8071C20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9E00: .4byte gTasks
	thumb_func_end sub_80A9DD8

	thumb_func_start sub_80A9E04
sub_80A9E04: @ 80A9E04
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080A9E30 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x2
	bne _080A9E2A
	ldr r2, _080A9E34 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r1, [r0, 0x1C]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _080A9E38 @ =sub_80A9D30
	str r1, [r0]
_080A9E2A:
	pop {r0}
	bx r0
	.align 2, 0
_080A9E30: .4byte gMain
_080A9E34: .4byte gTasks
_080A9E38: .4byte sub_80A9D30
	thumb_func_end sub_80A9E04

	thumb_func_start sub_80A9E3C
sub_80A9E3C: @ 80A9E3C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl OpenLink
	movs r1, 0
	ldr r3, _080A9E74 @ =gBlockRecvBuffer
	movs r2, 0xFF
_080A9E4C:
	lsls r0, r1, 8
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _080A9E4C
	ldr r1, _080A9E78 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
	ldr r1, _080A9E7C @ =sub_80A9E80
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9E74: .4byte gBlockRecvBuffer
_080A9E78: .4byte gTasks
_080A9E7C: .4byte sub_80A9E80
	thumb_func_end sub_80A9E3C

	thumb_func_start sub_80A9E80
sub_80A9E80: @ 80A9E80
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A9EA0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r1, [r4, 0x8]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0x9
	bgt _080A9EA4
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
	b _080A9ECC
	.align 2, 0
_080A9EA0: .4byte gTasks
_080A9EA4:
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _080A9ECC
	movs r0, 0
	strh r0, [r4, 0x8]
	bl IsLinkMaster
	lsls r0, 24
	cmp r0, 0
	beq _080A9EC8
	ldr r0, _080A9EC4 @ =sub_80A9ED8
	b _080A9ECA
	.align 2, 0
_080A9EC4: .4byte sub_80A9ED8
_080A9EC8:
	ldr r0, _080A9ED4 @ =sub_80A9F10
_080A9ECA:
	str r0, [r4]
_080A9ECC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9ED4: .4byte sub_80A9F10
	thumb_func_end sub_80A9E80

	thumb_func_start sub_80A9ED8
sub_80A9ED8: @ 80A9ED8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080A9F08 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x65
	bne _080A9F02
	bl sub_8007F4C
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r0, _080A9F0C @ =sub_80A9F10
	str r0, [r4]
_080A9F02:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9F08: .4byte gTasks
_080A9F0C: .4byte sub_80A9F10
	thumb_func_end sub_80A9ED8

	thumb_func_start sub_80A9F10
sub_80A9F10: @ 80A9F10
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080A9F44 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _080A9F3E
	bl GetMultiplayerId
	ldr r1, _080A9F48 @ =gUnknown_02038695
	strb r0, [r1]
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _080A9F3E
	ldr r1, _080A9F4C @ =gUnknown_0203869A
	movs r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	bl SwitchTaskToFollowupFunc
_080A9F3E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9F44: .4byte gReceivedRemoteLinkPlayers
_080A9F48: .4byte gUnknown_02038695
_080A9F4C: .4byte gUnknown_0203869A
	thumb_func_end sub_80A9F10

	thumb_func_start sub_80A9F50
sub_80A9F50: @ 80A9F50
	push {r4,lr}
	movs r2, 0x80
	lsls r2, 19
	movs r0, 0x40
	strh r0, [r2]
	ldrh r0, [r2]
	movs r3, 0x88
	lsls r3, 5
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r4, _080A9FB8 @ =gWindowConfig_81E6C3C
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, _080A9FBC @ =gMenuWindow
	adds r1, r4, 0
	bl InitWindowFromConfig
	ldr r0, _080A9FC0 @ =REG_MOSAIC
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x44
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r0, _080A9FC4 @ =gUnknown_030042A4
	strh r1, [r0]
	ldr r0, _080A9FC8 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r0, _080A9FCC @ =gUnknown_030042C0
	strh r1, [r0]
	ldr r0, _080A9FD0 @ =gUnknown_030041B4
	strh r1, [r0]
	ldr r0, _080A9FD4 @ =gUnknown_03004288
	strh r1, [r0]
	ldr r0, _080A9FD8 @ =gUnknown_03004280
	strh r1, [r0]
	ldr r0, _080A9FDC @ =gUnknown_030041B0
	strh r1, [r0]
	ldr r0, _080A9FE0 @ =gUnknown_030041B8
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9FB8: .4byte gWindowConfig_81E6C3C
_080A9FBC: .4byte gMenuWindow
_080A9FC0: .4byte REG_MOSAIC
_080A9FC4: .4byte gUnknown_030042A4
_080A9FC8: .4byte gUnknown_030042A0
_080A9FCC: .4byte gUnknown_030042C0
_080A9FD0: .4byte gUnknown_030041B4
_080A9FD4: .4byte gUnknown_03004288
_080A9FD8: .4byte gUnknown_03004280
_080A9FDC: .4byte gUnknown_030041B0
_080A9FE0: .4byte gUnknown_030041B8
	thumb_func_end sub_80A9F50

	thumb_func_start sub_80A9FE4
sub_80A9FE4: @ 80A9FE4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r1, _080AA054 @ =gUnknown_083C9228
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	add r5, sp, 0x8
	movs r6, 0
	ldr r1, _080AA058 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	mov r12, r5
	ldr r7, _080AA05C @ =0x85000400
	movs r0, 0x85
	lsls r0, 24
	mov r8, r0
_080AA012:
	str r6, [sp, 0x8]
	mov r0, r12
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080AA012
	str r6, [sp, 0x8]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xC0
	lsls r0, 19
	mov r1, sp
	bl sub_80034D4
	ldr r0, _080AA060 @ =gWindowConfig_81E6C3C
	bl LoadFontDefaultPalette
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA054: .4byte gUnknown_083C9228
_080AA058: .4byte 0x040000d4
_080AA05C: .4byte 0x85000400
_080AA060: .4byte gWindowConfig_81E6C3C
	thumb_func_end sub_80A9FE4

	thumb_func_start sub_80AA064
sub_80AA064: @ 80AA064
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl UpdatePaletteFade
	ldr r0, _080AA088 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x4
	bne _080AA084
	ldr r0, _080AA08C @ =sub_805469C
	bl SetMainCallback2
_080AA084:
	pop {r0}
	bx r0
	.align 2, 0
_080AA088: .4byte gMain
_080AA08C: .4byte sub_805469C
	thumb_func_end sub_80AA064

	thumb_func_start sub_80AA090
sub_80AA090: @ 80AA090
	push {lr}
	ldr r1, _080AA0E8 @ =REG_BG0HOFS
	ldr r0, _080AA0EC @ =gUnknown_030042A4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080AA0F0 @ =gUnknown_030042A0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080AA0F4 @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080AA0F8 @ =gUnknown_030041B4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080AA0FC @ =gUnknown_03004288
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080AA100 @ =gUnknown_03004280
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080AA104 @ =gUnknown_030041B0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080AA108 @ =gUnknown_030041B8
	ldrh r0, [r0]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8089668
	pop {r0}
	bx r0
	.align 2, 0
_080AA0E8: .4byte REG_BG0HOFS
_080AA0EC: .4byte gUnknown_030042A4
_080AA0F0: .4byte gUnknown_030042A0
_080AA0F4: .4byte gUnknown_030042C0
_080AA0F8: .4byte gUnknown_030041B4
_080AA0FC: .4byte gUnknown_03004288
_080AA100: .4byte gUnknown_03004280
_080AA104: .4byte gUnknown_030041B0
_080AA108: .4byte gUnknown_030041B8
	thumb_func_end sub_80AA090

	thumb_func_start sub_80AA10C
sub_80AA10C: @ 80AA10C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r4, _080AA238 @ =gPaletteFade
	ldrb r0, [r4, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4, 0x8]
	movs r0, 0
	bl SetVBlankCallback
	bl sub_80A9F50
	bl dp12_8087EA4
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	bl FreeAllSpritePalettes
	bl sub_80A9FE4
	ldr r0, _080AA23C @ =sub_80AA090
	bl SetVBlankCallback
	ldr r0, _080AA240 @ =sub_80AA064
	bl SetMainCallback2
	ldrb r1, [r4, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r4, 0x8]
	ldr r4, _080AA244 @ =gUnknown_02038694
	movs r0, 0
	strb r0, [r4]
	ldr r0, _080AA248 @ =gUnknown_02038570
	ldrb r0, [r0, 0x2]
	cmp r0, 0
	bne _080AA16A
	movs r0, 0
	movs r1, 0
	bl sub_80AE398
_080AA16A:
	ldrb r0, [r4]
	bl sub_80AE098
	movs r5, 0
	ldr r6, _080AA24C @ =gUnknown_083C9276
	adds r0, r6, 0x1
	mov r8, r0
	ldr r7, _080AA250 @ =gUnknown_083C9364
_080AA17A:
	lsls r2, r5, 2
	adds r0, r2, r7
	ldr r1, [r0]
	adds r2, r5
	lsls r2, 17
	movs r0, 0xA8
	lsls r0, 14
	adds r2, r0
	lsrs r2, 16
	lsls r4, r5, 1
	adds r0, r4, r6
	ldrb r3, [r0]
	add r4, r8
	ldrb r0, [r4]
	str r0, [sp]
	ldr r0, _080AA254 @ =gMenuWindow
	bl sub_8003460
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080AA17A
	ldr r1, _080AA258 @ =gScriptContestCategory
	ldr r4, _080AA25C @ =gSpecialVar_0x8010
	movs r0, 0
	strh r0, [r4]
	strh r0, [r1]
	movs r5, 0
	movs r0, 0
	bl sub_80AA5BC
	ldrb r0, [r4]
	bl sub_80AA5E8
	ldr r4, _080AA254 @ =gMenuWindow
	ldr r1, _080AA260 @ =gUnknown_083C9337
	movs r0, 0x12
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0xD6
	movs r3, 0x12
	bl sub_8003460
	ldr r1, _080AA264 @ =gUnknown_083C933B
	movs r0, 0xC
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0xDC
	movs r3, 0
	bl sub_8003460
	ldr r0, _080AA268 @ =gUnknown_083C92B4
	bl LoadSpriteSheet
	ldr r0, _080AA26C @ =gUnknown_083C92BC
	bl LoadSpritePalette
	movs r0, 0x3
	bl sub_80AA280
	movs r0, 0x3
	bl sub_80AA658
	movs r0, 0x3
	movs r1, 0
	bl sub_80AA614
	ldr r0, _080AA270 @ =gSpriteTemplate_83C92CC
	ldr r1, _080AA274 @ =gUnknown_083C9296
	ldrb r1, [r1, 0x3]
	ldr r2, _080AA278 @ =gUnknown_083C92A8
	ldrb r2, [r2, 0x1]
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080AA27C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x2E]
	strh r0, [r1, 0x30]
	movs r0, 0x3
	strh r0, [r1, 0x32]
	strh r5, [r1, 0x34]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA238: .4byte gPaletteFade
_080AA23C: .4byte sub_80AA090
_080AA240: .4byte sub_80AA064
_080AA244: .4byte gUnknown_02038694
_080AA248: .4byte gUnknown_02038570
_080AA24C: .4byte gUnknown_083C9276
_080AA250: .4byte gUnknown_083C9364
_080AA254: .4byte gMenuWindow
_080AA258: .4byte gScriptContestCategory
_080AA25C: .4byte gSpecialVar_0x8010
_080AA260: .4byte gUnknown_083C9337
_080AA264: .4byte gUnknown_083C933B
_080AA268: .4byte gUnknown_083C92B4
_080AA26C: .4byte gUnknown_083C92BC
_080AA270: .4byte gSpriteTemplate_83C92CC
_080AA274: .4byte gUnknown_083C9296
_080AA278: .4byte gUnknown_083C92A8
_080AA27C: .4byte gSprites
	thumb_func_end sub_80AA10C

	thumb_func_start sub_80AA280
sub_80AA280: @ 80AA280
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080AA2E8 @ =gMenuWindow
	movs r1, 0x1E
	str r1, [sp]
	movs r1, 0x3
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl FillWindowRect_DefaultPalette
	ldr r4, _080AA2EC @ =0x02000000
	ldr r1, _080AA2F0 @ =gUnknown_083C932C
	adds r0, r4, 0
	bl StringCopy
	lsls r1, r7, 6
	ldr r0, _080AA2F4 @ =gUnknown_0203857D
	adds r1, r0
	adds r0, r4, 0
	bl StringAppend
	movs r5, 0
	ldr r6, _080AA2F8 @ =gUnknown_083C926E
	adds r0, r6, 0x1
	mov r8, r0
_080AA2BE:
	cmp r7, r5
	bne _080AA2FC
	lsls r2, r5, 2
	adds r2, r5
	lsls r2, 17
	movs r0, 0x80
	lsls r0, 10
	adds r2, r0
	lsrs r2, 16
	lsls r1, r5, 1
	adds r0, r1, r6
	ldrb r3, [r0]
	add r1, r8
	ldrb r0, [r1]
	str r0, [sp]
	ldr r0, _080AA2E8 @ =gMenuWindow
	ldr r1, _080AA2EC @ =0x02000000
	bl sub_8003460
	b _080AA322
	.align 2, 0
_080AA2E8: .4byte gMenuWindow
_080AA2EC: .4byte 0x02000000
_080AA2F0: .4byte gUnknown_083C932C
_080AA2F4: .4byte gUnknown_0203857D
_080AA2F8: .4byte gUnknown_083C926E
_080AA2FC:
	lsls r1, r5, 6
	ldr r0, _080AA338 @ =gUnknown_0203857D
	adds r1, r0
	lsls r2, r5, 2
	adds r2, r5
	lsls r2, 17
	movs r0, 0x80
	lsls r0, 10
	adds r2, r0
	lsrs r2, 16
	lsls r4, r5, 1
	adds r0, r4, r6
	ldrb r3, [r0]
	add r4, r8
	ldrb r0, [r4]
	str r0, [sp]
	ldr r0, _080AA33C @ =gMenuWindow
	bl sub_8003460
_080AA322:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080AA2BE
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA338: .4byte gUnknown_0203857D
_080AA33C: .4byte gMenuWindow
	thumb_func_end sub_80AA280

	thumb_func_start sub_80AA340
sub_80AA340: @ 80AA340
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	ldr r4, _080AA378 @ =0x02000000
	ldr r1, _080AA37C @ =gUnknown_02038570
	lsrs r0, 18
	adds r0, r1
	adds r0, 0x26
	ldrb r1, [r0]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _080AA380 @ =gMenuWindow
	ldr r1, _080AA384 @ =gUnknown_083C9282
	ldrb r3, [r1]
	ldrb r1, [r1, 0x1]
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0x66
	bl sub_8003460
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA378: .4byte 0x02000000
_080AA37C: .4byte gUnknown_02038570
_080AA380: .4byte gMenuWindow
_080AA384: .4byte gUnknown_083C9282
	thumb_func_end sub_80AA340

	thumb_func_start sub_80AA388
sub_80AA388: @ 80AA388
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	ldr r4, _080AA3C0 @ =0x02000000
	ldr r1, _080AA3C4 @ =gUnknown_02038570
	lsrs r0, 18
	adds r0, r1
	adds r0, 0x28
	ldrb r1, [r0]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _080AA3C8 @ =gMenuWindow
	ldr r1, _080AA3CC @ =gUnknown_083C9282
	ldrb r3, [r1, 0x2]
	ldrb r1, [r1, 0x3]
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0x6C
	bl sub_8003460
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA3C0: .4byte 0x02000000
_080AA3C4: .4byte gUnknown_02038570
_080AA3C8: .4byte gMenuWindow
_080AA3CC: .4byte gUnknown_083C9282
	thumb_func_end sub_80AA388

	thumb_func_start sub_80AA3D0
sub_80AA3D0: @ 80AA3D0
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	ldr r4, _080AA408 @ =0x02000000
	ldr r1, _080AA40C @ =gUnknown_02038570
	lsrs r0, 18
	adds r0, r1
	adds r0, 0x27
	ldrb r1, [r0]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _080AA410 @ =gMenuWindow
	ldr r1, _080AA414 @ =gUnknown_083C9282
	ldrb r3, [r1, 0x4]
	ldrb r1, [r1, 0x5]
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0x72
	bl sub_8003460
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA408: .4byte 0x02000000
_080AA40C: .4byte gUnknown_02038570
_080AA410: .4byte gMenuWindow
_080AA414: .4byte gUnknown_083C9282
	thumb_func_end sub_80AA3D0

	thumb_func_start sub_80AA418
sub_80AA418: @ 80AA418
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	ldr r4, _080AA450 @ =0x02000000
	ldr r1, _080AA454 @ =gUnknown_02038570
	lsrs r0, 18
	adds r0, r1
	adds r0, 0x29
	ldrb r1, [r0]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _080AA458 @ =gMenuWindow
	ldr r1, _080AA45C @ =gUnknown_083C9282
	ldrb r3, [r1, 0x6]
	ldrb r1, [r1, 0x7]
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0x78
	bl sub_8003460
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA450: .4byte 0x02000000
_080AA454: .4byte gUnknown_02038570
_080AA458: .4byte gMenuWindow
_080AA45C: .4byte gUnknown_083C9282
	thumb_func_end sub_80AA418

	thumb_func_start sub_80AA460
sub_80AA460: @ 80AA460
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	ldr r4, _080AA498 @ =0x02000000
	ldr r1, _080AA49C @ =gUnknown_02038570
	lsrs r0, 18
	adds r0, r1
	adds r0, 0x2A
	ldrb r1, [r0]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _080AA4A0 @ =gMenuWindow
	ldr r1, _080AA4A4 @ =gUnknown_083C9282
	ldrb r3, [r1, 0x8]
	ldrb r1, [r1, 0x9]
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0x7E
	bl sub_8003460
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA498: .4byte 0x02000000
_080AA49C: .4byte gUnknown_02038570
_080AA4A0: .4byte gMenuWindow
_080AA4A4: .4byte gUnknown_083C9282
	thumb_func_end sub_80AA460

	thumb_func_start sub_80AA4A8
sub_80AA4A8: @ 80AA4A8
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	ldr r4, _080AA4E0 @ =0x02000000
	ldr r1, _080AA4E4 @ =gUnknown_02038570
	lsrs r0, 18
	adds r0, r1
	adds r0, 0x2B
	ldrb r1, [r0]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _080AA4E8 @ =gMenuWindow
	ldr r1, _080AA4EC @ =gUnknown_083C9282
	ldrb r3, [r1, 0xA]
	ldrb r1, [r1, 0xB]
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0x84
	bl sub_8003460
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA4E0: .4byte 0x02000000
_080AA4E4: .4byte gUnknown_02038570
_080AA4E8: .4byte gMenuWindow
_080AA4EC: .4byte gUnknown_083C9282
	thumb_func_end sub_80AA4A8

	thumb_func_start sub_80AA4F0
sub_80AA4F0: @ 80AA4F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r4, r0, 0
	adds r6, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r7, _080AA5A8 @ =gMenuWindow
	ldr r0, _080AA5AC @ =gUnknown_083C928E
	lsls r5, r6, 1
	adds r1, r5, r0
	ldrb r1, [r1]
	mov r9, r1
	adds r0, 0x1
	adds r0, r5, r0
	ldrb r0, [r0]
	mov r10, r0
	movs r0, 0x7
	add r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	str r0, [sp]
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	adds r0, r7, 0
	movs r1, 0
	mov r2, r9
	mov r3, r10
	bl FillWindowRect_DefaultPalette
	ldr r0, _080AA5B0 @ =gUnknown_02038570
	lsls r4, 6
	adds r4, r5, r4
	adds r0, 0x1E
	adds r4, r0
	ldrh r1, [r4]
	movs r0, 0xD
	muls r1, r0
	ldr r0, _080AA5B4 @ =gMoveNames
	adds r1, r0
	lsls r2, r6, 3
	subs r2, r6
	lsls r2, 17
	movs r0, 0x8A
	lsls r0, 16
	adds r2, r0
	lsrs r2, 16
	mov r0, r10
	str r0, [sp]
	adds r0, r7, 0
	mov r3, r9
	bl sub_8003460
	ldr r0, _080AA5B8 @ =gStringVar1
	mov r9, r0
	ldrh r1, [r4]
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r5, r6
	lsls r5, 17
	movs r0, 0xFA
	lsls r0, 16
	adds r5, r0
	lsrs r5, 16
	mov r0, r10
	str r0, [sp]
	adds r0, r7, 0
	mov r1, r9
	adds r2, r5, 0
	mov r3, r8
	bl sub_8003460
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA5A8: .4byte gMenuWindow
_080AA5AC: .4byte gUnknown_083C928E
_080AA5B0: .4byte gUnknown_02038570
_080AA5B4: .4byte gMoveNames
_080AA5B8: .4byte gStringVar1
	thumb_func_end sub_80AA4F0

	thumb_func_start sub_80AA5BC
sub_80AA5BC: @ 80AA5BC
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	ldr r2, _080AA5E0 @ =gMenuWindow
	ldr r1, _080AA5E4 @ =gUnknown_083C93B4
	lsrs r0, 22
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x12
	str r0, [sp]
	adds r0, r2, 0
	movs r2, 0xC2
	movs r3, 0x3
	bl sub_8003460
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080AA5E0: .4byte gMenuWindow
_080AA5E4: .4byte gUnknown_083C93B4
	thumb_func_end sub_80AA5BC

	thumb_func_start sub_80AA5E8
sub_80AA5E8: @ 80AA5E8
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	ldr r2, _080AA60C @ =gMenuWindow
	ldr r1, _080AA610 @ =gUnknown_083C93F0
	lsrs r0, 22
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x4
	str r0, [sp]
	adds r0, r2, 0
	movs r2, 0xE8
	movs r3, 0x3
	bl sub_8003460
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080AA60C: .4byte gMenuWindow
_080AA610: .4byte gUnknown_083C93F0
	thumb_func_end sub_80AA5E8

	thumb_func_start sub_80AA614
sub_80AA614: @ 80AA614
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	bl sub_80AE770
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r4, _080AA650 @ =0x02000000
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	ldr r0, _080AA654 @ =gMenuWindow
	movs r1, 0xC
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0xE2
	movs r3, 0x3
	bl sub_8003460
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA650: .4byte 0x02000000
_080AA654: .4byte gMenuWindow
	thumb_func_end sub_80AA614

	thumb_func_start sub_80AA658
sub_80AA658: @ 80AA658
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_80AA340
	adds r0, r5, 0
	bl sub_80AA388
	adds r0, r5, 0
	bl sub_80AA3D0
	adds r0, r5, 0
	bl sub_80AA418
	adds r0, r5, 0
	bl sub_80AA460
	adds r0, r5, 0
	bl sub_80AA4A8
	movs r4, 0
_080AA684:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80AA4F0
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080AA684
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80AA658

	thumb_func_start sub_80AA69C
sub_80AA69C: @ 80AA69C
	push {r4-r6,lr}
	ldr r6, _080AA748 @ =gPlayerParty
	ldr r5, _080AA74C @ =gUnknown_02038695
	ldrb r2, [r5]
	lsls r2, 6
	ldr r4, _080AA750 @ =gUnknown_02038596
	adds r2, r4
	adds r0, r6, 0
	movs r1, 0x16
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 6
	adds r0, r4, 0x2
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x18
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 6
	adds r0, r4, 0x1
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x17
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 6
	adds r0, r4, 0x3
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x21
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 6
	adds r0, r4, 0x4
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x2F
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 6
	adds r0, r4, 0x5
	adds r2, r0
	adds r0, r6, 0
	movs r1, 0x30
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 6
	subs r4, 0x8
	adds r2, r4
	adds r0, r6, 0
	movs r1, 0xD
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 6
	adds r2, r4
	adds r2, 0x2
	adds r0, r6, 0
	movs r1, 0xE
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 6
	adds r2, r4
	adds r2, 0x4
	adds r0, r6, 0
	movs r1, 0xF
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 6
	adds r2, r4
	adds r2, 0x6
	adds r0, r6, 0
	movs r1, 0x10
	bl SetMonData
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AA748: .4byte gPlayerParty
_080AA74C: .4byte gUnknown_02038695
_080AA750: .4byte gUnknown_02038596
	thumb_func_end sub_80AA69C

	thumb_func_start sub_80AA754
sub_80AA754: @ 80AA754
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080AA774 @ =gMain
	ldrh r1, [r0, 0x30]
	cmp r1, 0x20
	beq _080AA7A2
	cmp r1, 0x20
	bgt _080AA782
	cmp r1, 0x2
	beq _080AA7F8
	cmp r1, 0x2
	bgt _080AA778
	cmp r1, 0x1
	beq _080AA7D8
	b _080AA870
	.align 2, 0
_080AA774: .4byte gMain
_080AA778:
	cmp r1, 0x8
	beq _080AA868
	cmp r1, 0x10
	beq _080AA7A2
	b _080AA870
_080AA782:
	cmp r1, 0x80
	beq _080AA7C2
	cmp r1, 0x80
	bgt _080AA790
	cmp r1, 0x40
	beq _080AA7AC
	b _080AA870
_080AA790:
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	beq _080AA814
	movs r0, 0x80
	lsls r0, 2
	cmp r1, r0
	beq _080AA834
	b _080AA870
_080AA7A2:
	ldrh r0, [r4, 0x2E]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x2E]
	b _080AA870
_080AA7AC:
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080AA7BC
	movs r0, 0x8
	strh r0, [r4, 0x30]
	b _080AA870
_080AA7BC:
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _080AA870
_080AA7C2:
	ldrh r1, [r4, 0x30]
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	cmp r0, 0x8
	bne _080AA7D2
	movs r0, 0
	strh r0, [r4, 0x30]
	b _080AA870
_080AA7D2:
	adds r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _080AA870
_080AA7D8:
	ldr r2, _080AA7F4 @ =gUnknown_083C92E4
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r0, 2
	movs r3, 0x30
	ldrsh r1, [r4, r3]
	lsls r1, 3
	adds r0, r1
	adds r0, r2
	ldr r2, [r0]
	adds r0, r4, 0
	movs r1, 0x1
	b _080AA84E
	.align 2, 0
_080AA7F4: .4byte gUnknown_083C92E4
_080AA7F8:
	ldr r1, _080AA810 @ =gUnknown_083C92E4
	movs r0, 0x2E
	ldrsh r2, [r4, r0]
	lsls r2, 2
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	lsls r0, 3
	adds r2, r0
	adds r2, r1
	movs r1, 0x1
	negs r1, r1
	b _080AA84A
	.align 2, 0
_080AA810: .4byte gUnknown_083C92E4
_080AA814:
	ldr r2, _080AA830 @ =gUnknown_083C92E4
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r0, 2
	movs r3, 0x30
	ldrsh r1, [r4, r3]
	lsls r1, 3
	adds r0, r1
	adds r0, r2
	ldr r2, [r0]
	adds r0, r4, 0
	movs r1, 0xA
	b _080AA84E
	.align 2, 0
_080AA830: .4byte gUnknown_083C92E4
_080AA834:
	ldr r1, _080AA864 @ =gUnknown_083C92E4
	movs r0, 0x2E
	ldrsh r2, [r4, r0]
	lsls r2, 2
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	lsls r0, 3
	adds r2, r0
	adds r2, r1
	movs r1, 0xA
	negs r1, r1
_080AA84A:
	ldr r2, [r2]
	adds r0, r4, 0
_080AA84E:
	bl _call_via_r2
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x34]
	lsls r1, 24
	lsrs r1, 24
	bl sub_80AA614
	b _080AA870
	.align 2, 0
_080AA864: .4byte gUnknown_083C92E4
_080AA868:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80AAD08
_080AA870:
	ldr r2, _080AA898 @ =gUnknown_083C9296
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	lsls r0, 1
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	strh r0, [r4, 0x20]
	ldr r1, _080AA89C @ =gUnknown_083C92A8
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x22]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AA898: .4byte gUnknown_083C9296
_080AA89C: .4byte gUnknown_083C92A8
	thumb_func_end sub_80AA754

	thumb_func_start sub_80AA8A0
sub_80AA8A0: @ 80AA8A0
	push {r4,lr}
	adds r4, r0, 0
	lsls r2, 24
	lsrs r0, r2, 24
	lsls r1, 24
	asrs r1, 24
	cmp r1, 0x1
	bne _080AA8C0
	strh r0, [r4, 0x32]
	bl sub_80AA280
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80AA658
_080AA8C0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AA8A0

	thumb_func_start sub_80AA8C8
sub_80AA8C8: @ 80AA8C8
	push {lr}
	lsls r1, 24
	asrs r1, 24
	movs r2, 0
	bl sub_80AA8A0
	pop {r0}
	bx r0
	thumb_func_end sub_80AA8C8

	thumb_func_start sub_80AA8D8
sub_80AA8D8: @ 80AA8D8
	push {lr}
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x1
	bl sub_80AA8A0
	pop {r0}
	bx r0
	thumb_func_end sub_80AA8D8

	thumb_func_start sub_80AA8E8
sub_80AA8E8: @ 80AA8E8
	push {lr}
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x2
	bl sub_80AA8A0
	pop {r0}
	bx r0
	thumb_func_end sub_80AA8E8

	thumb_func_start sub_80AA8F8
sub_80AA8F8: @ 80AA8F8
	push {lr}
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x3
	bl sub_80AA8A0
	pop {r0}
	bx r0
	thumb_func_end sub_80AA8F8

	thumb_func_start sub_80AA908
sub_80AA908: @ 80AA908
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	asrs r2, 24
	adds r2, r1
	lsls r2, 16
	lsrs r0, r2, 16
	asrs r2, 16
	cmp r2, 0xFF
	ble _080AA922
	movs r0, 0xFF
	b _080AA928
_080AA922:
	cmp r2, 0
	bge _080AA928
	movs r0, 0
_080AA928:
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80AA908

	thumb_func_start sub_80AA930
sub_80AA930: @ 80AA930
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080AA970 @ =gUnknown_02038570
	movs r3, 0x32
	ldrsh r2, [r4, r3]
	lsls r2, 6
	adds r2, r5
	adds r2, 0x26
	ldrb r3, [r2]
	lsls r2, r1, 24
	asrs r2, 24
	adds r1, r3, 0
	bl sub_80AA908
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	lsls r1, 6
	adds r1, r5
	adds r1, 0x26
	strb r0, [r1]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80AA340
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA970: .4byte gUnknown_02038570
	thumb_func_end sub_80AA930

	thumb_func_start sub_80AA974
sub_80AA974: @ 80AA974
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080AA9B4 @ =gUnknown_02038570
	movs r3, 0x32
	ldrsh r2, [r4, r3]
	lsls r2, 6
	adds r2, r5
	adds r2, 0x28
	ldrb r3, [r2]
	lsls r2, r1, 24
	asrs r2, 24
	adds r1, r3, 0
	bl sub_80AA908
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	lsls r1, 6
	adds r1, r5
	adds r1, 0x28
	strb r0, [r1]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80AA388
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA9B4: .4byte gUnknown_02038570
	thumb_func_end sub_80AA974

	thumb_func_start sub_80AA9B8
sub_80AA9B8: @ 80AA9B8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080AA9F8 @ =gUnknown_02038570
	movs r3, 0x32
	ldrsh r2, [r4, r3]
	lsls r2, 6
	adds r2, r5
	adds r2, 0x27
	ldrb r3, [r2]
	lsls r2, r1, 24
	asrs r2, 24
	adds r1, r3, 0
	bl sub_80AA908
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	lsls r1, 6
	adds r1, r5
	adds r1, 0x27
	strb r0, [r1]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80AA3D0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AA9F8: .4byte gUnknown_02038570
	thumb_func_end sub_80AA9B8

	thumb_func_start sub_80AA9FC
sub_80AA9FC: @ 80AA9FC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080AAA3C @ =gUnknown_02038570
	movs r3, 0x32
	ldrsh r2, [r4, r3]
	lsls r2, 6
	adds r2, r5
	adds r2, 0x29
	ldrb r3, [r2]
	lsls r2, r1, 24
	asrs r2, 24
	adds r1, r3, 0
	bl sub_80AA908
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	lsls r1, 6
	adds r1, r5
	adds r1, 0x29
	strb r0, [r1]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80AA418
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AAA3C: .4byte gUnknown_02038570
	thumb_func_end sub_80AA9FC

	thumb_func_start sub_80AAA40
sub_80AAA40: @ 80AAA40
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080AAA80 @ =gUnknown_02038570
	movs r3, 0x32
	ldrsh r2, [r4, r3]
	lsls r2, 6
	adds r2, r5
	adds r2, 0x2A
	ldrb r3, [r2]
	lsls r2, r1, 24
	asrs r2, 24
	adds r1, r3, 0
	bl sub_80AA908
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	lsls r1, 6
	adds r1, r5
	adds r1, 0x2A
	strb r0, [r1]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80AA460
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AAA80: .4byte gUnknown_02038570
	thumb_func_end sub_80AAA40

	thumb_func_start sub_80AAA84
sub_80AAA84: @ 80AAA84
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080AAAC4 @ =gUnknown_02038570
	movs r3, 0x32
	ldrsh r2, [r4, r3]
	lsls r2, 6
	adds r2, r5
	adds r2, 0x2B
	ldrb r3, [r2]
	lsls r2, r1, 24
	asrs r2, 24
	adds r1, r3, 0
	bl sub_80AA908
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	lsls r1, 6
	adds r1, r5
	adds r1, 0x2B
	strb r0, [r1]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80AA4A8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AAAC4: .4byte gUnknown_02038570
	thumb_func_end sub_80AAA84

	thumb_func_start sub_80AAAC8
sub_80AAAC8: @ 80AAAC8
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	asrs r2, 24
	adds r1, r2
	lsls r1, 16
	lsrs r0, r1, 16
	asrs r1, 16
	movs r2, 0xB1
	lsls r2, 1
	cmp r1, r2
	ble _080AAAE6
	movs r0, 0x1
	b _080AAAEC
_080AAAE6:
	cmp r1, 0
	bge _080AAAEC
	adds r0, r2, 0
_080AAAEC:
	pop {r1}
	bx r1
	thumb_func_end sub_80AAAC8

	thumb_func_start sub_80AAAF0
sub_80AAAF0: @ 80AAAF0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080AAB2C @ =gUnknown_02038570
	movs r3, 0x32
	ldrsh r2, [r4, r3]
	lsls r2, 6
	adds r2, r5
	ldrh r3, [r2, 0x1E]
	lsls r2, r1, 24
	asrs r2, 24
	adds r1, r3, 0
	bl sub_80AAAC8
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	lsls r1, 6
	adds r1, r5
	strh r0, [r1, 0x1E]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_80AA4F0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AAB2C: .4byte gUnknown_02038570
	thumb_func_end sub_80AAAF0

	thumb_func_start sub_80AAB30
sub_80AAB30: @ 80AAB30
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080AAB6C @ =gUnknown_02038570
	movs r3, 0x32
	ldrsh r2, [r4, r3]
	lsls r2, 6
	adds r2, r5
	ldrh r3, [r2, 0x20]
	lsls r2, r1, 24
	asrs r2, 24
	adds r1, r3, 0
	bl sub_80AAAC8
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	lsls r1, 6
	adds r1, r5
	strh r0, [r1, 0x20]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl sub_80AA4F0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AAB6C: .4byte gUnknown_02038570
	thumb_func_end sub_80AAB30

	thumb_func_start sub_80AAB70
sub_80AAB70: @ 80AAB70
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080AABAC @ =gUnknown_02038570
	movs r3, 0x32
	ldrsh r2, [r4, r3]
	lsls r2, 6
	adds r2, r5
	ldrh r3, [r2, 0x22]
	lsls r2, r1, 24
	asrs r2, 24
	adds r1, r3, 0
	bl sub_80AAAC8
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	lsls r1, 6
	adds r1, r5
	strh r0, [r1, 0x22]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl sub_80AA4F0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AABAC: .4byte gUnknown_02038570
	thumb_func_end sub_80AAB70

	thumb_func_start sub_80AABB0
sub_80AABB0: @ 80AABB0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080AABEC @ =gUnknown_02038570
	movs r3, 0x32
	ldrsh r2, [r4, r3]
	lsls r2, 6
	adds r2, r5
	ldrh r3, [r2, 0x24]
	lsls r2, r1, 24
	asrs r2, 24
	adds r1, r3, 0
	bl sub_80AAAC8
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	lsls r1, 6
	adds r1, r5
	strh r0, [r1, 0x24]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl sub_80AA4F0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AABEC: .4byte gUnknown_02038570
	thumb_func_end sub_80AABB0

	thumb_func_start sub_80AABF0
sub_80AABF0: @ 80AABF0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	movs r0, 0xFF
	cmp r1, 0
	ble _080AABFE
	movs r0, 0x1
_080AABFE:
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r5, 0x34]
	adds r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	asrs r0, 24
	cmp r0, 0
	bge _080AAC14
	movs r4, 0
	b _080AAC1A
_080AAC14:
	cmp r0, 0x4
	ble _080AAC1A
	movs r4, 0x4
_080AAC1A:
	lsls r4, 24
	lsrs r0, r4, 24
	bl sub_80AA5BC
	asrs r4, 24
	strh r4, [r5, 0x34]
	ldr r0, _080AAC54 @ =gScriptContestCategory
	strh r4, [r0]
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080AAC58 @ =gSpecialVar_0x8010
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_80AE398
	ldrh r0, [r5, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80AA280
	ldrh r0, [r5, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80AA658
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AAC54: .4byte gScriptContestCategory
_080AAC58: .4byte gSpecialVar_0x8010
	thumb_func_end sub_80AABF0

	thumb_func_start sub_80AAC5C
sub_80AAC5C: @ 80AAC5C
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	cmp r1, 0
	ble _080AAC78
	ldr r1, _080AAC74 @ =gSpecialVar_0x8010
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	adds r4, r1, 0
	b _080AAC86
	.align 2, 0
_080AAC74: .4byte gSpecialVar_0x8010
_080AAC78:
	ldr r0, _080AACBC @ =gSpecialVar_0x8010
	ldrh r2, [r0]
	adds r4, r0, 0
	cmp r2, 0
	beq _080AAC86
	subs r0, r2, 0x1
	strh r0, [r4]
_080AAC86:
	adds r1, r4, 0
	ldrh r0, [r1]
	cmp r0, 0x3
	bls _080AAC92
	movs r0, 0x3
	strh r0, [r1]
_080AAC92:
	ldrb r0, [r4]
	bl sub_80AA5E8
	ldr r0, _080AACC0 @ =gScriptContestCategory
	ldrb r0, [r0]
	ldrb r1, [r4]
	bl sub_80AE398
	ldrh r0, [r5, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80AA280
	ldrh r0, [r5, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80AA658
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AACBC: .4byte gSpecialVar_0x8010
_080AACC0: .4byte gScriptContestCategory
	thumb_func_end sub_80AAC5C

	thumb_func_start sub_80AACC4
sub_80AACC4: @ 80AACC4
	push {lr}
	bl UpdatePaletteFade
	ldr r0, _080AACF8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080AACF4
	bl sub_80AA69C
	ldr r0, _080AACFC @ =gUnknown_0203869A
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080AACEE
	ldr r0, _080AAD00 @ =0x02000000
	ldrb r0, [r0]
	bl sub_80AE82C
_080AACEE:
	ldr r0, _080AAD04 @ =sub_80AB47C
	bl SetMainCallback2
_080AACF4:
	pop {r0}
	bx r0
	.align 2, 0
_080AACF8: .4byte gPaletteFade
_080AACFC: .4byte gUnknown_0203869A
_080AAD00: .4byte 0x02000000
_080AAD04: .4byte sub_80AB47C
	thumb_func_end sub_80AACC4

	thumb_func_start sub_80AAD08
sub_80AAD08: @ 80AAD08
	push {r4,lr}
	sub sp, 0x4
	lsls r1, 24
	asrs r1, 24
	cmp r1, 0x1
	bne _080AAD32
	ldr r1, _080AAD3C @ =0x02000000
	ldrh r0, [r0, 0x34]
	movs r4, 0
	strb r0, [r1]
	ldr r0, _080AAD40 @ =sub_80AACC4
	bl SetMainCallback2
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_080AAD32:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AAD3C: .4byte 0x02000000
_080AAD40: .4byte sub_80AACC4
	thumb_func_end sub_80AAD08

	thumb_func_start sub_80AAD44
sub_80AAD44: @ 80AAD44
	push {r4,r5,lr}
	lsls r1, 24
	asrs r1, 24
	cmp r1, 0x1
	bne _080AAD72
	bl sub_80AA69C
	movs r4, 0
	ldr r5, _080AAD78 @ =gUnknown_02038670
_080AAD56:
	lsls r0, r4, 24
	lsrs r0, 24
	ldr r1, _080AAD7C @ =gScriptContestCategory
	ldrb r1, [r1]
	bl sub_80AE770
	strh r0, [r5]
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _080AAD56
	ldr r0, _080AAD80 @ =sub_805469C
	bl SetMainCallback2
_080AAD72:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AAD78: .4byte gUnknown_02038670
_080AAD7C: .4byte gScriptContestCategory
_080AAD80: .4byte sub_805469C
	thumb_func_end sub_80AAD44

	thumb_func_start sub_80AAD84
sub_80AAD84: @ 80AAD84
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x64
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x48]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x4C]
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	mov r5, r10
	adds r5, 0x1
	lsls r1, r5, 8
	ldr r0, _080AAEC4 @ =0x06018000
	subs r1, r0, r1
	movs r0, 0
	str r0, [sp, 0x44]
	ldr r4, _080AAEC8 @ =0x040000d4
	add r0, sp, 0x44
	str r0, [r4]
	str r1, [r4, 0x4]
	ldr r0, _080AAECC @ =0x85000040
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	mov r0, r9
	bl StringLength
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x8
	bls _080AADD0
	movs r7, 0x8
_080AADD0:
	movs r6, 0
	mov r8, r5
	mov r1, r10
	lsls r1, 1
	str r1, [sp, 0x58]
	ldr r2, [sp, 0x48]
	adds r2, 0x20
	str r2, [sp, 0x5C]
	cmp r6, r7
	bge _080AAE1E
	add r5, sp, 0x40
	add r0, sp, 0x20
	mov r10, r0
	ldr r2, _080AAEC4 @ =0x06018000
_080AADEC:
	mov r1, r9
	adds r0, r1, r6
	ldrb r0, [r0]
	strb r0, [r5]
	movs r0, 0xFF
	strb r0, [r5, 0x1]
	mov r0, sp
	adds r1, r5, 0
	str r2, [sp, 0x60]
	bl sub_80034D4
	mov r1, r8
	lsls r0, r1, 8
	ldr r2, [sp, 0x60]
	subs r0, r2, r0
	mov r1, r10
	str r1, [r4]
	str r0, [r4, 0x4]
	ldr r0, _080AAED0 @ =0x84000008
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r2, 0x20
	adds r6, 0x1
	cmp r6, r7
	blt _080AADEC
_080AAE1E:
	movs r1, 0x7C
	ldr r2, [sp, 0x58]
	subs r1, r2
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _080AAED4 @ =gMain
	mov r9, r0
	lsls r3, r7, 3
	add r3, r9
	ldr r0, _080AAED8 @ =gUnknown_083C9400
	ldr r1, [r0]
	ldr r2, [r0, 0x4]
	str r1, [sp, 0x50]
	str r2, [sp, 0x54]
	str r1, [r3, 0x3C]
	str r2, [r3, 0x40]
	mov r2, r8
	lsls r0, r2, 3
	movs r1, 0x80
	lsls r1, 3
	adds r2, r1, 0
	subs r2, r0
	adds r6, r3, 0
	adds r6, 0x40
	ldr r0, _080AAEDC @ =0x000003ff
	mov r8, r0
	mov r1, r8
	ands r2, r1
	ldrh r5, [r6]
	ldr r4, _080AAEE0 @ =0xfffffc00
	adds r0, r4, 0
	ands r0, r5
	orrs r0, r2
	strh r0, [r6]
	ldrh r5, [r3, 0x3E]
	ldr r2, _080AAEE4 @ =0xfffffe00
	adds r0, r2, 0
	ands r0, r5
	ldr r1, [sp, 0x48]
	orrs r0, r1
	strh r0, [r3, 0x3E]
	adds r3, 0x3C
	add r0, sp, 0x4C
	ldrb r0, [r0]
	strb r0, [r3]
	adds r1, r7, 0x1
	lsls r1, 3
	mov r0, r9
	adds r7, r1, r0
	ldr r0, [sp, 0x50]
	ldr r1, [sp, 0x54]
	str r0, [r7, 0x3C]
	str r1, [r7, 0x40]
	ldrh r0, [r6]
	lsls r0, 22
	lsrs r0, 22
	adds r0, 0x4
	adds r5, r7, 0
	adds r5, 0x40
	mov r1, r8
	ands r0, r1
	ldrh r3, [r5]
	ands r4, r3
	orrs r4, r0
	strh r4, [r5]
	ldrh r0, [r7, 0x3E]
	ands r2, r0
	ldr r0, [sp, 0x5C]
	orrs r2, r0
	strh r2, [r7, 0x3E]
	adds r1, r7, 0
	adds r1, 0x3C
	add r2, sp, 0x4C
	ldrb r2, [r2]
	strb r2, [r1]
	add sp, 0x64
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AAEC4: .4byte 0x06018000
_080AAEC8: .4byte 0x040000d4
_080AAECC: .4byte 0x85000040
_080AAED0: .4byte 0x84000008
_080AAED4: .4byte gMain
_080AAED8: .4byte gUnknown_083C9400
_080AAEDC: .4byte 0x000003ff
_080AAEE0: .4byte 0xfffffc00
_080AAEE4: .4byte 0xfffffe00
	thumb_func_end sub_80AAD84

	thumb_func_start unref_sub_80AAEE8
unref_sub_80AAEE8: @ 80AAEE8
	push {r4-r7,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r5, r3, 24
	movs r0, 0
	cmp r4, 0
	bge _080AAF08
	mov r1, sp
	movs r0, 0xAE
	strb r0, [r1]
	movs r0, 0x1
_080AAF08:
	add r0, sp
	adds r1, r4, 0
	cmp r1, 0
	bge _080AAF12
	negs r1, r1
_080AAF12:
	movs r2, 0
	movs r3, 0x8
	bl ConvertIntToDecimalStringN
	mov r0, sp
	adds r1, r7, 0
	adds r2, r6, 0
	adds r3, r5, 0
	bl sub_80AAD84
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80AAEE8

	thumb_func_start sub_80AAF30
sub_80AAF30: @ 80AAF30
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r1, _080AAFC0 @ =gUnknown_0203856C
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _080AAFC4 @ =gUnknown_02038695
	movs r0, 0x3
	strb r0, [r1]
	movs r0, 0
	bl sub_80AE098
	movs r4, 0x3
	movs r5, 0x1
	negs r5, r5
	ldr r3, _080AAFC8 @ =gUnknown_02038690
	movs r2, 0x3
_080AAF56:
	adds r1, r4, r3
	subs r0, r2, r4
	strb r0, [r1]
	subs r4, 0x1
	cmp r4, r5
	bgt _080AAF56
	movs r4, 0
	movs r6, 0
	ldr r7, _080AAFCC @ =gUnknown_02038670
	ldr r5, _080AAFD0 @ =gUnknown_02038570
	mov r9, r5
_080AAF6C:
	lsls r1, r4, 1
	strh r6, [r7]
	ldr r0, _080AAFD4 @ =gUnknown_02038680
	mov r8, r0
	adds r0, r1, r0
	strh r6, [r0]
	ldr r3, _080AAFD8 @ =gUnknown_02038678
	adds r1, r3
	strh r6, [r1]
	adds r0, r5, 0
	mov r1, r9
	adds r1, 0xC0
	movs r2, 0x40
	str r3, [sp]
	bl memcpy
	adds r7, 0x2
	adds r5, 0x40
	adds r4, 0x1
	ldr r3, [sp]
	cmp r4, 0x2
	ble _080AAF6C
	ldr r0, _080AAFCC @ =gUnknown_02038670
	movs r1, 0x96
	lsls r1, 1
	strh r1, [r0, 0x6]
	movs r0, 0xC8
	lsls r0, 1
	mov r1, r8
	strh r0, [r1, 0x6]
	strh r0, [r3, 0x6]
	movs r0, 0xFE
	bl sub_80B2A7C
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AAFC0: .4byte gUnknown_0203856C
_080AAFC4: .4byte gUnknown_02038695
_080AAFC8: .4byte gUnknown_02038690
_080AAFCC: .4byte gUnknown_02038670
_080AAFD0: .4byte gUnknown_02038570
_080AAFD4: .4byte gUnknown_02038680
_080AAFD8: .4byte gUnknown_02038678
	thumb_func_end sub_80AAF30

	thumb_func_start sub_80AAFDC
sub_80AAFDC: @ 80AAFDC
	push {lr}
	bl sub_80AAF30
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80AAFDC

	thumb_func_start sub_80AAFEC
sub_80AAFEC: @ 80AAFEC
	push {r4,lr}
	ldr r1, _080AB01C @ =gUnknown_0203856C
	movs r0, 0
	strb r0, [r1]
	movs r4, 0
	ldr r3, _080AB020 @ =gUnknown_02038678
	ldr r2, _080AB024 @ =gUnknown_02038680
	ldr r1, _080AB028 @ =gUnknown_02038670
	movs r0, 0x3
_080AAFFE:
	strh r4, [r1]
	strh r4, [r2]
	strh r4, [r3]
	adds r3, 0x2
	adds r2, 0x2
	adds r1, 0x2
	subs r0, 0x1
	cmp r0, 0
	bge _080AAFFE
	bl sub_8071C20
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080AB01C: .4byte gUnknown_0203856C
_080AB020: .4byte gUnknown_02038678
_080AB024: .4byte gUnknown_02038680
_080AB028: .4byte gUnknown_02038670
	thumb_func_end sub_80AAFEC

	thumb_func_start sub_80AB02C
sub_80AB02C: @ 80AB02C
	push {r4,r5,lr}
	ldr r1, _080AB078 @ =gUnknown_02038695
	movs r0, 0x3
	strb r0, [r1]
	movs r0, 0
	bl sub_80AE098
	movs r2, 0x3
	movs r5, 0x1
	negs r5, r5
	ldr r4, _080AB07C @ =gUnknown_02038690
	movs r3, 0x3
_080AB044:
	adds r1, r2, r4
	subs r0, r3, r2
	strb r0, [r1]
	subs r2, 0x1
	cmp r2, r5
	bgt _080AB044
	ldr r1, _080AB080 @ =gScriptContestCategory
	movs r0, 0
	strh r0, [r1]
	adds r4, r1, 0
_080AB058:
	movs r0, 0xFF
	bl sub_80B2A7C
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bls _080AB058
	bl sub_8071C20
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080AB078: .4byte gUnknown_02038695
_080AB07C: .4byte gUnknown_02038690
_080AB080: .4byte gScriptContestCategory
	thumb_func_end sub_80AB02C

	thumb_func_start unref_sub_80AB084
unref_sub_80AB084: @ 80AB084
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	mov r8, r0
	ldr r0, _080AB160 @ =REG_BG0HOFS
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x22
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	movs r2, 0x80
	lsls r2, 19
	movs r3, 0xFA
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r2]
	ldr r3, _080AB164 @ =0x04000208
	ldrh r2, [r3]
	strh r1, [r3]
	ldr r4, _080AB168 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r1, _080AB16C @ =REG_DISPSTAT
	movs r0, 0x8
	strh r0, [r1]
	bl ResetTasks
	bl ResetSpriteData
	ldr r0, _080AB170 @ =sub_80AB184
	bl SetMainCallback2
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	movs r5, 0
	ldr r1, _080AB174 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	ldr r6, _080AB178 @ =0x85000400
	movs r7, 0x85
	lsls r7, 24
_080AB108:
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r1]
	str r2, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080AB108
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r4, _080AB17C @ =gWindowConfig_81E6FD8
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r5, _080AB180 @ =gUnknown_03004210
	adds r0, r5, 0
	adds r1, r4, 0
	bl InitWindowFromConfig
	adds r0, r4, 0
	bl LoadFontDefaultPalette
	movs r0, 0x7
	str r0, [sp]
	adds r0, r5, 0
	mov r1, r8
	movs r2, 0x1
	movs r3, 0x9
	bl sub_8003460
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB160: .4byte REG_BG0HOFS
_080AB164: .4byte 0x04000208
_080AB168: .4byte 0x04000200
_080AB16C: .4byte REG_DISPSTAT
_080AB170: .4byte sub_80AB184
_080AB174: .4byte 0x040000d4
_080AB178: .4byte 0x85000400
_080AB17C: .4byte gWindowConfig_81E6FD8
_080AB180: .4byte gUnknown_03004210
	thumb_func_end unref_sub_80AB084

	thumb_func_start sub_80AB184
sub_80AB184: @ 80AB184
	ldr r0, _080AB1A8 @ =REG_BG0HOFS
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	.align 2, 0
_080AB1A8: .4byte REG_BG0HOFS
	thumb_func_end sub_80AB184

	.align 2, 0 @ Don't pad with nop.
