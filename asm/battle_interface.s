	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8045D58
sub_8045D58: @ 8045D58
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	beq _08045D72
	cmp r1, 0x1
	beq _08045E54
	b _08045F42
_08045D72:
	lsls r5, r6, 2
	adds r3, r5, r6
	lsls r3, 2
	ldr r4, _08045E00 @ =0x02017850
	adds r2, r3, r4
	ldr r0, [r2, 0x4]
	ldr r1, [r2, 0x8]
	ldr r2, [r2, 0xC]
	adds r4, 0x10
	adds r3, r4
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x6
	str r4, [sp, 0x4]
	bl sub_804602C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	mov r8, r1
	adds r1, r5, 0
	cmp r0, 0x18
	bhi _08045DAC
	movs r2, 0x38
	mov r8, r2
	cmp r0, 0x9
	bls _08045DAC
	movs r4, 0x2F
	mov r8, r4
_08045DAC:
	movs r5, 0
	ldr r7, _08045E04 @ =gSprites
	adds r0, r1, r6
	lsls r6, r0, 2
_08045DB4:
	ldr r0, _08045E00 @ =0x02017850
	adds r0, r6, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldrh r0, [r0, 0x38]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r5, 0x1
	bhi _08045E10
	mov r0, r8
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r2, r5, 0x2
	adds r1, r2
	lsls r1, 5
	ldr r2, _08045E08 @ =0x06010000
	adds r1, r2
	ldr r2, _08045E0C @ =REG_BG0CNT
	bl CpuSet
	b _08045E3E
	.align 2, 0
_08045E00: .4byte 0x02017850
_08045E04: .4byte gSprites
_08045E08: .4byte 0x06010000
_08045E0C: .4byte REG_BG0CNT
_08045E10:
	mov r0, r8
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r5, r1
	lsls r1, 5
	ldr r4, _08045E4C @ =0x06010040
	adds r1, r4
	ldr r2, _08045E50 @ =REG_BG0CNT
	bl CpuSet
_08045E3E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08045DB4
	b _08045F42
	.align 2, 0
_08045E4C: .4byte 0x06010040
_08045E50: .4byte REG_BG0CNT
_08045E54:
	lsls r5, r6, 2
	adds r3, r5, r6
	lsls r3, 2
	ldr r4, _08045EF0 @ =0x02017850
	adds r2, r3, r4
	ldr r0, [r2, 0x4]
	ldr r1, [r2, 0x8]
	ldr r2, [r2, 0xC]
	adds r4, 0x10
	adds r3, r4
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x8
	str r4, [sp, 0x4]
	bl sub_804602C
	ldr r1, _08045EF4 @ =gUnknown_02024A6A
	lsls r0, r6, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08045EF8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	adds r1, r5, 0
	cmp r0, 0x64
	bne _08045EAA
	movs r5, 0
	movs r2, 0
_08045E98:
	mov r0, sp
	adds r0, r5
	adds r0, 0x8
	strb r2, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _08045E98
_08045EAA:
	movs r5, 0
	ldr r7, _08045EFC @ =gSprites
	adds r0, r1, r6
	lsls r0, 2
	ldr r1, _08045EF0 @ =0x02017850
	adds r4, r0, r1
_08045EB6:
	cmp r5, 0x3
	bhi _08045F08
	movs r0, 0xC
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r2, r5, 0
	adds r2, 0x24
	adds r1, r2
	lsls r1, 5
	ldr r2, _08045F00 @ =0x06010000
	adds r1, r2
	ldr r2, _08045F04 @ =REG_BG0CNT
	bl CpuSet
	b _08045F38
	.align 2, 0
_08045EF0: .4byte 0x02017850
_08045EF4: .4byte gUnknown_02024A6A
_08045EF8: .4byte gPlayerParty
_08045EFC: .4byte gSprites
_08045F00: .4byte 0x06010000
_08045F04: .4byte REG_BG0CNT
_08045F08:
	movs r0, 0xC
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r5, r1
	lsls r1, 5
	ldr r2, _08045F50 @ =0x06010b80
	adds r1, r2
	ldr r2, _08045F54 @ =REG_BG0CNT
	bl CpuSet
_08045F38:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _08045EB6
_08045F42:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045F50: .4byte 0x06010b80
_08045F54: .4byte REG_BG0CNT
	thumb_func_end sub_8045D58

	thumb_func_start sub_8045F58
sub_8045F58: @ 8045F58
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r4, r1, 0
	mov r8, r2
	adds r5, r3, 0
	ldr r1, [sp, 0x18]
	ldr r0, [sp, 0x1C]
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 27
	lsrs r2, r1, 24
	ldr r1, [r5]
	ldr r0, _08045F84 @ =0xffff8000
	cmp r1, r0
	bne _08045F8A
	cmp r7, r2
	bge _08045F88
	lsls r0, r4, 8
	str r0, [r5]
	b _08045F8A
	.align 2, 0
_08045F84: .4byte 0xffff8000
_08045F88:
	str r4, [r5]
_08045F8A:
	mov r0, r8
	subs r4, r0
	cmp r4, 0
	bge _08045F96
	movs r4, 0
	b _08045F9C
_08045F96:
	cmp r4, r7
	ble _08045F9C
	adds r4, r7, 0
_08045F9C:
	cmp r7, r2
	bge _08045FB8
	ldr r0, [r5]
	asrs r1, r0, 8
	adds r6, r0, 0
	cmp r4, r1
	bne _08045FC4
	movs r0, 0xFF
	ands r0, r6
	cmp r0, 0
	bne _08045FC4
	movs r0, 0x1
	negs r0, r0
	b _08046020
_08045FB8:
	ldr r6, [r5]
	cmp r4, r6
	bne _08045FC4
	movs r0, 0x1
	negs r0, r0
	b _08046020
_08045FC4:
	cmp r7, r2
	bge _08045FFE
	lsls r0, r7, 8
	adds r1, r2, 0
	bl __divsi3
	mov r1, r8
	cmp r1, 0
	bge _08045FE2
	adds r0, r6, r0
	str r0, [r5]
	asrs r2, r0, 8
	cmp r2, r4
	blt _0804601E
	b _08045FF6
_08045FE2:
	subs r0, r6, r0
	str r0, [r5]
	asrs r2, r0, 8
	movs r1, 0xFF
	ands r0, r1
	cmp r0, 0
	ble _08045FF2
	adds r2, 0x1
_08045FF2:
	cmp r2, r4
	bgt _0804601E
_08045FF6:
	lsls r0, r4, 8
	str r0, [r5]
	adds r2, r4, 0
	b _0804601E
_08045FFE:
	mov r0, r8
	cmp r0, 0
	bge _08046010
	ldr r0, [r5]
	adds r0, r3
	str r0, [r5]
	cmp r0, r4
	ble _0804601C
	b _0804601A
_08046010:
	ldr r0, [r5]
	subs r0, r3
	str r0, [r5]
	cmp r0, r4
	bge _0804601C
_0804601A:
	str r4, [r5]
_0804601C:
	ldr r2, [r5]
_0804601E:
	adds r0, r2, 0
_08046020:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8045F58

	thumb_func_start sub_804602C
sub_804602C: @ 804602C
	push {r4-r7,lr}
	adds r4, r0, 0
	mov r12, r3
	ldr r7, [sp, 0x14]
	ldr r0, [sp, 0x18]
	lsls r0, 24
	lsrs r6, r0, 24
	subs r5, r1, r2
	cmp r5, 0
	bge _08046044
	movs r5, 0
	b _0804604A
_08046044:
	cmp r5, r4
	ble _0804604A
	adds r5, r4, 0
_0804604A:
	lsls r0, r6, 27
	lsrs r3, r0, 24
	movs r1, 0
	cmp r1, r6
	bcs _08046064
	movs r2, 0
_08046056:
	adds r0, r7, r1
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r6
	bcc _08046056
_08046064:
	cmp r4, r3
	bge _08046078
	mov r1, r12
	ldr r0, [r1]
	muls r0, r3
	adds r1, r4, 0
	bl __divsi3
	asrs r0, 8
	b _08046084
_08046078:
	mov r1, r12
	ldr r0, [r1]
	muls r0, r3
	adds r1, r4, 0
	bl __divsi3
_08046084:
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	cmp r3, 0
	bne _0804609A
	cmp r5, 0
	ble _0804609A
	movs r0, 0x1
	strb r0, [r7]
	movs r3, 0x1
	b _080460BE
_0804609A:
	movs r1, 0
	movs r4, 0x8
_0804609E:
	cmp r1, r6
	bcs _080460BE
	cmp r2, 0x7
	bls _080460BA
	adds r0, r7, r1
	strb r4, [r0]
	adds r0, r2, 0
	subs r0, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	b _0804609E
_080460BA:
	adds r0, r7, r1
	strb r2, [r0]
_080460BE:
	adds r0, r3, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_804602C

	thumb_func_start sub_80460C8
sub_80460C8: @ 80460C8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	mov r8, r3
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	ldr r2, [r5, 0x8]
	movs r3, 0x6
	str r3, [sp]
	movs r3, 0x1
	str r3, [sp, 0x4]
	adds r3, r6, 0
	bl sub_8045F58
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_8046128
	ldr r0, [r5]
	cmp r0, 0x2F
	bgt _08046108
	ldr r0, [r6]
	lsls r0, 8
	lsrs r1, r0, 16
	b _0804610A
_08046108:
	ldrh r1, [r6]
_0804610A:
	movs r2, 0
	ldrsh r0, [r5, r2]
	lsls r1, 16
	asrs r1, 16
	mov r2, r8
	bl sub_804373C
	lsls r0, r7, 16
	asrs r0, 16
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80460C8

	thumb_func_start sub_8046128
sub_8046128: @ 8046128
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x1C
	adds r5, r0, 0
	adds r3, r1, 0
	mov r8, r2
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	ldr r2, [r5, 0x8]
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x6
	str r4, [sp, 0x4]
	bl sub_804602C
	movs r3, 0
	add r7, sp, 0x10
	mov r12, r7
	ldrb r0, [r5, 0xC]
	lsls r6, r0, 27
	ldr r4, [r5, 0x10]
_08046154:
	lsls r2, r3, 1
	add r2, r12
	lsrs r1, r6, 15
	mov r0, sp
	adds r0, r3
	adds r0, 0x8
	ldrb r0, [r0]
	adds r0, r4, r0
	orrs r1, r0
	strh r1, [r2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x5
	bls _08046154
	adds r0, r7, 0
	mov r1, r8
	movs r2, 0x6
	bl CpuSet
	add sp, 0x1C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8046128

	thumb_func_start GetScaledExpFraction
GetScaledExpFraction: @ 8046188
	push {r4-r7,lr}
	adds r6, r2, 0
	lsls r3, 27
	lsrs r7, r3, 24
	subs r5, r0, r1
	cmp r5, 0
	bge _0804619A
	movs r5, 0
	b _080461A0
_0804619A:
	cmp r5, r6
	ble _080461A0
	adds r5, r6, 0
_080461A0:
	muls r0, r7
	adds r1, r6, 0
	bl __divsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	muls r0, r7
	adds r1, r6, 0
	bl __divsi3
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	subs r0, r4, r0
	cmp r0, 0
	bge _080461C8
	negs r0, r0
_080461C8:
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetScaledExpFraction

	thumb_func_start GetScaledHPFraction
GetScaledHPFraction: @ 80461D4
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	lsls r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	muls r0, r2
	lsls r1, 16
	asrs r1, 16
	bl __divsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080461F8
	cmp r4, 0
	ble _080461F8
	movs r0, 0x1
_080461F8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetScaledHPFraction

	thumb_func_start GetHPBarLevel
GetHPBarLevel: @ 8046200
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bne _08046212
	movs r0, 0x4
	b _0804622E
_08046212:
	movs r2, 0x30
	bl GetScaledHPFraction
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x3
	cmp r1, 0x18
	bhi _0804622E
	movs r0, 0x2
	cmp r1, 0x9
	bhi _0804622E
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_0804622E:
	pop {r1}
	bx r1
	thumb_func_end GetHPBarLevel

	.align 2, 0 @ Don't pad with nop.
