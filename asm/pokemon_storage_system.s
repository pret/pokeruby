	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8095904
sub_8095904: @ 8095904
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	str r0, [sp]
	adds r7, r1, 0
	adds r4, r2, 0
	ldr r0, [sp, 0x3C]
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0x4]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	ldr r0, [sp]
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r4, 0
	bne _08095988
	movs r5, 0
	cmp r5, r8
	bcs _08095A2E
_0809593E:
	ldr r1, [sp]
	adds r0, r1, r5
	ldrb r2, [r0]
	ldr r0, _08095980 @ =0x0000fff0
	ands r0, r2
	lsls r0, 6
	movs r1, 0xF
	ands r2, r1
	lsls r2, 5
	adds r0, r2
	ldr r1, _08095984 @ =gFont3LatinGlyphs
	adds r4, r0, r1
	adds r0, r4, 0
	adds r1, r7, 0
	movs r2, 0x10
	bl CpuSet
	movs r2, 0x80
	lsls r2, 2
	adds r0, r4, r2
	ldr r3, [sp, 0x4]
	adds r1, r7, r3
	movs r2, 0x10
	bl CpuSet
	adds r7, 0x20
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _0809593E
	b _08095A2E
	.align 2, 0
_08095980: .4byte 0x0000fff0
_08095984: .4byte gFont3LatinGlyphs
_08095988:
	movs r0, 0
	mov r9, r0
	ldr r1, [sp, 0x8]
	lsls r0, r1, 28
	lsrs r0, 24
	str r0, [sp, 0xC]
	mov r2, r8
	lsls r0, r2, 21
	movs r1, 0
	lsrs r0, 1
	str r0, [sp, 0x10]
_0809599E:
	movs r5, 0
	ldr r3, [sp, 0x4]
	adds r3, r7, r3
	str r3, [sp, 0x14]
	adds r0, r1, 0x1
	str r0, [sp, 0x18]
	cmp r5, r8
	bcs _08095A12
	movs r2, 0xF
	mov r12, r2
	lsls r1, 9
	ldr r0, _08095A40 @ =gFont3LatinGlyphs
	adds r1, r0
	mov r10, r1
_080959BA:
	ldr r3, [sp]
	adds r0, r3, r5
	ldrb r1, [r0]
	ldr r0, _08095A44 @ =0x0000fff0
	ands r0, r1
	lsls r0, 6
	mov r2, r12
	ands r1, r2
	lsls r1, 5
	adds r0, r1
	mov r3, r10
	adds r4, r0, r3
	movs r6, 0
	adds r5, 0x1
_080959D6:
	ldrb r0, [r4]
	movs r3, 0xF0
	ands r3, r0
	mov r2, r12
	ands r2, r0
	cmp r3, 0
	bne _080959E6
	ldr r3, [sp, 0xC]
_080959E6:
	cmp r2, 0
	bne _080959EC
	ldr r2, [sp, 0x8]
_080959EC:
	mov r0, r9
	adds r1, r0, 0x1
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	ldr r1, [sp, 0x40]
	adds r0, r1, r0
	orrs r3, r2
	strb r3, [r0]
	adds r4, 0x1
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x1F
	bls _080959D6
	lsls r0, r5, 16
	lsrs r5, r0, 16
	cmp r5, r8
	bcc _080959BA
_08095A12:
	ldr r0, [sp, 0x40]
	adds r1, r7, 0
	ldr r3, [sp, 0x10]
	lsrs r2, r3, 16
	bl CpuSet
	ldr r7, [sp, 0x14]
	movs r0, 0
	mov r9, r0
	ldr r1, [sp, 0x18]
	lsls r0, r1, 16
	lsrs r1, r0, 16
	cmp r1, 0x1
	bls _0809599E
_08095A2E:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095A40: .4byte gFont3LatinGlyphs
_08095A44: .4byte 0x0000fff0
	thumb_func_end sub_8095904

	thumb_func_start unref_sub_8095A48
unref_sub_8095A48: @ 8095A48
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r7, r3, 24
	movs r6, 0
_08095A60:
	movs r3, 0
	ldrb r0, [r4]
	adds r1, r0, 0
	adds r2, r0, 0
	cmp r1, 0xFF
	beq _08095ACE
_08095A6C:
	mov r0, sp
	adds r0, r3
	adds r0, 0x8
	strb r2, [r0]
	adds r4, 0x1
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bhi _08095AA8
	ldrb r0, [r4]
	adds r1, r0, 0
	adds r2, r0, 0
	cmp r1, 0xFF
	bne _08095A6C
	cmp r3, 0
	beq _08095ACE
	movs r6, 0x1
	cmp r3, 0x3
	bhi _08095AA8
	movs r2, 0
_08095A96:
	adds r0, r3, 0
	adds r1, r0, 0x1
	lsls r1, 16
	lsrs r3, r1, 16
	add r0, sp
	adds r0, 0x8
	strb r2, [r0]
	cmp r3, 0x3
	bls _08095A96
_08095AA8:
	mov r1, sp
	adds r1, r3
	adds r1, 0x8
	movs r0, 0xFF
	strb r0, [r1]
	str r7, [sp]
	ldr r0, [sp, 0x28]
	str r0, [sp, 0x4]
	add r0, sp, 0x8
	adds r1, r5, 0
	mov r2, r8
	movs r3, 0x80
	bl sub_8095904
	movs r0, 0x80
	lsls r0, 1
	adds r5, r0
	cmp r6, 0
	beq _08095A60
_08095ACE:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_8095A48

	thumb_func_start sub_8095ADC
sub_8095ADC: @ 8095ADC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0
	movs r5, 0
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r6, r0, 5
_08095AF0:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	ldr r1, _08095B20 @ =gPokemonStorage + 0x4
	adds r0, r1
	adds r0, r6, r0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _08095B0C
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08095B0C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bls _08095AF0
	lsls r0, r5, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08095B20: .4byte gPokemonStorage + 0x4
	thumb_func_end sub_8095ADC

	thumb_func_start sub_8095B24
sub_8095B24: @ 8095B24
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r5, r0, 5
_08095B36:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	ldr r1, _08095B54 @ =gPokemonStorage + 0x4
	adds r0, r1
	adds r0, r5, r0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	bne _08095B58
	lsls r0, r4, 16
	asrs r0, 16
	b _08095B66
	.align 2, 0
_08095B54: .4byte gPokemonStorage + 0x4
_08095B58:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bls _08095B36
	movs r0, 0x1
	negs r0, r0
_08095B66:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8095B24

	thumb_func_start sub_8095B6C
sub_8095B6C: @ 8095B6C
	push {r4-r6,lr}
	movs r5, 0
	movs r6, 0
_08095B72:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08095BB0 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08095B9A
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08095B9A
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08095B9A:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _08095B72
	lsls r0, r6, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08095BB0: .4byte gPlayerParty
	thumb_func_end sub_8095B6C

	thumb_func_start CountAlivePartyMonsExceptOne
CountAlivePartyMonsExceptOne: @ 8095BB4
	push {r4-r7,lr}
	lsls r0, 24
	movs r5, 0
	movs r6, 0
	lsrs r7, r0, 24
_08095BBE:
	cmp r5, r7
	beq _08095BF6
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08095C0C @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08095BF6
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08095BF6
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08095BF6
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08095BF6:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _08095BBE
	lsls r0, r6, 24
	lsrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08095C0C: .4byte gPlayerParty
	thumb_func_end CountAlivePartyMonsExceptOne

	thumb_func_start sub_8095C10
sub_8095C10: @ 8095C10
	push {lr}
	ldr r0, _08095C24 @ =gSpecialVar_0x8004
	ldrb r0, [r0]
	bl CountAlivePartyMonsExceptOne
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08095C24: .4byte gSpecialVar_0x8004
	thumb_func_end sub_8095C10

	thumb_func_start StorageSystemGetPartySize
StorageSystemGetPartySize: @ 8095C28
	push {r4,r5,lr}
	movs r4, 0
	movs r5, 0
_08095C2E:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _08095C5C @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08095C46
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08095C46:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x5
	bls _08095C2E
	lsls r0, r5, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08095C5C: .4byte gPlayerParty
	thumb_func_end StorageSystemGetPartySize

	thumb_func_start unref_sub_8095C60
unref_sub_8095C60: @ 8095C60
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r2, 16
	lsrs r4, 16
	bl StringCopy
	adds r1, r0, 0
	adds r5, r4
	cmp r1, r5
	bcs _08095C7E
	movs r0, 0
_08095C76:
	strb r0, [r1]
	adds r1, 0x1
	cmp r1, r5
	bcc _08095C76
_08095C7E:
	movs r0, 0xFF
	strb r0, [r1]
	adds r0, r1, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8095C60

	thumb_func_start sub_8095C8C
sub_8095C8C: @ 8095C8C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	adds r7, r3, 0
	ldr r5, [sp, 0x1C]
	ldr r4, [sp, 0x20]
	ldr r0, [sp, 0x24]
	mov r9, r0
	ldr r0, [sp, 0x28]
	ldr r3, [sp, 0x2C]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r3, 16
	lsrs r3, 16
	mov r0, r9
	lsls r0, 17
	mov r9, r0
	lsrs r2, 11
	adds r2, r1
	lsls r2, 1
	adds r6, r2
	adds r0, r4, 0
	muls r0, r3
	adds r0, r5
	lsls r0, 1
	adds r7, r0
	movs r4, 0
	cmp r4, r8
	bcs _08095CFC
	mov r0, r9
	lsrs r0, 1
	mov r9, r0
	lsls r5, r3, 1
_08095CE2:
	adds r0, r7, 0
	adds r1, r6, 0
	mov r3, r9
	lsrs r2, r3, 16
	bl CpuSet
	adds r6, 0x40
	adds r7, r5
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r8
	bcc _08095CE2
_08095CFC:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8095C8C

	thumb_func_start unref_sub_8095D08
unref_sub_8095D08: @ 8095D08
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r0, [sp, 0x28]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	lsrs r2, 11
	adds r2, r1
	lsls r2, 1
	adds r4, r2
	lsls r3, 17
	lsrs r0, r3, 16
	str r0, [sp, 0x4]
	movs r0, 0
	cmp r0, r10
	bcs _08095DB2
	movs r6, 0x80
	lsls r6, 5
	mov r5, sp
	ldr r7, _08095D74 @ =0x040000d4
	lsrs r3, 17
	mov r9, r3
	mov r1, r9
	movs r2, 0x81
	lsls r2, 24
	orrs r1, r2
	mov r9, r1
_08095D4E:
	adds r3, r4, 0
	ldr r2, [sp, 0x4]
	movs r1, 0x40
	adds r1, r4
	mov r8, r1
	adds r0, 0x1
	mov r12, r0
	cmp r2, r6
	bhi _08095D78
	movs r0, 0
	strh r0, [r5]
	mov r2, sp
	str r2, [r7]
	str r4, [r7, 0x4]
	mov r0, r9
	str r0, [r7, 0x8]
	ldr r0, [r7, 0x8]
	b _08095DA6
	.align 2, 0
_08095D74: .4byte 0x040000d4
_08095D78:
	movs r4, 0
	strh r4, [r5]
	ldr r1, _08095DC4 @ =0x040000d4
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	ldr r0, _08095DC8 @ =0x81000800
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r6
	subs r2, r6
	cmp r2, r6
	bhi _08095D78
	strh r4, [r5]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r2, 1
	movs r2, 0x81
	lsls r2, 24
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_08095DA6:
	mov r4, r8
	mov r1, r12
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, r10
	bcc _08095D4E
_08095DB2:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08095DC4: .4byte 0x040000d4
_08095DC8: .4byte 0x81000800
	thumb_func_end unref_sub_8095D08

	thumb_func_start StorageSystemGetNextMonIndex
StorageSystemGetNextMonIndex: @ 8095DCC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r0, r3, 24
	cmp r0, 0
	beq _08095DE8
	cmp r0, 0x2
	bne _08095DEC
_08095DE8:
	movs r2, 0x1
	b _08095DEE
_08095DEC:
	ldr r2, _08095E38 @ =0x0000ffff
_08095DEE:
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08095E44
	lsls r0, r1, 24
	asrs r0, 24
	lsls r2, 16
	asrs r1, r2, 16
	adds r1, r0
	lsls r0, r1, 16
	asrs r1, r0, 16
	adds r6, r2, 0
	cmp r1, 0
	blt _08095E90
	cmp r1, r7
	bgt _08095E90
_08095E10:
	asrs r4, r0, 16
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	add r0, r8
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	bne _08095E3C
	asrs r0, r6, 16
	adds r0, r4, r0
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	blt _08095E90
	cmp r2, r7
	ble _08095E10
	b _08095E90
	.align 2, 0
_08095E38: .4byte 0x0000ffff
_08095E3C:
	adds r0, r4, 0
	b _08095E94
_08095E40:
	adds r0, r5, 0
	b _08095E94
_08095E44:
	lsls r0, r1, 24
	asrs r0, 24
	lsls r2, 16
	asrs r1, r2, 16
	adds r1, r0
	lsls r0, r1, 16
	asrs r1, r0, 16
	adds r6, r2, 0
	cmp r1, 0
	blt _08095E90
	cmp r1, r7
	bgt _08095E90
_08095E5C:
	asrs r5, r0, 16
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 4
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _08095E80
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetBoxMonData
	cmp r0, 0
	beq _08095E40
_08095E80:
	asrs r0, r6, 16
	adds r0, r5, r0
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	blt _08095E90
	cmp r2, r7
	ble _08095E5C
_08095E90:
	movs r0, 0x1
	negs r0, r0
_08095E94:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end StorageSystemGetNextMonIndex

	thumb_func_start StorageSystemClearMessageWindow
StorageSystemClearMessageWindow: @ 8095EA0
	push {lr}
	movs r0, 0x2
	movs r1, 0xF
	movs r2, 0x1B
	movs r3, 0x12
	bl MenuFillWindowRectWithBlankTile
	pop {r0}
	bx r0
	thumb_func_end StorageSystemClearMessageWindow

	thumb_func_start Task_PokemonStorageSystem
Task_PokemonStorageSystem: @ 8095EB4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08095ED8 @ =gTasks
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _08095ECE
	b _080960F4
_08095ECE:
	lsls r0, 2
	ldr r1, _08095EDC @ =_08095EE0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08095ED8: .4byte gTasks
_08095EDC: .4byte _08095EE0
	.align 2, 0
_08095EE0:
	.4byte _08095EF4
	.4byte _08095F1C
	.4byte _08095F30
	.4byte _08096042
	.4byte _080960DC
_08095EF4:
	ldrb r0, [r4, 0xA]
	bl StorageSystemCreatePrimaryMenu
	bl MenuDisplayMessageBox
	ldr r1, _08095F18 @ =gUnknown_083B600C
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	b _08095F28
	.align 2, 0
_08095F18: .4byte gUnknown_083B600C
_08095F1C:
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	bne _08095F28
	b _080960F4
_08095F28:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080960F4
_08095F30:
	bl ProcessMenuInput
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0xC]
	movs r3, 0xC
	ldrsh r1, [r4, r3]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08095FC8
	cmp r1, r0
	bgt _08095F52
	subs r0, 0x1
	cmp r1, r0
	beq _08095F58
	b _08095FE8
_08095F52:
	cmp r1, 0x3
	beq _08095FC8
	b _08095FE8
_08095F58:
	ldrh r3, [r4, 0xA]
	strh r3, [r4, 0xE]
	ldr r2, _08095FC0 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08095F76
	subs r0, r3, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	cmp r0, 0
	bge _08095F76
	movs r0, 0x3
	strh r0, [r4, 0xE]
_08095F76:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08095F92
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _08095F92
	movs r0, 0
	strh r0, [r4, 0xE]
_08095F92:
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r2, [r4, 0xE]
	movs r3, 0xE
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _08095FA2
	b _080960F4
_08095FA2:
	strh r2, [r4, 0xA]
	bl StorageSystemClearMessageWindow
	ldr r0, _08095FC4 @ =gUnknown_083B600C
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	b _080960F4
	.align 2, 0
_08095FC0: .4byte gMain
_08095FC4: .4byte gUnknown_083B600C
_08095FC8:
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xD
	movs r3, 0x9
	bl MenuZeroFillWindowRect
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
	b _080960F4
_08095FE8:
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _08096008
	bl StorageSystemGetPartySize
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bne _08096008
	bl StorageSystemClearMessageWindow
	ldr r0, _08096004 @ =gPCText_PartyFull2
	b _08096022
	.align 2, 0
_08096004: .4byte gPCText_PartyFull2
_08096008:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _08096034
	bl StorageSystemGetPartySize
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08096034
	bl StorageSystemClearMessageWindow
	ldr r0, _08096030 @ =gPCText_OnlyOne
_08096022:
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	movs r0, 0x3
	strh r0, [r4, 0x8]
	b _080960F4
	.align 2, 0
_08096030: .4byte gPCText_OnlyOne
_08096034:
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	movs r0, 0x4
	strh r0, [r4, 0x8]
	b _080960F4
_08096042:
	ldr r0, _08096088 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r3, 0x3
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _080960B8
	movs r0, 0x40
	ands r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08096090
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bge _0809606A
	strh r3, [r4, 0xA]
_0809606A:
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	bl StorageSystemClearMessageWindow
	ldr r1, _0809608C @ =gUnknown_083B600C
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	b _080960C2
	.align 2, 0
_08096088: .4byte gMain
_0809608C: .4byte gUnknown_083B600C
_08096090:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080960F4
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080960A8
	strh r2, [r4, 0xA]
_080960A8:
	movs r0, 0x1
	bl MoveMenuCursor
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
_080960B8:
	bl StorageSystemClearMessageWindow
	ldr r1, _080960D8 @ =gUnknown_083B600C
	movs r2, 0xA
	ldrsh r0, [r4, r2]
_080960C2:
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080960F4
	.align 2, 0
_080960D8: .4byte gUnknown_083B600C
_080960DC:
	ldr r0, _080960FC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080960F4
	ldrb r0, [r4, 0xC]
	bl task_intro_29
	adds r0, r5, 0
	bl DestroyTask
_080960F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080960FC: .4byte gPaletteFade
	thumb_func_end Task_PokemonStorageSystem

	thumb_func_start ShowPokemonStorageSystem
ShowPokemonStorageSystem: @ 8096100
	push {lr}
	ldr r0, _08096128 @ =Task_PokemonStorageSystem
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0809612C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r0, [r1, 0xA]
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08096128: .4byte Task_PokemonStorageSystem
_0809612C: .4byte gTasks
	thumb_func_end ShowPokemonStorageSystem

	thumb_func_start sub_8096130
sub_8096130: @ 8096130
	push {lr}
	ldr r0, _0809615C @ =Task_PokemonStorageSystem
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08096160 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	ldr r0, _08096164 @ =gUnknown_02038474
	ldrb r0, [r0]
	strh r0, [r1, 0xA]
	bl pal_fill_black
	pop {r0}
	bx r0
	.align 2, 0
_0809615C: .4byte Task_PokemonStorageSystem
_08096160: .4byte gTasks
_08096164: .4byte gUnknown_02038474
	thumb_func_end sub_8096130

	thumb_func_start StorageSystemCreatePrimaryMenu
StorageSystemCreatePrimaryMenu: @ 8096168
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0xD
	movs r3, 0x9
	bl MenuDrawTextWindow
	ldr r3, _080961A4 @ =gUnknown_083B600C
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x4
	bl PrintMenuItems
	str r4, [sp]
	movs r0, 0xC
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x4
	bl InitMenu
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080961A4: .4byte gUnknown_083B600C
	thumb_func_end StorageSystemCreatePrimaryMenu

	thumb_func_start sub_80961A8
sub_80961A8: @ 80961A8
	push {lr}
	ldr r1, _080961C4 @ =gUnknown_02038474
	ldr r0, _080961C8 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	strb r0, [r1]
	ldr r1, _080961CC @ =gUnknown_0300485C
	ldr r0, _080961D0 @ =sub_8096130
	str r0, [r1]
	ldr r0, _080961D4 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080961C4: .4byte gUnknown_02038474
_080961C8: .4byte gUnknown_083B6DB4
_080961CC: .4byte gUnknown_0300485C
_080961D0: .4byte sub_8096130
_080961D4: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_80961A8

	thumb_func_start sub_80961D8
sub_80961D8: @ 80961D8
	push {r4-r7,lr}
	ldr r1, _08096258 @ =gPokemonStorage
	movs r0, 0
	strb r0, [r1]
	movs r5, 0
	adds r7, r1, 0x4
_080961E4:
	movs r4, 0
	lsls r1, r5, 2
	adds r1, r5
	lsls r0, r1, 4
	subs r0, r1
	lsls r6, r0, 5
_080961F0:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	adds r0, r7
	adds r0, r6, r0
	bl ZeroBoxMonData
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bls _080961F0
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xD
	bls _080961E4
	movs r5, 0
_08096214:
	lsls r0, r5, 3
	adds r0, r5
	ldr r6, _0809625C @ =gPokemonStorage + 0x8344
	adds r0, r6
	ldr r1, _08096260 @ =gPCText_BOX
	bl StringCopy
	adds r4, r5, 0x1
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	lsls r4, 16
	lsrs r5, r4, 16
	cmp r5, 0xD
	bls _08096214
	movs r5, 0
	adds r3, r6, 0
	adds r3, 0x7E
	movs r2, 0x3
_0809623E:
	adds r0, r5, r3
	adds r1, r5, 0
	ands r1, r2
	strb r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xD
	bls _0809623E
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08096258: .4byte gPokemonStorage
_0809625C: .4byte gPokemonStorage + 0x8344
_08096260: .4byte gPCText_BOX
	thumb_func_end sub_80961D8

	thumb_func_start sub_8096264
sub_8096264: @ 8096264
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x20
	mov r8, r0
	adds r4, r1, 0
	adds r6, r2, 0
	mov r9, r3
	lsls r4, 16
	lsrs r4, 16
	lsls r6, 16
	lsrs r6, 16
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _080962F4 @ =gBoxSelectionPopupPalette
	str r0, [sp, 0x18]
	ldr r1, _080962F8 @ =0xffff0000
	add r5, sp, 0x18
	ldr r0, [r5, 0x4]
	ands r0, r1
	orrs r0, r6
	str r0, [r5, 0x4]
	mov r1, sp
	ldr r0, _080962FC @ =gBoxSelectionPopupCenterTiles
	str r0, [sp]
	movs r0, 0x80
	lsls r0, 4
	strh r0, [r1, 0x4]
	strh r4, [r1, 0x6]
	ldr r0, _08096300 @ =gBoxSelectionPopupSidesTiles
	str r0, [sp, 0x8]
	movs r0, 0xC0
	lsls r0, 1
	strh r0, [r1, 0xC]
	adds r0, r4, 0x1
	strh r0, [r1, 0xE]
	add r0, sp, 0x10
	movs r1, 0
	movs r2, 0x8
	bl memset
	adds r0, r5, 0
	bl LoadSpritePalette
	mov r0, sp
	bl LoadSpriteSheets
	ldr r0, _08096304 @ =gUnknown_02038478
	mov r1, r8
	str r1, [r0]
	movs r0, 0x90
	lsls r0, 2
	add r0, r8
	strh r4, [r0]
	ldr r0, _08096308 @ =0x00000242
	add r0, r8
	strh r6, [r0]
	ldr r0, _0809630C @ =0x0000023e
	add r8, r0
	mov r0, r9
	mov r1, r8
	strb r0, [r1]
	add sp, 0x20
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080962F4: .4byte gBoxSelectionPopupPalette
_080962F8: .4byte 0xffff0000
_080962FC: .4byte gBoxSelectionPopupCenterTiles
_08096300: .4byte gBoxSelectionPopupSidesTiles
_08096304: .4byte gUnknown_02038478
_08096308: .4byte 0x00000242
_0809630C: .4byte 0x0000023e
	thumb_func_end sub_8096264

	thumb_func_start sub_8096310
sub_8096310: @ 8096310
	push {r4,r5,lr}
	ldr r4, _08096344 @ =gUnknown_02038478
	ldr r0, [r4]
	ldr r1, _08096348 @ =0x00000242
	adds r0, r1
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
	ldr r0, [r4]
	movs r5, 0x90
	lsls r5, 2
	adds r0, r5
	ldrh r0, [r0]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	adds r0, r5
	ldrh r0, [r0]
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpriteTilesByTag
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096344: .4byte gUnknown_02038478
_08096348: .4byte 0x00000242
	thumb_func_end sub_8096310

	thumb_func_start sub_809634C
sub_809634C: @ 809634C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80963D0
	pop {r0}
	bx r0
	thumb_func_end sub_809634C

	thumb_func_start sub_809635C
sub_809635C: @ 809635C
	push {lr}
	bl sub_809658C
	pop {r0}
	bx r0
	thumb_func_end sub_809635C

	thumb_func_start sub_8096368
sub_8096368: @ 8096368
	push {lr}
	ldr r0, _08096380 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08096384
	movs r0, 0x5
	bl PlaySE
	movs r0, 0xC9
	b _080963CC
	.align 2, 0
_08096380: .4byte gMain
_08096384:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080963A4
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080963A0 @ =gUnknown_02038478
	ldr r0, [r0]
	movs r1, 0x8F
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	b _080963CC
	.align 2, 0
_080963A0: .4byte gUnknown_02038478
_080963A4:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080963B8
	movs r0, 0x5
	bl PlaySE
	bl sub_809662C
	b _080963CA
_080963B8:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080963CA
	movs r0, 0x5
	bl PlaySE
	bl sub_80965F8
_080963CA:
	movs r0, 0xC8
_080963CC:
	pop {r1}
	bx r1
	thumb_func_end sub_8096368

	thumb_func_start sub_80963D0
sub_80963D0: @ 80963D0
	push {r4-r6,lr}
	sub sp, 0x3C
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0
	movs r1, 0
	str r0, [sp, 0x34]
	str r1, [sp, 0x38]
	movs r1, 0xC0
	lsls r1, 24
	ldr r0, [sp, 0x34]
	orrs r0, r1
	str r0, [sp, 0x34]
	ldr r1, _08096564 @ =0xffff0fff
	add r4, sp, 0x34
	ldr r0, [r4, 0x4]
	ands r0, r1
	movs r1, 0x80
	lsls r1, 5
	orrs r0, r1
	str r0, [r4, 0x4]
	add r1, sp, 0x1C
	movs r2, 0
	strh r2, [r1]
	mov r0, sp
	adds r0, 0x1E
	strh r2, [r0]
	str r4, [sp, 0x20]
	ldr r0, _08096568 @ =gDummySpriteAnimTable
	str r0, [sp, 0x24]
	str r2, [sp, 0x28]
	ldr r0, _0809656C @ =gDummySpriteAffineAnimTable
	str r0, [sp, 0x2C]
	ldr r0, _08096570 @ =SpriteCallbackDummy
	str r0, [sp, 0x30]
	add r0, sp, 0x4
	movs r2, 0x18
	bl memcpy
	ldr r6, _08096574 @ =gUnknown_02038478
	ldr r0, [r6]
	movs r1, 0x8F
	lsls r1, 2
	adds r0, r1
	strb r5, [r0]
	add r2, sp, 0x4
	ldr r1, [r6]
	movs r5, 0x90
	lsls r5, 2
	adds r0, r1, r5
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r3, _08096578 @ =0x00000242
	adds r1, r3
	ldrh r0, [r1]
	strh r0, [r2, 0x2]
	adds r0, r2, 0
	movs r1, 0xA0
	movs r2, 0x60
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r3, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809657C @ =gSprites
	adds r0, r1
	str r0, [r3]
	ldrb r2, [r4, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x80
	orrs r0, r2
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	ands r1, r0
	movs r0, 0x40
	orrs r1, r0
	strb r1, [r4, 0x3]
	add r1, sp, 0x4
	adds r3, r5
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r1]
	ldr r0, _08096580 @ =gSpriteAnimTable_83B604C
	str r0, [sp, 0xC]
	movs r4, 0
_08096488:
	ldr r0, [r6]
	ldr r1, _08096584 @ =0x0000023e
	adds r0, r1
	ldrb r3, [r0]
	add r0, sp, 0x4
	movs r1, 0x7C
	movs r2, 0x50
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r2, [r6]
	lsls r3, r4, 2
	adds r2, 0x4
	adds r2, r3
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809657C @ =gSprites
	adds r1, r0, r1
	str r1, [r2]
	movs r5, 0
	movs r0, 0x2
	ands r0, r4
	cmp r0, 0
	beq _080964C2
	movs r0, 0xC4
	strh r0, [r1, 0x20]
	movs r5, 0x2
_080964C2:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080964E6
	ldr r1, [r6]
	adds r1, 0x4
	adds r1, r3
	ldr r2, [r1]
	movs r0, 0x70
	strh r0, [r2, 0x22]
	ldr r2, [r1]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x3]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_080964E6:
	ldr r0, [r6]
	adds r0, 0x4
	adds r0, r3
	ldr r0, [r0]
	lsls r1, r5, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _08096488
	movs r4, 0
	ldr r5, _08096574 @ =gUnknown_02038478
_08096504:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 19
	movs r3, 0xF8
	lsls r3, 15
	adds r0, r3
	lsrs r0, 16
	lsls r2, r4, 24
	lsrs r2, 24
	ldr r1, [r5]
	ldr r3, _08096584 @ =0x0000023e
	adds r1, r3
	ldrb r1, [r1]
	str r1, [sp]
	movs r1, 0x58
	movs r3, 0
	bl sub_809A9A0
	adds r2, r0, 0
	ldr r0, [r5]
	lsls r1, r4, 2
	adds r0, 0x20
	adds r0, r1
	str r2, [r0]
	cmp r2, 0
	beq _0809654C
	movs r1, 0x1
	cmp r4, 0
	bne _08096544
	movs r3, 0x1
	negs r3, r3
	adds r1, r3, 0
_08096544:
	strh r1, [r2, 0x2E]
	ldr r1, [r0]
	ldr r0, _08096588 @ =sub_8096784
	str r0, [r1, 0x1C]
_0809654C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _08096504
	bl sub_809665C
	add sp, 0x3C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096564: .4byte 0xffff0fff
_08096568: .4byte gDummySpriteAnimTable
_0809656C: .4byte gDummySpriteAffineAnimTable
_08096570: .4byte SpriteCallbackDummy
_08096574: .4byte gUnknown_02038478
_08096578: .4byte 0x00000242
_0809657C: .4byte gSprites
_08096580: .4byte gSpriteAnimTable_83B604C
_08096584: .4byte 0x0000023e
_08096588: .4byte sub_8096784
	thumb_func_end sub_80963D0

	thumb_func_start sub_809658C
sub_809658C: @ 809658C
	push {r4-r6,lr}
	ldr r4, _080965F4 @ =gUnknown_02038478
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, 0
	beq _080965A2
	bl DestroySprite
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1]
_080965A2:
	movs r5, 0
	adds r6, r4, 0
_080965A6:
	ldr r0, [r6]
	lsls r4, r5, 2
	adds r0, 0x4
	adds r0, r4
	ldr r0, [r0]
	cmp r0, 0
	beq _080965C2
	bl DestroySprite
	ldr r0, [r6]
	adds r0, 0x4
	adds r0, r4
	movs r1, 0
	str r1, [r0]
_080965C2:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080965A6
	movs r5, 0
_080965CE:
	ldr r0, _080965F4 @ =gUnknown_02038478
	ldr r0, [r0]
	lsls r1, r5, 2
	adds r0, 0x20
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _080965E2
	bl DestroySprite
_080965E2:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _080965CE
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080965F4: .4byte gUnknown_02038478
	thumb_func_end sub_809658C

	thumb_func_start sub_80965F8
sub_80965F8: @ 80965F8
	push {lr}
	ldr r2, _08096628 @ =gUnknown_02038478
	ldr r1, [r2]
	movs r0, 0x8F
	lsls r0, 2
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD
	bls _0809661E
	ldr r0, [r2]
	movs r1, 0x8F
	lsls r1, 2
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0809661E:
	bl sub_809665C
	pop {r0}
	bx r0
	.align 2, 0
_08096628: .4byte gUnknown_02038478
	thumb_func_end sub_80965F8

	thumb_func_start sub_809662C
sub_809662C: @ 809662C
	push {lr}
	ldr r0, _08096644 @ =gUnknown_02038478
	ldr r2, [r0]
	movs r1, 0x8F
	lsls r1, 2
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08096648
	subs r1, r0, 0x1
	b _0809664A
	.align 2, 0
_08096644: .4byte gUnknown_02038478
_08096648:
	movs r1, 0xD
_0809664A:
	movs r3, 0x8F
	lsls r3, 2
	adds r0, r2, r3
	strb r1, [r0]
	bl sub_809665C
	pop {r0}
	bx r0
	thumb_func_end sub_809662C

	thumb_func_start sub_809665C
sub_809665C: @ 809665C
	push {r4-r7,lr}
	ldr r5, _080966B4 @ =gUnknown_02038478
	ldr r0, [r5]
	movs r4, 0x8F
	lsls r4, 2
	adds r0, r4
	ldrb r0, [r0]
	bl sub_8095ADC
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _080966B8 @ =gStringVar1
	movs r6, 0xFC
	strb r6, [r2]
	movs r0, 0x4
	strb r0, [r2, 0x1]
	movs r0, 0xF
	strb r0, [r2, 0x2]
	movs r0, 0x1
	strb r0, [r2, 0x3]
	movs r0, 0xE
	strb r0, [r2, 0x4]
	adds r2, 0x5
	ldr r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	lsls r1, r0, 3
	adds r1, r0
	ldr r0, _080966BC @ =gPokemonStorage + 0x8344
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	movs r0, 0xFE
	strb r0, [r2]
	strb r6, [r2, 0x1]
	movs r0, 0x11
	strb r0, [r2, 0x2]
	cmp r7, 0x9
	bhi _080966C0
	movs r0, 0x28
	b _080966C2
	.align 2, 0
_080966B4: .4byte gUnknown_02038478
_080966B8: .4byte gStringVar1
_080966BC: .4byte gPokemonStorage + 0x8344
_080966C0:
	movs r0, 0x22
_080966C2:
	strb r0, [r2, 0x3]
	adds r2, 0x4
	adds r0, r2, 0
	adds r1, r7, 0
	bl ConvertIntToDecimalString
	adds r2, r0, 0
	movs r0, 0xBA
	strb r0, [r2]
	movs r0, 0xA4
	strb r0, [r2, 0x1]
	movs r0, 0xA1
	strb r0, [r2, 0x2]
	movs r0, 0xFF
	strb r0, [r2, 0x3]
	ldr r0, _080966F0 @ =gStringVar1
	movs r1, 0
	movs r2, 0x1
	bl sub_80966F4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080966F0: .4byte gStringVar1
	thumb_func_end sub_809665C

	thumb_func_start sub_80966F4
sub_80966F4: @ 80966F4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	mov r8, r0
	adds r5, r1, 0
	adds r4, r2, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08096764 @ =gUnknown_02038478
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 2
	adds r0, r1
	ldrh r0, [r0]
	bl GetSpriteTileStartByTag
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 11
	lsls r4, 8
	ldr r2, _08096768 @ =0x06010000
	adds r4, r2
	adds r6, r4
	lsls r5, 5
	adds r6, r5
	ldr r0, _0809676C @ =gUnknown_083B6DB8
	ldr r5, [r0]
	mov r1, sp
	ldr r2, _08096770 @ =0x00001111
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _08096774 @ =0x040000d4
	str r1, [r4]
	str r5, [r4, 0x4]
	ldr r0, _08096778 @ =0x81000200
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _0809677C @ =gWindowConfig_81E6D38
	adds r1, r5, 0
	mov r2, r8
	bl sub_8004E3C
	str r5, [r4]
	str r6, [r4, 0x4]
	ldr r0, _08096780 @ =0x80000200
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096764: .4byte gUnknown_02038478
_08096768: .4byte 0x06010000
_0809676C: .4byte gUnknown_083B6DB8
_08096770: .4byte 0x00001111
_08096774: .4byte 0x040000d4
_08096778: .4byte 0x81000200
_0809677C: .4byte gWindowConfig_81E6D38
_08096780: .4byte 0x80000200
	thumb_func_end sub_80966F4

	thumb_func_start sub_8096784
sub_8096784: @ 8096784
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080967B4
	strh r2, [r1, 0x30]
	ldrh r0, [r1, 0x2E]
	ldrh r3, [r1, 0x24]
	adds r0, r3
	strh r0, [r1, 0x24]
	ldrh r0, [r1, 0x32]
	adds r0, 0x1
	strh r0, [r1, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080967B4
	strh r2, [r1, 0x32]
	strh r2, [r1, 0x24]
_080967B4:
	pop {r0}
	bx r0
	thumb_func_end sub_8096784

	thumb_func_start task_intro_29
task_intro_29: @ 80967B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080967D0 @ =gUnknown_0203847D
	strb r0, [r1]
	ldr r1, _080967D4 @ =0x02000000
	strb r0, [r1, 0x5]
	ldr r0, _080967D8 @ =sub_8096884
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080967D0: .4byte gUnknown_0203847D
_080967D4: .4byte 0x02000000
_080967D8: .4byte sub_8096884
	thumb_func_end task_intro_29

	thumb_func_start sub_80967DC
sub_80967DC: @ 80967DC
	ldr r0, _08096800 @ =REG_BG0HOFS
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08096800: .4byte REG_BG0HOFS
	thumb_func_end sub_80967DC

	thumb_func_start sub_8096804
sub_8096804: @ 8096804
	push {lr}
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeSpriteTileRanges
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r1, _0809683C @ =gReservedSpriteTileCount
	movs r2, 0xA0
	lsls r2, 2
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08096840 @ =0x02000020
	adds r1, r0, 0
	adds r1, 0x8
	movs r2, 0x8
	bl sub_809CFDC
	ldr r1, _08096844 @ =gKeyRepeatStartDelay
	movs r0, 0x14
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0809683C: .4byte gReservedSpriteTileCount
_08096840: .4byte 0x02000020
_08096844: .4byte gKeyRepeatStartDelay
	thumb_func_end sub_8096804

	thumb_func_start sub_8096848
sub_8096848: @ 8096848
	push {lr}
	bl sub_809B0D4
	ldr r2, _08096868 @ =gUnknown_0203847C
	movs r1, 0
	ldr r0, _0809686C @ =0x02000000
	ldrb r0, [r0, 0x5]
	cmp r0, 0x1
	bne _0809685C
	movs r1, 0x1
_0809685C:
	strb r1, [r2]
	ldr r1, _08096870 @ =gUnknown_0203847E
	movs r0, 0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08096868: .4byte gUnknown_0203847C
_0809686C: .4byte 0x02000000
_08096870: .4byte gUnknown_0203847E
	thumb_func_end sub_8096848

	thumb_func_start sub_8096874
sub_8096874: @ 8096874
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	thumb_func_end sub_8096874

	thumb_func_start sub_8096884
sub_8096884: @ 8096884
	push {lr}
	ldr r0, _080968A0 @ =gMain
	ldr r1, _080968A4 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _08096894
	b _08096986
_08096894:
	lsls r0, 2
	ldr r1, _080968A8 @ =_080968AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080968A0: .4byte gMain
_080968A4: .4byte 0x0000043c
_080968A8: .4byte _080968AC
	.align 2, 0
_080968AC:
	.4byte _080968D4
	.4byte _080968E8
	.4byte _080968F4
	.4byte _08096904
	.4byte _0809690E
	.4byte _08096918
	.4byte _0809691E
	.4byte _08096924
	.4byte _0809692A
	.4byte _08096964
_080968D4:
	movs r0, 0
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	bl sub_8096804
	b _0809697A
_080968E8:
	ldr r0, _080968F0 @ =gWindowConfig_81E6D00
	bl SetUpWindowConfig
	b _0809697A
	.align 2, 0
_080968F0: .4byte gWindowConfig_81E6D00
_080968F4:
	ldr r0, _08096900 @ =gWindowConfig_81E6D00
	bl InitMenuWindow
	bl MenuZeroFillScreen
	b _0809697A
	.align 2, 0
_08096900: .4byte gWindowConfig_81E6D00
_08096904:
	bl sub_80967DC
	bl sub_8096848
	b _0809697A
_0809690E:
	bl sub_8098B48
	bl sub_809AA24
	b _0809697A
_08096918:
	bl sub_8097DE0
	b _0809697A
_0809691E:
	bl sub_8097E70
	b _0809697A
_08096924:
	bl sub_8098400
	b _0809697A
_0809692A:
	ldr r0, _08096950 @ =gPokemonStorage
	ldrb r0, [r0]
	bl sub_8099BF8
	ldr r2, _08096954 @ =0x02000000
	ldr r1, _08096958 @ =0x000012bc
	adds r0, r2, r1
	movs r1, 0xA
	strh r1, [r0]
	ldr r1, _0809695C @ =0x000012be
	adds r2, r1
	ldr r1, _08096960 @ =0x0000dacb
	strh r1, [r2]
	bl sub_80F727C
	bl sub_80F7404
	b _0809697A
	.align 2, 0
_08096950: .4byte gPokemonStorage
_08096954: .4byte 0x02000000
_08096958: .4byte 0x000012bc
_0809695C: .4byte 0x000012be
_08096960: .4byte 0x0000dacb
_08096964:
	bl sub_8096874
	ldr r0, _0809698C @ =sub_8096BF0
	bl sub_8096BE0
	ldr r0, _08096990 @ =sub_8096B38
	bl SetMainCallback2
	ldr r0, _08096994 @ =sub_8096AFC
	bl SetVBlankCallback
_0809697A:
	ldr r1, _08096998 @ =gMain
	ldr r0, _0809699C @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08096986:
	pop {r0}
	bx r0
	.align 2, 0
_0809698C: .4byte sub_8096BF0
_08096990: .4byte sub_8096B38
_08096994: .4byte sub_8096AFC
_08096998: .4byte gMain
_0809699C: .4byte 0x0000043c
	thumb_func_end sub_8096884

	thumb_func_start sub_80969A0
sub_80969A0: @ 80969A0
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080969BC @ =gMain
	ldr r1, _080969C0 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xA
	bls _080969B2
	b _08096AE4
_080969B2:
	lsls r0, 2
	ldr r1, _080969C4 @ =_080969C8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080969BC: .4byte gMain
_080969C0: .4byte 0x0000043c
_080969C4: .4byte _080969C8
	.align 2, 0
_080969C8:
	.4byte _080969F4
	.4byte _08096A34
	.4byte _08096A40
	.4byte _08096A50
	.4byte _08096A56
	.4byte _08096A60
	.4byte _08096A66
	.4byte _08096A6C
	.4byte _08096A72
	.4byte _08096AAC
	.4byte _08096AC8
_080969F4:
	movs r0, 0
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08096A28 @ =0x02000000
	ldr r0, _08096A2C @ =gUnknown_0203847D
	ldrb r0, [r0]
	strb r0, [r1, 0x5]
	bl sub_8096804
	ldr r4, _08096A30 @ =gUnknown_0203847F
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _08096A1A
	bl sub_809BBC0
_08096A1A:
	ldrb r0, [r4]
	cmp r0, 0
	bne _08096AD8
	bl sub_809BD14
	b _08096AD8
	.align 2, 0
_08096A28: .4byte 0x02000000
_08096A2C: .4byte gUnknown_0203847D
_08096A30: .4byte gUnknown_0203847F
_08096A34:
	ldr r0, _08096A3C @ =gWindowConfig_81E6D00
	bl SetUpWindowConfig
	b _08096AD8
	.align 2, 0
_08096A3C: .4byte gWindowConfig_81E6D00
_08096A40:
	ldr r0, _08096A4C @ =gWindowConfig_81E6D00
	bl InitMenuWindow
	bl MenuZeroFillScreen
	b _08096AD8
	.align 2, 0
_08096A4C: .4byte gWindowConfig_81E6D00
_08096A50:
	bl sub_80967DC
	b _08096AD8
_08096A56:
	bl sub_8098B48
	bl sub_809AA98
	b _08096AD8
_08096A60:
	bl sub_8097DE0
	b _08096AD8
_08096A66:
	bl sub_8097E70
	b _08096AD8
_08096A6C:
	bl sub_8098400
	b _08096AD8
_08096A72:
	ldr r0, _08096A98 @ =gPokemonStorage
	ldrb r0, [r0]
	bl sub_8099BF8
	ldr r2, _08096A9C @ =0x02000000
	ldr r1, _08096AA0 @ =0x000012bc
	adds r0, r2, r1
	movs r1, 0xA
	strh r1, [r0]
	ldr r1, _08096AA4 @ =0x000012be
	adds r2, r1
	ldr r1, _08096AA8 @ =0x0000dacb
	strh r1, [r2]
	bl sub_80F727C
	bl sub_80F7404
	b _08096AD8
	.align 2, 0
_08096A98: .4byte gPokemonStorage
_08096A9C: .4byte 0x02000000
_08096AA0: .4byte 0x000012bc
_08096AA4: .4byte 0x000012be
_08096AA8: .4byte 0x0000dacb
_08096AAC:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08096AC4 @ =sub_8096AFC
	bl SetVBlankCallback
	b _08096AD8
	.align 2, 0
_08096AC4: .4byte sub_8096AFC
_08096AC8:
	bl sub_8096874
	ldr r0, _08096AEC @ =sub_8096C68
	bl sub_8096BE0
	ldr r0, _08096AF0 @ =sub_8096B38
	bl SetMainCallback2
_08096AD8:
	ldr r1, _08096AF4 @ =gMain
	ldr r0, _08096AF8 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08096AE4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096AEC: .4byte sub_8096C68
_08096AF0: .4byte sub_8096B38
_08096AF4: .4byte gMain
_08096AF8: .4byte 0x0000043c
	thumb_func_end sub_80969A0

	thumb_func_start sub_8096AFC
sub_8096AFC: @ 8096AFC
	push {lr}
	ldr r2, _08096B2C @ =REG_BG2HOFS
	ldr r1, _08096B30 @ =0x02000000
	ldr r3, _08096B34 @ =0x000008b4
	adds r0, r1, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, 0x4
	ldrh r0, [r1, 0xA]
	strh r0, [r2]
	adds r2, 0x2
	ldrh r0, [r1, 0x8]
	strh r0, [r2]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl sub_809CFF0
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
_08096B2C: .4byte REG_BG2HOFS
_08096B30: .4byte 0x02000000
_08096B34: .4byte 0x000008b4
	thumb_func_end sub_8096AFC

	thumb_func_start sub_8096B38
sub_8096B38: @ 8096B38
	push {lr}
	ldr r0, _08096B58 @ =0x02000000
	ldr r0, [r0]
	bl _call_via_r0
	bl sub_8097E44
	bl sub_8098734
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r0}
	bx r0
	.align 2, 0
_08096B58: .4byte 0x02000000
	thumb_func_end sub_8096B38

	thumb_func_start sub_8096B5C
sub_8096B5C: @ 8096B5C
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, _08096B70 @ =0x02000000
	ldrb r0, [r4, 0x6]
	cmp r0, 0
	beq _08096B74
	cmp r0, 0x1
	beq _08096BAC
	b _08096BCC
	.align 2, 0
_08096B70: .4byte 0x02000000
_08096B74:
	ldr r1, _08096B98 @ =0x00002690
	adds r0, r4, r1
	ldr r0, [r0]
	ldr r2, _08096B9C @ =0x0000268d
	adds r1, r4, r2
	ldrb r1, [r1]
	ldr r3, _08096BA0 @ =0x0000268c
	adds r2, r4, r3
	ldrb r2, [r2]
	ldr r3, _08096BA4 @ =sub_80969A0
	ldr r5, _08096BA8 @ =0x0000268e
	adds r4, r5
	ldrb r4, [r4]
	str r4, [sp]
	bl ShowPokemonSummaryScreen
	b _08096BCC
	.align 2, 0
_08096B98: .4byte 0x00002690
_08096B9C: .4byte 0x0000268d
_08096BA0: .4byte 0x0000268c
_08096BA4: .4byte sub_80969A0
_08096BA8: .4byte 0x0000268e
_08096BAC:
	ldr r0, _08096BD4 @ =gPokemonStorage
	ldrb r2, [r0]
	lsls r1, r2, 3
	adds r1, r2
	ldr r2, _08096BD8 @ =0x00008344
	adds r0, r2
	adds r1, r0
	movs r0, 0
	str r0, [sp]
	ldr r0, _08096BDC @ =sub_80969A0
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r2, 0
	movs r3, 0
	bl DoNamingScreen
_08096BCC:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08096BD4: .4byte gPokemonStorage
_08096BD8: .4byte 0x00008344
_08096BDC: .4byte sub_80969A0
	thumb_func_end sub_8096B5C

	thumb_func_start sub_8096BE0
sub_8096BE0: @ 8096BE0
	ldr r1, _08096BEC @ =0x02000000
	str r0, [r1]
	movs r0, 0
	strb r0, [r1, 0x4]
	bx lr
	.align 2, 0
_08096BEC: .4byte 0x02000000
	thumb_func_end sub_8096BE0

	thumb_func_start sub_8096BF0
sub_8096BF0: @ 8096BF0
	push {r4,lr}
	ldr r4, _08096C04 @ =0x02000000
	ldrb r0, [r4, 0x4]
	cmp r0, 0x1
	beq _08096C16
	cmp r0, 0x1
	bgt _08096C08
	cmp r0, 0
	beq _08096C0E
	b _08096C5C
	.align 2, 0
_08096C04: .4byte 0x02000000
_08096C08:
	cmp r0, 0x2
	beq _08096C4C
	b _08096C5C
_08096C0E:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	b _08096C38
_08096C16:
	movs r0, 0x2
	bl PlaySE
	movs r1, 0
	movs r0, 0xE
	strh r0, [r4, 0xC]
	ldr r0, _08096C48 @ =0x0000dad0
	strh r0, [r4, 0xE]
	strh r1, [r4, 0x10]
	strh r1, [r4, 0x12]
	adds r0, r4, 0
	adds r0, 0xC
	bl sub_80C5CD4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
_08096C38:
	movs r2, 0
	bl BlendPalettes
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _08096C5C
	.align 2, 0
_08096C48: .4byte 0x0000dad0
_08096C4C:
	bl sub_80C5DCC
	lsls r0, 24
	cmp r0, 0
	beq _08096C5C
	ldr r0, _08096C64 @ =sub_8096C84
	bl sub_8096BE0
_08096C5C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096C64: .4byte sub_8096C84
	thumb_func_end sub_8096BF0

	thumb_func_start sub_8096C68
sub_8096C68: @ 8096C68
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08096C7A
	ldr r0, _08096C80 @ =sub_8096C84
	bl sub_8096BE0
_08096C7A:
	pop {r0}
	bx r0
	.align 2, 0
_08096C80: .4byte sub_8096C84
	thumb_func_end sub_8096C68

	thumb_func_start sub_8096C84
sub_8096C84: @ 8096C84
	push {r4,lr}
	ldr r0, _08096C9C @ =0x02000000
	ldrb r0, [r0, 0x4]
	cmp r0, 0x6
	bls _08096C90
	b _08096FBA
_08096C90:
	lsls r0, 2
	ldr r1, _08096CA0 @ =_08096CA4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08096C9C: .4byte 0x02000000
_08096CA0: .4byte _08096CA4
	.align 2, 0
_08096CA4:
	.4byte _08096CC0
	.4byte _08096EE0
	.4byte _08096F1C
	.4byte _08096F60
	.4byte _08096F80
	.4byte _08096F8A
	.4byte _08096FA4
_08096CC0:
	bl sub_809CA40
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0xF
	bls _08096CD0
	b _08096FBA
_08096CD0:
	lsls r0, 2
	ldr r1, _08096CDC @ =_08096CE0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08096CDC: .4byte _08096CE0
	.align 2, 0
_08096CE0:
	.4byte _08096D20
	.4byte _08096FBA
	.4byte _08096FBA
	.4byte _08096D94
	.4byte _08096D34
	.4byte _08096D5C
	.4byte _08096DAC
	.4byte _08096DC0
	.4byte _08096DD4
	.4byte _08096DFC
	.4byte _08096E30
	.4byte _08096EB8
	.4byte _08096E70
	.4byte _08096E8C
	.4byte _08096ECC
	.4byte _08096DA0
_08096D20:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08096D30 @ =0x02000000
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _08096FBA
	.align 2, 0
_08096D30: .4byte 0x02000000
_08096D34:
	ldr r4, _08096D48 @ =0x02000000
	ldrb r0, [r4, 0x5]
	cmp r0, 0x2
	beq _08096D4C
	movs r0, 0x10
	bl sub_8098898
	movs r0, 0x3
	strb r0, [r4, 0x4]
	b _08096FBA
	.align 2, 0
_08096D48: .4byte 0x02000000
_08096D4C:
	bl sub_809B0D4
	ldr r0, _08096D58 @ =sub_8096FC8
	bl sub_8096BE0
	b _08096FBA
	.align 2, 0
_08096D58: .4byte sub_8096FC8
_08096D5C:
	ldr r4, _08096D88 @ =0x02000000
	ldrb r0, [r4, 0x5]
	cmp r0, 0x2
	beq _08096D66
	b _08096FBA
_08096D66:
	bl sub_809BF20
	lsls r0, 24
	cmp r0, 0
	beq _08096D80
	ldr r1, _08096D8C @ =0x000011f2
	adds r0, r4, r1
	ldrh r0, [r0]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	bne _08096E4C
_08096D80:
	ldr r0, _08096D90 @ =sub_8097004
	bl sub_8096BE0
	b _08096FBA
	.align 2, 0
_08096D88: .4byte 0x02000000
_08096D8C: .4byte 0x000011f2
_08096D90: .4byte sub_8097004
_08096D94:
	ldr r0, _08096D9C @ =sub_8097BA0
	bl sub_8096BE0
	b _08096FBA
	.align 2, 0
_08096D9C: .4byte sub_8097BA0
_08096DA0:
	ldr r0, _08096DA8 @ =sub_8097CC0
	bl sub_8096BE0
	b _08096FBA
	.align 2, 0
_08096DA8: .4byte sub_8097CC0
_08096DAC:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08096DBC @ =sub_809789C
	bl sub_8096BE0
	b _08096FBA
	.align 2, 0
_08096DBC: .4byte sub_809789C
_08096DC0:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08096DD0 @ =sub_8097078
	bl sub_8096BE0
	b _08096FBA
	.align 2, 0
_08096DD0: .4byte sub_8097078
_08096DD4:
	movs r0, 0x5
	bl PlaySE
	ldr r4, _08096DF0 @ =0x02000000
	ldr r0, _08096DF4 @ =gPokemonStorage
	ldrb r0, [r0]
	adds r0, 0x1
	ldr r2, _08096DF8 @ =0x000008b2
	adds r1, r4, r2
	strh r0, [r1]
	cmp r0, 0xD
	ble _08096E18
	movs r0, 0
	b _08096E16
	.align 2, 0
_08096DF0: .4byte 0x02000000
_08096DF4: .4byte gPokemonStorage
_08096DF8: .4byte 0x000008b2
_08096DFC:
	movs r0, 0x5
	bl PlaySE
	ldr r4, _08096E24 @ =0x02000000
	ldr r0, _08096E28 @ =gPokemonStorage
	ldrb r0, [r0]
	subs r0, 0x1
	ldr r2, _08096E2C @ =0x000008b2
	adds r1, r4, r2
	strh r0, [r1]
	cmp r0, 0
	bge _08096E18
	movs r0, 0xD
_08096E16:
	strh r0, [r1]
_08096E18:
	ldrb r0, [r1]
	bl sub_8099C70
	movs r0, 0x2
	strb r0, [r4, 0x4]
	b _08096FBA
	.align 2, 0
_08096E24: .4byte 0x02000000
_08096E28: .4byte gPokemonStorage
_08096E2C: .4byte 0x000008b2
_08096E30:
	bl sub_809BE80
	lsls r0, 24
	cmp r0, 0
	bne _08096E96
	ldr r4, _08096E54 @ =0x02000000
	ldr r1, _08096E58 @ =0x000011f2
	adds r0, r4, r1
	ldrh r0, [r0]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _08096E5C
_08096E4C:
	movs r0, 0x5
	strb r0, [r4, 0x4]
	b _08096FBA
	.align 2, 0
_08096E54: .4byte 0x02000000
_08096E58: .4byte 0x000011f2
_08096E5C:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08096E6C @ =sub_809746C
	bl sub_8096BE0
	b _08096FBA
	.align 2, 0
_08096E6C: .4byte sub_809746C
_08096E70:
	bl sub_809BE80
	lsls r0, 24
	cmp r0, 0
	bne _08096E96
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08096E88 @ =sub_80972A8
	bl sub_8096BE0
	b _08096FBA
	.align 2, 0
_08096E88: .4byte sub_80972A8
_08096E8C:
	bl sub_809BEBC
	lsls r0, 24
	cmp r0, 0
	bne _08096EA4
_08096E96:
	ldr r1, _08096EA0 @ =0x02000000
	movs r0, 0x4
	strb r0, [r1, 0x4]
	b _08096FBA
	.align 2, 0
_08096EA0: .4byte 0x02000000
_08096EA4:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08096EB4 @ =c3_0808DC50
	bl sub_8096BE0
	b _08096FBA
	.align 2, 0
_08096EB4: .4byte c3_0808DC50
_08096EB8:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08096EC8 @ =sub_8097390
	bl sub_8096BE0
	b _08096FBA
	.align 2, 0
_08096EC8: .4byte sub_8097390
_08096ECC:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08096EDC @ =sub_80972FC
	bl sub_8096BE0
	b _08096FBA
	.align 2, 0
_08096EDC: .4byte sub_80972FC
_08096EE0:
	bl sub_809AC00
	lsls r0, 24
	cmp r0, 0
	bne _08096FBA
	bl sub_809BF48
	lsls r0, 24
	cmp r0, 0
	beq _08096EFA
	bl sub_80986E8
	b _08096EFE
_08096EFA:
	bl sub_8098710
_08096EFE:
	ldr r4, _08096F14 @ =0x02000000
	ldr r2, _08096F18 @ =0x000011f6
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08096F0E
	bl BoxSetMosaic
_08096F0E:
	movs r0, 0
	strb r0, [r4, 0x4]
	b _08096FBA
	.align 2, 0
_08096F14: .4byte 0x02000000
_08096F18: .4byte 0x000011f6
_08096F1C:
	bl sub_8099D34
	lsls r0, 24
	cmp r0, 0
	bne _08096FBA
	ldr r1, _08096F50 @ =gPokemonStorage
	ldr r0, _08096F54 @ =0x02000000
	ldr r2, _08096F58 @ =0x000008b2
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	ldr r0, _08096F5C @ =gUnknown_0203847C
	ldrb r0, [r0]
	cmp r0, 0
	bne _08096F70
	bl sub_809BF20
	lsls r0, 24
	cmp r0, 0
	bne _08096F70
	bl sub_809B440
	bl BoxSetMosaic
	b _08096F70
	.align 2, 0
_08096F50: .4byte gPokemonStorage
_08096F54: .4byte 0x02000000
_08096F58: .4byte 0x000008b2
_08096F5C: .4byte gUnknown_0203847C
_08096F60:
	ldr r0, _08096F78 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _08096FBA
	bl sub_8098A5C
_08096F70:
	ldr r1, _08096F7C @ =0x02000000
	movs r0, 0
	strb r0, [r1, 0x4]
	b _08096FBA
	.align 2, 0
_08096F78: .4byte gMain
_08096F7C: .4byte 0x02000000
_08096F80:
	movs r0, 0x20
	bl PlaySE
	movs r0, 0xD
	b _08096F92
_08096F8A:
	movs r0, 0x20
	bl PlaySE
	movs r0, 0x16
_08096F92:
	bl sub_8098898
	ldr r1, _08096FA0 @ =0x02000000
	movs r0, 0x6
	strb r0, [r1, 0x4]
	b _08096FBA
	.align 2, 0
_08096FA0: .4byte 0x02000000
_08096FA4:
	ldr r0, _08096FC0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _08096FBA
	bl sub_8098A5C
	ldr r0, _08096FC4 @ =sub_8096C84
	bl sub_8096BE0
_08096FBA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096FC0: .4byte gMain
_08096FC4: .4byte sub_8096C84
	thumb_func_end sub_8096C84

	thumb_func_start sub_8096FC8
sub_8096FC8: @ 8096FC8
	push {r4,lr}
	ldr r4, _08096FD8 @ =0x02000000
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _08096FDC
	cmp r0, 0x1
	beq _08096FE8
	b _08096FF8
	.align 2, 0
_08096FD8: .4byte 0x02000000
_08096FDC:
	bl sub_809880C
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _08096FF8
_08096FE8:
	bl sub_8098830
	lsls r0, 24
	cmp r0, 0
	bne _08096FF8
	ldr r0, _08097000 @ =sub_8096C84
	bl sub_8096BE0
_08096FF8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097000: .4byte sub_8096C84
	thumb_func_end sub_8096FC8

	thumb_func_start sub_8097004
sub_8097004: @ 8097004
	push {r4,lr}
	ldr r4, _08097018 @ =0x02000000
	ldrb r0, [r4, 0x4]
	cmp r0, 0x1
	beq _0809702E
	cmp r0, 0x1
	bgt _0809701C
	cmp r0, 0
	beq _08097022
	b _0809706A
	.align 2, 0
_08097018: .4byte 0x02000000
_0809701C:
	cmp r0, 0x2
	beq _0809704C
	b _0809706A
_08097022:
	movs r0, 0x5
	bl PlaySE
	bl add_to_c3_somehow
	b _08097044
_0809702E:
	bl sub_80985CC
	lsls r0, 24
	cmp r0, 0
	bne _0809706A
	bl sub_809B0F4
	lsls r0, 24
	lsrs r0, 24
	bl sub_809B0C0
_08097044:
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _0809706A
_0809704C:
	bl sub_809AC00
	lsls r0, 24
	cmp r0, 0
	bne _0809706A
	ldr r1, _08097070 @ =0x000011f6
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08097064
	bl BoxSetMosaic
_08097064:
	ldr r0, _08097074 @ =sub_8096C84
	bl sub_8096BE0
_0809706A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097070: .4byte 0x000011f6
_08097074: .4byte sub_8096C84
	thumb_func_end sub_8097004

	thumb_func_start sub_8097078
sub_8097078: @ 8097078
	push {r4,lr}
	ldr r0, _08097090 @ =0x02000000
	ldrb r0, [r0, 0x4]
	cmp r0, 0x5
	bls _08097084
	b _0809729A
_08097084:
	lsls r0, 2
	ldr r1, _08097094 @ =_08097098
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08097090: .4byte 0x02000000
_08097094: .4byte _08097098
	.align 2, 0
_08097098:
	.4byte _080970B0
	.4byte _080970C8
	.4byte _08097258
	.4byte _0809726C
	.4byte _08097262
	.4byte _08097284
_080970B0:
	movs r0, 0x4
	bl sub_8098898
	bl sub_809CE84
	ldr r1, _080970C4 @ =0x02000000
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _0809729A
	.align 2, 0
_080970C4: .4byte 0x02000000
_080970C8:
	bl sub_809CF30
	adds r0, 0x1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bls _080970D8
	b _0809729A
_080970D8:
	lsls r0, 2
	ldr r1, _080970E4 @ =_080970E8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080970E4: .4byte _080970E8
	.align 2, 0
_080970E8:
	.4byte _08097110
	.4byte _08097110
	.4byte _08097190
	.4byte _08097178
	.4byte _08097120
	.4byte _08097158
	.4byte _08097140
	.4byte _08097230
	.4byte _080971CC
	.4byte _08097244
_08097110:
	bl sub_8098A5C
	ldr r0, _0809711C @ =sub_8096C84
	bl sub_8096BE0
	b _0809729A
	.align 2, 0
_0809711C: .4byte sub_8096C84
_08097120:
	bl sub_809BE80
	lsls r0, 24
	cmp r0, 0
	bne _080971D6
	movs r0, 0x5
	bl PlaySE
	bl sub_8098A5C
	ldr r0, _0809713C @ =sub_80972A8
	bl sub_8096BE0
	b _0809729A
	.align 2, 0
_0809713C: .4byte sub_80972A8
_08097140:
	movs r0, 0x5
	bl PlaySE
	bl sub_8098A5C
	ldr r0, _08097154 @ =sub_80972FC
	bl sub_8096BE0
	b _0809729A
	.align 2, 0
_08097154: .4byte sub_80972FC
_08097158:
	bl sub_809BEBC
	lsls r0, 24
	cmp r0, 0
	beq _080971D6
	movs r0, 0x5
	bl PlaySE
	bl sub_8098A5C
	ldr r0, _08097174 @ =c3_0808DC50
	bl sub_8096BE0
	b _0809729A
	.align 2, 0
_08097174: .4byte c3_0808DC50
_08097178:
	movs r0, 0x5
	bl PlaySE
	bl sub_8098A5C
	ldr r0, _0809718C @ =sub_8097390
	bl sub_8096BE0
	b _0809729A
	.align 2, 0
_0809718C: .4byte sub_8097390
_08097190:
	bl sub_809BE80
	lsls r0, 24
	cmp r0, 0
	bne _080971D6
	ldr r4, _080971C0 @ =0x02000000
	ldr r1, _080971C4 @ =0x000011f2
	adds r0, r4, r1
	ldrh r0, [r0]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	bne _08097210
	movs r0, 0x5
	bl PlaySE
	bl sub_8098A5C
	ldr r0, _080971C8 @ =sub_809746C
	bl sub_8096BE0
	b _0809729A
	.align 2, 0
_080971C0: .4byte 0x02000000
_080971C4: .4byte 0x000011f2
_080971C8: .4byte sub_809746C
_080971CC:
	bl sub_809BE80
	lsls r0, 24
	cmp r0, 0
	beq _080971E4
_080971D6:
	ldr r1, _080971E0 @ =0x02000000
	movs r0, 0x2
	strb r0, [r1, 0x4]
	b _0809729A
	.align 2, 0
_080971E0: .4byte 0x02000000
_080971E4:
	ldr r4, _080971F8 @ =0x02000000
	ldr r1, _080971FC @ =0x000011f9
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08097200
	movs r0, 0x4
	strb r0, [r4, 0x4]
	b _0809729A
	.align 2, 0
_080971F8: .4byte 0x02000000
_080971FC: .4byte 0x000011f9
_08097200:
	ldr r1, _08097218 @ =0x000011f2
	adds r0, r4, r1
	ldrh r0, [r0]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0809721C
_08097210:
	movs r0, 0x3
	strb r0, [r4, 0x4]
	b _0809729A
	.align 2, 0
_08097218: .4byte 0x000011f2
_0809721C:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0809722C @ =sub_8097594
	bl sub_8096BE0
	b _0809729A
	.align 2, 0
_0809722C: .4byte sub_8097594
_08097230:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08097240 @ =sub_8097788
	bl sub_8096BE0
	b _0809729A
	.align 2, 0
_08097240: .4byte sub_8097788
_08097244:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08097254 @ =sub_80977E4
	bl sub_8096BE0
	b _0809729A
	.align 2, 0
_08097254: .4byte sub_80977E4
_08097258:
	movs r0, 0x20
	bl PlaySE
	movs r0, 0xD
	b _08097274
_08097262:
	movs r0, 0x20
	bl PlaySE
	movs r0, 0x11
	b _08097274
_0809726C:
	movs r0, 0x20
	bl PlaySE
	movs r0, 0x16
_08097274:
	bl sub_8098898
	ldr r1, _08097280 @ =0x02000000
	movs r0, 0x5
	strb r0, [r1, 0x4]
	b _0809729A
	.align 2, 0
_08097280: .4byte 0x02000000
_08097284:
	ldr r0, _080972A0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _0809729A
	bl sub_8098A5C
	ldr r0, _080972A4 @ =sub_8096C84
	bl sub_8096BE0
_0809729A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080972A0: .4byte gMain
_080972A4: .4byte sub_8096C84
	thumb_func_end sub_8097078

	thumb_func_start sub_80972A8
sub_80972A8: @ 80972A8
	push {r4,lr}
	ldr r4, _080972B8 @ =0x02000000
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _080972BC
	cmp r0, 0x1
	beq _080972CA
	b _080972F2
	.align 2, 0
_080972B8: .4byte 0x02000000
_080972BC:
	movs r0, 0
	bl sub_809B100
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _080972F2
_080972CA:
	bl sub_809B130
	lsls r0, 24
	cmp r0, 0
	bne _080972F2
	ldr r0, _080972E4 @ =gUnknown_0203847C
	ldrb r0, [r0]
	cmp r0, 0
	beq _080972EC
	ldr r0, _080972E8 @ =sub_8097858
	bl sub_8096BE0
	b _080972F2
	.align 2, 0
_080972E4: .4byte gUnknown_0203847C
_080972E8: .4byte sub_8097858
_080972EC:
	ldr r0, _080972F8 @ =sub_8096C84
	bl sub_8096BE0
_080972F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080972F8: .4byte sub_8096C84
	thumb_func_end sub_80972A8

	thumb_func_start sub_80972FC
sub_80972FC: @ 80972FC
	push {r4,lr}
	ldr r4, _0809730C @ =0x02000000
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _08097310
	cmp r0, 0x1
	beq _0809731E
	b _08097346
	.align 2, 0
_0809730C: .4byte 0x02000000
_08097310:
	movs r0, 0x1
	bl sub_809B100
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _08097346
_0809731E:
	bl sub_809B130
	lsls r0, 24
	cmp r0, 0
	bne _08097346
	ldr r0, _08097338 @ =gUnknown_0203847C
	ldrb r0, [r0]
	cmp r0, 0
	beq _08097340
	ldr r0, _0809733C @ =sub_8097858
	bl sub_8096BE0
	b _08097346
	.align 2, 0
_08097338: .4byte gUnknown_0203847C
_0809733C: .4byte sub_8097858
_08097340:
	ldr r0, _0809734C @ =sub_8096C84
	bl sub_8096BE0
_08097346:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809734C: .4byte sub_8096C84
	thumb_func_end sub_80972FC

	thumb_func_start c3_0808DC50
c3_0808DC50: @ 8097350
	push {r4,lr}
	ldr r4, _08097360 @ =0x02000000
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _08097364
	cmp r0, 0x1
	beq _08097372
	b _08097386
	.align 2, 0
_08097360: .4byte 0x02000000
_08097364:
	movs r0, 0x2
	bl sub_809B100
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _08097386
_08097372:
	bl sub_809B130
	lsls r0, 24
	cmp r0, 0
	bne _08097386
	bl BoxSetMosaic
	ldr r0, _0809738C @ =sub_8096C84
	bl sub_8096BE0
_08097386:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809738C: .4byte sub_8096C84
	thumb_func_end c3_0808DC50

	thumb_func_start sub_8097390
sub_8097390: @ 8097390
	push {lr}
	ldr r0, _080973A4 @ =0x02000000
	ldrb r0, [r0, 0x4]
	cmp r0, 0x5
	bhi _08097462
	lsls r0, 2
	ldr r1, _080973A8 @ =_080973AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080973A4: .4byte 0x02000000
_080973A8: .4byte _080973AC
	.align 2, 0
_080973AC:
	.4byte _080973C4
	.4byte _080973FC
	.4byte _0809741C
	.4byte _0809742C
	.4byte _0809743E
	.4byte _0809745C
_080973C4:
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	bne _080973E4
	movs r0, 0xE
	bl sub_8098898
	ldr r1, _080973E0 @ =0x02000000
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _08097462
	.align 2, 0
_080973E0: .4byte 0x02000000
_080973E4:
	bl sub_809B0E0
	movs r0, 0
	bl sub_809B100
	ldr r1, _080973F8 @ =0x02000000
	movs r0, 0x2
	strb r0, [r1, 0x4]
	b _08097462
	.align 2, 0
_080973F8: .4byte 0x02000000
_080973FC:
	ldr r0, _08097414 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _08097462
	bl sub_8098A5C
	ldr r0, _08097418 @ =sub_8096C84
	bl sub_8096BE0
	b _08097462
	.align 2, 0
_08097414: .4byte gMain
_08097418: .4byte sub_8096C84
_0809741C:
	bl sub_809B130
	lsls r0, 24
	cmp r0, 0
	bne _08097462
	bl sub_809880C
	b _0809744C
_0809742C:
	bl sub_8098830
	lsls r0, 24
	cmp r0, 0
	bne _08097462
	movs r0, 0x1
	bl sub_809B100
	b _0809744C
_0809743E:
	bl sub_809B130
	lsls r0, 24
	cmp r0, 0
	bne _08097462
	bl sub_80987DC
_0809744C:
	ldr r1, _08097458 @ =0x02000000
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _08097462
	.align 2, 0
_08097458: .4byte 0x02000000
_0809745C:
	ldr r0, _08097468 @ =sub_8097004
	bl sub_8096BE0
_08097462:
	pop {r0}
	bx r0
	.align 2, 0
_08097468: .4byte sub_8097004
	thumb_func_end sub_8097390

	thumb_func_start sub_809746C
sub_809746C: @ 809746C
	push {r4,lr}
	ldr r0, _08097484 @ =0x02000000
	ldrb r0, [r0, 0x4]
	cmp r0, 0x4
	bls _08097478
	b _08097584
_08097478:
	lsls r0, 2
	ldr r1, _08097488 @ =_0809748C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08097484: .4byte 0x02000000
_08097488: .4byte _0809748C
	.align 2, 0
_0809748C:
	.4byte _080974A0
	.4byte _080974D8
	.4byte _08097534
	.4byte _08097548
	.4byte _0809756C
_080974A0:
	movs r0, 0x6
	bl sub_8098898
	ldr r4, _080974C8 @ =0x02002370
	ldr r2, _080974CC @ =0x0000daca
	adds r0, r4, 0
	movs r1, 0x7
	movs r3, 0x3
	bl sub_8096264
	ldr r0, _080974D0 @ =gUnknown_0203847E
	ldrb r0, [r0]
	bl sub_809634C
	ldr r0, _080974D4 @ =0xffffdc90
	adds r4, r0
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _08097584
	.align 2, 0
_080974C8: .4byte 0x02002370
_080974CC: .4byte 0x0000daca
_080974D0: .4byte gUnknown_0203847E
_080974D4: .4byte 0xffffdc90
_080974D8:
	bl sub_8096368
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xC8
	beq _08097584
	cmp r4, 0xC9
	bne _080974F6
	bl sub_8098A5C
	bl sub_809635C
	bl sub_8096310
	b _0809755E
_080974F6:
	adds r0, r4, 0
	bl sub_809B62C
	lsls r0, 24
	cmp r0, 0
	beq _08097518
	bl sub_8098A5C
	bl sub_809635C
	bl sub_8096310
	ldr r1, _08097514 @ =0x02000000
	movs r0, 0x2
	b _08097522
	.align 2, 0
_08097514: .4byte 0x02000000
_08097518:
	movs r0, 0x8
	bl sub_8098898
	ldr r1, _0809752C @ =0x02000000
	movs r0, 0x4
_08097522:
	strb r0, [r1, 0x4]
	ldr r0, _08097530 @ =gUnknown_0203847E
	strb r4, [r0]
	b _08097584
	.align 2, 0
_0809752C: .4byte 0x02000000
_08097530: .4byte gUnknown_0203847E
_08097534:
	bl party_compaction
	bl sub_8099310
	ldr r1, _08097544 @ =0x02000000
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	b _08097582
	.align 2, 0
_08097544: .4byte 0x02000000
_08097548:
	bl sub_8099374
	lsls r0, 24
	cmp r0, 0
	bne _08097584
	bl sub_809B6BC
	bl BoxSetMosaic
	bl sub_80987DC
_0809755E:
	ldr r0, _08097568 @ =sub_8096C84
	bl sub_8096BE0
	b _08097584
	.align 2, 0
_08097568: .4byte sub_8096C84
_0809756C:
	ldr r0, _0809758C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08097584
	movs r0, 0x6
	bl sub_8098898
	ldr r1, _08097590 @ =0x02000000
	movs r0, 0x1
_08097582:
	strb r0, [r1, 0x4]
_08097584:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809758C: .4byte gMain
_08097590: .4byte 0x02000000
	thumb_func_end sub_809746C

	thumb_func_start sub_8097594
sub_8097594: @ 8097594
	push {r4,lr}
	ldr r0, _080975AC @ =0x02000000
	ldrb r0, [r0, 0x4]
	cmp r0, 0xD
	bls _080975A0
	b _0809777A
_080975A0:
	lsls r0, 2
	ldr r1, _080975B0 @ =_080975B4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080975AC: .4byte 0x02000000
_080975B0: .4byte _080975B4
	.align 2, 0
_080975B4:
	.4byte _080975EC
	.4byte _08097600
	.4byte _0809763A
	.4byte _0809766E
	.4byte _0809767A
	.4byte _08097690
	.4byte _080976C8
	.4byte _080976E0
	.4byte _080976EC
	.4byte _080976F0
	.4byte _08097704
	.4byte _08097720
	.4byte _08097732
	.4byte _08097764
_080975EC:
	movs r0, 0x9
	bl sub_8098898
	movs r0, 0x1
	bl sub_8098A38
	ldr r1, _0809761C @ =0x02000000
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
_08097600:
	bl ProcessMenuInputNoWrap
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0809762C
	cmp r1, 0
	bgt _08097620
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08097626
	b _0809777A
	.align 2, 0
_0809761C: .4byte 0x02000000
_08097620:
	cmp r1, 0x1
	beq _08097626
	b _0809777A
_08097626:
	bl sub_8098A5C
	b _080976E0
_0809762C:
	bl sub_8098A5C
	bl sub_809B7D4
	bl sub_809B6DC
	b _08097744
_0809763A:
	bl sub_809B960
	bl sub_809B734
	lsls r0, 24
	cmp r0, 0
	beq _0809764A
	b _0809777A
_0809764A:
	ldr r4, _08097650 @ =0x02000000
	b _0809765A
	.align 2, 0
_08097650: .4byte 0x02000000
_08097654:
	cmp r0, 0
	bne _0809765A
	b _08097758
_0809765A:
	bl sub_809B960
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _08097654
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _0809777A
_0809766E:
	bl sub_809B760
	bl sub_809801C
	movs r0, 0xA
	b _08097740
_0809767A:
	ldr r0, _0809768C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08097688
	b _0809777A
_08097688:
	movs r0, 0xB
	b _08097740
	.align 2, 0
_0809768C: .4byte gMain
_08097690:
	ldr r0, _080976B4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _0809777A
	bl sub_8098A5C
	ldr r0, _080976B8 @ =gUnknown_0203847C
	ldrb r0, [r0]
	cmp r0, 0
	beq _080976BC
	bl party_compaction
	bl sub_8099310
	b _08097744
	.align 2, 0
_080976B4: .4byte gMain
_080976B8: .4byte gUnknown_0203847C
_080976BC:
	ldr r1, _080976C4 @ =0x02000000
	movs r0, 0x7
	strb r0, [r1, 0x4]
	b _0809777A
	.align 2, 0
_080976C4: .4byte 0x02000000
_080976C8:
	bl sub_8099374
	lsls r0, 24
	cmp r0, 0
	bne _0809777A
	bl sub_809B440
	bl BoxSetMosaic
	bl sub_80987DC
	b _08097744
_080976E0:
	ldr r0, _080976E8 @ =sub_8096C84
	bl sub_8096BE0
	b _0809777A
	.align 2, 0
_080976E8: .4byte sub_8096C84
_080976EC:
	movs r0, 0xA
	b _08097740
_080976F0:
	ldr r0, _08097700 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _0809777A
	movs r0, 0x15
	b _08097740
	.align 2, 0
_08097700: .4byte gMain
_08097704:
	ldr r0, _0809771C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _0809777A
	bl sub_8098A5C
	bl sub_8099958
	b _08097744
	.align 2, 0
_0809771C: .4byte gMain
_08097720:
	bl sub_8099990
	lsls r0, 24
	cmp r0, 0
	bne _0809777A
	bl sub_809B7AC
	movs r0, 0x13
	b _08097740
_08097732:
	ldr r0, _08097750 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _0809777A
	movs r0, 0x14
_08097740:
	bl sub_8098898
_08097744:
	ldr r1, _08097754 @ =0x02000000
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _0809777A
	.align 2, 0
_08097750: .4byte gMain
_08097754: .4byte 0x02000000
_08097758:
	ldr r1, _08097760 @ =0x02000000
	movs r0, 0x8
	strb r0, [r1, 0x4]
	b _0809777A
	.align 2, 0
_08097760: .4byte 0x02000000
_08097764:
	ldr r0, _08097780 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _0809777A
	bl sub_8098A5C
	ldr r0, _08097784 @ =sub_8096C84
	bl sub_8096BE0
_0809777A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097780: .4byte gMain
_08097784: .4byte sub_8096C84
	thumb_func_end sub_8097594

	thumb_func_start sub_8097788
sub_8097788: @ 8097788
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _0809779C @ =0x02000000
	ldrb r4, [r5, 0x4]
	cmp r4, 0
	beq _080977A0
	cmp r4, 0x1
	beq _080977BC
	b _080977D4
	.align 2, 0
_0809779C: .4byte 0x02000000
_080977A0:
	bl sub_809BC18
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrb r0, [r5, 0x4]
	adds r0, 0x1
	strb r0, [r5, 0x4]
	b _080977D4
_080977BC:
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080977D4
	ldr r0, _080977DC @ =gUnknown_0203847F
	strb r1, [r0]
	strb r1, [r5, 0x6]
	ldr r0, _080977E0 @ =sub_8096B5C
	bl SetMainCallback2
_080977D4:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080977DC: .4byte gUnknown_0203847F
_080977E0: .4byte sub_8096B5C
	thumb_func_end sub_8097788

	thumb_func_start sub_80977E4
sub_80977E4: @ 80977E4
	push {r4,lr}
	ldr r4, _080977F4 @ =0x02000000
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _080977F8
	cmp r0, 0x1
	beq _08097824
	b _0809784C
	.align 2, 0
_080977F4: .4byte 0x02000000
_080977F8:
	movs r0, 0xC
	bl sub_8098898
	ldr r0, _08097820 @ =0x000011f7
	adds r2, r4, r0
	ldrb r1, [r2]
	movs r3, 0x96
	lsls r3, 5
	adds r0, r4, r3
	strb r1, [r0]
	ldrb r0, [r2]
	movs r1, 0xB0
	movs r2, 0x10
	bl sub_80F7418
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _0809784C
	.align 2, 0
_08097820: .4byte 0x000011f7
_08097824:
	bl sub_80F7500
	lsls r0, 24
	cmp r0, 0
	bne _0809784C
	bl sub_80F7470
	bl sub_8098A5C
	movs r1, 0x96
	lsls r1, 5
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_809BDD8
	bl sub_809801C
	ldr r0, _08097854 @ =sub_8096C84
	bl sub_8096BE0
_0809784C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097854: .4byte sub_8096C84
	thumb_func_end sub_80977E4

	thumb_func_start sub_8097858
sub_8097858: @ 8097858
	push {r4,lr}
	ldr r4, _08097868 @ =0x02000000
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _0809786C
	cmp r0, 0x1
	beq _0809787C
	b _08097890
	.align 2, 0
_08097868: .4byte 0x02000000
_0809786C:
	bl party_compaction
	bl sub_8099310
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _08097890
_0809787C:
	bl sub_8099374
	lsls r0, 24
	cmp r0, 0
	bne _08097890
	bl sub_80987DC
	ldr r0, _08097898 @ =sub_8096C84
	bl sub_8096BE0
_08097890:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097898: .4byte sub_8096C84
	thumb_func_end sub_8097858

	thumb_func_start sub_809789C
sub_809789C: @ 809789C
	push {r4,lr}
	ldr r4, _080978AC @ =0x02000000
	ldrb r0, [r4, 0x4]
	cmp r0, 0
	beq _080978B0
	cmp r0, 0x1
	beq _080978C2
	b _08097968
	.align 2, 0
_080978AC: .4byte 0x02000000
_080978B0:
	movs r0, 0x1
	bl sub_8098898
	bl sub_809CE84
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _08097968
_080978C2:
	bl sub_809CF30
	adds r0, 0x1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bhi _08097968
	lsls r0, 2
	ldr r1, _080978DC @ =_080978E0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080978DC: .4byte _080978E0
	.align 2, 0
_080978E0:
	.4byte _08097914
	.4byte _08097914
	.4byte _08097968
	.4byte _08097968
	.4byte _08097968
	.4byte _08097968
	.4byte _08097968
	.4byte _08097968
	.4byte _08097968
	.4byte _08097968
	.4byte _08097958
	.4byte _08097940
	.4byte _0809792C
_08097914:
	movs r0, 0x1
	bl sub_809A860
	bl sub_8098A5C
	ldr r0, _08097928 @ =sub_8096C84
	bl sub_8096BE0
	b _08097968
	.align 2, 0
_08097928: .4byte sub_8096C84
_0809792C:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0809793C @ =sub_8097B44
	bl sub_8096BE0
	b _08097968
	.align 2, 0
_0809793C: .4byte sub_8097B44
_08097940:
	movs r0, 0x5
	bl PlaySE
	bl sub_8098A5C
	ldr r0, _08097954 @ =sub_8097974
	bl sub_8096BE0
	b _08097968
	.align 2, 0
_08097954: .4byte sub_8097974
_08097958:
	movs r0, 0x5
	bl PlaySE
	bl sub_8098A5C
	ldr r0, _08097970 @ =sub_8097A64
	bl sub_8096BE0
_08097968:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097970: .4byte sub_8097A64
	thumb_func_end sub_809789C

	thumb_func_start sub_8097974
sub_8097974: @ 8097974
	push {r4,r5,lr}
	ldr r5, _08097988 @ =0x02000000
	ldrb r0, [r5, 0x4]
	cmp r0, 0x1
	beq _080979A2
	cmp r0, 0x1
	bgt _0809798C
	cmp r0, 0
	beq _08097996
	b _08097A5A
	.align 2, 0
_08097988: .4byte 0x02000000
_0809798C:
	cmp r0, 0x2
	beq _080979FC
	cmp r0, 0x3
	beq _08097A44
	b _08097A5A
_08097996:
	bl sub_8098A80
	movs r0, 0x2
	bl sub_8098898
	b _08097A3C
_080979A2:
	bl sub_809CF30
	ldr r1, _080979CC @ =0x00000d5e
	adds r4, r5, r1
	strh r0, [r4]
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080979D4
	movs r0, 0x1
	bl sub_809A860
	bl sub_8098A5C
	ldr r0, _080979D0 @ =sub_8096C84
	bl sub_8096BE0
	b _08097A5A
	.align 2, 0
_080979CC: .4byte 0x00000d5e
_080979D0: .4byte sub_8096C84
_080979D4:
	cmp r0, r1
	blt _08097A5A
	cmp r0, 0xF
	bgt _08097A5A
	cmp r0, 0xC
	blt _08097A5A
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4]
	subs r0, 0xC
	strh r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8098AA8
	movs r0, 0x3
	bl sub_8098898
	b _08097A3C
_080979FC:
	bl sub_809CF30
	movs r1, 0xD6
	lsls r1, 4
	adds r4, r5, r1
	strh r0, [r4]
	movs r0, 0
	ldrsh r1, [r4, r0]
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _08097A5A
	adds r0, 0x1
	cmp r1, r0
	bne _08097A24
	bl sub_8098A5C
	movs r0, 0
	strb r0, [r5, 0x4]
	b _08097A5A
_08097A24:
	movs r0, 0x5
	bl PlaySE
	bl sub_8098A5C
	ldrh r0, [r4]
	subs r0, 0x10
	strh r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8099DCC
_08097A3C:
	ldrb r0, [r5, 0x4]
	adds r0, 0x1
	strb r0, [r5, 0x4]
	b _08097A5A
_08097A44:
	bl sub_8099E08
	lsls r0, 24
	cmp r0, 0
	bne _08097A5A
	movs r0, 0x1
	bl sub_809A860
	ldr r0, _08097A60 @ =sub_8096C84
	bl sub_8096BE0
_08097A5A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097A60: .4byte sub_8096C84
	thumb_func_end sub_8097974

	thumb_func_start sub_8097A64
sub_8097A64: @ 8097A64
	push {r4,r5,lr}
	ldr r5, _08097A78 @ =0x02000000
	ldrb r0, [r5, 0x4]
	cmp r0, 0x1
	beq _08097AB0
	cmp r0, 0x1
	bgt _08097A7C
	cmp r0, 0
	beq _08097A86
	b _08097B32
	.align 2, 0
_08097A78: .4byte 0x02000000
_08097A7C:
	cmp r0, 0x2
	beq _08097B00
	cmp r0, 0x3
	beq _08097B18
	b _08097B32
_08097A86:
	movs r0, 0x5
	bl sub_8098898
	ldr r1, _08097AA4 @ =0x00002370
	adds r0, r5, r1
	ldr r2, _08097AA8 @ =0x0000daca
	movs r1, 0x7
	movs r3, 0x3
	bl sub_8096264
	ldr r0, _08097AAC @ =gPokemonStorage
	ldrb r0, [r0]
	bl sub_809634C
	b _08097B0A
	.align 2, 0
_08097AA4: .4byte 0x00002370
_08097AA8: .4byte 0x0000daca
_08097AAC: .4byte gPokemonStorage
_08097AB0:
	bl sub_8096368
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08097AF4 @ =0x000008b2
	adds r4, r5, r2
	strh r0, [r4]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0xC8
	beq _08097B32
	bl sub_8098A5C
	bl sub_809635C
	bl sub_8096310
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0xC9
	beq _08097AE4
	adds r1, r0, 0
	ldr r0, _08097AF8 @ =gPokemonStorage
	ldrb r0, [r0]
	cmp r1, r0
	bne _08097B0A
_08097AE4:
	movs r0, 0x1
	bl sub_809A860
	ldr r0, _08097AFC @ =sub_8096C84
	bl sub_8096BE0
	b _08097B32
	.align 2, 0
_08097AF4: .4byte 0x000008b2
_08097AF8: .4byte gPokemonStorage
_08097AFC: .4byte sub_8096C84
_08097B00:
	ldr r1, _08097B14 @ =0x000008b2
	adds r0, r5, r1
	ldrb r0, [r0]
	bl sub_8099C70
_08097B0A:
	ldrb r0, [r5, 0x4]
	adds r0, 0x1
	strb r0, [r5, 0x4]
	b _08097B32
	.align 2, 0
_08097B14: .4byte 0x000008b2
_08097B18:
	bl sub_8099D34
	lsls r0, 24
	cmp r0, 0
	bne _08097B32
	ldr r1, _08097B38 @ =gPokemonStorage
	ldr r2, _08097B3C @ =0x000008b2
	adds r0, r5, r2
	ldrh r0, [r0]
	strb r0, [r1]
	ldr r0, _08097B40 @ =sub_8096C84
	bl sub_8096BE0
_08097B32:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097B38: .4byte gPokemonStorage
_08097B3C: .4byte 0x000008b2
_08097B40: .4byte sub_8096C84
	thumb_func_end sub_8097A64

	thumb_func_start sub_8097B44
sub_8097B44: @ 8097B44
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _08097B58 @ =0x02000000
	ldrb r4, [r5, 0x4]
	cmp r4, 0
	beq _08097B5C
	cmp r4, 0x1
	beq _08097B78
	b _08097B8E
	.align 2, 0
_08097B58: .4byte 0x02000000
_08097B5C:
	bl sub_809BB90
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrb r0, [r5, 0x4]
	adds r0, 0x1
	strb r0, [r5, 0x4]
	b _08097B8E
_08097B78:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08097B8E
	ldr r0, _08097B98 @ =gUnknown_0203847F
	strb r4, [r0]
	strb r4, [r5, 0x6]
	ldr r0, _08097B9C @ =sub_8096B5C
	bl SetMainCallback2
_08097B8E:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097B98: .4byte gUnknown_0203847F
_08097B9C: .4byte sub_8096B5C
	thumb_func_end sub_8097B44

	thumb_func_start sub_8097BA0
sub_8097BA0: @ 8097BA0
	push {r4,lr}
	ldr r0, _08097BB8 @ =0x02000000
	ldrb r1, [r0, 0x4]
	adds r4, r0, 0
	cmp r1, 0x4
	bls _08097BAE
	b _08097CB0
_08097BAE:
	lsls r0, r1, 2
	ldr r1, _08097BBC @ =_08097BC0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08097BB8: .4byte 0x02000000
_08097BBC: .4byte _08097BC0
	.align 2, 0
_08097BC0:
	.4byte _08097BD4
	.4byte _08097C18
	.4byte _08097C2C
	.4byte _08097C74
	.4byte _08097C98
_08097BD4:
	bl sub_809BF20
	lsls r0, 24
	cmp r0, 0
	beq _08097BF8
	movs r0, 0x20
	bl PlaySE
	movs r0, 0xF
	bl sub_8098898
	ldr r1, _08097BF4 @ =0x02000000
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _08097CB0
	.align 2, 0
_08097BF4: .4byte 0x02000000
_08097BF8:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_8098898
	movs r0, 0
	bl sub_8098A38
	ldr r1, _08097C14 @ =0x02000000
	movs r0, 0x2
	strb r0, [r1, 0x4]
	b _08097CB0
	.align 2, 0
_08097C14: .4byte 0x02000000
_08097C18:
	ldr r0, _08097C28 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _08097CB0
	b _08097C4A
	.align 2, 0
_08097C28: .4byte gMain
_08097C2C:
	bl ProcessMenuInputNoWrap
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08097C5C
	cmp r1, 0
	bgt _08097C46
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08097C4A
	b _08097CB0
_08097C46:
	cmp r1, 0x1
	bne _08097CB0
_08097C4A:
	bl sub_8098A5C
	ldr r0, _08097C58 @ =sub_8096C84
	bl sub_8096BE0
	b _08097CB0
	.align 2, 0
_08097C58: .4byte sub_8096C84
_08097C5C:
	movs r0, 0x3
	bl PlaySE
	bl sub_8098A5C
	ldr r1, _08097C70 @ =0x02000000
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _08097CB0
	.align 2, 0
_08097C70: .4byte 0x02000000
_08097C74:
	movs r1, 0
	movs r0, 0xE
	strh r0, [r4, 0xC]
	ldr r0, _08097C94 @ =0x0000dad0
	strh r0, [r4, 0xE]
	movs r0, 0x14
	strh r0, [r4, 0x10]
	strh r1, [r4, 0x12]
	adds r0, r4, 0
	adds r0, 0xC
	bl sub_80C5E38
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _08097CB0
	.align 2, 0
_08097C94: .4byte 0x0000dad0
_08097C98:
	bl sub_80C5F98
	lsls r0, 24
	cmp r0, 0
	beq _08097CB0
	bl CalculatePlayerPartyCount
	ldr r1, _08097CB8 @ =gPlayerPartyCount
	strb r0, [r1]
	ldr r0, _08097CBC @ =sub_80961A8
	bl SetMainCallback2
_08097CB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097CB8: .4byte gPlayerPartyCount
_08097CBC: .4byte sub_80961A8
	thumb_func_end sub_8097BA0

	thumb_func_start sub_8097CC0
sub_8097CC0: @ 8097CC0
	push {r4,lr}
	ldr r0, _08097CD8 @ =0x02000000
	ldrb r1, [r0, 0x4]
	adds r4, r0, 0
	cmp r1, 0x4
	bls _08097CCE
	b _08097DD0
_08097CCE:
	lsls r0, r1, 2
	ldr r1, _08097CDC @ =_08097CE0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08097CD8: .4byte 0x02000000
_08097CDC: .4byte _08097CE0
	.align 2, 0
_08097CE0:
	.4byte _08097CF4
	.4byte _08097D38
	.4byte _08097D4C
	.4byte _08097D94
	.4byte _08097DB8
_08097CF4:
	bl sub_809BF20
	lsls r0, 24
	cmp r0, 0
	beq _08097D18
	movs r0, 0x20
	bl PlaySE
	movs r0, 0xF
	bl sub_8098898
	ldr r1, _08097D14 @ =0x02000000
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _08097DD0
	.align 2, 0
_08097D14: .4byte 0x02000000
_08097D18:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x12
	bl sub_8098898
	movs r0, 0
	bl sub_8098A38
	ldr r1, _08097D34 @ =0x02000000
	movs r0, 0x2
	strb r0, [r1, 0x4]
	b _08097DD0
	.align 2, 0
_08097D34: .4byte 0x02000000
_08097D38:
	ldr r0, _08097D48 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF3
	ands r0, r1
	cmp r0, 0
	beq _08097DD0
	b _08097D6C
	.align 2, 0
_08097D48: .4byte gMain
_08097D4C:
	bl ProcessMenuInputNoWrap
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08097D6C
	cmp r1, 0
	bgt _08097D66
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08097D7C
	b _08097DD0
_08097D66:
	cmp r1, 0x1
	beq _08097D7C
	b _08097DD0
_08097D6C:
	bl sub_8098A5C
	ldr r0, _08097D78 @ =sub_8096C84
	bl sub_8096BE0
	b _08097DD0
	.align 2, 0
_08097D78: .4byte sub_8096C84
_08097D7C:
	movs r0, 0x3
	bl PlaySE
	bl sub_8098A5C
	ldr r1, _08097D90 @ =0x02000000
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _08097DD0
	.align 2, 0
_08097D90: .4byte 0x02000000
_08097D94:
	movs r1, 0
	movs r0, 0xE
	strh r0, [r4, 0xC]
	ldr r0, _08097DB4 @ =0x0000dad0
	strh r0, [r4, 0xE]
	movs r0, 0x14
	strh r0, [r4, 0x10]
	strh r1, [r4, 0x12]
	adds r0, r4, 0
	adds r0, 0xC
	bl sub_80C5E38
	ldrb r0, [r4, 0x4]
	adds r0, 0x1
	strb r0, [r4, 0x4]
	b _08097DD0
	.align 2, 0
_08097DB4: .4byte 0x0000dad0
_08097DB8:
	bl sub_80C5F98
	lsls r0, 24
	cmp r0, 0
	beq _08097DD0
	bl CalculatePlayerPartyCount
	ldr r1, _08097DD8 @ =gPlayerPartyCount
	strb r0, [r1]
	ldr r0, _08097DDC @ =sub_80961A8
	bl SetMainCallback2
_08097DD0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097DD8: .4byte gPlayerPartyCount
_08097DDC: .4byte sub_80961A8
	thumb_func_end sub_8097CC0

	thumb_func_start sub_8097DE0
sub_8097DE0: @ 8097DE0
	push {lr}
	ldr r1, _08097E1C @ =0x02000000
	movs r0, 0
	strb r0, [r1, 0x7]
	strh r0, [r1, 0x8]
	strh r0, [r1, 0xA]
	ldr r1, _08097E20 @ =REG_BG3CNT
	ldr r2, _08097E24 @ =0x00001e0f
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08097E28 @ =gPokemonStorageScrollingBGTile
	ldr r2, _08097E2C @ =0x0600e000
	ldr r0, _08097E30 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08097E34 @ =0x80000010
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _08097E38 @ =gPokemonStorageScrollingBGTilemap
	ldr r1, _08097E3C @ =0x0600f000
	bl LZ77UnCompVram
	ldr r0, _08097E40 @ =gPokemonStorageScrollingBGPalette
	movs r1, 0xD0
	movs r2, 0x10
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_08097E1C: .4byte 0x02000000
_08097E20: .4byte REG_BG3CNT
_08097E24: .4byte 0x00001e0f
_08097E28: .4byte gPokemonStorageScrollingBGTile
_08097E2C: .4byte 0x0600e000
_08097E30: .4byte 0x040000d4
_08097E34: .4byte 0x80000010
_08097E38: .4byte gPokemonStorageScrollingBGTilemap
_08097E3C: .4byte 0x0600f000
_08097E40: .4byte gPokemonStorageScrollingBGPalette
	thumb_func_end sub_8097DE0

	thumb_func_start sub_8097E44
sub_8097E44: @ 8097E44
	push {lr}
	ldr r1, _08097E6C @ =0x02000000
	ldrb r0, [r1, 0x7]
	adds r0, 0x1
	strb r0, [r1, 0x7]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08097E66
	movs r0, 0
	strb r0, [r1, 0x7]
	ldrh r0, [r1, 0x8]
	subs r0, 0x1
	strh r0, [r1, 0x8]
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
_08097E66:
	pop {r0}
	bx r0
	.align 2, 0
_08097E6C: .4byte 0x02000000
	thumb_func_end sub_8097E44

	thumb_func_start sub_8097E70
sub_8097E70: @ 8097E70
	push {r4,lr}
	sub sp, 0x10
	ldr r0, _08097F2C @ =gPSSMenuHeader_Gfx
	ldr r1, _08097F30 @ =0x06005000
	bl LZ77UnCompVram
	ldr r0, _08097F34 @ =gPSSMenuHeader_Tilemap
	ldr r4, _08097F38 @ =gUnknown_02039760
	adds r1, r4, 0
	bl LZ77UnCompWram
	ldr r0, _08097F3C @ =0x06007800
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0xA
	str r1, [sp, 0x8]
	movs r1, 0x14
	str r1, [sp, 0xC]
	movs r1, 0
	movs r2, 0
	adds r3, r4, 0
	bl sub_809D034
	ldr r0, _08097F40 @ =gPSSMenu1_Pal
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08097F44 @ =gPSSMenu2_Pal
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08097F48 @ =gUnknown_083B6D74
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08097F4C @ =gUnknown_083B6D94
	movs r1, 0xC0
	movs r2, 0x20
	bl LoadPalette
	ldr r4, _08097F50 @ =gUnknownPalette_81E6692+0x2
	adds r0, r4, 0
	movs r1, 0xF1
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xF2
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	adds r0, 0x8
	movs r1, 0xF3
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	adds r0, 0x16
	movs r1, 0xF4
	movs r2, 0x4
	bl LoadPalette
	adds r0, r4, 0
	adds r0, 0x12
	movs r1, 0xF6
	movs r2, 0x4
	bl LoadPalette
	adds r4, 0x2
	adds r0, r4, 0
	movs r1, 0xFF
	movs r2, 0x2
	bl LoadPalette
	ldr r0, _08097F54 @ =gWaveformSpritePalette
	bl LoadSpritePalette
	bl sub_80980D4
	bl sub_8097F58
	bl sub_8097FB8
	bl sub_809801C
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097F2C: .4byte gPSSMenuHeader_Gfx
_08097F30: .4byte 0x06005000
_08097F34: .4byte gPSSMenuHeader_Tilemap
_08097F38: .4byte gUnknown_02039760
_08097F3C: .4byte 0x06007800
_08097F40: .4byte gPSSMenu1_Pal
_08097F44: .4byte gPSSMenu2_Pal
_08097F48: .4byte gUnknown_083B6D74
_08097F4C: .4byte gUnknown_083B6D94
_08097F50: .4byte gUnknownPalette_81E6692+0x2
_08097F54: .4byte gWaveformSpritePalette
	thumb_func_end sub_8097E70

	thumb_func_start sub_8097F58
sub_8097F58: @ 8097F58
	push {r4,lr}
	ldr r1, _08097FA4 @ =0x0000dace
	movs r0, 0xD
	movs r2, 0
	bl sub_80F7940
	ldr r4, _08097FA8 @ =0x02000000
	ldr r1, _08097FAC @ =0x000012ac
	adds r3, r4, r1
	str r0, [r3]
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	strb r1, [r0, 0x5]
	ldr r0, [r3]
	adds r0, 0x43
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, [r3]
	movs r0, 0x28
	strh r0, [r1, 0x20]
	ldr r1, [r3]
	movs r0, 0x95
	strh r0, [r1, 0x22]
	movs r0, 0xD
	bl GetSpriteTileStartByTag
	ldr r1, _08097FB0 @ =0x000012b8
	adds r4, r1
	lsls r0, 16
	lsrs r0, 11
	ldr r1, _08097FB4 @ =0x06010000
	adds r0, r1
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097FA4: .4byte 0x0000dace
_08097FA8: .4byte 0x02000000
_08097FAC: .4byte 0x000012ac
_08097FB0: .4byte 0x000012b8
_08097FB4: .4byte 0x06010000
	thumb_func_end sub_8097F58

	thumb_func_start sub_8097FB8
sub_8097FB8: @ 8097FB8
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _0809800C @ =gWaveformSpriteSheet
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	movs r4, 0
	ldr r5, _08098010 @ =0x020012b0
_08097FD0:
	lsls r1, r4, 6
	subs r1, r4
	adds r1, 0x8
	lsls r1, 16
	asrs r1, 16
	ldr r0, _08098014 @ =gSpriteTemplate_83B6EFC
	movs r2, 0x9
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r4, 2
	adds r2, r5
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08098018 @ =gSprites
	adds r1, r0
	str r1, [r2]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _08097FD0
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809800C: .4byte gWaveformSpriteSheet
_08098010: .4byte 0x020012b0
_08098014: .4byte gSpriteTemplate_83B6EFC
_08098018: .4byte gSprites
	thumb_func_end sub_8097FB8

	thumb_func_start sub_809801C
sub_809801C: @ 809801C
	push {lr}
	ldr r1, _0809803C @ =0x02000000
	ldr r2, _08098040 @ =0x000011f0
	adds r0, r1, r2
	ldrh r0, [r0]
	subs r2, 0x4
	adds r1, r2
	ldr r1, [r1]
	bl sub_80981F0
	bl sub_80982B4
	bl sub_8098350
	pop {r0}
	bx r0
	.align 2, 0
_0809803C: .4byte 0x02000000
_08098040: .4byte 0x000011f0
	thumb_func_end sub_809801C

	thumb_func_start BoxSetMosaic
BoxSetMosaic: @ 8098044
	push {lr}
	bl sub_809801C
	ldr r0, _08098084 @ =0x02000000
	movs r1, 0x9C
	lsls r1, 6
	adds r3, r0, r1
	ldr r2, [r3]
	cmp r2, 0
	beq _08098080
	ldrb r0, [r2, 0x1]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldr r1, [r3]
	movs r0, 0xA
	strh r0, [r1, 0x2E]
	ldr r1, [r3]
	movs r0, 0x1
	strh r0, [r1, 0x30]
	ldr r1, [r3]
	ldr r0, _08098088 @ =sub_8098090
	str r0, [r1, 0x1C]
	ldr r2, _0809808C @ =REG_MOSAIC
	ldr r0, [r3]
	ldrh r0, [r0, 0x2E]
	lsls r1, r0, 12
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
_08098080:
	pop {r0}
	bx r0
	.align 2, 0
_08098084: .4byte 0x02000000
_08098088: .4byte sub_8098090
_0809808C: .4byte REG_MOSAIC
	thumb_func_end BoxSetMosaic

	thumb_func_start sub_8098090
sub_8098090: @ 8098090
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	ldrh r1, [r3, 0x30]
	subs r0, r1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bge _080980A6
	movs r0, 0
	strh r0, [r3, 0x2E]
_080980A6:
	ldr r2, _080980CC @ =REG_MOSAIC
	ldrh r0, [r3, 0x2E]
	lsls r1, r0, 12
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080980C8
	ldrb r0, [r3, 0x1]
	movs r1, 0x11
	negs r1, r1
	ands r1, r0
	strb r1, [r3, 0x1]
	ldr r0, _080980D0 @ =SpriteCallbackDummy
	str r0, [r3, 0x1C]
_080980C8:
	pop {r0}
	bx r0
	.align 2, 0
_080980CC: .4byte REG_MOSAIC
_080980D0: .4byte SpriteCallbackDummy
	thumb_func_end sub_8098090

	thumb_func_start sub_80980D4
sub_80980D4: @ 80980D4
	push {r4,r5,lr}
	sub sp, 0x28
	ldr r0, _08098150 @ =gUnknown_083B6DCC
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	ldr r0, _08098154 @ =gUnknown_083B6DD4
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x20]
	str r1, [sp, 0x24]
	mov r1, sp
	ldr r0, _08098158 @ =gSpriteTemplate_83B6DDC
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	movs r1, 0
	add r5, sp, 0x18
	ldr r4, _0809815C @ =0x02002784
	movs r3, 0
	ldr r2, _08098160 @ =0x000007ff
_08098102:
	adds r0, r1, r4
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bls _08098102
	movs r1, 0
	ldr r3, _08098164 @ =0x02002704
	movs r2, 0
_08098116:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xF
	bls _08098116
	ldr r0, _08098168 @ =0x02000000
	movs r1, 0x9C
	lsls r1, 6
	adds r0, r1
	movs r1, 0
	str r1, [r0]
	adds r0, r5, 0
	bl LoadSpriteSheet
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _080981C4
	add r0, sp, 0x20
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	beq _080981C4
	b _080981B0
	.align 2, 0
_08098150: .4byte gUnknown_083B6DCC
_08098154: .4byte gUnknown_083B6DD4
_08098158: .4byte gSpriteTemplate_83B6DDC
_0809815C: .4byte 0x02002784
_08098160: .4byte 0x000007ff
_08098164: .4byte 0x02002704
_08098168: .4byte 0x02000000
_0809816C:
	ldr r2, _0809819C @ =0x02000000
	movs r0, 0x9C
	lsls r0, 6
	adds r3, r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080981A0 @ =gSprites
	adds r0, r1
	str r0, [r3]
	lsls r0, r4, 4
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	ldr r3, _080981A4 @ =0x000026fa
	adds r1, r2, r3
	strh r0, [r1]
	ldr r4, _080981A8 @ =0x000026fc
	adds r2, r4
	lsls r0, r5, 5
	ldr r1, _080981AC @ =0x06010000
	adds r0, r1
	str r0, [r2]
	b _080981C4
	.align 2, 0
_0809819C: .4byte 0x02000000
_080981A0: .4byte gSprites
_080981A4: .4byte 0x000026fa
_080981A8: .4byte 0x000026fc
_080981AC: .4byte 0x06010000
_080981B0:
	mov r0, sp
	movs r1, 0x28
	movs r2, 0x30
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	bne _0809816C
_080981C4:
	ldr r0, _080981E8 @ =0x02000000
	movs r2, 0x9C
	lsls r2, 6
	adds r0, r2
	ldr r0, [r0]
	cmp r0, 0
	bne _080981DE
	movs r0, 0x2
	bl FreeSpriteTilesByTag
	ldr r0, _080981EC @ =0x0000dac7
	bl FreeSpritePaletteByTag
_080981DE:
	add sp, 0x28
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080981E8: .4byte 0x02000000
_080981EC: .4byte 0x0000dac7
	thumb_func_end sub_80980D4

	thumb_func_start sub_80981F0
sub_80981F0: @ 80981F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	adds r7, r1, 0
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r6, _08098274 @ =0x02000000
	movs r0, 0x9C
	lsls r0, 6
	adds r0, r6
	mov r8, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _080982A6
	cmp r4, 0
	beq _0809829C
	lsls r0, r4, 3
	ldr r1, _08098278 @ =gMonFrontPicTable
	adds r0, r1
	ldr r2, _0809827C @ =gMonFrontPicCoords
	lsls r1, r4, 2
	adds r1, r2
	ldrb r1, [r1]
	ldr r2, _08098280 @ =0x00004784
	adds r3, r6, r2
	ldr r2, _08098284 @ =0x00002784
	adds r5, r6, r2
	str r5, [sp]
	str r4, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r2, 0x1
	bl HandleLoadSpecialPokePic
	ldr r1, _08098288 @ =0x000011e8
	adds r0, r6, r1
	ldr r0, [r0]
	ldr r2, _0809828C @ =0x00002704
	adds r4, r6, r2
	adds r1, r4, 0
	bl LZ77UnCompWram
	ldr r1, _08098290 @ =0x000026fc
	adds r0, r6, r1
	ldr r1, [r0]
	ldr r2, _08098294 @ =0x04000200
	adds r0, r5, 0
	bl CpuSet
	ldr r2, _08098298 @ =0x000026fa
	adds r0, r6, r2
	ldrh r1, [r0]
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	mov r0, r8
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	b _080982A6
	.align 2, 0
_08098274: .4byte 0x02000000
_08098278: .4byte gMonFrontPicTable
_0809827C: .4byte gMonFrontPicCoords
_08098280: .4byte 0x00004784
_08098284: .4byte 0x00002784
_08098288: .4byte 0x000011e8
_0809828C: .4byte 0x00002704
_08098290: .4byte 0x000026fc
_08098294: .4byte 0x04000200
_08098298: .4byte 0x000026fa
_0809829C:
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080982A6:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80981F0

	thumb_func_start sub_80982B4
sub_80982B4: @ 80982B4
	push {r4,lr}
	ldr r4, _080982E4 @ =0x02000000
	ldr r1, _080982E8 @ =0x000011f0
	adds r0, r4, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _080982F4
	ldr r2, _080982EC @ =0x000011f7
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r2, 0xC1
	adds r1, r4, r2
	ldr r1, [r1]
	bl sub_80F7A10
	ldr r1, _080982F0 @ =0x000012ac
	adds r0, r4, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	b _08098302
	.align 2, 0
_080982E4: .4byte 0x02000000
_080982E8: .4byte 0x000011f0
_080982EC: .4byte 0x000011f7
_080982F0: .4byte 0x000012ac
_080982F4:
	ldr r2, _08098348 @ =0x000012ac
	adds r0, r4, r2
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
_08098302:
	strb r0, [r1]
	movs r0, 0
	movs r1, 0xB
	movs r2, 0x9
	movs r3, 0x11
	bl MenuZeroFillWindowRect
	ldr r4, _0809834C @ =0x0200127a
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x10
	bl MenuPrint
	adds r0, r4, 0
	subs r0, 0x6B
	movs r1, 0x1
	movs r2, 0xB
	bl MenuPrint
	adds r0, r4, 0
	subs r0, 0x46
	movs r1, 0
	movs r2, 0xD
	bl MenuPrint
	subs r4, 0x21
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08098348: .4byte 0x000012ac
_0809834C: .4byte 0x0200127a
	thumb_func_end sub_80982B4

	thumb_func_start sub_8098350
sub_8098350: @ 8098350
	push {r4,r5,lr}
	sub sp, 0x10
	ldr r5, _080983A0 @ =0x02000000
	ldr r1, _080983A4 @ =0x000011f0
	adds r0, r5, r1
	ldrh r2, [r0]
	cmp r2, 0
	beq _080983B4
	ldr r0, _080983A8 @ =0x06007800
	ldr r3, _080983AC @ =gUnknown_02039760
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r1, 0x8
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	movs r1, 0x1
	movs r2, 0
	bl sub_809D034
	movs r4, 0
	ldr r0, _080983B0 @ =0x000012b0
	adds r5, r0
_08098382:
	lsls r0, r4, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnimIfDifferent
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _08098382
	b _080983EC
	.align 2, 0
_080983A0: .4byte 0x02000000
_080983A4: .4byte 0x000011f0
_080983A8: .4byte 0x06007800
_080983AC: .4byte gUnknown_02039760
_080983B0: .4byte 0x000012b0
_080983B4:
	ldr r0, _080983F4 @ =0x06007800
	ldr r3, _080983F8 @ =gUnknown_02039760
	movs r1, 0xA
	str r1, [sp]
	str r2, [sp, 0x4]
	movs r1, 0x8
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	movs r1, 0x1
	movs r2, 0
	bl sub_809D034
	movs r4, 0
	ldr r1, _080983FC @ =0x000012b0
	adds r5, r1
_080983D4:
	lsls r0, r4, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r1, r4, 25
	lsrs r1, 24
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080983D4
_080983EC:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080983F4: .4byte 0x06007800
_080983F8: .4byte gUnknown_02039760
_080983FC: .4byte 0x000012b0
	thumb_func_end sub_8098350

	thumb_func_start sub_8098400
sub_8098400: @ 8098400
	push {r4,r5,lr}
	sub sp, 0x14
	ldr r1, _0809847C @ =REG_BG1CNT
	ldr r2, _08098480 @ =0x00000f01
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08098484 @ =gPSSMenuMisc_Gfx
	ldr r1, _08098488 @ =0x06006800
	bl LZ77UnCompVram
	ldr r0, _0809848C @ =gPSSMenuMisc_Tilemap
	ldr r5, _08098490 @ =0x020000a8
	adds r1, r5, 0
	bl LZ77UnCompWram
	ldr r0, _08098494 @ =gPSSMenu3_Pal
	movs r1, 0x20
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08098498 @ =gPSSMenu4_Pal
	movs r1, 0x30
	movs r2, 0x20
	bl LoadPalette
	ldr r4, _0809849C @ =0x06007800
	add r1, sp, 0x10
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080984A0 @ =0x040000d4
	str r1, [r0]
	str r4, [r0, 0x4]
	ldr r1, _080984A4 @ =0x81000400
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl sub_8098780
	ldr r0, _080984A8 @ =gUnknown_0203847C
	ldrb r0, [r0]
	cmp r0, 0
	beq _080984AC
	movs r0, 0x1
	bl sub_8098690
	movs r0, 0x1
	bl sub_8099200
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0xC
	str r0, [sp, 0x8]
	movs r0, 0x16
	str r0, [sp, 0xC]
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0
	adds r3, r5, 0
	bl sub_809D034
	b _080984CC
	.align 2, 0
_0809847C: .4byte REG_BG1CNT
_08098480: .4byte 0x00000f01
_08098484: .4byte gPSSMenuMisc_Gfx
_08098488: .4byte 0x06006800
_0809848C: .4byte gPSSMenuMisc_Tilemap
_08098490: .4byte 0x020000a8
_08098494: .4byte gPSSMenu3_Pal
_08098498: .4byte gPSSMenu4_Pal
_0809849C: .4byte 0x06007800
_080984A0: .4byte 0x040000d4
_080984A4: .4byte 0x81000400
_080984A8: .4byte gUnknown_0203847C
_080984AC:
	str r0, [sp]
	movs r0, 0x14
	str r0, [sp, 0x4]
	movs r0, 0xC
	str r0, [sp, 0x8]
	movs r0, 0x2
	str r0, [sp, 0xC]
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0
	adds r3, r5, 0
	bl sub_809D034
	movs r0, 0x1
	bl sub_8098690
_080984CC:
	ldr r0, _080984E0 @ =0x02000000
	ldr r1, _080984E4 @ =0x000008af
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080984E0: .4byte 0x02000000
_080984E4: .4byte 0x000008af
	thumb_func_end sub_8098400

	thumb_func_start sub_80984E8
sub_80984E8: @ 80984E8
	push {lr}
	ldr r1, _08098510 @ =0x02000000
	ldr r0, _08098514 @ =0x000008a8
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0x14
	strh r0, [r2]
	ldr r0, _08098518 @ =0x000008aa
	adds r2, r1, r0
	movs r0, 0x2
	strh r0, [r2]
	ldr r0, _0809851C @ =0x000008ad
	adds r1, r0
	strb r3, [r1]
	movs r0, 0
	bl sub_8099200
	pop {r0}
	bx r0
	.align 2, 0
_08098510: .4byte 0x02000000
_08098514: .4byte 0x000008a8
_08098518: .4byte 0x000008aa
_0809851C: .4byte 0x000008ad
	thumb_func_end sub_80984E8

	thumb_func_start sub_8098520
sub_8098520: @ 8098520
	push {r4,r5,lr}
	sub sp, 0x10
	ldr r3, _08098578 @ =0x02000000
	ldr r0, _0809857C @ =0x000008ad
	adds r5, r3, r0
	ldrb r0, [r5]
	cmp r0, 0x14
	beq _08098592
	ldr r0, _08098580 @ =0x000008a8
	adds r1, r3, r0
	ldrh r0, [r1]
	subs r0, 0x1
	movs r4, 0
	strh r0, [r1]
	ldr r0, _08098584 @ =0x000008aa
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	ldr r0, _08098588 @ =0x06007800
	adds r3, 0xA8
	str r4, [sp]
	ldrh r1, [r1]
	str r1, [sp, 0x4]
	movs r1, 0xC
	str r1, [sp, 0x8]
	ldrh r1, [r2]
	str r1, [sp, 0xC]
	movs r1, 0xA
	movs r2, 0
	bl sub_809D034
	movs r0, 0x8
	bl sub_80994A8
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x14
	beq _0809858C
	movs r0, 0x1
	b _08098594
	.align 2, 0
_08098578: .4byte 0x02000000
_0809857C: .4byte 0x000008ad
_08098580: .4byte 0x000008a8
_08098584: .4byte 0x000008aa
_08098588: .4byte 0x06007800
_0809858C:
	ldr r1, _0809859C @ =gUnknown_0203847C
	movs r0, 0x1
	strb r0, [r1]
_08098592:
	movs r0, 0
_08098594:
	add sp, 0x10
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809859C: .4byte gUnknown_0203847C
	thumb_func_end sub_8098520

	thumb_func_start add_to_c3_somehow
add_to_c3_somehow: @ 80985A0
	ldr r1, _080985BC @ =0x02000000
	ldr r0, _080985C0 @ =0x000008a8
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0
	strh r0, [r2]
	ldr r0, _080985C4 @ =0x000008aa
	adds r2, r1, r0
	movs r0, 0x16
	strh r0, [r2]
	ldr r0, _080985C8 @ =0x000008ad
	adds r1, r0
	strb r3, [r1]
	bx lr
	.align 2, 0
_080985BC: .4byte 0x02000000
_080985C0: .4byte 0x000008a8
_080985C4: .4byte 0x000008aa
_080985C8: .4byte 0x000008ad
	thumb_func_end add_to_c3_somehow

	thumb_func_start sub_80985CC
sub_80985CC: @ 80985CC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	ldr r3, _08098640 @ =0x02000000
	ldr r0, _08098644 @ =0x000008ad
	adds r6, r3, r0
	ldrb r0, [r6]
	cmp r0, 0x14
	beq _0809867A
	ldr r2, _08098648 @ =0x000008a8
	adds r1, r3, r2
	ldrh r0, [r1]
	adds r0, 0x1
	movs r2, 0
	mov r9, r2
	strh r0, [r1]
	ldr r0, _0809864C @ =0x000008aa
	adds r4, r3, r0
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	ldr r5, _08098650 @ =0x06007800
	adds r3, 0xA8
	mov r8, r3
	str r2, [sp]
	ldrh r0, [r1]
	str r0, [sp, 0x4]
	movs r7, 0xC
	str r7, [sp, 0x8]
	ldrh r0, [r4]
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0xA
	bl sub_809D034
	ldrh r2, [r4]
	movs r4, 0x1
	str r4, [sp]
	adds r0, r5, 0
	movs r1, 0xA
	movs r3, 0xC
	bl sub_809D16C
	movs r0, 0x8
	negs r0, r0
	bl sub_80994A8
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x14
	beq _08098654
	movs r0, 0x1
	b _0809867C
	.align 2, 0
_08098640: .4byte 0x02000000
_08098644: .4byte 0x000008ad
_08098648: .4byte 0x000008a8
_0809864C: .4byte 0x000008aa
_08098650: .4byte 0x06007800
_08098654:
	ldr r0, _0809868C @ =gUnknown_0203847C
	movs r1, 0
	strb r1, [r0]
	bl sub_809954C
	bl party_compaction
	str r7, [sp]
	mov r2, r9
	str r2, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x2
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0x15
	movs r2, 0
	mov r3, r8
	bl sub_809D034
_0809867A:
	movs r0, 0
_0809867C:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809868C: .4byte gUnknown_0203847C
	thumb_func_end sub_80985CC

	thumb_func_start sub_8098690
sub_8098690: @ 8098690
	push {lr}
	sub sp, 0x10
	lsls r0, 24
	cmp r0, 0
	beq _080986C0
	ldr r0, _080986B8 @ =0x06007800
	ldr r3, _080986BC @ =0x020000a8
	movs r1, 0xC
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r1, 0x9
	str r1, [sp, 0x8]
	movs r1, 0x2
	str r1, [sp, 0xC]
	movs r1, 0x15
	movs r2, 0
	bl sub_809D034
	b _080986DA
	.align 2, 0
_080986B8: .4byte 0x06007800
_080986BC: .4byte 0x020000a8
_080986C0:
	ldr r0, _080986E0 @ =0x06007800
	ldr r3, _080986E4 @ =0x020000a8
	movs r1, 0xC
	str r1, [sp]
	movs r2, 0x2
	str r2, [sp, 0x4]
	movs r1, 0x9
	str r1, [sp, 0x8]
	str r2, [sp, 0xC]
	movs r1, 0x15
	movs r2, 0
	bl sub_809D034
_080986DA:
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_080986E0: .4byte 0x06007800
_080986E4: .4byte 0x020000a8
	thumb_func_end sub_8098690

	thumb_func_start sub_80986E8
sub_80986E8: @ 80986E8
	ldr r1, _08098704 @ =0x02000000
	ldr r2, _08098708 @ =0x000008af
	adds r0, r1, r2
	movs r3, 0x1
	strb r3, [r0]
	movs r0, 0x8B
	lsls r0, 4
	adds r2, r1, r0
	movs r0, 0x1E
	strb r0, [r2]
	ldr r2, _0809870C @ =0x000008b1
	adds r1, r2
	strb r3, [r1]
	bx lr
	.align 2, 0
_08098704: .4byte 0x02000000
_08098708: .4byte 0x000008af
_0809870C: .4byte 0x000008b1
	thumb_func_end sub_80986E8

	thumb_func_start sub_8098710
sub_8098710: @ 8098710
	push {lr}
	ldr r0, _0809872C @ =0x02000000
	ldr r2, _08098730 @ =0x000008af
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _08098728
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	bl sub_8098690
_08098728:
	pop {r0}
	bx r0
	.align 2, 0
_0809872C: .4byte 0x02000000
_08098730: .4byte 0x000008af
	thumb_func_end sub_8098710

	thumb_func_start sub_8098734
sub_8098734: @ 8098734
	push {lr}
	ldr r2, _08098774 @ =0x02000000
	ldr r1, _08098778 @ =0x000008af
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08098770
	movs r0, 0x8B
	lsls r0, 4
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1E
	bls _08098770
	movs r0, 0
	strb r0, [r1]
	movs r3, 0
	ldr r0, _0809877C @ =0x000008b1
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _08098768
	movs r3, 0x1
_08098768:
	strb r3, [r1]
	ldrb r0, [r1]
	bl sub_8098690
_08098770:
	pop {r0}
	bx r0
	.align 2, 0
_08098774: .4byte 0x02000000
_08098778: .4byte 0x000008af
_0809877C: .4byte 0x000008b1
	thumb_func_end sub_8098734

	thumb_func_start sub_8098780
sub_8098780: @ 8098780
	push {r4-r6,lr}
	sub sp, 0x10
	movs r4, 0x1
	ldr r6, _080987D4 @ =0x020000a8
	movs r5, 0x80
	lsls r5, 9
_0809878C:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _080987D8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _080987A0
	movs r0, 0x1
_080987A0:
	movs r1, 0x10
	cmp r0, 0
	beq _080987A8
	movs r1, 0xC
_080987A8:
	lsrs r2, r5, 16
	str r1, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r0, 0x3
	str r0, [sp, 0xC]
	adds r0, r6, 0
	movs r1, 0x7
	adds r3, r6, 0
	bl sub_809D104
	movs r0, 0xC0
	lsls r0, 10
	adds r5, r0
	adds r4, 0x1
	cmp r4, 0x5
	ble _0809878C
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080987D4: .4byte 0x020000a8
_080987D8: .4byte gPlayerParty
	thumb_func_end sub_8098780

	thumb_func_start sub_80987DC
sub_80987DC: @ 80987DC
	push {lr}
	sub sp, 0x10
	bl sub_8098780
	ldr r0, _08098804 @ =0x06007800
	ldr r3, _08098808 @ =0x020000a8
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0xC
	str r1, [sp, 0x8]
	movs r1, 0x16
	str r1, [sp, 0xC]
	movs r1, 0xA
	movs r2, 0
	bl sub_809D034
	add sp, 0x10
	pop {r0}
	bx r0
	.align 2, 0
_08098804: .4byte 0x06007800
_08098808: .4byte 0x020000a8
	thumb_func_end sub_80987DC

	thumb_func_start sub_809880C
sub_809880C: @ 809880C
	push {lr}
	ldr r0, _08098828 @ =0x02000000
	ldr r1, _0809882C @ =0x000008ae
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x6
	bl PlaySE
	bl sub_80984E8
	pop {r0}
	bx r0
	.align 2, 0
_08098828: .4byte 0x02000000
_0809882C: .4byte 0x000008ae
	thumb_func_end sub_809880C

	thumb_func_start sub_8098830
sub_8098830: @ 8098830
	push {r4,r5,lr}
	ldr r5, _08098848 @ =0x02000000
	ldr r0, _0809884C @ =0x000008ae
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _08098866
	cmp r0, 0x1
	bgt _08098850
	cmp r0, 0
	beq _08098856
	b _08098890
	.align 2, 0
_08098848: .4byte 0x02000000
_0809884C: .4byte 0x000008ae
_08098850:
	cmp r0, 0x2
	beq _0809888C
	b _08098890
_08098856:
	bl sub_8098520
	lsls r0, 24
	cmp r0, 0
	bne _08098890
	bl sub_809B068
	b _0809887E
_08098866:
	bl sub_809AC00
	lsls r0, 24
	cmp r0, 0
	bne _08098890
	ldr r1, _08098888 @ =0x000011f6
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809887E
	bl BoxSetMosaic
_0809887E:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08098890
	.align 2, 0
_08098888: .4byte 0x000011f6
_0809888C:
	movs r0, 0
	b _08098892
_08098890:
	movs r0, 0x1
_08098892:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8098830

	thumb_func_start sub_8098898
sub_8098898: @ 8098898
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0xA
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r1, _080988C4 @ =gUnknown_083B6DF4
	lsls r0, r5, 3
	adds r0, r1
	ldrb r0, [r0, 0x4]
	cmp r0, 0x6
	bls _080988B8
	b _080989F4
_080988B8:
	lsls r0, 2
	ldr r1, _080988C8 @ =_080988CC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080988C4: .4byte gUnknown_083B6DF4
_080988C8: .4byte _080988CC
	.align 2, 0
_080988CC:
	.4byte _080989F4
	.4byte _08098930
	.4byte _080988E8
	.4byte _08098974
	.4byte _08098954
	.4byte _08098910
	.4byte _080989B8
_080988E8:
	ldr r4, _08098904 @ =0x02002694
	ldr r1, _08098908 @ =gUnknown_083B6DF4
	lsls r0, r5, 3
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r0, _0809890C @ =0xffffeb66
	adds r4, r0
	adds r0, r2, 0
	adds r1, r4, 0
	b _080989FE
	.align 2, 0
_08098904: .4byte 0x02002694
_08098908: .4byte gUnknown_083B6DF4
_0809890C: .4byte 0xffffeb66
_08098910:
	ldr r4, _08098928 @ =0x02002694
	ldr r1, _0809892C @ =gUnknown_083B6DF4
	lsls r0, r5, 3
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	adds r2, r0, 0
	adds r4, 0x50
	adds r1, r4, 0
	b _080989FE
	.align 2, 0
_08098928: .4byte 0x02002694
_0809892C: .4byte gUnknown_083B6DF4
_08098930:
	ldr r0, _08098948 @ =0x02002694
	ldr r2, _0809894C @ =0xffffeb66
	adds r1, r0, r2
	bl StringCopy
	adds r2, r0, 0
	ldr r1, _08098950 @ =gUnknown_083B6DF4
	lsls r0, r5, 3
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	b _080989FE
	.align 2, 0
_08098948: .4byte 0x02002694
_0809894C: .4byte 0xffffeb66
_08098950: .4byte gUnknown_083B6DF4
_08098954:
	ldr r0, _0809896C @ =0x02002694
	adds r1, r0, 0
	adds r1, 0x50
	bl StringCopy
	adds r2, r0, 0
	ldr r1, _08098970 @ =gUnknown_083B6DF4
	lsls r0, r5, 3
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	b _080989FE
	.align 2, 0
_0809896C: .4byte 0x02002694
_08098970: .4byte gUnknown_083B6DF4
_08098974:
	ldr r1, _080989AC @ =gUnknown_083B6DF4
	lsls r0, r5, 3
	adds r0, r1
	ldr r6, [r0]
	adds r0, r6, 0
	bl StringLength
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r4, r6, r4
	adds r4, 0x1
	ldr r5, _080989B0 @ =0x02002694
	adds r0, r5, 0
	adds r1, r6, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r0, _080989B4 @ =0xffffeb66
	adds r5, r0
	adds r0, r2, 0
	adds r1, r5, 0
	bl StringCopy
	adds r2, r0, 0
	adds r1, r4, 0
	b _080989FE
	.align 2, 0
_080989AC: .4byte gUnknown_083B6DF4
_080989B0: .4byte 0x02002694
_080989B4: .4byte 0xffffeb66
_080989B8:
	ldr r1, _080989EC @ =gUnknown_083B6DF4
	lsls r0, r5, 3
	adds r0, r1
	ldr r6, [r0]
	adds r0, r6, 0
	bl StringLength
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r4, r6, r4
	subs r4, 0x1
	ldr r5, _080989F0 @ =0x02002694
	adds r0, r5, 0
	adds r1, r6, 0
	bl StringCopy
	adds r2, r0, 0
	subs r0, r2, 0x1
	adds r5, 0x50
	adds r1, r5, 0
	bl StringCopy
	adds r2, r0, 0
	adds r1, r4, 0
	b _080989FE
	.align 2, 0
_080989EC: .4byte gUnknown_083B6DF4
_080989F0: .4byte 0x02002694
_080989F4:
	ldr r0, _08098A2C @ =0x02002694
	ldr r2, _08098A30 @ =gUnknown_083B6DF4
	lsls r1, r5, 3
	adds r1, r2
	ldr r1, [r1]
_080989FE:
	bl StringCopy
	adds r2, r0, 0
	ldr r0, _08098A34 @ =0x020026a6
	adds r3, r0, 0
	subs r3, 0x12
	cmp r2, r0
	bcs _08098A18
	movs r1, 0
_08098A10:
	strb r1, [r2]
	adds r2, 0x1
	cmp r2, r0
	bcc _08098A10
_08098A18:
	movs r0, 0xFF
	strb r0, [r2]
	adds r0, r3, 0
	movs r1, 0xB
	movs r2, 0x11
	bl MenuPrint
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098A2C: .4byte 0x02002694
_08098A30: .4byte gUnknown_083B6DF4
_08098A34: .4byte 0x020026a6
	thumb_func_end sub_8098898

	thumb_func_start sub_8098A38
sub_8098A38: @ 8098A38
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x17
	movs r1, 0xA
	movs r2, 0
	bl DisplayYesNoMenu
	lsls r4, 24
	asrs r4, 24
	adds r0, r4, 0
	bl MoveMenuCursor
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8098A38

	thumb_func_start sub_8098A5C
sub_8098A5C: @ 8098A5C
	push {lr}
	bl sub_8072DEC
	movs r0, 0xA
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0x17
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0xF
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_8098A5C

	thumb_func_start sub_8098A80
sub_8098A80: @ 8098A80
	push {lr}
	bl sub_809CDCC
	movs r0, 0xC
	bl sub_809CDEC
	movs r0, 0xD
	bl sub_809CDEC
	movs r0, 0xE
	bl sub_809CDEC
	movs r0, 0xF
	bl sub_809CDEC
	bl sub_809CE84
	pop {r0}
	bx r0
	thumb_func_end sub_8098A80

	thumb_func_start sub_8098AA8
sub_8098AA8: @ 8098AA8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_809CDCC
	cmp r4, 0x1
	beq _08098AE6
	cmp r4, 0x1
	bgt _08098AC2
	cmp r4, 0
	beq _08098ACC
	b _08098B32
_08098AC2:
	cmp r5, 0x2
	beq _08098B00
	cmp r5, 0x3
	beq _08098B1A
	b _08098B32
_08098ACC:
	movs r0, 0x10
	bl sub_809CDEC
	movs r0, 0x11
	bl sub_809CDEC
	movs r0, 0x12
	bl sub_809CDEC
	movs r0, 0x13
	bl sub_809CDEC
	b _08098B32
_08098AE6:
	movs r0, 0x14
	bl sub_809CDEC
	movs r0, 0x15
	bl sub_809CDEC
	movs r0, 0x16
	bl sub_809CDEC
	movs r0, 0x17
	bl sub_809CDEC
	b _08098B32
_08098B00:
	movs r0, 0x18
	bl sub_809CDEC
	movs r0, 0x19
	bl sub_809CDEC
	movs r0, 0x1A
	bl sub_809CDEC
	movs r0, 0x1B
	bl sub_809CDEC
	b _08098B32
_08098B1A:
	movs r0, 0x1C
	bl sub_809CDEC
	movs r0, 0x1D
	bl sub_809CDEC
	movs r0, 0x1E
	bl sub_809CDEC
	movs r0, 0x1F
	bl sub_809CDEC
_08098B32:
	bl sub_809CE84
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8098AA8

	thumb_func_start get_preferred_box
get_preferred_box: @ 8098B3C
	ldr r0, _08098B44 @ =gPokemonStorage
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08098B44: .4byte gPokemonStorage
	thumb_func_end get_preferred_box

	thumb_func_start sub_8098B48
sub_8098B48: @ 8098B48
	push {r4,r5,lr}
	bl sub_809D51C
	movs r2, 0
	ldr r1, _08098BD8 @ =gUnknown_083B6DB4
	ldr r0, [r1]
	ldr r4, _08098BDC @ =0x000010d0
	adds r3, r0, r4
	movs r4, 0
	adds r5, r1, 0
_08098B5C:
	lsls r0, r2, 1
	adds r0, r3, r0
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x27
	bls _08098B5C
	movs r2, 0
	ldr r0, _08098BD8 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	movs r1, 0x89
	lsls r1, 5
	adds r3, r0, r1
	movs r1, 0
_08098B7A:
	lsls r0, r2, 1
	adds r0, r3, r0
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x27
	bls _08098B7A
	movs r2, 0
	ldr r0, _08098BD8 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r4, _08098BE0 @ =0x00001038
	adds r3, r0, r4
	movs r1, 0
_08098B96:
	lsls r0, r2, 2
	adds r0, r3, r0
	str r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _08098B96
	movs r2, 0
	ldr r0, _08098BD8 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _08098BE4 @ =0x00001050
	adds r3, r0, r1
	movs r1, 0
_08098BB2:
	lsls r0, r2, 2
	adds r0, r3, r0
	str r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1D
	bls _08098BB2
	ldr r0, [r5]
	ldr r2, _08098BE8 @ =0x00001034
	adds r1, r0, r2
	movs r2, 0
	str r2, [r1]
	ldr r4, _08098BEC @ =0x00000d5c
	adds r0, r4
	strh r2, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098BD8: .4byte gUnknown_083B6DB4
_08098BDC: .4byte 0x000010d0
_08098BE0: .4byte 0x00001038
_08098BE4: .4byte 0x00001050
_08098BE8: .4byte 0x00001034
_08098BEC: .4byte 0x00000d5c
	thumb_func_end sub_8098B48

	thumb_func_start sub_8098BF0
sub_8098BF0: @ 8098BF0
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r0, _08098C38 @ =gUnknown_083B6DB4
	ldr r5, [r0]
	ldr r0, _08098C3C @ =0x000025b4
	adds r4, r5, r0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x7
	str r1, [sp, 0x4]
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0
	bl sub_8099AFC
	ldr r1, _08098C40 @ =0x00001034
	adds r5, r1
	str r0, [r5]
	ldr r1, _08098C44 @ =sub_80999C4
	str r1, [r0, 0x1C]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098C38: .4byte gUnknown_083B6DB4
_08098C3C: .4byte 0x000025b4
_08098C40: .4byte 0x00001034
_08098C44: .4byte sub_80999C4
	thumb_func_end sub_8098BF0

	thumb_func_start sub_8098C48
sub_8098C48: @ 8098C48
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldr r1, _08098CCC @ =gPokemonStorage + 0x4
	adds r6, r0, r1
	movs r0, 0
	mov r8, r0
	movs r7, 0
_08098C6A:
	movs r5, 0
	adds r1, r7, 0x1
	mov r9, r1
_08098C70:
	adds r0, r6, 0
	movs r1, 0x41
	bl GetBoxMonData
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _08098CD8
	adds r0, r6, 0
	movs r1, 0
	bl GetBoxMonData
	adds r1, r0, 0
	lsls r2, r5, 1
	adds r2, r5
	lsls r2, 19
	movs r3, 0xC8
	lsls r3, 15
	adds r2, r3
	asrs r2, 16
	lsls r3, r7, 1
	adds r3, r7
	lsls r3, 19
	movs r0, 0xB0
	lsls r0, 14
	adds r3, r0
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x12
	subs r0, r5
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	adds r0, r4, 0
	asrs r3, 16
	bl sub_8099AFC
	ldr r1, _08098CD0 @ =gUnknown_083B6DB4
	ldr r1, [r1]
	mov r3, r8
	lsls r2, r3, 2
	ldr r3, _08098CD4 @ =0x00001050
	adds r1, r3
	adds r1, r2
	str r0, [r1]
	b _08098CE8
	.align 2, 0
_08098CCC: .4byte gPokemonStorage + 0x4
_08098CD0: .4byte gUnknown_083B6DB4
_08098CD4: .4byte 0x00001050
_08098CD8:
	ldr r0, _08098D18 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	mov r2, r8
	lsls r1, r2, 2
	ldr r3, _08098D1C @ =0x00001050
	adds r0, r3
	adds r0, r1
	str r4, [r0]
_08098CE8:
	adds r6, 0x50
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _08098C70
	mov r1, r9
	lsls r0, r1, 16
	lsrs r7, r0, 16
	cmp r7, 0x4
	bls _08098C6A
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098D18: .4byte gUnknown_083B6DB4
_08098D1C: .4byte 0x00001050
	thumb_func_end sub_8098C48

	thumb_func_start sub_8098D20
sub_8098D20: @ 8098D20
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r2, r1, 4
	subs r2, r1
	lsls r2, 5
	lsls r0, r4, 2
	mov r9, r0
	adds r0, r4
	lsls r0, 4
	ldr r1, _08098DD4 @ =gPokemonStorage + 0x4
	adds r0, r1
	adds r7, r2, r0
	adds r0, r7, 0
	movs r1, 0x41
	bl GetBoxMonData
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0
	beq _08098DC4
	adds r0, r4, 0
	movs r1, 0x6
	bl __umodsi3
	adds r6, r0, 0
	lsls r0, r6, 24
	lsrs r0, 24
	lsls r5, r0, 1
	adds r5, r0
	lsls r5, 19
	movs r1, 0xC8
	lsls r1, 15
	adds r5, r1
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0x6
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 19
	movs r2, 0xB0
	lsls r2, 14
	adds r4, r2
	lsrs r4, 16
	adds r0, r7, 0
	movs r1, 0
	bl GetBoxMonData
	adds r1, r0, 0
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0x12
	subs r0, r6
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	mov r0, r8
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_8099AFC
	ldr r1, _08098DD8 @ =gUnknown_083B6DB4
	ldr r1, [r1]
	ldr r2, _08098DDC @ =0x00001050
	adds r1, r2
	add r1, r9
	str r0, [r1]
_08098DC4:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098DD4: .4byte gPokemonStorage + 0x4
_08098DD8: .4byte gUnknown_083B6DB4
_08098DDC: .4byte 0x00001050
	thumb_func_end sub_8098D20

	thumb_func_start sub_8098DE0
sub_8098DE0: @ 8098DE0
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	movs r2, 0
	ldr r0, _08098E18 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _08098E1C @ =0x00001050
	adds r3, r0, r1
	movs r6, 0x1
	ldr r5, _08098E20 @ =sub_8098E68
_08098DF4:
	lsls r0, r2, 2
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r0, 0
	beq _08098E08
	strh r4, [r0, 0x32]
	ldr r0, [r1]
	strh r6, [r0, 0x36]
	ldr r0, [r1]
	str r5, [r0, 0x1C]
_08098E08:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1D
	bls _08098DF4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098E18: .4byte gUnknown_083B6DB4
_08098E1C: .4byte 0x00001050
_08098E20: .4byte sub_8098E68
	thumb_func_end sub_8098DE0

	thumb_func_start sub_8098E24
sub_8098E24: @ 8098E24
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x30]
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _08098E40
	subs r0, r1, 0x1
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	b _08098E56
_08098E40:
	ldr r0, _08098E5C @ =gUnknown_083B6DB4
	ldr r1, [r0]
	ldr r3, _08098E60 @ =0x00001178
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ldrh r0, [r2, 0x34]
	strh r0, [r2, 0x20]
	ldr r0, _08098E64 @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
_08098E56:
	pop {r0}
	bx r0
	.align 2, 0
_08098E5C: .4byte gUnknown_083B6DB4
_08098E60: .4byte 0x00001178
_08098E64: .4byte SpriteCallbackDummy
	thumb_func_end sub_8098E24

	thumb_func_start sub_8098E68
sub_8098E68: @ 8098E68
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x36]
	movs r3, 0x36
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _08098E7C
	subs r0, r1, 0x1
	strh r0, [r2, 0x36]
	b _08098E98
_08098E7C:
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x38]
	subs r0, 0x45
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB6
	bls _08098E98
	ldr r0, _08098E9C @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
_08098E98:
	pop {r0}
	bx r0
	.align 2, 0
_08098E9C: .4byte SpriteCallbackDummy
	thumb_func_end sub_8098E68

	thumb_func_start sub_8098EA0
sub_8098EA0: @ 8098EA0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r0, _08098ED8 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _08098EDC @ =0x00001050
	adds r7, r0, r1
_08098EB0:
	lsls r0, r5, 2
	adds r4, r7, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _08098EC2
	bl sub_8099BE0
	movs r0, 0
	str r0, [r4]
_08098EC2:
	adds r0, r5, 0x6
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x4
	bls _08098EB0
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098ED8: .4byte gUnknown_083B6DB4
_08098EDC: .4byte 0x00001050
	thumb_func_end sub_8098EA0

	thumb_func_start sub_8098EE0
sub_8098EE0: @ 8098EE0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x8]
	lsls r2, 16
	movs r0, 0x2C
	str r0, [sp, 0x10]
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 19
	movs r1, 0xC8
	lsls r1, 15
	adds r0, r1
	lsrs r0, 16
	mov r10, r0
	ldr r0, [sp, 0x8]
	adds r0, 0x1
	lsrs r3, r2, 16
	str r3, [sp, 0xC]
	asrs r2, 16
	adds r1, r0, 0
	muls r1, r2
	mov r4, r10
	subs r1, r4, r1
	movs r0, 0x12
	subs r0, r6
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x18]
	movs r0, 0
	str r0, [sp, 0x14]
	mov r9, r0
	ldr r0, _08098FF8 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r2, _08098FFC @ =0x0000117d
	adds r2, r0
	mov r8, r2
	ldr r3, _08099000 @ =0x00001050
	adds r3, r0, r3
	str r3, [sp, 0x20]
	lsls r1, 16
	str r1, [sp, 0x1C]
_08098F42:
	mov r4, r8
	ldrb r0, [r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	lsls r7, r6, 2
	adds r1, r7, r6
	lsls r1, 4
	ldr r2, _08099004 @ =gPokemonStorage + 0x4
	adds r4, r1, r2
	adds r0, r4
	movs r1, 0x41
	bl GetBoxMonData
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _08098FC8
	mov r1, r8
	ldrb r0, [r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	adds r0, r4
	movs r1, 0
	bl GetBoxMonData
	adds r1, r0, 0
	ldr r2, [sp, 0x10]
	lsls r3, r2, 16
	asrs r3, 16
	movs r0, 0x2
	str r0, [sp]
	ldr r4, [sp, 0x18]
	str r4, [sp, 0x4]
	adds r0, r5, 0
	ldr r4, [sp, 0x1C]
	asrs r2, r4, 16
	bl sub_8099AFC
	ldr r2, [sp, 0x20]
	adds r1, r2, r7
	str r0, [r1]
	cmp r0, 0
	beq _08098FC8
	mov r3, sp
	ldrh r3, [r3, 0x8]
	strh r3, [r0, 0x30]
	ldr r0, [r1]
	mov r4, sp
	ldrh r4, [r4, 0xC]
	strh r4, [r0, 0x32]
	ldr r0, [r1]
	mov r2, r10
	strh r2, [r0, 0x34]
	ldr r1, [r1]
	ldr r0, _08099008 @ =sub_8098E24
	str r0, [r1, 0x1C]
	ldr r0, [sp, 0x14]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
_08098FC8:
	adds r0, r6, 0x6
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, [sp, 0x10]
	adds r0, 0x18
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x10]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	cmp r0, 0x4
	bls _08098F42
	ldr r0, [sp, 0x14]
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08098FF8: .4byte gUnknown_083B6DB4
_08098FFC: .4byte 0x0000117d
_08099000: .4byte 0x00001050
_08099004: .4byte gPokemonStorage + 0x4
_08099008: .4byte sub_8098E24
	thumb_func_end sub_8098EE0

	thumb_func_start sub_809900C
sub_809900C: @ 809900C
	push {r4-r6,lr}
	lsls r1, 24
	lsrs r1, 24
	ldr r4, _08099058 @ =gUnknown_083B6DB4
	ldr r5, [r4]
	ldr r3, _0809905C @ =0x0000117c
	adds r2, r5, r3
	movs r3, 0
	strb r3, [r2]
	ldr r6, _08099060 @ =0x0000117d
	adds r2, r5, r6
	strb r0, [r2]
	ldr r2, _08099064 @ =0x0000117b
	adds r0, r5, r2
	strb r1, [r0]
	subs r6, 0xB
	adds r2, r5, r6
	movs r0, 0x20
	strh r0, [r2]
	lsls r1, 24
	asrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	negs r0, r0
	adds r6, 0x4
	adds r2, r5, r6
	strh r0, [r2]
	ldr r2, _08099068 @ =0x00001178
	adds r0, r5, r2
	strh r3, [r0]
	cmp r1, 0
	ble _08099070
	ldr r3, _0809906C @ =0x0000117a
	adds r1, r5, r3
	movs r0, 0
	b _08099076
	.align 2, 0
_08099058: .4byte gUnknown_083B6DB4
_0809905C: .4byte 0x0000117c
_08099060: .4byte 0x0000117d
_08099064: .4byte 0x0000117b
_08099068: .4byte 0x00001178
_0809906C: .4byte 0x0000117a
_08099070:
	ldr r6, _080990A0 @ =0x0000117a
	adds r1, r5, r6
	movs r0, 0x5
_08099076:
	strb r0, [r1]
	ldr r2, [r4]
	ldr r1, _080990A0 @ =0x0000117a
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, 0x64
	ldr r3, _080990A4 @ =0x00001174
	adds r1, r2, r3
	strh r0, [r1]
	ldr r6, _080990A8 @ =0x00001176
	adds r2, r6
	movs r1, 0
	ldrsh r0, [r2, r1]
	bl sub_8098DE0
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080990A0: .4byte 0x0000117a
_080990A4: .4byte 0x00001174
_080990A8: .4byte 0x00001176
	thumb_func_end sub_809900C

	thumb_func_start sub_80990AC
sub_80990AC: @ 80990AC
	push {r4-r6,lr}
	ldr r0, _080990D4 @ =gUnknown_083B6DB4
	ldr r4, [r0]
	ldr r0, _080990D8 @ =0x00001172
	adds r3, r4, r0
	ldrh r0, [r3]
	cmp r0, 0
	beq _080990C0
	subs r0, 0x1
	strh r0, [r3]
_080990C0:
	ldr r1, _080990DC @ =0x0000117c
	adds r6, r4, r1
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _08099138
	cmp r0, 0x1
	bgt _080990E0
	cmp r0, 0
	beq _080990E8
	b _080991F0
	.align 2, 0
_080990D4: .4byte gUnknown_083B6DB4
_080990D8: .4byte 0x00001172
_080990DC: .4byte 0x0000117c
_080990E0:
	cmp r0, 0x2
	bne _080990E6
	b _080991E0
_080990E6:
	b _080991F0
_080990E8:
	ldr r2, _0809912C @ =0x00001174
	adds r5, r4, r2
	ldr r3, _08099130 @ =0x00001176
	adds r0, r4, r3
	ldrh r0, [r0]
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r5]
	subs r0, 0x41
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xBA
	bhi _08099104
	b _080991F8
_08099104:
	adds r2, 0x6
	adds r0, r4, r2
	ldrb r0, [r0]
	bl sub_8098EA0
	ldr r3, _08099134 @ =0x0000117b
	adds r0, r4, r3
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r5]
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _080991F8
	.align 2, 0
_0809912C: .4byte 0x00001174
_08099130: .4byte 0x00001176
_08099134: .4byte 0x0000117b
_08099138:
	ldr r2, _08099194 @ =0x00001174
	adds r1, r4, r2
	ldr r5, _08099198 @ =0x00001176
	adds r2, r4, r5
	ldrh r0, [r2]
	ldrh r5, [r1]
	adds r0, r5
	strh r0, [r1]
	ldr r0, _0809919C @ =0x0000117a
	adds r5, r4, r0
	ldrb r0, [r5]
	ldrh r1, [r3]
	movs r3, 0
	ldrsh r2, [r2, r3]
	bl sub_8098EE0
	ldr r2, _080991A0 @ =0x00001178
	adds r1, r4, r2
	lsls r0, 24
	lsrs r0, 24
	ldrh r3, [r1]
	adds r0, r3
	strh r0, [r1]
	ldr r1, _080991A4 @ =0x0000117b
	adds r0, r4, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	cmp r1, 0
	ble _08099178
	ldrb r0, [r5]
	cmp r0, 0x5
	beq _08099182
_08099178:
	cmp r1, 0
	bge _080991B0
	ldrb r0, [r5]
	cmp r0, 0
	bne _080991B0
_08099182:
	ldr r0, _080991A8 @ =gUnknown_083B6DB4
	ldr r1, [r0]
	ldr r2, _080991AC @ =0x0000117c
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080991F8
	.align 2, 0
_08099194: .4byte 0x00001174
_08099198: .4byte 0x00001176
_0809919C: .4byte 0x0000117a
_080991A0: .4byte 0x00001178
_080991A4: .4byte 0x0000117b
_080991A8: .4byte gUnknown_083B6DB4
_080991AC: .4byte 0x0000117c
_080991B0:
	ldr r0, _080991D0 @ =gUnknown_083B6DB4
	ldr r1, [r0]
	ldr r5, _080991D4 @ =0x0000117a
	adds r3, r1, r5
	ldr r2, _080991D8 @ =0x0000117b
	adds r0, r1, r2
	ldrb r0, [r0]
	ldrb r5, [r3]
	adds r0, r5
	movs r2, 0
	strb r0, [r3]
	ldr r0, _080991DC @ =0x0000117c
	adds r1, r0
	strb r2, [r1]
	b _080991F8
	.align 2, 0
_080991D0: .4byte gUnknown_083B6DB4
_080991D4: .4byte 0x0000117a
_080991D8: .4byte 0x0000117b
_080991DC: .4byte 0x0000117c
_080991E0:
	ldr r1, _080991F4 @ =0x00001178
	adds r0, r4, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _080991F8
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_080991F0:
	movs r0, 0
	b _080991FA
	.align 2, 0
_080991F4: .4byte 0x00001178
_080991F8:
	movs r0, 0x1
_080991FA:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80990AC

	thumb_func_start sub_8099200
sub_8099200: @ 8099200
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r4, _080992A0 @ =gPlayerParty
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r1, r0, 0
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xB
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r2, 0x68
	movs r3, 0x40
	bl sub_8099AFC
	ldr r1, _080992A4 @ =gUnknown_083B6DB4
	ldr r1, [r1]
	ldr r2, _080992A8 @ =0x00001038
	adds r1, r2
	str r0, [r1]
	movs r7, 0x1
	movs r6, 0x1
_08099246:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _080992A0 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _080992AC
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r1, r0, 0
	subs r0, r6, 0x1
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 19
	movs r0, 0x80
	lsls r0, 13
	adds r3, r0
	asrs r3, 16
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xB
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r2, 0x98
	bl sub_8099AFC
	ldr r1, _080992A4 @ =gUnknown_083B6DB4
	ldr r1, [r1]
	lsls r2, r6, 2
	ldr r3, _080992A8 @ =0x00001038
	adds r1, r3
	adds r1, r2
	str r0, [r1]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	b _080992BA
	.align 2, 0
_080992A0: .4byte gPlayerParty
_080992A4: .4byte gUnknown_083B6DB4
_080992A8: .4byte 0x00001038
_080992AC:
	ldr r0, _08099308 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	lsls r1, r6, 2
	ldr r2, _0809930C @ =0x00001038
	adds r0, r2
	adds r0, r1
	str r5, [r0]
_080992BA:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _08099246
	mov r3, r8
	cmp r3, 0
	bne _080992FA
	movs r6, 0
	cmp r6, r7
	bcs _080992FA
	ldr r0, _08099308 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _0809930C @ =0x00001038
	adds r3, r0, r1
	movs r4, 0x4
_080992DA:
	lsls r1, r6, 2
	adds r1, r3, r1
	ldr r2, [r1]
	ldrh r0, [r2, 0x22]
	subs r0, 0xA0
	strh r0, [r2, 0x22]
	ldr r1, [r1]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r7
	bcc _080992DA
_080992FA:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099308: .4byte gUnknown_083B6DB4
_0809930C: .4byte 0x00001038
	thumb_func_end sub_8099200

	thumb_func_start sub_8099310
sub_8099310: @ 8099310
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _08099368 @ =gUnknown_083B6DB4
	ldr r2, [r0]
	ldr r0, _0809936C @ =0x00001171
	adds r1, r2, r0
	movs r0, 0
	strb r0, [r1]
	movs r5, 0
	movs r6, 0
	mov r8, r2
	ldr r7, _0809936C @ =0x00001171
	add r7, r8
_0809932C:
	lsls r1, r5, 2
	ldr r0, _08099370 @ =0x00001038
	add r0, r8
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, 0
	beq _08099354
	cmp r5, r6
	beq _0809934E
	adds r1, r6, 0
	bl sub_8099388
	movs r0, 0
	str r0, [r4]
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
_0809934E:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08099354:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _0809932C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099368: .4byte gUnknown_083B6DB4
_0809936C: .4byte 0x00001171
_08099370: .4byte 0x00001038
	thumb_func_end sub_8099310

	thumb_func_start sub_8099374
sub_8099374: @ 8099374
	ldr r0, _08099380 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _08099384 @ =0x00001171
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08099380: .4byte gUnknown_083B6DB4
_08099384: .4byte 0x00001171
	thumb_func_end sub_8099374

	thumb_func_start sub_8099388
sub_8099388: @ 8099388
	push {r4,lr}
	adds r2, r0, 0
	lsls r1, 16
	lsrs r1, 16
	strh r1, [r2, 0x30]
	cmp r1, 0
	bne _0809939C
	movs r3, 0x68
	movs r4, 0x40
	b _080993AE
_0809939C:
	movs r3, 0x98
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 19
	movs r1, 0x80
	lsls r1, 13
	adds r0, r1
	lsrs r4, r0, 16
_080993AE:
	ldrh r0, [r2, 0x20]
	lsls r0, 3
	strh r0, [r2, 0x32]
	ldrh r0, [r2, 0x22]
	lsls r0, 3
	strh r0, [r2, 0x34]
	lsls r1, r3, 3
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	subs r0, r1, r0
	cmp r0, 0
	bge _080993C8
	adds r0, 0x7
_080993C8:
	asrs r0, 3
	strh r0, [r2, 0x36]
	lsls r0, r4, 16
	asrs r0, 13
	movs r3, 0x34
	ldrsh r1, [r2, r3]
	subs r0, r1
	cmp r0, 0
	bge _080993DC
	adds r0, 0x7
_080993DC:
	asrs r0, 3
	strh r0, [r2, 0x38]
	movs r0, 0x8
	strh r0, [r2, 0x3A]
	ldr r0, _080993F0 @ =sub_80993F4
	str r0, [r2, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080993F0: .4byte sub_80993F4
	thumb_func_end sub_8099388

	thumb_func_start sub_80993F4
sub_80993F4: @ 80993F4
	push {r4,lr}
	adds r3, r0, 0
	ldrh r2, [r3, 0x3A]
	movs r1, 0x3A
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _08099424
	ldrh r0, [r3, 0x36]
	ldrh r4, [r3, 0x32]
	adds r0, r4
	strh r0, [r3, 0x32]
	ldrh r1, [r3, 0x38]
	ldrh r4, [r3, 0x34]
	adds r1, r4
	strh r1, [r3, 0x34]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r3, 0x20]
	lsls r1, 16
	asrs r1, 19
	strh r1, [r3, 0x22]
	subs r0, r2, 0x1
	strh r0, [r3, 0x3A]
	b _08099468
_08099424:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _08099434
	movs r0, 0x68
	strh r0, [r3, 0x20]
	movs r0, 0x40
	b _08099446
_08099434:
	movs r0, 0x98
	strh r0, [r3, 0x20]
	movs r4, 0x30
	ldrsh r1, [r3, r4]
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, 0x10
_08099446:
	strh r0, [r3, 0x22]
	ldr r0, _08099470 @ =SpriteCallbackDummy
	str r0, [r3, 0x1C]
	ldr r0, _08099474 @ =gUnknown_083B6DB4
	ldr r2, [r0]
	movs r0, 0x30
	ldrsh r1, [r3, r0]
	lsls r1, 2
	ldr r4, _08099478 @ =0x00001038
	adds r0, r2, r4
	adds r0, r1
	str r3, [r0]
	ldr r0, _0809947C @ =0x00001171
	adds r2, r0
	ldrb r0, [r2]
	subs r0, 0x1
	strb r0, [r2]
_08099468:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099470: .4byte SpriteCallbackDummy
_08099474: .4byte gUnknown_083B6DB4
_08099478: .4byte 0x00001038
_0809947C: .4byte 0x00001171
	thumb_func_end sub_80993F4

	thumb_func_start sub_8099480
sub_8099480: @ 8099480
	push {r4,lr}
	ldr r0, _080994A0 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _080994A4 @ =0x00001034
	adds r4, r0, r1
	ldr r0, [r4]
	cmp r0, 0
	beq _08099498
	bl sub_8099BE0
	movs r0, 0
	str r0, [r4]
_08099498:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080994A0: .4byte gUnknown_083B6DB4
_080994A4: .4byte 0x00001034
	thumb_func_end sub_8099480

	thumb_func_start sub_80994A8
sub_80994A8: @ 80994A8
	push {r4-r6,lr}
	movs r3, 0
	ldr r1, _080994FC @ =gUnknown_083B6DB4
	ldr r1, [r1]
	ldr r2, _08099500 @ =0x00001038
	adds r5, r1, r2
	lsls r0, 16
	asrs r4, r0, 16
	movs r6, 0x5
	negs r6, r6
_080994BC:
	lsls r0, r3, 2
	adds r2, r5, r0
	ldr r1, [r2]
	cmp r1, 0
	beq _0809950E
	ldrh r0, [r1, 0x22]
	adds r0, r4, r0
	strh r0, [r1, 0x22]
	ldr r2, [r2]
	ldrh r1, [r2, 0x26]
	ldrh r0, [r2, 0x22]
	adds r1, r0
	adds r0, r2, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 13
	adds r0, r1
	lsrs r0, 16
	cmp r0, 0xC0
	bls _08099504
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0809950E
	.align 2, 0
_080994FC: .4byte gUnknown_083B6DB4
_08099500: .4byte 0x00001038
_08099504:
	adds r2, 0x3E
	ldrb r1, [r2]
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r2]
_0809950E:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _080994BC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80994A8

	thumb_func_start sub_8099520
sub_8099520: @ 8099520
	push {r4,lr}
	lsls r0, 24
	ldr r1, _08099544 @ =gUnknown_083B6DB4
	ldr r1, [r1]
	lsrs r0, 22
	ldr r2, _08099548 @ =0x00001038
	adds r1, r2
	adds r4, r1, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _0809953E
	bl sub_8099BE0
	movs r0, 0
	str r0, [r4]
_0809953E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099544: .4byte gUnknown_083B6DB4
_08099548: .4byte 0x00001038
	thumb_func_end sub_8099520

	thumb_func_start sub_809954C
sub_809954C: @ 809954C
	push {r4-r6,lr}
	movs r5, 0
	ldr r0, _0809957C @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _08099580 @ =0x00001038
	adds r6, r0, r1
_08099558:
	lsls r0, r5, 2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, 0
	beq _0809956A
	bl sub_8099BE0
	movs r0, 0
	str r0, [r4]
_0809956A:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _08099558
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809957C: .4byte gUnknown_083B6DB4
_08099580: .4byte 0x00001038
	thumb_func_end sub_809954C

	thumb_func_start sub_8099584
sub_8099584: @ 8099584
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r5, r1, 0
	cmp r4, 0
	bne _080995B4
	ldr r3, _080995AC @ =gUnknown_083B6DB4
	ldr r0, [r3]
	ldr r5, _080995B0 @ =0x00001034
	adds r2, r0, r5
	lsls r1, 2
	adds r5, 0x4
	adds r0, r5
	adds r0, r1
	ldr r1, [r0]
	str r1, [r2]
	str r4, [r0]
	b _080995D0
	.align 2, 0
_080995AC: .4byte gUnknown_083B6DB4
_080995B0: .4byte 0x00001034
_080995B4:
	cmp r4, 0x1
	bne _080995F4
	ldr r3, _080995FC @ =gUnknown_083B6DB4
	ldr r0, [r3]
	ldr r1, _08099600 @ =0x00001034
	adds r2, r0, r1
	lsls r1, r5, 2
	ldr r4, _08099604 @ =0x00001050
	adds r0, r4
	adds r0, r1
	ldr r1, [r0]
	str r1, [r2]
	movs r1, 0
	str r1, [r0]
_080995D0:
	ldr r2, [r3]
	ldr r5, _08099600 @ =0x00001034
	adds r2, r5
	ldr r1, [r2]
	ldr r0, _08099608 @ =sub_80999C4
	str r0, [r1, 0x1C]
	ldr r3, [r2]
	ldrb r1, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldr r0, [r2]
	adds r0, 0x43
	movs r1, 0x7
	strb r1, [r0]
_080995F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080995FC: .4byte gUnknown_083B6DB4
_08099600: .4byte 0x00001034
_08099604: .4byte 0x00001050
_08099608: .4byte sub_80999C4
	thumb_func_end sub_8099584

	thumb_func_start sub_809960C
sub_809960C: @ 809960C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	cmp r0, 0xE
	bne _08099654
	ldr r4, _08099648 @ =gUnknown_083B6DB4
	ldr r0, [r4]
	lsls r1, r6, 2
	ldr r2, _0809964C @ =0x00001038
	adds r3, r0, r2
	adds r3, r1
	ldr r1, _08099650 @ =0x00001034
	adds r0, r1
	ldr r2, [r0]
	str r2, [r3]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, [r3]
	adds r0, 0x43
	movs r1, 0xB
	strb r1, [r0]
	b _0809968A
	.align 2, 0
_08099648: .4byte gUnknown_083B6DB4
_0809964C: .4byte 0x00001038
_08099650: .4byte 0x00001034
_08099654:
	ldr r5, _080996A0 @ =gUnknown_083B6DB4
	ldr r0, [r5]
	lsls r1, r6, 2
	ldr r2, _080996A4 @ =0x00001050
	adds r3, r0, r2
	adds r3, r1
	ldr r1, _080996A8 @ =0x00001034
	adds r0, r1
	ldr r2, [r0]
	str r2, [r3]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r4, [r3]
	adds r0, r6, 0
	movs r1, 0x6
	bl __umodsi3
	movs r1, 0x12
	subs r1, r0
	adds r4, 0x43
	strb r1, [r4]
	adds r4, r5, 0
_0809968A:
	ldr r1, [r4]
	ldr r2, _080996A8 @ =0x00001034
	adds r1, r2
	ldr r2, [r1]
	ldr r0, _080996AC @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
	movs r0, 0
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080996A0: .4byte gUnknown_083B6DB4
_080996A4: .4byte 0x00001050
_080996A8: .4byte 0x00001034
_080996AC: .4byte SpriteCallbackDummy
	thumb_func_end sub_809960C

	thumb_func_start sub_80996B0
sub_80996B0: @ 80996B0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r0, 0xE
	bne _080996D8
	ldr r3, _080996CC @ =gUnknown_083B6DB4
	ldr r1, [r3]
	ldr r0, _080996D0 @ =0x000010c8
	adds r2, r1, r0
	lsls r0, r4, 2
	ldr r4, _080996D4 @ =0x00001038
	b _080996E4
	.align 2, 0
_080996CC: .4byte gUnknown_083B6DB4
_080996D0: .4byte 0x000010c8
_080996D4: .4byte 0x00001038
_080996D8:
	ldr r3, _08099704 @ =gUnknown_083B6DB4
	ldr r1, [r3]
	ldr r0, _08099708 @ =0x000010c8
	adds r2, r1, r0
	lsls r0, r4, 2
	ldr r4, _0809970C @ =0x00001050
_080996E4:
	adds r0, r4
	adds r1, r0
	str r1, [r2]
	ldr r1, [r3]
	ldr r2, _08099710 @ =0x00001034
	adds r0, r1, r2
	ldr r2, [r0]
	ldr r0, _08099714 @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
	ldr r4, _08099718 @ =0x00001170
	adds r1, r4
	movs r0, 0
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099704: .4byte gUnknown_083B6DB4
_08099708: .4byte 0x000010c8
_0809970C: .4byte 0x00001050
_08099710: .4byte 0x00001034
_08099714: .4byte SpriteCallbackDummy
_08099718: .4byte 0x00001170
	thumb_func_end sub_80996B0

	thumb_func_start sub_809971C
sub_809971C: @ 809971C
	push {r4-r7,lr}
	ldr r0, _08099730 @ =gUnknown_083B6DB4
	ldr r2, [r0]
	ldr r0, _08099734 @ =0x00001170
	adds r7, r2, r0
	ldrb r0, [r7]
	cmp r0, 0x10
	bne _08099738
	movs r0, 0
	b _08099800
	.align 2, 0
_08099730: .4byte gUnknown_083B6DB4
_08099734: .4byte 0x00001170
_08099738:
	adds r0, 0x1
	strb r0, [r7]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809975E
	ldr r1, _08099808 @ =0x000010c8
	adds r0, r2, r1
	ldr r0, [r0]
	ldr r1, [r0]
	ldrh r0, [r1, 0x22]
	subs r0, 0x1
	strh r0, [r1, 0x22]
	ldr r4, _0809980C @ =0x00001034
	adds r0, r2, r4
	ldr r1, [r0]
	ldrh r0, [r1, 0x22]
	adds r0, 0x1
	strh r0, [r1, 0x22]
_0809975E:
	ldr r0, _08099808 @ =0x000010c8
	adds r5, r2, r0
	ldr r0, [r5]
	ldr r1, [r0]
	ldr r3, _08099810 @ =gSineTable
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r3
	movs r4, 0
	ldrsh r0, [r0, r4]
	cmp r0, 0
	bge _08099778
	adds r0, 0xF
_08099778:
	asrs r0, 4
	strh r0, [r1, 0x24]
	ldr r0, _0809980C @ =0x00001034
	adds r6, r2, r0
	ldr r1, [r6]
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r3
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bge _08099792
	adds r0, 0xF
_08099792:
	asrs r0, 4
	negs r0, r0
	strh r0, [r1, 0x24]
	ldrb r0, [r7]
	cmp r0, 0x8
	bne _080997DE
	ldr r4, [r6]
	ldr r0, [r5]
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	movs r2, 0xC
	ands r2, r0
	ldrb r3, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	adds r0, r1, 0
	ands r0, r3
	orrs r0, r2
	strb r0, [r4, 0x5]
	ldr r2, [r6]
	ldr r0, [r5]
	ldr r0, [r0]
	adds r0, 0x43
	ldrb r0, [r0]
	adds r2, 0x43
	strb r0, [r2]
	ldr r0, [r5]
	ldr r2, [r0]
	ldrb r0, [r2, 0x5]
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r2, 0x5]
	ldr r0, [r5]
	ldr r0, [r0]
	adds r0, 0x43
	movs r1, 0x7
	strb r1, [r0]
_080997DE:
	ldrb r0, [r7]
	cmp r0, 0x10
	bne _080997FE
	ldr r1, [r6]
	ldr r0, [r5]
	ldr r0, [r0]
	str r0, [r6]
	ldr r0, [r5]
	str r1, [r0]
	ldr r1, [r6]
	ldr r0, _08099814 @ =sub_80999C4
	str r0, [r1, 0x1C]
	ldr r0, [r5]
	ldr r1, [r0]
	ldr r0, _08099818 @ =SpriteCallbackDummy
	str r0, [r1, 0x1C]
_080997FE:
	movs r0, 0x1
_08099800:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08099808: .4byte 0x000010c8
_0809980C: .4byte 0x00001034
_08099810: .4byte gSineTable
_08099814: .4byte sub_80999C4
_08099818: .4byte SpriteCallbackDummy
	thumb_func_end sub_809971C

	thumb_func_start sub_809981C
sub_809981C: @ 809981C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	cmp r0, 0x1
	beq _08099858
	cmp r0, 0x1
	bgt _08099836
	cmp r0, 0
	beq _0809983C
	b _080998C0
_08099836:
	cmp r2, 0x2
	beq _0809987C
	b _080998C0
_0809983C:
	ldr r3, _0809984C @ =gUnknown_083B6DB4
	ldr r1, [r3]
	ldr r0, _08099850 @ =0x000010cc
	adds r2, r1, r0
	lsls r0, r4, 2
	ldr r4, _08099854 @ =0x00001038
	b _08099864
	.align 2, 0
_0809984C: .4byte gUnknown_083B6DB4
_08099850: .4byte 0x000010cc
_08099854: .4byte 0x00001038
_08099858:
	ldr r3, _08099870 @ =gUnknown_083B6DB4
	ldr r1, [r3]
	ldr r0, _08099874 @ =0x000010cc
	adds r2, r1, r0
	lsls r0, r4, 2
	ldr r4, _08099878 @ =0x00001050
_08099864:
	adds r0, r4
	adds r1, r0
	str r1, [r2]
	adds r0, r3, 0
	b _0809988A
	.align 2, 0
_08099870: .4byte gUnknown_083B6DB4
_08099874: .4byte 0x000010cc
_08099878: .4byte 0x00001050
_0809987C:
	ldr r0, _080998C8 @ =gUnknown_083B6DB4
	ldr r1, [r0]
	ldr r3, _080998CC @ =0x000010cc
	adds r2, r1, r3
	ldr r4, _080998D0 @ =0x00001034
	adds r1, r4
	str r1, [r2]
_0809988A:
	ldr r0, [r0]
	ldr r1, _080998CC @ =0x000010cc
	adds r4, r0, r1
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, 0
	beq _080998C0
	bl InitSpriteAffineAnim
	ldr r0, [r4]
	ldr r2, [r0]
	ldrb r1, [r2, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, _080998D4 @ =gSpriteAffineAnimTable_83B6F5C
	str r0, [r1, 0x10]
	ldr r0, [r4]
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAffineAnim
_080998C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080998C8: .4byte gUnknown_083B6DB4
_080998CC: .4byte 0x000010cc
_080998D0: .4byte 0x00001034
_080998D4: .4byte gSpriteAffineAnimTable_83B6F5C
	thumb_func_end sub_809981C

	thumb_func_start sub_80998D8
sub_80998D8: @ 80998D8
	push {lr}
	ldr r0, _080998FC @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _08099900 @ =0x000010cc
	adds r0, r1
	ldr r0, [r0]
	ldr r1, [r0]
	cmp r1, 0
	beq _080998F8
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r0, 0x4
	ands r0, r2
	cmp r0, 0
	beq _08099904
_080998F8:
	movs r0, 0
	b _0809991A
	.align 2, 0
_080998FC: .4byte gUnknown_083B6DB4
_08099900: .4byte 0x000010cc
_08099904:
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08099918
	movs r0, 0x4
	orrs r0, r2
	strb r0, [r3]
_08099918:
	movs r0, 0x1
_0809991A:
	pop {r1}
	bx r1
	thumb_func_end sub_80998D8

	thumb_func_start sub_8099920
sub_8099920: @ 8099920
	push {r4,lr}
	ldr r0, _08099950 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _08099954 @ =0x000010cc
	adds r4, r0, r1
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, 0
	beq _0809994A
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_8099BE0
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1]
_0809994A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099950: .4byte gUnknown_083B6DB4
_08099954: .4byte 0x000010cc
	thumb_func_end sub_8099920

	thumb_func_start sub_8099958
sub_8099958: @ 8099958
	push {lr}
	ldr r0, _08099988 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _0809998C @ =0x000010cc
	adds r3, r0, r1
	ldr r0, [r3]
	ldr r0, [r0]
	cmp r0, 0
	beq _08099982
	adds r2, r0, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAffineAnim
_08099982:
	pop {r0}
	bx r0
	.align 2, 0
_08099988: .4byte gUnknown_083B6DB4
_0809998C: .4byte 0x000010cc
	thumb_func_end sub_8099958

	thumb_func_start sub_8099990
sub_8099990: @ 8099990
	push {lr}
	ldr r0, _080999A4 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _080999A8 @ =0x000010cc
	adds r2, r0, r1
	ldr r0, [r2]
	cmp r0, 0
	bne _080999AC
	movs r0, 0
	b _080999C0
	.align 2, 0
_080999A4: .4byte gUnknown_083B6DB4
_080999A8: .4byte 0x000010cc
_080999AC:
	ldr r0, [r0]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080999BE
	movs r0, 0
	str r0, [r2]
_080999BE:
	movs r0, 0x1
_080999C0:
	pop {r1}
	bx r1
	thumb_func_end sub_8099990

	thumb_func_start sub_80999C4
sub_80999C4: @ 80999C4
	ldr r1, _080999E4 @ =gUnknown_083B6DB4
	ldr r1, [r1]
	movs r2, 0x8E
	lsls r2, 5
	adds r1, r2
	ldr r2, [r1]
	ldrh r2, [r2, 0x20]
	strh r2, [r0, 0x20]
	ldr r2, [r1]
	ldrh r1, [r2, 0x26]
	ldrh r2, [r2, 0x22]
	adds r1, r2
	adds r1, 0x4
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080999E4: .4byte gUnknown_083B6DB4
	thumb_func_end sub_80999C4

	thumb_func_start sub_80999E8
sub_80999E8: @ 80999E8
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r4, 0
	ldr r1, _08099A58 @ =gUnknown_083B6DB4
	ldr r0, [r1]
	movs r2, 0x89
	lsls r2, 5
	adds r0, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, r3
	beq _08099A20
	adds r6, r2, 0
	movs r5, 0x89
	lsls r5, 5
_08099A08:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x27
	bhi _08099A20
	ldr r0, [r6]
	lsls r1, r4, 1
	adds r0, r5
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r3
	bne _08099A08
_08099A20:
	cmp r4, 0x28
	bne _08099A60
	movs r4, 0
	ldr r0, [r2]
	movs r5, 0x89
	lsls r5, 5
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, 0
	beq _08099A4E
	adds r6, r2, 0
_08099A36:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x27
	bhi _08099A4E
	ldr r0, [r6]
	lsls r1, r4, 1
	adds r0, r5
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _08099A36
_08099A4E:
	cmp r4, 0x28
	bne _08099A60
	ldr r0, _08099A5C @ =0x0000ffff
	b _08099A94
	.align 2, 0
_08099A58: .4byte gUnknown_083B6DB4
_08099A5C: .4byte 0x0000ffff
_08099A60:
	ldr r1, [r2]
	lsls r2, r4, 1
	movs r5, 0x89
	lsls r5, 5
	adds r0, r1, r5
	adds r0, r2
	strh r3, [r0]
	ldr r0, _08099A9C @ =0x000010d0
	adds r1, r0
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r4, 20
	lsrs r4, 16
	ldr r1, _08099AA0 @ =gMonIconTable
	lsls r0, r3, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r1, r4, 5
	ldr r2, _08099AA4 @ =0x06010000
	adds r1, r2
	ldr r2, _08099AA8 @ =0x04000080
	bl CpuSet
	adds r0, r4, 0
_08099A94:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08099A9C: .4byte 0x000010d0
_08099AA0: .4byte gMonIconTable
_08099AA4: .4byte 0x06010000
_08099AA8: .4byte 0x04000080
	thumb_func_end sub_80999E8

	thumb_func_start sub_8099AAC
sub_8099AAC: @ 8099AAC
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	movs r3, 0
	ldr r0, _08099AE4 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	movs r1, 0x89
	lsls r1, 5
	adds r5, r0, r1
	subs r1, 0x50
	adds r4, r0, r1
	ldr r0, _08099AE8 @ =0x0000ffff
	adds r7, r0, 0
_08099AC6:
	lsls r1, r3, 1
	adds r2, r5, r1
	ldrh r0, [r2]
	cmp r0, r6
	bne _08099AEC
	adds r1, r4, r1
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ands r0, r7
	cmp r0, 0
	bne _08099AF6
	strh r0, [r2]
	b _08099AF6
	.align 2, 0
_08099AE4: .4byte gUnknown_083B6DB4
_08099AE8: .4byte 0x0000ffff
_08099AEC:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x27
	bls _08099AC6
_08099AF6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8099AAC

	thumb_func_start sub_8099AFC
sub_8099AFC: @ 8099AFC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r4, [sp, 0x3C]
	ldr r5, [sp, 0x40]
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0x18]
	lsls r3, 16
	lsrs r3, 16
	mov r8, r3
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r9, r5
	mov r2, sp
	ldr r0, _08099BAC @ =gSpriteTemplate_83B6F14
	ldm r0!, {r3,r5,r7}
	stm r2!, {r3,r5,r7}
	ldm r0!, {r3,r5,r7}
	stm r2!, {r3,r5,r7}
	adds r0, r6, 0
	bl mon_icon_convert_unown_species_id
	mov r10, r0
	mov r6, r10
	mov r2, sp
	ldr r1, _08099BB0 @ =gMonIconPaletteIndices
	adds r1, r6, r1
	ldr r3, _08099BB4 @ =0x0000dac0
	adds r0, r3, 0
	ldrb r1, [r1]
	adds r0, r1
	strh r0, [r2, 0x2]
	adds r0, r6, 0
	bl sub_80999E8
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0, 0
	ldr r0, _08099BB8 @ =0x0000ffff
	cmp r5, r0
	beq _08099BCE
	ldr r7, [sp, 0x18]
	lsls r1, r7, 16
	asrs r1, 16
	mov r0, r8
	lsls r2, r0, 16
	asrs r2, 16
	mov r0, sp
	mov r3, r9
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _08099BC8
	ldr r1, _08099BBC @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldr r2, _08099BC0 @ =0x000003ff
	ands r2, r5
	ldrh r3, [r0, 0x4]
	ldr r1, _08099BC4 @ =0xfffffc00
	ands r1, r3
	orrs r1, r2
	strh r1, [r0, 0x4]
	movs r1, 0x3
	ands r4, r1
	lsls r3, r4, 2
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r3
	strb r1, [r0, 0x5]
	mov r1, r10
	strh r1, [r0, 0x2E]
	b _08099BD0
	.align 2, 0
_08099BAC: .4byte gSpriteTemplate_83B6F14
_08099BB0: .4byte gMonIconPaletteIndices
_08099BB4: .4byte 0x0000dac0
_08099BB8: .4byte 0x0000ffff
_08099BBC: .4byte gSprites
_08099BC0: .4byte 0x000003ff
_08099BC4: .4byte 0xfffffc00
_08099BC8:
	adds r0, r6, 0
	bl sub_8099AAC
_08099BCE:
	movs r0, 0
_08099BD0:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8099AFC

	thumb_func_start sub_8099BE0
sub_8099BE0: @ 8099BE0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	bl sub_8099AAC
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8099BE0

	thumb_func_start sub_8099BF8
sub_8099BF8: @ 8099BF8
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08099C50 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _08099C54 @ =0x000008ba
	adds r2, r0, r1
	movs r1, 0
	strb r1, [r2]
	ldr r2, _08099C58 @ =0x000008b4
	adds r0, r2
	strh r1, [r0]
	str r1, [sp]
	ldr r1, _08099C5C @ =0x040000d4
	mov r0, sp
	str r0, [r1]
	ldr r0, _08099C60 @ =0x0600d000
	str r0, [r1, 0x4]
	ldr r0, _08099C64 @ =0x85000400
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r0, r4, 0
	movs r1, 0
	bl sub_8099EB0
	adds r0, r4, 0
	bl sub_809A23C
	bl sub_809A6DC
	adds r0, r4, 0
	bl sub_8098C48
	ldr r1, _08099C68 @ =REG_BG2CNT
	ldr r2, _08099C6C @ =0x00005a0a
	adds r0, r2, 0
	strh r0, [r1]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099C50: .4byte gUnknown_083B6DB4
_08099C54: .4byte 0x000008ba
_08099C58: .4byte 0x000008b4
_08099C5C: .4byte 0x040000d4
_08099C60: .4byte 0x0600d000
_08099C64: .4byte 0x85000400
_08099C68: .4byte REG_BG2CNT
_08099C6C: .4byte 0x00005a0a
	thumb_func_end sub_8099BF8

	thumb_func_start sub_8099C70
sub_8099C70: @ 8099C70
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	bl sub_8099D90
	lsls r0, 24
	asrs r4, r0, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8099EB0
	ldr r0, _08099D10 @ =gUnknown_083B6DB4
	ldr r2, [r0]
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 1
	ldr r3, _08099D14 @ =0x000008b6
	adds r1, r2, r3
	strh r0, [r1]
	ldr r0, _08099D18 @ =0x000008b8
	adds r1, r2, r0
	movs r0, 0x20
	strh r0, [r1]
	ldr r1, _08099D1C @ =0x000008bb
	adds r0, r2, r1
	strb r5, [r0]
	movs r1, 0
	cmp r4, 0
	bgt _08099CAE
	movs r1, 0x5
_08099CAE:
	ldr r3, _08099D20 @ =0x000008bc
	adds r0, r2, r3
	strh r1, [r0]
	ldr r1, _08099D24 @ =0x000008be
	adds r0, r2, r1
	strh r4, [r0]
	movs r1, 0x38
	cmp r4, 0
	ble _08099CC6
	movs r3, 0x84
	lsls r3, 1
	adds r1, r3, 0
_08099CC6:
	movs r3, 0x8C
	lsls r3, 4
	adds r0, r2, r3
	strh r1, [r0]
	movs r1, 0
	cmp r4, 0
	bgt _08099CD6
	movs r1, 0x5
_08099CD6:
	ldr r3, _08099D28 @ =0x000008c2
	adds r0, r2, r3
	strh r1, [r0]
	ldr r1, _08099D2C @ =0x000008c4
	adds r0, r2, r1
	strh r4, [r0]
	adds r3, 0x4
	adds r1, r2, r3
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08099D30 @ =0x000008c8
	adds r1, r2, r0
	movs r0, 0x2
	strh r0, [r1]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_809900C
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_809A3D0
	adds r0, r4, 0
	bl sub_809A774
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099D10: .4byte gUnknown_083B6DB4
_08099D14: .4byte 0x000008b6
_08099D18: .4byte 0x000008b8
_08099D1C: .4byte 0x000008bb
_08099D20: .4byte 0x000008bc
_08099D24: .4byte 0x000008be
_08099D28: .4byte 0x000008c2
_08099D2C: .4byte 0x000008c4
_08099D30: .4byte 0x000008c8
	thumb_func_end sub_8099C70

	thumb_func_start sub_8099D34
sub_8099D34: @ 8099D34
	push {r4,lr}
	bl sub_80990AC
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08099D78 @ =gUnknown_083B6DB4
	ldr r1, [r0]
	ldr r0, _08099D7C @ =0x000008b8
	adds r3, r1, r0
	ldrh r0, [r3]
	cmp r0, 0
	beq _08099D88
	ldr r4, _08099D80 @ =0x000008b4
	adds r2, r1, r4
	adds r4, 0x2
	adds r0, r1, r4
	ldrh r0, [r0]
	ldrh r1, [r2]
	adds r0, r1
	ldr r1, _08099D84 @ =0x000001ff
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r3]
	subs r0, 0x1
	strh r0, [r3]
	lsls r0, 16
	cmp r0, 0
	bne _08099D74
	bl sub_809A598
	bl sub_809A810
_08099D74:
	movs r0, 0x1
	b _08099D8A
	.align 2, 0
_08099D78: .4byte gUnknown_083B6DB4
_08099D7C: .4byte 0x000008b8
_08099D80: .4byte 0x000008b4
_08099D84: .4byte 0x000001ff
_08099D88:
	adds r0, r2, 0
_08099D8A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8099D34

	thumb_func_start sub_8099D90
sub_8099D90: @ 8099D90
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl get_preferred_box
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0
	cmp r1, r4
	beq _08099DBA
_08099DA4:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xD
	bls _08099DB0
	movs r1, 0
_08099DB0:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r1, r4
	bne _08099DA4
_08099DBA:
	movs r0, 0x1
	negs r0, r0
	cmp r2, 0x6
	bhi _08099DC4
	movs r0, 0x1
_08099DC4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8099D90

	thumb_func_start sub_8099DCC
sub_8099DCC: @ 8099DCC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08099DF8 @ =gPokemonStorage
	ldr r2, _08099DFC @ =0x000083c2
	adds r1, r2
	adds r0, r1
	movs r1, 0
	strb r4, [r0]
	ldr r0, _08099E00 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r2, _08099E04 @ =0x00001032
	adds r0, r2
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099DF8: .4byte gPokemonStorage
_08099DFC: .4byte 0x000083c2
_08099E00: .4byte gUnknown_083B6DB4
_08099E04: .4byte 0x00001032
	thumb_func_end sub_8099DCC

	thumb_func_start sub_8099E08
sub_8099E08: @ 8099E08
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08099E24 @ =gUnknown_083B6DB4
	ldr r5, [r0]
	ldr r0, _08099E28 @ =0x00001032
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _08099E54
	cmp r0, 0x1
	bgt _08099E2C
	cmp r0, 0
	beq _08099E36
	b _08099EA6
	.align 2, 0
_08099E24: .4byte gUnknown_083B6DB4
_08099E28: .4byte 0x00001032
_08099E2C:
	cmp r0, 0x2
	beq _08099E90
	cmp r0, 0x3
	beq _08099EA2
	b _08099EA6
_08099E36:
	ldr r1, _08099E4C @ =0x00000d08
	adds r0, r5, r1
	ldr r0, [r0]
	ldr r1, _08099E50 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _08099E9A
	.align 2, 0
_08099E4C: .4byte 0x00000d08
_08099E50: .4byte 0x0000ffff
_08099E54:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08099EA6
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8099EB0
	bl sub_809A654
	ldr r1, _08099E88 @ =0x00000d08
	adds r0, r5, r1
	ldr r0, [r0]
	ldr r1, _08099E8C @ =0x0000ffff
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08099E9A
	.align 2, 0
_08099E88: .4byte 0x00000d08
_08099E8C: .4byte 0x0000ffff
_08099E90:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08099EA6
_08099E9A:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08099EA6
_08099EA2:
	movs r0, 0
	b _08099EA8
_08099EA6:
	movs r0, 0x1
_08099EA8:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8099E08

	thumb_func_start sub_8099EB0
sub_8099EB0: @ 8099EB0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	cmp r1, 0
	beq _08099ED8
	ldr r0, _08099F38 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	movs r2, 0
	ldr r3, _08099F3C @ =0x000008ba
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, 0
	bne _08099ED0
	movs r2, 0x1
_08099ED0:
	strb r2, [r1]
	ldr r0, _08099F40 @ =0x0600d000
	bl sub_809A14C
_08099ED8:
	ldr r0, _08099F44 @ =gPokemonStorage
	ldr r1, _08099F48 @ =0x000083c2
	adds r0, r1
	adds r0, r4, r0
	ldrb r4, [r0]
	lsls r4, 4
	ldr r0, _08099F4C @ =gWallpaperTable
	adds r4, r0
	ldr r0, [r4, 0xC]
	ldr r1, _08099F38 @ =gUnknown_083B6DB4
	ldr r5, [r1]
	ldr r2, _08099F3C @ =0x000008ba
	adds r6, r5, r2
	ldrb r2, [r6]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 20
	movs r3, 0x80
	lsls r3, 15
	adds r1, r3
	lsrs r1, 16
	movs r2, 0x60
	bl LoadPalette
	ldr r0, [r4, 0x8]
	ldr r1, _08099F50 @ =0x00000d62
	adds r5, r1
	adds r1, r5, 0
	bl LZ77UnCompWram
	ldr r0, _08099F40 @ =0x0600d000
	lsls r2, r7, 24
	asrs r2, 24
	ldrb r3, [r6]
	adds r1, r5, 0
	bl sub_8099F58
	ldr r0, [r4]
	ldrb r1, [r6]
	lsls r1, 13
	ldr r2, _08099F54 @ =0x06008000
	adds r1, r2
	bl LZ77UnCompVram
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099F38: .4byte gUnknown_083B6DB4
_08099F3C: .4byte 0x000008ba
_08099F40: .4byte 0x0600d000
_08099F44: .4byte gPokemonStorage
_08099F48: .4byte 0x000083c2
_08099F4C: .4byte gWallpaperTable
_08099F50: .4byte 0x00000d62
_08099F54: .4byte 0x06008000
	thumb_func_end sub_8099EB0

	thumb_func_start sub_8099F58
sub_8099F58: @ 8099F58
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	mov r9, r0
	adds r5, r1, 0
	lsls r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r0, r3, 8
	str r0, [sp]
	lsls r0, r3, 1
	adds r0, r3
	adds r0, 0x4
	lsls r0, 28
	lsrs r0, 16
	str r0, [sp, 0x4]
	ldr r0, _08099FB8 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _08099FBC @ =0x000008b4
	adds r0, r1
	ldrh r1, [r0]
	lsrs r1, 3
	adds r1, 0xA
	lsrs r0, r2, 24
	mov r8, r0
	asrs r2, 24
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	movs r0, 0x3F
	ands r1, r0
	str r1, [sp, 0x8]
	adds r2, r1, 0
	cmp r2, 0xC
	bgt _08099FC0
	movs r6, 0x14
	movs r3, 0
	lsls r0, r2, 1
	adds r0, 0x80
	mov r1, r9
	adds r4, r1, r0
	movs r7, 0
	b _0809A020
	.align 2, 0
_08099FB8: .4byte gUnknown_083B6DB4
_08099FBC: .4byte 0x000008b4
_08099FC0:
	cmp r2, 0x1F
	bgt _08099FE6
	movs r0, 0x20
	subs r0, r2
	lsls r0, 16
	movs r1, 0x14
	lsrs r6, r0, 16
	asrs r0, 16
	subs r1, r0
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r0, r2, 1
	adds r0, 0x80
	mov r2, r9
	adds r4, r2, r0
	movs r7, 0x88
	lsls r7, 4
	add r7, r9
	b _0809A020
_08099FE6:
	cmp r2, 0x2C
	bgt _08099FFE
	movs r6, 0x14
	movs r3, 0
	lsls r0, r2, 1
	movs r1, 0x84
	lsls r1, 4
	adds r0, r1
	mov r2, r9
	adds r4, r2, r0
	movs r7, 0
	b _0809A020
_08099FFE:
	movs r0, 0x40
	subs r0, r2
	lsls r0, 16
	movs r1, 0x14
	lsrs r6, r0, 16
	asrs r0, 16
	subs r1, r0
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r0, r2, 1
	movs r1, 0x84
	lsls r1, 4
	adds r0, r1
	mov r2, r9
	adds r4, r2, r0
	mov r7, r9
	adds r7, 0x80
_0809A020:
	movs r1, 0
	mov r0, r8
	lsls r0, 24
	str r0, [sp, 0x14]
	lsls r0, r6, 16
	asrs r0, 16
	mov r8, r0
	lsls r3, 16
	str r3, [sp, 0xC]
	asrs r2, r3, 16
	str r2, [sp, 0x10]
_0809A036:
	movs r3, 0
	adds r0, r4, 0
	adds r0, 0x40
	str r0, [sp, 0x18]
	adds r2, r7, 0
	adds r2, 0x40
	str r2, [sp, 0x1C]
	adds r1, 0x1
	mov r10, r1
	cmp r3, r8
	bge _0809A07A
	ldr r0, _0809A0D4 @ =0x00000fff
	mov r12, r0
	movs r6, 0xF0
	lsls r6, 8
_0809A054:
	ldrh r2, [r5]
	mov r0, r12
	ands r0, r2
	ldr r1, [sp]
	adds r0, r1, r0
	adds r1, r6, 0
	ands r1, r2
	ldr r2, [sp, 0x4]
	adds r1, r2, r1
	orrs r1, r0
	lsls r0, r3, 1
	adds r0, r4
	strh r1, [r0]
	adds r5, 0x2
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r8
	blt _0809A054
_0809A07A:
	movs r3, 0
	ldr r0, [sp, 0x10]
	cmp r3, r0
	bge _0809A0B4
	ldr r1, _0809A0D4 @ =0x00000fff
	mov r12, r1
	movs r6, 0xF0
	lsls r6, 8
	ldr r2, [sp, 0xC]
	asrs r4, r2, 16
_0809A08E:
	ldrh r2, [r5]
	mov r0, r12
	ands r0, r2
	ldr r1, [sp]
	adds r0, r1, r0
	adds r1, r6, 0
	ands r1, r2
	ldr r2, [sp, 0x4]
	adds r1, r2, r1
	orrs r1, r0
	lsls r0, r3, 1
	adds r0, r7
	strh r1, [r0]
	adds r5, 0x2
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r4
	blt _0809A08E
_0809A0B4:
	ldr r4, [sp, 0x18]
	ldr r7, [sp, 0x1C]
	mov r1, r10
	lsls r0, r1, 16
	lsrs r1, r0, 16
	cmp r1, 0x11
	bls _0809A036
	ldr r0, [sp, 0x14]
	asrs r2, r0, 24
	cmp r2, 0
	beq _0809A13A
	cmp r2, 0
	ble _0809A0D8
	ldr r1, [sp, 0x8]
	adds r1, 0x14
	b _0809A0DC
	.align 2, 0
_0809A0D4: .4byte 0x00000fff
_0809A0D8:
	ldr r1, [sp, 0x8]
	subs r1, 0x4
_0809A0DC:
	movs r0, 0x3F
	ands r1, r0
	adds r4, r1, 0
	adds r0, r4, 0
	cmp r0, 0x1F
	bgt _0809A0EE
	lsls r0, 1
	adds r0, 0x80
	b _0809A0F6
_0809A0EE:
	lsls r0, 1
	movs r2, 0x84
	lsls r2, 4
	adds r0, r2
_0809A0F6:
	mov r1, r9
	adds r2, r1, r0
	movs r3, 0
	movs r6, 0
_0809A0FE:
	movs r1, 0
	adds r5, r3, 0x1
	lsls r3, r4, 16
_0809A104:
	strh r6, [r2]
	adds r2, 0x40
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x11
	bls _0809A104
	asrs r0, r3, 16
	adds r4, r0, 0x1
	movs r0, 0x3F
	ands r4, r0
	adds r0, r4, 0
	cmp r0, 0x1F
	bgt _0809A126
	lsls r0, 1
	adds r0, 0x80
	b _0809A12E
_0809A126:
	lsls r0, 1
	movs r2, 0x84
	lsls r2, 4
	adds r0, r2
_0809A12E:
	mov r1, r9
	adds r2, r1, r0
	lsls r0, r5, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _0809A0FE
_0809A13A:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8099F58

	thumb_func_start sub_809A14C
sub_809A14C: @ 809A14C
	push {r4-r6,lr}
	adds r2, r0, 0
	ldr r0, _0809A174 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _0809A178 @ =0x000008b4
	adds r0, r1
	ldrh r0, [r0]
	lsrs r0, 3
	adds r3, r0, 0
	adds r3, 0x1E
	movs r0, 0x3F
	ands r3, r0
	adds r0, r3, 0
	cmp r0, 0x1F
	bgt _0809A17C
	lsls r0, 1
	movs r6, 0x98
	lsls r6, 3
	adds r0, r6
	b _0809A184
	.align 2, 0
_0809A174: .4byte gUnknown_083B6DB4
_0809A178: .4byte 0x000008b4
_0809A17C:
	lsls r0, 1
	movs r1, 0xC8
	lsls r1, 4
	adds r0, r1
_0809A184:
	adds r2, r0
	movs r0, 0
	movs r5, 0
	movs r4, 0x3F
_0809A18C:
	strh r5, [r2]
	adds r2, 0x2
	adds r3, 0x1
	ands r3, r4
	adds r1, r3, 0
	cmp r1, 0
	bne _0809A19E
	ldr r6, _0809A1B8 @ =0xfffff7c0
	adds r2, r6
_0809A19E:
	cmp r1, 0x20
	bne _0809A1A8
	movs r1, 0xF8
	lsls r1, 3
	adds r2, r1
_0809A1A8:
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2B
	bls _0809A18C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A1B8: .4byte 0xfffff7c0
	thumb_func_end sub_809A14C

	thumb_func_start sub_809A1BC
sub_809A1BC: @ 809A1BC
	push {r4-r6,lr}
	sub sp, 0x8
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _0809A228 @ =gUnknown_083B6DB8
	ldr r5, [r0]
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r4, _0809A22C @ =0x040000d4
	str r1, [r4]
	str r5, [r4, 0x4]
	movs r6, 0x80
	lsls r6, 1
	ldr r0, _0809A230 @ =0x81000100
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _0809A234 @ =gWindowConfig_81E6D38
	adds r1, r5, 0
	str r3, [sp, 0x4]
	bl sub_8004E3C
	str r5, [r4]
	ldr r3, [sp, 0x4]
	str r3, [r4, 0x4]
	ldr r1, _0809A238 @ =0x80000040
	str r1, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r0, r5, r6
	str r0, [r4]
	adds r0, r3, 0
	adds r0, 0x80
	str r0, [r4, 0x4]
	str r1, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r0, r5, 0
	adds r0, 0x80
	str r0, [r4]
	adds r6, r3, r6
	str r6, [r4, 0x4]
	str r1, [r4, 0x8]
	ldr r0, [r4, 0x8]
	movs r0, 0xC0
	lsls r0, 1
	adds r5, r0
	str r5, [r4]
	adds r3, r0
	str r3, [r4, 0x4]
	str r1, [r4, 0x8]
	ldr r0, [r4, 0x8]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A228: .4byte gUnknown_083B6DB8
_0809A22C: .4byte 0x040000d4
_0809A230: .4byte 0x81000100
_0809A234: .4byte gWindowConfig_81E6D38
_0809A238: .4byte 0x80000040
	thumb_func_end sub_809A1BC

	thumb_func_start sub_809A23C
sub_809A23C: @ 809A23C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0809A384 @ =gUnknown_083B6DB4
	ldr r5, [r0]
	ldr r1, _0809A388 @ =0x000008ca
	adds r7, r5, r1
	str r7, [sp, 0x18]
	mov r2, sp
	adds r2, 0x18
	str r2, [sp, 0x20]
	ldr r0, _0809A38C @ =0x00030200
	str r0, [r2, 0x4]
	mov r1, sp
	ldr r3, _0809A390 @ =0x00000ccc
	adds r0, r5, r3
	str r0, [sp]
	ldr r4, _0809A394 @ =0x0000dac8
	strh r4, [r1, 0x4]
	str r0, [sp, 0x8]
	ldr r6, _0809A398 @ =0xffffdac9
	strh r6, [r1, 0xC]
	add r0, sp, 0x10
	movs r1, 0
	movs r2, 0x8
	bl memset
	ldr r0, _0809A39C @ =gPokemonStorage
	mov r9, r0
	ldr r0, _0809A3A0 @ =0x000083c2
	add r0, r9
	add r0, r8
	ldrb r1, [r0]
	ldr r2, _0809A3A4 @ =gUnknown_083BB0A8
	lsls r1, 2
	adds r0, r1, r2
	ldrh r3, [r0]
	ldr r6, _0809A3A8 @ =0x00000ce8
	adds r0, r5, r6
	strh r3, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrh r1, [r1]
	ldr r2, _0809A3AC @ =0x00000cea
	adds r0, r5, r2
	strh r1, [r0]
	mov r0, sp
	bl LoadSpritePalettes
	ldr r3, _0809A3B0 @ =0x00000d08
	adds r6, r5, r3
	movs r0, 0xFC
	lsls r0, 2
	str r0, [r6]
	adds r0, r4, 0
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	movs r2, 0x87
	lsls r2, 1
	mov r10, r2
	add r1, r10
	ldr r3, _0809A3B4 @ =0x00000cec
	adds r2, r5, r3
	strh r1, [r2]
	movs r4, 0x80
	lsls r4, 9
	adds r1, r4, 0
	lsls r1, r0
	ldr r0, [r6]
	orrs r0, r1
	str r0, [r6]
	ldr r0, _0809A3B8 @ =0x0000dac9
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	add r1, r10
	ldr r2, _0809A3BC @ =0x00000cee
	adds r5, r2
	strh r1, [r5]
	lsls r4, r0
	ldr r0, [r6]
	orrs r0, r4
	str r0, [r6]
	mov r3, r8
	lsls r4, r3, 3
	add r4, r8
	ldr r6, _0809A3C0 @ =0x00008344
	add r9, r6
	add r4, r9
	adds r0, r7, 0
	adds r1, r4, 0
	bl sub_809A1BC
	ldr r0, [sp, 0x20]
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl sub_8072CA4
	lsls r0, 24
	lsrs r0, 24
	bl sub_809A6D0
	movs r4, 0
	lsls r0, 16
	asrs r6, r0, 16
_0809A328:
	lsls r1, r4, 5
	adds r1, r6, r1
	lsls r1, 16
	asrs r1, 16
	ldr r0, _0809A3C4 @ =gSpriteTemplate_83BB2B8
	movs r2, 0x1C
	movs r3, 0x17
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _0809A384 @ =gUnknown_083B6DB4
	ldr r5, [r0]
	lsls r0, r4, 2
	movs r3, 0xCF
	lsls r3, 4
	adds r2, r5, r3
	adds r2, r0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809A3C8 @ =gSprites
	adds r0, r1
	str r0, [r2]
	lsls r1, r4, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _0809A328
	ldr r6, _0809A3CC @ =0x00000cca
	adds r1, r5, r6
	movs r0, 0
	strb r0, [r1]
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A384: .4byte gUnknown_083B6DB4
_0809A388: .4byte 0x000008ca
_0809A38C: .4byte 0x00030200
_0809A390: .4byte 0x00000ccc
_0809A394: .4byte 0x0000dac8
_0809A398: .4byte 0xffffdac9
_0809A39C: .4byte gPokemonStorage
_0809A3A0: .4byte 0x000083c2
_0809A3A4: .4byte gUnknown_083BB0A8
_0809A3A8: .4byte 0x00000ce8
_0809A3AC: .4byte 0x00000cea
_0809A3B0: .4byte 0x00000d08
_0809A3B4: .4byte 0x00000cec
_0809A3B8: .4byte 0x0000dac9
_0809A3BC: .4byte 0x00000cee
_0809A3C0: .4byte 0x00008344
_0809A3C4: .4byte gSpriteTemplate_83BB2B8
_0809A3C8: .4byte gSprites
_0809A3CC: .4byte 0x00000cca
	thumb_func_end sub_809A23C

	thumb_func_start sub_809A3D0
sub_809A3D0: @ 809A3D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x28]
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	ldr r3, _0809A43C @ =gUnknown_083B6DB4
	ldr r5, [r3]
	ldr r1, _0809A440 @ =0x000008ca
	adds r0, r5, r1
	str r0, [sp, 0x18]
	add r2, sp, 0x18
	ldr r4, _0809A444 @ =0x0000ffff
	mov r9, r4
	movs r6, 0xC0
	lsls r6, 10
	mov r8, r6
	ldr r0, _0809A448 @ =0x00030200
	str r0, [r2, 0x4]
	mov r1, sp
	ldr r0, _0809A44C @ =gSpriteTemplate_83BB2B8
	ldm r0!, {r4,r6,r7}
	stm r1!, {r4,r6,r7}
	ldm r0!, {r4,r6,r7}
	stm r1!, {r4,r6,r7}
	movs r1, 0
	ldr r7, _0809A450 @ =0x00000cca
	adds r4, r5, r7
	ldrb r0, [r4]
	adds r6, r2, 0
	cmp r0, 0
	bne _0809A41E
	movs r1, 0x1
_0809A41E:
	strb r1, [r4]
	cmp r1, 0
	bne _0809A458
	ldr r0, [r6, 0x4]
	mov r1, r9
	ands r0, r1
	mov r4, r8
	orrs r0, r4
	str r0, [r6, 0x4]
	ldr r7, _0809A454 @ =0x00000cec
	adds r0, r5, r7
	ldrh r0, [r0]
	mov r8, r0
	b _0809A478
	.align 2, 0
_0809A43C: .4byte gUnknown_083B6DB4
_0809A440: .4byte 0x000008ca
_0809A444: .4byte 0x0000ffff
_0809A448: .4byte 0x00030200
_0809A44C: .4byte gSpriteTemplate_83BB2B8
_0809A450: .4byte 0x00000cca
_0809A454: .4byte 0x00000cec
_0809A458:
	ldr r0, [r6, 0x4]
	mov r1, r9
	ands r0, r1
	movs r1, 0x80
	lsls r1, 11
	orrs r0, r1
	str r0, [r6, 0x4]
	ldr r4, _0809A570 @ =0x00000cec
	adds r0, r5, r4
	ldrh r0, [r0]
	mov r8, r0
	mov r1, sp
	movs r0, 0x4
	strh r0, [r1]
	ldr r0, _0809A574 @ =0x0000dac9
	strh r0, [r1, 0x2]
_0809A478:
	ldr r0, [r3]
	ldr r7, _0809A578 @ =0x000008ca
	adds r0, r7
	ldr r1, [sp, 0x28]
	lsls r5, r1, 3
	adds r5, r1
	ldr r4, _0809A57C @ =gPokemonStorage + 0x8344
	adds r5, r4
	adds r1, r5, 0
	bl sub_809A1BC
	adds r0, r6, 0
	bl LoadSpriteSheet
	adds r4, 0x7E
	ldr r3, [sp, 0x28]
	adds r4, r3, r4
	ldrb r0, [r4]
	lsls r0, 2
	ldr r1, _0809A580 @ =gUnknown_083BB0A8
	adds r0, r1
	mov r1, r8
	movs r2, 0x4
	bl LoadPalette
	adds r0, r5, 0
	bl sub_8072CA4
	lsls r0, 24
	lsrs r0, 24
	bl sub_809A6D0
	lsls r0, 16
	mov r4, r10
	lsls r2, r4, 24
	asrs r2, 24
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 6
	lsrs r6, r0, 16
	str r6, [sp, 0x20]
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x24]
	movs r7, 0
	negs r2, r2
	mov r9, r2
	movs r0, 0x1
	mov r10, r0
_0809A4DE:
	lsls r1, r7, 5
	mov r8, r1
	ldr r3, [sp, 0x24]
	lsls r1, r3, 16
	asrs r1, 16
	add r1, r8
	lsls r1, 16
	asrs r1, 16
	mov r0, sp
	movs r2, 0x1C
	movs r3, 0x17
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0809A584 @ =gUnknown_083B6DB4
	ldr r4, [r1]
	lsls r6, r7, 2
	ldr r1, _0809A588 @ =0x00000cf8
	adds r2, r4, r1
	adds r2, r6
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0809A58C @ =gSprites
	adds r1, r0
	str r1, [r2]
	mov r3, r9
	lsls r5, r3, 1
	add r5, r9
	lsls r5, 1
	strh r5, [r1, 0x2E]
	ldr r1, [r2]
	ldr r3, [sp, 0x20]
	lsls r0, r3, 16
	asrs r0, 16
	add r0, r8
	strh r0, [r1, 0x30]
	ldr r0, [r2]
	mov r1, r10
	strh r1, [r0, 0x32]
	ldr r0, [r2]
	ldr r1, _0809A590 @ =sub_809A5E8
	str r1, [r0, 0x1C]
	lsls r1, r7, 24
	lsrs r1, 24
	bl StartSpriteAnim
	movs r3, 0xCF
	lsls r3, 4
	adds r4, r3
	adds r4, r6
	ldr r0, [r4]
	strh r5, [r0, 0x2E]
	ldr r0, [r4]
	mov r6, r10
	strh r6, [r0, 0x30]
	ldr r1, [r4]
	ldr r0, _0809A594 @ =sub_809A61C
	str r0, [r1, 0x1C]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x1
	bls _0809A4DE
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A570: .4byte 0x00000cec
_0809A574: .4byte 0x0000dac9
_0809A578: .4byte 0x000008ca
_0809A57C: .4byte gPokemonStorage + 0x8344
_0809A580: .4byte gUnknown_083BB0A8
_0809A584: .4byte gUnknown_083B6DB4
_0809A588: .4byte 0x00000cf8
_0809A58C: .4byte gSprites
_0809A590: .4byte sub_809A5E8
_0809A594: .4byte sub_809A61C
	thumb_func_end sub_809A3D0

	thumb_func_start sub_809A598
sub_809A598: @ 809A598
	push {lr}
	ldr r0, _0809A5B0 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _0809A5B4 @ =0x00000cca
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809A5B8
	movs r0, 0x4
	bl FreeSpriteTilesByTag
	b _0809A5BE
	.align 2, 0
_0809A5B0: .4byte gUnknown_083B6DB4
_0809A5B4: .4byte 0x00000cca
_0809A5B8:
	movs r0, 0x3
	bl FreeSpriteTilesByTag
_0809A5BE:
	ldr r0, _0809A5E0 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	movs r3, 0xCF
	lsls r3, 4
	adds r2, r0, r3
	adds r3, 0x8
	adds r1, r0, r3
	ldr r1, [r1]
	str r1, [r2]
	ldr r2, _0809A5E4 @ =0x00000cf4
	adds r1, r0, r2
	adds r3, 0x4
	adds r0, r3
	ldr r0, [r0]
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0809A5E0: .4byte gUnknown_083B6DB4
_0809A5E4: .4byte 0x00000cf4
	thumb_func_end sub_809A598

	thumb_func_start sub_809A5E8
sub_809A5E8: @ 809A5E8
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x32]
	movs r3, 0x32
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _0809A5FC
	subs r0, r1, 0x1
	strh r0, [r2, 0x32]
	b _0809A614
_0809A5FC:
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x30
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bne _0809A614
	ldr r0, _0809A618 @ =SpriteCallbackDummy
	str r0, [r2, 0x1C]
_0809A614:
	pop {r0}
	bx r0
	.align 2, 0
_0809A618: .4byte SpriteCallbackDummy
	thumb_func_end sub_809A5E8

	thumb_func_start sub_809A61C
sub_809A61C: @ 809A61C
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x30]
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _0809A630
	subs r0, r1, 0x1
	strh r0, [r2, 0x30]
	b _0809A64E
_0809A630:
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x32]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xC0
	bls _0809A64E
	adds r0, r2, 0
	bl DestroySprite
_0809A64E:
	pop {r0}
	bx r0
	thumb_func_end sub_809A61C

	thumb_func_start sub_809A654
sub_809A654: @ 809A654
	push {lr}
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0809A690 @ =gPokemonStorage
	ldr r2, _0809A694 @ =0x000083c2
	adds r1, r2
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, _0809A698 @ =gUnknown_083B6DB4
	ldr r2, [r0]
	ldr r3, _0809A69C @ =0x00000cca
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809A6A8
	lsls r0, r1, 2
	ldr r1, _0809A6A0 @ =gUnknown_083BB0A8
	adds r0, r1
	adds r3, 0x22
	adds r1, r2, r3
	ldrh r1, [r1]
	lsls r1, 1
	ldr r2, _0809A6A4 @ =gPlttBufferUnfaded
	adds r1, r2
	movs r2, 0x2
	bl CpuSet
	b _0809A6C0
	.align 2, 0
_0809A690: .4byte gPokemonStorage
_0809A694: .4byte 0x000083c2
_0809A698: .4byte gUnknown_083B6DB4
_0809A69C: .4byte 0x00000cca
_0809A6A0: .4byte gUnknown_083BB0A8
_0809A6A4: .4byte gPlttBufferUnfaded
_0809A6A8:
	lsls r0, r1, 2
	ldr r1, _0809A6C4 @ =gUnknown_083BB0A8
	adds r0, r1
	ldr r3, _0809A6C8 @ =0x00000cee
	adds r1, r2, r3
	ldrh r1, [r1]
	lsls r1, 1
	ldr r2, _0809A6CC @ =gPlttBufferUnfaded
	adds r1, r2
	movs r2, 0x2
	bl CpuSet
_0809A6C0:
	pop {r0}
	bx r0
	.align 2, 0
_0809A6C4: .4byte gUnknown_083BB0A8
_0809A6C8: .4byte 0x00000cee
_0809A6CC: .4byte gPlttBufferUnfaded
	thumb_func_end sub_809A654

	thumb_func_start sub_809A6D0
sub_809A6D0: @ 809A6D0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	movs r0, 0xB0
	subs r0, r1
	bx lr
	thumb_func_end sub_809A6D0

	thumb_func_start sub_809A6DC
sub_809A6DC: @ 809A6DC
	push {r4,r5,lr}
	ldr r0, _0809A760 @ =gUnknown_083BB288
	bl LoadSpriteSheet
	ldr r0, _0809A764 @ =gUnknown_083BB290
	bl LoadSpritePalette
	movs r5, 0
_0809A6EC:
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 19
	movs r0, 0xB8
	lsls r0, 15
	adds r1, r0
	asrs r1, 16
	ldr r0, _0809A768 @ =gSpriteTemplate_83BB2F0
	movs r2, 0x1C
	movs r3, 0x15
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0809A73E
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809A76C @ =gSprites
	adds r4, r0, r1
	lsls r1, r5, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	movs r0, 0x1
	cmp r5, 0
	bne _0809A72C
	movs r1, 0x1
	negs r1, r1
	adds r0, r1, 0
_0809A72C:
	strh r0, [r4, 0x34]
	ldr r0, _0809A770 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	lsls r1, r5, 2
	movs r2, 0xD0
	lsls r2, 4
	adds r0, r2
	adds r0, r1
	str r4, [r0]
_0809A73E:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _0809A6EC
	bl sub_809BF2C
	lsls r0, 24
	cmp r0, 0
	beq _0809A758
	movs r0, 0x1
	bl sub_809A860
_0809A758:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809A760: .4byte gUnknown_083BB288
_0809A764: .4byte gUnknown_083BB290
_0809A768: .4byte gSpriteTemplate_83BB2F0
_0809A76C: .4byte gSprites
_0809A770: .4byte gUnknown_083B6DB4
	thumb_func_end sub_809A6DC

	thumb_func_start sub_809A774
sub_809A774: @ 809A774
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r2, 0
	ldr r7, _0809A7C4 @ =gUnknown_083B6DB4
	ldr r0, [r7]
	movs r1, 0xD0
	lsls r1, 4
	adds r3, r0, r1
	movs r5, 0
	movs r4, 0x2
_0809A78A:
	lsls r1, r2, 2
	adds r1, r3, r1
	ldr r0, [r1]
	strh r5, [r0, 0x24]
	ldr r0, [r1]
	strh r4, [r0, 0x2E]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1
	bls _0809A78A
	lsls r0, r6, 24
	cmp r0, 0
	bge _0809A7CC
	ldr r1, [r7]
	movs r2, 0xD0
	lsls r2, 4
	adds r3, r1, r2
	ldr r2, [r3]
	movs r0, 0x1D
	strh r0, [r2, 0x30]
	ldr r0, _0809A7C8 @ =0x00000d04
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x5
	strh r0, [r2, 0x30]
	ldr r0, [r3]
	movs r2, 0x48
	b _0809A7E8
	.align 2, 0
_0809A7C4: .4byte gUnknown_083B6DB4
_0809A7C8: .4byte 0x00000d04
_0809A7CC:
	ldr r1, [r7]
	movs r2, 0xD0
	lsls r2, 4
	adds r3, r1, r2
	ldr r2, [r3]
	movs r0, 0x5
	strh r0, [r2, 0x30]
	ldr r0, _0809A80C @ =0x00000d04
	adds r1, r0
	ldr r2, [r1]
	movs r0, 0x1D
	strh r0, [r2, 0x30]
	ldr r0, [r3]
	movs r2, 0xF8
_0809A7E8:
	strh r2, [r0, 0x32]
	ldr r0, [r1]
	strh r2, [r0, 0x32]
	ldr r1, [r7]
	movs r2, 0xD0
	lsls r2, 4
	adds r0, r1, r2
	ldr r2, [r0]
	movs r0, 0
	strh r0, [r2, 0x3C]
	ldr r0, _0809A80C @ =0x00000d04
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x1
	strh r0, [r1, 0x3C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A80C: .4byte 0x00000d04
	thumb_func_end sub_809A774

	thumb_func_start sub_809A810
sub_809A810: @ 809A810
	push {r4-r6,lr}
	movs r3, 0
	ldr r0, _0809A85C @ =gUnknown_083B6DB4
	ldr r0, [r0]
	movs r1, 0xD0
	lsls r1, 4
	adds r4, r0, r1
	movs r5, 0
	movs r6, 0x5
	negs r6, r6
_0809A824:
	lsls r1, r3, 2
	adds r1, r4, r1
	ldr r2, [r1]
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 3
	adds r0, 0x5C
	strh r0, [r2, 0x20]
	ldr r0, [r1]
	strh r5, [r0, 0x24]
	ldr r1, [r1]
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x1
	bls _0809A824
	movs r0, 0x1
	bl sub_809A860
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A85C: .4byte gUnknown_083B6DB4
	thumb_func_end sub_809A810

	thumb_func_start sub_809A860
sub_809A860: @ 809A860
	push {r4,r5,lr}
	lsls r0, 24
	cmp r0, 0
	beq _0809A89C
	movs r2, 0
	ldr r0, _0809A898 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	movs r1, 0xD0
	lsls r1, 4
	adds r4, r0, r1
	movs r3, 0
	movs r5, 0x1
_0809A878:
	lsls r1, r2, 2
	adds r1, r4, r1
	ldr r0, [r1]
	strh r5, [r0, 0x2E]
	ldr r0, [r1]
	strh r3, [r0, 0x30]
	ldr r0, [r1]
	strh r3, [r0, 0x32]
	ldr r0, [r1]
	strh r3, [r0, 0x36]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1
	bls _0809A878
	b _0809A8BC
	.align 2, 0
_0809A898: .4byte gUnknown_083B6DB4
_0809A89C:
	movs r2, 0
	ldr r0, _0809A8C4 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	movs r3, 0xD0
	lsls r3, 4
	adds r1, r0, r3
	movs r3, 0
_0809A8AA:
	lsls r0, r2, 2
	adds r0, r1, r0
	ldr r0, [r0]
	strh r3, [r0, 0x2E]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x1
	bls _0809A8AA
_0809A8BC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809A8C4: .4byte gUnknown_083B6DB4
	thumb_func_end sub_809A860

	thumb_func_start sub_809A8C8
sub_809A8C8: @ 809A8C8
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x4
	bhi _0809A994
	lsls r0, 2
	ldr r1, _0809A8E0 @ =_0809A8E4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809A8E0: .4byte _0809A8E4
	.align 2, 0
_0809A8E4:
	.4byte _0809A8F8
	.4byte _0809A8FE
	.4byte _0809A92C
	.4byte _0809A932
	.4byte _0809A984
_0809A8F8:
	movs r0, 0
	strh r0, [r2, 0x24]
	b _0809A994
_0809A8FE:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _0809A994
	strh r1, [r2, 0x30]
	ldrh r0, [r2, 0x34]
	ldrh r3, [r2, 0x24]
	adds r0, r3
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _0809A994
	strh r1, [r2, 0x32]
	strh r1, [r2, 0x24]
	b _0809A994
_0809A92C:
	movs r0, 0x3
	strh r0, [r2, 0x2E]
	b _0809A994
_0809A932:
	ldr r0, _0809A97C @ =gUnknown_083B6DB4
	ldr r1, [r0]
	ldr r0, _0809A980 @ =0x000008b6
	adds r1, r0
	ldrh r0, [r2, 0x20]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r2, 0x20]
	subs r0, 0x49
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAE
	bls _0809A958
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
_0809A958:
	ldrh r0, [r2, 0x30]
	subs r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _0809A994
	ldrh r0, [r2, 0x32]
	strh r0, [r2, 0x20]
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	movs r0, 0x4
	strh r0, [r2, 0x2E]
	b _0809A994
	.align 2, 0
_0809A97C: .4byte gUnknown_083B6DB4
_0809A980: .4byte 0x000008b6
_0809A984:
	ldr r0, _0809A998 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _0809A99C @ =0x000008b6
	adds r0, r1
	ldrh r1, [r2, 0x20]
	ldrh r0, [r0]
	subs r1, r0
	strh r1, [r2, 0x20]
_0809A994:
	pop {r0}
	bx r0
	.align 2, 0
_0809A998: .4byte gUnknown_083B6DB4
_0809A99C: .4byte 0x000008b6
	thumb_func_end sub_809A8C8

	thumb_func_start sub_809A9A0
sub_809A9A0: @ 809A9A0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r4, [sp, 0x18]
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0809AA0C @ =gSpriteTemplate_83BB2F0
	lsls r5, 16
	asrs r5, 16
	lsls r6, 16
	asrs r6, 16
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r4, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0809AA18
	movs r1, 0x1
	ands r1, r7
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r5, _0809AA10 @ =gSprites
	adds r6, r4, r5
	adds r0, r6, 0
	bl StartSpriteAnim
	movs r0, 0x3
	mov r1, r8
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r6, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x5]
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _0809AA14 @ =SpriteCallbackDummy
	str r0, [r4]
	adds r0, r6, 0
	b _0809AA1A
	.align 2, 0
_0809AA0C: .4byte gSpriteTemplate_83BB2F0
_0809AA10: .4byte gSprites
_0809AA14: .4byte SpriteCallbackDummy
_0809AA18:
	movs r0, 0
_0809AA1A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809A9A0

	thumb_func_start sub_809AA24
sub_809AA24: @ 809AA24
	push {lr}
	ldr r0, _0809AA38 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldrb r1, [r0, 0x5]
	cmp r1, 0x1
	beq _0809AA40
	ldr r1, _0809AA3C @ =gUnknown_020384E4
	movs r0, 0
	strb r0, [r1]
	b _0809AA44
	.align 2, 0
_0809AA38: .4byte gUnknown_083B6DB4
_0809AA3C: .4byte gUnknown_020384E4
_0809AA40:
	ldr r0, _0809AA78 @ =gUnknown_020384E4
	strb r1, [r0]
_0809AA44:
	ldr r0, _0809AA7C @ =gUnknown_020384E5
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0809AA80 @ =gUnknown_020384E6
	strb r1, [r0]
	ldr r0, _0809AA84 @ =gUnknown_020384E7
	strb r1, [r0]
	ldr r0, _0809AA88 @ =gUnknown_020384E8
	strb r1, [r0]
	ldr r0, _0809AA8C @ =gUnknown_020384E9
	strb r1, [r0]
	bl sub_809B0D4
	bl sub_809CC04
	ldr r0, _0809AA90 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _0809AA94 @ =0x000011e2
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	bl sub_809BF74
	pop {r0}
	bx r0
	.align 2, 0
_0809AA78: .4byte gUnknown_020384E4
_0809AA7C: .4byte gUnknown_020384E5
_0809AA80: .4byte gUnknown_020384E6
_0809AA84: .4byte gUnknown_020384E7
_0809AA88: .4byte gUnknown_020384E8
_0809AA8C: .4byte gUnknown_020384E9
_0809AA90: .4byte gUnknown_083B6DB4
_0809AA94: .4byte 0x000011e2
	thumb_func_end sub_809AA24

	thumb_func_start sub_809AA98
sub_809AA98: @ 809AA98
	push {lr}
	bl sub_809CC04
	bl sub_809C028
	ldr r0, _0809AAC0 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _0809AAC4 @ =0x000011e2
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _0809AAC8 @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809AABA
	bl sub_8098BF0
_0809AABA:
	pop {r0}
	bx r0
	.align 2, 0
_0809AAC0: .4byte gUnknown_083B6DB4
_0809AAC4: .4byte 0x000011e2
_0809AAC8: .4byte gUnknown_020384E6
	thumb_func_end sub_809AA98

	thumb_func_start sub_809AACC
sub_809AACC: @ 809AACC
	push {r4-r6,lr}
	adds r4, r2, 0
	adds r6, r3, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r0, 0x4
	bhi _0809AB84
	lsls r0, 2
	ldr r1, _0809AAE8 @ =_0809AAEC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809AAE8: .4byte _0809AAEC
	.align 2, 0
_0809AAEC:
	.4byte _0809AB00
	.4byte _0809AB2E
	.4byte _0809AB56
	.4byte _0809AB5E
	.4byte _0809AB7C
_0809AB00:
	adds r0, r5, 0
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, 0x64
	strh r1, [r4]
	adds r0, r5, 0
	movs r1, 0x6
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, 0x20
	strh r1, [r6]
	b _0809AB84
_0809AB2E:
	cmp r5, 0
	bne _0809AB3A
	movs r0, 0x68
	strh r0, [r4]
	movs r0, 0x34
	b _0809AB82
_0809AB3A:
	cmp r5, 0x6
	bne _0809AB46
	movs r0, 0x98
	strh r0, [r4]
	movs r0, 0x84
	b _0809AB82
_0809AB46:
	movs r0, 0x98
	strh r0, [r4]
	subs r1, r5, 0x1
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, 0x4
	b _0809AB82
_0809AB56:
	movs r0, 0xA2
	strh r0, [r4]
	movs r0, 0xC
	b _0809AB82
_0809AB5E:
	ldr r0, _0809AB78 @ =gUnknown_020384E6
	ldrb r0, [r0]
	movs r1, 0xE
	cmp r0, 0
	beq _0809AB6A
	movs r1, 0x8
_0809AB6A:
	strh r1, [r6]
	movs r0, 0x58
	muls r0, r5
	adds r0, 0x78
	strh r0, [r4]
	b _0809AB84
	.align 2, 0
_0809AB78: .4byte gUnknown_020384E6
_0809AB7C:
	movs r0, 0xA0
	strh r0, [r4]
	movs r0, 0x60
_0809AB82:
	strh r0, [r6]
_0809AB84:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_809AACC

	thumb_func_start sub_809AB8C
sub_809AB8C: @ 809AB8C
	push {lr}
	ldr r0, _0809ABB4 @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _0809ABC0
	cmp r0, 0x1
	bne _0809ABF8
	ldr r0, _0809ABB8 @ =gUnknown_020384E5
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0809ABBC @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	b _0809ABEA
	.align 2, 0
_0809ABB4: .4byte gUnknown_020384E4
_0809ABB8: .4byte gUnknown_020384E5
_0809ABBC: .4byte gPlayerParty
_0809ABC0:
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldr r1, _0809ABF0 @ =gUnknown_020384E5
	movs r2, 0
	ldrsb r2, [r1, r2]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	ldr r2, _0809ABF4 @ =gPokemonStorage + 0x4
	adds r1, r2
	adds r0, r1
	movs r1, 0xB
	bl GetBoxMonData
_0809ABEA:
	lsls r0, 16
	lsrs r0, 16
	b _0809ABFA
	.align 2, 0
_0809ABF0: .4byte gUnknown_020384E5
_0809ABF4: .4byte gPokemonStorage + 0x4
_0809ABF8:
	movs r0, 0
_0809ABFA:
	pop {r1}
	bx r1
	thumb_func_end sub_809AB8C

	thumb_func_start sub_809AC00
sub_809AC00: @ 809AC00
	push {r4-r6,lr}
	ldr r0, _0809AC14 @ =gUnknown_083B6DB4
	ldr r4, [r0]
	ldr r0, _0809AC18 @ =0x000011dc
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _0809AC1C
	movs r0, 0
	b _0809AD2C
	.align 2, 0
_0809AC14: .4byte gUnknown_083B6DB4
_0809AC18: .4byte 0x000011dc
_0809AC1C:
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _0809AD0C
	ldr r1, _0809ACF4 @ =0x000011c8
	adds r3, r4, r1
	ldr r2, _0809ACF8 @ =0x000011d0
	adds r1, r4, r2
	ldr r0, [r3]
	ldr r1, [r1]
	adds r0, r1
	str r0, [r3]
	ldr r6, _0809ACFC @ =0x000011cc
	adds r2, r4, r6
	ldr r0, _0809AD00 @ =0x000011d4
	adds r1, r4, r0
	ldr r0, [r2]
	ldr r1, [r1]
	adds r0, r1
	str r0, [r2]
	movs r1, 0x8E
	lsls r1, 5
	adds r5, r4, r1
	ldr r1, [r5]
	ldr r0, [r3]
	asrs r0, 8
	strh r0, [r1, 0x20]
	ldr r1, [r5]
	ldr r0, [r2]
	asrs r0, 8
	strh r0, [r1, 0x22]
	ldr r1, [r5]
	ldrh r2, [r1, 0x20]
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	movs r3, 0x80
	lsls r3, 1
	cmp r0, r3
	ble _0809AC78
	ldr r6, _0809AD04 @ =0xffffff00
	adds r0, r2, r6
	lsls r0, 16
	asrs r0, 16
	adds r0, 0x40
	strh r0, [r1, 0x20]
_0809AC78:
	ldr r1, [r5]
	ldrh r2, [r1, 0x20]
	movs r6, 0x20
	ldrsh r0, [r1, r6]
	cmp r0, 0x3F
	bgt _0809AC90
	movs r0, 0x40
	subs r0, r2
	lsls r0, 16
	asrs r0, 16
	subs r0, r3, r0
	strh r0, [r1, 0x20]
_0809AC90:
	ldr r1, [r5]
	ldrh r2, [r1, 0x22]
	movs r3, 0x22
	ldrsh r0, [r1, r3]
	cmp r0, 0xB0
	ble _0809ACA8
	adds r0, r2, 0
	subs r0, 0xB0
	lsls r0, 16
	asrs r0, 16
	subs r0, 0x10
	strh r0, [r1, 0x22]
_0809ACA8:
	ldr r2, [r5]
	ldrh r3, [r2, 0x22]
	movs r6, 0x22
	ldrsh r0, [r2, r6]
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _0809ACC4
	subs r0, r1, r3
	movs r1, 0xB0
	lsls r0, 16
	asrs r0, 16
	subs r1, r0
	strh r1, [r2, 0x22]
_0809ACC4:
	ldr r0, _0809AD08 @ =0x000011e3
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0809AD2A
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _0809AD2A
	ldr r2, [r5]
	adds r2, 0x3F
	ldrb r3, [r2]
	lsrs r1, r3, 1
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 1
	movs r0, 0x3
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	b _0809AD2A
	.align 2, 0
_0809ACF4: .4byte 0x000011c8
_0809ACF8: .4byte 0x000011d0
_0809ACFC: .4byte 0x000011cc
_0809AD00: .4byte 0x000011d4
_0809AD04: .4byte 0xffffff00
_0809AD08: .4byte 0x000011e3
_0809AD0C:
	movs r1, 0x8E
	lsls r1, 5
	adds r2, r4, r1
	ldr r1, [r2]
	ldr r3, _0809AD34 @ =0x000011d8
	adds r0, r4, r3
	ldrh r0, [r0]
	strh r0, [r1, 0x20]
	ldr r1, [r2]
	ldr r6, _0809AD38 @ =0x000011da
	adds r0, r4, r6
	ldrh r0, [r0]
	strh r0, [r1, 0x22]
	bl sub_809AFB8
_0809AD2A:
	movs r0, 0x1
_0809AD2C:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809AD34: .4byte 0x000011d8
_0809AD38: .4byte 0x000011da
	thumb_func_end sub_809AC00

	thumb_func_start sub_809AD3C
sub_809AD3C: @ 809AD3C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r6, sp
	adds r6, 0x2
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	adds r3, r6, 0
	bl sub_809AACC
	ldr r0, _0809AD88 @ =gUnknown_083B6DB4
	ldr r1, [r0]
	movs r2, 0x8F
	lsls r2, 5
	adds r0, r1, r2
	strb r4, [r0]
	ldr r3, _0809AD8C @ =0x000011e1
	adds r0, r1, r3
	strb r5, [r0]
	mov r0, sp
	ldrh r2, [r0]
	subs r3, 0x9
	adds r0, r1, r3
	strh r2, [r0]
	ldrh r0, [r6]
	ldr r2, _0809AD90 @ =0x000011da
	adds r1, r2
	strh r0, [r1]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809AD88: .4byte gUnknown_083B6DB4
_0809AD8C: .4byte 0x000011e1
_0809AD90: .4byte 0x000011da
	thumb_func_end sub_809AD3C

	thumb_func_start sub_809AD94
sub_809AD94: @ 809AD94
	push {r4-r7,lr}
	ldr r0, _0809ADB0 @ =gUnknown_083B6DB4
	ldr r2, [r0]
	ldr r3, _0809ADB4 @ =0x000011de
	adds r1, r2, r3
	ldrh r1, [r1]
	adds r4, r0, 0
	cmp r1, 0
	beq _0809ADBC
	ldr r0, _0809ADB8 @ =0x000011dc
	adds r1, r2, r0
	movs r0, 0xC
	b _0809ADC2
	.align 2, 0
_0809ADB0: .4byte gUnknown_083B6DB4
_0809ADB4: .4byte 0x000011de
_0809ADB8: .4byte 0x000011dc
_0809ADBC:
	ldr r3, _0809AE04 @ =0x000011dc
	adds r1, r2, r3
	movs r0, 0x6
_0809ADC2:
	strh r0, [r1]
	ldr r2, [r4]
	ldr r0, _0809AE08 @ =0x000011e3
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0809ADDA
	ldr r3, _0809AE04 @ =0x000011dc
	adds r0, r2, r3
	ldrh r0, [r0]
	lsrs r0, 1
	strb r0, [r1]
_0809ADDA:
	ldr r1, _0809AE0C @ =0x000011de
	adds r0, r2, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0809AE14
	cmp r1, 0x1
	beq _0809AE30
	ldr r3, _0809AE10 @ =0x000011da
	adds r0, r2, r3
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x8E
	lsls r3, 5
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x22
	ldrsh r0, [r0, r2]
	b _0809AE46
	.align 2, 0
_0809AE04: .4byte 0x000011dc
_0809AE08: .4byte 0x000011e3
_0809AE0C: .4byte 0x000011de
_0809AE10: .4byte 0x000011da
_0809AE14:
	ldr r3, _0809AE2C @ =0x000011da
	adds r0, r2, r3
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x8E
	lsls r3, 5
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x22
	ldrsh r0, [r0, r2]
	adds r0, 0xC0
	b _0809AE46
	.align 2, 0
_0809AE2C: .4byte 0x000011da
_0809AE30:
	ldr r3, _0809AE74 @ =0x000011da
	adds r0, r2, r3
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x8E
	lsls r3, 5
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x22
	ldrsh r0, [r0, r2]
	subs r0, 0xC0
_0809AE46:
	subs r7, r1, r0
	ldr r2, [r4]
	ldr r3, _0809AE78 @ =0x000011df
	adds r0, r2, r3
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0809AE80
	cmp r1, 0x1
	beq _0809AE9C
	ldr r1, _0809AE7C @ =0x000011d8
	adds r0, r2, r1
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x8E
	lsls r3, 5
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	b _0809AEB2
	.align 2, 0
_0809AE74: .4byte 0x000011da
_0809AE78: .4byte 0x000011df
_0809AE7C: .4byte 0x000011d8
_0809AE80:
	ldr r3, _0809AE98 @ =0x000011d8
	adds r0, r2, r3
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x8E
	lsls r3, 5
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	adds r0, 0xC0
	b _0809AEB2
	.align 2, 0
_0809AE98: .4byte 0x000011d8
_0809AE9C:
	ldr r3, _0809AF00 @ =0x000011d8
	adds r0, r2, r3
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x8E
	lsls r3, 5
	adds r0, r2, r3
	ldr r0, [r0]
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	subs r0, 0xC0
_0809AEB2:
	subs r0, r1, r0
	lsls r7, 8
	lsls r0, 8
	ldr r4, [r4]
	ldr r3, _0809AF04 @ =0x000011d0
	adds r6, r4, r3
	ldr r1, _0809AF08 @ =0x000011dc
	adds r5, r4, r1
	ldrh r1, [r5]
	bl __divsi3
	str r0, [r6]
	ldr r2, _0809AF0C @ =0x000011d4
	adds r6, r4, r2
	ldrh r1, [r5]
	adds r0, r7, 0
	bl __divsi3
	str r0, [r6]
	ldr r3, _0809AF10 @ =0x000011c8
	adds r2, r4, r3
	movs r0, 0x8E
	lsls r0, 5
	adds r1, r4, r0
	ldr r0, [r1]
	movs r3, 0x20
	ldrsh r0, [r0, r3]
	lsls r0, 8
	str r0, [r2]
	ldr r0, _0809AF14 @ =0x000011cc
	adds r4, r0
	ldr r0, [r1]
	movs r1, 0x22
	ldrsh r0, [r0, r1]
	lsls r0, 8
	str r0, [r4]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809AF00: .4byte 0x000011d8
_0809AF04: .4byte 0x000011d0
_0809AF08: .4byte 0x000011dc
_0809AF0C: .4byte 0x000011d4
_0809AF10: .4byte 0x000011c8
_0809AF14: .4byte 0x000011cc
	thumb_func_end sub_809AD94

	thumb_func_start sub_809AF18
sub_809AF18: @ 809AF18
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_809AD3C
	bl sub_809AD94
	ldr r0, _0809AFA4 @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809AF46
	ldr r0, _0809AFA8 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
_0809AF46:
	cmp r4, 0x1
	bne _0809AF70
	ldr r0, _0809AFAC @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	beq _0809AF70
	ldr r0, _0809AFA8 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r2, _0809AFB0 @ =0x000011e2
	adds r1, r0, r2
	strb r4, [r1]
	ldr r1, _0809AFB4 @ =0x000011c4
	adds r0, r1
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
_0809AF70:
	cmp r4, 0
	beq _0809AF9E
	cmp r4, 0
	blt _0809AF9E
	cmp r4, 0x3
	bgt _0809AF9E
	ldr r0, _0809AFA8 @ =gUnknown_083B6DB4
	ldr r2, [r0]
	ldr r0, _0809AFB4 @ =0x000011c4
	adds r2, r0
	ldr r1, [r2]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1]
	ldr r2, [r2]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, 0x5]
_0809AF9E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809AFA4: .4byte gUnknown_020384E6
_0809AFA8: .4byte gUnknown_083B6DB4
_0809AFAC: .4byte gUnknown_020384E4
_0809AFB0: .4byte 0x000011e2
_0809AFB4: .4byte 0x000011c4
	thumb_func_end sub_809AF18

	thumb_func_start sub_809AFB8
sub_809AFB8: @ 809AFB8
	push {r4,r5,lr}
	ldr r5, _0809B000 @ =gUnknown_020384E4
	ldr r0, _0809B004 @ =gUnknown_083B6DB4
	ldr r4, [r0]
	movs r1, 0x8F
	lsls r1, 5
	adds r0, r4, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r1, _0809B008 @ =gUnknown_020384E5
	ldr r2, _0809B00C @ =0x000011e1
	adds r0, r4, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0809B010 @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809AFEA
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
_0809AFEA:
	bl sub_809BF74
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0x1
	beq _0809B020
	cmp r0, 0x1
	bgt _0809B014
	cmp r0, 0
	beq _0809B034
	b _0809B05E
	.align 2, 0
_0809B000: .4byte gUnknown_020384E4
_0809B004: .4byte gUnknown_083B6DB4
_0809B008: .4byte gUnknown_020384E5
_0809B00C: .4byte 0x000011e1
_0809B010: .4byte gUnknown_020384E6
_0809B014:
	cmp r0, 0x2
	bne _0809B05E
	movs r0, 0x1
	bl sub_809A860
	b _0809B05E
_0809B020:
	ldr r2, _0809B030 @ =0x000011c4
	adds r0, r4, r2
	ldr r0, [r0]
	adds r0, 0x43
	movs r1, 0xC
	strb r1, [r0]
	b _0809B05E
	.align 2, 0
_0809B030: .4byte 0x000011c4
_0809B034:
	ldr r0, _0809B064 @ =0x000011c4
	adds r2, r4, r0
	ldr r3, [r2]
	ldrb r1, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldr r0, [r2]
	adds r0, 0x43
	movs r1, 0x14
	strb r1, [r0]
	ldr r1, [r2]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_0809B05E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809B064: .4byte 0x000011c4
	thumb_func_end sub_809AFB8

	thumb_func_start sub_809B068
sub_809B068: @ 809B068
	push {lr}
	ldr r0, _0809B078 @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809B07C
	movs r3, 0
	b _0809B08A
	.align 2, 0
_0809B078: .4byte gUnknown_020384E6
_0809B07C:
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x5
	bls _0809B08A
	movs r3, 0x5
_0809B08A:
	ldr r0, _0809B0B8 @ =gUnknown_083B6DB4
	ldr r2, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r2, r1
	ldr r0, [r0]
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809B0AA
	ldr r0, _0809B0BC @ =0x000011e3
	adds r1, r2, r0
	movs r0, 0x1
	strb r0, [r1]
_0809B0AA:
	movs r0, 0x1
	adds r1, r3, 0
	bl sub_809AF18
	pop {r0}
	bx r0
	.align 2, 0
_0809B0B8: .4byte gUnknown_083B6DB4
_0809B0BC: .4byte 0x000011e3
	thumb_func_end sub_809B068

	thumb_func_start sub_809B0C0
sub_809B0C0: @ 809B0C0
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_809AF18
	pop {r0}
	bx r0
	thumb_func_end sub_809B0C0

	thumb_func_start sub_809B0D4
sub_809B0D4: @ 809B0D4
	ldr r1, _0809B0DC @ =gUnknown_020384EA
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0809B0DC: .4byte gUnknown_020384EA
	thumb_func_end sub_809B0D4

	thumb_func_start sub_809B0E0
sub_809B0E0: @ 809B0E0
	ldr r0, _0809B0EC @ =gUnknown_020384EA
	ldr r1, _0809B0F0 @ =gUnknown_020384E5
	ldrb r1, [r1]
	strb r1, [r0]
	bx lr
	.align 2, 0
_0809B0EC: .4byte gUnknown_020384EA
_0809B0F0: .4byte gUnknown_020384E5
	thumb_func_end sub_809B0E0

	thumb_func_start sub_809B0F4
sub_809B0F4: @ 809B0F4
	ldr r0, _0809B0FC @ =gUnknown_020384EA
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0809B0FC: .4byte gUnknown_020384EA
	thumb_func_end sub_809B0F4

	thumb_func_start sub_809B100
sub_809B100: @ 809B100
	lsls r0, 24
	ldr r1, _0809B120 @ =gUnknown_083B6DB4
	ldr r1, [r1]
	ldr r2, _0809B124 @ =0x000012a4
	adds r3, r1, r2
	ldr r2, _0809B128 @ =gUnknown_083BBBC8
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _0809B12C @ =0x000012a8
	adds r1, r0
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_0809B120: .4byte gUnknown_083B6DB4
_0809B124: .4byte 0x000012a4
_0809B128: .4byte gUnknown_083BBBC8
_0809B12C: .4byte 0x000012a8
	thumb_func_end sub_809B100

	thumb_func_start sub_809B130
sub_809B130: @ 809B130
	push {lr}
	ldr r0, _0809B148 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _0809B14C @ =0x000012a4
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0809B148: .4byte gUnknown_083B6DB4
_0809B14C: .4byte 0x000012a4
	thumb_func_end sub_809B130

	thumb_func_start sub_809B150
sub_809B150: @ 809B150
	push {r4,r5,lr}
	ldr r0, _0809B16C @ =gUnknown_083B6DB4
	ldr r5, [r0]
	ldr r0, _0809B170 @ =0x000012a8
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _0809B1A0
	cmp r0, 0x1
	bgt _0809B174
	cmp r0, 0
	beq _0809B17E
	b _0809B1CE
	.align 2, 0
_0809B16C: .4byte gUnknown_083B6DB4
_0809B170: .4byte 0x000012a8
_0809B174:
	cmp r0, 0x2
	beq _0809B1BE
	cmp r0, 0x3
	beq _0809B186
	b _0809B1CE
_0809B17E:
	ldr r0, _0809B18C @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809B190
_0809B186:
	movs r0, 0
	b _0809B1D0
	.align 2, 0
_0809B18C: .4byte gUnknown_020384E6
_0809B190:
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r5, r1
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
	b _0809B1C8
_0809B1A0:
	bl sub_809B324
	lsls r0, 24
	cmp r0, 0
	bne _0809B1CE
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r5, r1
	ldr r0, [r0]
	movs r1, 0x3
	bl StartSpriteAnim
	bl sub_809B384
	b _0809B1C8
_0809B1BE:
	bl sub_809B358
	lsls r0, 24
	cmp r0, 0
	bne _0809B1CE
_0809B1C8:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_0809B1CE:
	movs r0, 0x1
_0809B1D0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809B150

	thumb_func_start sub_809B1D8
sub_809B1D8: @ 809B1D8
	push {r4,r5,lr}
	ldr r0, _0809B1F4 @ =gUnknown_083B6DB4
	ldr r4, [r0]
	ldr r0, _0809B1F8 @ =0x000012a8
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _0809B220
	cmp r0, 0x1
	bgt _0809B1FC
	cmp r0, 0
	beq _0809B202
	b _0809B244
	.align 2, 0
_0809B1F4: .4byte gUnknown_083B6DB4
_0809B1F8: .4byte 0x000012a8
_0809B1FC:
	cmp r0, 0x2
	beq _0809B240
	b _0809B244
_0809B202:
	bl sub_809B324
	lsls r0, 24
	cmp r0, 0
	bne _0809B244
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
	bl sub_809B3E0
	b _0809B238
_0809B220:
	bl sub_809B358
	lsls r0, 24
	cmp r0, 0
	bne _0809B244
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
_0809B238:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _0809B244
_0809B240:
	movs r0, 0
	b _0809B246
_0809B244:
	movs r0, 0x1
_0809B246:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809B1D8

	thumb_func_start sub_809B24C
sub_809B24C: @ 809B24C
	push {r4,r5,lr}
	ldr r0, _0809B268 @ =gUnknown_083B6DB4
	ldr r4, [r0]
	ldr r0, _0809B26C @ =0x000012a8
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _0809B2E0
	cmp r0, 0x1
	bgt _0809B270
	cmp r0, 0
	beq _0809B276
	b _0809B31C
	.align 2, 0
_0809B268: .4byte gUnknown_083B6DB4
_0809B26C: .4byte 0x000012a8
_0809B270:
	cmp r0, 0x2
	beq _0809B318
	b _0809B31C
_0809B276:
	ldr r0, _0809B290 @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _0809B298
	cmp r0, 0x1
	bne _0809B318
	ldr r2, _0809B294 @ =0x000012a9
	adds r1, r4, r2
	movs r0, 0xE
	b _0809B2A0
	.align 2, 0
_0809B290: .4byte gUnknown_020384E4
_0809B294: .4byte 0x000012a9
_0809B298:
	bl get_preferred_box
	ldr r2, _0809B2D0 @ =0x000012a9
	adds r1, r4, r2
_0809B2A0:
	strb r0, [r1]
	ldr r0, _0809B2D4 @ =gUnknown_083B6DB4
	ldr r4, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r2, _0809B2D0 @ =0x000012a9
	adds r0, r4, r2
	ldrb r0, [r0]
	ldr r1, _0809B2D8 @ =gUnknown_020384E5
	ldrb r1, [r1]
	bl sub_80996B0
	ldr r0, _0809B2DC @ =0x000012a8
	adds r4, r0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0809B31C
	.align 2, 0
_0809B2D0: .4byte 0x000012a9
_0809B2D4: .4byte gUnknown_083B6DB4
_0809B2D8: .4byte gUnknown_020384E5
_0809B2DC: .4byte 0x000012a8
_0809B2E0:
	bl sub_809971C
	lsls r0, 24
	cmp r0, 0
	bne _0809B31C
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0x3
	bl StartSpriteAnim
	ldr r2, _0809B310 @ =0x000012a9
	adds r0, r4, r2
	ldrb r0, [r0]
	ldr r1, _0809B314 @ =gUnknown_020384E5
	ldrb r1, [r1]
	bl diegohint1
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _0809B31C
	.align 2, 0
_0809B310: .4byte 0x000012a9
_0809B314: .4byte gUnknown_020384E5
_0809B318:
	movs r0, 0
	b _0809B31E
_0809B31C:
	movs r0, 0x1
_0809B31E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809B24C

	thumb_func_start sub_809B324
sub_809B324: @ 809B324
	push {lr}
	ldr r0, _0809B348 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r1
	ldr r1, [r0]
	movs r2, 0x26
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0809B33E
	cmp r0, 0x8
	beq _0809B34C
_0809B33E:
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _0809B350
	.align 2, 0
_0809B348: .4byte gUnknown_083B6DB4
_0809B34C:
	movs r0, 0
	b _0809B352
_0809B350:
	movs r0, 0x1
_0809B352:
	pop {r1}
	bx r1
	thumb_func_end sub_809B324

	thumb_func_start sub_809B358
sub_809B358: @ 809B358
	push {lr}
	ldr r0, _0809B378 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r1
	ldr r1, [r0]
	movs r2, 0x26
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0809B37C
	ldrh r0, [r1, 0x26]
	subs r0, 0x1
	strh r0, [r1, 0x26]
	movs r0, 0x1
	b _0809B37E
	.align 2, 0
_0809B378: .4byte gUnknown_083B6DB4
_0809B37C:
	movs r0, 0
_0809B37E:
	pop {r1}
	bx r1
	thumb_func_end sub_809B358

	thumb_func_start sub_809B384
sub_809B384: @ 809B384
	push {r4,lr}
	ldr r0, _0809B3AC @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _0809B3B4
	cmp r0, 0x1
	bne _0809B3D2
	ldr r4, _0809B3B0 @ =gUnknown_020384E5
	ldrb r1, [r4]
	movs r0, 0xE
	bl sub_809B44C
	ldrb r1, [r4]
	movs r0, 0
	bl sub_8099584
	b _0809B3CC
	.align 2, 0
_0809B3AC: .4byte gUnknown_020384E4
_0809B3B0: .4byte gUnknown_020384E5
_0809B3B4:
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0809B3D8 @ =gUnknown_020384E5
	ldrb r1, [r4]
	bl sub_809B44C
	ldrb r1, [r4]
	movs r0, 0x1
	bl sub_8099584
_0809B3CC:
	ldr r1, _0809B3DC @ =gUnknown_020384E6
	movs r0, 0x1
	strb r0, [r1]
_0809B3D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809B3D8: .4byte gUnknown_020384E5
_0809B3DC: .4byte gUnknown_020384E6
	thumb_func_end sub_809B384

	thumb_func_start sub_809B3E0
sub_809B3E0: @ 809B3E0
	push {r4,r5,lr}
	ldr r0, _0809B408 @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _0809B410
	cmp r0, 0x1
	bne _0809B432
	ldr r4, _0809B40C @ =gUnknown_020384E5
	ldrb r1, [r4]
	movs r0, 0xE
	bl diegohint2
	ldrb r1, [r4]
	movs r0, 0xE
	bl sub_809960C
	b _0809B42C
	.align 2, 0
_0809B408: .4byte gUnknown_020384E4
_0809B40C: .4byte gUnknown_020384E5
_0809B410:
	bl get_preferred_box
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _0809B438 @ =gUnknown_020384E5
	ldrb r1, [r5]
	adds r0, r4, 0
	bl diegohint2
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_809960C
_0809B42C:
	ldr r1, _0809B43C @ =gUnknown_020384E6
	movs r0, 0
	strb r0, [r1]
_0809B432:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809B438: .4byte gUnknown_020384E5
_0809B43C: .4byte gUnknown_020384E6
	thumb_func_end sub_809B3E0

	thumb_func_start sub_809B440
sub_809B440: @ 809B440
	push {lr}
	bl sub_809BF74
	pop {r0}
	bx r0
	thumb_func_end sub_809B440

	thumb_func_start sub_809B44C
sub_809B44C: @ 809B44C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r4, 0xE
	bne _0809B488
	ldr r0, _0809B478 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _0809B47C @ =0x000025b4
	adds r0, r1
	ldr r3, _0809B480 @ =gPlayerParty
	ldr r1, _0809B484 @ =gUnknown_020384E5
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r1, 0x64
	muls r1, r2
	adds r1, r3
	movs r2, 0x64
	bl memcpy
	b _0809B4AA
	.align 2, 0
_0809B478: .4byte gUnknown_083B6DB4
_0809B47C: .4byte 0x000025b4
_0809B480: .4byte gPlayerParty
_0809B484: .4byte gUnknown_020384E5
_0809B488:
	lsls r1, r4, 2
	adds r1, r4
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 4
	ldr r2, _0809B4C0 @ =gPokemonStorage + 0x4
	adds r1, r2
	adds r0, r1
	ldr r1, _0809B4C4 @ =gUnknown_083B6DB4
	ldr r1, [r1]
	ldr r2, _0809B4C8 @ =0x000025b4
	adds r1, r2
	bl sub_803B4B4
_0809B4AA:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_809B548
	ldr r0, _0809B4CC @ =gUnknown_020384E7
	strb r4, [r0]
	ldr r0, _0809B4D0 @ =gUnknown_020384E8
	strb r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809B4C0: .4byte gPokemonStorage + 0x4
_0809B4C4: .4byte gUnknown_083B6DB4
_0809B4C8: .4byte 0x000025b4
_0809B4CC: .4byte gUnknown_020384E7
_0809B4D0: .4byte gUnknown_020384E8
	thumb_func_end sub_809B44C

	thumb_func_start diegohint2
diegohint2: @ 809B4D4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r6, 0xE
	bne _0809B508
	ldr r1, _0809B4FC @ =gPlayerParty
	movs r0, 0x64
	muls r0, r5
	adds r0, r1
	ldr r1, _0809B500 @ =gUnknown_083B6DB4
	ldr r1, [r1]
	ldr r2, _0809B504 @ =0x000025b4
	adds r1, r2
	movs r2, 0x64
	bl memcpy
	b _0809B536
	.align 2, 0
_0809B4FC: .4byte gPlayerParty
_0809B500: .4byte gUnknown_083B6DB4
_0809B504: .4byte 0x000025b4
_0809B508:
	ldr r0, _0809B53C @ =gUnknown_083B6DB4
	ldr r4, [r0]
	ldr r0, _0809B540 @ =0x000025b4
	adds r4, r0
	adds r0, r4, 0
	bl BoxMonRestorePP
	ldr r3, _0809B544 @ =gPokemonStorage
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 4
	lsls r2, r6, 2
	adds r2, r6
	lsls r1, r2, 4
	subs r1, r2
	lsls r1, 5
	adds r0, r1
	adds r0, r3
	adds r0, 0x4
	adds r1, r4, 0
	movs r2, 0x50
	bl memcpy
_0809B536:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B53C: .4byte gUnknown_083B6DB4
_0809B540: .4byte 0x000025b4
_0809B544: .4byte gPokemonStorage
	thumb_func_end diegohint2

	thumb_func_start sub_809B548
sub_809B548: @ 809B548
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	cmp r0, 0xE
	bne _0809B568
	movs r0, 0x64
	muls r0, r2
	ldr r1, _0809B564 @ =gPlayerParty
	adds r0, r1
	bl ZeroMonData
	b _0809B582
	.align 2, 0
_0809B564: .4byte gPlayerParty
_0809B568:
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	ldr r2, _0809B588 @ =gPokemonStorage + 0x4
	adds r1, r2
	adds r0, r1
	bl ZeroBoxMonData
_0809B582:
	pop {r0}
	bx r0
	.align 2, 0
_0809B588: .4byte gPokemonStorage + 0x4
	thumb_func_end sub_809B548

	thumb_func_start diegohint1
diegohint1: @ 809B58C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	cmp r5, 0xE
	bne _0809B5C0
	ldr r0, _0809B5B4 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _0809B5B8 @ =0x00002618
	adds r0, r1
	ldr r2, _0809B5BC @ =gPlayerParty
	movs r1, 0x64
	muls r1, r6
	adds r1, r2
	movs r2, 0x64
	bl memcpy
	b _0809B5E2
	.align 2, 0
_0809B5B4: .4byte gUnknown_083B6DB4
_0809B5B8: .4byte 0x00002618
_0809B5BC: .4byte gPlayerParty
_0809B5C0:
	lsls r1, r5, 2
	adds r1, r5
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 4
	ldr r2, _0809B614 @ =gPokemonStorage + 0x4
	adds r1, r2
	adds r0, r1
	ldr r1, _0809B618 @ =gUnknown_083B6DB4
	ldr r1, [r1]
	ldr r2, _0809B61C @ =0x00002618
	adds r1, r2
	bl sub_803B4B4
_0809B5E2:
	adds r0, r5, 0
	adds r1, r6, 0
	bl diegohint2
	ldr r0, _0809B618 @ =gUnknown_083B6DB4
	ldr r1, [r0]
	ldr r0, _0809B620 @ =0x000025b4
	adds r4, r1, r0
	ldr r2, _0809B61C @ =0x00002618
	adds r1, r2
	adds r0, r4, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0
	movs r1, 0
	bl sub_809C04C
	ldr r0, _0809B624 @ =gUnknown_020384E7
	strb r5, [r0]
	ldr r0, _0809B628 @ =gUnknown_020384E8
	strb r6, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B614: .4byte gPokemonStorage + 0x4
_0809B618: .4byte gUnknown_083B6DB4
_0809B61C: .4byte 0x00002618
_0809B620: .4byte 0x000025b4
_0809B624: .4byte gUnknown_020384E7
_0809B628: .4byte gUnknown_020384E8
	thumb_func_end diegohint1

	thumb_func_start sub_809B62C
sub_809B62C: @ 809B62C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	bl sub_8095B24
	lsls r0, 16
	lsrs r4, r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0809B64A
	movs r0, 0
	b _0809B6AC
_0809B64A:
	ldr r5, _0809B668 @ =gUnknown_020384E6
	ldrb r0, [r5]
	cmp r0, 0
	beq _0809B66C
	lsls r4, 24
	lsrs r1, r4, 24
	adds r0, r6, 0
	bl diegohint2
	bl sub_8099480
	movs r0, 0
	strb r0, [r5]
	b _0809B686
	.align 2, 0
_0809B668: .4byte gUnknown_020384E6
_0809B66C:
	ldr r5, _0809B6B4 @ =gUnknown_020384E5
	ldrb r1, [r5]
	movs r0, 0xE
	bl sub_809B44C
	lsls r4, 24
	lsrs r1, r4, 24
	adds r0, r6, 0
	bl diegohint2
	ldrb r0, [r5]
	bl sub_8099520
_0809B686:
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _0809B698
	lsrs r0, r4, 24
	bl sub_8098D20
_0809B698:
	ldr r0, _0809B6B8 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	bl StartSpriteAnim
	movs r0, 0x1
_0809B6AC:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809B6B4: .4byte gUnknown_020384E5
_0809B6B8: .4byte gUnknown_083B6DB4
	thumb_func_end sub_809B62C

	thumb_func_start sub_809B6BC
sub_809B6BC: @ 809B6BC
	push {lr}
	ldr r0, _0809B6D8 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	bl sub_809BF74
	pop {r0}
	bx r0
	.align 2, 0
_0809B6D8: .4byte gUnknown_083B6DB4
	thumb_func_end sub_809B6BC

	thumb_func_start sub_809B6DC
sub_809B6DC: @ 809B6DC
	push {lr}
	ldr r0, _0809B6EC @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809B6F0
	movs r2, 0x2
	b _0809B700
	.align 2, 0
_0809B6EC: .4byte gUnknown_020384E6
_0809B6F0:
	ldr r0, _0809B720 @ =gUnknown_020384E4
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r2, 0x1
	eors r1, r2
	negs r0, r1
	orrs r0, r1
	lsrs r2, r0, 31
_0809B700:
	ldr r0, _0809B724 @ =gUnknown_020384E5
	ldrb r1, [r0]
	adds r0, r2, 0
	bl sub_809981C
	ldr r0, _0809B728 @ =gUnknown_083B6DB4
	ldr r1, [r0]
	ldr r2, _0809B72C @ =0x000026e4
	adds r0, r1, r2
	ldr r2, _0809B730 @ =0x000011fa
	adds r1, r2
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_0809B720: .4byte gUnknown_020384E4
_0809B724: .4byte gUnknown_020384E5
_0809B728: .4byte gUnknown_083B6DB4
_0809B72C: .4byte 0x000026e4
_0809B730: .4byte 0x000011fa
	thumb_func_end sub_809B6DC

	thumb_func_start sub_809B734
sub_809B734: @ 809B734
	push {lr}
	bl sub_80998D8
	lsls r0, 24
	cmp r0, 0
	beq _0809B744
	movs r0, 0x1
	b _0809B758
_0809B744:
	ldr r0, _0809B75C @ =gUnknown_083B6DB4
	ldr r0, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	bl StartSpriteAnim
	movs r0, 0
_0809B758:
	pop {r1}
	bx r1
	.align 2, 0
_0809B75C: .4byte gUnknown_083B6DB4
	thumb_func_end sub_809B734

	thumb_func_start sub_809B760
sub_809B760: @ 809B760
	push {lr}
	bl sub_8099920
	ldr r1, _0809B774 @ =gUnknown_020384E6
	ldrb r0, [r1]
	cmp r0, 0
	beq _0809B778
	movs r0, 0
	strb r0, [r1]
	b _0809B79E
	.align 2, 0
_0809B774: .4byte gUnknown_020384E6
_0809B778:
	ldr r0, _0809B788 @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809B78C
	movs r2, 0xE
	b _0809B794
	.align 2, 0
_0809B788: .4byte gUnknown_020384E4
_0809B78C:
	bl get_preferred_box
	lsls r0, 24
	lsrs r2, r0, 24
_0809B794:
	ldr r0, _0809B7A8 @ =gUnknown_020384E5
	ldrb r1, [r0]
	adds r0, r2, 0
	bl sub_809B548
_0809B79E:
	bl sub_809BF74
	pop {r0}
	bx r0
	.align 2, 0
_0809B7A8: .4byte gUnknown_020384E5
	thumb_func_end sub_809B760

	thumb_func_start sub_809B7AC
sub_809B7AC: @ 809B7AC
	push {lr}
	ldr r0, _0809B7CC @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809B7C8
	ldr r0, _0809B7D0 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	movs r1, 0x8E
	lsls r1, 5
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x3
	bl StartSpriteAnim
_0809B7C8:
	pop {r0}
	bx r0
	.align 2, 0
_0809B7CC: .4byte gUnknown_020384E6
_0809B7D0: .4byte gUnknown_083B6DB4
	thumb_func_end sub_809B7AC

	thumb_func_start sub_809B7D4
sub_809B7D4: @ 809B7D4
	push {r4-r6,lr}
	ldr r0, _0809B804 @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809B81C
	ldr r0, _0809B808 @ =gUnknown_083B6DB4
	ldr r4, [r0]
	ldr r1, _0809B80C @ =0x00002618
	adds r0, r4, r1
	ldr r2, _0809B810 @ =0x000025b4
	adds r1, r4, r2
	movs r2, 0x64
	bl memcpy
	ldr r0, _0809B814 @ =0x00002682
	adds r1, r4, r0
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, _0809B818 @ =0x00002683
	adds r4, r1
	movs r0, 0x1
	negs r0, r0
	strb r0, [r4]
	b _0809B8A6
	.align 2, 0
_0809B804: .4byte gUnknown_020384E6
_0809B808: .4byte gUnknown_083B6DB4
_0809B80C: .4byte 0x00002618
_0809B810: .4byte 0x000025b4
_0809B814: .4byte 0x00002682
_0809B818: .4byte 0x00002683
_0809B81C:
	ldr r0, _0809B84C @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809B864
	ldr r0, _0809B850 @ =gUnknown_083B6DB4
	ldr r4, [r0]
	ldr r2, _0809B854 @ =0x00002618
	adds r0, r4, r2
	ldr r3, _0809B858 @ =gPlayerParty
	ldr r1, _0809B85C @ =gUnknown_020384E5
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r1, 0x64
	muls r1, r2
	adds r1, r3
	movs r2, 0x64
	bl memcpy
	ldr r0, _0809B860 @ =0x00002682
	adds r4, r0
	movs r0, 0xE
	b _0809B896
	.align 2, 0
_0809B84C: .4byte gUnknown_020384E4
_0809B850: .4byte gUnknown_083B6DB4
_0809B854: .4byte 0x00002618
_0809B858: .4byte gPlayerParty
_0809B85C: .4byte gUnknown_020384E5
_0809B860: .4byte 0x00002682
_0809B864:
	ldr r5, _0809B8FC @ =gPokemonStorage
	ldrb r0, [r5]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldr r1, _0809B900 @ =gUnknown_020384E5
	movs r2, 0
	ldrsb r2, [r1, r2]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	adds r2, r5, 0x4
	adds r1, r2
	adds r0, r1
	ldr r1, _0809B904 @ =gUnknown_083B6DB4
	ldr r4, [r1]
	ldr r2, _0809B908 @ =0x00002618
	adds r1, r4, r2
	bl sub_803B4B4
	ldrb r0, [r5]
	ldr r1, _0809B90C @ =0x00002682
	adds r4, r1
_0809B896:
	strb r0, [r4]
	ldr r0, _0809B904 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _0809B900 @ =gUnknown_020384E5
	ldrb r1, [r1]
	ldr r2, _0809B910 @ =0x00002683
	adds r0, r2
	strb r1, [r0]
_0809B8A6:
	ldr r0, _0809B904 @ =gUnknown_083B6DB4
	ldr r6, [r0]
	ldr r0, _0809B914 @ =0x0000267e
	adds r4, r6, r0
	movs r0, 0
	strb r0, [r4]
	ldr r1, _0809B918 @ =0x0000267f
	adds r5, r6, r1
	strb r0, [r5]
	ldr r0, _0809B91C @ =0x00002686
	adds r2, r6, r0
	movs r0, 0x39
	strh r0, [r2]
	ldr r0, _0809B920 @ =0x00002688
	adds r1, r6, r0
	ldr r0, _0809B924 @ =0x00000123
	strh r0, [r1]
	ldr r0, _0809B928 @ =0x0000268a
	adds r1, r6, r0
	ldr r0, _0809B92C @ =0x00000163
	strh r0, [r1]
	ldr r1, _0809B908 @ =0x00002618
	adds r0, r6, r1
	movs r1, 0x50
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	movs r2, 0x1
	ands r1, r2
	strb r1, [r4]
	lsrs r0, 17
	movs r1, 0x1
	ands r0, r1
	strb r0, [r5]
	ldrh r0, [r4]
	cmp r0, 0
	beq _0809B934
	ldr r2, _0809B930 @ =0x0000267d
	adds r1, r6, r2
	movs r0, 0
	strb r0, [r1]
	b _0809B940
	.align 2, 0
_0809B8FC: .4byte gPokemonStorage
_0809B900: .4byte gUnknown_020384E5
_0809B904: .4byte gUnknown_083B6DB4
_0809B908: .4byte 0x00002618
_0809B90C: .4byte 0x00002682
_0809B910: .4byte 0x00002683
_0809B914: .4byte 0x0000267e
_0809B918: .4byte 0x0000267f
_0809B91C: .4byte 0x00002686
_0809B920: .4byte 0x00002688
_0809B924: .4byte 0x00000123
_0809B928: .4byte 0x0000268a
_0809B92C: .4byte 0x00000163
_0809B930: .4byte 0x0000267d
_0809B934:
	ldr r2, _0809B954 @ =0x0000267d
	adds r0, r6, r2
	strb r1, [r0]
	subs r2, 0x1
	adds r0, r6, r2
	strb r1, [r0]
_0809B940:
	ldr r0, _0809B958 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _0809B95C @ =0x00002684
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809B954: .4byte 0x0000267d
_0809B958: .4byte gUnknown_083B6DB4
_0809B95C: .4byte 0x00002684
	thumb_func_end sub_809B7D4

	thumb_func_start sub_809B960
sub_809B960: @ 809B960
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0809B988 @ =gUnknown_083B6DB4
	ldr r2, [r0]
	ldr r3, _0809B98C @ =0x0000267d
	adds r1, r2, r3
	ldrb r1, [r1]
	mov r12, r0
	cmp r1, 0
	beq _0809B994
	ldr r7, _0809B990 @ =0x0000267c
	adds r0, r2, r7
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	b _0809BB5C
	.align 2, 0
_0809B988: .4byte gUnknown_083B6DB4
_0809B98C: .4byte 0x0000267d
_0809B990: .4byte 0x0000267c
_0809B994:
	ldr r1, _0809B9A4 @ =0x00002684
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _0809B9A8
	cmp r0, 0x1
	beq _0809BA84
	b _0809BB58
	.align 2, 0
_0809B9A4: .4byte 0x00002684
_0809B9A8:
	movs r5, 0
	movs r6, 0
_0809B9AC:
	mov r2, r12
	ldr r4, [r2]
	ldr r3, _0809BA28 @ =0x00002682
	adds r0, r4, r3
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xE
	bne _0809B9CC
	ldr r7, _0809BA2C @ =0x00002683
	adds r0, r4, r7
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, r5
	beq _0809BA02
_0809B9CC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0809BA30 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0809BA34 @ =0x00002686
	adds r2, r4, r1
	movs r1, 0x50
	bl GetMonData
	lsls r0, 16
	lsrs r3, r0, 16
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _0809B9F0
	ldr r2, _0809BA38 @ =0x0000267e
	adds r0, r4, r2
	strb r6, [r0]
_0809B9F0:
	movs r0, 0x2
	ands r3, r0
	ldr r7, _0809BA3C @ =gUnknown_083B6DB4
	mov r12, r7
	cmp r3, 0
	beq _0809BA02
	ldr r1, _0809BA40 @ =0x0000267f
	adds r0, r4, r1
	strb r6, [r0]
_0809BA02:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _0809B9AC
	mov r3, r12
	ldr r2, [r3]
	ldr r7, _0809BA38 @ =0x0000267e
	adds r0, r2, r7
	ldrh r0, [r0]
	cmp r0, 0
	bne _0809BA4C
	ldr r1, _0809BA44 @ =0x0000267d
	adds r0, r2, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r3, _0809BA48 @ =0x0000267c
	b _0809BB54
	.align 2, 0
_0809BA28: .4byte 0x00002682
_0809BA2C: .4byte 0x00002683
_0809BA30: .4byte gPlayerParty
_0809BA34: .4byte 0x00002686
_0809BA38: .4byte 0x0000267e
_0809BA3C: .4byte gUnknown_083B6DB4
_0809BA40: .4byte 0x0000267f
_0809BA44: .4byte 0x0000267d
_0809BA48: .4byte 0x0000267c
_0809BA4C:
	movs r7, 0x9A
	lsls r7, 6
	adds r0, r2, r7
	movs r1, 0
	strb r1, [r0]
	ldr r3, _0809BA68 @ =0x00002681
	adds r0, r2, r3
	strb r1, [r0]
	adds r7, 0x4
	adds r1, r2, r7
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0809BB58
	.align 2, 0
_0809BA68: .4byte 0x00002681
_0809BA6C:
	ldr r1, _0809BA7C @ =0x0000267d
	adds r0, r2, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r7, _0809BA80 @ =0x0000267c
	adds r0, r2, r7
	strb r3, [r0]
	b _0809BB3C
	.align 2, 0
_0809BA7C: .4byte 0x0000267d
_0809BA80: .4byte 0x0000267c
_0809BA84:
	movs r5, 0
	mov r9, r12
	adds r4, r2, 0
	movs r0, 0x9A
	lsls r0, 6
	adds r6, r4, r0
	ldr r1, _0809BB6C @ =0x0000267f
	adds r1, r4
	mov r8, r1
	ldr r2, _0809BB70 @ =0x0000ffff
	mov r10, r2
_0809BA9A:
	movs r0, 0
	ldrsb r0, [r6, r0]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldr r3, _0809BB74 @ =0x00002681
	adds r1, r4, r3
	movs r2, 0
	ldrsb r2, [r1, r2]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	ldr r2, _0809BB78 @ =gPokemonStorage + 0x4
	adds r1, r2
	adds r0, r1
	movs r1, 0x50
	ldr r7, _0809BB7C @ =0x00002686
	adds r2, r4, r7
	bl GetBoxMonData
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _0809BB00
	ldr r1, _0809BB80 @ =0x00002682
	adds r0, r4, r1
	ldrh r0, [r0]
	ldrh r2, [r6]
	mov r1, r10
	ands r1, r0
	mov r0, r10
	ands r0, r2
	cmp r1, r0
	beq _0809BB00
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _0809BAF2
	ldr r2, _0809BB84 @ =0x0000267e
	adds r1, r4, r2
	movs r0, 0
	strb r0, [r1]
_0809BAF2:
	movs r0, 0x2
	ands r3, r0
	cmp r3, 0
	beq _0809BB00
	movs r0, 0
	mov r3, r8
	strb r0, [r3]
_0809BB00:
	mov r7, r9
	ldr r2, [r7]
	ldr r0, _0809BB74 @ =0x00002681
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	movs r3, 0
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	ldr r7, _0809BB88 @ =gUnknown_083B6DB4
	mov r12, r7
	cmp r0, 0x1D
	ble _0809BB32
	strb r3, [r1]
	movs r0, 0x9A
	lsls r0, 6
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0xD
	bgt _0809BA6C
_0809BB32:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x4
	bls _0809BA9A
_0809BB3C:
	mov r1, r12
	ldr r2, [r1]
	ldr r3, _0809BB84 @ =0x0000267e
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, 0
	bne _0809BB58
	ldr r7, _0809BB8C @ =0x0000267d
	adds r0, r2, r7
	movs r1, 0x1
	strb r1, [r0]
	subs r3, 0x2
_0809BB54:
	adds r0, r2, r3
	strb r1, [r0]
_0809BB58:
	movs r0, 0x1
	negs r0, r0
_0809BB5C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809BB6C: .4byte 0x0000267f
_0809BB70: .4byte 0x0000ffff
_0809BB74: .4byte 0x00002681
_0809BB78: .4byte gPokemonStorage + 0x4
_0809BB7C: .4byte 0x00002686
_0809BB80: .4byte 0x00002682
_0809BB84: .4byte 0x0000267e
_0809BB88: .4byte gUnknown_083B6DB4
_0809BB8C: .4byte 0x0000267d
	thumb_func_end sub_809B960

	thumb_func_start sub_809BB90
sub_809BB90: @ 809BB90
	push {lr}
	ldr r0, _0809BBB0 @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809BBAA
	ldr r0, _0809BBB4 @ =gUnknown_02038480
	ldr r1, _0809BBB8 @ =gUnknown_083B6DB4
	ldr r1, [r1]
	ldr r2, _0809BBBC @ =0x000025b4
	adds r1, r2
	movs r2, 0x64
	bl memcpy
_0809BBAA:
	pop {r0}
	bx r0
	.align 2, 0
_0809BBB0: .4byte gUnknown_020384E6
_0809BBB4: .4byte gUnknown_02038480
_0809BBB8: .4byte gUnknown_083B6DB4
_0809BBBC: .4byte 0x000025b4
	thumb_func_end sub_809BB90

	thumb_func_start sub_809BBC0
sub_809BBC0: @ 809BBC0
	push {lr}
	ldr r0, _0809BBE4 @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809BC08
	ldr r0, _0809BBE8 @ =gUnknown_020384E7
	ldrb r0, [r0]
	cmp r0, 0xE
	bne _0809BBF8
	ldr r0, _0809BBEC @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _0809BBF0 @ =0x000025b4
	adds r0, r1
	ldr r1, _0809BBF4 @ =gUnknown_02038480
	movs r2, 0x64
	bl memcpy
	b _0809BC08
	.align 2, 0
_0809BBE4: .4byte gUnknown_020384E6
_0809BBE8: .4byte gUnknown_020384E7
_0809BBEC: .4byte gUnknown_083B6DB4
_0809BBF0: .4byte 0x000025b4
_0809BBF4: .4byte gUnknown_02038480
_0809BBF8:
	ldr r0, _0809BC0C @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _0809BC10 @ =0x000025b4
	adds r0, r1
	ldr r1, _0809BC14 @ =gUnknown_02038480
	movs r2, 0x50
	bl memcpy
_0809BC08:
	pop {r0}
	bx r0
	.align 2, 0
_0809BC0C: .4byte gUnknown_083B6DB4
_0809BC10: .4byte 0x000025b4
_0809BC14: .4byte gUnknown_02038480
	thumb_func_end sub_809BBC0

	thumb_func_start sub_809BC18
sub_809BC18: @ 809BC18
	push {r4,r5,lr}
	ldr r0, _0809BC48 @ =gUnknown_020384E6
	ldrb r5, [r0]
	cmp r5, 0
	beq _0809BC64
	bl sub_809BB90
	ldr r0, _0809BC4C @ =gUnknown_083B6DB4
	ldr r2, [r0]
	ldr r0, _0809BC50 @ =0x00002690
	adds r1, r2, r0
	ldr r0, _0809BC54 @ =gUnknown_02038480
	str r0, [r1]
	ldr r1, _0809BC58 @ =0x0000268d
	adds r0, r2, r1
	movs r1, 0
	strb r1, [r0]
	ldr r3, _0809BC5C @ =0x0000268c
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _0809BC60 @ =0x0000268e
	adds r2, r0
	strb r1, [r2]
	b _0809BCF2
	.align 2, 0
_0809BC48: .4byte gUnknown_020384E6
_0809BC4C: .4byte gUnknown_083B6DB4
_0809BC50: .4byte 0x00002690
_0809BC54: .4byte gUnknown_02038480
_0809BC58: .4byte 0x0000268d
_0809BC5C: .4byte 0x0000268c
_0809BC60: .4byte 0x0000268e
_0809BC64:
	ldr r0, _0809BC9C @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809BCBC
	ldr r0, _0809BCA0 @ =gUnknown_083B6DB4
	ldr r4, [r0]
	ldr r2, _0809BCA4 @ =0x00002690
	adds r1, r4, r2
	ldr r0, _0809BCA8 @ =gPlayerParty
	str r0, [r1]
	ldr r0, _0809BCAC @ =gUnknown_020384E5
	ldrb r1, [r0]
	ldr r3, _0809BCB0 @ =0x0000268d
	adds r0, r4, r3
	strb r1, [r0]
	bl StorageSystemGetPartySize
	subs r0, 0x1
	ldr r2, _0809BCB4 @ =0x0000268c
	adds r1, r4, r2
	strb r0, [r1]
	ldr r3, _0809BCB8 @ =0x0000268e
	adds r4, r3
	strb r5, [r4]
	b _0809BCF2
	.align 2, 0
_0809BC9C: .4byte gUnknown_020384E4
_0809BCA0: .4byte gUnknown_083B6DB4
_0809BCA4: .4byte 0x00002690
_0809BCA8: .4byte gPlayerParty
_0809BCAC: .4byte gUnknown_020384E5
_0809BCB0: .4byte 0x0000268d
_0809BCB4: .4byte 0x0000268c
_0809BCB8: .4byte 0x0000268e
_0809BCBC:
	ldr r0, _0809BCF8 @ =gUnknown_083B6DB4
	ldr r3, [r0]
	ldr r0, _0809BCFC @ =0x00002690
	adds r4, r3, r0
	ldr r2, _0809BD00 @ =gPokemonStorage
	ldrb r0, [r2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	adds r2, 0x4
	adds r0, r2
	str r0, [r4]
	ldr r0, _0809BD04 @ =gUnknown_020384E5
	ldrb r1, [r0]
	ldr r2, _0809BD08 @ =0x0000268d
	adds r0, r3, r2
	strb r1, [r0]
	ldr r0, _0809BD0C @ =0x0000268c
	adds r1, r3, r0
	movs r0, 0x1D
	strb r0, [r1]
	ldr r1, _0809BD10 @ =0x0000268e
	adds r3, r1
	movs r0, 0x5
	strb r0, [r3]
_0809BCF2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809BCF8: .4byte gUnknown_083B6DB4
_0809BCFC: .4byte 0x00002690
_0809BD00: .4byte gPokemonStorage
_0809BD04: .4byte gUnknown_020384E5
_0809BD08: .4byte 0x0000268d
_0809BD0C: .4byte 0x0000268c
_0809BD10: .4byte 0x0000268e
	thumb_func_end sub_809BC18

	thumb_func_start sub_809BD14
sub_809BD14: @ 809BD14
	push {lr}
	ldr r0, _0809BD24 @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809BD28
	bl sub_809BBC0
	b _0809BD30
	.align 2, 0
_0809BD24: .4byte gUnknown_020384E6
_0809BD28:
	ldr r0, _0809BD34 @ =gUnknown_020384E5
	ldr r1, _0809BD38 @ =0x02018000
	ldrb r1, [r1, 0x9]
	strb r1, [r0]
_0809BD30:
	pop {r0}
	bx r0
	.align 2, 0
_0809BD34: .4byte gUnknown_020384E5
_0809BD38: .4byte 0x02018000
	thumb_func_end sub_809BD14

	thumb_func_start party_compaction
party_compaction: @ 809BD3C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r7, _0809BD88 @ =0x0000ffff
	movs r6, 0
	movs r5, 0
	movs r0, 0x64
	mov r9, r0
	ldr r1, _0809BD8C @ =gPlayerParty
	mov r8, r1
	subs r0, 0x65
	mov r10, r0
_0809BD58:
	mov r0, r9
	muls r0, r6
	mov r1, r8
	adds r4, r0, r1
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	cmp r0, 0
	beq _0809BD90
	cmp r6, r5
	beq _0809BD80
	mov r0, r9
	muls r0, r5
	add r0, r8
	adds r1, r4, 0
	movs r2, 0x64
	bl memcpy
_0809BD80:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	b _0809BD9A
	.align 2, 0
_0809BD88: .4byte 0x0000ffff
_0809BD8C: .4byte gPlayerParty
_0809BD90:
	lsls r0, r7, 16
	asrs r0, 16
	cmp r0, r10
	bne _0809BD9A
	adds r7, r6, 0
_0809BD9A:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _0809BD58
	lsls r7, 16
	cmp r5, 0x5
	bhi _0809BDC2
	movs r6, 0x64
	ldr r4, _0809BDD4 @ =gPlayerParty
_0809BDAE:
	adds r0, r5, 0
	muls r0, r6
	adds r0, r4
	bl ZeroMonData
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _0809BDAE
_0809BDC2:
	asrs r0, r7, 16
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809BDD4: .4byte gPlayerParty
	thumb_func_end party_compaction

	thumb_func_start sub_809BDD8
sub_809BDD8: @ 809BDD8
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	ldr r1, _0809BE04 @ =gUnknown_083B6DB4
	ldr r2, [r1]
	ldr r3, _0809BE08 @ =0x000011f7
	adds r1, r2, r3
	strb r0, [r1]
	ldr r0, _0809BE0C @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809BE14
	ldr r1, _0809BE10 @ =0x000025b4
	adds r0, r2, r1
	movs r1, 0x8
	mov r2, sp
	bl SetMonData
	b _0809BE68
	.align 2, 0
_0809BE04: .4byte gUnknown_083B6DB4
_0809BE08: .4byte 0x000011f7
_0809BE0C: .4byte gUnknown_020384E6
_0809BE10: .4byte 0x000025b4
_0809BE14:
	ldr r4, _0809BE70 @ =gUnknown_020384E4
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x1
	bne _0809BE34
	ldr r0, _0809BE74 @ =gUnknown_020384E5
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0809BE78 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x8
	mov r2, sp
	bl SetMonData
_0809BE34:
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0
	bne _0809BE68
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldr r1, _0809BE74 @ =gUnknown_020384E5
	movs r2, 0
	ldrsb r2, [r1, r2]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	ldr r2, _0809BE7C @ =gPokemonStorage + 0x4
	adds r1, r2
	adds r0, r1
	movs r1, 0x8
	mov r2, sp
	bl SetBoxMonData
_0809BE68:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809BE70: .4byte gUnknown_020384E4
_0809BE74: .4byte gUnknown_020384E5
_0809BE78: .4byte gPlayerParty
_0809BE7C: .4byte gPokemonStorage + 0x4
	thumb_func_end sub_809BDD8

	thumb_func_start sub_809BE80
sub_809BE80: @ 809BE80
	push {lr}
	ldr r0, _0809BEA8 @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809BEB4
	ldr r0, _0809BEAC @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809BEB4
	ldr r0, _0809BEB0 @ =gUnknown_020384E5
	ldrb r0, [r0]
	bl CountAlivePartyMonsExceptOne
	lsls r0, 24
	cmp r0, 0
	bne _0809BEB4
	movs r0, 0x1
	b _0809BEB6
	.align 2, 0
_0809BEA8: .4byte gUnknown_020384E4
_0809BEAC: .4byte gUnknown_020384E6
_0809BEB0: .4byte gUnknown_020384E5
_0809BEB4:
	movs r0, 0
_0809BEB6:
	pop {r1}
	bx r1
	thumb_func_end sub_809BE80

	thumb_func_start sub_809BEBC
sub_809BEBC: @ 809BEBC
	push {lr}
	ldr r0, _0809BF00 @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809BF18
	ldr r0, _0809BF04 @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809BEFC
	ldr r0, _0809BF08 @ =gUnknown_020384E5
	ldrb r0, [r0]
	bl CountAlivePartyMonsExceptOne
	lsls r0, 24
	cmp r0, 0
	bne _0809BEFC
	ldr r0, _0809BF0C @ =gUnknown_083B6DB4
	ldr r1, [r0]
	ldr r2, _0809BF10 @ =0x000011f9
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809BF18
	ldr r2, _0809BF14 @ =0x000025b4
	adds r0, r1, r2
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0809BF18
_0809BEFC:
	movs r0, 0x1
	b _0809BF1A
	.align 2, 0
_0809BF00: .4byte gUnknown_020384E6
_0809BF04: .4byte gUnknown_020384E4
_0809BF08: .4byte gUnknown_020384E5
_0809BF0C: .4byte gUnknown_083B6DB4
_0809BF10: .4byte 0x000011f9
_0809BF14: .4byte 0x000025b4
_0809BF18:
	movs r0, 0
_0809BF1A:
	pop {r1}
	bx r1
	thumb_func_end sub_809BEBC

	thumb_func_start sub_809BF20
sub_809BF20: @ 809BF20
	ldr r0, _0809BF28 @ =gUnknown_020384E6
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0809BF28: .4byte gUnknown_020384E6
	thumb_func_end sub_809BF20

	thumb_func_start sub_809BF2C
sub_809BF2C: @ 809BF2C
	push {lr}
	movs r1, 0
	ldr r0, _0809BF44 @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x2
	bne _0809BF3E
	movs r1, 0x1
_0809BF3E:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_0809BF44: .4byte gUnknown_020384E4
	thumb_func_end sub_809BF2C

	thumb_func_start sub_809BF48
sub_809BF48: @ 809BF48
	push {lr}
	movs r1, 0
	ldr r0, _0809BF6C @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	bne _0809BF66
	ldr r0, _0809BF70 @ =gUnknown_020384E5
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809BF66
	movs r1, 0x1
_0809BF66:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_0809BF6C: .4byte gUnknown_020384E4
_0809BF70: .4byte gUnknown_020384E5
	thumb_func_end sub_809BF48

	thumb_func_start sub_809BF74
sub_809BF74: @ 809BF74
	push {r4,lr}
	ldr r0, _0809BFA8 @ =gUnknown_083B6DB4
	ldr r1, [r0]
	movs r2, 0
	ldr r3, _0809BFAC @ =gUnknown_020384E6
	ldrb r0, [r3]
	cmp r0, 0
	bne _0809BF86
	movs r2, 0x1
_0809BF86:
	ldr r4, _0809BFB0 @ =0x000011f6
	adds r0, r1, r4
	strb r2, [r0]
	ldrb r0, [r3]
	cmp r0, 0
	bne _0809C018
	ldr r0, _0809BFB4 @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	beq _0809BFBE
	cmp r0, 0x1
	bgt _0809BFB8
	cmp r0, 0
	beq _0809BFEE
	b _0809C018
	.align 2, 0
_0809BFA8: .4byte gUnknown_083B6DB4
_0809BFAC: .4byte gUnknown_020384E6
_0809BFB0: .4byte 0x000011f6
_0809BFB4: .4byte gUnknown_020384E4
_0809BFB8:
	cmp r0, 0x3
	bgt _0809C018
	b _0809BFE4
_0809BFBE:
	ldr r1, _0809BFDC @ =gUnknown_020384E5
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, 0x5
	bgt _0809BFE4
	adds r1, r0, 0
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0809BFE0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0
	bl sub_809C04C
	b _0809C018
	.align 2, 0
_0809BFDC: .4byte gUnknown_020384E5
_0809BFE0: .4byte gPlayerParty
_0809BFE4:
	movs r0, 0
	movs r1, 0x2
	bl sub_809C04C
	b _0809C018
_0809BFEE:
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	ldr r1, _0809C020 @ =gUnknown_020384E5
	movs r2, 0
	ldrsb r2, [r1, r2]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	ldr r2, _0809C024 @ =gPokemonStorage + 0x4
	adds r1, r2
	adds r0, r1
	movs r1, 0x1
	bl sub_809C04C
_0809C018:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809C020: .4byte gUnknown_020384E5
_0809C024: .4byte gPokemonStorage + 0x4
	thumb_func_end sub_809BF74

	thumb_func_start sub_809C028
sub_809C028: @ 809C028
	push {lr}
	ldr r0, _0809C03C @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809C044
	ldr r0, _0809C040 @ =gUnknown_02038480
	movs r1, 0
	bl sub_809C04C
	b _0809C048
	.align 2, 0
_0809C03C: .4byte gUnknown_020384E6
_0809C040: .4byte gUnknown_02038480
_0809C044:
	bl sub_809BF74
_0809C048:
	pop {r0}
	bx r0
	thumb_func_end sub_809C028

	thumb_func_start sub_809C04C
sub_809C04C: @ 809C04C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	str r0, [sp]
	ldr r0, _0809C0FC @ =gUnknown_083B6DB4
	ldr r6, [r0]
	ldr r2, _0809C100 @ =0x000011f2
	adds r2, r6
	mov r8, r2
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r2]
	cmp r1, 0
	bne _0809C120
	adds r0, r7, 0
	movs r1, 0x41
	bl GetMonData
	ldr r2, _0809C104 @ =0x000011f0
	adds r1, r6, r2
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _0809C08C
	b _0809C1EC
_0809C08C:
	adds r0, r7, 0
	movs r1, 0x2D
	bl GetMonData
	ldr r2, _0809C108 @ =0x000011f9
	adds r1, r6, r2
	strb r0, [r1]
	ldr r0, _0809C10C @ =0x000011fa
	adds r4, r6, r0
	adds r0, r7, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	adds r0, r4, 0
	bl StringGetEnd10
	adds r0, r7, 0
	movs r1, 0x38
	bl GetMonData
	ldr r2, _0809C110 @ =0x000011f8
	adds r1, r6, r2
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x8
	bl GetMonData
	ldr r2, _0809C114 @ =0x000011f7
	adds r1, r6, r2
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0
	bl GetMonData
	ldr r2, _0809C118 @ =0x000011ec
	adds r1, r6, r2
	str r0, [r1]
	adds r0, r7, 0
	bl pokemon_get_pal
	ldr r2, _0809C11C @ =0x000011e8
	adds r1, r6, r2
	str r0, [r1]
	adds r0, r7, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r7, 0
	movs r1, 0xC
	bl GetMonData
	b _0809C1B2
	.align 2, 0
_0809C0FC: .4byte gUnknown_083B6DB4
_0809C100: .4byte 0x000011f2
_0809C104: .4byte 0x000011f0
_0809C108: .4byte 0x000011f9
_0809C10C: .4byte 0x000011fa
_0809C110: .4byte 0x000011f8
_0809C114: .4byte 0x000011f7
_0809C118: .4byte 0x000011ec
_0809C11C: .4byte 0x000011e8
_0809C120:
	cmp r1, 0x1
	bne _0809C1D4
	adds r0, r7, 0
	movs r1, 0x41
	bl GetBoxMonData
	ldr r2, _0809C1B8 @ =0x000011f0
	adds r5, r6, r2
	strh r0, [r5]
	lsls r0, 16
	cmp r0, 0
	beq _0809C1EC
	adds r0, r7, 0
	movs r1, 0x1
	bl GetBoxMonData
	mov r9, r0
	adds r0, r7, 0
	movs r1, 0x2D
	bl GetBoxMonData
	ldr r2, _0809C1BC @ =0x000011f9
	adds r1, r6, r2
	strb r0, [r1]
	ldr r0, _0809C1C0 @ =0x000011fa
	adds r4, r6, r0
	adds r0, r7, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl GetBoxMonData
	adds r0, r4, 0
	bl StringGetEnd10
	adds r0, r7, 0
	bl GetLevelFromBoxMonExp
	ldr r2, _0809C1C4 @ =0x000011f8
	adds r1, r6, r2
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x8
	bl GetBoxMonData
	ldr r2, _0809C1C8 @ =0x000011f7
	adds r1, r6, r2
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0
	bl GetBoxMonData
	adds r2, r0, 0
	ldr r0, _0809C1CC @ =0x000011ec
	adds r4, r6, r0
	str r2, [r4]
	ldrh r0, [r5]
	mov r1, r9
	bl species_and_otid_get_pal
	ldr r2, _0809C1D0 @ =0x000011e8
	adds r1, r6, r2
	str r0, [r1]
	ldrh r0, [r5]
	ldr r1, [r4]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r7, 0
	movs r1, 0xC
	bl GetBoxMonData
_0809C1B2:
	mov r1, r8
	strh r0, [r1]
	b _0809C1DE
	.align 2, 0
_0809C1B8: .4byte 0x000011f0
_0809C1BC: .4byte 0x000011f9
_0809C1C0: .4byte 0x000011fa
_0809C1C4: .4byte 0x000011f8
_0809C1C8: .4byte 0x000011f7
_0809C1CC: .4byte 0x000011ec
_0809C1D0: .4byte 0x000011e8
_0809C1D4:
	ldr r2, _0809C220 @ =0x000011f0
	adds r0, r6, r2
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0]
_0809C1DE:
	ldr r0, _0809C224 @ =gUnknown_083B6DB4
	ldr r4, [r0]
	ldr r2, _0809C220 @ =0x000011f0
	adds r0, r4, r2
	ldrh r1, [r0]
	cmp r1, 0
	bne _0809C23C
_0809C1EC:
	ldr r0, _0809C224 @ =gUnknown_083B6DB4
	ldr r1, [r0]
	ldr r0, _0809C228 @ =0x000011fa
	adds r2, r1, r0
	movs r0, 0xFF
	strb r0, [r2]
	ldr r0, _0809C22C @ =0x0000120f
	adds r2, r1, r0
	movs r0, 0x1
	negs r0, r0
	strb r0, [r2]
	ldr r0, _0809C230 @ =0x00001234
	adds r2, r1, r0
	movs r0, 0x1
	negs r0, r0
	strb r0, [r2]
	ldr r0, _0809C234 @ =0x00001259
	adds r2, r1, r0
	movs r0, 0x1
	negs r0, r0
	strb r0, [r2]
	ldr r2, _0809C238 @ =0x0000127a
	adds r1, r2
	strb r0, [r1]
	b _0809C43E
	.align 2, 0
_0809C220: .4byte 0x000011f0
_0809C224: .4byte gUnknown_083B6DB4
_0809C228: .4byte 0x000011fa
_0809C22C: .4byte 0x0000120f
_0809C230: .4byte 0x00001234
_0809C234: .4byte 0x00001259
_0809C238: .4byte 0x0000127a
_0809C23C:
	ldr r2, _0809C28C @ =0x000011f9
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809C2A4
	ldr r0, _0809C290 @ =0x0000120f
	adds r7, r4, r0
	movs r0, 0xFC
	strb r0, [r7]
	movs r0, 0x4
	strb r0, [r7, 0x1]
	movs r0, 0xF
	strb r0, [r7, 0x2]
	movs r0, 0
	strb r0, [r7, 0x3]
	movs r0, 0x1
	strb r0, [r7, 0x4]
	ldr r1, _0809C294 @ =0x00001214
	adds r7, r4, r1
	adds r2, 0x1
	adds r1, r4, r2
	adds r0, r7, 0
	bl StringCopy
	ldr r0, _0809C298 @ =0x00001234
	adds r1, r4, r0
	movs r0, 0xFF
	strb r0, [r1]
	ldr r2, _0809C29C @ =0x00001259
	adds r1, r4, r2
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1]
	ldr r0, _0809C2A0 @ =0x0000127a
	adds r1, r4, r0
	movs r0, 0x1
	negs r0, r0
	strb r0, [r1]
	b _0809C43E
	.align 2, 0
_0809C28C: .4byte 0x000011f9
_0809C290: .4byte 0x0000120f
_0809C294: .4byte 0x00001214
_0809C298: .4byte 0x00001234
_0809C29C: .4byte 0x00001259
_0809C2A0: .4byte 0x0000127a
_0809C2A4:
	cmp r1, 0x20
	beq _0809C2AC
	cmp r1, 0x1D
	bne _0809C2B0
_0809C2AC:
	movs r1, 0xFF
	str r1, [sp]
_0809C2B0:
	ldr r0, _0809C388 @ =gUnknown_083B6DB4
	ldr r4, [r0]
	ldr r2, _0809C38C @ =0x0000120f
	adds r7, r4, r2
	movs r0, 0xFC
	mov r9, r0
	strb r0, [r7]
	movs r1, 0x4
	mov r8, r1
	strb r1, [r7, 0x1]
	movs r2, 0xF
	strb r2, [r7, 0x2]
	movs r0, 0
	strb r0, [r7, 0x3]
	movs r6, 0x1
	strb r6, [r7, 0x4]
	ldr r1, _0809C390 @ =0x00001214
	adds r7, r4, r1
	ldr r2, _0809C394 @ =0x000011fa
	adds r1, r4, r2
	adds r0, r7, 0
	bl StringCopy
	ldr r0, _0809C398 @ =0x00001234
	adds r7, r4, r0
	mov r1, r9
	strb r1, [r7]
	mov r2, r8
	strb r2, [r7, 0x1]
	movs r0, 0xF
	strb r0, [r7, 0x2]
	movs r1, 0
	strb r1, [r7, 0x3]
	strb r6, [r7, 0x4]
	mov r2, r9
	strb r2, [r7, 0x5]
	movs r0, 0x13
	mov r10, r0
	strb r0, [r7, 0x6]
	movs r1, 0x7
	strb r1, [r7, 0x7]
	movs r0, 0xBA
	strb r0, [r7, 0x8]
	ldr r2, _0809C39C @ =0x0000123d
	adds r7, r4, r2
	ldr r1, _0809C3A0 @ =0x000011f0
	adds r0, r4, r1
	ldrh r1, [r0]
	movs r0, 0xB
	muls r1, r0
	ldr r0, _0809C3A4 @ =gSpeciesNames
	adds r1, r0
	adds r0, r7, 0
	bl StringCopy
	adds r7, r0, 0
	mov r2, r9
	strb r2, [r7]
	mov r0, r10
	strb r0, [r7, 0x1]
	movs r0, 0x50
	strb r0, [r7, 0x2]
	movs r0, 0xFF
	strb r0, [r7, 0x3]
	ldr r1, _0809C3A8 @ =0x00001259
	adds r7, r4, r1
	strb r2, [r7]
	mov r2, r8
	strb r2, [r7, 0x1]
	movs r0, 0xF
	strb r0, [r7, 0x2]
	movs r1, 0
	strb r1, [r7, 0x3]
	strb r6, [r7, 0x4]
	mov r2, r9
	strb r2, [r7, 0x5]
	mov r0, r10
	strb r0, [r7, 0x6]
	movs r6, 0x8
	strb r6, [r7, 0x7]
	ldr r1, _0809C3AC @ =0x00001261
	adds r7, r4, r1
	movs r0, 0x34
	strb r0, [r7]
	ldr r2, _0809C3B0 @ =0x00001262
	adds r7, r4, r2
	ldr r0, _0809C3B4 @ =0x000011f8
	adds r4, r0
	ldrb r1, [r4]
	adds r0, r7, 0
	movs r2, 0x22
	movs r3, 0x1
	bl sub_8072C14
	adds r7, r0, 0
	mov r1, r9
	strb r1, [r7]
	movs r0, 0x11
	strb r0, [r7, 0x1]
	strb r6, [r7, 0x2]
	adds r7, 0x3
	ldr r2, [sp]
	cmp r2, 0
	beq _0809C3B8
	cmp r2, 0xFE
	beq _0809C3D0
	b _0809C3EA
	.align 2, 0
_0809C388: .4byte gUnknown_083B6DB4
_0809C38C: .4byte 0x0000120f
_0809C390: .4byte 0x00001214
_0809C394: .4byte 0x000011fa
_0809C398: .4byte 0x00001234
_0809C39C: .4byte 0x0000123d
_0809C3A0: .4byte 0x000011f0
_0809C3A4: .4byte gSpeciesNames
_0809C3A8: .4byte 0x00001259
_0809C3AC: .4byte 0x00001261
_0809C3B0: .4byte 0x00001262
_0809C3B4: .4byte 0x000011f8
_0809C3B8:
	mov r0, r9
	strb r0, [r7]
	mov r1, r8
	strb r1, [r7, 0x1]
	strb r1, [r7, 0x2]
	mov r2, sp
	ldrb r2, [r2]
	strb r2, [r7, 0x3]
	movs r0, 0x5
	strb r0, [r7, 0x4]
	movs r0, 0xB5
	b _0809C3E6
_0809C3D0:
	mov r0, r9
	strb r0, [r7]
	mov r1, r8
	strb r1, [r7, 0x1]
	movs r0, 0x6
	strb r0, [r7, 0x2]
	movs r2, 0
	strb r2, [r7, 0x3]
	movs r0, 0x7
	strb r0, [r7, 0x4]
	movs r0, 0xB6
_0809C3E6:
	strb r0, [r7, 0x5]
	adds r7, 0x6
_0809C3EA:
	movs r5, 0xFF
	strb r5, [r7]
	ldr r0, _0809C450 @ =gUnknown_083B6DB4
	ldr r2, [r0]
	ldr r1, _0809C454 @ =0x0000127a
	adds r7, r2, r1
	ldr r0, _0809C458 @ =0x000011f2
	adds r3, r2, r0
	ldrh r0, [r3]
	cmp r0, 0
	beq _0809C43C
	movs r4, 0xFC
	strb r4, [r7]
	movs r1, 0x4
	strb r1, [r7, 0x1]
	movs r0, 0xF
	strb r0, [r7, 0x2]
	movs r0, 0
	strb r0, [r7, 0x3]
	movs r0, 0x1
	strb r0, [r7, 0x4]
	ldr r0, _0809C45C @ =0x0000127f
	adds r7, r2, r0
	strb r4, [r7]
	movs r0, 0x6
	strb r0, [r7, 0x1]
	strb r1, [r7, 0x2]
	ldr r1, _0809C460 @ =0x00001282
	adds r7, r2, r1
	ldrh r0, [r3]
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r7, 0
	bl StringCopy
	adds r7, r0, 0
	strb r4, [r7]
	movs r0, 0x7
	strb r0, [r7, 0x1]
	adds r7, 0x2
_0809C43C:
	strb r5, [r7]
_0809C43E:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C450: .4byte gUnknown_083B6DB4
_0809C454: .4byte 0x0000127a
_0809C458: .4byte 0x000011f2
_0809C45C: .4byte 0x0000127f
_0809C460: .4byte 0x00001282
	thumb_func_end sub_809C04C

	thumb_func_start sub_809C464
sub_809C464: @ 809C464
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _0809C4D8 @ =gUnknown_020384E4
	ldrb r0, [r0]
	mov r8, r0
	ldr r2, _0809C4DC @ =gUnknown_020384E5
	ldrb r4, [r2]
	ldr r0, _0809C4E0 @ =gUnknown_083B6DB4
	ldr r1, [r0]
	ldr r0, _0809C4E4 @ =0x000011de
	adds r7, r1, r0
	movs r0, 0
	strb r0, [r7]
	ldr r3, _0809C4E8 @ =0x000011df
	adds r5, r1, r3
	strb r0, [r5]
	adds r3, 0x4
	adds r6, r1, r3
	strb r0, [r6]
	ldr r0, _0809C4EC @ =gMain
	mov r12, r0
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	adds r3, r2, 0
	cmp r0, 0
	beq _0809C4A0
	b _0809C62A
_0809C4A0:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0809C4F0
	movs r1, 0x1
	mov r9, r1
	lsls r0, r4, 24
	movs r3, 0xC0
	lsls r3, 19
	adds r0, r3
	lsrs r4, r0, 24
	asrs r0, 24
	cmp r0, 0x1D
	bgt _0809C4BE
	b _0809C648
_0809C4BE:
	movs r1, 0x3
	mov r8, r1
	subs r0, 0x1E
	lsls r0, 24
	asrs r0, 24
	bl __divsi3
	lsls r0, 24
	lsrs r4, r0, 24
	mov r3, r9
	strb r3, [r7]
	strb r3, [r6]
	b _0809C648
	.align 2, 0
_0809C4D8: .4byte gUnknown_020384E4
_0809C4DC: .4byte gUnknown_020384E5
_0809C4E0: .4byte gUnknown_083B6DB4
_0809C4E4: .4byte 0x000011de
_0809C4E8: .4byte 0x000011df
_0809C4EC: .4byte gMain
_0809C4F0:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0809C524
	movs r0, 0x1
	mov r9, r0
	movs r0, 0
	ldrsb r0, [r3, r0]
	movs r1, 0x6
	bl __modsi3
	lsls r0, 24
	cmp r0, 0
	beq _0809C514
	lsls r0, r4, 24
	movs r1, 0xFF
	lsls r1, 24
	b _0809C63C
_0809C514:
	movs r0, 0xFF
	strb r0, [r5]
	lsls r0, r4, 24
	movs r3, 0xA0
	lsls r3, 19
	adds r0, r3
	lsrs r4, r0, 24
	b _0809C648
_0809C524:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0809C554
	movs r0, 0x1
	mov r9, r0
	movs r0, 0
	ldrsb r0, [r3, r0]
	adds r0, 0x1
	movs r1, 0x6
	bl __modsi3
	cmp r0, 0
	beq _0809C548
	lsls r0, r4, 24
	movs r1, 0x80
	lsls r1, 17
	b _0809C63C
_0809C548:
	mov r3, r9
	strb r3, [r5]
	lsls r0, r4, 24
	movs r1, 0xFB
	lsls r1, 24
	b _0809C63C
_0809C554:
	mov r3, r12
	ldrh r1, [r3, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0809C56A
	movs r0, 0x1
	mov r9, r0
	movs r1, 0x2
	mov r8, r1
	b _0809C646
_0809C56A:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809C5D4
	bl sub_809CAB0
	lsls r0, 24
	cmp r0, 0
	beq _0809C5D4
	ldr r0, _0809C588 @ =gUnknown_020384E9
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809C58C
	movs r0, 0x8
	b _0809C658
	.align 2, 0
_0809C588: .4byte gUnknown_020384E9
_0809C58C:
	movs r0, 0
	bl sub_809CE4C
	subs r0, 0x1
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x4
	bhi _0809C5D4
	lsls r0, 2
	ldr r1, _0809C5A8 @ =_0809C5AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809C5A8: .4byte _0809C5AC
	.align 2, 0
_0809C5AC:
	.4byte _0809C5C0
	.4byte _0809C5C4
	.4byte _0809C5C8
	.4byte _0809C5CC
	.4byte _0809C5D0
_0809C5C0:
	movs r0, 0xB
	b _0809C658
_0809C5C4:
	movs r0, 0xC
	b _0809C658
_0809C5C8:
	movs r0, 0xD
	b _0809C658
_0809C5CC:
	movs r0, 0xE
	b _0809C658
_0809C5D0:
	movs r0, 0xF
	b _0809C658
_0809C5D4:
	ldr r2, _0809C5E4 @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809C5E8
	movs r0, 0x10
	b _0809C658
	.align 2, 0
_0809C5E4: .4byte gMain
_0809C5E8:
	ldr r0, _0809C600 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _0809C612
	ldrh r1, [r2, 0x2C]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0809C604
	movs r0, 0xA
	b _0809C658
	.align 2, 0
_0809C600: .4byte gSaveBlock2
_0809C604:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _0809C612
	movs r0, 0x9
	b _0809C658
_0809C612:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0809C624
	bl sub_809CD88
	movs r0, 0
	b _0809C658
_0809C624:
	movs r3, 0
	mov r9, r3
	b _0809C656
_0809C62A:
	movs r0, 0x1
	mov r9, r0
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0x5
	ble _0809C642
	lsls r0, r4, 24
	movs r1, 0xFA
	lsls r1, 24
_0809C63C:
	adds r0, r1
	lsrs r4, r0, 24
	b _0809C648
_0809C642:
	movs r3, 0x2
	mov r8, r3
_0809C646:
	movs r4, 0
_0809C648:
	mov r0, r9
	cmp r0, 0
	beq _0809C656
	mov r0, r8
	adds r1, r4, 0
	bl sub_809AF18
_0809C656:
	mov r0, r9
_0809C658:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809C464

	thumb_func_start sub_809C664
sub_809C664: @ 809C664
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0809C6D8 @ =gUnknown_020384E4
	ldrb r0, [r0]
	mov r10, r0
	ldr r7, _0809C6DC @ =gUnknown_020384E5
	ldrb r4, [r7]
	ldr r2, _0809C6E0 @ =gUnknown_083B6DB4
	ldr r5, [r2]
	ldr r1, _0809C6E4 @ =0x000011df
	adds r0, r5, r1
	movs r1, 0
	strb r1, [r0]
	ldr r3, _0809C6E8 @ =0x000011de
	adds r0, r5, r3
	strb r1, [r0]
	adds r3, 0x5
	adds r0, r5, r3
	strb r1, [r0]
	mov r9, r1
	mov r8, r1
	ldr r1, _0809C6EC @ =gMain
	ldrh r3, [r1, 0x30]
	movs r0, 0x40
	ands r0, r3
	adds r6, r7, 0
	mov r12, r2
	adds r2, r1, 0
	cmp r0, 0
	beq _0809C6A8
	b _0809C81C
_0809C6A8:
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _0809C6F0
	lsls r0, r4, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r4, r0, 24
	asrs r0, 24
	cmp r0, 0x6
	ble _0809C6C2
	movs r4, 0
_0809C6C2:
	lsls r0, r4, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r6, r1]
	cmp r0, r1
	bne _0809C6D0
	b _0809C83C
_0809C6D0:
	movs r2, 0x1
	mov r8, r2
	b _0809C842
	.align 2, 0
_0809C6D8: .4byte gUnknown_020384E4
_0809C6DC: .4byte gUnknown_020384E5
_0809C6E0: .4byte gUnknown_083B6DB4
_0809C6E4: .4byte 0x000011df
_0809C6E8: .4byte 0x000011de
_0809C6EC: .4byte gMain
_0809C6F0:
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _0809C714
	ldrb r1, [r6]
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r0, 0
	beq _0809C714
	movs r3, 0x1
	mov r8, r3
	ldr r2, _0809C710 @ =0x000011e2
	adds r0, r5, r2
	strb r1, [r0]
	movs r4, 0
	b _0809C83C
	.align 2, 0
_0809C710: .4byte 0x000011e2
_0809C714:
	ldrh r1, [r2, 0x30]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0809C748
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r0, 0
	bne _0809C73C
	movs r3, 0x1
	mov r8, r3
	mov r1, r12
	ldr r0, [r1]
	ldr r2, _0809C738 @ =0x000011e2
	adds r0, r2
	ldrb r4, [r0]
	b _0809C83C
	.align 2, 0
_0809C738: .4byte 0x000011e2
_0809C73C:
	movs r3, 0x6
	mov r8, r3
	movs r0, 0
	mov r10, r0
	movs r4, 0
	b _0809C83C
_0809C748:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809C7D0
	movs r0, 0
	ldrsb r0, [r6, r0]
	cmp r0, 0x6
	bne _0809C76E
	mov r1, r12
	ldr r0, [r1]
	ldrb r0, [r0, 0x5]
	cmp r0, 0x1
	bne _0809C768
	movs r0, 0x4
	b _0809C84C
_0809C768:
	movs r2, 0x1
	mov r9, r2
	b _0809C7D0
_0809C76E:
	bl sub_809CAB0
	lsls r0, 24
	cmp r0, 0
	beq _0809C7D0
	ldr r0, _0809C784 @ =gUnknown_020384E9
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809C788
	movs r0, 0x8
	b _0809C84C
	.align 2, 0
_0809C784: .4byte gUnknown_020384E9
_0809C788:
	movs r0, 0
	bl sub_809CE4C
	subs r0, 0x1
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x4
	bhi _0809C7D0
	lsls r0, 2
	ldr r1, _0809C7A4 @ =_0809C7A8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809C7A4: .4byte _0809C7A8
	.align 2, 0
_0809C7A8:
	.4byte _0809C7BC
	.4byte _0809C7C0
	.4byte _0809C7C4
	.4byte _0809C7C8
	.4byte _0809C7CC
_0809C7BC:
	movs r0, 0xB
	b _0809C84C
_0809C7C0:
	movs r0, 0xC
	b _0809C84C
_0809C7C4:
	movs r0, 0xD
	b _0809C84C
_0809C7C8:
	movs r0, 0xE
	b _0809C84C
_0809C7CC:
	movs r0, 0xF
	b _0809C84C
_0809C7D0:
	ldr r2, _0809C7EC @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809C7F8
	ldr r0, _0809C7F0 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	cmp r0, 0x1
	bne _0809C7F4
	movs r0, 0x10
	b _0809C84C
	.align 2, 0
_0809C7EC: .4byte gMain
_0809C7F0: .4byte gUnknown_083B6DB4
_0809C7F4:
	movs r3, 0x1
	mov r9, r3
_0809C7F8:
	mov r0, r9
	cmp r0, 0
	beq _0809C80A
	movs r1, 0x6
	mov r8, r1
	movs r2, 0
	mov r10, r2
	movs r4, 0
	b _0809C83C
_0809C80A:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0809C83C
	bl sub_809CD88
	movs r0, 0
	b _0809C84C
_0809C81C:
	lsls r0, r4, 24
	movs r3, 0xFF
	lsls r3, 24
	adds r0, r3
	lsrs r4, r0, 24
	cmp r0, 0
	bge _0809C82C
	movs r4, 0x6
_0809C82C:
	lsls r0, r4, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r7, r1]
	cmp r0, r1
	beq _0809C83C
	movs r0, 0x1
	mov r8, r0
_0809C83C:
	mov r1, r8
	cmp r1, 0
	beq _0809C84A
_0809C842:
	mov r0, r10
	adds r1, r4, 0
	bl sub_809AF18
_0809C84A:
	mov r0, r8
_0809C84C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809C664

	thumb_func_start sub_809C85C
sub_809C85C: @ 809C85C
	push {r4-r6,lr}
	ldr r0, _0809C894 @ =gUnknown_083B6DB4
	ldr r2, [r0]
	ldr r1, _0809C898 @ =0x000011df
	adds r0, r2, r1
	movs r1, 0
	strb r1, [r0]
	ldr r3, _0809C89C @ =0x000011de
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _0809C8A0 @ =0x000011e3
	adds r2, r0
	strb r1, [r2]
	ldr r1, _0809C8A4 @ =gMain
	ldrh r3, [r1, 0x30]
	movs r0, 0x40
	ands r0, r3
	cmp r0, 0
	bne _0809C91A
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _0809C8A8
	movs r4, 0x1
	movs r0, 0
	movs r5, 0x2
	b _0809C922
	.align 2, 0
_0809C894: .4byte gUnknown_083B6DB4
_0809C898: .4byte 0x000011df
_0809C89C: .4byte 0x000011de
_0809C8A0: .4byte 0x000011e3
_0809C8A4: .4byte gMain
_0809C8A8:
	ldrh r2, [r1, 0x2C]
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	bne _0809C8CC
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	bne _0809C8DE
	ldr r0, _0809C8D0 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _0809C8E2
	movs r0, 0x80
	lsls r0, 2
	ands r0, r2
	cmp r0, 0
	beq _0809C8D4
_0809C8CC:
	movs r0, 0xA
	b _0809C93E
	.align 2, 0
_0809C8D0: .4byte gSaveBlock2
_0809C8D4:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r2
	cmp r0, 0
	beq _0809C8E2
_0809C8DE:
	movs r0, 0x9
	b _0809C93E
_0809C8E2:
	ldrh r1, [r1, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809C8FA
	movs r0, 0
	bl sub_809A860
	bl sub_809CA8C
	movs r0, 0x7
	b _0809C93E
_0809C8FA:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809C906
	movs r0, 0x10
	b _0809C93E
_0809C906:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0809C916
	bl sub_809CD88
	movs r0, 0
	b _0809C93E
_0809C916:
	movs r4, 0
	b _0809C93C
_0809C91A:
	movs r4, 0x1
	movs r0, 0x3
	movs r5, 0
	strb r4, [r2]
_0809C922:
	cmp r4, 0
	beq _0809C93C
	lsls r6, r0, 24
	cmp r0, 0x2
	beq _0809C932
	movs r0, 0
	bl sub_809A860
_0809C932:
	lsrs r0, r6, 24
	lsls r1, r5, 24
	lsrs r1, 24
	bl sub_809AF18
_0809C93C:
	adds r0, r4, 0
_0809C93E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_809C85C

	thumb_func_start sub_809C944
sub_809C944: @ 809C944
	push {r4-r7,lr}
	ldr r0, _0809C988 @ =gUnknown_020384E4
	ldrb r0, [r0]
	mov r12, r0
	ldr r7, _0809C98C @ =gUnknown_020384E5
	ldrb r3, [r7]
	ldr r0, _0809C990 @ =gUnknown_083B6DB4
	ldr r1, [r0]
	ldr r0, _0809C994 @ =0x000011df
	adds r5, r1, r0
	movs r0, 0
	strb r0, [r5]
	ldr r2, _0809C998 @ =0x000011de
	adds r4, r1, r2
	strb r0, [r4]
	adds r2, 0x5
	adds r1, r2
	strb r0, [r1]
	ldr r6, _0809C99C @ =gMain
	ldrh r2, [r6, 0x30]
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	bne _0809CA14
	movs r0, 0x88
	ands r0, r2
	cmp r0, 0
	beq _0809C9A0
	movs r6, 0x1
	movs r0, 0x2
	mov r12, r0
	movs r3, 0
	b _0809CA2A
	.align 2, 0
_0809C988: .4byte gUnknown_020384E4
_0809C98C: .4byte gUnknown_020384E5
_0809C990: .4byte gUnknown_083B6DB4
_0809C994: .4byte 0x000011df
_0809C998: .4byte 0x000011de
_0809C99C: .4byte gMain
_0809C9A0:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _0809C9C0
	movs r6, 0x1
	lsls r0, r3, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r3, r0, 24
	cmp r0, 0
	bge _0809CA2C
	movs r0, 0xFF
	strb r0, [r5]
	movs r3, 0x1
	b _0809CA2C
_0809C9C0:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _0809C9E0
	movs r6, 0x1
	lsls r0, r3, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x1
	ble _0809CA2C
	strb r6, [r5]
	movs r3, 0
	b _0809CA2C
_0809C9E0:
	ldrh r1, [r6, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809C9F4
	movs r0, 0x4
	cmp r3, 0
	bne _0809CA3A
	movs r0, 0x5
	b _0809CA3A
_0809C9F4:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809CA00
	movs r0, 0x10
	b _0809CA3A
_0809CA00:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0809CA10
	bl sub_809CD88
	movs r0, 0
	b _0809CA3A
_0809CA10:
	movs r6, 0
	b _0809CA38
_0809CA14:
	movs r6, 0x1
	movs r0, 0
	mov r12, r0
	movs r0, 0xFF
	strb r0, [r4]
	movs r0, 0
	ldrsb r0, [r7, r0]
	movs r3, 0x1D
	cmp r0, 0
	bne _0809CA2A
	movs r3, 0x18
_0809CA2A:
	strb r6, [r1]
_0809CA2C:
	cmp r6, 0
	beq _0809CA38
	mov r0, r12
	adds r1, r3, 0
	bl sub_809AF18
_0809CA38:
	adds r0, r6, 0
_0809CA3A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809C944

	thumb_func_start sub_809CA40
sub_809CA40: @ 809CA40
	push {r4,r5,lr}
	movs r3, 0
	ldr r0, _0809CA6C @ =gUnknown_083BBBD4
	ldr r1, [r0]
	adds r4, r0, 0
	cmp r1, 0
	beq _0809CA84
	ldr r5, _0809CA70 @ =gUnknown_020384E4
_0809CA50:
	lsls r0, r3, 3
	adds r2, r0, r4
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bne _0809CA74
	ldr r0, [r2]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	b _0809CA86
	.align 2, 0
_0809CA6C: .4byte gUnknown_083BBBD4
_0809CA70: .4byte gUnknown_020384E4
_0809CA74:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r0, r3, 3
	adds r0, r4
	ldr r0, [r0]
	cmp r0, 0
	bne _0809CA50
_0809CA84:
	movs r0, 0
_0809CA86:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809CA40

	thumb_func_start sub_809CA8C
sub_809CA8C: @ 809CA8C
	push {lr}
	bl sub_809CDCC
	movs r0, 0x9
	bl sub_809CDEC
	movs r0, 0xA
	bl sub_809CDEC
	movs r0, 0xB
	bl sub_809CDEC
	movs r0, 0
	bl sub_809CDEC
	pop {r0}
	bx r0
	thumb_func_end sub_809CA8C

	thumb_func_start sub_809CAB0
sub_809CAB0: @ 809CAB0
	push {lr}
	bl sub_809CDCC
	bl sub_809AB8C
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _0809CAD4 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	cmp r0, 0x1
	beq _0809CADE
	cmp r0, 0x1
	bgt _0809CAD8
	cmp r0, 0
	beq _0809CAEA
	b _0809CB24
	.align 2, 0
_0809CAD4: .4byte gUnknown_083B6DB4
_0809CAD8:
	cmp r0, 0x2
	beq _0809CAF6
	b _0809CB24
_0809CADE:
	cmp r1, 0
	beq _0809CB24
	movs r0, 0x1
	bl sub_809CDEC
	b _0809CB28
_0809CAEA:
	cmp r1, 0
	beq _0809CB24
	movs r0, 0x2
	bl sub_809CDEC
	b _0809CB28
_0809CAF6:
	ldr r0, _0809CB0C @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809CB18
	cmp r1, 0
	beq _0809CB10
	movs r0, 0x4
	bl sub_809CDEC
	b _0809CB28
	.align 2, 0
_0809CB0C: .4byte gUnknown_020384E6
_0809CB10:
	movs r0, 0x5
	bl sub_809CDEC
	b _0809CB28
_0809CB18:
	cmp r1, 0
	beq _0809CB24
	movs r0, 0x3
	bl sub_809CDEC
	b _0809CB28
_0809CB24:
	movs r0, 0
	b _0809CB6E
_0809CB28:
	movs r0, 0x6
	bl sub_809CDEC
	ldr r0, _0809CB4C @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldrb r0, [r0, 0x5]
	cmp r0, 0x2
	bne _0809CB5A
	ldr r0, _0809CB50 @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	bne _0809CB54
	movs r0, 0x2
	bl sub_809CDEC
	b _0809CB5A
	.align 2, 0
_0809CB4C: .4byte gUnknown_083B6DB4
_0809CB50: .4byte gUnknown_020384E4
_0809CB54:
	movs r0, 0x1
	bl sub_809CDEC
_0809CB5A:
	movs r0, 0x8
	bl sub_809CDEC
	movs r0, 0x7
	bl sub_809CDEC
	movs r0, 0
	bl sub_809CDEC
	movs r0, 0x1
_0809CB6E:
	pop {r1}
	bx r1
	thumb_func_end sub_809CAB0

	thumb_func_start sub_809CB74
sub_809CB74: @ 809CB74
	ldr r1, _0809CB90 @ =gUnknown_083B6DB4
	ldr r1, [r1]
	movs r2, 0x8E
	lsls r2, 5
	adds r1, r2
	ldr r2, [r1]
	ldrh r2, [r2, 0x20]
	strh r2, [r0, 0x20]
	ldr r1, [r1]
	ldrh r1, [r1, 0x22]
	adds r1, 0x14
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_0809CB90: .4byte gUnknown_083B6DB4
	thumb_func_end sub_809CB74

	thumb_func_start unref_sub_809CB94
unref_sub_809CB94: @ 809CB94
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0809CBBC @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809CBC8
	ldr r2, _0809CBC0 @ =gPlayerParty
	ldr r0, _0809CBC4 @ =gUnknown_020384E5
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x64
	muls r1, r0
	adds r1, r2
	adds r0, r4, 0
	movs r2, 0x50
	bl memcpy
	b _0809CBF6
	.align 2, 0
_0809CBBC: .4byte gUnknown_020384E4
_0809CBC0: .4byte gPlayerParty
_0809CBC4: .4byte gUnknown_020384E5
_0809CBC8:
	bl get_preferred_box
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0809CBFC @ =gPokemonStorage
	ldr r1, _0809CC00 @ =gUnknown_020384E5
	movs r2, 0
	ldrsb r2, [r1, r2]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	lsls r2, r0, 2
	adds r2, r0
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 5
	adds r1, r0
	adds r1, r3
	adds r1, 0x4
	adds r0, r4, 0
	movs r2, 0x50
	bl memcpy
_0809CBF6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CBFC: .4byte gPokemonStorage
_0809CC00: .4byte gUnknown_020384E5
	thumb_func_end unref_sub_809CB94

	thumb_func_start sub_809CC04
sub_809CC04: @ 809CC04
	push {r4-r7,lr}
	sub sp, 0x34
	mov r1, sp
	ldr r0, _0809CCB0 @ =gHandCursorSpriteSheets
	ldm r0!, {r2-r4}
	stm r1!, {r2-r4}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	add r4, sp, 0x18
	adds r1, r4, 0
	ldr r0, _0809CCB4 @ =gHandCursorSpritePalettes
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	mov r0, sp
	bl LoadSpriteSheets
	adds r0, r4, 0
	bl LoadSpritePalettes
	ldr r0, _0809CCB8 @ =0x0000dac6
	bl IndexOfSpritePaletteTag
	ldr r1, _0809CCBC @ =gUnknown_083B6DB4
	ldr r6, [r1]
	ldr r4, _0809CCC0 @ =0x000011e4
	adds r7, r6, r4
	strb r0, [r7]
	ldr r0, _0809CCC4 @ =0x0000dad1
	bl IndexOfSpritePaletteTag
	ldr r5, _0809CCC8 @ =0x000011e5
	adds r1, r6, r5
	strb r0, [r1]
	ldr r0, _0809CCCC @ =gUnknown_020384E4
	ldrb r0, [r0]
	ldr r1, _0809CCD0 @ =gUnknown_020384E5
	ldrb r1, [r1]
	add r4, sp, 0x30
	mov r5, sp
	adds r5, 0x32
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_809AACC
	ldr r0, _0809CCD4 @ =gSpriteTemplate_83BBC70
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0
	ldrsh r2, [r5, r3]
	movs r3, 0x6
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0809CCE4
	movs r5, 0x8E
	lsls r5, 5
	adds r4, r6, r5
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r0, _0809CCD8 @ =gSprites
	adds r1, r0
	str r1, [r4]
	ldr r0, _0809CCDC @ =gUnknown_020384E9
	ldrb r0, [r0]
	adds r0, r7, r0
	ldrb r2, [r0]
	lsls r2, 4
	ldrb r3, [r1, 0x5]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldr r0, _0809CCE0 @ =gUnknown_020384E6
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809CCEE
	ldr r0, [r4]
	movs r1, 0x3
	bl StartSpriteAnim
	b _0809CCEE
	.align 2, 0
_0809CCB0: .4byte gHandCursorSpriteSheets
_0809CCB4: .4byte gHandCursorSpritePalettes
_0809CCB8: .4byte 0x0000dac6
_0809CCBC: .4byte gUnknown_083B6DB4
_0809CCC0: .4byte 0x000011e4
_0809CCC4: .4byte 0x0000dad1
_0809CCC8: .4byte 0x000011e5
_0809CCCC: .4byte gUnknown_020384E4
_0809CCD0: .4byte gUnknown_020384E5
_0809CCD4: .4byte gSpriteTemplate_83BBC70
_0809CCD8: .4byte gSprites
_0809CCDC: .4byte gUnknown_020384E9
_0809CCE0: .4byte gUnknown_020384E6
_0809CCE4:
	movs r0, 0x8E
	lsls r0, 5
	adds r1, r6, r0
	movs r0, 0
	str r0, [r1]
_0809CCEE:
	ldr r0, _0809CD00 @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0809CD04
	movs r3, 0xC
	movs r5, 0x1
	b _0809CD08
	.align 2, 0
_0809CD00: .4byte gUnknown_020384E4
_0809CD04:
	movs r3, 0x14
	movs r5, 0x2
_0809CD08:
	ldr r0, _0809CD58 @ =gSpriteTemplate_83BBC88
	movs r1, 0
	movs r2, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0809CD6C
	ldr r0, _0809CD5C @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r1, _0809CD60 @ =0x000011c4
	adds r4, r0, r1
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	ldr r0, _0809CD64 @ =gSprites
	adds r1, r0
	str r1, [r4]
	lsls r3, r5, 2
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldr r0, _0809CD68 @ =gUnknown_020384E4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _0809CD78
	ldr r0, [r4]
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0809CD78
	.align 2, 0
_0809CD58: .4byte gSpriteTemplate_83BBC88
_0809CD5C: .4byte gUnknown_083B6DB4
_0809CD60: .4byte 0x000011c4
_0809CD64: .4byte gSprites
_0809CD68: .4byte gUnknown_020384E4
_0809CD6C:
	ldr r0, _0809CD80 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r2, _0809CD84 @ =0x000011c4
	adds r0, r2
	movs r1, 0
	str r1, [r0]
_0809CD78:
	add sp, 0x34
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CD80: .4byte gUnknown_083B6DB4
_0809CD84: .4byte 0x000011c4
	thumb_func_end sub_809CC04

	thumb_func_start sub_809CD88
sub_809CD88: @ 809CD88
	push {lr}
	ldr r2, _0809CDC0 @ =gUnknown_020384E9
	movs r1, 0
	ldrb r0, [r2]
	cmp r0, 0
	bne _0809CD96
	movs r1, 0x1
_0809CD96:
	strb r1, [r2]
	ldr r0, _0809CDC4 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	movs r3, 0x8E
	lsls r3, 5
	adds r1, r0, r3
	ldr r3, [r1]
	ldr r1, _0809CDC8 @ =0x000011e4
	adds r0, r1
	ldrb r2, [r2]
	adds r0, r2
	ldrb r1, [r0]
	lsls r1, 4
	ldrb r2, [r3, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	pop {r0}
	bx r0
	.align 2, 0
_0809CDC0: .4byte gUnknown_020384E9
_0809CDC4: .4byte gUnknown_083B6DB4
_0809CDC8: .4byte 0x000011e4
	thumb_func_end sub_809CD88

	thumb_func_start sub_809CDCC
sub_809CDCC: @ 809CDCC
	ldr r0, _0809CDE0 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	ldr r2, _0809CDE4 @ =0x000011b8
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r1, _0809CDE8 @ =0x000011b9
	adds r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0809CDE0: .4byte gUnknown_083B6DB4
_0809CDE4: .4byte 0x000011b8
_0809CDE8: .4byte 0x000011b9
	thumb_func_end sub_809CDCC

	thumb_func_start sub_809CDEC
sub_809CDEC: @ 809CDEC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0809CE3C @ =gUnknown_083B6DB4
	ldr r5, [r0]
	ldr r0, _0809CE40 @ =0x000011b8
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0x6
	bhi _0809CE36
	adds r1, r0, 0
	lsls r1, 3
	movs r2, 0x8C
	lsls r2, 5
	adds r1, r2
	adds r1, r5, r1
	ldr r2, _0809CE44 @ =gUnknown_083BBCA0
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r1]
	str r3, [r1, 0x4]
	bl sub_8072CA4
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0x7
	lsrs r1, 3
	ldr r2, _0809CE48 @ =0x000011b9
	adds r0, r5, r2
	ldrb r2, [r0]
	cmp r1, r2
	bls _0809CE30
	strb r1, [r0]
_0809CE30:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_0809CE36:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809CE3C: .4byte gUnknown_083B6DB4
_0809CE40: .4byte 0x000011b8
_0809CE44: .4byte gUnknown_083BBCA0
_0809CE48: .4byte 0x000011b9
	thumb_func_end sub_809CDEC

	thumb_func_start sub_809CE4C
sub_809CE4C: @ 809CE4C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0809CE70 @ =gUnknown_083B6DB4
	ldr r1, [r0]
	ldr r3, _0809CE74 @ =0x000011b8
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r2, r0
	bcs _0809CE7C
	lsls r0, r2, 3
	ldr r2, _0809CE78 @ =0x00001184
	adds r1, r2
	adds r1, r0
	movs r0, 0
	ldrsb r0, [r1, r0]
	b _0809CE80
	.align 2, 0
_0809CE70: .4byte gUnknown_083B6DB4
_0809CE74: .4byte 0x000011b8
_0809CE78: .4byte 0x00001184
_0809CE7C:
	movs r0, 0x1
	negs r0, r0
_0809CE80:
	pop {r1}
	bx r1
	thumb_func_end sub_809CE4C

	thumb_func_start sub_809CE84
sub_809CE84: @ 809CE84
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	ldr r0, _0809CF20 @ =gUnknown_083B6DB4
	ldr r4, [r0]
	ldr r0, _0809CF24 @ =0x000011b8
	adds r0, r4
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0xE
	subs r1, r0
	ldr r3, _0809CF28 @ =0x000011bc
	adds r6, r4, r3
	movs r0, 0
	mov r10, r0
	strh r1, [r6]
	ldr r1, _0809CF2C @ =0x000011b9
	adds r1, r4
	mov r9, r1
	ldrb r1, [r1]
	movs r0, 0x1C
	subs r0, r1
	subs r3, 0x2
	adds r5, r4, r3
	strh r0, [r5]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r6]
	movs r2, 0x1D
	movs r3, 0xF
	bl MenuDrawTextWindow
	ldrb r0, [r5]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r6]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	mov r3, r8
	ldrb r2, [r3]
	movs r3, 0x8C
	lsls r3, 5
	adds r4, r3
	adds r3, r4, 0
	bl PrintMenuItems
	ldrb r1, [r5]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r6]
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	mov r4, r8
	ldrb r3, [r4]
	mov r0, r10
	str r0, [sp]
	mov r4, r9
	ldrb r0, [r4]
	str r0, [sp, 0x4]
	movs r0, 0
	bl InitMenu
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809CF20: .4byte gUnknown_083B6DB4
_0809CF24: .4byte 0x000011b8
_0809CF28: .4byte 0x000011bc
_0809CF2C: .4byte 0x000011b9
	thumb_func_end sub_809CE84

	thumb_func_start sub_809CF30
sub_809CF30: @ 809CF30
	push {r4,r5,lr}
	movs r5, 0x2
	negs r5, r5
	ldr r4, _0809CF6C @ =gMain
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0809CF86
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809CF52
	movs r0, 0x5
	bl PlaySE
	adds r5, 0x1
_0809CF52:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0809CF70
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _0809CF8E
	.align 2, 0
_0809CF6C: .4byte gMain
_0809CF70:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0809CF8E
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _0809CF8E
_0809CF86:
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r5, r0, 24
_0809CF8E:
	movs r0, 0x2
	negs r0, r0
	cmp r5, r0
	beq _0809CFB2
	bl sub_8072DEC
	ldr r0, _0809CFD0 @ =gUnknown_083B6DB4
	ldr r1, [r0]
	ldr r2, _0809CFD4 @ =0x000011ba
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	movs r2, 0x1D
	movs r3, 0xF
	bl MenuZeroFillWindowRect
_0809CFB2:
	cmp r5, 0
	blt _0809CFC4
	ldr r0, _0809CFD0 @ =gUnknown_083B6DB4
	ldr r0, [r0]
	lsls r1, r5, 3
	ldr r2, _0809CFD8 @ =0x00001184
	adds r0, r2
	adds r0, r1
	ldr r5, [r0]
_0809CFC4:
	lsls r0, r5, 16
	asrs r0, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809CFD0: .4byte gUnknown_083B6DB4
_0809CFD4: .4byte 0x000011ba
_0809CFD8: .4byte 0x00001184
	thumb_func_end sub_809CF30

	thumb_func_start sub_809CFDC
sub_809CFDC: @ 809CFDC
	ldr r3, _0809CFEC @ =gUnknown_020384EC
	str r0, [r3]
	str r1, [r0]
	movs r1, 0
	strb r2, [r0, 0x5]
	strb r1, [r0, 0x4]
	bx lr
	.align 2, 0
_0809CFEC: .4byte gUnknown_020384EC
	thumb_func_end sub_809CFDC

	thumb_func_start sub_809CFF0
sub_809CFF0: @ 809CFF0
	push {r4,r5,lr}
	ldr r2, _0809D030 @ =gUnknown_020384EC
	ldr r1, [r2]
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _0809D02A
	movs r4, 0
	ldrb r1, [r1, 0x4]
	cmp r4, r1
	bcs _0809D022
	adds r5, r2, 0
_0809D006:
	ldr r0, [r5]
	lsls r1, r4, 4
	ldr r0, [r0]
	adds r0, r1
	ldr r1, [r0, 0xC]
	bl _call_via_r1
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, [r5]
	ldrb r0, [r0, 0x4]
	cmp r4, r0
	bcc _0809D006
_0809D022:
	ldr r0, _0809D030 @ =gUnknown_020384EC
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x4]
_0809D02A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D030: .4byte gUnknown_020384EC
	thumb_func_end sub_809CFF0

	thumb_func_start sub_809D034
sub_809D034: @ 809D034
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r8, r0
	mov r9, r3
	ldr r0, [sp, 0x20]
	ldr r3, [sp, 0x24]
	ldr r4, [sp, 0x28]
	ldr r5, [sp, 0x2C]
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	lsls r3, 16
	lsrs r3, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _0809D0A4 @ =gUnknown_020384EC
	ldr r2, [r0]
	ldrb r0, [r2, 0x4]
	adds r1, r0, 0
	ldrb r7, [r2, 0x5]
	cmp r1, r7
	bcs _0809D0AC
	adds r0, 0x1
	strb r0, [r2, 0x4]
	lsls r0, r1, 4
	ldr r2, [r2]
	adds r2, r0
	lsls r0, r4, 1
	strh r0, [r2, 0x8]
	lsls r0, r6, 6
	add r0, r8
	mov r4, r10
	lsls r1, r4, 1
	adds r0, r1
	str r0, [r2, 0x4]
	lsls r0, r3, 6
	add r0, r9
	mov r7, r12
	lsls r1, r7, 1
	adds r0, r1
	str r0, [r2]
	strh r5, [r2, 0xA]
	ldr r0, _0809D0A8 @ =sub_809D0BC
	str r0, [r2, 0xC]
	movs r0, 0x1
	b _0809D0AE
	.align 2, 0
_0809D0A4: .4byte gUnknown_020384EC
_0809D0A8: .4byte sub_809D0BC
_0809D0AC:
	movs r0, 0
_0809D0AE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809D034

	thumb_func_start sub_809D0BC
sub_809D0BC: @ 809D0BC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r6, [r0]
	ldr r5, [r0, 0x4]
	ldrh r7, [r0, 0xA]
	ldrh r2, [r0, 0x8]
	movs r4, 0
	cmp r4, r7
	bcs _0809D0F2
	lsrs r2, 1
	mov r8, r2
	ldr r0, _0809D100 @ =0x001fffff
	mov r9, r0
_0809D0DA:
	adds r0, r6, 0
	adds r1, r5, 0
	mov r2, r8
	mov r3, r9
	ands r2, r3
	bl CpuSet
	adds r5, 0x40
	adds r6, 0x40
	adds r4, 0x1
	cmp r4, r7
	bcc _0809D0DA
_0809D0F2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D100: .4byte 0x001fffff
	thumb_func_end sub_809D0BC

	thumb_func_start sub_809D104
sub_809D104: @ 809D104
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r5, [sp, 0x18]
	ldr r4, [sp, 0x1C]
	ldr r6, [sp, 0x20]
	mov r8, r6
	ldr r6, [sp, 0x24]
	lsls r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r5, 16
	lsls r4, 16
	mov r7, r8
	lsls r7, 16
	lsls r6, 16
	lsrs r6, 16
	lsrs r4, 10
	adds r3, r4
	lsrs r5, 15
	adds r5, r3, r5
	lsls r3, r2, 6
	adds r3, r0, r3
	lsrs r1, 15
	adds r4, r3, r1
	adds r2, r6
	lsls r2, 6
	adds r6, r0, r2
	lsrs r2, r7, 15
	cmp r4, r6
	bcs _0809D15C
	lsrs r7, r2, 1
	ldr r0, _0809D168 @ =0x001fffff
	mov r8, r0
_0809D148:
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, r8
	ands r2, r7
	bl CpuSet
	adds r4, 0x40
	adds r5, 0x40
	cmp r4, r6
	bcc _0809D148
_0809D15C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D168: .4byte 0x001fffff
	thumb_func_end sub_809D104

	thumb_func_start sub_809D16C
sub_809D16C: @ 809D16C
	push {r4-r7,lr}
	mov r12, r0
	ldr r0, [sp, 0x14]
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _0809D1B4 @ =gUnknown_020384EC
	ldr r1, [r0]
	ldrb r0, [r1, 0x4]
	adds r2, r0, 0
	ldrb r7, [r1, 0x5]
	cmp r2, r7
	bcs _0809D1BC
	adds r0, 0x1
	strb r0, [r1, 0x4]
	lsls r0, r2, 4
	ldr r1, [r1]
	adds r1, r0
	lsls r0, r3, 1
	strh r0, [r1, 0x8]
	lsls r0, r4, 5
	adds r0, r6
	lsls r0, 1
	add r0, r12
	str r0, [r1, 0x4]
	strh r5, [r1, 0xA]
	ldr r0, _0809D1B8 @ =sub_809D1C4
	str r0, [r1, 0xC]
	movs r0, 0x1
	b _0809D1BE
	.align 2, 0
_0809D1B4: .4byte gUnknown_020384EC
_0809D1B8: .4byte sub_809D1C4
_0809D1BC:
	movs r0, 0
_0809D1BE:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809D16C

	thumb_func_start sub_809D1C4
sub_809D1C4: @ 809D1C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r6, r0, 0
	movs r0, 0
	ldrh r1, [r6, 0xA]
	cmp r0, r1
	bcs _0809D252
	movs r7, 0x80
	lsls r7, 5
	mov r5, sp
	ldr r2, _0809D210 @ =0x040000d4
	mov r8, r2
	movs r1, 0x81
	lsls r1, 24
	mov r10, r1
_0809D1EA:
	ldr r2, [r6, 0x4]
	ldrh r3, [r6, 0x8]
	mov r12, r2
	adds r0, 0x1
	mov r9, r0
	cmp r3, r7
	bhi _0809D214
	movs r0, 0
	strh r0, [r5]
	mov r2, sp
	mov r0, r8
	str r2, [r0]
	mov r1, r12
	str r1, [r0, 0x4]
	lsrs r0, r3, 1
	mov r2, r10
	orrs r0, r2
	mov r1, r8
	b _0809D23C
	.align 2, 0
_0809D210: .4byte 0x040000d4
_0809D214:
	movs r4, 0
	strh r4, [r5]
	ldr r1, _0809D264 @ =0x040000d4
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _0809D268 @ =0x81000800
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r7
	subs r3, r7
	cmp r3, r7
	bhi _0809D214
	strh r4, [r5]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r10
	orrs r0, r2
_0809D23C:
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, r12
	adds r0, 0x40
	str r0, [r6, 0x4]
	mov r1, r9
	lsls r0, r1, 16
	lsrs r0, 16
	ldrh r2, [r6, 0xA]
	cmp r0, r2
	bcc _0809D1EA
_0809D252:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D264: .4byte 0x040000d4
_0809D268: .4byte 0x81000800
	thumb_func_end sub_809D1C4

	.align 2, 0 @ Don't pad with nop.
