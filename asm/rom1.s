	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start SyncBgVisibilityAndMode
SyncBgVisibilityAndMode: @ 80029AC
	ldrb r2, [r0]
	ldr r1, _080029DC
	lsls r2, 2
	adds r1, r2, r1
	ldr r1, [r1]
	movs r3, 0
	strh r3, [r1]
	ldr r1, _080029E0
	adds r1, r2, r1
	ldr r1, [r1]
	strh r3, [r1]
	ldr r1, _080029E4
	adds r2, r1
	ldr r3, [r2]
	ldrb r2, [r0, 0x3]
	ldrb r1, [r0, 0x2]
	lsls r1, 8
	orrs r2, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 2
	orrs r2, r0
	strh r2, [r3]
	bx lr
	.align 2, 0
_080029DC: .4byte gUnknown_081E29B8
_080029E0: .4byte gUnknown_081E29C8
_080029E4: .4byte gUnknown_081E29A8
	thumb_func_end SyncBgVisibilityAndMode

	thumb_func_start sub_80029E8
sub_80029E8: @ 80029E8
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	movs r5, 0
	str r5, [sp]
	ldr r1, [r4, 0x10]
	ldr r2, _08002A14
	mov r0, sp
	bl CpuFastSet
	ldr r1, [r4, 0x14]
	cmp r1, 0
	beq _08002A0C
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	ldr r2, _08002A18
	bl CpuFastSet
_08002A0C:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002A14: .4byte 0x01000008
_08002A18: .4byte 0x01000200
	thumb_func_end sub_80029E8

	thumb_func_start sub_8002A1C
sub_8002A1C: @ 8002A1C
	push {lr}
	ldr r2, _08002A30
	ldrb r1, [r0, 0x4]
	lsls r1, 4
	adds r0, r2, 0
	movs r2, 0x20
	bl gpu_pal_apply
	pop {r0}
	bx r0
	.align 2, 0
_08002A30: .4byte gUnknown_081E66B2
	thumb_func_end sub_8002A1C

	thumb_func_start ShowBg
ShowBg: @ 8002A34
	push {r4,lr}
	adds r4, r0, 0
	bl SyncBgVisibilityAndMode
	adds r0, r4, 0
	bl sub_80029E8
	adds r0, r4, 0
	bl sub_8002A1C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ShowBg

	thumb_func_start sub_8002A50
sub_8002A50: @ 8002A50
	push {r4,lr}
	adds r2, r0, 0
	lsls r1, 16
	lsrs r3, r1, 16
	strh r3, [r2, 0x1A]
	movs r4, 0
	ldr r0, [r2, 0x2C]
	ldrb r1, [r0, 0x9]
	cmp r1, 0x1
	beq _08002A72
	cmp r1, 0x2
	bne _08002ACE
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_8002AD8
	b _08002ACA
_08002A72:
	ldrb r0, [r0, 0x8]
	cmp r0, 0x6
	bhi _08002ACE
	lsls r0, 2
	ldr r1, _08002A84
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08002A84: .4byte _08002A88
	.align 2, 0
_08002A88:
	.4byte _08002AA4
	.4byte _08002AAE
	.4byte _08002AAE
	.4byte _08002AA4
	.4byte _08002AB8
	.4byte _08002AB8
	.4byte _08002AC2
_08002AA4:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_8002B2C
	b _08002ACA
_08002AAE:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_8002B58
	b _08002ACA
_08002AB8:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_8002B8C
	b _08002ACA
_08002AC2:
	adds r0, r2, 0
	adds r1, r3, 0
	bl sub_8002BC8
_08002ACA:
	lsls r0, 16
	lsrs r4, r0, 16
_08002ACE:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8002A50

	thumb_func_start sub_8002AD8
sub_8002AD8: @ 8002AD8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r2, 0
	strh r1, [r4, 0x1A]
	movs r0, 0x2
	strh r0, [r4, 0x1C]
	ldrh r0, [r4, 0x1A]
	lsls r0, 5
	ldr r5, [r4, 0x24]
	adds r5, r0
	str r2, [sp]
	ldr r2, _08002B24
	mov r0, sp
	adds r1, r5, 0
	bl CpuFastSet
	ldr r0, _08002B28
	adds r5, 0x20
	ldr r1, [r4, 0x2C]
	ldrb r2, [r1, 0x5]
	ldrb r3, [r1, 0x6]
	adds r1, r5, 0
	bl sub_8003B30
	ldrh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1A]
	adds r0, r1
	ldrb r2, [r4, 0x9]
	ldrb r1, [r4, 0xA]
	muls r1, r2
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08002B24: .4byte 0x01000008
_08002B28: .4byte gUnknown_081E66D2
	thumb_func_end sub_8002AD8

	thumb_func_start sub_8002B2C
sub_8002B2C: @ 8002B2C
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 11
	ldr r0, [r6, 0x24]
	adds r5, r0, r1
	movs r4, 0
_08002B3A:
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8003954
	adds r5, 0x40
	adds r4, 0x1
	cmp r4, 0xFF
	ble _08002B3A
	lsls r0, r4, 17
	lsrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8002B2C

	thumb_func_start sub_8002B58
sub_8002B58: @ 8002B58
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 11
	ldr r0, [r6, 0x24]
	adds r5, r0, r1
	movs r4, 0
_08002B66:
	lsls r0, r4, 3
	ldr r1, _08002B88
	adds r0, r1
	ldrb r2, [r6, 0x3]
	ldrb r3, [r6, 0x4]
	adds r1, r5, 0
	bl sub_8003B30
	adds r5, 0x20
	adds r4, 0x1
	cmp r4, 0xFF
	ble _08002B66
	lsls r0, r4, 16
	lsrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08002B88: .4byte gUnknown_081E39F0
	thumb_func_end sub_8002B58

	thumb_func_start sub_8002B8C
sub_8002B8C: @ 8002B8C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 11
	ldr r0, [r4, 0x24]
	adds r6, r0, r1
	movs r5, 0
_08002B9C:
	lsls r0, r5, 5
	ldr r1, _08002BC4
	adds r0, r1
	ldrb r2, [r4, 0x3]
	ldrb r3, [r4, 0x5]
	ldrb r1, [r4, 0x4]
	str r1, [sp]
	adds r1, r6, 0
	bl sub_8003BCC
	adds r6, 0x20
	adds r5, 0x1
	cmp r5, 0xFF
	ble _08002B9C
	lsls r0, r5, 16
	lsrs r0, 16
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08002BC4: .4byte gUnknown_08EA6BC4
	thumb_func_end sub_8002B8C

	thumb_func_start sub_8002BC8
sub_8002BC8: @ 8002BC8
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 11
	ldr r0, [r6, 0x24]
	adds r5, r0, r1
	movs r4, 0
_08002BD6:
	lsls r0, r4, 3
	ldr r1, _08002BF8
	adds r0, r1
	ldrb r2, [r6, 0x3]
	ldrb r3, [r6, 0x4]
	adds r1, r5, 0
	bl sub_8003B30
	adds r5, 0x20
	adds r4, 0x1
	cmp r4, 0xFF
	ble _08002BD6
	lsls r0, r4, 16
	lsrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08002BF8: .4byte gUnknown_081E58F0
	thumb_func_end sub_8002BC8

	thumb_func_start sub_8002BFC
sub_8002BFC: @ 8002BFC
	push {r4,lr}
	adds r2, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r0, _08002C30
	str r2, [r0]
	ldr r1, _08002C34
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08002C38
	strh r4, [r0]
	strh r4, [r2, 0x1A]
	movs r0, 0
	ldr r3, [r2, 0x2C]
	ldrb r1, [r3, 0x9]
	cmp r1, 0x1
	beq _08002C3C
	cmp r1, 0x2
	bne _08002C4C
	adds r0, r2, 0
	adds r1, r4, 0
	bl sub_8002AD8
	lsls r0, 16
	lsrs r0, 16
	b _08002C4C
	.align 2, 0
_08002C30: .4byte 0x03000320
_08002C34: .4byte 0x03000326
_08002C38: .4byte 0x03000324
_08002C3C:
	movs r0, 0x80
	lsls r0, 1
	ldrb r1, [r3, 0x8]
	cmp r1, 0
	beq _08002C4A
	cmp r1, 0x3
	bne _08002C4C
_08002C4A:
	lsls r0, 1
_08002C4C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8002BFC

	thumb_func_start sub_8002C54
sub_8002C54: @ 8002C54
	push {r4,r5,lr}
	movs r5, 0x1
	ldr r0, _08002C6C
	ldr r0, [r0]
	ldr r0, [r0, 0x2C]
	ldrb r0, [r0, 0x9]
	cmp r0, 0x1
	bne _08002CA2
	ldr r0, _08002C70
	ldrh r4, [r0]
	adds r0, r4, 0
	b _08002C8A
	.align 2, 0
_08002C6C: .4byte 0x03000320
_08002C70: .4byte 0x03000326
_08002C74:
	ldr r0, _08002CAC
	ldr r0, [r0]
	ldr r1, _08002CB0
	ldrh r1, [r1]
	lsls r2, r4, 24
	lsrs r2, 24
	bl sub_8002CB8
	adds r4, 0x1
	ldr r0, _08002CB4
	ldrh r0, [r0]
_08002C8A:
	adds r0, 0x10
	cmp r4, r0
	blt _08002C74
	ldr r1, _08002CB4
	ldrh r0, [r1]
	adds r0, 0x10
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xFF
	bhi _08002CA2
	movs r5, 0
_08002CA2:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08002CAC: .4byte 0x03000320
_08002CB0: .4byte 0x03000324
_08002CB4: .4byte 0x03000326
	thumb_func_end sub_8002C54

	thumb_func_start sub_8002CB8
sub_8002CB8: @ 8002CB8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 24
	lsrs r2, 24
	ldr r0, [r4, 0x2C]
	ldrb r0, [r0, 0x8]
	cmp r0, 0x5
	bhi _08002D44
	lsls r0, 2
	ldr r1, _08002CD8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08002CD8: .4byte _08002CDC
	.align 2, 0
_08002CDC:
	.4byte _08002CF4
	.4byte _08002D0A
	.4byte _08002D0A
	.4byte _08002CF4
	.4byte _08002D28
	.4byte _08002D28
_08002CF4:
	lsls r0, r3, 5
	ldr r1, [r4, 0x24]
	adds r1, r0
	lsls r0, r2, 6
	adds r5, r1, r0
	adds r0, r4, 0
	adds r1, r2, 0
	adds r2, r5, 0
	bl sub_8003954
	b _08002D44
_08002D0A:
	adds r0, r2, r3
	lsls r0, 5
	ldr r1, [r4, 0x24]
	adds r5, r1, r0
	lsls r0, r2, 3
	ldr r1, _08002D24
	adds r0, r1
	ldrb r2, [r4, 0x3]
	ldrb r3, [r4, 0x4]
	adds r1, r5, 0
	bl sub_8003B30
	b _08002D44
	.align 2, 0
_08002D24: .4byte gUnknown_081E39F0
_08002D28:
	adds r0, r2, r3
	lsls r0, 5
	ldr r1, [r4, 0x24]
	adds r5, r1, r0
	lsls r0, r2, 5
	ldr r1, _08002D4C
	adds r0, r1
	ldrb r2, [r4, 0x3]
	ldrb r3, [r4, 0x5]
	ldrb r1, [r4, 0x4]
	str r1, [sp]
	adds r1, r5, 0
	bl sub_8003BCC
_08002D44:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002D4C: .4byte gUnknown_08EA6BC4
	thumb_func_end sub_8002CB8

	thumb_func_start nullsub_4
nullsub_4: @ 8002D50
	bx lr
	thumb_func_end nullsub_4

	thumb_func_start sub_8002D54
sub_8002D54: @ 8002D54
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r1, r4, 0
	ldr r0, _08002DBC
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	str r5, [r4, 0x2C]
	ldrb r0, [r5, 0x9]
	strb r0, [r4]
	ldrb r0, [r5, 0xA]
	strb r0, [r4, 0xE]
	ldrb r0, [r5, 0x8]
	strb r0, [r4, 0x1]
	ldrb r0, [r5, 0x4]
	strb r0, [r4, 0x6]
	ldrb r0, [r5, 0xB]
	strb r0, [r4, 0x7]
	ldrb r0, [r5, 0xC]
	strb r0, [r4, 0x8]
	ldrb r0, [r5, 0xD]
	strb r0, [r4, 0x9]
	ldrb r0, [r5, 0xE]
	strb r0, [r4, 0xA]
	ldr r0, [r5, 0x10]
	str r0, [r4, 0x24]
	ldr r0, [r5, 0x14]
	str r0, [r4, 0x28]
	adds r0, r4, 0
	bl sub_8003F3C
	ldrb r1, [r5, 0x6]
	adds r0, r4, 0
	bl sub_8003F60
	ldrb r1, [r5, 0x7]
	adds r0, r4, 0
	bl sub_8003F80
	ldrb r1, [r5, 0x5]
	adds r0, r4, 0
	bl sub_8003F90
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08002DBC: .4byte gUnknown_081E6AA4
	thumb_func_end sub_8002D54

	thumb_func_start CreateTextRenderer
CreateTextRenderer: @ 8002DC0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	ldr r0, [sp, 0x14]
	lsls r0, 24
	mov r8, r0
	ldr r5, [r4, 0x2C]
	ldrb r0, [r5, 0x9]
	movs r6, 0
	strb r0, [r4]
	ldrb r0, [r5, 0x8]
	strb r0, [r4, 0x1]
	movs r0, 0x2
	strb r0, [r4, 0x2]
	ldrb r0, [r5, 0x4]
	strb r0, [r4, 0x6]
	strb r6, [r4, 0xB]
	strb r6, [r4, 0xC]
	strb r6, [r4, 0xD]
	ldrb r0, [r5, 0xA]
	strb r0, [r4, 0xE]
	strb r6, [r4, 0xF]
	ldrb r0, [r5, 0xB]
	strb r0, [r4, 0x7]
	ldrb r0, [r5, 0xC]
	strb r0, [r4, 0x8]
	ldrb r0, [r5, 0xD]
	strb r0, [r4, 0x9]
	ldrb r0, [r5, 0xE]
	strb r0, [r4, 0xA]
	str r1, [r4, 0x20]
	movs r0, 0
	strh r6, [r4, 0x1E]
	strh r2, [r4, 0x1A]
	strh r6, [r4, 0x1C]
	lsls r3, 3
	strb r3, [r4, 0x12]
	strb r0, [r4, 0x10]
	mov r1, r8
	lsrs r1, 21
	strh r1, [r4, 0x14]
	strb r0, [r4, 0x11]
	movs r0, 0x1
	strh r0, [r4, 0x16]
	strh r6, [r4, 0x18]
	ldr r0, [r5, 0x10]
	str r0, [r4, 0x24]
	ldr r0, [r5, 0x14]
	str r0, [r4, 0x28]
	adds r0, r4, 0
	bl sub_8003F3C
	ldrb r1, [r5, 0x6]
	adds r0, r4, 0
	bl sub_8003F60
	ldrb r1, [r5, 0x7]
	adds r0, r4, 0
	bl sub_8003F80
	ldrb r1, [r5, 0x5]
	adds r0, r4, 0
	bl sub_8003F90
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end CreateTextRenderer

	thumb_func_start sub_8002E4C
sub_8002E4C: @ 8002E4C
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	adds r4, r3, 0
	ldr r5, [sp, 0x18]
	ldr r6, [sp, 0x1C]
	lsls r2, 16
	lsrs r2, 16
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0
	str r0, [sp]
	adds r0, r7, 0
	movs r3, 0
	bl CreateTextRenderer
	strb r4, [r7, 0x12]
	strh r5, [r7, 0x14]
	movs r0, 0
	cmp r6, 0
	beq _08002E7C
	movs r0, 0xFF
_08002E7C:
	strb r0, [r7, 0xF]
	cmp r0, 0
	beq _08002E88
	adds r0, r7, 0
	bl sub_8003D70
_08002E88:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8002E4C

	thumb_func_start sub_8002E90
sub_8002E90: @ 8002E90
	push {r4,lr}
	movs r4, 0
	movs r3, 0
	movs r2, 0x2
	strh r2, [r0, 0x16]
	str r1, [r0, 0x20]
	strh r3, [r0, 0x1E]
	strh r3, [r0, 0x18]
	movs r1, 0xFF
	strb r1, [r0, 0xB]
	strb r4, [r0, 0xC]
	strb r4, [r0, 0xD]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8002E90

	thumb_func_start sub_8002EB0
sub_8002EB0: @ 8002EB0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r0, 0
	ldr r5, [sp, 0x1C]
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _08002F30
	movs r0, 0
	mov r8, r0
	movs r4, 0
	movs r0, 0x3
	strh r0, [r6, 0x36]
	strh r4, [r6, 0x34]
	ldr r0, _08002F34
	mov r4, r8
	strb r4, [r0]
	ldr r4, _08002F38
	movs r0, 0x1A
	strb r0, [r4]
	str r5, [sp]
	adds r0, r7, 0
	bl CreateTextRenderer
	movs r0, 0xFF
	strb r0, [r7, 0xB]
	ldrb r0, [r7]
	cmp r0, 0
	bne _08002F24
	adds r0, r7, 0
	movs r1, 0
	movs r2, 0
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 11
	ldr r4, [r7, 0x24]
	adds r4, r0
	ldr r0, _08002F3C
	ldrb r3, [r7, 0x4]
	adds r1, r4, 0
	adds r2, r3, 0
	bl sub_8003B30
	ldr r0, _08002F40
	adds r4, 0x20
	ldrb r2, [r7, 0x3]
	ldrb r3, [r7, 0x4]
	adds r1, r4, 0
	bl sub_8003B30
	movs r0, 0x2
	strh r0, [r7, 0x1C]
_08002F24:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002F30: .4byte 0x03001770
_08002F34: .4byte 0x03000358
_08002F38: .4byte 0x03000359
_08002F3C: .4byte gUnknown_081E66D2
_08002F40: .4byte gUnknown_081E3D60
	thumb_func_end sub_8002EB0

	thumb_func_start sub_8002F44
sub_8002F44: @ 8002F44
	push {r4,lr}
	adds r4, r0, 0
	b _08002F92
_08002F4A:
	cmp r0, 0x6
	bne _08002F6C
	adds r0, r4, 0
	movs r1, 0x10
	bl UpdateTextCurY
	movs r0, 0
	strb r0, [r4, 0x10]
	ldrb r0, [r4, 0xF]
	cmp r0, 0
	beq _08002F66
	adds r0, r4, 0
	bl sub_8003D70
_08002F66:
	movs r0, 0x2
	strh r0, [r4, 0x16]
	b _08002F8C
_08002F6C:
	cmp r0, 0x7
	bne _08002F8C
	ldrh r1, [r4, 0x1E]
	adds r0, r1, 0x1
	strh r0, [r4, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [r4, 0x20]
	adds r0, r1
	ldrb r0, [r0]
	bl GetExpandedPlaceholder
	adds r1, r0, 0
	adds r0, r4, 0
	bl sub_8002FA0
_08002F8C:
	adds r0, r4, 0
	bl sub_8002FE0
_08002F92:
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	bne _08002F4A
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8002F44

	thumb_func_start sub_8002FA0
sub_8002FA0: @ 8002FA0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r4, r0, 0
	ldrb r0, [r4, 0x2]
	mov r9, r0
	ldr r6, [r4, 0x20]
	ldrh r0, [r4, 0x1E]
	mov r8, r0
	str r1, [r4, 0x20]
	movs r0, 0
	strh r0, [r4, 0x1E]
	movs r5, 0x2
	strh r5, [r4, 0x16]
	adds r0, r4, 0
	bl sub_8002F44
	lsls r0, 24
	lsrs r0, 24
	str r6, [r4, 0x20]
	mov r1, r8
	strh r1, [r4, 0x1E]
	strh r5, [r4, 0x16]
	mov r1, r9
	strb r1, [r4, 0x2]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8002FA0

	thumb_func_start sub_8002FE0
sub_8002FE0: @ 8002FE0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [r4, 0x20]
	adds r1, r0
	ldrb r3, [r1]
	adds r0, r3, 0
	subs r0, 0xFA
	cmp r0, 0x5
	bhi _08003062
	lsls r0, 2
	ldr r1, _08003008
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08003008: .4byte _0800300C
	.align 2, 0
_0800300C:
	.4byte _08003048
	.4byte _0800303E
	.4byte _08003056
	.4byte _08003030
	.4byte _08003034
	.4byte _08003024
_08003024:
	adds r0, r4, 0
	bl sub_8003E4C
	movs r0, 0
	strh r0, [r4, 0x16]
	b _08003076
_08003030:
	movs r0, 0x7
	b _08003050
_08003034:
	adds r0, r4, 0
	bl sub_8003E4C
	movs r0, 0x6
	b _08003050
_0800303E:
	adds r0, r4, 0
	bl DrawInitialDownArrow
	movs r0, 0x8
	b _08003050
_08003048:
	adds r0, r4, 0
	bl DrawInitialDownArrow
	movs r0, 0x9
_08003050:
	strh r0, [r4, 0x16]
	movs r0, 0x2
	b _08003076
_08003056:
	adds r0, r4, 0
	bl sub_8003080
	lsls r0, 24
	lsrs r0, 24
	b _08003076
_08003062:
	ldr r0, _0800307C
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r2, [r1]
	adds r0, r4, 0
	adds r1, r3, 0
	bl _call_via_r2
	movs r0, 0x1
_08003076:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800307C: .4byte gUnknown_081E6A7C
	thumb_func_end sub_8002FE0

	thumb_func_start sub_8003080
sub_8003080: @ 8003080
	push {lr}
	ldr r3, _080030A8
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080030A8: .4byte gUnknown_081E6AD4
	thumb_func_end sub_8003080

	thumb_func_start sub_80030AC
sub_80030AC: @ 80030AC
	movs r0, 0x2
	bx lr
	thumb_func_end sub_80030AC

	thumb_func_start sub_80030B0
sub_80030B0: @ 80030B0
	push {lr}
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	bl sub_8003F90
	movs r0, 0x2
	pop {r1}
	bx r1
	thumb_func_end sub_80030B0

	thumb_func_start sub_80030CC
sub_80030CC: @ 80030CC
	push {lr}
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	bl sub_8003F60
	movs r0, 0x2
	pop {r1}
	bx r1
	thumb_func_end sub_80030CC

	thumb_func_start sub_80030E8
sub_80030E8: @ 80030E8
	push {lr}
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	bl sub_8003F80
	movs r0, 0x2
	pop {r1}
	bx r1
	thumb_func_end sub_80030E8

	thumb_func_start sub_8003104
sub_8003104: @ 8003104
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x1E]
	adds r0, r1, 0x1
	strh r0, [r4, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [r4, 0x20]
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8003F90
	ldrh r1, [r4, 0x1E]
	adds r0, r1, 0x1
	strh r0, [r4, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [r4, 0x20]
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8003F60
	ldrh r1, [r4, 0x1E]
	adds r0, r1, 0x1
	strh r0, [r4, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [r4, 0x20]
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8003F80
	movs r0, 0x2
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8003104

	thumb_func_start sub_8003154
sub_8003154: @ 8003154
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0, 0x6]
	movs r0, 0x2
	bx lr
	thumb_func_end sub_8003154

	thumb_func_start sub_800316C
sub_800316C: @ 800316C
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0, 0x1]
	movs r0, 0x2
	bx lr
	thumb_func_end sub_800316C

	thumb_func_start sub_8003184
sub_8003184: @ 8003184
	ldr r1, [r0, 0x2C]
	ldrb r1, [r1, 0x8]
	strb r1, [r0, 0x1]
	movs r0, 0x2
	bx lr
	thumb_func_end sub_8003184

	thumb_func_start sub_8003190
sub_8003190: @ 8003190
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8003E4C
	movs r0, 0x4
	strh r0, [r4, 0x16]
	ldrh r1, [r4, 0x1E]
	adds r0, r1, 0x1
	strh r0, [r4, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [r4, 0x20]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r4, 0xD]
	movs r0, 0x2
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8003190

	thumb_func_start sub_80031B8
sub_80031B8: @ 80031B8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8003E4C
	movs r0, 0x5
	strh r0, [r4, 0x16]
	movs r0, 0x2
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80031B8

	thumb_func_start sub_80031CC
sub_80031CC: @ 80031CC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8003E4C
	movs r0, 0xA
	strh r0, [r4, 0x16]
	movs r0, 0x2
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80031CC

	thumb_func_start sub_80031E0
sub_80031E0: @ 80031E0
	push {r4,lr}
	ldrh r1, [r0, 0x1E]
	adds r2, r1, 0x1
	strh r2, [r0, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r3, [r0, 0x20]
	adds r1, r3, r1
	ldrb r4, [r1]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	adds r3, r2
	ldrb r0, [r3]
	lsls r0, 8
	orrs r4, r0
	adds r0, r4, 0
	bl sub_8075474
	movs r0, 0x2
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80031E0

	thumb_func_start sub_8003210
sub_8003210: @ 8003210
	push {lr}
	ldr r1, _08003238
	ldrb r3, [r0]
	lsls r3, 2
	adds r3, r1
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	ldr r2, [r3]
	bl _call_via_r2
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08003238: .4byte gUnknown_081E6A7C
	thumb_func_end sub_8003210

	thumb_func_start sub_800323C
sub_800323C: @ 800323C
	movs r0, 0x1
	bx lr
	thumb_func_end sub_800323C

	thumb_func_start sub_8003240
sub_8003240: @ 8003240
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8003E4C
	ldrh r1, [r4, 0x1E]
	adds r0, r1, 0x1
	strh r0, [r4, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [r4, 0x20]
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 27
	lsrs r1, 24
	adds r0, r4, 0
	bl UpdateTextCurY
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8003240

	thumb_func_start sub_800326C
sub_800326C: @ 800326C
	push {lr}
	bl sub_8004318
	movs r0, 0x2
	pop {r1}
	bx r1
	thumb_func_end sub_800326C

	thumb_func_start sub_8003278
sub_8003278: @ 8003278
	push {r4,lr}
	ldrh r1, [r0, 0x1E]
	adds r2, r1, 0x1
	strh r2, [r0, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r3, [r0, 0x20]
	adds r1, r3, r1
	ldrb r4, [r1]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	adds r3, r2
	ldrb r0, [r3]
	lsls r0, 8
	orrs r4, r0
	adds r0, r4, 0
	bl audio_play
	movs r0, 0x2
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8003278

	thumb_func_start sub_80032A8
sub_80032A8: @ 80032A8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _080032C6
	ldrb r0, [r5, 0x12]
	ldrb r1, [r5, 0x10]
	adds r0, r1
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _080032C6
	ldrb r0, [r5, 0xE]
	cmp r0, 0x7
	bhi _080032E0
_080032C6:
	ldr r0, _080032DC
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r0
	ldr r2, [r1]
	adds r0, r5, 0
	movs r1, 0
	bl _call_via_r2
	b _08003338
	.align 2, 0
_080032DC: .4byte gUnknown_081E6A7C
_080032E0:
	ldr r0, _08003340
	ldr r4, [r0, 0x40]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r5, 0x24]
	adds r1, r0
	str r4, [r1]
	str r4, [r1, 0x4]
	str r4, [r1, 0x8]
	str r4, [r1, 0xC]
	str r4, [r1, 0x10]
	str r4, [r1, 0x14]
	str r4, [r1, 0x18]
	str r4, [r1, 0x1C]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x1
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r5, 0x24]
	adds r1, r0
	str r4, [r1]
	str r4, [r1, 0x4]
	str r4, [r1, 0x8]
	str r4, [r1, 0xC]
	str r4, [r1, 0x10]
	str r4, [r1, 0x14]
	str r4, [r1, 0x18]
	str r4, [r1, 0x1C]
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8006954
	adds r0, r5, 0
	movs r1, 0x8
	bl UpdateTextCurX
_08003338:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003340: .4byte 0x03000360
	thumb_func_end sub_80032A8

	thumb_func_start sub_8003344
sub_8003344: @ 8003344
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldrb r6, [r4, 0xE]
	ldrb r1, [r4, 0x10]
	subs r0, r5, r1
	cmp r0, 0x8
	ble _08003376
	ldrb r0, [r4, 0x12]
	adds r0, r1
	movs r1, 0x7
	ands r0, r1
	movs r1, 0x8
	subs r1, r0
	strb r1, [r4, 0xE]
	b _08003378
_08003366:
	adds r0, r4, 0
	bl sub_80032A8
	ldrb r0, [r4, 0x10]
	subs r0, r5, r0
	cmp r0, 0x7
	ble _08003376
	movs r0, 0x8
_08003376:
	strb r0, [r4, 0xE]
_08003378:
	ldrb r0, [r4, 0x10]
	cmp r0, r5
	bcc _08003366
	strb r6, [r4, 0xE]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8003344

	thumb_func_start sub_8003388
sub_8003388: @ 8003388
	push {lr}
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	ldrb r2, [r0, 0x10]
	adds r1, r2
	lsls r1, 24
	lsrs r1, 24
	bl sub_8003344
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8003388

	thumb_func_start sub_80033AC
sub_80033AC: @ 80033AC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8003E4C
	ldrh r1, [r4, 0x1E]
	adds r0, r1, 0x1
	strh r0, [r4, 0x1E]
	lsls r1, 16
	lsrs r1, 16
	ldr r0, [r4, 0x20]
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_8003CA0
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80033AC

	thumb_func_start sub_80033D4
sub_80033D4: @ 80033D4
	push {lr}
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	bl sub_8003344
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80033D4

	thumb_func_start sub_80033F0
sub_80033F0: @ 80033F0
	ldrh r2, [r0, 0x1E]
	adds r1, r2, 0x1
	strh r1, [r0, 0x1E]
	lsls r2, 16
	lsrs r2, 16
	ldr r1, [r0, 0x20]
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0, 0xE]
	movs r0, 0x2
	bx lr
	thumb_func_end sub_80033F0

	thumb_func_start sub_8003408
sub_8003408: @ 8003408
	movs r1, 0x1
	strb r1, [r0, 0x2]
	movs r0, 0x2
	bx lr
	thumb_func_end sub_8003408

	thumb_func_start sub_8003410
sub_8003410: @ 8003410
	movs r1, 0x2
	strb r1, [r0, 0x2]
	movs r0, 0x2
	bx lr
	thumb_func_end sub_8003410

	thumb_func_start sub_8003418
sub_8003418: @ 8003418
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0x1
	b _08003452
_08003420:
	cmp r0, 0x6
	bne _08003440
	adds r0, r4, 0
	movs r1, 0x10
	bl UpdateTextCurY
	movs r0, 0
	strb r0, [r4, 0x10]
	ldrb r0, [r4, 0xF]
	cmp r0, 0
	beq _0800343C
	adds r0, r4, 0
	bl sub_8003D70
_0800343C:
	movs r0, 0x2
	strh r0, [r4, 0x16]
_08003440:
	adds r0, r4, 0
	bl sub_8002FE0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08003452
	movs r5, 0
	b _08003458
_08003452:
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	bne _08003420
_08003458:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8003418

	thumb_func_start sub_8003460
sub_8003460: @ 8003460
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, [sp, 0xC]
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r4, 0
	bl CreateTextRenderer
	adds r0, r4, 0
	bl sub_8002F44
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8003460

	thumb_func_start sub_8003490
sub_8003490: @ 8003490
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r4, [sp, 0x14]
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	add r0, sp, 0x4
	strb r1, [r0]
	adds r1, r0, 0
	movs r0, 0xFF
	strb r0, [r1, 0x1]
	str r4, [sp]
	adds r0, r5, 0
	bl CreateTextRenderer
	adds r0, r5, 0
	bl sub_8002FE0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl sub_8003E4C
	adds r0, r4, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8003490

	thumb_func_start sub_80034D4
sub_80034D4: @ 80034D4
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _080034E8
	adds r1, r3, 0
	bl sub_8004E3C
	pop {r0}
	bx r0
	.align 2, 0
_080034E8: .4byte gUnknown_081E6C74
	thumb_func_end sub_80034D4

	thumb_func_start sub_80034EC
sub_80034EC: @ 80034EC
	push {lr}
	adds r1, r0, 0
	ldr r0, _08003500
	bl GetStringWidthGivenTextRendererTemplate
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08003500: .4byte gUnknown_081E6C74
	thumb_func_end sub_80034EC

	thumb_func_start sub_8003504
sub_8003504: @ 8003504
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r8, r0
	mov r9, r1
	adds r6, r2, 0
	adds r4, r3, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08003550
	ldr r0, _08003554
	str r0, [r5, 0x2C]
	movs r0, 0
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateTextRenderer
	str r4, [sp]
	adds r0, r5, 0
	mov r1, r8
	mov r2, r9
	adds r3, r6, 0
	bl sub_8004A48
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08003550: .4byte 0x03000328
_08003554: .4byte gUnknown_081E6C74
	thumb_func_end sub_8003504

	thumb_func_start sub_8003558
sub_8003558: @ 8003558
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r9, r0
	mov r8, r1
	adds r6, r2, 0
	adds r4, r3, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080035A4
	ldr r0, _080035A8
	str r0, [r5, 0x2C]
	movs r0, 0
	str r0, [sp]
	adds r0, r5, 0
	movs r2, 0
	movs r3, 0
	bl CreateTextRenderer
	str r4, [sp]
	adds r0, r5, 0
	mov r1, r9
	mov r2, r8
	adds r3, r6, 0
	bl sub_8004B24
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080035A4: .4byte 0x03000328
_080035A8: .4byte gUnknown_081E6C74
	thumb_func_end sub_8003558

	thumb_func_start sub_80035AC
sub_80035AC: @ 80035AC
	push {lr}
	ldr r2, _080035C0
	movs r1, 0
	strb r1, [r2]
	bl sub_80035C4
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080035C0: .4byte 0x03000358
	thumb_func_end sub_80035AC

	thumb_func_start sub_80035C4
sub_80035C4: @ 80035C4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x16]
	cmp r0, 0xA
	bls _080035D0
	b _080036D8
_080035D0:
	lsls r0, 2
	ldr r1, _080035DC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080035DC: .4byte _080035E0
	.align 2, 0
_080035E0:
	.4byte _080036DC
	.4byte _080036C0
	.4byte _080036E0
	.4byte _08003648
	.4byte _08003670
	.4byte _0800360C
	.4byte _080036B4
	.4byte _080036AC
	.4byte _0800367C
	.4byte _08003694
	.4byte _080036C8
_0800360C:
	adds r0, r4, 0
	bl sub_8003FD0
	lsls r0, 24
	cmp r0, 0
	beq _08003634
	ldr r0, _08003630
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08003626
	b _08003744
_08003626:
	movs r0, 0x5
	bl audio_play
	b _08003642
	.align 2, 0
_08003630: .4byte 0x03001770
_08003634:
	ldrb r0, [r4, 0xD]
	subs r0, 0x1
	strb r0, [r4, 0xD]
	lsls r0, 24
	cmp r0, 0
	beq _08003642
	b _08003744
_08003642:
	movs r0, 0x2
	strh r0, [r4, 0x16]
	b _08003744
_08003648:
	adds r0, r4, 0
	bl sub_8003FD0
	lsls r0, 24
	cmp r0, 0
	beq _08003670
	ldr r2, _0800366C
	ldrh r1, [r2, 0x2C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08003670
	ldrh r0, [r2, 0x34]
	cmp r0, 0x1
	bne _08003670
	movs r0, 0
	strb r0, [r4, 0xD]
	b _080036D2
	.align 2, 0
_0800366C: .4byte 0x03001770
_08003670:
	ldrb r0, [r4, 0xD]
	cmp r0, 0
	beq _080036D2
	subs r0, 0x1
	strb r0, [r4, 0xD]
	b _080036CC
_0800367C:
	adds r0, r4, 0
	bl DialogueWaitForInput
	lsls r0, 24
	cmp r0, 0
	beq _08003744
	adds r0, r4, 0
	bl sub_8004318
	movs r0, 0x2
	strh r0, [r4, 0x16]
	b _08003744
_08003694:
	adds r0, r4, 0
	bl DialogueWaitForInput
	lsls r0, 24
	cmp r0, 0
	beq _08003744
	adds r0, r4, 0
	bl sub_800401C
	movs r0, 0x2
	strh r0, [r4, 0x16]
	b _08003744
_080036AC:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	b _080036D2
_080036B4:
	adds r0, r4, 0
	bl sub_800401C
	movs r0, 0x2
	strh r0, [r4, 0x16]
	b _08003744
_080036C0:
	adds r0, r4, 0
	bl sub_8004318
	b _080036E0
_080036C8:
	bl mplay_has_finished_maybe
_080036CC:
	lsls r0, 24
	cmp r0, 0
	bne _08003744
_080036D2:
	movs r0, 0x2
	strh r0, [r4, 0x16]
	b _080036E0
_080036D8:
	movs r0, 0
	strh r0, [r4, 0x16]
_080036DC:
	movs r0, 0x1
	b _08003746
_080036E0:
	adds r0, r4, 0
	bl sub_8002FE0
	ldrh r0, [r4, 0x16]
	cmp r0, 0xA
	bhi _08003738
	lsls r0, 2
	ldr r1, _080036F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080036F8: .4byte _080036FC
	.align 2, 0
_080036FC:
	.4byte _080036DC
	.4byte _08003738
	.4byte _08003738
	.4byte _08003738
	.4byte _08003744
	.4byte _08003728
	.4byte _08003744
	.4byte _08003738
	.4byte _08003728
	.4byte _08003728
	.4byte _08003744
_08003728:
	adds r0, r4, 0
	bl sub_8003FD0
	lsls r0, 24
	cmp r0, 0
	bne _08003744
	movs r0, 0x3C
	b _08003742
_08003738:
	movs r0, 0x3
	strh r0, [r4, 0x16]
	adds r0, r4, 0
	bl sub_8003FA4
_08003742:
	strb r0, [r4, 0xD]
_08003744:
	movs r0, 0
_08003746:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80035C4

	thumb_func_start sub_800374C
sub_800374C: @ 800374C
	push {r4-r6,lr}
	ldr r6, _08003770
	movs r1, 0x1
	strb r1, [r6]
	ldr r5, _08003774
	movs r4, 0x1A
	strb r4, [r5]
	bl sub_80035C4
	lsls r0, 24
	lsrs r0, 24
	strb r4, [r5]
	movs r1, 0
	strb r1, [r6]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08003770: .4byte 0x03000358
_08003774: .4byte 0x03000359
	thumb_func_end sub_800374C

	thumb_func_start sub_8003778
sub_8003778: @ 8003778
	push {r4,lr}
	ldr r4, _08003798
	movs r1, 0x2
	strb r1, [r4]
	ldr r2, _0800379C
	movs r1, 0x1A
	strb r1, [r2]
	bl sub_80035C4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	strb r1, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08003798: .4byte 0x03000358
_0800379C: .4byte 0x03000359
	thumb_func_end sub_8003778

	thumb_func_start sub_80037A0
sub_80037A0: @ 80037A0
	push {r4,lr}
	ldr r2, _080037C0
	movs r1, 0x3
	strb r1, [r2]
	ldr r4, _080037C4
	movs r1, 0x11
	strb r1, [r4]
	bl sub_80035C4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1A
	strb r1, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080037C0: .4byte 0x03000358
_080037C4: .4byte 0x03000359
	thumb_func_end sub_80037A0

	thumb_func_start IsTextPrinterActive
IsTextPrinterActive: @ 80037C8
	push {r4,lr}
	ldr r3, _080037E8
	movs r2, 0
	strb r2, [r3]
	ldr r4, _080037EC
	strb r1, [r4]
	bl sub_80035C4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1A
	strb r1, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080037E8: .4byte 0x03000358
_080037EC: .4byte 0x03000359
	thumb_func_end IsTextPrinterActive

	thumb_func_start sub_80037F0
sub_80037F0: @ 80037F0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8003818
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl UpdateTextCurX
	ldrb r0, [r4, 0xB]
	cmp r0, 0
	beq _08003810
	adds r0, r4, 0
	bl sub_8003E4C
_08003810:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80037F0

	thumb_func_start sub_8003818
sub_8003818: @ 8003818
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	bl GetGlyphWidth
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_8006874
	adds r1, r0, 0
	adds r0, r5, 0
	bl sub_8006954
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8003818

	thumb_func_start sub_8003844
sub_8003844: @ 8003844
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _08003864
	ldrb r0, [r4, 0x1]
	lsls r0, 2
	adds r0, r2
	ldr r2, [r0]
	adds r0, r4, 0
	bl _call_via_r2
	ldrb r0, [r4, 0x10]
	adds r0, 0x8
	strb r0, [r4, 0x10]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08003864: .4byte gUnknown_081E6A88
	thumb_func_end sub_8003844

	thumb_func_start sub_8003868
sub_8003868: @ 8003868
	push {lr}
	lsls r2, r1, 1
	ldrh r1, [r0, 0x1A]
	adds r2, r1
	lsls r2, 16
	lsrs r1, r2, 16
	movs r3, 0x80
	lsls r3, 9
	adds r2, r3
	lsrs r2, 16
	bl sub_80039EC
	pop {r0}
	bx r0
	thumb_func_end sub_8003868

	thumb_func_start sub_8003884
sub_8003884: @ 8003884
	push {r4,lr}
	lsls r3, r1, 1
	ldr r4, _080038AC
	adds r1, r3, r4
	ldrb r1, [r1]
	ldrh r2, [r0, 0x1A]
	adds r1, r2, r1
	lsls r1, 16
	lsrs r1, 16
	adds r3, 0x1
	adds r3, r4
	ldrb r3, [r3]
	adds r2, r3
	lsls r2, 16
	lsrs r2, 16
	bl sub_80039EC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080038AC: .4byte gUnknown_081E5FF0
	thumb_func_end sub_8003884

	thumb_func_start sub_80038B0
sub_80038B0: @ 80038B0
	push {lr}
	adds r3, r1, 0
	ldrh r2, [r0, 0x1A]
	adds r1, r2, 0
	adds r1, 0xD4
	lsls r1, 16
	lsrs r1, 16
	adds r2, r3
	lsls r2, 16
	lsrs r2, 16
	bl sub_80039EC
	pop {r0}
	bx r0
	thumb_func_end sub_80038B0

	thumb_func_start sub_80038CC
sub_80038CC: @ 80038CC
	push {r4,lr}
	lsls r3, r1, 1
	ldr r4, _080038F4
	adds r1, r3, r4
	ldrb r1, [r1]
	ldrh r2, [r0, 0x1A]
	adds r1, r2, r1
	lsls r1, 16
	lsrs r1, 16
	adds r3, 0x1
	adds r3, r4
	ldrb r3, [r3]
	adds r2, r3
	lsls r2, 16
	lsrs r2, 16
	bl sub_80039EC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080038F4: .4byte gUnknown_081E61DE
	thumb_func_end sub_80038CC

	thumb_func_start sub_80038F8
sub_80038F8: @ 80038F8
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	bl GetGlyphWidth
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_800392C
	adds r0, r6, 0
	adds r1, r4, 0
	bl UpdateTextCurX
	ldrb r0, [r6, 0xB]
	cmp r0, 0
	beq _08003924
	adds r0, r6, 0
	bl sub_8003E4C
_08003924:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80038F8

	thumb_func_start sub_800392C
sub_800392C: @ 800392C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl GetGlyphWidth
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8006874
	adds r1, r0, 0
	adds r0, r4, 0
	bl sub_8006954
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_800392C

	thumb_func_start sub_8003954
sub_8003954: @ 8003954
	push {r4,r5,lr}
	sub sp, 0xC
	adds r4, r0, 0
	adds r3, r1, 0
	adds r5, r2, 0
	ldrb r0, [r4, 0x1]
	ldrb r1, [r4, 0x2]
	lsls r3, 16
	lsrs r3, 16
	add r2, sp, 0x8
	str r2, [sp]
	adds r2, r3, 0
	add r3, sp, 0x4
	bl sub_8003A1C
	ldrb r0, [r4, 0x1]
	cmp r0, 0x6
	bhi _080039E2
	lsls r0, 2
	ldr r1, _08003984
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08003984: .4byte _08003988
	.align 2, 0
_08003988:
	.4byte _080039A4
	.4byte _080039A4
	.4byte _080039A4
	.4byte _080039C0
	.4byte _080039C0
	.4byte _080039C0
	.4byte _080039A4
_080039A4:
	ldr r0, [sp, 0x4]
	ldrb r2, [r4, 0x3]
	ldrb r3, [r4, 0x4]
	adds r1, r5, 0
	bl sub_8003B30
	ldr r0, [sp, 0x8]
	adds r1, r5, 0
	adds r1, 0x20
	ldrb r2, [r4, 0x3]
	ldrb r3, [r4, 0x4]
	bl sub_8003B30
	b _080039E2
_080039C0:
	ldr r0, [sp, 0x4]
	ldrb r2, [r4, 0x3]
	ldrb r3, [r4, 0x5]
	ldrb r1, [r4, 0x4]
	str r1, [sp]
	adds r1, r5, 0
	bl sub_8003BCC
	ldr r0, [sp, 0x8]
	adds r1, r5, 0
	adds r1, 0x20
	ldrb r2, [r4, 0x3]
	ldrb r3, [r4, 0x5]
	ldrb r4, [r4, 0x4]
	str r4, [sp]
	bl sub_8003BCC
_080039E2:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8003954

	thumb_func_start sub_80039EC
sub_80039EC: @ 80039EC
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	bl sub_8003AF8
	adds r2, r0, 0
	cmp r2, 0
	beq _08003A16
	ldrb r1, [r4, 0x6]
	lsls r1, 28
	lsrs r1, 16
	adds r0, r5, 0
	orrs r0, r1
	strh r0, [r2]
	adds r2, 0x40
	adds r0, r6, 0
	orrs r0, r1
	strh r0, [r2]
_08003A16:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80039EC

	thumb_func_start sub_8003A1C
sub_8003A1C: @ 8003A1C
	push {r4-r6,lr}
	adds r5, r3, 0
	ldr r6, [sp, 0x10]
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	lsls r2, 16
	lsrs r4, r2, 16
	cmp r0, 0x1
	bne _08003A36
	movs r0, 0
	b _08003A38
_08003A36:
	movs r0, 0x7
_08003A38:
	adds r0, r3
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _08003A54
	adds r3, r1, r0
	ldr r0, [r3]
	cmp r0, 0x4
	bhi _08003AEC
	lsls r0, 2
	ldr r1, _08003A58
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08003A54: .4byte gUnknown_081E6B30
_08003A58: .4byte _08003A5C
	.align 2, 0
_08003A5C:
	.4byte _08003A70
	.4byte _08003A80
	.4byte _08003A8C
	.4byte _08003AA0
	.4byte _08003ACC
_08003A70:
	ldrh r0, [r3, 0x8]
	adds r1, r4, 0
	muls r1, r0
	ldr r0, [r3, 0x4]
	adds r0, r1
	str r0, [r5]
	ldrh r1, [r3, 0xA]
	b _08003AC0
_08003A80:
	lsls r0, r4, 17
	lsrs r4, r0, 16
	ldr r2, _08003A88
	b _08003AA6
	.align 2, 0
_08003A88: .4byte gUnknown_081E5FF0
_08003A8C:
	ldrh r1, [r3, 0x8]
	movs r0, 0xD4
	muls r1, r0
	ldr r0, [r3, 0x4]
	adds r0, r1
	str r0, [r5]
	ldrh r0, [r3, 0x8]
	adds r1, r4, 0
	muls r1, r0
	b _08003ABE
_08003AA0:
	lsls r0, r4, 17
	lsrs r4, r0, 16
	ldr r2, _08003AC8
_08003AA6:
	adds r0, r4, r2
	ldrb r1, [r0]
	ldrh r0, [r3, 0x8]
	muls r1, r0
	ldr r0, [r3, 0x4]
	adds r0, r1
	str r0, [r5]
	adds r0, r4, 0x1
	adds r0, r2
	ldrb r1, [r0]
	ldrh r0, [r3, 0x8]
	muls r1, r0
_08003ABE:
	ldr r0, [r3, 0x4]
_08003AC0:
	adds r0, r1
	str r0, [r6]
	b _08003AEC
	.align 2, 0
_08003AC8: .4byte gUnknown_081E61DE
_08003ACC:
	ldr r0, _08003AF4
	ands r0, r4
	ldrh r2, [r3, 0x8]
	muls r0, r2
	ldr r1, [r3, 0x4]
	adds r1, r0
	movs r0, 0xF
	ands r4, r0
	adds r0, r4, 0
	muls r0, r2
	asrs r0, 1
	adds r1, r0
	str r1, [r5]
	ldrh r0, [r3, 0xA]
	adds r1, r0
	str r1, [r6]
_08003AEC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003AF4: .4byte 0x0000fff0
	thumb_func_end sub_8003A1C

	thumb_func_start sub_8003AF8
sub_8003AF8: @ 8003AF8
	push {r4,lr}
	adds r3, r0, 0
	movs r0, 0
	ldr r4, [r3, 0x28]
	cmp r4, 0
	beq _08003B2A
	ldrb r1, [r3, 0x12]
	ldrb r0, [r3, 0x10]
	adds r1, r0
	lsrs r1, 3
	ldrb r0, [r3, 0x7]
	adds r1, r0
	lsls r1, 24
	lsrs r1, 24
	ldrh r0, [r3, 0x14]
	ldrb r2, [r3, 0x11]
	adds r0, r2
	lsrs r0, 3
	ldrb r3, [r3, 0x8]
	adds r0, r3
	lsls r0, 24
	lsrs r0, 19
	adds r0, r1
	lsls r0, 1
	adds r0, r4, r0
_08003B2A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8003AF8

	thumb_func_start sub_8003B30
sub_8003B30: @ 8003B30
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	adds r7, r0, 0
	str r3, [sp]
	str r2, [sp, 0x4]
	movs r5, 0
	movs r4, 0x1
	mov r3, sp
	adds r6, r1, 0
_08003B4A:
	adds r0, r7, r5
	ldrb r2, [r0]
	movs r1, 0x1
	ands r1, r2
	lsls r1, 2
	adds r1, r3
	lsls r2, 24
	lsrs r0, r2, 25
	ands r0, r4
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	lsls r0, 4
	ldr r1, [r1]
	orrs r1, r0
	lsrs r0, r2, 26
	ands r0, r4
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	lsls r0, 8
	orrs r1, r0
	lsrs r0, r2, 27
	ands r0, r4
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	lsls r0, 12
	orrs r1, r0
	lsrs r0, r2, 28
	ands r0, r4
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	lsls r0, 16
	orrs r1, r0
	lsrs r0, r2, 29
	ands r0, r4
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	lsls r0, 20
	orrs r1, r0
	lsrs r0, r2, 30
	ands r0, r4
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	lsls r0, 24
	orrs r1, r0
	lsrs r2, 31
	lsls r2, 2
	adds r2, r3
	ldr r0, [r2]
	lsls r0, 28
	orrs r1, r0
	stm r6!, {r1}
	adds r5, 0x1
	cmp r5, 0x7
	ble _08003B4A
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8003B30

	thumb_func_start sub_8003BCC
sub_8003BCC: @ 8003BCC
	push {r4-r7,lr}
	sub sp, 0x40
	ldr r5, [sp, 0x54]
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r5, 24
	lsrs r5, 24
	movs r4, 0x1
	str r4, [sp, 0x4]
	movs r4, 0x2
	str r4, [sp, 0x8]
	movs r4, 0x3
	str r4, [sp, 0xC]
	movs r4, 0x4
	str r4, [sp, 0x10]
	movs r4, 0x5
	str r4, [sp, 0x14]
	movs r4, 0x6
	str r4, [sp, 0x18]
	movs r4, 0x7
	str r4, [sp, 0x1C]
	movs r4, 0x8
	str r4, [sp, 0x20]
	movs r4, 0x9
	str r4, [sp, 0x24]
	movs r4, 0xA
	str r4, [sp, 0x28]
	movs r4, 0xB
	str r4, [sp, 0x2C]
	movs r4, 0xC
	str r4, [sp, 0x30]
	movs r4, 0xD
	str r4, [sp, 0x34]
	str r5, [sp]
	str r3, [sp, 0x38]
	str r2, [sp, 0x3C]
	movs r3, 0xF
	adds r6, r0, 0
	adds r5, r1, 0
	movs r4, 0x7
_08003C20:
	ldm r6!, {r2}
	adds r0, r2, 0
	ands r0, r3
	lsls r0, 2
	mov r7, sp
	adds r1, r7, r0
	lsrs r0, r2, 4
	ands r0, r3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	lsls r0, 4
	ldr r1, [r1]
	orrs r1, r0
	lsrs r0, r2, 8
	ands r0, r3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	lsls r0, 8
	orrs r1, r0
	lsrs r0, r2, 12
	ands r0, r3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	lsls r0, 12
	orrs r1, r0
	lsrs r0, r2, 16
	ands r0, r3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	lsls r0, 16
	orrs r1, r0
	lsrs r0, r2, 20
	ands r0, r3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	lsls r0, 20
	orrs r1, r0
	lsrs r0, r2, 24
	ands r0, r3
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	lsls r0, 24
	orrs r1, r0
	lsrs r2, 28
	lsls r2, 2
	adds r0, r7, r2
	ldr r0, [r0]
	lsls r0, 28
	orrs r1, r0
	stm r5!, {r1}
	subs r4, 0x1
	cmp r4, 0
	bge _08003C20
	add sp, 0x40
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8003BCC

	thumb_func_start sub_8003CA0
sub_8003CA0: @ 8003CA0
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r3, r1, 24
	ldrb r0, [r2]
	cmp r0, 0
	bne _08003CC2
	ldrb r0, [r2, 0x12]
	ldrb r1, [r2, 0x10]
	adds r0, r1
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08003CC2
	ldrh r0, [r2, 0x1C]
	adds r0, 0x2
	strh r0, [r2, 0x1C]
_08003CC2:
	strb r3, [r2, 0x10]
	pop {r0}
	bx r0
	thumb_func_end sub_8003CA0

	thumb_func_start UpdateTextCurX
UpdateTextCurX: @ 8003CC8
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	cmp r0, 0
	bne _08003CF6
	ldrb r3, [r4, 0x10]
	adds r0, r1, r3
	strb r0, [r4, 0x10]
	ldrb r0, [r4, 0x12]
	ldrb r1, [r4, 0x10]
	adds r1, r0, r1
	movs r2, 0xF8
	ands r1, r2
	adds r0, r3
	ands r0, r2
	cmp r1, r0
	beq _08003CFC
	ldrh r0, [r4, 0x1C]
	adds r0, 0x2
	strh r0, [r4, 0x1C]
	b _08003CFC
_08003CF6:
	ldrb r0, [r4, 0x10]
	adds r0, r1, r0
	strb r0, [r4, 0x10]
_08003CFC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end UpdateTextCurX

	thumb_func_start UpdateTextCurY
UpdateTextCurY: @ 8003D04
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r3, r1, 24
	ldrb r0, [r2]
	cmp r0, 0
	bne _08003D26
	ldrb r0, [r2, 0x12]
	ldrb r1, [r2, 0x10]
	adds r0, r1
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08003D26
	ldrh r0, [r2, 0x1C]
	adds r0, 0x2
	strh r0, [r2, 0x1C]
_08003D26:
	ldrb r0, [r2, 0x11]
	adds r0, r3, r0
	strb r0, [r2, 0x11]
	pop {r0}
	bx r0
	thumb_func_end UpdateTextCurY

	thumb_func_start sub_8003D30
sub_8003D30: @ 8003D30
	push {lr}
	adds r3, r0, 0
	ldrb r0, [r3]
	cmp r0, 0x1
	beq _08003D54
	cmp r0, 0x1
	bgt _08003D44
	cmp r0, 0
	beq _08003D48
	b _08003D66
_08003D44:
	cmp r0, 0x2
	bne _08003D66
_08003D48:
	adds r0, r3, 0
	movs r1, 0
	movs r2, 0x8
	bl sub_8006874
	b _08003D66
_08003D54:
	ldr r0, _08003D6C
	ldrb r1, [r3, 0x1]
	lsls r1, 2
	adds r1, r0
	ldr r2, [r1]
	adds r0, r3, 0
	movs r1, 0
	bl _call_via_r2
_08003D66:
	pop {r0}
	bx r0
	.align 2, 0
_08003D6C: .4byte gUnknown_081E6A88
	thumb_func_end sub_8003D30

	thumb_func_start sub_8003D70
sub_8003D70: @ 8003D70
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrb r0, [r6, 0x12]
	movs r1, 0x7
	ands r1, r0
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _08003E3C
	cmp r1, 0
	beq _08003E3C
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08003E44
	adds r0, r1
	ldr r1, [r0]
	mvns r5, r1
	ldr r0, _08003E48
	ldr r4, [r0, 0x40]
	ands r4, r1
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r6, 0x24]
	adds r1, r0
	ldr r0, [r1]
	ands r0, r5
	orrs r0, r4
	str r0, [r1]
	ldr r0, [r1, 0x4]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x4]
	ldr r0, [r1, 0x8]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x8]
	ldr r0, [r1, 0xC]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0xC]
	ldr r0, [r1, 0x10]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x10]
	ldr r0, [r1, 0x14]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x14]
	ldr r0, [r1, 0x18]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x18]
	ldr r0, [r1, 0x1C]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x1C]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x1
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r6, 0x24]
	adds r1, r0
	ldr r0, [r1]
	ands r0, r5
	orrs r0, r4
	str r0, [r1]
	ldr r0, [r1, 0x4]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x4]
	ldr r0, [r1, 0x8]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x8]
	ldr r0, [r1, 0xC]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0xC]
	ldr r0, [r1, 0x10]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x10]
	ldr r0, [r1, 0x14]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x14]
	ldr r0, [r1, 0x18]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x18]
	ldr r0, [r1, 0x1C]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x1C]
_08003E3C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003E44: .4byte gUnknown_081E69DC
_08003E48: .4byte 0x03000360
	thumb_func_end sub_8003D70

	thumb_func_start sub_8003E4C
sub_8003E4C: @ 8003E4C
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrb r0, [r6, 0x10]
	ldrb r1, [r6, 0x12]
	adds r2, r0, r1
	movs r0, 0x7
	ands r2, r0
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _08003F2E
	cmp r2, 0
	beq _08003F2E
	movs r0, 0x8
	subs r0, r2
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 5
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r2, _08003F34
	adds r0, r2
	adds r1, r0
	ldr r5, [r1]
	ldr r0, _08003F38
	ldr r4, [r0, 0x40]
	bics r4, r5
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r6, 0x24]
	adds r1, r0
	ldr r0, [r1]
	ands r0, r5
	orrs r0, r4
	str r0, [r1]
	ldr r0, [r1, 0x4]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x4]
	ldr r0, [r1, 0x8]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x8]
	ldr r0, [r1, 0xC]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0xC]
	ldr r0, [r1, 0x10]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x10]
	ldr r0, [r1, 0x14]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x14]
	ldr r0, [r1, 0x18]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x18]
	ldr r0, [r1, 0x1C]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x1C]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x1
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r6, 0x24]
	adds r1, r0
	ldr r0, [r1]
	ands r0, r5
	orrs r0, r4
	str r0, [r1]
	ldr r0, [r1, 0x4]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x4]
	ldr r0, [r1, 0x8]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x8]
	ldr r0, [r1, 0xC]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0xC]
	ldr r0, [r1, 0x10]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x10]
	ldr r0, [r1, 0x14]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x14]
	ldr r0, [r1, 0x18]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x18]
	ldr r0, [r1, 0x1C]
	ands r0, r5
	orrs r0, r4
	str r0, [r1, 0x1C]
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_8006954
_08003F2E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003F34: .4byte gUnknown_081E66DC
_08003F38: .4byte 0x03000360
	thumb_func_end sub_8003E4C

	thumb_func_start sub_8003F3C
sub_8003F3C: @ 8003F3C
	push {lr}
	movs r1, 0
	strb r1, [r0, 0x4]
	movs r1, 0xE
	strb r1, [r0, 0x5]
	movs r1, 0xF
	strb r1, [r0, 0x3]
	movs r1, 0
	ldr r0, _08003F5C
	adds r0, 0x44
_08003F50:
	stm r0!, {r1}
	adds r1, 0x1
	cmp r1, 0xF
	bls _08003F50
	pop {r0}
	bx r0
	.align 2, 0
_08003F5C: .4byte 0x03000360
	thumb_func_end sub_8003F3C

	thumb_func_start sub_8003F60
sub_8003F60: @ 8003F60
	lsls r1, 24
	lsrs r1, 24
	strb r1, [r0, 0x4]
	ldr r3, _08003F7C
	str r1, [r3, 0x44]
	lsls r2, r1, 4
	orrs r2, r1
	lsls r0, r2, 8
	orrs r0, r2
	lsls r1, r0, 16
	orrs r0, r1
	str r0, [r3, 0x40]
	bx lr
	.align 2, 0
_08003F7C: .4byte 0x03000360
	thumb_func_end sub_8003F60

	thumb_func_start sub_8003F80
sub_8003F80: @ 8003F80
	lsls r1, 24
	lsrs r1, 24
	strb r1, [r0, 0x5]
	ldr r0, _08003F8C
	str r1, [r0, 0x7C]
	bx lr
	.align 2, 0
_08003F8C: .4byte 0x03000360
	thumb_func_end sub_8003F80

	thumb_func_start sub_8003F90
sub_8003F90: @ 8003F90
	lsls r1, 24
	lsrs r1, 24
	strb r1, [r0, 0x3]
	ldr r0, _08003FA0
	adds r0, 0x80
	str r1, [r0]
	bx lr
	.align 2, 0
_08003FA0: .4byte 0x03000360
	thumb_func_end sub_8003F90

	thumb_func_start sub_8003FA4
sub_8003FA4: @ 8003FA4
	push {lr}
	bl sub_8003FD0
	lsls r0, 24
	cmp r0, 0
	beq _08003FC8
	ldr r1, _08003FC0
	ldr r0, _08003FC4
	ldrb r0, [r0, 0x14]
	lsls r0, 29
	lsrs r0, 29
	adds r0, r1
	ldrb r0, [r0]
	b _08003FCA
	.align 2, 0
_08003FC0: .4byte gUnknown_081E6BD8
_08003FC4: .4byte 0x02024ea4
_08003FC8:
	movs r0, 0x3
_08003FCA:
	pop {r1}
	bx r1
	thumb_func_end sub_8003FA4

	thumb_func_start sub_8003FD0
sub_8003FD0: @ 8003FD0
	push {lr}
	movs r1, 0x1
	ldr r0, _08003FE8
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08003FF2
	cmp r0, 0x2
	bgt _08003FEC
	cmp r0, 0x1
	beq _08004008
	b _08004010
	.align 2, 0
_08003FE8: .4byte 0x03000358
_08003FEC:
	cmp r0, 0x3
	beq _08003FF6
	b _08004010
_08003FF2:
	movs r1, 0
	b _08004010
_08003FF6:
	movs r1, 0
	ldr r0, _08004004
	ldrb r0, [r0]
	cmp r0, 0
	bne _08004010
	movs r1, 0x1
	b _08004010
	.align 2, 0
_08004004: .4byte 0x0203869a
_08004008:
	ldr r0, _08004018
	ldrh r0, [r0]
	lsrs r0, 1
	bics r1, r0
_08004010:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_08004018: .4byte 0x020239f8
	thumb_func_end sub_8003FD0

	thumb_func_start sub_800401C
sub_800401C: @ 800401C
	push {lr}
	ldrb r1, [r0]
	cmp r1, 0x1
	beq _0800403A
	cmp r1, 0x1
	bgt _0800402E
	cmp r1, 0
	beq _08004034
	b _08004044
_0800402E:
	cmp r1, 0x2
	beq _08004040
	b _08004044
_08004034:
	bl sub_8004048
	b _08004044
_0800403A:
	bl sub_800412C
	b _08004044
_08004040:
	bl sub_80041D4
_08004044:
	pop {r0}
	bx r0
	thumb_func_end sub_800401C

	thumb_func_start sub_8004048
sub_8004048: @ 8004048
	push {r4,lr}
	adds r2, r0, 0
	ldrb r3, [r2, 0x11]
	cmp r3, 0
	bne _0800406C
	ldr r0, _08004068
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, 0x2
	movs r1, 0
	strh r0, [r2, 0x1C]
	strb r1, [r2, 0x10]
	adds r0, r3, 0
	adds r0, 0x10
	strb r0, [r2, 0x11]
	b _080040A2
	.align 2, 0
_08004068: .4byte 0x03000359
_0800406C:
	ldrb r1, [r2, 0xC]
	movs r3, 0x2
	adds r0, r3, 0
	ands r0, r1
	adds r4, r1, 0
	cmp r0, 0
	beq _0800408C
	ldr r1, _08004088
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, 0x2
	strh r0, [r2, 0x1C]
	adds r3, r1, 0
	b _08004090
	.align 2, 0
_08004088: .4byte 0x03000359
_0800408C:
	strh r3, [r2, 0x1C]
	ldr r3, _080040A8
_08004090:
	movs r0, 0x2
	eors r0, r4
	movs r1, 0
	strb r0, [r2, 0xC]
	strb r1, [r2, 0x10]
	ldrb r1, [r3]
	adds r0, r2, 0
	bl sub_80040AC
_080040A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080040A8: .4byte 0x03000359
	thumb_func_end sub_8004048

	thumb_func_start sub_80040AC
sub_80040AC: @ 80040AC
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r6, r1, 16
	lsrs r6, 16
	ldr r5, [r4, 0x28]
	ldrh r0, [r4, 0x14]
	lsrs r0, 3
	lsls r0, 5
	ldrb r1, [r4, 0x12]
	lsrs r1, 3
	adds r0, r1
	lsls r0, 1
	adds r5, r0
	adds r0, r4, 0
	bl sub_800487C
	ldrb r4, [r4, 0x6]
	lsls r4, 12
	orrs r4, r0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x80
	adds r0, r5
	mov r8, r0
	adds r1, r5, 0
	adds r2, r6, 0
	bl CpuSet
	movs r0, 0xC0
	adds r0, r5
	mov r9, r0
	adds r5, 0x40
	adds r1, r5, 0
	adds r2, r6, 0
	bl CpuSet
	mov r0, sp
	strh r4, [r0]
	movs r5, 0x80
	lsls r5, 17
	orrs r5, r6
	mov r1, r8
	adds r2, r5, 0
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	strh r4, [r0]
	mov r1, r9
	adds r2, r5, 0
	bl CpuSet
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80040AC

	thumb_func_start sub_800412C
sub_800412C: @ 800412C
	push {lr}
	adds r2, r0, 0
	ldrb r0, [r2, 0x11]
	adds r1, r0, 0
	cmp r1, 0
	bne _08004140
	strb r1, [r2, 0x10]
	adds r0, 0x10
	strb r0, [r2, 0x11]
	b _08004156
_08004140:
	ldrb r0, [r2, 0xC]
	movs r1, 0x2
	eors r0, r1
	movs r1, 0
	strb r0, [r2, 0xC]
	strb r1, [r2, 0x10]
	ldr r0, _0800415C
	ldrb r1, [r0]
	adds r0, r2, 0
	bl sub_8004160
_08004156:
	pop {r0}
	bx r0
	.align 2, 0
_0800415C: .4byte 0x03000359
	thumb_func_end sub_800412C

	thumb_func_start sub_8004160
sub_8004160: @ 8004160
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r6, r1, 16
	lsrs r6, 16
	bl sub_8003AF8
	adds r7, r0, 0
	adds r5, r7, 0
	subs r5, 0x40
	adds r0, r4, 0
	bl sub_800487C
	ldrb r4, [r4, 0x6]
	lsls r4, 12
	orrs r4, r0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x40
	adds r0, r7
	mov r8, r0
	adds r1, r5, 0
	adds r2, r6, 0
	bl CpuSet
	movs r0, 0x80
	adds r0, r7
	mov r9, r0
	adds r1, r7, 0
	adds r2, r6, 0
	bl CpuSet
	mov r0, sp
	strh r4, [r0]
	movs r5, 0x80
	lsls r5, 17
	orrs r5, r6
	mov r1, r8
	adds r2, r5, 0
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	strh r4, [r0]
	mov r1, r9
	adds r2, r5, 0
	bl CpuSet
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8004160

	thumb_func_start sub_80041D4
sub_80041D4: @ 80041D4
	push {lr}
	adds r2, r0, 0
	ldrb r0, [r2, 0x11]
	adds r1, r0, 0
	cmp r1, 0
	bne _080041E8
	strb r1, [r2, 0x10]
	adds r0, 0x10
	strb r0, [r2, 0x11]
	b _080041FE
_080041E8:
	ldrb r0, [r2, 0xC]
	movs r1, 0x2
	eors r0, r1
	movs r1, 0
	strb r0, [r2, 0xC]
	strb r1, [r2, 0x10]
	ldr r0, _08004204
	ldrb r1, [r0]
	adds r0, r2, 0
	bl sub_8004208
_080041FE:
	pop {r0}
	bx r0
	.align 2, 0
_08004204: .4byte 0x03000359
	thumb_func_end sub_80041D4

	thumb_func_start sub_8004208
sub_8004208: @ 8004208
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r5, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	movs r2, 0x2
	negs r2, r2
	movs r1, 0
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r5, 0x24]
	mov r8, r1
	add r8, r0
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 11
	ldr r4, [r5, 0x24]
	adds r4, r0
	lsls r0, r7, 3
	mov r9, r0
	adds r0, r4, 0
	mov r1, r8
	mov r2, r9
	bl CpuFastSet
	ldr r1, _08004314
	mov r10, r1
	ldr r0, [r1, 0x40]
	str r0, [sp, 0x8]
	add r0, sp, 0x8
	movs r6, 0x80
	lsls r6, 17
	mov r1, r9
	orrs r6, r1
	adds r1, r4, 0
	adds r2, r6, 0
	bl CpuFastSet
	ldrb r0, [r5, 0x9]
	lsls r0, 5
	adds r4, r0
	add r8, r0
	adds r0, r4, 0
	mov r1, r8
	mov r2, r9
	bl CpuFastSet
	mov r1, r10
	ldr r0, [r1, 0x40]
	str r0, [sp, 0xC]
	add r0, sp, 0xC
	adds r1, r4, 0
	adds r2, r6, 0
	bl CpuFastSet
	adds r0, r5, 0
	bl sub_8003AF8
	adds r4, r0, 0
	subs r4, 0x80
	mov r3, sp
	ldrh r2, [r5, 0x1C]
	ldrh r0, [r5, 0x1A]
	adds r2, r0
	ldrh r0, [r5, 0x14]
	lsrs r0, 3
	ldrb r1, [r5, 0x9]
	muls r0, r1
	adds r2, r0
	ldrb r1, [r5, 0x12]
	lsrs r1, 3
	adds r1, r2
	ldrb r0, [r5, 0x6]
	lsls r0, 12
	orrs r1, r0
	strh r1, [r3]
	mov r2, sp
	ldrb r0, [r5, 0x9]
	adds r1, r0
	strh r1, [r2, 0x2]
	ldrb r0, [r5, 0x9]
	adds r1, r0
	strh r1, [r2, 0x4]
	ldrb r0, [r5, 0x9]
	adds r1, r0
	strh r1, [r2, 0x6]
	movs r5, 0
	cmp r5, r7
	bcs _08004302
_080042CE:
	ldrh r1, [r3]
	adds r0, r1, 0x1
	strh r0, [r3]
	strh r1, [r4]
	adds r2, r4, 0
	adds r2, 0x40
	ldrh r1, [r3, 0x2]
	adds r0, r1, 0x1
	strh r0, [r3, 0x2]
	strh r1, [r2]
	adds r2, 0x40
	ldrh r1, [r3, 0x4]
	adds r0, r1, 0x1
	strh r0, [r3, 0x4]
	strh r1, [r2]
	adds r2, 0x40
	ldrh r1, [r3, 0x6]
	adds r0, r1, 0x1
	strh r0, [r3, 0x6]
	strh r1, [r2]
	adds r4, 0x2
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r7
	bcc _080042CE
_08004302:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004314: .4byte 0x03000360
	thumb_func_end sub_8004208

	thumb_func_start sub_8004318
sub_8004318: @ 8004318
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _08004348
	cmp r0, 0x1
	bgt _0800432C
	cmp r0, 0
	beq _08004332
	b _08004362
_0800432C:
	cmp r0, 0x2
	beq _08004358
	b _08004362
_08004332:
	ldr r0, _08004344
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_800436C
	movs r0, 0x2
	strh r0, [r4, 0x1C]
	b _08004362
	.align 2, 0
_08004344: .4byte 0x03000359
_08004348:
	ldr r0, _08004354
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_800436C
	b _08004362
	.align 2, 0
_08004354: .4byte 0x03000359
_08004358:
	ldr r0, _08004368
	ldrb r1, [r0]
	adds r0, r4, 0
	bl font_copy_to_vram_maybe
_08004362:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08004368: .4byte 0x03000359
	thumb_func_end sub_8004318

	thumb_func_start sub_800436C
sub_800436C: @ 800436C
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	movs r0, 0
	strb r0, [r4, 0x10]
	strb r0, [r4, 0x11]
	strb r0, [r4, 0xC]
	adds r0, r4, 0
	bl sub_8003AF8
	adds r5, r0, 0
	adds r0, r4, 0
	bl sub_800487C
	ldrb r1, [r4, 0x6]
	lsls r1, 12
	orrs r1, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
_08004396:
	movs r2, 0
	adds r4, r5, 0
	adds r4, 0x40
	adds r3, r0, 0x1
	cmp r2, r6
	bcs _080043B2
_080043A2:
	lsls r0, r2, 1
	adds r0, r5
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r6
	bcc _080043A2
_080043B2:
	adds r5, r4, 0
	lsls r0, r3, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _08004396
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_800436C

	thumb_func_start font_copy_to_vram_maybe
font_copy_to_vram_maybe: @ 80043C4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x10
	adds r6, r0, 0
	lsls r5, r1, 24
	lsrs r5, 24
	movs r0, 0
	strb r0, [r6, 0x10]
	strb r0, [r6, 0x11]
	strb r0, [r6, 0xC]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 11
	ldr r4, [r6, 0x24]
	adds r4, r0
	ldr r0, _08004454
	mov r8, r0
	ldr r0, [r0, 0x40]
	str r0, [sp]
	lsls r5, 3
	movs r0, 0x80
	lsls r0, 17
	orrs r5, r0
	mov r0, sp
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuFastSet
	ldrb r0, [r6, 0x9]
	lsls r0, 5
	adds r4, r0
	mov r1, r8
	ldr r0, [r1, 0x40]
	str r0, [sp, 0x4]
	add r0, sp, 0x4
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuFastSet
	ldrb r0, [r6, 0x9]
	lsls r0, 5
	adds r4, r0
	mov r1, r8
	ldr r0, [r1, 0x40]
	str r0, [sp, 0x8]
	add r0, sp, 0x8
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuFastSet
	ldrb r0, [r6, 0x9]
	lsls r0, 5
	adds r4, r0
	mov r1, r8
	ldr r0, [r1, 0x40]
	str r0, [sp, 0xC]
	add r0, sp, 0xC
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuFastSet
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004454: .4byte 0x03000360
	thumb_func_end font_copy_to_vram_maybe

	thumb_func_start DrawDownArrow
DrawDownArrow: @ 8004458
	push {r4-r7,lr}
	sub sp, 0x1C
	adds r5, r0, 0
	bl sub_8003FD0
	lsls r0, 24
	cmp r0, 0
	bne _0800446A
	b _080045BC
_0800446A:
	ldrh r0, [r5, 0x18]
	movs r1, 0xF0
	lsls r1, 4
	ands r1, r0
	lsrs r1, 2
	ldr r0, _08004488
	adds r7, r1, r0
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _08004492
	cmp r0, 0x1
	bgt _0800448C
	cmp r0, 0
	beq _080044E2
	b _080045BC
	.align 2, 0
_08004488: .4byte gUnknown_081E5EF0
_0800448C:
	cmp r0, 0x2
	beq _080044E2
	b _080045BC
_08004492:
	ldrh r0, [r5, 0x1A]
	adds r0, 0xFE
	lsls r0, 16
	lsrs r6, r0, 16
	ldrb r0, [r5, 0x1]
	cmp r0, 0
	beq _080044A4
	cmp r0, 0x3
	bne _080044A8
_080044A4:
	lsls r0, r6, 17
	lsrs r6, r0, 16
_080044A8:
	lsls r0, r6, 5
	ldr r4, [r5, 0x24]
	adds r4, r0
	ldrb r2, [r5, 0x3]
	ldrb r3, [r5, 0x5]
	ldrb r0, [r5, 0x4]
	str r0, [sp]
	adds r0, r7, 0
	adds r1, r4, 0
	bl sub_8003BCC
	adds r0, r7, 0
	adds r0, 0x20
	adds r4, 0x20
	ldrb r2, [r5, 0x3]
	ldrb r3, [r5, 0x5]
	ldrb r1, [r5, 0x4]
	str r1, [sp]
	adds r1, r4, 0
	bl sub_8003BCC
	adds r2, r6, 0x1
	lsls r2, 16
	lsrs r2, 16
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_80039EC
	b _080045BC
_080044E2:
	add r1, sp, 0x4
	ldrb r0, [r5]
	strb r0, [r1]
	adds r2, r1, 0
	ldrb r0, [r5, 0x10]
	ldrb r1, [r5, 0x12]
	adds r0, r1
	movs r1, 0x7
	ands r0, r1
	strb r0, [r2, 0x1]
	cmp r0, 0
	beq _08004556
	ldrb r0, [r5, 0x1]
	ldrb r1, [r5, 0x2]
	add r3, sp, 0x14
	add r2, sp, 0x18
	str r2, [sp]
	movs r2, 0
	bl sub_8003A1C
	add r2, sp, 0x4
	adds r0, r2, 0
	ldrb r1, [r0, 0x1]
	movs r0, 0x8
	subs r0, r1
	strb r0, [r2, 0x2]
	ldr r0, [sp, 0x14]
	str r0, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r5, 0x24]
	adds r1, r0
	str r1, [sp, 0xC]
	ldr r0, _080045B0
	str r0, [sp, 0x10]
	add r0, sp, 0x4
	bl CopyGlyphToWindow
	ldr r0, [sp, 0x18]
	str r0, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x1
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r5, 0x24]
	adds r1, r0
	str r1, [sp, 0xC]
	add r0, sp, 0x4
	bl CopyGlyphToWindow
_08004556:
	add r1, sp, 0x4
	movs r0, 0x8
	strb r0, [r1, 0x2]
	str r7, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r5, 0x24]
	adds r1, r0
	str r1, [sp, 0xC]
	ldr r0, _080045B0
	str r0, [sp, 0x10]
	add r0, sp, 0x4
	bl CopyGlyphToWindow
	ldr r0, [sp, 0x8]
	adds r0, 0x20
	str r0, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x1
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r5, 0x24]
	adds r1, r0
	str r1, [sp, 0xC]
	add r0, sp, 0x4
	bl CopyGlyphToWindow
	add r0, sp, 0x4
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080045B4
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8006954
	b _080045BC
	.align 2, 0
_080045B0: .4byte 0x030003a4
_080045B4:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8006954
_080045BC:
	add sp, 0x1C
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end DrawDownArrow

	thumb_func_start DialogueWaitForInput
DialogueWaitForInput: @ 80045C4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0x1
	bl sub_8003FD0
	lsls r0, 24
	cmp r0, 0
	bne _080045E2
	ldrb r0, [r4, 0xD]
	subs r0, 0x1
	strb r0, [r4, 0xD]
	lsls r0, 24
	cmp r0, 0
	beq _080045F4
	b _08004600
_080045E2:
	ldr r0, _080045FC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08004600
	movs r0, 0x5
	bl audio_play
_080045F4:
	adds r0, r4, 0
	bl sub_8004658
	b _08004608
	.align 2, 0
_080045FC: .4byte 0x03001770
_08004600:
	adds r0, r4, 0
	bl DrawMovingDownArrow
	movs r5, 0
_08004608:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end DialogueWaitForInput

	thumb_func_start DrawInitialDownArrow
DrawInitialDownArrow: @ 8004610
	push {lr}
	movs r1, 0
	strh r1, [r0, 0x18]
	bl DrawDownArrow
	pop {r0}
	bx r0
	thumb_func_end DrawInitialDownArrow

	thumb_func_start DrawMovingDownArrow
DrawMovingDownArrow: @ 8004620
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrh r1, [r6, 0x18]
	movs r0, 0xF0
	lsls r0, 4
	ands r0, r1
	lsrs r4, r0, 8
	movs r5, 0xF
	ands r5, r1
	adds r5, 0x1
	cmp r5, 0x6
	bne _0800464C
	movs r5, 0
	adds r4, 0x1
	cmp r4, 0x3
	bls _08004642
	movs r4, 0
_08004642:
	lsls r0, r4, 8
	strh r0, [r6, 0x18]
	adds r0, r6, 0
	bl DrawDownArrow
_0800464C:
	lsls r0, r4, 8
	orrs r0, r5
	strh r0, [r6, 0x18]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end DrawMovingDownArrow

	thumb_func_start sub_8004658
sub_8004658: @ 8004658
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r4, 0x18]
	adds r0, r4, 0
	bl sub_8003FD0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08004674
	adds r0, r4, 0
	bl sub_8003D30
_08004674:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8004658

	thumb_func_start sub_800467C
sub_800467C: @ 800467C
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	ldr r0, [r0, 0x28]
	lsrs r2, 19
	adds r2, r1
	lsls r2, 1
	adds r2, r0
	ldrh r0, [r2]
	bx lr
	thumb_func_end sub_800467C

	thumb_func_start sub_8004690
sub_8004690: @ 8004690
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, [sp, 0x1C]
	ldr r5, [sp, 0x20]
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r3, 24
	mov r12, r3
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r9, r5
	lsls r1, r3, 6
	ldr r0, [r0, 0x28]
	adds r2, r0, r1
	mov r1, r8
	cmp r1, r4
	bhi _080046D2
_080046C2:
	lsls r0, r1, 1
	adds r0, r2
	strh r6, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r4
	bls _080046C2
_080046D2:
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	mov r3, r9
	subs r3, 0x1
	cmp r1, r3
	bge _080046FC
	mov r0, r8
	lsls r7, r0, 1
	lsls r5, r4, 1
_080046E8:
	adds r2, 0x40
	adds r0, r7, r2
	strh r6, [r0]
	adds r0, r5, r2
	strh r6, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r3
	blt _080046E8
_080046FC:
	cmp r12, r9
	beq _08004718
	adds r2, 0x40
	mov r1, r8
	cmp r1, r4
	bhi _08004718
_08004708:
	lsls r0, r1, 1
	adds r0, r2
	strh r6, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r4
	bls _08004708
_08004718:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8004690

	thumb_func_start sub_8004724
sub_8004724: @ 8004724
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r1, 0
	ldr r4, [sp, 0x18]
	ldr r5, [sp, 0x1C]
	lsls r6, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldrb r1, [r0, 0x6]
	lsls r1, 28
	orrs r1, r6
	lsrs r1, 16
	str r4, [sp]
	str r5, [sp, 0x4]
	bl sub_8004690
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8004724

	thumb_func_start sub_8004758
sub_8004758: @ 8004758
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, [sp, 0x1C]
	ldr r5, [sp, 0x20]
	lsls r1, 16
	lsrs r1, 16
	mov r12, r1
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r3, 24
	adds r2, r3, 0
	lsls r4, 24
	lsrs r6, r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r9, r5
	lsls r1, r2, 6
	ldr r0, [r0, 0x28]
	adds r4, r0, r1
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r2, r9
	bhi _080047BA
_08004790:
	mov r1, r8
	adds r5, r3, 0x1
	adds r2, r4, 0
	adds r2, 0x40
	cmp r1, r6
	bhi _080047AE
_0800479C:
	lsls r0, r1, 1
	adds r0, r4
	mov r7, r12
	strh r7, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r6
	bls _0800479C
_080047AE:
	adds r4, r2, 0
	adds r1, r3, 0
	lsls r0, r5, 24
	lsrs r3, r0, 24
	cmp r1, r9
	bls _08004790
_080047BA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8004758

	thumb_func_start sub_80047C8
sub_80047C8: @ 80047C8
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r1, 0
	ldr r4, [sp, 0x18]
	ldr r5, [sp, 0x1C]
	lsls r6, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldrb r1, [r0, 0x6]
	lsls r1, 28
	orrs r1, r6
	lsrs r1, 16
	str r4, [sp]
	str r5, [sp, 0x4]
	bl sub_8004758
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80047C8

	thumb_func_start sub_80047FC
sub_80047FC: @ 80047FC
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r1, 0
	adds r5, r2, 0
	ldr r1, [sp, 0x14]
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r1, 24
	lsrs r1, 24
	str r3, [sp]
	str r1, [sp, 0x4]
	movs r1, 0
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_80047C8
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80047FC

	thumb_func_start sub_800482C
sub_800482C: @ 800482C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	mov r9, r0
	adds r6, r1, 0
	mov r8, r2
	adds r4, r3, 0
	ldr r5, [sp, 0x20]
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r0, r9
	bl sub_800487C
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r4, [sp]
	str r5, [sp, 0x4]
	mov r0, r9
	adds r2, r6, 0
	mov r3, r8
	bl sub_80047C8
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_800482C

	thumb_func_start sub_800487C
sub_800487C: @ 800487C
	push {lr}
	ldrh r2, [r0, 0x1A]
	ldrb r1, [r0]
	cmp r1, 0x1
	beq _08004892
	cmp r1, 0x1
	ble _080048D0
	cmp r1, 0x2
	bne _080048D0
	adds r0, r2, 0x1
	b _080048C8
_08004892:
	ldrb r0, [r0, 0x1]
	cmp r0, 0x6
	bhi _080048CE
	lsls r0, 2
	ldr r1, _080048A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080048A4: .4byte _080048A8
	.align 2, 0
_080048A8:
	.4byte _080048D0
	.4byte _080048C4
	.4byte _080048C4
	.4byte _080048D0
	.4byte _080048C4
	.4byte _080048C4
	.4byte _080048D0
_080048C4:
	adds r0, r2, 0
	adds r0, 0xD4
_080048C8:
	lsls r0, 16
	lsrs r2, r0, 16
	b _080048D0
_080048CE:
	movs r2, 0
_080048D0:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_800487C

	thumb_func_start sub_80048D8
sub_80048D8: @ 80048D8
	adds r3, r0, 0
	lsls r2, 24
	lsrs r2, 24
	strb r1, [r3, 0x10]
	movs r1, 0xF8
	ands r2, r1
	strb r2, [r3, 0x11]
	bx lr
	thumb_func_end sub_80048D8

	thumb_func_start GetGlyphWidth
GetGlyphWidth: @ 80048E8
	push {lr}
	adds r2, r0, 0
	adds r3, r1, 0
	movs r1, 0x8
	ldrb r0, [r2, 0x2]
	cmp r0, 0x2
	bne _08004966
	ldrb r1, [r2, 0xE]
	cmp r1, 0
	bne _08004966
	ldrb r0, [r2, 0x1]
	cmp r0, 0x6
	bhi _08004964
	lsls r0, 2
	ldr r1, _0800490C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800490C: .4byte _08004910
	.align 2, 0
_08004910:
	.4byte _0800493C
	.4byte _08004948
	.4byte _08004948
	.4byte _0800492C
	.4byte _08004934
	.4byte _08004934
	.4byte _08004964
_0800492C:
	ldr r0, _08004930
	b _0800493E
	.align 2, 0
_08004930: .4byte gUnknown_081E6594
_08004934:
	ldr r2, _08004938
	b _0800494A
	.align 2, 0
_08004938: .4byte gUnknown_081E63BA
_0800493C:
	ldr r0, _08004944
_0800493E:
	adds r0, r3, r0
	ldrb r1, [r0]
	b _08004966
	.align 2, 0
_08004944: .4byte gUnknown_081E6496
_08004948:
	ldr r2, _0800495C
_0800494A:
	ldr r1, _08004960
	lsls r0, r3, 1
	adds r0, 0x1
	adds r0, r1
	ldrb r0, [r0]
	adds r0, r2
	ldrb r1, [r0]
	b _08004966
	.align 2, 0
_0800495C: .4byte gUnknown_081E62DE
_08004960: .4byte gUnknown_081E5FF0
_08004964:
	movs r1, 0x8
_08004966:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end GetGlyphWidth

	thumb_func_start GetExtCtrlCodeLength
GetExtCtrlCodeLength: @ 800496C
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0
	cmp r1, 0x16
	bhi _0800497E
	ldr r0, _08004984
	adds r0, r1, r0
	ldrb r0, [r0]
_0800497E:
	pop {r1}
	bx r1
	.align 2, 0
_08004984: .4byte gUnknown_081E6BDB
	thumb_func_end GetExtCtrlCodeLength

	thumb_func_start sub_8004988
sub_8004988: @ 8004988
	push {r4-r6,lr}
	sub sp, 0x10
	adds r5, r0, 0
	adds r4, r1, 0
	adds r1, r2, 0
	ldr r0, [sp, 0x20]
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	cmp r0, 0x1
	beq _080049C4
	cmp r0, 0x1
	bgt _080049AC
	cmp r0, 0
	beq _080049B2
	b _08004A3C
_080049AC:
	cmp r2, 0x2
	beq _080049F4
	b _08004A3C
_080049B2:
	mov r0, sp
	bl ConvertIntToDecimalString
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r4, r0, 0
	b _08004A2C
_080049C4:
	mov r0, sp
	bl ConvertIntToDecimalString
	adds r0, r5, 0
	mov r1, sp
	bl GetStringWidth
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, r5
	bls _080049E8
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x13
	strb r0, [r4, 0x1]
	subs r0, r6, r5
	strb r0, [r4, 0x2]
	adds r4, 0x3
_080049E8:
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r4, r0, 0
	b _08004A3C
_080049F4:
	mov r0, sp
	bl ConvertIntToDecimalString
	adds r0, r5, 0
	mov r1, sp
	bl GetStringWidth
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, r5
	bls _08004A1E
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x13
	strb r0, [r4, 0x1]
	subs r0, r6, r5
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strb r0, [r4, 0x2]
	adds r4, 0x3
_08004A1E:
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r4, r0, 0
	cmp r6, r5
	bls _08004A3C
_08004A2C:
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x13
	strb r0, [r4, 0x1]
	strb r6, [r4, 0x2]
	adds r4, 0x3
	movs r0, 0xFF
	strb r0, [r4]
_08004A3C:
	adds r0, r4, 0
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8004988

	thumb_func_start sub_8004A48
sub_8004A48: @ 8004A48
	push {r4-r6,lr}
	sub sp, 0x10
	adds r5, r0, 0
	adds r4, r1, 0
	adds r1, r2, 0
	ldr r0, [sp, 0x20]
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	cmp r0, 0x1
	beq _08004A9A
	cmp r0, 0x1
	bgt _08004A6C
	cmp r0, 0
	beq _08004A72
	b _08004B1A
_08004A6C:
	cmp r2, 0x2
	beq _08004ACA
	b _08004B1A
_08004A72:
	mov r0, sp
	bl ConvertIntToDecimalString
	adds r0, r5, 0
	mov r1, sp
	bl GetStringWidth
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r4, r0, 0
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x11
	strb r0, [r4, 0x1]
	subs r0, r6, r5
	b _08004B12
_08004A9A:
	mov r0, sp
	bl ConvertIntToDecimalString
	adds r0, r5, 0
	mov r1, sp
	bl GetStringWidth
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, r5
	bls _08004ABE
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x11
	strb r0, [r4, 0x1]
	subs r0, r6, r5
	strb r0, [r4, 0x2]
	adds r4, 0x3
_08004ABE:
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r4, r0, 0
	b _08004B1A
_08004ACA:
	mov r0, sp
	bl ConvertIntToDecimalString
	adds r0, r5, 0
	mov r1, sp
	bl GetStringWidth
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, r5
	bls _08004AF4
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x11
	strb r0, [r4, 0x1]
	subs r0, r6, r5
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strb r0, [r4, 0x2]
	adds r4, 0x3
_08004AF4:
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r4, r0, 0
	cmp r6, r5
	bls _08004B1A
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x11
	strb r0, [r4, 0x1]
	subs r0, r6, r5
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
_08004B12:
	strb r0, [r4, 0x2]
	adds r4, 0x3
	movs r0, 0xFF
	strb r0, [r4]
_08004B1A:
	adds r0, r4, 0
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8004A48

	thumb_func_start sub_8004B24
sub_8004B24: @ 8004B24
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r7, r2, 0
	ldr r0, [sp, 0x14]
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x1
	beq _08004B58
	cmp r0, 0x1
	bgt _08004B46
	cmp r0, 0
	beq _08004B4C
	b _08004BC4
_08004B46:
	cmp r1, 0x2
	beq _08004B82
	b _08004BC4
_08004B4C:
	adds r0, r4, 0
	adds r1, r7, 0
	bl StringCopy
	adds r4, r0, 0
	b _08004BB4
_08004B58:
	adds r0, r5, 0
	adds r1, r7, 0
	bl GetStringWidth
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, r5
	bls _08004B76
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x13
	strb r0, [r4, 0x1]
	subs r0, r6, r5
	strb r0, [r4, 0x2]
	adds r4, 0x3
_08004B76:
	adds r0, r4, 0
	adds r1, r7, 0
	bl StringCopy
	adds r4, r0, 0
	b _08004BC4
_08004B82:
	adds r0, r5, 0
	adds r1, r7, 0
	bl GetStringWidth
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, r5
	bls _08004BA6
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x13
	strb r0, [r4, 0x1]
	subs r0, r6, r5
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strb r0, [r4, 0x2]
	adds r4, 0x3
_08004BA6:
	adds r0, r4, 0
	adds r1, r7, 0
	bl StringCopy
	adds r4, r0, 0
	cmp r6, r5
	bls _08004BC4
_08004BB4:
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x13
	strb r0, [r4, 0x1]
	strb r6, [r4, 0x2]
	adds r4, 0x3
	movs r0, 0xFF
	strb r0, [r4]
_08004BC4:
	adds r0, r4, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8004B24

	thumb_func_start GetStringWidth
GetStringWidth: @ 8004BCC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r5, r0, 0
	adds r7, r1, 0
	movs r2, 0
	ldrb r0, [r5, 0x1]
	mov r10, r0
	ldrb r1, [r5, 0x2]
	mov r9, r1
	ldrb r0, [r5, 0xE]
	mov r8, r0
	movs r6, 0
	ldrb r0, [r7]
	cmp r0, 0xFF
	beq _08004CE6
_08004BF2:
	adds r0, r7, r6
	ldrb r1, [r0]
	cmp r1, 0xFC
	beq _08004C22
	cmp r1, 0xFD
	bne _08004CCC
	adds r6, 0x1
	ldrb r4, [r5, 0x2]
	adds r0, r7, r6
	ldrb r0, [r0]
	str r2, [sp]
	bl GetExpandedPlaceholder
	adds r1, r0, 0
	adds r0, r5, 0
	bl GetStringWidth
	ldr r2, [sp]
	adds r0, r2, r0
	lsls r0, 24
	lsrs r2, r0, 24
	strb r4, [r5, 0x2]
	adds r6, 0x1
	b _08004CDE
_08004C22:
	adds r6, 0x1
	adds r0, r7, r6
	ldrb r0, [r0]
	subs r0, 0x6
	cmp r0, 0x10
	bhi _08004CB8
	lsls r0, 2
	ldr r1, _08004C38
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08004C38: .4byte _08004C3C
	.align 2, 0
_08004C3C:
	.4byte _08004C80
	.4byte _08004C88
	.4byte _08004CB8
	.4byte _08004CB8
	.4byte _08004CB8
	.4byte _08004CB8
	.4byte _08004CB8
	.4byte _08004CB8
	.4byte _08004CB8
	.4byte _08004CB8
	.4byte _08004CB8
	.4byte _08004C90
	.4byte _08004C9C
	.4byte _08004C9C
	.4byte _08004CA8
	.4byte _08004CB0
	.4byte _08004CB4
_08004C80:
	adds r0, r6, r7
	ldrb r0, [r0, 0x1]
	strb r0, [r5, 0x1]
	b _08004CB8
_08004C88:
	ldr r0, [r5, 0x2C]
	ldrb r0, [r0, 0x8]
	strb r0, [r5, 0x1]
	b _08004CB8
_08004C90:
	adds r0, r6, r7
	ldrb r0, [r0, 0x1]
	adds r0, r2, r0
	lsls r0, 24
	lsrs r2, r0, 24
	b _08004CB8
_08004C9C:
	adds r0, r6, r7
	ldrb r1, [r0, 0x1]
	cmp r2, r1
	bcs _08004CB8
	ldrb r2, [r0, 0x1]
	b _08004CB8
_08004CA8:
	adds r0, r6, r7
	ldrb r0, [r0, 0x1]
	strb r0, [r5, 0xE]
	b _08004CB8
_08004CB0:
	movs r0, 0x1
	b _08004CB6
_08004CB4:
	movs r0, 0x2
_08004CB6:
	strb r0, [r5, 0x2]
_08004CB8:
	adds r0, r7, r6
	ldrb r0, [r0]
	str r2, [sp]
	bl GetExtCtrlCodeLength
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0
	ldr r2, [sp]
	b _08004CDE
_08004CCC:
	adds r6, 0x1
	adds r0, r5, 0
	str r2, [sp]
	bl GetGlyphWidth
	ldr r2, [sp]
	adds r0, r2, r0
	lsls r0, 24
	lsrs r2, r0, 24
_08004CDE:
	adds r0, r7, r6
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08004BF2
_08004CE6:
	mov r0, r8
	strb r0, [r5, 0xE]
	mov r1, r9
	strb r1, [r5, 0x2]
	mov r0, r10
	strb r0, [r5, 0x1]
	adds r0, r2, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetStringWidth

	thumb_func_start AddTextPrinterParametrized2
AddTextPrinterParametrized2: @ 8004D04
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, [sp, 0x14]
	ldr r4, [sp, 0x18]
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	str r4, [sp, 0x4]
	adds r0, r5, 0
	bl sub_8002E4C
	adds r0, r5, 0
	bl sub_8002F44
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end AddTextPrinterParametrized2

	thumb_func_start sub_8004D38
sub_8004D38: @ 8004D38
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	mov r9, r0
	mov r8, r1
	adds r6, r2, 0
	adds r4, r3, 0
	ldr r5, [sp, 0x20]
	lsls r6, 16
	lsrs r6, 16
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	bl GetStringWidth
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r7, 0x7
	lsrs r0, 3
	subs r4, r0
	lsls r4, 24
	lsrs r4, 24
	str r5, [sp]
	mov r0, r9
	mov r1, r8
	adds r2, r6, 0
	adds r3, r4, 0
	bl CreateTextRenderer
	mov r0, r9
	bl sub_8003D30
	movs r0, 0x7
	ands r7, r0
	cmp r7, 0
	beq _08004D8E
	movs r0, 0x8
	subs r0, r7
	lsls r0, 24
	lsrs r7, r0, 24
_08004D8E:
	mov r0, r9
	adds r1, r7, 0
	movs r2, 0
	bl sub_80048D8
	mov r0, r9
	bl sub_8002F44
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8004D38

	thumb_func_start sub_8004DB0
sub_8004DB0: @ 8004DB0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	mov r8, r0
	mov r9, r1
	adds r4, r3, 0
	ldr r6, [sp, 0x20]
	ldr r5, [sp, 0x24]
	lsls r2, 16
	lsrs r2, 16
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 16
	str r2, [sp, 0x4]
	bl GetStringWidth
	lsrs r5, 17
	lsls r0, 24
	lsrs r0, 25
	subs r5, r0
	lsls r5, 24
	lsrs r5, 24
	lsrs r0, r5, 3
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	str r6, [sp]
	mov r0, r8
	mov r1, r9
	ldr r2, [sp, 0x4]
	adds r3, r4, 0
	bl CreateTextRenderer
	mov r0, r8
	bl sub_8003D30
	movs r1, 0x7
	ands r1, r5
	mov r0, r8
	movs r2, 0
	bl sub_80048D8
	mov r0, r8
	bl sub_8002F44
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8004DB0

	thumb_func_start sub_8004E24
sub_8004E24: @ 8004E24
	ldrb r0, [r0, 0x6]
	bx lr
	thumb_func_end sub_8004E24

	thumb_func_start sub_8004E28
sub_8004E28: @ 8004E28
	push {r4,lr}
	ldrb r4, [r0, 0x3]
	strb r4, [r1]
	ldrb r1, [r0, 0x4]
	strb r1, [r2]
	ldrb r0, [r0, 0x5]
	strb r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8004E28

	thumb_func_start sub_8004E3C
sub_8004E3C: @ 8004E3C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r1, 0
	adds r1, r2, 0
	ldr r4, _08004E68
	str r0, [r4, 0x2C]
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0
	bl CreateTextRenderer
	str r5, [r4, 0x24]
	adds r0, r4, 0
	bl sub_8002F44
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08004E68: .4byte 0x03000328
	thumb_func_end sub_8004E3C

	thumb_func_start GetStringWidthGivenTextRendererTemplate
GetStringWidthGivenTextRendererTemplate: @ 8004E6C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r1, 0
	ldr r4, _08004E98
	str r0, [r4, 0x2C]
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0
	bl CreateTextRenderer
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetStringWidth
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08004E98: .4byte 0x03000328
	thumb_func_end GetStringWidthGivenTextRendererTemplate

	thumb_func_start StopMusicWhileStringIsPrinted
StopMusicWhileStringIsPrinted: @ 8004E9C
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x1
	bne _08004EFC
	bl StripExtendedControlCodes
	adds r0, r4, 0
	bl StringGetLength
	lsls r0, 24
	lsrs r2, r0, 24
	adds r1, r2, 0
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	adds r1, r4, r1
	movs r0, 0xFC
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r4, r3
	movs r0, 0x16
	strb r0, [r3]
	adds r0, r2, 0x1
	lsls r0, 24
	adds r2, r4, r2
	movs r1, 0xFF
	strb r1, [r2]
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	b _08004EEE
_08004EE4:
	adds r1, r2, r4
	ldrb r0, [r1]
	strb r0, [r1, 0x2]
	subs r0, r2, 0x1
	lsls r0, 24
_08004EEE:
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _08004EE4
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x15
	strb r0, [r4, 0x1]
_08004EFC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end StopMusicWhileStringIsPrinted

	thumb_func_start StripExtendedControlCodes
StripExtendedControlCodes: @ 8004F04
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r4, 0
	movs r6, 0
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _08004F54
_08004F12:
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, 0xFC
	bne _08004F34
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r5, r4
	ldrb r0, [r0]
	bl GetExtCtrlCodeLength
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
	b _08004F4C
_08004F34:
	adds r2, r6, 0
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	adds r2, r5, r2
	adds r1, r4, 0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r1, r5, r1
	ldrb r0, [r1]
	strb r0, [r2]
_08004F4C:
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08004F12
_08004F54:
	adds r1, r5, r6
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end StripExtendedControlCodes

	thumb_func_start SkipExtendedControlCode
SkipExtendedControlCode: @ 8004F60
	push {r4,lr}
	adds r4, r0, 0
	b _08004F74
_08004F66:
	adds r4, 0x1
	ldrb r0, [r4]
	bl GetExtCtrlCodeLength
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0
_08004F74:
	ldrb r0, [r4]
	cmp r0, 0xFC
	beq _08004F66
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end SkipExtendedControlCode

	thumb_func_start CompareStringWithoutExtendedControlCodes
CompareStringWithoutExtendedControlCodes: @ 8004F84
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r6, 0
	b _08004FA6
_08004F8E:
	cmp r1, r0
	bcs _08004F9C
	movs r6, 0x1
	negs r6, r6
	cmp r0, 0xFF
	bne _08004F9C
	movs r6, 0x1
_08004F9C:
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _08004FC6
	adds r4, 0x1
	adds r5, 0x1
_08004FA6:
	adds r0, r4, 0
	bl SkipExtendedControlCode
	adds r4, r0, 0
	adds r0, r5, 0
	bl SkipExtendedControlCode
	adds r5, r0, 0
	ldrb r1, [r4]
	ldrb r0, [r5]
	cmp r1, r0
	bls _08004F8E
	movs r6, 0x1
	cmp r1, 0xFF
	bne _08004FC6
	subs r6, 0x2
_08004FC6:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CompareStringWithoutExtendedControlCodes

	thumb_func_start sub_8004FD0
sub_8004FD0: @ 8004FD0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	mov r10, r0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r0, [sp, 0x38]
	ldr r1, [sp, 0x3C]
	ldr r2, [sp, 0x40]
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0x8]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0xC]
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x10]
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	movs r7, 0
	cmp r5, 0
	bne _08005008
	ldr r5, _0800500C
_08005008:
	str r5, [sp, 0x14]
	b _0800505A
	.align 2, 0
_0800500C: .4byte 0x020234cc
_08005010:
	ldrb r1, [r6]
	cmp r1, 0xFC
	beq _08005024
	cmp r1, 0xFE
	beq _08005042
	strb r1, [r5]
	adds r5, 0x1
	adds r6, 0x1
	movs r0, 0x1
	b _0800505C
_08005024:
	ldrb r0, [r6, 0x1]
	bl GetExtCtrlCodeLength
	adds r4, r0, 0
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl memcpy
	adds r5, r4
	adds r6, r4
	b _0800505E
_08005042:
	movs r0, 0xFC
	strb r0, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	mov r0, r9
	strb r0, [r5, 0x2]
	strb r1, [r5, 0x3]
	adds r5, 0x4
	adds r6, 0x1
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_0800505A:
	movs r0, 0
_0800505C:
	mov r8, r0
_0800505E:
	ldrb r0, [r6]
	cmp r0, 0xFF
	bne _08005010
	movs r0, 0xFC
	strb r0, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	mov r0, r9
	strb r0, [r5, 0x2]
	movs r0, 0xFF
	strb r0, [r5, 0x3]
	mov r0, r8
	cmp r0, 0
	beq _08005080
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
_08005080:
	ldr r0, [sp, 0x10]
	str r0, [sp]
	ldr r0, [sp, 0x44]
	str r0, [sp, 0x4]
	mov r0, r10
	ldr r1, [sp, 0x14]
	ldr r2, [sp, 0x8]
	ldr r3, [sp, 0xC]
	bl sub_8002E4C
	mov r0, r10
	bl sub_8002F44
	adds r0, r7, 0
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8004FD0

	thumb_func_start sub_80050AC
sub_80050AC: @ 80050AC
	push {r4-r7,lr}
	sub sp, 0x8
	adds r7, r0, 0
	ldr r6, _08005144
	ldr r5, [r7, 0x8]
	ldrb r0, [r7, 0x2]
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 5
	ldrb r1, [r7, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08005148
	adds r0, r1
	adds r2, r0
	ldr r1, [r2]
	ldr r0, [r2, 0x8]
	orrs r1, r0
	ldr r0, [r5]
	ands r0, r1
	str r0, [r6]
	ldr r0, [r5, 0x4]
	ands r0, r1
	str r0, [r6, 0x4]
	ldr r0, [r5, 0x8]
	ands r0, r1
	str r0, [r6, 0x8]
	ldr r0, [r5, 0xC]
	ands r0, r1
	str r0, [r6, 0xC]
	ldr r0, [r5, 0x10]
	ands r0, r1
	str r0, [r6, 0x10]
	ldr r0, [r5, 0x14]
	ands r0, r1
	str r0, [r6, 0x14]
	ldr r0, [r5, 0x18]
	ands r0, r1
	str r0, [r6, 0x18]
	ldr r0, [r5, 0x1C]
	ands r0, r1
	str r0, [r6, 0x1C]
	ldrb r0, [r7, 0x1]
	ldrb r1, [r7, 0x2]
	adds r0, r1
	cmp r0, 0x8
	ble _0800517C
	ldr r1, [r2, 0x4]
	ldrb r0, [r7]
	cmp r0, 0x2
	bne _0800514C
	ldr r0, [r5, 0x20]
	ands r0, r1
	str r0, [r6, 0x20]
	ldr r0, [r5, 0x24]
	ands r0, r1
	str r0, [r6, 0x24]
	ldr r0, [r5, 0x28]
	ands r0, r1
	str r0, [r6, 0x28]
	ldr r0, [r5, 0x2C]
	ands r0, r1
	str r0, [r6, 0x2C]
	ldr r0, [r5, 0x30]
	ands r0, r1
	str r0, [r6, 0x30]
	ldr r0, [r5, 0x34]
	ands r0, r1
	str r0, [r6, 0x34]
	ldr r0, [r5, 0x38]
	ands r0, r1
	str r0, [r6, 0x38]
	ldr r0, [r5, 0x3C]
	b _08005178
	.align 2, 0
_08005144: .4byte 0x03000360
_08005148: .4byte gUnknown_081E66DC
_0800514C:
	ldr r0, [r5, 0x40]
	ands r0, r1
	str r0, [r6, 0x20]
	ldr r0, [r5, 0x44]
	ands r0, r1
	str r0, [r6, 0x24]
	ldr r0, [r5, 0x48]
	ands r0, r1
	str r0, [r6, 0x28]
	ldr r0, [r5, 0x4C]
	ands r0, r1
	str r0, [r6, 0x2C]
	ldr r0, [r5, 0x50]
	ands r0, r1
	str r0, [r6, 0x30]
	ldr r0, [r5, 0x54]
	ands r0, r1
	str r0, [r6, 0x34]
	ldr r0, [r5, 0x58]
	ands r0, r1
	str r0, [r6, 0x38]
	ldr r0, [r5, 0x5C]
_08005178:
	ands r0, r1
	str r0, [r6, 0x3C]
_0800517C:
	ldr r1, [r7, 0xC]
	ldr r0, [r1]
	str r0, [sp]
	ldr r0, [r1, 0x3C]
	str r0, [sp, 0x4]
	ldr r1, _08005200
	ldrb r0, [r7, 0x2]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r7, 0x4]
	ldrb r3, [r7, 0x1]
	ldr r4, [r0]
	adds r0, r6, 0
	mov r2, sp
	bl _call_via_r4
	ldr r0, [r6]
	str r0, [r5]
	ldr r0, [r6, 0x4]
	str r0, [r5, 0x4]
	ldr r0, [r6, 0x8]
	str r0, [r5, 0x8]
	ldr r0, [r6, 0xC]
	str r0, [r5, 0xC]
	ldr r0, [r6, 0x10]
	str r0, [r5, 0x10]
	ldr r0, [r6, 0x14]
	str r0, [r5, 0x14]
	ldr r0, [r6, 0x18]
	str r0, [r5, 0x18]
	ldr r0, [r6, 0x1C]
	str r0, [r5, 0x1C]
	ldrb r0, [r7, 0x1]
	ldrb r1, [r7, 0x2]
	adds r0, r1
	cmp r0, 0x8
	ble _080051EE
	ldrb r0, [r7]
	cmp r0, 0x2
	beq _080051CE
	adds r5, 0x20
_080051CE:
	ldr r0, [r6, 0x20]
	str r0, [r5, 0x20]
	ldr r0, [r6, 0x24]
	str r0, [r5, 0x24]
	ldr r0, [r6, 0x28]
	str r0, [r5, 0x28]
	ldr r0, [r6, 0x2C]
	str r0, [r5, 0x2C]
	ldr r0, [r6, 0x30]
	str r0, [r5, 0x30]
	ldr r0, [r6, 0x34]
	str r0, [r5, 0x34]
	ldr r0, [r6, 0x38]
	str r0, [r5, 0x38]
	ldr r0, [r6, 0x3C]
	str r0, [r5, 0x3C]
_080051EE:
	ldrb r1, [r7, 0x1]
	ldrb r0, [r7, 0x2]
	adds r0, r1, r0
	asrs r0, 3
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08005200: .4byte gUnknown_081E6BF4
	thumb_func_end sub_80050AC

	thumb_func_start nullsub_33
nullsub_33: @ 8005204
	bx lr
	thumb_func_end nullsub_33

	thumb_func_start sub_8005208
sub_8005208: @ 8005208
	push {r4-r7,lr}
	mov r12, r0
	adds r7, r1, 0
	adds r6, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _08005250
	adds r5, r3, r0
	movs r4, 0
_0800521A:
	adds r0, r7, r4
	ldrb r0, [r0]
	lsrs r0, 7
	lsls r0, 2
	adds r0, r6
	ldr r3, [r0]
	lsls r2, r4, 2
	add r2, r12
	ldr r0, [r5]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r5, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _0800521A
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005250: .4byte gUnknown_081E6A3C
	thumb_func_end sub_8005208

	thumb_func_start sub_8005254
sub_8005254: @ 8005254
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r12, r1
	adds r6, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _080052BC
	adds r5, r3, r0
	movs r4, 0
	movs r7, 0x1
_0800526C:
	mov r1, r12
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r0, 24
	lsrs r1, r0, 31
	ands r1, r7
	lsls r1, 2
	adds r1, r6
	lsrs r0, 30
	ands r0, r7
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsls r2, r4, 2
	add r2, r8
	ldr r0, [r5]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r5, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _0800526C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080052BC: .4byte gUnknown_081E6A3C
	thumb_func_end sub_8005254

	thumb_func_start sub_80052C0
sub_80052C0: @ 80052C0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r12, r1
	adds r4, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _08005344
	adds r7, r3, r0
	movs r5, 0
	movs r6, 0x1
_080052D8:
	mov r1, r12
	adds r0, r1, r5
	ldrb r2, [r0]
	lsls r2, 24
	lsrs r1, r2, 31
	ands r1, r6
	lsls r1, 2
	adds r1, r4
	lsrs r0, r2, 30
	ands r0, r6
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsrs r0, r2, 29
	ands r0, r6
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 8
	orrs r3, r0
	lsrs r2, 28
	ands r2, r6
	lsls r2, 2
	adds r2, r4
	ldr r0, [r2]
	lsls r0, 12
	orrs r3, r0
	lsls r2, r5, 2
	add r2, r8
	ldr r0, [r7]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r7, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _080052D8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005344: .4byte gUnknown_081E6A3C
	thumb_func_end sub_80052C0

	thumb_func_start sub_8005348
sub_8005348: @ 8005348
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r12, r1
	adds r4, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _080053CC
	adds r7, r3, r0
	movs r5, 0
	movs r6, 0x1
_08005360:
	mov r1, r12
	adds r0, r1, r5
	ldrb r2, [r0]
	lsls r2, 24
	lsrs r1, r2, 31
	ands r1, r6
	lsls r1, 2
	adds r1, r4
	lsrs r0, r2, 30
	ands r0, r6
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsrs r0, r2, 29
	ands r0, r6
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 8
	orrs r3, r0
	lsrs r2, 28
	ands r2, r6
	lsls r2, 2
	adds r2, r4
	ldr r0, [r2]
	lsls r0, 12
	orrs r3, r0
	lsls r2, r5, 2
	add r2, r8
	ldr r0, [r7]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r7, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _08005360
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080053CC: .4byte gUnknown_081E6A3C
	thumb_func_end sub_8005348

	thumb_func_start sub_80053D0
sub_80053D0: @ 80053D0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r12, r1
	adds r4, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _08005460
	adds r7, r3, r0
	movs r5, 0
	movs r6, 0x1
_080053E8:
	mov r1, r12
	adds r0, r1, r5
	ldrb r2, [r0]
	lsls r2, 24
	lsrs r1, r2, 31
	ands r1, r6
	lsls r1, 2
	adds r1, r4
	lsrs r0, r2, 30
	ands r0, r6
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsrs r0, r2, 29
	ands r0, r6
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 8
	orrs r3, r0
	lsrs r0, r2, 28
	ands r0, r6
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 12
	orrs r3, r0
	lsrs r2, 27
	ands r2, r6
	lsls r2, 2
	adds r2, r4
	ldr r0, [r2]
	lsls r0, 16
	orrs r3, r0
	lsls r2, r5, 2
	add r2, r8
	ldr r0, [r7]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r7, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _080053E8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005460: .4byte gUnknown_081E6A3C
	thumb_func_end sub_80053D0

	thumb_func_start sub_8005464
sub_8005464: @ 8005464
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r12, r1
	adds r4, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _08005504
	adds r7, r3, r0
	movs r6, 0
	movs r5, 0x1
_0800547C:
	mov r1, r12
	adds r0, r1, r6
	ldrb r2, [r0]
	lsls r2, 24
	lsrs r1, r2, 31
	ands r1, r5
	lsls r1, 2
	adds r1, r4
	lsrs r0, r2, 30
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsrs r0, r2, 29
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 8
	orrs r3, r0
	lsrs r0, r2, 28
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 12
	orrs r3, r0
	lsrs r0, r2, 27
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 16
	orrs r3, r0
	lsrs r2, 26
	ands r2, r5
	lsls r2, 2
	adds r2, r4
	ldr r0, [r2]
	lsls r0, 20
	orrs r3, r0
	lsls r2, r6, 2
	add r2, r8
	ldr r0, [r7]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r7, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _0800547C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005504: .4byte gUnknown_081E6A3C
	thumb_func_end sub_8005464

	thumb_func_start sub_8005508
sub_8005508: @ 8005508
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r12, r1
	adds r4, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _080055B4
	adds r7, r3, r0
	movs r6, 0
	movs r5, 0x1
_08005520:
	mov r1, r12
	adds r0, r1, r6
	ldrb r2, [r0]
	lsls r2, 24
	lsrs r1, r2, 31
	ands r1, r5
	lsls r1, 2
	adds r1, r4
	lsrs r0, r2, 30
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsrs r0, r2, 29
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 8
	orrs r3, r0
	lsrs r0, r2, 28
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 12
	orrs r3, r0
	lsrs r0, r2, 27
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 16
	orrs r3, r0
	lsrs r0, r2, 26
	ands r0, r5
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	lsls r0, 20
	orrs r3, r0
	lsrs r2, 25
	ands r2, r5
	lsls r2, 2
	adds r2, r4
	ldr r0, [r2]
	lsls r0, 24
	orrs r3, r0
	lsls r2, r6, 2
	add r2, r8
	ldr r0, [r7]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r7, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _08005520
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080055B4: .4byte gUnknown_081E6A3C
	thumb_func_end sub_8005508

	thumb_func_start sub_80055B8
sub_80055B8: @ 80055B8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	mov r8, r1
	adds r5, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _0800567C
	adds r3, r0
	mov r12, r3
	movs r7, 0
	movs r6, 0x1
_080055D4:
	mov r1, r8
	adds r0, r1, r7
	ldrb r4, [r0]
	lsls r2, r4, 24
	lsrs r1, r2, 31
	ands r1, r6
	lsls r1, 2
	adds r1, r5
	lsrs r0, r2, 30
	ands r0, r6
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsrs r0, r2, 29
	ands r0, r6
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r0, 8
	orrs r3, r0
	lsrs r0, r2, 28
	ands r0, r6
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r0, 12
	orrs r3, r0
	lsrs r0, r2, 27
	ands r0, r6
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r0, 16
	orrs r3, r0
	lsrs r0, r2, 26
	ands r0, r6
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r0, 20
	orrs r3, r0
	lsrs r2, 25
	ands r2, r6
	lsls r2, 2
	adds r2, r5
	ldr r0, [r2]
	lsls r0, 24
	orrs r3, r0
	movs r0, 0x1
	ands r0, r4
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r0, 28
	orrs r3, r0
	lsls r2, r7, 2
	add r2, r9
	mov r1, r12
	ldr r0, [r1]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	mov r1, r12
	ldr r0, [r1, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x7
	bls _080055D4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800567C: .4byte gUnknown_081E6A3C
	thumb_func_end sub_80055B8

	thumb_func_start CopyGlyphToWindow
CopyGlyphToWindow: @ 8005680
	push {r4-r7,lr}
	adds r7, r0, 0
	ldr r6, _08005714
	ldr r5, [r7, 0x8]
	ldrb r0, [r7, 0x2]
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 5
	ldrb r1, [r7, 0x1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08005718
	adds r0, r1
	adds r2, r0
	ldr r1, [r2]
	ldr r0, [r2, 0x8]
	orrs r1, r0
	ldr r0, [r5]
	ands r0, r1
	str r0, [r6]
	ldr r0, [r5, 0x4]
	ands r0, r1
	str r0, [r6, 0x4]
	ldr r0, [r5, 0x8]
	ands r0, r1
	str r0, [r6, 0x8]
	ldr r0, [r5, 0xC]
	ands r0, r1
	str r0, [r6, 0xC]
	ldr r0, [r5, 0x10]
	ands r0, r1
	str r0, [r6, 0x10]
	ldr r0, [r5, 0x14]
	ands r0, r1
	str r0, [r6, 0x14]
	ldr r0, [r5, 0x18]
	ands r0, r1
	str r0, [r6, 0x18]
	ldr r0, [r5, 0x1C]
	ands r0, r1
	str r0, [r6, 0x1C]
	ldrb r0, [r7, 0x1]
	ldrb r1, [r7, 0x2]
	adds r0, r1
	cmp r0, 0x8
	ble _0800574C
	ldr r1, [r2, 0x4]
	ldrb r0, [r7]
	cmp r0, 0x2
	bne _0800571C
	ldr r0, [r5, 0x20]
	ands r0, r1
	str r0, [r6, 0x20]
	ldr r0, [r5, 0x24]
	ands r0, r1
	str r0, [r6, 0x24]
	ldr r0, [r5, 0x28]
	ands r0, r1
	str r0, [r6, 0x28]
	ldr r0, [r5, 0x2C]
	ands r0, r1
	str r0, [r6, 0x2C]
	ldr r0, [r5, 0x30]
	ands r0, r1
	str r0, [r6, 0x30]
	ldr r0, [r5, 0x34]
	ands r0, r1
	str r0, [r6, 0x34]
	ldr r0, [r5, 0x38]
	ands r0, r1
	str r0, [r6, 0x38]
	ldr r0, [r5, 0x3C]
	b _08005748
	.align 2, 0
_08005714: .4byte 0x03000360
_08005718: .4byte gUnknown_081E66DC
_0800571C:
	ldr r0, [r5, 0x40]
	ands r0, r1
	str r0, [r6, 0x20]
	ldr r0, [r5, 0x44]
	ands r0, r1
	str r0, [r6, 0x24]
	ldr r0, [r5, 0x48]
	ands r0, r1
	str r0, [r6, 0x28]
	ldr r0, [r5, 0x4C]
	ands r0, r1
	str r0, [r6, 0x2C]
	ldr r0, [r5, 0x50]
	ands r0, r1
	str r0, [r6, 0x30]
	ldr r0, [r5, 0x54]
	ands r0, r1
	str r0, [r6, 0x34]
	ldr r0, [r5, 0x58]
	ands r0, r1
	str r0, [r6, 0x38]
	ldr r0, [r5, 0x5C]
_08005748:
	ands r0, r1
	str r0, [r6, 0x3C]
_0800574C:
	ldr r1, _080057C4
	ldrb r0, [r7, 0x2]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r7, 0x4]
	ldr r2, [r7, 0xC]
	ldrb r3, [r7, 0x1]
	ldr r4, [r0]
	adds r0, r6, 0
	bl _call_via_r4
	ldr r0, [r6]
	str r0, [r5]
	ldr r0, [r6, 0x4]
	str r0, [r5, 0x4]
	ldr r0, [r6, 0x8]
	str r0, [r5, 0x8]
	ldr r0, [r6, 0xC]
	str r0, [r5, 0xC]
	ldr r0, [r6, 0x10]
	str r0, [r5, 0x10]
	ldr r0, [r6, 0x14]
	str r0, [r5, 0x14]
	ldr r0, [r6, 0x18]
	str r0, [r5, 0x18]
	ldr r0, [r6, 0x1C]
	str r0, [r5, 0x1C]
	ldrb r0, [r7, 0x1]
	ldrb r1, [r7, 0x2]
	adds r0, r1
	cmp r0, 0x8
	ble _080057B4
	ldrb r0, [r7]
	cmp r0, 0x2
	beq _08005794
	adds r5, 0x20
_08005794:
	ldr r0, [r6, 0x20]
	str r0, [r5, 0x20]
	ldr r0, [r6, 0x24]
	str r0, [r5, 0x24]
	ldr r0, [r6, 0x28]
	str r0, [r5, 0x28]
	ldr r0, [r6, 0x2C]
	str r0, [r5, 0x2C]
	ldr r0, [r6, 0x30]
	str r0, [r5, 0x30]
	ldr r0, [r6, 0x34]
	str r0, [r5, 0x34]
	ldr r0, [r6, 0x38]
	str r0, [r5, 0x38]
	ldr r0, [r6, 0x3C]
	str r0, [r5, 0x3C]
_080057B4:
	ldrb r1, [r7, 0x1]
	ldrb r0, [r7, 0x2]
	adds r0, r1, r0
	asrs r0, 3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080057C4: .4byte gUnknown_081E6C18
	thumb_func_end CopyGlyphToWindow

	thumb_func_start ShiftGlyphWidth0
ShiftGlyphWidth0: @ 80057C8
	bx lr
	thumb_func_end ShiftGlyphWidth0

	thumb_func_start ShiftGlyphWidth1
ShiftGlyphWidth1: @ 80057CC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r12, r0
	adds r7, r1, 0
	adds r6, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _08005824
	adds r5, r3, r0
	movs r4, 0
	movs r0, 0xF
	mov r8, r0
_080057E6:
	lsls r2, r4, 2
	adds r0, r2, r7
	ldr r0, [r0]
	mov r1, r8
	ands r0, r1
	lsls r0, 2
	adds r0, r6
	ldr r3, [r0]
	add r2, r12
	ldr r0, [r5]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldr r0, [r5, 0x4]
	lsrs r3, r0
	ldr r0, [r2, 0x20]
	orrs r0, r3
	str r0, [r2, 0x20]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _080057E6
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005824: .4byte gUnknown_081E6A3C
	thumb_func_end ShiftGlyphWidth1

	thumb_func_start ShiftGlyphWidth2
ShiftGlyphWidth2: @ 8005828
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov r12, r1
	adds r6, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _0800588C
	adds r5, r3, r0
	movs r4, 0
	movs r7, 0xF
_08005840:
	lsls r3, r4, 2
	mov r1, r12
	adds r0, r3, r1
	ldr r0, [r0]
	adds r1, r0, 0
	ands r1, r7
	lsls r1, 2
	adds r1, r6
	lsrs r0, 4
	ands r0, r7
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	lsls r0, 4
	ldr r2, [r1]
	orrs r2, r0
	add r3, r8
	ldr r0, [r5]
	adds r1, r2, 0
	lsls r1, r0
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	ldr r0, [r5, 0x4]
	lsrs r2, r0
	ldr r0, [r3, 0x20]
	orrs r0, r2
	str r0, [r3, 0x20]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08005840
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800588C: .4byte gUnknown_081E6A3C
	thumb_func_end ShiftGlyphWidth2

	thumb_func_start ShiftGlyphWidth3
ShiftGlyphWidth3: @ 8005890
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	mov r8, r1
	adds r6, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _0800590C
	adds r7, r3, r0
	movs r5, 0
	movs r0, 0xF
	mov r12, r0
_080058AC:
	lsls r4, r5, 2
	mov r1, r8
	adds r0, r4, r1
	ldr r2, [r0]
	adds r1, r2, 0
	mov r3, r12
	ands r1, r3
	lsls r1, 2
	adds r1, r6
	lsrs r0, r2, 4
	ands r0, r3
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsrs r2, 8
	mov r0, r12
	ands r2, r0
	lsls r2, 2
	adds r2, r6
	ldr r0, [r2]
	lsls r0, 8
	orrs r3, r0
	add r4, r9
	ldr r0, [r7]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r4]
	orrs r0, r1
	str r0, [r4]
	ldr r0, [r7, 0x4]
	lsrs r3, r0
	ldr r0, [r4, 0x20]
	orrs r0, r3
	str r0, [r4, 0x20]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _080058AC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800590C: .4byte gUnknown_081E6A3C
	thumb_func_end ShiftGlyphWidth3

	thumb_func_start ShiftGlyphWidth4
ShiftGlyphWidth4: @ 8005910
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	mov r8, r1
	adds r5, r2, 0
	lsls r3, 24
	lsrs r3, 21
	ldr r0, _0800599C
	adds r3, r0
	mov r12, r3
	movs r6, 0
	movs r7, 0xF
_0800592C:
	lsls r4, r6, 2
	mov r1, r8
	adds r0, r4, r1
	ldr r2, [r0]
	adds r1, r2, 0
	ands r1, r7
	lsls r1, 2
	adds r1, r5
	lsrs r0, r2, 4
	ands r0, r7
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r0, 4
	ldr r3, [r1]
	orrs r3, r0
	lsrs r0, r2, 8
	ands r0, r7
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r0, 8
	orrs r3, r0
	lsrs r2, 12
	ands r2, r7
	lsls r2, 2
	adds r2, r5
	ldr r0, [r2]
	lsls r0, 12
	orrs r3, r0
	add r4, r9
	mov r1, r12
	ldr r0, [r1]
	adds r1, r3, 0
	lsls r1, r0
	ldr r0, [r4]
	orrs r0, r1
	str r0, [r4]
	mov r1, r12
	ldr r0, [r1, 0x4]
	lsrs r3, r0
	ldr r0, [r4, 0x20]
	orrs r0, r3
	str r0, [r4, 0x20]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _0800592C
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800599C: .4byte gUnknown_081E6A3C
	thumb_func_end ShiftGlyphWidth4

	thumb_func_start ShiftGlyphWidth5
ShiftGlyphWidth5: @ 80059A0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r3, 24
	lsrs r3, 21
	ldr r4, _08005CAC
	adds r3, r4
	ldr r6, [r1]
	movs r4, 0xF
	mov r8, r4
	adds r5, r6, 0
	ands r5, r4
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	mov r7, r8
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r6, 16
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 16
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0]
	orrs r4, r5
	str r4, [r0]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x20]
	orrs r4, r7
	str r4, [r0, 0x20]
	ldr r6, [r1, 0x4]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r6, 16
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 16
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x4]
	orrs r4, r5
	str r4, [r0, 0x4]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x24]
	orrs r4, r7
	str r4, [r0, 0x24]
	ldr r6, [r1, 0x8]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r6, 16
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 16
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x8]
	orrs r4, r5
	str r4, [r0, 0x8]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x28]
	orrs r4, r7
	str r4, [r0, 0x28]
	ldr r6, [r1, 0xC]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r6, 16
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 16
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0xC]
	orrs r4, r5
	str r4, [r0, 0xC]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x2C]
	orrs r4, r7
	str r4, [r0, 0x2C]
	ldr r6, [r1, 0x10]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r6, 16
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 16
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x10]
	orrs r4, r5
	str r4, [r0, 0x10]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x30]
	orrs r4, r7
	str r4, [r0, 0x30]
	ldr r6, [r1, 0x14]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r6, 16
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 16
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x14]
	orrs r4, r5
	str r4, [r0, 0x14]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x34]
	orrs r4, r7
	str r4, [r0, 0x34]
	ldr r6, [r1, 0x18]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r6, 16
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 16
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x18]
	orrs r4, r5
	str r4, [r0, 0x18]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x38]
	orrs r4, r7
	str r4, [r0, 0x38]
	ldr r5, [r1, 0x1C]
	adds r4, r5, 0
	mov r6, r8
	ands r4, r6
	lsls r4, 2
	adds r4, r2
	lsrs r1, r5, 4
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 4
	ldr r7, [r4]
	orrs r7, r1
	lsrs r1, r5, 8
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 8
	orrs r7, r1
	lsrs r1, r5, 12
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 12
	orrs r7, r1
	lsrs r5, 16
	ands r5, r6
	lsls r5, 2
	adds r5, r2
	ldr r1, [r5]
	lsls r1, 16
	orrs r7, r1
	ldr r1, [r3]
	adds r2, r7, 0
	lsls r2, r1
	ldr r1, [r0, 0x1C]
	orrs r1, r2
	str r1, [r0, 0x1C]
	ldr r1, [r3, 0x4]
	lsrs r7, r1
	ldr r1, [r0, 0x3C]
	orrs r1, r7
	str r1, [r0, 0x3C]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005CAC: .4byte gUnknown_081E6A3C
	thumb_func_end ShiftGlyphWidth5

	thumb_func_start ShiftGlyphWidth6
ShiftGlyphWidth6: @ 8005CB0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r3, 24
	lsrs r3, 21
	ldr r4, _0800602C
	adds r3, r4
	ldr r6, [r1]
	movs r4, 0xF
	mov r8, r4
	adds r5, r6, 0
	ands r5, r4
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	mov r7, r8
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r6, 20
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 20
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0]
	orrs r4, r5
	str r4, [r0]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x20]
	orrs r4, r7
	str r4, [r0, 0x20]
	ldr r6, [r1, 0x4]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r6, 20
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 20
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x4]
	orrs r4, r5
	str r4, [r0, 0x4]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x24]
	orrs r4, r7
	str r4, [r0, 0x24]
	ldr r6, [r1, 0x8]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r6, 20
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 20
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x8]
	orrs r4, r5
	str r4, [r0, 0x8]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x28]
	orrs r4, r7
	str r4, [r0, 0x28]
	ldr r6, [r1, 0xC]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r6, 20
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 20
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0xC]
	orrs r4, r5
	str r4, [r0, 0xC]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x2C]
	orrs r4, r7
	str r4, [r0, 0x2C]
	ldr r6, [r1, 0x10]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r6, 20
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 20
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x10]
	orrs r4, r5
	str r4, [r0, 0x10]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x30]
	orrs r4, r7
	str r4, [r0, 0x30]
	ldr r6, [r1, 0x14]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r6, 20
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 20
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x14]
	orrs r4, r5
	str r4, [r0, 0x14]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x34]
	orrs r4, r7
	str r4, [r0, 0x34]
	ldr r6, [r1, 0x18]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r6, 20
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 20
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x18]
	orrs r4, r5
	str r4, [r0, 0x18]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x38]
	orrs r4, r7
	str r4, [r0, 0x38]
	ldr r5, [r1, 0x1C]
	adds r4, r5, 0
	mov r6, r8
	ands r4, r6
	lsls r4, 2
	adds r4, r2
	lsrs r1, r5, 4
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 4
	ldr r7, [r4]
	orrs r7, r1
	lsrs r1, r5, 8
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 8
	orrs r7, r1
	lsrs r1, r5, 12
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 12
	orrs r7, r1
	lsrs r1, r5, 16
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 16
	orrs r7, r1
	lsrs r5, 20
	ands r5, r6
	lsls r5, 2
	adds r5, r2
	ldr r1, [r5]
	lsls r1, 20
	orrs r7, r1
	ldr r1, [r3]
	adds r2, r7, 0
	lsls r2, r1
	ldr r1, [r0, 0x1C]
	orrs r1, r2
	str r1, [r0, 0x1C]
	ldr r1, [r3, 0x4]
	lsrs r7, r1
	ldr r1, [r0, 0x3C]
	orrs r1, r7
	str r1, [r0, 0x3C]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800602C: .4byte gUnknown_081E6A3C
	thumb_func_end ShiftGlyphWidth6

	thumb_func_start ShiftGlyphWidth7
ShiftGlyphWidth7: @ 8006030
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r3, 24
	lsrs r3, 21
	ldr r4, _08006414
	adds r3, r4
	ldr r6, [r1]
	movs r4, 0xF
	mov r8, r4
	adds r5, r6, 0
	ands r5, r4
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	mov r7, r8
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r6, 24
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 24
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0]
	orrs r4, r5
	str r4, [r0]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x20]
	orrs r4, r7
	str r4, [r0, 0x20]
	ldr r6, [r1, 0x4]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r6, 24
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 24
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x4]
	orrs r4, r5
	str r4, [r0, 0x4]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x24]
	orrs r4, r7
	str r4, [r0, 0x24]
	ldr r6, [r1, 0x8]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r6, 24
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 24
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x8]
	orrs r4, r5
	str r4, [r0, 0x8]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x28]
	orrs r4, r7
	str r4, [r0, 0x28]
	ldr r6, [r1, 0xC]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r6, 24
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 24
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0xC]
	orrs r4, r5
	str r4, [r0, 0xC]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x2C]
	orrs r4, r7
	str r4, [r0, 0x2C]
	ldr r6, [r1, 0x10]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r6, 24
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 24
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x10]
	orrs r4, r5
	str r4, [r0, 0x10]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x30]
	orrs r4, r7
	str r4, [r0, 0x30]
	ldr r6, [r1, 0x14]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r6, 24
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 24
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x14]
	orrs r4, r5
	str r4, [r0, 0x14]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x34]
	orrs r4, r7
	str r4, [r0, 0x34]
	ldr r6, [r1, 0x18]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r6, 24
	ands r6, r5
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 24
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x18]
	orrs r4, r5
	str r4, [r0, 0x18]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x38]
	orrs r4, r7
	str r4, [r0, 0x38]
	ldr r5, [r1, 0x1C]
	adds r4, r5, 0
	mov r6, r8
	ands r4, r6
	lsls r4, 2
	adds r4, r2
	lsrs r1, r5, 4
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 4
	ldr r7, [r4]
	orrs r7, r1
	lsrs r1, r5, 8
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 8
	orrs r7, r1
	lsrs r1, r5, 12
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 12
	orrs r7, r1
	lsrs r1, r5, 16
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 16
	orrs r7, r1
	lsrs r1, r5, 20
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 20
	orrs r7, r1
	lsrs r5, 24
	ands r5, r6
	lsls r5, 2
	adds r5, r2
	ldr r1, [r5]
	lsls r1, 24
	orrs r7, r1
	ldr r1, [r3]
	adds r2, r7, 0
	lsls r2, r1
	ldr r1, [r0, 0x1C]
	orrs r1, r2
	str r1, [r0, 0x1C]
	ldr r1, [r3, 0x4]
	lsrs r7, r1
	ldr r1, [r0, 0x3C]
	orrs r1, r7
	str r1, [r0, 0x3C]
	b _08006418
	.align 2, 0
_08006414: .4byte gUnknown_081E6A3C
_08006418:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ShiftGlyphWidth7

	thumb_func_start ShiftGlyphWidth8
ShiftGlyphWidth8: @ 8006424
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r3, 24
	lsrs r3, 21
	ldr r4, _08006818
	adds r3, r4
	ldr r6, [r1]
	movs r4, 0xF
	mov r8, r4
	adds r5, r6, 0
	ands r5, r4
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	mov r7, r8
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r4, r6, 24
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 24
	orrs r7, r4
	lsrs r6, 28
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 28
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0]
	orrs r4, r5
	str r4, [r0]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x20]
	orrs r4, r7
	str r4, [r0, 0x20]
	ldr r6, [r1, 0x4]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r4, r6, 24
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 24
	orrs r7, r4
	lsrs r6, 28
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 28
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x4]
	orrs r4, r5
	str r4, [r0, 0x4]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x24]
	orrs r4, r7
	str r4, [r0, 0x24]
	ldr r6, [r1, 0x8]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r4, r6, 24
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 24
	orrs r7, r4
	lsrs r6, 28
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 28
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x8]
	orrs r4, r5
	str r4, [r0, 0x8]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x28]
	orrs r4, r7
	str r4, [r0, 0x28]
	ldr r6, [r1, 0xC]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r4, r6, 24
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 24
	orrs r7, r4
	lsrs r6, 28
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 28
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0xC]
	orrs r4, r5
	str r4, [r0, 0xC]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x2C]
	orrs r4, r7
	str r4, [r0, 0x2C]
	ldr r6, [r1, 0x10]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r4, r6, 24
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 24
	orrs r7, r4
	lsrs r6, 28
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 28
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x10]
	orrs r4, r5
	str r4, [r0, 0x10]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x30]
	orrs r4, r7
	str r4, [r0, 0x30]
	ldr r6, [r1, 0x14]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r4, r6, 24
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 24
	orrs r7, r4
	lsrs r6, 28
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 28
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x14]
	orrs r4, r5
	str r4, [r0, 0x14]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x34]
	orrs r4, r7
	str r4, [r0, 0x34]
	ldr r6, [r1, 0x18]
	adds r5, r6, 0
	mov r7, r8
	ands r5, r7
	lsls r5, 2
	adds r5, r2
	lsrs r4, r6, 4
	ands r4, r7
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 4
	ldr r7, [r5]
	orrs r7, r4
	lsrs r4, r6, 8
	mov r5, r8
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 8
	orrs r7, r4
	lsrs r4, r6, 12
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 12
	orrs r7, r4
	lsrs r4, r6, 16
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 16
	orrs r7, r4
	lsrs r4, r6, 20
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 20
	orrs r7, r4
	lsrs r4, r6, 24
	ands r4, r5
	lsls r4, 2
	adds r4, r2
	ldr r4, [r4]
	lsls r4, 24
	orrs r7, r4
	lsrs r6, 28
	lsls r6, 2
	adds r6, r2
	ldr r4, [r6]
	lsls r4, 28
	orrs r7, r4
	ldr r4, [r3]
	adds r5, r7, 0
	lsls r5, r4
	ldr r4, [r0, 0x18]
	orrs r4, r5
	str r4, [r0, 0x18]
	ldr r4, [r3, 0x4]
	lsrs r7, r4
	ldr r4, [r0, 0x38]
	orrs r4, r7
	str r4, [r0, 0x38]
	ldr r5, [r1, 0x1C]
	adds r4, r5, 0
	mov r6, r8
	ands r4, r6
	lsls r4, 2
	adds r4, r2
	lsrs r1, r5, 4
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 4
	ldr r7, [r4]
	orrs r7, r1
	lsrs r1, r5, 8
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 8
	orrs r7, r1
	lsrs r1, r5, 12
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 12
	b _0800681C
	.align 2, 0
_08006818: .4byte gUnknown_081E6A3C
_0800681C:
	orrs r7, r1
	lsrs r1, r5, 16
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 16
	orrs r7, r1
	lsrs r1, r5, 20
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 20
	orrs r7, r1
	lsrs r1, r5, 24
	ands r1, r6
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 24
	orrs r7, r1
	lsrs r5, 28
	lsls r5, 2
	adds r5, r2
	ldr r1, [r5]
	lsls r1, 28
	orrs r7, r1
	ldr r1, [r3]
	adds r2, r7, 0
	lsls r2, r1
	ldr r1, [r0, 0x1C]
	orrs r1, r2
	str r1, [r0, 0x1C]
	ldr r1, [r3, 0x4]
	lsrs r7, r1
	ldr r1, [r0, 0x3C]
	orrs r1, r7
	str r1, [r0, 0x3C]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end ShiftGlyphWidth8

	thumb_func_start sub_8006874
sub_8006874: @ 8006874
	push {r4-r7,lr}
	sub sp, 0x1C
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	movs r7, 0
	ldrb r0, [r6, 0x1]
	ldrb r1, [r6, 0x2]
	lsls r4, 16
	lsrs r4, 16
	add r3, sp, 0x14
	add r2, sp, 0x18
	str r2, [sp]
	adds r2, r4, 0
	bl sub_8003A1C
	add r1, sp, 0x4
	ldrb r0, [r6]
	strb r0, [r1]
	adds r2, r1, 0
	ldrb r0, [r6, 0x10]
	ldrb r1, [r6, 0x12]
	adds r0, r1
	movs r1, 0x7
	ands r0, r1
	strb r0, [r2, 0x1]
	adds r0, r2, 0
	strb r5, [r0, 0x2]
	ldr r0, [sp, 0x14]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r6, 0x24]
	adds r1, r0
	str r1, [sp, 0xC]
	ldr r0, _080068D8
	str r0, [sp, 0x10]
	ldrb r0, [r6, 0x1]
	cmp r0, 0x6
	bhi _08006948
	lsls r0, 2
	ldr r1, _080068DC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080068D8: .4byte 0x030003a4
_080068DC: .4byte _080068E0
	.align 2, 0
_080068E0:
	.4byte _080068FC
	.4byte _080068FC
	.4byte _080068FC
	.4byte _08006922
	.4byte _08006922
	.4byte _08006922
	.4byte _080068FC
_080068FC:
	add r0, sp, 0x4
	bl sub_80050AC
	ldr r0, [sp, 0x18]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x1
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r6, 0x24]
	adds r1, r0
	str r1, [sp, 0xC]
	add r0, sp, 0x4
	bl sub_80050AC
	b _08006946
_08006922:
	add r0, sp, 0x4
	bl CopyGlyphToWindow
	ldr r0, [sp, 0x18]
	str r0, [sp, 0x8]
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0x1
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 11
	ldr r1, [r6, 0x24]
	adds r1, r0
	str r1, [sp, 0xC]
	add r0, sp, 0x4
	bl CopyGlyphToWindow
_08006946:
	adds r7, r0, 0
_08006948:
	adds r0, r7, 0
	add sp, 0x1C
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8006874

	thumb_func_start sub_8006954
sub_8006954: @ 8006954
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	mov r8, r1
	bl sub_8003AF8
	adds r6, r0, 0
	mov r0, r8
	cmp r0, 0
	beq _080069CE
	cmp r6, 0
	beq _080069CE
	ldrb r0, [r5, 0x6]
	lsls r0, 28
	lsrs r7, r0, 16
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0
	bl GetTextRendererTileBufferIndex
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x1
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 16
	orrs r4, r7
	strh r4, [r6]
	adds r1, r6, 0
	adds r1, 0x40
	orrs r0, r7
	strh r0, [r1]
	mov r0, r8
	cmp r0, 0x2
	bne _080069CE
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0
	bl GetTextRendererTileBufferIndex
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x1
	bl GetTextRendererTileBufferIndex
	lsls r0, 16
	lsrs r0, 16
	orrs r4, r7
	strh r4, [r6, 0x2]
	adds r1, r6, 0
	adds r1, 0x42
	orrs r0, r7
	strh r0, [r1]
_080069CE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8006954

	thumb_func_start GetTextRendererTileBufferIndex
GetTextRendererTileBufferIndex: @ 80069D8
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	ldrb r0, [r3]
	cmp r0, 0x2
	bne _08006A0E
	ldrh r2, [r3, 0x1C]
	ldrh r0, [r3, 0x1A]
	adds r2, r0
	ldrh r0, [r3, 0x14]
	ldrb r1, [r3, 0x11]
	adds r0, r1
	asrs r0, 3
	adds r0, r4
	ldrb r1, [r3, 0x9]
	muls r0, r1
	adds r2, r0
	ldrb r0, [r3, 0x12]
	ldrb r1, [r3, 0x10]
	adds r0, r1
	asrs r0, 3
	adds r0, r5
	adds r2, r0
	lsls r2, 16
	lsrs r0, r2, 16
	b _08006A1E
_08006A0E:
	ldrh r0, [r3, 0x1C]
	ldrh r3, [r3, 0x1A]
	adds r0, r3
	lsls r1, r5, 1
	adds r0, r1
	adds r0, r4
	lsls r0, 16
	lsrs r0, 16
_08006A1E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetTextRendererTileBufferIndex
