	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80EA1E0
sub_80EA1E0: @ 80EA1E0
	push {r4-r6,lr}
	ldr r0, _080EA240 @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0xC4
	ldrh r0, [r0]
	cmp r0, 0
	beq _080EA244
	movs r4, 0
	adds r0, r1, 0
	adds r0, 0xC2
	ldrh r2, [r0]
	cmp r4, r2
	bcs _080EA228
	adds r5, r1, 0
	adds r6, r0, 0
_080EA200:
	lsls r0, r4, 4
	adds r0, 0xC8
	adds r0, r5, r0
	bl sub_80EAC0C
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r1
	adds r0, r5, r0
	bl sub_80EAC48
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrh r2, [r6]
	cmp r4, r2
	bcc _080EA200
_080EA228:
	ldr r0, _080EA240 @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r2, r1, 0
	adds r2, 0xBC
	movs r0, 0x1
	strb r0, [r2]
	adds r1, 0xC4
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	movs r0, 0
	b _080EA246
	.align 2, 0
_080EA240: .4byte gUnknown_083DB694
_080EA244:
	movs r0, 0x1
_080EA246:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80EA1E0

	thumb_func_start sub_80EA24C
sub_80EA24C: @ 80EA24C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EA340 @ =gUnknown_083DB694
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0xF
	str r6, [sp]
	ldr r1, _080EA344 @ =0x0000fffe
	mov r8, r1
	str r1, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xD
	movs r2, 0xE
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r5, r7, r1
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r1, 0x2
	mov r9, r1
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xE
	movs r3, 0xC
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x1E
	movs r2, 0
	mov r3, r8
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	movs r6, 0x10
	str r6, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xD
	movs r2, 0xF
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0x9
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	str r6, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	mov r1, r9
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xF
	movs r3, 0xC
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x1E
	movs r2, 0x9
	mov r3, r8
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x4
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x6
	strh r0, [r1]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA340: .4byte gUnknown_083DB694
_080EA344: .4byte 0x0000fffe
	thumb_func_end sub_80EA24C

	thumb_func_start sub_80EA348
sub_80EA348: @ 80EA348
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EA49C @ =gUnknown_083DB694
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r5, 0xF
	str r5, [sp]
	movs r1, 0x2
	mov r9, r1
	str r1, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xE
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r6, r7, r1
	str r6, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	ldr r1, _080EA4A0 @ =0x0000fffe
	mov r8, r1
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xE
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r6, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0
	movs r3, 0x2
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	movs r5, 0x10
	str r5, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xF
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r6, [sp, 0x4]
	movs r1, 0
	movs r2, 0x9
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	mov r1, r8
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xF
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r6, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0x9
	movs r3, 0x2
	bl sub_80EAC30
	movs r1, 0x84
	lsls r1, 1
	adds r0, r7, r1
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	mov r1, r9
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xE
	movs r3, 0x1
	bl sub_80EABD4
	movs r1, 0xBC
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	adds r1, 0x50
	adds r6, r7, r1
	str r6, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0xE
	movs r3, 0
	bl sub_80EAC30
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r7, r1
	str r5, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x18
	movs r2, 0xE
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xC2
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r6, [sp, 0x4]
	movs r1, 0x18
	movs r2, 0xE
	mov r3, r8
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xC2
	movs r1, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA49C: .4byte gUnknown_083DB694
_080EA4A0: .4byte 0x0000fffe
	thumb_func_end sub_80EA348

	thumb_func_start sub_80EA4A4
sub_80EA4A4: @ 80EA4A4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EA598 @ =gUnknown_083DB694
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0xF
	str r6, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r1, _080EA59C @ =0x0000ffff
	mov r8, r1
	str r1, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xE
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r5, r7, r1
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r4, [sp, 0x4]
	mov r1, r8
	str r1, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xE
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	movs r1, 0x10
	mov r9, r1
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	movs r6, 0x1
	str r6, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xF
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	mov r1, r8
	str r1, [sp]
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0x9
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	mov r1, r9
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r6, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xF
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	mov r1, r8
	str r1, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0x9
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xC2
	movs r1, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA598: .4byte gUnknown_083DB694
_080EA59C: .4byte 0x0000ffff
	thumb_func_end sub_80EA4A4

	thumb_func_start sub_80EA5A0
sub_80EA5A0: @ 80EA5A0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EA6FC @ =gUnknown_083DB694
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0xF
	str r6, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	movs r1, 0x1
	mov r8, r1
	str r1, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r2, 0xA
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r5, r7, r1
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r4, [sp, 0x4]
	mov r1, r8
	str r1, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xA
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	movs r1, 0x14
	mov r9, r1
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	ldr r6, _080EA700 @ =0x0000ffff
	str r6, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xF
	movs r3, 0xD
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	mov r1, r8
	str r1, [sp]
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0x5
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	mov r1, r9
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r6, [sp, 0x10]
	movs r1, 0xC
	movs r2, 0xF
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	mov r1, r8
	str r1, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x12
	movs r2, 0x5
	movs r3, 0
	bl sub_80EAC30
	movs r1, 0x84
	lsls r1, 1
	adds r0, r7, r1
	movs r1, 0xA
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	mov r1, r8
	str r1, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xA
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xBC
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	adds r1, 0x50
	adds r5, r7, r1
	str r5, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	movs r1, 0x8C
	lsls r1, 1
	adds r0, r7, r1
	mov r1, r9
	str r1, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0x14
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xC2
	lsls r1, 1
	adds r0, r7, r1
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0x14
	movs r3, 0
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x6
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x4
	strh r0, [r1]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA6FC: .4byte gUnknown_083DB694
_080EA700: .4byte 0x0000ffff
	thumb_func_end sub_80EA5A0

	thumb_func_start sub_80EA704
sub_80EA704: @ 80EA704
	push {r4-r6,lr}
	sub sp, 0x14
	ldr r0, _080EA75C @ =gUnknown_083DB694
	ldr r6, [r0]
	adds r0, r6, 0
	adds r0, 0xC8
	movs r1, 0x14
	str r1, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r5, 0x1
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x18
	movs r2, 0xC
	movs r3, 0x19
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r6, r1
	ldr r3, _080EA760 @ =0x0000ffff
	str r4, [sp]
	movs r2, 0xD9
	lsls r2, 3
	adds r1, r6, r2
	str r1, [sp, 0x4]
	movs r1, 0x5
	movs r2, 0xA
	bl sub_80EAC30
	adds r0, r6, 0
	adds r0, 0xC2
	strh r5, [r0]
	adds r1, r6, 0
	adds r1, 0xC4
	movs r0, 0x5
	strh r0, [r1]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EA75C: .4byte gUnknown_083DB694
_080EA760: .4byte 0x0000ffff
	thumb_func_end sub_80EA704

	thumb_func_start sub_80EA764
sub_80EA764: @ 80EA764
	push {r4-r7,lr}
	sub sp, 0x14
	ldr r0, _080EA7EC @ =gUnknown_083DB694
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0x14
	str r6, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	ldr r5, _080EA7F0 @ =0x0000ffff
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x18
	movs r2, 0xC
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r2, 0xD9
	lsls r2, 3
	adds r1, r7, r2
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x1
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1E
	movs r2, 0xC
	movs r3, 0x1F
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r2, 0xE4
	lsls r2, 1
	adds r1, r7, r2
	str r1, [sp, 0x4]
	movs r1, 0x1E
	movs r2, 0xC
	adds r3, r5, 0
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x2
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x6
	strh r0, [r1]
	add sp, 0x14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA7EC: .4byte gUnknown_083DB694
_080EA7F0: .4byte 0x0000ffff
	thumb_func_end sub_80EA764

	thumb_func_start sub_80EA7F4
sub_80EA7F4: @ 80EA7F4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	ldr r0, _080EA8B4 @ =gUnknown_083DB694
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0x14
	str r6, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r5, 0x1
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x14
	movs r2, 0xA
	movs r3, 0x19
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	ldr r3, _080EA8B8 @ =0x0000ffff
	str r4, [sp]
	movs r2, 0xD9
	lsls r2, 3
	adds r2, r7
	mov r8, r2
	str r2, [sp, 0x4]
	movs r1, 0x19
	movs r2, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x1
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r2, 0xE4
	lsls r2, 1
	adds r1, r7, r2
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	str r6, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1
	movs r2, 0xA
	movs r3, 0x4
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	mov r2, r8
	str r2, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x3
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x2
	strh r0, [r1]
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA8B4: .4byte gUnknown_083DB694
_080EA8B8: .4byte 0x0000ffff
	thumb_func_end sub_80EA7F4

	thumb_func_start sub_80EA8BC
sub_80EA8BC: @ 80EA8BC
	push {r4-r6,lr}
	sub sp, 0x14
	ldr r0, _080EA944 @ =gUnknown_083DB694
	ldr r6, [r0]
	adds r0, r6, 0
	adds r0, 0xC8
	movs r5, 0x14
	str r5, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x3
	movs r2, 0xA
	movs r3, 0x4
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r6, r1
	str r4, [sp]
	movs r2, 0xD9
	lsls r2, 3
	adds r1, r6, r2
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r6, 0
	adds r0, 0xD8
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x2
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r6, r1
	str r4, [sp]
	movs r2, 0xE4
	lsls r2, 1
	adds r1, r6, r2
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	adds r1, r6, 0
	adds r1, 0xC2
	movs r0, 0x2
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1
	strh r0, [r1]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EA944: .4byte gUnknown_083DB694
	thumb_func_end sub_80EA8BC

	thumb_func_start sub_80EA948
sub_80EA948: @ 80EA948
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EAA3C @ =gUnknown_083DB694
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r6, 0x14
	str r6, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	ldr r5, _080EAA40 @ =0x0000ffff
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x2
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	adds r1, 0x80
	adds r1, r7
	mov r9, r1
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	str r6, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x3
	movs r2, 0xA
	movs r3, 0x5
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r1, r7
	mov r8, r1
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	str r6, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x1A
	movs r2, 0xA
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	movs r1, 0x1A
	movs r2, 0xA
	adds r3, r5, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	str r6, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	str r5, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x19
	movs r2, 0xA
	movs r3, 0x1A
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	movs r1, 0x1D
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x4
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x2
	strh r0, [r1]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EAA3C: .4byte gUnknown_083DB694
_080EAA40: .4byte 0x0000ffff
	thumb_func_end sub_80EA948

	thumb_func_start sub_80EAA44
sub_80EAA44: @ 80EAA44
	push {r4-r6,lr}
	sub sp, 0x14
	ldr r0, _080EAACC @ =gUnknown_083DB694
	ldr r6, [r0]
	adds r0, r6, 0
	adds r0, 0xC8
	movs r5, 0x14
	str r5, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x18
	movs r2, 0xA
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r6, r1
	str r4, [sp]
	movs r2, 0xE4
	lsls r2, 1
	adds r1, r6, r2
	str r1, [sp, 0x4]
	movs r1, 0x18
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	adds r0, r6, 0
	adds r0, 0xD8
	str r5, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	ldr r1, _080EAAD0 @ =0x0000ffff
	str r1, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0x17
	movs r2, 0xA
	movs r3, 0x18
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r6, r1
	str r4, [sp]
	movs r2, 0xD9
	lsls r2, 3
	adds r1, r6, r2
	str r1, [sp, 0x4]
	movs r1, 0x1D
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r1, r6, 0
	adds r1, 0xC2
	movs r0, 0x2
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1
	strh r0, [r1]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EAACC: .4byte gUnknown_083DB694
_080EAAD0: .4byte 0x0000ffff
	thumb_func_end sub_80EAA44

	thumb_func_start sub_80EAAD4
sub_80EAAD4: @ 80EAAD4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	ldr r0, _080EABCC @ =gUnknown_083DB694
	ldr r7, [r0]
	adds r0, r7, 0
	adds r0, 0xC8
	movs r1, 0xF
	str r1, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	movs r5, 0x1
	str r5, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	movs r1, 0xD9
	lsls r1, 3
	adds r1, r7
	mov r8, r1
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xD8
	movs r1, 0x14
	mov r9, r1
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	ldr r6, _080EABD0 @ =0x0000ffff
	str r6, [sp, 0x10]
	movs r1, 0
	movs r2, 0xF
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xAA
	lsls r1, 1
	adds r0, r7, r1
	str r5, [sp]
	mov r1, r8
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0x5
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xE8
	movs r1, 0xA
	str r1, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	str r5, [sp, 0x10]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xB0
	lsls r1, 1
	adds r0, r7, r1
	str r4, [sp]
	adds r1, 0x68
	adds r5, r7, r1
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0
	bl sub_80EAC30
	adds r0, r7, 0
	adds r0, 0xF8
	mov r1, r9
	str r1, [sp]
	str r4, [sp, 0x4]
	str r6, [sp, 0x8]
	str r4, [sp, 0xC]
	str r4, [sp, 0x10]
	movs r1, 0
	movs r2, 0x14
	movs r3, 0x1E
	bl sub_80EABD4
	movs r1, 0xB6
	lsls r1, 1
	adds r0, r7, r1
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r1, 0
	movs r2, 0x14
	movs r3, 0
	bl sub_80EAC30
	adds r1, r7, 0
	adds r1, 0xC2
	movs r0, 0x4
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x5
	strh r0, [r1]
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EABCC: .4byte gUnknown_083DB694
_080EABD0: .4byte 0x0000ffff
	thumb_func_end sub_80EAAD4

	thumb_func_start sub_80EABD4
sub_80EABD4: @ 80EABD4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r5, [sp, 0x1C]
	ldr r6, [sp, 0x20]
	ldr r4, [sp, 0x24]
	mov r9, r4
	ldr r4, [sp, 0x28]
	ldr r7, [sp, 0x2C]
	mov r8, r7
	strh r1, [r0]
	strh r3, [r0, 0x2]
	strh r2, [r0, 0x4]
	strh r5, [r0, 0x6]
	strh r6, [r0, 0x8]
	strh r4, [r0, 0xA]
	mov r1, r9
	strh r1, [r0, 0xC]
	mov r4, r8
	strh r4, [r0, 0xE]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80EABD4

	thumb_func_start sub_80EAC0C
sub_80EAC0C: @ 80EAC0C
	ldrh r1, [r0, 0x8]
	ldrh r2, [r0]
	adds r1, r2
	strh r1, [r0]
	ldrh r1, [r0, 0xA]
	ldrh r2, [r0, 0x2]
	adds r1, r2
	strh r1, [r0, 0x2]
	ldrh r1, [r0, 0xC]
	ldrh r2, [r0, 0x4]
	adds r1, r2
	strh r1, [r0, 0x4]
	ldrh r1, [r0, 0xE]
	ldrh r2, [r0, 0x6]
	adds r1, r2
	strh r1, [r0, 0x6]
	bx lr
	thumb_func_end sub_80EAC0C

	thumb_func_start sub_80EAC30
sub_80EAC30: @ 80EAC30
	push {r4,r5,lr}
	ldr r4, [sp, 0xC]
	ldr r5, [sp, 0x10]
	strh r1, [r0]
	strh r2, [r0, 0x2]
	strh r3, [r0, 0x4]
	strh r4, [r0, 0x6]
	str r5, [r0, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80EAC30

	thumb_func_start sub_80EAC48
sub_80EAC48: @ 80EAC48
	ldrh r1, [r0, 0x4]
	ldrh r2, [r0]
	adds r1, r2
	strh r1, [r0]
	ldrh r1, [r0, 0x6]
	ldrh r2, [r0, 0x2]
	adds r1, r2
	strh r1, [r0, 0x2]
	bx lr
	thumb_func_end sub_80EAC48

	thumb_func_start sub_80EAC5C
sub_80EAC5C: @ 80EAC5C
	push {r4-r6,lr}
	ldr r0, _080EACB4 @ =gUnknown_083DB694
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0xBC
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EACAC
	movs r4, 0
	adds r0, r1, 0
	adds r0, 0xC2
	ldrh r2, [r0]
	cmp r4, r2
	bcs _080EACA2
	adds r5, r1, 0
	adds r6, r0, 0
_080EAC7C:
	lsls r1, r4, 4
	adds r1, 0xC8
	adds r1, r5, r1
	lsls r2, r4, 1
	adds r2, r4
	lsls r2, 2
	movs r0, 0xA4
	lsls r0, 1
	adds r2, r0
	adds r2, r5, r2
	ldr r0, _080EACB8 @ =0x06006800
	bl sub_80EACBC
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrh r2, [r6]
	cmp r4, r2
	bcc _080EAC7C
_080EACA2:
	ldr r0, _080EACB4 @ =gUnknown_083DB694
	ldr r0, [r0]
	adds r0, 0xBC
	movs r1, 0
	strb r1, [r0]
_080EACAC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EACB4: .4byte gUnknown_083DB694
_080EACB8: .4byte 0x06006800
	thumb_func_end sub_80EAC5C

	thumb_func_start sub_80EACBC
sub_80EACBC: @ 80EACBC
	push {r4-r7,lr}
	sub sp, 0x10
	adds r7, r0, 0
	adds r3, r1, 0
	adds r4, r2, 0
	ldrh r2, [r3, 0x2]
	ldrh r0, [r3]
	subs r2, r0
	ldrh r0, [r3, 0x6]
	ldrh r1, [r3, 0x4]
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	lsls r6, r2, 16
	cmp r6, 0
	ble _080EACFE
	lsls r5, r0, 16
	cmp r5, 0
	ble _080EACFE
	ldrh r1, [r3]
	ldrh r2, [r3, 0x4]
	ldr r3, [r4, 0x8]
	ldrh r0, [r4]
	str r0, [sp]
	ldrh r0, [r4, 0x2]
	str r0, [sp, 0x4]
	lsrs r0, r6, 16
	str r0, [sp, 0x8]
	lsrs r0, r5, 16
	str r0, [sp, 0xC]
	adds r0, r7, 0
	bl sub_809D104
_080EACFE:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80EACBC

	thumb_func_start sub_80EAD08
sub_80EAD08: @ 80EAD08
	push {r4,r5,lr}
	ldr r0, _080EAD58 @ =gUnknown_03004DC0
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _080EAD5C @ =gUnknown_03004DE0
	adds r4, r0, r1
	adds r4, 0xB0
	ldr r0, _080EAD60 @ =gUnknown_083DB694
	ldr r1, [r0]
	movs r0, 0xDD
	lsls r0, 1
	adds r1, r0
	ldrh r0, [r1]
	adds r2, r0, 0
	subs r2, 0x58
	movs r0, 0xFF
	ands r2, r0
	movs r3, 0
	movs r5, 0xFF
_080EAD32:
	ldrh r0, [r1]
	adds r0, r3
	cmp r0, 0x80
	bne _080EAD42
	negs r0, r3
	adds r2, r0, 0
	subs r2, 0x58
	ands r2, r5
_080EAD42:
	strh r2, [r4]
	adds r4, 0x2
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3F
	bls _080EAD32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EAD58: .4byte gUnknown_03004DC0
_080EAD5C: .4byte gUnknown_03004DE0
_080EAD60: .4byte gUnknown_083DB694
	thumb_func_end sub_80EAD08

	thumb_func_start sub_80EAD64
sub_80EAD64: @ 80EAD64
	push {lr}
	lsls r1, 24
	ldr r2, _080EAD78 @ =gEasyChatGroupNames
	lsrs r1, 22
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	pop {r1}
	bx r1
	.align 2, 0
_080EAD78: .4byte gEasyChatGroupNames
	thumb_func_end sub_80EAD64

	thumb_func_start sub_80EAD7C
sub_80EAD7C: @ 80EAD7C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x14
	beq _080EADA2
	cmp r0, 0x14
	bgt _080EAD9C
	cmp r0, 0x11
	blt _080EADBA
	ldr r0, _080EAD98 @ =0x00000804
	bl FlagGet
	b _080EADB4
	.align 2, 0
_080EAD98: .4byte 0x00000804
_080EAD9C:
	cmp r1, 0x15
	beq _080EADB0
	b _080EADBA
_080EADA2:
	ldr r0, _080EADAC @ =0x00000806
	bl FlagGet
	b _080EADB4
	.align 2, 0
_080EADAC: .4byte 0x00000806
_080EADB0:
	bl sub_80EB9C8
_080EADB4:
	lsls r0, 24
	lsrs r0, 24
	b _080EADBC
_080EADBA:
	movs r0, 0x1
_080EADBC:
	pop {r1}
	bx r1
	thumb_func_end sub_80EAD7C

	thumb_func_start sub_80EADC0
sub_80EADC0: @ 80EADC0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 16
	lsrs r3, r1, 16
	cmp r2, 0x15
	bhi _080EAE82
	lsls r0, r2, 2
	ldr r1, _080EADD8 @ =_080EADDC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EADD8: .4byte _080EADDC
	.align 2, 0
_080EADDC:
	.4byte _080EAE50
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE82
	.4byte _080EAE62
	.4byte _080EAE62
	.4byte _080EAE62
	.4byte _080EAE34
	.4byte _080EAE78
_080EAE34:
	ldr r0, _080EAE4C @ =gUnknown_083DB694
	ldr r0, [r0]
	adds r0, r2
	adds r0, 0x67
	ldrb r0, [r0]
	cmp r0, 0
	beq _080EAE70
	lsls r0, r3, 24
	lsrs r0, 24
	bl sub_80EB868
	b _080EAE7C
	.align 2, 0
_080EAE4C: .4byte gUnknown_083DB694
_080EAE50:
	adds r0, r3, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	bl GetSetPokedexFlag
	b _080EAE7C
_080EAE62:
	ldr r0, _080EAE74 @ =gUnknown_083DB694
	ldr r0, [r0]
	adds r0, r2
	adds r0, 0x67
	ldrb r0, [r0]
	cmp r0, 0
	bne _080EAE82
_080EAE70:
	movs r0, 0
	b _080EAE84
	.align 2, 0
_080EAE74: .4byte gUnknown_083DB694
_080EAE78:
	bl sub_80EB9C8
_080EAE7C:
	lsls r0, 24
	lsrs r0, 24
	b _080EAE84
_080EAE82:
	movs r0, 0x1
_080EAE84:
	pop {r1}
	bx r1
	thumb_func_end sub_80EADC0

	thumb_func_start sub_80EAE88
sub_80EAE88: @ 80EAE88
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080EAEA6
	cmp r4, 0x14
	beq _080EAEB2
	adds r0, r4, 0
	bl sub_80EAD7C
	lsls r0, 24
	cmp r0, 0
	bne _080EAEBC
	movs r0, 0
	b _080EAEC2
_080EAEA6:
	movs r0, 0
	bl GetHoennPokedexCount
	lsls r0, 16
	lsrs r0, 16
	b _080EAEC2
_080EAEB2:
	bl sub_80EB8C0
	lsls r0, 24
	lsrs r0, 24
	b _080EAEC2
_080EAEBC:
	ldr r0, _080EAEC8 @ =gEasyChatGroupSizes
	adds r0, r4, r0
	ldrb r0, [r0]
_080EAEC2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080EAEC8: .4byte gEasyChatGroupSizes
	thumb_func_end sub_80EAE88

	thumb_func_start sub_80EAECC
sub_80EAECC: @ 80EAECC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	movs r0, 0
	mov r8, r0
	ldr r1, _080EAF10 @ =gUnknown_083DB694
	ldr r0, [r1]
	ldr r3, _080EAF14 @ =0x00004142
	adds r3, r0, r3
	str r3, [sp, 0x4]
_080EAEE6:
	ldr r1, _080EAF18 @ =gEasyChatWordsByLetter
	mov r7, r8
	lsls r2, r7, 1
	adds r0, r2, r1
	ldrh r4, [r0]
	mov r3, r8
	adds r3, 0x1
	lsls r0, r3, 1
	adds r0, r1
	ldrh r0, [r0]
	str r0, [sp]
	ldr r0, [sp, 0x4]
	adds r1, r0, r2
	movs r0, 0
	strh r0, [r1]
	mov r9, r0
	adds r6, r4, 0
	mov r10, r2
	str r3, [sp, 0x8]
	b _080EB00C
	.align 2, 0
_080EAF10: .4byte gUnknown_083DB694
_080EAF14: .4byte 0x00004142
_080EAF18: .4byte gEasyChatWordsByLetter
_080EAF1C:
	ldr r2, _080EAFB0 @ =gEasyChatWordsAlphabetized
	adds r0, r6, 0
	adds r1, r0, 0x1
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	adds r4, r1, 0
	ldr r0, _080EAFB4 @ =0x0000feff
	cmp r1, r0
	bls _080EAFCC
	movs r0, 0xFF
	ands r1, r0
	movs r7, 0
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r3, _080EAFB8 @ =0x0000ffff
	cmp r5, r3
	beq _080EB00C
	mov r1, r8
	lsls r0, r1, 8
	subs r0, r1
	lsls r3, r0, 1
_080EAF4E:
	adds r1, r6, 0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 1
	ldr r0, _080EAFB0 @ =gEasyChatWordsAlphabetized
	adds r1, r0
	ldrh r4, [r1]
	lsrs r0, r4, 9
	ldr r1, _080EAFBC @ =0x000001ff
	adds r2, r1, 0
	adds r1, r4, 0
	ands r1, r2
	str r3, [sp, 0xC]
	bl sub_80EADC0
	lsls r0, 24
	ldr r3, [sp, 0xC]
	cmp r0, 0
	beq _080EAFA2
	cmp r7, 0
	bne _080EAFA2
	ldr r7, _080EAFC0 @ =gUnknown_083DB694
	ldr r2, [r7]
	mov r1, r9
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	lsls r1, 1
	adds r1, r3
	ldr r7, _080EAFC4 @ =0x00000b78
	adds r0, r2, r7
	adds r0, r1
	strh r4, [r0]
	ldr r0, _080EAFC8 @ =0x00004142
	adds r2, r0
	add r2, r10
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	movs r7, 0x1
_080EAFA2:
	subs r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _080EAFB8 @ =0x0000ffff
	cmp r5, r1
	bne _080EAF4E
	b _080EB00C
	.align 2, 0
_080EAFB0: .4byte gEasyChatWordsAlphabetized
_080EAFB4: .4byte 0x0000feff
_080EAFB8: .4byte 0x0000ffff
_080EAFBC: .4byte 0x000001ff
_080EAFC0: .4byte gUnknown_083DB694
_080EAFC4: .4byte 0x00000b78
_080EAFC8: .4byte 0x00004142
_080EAFCC:
	lsrs r0, r4, 9
	ldr r3, _080EB030 @ =0x000001ff
	adds r2, r3, 0
	adds r1, r4, 0
	ands r1, r2
	bl sub_80EADC0
	lsls r0, 24
	cmp r0, 0
	beq _080EB00C
	ldr r7, _080EB034 @ =gUnknown_083DB694
	ldr r2, [r7]
	mov r1, r9
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	mov r3, r8
	lsls r0, r3, 8
	subs r0, r3
	adds r0, r1
	lsls r0, 1
	ldr r7, _080EB038 @ =0x00000b78
	adds r1, r2, r7
	adds r1, r0
	strh r4, [r1]
	ldr r0, _080EB03C @ =0x00004142
	adds r2, r0
	add r2, r10
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_080EB00C:
	ldr r1, [sp]
	cmp r6, r1
	bcc _080EAF1C
	ldr r3, [sp, 0x8]
	lsls r0, r3, 16
	lsrs r0, 16
	mov r8, r0
	cmp r0, 0x1A
	bhi _080EB020
	b _080EAEE6
_080EB020:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EB030: .4byte 0x000001ff
_080EB034: .4byte gUnknown_083DB694
_080EB038: .4byte 0x00000b78
_080EB03C: .4byte 0x00004142
	thumb_func_end sub_80EAECC

	thumb_func_start sub_80EB040
sub_80EB040: @ 80EB040
	push {r4-r6,lr}
	movs r3, 0
_080EB044:
	adds r6, r3, 0x1
	cmp r3, 0
	beq _080EB094
	cmp r3, 0x15
	beq _080EB094
	cmp r3, 0x12
	beq _080EB094
	cmp r3, 0x13
	beq _080EB094
	ldr r0, _080EB0A4 @ =gEasyChatGroupWords
	lsls r1, r3, 2
	adds r1, r0
	ldr r2, [r1]
	movs r4, 0
	ldrb r0, [r2]
	cmp r0, 0xFF
	beq _080EB094
	ldr r0, _080EB0A8 @ =gUnknown_083DB694
	ldr r0, [r0]
	ldr r1, _080EB0AC @ =0x000041a4
	adds r5, r0, r1
_080EB06E:
	lsls r0, r4, 2
	lsls r1, r3, 10
	adds r0, r1
	adds r0, r5, r0
	str r2, [r0]
	ldrb r0, [r2]
	adds r1, r4, 0x1
	cmp r0, 0xFF
	beq _080EB088
_080EB080:
	adds r2, 0x1
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _080EB080
_080EB088:
	adds r2, 0x1
	lsls r0, r1, 16
	lsrs r4, r0, 16
	ldrb r0, [r2]
	cmp r0, 0xFF
	bne _080EB06E
_080EB094:
	lsls r0, r6, 16
	lsrs r3, r0, 16
	cmp r3, 0x15
	bls _080EB044
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EB0A4: .4byte gEasyChatGroupWords
_080EB0A8: .4byte gUnknown_083DB694
_080EB0AC: .4byte 0x000041a4
	thumb_func_end sub_80EB040

	thumb_func_start sub_80EB0B0
sub_80EB0B0: @ 80EB0B0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r3, _080EB184 @ =gUnknown_083DB694
	ldr r4, [r3]
	adds r0, r4, 0
	adds r0, 0x26
	ldrb r5, [r0]
	cmp r5, 0
	bne _080EB19C
	movs r0, 0xDC
	lsls r0, 1
	adds r2, r4, r0
	ldrb r6, [r2]
	lsls r1, r6, 1
	ldr r7, _080EB188 @ =0x00004178
	adds r0, r4, r7
	adds r0, r1
	strh r5, [r0]
	movs r7, 0
	movs r0, 0
	mov r9, r0
	ldr r1, _080EB18C @ =gEasyChatGroupOrders
	lsls r0, r6, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [sp]
	movs r1, 0
	mov r8, r1
	ldr r1, _080EB190 @ =gEasyChatGroupSizes
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	cmp r8, r0
	bcc _080EB0FE
	b _080EB1FA
_080EB0FE:
	movs r2, 0xDC
	lsls r2, 1
	adds r2, r4, r2
	str r2, [sp, 0x4]
	lsls r5, r6, 24
	mov r10, r5
_080EB10A:
	mov r1, r8
	lsls r0, r1, 1
	ldr r2, [sp]
	adds r5, r0, r2
	ldrh r1, [r5]
	mov r2, r10
	lsrs r0, r2, 24
	bl sub_80EADC0
	lsls r0, 24
	cmp r0, 0
	beq _080EB16A
	ldr r0, _080EB184 @ =gUnknown_083DB694
	ldr r3, [r0]
	lsls r1, r7, 1
	mov r2, r9
	lsls r0, r2, 2
	adds r1, r0
	ldr r0, _080EB194 @ =0x00009a2a
	adds r4, r3, r0
	adds r4, r1
	movs r0, 0x7F
	ands r0, r6
	lsls r0, 9
	ldrh r1, [r5]
	ldr r5, _080EB198 @ =0x000001ff
	adds r2, r5, 0
	ands r1, r2
	orrs r0, r1
	strh r0, [r4]
	lsls r0, r6, 1
	ldr r1, _080EB188 @ =0x00004178
	adds r3, r1
	adds r3, r0
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x1
	bls _080EB16A
	movs r7, 0
	mov r0, r9
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
_080EB16A:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r1, _080EB190 @ =gEasyChatGroupSizes
	ldr r2, [sp, 0x4]
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	cmp r8, r0
	bcc _080EB10A
	b _080EB1FA
	.align 2, 0
_080EB184: .4byte gUnknown_083DB694
_080EB188: .4byte 0x00004178
_080EB18C: .4byte gEasyChatGroupOrders
_080EB190: .4byte gEasyChatGroupSizes
_080EB194: .4byte 0x00009a2a
_080EB198: .4byte 0x000001ff
_080EB19C:
	movs r5, 0xDC
	lsls r5, 1
	adds r0, r4, r5
	ldrb r2, [r0]
	movs r3, 0
	movs r6, 0
	movs r5, 0
	lsls r1, r2, 1
	ldr r7, _080EB20C @ =0x00004142
	adds r0, r4, r7
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r5, r0
	bcs _080EB1FA
	ldr r7, _080EB210 @ =0x00009a2a
	adds r7, r4
	mov r8, r7
	lsls r0, r2, 8
	subs r0, r2
	lsls r7, r0, 1
	ldr r0, _080EB214 @ =0x00000b78
	adds r2, r4, r0
	adds r4, r1, 0
_080EB1CA:
	lsls r1, r3, 1
	lsls r0, r6, 2
	adds r1, r0
	add r1, r8
	lsls r0, r5, 1
	adds r0, r7
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x1
	bls _080EB1EE
	movs r3, 0
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_080EB1EE:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r1, [r4]
	cmp r5, r1
	bcc _080EB1CA
_080EB1FA:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EB20C: .4byte 0x00004142
_080EB210: .4byte 0x00009a2a
_080EB214: .4byte 0x00000b78
	thumb_func_end sub_80EB0B0

	thumb_func_start sub_80EB218
sub_80EB218: @ 80EB218
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	lsls r6, r1, 16
	lsrs r4, r6, 16
	adds r7, r4, 0
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	adds r0, r4, 0
	bl sub_80EB37C
	lsls r0, 24
	cmp r0, 0
	beq _080EB240
	ldr r1, _080EB23C @ =gOtherText_ThreeQuestions
	b _080EB2A2
	.align 2, 0
_080EB23C: .4byte gOtherText_ThreeQuestions
_080EB240:
	ldr r0, _080EB250 @ =0x0000ffff
	cmp r4, r0
	bne _080EB254
	adds r1, r5, 0
	movs r0, 0xFF
	strb r0, [r1]
	b _080EB2AA
	.align 2, 0
_080EB250: .4byte 0x0000ffff
_080EB254:
	lsrs r2, r6, 25
	ldr r1, _080EB268 @ =0x000001ff
	ands r1, r7
	cmp r2, 0x13
	bgt _080EB26C
	cmp r2, 0x12
	bge _080EB280
	cmp r2, 0
	beq _080EB270
	b _080EB290
	.align 2, 0
_080EB268: .4byte 0x000001ff
_080EB26C:
	cmp r2, 0x15
	bne _080EB290
_080EB270:
	movs r0, 0xB
	muls r1, r0
	ldr r0, _080EB27C @ =gSpeciesNames
	adds r1, r0
	b _080EB2A2
	.align 2, 0
_080EB27C: .4byte gSpeciesNames
_080EB280:
	movs r0, 0xD
	muls r1, r0
	ldr r0, _080EB28C @ =gMoveNames
	adds r1, r0
	b _080EB2A2
	.align 2, 0
_080EB28C: .4byte gMoveNames
_080EB290:
	ldr r0, _080EB2CC @ =gUnknown_083DB694
	ldr r0, [r0]
	lsls r1, 2
	lsls r2, 10
	adds r1, r2
	ldr r2, _080EB2D0 @ =0x000041a4
	adds r0, r2
	adds r0, r1
	ldr r1, [r0]
_080EB2A2:
	adds r0, r5, 0
	bl StringCopy
	adds r1, r0, 0
_080EB2AA:
	movs r0, 0xFC
	strb r0, [r1]
	movs r0, 0x13
	strb r0, [r1, 0x1]
	mov r2, r8
	lsls r0, r2, 3
	strb r0, [r1, 0x2]
	adds r1, 0x3
	movs r0, 0xFF
	strb r0, [r1]
	adds r0, r1, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080EB2CC: .4byte gUnknown_083DB694
_080EB2D0: .4byte 0x000041a4
	thumb_func_end sub_80EB218

	thumb_func_start sub_80EB2D4
sub_80EB2D4: @ 80EB2D4
	push {r4-r6,lr}
	lsls r5, r0, 16
	lsrs r4, r5, 16
	adds r6, r4, 0
	adds r0, r4, 0
	bl sub_80EB37C
	lsls r0, 24
	cmp r0, 0
	beq _080EB2F8
	ldr r0, _080EB2F4 @ =gOtherText_ThreeQuestions
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	b _080EB374
	.align 2, 0
_080EB2F4: .4byte gOtherText_ThreeQuestions
_080EB2F8:
	ldr r0, _080EB304 @ =0x0000ffff
	cmp r4, r0
	bne _080EB308
	movs r0, 0
	b _080EB374
	.align 2, 0
_080EB304: .4byte 0x0000ffff
_080EB308:
	lsrs r2, r5, 25
	ldr r1, _080EB31C @ =0x000001ff
	ands r1, r6
	cmp r2, 0x13
	bgt _080EB320
	cmp r2, 0x12
	bge _080EB334
	cmp r2, 0
	beq _080EB324
	b _080EB344
	.align 2, 0
_080EB31C: .4byte 0x000001ff
_080EB320:
	cmp r2, 0x15
	bne _080EB344
_080EB324:
	movs r0, 0xB
	muls r1, r0
	ldr r0, _080EB330 @ =gSpeciesNames
	adds r1, r0
	b _080EB356
	.align 2, 0
_080EB330: .4byte gSpeciesNames
_080EB334:
	movs r0, 0xD
	muls r1, r0
	ldr r0, _080EB340 @ =gMoveNames
	adds r1, r0
	b _080EB356
	.align 2, 0
_080EB340: .4byte gMoveNames
_080EB344:
	ldr r0, _080EB35C @ =gUnknown_083DB694
	ldr r0, [r0]
	lsls r1, 2
	lsls r2, 10
	adds r1, r2
	ldr r2, _080EB360 @ =0x000041a4
	adds r0, r2
	adds r0, r1
	ldr r1, [r0]
_080EB356:
	movs r2, 0
	b _080EB36C
	.align 2, 0
_080EB35C: .4byte gUnknown_083DB694
_080EB360: .4byte 0x000041a4
_080EB364:
	adds r1, 0x1
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
_080EB36C:
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _080EB364
	adds r0, r2, 0
_080EB374:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80EB2D4

	thumb_func_start sub_80EB37C
sub_80EB37C: @ 80EB37C
	push {r4,r5,lr}
	lsls r1, r0, 16
	lsrs r3, r1, 16
	ldr r0, _080EB3A0 @ =0x0000ffff
	cmp r3, r0
	beq _080EB3EA
	lsrs r2, r1, 25
	ldr r5, _080EB3A4 @ =0x000001ff
	ands r5, r3
	cmp r2, 0x15
	bhi _080EB3F4
	cmp r2, 0x13
	bgt _080EB3A8
	cmp r2, 0x12
	bge _080EB3AC
	cmp r2, 0
	beq _080EB3AC
	b _080EB3E0
	.align 2, 0
_080EB3A0: .4byte 0x0000ffff
_080EB3A4: .4byte 0x000001ff
_080EB3A8:
	cmp r2, 0x15
	bne _080EB3E0
_080EB3AC:
	ldr r0, _080EB3D8 @ =gEasyChatGroupWords
	lsls r1, r2, 2
	adds r1, r0
	ldr r4, [r1]
	movs r3, 0
	ldr r0, _080EB3DC @ =gEasyChatGroupSizes
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r3, r0
	bcs _080EB3F4
	adds r1, r0, 0
_080EB3C2:
	lsls r0, r3, 1
	adds r0, r4
	ldrh r0, [r0]
	cmp r5, r0
	beq _080EB3EA
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	bcc _080EB3C2
	b _080EB3F4
	.align 2, 0
_080EB3D8: .4byte gEasyChatGroupWords
_080EB3DC: .4byte gEasyChatGroupSizes
_080EB3E0:
	ldr r0, _080EB3F0 @ =gEasyChatGroupSizes
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r5, r0
	bcs _080EB3F4
_080EB3EA:
	movs r0, 0
	b _080EB3F6
	.align 2, 0
_080EB3F0: .4byte gEasyChatGroupSizes
_080EB3F4:
	movs r0, 0x1
_080EB3F6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80EB37C

	.align 2, 0 @ Don't pad with nop.
