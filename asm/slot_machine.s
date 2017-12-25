	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8102BF8
sub_8102BF8: @ 8102BF8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	movs r6, 0
	ldr r0, _08102C40 @ =gSharedMem
	lsls r1, r5, 1
	adds r0, 0x1C
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r1, 0x18
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	beq _08102C20
	ldr r6, _08102C44 @ =0x0000ffff
_08102C20:
	lsls r1, r4, 16
	asrs r1, 16
	lsls r0, r6, 16
	asrs r0, 16
	adds r1, r0
	lsls r1, 16
	asrs r1, 16
	adds r0, r5, 0
	bl sub_8102BA4
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08102C40: .4byte gSharedMem
_08102C44: .4byte 0x0000ffff
	thumb_func_end sub_8102BF8

	thumb_func_start sub_8102C48
sub_8102C48: @ 8102C48
	push {lr}
	ldr r1, _08102C7C @ =gSharedMem
	movs r2, 0x16
	ldrsh r1, [r1, r2]
	lsls r0, 16
	asrs r0, 16
	adds r1, r0
	adds r0, r1, 0
	movs r1, 0x6
	bl __modsi3
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _08102C6E
	adds r0, 0x6
	lsls r0, 16
	lsrs r1, r0, 16
_08102C6E:
	ldr r0, _08102C80 @ =gUnknown_083ECCF1
	lsls r1, 16
	asrs r1, 16
	adds r1, r0
	ldrb r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_08102C7C: .4byte gSharedMem
_08102C80: .4byte gUnknown_083ECCF1
	thumb_func_end sub_8102C48

	thumb_func_start sub_8102C84
sub_8102C84: @ 8102C84
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	ldr r6, _08102CC8 @ =gSharedMem
	lsrs r5, 23
	adds r4, r6, 0
	adds r4, 0x1C
	adds r4, r5, r4
	lsls r1, 16
	asrs r1, 16
	ldrh r0, [r4]
	adds r1, r0
	strh r1, [r4]
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0xFC
	lsls r1, 1
	bl __modsi3
	strh r0, [r4]
	adds r6, 0x28
	adds r5, r6
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x18
	bl __divsi3
	movs r1, 0x15
	subs r1, r0
	strh r1, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08102CC8: .4byte gSharedMem
	thumb_func_end sub_8102C84

	thumb_func_start sub_8102CCC
sub_8102CCC: @ 8102CCC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r0, _08102D24 @ =gSharedMem
	lsls r1, r6, 1
	adds r0, 0x1C
	adds r5, r1, r0
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r1, 0x18
	bl __modsi3
	lsls r0, 16
	lsrs r0, 16
	lsls r2, r0, 16
	asrs r1, r2, 16
	cmp r1, 0
	beq _08102D18
	lsls r0, r4, 16
	asrs r0, 16
	cmp r1, r0
	bge _08102D00
	lsrs r4, r2, 16
_08102D00:
	lsls r1, r4, 16
	asrs r1, 16
	adds r0, r6, 0
	bl sub_8102C84
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r1, 0x18
	bl __modsi3
	lsls r0, 16
	lsrs r0, 16
_08102D18:
	lsls r0, 16
	asrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08102D24: .4byte gSharedMem
	thumb_func_end sub_8102CCC

	thumb_func_start sub_8102D28
sub_8102D28: @ 8102D28
	push {r4,lr}
	ldr r4, _08102D58 @ =gSharedMem
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r4, 0x14]
	adds r0, r1
	strh r0, [r4, 0x14]
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl __modsi3
	strh r0, [r4, 0x14]
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	movs r1, 0x14
	bl __divsi3
	movs r1, 0x6
	subs r1, r0
	strh r1, [r4, 0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08102D58: .4byte gSharedMem
	thumb_func_end sub_8102D28

	thumb_func_start sub_8102D5C
sub_8102D5C: @ 8102D5C
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r5, _08102DA4 @ =gSharedMem
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	movs r1, 0x14
	bl __modsi3
	lsls r0, 16
	lsrs r0, 16
	lsls r2, r0, 16
	asrs r1, r2, 16
	cmp r1, 0
	beq _08102D9A
	lsls r0, r4, 16
	asrs r0, 16
	cmp r1, r0
	bge _08102D84
	lsrs r4, r2, 16
_08102D84:
	lsls r0, r4, 16
	asrs r0, 16
	bl sub_8102D28
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	movs r1, 0x14
	bl __modsi3
	lsls r0, 16
	lsrs r0, 16
_08102D9A:
	lsls r0, 16
	asrs r0, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08102DA4: .4byte gSharedMem
	thumb_func_end sub_8102D5C

	thumb_func_start sub_8102DA8
sub_8102DA8: @ 8102DA8
	push {r4-r7,lr}
	movs r4, 0
	ldr r5, _08102DE0 @ =sub_8102E68
	ldr r7, _08102DE4 @ =gTasks
	ldr r6, _08102DE8 @ =gSharedMem + 0x3A
_08102DB2:
	adds r0, r5, 0
	movs r1, 0x2
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r7
	strh r4, [r1, 0x26]
	adds r1, r4, r6
	strb r0, [r1]
	bl _call_via_r5
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _08102DB2
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08102DE0: .4byte sub_8102E68
_08102DE4: .4byte gTasks
_08102DE8: .4byte gSharedMem + 0x3A
	thumb_func_end sub_8102DA8

	thumb_func_start sub_8102DEC
sub_8102DEC: @ 8102DEC
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08102E14 @ =gTasks
	ldr r1, _08102E18 @ =gSharedMem
	adds r1, 0x3A
	adds r0, r1
	ldrb r2, [r0]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r3
	movs r2, 0x1
	strh r2, [r1, 0x8]
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	strh r2, [r0, 0x24]
	bx lr
	.align 2, 0
_08102E14: .4byte gTasks
_08102E18: .4byte gSharedMem
	thumb_func_end sub_8102DEC

	thumb_func_start sub_8102E1C
sub_8102E1C: @ 8102E1C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08102E38 @ =gTasks
	ldr r1, _08102E3C @ =gSharedMem
	adds r1, 0x3A
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x2
	strh r1, [r0, 0x8]
	bx lr
	.align 2, 0
_08102E38: .4byte gTasks
_08102E3C: .4byte gSharedMem
	thumb_func_end sub_8102E1C

	thumb_func_start sub_8102E40
sub_8102E40: @ 8102E40
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08102E60 @ =gTasks
	ldr r1, _08102E64 @ =gSharedMem
	adds r1, 0x3A
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r0, [r0, 0x24]
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_08102E60: .4byte gTasks
_08102E64: .4byte gSharedMem
	thumb_func_end sub_8102E40

	thumb_func_start sub_8102E68
sub_8102E68: @ 8102E68
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08102E98 @ =gUnknown_083ECB2C
	ldr r2, _08102E9C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08102E7A:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08102E7A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08102E98: .4byte gUnknown_083ECB2C
_08102E9C: .4byte gTasks
	thumb_func_end sub_8102E68

	thumb_func_start sub_8102EA0
sub_8102EA0: @ 8102EA0
	movs r0, 0
	bx lr
	thumb_func_end sub_8102EA0

	thumb_func_start sub_8102EA4
sub_8102EA4: @ 8102EA4
	push {lr}
	ldrh r0, [r0, 0x26]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08102EBC @ =gSharedMem
	movs r2, 0x1A
	ldrsh r1, [r1, r2]
	bl sub_8102C84
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08102EBC: .4byte gSharedMem
	thumb_func_end sub_8102EA4

	thumb_func_start sub_8102EC0
sub_8102EC0: @ 8102EC0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r4, 0x8]
	ldr r3, _08102F40 @ =gSharedMem
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r0, 1
	adds r1, r3, 0
	adds r1, 0x34
	adds r0, r1
	strh r2, [r0]
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r0, 1
	adds r1, r3, 0
	adds r1, 0x2E
	adds r0, r1
	strh r2, [r0]
	ldrb r0, [r3, 0xA]
	cmp r0, 0
	bne _08102F28
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	beq _08102F12
	ldrb r0, [r3, 0x6]
	cmp r0, 0
	beq _08102F12
	ldr r1, _08102F44 @ =gUnknown_083ECB40
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	cmp r0, 0
	bne _08102F28
_08102F12:
	ldr r1, _08102F40 @ =gSharedMem
	movs r0, 0
	strb r0, [r1, 0x6]
	ldr r1, _08102F48 @ =gUnknown_083ECB4C
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_08102F28:
	ldr r0, _08102F40 @ =gSharedMem
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	lsls r1, 1
	adds r0, 0x2E
	adds r1, r0
	ldrh r0, [r1]
	strh r0, [r4, 0xA]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08102F40: .4byte gSharedMem
_08102F44: .4byte gUnknown_083ECB40
_08102F48: .4byte gUnknown_083ECB4C
	thumb_func_end sub_8102EC0

	thumb_func_start sub_8102F4C
sub_8102F4C: @ 8102F4C
	push {r4-r7,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r1, _08102F8C @ =gUnknown_083ECB58
	mov r0, sp
	movs r2, 0xA
	bl memcpy
	ldr r5, _08102F90 @ =gSharedMem
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r6, r0, 1
	adds r7, r5, 0
	adds r7, 0x1C
	adds r0, r6, r7
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0x18
	bl __modsi3
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r0, 0
	beq _08102F94
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0x1A
	ldrsh r1, [r5, r6]
	bl sub_8102CCC
	b _08102FC8
	.align 2, 0
_08102F8C: .4byte gUnknown_083ECB58
_08102F90: .4byte gSharedMem
_08102F94:
	adds r0, r5, 0
	adds r0, 0x2E
	adds r1, r6, r0
	ldrh r3, [r1]
	movs r6, 0
	ldrsh r0, [r1, r6]
	cmp r0, 0
	beq _08102FCC
	subs r0, r3, 0x1
	strh r0, [r1]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x1A
	ldrsh r1, [r5, r2]
	bl sub_8102C84
	movs r6, 0x26
	ldrsh r0, [r4, r6]
	lsls r0, 1
	adds r0, r7
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x18
	bl __modsi3
_08102FC8:
	lsls r0, 16
	lsrs r2, r0, 16
_08102FCC:
	cmp r2, 0
	bne _08102FF8
	ldr r1, _08103004 @ =gSharedMem
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r1, 0x2E
	adds r0, r1
	movs r6, 0
	ldrsh r1, [r0, r6]
	cmp r1, 0
	bne _08102FF8
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0xA]
	strh r1, [r4, 0xC]
_08102FF8:
	movs r0, 0
	add sp, 0xC
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08103004: .4byte gSharedMem
	thumb_func_end sub_8102F4C

	thumb_func_start sub_8103008
sub_8103008: @ 8103008
	push {r4,lr}
	adds r2, r0, 0
	ldr r1, _08103058 @ =gSharedMem
	movs r3, 0x26
	ldrsh r0, [r2, r3]
	lsls r0, 1
	adds r4, r1, 0
	adds r4, 0x22
	adds r0, r4
	ldrh r1, [r2, 0xA]
	strh r1, [r0]
	ldrh r0, [r2, 0xA]
	negs r3, r0
	strh r3, [r2, 0xA]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08103038
	lsls r0, r3, 16
	asrs r0, 17
	strh r0, [r2, 0xA]
_08103038:
	movs r0, 0xA
	ldrsh r3, [r2, r0]
	cmp r3, 0
	bne _0810304E
	strh r3, [r2, 0x8]
	strh r3, [r2, 0x24]
	movs r1, 0x26
	ldrsh r0, [r2, r1]
	lsls r0, 1
	adds r0, r4
	strh r3, [r0]
_0810304E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08103058: .4byte gSharedMem
	thumb_func_end sub_8103008

	thumb_func_start sub_810305C
sub_810305C: @ 810305C
	push {r4,r5,lr}
	ldr r4, _0810309C @ =gSharedMem
	ldrb r0, [r4, 0x4]
	bl sub_810250C
	lsls r0, 24
	lsrs r3, r0, 24
	adds r5, r3, 0
	ldrb r1, [r4, 0x4]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _0810307A
	movs r5, 0
	movs r3, 0x1
_0810307A:
	ldr r1, _081030A0 @ =gUnknown_083ECB64
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	subs r0, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	adds r0, r5, 0
	adds r1, r3, 0
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810309C: .4byte gSharedMem
_081030A0: .4byte gUnknown_083ECB64
	thumb_func_end sub_810305C

	thumb_func_start sub_81030A4
sub_81030A4: @ 81030A4
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 16
	asrs r3, 16
	movs r0, 0
	adds r1, r3, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, r4
	beq _081030CC
	cmp r0, r5
	bne _081030D8
_081030CC:
	ldr r0, _081030D4 @ =gSharedMem
	strb r1, [r0, 0x7]
	movs r0, 0x1
	b _081030DA
	.align 2, 0
_081030D4: .4byte gSharedMem
_081030D8:
	movs r0, 0
_081030DA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_81030A4

	thumb_func_start sub_81030E0
sub_81030E0: @ 81030E0
	push {r4,lr}
	movs r1, 0x1
	lsls r0, 16
	asrs r4, r0, 16
	subs r1, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _08103128
	movs r1, 0x2
	subs r1, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _08103128
	movs r1, 0x3
	subs r1, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _0810312C
_08103128:
	movs r0, 0x1
	b _0810312E
_0810312C:
	movs r0, 0
_0810312E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81030E0

	thumb_func_start sub_8103134
sub_8103134: @ 8103134
	push {lr}
	ldr r0, _08103148 @ =gSharedMem
	ldrb r1, [r0, 0x4]
	movs r0, 0xC2
	ands r0, r1
	cmp r0, 0
	bne _0810314C
	movs r0, 0
	b _0810314E
	.align 2, 0
_08103148: .4byte gSharedMem
_0810314C:
	movs r0, 0x1
_0810314E:
	pop {r1}
	bx r1
	thumb_func_end sub_8103134

	thumb_func_start sub_8103154
sub_8103154: @ 8103154
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r7, r1, 24
	movs r5, 0
	movs r0, 0x2
	mov r9, r0
	ldr r6, _08103194 @ =gSharedMem
_0810316E:
	lsls r0, r5, 16
	asrs r4, r0, 16
	mov r1, r9
	subs r0, r1, r4
	lsls r0, 16
	asrs r0, 16
	mov r1, r8
	adds r2, r7, 0
	bl sub_81030A4
	lsls r0, 24
	cmp r0, 0
	beq _08103198
	movs r0, 0x2
	strh r0, [r6, 0x34]
	strh r5, [r6, 0x2E]
	movs r0, 0x1
	b _081031A6
	.align 2, 0
_08103194: .4byte gSharedMem
_08103198:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0810316E
	movs r0, 0
_081031A6:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8103154

	thumb_func_start sub_81031B4
sub_81031B4: @ 81031B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	bl sub_8103134
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _081031E2
	movs r0, 0
	bl sub_81030E0
	lsls r0, 24
	cmp r0, 0
	bne _0810321E
_081031E2:
	movs r0, 0x1
	mov r8, r0
	ldr r5, _0810320C @ =gSharedMem
	movs r7, 0
_081031EA:
	mov r1, r8
	lsls r0, r1, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	mov r1, r10
	mov r2, r9
	bl sub_81030A4
	lsls r0, 24
	cmp r0, 0
	beq _08103210
	mov r0, r8
	strh r0, [r5, 0x34]
	strh r7, [r5, 0x2E]
	movs r0, 0x1
	b _081032B2
	.align 2, 0
_0810320C: .4byte gSharedMem
_08103210:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	mov r8, r1
	asrs r0, 16
	cmp r0, 0x3
	ble _081031EA
_0810321E:
	movs r0, 0x1
	mov r8, r0
	adds r7, r6, 0
	ldr r6, _0810326C @ =gSharedMem
_08103226:
	mov r1, r8
	lsls r5, r1, 16
	cmp r7, 0
	bne _0810323A
	asrs r0, r5, 16
	bl sub_81030E0
	lsls r0, 24
	cmp r0, 0
	bne _081032A0
_0810323A:
	movs r0, 0x1
	asrs r4, r5, 16
	subs r0, r4
	lsls r0, 16
	asrs r0, 16
	mov r1, r10
	mov r2, r9
	bl sub_81030A4
	lsls r0, 24
	cmp r0, 0
	beq _081032A0
	cmp r4, 0x1
	bne _08103270
	cmp r7, 0
	bne _08103266
	movs r0, 0x3
	bl sub_81030E0
	lsls r0, 24
	cmp r0, 0
	bne _08103270
_08103266:
	movs r0, 0x3
	strh r0, [r6, 0x34]
	b _0810329A
	.align 2, 0
_0810326C: .4byte gSharedMem
_08103270:
	asrs r0, r5, 16
	cmp r0, 0x3
	bgt _08103294
	adds r4, r0, 0x1
	cmp r7, 0
	bne _0810328A
	lsls r0, r4, 16
	asrs r0, 16
	bl sub_81030E0
	lsls r0, 24
	cmp r0, 0
	bne _08103294
_0810328A:
	movs r0, 0x2
	strh r0, [r6, 0x34]
	strh r4, [r6, 0x2E]
	movs r0, 0x1
	b _081032B2
_08103294:
	movs r0, 0x1
	strh r0, [r6, 0x34]
	mov r0, r8
_0810329A:
	strh r0, [r6, 0x2E]
	movs r0, 0x1
	b _081032B2
_081032A0:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r5, r1
	lsrs r1, r0, 16
	mov r8, r1
	asrs r0, 16
	cmp r0, 0x4
	ble _08103226
	movs r0, 0
_081032B2:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81031B4

	thumb_func_start sub_81032C0
sub_81032C0: @ 81032C0
	push {lr}
	ldr r1, _081032E0 @ =gUnknown_083ECB70
	ldr r0, _081032E4 @ =gSharedMem
	movs r2, 0x12
	ldrsh r0, [r0, r2]
	subs r0, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_081032E0: .4byte gUnknown_083ECB70
_081032E4: .4byte gSharedMem
	thumb_func_end sub_81032C0

	thumb_func_start sub_81032E8
sub_81032E8: @ 81032E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _08103320 @ =gSharedMem
	movs r6, 0
	ldrh r1, [r0, 0x34]
	mov r8, r1
	movs r1, 0x34
	ldrsh r7, [r0, r1]
	adds r5, r0, 0
_081032FC:
	lsls r0, r6, 16
	asrs r4, r0, 16
	subs r1, r7, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r5, 0x7]
	cmp r0, r1
	bne _08103324
	mov r0, r8
	strh r0, [r5, 0x36]
	strh r6, [r5, 0x30]
	movs r0, 0x1
	b _08103332
	.align 2, 0
_08103320: .4byte gSharedMem
_08103324:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _081032FC
	movs r0, 0
_08103332:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81032E8

	thumb_func_start sub_810333C
sub_810333C: @ 810333C
	push {r4-r7,lr}
	bl sub_81032E8
	lsls r0, 24
	cmp r0, 0
	beq _0810339A
	ldr r1, _0810338C @ =gSharedMem
	movs r2, 0x34
	ldrsh r0, [r1, r2]
	cmp r0, 0x2
	beq _08103396
	movs r2, 0x30
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	ble _08103396
	cmp r0, 0x4
	beq _08103396
	movs r5, 0
	movs r7, 0x2
	adds r6, r1, 0
_08103364:
	lsls r0, r5, 16
	asrs r4, r0, 16
	subs r1, r7, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r6, 0x7]
	cmp r0, r1
	beq _08103390
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08103364
	b _08103396
	.align 2, 0
_0810338C: .4byte gSharedMem
_08103390:
	movs r0, 0x2
	strh r0, [r6, 0x36]
	strh r5, [r6, 0x30]
_08103396:
	movs r0, 0x1
	b _081033D2
_0810339A:
	ldr r1, _081033D8 @ =gSharedMem
	movs r2, 0x34
	ldrsh r0, [r1, r2]
	cmp r0, 0x2
	beq _081033D0
	movs r5, 0
	movs r7, 0x2
	adds r6, r1, 0
_081033AA:
	lsls r0, r5, 16
	asrs r4, r0, 16
	subs r1, r7, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r6, 0x7]
	cmp r0, r1
	beq _08103390
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _081033AA
_081033D0:
	movs r0, 0
_081033D2:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081033D8: .4byte gSharedMem
	thumb_func_end sub_810333C

	thumb_func_start sub_81033DC
sub_81033DC: @ 81033DC
	push {r4,lr}
	ldr r0, _08103414 @ =gSharedMem
	ldrb r3, [r0, 0x7]
	adds r4, r3, 0
	ldrb r2, [r0, 0x4]
	movs r1, 0x40
	ands r1, r2
	cmp r1, 0
	beq _081033F6
	movs r3, 0
	cmp r4, 0
	bne _081033F6
	movs r3, 0x1
_081033F6:
	ldr r1, _08103418 @ =gUnknown_083ECB7C
	movs r2, 0x12
	ldrsh r0, [r0, r2]
	subs r0, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r3, 0
	bl _call_via_r1
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08103414: .4byte gSharedMem
_08103418: .4byte gUnknown_083ECB7C
	thumb_func_end sub_81033DC

	thumb_func_start sub_810341C
sub_810341C: @ 810341C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _0810345C @ =gSharedMem
	movs r5, 0
	ldrh r1, [r0, 0x36]
	mov r8, r1
	movs r1, 0x36
	ldrsh r7, [r0, r1]
	adds r6, r0, 0
_08103438:
	lsls r0, r5, 16
	asrs r4, r0, 16
	subs r1, r7, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r9
	bne _08103460
	mov r0, r8
	strh r0, [r6, 0x38]
	strh r5, [r6, 0x32]
	movs r0, 0x1
	b _0810346E
	.align 2, 0
_0810345C: .4byte gSharedMem
_08103460:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08103438
	movs r0, 0
_0810346E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810341C

	thumb_func_start sub_810347C
sub_810347C: @ 810347C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _081034A0 @ =gSharedMem
	movs r2, 0x34
	ldrsh r1, [r0, r2]
	movs r2, 0x36
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bne _081034B4
	adds r0, r6, 0
	bl sub_810341C
	lsls r0, 24
	lsrs r0, 24
	b _081034EA
	.align 2, 0
_081034A0: .4byte gSharedMem
_081034A4:
	ldr r0, _081034B0 @ =gSharedMem
	strh r5, [r0, 0x32]
	mov r1, r8
	strh r1, [r0, 0x38]
	movs r0, 0x1
	b _081034EA
	.align 2, 0
_081034B0: .4byte gSharedMem
_081034B4:
	movs r2, 0x1
	mov r8, r2
	cmp r1, 0x1
	bne _081034C0
	movs r0, 0x3
	mov r8, r0
_081034C0:
	movs r5, 0
	mov r7, r8
_081034C4:
	lsls r0, r5, 16
	asrs r4, r0, 16
	subs r1, r7, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r6
	beq _081034A4
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _081034C4
	movs r0, 0
_081034EA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810347C

	thumb_func_start sub_81034F4
sub_81034F4: @ 81034F4
	push {r4,r5,lr}
	movs r5, 0
	b _08103500
_081034FA:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08103500:
	lsls r0, r5, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	bl sub_81030E0
	lsls r0, 24
	cmp r0, 0
	bne _081034FA
	ldr r0, _0810351C @ =gSharedMem
	strh r5, [r0, 0x2E]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810351C: .4byte gSharedMem
	thumb_func_end sub_81034F4

	thumb_func_start sub_8103520
sub_8103520: @ 8103520
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1]
	cmp r0, 0
	bne _0810352E
	movs r0, 0x1
	b _08103538
_0810352E:
	cmp r0, 0x1
	beq _08103536
	movs r0, 0
	b _0810353C
_08103536:
	movs r0, 0
_08103538:
	strb r0, [r1]
	movs r0, 0x1
_0810353C:
	pop {r1}
	bx r1
	thumb_func_end sub_8103520

	thumb_func_start sub_8103540
sub_8103540: @ 8103540
	push {lr}
	ldr r1, _0810355C @ =gUnknown_083ECB88
	ldr r0, _08103560 @ =gSharedMem
	movs r2, 0x12
	ldrsh r0, [r0, r2]
	subs r0, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	bx r0
	.align 2, 0
_0810355C: .4byte gUnknown_083ECB88
_08103560: .4byte gSharedMem
	thumb_func_end sub_8103540

	thumb_func_start sub_8103564
sub_8103564: @ 8103564
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r4, _081035D0 @ =gSharedMem
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _081035E0
	ldrb r1, [r4, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081035E0
	ldrh r0, [r4, 0x2E]
	movs r1, 0x2
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	mov r1, sp
	strb r0, [r1]
	mov r0, sp
	bl sub_8103520
	lsls r0, 24
	cmp r0, 0
	beq _081035E0
	movs r5, 0
	mov r7, sp
	movs r0, 0x2
	mov r8, r0
	adds r6, r4, 0
_081035AA:
	lsls r0, r5, 16
	asrs r4, r0, 16
	mov r0, r8
	subs r1, r0, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	ldrb r1, [r7]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	bne _081035D4
	movs r0, 0x2
	strh r0, [r6, 0x36]
	strh r5, [r6, 0x30]
	b _081035E0
	.align 2, 0
_081035D0: .4byte gSharedMem
_081035D4:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _081035AA
_081035E0:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8103564

	thumb_func_start j5_08111E84
j5_08111E84: @ 81035EC
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r4, _08103650 @ =gSharedMem
	ldrh r2, [r4, 0x34]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08103660
	ldrb r1, [r4, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08103660
	ldrh r1, [r4, 0x2E]
	subs r1, r2, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	mov r1, sp
	strb r0, [r1]
	mov r0, sp
	bl sub_8103520
	lsls r0, 24
	cmp r0, 0
	beq _08103660
	movs r6, 0
	mov r7, sp
	adds r5, r4, 0
_0810362A:
	ldrh r1, [r5, 0x34]
	lsls r0, r6, 16
	asrs r4, r0, 16
	subs r1, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	ldrb r1, [r7]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	bne _08103654
	ldrh r0, [r5, 0x34]
	strh r0, [r5, 0x36]
	strh r6, [r5, 0x30]
	b _08103660
	.align 2, 0
_08103650: .4byte gSharedMem
_08103654:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0810362A
_08103660:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end j5_08111E84

	thumb_func_start sub_8103668
sub_8103668: @ 8103668
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r4, _0810368C @ =gSharedMem
	ldrh r3, [r4, 0x34]
	movs r0, 0x34
	ldrsh r2, [r4, r0]
	cmp r2, 0
	beq _0810375A
	ldrb r1, [r4, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0810375A
	cmp r2, 0x2
	bne _081036AE
	bl j5_08111E84
	b _0810375A
	.align 2, 0
_0810368C: .4byte gSharedMem
_08103690:
	ldr r0, _0810369C @ =gSharedMem
	movs r1, 0
	strh r6, [r0, 0x36]
	strh r1, [r0, 0x30]
	b _0810375A
	.align 2, 0
_0810369C: .4byte gSharedMem
_081036A0:
	movs r0, 0x2
	strh r0, [r5, 0x36]
	adds r0, r4, 0x1
	strh r0, [r5, 0x30]
	b _0810375A
_081036AA:
	movs r0, 0x3
	b _08103736
_081036AE:
	ldrh r1, [r4, 0x2E]
	subs r1, r3, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	mov r1, sp
	strb r0, [r1]
	mov r0, sp
	bl sub_8103520
	lsls r0, 24
	cmp r0, 0
	beq _0810375A
	movs r6, 0x2
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	bne _081036D8
	movs r6, 0x3
_081036D8:
	movs r5, 0
	mov r7, sp
_081036DC:
	lsls r0, r6, 16
	asrs r4, r0, 16
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_8102BF8
	ldrb r1, [r7]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	beq _08103690
	lsls r1, r5, 16
	movs r0, 0x80
	lsls r0, 9
	adds r1, r0
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	lsrs r5, r1, 16
	asrs r1, 16
	cmp r1, 0x1
	ble _081036DC
	movs r6, 0x1
	mov r7, sp
	ldr r5, _0810373C @ =gSharedMem
_0810370E:
	ldrh r1, [r5, 0x34]
	lsls r0, r6, 16
	asrs r4, r0, 16
	subs r1, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	ldrb r1, [r7]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	bne _0810374E
	movs r1, 0x34
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _08103740
	cmp r4, 0x2
	ble _081036A0
_08103736:
	strh r0, [r5, 0x36]
	strh r6, [r5, 0x30]
	b _0810375A
	.align 2, 0
_0810373C: .4byte gSharedMem
_08103740:
	cmp r4, 0x2
	ble _081036AA
	movs r0, 0x2
	strh r0, [r5, 0x36]
	subs r0, r4, 0x1
	strh r0, [r5, 0x30]
	b _0810375A
_0810374E:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0810370E
_0810375A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8103668

	thumb_func_start sub_8103764
sub_8103764: @ 8103764
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r0, 0
	bne _08103778
	cmp r1, 0x1
	beq _08103780
_08103778:
	cmp r0, 0x1
	bne _08103784
	cmp r2, 0
	bne _08103784
_08103780:
	movs r0, 0x1
	b _08103786
_08103784:
	movs r0, 0
_08103786:
	pop {r1}
	bx r1
	thumb_func_end sub_8103764

	thumb_func_start sub_810378C
sub_810378C: @ 810378C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	cmp r0, 0
	bne _081037A6
	cmp r1, 0x1
	bne _081037A6
	cmp r2, 0
	beq _081037B2
_081037A6:
	cmp r0, 0x1
	bne _081037B6
	cmp r1, 0
	bne _081037B6
	cmp r2, 0x1
	bne _081037B6
_081037B2:
	movs r0, 0x1
	b _081037B8
_081037B6:
	movs r0, 0
_081037B8:
	pop {r1}
	bx r1
	thumb_func_end sub_810378C

	thumb_func_start sub_81037BC
sub_81037BC: @ 81037BC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	cmp r0, 0
	bne _081037D6
	cmp r1, 0x1
	bne _081037D6
	cmp r2, 0
	beq _08103802
_081037D6:
	cmp r0, 0x1
	bne _081037E2
	cmp r1, 0
	bne _081037E2
	cmp r2, 0x1
	beq _08103802
_081037E2:
	cmp r0, 0
	bne _081037EE
	cmp r1, 0
	bne _081037EE
	cmp r2, 0x1
	beq _08103802
_081037EE:
	cmp r0, 0x1
	bne _081037FA
	cmp r1, 0x1
	bne _081037FA
	cmp r2, 0
	beq _08103802
_081037FA:
	cmp r0, r1
	bne _08103806
	cmp r0, r2
	bne _08103806
_08103802:
	movs r0, 0
	b _08103808
_08103806:
	movs r0, 0x1
_08103808:
	pop {r1}
	bx r1
	thumb_func_end sub_81037BC

	thumb_func_start sub_810380C
sub_810380C: @ 810380C
	push {lr}
	ldr r1, _08103828 @ =gUnknown_083ECB94
	ldr r0, _0810382C @ =gSharedMem
	movs r2, 0x12
	ldrsh r0, [r0, r2]
	subs r0, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	bx r0
	.align 2, 0
_08103828: .4byte gUnknown_083ECB94
_0810382C: .4byte gSharedMem
	thumb_func_end sub_810380C

	thumb_func_start sub_8103830
sub_8103830: @ 8103830
	push {r4-r7,lr}
	movs r6, 0
	ldr r7, _08103868 @ =gSharedMem
	ldrh r1, [r7, 0x2E]
	movs r4, 0x2
	subs r1, r4, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r7, 0x30]
	subs r4, r0
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r5, r1
	bne _081038A0
	movs r4, 0x2
	b _08103876
	.align 2, 0
_08103868: .4byte gSharedMem
_0810386C:
	lsls r0, r6, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r6, r0, 16
_08103876:
	lsls r1, r6, 16
	asrs r1, 16
	subs r1, r4, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _0810386C
	cmp r5, 0
	bne _08103896
	cmp r0, 0x1
	beq _0810386C
_08103896:
	cmp r5, 0x1
	bne _08103900
	cmp r0, 0
	beq _0810386C
	b _08103900
_081038A0:
	adds r0, r5, 0
	bl sub_8103764
	lsls r0, 24
	cmp r0, 0
	beq _08103900
	ldrb r1, [r7, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081038DC
	movs r7, 0x2
_081038B8:
	lsls r0, r6, 16
	asrs r4, r0, 16
	subs r1, r7, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _08103900
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _081038B8
_081038DC:
	movs r6, 0
	movs r7, 0x2
	b _081038E8
_081038E2:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_081038E8:
	lsls r0, r6, 16
	asrs r4, r0, 16
	subs r1, r7, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _081038E2
_08103900:
	ldr r0, _0810390C @ =gSharedMem
	strh r6, [r0, 0x32]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810390C: .4byte gSharedMem
	thumb_func_end sub_8103830

	thumb_func_start sub_8103910
sub_8103910: @ 8103910
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r4, _08103978 @ =gSharedMem
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	cmp r1, 0
	beq _081039A6
	ldrh r2, [r4, 0x34]
	movs r3, 0x34
	ldrsh r0, [r4, r3]
	cmp r0, r1
	bne _081039A6
	ldrb r1, [r4, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081039A6
	ldrh r1, [r4, 0x2E]
	subs r1, r2, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r1, [r4, 0x36]
	ldrh r0, [r4, 0x30]
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_8103764
	lsls r0, 24
	cmp r0, 0
	beq _081039A6
	movs r5, 0
	b _08103982
	.align 2, 0
_08103978: .4byte gSharedMem
_0810397C:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08103982:
	lsls r6, r5, 16
	asrs r5, r6, 16
	cmp r5, 0x4
	bgt _081039A6
	ldr r0, _08103A34 @ =gSharedMem
	ldrh r1, [r0, 0x36]
	subs r1, r5
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r7, r4
	bne _0810397C
	lsrs r6, 16
	str r6, [sp]
_081039A6:
	ldr r0, _08103A34 @ =gSharedMem
	mov r9, r0
_081039AA:
	movs r5, 0x1
	movs r1, 0
	mov r8, r1
	ldr r2, [sp]
	lsls r2, 16
	mov r10, r2
_081039B6:
	mov r3, r9
	ldrh r1, [r3, 0x2E]
	lsls r5, 16
	asrs r4, r5, 16
	subs r1, r4, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, r9
	ldrh r1, [r0, 0x30]
	subs r1, r4, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	lsls r0, 24
	lsrs r6, r0, 24
	mov r1, r10
	asrs r0, r1, 16
	subs r4, r0
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_81037BC
	lsls r0, 24
	cmp r0, 0
	bne _08103A38
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_810378C
	lsls r0, 24
	cmp r0, 0
	beq _08103A24
	mov r2, r9
	ldrb r1, [r2, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08103A38
_08103A24:
	mov r3, r8
	lsls r0, r3, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r0, 16
	mov r8, r0
	b _08103A46
	.align 2, 0
_08103A34: .4byte gSharedMem
_08103A38:
	movs r2, 0x80
	lsls r2, 9
	adds r0, r5, r2
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _081039B6
_08103A46:
	mov r3, r8
	cmp r3, 0
	beq _08103A5C
	ldr r1, [sp]
	lsls r0, r1, 16
	movs r2, 0x80
	lsls r2, 9
	adds r0, r2
	lsrs r0, 16
	str r0, [sp]
	b _081039AA
_08103A5C:
	ldr r0, _08103A74 @ =gSharedMem
	mov r3, sp
	ldrh r3, [r3]
	strh r3, [r0, 0x32]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08103A74: .4byte gSharedMem
	thumb_func_end sub_8103910

	thumb_func_start sub_8103A78
sub_8103A78: @ 8103A78
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	bl sub_8103910
	ldr r4, _08103B10 @ =gSharedMem
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _08103B20
	ldrh r2, [r4, 0x34]
	movs r3, 0x34
	ldrsh r0, [r4, r3]
	cmp r0, r1
	beq _08103B20
	ldrb r1, [r4, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08103B20
	ldrh r1, [r4, 0x2E]
	subs r1, r2, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r1, [r4, 0x36]
	ldrh r0, [r4, 0x30]
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8103764
	lsls r0, 24
	cmp r0, 0
	beq _08103B20
	movs r1, 0x1
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	bne _08103AE0
	movs r1, 0x3
_08103AE0:
	movs r3, 0
	lsls r1, 16
	mov r8, r1
	adds r7, r4, 0
_08103AE8:
	ldrh r2, [r7, 0x32]
	lsls r0, r3, 16
	asrs r5, r0, 16
	adds r2, r5, r2
	mov r3, r8
	asrs r1, r3, 16
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r6, r4
	bne _08103B14
	ldrh r0, [r7, 0x32]
	adds r0, r5, r0
	strh r0, [r7, 0x32]
	b _08103B20
	.align 2, 0
_08103B10: .4byte gSharedMem
_08103B14:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08103AE8
_08103B20:
	ldr r7, _08103B90 @ =gSharedMem
_08103B22:
	ldrh r0, [r7, 0x2E]
	movs r1, 0x1
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r7, 0x30]
	movs r1, 0x2
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r7, 0x32]
	movs r1, 0x3
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_81037BC
	lsls r0, 24
	cmp r0, 0
	bne _08103B94
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_810378C
	lsls r0, 24
	cmp r0, 0
	beq _08103B88
	ldrb r1, [r7, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08103B94
_08103B88:
	ldrh r0, [r7, 0x32]
	adds r0, 0x1
	strh r0, [r7, 0x32]
	b _08103B22
	.align 2, 0
_08103B90: .4byte gSharedMem
_08103B94:
	ldr r7, _08103C04 @ =gSharedMem
_08103B96:
	ldrh r0, [r7, 0x2E]
	movs r1, 0x3
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r7, 0x30]
	movs r1, 0x2
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r7, 0x32]
	movs r1, 0x1
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_81037BC
	lsls r0, 24
	cmp r0, 0
	bne _08103C08
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_810378C
	lsls r0, 24
	cmp r0, 0
	beq _08103BFC
	ldrb r1, [r7, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08103C08
_08103BFC:
	ldrh r0, [r7, 0x32]
	adds r0, 0x1
	strh r0, [r7, 0x32]
	b _08103B96
	.align 2, 0
_08103C04: .4byte gSharedMem
_08103C08:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8103A78

	thumb_func_start sub_8103C14
sub_8103C14: @ 8103C14
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08103C40 @ =sub_8103C48
	adds r0, r5, 0
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08103C44 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x26]
	bl _call_via_r5
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08103C40: .4byte sub_8103C48
_08103C44: .4byte gTasks
	thumb_func_end sub_8103C14

	thumb_func_start sub_8103C48
sub_8103C48: @ 8103C48
	push {r4,lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08103C70 @ =gUnknown_083ECBA0
	ldr r2, _08103C74 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r4, 0x8
	ldrsh r2, [r0, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08103C70: .4byte gUnknown_083ECBA0
_08103C74: .4byte gTasks
	thumb_func_end sub_8103C48

	thumb_func_start sub_8103C78
sub_8103C78: @ 8103C78
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _08103CA8 @ =gUnknown_083ECBAC
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x73
	str r1, [sp]
	movs r1, 0x62
	movs r2, 0x63
	movs r3, 0x72
	bl sub_81065A8
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08103CA8: .4byte gUnknown_083ECBAC
	thumb_func_end sub_8103C78

	thumb_func_start sub_8103CAC
sub_8103CAC: @ 8103CAC
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	ble _08103CC4
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_08103CC4:
	pop {r0}
	bx r0
	thumb_func_end sub_8103CAC

	thumb_func_start sub_8103CC8
sub_8103CC8: @ 8103CC8
	push {r4,lr}
	sub sp, 0x4
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r1, _08103CFC @ =gUnknown_083ECBAC
	movs r2, 0x26
	ldrsh r0, [r0, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x53
	str r1, [sp]
	movs r1, 0x42
	movs r2, 0x43
	movs r3, 0x52
	bl sub_81065A8
	adds r0, r4, 0
	bl DestroyTask
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08103CFC: .4byte gUnknown_083ECBAC
	thumb_func_end sub_8103CC8

	thumb_func_start sub_8103D00
sub_8103D00: @ 8103D00
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08103D20 @ =gUnknown_083EDD08
	lsls r1, r0, 2
	adds r1, r2
	ldr r2, [r1]
	ldr r1, _08103D24 @ =gUnknown_083EDD30
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r2, 0
	movs r2, 0x2
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_08103D20: .4byte gUnknown_083EDD08
_08103D24: .4byte gUnknown_083EDD30
	thumb_func_end sub_8103D00

	thumb_func_start sub_8103D28
sub_8103D28: @ 8103D28
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08103D48 @ =gUnknown_083EDD1C
	lsls r1, r0, 2
	adds r1, r2
	ldr r2, [r1]
	ldr r1, _08103D4C @ =gUnknown_083EDD30
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r2, 0
	movs r2, 0x2
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_08103D48: .4byte gUnknown_083EDD1C
_08103D4C: .4byte gUnknown_083EDD30
	thumb_func_end sub_8103D28

	thumb_func_start sub_8103D50
sub_8103D50: @ 8103D50
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r4, 0
	ldr r0, _08103D84 @ =gUnknown_083EDD3B
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r4, r0
	bcs _08103D7C
	ldr r7, _08103D88 @ =gUnknown_083EDD35
	adds r6, r0, 0
	lsls r5, r1, 1
_08103D68:
	adds r0, r4, r5
	adds r0, r7
	ldrb r0, [r0]
	bl sub_8103D00
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _08103D68
_08103D7C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08103D84: .4byte gUnknown_083EDD3B
_08103D88: .4byte gUnknown_083EDD35
	thumb_func_end sub_8103D50

	thumb_func_start sub_8103D8C
sub_8103D8C: @ 8103D8C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r4, 0
	ldr r0, _08103DC0 @ =gUnknown_083EDD3B
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r4, r0
	bcs _08103DB8
	ldr r7, _08103DC4 @ =gUnknown_083EDD35
	adds r6, r0, 0
	lsls r5, r1, 1
_08103DA4:
	adds r0, r4, r5
	adds r0, r7
	ldrb r0, [r0]
	bl sub_8103D28
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _08103DA4
_08103DB8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08103DC0: .4byte gUnknown_083EDD3B
_08103DC4: .4byte gUnknown_083EDD35
	thumb_func_end sub_8103D8C

	thumb_func_start sub_8103DC8
sub_8103DC8: @ 8103DC8
	push {r4-r6,lr}
	movs r4, 0
	ldr r6, _08103DF8 @ =gSprites
	ldr r5, _08103DFC @ =gSharedMem + 0x44
_08103DD0:
	ldr r0, _08103E00 @ =sub_8103EE4
	bl CreateInvisibleSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	strh r4, [r1, 0x2E]
	adds r1, r4, r5
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _08103DD0
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08103DF8: .4byte gSprites
_08103DFC: .4byte gSharedMem + 0x44
_08103E00: .4byte sub_8103EE4
	thumb_func_end sub_8103DC8

	thumb_func_start sub_8103E04
sub_8103E04: @ 8103E04
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08103E30 @ =gSharedMem
	adds r1, 0x44
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08103E34 @ =gSprites
	adds r0, r1
	movs r2, 0
	movs r1, 0x1
	strh r1, [r0, 0x30]
	movs r1, 0x4
	strh r1, [r0, 0x32]
	strh r2, [r0, 0x34]
	strh r2, [r0, 0x36]
	movs r1, 0x2
	strh r1, [r0, 0x38]
	strh r2, [r0, 0x3C]
	bx lr
	.align 2, 0
_08103E30: .4byte gSharedMem
_08103E34: .4byte gSprites
	thumb_func_end sub_8103E04

	thumb_func_start sub_8103E38
sub_8103E38: @ 8103E38
	push {r4,r5,lr}
	movs r2, 0
	ldr r4, _08103E60 @ =gSharedMem + 0x44
	ldr r3, _08103E64 @ =gSprites
_08103E40:
	adds r0, r2, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r3
	movs r5, 0x30
	ldrsh r0, [r1, r5]
	cmp r0, 0
	beq _08103E68
	movs r5, 0x32
	ldrsh r0, [r1, r5]
	cmp r0, 0
	beq _08103E68
	movs r0, 0
	b _08103E74
	.align 2, 0
_08103E60: .4byte gSharedMem + 0x44
_08103E64: .4byte gSprites
_08103E68:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x4
	bls _08103E40
	movs r0, 0x1
_08103E74:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8103E38

	thumb_func_start sub_8103E7C
sub_8103E7C: @ 8103E7C
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08103E94 @ =gSharedMem + 0x44
_08103E82:
	adds r0, r4, r5
	ldrb r0, [r0]
	bl sub_8103EAC
	lsls r0, 24
	cmp r0, 0
	bne _08103E98
	movs r0, 0
	b _08103EA4
	.align 2, 0
_08103E94: .4byte gSharedMem + 0x44
_08103E98:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _08103E82
	movs r0, 0x1
_08103EA4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8103E7C

	thumb_func_start sub_8103EAC
sub_8103EAC: @ 8103EAC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08103EC8 @ =gSprites
	adds r1, r0
	movs r2, 0x30
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08103ECC
	movs r0, 0x1
	b _08103EDE
	.align 2, 0
_08103EC8: .4byte gSprites
_08103ECC:
	ldrh r2, [r1, 0x3C]
	movs r3, 0x3C
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08103EDA
	movs r0, 0
	strh r0, [r1, 0x30]
_08103EDA:
	lsls r0, r2, 24
	lsrs r0, 24
_08103EDE:
	pop {r1}
	bx r1
	thumb_func_end sub_8103EAC

	thumb_func_start sub_8103EE4
sub_8103EE4: @ 8103EE4
	push {r4-r7,lr}
	adds r2, r0, 0
	movs r1, 0x30
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _08103F66
	ldrh r0, [r2, 0x34]
	subs r0, 0x1
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _08103F4E
	movs r0, 0
	strh r0, [r2, 0x3C]
	movs r6, 0x1
	strh r6, [r2, 0x34]
	ldrh r1, [r2, 0x38]
	ldrh r3, [r2, 0x36]
	adds r0, r1, r3
	strh r0, [r2, 0x36]
	movs r4, 0x4
	ldrh r5, [r2, 0x32]
	movs r7, 0x32
	ldrsh r3, [r2, r7]
	cmp r3, 0
	beq _08103F20
	movs r4, 0x8
_08103F20:
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bgt _08103F38
	strh r6, [r2, 0x3C]
	negs r0, r1
	strh r0, [r2, 0x38]
	cmp r3, 0
	beq _08103F4E
	subs r0, r5, 0x1
	strh r0, [r2, 0x32]
	b _08103F40
_08103F38:
	cmp r0, r4
	blt _08103F40
	negs r0, r1
	strh r0, [r2, 0x38]
_08103F40:
	movs r1, 0x32
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _08103F4E
	ldrh r0, [r2, 0x34]
	lsls r0, 1
	strh r0, [r2, 0x34]
_08103F4E:
	ldr r1, _08103F6C @ =gUnknown_083EDD30
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	adds r0, r1
	ldrb r0, [r0]
	ldrh r3, [r2, 0x36]
	lsls r3, 24
	lsrs r3, 24
	adds r1, r3, 0
	adds r2, r3, 0
	bl MultiplyPaletteRGBComponents
_08103F66:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08103F6C: .4byte gUnknown_083EDD30
	thumb_func_end sub_8103EE4

	thumb_func_start sub_8103F70
sub_8103F70: @ 8103F70
	push {r4,lr}
	ldr r4, _08103F98 @ =sub_8103FE8
	adds r0, r4, 0
	movs r1, 0x6
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08103F9C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x1
	strh r2, [r1, 0xE]
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08103F98: .4byte sub_8103FE8
_08103F9C: .4byte gTasks
	thumb_func_end sub_8103F70

	thumb_func_start sub_8103FA0
sub_8103FA0: @ 8103FA0
	push {lr}
	ldr r0, _08103FC4 @ =sub_8103FE8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08103FC8 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08103FCC
	movs r0, 0
	b _08103FE0
	.align 2, 0
_08103FC4: .4byte sub_8103FE8
_08103FC8: .4byte gTasks
_08103FCC:
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _08103FE4 @ =gUnknown_083EDDAC
	ldr r0, [r0]
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x1
_08103FE0:
	pop {r1}
	bx r1
	.align 2, 0
_08103FE4: .4byte gUnknown_083EDDAC
	thumb_func_end sub_8103FA0

	thumb_func_start sub_8103FE8
sub_8103FE8: @ 8103FE8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08104040 @ =gTasks
	adds r2, r1, r0
	ldrh r0, [r2, 0xA]
	subs r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _08104026
	movs r0, 0x4
	strh r0, [r2, 0xA]
	ldrh r1, [r2, 0xE]
	ldrh r3, [r2, 0xC]
	adds r0, r1, r3
	strh r0, [r2, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	beq _08104022
	cmp r0, 0x2
	bne _08104026
_08104022:
	negs r0, r1
	strh r0, [r2, 0xE]
_08104026:
	ldr r0, _08104044 @ =gUnknown_083EDDA0
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_08104040: .4byte gTasks
_08104044: .4byte gUnknown_083EDDA0
	thumb_func_end sub_8103FE8

	thumb_func_start sub_8104048
sub_8104048: @ 8104048
	push {lr}
	ldr r0, _0810405C @ =sub_81040E8
	movs r1, 0x8
	bl CreateTask
	ldr r1, _08104060 @ =gSharedMem
	adds r1, 0x3E
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0810405C: .4byte sub_81040E8
_08104060: .4byte gSharedMem
	thumb_func_end sub_8104048

	thumb_func_start sub_8104064
sub_8104064: @ 8104064
	push {r4,lr}
	ldr r0, _08104090 @ =gSharedMem
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08104094 @ =gTasks
	adds r4, r0
	adds r0, r4, 0
	bl sub_810421C
	movs r1, 0x1
	strh r1, [r4, 0x8]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	strh r1, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104090: .4byte gSharedMem
_08104094: .4byte gTasks
	thumb_func_end sub_8104064

	thumb_func_start sub_8104098
sub_8104098: @ 8104098
	push {r4,lr}
	ldr r0, _081040C0 @ =gSharedMem
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _081040C4 @ =gTasks
	adds r4, r0
	adds r0, r4, 0
	bl sub_810421C
	movs r0, 0x3
	strh r0, [r4, 0x8]
	movs r0, 0x1
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081040C0: .4byte gSharedMem
_081040C4: .4byte gTasks
	thumb_func_end sub_8104098

	thumb_func_start sub_81040C8
sub_81040C8: @ 81040C8
	ldr r2, _081040E0 @ =gTasks
	ldr r0, _081040E4 @ =gSharedMem
	adds r0, 0x3E
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r0, [r0, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_081040E0: .4byte gTasks
_081040E4: .4byte gSharedMem
	thumb_func_end sub_81040C8

	thumb_func_start sub_81040E8
sub_81040E8: @ 81040E8
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08104110 @ =gUnknown_083ECBB4
	ldr r2, _08104114 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08104110: .4byte gUnknown_083ECBB4
_08104114: .4byte gTasks
	thumb_func_end sub_81040E8

	thumb_func_start nullsub_68
nullsub_68: @ 8104118
	bx lr
	thumb_func_end nullsub_68

	thumb_func_start sub_810411C
sub_810411C: @ 810411C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0xA]
	lsls r0, 19
	movs r1, 0xA0
	lsls r1, 13
	adds r0, r1
	asrs r0, 16
	movs r1, 0x14
	bl sub_8105B1C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_810411C

	thumb_func_start sub_8104144
sub_8104144: @ 8104144
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _08104174 @ =gSprites
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3C
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0810419E
	ldrh r1, [r4, 0xA]
	adds r0, r1, 0x2
	lsls r0, 16
	lsrs r2, r0, 16
	movs r0, 0
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x1
	bne _08104178
	movs r0, 0x1
	b _0810417E
	.align 2, 0
_08104174: .4byte gSprites
_08104178:
	cmp r1, 0x10
	bne _0810417E
	movs r0, 0x2
_0810417E:
	lsls r1, r2, 16
	asrs r1, 15
	ldr r2, _081041A4 @ =0x0600e800
	adds r1, r2
	adds r1, 0x80
	ldr r2, _081041A8 @ =gUnknown_083ECBC4
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	ldrb r0, [r4, 0xC]
	bl sub_8105B88
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0x26]
_0810419E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081041A4: .4byte 0x0600e800
_081041A8: .4byte gUnknown_083ECBC4
	thumb_func_end sub_8104144

	thumb_func_start sub_81041AC
sub_81041AC: @ 81041AC
	push {r4,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0xA]
	adds r0, r1, 0x2
	lsls r0, 16
	lsrs r4, r0, 16
	movs r2, 0
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x1
	bne _081041C6
	movs r2, 0x1
	b _081041CC
_081041C6:
	cmp r1, 0x10
	bne _081041CC
	movs r2, 0x2
_081041CC:
	movs r1, 0xC
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _081041F0
	lsls r0, r4, 16
	asrs r0, 15
	ldr r1, _08104214 @ =0x0600e800
	adds r0, r1
	adds r0, 0x80
	ldr r1, _08104218 @ =gUnknown_083ECBC4
	lsls r2, 2
	adds r1, 0x2
	adds r2, r1
	ldrh r1, [r2]
	strh r1, [r0]
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
_081041F0:
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _08104202
	movs r0, 0
	strh r0, [r3, 0xC]
_08104202:
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _0810420E
	strh r0, [r3, 0x8]
	strh r0, [r3, 0x26]
_0810420E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104214: .4byte 0x0600e800
_08104218: .4byte gUnknown_083ECBC4
	thumb_func_end sub_81041AC

	thumb_func_start sub_810421C
sub_810421C: @ 810421C
	push {lr}
	movs r1, 0x2
	adds r2, r0, 0
	adds r2, 0x8
	movs r3, 0
_08104226:
	lsls r0, r1, 1
	adds r0, r2, r0
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _08104226
	pop {r0}
	bx r0
	thumb_func_end sub_810421C

	thumb_func_start sub_810423C
sub_810423C: @ 810423C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r2, 0x3
	ldr r6, _08104268 @ =0x0600e800
	movs r4, 0
	ldr r0, _0810426C @ =gTasks
	mov r8, r0
	ldr r1, _08104270 @ =gSharedMem
	mov r12, r1
	cmp r4, r5
	bge _081042A6
	ldr r7, _08104274 @ =gUnknown_083ECBC4
_0810425A:
	movs r3, 0
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, 0
	bne _08104278
	movs r3, 0x1
	b _0810427E
	.align 2, 0
_08104268: .4byte 0x0600e800
_0810426C: .4byte gTasks
_08104270: .4byte gSharedMem
_08104274: .4byte gUnknown_083ECBC4
_08104278:
	cmp r0, 0xF
	bne _0810427E
	movs r3, 0x2
_0810427E:
	lsls r2, 16
	asrs r2, 16
	lsls r1, r2, 1
	adds r1, r6
	adds r1, 0x80
	lsls r0, r3, 2
	adds r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r0, r4, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	adds r2, 0x1
	lsls r2, 16
	lsrs r2, 16
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, r5
	blt _0810425A
_081042A6:
	lsls r1, r4, 16
	asrs r0, r1, 16
	cmp r0, 0xF
	bgt _081042F0
	ldr r7, _081042BC @ =gUnknown_083ECBC4 + 0x2
_081042B0:
	movs r3, 0
	asrs r0, r1, 16
	cmp r0, 0
	bne _081042C0
	movs r3, 0x1
	b _081042C6
	.align 2, 0
_081042BC: .4byte gUnknown_083ECBC4 + 0x2
_081042C0:
	cmp r0, 0xF
	bne _081042C6
	movs r3, 0x2
_081042C6:
	lsls r2, 16
	asrs r2, 16
	lsls r1, r2, 1
	adds r1, r6
	adds r1, 0x80
	lsls r0, r3, 2
	adds r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r0, r4, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r4, r0, 16
	adds r2, 0x1
	lsls r2, 16
	lsrs r2, 16
	lsls r1, r4, 16
	asrs r0, r1, 16
	cmp r0, 0xF
	ble _081042B0
_081042F0:
	mov r0, r12
	adds r0, 0x3E
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	add r0, r8
	strh r5, [r0, 0xA]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810423C

	thumb_func_start sub_810430C
sub_810430C: @ 810430C
	push {r4,lr}
	ldr r4, _08104328 @ =sub_810434C
	adds r0, r4, 0
	movs r1, 0x7
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104328: .4byte sub_810434C
	thumb_func_end sub_810430C

	thumb_func_start sub_810432C
sub_810432C: @ 810432C
	push {lr}
	ldr r0, _08104340 @ =sub_810434C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08104344
	movs r0, 0
	b _08104346
	.align 2, 0
_08104340: .4byte sub_810434C
_08104344:
	movs r0, 0x1
_08104346:
	pop {r1}
	bx r1
	thumb_func_end sub_810432C

	thumb_func_start sub_810434C
sub_810434C: @ 810434C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08104374 @ =gUnknown_083ECBD0
	ldr r2, _08104378 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08104374: .4byte gUnknown_083ECBD0
_08104378: .4byte gTasks
	thumb_func_end sub_810434C

	thumb_func_start sub_810437C
sub_810437C: @ 810437C
	push {lr}
	ldr r1, _081043DC @ =gSharedMem
	movs r2, 0
	strb r2, [r1, 0xA]
	strh r2, [r1, 0x14]
	strh r2, [r1, 0x16]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	strh r2, [r0, 0xA]
	movs r1, 0x1E
	strh r1, [r0, 0xC]
	movs r1, 0xA0
	lsls r1, 3
	strh r1, [r0, 0x10]
	ldr r0, _081043E0 @ =gSpriteCoordOffsetX
	strh r2, [r0]
	ldr r0, _081043E4 @ =gSpriteCoordOffsetY
	strh r2, [r0]
	ldr r0, _081043E8 @ =REG_BG1HOFS
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	movs r0, 0x1E
	movs r1, 0
	bl sub_8104A40
	bl sub_81051C0
	bl sub_8105100
	bl sub_81052EC
	bl sub_81053A0
	bl sub_810545C
	bl sub_8102680
	bl StopMapMusic
	movs r0, 0xC4
	lsls r0, 1
	bl PlayNewMapMusic
	pop {r0}
	bx r0
	.align 2, 0
_081043DC: .4byte gSharedMem
_081043E0: .4byte gSpriteCoordOffsetX
_081043E4: .4byte gSpriteCoordOffsetY
_081043E8: .4byte REG_BG1HOFS
	thumb_func_end sub_810437C

	thumb_func_start sub_81043EC
sub_81043EC: @ 81043EC
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0810445C @ =gSpriteCoordOffsetX
	ldrh r0, [r1]
	subs r0, 0x8
	strh r0, [r1]
	ldrh r2, [r4, 0xA]
	adds r2, 0x8
	strh r2, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	adds r0, 0xF0
	movs r1, 0xFF
	ands r0, r1
	lsrs r3, r0, 3
	ldr r1, _08104460 @ =REG_BG1HOFS
	ldr r0, _08104464 @ =0x000001ff
	ands r2, r0
	strh r2, [r1]
	adds r2, r3, 0
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r2, r0
	beq _08104438
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x12
	bgt _08104438
	strh r3, [r4, 0xC]
	ldrh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r4, 0xE]
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	adds r0, r2, 0
	bl sub_8104A40
_08104438:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0xC7
	ble _0810444A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xE]
_0810444A:
	ldrh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 24
	bl sub_8102D28
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810445C: .4byte gSpriteCoordOffsetX
_08104460: .4byte REG_BG1HOFS
_08104464: .4byte 0x000001ff
	thumb_func_end sub_81043EC

	thumb_func_start sub_8104468
sub_8104468: @ 8104468
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 24
	bl sub_8102D28
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3B
	ble _08104492
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl sub_8105578
	bl sub_81056F0
_08104492:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8104468

	thumb_func_start sub_8104498
sub_8104498: @ 8104498
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r7, r0, 0
	ldr r1, _08104534 @ =gUnknown_083ECC1C
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	add r0, sp, 0x4
	mov r8, r0
	ldr r1, _08104538 @ =gUnknown_083ECC20
	movs r2, 0x8
	bl memcpy
	add r6, sp, 0xC
	ldr r1, _0810453C @ =gUnknown_083ECC28
	adds r0, r6, 0
	movs r2, 0x8
	bl memcpy
	ldrh r0, [r7, 0x10]
	lsls r0, 16
	asrs r0, 24
	bl sub_8102D28
	ldrh r0, [r7, 0x10]
	subs r0, 0x4
	strh r0, [r7, 0x10]
	lsls r0, 16
	asrs r0, 24
	movs r5, 0x4
	subs r5, r0
	lsls r4, r5, 1
	add r8, r4
	mov r1, r8
	movs r2, 0
	ldrsh r0, [r1, r2]
	bl sub_8105688
	adds r6, r4
	movs r1, 0
	ldrsh r0, [r6, r1]
	bl sub_81057E8
	ldr r0, _08104540 @ =gSharedMem
	adds r0, 0x3F
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08104544 @ =gSprites
	adds r0, r1
	mov r2, sp
	adds r1, r2, r5
	ldrb r1, [r1]
	bl StartSpriteAnimIfDifferent
	movs r1, 0x10
	ldrsh r0, [r7, r1]
	movs r1, 0x80
	lsls r1, 1
	cmp r0, r1
	bgt _08104526
	ldrh r0, [r7, 0x8]
	adds r0, 0x1
	strh r0, [r7, 0x8]
	strh r1, [r7, 0x10]
	movs r0, 0
	strh r0, [r7, 0x12]
_08104526:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08104534: .4byte gUnknown_083ECC1C
_08104538: .4byte gUnknown_083ECC20
_0810453C: .4byte gUnknown_083ECC28
_08104540: .4byte gSharedMem
_08104544: .4byte gSprites
	thumb_func_end sub_8104498

	thumb_func_start sub_8104548
sub_8104548: @ 8104548
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 24
	bl sub_8102D28
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4F
	ble _0810458A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	strh r0, [r4, 0x12]
	movs r0, 0x2
	bl sub_81057E8
	ldr r0, _08104590 @ =gSharedMem
	adds r0, 0x3F
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08104594 @ =gSprites
	adds r0, r1
	movs r1, 0x3
	bl StartSpriteAnimIfDifferent
_0810458A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104590: .4byte gSharedMem
_08104594: .4byte gSprites
	thumb_func_end sub_8104548

	thumb_func_start sub_8104598
sub_8104598: @ 8104598
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 24
	bl sub_8102D28
	ldrb r0, [r4, 0x10]
	adds r0, 0x80
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4F
	ble _081045C4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	strh r0, [r4, 0x12]
_081045C4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8104598

	thumb_func_start sub_81045CC
sub_81045CC: @ 81045CC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 24
	bl sub_8102D28
	ldrb r0, [r4, 0x10]
	adds r0, 0x40
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x27
	ble _08104634
	movs r0, 0
	strh r0, [r4, 0x12]
	ldr r1, _0810460C @ =gSharedMem
	ldrb r0, [r1, 0x5]
	cmp r0, 0
	beq _08104610
	ldrb r1, [r1, 0xA]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bgt _0810462E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	b _0810462C
	.align 2, 0
_0810460C: .4byte gSharedMem
_08104610:
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _0810461E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	b _0810462C
_0810461E:
	ldrh r0, [r4, 0x14]
	bl sub_81026DC
	lsls r0, 24
	cmp r0, 0
	beq _0810462E
	movs r0, 0xE
_0810462C:
	strh r0, [r4, 0x8]
_0810462E:
	ldrh r0, [r4, 0x14]
	adds r0, 0x1
	strh r0, [r4, 0x14]
_08104634:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81045CC

	thumb_func_start sub_810463C
sub_810463C: @ 810463C
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _08104660 @ =gSharedMem
	movs r1, 0x14
	ldrsh r0, [r6, r1]
	movs r1, 0x14
	bl __modsi3
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r0, 0
	beq _08104664
	ldrh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 24
	bl sub_8102D5C
	b _08104688
	.align 2, 0
_08104660: .4byte gSharedMem
_08104664:
	movs r0, 0x1
	bl sub_8102C48
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r6, 0x5]
	cmp r0, r1
	beq _08104692
	ldrh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 24
	bl sub_8102D28
	movs r1, 0x14
	ldrsh r0, [r6, r1]
	movs r1, 0x14
	bl __modsi3
_08104688:
	lsls r0, 16
	lsrs r5, r0, 16
	ldrb r0, [r4, 0x10]
	adds r0, 0x40
	strh r0, [r4, 0x10]
_08104692:
	lsls r0, r5, 16
	asrs r5, r0, 16
	cmp r5, 0
	bne _081046B4
	movs r0, 0x1
	bl sub_8102C48
	ldr r1, _081046BC @ =gSharedMem
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1, 0x5]
	cmp r0, r1
	bne _081046B4
	strh r5, [r4, 0x10]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_081046B4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081046BC: .4byte gSharedMem
	thumb_func_end sub_810463C

	thumb_func_start sub_81046C0
sub_81046C0: @ 81046C0
	push {r4-r7,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	movs r7, 0
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3B
	ble _08104758
	bl StopMapMusic
	bl sub_81056C0
	bl sub_8105804
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldr r5, _08104710 @ =gSharedMem
	ldrb r0, [r5, 0x5]
	cmp r0, 0
	bne _0810471C
	movs r0, 0xA0
	strh r0, [r4, 0x10]
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08104714 @ =gSprites
	adds r0, r1
	movs r1, 0x5
	bl StartSpriteAnimIfDifferent
	ldr r0, _08104718 @ =0x00000187
	bl PlayFanfare
	b _08104758
	.align 2, 0
_08104710: .4byte gSharedMem
_08104714: .4byte gSprites
_08104718: .4byte 0x00000187
_0810471C:
	movs r0, 0xC0
	strh r0, [r4, 0x10]
	adds r6, r5, 0
	adds r6, 0x3F
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08104760 @ =gSprites
	adds r0, r4
	movs r1, 0x4
	bl StartSpriteAnimIfDifferent
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2B
	strb r7, [r0]
	ldrb r0, [r5, 0x2]
	cmp r0, 0
	beq _08104750
	bl sub_8104098
	strb r7, [r5, 0x2]
_08104750:
	movs r0, 0xC3
	lsls r0, 1
	bl PlayFanfare
_08104758:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08104760: .4byte gSprites
	thumb_func_end sub_81046C0

	thumb_func_start sub_8104764
sub_8104764: @ 8104764
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x10]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0810477C
	subs r0, r1, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bne _0810478C
_0810477C:
	bl sub_81040C8
	lsls r0, 24
	cmp r0, 0
	bne _0810478C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0810478C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8104764

	thumb_func_start sub_8104794
sub_8104794: @ 8104794
	push {r4,lr}
	adds r3, r0, 0
	ldr r1, _081047D4 @ =gSpriteCoordOffsetX
	ldrh r0, [r1]
	subs r0, 0x8
	strh r0, [r1]
	ldrh r2, [r3, 0xA]
	adds r2, 0x8
	strh r2, [r3, 0xA]
	ldrh r0, [r3, 0xE]
	adds r0, 0x8
	strh r0, [r3, 0xE]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	subs r0, 0x8
	movs r1, 0xFF
	ands r0, r1
	lsrs r4, r0, 3
	ldr r1, _081047D8 @ =REG_BG1HOFS
	ldr r0, _081047DC @ =0x000001ff
	ands r2, r0
	strh r2, [r1]
	ldrh r0, [r3, 0xE]
	lsls r0, 16
	asrs r0, 19
	cmp r0, 0x19
	bgt _081047E0
	adds r0, r4, 0
	bl sub_8104A88
	b _081047E6
	.align 2, 0
_081047D4: .4byte gSpriteCoordOffsetX
_081047D8: .4byte REG_BG1HOFS
_081047DC: .4byte 0x000001ff
_081047E0:
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_081047E6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8104794

	thumb_func_start sub_81047EC
sub_81047EC: @ 81047EC
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _08104834 @ =gSharedMem
	movs r6, 0
	strb r6, [r4, 0xB]
	ldrb r0, [r4, 0x5]
	strb r0, [r4, 0xA]
	ldr r0, _08104838 @ =gSpriteCoordOffsetX
	strh r6, [r0]
	ldr r0, _0810483C @ =REG_BG1HOFS
	strh r6, [r0]
	movs r0, 0x8
	strh r0, [r4, 0x1A]
	bl sub_810514C
	bl sub_81054B8
	bl sub_8105524
	adds r0, r4, 0
	adds r0, 0x60
	ldrh r0, [r0]
	bl PlayNewMapMusic
	ldrb r0, [r4, 0xA]
	cmp r0, 0
	bne _08104844
	ldr r0, _08104840 @ =sub_810434C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	b _0810485A
	.align 2, 0
_08104834: .4byte gSharedMem
_08104838: .4byte gSpriteCoordOffsetX
_0810483C: .4byte REG_BG1HOFS
_08104840: .4byte sub_810434C
_08104844:
	movs r0, 0x4
	bl sub_8104CAC
	bl dp15_jump_random_unknown
	strh r0, [r5, 0xA]
	strh r6, [r5, 0xC]
	strh r6, [r5, 0xE]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_0810485A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_81047EC

	thumb_func_start sub_8104860
sub_8104860: @ 8104860
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _0810487C @ =gSharedMem
	ldrh r0, [r5, 0x1A]
	lsls r6, r0, 16
	asrs r1, r6, 16
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08104880
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _081048A2
	.align 2, 0
_0810487C: .4byte gSharedMem
_08104880:
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	movs r1, 0x18
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _081048A2
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _081048A2
	asrs r0, r6, 17
	strh r0, [r5, 0x1A]
_081048A2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8104860

	thumb_func_start sub_81048A8
sub_81048A8: @ 81048A8
	push {lr}
	bl sub_8104E18
	lsls r0, 24
	cmp r0, 0
	beq _081048C2
	ldr r0, _081048C8 @ =sub_810434C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_081048C2:
	pop {r0}
	bx r0
	.align 2, 0
_081048C8: .4byte sub_810434C
	thumb_func_end sub_81048A8

	thumb_func_start sub_81048CC
sub_81048CC: @ 81048CC
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_81054B8
	bl sub_81056C0
	bl sub_8105804
	bl sub_8105854
	ldr r5, _08104934 @ =gSprites
	ldr r3, _08104938 @ =gSharedMem
	adds r0, r3, 0
	adds r0, 0x4E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r3, 0x3F
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x5
	bl StartSpriteAnimIfDifferent
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	movs r0, 0x4
	strh r0, [r4, 0x10]
	strh r1, [r4, 0x12]
	bl StopMapMusic
	ldr r0, _0810493C @ =0x00000187
	bl PlayFanfare
	movs r0, 0xB2
	bl PlaySE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08104934: .4byte gSprites
_08104938: .4byte gSharedMem
_0810493C: .4byte 0x00000187
	thumb_func_end sub_81048CC

	thumb_func_start sub_8104940
sub_8104940: @ 8104940
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _081049B8 @ =gSpriteCoordOffsetY
	ldrh r1, [r4, 0x10]
	strh r1, [r0]
	ldr r0, _081049BC @ =REG_BG1VOFS
	strh r1, [r0]
	ldrh r1, [r4, 0x12]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810495E
	ldrh r0, [r4, 0x10]
	negs r0, r0
	strh r0, [r4, 0x10]
_0810495E:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	movs r1, 0x1F
	ands r0, r1
	cmp r0, 0
	bne _08104974
	ldrh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 17
	strh r0, [r4, 0x10]
_08104974:
	movs r0, 0x10
	ldrsh r5, [r4, r0]
	cmp r5, 0
	bne _081049B0
	bl sub_81058A0
	bl sub_81058C4
	bl sub_8105284
	bl sub_81059E8
	ldr r2, _081049C0 @ =gSprites
	ldr r0, _081049C4 @ =gSharedMem
	adds r0, 0x4E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	strh r5, [r4, 0x12]
_081049B0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081049B8: .4byte gSpriteCoordOffsetY
_081049BC: .4byte REG_BG1VOFS
_081049C0: .4byte gSprites
_081049C4: .4byte gSharedMem
	thumb_func_end sub_8104940

	thumb_func_start sub_81049C8
sub_81049C8: @ 81049C8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _081049F0 @ =gSpriteCoordOffsetY
	movs r1, 0
	strh r1, [r0]
	ldr r0, _081049F4 @ =REG_BG1VOFS
	strh r1, [r0]
	bl sub_8105ACC
	lsls r0, 24
	cmp r0, 0
	beq _081049EA
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl sub_8105AEC
_081049EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081049F0: .4byte gSpriteCoordOffsetY
_081049F4: .4byte REG_BG1VOFS
	thumb_func_end sub_81049C8

	thumb_func_start sub_81049F8
sub_81049F8: @ 81049F8
	push {lr}
	ldr r0, _08104A30 @ =gSpriteCoordOffsetX
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08104A34 @ =REG_BG1HOFS
	strh r1, [r0]
	ldr r0, _08104A38 @ =gSharedMem
	adds r0, 0x60
	ldrh r0, [r0]
	bl PlayNewMapMusic
	bl sub_810514C
	bl sub_8105554
	bl sub_8105524
	bl sub_81059B8
	ldr r0, _08104A3C @ =sub_810434C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	.align 2, 0
_08104A30: .4byte gSpriteCoordOffsetX
_08104A34: .4byte REG_BG1HOFS
_08104A38: .4byte gSharedMem
_08104A3C: .4byte sub_810434C
	thumb_func_end sub_81049F8

	thumb_func_start sub_8104A40
sub_8104A40: @ 8104A40
	push {r4-r7,lr}
	movs r3, 0x4
	ldr r7, _08104A80 @ =gReelTimeWindowTilemap
	lsls r1, 16
	asrs r5, r1, 16
	lsls r0, 16
	asrs r4, r0, 16
	ldr r6, _08104A84 @ =0x0600e000
_08104A50:
	lsls r2, r3, 16
	asrs r2, 16
	subs r1, r2, 0x4
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r5, r0
	lsls r0, 1
	adds r0, r7
	ldrh r1, [r0]
	lsls r0, r2, 5
	adds r0, r4
	lsls r0, 1
	adds r0, r6
	strh r1, [r0]
	adds r2, 0x1
	lsls r2, 16
	lsrs r3, r2, 16
	asrs r2, 16
	cmp r2, 0xE
	ble _08104A50
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08104A80: .4byte gReelTimeWindowTilemap
_08104A84: .4byte 0x0600e000
	thumb_func_end sub_8104A40

	thumb_func_start sub_8104A88
sub_8104A88: @ 8104A88
	push {r4,r5,lr}
	movs r2, 0x4
	lsls r0, 16
	asrs r3, r0, 16
	ldr r5, _08104AB4 @ =0x0600e000
	movs r4, 0
_08104A94:
	lsls r1, r2, 16
	asrs r1, 16
	lsls r0, r1, 5
	adds r0, r3
	lsls r0, 1
	adds r0, r5
	strh r4, [r0]
	adds r1, 0x1
	lsls r1, 16
	lsrs r2, r1, 16
	asrs r1, 16
	cmp r1, 0xE
	ble _08104A94
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08104AB4: .4byte 0x0600e000
	thumb_func_end sub_8104A88

	thumb_func_start sub_8104AB8
sub_8104AB8: @ 8104AB8
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08104AE4 @ =sub_8104B0C
	adds r0, r5, 0
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08104AE8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	bl _call_via_r5
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08104AE4: .4byte sub_8104B0C
_08104AE8: .4byte gTasks
	thumb_func_end sub_8104AB8

	thumb_func_start sub_8104AEC
sub_8104AEC: @ 8104AEC
	push {lr}
	ldr r0, _08104B00 @ =sub_8104B0C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08104B04
	movs r0, 0
	b _08104B06
	.align 2, 0
_08104B00: .4byte sub_8104B0C
_08104B04:
	movs r0, 0x1
_08104B06:
	pop {r1}
	bx r1
	thumb_func_end sub_8104AEC

	thumb_func_start sub_8104B0C
sub_8104B0C: @ 8104B0C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08104B34 @ =gUnknown_083ECC30
	ldr r2, _08104B38 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08104B34: .4byte gUnknown_083ECC30
_08104B38: .4byte gTasks
	thumb_func_end sub_8104B0C

	thumb_func_start sub_8104B3C
sub_8104B3C: @ 8104B3C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8104B3C

	thumb_func_start sub_8104B60
sub_8104B60: @ 8104B60
	push {lr}
	adds r2, r0, 0
	ldr r0, _08104B7C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08104B76
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_08104B76:
	pop {r0}
	bx r0
	.align 2, 0
_08104B7C: .4byte gPaletteFade
	thumb_func_end sub_8104B60

	thumb_func_start sub_8104B80
sub_8104B80: @ 8104B80
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl sub_8104DA4
	bl sub_81065DC
	ldr r0, _08104BC0 @ =gWindowConfig_81E7144
	bl BasicInitMenuWindow
	ldr r0, _08104BC4 @ =gOtherText_ReelTime
	movs r1, 0xA
	movs r2, 0x20
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104BC0: .4byte gWindowConfig_81E7144
_08104BC4: .4byte gOtherText_ReelTime
	thumb_func_end sub_8104B80

	thumb_func_start sub_8104BC8
sub_8104BC8: @ 8104BC8
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, _08104BF8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	beq _08104BF0
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08104BF0:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104BF8: .4byte gMain
	thumb_func_end sub_8104BC8

	thumb_func_start sub_8104BFC
sub_8104BFC: @ 8104BFC
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl MenuZeroFillScreen
	ldr r0, _08104C3C @ =gWindowConfig_81E7128
	bl BasicInitMenuWindow
	bl sub_81064B8
	ldrb r0, [r4, 0xA]
	bl sub_8104CAC
	ldr r0, _08104C40 @ =gSharedMem
	ldrb r0, [r0, 0x2]
	bl sub_810423C
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104C3C: .4byte gWindowConfig_81E7128
_08104C40: .4byte gSharedMem
	thumb_func_end sub_8104BFC

	thumb_func_start sub_8104C44
sub_8104C44: @ 8104C44
	push {lr}
	ldr r0, _08104C58 @ =sub_8104B0C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	.align 2, 0
_08104C58: .4byte sub_8104B0C
	thumb_func_end sub_8104C44

	thumb_func_start sub_8104C5C
sub_8104C5C: @ 8104C5C
	push {lr}
	ldr r0, _08104C9C @ =sub_8104E74
	movs r1, 0x3
	bl CreateTask
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08104CA0 @ =gSharedMem
	adds r0, 0x3D
	strb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08104CA4 @ =gTasks
	adds r0, r1
	ldr r1, _08104CA8 @ =0x0000ffff
	strh r1, [r0, 0xA]
	movs r1, 0x4
	adds r2, r0, 0
	adds r2, 0x8
	movs r3, 0x40
_08104C86:
	lsls r0, r1, 1
	adds r0, r2, r0
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _08104C86
	pop {r0}
	bx r0
	.align 2, 0
_08104C9C: .4byte sub_8104E74
_08104CA0: .4byte gSharedMem
_08104CA4: .4byte gTasks
_08104CA8: .4byte 0x0000ffff
	thumb_func_end sub_8104C5C

.section .text_8104D30

	thumb_func_start sub_8104D30
sub_8104D30: @ 8104D30
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r8, r1
	ldr r4, [sp, 0x1C]
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08104D84 @ =gSharedMem
	adds r0, 0x3D
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08104D88 @ =gTasks
	adds r0, r1
	mov r12, r0
	movs r5, 0x4
	lsls r4, 16
	asrs r6, r4, 16
	lsls r2, 16
	lsls r3, 16
_08104D5C:
	lsls r0, r5, 1
	mov r1, r12
	adds r1, 0x8
	adds r4, r1, r0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	bne _08104D8C
	str r6, [sp]
	adds r0, r7, 0
	mov r1, r8
	asrs r2, 16
	asrs r3, 16
	bl sub_8105BF8
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	b _08104D96
	.align 2, 0
_08104D84: .4byte gSharedMem
_08104D88: .4byte gTasks
_08104D8C:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _08104D5C
_08104D96:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8104D30

	thumb_func_start sub_8104DA4
sub_8104DA4: @ 8104DA4
	push {r4-r6,lr}
	ldr r0, _08104E04 @ =gSharedMem
	adds r0, 0x3D
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08104E08 @ =gTasks
	adds r4, r0, r1
	ldrh r1, [r4, 0xA]
	ldr r0, _08104E0C @ =0x0000ffff
	cmp r1, r0
	beq _08104DCE
	ldr r0, _08104E10 @ =gUnknown_083ED064
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_08104DCE:
	movs r5, 0x4
	adds r6, r4, 0
	adds r6, 0x8
_08104DD4:
	lsls r0, r5, 1
	adds r4, r6, r0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	beq _08104DF4
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08104E14 @ =gSprites
	adds r0, r1
	bl DestroySprite
	movs r0, 0x40
	strh r0, [r4]
_08104DF4:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _08104DD4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08104E04: .4byte gSharedMem
_08104E08: .4byte gTasks
_08104E0C: .4byte 0x0000ffff
_08104E10: .4byte gUnknown_083ED064
_08104E14: .4byte gSprites
	thumb_func_end sub_8104DA4

	thumb_func_start sub_8104E18
sub_8104E18: @ 8104E18
	push {r4,r5,lr}
	ldr r0, _08104E54 @ =gSharedMem
	adds r0, 0x3D
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08104E58 @ =gTasks
	adds r0, r1
	movs r2, 0x4
	adds r3, r0, 0
	adds r3, 0x8
	ldr r4, _08104E5C @ =gSprites
_08104E32:
	lsls r0, r2, 1
	adds r1, r3, r0
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r0, 0x40
	beq _08104E60
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r5, 0x3C
	ldrsh r0, [r1, r5]
	cmp r0, 0
	beq _08104E60
	movs r0, 0
	b _08104E6C
	.align 2, 0
_08104E54: .4byte gSharedMem
_08104E58: .4byte gTasks
_08104E5C: .4byte gSprites
_08104E60:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _08104E32
	movs r0, 0x1
_08104E6C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8104E18

	thumb_func_start sub_8104E74
sub_8104E74: @ 8104E74
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08104E9C @ =gUnknown_083ECC54
	ldr r2, _08104EA0 @ =gTasks
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08104E9C: .4byte gUnknown_083ECC54
_08104EA0: .4byte gTasks
	thumb_func_end sub_8104E74

	thumb_func_start nullsub_69
nullsub_69: @ 8104EA4
	bx lr
	thumb_func_end nullsub_69

	thumb_func_start sub_8104EA8
sub_8104EA8: @ 8104EA8
	push {r4-r7,lr}
	movs r6, 0
	movs r0, 0x30
_08104EAE:
	movs r4, 0
	lsls r5, r0, 16
	lsls r7, r6, 16
_08104EB4:
	ldr r0, _08104F0C @ =gSpriteTemplate_83ED414
	asrs r1, r5, 16
	movs r2, 0
	movs r3, 0xE
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08104F10 @ =gSprites
	adds r1, r0
	ldrb r0, [r1, 0x5]
	movs r2, 0xC
	orrs r0, r2
	strb r0, [r1, 0x5]
	strh r6, [r1, 0x2E]
	strh r4, [r1, 0x30]
	ldr r0, _08104F14 @ =0x0000ffff
	strh r0, [r1, 0x34]
	lsls r0, r4, 16
	movs r1, 0xC0
	lsls r1, 13
	adds r0, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x77
	ble _08104EB4
	movs r2, 0x80
	lsls r2, 9
	adds r1, r7, r2
	movs r2, 0xA0
	lsls r2, 14
	adds r0, r5, r2
	lsrs r0, 16
	lsrs r6, r1, 16
	asrs r1, 16
	cmp r1, 0x2
	ble _08104EAE
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08104F0C: .4byte gSpriteTemplate_83ED414
_08104F10: .4byte gSprites
_08104F14: .4byte 0x0000ffff
	thumb_func_end sub_8104EA8

	thumb_func_start sub_8104F18
sub_8104F18: @ 8104F18
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08104F88 @ =gSharedMem
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x1C
	adds r1, r0
	ldrh r0, [r5, 0x30]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r5, 0x32]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r1, 0x78
	bl __modsi3
	strh r0, [r5, 0x32]
	movs r2, 0x2E
	ldrsh r1, [r5, r2]
	lsls r1, 1
	adds r4, 0x22
	adds r1, r4
	ldrh r1, [r1]
	adds r1, 0x1C
	adds r0, r1
	strh r0, [r5, 0x22]
	ldrh r4, [r5, 0x2E]
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r1, 0x18
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl sub_8102BA4
	lsls r0, 24
	lsrs r0, 24
	bl GetSpriteTileStartByTag
	adds r1, r5, 0
	adds r1, 0x40
	strh r0, [r1]
	adds r0, r5, 0
	bl SetSpriteSheetFrameTileNum
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08104F88: .4byte gSharedMem
	thumb_func_end sub_8104F18

	thumb_func_start sub_8104F8C
sub_8104F8C: @ 8104F8C
	push {r4-r6,lr}
	movs r4, 0xCB
	movs r5, 0x1
	ldr r6, _08104FF0 @ =0x0000270f
_08104F94:
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r0, r4, 0
	movs r1, 0x17
	movs r2, 0
	adds r3, r5, 0
	bl sub_8104FF4
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 17
	subs r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, r6
	ble _08104F94
	movs r4, 0xEB
	movs r5, 0x1
	ldr r6, _08104FF0 @ =0x0000270f
_08104FC2:
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r0, r4, 0
	movs r1, 0x17
	movs r2, 0x1
	adds r3, r5, 0
	bl sub_8104FF4
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 17
	subs r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, r6
	ble _08104FC2
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08104FF0: .4byte 0x0000270f
	thumb_func_end sub_8104F8C

	thumb_func_start sub_8104FF4
sub_8104FF4: @ 8104FF4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	adds r4, r3, 0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08105060 @ =gSpriteTemplate_83ED42C
	lsls r5, 16
	asrs r5, 16
	lsls r6, 16
	asrs r6, 16
	adds r1, r5, 0
	adds r2, r6, 0
	movs r3, 0xD
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08105064 @ =gSprites
	adds r2, r0
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2, 0x5]
	mov r0, r8
	strh r0, [r2, 0x2E]
	strh r4, [r2, 0x30]
	lsls r4, 16
	asrs r4, 16
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 1
	strh r0, [r2, 0x32]
	ldr r0, _08105068 @ =0x0000ffff
	strh r0, [r2, 0x34]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08105060: .4byte gSpriteTemplate_83ED42C
_08105064: .4byte gSprites
_08105068: .4byte 0x0000ffff
	thumb_func_end sub_8104FF4

	thumb_func_start sub_810506C
sub_810506C: @ 810506C
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _081050C0 @ =gSharedMem
	ldrh r2, [r1, 0xC]
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _0810507E
	ldrh r2, [r1, 0xE]
_0810507E:
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, r2
	beq _081050B8
	strh r2, [r4, 0x34]
	ldrh r1, [r4, 0x32]
	adds r0, r2, 0
	bl __umodsi3
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r1, [r4, 0x30]
	adds r0, r2, 0
	bl __udivsi3
	lsls r0, 16
	movs r3, 0xE0
	lsls r3, 11
	adds r0, r3
	lsrs r2, r0, 16
	adds r0, r2, 0
	bl GetSpriteTileStartByTag
	adds r1, r4, 0
	adds r1, 0x40
	strh r0, [r1]
	adds r0, r4, 0
	bl SetSpriteSheetFrameTileNum
_081050B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081050C0: .4byte gSharedMem
	thumb_func_end sub_810506C

	thumb_func_start sub_81050C4
sub_81050C4: @ 81050C4
	push {lr}
	ldr r0, _081050F4 @ =gSpriteTemplate_83ED444
	movs r1, 0x58
	movs r2, 0x48
	movs r3, 0xF
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _081050F8 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r1, _081050FC @ =gSubspriteTables_83ED704
	bl SetSubspriteTables
	pop {r0}
	bx r0
	.align 2, 0
_081050F4: .4byte gSpriteTemplate_83ED444
_081050F8: .4byte gSprites
_081050FC: .4byte gSubspriteTables_83ED704
	thumb_func_end sub_81050C4

	thumb_func_start sub_8105100
sub_8105100: @ 8105100
	push {lr}
	ldr r0, _08105140 @ =gSpriteTemplate_83ED45C
	movs r1, 0x8C
	lsls r1, 1
	movs r2, 0x50
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08105144 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2, 0x5]
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x2
	orrs r1, r3
	strb r1, [r2]
	ldr r1, _08105148 @ =gSharedMem
	adds r1, 0x3F
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08105140: .4byte gSpriteTemplate_83ED45C
_08105144: .4byte gSprites
_08105148: .4byte gSharedMem
	thumb_func_end sub_8105100

	thumb_func_start sub_810514C
sub_810514C: @ 810514C
	push {lr}
	ldr r0, _08105168 @ =gSharedMem
	adds r0, 0x3F
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0810516C @ =gSprites
	adds r0, r1
	bl DestroySprite
	pop {r0}
	bx r0
	.align 2, 0
_08105168: .4byte gSharedMem
_0810516C: .4byte gSprites
	thumb_func_end sub_810514C

	thumb_func_start sub_8105170
sub_8105170: @ 8105170
	push {lr}
	adds r2, r0, 0
	movs r0, 0
	strh r0, [r2, 0x24]
	strh r0, [r2, 0x26]
	adds r0, r2, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _081051B6
	movs r0, 0x8
	strh r0, [r2, 0x24]
	strh r0, [r2, 0x26]
	adds r0, r2, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0
	beq _081051A4
	adds r0, r2, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r0, 0x3F
	ands r0, r1
	cmp r0, 0
	bne _081051B2
	b _081051B6
_081051A4:
	adds r0, r2, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r0, 0x3F
	ands r0, r1
	cmp r0, 0
	bne _081051B6
_081051B2:
	ldr r0, _081051BC @ =0x0000fff8
	strh r0, [r2, 0x26]
_081051B6:
	pop {r0}
	bx r0
	.align 2, 0
_081051BC: .4byte 0x0000fff8
	thumb_func_end sub_8105170

	thumb_func_start sub_81051C0
sub_81051C0: @ 81051C0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0810526C @ =gSpriteTemplate_83ED474
	movs r7, 0xB8
	lsls r7, 1
	adds r1, r7, 0
	movs r2, 0x34
	movs r3, 0x7
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _08105270 @ =gSprites
	mov r10, r1
	adds r2, r0, r1
	ldrb r1, [r2, 0x5]
	movs r5, 0xD
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	movs r3, 0x4
	mov r9, r3
	mov r1, r9
	orrs r0, r1
	strb r0, [r2, 0x5]
	adds r1, r2, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r3, 0x2
	mov r8, r3
	mov r3, r8
	orrs r0, r3
	strb r0, [r1]
	ldr r1, _08105274 @ =gSubspriteTables_83ED73C
	adds r0, r2, 0
	bl SetSubspriteTables
	ldr r6, _08105278 @ =gSharedMem
	adds r0, r6, 0
	adds r0, 0x49
	strb r4, [r0]
	ldr r0, _0810527C @ =gSpriteTemplate_83ED48C
	adds r1, r7, 0
	movs r2, 0x54
	movs r3, 0x7
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	mov r1, r10
	adds r2, r0, r1
	ldrb r0, [r2, 0x5]
	ands r5, r0
	mov r3, r9
	orrs r5, r3
	strb r5, [r2, 0x5]
	adds r1, r2, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	mov r3, r8
	orrs r0, r3
	strb r0, [r1]
	ldr r1, _08105280 @ =gSubspriteTables_83ED75C
	adds r0, r2, 0
	bl SetSubspriteTables
	adds r6, 0x4A
	strb r4, [r6]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810526C: .4byte gSpriteTemplate_83ED474
_08105270: .4byte gSprites
_08105274: .4byte gSubspriteTables_83ED73C
_08105278: .4byte gSharedMem
_0810527C: .4byte gSpriteTemplate_83ED48C
_08105280: .4byte gSubspriteTables_83ED75C
	thumb_func_end sub_81051C0

	thumb_func_start sub_8105284
sub_8105284: @ 8105284
	push {r4,lr}
	ldr r0, _081052D8 @ =gSpriteTemplate_83ED4A4
	ldr r1, _081052DC @ =gSpriteCoordOffsetX
	ldrh r2, [r1]
	movs r1, 0xA8
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x50
	movs r3, 0x7
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _081052E0 @ =gSprites
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x5]
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _081052E4 @ =gSubspriteTables_83ED78C
	bl SetSubspriteTables
	ldr r0, _081052E8 @ =gSharedMem
	adds r0, 0x42
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081052D8: .4byte gSpriteTemplate_83ED4A4
_081052DC: .4byte gSpriteCoordOffsetX
_081052E0: .4byte gSprites
_081052E4: .4byte gSubspriteTables_83ED78C
_081052E8: .4byte gSharedMem
	thumb_func_end sub_8105284

	thumb_func_start sub_81052EC
sub_81052EC: @ 81052EC
	push {r4-r7,lr}
	movs r4, 0
	movs r5, 0
	ldr r6, _08105350 @ =gSharedMem + 0x4B
_081052F4:
	ldr r0, _08105354 @ =gSpriteTemplate_83ED4BC
	movs r1, 0xB8
	lsls r1, 1
	movs r2, 0
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	ldr r1, _08105358 @ =gSprites
	adds r3, r1
	ldrb r2, [r3, 0x5]
	movs r7, 0xD
	negs r7, r7
	adds r1, r7, 0
	ands r2, r1
	movs r1, 0x4
	orrs r2, r1
	strb r2, [r3, 0x5]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	ldrb r1, [r1]
	movs r2, 0x2
	orrs r1, r2
	mov r2, r12
	strb r1, [r2]
	strh r5, [r3, 0x3C]
	adds r1, r4, r6
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r5, 16
	movs r7, 0xA0
	lsls r7, 13
	adds r0, r7
	lsrs r5, r0, 16
	cmp r4, 0x2
	bls _081052F4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08105350: .4byte gSharedMem + 0x4B
_08105354: .4byte gSpriteTemplate_83ED4BC
_08105358: .4byte gSprites
	thumb_func_end sub_81052EC

	thumb_func_start sub_810535C
sub_810535C: @ 810535C
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0810539C @ =gSharedMem
	ldrh r0, [r4, 0x3C]
	ldrh r1, [r1, 0x14]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x28
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	adds r1, r0, 0
	adds r1, 0x3B
	strh r1, [r4, 0x22]
	movs r1, 0x14
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	bl sub_8102C48
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnimIfDifferent
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810539C: .4byte gSharedMem
	thumb_func_end sub_810535C

	thumb_func_start sub_81053A0
sub_81053A0: @ 81053A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r1, 0xB8
	lsls r1, 1
	ldr r0, _0810544C @ =gSpriteTemplate_83ED4D4
	movs r2, 0x64
	movs r3, 0x9
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r7, _08105450 @ =gSprites
	adds r2, r0, r7
	adds r1, r2, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r3, 0x2
	mov r10, r3
	mov r3, r10
	orrs r0, r3
	strb r0, [r1]
	ldrb r1, [r2, 0x5]
	movs r5, 0xD
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	movs r1, 0x4
	mov r8, r1
	mov r3, r8
	orrs r0, r3
	strb r0, [r2, 0x5]
	ldr r0, _08105454 @ =gSubspriteTables_83ED7B4
	mov r9, r0
	adds r0, r2, 0
	mov r1, r9
	bl SetSubspriteTables
	ldr r6, _08105458 @ =gSharedMem
	adds r0, r6, 0
	adds r0, 0x4E
	strb r4, [r0]
	movs r1, 0x90
	lsls r1, 1
	ldr r0, _0810544C @ =gSpriteTemplate_83ED4D4
	movs r2, 0x68
	movs r3, 0x4
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r2, r0, r7
	adds r1, r2, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	mov r3, r10
	orrs r0, r3
	strb r0, [r1]
	ldrb r0, [r2, 0x5]
	ands r5, r0
	mov r0, r8
	orrs r5, r0
	strb r5, [r2, 0x5]
	adds r0, r2, 0
	mov r1, r9
	bl SetSubspriteTables
	adds r6, 0x4F
	strb r4, [r6]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810544C: .4byte gSpriteTemplate_83ED4D4
_08105450: .4byte gSprites
_08105454: .4byte gSubspriteTables_83ED7B4
_08105458: .4byte gSharedMem
	thumb_func_end sub_81053A0

	thumb_func_start sub_810545C
sub_810545C: @ 810545C
	push {r4,lr}
	ldr r0, _081054A8 @ =gSpriteTemplate_83ED4EC
	movs r1, 0xB8
	lsls r1, 1
	movs r2, 0x4C
	movs r3, 0xB
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _081054AC @ =gSprites
	adds r0, r1
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r1, _081054B0 @ =gSubspriteTables_83ED7D4
	bl SetSubspriteTables
	ldr r0, _081054B4 @ =gSharedMem
	adds r0, 0x40
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081054A8: .4byte gSpriteTemplate_83ED4EC
_081054AC: .4byte gSprites
_081054B0: .4byte gSubspriteTables_83ED7D4
_081054B4: .4byte gSharedMem
	thumb_func_end sub_810545C

	thumb_func_start sub_81054B8
sub_81054B8: @ 81054B8
	push {r4,r5,lr}
	ldr r4, _08105518 @ =gSharedMem
	adds r0, r4, 0
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0810551C @ =gSprites
	adds r0, r1
	bl DestroySprite
	movs r5, 0
	adds r4, 0x49
_081054D4:
	adds r0, r5, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0810551C @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _081054D4
	movs r5, 0
	ldr r4, _08105520 @ =gSharedMem + 0x4B
_081054F4:
	adds r0, r5, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0810551C @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _081054F4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08105518: .4byte gSharedMem
_0810551C: .4byte gSprites
_08105520: .4byte gSharedMem + 0x4B
	thumb_func_end sub_81054B8

	thumb_func_start sub_8105524
sub_8105524: @ 8105524
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0810554C @ =gSharedMem + 0x4E
_0810552A:
	adds r0, r4, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08105550 @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _0810552A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810554C: .4byte gSharedMem + 0x4E
_08105550: .4byte gSprites
	thumb_func_end sub_8105524

	thumb_func_start sub_8105554
sub_8105554: @ 8105554
	push {lr}
	ldr r0, _08105570 @ =gSharedMem
	adds r0, 0x42
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08105574 @ =gSprites
	adds r0, r1
	bl DestroySprite
	pop {r0}
	bx r0
	.align 2, 0
_08105570: .4byte gSharedMem
_08105574: .4byte gSprites
	thumb_func_end sub_8105554

	thumb_func_start sub_8105578
sub_8105578: @ 8105578
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	ldr r0, _0810561C @ =gSpriteTemplate_83ED504
	mov r10, r0
	movs r1, 0x98
	movs r2, 0x20
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r2, _08105620 @ =gSprites
	mov r9, r2
	adds r3, r1, r2
	ldrb r2, [r3, 0x5]
	movs r4, 0xD
	negs r4, r4
	adds r1, r4, 0
	ands r1, r2
	movs r2, 0x4
	mov r8, r2
	mov r2, r8
	orrs r1, r2
	strb r1, [r3, 0x5]
	adds r5, r3, 0
	adds r5, 0x3F
	ldrb r1, [r5]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r5]
	ldr r5, _08105624 @ =gSharedMem
	adds r1, r5, 0
	adds r1, 0x50
	strb r0, [r1]
	movs r0, 0x8
	strh r0, [r3, 0x2E]
	ldr r0, _08105628 @ =0x0000ffff
	strh r0, [r3, 0x30]
	movs r0, 0x1
	negs r0, r0
	strh r0, [r3, 0x32]
	movs r6, 0x20
	strh r6, [r3, 0x3C]
	mov r0, r10
	movs r1, 0xB8
	movs r2, 0x20
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	mov r2, r9
	adds r3, r1, r2
	ldrb r1, [r3, 0x5]
	ands r4, r1
	mov r1, r8
	orrs r4, r1
	strb r4, [r3, 0x5]
	adds r5, 0x51
	strb r0, [r5]
	movs r0, 0x1
	strh r0, [r3, 0x30]
	subs r0, 0x2
	strh r0, [r3, 0x32]
	strh r6, [r3, 0x3C]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810561C: .4byte gSpriteTemplate_83ED504
_08105620: .4byte gSprites
_08105624: .4byte gSharedMem
_08105628: .4byte 0x0000ffff
	thumb_func_end sub_8105578

	thumb_func_start sub_810562C
sub_810562C: @ 810562C
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	movs r1, 0x2E
	ldrsh r4, [r2, r1]
	cmp r4, 0
	beq _08105650
	subs r0, 0x1
	movs r1, 0
	strh r0, [r2, 0x2E]
	strh r1, [r2, 0x24]
	strh r1, [r2, 0x26]
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	b _08105682
_08105650:
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x26]
	adds r0, r1
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x34]
	adds r0, 0x1
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _08105682
	ldrh r0, [r2, 0x3C]
	strh r0, [r2, 0x2E]
	strh r4, [r2, 0x34]
_08105682:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_810562C

	thumb_func_start sub_8105688
sub_8105688: @ 8105688
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _081056B8 @ =gSprites
	ldr r3, _081056BC @ =gSharedMem
	adds r1, r3, 0
	adds r1, 0x50
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r0, [r1, 0x3C]
	adds r3, 0x51
	ldrb r2, [r3]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r0, [r1, 0x3C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081056B8: .4byte gSprites
_081056BC: .4byte gSharedMem
	thumb_func_end sub_8105688

	thumb_func_start sub_81056C0
sub_81056C0: @ 81056C0
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _081056E8 @ =gSharedMem + 0x50
_081056C6:
	adds r0, r4, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081056EC @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _081056C6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081056E8: .4byte gSharedMem + 0x50
_081056EC: .4byte gSprites
	thumb_func_end sub_81056C0

	thumb_func_start sub_81056F0
sub_81056F0: @ 81056F0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	ldr r0, _08105778 @ =gSpriteTemplate_83ED51C
	mov r8, r0
	movs r1, 0x48
	movs r2, 0x50
	movs r3, 0x3
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810577C @ =gSprites
	mov r9, r1
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	add r2, r9
	ldrb r3, [r2, 0x5]
	movs r4, 0xD
	negs r4, r4
	adds r1, r4, 0
	ands r1, r3
	movs r6, 0x4
	orrs r1, r6
	strb r1, [r2, 0x5]
	movs r3, 0
	movs r1, 0x1
	strh r1, [r2, 0x2E]
	strh r3, [r2, 0x38]
	movs r1, 0x10
	strh r1, [r2, 0x3A]
	movs r1, 0x8
	strh r1, [r2, 0x3C]
	ldr r5, _08105780 @ =gSharedMem
	adds r1, r5, 0
	adds r1, 0x52
	strb r0, [r1]
	mov r0, r8
	movs r1, 0x68
	movs r2, 0x50
	movs r3, 0x3
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r9
	ldrb r2, [r1, 0x5]
	ands r4, r2
	orrs r4, r6
	strb r4, [r1, 0x5]
	adds r1, 0x3F
	ldrb r2, [r1]
	movs r3, 0x1
	orrs r2, r3
	strb r2, [r1]
	adds r5, 0x53
	strb r0, [r5]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08105778: .4byte gSpriteTemplate_83ED51C
_0810577C: .4byte gSprites
_08105780: .4byte gSharedMem
	thumb_func_end sub_81056F0

	thumb_func_start sub_8105784
sub_8105784: @ 8105784
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _081057E0 @ =gUnknown_083ECC58
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _081057D6
	ldrh r0, [r4, 0x3A]
	subs r0, 0x1
	strh r0, [r4, 0x3A]
	lsls r0, 16
	cmp r0, 0
	bgt _081057D6
	movs r0, 0x7
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r2, _081057E4 @ =0x01030000
	adds r0, r2
	lsrs r0, 16
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	add r1, sp
	ldrb r3, [r1]
	adds r1, r3, 0
	adds r2, r3, 0
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	movs r1, 0x1
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3C]
	strh r0, [r4, 0x3A]
_081057D6:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081057E0: .4byte gUnknown_083ECC58
_081057E4: .4byte 0x01030000
	thumb_func_end sub_8105784

	thumb_func_start sub_81057E8
sub_81057E8: @ 81057E8
	ldr r3, _081057FC @ =gSprites
	ldr r1, _08105800 @ =gSharedMem
	adds r1, 0x52
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	strh r0, [r1, 0x3C]
	bx lr
	.align 2, 0
_081057FC: .4byte gSprites
_08105800: .4byte gSharedMem
	thumb_func_end sub_81057E8

	thumb_func_start sub_8105804
sub_8105804: @ 8105804
	push {r4,r5,lr}
	movs r0, 0x7
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r1, _08105848 @ =0x01030000
	adds r0, r1
	lsrs r0, 16
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl MultiplyInvertedPaletteRGBComponents
	movs r4, 0
	ldr r5, _0810584C @ =gSharedMem + 0x52
_08105824:
	adds r0, r4, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08105850 @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _08105824
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08105848: .4byte 0x01030000
_0810584C: .4byte gSharedMem + 0x52
_08105850: .4byte gSprites
	thumb_func_end sub_8105804

	thumb_func_start sub_8105854
sub_8105854: @ 8105854
	push {lr}
	ldr r0, _08105888 @ =gSpriteTemplate_83ED534
	movs r1, 0xA8
	movs r2, 0x50
	movs r3, 0x6
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810588C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r3, [r1, 0x5]
	movs r2, 0xD
	negs r2, r2
	ands r2, r3
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r1, 0x5]
	ldr r1, _08105890 @ =gSharedMem
	adds r1, 0x41
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08105888: .4byte gSpriteTemplate_83ED534
_0810588C: .4byte gSprites
_08105890: .4byte gSharedMem
	thumb_func_end sub_8105854

	thumb_func_start sub_8105894
sub_8105894: @ 8105894
	ldr r1, _0810589C @ =gSpriteCoordOffsetY
	ldrh r1, [r1]
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_0810589C: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_8105894

	thumb_func_start sub_81058A0
sub_81058A0: @ 81058A0
	push {lr}
	ldr r0, _081058BC @ =gSharedMem
	adds r0, 0x41
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081058C0 @ =gSprites
	adds r0, r1
	bl DestroySprite
	pop {r0}
	bx r0
	.align 2, 0
_081058BC: .4byte gSharedMem
_081058C0: .4byte gSprites
	thumb_func_end sub_81058A0

	thumb_func_start sub_81058C4
sub_81058C4: @ 81058C4
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r1, _08105938 @ =gUnknown_083ECC5A
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	movs r4, 0
	ldr r5, _0810593C @ =gSharedMem + 0x54
_081058D6:
	ldr r0, _08105940 @ =gSpriteCoordOffsetX
	ldrh r0, [r0]
	movs r1, 0x50
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	ldr r0, _08105944 @ =gSpriteTemplate_83ED54C
	movs r2, 0x44
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	ldr r1, _08105948 @ =gSprites
	adds r3, r1
	ldrb r2, [r3, 0x5]
	movs r6, 0xD
	negs r6, r6
	adds r1, r6, 0
	ands r2, r1
	movs r1, 0x4
	orrs r2, r1
	strb r2, [r3, 0x5]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	ldrb r1, [r1]
	movs r2, 0x2
	orrs r1, r2
	mov r2, r12
	strb r1, [r2]
	lsls r1, r4, 1
	add r1, sp
	ldrh r1, [r1]
	strh r1, [r3, 0x2E]
	adds r1, r4, r5
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _081058D6
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08105938: .4byte gUnknown_083ECC5A
_0810593C: .4byte gSharedMem + 0x54
_08105940: .4byte gSpriteCoordOffsetX
_08105944: .4byte gSpriteTemplate_83ED54C
_08105948: .4byte gSprites
	thumb_func_end sub_81058C4

	thumb_func_start sub_810594C
sub_810594C: @ 810594C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x2E]
	subs r0, 0x2
	movs r4, 0
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	movs r1, 0x14
	bl Cos
	strh r0, [r5, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	movs r1, 0x6
	bl Sin
	strh r0, [r5, 0x26]
	adds r1, r5, 0
	adds r1, 0x43
	strb r4, [r1]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x7F
	ble _08105986
	movs r0, 0x2
	strb r0, [r1]
_08105986:
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _081059B0
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r0, r2, 31
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0
	strh r0, [r5, 0x30]
_081059B0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_810594C

	thumb_func_start sub_81059B8
sub_81059B8: @ 81059B8
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _081059E0 @ =gSharedMem + 0x54
_081059BE:
	adds r0, r4, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081059E4 @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _081059BE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081059E0: .4byte gSharedMem + 0x54
_081059E4: .4byte gSprites
	thumb_func_end sub_81059B8

	thumb_func_start sub_81059E8
sub_81059E8: @ 81059E8
	push {r4,lr}
	ldr r0, _08105A2C @ =gSpriteTemplate_83ED564
	movs r1, 0xA8
	movs r2, 0x3C
	movs r3, 0x8
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _08105A30 @ =gSprites
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldrb r1, [r0, 0x1]
	movs r2, 0x3
	orrs r1, r2
	strb r1, [r0, 0x1]
	bl InitSpriteAffineAnim
	ldr r0, _08105A34 @ =gSharedMem
	adds r0, 0x43
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105A2C: .4byte gSpriteTemplate_83ED564
_08105A30: .4byte gSprites
_08105A34: .4byte gSharedMem
	thumb_func_end sub_81059E8

	thumb_func_start sub_8105A38
sub_8105A38: @ 8105A38
	push {lr}
	adds r3, r0, 0
	ldrh r2, [r3, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _08105A5A
	adds r0, r3, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08105AB4
	adds r0, r2, 0x1
	strh r0, [r3, 0x2E]
	b _08105AB4
_08105A5A:
	cmp r0, 0x1
	bne _08105A96
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x17
	ble _08105AB4
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	movs r0, 0
	strh r0, [r3, 0x32]
	b _08105AB4
_08105A96:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _08105AB4
	movs r0, 0x1
	strh r0, [r3, 0x3C]
_08105AB4:
	ldrh r0, [r3, 0x30]
	movs r1, 0xFF
	ands r1, r0
	adds r1, 0x10
	strh r1, [r3, 0x30]
	lsrs r1, 8
	ldrh r0, [r3, 0x26]
	subs r0, r1
	strh r0, [r3, 0x26]
	pop {r0}
	bx r0
	thumb_func_end sub_8105A38

	thumb_func_start sub_8105ACC
sub_8105ACC: @ 8105ACC
	ldr r2, _08105AE4 @ =gSprites
	ldr r0, _08105AE8 @ =gSharedMem
	adds r0, 0x43
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_08105AE4: .4byte gSprites
_08105AE8: .4byte gSharedMem
	thumb_func_end sub_8105ACC

	thumb_func_start sub_8105AEC
sub_8105AEC: @ 8105AEC
	push {r4,lr}
	ldr r0, _08105B14 @ =gSharedMem
	adds r0, 0x43
	ldrb r0, [r0]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08105B18 @ =gSprites
	adds r4, r0
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105B14: .4byte gSharedMem
_08105B18: .4byte gSprites
	thumb_func_end sub_8105AEC

	thumb_func_start sub_8105B1C
sub_8105B1C: @ 8105B1C
	push {r4,lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _08105B68 @ =gSpriteTemplate_83ED6CC
	lsls r3, 16
	asrs r3, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r3, 0
	movs r3, 0xC
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _08105B6C @ =gSprites
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldrb r1, [r0, 0x1]
	movs r2, 0x3
	orrs r1, r2
	strb r1, [r0, 0x1]
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08105B68: .4byte gSpriteTemplate_83ED6CC
_08105B6C: .4byte gSprites
	thumb_func_end sub_8105B1C

	thumb_func_start sub_8105B70
sub_8105B70: @ 8105B70
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08105B84
	movs r0, 0x1
	strh r0, [r2, 0x3C]
_08105B84:
	pop {r0}
	bx r0
	thumb_func_end sub_8105B70

	thumb_func_start sub_8105B88
sub_8105B88: @ 8105B88
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08105BB0 @ =gSprites
	adds r4, r0
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105BB0: .4byte gSprites
	thumb_func_end sub_8105B88

	thumb_func_start sub_8105BB4
sub_8105BB4: @ 8105BB4
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _08105BF0 @ =gUnknown_083ECF0C
	lsrs r1, 22
	adds r3, r1, r3
	ldr r5, [r3]
	ldr r3, _08105BF4 @ =gUnknown_083ECE7E
	adds r4, r1, r3
	movs r6, 0
	ldrsh r4, [r4, r6]
	adds r3, 0x2
	adds r1, r3
	movs r6, 0
	ldrsh r3, [r1, r6]
	lsls r2, 16
	asrs r2, 16
	str r2, [sp]
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8105BF8
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08105BF0: .4byte gUnknown_083ECF0C
_08105BF4: .4byte gUnknown_083ECE7E
	thumb_func_end sub_8105BB4

	thumb_func_start sub_8105BF8
sub_8105BF8: @ 8105BF8
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	adds r1, r2, 0
	adds r2, r3, 0
	ldr r5, [sp, 0x14]
	lsls r4, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _08105C58 @ =gUnknown_083EDB5C
	lsrs r4, 22
	adds r0, r4, r0
	ldr r0, [r0]
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x10
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	adds r7, r0, 0
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	ldr r1, _08105C5C @ =gSprites
	adds r2, r0, r1
	ldrb r0, [r2, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r2, 0x5]
	str r6, [r2, 0x1C]
	strh r5, [r2, 0x3A]
	movs r0, 0x1
	strh r0, [r2, 0x3C]
	ldr r0, _08105C60 @ =gUnknown_083EDBC4
	adds r4, r0
	ldr r1, [r4]
	cmp r1, 0
	beq _08105C50
	adds r0, r2, 0
	bl SetSubspriteTables
_08105C50:
	adds r0, r7, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08105C58: .4byte gUnknown_083EDB5C
_08105C5C: .4byte gSprites
_08105C60: .4byte gUnknown_083EDBC4
	thumb_func_end sub_8105BF8

	thumb_func_start sub_8105C64
sub_8105C64: @ 8105C64
	movs r1, 0
	strh r1, [r0, 0x3C]
	bx lr
	thumb_func_end sub_8105C64

	thumb_func_start sub_8105C6C
sub_8105C6C: @ 8105C6C
	push {r4,r5,lr}
	sub sp, 0x10
	adds r4, r0, 0
	ldr r1, _08105CE8 @ =gUnknown_083ECC62
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	add r5, sp, 0x8
	ldr r1, _08105CEC @ =gUnknown_083ECC6A
	adds r0, r5, 0
	movs r2, 0x8
	bl memcpy
	ldrh r0, [r4, 0x30]
	adds r1, r0, 0x1
	strh r1, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _08105CB2
	adds r3, r4, 0
	adds r3, 0x42
	ldrb r2, [r3]
	lsls r0, r2, 26
	lsrs r0, 26
	movs r1, 0x1
	eors r1, r0
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0
	strh r0, [r4, 0x30]
_08105CB2:
	movs r0, 0
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x42
	ldrb r1, [r0]
	movs r0, 0x3F
	ands r0, r1
	cmp r0, 0
	beq _08105CDE
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	lsls r0, 1
	adds r0, r5, r0
	ldrh r0, [r0]
	strh r0, [r4, 0x26]
_08105CDE:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08105CE8: .4byte gUnknown_083ECC62
_08105CEC: .4byte gUnknown_083ECC6A
	thumb_func_end sub_8105C6C

	thumb_func_start sub_8105CF0
sub_8105CF0: @ 8105CF0
	push {lr}
	adds r3, r0, 0
	adds r3, 0x3F
	ldrb r1, [r3]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r3]
	bl sub_8105C6C
	pop {r0}
	bx r0
	thumb_func_end sub_8105CF0

	thumb_func_start sub_8105D08
sub_8105D08: @ 8105D08
	push {lr}
	adds r3, r0, 0
	adds r3, 0x3F
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	bl sub_8105C6C
	pop {r0}
	bx r0
	thumb_func_end sub_8105D08

	thumb_func_start sub_8105D20
sub_8105D20: @ 8105D20
	push {lr}
	adds r3, r0, 0
	adds r3, 0x3F
	ldrb r1, [r3]
	movs r2, 0x1
	orrs r1, r2
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	bl sub_8105C6C
	pop {r0}
	bx r0
	thumb_func_end sub_8105D20

	thumb_func_start sub_8105D3C
sub_8105D3C: @ 8105D3C
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _08105D70
	cmp r0, 0x1
	bgt _08105D52
	cmp r0, 0
	beq _08105D5C
	b _08105DA0
_08105D52:
	cmp r0, 0x2
	beq _08105D80
	cmp r0, 0x3
	beq _08105D9C
	b _08105DA0
_08105D5C:
	ldrh r0, [r2, 0x20]
	adds r0, 0x4
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xCF
	ble _08105DA0
	movs r0, 0xD0
	strh r0, [r2, 0x20]
	b _08105D8E
_08105D70:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5A
	ble _08105DA0
	b _08105D8E
_08105D80:
	ldrh r0, [r2, 0x20]
	adds r0, 0x4
	strh r0, [r2, 0x20]
	lsls r0, 16
	ldr r1, _08105D98 @ =0x010f0000
	cmp r0, r1
	ble _08105DA0
_08105D8E:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	b _08105DA0
	.align 2, 0
_08105D98: .4byte 0x010f0000
_08105D9C:
	movs r0, 0
	strh r0, [r2, 0x3C]
_08105DA0:
	pop {r0}
	bx r0
	thumb_func_end sub_8105D3C

	thumb_func_start sub_8105DA4
sub_8105DA4: @ 8105DA4
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _08105DD8
	cmp r0, 0x1
	bgt _08105DBA
	cmp r0, 0
	beq _08105DC4
	b _08105E02
_08105DBA:
	cmp r0, 0x2
	beq _08105DE8
	cmp r0, 0x3
	beq _08105DFE
	b _08105E02
_08105DC4:
	ldrh r0, [r1, 0x20]
	subs r0, 0x4
	strh r0, [r1, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD0
	bgt _08105E02
	movs r0, 0xD0
	strh r0, [r1, 0x20]
	b _08105DF6
_08105DD8:
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5A
	ble _08105E02
	b _08105DF6
_08105DE8:
	ldrh r0, [r1, 0x20]
	subs r0, 0x4
	strh r0, [r1, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x90
	bgt _08105E02
_08105DF6:
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	b _08105E02
_08105DFE:
	movs r0, 0
	strh r0, [r1, 0x3C]
_08105E02:
	pop {r0}
	bx r0
	thumb_func_end sub_8105DA4

	thumb_func_start sub_8105E08
sub_8105E08: @ 8105E08
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bhi _08105EAE
	lsls r0, 2
	ldr r1, _08105E20 @ =_08105E24
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08105E20: .4byte _08105E24
	.align 2, 0
_08105E24:
	.4byte _08105E3C
	.4byte _08105E52
	.4byte _08105E70
	.4byte _08105E84
	.4byte _08105E94
	.4byte _08105EAA
_08105E3C:
	ldr r0, _08105E6C @ =gSharedMem
	ldrb r1, [r0, 0xA]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_08105E52:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _08105EAE
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0
	strh r0, [r4, 0x30]
	b _08105EAE
	.align 2, 0
_08105E6C: .4byte gSharedMem
_08105E70:
	ldrh r0, [r4, 0x20]
	adds r0, 0x4
	strh r0, [r4, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xCF
	ble _08105EAE
	movs r0, 0xD0
	strh r0, [r4, 0x20]
	b _08105EA2
_08105E84:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5A
	ble _08105EAE
	b _08105EA2
_08105E94:
	ldrh r0, [r4, 0x20]
	adds r0, 0x4
	strh r0, [r4, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF7
	ble _08105EAE
_08105EA2:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _08105EAE
_08105EAA:
	movs r0, 0
	strh r0, [r4, 0x3C]
_08105EAE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8105E08

	thumb_func_start sub_8105EB4
sub_8105EB4: @ 8105EB4
	push {lr}
	adds r3, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	beq _08105EE2
	cmp r0, 0x1
	bgt _08105ECA
	cmp r0, 0
	beq _08105ED0
	b _08105F50
_08105ECA:
	cmp r0, 0x2
	beq _08105F00
	b _08105F50
_08105ED0:
	adds r2, r3, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
_08105EE2:
	ldrh r0, [r3, 0x22]
	adds r0, 0x8
	strh r0, [r3, 0x22]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6F
	ble _08105F50
	movs r0, 0x70
	strh r0, [r3, 0x22]
	movs r0, 0x10
	strh r0, [r3, 0x30]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	b _08105F50
_08105F00:
	movs r0, 0x32
	ldrsh r2, [r3, r0]
	cmp r2, 0
	bne _08105F46
	ldrh r0, [r3, 0x22]
	ldrh r1, [r3, 0x30]
	subs r0, r1
	strh r0, [r3, 0x22]
	negs r1, r1
	strh r1, [r3, 0x30]
	ldrh r0, [r3, 0x34]
	adds r0, 0x1
	strh r0, [r3, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _08105F46
	lsls r0, r1, 16
	asrs r0, 18
	strh r0, [r3, 0x30]
	strh r2, [r3, 0x34]
	adds r1, r0, 0
	cmp r1, 0
	bne _08105F46
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	strh r1, [r3, 0x3C]
	adds r2, r3, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_08105F46:
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	movs r1, 0x7
	ands r0, r1
	strh r0, [r3, 0x32]
_08105F50:
	pop {r0}
	bx r0
	thumb_func_end sub_8105EB4

	thumb_func_start sub_8105F54
sub_8105F54: @ 8105F54
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _08105F66
	cmp r0, 0x1
	beq _08105F7C
	b _08105F98
_08105F66:
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _08105F98
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	b _08105F98
_08105F7C:
	ldrh r0, [r1, 0x22]
	adds r0, 0x2
	strh r0, [r1, 0x22]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2F
	ble _08105F98
	movs r0, 0x30
	strh r0, [r1, 0x22]
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	movs r0, 0
	strh r0, [r1, 0x3C]
_08105F98:
	pop {r0}
	bx r0
	thumb_func_end sub_8105F54

	thumb_func_start sub_8105F9C
sub_8105F9C: @ 8105F9C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08105FAE
	cmp r0, 0x1
	beq _08106000
	b _0810604E
_08105FAE:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x20
	ble _0810604E
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x5
	strh r0, [r4, 0x30]
	ldrb r0, [r4, 0x1]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r2, _08105FFC @ =REG_MOSAIC
	ldrh r1, [r4, 0x30]
	lsls r0, r1, 4
	orrs r0, r1
	lsls r0, 8
	strh r0, [r2]
	b _0810604E
	.align 2, 0
_08105FFC: .4byte REG_MOSAIC
_08106000:
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r4, 0x30]
	subs r0, r1
	strh r0, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bge _08106016
	movs r0, 0
	strh r0, [r4, 0x30]
_08106016:
	ldr r2, _08106054 @ =REG_MOSAIC
	ldrh r1, [r4, 0x30]
	lsls r0, r1, 4
	orrs r0, r1
	lsls r0, 8
	strh r0, [r2]
	ldrh r1, [r4, 0x32]
	movs r0, 0xFF
	ands r0, r1
	adds r0, 0x80
	strh r0, [r4, 0x32]
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	cmp r1, 0
	bne _0810604E
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_0810604E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08106054: .4byte REG_MOSAIC
	thumb_func_end sub_8105F9C

	thumb_func_start sub_8106058
sub_8106058: @ 8106058
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0x2
	bgt _081060A8
	ldr r1, _081060A4 @ =gUnknown_083EDE10
	lsls r0, 2
	adds r0, r1
	ldr r4, [r0]
	movs r0, 0x6
	bl IndexOfSpritePaletteTag
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 4
	movs r0, 0x80
	lsls r0, 17
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _081060E4
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	movs r0, 0
	strh r0, [r5, 0x32]
	b _081060E4
	.align 2, 0
_081060A4: .4byte gUnknown_083EDE10
_081060A8:
	ldr r1, _081060F8 @ =gUnknown_083EDE10
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	lsls r0, 2
	adds r0, r1
	ldr r4, [r0]
	movs r0, 0x6
	bl IndexOfSpritePaletteTag
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 4
	movs r0, 0x80
	lsls r0, 17
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x18
	ble _081060E4
	strh r1, [r5, 0x30]
	strh r1, [r5, 0x32]
_081060E4:
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnimIfDifferent
	movs r0, 0
	strh r0, [r5, 0x3C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081060F8: .4byte gUnknown_083EDE10
	thumb_func_end sub_8106058

	thumb_func_start sub_81060FC
sub_81060FC: @ 81060FC
	push {r4-r6,lr}
	sub sp, 0x30
	adds r4, r0, 0
	ldr r1, _08106138 @ =gUnknown_083ECC72
	mov r0, sp
	movs r2, 0x10
	bl memcpy
	add r6, sp, 0x10
	ldr r1, _0810613C @ =gUnknown_083ECC82
	adds r0, r6, 0
	movs r2, 0x10
	bl memcpy
	add r5, sp, 0x20
	ldr r1, _08106140 @ =gUnknown_083ECC92
	adds r0, r5, 0
	movs r2, 0x10
	bl memcpy
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08106174
	cmp r0, 0x1
	bgt _08106144
	cmp r0, 0
	beq _0810614A
	b _081061C0
	.align 2, 0
_08106138: .4byte gUnknown_083ECC72
_0810613C: .4byte gUnknown_083ECC82
_08106140: .4byte gUnknown_083ECC92
_08106144:
	cmp r0, 0x2
	beq _08106188
	b _081061C0
_0810614A:
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	lsls r0, 1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r4, 0x26]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r5, r0
	ldrh r0, [r0]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_08106174:
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _081061C0
	b _081061BA
_08106188:
	ldrh r0, [r4, 0x24]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	cmp r1, 0
	ble _08106196
	subs r0, 0x4
	b _0810619C
_08106196:
	cmp r1, 0
	bge _0810619E
	adds r0, 0x4
_0810619C:
	strh r0, [r4, 0x24]
_0810619E:
	ldrh r0, [r4, 0x26]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	cmp r1, 0
	ble _081061AC
	subs r0, 0x4
	b _081061B2
_081061AC:
	cmp r1, 0
	bge _081061B4
	adds r0, 0x4
_081061B2:
	strh r0, [r4, 0x26]
_081061B4:
	ldr r0, [r4, 0x24]
	cmp r0, 0
	bne _081061C0
_081061BA:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_081061C0:
	add sp, 0x30
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_81060FC

	thumb_func_start sub_81061C8
sub_81061C8: @ 81061C8
	push {r4,lr}
	sub sp, 0x10
	adds r4, r0, 0
	ldr r1, _0810622C @ =gUnknown_083ECCA2
	mov r0, sp
	movs r2, 0x10
	bl memcpy
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _081061EA
	adds r0, r1, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0xC
	strh r0, [r4, 0x30]
_081061EA:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08106224
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
_08106224:
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810622C: .4byte gUnknown_083ECCA2
	thumb_func_end sub_81061C8

	thumb_func_start sub_8106230
sub_8106230: @ 8106230
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _0810627A
	cmp r0, 0x1
	bgt _08106248
	cmp r0, 0
	beq _08106252
	b _0810634A
_08106248:
	cmp r0, 0x2
	beq _081062C4
	cmp r0, 0x3
	beq _081062FC
	b _0810634A
_08106252:
	ldr r2, _081062BC @ =gSharedMem
	adds r1, r2, 0
	adds r1, 0x5C
	movs r0, 0x2F
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x3F
	strh r0, [r1]
	subs r1, 0x4
	ldr r0, _081062C0 @ =0x00002088
	strh r0, [r1]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_0810627A:
	ldrh r0, [r5, 0x30]
	adds r2, r0, 0x2
	strh r2, [r5, 0x30]
	adds r0, 0xB2
	strh r0, [r5, 0x32]
	movs r1, 0xF0
	subs r1, r2
	strh r1, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD0
	ble _08106296
	movs r0, 0xD0
	strh r0, [r5, 0x32]
_08106296:
	movs r1, 0x34
	ldrsh r0, [r5, r1]
	cmp r0, 0xCF
	bgt _081062A2
	movs r0, 0xD0
	strh r0, [r5, 0x34]
_081062A2:
	ldr r2, _081062BC @ =gSharedMem
	ldrh r0, [r5, 0x32]
	lsls r0, 8
	ldrh r1, [r5, 0x34]
	orrs r0, r1
	adds r1, r2, 0
	adds r1, 0x58
	strh r0, [r1]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0x33
	ble _0810634A
	b _0810633C
	.align 2, 0
_081062BC: .4byte gSharedMem
_081062C0: .4byte 0x00002088
_081062C4:
	ldr r6, _08106354 @ =gSharedMem
	movs r1, 0x12
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _0810634A
	ldr r1, _08106358 @ =SpriteCallbackDummy
	movs r4, 0
	str r4, [sp]
	movs r0, 0x5
	movs r2, 0xD0
	movs r3, 0x74
	bl sub_8104D30
	adds r1, r6, 0
	adds r1, 0x58
	ldr r0, _0810635C @ =0x0000c0e0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0xD1
	lsls r0, 7
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x2F
	strh r0, [r1]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	strh r4, [r5, 0x30]
_081062FC:
	ldrh r0, [r5, 0x30]
	adds r2, r0, 0x2
	strh r2, [r5, 0x30]
	adds r0, 0xC2
	strh r0, [r5, 0x32]
	movs r1, 0xE0
	subs r1, r2
	strh r1, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD0
	ble _08106318
	movs r0, 0xD0
	strh r0, [r5, 0x32]
_08106318:
	movs r1, 0x34
	ldrsh r0, [r5, r1]
	cmp r0, 0xCF
	bgt _08106324
	movs r0, 0xD0
	strh r0, [r5, 0x34]
_08106324:
	ldr r2, _08106354 @ =gSharedMem
	ldrh r0, [r5, 0x32]
	lsls r0, 8
	ldrh r1, [r5, 0x34]
	orrs r0, r1
	adds r1, r2, 0
	adds r1, 0x58
	strh r0, [r1]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0xF
	ble _0810634A
_0810633C:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r1, r2, 0
	adds r1, 0x5C
	movs r0, 0x3F
	strh r0, [r1]
_0810634A:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08106354: .4byte gSharedMem
_08106358: .4byte SpriteCallbackDummy
_0810635C: .4byte 0x0000c0e0
	thumb_func_end sub_8106230

	thumb_func_start nullsub_70
nullsub_70: @ 8106360
	bx lr
	thumb_func_end nullsub_70

	thumb_func_start sub_8106364
sub_8106364: @ 8106364
	ldr r1, _0810636C @ =REG_MOSAIC
	movs r0, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0810636C: .4byte REG_MOSAIC
	thumb_func_end sub_8106364

	thumb_func_start sub_8106370
sub_8106370: @ 8106370
	push {r4,lr}
	ldr r0, _08106398 @ =gUnknown_083EDE20
	ldr r4, [r0]
	movs r0, 0x6
	bl IndexOfSpritePaletteTag
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 4
	movs r0, 0x80
	lsls r0, 17
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08106398: .4byte gUnknown_083EDE20
	thumb_func_end sub_8106370

	thumb_func_start sub_810639C
sub_810639C: @ 810639C
	ldr r2, _081063BC @ =gSharedMem
	adds r1, r2, 0
	adds r1, 0x58
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0xA0
	strh r0, [r1]
	adds r0, r2, 0
	adds r0, 0x5C
	movs r1, 0x3F
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	.align 2, 0
_081063BC: .4byte gSharedMem
	thumb_func_end sub_810639C

	thumb_func_start sub_81063C0
sub_81063C0: @ 81063C0
	push {r4,lr}
	bl sub_8106404
	ldr r0, _081063F0 @ =gSlotMachineReelTimeLights_Gfx
	ldr r4, _081063F4 @ =gSharedMem + 0x10000
	adds r1, r4, 0
	bl LZDecompressWram
	ldr r0, _081063F8 @ =gUnknown_083EDE8C
	movs r1, 0xC8
	lsls r1, 6
	adds r4, r1
	adds r1, r4, 0
	bl LZDecompressWram
	ldr r0, _081063FC @ =gUnknown_083EDC2C
	bl LoadSpriteSheets
	ldr r0, _08106400 @ =gSlotMachineSpritePalettes
	bl LoadSpritePalettes
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081063F0: .4byte gSlotMachineReelTimeLights_Gfx
_081063F4: .4byte gSharedMem + 0x10000
_081063F8: .4byte gUnknown_083EDE8C
_081063FC: .4byte gUnknown_083EDC2C
_08106400: .4byte gSlotMachineSpritePalettes
	thumb_func_end sub_81063C0

	thumb_func_start sub_8106404
sub_8106404: @ 8106404
	push {r4,r5,lr}
	ldr r3, _0810643C @ =gSharedMem + 0x10000
	movs r2, 0
	ldr r5, _08106440 @ =gUnknown_083EDCDC
	ldr r0, _08106444 @ =gUnknown_083EDCE4
	ldr r4, [r0]
_08106410:
	movs r1, 0
	adds r2, 0x1
_08106414:
	adds r0, r4, r1
	ldrb r0, [r0]
	strb r0, [r3]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	adds r3, 0x1
	cmp r1, 0x1F
	bls _08106414
	lsls r0, r2, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _08106410
	adds r0, r5, 0
	bl LoadSpriteSheet
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810643C: .4byte gSharedMem + 0x10000
_08106440: .4byte gUnknown_083EDCDC
_08106444: .4byte gUnknown_083EDCE4
	thumb_func_end sub_8106404

	.align 2, 0 @ Don't pad with nop.
