	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start DisableWildEncounters
DisableWildEncounters: @ 8084978
	ldr r1, _08084980
	strb r0, [r1]
	bx lr
	.align 2, 0
_08084980: .4byte gWildEncountersDisabled
	thumb_func_end DisableWildEncounters

	thumb_func_start sub_8084984
sub_8084984: @ 8084984
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x4]
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08084A0C
	lsls r1, r2, 1
	adds r1, r2
	lsls r2, r1, 1
	adds r2, r3
	adds r0, r1, 0x1
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	mov r9, r0
	adds r1, 0x2
	lsls r1, 1
	adds r1, r3
	ldrh r6, [r1]
	ldrh r5, [r2]
	cmp r5, r9
	bhi _08084A2E
	ldr r0, _08084A10
	mov r10, r0
_080849C6:
	movs r4, 0
	mov r1, r10
	ldr r0, [r1]
	ldr r0, [r0]
	cmp r4, r0
	bge _08084A24
	ldr r1, [sp]
	lsls r0, r1, 16
	asrs r0, 16
	mov r8, r0
	ldr r1, [sp, 0x4]
	lsls r0, r1, 16
	asrs r7, r0, 16
_080849E0:
	adds r0, r4, 0x7
	adds r1, r5, 0x7
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_805759C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08084A14
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r8, r4
	bne _08084A14
	cmp r7, r5
	bne _08084A14
	adds r0, r6, 0
	b _08084A34
	.align 2, 0
_08084A0C: .4byte gUnknown_0839DC00
_08084A10: .4byte gMapHeader
_08084A14:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	mov r1, r10
	ldr r0, [r1]
	ldr r0, [r0]
	cmp r4, r0
	blt _080849E0
_08084A24:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r9
	bls _080849C6
_08084A2E:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r0, 16
_08084A34:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8084984

	thumb_func_start CheckFeebas
CheckFeebas: @ 8084A44
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	movs r7, 0
	ldr r0, _08084ABC
	ldrh r1, [r0, 0x4]
	movs r0, 0x88
	lsls r0, 6
	cmp r1, r0
	bne _08084B38
	add r5, sp, 0xC
	mov r4, sp
	adds r4, 0xE
	adds r0, r5, 0
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldrh r0, [r5]
	subs r0, 0x7
	strh r0, [r5]
	ldrh r0, [r4]
	subs r0, 0x7
	strh r0, [r4]
	movs r0, 0
	ldrsh r1, [r4, r0]
	ldr r0, _08084AC0
	mov r9, r5
	mov r8, r4
	ldrh r2, [r0, 0x6]
	cmp r1, r2
	blt _08084A8E
	ldrh r3, [r0, 0x8]
	cmp r1, r3
	bgt _08084A8E
	movs r7, 0x1
_08084A8E:
	mov r2, r8
	movs r3, 0
	ldrsh r1, [r2, r3]
	ldrh r2, [r0, 0xC]
	cmp r1, r2
	blt _08084AA2
	ldrh r0, [r0, 0xE]
	cmp r1, r0
	bgt _08084AA2
	movs r7, 0x2
_08084AA2:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bls _08084AC8
	b _08084B38
	.align 2, 0
_08084ABC: .4byte gSaveBlock1
_08084AC0: .4byte gUnknown_0839DC00
_08084AC4:
	movs r0, 0x1
	b _08084B3A
_08084AC8:
	ldr r0, _08084B48
	ldr r3, _08084B4C
	adds r0, r3
	ldrh r0, [r0]
	bl FeebasSeedRng
	movs r5, 0
	ldr r6, _08084B50
_08084AD8:
	bl FeebasRandom
	lsls r1, r5, 1
	mov r2, sp
	adds r4, r2, r1
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	bl __umodsi3
	strh r0, [r4]
	lsls r0, 16
	cmp r0, 0
	bne _08084AF6
	strh r6, [r4]
_08084AF6:
	ldrh r0, [r4]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bls _08084B08
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08084B08:
	cmp r5, 0x6
	bne _08084AD8
	mov r3, r9
	movs r1, 0
	ldrsh r0, [r3, r1]
	mov r2, r8
	movs r3, 0
	ldrsh r1, [r2, r3]
	adds r2, r7, 0
	bl sub_8084984
	lsls r0, 16
	lsrs r1, r0, 16
	movs r5, 0
_08084B24:
	lsls r0, r5, 1
	add r0, sp
	ldrh r0, [r0]
	cmp r1, r0
	beq _08084AC4
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08084B24
_08084B38:
	movs r0, 0
_08084B3A:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08084B48: .4byte gSaveBlock1
_08084B4C: .4byte 0x00002dd6
_08084B50: .4byte 0x000001bf
	thumb_func_end CheckFeebas

	thumb_func_start FeebasRandom
FeebasRandom: @ 8084B54
	ldr r2, _08084B68
	ldr r1, [r2]
	ldr r0, _08084B6C
	muls r0, r1
	ldr r1, _08084B70
	adds r0, r1
	str r0, [r2]
	lsrs r0, 16
	bx lr
	.align 2, 0
_08084B68: .4byte gUnknown_0202FF80
_08084B6C: .4byte 0x41c64e6d
_08084B70: .4byte 0x00003039
	thumb_func_end FeebasRandom

	thumb_func_start FeebasSeedRng
FeebasSeedRng: @ 8084B74
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08084B80
	str r0, [r1]
	bx lr
	.align 2, 0
_08084B80: .4byte gUnknown_0202FF80
	thumb_func_end FeebasSeedRng

	thumb_func_start PickWildMon_Grass
PickWildMon_Grass: @ 8084B84
	push {lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x13
	bhi _08084BA0
	movs r0, 0
	b _08084C3A
_08084BA0:
	adds r0, r1, 0
	subs r0, 0x14
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _08084BB0
	movs r0, 0x1
	b _08084C3A
_08084BB0:
	adds r0, r1, 0
	subs r0, 0x28
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bhi _08084BC0
	movs r0, 0x2
	b _08084C3A
_08084BC0:
	adds r0, r1, 0
	subs r0, 0x32
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bhi _08084BD0
	movs r0, 0x3
	b _08084C3A
_08084BD0:
	adds r0, r1, 0
	subs r0, 0x3C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bhi _08084BE0
	movs r0, 0x4
	b _08084C3A
_08084BE0:
	adds r0, r1, 0
	subs r0, 0x46
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bhi _08084BF0
	movs r0, 0x5
	b _08084C3A
_08084BF0:
	adds r0, r1, 0
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _08084C00
	movs r0, 0x6
	b _08084C3A
_08084C00:
	adds r0, r1, 0
	subs r0, 0x55
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _08084C10
	movs r0, 0x7
	b _08084C3A
_08084C10:
	adds r0, r1, 0
	subs r0, 0x5A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08084C20
	movs r0, 0x8
	b _08084C3A
_08084C20:
	adds r0, r1, 0
	subs r0, 0x5E
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08084C30
	movs r0, 0x9
	b _08084C3A
_08084C30:
	cmp r1, 0x62
	beq _08084C38
	movs r0, 0xB
	b _08084C3A
_08084C38:
	movs r0, 0xA
_08084C3A:
	pop {r1}
	bx r1
	thumb_func_end PickWildMon_Grass

	thumb_func_start PickWildMon_Water
PickWildMon_Water: @ 8084C40
	push {lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	cmp r1, 0x3B
	bhi _08084C5E
	movs r0, 0
	b _08084C90
_08084C5E:
	adds r0, r1, 0
	subs r0, 0x3C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1D
	bhi _08084C6E
	movs r0, 0x1
	b _08084C90
_08084C6E:
	adds r0, r1, 0
	subs r0, 0x5A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _08084C7E
	movs r0, 0x2
	b _08084C90
_08084C7E:
	adds r0, r2, 0
	subs r0, 0x5F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _08084C8E
	movs r0, 0x4
	b _08084C90
_08084C8E:
	movs r0, 0x3
_08084C90:
	pop {r1}
	bx r1
	thumb_func_end PickWildMon_Water

	thumb_func_start PickWildMon_Fishing
PickWildMon_Fishing: @ 8084C94
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	movs r5, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r4, 0x1
	beq _08084CCE
	cmp r4, 0x1
	bgt _08084CBE
	cmp r4, 0
	beq _08084CC4
	b _08084D28
_08084CBE:
	cmp r6, 0x2
	beq _08084CF2
	b _08084D28
_08084CC4:
	movs r5, 0x1
	cmp r1, 0x45
	bhi _08084D28
	movs r5, 0
	b _08084D28
_08084CCE:
	cmp r1, 0x3B
	bhi _08084CD4
	movs r5, 0x2
_08084CD4:
	adds r0, r1, 0
	subs r0, 0x3C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _08084CE2
	movs r5, 0x3
_08084CE2:
	adds r0, r1, 0
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _08084D28
	movs r5, 0x4
	b _08084D28
_08084CF2:
	cmp r1, 0x27
	bhi _08084CF8
	movs r5, 0x5
_08084CF8:
	adds r0, r1, 0
	subs r0, 0x28
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x27
	bhi _08084D06
	movs r5, 0x6
_08084D06:
	adds r0, r1, 0
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE
	bhi _08084D14
	movs r5, 0x7
_08084D14:
	adds r0, r1, 0
	subs r0, 0x5F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08084D22
	movs r5, 0x8
_08084D22:
	cmp r1, 0x63
	bne _08084D28
	movs r5, 0x9
_08084D28:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end PickWildMon_Fishing

	thumb_func_start RandomInRange
RandomInRange: @ 8084D30
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x1]
	ldrb r1, [r4]
	cmp r0, r1
	bcc _08084D40
	ldrb r5, [r4]
	b _08084D44
_08084D40:
	ldrb r5, [r4, 0x1]
	ldrb r0, [r4]
_08084D44:
	subs r4, r0, r5
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 24
	lsrs r0, 24
	adds r0, r5, r0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end RandomInRange

	thumb_func_start GetCurrentMapWildMonHeader
GetCurrentMapWildMonHeader: @ 8084D6C
	push {r4-r6,lr}
	movs r3, 0
	ldr r5, _08084D9C
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _08084DB8
	adds r6, r5, 0
	ldr r4, _08084DA0
_08084D7C:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r6
	ldrb r1, [r2]
	movs r0, 0x4
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne _08084DA4
	ldrb r1, [r2, 0x1]
	movs r0, 0x5
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne _08084DA4
	adds r0, r3, 0
	b _08084DBA
	.align 2, 0
_08084D9C: .4byte gWildMonHeaders
_08084DA0: .4byte gSaveBlock1
_08084DA4:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08084D7C
_08084DB8:
	ldr r0, _08084DC0
_08084DBA:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08084DC0: .4byte 0x0000ffff
	thumb_func_end GetCurrentMapWildMonHeader

	thumb_func_start PickWildMonNature
PickWildMonNature: @ 8084DC4
	push {r4-r7,lr}
	sub sp, 0x1C
	bl GetSafariZoneFlag
	cmp r0, 0x1
	bne _08084E5E
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4F
	bhi _08084E5E
	bl sub_80C8448
	adds r7, r0, 0
	cmp r7, 0
	beq _08084E5E
	movs r5, 0
_08084DF2:
	mov r1, sp
	adds r0, r1, r5
	strb r5, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x18
	bls _08084DF2
	movs r5, 0
_08084E04:
	adds r1, r5, 0x1
	lsls r0, r1, 24
	lsrs r4, r0, 24
	adds r6, r1, 0
	cmp r4, 0x18
	bhi _08084E34
	add r5, sp
_08084E12:
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08084E2A
	ldrb r2, [r5]
	mov r0, sp
	adds r1, r0, r4
	ldrb r0, [r1]
	strb r0, [r5]
	strb r2, [r1]
_08084E2A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x18
	bls _08084E12
_08084E34:
	lsls r0, r6, 24
	lsrs r5, r0, 24
	cmp r5, 0x17
	bls _08084E04
	movs r5, 0
_08084E3E:
	mov r1, sp
	adds r4, r1, r5
	ldrb r0, [r4]
	adds r1, r7, 0
	bl sub_810CAE4
	lsls r0, 16
	cmp r0, 0
	ble _08084E54
	ldrb r0, [r4]
	b _08084E70
_08084E54:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x18
	bls _08084E3E
_08084E5E:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
_08084E70:
	add sp, 0x1C
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end PickWildMonNature

	thumb_func_start CreateWildMon
CreateWildMon: @ 8084E78
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	bl ZeroEnemyPartyMons
	bl PickWildMonNature
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08084EAC
	str r0, [sp]
	adds r0, r1, 0
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x20
	bl CreateMonWithNature
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084EAC: .4byte gEnemyParty
	thumb_func_end CreateWildMon

	thumb_func_start GenerateWildMon
GenerateWildMon: @ 8084EB0
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r3, r1, 0
	lsls r2, 24
	lsrs r7, r2, 24
	movs r0, 0
	cmp r1, 0x1
	beq _08084EDA
	cmp r1, 0x1
	bgt _08084ECE
	cmp r1, 0
	beq _08084ED4
	b _08084EE2
_08084ECE:
	cmp r3, 0x2
	beq _08084EDA
	b _08084EE2
_08084ED4:
	bl PickWildMon_Grass
	b _08084EDE
_08084EDA:
	bl PickWildMon_Water
_08084EDE:
	lsls r0, 24
	lsrs r0, 24
_08084EE2:
	lsls r4, r0, 2
	ldr r0, [r6, 0x4]
	adds r0, r4
	bl RandomInRange
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r7, 0x1
	bne _08084F04
	adds r0, r5, 0
	bl RepelCheck
	lsls r0, 24
	cmp r0, 0
	bne _08084F04
	movs r0, 0
	b _08084F12
_08084F04:
	ldr r0, [r6, 0x4]
	adds r0, r4, r0
	ldrh r0, [r0, 0x2]
	adds r1, r5, 0
	bl CreateWildMon
	movs r0, 0x1
_08084F12:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GenerateWildMon

	thumb_func_start GenerateFishingWildMon
GenerateFishingWildMon: @ 8084F18
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r0, r1, 24
	lsrs r0, 24
	bl PickWildMon_Fishing
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 22
	ldr r0, [r5, 0x4]
	adds r0, r4
	bl RandomInRange
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, [r5, 0x4]
	adds r0, r4, r0
	ldrh r0, [r0, 0x2]
	bl CreateWildMon
	ldr r0, [r5, 0x4]
	adds r4, r0
	ldrh r0, [r4, 0x2]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GenerateFishingWildMon

	thumb_func_start SetUpMassOutbreakEncounter
SetUpMassOutbreakEncounter: @ 8084F50
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08084F78
	ldr r0, _08084F74
	movs r1, 0xAC
	lsls r1, 6
	adds r0, r1
	ldrb r0, [r0]
	bl RepelCheck
	lsls r0, 24
	cmp r0, 0
	bne _08084F78
	movs r0, 0
	b _08084FAC
	.align 2, 0
_08084F74: .4byte gSaveBlock1
_08084F78:
	ldr r4, _08084FB4
	ldr r2, _08084FB8
	adds r0, r4, r2
	ldrh r0, [r0]
	adds r2, 0x4
	adds r1, r4, r2
	ldrb r1, [r1]
	bl CreateWildMon
	movs r5, 0
	ldr r0, _08084FBC
	adds r4, r0
_08084F90:
	lsls r0, r5, 1
	adds r0, r4
	ldrh r1, [r0]
	lsls r2, r5, 24
	lsrs r2, 24
	ldr r0, _08084FC0
	bl SetMonMoveSlot
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _08084F90
	movs r0, 0x1
_08084FAC:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08084FB4: .4byte gSaveBlock1
_08084FB8: .4byte 0x00002afc
_08084FBC: .4byte 0x00002b04
_08084FC0: .4byte gEnemyParty
	thumb_func_end SetUpMassOutbreakEncounter

	thumb_func_start DoMassOutbreakEncounterTest
DoMassOutbreakEncounterTest: @ 8084FC4
	push {r4,lr}
	ldr r4, _08085010
	ldr r1, _08085014
	adds r0, r4, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _08085020
	movs r1, 0x5
	ldrsb r1, [r4, r1]
	ldr r2, _08085018
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r1, r0
	bne _08085020
	movs r1, 0x4
	ldrsb r1, [r4, r1]
	adds r2, 0x1
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r1, r0
	bne _08085020
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	ldr r2, _0808501C
	adds r1, r4, r2
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08085020
	movs r0, 0x1
	b _08085022
	.align 2, 0
_08085010: .4byte gSaveBlock1
_08085014: .4byte 0x00002afc
_08085018: .4byte 0x00002afe
_0808501C: .4byte 0x00002b0d
_08085020:
	movs r0, 0
_08085022:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end DoMassOutbreakEncounterTest

	thumb_func_start DoWildEncounterRateDiceRoll
DoWildEncounterRateDiceRoll: @ 8085028
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xB4
	lsls r1, 4
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r4
	bcc _0808504C
	movs r0, 0
	b _0808504E
_0808504C:
	movs r0, 0x1
_0808504E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end DoWildEncounterRateDiceRoll

	thumb_func_start DoWildEncounterTest
DoWildEncounterTest: @ 8085054
	push {r4,lr}
	sub sp, 0x4
	str r0, [sp]
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r0, 4
	str r0, [sp]
	movs r0, 0x6
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0808507E
	ldr r1, [sp]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	movs r1, 0x64
	bl __udivsi3
	str r0, [sp]
_0808507E:
	mov r0, sp
	bl ApplyFluteEncounterRateMod
	mov r0, sp
	bl ApplyCleanseTagEncounterRateMod
	cmp r4, 0
	bne _080850BA
	ldr r4, _080850DC
	adds r0, r4, 0
	movs r1, 0x6
	bl GetMonData
	cmp r0, 0
	bne _080850BA
	adds r0, r4, 0
	bl GetMonAbility
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bne _080850B0
	ldr r0, [sp]
	lsrs r0, 1
	str r0, [sp]
_080850B0:
	cmp r1, 0x23
	bne _080850BA
	ldr r0, [sp]
	lsls r0, 1
	str r0, [sp]
_080850BA:
	ldr r0, [sp]
	movs r1, 0xB4
	lsls r1, 4
	cmp r0, r1
	bls _080850C6
	str r1, [sp]
_080850C6:
	ldr r0, [sp]
	lsls r0, 16
	lsrs r0, 16
	bl DoWildEncounterRateDiceRoll
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080850DC: .4byte gPlayerParty
	thumb_func_end DoWildEncounterTest

	thumb_func_start DoGlobalWildEncounterDiceRoll
DoGlobalWildEncounterDiceRoll: @ 80850E0
	push {lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3B
	bhi _080850FC
	movs r0, 0x1
	b _080850FE
_080850FC:
	movs r0, 0
_080850FE:
	pop {r1}
	bx r1
	thumb_func_end DoGlobalWildEncounterDiceRoll

	thumb_func_start StandardWildEncounter
StandardWildEncounter: @ 8085104
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 16
	lsrs r6, r0, 16
	mov r9, r6
	lsls r1, 16
	lsrs r7, r1, 16
	mov r8, r7
	ldr r0, _080851CC
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08085122
	b _08085282
_08085122:
	bl GetCurrentMapWildMonHeader
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080851D0
	cmp r5, r0
	bne _08085132
	b _08085282
_08085132:
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8057468
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080851D8
	ldr r1, _080851D4
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 2
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	adds r4, r2, 0
	cmp r0, 0
	bne _0808515A
	b _08085282
_0808515A:
	cmp r7, r6
	beq _0808516A
	bl DoGlobalWildEncounterDiceRoll
	lsls r0, 24
	cmp r0, 0
	bne _0808516A
	b _08085282
_0808516A:
	ldr r1, _080851D4
	adds r0, r4, r5
	lsls r0, 2
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	ldrb r0, [r0]
	movs r1, 0
	bl DoWildEncounterTest
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08085188
	b _08085282
_08085188:
	bl sub_81344CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808524A
	bl DoMassOutbreakEncounterTest
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080851AE
	movs r0, 0x1
	bl SetUpMassOutbreakEncounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808527A
_080851AE:
	ldr r1, _080851D4
	adds r0, r4, r5
	lsls r0, 2
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0x1
	bl GenerateWildMon
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808527A
	b _08085282
	.align 2, 0
_080851CC: .4byte gWildEncountersDisabled
_080851D0: .4byte 0x0000ffff
_080851D4: .4byte gWildMonHeaders
_080851D8:
	adds r0, r4, 0
	bl sub_8057494
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08085200
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08085282
	adds r0, r4, 0
	bl sub_8057434
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085282
_08085200:
	ldr r1, _08085260
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	ldr r0, [r0]
	adds r4, r2, 0
	cmp r0, 0
	beq _08085282
	cmp r8, r9
	beq _08085222
	bl DoGlobalWildEncounterDiceRoll
	lsls r0, 24
	cmp r0, 0
	beq _08085282
_08085222:
	ldr r1, _08085260
	adds r0, r4, r5
	lsls r0, 2
	adds r1, 0x8
	adds r4, r0, r1
	ldr r0, [r4]
	ldrb r0, [r0]
	movs r1, 0
	bl DoWildEncounterTest
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085282
	bl sub_81344CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085268
_0808524A:
	ldr r0, _08085264
	ldrb r0, [r0, 0xC]
	bl RepelCheck
	lsls r0, 24
	cmp r0, 0
	beq _08085282
	bl sub_8081A5C
	movs r0, 0x1
	b _08085284
	.align 2, 0
_08085260: .4byte gWildMonHeaders
_08085264: .4byte gSaveBlock1 + 0x3144
_08085268:
	ldr r0, [r4]
	movs r1, 0x1
	movs r2, 0x1
	bl GenerateWildMon
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085282
_0808527A:
	bl sub_8081A00
	movs r0, 0x1
	b _08085284
_08085282:
	movs r0, 0
_08085284:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end StandardWildEncounter

	thumb_func_start RockSmashWildEncounter
RockSmashWildEncounter: @ 8085290
	push {r4,lr}
	bl GetCurrentMapWildMonHeader
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _080852E0
	cmp r2, r0
	beq _080852EC
	ldr r1, _080852E4
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 2
	adds r1, 0xC
	adds r0, r1
	ldr r4, [r0]
	cmp r4, 0
	beq _080852D8
	ldrb r0, [r4]
	movs r1, 0x1
	bl DoWildEncounterTest
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080852EC
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0x1
	bl GenerateWildMon
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _080852EC
	bl sub_8081A00
_080852D8:
	ldr r0, _080852E8
	strh r4, [r0]
	b _080852F2
	.align 2, 0
_080852E0: .4byte 0x0000ffff
_080852E4: .4byte gWildMonHeaders
_080852E8: .4byte gScriptResult
_080852EC:
	ldr r1, _080852F8
	movs r0, 0
	strh r0, [r1]
_080852F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080852F8: .4byte gScriptResult
	thumb_func_end RockSmashWildEncounter

	thumb_func_start SweetScentWildEncounter
SweetScentWildEncounter: @ 80852FC
	push {r4,r5,lr}
	sub sp, 0x4
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	bl GetCurrentMapWildMonHeader
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _0808536C
	cmp r4, r0
	beq _080853DA
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_8057468
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085380
	ldr r1, _08085370
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 2
	adds r1, 0x4
	adds r0, r1
	ldr r4, [r0]
	cmp r4, 0
	beq _080853DA
	bl sub_81344CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080853BC
	bl DoMassOutbreakEncounterTest
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085374
	movs r0, 0
	bl SetUpMassOutbreakEncounter
	b _080853D2
	.align 2, 0
_0808536C: .4byte 0x0000ffff
_08085370: .4byte gWildMonHeaders
_08085374:
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl GenerateWildMon
	b _080853D2
_08085380:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_8057494
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080853DA
	ldr r1, _080853C4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	ldr r4, [r0]
	cmp r4, 0
	beq _080853DA
	bl sub_81344CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080853C8
_080853BC:
	bl sub_8081A5C
	movs r0, 0x1
	b _080853DC
	.align 2, 0
_080853C4: .4byte gWildMonHeaders
_080853C8:
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl GenerateWildMon
_080853D2:
	bl sub_8081A00
	movs r0, 0x1
	b _080853DC
_080853DA:
	movs r0, 0
_080853DC:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end SweetScentWildEncounter

	thumb_func_start GetFishingWildMonListHeader
GetFishingWildMonListHeader: @ 80853E4
	push {lr}
	bl GetCurrentMapWildMonHeader
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _0808540C
	cmp r2, r0
	beq _08085414
	ldr r0, _08085410
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 2
	adds r0, 0x10
	adds r1, r0
	ldr r0, [r1]
	cmp r0, 0
	beq _08085414
	movs r0, 0x1
	b _08085416
	.align 2, 0
_0808540C: .4byte 0x0000ffff
_08085410: .4byte gWildMonHeaders
_08085414:
	movs r0, 0
_08085416:
	pop {r1}
	bx r1
	thumb_func_end GetFishingWildMonListHeader

	thumb_func_start FishingWildEncounter
FishingWildEncounter: @ 808541C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl CheckFeebas
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808544C
	ldr r4, _08085448
	adds r0, r4, 0
	bl RandomInRange
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4, 0
	bl CreateWildMon
	b _0808546C
	.align 2, 0
_08085448: .4byte gWildFeebasRoute119Data
_0808544C:
	ldr r4, _08085484
	bl GetCurrentMapWildMonHeader
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r4, 0x10
	adds r1, r4
	ldr r0, [r1]
	adds r1, r5, 0
	bl GenerateFishingWildMon
	lsls r0, 16
	lsrs r4, r0, 16
_0808546C:
	movs r0, 0xC
	bl sav12_xor_increment
	adds r0, r4, 0
	bl sub_80BEA50
	bl sub_8081A00
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085484: .4byte gWildMonHeaders
	thumb_func_end FishingWildEncounter

	thumb_func_start GetLocalWildMon
GetLocalWildMon: @ 8085488
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r0, 0
	strb r0, [r6]
	bl GetCurrentMapWildMonHeader
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _080854C0
	cmp r3, r0
	beq _080854BA
	ldr r2, _080854C4
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
	adds r0, r2, 0x4
	adds r0, r1, r0
	ldr r5, [r0]
	adds r2, 0x8
	adds r1, r2
	ldr r4, [r1]
	cmp r5, 0
	bne _080854C8
	cmp r4, 0
	bne _080854CE
_080854BA:
	movs r0, 0
	b _0808550E
	.align 2, 0
_080854C0: .4byte 0x0000ffff
_080854C4: .4byte gWildMonHeaders
_080854C8:
	cmp r4, 0
	bne _080854DC
	b _08085500
_080854CE:
	movs r0, 0x1
	strb r0, [r6]
	bl PickWildMon_Water
	lsls r0, 24
	ldr r1, [r4, 0x4]
	b _08085508
_080854DC:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4F
	bls _08085500
	movs r0, 0x1
	strb r0, [r6]
	bl PickWildMon_Water
	lsls r0, 24
	ldr r1, [r4, 0x4]
	b _08085508
_08085500:
	bl PickWildMon_Grass
	lsls r0, 24
	ldr r1, [r5, 0x4]
_08085508:
	lsrs r0, 22
	adds r0, r1
	ldrh r0, [r0, 0x2]
_0808550E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetLocalWildMon

	thumb_func_start GetMirageIslandMon
GetMirageIslandMon: @ 8085514
	push {r4,lr}
	bl GetCurrentMapWildMonHeader
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08085548
	cmp r2, r0
	beq _08085550
	ldr r1, _0808554C
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	ldr r4, [r0]
	cmp r4, 0
	beq _08085550
	bl PickWildMon_Water
	lsls r0, 24
	ldr r1, [r4, 0x4]
	lsrs r0, 22
	adds r0, r1
	ldrh r0, [r0, 0x2]
	b _08085552
	.align 2, 0
_08085548: .4byte 0x0000ffff
_0808554C: .4byte gWildMonHeaders
_08085550:
	movs r0, 0
_08085552:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetMirageIslandMon

	thumb_func_start UpdateRepelCounter
UpdateRepelCounter: @ 8085558
	push {r4,r5,lr}
	ldr r5, _08085588
	adds r0, r5, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _08085590
	subs r4, r0, 0x1
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl VarSet
	cmp r4, 0
	bne _08085590
	ldr r0, _0808558C
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _08085592
	.align 2, 0
_08085588: .4byte 0x00004021
_0808558C: .4byte Event_RepelWoreOff
_08085590:
	movs r0, 0
_08085592:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end UpdateRepelCounter

	thumb_func_start RepelCheck
RepelCheck: @ 8085598
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080855E4
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	beq _080855DE
	movs r5, 0
_080855AC:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080855E8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080855EC
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _080855EC
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bcc _080855F6
_080855DE:
	movs r0, 0x1
	b _080855F8
	.align 2, 0
_080855E4: .4byte 0x00004021
_080855E8: .4byte gPlayerParty
_080855EC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080855AC
_080855F6:
	movs r0, 0
_080855F8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end RepelCheck

	thumb_func_start ApplyFluteEncounterRateMod
ApplyFluteEncounterRateMod: @ 8085600
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0808561C
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085620
	ldr r0, [r4]
	lsrs r1, r0, 1
	adds r0, r1
	b _08085632
	.align 2, 0
_0808561C: .4byte 0x0000084d
_08085620:
	ldr r0, _0808563C
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085634
	ldr r0, [r4]
	lsrs r0, 1
_08085632:
	str r0, [r4]
_08085634:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808563C: .4byte 0x0000084e
	thumb_func_end ApplyFluteEncounterRateMod

	thumb_func_start ApplyCleanseTagEncounterRateMod
ApplyCleanseTagEncounterRateMod: @ 8085640
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08085664
	movs r1, 0xC
	bl GetMonData
	cmp r0, 0xBE
	bne _0808565C
	ldr r0, [r4]
	lsls r0, 1
	movs r1, 0x3
	bl __udivsi3
	str r0, [r4]
_0808565C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085664: .4byte gPlayerParty
	thumb_func_end ApplyCleanseTagEncounterRateMod

	.align 2, 0 @ Don't pad with nop.
