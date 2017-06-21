	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text
	
	thumb_func_start PlayerHandleGetAttributes
PlayerHandleGetAttributes: @ 802E4D0
	push {r4-r6,lr}
	sub sp, 0x100
	movs r6, 0
	ldr r1, _0802E4FC @ =gBattleBufferA
	ldr r0, _0802E500 @ =gActiveBank
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _0802E508
	ldr r0, _0802E504 @ =gBattlePartyID
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl dp01_getattr_by_ch1_for_player_pokemon_
	adds r6, r0, 0
	b _0802E52A
	.align 2, 0
_0802E4FC: .4byte gBattleBufferA
_0802E500: .4byte gActiveBank
_0802E504: .4byte gBattlePartyID
_0802E508:
	ldrb r4, [r1]
	movs r5, 0
_0802E50C:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0802E522
	lsls r0, r5, 24
	lsrs r0, 24
	mov r2, sp
	adds r1, r2, r6
	bl dp01_getattr_by_ch1_for_player_pokemon_
	adds r6, r0
_0802E522:
	lsrs r4, 1
	adds r5, 0x1
	cmp r5, 0x5
	ble _0802E50C
_0802E52A:
	lsls r1, r6, 16
	lsrs r1, 16
	movs r0, 0x1
	mov r2, sp
	bl dp01_build_cmdbuf_x1D_1D_numargs_varargs
	bl PlayerBufferExecCompleted
	add sp, 0x100
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end PlayerHandleGetAttributes

	thumb_func_start dp01_getattr_by_ch1_for_player_pokemon_
dp01_getattr_by_ch1_for_player_pokemon_: @ 802E544
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x90
	adds r7, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r2, _0802E578 @ =gBattleBufferA
	ldr r3, _0802E57C @ =gActiveBank
	ldrb r0, [r3]
	lsls r0, 9
	adds r1, r2, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3B
	bls _0802E56E
	bl _0802ECDA
_0802E56E:
	lsls r0, 2
	ldr r1, _0802E580 @ =_0802E584
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802E578: .4byte gBattleBufferA
_0802E57C: .4byte gActiveBank
_0802E580: .4byte _0802E584
	.align 2, 0
_0802E584:
	.4byte _0802E674
	.4byte _0802E898
	.4byte _0802E8A8
	.4byte _0802E8B8
	.4byte _0802E920
	.4byte _0802E920
	.4byte _0802E920
	.4byte _0802E920
	.4byte _0802E93C
	.4byte _0802E978
	.4byte _0802E978
	.4byte _0802E978
	.4byte _0802E978
	.4byte _0802ECDA
	.4byte _0802ECDA
	.4byte _0802ECDA
	.4byte _0802ECDA
	.4byte _0802E994
	.4byte _0802E9A4
	.4byte _0802E9D4
	.4byte _0802E9E4
	.4byte _0802E9F4
	.4byte _0802EA04
	.4byte _0802EA14
	.4byte _0802EA24
	.4byte _0802EA34
	.4byte _0802EA44
	.4byte _0802EA54
	.4byte _0802EA64
	.4byte _0802EA74
	.4byte _0802EA84
	.4byte _0802EA94
	.4byte _0802EAE4
	.4byte _0802EAF4
	.4byte _0802EB04
	.4byte _0802EB14
	.4byte _0802EB24
	.4byte _0802EB34
	.4byte _0802EB44
	.4byte _0802EB54
	.4byte _0802EB64
	.4byte _0802EB98
	.4byte _0802EBA8
	.4byte _0802EBB8
	.4byte _0802EBC8
	.4byte _0802EBD8
	.4byte _0802EBE8
	.4byte _0802EBF8
	.4byte _0802EC08
	.4byte _0802EC28
	.4byte _0802EC38
	.4byte _0802EC48
	.4byte _0802EC58
	.4byte _0802EC68
	.4byte _0802EC78
	.4byte _0802EC88
	.4byte _0802EC98
	.4byte _0802ECA8
	.4byte _0802ECB8
	.4byte _0802ECC8
_0802E674:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0802E888 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2E]
	movs r6, 0
	add r0, sp, 0x24
	mov r9, r0
	movs r1, 0x3B
	add r1, sp
	mov r10, r1
	mov r2, sp
	adds r2, 0x2B
	str r2, [sp, 0x80]
	mov r0, sp
	adds r0, 0x2A
	str r0, [sp, 0x7C]
	mov r1, sp
	adds r1, 0x68
	str r1, [sp, 0x8C]
	adds r2, 0x5
	str r2, [sp, 0x84]
	adds r0, 0x12
	str r0, [sp, 0x88]
	mov r8, r4
	add r4, sp, 0xC
_0802E6C0:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r8
	bl GetMonData
	strh r0, [r4]
	adds r1, r6, 0
	adds r1, 0x11
	mov r0, r8
	bl GetMonData
	mov r2, r9
	adds r1, r2, r6
	strb r0, [r1]
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802E6C0
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0802E888 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl GetMonData
	mov r1, r10
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	ldr r2, [sp, 0x80]
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x19
	bl GetMonData
	str r0, [sp, 0x44]
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	mov r3, sp
	movs r5, 0x1F
	ands r0, r5
	ldrb r2, [r3, 0x14]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	mov r3, sp
	movs r6, 0x1F
	ands r0, r6
	lsls r0, 5
	ldrh r2, [r3, 0x14]
	ldr r1, _0802E88C @ =0xfffffc1f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 2
	ldrb r2, [r3, 0x15]
	movs r1, 0x7D
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x15]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	movs r1, 0x1F
	ands r1, r0
	lsls r1, 15
	ldr r0, [sp, 0x14]
	ldr r2, _0802E890 @ =0xfff07fff
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x14]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	mov r3, sp
	ands r0, r6
	lsls r0, 4
	ldrh r2, [r3, 0x16]
	ldr r1, _0802E894 @ =0xfffffe0f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x16]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 1
	ldrb r2, [r3, 0x17]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x48]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	str r0, [sp, 0x4C]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	ldr r1, [sp, 0x7C]
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x28]
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2C]
	adds r0, r4, 0
	movs r1, 0x3B
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2]
	adds r0, r4, 0
	movs r1, 0x3C
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x4]
	adds r0, r4, 0
	movs r1, 0x3D
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x6]
	adds r0, r4, 0
	movs r1, 0x3E
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x8]
	adds r0, r4, 0
	movs r1, 0x3F
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0xA]
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	mov r3, sp
	movs r1, 0x1
	ands r0, r1
	lsls r0, 6
	ldrb r2, [r3, 0x17]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	mov r3, sp
	lsls r0, 7
	ldrb r2, [r3, 0x17]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [sp, 0x54]
	adds r0, r4, 0
	movs r1, 0x2
	ldr r2, [sp, 0x8C]
	bl GetMonData
	ldr r0, [sp, 0x84]
	ldr r1, [sp, 0x8C]
	bl StringCopy10
	adds r0, r4, 0
	movs r1, 0x7
	ldr r2, [sp, 0x88]
	bl GetMonData
	mov r2, sp
	movs r6, 0
_0802E878:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0x57
	bls _0802E878
	b _0802ECDA
	.align 2, 0
_0802E888: .4byte gPlayerParty
_0802E88C: .4byte 0xfffffc1f
_0802E890: .4byte 0xfff07fff
_0802E894: .4byte 0xfffffe0f
_0802E898:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802E8A4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	b _0802EC12
	.align 2, 0
_0802E8A4: .4byte gPlayerParty
_0802E8A8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802E8B4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	b _0802EC12
	.align 2, 0
_0802E8B4: .4byte gPlayerParty
_0802E8B8:
	movs r6, 0
	add r2, sp, 0x58
	mov r9, r2
	add r0, sp, 0x60
	mov r10, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0802E91C @ =gPlayerParty
	adds r4, r1, r0
	mov r8, r9
_0802E8CE:
	adds r1, r6, 0
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	mov r1, r8
	strh r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r4, 0
	bl GetMonData
	mov r2, r10
	adds r1, r2, r6
	strb r0, [r1]
	movs r0, 0x2
	add r8, r0
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802E8CE
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802E91C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	mov r1, r9
	strb r0, [r1, 0xC]
	mov r2, r9
	movs r6, 0
_0802E90C:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0xF
	bls _0802E90C
	b _0802ECDA
	.align 2, 0
_0802E91C: .4byte gPlayerParty
_0802E920:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802E938 @ =gPlayerParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x9
	b _0802EC12
	.align 2, 0
_0802E938: .4byte gPlayerParty
_0802E93C:
	movs r6, 0
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r2, _0802E974 @ =gPlayerParty
	mov r8, r2
_0802E948:
	adds r1, r6, 0
	adds r1, 0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	cmp r6, 0x3
	ble _0802E948
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802E974 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	b _0802ECDA
	.align 2, 0
_0802E974: .4byte gPlayerParty
_0802E978:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802E990 @ =gPlayerParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x8
	b _0802ECD2
	.align 2, 0
_0802E990: .4byte gPlayerParty
_0802E994:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802E9A0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1
	b _0802E9AE
	.align 2, 0
_0802E9A0: .4byte gPlayerParty
_0802E9A4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802E9D0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x19
_0802E9AE:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	movs r6, 0x3
	b _0802ECDA
	.align 2, 0
_0802E9D0: .4byte gPlayerParty
_0802E9D4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802E9E0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1A
	b _0802ECD2
	.align 2, 0
_0802E9E0: .4byte gPlayerParty
_0802E9E4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802E9F0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1B
	b _0802ECD2
	.align 2, 0
_0802E9F0: .4byte gPlayerParty
_0802E9F4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EA00 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1C
	b _0802ECD2
	.align 2, 0
_0802EA00: .4byte gPlayerParty
_0802EA04:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EA10 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1D
	b _0802ECD2
	.align 2, 0
_0802EA10: .4byte gPlayerParty
_0802EA14:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EA20 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1E
	b _0802ECD2
	.align 2, 0
_0802EA20: .4byte gPlayerParty
_0802EA24:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EA30 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1F
	b _0802ECD2
	.align 2, 0
_0802EA30: .4byte gPlayerParty
_0802EA34:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EA40 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x20
	b _0802ECD2
	.align 2, 0
_0802EA40: .4byte gPlayerParty
_0802EA44:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EA50 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x22
	b _0802ECD2
	.align 2, 0
_0802EA50: .4byte gPlayerParty
_0802EA54:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EA60 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x23
	b _0802ECD2
	.align 2, 0
_0802EA60: .4byte gPlayerParty
_0802EA64:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EA70 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x24
	b _0802ECD2
	.align 2, 0
_0802EA70: .4byte gPlayerParty
_0802EA74:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EA80 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x25
	b _0802ECD2
	.align 2, 0
_0802EA80: .4byte gPlayerParty
_0802EA84:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EA90 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x26
	b _0802ECD2
	.align 2, 0
_0802EA90: .4byte gPlayerParty
_0802EA94:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0802EAE0 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	strb r0, [r7]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	strb r0, [r7, 0x1]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	strb r0, [r7, 0x2]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	strb r0, [r7, 0x3]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	strb r0, [r7, 0x4]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	strb r0, [r7, 0x5]
	movs r6, 0x6
	b _0802ECDA
	.align 2, 0
_0802EAE0: .4byte gPlayerParty
_0802EAE4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EAF0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x27
	b _0802ECD2
	.align 2, 0
_0802EAF0: .4byte gPlayerParty
_0802EAF4:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EB00 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x28
	b _0802ECD2
	.align 2, 0
_0802EB00: .4byte gPlayerParty
_0802EB04:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EB10 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x29
	b _0802ECD2
	.align 2, 0
_0802EB10: .4byte gPlayerParty
_0802EB14:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EB20 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2A
	b _0802ECD2
	.align 2, 0
_0802EB20: .4byte gPlayerParty
_0802EB24:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EB30 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2B
	b _0802ECD2
	.align 2, 0
_0802EB30: .4byte gPlayerParty
_0802EB34:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EB40 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2C
	b _0802ECD2
	.align 2, 0
_0802EB40: .4byte gPlayerParty
_0802EB44:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EB50 @ =gPlayerParty
	adds r0, r1
	movs r1, 0
	b _0802EB6E
	.align 2, 0
_0802EB50: .4byte gPlayerParty
_0802EB54:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EB60 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x9
	b _0802EC12
	.align 2, 0
_0802EB60: .4byte gPlayerParty
_0802EB64:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EB94 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x37
_0802EB6E:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	lsrs r0, r1, 24
	strb r0, [r7, 0x3]
	movs r6, 0x4
	b _0802ECDA
	.align 2, 0
_0802EB94: .4byte gPlayerParty
_0802EB98:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EBA4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	b _0802ECD2
	.align 2, 0
_0802EBA4: .4byte gPlayerParty
_0802EBA8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EBB4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x39
	b _0802EC12
	.align 2, 0
_0802EBB4: .4byte gPlayerParty
_0802EBB8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EBC4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3A
	b _0802EC12
	.align 2, 0
_0802EBC4: .4byte gPlayerParty
_0802EBC8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EBD4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3B
	b _0802EC12
	.align 2, 0
_0802EBD4: .4byte gPlayerParty
_0802EBD8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EBE4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3C
	b _0802EC12
	.align 2, 0
_0802EBE4: .4byte gPlayerParty
_0802EBE8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EBF4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3D
	b _0802EC12
	.align 2, 0
_0802EBF4: .4byte gPlayerParty
_0802EBF8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EC04 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3E
	b _0802EC12
	.align 2, 0
_0802EC04: .4byte gPlayerParty
_0802EC08:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EC24 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3F
_0802EC12:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	strb r0, [r7]
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r6, 0x2
	b _0802ECDA
	.align 2, 0
_0802EC24: .4byte gPlayerParty
_0802EC28:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EC34 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x16
	b _0802ECD2
	.align 2, 0
_0802EC34: .4byte gPlayerParty
_0802EC38:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EC44 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x17
	b _0802ECD2
	.align 2, 0
_0802EC44: .4byte gPlayerParty
_0802EC48:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EC54 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x18
	b _0802ECD2
	.align 2, 0
_0802EC54: .4byte gPlayerParty
_0802EC58:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EC64 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x21
	b _0802ECD2
	.align 2, 0
_0802EC64: .4byte gPlayerParty
_0802EC68:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EC74 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2F
	b _0802ECD2
	.align 2, 0
_0802EC74: .4byte gPlayerParty
_0802EC78:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EC84 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x30
	b _0802ECD2
	.align 2, 0
_0802EC84: .4byte gPlayerParty
_0802EC88:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802EC94 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x32
	b _0802ECD2
	.align 2, 0
_0802EC94: .4byte gPlayerParty
_0802EC98:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802ECA4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x33
	b _0802ECD2
	.align 2, 0
_0802ECA4: .4byte gPlayerParty
_0802ECA8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802ECB4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x34
	b _0802ECD2
	.align 2, 0
_0802ECB4: .4byte gPlayerParty
_0802ECB8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802ECC4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x35
	b _0802ECD2
	.align 2, 0
_0802ECC4: .4byte gPlayerParty
_0802ECC8:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802ECEC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x36
_0802ECD2:
	bl GetMonData
	strb r0, [r7]
	movs r6, 0x1
_0802ECDA:
	adds r0, r6, 0
	add sp, 0x90
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802ECEC: .4byte gPlayerParty
	thumb_func_end dp01_getattr_by_ch1_for_player_pokemon_

	thumb_func_start sub_802ECF0
sub_802ECF0: @ 802ECF0
	push {r4-r7,lr}
	sub sp, 0x58
	ldr r2, _0802ED68 @ =gBattlePartyID
	ldr r5, _0802ED6C @ =gActiveBank
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	adds r4, r2, 0
	muls r4, r0
	ldr r3, _0802ED70 @ =gBattleBufferA
	lsls r1, 9
	adds r0, r3, 0x1
	adds r0, r1, r0
	ldrb r2, [r0]
	ldr r0, _0802ED74 @ =gPlayerParty
	adds r0, r2, r0
	adds r6, r4, r0
	mov r0, sp
	adds r4, r0, r2
	movs r2, 0
	adds r0, r3, 0x2
	adds r1, r0
	adds r7, r5, 0
	mov r12, r3
	ldrb r1, [r1]
	cmp r2, r1
	bcs _0802ED46
	adds r3, r0, 0
_0802ED2C:
	adds r1, r4, r2
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	ldrb r0, [r5]
	lsls r0, 9
	adds r0, r3
	ldrb r0, [r0]
	cmp r2, r0
	bcc _0802ED2C
_0802ED46:
	ldrb r0, [r7]
	lsls r0, 9
	mov r1, r12
	adds r1, 0x2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	adds r2, r4, 0
	bl dp01_build_cmdbuf_x1D_1D_numargs_varargs
	bl PlayerBufferExecCompleted
	add sp, 0x58
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802ED68: .4byte gBattlePartyID
_0802ED6C: .4byte gActiveBank
_0802ED70: .4byte gBattleBufferA
_0802ED74: .4byte gPlayerParty
	thumb_func_end sub_802ECF0

	thumb_func_start PlayerHandleSetAttributes
PlayerHandleSetAttributes: @ 802ED78
	push {r4,r5,lr}
	ldr r1, _0802ED9C @ =gBattleBufferA
	ldr r0, _0802EDA0 @ =gActiveBank
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _0802EDA8
	ldr r0, _0802EDA4 @ =gBattlePartyID
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	bl dp01_setattr_by_ch1_for_player_pokemon
	b _0802EDC6
	.align 2, 0
_0802ED9C: .4byte gBattleBufferA
_0802EDA0: .4byte gActiveBank
_0802EDA4: .4byte gBattlePartyID
_0802EDA8:
	ldrb r4, [r1]
	movs r5, 0
_0802EDAC:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0802EDBA
	adds r0, r5, 0
	bl dp01_setattr_by_ch1_for_player_pokemon
_0802EDBA:
	lsrs r4, 1
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _0802EDAC
_0802EDC6:
	bl PlayerBufferExecCompleted
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end PlayerHandleSetAttributes

	thumb_func_start dp01_setattr_by_ch1_for_player_pokemon
dp01_setattr_by_ch1_for_player_pokemon: @ 802EDD0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0802EE08 @ =gActiveBank
	ldrb r0, [r0]
	lsls r0, 9
	ldr r2, _0802EE0C @ =gUnknown_02023A63
	adds r3, r0, r2
	adds r6, r3, 0
	subs r1, r2, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r7, r2, 0
	cmp r0, 0x3B
	bls _0802EDFC
	bl _0802F796
_0802EDFC:
	lsls r0, 2
	ldr r1, _0802EE10 @ =_0802EE14
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802EE08: .4byte gActiveBank
_0802EE0C: .4byte gUnknown_02023A63
_0802EE10: .4byte _0802EE14
	.align 2, 0
_0802EE14:
	.4byte _0802EF04
	.4byte _0802F09C
	.4byte _0802F0BC
	.4byte _0802F0DC
	.4byte _0802F134
	.4byte _0802F134
	.4byte _0802F134
	.4byte _0802F134
	.4byte _0802F15C
	.4byte _0802F1C0
	.4byte _0802F1C0
	.4byte _0802F1C0
	.4byte _0802F1C0
	.4byte _0802F796
	.4byte _0802F796
	.4byte _0802F796
	.4byte _0802F796
	.4byte _0802F1F0
	.4byte _0802F210
	.4byte _0802F230
	.4byte _0802F250
	.4byte _0802F270
	.4byte _0802F290
	.4byte _0802F2B0
	.4byte _0802F2D0
	.4byte _0802F2F0
	.4byte _0802F310
	.4byte _0802F330
	.4byte _0802F350
	.4byte _0802F370
	.4byte _0802F390
	.4byte _0802F3B0
	.4byte _0802F420
	.4byte _0802F440
	.4byte _0802F460
	.4byte _0802F480
	.4byte _0802F4A0
	.4byte _0802F4C0
	.4byte _0802F4E0
	.4byte _0802F500
	.4byte _0802F520
	.4byte _0802F540
	.4byte _0802F560
	.4byte _0802F580
	.4byte _0802F5A0
	.4byte _0802F5C0
	.4byte _0802F5E0
	.4byte _0802F600
	.4byte _0802F620
	.4byte _0802F640
	.4byte _0802F660
	.4byte _0802F680
	.4byte _0802F6A0
	.4byte _0802F6C0
	.4byte _0802F6E0
	.4byte _0802F700
	.4byte _0802F720
	.4byte _0802F740
	.4byte _0802F760
	.4byte _0802F780
_0802EF04:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0802F098 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	adds r2, r6, 0
	bl SetMonData
	adds r2, r6, 0
	adds r2, 0x2E
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	movs r0, 0
	mov r8, r0
	movs r0, 0x3B
	adds r0, r6
	mov r10, r0
	adds r0, r6, 0
	adds r0, 0x2B
	str r0, [sp, 0x20]
	adds r0, 0x19
	str r0, [sp, 0x28]
	adds r0, 0x4
	str r0, [sp, 0x2C]
	adds r0, 0x4
	str r0, [sp, 0x30]
	subs r0, 0x22
	str r0, [sp, 0x1C]
	subs r0, 0x2
	str r0, [sp, 0x18]
	adds r0, 0x4
	str r0, [sp, 0x24]
	adds r0, r6, 0x2
	str r0, [sp, 0x4]
	adds r0, r6, 0x4
	str r0, [sp, 0x8]
	adds r0, r6, 0x6
	str r0, [sp, 0xC]
	adds r0, 0x2
	str r0, [sp, 0x10]
	adds r0, 0x2
	str r0, [sp, 0x14]
	mov r9, r4
	adds r7, r6, 0
	adds r7, 0x24
	adds r4, r6, 0
	adds r4, 0xC
_0802EF6A:
	mov r1, r8
	adds r1, 0xD
	mov r0, r9
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	mov r0, r9
	adds r2, r7, 0
	bl SetMonData
	adds r7, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _0802EF6A
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0802F098 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	mov r2, r10
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x20
	ldr r2, [sp, 0x20]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x19
	ldr r2, [sp, 0x28]
	bl SetMonData
	ldrb r0, [r6, 0x14]
	lsls r0, 27
	lsrs r0, 27
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x27
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x14]
	lsls r0, 22
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x28
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x15]
	lsls r0, 25
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x29
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldr r0, [r6, 0x14]
	lsls r0, 12
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2A
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x16]
	lsls r0, 23
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2B
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x17]
	lsls r0, 26
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2C
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0
	ldr r2, [sp, 0x2C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x37
	ldr r2, [sp, 0x30]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x38
	ldr r2, [sp, 0x1C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x39
	ldr r2, [sp, 0x18]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3A
	ldr r2, [sp, 0x24]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3B
	ldr r2, [sp, 0x4]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3C
	ldr r2, [sp, 0x8]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3D
	ldr r2, [sp, 0xC]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3E
	ldr r2, [sp, 0x10]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3F
	ldr r2, [sp, 0x14]
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F098: .4byte gPlayerParty
_0802F09C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F0B4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F0B8 @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xB
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F0B4: .4byte gPlayerParty
_0802F0B8: .4byte gActiveBank
_0802F0BC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F0D4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F0D8 @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xC
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F0D4: .4byte gPlayerParty
_0802F0D8: .4byte gActiveBank
_0802F0DC:
	movs r0, 0
	mov r8, r0
	movs r0, 0xC
	adds r0, r3
	mov r9, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0802F130 @ =gPlayerParty
	adds r7, r1, r0
	adds r6, r3, 0
	adds r6, 0x8
	adds r4, r3, 0
_0802F0F6:
	mov r1, r8
	adds r1, 0xD
	adds r0, r7, 0
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	adds r0, r7, 0
	adds r2, r6, 0
	bl SetMonData
	adds r6, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _0802F0F6
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F130 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	mov r2, r9
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F130: .4byte gPlayerParty
_0802F134:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F150 @ =gPlayerParty
	adds r0, r1
	ldr r3, _0802F154 @ =gBattleBufferA
	ldr r1, _0802F158 @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x9
	b _0802F1D8
	.align 2, 0
_0802F150: .4byte gPlayerParty
_0802F154: .4byte gBattleBufferA
_0802F158: .4byte gActiveBank
_0802F15C:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0802F1B8 @ =gPlayerParty
	adds r4, r0
	ldr r5, _0802F1BC @ =gActiveBank
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x11
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x12
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x13
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x14
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F1B8: .4byte gPlayerParty
_0802F1BC: .4byte gActiveBank
_0802F1C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F1E4 @ =gPlayerParty
	adds r0, r1
	ldr r3, _0802F1E8 @ =gBattleBufferA
	ldr r1, _0802F1EC @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x8
_0802F1D8:
	adds r3, 0x3
	adds r2, r3
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F1E4: .4byte gPlayerParty
_0802F1E8: .4byte gBattleBufferA
_0802F1EC: .4byte gActiveBank
_0802F1F0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F208 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F20C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F208: .4byte gPlayerParty
_0802F20C: .4byte gActiveBank
_0802F210:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F228 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F22C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x19
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F228: .4byte gPlayerParty
_0802F22C: .4byte gActiveBank
_0802F230:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F248 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F24C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1A
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F248: .4byte gPlayerParty
_0802F24C: .4byte gActiveBank
_0802F250:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F268 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F26C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1B
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F268: .4byte gPlayerParty
_0802F26C: .4byte gActiveBank
_0802F270:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F288 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F28C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1C
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F288: .4byte gPlayerParty
_0802F28C: .4byte gActiveBank
_0802F290:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F2A8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F2AC @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1D
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F2A8: .4byte gPlayerParty
_0802F2AC: .4byte gActiveBank
_0802F2B0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F2C8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F2CC @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1E
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F2C8: .4byte gPlayerParty
_0802F2CC: .4byte gActiveBank
_0802F2D0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F2E8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F2EC @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1F
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F2E8: .4byte gPlayerParty
_0802F2EC: .4byte gActiveBank
_0802F2F0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F308 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F30C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x20
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F308: .4byte gPlayerParty
_0802F30C: .4byte gActiveBank
_0802F310:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F328 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F32C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x22
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F328: .4byte gPlayerParty
_0802F32C: .4byte gActiveBank
_0802F330:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F348 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F34C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x23
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F348: .4byte gPlayerParty
_0802F34C: .4byte gActiveBank
_0802F350:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F368 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F36C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x24
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F368: .4byte gPlayerParty
_0802F36C: .4byte gActiveBank
_0802F370:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F388 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F38C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x25
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F388: .4byte gPlayerParty
_0802F38C: .4byte gActiveBank
_0802F390:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F3A8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F3AC @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x26
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F3A8: .4byte gPlayerParty
_0802F3AC: .4byte gActiveBank
_0802F3B0:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0802F418 @ =gPlayerParty
	adds r4, r0
	ldr r5, _0802F41C @ =gActiveBank
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x27
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x28
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x29
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2A
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2B
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x5
	adds r2, r0
	adds r0, r4, 0
	b _0802F4D0
	.align 2, 0
_0802F418: .4byte gPlayerParty
_0802F41C: .4byte gActiveBank
_0802F420:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F438 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F43C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x27
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F438: .4byte gPlayerParty
_0802F43C: .4byte gActiveBank
_0802F440:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F458 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F45C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x28
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F458: .4byte gPlayerParty
_0802F45C: .4byte gActiveBank
_0802F460:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F478 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F47C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x29
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F478: .4byte gPlayerParty
_0802F47C: .4byte gActiveBank
_0802F480:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F498 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F49C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2A
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F498: .4byte gPlayerParty
_0802F49C: .4byte gActiveBank
_0802F4A0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F4B8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F4BC @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2B
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F4B8: .4byte gPlayerParty
_0802F4BC: .4byte gActiveBank
_0802F4C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F4D8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F4DC @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
_0802F4D0:
	movs r1, 0x2C
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F4D8: .4byte gPlayerParty
_0802F4DC: .4byte gActiveBank
_0802F4E0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F4F8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F4FC @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F4F8: .4byte gPlayerParty
_0802F4FC: .4byte gActiveBank
_0802F500:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F518 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F51C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x9
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F518: .4byte gPlayerParty
_0802F51C: .4byte gActiveBank
_0802F520:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F538 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F53C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x37
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F538: .4byte gPlayerParty
_0802F53C: .4byte gActiveBank
_0802F540:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F558 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F55C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x38
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F558: .4byte gPlayerParty
_0802F55C: .4byte gActiveBank
_0802F560:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F578 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F57C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x39
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F578: .4byte gPlayerParty
_0802F57C: .4byte gActiveBank
_0802F580:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F598 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F59C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3A
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F598: .4byte gPlayerParty
_0802F59C: .4byte gActiveBank
_0802F5A0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F5B8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F5BC @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3B
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F5B8: .4byte gPlayerParty
_0802F5BC: .4byte gActiveBank
_0802F5C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F5D8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F5DC @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3C
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F5D8: .4byte gPlayerParty
_0802F5DC: .4byte gActiveBank
_0802F5E0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F5F8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F5FC @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3D
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F5F8: .4byte gPlayerParty
_0802F5FC: .4byte gActiveBank
_0802F600:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F618 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F61C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3E
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F618: .4byte gPlayerParty
_0802F61C: .4byte gActiveBank
_0802F620:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F638 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F63C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3F
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F638: .4byte gPlayerParty
_0802F63C: .4byte gActiveBank
_0802F640:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F658 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F65C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x16
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F658: .4byte gPlayerParty
_0802F65C: .4byte gActiveBank
_0802F660:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F678 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F67C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x17
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F678: .4byte gPlayerParty
_0802F67C: .4byte gActiveBank
_0802F680:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F698 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F69C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x18
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F698: .4byte gPlayerParty
_0802F69C: .4byte gActiveBank
_0802F6A0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F6B8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F6BC @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x21
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F6B8: .4byte gPlayerParty
_0802F6BC: .4byte gActiveBank
_0802F6C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F6D8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F6DC @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2F
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F6D8: .4byte gPlayerParty
_0802F6DC: .4byte gActiveBank
_0802F6E0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F6F8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F6FC @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x30
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F6F8: .4byte gPlayerParty
_0802F6FC: .4byte gActiveBank
_0802F700:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F718 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F71C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x32
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F718: .4byte gPlayerParty
_0802F71C: .4byte gActiveBank
_0802F720:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F738 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F73C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x33
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F738: .4byte gPlayerParty
_0802F73C: .4byte gActiveBank
_0802F740:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F758 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F75C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x34
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F758: .4byte gPlayerParty
_0802F75C: .4byte gActiveBank
_0802F760:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F778 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F77C @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x35
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F778: .4byte gPlayerParty
_0802F77C: .4byte gActiveBank
_0802F780:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F7C0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F7C4 @ =gActiveBank
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x36
	bl SetMonData
_0802F796:
	ldr r2, _0802F7C8 @ =gBattlePartyID
	ldr r0, _0802F7C4 @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0802F7C0 @ =gPlayerParty
	adds r0, r2
	bl sub_80324F8
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F7C0: .4byte gPlayerParty
_0802F7C4: .4byte gActiveBank
_0802F7C8: .4byte gBattlePartyID
	thumb_func_end dp01_setattr_by_ch1_for_player_pokemon

	thumb_func_start sub_802F7CC
sub_802F7CC: @ 802F7CC
	push {r4-r7,lr}
	ldr r1, _0802F830 @ =gBattlePartyID
	ldr r7, _0802F834 @ =gActiveBank
	ldrb r2, [r7]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	adds r3, r1, 0
	muls r3, r0
	ldr r4, _0802F838 @ =gBattleBufferA
	lsls r2, 9
	adds r0, r4, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, _0802F83C @ =gPlayerParty
	adds r0, r1
	adds r5, r3, r0
	movs r3, 0
	adds r0, r4, 0x2
	adds r2, r0
	ldrb r2, [r2]
	cmp r3, r2
	bcs _0802F824
	adds r6, r4, 0
	adds r2, r7, 0
	adds r4, r0, 0
_0802F802:
	adds r1, r5, r3
	ldrb r0, [r2]
	lsls r0, 9
	adds r0, 0x3
	adds r0, r3, r0
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r2]
	lsls r0, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r3, r0
	bcc _0802F802
_0802F824:
	bl PlayerBufferExecCompleted
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F830: .4byte gBattlePartyID
_0802F834: .4byte gActiveBank
_0802F838: .4byte gBattleBufferA
_0802F83C: .4byte gPlayerParty
	thumb_func_end sub_802F7CC

	thumb_func_start PlayerHandleLoadPokeSprite
PlayerHandleLoadPokeSprite: @ 802F840
	push {r4,lr}
	ldr r2, _0802F88C @ =gBattlePartyID
	ldr r4, _0802F890 @ =gActiveBank
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0802F894 @ =gPlayerParty
	adds r0, r2
	bl sub_80318FC
	ldr r2, _0802F898 @ =gSprites
	ldr r0, _0802F89C @ =gObjectBankIDs
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldr r1, _0802F8A0 @ =gBattleBankFunc
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802F8A4 @ =bx_0802E404
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F88C: .4byte gBattlePartyID
_0802F890: .4byte gActiveBank
_0802F894: .4byte gPlayerParty
_0802F898: .4byte gSprites
_0802F89C: .4byte gObjectBankIDs
_0802F8A0: .4byte gBattleBankFunc
_0802F8A4: .4byte bx_0802E404
	thumb_func_end PlayerHandleLoadPokeSprite

	thumb_func_start PlayerHandleSendOutPoke
PlayerHandleSendOutPoke: @ 802F8A8
	push {r4-r6,lr}
	ldr r5, _0802F914 @ =gActiveBank
	ldrb r0, [r5]
	ldr r4, _0802F918 @ =gBattleBufferA
	lsls r1, r0, 9
	adds r6, r4, 0x2
	adds r1, r6
	ldrb r1, [r1]
	bl sub_8032AA8
	ldr r2, _0802F91C @ =gBattlePartyID
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r2
	lsls r0, 9
	adds r4, 0x1
	adds r0, r4
	ldrb r0, [r0]
	movs r4, 0
	strh r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0802F920 @ =gPlayerParty
	adds r0, r2
	bl sub_80318FC
	ldr r1, _0802F924 @ =gActionSelectionCursor
	ldrb r0, [r5]
	adds r0, r1
	strb r4, [r0]
	ldr r1, _0802F928 @ =gMoveSelectionCursor
	ldrb r0, [r5]
	adds r0, r1
	strb r4, [r0]
	ldrb r0, [r5]
	lsls r1, r0, 9
	adds r1, r6
	ldrb r1, [r1]
	bl sub_802F934
	ldr r1, _0802F92C @ =gBattleBankFunc
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802F930 @ =sub_802D798
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802F914: .4byte gActiveBank
_0802F918: .4byte gBattleBufferA
_0802F91C: .4byte gBattlePartyID
_0802F920: .4byte gPlayerParty
_0802F924: .4byte gActionSelectionCursor
_0802F928: .4byte gMoveSelectionCursor
_0802F92C: .4byte gBattleBankFunc
_0802F930: .4byte sub_802D798
	thumb_func_end PlayerHandleSendOutPoke

	.align 2, 0 @ Don't pad with nop.
