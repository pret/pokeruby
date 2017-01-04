	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start unref_sub_8094928
unref_sub_8094928: @ 8094928
	push {lr}
	ldr r1, _08094938 @ =gPokemonStorage
	ldr r2, _0809493C @ =0x000083d0
	bl memcpy
	pop {r0}
	bx r0
	.align 2, 0
_08094938: .4byte gPokemonStorage
_0809493C: .4byte 0x000083d0
	thumb_func_end unref_sub_8094928

	thumb_func_start unref_sub_8094940
unref_sub_8094940: @ 8094940
	push {lr}
	adds r1, r0, 0
	ldr r0, _08094950 @ =gPokemonStorage
	ldr r2, _08094954 @ =0x000083d0
	bl memcpy
	pop {r0}
	bx r0
	.align 2, 0
_08094950: .4byte gPokemonStorage
_08094954: .4byte 0x000083d0
	thumb_func_end unref_sub_8094940

	thumb_func_start sub_8094958
sub_8094958: @ 8094958
	push {r4,lr}
	ldr r4, _08094974 @ =gUnknown_02038470
	bl sub_803FBBC
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8094998
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08094974: .4byte gUnknown_02038470
	thumb_func_end sub_8094958

	thumb_func_start sub_8094978
sub_8094978: @ 8094978
	push {lr}
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r2, 1
	adds r0, r2
	ldr r3, _08094994 @ =0x0201606c
	adds r0, r3
	bl sub_8094A74
	pop {r0}
	bx r0
	.align 2, 0
_08094994: .4byte 0x0201606c
	thumb_func_end sub_8094978

	thumb_func_start sub_8094998
sub_8094998: @ 8094998
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	bl IsLinkDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080949CE
	cmp r4, 0
	beq _080949C0
	movs r0, 0x30
	strb r0, [r6]
	movs r0, 0x45
	strb r0, [r6, 0x1]
	movs r0, 0x12
	strb r0, [r6, 0x2]
	b _08094A68
_080949C0:
	movs r0, 0x3
	strb r0, [r6]
	movs r0, 0x12
	strb r0, [r6, 0x1]
	movs r0, 0x45
	strb r0, [r6, 0x2]
	b _08094A68
_080949CE:
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	bne _08094A0C
	movs r5, 0x1
	movs r0, 0
	bl battle_get_side_with_given_state
	mov r2, sp
	ldr r1, _08094A08 @ =gUnknown_02024A6A
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	ldrh r0, [r0]
	strb r0, [r2]
	movs r4, 0
	mov r1, sp
_080949F2:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08094A00
	mov r2, sp
	adds r0, r2, r5
	strb r4, [r0]
	adds r5, 0x1
_08094A00:
	adds r4, 0x1
	cmp r4, 0x5
	ble _080949F2
	b _08094A50
	.align 2, 0
_08094A08: .4byte gUnknown_02024A6A
_08094A0C:
	movs r5, 0x2
	movs r0, 0
	bl battle_get_side_with_given_state
	mov r1, sp
	ldr r4, _08094A70 @ =gUnknown_02024A6A
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrh r0, [r0]
	strb r0, [r1]
	movs r0, 0x2
	bl battle_get_side_with_given_state
	mov r1, sp
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	ldrh r0, [r0]
	strb r0, [r1, 0x1]
	movs r4, 0
_08094A36:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08094A4A
	ldrb r0, [r1, 0x1]
	cmp r4, r0
	beq _08094A4A
	mov r2, sp
	adds r0, r2, r5
	strb r4, [r0]
	adds r5, 0x1
_08094A4A:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08094A36
_08094A50:
	movs r4, 0
	mov r3, sp
_08094A54:
	adds r0, r6, r4
	ldrb r1, [r3]
	lsls r1, 4
	ldrb r2, [r3, 0x1]
	orrs r1, r2
	strb r1, [r0]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _08094A54
_08094A68:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08094A70: .4byte gUnknown_02024A6A
	thumb_func_end sub_8094998

	thumb_func_start sub_8094A74
sub_8094A74: @ 8094A74
	push {r4-r7,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r0, r2, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08094A9C
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x2
	b _08094AA8
_08094A9C:
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x3
_08094AA8:
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r6, r0, 24
	bl IsLinkDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08094ADC
	cmp r7, 0
	beq _08094ACE
	movs r0, 0x30
	strb r0, [r5]
	movs r0, 0x45
	strb r0, [r5, 0x1]
	movs r0, 0x12
	strb r0, [r5, 0x2]
	b _08094B5E
_08094ACE:
	movs r0, 0x3
	strb r0, [r5]
	movs r0, 0x12
	strb r0, [r5, 0x1]
	movs r0, 0x45
	strb r0, [r5, 0x2]
	b _08094B5E
_08094ADC:
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	bne _08094B14
	movs r3, 0x1
	mov r2, sp
	ldr r1, _08094B10 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	strb r0, [r2]
	movs r4, 0
	mov r1, sp
_08094AF8:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08094B06
	mov r2, sp
	adds r0, r2, r3
	strb r4, [r0]
	adds r3, 0x1
_08094B06:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08094AF8
	b _08094B46
	.align 2, 0
_08094B10: .4byte gUnknown_02024A6A
_08094B14:
	movs r3, 0x2
	mov r1, sp
	ldr r2, _08094B68 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	lsls r0, r6, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x1]
	movs r4, 0
_08094B2C:
	ldrb r0, [r1]
	cmp r4, r0
	beq _08094B40
	ldrb r0, [r1, 0x1]
	cmp r4, r0
	beq _08094B40
	mov r2, sp
	adds r0, r2, r3
	strb r4, [r0]
	adds r3, 0x1
_08094B40:
	adds r4, 0x1
	cmp r4, 0x5
	ble _08094B2C
_08094B46:
	movs r4, 0
	mov r3, sp
_08094B4A:
	adds r0, r5, r4
	ldrb r1, [r3]
	lsls r1, 4
	ldrb r2, [r3, 0x1]
	orrs r1, r2
	strb r1, [r0]
	adds r3, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _08094B4A
_08094B5E:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08094B68: .4byte gUnknown_02024A6A
	thumb_func_end sub_8094A74

	thumb_func_start sub_8094B6C
sub_8094B6C: @ 8094B6C
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	movs r7, 0
	bl IsLinkDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _08094C16
	lsls r0, r4, 1
	adds r0, r4
	ldr r1, _08094BCC @ =0x0201606c
	adds r4, r0, r1
	movs r2, 0
	add r6, sp
	mov r12, r6
	movs r6, 0xF
	mov r3, sp
_08094B9A:
	adds r1, r4, r2
	ldrb r0, [r1]
	lsrs r0, 4
	strb r0, [r3]
	adds r3, 0x1
	ldrb r1, [r1]
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r3]
	adds r3, 0x1
	adds r2, 0x1
	cmp r2, 0x2
	ble _08094B9A
	mov r0, r12
	ldrb r3, [r0]
	movs r2, 0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, r5
	bne _08094BD0
	mov r0, sp
	ldrb r7, [r0]
	strb r3, [r0]
	b _08094BE4
	.align 2, 0
_08094BCC: .4byte 0x0201606c
_08094BD0:
	adds r2, 0x1
	cmp r2, 0x5
	bgt _08094BE4
	mov r0, sp
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, r5
	bne _08094BD0
	adds r7, r0, 0
	strb r3, [r1]
_08094BE4:
	cmp r2, 0x6
	beq _08094C16
	mov r0, r12
	strb r7, [r0]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, 4
	mov r1, sp
	ldrb r1, [r1, 0x1]
	orrs r0, r1
	strb r0, [r4]
	mov r0, sp
	ldrb r0, [r0, 0x2]
	lsls r0, 4
	mov r1, sp
	ldrb r1, [r1, 0x3]
	orrs r0, r1
	strb r0, [r4, 0x1]
	mov r0, sp
	ldrb r0, [r0, 0x4]
	lsls r0, 4
	mov r1, sp
	ldrb r1, [r1, 0x5]
	orrs r0, r1
	strb r0, [r4, 0x2]
_08094C16:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8094B6C

	thumb_func_start sub_8094C20
sub_8094C20: @ 8094C20
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0x1
	ands r1, r2
	lsrs r2, r0, 25
	cmp r1, 0
	beq _08094C40
	ldr r0, _08094C3C @ =gUnknown_02038470
	adds r0, r2, r0
	ldrb r0, [r0]
	movs r1, 0xF
	ands r1, r0
	b _08094C48
	.align 2, 0
_08094C3C: .4byte gUnknown_02038470
_08094C40:
	ldr r0, _08094C50 @ =gUnknown_02038470
	adds r0, r2, r0
	ldrb r0, [r0]
	lsrs r1, r0, 4
_08094C48:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_08094C50: .4byte gUnknown_02038470
	thumb_func_end sub_8094C20

	thumb_func_start sub_8094C54
sub_8094C54: @ 8094C54
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	movs r1, 0x1
	ands r1, r3
	lsrs r3, r0, 25
	cmp r1, 0
	beq _08094C7C
	ldr r0, _08094C78 @ =gUnknown_02038470
	adds r0, r3, r0
	ldrb r2, [r0]
	movs r1, 0xF0
	ands r1, r2
	orrs r1, r4
	strb r1, [r0]
	b _08094C8C
	.align 2, 0
_08094C78: .4byte gUnknown_02038470
_08094C7C:
	ldr r2, _08094C94 @ =gUnknown_02038470
	adds r2, r3, r2
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	lsls r1, r4, 4
	orrs r0, r1
	strb r0, [r2]
_08094C8C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08094C94: .4byte gUnknown_02038470
	thumb_func_end sub_8094C54

	thumb_func_start sub_8094C98
sub_8094C98: @ 8094C98
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	adds r0, r5, 0
	bl sub_8094C20
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl sub_8094C20
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_8094C54
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_8094C54
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8094C98

	thumb_func_start pokemon_order_func
pokemon_order_func: @ 8094CD4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r3, 0
	movs r2, 0
	ldr r5, _08094CFC @ =gUnknown_02038470
_08094CE0:
	adds r0, r3, r5
	ldrb r1, [r0]
	lsrs r0, r1, 4
	cmp r0, r4
	beq _08094CF8
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0xF
	ands r0, r1
	cmp r0, r4
	bne _08094D00
_08094CF8:
	adds r0, r2, 0
	b _08094D12
	.align 2, 0
_08094CFC: .4byte gUnknown_02038470
_08094D00:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x2
	bls _08094CE0
	movs r0, 0
_08094D12:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end pokemon_order_func

	thumb_func_start pokemon_change_order
pokemon_change_order: @ 8094D18
	push {r4,r5,lr}
	ldr r0, _08094D58 @ =0x0201b000
	ldr r1, _08094D5C @ =gPlayerParty
	movs r2, 0x96
	lsls r2, 2
	bl memcpy
	movs r4, 0
	movs r5, 0x64
_08094D2A:
	adds r0, r4, 0
	bl pokemon_order_func
	lsls r0, 24
	lsrs r0, 24
	muls r0, r5
	ldr r1, _08094D5C @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	muls r1, r5
	ldr r2, _08094D58 @ =0x0201b000
	adds r1, r2
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08094D2A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094D58: .4byte 0x0201b000
_08094D5C: .4byte gPlayerParty
	thumb_func_end pokemon_change_order

	thumb_func_start sub_8094D60
sub_8094D60: @ 8094D60
	push {r4,r5,lr}
	ldr r4, _08094DA8 @ =0xfffffda8
	add sp, r4
	ldr r1, _08094DAC @ =gPlayerParty
	movs r2, 0x96
	lsls r2, 2
	mov r0, sp
	bl memcpy
	movs r4, 0
	movs r5, 0x64
_08094D76:
	adds r0, r4, 0
	bl sub_8094C20
	lsls r0, 24
	lsrs r0, 24
	muls r0, r5
	ldr r1, _08094DAC @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	muls r1, r5
	add r1, sp
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _08094D76
	movs r3, 0x96
	lsls r3, 2
	add sp, r3
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08094DA8: .4byte 0xfffffda8
_08094DAC: .4byte gPlayerParty
	thumb_func_end sub_8094D60

	thumb_func_start unref_sub_8094DB0
unref_sub_8094DB0: @ 8094DB0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0x1
	movs r7, 0x64
	ldr r0, _08094E08 @ =gPlayerParty
	mov r8, r0
_08094DBE:
	adds r0, r6, 0
	bl sub_8094C20
	lsls r0, 24
	lsrs r0, 24
	muls r0, r7
	mov r1, r8
	adds r5, r0, r1
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08094E0C
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08094E0C
	movs r0, 0
	bl sub_8094C20
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	adds r1, r6, 0
	bl sub_8094C98
	adds r0, r4, 0
	muls r0, r7
	add r0, r8
	adds r1, r5, 0
	bl sub_806E6F0
	b _08094E16
	.align 2, 0
_08094E08: .4byte gPlayerParty
_08094E0C:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x5
	bls _08094DBE
_08094E16:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_8094DB0

	thumb_func_start sub_8094E20
sub_8094E20: @ 8094E20
	push {lr}
	ldr r3, _08094E44 @ =gPaletteFade
	ldrb r1, [r3, 0x8]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r3, 0x8]
	ldr r1, _08094E48 @ =gUnknown_02038473
	strb r0, [r1]
	bl nullsub_14
	bl pokemon_change_order
	movs r0, 0x1
	movs r1, 0xFF
	bl OpenPartyMenu
	pop {r0}
	bx r0
	.align 2, 0
_08094E44: .4byte gPaletteFade
_08094E48: .4byte gUnknown_02038473
	thumb_func_end sub_8094E20

	thumb_func_start sub_8094E4C
sub_8094E4C: @ 8094E4C
	push {lr}
	movs r0, 0x3
	bl sub_8094E20
	pop {r0}
	bx r0
	thumb_func_end sub_8094E4C

	.align 2, 0 @ Don't pad with nop.
