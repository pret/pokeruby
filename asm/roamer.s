	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text
	
	thumb_func_start sub_81341F8
sub_81341F8: @ 81341F8
	push {lr}
	ldr r0, _08134208 @ =gSaveBlock1 + 0x3144
	movs r1, 0
	movs r2, 0x1C
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_08134208: .4byte gSaveBlock1 + 0x3144
	thumb_func_end sub_81341F8

	thumb_func_start sub_813420C
sub_813420C: @ 813420C
	push {r4-r6,lr}
	movs r2, 0
	ldr r6, _08134238 @ =gRoamerLocation
	ldr r4, _0813423C @ =gUnknown_020392FC
	movs r3, 0
	adds r5, r4, 0x1
_08134218:
	lsls r1, r2, 1
	adds r0, r1, r4
	strb r3, [r0]
	adds r1, r5
	strb r3, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _08134218
	movs r0, 0
	strb r0, [r6]
	strb r0, [r6, 0x1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08134238: .4byte gRoamerLocation
_0813423C: .4byte gUnknown_020392FC
	thumb_func_end sub_813420C

	thumb_func_start sub_8134240
sub_8134240: @ 8134240
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x10
	ldr r5, _081342FC @ =gEnemyParty
	.ifdef SAPPHIRE
	ldr r6, _sub_8134240_Latias @ =407
	.else
	movs r6, 0xCC
	lsls r6, 1
	.endif
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r5, 0
	adds r1, r6, 0
	movs r2, 0x28
	movs r3, 0x20
	bl CreateMon
	ldr r4, _08134300 @ =gSaveBlock1 + 0x3144
	movs r0, 0
	mov r8, r0
	strh r6, [r4, 0x8]
	movs r0, 0x28
	strb r0, [r4, 0xC]
	mov r0, r8
	strb r0, [r4, 0xD]
	movs r0, 0x1
	strb r0, [r4, 0x13]
	adds r0, r5, 0
	movs r1, 0x42
	bl GetMonData
	str r0, [r4]
	adds r0, r5, 0
	movs r1, 0
	bl GetMonData
	str r0, [r4, 0x4]
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	strh r0, [r4, 0xA]
	adds r0, r5, 0
	movs r1, 0x16
	bl GetMonData
	strb r0, [r4, 0xE]
	adds r0, r5, 0
	movs r1, 0x17
	bl GetMonData
	strb r0, [r4, 0xF]
	adds r0, r5, 0
	movs r1, 0x18
	bl GetMonData
	strb r0, [r4, 0x10]
	adds r0, r5, 0
	movs r1, 0x21
	bl GetMonData
	strb r0, [r4, 0x11]
	adds r0, r5, 0
	movs r1, 0x2F
	bl GetMonData
	strb r0, [r4, 0x12]
	ldr r4, _08134304 @ =gRoamerLocation
	mov r0, r8
	strb r0, [r4]
	bl Random
	ldr r5, _08134308 @ =gRoamerLocations
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x14
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	adds r1, r5
	ldrb r0, [r1]
	strb r0, [r4, 0x1]
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081342FC: .4byte gEnemyParty
	.ifdef SAPPHIRE
_sub_8134240_Latias: .4byte 407
	.endif
_08134300: .4byte gSaveBlock1 + 0x3144
_08134304: .4byte gRoamerLocation
_08134308: .4byte gRoamerLocations
	thumb_func_end sub_8134240

	thumb_func_start sub_813430C
sub_813430C: @ 813430C
	push {lr}
	bl sub_81341F8
	bl sub_813420C
	bl sub_8134240
	pop {r0}
	bx r0
	thumb_func_end sub_813430C

	thumb_func_start mapnumbers_history_shift_sav1_0_2_4_out
mapnumbers_history_shift_sav1_0_2_4_out: @ 8134320
	ldr r0, _08134340 @ =gUnknown_020392FC
	ldrb r1, [r0, 0x2]
	strb r1, [r0, 0x4]
	ldrb r1, [r0, 0x3]
	strb r1, [r0, 0x5]
	ldrb r1, [r0]
	strb r1, [r0, 0x2]
	ldrb r1, [r0, 0x1]
	strb r1, [r0, 0x3]
	ldr r2, _08134344 @ =gSaveBlock1
	ldrb r1, [r2, 0x4]
	strb r1, [r0]
	ldrb r1, [r2, 0x5]
	strb r1, [r0, 0x1]
	bx lr
	.align 2, 0
_08134340: .4byte gUnknown_020392FC
_08134344: .4byte gSaveBlock1
	thumb_func_end mapnumbers_history_shift_sav1_0_2_4_out

	thumb_func_start sub_8134348
sub_8134348: @ 8134348
	push {r4,r5,lr}
	movs r1, 0
	ldr r0, _08134388 @ =gSaveBlock1 + 0x3144
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	beq _08134380
	ldr r0, _0813438C @ =gRoamerLocation
	strb r1, [r0]
	ldr r5, _08134390 @ =gRoamerLocations
	adds r4, r0, 0
_0813435C:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x14
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	adds r1, r5
	ldrb r1, [r1]
	ldrb r0, [r4, 0x1]
	cmp r0, r1
	beq _0813435C
	strb r1, [r4, 0x1]
_08134380:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08134388: .4byte gSaveBlock1 + 0x3144
_0813438C: .4byte gRoamerLocation
_08134390: .4byte gRoamerLocations
	thumb_func_end sub_8134348

	thumb_func_start sub_8134394
sub_8134394: @ 8134394
	push {r4-r7,lr}
	movs r4, 0
	bl Random
	lsls r0, 16
	movs r1, 0xF0
	lsls r1, 12
	ands r1, r0
	cmp r1, 0
	bne _081343AE
	bl sub_8134348
	b _08134416
_081343AE:
	ldr r0, _081343FC @ =gSaveBlock1 + 0x3144
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	beq _08134416
	ldr r7, _08134400 @ =gRoamerLocation
	ldr r3, _08134404 @ =gRoamerLocations
_081343BA:
	lsls r0, r4, 1
	adds r0, r4
	lsls r2, r0, 1
	adds r1, r2, r3
	ldrb r0, [r7, 0x1]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0813440C
	ldr r6, _08134404 @ =gRoamerLocations
	adds r5, r2, 0x1
	ldr r4, _08134408 @ =gUnknown_020392FC
_081343D0:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	adds r0, r5
	adds r0, r6
	ldrb r1, [r0]
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	bne _081343F4
	ldrb r0, [r4, 0x5]
	cmp r0, r1
	beq _081343D0
_081343F4:
	cmp r1, 0xFF
	beq _081343D0
	strb r1, [r7, 0x1]
	b _08134416
	.align 2, 0
_081343FC: .4byte gSaveBlock1 + 0x3144
_08134400: .4byte gRoamerLocation
_08134404: .4byte gRoamerLocations
_08134408: .4byte gUnknown_020392FC
_0813440C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _081343BA
_08134416:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8134394

	thumb_func_start sub_813441C
sub_813441C: @ 813441C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08134440 @ =gSaveBlock1 + 0x3144
	ldrb r0, [r0, 0x13]
	cmp r0, 0
	beq _08134448
	ldr r0, _08134444 @ =gRoamerLocation
	ldrb r3, [r0]
	cmp r2, r3
	bne _08134448
	ldrb r0, [r0, 0x1]
	cmp r1, r0
	bne _08134448
	movs r0, 0x1
	b _0813444A
	.align 2, 0
_08134440: .4byte gSaveBlock1 + 0x3144
_08134444: .4byte gRoamerLocation
_08134448:
	movs r0, 0
_0813444A:
	pop {r1}
	bx r1
	thumb_func_end sub_813441C

	thumb_func_start sub_8134450
sub_8134450: @ 8134450
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, _081344C4 @ =gEnemyParty
	ldr r5, _081344C8 @ =gSaveBlock1 + 0x3144
	ldrh r1, [r5, 0x8]
	ldrb r2, [r5, 0xC]
	ldr r3, [r5]
	ldr r0, [r5, 0x4]
	str r0, [sp]
	adds r0, r4, 0
	bl CreateMonWithIVsPersonality
	adds r2, r5, 0
	adds r2, 0xD
	adds r0, r4, 0
	movs r1, 0x37
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0xA
	adds r0, r4, 0
	movs r1, 0x39
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0xE
	adds r0, r4, 0
	movs r1, 0x16
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0xF
	adds r0, r4, 0
	movs r1, 0x17
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x10
	adds r0, r4, 0
	movs r1, 0x18
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x11
	adds r0, r4, 0
	movs r1, 0x21
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x12
	adds r0, r4, 0
	movs r1, 0x2F
	bl SetMonData
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081344C4: .4byte gEnemyParty
_081344C8: .4byte gSaveBlock1 + 0x3144
	thumb_func_end sub_8134450

	thumb_func_start sub_81344CC
sub_81344CC: @ 81344CC
	push {lr}
	ldr r1, _081344F8 @ =gSaveBlock1
	ldrb r0, [r1, 0x4]
	ldrb r1, [r1, 0x5]
	bl sub_813441C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081344FC
	bl Random
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	cmp r1, 0
	bne _081344FC
	bl sub_8134450
	movs r0, 0x1
	b _081344FE
	.align 2, 0
_081344F8: .4byte gSaveBlock1
_081344FC:
	movs r0, 0
_081344FE:
	pop {r1}
	bx r1
	thumb_func_end sub_81344CC

	thumb_func_start sub_8134504
sub_8134504: @ 8134504
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x39
	bl GetMonData
	ldr r4, _08134528 @ =gSaveBlock1 + 0x3144
	strh r0, [r4, 0xA]
	adds r0, r5, 0
	movs r1, 0x37
	bl GetMonData
	strb r0, [r4, 0xD]
	bl sub_8134348
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08134528: .4byte gSaveBlock1 + 0x3144
	thumb_func_end sub_8134504

	thumb_func_start sub_813452C
sub_813452C: @ 813452C
	ldr r1, _08134534 @ =gSaveBlock1 + 0x3144
	movs r0, 0
	strb r0, [r1, 0x13]
	bx lr
	.align 2, 0
_08134534: .4byte gSaveBlock1 + 0x3144
	thumb_func_end sub_813452C

	thumb_func_start GetRoamerLocation
GetRoamerLocation: @ 8134538
	ldr r3, _08134544 @ =gRoamerLocation
	ldrb r2, [r3]
	strb r2, [r0]
	ldrb r0, [r3, 0x1]
	strb r0, [r1]
	bx lr
	.align 2, 0
_08134544: .4byte gRoamerLocation
	thumb_func_end GetRoamerLocation

	.align 2, 0 @ Don't pad with nop.