	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_803BA2C
sub_803BA2C: @ 803BA2C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	adds r7, r0, 0
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	ldr r0, [sp, 0x4C]
	ldr r1, [sp, 0x50]
	ldr r2, [sp, 0x54]
	ldr r4, [sp, 0x58]
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0xC]
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x10]
	lsls r4, 24
	lsrs r4, 24
	movs r5, 0
	cmp r3, 0
	bne _0803BA80
	ldr r2, _0803BA78
	ldr r1, _0803BA7C
	ldr r3, [sp, 0x8]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x1]
	strh r0, [r2]
	b _0803BA84
	.align 2, 0
_0803BA78: .4byte gBattleMovePower
_0803BA7C: .4byte gBattleMoves
_0803BA80:
	ldr r0, _0803BA9C
	strh r3, [r0]
_0803BA84:
	cmp r6, 0
	bne _0803BAA4
	ldr r1, _0803BAA0
	ldr r6, [sp, 0x8]
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x2]
	mov r9, r0
	b _0803BAAE
	.align 2, 0
_0803BA9C: .4byte gBattleMovePower
_0803BAA0: .4byte gBattleMoves
_0803BAA4:
	movs r0, 0x3F
	mov r9, r0
	mov r1, r9
	ands r1, r6
	mov r9, r1
_0803BAAE:
	ldrh r6, [r7, 0x2]
	ldr r2, [sp, 0x4]
	ldrh r2, [r2, 0x4]
	str r2, [sp, 0x14]
	ldrh r3, [r7, 0x8]
	mov r8, r3
	ldr r0, [sp, 0x4]
	ldrh r0, [r0, 0xA]
	str r0, [sp, 0x18]
	ldrh r0, [r7, 0x2E]
	cmp r0, 0xAF
	bne _0803BAE0
	ldr r1, _0803BADC
	ldr r2, [sp, 0x10]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r3, [r0, 0x7]
	mov r10, r3
	ldrb r0, [r0, 0x1A]
	b _0803BAF6
	.align 2, 0
_0803BADC: .4byte gEnigmaBerries
_0803BAE0:
	ldrh r0, [r7, 0x2E]
	bl itemid_get_x12
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldrh r0, [r7, 0x2E]
	bl itemid_get_quality
	lsls r0, 24
	lsrs r0, 24
_0803BAF6:
	str r0, [sp, 0x20]
	ldr r1, [sp, 0x4]
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _0803BB26
	ldr r1, _0803BB10
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x7]
	str r0, [sp, 0x1C]
	b _0803BB3C
	.align 2, 0
_0803BB10: .4byte gEnigmaBerries
_0803BB14:
	ldr r0, [sp, 0x20]
	adds r0, 0x64
	muls r0, r6
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	b _0803BCDC
_0803BB26:
	ldr r2, [sp, 0x4]
	ldrh r0, [r2, 0x2E]
	bl itemid_get_x12
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x1C]
	ldr r3, [sp, 0x4]
	ldrh r0, [r3, 0x2E]
	bl itemid_get_quality
_0803BB3C:
	adds r0, r7, 0
	adds r0, 0x20
	ldrb r1, [r0]
	str r0, [sp, 0x24]
	cmp r1, 0x25
	beq _0803BB4C
	cmp r1, 0x4A
	bne _0803BB50
_0803BB4C:
	lsls r0, r6, 17
	lsrs r6, r0, 16
_0803BB50:
	ldr r0, _0803BCB8
	ldrh r1, [r0]
	ldr r0, _0803BCBC
	ands r0, r1
	cmp r0, 0
	beq _0803BB5E
	b _0803BC78
_0803BB5E:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0803BB98
	ldr r0, _0803BCC0
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _0803BB98
	ldr r0, _0803BCC4
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0803BB98
	ldr r0, [sp, 0x10]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0803BB98
	movs r0, 0x6E
	muls r0, r6
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
_0803BB98:
	ldr r0, _0803BCB8
	ldrh r1, [r0]
	ldr r0, _0803BCBC
	ands r0, r1
	cmp r0, 0
	bne _0803BC78
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0803BBE2
	ldr r0, _0803BCC0
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _0803BBE2
	ldr r0, _0803BCC8
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0803BBE2
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0803BBE2
	movs r0, 0x6E
	ldr r1, [sp, 0x14]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x14]
_0803BBE2:
	ldr r0, _0803BCB8
	ldrh r1, [r0]
	ldr r0, _0803BCBC
	ands r0, r1
	cmp r0, 0
	bne _0803BC78
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0803BC2E
	ldr r0, _0803BCC0
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _0803BC2E
	ldr r0, _0803BCCC
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0803BC2E
	ldr r0, [sp, 0x10]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0803BC2E
	movs r0, 0x6E
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_0803BC2E:
	ldr r0, _0803BCB8
	ldrh r1, [r0]
	ldr r0, _0803BCBC
	ands r0, r1
	cmp r0, 0
	bne _0803BC78
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0803BC78
	ldr r0, _0803BCC0
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _0803BC78
	ldr r0, _0803BCCC
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0803BC78
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0803BC78
	movs r0, 0x6E
	ldr r3, [sp, 0x18]
	muls r0, r3
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x18]
_0803BC78:
	movs r2, 0
	ldr r4, _0803BCD0
	ldr r0, [sp, 0x4]
	adds r0, 0x20
	str r0, [sp, 0x28]
	adds r3, r4, 0
_0803BC84:
	lsls r1, r2, 1
	ldrb r0, [r3]
	cmp r10, r0
	bne _0803BCD4
	adds r0, r4, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r9, r0
	bne _0803BCD4
	mov r1, r9
	cmp r1, 0x8
	bhi _0803BC9E
	b _0803BB14
_0803BC9E:
	ldr r0, [sp, 0x20]
	adds r0, 0x64
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	b _0803BCDC
	.align 2, 0
_0803BCB8: .4byte gUnknown_020239F8
_0803BCBC: .4byte 0x00000902
_0803BCC0: .4byte word_202FF5E
_0803BCC4: .4byte 0x00000807
_0803BCC8: .4byte 0x0000080b
_0803BCCC: .4byte 0x0000080d
_0803BCD0: .4byte gHoldEffectToType
_0803BCD4:
	adds r3, 0x2
	adds r2, 0x1
	cmp r2, 0x10
	bls _0803BC84
_0803BCDC:
	mov r3, r10
	cmp r3, 0x1D
	bne _0803BCF0
	movs r0, 0x96
	muls r0, r6
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
_0803BCF0:
	mov r0, r10
	cmp r0, 0x22
	bne _0803BD28
	ldr r0, _0803BFDC
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	bne _0803BD28
	ldr r1, _0803BFE0
	adds r0, r1, 0
	ldrh r2, [r7]
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0803BD28
	movs r0, 0x96
	mov r3, r8
	muls r3, r0
	adds r0, r3, 0
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_0803BD28:
	ldr r0, [sp, 0x1C]
	cmp r0, 0x22
	bne _0803BD60
	ldr r0, _0803BFDC
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	bne _0803BD60
	ldr r1, _0803BFE0
	adds r0, r1, 0
	ldr r2, [sp, 0x4]
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0803BD60
	movs r0, 0x96
	ldr r3, [sp, 0x18]
	muls r0, r3
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x18]
_0803BD60:
	mov r0, r10
	cmp r0, 0x23
	bne _0803BD76
	ldrh r1, [r7]
	ldr r0, _0803BFE4
	cmp r1, r0
	bne _0803BD76
	mov r1, r8
	lsls r0, r1, 17
	lsrs r0, 16
	mov r8, r0
_0803BD76:
	ldr r2, [sp, 0x1C]
	cmp r2, 0x24
	bne _0803BD8E
	ldr r3, [sp, 0x4]
	ldrh r1, [r3]
	ldr r0, _0803BFE4
	cmp r1, r0
	bne _0803BD8E
	ldr r1, [sp, 0x18]
	lsls r0, r1, 17
	lsrs r0, 16
	str r0, [sp, 0x18]
_0803BD8E:
	mov r2, r10
	cmp r2, 0x2D
	bne _0803BDA2
	ldrh r0, [r7]
	cmp r0, 0x19
	bne _0803BDA2
	mov r3, r8
	lsls r0, r3, 17
	lsrs r0, 16
	mov r8, r0
_0803BDA2:
	ldr r0, [sp, 0x1C]
	cmp r0, 0x40
	bne _0803BDB8
	ldr r1, [sp, 0x4]
	ldrh r0, [r1]
	cmp r0, 0x84
	bne _0803BDB8
	ldr r2, [sp, 0x14]
	lsls r0, r2, 17
	lsrs r0, 16
	str r0, [sp, 0x14]
_0803BDB8:
	mov r3, r10
	cmp r3, 0x41
	bne _0803BDCE
	ldrh r0, [r7]
	subs r0, 0x68
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0803BDCE
	lsls r0, r6, 17
	lsrs r6, r0, 16
_0803BDCE:
	ldr r1, [sp, 0x28]
	ldrb r0, [r1]
	cmp r0, 0x2F
	bne _0803BDE6
	mov r2, r9
	cmp r2, 0xA
	beq _0803BDE0
	cmp r2, 0xF
	bne _0803BDE6
_0803BDE0:
	mov r3, r8
	lsrs r3, 1
	mov r8, r3
_0803BDE6:
	ldr r0, [sp, 0x24]
	ldrb r4, [r0]
	cmp r4, 0x37
	bne _0803BDFC
	movs r0, 0x96
	muls r0, r6
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
_0803BDFC:
	cmp r4, 0x39
	bne _0803BE2A
	movs r0, 0
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0x3A
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _0803BE2A
	movs r0, 0x96
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_0803BE2A:
	ldr r2, [sp, 0x24]
	ldrb r0, [r2]
	cmp r0, 0x3A
	bne _0803BE5C
	movs r0, 0
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0x39
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _0803BE5C
	movs r0, 0x96
	mov r3, r8
	muls r3, r0
	adds r0, r3, 0
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_0803BE5C:
	ldr r1, [sp, 0x24]
	ldrb r0, [r1]
	cmp r0, 0x3E
	bne _0803BE78
	ldr r0, [r7, 0x4C]
	cmp r0, 0
	beq _0803BE78
	movs r0, 0x96
	muls r0, r6
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
_0803BE78:
	ldr r2, [sp, 0x28]
	ldrb r0, [r2]
	cmp r0, 0x3F
	bne _0803BE9A
	ldr r3, [sp, 0x4]
	ldr r0, [r3, 0x4C]
	cmp r0, 0
	beq _0803BE9A
	movs r0, 0x96
	ldr r1, [sp, 0x14]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x14]
_0803BE9A:
	mov r2, r9
	cmp r2, 0xD
	bne _0803BEBE
	movs r0, 0
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0
	movs r3, 0xFD
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _0803BEBE
	ldr r1, _0803BFE8
	ldrh r0, [r1]
	lsrs r0, 1
	strh r0, [r1]
_0803BEBE:
	mov r3, r9
	cmp r3, 0xA
	bne _0803BEE2
	movs r0, 0
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0
	movs r3, 0xFE
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _0803BEE2
	ldr r1, _0803BFE8
	ldrh r0, [r1]
	lsrs r0, 1
	strh r0, [r1]
_0803BEE2:
	mov r0, r9
	cmp r0, 0xC
	bne _0803BF12
	ldr r1, [sp, 0x24]
	ldrb r0, [r1]
	cmp r0, 0x41
	bne _0803BF12
	ldrh r0, [r7, 0x2C]
	movs r1, 0x3
	bl __udivsi3
	ldrh r1, [r7, 0x28]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _0803BF12
	ldr r4, _0803BFE8
	ldrh r1, [r4]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	strh r0, [r4]
_0803BF12:
	mov r2, r9
	cmp r2, 0xA
	bne _0803BF42
	ldr r3, [sp, 0x24]
	ldrb r0, [r3]
	cmp r0, 0x42
	bne _0803BF42
	ldrh r0, [r7, 0x2C]
	movs r1, 0x3
	bl __udivsi3
	ldrh r1, [r7, 0x28]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _0803BF42
	ldr r4, _0803BFE8
	ldrh r1, [r4]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	strh r0, [r4]
_0803BF42:
	mov r0, r9
	cmp r0, 0xB
	bne _0803BF72
	ldr r1, [sp, 0x24]
	ldrb r0, [r1]
	cmp r0, 0x43
	bne _0803BF72
	ldrh r0, [r7, 0x2C]
	movs r1, 0x3
	bl __udivsi3
	ldrh r1, [r7, 0x28]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _0803BF72
	ldr r4, _0803BFE8
	ldrh r1, [r4]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	strh r0, [r4]
_0803BF72:
	mov r2, r9
	cmp r2, 0x6
	bne _0803BFA2
	ldr r3, [sp, 0x24]
	ldrb r0, [r3]
	cmp r0, 0x44
	bne _0803BFA2
	ldrh r0, [r7, 0x2C]
	movs r1, 0x3
	bl __udivsi3
	ldrh r1, [r7, 0x28]
	lsls r0, 16
	lsrs r0, 16
	cmp r1, r0
	bhi _0803BFA2
	ldr r4, _0803BFE8
	ldrh r1, [r4]
	movs r0, 0x96
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	strh r0, [r4]
_0803BFA2:
	ldr r2, _0803BFEC
	ldr r0, _0803BFF0
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x7
	bne _0803BFBC
	ldr r0, [sp, 0x14]
	lsrs r0, 1
	str r0, [sp, 0x14]
_0803BFBC:
	mov r1, r9
	cmp r1, 0x8
	bls _0803BFC4
	b _0803C122
_0803BFC4:
	ldr r0, _0803BFF4
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x2
	bne _0803C000
	movs r0, 0x19
	ldrsb r0, [r7, r0]
	cmp r0, 0x6
	ble _0803BFFC
	ldr r2, _0803BFF8
	b _0803C006
	.align 2, 0
_0803BFDC: .4byte gUnknown_020239F8
_0803BFE0: .4byte 0xfffffe69
_0803BFE4: .4byte 0x00000175
_0803BFE8: .4byte gBattleMovePower
_0803BFEC: .4byte gBattleMoves
_0803BFF0: .4byte gUnknown_02024BE6
_0803BFF4: .4byte gCritMultiplier
_0803BFF8: .4byte gStatStageRatios
_0803BFFC:
	adds r5, r6, 0
	b _0803C01E
_0803C000:
	ldr r2, _0803C050
	movs r0, 0x19
	ldrsb r0, [r7, r0]
_0803C006:
	lsls r0, 1
	adds r1, r0, r2
	ldrb r1, [r1]
	adds r5, r6, 0
	muls r5, r1
	adds r2, 0x1
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r5, 0
	bl __divsi3
	adds r5, r0, 0
_0803C01E:
	ldr r0, _0803C054
	ldrh r0, [r0]
	muls r5, r0
	adds r0, r7, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x5
	bl __divsi3
	adds r0, 0x2
	muls r5, r0
	ldrb r0, [r4]
	cmp r0, 0x2
	bne _0803C05C
	ldr r2, [sp, 0x4]
	movs r0, 0x1A
	ldrsb r0, [r2, r0]
	cmp r0, 0x5
	bgt _0803C058
	ldr r2, _0803C050
	ldr r3, [sp, 0x4]
	movs r0, 0x1A
	ldrsb r0, [r3, r0]
	b _0803C064
	.align 2, 0
_0803C050: .4byte gStatStageRatios
_0803C054: .4byte gBattleMovePower
_0803C058:
	ldr r3, [sp, 0x14]
	b _0803C07E
_0803C05C:
	ldr r2, _0803C0DC
	ldr r1, [sp, 0x4]
	movs r0, 0x1A
	ldrsb r0, [r1, r0]
_0803C064:
	lsls r0, 1
	adds r1, r0, r2
	ldrb r1, [r1]
	ldr r6, [sp, 0x14]
	adds r3, r6, 0
	muls r3, r1
	adds r2, 0x1
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r3, 0
	bl __divsi3
	adds r3, r0, 0
_0803C07E:
	adds r0, r5, 0
	adds r1, r3, 0
	bl __divsi3
	adds r5, r0, 0
	movs r1, 0x32
	bl __divsi3
	adds r5, r0, 0
	ldr r0, [r7, 0x4C]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0803C0A8
	ldr r1, [sp, 0x24]
	ldrb r0, [r1]
	cmp r0, 0x3E
	beq _0803C0A8
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803C0A8:
	movs r0, 0x1
	ldr r2, [sp, 0xC]
	ands r0, r2
	cmp r0, 0
	beq _0803C0EA
	ldrb r1, [r4]
	cmp r1, 0x1
	bne _0803C0EA
	ldr r0, _0803C0E0
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0803C0E4
	movs r0, 0x2
	bl sub_803C348
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0803C0E4
	adds r0, r5, 0
	movs r1, 0x3
	bl __divsi3
	lsls r5, r0, 1
	b _0803C0EA
	.align 2, 0
_0803C0DC: .4byte gStatStageRatios
_0803C0E0: .4byte gUnknown_020239F8
_0803C0E4:
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803C0EA:
	ldr r0, _0803C148
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803C11C
	ldr r0, _0803C14C
	ldr r3, [sp, 0x8]
	lsls r1, r3, 1
	adds r1, r3
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x6]
	cmp r0, 0x8
	bne _0803C11C
	movs r0, 0x2
	bl sub_803C348
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0803C11C
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803C11C:
	cmp r5, 0
	bne _0803C122
	movs r5, 0x1
_0803C122:
	mov r6, r9
	cmp r6, 0x9
	bne _0803C12A
	movs r5, 0
_0803C12A:
	mov r0, r9
	cmp r0, 0x9
	bhi _0803C132
	b _0803C330
_0803C132:
	ldr r0, _0803C150
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x2
	bne _0803C15C
	movs r0, 0x1C
	ldrsb r0, [r7, r0]
	cmp r0, 0x6
	ble _0803C158
	ldr r2, _0803C154
	b _0803C162
	.align 2, 0
_0803C148: .4byte gUnknown_020239F8
_0803C14C: .4byte gBattleMoves
_0803C150: .4byte gCritMultiplier
_0803C154: .4byte gStatStageRatios
_0803C158:
	mov r5, r8
	b _0803C17A
_0803C15C:
	ldr r2, _0803C1A8
	movs r0, 0x1C
	ldrsb r0, [r7, r0]
_0803C162:
	lsls r0, 1
	adds r1, r0, r2
	ldrb r1, [r1]
	mov r5, r8
	muls r5, r1
	adds r2, 0x1
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r5, 0
	bl __divsi3
	adds r5, r0, 0
_0803C17A:
	ldr r0, _0803C1AC
	ldrh r0, [r0]
	muls r5, r0
	adds r0, r7, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x5
	bl __divsi3
	adds r0, 0x2
	muls r5, r0
	ldrb r0, [r4]
	cmp r0, 0x2
	bne _0803C1B4
	ldr r1, [sp, 0x4]
	movs r0, 0x1D
	ldrsb r0, [r1, r0]
	cmp r0, 0x5
	bgt _0803C1B0
	ldr r2, _0803C1A8
	b _0803C1BC
	.align 2, 0
_0803C1A8: .4byte gStatStageRatios
_0803C1AC: .4byte gBattleMovePower
_0803C1B0:
	ldr r3, [sp, 0x18]
	b _0803C1D6
_0803C1B4:
	ldr r2, _0803C21C
	ldr r1, [sp, 0x4]
	movs r0, 0x1D
	ldrsb r0, [r1, r0]
_0803C1BC:
	lsls r0, 1
	adds r1, r0, r2
	ldrb r1, [r1]
	ldr r6, [sp, 0x18]
	adds r3, r6, 0
	muls r3, r1
	adds r2, 0x1
	adds r0, r2
	ldrb r1, [r0]
	adds r0, r3, 0
	bl __divsi3
	adds r3, r0, 0
_0803C1D6:
	adds r0, r5, 0
	adds r1, r3, 0
	bl __divsi3
	adds r5, r0, 0
	movs r1, 0x32
	bl __divsi3
	adds r5, r0, 0
	movs r0, 0x2
	ldr r1, [sp, 0xC]
	ands r0, r1
	cmp r0, 0
	beq _0803C22A
	ldrb r1, [r4]
	cmp r1, 0x1
	bne _0803C22A
	ldr r0, _0803C220
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0803C224
	movs r0, 0x2
	bl sub_803C348
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0803C224
	adds r0, r5, 0
	movs r1, 0x3
	bl __divsi3
	lsls r5, r0, 1
	b _0803C22A
	.align 2, 0
_0803C21C: .4byte gStatStageRatios
_0803C220: .4byte gUnknown_020239F8
_0803C224:
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803C22A:
	ldr r0, _0803C2A4
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803C25C
	ldr r0, _0803C2A8
	ldr r2, [sp, 0x8]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x6]
	cmp r0, 0x8
	bne _0803C25C
	movs r0, 0x2
	bl sub_803C348
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0803C25C
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803C25C:
	movs r0, 0
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0803C30C
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _0803C30C
	ldr r2, _0803C2AC
	ldrh r1, [r2]
	movs r0, 0x1
	ands r0, r1
	adds r4, r2, 0
	cmp r0, 0
	beq _0803C2C4
	mov r3, r9
	cmp r3, 0xA
	beq _0803C2B0
	cmp r3, 0xB
	beq _0803C2B8
	b _0803C2C4
	.align 2, 0
_0803C2A4: .4byte gUnknown_020239F8
_0803C2A8: .4byte gBattleMoves
_0803C2AC: .4byte word_2024DB8
_0803C2B0:
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
	b _0803C2C4
_0803C2B8:
	lsls r0, r5, 4
	subs r0, r5
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
_0803C2C4:
	ldrh r1, [r4]
	movs r0, 0x9F
	ands r0, r1
	cmp r0, 0
	beq _0803C2DC
	ldr r0, _0803C2F4
	ldrh r0, [r0]
	cmp r0, 0x4C
	bne _0803C2DC
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803C2DC:
	ldrh r1, [r4]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _0803C30C
	mov r6, r9
	cmp r6, 0xA
	beq _0803C2F8
	cmp r6, 0xB
	beq _0803C306
	b _0803C30C
	.align 2, 0
_0803C2F4: .4byte gUnknown_02024BE6
_0803C2F8:
	lsls r0, r5, 4
	subs r0, r5
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
	b _0803C30C
_0803C306:
	lsrs r0, r5, 31
	adds r0, r5, r0
	asrs r5, r0, 1
_0803C30C:
	ldr r1, _0803C344
	ldr r2, [sp, 0x10]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0803C330
	mov r3, r9
	cmp r3, 0xA
	bne _0803C330
	lsls r0, r5, 4
	subs r0, r5
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
_0803C330:
	adds r0, r5, 0x2
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803C344: .4byte 0x02017100
	thumb_func_end sub_803BA2C

	.align 2, 0 @ Don't pad with nop.
