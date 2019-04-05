	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F66E0
sub_80F66E0: @ 80F66E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _080F676C @ =gPokenavStructPtr
	mov r8, r0
	ldr r4, [r0]
	ldr r1, _080F6770 @ =0x00008829
	adds r0, r4, r1
	ldr r2, _080F6774 @ =0x0000876e
	adds r5, r4, r2
	ldrh r1, [r5]
	movs r2, 0
	bl sub_80F6514
	movs r3, 0
	ldrsh r0, [r5, r3]
	movs r1, 0
	bl sub_80F4824
	ldrh r1, [r5]
	ldr r6, _080F6778 @ =0x000087dc
	adds r0, r4, r6
	movs r6, 0
	strh r1, [r0]
	ldr r1, _080F677C @ =0x0000bc8e
	adds r0, r4, r1
	strb r6, [r0]
	movs r2, 0
	mov r9, r2
	movs r3, 0
	ldrsh r1, [r5, r3]
	lsls r1, 2
	adds r1, r4, r1
	ldr r5, _080F6780 @ =0x0000893d
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _080F6784 @ =0x0000893e
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 27
	lsrs r1, 27
	movs r2, 0x52
	movs r3, 0
	bl sub_80F44B0
	adds r7, r0, 0
	ldr r3, _080F6788 @ =0x0000bc8f
	adds r4, r3
	strb r6, [r4]
	movs r5, 0
	mov r12, r5
	mov r10, r8
_080F674E:
	ldr r1, _080F678C @ =gUnknown_083E499C
	mov r6, r12
	lsls r0, r6, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x36
	bgt _080F6790
	cmp r0, 0x32
	blt _080F6790
	movs r0, 0x7
	adds r2, r7, 0
	ands r2, r0
	lsrs r7, 3
	movs r0, 0x4
	b _080F679A
	.align 2, 0
_080F676C: .4byte gPokenavStructPtr
_080F6770: .4byte 0x00008829
_080F6774: .4byte 0x0000876e
_080F6778: .4byte 0x000087dc
_080F677C: .4byte 0x0000bc8e
_080F6780: .4byte 0x0000893d
_080F6784: .4byte 0x0000893e
_080F6788: .4byte 0x0000bc8f
_080F678C: .4byte gUnknown_083E499C
_080F6790:
	movs r0, 0x1
	adds r2, r7, 0
	ands r2, r0
	lsrs r7, 1
	movs r0, 0x1
_080F679A:
	movs r4, 0
	adds r1, r2, 0
	add r0, r9
	mov r8, r0
	cmp r4, r1
	bcs _080F67D4
	mov r3, r10
	ldr r0, [r3]
	ldr r5, _080F6828 @ =0x0000bc8e
	adds r3, r0, r5
	ldr r6, _080F682C @ =0x0000bc4c
	adds r6, r0, r6
	str r6, [sp]
	adds r5, r1, 0
_080F67B6:
	ldrb r0, [r3]
	adds r1, r0, 0x1
	strb r1, [r3]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp]
	adds r0, r1, r0
	mov r6, r9
	adds r1, r6, r4
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r5
	bcc _080F67B6
_080F67D4:
	cmp r2, 0
	beq _080F67EC
	mov r0, r9
	cmp r0, 0x18
	bls _080F67EC
	mov r2, r10
	ldr r1, [r2]
	ldr r3, _080F6830 @ =0x0000bc8f
	adds r1, r3
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F67EC:
	mov r5, r8
	lsls r0, r5, 24
	lsrs r0, 24
	mov r9, r0
	mov r0, r12
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	cmp r0, 0x10
	bls _080F674E
	ldr r6, _080F6834 @ =gPokenavStructPtr
	ldr r2, [r6]
	ldr r1, _080F6828 @ =0x0000bc8e
	adds r0, r2, r1
	ldr r3, _080F6830 @ =0x0000bc8f
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080F6840
	ldr r5, _080F6838 @ =0x0000bc90
	adds r0, r2, r5
	movs r1, 0
	strb r1, [r0]
	ldr r6, _080F683C @ =0x0000bc91
	adds r0, r2, r6
	strb r1, [r0]
	b _080F6850
	.align 2, 0
_080F6828: .4byte 0x0000bc8e
_080F682C: .4byte 0x0000bc4c
_080F6830: .4byte 0x0000bc8f
_080F6834: .4byte gPokenavStructPtr
_080F6838: .4byte 0x0000bc90
_080F683C: .4byte 0x0000bc91
_080F6840:
	ldr r0, _080F6888 @ =0x0000bc90
	adds r1, r2, r0
	movs r0, 0
	strb r0, [r1]
	ldr r3, _080F688C @ =0x0000bc91
	adds r1, r2, r3
	movs r0, 0x3
	strb r0, [r1]
_080F6850:
	ldr r5, _080F6890 @ =gPokenavStructPtr
	ldr r1, [r5]
	ldr r6, _080F6894 @ =0x0000bc8e
	adds r0, r1, r6
	ldr r2, _080F6898 @ =0x0000bc8f
	adds r1, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	subs r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	movs r3, 0
	mov r12, r3
	adds r3, r5, 0
	ldr r1, _080F689C @ =0x0000bc96
	movs r4, 0x9
_080F6870:
	cmp r2, 0x8
	bls _080F68A0
	ldr r0, [r3]
	adds r0, r1
	add r0, r12
	strb r4, [r0]
	adds r0, r2, 0
	subs r0, 0x9
	lsls r0, 24
	lsrs r2, r0, 24
	b _080F68AA
	.align 2, 0
_080F6888: .4byte 0x0000bc90
_080F688C: .4byte 0x0000bc91
_080F6890: .4byte gPokenavStructPtr
_080F6894: .4byte 0x0000bc8e
_080F6898: .4byte 0x0000bc8f
_080F689C: .4byte 0x0000bc96
_080F68A0:
	ldr r0, [r3]
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	movs r2, 0
_080F68AA:
	mov r0, r12
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	cmp r0, 0x2
	bls _080F6870
	ldr r5, _080F68DC @ =gPokenavStructPtr
	ldr r0, [r5]
	ldr r6, _080F68E0 @ =0x0000bc96
	adds r1, r0, r6
	add r1, r12
	ldr r2, _080F68E4 @ =0x0000bc8f
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F68DC: .4byte gPokenavStructPtr
_080F68E0: .4byte 0x0000bc96
_080F68E4: .4byte 0x0000bc8f
	thumb_func_end sub_80F66E0

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
