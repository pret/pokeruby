	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8077ABC
sub_8077ABC: @ 8077ABC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077ADA
	cmp r4, 0x3
	bne _08077ADA
	cmp r5, 0x3
	bne _08077ADA
	movs r4, 0x1
_08077ADA:
	cmp r4, 0x4
	bhi _08077B50
	lsls r0, r4, 2
	ldr r1, _08077AE8 @ =_08077AEC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08077AE8: .4byte _08077AEC
	.align 2, 0
_08077AEC:
	.4byte _08077B00
	.4byte _08077B28
	.4byte _08077B00
	.4byte _08077B50
	.4byte _08077B50
_08077B00:
	ldr r4, _08077B20 @ =gUnknown_0837F578
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _08077B24 @ =gUnknown_020239F8
	ldrh r2, [r1]
	movs r1, 0x1
	ands r1, r2
	lsls r1, 4
	adds r0, r1
	adds r0, r4
	ldrb r0, [r0]
	b _08077BF4
	.align 2, 0
_08077B20: .4byte gUnknown_0837F578
_08077B24: .4byte gUnknown_020239F8
_08077B28:
	ldr r4, _08077B48 @ =gUnknown_0837F578
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _08077B4C @ =gUnknown_020239F8
	ldrh r2, [r1]
	movs r1, 0x1
	ands r1, r2
	lsls r1, 4
	adds r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x1]
	b _08077BF4
	.align 2, 0
_08077B48: .4byte gUnknown_0837F578
_08077B4C: .4byte gUnknown_020239F8
_08077B50:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077B74
	ldr r2, _08077B6C @ =0x02019348
	ldrb r1, [r2, 0x4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08077B70
	ldrh r1, [r2, 0x2]
	b _08077BDE
	.align 2, 0
_08077B6C: .4byte 0x02019348
_08077B70:
	ldrh r1, [r2]
	b _08077BDE
_08077B74:
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08077BA8
	lsls r0, r5, 2
	ldr r1, _08077B9C @ =0x02017800
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08077BDC
	ldr r1, _08077BA0 @ =gUnknown_02024A6A
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08077BA4 @ =gEnemyParty
	b _08077BC2
	.align 2, 0
_08077B9C: .4byte 0x02017800
_08077BA0: .4byte gUnknown_02024A6A
_08077BA4: .4byte gEnemyParty
_08077BA8:
	lsls r0, r5, 2
	ldr r1, _08077BD0 @ =0x02017800
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08077BDC
	ldr r1, _08077BD4 @ =gUnknown_02024A6A
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08077BD8 @ =gPlayerParty
_08077BC2:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	b _08077BDE
	.align 2, 0
_08077BD0: .4byte 0x02017800
_08077BD4: .4byte gUnknown_02024A6A
_08077BD8: .4byte gPlayerParty
_08077BDC:
	ldrh r1, [r1, 0x2]
_08077BDE:
	cmp r4, 0x3
	bne _08077BE8
	adds r0, r5, 0
	movs r2, 0x1
	b _08077BEC
_08077BE8:
	adds r0, r5, 0
	movs r2, 0
_08077BEC:
	bl sub_8077E44
	lsls r0, 24
	lsrs r0, 24
_08077BF4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8077ABC

	thumb_func_start sub_8077BFC
sub_8077BFC: @ 8077BFC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08077C1C
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077D04
_08077C1C:
	cmp r5, 0xC9
	bne _08077CCC
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077C44
	ldr r2, _08077C3C @ =0x02019348
	ldrb r1, [r2, 0x4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08077C40
	ldr r2, [r2, 0x10]
	b _08077C7E
	.align 2, 0
_08077C3C: .4byte 0x02019348
_08077C40:
	ldr r2, [r2, 0x8]
	b _08077C7E
_08077C44:
	lsls r1, r4, 2
	ldr r0, _08077C6C @ =0x02017800
	adds r0, r1, r0
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	bne _08077C78
	ldr r1, _08077C70 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08077C74 @ =gPlayerParty
	adds r0, r1
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	b _08077C7E
	.align 2, 0
_08077C6C: .4byte 0x02017800
_08077C70: .4byte gUnknown_02024A6A
_08077C74: .4byte gPlayerParty
_08077C78:
	ldr r0, _08077CB4 @ =gUnknown_02024E70
	adds r0, r1, r0
	ldr r2, [r0]
_08077C7E:
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _08077CB8
	adds r0, r5, 0
	b _08077CC2
	.align 2, 0
_08077CB4: .4byte gUnknown_02024E70
_08077CB8:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_08077CC2:
	ldr r1, _08077CC8 @ =gMonBackPicCoords
	lsls r0, 2
	b _08077DC8
	.align 2, 0
_08077CC8: .4byte gMonBackPicCoords
_08077CCC:
	ldr r0, _08077CE0 @ =SPECIES_CASTFORM
	cmp r5, r0
	bne _08077CEC
	ldr r0, _08077CE4 @ =gUnknown_0837F5AC
	ldr r1, _08077CE8 @ =gUnknown_02024E84
	adds r1, r4, r1
	ldrb r1, [r1]
	adds r1, r0
	ldrb r0, [r1]
	b _08077DCC
	.align 2, 0
_08077CE0: .4byte SPECIES_CASTFORM
_08077CE4: .4byte gUnknown_0837F5AC
_08077CE8: .4byte gUnknown_02024E84
_08077CEC:
	movs r0, 0xCE
	lsls r0, 1
	cmp r5, r0
	bls _08077CFC
	ldr r0, _08077CF8 @ =gMonBackPicCoords
	b _08077DCA
	.align 2, 0
_08077CF8: .4byte gMonBackPicCoords
_08077CFC:
	ldr r1, _08077D00 @ =gMonBackPicCoords
	b _08077DC6
	.align 2, 0
_08077D00: .4byte gMonBackPicCoords
_08077D04:
	cmp r5, 0xC9
	bne _08077D90
	lsls r1, r4, 2
	ldr r0, _08077D30 @ =0x02017800
	adds r0, r1, r0
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	bne _08077D3C
	ldr r1, _08077D34 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08077D38 @ =gEnemyParty
	adds r0, r1
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	b _08077D42
	.align 2, 0
_08077D30: .4byte 0x02017800
_08077D34: .4byte gUnknown_02024A6A
_08077D38: .4byte gEnemyParty
_08077D3C:
	ldr r0, _08077D78 @ =gUnknown_02024E70
	adds r0, r1, r0
	ldr r2, [r0]
_08077D42:
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _08077D7C
	adds r0, r5, 0
	b _08077D86
	.align 2, 0
_08077D78: .4byte gUnknown_02024E70
_08077D7C:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_08077D86:
	ldr r1, _08077D8C @ =gMonFrontPicCoords
	lsls r0, 2
	b _08077DC8
	.align 2, 0
_08077D8C: .4byte gMonFrontPicCoords
_08077D90:
	ldr r0, _08077DA8 @ =SPECIES_CASTFORM
	cmp r5, r0
	bne _08077DB4
	ldr r0, _08077DAC @ =gUnknownCastformCoords_0837F598
	ldr r1, _08077DB0 @ =gUnknown_02024E84
	adds r1, r4, r1
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	b _08077DCC
	.align 2, 0
_08077DA8: .4byte SPECIES_CASTFORM
_08077DAC: .4byte gUnknownCastformCoords_0837F598
_08077DB0: .4byte gUnknown_02024E84
_08077DB4:
	movs r0, 0xCE
	lsls r0, 1
	cmp r5, r0
	bls _08077DC4
	ldr r0, _08077DC0 @ =gMonFrontPicCoords
	b _08077DCA
	.align 2, 0
_08077DC0: .4byte gMonFrontPicCoords
_08077DC4:
	ldr r1, _08077DD4 @ =gMonFrontPicCoords
_08077DC6:
	lsls r0, r5, 2
_08077DC8:
	adds r0, r1
_08077DCA:
	ldrb r0, [r0, 0x1]
_08077DCC:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08077DD4: .4byte gMonFrontPicCoords
	thumb_func_end sub_8077BFC

	thumb_func_start sub_8077DD8
sub_8077DD8: @ 8077DD8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	adds r7, r4, 0
	movs r5, 0
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08077E36
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08077E36
	ldr r0, _08077E14 @ =SPECIES_CASTFORM
	cmp r4, r0  @ check if the given pokemon species is Castform
	bne _08077E20
	ldr r0, _08077E18 @ =gUnknownCastformData_0837F5A8
	ldr r1, _08077E1C @ =gUnknown_02024E84
	adds r1, r6, r1
	ldrb r1, [r1]
	adds r1, r0
	ldrb r5, [r1]
	b _08077E36
	.align 2, 0
_08077E14: .4byte SPECIES_CASTFORM
_08077E18: .4byte gUnknownCastformData_0837F5A8
_08077E1C: .4byte gUnknown_02024E84
_08077E20:
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _08077E30
	ldr r0, _08077E2C @ =gEnemyMonElevation
	b _08077E34
	.align 2, 0
_08077E2C: .4byte gEnemyMonElevation
_08077E30:
	ldr r0, _08077E40 @ =gEnemyMonElevation
	adds r0, r7, r0
_08077E34:
	ldrb r5, [r0]
_08077E36:
	adds r0, r5, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08077E40: .4byte gEnemyMonElevation
	thumb_func_end sub_8077DD8

	thumb_func_start sub_8077E44
sub_8077E44: @ 8077E44
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r7, r2, 24
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08077E68
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077E76
_08077E68:
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8077BFC
	lsls r0, 24
	lsrs r4, r0, 24
	b _08077E94
_08077E76:
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8077BFC
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8077DD8
	lsls r0, 24
	lsrs r0, 24
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
_08077E94:
	adds r0, r6, 0
	bl battle_get_per_side_status
	ldr r3, _08077EDC @ =gUnknown_0837F578
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _08077EE0 @ =gUnknown_020239F8
	ldrh r2, [r1]
	movs r1, 0x1
	ands r1, r2
	lsls r1, 4
	adds r0, r1
	adds r0, r3
	ldrb r0, [r0, 0x1]
	adds r0, r4
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r7, 0
	beq _08077ED4
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08077ECE
	adds r0, r4, 0
	adds r0, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
_08077ECE:
	cmp r4, 0x68
	bls _08077ED4
	movs r4, 0x68
_08077ED4:
	adds r0, r4, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08077EDC: .4byte gUnknown_0837F578
_08077EE0: .4byte gUnknown_020239F8
	thumb_func_end sub_8077E44

	thumb_func_start sub_8077EE4
sub_8077EE4: @ 8077EE4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r0, 0xFD
	lsls r0, 24
	adds r1, r0
	lsrs r1, 24
	cmp r1, 0x1
	bhi _08077F56
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077F1C
	ldr r2, _08077F14 @ =0x02019348
	ldrb r1, [r2, 0x4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08077F18
	ldrh r1, [r2, 0x2]
	b _08077F3E
	.align 2, 0
_08077F14: .4byte 0x02019348
_08077F18:
	ldrh r1, [r2]
	b _08077F3E
_08077F1C:
	lsls r0, r4, 2
	ldr r1, _08077F34 @ =0x02017800
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08077F3C
	ldr r1, _08077F38 @ =gUnknown_0202F7CA
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	b _08077F3E
	.align 2, 0
_08077F34: .4byte 0x02017800
_08077F38: .4byte gUnknown_0202F7CA
_08077F3C:
	ldrh r1, [r1, 0x2]
_08077F3E:
	cmp r5, 0x3
	bne _08077F4C
	adds r0, r4, 0
	movs r2, 0x1
	bl sub_8077E44
	b _08077F5E
_08077F4C:
	adds r0, r4, 0
	movs r2, 0
	bl sub_8077E44
	b _08077F5E
_08077F56:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8077ABC
_08077F5E:
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8077EE4

	thumb_func_start sub_8077F68
sub_8077F68: @ 8077F68
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x4
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8077F68

	thumb_func_start sub_8077F7C
sub_8077F7C: @ 8077F7C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08077FA0
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0x80
	lsls r1, 13
	b _08077FB0
_08077FA0:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0x88
	lsls r1, 13
_08077FB0:
	adds r0, r1
	lsrs r0, 16
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8077F7C

	thumb_func_start sub_8077FC0
sub_8077FC0: @ 8077FC0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08078060
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08078010
	lsls r0, r5, 2
	ldr r1, _08078004 @ =0x02017800
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08078044
	ldr r1, _08078008 @ =gUnknown_02024A6A
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807800C @ =gEnemyParty
	b _0807802A
	.align 2, 0
_08078004: .4byte 0x02017800
_08078008: .4byte gUnknown_02024A6A
_0807800C: .4byte gEnemyParty
_08078010:
	lsls r0, r5, 2
	ldr r1, _08078038 @ =0x02017800
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08078044
	ldr r1, _0807803C @ =gUnknown_02024A6A
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08078040 @ =gPlayerParty
_0807802A:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	b _08078046
	.align 2, 0
_08078038: .4byte 0x02017800
_0807803C: .4byte gUnknown_02024A6A
_08078040: .4byte gPlayerParty
_08078044:
	ldrh r4, [r1, 0x2]
_08078046:
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08078060
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8077DD8
	subs r0, r6, r0
	lsls r0, 24
	lsrs r6, r0, 24
_08078060:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8077FC0

	thumb_func_start obj_id_for_side_relative_to_move
obj_id_for_side_relative_to_move: @ 8078068
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0
	bne _08078090
	ldr r4, _08078088 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _080780DE
	ldr r1, _0807808C @ =gUnknown_02024BE0
	ldrb r0, [r4]
	b _080780EE
	.align 2, 0
_08078088: .4byte gUnknown_0202F7C8
_0807808C: .4byte gUnknown_02024BE0
_08078090:
	cmp r0, 0x1
	bne _080780B0
	ldr r4, _080780A8 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _080780DE
	ldr r1, _080780AC @ =gUnknown_02024BE0
	ldrb r0, [r4]
	b _080780EE
	.align 2, 0
_080780A8: .4byte gUnknown_0202F7C9
_080780AC: .4byte gUnknown_02024BE0
_080780B0:
	cmp r1, 0x2
	bne _080780CC
	ldr r5, _080780C8 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r4, 0x2
	eors r0, r4
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080780DE
	b _080780E8
	.align 2, 0
_080780C8: .4byte gUnknown_0202F7C8
_080780CC:
	ldr r5, _080780E4 @ =gUnknown_0202F7C9
	ldrb r0, [r5]
	movs r4, 0x2
	eors r0, r4
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	bne _080780E8
_080780DE:
	movs r0, 0xFF
	b _080780F2
	.align 2, 0
_080780E4: .4byte gUnknown_0202F7C9
_080780E8:
	ldr r1, _080780F8 @ =gUnknown_02024BE0
	ldrb r0, [r5]
	eors r0, r4
_080780EE:
	adds r0, r1
	ldrb r0, [r0]
_080780F2:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080780F8: .4byte gUnknown_02024BE0
	thumb_func_end obj_id_for_side_relative_to_move

	thumb_func_start oamt_set_x3A_32
oamt_set_x3A_32: @ 80780FC
	strh r1, [r0, 0x3A]
	lsrs r1, 16
	strh r1, [r0, 0x3C]
	bx lr
	thumb_func_end oamt_set_x3A_32

	thumb_func_start sub_8078104
sub_8078104: @ 8078104
	ldrh r2, [r0, 0x3A]
	movs r3, 0x3C
	ldrsh r1, [r0, r3]
	lsls r1, 16
	orrs r2, r1
	str r2, [r0, 0x1C]
	bx lr
	thumb_func_end sub_8078104

	thumb_func_start sub_8078114
sub_8078114: @ 8078114
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08078168
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
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
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08078154
	ldr r2, _08078150 @ =0xffffff00
	b _0807815C
	.align 2, 0
_08078150: .4byte 0xffffff00
_08078154:
	cmp r0, 0
	bge _08078160
	movs r2, 0x80
	lsls r2, 1
_0807815C:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_08078160:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _0807816E
_08078168:
	adds r0, r4, 0
	bl sub_8078104
_0807816E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078114

	thumb_func_start sub_8078174
sub_8078174: @ 8078174
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080781E4
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	ldrh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	ldrh r0, [r4, 0x36]
	ldrh r2, [r4, 0x38]
	adds r0, r2
	strh r0, [r4, 0x38]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080781D0
	ldr r2, _080781CC @ =0xffffff00
	b _080781D8
	.align 2, 0
_080781CC: .4byte 0xffffff00
_080781D0:
	cmp r0, 0
	bge _080781DC
	movs r2, 0x80
	lsls r2, 1
_080781D8:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_080781DC:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _080781EA
_080781E4:
	adds r0, r4, 0
	bl sub_8078104
_080781EA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078174

	thumb_func_start unref_sub_80781F0
unref_sub_80781F0: @ 80781F0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0807826C
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	ldrh r0, [r4, 0x38]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08078238
	ldr r2, _08078234 @ =0xffffff00
	b _08078240
	.align 2, 0
_08078234: .4byte 0xffffff00
_08078238:
	cmp r0, 0
	bge _08078244
	movs r2, 0x80
	lsls r2, 1
_08078240:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_08078244:
	ldrh r1, [r4, 0x36]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r0, 0xFF
	ble _08078258
	ldr r2, _08078254 @ =0xffffff00
	b _08078260
	.align 2, 0
_08078254: .4byte 0xffffff00
_08078258:
	cmp r0, 0
	bge _08078264
	movs r2, 0x80
	lsls r2, 1
_08078260:
	adds r0, r1, r2
	strh r0, [r4, 0x36]
_08078264:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _08078272
_0807826C:
	adds r0, r4, 0
	bl sub_8078104
_08078272:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80781F0

	thumb_func_start sub_8078278
sub_8078278: @ 8078278
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080782CC
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080782B8
	ldr r2, _080782B4 @ =0xffffff00
	b _080782C0
	.align 2, 0
_080782B4: .4byte 0xffffff00
_080782B8:
	cmp r0, 0
	bge _080782C4
	movs r2, 0x80
	lsls r2, 1
_080782C0:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_080782C4:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _080782D2
_080782CC:
	adds r0, r4, 0
	bl sub_8078104
_080782D2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078278

	thumb_func_start sub_80782D8
sub_80782D8: @ 80782D8
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _080782EC
	subs r0, r2, 0x1
	strh r0, [r1, 0x2E]
	b _080782F2
_080782EC:
	adds r0, r1, 0
	bl sub_8078104
_080782F2:
	pop {r0}
	bx r0
	thumb_func_end sub_80782D8

	thumb_func_start sub_80782F8
sub_80782F8: @ 80782F8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078314
	ldr r1, _08078310 @ =sub_8078364
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078310: .4byte sub_8078364
	thumb_func_end sub_80782F8

	thumb_func_start sub_8078314
sub_8078314: @ 8078314
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _0807832A
	ldrh r0, [r4, 0x2E]
	negs r0, r0
	strh r0, [r4, 0x2E]
_0807832A:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	subs r0, r1
	ldrh r5, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl __divsi3
	cmp r0, 0
	bge _08078344
	negs r0, r0
_08078344:
	strh r0, [r4, 0x2E]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	subs r0, r1
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x32]
	strh r5, [r4, 0x30]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8078314

	thumb_func_start sub_8078364
sub_8078364: @ 8078364
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _08078388
	subs r0, r2, 0x1
	strh r0, [r1, 0x2E]
	ldrh r0, [r1, 0x30]
	ldrh r2, [r1, 0x24]
	adds r0, r2
	strh r0, [r1, 0x24]
	ldrh r0, [r1, 0x32]
	ldrh r3, [r1, 0x26]
	adds r0, r3
	strh r0, [r1, 0x26]
	b _0807838E
_08078388:
	adds r0, r1, 0
	bl sub_8078104
_0807838E:
	pop {r0}
	bx r0
	thumb_func_end sub_8078364

	thumb_func_start sub_8078394
sub_8078394: @ 8078394
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _080783C4
	subs r0, r1, 0x1
	strh r0, [r2, 0x2E]
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x34]
	adds r0, r1
	strh r0, [r2, 0x34]
	ldrh r1, [r2, 0x32]
	ldrh r3, [r2, 0x36]
	adds r1, r3
	strh r1, [r2, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2, 0x24]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r2, 0x26]
	b _080783CA
_080783C4:
	adds r0, r2, 0
	bl sub_8078104
_080783CA:
	pop {r0}
	bx r0
	thumb_func_end sub_8078394

	thumb_func_start sub_80783D0
sub_80783D0: @ 80783D0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _08078400
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r1, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r1, r2
	strh r1, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r4, 0x26]
	b _08078406
_08078400:
	adds r0, r4, 0
	bl sub_8078104
_08078406:
	adds r0, r4, 0
	bl UpdateMonIconFrame
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80783D0

	thumb_func_start unref_sub_8078414
unref_sub_8078414: @ 8078414
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldr r5, _08078450 @ =gUnknown_0202F7C9
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldr r0, _08078454 @ =sub_80782F8
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078450: .4byte gUnknown_0202F7C9
_08078454: .4byte sub_80782F8
	thumb_func_end unref_sub_8078414

	thumb_func_start sub_8078458
sub_8078458: @ 8078458
	push {r4,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _0807849C
	subs r0, r1, 0x1
	strh r0, [r3, 0x2E]
	ldr r2, _08078498 @ =gSprites
	movs r4, 0x34
	ldrsh r1, [r3, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x30]
	ldrh r4, [r0, 0x24]
	adds r1, r4
	strh r1, [r0, 0x24]
	movs r0, 0x34
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x32]
	ldrh r2, [r0, 0x26]
	adds r1, r2
	strh r1, [r0, 0x26]
	b _080784A2
	.align 2, 0
_08078498: .4byte gSprites
_0807849C:
	adds r0, r3, 0
	bl sub_8078104
_080784A2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078458

	thumb_func_start sub_80784A8
sub_80784A8: @ 80784A8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080784F8
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x30]
	ldrh r0, [r4, 0x34]
	adds r1, r0
	strh r1, [r4, 0x34]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	ldr r3, _080784F4 @ =gSprites
	movs r0, 0x38
	ldrsh r2, [r4, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	lsls r1, 16
	asrs r1, 24
	strh r1, [r0, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r1, 0x26]
	b _080784FE
	.align 2, 0
_080784F4: .4byte gSprites
_080784F8:
	adds r0, r4, 0
	bl sub_8078104
_080784FE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80784A8

	thumb_func_start sub_8078504
sub_8078504: @ 8078504
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _08078566
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x32]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r1, r0
	strh r1, [r4, 0x32]
	ldrh r1, [r4, 0x36]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x34]
	adds r1, r0
	strh r1, [r4, 0x36]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _0807856C
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0807856C
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _0807856C
_08078566:
	adds r0, r4, 0
	bl sub_8078104
_0807856C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078504

	thumb_func_start move_anim_8074EE0
move_anim_8074EE0: @ 8078574
	push {r4,lr}
	adds r4, r0, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl move_anim_8072740
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end move_anim_8074EE0

	thumb_func_start unref_sub_8078588
unref_sub_8078588: @ 8078588
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldr r5, _080785C4 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldr r0, _080785C8 @ =sub_80782F8
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080785C4: .4byte gUnknown_0202F7C8
_080785C8: .4byte sub_80782F8
	thumb_func_end unref_sub_8078588

	thumb_func_start unref_sub_80785CC
unref_sub_80785CC: @ 80785CC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	bl ResetPaletteStructByUid
	adds r0, r4, 0
	bl move_anim_8074EE0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80785CC

	thumb_func_start sub_80785E4
sub_80785E4: @ 80785E4
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080785FA
	adds r0, r2, 0
	bl sub_8078104
_080785FA:
	pop {r0}
	bx r0
	thumb_func_end sub_80785E4

	thumb_func_start sub_8078600
sub_8078600: @ 8078600
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08078616
	adds r0, r2, 0
	bl sub_8078104
_08078616:
	pop {r0}
	bx r0
	thumb_func_end sub_8078600

	thumb_func_start sub_807861C
sub_807861C: @ 807861C
	push {lr}
	ldr r1, _08078630 @ =REG_BLDCNT
	movs r2, 0
	strh r2, [r1]
	adds r1, 0x2
	strh r2, [r1]
	bl move_anim_8072740
	pop {r0}
	bx r0
	.align 2, 0
_08078630: .4byte REG_BLDCNT
	thumb_func_end sub_807861C

	thumb_func_start sub_8078634
sub_8078634: @ 8078634
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0807864C @ =REG_BLDCNT
	movs r2, 0
	strh r2, [r1]
	adds r1, 0x2
	strh r2, [r1]
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_0807864C: .4byte REG_BLDCNT
	thumb_func_end sub_8078634

	thumb_func_start sub_8078650
sub_8078650: @ 8078650
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08078678 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078678: .4byte gUnknown_0202F7C8
	thumb_func_end sub_8078650

	thumb_func_start sub_807867C
sub_807867C: @ 807867C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	mov r8, r5
	ldr r7, _080786B4 @ =gUnknown_0202F7C8
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080786B8 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bhi _080786C8
	cmp r6, r0
	bcs _080786BC
	lsls r0, r5, 16
	b _080786D8
	.align 2, 0
_080786B4: .4byte gUnknown_0202F7C8
_080786B8: .4byte gUnknown_0202F7C9
_080786BC:
	ldrb r0, [r7]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080786D4
_080786C8:
	ldrh r1, [r4, 0x20]
	lsls r0, r5, 16
	asrs r0, 16
	subs r1, r0
	strh r1, [r4, 0x20]
	b _080786E0
_080786D4:
	mov r1, r8
	lsls r0, r1, 16
_080786D8:
	asrs r0, 16
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
_080786E0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807867C

	thumb_func_start sub_80786EC
sub_80786EC: @ 80786EC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	movs r5, 0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r0, 0x80
	lsls r0, 8
	bl __divsi3
	strh r0, [r4, 0x3A]
	strh r5, [r4, 0x3C]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80786EC

	thumb_func_start sub_8078718
sub_8078718: @ 8078718
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _08078744
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	adds r0, r1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r0, 0
	b _08078746
_08078744:
	movs r0, 0x1
_08078746:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8078718

	thumb_func_start oamt_add_pos2_onto_pos1
oamt_add_pos2_onto_pos1: @ 807874C
	ldrh r1, [r0, 0x24]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	movs r2, 0
	strh r1, [r0, 0x20]
	ldrh r1, [r0, 0x26]
	ldrh r3, [r0, 0x22]
	adds r1, r3
	strh r1, [r0, 0x22]
	strh r2, [r0, 0x24]
	strh r2, [r0, 0x26]
	bx lr
	thumb_func_end oamt_add_pos2_onto_pos1

	thumb_func_start sub_8078764
sub_8078764: @ 8078764
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	cmp r1, 0
	bne _0807878C
	ldr r4, _080787A8 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
_0807878C:
	ldr r4, _080787AC @ =gBattleAnimArgs
	movs r0, 0
	ldrsh r1, [r4, r0]
	adds r0, r5, 0
	bl sub_807867C
	ldrh r0, [r4, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080787A8: .4byte gUnknown_0202F7C9
_080787AC: .4byte gBattleAnimArgs
	thumb_func_end sub_8078764

	thumb_func_start sub_80787B0
sub_80787B0: @ 80787B0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	cmp r1, 0
	bne _080787D4
	ldr r4, _080787D0 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	b _080787E8
	.align 2, 0
_080787D0: .4byte gUnknown_0202F7C8
_080787D4:
	ldr r4, _0807880C @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
_080787E8:
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r4, _08078810 @ =gBattleAnimArgs
	movs r0, 0
	ldrsh r1, [r4, r0]
	adds r0, r5, 0
	bl sub_807867C
	ldrh r0, [r4, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807880C: .4byte gUnknown_0202F7C8
_08078810: .4byte gBattleAnimArgs
	thumb_func_end sub_80787B0

	thumb_func_start battle_side_get_owner
battle_side_get_owner: @ 8078814
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08078824 @ =gUnknown_02024A72
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_08078824: .4byte gUnknown_02024A72
	thumb_func_end battle_side_get_owner

	thumb_func_start battle_get_per_side_status
battle_get_per_side_status: @ 8078828
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08078834 @ =gUnknown_02024A72
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08078834: .4byte gUnknown_02024A72
	thumb_func_end battle_get_per_side_status

	thumb_func_start battle_get_side_with_given_state
battle_get_side_with_given_state: @ 8078838
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r1, 0
	ldr r0, _0807886C @ =gUnknown_02024A68
	ldrb r2, [r0]
	cmp r1, r2
	bcs _08078862
	ldr r4, _08078870 @ =gUnknown_02024A72
	ldrb r0, [r4]
	cmp r0, r3
	beq _08078862
_08078850:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	bcs _08078862
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _08078850
_08078862:
	adds r0, r1, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807886C: .4byte gUnknown_02024A68
_08078870: .4byte gUnknown_02024A72
	thumb_func_end battle_get_side_with_given_state

	thumb_func_start sub_8078874
sub_8078874: @ 8078874
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080788A0
	ldr r0, _08078898 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	cmp r0, r4
	beq _080788EE
	ldr r0, _0807889C @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	cmp r0, r4
	beq _080788EE
	b _080788FC
	.align 2, 0
_08078898: .4byte gUnknown_0202F7C8
_0807889C: .4byte gUnknown_0202F7C9
_080788A0:
	ldr r0, _080788C8 @ =gUnknown_02024A72
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080788FC
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080788D4
	ldr r1, _080788CC @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080788D0 @ =gEnemyParty
	b _080788E2
	.align 2, 0
_080788C8: .4byte gUnknown_02024A72
_080788CC: .4byte gUnknown_02024A6A
_080788D0: .4byte gEnemyParty
_080788D4:
	ldr r1, _080788F4 @ =gUnknown_02024A6A
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080788F8 @ =gPlayerParty
_080788E2:
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080788FC
_080788EE:
	movs r0, 0x1
	b _080788FE
	.align 2, 0
_080788F4: .4byte gUnknown_02024A6A
_080788F8: .4byte gPlayerParty
_080788FC:
	movs r0, 0
_080788FE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8078874

	thumb_func_start IsDoubleBattle
IsDoubleBattle: @ 8078904
	ldr r0, _08078910 @ =gUnknown_020239F8
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_08078910: .4byte gUnknown_020239F8
	thumb_func_end IsDoubleBattle

	thumb_func_start sub_8078914
sub_8078914: @ 8078914
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08078938
	ldr r0, _08078930 @ =0x06008000
	str r0, [r4]
	ldr r0, _08078934 @ =0x0600f000
	str r0, [r4, 0x4]
	movs r0, 0xE
	b _08078942
	.align 2, 0
_08078930: .4byte 0x06008000
_08078934: .4byte 0x0600f000
_08078938:
	ldr r0, _0807894C @ =0x06004000
	str r0, [r4]
	ldr r0, _08078950 @ =0x0600e000
	str r0, [r4, 0x4]
	movs r0, 0x8
_08078942:
	strb r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807894C: .4byte 0x06004000
_08078950: .4byte 0x0600e000
	thumb_func_end sub_8078914

	thumb_func_start sub_8078954
sub_8078954: @ 8078954
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08078978
	ldr r0, _08078970 @ =0x06008000
	str r0, [r4]
	ldr r0, _08078974 @ =0x0600f000
	str r0, [r4, 0x4]
	movs r0, 0xE
	b _080789AA
	.align 2, 0
_08078970: .4byte 0x06008000
_08078974: .4byte 0x0600f000
_08078978:
	ldr r0, _08078994 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080789A0
	ldr r0, _08078998 @ =0x06004000
	str r0, [r4]
	ldr r0, _0807899C @ =0x0600e000
	str r0, [r4, 0x4]
	movs r0, 0x8
	b _080789AA
	.align 2, 0
_08078994: .4byte gUnknown_0202F7C8
_08078998: .4byte 0x06004000
_0807899C: .4byte 0x0600e000
_080789A0:
	ldr r0, _080789B4 @ =0x06006000
	str r0, [r4]
	ldr r0, _080789B8 @ =0x0600f000
	str r0, [r4, 0x4]
	movs r0, 0x9
_080789AA:
	strb r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080789B4: .4byte 0x06006000
_080789B8: .4byte 0x0600f000
	thumb_func_end sub_8078954

	thumb_func_start sub_80789BC
sub_80789BC: @ 80789BC
	push {lr}
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080789CC
	movs r0, 0x2
	b _080789CE
_080789CC:
	movs r0, 0x1
_080789CE:
	pop {r1}
	bx r1
	thumb_func_end sub_80789BC

	thumb_func_start sub_80789D4
sub_80789D4: @ 80789D4
	push {lr}
	lsls r0, 24
	cmp r0, 0
	bne _080789F4
	ldr r2, _080789F0 @ =REG_BG3CNT
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x1]
	movs r1, 0x20
	orrs r0, r1
	b _08078A2A
	.align 2, 0
_080789F0: .4byte REG_BG3CNT
_080789F4:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08078A14
	ldr r2, _08078A10 @ =REG_BG3CNT
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x1]
	movs r1, 0x20
	orrs r0, r1
	b _08078A2A
	.align 2, 0
_08078A10: .4byte REG_BG3CNT
_08078A14:
	ldr r2, _08078A30 @ =REG_BG3CNT
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
_08078A2A:
	strb r0, [r2, 0x1]
	pop {r0}
	bx r0
	.align 2, 0
_08078A30: .4byte REG_BG3CNT
	thumb_func_end sub_80789D4

	thumb_func_start sub_8078A34
sub_8078A34: @ 8078A34
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl sub_8078A5C
	ldr r1, _08078A58 @ =sub_80783D0
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078A58: .4byte sub_80783D0
	thumb_func_end sub_8078A34

	thumb_func_start sub_8078A5C
sub_8078A5C: @ 8078A5C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x32]
	ldrh r1, [r5, 0x30]
	subs r0, r1
	ldrh r4, [r5, 0x36]
	ldrh r1, [r5, 0x34]
	subs r4, r1
	lsls r4, 24
	lsrs r4, 16
	lsls r0, 24
	asrs r0, 16
	movs r2, 0x2E
	ldrsh r1, [r5, r2]
	bl __divsi3
	movs r6, 0
	strh r0, [r5, 0x30]
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl __divsi3
	strh r0, [r5, 0x32]
	strh r6, [r5, 0x36]
	strh r6, [r5, 0x34]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8078A5C

	thumb_func_start obj_translate_based_on_private_1_2_3_4
obj_translate_based_on_private_1_2_3_4: @ 8078A9C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	movs r0, 0x32
	ldrsh r1, [r7, r0]
	movs r2, 0x30
	ldrsh r0, [r7, r2]
	subs r1, r0
	movs r3, 0x36
	ldrsh r2, [r7, r3]
	movs r3, 0x34
	ldrsh r0, [r7, r3]
	subs r2, r0
	lsrs r0, r1, 31
	mov r8, r0
	lsrs r3, r2, 31
	mov r9, r3
	cmp r1, 0
	bge _08078AC8
	negs r1, r1
_08078AC8:
	lsls r0, r1, 24
	lsrs r6, r0, 16
	adds r0, r2, 0
	cmp r0, 0
	bge _08078AD4
	negs r0, r0
_08078AD4:
	lsls r0, 24
	lsrs r5, r0, 16
	movs r0, 0x2E
	ldrsh r4, [r7, r0]
	adds r0, r6, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	mov r2, r8
	cmp r2, 0
	beq _08078B00
	movs r0, 0x1
	orrs r6, r0
	b _08078B04
_08078B00:
	ldr r0, _08078B10 @ =0x0000fffe
	ands r6, r0
_08078B04:
	mov r3, r9
	cmp r3, 0
	beq _08078B14
	movs r0, 0x1
	orrs r5, r0
	b _08078B18
	.align 2, 0
_08078B10: .4byte 0x0000fffe
_08078B14:
	ldr r0, _08078B30 @ =0x0000fffe
	ands r5, r0
_08078B18:
	movs r0, 0
	strh r6, [r7, 0x30]
	strh r5, [r7, 0x32]
	strh r0, [r7, 0x36]
	strh r0, [r7, 0x34]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078B30: .4byte 0x0000fffe
	thumb_func_end obj_translate_based_on_private_1_2_3_4

	thumb_func_start sub_8078B34
sub_8078B34: @ 8078B34
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r1, _08078B58 @ =sub_8078BB8
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078B58: .4byte sub_8078BB8
	thumb_func_end sub_8078B34

	thumb_func_start sub_8078B5C
sub_8078B5C: @ 8078B5C
	push {r4-r6,lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _08078B6C
	movs r0, 0x1
	b _08078BB0
_08078B6C:
	ldrh r1, [r2, 0x30]
	ldrh r4, [r2, 0x32]
	ldrh r6, [r2, 0x34]
	ldrh r5, [r2, 0x36]
	adds r0, r6, r1
	lsls r3, r0, 16
	lsrs r6, r3, 16
	adds r0, r5, r4
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08078B8E
	lsrs r0, r3, 24
	negs r0, r0
	b _08078B90
_08078B8E:
	lsrs r0, r3, 24
_08078B90:
	strh r0, [r2, 0x24]
	movs r0, 0x1
	ands r4, r0
	cmp r4, 0
	beq _08078BA0
	lsrs r0, r5, 8
	negs r0, r0
	b _08078BA2
_08078BA0:
	lsrs r0, r5, 8
_08078BA2:
	strh r0, [r2, 0x26]
	strh r6, [r2, 0x34]
	strh r5, [r2, 0x36]
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	movs r0, 0
_08078BB0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8078B5C

	thumb_func_start sub_8078BB8
sub_8078BB8: @ 8078BB8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _08078BCC
	adds r0, r4, 0
	bl sub_8078104
_08078BCC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078BB8

	thumb_func_start sub_8078BD4
sub_8078BD4: @ 8078BD4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	subs r0, r1, r0
	cmp r0, 0
	bge _08078BE8
	negs r0, r0
_08078BE8:
	lsls r0, 8
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078BD4

	thumb_func_start sub_8078C00
sub_8078C00: @ 8078C00
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl sub_8078BD4
	ldr r1, _08078C24 @ =sub_8078BB8
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078C24: .4byte sub_8078BB8
	thumb_func_end sub_8078C00

	thumb_func_start sub_8078C28
sub_8078C28: @ 8078C28
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	movs r0, 0x32
	ldrsh r1, [r7, r0]
	movs r2, 0x30
	ldrsh r0, [r7, r2]
	subs r1, r0
	movs r3, 0x36
	ldrsh r2, [r7, r3]
	movs r3, 0x34
	ldrsh r0, [r7, r3]
	subs r2, r0
	lsrs r0, r1, 31
	mov r8, r0
	lsrs r3, r2, 31
	mov r9, r3
	cmp r1, 0
	bge _08078C54
	negs r1, r1
_08078C54:
	lsls r0, r1, 20
	lsrs r6, r0, 16
	adds r0, r2, 0
	cmp r0, 0
	bge _08078C60
	negs r0, r0
_08078C60:
	lsls r0, 20
	lsrs r5, r0, 16
	movs r0, 0x2E
	ldrsh r4, [r7, r0]
	adds r0, r6, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	mov r2, r8
	cmp r2, 0
	beq _08078C8C
	movs r0, 0x1
	orrs r6, r0
	b _08078C90
_08078C8C:
	ldr r0, _08078C9C @ =0x0000fffe
	ands r6, r0
_08078C90:
	mov r3, r9
	cmp r3, 0
	beq _08078CA0
	movs r0, 0x1
	orrs r5, r0
	b _08078CA4
	.align 2, 0
_08078C9C: .4byte 0x0000fffe
_08078CA0:
	ldr r0, _08078CBC @ =0x0000fffe
	ands r5, r0
_08078CA4:
	movs r0, 0
	strh r6, [r7, 0x30]
	strh r5, [r7, 0x32]
	strh r0, [r7, 0x36]
	strh r0, [r7, 0x34]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078CBC: .4byte 0x0000fffe
	thumb_func_end sub_8078C28

	thumb_func_start sub_8078CC0
sub_8078CC0: @ 8078CC0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl sub_8078C28
	ldr r1, _08078CE4 @ =sub_8078D44
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078CE4: .4byte sub_8078D44
	thumb_func_end sub_8078CC0

	thumb_func_start sub_8078CE8
sub_8078CE8: @ 8078CE8
	push {r4-r6,lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _08078CF8
	movs r0, 0x1
	b _08078D3C
_08078CF8:
	ldrh r1, [r2, 0x30]
	ldrh r4, [r2, 0x32]
	ldrh r6, [r2, 0x34]
	ldrh r5, [r2, 0x36]
	adds r0, r6, r1
	lsls r3, r0, 16
	lsrs r6, r3, 16
	adds r0, r5, r4
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08078D1A
	lsrs r0, r3, 20
	negs r0, r0
	b _08078D1C
_08078D1A:
	lsrs r0, r3, 20
_08078D1C:
	strh r0, [r2, 0x24]
	movs r0, 0x1
	ands r4, r0
	cmp r4, 0
	beq _08078D2C
	lsrs r0, r5, 4
	negs r0, r0
	b _08078D2E
_08078D2C:
	lsrs r0, r5, 4
_08078D2E:
	strh r0, [r2, 0x26]
	strh r6, [r2, 0x34]
	strh r5, [r2, 0x36]
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	movs r0, 0
_08078D3C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8078CE8

	thumb_func_start sub_8078D44
sub_8078D44: @ 8078D44
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078CE8
	lsls r0, 24
	cmp r0, 0
	beq _08078D58
	adds r0, r4, 0
	bl sub_8078104
_08078D58:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078D44

	thumb_func_start sub_8078D60
sub_8078D60: @ 8078D60
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	subs r0, r1, r0
	cmp r0, 0
	bge _08078D74
	negs r0, r0
_08078D74:
	lsls r0, 4
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_8078C28
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078D60

	thumb_func_start sub_8078D8C
sub_8078D8C: @ 8078D8C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl sub_8078D60
	ldr r1, _08078DB0 @ =sub_8078D44
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078DB0: .4byte sub_8078D44
	thumb_func_end sub_8078D8C

	thumb_func_start obj_id_set_rotscale
obj_id_set_rotscale: @ 8078DB4
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r5, _08078E2C @ =0xffff0000
	lsls r2, 16
	lsrs r1, 16
	orrs r1, r2
	str r1, [sp]
	ldr r0, [sp, 0x4]
	ands r0, r5
	orrs r0, r3
	str r0, [sp, 0x4]
	bl sub_8078E38
	lsls r0, 24
	cmp r0, 0
	beq _08078DF0
	mov r0, sp
	ldrh r0, [r0]
	negs r0, r0
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp]
	ands r1, r5
	orrs r1, r0
	str r1, [sp]
_08078DF0:
	ldr r1, _08078E30 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x3]
	lsls r4, 26
	lsrs r4, 27
	add r5, sp, 0x8
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ObjAffineSet
	ldr r0, _08078E34 @ =gOamMatrices
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r5]
	strh r0, [r4]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x2]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x4]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x6]
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078E2C: .4byte 0xffff0000
_08078E30: .4byte gSprites
_08078E34: .4byte gOamMatrices
	thumb_func_end obj_id_set_rotscale

	thumb_func_start sub_8078E38
sub_8078E38: @ 8078E38
	push {r4,lr}
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08078E68
	ldr r4, _08078E64 @ =gSprites
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r2, 0x32
	ldrsh r0, [r1, r2]
	cmp r0, 0xC9
	beq _08078E68
	movs r0, 0x1
	b _08078E6A
	.align 2, 0
_08078E64: .4byte gSprites
_08078E68:
	movs r0, 0
_08078E6A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8078E38

	thumb_func_start sub_8078E70
sub_8078E70: @ 8078E70
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	ldr r1, _08078F38 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r4, r0, r1
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r7, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08078EA6
	adds r0, r7, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08078EB4
_08078EA6:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_08078EB4:
	ldr r1, _08078F38 @ =gSprites
	lsls r4, r6, 4
	adds r0, r4, r6
	lsls r0, 2
	adds r5, r0, r1
	movs r0, 0x3
	mov r1, r8
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x1]
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08078F0E
	ldrb r0, [r5, 0x1]
	lsls r0, 30
	cmp r0, 0
	bne _08078F0E
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	ldr r1, _08078F3C @ =0x02017810
	adds r0, r1
	ldrb r1, [r0, 0x6]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x3]
_08078F0E:
	ldr r1, _08078F38 @ =gSprites
	adds r0, r4, r6
	lsls r0, 2
	adds r0, r1
	ldrb r3, [r0, 0x1]
	movs r1, 0x3
	orrs r3, r1
	strb r3, [r0, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r0, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	bl CalcCenterToCornerVec
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078F38: .4byte gSprites
_08078F3C: .4byte 0x02017810
	thumb_func_end sub_8078E70

	thumb_func_start sub_8078F40
sub_8078F40: @ 8078F40
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r2, 0x80
	lsls r2, 1
	adds r0, r4, 0
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldr r1, _08078F98 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	movs r2, 0x1
	orrs r1, r2
	movs r2, 0xD
	negs r2, r2
	ands r1, r2
	strb r1, [r0, 0x1]
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	movs r1, 0x7F
	ands r1, r2
	strb r1, [r3]
	ldrb r3, [r0, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r0, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	bl CalcCenterToCornerVec
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078F98: .4byte gSprites
	thumb_func_end sub_8078F40

	thumb_func_start sub_8078F9C
sub_8078F9C: @ 8078F9C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08078FD4 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r2, r1, r2
	ldrb r0, [r2, 0x3]
	lsls r0, 26
	lsrs r0, 27
	ldr r1, _08078FD8 @ =gOamMatrices
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x4]
	movs r3, 0x4
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bge _08078FC8
	negs r0, r0
	lsls r0, 16
	lsrs r1, r0, 16
_08078FC8:
	lsls r0, r1, 16
	asrs r0, 19
	strh r0, [r2, 0x26]
	pop {r0}
	bx r0
	.align 2, 0
_08078FD4: .4byte gSprites
_08078FD8: .4byte gOamMatrices
	thumb_func_end sub_8078F9C

	thumb_func_start sub_8078FDC
sub_8078FDC: @ 8078FDC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r4, r0, 0
	ldr r0, [sp, 0x28]
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 16
	lsrs r5, r2, 16
	lsls r3, 16
	lsrs r7, r3, 16
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08079082
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	cmp r6, 0
	beq _0807902A
	ldrb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
_0807902A:
	ldr r6, _08079090 @ =0xffff0000
	lsls r0, r7, 16
	orrs r5, r0
	str r5, [sp]
	ldr r0, [sp, 0x4]
	ands r0, r6
	mov r1, r8
	orrs r0, r1
	str r0, [sp, 0x4]
	bl sub_8078E38
	lsls r0, 24
	cmp r0, 0
	beq _08079058
	mov r0, sp
	ldrh r0, [r0]
	negs r0, r0
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp]
	ands r1, r6
	orrs r1, r0
	str r1, [sp]
_08079058:
	ldrb r4, [r4, 0x3]
	lsls r4, 26
	lsrs r4, 27
	add r5, sp, 0x8
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ObjAffineSet
	ldr r0, _08079094 @ =gOamMatrices
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r5]
	strh r0, [r4]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x2]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x4]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x6]
_08079082:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079090: .4byte 0xffff0000
_08079094: .4byte gOamMatrices
	thumb_func_end sub_8078FDC

	thumb_func_start sub_8079098
sub_8079098: @ 8079098
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r3, 0x80
	lsls r3, 1
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x1
	adds r2, r3, 0
	bl sub_8078FDC
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8079098

	thumb_func_start sub_80790D8
sub_80790D8: @ 80790D8
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl ArcTan2
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80790D8

	thumb_func_start sub_80790F0
sub_80790F0: @ 80790F0
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl sub_80790D8
	lsls r0, 16
	negs r0, r0
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80790F0

	thumb_func_start sub_8079108
sub_8079108: @ 8079108
	push {r4-r7,lr}
	lsls r1, 24
	lsls r0, 20
	lsrs r0, 16
	cmp r1, 0
	bne _08079184
	ldr r2, _08079178 @ =gPlttBufferUnfaded
	ldr r1, _0807917C @ =gPlttBufferFaded
	lsls r0, 1
	adds r4, r0, r1
	adds r5, r0, r2
	movs r6, 0xF
_08079120:
	ldr r0, [r5]
	lsls r2, r0, 27
	lsrs r2, 27
	lsls r1, r0, 22
	lsrs r1, 27
	adds r2, r1
	lsls r0, 17
	lsrs r0, 27
	adds r0, r2
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1F
	ands r0, r1
	ldrb r1, [r4]
	movs r3, 0x20
	negs r3, r3
	adds r2, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4]
	lsls r3, r0, 5
	ldrh r1, [r4]
	ldr r7, _08079180 @ =0xfffffc1f
	adds r2, r7, 0
	ands r1, r2
	orrs r1, r3
	strh r1, [r4]
	lsls r0, 2
	ldrb r1, [r4, 0x1]
	movs r3, 0x7D
	negs r3, r3
	adds r2, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x1]
	adds r4, 0x2
	adds r5, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08079120
	b _08079194
	.align 2, 0
_08079178: .4byte gPlttBufferUnfaded
_0807917C: .4byte gPlttBufferFaded
_08079180: .4byte 0xfffffc1f
_08079184:
	lsls r1, r0, 1
	ldr r0, _0807919C @ =gPlttBufferUnfaded
	adds r0, r1, r0
	ldr r2, _080791A0 @ =gPlttBufferFaded
	adds r1, r2
	ldr r2, _080791A4 @ =REG_BG0CNT
	bl CpuSet
_08079194:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807919C: .4byte gPlttBufferUnfaded
_080791A0: .4byte gPlttBufferFaded
_080791A4: .4byte REG_BG0CNT
	thumb_func_end sub_8079108

	thumb_func_start sub_80791A8
sub_80791A8: @ 80791A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r4, [sp, 0x28]
	ldr r5, [sp, 0x2C]
	ldr r6, [sp, 0x30]
	lsls r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	lsls r4, 24
	lsrs r4, 24
	mov r10, r4
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp]
	lsls r6, 24
	lsrs r6, 24
	str r6, [sp, 0x4]
	movs r4, 0
	cmp r0, 0
	beq _080791FE
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080791F2
	movs r4, 0xE
	b _080791FE
_080791F2:
	bl sub_80789BC
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0x1
	lsls r4, r0
_080791FE:
	cmp r7, 0
	beq _08079210
	ldr r0, _08079288 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_08079210:
	mov r0, r8
	cmp r0, 0
	beq _08079224
	ldr r0, _0807928C @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_08079224:
	mov r0, r9
	cmp r0, 0
	beq _0807924A
	ldr r6, _08079288 @ =gUnknown_0202F7C8
	ldrb r0, [r6]
	movs r5, 0x2
	eors r0, r5
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807924A
	ldrb r0, [r6]
	eors r0, r5
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_0807924A:
	mov r0, r10
	cmp r0, 0
	beq _08079270
	ldr r6, _0807928C @ =gUnknown_0202F7C9
	ldrb r0, [r6]
	movs r5, 0x2
	eors r0, r5
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079270
	ldrb r0, [r6]
	eors r0, r5
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_08079270:
	ldr r0, [sp]
	cmp r0, 0
	beq _08079296
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08079290
	movs r0, 0x80
	lsls r0, 1
	b _08079294
	.align 2, 0
_08079288: .4byte gUnknown_0202F7C8
_0807928C: .4byte gUnknown_0202F7C9
_08079290:
	movs r0, 0x80
	lsls r0, 7
_08079294:
	orrs r4, r0
_08079296:
	ldr r0, [sp, 0x4]
	cmp r0, 0
	beq _080792AC
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080792AC
	movs r0, 0x80
	lsls r0, 2
	orrs r4, r0
_080792AC:
	adds r0, r4, 0
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80791A8

	thumb_func_start sub_80792C0
sub_80792C0: @ 80792C0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	movs r4, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080792EE
	cmp r5, 0
	beq _0807939C
	movs r4, 0x80
	lsls r4, 11
	b _0807939C
_080792EE:
	cmp r5, 0
	beq _08079316
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079316
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r4, 0x1
	lsls r4, r0
_08079316:
	cmp r6, 0
	beq _08079342
	movs r0, 0x2
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079342
	movs r0, 0x2
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_08079342:
	cmp r7, 0
	beq _0807936E
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807936E
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_0807936E:
	mov r0, r8
	cmp r0, 0
	beq _0807939C
	movs r0, 0x3
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807939C
	movs r0, 0x3
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_0807939C:
	adds r0, r4, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80792C0

	thumb_func_start sub_80793A8
sub_80793A8: @ 80793A8
	lsls r0, 24
	lsrs r0, 24
	bx lr
	thumb_func_end sub_80793A8

	thumb_func_start unref_sub_80793B0
unref_sub_80793B0: @ 80793B0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80793B0

	thumb_func_start sub_80793C4
sub_80793C4: @ 80793C4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08079402
	ldr r2, _080793F0 @ =gBattleAnimArgs
	movs r3, 0x6
	ldrsh r0, [r2, r3]
	movs r1, 0
	cmp r0, 0
	bne _080793DE
	movs r1, 0x1
_080793DE:
	movs r3, 0x4
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080793F4
	adds r0, r4, 0
	bl sub_80787B0
	b _080793FA
	.align 2, 0
_080793F0: .4byte gBattleAnimArgs
_080793F4:
	adds r0, r4, 0
	bl sub_8078764
_080793FA:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _08079416
_08079402:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _08079416
	adds r0, r4, 0
	bl move_anim_8074EE0
_08079416:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80793C4

	thumb_func_start sub_807941C
sub_807941C: @ 807941C
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r6, _08079494 @ =gBattleAnimArgs
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0
	cmp r0, 0
	bne _08079434
	movs r1, 0x1
_08079434:
	ldrb r0, [r6, 0xA]
	movs r7, 0x1
	cmp r0, 0
	bne _0807943E
	movs r7, 0x3
_0807943E:
	adds r0, r5, 0
	bl sub_80787B0
	ldr r0, _08079498 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08079458
	ldrh r0, [r6, 0x4]
	negs r0, r0
	strh r0, [r6, 0x4]
_08079458:
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	ldr r4, _0807949C @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	adds r1, r7, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x6]
	adds r0, r6
	strh r0, [r5, 0x36]
	ldr r0, _080794A0 @ =sub_8078B34
	str r0, [r5, 0x1C]
	ldr r1, _080794A4 @ =move_anim_8072740
	adds r0, r5, 0
	bl oamt_set_x3A_32
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079494: .4byte gBattleAnimArgs
_08079498: .4byte gUnknown_0202F7C8
_0807949C: .4byte gUnknown_0202F7C9
_080794A0: .4byte sub_8078B34
_080794A4: .4byte move_anim_8072740
	thumb_func_end sub_807941C

	thumb_func_start sub_80794A8
sub_80794A8: @ 80794A8
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _08079508 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080794C8
	ldr r1, _0807950C @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080794C8:
	ldr r4, _0807950C @ =gBattleAnimArgs
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldr r5, _08079510 @ =gUnknown_0202F7C9
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r6, 0x36]
	ldrh r0, [r4, 0xA]
	strh r0, [r6, 0x38]
	adds r0, r6, 0
	bl sub_80786EC
	ldr r0, _08079514 @ =sub_8079518
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08079508: .4byte gUnknown_0202F7C8
_0807950C: .4byte gBattleAnimArgs
_08079510: .4byte gUnknown_0202F7C9
_08079514: .4byte sub_8079518
	thumb_func_end sub_80794A8

	thumb_func_start sub_8079518
sub_8079518: @ 8079518
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _0807952C
	adds r0, r4, 0
	bl move_anim_8072740
_0807952C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8079518

	thumb_func_start sub_8079534
sub_8079534: @ 8079534
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _08079548 @ =gBattleAnimArgs
	movs r2, 0xC
	ldrsh r1, [r0, r2]
	cmp r1, 0
	bne _0807954C
	movs r4, 0x1
	movs r7, 0x3
	b _08079550
	.align 2, 0
_08079548: .4byte gBattleAnimArgs
_0807954C:
	movs r4, 0
	movs r7, 0x1
_08079550:
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08079568
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80787B0
	ldr r0, _08079564 @ =gUnknown_0202F7C8
	b _08079572
	.align 2, 0
_08079564: .4byte gUnknown_0202F7C8
_08079568:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8078764
	ldr r0, _080795D0 @ =gUnknown_0202F7C9
_08079572:
	ldrb r6, [r0]
	ldr r0, _080795D4 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807958A
	ldr r1, _080795D8 @ =gBattleAnimArgs
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_0807958A:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8078764
	ldr r4, _080795D8 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x2E]
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r4, 0x4]
	adds r0, r2
	strh r0, [r5, 0x32]
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x6]
	adds r0, r4
	strh r0, [r5, 0x36]
	ldr r0, _080795DC @ =sub_8078B34
	str r0, [r5, 0x1C]
	ldr r1, _080795E0 @ =move_anim_8072740
	adds r0, r5, 0
	bl oamt_set_x3A_32
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080795D0: .4byte gUnknown_0202F7C9
_080795D4: .4byte gUnknown_0202F7C8
_080795D8: .4byte gBattleAnimArgs
_080795DC: .4byte sub_8078B34
_080795E0: .4byte move_anim_8072740
	thumb_func_end sub_8079534

	thumb_func_start duplicate_obj_of_side_rel2move_in_transparent_mode
duplicate_obj_of_side_rel2move_in_transparent_mode: @ 80795E4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _0807964E
	movs r6, 0
	ldr r2, _08079640 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r1, r0, 2
_08079600:
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r4, r0, r2
	adds r5, r4, 0
	adds r5, 0x3E
	ldrb r0, [r5]
	lsls r0, 31
	cmp r0, 0
	bne _08079644
	adds r0, r4, 0
	adds r1, r2
	movs r2, 0x44
	bl memcpy
	ldrb r1, [r4, 0x1]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4, 0x1]
	ldrb r0, [r5]
	adds r2, 0x8
	adds r1, r2, 0
	ands r0, r1
	strb r0, [r5]
	lsls r0, r6, 16
	asrs r0, 16
	b _08079652
	.align 2, 0
_08079640: .4byte gSprites
_08079644:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3F
	bls _08079600
_0807964E:
	movs r0, 0x1
	negs r0, r0
_08079652:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end duplicate_obj_of_side_rel2move_in_transparent_mode

	thumb_func_start obj_delete_but_dont_free_vram
obj_delete_but_dont_free_vram: @ 8079658
	push {lr}
	adds r3, r0, 0
	adds r3, 0x3F
	ldrb r1, [r3]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r3]
	bl DestroySprite
	pop {r0}
	bx r0
	thumb_func_end obj_delete_but_dont_free_vram

	thumb_func_start sub_8079670
sub_8079670: @ 8079670
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r5, 0
	movs r3, 0
	ldr r4, _080796E4 @ =gBattleAnimArgs
	movs r0, 0x4
	ldrsh r1, [r4, r0]
	movs r6, 0
	ldrsh r0, [r4, r6]
	cmp r1, r0
	ble _0807968A
	movs r3, 0x1
_0807968A:
	cmp r1, r0
	bge _08079690
	ldr r3, _080796E8 @ =0x0000ffff
_08079690:
	movs r0, 0x6
	ldrsh r1, [r4, r0]
	movs r6, 0x2
	ldrsh r0, [r4, r6]
	cmp r1, r0
	ble _0807969E
	movs r5, 0x1
_0807969E:
	cmp r1, r0
	bge _080796A4
	ldr r5, _080796E8 @ =0x0000ffff
_080796A4:
	ldr r0, _080796EC @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r2, 0
	strh r2, [r1, 0x8]
	ldrh r0, [r4, 0x8]
	strh r0, [r1, 0xA]
	strh r2, [r1, 0xC]
	ldrh r0, [r4]
	strh r0, [r1, 0xE]
	ldrh r0, [r4, 0x2]
	strh r0, [r1, 0x10]
	strh r3, [r1, 0x12]
	strh r5, [r1, 0x14]
	ldrh r0, [r4, 0x4]
	strh r0, [r1, 0x16]
	ldrh r0, [r4, 0x6]
	strh r0, [r1, 0x18]
	ldr r3, _080796F0 @ =REG_BLDALPHA
	ldrh r0, [r4, 0x2]
	lsls r0, 8
	ldrh r2, [r4]
	orrs r0, r2
	strh r0, [r3]
	ldr r0, _080796F4 @ =sub_80796F8
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080796E4: .4byte gBattleAnimArgs
_080796E8: .4byte 0x0000ffff
_080796EC: .4byte gTasks
_080796F0: .4byte REG_BLDALPHA
_080796F4: .4byte sub_80796F8
	thumb_func_end sub_8079670

	thumb_func_start sub_80796F8
sub_80796F8: @ 80796F8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08079744 @ =gTasks
	adds r3, r0, r1
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xA
	ldrsh r1, [r3, r2]
	cmp r0, r1
	ble _08079786
	movs r0, 0
	strh r0, [r3, 0x8]
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08079748
	ldrh r2, [r3, 0xE]
	movs r5, 0xE
	ldrsh r1, [r3, r5]
	movs r5, 0x16
	ldrsh r0, [r3, r5]
	cmp r1, r0
	beq _0807975C
	ldrh r0, [r3, 0x12]
	adds r0, r2, r0
	strh r0, [r3, 0xE]
	b _0807975C
	.align 2, 0
_08079744: .4byte gTasks
_08079748:
	ldrh r2, [r3, 0x10]
	movs r0, 0x10
	ldrsh r1, [r3, r0]
	movs r5, 0x18
	ldrsh r0, [r3, r5]
	cmp r1, r0
	beq _0807975C
	ldrh r0, [r3, 0x14]
	adds r0, r2, r0
	strh r0, [r3, 0x10]
_0807975C:
	ldr r2, _0807978C @ =REG_BLDALPHA
	ldrh r0, [r3, 0x10]
	lsls r0, 8
	ldrh r1, [r3, 0xE]
	orrs r0, r1
	strh r0, [r2]
	movs r0, 0xE
	ldrsh r1, [r3, r0]
	movs r2, 0x16
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bne _08079786
	movs r5, 0x10
	ldrsh r1, [r3, r5]
	movs r2, 0x18
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bne _08079786
	adds r0, r4, 0
	bl move_anim_task_del
_08079786:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807978C: .4byte REG_BLDALPHA
	thumb_func_end sub_80796F8

	thumb_func_start sub_8079790
sub_8079790: @ 8079790
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080797B0 @ =gBattleAnimArgs
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xFF
	bne _080797B4
	adds r0, r4, 0
	bl move_anim_task_del
	b _080797DA
	.align 2, 0
_080797B0: .4byte gBattleAnimArgs
_080797B4:
	ldr r1, _080797E0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r2, _080797E4 @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	lsls r1, 4
	ldr r3, _080797E8 @ =0x00000101
	adds r2, r3, 0
	adds r1, r2
	strh r1, [r0, 0x8]
	bl sub_80797EC
_080797DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080797E0: .4byte gTasks
_080797E4: .4byte gSprites
_080797E8: .4byte 0x00000101
	thumb_func_end sub_8079790

	thumb_func_start sub_80797EC
sub_80797EC: @ 80797EC
	ldr r3, _0807980C @ =gBattleAnimArgs
	ldrh r1, [r3, 0x2]
	movs r2, 0
	strh r1, [r0, 0xA]
	strh r2, [r0, 0xC]
	ldrh r1, [r3, 0x4]
	strh r1, [r0, 0xE]
	strh r2, [r0, 0x10]
	ldrh r1, [r3, 0x6]
	strh r1, [r0, 0x12]
	strh r2, [r0, 0x14]
	ldrh r1, [r3, 0x8]
	strh r1, [r0, 0x16]
	ldr r1, _08079810 @ =sub_8079814
	str r1, [r0]
	bx lr
	.align 2, 0
_0807980C: .4byte gBattleAnimArgs
_08079810: .4byte sub_8079814
	thumb_func_end sub_80797EC

	thumb_func_start sub_8079814
sub_8079814: @ 8079814
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807986C @ =gTasks
	adds r4, r0, r1
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080798A4
	movs r0, 0
	strh r0, [r4, 0x10]
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08079870
	ldrh r2, [r4, 0xC]
	adds r2, 0x1
	strh r2, [r4, 0xC]
	ldrh r0, [r4, 0x8]
	lsls r2, 24
	lsrs r2, 24
	ldrh r3, [r4, 0xA]
	movs r1, 0xF
	bl BlendPalette
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080798A4
	movs r0, 0x1
	strh r0, [r4, 0x14]
	b _080798A4
	.align 2, 0
_0807986C: .4byte gTasks
_08079870:
	ldrh r2, [r4, 0xC]
	subs r2, 0x1
	strh r2, [r4, 0xC]
	ldrh r0, [r4, 0x8]
	lsls r2, 24
	lsrs r2, 24
	ldrh r3, [r4, 0xA]
	movs r1, 0xF
	bl BlendPalette
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	cmp r1, 0
	bne _080798A4
	ldrh r0, [r4, 0x16]
	subs r0, 0x1
	strh r0, [r4, 0x16]
	lsls r0, 16
	cmp r0, 0
	beq _0807989E
	strh r1, [r4, 0x10]
	strh r1, [r4, 0x14]
	b _080798A4
_0807989E:
	adds r0, r5, 0
	bl move_anim_task_del
_080798A4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8079814

	thumb_func_start sub_80798AC
sub_80798AC: @ 80798AC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080798CC @ =gBattleAnimArgs
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _080798D0
	adds r0, r4, 0
	bl move_anim_task_del
	b _080798E6
	.align 2, 0
_080798CC: .4byte gBattleAnimArgs
_080798D0:
	ldr r1, _080798EC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	lsls r1, r2, 4
	ldr r2, _080798F0 @ =0x00000101
	adds r1, r2
	strh r1, [r0, 0x8]
	bl sub_80797EC
_080798E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080798EC: .4byte gTasks
_080798F0: .4byte 0x00000101
	thumb_func_end sub_80798AC

	thumb_func_start sub_80798F4
sub_80798F4: @ 80798F4
	push {r4,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0
	strh r1, [r3, 0x16]
	strh r1, [r3, 0x18]
	strh r1, [r3, 0x1A]
	strh r4, [r3, 0x26]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r3, 0x1C]
	strh r0, [r3, 0x1E]
	strh r1, [r3, 0x20]
	adds r0, r3, 0
	adds r0, 0x22
	adds r3, 0x24
	adds r1, r3, 0
	bl sub_8079BF4
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078E70
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80798F4

	thumb_func_start sub_807992C
sub_807992C: @ 807992C
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _080799CC @ =gUnknown_0202F7D4
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	bl sub_8079BFC
	movs r3, 0x16
	ldrsh r1, [r4, r3]
	lsls r1, 3
	adds r1, r0, r1
	str r1, [r5]
	movs r6, 0
	ldrsh r2, [r1, r6]
	ldr r0, _080799D0 @ =0x00007ffe
	cmp r2, r0
	beq _080799D4
	cmp r2, r0
	bgt _08079A34
	subs r0, 0x1
	cmp r2, r0
	beq _080799DA
	ldrb r0, [r1, 0x5]
	cmp r0, 0
	bne _0807997A
	ldrh r0, [r1]
	strh r0, [r4, 0x1C]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x1E]
	ldrb r0, [r1, 0x4]
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
	adds r0, r1, 0
	adds r0, 0x8
	str r0, [r5]
_0807997A:
	ldr r1, [r5]
	ldrh r0, [r1]
	ldrh r2, [r4, 0x1C]
	adds r0, r2
	strh r0, [r4, 0x1C]
	ldrh r0, [r1, 0x2]
	ldrh r3, [r4, 0x1E]
	adds r0, r3
	strh r0, [r4, 0x1E]
	ldrh r0, [r4, 0x20]
	ldrb r1, [r1, 0x4]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0x1C
	ldrsh r1, [r4, r6]
	movs r3, 0x1E
	ldrsh r2, [r4, r3]
	ldrh r3, [r4, 0x20]
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079A64
	ldrh r0, [r4, 0x18]
	adds r0, 0x1
	strh r0, [r4, 0x18]
	lsls r0, 16
	asrs r0, 16
	ldr r1, [r5]
	ldrb r1, [r1, 0x5]
	cmp r0, r1
	blt _08079A5A
	movs r0, 0
	strh r0, [r4, 0x18]
	b _08079A2C
	.align 2, 0
_080799CC: .4byte gUnknown_0202F7D4
_080799D0: .4byte 0x00007ffe
_080799D4:
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x16]
	b _08079A5A
_080799DA:
	ldrh r2, [r1, 0x2]
	movs r6, 0x2
	ldrsh r0, [r1, r6]
	cmp r0, 0
	beq _08079A2C
	ldrh r1, [r4, 0x1A]
	movs r3, 0x1A
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080799FA
	subs r0, r1, 0x1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	cmp r0, 0
	bne _080799FC
	b _08079A2C
_080799FA:
	strh r2, [r4, 0x1A]
_080799FC:
	movs r6, 0x16
	ldrsh r0, [r4, r6]
	cmp r0, 0
	beq _08079A5A
	ldr r3, _08079A24 @ =gUnknown_0202F7D4
	ldr r5, _08079A28 @ =0x00007ffd
_08079A08:
	ldrh r2, [r4, 0x16]
	subs r1, r2, 0x1
	strh r1, [r4, 0x16]
	ldr r0, [r3]
	subs r0, 0x8
	str r0, [r3]
	movs r6, 0
	ldrsh r0, [r0, r6]
	cmp r0, r5
	beq _08079A58
	lsls r0, r1, 16
	cmp r0, 0
	bne _08079A08
	b _08079A5A
	.align 2, 0
_08079A24: .4byte gUnknown_0202F7D4
_08079A28: .4byte 0x00007ffd
_08079A2C:
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
	b _08079A5A
_08079A34:
	ldr r2, _08079A54 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x26]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F40
	movs r0, 0
	b _08079A5C
	.align 2, 0
_08079A54: .4byte gSprites
_08079A58:
	strh r2, [r4, 0x16]
_08079A5A:
	movs r0, 0x1
_08079A5C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_807992C

	thumb_func_start sub_8079A64
sub_8079A64: @ 8079A64
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8079B10
	lsls r0, 16
	lsrs r0, 15
	movs r1, 0x40
	subs r5, r1, r0
	ldr r1, _08079AB0 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r4, r0, r1
	ldrb r1, [r4, 0x3]
	lsls r1, 26
	lsrs r1, 27
	lsls r0, r5, 8
	ldr r2, _08079AB4 @ =gOamMatrices
	lsls r1, 3
	adds r1, r2
	movs r2, 0x6
	ldrsh r1, [r1, r2]
	bl __divsi3
	cmp r0, 0x80
	ble _08079AA0
	movs r0, 0x80
_08079AA0:
	subs r0, r5, r0
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079AB0: .4byte gSprites
_08079AB4: .4byte gOamMatrices
	thumb_func_end sub_8079A64

	thumb_func_start sub_8079AB8
sub_8079AB8: @ 8079AB8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079B10
	lsls r0, 16
	lsrs r0, 15
	movs r1, 0x40
	subs r5, r1, r0
	ldr r1, _08079B08 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r4, r0, r1
	ldrb r1, [r4, 0x3]
	lsls r1, 26
	lsrs r1, 27
	lsls r0, r5, 8
	ldr r2, _08079B0C @ =gOamMatrices
	lsls r1, 3
	adds r1, r2
	movs r2, 0x6
	ldrsh r1, [r1, r2]
	bl __divsi3
	cmp r0, 0x80
	ble _08079AF8
	movs r0, 0x80
_08079AF8:
	subs r0, r5, r0
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079B08: .4byte gSprites
_08079B0C: .4byte gOamMatrices
	thumb_func_end sub_8079AB8

	thumb_func_start sub_8079B10
sub_8079B10: @ 8079B10
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08079B44 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	movs r4, 0
	ldr r1, _08079B48 @ =gUnknown_02024BE0
	ldr r6, _08079B4C @ =gMonBackPicCoords
	lsrs r5, r0, 22
_08079B2C:
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, r2
	bne _08079BE0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08079B54
	ldr r0, _08079B50 @ =0x02019348
	ldrh r1, [r0]
	b _08079B96
	.align 2, 0
_08079B44: .4byte gSprites
_08079B48: .4byte gUnknown_02024BE0
_08079B4C: .4byte gMonBackPicCoords
_08079B50: .4byte 0x02019348
_08079B54:
	lsls r0, r4, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08079B9E
	ldr r0, _08079B88 @ =0x02017800
	adds r1, r5, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08079B94
	ldr r1, _08079B8C @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08079B90 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	b _08079B96
	.align 2, 0
_08079B88: .4byte 0x02017800
_08079B8C: .4byte gUnknown_02024A6A
_08079B90: .4byte gPlayerParty
_08079B94:
	ldrh r1, [r1, 0x2]
_08079B96:
	lsls r0, r1, 2
	adds r0, r6
	ldrb r0, [r0, 0x1]
	b _08079BEC
_08079B9E:
	ldr r0, _08079BC4 @ =0x02017800
	adds r1, r5, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08079BD0
	ldr r1, _08079BC8 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08079BCC @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	b _08079BD2
	.align 2, 0
_08079BC4: .4byte 0x02017800
_08079BC8: .4byte gUnknown_02024A6A
_08079BCC: .4byte gEnemyParty
_08079BD0:
	ldrh r1, [r1, 0x2]
_08079BD2:
	ldr r0, _08079BDC @ =gMonFrontPicCoords
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	b _08079BEC
	.align 2, 0
_08079BDC: .4byte gMonFrontPicCoords
_08079BE0:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _08079B2C
	movs r0, 0x40
_08079BEC:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8079B10

	thumb_func_start sub_8079BF4
sub_8079BF4: @ 8079BF4
	strh r2, [r0]
	asrs r2, 16
	strh r2, [r1]
	bx lr
	thumb_func_end sub_8079BF4

	thumb_func_start sub_8079BFC
sub_8079BFC: @ 8079BFC
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	orrs r0, r1
	bx lr
	thumb_func_end sub_8079BFC

	thumb_func_start sub_8079C08
sub_8079C08: @ 8079C08
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r5, r3, 0
	ldr r0, [sp, 0x14]
	ldr r4, [sp, 0x18]
	ldr r6, [sp, 0x1C]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r6, 16
	lsrs r6, 16
	mov r3, r8
	strh r6, [r3, 0x18]
	strh r1, [r3, 0x26]
	strh r2, [r3, 0x1A]
	strh r5, [r3, 0x1C]
	strh r0, [r3, 0x22]
	strh r4, [r3, 0x24]
	lsls r0, 16
	asrs r0, 16
	lsls r2, 16
	asrs r2, 16
	subs r0, r2
	adds r1, r6, 0
	bl __divsi3
	mov r1, r8
	strh r0, [r1, 0x1E]
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	subs r4, r5
	adds r0, r4, 0
	adds r1, r6, 0
	bl __divsi3
	mov r3, r8
	strh r0, [r3, 0x20]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8079C08

	thumb_func_start sub_8079C74
sub_8079C74: @ 8079C74
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x18]
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08079C86
	movs r0, 0
	b _08079CE2
_08079C86:
	subs r0, r1, 0x1
	strh r0, [r4, 0x18]
	lsls r0, 16
	cmp r0, 0
	beq _08079CA0
	ldrh r0, [r4, 0x1E]
	ldrh r3, [r4, 0x1A]
	adds r0, r3
	strh r0, [r4, 0x1A]
	ldrh r0, [r4, 0x20]
	ldrh r1, [r4, 0x1C]
	adds r0, r1
	b _08079CA6
_08079CA0:
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x1A]
	ldrh r0, [r4, 0x24]
_08079CA6:
	strh r0, [r4, 0x1C]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x1A
	ldrsh r1, [r4, r2]
	movs r3, 0x1C
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl obj_id_set_rotscale
	movs r0, 0x18
	ldrsh r3, [r4, r0]
	cmp r3, 0
	beq _08079CD0
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079A64
	b _08079CE0
_08079CD0:
	ldr r2, _08079CE8 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x26]
_08079CE0:
	ldrb r0, [r4, 0x18]
_08079CE2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08079CE8: .4byte gSprites
	thumb_func_end sub_8079C74

	thumb_func_start sub_8079CEC
sub_8079CEC: @ 8079CEC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08079D18 @ =gUnknown_0202F7BE
	ldrb r0, [r0]
	movs r1, 0
	cmp r0, 0x1E
	bls _08079D0A
	movs r1, 0x1
	cmp r0, 0x64
	bls _08079D0A
	movs r1, 0x3
	cmp r0, 0xC8
	bhi _08079D0A
	movs r1, 0x2
_08079D0A:
	ldr r0, _08079D1C @ =gBattleAnimArgs
	strh r1, [r0, 0xE]
	adds r0, r2, 0
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_08079D18: .4byte gUnknown_0202F7BE
_08079D1C: .4byte gBattleAnimArgs
	thumb_func_end sub_8079CEC

	thumb_func_start unref_sub_8079D20
unref_sub_8079D20: @ 8079D20
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	ldr r6, _08079E14 @ =gUnknown_0202F7C9
	ldrb r0, [r6]
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079D60
	ldr r2, _08079E18 @ =gSprites
	ldr r1, _08079E1C @ =gUnknown_02024BE0
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	adds r2, r4, 0
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
_08079D60:
	ldr r0, _08079E20 @ =gUnknown_0202F7C8
	mov r8, r0
	ldrb r0, [r0]
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079D98
	ldr r2, _08079E18 @ =gSprites
	ldr r1, _08079E1C @ =gUnknown_02024BE0
	mov r3, r8
	ldrb r0, [r3]
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	adds r2, r4, 0
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
_08079D98:
	ldrb r0, [r6]
	movs r5, 0x2
	eors r0, r5
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079DD0
	ldr r2, _08079E18 @ =gSprites
	ldr r1, _08079E1C @ =gUnknown_02024BE0
	ldrb r0, [r6]
	eors r0, r5
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	adds r2, r4, 0
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
_08079DD0:
	mov r1, r8
	ldrb r0, [r1]
	eors r0, r5
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079E08
	ldr r2, _08079E18 @ =gSprites
	ldr r1, _08079E1C @ =gUnknown_02024BE0
	mov r3, r8
	ldrb r0, [r3]
	eors r0, r5
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	ands r7, r0
	lsls r3, r7, 2
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
_08079E08:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079E14: .4byte gUnknown_0202F7C9
_08079E18: .4byte gSprites
_08079E1C: .4byte gUnknown_02024BE0
_08079E20: .4byte gUnknown_0202F7C8
	thumb_func_end unref_sub_8079D20

	thumb_func_start sub_8079E24
sub_8079E24: @ 8079E24
	push {r4-r6,lr}
	movs r5, 0
	ldr r0, _08079E84 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r5, r0
	bge _08079E7E
	ldr r6, _08079E88 @ =gSprites
_08079E32:
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079E74
	adds r0, r4, 0
	bl sub_8079E90
	ldr r3, _08079E8C @ =gUnknown_02024BE0
	adds r3, r5, r3
	ldrb r2, [r3]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r6
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r2, [r0, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r2, r1
	movs r1, 0x8
	orrs r2, r1
	strb r2, [r0, 0x5]
_08079E74:
	adds r5, 0x1
	ldr r0, _08079E84 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r5, r0
	blt _08079E32
_08079E7E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08079E84: .4byte gUnknown_02024A68
_08079E88: .4byte gSprites
_08079E8C: .4byte gUnknown_02024BE0
	thumb_func_end sub_8079E24

	thumb_func_start sub_8079E90
sub_8079E90: @ 8079E90
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08079EAC
	cmp r4, 0x2
	bne _08079EA8
	movs r0, 0x1E
	b _08079ECC
_08079EA8:
	movs r0, 0x28
	b _08079ECC
_08079EAC:
	adds r0, r4, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1E
	cmp r0, 0
	beq _08079ECA
	movs r1, 0x14
	cmp r0, 0x2
	beq _08079ECA
	movs r1, 0x32
	cmp r0, 0x1
	bne _08079ECA
	movs r1, 0x28
_08079ECA:
	adds r0, r1, 0
_08079ECC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8079E90

	thumb_func_start sub_8079ED4
sub_8079ED4: @ 8079ED4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08079EF0
	movs r0, 0x2
	b _08079F08
_08079EF0:
	cmp r4, 0
	beq _08079EF8
	cmp r4, 0x3
	bne _08079F00
_08079EF8:
	ldr r0, _08079EFC @ =REG_BG2CNT
	b _08079F02
	.align 2, 0
_08079EFC: .4byte REG_BG2CNT
_08079F00:
	ldr r0, _08079F10 @ =REG_BG1CNT
_08079F02:
	ldr r0, [r0]
	lsls r0, 30
	lsrs r0, 30
_08079F08:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08079F10: .4byte REG_BG1CNT
	thumb_func_end sub_8079ED4

	thumb_func_start battle_get_per_side_status_permutated
battle_get_per_side_status_permutated: @ 8079F14
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08079F3A
	adds r0, r4, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08079F36
	cmp r0, 0x3
	bne _08079F3A
_08079F36:
	movs r0, 0x2
	b _08079F3C
_08079F3A:
	movs r0, 0x1
_08079F3C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end battle_get_per_side_status_permutated

	thumb_func_start sub_8079F44
sub_8079F44: @ 8079F44
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	ldr r4, [sp, 0x38]
	ldr r5, [sp, 0x3C]
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 16
	lsrs r3, 16
	mov r9, r3
	lsls r4, 16
	lsrs r4, 16
	str r4, [sp, 0x10]
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp, 0x14]
	lsls r0, r7, 3
	ldr r1, _08079FE0 @ =gUnknown_0837F5E0
	adds r0, r1
	bl LoadSpriteSheet
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	ldr r1, _08079FE4 @ =gSpriteTemplate_837F5B0
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x2]
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, r8
	cmp r0, 0
	bne _08079FF0
	adds r0, r6, 0
	ldr r1, [sp, 0x44]
	ldr r2, [sp, 0x40]
	bl species_and_otid_get_pal
	lsls r1, r4, 20
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r0, r6, 3
	ldr r1, _08079FE8 @ =gMonFrontPicTable
	adds r0, r1
	ldr r2, _08079FEC @ =gMonFrontPicCoords
	lsls r5, r6, 2
	adds r2, r5, r2
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	str r3, [sp]
	str r6, [sp, 0x4]
	ldr r4, [sp, 0x40]
	str r4, [sp, 0x8]
	movs r4, 0x1
	str r4, [sp, 0xC]
	bl sub_800D378
	b _0807A02E
	.align 2, 0
_08079FE0: .4byte gUnknown_0837F5E0
_08079FE4: .4byte gSpriteTemplate_837F5B0
_08079FE8: .4byte gMonFrontPicTable
_08079FEC: .4byte gMonFrontPicCoords
_08079FF0:
	adds r0, r6, 0
	ldr r1, [sp, 0x44]
	ldr r2, [sp, 0x40]
	bl species_and_otid_get_pal
	lsls r1, r4, 20
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r0, r6, 3
	ldr r1, _0807A068 @ =gMonBackPicTable
	adds r0, r1
	ldr r2, _0807A06C @ =gMonBackPicCoords
	lsls r5, r6, 2
	adds r2, r5, r2
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	str r3, [sp]
	str r6, [sp, 0x4]
	ldr r4, [sp, 0x40]
	str r4, [sp, 0x8]
	movs r4, 0
	str r4, [sp, 0xC]
	bl sub_800D378
_0807A02E:
	movs r2, 0x80
	lsls r2, 18
	mov r6, r10
	lsls r0, r6, 5
	ldr r1, _0807A070 @ =0x06010000
	adds r0, r1
	ldr r1, _0807A074 @ =0x040000d4
	str r2, [r1]
	str r0, [r1, 0x4]
	ldr r0, _0807A078 @ =0x84000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r2, r8
	cmp r2, 0
	bne _0807A084
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 3
	ldr r1, _0807A07C @ =gSpriteTemplate_837F5B0
	adds r0, r1
	mov r3, r9
	lsls r1, r3, 16
	asrs r1, 16
	ldr r2, _0807A080 @ =gMonFrontPicCoords
	adds r2, r5, r2
	ldrb r2, [r2, 0x1]
	ldr r4, [sp, 0x10]
	adds r2, r4
	b _0807A09E
	.align 2, 0
_0807A068: .4byte gMonBackPicTable
_0807A06C: .4byte gMonBackPicCoords
_0807A070: .4byte 0x06010000
_0807A074: .4byte 0x040000d4
_0807A078: .4byte 0x84000200
_0807A07C: .4byte gSpriteTemplate_837F5B0
_0807A080: .4byte gMonFrontPicCoords
_0807A084:
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 3
	ldr r1, _0807A0E4 @ =gSpriteTemplate_837F5B0
	adds r0, r1
	mov r6, r9
	lsls r1, r6, 16
	asrs r1, 16
	ldr r2, _0807A0E8 @ =gMonBackPicCoords
	adds r2, r5, r2
	ldrb r2, [r2, 0x1]
	ldr r3, [sp, 0x10]
	adds r2, r3
_0807A09E:
	lsls r2, 16
	asrs r2, 16
	ldr r3, [sp, 0x14]
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0807A0D0
	ldr r3, _0807A0EC @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x10
	adds r1, r0, r1
	ldr r2, _0807A0F0 @ =gSpriteAffineAnimTable_81E7C18
	str r2, [r1]
	adds r0, r3
	movs r1, 0
	bl StartSpriteAffineAnim
_0807A0D0:
	adds r0, r4, 0
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807A0E4: .4byte gSpriteTemplate_837F5B0
_0807A0E8: .4byte gMonBackPicCoords
_0807A0EC: .4byte gSprites
_0807A0F0: .4byte gSpriteAffineAnimTable_81E7C18
	thumb_func_end sub_8079F44

	thumb_func_start sub_807A0F4
sub_807A0F4: @ 807A0F4
	push {lr}
	bl DestroySpriteAndFreeResources
	pop {r0}
	bx r0
	thumb_func_end sub_807A0F4

	thumb_func_start sub_807A100
sub_807A100: @ 807A100
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0807A1A4
	ldr r2, _0807A130 @ =0x02019348
	ldrb r1, [r2, 0x4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0807A134
	ldrh r7, [r2, 0x2]
	ldr r2, [r2, 0x10]
	b _0807A138
	.align 2, 0
_0807A130: .4byte 0x02019348
_0807A134:
	ldrh r7, [r2]
	ldr r2, [r2, 0x8]
_0807A138:
	cmp r7, 0xC9
	bne _0807A184
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0807A170
	movs r0, 0xC9
	b _0807A17A
_0807A170:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_0807A17A:
	lsls r1, r0, 2
	ldr r0, _0807A180 @ =gMonBackPicCoords
	b _0807A33C
	.align 2, 0
_0807A180: .4byte gMonBackPicCoords
_0807A184:
	ldr r0, _0807A19C @ =SPECIES_CASTFORM
	cmp r7, r0
	bne _0807A18C
	b _0807A30C
_0807A18C:
	movs r0, 0xCE
	lsls r0, 1
	cmp r7, r0
	bhi _0807A258
	lsls r1, r7, 2
	ldr r0, _0807A1A0 @ =gMonBackPicCoords
	b _0807A33C
	.align 2, 0
_0807A19C: .4byte SPECIES_CASTFORM
_0807A1A0: .4byte gMonBackPicCoords
_0807A1A4:
	mov r0, r8
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0807A26C
	mov r0, r8
	lsls r2, r0, 2
	ldr r0, _0807A1EC @ =0x02017800
	adds r1, r2, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _0807A1F8
	ldr r0, _0807A1F0 @ =gUnknown_02024A6A
	mov r1, r8
	lsls r4, r1, 1
	adds r4, r0
	ldrh r0, [r4]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0807A1F4 @ =gPlayerParty
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	ldrh r0, [r4]
	muls r0, r6
	adds r0, r5
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	b _0807A200
	.align 2, 0
_0807A1EC: .4byte 0x02017800
_0807A1F0: .4byte gUnknown_02024A6A
_0807A1F4: .4byte gPlayerParty
_0807A1F8:
	ldrh r7, [r1, 0x2]
	ldr r0, _0807A238 @ =gUnknown_02024E70
	adds r0, r2, r0
	ldr r2, [r0]
_0807A200:
	cmp r7, 0xC9
	bne _0807A250
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0807A23C
	movs r0, 0xC9
	b _0807A246
	.align 2, 0
_0807A238: .4byte gUnknown_02024E70
_0807A23C:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_0807A246:
	lsls r1, r0, 2
	ldr r0, _0807A24C @ =gMonBackPicCoords
	b _0807A33C
	.align 2, 0
_0807A24C: .4byte gMonBackPicCoords
_0807A250:
	movs r0, 0xCE
	lsls r0, 1
	cmp r7, r0
	bls _0807A260
_0807A258:
	ldr r4, _0807A25C @ =gMonBackPicCoords
	b _0807A33E
	.align 2, 0
_0807A25C: .4byte gMonBackPicCoords
_0807A260:
	lsls r1, r7, 2
	ldr r0, _0807A268 @ =gMonBackPicCoords
	b _0807A33C
	.align 2, 0
_0807A268: .4byte gMonBackPicCoords
_0807A26C:
	mov r0, r8
	lsls r2, r0, 2
	ldr r0, _0807A2A8 @ =0x02017800
	adds r1, r2, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _0807A2B4
	ldr r0, _0807A2AC @ =gUnknown_02024A6A
	mov r1, r8
	lsls r4, r1, 1
	adds r4, r0
	ldrh r0, [r4]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0807A2B0 @ =gEnemyParty
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	ldrh r0, [r4]
	muls r0, r6
	adds r0, r5
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	b _0807A2BC
	.align 2, 0
_0807A2A8: .4byte 0x02017800
_0807A2AC: .4byte gUnknown_02024A6A
_0807A2B0: .4byte gEnemyParty
_0807A2B4:
	ldrh r7, [r1, 0x2]
	ldr r0, _0807A2F4 @ =gUnknown_02024E70
	adds r0, r2, r0
	ldr r2, [r0]
_0807A2BC:
	cmp r7, 0xC9
	bne _0807A306
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0807A2F8
	movs r0, 0xC9
	b _0807A302
	.align 2, 0
_0807A2F4: .4byte gUnknown_02024E70
_0807A2F8:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_0807A302:
	lsls r1, r0, 2
	b _0807A33A
_0807A306:
	ldr r0, _0807A31C @ =SPECIES_CASTFORM
	cmp r7, r0
	bne _0807A328
_0807A30C:
	ldr r0, _0807A320 @ =gUnknown_02024E84
	add r0, r8
	ldrb r0, [r0]
	lsls r0, 2
	ldr r1, _0807A324 @ =gUnknownCastformCoords_0837F598
	adds r4, r0, r1
	b _0807A33E
	.align 2, 0
_0807A31C: .4byte SPECIES_CASTFORM
_0807A320: .4byte gUnknown_02024E84
_0807A324: .4byte gUnknownCastformCoords_0837F598
_0807A328:
	movs r0, 0xCE
	lsls r0, 1
	cmp r7, r0
	bls _0807A338
	ldr r4, _0807A334 @ =gMonFrontPicCoords
	b _0807A33E
	.align 2, 0
_0807A334: .4byte gMonFrontPicCoords
_0807A338:
	lsls r1, r7, 2
_0807A33A:
	ldr r0, _0807A350 @ =gMonFrontPicCoords
_0807A33C:
	adds r4, r1, r0
_0807A33E:
	mov r0, r9
	cmp r0, 0x6
	bhi _0807A3EE
	lsls r0, 2
	ldr r1, _0807A354 @ =_0807A358
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807A350: .4byte gMonFrontPicCoords
_0807A354: .4byte _0807A358
	.align 2, 0
_0807A358:
	.4byte _0807A374
	.4byte _0807A37E
	.4byte _0807A3AA
	.4byte _0807A3C2
	.4byte _0807A386
	.4byte _0807A398
	.4byte _0807A3DA
_0807A374:
	ldrb r1, [r4]
	movs r0, 0xF
	ands r0, r1
	lsls r0, 3
	b _0807A3F0
_0807A37E:
	ldrb r0, [r4]
	lsrs r0, 4
	lsls r0, 3
	b _0807A3F0
_0807A386:
	mov r0, r8
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4]
	lsrs r1, 4
	b _0807A3BC
_0807A398:
	mov r0, r8
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4]
	lsrs r1, 4
	b _0807A3D4
_0807A3AA:
	mov r0, r8
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r4]
	movs r1, 0xF
	ands r1, r2
_0807A3BC:
	lsls r1, 2
	subs r0, r1
	b _0807A3F0
_0807A3C2:
	mov r0, r8
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r4]
	movs r1, 0xF
	ands r1, r2
_0807A3D4:
	lsls r1, 2
	adds r0, r1
	b _0807A3F0
_0807A3DA:
	mov r0, r8
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1F
	ldrb r1, [r4, 0x1]
	subs r0, r1
	b _0807A3F0
_0807A3EE:
	movs r0, 0
_0807A3F0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_807A100

	thumb_func_start sub_807A3FC
sub_807A3FC: @ 807A3FC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r2
	mov r10, r3
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	cmp r1, 0
	bne _0807A41A
	movs r5, 0
	movs r6, 0x1
	b _0807A41E
_0807A41A:
	movs r5, 0x2
	movs r6, 0x3
_0807A41E:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r7, r0, 24
	bl IsDoubleBattle
	lsls r0, 24
	cmp r0, 0
	beq _0807A470
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0807A470
	movs r0, 0x2
	eors r4, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r3, r0, 24
	mov r0, r8
	lsls r1, r0, 16
	lsls r2, r7, 16
	b _0807A47C
_0807A470:
	mov r0, r8
	lsls r1, r0, 16
	lsrs r5, r1, 16
	lsls r0, r7, 16
	lsrs r3, r0, 16
	adds r2, r0, 0
_0807A47C:
	asrs r0, r1, 16
	adds r0, r5
	asrs r0, 1
	mov r1, r9
	strh r0, [r1]
	asrs r0, r2, 16
	adds r0, r3
	asrs r0, 1
	mov r1, r10
	strh r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807A3FC

	thumb_func_start sub_807A4A0
sub_807A4A0: @ 807A4A0
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x4
	lsls r6, r1, 24
	lsrs r6, 24
	ldr r0, _0807A538 @ =SpriteCallbackDummy
	mov r10, r0
	bl object_new_hidden_with_callback
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0807A53C @ =gSprites
	mov r9, r0
	mov r0, r8
	lsls r3, r0, 4
	add r3, r8
	lsls r3, 2
	mov r0, r9
	adds r5, r3, r0
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	add r4, r9
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x44
	str r3, [sp]
	bl memcpy
	adds r2, r5, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldrb r2, [r5, 0x5]
	movs r1, 0xD
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r5, 0x5]
	ldrb r0, [r5, 0x1]
	ands r1, r0
	movs r0, 0x8
	orrs r1, r0
	strb r1, [r5, 0x1]
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 22
	ldrh r2, [r5, 0x4]
	ldr r0, _0807A540 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	movs r0, 0x1C
	add r9, r0
	ldr r3, [sp]
	add r3, r9
	mov r0, r10
	str r0, [r3]
	mov r0, r8
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0807A538: .4byte SpriteCallbackDummy
_0807A53C: .4byte gSprites
_0807A540: .4byte 0xfffffc00
	thumb_func_end sub_807A4A0

	thumb_func_start sub_807A544
sub_807A544: @ 807A544
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r0, _0807A57C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807A584
	ldr r2, _0807A580 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x6]
	negs r0, r0
	strh r0, [r2, 0x6]
	adds r3, r4, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r3]
	adds r1, r2, 0
	b _0807A58E
	.align 2, 0
_0807A57C: .4byte gUnknown_0202F7C8
_0807A580: .4byte gBattleAnimArgs
_0807A584:
	ldr r1, _0807A5B8 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
_0807A58E:
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x38]
	ldr r1, _0807A5BC @ =move_anim_8074EE0
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _0807A5C0 @ =sub_8078504
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A5B8: .4byte gBattleAnimArgs
_0807A5BC: .4byte move_anim_8074EE0
_0807A5C0: .4byte sub_8078504
	thumb_func_end sub_807A544

	thumb_func_start sub_807A5C4
sub_807A5C4: @ 807A5C4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0807A5EC @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807A5F4
	ldr r2, _0807A5F0 @ =gBattleAnimArgs
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	movs r1, 0x6
	ldrsh r0, [r2, r1]
	negs r0, r0
	strh r0, [r2, 0x6]
	adds r1, r2, 0
	b _0807A5FE
	.align 2, 0
_0807A5EC: .4byte gUnknown_0202F7C8
_0807A5F0: .4byte gBattleAnimArgs
_0807A5F4:
	ldr r1, _0807A630 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
_0807A5FE:
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x38]
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r1, _0807A634 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _0807A638 @ =sub_8078504
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A630: .4byte gBattleAnimArgs
_0807A634: .4byte move_anim_8074EE0
_0807A638: .4byte sub_8078504
	thumb_func_end sub_807A5C4

	thumb_func_start sub_807A63C
sub_807A63C: @ 807A63C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r0, _0807A660 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807A668
	ldr r0, _0807A664 @ =gBattleAnimArgs
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	b _0807A674
	.align 2, 0
_0807A660: .4byte gUnknown_0202F7C8
_0807A664: .4byte gBattleAnimArgs
_0807A668:
	ldr r1, _0807A690 @ =gBattleAnimArgs
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	adds r0, r1, 0
_0807A674:
	ldrh r0, [r0, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _0807A694 @ =sub_8078600
	str r0, [r4, 0x1C]
	ldr r1, _0807A698 @ =move_anim_8072740
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A690: .4byte gBattleAnimArgs
_0807A694: .4byte sub_8078600
_0807A698: .4byte move_anim_8072740
	thumb_func_end sub_807A63C

	thumb_func_start sub_807A69C
sub_807A69C: @ 807A69C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0807A730 @ =gTasks
	adds r5, r1, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	strh r0, [r5, 0x8]
	ldr r7, _0807A734 @ =gUnknown_0202F7C8
	ldrb r0, [r7]
	bl battle_side_get_owner
	lsls r0, 24
	movs r1, 0x8
	cmp r0, 0
	beq _0807A6D0
	movs r0, 0x8
	negs r0, r0
	adds r1, r0, 0
_0807A6D0:
	strh r1, [r5, 0xA]
	strh r6, [r5, 0xC]
	strh r6, [r5, 0xE]
	ldr r4, _0807A738 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x24]
	ldrh r2, [r5, 0x8]
	subs r1, r2
	strh r1, [r0, 0x24]
	ldr r0, _0807A73C @ =0x00002771
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x10]
	strh r6, [r5, 0x12]
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	adds r0, 0x10
	lsls r0, 20
	lsrs r6, r0, 16
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	lsls r4, r0, 4
	ldrb r0, [r7]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x14]
	cmp r0, 0x14
	beq _0807A72C
	cmp r0, 0x28
	bne _0807A740
_0807A72C:
	movs r0, 0x2
	b _0807A742
	.align 2, 0
_0807A730: .4byte gTasks
_0807A734: .4byte gUnknown_0202F7C8
_0807A738: .4byte gSprites
_0807A73C: .4byte 0x00002771
_0807A740:
	movs r0, 0x3
_0807A742:
	strh r0, [r5, 0x14]
	lsls r0, r4, 1
	ldr r1, _0807A770 @ =gPlttBufferUnfaded
	adds r0, r1
	lsls r1, r6, 1
	ldr r2, _0807A774 @ =gPlttBufferFaded
	adds r1, r2
	ldr r2, _0807A778 @ =REG_BG0CNT
	bl CpuSet
	ldr r0, _0807A77C @ =gBattleAnimArgs
	ldrb r2, [r0, 0x2]
	ldrh r3, [r0]
	adds r0, r6, 0
	movs r1, 0x10
	bl BlendPalette
	ldr r0, _0807A780 @ =sub_807A784
	str r0, [r5]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A770: .4byte gPlttBufferUnfaded
_0807A774: .4byte gPlttBufferFaded
_0807A778: .4byte REG_BG0CNT
_0807A77C: .4byte gBattleAnimArgs
_0807A780: .4byte sub_807A784
	thumb_func_end sub_807A69C

	thumb_func_start sub_807A784
sub_807A784: @ 807A784
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807A7A8 @ =gTasks
	adds r4, r0, r1
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0807A7E8
	cmp r0, 0x1
	bgt _0807A7AC
	cmp r0, 0
	beq _0807A7B2
	b _0807A844
	.align 2, 0
_0807A7A8: .4byte gTasks
_0807A7AC:
	cmp r0, 0x2
	beq _0807A830
	b _0807A844
_0807A7B2:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_807A850
	ldr r2, _0807A7E4 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0xA]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	ldrh r1, [r4, 0xE]
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _0807A844
	strh r1, [r4, 0xE]
	b _0807A822
	.align 2, 0
_0807A7E4: .4byte gSprites
_0807A7E8:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_807A850
	ldr r3, _0807A82C @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x24]
	ldrh r2, [r4, 0xA]
	subs r1, r2
	strh r1, [r0, 0x24]
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bne _0807A844
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	strh r2, [r1, 0x24]
_0807A822:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _0807A844
	.align 2, 0
_0807A82C: .4byte gSprites
_0807A830:
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0807A844
	ldr r0, _0807A84C @ =0x00002771
	bl FreeSpritePaletteByTag
	adds r0, r5, 0
	bl move_anim_task_del
_0807A844:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A84C: .4byte 0x00002771
	thumb_func_end sub_807A784

	thumb_func_start sub_807A850
sub_807A850: @ 807A850
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	movs r0, 0
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	lsrs r7, r0, 16
	asrs r0, 16
	cmp r0, 0
	blt _0807A8C0
	ldr r5, _0807A8CC @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r3, r4, r5
	movs r0, 0x3
	ldrb r1, [r6, 0x14]
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldrb r1, [r6, 0x10]
	lsls r1, 4
	movs r2, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	movs r0, 0x8
	strh r0, [r3, 0x2E]
	mov r0, r8
	strh r0, [r3, 0x30]
	strh r7, [r3, 0x32]
	movs r0, 0x8
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r0, [r0, 0x24]
	strh r0, [r3, 0x24]
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _0807A8D0 @ =sub_807A8D4
	str r0, [r4]
	ldrh r0, [r6, 0x12]
	adds r0, 0x1
	strh r0, [r6, 0x12]
_0807A8C0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A8CC: .4byte gSprites
_0807A8D0: .4byte sub_807A8D4
	thumb_func_end sub_807A850

	thumb_func_start sub_807A8D4
sub_807A8D4: @ 807A8D4
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	subs r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _0807A8FE
	ldr r2, _0807A904 @ =gTasks
	movs r0, 0x30
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x12]
	subs r1, 0x1
	strh r1, [r0, 0x12]
	adds r0, r3, 0
	bl obj_delete_but_dont_free_vram
_0807A8FE:
	pop {r0}
	bx r0
	.align 2, 0
_0807A904: .4byte gTasks
	thumb_func_end sub_807A8D4

	thumb_func_start sub_807A908
sub_807A908: @ 807A908
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _0807A93C @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0807A940
	movs r0, 0x5
	b _0807A942
	.align 2, 0
_0807A93C: .4byte gUnknown_0202F7C8
_0807A940:
	ldr r0, _0807A954 @ =0x0000fff6
_0807A942:
	strh r0, [r5, 0x2E]
	ldr r0, _0807A958 @ =0x0000ffd8
	strh r0, [r5, 0x30]
	ldr r0, _0807A95C @ =sub_807A960
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A954: .4byte 0x0000fff6
_0807A958: .4byte 0x0000ffd8
_0807A95C: .4byte sub_807A960
	thumb_func_end sub_807A908

	thumb_func_start sub_807A960
sub_807A960: @ 807A960
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r5, [r4, 0x30]
	ldrh r2, [r4, 0x34]
	adds r0, r5, r2
	strh r0, [r4, 0x34]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x26]
	lsls r0, r5, 16
	asrs r0, 16
	movs r1, 0x14
	negs r1, r1
	cmp r0, r1
	bge _0807A99C
	adds r0, r5, 0x1
	strh r0, [r4, 0x30]
_0807A99C:
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _0807A9B4
	adds r0, r4, 0
	bl move_anim_8072740
_0807A9B4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807A960

	thumb_func_start sub_807A9BC
sub_807A9BC: @ 807A9BC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _0807A9F4 @ =gBattleAnimArgs
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x8]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0xA]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x36]
	ldr r0, _0807A9F8 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0807A9FC
	ldrh r0, [r5, 0x8]
	adds r0, 0x1E
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0xA]
	subs r0, 0x14
	b _0807AA0A
	.align 2, 0
_0807A9F4: .4byte gBattleAnimArgs
_0807A9F8: .4byte gUnknown_0202F7C9
_0807A9FC:
	ldrh r0, [r5, 0x8]
	subs r0, 0x1E
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0xA]
	subs r0, 0x50
_0807AA0A:
	strh r0, [r4, 0x22]
	ldr r0, _0807AA20 @ =sub_8078B34
	str r0, [r4, 0x1C]
	ldr r1, _0807AA24 @ =move_anim_8072740
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807AA20: .4byte sub_8078B34
_0807AA24: .4byte move_anim_8072740
	thumb_func_end sub_807A9BC
