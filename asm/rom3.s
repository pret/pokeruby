	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_800B858
sub_800B858: @ 800B858
	push {lr}
	ldr r0, _0800B87C @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0800B876
	bl OpenLink
	ldr r0, _0800B880 @ =sub_8083C50
	movs r1, 0
	bl CreateTask
	bl sub_800BF28
_0800B876:
	pop {r0}
	bx r0
	.align 2, 0
_0800B87C: .4byte gUnknown_020239F8
_0800B880: .4byte sub_8083C50
	thumb_func_end sub_800B858

	thumb_func_start sub_800B884
sub_800B884: @ 800B884
	push {r4-r7,lr}
	sub sp, 0x14
	ldr r0, _0800B920 @ =gUnknown_030042D4
	ldr r1, _0800B924 @ =nullsub_41
	str r1, [r0]
	movs r0, 0
	str r0, [sp, 0x10]
	movs r1, 0
	ldr r7, _0800B928 @ =gUnknown_03004330
	ldr r6, _0800B92C @ =gUnknown_02024E60
	movs r2, 0
	ldr r5, _0800B930 @ =gUnknown_02024E64
	ldr r4, _0800B934 @ =nullsub_91
	ldr r3, _0800B938 @ =gUnknown_02024A72
_0800B8A0:
	lsls r0, r1, 2
	adds r0, r7
	str r4, [r0]
	adds r1, r3
	movs r0, 0xFF
	strb r0, [r1]
	ldr r0, [sp, 0x10]
	adds r0, r6
	strb r2, [r0]
	ldr r0, [sp, 0x10]
	adds r0, r5
	strb r2, [r0]
	ldr r0, [sp, 0x10]
	adds r0, 0x1
	str r0, [sp, 0x10]
	adds r1, r0, 0
	cmp r1, 0x3
	ble _0800B8A0
	bl sub_800B858
	ldr r0, _0800B93C @ =gUnknown_02024A64
	movs r5, 0
	str r5, [r0]
	bl sub_8075624
	bl sub_8040710
	bl sub_81070D4
	ldr r0, _0800B940 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0800B90E
	bl ZeroEnemyPartyMons
	ldr r4, _0800B944 @ =gEnemyParty
	movs r1, 0x8F
	lsls r1, 1
	str r5, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	str r5, [sp, 0xC]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x20
	bl CreateMon
	str r5, [sp, 0x10]
	adds r0, r4, 0
	movs r1, 0xC
	add r2, sp, 0x10
	bl SetMonData
_0800B90E:
	ldr r0, _0800B948 @ =gUnknown_020239FC
	str r5, [r0]
	ldr r0, _0800B94C @ =gUnknown_02024C78
	strb r5, [r0]
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800B920: .4byte gUnknown_030042D4
_0800B924: .4byte nullsub_41
_0800B928: .4byte gUnknown_03004330
_0800B92C: .4byte gUnknown_02024E60
_0800B930: .4byte gUnknown_02024E64
_0800B934: .4byte nullsub_91
_0800B938: .4byte gUnknown_02024A72
_0800B93C: .4byte gUnknown_02024A64
_0800B940: .4byte gUnknown_020239F8
_0800B944: .4byte gEnemyParty
_0800B948: .4byte gUnknown_020239FC
_0800B94C: .4byte gUnknown_02024C78
	thumb_func_end sub_800B884

	thumb_func_start sub_800B950
sub_800B950: @ 800B950
	push {r4,r5,lr}
	ldr r0, _0800B964 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0800B968
	bl sub_800BA78
	b _0800B96C
	.align 2, 0
_0800B964: .4byte gUnknown_020239F8
_0800B968:
	bl sub_800B9A8
_0800B96C:
	bl sub_800BD54
	ldr r0, _0800B9A0 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0800B99A
	movs r4, 0
	ldr r0, _0800B9A4 @ =gUnknown_02024A68
	ldrb r1, [r0]
	cmp r4, r1
	bge _0800B99A
	adds r5, r0, 0
_0800B988:
	lsls r0, r4, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8094978
	adds r4, 0x1
	ldrb r0, [r5]
	cmp r4, r0
	blt _0800B988
_0800B99A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800B9A0: .4byte gUnknown_020239F8
_0800B9A4: .4byte gUnknown_02024A68
	thumb_func_end sub_800B950

	thumb_func_start sub_800B9A8
sub_800B9A8: @ 800B9A8
	push {r4,lr}
	ldr r0, _0800B9CC @ =gUnknown_020239F8
	ldrh r2, [r0]
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _0800BA28
	ldr r1, _0800B9D0 @ =gUnknown_030042D4
	ldr r0, _0800B9D4 @ =sub_8010800
	str r0, [r1]
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _0800B9E0
	ldr r1, _0800B9D8 @ =gUnknown_03004330
	ldr r0, _0800B9DC @ =sub_812B468
	b _0800B9FC
	.align 2, 0
_0800B9CC: .4byte gUnknown_020239F8
_0800B9D0: .4byte gUnknown_030042D4
_0800B9D4: .4byte sub_8010800
_0800B9D8: .4byte gUnknown_03004330
_0800B9DC: .4byte sub_812B468
_0800B9E0:
	movs r0, 0x80
	lsls r0, 2
	ands r0, r2
	cmp r0, 0
	beq _0800B9F8
	ldr r1, _0800B9F0 @ =gUnknown_03004330
	ldr r0, _0800B9F4 @ =sub_8137224
	b _0800B9FC
	.align 2, 0
_0800B9F0: .4byte gUnknown_03004330
_0800B9F4: .4byte sub_8137224
_0800B9F8:
	ldr r1, _0800BA14 @ =gUnknown_03004330
	ldr r0, _0800BA18 @ =sub_802BF74
_0800B9FC:
	str r0, [r1]
	adds r2, r1, 0
	ldr r1, _0800BA1C @ =gUnknown_02024A72
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0800BA20 @ =sub_8032AE0
	str r0, [r2, 0x4]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	ldr r1, _0800BA24 @ =gUnknown_02024A68
	movs r0, 0x2
	b _0800BA52
	.align 2, 0
_0800BA14: .4byte gUnknown_03004330
_0800BA18: .4byte sub_802BF74
_0800BA1C: .4byte gUnknown_02024A72
_0800BA20: .4byte sub_8032AE0
_0800BA24: .4byte gUnknown_02024A68
_0800BA28:
	ldr r1, _0800BA5C @ =gUnknown_030042D4
	ldr r0, _0800BA60 @ =sub_8010800
	str r0, [r1]
	ldr r2, _0800BA64 @ =gUnknown_03004330
	ldr r4, _0800BA68 @ =sub_802BF74
	str r4, [r2]
	ldr r1, _0800BA6C @ =gUnknown_02024A72
	movs r0, 0
	strb r0, [r1]
	ldr r3, _0800BA70 @ =sub_8032AE0
	str r3, [r2, 0x4]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	str r4, [r2, 0x8]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	str r3, [r2, 0xC]
	movs r0, 0x3
	strb r0, [r1, 0x3]
	ldr r1, _0800BA74 @ =gUnknown_02024A68
	movs r0, 0x4
_0800BA52:
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800BA5C: .4byte gUnknown_030042D4
_0800BA60: .4byte sub_8010800
_0800BA64: .4byte gUnknown_03004330
_0800BA68: .4byte sub_802BF74
_0800BA6C: .4byte gUnknown_02024A72
_0800BA70: .4byte sub_8032AE0
_0800BA74: .4byte gUnknown_02024A68
	thumb_func_end sub_800B9A8

	thumb_func_start sub_800BA78
sub_800BA78: @ 800BA78
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r6, _0800BAB8 @ =gUnknown_020239F8
	ldrh r1, [r6]
	movs r5, 0x1
	movs r4, 0x1
	ands r4, r1
	cmp r4, 0
	bne _0800BB04
	movs r0, 0x4
	ands r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _0800BAD8
	ldr r1, _0800BABC @ =gUnknown_030042D4
	ldr r0, _0800BAC0 @ =sub_8010800
	str r0, [r1]
	ldr r2, _0800BAC4 @ =gUnknown_03004330
	ldr r0, _0800BAC8 @ =sub_802BF74
	str r0, [r2]
	ldr r1, _0800BACC @ =gUnknown_02024A72
	strb r4, [r1]
	ldr r0, _0800BAD0 @ =sub_8037510
	str r0, [r2, 0x4]
	strb r5, [r1, 0x1]
	ldr r1, _0800BAD4 @ =gUnknown_02024A68
	movs r0, 0x2
	b _0800BD3E
	.align 2, 0
_0800BAB8: .4byte gUnknown_020239F8
_0800BABC: .4byte gUnknown_030042D4
_0800BAC0: .4byte sub_8010800
_0800BAC4: .4byte gUnknown_03004330
_0800BAC8: .4byte sub_802BF74
_0800BACC: .4byte gUnknown_02024A72
_0800BAD0: .4byte sub_8037510
_0800BAD4: .4byte gUnknown_02024A68
_0800BAD8:
	ldr r2, _0800BAF0 @ =gUnknown_03004330
	ldr r0, _0800BAF4 @ =sub_802BF74
	str r0, [r2, 0x4]
	ldr r1, _0800BAF8 @ =gUnknown_02024A72
	strb r3, [r1, 0x1]
	ldr r0, _0800BAFC @ =sub_8037510
	str r0, [r2]
	strb r5, [r1]
	ldr r1, _0800BB00 @ =gUnknown_02024A68
	movs r0, 0x2
	b _0800BD3E
	.align 2, 0
_0800BAF0: .4byte gUnknown_03004330
_0800BAF4: .4byte sub_802BF74
_0800BAF8: .4byte gUnknown_02024A72
_0800BAFC: .4byte sub_8037510
_0800BB00: .4byte gUnknown_02024A68
_0800BB04:
	movs r0, 0x41
	ands r0, r1
	cmp r0, 0x1
	bne _0800BB90
	movs r6, 0x4
	movs r0, 0x4
	ands r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _0800BB58
	ldr r1, _0800BB40 @ =gUnknown_030042D4
	ldr r0, _0800BB44 @ =sub_8010800
	str r0, [r1]
	ldr r2, _0800BB48 @ =gUnknown_03004330
	ldr r4, _0800BB4C @ =sub_802BF74
	str r4, [r2]
	ldr r1, _0800BB50 @ =gUnknown_02024A72
	movs r0, 0
	strb r0, [r1]
	ldr r3, _0800BB54 @ =sub_8037510
	str r3, [r2, 0x4]
	strb r5, [r1, 0x1]
	str r4, [r2, 0x8]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	str r3, [r2, 0xC]
	movs r0, 0x3
	strb r0, [r1, 0x3]
	b _0800BB74
	.align 2, 0
_0800BB40: .4byte gUnknown_030042D4
_0800BB44: .4byte sub_8010800
_0800BB48: .4byte gUnknown_03004330
_0800BB4C: .4byte sub_802BF74
_0800BB50: .4byte gUnknown_02024A72
_0800BB54: .4byte sub_8037510
_0800BB58:
	ldr r2, _0800BB7C @ =gUnknown_03004330
	ldr r0, _0800BB80 @ =sub_802BF74
	str r0, [r2, 0x4]
	ldr r1, _0800BB84 @ =gUnknown_02024A72
	strb r3, [r1, 0x1]
	ldr r3, _0800BB88 @ =sub_8037510
	str r3, [r2]
	strb r5, [r1]
	str r0, [r2, 0xC]
	movs r0, 0x2
	strb r0, [r1, 0x3]
	str r3, [r2, 0x8]
	movs r0, 0x3
	strb r0, [r1, 0x2]
_0800BB74:
	ldr r0, _0800BB8C @ =gUnknown_02024A68
	strb r6, [r0]
	b _0800BD40
	.align 2, 0
_0800BB7C: .4byte gUnknown_03004330
_0800BB80: .4byte sub_802BF74
_0800BB84: .4byte gUnknown_02024A72
_0800BB88: .4byte sub_8037510
_0800BB8C: .4byte gUnknown_02024A68
_0800BB90:
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r1, [r6]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0800BBA8
	ldr r1, _0800BBD0 @ =gUnknown_030042D4
	ldr r0, _0800BBD4 @ =sub_8010800
	str r0, [r1]
_0800BBA8:
	movs r0, 0
	mov r10, r0
	ldr r1, _0800BBD8 @ =gLinkPlayers
	mov r12, r1
	ldr r7, _0800BBDC @ =gUnknown_02024A72
	mov r8, r0
	ldr r6, _0800BBE0 @ =gUnknown_02024A6A
	movs r4, 0
	movs r2, 0x3
	mov r9, r2
_0800BBBC:
	mov r1, r12
	adds r0, r4, r1
	ldrh r0, [r0, 0x18]
	cmp r0, 0x2
	bgt _0800BBE4
	cmp r0, 0x1
	bge _0800BBFC
	cmp r0, 0
	beq _0800BBE8
	b _0800BC06
	.align 2, 0
_0800BBD0: .4byte gUnknown_030042D4
_0800BBD4: .4byte sub_8010800
_0800BBD8: .4byte gLinkPlayers
_0800BBDC: .4byte gUnknown_02024A72
_0800BBE0: .4byte gUnknown_02024A6A
_0800BBE4:
	cmp r0, 0x3
	bne _0800BC06
_0800BBE8:
	ldr r0, _0800BBF8 @ =gLinkPlayers
	adds r0, r4, r0
	ldrb r0, [r0, 0x18]
	movs r1, 0
	bl sub_8094978
	b _0800BC06
	.align 2, 0
_0800BBF8: .4byte gLinkPlayers
_0800BBFC:
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl sub_8094978
_0800BC06:
	cmp r10, r5
	bne _0800BC56
	ldr r0, _0800BC2C @ =gLinkPlayers
	adds r3, r4, r0
	ldrh r1, [r3, 0x18]
	lsls r1, 2
	ldr r2, _0800BC30 @ =gUnknown_03004330
	adds r1, r2
	ldr r2, _0800BC34 @ =sub_802BF74
	str r2, [r1]
	ldrh r1, [r3, 0x18]
	mov r12, r0
	cmp r1, 0x2
	bgt _0800BC38
	cmp r1, 0x1
	bge _0800BC4C
	cmp r1, 0
	beq _0800BC3C
	b _0800BD2C
	.align 2, 0
_0800BC2C: .4byte gLinkPlayers
_0800BC30: .4byte gUnknown_03004330
_0800BC34: .4byte sub_802BF74
_0800BC38:
	cmp r1, 0x3
	bne _0800BD2C
_0800BC3C:
	mov r1, r12
	adds r0, r4, r1
	ldrh r1, [r0, 0x18]
	adds r1, r7
	mov r2, r8
	strb r2, [r1]
	ldrh r0, [r0, 0x18]
	b _0800BD12
_0800BC4C:
	adds r1, r7
	movs r0, 0x2
	strb r0, [r1]
	ldrh r0, [r3, 0x18]
	b _0800BD24
_0800BC56:
	ldr r2, _0800BC7C @ =gLinkPlayers
	adds r0, r4, r2
	ldrh r1, [r0, 0x18]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	mov r12, r2
	cmp r0, 0
	bne _0800BC80
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	add r0, r12
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0800BC92
	b _0800BCD8
	.align 2, 0
_0800BC7C: .4byte gLinkPlayers
_0800BC80:
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	add r0, r12
	ldrh r1, [r0, 0x18]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0800BCD8
_0800BC92:
	mov r0, r12
	adds r2, r4, r0
	ldrh r0, [r2, 0x18]
	lsls r0, 2
	ldr r1, _0800BCB4 @ =gUnknown_03004330
	adds r0, r1
	ldr r1, _0800BCB8 @ =sub_811DA78
	str r1, [r0]
	ldrh r1, [r2, 0x18]
	cmp r1, 0x2
	bgt _0800BCBC
	cmp r1, 0x1
	bge _0800BCD0
	cmp r1, 0
	beq _0800BCC0
	b _0800BD2C
	.align 2, 0
_0800BCB4: .4byte gUnknown_03004330
_0800BCB8: .4byte sub_811DA78
_0800BCBC:
	cmp r1, 0x3
	bne _0800BD2C
_0800BCC0:
	mov r2, r12
	adds r0, r4, r2
	ldrh r1, [r0, 0x18]
	adds r1, r7
	mov r2, r8
	strb r2, [r1]
	ldrh r0, [r0, 0x18]
	b _0800BD12
_0800BCD0:
	adds r1, r7
	movs r0, 0x2
	strb r0, [r1]
	b _0800BD22
_0800BCD8:
	mov r0, r12
	adds r2, r4, r0
	ldrh r0, [r2, 0x18]
	lsls r0, 2
	ldr r1, _0800BCF8 @ =gUnknown_03004330
	adds r0, r1
	ldr r1, _0800BCFC @ =sub_8037510
	str r1, [r0]
	ldrh r0, [r2, 0x18]
	cmp r0, 0x2
	bgt _0800BD00
	cmp r0, 0x1
	bge _0800BD1C
	cmp r0, 0
	beq _0800BD04
	b _0800BD2C
	.align 2, 0
_0800BCF8: .4byte gUnknown_03004330
_0800BCFC: .4byte sub_8037510
_0800BD00:
	cmp r0, 0x3
	bne _0800BD2C
_0800BD04:
	mov r0, r12
	adds r2, r4, r0
	ldrh r0, [r2, 0x18]
	adds r0, r7
	movs r1, 0x1
	strb r1, [r0]
	ldrh r0, [r2, 0x18]
_0800BD12:
	lsls r0, 1
	adds r0, r6
	mov r1, r8
	strh r1, [r0]
	b _0800BD2C
_0800BD1C:
	adds r0, r7
	mov r1, r9
	strb r1, [r0]
_0800BD22:
	ldrh r0, [r2, 0x18]
_0800BD24:
	lsls r0, 1
	adds r0, r6
	mov r2, r9
	strh r2, [r0]
_0800BD2C:
	adds r4, 0x1C
	movs r0, 0x1
	add r10, r0
	mov r1, r10
	cmp r1, 0x3
	bgt _0800BD3A
	b _0800BBBC
_0800BD3A:
	ldr r1, _0800BD50 @ =gUnknown_02024A68
	movs r0, 0x4
_0800BD3E:
	strb r0, [r1]
_0800BD40:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BD50: .4byte gUnknown_02024A68
	thumb_func_end sub_800BA78

	thumb_func_start sub_800BD54
sub_800BD54: @ 800BD54
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0800BD74 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800BD6C
	b _0800BE88
_0800BD6C:
	movs r0, 0
	mov r8, r0
	b _0800BE7E
	.align 2, 0
_0800BD74: .4byte gUnknown_020239F8
_0800BD78:
	movs r5, 0
	movs r0, 0x1
	add r0, r8
	mov r10, r0
	ldr r0, _0800BDA4 @ =gUnknown_02024A72
	add r0, r8
	mov r9, r0
	mov r0, r8
	lsls r6, r0, 1
	movs r7, 0
_0800BD8C:
	mov r0, r8
	cmp r0, 0x1
	bgt _0800BDF4
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0800BDAC
	ldr r0, _0800BDA8 @ =gPlayerParty
	b _0800BDAE
	.align 2, 0
_0800BDA4: .4byte gUnknown_02024A72
_0800BDA8: .4byte gPlayerParty
_0800BDAC:
	ldr r0, _0800BDEC @ =gEnemyParty
_0800BDAE:
	adds r4, r7, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0800BE74
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _0800BE74
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0800BE74
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0800BE74
	ldr r0, _0800BDF0 @ =gUnknown_02024A6A
	adds r0, r6, r0
	strh r5, [r0]
	b _0800BE7C
	.align 2, 0
_0800BDEC: .4byte gEnemyParty
_0800BDF0: .4byte gUnknown_02024A6A
_0800BDF4:
	mov r0, r9
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0800BE1C
	ldr r0, _0800BE18 @ =gPlayerParty
	adds r4, r7, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0800BE74
	adds r0, r4, 0
	movs r1, 0xB
	b _0800BE30
	.align 2, 0
_0800BE18: .4byte gPlayerParty
_0800BE1C:
	ldr r0, _0800BE6C @ =gEnemyParty
	adds r4, r7, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0800BE74
	adds r0, r4, 0
	movs r1, 0x41
_0800BE30:
	bl GetMonData
	cmp r0, 0
	beq _0800BE74
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0800BE74
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0800BE74
	ldr r1, _0800BE70 @ =gUnknown_02024A6A
	mov r0, r8
	subs r0, 0x2
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r5
	beq _0800BE74
	adds r0, r6, r1
	strh r5, [r0]
	b _0800BE7C
	.align 2, 0
_0800BE6C: .4byte gEnemyParty
_0800BE70: .4byte gUnknown_02024A6A
_0800BE74:
	adds r7, 0x64
	adds r5, 0x1
	cmp r5, 0x5
	ble _0800BD8C
_0800BE7C:
	mov r8, r10
_0800BE7E:
	ldr r0, _0800BE98 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r8, r0
	bge _0800BE88
	b _0800BD78
_0800BE88:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BE98: .4byte gUnknown_02024A68
	thumb_func_end sub_800BD54

	thumb_func_start dp01_prepare_buffer
dp01_prepare_buffer: @ 800BE9C
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r5, r3, 0
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _0800BEC4 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0800BEC8
	adds r0, r3, 0
	adds r1, r2, 0
	adds r2, r4, 0
	bl dp01_prepare_buffer_wireless_probably
	b _0800BF1A
	.align 2, 0
_0800BEC4: .4byte gUnknown_020239F8
_0800BEC8:
	cmp r5, 0
	beq _0800BED2
	cmp r5, 0x1
	beq _0800BEFC
	b _0800BF1A
_0800BED2:
	movs r3, 0
	cmp r3, r2
	bge _0800BF1A
	ldr r6, _0800BEF4 @ =gUnknown_02023A60
	ldr r5, _0800BEF8 @ =gUnknown_02024A60
_0800BEDC:
	ldrb r0, [r5]
	lsls r0, 9
	adds r0, r3, r0
	adds r0, r6
	ldrb r1, [r4]
	strb r1, [r0]
	adds r4, 0x1
	adds r3, 0x1
	cmp r3, r2
	blt _0800BEDC
	b _0800BF1A
	.align 2, 0
_0800BEF4: .4byte gUnknown_02023A60
_0800BEF8: .4byte gUnknown_02024A60
_0800BEFC:
	movs r3, 0
	cmp r3, r2
	bge _0800BF1A
	ldr r6, _0800BF20 @ =gUnknown_02024260
	ldr r5, _0800BF24 @ =gUnknown_02024A60
_0800BF06:
	ldrb r0, [r5]
	lsls r0, 9
	adds r0, r3, r0
	adds r0, r6
	ldrb r1, [r4]
	strb r1, [r0]
	adds r4, 0x1
	adds r3, 0x1
	cmp r3, r2
	blt _0800BF06
_0800BF1A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BF20: .4byte gUnknown_02024260
_0800BF24: .4byte gUnknown_02024A60
	thumb_func_end dp01_prepare_buffer

	thumb_func_start sub_800BF28
sub_800BF28: @ 800BF28
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _0800BFD0 @ =sub_800C1A8
	movs r1, 0
	bl CreateTask
	ldr r2, _0800BFD4 @ =gUnknown_020238C4
	strb r0, [r2]
	ldr r5, _0800BFD8 @ =gTasks
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r6, 0
	movs r4, 0
	strh r4, [r0, 0x1E]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x20]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x22]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x24]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x26]
	ldr r0, _0800BFDC @ =sub_800C47C
	movs r1, 0
	bl CreateTask
	ldr r2, _0800BFE0 @ =gUnknown_020238C5
	strb r0, [r2]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x20]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x22]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x24]
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r4, [r0, 0x26]
	ldr r0, _0800BFE4 @ =gUnknown_020238C6
	strb r6, [r0]
	mov r0, sp
	strh r4, [r0]
	ldr r1, _0800BFE8 @ =0x02014000
	ldr r2, _0800BFEC @ =0x01001000
	bl CpuSet
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800BFD0: .4byte sub_800C1A8
_0800BFD4: .4byte gUnknown_020238C4
_0800BFD8: .4byte gTasks
_0800BFDC: .4byte sub_800C47C
_0800BFE0: .4byte gUnknown_020238C5
_0800BFE4: .4byte gUnknown_020238C6
_0800BFE8: .4byte 0x02014000
_0800BFEC: .4byte 0x01001000
	thumb_func_end sub_800BF28

	thumb_func_start dp01_prepare_buffer_wireless_probably
dp01_prepare_buffer_wireless_probably: @ 800BFF0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r2
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	movs r1, 0x3
	mov r0, r8
	bics r0, r1
	adds r0, 0x4
	mov r9, r0
	ldr r2, _0800C168 @ =gTasks
	ldr r3, _0800C16C @ =gUnknown_020238C4
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r4, r0, r2
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	add r0, r9
	adds r0, 0x9
	movs r1, 0x80
	lsls r1, 5
	adds r5, r2, 0
	cmp r0, r1
	ble _0800C042
	ldrh r0, [r4, 0x24]
	movs r2, 0
	strh r0, [r4, 0x20]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	strh r2, [r0, 0x24]
_0800C042:
	ldr r4, _0800C170 @ =0x02000000
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r2, 0x24
	ldrsh r0, [r0, r2]
	movs r7, 0xA0
	lsls r7, 9
	adds r0, r7
	adds r0, r4
	strb r6, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r1, 0x24
	ldrsh r0, [r0, r1]
	ldr r2, _0800C174 @ =0x00014001
	adds r0, r2
	adds r0, r4
	ldr r1, _0800C178 @ =gUnknown_02024A60
	ldrb r1, [r1]
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r7, 0x24
	ldrsh r0, [r0, r7]
	ldr r1, _0800C17C @ =0x00014002
	adds r0, r1
	adds r0, r4
	ldr r1, _0800C180 @ =gUnknown_02024C07
	ldrb r1, [r1]
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r2, 0x24
	ldrsh r0, [r0, r2]
	ldr r7, _0800C184 @ =0x00014003
	adds r0, r7
	adds r0, r4
	ldr r1, _0800C188 @ =gUnknown_02024C08
	ldrb r1, [r1]
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r1, 0x24
	ldrsh r0, [r0, r1]
	ldr r2, _0800C18C @ =0x00014004
	adds r0, r2
	adds r0, r4
	mov r7, r9
	strb r7, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r2, 0x24
	ldrsh r1, [r0, r2]
	ldr r7, _0800C190 @ =0x00014005
	adds r1, r7
	adds r1, r4
	movs r0, 0xFF
	lsls r0, 8
	mov r2, r9
	ands r0, r2
	asrs r0, 8
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r7, 0x24
	ldrsh r0, [r0, r7]
	ldr r1, _0800C194 @ =0x00014006
	adds r0, r1
	adds r0, r4
	ldr r1, _0800C198 @ =gUnknown_02024C0C
	ldrb r1, [r1]
	strb r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r2, 0x24
	ldrsh r0, [r0, r2]
	ldr r7, _0800C19C @ =0x00014007
	adds r0, r7
	adds r0, r4
	ldr r1, _0800C1A0 @ =gUnknown_02024C0A
	ldrb r1, [r1]
	strb r1, [r0]
	movs r2, 0
	cmp r2, r8
	bge _0800C146
	mov r12, r4
	adds r6, r3, 0
	ldr r4, _0800C1A4 @ =0x00014008
_0800C122:
	ldrb r1, [r6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0800C168 @ =gTasks
	adds r0, r1
	movs r7, 0x24
	ldrsh r1, [r0, r7]
	adds r0, r2, r4
	adds r1, r0
	add r1, r12
	mov r7, r10
	adds r0, r7, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1
	cmp r2, r8
	blt _0800C122
_0800C146:
	ldrb r0, [r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r5
	ldrh r0, [r1, 0x24]
	add r0, r9
	adds r0, 0x8
	strh r0, [r1, 0x24]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C168: .4byte gTasks
_0800C16C: .4byte gUnknown_020238C4
_0800C170: .4byte 0x02000000
_0800C174: .4byte 0x00014001
_0800C178: .4byte gUnknown_02024A60
_0800C17C: .4byte 0x00014002
_0800C180: .4byte gUnknown_02024C07
_0800C184: .4byte 0x00014003
_0800C188: .4byte gUnknown_02024C08
_0800C18C: .4byte 0x00014004
_0800C190: .4byte 0x00014005
_0800C194: .4byte 0x00014006
_0800C198: .4byte gUnknown_02024C0C
_0800C19C: .4byte 0x00014007
_0800C1A0: .4byte gUnknown_02024C0A
_0800C1A4: .4byte 0x00014008
	thumb_func_end dp01_prepare_buffer_wireless_probably

	thumb_func_start sub_800C1A8
sub_800C1A8: @ 800C1A8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0800C1D0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x1E
	ldrsh r0, [r0, r2]
	adds r7, r1, 0
	cmp r0, 0x5
	bls _0800C1C4
	b _0800C354
_0800C1C4:
	lsls r0, 2
	ldr r1, _0800C1D4 @ =_0800C1D8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800C1D0: .4byte gTasks
_0800C1D4: .4byte _0800C1D8
	.align 2, 0
_0800C1D8:
	.4byte _0800C1F0
	.4byte _0800C204
	.4byte _0800C220
	.4byte _0800C25C
	.4byte _0800C2E6
	.4byte _0800C338
_0800C1F0:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r7
	movs r1, 0x64
	strh r1, [r0, 0x1C]
	ldrh r1, [r0, 0x1E]
	adds r1, 0x1
	strh r1, [r0, 0x1E]
	b _0800C354
_0800C204:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r7
	ldrh r0, [r1, 0x1C]
	subs r0, 0x1
	strh r0, [r1, 0x1C]
	lsls r0, 16
	cmp r0, 0
	beq _0800C21A
	b _0800C354
_0800C21A:
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	b _0800C352
_0800C220:
	bl GetLinkPlayerCount_2
	bl IsLinkMaster
	lsls r0, 24
	cmp r0, 0
	beq _0800C248
	bl sub_8007F4C
	ldr r0, _0800C244 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	b _0800C352
	.align 2, 0
_0800C244: .4byte gTasks
_0800C248:
	ldr r0, _0800C258 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	b _0800C352
	.align 2, 0
_0800C258: .4byte gTasks
_0800C25C:
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r0, 3
	adds r2, r0, r7
	movs r5, 0x26
	ldrsh r3, [r2, r5]
	movs r0, 0x24
	ldrsh r6, [r2, r0]
	mov r12, r6
	cmp r3, r12
	beq _0800C354
	ldrh r0, [r2, 0x22]
	movs r6, 0x22
	ldrsh r5, [r2, r6]
	cmp r5, 0
	bne _0800C2E0
	cmp r3, r12
	ble _0800C28C
	movs r6, 0x20
	ldrsh r0, [r2, r6]
	cmp r3, r0
	bne _0800C28C
	strh r5, [r2, 0x20]
	strh r5, [r2, 0x26]
_0800C28C:
	ldr r5, _0800C2D4 @ =0x02000000
	adds r4, r1, r4
	lsls r4, 3
	adds r4, r7
	movs r0, 0x26
	ldrsh r2, [r4, r0]
	ldr r1, _0800C2D8 @ =0x00014004
	adds r0, r2, r1
	adds r0, r5
	ldrb r1, [r0]
	ldr r6, _0800C2DC @ =0x00014005
	adds r2, r6
	adds r2, r5
	ldrb r0, [r2]
	lsls r0, 8
	orrs r1, r0
	adds r1, 0x8
	lsls r1, 16
	lsrs r6, r1, 16
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	movs r2, 0xA0
	lsls r2, 9
	adds r5, r2
	adds r1, r5
	adds r2, r6, 0
	bl SendBlock
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	b _0800C354
	.align 2, 0
_0800C2D4: .4byte 0x02000000
_0800C2D8: .4byte 0x00014004
_0800C2DC: .4byte 0x00014005
_0800C2E0:
	subs r0, 0x1
	strh r0, [r2, 0x22]
	b _0800C354
_0800C2E6:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _0800C354
	ldr r2, _0800C328 @ =0x02000000
	ldr r0, _0800C32C @ =gTasks
	lsls r3, r4, 2
	adds r3, r4
	lsls r3, 3
	adds r3, r0
	movs r4, 0x26
	ldrsh r1, [r3, r4]
	ldr r5, _0800C330 @ =0x00014004
	adds r0, r1, r5
	adds r0, r2
	ldrb r0, [r0]
	ldr r6, _0800C334 @ =0x00014005
	adds r1, r6
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	movs r2, 0x1
	strh r2, [r3, 0x22]
	orrs r0, r1
	ldrh r1, [r3, 0x26]
	adds r0, r1
	adds r0, 0x8
	strh r0, [r3, 0x26]
	movs r0, 0x3
	strh r0, [r3, 0x1E]
	b _0800C354
	.align 2, 0
_0800C328: .4byte 0x02000000
_0800C32C: .4byte gTasks
_0800C330: .4byte 0x00014004
_0800C334: .4byte 0x00014005
_0800C338:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r7
	ldrh r0, [r1, 0x22]
	subs r0, 0x1
	strh r0, [r1, 0x22]
	lsls r0, 16
	cmp r0, 0
	bne _0800C354
	movs r0, 0x1
	strh r0, [r1, 0x22]
	movs r0, 0x3
_0800C352:
	strh r0, [r1, 0x1E]
_0800C354:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_800C1A8

	thumb_func_start sub_800C35C
sub_800C35C: @ 800C35C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0800C38C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _0800C458
	ldr r0, _0800C390 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0800C458
	ldr r0, _0800C394 @ =gLinkPlayers
	ldr r1, [r0, 0x14]
	ldr r0, _0800C398 @ =0x00002211
	cmp r1, r0
	bne _0800C458
	movs r4, 0
	ldr r0, _0800C39C @ =gBlockRecvBuffer
	mov r10, r0
	b _0800C44C
	.align 2, 0
_0800C38C: .4byte gReceivedRemoteLinkPlayers
_0800C390: .4byte gUnknown_020239F8
_0800C394: .4byte gLinkPlayers
_0800C398: .4byte 0x00002211
_0800C39C: .4byte gBlockRecvBuffer
_0800C3A0:
	bl GetBlockRecievedStatus
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0800C468 @ =gBitTable
	lsls r1, r4, 2
	adds r1, r2
	ldr r1, [r1]
	ands r0, r1
	adds r1, r4, 0x1
	mov r9, r1
	cmp r0, 0
	beq _0800C446
	adds r0, r4, 0
	bl ResetBlockReceivedFlag
	lsls r0, r4, 8
	mov r2, r10
	adds r3, r0, r2
	ldr r1, _0800C46C @ =gBlockRecvBuffer + 0x4
	adds r0, r1
	ldrh r6, [r0]
	ldr r7, _0800C470 @ =gTasks
	ldr r2, _0800C474 @ =gUnknown_020238C5
	mov r12, r2
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r2, r0, r7
	movs r0, 0x24
	ldrsh r1, [r2, r0]
	adds r0, r6, 0
	adds r0, 0x9
	adds r1, r0
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	ble _0800C402
	ldrh r0, [r2, 0x24]
	strh r0, [r2, 0x20]
	mov r2, r12
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r7
	movs r1, 0
	strh r1, [r0, 0x24]
_0800C402:
	mov r2, r12
	ldrb r1, [r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r7
	movs r2, 0x24
	ldrsh r1, [r0, r2]
	ldr r0, _0800C478 @ =0x02015000
	adds r5, r1, r0
	adds r4, r3, 0
	movs r2, 0
	adds r3, r6, 0
	adds r3, 0x8
	mov r8, r7
	mov r7, r12
	cmp r2, r3
	bge _0800C434
_0800C426:
	adds r0, r5, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, r3
	blt _0800C426
_0800C434:
	ldrb r0, [r7]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	add r1, r8
	ldrh r0, [r1, 0x24]
	adds r0, r6, r0
	adds r0, 0x8
	strh r0, [r1, 0x24]
_0800C446:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r4, r0, 24
_0800C44C:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _0800C3A0
_0800C458:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C468: .4byte gBitTable
_0800C46C: .4byte gBlockRecvBuffer + 0x4
_0800C470: .4byte gTasks
_0800C474: .4byte gUnknown_020238C5
_0800C478: .4byte 0x02015000
	thumb_func_end sub_800C35C

	thumb_func_start sub_800C47C
sub_800C47C: @ 800C47C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _0800C4FC @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r3, r0, r1
	movs r0, 0x26
	ldrsh r2, [r3, r0]
	movs r4, 0x24
	ldrsh r0, [r3, r4]
	adds r4, r1, 0
	cmp r2, r0
	bne _0800C4A4
	b _0800C5FA
_0800C4A4:
	cmp r2, r0
	ble _0800C4B6
	movs r1, 0x20
	ldrsh r0, [r3, r1]
	cmp r2, r0
	bne _0800C4B6
	movs r0, 0
	strh r0, [r3, 0x20]
	strh r0, [r3, 0x26]
_0800C4B6:
	ldr r5, _0800C500 @ =0x02000000
	mov r2, r8
	lsls r1, r2, 2
	adds r0, r1, r2
	lsls r0, 3
	adds r6, r0, r4
	movs r4, 0x26
	ldrsh r3, [r6, r4]
	ldr r2, _0800C504 @ =0x00015001
	adds r0, r3, r2
	adds r0, r5
	ldrb r4, [r0]
	adds r2, 0x3
	adds r0, r3, r2
	adds r0, r5
	ldrb r7, [r0]
	adds r2, 0x1
	adds r0, r3, r2
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 8
	orrs r7, r0
	subs r2, 0x5
	adds r0, r3, r2
	adds r0, r5
	ldrb r0, [r0]
	mov r9, r1
	cmp r0, 0x1
	beq _0800C5B0
	cmp r0, 0x1
	bgt _0800C508
	cmp r0, 0
	beq _0800C50E
	b _0800C5E8
	.align 2, 0
_0800C4FC: .4byte gTasks
_0800C500: .4byte 0x02000000
_0800C504: .4byte 0x00015001
_0800C508:
	cmp r0, 0x2
	beq _0800C5CC
	b _0800C5E8
_0800C50E:
	ldr r2, _0800C588 @ =gUnknown_02024A64
	ldr r1, _0800C58C @ =gBitTable
	lsls r0, r4, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _0800C5FA
	lsls r0, r4, 9
	ldr r1, _0800C590 @ =gUnknown_02023A60
	adds r0, r1
	ldr r2, _0800C594 @ =0x00015008
	adds r1, r5, r2
	adds r1, r3, r1
	adds r2, r7, 0
	bl memcpy
	adds r0, r4, 0
	bl sub_80155A4
	ldr r0, _0800C598 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0800C5E8
	ldr r1, _0800C59C @ =gUnknown_02024C07
	movs r4, 0x26
	ldrsh r0, [r6, r4]
	ldr r2, _0800C5A0 @ =0x00015002
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0800C5A4 @ =gUnknown_02024C08
	movs r4, 0x26
	ldrsh r0, [r6, r4]
	adds r2, 0x1
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0800C5A8 @ =gUnknown_02024C0C
	movs r4, 0x26
	ldrsh r0, [r6, r4]
	adds r2, 0x3
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0800C5AC @ =gUnknown_02024C0A
	movs r4, 0x26
	ldrsh r0, [r6, r4]
	adds r2, 0x1
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	b _0800C5E8
	.align 2, 0
_0800C588: .4byte gUnknown_02024A64
_0800C58C: .4byte gBitTable
_0800C590: .4byte gUnknown_02023A60
_0800C594: .4byte 0x00015008
_0800C598: .4byte gUnknown_020239F8
_0800C59C: .4byte gUnknown_02024C07
_0800C5A0: .4byte 0x00015002
_0800C5A4: .4byte gUnknown_02024C08
_0800C5A8: .4byte gUnknown_02024C0C
_0800C5AC: .4byte gUnknown_02024C0A
_0800C5B0:
	lsls r0, r4, 9
	ldr r1, _0800C5C4 @ =gUnknown_02024260
	adds r0, r1
	ldr r4, _0800C5C8 @ =0x00015008
	adds r1, r5, r4
	adds r1, r3, r1
	adds r2, r7, 0
	bl memcpy
	b _0800C5E8
	.align 2, 0
_0800C5C4: .4byte gUnknown_02024260
_0800C5C8: .4byte 0x00015008
_0800C5CC:
	ldr r1, _0800C608 @ =0x00015008
	adds r0, r3, r1
	adds r0, r5
	ldrb r2, [r0]
	ldr r3, _0800C60C @ =gUnknown_02024A64
	ldr r1, _0800C610 @ =gBitTable
	lsls r0, r4, 2
	adds r0, r1
	lsls r2, 2
	ldr r1, [r0]
	lsls r1, r2
	ldr r0, [r3]
	bics r0, r1
	str r0, [r3]
_0800C5E8:
	ldr r0, _0800C614 @ =gTasks
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, r7, r0
	adds r0, 0x8
	strh r0, [r1, 0x26]
_0800C5FA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C608: .4byte 0x00015008
_0800C60C: .4byte gUnknown_02024A64
_0800C610: .4byte gBitTable
_0800C614: .4byte gTasks
	thumb_func_end sub_800C47C

	thumb_func_start dp01_build_cmdbuf_x00_a_b_0
dp01_build_cmdbuf_x00_a_b_0: @ 800C618
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C638 @ =gUnknown_03004040
	movs r3, 0
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r3, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800C638: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x00_a_b_0

	thumb_func_start dp01_build_cmdbuf_x01_a_b_0
dp01_build_cmdbuf_x01_a_b_0: @ 800C63C
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C660 @ =gUnknown_03004040
	movs r4, 0
	movs r3, 0x1
	strb r3, [r1]
	strb r5, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r4, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800C660: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x01_a_b_0

	thumb_func_start dp01_build_cmdbuf_x02_a_b_varargs
dp01_build_cmdbuf_x02_a_b_varargs: @ 800C664
	push {r4-r6,lr}
	ldr r4, [sp, 0x10]
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, _0800C6A0 @ =gUnknown_03004040
	movs r3, 0x2
	strb r3, [r0]
	strb r1, [r0, 0x1]
	strb r2, [r0, 0x2]
	adds r1, r0, 0
	cmp r5, 0
	beq _0800C692
	adds r3, r1, 0x3
	adds r2, r5, 0
_0800C684:
	ldrb r0, [r4]
	strb r0, [r3]
	adds r4, 0x1
	adds r3, 0x1
	subs r2, 0x1
	cmp r2, 0
	bne _0800C684
_0800C692:
	adds r2, r5, 0x3
	adds r0, r6, 0
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800C6A0: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x02_a_b_varargs

	thumb_func_start unref_sub_800C6A4
unref_sub_800C6A4: @ 800C6A4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r2, 24
	lsrs r4, r2, 24
	ldr r0, _0800C6E0 @ =gUnknown_03004040
	movs r2, 0x3
	strb r2, [r0]
	strb r1, [r0, 0x1]
	strb r4, [r0, 0x2]
	adds r5, r0, 0
	cmp r4, 0
	beq _0800C6D0
	adds r1, r5, 0x3
	adds r2, r4, 0
_0800C6C2:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r3, 0x1
	adds r1, 0x1
	subs r2, 0x1
	cmp r2, 0
	bne _0800C6C2
_0800C6D0:
	adds r2, r4, 0x3
	adds r0, r6, 0
	adds r1, r5, 0
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800C6E0: .4byte gUnknown_03004040
	thumb_func_end unref_sub_800C6A4

	thumb_func_start dp01_build_cmdbuf_x04_4_4_4
dp01_build_cmdbuf_x04_4_4_4: @ 800C6E4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C700 @ =gUnknown_03004040
	movs r2, 0x4
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C700: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x04_4_4_4

	thumb_func_start sub_800C704
sub_800C704: @ 800C704
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C724 @ =gUnknown_03004040
	movs r3, 0x5
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r3, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800C724: .4byte gUnknown_03004040
	thumb_func_end sub_800C704

	thumb_func_start dp01_build_cmdbuf_x06_a
dp01_build_cmdbuf_x06_a: @ 800C728
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C744 @ =gUnknown_03004040
	movs r2, 0x6
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C744: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x06_a

	thumb_func_start dp01_build_cmdbuf_x07_7_7_7
dp01_build_cmdbuf_x07_7_7_7: @ 800C748
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C764 @ =gUnknown_03004040
	movs r2, 0x7
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C764: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x07_7_7_7

	thumb_func_start dp01_build_cmdbuf_x08_8_8_8
dp01_build_cmdbuf_x08_8_8_8: @ 800C768
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C784 @ =gUnknown_03004040
	movs r2, 0x8
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C784: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x08_8_8_8

	thumb_func_start dp01_build_cmdbuf_x09_9_9_9
dp01_build_cmdbuf_x09_9_9_9: @ 800C788
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C7A4 @ =gUnknown_03004040
	movs r2, 0x9
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C7A4: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x09_9_9_9

	thumb_func_start dp01_build_cmdbuf_x0A_A_A_A
dp01_build_cmdbuf_x0A_A_A_A: @ 800C7A8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C7C4 @ =gUnknown_03004040
	movs r2, 0xA
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C7C4: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x0A_A_A_A

	thumb_func_start dp01_build_cmdbuf_x0B_B_B_B
dp01_build_cmdbuf_x0B_B_B_B: @ 800C7C8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C7E4 @ =gUnknown_03004040
	movs r2, 0xB
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C7E4: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x0B_B_B_B

	thumb_func_start dp01_build_cmdbuf_x0C_C_C_C
dp01_build_cmdbuf_x0C_C_C_C: @ 800C7E8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C804 @ =gUnknown_03004040
	movs r2, 0xC
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C804: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x0C_C_C_C

	thumb_func_start dp01_build_cmdbuf_x0D_a
dp01_build_cmdbuf_x0D_a: @ 800C808
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800C824 @ =gUnknown_03004040
	movs r2, 0xD
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800C824: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x0D_a

	thumb_func_start unref_sub_800C828
unref_sub_800C828: @ 800C828
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r1, _0800C86C @ =gUnknown_03004040
	movs r0, 0xE
	strb r0, [r1]
	strb r4, [r1, 0x1]
	lsls r0, r4, 1
	adds r0, r4
	adds r5, r1, 0
	cmp r0, 0
	beq _0800C856
	adds r1, r5, 0x2
	adds r3, r0, 0
_0800C848:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r1, 0x1
	subs r3, 0x1
	cmp r3, 0
	bne _0800C848
_0800C856:
	lsls r2, r4, 1
	adds r2, r4
	adds r2, 0x2
	adds r0, r6, 0
	adds r1, r5, 0
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800C86C: .4byte gUnknown_03004040
	thumb_func_end unref_sub_800C828

	thumb_func_start dp01_build_cmdbuf_x0F_aa_b_cc_dddd_e_mlc_weather_00_x1Cbytes
dp01_build_cmdbuf_x0F_aa_b_cc_dddd_e_mlc_weather_00_x1Cbytes: @ 800C870
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r4, [sp, 0x1C]
	ldr r5, [sp, 0x20]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r7, _0800C904 @ =gUnknown_03004040
	movs r0, 0
	mov r12, r0
	movs r0, 0xF
	strb r0, [r7]
	strb r1, [r7, 0x1]
	lsrs r1, 8
	strb r1, [r7, 0x2]
	strb r2, [r7, 0x3]
	strb r3, [r7, 0x4]
	movs r6, 0xFF
	lsls r6, 8
	lsrs r3, 8
	strb r3, [r7, 0x5]
	strb r4, [r7, 0x6]
	adds r0, r4, 0
	ands r0, r6
	asrs r0, 8
	strb r0, [r7, 0x7]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r4
	asrs r0, 16
	strb r0, [r7, 0x8]
	lsrs r4, 24
	strb r4, [r7, 0x9]
	strb r5, [r7, 0xA]
	ldr r0, _0800C908 @ =gUnknown_02024C0E
	ldrb r0, [r0]
	strb r0, [r7, 0xB]
	mov r0, r12
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0800C910
	str r0, [sp]
	movs r0, 0xE
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _0800C910
	ldr r0, _0800C90C @ =word_2024DB8
	ldrh r0, [r0]
	strb r0, [r7, 0xC]
	ands r6, r0
	lsrs r0, r6, 8
	strb r0, [r7, 0xD]
	adds r4, r7, 0
	b _0800C91A
	.align 2, 0
_0800C904: .4byte gUnknown_03004040
_0800C908: .4byte gUnknown_02024C0E
_0800C90C: .4byte word_2024DB8
_0800C910:
	ldr r0, _0800C944 @ =gUnknown_03004040
	movs r1, 0
	strb r1, [r0, 0xC]
	strb r1, [r0, 0xD]
	adds r4, r0, 0
_0800C91A:
	movs r0, 0
	strb r0, [r4, 0xE]
	strb r0, [r4, 0xF]
	adds r0, r4, 0
	adds r0, 0x10
	ldr r1, [sp, 0x24]
	movs r2, 0x1C
	bl memcpy
	mov r0, r8
	adds r1, r4, 0
	movs r2, 0x2C
	bl dp01_prepare_buffer
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C944: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x0F_aa_b_cc_dddd_e_mlc_weather_00_x1Cbytes

	thumb_func_start dp01_build_cmdbuf_x10_TODO
dp01_build_cmdbuf_x10_TODO: @ 800C948
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _0800CA2C @ =gUnknown_03004040
	movs r0, 0x10
	strb r0, [r2]
	ldr r0, _0800CA30 @ =gUnknown_02024D26
	ldrb r0, [r0]
	strb r0, [r2, 0x1]
	strb r1, [r2, 0x2]
	lsrs r1, 8
	strb r1, [r2, 0x3]
	adds r0, r2, 0x4
	mov r12, r0
	ldr r4, _0800CA34 @ =gUnknown_02024BE6
	ldrh r0, [r4]
	strh r0, [r2, 0x4]
	ldr r0, _0800CA38 @ =gUnknown_02024BE8
	ldrh r0, [r0]
	mov r1, r12
	strh r0, [r1, 0x2]
	ldr r0, _0800CA3C @ =gUnknown_02024C04
	ldrh r0, [r0]
	strh r0, [r1, 0x4]
	ldr r0, _0800CA40 @ =byte_2024C06
	ldrb r0, [r0]
	strb r0, [r1, 0x6]
	ldr r1, _0800CA44 @ =0x02000000
	ldr r3, _0800CA48 @ =0x00016003
	adds r0, r1, r3
	ldrb r0, [r0]
	mov r7, r12
	strb r0, [r7, 0x7]
	adds r3, 0x5B
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r7, 0x8]
	ldr r7, _0800CA4C @ =0x000160c1
	adds r1, r7
	ldrb r0, [r1]
	mov r1, r12
	strb r0, [r1, 0x9]
	ldr r0, _0800CA50 @ =gUnknown_02024C0B
	ldrb r0, [r0]
	strb r0, [r1, 0xA]
	ldr r3, _0800CA54 @ =gBattleMoves
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x2]
	mov r3, r12
	strb r0, [r3, 0xB]
	movs r3, 0
	mov r9, r2
	ldr r7, _0800CA58 @ =gUnknown_030042B0
	mov r8, r7
	adds r2, 0x10
	ldr r0, _0800CA5C @ =gBattleMons
	adds r4, r0, 0
	adds r4, 0x20
_0800C9D2:
	adds r1, r2, r3
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, 0x58
	adds r3, 0x1
	cmp r3, 0x3
	ble _0800C9D2
	movs r3, 0
	mov r5, r12
	adds r5, 0x10
	mov r4, r12
	adds r4, 0x20
	ldr r6, _0800CA60 @ =gUnknown_03004290
	mov r2, r12
	adds r2, 0x30
_0800C9F0:
	adds r1, r5, r3
	ldr r7, _0800CA64 @ =gUnknown_030041C0
	adds r0, r3, r7
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r4, r3
	adds r0, r3, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r2, r3
	mov r7, r8
	adds r0, r3, r7
	ldrb r0, [r0]
	strb r0, [r1]
	adds r3, 0x1
	cmp r3, 0xF
	ble _0800C9F0
	mov r0, r10
	mov r1, r9
	movs r2, 0x44
	bl dp01_prepare_buffer
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CA2C: .4byte gUnknown_03004040
_0800CA30: .4byte gUnknown_02024D26
_0800CA34: .4byte gUnknown_02024BE6
_0800CA38: .4byte gUnknown_02024BE8
_0800CA3C: .4byte gUnknown_02024C04
_0800CA40: .4byte byte_2024C06
_0800CA44: .4byte 0x02000000
_0800CA48: .4byte 0x00016003
_0800CA4C: .4byte 0x000160c1
_0800CA50: .4byte gUnknown_02024C0B
_0800CA54: .4byte gBattleMoves
_0800CA58: .4byte gUnknown_030042B0
_0800CA5C: .4byte gBattleMons
_0800CA60: .4byte gUnknown_03004290
_0800CA64: .4byte gUnknown_030041C0
	thumb_func_end dp01_build_cmdbuf_x10_TODO

	thumb_func_start dp01_build_cmdbuf_x11_TODO
dp01_build_cmdbuf_x11_TODO: @ 800CA68
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _0800CB28 @ =gUnknown_03004040
	movs r0, 0x11
	strb r0, [r2]
	strb r0, [r2, 0x1]
	strb r1, [r2, 0x2]
	lsrs r1, 8
	strb r1, [r2, 0x3]
	adds r0, r2, 0x4
	mov r12, r0
	ldr r0, _0800CB2C @ =gUnknown_02024BE6
	ldrh r0, [r0]
	strh r0, [r2, 0x4]
	ldr r0, _0800CB30 @ =gUnknown_02024BE8
	ldrh r0, [r0]
	mov r1, r12
	strh r0, [r1, 0x2]
	ldr r0, _0800CB34 @ =gUnknown_02024C04
	ldrh r0, [r0]
	strh r0, [r1, 0x4]
	ldr r0, _0800CB38 @ =byte_2024C06
	ldrb r0, [r0]
	strb r0, [r1, 0x6]
	ldr r0, _0800CB3C @ =0x02000000
	ldr r3, _0800CB40 @ =0x00016003
	adds r1, r0, r3
	ldrb r1, [r1]
	mov r7, r12
	strb r1, [r7, 0x7]
	ldr r1, _0800CB44 @ =0x0001605e
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r7, 0x8]
	movs r3, 0
	mov r9, r2
	ldr r7, _0800CB48 @ =gUnknown_030042B0
	mov r8, r7
	mov r4, r9
	adds r4, 0x10
	ldr r0, _0800CB4C @ =gBattleMons
	adds r2, r0, 0
	adds r2, 0x20
_0800CACE:
	adds r1, r4, r3
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x58
	adds r3, 0x1
	cmp r3, 0x3
	ble _0800CACE
	movs r3, 0
	mov r5, r12
	adds r5, 0x10
	mov r4, r12
	adds r4, 0x20
	ldr r6, _0800CB50 @ =gUnknown_03004290
	mov r2, r12
	adds r2, 0x30
_0800CAEC:
	adds r1, r5, r3
	ldr r7, _0800CB54 @ =gUnknown_030041C0
	adds r0, r3, r7
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r4, r3
	adds r0, r3, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r2, r3
	mov r7, r8
	adds r0, r3, r7
	ldrb r0, [r0]
	strb r0, [r1]
	adds r3, 0x1
	cmp r3, 0xF
	ble _0800CAEC
	mov r0, r10
	mov r1, r9
	movs r2, 0x44
	bl dp01_prepare_buffer
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CB28: .4byte gUnknown_03004040
_0800CB2C: .4byte gUnknown_02024BE6
_0800CB30: .4byte gUnknown_02024BE8
_0800CB34: .4byte gUnknown_02024C04
_0800CB38: .4byte byte_2024C06
_0800CB3C: .4byte 0x02000000
_0800CB40: .4byte 0x00016003
_0800CB44: .4byte 0x0001605e
_0800CB48: .4byte gUnknown_030042B0
_0800CB4C: .4byte gBattleMons
_0800CB50: .4byte gUnknown_03004290
_0800CB54: .4byte gUnknown_030041C0
	thumb_func_end dp01_build_cmdbuf_x11_TODO

	thumb_func_start dp01_build_cmdbuf_x12_a_bb
dp01_build_cmdbuf_x12_a_bb: @ 800CB58
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _0800CB80 @ =gUnknown_03004040
	movs r3, 0x12
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	lsrs r2, 8
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800CB80: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x12_a_bb

	thumb_func_start unref_sub_800CB84
unref_sub_800CB84: @ 800CB84
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800CBA0 @ =gUnknown_03004040
	movs r2, 0x13
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800CBA0: .4byte gUnknown_03004040
	thumb_func_end unref_sub_800CB84

	thumb_func_start sub_800CBA4
sub_800CBA4: @ 800CBA4
	push {r4-r6,lr}
	adds r5, r3, 0
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, _0800CBDC @ =gUnknown_03004040
	movs r4, 0
	movs r0, 0x14
	strb r0, [r3]
	strb r1, [r3, 0x1]
	strb r2, [r3, 0x2]
	strb r4, [r3, 0x3]
	movs r2, 0
	adds r1, r3, 0
	adds r4, r1, 0x4
_0800CBC0:
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r4]
	adds r4, 0x1
	adds r2, 0x1
	cmp r2, 0x13
	bls _0800CBC0
	adds r0, r6, 0
	movs r2, 0x18
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CBDC: .4byte gUnknown_03004040
	thumb_func_end sub_800CBA4

	thumb_func_start sub_800CBE0
sub_800CBE0: @ 800CBE0
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0800CC10 @ =gUnknown_03004040
	movs r0, 0x15
	strb r0, [r1]
	movs r2, 0
	adds r3, r1, 0x1
_0800CBF2:
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x2
	ble _0800CBF2
	adds r0, r5, 0
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800CC10: .4byte gUnknown_03004040
	thumb_func_end sub_800CBE0

	thumb_func_start dp01_build_cmdbuf_x16_a_b_c_ptr_d_e_f
dp01_build_cmdbuf_x16_a_b_c_ptr_d_e_f: @ 800CC14
	push {r4-r6,lr}
	ldr r6, [sp, 0x10]
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0800CC4C @ =gUnknown_03004040
	movs r0, 0x16
	strb r0, [r4]
	strb r1, [r4, 0x1]
	strb r2, [r4, 0x2]
	strb r3, [r4, 0x3]
	movs r2, 0
	adds r1, r4, 0
	adds r3, r1, 0x4
_0800CC2E:
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x2
	ble _0800CC2E
	adds r0, r5, 0
	movs r2, 0x8
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CC4C: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x16_a_b_c_ptr_d_e_f

	thumb_func_start dp01_build_cmdbuf_x17_17_17_17
dp01_build_cmdbuf_x17_17_17_17: @ 800CC50
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800CC6C @ =gUnknown_03004040
	movs r2, 0x17
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800CC6C: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x17_17_17_17

	thumb_func_start dp01_build_cmdbuf_x18_0_aa_health_bar_update
dp01_build_cmdbuf_x18_0_aa_health_bar_update: @ 800CC70
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _0800CCA4 @ =gUnknown_03004040
	movs r4, 0
	movs r2, 0x18
	strb r2, [r3]
	strb r4, [r3, 0x1]
	strb r1, [r3, 0x2]
	lsls r1, 16
	asrs r1, 16
	movs r2, 0xFF
	lsls r2, 8
	ands r1, r2
	asrs r1, 8
	strb r1, [r3, 0x3]
	adds r1, r3, 0
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800CCA4: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x18_0_aa_health_bar_update

	thumb_func_start dp01_build_cmdbuf_x19_a_bb
dp01_build_cmdbuf_x19_a_bb: @ 800CCA8
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _0800CCD8 @ =gUnknown_03004040
	movs r3, 0x19
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	lsls r2, 16
	asrs r2, 16
	movs r3, 0xFF
	lsls r3, 8
	ands r2, r3
	asrs r2, 8
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800CCD8: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x19_a_bb

	thumb_func_start dp01_build_cmdbuf_x1A_aaaa_bbbb
dp01_build_cmdbuf_x1A_aaaa_bbbb: @ 800CCDC
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800CD2C @ =gUnknown_03004040
	movs r3, 0x1A
	strb r3, [r1]
	strb r4, [r1, 0x1]
	movs r6, 0xFF
	lsls r6, 8
	adds r3, r4, 0
	ands r3, r6
	lsrs r3, 8
	strb r3, [r1, 0x2]
	movs r5, 0xFF
	lsls r5, 16
	adds r3, r4, 0
	ands r3, r5
	lsrs r3, 16
	strb r3, [r1, 0x3]
	lsrs r4, 24
	strb r4, [r1, 0x4]
	strb r2, [r1, 0x5]
	adds r3, r2, 0
	ands r3, r6
	lsrs r3, 8
	strb r3, [r1, 0x6]
	adds r3, r2, 0
	ands r3, r5
	lsrs r3, 16
	strb r3, [r1, 0x7]
	lsrs r2, 24
	strb r2, [r1, 0x8]
	movs r2, 0x9
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CD2C: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x1A_aaaa_bbbb

	thumb_func_start dp01_build_cmdbuf_x1B_aaaa_b
dp01_build_cmdbuf_x1B_aaaa_b: @ 800CD30
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800CD68 @ =gUnknown_03004040
	movs r3, 0x1B
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	movs r3, 0xFF
	lsls r3, 8
	ands r3, r2
	lsrs r3, 8
	strb r3, [r1, 0x3]
	movs r3, 0xFF
	lsls r3, 16
	ands r3, r2
	lsrs r3, 16
	strb r3, [r1, 0x4]
	lsrs r2, 24
	strb r2, [r1, 0x5]
	movs r2, 0x6
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800CD68: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x1B_aaaa_b

	thumb_func_start dp01_build_cmdbuf_x1C_a
dp01_build_cmdbuf_x1C_a: @ 800CD6C
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800CD88 @ =gUnknown_03004040
	movs r2, 0x1C
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800CD88: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x1C_a

	thumb_func_start dp01_build_cmdbuf_x1D_1D_numargs_varargs
dp01_build_cmdbuf_x1D_1D_numargs_varargs: @ 800CD8C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r1, _0800CDD0 @ =gUnknown_03004040
	movs r0, 0x1D
	strb r0, [r1]
	strb r0, [r1, 0x1]
	strb r4, [r1, 0x2]
	lsrs r0, r4, 8
	strb r0, [r1, 0x3]
	adds r5, r1, 0
	cmp r4, 0
	beq _0800CDBC
	adds r1, r5, 0x4
	adds r3, r4, 0
_0800CDAE:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r1, 0x1
	subs r3, 0x1
	cmp r3, 0
	bne _0800CDAE
_0800CDBC:
	adds r2, r4, 0x4
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CDD0: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x1D_1D_numargs_varargs

	thumb_func_start unref_sub_800CDD4
unref_sub_800CDD4: @ 800CDD4
	push {r4-r6,lr}
	adds r4, r3, 0
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r2, 16
	lsrs r5, r2, 16
	ldr r2, _0800CE38 @ =gUnknown_03004040
	movs r0, 0x1E
	strb r0, [r2]
	strb r1, [r2, 0x1]
	movs r3, 0xFF
	lsls r3, 8
	adds r0, r1, 0
	ands r0, r3
	lsrs r0, 8
	strb r0, [r2, 0x2]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r2, 0x3]
	lsrs r1, 24
	strb r1, [r2, 0x4]
	strb r5, [r2, 0x5]
	adds r0, r5, 0
	ands r0, r3
	lsrs r0, 8
	strb r0, [r2, 0x6]
	adds r1, r2, 0
	cmp r5, 0
	beq _0800CE24
	adds r3, r1, 0x7
	adds r2, r5, 0
_0800CE16:
	ldrb r0, [r4]
	strb r0, [r3]
	adds r4, 0x1
	adds r3, 0x1
	subs r2, 0x1
	cmp r2, 0
	bne _0800CE16
_0800CE24:
	adds r2, r5, 0x7
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CE38: .4byte gUnknown_03004040
	thumb_func_end unref_sub_800CDD4

	thumb_func_start unref_sub_800CE3C
unref_sub_800CE3C: @ 800CE3C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r1, _0800CE80 @ =gUnknown_03004040
	movs r0, 0x1F
	strb r0, [r1]
	strb r4, [r1, 0x1]
	lsrs r0, r4, 8
	strb r0, [r1, 0x2]
	adds r5, r1, 0
	cmp r4, 0
	beq _0800CE6A
	adds r1, r5, 0x3
	adds r3, r4, 0
_0800CE5C:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r1, 0x1
	subs r3, 0x1
	cmp r3, 0
	bne _0800CE5C
_0800CE6A:
	adds r2, r4, 0x3
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CE80: .4byte gUnknown_03004040
	thumb_func_end unref_sub_800CE3C

	thumb_func_start unref_sub_800CE84
unref_sub_800CE84: @ 800CE84
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r1, _0800CEC8 @ =gUnknown_03004040
	movs r0, 0x20
	strb r0, [r1]
	strb r4, [r1, 0x1]
	lsrs r0, r4, 8
	strb r0, [r1, 0x2]
	adds r5, r1, 0
	cmp r4, 0
	beq _0800CEB2
	adds r1, r5, 0x3
	adds r3, r4, 0
_0800CEA4:
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r1, 0x1
	subs r3, 0x1
	cmp r3, 0
	bne _0800CEA4
_0800CEB2:
	adds r2, r4, 0x3
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl dp01_prepare_buffer
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CEC8: .4byte gUnknown_03004040
	thumb_func_end unref_sub_800CE84

	thumb_func_start dp01_build_cmdbuf_x21_a_bb
dp01_build_cmdbuf_x21_a_bb: @ 800CECC
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _0800CEF4 @ =gUnknown_03004040
	movs r3, 0x21
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	lsrs r2, 8
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800CEF4: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x21_a_bb

	thumb_func_start dp01_build_cmdbuf_x22_a_three_bytes
dp01_build_cmdbuf_x22_a_three_bytes: @ 800CEF8
	push {r4,r5,lr}
	adds r4, r2, 0
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _0800CF2C @ =gUnknown_03004040
	movs r0, 0x22
	strb r0, [r2]
	strb r1, [r2, 0x1]
	movs r3, 0
	adds r1, r2, 0x2
_0800CF0C:
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, 0x1
	adds r3, 0x1
	cmp r3, 0x2
	ble _0800CF0C
	adds r0, r5, 0
	adds r1, r2, 0
	movs r2, 0x5
	bl dp01_prepare_buffer
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800CF2C: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x22_a_three_bytes

	thumb_func_start dp01_build_cmdbuf_x23_aa_0
dp01_build_cmdbuf_x23_aa_0: @ 800CF30
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _0800CF58 @ =gUnknown_03004040
	movs r4, 0
	movs r2, 0x23
	strb r2, [r3]
	strb r1, [r3, 0x1]
	lsrs r1, 8
	strb r1, [r3, 0x2]
	strb r4, [r3, 0x3]
	adds r1, r3, 0
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800CF58: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x23_aa_0

	thumb_func_start dp01_build_cmdbuf_x24_aa_0
dp01_build_cmdbuf_x24_aa_0: @ 800CF5C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _0800CF84 @ =gUnknown_03004040
	movs r4, 0
	movs r2, 0x24
	strb r2, [r3]
	strb r1, [r3, 0x1]
	lsrs r1, 8
	strb r1, [r3, 0x2]
	strb r4, [r3, 0x3]
	adds r1, r3, 0
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800CF84: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x24_aa_0

	thumb_func_start dp01_build_cmdbuf_x25_25_25_25
dp01_build_cmdbuf_x25_25_25_25: @ 800CF88
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800CFA4 @ =gUnknown_03004040
	movs r2, 0x25
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800CFA4: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x25_25_25_25

	thumb_func_start dp01_build_cmdbuf_x26_a
dp01_build_cmdbuf_x26_a: @ 800CFA8
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800CFC4 @ =gUnknown_03004040
	movs r2, 0x26
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800CFC4: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x26_a

	thumb_func_start dp01_build_cmdbuf_x27_27_27_27
dp01_build_cmdbuf_x27_27_27_27: @ 800CFC8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800CFE4 @ =gUnknown_03004040
	movs r2, 0x27
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800CFE4: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x27_27_27_27

	thumb_func_start dp01_build_cmdbuf_x28_28_28_28
dp01_build_cmdbuf_x28_28_28_28: @ 800CFE8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D004 @ =gUnknown_03004040
	movs r2, 0x28
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D004: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x28_28_28_28

	thumb_func_start dp01_build_cmdbuf_x29_29_29_29
dp01_build_cmdbuf_x29_29_29_29: @ 800D008
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D024 @ =gUnknown_03004040
	movs r2, 0x29
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D024: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x29_29_29_29

	thumb_func_start dp01_build_cmdbuf_x2A_2A_2A_2A
dp01_build_cmdbuf_x2A_2A_2A_2A: @ 800D028
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D044 @ =gUnknown_03004040
	movs r2, 0x2A
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D044: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x2A_2A_2A_2A

	thumb_func_start dp01_build_cmdbuf_x2B_aa_0
dp01_build_cmdbuf_x2B_aa_0: @ 800D048
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _0800D070 @ =gUnknown_03004040
	movs r4, 0
	movs r2, 0x2B
	strb r2, [r3]
	strb r1, [r3, 0x1]
	lsrs r1, 8
	strb r1, [r3, 0x2]
	strb r4, [r3, 0x3]
	adds r1, r3, 0
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D070: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x2B_aa_0

	thumb_func_start sub_800D074
sub_800D074: @ 800D074
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _0800D09C @ =gUnknown_03004040
	movs r4, 0
	movs r2, 0x2C
	strb r2, [r3]
	strb r1, [r3, 0x1]
	lsrs r1, 8
	strb r1, [r3, 0x2]
	strb r4, [r3, 0x3]
	adds r1, r3, 0
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D09C: .4byte gUnknown_03004040
	thumb_func_end sub_800D074

	thumb_func_start dp01_build_cmdbuf_x2D_2D_2D_2D
dp01_build_cmdbuf_x2D_2D_2D_2D: @ 800D0A0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D0BC @ =gUnknown_03004040
	movs r2, 0x2D
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D0BC: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x2D_2D_2D_2D

	thumb_func_start dp01_build_cmdbuf_x2E_a
dp01_build_cmdbuf_x2E_a: @ 800D0C0
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D0DC @ =gUnknown_03004040
	movs r2, 0x2E
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D0DC: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x2E_a

	thumb_func_start dp01_build_cmdbuf_x2F_2F_2F_2F
dp01_build_cmdbuf_x2F_2F_2F_2F: @ 800D0E0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D0FC @ =gUnknown_03004040
	movs r2, 0x2F
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D0FC: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x2F_2F_2F_2F

	thumb_func_start dp01_build_cmdbuf_x30_TODO
dp01_build_cmdbuf_x30_TODO: @ 800D100
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r1, _0800D144 @ =gUnknown_03004040
	movs r3, 0x30
	strb r3, [r1]
	movs r0, 0x7F
	ands r0, r2
	strb r0, [r1, 0x1]
	movs r0, 0x80
	ands r0, r2
	lsls r0, 24
	lsrs r0, 31
	strb r0, [r1, 0x2]
	strb r3, [r1, 0x3]
	movs r2, 0
	adds r3, r1, 0x4
_0800D128:
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x2F
	ble _0800D128
	adds r0, r5, 0
	movs r2, 0x34
	bl dp01_prepare_buffer
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D144: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x30_TODO

	thumb_func_start dp01_build_cmdbuf_x31_31_31_31
dp01_build_cmdbuf_x31_31_31_31: @ 800D148
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D164 @ =gUnknown_03004040
	movs r2, 0x31
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D164: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x31_31_31_31

	thumb_func_start dp01_build_cmdbuf_x32_32_32_32
dp01_build_cmdbuf_x32_32_32_32: @ 800D168
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D184 @ =gUnknown_03004040
	movs r2, 0x32
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D184: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x32_32_32_32

	thumb_func_start dp01_build_cmdbuf_x33_a_33_33
dp01_build_cmdbuf_x33_a_33_33: @ 800D188
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D1A8 @ =gUnknown_03004040
	movs r2, 0x33
	strb r2, [r1]
	strb r3, [r1, 0x1]
	strb r2, [r1, 0x2]
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D1A8: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x33_a_33_33

	thumb_func_start dp01_build_cmdbuf_x34_a_bb_aka_battle_anim
dp01_build_cmdbuf_x34_a_bb_aka_battle_anim: @ 800D1AC
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _0800D1D4 @ =gUnknown_03004040
	movs r3, 0x34
	strb r3, [r1]
	strb r4, [r1, 0x1]
	strb r2, [r1, 0x2]
	lsrs r2, 8
	strb r2, [r1, 0x3]
	movs r2, 0x4
	bl dp01_prepare_buffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D1D4: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x34_a_bb_aka_battle_anim

	thumb_func_start sub_800D1D8
sub_800D1D8: @ 800D1D8
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D1F4 @ =gUnknown_03004040
	movs r2, 0x35
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D1F4: .4byte gUnknown_03004040
	thumb_func_end sub_800D1D8

	thumb_func_start dp01_build_cmdbuf_x38_a
dp01_build_cmdbuf_x38_a: @ 800D1F8
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D214 @ =gUnknown_03004040
	movs r2, 0x36
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D214: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x38_a

	thumb_func_start dp01_build_cmdbuf_x37_a
dp01_build_cmdbuf_x37_a: @ 800D218
	push {lr}
	adds r3, r1, 0
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0800D234 @ =gUnknown_03004040
	movs r2, 0x37
	strb r2, [r1]
	strb r3, [r1, 0x1]
	movs r2, 0x2
	bl dp01_prepare_buffer
	pop {r0}
	bx r0
	.align 2, 0
_0800D234: .4byte gUnknown_03004040
	thumb_func_end dp01_build_cmdbuf_x37_a

	.align 2, 0 @ Don't pad with nop.
