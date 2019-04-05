	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F68E8
sub_80F68E8: @ 80F68E8
	push {r4-r7,lr}
	ldr r3, _080F6918 @ =gPokenavStructPtr
	ldr r0, [r3]
	ldr r2, _080F691C @ =0x0000bc90
	adds r1, r0, r2
	ldrb r5, [r1]
	ldr r6, _080F6920 @ =0x0000bc91
	adds r0, r6
	ldrb r4, [r0]
	movs r0, 0x1
	mov r12, r0
	ldr r2, _080F6924 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	adds r6, r3, 0
	adds r7, r2, 0
	cmp r0, 0
	beq _080F692E
	lsls r0, r4, 24
	cmp r0, 0
	ble _080F692E
	b _080F69BC
	.align 2, 0
_080F6918: .4byte gPokenavStructPtr
_080F691C: .4byte 0x0000bc90
_080F6920: .4byte 0x0000bc91
_080F6924: .4byte gMain
_080F6928:
	ldr r1, _080F69B0 @ =0x0000bc91
	adds r0, r2, r1
	ldrb r4, [r0]
_080F692E:
	ldrh r1, [r7, 0x30]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080F6978
	lsls r0, r4, 24
	asrs r0, 24
	cmp r0, 0x2
	bgt _080F6978
	ldr r3, _080F69B4 @ =gPokenavStructPtr
	ldr r2, _080F69B8 @ =0x0000bc96
_080F6944:
	lsls r0, r4, 24
	asrs r0, 24
	cmp r0, 0x2
	bgt _080F6960
	adds r0, 0x1
	lsls r0, 24
	ldr r1, [r3]
	lsrs r4, r0, 24
	asrs r0, 24
	adds r1, r2
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080F6944
_080F6960:
	ldr r2, [r6]
	lsls r0, r4, 24
	asrs r0, 24
	ldr r3, _080F69B8 @ =0x0000bc96
	adds r1, r2, r3
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _080F69EC
	ldr r1, _080F69B0 @ =0x0000bc91
	adds r0, r2, r1
	ldrb r4, [r0]
_080F6978:
	ldrh r2, [r7, 0x30]
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _080F698A
	lsls r0, r5, 24
	asrs r0, 24
	cmp r0, 0
	bgt _080F6A3C
_080F698A:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _080F69AA
	lsls r0, r5, 24
	asrs r2, r0, 24
	ldr r1, [r6]
	lsls r0, r4, 24
	asrs r0, 24
	ldr r3, _080F69B8 @ =0x0000bc96
	adds r1, r3
	adds r1, r0
	ldrb r0, [r1]
	subs r0, 0x1
	cmp r2, r0
	blt _080F6A38
_080F69AA:
	movs r0, 0
	mov r12, r0
	b _080F69FC
	.align 2, 0
_080F69B0: .4byte 0x0000bc91
_080F69B4: .4byte gPokenavStructPtr
_080F69B8: .4byte 0x0000bc96
_080F69BC:
	lsls r0, r4, 24
	asrs r0, 24
	cmp r0, 0
	ble _080F69DA
	subs r0, 0x1
	lsls r0, 24
	ldr r1, [r6]
	lsrs r4, r0, 24
	asrs r0, 24
	ldr r2, _080F6A2C @ =0x0000bc96
	adds r1, r2
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080F69BC
_080F69DA:
	ldr r2, [r6]
	lsls r0, r4, 24
	asrs r0, 24
	ldr r3, _080F6A2C @ =0x0000bc96
	adds r1, r2, r3
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080F6928
_080F69EC:
	lsls r0, r5, 24
	asrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	blt _080F69FC
	subs r0, r1, 0x1
_080F69F8:
	lsls r0, 24
	lsrs r5, r0, 24
_080F69FC:
	mov r0, r12
	cmp r0, 0
	beq _080F6A44
	lsls r0, r5, 24
	asrs r0, 24
	ldr r3, [r6]
	ldr r1, _080F6A30 @ =0x0000bc90
	adds r2, r3, r1
	ldrb r6, [r2]
	cmp r0, r6
	bne _080F6A20
	lsls r0, r4, 24
	asrs r0, 24
	ldr r6, _080F6A34 @ =0x0000bc91
	adds r1, r3, r6
	ldrb r1, [r1]
	cmp r0, r1
	beq _080F6A40
_080F6A20:
	strb r5, [r2]
	ldr r1, _080F6A34 @ =0x0000bc91
	adds r0, r3, r1
	strb r4, [r0]
	b _080F6A44
	.align 2, 0
_080F6A2C: .4byte 0x0000bc96
_080F6A30: .4byte 0x0000bc90
_080F6A34: .4byte 0x0000bc91
_080F6A38:
	adds r0, r2, 0x1
	b _080F69F8
_080F6A3C:
	subs r0, 0x1
	b _080F69F8
_080F6A40:
	movs r2, 0
	mov r12, r2
_080F6A44:
	mov r0, r12
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F68E8

	thumb_func_start sub_80F6A4C
sub_80F6A4C: @ 80F6A4C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r0, _080F6AC4 @ =gPokenavStructPtr
	ldr r3, [r0]
	ldr r0, _080F6AC8 @ =0x0000876e
	adds r2, r3, r0
	lsls r0, r4, 24
	asrs r0, 24
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	lsls r0, 16
	cmp r0, 0
	bge _080F6A74
	ldr r5, _080F6ACC @ =0x00008774
	adds r0, r3, r5
	ldrh r0, [r0]
	strh r0, [r2]
_080F6A74:
	ldr r1, _080F6ACC @ =0x00008774
	adds r0, r3, r1
	movs r5, 0
	ldrsh r1, [r2, r5]
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	ble _080F6A88
	movs r0, 0
	strh r0, [r2]
_080F6A88:
	ldr r1, _080F6AD0 @ =0x0000bc94
	adds r0, r3, r1
	strb r4, [r0]
	ldrh r1, [r2]
	ldr r2, _080F6AD4 @ =0x000087dc
	adds r0, r3, r2
	strh r1, [r0]
	ldr r1, _080F6AD8 @ =REG_WININ
	ldr r5, _080F6ADC @ =0x00003f37
	adds r0, r5, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080F6AE0 @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	ldr r5, _080F6AE4 @ =0x000058f0
	adds r0, r5, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080F6AE8 @ =0x00002060
	adds r0, r2, 0
	strh r0, [r1]
	ldr r5, _080F6AEC @ =0x000087de
	adds r1, r3, r5
	movs r0, 0
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F6AC4: .4byte gPokenavStructPtr
_080F6AC8: .4byte 0x0000876e
_080F6ACC: .4byte 0x00008774
_080F6AD0: .4byte 0x0000bc94
_080F6AD4: .4byte 0x000087dc
_080F6AD8: .4byte REG_WININ
_080F6ADC: .4byte 0x00003f37
_080F6AE0: .4byte 0x00003f3f
_080F6AE4: .4byte 0x000058f0
_080F6AE8: .4byte 0x00002060
_080F6AEC: .4byte 0x000087de
	thumb_func_end sub_80F6A4C

	thumb_func_start sub_80F6AF0
sub_80F6AF0: @ 80F6AF0
	push {r4,lr}
	ldr r1, _080F6B10 @ =gPokenavStructPtr
	ldr r0, [r1]
	ldr r2, _080F6B14 @ =0x000087de
	adds r0, r2
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x6
	bls _080F6B04
	b _080F6C08
_080F6B04:
	lsls r0, 2
	ldr r1, _080F6B18 @ =_080F6B1C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F6B10: .4byte gPokenavStructPtr
_080F6B14: .4byte 0x000087de
_080F6B18: .4byte _080F6B1C
	.align 2, 0
_080F6B1C:
	.4byte _080F6B38
	.4byte _080F6B54
	.4byte _080F6B6E
	.4byte _080F6B84
	.4byte _080F6B9C
	.4byte _080F6BC0
	.4byte _080F6BE0
_080F6B38:
	bl sub_80F173C
	lsls r0, 24
	cmp r0, 0
	bne _080F6C18
	ldr r0, _080F6B4C @ =gPokenavStructPtr
	ldr r1, [r0]
	ldr r3, _080F6B50 @ =0x000087de
	adds r1, r3
	b _080F6BCE
	.align 2, 0
_080F6B4C: .4byte gPokenavStructPtr
_080F6B50: .4byte 0x000087de
_080F6B54:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 6
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	bl sub_80F1480
	bl sub_80F66E0
	b _080F6BC6
_080F6B6E:
	bl DrawMonRibbonIcons
	ldr r0, _080F6B7C @ =gPokenavStructPtr
	ldr r1, [r0]
	ldr r2, _080F6B80 @ =0x000087de
	adds r1, r2
	b _080F6BCE
	.align 2, 0
_080F6B7C: .4byte gPokenavStructPtr
_080F6B80: .4byte 0x000087de
_080F6B84:
	bl sub_80F13FC
	ldr r0, _080F6B94 @ =gPokenavStructPtr
	ldr r1, [r0]
	ldr r3, _080F6B98 @ =0x000087de
	adds r1, r3
	b _080F6BCE
	.align 2, 0
_080F6B94: .4byte gPokenavStructPtr
_080F6B98: .4byte 0x000087de
_080F6B9C:
	ldr r4, [r4]
	ldr r1, _080F6BB8 @ =0x0000876e
	adds r0, r4, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0
	bl sub_80F4824
	ldr r3, _080F6BBC @ =0x000087de
	adds r4, r3
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080F6C18
	.align 2, 0
_080F6BB8: .4byte 0x0000876e
_080F6BBC: .4byte 0x000087de
_080F6BC0:
	movs r0, 0
	bl sub_80F2E18
_080F6BC6:
	ldr r0, _080F6BD8 @ =gPokenavStructPtr
	ldr r1, [r0]
	ldr r0, _080F6BDC @ =0x000087de
	adds r1, r0
_080F6BCE:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080F6C18
	.align 2, 0
_080F6BD8: .4byte gPokenavStructPtr
_080F6BDC: .4byte 0x000087de
_080F6BE0:
	bl sub_80F170C
	lsls r0, 24
	cmp r0, 0
	bne _080F6C18
	bl sub_80F1438
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080F6C0C @ =0x0000dfff
	ands r0, r1
	strh r0, [r2]
	ldr r0, _080F6C10 @ =gPokenavStructPtr
	ldr r1, [r0]
	ldr r2, _080F6C14 @ =0x000087de
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F6C08:
	movs r0, 0
	b _080F6C1A
	.align 2, 0
_080F6C0C: .4byte 0x0000dfff
_080F6C10: .4byte gPokenavStructPtr
_080F6C14: .4byte 0x000087de
_080F6C18:
	movs r0, 0x1
_080F6C1A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80F6AF0

	.align 2, 0 @ Don't pad with nop.
