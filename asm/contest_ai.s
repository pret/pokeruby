	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_81288F4
sub_81288F4: @ 81288F4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0812893C
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x44
	bl memset
	movs r3, 0x64
	adds r2, r4, 0
	movs r1, 0x3
	adds r0, r2, 0
	adds r0, 0x8
_08128910:
	strb r3, [r0]
	subs r0, 0x1
	subs r1, 0x1
	cmp r1, 0
	bge _08128910
	adds r3, r2, 0
	adds r3, 0x41
	movs r1, 0
	strb r5, [r3]
	adds r0, r2, 0
	adds r0, 0x40
	strb r1, [r0]
	ldr r1, _08128940
	ldrb r0, [r3]
	lsls r0, 6
	adds r1, 0x18
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2, 0x14]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812893C: .4byte 0x020192e4
_08128940: .4byte gUnknown_02038570
	thumb_func_end sub_81288F4

	thumb_func_start sub_8128944
sub_8128944: @ 8128944
	push {r4-r6,lr}
	ldr r1, _081289A8
	ldr r0, [r1, 0x14]
	cmp r0, 0
	beq _08128974
	adds r4, r1, 0
	movs r5, 0
_08128952:
	ldr r0, [r4, 0x14]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08128962
	strb r5, [r4]
	bl sub_81289AC
_08128962:
	ldr r1, [r4, 0x14]
	lsrs r1, 1
	str r1, [r4, 0x14]
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
	strb r5, [r4, 0x4]
	cmp r1, 0
	bne _08128952
_08128974:
	movs r6, 0x3
	ldr r5, _081289A8
_08128978:
	bl Random
	adds r4, r0, 0
	ands r4, r6
	adds r3, r5, 0x5
	adds r0, r4, r3
	ldrb r2, [r0]
	movs r1, 0
	ldrb r0, [r5, 0x5]
	cmp r2, r0
	bcc _0812899C
_0812898E:
	adds r1, 0x1
	cmp r1, 0x3
	bgt _0812899C
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r2, r0
	bcs _0812898E
_0812899C:
	cmp r1, 0x4
	bne _08128978
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081289A8: .4byte 0x020192e4
	thumb_func_end sub_8128944

	thumb_func_start sub_81289AC
sub_81289AC: @ 81289AC
	push {r4-r6,lr}
	ldr r1, _081289F4
	ldrb r0, [r1]
	adds r2, r1, 0
	cmp r0, 0x2
	beq _08128A76
	adds r4, r1, 0
	ldr r5, _081289F8
	ldr r6, _081289FC
_081289BE:
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _08128A0E
	cmp r0, 0x1
	bgt _08128A6E
	cmp r0, 0
	bne _08128A6E
	ldr r1, _08128A00
	ldrb r0, [r4, 0x10]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [r5]
	ldrb r1, [r4, 0x4]
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r1, r6
	ldrh r1, [r1]
	adds r0, r1, 0
	cmp r0, 0
	bne _08128A04
	strh r0, [r4, 0x2]
	b _08128A06
	.align 2, 0
_081289F4: .4byte 0x020192e4
_081289F8: .4byte gUnknown_02039238
_081289FC: .4byte gUnknown_0203858E
_08128A00: .4byte gContestAIs
_08128A04:
	strh r1, [r4, 0x2]
_08128A06:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08128A6E
_08128A0E:
	ldrh r1, [r1, 0x2]
	cmp r1, 0
	beq _08128A2C
	ldr r1, _08128A28
	ldr r0, [r5]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	b _08128A3C
	.align 2, 0
_08128A28: .4byte gUnknown_08401E60
_08128A2C:
	adds r0, r4, 0x5
	ldrb r2, [r4, 0x4]
	adds r0, r2
	strb r1, [r0]
	ldrb r1, [r4, 0x9]
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r4, 0x9]
_08128A3C:
	ldr r2, _08128A5C
	ldrb r1, [r2, 0x9]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08128A6E
	ldrb r0, [r2, 0x4]
	adds r0, 0x1
	movs r1, 0
	strb r0, [r2, 0x4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08128A60
	strb r1, [r2]
	b _08128A66
	.align 2, 0
_08128A5C: .4byte 0x020192e4
_08128A60:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
_08128A66:
	ldrb r1, [r4, 0x9]
	movs r0, 0xFE
	ands r0, r1
	strb r0, [r4, 0x9]
_08128A6E:
	adds r1, r2, 0
	ldrb r0, [r1]
	cmp r0, 0x2
	bne _081289BE
_08128A76:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_81289AC

	thumb_func_start sub_8128A7C
sub_8128A7C: @ 8128A7C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r3, _08128AA4
	ldrb r0, [r3]
	cmp r0, r2
	beq _08128A9A
_08128A8C:
	adds r1, 0x1
	cmp r1, 0x3
	bgt _08128A9A
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08128A8C
_08128A9A:
	lsls r0, r1, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08128AA4: .4byte 0x020192d0
	thumb_func_end sub_8128A7C

	thumb_func_start sub_8128AA8
sub_8128AA8: @ 8128AA8
	push {lr}
	ldr r2, _08128AD0
	adds r1, r2, 0x5
	ldrb r0, [r2, 0x4]
	adds r1, r0
	ldr r3, _08128AD4
	ldr r0, [r3]
	ldrb r0, [r0, 0x1]
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08128AD8
	movs r1, 0xFF
	b _08128ADE
	.align 2, 0
_08128AD0: .4byte 0x020192e4
_08128AD4: .4byte gUnknown_02039238
_08128AD8:
	cmp r0, 0
	bge _08128ADE
	movs r1, 0
_08128ADE:
	adds r0, r2, 0x5
	ldrb r2, [r2, 0x4]
	adds r0, r2
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, 0x2
	str r0, [r3]
	pop {r0}
	bx r0
	thumb_func_end sub_8128AA8

	thumb_func_start contest_ai_get_turn
contest_ai_get_turn: @ 8128AF0
	ldr r1, _08128B04
	adds r0, r1, 0
	subs r0, 0xE0
	ldrb r0, [r0, 0x1]
	strh r0, [r1, 0x18]
	ldr r1, _08128B08
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08128B04: .4byte 0x020192e4
_08128B08: .4byte gUnknown_02039238
	thumb_func_end contest_ai_get_turn

	thumb_func_start sub_8128B0C
sub_8128B0C: @ 8128B0C
	push {lr}
	bl contest_ai_get_turn
	ldr r0, _08128B3C
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128B40
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08128B44
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128B48
	.align 2, 0
_08128B3C: .4byte 0x020192e4
_08128B40: .4byte gUnknown_02039238
_08128B44:
	adds r0, r2, 0x5
	str r0, [r3]
_08128B48:
	pop {r0}
	bx r0
	thumb_func_end sub_8128B0C

	thumb_func_start sub_8128B4C
sub_8128B4C: @ 8128B4C
	push {lr}
	bl contest_ai_get_turn
	ldr r0, _08128B7C
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128B80
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08128B84
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128B88
	.align 2, 0
_08128B7C: .4byte 0x020192e4
_08128B80: .4byte gUnknown_02039238
_08128B84:
	adds r0, r2, 0x5
	str r0, [r3]
_08128B88:
	pop {r0}
	bx r0
	thumb_func_end sub_8128B4C

	thumb_func_start sub_8128B8C
sub_8128B8C: @ 8128B8C
	push {lr}
	bl contest_ai_get_turn
	ldr r0, _08128BBC
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128BC0
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08128BC4
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128BC8
	.align 2, 0
_08128BBC: .4byte 0x020192e4
_08128BC0: .4byte gUnknown_02039238
_08128BC4:
	adds r0, r2, 0x5
	str r0, [r3]
_08128BC8:
	pop {r0}
	bx r0
	thumb_func_end sub_8128B8C

	thumb_func_start sub_8128BCC
sub_8128BCC: @ 8128BCC
	push {lr}
	bl contest_ai_get_turn
	ldr r0, _08128BFC
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128C00
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08128C04
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128C08
	.align 2, 0
_08128BFC: .4byte 0x020192e4
_08128C00: .4byte gUnknown_02039238
_08128C04:
	adds r0, r2, 0x5
	str r0, [r3]
_08128C08:
	pop {r0}
	bx r0
	thumb_func_end sub_8128BCC

	thumb_func_start contest_ai_get_excitement
contest_ai_get_excitement: @ 8128C0C
	ldr r1, _08128C24
	adds r0, r1, 0
	subs r0, 0xE0
	ldrb r0, [r0, 0x13]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r1, 0x18]
	ldr r1, _08128C28
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08128C24: .4byte 0x020192e4
_08128C28: .4byte gUnknown_02039238
	thumb_func_end contest_ai_get_excitement

	thumb_func_start sub_8128C2C
sub_8128C2C: @ 8128C2C
	push {lr}
	bl contest_ai_get_excitement
	ldr r0, _08128C5C
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128C60
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08128C64
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128C68
	.align 2, 0
_08128C5C: .4byte 0x020192e4
_08128C60: .4byte gUnknown_02039238
_08128C64:
	adds r0, r2, 0x5
	str r0, [r3]
_08128C68:
	pop {r0}
	bx r0
	thumb_func_end sub_8128C2C

	thumb_func_start sub_8128C6C
sub_8128C6C: @ 8128C6C
	push {lr}
	bl contest_ai_get_excitement
	ldr r0, _08128C9C
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128CA0
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08128CA4
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128CA8
	.align 2, 0
_08128C9C: .4byte 0x020192e4
_08128CA0: .4byte gUnknown_02039238
_08128CA4:
	adds r0, r2, 0x5
	str r0, [r3]
_08128CA8:
	pop {r0}
	bx r0
	thumb_func_end sub_8128C6C

	thumb_func_start sub_8128CAC
sub_8128CAC: @ 8128CAC
	push {lr}
	bl contest_ai_get_excitement
	ldr r0, _08128CDC
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128CE0
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08128CE4
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128CE8
	.align 2, 0
_08128CDC: .4byte 0x020192e4
_08128CE0: .4byte gUnknown_02039238
_08128CE4:
	adds r0, r2, 0x5
	str r0, [r3]
_08128CE8:
	pop {r0}
	bx r0
	thumb_func_end sub_8128CAC

	thumb_func_start sub_8128CEC
sub_8128CEC: @ 8128CEC
	push {lr}
	bl contest_ai_get_excitement
	ldr r0, _08128D1C
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128D20
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08128D24
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128D28
	.align 2, 0
_08128D1C: .4byte 0x020192e4
_08128D20: .4byte gUnknown_02039238
_08128D24:
	adds r0, r2, 0x5
	str r0, [r3]
_08128D28:
	pop {r0}
	bx r0
	thumb_func_end sub_8128CEC

	thumb_func_start contest_ai_get_user_order
contest_ai_get_user_order: @ 8128D2C
	ldr r1, _08128D48
	adds r2, r1, 0
	adds r2, 0x41
	adds r0, r1, 0
	subs r0, 0x14
	ldrb r2, [r2]
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r1, 0x18]
	ldr r1, _08128D4C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08128D48: .4byte 0x020192e4
_08128D4C: .4byte gUnknown_02039238
	thumb_func_end contest_ai_get_user_order

	thumb_func_start sub_8128D50
sub_8128D50: @ 8128D50
	push {lr}
	bl contest_ai_get_user_order
	ldr r0, _08128D80
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128D84
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08128D88
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128D8C
	.align 2, 0
_08128D80: .4byte 0x020192e4
_08128D84: .4byte gUnknown_02039238
_08128D88:
	adds r0, r2, 0x5
	str r0, [r3]
_08128D8C:
	pop {r0}
	bx r0
	thumb_func_end sub_8128D50

	thumb_func_start sub_8128D90
sub_8128D90: @ 8128D90
	push {lr}
	bl contest_ai_get_user_order
	ldr r0, _08128DC0
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128DC4
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08128DC8
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128DCC
	.align 2, 0
_08128DC0: .4byte 0x020192e4
_08128DC4: .4byte gUnknown_02039238
_08128DC8:
	adds r0, r2, 0x5
	str r0, [r3]
_08128DCC:
	pop {r0}
	bx r0
	thumb_func_end sub_8128D90

	thumb_func_start sub_8128DD0
sub_8128DD0: @ 8128DD0
	push {lr}
	bl contest_ai_get_user_order
	ldr r0, _08128E00
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128E04
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08128E08
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128E0C
	.align 2, 0
_08128E00: .4byte 0x020192e4
_08128E04: .4byte gUnknown_02039238
_08128E08:
	adds r0, r2, 0x5
	str r0, [r3]
_08128E0C:
	pop {r0}
	bx r0
	thumb_func_end sub_8128DD0

	thumb_func_start sub_8128E10
sub_8128E10: @ 8128E10
	push {lr}
	bl contest_ai_get_user_order
	ldr r0, _08128E40
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128E44
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08128E48
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128E4C
	.align 2, 0
_08128E40: .4byte 0x020192e4
_08128E44: .4byte gUnknown_02039238
_08128E48:
	adds r0, r2, 0x5
	str r0, [r3]
_08128E4C:
	pop {r0}
	bx r0
	thumb_func_end sub_8128E10

	thumb_func_start contest_ai_get_user_condition_maybe
contest_ai_get_user_condition_maybe: @ 8128E50
	push {r4,lr}
	ldr r4, _08128E88
	adds r0, r4, 0
	adds r0, 0x41
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r4, 0
	subs r1, 0x84
	adds r0, r1
	ldrb r0, [r0, 0xD]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0xA
	bl __divsi3
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x18]
	ldr r1, _08128E8C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08128E88: .4byte 0x020192e4
_08128E8C: .4byte gUnknown_02039238
	thumb_func_end contest_ai_get_user_condition_maybe

	thumb_func_start sub_8128E90
sub_8128E90: @ 8128E90
	push {lr}
	bl contest_ai_get_user_condition_maybe
	ldr r0, _08128EC0
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128EC4
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08128EC8
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128ECC
	.align 2, 0
_08128EC0: .4byte 0x020192e4
_08128EC4: .4byte gUnknown_02039238
_08128EC8:
	adds r0, r2, 0x5
	str r0, [r3]
_08128ECC:
	pop {r0}
	bx r0
	thumb_func_end sub_8128E90

	thumb_func_start sub_8128ED0
sub_8128ED0: @ 8128ED0
	push {lr}
	bl contest_ai_get_user_condition_maybe
	ldr r0, _08128F00
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128F04
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08128F08
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128F0C
	.align 2, 0
_08128F00: .4byte 0x020192e4
_08128F04: .4byte gUnknown_02039238
_08128F08:
	adds r0, r2, 0x5
	str r0, [r3]
_08128F0C:
	pop {r0}
	bx r0
	thumb_func_end sub_8128ED0

	thumb_func_start sub_8128F10
sub_8128F10: @ 8128F10
	push {lr}
	bl contest_ai_get_user_condition_maybe
	ldr r0, _08128F40
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128F44
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08128F48
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128F4C
	.align 2, 0
_08128F40: .4byte 0x020192e4
_08128F44: .4byte gUnknown_02039238
_08128F48:
	adds r0, r2, 0x5
	str r0, [r3]
_08128F4C:
	pop {r0}
	bx r0
	thumb_func_end sub_8128F10

	thumb_func_start sub_8128F50
sub_8128F50: @ 8128F50
	push {lr}
	bl contest_ai_get_user_condition_maybe
	ldr r0, _08128F80
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128F84
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08128F88
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128F8C
	.align 2, 0
_08128F80: .4byte 0x020192e4
_08128F84: .4byte gUnknown_02039238
_08128F88:
	adds r0, r2, 0x5
	str r0, [r3]
_08128F8C:
	pop {r0}
	bx r0
	thumb_func_end sub_8128F50

	thumb_func_start sub_8128F90
sub_8128F90: @ 8128F90
	ldr r2, _08128FB4
	adds r0, r2, 0
	adds r0, 0x41
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r2, 0
	subs r1, 0x84
	adds r0, r1
	ldrh r0, [r0, 0x4]
	strh r0, [r2, 0x18]
	ldr r1, _08128FB8
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08128FB4: .4byte 0x020192e4
_08128FB8: .4byte gUnknown_02039238
	thumb_func_end sub_8128F90

	thumb_func_start sub_8128FBC
sub_8128FBC: @ 8128FBC
	push {r4,r5,lr}
	bl sub_8128F90
	ldr r2, _08128FF4
	ldr r4, _08128FF8
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bge _08128FFC
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08129000
	.align 2, 0
_08128FF4: .4byte 0x020192e4
_08128FF8: .4byte gUnknown_02039238
_08128FFC:
	adds r0, r3, 0x6
	str r0, [r4]
_08129000:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8128FBC

	thumb_func_start sub_8129008
sub_8129008: @ 8129008
	push {r4,r5,lr}
	bl sub_8128F90
	ldr r2, _08129040
	ldr r4, _08129044
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	ble _08129048
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812904C
	.align 2, 0
_08129040: .4byte 0x020192e4
_08129044: .4byte gUnknown_02039238
_08129048:
	adds r0, r3, 0x6
	str r0, [r4]
_0812904C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8129008

	thumb_func_start sub_8129054
sub_8129054: @ 8129054
	push {r4,r5,lr}
	bl sub_8128F90
	ldr r2, _0812908C
	ldr r4, _08129090
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bne _08129094
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08129098
	.align 2, 0
_0812908C: .4byte 0x020192e4
_08129090: .4byte gUnknown_02039238
_08129094:
	adds r0, r3, 0x6
	str r0, [r4]
_08129098:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8129054

	thumb_func_start sub_81290A0
sub_81290A0: @ 81290A0
	push {r4,r5,lr}
	bl sub_8128F90
	ldr r2, _081290D8
	ldr r4, _081290DC
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	beq _081290E0
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _081290E4
	.align 2, 0
_081290D8: .4byte 0x020192e4
_081290DC: .4byte gUnknown_02039238
_081290E0:
	adds r0, r3, 0x6
	str r0, [r4]
_081290E4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81290A0

	thumb_func_start sub_81290EC
sub_81290EC: @ 81290EC
	ldr r2, _08129108
	ldr r1, _0812910C
	adds r0, r2, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2, 0x18]
	ldr r1, _08129110
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08129108: .4byte 0x020192e4
_0812910C: .4byte gUnknown_02038670
_08129110: .4byte gUnknown_02039238
	thumb_func_end sub_81290EC

	thumb_func_start sub_8129114
sub_8129114: @ 8129114
	push {r4,r5,lr}
	bl sub_81290EC
	ldr r2, _0812914C
	ldr r4, _08129150
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bge _08129154
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08129158
	.align 2, 0
_0812914C: .4byte 0x020192e4
_08129150: .4byte gUnknown_02039238
_08129154:
	adds r0, r3, 0x6
	str r0, [r4]
_08129158:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8129114

	thumb_func_start sub_8129160
sub_8129160: @ 8129160
	push {r4,r5,lr}
	bl sub_81290EC
	ldr r2, _08129198
	ldr r4, _0812919C
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	ble _081291A0
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _081291A4
	.align 2, 0
_08129198: .4byte 0x020192e4
_0812919C: .4byte gUnknown_02039238
_081291A0:
	adds r0, r3, 0x6
	str r0, [r4]
_081291A4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8129160

	thumb_func_start sub_81291AC
sub_81291AC: @ 81291AC
	push {r4,r5,lr}
	bl sub_81290EC
	ldr r2, _081291E4
	ldr r4, _081291E8
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bne _081291EC
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _081291F0
	.align 2, 0
_081291E4: .4byte 0x020192e4
_081291E8: .4byte gUnknown_02039238
_081291EC:
	adds r0, r3, 0x6
	str r0, [r4]
_081291F0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81291AC

	thumb_func_start sub_81291F8
sub_81291F8: @ 81291F8
	push {r4,r5,lr}
	bl sub_81290EC
	ldr r2, _08129230
	ldr r4, _08129234
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	beq _08129238
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812923C
	.align 2, 0
_08129230: .4byte 0x020192e4
_08129234: .4byte gUnknown_02039238
_08129238:
	adds r0, r3, 0x6
	str r0, [r4]
_0812923C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81291F8

	thumb_func_start contest_ai_get_contest_type
contest_ai_get_contest_type: @ 8129244
	ldr r1, _08129258
	ldr r0, _0812925C
	ldrh r0, [r0]
	strh r0, [r1, 0x18]
	ldr r1, _08129260
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08129258: .4byte 0x020192e4
_0812925C: .4byte gUnknown_0203869C
_08129260: .4byte gUnknown_02039238
	thumb_func_end contest_ai_get_contest_type

	thumb_func_start sub_8129264
sub_8129264: @ 8129264
	push {lr}
	bl contest_ai_get_contest_type
	ldr r0, _08129294
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129298
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0812929C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081292A0
	.align 2, 0
_08129294: .4byte 0x020192e4
_08129298: .4byte gUnknown_02039238
_0812929C:
	adds r0, r2, 0x5
	str r0, [r3]
_081292A0:
	pop {r0}
	bx r0
	thumb_func_end sub_8129264

	thumb_func_start sub_81292A4
sub_81292A4: @ 81292A4
	push {lr}
	bl contest_ai_get_contest_type
	ldr r0, _081292D4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081292D8
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _081292DC
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081292E0
	.align 2, 0
_081292D4: .4byte 0x020192e4
_081292D8: .4byte gUnknown_02039238
_081292DC:
	adds r0, r2, 0x5
	str r0, [r3]
_081292E0:
	pop {r0}
	bx r0
	thumb_func_end sub_81292A4

	thumb_func_start contest_ai_get_move_excitement
contest_ai_get_move_excitement: @ 81292E4
	push {r4,lr}
	ldr r2, _08129318
	ldr r4, _0812931C
	ldrb r1, [r4, 0x4]
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	bl contest_get_move_excitement
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x18]
	ldr r1, _08129320
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08129318: .4byte gUnknown_02038570
_0812931C: .4byte 0x020192e4
_08129320: .4byte gUnknown_02039238
	thumb_func_end contest_ai_get_move_excitement

	thumb_func_start sub_8129324
sub_8129324: @ 8129324
	push {r4,lr}
	bl contest_ai_get_move_excitement
	ldr r0, _08129354
	ldr r3, _08129358
	ldr r2, [r3]
	movs r4, 0x18
	ldrsh r1, [r0, r4]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bge _0812935C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129360
	.align 2, 0
_08129354: .4byte 0x020192e4
_08129358: .4byte gUnknown_02039238
_0812935C:
	adds r0, r2, 0x5
	str r0, [r3]
_08129360:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8129324

	thumb_func_start sub_8129368
sub_8129368: @ 8129368
	push {r4,lr}
	bl contest_ai_get_move_excitement
	ldr r0, _08129398
	ldr r3, _0812939C
	ldr r2, [r3]
	movs r4, 0x18
	ldrsh r1, [r0, r4]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	ble _081293A0
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081293A4
	.align 2, 0
_08129398: .4byte 0x020192e4
_0812939C: .4byte gUnknown_02039238
_081293A0:
	adds r0, r2, 0x5
	str r0, [r3]
_081293A4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8129368

	thumb_func_start sub_81293AC
sub_81293AC: @ 81293AC
	push {r4,lr}
	bl contest_ai_get_move_excitement
	ldr r0, _081293DC
	ldr r3, _081293E0
	ldr r2, [r3]
	movs r4, 0x18
	ldrsh r1, [r0, r4]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _081293E4
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081293E8
	.align 2, 0
_081293DC: .4byte 0x020192e4
_081293E0: .4byte gUnknown_02039238
_081293E4:
	adds r0, r2, 0x5
	str r0, [r3]
_081293E8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81293AC

	thumb_func_start sub_81293F0
sub_81293F0: @ 81293F0
	push {r4,lr}
	bl contest_ai_get_move_excitement
	ldr r0, _08129420
	ldr r3, _08129424
	ldr r2, [r3]
	movs r4, 0x18
	ldrsh r1, [r0, r4]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	beq _08129428
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812942C
	.align 2, 0
_08129420: .4byte 0x020192e4
_08129424: .4byte gUnknown_02039238
_08129428:
	adds r0, r2, 0x5
	str r0, [r3]
_0812942C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81293F0

	thumb_func_start contest_ai_get_move_effect
contest_ai_get_move_effect: @ 8129434
	ldr r2, _08129460
	ldr r3, _08129464
	ldrb r1, [r3, 0x4]
	lsls r1, 1
	adds r0, r3, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	ldr r1, _08129468
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r3, 0x18]
	ldr r1, _0812946C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08129460: .4byte gUnknown_02038570
_08129464: .4byte 0x020192e4
_08129468: .4byte gContestMoves
_0812946C: .4byte gUnknown_02039238
	thumb_func_end contest_ai_get_move_effect

	thumb_func_start sub_8129470
sub_8129470: @ 8129470
	push {lr}
	bl contest_ai_get_move_effect
	ldr r0, _081294A0
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081294A4
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _081294A8
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081294AC
	.align 2, 0
_081294A0: .4byte 0x020192e4
_081294A4: .4byte gUnknown_02039238
_081294A8:
	adds r0, r2, 0x5
	str r0, [r3]
_081294AC:
	pop {r0}
	bx r0
	thumb_func_end sub_8129470

	thumb_func_start sub_81294B0
sub_81294B0: @ 81294B0
	push {lr}
	bl contest_ai_get_move_effect
	ldr r0, _081294E0
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081294E4
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _081294E8
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081294EC
	.align 2, 0
_081294E0: .4byte 0x020192e4
_081294E4: .4byte gUnknown_02039238
_081294E8:
	adds r0, r2, 0x5
	str r0, [r3]
_081294EC:
	pop {r0}
	bx r0
	thumb_func_end sub_81294B0

	thumb_func_start contest_ai_get_move_effect_type
contest_ai_get_move_effect_type: @ 81294F0
	ldr r2, _08129524
	ldr r3, _08129528
	ldrb r1, [r3, 0x4]
	lsls r1, 1
	adds r0, r3, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	ldr r2, _0812952C
	ldr r1, _08129530
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r3, 0x18]
	ldr r1, _08129534
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08129524: .4byte gUnknown_02038570
_08129528: .4byte 0x020192e4
_0812952C: .4byte gContestEffects
_08129530: .4byte gContestMoves
_08129534: .4byte gUnknown_02039238
	thumb_func_end contest_ai_get_move_effect_type

	thumb_func_start sub_8129538
sub_8129538: @ 8129538
	push {lr}
	bl contest_ai_get_move_effect_type
	ldr r0, _08129568
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812956C
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08129570
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129574
	.align 2, 0
_08129568: .4byte 0x020192e4
_0812956C: .4byte gUnknown_02039238
_08129570:
	adds r0, r2, 0x5
	str r0, [r3]
_08129574:
	pop {r0}
	bx r0
	thumb_func_end sub_8129538

	thumb_func_start sub_8129578
sub_8129578: @ 8129578
	push {lr}
	bl contest_ai_get_move_effect_type
	ldr r0, _081295A8
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081295AC
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _081295B0
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081295B4
	.align 2, 0
_081295A8: .4byte 0x020192e4
_081295AC: .4byte gUnknown_02039238
_081295B0:
	adds r0, r2, 0x5
	str r0, [r3]
_081295B4:
	pop {r0}
	bx r0
	thumb_func_end sub_8129578

	thumb_func_start contest_ai_check_move_has_highest_appeal
contest_ai_check_move_has_highest_appeal: @ 81295B8
	push {r4-r7,lr}
	ldr r2, _08129610
	ldr r3, _08129614
	ldrb r0, [r3, 0x4]
	lsls r0, 1
	adds r1, r3, 0
	adds r1, 0x41
	ldrb r1, [r1]
	lsls r1, 6
	adds r0, r1
	adds r2, 0x1E
	adds r0, r2
	ldrh r0, [r0]
	ldr r4, _08129618
	ldr r5, _0812961C
	lsls r0, 3
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldrb r7, [r0, 0x1]
	movs r6, 0
	ldr r0, _08129620
	mov r12, r0
	adds r1, r2
_081295EA:
	ldrh r0, [r1]
	cmp r0, 0
	beq _08129600
	lsls r0, 3
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x1]
	cmp r7, r0
	bcc _08129608
_08129600:
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _081295EA
_08129608:
	cmp r6, 0x4
	bne _08129624
	movs r0, 0x1
	b _08129626
	.align 2, 0
_08129610: .4byte gUnknown_02038570
_08129614: .4byte 0x020192e4
_08129618: .4byte gContestEffects
_0812961C: .4byte gContestMoves
_08129620: .4byte gUnknown_02039238
_08129624:
	movs r0, 0
_08129626:
	strh r0, [r3, 0x18]
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end contest_ai_check_move_has_highest_appeal

	thumb_func_start sub_8129638
sub_8129638: @ 8129638
	push {lr}
	bl contest_ai_check_move_has_highest_appeal
	ldr r0, _08129664
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812966C
	ldr r3, _08129668
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129674
	.align 2, 0
_08129664: .4byte 0x020192e4
_08129668: .4byte gUnknown_02039238
_0812966C:
	ldr r1, _08129678
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_08129674:
	pop {r0}
	bx r0
	.align 2, 0
_08129678: .4byte gUnknown_02039238
	thumb_func_end sub_8129638

	thumb_func_start sub_812967C
sub_812967C: @ 812967C
	push {r4-r7,lr}
	ldr r2, _081296D4
	ldr r3, _081296D8
	ldrb r0, [r3, 0x4]
	lsls r0, 1
	adds r1, r3, 0
	adds r1, 0x41
	ldrb r1, [r1]
	lsls r1, 6
	adds r0, r1
	adds r2, 0x1E
	adds r0, r2
	ldrh r0, [r0]
	ldr r4, _081296DC
	ldr r5, _081296E0
	lsls r0, 3
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldrb r7, [r0, 0x2]
	movs r6, 0
	ldr r0, _081296E4
	mov r12, r0
	adds r1, r2
_081296AE:
	ldrh r0, [r1]
	cmp r0, 0
	beq _081296C4
	lsls r0, 3
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x2]
	cmp r7, r0
	bcc _081296CC
_081296C4:
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _081296AE
_081296CC:
	cmp r6, 0x4
	bne _081296E8
	movs r0, 0x1
	b _081296EA
	.align 2, 0
_081296D4: .4byte gUnknown_02038570
_081296D8: .4byte 0x020192e4
_081296DC: .4byte gContestEffects
_081296E0: .4byte gContestMoves
_081296E4: .4byte gUnknown_02039238
_081296E8:
	movs r0, 0
_081296EA:
	strh r0, [r3, 0x18]
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812967C

	thumb_func_start sub_81296FC
sub_81296FC: @ 81296FC
	push {lr}
	bl sub_812967C
	ldr r0, _08129728
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08129730
	ldr r3, _0812972C
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129738
	.align 2, 0
_08129728: .4byte 0x020192e4
_0812972C: .4byte gUnknown_02039238
_08129730:
	ldr r1, _0812973C
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08129738:
	pop {r0}
	bx r0
	.align 2, 0
_0812973C: .4byte gUnknown_02039238
	thumb_func_end sub_81296FC

	thumb_func_start sub_8129740
sub_8129740: @ 8129740
	push {r4,lr}
	ldr r2, _08129784
	ldr r4, _08129788
	ldrb r1, [r4, 0x4]
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	ldr r2, _0812978C
	ldr r1, _08129790
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x18]
	ldr r1, _08129794
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08129784: .4byte gUnknown_02038570
_08129788: .4byte 0x020192e4
_0812978C: .4byte gContestEffects
_08129790: .4byte gContestMoves
_08129794: .4byte gUnknown_02039238
	thumb_func_end sub_8129740

	thumb_func_start sub_8129798
sub_8129798: @ 8129798
	push {lr}
	bl sub_8129740
	ldr r0, _081297C8
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081297CC
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _081297D0
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081297D4
	.align 2, 0
_081297C8: .4byte 0x020192e4
_081297CC: .4byte gUnknown_02039238
_081297D0:
	adds r0, r2, 0x5
	str r0, [r3]
_081297D4:
	pop {r0}
	bx r0
	thumb_func_end sub_8129798

	thumb_func_start sub_81297D8
sub_81297D8: @ 81297D8
	push {lr}
	bl sub_8129740
	ldr r0, _08129808
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812980C
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08129810
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129814
	.align 2, 0
_08129808: .4byte 0x020192e4
_0812980C: .4byte gUnknown_02039238
_08129810:
	adds r0, r2, 0x5
	str r0, [r3]
_08129814:
	pop {r0}
	bx r0
	thumb_func_end sub_81297D8

	thumb_func_start sub_8129818
sub_8129818: @ 8129818
	push {lr}
	bl sub_8129740
	ldr r0, _08129848
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812984C
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08129850
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129854
	.align 2, 0
_08129848: .4byte 0x020192e4
_0812984C: .4byte gUnknown_02039238
_08129850:
	adds r0, r2, 0x5
	str r0, [r3]
_08129854:
	pop {r0}
	bx r0
	thumb_func_end sub_8129818

	thumb_func_start sub_8129858
sub_8129858: @ 8129858
	push {lr}
	bl sub_8129740
	ldr r0, _08129888
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812988C
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08129890
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129894
	.align 2, 0
_08129888: .4byte 0x020192e4
_0812988C: .4byte gUnknown_02039238
_08129890:
	adds r0, r2, 0x5
	str r0, [r3]
_08129894:
	pop {r0}
	bx r0
	thumb_func_end sub_8129858

	thumb_func_start sub_8129898
sub_8129898: @ 8129898
	push {r4,lr}
	ldr r2, _081298DC
	ldr r4, _081298E0
	ldrb r1, [r4, 0x4]
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	ldr r2, _081298E4
	ldr r1, _081298E8
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x18]
	ldr r1, _081298EC
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081298DC: .4byte gUnknown_02038570
_081298E0: .4byte 0x020192e4
_081298E4: .4byte gContestEffects
_081298E8: .4byte gContestMoves
_081298EC: .4byte gUnknown_02039238
	thumb_func_end sub_8129898

	thumb_func_start sub_81298F0
sub_81298F0: @ 81298F0
	push {lr}
	bl sub_8129898
	ldr r0, _08129920
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129924
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08129928
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812992C
	.align 2, 0
_08129920: .4byte 0x020192e4
_08129924: .4byte gUnknown_02039238
_08129928:
	adds r0, r2, 0x5
	str r0, [r3]
_0812992C:
	pop {r0}
	bx r0
	thumb_func_end sub_81298F0

	thumb_func_start sub_8129930
sub_8129930: @ 8129930
	push {lr}
	bl sub_8129898
	ldr r0, _08129960
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129964
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08129968
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812996C
	.align 2, 0
_08129960: .4byte 0x020192e4
_08129964: .4byte gUnknown_02039238
_08129968:
	adds r0, r2, 0x5
	str r0, [r3]
_0812996C:
	pop {r0}
	bx r0
	thumb_func_end sub_8129930

	thumb_func_start sub_8129970
sub_8129970: @ 8129970
	push {lr}
	bl sub_8129898
	ldr r0, _081299A0
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081299A4
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _081299A8
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081299AC
	.align 2, 0
_081299A0: .4byte 0x020192e4
_081299A4: .4byte gUnknown_02039238
_081299A8:
	adds r0, r2, 0x5
	str r0, [r3]
_081299AC:
	pop {r0}
	bx r0
	thumb_func_end sub_8129970

	thumb_func_start sub_81299B0
sub_81299B0: @ 81299B0
	push {lr}
	bl sub_8129898
	ldr r0, _081299E0
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081299E4
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _081299E8
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081299EC
	.align 2, 0
_081299E0: .4byte 0x020192e4
_081299E4: .4byte gUnknown_02039238
_081299E8:
	adds r0, r2, 0x5
	str r0, [r3]
_081299EC:
	pop {r0}
	bx r0
	thumb_func_end sub_81299B0

	thumb_func_start contest_ai_get_move_used_count
contest_ai_get_move_used_count: @ 81299F0
	push {r4,lr}
	ldr r3, _08129A20
	ldr r4, _08129A24
	ldrb r0, [r4, 0x4]
	lsls r0, 1
	adds r1, r4, 0
	adds r1, 0x41
	ldrb r2, [r1]
	lsls r1, r2, 6
	adds r0, r1
	adds r3, 0x1E
	adds r0, r3
	ldrh r3, [r0]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r1, r4, 0
	subs r1, 0x84
	adds r0, r1
	ldrh r1, [r0, 0x8]
	cmp r3, r1
	beq _08129A28
	movs r0, 0
	b _08129A30
	.align 2, 0
_08129A20: .4byte gUnknown_02038570
_08129A24: .4byte 0x020192e4
_08129A28:
	ldrb r0, [r0, 0xB]
	lsls r0, 25
	lsrs r0, 29
	adds r0, 0x1
_08129A30:
	strh r0, [r4, 0x18]
	ldr r1, _08129A40
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08129A40: .4byte gUnknown_02039238
	thumb_func_end contest_ai_get_move_used_count

	thumb_func_start sub_8129A44
sub_8129A44: @ 8129A44
	push {lr}
	bl contest_ai_get_move_used_count
	ldr r0, _08129A74
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129A78
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08129A7C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129A80
	.align 2, 0
_08129A74: .4byte 0x020192e4
_08129A78: .4byte gUnknown_02039238
_08129A7C:
	adds r0, r2, 0x5
	str r0, [r3]
_08129A80:
	pop {r0}
	bx r0
	thumb_func_end sub_8129A44

	thumb_func_start sub_8129A84
sub_8129A84: @ 8129A84
	push {lr}
	bl contest_ai_get_move_used_count
	ldr r0, _08129AB4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129AB8
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08129ABC
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129AC0
	.align 2, 0
_08129AB4: .4byte 0x020192e4
_08129AB8: .4byte gUnknown_02039238
_08129ABC:
	adds r0, r2, 0x5
	str r0, [r3]
_08129AC0:
	pop {r0}
	bx r0
	thumb_func_end sub_8129A84

	thumb_func_start sub_8129AC4
sub_8129AC4: @ 8129AC4
	push {lr}
	bl contest_ai_get_move_used_count
	ldr r0, _08129AF4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129AF8
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08129AFC
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129B00
	.align 2, 0
_08129AF4: .4byte 0x020192e4
_08129AF8: .4byte gUnknown_02039238
_08129AFC:
	adds r0, r2, 0x5
	str r0, [r3]
_08129B00:
	pop {r0}
	bx r0
	thumb_func_end sub_8129AC4

	thumb_func_start sub_8129B04
sub_8129B04: @ 8129B04
	push {lr}
	bl contest_ai_get_move_used_count
	ldr r0, _08129B34
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129B38
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08129B3C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129B40
	.align 2, 0
_08129B34: .4byte 0x020192e4
_08129B38: .4byte gUnknown_02039238
_08129B3C:
	adds r0, r2, 0x5
	str r0, [r3]
_08129B40:
	pop {r0}
	bx r0
	thumb_func_end sub_8129B04

	thumb_func_start contest_ai_check_combo_starter
contest_ai_check_combo_starter: @ 8129B44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r3, _08129BAC
	ldr r2, _08129BB0
	ldrb r1, [r2, 0x4]
	lsls r1, 1
	adds r2, 0x41
	ldrb r0, [r2]
	lsls r0, 6
	adds r1, r0
	adds r3, 0x1E
	adds r1, r3
	ldrh r6, [r1]
	movs r4, 0
	mov r8, r2
	adds r7, r3, 0
_08129B68:
	lsls r0, r4, 1
	mov r2, r8
	ldrb r1, [r2]
	lsls r1, 6
	adds r0, r1
	adds r1, r0, r7
	ldrh r0, [r1]
	cmp r0, 0
	beq _08129B8A
	adds r1, r0, 0
	adds r0, r6, 0
	bl AreMovesContestCombo
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08129B94
_08129B8A:
	adds r4, 0x1
	cmp r4, 0x3
	ble _08129B68
	cmp r5, 0
	beq _08129B96
_08129B94:
	movs r5, 0x1
_08129B96:
	ldr r0, _08129BB0
	strh r5, [r0, 0x18]
	ldr r1, _08129BB4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08129BAC: .4byte gUnknown_02038570
_08129BB0: .4byte 0x020192e4
_08129BB4: .4byte gUnknown_02039238
	thumb_func_end contest_ai_check_combo_starter

	thumb_func_start sub_8129BB8
sub_8129BB8: @ 8129BB8
	push {lr}
	bl contest_ai_check_combo_starter
	ldr r0, _08129BE4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08129BEC
	ldr r3, _08129BE8
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129BF4
	.align 2, 0
_08129BE4: .4byte 0x020192e4
_08129BE8: .4byte gUnknown_02039238
_08129BEC:
	ldr r1, _08129BF8
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_08129BF4:
	pop {r0}
	bx r0
	.align 2, 0
_08129BF8: .4byte gUnknown_02039238
	thumb_func_end sub_8129BB8

	thumb_func_start sub_8129BFC
sub_8129BFC: @ 8129BFC
	push {lr}
	bl contest_ai_check_combo_starter
	ldr r0, _08129C28
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08129C30
	ldr r3, _08129C2C
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129C38
	.align 2, 0
_08129C28: .4byte 0x020192e4
_08129C2C: .4byte gUnknown_02039238
_08129C30:
	ldr r1, _08129C3C
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_08129C38:
	pop {r0}
	bx r0
	.align 2, 0
_08129C3C: .4byte gUnknown_02039238
	thumb_func_end sub_8129BFC

	thumb_func_start contest_ai_check_combo_finisher
contest_ai_check_combo_finisher: @ 8129C40
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r3, _08129CA8
	ldr r2, _08129CAC
	ldrb r1, [r2, 0x4]
	lsls r1, 1
	adds r2, 0x41
	ldrb r0, [r2]
	lsls r0, 6
	adds r1, r0
	adds r3, 0x1E
	adds r1, r3
	ldrh r6, [r1]
	movs r4, 0
	mov r8, r2
	adds r7, r3, 0
_08129C64:
	lsls r0, r4, 1
	mov r2, r8
	ldrb r1, [r2]
	lsls r1, 6
	adds r0, r1
	adds r1, r0, r7
	ldrh r0, [r1]
	cmp r0, 0
	beq _08129C84
	adds r1, r6, 0
	bl AreMovesContestCombo
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08129C8E
_08129C84:
	adds r4, 0x1
	cmp r4, 0x3
	ble _08129C64
	cmp r5, 0
	beq _08129C90
_08129C8E:
	movs r5, 0x1
_08129C90:
	ldr r0, _08129CAC
	strh r5, [r0, 0x18]
	ldr r1, _08129CB0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08129CA8: .4byte gUnknown_02038570
_08129CAC: .4byte 0x020192e4
_08129CB0: .4byte gUnknown_02039238
	thumb_func_end contest_ai_check_combo_finisher

	thumb_func_start sub_8129CB4
sub_8129CB4: @ 8129CB4
	push {lr}
	bl contest_ai_check_combo_finisher
	ldr r0, _08129CE0
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08129CE8
	ldr r3, _08129CE4
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129CF0
	.align 2, 0
_08129CE0: .4byte 0x020192e4
_08129CE4: .4byte gUnknown_02039238
_08129CE8:
	ldr r1, _08129CF4
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_08129CF0:
	pop {r0}
	bx r0
	.align 2, 0
_08129CF4: .4byte gUnknown_02039238
	thumb_func_end sub_8129CB4

	thumb_func_start sub_8129CF8
sub_8129CF8: @ 8129CF8
	push {lr}
	bl contest_ai_check_combo_finisher
	ldr r0, _08129D24
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08129D2C
	ldr r3, _08129D28
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129D34
	.align 2, 0
_08129D24: .4byte 0x020192e4
_08129D28: .4byte gUnknown_02039238
_08129D2C:
	ldr r1, _08129D38
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_08129D34:
	pop {r0}
	bx r0
	.align 2, 0
_08129D38: .4byte gUnknown_02039238
	thumb_func_end sub_8129CF8

	thumb_func_start contest_ai_check_would_finish_combo
contest_ai_check_would_finish_combo: @ 8129D3C
	push {r4,r5,lr}
	movs r5, 0
	ldr r3, _08129D8C
	ldr r4, _08129D90
	ldrb r0, [r4, 0x4]
	lsls r0, 1
	adds r1, r4, 0
	adds r1, 0x41
	ldrb r2, [r1]
	lsls r1, r2, 6
	adds r0, r1
	adds r3, 0x1E
	adds r0, r3
	ldrh r3, [r0]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r1, r4, 0
	subs r1, 0x84
	adds r1, r0, r1
	ldrh r0, [r1, 0x8]
	cmp r0, 0
	beq _08129D74
	adds r1, r3, 0
	bl AreMovesContestCombo
	lsls r0, 24
	lsrs r5, r0, 24
_08129D74:
	cmp r5, 0
	beq _08129D7A
	movs r5, 0x1
_08129D7A:
	strh r5, [r4, 0x18]
	ldr r1, _08129D94
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08129D8C: .4byte gUnknown_02038570
_08129D90: .4byte 0x020192e4
_08129D94: .4byte gUnknown_02039238
	thumb_func_end contest_ai_check_would_finish_combo

	thumb_func_start sub_8129D98
sub_8129D98: @ 8129D98
	push {lr}
	bl contest_ai_check_would_finish_combo
	ldr r0, _08129DC4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08129DCC
	ldr r3, _08129DC8
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129DD4
	.align 2, 0
_08129DC4: .4byte 0x020192e4
_08129DC8: .4byte gUnknown_02039238
_08129DCC:
	ldr r1, _08129DD8
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_08129DD4:
	pop {r0}
	bx r0
	.align 2, 0
_08129DD8: .4byte gUnknown_02039238
	thumb_func_end sub_8129D98

	thumb_func_start sub_8129DDC
sub_8129DDC: @ 8129DDC
	push {lr}
	bl contest_ai_check_would_finish_combo
	ldr r0, _08129E08
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08129E10
	ldr r3, _08129E0C
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129E18
	.align 2, 0
_08129E08: .4byte 0x020192e4
_08129E0C: .4byte gUnknown_02039238
_08129E10:
	ldr r1, _08129E1C
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_08129E18:
	pop {r0}
	bx r0
	.align 2, 0
_08129E1C: .4byte gUnknown_02039238
	thumb_func_end sub_8129DDC

	thumb_func_start contest_ai_get_condition
contest_ai_get_condition: @ 8129E20
	push {r4,r5,lr}
	ldr r4, _08129E5C
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08129E60
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r5, 0
	subs r0, 0x84
	adds r1, r0
	movs r0, 0xD
	ldrsb r0, [r1, r0]
	movs r1, 0xA
	bl __divsi3
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0x18]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08129E5C: .4byte gUnknown_02039238
_08129E60: .4byte 0x020192e4
	thumb_func_end contest_ai_get_condition

	thumb_func_start sub_8129E64
sub_8129E64: @ 8129E64
	push {lr}
	bl contest_ai_get_condition
	ldr r0, _08129E94
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129E98
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08129E9C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129EA0
	.align 2, 0
_08129E94: .4byte 0x020192e4
_08129E98: .4byte gUnknown_02039238
_08129E9C:
	adds r0, r2, 0x5
	str r0, [r3]
_08129EA0:
	pop {r0}
	bx r0
	thumb_func_end sub_8129E64

	thumb_func_start sub_8129EA4
sub_8129EA4: @ 8129EA4
	push {lr}
	bl contest_ai_get_condition
	ldr r0, _08129ED4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129ED8
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08129EDC
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129EE0
	.align 2, 0
_08129ED4: .4byte 0x020192e4
_08129ED8: .4byte gUnknown_02039238
_08129EDC:
	adds r0, r2, 0x5
	str r0, [r3]
_08129EE0:
	pop {r0}
	bx r0
	thumb_func_end sub_8129EA4

	thumb_func_start sub_8129EE4
sub_8129EE4: @ 8129EE4
	push {lr}
	bl contest_ai_get_condition
	ldr r0, _08129F14
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129F18
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08129F1C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129F20
	.align 2, 0
_08129F14: .4byte 0x020192e4
_08129F18: .4byte gUnknown_02039238
_08129F1C:
	adds r0, r2, 0x5
	str r0, [r3]
_08129F20:
	pop {r0}
	bx r0
	thumb_func_end sub_8129EE4

	thumb_func_start sub_8129F24
sub_8129F24: @ 8129F24
	push {lr}
	bl contest_ai_get_condition
	ldr r0, _08129F54
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129F58
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08129F5C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129F60
	.align 2, 0
_08129F54: .4byte 0x020192e4
_08129F58: .4byte gUnknown_02039238
_08129F5C:
	adds r0, r2, 0x5
	str r0, [r3]
_08129F60:
	pop {r0}
	bx r0
	thumb_func_end sub_8129F24

	thumb_func_start contest_ai_get_used_combo_starter
contest_ai_get_used_combo_starter: @ 8129F64
	push {r4-r6,lr}
	movs r6, 0
	ldr r5, _08129FAC
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80B214C
	lsls r0, 24
	cmp r0, 0
	beq _08129F9C
	ldr r2, _08129FB0
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r1, _08129FB4
	adds r0, r1
	ldrh r0, [r0, 0x8]
	lsls r0, 3
	adds r0, r2
	ldrb r1, [r0, 0x2]
	negs r0, r1
	orrs r0, r1
	lsrs r6, r0, 31
_08129F9C:
	ldr r0, _08129FB8
	strh r6, [r0, 0x18]
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08129FAC: .4byte gUnknown_02039238
_08129FB0: .4byte gContestMoves
_08129FB4: .4byte 0x02019260
_08129FB8: .4byte 0x020192e4
	thumb_func_end contest_ai_get_used_combo_starter

	thumb_func_start sub_8129FBC
sub_8129FBC: @ 8129FBC
	push {lr}
	bl contest_ai_get_used_combo_starter
	ldr r0, _08129FEC
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129FF0
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08129FF4
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129FF8
	.align 2, 0
_08129FEC: .4byte 0x020192e4
_08129FF0: .4byte gUnknown_02039238
_08129FF4:
	adds r0, r2, 0x5
	str r0, [r3]
_08129FF8:
	pop {r0}
	bx r0
	thumb_func_end sub_8129FBC

	thumb_func_start sub_8129FFC
sub_8129FFC: @ 8129FFC
	push {lr}
	bl contest_ai_get_used_combo_starter
	ldr r0, _0812A02C
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A030
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _0812A034
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A038
	.align 2, 0
_0812A02C: .4byte 0x020192e4
_0812A030: .4byte gUnknown_02039238
_0812A034:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A038:
	pop {r0}
	bx r0
	thumb_func_end sub_8129FFC

	thumb_func_start sub_812A03C
sub_812A03C: @ 812A03C
	push {lr}
	bl contest_ai_get_used_combo_starter
	ldr r0, _0812A06C
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A070
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0812A074
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A078
	.align 2, 0
_0812A06C: .4byte 0x020192e4
_0812A070: .4byte gUnknown_02039238
_0812A074:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A078:
	pop {r0}
	bx r0
	thumb_func_end sub_812A03C

	thumb_func_start sub_812A07C
sub_812A07C: @ 812A07C
	push {lr}
	bl contest_ai_get_used_combo_starter
	ldr r0, _0812A0AC
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A0B0
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0812A0B4
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A0B8
	.align 2, 0
_0812A0AC: .4byte 0x020192e4
_0812A0B0: .4byte gUnknown_02039238
_0812A0B4:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A0B8:
	pop {r0}
	bx r0
	thumb_func_end sub_812A07C

	thumb_func_start contest_ai_check_can_participate
contest_ai_check_can_participate: @ 812A0BC
	push {lr}
	ldr r0, _0812A0DC
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r0, 24
	bl sub_80AF59C
	lsls r0, 24
	cmp r0, 0
	beq _0812A0E4
	ldr r1, _0812A0E0
	movs r0, 0
	b _0812A0E8
	.align 2, 0
_0812A0DC: .4byte gUnknown_02039238
_0812A0E0: .4byte 0x020192e4
_0812A0E4:
	ldr r1, _0812A0F8
	movs r0, 0x1
_0812A0E8:
	strh r0, [r1, 0x18]
	ldr r1, _0812A0FC
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0812A0F8: .4byte 0x020192e4
_0812A0FC: .4byte gUnknown_02039238
	thumb_func_end contest_ai_check_can_participate

	thumb_func_start sub_812A100
sub_812A100: @ 812A100
	push {lr}
	bl contest_ai_check_can_participate
	ldr r0, _0812A12C
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812A134
	ldr r3, _0812A130
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A13C
	.align 2, 0
_0812A12C: .4byte 0x020192e4
_0812A130: .4byte gUnknown_02039238
_0812A134:
	ldr r1, _0812A140
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A13C:
	pop {r0}
	bx r0
	.align 2, 0
_0812A140: .4byte gUnknown_02039238
	thumb_func_end sub_812A100

	thumb_func_start sub_812A144
sub_812A144: @ 812A144
	push {lr}
	bl contest_ai_check_can_participate
	ldr r0, _0812A170
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812A178
	ldr r3, _0812A174
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A180
	.align 2, 0
_0812A170: .4byte 0x020192e4
_0812A174: .4byte gUnknown_02039238
_0812A178:
	ldr r1, _0812A184
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A180:
	pop {r0}
	bx r0
	.align 2, 0
_0812A184: .4byte gUnknown_02039238
	thumb_func_end sub_812A144

	thumb_func_start contest_ai_get_val_812A188
contest_ai_get_val_812A188: @ 812A188
	push {r4,lr}
	ldr r4, _0812A1BC
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812A1C0
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r2, 0
	subs r0, 0x84
	adds r1, r0
	ldrb r0, [r1, 0x15]
	lsls r0, 28
	lsrs r0, 31
	strh r0, [r2, 0x18]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A1BC: .4byte gUnknown_02039238
_0812A1C0: .4byte 0x020192e4
	thumb_func_end contest_ai_get_val_812A188

	thumb_func_start sub_812A1C4
sub_812A1C4: @ 812A1C4
	push {lr}
	bl contest_ai_get_val_812A188
	ldr r0, _0812A1F0
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812A1F8
	ldr r3, _0812A1F4
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A200
	.align 2, 0
_0812A1F0: .4byte 0x020192e4
_0812A1F4: .4byte gUnknown_02039238
_0812A1F8:
	ldr r1, _0812A204
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A200:
	pop {r0}
	bx r0
	.align 2, 0
_0812A204: .4byte gUnknown_02039238
	thumb_func_end sub_812A1C4

	thumb_func_start sub_812A208
sub_812A208: @ 812A208
	push {lr}
	bl contest_ai_get_val_812A188
	ldr r0, _0812A234
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812A23C
	ldr r3, _0812A238
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A244
	.align 2, 0
_0812A234: .4byte 0x020192e4
_0812A238: .4byte gUnknown_02039238
_0812A23C:
	ldr r1, _0812A248
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A244:
	pop {r0}
	bx r0
	.align 2, 0
_0812A248: .4byte gUnknown_02039238
	thumb_func_end sub_812A208

	thumb_func_start sub_812A24C
sub_812A24C: @ 812A24C
	push {r4,r5,lr}
	ldr r5, _0812A28C
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0812A290
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r4, r3, 0
	subs r4, 0x84
	adds r1, r4
	adds r0, r3, 0
	adds r0, 0x41
	ldrb r2, [r0]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r1, 0x4]
	ldrh r0, [r0, 0x4]
	subs r1, r0
	strh r1, [r3, 0x18]
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812A28C: .4byte gUnknown_02039238
_0812A290: .4byte 0x020192e4
	thumb_func_end sub_812A24C

	thumb_func_start sub_812A294
sub_812A294: @ 812A294
	push {lr}
	bl sub_812A24C
	ldr r0, _0812A2C0
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0812A2C8
	ldr r3, _0812A2C4
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A2D0
	.align 2, 0
_0812A2C0: .4byte 0x020192e4
_0812A2C4: .4byte gUnknown_02039238
_0812A2C8:
	ldr r1, _0812A2D4
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A2D0:
	pop {r0}
	bx r0
	.align 2, 0
_0812A2D4: .4byte gUnknown_02039238
	thumb_func_end sub_812A294

	thumb_func_start sub_812A2D8
sub_812A2D8: @ 812A2D8
	push {lr}
	bl sub_812A24C
	ldr r0, _0812A304
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	ble _0812A30C
	ldr r3, _0812A308
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A314
	.align 2, 0
_0812A304: .4byte 0x020192e4
_0812A308: .4byte gUnknown_02039238
_0812A30C:
	ldr r1, _0812A318
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A314:
	pop {r0}
	bx r0
	.align 2, 0
_0812A318: .4byte gUnknown_02039238
	thumb_func_end sub_812A2D8

	thumb_func_start sub_812A31C
sub_812A31C: @ 812A31C
	push {lr}
	bl sub_812A24C
	ldr r0, _0812A348
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812A350
	ldr r3, _0812A34C
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A358
	.align 2, 0
_0812A348: .4byte 0x020192e4
_0812A34C: .4byte gUnknown_02039238
_0812A350:
	ldr r1, _0812A35C
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A358:
	pop {r0}
	bx r0
	.align 2, 0
_0812A35C: .4byte gUnknown_02039238
	thumb_func_end sub_812A31C

	thumb_func_start sub_812A360
sub_812A360: @ 812A360
	push {lr}
	bl sub_812A24C
	ldr r0, _0812A38C
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812A394
	ldr r3, _0812A390
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A39C
	.align 2, 0
_0812A38C: .4byte 0x020192e4
_0812A390: .4byte gUnknown_02039238
_0812A394:
	ldr r1, _0812A3A0
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A39C:
	pop {r0}
	bx r0
	.align 2, 0
_0812A3A0: .4byte gUnknown_02039238
	thumb_func_end sub_812A360

	thumb_func_start sub_812A3A4
sub_812A3A4: @ 812A3A4
	push {r4,lr}
	ldr r4, _0812A3D8
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	ldr r3, _0812A3DC
	ldr r2, _0812A3E0
	lsrs r0, 23
	adds r0, r2
	adds r1, r3, 0
	adds r1, 0x41
	ldrb r1, [r1]
	lsls r1, 1
	adds r1, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r3, 0x18]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A3D8: .4byte gUnknown_02039238
_0812A3DC: .4byte 0x020192e4
_0812A3E0: .4byte gUnknown_02038670
	thumb_func_end sub_812A3A4

	thumb_func_start sub_812A3E4
sub_812A3E4: @ 812A3E4
	push {lr}
	bl sub_812A3A4
	ldr r0, _0812A410
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0812A418
	ldr r3, _0812A414
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A420
	.align 2, 0
_0812A410: .4byte 0x020192e4
_0812A414: .4byte gUnknown_02039238
_0812A418:
	ldr r1, _0812A424
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A420:
	pop {r0}
	bx r0
	.align 2, 0
_0812A424: .4byte gUnknown_02039238
	thumb_func_end sub_812A3E4

	thumb_func_start sub_812A428
sub_812A428: @ 812A428
	push {lr}
	bl sub_812A3A4
	ldr r0, _0812A454
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	ble _0812A45C
	ldr r3, _0812A458
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A464
	.align 2, 0
_0812A454: .4byte 0x020192e4
_0812A458: .4byte gUnknown_02039238
_0812A45C:
	ldr r1, _0812A468
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A464:
	pop {r0}
	bx r0
	.align 2, 0
_0812A468: .4byte gUnknown_02039238
	thumb_func_end sub_812A428

	thumb_func_start sub_812A46C
sub_812A46C: @ 812A46C
	push {lr}
	bl sub_812A3A4
	ldr r0, _0812A498
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812A4A0
	ldr r3, _0812A49C
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A4A8
	.align 2, 0
_0812A498: .4byte 0x020192e4
_0812A49C: .4byte gUnknown_02039238
_0812A4A0:
	ldr r1, _0812A4AC
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A4A8:
	pop {r0}
	bx r0
	.align 2, 0
_0812A4AC: .4byte gUnknown_02039238
	thumb_func_end sub_812A46C

	thumb_func_start sub_812A4B0
sub_812A4B0: @ 812A4B0
	push {lr}
	bl sub_812A3A4
	ldr r0, _0812A4DC
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812A4E4
	ldr r3, _0812A4E0
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A4EC
	.align 2, 0
_0812A4DC: .4byte 0x020192e4
_0812A4E0: .4byte gUnknown_02039238
_0812A4E4:
	ldr r1, _0812A4F0
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A4EC:
	pop {r0}
	bx r0
	.align 2, 0
_0812A4F0: .4byte gUnknown_02039238
	thumb_func_end sub_812A4B0

	thumb_func_start sub_812A4F4
sub_812A4F4: @ 812A4F4
	push {r4,lr}
	ldr r4, _0812A52C
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	ldr r3, [r4]
	ldrb r1, [r3, 0x2]
	ldr r2, _0812A530
	lsrs r0, 23
	lsls r1, 3
	adds r0, r1
	adds r1, r2, 0
	adds r1, 0x1C
	adds r0, r1
	ldrh r0, [r0]
	adds r2, 0xE0
	ldr r1, _0812A534
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r2, 0x18]
	adds r3, 0x3
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A52C: .4byte gUnknown_02039238
_0812A530: .4byte 0x02019204
_0812A534: .4byte gContestMoves
	thumb_func_end sub_812A4F4

	thumb_func_start sub_812A538
sub_812A538: @ 812A538
	push {lr}
	bl sub_812A4F4
	ldr r0, _0812A568
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A56C
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _0812A570
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A574
	.align 2, 0
_0812A568: .4byte 0x020192e4
_0812A56C: .4byte gUnknown_02039238
_0812A570:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A574:
	pop {r0}
	bx r0
	thumb_func_end sub_812A538

	thumb_func_start sub_812A578
sub_812A578: @ 812A578
	push {lr}
	bl sub_812A4F4
	ldr r0, _0812A5A8
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A5AC
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _0812A5B0
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A5B4
	.align 2, 0
_0812A5A8: .4byte 0x020192e4
_0812A5AC: .4byte gUnknown_02039238
_0812A5B0:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A5B4:
	pop {r0}
	bx r0
	thumb_func_end sub_812A578

	thumb_func_start sub_812A5B8
sub_812A5B8: @ 812A5B8
	push {lr}
	bl sub_812A4F4
	ldr r0, _0812A5E8
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A5EC
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0812A5F0
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A5F4
	.align 2, 0
_0812A5E8: .4byte 0x020192e4
_0812A5EC: .4byte gUnknown_02039238
_0812A5F0:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A5F4:
	pop {r0}
	bx r0
	thumb_func_end sub_812A5B8

	thumb_func_start sub_812A5F8
sub_812A5F8: @ 812A5F8
	push {lr}
	bl sub_812A4F4
	ldr r0, _0812A628
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A62C
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0812A630
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A634
	.align 2, 0
_0812A628: .4byte 0x020192e4
_0812A62C: .4byte gUnknown_02039238
_0812A630:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A634:
	pop {r0}
	bx r0
	thumb_func_end sub_812A5F8

	thumb_func_start sub_812A638
sub_812A638: @ 812A638
	push {r4,lr}
	ldr r4, _0812A66C
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [r4]
	ldrb r1, [r3, 0x2]
	ldr r2, _0812A670
	lsls r1, 2
	adds r0, r1
	adds r1, r2, 0
	adds r1, 0x44
	adds r0, r1
	adds r2, 0xE0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r2, 0x18]
	adds r3, 0x3
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A66C: .4byte gUnknown_02039238
_0812A670: .4byte 0x02019204
	thumb_func_end sub_812A638

	thumb_func_start sub_812A674
sub_812A674: @ 812A674
	push {lr}
	bl sub_812A638
	ldr r0, _0812A6A4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A6A8
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _0812A6AC
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A6B0
	.align 2, 0
_0812A6A4: .4byte 0x020192e4
_0812A6A8: .4byte gUnknown_02039238
_0812A6AC:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A6B0:
	pop {r0}
	bx r0
	thumb_func_end sub_812A674

	thumb_func_start sub_812A6B4
sub_812A6B4: @ 812A6B4
	push {lr}
	bl sub_812A638
	ldr r0, _0812A6E4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A6E8
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _0812A6EC
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A6F0
	.align 2, 0
_0812A6E4: .4byte 0x020192e4
_0812A6E8: .4byte gUnknown_02039238
_0812A6EC:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A6F0:
	pop {r0}
	bx r0
	thumb_func_end sub_812A6B4

	thumb_func_start sub_812A6F4
sub_812A6F4: @ 812A6F4
	push {lr}
	bl sub_812A638
	ldr r0, _0812A724
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A728
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0812A72C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A730
	.align 2, 0
_0812A724: .4byte 0x020192e4
_0812A728: .4byte gUnknown_02039238
_0812A72C:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A730:
	pop {r0}
	bx r0
	thumb_func_end sub_812A6F4

	thumb_func_start sub_812A734
sub_812A734: @ 812A734
	push {lr}
	bl sub_812A638
	ldr r0, _0812A764
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A768
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0812A76C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A770
	.align 2, 0
_0812A764: .4byte 0x020192e4
_0812A768: .4byte gUnknown_02039238
_0812A76C:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A770:
	pop {r0}
	bx r0
	thumb_func_end sub_812A734

	thumb_func_start sub_812A774
sub_812A774: @ 812A774
	push {r4,r5,lr}
	ldr r5, _0812A7B4
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	ldr r3, [r5]
	ldrb r1, [r3, 0x2]
	ldr r2, _0812A7B8
	lsrs r0, 23
	lsls r1, 3
	adds r0, r1
	adds r1, r2, 0
	adds r1, 0x1C
	adds r0, r1
	ldrh r0, [r0]
	adds r2, 0xE0
	ldr r4, _0812A7BC
	ldr r1, _0812A7C0
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0]
	strh r0, [r2, 0x18]
	adds r3, 0x3
	str r3, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812A7B4: .4byte gUnknown_02039238
_0812A7B8: .4byte 0x02019204
_0812A7BC: .4byte gContestEffects
_0812A7C0: .4byte gContestMoves
	thumb_func_end sub_812A774

	thumb_func_start sub_812A7C4
sub_812A7C4: @ 812A7C4
	push {lr}
	bl sub_812A774
	ldr r0, _0812A7F4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A7F8
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0812A7FC
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A800
	.align 2, 0
_0812A7F4: .4byte 0x020192e4
_0812A7F8: .4byte gUnknown_02039238
_0812A7FC:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A800:
	pop {r0}
	bx r0
	thumb_func_end sub_812A7C4

	thumb_func_start sub_812A804
sub_812A804: @ 812A804
	push {lr}
	bl sub_812A774
	ldr r0, _0812A834
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A838
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0812A83C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A840
	.align 2, 0
_0812A834: .4byte 0x020192e4
_0812A838: .4byte gUnknown_02039238
_0812A83C:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A840:
	pop {r0}
	bx r0
	thumb_func_end sub_812A804

	thumb_func_start sub_812A844
sub_812A844: @ 812A844
	push {r4,lr}
	ldr r3, _0812A864
	ldr r4, _0812A868
	ldr r2, [r4]
	ldrb r0, [r2, 0x1]
	lsls r0, 1
	adds r1, r3, 0
	adds r1, 0x1A
	adds r0, r1
	ldrh r1, [r3, 0x18]
	strh r1, [r0]
	adds r2, 0x2
	str r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A864: .4byte 0x020192e4
_0812A868: .4byte gUnknown_02039238
	thumb_func_end sub_812A844

	thumb_func_start sub_812A86C
sub_812A86C: @ 812A86C
	push {r4,lr}
	ldr r0, _0812A890
	ldr r4, _0812A894
	ldr r3, [r4]
	ldrb r2, [r3, 0x1]
	lsls r2, 1
	adds r0, 0x1A
	adds r2, r0
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	adds r3, 0x4
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A890: .4byte 0x020192e4
_0812A894: .4byte gUnknown_02039238
	thumb_func_end sub_812A86C

	thumb_func_start sub_812A898
sub_812A898: @ 812A898
	push {r4,lr}
	ldr r0, _0812A8C4
	ldr r4, _0812A8C8
	ldr r3, [r4]
	ldrb r2, [r3, 0x1]
	lsls r2, 1
	adds r0, 0x1A
	adds r2, r0
	movs r1, 0x2
	ldrsb r1, [r3, r1]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrh r0, [r2]
	adds r1, r0
	strh r1, [r2]
	adds r3, 0x4
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A8C4: .4byte 0x020192e4
_0812A8C8: .4byte gUnknown_02039238
	thumb_func_end sub_812A898

	thumb_func_start sub_812A8CC
sub_812A8CC: @ 812A8CC
	push {r4,lr}
	ldr r2, _0812A8F4
	ldr r4, _0812A8F8
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	adds r3, 0x3
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A8F4: .4byte 0x020192e4
_0812A8F8: .4byte gUnknown_02039238
	thumb_func_end sub_812A8CC

	thumb_func_start sub_812A8FC
sub_812A8FC: @ 812A8FC
	push {r4,lr}
	ldr r2, _0812A924
	ldr r4, _0812A928
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	adds r3, 0x3
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A924: .4byte 0x020192e4
_0812A928: .4byte gUnknown_02039238
	thumb_func_end sub_812A8FC

	thumb_func_start sub_812A92C
sub_812A92C: @ 812A92C
	push {r4,lr}
	ldr r1, _0812A964
	ldr r4, _0812A968
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r2, [r0, r1]
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	cmp r2, r1
	bge _0812A96C
	ldrb r1, [r3, 0x4]
	ldrb r0, [r3, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812A972
	.align 2, 0
_0812A964: .4byte 0x020192e4
_0812A968: .4byte gUnknown_02039238
_0812A96C:
	adds r0, r3, 0
	adds r0, 0x8
	str r0, [r4]
_0812A972:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812A92C

	thumb_func_start sub_812A978
sub_812A978: @ 812A978
	push {r4,lr}
	ldr r1, _0812A9B0
	ldr r4, _0812A9B4
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r2, [r0, r1]
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	cmp r2, r1
	ble _0812A9B8
	ldrb r1, [r3, 0x4]
	ldrb r0, [r3, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812A9BE
	.align 2, 0
_0812A9B0: .4byte 0x020192e4
_0812A9B4: .4byte gUnknown_02039238
_0812A9B8:
	adds r0, r3, 0
	adds r0, 0x8
	str r0, [r4]
_0812A9BE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812A978

	thumb_func_start sub_812A9C4
sub_812A9C4: @ 812A9C4
	push {r4,lr}
	ldr r1, _0812A9FC
	ldr r4, _0812AA00
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r2, [r0, r1]
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	cmp r2, r1
	bne _0812AA04
	ldrb r1, [r3, 0x4]
	ldrb r0, [r3, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AA0A
	.align 2, 0
_0812A9FC: .4byte 0x020192e4
_0812AA00: .4byte gUnknown_02039238
_0812AA04:
	adds r0, r3, 0
	adds r0, 0x8
	str r0, [r4]
_0812AA0A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812A9C4

	thumb_func_start sub_812AA10
sub_812AA10: @ 812AA10
	push {r4,lr}
	ldr r1, _0812AA48
	ldr r4, _0812AA4C
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r2, [r0, r1]
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	cmp r2, r1
	beq _0812AA50
	ldrb r1, [r3, 0x4]
	ldrb r0, [r3, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AA56
	.align 2, 0
_0812AA48: .4byte 0x020192e4
_0812AA4C: .4byte gUnknown_02039238
_0812AA50:
	adds r0, r3, 0
	adds r0, 0x8
	str r0, [r4]
_0812AA56:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812AA10

	thumb_func_start sub_812AA5C
sub_812AA5C: @ 812AA5C
	push {r4,lr}
	ldr r2, _0812AA98
	ldr r4, _0812AA9C
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bge _0812AAA0
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AAA4
	.align 2, 0
_0812AA98: .4byte 0x020192e4
_0812AA9C: .4byte gUnknown_02039238
_0812AAA0:
	adds r0, r3, 0x7
	str r0, [r4]
_0812AAA4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812AA5C

	thumb_func_start sub_812AAAC
sub_812AAAC: @ 812AAAC
	push {r4,lr}
	ldr r2, _0812AAE8
	ldr r4, _0812AAEC
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _0812AAF0
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AAF4
	.align 2, 0
_0812AAE8: .4byte 0x020192e4
_0812AAEC: .4byte gUnknown_02039238
_0812AAF0:
	adds r0, r3, 0x7
	str r0, [r4]
_0812AAF4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812AAAC

	thumb_func_start sub_812AAFC
sub_812AAFC: @ 812AAFC
	push {r4,lr}
	ldr r2, _0812AB38
	ldr r4, _0812AB3C
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bne _0812AB40
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AB44
	.align 2, 0
_0812AB38: .4byte 0x020192e4
_0812AB3C: .4byte gUnknown_02039238
_0812AB40:
	adds r0, r3, 0x7
	str r0, [r4]
_0812AB44:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812AAFC

	thumb_func_start sub_812AB4C
sub_812AB4C: @ 812AB4C
	push {r4,lr}
	ldr r2, _0812AB88
	ldr r4, _0812AB8C
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	beq _0812AB90
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AB94
	.align 2, 0
_0812AB88: .4byte 0x020192e4
_0812AB8C: .4byte gUnknown_02039238
_0812AB90:
	adds r0, r3, 0x7
	str r0, [r4]
_0812AB94:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812AB4C

	thumb_func_start sub_812AB9C
sub_812AB9C: @ 812AB9C
	push {r4,lr}
	bl Random
	movs r2, 0xFF
	ands r2, r0
	ldr r1, _0812ABD4
	ldr r4, _0812ABD8
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r2, r0
	bge _0812ABDC
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812ABE0
	.align 2, 0
_0812ABD4: .4byte 0x020192e4
_0812ABD8: .4byte gUnknown_02039238
_0812ABDC:
	adds r0, r3, 0x6
	str r0, [r4]
_0812ABE0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812AB9C

	thumb_func_start sub_812ABE8
sub_812ABE8: @ 812ABE8
	push {r4,lr}
	bl Random
	movs r2, 0xFF
	ands r2, r0
	ldr r1, _0812AC20
	ldr r4, _0812AC24
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r2, r0
	ble _0812AC28
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AC2C
	.align 2, 0
_0812AC20: .4byte 0x020192e4
_0812AC24: .4byte gUnknown_02039238
_0812AC28:
	adds r0, r3, 0x6
	str r0, [r4]
_0812AC2C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812ABE8

	thumb_func_start sub_812AC34
sub_812AC34: @ 812AC34
	ldr r3, _0812AC50
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	bx lr
	.align 2, 0
_0812AC50: .4byte gUnknown_02039238
	thumb_func_end sub_812AC34

	thumb_func_start sub_812AC54
sub_812AC54: @ 812AC54
	push {r4,lr}
	ldr r4, _0812AC80
	ldr r0, [r4]
	adds r0, 0x5
	bl sub_812ACA4
	ldr r2, [r4]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812AC80: .4byte gUnknown_02039238
	thumb_func_end sub_812AC54

	thumb_func_start sub_812AC84
sub_812AC84: @ 812AC84
	push {lr}
	bl sub_812ACC8
	lsls r0, 24
	cmp r0, 0
	bne _0812AC9A
	ldr r2, _0812ACA0
	ldrb r1, [r2, 0x9]
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
_0812AC9A:
	pop {r0}
	bx r0
	.align 2, 0
_0812ACA0: .4byte 0x020192e4
	thumb_func_end sub_812AC84

	thumb_func_start sub_812ACA4
sub_812ACA4: @ 812ACA4
	push {r4,lr}
	ldr r3, _0812ACC4
	adds r4, r3, 0
	adds r4, 0x40
	ldrb r1, [r4]
	adds r2, r1, 0x1
	strb r2, [r4]
	lsls r1, 24
	lsrs r1, 22
	adds r3, 0x20
	adds r1, r3
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812ACC4: .4byte 0x020192e4
	thumb_func_end sub_812ACA4

	thumb_func_start sub_812ACC8
sub_812ACC8: @ 812ACC8
	push {lr}
	ldr r1, _0812ACDC
	adds r3, r1, 0
	adds r3, 0x40
	ldrb r0, [r3]
	cmp r0, 0
	bne _0812ACE0
	movs r0, 0
	b _0812ACF4
	.align 2, 0
_0812ACDC: .4byte 0x020192e4
_0812ACE0:
	subs r0, 0x1
	strb r0, [r3]
	ldr r2, _0812ACF8
	ldrb r0, [r3]
	lsls r0, 2
	adds r1, 0x20
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	movs r0, 0x1
_0812ACF4:
	pop {r1}
	bx r1
	.align 2, 0
_0812ACF8: .4byte gUnknown_02039238
	thumb_func_end sub_812ACC8

	thumb_func_start contest_ai_check_for_exciting_move
contest_ai_check_for_exciting_move: @ 812ACFC
	push {r4-r7,lr}
	movs r5, 0
	movs r4, 0
	ldr r7, _0812AD28
	ldr r6, _0812AD2C
_0812AD06:
	lsls r0, r4, 1
	ldrb r1, [r7]
	lsls r1, 6
	adds r0, r1
	adds r1, r0, r6
	ldrh r0, [r1]
	cmp r0, 0
	beq _0812AD30
	bl contest_get_move_excitement
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0812AD30
	movs r5, 0x1
	b _0812AD36
	.align 2, 0
_0812AD28: .4byte 0x02019325
_0812AD2C: .4byte gUnknown_0203858E
_0812AD30:
	adds r4, 0x1
	cmp r4, 0x3
	ble _0812AD06
_0812AD36:
	ldr r0, _0812AD48
	strh r5, [r0, 0x18]
	ldr r1, _0812AD4C
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812AD48: .4byte 0x020192e4
_0812AD4C: .4byte gUnknown_02039238
	thumb_func_end contest_ai_check_for_exciting_move

	thumb_func_start sub_812AD50
sub_812AD50: @ 812AD50
	push {lr}
	bl contest_ai_check_for_exciting_move
	ldr r0, _0812AD7C
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812AD84
	ldr r3, _0812AD80
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812AD8C
	.align 2, 0
_0812AD7C: .4byte 0x020192e4
_0812AD80: .4byte gUnknown_02039238
_0812AD84:
	ldr r1, _0812AD90
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812AD8C:
	pop {r0}
	bx r0
	.align 2, 0
_0812AD90: .4byte gUnknown_02039238
	thumb_func_end sub_812AD50

	thumb_func_start sub_812AD94
sub_812AD94: @ 812AD94
	push {lr}
	bl contest_ai_check_for_exciting_move
	ldr r0, _0812ADC0
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812ADC8
	ldr r3, _0812ADC4
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812ADD0
	.align 2, 0
_0812ADC0: .4byte 0x020192e4
_0812ADC4: .4byte gUnknown_02039238
_0812ADC8:
	ldr r1, _0812ADD4
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812ADD0:
	pop {r0}
	bx r0
	.align 2, 0
_0812ADD4: .4byte gUnknown_02039238
	thumb_func_end sub_812AD94

	thumb_func_start sub_812ADD8
sub_812ADD8: @ 812ADD8
	push {r4-r7,lr}
	movs r6, 0
	ldr r2, _0812AE08
	ldr r0, [r2]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r4, r0
	movs r3, 0
	ldr r0, _0812AE0C
	mov r12, r0
	ldr r5, _0812AE10
	adds r0, r5, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	mov r1, r12
	adds r1, 0x1E
	adds r0, r1
	ldrh r0, [r0]
	adds r7, r2, 0
	mov r2, r12
	mov r12, r5
	b _0812AE2E
	.align 2, 0
_0812AE08: .4byte gUnknown_02039238
_0812AE0C: .4byte gUnknown_02038570
_0812AE10: .4byte 0x020192e4
_0812AE14:
	adds r3, 0x1
	cmp r3, 0x3
	bgt _0812AE34
	lsls r1, r3, 1
	mov r0, r12
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r0, r2, 0
	adds r0, 0x1E
	adds r1, r0
	ldrh r0, [r1]
_0812AE2E:
	cmp r0, r4
	bne _0812AE14
	movs r6, 0x1
_0812AE34:
	mov r0, r12
	strh r6, [r0, 0x18]
	ldr r0, [r7]
	adds r0, 0x3
	str r0, [r7]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812ADD8

	thumb_func_start sub_812AE44
sub_812AE44: @ 812AE44
	push {lr}
	bl sub_812ADD8
	ldr r0, _0812AE70
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812AE78
	ldr r3, _0812AE74
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812AE80
	.align 2, 0
_0812AE70: .4byte 0x020192e4
_0812AE74: .4byte gUnknown_02039238
_0812AE78:
	ldr r1, _0812AE84
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812AE80:
	pop {r0}
	bx r0
	.align 2, 0
_0812AE84: .4byte gUnknown_02039238
	thumb_func_end sub_812AE44

	thumb_func_start sub_812AE88
sub_812AE88: @ 812AE88
	push {lr}
	bl sub_812ADD8
	ldr r0, _0812AEB4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812AEBC
	ldr r3, _0812AEB8
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812AEC4
	.align 2, 0
_0812AEB4: .4byte 0x020192e4
_0812AEB8: .4byte gUnknown_02039238
_0812AEBC:
	ldr r1, _0812AEC8
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812AEC4:
	pop {r0}
	bx r0
	.align 2, 0
_0812AEC8: .4byte gUnknown_02039238
	thumb_func_end sub_812AE88

	.align 2, 0 @ Don't pad with nop.
