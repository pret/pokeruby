	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F9FDC
sub_80F9FDC: @ 80F9FDC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	mov r8, r0
	adds r5, r1, 0
	adds r4, r2, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r0, 0xD
	str r0, [sp, 0x8]
	mov r0, r8
	ldr r1, [sp, 0x8]
	bl GetMonData
	mov r1, sp
	adds r1, 0x2
	str r1, [sp, 0x14]
	strh r0, [r1]
	adds r3, r4, 0
	adds r3, 0xD
	str r3, [sp, 0xC]
	mov r0, r8
	adds r1, r3, 0
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r7, r5, 0
	adds r7, 0x11
	str r7, [sp, 0x10]
	mov r0, r8
	adds r1, r7, 0
	bl GetMonData
	mov r1, sp
	adds r1, 0x5
	str r1, [sp, 0x18]
	strb r0, [r1]
	adds r3, r4, 0
	adds r3, 0x11
	str r3, [sp, 0x1C]
	mov r0, r8
	adds r1, r3, 0
	bl GetMonData
	add r7, sp, 0x4
	mov r10, r7
	strb r0, [r7]
	mov r0, r8
	movs r1, 0x15
	bl GetMonData
	mov r6, sp
	adds r6, 0x6
	strb r0, [r6]
	ldr r1, _080FA0D8 @ =gUnknown_08208238
	adds r0, r5, r1
	ldrb r0, [r0]
	mov r9, r0
	ldrb r0, [r6]
	adds r2, r0, 0
	mov r3, r9
	ands r2, r3
	lsls r5, 1
	asrs r2, r5
	lsls r2, 24
	lsrs r2, 24
	adds r1, r4, r1
	ldrb r3, [r1]
	adds r1, r0, 0
	ands r1, r3
	lsls r4, 1
	asrs r1, r4
	lsls r1, 24
	lsrs r1, 24
	mov r7, r9
	bics r0, r7
	strb r0, [r6]
	ldrb r0, [r6]
	bics r0, r3
	strb r0, [r6]
	lsls r2, r4
	lsls r1, r5
	adds r2, r1
	ldrb r0, [r6]
	orrs r0, r2
	strb r0, [r6]
	mov r0, r8
	ldr r1, [sp, 0x8]
	mov r2, sp
	bl SetMonData
	mov r0, r8
	ldr r1, [sp, 0xC]
	ldr r2, [sp, 0x14]
	bl SetMonData
	mov r0, r8
	ldr r1, [sp, 0x10]
	mov r2, r10
	bl SetMonData
	mov r0, r8
	ldr r1, [sp, 0x1C]
	ldr r2, [sp, 0x18]
	bl SetMonData
	mov r0, r8
	movs r1, 0x15
	adds r2, r6, 0
	bl SetMonData
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FA0D8: .4byte gUnknown_08208238
	thumb_func_end sub_80F9FDC

	thumb_func_start sub_80FA0DC
sub_80FA0DC: @ 80FA0DC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _080FA13C @ =gSpecialVar_0x8004
	mov r8, r0
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080FA140 @ =gPlayerParty
	adds r0, r5
	ldr r4, _080FA144 @ =gSpecialVar_0x8005
	ldrb r2, [r4]
	movs r1, 0
	bl SetMonMoveSlot
	mov r1, r8
	ldrh r0, [r1]
	muls r0, r6
	adds r0, r5
	ldrb r1, [r4]
	bl RemoveMonPPBonus
	ldrh r4, [r4]
	cmp r4, 0x2
	bhi _080FA130
_080FA10E:
	ldr r0, _080FA13C @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080FA140 @ =gPlayerParty
	adds r0, r1
	lsls r1, r4, 24
	lsrs r1, 24
	adds r4, 0x1
	lsls r2, r4, 24
	lsrs r2, 24
	bl sub_80F9FDC
	lsls r4, 16
	lsrs r4, 16
	cmp r4, 0x2
	bls _080FA10E
_080FA130:
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FA13C: .4byte gSpecialVar_0x8004
_080FA140: .4byte gPlayerParty
_080FA144: .4byte gSpecialVar_0x8005
	thumb_func_end sub_80FA0DC

	thumb_func_start sub_80FA148
sub_80FA148: @ 80FA148
	push {r4,lr}
	ldr r0, _080FA170 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080FA174 @ =gPlayerParty
	adds r0, r1
	ldr r4, _080FA178 @ =gScriptResult
	movs r1, 0
	strh r1, [r4]
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _080FA16A
	movs r0, 0x1
	strh r0, [r4]
_080FA16A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA170: .4byte gSpecialVar_0x8004
_080FA174: .4byte gPlayerParty
_080FA178: .4byte gScriptResult
	thumb_func_end sub_80FA148

	.align 2, 0 @ Don't pad with nop.
