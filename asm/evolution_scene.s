	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text


	thumb_func_start unref_sub_8113B50
unref_sub_8113B50: @ 8113B50
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x3C
	str r0, [sp]
	str r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	movs r1, 0
	str r1, [sp, 0x10]
	movs r2, 0
	str r2, [sp, 0x8]
	ldr r3, _08113C60 @ =0x02014800
	mov r12, r3
	ldr r4, _08113C64 @ =0x000018c4
	add r4, r12
	mov r10, r4
	ldr r5, _08113C68 @ =0x000020c4
	add r5, r12
	mov r8, r5
_08113B7C:
	adds r0, r3, 0
	adds r0, 0x84
	ldr r1, [sp, 0x8]
	adds r0, r1, r0
	strb r2, [r0]
	adds r0, r3, 0x4
	adds r0, r1, r0
	strb r2, [r0]
	ldr r4, _08113C6C @ =0x02014844
	adds r0, r1, r4
	strb r2, [r0]
	movs r6, 0
	lsls r1, 5
	mov r9, r1
	ldr r5, [sp, 0x8]
	lsls r4, r5, 6
_08113B9C:
	mov r0, r9
	adds r1, r6, r0
	ldr r5, _08113C70 @ =0x020158c4
	adds r0, r1, r5
	strb r2, [r0]
	mov r5, r10
	adds r0, r1, r5
	strb r2, [r0]
	mov r5, r8
	adds r0, r1, r5
	strb r2, [r0]
	ldr r5, _08113C74 @ =0x020170c4
	adds r0, r1, r5
	strb r2, [r0]
	adds r7, r3, 0
	adds r7, 0xC4
	adds r0, r1, r7
	strb r2, [r0]
	ldr r5, _08113C78 @ =0x000008c4
	adds r0, r3, r5
	adds r0, r1, r0
	strb r2, [r0]
	ldr r5, _08113C7C @ =0x000030c4
	adds r0, r3, r5
	adds r0, r1, r0
	strb r2, [r0]
	ldr r5, _08113C80 @ =0x000038c4
	adds r0, r3, r5
	adds r1, r0
	strb r2, [r1]
	lsls r1, r6, 1
	adds r1, r4
	ldr r5, _08113C84 @ =0x000060c4
	adds r0, r3, r5
	adds r0, r1, r0
	strh r2, [r0]
	ldr r5, _08113C88 @ =0x000070c4
	adds r0, r3, r5
	adds r0, r1, r0
	strh r2, [r0]
	ldr r5, _08113C8C @ =0x000080c4
	adds r0, r3, r5
	adds r0, r1, r0
	strh r2, [r0]
	ldr r5, _08113C90 @ =0x000090c4
	adds r0, r3, r5
	adds r1, r0
	strh r2, [r1]
	adds r6, 0x1
	cmp r6, 0x1F
	ble _08113B9C
	ldr r0, [sp, 0x8]
	adds r0, 0x1
	str r0, [sp, 0x8]
	cmp r0, 0x3F
	ble _08113B7C
	ldr r1, _08113C94 @ =0x0000a0c4
	add r1, r12
	movs r0, 0x40
	strb r0, [r1]
	movs r1, 0
	mov r8, r1
	movs r2, 0
	str r2, [sp, 0x8]
	movs r3, 0x80
	lsls r3, 5
	adds r3, r7
	mov r12, r3
	movs r4, 0xC0
	lsls r4, 5
	adds r4, r7
	mov r9, r4
	movs r5, 0
	adds r4, r7, 0
	subs r4, 0xC0
_08113C32:
	movs r3, 0
	ldr r2, [sp]
	add r2, r8
	movs r6, 0
	ldr r0, [sp, 0x8]
	adds r0, 0x1
	str r0, [sp, 0x30]
	ldr r1, [sp, 0x8]
	lsls r1, 7
	mov r10, r1
	movs r7, 0x1
	negs r7, r7
_08113C4A:
	asrs r0, r6, 1
	lsls r0, 2
	add r0, r10
	ldr r1, _08113C98 @ =0x020188c4
	adds r0, r1
	str r2, [r0]
	cmp r3, 0
	beq _08113C9C
	cmp r3, 0x1
	beq _08113CC6
	b _08113CF4
	.align 2, 0
_08113C60: .4byte 0x02014800
_08113C64: .4byte 0x000018c4
_08113C68: .4byte 0x000020c4
_08113C6C: .4byte 0x02014844
_08113C70: .4byte 0x020158c4
_08113C74: .4byte 0x020170c4
_08113C78: .4byte 0x000008c4
_08113C7C: .4byte 0x000030c4
_08113C80: .4byte 0x000038c4
_08113C84: .4byte 0x000060c4
_08113C88: .4byte 0x000070c4
_08113C8C: .4byte 0x000080c4
_08113C90: .4byte 0x000090c4
_08113C94: .4byte 0x0000a0c4
_08113C98: .4byte 0x020188c4
_08113C9C:
	movs r0, 0x1
	ands r0, r6
	cmp r0, 0
	beq _08113CAA
	cmp r0, 0x1
	beq _08113CB0
	b _08113CF4
_08113CAA:
	ldrb r1, [r2]
	movs r0, 0xF
	b _08113CB4
_08113CB0:
	ldrb r1, [r2]
	movs r0, 0xF0
_08113CB4:
	ands r0, r1
	cmp r0, 0
	beq _08113CF4
	ldrb r0, [r4]
	adds r0, r5
	add r0, r12
	strb r6, [r0]
	movs r3, 0x1
	b _08113CF4
_08113CC6:
	adds r0, r6, 0
	ands r0, r3
	cmp r0, 0
	beq _08113CD4
	cmp r0, 0x1
	beq _08113CDA
	b _08113CF4
_08113CD4:
	ldrb r1, [r2]
	movs r0, 0xF
	b _08113CDE
_08113CDA:
	ldrb r1, [r2]
	movs r0, 0xF0
_08113CDE:
	ands r0, r1
	cmp r0, 0
	bne _08113CF4
	ldrb r0, [r4]
	adds r0, r5
	add r0, r9
	strb r7, [r0]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r3, 0
_08113CF4:
	adds r0, r6, 0x1
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08113D02
	adds r2, 0x1D
	b _08113D0C
_08113D02:
	movs r0, 0x1
	ands r0, r6
	cmp r0, 0
	beq _08113D0C
	adds r2, 0x1
_08113D0C:
	adds r7, 0x1
	adds r6, 0x1
	cmp r6, 0x3F
	ble _08113C4A
	cmp r3, 0
	beq _08113D26
	ldrb r0, [r4]
	adds r0, r5
	add r0, r9
	strb r6, [r0]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_08113D26:
	movs r0, 0x7
	ldr r2, [sp, 0x30]
	ands r2, r0
	cmp r2, 0
	bne _08113D36
	movs r3, 0xE4
	add r8, r3
	b _08113D3A
_08113D36:
	movs r0, 0x4
	add r8, r0
_08113D3A:
	adds r5, 0x20
	adds r4, 0x1
	ldr r1, [sp, 0x8]
	adds r1, 0x1
	str r1, [sp, 0x8]
	cmp r1, 0x3F
	bgt _08113D4A
	b _08113C32
_08113D4A:
	movs r2, 0
	mov r8, r2
	movs r3, 0
	str r3, [sp, 0x8]
	ldr r0, _08113D84 @ =0x02014844
	movs r4, 0x82
	lsls r4, 6
	adds r4, r0
	mov r10, r4
	movs r5, 0xA2
	lsls r5, 6
	adds r7, r0, r5
	movs r5, 0
	adds r4, r0, 0
	movs r0, 0x1
	mov r9, r0
_08113D6A:
	movs r3, 0
	ldr r2, [sp, 0x4]
	add r2, r8
	movs r6, 0
	ldr r1, [sp, 0x8]
	adds r1, 0x1
	str r1, [sp, 0x30]
_08113D78:
	cmp r3, 0
	beq _08113D88
	cmp r3, 0x1
	beq _08113DB4
	b _08113DE4
	.align 2, 0
_08113D84: .4byte 0x02014844
_08113D88:
	adds r0, r6, 0
	mov r1, r9
	ands r0, r1
	cmp r0, 0
	beq _08113D98
	cmp r0, 0x1
	beq _08113D9E
	b _08113DE4
_08113D98:
	ldrb r1, [r2]
	movs r0, 0xF
	b _08113DA2
_08113D9E:
	ldrb r1, [r2]
	movs r0, 0xF0
_08113DA2:
	ands r0, r1
	cmp r0, 0
	beq _08113DE4
	ldrb r0, [r4]
	adds r0, r5
	add r0, r10
	strb r6, [r0]
	movs r3, 0x1
	b _08113DE4
_08113DB4:
	adds r0, r6, 0
	ands r0, r3
	cmp r0, 0
	beq _08113DC2
	cmp r0, 0x1
	beq _08113DC8
	b _08113DE4
_08113DC2:
	ldrb r1, [r2]
	movs r0, 0xF
	b _08113DCC
_08113DC8:
	ldrb r1, [r2]
	movs r0, 0xF0
_08113DCC:
	ands r0, r1
	cmp r0, 0
	bne _08113DE4
	ldrb r0, [r4]
	adds r0, r5
	adds r0, r7
	subs r1, r6, 0x1
	strb r1, [r0]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r3, 0
_08113DE4:
	adds r1, r6, 0x1
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08113DF2
	adds r2, 0x1D
	b _08113DFC
_08113DF2:
	mov r0, r9
	ands r6, r0
	cmp r6, 0
	beq _08113DFC
	adds r2, 0x1
_08113DFC:
	adds r6, r1, 0
	cmp r6, 0x3F
	ble _08113D78
	cmp r3, 0
	beq _08113E14
	ldrb r0, [r4]
	adds r0, r5
	adds r0, r7
	strb r6, [r0]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_08113E14:
	movs r0, 0x7
	ldr r1, [sp, 0x30]
	ands r1, r0
	cmp r1, 0
	bne _08113E24
	movs r2, 0xE4
	add r8, r2
	b _08113E28
_08113E24:
	movs r3, 0x4
	add r8, r3
_08113E28:
	adds r5, 0x20
	adds r4, 0x1
	ldr r0, [sp, 0x8]
	adds r0, 0x1
	str r0, [sp, 0x8]
	cmp r0, 0x3F
	ble _08113D6A
	movs r1, 0
	str r1, [sp, 0x8]
_08113E3A:
	ldr r3, [sp, 0x8]
	ldr r4, _08113EBC @ =0x02014804
	adds r2, r3, r4
	ldr r5, _08113EC0 @ =0x02014844
	adds r1, r3, r5
	ldrb r0, [r2]
	adds r3, 0x1
	str r3, [sp, 0x30]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08113E52
	b _08113F9E
_08113E52:
	movs r0, 0
	str r0, [sp, 0xC]
	ldrb r2, [r2]
	cmp r0, r2
	bge _08113F54
	ldr r0, _08113EC4 @ =0x02014800
	adds r0, 0x4
	ldr r1, [sp, 0x8]
	adds r0, r1, r0
	str r0, [sp, 0x18]
_08113E66:
	movs r2, 0x80
	lsls r2, 1
	str r2, [sp, 0x14]
	movs r6, 0
	ldr r3, [sp, 0x8]
	ldr r4, _08113EC0 @ =0x02014844
	adds r0, r3, r4
	ldr r5, [sp, 0xC]
	adds r5, 0x1
	str r5, [sp, 0x34]
	ldrb r0, [r0]
	cmp r6, r0
	bge _08113F3E
	ldr r0, _08113EC4 @ =0x02014800
	mov r10, r0
	lsls r0, r3, 5
	ldr r2, [sp, 0xC]
	adds r1, r2, r0
	mov r9, r0
	ldr r0, _08113EC4 @ =0x02014800
	adds r0, 0xC4
	mov r3, r9
	adds r7, r3, r0
	mov r5, r9
	ldr r4, _08113EC4 @ =0x02014800
	ldr r2, _08113EC8 @ =0x000010c4
	adds r0, r4, r2
	adds r1, r0
	mov r8, r1
	ldrb r3, [r1]
	str r3, [sp, 0x1C]
_08113EA4:
	ldr r0, _08113ECC @ =0x000020c4
	add r0, r10
	adds r0, r5, r0
	ldr r4, [sp, 0x1C]
	ldrb r1, [r0]
	cmp r4, r1
	bls _08113ED0
	mov r2, r8
	ldrb r1, [r2]
	ldrb r0, [r0]
	b _08113ED6
	.align 2, 0
_08113EBC: .4byte 0x02014804
_08113EC0: .4byte 0x02014844
_08113EC4: .4byte 0x02014800
_08113EC8: .4byte 0x000010c4
_08113ECC: .4byte 0x000020c4
_08113ED0:
	ldrb r1, [r0]
	mov r3, r8
	ldrb r0, [r3]
_08113ED6:
	subs r3, r1, r0
	ldr r1, [sp, 0xC]
	add r1, r9
	ldr r0, _08113EFC @ =0x000018c4
	add r0, r10
	adds r4, r1, r0
	ldr r0, _08113F00 @ =0x000028c4
	add r0, r10
	adds r2, r5, r0
	ldrb r0, [r4]
	ldr r1, _08113F04 @ =0x02014800
	mov r12, r1
	ldrb r1, [r2]
	cmp r0, r1
	bls _08113F08
	adds r1, r0, 0
	ldrb r0, [r2]
	b _08113F0C
	.align 2, 0
_08113EFC: .4byte 0x000018c4
_08113F00: .4byte 0x000028c4
_08113F04: .4byte 0x02014800
_08113F08:
	ldrb r1, [r2]
	ldrb r0, [r4]
_08113F0C:
	subs r1, r0
	adds r3, r1
	ldr r2, [sp, 0x14]
	cmp r2, r3
	ble _08113F2C
	ldrb r0, [r7]
	cmp r0, 0
	bne _08113F2C
	ldr r0, _08114050 @ =0x000008c4
	add r0, r12
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08113F2C
	str r6, [sp, 0x10]
	str r3, [sp, 0x14]
_08113F2C:
	adds r7, 0x1
	adds r5, 0x1
	adds r6, 0x1
	ldr r3, [sp, 0x8]
	ldr r4, _08114054 @ =0x02014844
	adds r0, r3, r4
	ldrb r0, [r0]
	cmp r6, r0
	blt _08113EA4
_08113F3E:
	ldr r0, [sp, 0xC]
	ldr r1, [sp, 0x10]
	ldr r2, [sp, 0x8]
	bl sub_81141F0
	ldr r5, [sp, 0x34]
	str r5, [sp, 0xC]
	ldr r0, [sp, 0x18]
	ldrb r0, [r0]
	cmp r5, r0
	blt _08113E66
_08113F54:
	movs r6, 0
	ldr r2, _08114058 @ =0x02014800
	ldr r1, [sp, 0x8]
	ldr r3, _08114054 @ =0x02014844
	adds r0, r1, r3
	adds r4, r2, 0
	mov r12, r4
	ldrb r0, [r0]
	cmp r6, r0
	bge _08113F9E
	mov r0, r12
	adds r0, 0x44
	adds r4, r1, r0
_08113F6E:
	ldr r5, [sp, 0x8]
	lsls r0, r5, 5
	adds r1, r6, r0
	adds r0, r2, 0
	adds r0, 0xC4
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08113F94
	ldr r3, _08114050 @ =0x000008c4
	adds r0, r2, r3
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08113F94
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_811430C
_08113F94:
	adds r6, 0x1
	ldr r2, _08114058 @ =0x02014800
	ldrb r5, [r4]
	cmp r6, r5
	blt _08113F6E
_08113F9E:
	ldr r0, [sp, 0x8]
	ldr r1, _0811405C @ =0x02014804
	adds r2, r0, r1
	ldr r3, _08114054 @ =0x02014844
	adds r1, r0, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08113FCC
	movs r6, 0
	ldrb r4, [r2]
	cmp r6, r4
	bge _08113FCC
	adds r4, r2, 0
_08113FBA:
	adds r0, r6, 0
	adds r1, r6, 0
	ldr r2, [sp, 0x8]
	bl sub_81141F0
	adds r6, 0x1
	ldrb r5, [r4]
	cmp r6, r5
	blt _08113FBA
_08113FCC:
	ldr r0, [sp, 0x8]
	ldr r1, _0811405C @ =0x02014804
	adds r2, r0, r1
	ldr r3, _08114054 @ =0x02014844
	adds r1, r0, r3
	ldrb r0, [r2]
	ldr r4, _08114058 @ =0x02014800
	ldrb r5, [r1]
	cmp r0, r5
	bhi _08113FE2
	b _081141C4
_08113FE2:
	movs r0, 0
	str r0, [sp, 0x10]
	ldrb r1, [r1]
	cmp r0, r1
	blt _08113FEE
	b _08114104
_08113FEE:
	str r2, [sp, 0x2C]
	ldr r1, [sp, 0x8]
	lsls r1, 5
	mov r9, r1
	adds r0, r4, 0
	adds r0, 0x44
	ldr r2, [sp, 0x8]
	adds r0, r2, r0
	str r0, [sp, 0x20]
	mov r3, r9
	str r3, [sp, 0x24]
_08114004:
	movs r4, 0x80
	lsls r4, 1
	str r4, [sp, 0x14]
	movs r6, 0
	ldr r5, [sp, 0x10]
	adds r5, 0x1
	str r5, [sp, 0x38]
	ldr r0, [sp, 0x2C]
	ldrb r0, [r0]
	cmp r6, r0
	bge _081140C4
	ldr r1, [sp, 0x10]
	ldr r2, [sp, 0x24]
	adds r1, r2
	mov r10, r1
	ldr r0, _08114058 @ =0x02014800
	adds r0, 0xC4
	adds r2, r0
	mov r8, r2
	ldr r7, [sp, 0x24]
	ldr r3, _08114058 @ =0x02014800
	ldr r4, _08114060 @ =0x000010c4
	adds r0, r3, r4
	adds r5, r7, r0
	ldr r0, _08114064 @ =0x020168c4
	add r0, r10
	mov r12, r0
	ldrb r1, [r0]
	str r1, [sp, 0x28]
_0811403E:
	ldrb r0, [r5]
	ldr r2, [sp, 0x28]
	cmp r0, r2
	bls _08114068
	adds r1, r0, 0
	mov r3, r12
	ldrb r0, [r3]
	b _0811406E
	.align 2, 0
_08114050: .4byte 0x000008c4
_08114054: .4byte 0x02014844
_08114058: .4byte 0x02014800
_0811405C: .4byte 0x02014804
_08114060: .4byte 0x000010c4
_08114064: .4byte 0x020168c4
_08114068:
	mov r4, r12
	ldrb r1, [r4]
	ldrb r0, [r5]
_0811406E:
	subs r3, r1, r0
	ldr r1, _0811408C @ =0x02014800
	ldr r2, _08114090 @ =0x000018c4
	adds r0, r1, r2
	adds r4, r7, r0
	ldr r2, _08114094 @ =0x020170c4
	add r2, r10
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bls _08114098
	adds r1, r0, 0
	ldrb r0, [r2]
	b _0811409C
	.align 2, 0
_0811408C: .4byte 0x02014800
_08114090: .4byte 0x000018c4
_08114094: .4byte 0x020170c4
_08114098:
	ldrb r1, [r2]
	ldrb r0, [r4]
_0811409C:
	subs r1, r0
	adds r3, r1
	ldr r2, [sp, 0x14]
	cmp r2, r3
	ble _081140B2
	mov r4, r8
	ldrb r0, [r4]
	cmp r0, 0
	bne _081140B2
	str r6, [sp, 0xC]
	str r3, [sp, 0x14]
_081140B2:
	movs r0, 0x1
	add r8, r0
	adds r7, 0x1
	adds r5, 0x1
	adds r6, 0x1
	ldr r1, [sp, 0x2C]
	ldrb r1, [r1]
	cmp r6, r1
	blt _0811403E
_081140C4:
	ldr r3, [sp, 0xC]
	add r3, r9
	ldr r2, _08114164 @ =0x02014800
	ldr r4, _08114168 @ =0x000030c4
	adds r1, r2, r4
	adds r1, r3, r1
	ldr r2, [sp, 0x10]
	add r2, r9
	ldr r5, _0811416C @ =0x020168c4
	adds r0, r2, r5
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08114164 @ =0x02014800
	ldr r4, _08114170 @ =0x000038c4
	adds r1, r0, r4
	adds r1, r3, r1
	ldr r5, _08114174 @ =0x020170c4
	adds r2, r5
	ldrb r0, [r2]
	strb r0, [r1]
	ldr r0, _08114164 @ =0x02014800
	adds r0, 0xC4
	adds r3, r0
	movs r0, 0x1
	strb r0, [r3]
	ldr r0, [sp, 0x38]
	str r0, [sp, 0x10]
	ldr r1, [sp, 0x20]
	ldrb r1, [r1]
	cmp r0, r1
	bge _08114104
	b _08114004
_08114104:
	movs r6, 0
	ldr r4, _08114164 @ =0x02014800
	ldr r2, [sp, 0x8]
	ldr r3, _08114178 @ =0x02014804
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r6, r0
	bge _081141C4
	adds r7, r4, 0
	mov r9, r6
	movs r5, 0xC4
	adds r5, r7
	mov r8, r5
_0811411E:
	ldr r1, [sp, 0x8]
	lsls r0, r1, 5
	adds r2, r6, r0
	ldr r3, _0811417C @ =0x000020c4
	adds r0, r7, r3
	adds r0, r2
	mov r10, r0
	ldr r5, _08114168 @ =0x000030c4
	adds r0, r7, r5
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, r10
	strb r0, [r1]
	ldr r3, _08114180 @ =0x000028c4
	adds r0, r7, r3
	adds r3, r2, r0
	ldr r5, _08114170 @ =0x000038c4
	adds r0, r7, r5
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r3]
	mov r0, r8
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _08114184
	mov r2, r9
	strb r2, [r1]
	adds r0, r6, 0
	adds r1, r6, 0
	ldr r2, [sp, 0x8]
	bl sub_81141F0
	b _081141B4
	.align 2, 0
_08114164: .4byte 0x02014800
_08114168: .4byte 0x000030c4
_0811416C: .4byte 0x020168c4
_08114170: .4byte 0x000038c4
_08114174: .4byte 0x020170c4
_08114178: .4byte 0x02014804
_0811417C: .4byte 0x000020c4
_08114180: .4byte 0x000028c4
_08114184:
	ldr r5, _081141E0 @ =0x000010c4
	adds r1, r4, r5
	adds r1, r2, r1
	ldr r5, _081141E4 @ =0x000018c4
	adds r0, r4, r5
	adds r0, r2, r0
	ldrb r0, [r0]
	ldrb r2, [r1]
	subs r0, r2
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r2, r0
	strb r2, [r3]
	mov r0, r10
	strb r2, [r0]
	ldrb r0, [r3]
	subs r0, 0x1
	strb r0, [r3]
	adds r0, r6, 0
	adds r1, r6, 0
	ldr r2, [sp, 0x8]
	bl sub_81141F0
_081141B4:
	adds r6, 0x1
	ldr r4, _081141E8 @ =0x02014800
	ldr r1, [sp, 0x8]
	ldr r2, _081141EC @ =0x02014804
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r6, r0
	blt _0811411E
_081141C4:
	ldr r3, [sp, 0x30]
	str r3, [sp, 0x8]
	cmp r3, 0x3F
	bgt _081141CE
	b _08113E3A
_081141CE:
	add sp, 0x3C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081141E0: .4byte 0x000010c4
_081141E4: .4byte 0x000018c4
_081141E8: .4byte 0x02014800
_081141EC: .4byte 0x02014804
	thumb_func_end unref_sub_8113B50

	thumb_func_start sub_81141F0
sub_81141F0: @ 81141F0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	mov r8, r1
	mov r9, r2
	ldr r3, _0811424C @ =0x02014800
	lsls r1, r2, 5
	mov r0, r8
	adds r4, r0, r1
	ldr r5, _08114250 @ =0x000030c4
	adds r2, r3, r5
	adds r2, r4, r2
	adds r1, r6, r1
	ldr r7, _08114254 @ =0x000010c4
	adds r0, r3, r7
	adds r5, r1, r0
	ldrb r0, [r5]
	strb r0, [r2]
	ldr r0, _08114258 @ =0x000038c4
	adds r2, r3, r0
	adds r2, r4, r2
	ldr r7, _0811425C @ =0x000018c4
	adds r0, r3, r7
	adds r1, r0
	ldrb r0, [r1]
	strb r0, [r2]
	movs r7, 0
	ldr r1, _08114260 @ =0x000020c4
	adds r0, r3, r1
	adds r2, r4, r0
	ldrb r1, [r5]
	ldrb r0, [r2]
	mov r12, r3
	cmp r1, r0
	bcs _08114264
	mov r0, r12
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0x4
	strb r1, [r0]
	ldrb r1, [r2]
	ldrb r0, [r5]
	b _08114276
	.align 2, 0
_0811424C: .4byte 0x02014800
_08114250: .4byte 0x000030c4
_08114254: .4byte 0x000010c4
_08114258: .4byte 0x000038c4
_0811425C: .4byte 0x000018c4
_08114260: .4byte 0x000020c4
_08114264:
	cmp r1, r0
	bls _08114278
	mov r0, r12
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0x1
	strb r1, [r0]
	ldrb r1, [r5]
	ldrb r0, [r2]
_08114276:
	subs r7, r1, r0
_08114278:
	mov r5, r8
	lsls r3, r5, 1
	mov r0, r9
	lsls r4, r0, 6
	adds r0, r3, r4
	ldr r1, _081142BC @ =0x000080c4
	add r1, r12
	adds r0, r1
	lsls r1, r7, 4
	strh r1, [r0]
	movs r7, 0
	mov r1, r9
	lsls r2, r1, 5
	adds r1, r6, r2
	ldr r0, _081142C0 @ =0x000018c4
	add r0, r12
	adds r6, r1, r0
	adds r1, r5, r2
	ldr r0, _081142C4 @ =0x000028c4
	add r0, r12
	adds r5, r1, r0
	ldrb r2, [r6]
	ldrb r0, [r5]
	cmp r2, r0
	bcs _081142CC
	ldr r0, _081142C8 @ =0x000008c4
	add r0, r12
	adds r0, r1, r0
	movs r1, 0x3
	strb r1, [r0]
	ldrb r1, [r5]
	ldrb r0, [r6]
	b _081142DE
	.align 2, 0
_081142BC: .4byte 0x000080c4
_081142C0: .4byte 0x000018c4
_081142C4: .4byte 0x000028c4
_081142C8: .4byte 0x000008c4
_081142CC:
	cmp r2, r0
	bls _081142E0
	ldr r0, _08114304 @ =0x000008c4
	add r0, r12
	adds r0, r1, r0
	movs r1, 0x2
	strb r1, [r0]
	ldrb r1, [r6]
	ldrb r0, [r5]
_081142DE:
	subs r7, r1, r0
_081142E0:
	adds r0, r3, r4
	ldr r1, _08114308 @ =0x000090c4
	add r1, r12
	adds r0, r1
	lsls r1, r7, 4
	strh r1, [r0]
	mov r1, r12
	adds r1, 0x84
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08114304: .4byte 0x000008c4
_08114308: .4byte 0x000090c4
	thumb_func_end sub_81141F0

	thumb_func_start sub_811430C
sub_811430C: @ 811430C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r5, _081143AC @ =0x02014800
	lsls r4, r1, 5
	adds r4, r0, r4
	ldr r2, _081143B0 @ =0x000028c4
	adds r2, r5
	mov r10, r2
	add r10, r4
	mov r3, r10
	ldrb r2, [r3]
	ldr r6, _081143B4 @ =0x000020c4
	adds r6, r5
	mov r8, r6
	add r8, r4
	mov r6, r8
	ldrb r3, [r6]
	subs r7, r2, r3
	ldr r2, _081143B8 @ =0x000030c4
	adds r6, r5, r2
	adds r6, r4, r6
	ldr r2, _081143BC @ =0x000038c4
	adds r2, r5
	mov r9, r2
	add r9, r4
	lsrs r2, r7, 31
	adds r2, r7, r2
	asrs r2, 1
	adds r3, r2
	mov r2, r9
	strb r3, [r2]
	strb r3, [r6]
	adds r2, r5, 0
	adds r2, 0xC4
	adds r2, r4, r2
	movs r3, 0x5
	strb r3, [r2]
	ldr r3, _081143C0 @ =0x000008c4
	adds r2, r5, r3
	adds r4, r2
	movs r2, 0x7
	strb r2, [r4]
	adds r3, r5, 0
	adds r3, 0x84
	adds r3, r1, r3
	ldrb r2, [r3]
	adds r2, 0x1
	strb r2, [r3]
	ldrb r3, [r6]
	mov r4, r8
	ldrb r2, [r4]
	subs r7, r3, r2
	lsls r0, 1
	lsls r1, 6
	adds r0, r1
	ldr r6, _081143C4 @ =0x000080c4
	adds r1, r5, r6
	adds r1, r0, r1
	lsls r2, r7, 4
	strh r2, [r1]
	mov r1, r10
	ldrb r2, [r1]
	mov r3, r9
	ldrb r1, [r3]
	subs r7, r2, r1
	ldr r4, _081143C8 @ =0x000090c4
	adds r5, r4
	adds r0, r5
	lsls r1, r7, 4
	strh r1, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081143AC: .4byte 0x02014800
_081143B0: .4byte 0x000028c4
_081143B4: .4byte 0x000020c4
_081143B8: .4byte 0x000030c4
_081143BC: .4byte 0x000038c4
_081143C0: .4byte 0x000008c4
_081143C4: .4byte 0x000080c4
_081143C8: .4byte 0x000090c4
	thumb_func_end sub_811430C

	thumb_func_start unref_sub_81143CC
unref_sub_81143CC: @ 81143CC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	movs r0, 0x1
	str r0, [sp, 0x4]
	ldr r0, _08114408 @ =0x02014800
	ldr r2, _0811440C @ =0x0000a0c4
	adds r1, r0, r2
	ldrb r3, [r1]
	adds r4, r0, 0
	cmp r3, 0
	beq _081143EE
	subs r0, r3, 0x1
	strb r0, [r1]
_081143EE:
	movs r5, 0
	str r5, [sp]
_081143F2:
	movs r3, 0
	adds r2, r4, 0
	adds r0, r4, 0
	adds r0, 0x84
	ldr r1, [sp]
	adds r0, r1, r0
	adds r1, 0x1
	str r1, [sp, 0x8]
	bl _08114D84
	.align 2, 0
_08114408: .4byte 0x02014800
_0811440C: .4byte 0x0000a0c4
_08114410:
	ldr r5, [sp]
	lsls r0, r5, 5
	adds r1, r3, r0
	adds r2, 0xC4
	adds r1, r2
	ldrb r2, [r1]
	mov r8, r0
	adds r0, r3, 0x1
	mov r10, r0
	cmp r2, 0xC
	bls _08114428
	b _081148D2
_08114428:
	lsls r0, r2, 2
	ldr r1, _08114434 @ =_08114438
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08114434: .4byte _08114438
	.align 2, 0
_08114438:
	.4byte _081148D2
	.4byte _0811446C
	.4byte _081144F0
	.4byte _0811457C
	.4byte _08114600
	.4byte _0811468C
	.4byte _081146C8
	.4byte _08114704
	.4byte _08114740
	.4byte _0811477C
	.4byte _081147D0
	.4byte _08114810
	.4byte _08114858
_0811446C:
	movs r1, 0
	str r1, [sp, 0x4]
	lsls r0, r3, 1
	ldr r2, [sp]
	lsls r1, r2, 6
	adds r0, r1
	ldr r5, _081144E0 @ =0x000060c4
	adds r2, r4, r5
	adds r2, r0, r2
	ldr r5, _081144E4 @ =0x000080c4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	adds r1, r3, 0x1
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r2, r5
	blt _081144A6
	b _081148D2
_081144A6:
	mov r9, r4
	mov r4, r8
	adds r7, r3, r4
	ldr r0, _081144E8 @ =0x000030c4
	add r0, r9
	adds r4, r7, r0
	ldr r0, _081144EC @ =0x000020c4
	add r0, r9
	adds r2, r7, r0
_081144B8:
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldrb r0, [r4]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	ldrb r1, [r2]
	cmp r0, r1
	bne _081144D8
	b _081148A0
_081144D8:
	adds r6, 0x1
	cmp r6, r5
	blt _081144B8
	b _081148D2
	.align 2, 0
_081144E0: .4byte 0x000060c4
_081144E4: .4byte 0x000080c4
_081144E8: .4byte 0x000030c4
_081144EC: .4byte 0x000020c4
_081144F0:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r4, _08114568 @ =0x02014800
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _0811456C @ =0x000060c4
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114570 @ =0x000080c4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	adds r1, r3, 0x1
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r2, r5
	blt _0811452C
	b _081148D2
_0811452C:
	mov r9, r4
	mov r4, r8
	adds r7, r3, r4
	ldr r0, _08114574 @ =0x000030c4
	add r0, r9
	adds r4, r7, r0
	ldr r0, _08114578 @ =0x000020c4
	add r0, r9
	adds r2, r7, r0
_0811453E:
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114548
	b _081148B8
_08114548:
	adds r1, r0, 0
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DF0
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	adds r6, 0x1
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	cmp r6, r5
	blt _0811453E
	b _081148D2
	.align 2, 0
_08114568: .4byte 0x02014800
_0811456C: .4byte 0x000060c4
_08114570: .4byte 0x000080c4
_08114574: .4byte 0x000030c4
_08114578: .4byte 0x000020c4
_0811457C:
	movs r2, 0
	str r2, [sp, 0x4]
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _081145F0 @ =0x000060c4
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _081145F4 @ =0x000080c4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	adds r1, r3, 0x1
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r2, r5
	blt _081145B6
	b _081148D2
_081145B6:
	mov r9, r4
	mov r4, r8
	adds r7, r3, r4
	ldr r0, _081145F8 @ =0x000030c4
	add r0, r9
	adds r4, r7, r0
	ldr r0, _081145FC @ =0x000020c4
	add r0, r9
	adds r2, r7, r0
_081145C8:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldrb r0, [r4]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	ldrb r1, [r2]
	cmp r0, r1
	bne _081145E8
	b _081148AC
_081145E8:
	adds r6, 0x1
	cmp r6, r5
	blt _081145C8
	b _081148D2
	.align 2, 0
_081145F0: .4byte 0x000060c4
_081145F4: .4byte 0x000080c4
_081145F8: .4byte 0x000030c4
_081145FC: .4byte 0x000020c4
_08114600:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r4, _08114678 @ =0x02014800
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _0811467C @ =0x000060c4
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114680 @ =0x000080c4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	adds r1, r3, 0x1
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r2, r5
	blt _0811463C
	b _081148D2
_0811463C:
	mov r9, r4
	mov r4, r8
	adds r7, r3, r4
	ldr r0, _08114684 @ =0x000030c4
	add r0, r9
	adds r4, r7, r0
	ldr r0, _08114688 @ =0x000020c4
	add r0, r9
	adds r2, r7, r0
_0811464E:
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114658
	b _081148B8
_08114658:
	adds r1, r0, 0
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DF0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r6, 0x1
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	cmp r6, r5
	blt _0811464E
	b _081148D2
	.align 2, 0
_08114678: .4byte 0x02014800
_0811467C: .4byte 0x000060c4
_08114680: .4byte 0x000080c4
_08114684: .4byte 0x000030c4
_08114688: .4byte 0x000020c4
_0811468C:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r5, _081146C0 @ =0x02014800
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _081146C4 @ =0x000030c4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114E48
	lsls r0, 24
	ldr r3, [sp, 0x10]
	adds r2, r3, 0x1
	mov r10, r2
	cmp r0, 0
	bne _081146B4
	b _081148D2
_081146B4:
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0x9
	strb r1, [r0]
	b _081148D2
	.align 2, 0
_081146C0: .4byte 0x02014800
_081146C4: .4byte 0x000030c4
_081146C8:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _081146FC @ =0x02014800
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114700 @ =0x000030c4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114E48
	lsls r0, 24
	ldr r3, [sp, 0x10]
	adds r2, r3, 0x1
	mov r10, r2
	cmp r0, 0
	bne _081146F0
	b _081148D2
_081146F0:
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0xA
	strb r1, [r0]
	b _081148D2
	.align 2, 0
_081146FC: .4byte 0x02014800
_08114700: .4byte 0x000030c4
_08114704:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114738 @ =0x02014800
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _0811473C @ =0x000030c4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114E48
	lsls r0, 24
	ldr r3, [sp, 0x10]
	adds r2, r3, 0x1
	mov r10, r2
	cmp r0, 0
	bne _0811472C
	b _081148D2
_0811472C:
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0xB
	strb r1, [r0]
	b _081148D2
	.align 2, 0
_08114738: .4byte 0x02014800
_0811473C: .4byte 0x000030c4
_08114740:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114774 @ =0x02014800
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114778 @ =0x000030c4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114E48
	lsls r0, 24
	ldr r3, [sp, 0x10]
	adds r2, r3, 0x1
	mov r10, r2
	cmp r0, 0
	bne _08114768
	b _081148D2
_08114768:
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0xC
	strb r1, [r0]
	b _081148D2
	.align 2, 0
_08114774: .4byte 0x02014800
_08114778: .4byte 0x000030c4
_0811477C:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r6, _081147B4 @ =0x02014800
	mov r0, r8
	adds r5, r3, r0
	ldr r1, _081147B8 @ =0x000030c4
	adds r4, r6, r1
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldr r2, _081147BC @ =0x000020c4
	adds r0, r6, r2
	adds r0, r5, r0
	ldrb r1, [r4]
	ldr r3, [sp, 0x10]
	ldrb r0, [r0]
	cmp r1, r0
	bne _081147C0
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	mov r4, sp
	ldrb r4, [r4, 0x4]
	strb r4, [r0]
	b _08114844
	.align 2, 0
_081147B4: .4byte 0x02014800
_081147B8: .4byte 0x000030c4
_081147BC: .4byte 0x000020c4
_081147C0:
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	movs r1, 0x1
	strb r1, [r0]
	adds r0, r3, 0x1
	mov r10, r0
	b _081148D2
_081147D0:
	movs r1, 0
	str r1, [sp, 0x4]
	ldr r6, _08114804 @ =0x02014800
	mov r2, r8
	adds r5, r3, r2
	ldr r0, _08114808 @ =0x000030c4
	adds r4, r6, r0
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114DF0
	ldr r1, _0811480C @ =0x000020c4
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldr r3, [sp, 0x10]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08114882
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	movs r1, 0x2
	b _08114842
	.align 2, 0
_08114804: .4byte 0x02014800
_08114808: .4byte 0x000030c4
_0811480C: .4byte 0x000020c4
_08114810:
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r6, _0811484C @ =0x02014800
	mov r1, r8
	adds r5, r3, r1
	ldr r2, _08114850 @ =0x000030c4
	adds r4, r6, r2
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldr r1, _08114854 @ =0x000020c4
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldr r3, [sp, 0x10]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08114882
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	movs r1, 0x3
_08114842:
	strb r1, [r0]
_08114844:
	adds r5, r3, 0x1
	mov r10, r5
	b _081148D2
	.align 2, 0
_0811484C: .4byte 0x02014800
_08114850: .4byte 0x000030c4
_08114854: .4byte 0x000020c4
_08114858:
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r6, _08114894 @ =0x02014800
	mov r1, r8
	adds r5, r3, r1
	ldr r2, _08114898 @ =0x000030c4
	adds r4, r6, r2
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114DF0
	ldr r1, _0811489C @ =0x000020c4
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldr r3, [sp, 0x10]
	ldrb r0, [r0]
	cmp r1, r0
	bne _081148C4
_08114882:
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	mov r2, sp
	ldrb r2, [r2, 0x4]
	strb r2, [r0]
	adds r4, r3, 0x1
	mov r10, r4
	b _081148D2
	.align 2, 0
_08114894: .4byte 0x02014800
_08114898: .4byte 0x000030c4
_0811489C: .4byte 0x000020c4
_081148A0:
	mov r0, r9
	adds r0, 0xC4
	adds r0, r7, r0
	movs r5, 0
	strb r5, [r0]
	b _081148D2
_081148AC:
	mov r0, r9
	adds r0, 0xC4
	adds r0, r7, r0
	movs r1, 0
	strb r1, [r0]
	b _081148D2
_081148B8:
	mov r0, r9
	adds r0, 0xC4
	adds r0, r7, r0
	movs r1, 0
	strb r1, [r0]
	b _081148D2
_081148C4:
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	movs r1, 0x4
	strb r1, [r0]
	adds r2, r3, 0x1
	mov r10, r2
_081148D2:
	ldr r0, _081148F4 @ =0x02014800
	mov r4, r8
	adds r1, r3, r4
	ldr r5, _081148F8 @ =0x000008c4
	adds r2, r0, r5
	adds r1, r2
	ldrb r1, [r1]
	adds r4, r0, 0
	cmp r1, 0xC
	bls _081148E8
	b _08114D76
_081148E8:
	lsls r0, r1, 2
	ldr r1, _081148FC @ =_08114900
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081148F4: .4byte 0x02014800
_081148F8: .4byte 0x000008c4
_081148FC: .4byte _08114900
	.align 2, 0
_08114900:
	.4byte _08114D76
	.4byte _08114934
	.4byte _081149B8
	.4byte _08114A3C
	.4byte _08114AC0
	.4byte _08114B44
	.4byte _08114B7C
	.4byte _08114BB4
	.4byte _08114BEC
	.4byte _08114C24
	.4byte _08114C78
	.4byte _08114CB8
	.4byte _08114CF8
_08114934:
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r0, r3, 1
	ldr r2, [sp]
	lsls r1, r2, 6
	adds r0, r1
	ldr r5, _081149A8 @ =0x000070c4
	adds r2, r4, r5
	adds r2, r0, r2
	ldr r5, _081149AC @ =0x000090c4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	ldr r1, [sp, 0x4]
	cmp r1, r5
	blt _0811496A
	b _08114D76
_0811496A:
	mov r9, r4
	mov r2, r8
	adds r7, r3, r2
	ldr r0, _081149B0 @ =0x000038c4
	add r0, r9
	adds r4, r7, r0
	movs r3, 0
	ldr r0, _081149B4 @ =0x000028c4
	add r0, r9
	adds r2, r7, r0
_0811497E:
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldrb r0, [r4]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0811499E
	b _08114D4C
_0811499E:
	adds r6, 0x1
	cmp r6, r5
	blt _0811497E
	b _08114D76
	.align 2, 0
_081149A8: .4byte 0x000070c4
_081149AC: .4byte 0x000090c4
_081149B0: .4byte 0x000038c4
_081149B4: .4byte 0x000028c4
_081149B8:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r4, _08114A28 @ =0x02014800
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _08114A2C @ =0x000070c4
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114A30 @ =0x000090c4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	ldr r1, [sp, 0x4]
	cmp r1, r5
	blt _081149F0
	b _08114D76
_081149F0:
	mov r9, r4
	mov r2, r8
	adds r7, r3, r2
	ldr r0, _08114A34 @ =0x000038c4
	add r0, r9
	adds r4, r7, r0
	ldr r0, _08114A38 @ =0x000028c4
	add r0, r9
	adds r2, r7, r0
_08114A02:
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114A0C
	b _08114D3C
_08114A0C:
	adds r1, r0, 0
	ldr r0, [sp]
	str r2, [sp, 0xC]
	bl sub_8114DF0
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	adds r6, 0x1
	ldr r2, [sp, 0xC]
	cmp r6, r5
	blt _08114A02
	b _08114D76
	.align 2, 0
_08114A28: .4byte 0x02014800
_08114A2C: .4byte 0x000070c4
_08114A30: .4byte 0x000090c4
_08114A34: .4byte 0x000038c4
_08114A38: .4byte 0x000028c4
_08114A3C:
	movs r2, 0
	str r2, [sp, 0x4]
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _08114AB0 @ =0x000070c4
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114AB4 @ =0x000090c4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	ldr r1, [sp, 0x4]
	cmp r1, r5
	blt _08114A72
	b _08114D76
_08114A72:
	mov r9, r4
	mov r2, r8
	adds r7, r3, r2
	ldr r0, _08114AB8 @ =0x000038c4
	add r0, r9
	adds r4, r7, r0
	movs r3, 0
	ldr r0, _08114ABC @ =0x000028c4
	add r0, r9
	adds r2, r7, r0
_08114A86:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldrb r0, [r4]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114AA6
	b _08114D4C
_08114AA6:
	adds r6, 0x1
	cmp r6, r5
	blt _08114A86
	b _08114D76
	.align 2, 0
_08114AB0: .4byte 0x000070c4
_08114AB4: .4byte 0x000090c4
_08114AB8: .4byte 0x000038c4
_08114ABC: .4byte 0x000028c4
_08114AC0:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r4, _08114B30 @ =0x02014800
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _08114B34 @ =0x000070c4
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114B38 @ =0x000090c4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	ldr r1, [sp, 0x4]
	cmp r1, r5
	blt _08114AF8
	b _08114D76
_08114AF8:
	mov r9, r4
	mov r2, r8
	adds r7, r3, r2
	ldr r0, _08114B3C @ =0x000038c4
	add r0, r9
	adds r4, r7, r0
	ldr r0, _08114B40 @ =0x000028c4
	add r0, r9
	adds r2, r7, r0
_08114B0A:
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114B14
	b _08114D5C
_08114B14:
	adds r1, r0, 0
	ldr r0, [sp]
	str r2, [sp, 0xC]
	bl sub_8114DF0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r6, 0x1
	ldr r2, [sp, 0xC]
	cmp r6, r5
	blt _08114B0A
	b _08114D76
	.align 2, 0
_08114B30: .4byte 0x02014800
_08114B34: .4byte 0x000070c4
_08114B38: .4byte 0x000090c4
_08114B3C: .4byte 0x000038c4
_08114B40: .4byte 0x000028c4
_08114B44:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r5, _08114B70 @ =0x02014800
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114B74 @ =0x000038c4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8114E48
	lsls r0, 24
	cmp r0, 0
	bne _08114B64
	b _08114D76
_08114B64:
	ldr r2, _08114B78 @ =0x000008c4
	adds r0, r5, r2
	adds r0, r4, r0
	movs r1, 0x9
	b _08114D74
	.align 2, 0
_08114B70: .4byte 0x02014800
_08114B74: .4byte 0x000038c4
_08114B78: .4byte 0x000008c4
_08114B7C:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114BA8 @ =0x02014800
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114BAC @ =0x000038c4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8114E48
	lsls r0, 24
	cmp r0, 0
	bne _08114B9C
	b _08114D76
_08114B9C:
	ldr r2, _08114BB0 @ =0x000008c4
	adds r0, r5, r2
	adds r0, r4, r0
	movs r1, 0xA
	b _08114D74
	.align 2, 0
_08114BA8: .4byte 0x02014800
_08114BAC: .4byte 0x000038c4
_08114BB0: .4byte 0x000008c4
_08114BB4:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114BE0 @ =0x02014800
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114BE4 @ =0x000038c4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8114E48
	lsls r0, 24
	cmp r0, 0
	bne _08114BD4
	b _08114D76
_08114BD4:
	ldr r2, _08114BE8 @ =0x000008c4
	adds r0, r5, r2
	adds r0, r4, r0
	movs r1, 0xB
	b _08114D74
	.align 2, 0
_08114BE0: .4byte 0x02014800
_08114BE4: .4byte 0x000038c4
_08114BE8: .4byte 0x000008c4
_08114BEC:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114C18 @ =0x02014800
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114C1C @ =0x000038c4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8114E48
	lsls r0, 24
	cmp r0, 0
	bne _08114C0C
	b _08114D76
_08114C0C:
	ldr r2, _08114C20 @ =0x000008c4
	adds r0, r5, r2
	adds r0, r4, r0
	movs r1, 0xC
	b _08114D74
	.align 2, 0
_08114C18: .4byte 0x02014800
_08114C1C: .4byte 0x000038c4
_08114C20: .4byte 0x000008c4
_08114C24:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r6, _08114C58 @ =0x02014800
	mov r0, r8
	adds r5, r3, r0
	ldr r1, _08114C5C @ =0x000038c4
	adds r4, r6, r1
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	bl sub_8114DB4
	ldr r2, _08114C60 @ =0x000028c4
	adds r0, r6, r2
	adds r0, r5, r0
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08114C68
	ldr r4, _08114C64 @ =0x000008c4
	adds r0, r6, r4
	adds r0, r5, r0
	mov r5, sp
	ldrb r5, [r5, 0x4]
	strb r5, [r0]
	b _08114D76
	.align 2, 0
_08114C58: .4byte 0x02014800
_08114C5C: .4byte 0x000038c4
_08114C60: .4byte 0x000028c4
_08114C64: .4byte 0x000008c4
_08114C68:
	ldr r1, _08114C74 @ =0x000008c4
	adds r0, r6, r1
	adds r0, r5, r0
	movs r1, 0x1
	b _08114D74
	.align 2, 0
_08114C74: .4byte 0x000008c4
_08114C78:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r6, _08114CA8 @ =0x02014800
	mov r4, r8
	adds r5, r3, r4
	ldr r0, _08114CAC @ =0x000038c4
	adds r4, r6, r0
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	bl sub_8114DF0
	ldr r1, _08114CB0 @ =0x000028c4
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08114D1E
	ldr r1, _08114CB4 @ =0x000008c4
	adds r0, r6, r1
	adds r0, r5, r0
	movs r1, 0x2
	b _08114D74
	.align 2, 0
_08114CA8: .4byte 0x02014800
_08114CAC: .4byte 0x000038c4
_08114CB0: .4byte 0x000028c4
_08114CB4: .4byte 0x000008c4
_08114CB8:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r6, _08114CE8 @ =0x02014800
	mov r4, r8
	adds r5, r3, r4
	ldr r0, _08114CEC @ =0x000038c4
	adds r4, r6, r0
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	bl sub_8114DB4
	ldr r1, _08114CF0 @ =0x000028c4
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08114D1E
	ldr r1, _08114CF4 @ =0x000008c4
	adds r0, r6, r1
	adds r0, r5, r0
	movs r1, 0x3
	b _08114D74
	.align 2, 0
_08114CE8: .4byte 0x02014800
_08114CEC: .4byte 0x000038c4
_08114CF0: .4byte 0x000028c4
_08114CF4: .4byte 0x000008c4
_08114CF8:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r6, _08114D2C @ =0x02014800
	mov r4, r8
	adds r5, r3, r4
	ldr r0, _08114D30 @ =0x000038c4
	adds r4, r6, r0
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	bl sub_8114DF0
	ldr r1, _08114D34 @ =0x000028c4
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08114D6C
_08114D1E:
	ldr r2, _08114D38 @ =0x000008c4
	adds r0, r6, r2
	adds r0, r5, r0
	mov r4, sp
	ldrb r4, [r4, 0x4]
	strb r4, [r0]
	b _08114D76
	.align 2, 0
_08114D2C: .4byte 0x02014800
_08114D30: .4byte 0x000038c4
_08114D34: .4byte 0x000028c4
_08114D38: .4byte 0x000008c4
_08114D3C:
	ldr r0, _08114D48 @ =0x000008c4
	add r0, r9
	adds r0, r7, r0
	movs r1, 0
	b _08114D74
	.align 2, 0
_08114D48: .4byte 0x000008c4
_08114D4C:
	ldr r0, _08114D58 @ =0x000008c4
	add r0, r9
	adds r0, r7, r0
	strb r3, [r0]
	b _08114D76
	.align 2, 0
_08114D58: .4byte 0x000008c4
_08114D5C:
	ldr r0, _08114D68 @ =0x000008c4
	add r0, r9
	adds r0, r7, r0
	movs r1, 0
	b _08114D74
	.align 2, 0
_08114D68: .4byte 0x000008c4
_08114D6C:
	ldr r1, _08114DAC @ =0x000008c4
	adds r0, r6, r1
	adds r0, r5, r0
	movs r1, 0x4
_08114D74:
	strb r1, [r0]
_08114D76:
	mov r3, r10
	ldr r2, _08114DB0 @ =0x02014800
	adds r0, r2, 0
	adds r0, 0x84
	ldr r4, [sp]
	adds r0, r4, r0
	adds r4, r2, 0
_08114D84:
	ldrb r0, [r0]
	cmp r3, r0
	bge _08114D8E
	bl _08114410
_08114D8E:
	ldr r5, [sp, 0x8]
	str r5, [sp]
	cmp r5, 0x3F
	bgt _08114D9A
	bl _081143F2
_08114D9A:
	ldr r0, [sp, 0x4]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08114DAC: .4byte 0x000008c4
_08114DB0: .4byte 0x02014800
	thumb_func_end unref_sub_81143CC

	thumb_func_start sub_8114DB4
sub_8114DB4: @ 8114DB4
	push {lr}
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r2, _08114DDC @ =0x02014800
	lsrs r1, 25
	lsls r1, 2
	lsls r0, 7
	adds r1, r0
	ldr r0, _08114DE0 @ =0x000040c4
	adds r2, r0
	adds r1, r2
	ldr r2, [r1]
	movs r0, 0x1
	ands r3, r0
	cmp r3, 0
	beq _08114DE4
	ldrb r0, [r2]
	movs r1, 0xF0
	b _08114DE8
	.align 2, 0
_08114DDC: .4byte 0x02014800
_08114DE0: .4byte 0x000040c4
_08114DE4:
	ldrb r0, [r2]
	movs r1, 0xF
_08114DE8:
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	thumb_func_end sub_8114DB4

	thumb_func_start sub_8114DF0
sub_8114DF0: @ 8114DF0
	push {lr}
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r2, _08114E28 @ =0x02014800
	lsrs r1, 25
	lsls r1, 2
	lsls r0, 7
	adds r1, r0
	ldr r0, _08114E2C @ =0x000040c4
	adds r2, r0
	adds r1, r2
	ldr r2, [r1]
	movs r0, 0xC0
	lsls r0, 7
	adds r1, r2, r0
	movs r0, 0x1
	ands r3, r0
	cmp r3, 0
	beq _08114E30
	ldrb r1, [r1]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	bne _08114E42
	ldrb r1, [r2]
	movs r0, 0xF
	b _08114E3E
	.align 2, 0
_08114E28: .4byte 0x02014800
_08114E2C: .4byte 0x000040c4
_08114E30:
	ldrb r1, [r1]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _08114E42
	ldrb r1, [r2]
	movs r0, 0xF0
_08114E3E:
	ands r0, r1
	strb r0, [r2]
_08114E42:
	pop {r0}
	bx r0
	thumb_func_end sub_8114DF0

	thumb_func_start sub_8114E48
sub_8114E48: @ 8114E48
	push {r4-r7,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _08114E6C @ =0x02014800
	ldr r2, _08114E70 @ =0x0000a0c4
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0
	bne _08114E60
	b _08114F5E
_08114E60:
	movs r1, 0
	movs r3, 0
	cmp r4, 0
	bne _08114E74
	movs r1, 0x1
	b _08114EA6
	.align 2, 0
_08114E6C: .4byte 0x02014800
_08114E70: .4byte 0x0000a0c4
_08114E74:
	subs r0, r4, 0x1
	lsls r0, 5
	adds r2, r3, r0
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08114EA6
	ldr r7, _08114EC4 @ =0x000008c4
	adds r0, r5, r7
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08114EA6
	adds r3, 0x1
	cmp r3, 0x1F
	bgt _08114EA6
	cmp r4, 0
	bne _08114E74
	lsls r0, r1, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r1, r0, 24
_08114EA6:
	cmp r3, 0x20
	bne _08114EB4
	lsls r0, r1, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r1, r0, 24
_08114EB4:
	movs r3, 0
	cmp r4, 0x3F
	bne _08114EC8
	lsls r0, r1, 24
	movs r7, 0x80
	lsls r7, 17
	adds r0, r7
	b _08114EF8
	.align 2, 0
_08114EC4: .4byte 0x000008c4
_08114EC8:
	adds r0, r4, 0x1
	lsls r0, 5
	adds r2, r3, r0
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08114EFA
	ldr r7, _08114F64 @ =0x000008c4
	adds r0, r5, r7
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08114EFA
	adds r3, 0x1
	cmp r3, 0x1F
	bgt _08114EFA
	cmp r4, 0x3F
	bne _08114EC8
	lsls r0, r1, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
_08114EF8:
	lsrs r1, r0, 24
_08114EFA:
	cmp r3, 0x20
	bne _08114F08
	lsls r0, r1, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r1, r0, 24
_08114F08:
	cmp r1, 0x2
	beq _08114F5E
	subs r0, r6, 0x2
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r0, 0
	bge _08114F18
	movs r1, 0
_08114F18:
	adds r0, r6, 0x2
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, 0x3F
	ble _08114F26
	movs r2, 0x3F
_08114F26:
	lsls r1, 24
	asrs r3, r1, 24
	lsls r0, r2, 24
	asrs r2, r0, 24
	adds r6, r1, 0
	adds r7, r0, 0
	cmp r3, r2
	bge _08114F7C
	cmp r4, 0
	beq _08114F7C
	subs r0, r4, 0x1
	lsls r5, r0, 7
	ldr r0, _08114F68 @ =0x020188c4
	mov r12, r0
_08114F42:
	asrs r0, r3, 1
	lsls r0, 2
	adds r0, r5
	add r0, r12
	ldr r1, [r0]
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _08114F6C
	ldrb r1, [r1]
	movs r0, 0xF0
_08114F58:
	ands r0, r1
	cmp r0, 0
	beq _08114F72
_08114F5E:
	movs r0, 0x1
	b _08114FCA
	.align 2, 0
_08114F64: .4byte 0x000008c4
_08114F68: .4byte 0x020188c4
_08114F6C:
	ldrb r1, [r1]
	movs r0, 0xF
	b _08114F58
_08114F72:
	adds r3, 0x1
	cmp r3, r2
	bge _08114F7C
	cmp r4, 0
	bne _08114F42
_08114F7C:
	asrs r3, r6, 24
	asrs r1, r7, 24
	cmp r3, r1
	bge _08114FC8
	cmp r4, 0x3F
	beq _08114FC8
	adds r0, r4, 0x1
	lsls r5, r0, 7
	ldr r6, _08114FB0 @ =0x020188c4
	adds r2, r1, 0
_08114F90:
	asrs r0, r3, 1
	lsls r0, 2
	adds r0, r5
	adds r0, r6
	ldr r1, [r0]
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _08114FB4
	ldrb r1, [r1]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	beq _08114FBE
	b _08114F5E
	.align 2, 0
_08114FB0: .4byte 0x020188c4
_08114FB4:
	ldrb r1, [r1]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _08114F5E
_08114FBE:
	adds r3, 0x1
	cmp r3, r2
	bge _08114FC8
	cmp r4, 0x3F
	bne _08114F90
_08114FC8:
	movs r0, 0
_08114FCA:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8114E48

	thumb_func_start HBlankCB_EvolutionScene
HBlankCB_EvolutionScene: @ 8114FD0
	bx lr
	thumb_func_end HBlankCB_EvolutionScene

	thumb_func_start VBlankCB_EvolutionScene
VBlankCB_EvolutionScene: @ 8114FD4
	push {lr}
	ldr r1, _08115034 @ =REG_BG0CNT
	ldr r2, _08115038 @ =0x00009803
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x8
	ldr r0, _0811503C @ =gUnknown_030042A4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115040 @ =gUnknown_030042A0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115044 @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115048 @ =gUnknown_030041B4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0811504C @ =gUnknown_03004288
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115050 @ =gUnknown_03004280
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115054 @ =gUnknown_030041B0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115058 @ =gUnknown_030041B8
	ldrh r0, [r0]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8089668
	pop {r0}
	bx r0
	.align 2, 0
_08115034: .4byte REG_BG0CNT
_08115038: .4byte 0x00009803
_0811503C: .4byte gUnknown_030042A4
_08115040: .4byte gUnknown_030042A0
_08115044: .4byte gUnknown_030042C0
_08115048: .4byte gUnknown_030041B4
_0811504C: .4byte gUnknown_03004288
_08115050: .4byte gUnknown_03004280
_08115054: .4byte gUnknown_030041B0
_08115058: .4byte gUnknown_030041B8
	thumb_func_end VBlankCB_EvolutionScene

	thumb_func_start VBlankCB_TradeEvolutionScene
VBlankCB_TradeEvolutionScene: @ 811505C
	push {lr}
	ldr r1, _081150B4 @ =REG_BG0HOFS
	ldr r0, _081150B8 @ =gUnknown_030042A4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150BC @ =gUnknown_030042A0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150C0 @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150C4 @ =gUnknown_030041B4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150C8 @ =gUnknown_03004288
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150CC @ =gUnknown_03004280
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150D0 @ =gUnknown_030041B0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150D4 @ =gUnknown_030041B8
	ldrh r0, [r0]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8089668
	pop {r0}
	bx r0
	.align 2, 0
_081150B4: .4byte REG_BG0HOFS
_081150B8: .4byte gUnknown_030042A4
_081150BC: .4byte gUnknown_030042A0
_081150C0: .4byte gUnknown_030042C0
_081150C4: .4byte gUnknown_030041B4
_081150C8: .4byte gUnknown_03004288
_081150CC: .4byte gUnknown_03004280
_081150D0: .4byte gUnknown_030041B0
_081150D4: .4byte gUnknown_030041B8
	thumb_func_end VBlankCB_TradeEvolutionScene

	thumb_func_start sub_81150D8
sub_81150D8: @ 81150D8
	push {lr}
	ldr r0, _081150F4 @ =gBattleCommunication
	ldrb r1, [r0, 0x1]
	lsls r1, 28
	movs r0, 0x90
	lsls r0, 23
	adds r1, r0
	lsrs r1, 24
	movs r0, 0xC8
	bl sub_814A880
	pop {r0}
	bx r0
	.align 2, 0
_081150F4: .4byte gBattleCommunication
	thumb_func_end sub_81150D8

	thumb_func_start HBlankCB_TradeEvolutionScene
HBlankCB_TradeEvolutionScene: @ 81150F8
	bx lr
	thumb_func_end HBlankCB_TradeEvolutionScene

	.align 2, 0 @ Don't pad with nop.
