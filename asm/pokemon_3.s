	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start MonGainEVs
MonGainEVs: @ 803FE70
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	mov r8, r0
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
	movs r7, 0
	movs r6, 0
_0803FE84:
	adds r1, r6, 0
	adds r1, 0x1A
	mov r0, r8
	movs r2, 0
	bl GetMonData
	mov r2, sp
	adds r1, r2, r6
	strb r0, [r1]
	ldrb r0, [r1]
	adds r0, r7, r0
	lsls r0, 16
	lsrs r7, r0, 16
	adds r6, 0x1
	cmp r6, 0x5
	ble _0803FE84
	movs r6, 0
	b _08040006
_0803FEA8:
	mov r0, r8
	movs r1, 0
	bl CheckPartyHasHadPokerus
	lsls r0, 24
	movs r2, 0x1
	cmp r0, 0
	beq _0803FEBA
	movs r2, 0x2
_0803FEBA:
	cmp r6, 0x5
	bhi _0803FF5C
	lsls r0, r6, 2
	ldr r1, _0803FEC8 @ =_0803FECC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803FEC8: .4byte _0803FECC
	.align 2, 0
_0803FECC:
	.4byte _0803FEE4
	.4byte _0803FEF8
	.4byte _0803FF0C
	.4byte _0803FF20
	.4byte _0803FF34
	.4byte _0803FF48
_0803FEE4:
	ldr r0, _0803FEF4 @ =gBaseStats
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 30
	b _0803FF56
	.align 2, 0
_0803FEF4: .4byte gBaseStats
_0803FEF8:
	ldr r0, _0803FF08 @ =gBaseStats
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	b _0803FF54
	.align 2, 0
_0803FF08: .4byte gBaseStats
_0803FF0C:
	ldr r0, _0803FF1C @ =gBaseStats
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsls r0, 26
	b _0803FF56
	.align 2, 0
_0803FF1C: .4byte gBaseStats
_0803FF20:
	ldr r0, _0803FF30 @ =gBaseStats
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xA]
	lsrs r0, 6
	b _0803FF58
	.align 2, 0
_0803FF30: .4byte gBaseStats
_0803FF34:
	ldr r0, _0803FF44 @ =gBaseStats
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xB]
	lsls r0, 30
	b _0803FF56
	.align 2, 0
_0803FF44: .4byte gBaseStats
_0803FF48:
	ldr r0, _0803FF84 @ =gBaseStats
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0xB]
_0803FF54:
	lsls r0, 28
_0803FF56:
	lsrs r0, 30
_0803FF58:
	adds r4, r0, 0
	muls r4, r2
_0803FF5C:
	mov r0, r8
	movs r1, 0xC
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0803FFA8
	ldr r0, _0803FF88 @ =gMain
	ldr r1, _0803FF8C @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0803FF94
	ldr r0, _0803FF90 @ =gEnigmaBerries
	ldrb r0, [r0, 0x7]
	b _0803FFB0
	.align 2, 0
_0803FF84: .4byte gBaseStats
_0803FF88: .4byte gMain
_0803FF8C: .4byte 0x0000043d
_0803FF90: .4byte gEnigmaBerries
_0803FF94:
	ldr r0, _0803FFA0 @ =gSaveBlock1
	ldr r2, _0803FFA4 @ =0x00003688
	adds r0, r2
	ldrb r0, [r0]
	b _0803FFB0
	.align 2, 0
_0803FFA0: .4byte gSaveBlock1
_0803FFA4: .4byte 0x00003688
_0803FFA8:
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r0, 24
_0803FFB0:
	cmp r0, 0x18
	bne _0803FFB8
	lsls r0, r4, 17
	lsrs r4, r0, 16
_0803FFB8:
	lsls r0, r4, 16
	asrs r2, r0, 16
	adds r1, r7, r2
	movs r0, 0xFF
	lsls r0, 1
	cmp r1, r0
	ble _0803FFD0
	adds r0, r2, r0
	adds r1, r7, r4
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
_0803FFD0:
	mov r0, sp
	adds r2, r0, r6
	ldrb r3, [r2]
	lsls r0, r4, 16
	asrs r1, r0, 16
	adds r0, r3, r1
	cmp r0, 0xFF
	ble _0803FFEC
	adds r0, r1, 0
	adds r0, 0xFF
	adds r1, r3, r4
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
_0803FFEC:
	adds r0, r3, r4
	strb r0, [r2]
	adds r0, r7, r4
	lsls r0, 16
	lsrs r7, r0, 16
	adds r1, r6, 0
	adds r1, 0x1A
	mov r0, r8
	bl SetMonData
	adds r6, 0x1
	cmp r6, 0x5
	bgt _0804000E
_08040006:
	ldr r0, _0804001C @ =0x000001fd
	cmp r7, r0
	bhi _0804000E
	b _0803FEA8
_0804000E:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804001C: .4byte 0x000001fd
	thumb_func_end MonGainEVs

	thumb_func_start GetMonEVCount
GetMonEVCount: @ 8040020
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r5, 0
	movs r4, 0
_08040028:
	adds r1, r4, 0
	adds r1, 0x1A
	adds r0, r6, 0
	movs r2, 0
	bl GetMonData
	adds r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, 0x1
	cmp r4, 0x5
	ble _08040028
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetMonEVCount

	thumb_func_start RandomlyGivePartyPokerus
RandomlyGivePartyPokerus: @ 8040048
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	bl Random
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0x80
	lsls r0, 7
	cmp r5, r0
	beq _0804006E
	movs r0, 0x80
	lsls r0, 8
	cmp r5, r0
	beq _0804006E
	movs r0, 0xC0
	lsls r0, 8
	cmp r5, r0
	bne _08040104
_0804006E:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0x64
	muls r0, r5
	adds r4, r6, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _0804006E
	adds r0, r4, 0
	movs r1, 0x2D
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	bne _0804006E
	ldr r1, _0804010C @ =gBitTable
	lsls r0, r5, 2
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r6, 0
	bl CheckPartyHasHadPokerus
	lsls r0, 24
	cmp r0, 0
	bne _08040104
	mov r4, sp
_080400B8:
	bl Random
	lsls r0, 24
	lsrs r0, 24
	strb r0, [r4]
	cmp r0, 0
	beq _080400B8
	movs r0, 0xF0
	mov r1, sp
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, 0
	beq _080400DA
	movs r0, 0x7
	ands r1, r0
	mov r0, sp
	strb r1, [r0]
_080400DA:
	mov r0, sp
	ldrb r0, [r0]
	lsls r1, r0, 4
	orrs r0, r1
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	movs r1, 0xF3
	ands r1, r0
	mov r0, sp
	strb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	movs r0, 0x64
	muls r0, r5
	adds r0, r6, r0
	movs r1, 0x22
	mov r2, sp
	bl SetMonData
_08040104:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804010C: .4byte gBitTable
	thumb_func_end RandomlyGivePartyPokerus

	thumb_func_start CheckPartyPokerus
CheckPartyPokerus: @ 8040110
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	movs r3, 0
	movs r6, 0x1
	movs r5, 0
	cmp r4, 0
	beq _08040158
_08040124:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0804014C
	movs r0, 0x64
	muls r0, r3
	adds r0, r7, r0
	movs r1, 0x22
	movs r2, 0
	str r3, [sp]
	bl GetMonData
	movs r1, 0xF
	ands r1, r0
	ldr r3, [sp]
	cmp r1, 0
	beq _0804014C
	orrs r5, r6
	lsls r0, r5, 24
	lsrs r5, r0, 24
_0804014C:
	adds r3, 0x1
	lsls r6, 1
	lsrs r4, 1
	cmp r4, 0
	bne _08040124
	b _0804016C
_08040158:
	adds r0, r7, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	movs r1, 0xF
	ands r1, r0
	cmp r1, 0
	beq _0804016C
	movs r5, 0x1
_0804016C:
	adds r0, r5, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckPartyPokerus

	thumb_func_start CheckPartyHasHadPokerus
CheckPartyHasHadPokerus: @ 8040178
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	movs r3, 0
	movs r6, 0x1
	movs r5, 0
	cmp r4, 0
	beq _080401BC
_0804018C:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080401B0
	movs r0, 0x64
	muls r0, r3
	adds r0, r7, r0
	movs r1, 0x22
	movs r2, 0
	str r3, [sp]
	bl GetMonData
	ldr r3, [sp]
	cmp r0, 0
	beq _080401B0
	orrs r5, r6
	lsls r0, r5, 24
	lsrs r5, r0, 24
_080401B0:
	adds r3, 0x1
	lsls r6, 1
	lsrs r4, 1
	cmp r4, 0
	bne _0804018C
	b _080401CC
_080401BC:
	adds r0, r7, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _080401CC
	movs r5, 0x1
_080401CC:
	adds r0, r5, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckPartyHasHadPokerus

	thumb_func_start UpdatePartyPokerusTime
UpdatePartyPokerusTime: @ 80401D8
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r7, r0, 16
	movs r5, 0
	mov r6, sp
_080401E4:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08040224 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _0804023C
	adds r0, r4, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	strb r0, [r6]
	movs r1, 0xF
	adds r2, r0, 0
	ands r1, r2
	cmp r1, 0
	beq _0804023C
	cmp r1, r7
	bcc _0804021E
	cmp r7, 0x4
	bls _08040228
_0804021E:
	movs r0, 0xF0
	ands r0, r2
	b _0804022A
	.align 2, 0
_08040224: .4byte gPlayerParty
_08040228:
	subs r0, r2, r7
_0804022A:
	strb r0, [r6]
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0804024C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x22
	mov r2, sp
	bl SetMonData
_0804023C:
	adds r5, 0x1
	cmp r5, 0x5
	ble _080401E4
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804024C: .4byte gPlayerParty
	thumb_func_end UpdatePartyPokerusTime

	thumb_func_start PartySpreadPokerus
PartySpreadPokerus: @ 8040250
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _080402F6
	movs r5, 0
_0804026C:
	movs r0, 0x64
	adds r6, r5, 0
	muls r6, r0
	adds r4, r7, r6
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _080402F0
	adds r0, r4, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r1, r0, 24
	mov r0, sp
	strb r1, [r0]
	cmp r1, 0
	beq _080402F0
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	beq _080402F0
	cmp r5, 0
	beq _080402C6
	adds r0, r6, 0
	subs r0, 0x64
	adds r4, r7, r0
	adds r0, r4, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0
	bne _080402C6
	adds r0, r4, 0
	movs r1, 0x22
	mov r2, sp
	bl SetMonData
_080402C6:
	cmp r5, 0x5
	beq _080402F0
	movs r0, 0x64
	muls r0, r5
	adds r0, 0x64
	adds r4, r7, r0
	adds r0, r4, 0
	movs r1, 0x22
	movs r2, 0
	bl GetMonData
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0
	bne _080402F0
	adds r0, r4, 0
	movs r1, 0x22
	mov r2, sp
	bl SetMonData
	adds r5, 0x1
_080402F0:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0804026C
_080402F6:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end PartySpreadPokerus

	thumb_func_start TryIncrementMonLevel
TryIncrementMonLevel: @ 8040300
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	adds r0, 0x1
	mov r1, sp
	strb r0, [r1]
	adds r0, r6, 0
	movs r1, 0x19
	movs r2, 0
	bl GetMonData
	ldr r5, _08040358 @ =gExperienceTables
	mov r1, sp
	ldrb r2, [r1]
	lsls r2, 2
	ldr r3, _0804035C @ =gBaseStats
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	adds r1, r3
	ldrb r3, [r1, 0x13]
	movs r1, 0xCA
	lsls r1, 1
	muls r1, r3
	adds r2, r1
	adds r2, r5
	ldr r1, [r2]
	cmp r0, r1
	bhi _08040360
	movs r0, 0
	b _0804036C
	.align 2, 0
_08040358: .4byte gExperienceTables
_0804035C: .4byte gBaseStats
_08040360:
	adds r0, r6, 0
	movs r1, 0x38
	mov r2, sp
	bl SetMonData
	movs r0, 0x1
_0804036C:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end TryIncrementMonLevel

	thumb_func_start CanMonLearnTMHM
CanMonLearnTMHM: @ 8040374
	push {r4,r5,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	adds r5, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	adds r3, r1, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bne _08040396
	movs r0, 0
	b _080403C2
_08040396:
	cmp r4, 0x1F
	bls _080403B4
	adds r0, r4, 0
	subs r0, 0x20
	movs r2, 0x1
	lsls r2, r0
	ldr r0, _080403B0 @ =gTMHMLearnsets
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	ands r0, r2
	b _080403C2
	.align 2, 0
_080403B0: .4byte gTMHMLearnsets
_080403B4:
	movs r1, 0x1
	lsls r1, r5
	ldr r2, _080403C8 @ =gTMHMLearnsets
	lsls r0, r3, 3
	adds r0, r2
	ldr r0, [r0]
	ands r0, r1
_080403C2:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080403C8: .4byte gTMHMLearnsets
	thumb_func_end CanMonLearnTMHM

	thumb_func_start sub_80403CC
sub_80403CC: @ 80403CC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	adds r6, r0, 0
	str r1, [sp, 0x8]
	movs r0, 0
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r6, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	movs r5, 0
	mov r4, sp
_08040402:
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r6, 0
	movs r2, 0
	bl GetMonData
	strh r0, [r4]
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _08040402
	movs r5, 0
	ldr r6, _08040510 @ =gLevelUpLearnsets
	lsls r1, r7, 2
	adds r2, r1, r6
	ldr r3, [r2]
	ldrh r0, [r3]
	ldr r4, _08040514 @ =0x0000ffff
	str r1, [sp, 0x14]
	cmp r0, r4
	beq _080404FC
	mov r9, r2
	str r3, [sp, 0x10]
_08040430:
	lsls r2, r5, 1
	ldr r1, [sp, 0x10]
	adds r0, r2, r1
	ldrh r3, [r0]
	movs r0, 0xFE
	lsls r0, 8
	ands r0, r3
	ldr r4, [sp, 0xC]
	lsls r1, r4, 9
	adds r7, r2, 0
	adds r5, 0x1
	mov r12, r5
	cmp r0, r1
	bgt _080404E6
	movs r4, 0
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _08040518 @ =0x000001ff
	ands r0, r3
	cmp r1, r0
	beq _08040480
	ldr r0, [sp, 0x14]
	ldr r1, _08040510 @ =gLevelUpLearnsets
	adds r6, r0, r1
	ldr r2, _08040518 @ =0x000001ff
	mov r8, r2
	mov r3, sp
	adds r5, r7, 0
_08040468:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	bgt _08040480
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _08040468
_08040480:
	cmp r4, 0x4
	bne _080404E6
	movs r4, 0
	cmp r4, r10
	bge _080404C4
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, [sp, 0x8]
	ldrh r2, [r0]
	ldr r0, _08040518 @ =0x000001ff
	ands r0, r1
	cmp r2, r0
	beq _080404C4
	ldr r1, [sp, 0x14]
	ldr r2, _08040510 @ =gLevelUpLearnsets
	adds r6, r1, r2
	ldr r0, _08040518 @ =0x000001ff
	mov r8, r0
	ldr r3, [sp, 0x8]
	adds r5, r7, 0
_080404AC:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, r10
	bge _080404C4
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _080404AC
_080404C4:
	cmp r4, r10
	bne _080404E6
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r2, r4, 1
	ldr r1, [sp, 0x8]
	adds r2, r1
	mov r4, r9
	ldr r0, [r4]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, _08040518 @ =0x000001ff
	ands r0, r1
	strh r0, [r2]
_080404E6:
	mov r5, r12
	cmp r5, 0x13
	bgt _080404FC
	mov r1, r9
	ldr r0, [r1]
	lsls r1, r5, 1
	adds r1, r0
	ldrh r0, [r1]
	ldr r2, _08040514 @ =0x0000ffff
	cmp r0, r2
	bne _08040430
_080404FC:
	mov r0, r10
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08040510: .4byte gLevelUpLearnsets
_08040514: .4byte 0x0000ffff
_08040518: .4byte 0x000001ff
	thumb_func_end sub_80403CC

	thumb_func_start sub_804051C
sub_804051C: @ 804051C
	push {r4-r7,lr}
	adds r6, r1, 0
	lsls r0, 16
	movs r5, 0
	movs r4, 0
	ldr r1, _08040568 @ =gLevelUpLearnsets
	lsrs r0, 14
	adds r0, r1
	ldr r2, [r0]
	ldrh r0, [r2]
	ldr r1, _0804056C @ =0x0000ffff
	cmp r0, r1
	beq _08040560
	ldr r0, _08040570 @ =0x000001ff
	mov r12, r0
	adds r7, r1, 0
	adds r3, r2, 0
_0804053E:
	adds r1, r5, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 1
	adds r1, r6
	ldrh r2, [r3]
	mov r0, r12
	ands r0, r2
	strh r0, [r1]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x13
	bgt _08040560
	ldrh r0, [r3]
	cmp r0, r7
	bne _0804053E
_08040560:
	adds r0, r5, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08040568: .4byte gLevelUpLearnsets
_0804056C: .4byte 0x0000ffff
_08040570: .4byte 0x000001ff
	thumb_func_end sub_804051C

	thumb_func_start sub_8040574
sub_8040574: @ 8040574
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x3C
	adds r6, r0, 0
	movs r0, 0
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r6, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x30]
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bne _080405B0
	movs r0, 0
	b _080406BA
_080405B0:
	movs r5, 0
	lsls r4, 2
	str r4, [sp, 0x38]
	mov r4, sp
_080405B8:
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r6, 0
	movs r2, 0
	bl GetMonData
	strh r0, [r4]
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _080405B8
	movs r5, 0
	ldr r3, _080406CC @ =gLevelUpLearnsets
	ldr r2, [sp, 0x38]
	adds r1, r2, r3
	ldr r0, [r1]
	ldrh r0, [r0]
	ldr r2, _080406D0 @ =0x0000ffff
	cmp r0, r2
	beq _080406B8
	mov r9, r1
	mov r4, sp
	adds r4, 0x8
	str r4, [sp, 0x34]
_080405E8:
	mov r1, r9
	ldr r0, [r1]
	lsls r2, r5, 1
	adds r0, r2, r0
	ldrh r3, [r0]
	movs r0, 0xFE
	lsls r0, 8
	ands r0, r3
	ldr r4, [sp, 0x30]
	lsls r1, r4, 9
	adds r7, r2, 0
	adds r5, 0x1
	mov r12, r5
	cmp r0, r1
	bgt _080406A2
	movs r4, 0
	mov r0, sp
	ldrh r1, [r0]
	ldr r0, _080406D4 @ =0x000001ff
	ands r0, r3
	cmp r1, r0
	beq _0804063A
	ldr r0, [sp, 0x38]
	ldr r1, _080406CC @ =gLevelUpLearnsets
	adds r6, r0, r1
	ldr r2, _080406D4 @ =0x000001ff
	mov r8, r2
	mov r3, sp
	adds r5, r7, 0
_08040622:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	bgt _0804063A
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _08040622
_0804063A:
	cmp r4, 0x4
	bne _080406A2
	movs r4, 0
	cmp r4, r10
	bge _08040680
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, [sp, 0x34]
	ldrh r2, [r0]
	ldr r0, _080406D4 @ =0x000001ff
	ands r0, r1
	add r1, sp, 0x8
	cmp r2, r0
	beq _08040680
	ldr r2, [sp, 0x38]
	ldr r0, _080406CC @ =gLevelUpLearnsets
	adds r6, r2, r0
	ldr r2, _080406D4 @ =0x000001ff
	mov r8, r2
	adds r3, r1, 0
	adds r5, r7, 0
_08040668:
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, r10
	bge _08040680
	ldr r0, [r6]
	adds r0, r5, r0
	ldrh r1, [r0]
	ldrh r2, [r3]
	mov r0, r8
	ands r0, r1
	cmp r2, r0
	bne _08040668
_08040680:
	cmp r4, r10
	bne _080406A2
	mov r0, r10
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r2, r4, 1
	ldr r4, [sp, 0x34]
	adds r2, r4, r2
	mov r1, r9
	ldr r0, [r1]
	adds r0, r7, r0
	ldrh r1, [r0]
	ldr r0, _080406D4 @ =0x000001ff
	ands r0, r1
	strh r0, [r2]
_080406A2:
	mov r5, r12
	cmp r5, 0x13
	bgt _080406B8
	mov r2, r9
	ldr r0, [r2]
	lsls r1, r5, 1
	adds r1, r0
	ldrh r0, [r1]
	ldr r4, _080406D0 @ =0x0000ffff
	cmp r0, r4
	bne _080405E8
_080406B8:
	mov r0, r10
_080406BA:
	add sp, 0x3C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080406CC: .4byte gLevelUpLearnsets
_080406D0: .4byte 0x0000ffff
_080406D4: .4byte 0x000001ff
	thumb_func_end sub_8040574

	thumb_func_start SpeciesToPokedexNum
SpeciesToPokedexNum: @ 80406D8
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl IsNationalPokedexEnabled
	cmp r0, 0
	beq _080406F2
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	b _0804070A
_080406F2:
	adds r0, r4, 0
	bl SpeciesToHoennPokedexNum
	adds r4, r0, 0
	cmp r4, 0xCA
	bls _08040708
	ldr r0, _08040704 @ =0x0000ffff
	b _0804070A
	.align 2, 0
_08040704: .4byte 0x0000ffff
_08040708:
	adds r0, r4, 0
_0804070A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end SpeciesToPokedexNum

	thumb_func_start sub_8040710
sub_8040710: @ 8040710
	push {lr}
	ldr r1, _08040724 @ =gUnknown_02024E84
	movs r2, 0
	adds r0, r1, 0x3
_08040718:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08040718
	pop {r0}
	bx r0
	.align 2, 0
_08040724: .4byte gUnknown_02024E84
	thumb_func_end sub_8040710

	thumb_func_start sub_8040728
sub_8040728: @ 8040728
	push {lr}
	ldr r0, _0804073C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	beq _08040744
	ldr r0, _08040740 @ =0x000001cf
	b _080408B2
	.align 2, 0
_0804073C: .4byte gBattleTypeFlags
_08040740: .4byte 0x000001cf
_08040744:
	movs r0, 0x80
	lsls r0, 7
	ands r0, r1
	cmp r0, 0
	beq _08040754
	movs r0, 0xE7
	lsls r0, 1
	b _080408B2
_08040754:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0804075E
	b _080408A8
_0804075E:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08040768
	b _080408B0
_08040768:
	ldr r3, _0804078C @ =gTrainers
	ldr r2, _08040790 @ =gTrainerBattleOpponent
	ldrh r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	ldrb r0, [r0, 0x1]
	subs r0, 0x2
	cmp r0, 0x31
	bls _08040780
	b _080408A8
_08040780:
	lsls r0, 2
	ldr r1, _08040794 @ =_08040798
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804078C: .4byte gTrainers
_08040790: .4byte gTrainerBattleOpponent
_08040794: .4byte _08040798
	.align 2, 0
_08040798:
	.4byte _08040860
	.4byte _08040866
	.4byte _08040866
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A0
	.4byte _0804086C
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _08040872
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _080408A8
	.4byte _0804087C
	.4byte _080408A8
	.4byte _080408A8
	.4byte _08040860
	.4byte _08040866
	.4byte _08040866
_08040860:
	movs r0, 0xE9
	lsls r0, 1
	b _080408B2
_08040866:
	movs r0, 0xE5
	lsls r0, 1
	b _080408B2
_0804086C:
	movs r0, 0xE6
	lsls r0, 1
	b _080408B2
_08040872:
	ldr r0, _08040878 @ =0x000001cd
	b _080408B2
	.align 2, 0
_08040878: .4byte 0x000001cd
_0804087C:
	ldrh r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08040898 @ =gTrainers + 0x4
	adds r0, r1
	ldr r1, _0804089C @ =gUnknown_08400E42
	bl StringCompare
	cmp r0, 0
	beq _080408A8
	movs r0, 0xE8
	lsls r0, 1
	b _080408B2
	.align 2, 0
_08040898: .4byte gTrainers + 0x4
_0804089C: .4byte gUnknown_08400E42
_080408A0:
	ldr r0, _080408A4 @ =0x000001d1
	b _080408B2
	.align 2, 0
_080408A4: .4byte 0x000001d1
_080408A8:
	ldr r0, _080408AC @ =0x000001cb
	b _080408B2
	.align 2, 0
_080408AC: .4byte 0x000001cb
_080408B0:
	ldr r0, _080408B8 @ =0x000001c9
_080408B2:
	pop {r1}
	bx r1
	.align 2, 0
_080408B8: .4byte 0x000001c9
	thumb_func_end sub_8040728

	thumb_func_start sub_80408BC
sub_80408BC: @ 80408BC
	push {lr}
	bl ResetMapMusic
	bl m4aMPlayAllStop
	bl sub_8040728
	lsls r0, 16
	lsrs r0, 16
	bl PlayBGM
	pop {r0}
	bx r0
	thumb_func_end sub_80408BC

	thumb_func_start current_map_music_set__default_for_battle
current_map_music_set__default_for_battle: @ 80408D8
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl ResetMapMusic
	bl m4aMPlayAllStop
	cmp r4, 0
	beq _080408F2
	adds r0, r4, 0
	bl PlayNewMapMusic
	b _080408FE
_080408F2:
	bl sub_8040728
	lsls r0, 16
	lsrs r0, 16
	bl PlayNewMapMusic
_080408FE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end current_map_music_set__default_for_battle

	thumb_func_start pokemon_get_pal
pokemon_get_pal: @ 8040904
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r2, r0, 0
	adds r0, r4, 0
	adds r1, r6, 0
	bl species_and_otid_get_pal
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end pokemon_get_pal

	thumb_func_start species_and_otid_get_pal
species_and_otid_get_pal: @ 804093C
	push {r4,r5,lr}
	adds r3, r2, 0
	lsls r0, 16
	lsrs r4, r0, 16
	adds r5, r4, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _08040958
	ldr r0, _08040954 @ =gMonPaletteTable
	ldr r0, [r0]
	b _08040984
	.align 2, 0
_08040954: .4byte gMonPaletteTable
_08040958:
	lsrs r0, r1, 16
	ldr r2, _08040974 @ =0x0000ffff
	ands r1, r2
	eors r0, r1
	lsrs r1, r3, 16
	eors r0, r1
	ands r3, r2
	eors r0, r3
	cmp r0, 0x7
	bls _0804097C
	ldr r0, _08040978 @ =gMonPaletteTable
	lsls r1, r4, 3
	b _08040980
	.align 2, 0
_08040974: .4byte 0x0000ffff
_08040978: .4byte gMonPaletteTable
_0804097C:
	ldr r0, _0804098C @ =gMonShinyPaletteTable
	lsls r1, r5, 3
_08040980:
	adds r1, r0
	ldr r0, [r1]
_08040984:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804098C: .4byte gMonShinyPaletteTable
	thumb_func_end species_and_otid_get_pal

	thumb_func_start sub_8040990
sub_8040990: @ 8040990
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r2, r0, 0
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_80409C8
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8040990

	thumb_func_start sub_80409C8
sub_80409C8: @ 80409C8
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsrs r0, r1, 16
	ldr r3, _080409E8 @ =0x0000ffff
	ands r1, r3
	eors r0, r1
	lsrs r1, r2, 16
	eors r0, r1
	ands r2, r3
	eors r0, r2
	cmp r0, 0x7
	bls _080409F0
	lsls r0, r4, 3
	ldr r1, _080409EC @ =gMonPaletteTable
	b _080409F4
	.align 2, 0
_080409E8: .4byte 0x0000ffff
_080409EC: .4byte gMonPaletteTable
_080409F0:
	lsls r0, r4, 3
	ldr r1, _080409FC @ =gMonShinyPaletteTable
_080409F4:
	adds r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080409FC: .4byte gMonShinyPaletteTable
	thumb_func_end sub_80409C8

	thumb_func_start sub_8040A00
sub_8040A00: @ 8040A00
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r2, _08040A24 @ =gUnknown_0820831A
	ldrh r0, [r2]
	ldr r1, _08040A28 @ =0x0000ffff
	cmp r0, r1
	beq _08040A32
	adds r4, r1, 0
	adds r1, r2, 0
_08040A14:
	ldrh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	cmp r0, r3
	bne _08040A2C
	movs r0, 0x1
	b _08040A34
	.align 2, 0
_08040A24: .4byte gUnknown_0820831A
_08040A28: .4byte 0x0000ffff
_08040A2C:
	ldrh r0, [r1]
	cmp r0, r4
	bne _08040A14
_08040A32:
	movs r0, 0
_08040A34:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8040A00

	thumb_func_start sub_8040A3C
sub_8040A3C: @ 8040A3C
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08040A50 @ =gBaseStats
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x19]
	lsrs r0, 7
	bx lr
	.align 2, 0
_08040A50: .4byte gBaseStats
	thumb_func_end sub_8040A3C

	thumb_func_start sub_8040A54
sub_8040A54: @ 8040A54
	push {r4,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08040A78 @ =gUnknown_083F7E28
	lsls r1, r0, 2
	adds r1, r0
	adds r1, r4
	adds r1, r2
	movs r0, 0
	ldrsb r0, [r1, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040A78: .4byte gUnknown_083F7E28
	thumb_func_end sub_8040A54

	thumb_func_start sub_8040A7C
sub_8040A7C: @ 8040A7C
	push {r4,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	bl GetNatureFromPersonality
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08040AA0 @ =gUnknown_083F7E28
	lsls r1, r0, 2
	adds r1, r0
	adds r1, r4
	adds r1, r2
	movs r0, 0
	ldrsb r0, [r1, r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040AA0: .4byte gUnknown_083F7E28
	thumb_func_end sub_8040A7C

	thumb_func_start sub_8040AA4
sub_8040AA4: @ 8040AA4
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	movs r1, 0x7
	mov r2, sp
	bl GetMonData
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	mov r1, sp
	bl sub_8040AD0
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8040AA4

	thumb_func_start sub_8040AD0
sub_8040AD0: @ 8040AD0
	push {r4,r5,lr}
	adds r5, r1, 0
	ldr r3, _08040B10 @ =gSaveBlock2
	ldrb r2, [r3, 0xA]
	ldrb r1, [r3, 0xB]
	lsls r1, 8
	orrs r2, r1
	ldrb r1, [r3, 0xC]
	lsls r1, 16
	orrs r2, r1
	ldrb r1, [r3, 0xD]
	lsls r1, 24
	orrs r2, r1
	cmp r0, r2
	bne _08040B14
	movs r4, 0
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _08040B0C
	adds r2, r5, 0
_08040AF8:
	adds r1, r4, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08040B14
	adds r2, 0x1
	adds r4, 0x1
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _08040AF8
_08040B0C:
	movs r0, 0
	b _08040B16
	.align 2, 0
_08040B10: .4byte gSaveBlock2
_08040B14:
	movs r0, 0x1
_08040B16:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8040AD0

	thumb_func_start sub_8040B1C
sub_8040B1C: @ 8040B1C
	push {lr}
	bl pokemon_restore_pp
	pop {r0}
	bx r0
	thumb_func_end sub_8040B1C

	thumb_func_start pokemon_restore_pp
pokemon_restore_pp: @ 8040B28
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r6, 0
_08040B30:
	adds r4, r6, 0
	adds r4, 0xD
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetBoxMonData
	cmp r0, 0
	beq _08040B7C
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetBoxMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x15
	movs r2, 0
	bl GetBoxMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r6, 24
	lsrs r2, 24
	adds r0, r4, 0
	bl CalculatePPWithBonus
	mov r1, sp
	strb r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r5, 0
	mov r2, sp
	bl SetBoxMonData
_08040B7C:
	adds r6, 0x1
	cmp r6, 0x3
	ble _08040B30
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end pokemon_restore_pp

	thumb_func_start sub_8040B8C
sub_8040B8C: @ 8040B8C
	push {r4,r5,lr}
	ldr r1, _08040BCC @ =byte_2024C06
	ldr r2, _08040BD0 @ =0x02000000
	ldr r3, _08040BD4 @ =0x000160c0
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r5, _08040BD8 @ =gUnknown_030041C0
	movs r0, 0xFD
	strb r0, [r5]
	movs r0, 0x4
	strb r0, [r5, 0x1]
	ldr r0, _08040BDC @ =0x00016054
	adds r4, r2, r0
	ldrb r0, [r4]
	strb r0, [r5, 0x2]
	movs r0, 0xFF
	strb r0, [r5, 0x4]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08040BE4
	ldr r1, _08040BE0 @ =gUnknown_02024A6A
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	bl pokemon_order_func
	b _08040BEE
	.align 2, 0
_08040BCC: .4byte byte_2024C06
_08040BD0: .4byte 0x02000000
_08040BD4: .4byte 0x000160c0
_08040BD8: .4byte gUnknown_030041C0
_08040BDC: .4byte 0x00016054
_08040BE0: .4byte gUnknown_02024A6A
_08040BE4:
	ldr r0, _08040C24 @ =gUnknown_02024A6A
	ldrb r1, [r4]
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
_08040BEE:
	strb r0, [r5, 0x3]
	ldr r4, _08040C28 @ =gUnknown_03004290
	movs r0, 0xFD
	strb r0, [r4]
	movs r0, 0x4
	strb r0, [r4, 0x1]
	ldr r1, _08040C2C @ =gUnknown_02024E6C
	ldrb r0, [r1]
	strb r0, [r4, 0x2]
	ldr r2, _08040C24 @ =gUnknown_02024A6A
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r2
	ldrb r0, [r0]
	bl pokemon_order_func
	strb r0, [r4, 0x3]
	movs r0, 0xFF
	strb r0, [r4, 0x4]
	ldr r0, _08040C30 @ =gUnknown_083FFCCA
	ldr r1, _08040C34 @ =gStringVar4
	bl sub_8120FFC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08040C24: .4byte gUnknown_02024A6A
_08040C28: .4byte gUnknown_03004290
_08040C2C: .4byte gUnknown_02024E6C
_08040C30: .4byte gUnknown_083FFCCA
_08040C34: .4byte gStringVar4
	thumb_func_end sub_8040B8C

	thumb_func_start sub_8040C38
sub_8040C38: @ 8040C38
	push {r4,r5,lr}
	ldr r0, _08040C90 @ =gBattleTypeFlags
	ldrh r1, [r0]
	ldr r0, _08040C94 @ =0x00002008
	ands r0, r1
	cmp r0, 0
	bne _08040CAC
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r4, _08040C98 @ =gEnemyParty
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08040C9C @ =gBaseStats
	lsls r1, r0, 3
	subs r1, r0
	lsls r3, r1, 2
	adds r1, r3, r2
	ldrh r0, [r1, 0xC]
	ldrh r1, [r1, 0xE]
	cmp r0, r1
	beq _08040C82
	cmp r5, 0x2C
	bls _08040CAC
	cmp r5, 0x5E
	bhi _08040CA0
_08040C82:
	adds r2, 0xC
	adds r2, r3, r2
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	b _08040CAC
	.align 2, 0
_08040C90: .4byte gBattleTypeFlags
_08040C94: .4byte 0x00002008
_08040C98: .4byte gEnemyParty
_08040C9C: .4byte gBaseStats
_08040CA0:
	adds r2, 0xE
	adds r2, r3, r2
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
_08040CAC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8040C38

	thumb_func_start sub_8040CB4
sub_8040CB4: @ 8040CB4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	adds r1, r0, 0
	adds r0, r5, 0
	bl sub_8040CE0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8040CB4

	thumb_func_start sub_8040CE0
sub_8040CE0: @ 8040CE0
	push {r4,lr}
	movs r4, 0
	lsrs r2, r0, 16
	ldr r3, _08040D04 @ =0x0000ffff
	ands r0, r3
	eors r2, r0
	lsrs r0, r1, 16
	eors r2, r0
	ands r1, r3
	eors r2, r1
	cmp r2, 0x7
	bhi _08040CFA
	movs r4, 0x1
_08040CFA:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040D04: .4byte 0x0000ffff
	thumb_func_end sub_8040CE0

	thumb_func_start sub_8040D08
sub_8040D08: @ 8040D08
	push {r4,lr}
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08040D38 @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x18]
	movs r0, 0x2
	eors r0, r1
	bl sub_803FC34
	adds r1, r0, 0
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r4, 0x8
	adds r0, r4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040D38: .4byte gLinkPlayers
	thumb_func_end sub_8040D08

	thumb_func_start sub_8040D3C
sub_8040D3C: @ 8040D3C
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r1, r0, 16
	adds r0, r1, 0
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0
	cmp r1, 0x20
	beq _08040D54
	cmp r1, 0x1D
	bne _08040D7E
_08040D54:
	cmp r2, 0x2
	bne _08040D68
	movs r0, 0xB
	muls r1, r0
	ldr r0, _08040D64 @ =gSpeciesNames
	adds r1, r0
	b _08040D70
	.align 2, 0
_08040D64: .4byte gSpeciesNames
_08040D68:
	ldr r1, _08040D88 @ =gUnknown_08208337
	cmp r0, 0x20
	bne _08040D70
	subs r1, 0xB
_08040D70:
	adds r0, r4, 0
	bl StringCompareWithoutExtCtrlCodes
	movs r3, 0
	cmp r0, 0
	bne _08040D7E
	movs r3, 0x1
_08040D7E:
	adds r0, r3, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08040D88: .4byte gUnknown_08208337
	thumb_func_end sub_8040D3C

	thumb_func_start sub_8040D8C
sub_8040D8C: @ 8040D8C
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0x2
	ldrb r0, [r1]
	cmp r0, 0xFC
	bne _08040DA2
	ldrb r0, [r1, 0x1]
	cmp r0, 0x15
	bne _08040DA2
	movs r2, 0x1
_08040DA2:
	adds r0, r3, 0
	bl sub_8040D3C
	pop {r1}
	bx r1
	thumb_func_end sub_8040D8C

	thumb_func_start unref_sub_8040DAC
unref_sub_8040DAC: @ 8040DAC
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	movs r1, 0x3
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	adds r0, r5, 0
	mov r1, sp
	adds r2, r4, 0
	bl sub_8040D3C
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8040DAC

	.align 2, 0 @ Don't pad with nop.
