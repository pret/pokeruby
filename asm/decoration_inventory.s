	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text
	
	thumb_func_start sub_8133F4C
sub_8133F4C: @ 8133F4C
	push {r4,r5,lr}
	lsls r0, 24
	movs r3, 0
	ldr r1, _08133F7C @ =gDecorationInventories
	lsrs r2, r0, 21
	adds r0, r2, r1
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcs _08133F76
	adds r5, r1, 0
	movs r4, 0
_08133F62:
	adds r0, r2, r5
	ldr r1, [r0]
	adds r1, r3
	strb r4, [r1]
	adds r1, r3, 0x1
	lsls r1, 24
	lsrs r3, r1, 24
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcc _08133F62
_08133F76:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08133F7C: .4byte gDecorationInventories
	thumb_func_end sub_8133F4C

	thumb_func_start sub_8133F80
sub_8133F80: @ 8133F80
	push {r4,lr}
	movs r4, 0
_08133F84:
	adds r0, r4, 0
	bl sub_8133F4C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08133F84
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8133F80

	thumb_func_start sub_8133F9C
sub_8133F9C: @ 8133F9C
	push {r4,lr}
	lsls r0, 24
	movs r2, 0
	ldr r1, _08133FC8 @ =gDecorationInventories
	lsrs r0, 21
	adds r0, r1
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	cmp r2, r1
	bge _08133FD8
	adds r4, r0, 0
	adds r3, r1, 0
_08133FB4:
	lsls r0, r2, 24
	asrs r1, r0, 24
	ldr r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08133FCC
	adds r0, r1, 0
	b _08133FDC
	.align 2, 0
_08133FC8: .4byte gDecorationInventories
_08133FCC:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, r3
	blt _08133FB4
_08133FD8:
	movs r0, 0x1
	negs r0, r0
_08133FDC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8133F9C

	thumb_func_start sub_8133FE4
sub_8133FE4: @ 8133FE4
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _08134010 @ =gDecorations
	lsls r0, r3, 5
	adds r0, r1
	ldrb r0, [r0, 0x13]
	movs r2, 0
	ldr r1, _08134014 @ =gDecorationInventories
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x4]
	cmp r2, r1
	bcs _08134022
	ldr r4, [r0]
_08134002:
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, r3
	bne _08134018
	movs r0, 0x1
	b _08134024
	.align 2, 0
_08134010: .4byte gDecorations
_08134014: .4byte gDecorationInventories
_08134018:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r1
	bcc _08134002
_08134022:
	movs r0, 0
_08134024:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8133FE4

	thumb_func_start IsThereStorageSpaceForDecoration
IsThereStorageSpaceForDecoration: @ 813402C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	cmp r4, 0
	beq _0813406C
	ldr r1, _08134064 @ =gDecorations
	lsls r0, r4, 5
	adds r0, r1
	ldrb r5, [r0, 0x13]
	adds r0, r5, 0
	bl sub_8133F9C
	lsls r0, 24
	asrs r2, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _0813406C
	ldr r0, _08134068 @ =gDecorationInventories
	lsls r1, r5, 3
	adds r1, r0
	ldr r0, [r1]
	adds r0, r2
	strb r4, [r0]
	movs r0, 0x1
	b _0813406E
	.align 2, 0
_08134064: .4byte gDecorations
_08134068: .4byte gDecorationInventories
_0813406C:
	movs r0, 0
_0813406E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end IsThereStorageSpaceForDecoration

	thumb_func_start sub_8134074
sub_8134074: @ 8134074
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _081340A0
	ldr r1, _0813409C @ =gDecorations
	lsls r0, 5
	adds r0, r1
	ldrb r0, [r0, 0x13]
	bl sub_8133F9C
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _081340A0
	movs r0, 0x1
	b _081340A2
	.align 2, 0
_0813409C: .4byte gDecorations
_081340A0:
	movs r0, 0
_081340A2:
	pop {r1}
	bx r1
	thumb_func_end sub_8134074

	thumb_func_start sub_81340A8
sub_81340A8: @ 81340A8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0
	cmp r5, 0
	bne _081340C4
	b _081340F2
_081340B6:
	movs r0, 0
	strb r0, [r1]
	adds r0, r6, 0
	bl sub_8134104
	movs r0, 0x1
	b _081340F4
_081340C4:
	ldr r2, _081340FC @ =gDecorationInventories
	ldr r1, _08134100 @ =gDecorations
	lsls r0, r5, 5
	adds r0, r1
	ldrb r4, [r0, 0x13]
	lsls r0, r4, 3
	adds r0, r2
	ldrb r1, [r0, 0x4]
	cmp r3, r1
	bcs _081340F2
	adds r6, r4, 0
	adds r4, r0, 0
	adds r2, r1, 0
_081340DE:
	ldr r0, [r4]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, r5
	beq _081340B6
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, r2
	bcc _081340DE
_081340F2:
	movs r0, 0
_081340F4:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081340FC: .4byte gDecorationInventories
_08134100: .4byte gDecorations
	thumb_func_end sub_81340A8

	thumb_func_start sub_8134104
sub_8134104: @ 8134104
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	movs r6, 0
	ldr r2, _08134190 @ =gDecorationInventories
	lsrs r1, r0, 21
	adds r0, r1, r2
	ldrb r0, [r0, 0x4]
	cmp r6, r0
	bcs _08134180
	adds r7, r1, 0
	mov r8, r0
	str r0, [sp]
_08134126:
	adds r1, r6, 0x1
	lsls r0, r1, 24
	lsrs r3, r0, 24
	adds r2, r7, 0
	mov r12, r1
	cmp r3, r8
	bcs _08134174
	ldr r1, _08134190 @ =gDecorationInventories
	mov r10, r1
	adds r0, r1, 0
	mov r9, r0
_0813413C:
	mov r1, r10
	adds r5, r2, r1
	ldr r1, [r5]
	adds r0, r1, r3
	ldrb r4, [r0]
	adds r2, r4, 0
	cmp r2, 0
	beq _08134162
	adds r0, r1, r6
	ldrb r1, [r0]
	cmp r1, 0
	beq _08134158
	cmp r1, r2
	bls _08134162
_08134158:
	ldrb r1, [r0]
	strb r4, [r0]
	ldr r0, [r5]
	adds r0, r3
	strb r1, [r0]
_08134162:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r2, r7, 0
	mov r1, r9
	adds r0, r2, r1
	ldrb r0, [r0, 0x4]
	cmp r3, r0
	bcc _0813413C
_08134174:
	mov r1, r12
	lsls r0, r1, 24
	lsrs r6, r0, 24
	ldr r0, [sp]
	cmp r6, r0
	bcc _08134126
_08134180:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08134190: .4byte gDecorationInventories
	thumb_func_end sub_8134104

	thumb_func_start sub_8134194
sub_8134194: @ 8134194
	push {r4,r5,lr}
	lsls r0, 24
	movs r4, 0
	movs r3, 0
	ldr r2, _081341D0 @ =gDecorationInventories
	lsrs r1, r0, 21
	adds r0, r1, r2
	ldrb r0, [r0, 0x4]
	cmp r4, r0
	bcs _081341C8
	adds r5, r2, 0
_081341AA:
	adds r2, r1, r5
	ldr r0, [r2]
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, 0
	beq _081341BC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_081341BC:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r2, [r2, 0x4]
	cmp r3, r2
	bcc _081341AA
_081341C8:
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081341D0: .4byte gDecorationInventories
	thumb_func_end sub_8134194

	thumb_func_start sub_81341D4
sub_81341D4: @ 81341D4
	push {r4,r5,lr}
	movs r5, 0
	movs r4, 0
_081341DA:
	adds r0, r4, 0
	bl sub_8134194
	adds r0, r5, r0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _081341DA
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_81341D4

	.align 2, 0 @ Don't pad with nop.
