	.include "constants/gba_constants.inc"

	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8124E7C
sub_8124E7C: @ 8124E7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	ldr r0, [sp, 0x24]
	ldr r4, [sp, 0x28]
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	lsls r3, 24
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r4, 24
	lsrs r4, 24
	mov r8, r4
	movs r0, 0
	lsrs r4, r3, 24
	cmp r0, r8
	bcs _08124EF6
_08124EAE:
	ldr r2, [sp]
	movs r3, 0
	adds r6, r4, 0x1
	adds r0, 0x1
	mov r12, r0
	cmp r3, r7
	bcs _08124EE0
	lsls r5, r4, 6
_08124EBE:
	lsls r0, r2, 1
	adds r0, r5
	add r0, r10
	mov r1, r9
	strh r1, [r0]
	adds r1, r2, 0x1
	adds r0, r1, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r1, r0
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r7
	bcc _08124EBE
_08124EE0:
	adds r0, r6, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r6, r0
	lsls r0, 24
	lsrs r4, r0, 24
	mov r1, r12
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, r8
	bcc _08124EAE
_08124EF6:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124E7C

	thumb_func_start sub_8124F08
sub_8124F08: @ 8124F08
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	ldr r0, [sp, 0x24]
	ldr r4, [sp, 0x28]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	lsls r3, 24
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r4, 24
	lsrs r4, 24
	mov r9, r4
	movs r0, 0
	adds r5, r1, 0
	lsrs r4, r3, 24
	cmp r0, r9
	bcs _08124F82
_08124F38:
	ldr r2, [sp]
	movs r3, 0
	adds r7, r4, 0x1
	adds r0, 0x1
	mov r8, r0
	cmp r3, r12
	bcs _08124F6C
	lsls r6, r4, 6
_08124F48:
	lsls r0, r2, 1
	adds r0, r6
	add r0, r10
	ldrh r1, [r5]
	strh r1, [r0]
	adds r5, 0x2
	adds r1, r2, 0x1
	adds r0, r1, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r1, r0
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r12
	bcc _08124F48
_08124F6C:
	adds r0, r7, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r7, r0
	lsls r0, 24
	lsrs r4, r0, 24
	mov r1, r8
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, r9
	bcc _08124F38
_08124F82:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8124F08

	.align 2, 0 @ Don't pad with nop.
