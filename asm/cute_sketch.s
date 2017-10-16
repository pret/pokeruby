	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text


	thumb_func_start sub_80FCB5C
sub_80FCB5C: @ 80FCB5C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r2, 0
	ldr r0, _080FCC00 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FCBF2
	ldr r0, _080FCC04 @ =gUnknown_03005DEC
	mov r8, r0
	ldr r3, _080FCC08 @ =gUnknown_03005E04
_080FCB74:
	ldr r0, _080FCC0C @ =gUnknown_03005DFC
	ldrb r1, [r0]
	ldrb r0, [r3]
	muls r0, r1
	lsls r0, 1
	mov r4, r8
	ldr r1, [r4]
	adds r1, r0
	ldr r0, _080FCC10 @ =gUnknown_03005DE8
	ldrb r0, [r0]
	adds r0, r2
	lsls r0, 1
	adds r4, r1, r0
	ldrh r1, [r4]
	mov r0, sp
	strh r1, [r0]
	movs r5, 0x1
	ldrb r0, [r3]
	lsls r0, 1
	adds r4, r0
	ldr r0, _080FCC14 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	subs r0, 0x1
	adds r7, r2, 0x1
	cmp r5, r0
	bge _080FCBE6
	ldr r6, _080FCC08 @ =gUnknown_03005E04
_080FCBAA:
	ldrh r0, [r4]
	movs r2, 0x80
	lsls r2, 8
	adds r1, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080FCBD0
	ldrb r2, [r6]
	lsls r2, 1
	adds r2, r4, r2
	mov r0, sp
	adds r1, r4, 0
	str r3, [sp, 0x4]
	bl sub_80FD68C
	strh r0, [r4]
	mov r1, sp
	strh r0, [r1]
	ldr r3, [sp, 0x4]
_080FCBD0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r6]
	lsls r0, 1
	adds r4, r0
	ldr r0, _080FCC14 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r5, r0
	blt _080FCBAA
_080FCBE6:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	ldr r0, _080FCC00 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FCB74
_080FCBF2:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FCC00: .4byte gUnknown_03005DF8
_080FCC04: .4byte gUnknown_03005DEC
_080FCC08: .4byte gUnknown_03005E04
_080FCC0C: .4byte gUnknown_03005DFC
_080FCC10: .4byte gUnknown_03005DE8
_080FCC14: .4byte gUnknown_03005DF0
	thumb_func_end sub_80FCB5C

	thumb_func_start sub_80FCC18
sub_80FCC18: @ 80FCC18
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r2, 0
	ldr r0, _080FCCA4 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FCC94
	ldr r0, _080FCCA8 @ =gUnknown_03005DEC
	mov r9, r0
	ldr r3, _080FCCAC @ =gUnknown_03005DF8
_080FCC38:
	ldr r0, _080FCCB0 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080FCCB4 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r4, r9
	ldr r1, [r4]
	adds r1, r0
	ldr r0, _080FCCB8 @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	adds r6, r2, 0x1
	ldrb r0, [r3]
	cmp r5, r0
	bcs _080FCC88
	movs r0, 0x80
	lsls r0, 8
	adds r7, r0, 0
_080FCC64:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, 0
	bne _080FCC7A
	adds r0, r4, 0
	mov r1, r8
	str r3, [sp]
	bl sub_80FD3D0
	strh r0, [r4]
	ldr r3, [sp]
_080FCC7A:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldrb r0, [r3]
	cmp r5, r0
	bcc _080FCC64
_080FCC88:
	lsls r0, r6, 24
	lsrs r2, r0, 24
	ldr r0, _080FCCA4 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FCC38
_080FCC94:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FCCA4: .4byte gUnknown_03005DF0
_080FCCA8: .4byte gUnknown_03005DEC
_080FCCAC: .4byte gUnknown_03005DF8
_080FCCB0: .4byte gUnknown_03005DFC
_080FCCB4: .4byte gUnknown_03005E04
_080FCCB8: .4byte gUnknown_03005DE8
	thumb_func_end sub_80FCC18

	thumb_func_start sub_80FCCBC
sub_80FCCBC: @ 80FCCBC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080FCD3C @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FCD2E
	ldr r0, _080FCD40 @ =gUnknown_03005DEC
	mov r8, r0
	ldr r3, _080FCD44 @ =gUnknown_03005DF8
_080FCCD4:
	ldr r0, _080FCD48 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080FCD4C @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r4, r8
	ldr r1, [r4]
	adds r1, r0
	ldr r0, _080FCD50 @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	adds r6, r2, 0x1
	ldrb r0, [r3]
	cmp r5, r0
	bcs _080FCD22
	movs r0, 0x80
	lsls r0, 8
	adds r7, r0, 0
_080FCD00:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, 0
	bne _080FCD14
	adds r0, r4, 0
	str r3, [sp]
	bl sub_80FD4DC
	strh r0, [r4]
	ldr r3, [sp]
_080FCD14:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldrb r0, [r3]
	cmp r5, r0
	bcc _080FCD00
_080FCD22:
	lsls r0, r6, 24
	lsrs r2, r0, 24
	ldr r0, _080FCD3C @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FCCD4
_080FCD2E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FCD3C: .4byte gUnknown_03005DF0
_080FCD40: .4byte gUnknown_03005DEC
_080FCD44: .4byte gUnknown_03005DF8
_080FCD48: .4byte gUnknown_03005DFC
_080FCD4C: .4byte gUnknown_03005E04
_080FCD50: .4byte gUnknown_03005DE8
	thumb_func_end sub_80FCCBC

	thumb_func_start sub_80FCD54
sub_80FCD54: @ 80FCD54
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r7, 0
	ldr r0, _080FCE8C @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r7, r0
	bcs _080FCDE0
	ldr r0, _080FCE90 @ =gUnknown_03005DEC
	mov r8, r0
_080FCD6A:
	ldr r0, _080FCE94 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r7
	ldr r0, _080FCE98 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r2, r8
	ldr r1, [r2]
	adds r1, r0
	ldr r0, _080FCE9C @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r5, r1, r0
	adds r4, r5, 0x2
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80FD50C
	strh r0, [r5]
	movs r6, 0x1
	adds r5, r4, 0
	ldr r0, _080FCEA0 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	subs r0, 0x1
	adds r7, 0x1
	cmp r6, r0
	bge _080FCDCA
_080FCDA2:
	adds r4, r5, 0x2
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80FD50C
	strh r0, [r5]
	subs r1, r5, 0x2
	adds r0, r5, 0
	bl sub_80FD50C
	strh r0, [r5]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r5, r4, 0
	ldr r0, _080FCEA0 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r6, r0
	blt _080FCDA2
_080FCDCA:
	subs r1, r5, 0x2
	adds r0, r5, 0
	bl sub_80FD50C
	strh r0, [r5]
	lsls r0, r7, 24
	lsrs r7, r0, 24
	ldr r0, _080FCE8C @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r7, r0
	bcc _080FCD6A
_080FCDE0:
	movs r6, 0
	ldr r0, _080FCEA0 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r6, r0
	bcs _080FCE80
	ldr r3, _080FCE90 @ =gUnknown_03005DEC
	mov r9, r3
	ldr r0, _080FCE98 @ =gUnknown_03005E04
	mov r8, r0
_080FCDF2:
	ldr r0, _080FCE94 @ =gUnknown_03005DFC
	ldrb r0, [r0]
	mov r2, r8
	ldrb r1, [r2]
	muls r0, r1
	lsls r0, 1
	mov r3, r9
	ldr r2, [r3]
	adds r2, r0
	ldr r0, _080FCE9C @ =gUnknown_03005DE8
	ldrb r0, [r0]
	adds r0, r6
	lsls r0, 1
	adds r5, r2, r0
	lsls r1, 1
	adds r1, r5, r1
	adds r0, r5, 0
	bl sub_80FD50C
	strh r0, [r5]
	movs r7, 0x1
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, 1
	adds r5, r0
	ldr r0, _080FCE8C @ =gUnknown_03005DF0
	ldrb r0, [r0]
	subs r0, 0x1
	adds r6, 0x1
	cmp r7, r0
	bge _080FCE64
	ldr r4, _080FCE98 @ =gUnknown_03005E04
_080FCE32:
	ldrb r1, [r4]
	lsls r1, 1
	adds r1, r5, r1
	adds r0, r5, 0
	bl sub_80FD50C
	strh r0, [r5]
	ldrb r1, [r4]
	lsls r1, 1
	subs r1, r5, r1
	adds r0, r5, 0
	bl sub_80FD50C
	strh r0, [r5]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r4]
	lsls r0, 1
	adds r5, r0
	ldr r0, _080FCE8C @ =gUnknown_03005DF0
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r7, r0
	blt _080FCE32
_080FCE64:
	mov r2, r8
	ldrb r1, [r2]
	lsls r1, 1
	subs r1, r5, r1
	adds r0, r5, 0
	bl sub_80FD50C
	strh r0, [r5]
	lsls r0, r6, 24
	lsrs r6, r0, 24
	ldr r0, _080FCEA0 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r6, r0
	bcc _080FCDF2
_080FCE80:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FCE8C: .4byte gUnknown_03005DF0
_080FCE90: .4byte gUnknown_03005DEC
_080FCE94: .4byte gUnknown_03005DFC
_080FCE98: .4byte gUnknown_03005E04
_080FCE9C: .4byte gUnknown_03005DE8
_080FCEA0: .4byte gUnknown_03005DF8
	thumb_func_end sub_80FCD54

	thumb_func_start sub_80FCEA4
sub_80FCEA4: @ 80FCEA4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080FCF24 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FCF16
	ldr r0, _080FCF28 @ =gUnknown_03005DEC
	mov r8, r0
	ldr r3, _080FCF2C @ =gUnknown_03005DF8
_080FCEBC:
	ldr r0, _080FCF30 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080FCF34 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r4, r8
	ldr r1, [r4]
	adds r1, r0
	ldr r0, _080FCF38 @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	adds r6, r2, 0x1
	ldrb r0, [r3]
	cmp r5, r0
	bcs _080FCF0A
	movs r0, 0x80
	lsls r0, 8
	adds r7, r0, 0
_080FCEE8:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, 0
	bne _080FCEFC
	adds r0, r4, 0
	str r3, [sp]
	bl sub_80FD53C
	strh r0, [r4]
	ldr r3, [sp]
_080FCEFC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldrb r0, [r3]
	cmp r5, r0
	bcc _080FCEE8
_080FCF0A:
	lsls r0, r6, 24
	lsrs r2, r0, 24
	ldr r0, _080FCF24 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FCEBC
_080FCF16:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FCF24: .4byte gUnknown_03005DF0
_080FCF28: .4byte gUnknown_03005DEC
_080FCF2C: .4byte gUnknown_03005DF8
_080FCF30: .4byte gUnknown_03005DFC
_080FCF34: .4byte gUnknown_03005E04
_080FCF38: .4byte gUnknown_03005DE8
	thumb_func_end sub_80FCEA4

	thumb_func_start sub_80FCF3C
sub_80FCF3C: @ 80FCF3C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r0, _080FD068 @ =gUnknown_03005DEC
	ldr r4, [r0]
	movs r6, 0
	movs r0, 0x80
	lsls r0, 8
	adds r5, r0, 0
_080FCF54:
	movs r7, 0
_080FCF56:
	ldrh r0, [r4]
	ands r0, r5
	cmp r0, 0
	bne _080FCF66
	adds r0, r4, 0
	bl sub_80FD53C
	strh r0, [r4]
_080FCF66:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r4, 0x2
	cmp r7, 0x3F
	bls _080FCF56
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3F
	bls _080FCF54
	movs r7, 0
	ldr r1, _080FD068 @ =gUnknown_03005DEC
	mov r10, r1
	mov r3, sp
	movs r2, 0x80
	lsls r2, 8
	mov r9, r2
_080FCF8A:
	lsls r0, r7, 1
	mov r2, r10
	ldr r1, [r2]
	adds r4, r1, r0
	ldrh r1, [r4]
	strh r1, [r3]
	mov r1, r9
	strh r1, [r4]
	movs r6, 0x1
	adds r4, 0x80
	adds r5, r0, 0
_080FCFA0:
	ldrh r0, [r4]
	movs r2, 0x80
	lsls r2, 8
	ands r0, r2
	cmp r0, 0
	bne _080FCFC0
	adds r2, r4, 0
	adds r2, 0x80
	mov r0, sp
	adds r1, r4, 0
	str r3, [sp, 0x4]
	bl sub_80FD7AC
	strh r0, [r4]
	ldr r3, [sp, 0x4]
	strh r0, [r3]
_080FCFC0:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, 0x80
	cmp r6, 0x3E
	bls _080FCFA0
	mov r0, r9
	strh r0, [r4]
	mov r1, r10
	ldr r0, [r1]
	adds r4, r0, r5
	ldrh r0, [r4]
	strh r0, [r3]
	mov r2, r9
	strh r2, [r4]
	movs r6, 0x1
	adds r4, 0x80
	movs r0, 0x80
	lsls r0, 8
	mov r8, r0
_080FCFE8:
	ldrh r0, [r4]
	mov r1, r8
	ands r0, r1
	adds r5, r4, 0
	adds r5, 0x80
	cmp r0, 0
	bne _080FD008
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	str r3, [sp, 0x4]
	bl sub_80FD7AC
	strh r0, [r4]
	ldr r3, [sp, 0x4]
	strh r0, [r3]
_080FD008:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, r5, 0
	cmp r6, 0x3E
	bls _080FCFE8
	mov r2, r9
	strh r2, [r4]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3F
	bls _080FCF8A
	ldr r0, _080FD068 @ =gUnknown_03005DEC
	ldr r4, [r0]
	movs r6, 0
	movs r0, 0x80
	lsls r0, 8
	mov r8, r0
_080FD02E:
	movs r7, 0
	adds r5, r6, 0x1
_080FD032:
	ldrh r0, [r4]
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	bne _080FD044
	adds r0, r4, 0
	bl sub_80FD53C
	strh r0, [r4]
_080FD044:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r4, 0x2
	cmp r7, 0x3F
	bls _080FD032
	lsls r0, r5, 24
	lsrs r6, r0, 24
	cmp r6, 0x3F
	bls _080FD02E
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD068: .4byte gUnknown_03005DEC
	thumb_func_end sub_80FCF3C

	thumb_func_start sub_80FD06C
sub_80FD06C: @ 80FD06C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080FD0FC @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FD0EE
	ldr r0, _080FD100 @ =gUnknown_03005DEC
	mov r8, r0
_080FD082:
	ldr r0, _080FD104 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080FD108 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080FD10C @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	ldrh r1, [r4]
	mov r0, sp
	strh r1, [r0]
	movs r5, 0x1
	adds r4, 0x2
	ldr r0, _080FD110 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	subs r0, 0x1
	adds r6, r2, 0x1
	cmp r5, r0
	bge _080FD0E2
	movs r0, 0x80
	lsls r0, 8
	adds r7, r0, 0
_080FD0BA:
	ldrh r0, [r4]
	ands r0, r7
	cmp r0, 0
	bne _080FD0D0
	mov r0, sp
	adds r1, r4, 0
	bl sub_80FD568
	strh r0, [r4]
	mov r1, sp
	strh r0, [r1]
_080FD0D0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldr r0, _080FD110 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r5, r0
	blt _080FD0BA
_080FD0E2:
	lsls r0, r6, 24
	lsrs r2, r0, 24
	ldr r0, _080FD0FC @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FD082
_080FD0EE:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD0FC: .4byte gUnknown_03005DF0
_080FD100: .4byte gUnknown_03005DEC
_080FD104: .4byte gUnknown_03005DFC
_080FD108: .4byte gUnknown_03005E04
_080FD10C: .4byte gUnknown_03005DE8
_080FD110: .4byte gUnknown_03005DF8
	thumb_func_end sub_80FD06C

	thumb_func_start sub_80FD114
sub_80FD114: @ 80FD114
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r2, 0
	ldr r0, _080FD1B0 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FD1A2
	ldr r0, _080FD1B4 @ =gUnknown_03005DEC
	mov r8, r0
	ldr r7, _080FD1B8 @ =gUnknown_03005E04
_080FD12C:
	ldr r0, _080FD1BC @ =gUnknown_03005DFC
	ldrb r1, [r0]
	ldrb r0, [r7]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080FD1C0 @ =gUnknown_03005DE8
	ldrb r0, [r0]
	adds r0, r2
	lsls r0, 1
	adds r4, r1, r0
	ldrh r1, [r4]
	mov r0, sp
	strh r1, [r0]
	movs r5, 0x1
	ldrb r0, [r7]
	lsls r0, 1
	adds r4, r0
	ldr r0, _080FD1C4 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	subs r0, 0x1
	adds r6, r2, 0x1
	cmp r5, r0
	bge _080FD196
	movs r0, 0x80
	lsls r0, 8
	adds r2, r0, 0
_080FD166:
	ldrh r0, [r4]
	ands r0, r2
	cmp r0, 0
	bne _080FD180
	mov r0, sp
	adds r1, r4, 0
	str r2, [sp, 0x4]
	bl sub_80FD568
	strh r0, [r4]
	mov r1, sp
	strh r0, [r1]
	ldr r2, [sp, 0x4]
_080FD180:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r7]
	lsls r0, 1
	adds r4, r0
	ldr r0, _080FD1C4 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r5, r0
	blt _080FD166
_080FD196:
	lsls r0, r6, 24
	lsrs r2, r0, 24
	ldr r0, _080FD1B0 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FD12C
_080FD1A2:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FD1B0: .4byte gUnknown_03005DF8
_080FD1B4: .4byte gUnknown_03005DEC
_080FD1B8: .4byte gUnknown_03005E04
_080FD1BC: .4byte gUnknown_03005DFC
_080FD1C0: .4byte gUnknown_03005DE8
_080FD1C4: .4byte gUnknown_03005DF0
	thumb_func_end sub_80FD114

	thumb_func_start sub_80FD1C8
sub_80FD1C8: @ 80FD1C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	mov r2, sp
	ldr r3, _080FD234 @ =gUnknown_083E7A50
	lsls r1, r0, 1
	add r1, r10
	adds r0, r1, r3
	ldrb r0, [r0]
	strb r0, [r2]
	adds r0, r3, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	strb r0, [r2, 0x1]
	mov r5, sp
	adds r0, r3, 0x2
	adds r1, r0
	ldrb r4, [r1]
	lsls r2, r4, 24
	lsrs r1, r2, 27
	movs r0, 0x7
	ands r1, r0
	strh r1, [r5, 0x2]
	lsrs r2, 25
	mov r9, r2
	movs r0, 0x3
	ands r2, r0
	mov r9, r2
	movs r5, 0x1
	ands r5, r4
	movs r4, 0x1
	mov r8, r4
	cmp r8, r1
	bcs _080FD27A
	mov r3, sp
_080FD21A:
	cmp r5, 0
	bne _080FD238
	mov r0, r8
	lsls r2, r0, 2
	mov r4, sp
	adds r1, r4, r2
	ldrb r0, [r3]
	mov r4, r8
	subs r0, r4
	strb r0, [r1]
	ldrb r0, [r3, 0x1]
	add r0, r8
	b _080FD24A
	.align 2, 0
_080FD234: .4byte gUnknown_083E7A50
_080FD238:
	mov r0, r8
	lsls r2, r0, 2
	mov r4, sp
	adds r1, r4, r2
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r1]
	ldrb r0, [r3, 0x1]
	subs r0, 0x1
_080FD24A:
	strb r0, [r1, 0x1]
	add r2, sp
	ldrb r0, [r2]
	cmp r0, 0x3F
	bhi _080FD25A
	ldrb r0, [r2, 0x1]
	cmp r0, 0x3F
	bls _080FD262
_080FD25A:
	mov r0, r8
	subs r0, 0x1
	strh r0, [r3, 0x2]
	b _080FD27A
_080FD262:
	ldrh r0, [r3, 0x2]
	mov r1, r8
	subs r0, r1
	strh r0, [r2, 0x2]
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrh r0, [r3, 0x2]
	cmp r8, r0
	bcc _080FD21A
_080FD27A:
	movs r2, 0
	mov r8, r2
	mov r0, sp
	ldrh r0, [r0, 0x2]
	cmp r8, r0
	bcc _080FD288
	b _080FD38A
_080FD288:
	movs r3, 0x1F
_080FD28A:
	ldr r1, _080FD2E8 @ =gUnknown_03005DEC
	mov r4, r8
	lsls r0, r4, 2
	mov r2, sp
	adds r6, r2, r0
	ldrb r0, [r6, 0x1]
	lsls r0, 7
	ldr r1, [r1]
	adds r1, r0
	ldrb r0, [r6]
	lsls r0, 1
	adds r2, r1, r0
	ldrh r1, [r2]
	movs r4, 0x80
	lsls r4, 8
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _080FD376
	movs r7, 0x1F
	ands r7, r1
	lsls r0, r1, 16
	lsrs r5, r0, 21
	ands r5, r3
	lsrs r4, r0, 26
	ands r4, r3
	mov r0, r9
	cmp r0, 0
	blt _080FD36C
	cmp r0, 0x1
	ble _080FD2EC
	cmp r0, 0x3
	bgt _080FD36C
	ldrh r0, [r6, 0x2]
	adds r1, r7, r0
	lsls r1, 16
	lsrs r7, r1, 16
	adds r1, r5, r0
	lsls r1, 16
	lsrs r5, r1, 16
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r7, 0x1F
	bls _080FD360
	movs r7, 0x1F
	b _080FD360
	.align 2, 0
_080FD2E8: .4byte gUnknown_03005DEC
_080FD2EC:
	mov r1, r10
	lsls r0, r1, 1
	add r0, r10
	ldr r1, _080FD320 @ =gUnknown_083E7A50
	adds r1, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsrs r0, 3
	movs r1, 0x7
	ands r0, r1
	movs r1, 0x3
	str r2, [sp, 0x18]
	str r3, [sp, 0x1C]
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	cmp r0, 0x1
	beq _080FD33C
	cmp r0, 0x1
	bgt _080FD324
	cmp r0, 0
	beq _080FD32A
	b _080FD36C
	.align 2, 0
_080FD320: .4byte gUnknown_083E7A50
_080FD324:
	cmp r0, 0x2
	beq _080FD34E
	b _080FD36C
_080FD32A:
	ldrh r0, [r6, 0x2]
	cmp r7, r0
	bcc _080FD338
	subs r0, r7, r0
	lsls r0, 16
	lsrs r7, r0, 16
	b _080FD36C
_080FD338:
	movs r7, 0
	b _080FD36C
_080FD33C:
	ldrh r0, [r6, 0x2]
	cmp r5, r0
	bcc _080FD34A
	subs r0, r5, r0
	lsls r0, 16
	lsrs r5, r0, 16
	b _080FD36C
_080FD34A:
	movs r5, 0
	b _080FD36C
_080FD34E:
	ldrh r0, [r6, 0x2]
	cmp r4, r0
	bcc _080FD35C
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	b _080FD36C
_080FD35C:
	movs r4, 0
	b _080FD36C
_080FD360:
	cmp r5, 0x1F
	bls _080FD366
	movs r5, 0x1F
_080FD366:
	cmp r4, 0x1F
	bls _080FD36C
	movs r4, 0x1F
_080FD36C:
	lsls r0, r4, 10
	lsls r1, r5, 5
	orrs r0, r1
	orrs r7, r0
	strh r7, [r2]
_080FD376:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	mov r0, sp
	ldrh r0, [r0, 0x2]
	cmp r8, r0
	bcs _080FD38A
	b _080FD28A
_080FD38A:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80FD1C8

	thumb_func_start sub_80FD39C
sub_80FD39C: @ 80FD39C
	push {lr}
	ldrh r1, [r0]
	movs r3, 0x1F
	movs r0, 0x1F
	ands r0, r1
	lsls r1, 16
	lsrs r2, r1, 21
	ands r2, r3
	lsrs r1, 26
	ands r1, r3
	adds r0, r2
	adds r0, r1
	movs r1, 0x3
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r0, r1, 10
	lsls r2, r1, 5
	orrs r0, r2
	orrs r0, r1
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80FD39C

	thumb_func_start sub_80FD3D0
sub_80FD3D0: @ 80FD3D0
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	ldrh r0, [r0]
	movs r2, 0x1F
	movs r1, 0x1F
	ands r1, r0
	lsls r0, 16
	lsrs r3, r0, 21
	ands r3, r2
	lsrs r0, 26
	ands r0, r2
	cmp r1, 0x10
	bhi _080FD400
	cmp r3, 0x10
	bhi _080FD400
	cmp r0, 0x10
	bhi _080FD400
	adds r0, r4, 0
	bl sub_80FD40C
	lsls r0, 16
	lsrs r0, 16
	b _080FD402
_080FD400:
	ldr r0, _080FD408 @ =0x00007fff
_080FD402:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080FD408: .4byte 0x00007fff
	thumb_func_end sub_80FD3D0

	thumb_func_start sub_80FD40C
sub_80FD40C: @ 80FD40C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	mov r8, r0
	movs r6, 0
	movs r7, 0
	adds r0, r4, 0
	movs r1, 0x6
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _080FD4C4
	lsls r0, 2
	ldr r1, _080FD450 @ =_080FD454
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FD450: .4byte _080FD454
	.align 2, 0
_080FD454:
	.4byte _080FD46C
	.4byte _080FD47C
	.4byte _080FD48C
	.4byte _080FD49A
	.4byte _080FD4A8
	.4byte _080FD4B6
_080FD46C:
	movs r0, 0x15
	subs r0, r5
	lsls r0, 16
	lsrs r6, r0, 16
	adds r7, r6, 0
	movs r1, 0
	mov r8, r1
	b _080FD4C4
_080FD47C:
	movs r7, 0
	movs r0, 0x15
	subs r0, r5
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r6, r8
	b _080FD4C4
_080FD48C:
	movs r0, 0x15
	subs r0, r5
	lsls r0, 16
	lsrs r7, r0, 16
	movs r6, 0
	mov r8, r7
	b _080FD4C4
_080FD49A:
	movs r7, 0
	movs r6, 0
	movs r0, 0x17
	subs r0, r5
	lsls r0, 16
	lsrs r0, 16
	b _080FD4C2
_080FD4A8:
	movs r0, 0x17
	subs r0, r5
	lsls r0, 16
	lsrs r7, r0, 16
	movs r6, 0
	mov r8, r6
	b _080FD4C4
_080FD4B6:
	movs r7, 0
	movs r0, 0x17
	subs r0, r5
	lsls r0, 16
	lsrs r6, r0, 16
	movs r0, 0
_080FD4C2:
	mov r8, r0
_080FD4C4:
	lsls r0, r7, 10
	lsls r1, r6, 5
	orrs r0, r1
	mov r1, r8
	orrs r1, r0
	lsls r0, r1, 16
	lsrs r0, 16
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD40C

	thumb_func_start sub_80FD4DC
sub_80FD4DC: @ 80FD4DC
	push {lr}
	ldrh r0, [r0]
	movs r2, 0x1F
	movs r1, 0x1F
	ands r1, r0
	lsls r0, 16
	lsrs r3, r0, 21
	ands r3, r2
	lsrs r0, 26
	ands r0, r2
	cmp r1, 0x10
	bhi _080FD500
	cmp r3, 0x10
	bhi _080FD500
	cmp r0, 0x10
	bhi _080FD500
	movs r0, 0
	b _080FD502
_080FD500:
	ldr r0, _080FD508 @ =0x00007fff
_080FD502:
	pop {r1}
	bx r1
	.align 2, 0
_080FD508: .4byte 0x00007fff
	thumb_func_end sub_80FD4DC

	thumb_func_start sub_80FD50C
sub_80FD50C: @ 80FD50C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r3, [r4]
	cmp r3, 0
	beq _080FD534
	movs r2, 0x80
	lsls r2, 8
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _080FD526
	adds r0, r2, 0
	b _080FD536
_080FD526:
	ldrh r1, [r1]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080FD534
	ldrh r0, [r4]
	b _080FD536
_080FD534:
	movs r0, 0
_080FD536:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD50C

	thumb_func_start sub_80FD53C
sub_80FD53C: @ 80FD53C
	push {r4,lr}
	ldrh r1, [r0]
	movs r0, 0x1F
	movs r3, 0x1F
	ands r3, r1
	lsls r1, 16
	lsrs r2, r1, 21
	lsrs r1, 26
	subs r3, r0, r3
	adds r4, r0, 0
	bics r4, r2
	adds r2, r4, 0
	bics r0, r1
	lsls r0, 10
	lsls r2, 5
	orrs r0, r2
	orrs r0, r3
	lsls r0, 16
	lsrs r0, 16
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD53C

	thumb_func_start sub_80FD568
sub_80FD568: @ 80FD568
	push {r4-r7,lr}
	sub sp, 0x14
	adds r7, r1, 0
	ldrh r4, [r0]
	ldrh r5, [r7]
	lsls r6, r4, 16
	lsls r0, r5, 16
	mov r12, r0
	cmp r4, r5
	beq _080FD5DA
	mov r2, sp
	movs r3, 0x1F
	movs r1, 0x1F
	adds r0, r1, 0
	ands r0, r4
	strh r0, [r2]
	lsrs r0, r6, 21
	ands r0, r3
	strh r0, [r2, 0x2]
	lsrs r0, r6, 26
	ands r0, r3
	strh r0, [r2, 0x4]
	mov r0, sp
	ands r1, r5
	strh r1, [r0, 0x6]
	mov r1, sp
	mov r2, r12
	lsrs r0, r2, 21
	ands r0, r3
	strh r0, [r1, 0x8]
	lsrs r0, r2, 26
	ands r0, r3
	strh r0, [r1, 0xA]
	mov r0, sp
	ldrh r0, [r0]
	cmp r0, 0x19
	bls _080FD5C2
	mov r0, sp
	ldrh r0, [r0, 0x2]
	cmp r0, 0x19
	bls _080FD5C2
	mov r0, sp
	ldrh r0, [r0, 0x4]
	cmp r0, 0x19
	bhi _080FD5DA
_080FD5C2:
	mov r0, sp
	ldrh r0, [r0, 0x6]
	cmp r0, 0x19
	bls _080FD5DE
	mov r0, sp
	ldrh r0, [r0, 0x8]
	cmp r0, 0x19
	bls _080FD5DE
	mov r0, sp
	ldrh r0, [r0, 0xA]
	cmp r0, 0x19
	bls _080FD5DE
_080FD5DA:
	ldrh r0, [r7]
	b _080FD684
_080FD5DE:
	movs r4, 0
	add r6, sp, 0xC
	mov r7, sp
	adds r7, 0x6
	adds r5, r6, 0
_080FD5E8:
	lsls r2, r4, 1
	mov r1, sp
	adds r0, r1, r2
	adds r1, r7, r2
	ldrh r3, [r0]
	ldrh r0, [r1]
	cmp r3, r0
	bls _080FD5FE
	adds r1, r5, r2
	subs r0, r3, r0
	b _080FD602
_080FD5FE:
	adds r1, r5, r2
	subs r0, r3
_080FD602:
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _080FD5E8
	adds r1, r6, 0
	ldrh r0, [r1, 0x2]
	ldrh r3, [r1]
	cmp r3, r0
	bcc _080FD628
	ldrh r2, [r1, 0x4]
	cmp r3, r2
	bcc _080FD622
	adds r2, r3, 0
	b _080FD63C
_080FD622:
	cmp r0, r2
	bcs _080FD62E
	b _080FD636
_080FD628:
	ldrh r2, [r1, 0x4]
	cmp r0, r2
	bcc _080FD632
_080FD62E:
	ldrh r2, [r1, 0x2]
	b _080FD63C
_080FD632:
	cmp r2, r3
	bcc _080FD63A
_080FD636:
	ldrh r2, [r1, 0x4]
	b _080FD63C
_080FD63A:
	ldrh r2, [r6]
_080FD63C:
	mov r0, sp
	ldrh r1, [r0, 0x6]
	lsrs r0, r2, 1
	movs r6, 0x1F
	subs r6, r0
	adds r0, r1, 0
	muls r0, r6
	movs r1, 0x1F
	bl __divsi3
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r0, sp
	ldrh r0, [r0, 0x8]
	muls r0, r6
	movs r1, 0x1F
	bl __divsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, sp
	ldrh r0, [r0, 0xA]
	muls r0, r6
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r0, 6
	lsls r4, 5
	orrs r0, r4
	orrs r5, r0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r5, 0
_080FD684:
	add sp, 0x14
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD568

	thumb_func_start sub_80FD68C
sub_80FD68C: @ 80FD68C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r3, r0, 0
	mov r10, r1
	str r2, [sp]
	ldrh r1, [r3]
	mov r0, r10
	ldrh r0, [r0]
	cmp r1, r0
	bne _080FD6B4
	ldrh r0, [r2]
	cmp r0, r1
	bne _080FD6B4
	mov r1, r10
	ldrh r0, [r1]
	b _080FD79C
_080FD6B4:
	mov r2, r10
	ldrh r0, [r2]
	movs r1, 0x1F
	mov r9, r1
	movs r4, 0x1F
	adds r5, r4, 0
	ands r5, r0
	lsls r0, 16
	lsrs r2, r0, 21
	mov r1, r9
	ands r1, r2
	mov r8, r1
	lsrs r0, 26
	mov r2, r9
	ands r2, r0
	str r2, [sp, 0x4]
	ldrh r2, [r3]
	adds r0, r4, 0
	ands r0, r2
	lsls r2, 16
	lsrs r1, r2, 21
	mov r3, r9
	ands r1, r3
	adds r0, r1
	lsrs r2, 26
	ands r2, r3
	adds r0, r2
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r7, r0, 16
	mov r1, r8
	adds r0, r5, r1
	ldr r2, [sp, 0x4]
	adds r0, r2
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r3, [sp]
	ldrh r1, [r3]
	ands r4, r1
	lsls r1, 16
	lsrs r0, r1, 21
	mov r2, r9
	ands r0, r2
	adds r4, r0
	lsrs r1, 26
	ands r1, r2
	adds r4, r1
	adds r0, r4, 0
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r7, r6
	bne _080FD736
	cmp r1, r6
	bne _080FD736
	mov r3, r10
	ldrh r0, [r3]
	b _080FD79C
_080FD736:
	cmp r7, r6
	bls _080FD73E
	subs r0, r7, r6
	b _080FD740
_080FD73E:
	subs r0, r6, r7
_080FD740:
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, r6
	bls _080FD74C
	subs r0, r1, r6
	b _080FD74E
_080FD74C:
	subs r0, r6, r1
_080FD74E:
	lsls r0, 16
	lsrs r0, 16
	cmp r2, r0
	bcc _080FD758
	adds r0, r2, 0
_080FD758:
	lsrs r0, 1
	movs r4, 0x1F
	subs r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, r8
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r1, [sp, 0x4]
	adds r0, r1, 0
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r0, 6
	mov r2, r8
	lsls r1, r2, 5
	orrs r0, r1
	orrs r5, r0
	lsls r0, r5, 16
	lsrs r0, 16
_080FD79C:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD68C

	thumb_func_start sub_80FD7AC
sub_80FD7AC: @ 80FD7AC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r3, r0, 0
	mov r10, r1
	str r2, [sp]
	ldrh r1, [r3]
	mov r0, r10
	ldrh r0, [r0]
	cmp r1, r0
	bne _080FD7D4
	ldrh r0, [r2]
	cmp r0, r1
	bne _080FD7D4
	mov r1, r10
	ldrh r0, [r1]
	b _080FD8BA
_080FD7D4:
	mov r2, r10
	ldrh r0, [r2]
	movs r1, 0x1F
	mov r9, r1
	movs r4, 0x1F
	adds r5, r4, 0
	ands r5, r0
	lsls r0, 16
	lsrs r2, r0, 21
	mov r1, r9
	ands r1, r2
	mov r8, r1
	lsrs r0, 26
	mov r2, r9
	ands r2, r0
	str r2, [sp, 0x4]
	ldrh r2, [r3]
	adds r0, r4, 0
	ands r0, r2
	lsls r2, 16
	lsrs r1, r2, 21
	mov r3, r9
	ands r1, r3
	adds r0, r1
	lsrs r2, 26
	ands r2, r3
	adds r0, r2
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r7, r0, 16
	mov r1, r8
	adds r0, r5, r1
	ldr r2, [sp, 0x4]
	adds r0, r2
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r3, [sp]
	ldrh r1, [r3]
	ands r4, r1
	lsls r1, 16
	lsrs r0, r1, 21
	mov r2, r9
	ands r0, r2
	adds r4, r0
	lsrs r1, 26
	ands r1, r2
	adds r4, r1
	adds r0, r4, 0
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r7, r6
	bne _080FD856
	cmp r1, r6
	bne _080FD856
	mov r3, r10
	ldrh r0, [r3]
	b _080FD8BA
_080FD856:
	cmp r7, r6
	bls _080FD85E
	subs r0, r7, r6
	b _080FD860
_080FD85E:
	subs r0, r6, r7
_080FD860:
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r1, r6
	bls _080FD86C
	subs r0, r1, r6
	b _080FD86E
_080FD86C:
	subs r0, r6, r1
_080FD86E:
	lsls r0, 16
	lsrs r0, 16
	cmp r2, r0
	bcc _080FD878
	adds r0, r2, 0
_080FD878:
	movs r4, 0x1F
	subs r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, r8
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r1, [sp, 0x4]
	adds r0, r1, 0
	muls r0, r4
	movs r1, 0x1F
	bl __divsi3
	lsls r0, 16
	lsrs r0, 6
	mov r2, r8
	lsls r1, r2, 5
	orrs r0, r1
	orrs r5, r0
	lsls r0, r5, 16
	lsrs r0, 16
_080FD8BA:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80FD7AC

	thumb_func_start sub_80FD8CC
sub_80FD8CC: @ 80FD8CC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldrb r1, [r0, 0x1D]
	lsrs r5, r1, 3
	ldrb r1, [r0, 0x1E]
	lsrs r1, 3
	str r1, [sp, 0x8]
	ldr r1, [r0, 0x4]
	str r1, [sp]
	ldr r2, [r0, 0x10]
	str r2, [sp, 0x4]
	ldrh r0, [r0, 0x16]
	cmp r0, 0x2
	bne _080FD97C
	movs r1, 0
	ldr r0, [sp, 0x8]
	cmp r1, r0
	bcc _080FD8FA
	b _080FDA08
_080FD8FA:
	movs r0, 0
	adds r2, r1, 0x1
	mov r10, r2
	cmp r0, r5
	bcs _080FD96E
	adds r2, r1, 0
	muls r2, r5
	mov r9, r2
	lsls r1, 3
	mov r8, r1
_080FD90E:
	movs r4, 0
	lsls r6, r0, 4
	adds r7, r0, 0x1
	add r0, r9
	lsls r0, 6
	ldr r1, [sp, 0x4]
	adds r1, r0
	mov r12, r1
_080FD91E:
	lsls r0, r4, 3
	mov r2, r12
	adds r3, r2, r0
	mov r1, r8
	adds r0, r1, r4
	lsls r0, 3
	muls r0, r5
	lsls r0, 1
	ldr r2, [sp]
	adds r0, r2, r0
	adds r2, r0, r6
	ldrh r0, [r2, 0x2]
	lsls r0, 8
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r3]
	ldrh r0, [r2, 0x6]
	lsls r0, 8
	ldrh r1, [r2, 0x4]
	orrs r0, r1
	strh r0, [r3, 0x2]
	ldrh r0, [r2, 0xA]
	lsls r0, 8
	ldrh r1, [r2, 0x8]
	orrs r0, r1
	strh r0, [r3, 0x4]
	ldrh r0, [r2, 0xE]
	lsls r0, 8
	ldrh r1, [r2, 0xC]
	orrs r0, r1
	strh r0, [r3, 0x6]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x7
	bls _080FD91E
	lsls r0, r7, 16
	lsrs r0, 16
	cmp r0, r5
	bcc _080FD90E
_080FD96E:
	mov r1, r10
	lsls r0, r1, 16
	lsrs r1, r0, 16
	ldr r2, [sp, 0x8]
	cmp r1, r2
	bcc _080FD8FA
	b _080FDA08
_080FD97C:
	movs r1, 0
	ldr r0, [sp, 0x8]
	cmp r1, r0
	bcs _080FDA08
_080FD984:
	movs r0, 0
	adds r2, r1, 0x1
	mov r10, r2
	cmp r0, r5
	bcs _080FD9FC
	adds r2, r1, 0
	muls r2, r5
	mov r9, r2
	lsls r1, 3
	mov r8, r1
_080FD998:
	movs r4, 0
	lsls r6, r0, 4
	adds r7, r0, 0x1
	add r0, r9
	lsls r0, 5
	ldr r1, [sp, 0x4]
	adds r1, r0
	mov r12, r1
_080FD9A8:
	lsls r0, r4, 2
	mov r2, r12
	adds r3, r2, r0
	mov r1, r8
	adds r0, r1, r4
	lsls r0, 3
	muls r0, r5
	lsls r0, 1
	ldr r2, [sp]
	adds r0, r2, r0
	adds r2, r0, r6
	ldrh r1, [r2, 0x2]
	lsls r1, 4
	ldrh r0, [r2]
	orrs r1, r0
	ldrh r0, [r2, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrh r0, [r2, 0x6]
	lsls r0, 12
	orrs r1, r0
	strh r1, [r3]
	ldrh r1, [r2, 0xA]
	lsls r1, 4
	ldrh r0, [r2, 0x8]
	orrs r1, r0
	ldrh r0, [r2, 0xC]
	lsls r0, 8
	orrs r1, r0
	ldrh r0, [r2, 0xE]
	lsls r0, 12
	orrs r1, r0
	strh r1, [r3, 0x2]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x7
	bls _080FD9A8
	lsls r0, r7, 16
	lsrs r0, 16
	cmp r0, r5
	bcc _080FD998
_080FD9FC:
	mov r1, r10
	lsls r0, r1, 16
	lsrs r1, r0, 16
	ldr r2, [sp, 0x8]
	cmp r1, r2
	bcc _080FD984
_080FDA08:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80FD8CC

	thumb_func_start sub_80FDA18
sub_80FDA18: @ 80FDA18
	push {lr}
	ldr r2, _080FDA68 @ =gUnknown_03005E0C
	ldrb r1, [r0, 0x18]
	lsls r1, 4
	strh r1, [r2]
	ldr r3, _080FDA6C @ =gUnknown_03005E08
	ldrh r2, [r2]
	lsls r2, 1
	ldr r1, [r0, 0x8]
	adds r1, r2
	str r1, [r3]
	ldr r2, _080FDA70 @ =gUnknown_03005DEC
	ldr r1, [r0, 0x4]
	str r1, [r2]
	ldr r2, _080FDA74 @ =gUnknown_03005DE8
	ldrb r1, [r0, 0x19]
	strb r1, [r2]
	ldr r2, _080FDA78 @ =gUnknown_03005DFC
	ldrb r1, [r0, 0x1A]
	strb r1, [r2]
	ldr r2, _080FDA7C @ =gUnknown_03005DF8
	ldrb r1, [r0, 0x1B]
	strb r1, [r2]
	ldr r2, _080FDA80 @ =gUnknown_03005DF0
	ldrb r1, [r0, 0x1C]
	strb r1, [r2]
	ldr r2, _080FDA84 @ =gUnknown_03005E04
	ldrb r1, [r0, 0x1D]
	strb r1, [r2]
	ldr r2, _080FDA88 @ =gUnknown_03005DF4
	ldrb r1, [r0, 0x1E]
	strb r1, [r2]
	ldrh r0, [r0, 0x14]
	cmp r0, 0x5
	bhi _080FDADE
	lsls r0, 2
	ldr r1, _080FDA8C @ =_080FDA90
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FDA68: .4byte gUnknown_03005E0C
_080FDA6C: .4byte gUnknown_03005E08
_080FDA70: .4byte gUnknown_03005DEC
_080FDA74: .4byte gUnknown_03005DE8
_080FDA78: .4byte gUnknown_03005DFC
_080FDA7C: .4byte gUnknown_03005DF8
_080FDA80: .4byte gUnknown_03005DF0
_080FDA84: .4byte gUnknown_03005E04
_080FDA88: .4byte gUnknown_03005DF4
_080FDA8C: .4byte _080FDA90
	.align 2, 0
_080FDA90:
	.4byte _080FDAA8
	.4byte _080FDAB0
	.4byte _080FDAB8
	.4byte _080FDAC2
	.4byte _080FDACC
	.4byte _080FDAD6
_080FDAA8:
	movs r0, 0
	bl sub_80FDC18
	b _080FDADE
_080FDAB0:
	movs r0, 0x1
	bl sub_80FDC18
	b _080FDADE
_080FDAB8:
	bl sub_80FDAE4
	bl sub_80FDF88
	b _080FDADE
_080FDAC2:
	bl sub_80FDBE4
	bl sub_80FDED8
	b _080FDADE
_080FDACC:
	bl sub_80FDBA8
	bl sub_80FDE28
	b _080FDADE
_080FDAD6:
	bl sub_80FDB8C
	bl sub_80FDD70
_080FDADE:
	pop {r0}
	bx r0
	thumb_func_end sub_80FDA18

	thumb_func_start sub_80FDAE4
sub_80FDAE4: @ 80FDAE4
	ldr r2, _080FDB4C @ =gUnknown_03005E08
	ldr r1, [r2]
	movs r0, 0
	strh r0, [r1]
	ldr r0, [r2]
	ldr r2, _080FDB50 @ =0x000018c6
	adds r1, r2, 0
	strh r1, [r0, 0x2]
	ldr r2, _080FDB54 @ =0x000077bd
	adds r1, r2, 0
	strh r1, [r0, 0x4]
	ldr r2, _080FDB58 @ =0x00002d6b
	adds r1, r2, 0
	strh r1, [r0, 0x6]
	ldr r2, _080FDB5C @ =0x000018dd
	adds r1, r2, 0
	strh r1, [r0, 0x8]
	ldr r2, _080FDB60 @ =0x00001ba6
	adds r1, r2, 0
	strh r1, [r0, 0xA]
	ldr r2, _080FDB64 @ =0x000074c6
	adds r1, r2, 0
	strh r1, [r0, 0xC]
	ldr r2, _080FDB68 @ =0x00001bbd
	adds r1, r2, 0
	strh r1, [r0, 0xE]
	ldr r2, _080FDB6C @ =0x000074dd
	adds r1, r2, 0
	strh r1, [r0, 0x10]
	ldr r2, _080FDB70 @ =0x000077a6
	adds r1, r2, 0
	strh r1, [r0, 0x12]
	ldr r2, _080FDB74 @ =0x0000197d
	adds r1, r2, 0
	strh r1, [r0, 0x14]
	ldr r2, _080FDB78 @ =0x00001bab
	adds r1, r2, 0
	strh r1, [r0, 0x16]
	ldr r2, _080FDB7C @ =0x00007566
	adds r1, r2, 0
	strh r1, [r0, 0x18]
	ldr r2, _080FDB80 @ =0x00002cdd
	adds r1, r2, 0
	strh r1, [r0, 0x1A]
	ldr r2, _080FDB84 @ =0x00002fa6
	adds r1, r2, 0
	strh r1, [r0, 0x1C]
	ldr r2, _080FDB88 @ =0x000074cb
	adds r1, r2, 0
	strh r1, [r0, 0x1E]
	bx lr
	.align 2, 0
_080FDB4C: .4byte gUnknown_03005E08
_080FDB50: .4byte 0x000018c6
_080FDB54: .4byte 0x000077bd
_080FDB58: .4byte 0x00002d6b
_080FDB5C: .4byte 0x000018dd
_080FDB60: .4byte 0x00001ba6
_080FDB64: .4byte 0x000074c6
_080FDB68: .4byte 0x00001bbd
_080FDB6C: .4byte 0x000074dd
_080FDB70: .4byte 0x000077a6
_080FDB74: .4byte 0x0000197d
_080FDB78: .4byte 0x00001bab
_080FDB7C: .4byte 0x00007566
_080FDB80: .4byte 0x00002cdd
_080FDB84: .4byte 0x00002fa6
_080FDB88: .4byte 0x000074cb
	thumb_func_end sub_80FDAE4

	thumb_func_start sub_80FDB8C
sub_80FDB8C: @ 80FDB8C
	ldr r2, _080FDBA0 @ =gUnknown_03005E08
	ldr r0, [r2]
	movs r1, 0
	strh r1, [r0]
	ldr r2, [r2]
	strh r1, [r2, 0x2]
	ldr r1, _080FDBA4 @ =0x00007fff
	adds r0, r1, 0
	strh r0, [r2, 0x4]
	bx lr
	.align 2, 0
_080FDBA0: .4byte gUnknown_03005E08
_080FDBA4: .4byte 0x00007fff
	thumb_func_end sub_80FDB8C

	thumb_func_start sub_80FDBA8
sub_80FDBA8: @ 80FDBA8
	push {r4,r5,lr}
	ldr r1, _080FDBE0 @ =gUnknown_03005E08
	ldr r0, [r1]
	movs r2, 0
	strh r2, [r0]
	ldr r0, [r1]
	strh r2, [r0, 0x2]
	movs r4, 0
	adds r5, r1, 0
_080FDBBA:
	ldr r0, [r5]
	lsls r2, r4, 1
	adds r2, r0
	adds r0, r4, 0x2
	lsls r3, r0, 1
	lsls r1, r0, 11
	lsls r0, 6
	orrs r1, r0
	orrs r1, r3
	strh r1, [r2, 0x4]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xD
	bls _080FDBBA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FDBE0: .4byte gUnknown_03005E08
	thumb_func_end sub_80FDBA8

	thumb_func_start sub_80FDBE4
sub_80FDBE4: @ 80FDBE4
	push {r4,lr}
	ldr r2, _080FDC14 @ =gUnknown_03005E08
	ldr r1, [r2]
	movs r0, 0
	strh r0, [r1]
	movs r3, 0
	adds r4, r2, 0
_080FDBF2:
	ldr r0, [r4]
	lsls r2, r3, 1
	adds r2, r0
	lsls r0, r3, 10
	lsls r1, r3, 5
	orrs r0, r1
	orrs r0, r3
	strh r0, [r2, 0x2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1F
	bls _080FDBF2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FDC14: .4byte gUnknown_03005E08
	thumb_func_end sub_80FDBE4

	thumb_func_start sub_80FDC18
sub_80FDC18: @ 80FDC18
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	movs r1, 0xDF
	mov r9, r1
	cmp r0, 0
	bne _080FDC30
	movs r2, 0xFF
	mov r9, r2
_080FDC30:
	movs r6, 0
	ldr r3, _080FDCB4 @ =gUnknown_03005E08
	mov r12, r3
	mov r0, r9
	lsls r4, r0, 1
	ldr r5, _080FDCB8 @ =gUnknown_03005DF0
	cmp r6, r9
	bcs _080FDC54
	movs r2, 0
_080FDC42:
	ldr r0, [r3]
	lsls r1, r6, 1
	adds r1, r0
	strh r2, [r1]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r9
	bcc _080FDC42
_080FDC54:
	mov r1, r12
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r2, _080FDCBC @ =0x00003def
	adds r1, r2, 0
	strh r1, [r0]
	movs r3, 0
	ldrb r5, [r5]
	cmp r3, r5
	bcs _080FDD58
_080FDC68:
	ldr r2, _080FDCC0 @ =gUnknown_03005DEC
	ldr r0, _080FDCC4 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r3
	ldr r0, _080FDCC8 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	ldr r1, [r2]
	adds r1, r0
	ldr r0, _080FDCCC @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r6, 0
	ldr r0, _080FDCD0 @ =gUnknown_03005DF8
	adds r2, r0, 0
	adds r3, 0x1
	mov r10, r3
	ldrb r3, [r2]
	cmp r6, r3
	bcs _080FDD4A
	ldr r0, _080FDCD4 @ =gUnknown_03005E0C
	mov r8, r0
_080FDC98:
	ldrh r0, [r4]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080FDCD8
	mov r1, r8
	ldrh r0, [r1]
	strh r0, [r4]
	adds r6, 0x1
	adds r7, r4, 0x2
	b _080FDD3E
	.align 2, 0
_080FDCB4: .4byte gUnknown_03005E08
_080FDCB8: .4byte gUnknown_03005DF0
_080FDCBC: .4byte 0x00003def
_080FDCC0: .4byte gUnknown_03005DEC
_080FDCC4: .4byte gUnknown_03005DFC
_080FDCC8: .4byte gUnknown_03005E04
_080FDCCC: .4byte gUnknown_03005DE8
_080FDCD0: .4byte gUnknown_03005DF8
_080FDCD4: .4byte gUnknown_03005E0C
_080FDCD8:
	adds r0, r4, 0
	bl sub_80FE038
	lsls r0, 16
	lsrs r5, r0, 16
	movs r3, 0x1
	adds r6, 0x1
	adds r7, r4, 0x2
	cmp r3, r9
	bcs _080FDD34
	ldr r0, _080FDD04 @ =gUnknown_03005E08
	ldr r2, [r0]
	ldrh r1, [r2, 0x2]
	mov r12, r0
	cmp r1, 0
	bne _080FDD08
	strh r5, [r2, 0x2]
	mov r2, r8
	ldrh r0, [r2]
	adds r0, 0x1
	b _080FDD32
	.align 2, 0
_080FDD04: .4byte gUnknown_03005E08
_080FDD08:
	mov r2, r12
	ldr r1, [r2]
	lsls r0, r3, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r5
	beq _080FDD2C
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r9
	bcs _080FDD34
	lsls r0, r3, 1
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, 0
	bne _080FDD08
	strh r5, [r1]
_080FDD2C:
	mov r1, r8
	ldrh r0, [r1]
	adds r0, r3
_080FDD32:
	strh r0, [r4]
_080FDD34:
	ldr r2, _080FDD68 @ =gUnknown_03005DF8
	cmp r3, r9
	bne _080FDD3E
	mov r3, r9
	strh r3, [r4]
_080FDD3E:
	lsls r0, r6, 24
	lsrs r6, r0, 24
	adds r4, r7, 0
	ldrb r0, [r2]
	cmp r6, r0
	bcc _080FDC98
_080FDD4A:
	mov r1, r10
	lsls r0, r1, 24
	lsrs r3, r0, 24
	ldr r0, _080FDD6C @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r3, r0
	bcc _080FDC68
_080FDD58:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FDD68: .4byte gUnknown_03005DF8
_080FDD6C: .4byte gUnknown_03005DF0
	thumb_func_end sub_80FDC18

	thumb_func_start sub_80FDD70
sub_80FDD70: @ 80FDD70
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r2, 0
	ldr r0, _080FDDC4 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FDE14
	ldr r0, _080FDDC8 @ =gUnknown_03005DEC
	mov r8, r0
_080FDD84:
	ldr r0, _080FDDCC @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080FDDD0 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080FDDD4 @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r6, 0
	ldr r0, _080FDDD8 @ =gUnknown_03005DF8
	adds r3, r0, 0
	adds r7, r2, 0x1
	ldrb r0, [r3]
	cmp r6, r0
	bcs _080FDE08
	ldr r5, _080FDDDC @ =gUnknown_03005E0C
_080FDDB0:
	ldrh r0, [r4]
	movs r2, 0x80
	lsls r2, 8
	adds r1, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080FDDE0
	ldrh r0, [r5]
	strh r0, [r4]
	b _080FDDFA
	.align 2, 0
_080FDDC4: .4byte gUnknown_03005DF0
_080FDDC8: .4byte gUnknown_03005DEC
_080FDDCC: .4byte gUnknown_03005DFC
_080FDDD0: .4byte gUnknown_03005E04
_080FDDD4: .4byte gUnknown_03005DE8
_080FDDD8: .4byte gUnknown_03005DF8
_080FDDDC: .4byte gUnknown_03005E0C
_080FDDE0:
	adds r0, r4, 0
	bl sub_80FD4DC
	lsls r0, 16
	cmp r0, 0
	bne _080FDDF2
	ldrh r0, [r5]
	adds r0, 0x1
	b _080FDDF6
_080FDDF2:
	ldrh r0, [r5]
	adds r0, 0x2
_080FDDF6:
	strh r0, [r4]
	ldr r3, _080FDE20 @ =gUnknown_03005DF8
_080FDDFA:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, 0x2
	ldrb r0, [r3]
	cmp r6, r0
	bcc _080FDDB0
_080FDE08:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	ldr r0, _080FDE24 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FDD84
_080FDE14:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FDE20: .4byte gUnknown_03005DF8
_080FDE24: .4byte gUnknown_03005DF0
	thumb_func_end sub_80FDD70

	thumb_func_start sub_80FDE28
sub_80FDE28: @ 80FDE28
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080FDE7C @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FDEC4
	ldr r0, _080FDE80 @ =gUnknown_03005DEC
	mov r8, r0
_080FDE3E:
	ldr r0, _080FDE84 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080FDE88 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080FDE8C @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	ldr r0, _080FDE90 @ =gUnknown_03005DF8
	adds r7, r2, 0x1
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080FDEB8
	ldr r6, _080FDE94 @ =gUnknown_03005E0C
	movs r0, 0x80
	lsls r0, 8
	adds r2, r0, 0
_080FDE6E:
	ldrh r0, [r4]
	ands r0, r2
	cmp r0, 0
	beq _080FDE98
	ldrh r0, [r6]
	strh r0, [r4]
	b _080FDEA8
	.align 2, 0
_080FDE7C: .4byte gUnknown_03005DF0
_080FDE80: .4byte gUnknown_03005DEC
_080FDE84: .4byte gUnknown_03005DFC
_080FDE88: .4byte gUnknown_03005E04
_080FDE8C: .4byte gUnknown_03005DE8
_080FDE90: .4byte gUnknown_03005DF8
_080FDE94: .4byte gUnknown_03005E0C
_080FDE98:
	adds r0, r4, 0
	str r2, [sp]
	bl sub_80FE17C
	ldrh r1, [r6]
	adds r0, r1
	strh r0, [r4]
	ldr r2, [sp]
_080FDEA8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldr r0, _080FDED0 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r5, r0
	bcc _080FDE6E
_080FDEB8:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	ldr r0, _080FDED4 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FDE3E
_080FDEC4:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FDED0: .4byte gUnknown_03005DF8
_080FDED4: .4byte gUnknown_03005DF0
	thumb_func_end sub_80FDE28

	thumb_func_start sub_80FDED8
sub_80FDED8: @ 80FDED8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080FDF2C @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FDF74
	ldr r0, _080FDF30 @ =gUnknown_03005DEC
	mov r8, r0
_080FDEEE:
	ldr r0, _080FDF34 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080FDF38 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080FDF3C @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	ldr r0, _080FDF40 @ =gUnknown_03005DF8
	adds r7, r2, 0x1
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080FDF68
	ldr r6, _080FDF44 @ =gUnknown_03005E0C
	movs r0, 0x80
	lsls r0, 8
	adds r2, r0, 0
_080FDF1E:
	ldrh r0, [r4]
	ands r0, r2
	cmp r0, 0
	beq _080FDF48
	ldrh r0, [r6]
	strh r0, [r4]
	b _080FDF58
	.align 2, 0
_080FDF2C: .4byte gUnknown_03005DF0
_080FDF30: .4byte gUnknown_03005DEC
_080FDF34: .4byte gUnknown_03005DFC
_080FDF38: .4byte gUnknown_03005E04
_080FDF3C: .4byte gUnknown_03005DE8
_080FDF40: .4byte gUnknown_03005DF8
_080FDF44: .4byte gUnknown_03005E0C
_080FDF48:
	adds r0, r4, 0
	str r2, [sp]
	bl sub_80FE1B0
	ldrh r1, [r6]
	adds r0, r1
	strh r0, [r4]
	ldr r2, [sp]
_080FDF58:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldr r0, _080FDF80 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r5, r0
	bcc _080FDF1E
_080FDF68:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	ldr r0, _080FDF84 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FDEEE
_080FDF74:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FDF80: .4byte gUnknown_03005DF8
_080FDF84: .4byte gUnknown_03005DF0
	thumb_func_end sub_80FDED8

	thumb_func_start sub_80FDF88
sub_80FDF88: @ 80FDF88
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r2, 0
	ldr r0, _080FDFDC @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcs _080FE024
	ldr r0, _080FDFE0 @ =gUnknown_03005DEC
	mov r8, r0
_080FDF9E:
	ldr r0, _080FDFE4 @ =gUnknown_03005DFC
	ldrb r1, [r0]
	adds r1, r2
	ldr r0, _080FDFE8 @ =gUnknown_03005E04
	ldrb r0, [r0]
	muls r0, r1
	lsls r0, 1
	mov r3, r8
	ldr r1, [r3]
	adds r1, r0
	ldr r0, _080FDFEC @ =gUnknown_03005DE8
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r1, r0
	movs r5, 0
	ldr r0, _080FDFF0 @ =gUnknown_03005DF8
	adds r7, r2, 0x1
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080FE018
	ldr r6, _080FDFF4 @ =gUnknown_03005E0C
	movs r0, 0x80
	lsls r0, 8
	adds r2, r0, 0
_080FDFCE:
	ldrh r0, [r4]
	ands r0, r2
	cmp r0, 0
	beq _080FDFF8
	ldrh r0, [r6]
	strh r0, [r4]
	b _080FE008
	.align 2, 0
_080FDFDC: .4byte gUnknown_03005DF0
_080FDFE0: .4byte gUnknown_03005DEC
_080FDFE4: .4byte gUnknown_03005DFC
_080FDFE8: .4byte gUnknown_03005E04
_080FDFEC: .4byte gUnknown_03005DE8
_080FDFF0: .4byte gUnknown_03005DF8
_080FDFF4: .4byte gUnknown_03005E0C
_080FDFF8:
	adds r0, r4, 0
	str r2, [sp]
	bl sub_80FE0AC
	ldrh r1, [r6]
	adds r0, r1
	strh r0, [r4]
	ldr r2, [sp]
_080FE008:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x2
	ldr r0, _080FE030 @ =gUnknown_03005DF8
	ldrb r0, [r0]
	cmp r5, r0
	bcc _080FDFCE
_080FE018:
	lsls r0, r7, 24
	lsrs r2, r0, 24
	ldr r0, _080FE034 @ =gUnknown_03005DF0
	ldrb r0, [r0]
	cmp r2, r0
	bcc _080FDF9E
_080FE024:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FE030: .4byte gUnknown_03005DF8
_080FE034: .4byte gUnknown_03005DF0
	thumb_func_end sub_80FDF88

	thumb_func_start sub_80FE038
sub_80FE038: @ 80FE038
	push {r4,lr}
	ldrh r0, [r0]
	movs r1, 0x1F
	movs r4, 0x1F
	ands r4, r0
	lsls r0, 16
	lsrs r3, r0, 21
	ands r3, r1
	lsrs r2, r0, 26
	ands r2, r1
	movs r1, 0x3
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _080FE05C
	movs r0, 0x1C
	ands r0, r4
	adds r4, r0, 0x4
_080FE05C:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080FE06A
	movs r0, 0x1C
	ands r0, r3
	adds r3, r0, 0x4
_080FE06A:
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080FE078
	movs r0, 0x1C
	ands r0, r2
	adds r2, r0, 0x4
_080FE078:
	cmp r4, 0x5
	bhi _080FE07E
	movs r4, 0x6
_080FE07E:
	cmp r4, 0x1E
	bls _080FE084
	movs r4, 0x1E
_080FE084:
	cmp r3, 0x5
	bhi _080FE08A
	movs r3, 0x6
_080FE08A:
	cmp r3, 0x1E
	bls _080FE090
	movs r3, 0x1E
_080FE090:
	cmp r2, 0x5
	bhi _080FE096
	movs r2, 0x6
_080FE096:
	cmp r2, 0x1E
	bls _080FE09C
	movs r2, 0x1E
_080FE09C:
	lsls r0, r2, 10
	lsls r1, r3, 5
	orrs r0, r1
	orrs r4, r0
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80FE038

	thumb_func_start sub_80FE0AC
sub_80FE0AC: @ 80FE0AC
	push {lr}
	ldrh r0, [r0]
	movs r1, 0x1F
	movs r3, 0x1F
	ands r3, r0
	lsls r0, 16
	lsrs r2, r0, 21
	ands r2, r1
	lsrs r0, 26
	ands r0, r1
	cmp r3, 0xB
	bhi _080FE0D0
	cmp r2, 0xA
	bhi _080FE0D0
	cmp r0, 0xA
	bhi _080FE0D0
	movs r0, 0x1
	b _080FE176
_080FE0D0:
	cmp r3, 0x13
	bls _080FE0F4
	cmp r2, 0x13
	bls _080FE0DC
	cmp r0, 0x13
	bhi _080FE100
_080FE0DC:
	cmp r3, 0x13
	bls _080FE0F4
	cmp r2, 0x13
	bls _080FE0EA
	cmp r0, 0xE
	bhi _080FE100
	b _080FE138
_080FE0EA:
	cmp r0, 0x13
	bls _080FE0F4
	cmp r2, 0xE
	bhi _080FE100
	b _080FE114
_080FE0F4:
	cmp r2, 0x13
	bls _080FE104
	cmp r0, 0x13
	bls _080FE104
	cmp r3, 0xE
	bls _080FE15C
_080FE100:
	movs r0, 0x2
	b _080FE176
_080FE104:
	cmp r3, 0x13
	bls _080FE128
	cmp r2, 0xB
	bls _080FE11C
	cmp r0, 0xB
	bls _080FE118
	cmp r2, r0
	bcs _080FE138
_080FE114:
	movs r0, 0x8
	b _080FE176
_080FE118:
	movs r0, 0xA
	b _080FE176
_080FE11C:
	cmp r0, 0xB
	bls _080FE124
	movs r0, 0xD
	b _080FE176
_080FE124:
	movs r0, 0x4
	b _080FE176
_080FE128:
	cmp r2, 0x13
	bls _080FE14C
	cmp r3, 0xB
	bls _080FE140
	cmp r0, 0xB
	bls _080FE13C
	cmp r3, r0
	bcc _080FE15C
_080FE138:
	movs r0, 0x7
	b _080FE176
_080FE13C:
	movs r0, 0xB
	b _080FE176
_080FE140:
	cmp r0, 0xB
	bls _080FE148
	movs r0, 0xE
	b _080FE176
_080FE148:
	movs r0, 0x5
	b _080FE176
_080FE14C:
	cmp r0, 0x13
	bls _080FE174
	cmp r3, 0xB
	bls _080FE160
	cmp r2, 0xB
	bls _080FE168
	cmp r3, r2
	bcs _080FE114
_080FE15C:
	movs r0, 0x9
	b _080FE176
_080FE160:
	cmp r2, 0xB
	bls _080FE168
	movs r0, 0xC
	b _080FE176
_080FE168:
	cmp r0, 0xB
	bls _080FE170
	movs r0, 0xF
	b _080FE176
_080FE170:
	movs r0, 0x6
	b _080FE176
_080FE174:
	movs r0, 0x3
_080FE176:
	pop {r1}
	bx r1
	thumb_func_end sub_80FE0AC

	thumb_func_start sub_80FE17C
sub_80FE17C: @ 80FE17C
	push {lr}
	ldrh r1, [r0]
	movs r3, 0x1F
	movs r0, 0x1F
	ands r0, r1
	lsls r1, 16
	lsrs r2, r1, 21
	ands r2, r3
	lsrs r1, 26
	ands r1, r3
	adds r0, r2
	adds r0, r1
	movs r1, 0x3
	bl __divsi3
	movs r1, 0x1E
	ands r0, r1
	lsls r0, 16
	cmp r0, 0
	beq _080FE1A8
	lsrs r0, 17
	b _080FE1AA
_080FE1A8:
	movs r0, 0x1
_080FE1AA:
	pop {r1}
	bx r1
	thumb_func_end sub_80FE17C

	thumb_func_start sub_80FE1B0
sub_80FE1B0: @ 80FE1B0
	push {lr}
	ldrh r1, [r0]
	movs r3, 0x1F
	movs r0, 0x1F
	ands r0, r1
	lsls r1, 16
	lsrs r2, r1, 21
	ands r2, r3
	lsrs r1, 26
	ands r1, r3
	adds r0, r2
	adds r0, r1
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80FE1B0

	.align 2, 0 @ Don't pad with nop.
