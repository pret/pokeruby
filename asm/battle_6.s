	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text
	
	thumb_func_start dp01t_00_1_getattr
dp01t_00_1_getattr: @ 802E4D0
	push {r4-r6,lr}
	sub sp, 0x100
	movs r6, 0
	ldr r1, _0802E4FC @ =gUnknown_02023A60
	ldr r0, _0802E500 @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _0802E508
	ldr r0, _0802E504 @ =gUnknown_02024A6A
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl dp01_getattr_by_ch1_for_player_pokemon_
	adds r6, r0, 0
	b _0802E52A
	.align 2, 0
_0802E4FC: .4byte gUnknown_02023A60
_0802E500: .4byte gUnknown_02024A60
_0802E504: .4byte gUnknown_02024A6A
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
	bl dp01_tbl1_exec_completed
	add sp, 0x100
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end dp01t_00_1_getattr

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
	ldr r2, _0802E578 @ =gUnknown_02023A60
	ldr r3, _0802E57C @ =gUnknown_02024A60
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
_0802E578: .4byte gUnknown_02023A60
_0802E57C: .4byte gUnknown_02024A60
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
	ldr r2, _0802ED68 @ =gUnknown_02024A6A
	ldr r5, _0802ED6C @ =gUnknown_02024A60
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	adds r4, r2, 0
	muls r4, r0
	ldr r3, _0802ED70 @ =gUnknown_02023A60
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
	bl dp01_tbl1_exec_completed
	add sp, 0x58
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802ED68: .4byte gUnknown_02024A6A
_0802ED6C: .4byte gUnknown_02024A60
_0802ED70: .4byte gUnknown_02023A60
_0802ED74: .4byte gPlayerParty
	thumb_func_end sub_802ECF0

	thumb_func_start dp01t_02_1_setattr
dp01t_02_1_setattr: @ 802ED78
	push {r4,r5,lr}
	ldr r1, _0802ED9C @ =gUnknown_02023A60
	ldr r0, _0802EDA0 @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _0802EDA8
	ldr r0, _0802EDA4 @ =gUnknown_02024A6A
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	bl dp01_setattr_by_ch1_for_player_pokemon
	b _0802EDC6
	.align 2, 0
_0802ED9C: .4byte gUnknown_02023A60
_0802EDA0: .4byte gUnknown_02024A60
_0802EDA4: .4byte gUnknown_02024A6A
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
	bl dp01_tbl1_exec_completed
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end dp01t_02_1_setattr

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
	ldr r0, _0802EE08 @ =gUnknown_02024A60
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
_0802EE08: .4byte gUnknown_02024A60
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
	ldr r1, _0802F0B8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xB
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F0B4: .4byte gPlayerParty
_0802F0B8: .4byte gUnknown_02024A60
_0802F0BC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F0D4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F0D8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xC
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F0D4: .4byte gPlayerParty
_0802F0D8: .4byte gUnknown_02024A60
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
	ldr r3, _0802F154 @ =gUnknown_02023A60
	ldr r1, _0802F158 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x9
	b _0802F1D8
	.align 2, 0
_0802F150: .4byte gPlayerParty
_0802F154: .4byte gUnknown_02023A60
_0802F158: .4byte gUnknown_02024A60
_0802F15C:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0802F1B8 @ =gPlayerParty
	adds r4, r0
	ldr r5, _0802F1BC @ =gUnknown_02024A60
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
_0802F1BC: .4byte gUnknown_02024A60
_0802F1C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F1E4 @ =gPlayerParty
	adds r0, r1
	ldr r3, _0802F1E8 @ =gUnknown_02023A60
	ldr r1, _0802F1EC @ =gUnknown_02024A60
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
_0802F1E8: .4byte gUnknown_02023A60
_0802F1EC: .4byte gUnknown_02024A60
_0802F1F0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F208 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F20C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F208: .4byte gPlayerParty
_0802F20C: .4byte gUnknown_02024A60
_0802F210:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F228 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F22C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x19
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F228: .4byte gPlayerParty
_0802F22C: .4byte gUnknown_02024A60
_0802F230:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F248 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F24C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1A
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F248: .4byte gPlayerParty
_0802F24C: .4byte gUnknown_02024A60
_0802F250:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F268 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F26C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1B
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F268: .4byte gPlayerParty
_0802F26C: .4byte gUnknown_02024A60
_0802F270:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F288 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F28C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1C
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F288: .4byte gPlayerParty
_0802F28C: .4byte gUnknown_02024A60
_0802F290:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F2A8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F2AC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1D
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F2A8: .4byte gPlayerParty
_0802F2AC: .4byte gUnknown_02024A60
_0802F2B0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F2C8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F2CC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1E
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F2C8: .4byte gPlayerParty
_0802F2CC: .4byte gUnknown_02024A60
_0802F2D0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F2E8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F2EC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1F
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F2E8: .4byte gPlayerParty
_0802F2EC: .4byte gUnknown_02024A60
_0802F2F0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F308 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F30C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x20
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F308: .4byte gPlayerParty
_0802F30C: .4byte gUnknown_02024A60
_0802F310:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F328 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F32C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x22
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F328: .4byte gPlayerParty
_0802F32C: .4byte gUnknown_02024A60
_0802F330:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F348 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F34C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x23
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F348: .4byte gPlayerParty
_0802F34C: .4byte gUnknown_02024A60
_0802F350:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F368 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F36C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x24
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F368: .4byte gPlayerParty
_0802F36C: .4byte gUnknown_02024A60
_0802F370:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F388 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F38C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x25
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F388: .4byte gPlayerParty
_0802F38C: .4byte gUnknown_02024A60
_0802F390:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F3A8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F3AC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x26
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F3A8: .4byte gPlayerParty
_0802F3AC: .4byte gUnknown_02024A60
_0802F3B0:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0802F418 @ =gPlayerParty
	adds r4, r0
	ldr r5, _0802F41C @ =gUnknown_02024A60
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
_0802F41C: .4byte gUnknown_02024A60
_0802F420:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F438 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F43C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x27
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F438: .4byte gPlayerParty
_0802F43C: .4byte gUnknown_02024A60
_0802F440:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F458 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F45C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x28
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F458: .4byte gPlayerParty
_0802F45C: .4byte gUnknown_02024A60
_0802F460:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F478 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F47C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x29
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F478: .4byte gPlayerParty
_0802F47C: .4byte gUnknown_02024A60
_0802F480:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F498 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F49C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2A
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F498: .4byte gPlayerParty
_0802F49C: .4byte gUnknown_02024A60
_0802F4A0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F4B8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F4BC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2B
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F4B8: .4byte gPlayerParty
_0802F4BC: .4byte gUnknown_02024A60
_0802F4C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F4D8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F4DC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
_0802F4D0:
	movs r1, 0x2C
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F4D8: .4byte gPlayerParty
_0802F4DC: .4byte gUnknown_02024A60
_0802F4E0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F4F8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F4FC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F4F8: .4byte gPlayerParty
_0802F4FC: .4byte gUnknown_02024A60
_0802F500:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F518 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F51C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x9
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F518: .4byte gPlayerParty
_0802F51C: .4byte gUnknown_02024A60
_0802F520:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F538 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F53C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x37
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F538: .4byte gPlayerParty
_0802F53C: .4byte gUnknown_02024A60
_0802F540:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F558 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F55C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x38
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F558: .4byte gPlayerParty
_0802F55C: .4byte gUnknown_02024A60
_0802F560:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F578 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F57C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x39
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F578: .4byte gPlayerParty
_0802F57C: .4byte gUnknown_02024A60
_0802F580:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F598 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F59C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3A
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F598: .4byte gPlayerParty
_0802F59C: .4byte gUnknown_02024A60
_0802F5A0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F5B8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F5BC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3B
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F5B8: .4byte gPlayerParty
_0802F5BC: .4byte gUnknown_02024A60
_0802F5C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F5D8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F5DC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3C
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F5D8: .4byte gPlayerParty
_0802F5DC: .4byte gUnknown_02024A60
_0802F5E0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F5F8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F5FC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3D
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F5F8: .4byte gPlayerParty
_0802F5FC: .4byte gUnknown_02024A60
_0802F600:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F618 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F61C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3E
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F618: .4byte gPlayerParty
_0802F61C: .4byte gUnknown_02024A60
_0802F620:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F638 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F63C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3F
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F638: .4byte gPlayerParty
_0802F63C: .4byte gUnknown_02024A60
_0802F640:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F658 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F65C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x16
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F658: .4byte gPlayerParty
_0802F65C: .4byte gUnknown_02024A60
_0802F660:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F678 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F67C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x17
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F678: .4byte gPlayerParty
_0802F67C: .4byte gUnknown_02024A60
_0802F680:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F698 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F69C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x18
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F698: .4byte gPlayerParty
_0802F69C: .4byte gUnknown_02024A60
_0802F6A0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F6B8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F6BC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x21
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F6B8: .4byte gPlayerParty
_0802F6BC: .4byte gUnknown_02024A60
_0802F6C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F6D8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F6DC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2F
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F6D8: .4byte gPlayerParty
_0802F6DC: .4byte gUnknown_02024A60
_0802F6E0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F6F8 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F6FC @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x30
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F6F8: .4byte gPlayerParty
_0802F6FC: .4byte gUnknown_02024A60
_0802F700:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F718 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F71C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x32
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F718: .4byte gPlayerParty
_0802F71C: .4byte gUnknown_02024A60
_0802F720:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F738 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F73C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x33
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F738: .4byte gPlayerParty
_0802F73C: .4byte gUnknown_02024A60
_0802F740:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F758 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F75C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x34
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F758: .4byte gPlayerParty
_0802F75C: .4byte gUnknown_02024A60
_0802F760:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F778 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F77C @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x35
	bl SetMonData
	b _0802F796
	.align 2, 0
_0802F778: .4byte gPlayerParty
_0802F77C: .4byte gUnknown_02024A60
_0802F780:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0802F7C0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0802F7C4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x36
	bl SetMonData
_0802F796:
	ldr r2, _0802F7C8 @ =gUnknown_02024A6A
	ldr r0, _0802F7C4 @ =gUnknown_02024A60
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
_0802F7C4: .4byte gUnknown_02024A60
_0802F7C8: .4byte gUnknown_02024A6A
	thumb_func_end dp01_setattr_by_ch1_for_player_pokemon

	thumb_func_start sub_802F7CC
sub_802F7CC: @ 802F7CC
	push {r4-r7,lr}
	ldr r1, _0802F830 @ =gUnknown_02024A6A
	ldr r7, _0802F834 @ =gUnknown_02024A60
	ldrb r2, [r7]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	adds r3, r1, 0
	muls r3, r0
	ldr r4, _0802F838 @ =gUnknown_02023A60
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
	bl dp01_tbl1_exec_completed
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F830: .4byte gUnknown_02024A6A
_0802F834: .4byte gUnknown_02024A60
_0802F838: .4byte gUnknown_02023A60
_0802F83C: .4byte gPlayerParty
	thumb_func_end sub_802F7CC

	thumb_func_start sub_802F840
sub_802F840: @ 802F840
	push {r4,lr}
	ldr r2, _0802F88C @ =gUnknown_02024A6A
	ldr r4, _0802F890 @ =gUnknown_02024A60
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
	ldr r0, _0802F89C @ =gUnknown_02024BE0
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
	ldr r1, _0802F8A0 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802F8A4 @ =bx_0802E404
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F88C: .4byte gUnknown_02024A6A
_0802F890: .4byte gUnknown_02024A60
_0802F894: .4byte gPlayerParty
_0802F898: .4byte gSprites
_0802F89C: .4byte gUnknown_02024BE0
_0802F8A0: .4byte gUnknown_03004330
_0802F8A4: .4byte bx_0802E404
	thumb_func_end sub_802F840

	thumb_func_start sub_802F8A8
sub_802F8A8: @ 802F8A8
	push {r4-r6,lr}
	ldr r5, _0802F914 @ =gUnknown_02024A60
	ldrb r0, [r5]
	ldr r4, _0802F918 @ =gUnknown_02023A60
	lsls r1, r0, 9
	adds r6, r4, 0x2
	adds r1, r6
	ldrb r1, [r1]
	bl sub_8032AA8
	ldr r2, _0802F91C @ =gUnknown_02024A6A
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
	ldr r1, _0802F924 @ =gUnknown_02024E60
	ldrb r0, [r5]
	adds r0, r1
	strb r4, [r0]
	ldr r1, _0802F928 @ =gUnknown_02024E64
	ldrb r0, [r5]
	adds r0, r1
	strb r4, [r0]
	ldrb r0, [r5]
	lsls r1, r0, 9
	adds r1, r6
	ldrb r1, [r1]
	bl sub_802F934
	ldr r1, _0802F92C @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802F930 @ =sub_802D798
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802F914: .4byte gUnknown_02024A60
_0802F918: .4byte gUnknown_02023A60
_0802F91C: .4byte gUnknown_02024A6A
_0802F920: .4byte gPlayerParty
_0802F924: .4byte gUnknown_02024E60
_0802F928: .4byte gUnknown_02024E64
_0802F92C: .4byte gUnknown_03004330
_0802F930: .4byte sub_802D798
	thumb_func_end sub_802F8A8

	thumb_func_start sub_802F934
sub_802F934: @ 802F934
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8032AA8
	ldr r0, _0802FA78 @ =gUnknown_02024A6A
	lsls r2, r6, 1
	adds r2, r0
	ldr r0, _0802FA7C @ =gUnknown_02023A60
	lsls r1, r6, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0802FA80 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _0802FA84 @ =sub_80312F0
	bl CreateInvisibleSpriteWithCallback
	ldr r1, _0802FA88 @ =gUnknown_0300434C
	mov r9, r1
	add r9, r6
	mov r1, r9
	strb r0, [r1]
	adds r0, r6, 0
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _0802FA8C @ =gUnknown_02024E8C
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	bl sub_8077F68
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r10
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _0802FA90 @ =gUnknown_02024BE0
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _0802FA94 @ =gSprites
	mov r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x2E]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r6, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0802FA98 @ =gBattleMonForms
	adds r6, r1
	ldrb r1, [r6]
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0802FA9C @ =SpriteCallbackDummy
	str r1, [r0]
	movs r0, 0
	movs r1, 0xFF
	bl sub_8046400
	mov r1, r9
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x2E]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802FA78: .4byte gUnknown_02024A6A
_0802FA7C: .4byte gUnknown_02023A60
_0802FA80: .4byte gPlayerParty
_0802FA84: .4byte sub_80312F0
_0802FA88: .4byte gUnknown_0300434C
_0802FA8C: .4byte gUnknown_02024E8C
_0802FA90: .4byte gUnknown_02024BE0
_0802FA94: .4byte gSprites
_0802FA98: .4byte gBattleMonForms
_0802FA9C: .4byte SpriteCallbackDummy
	thumb_func_end sub_802F934

	thumb_func_start sub_802FAA0
sub_802FAA0: @ 802FAA0
	push {r4-r6,lr}
	ldr r1, _0802FAD0 @ =gUnknown_02023A60
	ldr r6, _0802FAD4 @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r3, [r0]
	cmp r3, 0
	bne _0802FAE4
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _0802FAD8 @ =0x02017810
	adds r0, r1
	strb r3, [r0, 0x4]
	ldr r1, _0802FADC @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802FAE0 @ =sub_802FB2C
	str r1, [r0]
	b _0802FB1A
	.align 2, 0
_0802FAD0: .4byte gUnknown_02023A60
_0802FAD4: .4byte gUnknown_02024A60
_0802FAD8: .4byte 0x02017810
_0802FADC: .4byte gUnknown_03004330
_0802FAE0: .4byte sub_802FB2C
_0802FAE4:
	ldr r5, _0802FB20 @ =gUnknown_02024BE0
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0802FB24 @ =gSprites
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, _0802FB28 @ =gUnknown_03004340
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl dp01_tbl1_exec_completed
_0802FB1A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802FB20: .4byte gUnknown_02024BE0
_0802FB24: .4byte gSprites
_0802FB28: .4byte gUnknown_03004340
	thumb_func_end sub_802FAA0

	thumb_func_start sub_802FB2C
sub_802FB2C: @ 802FB2C
	push {r4,r5,lr}
	ldr r5, _0802FB48 @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r4, _0802FB4C @ =0x02017810
	adds r3, r0, r4
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	beq _0802FB50
	cmp r0, 0x1
	beq _0802FB7C
	b _0802FBA4
	.align 2, 0
_0802FB48: .4byte gUnknown_02024A60
_0802FB4C: .4byte 0x02017810
_0802FB50:
	lsls r0, r2, 2
	adds r1, r4, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0802FB6C
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl move_anim_start_t4
_0802FB6C:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _0802FBA4
_0802FB7C:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0802FBA4
	strb r0, [r3, 0x4]
	ldrb r2, [r5]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x1
	bl move_anim_start_t4
	ldr r1, _0802FBAC @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802FBB0 @ =sub_802DEAC
	str r1, [r0]
_0802FBA4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802FBAC: .4byte gUnknown_03004330
_0802FBB0: .4byte sub_802DEAC
	thumb_func_end sub_802FB2C

	thumb_func_start sub_802FBB4
sub_802FBB4: @ 802FBB4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _0802FBDC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0802FBE8
	ldr r0, _0802FBE0 @ =gUnknown_02024A60
	ldrb r0, [r0]
	bl battle_get_per_side_status
	movs r1, 0x2
	ands r1, r0
	ldr r7, _0802FBE4 @ =0x0000fff0
	cmp r1, 0
	beq _0802FBEA
	movs r7, 0x10
	b _0802FBEA
	.align 2, 0
_0802FBDC: .4byte gBattleTypeFlags
_0802FBE0: .4byte gUnknown_02024A60
_0802FBE4: .4byte 0x0000fff0
_0802FBE8:
	movs r7, 0
_0802FBEA:
	ldr r4, _0802FCB8 @ =gSaveBlock2
	ldrb r0, [r4, 0x8]
	ldr r6, _0802FCBC @ =gUnknown_02024A60
	ldrb r1, [r6]
	bl sub_8031AF4
	ldrb r5, [r4, 0x8]
	ldrb r0, [r6]
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl GetMonSpriteTemplate_803C5A0
	ldr r0, _0802FCC0 @ =gUnknown_02024E8C
	mov r8, r0
	lsls r5, r7, 16
	movs r0, 0xA0
	lsls r0, 15
	adds r5, r0
	asrs r5, 16
	ldr r1, _0802FCC4 @ =gTrainerBackPicCoords
	ldrb r0, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r0, 0xA0
	lsls r0, 15
	adds r4, r0
	asrs r4, 16
	ldrb r0, [r6]
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r5, _0802FCC8 @ =gUnknown_02024BE0
	ldrb r1, [r6]
	adds r1, r5
	strb r0, [r1]
	ldr r4, _0802FCCC @ =gSprites
	ldrb r3, [r6]
	adds r0, r3, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xF0
	strh r1, [r0, 0x24]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0802FCD0 @ =0x0000fffe
	strh r1, [r0, 0x2E]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _0802FCD4 @ =sub_80313A0
	str r1, [r0]
	ldr r1, _0802FCD8 @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802FCDC @ =sub_802D204
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802FCB8: .4byte gSaveBlock2
_0802FCBC: .4byte gUnknown_02024A60
_0802FCC0: .4byte gUnknown_02024E8C
_0802FCC4: .4byte gTrainerBackPicCoords
_0802FCC8: .4byte gUnknown_02024BE0
_0802FCCC: .4byte gSprites
_0802FCD0: .4byte 0x0000fffe
_0802FCD4: .4byte sub_80313A0
_0802FCD8: .4byte gUnknown_03004330
_0802FCDC: .4byte sub_802D204
	thumb_func_end sub_802FBB4

	thumb_func_start sub_802FCE0
sub_802FCE0: @ 802FCE0
	push {r4-r6,lr}
	ldr r4, _0802FD94 @ =gSaveBlock2
	ldrb r0, [r4, 0x8]
	ldr r5, _0802FD98 @ =gUnknown_02024A60
	ldrb r1, [r5]
	bl sub_8031AF4
	ldrb r6, [r4, 0x8]
	ldrb r0, [r5]
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl GetMonSpriteTemplate_803C5A0
	ldr r0, _0802FD9C @ =gUnknown_02024E8C
	ldr r2, _0802FDA0 @ =gTrainerBackPicCoords
	ldrb r1, [r4, 0x8]
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x50
	movs r3, 0x1E
	bl CreateSprite
	ldr r6, _0802FDA4 @ =gUnknown_02024BE0
	ldrb r1, [r5]
	adds r1, r6
	strb r0, [r1]
	ldr r4, _0802FDA8 @ =gSprites
	ldrb r3, [r5]
	adds r0, r3, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0802FDAC @ =0x0000ffa0
	strh r1, [r0, 0x24]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldrb r0, [r5]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _0802FDB0 @ =sub_80313A0
	str r1, [r0]
	ldr r1, _0802FDB4 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802FDB8 @ =sub_802D23C
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802FD94: .4byte gSaveBlock2
_0802FD98: .4byte gUnknown_02024A60
_0802FD9C: .4byte gUnknown_02024E8C
_0802FDA0: .4byte gTrainerBackPicCoords
_0802FDA4: .4byte gUnknown_02024BE0
_0802FDA8: .4byte gSprites
_0802FDAC: .4byte 0x0000ffa0
_0802FDB0: .4byte sub_80313A0
_0802FDB4: .4byte gUnknown_03004330
_0802FDB8: .4byte sub_802D23C
	thumb_func_end sub_802FCE0

	thumb_func_start sub_802FDBC
sub_802FDBC: @ 802FDBC
	push {r4-r6,lr}
	ldr r5, _0802FE5C @ =gUnknown_02024BE0
	ldr r6, _0802FE60 @ =gUnknown_02024A60
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0802FE64 @ =gSprites
	adds r0, r4
	bl oamt_add_pos2_onto_pos1
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x32
	strh r1, [r0, 0x2E]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0802FE68 @ =0x0000ffd8
	strh r1, [r0, 0x32]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0802FE6C @ =sub_8078B34
	str r1, [r0]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0802FE70 @ =SpriteCallbackDummy
	bl oamt_set_x3A_32
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r1, _0802FE74 @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802FE78 @ =sub_802D274
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802FE5C: .4byte gUnknown_02024BE0
_0802FE60: .4byte gUnknown_02024A60
_0802FE64: .4byte gSprites
_0802FE68: .4byte 0x0000ffd8
_0802FE6C: .4byte sub_8078B34
_0802FE70: .4byte SpriteCallbackDummy
_0802FE74: .4byte gUnknown_03004330
_0802FE78: .4byte sub_802D274
	thumb_func_end sub_802FDBC

	thumb_func_start sub_802FE7C
sub_802FE7C: @ 802FE7C
	push {r4,r5,lr}
	ldr r5, _0802FEC0 @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r4, _0802FEC4 @ =0x02017810
	adds r3, r0, r4
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	bne _0802FEC8
	lsls r0, r2, 2
	adds r1, r4, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0802FEAE
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl move_anim_start_t4
_0802FEAE:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _0802FF3E
	.align 2, 0
_0802FEC0: .4byte gUnknown_02024A60
_0802FEC4: .4byte 0x02017810
_0802FEC8:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0802FF3E
	strb r4, [r3, 0x4]
	ldr r2, _0802FF44 @ =gUnknown_02024A6A
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0802FF48 @ =gPlayerParty
	adds r0, r2
	bl sub_80324F8
	movs r1, 0x40
	negs r1, r1
	movs r0, 0x10
	bl PlaySoundEffect12WithPanning
	ldr r2, _0802FF4C @ =gSprites
	ldr r3, _0802FF50 @ =gUnknown_02024BE0
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x30]
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x5
	strh r1, [r0, 0x32]
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0802FF54 @ =sub_80105EC
	str r1, [r0]
	ldr r1, _0802FF58 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802FF5C @ =sub_802DE10
	str r1, [r0]
_0802FF3E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802FF44: .4byte gUnknown_02024A6A
_0802FF48: .4byte gPlayerParty
_0802FF4C: .4byte gSprites
_0802FF50: .4byte gUnknown_02024BE0
_0802FF54: .4byte sub_80105EC
_0802FF58: .4byte gUnknown_03004330
_0802FF5C: .4byte sub_802DE10
	thumb_func_end sub_802FE7C

	thumb_func_start sub_802FF60
sub_802FF60: @ 802FF60
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	bl dp01_tbl1_exec_completed
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end sub_802FF60

	thumb_func_start sub_802FF80
sub_802FF80: @ 802FF80
	push {r4,r5,lr}
	ldr r1, _0802FFBC @ =0x02017840
	movs r0, 0x4
	strb r0, [r1, 0x8]
	ldr r1, _0802FFC0 @ =gUnknown_02024E6D
	movs r0, 0x1
	strb r0, [r1]
	ldr r5, _0802FFC4 @ =gUnknown_02024A60
	ldrb r4, [r5]
	movs r0, 0x1
	bl battle_get_side_with_given_state
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x3
	bl move_anim_start_t4
	ldr r1, _0802FFC8 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0802FFCC @ =bx_wait_t1
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802FFBC: .4byte 0x02017840
_0802FFC0: .4byte gUnknown_02024E6D
_0802FFC4: .4byte gUnknown_02024A60
_0802FFC8: .4byte gUnknown_03004330
_0802FFCC: .4byte bx_wait_t1
	thumb_func_end sub_802FF80

	thumb_func_start sub_802FFD0
sub_802FFD0: @ 802FFD0
	push {r4,r5,lr}
	ldr r1, _08030014 @ =gUnknown_02023A60
	ldr r5, _08030018 @ =gUnknown_02024A60
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _0803001C @ =0x02017840
	strb r1, [r0, 0x8]
	ldr r1, _08030020 @ =gUnknown_02024E6D
	movs r0, 0x1
	strb r0, [r1]
	ldrb r4, [r5]
	movs r0, 0x1
	bl battle_get_side_with_given_state
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r4, 0
	movs r3, 0x3
	bl move_anim_start_t4
	ldr r1, _08030024 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08030028 @ =bx_wait_t1
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030014: .4byte gUnknown_02023A60
_08030018: .4byte gUnknown_02024A60
_0803001C: .4byte 0x02017840
_08030020: .4byte gUnknown_02024E6D
_08030024: .4byte gUnknown_03004330
_08030028: .4byte bx_wait_t1
	thumb_func_end sub_802FFD0

	thumb_func_start sub_803002C
sub_803002C: @ 803002C
	push {lr}
	ldr r1, _08030054 @ =gUnknown_02023A60
	ldr r0, _08030058 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0803004A
_08030040:
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08030040
_0803004A:
	bl dp01_tbl1_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08030054: .4byte gUnknown_02023A60
_08030058: .4byte gUnknown_02024A60
	thumb_func_end sub_803002C

	thumb_func_start dp01t_0F_1_move_anim
dp01t_0F_1_move_anim: @ 803005C
	push {r4-r6,lr}
	ldr r6, _08030140 @ =gUnknown_02024A60
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	beq _0803006E
	b _0803017E
_0803006E:
	ldr r0, _08030144 @ =gUnknown_02023A60
	mov r12, r0
	ldrb r2, [r6]
	lsls r2, 9
	adds r0, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, r12
	adds r1, 0x2
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	ldr r5, _08030148 @ =gUnknown_0202F7C4
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _0803014C @ =gUnknown_0202F7BC
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x4
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x5
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r4, _08030150 @ =gUnknown_0202F7B8
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x6
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x7
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r3, r1
	mov r1, r12
	adds r1, 0x8
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 16
	orrs r3, r1
	mov r1, r12
	adds r1, 0x9
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 24
	orrs r3, r1
	str r3, [r4]
	ldr r3, _08030154 @ =gUnknown_0202F7BE
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _08030158 @ =gUnknown_0202F7C0
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0xC
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0xD
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r3, _0803015C @ =gUnknown_0202F7B4
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _08030160 @ =gUnknown_02024E70
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r3
	ldr r2, [r2]
	str r2, [r1]
	ldrb r1, [r5]
	bl sub_8031720
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08030164
	bl dp01_tbl1_exec_completed
	b _0803017E
	.align 2, 0
_08030140: .4byte gUnknown_02024A60
_08030144: .4byte gUnknown_02023A60
_08030148: .4byte gUnknown_0202F7C4
_0803014C: .4byte gUnknown_0202F7BC
_08030150: .4byte gUnknown_0202F7B8
_08030154: .4byte gUnknown_0202F7BE
_08030158: .4byte gUnknown_0202F7C0
_0803015C: .4byte gUnknown_0202F7B4
_08030160: .4byte gUnknown_02024E70
_08030164:
	ldrb r1, [r6]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08030184 @ =0x02017810
	adds r0, r1
	strb r2, [r0, 0x4]
	ldr r1, _08030188 @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803018C @ =sub_8030190
	str r1, [r0]
_0803017E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030184: .4byte 0x02017810
_08030188: .4byte gUnknown_03004330
_0803018C: .4byte sub_8030190
	thumb_func_end dp01t_0F_1_move_anim

	thumb_func_start sub_8030190
sub_8030190: @ 8030190
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r2, _080301D4 @ =gUnknown_02023A60
	ldr r5, _080301D8 @ =gUnknown_02024A60
	ldrb r3, [r5]
	lsls r1, r3, 9
	adds r0, r2, 0x1
	mov r9, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r6, r2, 0x2
	mov r8, r6
	adds r0, r1, r6
	ldrb r0, [r0]
	lsls r0, 8
	orrs r4, r0
	adds r2, 0xB
	adds r1, r2
	ldrb r7, [r1]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r6, _080301DC @ =0x02017810
	adds r0, r6
	ldrb r2, [r0, 0x4]
	cmp r2, 0x1
	beq _0803021E
	cmp r2, 0x1
	bgt _080301E0
	cmp r2, 0
	beq _080301EA
	b _080302E8
	.align 2, 0
_080301D4: .4byte gUnknown_02023A60
_080301D8: .4byte gUnknown_02024A60
_080301DC: .4byte 0x02017810
_080301E0:
	cmp r2, 0x2
	beq _08030244
	cmp r2, 0x3
	beq _080302B0
	b _080302E8
_080301EA:
	lsls r1, r3, 2
	adds r0, r6, 0
	subs r0, 0x10
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0xC
	ands r0, r2
	cmp r0, 0x4
	bne _0803020E
	movs r0, 0x8
	orrs r0, r2
	strb r0, [r1]
	ldrb r2, [r5]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl move_anim_start_t4
_0803020E:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _080302E8
_0803021E:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080302E8
	movs r0, 0
	bl sub_80326EC
	adds r0, r4, 0
	bl ExecuteMoveAnim
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x2
	strb r0, [r1, 0x4]
	b _080302E8
_08030244:
	ldr r0, _080302A0 @ =gAnimScriptCallback
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _080302A4 @ =gAnimScriptActive
	ldrb r0, [r0]
	cmp r0, 0
	bne _080302E8
	movs r0, 0x1
	bl sub_80326EC
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r4, r6, 0
	subs r4, 0x10
	adds r0, r4
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0803028C
	cmp r7, 0x1
	bhi _0803028C
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl move_anim_start_t4
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0]
	movs r1, 0x9
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_0803028C:
	ldr r0, _080302A8 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080302AC @ =0x02017810
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0, 0x4]
	b _080302E8
	.align 2, 0
_080302A0: .4byte gAnimScriptCallback
_080302A4: .4byte gAnimScriptActive
_080302A8: .4byte gUnknown_02024A60
_080302AC: .4byte 0x02017810
_080302B0:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080302E8
	bl sub_8031F24
	ldrb r0, [r5]
	lsls r2, r0, 9
	mov r3, r9
	adds r1, r2, r3
	ldrb r1, [r1]
	add r2, r8
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	bl sub_80324BC
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strb r4, [r0, 0x4]
	bl dp01_tbl1_exec_completed
_080302E8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8030190

	thumb_func_start sub_80302F4
sub_80302F4: @ 80302F4
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08030338 @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0803033C @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r4, _08030340 @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 9
	ldr r1, _08030344 @ =gUnknown_02023A62
	adds r0, r1
	ldrh r0, [r0]
	bl sub_8120AA8
	ldr r0, _08030348 @ =gUnknown_03004210
	ldr r1, _0803034C @ =gUnknown_020238CC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08030350 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08030354 @ =sub_802DF18
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030338: .4byte gUnknown_030042A4
_0803033C: .4byte gUnknown_030042A0
_08030340: .4byte gUnknown_02024A60
_08030344: .4byte gUnknown_02023A62
_08030348: .4byte gUnknown_03004210
_0803034C: .4byte gUnknown_020238CC
_08030350: .4byte gUnknown_03004330
_08030354: .4byte sub_802DF18
	thumb_func_end sub_80302F4

	thumb_func_start dp01t_11_1_message_for_player_only
dp01t_11_1_message_for_player_only: @ 8030358
	push {lr}
	ldr r0, _08030370 @ =gUnknown_02024A60
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08030374
	bl sub_80302F4
	b _08030378
	.align 2, 0
_08030370: .4byte gUnknown_02024A60
_08030374:
	bl dp01_tbl1_exec_completed
_08030378:
	pop {r0}
	bx r0
	thumb_func_end dp01t_11_1_message_for_player_only

.section .text_8030464

	thumb_func_start nullsub_42
nullsub_42: @ 8030464
	bx lr
	thumb_func_end nullsub_42

	thumb_func_start sub_8030468
sub_8030468: @ 8030468
	push {lr}
	sub sp, 0x4
	ldr r1, _08030494 @ =0x0000ffff
	ldr r3, _08030498 @ =0x00002d9f
	movs r0, 0
	str r0, [sp]
	movs r2, 0xC
	bl sub_814A5C0
	bl sub_80304A8
	ldr r1, _0803049C @ =gUnknown_03004330
	ldr r0, _080304A0 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080304A4 @ =sub_802C68C
	str r1, [r0]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08030494: .4byte 0x0000ffff
_08030498: .4byte 0x00002d9f
_0803049C: .4byte gUnknown_03004330
_080304A0: .4byte gUnknown_02024A60
_080304A4: .4byte sub_802C68C
	thumb_func_end sub_8030468

	thumb_func_start sub_80304A8
sub_80304A8: @ 80304A8
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _08030510 @ =gUnknown_030042A4
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08030514 @ =gUnknown_030042A0
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_802E1B0
	ldr r1, _08030518 @ =gUnknown_03004344
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, _0803051C @ =gUnknown_02024E64
	ldr r4, _08030520 @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_802E3B4
	ldr r1, _08030524 @ =gUnknown_02023A60
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, 0x2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08030500
	ldr r4, _08030528 @ =gUnknown_03004210
	ldr r1, _0803052C @ =gUnknown_08400D38
	movs r2, 0xA4
	lsls r2, 2
	movs r0, 0x37
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x17
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
_08030500:
	bl sub_802E220
	bl sub_802E2D4
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030510: .4byte gUnknown_030042A4
_08030514: .4byte gUnknown_030042A0
_08030518: .4byte gUnknown_03004344
_0803051C: .4byte gUnknown_02024E64
_08030520: .4byte gUnknown_02024A60
_08030524: .4byte gUnknown_02023A60
_08030528: .4byte gUnknown_03004210
_0803052C: .4byte gUnknown_08400D38
	thumb_func_end sub_80304A8

	thumb_func_start sub_8030530
sub_8030530: @ 8030530
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0803057C @ =gUnknown_03004330
	ldr r2, _08030580 @ =gUnknown_02024A60
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08030584 @ =sub_802E004
	str r1, [r0]
	ldr r1, _08030588 @ =gUnknown_02024E6C
	ldrb r0, [r2]
	strb r0, [r1]
	movs r3, 0
	ldr r5, _0803058C @ =gUnknown_02038470
	ldr r4, _08030590 @ =gUnknown_02023A60
_0803055E:
	adds r0, r3, r5
	ldrb r1, [r2]
	lsls r1, 9
	adds r1, 0x1
	adds r1, r3, r1
	adds r1, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, 0x1
	cmp r3, 0x2
	ble _0803055E
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803057C: .4byte gUnknown_03004330
_08030580: .4byte gUnknown_02024A60
_08030584: .4byte sub_802E004
_08030588: .4byte gUnknown_02024E6C
_0803058C: .4byte gUnknown_02038470
_08030590: .4byte gUnknown_02023A60
	thumb_func_end sub_8030530

	thumb_func_start sub_8030594
sub_8030594: @ 8030594
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08030644 @ =TaskDummy
	movs r1, 0xFF
	bl CreateTask
	ldr r3, _08030648 @ =gUnknown_0300434C
	ldr r5, _0803064C @ =gUnknown_02024A60
	ldrb r1, [r5]
	adds r1, r3
	strb r0, [r1]
	ldr r4, _08030650 @ =gTasks
	ldrb r2, [r5]
	adds r3, r2, r3
	ldrb r0, [r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldr r4, _08030654 @ =gUnknown_02023A60
	lsls r2, 9
	adds r3, r4, 0x1
	adds r2, r3
	ldrb r2, [r2]
	movs r0, 0xF
	ands r0, r2
	strh r0, [r1, 0x8]
	ldr r2, _08030658 @ =0x02000000
	ldrb r0, [r5]
	lsls r0, 9
	adds r0, r3
	ldrb r0, [r0]
	lsrs r0, 4
	ldr r3, _0803065C @ =0x00016054
	adds r1, r2, r3
	strb r0, [r1]
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, r4, 0x2
	adds r0, r1
	ldrb r1, [r0]
	adds r3, 0x49
	adds r0, r2, r3
	strb r1, [r0]
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, r4, 0x3
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _08030660 @ =0x000160c0
	adds r2, r1
	strb r0, [r2]
	movs r2, 0
	ldr r3, _08030664 @ =gUnknown_02038470
_08030600:
	adds r0, r2, r3
	ldrb r1, [r5]
	lsls r1, 9
	adds r1, 0x4
	adds r1, r2, r1
	adds r1, r4
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x2
	ble _08030600
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08030668 @ =gUnknown_03004330
	ldr r2, _0803064C @ =gUnknown_02024A60
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803066C @ =sub_802DF30
	str r1, [r0]
	ldr r1, _08030670 @ =gUnknown_02024E6C
	ldrb r0, [r2]
	strb r0, [r1]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030644: .4byte TaskDummy
_08030648: .4byte gUnknown_0300434C
_0803064C: .4byte gUnknown_02024A60
_08030650: .4byte gTasks
_08030654: .4byte gUnknown_02023A60
_08030658: .4byte 0x02000000
_0803065C: .4byte 0x00016054
_08030660: .4byte 0x000160c0
_08030664: .4byte gUnknown_02038470
_08030668: .4byte gUnknown_03004330
_0803066C: .4byte sub_802DF30
_08030670: .4byte gUnknown_02024E6C
	thumb_func_end sub_8030594

	thumb_func_start sub_8030674
sub_8030674: @ 8030674
	push {lr}
	sub sp, 0x4
	bl sub_80325B8
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r1, 0x2
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	bl dp01_tbl1_exec_completed
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end sub_8030674

	thumb_func_start sub_8030698
sub_8030698: @ 8030698
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r0, 0
	bl load_gfxc_health_bar
	ldr r3, _08030710 @ =gUnknown_02023A60
	ldr r0, _08030714 @ =gUnknown_02024A60
	mov r9, r0
	ldrb r4, [r0]
	lsls r2, r4, 9
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r3, 0x3
	adds r2, r3
	ldrb r0, [r2]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	asrs r7, r1, 16
	ldr r0, _08030718 @ =0x00007fff
	cmp r7, r0
	beq _08030728
	ldr r6, _0803071C @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _08030720 @ =gPlayerParty
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	mov r8, r0
	mov r1, r9
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _08030724 @ =gUnknown_03004340
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl sub_8043D84
	b _08030762
	.align 2, 0
_08030710: .4byte gUnknown_02023A60
_08030714: .4byte gUnknown_02024A60
_08030718: .4byte 0x00007fff
_0803071C: .4byte gUnknown_02024A6A
_08030720: .4byte gPlayerParty
_08030724: .4byte gUnknown_03004340
_08030728:
	ldr r1, _08030780 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08030784 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r4, _08030788 @ =gUnknown_03004340
	adds r1, r0, r4
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, 0
	bl sub_8043D84
	mov r1, r9
	ldrb r0, [r1]
	adds r0, r4
	ldrb r0, [r0]
	movs r1, 0
	movs r2, 0
	bl sub_80440EC
_08030762:
	ldr r1, _0803078C @ =gUnknown_03004330
	ldr r0, _08030790 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08030794 @ =bx_t1_healthbar_update
	str r1, [r0]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030780: .4byte gUnknown_02024A6A
_08030784: .4byte gPlayerParty
_08030788: .4byte gUnknown_03004340
_0803078C: .4byte gUnknown_03004330
_08030790: .4byte gUnknown_02024A60
_08030794: .4byte bx_t1_healthbar_update
	thumb_func_end sub_8030698

	thumb_func_start sub_8030798
sub_8030798: @ 8030798
	push {r4-r7,lr}
	ldr r5, _080307C4 @ =gUnknown_02023A60
	ldr r6, _080307C8 @ =gUnknown_02024A60
	ldrb r0, [r6]
	lsls r0, 9
	adds r1, r5, 0x1
	adds r0, r1
	ldrb r7, [r0]
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _080307CC @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	cmp r0, 0x63
	bls _080307D0
	bl dp01_tbl1_exec_completed
	b _0803081C
	.align 2, 0
_080307C4: .4byte gUnknown_02023A60
_080307C8: .4byte gUnknown_02024A60
_080307CC: .4byte gPlayerParty
_080307D0:
	movs r0, 0x1
	bl load_gfxc_health_bar
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	ldrb r1, [r6]
	lsls r1, 9
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r0, r5, 0x3
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	ldr r0, _08030824 @ =sub_802D924
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08030828 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r7, [r1, 0x8]
	strh r4, [r1, 0xA]
	ldrb r0, [r6]
	strh r0, [r1, 0xC]
	ldr r1, _0803082C @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08030830 @ =nullsub_91
	str r1, [r0]
_0803081C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030824: .4byte sub_802D924
_08030828: .4byte gTasks
_0803082C: .4byte gUnknown_03004330
_08030830: .4byte nullsub_91
	thumb_func_end sub_8030798

	thumb_func_start sub_8030834
sub_8030834: @ 8030834
	push {r4,lr}
	ldr r4, _0803088C @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08030884
	ldr r0, _08030890 @ =gUnknown_03004340
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _08030894 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _08030898 @ =gPlayerParty
	adds r1, r2
	movs r2, 0x9
	bl sub_8045A5C
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _0803089C @ =0x02017810
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _080308A0 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080308A4 @ =sub_802E434
	str r1, [r0]
_08030884:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803088C: .4byte gUnknown_02024A60
_08030890: .4byte gUnknown_03004340
_08030894: .4byte gUnknown_02024A6A
_08030898: .4byte gPlayerParty
_0803089C: .4byte 0x02017810
_080308A0: .4byte gUnknown_03004330
_080308A4: .4byte sub_802E434
	thumb_func_end sub_8030834

	thumb_func_start sub_80308A8
sub_80308A8: @ 80308A8
	push {r4,r5,lr}
	ldr r5, _08030900 @ =gUnknown_02024A60
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _080308F8
	ldr r4, _08030904 @ =gUnknown_02023A60
	ldrb r3, [r5]
	lsls r3, 9
	adds r0, r4, 0x1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, 0x2
	adds r1, r3, r1
	ldrb r1, [r1]
	adds r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	adds r2, r4, 0x4
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 16
	orrs r1, r2
	adds r4, 0x5
	adds r3, r4
	ldrb r2, [r3]
	lsls r2, 24
	orrs r1, r2
	bl move_anim_start_t2_for_situation
	ldr r1, _08030908 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0803090C @ =sub_802E434
	str r1, [r0]
_080308F8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030900: .4byte gUnknown_02024A60
_08030904: .4byte gUnknown_02023A60
_08030908: .4byte gUnknown_03004330
_0803090C: .4byte sub_802E434
	thumb_func_end sub_80308A8

	thumb_func_start sub_8030910
sub_8030910: @ 8030910
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	ldr r0, _0803096C @ =gUnknown_02024A6A
	mov r8, r0
	ldr r4, _08030970 @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 1
	add r0, r8
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _08030974 @ =gPlayerParty
	adds r0, r5
	movs r1, 0x37
	bl GetMonData
	ldr r2, _08030978 @ =gUnknown_02023A60
	ldrb r1, [r4]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	eors r0, r1
	mov r1, sp
	strb r0, [r1]
	ldrb r0, [r4]
	lsls r0, 1
	add r0, r8
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0x37
	mov r2, sp
	bl SetMonData
	bl dp01_tbl1_exec_completed
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803096C: .4byte gUnknown_02024A6A
_08030970: .4byte gUnknown_02024A60
_08030974: .4byte gPlayerParty
_08030978: .4byte gUnknown_02023A60
	thumb_func_end sub_8030910

	thumb_func_start sub_803097C
sub_803097C: @ 803097C
	push {lr}
	bl dp01_tbl1_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_803097C

	thumb_func_start sub_8030988
sub_8030988: @ 8030988
	push {r4,r5,lr}
	ldr r3, _080309EC @ =gUnknown_02023A60
	ldr r0, _080309F0 @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r2, 9
	adds r0, r3, 0x1
	adds r0, r2, r0
	ldrb r5, [r0]
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, 8
	orrs r5, r0
	adds r0, r3, 0x3
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, 16
	orrs r5, r0
	adds r0, r3, 0x4
	adds r0, r2, r0
	ldrb r4, [r0]
	lsls r4, 24
	adds r0, r3, 0x5
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r0, r3, 0x6
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	adds r3, 0x7
	adds r2, r3
	orrs r5, r4
	lsrs r4, r1, 16
	movs r0, 0x80
	lsls r0, 5
	cmp r4, r0
	bhi _080309F8
	ldr r0, _080309F4 @ =0x040000d4
	str r2, [r0]
	str r5, [r0, 0x4]
	lsrs r1, 17
	movs r2, 0x80
	lsls r2, 24
	orrs r1, r2
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _08030A24
	.align 2, 0
_080309EC: .4byte gUnknown_02023A60
_080309F0: .4byte gUnknown_02024A60
_080309F4: .4byte 0x040000d4
_080309F8:
	ldr r3, _08030A30 @ =0x040000d4
	str r2, [r3]
	str r5, [r3, 0x4]
	ldr r0, _08030A34 @ =0x80000800
	str r0, [r3, 0x8]
	ldr r0, [r3, 0x8]
	movs r0, 0x80
	lsls r0, 5
	adds r2, r0
	adds r5, r0
	ldr r1, _08030A38 @ =0xfffff000
	adds r4, r1
	cmp r4, r0
	bhi _080309F8
	str r2, [r3]
	str r5, [r3, 0x4]
	lsrs r0, r4, 1
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r3, 0x8]
	ldr r0, [r3, 0x8]
_08030A24:
	bl dp01_tbl1_exec_completed
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030A30: .4byte 0x040000d4
_08030A34: .4byte 0x80000800
_08030A38: .4byte 0xfffff000
	thumb_func_end sub_8030988

	thumb_func_start sub_8030A3C
sub_8030A3C: @ 8030A3C
	push {lr}
	ldr r2, _08030A64 @ =gUnknown_02023A60
	ldr r0, _08030A68 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlayBGM
	bl dp01_tbl1_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08030A64: .4byte gUnknown_02023A60
_08030A68: .4byte gUnknown_02024A60
	thumb_func_end sub_8030A3C

	thumb_func_start sub_8030A6C
sub_8030A6C: @ 8030A6C
	push {lr}
	bl dp01_tbl1_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8030A6C

	thumb_func_start sub_8030A78
sub_8030A78: @ 8030A78
	push {lr}
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl dp01_build_cmdbuf_x21_a_bb
	bl dp01_tbl1_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8030A78

	thumb_func_start sub_8030A8C
sub_8030A8C: @ 8030A8C
	push {lr}
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	bl dp01_build_cmdbuf_x22_a_three_bytes
	bl dp01_tbl1_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8030A8C

	thumb_func_start sub_8030AA0
sub_8030AA0: @ 8030AA0
	push {lr}
	movs r0, 0x1
	movs r1, 0
	bl dp01_build_cmdbuf_x23_aa_0
	bl dp01_tbl1_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8030AA0

	thumb_func_start sub_8030AB4
sub_8030AB4: @ 8030AB4
	push {lr}
	movs r0, 0x1
	movs r1, 0
	bl dp01_build_cmdbuf_x24_aa_0
	bl dp01_tbl1_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8030AB4

	thumb_func_start sub_8030AC8
sub_8030AC8: @ 8030AC8
	push {lr}
	ldr r2, _08030AE0 @ =gUnknown_020238C8
	ldrb r1, [r2]
	movs r0, 0x80
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	bl dp01_tbl1_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08030AE0: .4byte gUnknown_020238C8
	thumb_func_end sub_8030AC8

	thumb_func_start sub_8030AE4
sub_8030AE4: @ 8030AE4
	push {lr}
	ldr r3, _08030B10 @ =gUnknown_020238C8
	ldr r1, _08030B14 @ =gUnknown_02023A60
	ldr r0, _08030B18 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x7F
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl dp01_tbl1_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08030B10: .4byte gUnknown_020238C8
_08030B14: .4byte gUnknown_02023A60
_08030B18: .4byte gUnknown_02024A60
	thumb_func_end sub_8030AE4

	thumb_func_start sub_8030B1C
sub_8030B1C: @ 8030B1C
	push {lr}
	ldr r2, _08030B30 @ =gUnknown_020238C8
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	bl dp01_tbl1_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08030B30: .4byte gUnknown_020238C8
	thumb_func_end sub_8030B1C

	thumb_func_start sub_8030B34
sub_8030B34: @ 8030B34
	push {lr}
	ldr r3, _08030B58 @ =gUnknown_020238C8
	ldr r1, [r3]
	lsls r1, 24
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 7
	ldrb r2, [r3]
	movs r0, 0x7F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl dp01_tbl1_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08030B58: .4byte gUnknown_020238C8
	thumb_func_end sub_8030B34

	thumb_func_start dp01t_29_1_blink
dp01t_29_1_blink: @ 8030B5C
	push {r4,lr}
	ldr r3, _08030B84 @ =gSprites
	ldr r2, _08030B88 @ =gUnknown_02024BE0
	ldr r4, _08030B8C @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _08030B90
	bl dp01_tbl1_exec_completed
	b _08030BBA
	.align 2, 0
_08030B84: .4byte gSprites
_08030B88: .4byte gUnknown_02024BE0
_08030B8C: .4byte gUnknown_02024A60
_08030B90:
	ldr r1, _08030BC0 @ =gUnknown_02024E6D
	movs r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x30]
	ldrb r0, [r4]
	bl sub_8047858
	ldr r1, _08030BC4 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08030BC8 @ =bx_blink_t1
	str r1, [r0]
_08030BBA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030BC0: .4byte gUnknown_02024E6D
_08030BC4: .4byte gUnknown_03004330
_08030BC8: .4byte bx_blink_t1
	thumb_func_end dp01t_29_1_blink

	thumb_func_start sub_8030BCC
sub_8030BCC: @ 8030BCC
	push {lr}
	bl dp01_tbl1_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8030BCC

	thumb_func_start sub_8030BD8
sub_8030BD8: @ 8030BD8
	push {r4,lr}
	ldr r4, _08030C14 @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _08030BEC
	movs r3, 0xC0
_08030BEC:
	ldr r2, _08030C18 @ =gUnknown_02023A60
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	lsls r1, r3, 24
	asrs r1, 24
	bl PlaySoundEffect12WithPanning
	bl dp01_tbl1_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030C14: .4byte gUnknown_02024A60
_08030C18: .4byte gUnknown_02023A60
	thumb_func_end sub_8030BD8

	thumb_func_start sub_8030C1C
sub_8030C1C: @ 8030C1C
	push {lr}
	ldr r2, _08030C44 @ =gUnknown_02023A60
	ldr r0, _08030C48 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlayFanfare
	bl dp01_tbl1_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08030C44: .4byte gUnknown_02023A60
_08030C48: .4byte gUnknown_02024A60
	thumb_func_end sub_8030C1C

	thumb_func_start sub_8030C4C
sub_8030C4C: @ 8030C4C
	push {lr}
	ldr r1, _08030C80 @ =gUnknown_02024A6A
	ldr r0, _08030C84 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08030C88 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	negs r1, r1
	movs r2, 0x5
	bl PlayCry3
	bl dp01_tbl1_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08030C80: .4byte gUnknown_02024A6A
_08030C84: .4byte gUnknown_02024A60
_08030C88: .4byte gPlayerParty
	thumb_func_end sub_8030C4C

	thumb_func_start dp01t_2E_1_battle_intro
dp01t_2E_1_battle_intro: @ 8030C8C
	push {lr}
	ldr r1, _08030CB4 @ =gUnknown_02023A60
	ldr r0, _08030CB8 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80E43C0
	ldr r2, _08030CBC @ =gUnknown_02024DE8
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl dp01_tbl1_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08030CB4: .4byte gUnknown_02023A60
_08030CB8: .4byte gUnknown_02024A60
_08030CBC: .4byte gUnknown_02024DE8
	thumb_func_end dp01t_2E_1_battle_intro

	thumb_func_start sub_8030CC0
sub_8030CC0: @ 8030CC0
	push {r4-r7,lr}
	ldr r6, _08030DF8 @ =gUnknown_02024BE0
	ldr r7, _08030DFC @ =gUnknown_02024A60
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08030E00 @ =gSprites
	adds r0, r5
	bl oamt_add_pos2_onto_pos1
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x32
	strh r1, [r0, 0x2E]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08030E04 @ =0x0000ffd8
	strh r1, [r0, 0x32]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08030E08 @ =sub_8078B34
	str r1, [r0]
	ldrb r2, [r7]
	adds r0, r2, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x38]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08030E0C @ =sub_8030E38
	bl oamt_set_x3A_32
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _08030E10 @ =0x0000d6f8
	bl AllocSpritePalette
	adds r4, r0, 0
	lsls r4, 24
	ldr r1, _08030E14 @ =gTrainerBackPicPaletteTable
	ldr r0, _08030E18 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	lsrs r4, 20
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	movs r2, 0x20
	bl LoadCompressedPalette
	ldrb r0, [r7]
	adds r0, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, 0x5]
	ldr r0, _08030E1C @ =task05_08033660
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08030E20 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r7]
	strh r0, [r1, 0x8]
	ldrb r3, [r7]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r2, _08030E24 @ =0x02017810
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08030DDC
	ldr r0, _08030E28 @ =gUnknown_02024E68
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _08030E2C @ =sub_8044CA0
	str r1, [r0]
_08030DDC:
	adds r2, 0x30
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _08030E30 @ =gUnknown_03004330
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08030E34 @ =nullsub_91
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030DF8: .4byte gUnknown_02024BE0
_08030DFC: .4byte gUnknown_02024A60
_08030E00: .4byte gSprites
_08030E04: .4byte 0x0000ffd8
_08030E08: .4byte sub_8078B34
_08030E0C: .4byte sub_8030E38
_08030E10: .4byte 0x0000d6f8
_08030E14: .4byte gTrainerBackPicPaletteTable
_08030E18: .4byte gSaveBlock2
_08030E1C: .4byte task05_08033660
_08030E20: .4byte gTasks
_08030E24: .4byte 0x02017810
_08030E28: .4byte gUnknown_02024E68
_08030E2C: .4byte sub_8044CA0
_08030E30: .4byte gUnknown_03004330
_08030E34: .4byte nullsub_91
	thumb_func_end sub_8030CC0

	thumb_func_start sub_8030E38
sub_8030E38: @ 8030E38
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r4, [r5, 0x38]
	lsls r4, 24
	lsrs r4, 24
	bl FreeSpriteOamMatrix
	ldrb r0, [r5, 0x5]
	lsrs r0, 4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	adds r0, r5, 0
	bl DestroySprite
	ldr r1, _08030E90 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08030E94 @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	bl sub_80318FC
	ldr r0, _08030E98 @ =gUnknown_02024BE0
	adds r4, r0
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08030E9C @ =gSprites
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030E90: .4byte gUnknown_02024A6A
_08030E94: .4byte gPlayerParty
_08030E98: .4byte gUnknown_02024BE0
_08030E9C: .4byte gSprites
	thumb_func_end sub_8030E38

	thumb_func_start task05_08033660
task05_08033660: @ 8030EA0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _08030EC8 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x1E
	bgt _08030ECC
	adds r0, r2, 0x1
	strh r0, [r1, 0xA]
	b _08030F88
	.align 2, 0
_08030EC8: .4byte gTasks
_08030ECC:
	ldr r7, _08030F0C @ =gUnknown_02024A60
	ldrb r0, [r7]
	mov r9, r0
	ldrh r0, [r1, 0x8]
	strb r0, [r7]
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _08030EEC
	ldr r0, _08030F10 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08030F1C
_08030EEC:
	ldr r0, _08030F14 @ =gUnknown_02023A60
	ldrb r1, [r7]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _08030F18 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_802F934
	b _08030F70
	.align 2, 0
_08030F0C: .4byte gUnknown_02024A60
_08030F10: .4byte gBattleTypeFlags
_08030F14: .4byte gUnknown_02023A60
_08030F18: .4byte gUnknown_02024A6A
_08030F1C:
	ldr r4, _08030F94 @ =gUnknown_02023A60
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r4, 0x1
	adds r1, r4
	ldr r5, _08030F98 @ =gUnknown_02024A6A
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_802F934
	ldrb r0, [r7]
	movs r6, 0x2
	eors r0, r6
	strb r0, [r7]
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r1, r4
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r0, r1, 1
	adds r0, r5
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _08030F9C @ =gPlayerParty
	adds r0, r2
	bl sub_80318FC
	ldrb r0, [r7]
	movs r1, 0
	bl sub_802F934
	ldrb r0, [r7]
	eors r0, r6
	strb r0, [r7]
_08030F70:
	ldr r1, _08030FA0 @ =gUnknown_03004330
	ldr r2, _08030FA4 @ =gUnknown_02024A60
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08030FA8 @ =sub_802D500
	str r1, [r0]
	mov r3, r9
	strb r3, [r2]
	mov r0, r8
	bl DestroyTask
_08030F88:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030F94: .4byte gUnknown_02023A60
_08030F98: .4byte gUnknown_02024A6A
_08030F9C: .4byte gPlayerParty
_08030FA0: .4byte gUnknown_03004330
_08030FA4: .4byte gUnknown_02024A60
_08030FA8: .4byte sub_802D500
	thumb_func_end task05_08033660

	thumb_func_start sub_8030FAC
sub_8030FAC: @ 8030FAC
	push {r4-r6,lr}
	ldr r1, _08030FD4 @ =gUnknown_02023A60
	ldr r0, _08030FD8 @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08030FDC
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08030FDC
	bl dp01_tbl1_exec_completed
	b _08031044
	.align 2, 0
_08030FD4: .4byte gUnknown_02023A60
_08030FD8: .4byte gUnknown_02024A60
_08030FDC:
	ldr r5, _0803104C @ =gUnknown_02024A60
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r6, _08031050 @ =0x02017810
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r5]
	lsls r3, r0, 9
	ldr r4, _08031054 @ =gUnknown_02023A64
	adds r1, r3, r4
	subs r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, 0x2
	adds r3, r4
	ldrb r3, [r3]
	bl sub_8044804
	ldr r2, _08031058 @ =gUnknown_02024E68
	ldrb r1, [r5]
	adds r1, r2
	movs r2, 0
	strb r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strb r2, [r0, 0x5]
	ldrb r1, [r5]
	lsls r0, r1, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _08031038
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x5D
	strb r1, [r0, 0x5]
_08031038:
	ldr r0, _0803105C @ =gUnknown_03004330
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08031060 @ =sub_8031064
	str r0, [r1]
_08031044:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803104C: .4byte gUnknown_02024A60
_08031050: .4byte 0x02017810
_08031054: .4byte gUnknown_02023A64
_08031058: .4byte gUnknown_02024E68
_0803105C: .4byte gUnknown_03004330
_08031060: .4byte sub_8031064
	thumb_func_end sub_8030FAC

	thumb_func_start sub_8031064
sub_8031064: @ 8031064
	push {r4,lr}
	ldr r4, _0803109C @ =gUnknown_02024A60
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r3, _080310A0 @ =0x02017810
	adds r0, r3
	ldrb r1, [r0, 0x5]
	adds r2, r1, 0x1
	strb r2, [r0, 0x5]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x5C
	bls _08031094
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r0, 0
	strb r0, [r1, 0x5]
	bl dp01_tbl1_exec_completed
_08031094:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803109C: .4byte gUnknown_02024A60
_080310A0: .4byte 0x02017810
	thumb_func_end sub_8031064

	thumb_func_start sub_80310A4
sub_80310A4: @ 80310A4
	push {lr}
	ldr r0, _080310DC @ =gUnknown_02024A60
	ldrb r3, [r0]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r1, _080310E0 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080310D2
	ldr r2, _080310E4 @ =gTasks
	ldr r0, _080310E8 @ =gUnknown_02024E68
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _080310EC @ =sub_8044CA0
	str r1, [r0]
_080310D2:
	bl dp01_tbl1_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_080310DC: .4byte gUnknown_02024A60
_080310E0: .4byte 0x02017810
_080310E4: .4byte gTasks
_080310E8: .4byte gUnknown_02024E68
_080310EC: .4byte sub_8044CA0
	thumb_func_end sub_80310A4

	thumb_func_start sub_80310F0
sub_80310F0: @ 80310F0
	push {r4,lr}
	ldr r4, _08031110 @ =gUnknown_02024A60
	ldrb r0, [r4]
	movs r1, 0x1
	bl dp11b_obj_free
	ldrb r0, [r4]
	movs r1, 0
	bl dp11b_obj_free
	bl dp01_tbl1_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031110: .4byte gUnknown_02024A60
	thumb_func_end sub_80310F0

	thumb_func_start dp01t_33_1_enemy_move
dp01t_33_1_enemy_move: @ 8031114
	push {r4,lr}
	ldr r4, _08031164 @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _0803115A
	ldr r3, _08031168 @ =gSprites
	ldr r0, _0803116C @ =gUnknown_02024BE0
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldr r0, _08031170 @ =gUnknown_02023A60
	lsls r1, 9
	adds r0, 0x1
	adds r1, r0
	adds r2, 0x3E
	movs r0, 0x1
	ldrb r1, [r1]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	bl sub_8031F88
_0803115A:
	bl dp01_tbl1_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031164: .4byte gUnknown_02024A60
_08031168: .4byte gSprites
_0803116C: .4byte gUnknown_02024BE0
_08031170: .4byte gUnknown_02023A60
	thumb_func_end dp01t_33_1_enemy_move

	thumb_func_start bx_exec_buffer_A_ch0_tbl1
bx_exec_buffer_A_ch0_tbl1: @ 8031174
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _080311B8 @ =gUnknown_02024A60
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _080311CC
	ldr r5, _080311BC @ =gUnknown_02023A60
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, 0x3
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, 0
	adds r1, r2, 0
	bl move_anim_start_t3
	lsls r0, 24
	cmp r0, 0
	beq _080311C0
	bl dp01_tbl1_exec_completed
	b _080311CC
	.align 2, 0
_080311B8: .4byte gUnknown_02024A60
_080311BC: .4byte gUnknown_02023A60
_080311C0:
	ldr r0, _080311D4 @ =gUnknown_03004330
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _080311D8 @ =sub_802E460
	str r0, [r1]
_080311CC:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080311D4: .4byte gUnknown_03004330
_080311D8: .4byte sub_802E460
	thumb_func_end bx_exec_buffer_A_ch0_tbl1

	thumb_func_start dp01t_35_1_link_standby_message_and_free_vram
dp01t_35_1_link_standby_message_and_free_vram: @ 80311DC
	push {r4,lr}
	ldr r1, _080311FC @ =gUnknown_02023A60
	ldr r0, _08031200 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0803120E
	cmp r0, 0x1
	bgt _08031204
	cmp r0, 0
	beq _0803120A
	b _0803122C
	.align 2, 0
_080311FC: .4byte gUnknown_02023A60
_08031200: .4byte gUnknown_02024A60
_08031204:
	cmp r0, 0x2
	beq _08031228
	b _0803122C
_0803120A:
	bl b_link_standby_message
_0803120E:
	ldr r4, _08031224 @ =gUnknown_02024A60
	ldrb r0, [r4]
	movs r1, 0x1
	bl dp11b_obj_free
	ldrb r0, [r4]
	movs r1, 0
	bl dp11b_obj_free
	b _0803122C
	.align 2, 0
_08031224: .4byte gUnknown_02024A60
_08031228:
	bl b_link_standby_message
_0803122C:
	bl dp01_tbl1_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end dp01t_35_1_link_standby_message_and_free_vram

	thumb_func_start sub_8031238
sub_8031238: @ 8031238
	push {r4,lr}
	ldr r1, _08031258 @ =gUnknown_02023A60
	ldr r4, _0803125C @ =gUnknown_02024A60
	ldrb r3, [r4]
	lsls r0, r3, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r2, [r0]
	cmp r2, 0x1
	beq _08031280
	cmp r2, 0x1
	bgt _08031260
	cmp r2, 0
	beq _08031266
	b _08031290
	.align 2, 0
_08031258: .4byte gUnknown_02023A60
_0803125C: .4byte gUnknown_02024A60
_08031260:
	cmp r2, 0x2
	beq _08031288
	b _08031290
_08031266:
	ldr r0, _08031278 @ =gUnknown_02024E60
	adds r0, r3, r0
	strb r2, [r0]
	ldr r1, _0803127C @ =gUnknown_02024E64
	ldrb r0, [r4]
	adds r0, r1
	strb r2, [r0]
	b _08031290
	.align 2, 0
_08031278: .4byte gUnknown_02024E60
_0803127C: .4byte gUnknown_02024E64
_08031280:
	ldr r0, _08031284 @ =gUnknown_02024E60
	b _0803128A
	.align 2, 0
_08031284: .4byte gUnknown_02024E60
_08031288:
	ldr r0, _0803129C @ =gUnknown_02024E64
_0803128A:
	adds r0, r3, r0
	movs r1, 0
	strb r1, [r0]
_08031290:
	bl dp01_tbl1_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803129C: .4byte gUnknown_02024E64
	thumb_func_end sub_8031238

	thumb_func_start sub_80312A0
sub_80312A0: @ 80312A0
	push {r4,lr}
	ldr r2, _080312D8 @ =gUnknown_02024D26
	ldr r1, _080312DC @ =gUnknown_02023A60
	ldr r4, _080312E0 @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x5
	bl FadeOutMapMusic
	movs r0, 0x3
	bl BeginFastPaletteFade
	bl dp01_tbl1_exec_completed
	ldr r1, _080312E4 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080312E8 @ =sub_802D18C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080312D8: .4byte gUnknown_02024D26
_080312DC: .4byte gUnknown_02023A60
_080312E0: .4byte gUnknown_02024A60
_080312E4: .4byte gUnknown_03004330
_080312E8: .4byte sub_802D18C
	thumb_func_end sub_80312A0

	thumb_func_start nullsub_43
nullsub_43: @ 80312EC
	bx lr
	thumb_func_end nullsub_43

	.align 2, 0 @ Don't pad with nop.
