	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_813D158
sub_813D158: @ 813D158
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _0813D1CC @ =gSprites
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r3, 0x3C
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0813D1D4
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r0, r3
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnim
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x30]
	movs r0, 0x3
	ands r0, r1
	lsls r0, 3
	strh r0, [r4, 0x34]
	ldr r0, _0813D1D0 @ =sub_813D0CC
	str r0, [r4, 0x1C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x2
	bl CalcCenterToCornerVec
	b _0813D200
	.align 2, 0
_0813D1CC: .4byte gSprites
_0813D1D0: .4byte sub_813D0CC
_0813D1D4:
	ldrh r0, [r1, 0x24]
	strh r0, [r4, 0x24]
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x26]
	strh r0, [r4, 0x26]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x20]
	strh r0, [r4, 0x20]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x22]
_0813D200:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813D158

	thumb_func_start sub_813D208
sub_813D208: @ 813D208
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0813D218
	ldr r0, _0813D21C @ =sub_813D220
	str r0, [r1, 0x1C]
_0813D218:
	pop {r0}
	bx r0
	.align 2, 0
_0813D21C: .4byte sub_813D220
	thumb_func_end sub_813D208

	thumb_func_start sub_813D220
sub_813D220: @ 813D220
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r0, 0
	ldrh r4, [r7, 0x20]
	movs r1, 0x20
	ldrsh r0, [r7, r1]
	cmp r0, 0x74
	bgt _0813D260
	ldrh r0, [r7, 0x26]
	ldrh r1, [r7, 0x22]
	adds r0, r1
	movs r1, 0
	strh r0, [r7, 0x22]
	strh r1, [r7, 0x26]
	adds r0, r4, 0x4
	strh r0, [r7, 0x20]
	ldr r0, _0813D258 @ =0x0000fffc
	strh r0, [r7, 0x24]
	movs r0, 0x80
	strh r0, [r7, 0x36]
	ldr r0, _0813D25C @ =sub_813D368
	str r0, [r7, 0x1C]
	b _0813D352
	.align 2, 0
_0813D258: .4byte 0x0000fffc
_0813D25C: .4byte sub_813D368
_0813D260:
	ldrh r1, [r7, 0x36]
	ldr r5, _0813D364 @ =gSineTable
	lsls r0, r1, 24
	lsrs r0, 23
	adds r0, r5
	ldrh r2, [r0]
	adds r0, r1, 0
	adds r0, 0x40
	lsls r0, 24
	lsrs r0, 23
	adds r0, r5
	ldrh r3, [r0]
	adds r1, 0x2
	strh r1, [r7, 0x36]
	lsls r2, 16
	asrs r0, r2, 16
	cmp r0, 0
	bge _0813D286
	adds r0, 0x1F
_0813D286:
	asrs r0, 5
	strh r0, [r7, 0x26]
	subs r0, r4, 0x1
	strh r0, [r7, 0x20]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813D29C
	ldrh r0, [r7, 0x22]
	adds r0, 0x1
	strh r0, [r7, 0x22]
_0813D29C:
	lsls r0, r3, 16
	asrs r0, 16
	negs r0, r0
	cmp r0, 0
	bge _0813D2A8
	adds r0, 0xF
_0813D2A8:
	lsls r1, r0, 12
	lsrs r1, 16
	ldrh r4, [r7, 0x32]
	ldrh r3, [r7, 0x34]
	adds r0, r1, 0
	subs r0, 0x10
	lsls r0, 24
	lsrs r0, 23
	adds r0, r5
	ldrh r2, [r0]
	adds r1, 0x30
	lsls r1, 24
	lsrs r1, 23
	adds r1, r5
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r1, 0
	muls r0, r4
	cmp r0, 0
	bge _0813D2D2
	adds r0, 0xFF
_0813D2D2:
	lsls r0, 8
	lsrs r0, 16
	mov r8, r0
	lsls r0, r2, 16
	asrs r2, r0, 16
	negs r0, r2
	muls r0, r3
	cmp r0, 0
	bge _0813D2E6
	adds r0, 0xFF
_0813D2E6:
	lsls r0, 8
	lsrs r0, 16
	mov r10, r0
	adds r0, r2, 0
	muls r0, r4
	cmp r0, 0
	bge _0813D2F6
	adds r0, 0xFF
_0813D2F6:
	lsls r0, 8
	lsrs r5, r0, 16
	adds r0, r1, 0
	muls r0, r3
	cmp r0, 0
	bge _0813D304
	adds r0, 0xFF
_0813D304:
	lsls r6, r0, 8
	lsrs r6, 16
	ldrh r0, [r7, 0x30]
	lsls r0, 24
	lsrs r0, 24
	str r3, [sp]
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldrh r0, [r7, 0x30]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r5
	mov r1, r10
	lsls r5, r1, 16
	lsrs r3, r5, 16
	lsls r4, r6, 16
	str r6, [sp]
	mov r1, r8
	mov r2, r9
	bl SetOamMatrix
	ldrh r0, [r7, 0x30]
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	lsls r5, 1
	lsrs r5, 16
	lsls r4, 1
	lsrs r4, 16
	str r4, [sp]
	mov r1, r8
	mov r2, r9
	adds r3, r5, 0
	bl SetOamMatrix
_0813D352:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813D364: .4byte gSineTable
	thumb_func_end sub_813D220

	thumb_func_start sub_813D368
sub_813D368: @ 813D368
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x3A]
	adds r1, 0x40
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x3A]
	adds r1, 0x40
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldrh r0, [r4, 0x30]
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x3A]
	adds r1, 0x40
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldrh r1, [r4, 0x36]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r0, 0x40
	beq _0813D400
	adds r0, r1, 0
	subs r0, 0x8
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x36]
	adds r1, r0, 0
	ldr r2, _0813D3FC @ =gSineTable
	adds r0, 0x40
	lsls r0, 24
	lsrs r0, 23
	adds r0, r2
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bge _0813D3E2
	adds r0, 0x3F
_0813D3E2:
	asrs r0, 6
	strh r0, [r4, 0x24]
	lsls r0, r1, 24
	lsrs r0, 23
	adds r0, r2
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0813D3F6
	adds r0, 0x3F
_0813D3F6:
	asrs r0, 6
	strh r0, [r4, 0x26]
	b _0813D408
	.align 2, 0
_0813D3FC: .4byte gSineTable
_0813D400:
	movs r0, 0
	strh r0, [r4, 0x36]
	ldr r0, _0813D410 @ =sub_813D414
	str r0, [r4, 0x1C]
_0813D408:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813D410: .4byte sub_813D414
	thumb_func_end sub_813D368

	thumb_func_start sub_813D414
sub_813D414: @ 813D414
	push {r4,lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x2
	beq _0813D474
	ldrh r0, [r1, 0x36]
	adds r0, 0x8
	strh r0, [r1, 0x36]
	ldr r3, _0813D470 @ =gSineTable
	lsls r0, 24
	lsrs r0, 23
	adds r0, r3
	movs r4, 0
	ldrsh r0, [r0, r4]
	cmp r0, 0
	bge _0813D438
	adds r0, 0xF
_0813D438:
	asrs r0, 4
	adds r0, 0x40
	lsls r0, 16
	lsrs r2, r0, 16
	adds r0, r2, 0
	adds r0, 0x40
	lsls r0, 24
	lsrs r0, 23
	adds r0, r3
	movs r4, 0
	ldrsh r0, [r0, r4]
	cmp r0, 0
	bge _0813D454
	adds r0, 0x3F
_0813D454:
	asrs r0, 6
	strh r0, [r1, 0x24]
	lsls r0, r2, 24
	lsrs r0, 23
	adds r0, r3
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bge _0813D468
	adds r0, 0x3F
_0813D468:
	asrs r0, 6
	strh r0, [r1, 0x26]
	b _0813D478
	.align 2, 0
_0813D470: .4byte gSineTable
_0813D474:
	ldr r0, _0813D480 @ =sub_813D484
	str r0, [r1, 0x1C]
_0813D478:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813D480: .4byte sub_813D484
	thumb_func_end sub_813D414

	thumb_func_start sub_813D484
sub_813D484: @ 813D484
	push {r4,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x22]
	movs r0, 0x22
	ldrsh r1, [r4, r0]
	movs r3, 0x38
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _0813D49C
	adds r0, r2, 0x4
	strh r0, [r4, 0x22]
	b _0813D4F8
_0813D49C:
	movs r0, 0x1
	strh r0, [r4, 0x3C]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r0, r3
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnim
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x30]
	movs r0, 0x3
	ands r0, r1
	lsls r0, 3
	strh r0, [r4, 0x34]
	ldr r0, _0813D500 @ =sub_813D0CC
	str r0, [r4, 0x1C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x2
	bl CalcCenterToCornerVec
_0813D4F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813D500: .4byte sub_813D0CC
	thumb_func_end sub_813D484

	thumb_func_start sub_813D504
sub_813D504: @ 813D504
	push {r4,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x22]
	movs r0, 0x22
	ldrsh r1, [r4, r0]
	movs r3, 0x38
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _0813D51C
	adds r0, r2, 0x4
	strh r0, [r4, 0x22]
	b _0813D578
_0813D51C:
	movs r0, 0x1
	strh r0, [r4, 0x3C]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r0, r3
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnim
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x30]
	movs r0, 0x3
	ands r0, r1
	lsls r0, 3
	strh r0, [r4, 0x34]
	ldr r0, _0813D580 @ =sub_813D0CC
	str r0, [r4, 0x1C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x2
	bl CalcCenterToCornerVec
_0813D578:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813D580: .4byte sub_813D0CC
	thumb_func_end sub_813D504

	thumb_func_start sub_813D584
sub_813D584: @ 813D584
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r6, [sp, 0x34]
	ldr r0, [sp, 0x38]
	mov r8, r0
	lsls r4, 16
	lsls r5, 16
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0x8]
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0xC]
	lsls r6, 16
	lsrs r6, 16
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	ldr r0, _0813D640 @ =gSpriteTemplate_840AE20
	lsrs r2, r4, 16
	mov r10, r2
	asrs r4, 16
	lsrs r1, r5, 16
	str r1, [sp, 0x4]
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _0813D644 @ =gSprites
	mov r9, r2
	lsls r0, r7, 4
	adds r0, r7
	lsls r5, r0, 2
	adds r4, r5, r2
	movs r0, 0
	strh r0, [r4, 0x2E]
	strh r0, [r4, 0x3C]
	mov r0, sp
	ldrh r0, [r0, 0xC]
	strh r0, [r4, 0x30]
	mov r1, sp
	ldrh r1, [r1, 0x8]
	strh r1, [r4, 0x32]
	mov r2, sp
	ldrh r2, [r2, 0x8]
	strh r2, [r4, 0x34]
	strh r6, [r4, 0x38]
	mov r0, sp
	ldrh r0, [r0, 0x8]
	strh r0, [r4, 0x3A]
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x1F
	ldr r1, [sp, 0xC]
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x2
	bl CalcCenterToCornerVec
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	mov r1, r8
	cmp r1, 0
	bne _0813D64C
	mov r0, r9
	adds r0, 0x1C
	adds r0, r5, r0
	ldr r1, _0813D648 @ =sub_813D208
	b _0813D654
	.align 2, 0
_0813D640: .4byte gSpriteTemplate_840AE20
_0813D644: .4byte gSprites
_0813D648: .4byte sub_813D208
_0813D64C:
	mov r0, r9
	adds r0, 0x1C
	adds r0, r5, r0
	ldr r1, _0813D774 @ =sub_813D504
_0813D654:
	str r1, [r0]
	str r7, [sp, 0x10]
	mov r2, r10
	lsls r2, 16
	asrs r2, 16
	mov r10, r2
	ldr r0, [sp, 0x4]
	lsls r0, 16
	asrs r0, 16
	mov r8, r0
	ldr r0, _0813D778 @ =gSpriteTemplate_840AE20
	mov r1, r10
	mov r2, r8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r5, _0813D77C @ =gSprites
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	adds r0, r4, r5
	mov r1, sp
	ldrh r1, [r1, 0x10]
	strh r1, [r0, 0x3C]
	ldr r2, [sp, 0xC]
	adds r2, 0x1
	mov r9, r2
	strh r2, [r0, 0x30]
	ldrb r1, [r0, 0x1]
	movs r2, 0x3
	orrs r1, r2
	strb r1, [r0, 0x1]
	mov r2, r9
	movs r1, 0x1F
	ands r2, r1
	lsls r2, 1
	ldrb r3, [r0, 0x3]
	movs r6, 0x3F
	negs r6, r6
	adds r1, r6, 0
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x3]
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x2
	bl CalcCenterToCornerVec
	ldr r2, _0813D780 @ =gSprites + 0x1C
	adds r4, r2
	ldr r0, _0813D784 @ =sub_813D158
	str r0, [r4]
	ldr r0, _0813D778 @ =gSpriteTemplate_840AE20
	mov r1, r10
	mov r2, r8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r4, r7, 4
	adds r4, r7
	lsls r4, 2
	adds r5, r4, r5
	mov r1, sp
	ldrh r1, [r1, 0x10]
	strh r1, [r5, 0x3C]
	ldr r2, [sp, 0xC]
	adds r2, 0x2
	mov r8, r2
	strh r2, [r5, 0x30]
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrb r0, [r5, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r5, 0x1]
	mov r0, r8
	movs r2, 0x1F
	ands r0, r2
	lsls r0, 1
	ldrb r1, [r5, 0x3]
	ands r6, r1
	orrs r6, r0
	strb r6, [r5, 0x3]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x2
	movs r3, 0x2
	bl CalcCenterToCornerVec
	ldr r0, _0813D780 @ =gSprites + 0x1C
	adds r4, r0
	ldr r1, _0813D784 @ =sub_813D158
	str r1, [r4]
	ldr r2, [sp, 0xC]
	lsls r0, r2, 24
	lsrs r0, 24
	ldr r5, [sp, 0x8]
	adds r5, 0x20
	lsls r4, r5, 16
	lsrs r4, 16
	str r4, [sp]
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	str r4, [sp]
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r5, 17
	lsrs r5, 16
	str r5, [sp]
	mov r0, r8
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldr r0, [sp, 0x10]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0813D774: .4byte sub_813D504
_0813D778: .4byte gSpriteTemplate_840AE20
_0813D77C: .4byte gSprites
_0813D780: .4byte gSprites + 0x1C
_0813D784: .4byte sub_813D158
	thumb_func_end sub_813D584

	thumb_func_start sub_813D788
sub_813D788: @ 813D788
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bhi _0813D830
	lsls r0, 2
	ldr r1, _0813D7A0 @ =_0813D7A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813D7A0: .4byte _0813D7A4
	.align 2, 0
_0813D7A4:
	.4byte _0813D7B8
	.4byte _0813D7C6
	.4byte _0813D7E4
	.4byte _0813D80C
	.4byte _0813D816
_0813D7B8:
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	ldrh r0, [r4, 0x20]
	subs r0, 0x1
	b _0813D82E
_0813D7C6:
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	ldr r0, _0813D7E0 @ =gIntroFrameCounter
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0813D87A
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	b _0813D82E
	.align 2, 0
_0813D7E0: .4byte gIntroFrameCounter
_0813D7E4:
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnimIfDifferent
	ldrh r2, [r4, 0x20]
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	cmp r0, 0x78
	ble _0813D802
	ldr r0, _0813D808 @ =gIntroFrameCounter
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _0813D83C
_0813D802:
	adds r0, r2, 0x1
	b _0813D82E
	.align 2, 0
_0813D808: .4byte gIntroFrameCounter
_0813D80C:
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnimIfDifferent
	b _0813D830
_0813D816:
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	ldrh r2, [r4, 0x20]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r0, 0x20
	negs r0, r0
	cmp r1, r0
	ble _0813D830
	subs r0, r2, 0x2
_0813D82E:
	strh r0, [r4, 0x20]
_0813D830:
	ldr r0, _0813D84C @ =gIntroFrameCounter
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0813D87A
_0813D83C:
	movs r1, 0x26
	ldrsh r5, [r4, r1]
	cmp r5, 0
	beq _0813D850
	movs r0, 0
	strh r0, [r4, 0x26]
	b _0813D87A
	.align 2, 0
_0813D84C: .4byte gIntroFrameCounter
_0813D850:
	bl Random
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0x1
	beq _0813D878
	cmp r1, 0x1
	bgt _0813D866
	cmp r1, 0
	beq _0813D86E
	b _0813D87A
_0813D866:
	cmp r1, 0x3
	bgt _0813D87A
	strh r5, [r4, 0x26]
	b _0813D87A
_0813D86E:
	ldr r0, _0813D874 @ =0x0000ffff
	strh r0, [r4, 0x26]
	b _0813D87A
	.align 2, 0
_0813D874: .4byte 0x0000ffff
_0813D878:
	strh r1, [r4, 0x26]
_0813D87A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813D788

	thumb_func_start sub_813D880
sub_813D880: @ 813D880
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0813D89A
	cmp r0, 0x1
	ble _0813D8E2
	cmp r0, 0x2
	beq _0813D8BA
	cmp r0, 0x3
	beq _0813D8D4
	b _0813D8E2
_0813D89A:
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	movs r2, 0x20
	ldrsh r1, [r4, r2]
	adds r0, r1
	ldr r1, _0813D8B0 @ =0x0000012f
	cmp r0, r1
	bgt _0813D8B4
	ldrh r0, [r4, 0x24]
	adds r0, 0x8
	b _0813D8E0
	.align 2, 0
_0813D8B0: .4byte 0x0000012f
_0813D8B4:
	movs r0, 0x2
	strh r0, [r4, 0x2E]
	b _0813D8E2
_0813D8BA:
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	movs r2, 0x20
	ldrsh r1, [r4, r2]
	adds r0, r1
	cmp r0, 0x78
	ble _0813D8CE
	ldrh r0, [r4, 0x24]
	subs r0, 0x1
	b _0813D8E0
_0813D8CE:
	movs r0, 0x3
	strh r0, [r4, 0x2E]
	b _0813D8E2
_0813D8D4:
	ldrh r1, [r4, 0x24]
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _0813D8E2
	subs r0, r1, 0x2
_0813D8E0:
	strh r0, [r4, 0x24]
_0813D8E2:
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x8
	bl Sin
	ldr r1, _0813D904 @ =gUnknown_0203935A
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x4
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813D904: .4byte gUnknown_0203935A
	thumb_func_end sub_813D880

	thumb_func_start sub_813D908
sub_813D908: @ 813D908
	push {lr}
	adds r3, r0, 0
	ldr r2, _0813D930 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0813D934
	adds r0, r3, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0813D94E
	.align 2, 0
_0813D930: .4byte gTasks
_0813D934:
	cmp r0, 0x4
	beq _0813D948
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	b _0813D94E
_0813D948:
	adds r0, r3, 0
	bl DestroySprite
_0813D94E:
	pop {r0}
	bx r0
	thumb_func_end sub_813D908

	thumb_func_start sub_813D954
sub_813D954: @ 813D954
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	movs r5, 0
	ldr r7, _0813DA48 @ =gUnknown_0840AF50
	lsls r0, 16
	mov r9, r0
	lsls r0, r6, 16
	str r0, [sp, 0x4]
	mov r1, r9
	asrs r1, 16
	str r1, [sp]
_0813D97C:
	lsls r4, r5, 2
	adds r0, r7, 0x2
	adds r0, r4, r0
	ldrh r1, [r0]
	ldr r2, [sp]
	adds r1, r2, r1
	lsls r1, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r3, r2, 16
	mov r10, r3
	ldr r0, _0813DA4C @ =0xfffc0000
	adds r2, r0
	ldr r0, _0813DA50 @ =gSpriteTemplate_840AF94
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0813DA54 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	mov r1, r8
	strh r1, [r0, 0x2E]
	adds r4, r7
	ldrb r1, [r4]
	bl StartSpriteAnim
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x8
	bls _0813D97C
	movs r5, 0
	ldr r7, _0813DA58 @ =gUnknown_0840AF74
	mov r0, r10
	adds r0, 0xC
	lsls r0, 16
	mov r10, r0
_0813D9D0:
	lsls r4, r5, 2
	adds r0, r7, 0x2
	adds r0, r4, r0
	mov r2, r9
	asrs r1, r2, 16
	ldrh r0, [r0]
	adds r1, r0
	lsls r1, 16
	asrs r1, 16
	ldr r0, _0813DA5C @ =gSpriteTemplate_840AFAC
	mov r3, r10
	asrs r2, r3, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r6, _0813DA54 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r6
	mov r1, r8
	strh r1, [r0, 0x2E]
	adds r4, r7
	ldrb r1, [r4]
	bl StartSpriteAnim
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x7
	bls _0813D9D0
	ldr r0, _0813DA60 @ =gSpriteTemplate_840AFC4
	ldr r3, [sp, 0x4]
	ldr r1, _0813DA4C @ =0xfffc0000
	adds r2, r3, r1
	asrs r2, 16
	movs r1, 0x78
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r6
	mov r3, r8
	strh r3, [r0, 0x2E]
	adds r0, r2, 0
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0813DA48: .4byte gUnknown_0840AF50
_0813DA4C: .4byte 0xfffc0000
_0813DA50: .4byte gSpriteTemplate_840AF94
_0813DA54: .4byte gSprites
_0813DA58: .4byte gUnknown_0840AF74
_0813DA5C: .4byte gSpriteTemplate_840AFAC
_0813DA60: .4byte gSpriteTemplate_840AFC4
	thumb_func_end sub_813D954

	thumb_func_start sub_813DA64
sub_813DA64: @ 813DA64
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0813DA7C
	cmp r0, 0x1
	beq _0813DAC0
_0813DA7C:
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x80
	strh r0, [r4, 0x30]
	ldr r0, _0813DABC @ =0x0000ffe8
	strh r0, [r4, 0x32]
	movs r0, 0
	b _0813DB92
	.align 2, 0
_0813DABC: .4byte 0x0000ffe8
_0813DAC0:
	ldrh r1, [r4, 0x34]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0x4F
	bgt _0813DAF8
	lsls r0, r1, 24
	lsrs r0, 24
	movs r1, 0x78
	bl Sin
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x34]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x8C
	bl Sin
	negs r0, r0
	strh r0, [r4, 0x24]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	ble _0813DAF8
	ldrb r0, [r4, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r4, 0x5]
_0813DAF8:
	ldr r2, _0813DB60 @ =gSineTable
	ldrh r1, [r4, 0x32]
	lsls r0, r1, 24
	lsrs r0, 23
	adds r0, r2
	ldrh r3, [r0]
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 23
	adds r1, r2
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r1, 0x30
	ldrsh r2, [r4, r1]
	adds r1, r0, 0
	muls r1, r2
	adds r0, r1, 0
	cmp r1, 0
	bge _0813DB20
	adds r0, 0xFF
_0813DB20:
	lsls r0, 8
	lsrs r6, r0, 16
	lsls r0, r3, 16
	asrs r3, r0, 16
	negs r0, r3
	muls r0, r2
	cmp r0, 0
	bge _0813DB32
	adds r0, 0xFF
_0813DB32:
	lsls r0, 8
	lsrs r5, r0, 16
	adds r0, r3, 0
	muls r0, r2
	cmp r0, 0
	bge _0813DB40
	adds r0, 0xFF
_0813DB40:
	lsls r0, 8
	lsrs r2, r0, 16
	adds r1, r6, 0
	adds r3, r5, 0
	str r1, [sp]
	movs r0, 0x1
	bl SetOamMatrix
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0xFF
	bgt _0813DB64
	adds r0, r1, 0
	adds r0, 0x8
	b _0813DB68
	.align 2, 0
_0813DB60: .4byte gSineTable
_0813DB64:
	adds r0, r1, 0
	adds r0, 0x20
_0813DB68:
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0x17
	bgt _0813DB78
	adds r0, r1, 0x1
	strh r0, [r4, 0x32]
_0813DB78:
	ldrh r2, [r4, 0x34]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x3F
	bgt _0813DB86
	adds r0, r2, 0x2
	b _0813DB92
_0813DB86:
	ldrh r1, [r4, 0x3C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0813DB94
	adds r0, r2, 0x1
_0813DB92:
	strh r0, [r4, 0x34]
_0813DB94:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_813DA64

	thumb_func_start sub_813DB9C
sub_813DB9C: @ 813DB9C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bhi _0813DBCC
	lsls r0, 2
	ldr r1, _0813DBB4 @ =_0813DBB8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813DBB4: .4byte _0813DBB8
	.align 2, 0
_0813DBB8:
	.4byte _0813DBCC
	.4byte _0813DBF2
	.4byte _0813DC24
	.4byte _0813DC3E
	.4byte _0813DCAA
_0813DBCC:
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0813DBE0
	adds r2, r4, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	b _0813DBEC
_0813DBE0:
	adds r2, r4, 0
	adds r2, 0x3F
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
_0813DBEC:
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r4, 0x2E]
_0813DBF2:
	ldrh r1, [r4, 0x22]
	movs r3, 0x22
	ldrsh r0, [r4, r3]
	cmp r0, 0x60
	ble _0813DC18
	subs r0, r1, 0x4
	strh r0, [r4, 0x22]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0813DC10
	ldrh r0, [r4, 0x20]
	adds r0, 0x2
	strh r0, [r4, 0x20]
	b _0813DD4E
_0813DC10:
	ldrh r0, [r4, 0x20]
	subs r0, 0x2
	strh r0, [r4, 0x20]
	b _0813DD4E
_0813DC18:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x8
	strh r0, [r4, 0x34]
	b _0813DD4E
_0813DC24:
	ldrh r0, [r4, 0x34]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	cmp r1, 0
	beq _0813DC34
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _0813DD4E
_0813DC34:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x34]
	b _0813DD4E
_0813DC3E:
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r3, 0x30
	ldrsh r1, [r4, r3]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0813DC8A
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xFF
	lsls r1, 8
	movs r2, 0x80
	lsls r2, 1
	str r2, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	b _0813DC9E
_0813DC8A:
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 1
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
_0813DC9E:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x36]
	b _0813DD4E
_0813DCAA:
	ldrh r0, [r4, 0x36]
	adds r2, r0, 0x1
	strh r2, [r4, 0x36]
	movs r3, 0x22
	ldrsh r0, [r4, r3]
	movs r3, 0x26
	ldrsh r1, [r4, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	ble _0813DD48
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r3, 0x24
	ldrsh r1, [r4, r3]
	adds r0, r1
	movs r1, 0x40
	negs r1, r1
	cmp r0, r1
	ble _0813DD48
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	adds r3, r0, 0
	muls r3, r0
	adds r0, r3, 0
	negs r0, r0
	cmp r0, 0
	bge _0813DCE6
	adds r0, 0x7
_0813DCE6:
	asrs r0, 3
	strh r0, [r4, 0x26]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	ldrh r3, [r4, 0x32]
	cmp r0, 0
	beq _0813DCFA
	ldrh r0, [r4, 0x24]
	adds r0, r2
	b _0813DCFE
_0813DCFA:
	ldrh r0, [r4, 0x24]
	subs r0, r2
_0813DCFE:
	strh r0, [r4, 0x24]
	ldrh r1, [r4, 0x34]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0x7F
	bgt _0813DD10
	adds r0, r1, 0
	adds r0, 0x8
	strh r0, [r4, 0x34]
_0813DD10:
	ldrh r0, [r4, 0x34]
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	subs r1, r0
	lsls r1, 16
	lsrs r2, r1, 16
	lsls r0, r3, 16
	cmp r0, 0
	beq _0813DD34
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	negs r1, r2
	lsls r1, 16
	lsrs r1, 16
	str r2, [sp]
	b _0813DD3E
_0813DD34:
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	str r2, [sp]
	adds r1, r2, 0
_0813DD3E:
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	b _0813DD4E
_0813DD48:
	adds r0, r4, 0
	bl DestroySprite
_0813DD4E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813DB9C

	thumb_func_start sub_813DD58
sub_813DD58: @ 813DD58
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0813DDAE
	cmp r0, 0x1
	ble _0813DD72
	cmp r0, 0x2
	beq _0813DE66
	cmp r0, 0x3
	beq _0813DE26
_0813DD72:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
	movs r0, 0x80
	lsls r0, 4
	strh r0, [r4, 0x34]
	movs r0, 0x1
	strh r0, [r4, 0x2E]
_0813DDAE:
	ldrh r1, [r4, 0x34]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	movs r2, 0x80
	lsls r2, 1
	cmp r0, r2
	ble _0813DDEE
	subs r1, 0x80
	strh r1, [r4, 0x34]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0813DDDA
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	negs r1, r1
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r4, 0x34]
	str r2, [sp]
	b _0813DDE4
_0813DDDA:
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x34]
	str r1, [sp]
_0813DDE4:
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	b _0813DE66
_0813DDEE:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0813DE0C
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xFF
	lsls r1, 8
	str r2, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	b _0813DE1E
_0813DE0C:
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	str r2, [sp]
	adds r1, r2, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
_0813DE1E:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _0813DE66
_0813DE26:
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	adds r1, r0, 0
	muls r1, r0
	adds r0, r1, 0
	cmp r0, 0
	bge _0813DE3C
	adds r0, 0x1F
_0813DE3C:
	asrs r0, 5
	strh r0, [r4, 0x26]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0813DE56
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _0813DE52
	adds r0, 0x3
_0813DE52:
	asrs r0, 2
	b _0813DE64
_0813DE56:
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _0813DE60
	adds r0, 0x3
_0813DE60:
	asrs r0, 2
	negs r0, r0
_0813DE64:
	strh r0, [r4, 0x24]
_0813DE66:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813DD58

	thumb_func_start sub_813DE70
sub_813DE70: @ 813DE70
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r7, r1]
	cmp r0, 0x6
	bhi _0813DEB0
	lsls r0, 2
	ldr r1, _0813DE90 @ =_0813DE94
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813DE90: .4byte _0813DE94
	.align 2, 0
_0813DE94:
	.4byte _0813DEB0
	.4byte _0813E0F8
	.4byte _0813DEF4
	.4byte _0813DF2C
	.4byte _0813DF54
	.4byte _0813E0A8
	.4byte _0813E0D0
_0813DEB0:
	ldrh r1, [r7, 0x20]
	movs r2, 0x20
	ldrsh r0, [r7, r2]
	cmp r0, 0x28
	ble _0813DEC0
	subs r0, r1, 0x4
	strh r0, [r7, 0x20]
	b _0813E0F8
_0813DEC0:
	adds r0, r7, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r4, _0813DEF0 @ =gSpriteTemplate_840B084
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0x68
	movs r3, 0x64
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x3A]
	adds r0, r4, 0
	movs r1, 0xC
	movs r2, 0x6A
	movs r3, 0x65
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x3C]
	b _0813DF42
	.align 2, 0
_0813DEF0: .4byte gSpriteTemplate_840B084
_0813DEF4:
	adds r0, r7, 0
	movs r1, 0x2
	bl StartSpriteAnim
	ldr r2, _0813DF28 @ =gSprites
	movs r3, 0x3A
	ldrsh r1, [r7, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	movs r0, 0x3C
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldrh r0, [r7, 0x2E]
	adds r0, 0x1
	strh r0, [r7, 0x2E]
	b _0813E0F8
	.align 2, 0
_0813DF28: .4byte gSprites
_0813DF2C:
	ldrh r1, [r7, 0x22]
	movs r2, 0x22
	ldrsh r0, [r7, r2]
	cmp r0, 0xA0
	ble _0813DF48
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0813DF42:
	movs r0, 0x1
	strh r0, [r7, 0x2E]
	b _0813E0F8
_0813DF48:
	adds r0, r1, 0x2
	strh r0, [r7, 0x22]
	ldrh r0, [r7, 0x20]
	subs r0, 0x1
	strh r0, [r7, 0x20]
	b _0813E0F8
_0813DF54:
	ldr r6, _0813E094 @ =gSprites
	movs r3, 0x3A
	ldrsh r1, [r7, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r5, [r0, 0x24]
	ldrh r1, [r0, 0x20]
	adds r5, r1
	lsls r5, 16
	lsrs r5, 16
	ldrh r4, [r0, 0x26]
	ldrh r2, [r0, 0x22]
	adds r4, r2
	lsls r4, 16
	lsrs r4, 16
	bl DestroySprite
	movs r0, 0x8C
	lsls r0, 1
	lsls r5, 16
	asrs r1, r5, 16
	lsls r4, 16
	asrs r2, r4, 16
	movs r3, 0x1
	mov r8, r3
	str r3, [sp]
	movs r3, 0x2
	bl sub_813CE88
	strh r0, [r7, 0x3A]
	movs r0, 0x3A
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0813E098 @ =gSprites + 0x1C
	adds r0, r1
	ldr r2, _0813E09C @ =sub_813DD58
	mov r10, r2
	str r2, [r0]
	movs r3, 0x3A
	ldrsh r1, [r7, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	mov r9, r2
	mov r3, r9
	orrs r1, r3
	strb r1, [r0]
	movs r0, 0x3A
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r8
	strh r1, [r0, 0x30]
	movs r2, 0x3A
	ldrsh r1, [r7, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r3, r8
	strh r3, [r0, 0x32]
	lsrs r5, 16
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_813E580
	movs r0, 0x3C
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r5, [r0, 0x24]
	ldrh r1, [r0, 0x20]
	adds r5, r1
	lsls r5, 16
	lsrs r5, 16
	ldrh r4, [r0, 0x26]
	ldrh r2, [r0, 0x22]
	adds r4, r2
	lsls r4, 16
	lsrs r4, 16
	bl DestroySprite
	ldr r0, _0813E0A0 @ =0x0000011b
	lsls r5, 16
	asrs r1, r5, 16
	lsls r4, 16
	asrs r2, r4, 16
	mov r3, r8
	str r3, [sp]
	movs r3, 0x3
	bl sub_813CE88
	strh r0, [r7, 0x3C]
	movs r0, 0x3C
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0813E098 @ =gSprites + 0x1C
	adds r0, r1
	mov r2, r10
	str r2, [r0]
	movs r3, 0x3C
	ldrsh r1, [r7, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	mov r2, r9
	orrs r1, r2
	strb r1, [r0]
	movs r3, 0x3C
	ldrsh r1, [r7, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x2
	strh r1, [r0, 0x30]
	movs r0, 0x3C
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0
	strh r1, [r0, 0x32]
	lsrs r5, 16
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_813E580
	movs r0, 0xFF
	lsls r0, 16
	ldr r1, _0813E0A4 @ =0x00007eff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0x10
	bl BeginNormalPaletteFade
	mov r2, r8
	strh r2, [r7, 0x2E]
	b _0813E0F8
	.align 2, 0
_0813E094: .4byte gSprites
_0813E098: .4byte gSprites + 0x1C
_0813E09C: .4byte sub_813DD58
_0813E0A0: .4byte 0x0000011b
_0813E0A4: .4byte 0x00007eff
_0813E0A8:
	ldr r3, _0813E0CC @ =gSprites
	movs r0, 0x3A
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r2, 0x3
	strh r2, [r0, 0x2E]
	movs r0, 0x3C
	ldrsh r1, [r7, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x2E]
	b _0813E0F8
	.align 2, 0
_0813E0CC: .4byte gSprites
_0813E0D0:
	movs r2, 0x3A
	ldrsh r1, [r7, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0813E108 @ =gSprites
	adds r0, r4
	bl DestroySprite
	movs r3, 0x3C
	ldrsh r1, [r7, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r0, r7, 0
	bl DestroySprite
_0813E0F8:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813E108: .4byte gSprites
	thumb_func_end sub_813DE70

	thumb_func_start sub_813E10C
sub_813E10C: @ 813E10C
	push {r4,lr}
	adds r3, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0x4
	bhi _0813E13C
	lsls r0, 2
	ldr r1, _0813E124 @ =_0813E128
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813E124: .4byte _0813E128
	.align 2, 0
_0813E128:
	.4byte _0813E13C
	.4byte _0813E178
	.4byte _0813E1A6
	.4byte _0813E1C2
	.4byte _0813E1D6
_0813E13C:
	ldrh r4, [r3, 0x24]
	movs r2, 0x24
	ldrsh r1, [r3, r2]
	movs r0, 0x38
	negs r0, r0
	cmp r1, r0
	ble _0813E158
	adds r0, r4, 0
	subs r0, 0x8
	strh r0, [r3, 0x24]
	ldrh r0, [r3, 0x26]
	adds r0, 0x6
	strh r0, [r3, 0x26]
	b _0813E208
_0813E158:
	ldrh r0, [r3, 0x20]
	movs r2, 0
	strh r0, [r3, 0x3A]
	ldrh r1, [r3, 0x22]
	strh r1, [r3, 0x3C]
	adds r0, r4
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x26]
	adds r1, r0
	strh r1, [r3, 0x22]
	strh r2, [r3, 0x24]
	strh r2, [r3, 0x26]
	movs r0, 0x1
	strh r0, [r3, 0x2E]
	strh r2, [r3, 0x30]
	b _0813E208
_0813E178:
	ldrh r1, [r3, 0x30]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0813E1A0
	movs r0, 0x2
	ands r0, r1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	beq _0813E19C
	ldr r0, _0813E198 @ =0x0000ffff
	strh r0, [r3, 0x24]
	strh r2, [r3, 0x26]
	b _0813E1A0
	.align 2, 0
_0813E198: .4byte 0x0000ffff
_0813E19C:
	strh r0, [r3, 0x24]
	strh r0, [r3, 0x26]
_0813E1A0:
	adds r0, r1, 0x1
	strh r0, [r3, 0x30]
	b _0813E208
_0813E1A6:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, 0x3A]
	movs r1, 0
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x3C]
	strh r0, [r3, 0x22]
	strh r1, [r3, 0x24]
	strh r1, [r3, 0x26]
	b _0813E208
_0813E1C2:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r2]
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
_0813E1D6:
	ldrh r2, [r3, 0x24]
	movs r0, 0x24
	ldrsh r1, [r3, r0]
	movs r0, 0x38
	negs r0, r0
	cmp r1, r0
	ble _0813E1F0
	subs r0, r2, 0x4
	strh r0, [r3, 0x24]
	ldrh r0, [r3, 0x26]
	adds r0, 0x3
	strh r0, [r3, 0x26]
	b _0813E208
_0813E1F0:
	ldrh r1, [r3, 0x20]
	adds r0, r2, r1
	movs r1, 0
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x26]
	ldrh r2, [r3, 0x22]
	adds r0, r2
	strh r0, [r3, 0x22]
	strh r1, [r3, 0x24]
	strh r1, [r3, 0x26]
	movs r0, 0x1
	strh r0, [r3, 0x2E]
_0813E208:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813E10C

	thumb_func_start sub_813E210
sub_813E210: @ 813E210
	push {r4,lr}
	adds r3, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0x4
	bhi _0813E240
	lsls r0, 2
	ldr r1, _0813E228 @ =_0813E22C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813E228: .4byte _0813E22C
	.align 2, 0
_0813E22C:
	.4byte _0813E240
	.4byte _0813E278
	.4byte _0813E2A6
	.4byte _0813E2C2
	.4byte _0813E2D6
_0813E240:
	ldrh r4, [r3, 0x24]
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	cmp r0, 0x37
	bgt _0813E258
	adds r0, r4, 0
	adds r0, 0x8
	strh r0, [r3, 0x24]
	ldrh r0, [r3, 0x26]
	subs r0, 0x6
	strh r0, [r3, 0x26]
	b _0813E304
_0813E258:
	ldrh r0, [r3, 0x20]
	movs r2, 0
	strh r0, [r3, 0x3A]
	ldrh r1, [r3, 0x22]
	strh r1, [r3, 0x3C]
	adds r0, r4
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x26]
	adds r1, r0
	strh r1, [r3, 0x22]
	strh r2, [r3, 0x24]
	strh r2, [r3, 0x26]
	movs r0, 0x1
	strh r0, [r3, 0x2E]
	strh r2, [r3, 0x30]
	b _0813E304
_0813E278:
	ldrh r1, [r3, 0x30]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0813E2A0
	movs r0, 0x2
	ands r0, r1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	beq _0813E29C
	strh r2, [r3, 0x24]
	ldr r0, _0813E298 @ =0x0000ffff
	b _0813E29E
	.align 2, 0
_0813E298: .4byte 0x0000ffff
_0813E29C:
	strh r0, [r3, 0x24]
_0813E29E:
	strh r0, [r3, 0x26]
_0813E2A0:
	adds r0, r1, 0x1
	strh r0, [r3, 0x30]
	b _0813E304
_0813E2A6:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, 0x3A]
	movs r1, 0
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x3C]
	strh r0, [r3, 0x22]
	strh r1, [r3, 0x24]
	strh r1, [r3, 0x26]
	b _0813E304
_0813E2C2:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r2]
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
_0813E2D6:
	ldrh r1, [r3, 0x24]
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	cmp r0, 0x37
	bgt _0813E2EC
	adds r0, r1, 0x4
	strh r0, [r3, 0x24]
	ldrh r0, [r3, 0x26]
	subs r0, 0x3
	strh r0, [r3, 0x26]
	b _0813E304
_0813E2EC:
	ldrh r2, [r3, 0x20]
	adds r0, r1, r2
	movs r1, 0
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x26]
	ldrh r2, [r3, 0x22]
	adds r0, r2
	strh r0, [r3, 0x22]
	strh r1, [r3, 0x24]
	strh r1, [r3, 0x26]
	movs r0, 0x1
	strh r0, [r3, 0x2E]
_0813E304:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813E210

	thumb_func_start sub_813E30C
sub_813E30C: @ 813E30C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x14
	bls _0813E322
	b _0813E4AC
_0813E322:
	lsls r0, 2
	ldr r1, _0813E32C @ =_0813E330
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813E32C: .4byte _0813E330
	.align 2, 0
_0813E330:
	.4byte _0813E4AC
	.4byte _0813E384
	.4byte _0813E41C
	.4byte _0813E4AC
	.4byte _0813E4AC
	.4byte _0813E4AC
	.4byte _0813E4AC
	.4byte _0813E4AC
	.4byte _0813E4AC
	.4byte _0813E4AC
	.4byte _0813E3A8
	.4byte _0813E4AC
	.4byte _0813E4AC
	.4byte _0813E4AC
	.4byte _0813E4AC
	.4byte _0813E4AC
	.4byte _0813E4AC
	.4byte _0813E4AC
	.4byte _0813E4AC
	.4byte _0813E4AC
	.4byte _0813E440
_0813E384:
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4, 0x3]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	movs r0, 0x24
	strh r0, [r4, 0x36]
_0813E3A8:
	ldrh r1, [r4, 0x20]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x90
	bgt _0813E3D2
	adds r0, r1, 0x4
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	subs r0, 0x1
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x18
	bl Sin
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x4
	strh r0, [r4, 0x32]
_0813E3D2:
	ldrh r0, [r4, 0x34]
	ldrh r2, [r4, 0x36]
	subs r0, r2
	strh r0, [r4, 0x34]
	ldrh r1, [r4, 0x3C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813E3EE
	lsls r0, r2, 16
	cmp r0, 0
	beq _0813E3EE
	subs r0, r2, 0x1
	strh r0, [r4, 0x36]
_0813E3EE:
	ldr r2, _0813E418 @ =gSineTable
	ldrh r1, [r4, 0x34]
	lsls r0, r1, 24
	lsrs r0, 23
	adds r0, r2
	ldrh r4, [r0]
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 23
	adds r1, r2
	ldrh r1, [r1]
	negs r3, r4
	lsls r3, 16
	lsrs r3, 16
	str r1, [sp]
	movs r0, 0x1
	adds r2, r4, 0
	bl SetOamMatrix
	b _0813E4AC
	.align 2, 0
_0813E418: .4byte gSineTable
_0813E41C:
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x3]
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	movs r0, 0x24
	strh r0, [r4, 0x36]
_0813E440:
	ldrh r1, [r4, 0x20]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x60
	bgt _0813E46A
	adds r0, r1, 0x3
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	subs r0, 0x1
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x18
	bl Sin
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x4
	strh r0, [r4, 0x32]
_0813E46A:
	ldrh r0, [r4, 0x34]
	ldrh r2, [r4, 0x36]
	subs r0, r2
	strh r0, [r4, 0x34]
	ldrh r1, [r4, 0x3C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813E486
	lsls r0, r2, 16
	cmp r0, 0
	beq _0813E486
	subs r0, r2, 0x1
	strh r0, [r4, 0x36]
_0813E486:
	ldr r2, _0813E4B4 @ =gSineTable
	ldrh r1, [r4, 0x34]
	lsls r0, r1, 24
	lsrs r0, 23
	adds r0, r2
	ldrh r4, [r0]
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 23
	adds r1, r2
	ldrh r1, [r1]
	negs r3, r4
	lsls r3, 16
	lsrs r3, 16
	str r1, [sp]
	movs r0, 0x2
	adds r2, r4, 0
	bl SetOamMatrix
_0813E4AC:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813E4B4: .4byte gSineTable
	thumb_func_end sub_813E30C

	thumb_func_start sub_813E4B8
sub_813E4B8: @ 813E4B8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813E4DA
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	b _0813E4E4
_0813E4DA:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
_0813E4E4:
	strb r0, [r2]
	ldrh r1, [r5, 0x32]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	cmp r0, 0x3F
	ble _0813E4F8
	adds r0, r5, 0
	bl DestroySprite
	b _0813E574
_0813E4F8:
	adds r0, r1, 0x2
	strh r0, [r5, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x28
	bl Sin
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	lsls r0, 29
	lsrs r0, 24
	lsls r4, 16
	asrs r4, 16
	adds r1, r4, 0
	bl Cos
	strh r0, [r5, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	lsls r0, 29
	lsrs r0, 24
	adds r1, r4, 0
	bl Sin
	strh r0, [r5, 0x26]
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0813E574
	ldrh r0, [r5, 0x34]
	ldrh r2, [r5, 0x30]
	subs r0, r2
	strh r0, [r5, 0x34]
	ldrh r1, [r5, 0x3C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813E550
	lsls r0, r2, 16
	cmp r0, 0
	beq _0813E550
	subs r0, r2, 0x1
	strh r0, [r5, 0x30]
_0813E550:
	ldr r3, _0813E57C @ =gSineTable
	ldrh r1, [r5, 0x34]
	lsls r0, r1, 24
	lsrs r0, 23
	adds r0, r3
	ldrh r2, [r0]
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 23
	adds r1, r3
	ldrh r1, [r1]
	negs r3, r2
	lsls r3, 16
	lsrs r3, 16
	str r1, [sp]
	movs r0, 0x10
	bl SetOamMatrix
_0813E574:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813E57C: .4byte gSineTable
	thumb_func_end sub_813E4B8

	thumb_func_start sub_813E580
sub_813E580: @ 813E580
	push {r4-r7,lr}
	movs r4, 0
	ldr r7, _0813E5D8 @ =gSprites
	lsls r6, r0, 16
	lsls r5, r1, 16
_0813E58A:
	ldr r0, _0813E5DC @ =gSpriteTemplate_840B0B0
	asrs r1, r6, 16
	asrs r2, r5, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrb r1, [r2, 0x1]
	movs r3, 0x4
	negs r3, r3
	adds r0, r3, 0
	ands r1, r0
	movs r0, 0x1
	orrs r1, r0
	strb r1, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	subs r3, 0x3B
	adds r0, r3, 0
	ands r1, r0
	movs r0, 0x20
	orrs r1, r0
	strb r1, [r2, 0x3]
	strh r4, [r2, 0x2E]
	movs r0, 0x20
	strh r0, [r2, 0x30]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _0813E58A
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813E5D8: .4byte gSprites
_0813E5DC: .4byte gSpriteTemplate_840B0B0
	thumb_func_end sub_813E580

	thumb_func_start sub_813E5E0
sub_813E5E0: @ 813E5E0
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0813E5F4 @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813E5F8
	adds r0, r3, 0
	bl DestroySprite
	b _0813E6B2
	.align 2, 0
_0813E5F4: .4byte gUnknown_0203931A
_0813E5F8:
	ldr r2, _0813E6B8 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	movs r1, 0x4
	ands r1, r0
	mov r4, r12
	ldrb r2, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldrh r1, [r3, 0x3C]
	movs r2, 0x3C
	ldrsh r0, [r3, r2]
	cmp r0, 0xB
	bgt _0813E630
	adds r0, r1, 0x1
	strh r0, [r3, 0x3C]
_0813E630:
	ldrh r0, [r3, 0x3A]
	adds r0, 0x4
	strh r0, [r3, 0x3A]
	ldr r4, _0813E6BC @ =gSineTable
	ldrh r0, [r3, 0x34]
	adds r0, 0x40
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r2, 0x3A
	ldrsh r0, [r3, r2]
	muls r0, r1
	cmp r0, 0
	bge _0813E652
	adds r0, 0xFF
_0813E652:
	asrs r0, 8
	ldrh r1, [r3, 0x36]
	adds r0, r1
	strh r0, [r3, 0x20]
	movs r2, 0x34
	ldrsh r0, [r3, r2]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r2, 0x3A
	ldrsh r0, [r3, r2]
	muls r0, r1
	cmp r0, 0
	bge _0813E674
	adds r0, 0xFF
_0813E674:
	asrs r0, 8
	ldrh r1, [r3, 0x38]
	adds r2, r0, r1
	strh r2, [r3, 0x22]
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	movs r4, 0
	ldrsh r1, [r0, r4]
	movs r4, 0x3C
	ldrsh r0, [r3, r4]
	muls r0, r1
	cmp r0, 0
	bge _0813E696
	adds r0, 0xFF
_0813E696:
	asrs r0, 8
	strh r0, [r3, 0x26]
	ldrh r0, [r3, 0x30]
	adds r0, 0x10
	strh r0, [r3, 0x30]
	lsls r0, r2, 16
	asrs r0, 16
	movs r2, 0x32
	ldrsh r1, [r3, r2]
	cmp r0, r1
	ble _0813E6B2
	adds r0, r3, 0
	bl DestroySprite
_0813E6B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813E6B8: .4byte gSprites
_0813E6BC: .4byte gSineTable
	thumb_func_end sub_813E5E0

	thumb_func_start sub_813E6C0
sub_813E6C0: @ 813E6C0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, _0813E6E0 @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813E6E4
	adds r0, r4, 0
	bl DestroySprite
	b _0813E7A8
	.align 2, 0
_0813E6E0: .4byte gUnknown_0203931A
_0813E6E4:
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r3, _0813E7B8 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r3
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _0813E7A8
	ldrh r1, [r4, 0x3C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0813E7A8
	ldrh r0, [r2, 0x20]
	ldrh r7, [r4, 0x30]
	adds r0, r7
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	ldrh r0, [r2, 0x22]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	movs r5, 0
	mov r8, r3
	ldr r2, [sp]
	lsls r2, 16
	mov r10, r2
	lsls r7, r6, 16
	mov r9, r7
_0813E73A:
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	adds r0, 0x43
	ldrb r3, [r0]
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _0813E7BC @ =gSpriteTemplate_840B0DC
	mov r2, r10
	asrs r1, r2, 16
	mov r7, r9
	asrs r2, r7, 16
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0813E79E
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	add r3, r8
	ldrh r0, [r4, 0x2E]
	strh r0, [r3, 0x2E]
	ldrh r1, [r4, 0x3C]
	lsls r1, 16
	asrs r1, 18
	movs r0, 0x7
	ands r1, r0
	lsls r1, 5
	lsls r0, r5, 2
	adds r0, r5
	lsls r2, r0, 4
	adds r0, r2
	adds r1, r0
	strh r1, [r3, 0x30]
	ldrh r0, [r4, 0x34]
	strh r0, [r3, 0x32]
	movs r0, 0x68
	strh r0, [r3, 0x34]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r3, 0x36]
	strh r6, [r3, 0x38]
	movs r1, 0
	strh r1, [r3, 0x3A]
_0813E79E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _0813E73A
_0813E7A8:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813E7B8: .4byte gSprites
_0813E7BC: .4byte gSpriteTemplate_840B0DC
	thumb_func_end sub_813E6C0

	thumb_func_start sub_813E7C0
sub_813E7C0: @ 813E7C0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813E7F8 @ =gSpriteTemplate_840B0F4
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0813E7F2
	ldr r1, _0813E7FC @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r2, 0
	strh r4, [r0, 0x2E]
	ldr r1, _0813E800 @ =0x0000fff4
	strh r1, [r0, 0x30]
	strh r2, [r0, 0x32]
	movs r1, 0x88
	strh r1, [r0, 0x34]
_0813E7F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813E7F8: .4byte gSpriteTemplate_840B0F4
_0813E7FC: .4byte gSprites
_0813E800: .4byte 0x0000fff4
	thumb_func_end sub_813E7C0

	thumb_func_start sub_813E804
sub_813E804: @ 813E804
	push {r4-r7,lr}
	adds r3, r0, 0
	ldr r0, _0813E818 @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813E81C
	adds r0, r3, 0
	bl DestroySprite
	b _0813E928
	.align 2, 0
_0813E818: .4byte gUnknown_0203931A
_0813E81C:
	ldr r6, _0813E904 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r0, [r0]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	movs r1, 0x4
	ands r1, r0
	mov r7, r12
	ldrb r2, [r7]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7]
	ldrh r0, [r3, 0x3C]
	adds r0, 0x1
	strh r0, [r3, 0x3C]
	ldrh r1, [r3, 0x34]
	movs r2, 0x34
	ldrsh r0, [r3, r2]
	cmp r0, 0x27
	bgt _0813E85A
	adds r0, r1, 0x2
	strh r0, [r3, 0x34]
_0813E85A:
	movs r7, 0x2E
	ldrsh r1, [r3, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r0, 0x24]
	ldrh r0, [r0, 0x20]
	adds r2, r1, r0
	ldr r4, _0813E908 @ =gSineTable
	ldrh r5, [r3, 0x30]
	adds r0, r5, 0
	adds r0, 0x40
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	movs r7, 0
	ldrsh r1, [r0, r7]
	movs r7, 0x34
	ldrsh r0, [r3, r7]
	muls r0, r1
	cmp r0, 0
	bge _0813E88A
	adds r0, 0xFF
_0813E88A:
	asrs r0, 8
	adds r0, r2, r0
	strh r0, [r3, 0x20]
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r2, r1, r0
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	movs r7, 0
	ldrsh r1, [r0, r7]
	movs r7, 0x34
	ldrsh r0, [r3, r7]
	muls r0, r1
	cmp r0, 0
	bge _0813E8BE
	ldr r1, _0813E90C @ =0x000001ff
	adds r0, r1
_0813E8BE:
	asrs r0, 9
	adds r0, r2, r0
	strh r0, [r3, 0x22]
	adds r1, r5, 0x2
	strh r1, [r3, 0x30]
	movs r2, 0x32
	ldrsh r0, [r3, r2]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r4
	movs r7, 0
	ldrsh r0, [r0, r7]
	cmp r0, 0
	bge _0813E8DC
	adds r0, 0x1F
_0813E8DC:
	asrs r0, 5
	strh r0, [r3, 0x26]
	ldrh r0, [r3, 0x32]
	adds r0, 0x8
	strh r0, [r3, 0x32]
	movs r0, 0xFF
	ands r1, r0
	cmp r1, 0x7F
	bgt _0813E910
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	b _0813E922
	.align 2, 0
_0813E904: .4byte gSprites
_0813E908: .4byte gSineTable
_0813E90C: .4byte 0x000001ff
_0813E910:
	movs r2, 0x2E
	ldrsh r1, [r3, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x43
	ldrb r0, [r0]
	adds r0, 0x1
_0813E922:
	adds r1, r3, 0
	adds r1, 0x43
	strb r0, [r1]
_0813E928:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_813E804

	thumb_func_start sub_813E930
sub_813E930: @ 813E930
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r7, _0813E978 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r5, r0, r7
_0813E942:
	movs r0, 0x20
	ldrsh r1, [r5, r0]
	movs r0, 0x22
	ldrsh r2, [r5, r0]
	ldr r0, _0813E97C @ =gSpriteTemplate_840B124
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0813E968
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r6, [r0, 0x2E]
	lsls r1, r4, 5
	strh r1, [r0, 0x30]
_0813E968:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _0813E942
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813E978: .4byte gSprites
_0813E97C: .4byte gSpriteTemplate_840B124
	thumb_func_end sub_813E930

	thumb_func_start sub_813E980
sub_813E980: @ 813E980
	push {r4,r5,lr}
	adds r3, r0, 0
	ldr r0, _0813E994 @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813E998
	adds r0, r3, 0
	bl DestroySprite
	b _0813EA50
	.align 2, 0
_0813E994: .4byte gUnknown_0203931A
_0813E998:
	ldr r2, _0813EA58 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	movs r1, 0x4
	ands r1, r0
	mov r5, r12
	ldrb r2, [r5]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	ldrh r0, [r3, 0x3C]
	adds r0, 0x1
	strh r0, [r3, 0x3C]
	ldrh r0, [r3, 0x3A]
	adds r4, r0, 0
	adds r4, 0x8
	strh r4, [r3, 0x3A]
	ldr r2, _0813EA5C @ =gSineTable
	ldrh r0, [r3, 0x34]
	adds r0, 0x40
	lsls r0, 24
	lsrs r0, 23
	adds r0, r2
	movs r5, 0
	ldrsh r1, [r0, r5]
	movs r5, 0x3A
	ldrsh r0, [r3, r5]
	muls r0, r1
	cmp r0, 0
	bge _0813E9EC
	adds r0, 0xFF
_0813E9EC:
	asrs r0, 8
	ldrh r1, [r3, 0x36]
	adds r0, r1
	strh r0, [r3, 0x20]
	movs r5, 0x34
	ldrsh r0, [r3, r5]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r2
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r5, 0x3A
	ldrsh r0, [r3, r5]
	muls r0, r1
	cmp r0, 0
	bge _0813EA0E
	adds r0, 0xFF
_0813EA0E:
	asrs r0, 8
	ldrh r1, [r3, 0x38]
	adds r0, r1
	strh r0, [r3, 0x22]
	movs r2, 0x3A
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _0813EA20
	adds r0, 0xF
_0813EA20:
	asrs r0, 4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bls _0813EA2C
	movs r0, 0x9
_0813EA2C:
	adds r1, r0, 0
	adds r1, 0x12
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r3, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x3]
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, 0xA0
	ble _0813EA50
	adds r0, r3, 0
	bl DestroySprite
_0813EA50:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813EA58: .4byte gSprites
_0813EA5C: .4byte gSineTable
	thumb_func_end sub_813E980

	thumb_func_start sub_813EA60
sub_813EA60: @ 813EA60
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	ldr r0, _0813EA7C @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813EA80
	adds r0, r5, 0
	bl DestroySprite
	b _0813EB32
	.align 2, 0
_0813EA7C: .4byte gUnknown_0203931A
_0813EA80:
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0813EB40 @ =gSprites
	mov r9, r0
	movs r4, 0x2E
	ldrsh r1, [r5, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r1, r9
	adds r3, r0, r1
	movs r4, 0x2E
	ldrsh r1, [r3, r4]
	cmp r1, 0x1
	bne _0813EB32
	ldrh r0, [r5, 0x3C]
	ands r1, r0
	lsls r0, r1, 16
	asrs r6, r0, 16
	cmp r6, 0
	bne _0813EB32
	ldrh r1, [r3, 0x20]
	ldrh r0, [r5, 0x30]
	adds r1, r0
	lsls r1, 16
	ldrh r2, [r3, 0x22]
	ldrh r4, [r5, 0x32]
	adds r2, r4
	lsls r2, 16
	ldr r0, _0813EB44 @ =gSpriteTemplate_840B150
	lsrs r4, r1, 16
	mov r8, r4
	asrs r1, 16
	lsrs r7, r2, 16
	asrs r2, 16
	adds r3, 0x43
	ldrb r3, [r3]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0813EB32
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r9
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x24
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x1
	movs r3, 0x3
	bl CalcCenterToCornerVec
	ldrh r0, [r5, 0x2E]
	strh r0, [r4, 0x2E]
	ldr r2, _0813EB48 @ =gUnknown_0840B168
	ldrh r0, [r5, 0x3C]
	lsls r0, 16
	asrs r0, 17
	movs r1, 0x7
	ands r0, r1
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r4, 0x34]
	mov r0, r8
	strh r0, [r4, 0x36]
	strh r7, [r4, 0x38]
	strh r6, [r4, 0x3A]
_0813EB32:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813EB40: .4byte gSprites
_0813EB44: .4byte gSpriteTemplate_840B150
_0813EB48: .4byte gUnknown_0840B168
	thumb_func_end sub_813EA60

	thumb_func_start InitIntroTorchicAttackAnim
InitIntroTorchicAttackAnim: @ 813EB4C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813EBB0 @ =gSpriteTemplate_840B170
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0813EB80
	ldr r1, _0813EBB4 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r4, [r0, 0x2E]
	strh r1, [r0, 0x30]
	movs r1, 0x8
	strh r1, [r0, 0x32]
	movs r1, 0x18
	strh r1, [r0, 0x34]
_0813EB80:
	movs r4, 0
	ldr r5, _0813EBB8 @ =gUnknown_0840B188
_0813EB84:
	adds r0, r4, 0
	adds r0, 0x12
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 1
	adds r1, r5
	ldrh r1, [r1]
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _0813EB84
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813EBB0: .4byte gSpriteTemplate_840B170
_0813EBB4: .4byte gSprites
_0813EBB8: .4byte gUnknown_0840B188
	thumb_func_end InitIntroTorchicAttackAnim

	thumb_func_start sub_813EBBC
sub_813EBBC: @ 813EBBC
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0813EBD0 @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813EBD4
	adds r0, r3, 0
	bl DestroySprite
	b _0813EC80
	.align 2, 0
_0813EBD0: .4byte gUnknown_0203931A
_0813EBD4:
	ldr r2, _0813EC88 @ =gSprites
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r0, [r0]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	movs r1, 0x4
	ands r1, r0
	mov r4, r12
	ldrb r2, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldrh r0, [r3, 0x3C]
	adds r0, 0x1
	strh r0, [r3, 0x3C]
	ldrh r0, [r3, 0x3A]
	adds r0, 0x8
	strh r0, [r3, 0x3A]
	ldr r2, _0813EC8C @ =gSineTable
	ldrh r0, [r3, 0x34]
	adds r0, 0x40
	lsls r0, 24
	lsrs r0, 23
	adds r0, r2
	movs r4, 0
	ldrsh r1, [r0, r4]
	movs r4, 0x3A
	ldrsh r0, [r3, r4]
	muls r0, r1
	cmp r0, 0
	bge _0813EC26
	adds r0, 0xFF
_0813EC26:
	asrs r0, 8
	ldrh r1, [r3, 0x36]
	adds r0, r1
	strh r0, [r3, 0x20]
	movs r4, 0x34
	ldrsh r0, [r3, r4]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r2
	movs r4, 0
	ldrsh r1, [r0, r4]
	movs r4, 0x3A
	ldrsh r0, [r3, r4]
	muls r0, r1
	cmp r0, 0
	bge _0813EC48
	adds r0, 0xFF
_0813EC48:
	asrs r0, 8
	ldrh r4, [r3, 0x38]
	adds r1, r0, r4
	strh r1, [r3, 0x22]
	movs r4, 0x30
	ldrsh r0, [r3, r4]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bge _0813EC64
	adds r0, 0x3F
_0813EC64:
	asrs r0, 6
	strh r0, [r3, 0x26]
	ldrh r0, [r3, 0x30]
	adds r0, 0x10
	strh r0, [r3, 0x30]
	lsls r0, r1, 16
	asrs r0, 16
	movs r4, 0x32
	ldrsh r1, [r3, r4]
	cmp r0, r1
	bge _0813EC80
	adds r0, r3, 0
	bl DestroySprite
_0813EC80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EC88: .4byte gSprites
_0813EC8C: .4byte gSineTable
	thumb_func_end sub_813EBBC

	thumb_func_start sub_813EC90
sub_813EC90: @ 813EC90
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, _0813ECAC @ =gUnknown_0203931A
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813ECB0
	adds r0, r5, 0
	bl DestroySprite
	b _0813EDA0
	.align 2, 0
_0813ECAC: .4byte gUnknown_0203931A
_0813ECB0:
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0813EDB0 @ =gSprites
	mov r9, r0
	movs r2, 0x2E
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r4, r9
	adds r3, r0, r4
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	cmp r1, 0x1
	bne _0813ED74
	ldrh r0, [r5, 0x3C]
	ands r1, r0
	lsls r0, r1, 16
	asrs r6, r0, 16
	cmp r6, 0
	bne _0813ED66
	ldrh r1, [r3, 0x20]
	ldrh r2, [r5, 0x30]
	adds r1, r2
	lsls r1, 16
	ldrh r2, [r3, 0x22]
	ldrh r4, [r5, 0x32]
	adds r2, r4
	lsls r2, 16
	ldr r0, _0813EDB4 @ =gSpriteTemplate_840B1B0
	lsrs r4, r1, 16
	mov r8, r4
	asrs r1, 16
	lsrs r7, r2, 16
	asrs r2, 16
	adds r3, 0x43
	ldrb r3, [r3]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0813ED66
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r9
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x22
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x1
	movs r3, 0x3
	bl CalcCenterToCornerVec
	ldrh r0, [r5, 0x2E]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x3C]
	lsls r0, 16
	asrs r0, 18
	movs r1, 0x7
	ands r0, r1
	lsls r0, 5
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x34]
	strh r0, [r4, 0x32]
	movs r0, 0xE8
	strh r0, [r4, 0x34]
	mov r0, r8
	strh r0, [r4, 0x36]
	strh r7, [r4, 0x38]
	strh r6, [r4, 0x3A]
_0813ED66:
	ldrh r1, [r5, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r5, r2]
	cmp r0, 0x6F
	bgt _0813ED74
	adds r0, r1, 0x4
	strh r0, [r5, 0x3A]
_0813ED74:
	ldr r1, _0813EDB8 @ =gSineTable
	ldrh r0, [r5, 0x3A]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	movs r4, 0
	ldrsh r0, [r0, r4]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	subs r1, r0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x11
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
_0813EDA0:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813EDB0: .4byte gSprites
_0813EDB4: .4byte gSpriteTemplate_840B1B0
_0813EDB8: .4byte gSineTable
	thumb_func_end sub_813EC90

	thumb_func_start InitIntroMudkipAttackAnim
InitIntroMudkipAttackAnim: @ 813EDBC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0813EDF4 @ =gSpriteTemplate_840B1C8
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0813EDEE
	ldr r1, _0813EDF8 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r4, [r0, 0x2E]
	strh r1, [r0, 0x30]
	movs r1, 0xC
	strh r1, [r0, 0x32]
	movs r1, 0x18
	strh r1, [r0, 0x34]
_0813EDEE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EDF4: .4byte gSpriteTemplate_840B1C8
_0813EDF8: .4byte gSprites
	thumb_func_end InitIntroMudkipAttackAnim

	thumb_func_start sub_813EDFC
sub_813EDFC: @ 813EDFC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0813EE12
	adds r4, r5, 0
	adds r4, 0x3E
	cmp r0, 0x1
	beq _0813EE4A
_0813EE12:
	adds r4, r5, 0
	adds r4, 0x3E
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrb r0, [r5, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r5, 0x1]
	ldrb r1, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x24
	orrs r0, r1
	strb r0, [r5, 0x3]
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	movs r0, 0
	strh r0, [r5, 0x30]
	movs r0, 0x1
	strh r0, [r5, 0x2E]
_0813EE4A:
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813EE62
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	b _0813EE7A
_0813EE62:
	ldrb r0, [r4]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	ldrh r1, [r5, 0x30]
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	cmp r0, 0x3F
	bgt _0813EE7A
	adds r0, r1, 0x1
	strh r0, [r5, 0x30]
_0813EE7A:
	ldr r1, _0813EEB0 @ =gSineTable
	ldrh r0, [r5, 0x30]
	lsls r0, 24
	lsrs r0, 23
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	subs r1, r0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x12
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813EEB0: .4byte gSineTable
	thumb_func_end sub_813EDFC

	.align 2, 0 @ Don't pad with nop.
