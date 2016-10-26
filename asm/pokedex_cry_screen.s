	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_8119E3C
sub_8119E3C: @ 8119E3C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r2, r1, 24
	movs r0, 0
	mov r9, r0
	ldr r6, _08119E60 @ =gUnknown_03005E98
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _08119EE0
	cmp r0, 0x1
	bgt _08119E64
	cmp r0, 0
	beq _08119E6A
	b _08119F74
	.align 2, 0
_08119E60: .4byte gUnknown_03005E98
_08119E64:
	cmp r0, 0x2
	beq _08119F60
	b _08119F74
_08119E6A:
	ldr r4, _08119ECC @ =0x0201c000
	ldrh r0, [r5]
	movs r1, 0
	strh r0, [r4, 0x14]
	ldrb r0, [r5, 0x5]
	strb r0, [r4, 0x16]
	strb r1, [r4, 0x1A]
	strb r1, [r4, 0x1B]
	strb r1, [r4, 0x10]
	movs r0, 0x1C
	strb r0, [r4, 0x12]
	strb r1, [r4, 0x11]
	ldrb r1, [r5, 0x4]
	lsls r1, 19
	negs r1, r1
	asrs r1, 16
	adds r0, r2, 0
	movs r2, 0x1
	bl sub_811A350
	movs r0, 0
	mov r12, r6
	ldr r1, _08119ED0 @ =0x040000d4
	ldr r7, _08119ED4 @ =gUnknown_083FB718
	ldr r2, _08119ED8 @ =0xfffe4000
	adds r6, r4, r2
	ldr r5, _08119EDC @ =0x80000010
_08119EA0:
	movs r3, 0
	adds r4, r0, 0x1
	lsls r2, r0, 5
_08119EA6:
	str r7, [r1]
	adds r0, r2, r3
	lsls r0, 5
	adds r0, r6
	str r0, [r1, 0x4]
	str r5, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1F
	bls _08119EA6
	lsls r0, r4, 24
	lsrs r0, 24
	cmp r0, 0x6
	bls _08119EA0
	mov r1, r12
	b _08119F50
	.align 2, 0
_08119ECC: .4byte 0x0201c000
_08119ED0: .4byte 0x040000d4
_08119ED4: .4byte gUnknown_083FB718
_08119ED8: .4byte 0xfffe4000
_08119EDC: .4byte 0x80000010
_08119EE0:
	ldrb r0, [r5, 0x2]
	lsls r0, 27
	lsrs r7, r0, 16
	ldrb r1, [r5, 0x3]
	lsls r1, 12
	ldrh r0, [r5]
	lsls r0, 18
	lsrs r0, 23
	adds r1, r0
	lsls r1, 16
	lsrs r6, r1, 16
	movs r0, 0
	ldr r2, _08119F58 @ =0x0201c000
	mov r8, r2
	movs r1, 0xC0
	lsls r1, 19
	mov r12, r1
_08119F02:
	movs r3, 0
	adds r4, r0, 0x1
	lsls r5, r0, 6
_08119F08:
	lsls r1, r3, 1
	adds r1, r5
	adds r1, r7
	add r1, r12
	adds r2, r6, 0
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	strh r2, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x1F
	bls _08119F08
	lsls r0, r4, 24
	lsrs r0, 24
	cmp r0, 0x6
	bls _08119F02
	mov r2, r8
	ldrb r0, [r2, 0x16]
	movs r4, 0
	cmp r0, 0
	beq _08119F4E
	mov r5, r8
_08119F38:
	adds r0, r4, 0
	movs r1, 0
	bl sub_811A1C8
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5, 0x16]
	lsls r0, 3
	cmp r4, r0
	blt _08119F38
_08119F4E:
	ldr r1, _08119F5C @ =gUnknown_03005E98
_08119F50:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08119F74
	.align 2, 0
_08119F58: .4byte 0x0201c000
_08119F5C: .4byte gUnknown_03005E98
_08119F60:
	bl sub_811A324
	ldr r0, _08119F84 @ =gUnknown_083FB6F8
	ldrb r1, [r5, 0x3]
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x1
	mov r9, r0
_08119F74:
	mov r0, r9
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08119F84: .4byte gUnknown_083FB6F8
	thumb_func_end sub_8119E3C

	thumb_func_start sub_8119F88
sub_8119F88: @ 8119F88
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_811A324
	adds r0, r4, 0
	bl sub_811A15C
	ldr r1, _08119FC4 @ =0x0201c000
	ldrb r0, [r1, 0x1B]
	cmp r0, 0
	beq _08119FA6
	subs r0, 0x1
	strb r0, [r1, 0x1B]
_08119FA6:
	ldrb r0, [r1, 0x1A]
	cmp r0, 0
	beq _08119FC8
	subs r0, 0x1
	strb r0, [r1, 0x1A]
	lsls r0, 24
	cmp r0, 0
	bne _08119FC8
	ldrh r0, [r1, 0x18]
	bl sub_811A0A0
	bl sub_811A124
	b _0811A044
	.align 2, 0
_08119FC4: .4byte 0x0201c000
_08119FC8:
	ldr r5, _08119FD8 @ =0x0201c000
	ldrb r0, [r5, 0x10]
	cmp r0, 0
	bne _08119FDC
	bl sub_811A124
	b _0811A044
	.align 2, 0
_08119FD8: .4byte 0x0201c000
_08119FDC:
	cmp r0, 0x1
	bne _08119FE6
	bl sub_811A0C0
	b _0811A006
_08119FE6:
	cmp r0, 0x8
	bls _0811A006
	bl IsCryPlaying
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08119FFE
	bl sub_811A124
	strb r4, [r5, 0x10]
	b _0811A044
_08119FFE:
	bl sub_811A0C0
	movs r0, 0x1
	strb r0, [r5, 0x10]
_0811A006:
	ldr r5, _0811A04C @ =0x0201c000
	ldrb r4, [r5, 0x10]
	subs r4, 0x1
	lsls r4, 25
	lsrs r4, 24
	ldrb r0, [r5, 0x16]
	lsls r0, 3
	ldrb r1, [r5, 0x11]
	adds r0, r1
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, r5
	ldrb r1, [r1]
	bl sub_811A1C8
	ldrb r0, [r5, 0x16]
	lsls r0, 3
	ldrb r1, [r5, 0x11]
	adds r0, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	adds r4, 0x1
	adds r4, r5
	ldrb r1, [r4]
	bl sub_811A1C8
	ldrb r0, [r5, 0x10]
	adds r0, 0x1
	strb r0, [r5, 0x10]
_0811A044:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811A04C: .4byte 0x0201c000
	thumb_func_end sub_8119F88

	thumb_func_start sub_811A050
sub_811A050: @ 811A050
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	adds r6, r5, 0
	ldr r0, _0811A08C @ =gMPlay_BGM
	ldr r0, [r0, 0x4]
	cmp r0, 0
	bge _0811A09A
	ldr r4, _0811A090 @ =0x0201c000
	ldrb r0, [r4, 0x1A]
	cmp r0, 0
	bne _0811A09A
	ldrb r0, [r4, 0x1B]
	cmp r0, 0
	bne _0811A09A
	movs r0, 0x4
	strb r0, [r4, 0x1B]
	bl IsCryPlaying
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0811A094
	bl StopCry
	strh r5, [r4, 0x18]
	movs r0, 0x2
	strb r0, [r4, 0x1A]
	b _0811A09A
	.align 2, 0
_0811A08C: .4byte gMPlay_BGM
_0811A090: .4byte 0x0201c000
_0811A094:
	adds r0, r6, 0
	bl sub_811A0A0
_0811A09A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_811A050

	thumb_func_start sub_811A0A0
sub_811A0A0: @ 811A0A0
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCry2
	ldr r1, _0811A0BC @ =0x0201c000
	movs r0, 0x1
	strb r0, [r1, 0x10]
	pop {r0}
	bx r0
	.align 2, 0
_0811A0BC: .4byte 0x0201c000
	thumb_func_end sub_811A0A0

	thumb_func_start sub_811A0C0
sub_811A0C0: @ 811A0C0
	push {r4,lr}
	ldr r3, _0811A0D0 @ =gPcmDmaCounter
	movs r0, 0
	ldrsb r0, [r3, r0]
	cmp r0, 0x1
	bgt _0811A0D8
	ldr r0, _0811A0D4 @ =gSoundInfo + 0x350
	b _0811A0F0
	.align 2, 0
_0811A0D0: .4byte gPcmDmaCounter
_0811A0D4: .4byte gSoundInfo + 0x350
_0811A0D8:
	ldr r2, _0811A11C @ =gSoundInfo
	ldrb r1, [r2, 0xB]
	movs r0, 0
	ldrsb r0, [r3, r0]
	subs r0, 0x1
	subs r1, r0
	ldr r0, [r2, 0x10]
	muls r0, r1
	movs r1, 0xD4
	lsls r1, 2
	adds r2, r1
	adds r0, r2
_0811A0F0:
	movs r1, 0xC6
	lsls r1, 3
	adds r3, r0, r1
	movs r2, 0
	ldr r4, _0811A120 @ =0x0201c000
_0811A0FA:
	adds r1, r2, r4
	lsls r0, r2, 1
	adds r0, r3
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _0811A0FA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811A11C: .4byte gSoundInfo
_0811A120: .4byte 0x0201c000
	thumb_func_end sub_811A0C0

	thumb_func_start sub_811A124
sub_811A124: @ 811A124
	push {r4,lr}
	ldr r4, _0811A158 @ =0x0201c000
	ldrb r0, [r4, 0x16]
	lsls r0, 3
	ldrb r1, [r4, 0x11]
	adds r0, r1
	subs r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_811A1C8
	ldrb r0, [r4, 0x16]
	lsls r0, 3
	ldrb r4, [r4, 0x11]
	adds r0, r4
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_811A1C8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811A158: .4byte 0x0201c000
	thumb_func_end sub_811A124

	thumb_func_start sub_811A15C
sub_811A15C: @ 811A15C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0811A1B4 @ =0x0201c000
	ldrb r1, [r4, 0x11]
	movs r2, 0
	bl sub_811A350
	ldrb r0, [r4, 0x11]
	adds r0, 0x2
	strb r0, [r4, 0x11]
	ldrb r0, [r4, 0x11]
	lsrs r0, 3
	ldrb r2, [r4, 0x16]
	adds r1, r0, r2
	adds r2, r1, 0x1
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	lsls r0, 16
	lsrs r3, r0, 16
	movs r1, 0
	ldr r2, _0811A1B8 @ =0x040000d4
	ldr r6, _0811A1BC @ =gUnknown_083FB718
	ldr r0, _0811A1C0 @ =0xfffe4000
	adds r5, r4, r0
	ldr r4, _0811A1C4 @ =0x80000010
_0811A194:
	str r6, [r2]
	lsls r0, r1, 5
	adds r0, r3
	lsls r0, 5
	adds r0, r5
	str r0, [r2, 0x4]
	str r4, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _0811A194
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811A1B4: .4byte 0x0201c000
_0811A1B8: .4byte 0x040000d4
_0811A1BC: .4byte gUnknown_083FB718
_0811A1C0: .4byte 0xfffe4000
_0811A1C4: .4byte 0x80000010
	thumb_func_end sub_811A15C

	thumb_func_start sub_811A1C8
sub_811A1C8: @ 811A1C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r5, r0, 24
	lsrs r4, r5, 24
	lsls r1, 24
	movs r0, 0xFE
	lsls r0, 23
	adds r1, r0
	lsrs r1, 16
	adds r0, r1, 0
	bl __floatsidf
	ldr r3, _0811A280 @ =0x00000000
	ldr r2, _0811A27C @ =0x40920000
	bl __divdf3
	bl __fixunsdfsi
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x37
	bls _0811A1FE
	movs r6, 0x37
_0811A1FE:
	str r6, [sp]
	movs r7, 0x1
	ands r7, r4
	ldr r0, _0811A284 @ =0x0201c000
	mov r10, r0
	lsrs r5, 27
	mov r8, r5
	ldr r0, _0811A288 @ =gUnknown_083FB738
	mov r1, r10
	ldrb r1, [r1, 0x12]
	cmp r6, r1
	bls _0811A298
	adds r0, r7, r0
	ldrb r0, [r0]
	mov r9, r0
	movs r2, 0x7
	ands r2, r4
_0811A220:
	lsls r1, r6, 1
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 4
	adds r1, r0
	ldr r3, _0811A28C @ =gUnknown_083FB274
	adds r1, r3
	mov r3, r8
	lsls r0, r3, 5
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0811A290 @ =0x02000000
	adds r5, r0, r1
	ldrb r4, [r5]
	mov r3, r9
	ands r4, r3
	strb r4, [r5]
	adds r0, r6, 0
	movs r1, 0x3
	str r2, [sp, 0x8]
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	movs r1, 0xF
	ands r0, r1
	lsls r1, r7, 4
	adds r0, r1
	ldr r1, _0811A294 @ =gUnknown_083FB73A
	adds r0, r1
	ldrb r0, [r0]
	orrs r4, r0
	strb r4, [r5]
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, [sp, 0x8]
	ldr r3, _0811A284 @ =0x0201c000
	ldrb r3, [r3, 0x12]
	cmp r6, r3
	bhi _0811A220
	b _0811A2FA
	.align 2, 0
_0811A27C: .4byte 0x40920000
_0811A280: .4byte 0x00000000
_0811A284: .4byte 0x0201c000
_0811A288: .4byte gUnknown_083FB738
_0811A28C: .4byte gUnknown_083FB274
_0811A290: .4byte 0x02000000
_0811A294: .4byte gUnknown_083FB73A
_0811A298:
	lsls r1, r7, 4
	str r1, [sp, 0x4]
	adds r0, r7, r0
	ldrb r0, [r0]
	mov r9, r0
	movs r7, 0x7
	ands r7, r4
_0811A2A6:
	lsls r1, r6, 1
	lsls r0, r7, 3
	adds r0, r7
	lsls r0, 4
	adds r1, r0
	ldr r2, _0811A314 @ =gUnknown_083FB274
	adds r1, r2
	mov r3, r8
	lsls r0, r3, 5
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0811A318 @ =0x02000000
	adds r5, r0, r1
	ldrb r4, [r5]
	mov r2, r9
	ands r4, r2
	strb r4, [r5]
	adds r0, r6, 0
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	movs r1, 0xF
	ands r0, r1
	ldr r3, [sp, 0x4]
	adds r0, r3
	ldr r1, _0811A31C @ =gUnknown_083FB73A
	adds r0, r1
	ldrb r0, [r0]
	orrs r4, r0
	strb r4, [r5]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _0811A320 @ =0x0201c000
	ldrb r2, [r2, 0x12]
	cmp r6, r2
	bcc _0811A2A6
_0811A2FA:
	mov r3, sp
	ldrb r0, [r3]
	mov r3, r10
	strb r0, [r3, 0x12]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811A314: .4byte gUnknown_083FB274
_0811A318: .4byte 0x02000000
_0811A31C: .4byte gUnknown_083FB73A
_0811A320: .4byte 0x0201c000
	thumb_func_end sub_811A1C8

	thumb_func_start sub_811A324
sub_811A324: @ 811A324
	ldr r2, _0811A344 @ =0x040000d4
	ldr r0, _0811A348 @ =0x02000000
	str r0, [r2]
	movs r1, 0xE0
	lsls r1, 9
	adds r0, r1
	ldrh r0, [r0, 0x14]
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	str r0, [r2, 0x4]
	ldr r0, _0811A34C @ =0x80000e00
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	bx lr
	.align 2, 0
_0811A344: .4byte 0x040000d4
_0811A348: .4byte 0x02000000
_0811A34C: .4byte 0x80000e00
	thumb_func_end sub_811A324

	thumb_func_start sub_811A350
sub_811A350: @ 811A350
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	cmp r0, 0x1
	beq _0811A38C
	cmp r0, 0x1
	bgt _0811A36E
	cmp r0, 0
	beq _0811A378
	b _0811A3C4
_0811A36E:
	cmp r3, 0x2
	beq _0811A3A0
	cmp r3, 0x3
	beq _0811A3B4
	b _0811A3C4
_0811A378:
	cmp r2, 0
	beq _0811A384
	ldr r0, _0811A380 @ =REG_BG0VOFS
	b _0811A3C2
	.align 2, 0
_0811A380: .4byte REG_BG0VOFS
_0811A384:
	ldr r0, _0811A388 @ =REG_BG0HOFS
	b _0811A3C2
	.align 2, 0
_0811A388: .4byte REG_BG0HOFS
_0811A38C:
	cmp r2, 0
	beq _0811A398
	ldr r0, _0811A394 @ =REG_BG1VOFS
	b _0811A3C2
	.align 2, 0
_0811A394: .4byte REG_BG1VOFS
_0811A398:
	ldr r0, _0811A39C @ =REG_BG1HOFS
	b _0811A3C2
	.align 2, 0
_0811A39C: .4byte REG_BG1HOFS
_0811A3A0:
	cmp r2, 0
	beq _0811A3AC
	ldr r0, _0811A3A8 @ =REG_BG2VOFS
	b _0811A3C2
	.align 2, 0
_0811A3A8: .4byte REG_BG2VOFS
_0811A3AC:
	ldr r0, _0811A3B0 @ =REG_BG2HOFS
	b _0811A3C2
	.align 2, 0
_0811A3B0: .4byte REG_BG2HOFS
_0811A3B4:
	cmp r2, 0
	beq _0811A3C0
	ldr r0, _0811A3BC @ =REG_BG3VOFS
	b _0811A3C2
	.align 2, 0
_0811A3BC: .4byte REG_BG3VOFS
_0811A3C0:
	ldr r0, _0811A3C8 @ =REG_BG3HOFS
_0811A3C2:
	strh r1, [r0]
_0811A3C4:
	pop {r0}
	bx r0
	.align 2, 0
_0811A3C8: .4byte REG_BG3HOFS
	thumb_func_end sub_811A350

	thumb_func_start sub_811A3CC
sub_811A3CC: @ 811A3CC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r4, r0, 0
	movs r0, 0
	str r0, [sp]
	ldr r0, _0811A3F4 @ =gUnknown_03005E98
	ldrb r1, [r0]
	mov r10, r0
	cmp r1, 0x1
	beq _0811A42C
	cmp r1, 0x1
	bgt _0811A3F8
	cmp r1, 0
	beq _0811A3FE
	b _0811A4D6
	.align 2, 0
_0811A3F4: .4byte gUnknown_03005E98
_0811A3F8:
	cmp r1, 0x2
	beq _0811A494
	b _0811A4D6
_0811A3FE:
	ldr r0, _0811A424 @ =gUnknown_083FAF3C
	ldrh r1, [r4]
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r2
	bl LZ77UnCompVram
	ldr r0, _0811A428 @ =gUnknown_083FAF1C
	ldrb r1, [r4, 0x3]
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	mov r1, r10
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0811A4D6
	.align 2, 0
_0811A424: .4byte gUnknown_083FAF3C
_0811A428: .4byte gUnknown_083FAF1C
_0811A42C:
	ldrb r0, [r4, 0x2]
	lsls r0, 11
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	mov r8, r0
	ldrh r0, [r4]
	lsls r0, 18
	lsrs r0, 23
	mov r12, r0
	movs r5, 0
	ldr r2, _0811A490 @ =gUnknown_083FAE7C
	mov r9, r2
_0811A446:
	movs r3, 0
	lsls r0, r5, 2
	adds r7, r5, 0x1
	adds r0, r5
	lsls r6, r0, 1
_0811A450:
	ldrb r0, [r4, 0x5]
	adds r0, r5, r0
	ldrb r2, [r4, 0x4]
	adds r2, r3, r2
	lsls r2, 1
	lsls r0, 6
	adds r2, r0
	add r2, r8
	adds r1, r6, r3
	lsls r1, 1
	add r1, r9
	ldrb r0, [r4, 0x3]
	lsls r0, 12
	ldrh r1, [r1]
	orrs r0, r1
	add r0, r12
	strh r0, [r2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x9
	bls _0811A450
	lsls r0, r7, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0811A446
	mov r3, r10
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	b _0811A4D6
	.align 2, 0
_0811A490: .4byte gUnknown_083FAE7C
_0811A494:
	ldr r0, _0811A4E8 @ =gCryMeterNeedleSpriteSheets
	bl LoadSpriteSheets
	ldr r0, _0811A4EC @ =gCryMeterNeedleSpritePalettes
	bl LoadSpritePalettes
	ldr r0, _0811A4F0 @ =gSpriteTemplate_83FB774
	ldrb r1, [r4, 0x4]
	lsls r1, 19
	movs r2, 0xA0
	lsls r2, 14
	adds r1, r2
	asrs r1, 16
	ldrb r2, [r4, 0x5]
	lsls r2, 19
	movs r3, 0xE0
	lsls r3, 14
	adds r2, r3
	asrs r2, 16
	movs r3, 0x1
	bl CreateSprite
	ldr r1, _0811A4F4 @ =0x0201c800
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	strh r0, [r1, 0x4]
	movs r0, 0x20
	strb r0, [r1]
	strb r0, [r1, 0x1]
	strb r2, [r1, 0x2]
	movs r0, 0x1
	str r0, [sp]
_0811A4D6:
	ldr r0, [sp]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811A4E8: .4byte gCryMeterNeedleSpriteSheets
_0811A4EC: .4byte gCryMeterNeedleSpritePalettes
_0811A4F0: .4byte gSpriteTemplate_83FB774
_0811A4F4: .4byte 0x0201c800
	thumb_func_end sub_811A3CC

	thumb_func_start sub_811A4F8
sub_811A4F8: @ 811A4F8
	push {r4,r5,lr}
	ldr r5, _0811A52C @ =gSprites
	ldr r4, _0811A530 @ =0x0201c800
	ldrh r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	ldrh r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811A52C: .4byte gSprites
_0811A530: .4byte 0x0201c800
	thumb_func_end sub_811A4F8

	thumb_func_start sub_811A534
sub_811A534: @ 811A534
	push {r4-r7,lr}
	sub sp, 0x14
	adds r7, r0, 0
	ldr r3, _0811A578 @ =gSprites
	ldr r5, _0811A57C @ =0x0201c800
	ldrh r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r2, [r0, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldrh r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x6]
	ldr r0, _0811A580 @ =0xfffff800
	adds r1, r5, r0
	ldrb r0, [r1, 0x10]
	cmp r0, 0x2
	beq _0811A5AA
	cmp r0, 0x2
	bgt _0811A584
	cmp r0, 0
	beq _0811A58A
	b _0811A5F4
	.align 2, 0
_0811A578: .4byte gSprites
_0811A57C: .4byte 0x0201c800
_0811A580: .4byte 0xfffff800
_0811A584:
	cmp r0, 0x6
	beq _0811A5E2
	b _0811A5F4
_0811A58A:
	movs r0, 0x20
	strb r0, [r5, 0x1]
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0
	ble _0811A5A4
	ldrb r0, [r5, 0x2]
	add r4, sp, 0xC
	cmp r0, 0x1
	beq _0811A5F6
	subs r0, 0x1
	strb r0, [r5, 0x2]
	b _0811A5F6
_0811A5A4:
	movs r0, 0x5
	strb r0, [r5, 0x2]
	b _0811A5F4
_0811A5AA:
	movs r3, 0
	movs r2, 0
	add r4, sp, 0xC
	adds r5, r1, 0
_0811A5B2:
	lsls r1, r3, 24
	asrs r1, 24
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r1, r0
	bge _0811A5C0
	adds r3, r0, 0
_0811A5C0:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xF
	bls _0811A5B2
	lsls r0, r3, 24
	asrs r0, 24
	movs r1, 0xD0
	muls r0, r1
	cmp r0, 0
	bge _0811A5D8
	adds r0, 0xFF
_0811A5D8:
	lsls r0, 16
	asrs r0, 24
	bl sub_811A6D8
	b _0811A5F6
_0811A5E2:
	ldr r1, _0811A620 @ =0xfffff80a
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, 0xD0
	muls r0, r1
	lsls r0, 16
	asrs r0, 24
	bl sub_811A6D8
_0811A5F4:
	add r4, sp, 0xC
_0811A5F6:
	ldr r0, _0811A624 @ =0x0201c800
	ldrb r3, [r0]
	movs r2, 0
	ldrsb r2, [r0, r2]
	ldrb r6, [r0, 0x1]
	movs r1, 0x1
	ldrsb r1, [r0, r1]
	adds r5, r0, 0
	cmp r2, r1
	beq _0811A63C
	cmp r2, r1
	bge _0811A628
	ldrb r0, [r5, 0x2]
	adds r0, r3, r0
	strb r0, [r5]
	lsls r0, 24
	asrs r0, 24
	cmp r0, r1
	ble _0811A63C
	b _0811A636
	.align 2, 0
_0811A620: .4byte 0xfffff80a
_0811A624: .4byte 0x0201c800
_0811A628:
	ldrb r0, [r5, 0x2]
	subs r0, r3, r0
	strb r0, [r5]
	lsls r0, 24
	asrs r0, 24
	cmp r0, r1
	bge _0811A63C
_0811A636:
	strb r6, [r5]
	movs r0, 0
	strb r0, [r5, 0x1]
_0811A63C:
	ldr r2, _0811A6CC @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r2
	movs r1, 0x80
	lsls r1, 1
	orrs r0, r1
	ldr r1, _0811A6D0 @ =0x0000ffff
	ands r0, r1
	movs r1, 0x80
	lsls r1, 17
	orrs r0, r1
	str r0, [sp, 0x4]
	movs r1, 0
	ldrsb r1, [r5, r1]
	lsls r1, 24
	lsrs r1, 16
	ldr r0, [sp, 0x8]
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x8]
	add r0, sp, 0x4
	adds r1, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ObjAffineSet
	add r0, sp, 0xC
	ldrh r1, [r0]
	ldrh r2, [r4, 0x2]
	ldrh r3, [r4, 0x4]
	ldrh r0, [r4, 0x6]
	str r0, [sp]
	movs r0, 0
	bl SetOamMatrix
	ldr r2, _0811A6D4 @ =gSineTable
	movs r0, 0
	ldrsb r0, [r5, r0]
	adds r0, 0x7F
	movs r1, 0xFF
	ands r0, r1
	lsls r1, r0, 1
	adds r1, r2
	adds r0, 0x40
	lsls r0, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0
	ldrsh r1, [r1, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	cmp r0, 0
	bge _0811A6AA
	adds r0, 0xFF
_0811A6AA:
	asrs r0, 8
	strh r0, [r7, 0x24]
	lsls r1, r2, 16
	asrs r1, 16
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	cmp r0, 0
	bge _0811A6BE
	adds r0, 0xFF
_0811A6BE:
	asrs r0, 8
	strh r0, [r7, 0x26]
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811A6CC: .4byte 0xffff0000
_0811A6D0: .4byte 0x0000ffff
_0811A6D4: .4byte gSineTable
	thumb_func_end sub_811A534

	thumb_func_start sub_811A6D8
sub_811A6D8: @ 811A6D8
	push {lr}
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x20
	subs r2, r1, r0
	movs r0, 0xFF
	ands r2, r0
	adds r0, r2, 0
	subs r0, 0x21
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xBE
	bhi _0811A6F4
	movs r2, 0xE0
_0811A6F4:
	ldr r1, _0811A700 @ =0x0201c800
	strb r2, [r1, 0x1]
	movs r0, 0x5
	strb r0, [r1, 0x2]
	pop {r0}
	bx r0
	.align 2, 0
_0811A700: .4byte 0x0201c800
	thumb_func_end sub_811A6D8

	.align 2, 0 @ Don't pad with nop.
