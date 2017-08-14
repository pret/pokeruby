	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text




	thumb_func_start sub_8148710
sub_8148710: @ 8148710
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r1, _081487A4 @ =gUnknown_03005FA0
	ldrh r2, [r1, 0x1A]
	ldrh r0, [r1, 0x14]
	subs r2, r0
	ldrh r3, [r1, 0x1C]
	ldrh r0, [r1, 0x16]
	subs r3, r0
	adds r6, r1, 0
	ldr r1, _081487A8 @ =0x0201d000
	mov r9, r1
	lsls r2, 16
	asrs r2, 16
	mov r8, r2
	movs r2, 0x80
	lsls r2, 3
	add r2, r9
	mov r10, r2
	lsls r3, 16
	asrs r7, r3, 16
_08148746:
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bge _08148750
	negs r0, r0
_08148750:
	lsls r0, 16
	lsrs r0, 16
	ldrh r2, [r6, 0x6]
	adds r0, r2
	lsls r5, r0, 16
	strh r0, [r6, 0x6]
	ldrh r2, [r6, 0x4]
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bge _0814876A
	movs r0, 0x1
	str r0, [sp]
_0814876A:
	ldrh r0, [r6, 0x18]
	ldrh r1, [r6, 0x8]
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r1, 0
	beq _081487F0
	ldr r1, [sp]
	cmp r1, 0
	bne _081487AC
	movs r1, 0
	ldrsh r0, [r6, r1]
	lsrs r5, 24
	adds r1, r2, r5
	lsls r1, 16
	asrs r1, 16
	bl Sin
	lsls r4, 1
	mov r2, r9
	adds r1, r4, r2
	add r0, r8
	strh r0, [r1]
	movs r1, 0
	ldrsh r0, [r6, r1]
	ldrh r1, [r6, 0x6]
	adds r1, r5
	b _081487CE
	.align 2, 0
_081487A4: .4byte gUnknown_03005FA0
_081487A8: .4byte 0x0201d000
_081487AC:
	movs r1, 0
	ldrsh r0, [r6, r1]
	lsrs r5, 24
	subs r1, r2, r5
	lsls r1, 16
	asrs r1, 16
	bl Sin
	lsls r4, 1
	mov r2, r9
	adds r1, r4, r2
	add r0, r8
	strh r0, [r1]
	movs r1, 0
	ldrsh r0, [r6, r1]
	ldrh r1, [r6, 0x6]
	subs r1, r5
_081487CE:
	lsls r1, 16
	asrs r1, 16
	bl Cos
	add r4, r10
	adds r0, r7, r0
	strh r0, [r4]
	ldrh r0, [r6, 0x2]
	ldrh r2, [r6]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r6]
	ldrh r0, [r6, 0x8]
	subs r0, 0x1
	strh r0, [r6, 0x8]
	b _08148746
_081487F0:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8148710

	.align 2, 0 @ Don't pad with nop.
