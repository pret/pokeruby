	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_813FB7C
sub_813FB7C: @ 813FB7C
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0813FBAC @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x8]
	ldr r2, _0813FBB0 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2E]
	ldr r0, _0813FBB4 @ =0x0000ffff
	cmp r1, r0
	bne _0813FBA6
	adds r0, r3, 0
	bl DestroyAnimVisualTask
_0813FBA6:
	pop {r0}
	bx r0
	.align 2, 0
_0813FBAC: .4byte gTasks
_0813FBB0: .4byte gSprites
_0813FBB4: .4byte 0x0000ffff
	thumb_func_end sub_813FB7C

	thumb_func_start sub_813FBB8
sub_813FBB8: @ 813FBB8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0813FBD8 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0813FBDC
	movs r6, 0x20
	movs r5, 0xB
	b _0813FBE0
	.align 2, 0
_0813FBD8: .4byte gBattleTypeFlags
_0813FBDC:
	movs r6, 0x17
	movs r5, 0x5
_0813FBE0:
	ldr r0, _0813FC9C @ =gLastUsedItem
	ldrh r0, [r0]
	bl ball_number_to_ball_processing_index
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079E90
	adds r3, r0, 0
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r1, _0813FCA0 @ =gBallSpriteTemplates
	adds r0, r1
	adds r1, r6, 0
	adds r1, 0x20
	movs r2, 0x50
	orrs r5, r2
	adds r2, r5, 0
	bl CreateSprite
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0813FCA4 @ =gSprites
	mov r9, r0
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	adds r6, r4, r0
	movs r0, 0x22
	strh r0, [r6, 0x2E]
	ldr r1, _0813FCA8 @ =gAnimBankTarget
	mov r8, r1
	ldrb r0, [r1]
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x30]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x10
	strh r0, [r6, 0x32]
	mov r0, r9
	adds r0, 0x1C
	adds r4, r0
	ldr r0, _0813FCAC @ =SpriteCallbackDummy
	str r0, [r4]
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r1, _0813FCB0 @ =gBankSpriteIds
	lsls r0, 24
	lsrs r0, 24
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r1, _0813FCB4 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	ldr r1, _0813FCB8 @ =sub_813FCBC
	str r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813FC9C: .4byte gLastUsedItem
_0813FCA0: .4byte gBallSpriteTemplates
_0813FCA4: .4byte gSprites
_0813FCA8: .4byte gAnimBankTarget
_0813FCAC: .4byte SpriteCallbackDummy
_0813FCB0: .4byte gBankSpriteIds
_0813FCB4: .4byte gTasks
_0813FCB8: .4byte sub_813FCBC
	thumb_func_end sub_813FBB8

	thumb_func_start sub_813FCBC
sub_813FCBC: @ 813FCBC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _0813FD1C @ =gSprites
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r1, _0813FD20 @ =gBankSpriteIds
	lsls r0, 24
	lsrs r0, 24
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0813FD16
	movs r0, 0x3D
	movs r1, 0
	bl PlaySE12WithPanning
	ldr r0, _0813FD24 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0813FD28 @ =sub_813FD90
	str r1, [r0]
	ldr r0, _0813FD2C @ =sub_813FD34
	movs r1, 0xA
	bl CreateTask
	ldr r0, _0813FD30 @ =sub_813FB7C
	str r0, [r4]
_0813FD16:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813FD1C: .4byte gSprites
_0813FD20: .4byte gBankSpriteIds
_0813FD24: .4byte gTasks
_0813FD28: .4byte sub_813FD90
_0813FD2C: .4byte sub_813FD34
_0813FD30: .4byte sub_813FB7C
	thumb_func_end sub_813FCBC

	thumb_func_start sub_813FD34
sub_813FD34: @ 813FD34
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _0813FD88 @ =gSprites
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r4, _0813FD8C @ =gBankSpriteIds
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	bge _0813FD80
	movs r0, 0
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0
	bl StartSpriteAnim
	adds r0, r5, 0
	bl DestroyTask
_0813FD80:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813FD88: .4byte gSprites
_0813FD8C: .4byte gBankSpriteIds
	thumb_func_end sub_813FD34

	thumb_func_start sub_813FD90
sub_813FD90: @ 813FD90
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	ldrh r2, [r4, 0x32]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r1, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	strh r2, [r4, 0x36]
	ldr r0, _0813FDB8 @ =0x0000ffd8
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl InitAnimSpriteTranslationOverDuration
	ldr r0, _0813FDBC @ =sub_813FDC0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813FDB8: .4byte 0x0000ffd8
_0813FDBC: .4byte sub_813FDC0
	thumb_func_end sub_813FD90

	thumb_func_start sub_813FDC0
sub_813FDC0: @ 813FDC0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl TranslateAnimSpriteLinearAndSine
	lsls r0, 24
	cmp r0, 0
	beq _0813FE5A
	ldr r0, _0813FDE0 @ =gSharedMem + 0x17840
	ldrb r0, [r0, 0x8]
	cmp r0, 0x5
	bne _0813FDE8
	ldr r0, _0813FDE4 @ =sub_81407B8
	str r0, [r4, 0x1C]
	b _0813FE5A
	.align 2, 0
_0813FDE0: .4byte gSharedMem + 0x17840
_0813FDE4: .4byte sub_81407B8
_0813FDE8:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x26]
	adds r1, r4, 0
	adds r1, 0x2E
	movs r2, 0
	adds r0, r4, 0
	adds r0, 0x3C
_0813FE10:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _0813FE10
	movs r0, 0
	strh r0, [r4, 0x38]
	ldr r0, _0813FE64 @ =sub_813FE70
	str r0, [r4, 0x1C]
	ldr r0, _0813FE68 @ =gLastUsedItem
	ldrh r0, [r0]
	bl ball_number_to_ball_processing_index
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xB
	bgt _0813FE5A
	cmp r5, 0
	blt _0813FE5A
	ldrh r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	str r5, [sp]
	movs r2, 0x1
	movs r3, 0x1C
	bl sub_814086C
	ldr r0, _0813FE6C @ =gAnimBankTarget
	ldrb r1, [r0]
	movs r0, 0
	movs r2, 0xE
	adds r3, r5, 0
	bl sub_8141314
_0813FE5A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813FE64: .4byte sub_813FE70
_0813FE68: .4byte gLastUsedItem
_0813FE6C: .4byte gAnimBankTarget
	thumb_func_end sub_813FDC0

	thumb_func_start sub_813FE70
sub_813FE70: @ 813FE70
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _0813FEAC
	ldr r0, _0813FEB4 @ =TaskDummy
	movs r1, 0x32
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x38]
	ldr r0, _0813FEB8 @ =sub_813FEC8
	str r0, [r4, 0x1C]
	ldr r2, _0813FEBC @ =gSprites
	ldr r1, _0813FEC0 @ =gBankSpriteIds
	ldr r0, _0813FEC4 @ =gAnimBankTarget
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x30]
_0813FEAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813FEB4: .4byte TaskDummy
_0813FEB8: .4byte sub_813FEC8
_0813FEBC: .4byte gSprites
_0813FEC0: .4byte gBankSpriteIds
_0813FEC4: .4byte gAnimBankTarget
	thumb_func_end sub_813FE70

	thumb_func_start sub_813FEC8
sub_813FEC8: @ 813FEC8
	push {r4-r7,lr}
	adds r7, r0, 0
	ldr r1, _0813FF0C @ =gBankSpriteIds
	ldr r0, _0813FF10 @ =gAnimBankTarget
	ldrb r0, [r0]
	adds r0, r1
	ldrb r4, [r0]
	ldrh r0, [r7, 0x38]
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0813FF14 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	bne _0813FEFA
	movs r0, 0x3C
	bl PlaySE
_0813FEFA:
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _0813FF70
	cmp r0, 0x1
	bgt _0813FF18
	cmp r0, 0
	beq _0813FF1E
	b _0813FFDC
	.align 2, 0
_0813FF0C: .4byte gBankSpriteIds
_0813FF10: .4byte gAnimBankTarget
_0813FF14: .4byte gTasks
_0813FF18:
	cmp r0, 0x2
	beq _0813FFB4
	b _0813FFDC
_0813FF1E:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078E70
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0x1C]
	ldr r1, _0813FF60 @ =gUnknown_03005F0C
	movs r0, 0x1C
	str r0, [r1]
	ldr r2, _0813FF64 @ =gUnknown_03005F14
	ldr r1, _0813FF68 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	ldrh r0, [r7, 0x26]
	ldrh r7, [r7, 0x22]
	adds r0, r7
	subs r1, r0
	strh r1, [r2]
	ldr r4, _0813FF6C @ =gUnknown_03005F10
	ldrh r0, [r2]
	lsls r0, 8
	movs r1, 0x1C
	bl __udivsi3
	strh r0, [r4]
	strh r0, [r5, 0xC]
	b _0813FFCE
	.align 2, 0
_0813FF60: .4byte gUnknown_03005F0C
_0813FF64: .4byte gUnknown_03005F14
_0813FF68: .4byte gSprites
_0813FF6C: .4byte gUnknown_03005F10
_0813FF70:
	ldrh r0, [r5, 0x1C]
	adds r0, 0x20
	strh r0, [r5, 0x1C]
	movs r0, 0x1C
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r5, 0xC]
	ldrh r1, [r5, 0xE]
	adds r0, r1
	strh r0, [r5, 0xE]
	ldr r0, _0813FFAC @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	negs r0, r0
	asrs r0, 8
	strh r0, [r1, 0x26]
	movs r0, 0x1C
	ldrsh r1, [r5, r0]
	ldr r0, _0813FFB0 @ =0x0000047f
	cmp r1, r0
	ble _08140004
	b _0813FFCE
	.align 2, 0
_0813FFAC: .4byte gSprites
_0813FFB0: .4byte 0x0000047f
_0813FFB4:
	adds r0, r4, 0
	bl sub_8078F40
	ldr r1, _0813FFD8 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_0813FFCE:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _08140004
	.align 2, 0
_0813FFD8: .4byte gSprites
_0813FFDC:
	ldr r0, _0814000C @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0xA
	ble _08140004
	adds r0, r6, 0
	bl DestroyTask
	adds r0, r7, 0
	movs r1, 0x2
	bl StartSpriteAnim
	movs r0, 0
	strh r0, [r7, 0x38]
	ldr r0, _08140010 @ =sub_8140014
	str r0, [r7, 0x1C]
_08140004:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814000C: .4byte gTasks
_08140010: .4byte sub_8140014
	thumb_func_end sub_813FEC8

	thumb_func_start sub_8140014
sub_8140014: @ 8140014
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0814004E
	movs r1, 0
	strh r1, [r4, 0x34]
	movs r0, 0x20
	strh r0, [r4, 0x36]
	strh r1, [r4, 0x38]
	movs r0, 0
	movs r1, 0x20
	bl Cos
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldr r0, _08140054 @ =sub_8140058
	str r0, [r4, 0x1C]
_0814004E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08140054: .4byte sub_8140058
	thumb_func_end sub_8140014

	thumb_func_start sub_8140058
sub_8140058: @ 8140058
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0
	ldrh r0, [r4, 0x34]
	movs r1, 0xFF
	ands r1, r0
	cmp r1, 0
	beq _0814006E
	cmp r1, 0x1
	beq _081400E2
	b _0814010E
_0814006E:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x38]
	adds r1, 0x4
	ldrh r2, [r4, 0x34]
	lsls r0, r2, 16
	asrs r0, 24
	adds r1, r0
	strh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x3F
	ble _0814010E
	ldrh r0, [r4, 0x36]
	subs r0, 0xA
	strh r0, [r4, 0x36]
	ldr r1, _081400B8 @ =0x00000101
	adds r0, r2, r1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 24
	cmp r0, 0x4
	bne _081400AA
	movs r5, 0x1
_081400AA:
	cmp r0, 0x2
	beq _081400CA
	cmp r0, 0x2
	bgt _081400BC
	cmp r0, 0x1
	beq _081400C2
	b _081400DA
	.align 2, 0
_081400B8: .4byte 0x00000101
_081400BC:
	cmp r0, 0x3
	beq _081400D2
	b _081400DA
_081400C2:
	movs r0, 0x38
	bl PlaySE
	b _0814010E
_081400CA:
	movs r0, 0x39
	bl PlaySE
	b _0814010E
_081400D2:
	movs r0, 0x3A
	bl PlaySE
	b _0814010E
_081400DA:
	movs r0, 0x3B
	bl PlaySE
	b _0814010E
_081400E2:
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x38]
	subs r1, 0x4
	ldrh r2, [r4, 0x34]
	lsls r0, r2, 16
	asrs r0, 24
	subs r1, r0
	strh r1, [r4, 0x38]
	lsls r1, 16
	cmp r1, 0
	bgt _0814010E
	strh r5, [r4, 0x38]
	ldr r0, _08140138 @ =0xffffff00
	ands r0, r2
	strh r0, [r4, 0x34]
_0814010E:
	cmp r5, 0
	beq _0814014E
	movs r5, 0
	strh r5, [r4, 0x34]
	movs r0, 0x40
	movs r1, 0x20
	bl Cos
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x26]
	ldr r0, _0814013C @ =gSharedMem + 0x17840
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08140144
	strh r5, [r4, 0x38]
	ldr r0, _08140140 @ =sub_8140410
	str r0, [r4, 0x1C]
	b _0814014E
	.align 2, 0
_08140138: .4byte 0xffffff00
_0814013C: .4byte gSharedMem + 0x17840
_08140140: .4byte sub_8140410
_08140144:
	ldr r0, _08140154 @ =sub_8140158
	str r0, [r4, 0x1C]
	movs r0, 0x1
	strh r0, [r4, 0x36]
	strh r5, [r4, 0x38]
_0814014E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08140154: .4byte sub_8140158
	thumb_func_end sub_8140058

	thumb_func_start sub_8140158
sub_8140158: @ 8140158
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _08140190
	strh r5, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _08140198 @ =gSharedMem + 0x17840
	strh r5, [r0, 0xC]
	ldr r0, _0814019C @ =sub_81401A0
	str r0, [r4, 0x1C]
	movs r0, 0x17
	bl PlaySE
_08140190:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08140198: .4byte gSharedMem + 0x17840
_0814019C: .4byte sub_81401A0
	thumb_func_end sub_8140158

	thumb_func_start sub_81401A0
sub_81401A0: @ 81401A0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	movs r1, 0xFF
	ands r1, r0
	cmp r1, 0x6
	bls _081401B0
	b _081403C4
_081401B0:
	lsls r0, r1, 2
	ldr r1, _081401BC @ =_081401C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081401BC: .4byte _081401C0
	.align 2, 0
_081401C0:
	.4byte _081401DC
	.4byte _08140226
	.4byte _0814026C
	.4byte _081402C0
	.4byte _08140310
	.4byte _08140368
	.4byte _081403C4
_081401DC:
	ldr r0, _081401F8 @ =gSharedMem + 0x17840
	ldrh r2, [r0, 0xC]
	movs r3, 0xC
	ldrsh r1, [r0, r3]
	adds r5, r0, 0
	cmp r1, 0xFF
	ble _081401FC
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r0, 0xFF
	ands r0, r2
	b _08140200
	.align 2, 0
_081401F8: .4byte gSharedMem + 0x17840
_081401FC:
	adds r0, r2, 0
	adds r0, 0xB0
_08140200:
	strh r0, [r5, 0xC]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r4, 0x38]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	adds r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xE
	bhi _08140224
	b _0814040A
_08140224:
	b _081402B4
_08140226:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _081402CC
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x36]
	negs r0, r0
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	movs r3, 0x36
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bge _08140262
	adds r0, r4, 0
	movs r1, 0x2
	bl ChangeSpriteAffineAnim
	b _0814040A
_08140262:
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
	b _0814040A
_0814026C:
	ldr r0, _08140288 @ =gSharedMem + 0x17840
	ldrh r2, [r0, 0xC]
	movs r3, 0xC
	ldrsh r1, [r0, r3]
	adds r5, r0, 0
	cmp r1, 0xFF
	ble _0814028C
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r0, 0xFF
	ands r0, r2
	b _08140290
	.align 2, 0
_08140288: .4byte gSharedMem + 0x17840
_0814028C:
	adds r0, r2, 0
	adds r0, 0xB0
_08140290:
	strh r0, [r5, 0xC]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r4, 0x38]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	adds r0, 0xC
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x18
	bhi _081402B4
	b _0814040A
_081402B4:
	strh r3, [r5, 0xC]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	strh r3, [r4, 0x38]
	b _0814040A
_081402C0:
	ldrh r0, [r4, 0x38]
	adds r1, r0, 0x1
	strh r1, [r4, 0x38]
	lsls r0, 16
	cmp r0, 0
	bge _081402DA
_081402CC:
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	b _0814040A
_081402DA:
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x36]
	negs r0, r0
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	movs r3, 0x36
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bge _08140308
	adds r0, r4, 0
	movs r1, 0x2
	bl ChangeSpriteAffineAnim
	b _08140310
_08140308:
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
_08140310:
	ldr r0, _0814032C @ =gSharedMem + 0x17840
	ldrh r2, [r0, 0xC]
	movs r3, 0xC
	ldrsh r1, [r0, r3]
	adds r5, r0, 0
	cmp r1, 0xFF
	ble _08140330
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r0, 0xFF
	ands r0, r2
	b _08140334
	.align 2, 0
_0814032C: .4byte gSharedMem + 0x17840
_08140330:
	adds r0, r2, 0
	adds r0, 0xB0
_08140334:
	strh r0, [r5, 0xC]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r4, 0x38]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	adds r0, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x8
	bls _0814040A
	strh r3, [r5, 0xC]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	strh r3, [r4, 0x38]
	ldrh r0, [r4, 0x36]
	negs r0, r0
	strh r0, [r4, 0x36]
	b _0814040A
_08140368:
	movs r3, 0x80
	lsls r3, 1
	adds r0, r3, 0
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r1, r0, 24
	ldr r0, _08140394 @ =gSharedMem + 0x17840
	ldrb r0, [r0, 0x8]
	cmp r1, r0
	bne _0814039C
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08140398 @ =sub_8140410
	str r0, [r4, 0x1C]
	b _0814040A
	.align 2, 0
_08140394: .4byte gSharedMem + 0x17840
_08140398: .4byte sub_8140410
_0814039C:
	cmp r0, 0x4
	bne _081403B0
	cmp r1, 0x3
	bne _081403B0
	ldr r0, _081403AC @ =sub_8140434
	str r0, [r4, 0x1C]
	b _081403B6
	.align 2, 0
_081403AC: .4byte sub_8140434
_081403B0:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
_081403B6:
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	b _0814040A
_081403C4:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _0814040A
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r1, [r4, 0x34]
	ldr r0, _081403F8 @ =0xffffff00
	ands r0, r1
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAffineAnim
	movs r3, 0x36
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bge _081403FC
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	b _08140404
	.align 2, 0
_081403F8: .4byte 0xffffff00
_081403FC:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_08140404:
	movs r0, 0x17
	bl PlaySE
_0814040A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81401A0

	thumb_func_start sub_8140410
sub_8140410: @ 8140410
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x38]
	adds r0, 0x1
	strh r0, [r1, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _0814042A
	movs r0, 0
	strh r0, [r1, 0x38]
	ldr r0, _08140430 @ =sub_81405F4
	str r0, [r1, 0x1C]
_0814042A:
	pop {r0}
	bx r0
	.align 2, 0
_08140430: .4byte sub_81405F4
	thumb_func_end sub_8140410

	thumb_func_start sub_8140434
sub_8140434: @ 8140434
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r1, [r3]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _08140450 @ =sub_8140454
	str r1, [r0, 0x1C]
	movs r1, 0
	strh r1, [r0, 0x34]
	strh r1, [r0, 0x36]
	strh r1, [r0, 0x38]
	bx lr
	.align 2, 0
_08140450: .4byte sub_8140454
	thumb_func_end sub_8140434

	thumb_func_start sub_8140454
sub_8140454: @ 8140454
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r7, _08140484 @ =gAnimBankTarget
	ldrh r0, [r6, 0x36]
	adds r0, 0x1
	strh r0, [r6, 0x36]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0x28
	beq _081404CC
	cmp r1, 0x5F
	bne _08140490
	ldr r0, _08140488 @ =gDoingBattleAnim
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	bl UpdateOamPriorityInAllHealthboxes
	bl m4aMPlayAllStop
	ldr r0, _0814048C @ =0x00000173
	bl PlaySE
	b _081404CC
	.align 2, 0
_08140484: .4byte gAnimBankTarget
_08140488: .4byte gDoingBattleAnim
_0814048C: .4byte 0x00000173
_08140490:
	ldr r0, _081404D4 @ =0x0000013b
	cmp r1, r0
	bne _081404CC
	ldr r5, _081404D8 @ =gSprites
	ldr r4, _081404DC @ =gBankSpriteIds
	ldrb r0, [r7]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r7]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	movs r0, 0
	strh r0, [r6, 0x2E]
	ldr r0, _081404E0 @ =sub_81404E4
	str r0, [r6, 0x1C]
_081404CC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081404D4: .4byte 0x0000013b
_081404D8: .4byte gSprites
_081404DC: .4byte gBankSpriteIds
_081404E0: .4byte sub_81404E4
	thumb_func_end sub_8140454

	thumb_func_start sub_81404E4
sub_81404E4: @ 81404E4
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08140550
	cmp r0, 0x1
	bgt _081404FC
	cmp r0, 0
	beq _08140502
	b _08140594
_081404FC:
	cmp r0, 0x2
	beq _08140580
	b _08140594
_08140502:
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrb r1, [r4, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r1, _08140548 @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x10
	strh r0, [r1]
	ldr r0, [r4, 0x14]
	ldrh r0, [r0, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	ldr r0, _0814054C @ =0x00007fff
	str r0, [sp]
	adds r0, r1, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0814058C
	.align 2, 0
_08140548: .4byte REG_BLDCNT
_0814054C: .4byte 0x00007fff
_08140550:
	ldrh r0, [r4, 0x30]
	adds r1, r0, 0x1
	strh r1, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	ble _081405B2
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x32]
	adds r1, 0x1
	strh r1, [r4, 0x32]
	ldr r3, _0814057C @ =REG_BLDALPHA
	lsls r2, r1, 8
	movs r0, 0x10
	subs r0, r1
	orrs r2, r0
	strh r2, [r3]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _081405B2
	b _0814058C
	.align 2, 0
_0814057C: .4byte REG_BLDALPHA
_08140580:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0814058C:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _081405B2
_08140594:
	ldr r0, _081405BC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _081405B2
	ldr r0, _081405C0 @ =REG_BLDCNT
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	strh r1, [r4, 0x2E]
	ldr r0, _081405C4 @ =sub_81405C8
	str r0, [r4, 0x1C]
_081405B2:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081405BC: .4byte gPaletteFade
_081405C0: .4byte REG_BLDCNT
_081405C4: .4byte sub_81405C8
	thumb_func_end sub_81404E4

	thumb_func_start sub_81405C8
sub_81405C8: @ 81405C8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _081405E0
	ldr r0, _081405DC @ =0x0000ffff
	strh r0, [r4, 0x2E]
	b _081405EC
	.align 2, 0
_081405DC: .4byte 0x0000ffff
_081405E0:
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_081405EC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81405C8

	thumb_func_start sub_81405F4
sub_81405F4: @ 81405F4
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	ldr r0, _081406A8 @ =sub_81406BC
	str r0, [r4, 0x1C]
	ldr r0, _081406AC @ =gLastUsedItem
	ldrh r0, [r0]
	bl ball_number_to_ball_processing_index
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xB
	bgt _08140646
	cmp r5, 0
	blt _08140646
	ldrh r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	str r5, [sp]
	movs r2, 0x1
	movs r3, 0x1C
	bl sub_814086C
	ldr r0, _081406B0 @ =gAnimBankTarget
	ldrb r1, [r0]
	movs r0, 0x1
	movs r2, 0xE
	adds r3, r5, 0
	bl sub_8141314
_08140646:
	ldr r6, _081406B4 @ =gSprites
	ldr r5, _081406B8 @ =gBankSpriteIds
	ldr r4, _081406B0 @ =gAnimBankTarget
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl AnimateSprite
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x80
	lsls r1, 5
	strh r1, [r0, 0x30]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081406A8: .4byte sub_81406BC
_081406AC: .4byte gLastUsedItem
_081406B0: .4byte gAnimBankTarget
_081406B4: .4byte gSprites
_081406B8: .4byte gBankSpriteIds
	thumb_func_end sub_81405F4

	thumb_func_start sub_81406BC
sub_81406BC: @ 81406BC
	push {r4-r7,lr}
	adds r7, r0, 0
	movs r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081406DA
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_081406DA:
	ldr r4, _08140708 @ =gSprites
	ldr r3, _0814070C @ =gBankSpriteIds
	ldr r2, _08140710 @ =gAnimBankTarget
	ldrb r0, [r2]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r4
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _08140714
	adds r0, r1, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r5, 0x1
	b _08140734
	.align 2, 0
_08140708: .4byte gSprites
_0814070C: .4byte gBankSpriteIds
_08140710: .4byte gAnimBankTarget
_08140714:
	ldr r6, _0814079C @ =0xfffffee0
	adds r0, r6, 0
	ldrh r6, [r1, 0x30]
	adds r0, r6
	strh r0, [r1, 0x30]
	ldrb r0, [r2]
	adds r0, r3
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r1, 0x26]
_08140734:
	adds r0, r7, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08140796
	cmp r5, 0
	beq _08140796
	ldr r4, _081407A0 @ =gSprites
	ldr r3, _081407A4 @ =gBankSpriteIds
	ldr r2, _081407A8 @ =gAnimBankTarget
	ldrb r0, [r2]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r6, 0
	movs r5, 0
	strh r5, [r0, 0x26]
	ldrb r0, [r2]
	adds r0, r3
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	ldr r0, _081407AC @ =gSharedMem + 0x17840
	ldrb r1, [r0, 0x9]
	lsls r1, 30
	adds r2, 0x3E
	lsrs r1, 31
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	strh r5, [r7, 0x2E]
	ldr r0, _081407B0 @ =sub_81405C8
	str r0, [r7, 0x1C]
	ldr r0, _081407B4 @ =gDoingBattleAnim
	strb r6, [r0]
	movs r0, 0x1
	bl UpdateOamPriorityInAllHealthboxes
_08140796:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814079C: .4byte 0xfffffee0
_081407A0: .4byte gSprites
_081407A4: .4byte gBankSpriteIds
_081407A8: .4byte gAnimBankTarget
_081407AC: .4byte gSharedMem + 0x17840
_081407B0: .4byte sub_81405C8
_081407B4: .4byte gDoingBattleAnim
	thumb_func_end sub_81406BC

	thumb_func_start sub_81407B8
sub_81407B8: @ 81407B8
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x24]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x26]
	ldrh r3, [r2, 0x22]
	adds r0, r3
	strh r0, [r2, 0x22]
	strh r1, [r2, 0x26]
	strh r1, [r2, 0x24]
	ldr r4, _081407F0 @ =sub_81407F4
	movs r3, 0
	movs r1, 0x5
	adds r0, r2, 0
	adds r0, 0x38
_081407DC:
	strh r3, [r0]
	subs r0, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _081407DC
	str r4, [r2, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081407F0: .4byte sub_81407F4
	thumb_func_end sub_81407B8

	thumb_func_start sub_81407F4
sub_81407F4: @ 81407F4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x80
	lsls r0, 4
	adds r2, r0, 0
	ldrh r1, [r4, 0x2E]
	adds r2, r1
	movs r0, 0xD0
	lsls r0, 3
	adds r3, r0, 0
	ldrh r1, [r4, 0x30]
	adds r3, r1
	lsls r1, r3, 16
	asrs r1, 24
	ldrh r0, [r4, 0x24]
	subs r0, r1
	strh r0, [r4, 0x24]
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r4, 0x2E]
	ands r3, r0
	strh r3, [r4, 0x30]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	cmp r0, 0xA0
	bgt _0814084A
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x8
	negs r1, r1
	cmp r0, r1
	bge _0814085E
_0814084A:
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _08140864 @ =sub_81405C8
	str r0, [r4, 0x1C]
	ldr r1, _08140868 @ =gDoingBattleAnim
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	bl UpdateOamPriorityInAllHealthboxes
_0814085E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08140864: .4byte sub_81405C8
_08140868: .4byte gDoingBattleAnim
	thumb_func_end sub_81407F4

	thumb_func_start sub_814086C
sub_814086C: @ 814086C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, [sp, 0x20]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r4, 24
	lsrs r4, 24
	adds r5, r4, 0
	ldr r0, _08140910 @ =gUnknown_0840B258
	lsls r6, r5, 3
	adds r4, r6, r0
	ldrh r0, [r4, 0x6]
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _08140914 @ =0xffff0000
	cmp r0, r1
	bne _081408B6
	adds r0, r4, 0
	bl LoadCompressedObjectPic
	ldr r0, _08140918 @ =gUnknown_0840B2B8
	adds r0, r6, r0
	bl LoadCompressedObjectPalette
_081408B6:
	ldr r1, _0814091C @ =gUnknown_0840B384
	lsls r0, r5, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08140920 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	mov r1, r10
	strh r1, [r0, 0xA]
	mov r1, r9
	strh r1, [r0, 0xC]
	mov r1, r8
	strh r1, [r0, 0xE]
	strh r7, [r0, 0x10]
	strh r5, [r0, 0x26]
	movs r0, 0xF
	bl PlaySE
	ldr r0, _08140924 @ =gMain
	ldr r1, _08140928 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08140900
	ldr r1, _0814092C @ =gSharedMem + 0x17840
	ldrb r0, [r1, 0xA]
	adds r0, 0x1
	strb r0, [r1, 0xA]
_08140900:
	adds r0, r4, 0
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08140910: .4byte gUnknown_0840B258
_08140914: .4byte 0xffff0000
_08140918: .4byte gUnknown_0840B2B8
_0814091C: .4byte gUnknown_0840B384
_08140920: .4byte gTasks
_08140924: .4byte gMain
_08140928: .4byte 0x0000043d
_0814092C: .4byte gSharedMem + 0x17840
	thumb_func_end sub_814086C

	thumb_func_start sub_8140930
sub_8140930: @ 8140930
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _081409D0 @ =gTasks
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	adds r7, r0, r1
	ldrh r0, [r7, 0x26]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	cmp r0, 0xF
	bgt _081409E4
	ldrb r1, [r7, 0xA]
	ldrb r2, [r7, 0xC]
	ldrb r6, [r7, 0xE]
	ldrb r3, [r7, 0x10]
	mov r4, r8
	lsls r0, r4, 1
	add r0, r8
	lsls r0, 3
	ldr r4, _081409D4 @ =gSpriteTemplate_840B3B4
	adds r0, r4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r5, _081409D8 @ =gSprites
	adds r2, r4, r5
	ldr r0, _081409DC @ =gUnknown_0840B378
	add r0, r8
	ldrb r1, [r0]
	adds r0, r2, 0
	str r2, [sp]
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _081409E0 @ =sub_8140A08
	str r0, [r4]
	movs r0, 0x3
	ands r6, r0
	lsls r6, 2
	ldr r2, [sp]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r6
	strb r0, [r2, 0x5]
	ldrb r0, [r7, 0x8]
	cmp r0, 0x7
	bls _081409B6
	subs r0, 0x8
	lsls r0, 24
	lsrs r0, 24
_081409B6:
	lsls r0, 5
	strh r0, [r2, 0x2E]
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	cmp r0, 0xF
	bne _081409E4
	movs r0, 0x1
	strh r0, [r2, 0x3C]
	mov r0, r9
	bl DestroyTask
	b _081409F6
	.align 2, 0
_081409D0: .4byte gTasks
_081409D4: .4byte gSpriteTemplate_840B3B4
_081409D8: .4byte gSprites
_081409DC: .4byte gUnknown_0840B378
_081409E0: .4byte sub_8140A08
_081409E4:
	ldr r0, _08140A04 @ =gTasks
	mov r2, r9
	lsls r1, r2, 2
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_081409F6:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140A04: .4byte gTasks
	thumb_func_end sub_8140930

	thumb_func_start sub_8140A08
sub_8140A08: @ 8140A08
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x30]
	movs r3, 0x30
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _08140A20
	ldr r0, _08140A1C @ =sub_8140A28
	str r0, [r1, 0x1C]
	b _08140A24
	.align 2, 0
_08140A1C: .4byte sub_8140A28
_08140A20:
	subs r0, r2, 0x1
	strh r0, [r1, 0x30]
_08140A24:
	pop {r0}
	bx r0
	thumb_func_end sub_8140A08

	thumb_func_start sub_8140A28
sub_8140A28: @ 8140A28
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x2
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x32
	bne _08140A5C
	adds r0, r4, 0
	bl sub_8141294
_08140A5C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8140A28

	thumb_func_start sub_8140A64
sub_8140A64: @ 8140A64
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08140B24 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _08140B28 @ =gSprites
	mov r8, r3
	ldr r0, _08140B2C @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_08140AA8:
	ldr r0, _08140B30 @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _08140B34 @ =gSprites + 0x1C
	adds r1, r5, r3
	ldr r0, _08140B38 @ =sub_8140ECC
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 5
	strh r0, [r4, 0x2E]
	movs r0, 0xA
	strh r0, [r4, 0x36]
	movs r0, 0x2
	strh r0, [r4, 0x38]
	movs r2, 0x1
	strh r2, [r4, 0x3A]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _08140AA8
	ldr r0, _08140B28 @ =gSprites
	adds r0, r5, r0
	strh r2, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140B24: .4byte gTasks
_08140B28: .4byte gSprites
_08140B2C: .4byte gUnknown_0840B378
_08140B30: .4byte gSpriteTemplate_840B3B4
_08140B34: .4byte gSprites + 0x1C
_08140B38: .4byte sub_8140ECC
	thumb_func_end sub_8140A64

	thumb_func_start sub_8140B3C
sub_8140B3C: @ 8140B3C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08140BFC @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _08140C00 @ =gSprites
	mov r8, r3
	ldr r0, _08140C04 @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_08140B80:
	ldr r0, _08140C08 @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _08140C0C @ =gSprites + 0x1C
	adds r1, r5, r3
	ldr r0, _08140C10 @ =sub_8140ECC
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 5
	strh r0, [r4, 0x2E]
	movs r0, 0xA
	strh r0, [r4, 0x36]
	movs r1, 0x1
	strh r1, [r4, 0x38]
	movs r0, 0x2
	strh r0, [r4, 0x3A]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _08140B80
	ldr r0, _08140C00 @ =gSprites
	adds r0, r5, r0
	strh r1, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140BFC: .4byte gTasks
_08140C00: .4byte gSprites
_08140C04: .4byte gUnknown_0840B378
_08140C08: .4byte gSpriteTemplate_840B3B4
_08140C0C: .4byte gSprites + 0x1C
_08140C10: .4byte sub_8140ECC
	thumb_func_end sub_8140B3C

	thumb_func_start sub_8140C14
sub_8140C14: @ 8140C14
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08140CD0 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _08140CD4 @ =gSprites
	mov r8, r3
	ldr r0, _08140CD8 @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_08140C58:
	ldr r0, _08140CDC @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _08140CE0 @ =gSprites + 0x1C
	adds r1, r5, r3
	ldr r0, _08140CE4 @ =sub_8140ECC
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 5
	strh r0, [r4, 0x2E]
	movs r0, 0x4
	strh r0, [r4, 0x36]
	movs r2, 0x1
	strh r2, [r4, 0x38]
	strh r2, [r4, 0x3A]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _08140C58
	ldr r0, _08140CD4 @ =gSprites
	adds r0, r5, r0
	strh r2, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140CD0: .4byte gTasks
_08140CD4: .4byte gSprites
_08140CD8: .4byte gUnknown_0840B378
_08140CDC: .4byte gSpriteTemplate_840B3B4
_08140CE0: .4byte gSprites + 0x1C
_08140CE4: .4byte sub_8140ECC
	thumb_func_end sub_8140C14

	thumb_func_start sub_8140CE8
sub_8140CE8: @ 8140CE8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08140DAC @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _08140DB0 @ =gSprites
	mov r8, r3
	ldr r0, _08140DB4 @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_08140D2C:
	ldr r0, _08140DB8 @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _08140DBC @ =gSprites + 0x1C
	adds r1, r5, r3
	ldr r0, _08140DC0 @ =sub_8140ECC
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 3
	adds r0, r6
	strh r0, [r4, 0x2E]
	movs r0, 0x5
	strh r0, [r4, 0x36]
	movs r2, 0x1
	strh r2, [r4, 0x38]
	strh r2, [r4, 0x3A]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x9
	bls _08140D2C
	ldr r0, _08140DB0 @ =gSprites
	adds r0, r5, r0
	strh r2, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140DAC: .4byte gTasks
_08140DB0: .4byte gSprites
_08140DB4: .4byte gUnknown_0840B378
_08140DB8: .4byte gSpriteTemplate_840B3B4
_08140DBC: .4byte gSprites + 0x1C
_08140DC0: .4byte sub_8140ECC
	thumb_func_end sub_8140CE8

	thumb_func_start sub_8140DC4
sub_8140DC4: @ 8140DC4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08140DF0 @ =gTasks
	lsls r2, r7, 2
	adds r0, r2, r7
	lsls r0, 3
	adds r3, r0, r1
	ldrh r1, [r3, 0x16]
	movs r4, 0x16
	ldrsh r0, [r3, r4]
	cmp r0, 0
	beq _08140DF4
	subs r0, r1, 0x1
	strh r0, [r3, 0x16]
	b _08140EA4
	.align 2, 0
_08140DF0: .4byte gTasks
_08140DF4:
	ldrh r0, [r3, 0x26]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r3, 0xA]
	str r1, [sp]
	ldrb r4, [r3, 0xC]
	str r4, [sp, 0x4]
	ldrb r1, [r3, 0xE]
	str r1, [sp, 0x8]
	ldrb r3, [r3, 0x10]
	str r3, [sp, 0xC]
	movs r6, 0
	str r2, [sp, 0x10]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	mov r10, r1
	ldr r3, _08140EB4 @ =gSprites
	mov r8, r3
	ldr r1, _08140EB8 @ =gUnknown_0840B378
	adds r0, r1
	mov r9, r0
_08140E20:
	ldr r0, _08140EBC @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r3, r9
	ldrb r1, [r3]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _08140EC0 @ =gSprites + 0x1C
	adds r1, r5, r0
	ldr r0, _08140EC4 @ =sub_8140ECC
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 5
	strh r0, [r4, 0x2E]
	movs r2, 0x8
	strh r2, [r4, 0x36]
	movs r0, 0x2
	strh r0, [r4, 0x38]
	strh r0, [r4, 0x3A]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _08140E20
	ldr r0, _08140EC8 @ =gTasks
	ldr r4, [sp, 0x10]
	adds r1, r4, r7
	lsls r1, 3
	adds r1, r0
	strh r2, [r1, 0x16]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _08140EA4
	ldr r0, _08140EB4 @ =gSprites
	adds r0, r5, r0
	movs r1, 0x1
	strh r1, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
_08140EA4:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140EB4: .4byte gSprites
_08140EB8: .4byte gUnknown_0840B378
_08140EBC: .4byte gSpriteTemplate_840B3B4
_08140EC0: .4byte gSprites + 0x1C
_08140EC4: .4byte sub_8140ECC
_08140EC8: .4byte gTasks
	thumb_func_end sub_8140DC4

	thumb_func_start sub_8140ECC
sub_8140ECC: @ 8140ECC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x38]
	ldrh r2, [r4, 0x30]
	adds r0, r2
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _08140F1C
	adds r0, r4, 0
	bl sub_8141294
_08140F1C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8140ECC

	thumb_func_start sub_8140F24
sub_8140F24: @ 8140F24
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08140FE0 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _08140FE4 @ =gSprites
	mov r8, r3
	ldr r0, _08140FE8 @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_08140F68:
	ldr r0, _08140FEC @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _08140FF0 @ =gSprites + 0x1C
	adds r1, r5, r3
	ldr r0, _08140FF4 @ =sub_8140FF8
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 2
	adds r0, r6
	strh r0, [r4, 0x2E]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xB
	bls _08140F68
	ldr r0, _08140FE4 @ =gSprites
	adds r0, r5, r0
	movs r1, 0x1
	strh r1, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140FE0: .4byte gTasks
_08140FE4: .4byte gSprites
_08140FE8: .4byte gUnknown_0840B378
_08140FEC: .4byte gSpriteTemplate_840B3B4
_08140FF0: .4byte gSprites + 0x1C
_08140FF4: .4byte sub_8140FF8
	thumb_func_end sub_8140F24

	thumb_func_start sub_8140FF8
sub_8140FF8: @ 8140FF8
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x24]
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	adds r0, r4, 0
	bl Sin
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl Cos
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x6
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _08141050
	adds r0, r5, 0
	bl sub_8141294
_08141050:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8140FF8

	thumb_func_start sub_8141058
sub_8141058: @ 8141058
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	ldr r1, _08141104 @ =gTasks
	lsls r0, 2
	ldr r2, [sp]
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r3, [r0, 0xA]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xC]
	str r2, [sp, 0x8]
	ldrb r3, [r0, 0xE]
	str r3, [sp, 0xC]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0x10]
	movs r0, 0
	mov r8, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	str r0, [sp, 0x14]
	ldr r0, _08141108 @ =gUnknown_0840B378
	adds r1, r0
	mov r10, r1
_0814109E:
	movs r7, 0
	movs r1, 0x1
	add r1, r8
	mov r9, r1
_081410A6:
	ldr r0, _0814110C @ =gSpriteTemplate_840B3B4
	ldr r2, [sp, 0x14]
	adds r0, r2, r0
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	ldr r3, [sp, 0x10]
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	ldr r3, _08141110 @ =gSprites
	adds r5, r4, r3
	mov r0, r10
	ldrb r1, [r0]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r1, _08141114 @ =gSprites + 0x1C
	adds r4, r1
	ldr r0, _08141118 @ =sub_8140ECC
	str r0, [r4]
	movs r0, 0x3
	ldr r1, [sp, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r0, [r5, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r2, r3, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	lsls r0, r7, 5
	strh r0, [r5, 0x2E]
	movs r0, 0x8
	strh r0, [r5, 0x36]
	mov r0, r8
	cmp r0, 0
	bne _0814111C
	movs r0, 0x2
	strh r0, [r5, 0x38]
	movs r0, 0x1
	b _08141122
	.align 2, 0
_08141104: .4byte gTasks
_08141108: .4byte gUnknown_0840B378
_0814110C: .4byte gSpriteTemplate_840B3B4
_08141110: .4byte gSprites
_08141114: .4byte gSprites + 0x1C
_08141118: .4byte sub_8140ECC
_0814111C:
	movs r0, 0x1
	strh r0, [r5, 0x38]
	movs r0, 0x2
_08141122:
	strh r0, [r5, 0x3A]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x7
	bls _081410A6
	mov r1, r9
	lsls r0, r1, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x1
	bls _0814109E
	ldr r0, _08141160 @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x3C]
	ldr r0, [sp]
	bl DestroyTask
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141160: .4byte gSprites
	thumb_func_end sub_8141058

	thumb_func_start sub_8141164
sub_8141164: @ 8141164
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08141218 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _0814121C @ =gSprites
	mov r8, r3
	ldr r0, _08141220 @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_081411A8:
	ldr r0, _08141224 @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _08141228 @ =gSprites + 0x1C
	adds r1, r5, r3
	ldr r0, _0814122C @ =sub_8141230
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 5
	strh r0, [r4, 0x2E]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _081411A8
	ldr r0, _0814121C @ =gSprites
	adds r0, r5, r0
	movs r1, 0x1
	strh r1, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141218: .4byte gTasks
_0814121C: .4byte gSprites
_08141220: .4byte gUnknown_0840B378
_08141224: .4byte gSpriteTemplate_840B3B4
_08141228: .4byte gSprites + 0x1C
_0814122C: .4byte sub_8141230
	thumb_func_end sub_8141164

	thumb_func_start sub_8141230
sub_8141230: @ 8141230
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x24]
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	ldrh r1, [r5, 0x2E]
	movs r0, 0x3F
	ands r0, r1
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	bl Sin
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl Cos
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x2E]
	adds r0, 0xA
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _0814128C
	adds r0, r5, 0
	bl sub_8141294
_0814128C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8141230

	thumb_func_start sub_8141294
sub_8141294: @ 8141294
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _081412B8 @ =gMain
	ldr r1, _081412BC @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _081412C0
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _081412F2
	adds r0, r5, 0
	bl DestroySpriteAndFreeResources
	b _0814130E
	.align 2, 0
_081412B8: .4byte gMain
_081412BC: .4byte 0x0000043d
_081412C0:
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _08141308
	ldr r1, _081412FC @ =gSharedMem + 0x17840
	ldrb r0, [r1, 0xA]
	subs r0, 0x1
	strb r0, [r1, 0xA]
	lsls r0, 24
	cmp r0, 0
	bne _081412F2
	movs r7, 0
	ldr r6, _08141300 @ =gUnknown_0840B258
	ldr r4, _08141304 @ =gUnknown_0840B2B8
_081412DC:
	ldrh r0, [r6, 0x6]
	bl FreeSpriteTilesByTag
	ldrh r0, [r4, 0x4]
	bl FreeSpritePaletteByTag
	adds r6, 0x8
	adds r4, 0x8
	adds r7, 0x1
	cmp r7, 0xB
	ble _081412DC
_081412F2:
	adds r0, r5, 0
	bl DestroySprite
	b _0814130E
	.align 2, 0
_081412FC: .4byte gSharedMem + 0x17840
_08141300: .4byte gUnknown_0840B258
_08141304: .4byte gUnknown_0840B2B8
_08141308:
	adds r0, r5, 0
	bl DestroySprite
_0814130E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8141294

	thumb_func_start sub_8141314
sub_8141314: @ 8141314
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r4, r0, 0
	mov r9, r2
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r3, 24
	lsrs r7, r3, 24
	ldr r0, _08141378 @ =sub_81413DC
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _0814137C @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r5, r0, r1
	strh r7, [r5, 0x26]
	strh r6, [r5, 0xE]
	mov r0, r9
	strh r0, [r5, 0x1C]
	mov r1, r9
	lsrs r0, r1, 16
	strh r0, [r5, 0x1E]
	cmp r4, 0
	bne _08141384
	lsls r0, r6, 20
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r0, 16
	ldr r2, _08141380 @ =gUnknown_0840B4D4
	lsls r1, r7, 1
	adds r1, r2
	ldrh r3, [r1]
	movs r1, 0x10
	movs r2, 0
	bl BlendPalette
	movs r0, 0x1
	strh r0, [r5, 0xA]
	b _081413AA
	.align 2, 0
_08141378: .4byte sub_81413DC
_0814137C: .4byte gTasks
_08141380: .4byte gUnknown_0840B4D4
_08141384:
	lsls r0, r6, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	ldr r2, _081413CC @ =gUnknown_0840B4D4
	lsls r1, r7, 1
	adds r1, r2
	ldrh r3, [r1]
	movs r1, 0x10
	movs r2, 0x10
	bl BlendPalette
	movs r0, 0x10
	strh r0, [r5, 0x8]
	ldr r0, _081413D0 @ =0x0000ffff
	strh r0, [r5, 0xA]
	ldr r0, _081413D4 @ =sub_814146C
	str r0, [r5]
_081413AA:
	ldr r0, _081413D8 @ =0x00007fff
	str r0, [sp]
	mov r0, r9
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	mov r0, r8
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081413CC: .4byte gUnknown_0840B4D4
_081413D0: .4byte 0x0000ffff
_081413D4: .4byte sub_814146C
_081413D8: .4byte 0x00007fff
	thumb_func_end sub_8141314

	thumb_func_start sub_81413DC
sub_81413DC: @ 81413DC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _0814142C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0x10
	bgt _08141434
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	lsls r0, 20
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r0, 16
	ldrb r2, [r4, 0x8]
	ldr r3, _08141430 @ =gUnknown_0840B4D4
	lsls r1, 1
	adds r1, r3
	ldrh r3, [r1]
	movs r1, 0x10
	bl BlendPalette
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x8]
	adds r0, r1
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _0814145C
	.align 2, 0
_0814142C: .4byte gTasks
_08141430: .4byte gUnknown_0840B4D4
_08141434:
	ldr r0, _08141464 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0814145C
	ldrh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	lsls r1, 16
	orrs r0, r1
	ldr r1, _08141468 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	adds r0, r5, 0
	bl DestroyTask
_0814145C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08141464: .4byte gPaletteFade
_08141468: .4byte 0x00007fff
	thumb_func_end sub_81413DC

	thumb_func_start sub_814146C
sub_814146C: @ 814146C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _081414AC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081414A4
	ldr r0, _081414B0 @ =gTasks
	lsls r4, r2, 2
	adds r4, r2
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	lsls r1, 16
	orrs r0, r1
	ldr r1, _081414B4 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _081414B8 @ =sub_81414BC
	str r0, [r4]
_081414A4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081414AC: .4byte gPaletteFade
_081414B0: .4byte gTasks
_081414B4: .4byte 0x00007fff
_081414B8: .4byte sub_81414BC
	thumb_func_end sub_814146C

	thumb_func_start sub_81414BC
sub_81414BC: @ 81414BC
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08141508 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r1, r0, 24
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0x10
	bgt _08141510
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	lsls r0, 20
	movs r3, 0x80
	lsls r3, 17
	adds r0, r3
	lsrs r0, 16
	ldrb r2, [r4, 0x8]
	ldr r3, _0814150C @ =gUnknown_0840B4D4
	lsls r1, 1
	adds r1, r3
	ldrh r3, [r1]
	movs r1, 0x10
	bl BlendPalette
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x8]
	adds r0, r1
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _08141516
	.align 2, 0
_08141508: .4byte gTasks
_0814150C: .4byte gUnknown_0840B4D4
_08141510:
	adds r0, r2, 0
	bl DestroyTask
_08141516:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81414BC

	thumb_func_start sub_814151C
sub_814151C: @ 814151C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0
	mov r8, r0
	ldr r0, _08141550 @ =gBankSpriteIds
	ldr r3, _08141554 @ =gAnimBankAttacker
	ldrb r2, [r3]
	adds r0, r2, r0
	ldrb r6, [r0]
	ldr r1, _08141558 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _081415F4
	cmp r0, 0x1
	bgt _0814155C
	cmp r0, 0
	beq _08141562
	b _081416B6
	.align 2, 0
_08141550: .4byte gBankSpriteIds
_08141554: .4byte gAnimBankAttacker
_08141558: .4byte gTasks
_0814155C:
	cmp r0, 0x2
	beq _08141606
	b _081416B6
_08141562:
	ldr r0, _0814159C @ =gBattleAnimArgs
	ldrh r0, [r0]
	strh r0, [r5, 0x1E]
	movs r2, 0xA0
	lsls r2, 3
	adds r0, r2, 0
	ldrh r4, [r5, 0x8]
	adds r0, r4
	strh r0, [r5, 0x8]
	ldrb r0, [r3]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _081415A4
	ldr r2, _081415A0 @ =gSprites
	lsls r3, r6, 4
	adds r1, r3, r6
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 24
	ldrh r4, [r1, 0x24]
	adds r0, r4
	strh r0, [r1, 0x24]
	adds r4, r3, 0
	b _081415BC
	.align 2, 0
_0814159C: .4byte gBattleAnimArgs
_081415A0: .4byte gSprites
_081415A4:
	ldr r3, _081415EC @ =gSprites
	lsls r4, r6, 4
	adds r2, r4, r6
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r5, 0x8]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	adds r2, r3, 0
_081415BC:
	ldr r1, _081415F0 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r3, r0, r1
	ldrb r0, [r3, 0x8]
	strh r0, [r3, 0x8]
	adds r0, r4, r6
	lsls r0, 2
	adds r0, r2
	movs r2, 0x20
	ldrsh r1, [r0, r2]
	movs r4, 0x24
	ldrsh r0, [r0, r4]
	adds r1, r0
	adds r1, 0x20
	movs r0, 0x98
	lsls r0, 1
	cmp r1, r0
	bls _081416B6
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	strh r0, [r3, 0x1C]
	b _081416B6
	.align 2, 0
_081415EC: .4byte gSprites
_081415F0: .4byte gTasks
_081415F4:
	ldrb r1, [r5, 0x1E]
	adds r0, r2, 0
	adds r2, r6, 0
	bl refresh_graphics_maybe
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	b _081416B6
_08141606:
	movs r1, 0xA0
	lsls r1, 3
	adds r0, r1, 0
	ldrh r2, [r5, 0x8]
	adds r0, r2
	strh r0, [r5, 0x8]
	ldrb r0, [r3]
	bl GetBattlerSide
	lsls r0, 24
	cmp r0, 0
	beq _0814163C
	ldr r0, _08141638 @ =gSprites
	lsls r3, r6, 4
	adds r2, r3, r6
	lsls r2, 2
	adds r2, r0
	ldrh r1, [r5, 0x8]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	adds r4, r3, 0
	b _08141654
	.align 2, 0
_08141638: .4byte gSprites
_0814163C:
	ldr r0, _08141688 @ =gSprites
	lsls r2, r6, 4
	adds r1, r2, r6
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 24
	ldrh r3, [r1, 0x24]
	adds r0, r3
	strh r0, [r1, 0x24]
	adds r4, r2, 0
_08141654:
	ldr r1, _0814168C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x8]
	strh r1, [r0, 0x8]
	ldr r0, _08141690 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerSide
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08141694
	ldr r0, _08141688 @ =gSprites
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r0
	movs r4, 0x24
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bgt _081416AA
	movs r0, 0
	strh r0, [r1, 0x24]
	b _081416B0
	.align 2, 0
_08141688: .4byte gSprites
_0814168C: .4byte gTasks
_08141690: .4byte gAnimBankAttacker
_08141694:
	ldr r0, _081416C0 @ =gSprites
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r0
	movs r3, 0x24
	ldrsh r0, [r1, r3]
	cmp r0, 0
	blt _081416AA
	strh r2, [r1, 0x24]
	movs r4, 0x1
	mov r8, r4
_081416AA:
	mov r0, r8
	cmp r0, 0
	beq _081416B6
_081416B0:
	adds r0, r7, 0
	bl DestroyAnimVisualTask
_081416B6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081416C0: .4byte gSprites
	thumb_func_end sub_814151C

	thumb_func_start sub_81416C4
sub_81416C4: @ 81416C4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _081416E8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08141744
	cmp r0, 0x1
	bgt _081416EC
	cmp r0, 0
	beq _081416F2
	b _081417B8
	.align 2, 0
_081416E8: .4byte gTasks
_081416EC:
	cmp r0, 0x2
	beq _0814177C
	b _081417B8
_081416F2:
	ldr r0, _08141708 @ =gAnimBankAttacker
	ldrb r0, [r0]
	bl GetBattlerPosition_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08141714
	ldr r1, _0814170C @ =REG_BLDCNT
	ldr r2, _08141710 @ =0x00003f42
	b _08141718
	.align 2, 0
_08141708: .4byte gAnimBankAttacker
_0814170C: .4byte REG_BLDCNT
_08141710: .4byte 0x00003f42
_08141714:
	ldr r1, _08141734 @ =REG_BLDCNT
	ldr r2, _08141738 @ =0x00003f44
_08141718:
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0814173C @ =REG_BLDALPHA
	movs r0, 0x10
	strh r0, [r1]
	ldr r1, _08141740 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	adds r1, 0x1
	strh r1, [r0, 0x26]
	b _081417B8
	.align 2, 0
_08141734: .4byte REG_BLDCNT
_08141738: .4byte 0x00003f44
_0814173C: .4byte REG_BLDALPHA
_08141740: .4byte gTasks
_08141744:
	ldrh r0, [r4, 0xA]
	adds r1, r0, 0x1
	strh r1, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _081417B8
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0x8]
	adds r1, 0x1
	strh r1, [r4, 0x8]
	ldr r3, _08141778 @ =REG_BLDALPHA
	lsls r2, r1, 8
	movs r0, 0x10
	subs r0, r1
	orrs r2, r0
	strh r2, [r3]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _081417B8
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	b _081417B8
	.align 2, 0
_08141778: .4byte REG_BLDALPHA
_0814177C:
	ldr r1, _081417C0 @ =gBankSpriteIds
	ldr r3, _081417C4 @ =gAnimBankAttacker
	ldrb r0, [r3]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _081417C8 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldr r1, _081417CC @ =0x06010000
	adds r0, r1
	movs r1, 0
	str r1, [sp]
	ldr r1, _081417D0 @ =0x040000d4
	mov r2, sp
	str r2, [r1]
	str r0, [r1, 0x4]
	ldr r0, _081417D4 @ =0x85000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldrb r0, [r3]
	bl sub_80324E0
	adds r0, r5, 0
	bl DestroyAnimVisualTask
_081417B8:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081417C0: .4byte gBankSpriteIds
_081417C4: .4byte gAnimBankAttacker
_081417C8: .4byte gSprites
_081417CC: .4byte 0x06010000
_081417D0: .4byte 0x040000d4
_081417D4: .4byte 0x85000200
	thumb_func_end sub_81416C4

	thumb_func_start sub_81417D8
sub_81417D8: @ 81417D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _081417FC @ =gBattleAnimArgs
	ldr r1, _08141800 @ =gAnimBankAttacker
	ldrb r1, [r1]
	lsls r1, 2
	ldr r2, _08141804 @ =gSharedMem + 0x17800
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 29
	lsrs r1, 31
	strh r1, [r3, 0xE]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_081417FC: .4byte gBattleAnimArgs
_08141800: .4byte gAnimBankAttacker
_08141804: .4byte gSharedMem + 0x17800
	thumb_func_end sub_81417D8

	thumb_func_start sub_8141808
sub_8141808: @ 8141808
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08141820 @ =gAnimBankTarget
	ldr r1, _08141824 @ =gEffectBank
	ldrb r1, [r1]
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_08141820: .4byte gAnimBankTarget
_08141824: .4byte gEffectBank
	thumb_func_end sub_8141808

	thumb_func_start sub_8141828
sub_8141828: @ 8141828
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	mov r8, r0
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	ldr r1, _081418E0 @ =gSharedMem + 0x17810
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	adds r5, r0, 0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r4, r0, 0
	adds r0, r6, 0
	bl IsAnimBankSpriteVisible
	lsls r0, 24
	cmp r0, 0
	beq _081418FC
	lsrs r0, r5, 16
	ldr r7, _081418E4 @ =0x0000ffff
	ands r5, r7
	eors r0, r5
	lsrs r1, r4, 16
	eors r0, r1
	ands r4, r7
	eors r0, r4
	cmp r0, 0x7
	bhi _08141882
	movs r0, 0x1
	mov r8, r0
_08141882:
	mov r0, r8
	cmp r0, 0
	beq _081418FC
	ldr r0, _081418E8 @ =0x000027f9
	bl GetSpriteTileStartByTag
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r7
	bne _081418A2
	ldr r0, _081418EC @ =gBattleAnimPicTable + (233 * 8)
	bl LoadCompressedObjectPic
	ldr r0, _081418F0 @ =gBattleAnimPaletteTable + (233 * 8)
	bl LoadCompressedObjectPalette
_081418A2:
	ldr r5, _081418F4 @ =sub_814191C
	adds r0, r5, 0
	movs r1, 0xA
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _081418F8 @ =gTasks
	lsls r2, r4, 2
	adds r2, r4
	lsls r2, 3
	adds r2, r3
	movs r4, 0
	strh r6, [r2, 0x8]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	strh r6, [r1, 0x8]
	strh r4, [r2, 0xA]
	movs r0, 0x1
	strh r0, [r1, 0xA]
	b _0814190E
	.align 2, 0
_081418E0: .4byte gSharedMem + 0x17810
_081418E4: .4byte 0x0000ffff
_081418E8: .4byte 0x000027f9
_081418EC: .4byte gBattleAnimPicTable + (233 * 8)
_081418F0: .4byte gBattleAnimPaletteTable + (233 * 8)
_081418F4: .4byte sub_814191C
_081418F8: .4byte gTasks
_081418FC:
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	ldr r1, _08141918 @ =gSharedMem + 0x17810
	adds r0, r1
	ldrb r1, [r0, 0x1]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x1]
_0814190E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141918: .4byte gSharedMem + 0x17810
	thumb_func_end sub_8141828

	thumb_func_start sub_814191C
sub_814191C: @ 814191C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08141944 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0x22]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r0, 0x3B
	bgt _08141948
	adds r0, r1, 0x1
	strh r0, [r4, 0x22]
	b _08141AB8
	.align 2, 0
_08141944: .4byte gTasks
_08141948:
	ldr r0, _08141998 @ =gSharedMem + 0x17840
	ldrb r0, [r0, 0xA]
	cmp r0, 0
	beq _08141952
	b _08141AB8
_08141952:
	ldrh r0, [r4, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1C]
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	cmp r1, 0
	beq _08141966
	b _08141AB8
_08141966:
	ldrb r0, [r4, 0x8]
	mov r8, r0
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r8
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _081419A0
	ldr r0, _0814199C @ =gBattleAnimSpriteTemplate_84024E8
	adds r1, r5, 0
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	b _08141A02
	.align 2, 0
_08141998: .4byte gSharedMem + 0x17840
_0814199C: .4byte gBattleAnimSpriteTemplate_84024E8
_081419A0:
	cmp r0, 0
	blt _081419D4
	cmp r0, 0x3
	bgt _081419D4
	ldr r0, _081419CC @ =gSpriteTemplate_8402500
	adds r1, r5, 0
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _081419D0 @ =gSprites
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	adds r2, r0
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x4
	b _081419F4
	.align 2, 0
_081419CC: .4byte gSpriteTemplate_8402500
_081419D0: .4byte gSprites
_081419D4:
	ldr r0, _08141A2C @ =gSpriteTemplate_8402500
	adds r1, r5, 0
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08141A30 @ =gSprites
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	adds r2, r0
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x5
_081419F4:
	ldr r4, _08141A34 @ =0x000003ff
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _08141A38 @ =0xfffffc00
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
_08141A02:
	ldr r2, _08141A3C @ =gTasks
	lsls r1, r7, 2
	adds r0, r1, r7
	lsls r0, 3
	adds r6, r0, r2
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	mov r9, r1
	cmp r0, 0
	bne _08141A44
	ldr r1, _08141A30 @ =gSprites
	lsls r2, r5, 4
	adds r0, r2, r5
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08141A40 @ =sub_8141B20
	str r1, [r0]
	adds r4, r2, 0
	b _08141A8C
	.align 2, 0
_08141A2C: .4byte gSpriteTemplate_8402500
_08141A30: .4byte gSprites
_08141A34: .4byte 0x000003ff
_08141A38: .4byte 0xfffffc00
_08141A3C: .4byte gTasks
_08141A40: .4byte sub_8141B20
_08141A44:
	ldr r3, _08141AC4 @ =gSprites
	lsls r4, r5, 4
	adds r1, r4, r5
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _08141AC8 @ =sub_8141B74
	str r2, [r0]
	adds r1, r3
	ldr r0, _08141ACC @ =0x0000ffe0
	strh r0, [r1, 0x24]
	movs r0, 0x20
	strh r0, [r1, 0x26]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	movs r1, 0x1E
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08141A8C
	mov r0, r8
	bl GetBattlerSide
	lsls r0, 24
	movs r1, 0x3F
	cmp r0, 0
	bne _08141A82
	movs r1, 0xC0
_08141A82:
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x66
	bl PlaySE12WithPanning
_08141A8C:
	ldr r1, _08141AC4 @ =gSprites
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	strh r7, [r0, 0x2E]
	ldr r1, _08141AD0 @ =gTasks
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r2, r0, r1
	ldrh r1, [r2, 0x1E]
	adds r1, 0x1
	strh r1, [r2, 0x1E]
	ldrh r0, [r2, 0x20]
	adds r0, 0x1
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x5
	bne _08141AB8
	ldr r0, _08141AD4 @ =sub_8141AD8
	str r0, [r2]
_08141AB8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141AC4: .4byte gSprites
_08141AC8: .4byte sub_8141B74
_08141ACC: .4byte 0x0000ffe0
_08141AD0: .4byte gTasks
_08141AD4: .4byte sub_8141AD8
	thumb_func_end sub_814191C

	thumb_func_start sub_8141AD8
sub_8141AD8: @ 8141AD8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	ldr r1, _08141B18 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r1, r0, r1
	movs r2, 0x20
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08141B14
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	bne _08141B0E
	ldrb r1, [r1, 0x8]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08141B1C @ =gSharedMem + 0x17810
	adds r0, r1
	ldrb r1, [r0, 0x1]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x1]
_08141B0E:
	adds r0, r3, 0
	bl DestroyTask
_08141B14:
	pop {r0}
	bx r0
	.align 2, 0
_08141B18: .4byte gTasks
_08141B1C: .4byte gSharedMem + 0x17810
	thumb_func_end sub_8141AD8

	thumb_func_start sub_8141B20
sub_8141B20: @ 8141B20
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x18
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x18
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0xC
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08141B6A
	ldr r2, _08141B70 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x20]
	subs r1, 0x1
	strh r1, [r0, 0x20]
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_08141B6A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141B70: .4byte gTasks
	thumb_func_end sub_8141B20

	thumb_func_start sub_8141B74
sub_8141B74: @ 8141B74
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	bgt _08141B88
	adds r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _08141BCA
_08141B88:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r4, 0x24]
	adds r1, 0x5
	strh r1, [r4, 0x24]
	ldrh r0, [r4, 0x26]
	subs r0, 0x5
	strh r0, [r4, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x20
	ble _08141BCA
	ldr r2, _08141BD0 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x20]
	subs r1, 0x1
	strh r1, [r0, 0x20]
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_08141BCA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141BD0: .4byte gTasks
	thumb_func_end sub_8141B74

	thumb_func_start sub_8141BD4
sub_8141BD4: @ 8141BD4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08141BFC @ =gBattleAnimPicTable + (269 * 8)
	bl LoadCompressedObjectPic
	ldr r0, _08141C00 @ =gBattleAnimPaletteTable + (269 * 8)
	bl LoadCompressedObjectPalette
	ldr r0, _08141C04 @ =0x0000281d
	bl IndexOfSpritePaletteTag
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141BFC: .4byte gBattleAnimPicTable + (269 * 8)
_08141C00: .4byte gBattleAnimPaletteTable + (269 * 8)
_08141C04: .4byte 0x0000281d
	thumb_func_end sub_8141BD4

	thumb_func_start sub_8141C08
sub_8141C08: @ 8141C08
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08141C2C @ =0x0000281d
	adds r0, r5, 0
	bl FreeSpriteTilesByTag
	adds r0, r5, 0
	bl FreeSpritePaletteByTag
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08141C2C: .4byte 0x0000281d
	thumb_func_end sub_8141C08

	thumb_func_start sub_8141C30
sub_8141C30: @ 8141C30
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0
	bl InitAnimSpritePos
	movs r0, 0x1E
	strh r0, [r4, 0x2E]
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl GetBattlerSpriteCoord
	lsls r0, 24
	ldr r5, _08141CA4 @ =gBattleAnimArgs
	lsrs r0, 24
	ldrh r1, [r5, 0x4]
	adds r0, r1
	strh r0, [r4, 0x32]
	movs r0, 0x1
	bl GetBattlerAtPosition
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl GetBattlerSpriteCoord
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	strh r0, [r4, 0x36]
	ldr r0, _08141CA8 @ =0x0000ffe0
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl InitAnimSpriteTranslationOverDuration
	ldr r1, _08141CAC @ =gBankSpriteIds
	ldr r0, _08141CB0 @ =gAnimBankAttacker
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08141CB4 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _08141CB8 @ =sub_8141CBC
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08141CA4: .4byte gBattleAnimArgs
_08141CA8: .4byte 0x0000ffe0
_08141CAC: .4byte gBankSpriteIds
_08141CB0: .4byte gAnimBankAttacker
_08141CB4: .4byte gSprites
_08141CB8: .4byte sub_8141CBC
	thumb_func_end sub_8141C30

	thumb_func_start sub_8141CBC
sub_8141CBC: @ 8141CBC
	push {lr}
	adds r3, r0, 0
	ldr r2, _08141CE4 @ =gSprites
	ldr r1, _08141CE8 @ =gBankSpriteIds
	ldr r0, _08141CEC @ =gAnimBankAttacker
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08141CE0
	ldr r0, _08141CF0 @ =sub_8141CF4
	str r0, [r3, 0x1C]
_08141CE0:
	pop {r0}
	bx r0
	.align 2, 0
_08141CE4: .4byte gSprites
_08141CE8: .4byte gBankSpriteIds
_08141CEC: .4byte gAnimBankAttacker
_08141CF0: .4byte sub_8141CF4
	thumb_func_end sub_8141CBC

	thumb_func_start sub_8141CF4
sub_8141CF4: @ 8141CF4
	push {r4,lr}
	adds r4, r0, 0
	bl TranslateAnimSpriteLinearAndSine
	lsls r0, 24
	cmp r0, 0
	beq _08141D16
	movs r0, 0
	strh r0, [r4, 0x2E]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08141D1C @ =sub_8141D20
	str r0, [r4, 0x1C]
_08141D16:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141D1C: .4byte sub_8141D20
	thumb_func_end sub_8141CF4

	thumb_func_start sub_8141D20
sub_8141D20: @ 8141D20
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _08141D70 @ =gSprites
	ldr r3, _08141D74 @ =gBankSpriteIds
	ldr r2, _08141D78 @ =gAnimBankAttacker
	ldrb r0, [r2]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	bge _08141D68
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	ble _08141D68
	ldrb r0, [r2]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl DestroyAnimSprite
_08141D68:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08141D70: .4byte gSprites
_08141D74: .4byte gBankSpriteIds
_08141D78: .4byte gAnimBankAttacker
	thumb_func_end sub_8141D20

	thumb_func_start sub_8141D7C
sub_8141D7C: @ 8141D7C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl GetBattlerAtPosition
	ldr r1, _08141DA4 @ =gAnimBankAttacker
	strb r0, [r1]
	movs r0, 0x1
	bl GetBattlerAtPosition
	ldr r1, _08141DA8 @ =gAnimBankTarget
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyAnimVisualTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141DA4: .4byte gAnimBankAttacker
_08141DA8: .4byte gAnimBankTarget
	thumb_func_end sub_8141D7C

	thumb_func_start sub_8141DAC
sub_8141DAC: @ 8141DAC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08141DC0 @ =gSharedMem + 0x17840
	ldrh r1, [r0]
	cmp r1, 0x53
	bne _08141DC8
	ldr r1, _08141DC4 @ =gBattleAnimArgs
	movs r0, 0x1
	b _08141E00
	.align 2, 0
_08141DC0: .4byte gSharedMem + 0x17840
_08141DC4: .4byte gBattleAnimArgs
_08141DC8:
	cmp r1, 0xFA
	bne _08141DD8
	ldr r1, _08141DD4 @ =gBattleAnimArgs
	movs r0, 0x2
	b _08141E00
	.align 2, 0
_08141DD4: .4byte gBattleAnimArgs
_08141DD8:
	cmp r1, 0x80
	bne _08141DE8
	ldr r1, _08141DE4 @ =gBattleAnimArgs
	movs r0, 0x3
	b _08141E00
	.align 2, 0
_08141DE4: .4byte gBattleAnimArgs
_08141DE8:
	movs r0, 0xA4
	lsls r0, 1
	cmp r1, r0
	bne _08141DFC
	ldr r1, _08141DF8 @ =gBattleAnimArgs
	movs r0, 0x4
	b _08141E00
	.align 2, 0
_08141DF8: .4byte gBattleAnimArgs
_08141DFC:
	ldr r1, _08141E0C @ =gBattleAnimArgs
	movs r0, 0
_08141E00:
	strh r0, [r1]
	adds r0, r2, 0
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_08141E0C: .4byte gBattleAnimArgs
	thumb_func_end sub_8141DAC

	thumb_func_start sub_8141E10
sub_8141E10: @ 8141E10
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08141E2C @ =gAnimBankAttacker
	ldr r1, _08141E30 @ =gSharedMem + 0x17840
	ldrh r1, [r1]
	strb r1, [r2]
	ldr r2, _08141E34 @ =gAnimBankTarget
	lsrs r1, 8
	strb r1, [r2]
	bl DestroyAnimVisualTask
	pop {r0}
	bx r0
	.align 2, 0
_08141E2C: .4byte gAnimBankAttacker
_08141E30: .4byte gSharedMem + 0x17840
_08141E34: .4byte gAnimBankTarget
	thumb_func_end sub_8141E10

	.align 2, 0 @ Don't pad with nop.
