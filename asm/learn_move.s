	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8133140
sub_8133140: @ 8133140
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	ldr r4, _08133234 @ =gSprites
	ldr r5, _08133238 @ =gUnknown_030007B0
	ldr r0, [r5]
	ldrb r0, [r0, 0x3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r3, 0x5
	negs r3, r3
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	ldr r0, [r5]
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r2, [r0]
	adds r1, r3, 0
	ands r1, r2
	strb r1, [r0]
	movs r6, 0
	ldr r7, _0813323C @ =gUnknown_08402D08
_0813318A:
	ldr r0, [r5]
	adds r0, r6
	ldrb r0, [r0, 0x7]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	adds r6, 0x1
	cmp r6, 0xF
	ble _0813318A
	movs r6, 0
	ldr r0, [r7]
	cmp r0, 0
	beq _08133208
	mov r9, r7
	mov r10, r6
	movs r0, 0x24
	add r0, r9
	mov r8, r0
_081331BA:
	mov r0, r9
	adds r0, 0x20
	add r0, r10
	ldr r1, [r0]
	ldr r0, _08133240 @ =gTileBuffer
	movs r2, 0x40
	movs r3, 0x2
	bl sub_8072C74
	mov r0, r8
	ldrb r5, [r0]
	ldrb r4, [r0, 0x1]
	ldr r0, _08133240 @ =gTileBuffer
	adds r1, r5, 0
	adds r2, r4, 0
	bl MenuPrint
	cmp r6, 0
	beq _081331F8
	adds r1, r4, 0x2
	lsls r1, 24
	lsrs r1, 24
	adds r2, r5, 0x7
	lsls r2, 24
	lsrs r2, 24
	adds r3, r4, 0x3
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	bl MenuZeroFillWindowRect
_081331F8:
	movs r0, 0x8
	add r10, r0
	add r8, r0
	adds r7, 0x8
	adds r6, 0x1
	ldr r0, [r7]
	cmp r0, 0
	bne _081331BA
_08133208:
	ldr r0, [sp, 0x8]
	cmp r0, 0
	bne _08133222
	ldr r0, _08133244 @ =gOtherText_TeachWhichMove
	movs r1, 0x20
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r1, 0x18
	movs r2, 0x78
	movs r3, 0xC0
	bl sub_8072AB0
_08133222:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08133234: .4byte gSprites
_08133238: .4byte gUnknown_030007B0
_0813323C: .4byte gUnknown_08402D08
_08133240: .4byte gTileBuffer
_08133244: .4byte gOtherText_TeachWhichMove
	thumb_func_end sub_8133140

	thumb_func_start sub_8133248
sub_8133248: @ 8133248
	push {r4,lr}
	ldr r0, _08133294 @ =gMain
	ldrh r2, [r0, 0x2E]
	movs r1, 0x30
	ands r1, r2
	negs r0, r1
	orrs r0, r1
	lsrs r4, r0, 31
	ldr r0, _08133298 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _0813326C
	movs r0, 0xC0
	lsls r0, 2
	ands r0, r2
	cmp r0, 0
	beq _0813326C
	adds r4, 0x1
_0813326C:
	cmp r4, 0
	beq _0813328A
	movs r0, 0x5
	bl PlaySE
	ldr r2, _0813329C @ =gUnknown_030007B0
	ldr r1, [r2]
	movs r3, 0
	movs r0, 0x3
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0xB1
	lsls r1, 2
	adds r0, r1
	strb r3, [r0]
_0813328A:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08133294: .4byte gMain
_08133298: .4byte gSaveBlock2
_0813329C: .4byte gUnknown_030007B0
	thumb_func_end sub_8133248

	thumb_func_start sub_81332A0
sub_81332A0: @ 81332A0
	push {r4,lr}
	ldr r2, _081332F8 @ =gUnknown_030007B0
	ldr r0, [r2]
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, 0x2]
	ldr r0, [r2]
	strb r1, [r0, 0x19]
	ldr r0, [r2]
	strb r1, [r0, 0x18]
	ldr r0, [r2]
	strb r1, [r0, 0x1C]
	ldr r0, [r2]
	strb r1, [r0, 0x1A]
	ldr r0, [r2]
	strb r1, [r0, 0x1B]
	ldr r0, [r2]
	strb r1, [r0, 0x1D]
	ldr r0, [r2]
	strb r1, [r0, 0x1E]
	ldr r0, [r2]
	ldr r3, _081332FC @ =0x000002c3
	adds r0, r3
	strb r1, [r0]
	ldr r0, [r2]
	adds r3, 0x1
	adds r0, r3
	strb r1, [r0]
	movs r3, 0
	adds r4, r2, 0
	movs r2, 0
_081332E0:
	ldr r0, [r4]
	lsls r1, r3, 1
	adds r0, 0x20
	adds r0, r1
	strh r2, [r0]
	adds r3, 0x1
	cmp r3, 0x13
	ble _081332E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081332F8: .4byte gUnknown_030007B0
_081332FC: .4byte 0x000002c3
	thumb_func_end sub_81332A0

	thumb_func_start sub_8133300
sub_8133300: @ 8133300
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 1
	movs r0, 0xFF
	ands r1, r0
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	beq _08133324
	cmp r0, 0x1
	ble _0813334A
	cmp r0, 0x2
	beq _08133338
	b _0813334A
_08133324:
	adds r0, r1, 0
	movs r1, 0x3
	bl Sin
	ldrh r1, [r4, 0x32]
	adds r2, r0, 0
	muls r2, r1
	adds r0, r2, 0
	strh r0, [r4, 0x24]
	b _0813334A
_08133338:
	adds r0, r1, 0
	movs r1, 0x1
	bl Sin
	ldrh r1, [r4, 0x32]
	adds r2, r0, 0
	muls r2, r1
	adds r0, r2, 0
	strh r0, [r4, 0x26]
_0813334A:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8133300

	thumb_func_start sub_8133358
sub_8133358: @ 8133358
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r6, _0813353C @ =gSpriteTemplate_8402D90
	adds r0, r6, 0
	movs r1, 0x8
	movs r2, 0x10
	movs r3, 0
	bl CreateSprite
	ldr r4, _08133540 @ =gUnknown_030007B0
	ldr r1, [r4]
	strb r0, [r1, 0x3]
	ldr r5, _08133544 @ =gSprites
	ldr r2, [r4]
	ldrb r1, [r2, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	mov r8, r1
	mov r1, r8
	strh r1, [r0, 0x2E]
	ldrb r1, [r2, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08133548 @ =0x0000ffff
	strh r1, [r0, 0x32]
	adds r0, r6, 0
	movs r1, 0x48
	movs r2, 0x10
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	strb r0, [r1, 0x4]
	ldr r0, [r4]
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r2, [r4]
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x2E]
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldr r0, _0813354C @ =gSpriteTemplate_8402DC0
	mov r9, r0
	movs r1, 0xA0
	movs r2, 0x4
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	strb r0, [r1, 0x5]
	ldr r0, [r4]
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r2, [r4]
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r6, 0x2
	strh r6, [r0, 0x2E]
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	negs r1, r1
	strh r1, [r0, 0x32]
	mov r0, r9
	movs r1, 0xA0
	movs r2, 0x3C
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	strb r0, [r1, 0x6]
	ldr r2, [r4]
	ldrb r1, [r2, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x2E]
	ldrb r1, [r2, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	movs r5, 0
	ldr r6, _08133550 @ =gSpriteTemplate_8402E08
_0813344E:
	adds r2, r5, 0
	cmp r5, 0
	bge _08133456
	adds r2, r5, 0x3
_08133456:
	asrs r2, 2
	lsls r1, r2, 2
	subs r1, r5, r1
	lsls r1, 19
	movs r0, 0xE0
	lsls r0, 13
	adds r1, r0
	asrs r1, 16
	lsls r2, 19
	movs r0, 0xD0
	lsls r0, 14
	adds r2, r0
	asrs r2, 16
	adds r0, r6, 0
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	adds r2, r5, 0x4
	adds r1, 0x3
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x3
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08133544 @ =gSprites
	adds r0, r1
	movs r1, 0x2
	bl StartSpriteAnim
	adds r5, 0x1
	cmp r5, 0x7
	ble _0813344E
	movs r5, 0
	ldr r7, _08133550 @ =gSpriteTemplate_8402E08
	ldr r6, _08133540 @ =gUnknown_030007B0
_081334A6:
	adds r2, r5, 0
	cmp r5, 0
	bge _081334AE
	adds r2, r5, 0x3
_081334AE:
	asrs r2, 2
	lsls r1, r2, 2
	subs r1, r5, r1
	lsls r1, 19
	movs r0, 0xE0
	lsls r0, 13
	adds r1, r0
	asrs r1, 16
	lsls r2, 19
	movs r0, 0xB8
	lsls r0, 15
	adds r2, r0
	asrs r2, 16
	adds r0, r7, 0
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	adds r2, r5, 0
	adds r2, 0xC
	adds r1, 0x3
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x3
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08133544 @ =gSprites
	adds r0, r4
	movs r1, 0x2
	bl StartSpriteAnim
	adds r5, 0x1
	cmp r5, 0x7
	ble _081334A6
	movs r5, 0
	ldr r3, _08133540 @ =gUnknown_030007B0
	movs r2, 0x4
_08133500:
	ldr r0, [r3]
	adds r0, 0x3
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r5, 0x1
	cmp r5, 0x13
	ble _08133500
	ldr r1, _08133548 @ =0x0000ffff
	ldr r3, _08133554 @ =0x00002d9f
	movs r0, 0x12
	str r0, [sp]
	movs r0, 0x10
	movs r2, 0xC
	bl CreateBlendedOutlineCursor
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813353C: .4byte gSpriteTemplate_8402D90
_08133540: .4byte gUnknown_030007B0
_08133544: .4byte gSprites
_08133548: .4byte 0x0000ffff
_0813354C: .4byte gSpriteTemplate_8402DC0
_08133550: .4byte gSpriteTemplate_8402E08
_08133554: .4byte 0x00002d9f
	thumb_func_end sub_8133358

	thumb_func_start sub_8133558
sub_8133558: @ 8133558
	push {r4-r6,lr}
	sub sp, 0xC
	ldr r5, _081335F4 @ =gUnknown_030007B0
	ldr r1, [r5]
	ldr r2, _081335F8 @ =0x000002c5
	adds r0, r1, r2
	ldrb r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _081335FC @ =gPlayerParty
	adds r0, r2
	adds r1, 0x20
	bl GetMoveRelearnerMoves
	ldr r1, [r5]
	strb r0, [r1, 0x1A]
	movs r4, 0
	ldr r0, [r5]
	ldrb r0, [r0, 0x1A]
	cmp r4, r0
	bge _081335AA
	adds r6, r5, 0
	movs r5, 0x52
_08133586:
	lsls r2, r4, 1
	ldr r1, [r6]
	adds r0, r1, r5
	adds r1, 0x20
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _08133600 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	adds r5, 0x19
	adds r4, 0x1
	ldr r0, [r6]
	ldrb r0, [r0, 0x1A]
	cmp r4, r0
	blt _08133586
_081335AA:
	ldr r4, _081335F4 @ =gUnknown_030007B0
	ldr r0, [r4]
	ldr r1, _081335F8 @ =0x000002c5
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081335FC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _08133604 @ =gStringVar1
	mov r1, sp
	bl StringCopy10
	ldr r0, [r4]
	ldrb r2, [r0, 0x1A]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 3
	adds r1, r2
	adds r1, 0x52
	adds r0, r1
	ldr r1, _08133608 @ =gUnknownText_Exit
	bl StringCopy
	ldr r1, [r4]
	ldrb r0, [r1, 0x1A]
	adds r0, 0x1
	strb r0, [r1, 0x1A]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081335F4: .4byte gUnknown_030007B0
_081335F8: .4byte 0x000002c5
_081335FC: .4byte gPlayerParty
_08133600: .4byte gMoveNames
_08133604: .4byte gStringVar1
_08133608: .4byte gUnknownText_Exit
	thumb_func_end sub_8133558

	thumb_func_start sub_813360C
sub_813360C: @ 813360C
	lsls r0, 24
	ldr r3, _08133628 @ =gUnknown_030007B0
	ldr r2, [r3]
	ldrb r1, [r2, 0x18]
	strb r1, [r2, 0x1C]
	ldr r1, [r3]
	lsrs r0, 24
	ldrb r2, [r1, 0x18]
	adds r0, r2
	strb r0, [r1, 0x18]
	ldr r1, [r3]
	movs r0, 0x1
	strb r0, [r1, 0x1D]
	bx lr
	.align 2, 0
_08133628: .4byte gUnknown_030007B0
	thumb_func_end sub_813360C

	thumb_func_start sub_813362C
sub_813362C: @ 813362C
	push {r4,r5,lr}
	ldr r2, _08133670 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08133688
	ldr r4, _08133674 @ =gUnknown_030007B0
	ldr r0, [r4]
	ldrb r0, [r0, 0x1B]
	cmp r0, 0
	bne _08133646
	b _08133796
_08133646:
	movs r0, 0x5
	bl PlaySE
	ldr r1, [r4]
	ldrb r0, [r1, 0x1B]
	subs r0, 0x1
	strb r0, [r1, 0x1B]
	ldr r0, [r4]
	ldr r1, _08133678 @ =0x000002c3
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, [r4]
	ldrb r0, [r1, 0x18]
	cmp r0, 0
	beq _0813367C
	movs r0, 0x1
	negs r0, r0
	bl sub_813360C
	b _08133796
	.align 2, 0
_08133670: .4byte gMain
_08133674: .4byte gUnknown_030007B0
_08133678: .4byte 0x000002c3
_0813367C:
	ldrb r0, [r1, 0x19]
	cmp r0, 0
	bne _08133684
	b _08133796
_08133684:
	subs r0, 0x1
	b _081336DC
_08133688:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081336E8
	ldr r4, _081336C8 @ =gUnknown_030007B0
	ldr r0, [r4]
	ldrb r1, [r0, 0x1B]
	ldrb r0, [r0, 0x1A]
	subs r0, 0x1
	cmp r1, r0
	blt _081336A0
	b _08133796
_081336A0:
	movs r0, 0x5
	bl PlaySE
	ldr r1, [r4]
	ldrb r0, [r1, 0x1B]
	adds r0, 0x1
	strb r0, [r1, 0x1B]
	ldr r0, [r4]
	ldr r3, _081336CC @ =0x000002c3
	adds r0, r3
	movs r1, 0x1
	strb r1, [r0]
	ldr r1, [r4]
	ldrb r0, [r1, 0x18]
	cmp r0, 0x2
	beq _081336D0
	movs r0, 0x1
	bl sub_813360C
	b _08133796
	.align 2, 0
_081336C8: .4byte gUnknown_030007B0
_081336CC: .4byte 0x000002c3
_081336D0:
	ldrb r2, [r1, 0x19]
	ldrb r0, [r1, 0x1A]
	subs r0, 0x3
	cmp r2, r0
	beq _08133796
	adds r0, r2, 0x1
_081336DC:
	strb r0, [r1, 0x19]
	ldr r1, [r4]
	ldrb r0, [r1, 0x1E]
	adds r0, 0x1
	strb r0, [r1, 0x1E]
	b _08133796
_081336E8:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0813376C
	movs r0, 0x5
	bl PlaySE
	ldr r5, _08133738 @ =gUnknown_030007B0
	ldr r2, [r5]
	ldrb r1, [r2, 0x1B]
	ldrb r0, [r2, 0x1A]
	subs r0, 0x1
	cmp r1, r0
	beq _08133748
	movs r0, 0x8
	strb r0, [r2]
	ldr r0, _0813373C @ =gStringVar2
	ldr r1, [r5]
	ldrb r3, [r1, 0x1B]
	lsls r2, r3, 1
	adds r2, r3
	lsls r2, 3
	adds r2, r3
	adds r2, 0x52
	adds r1, r2
	bl StringCopy
	ldr r4, _08133740 @ =gStringVar4
	ldr r1, _08133744 @ =gOtherText_TeachSpecificMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
	b _08133796
	.align 2, 0
_08133738: .4byte gUnknown_030007B0
_0813373C: .4byte gStringVar2
_08133740: .4byte gStringVar4
_08133744: .4byte gOtherText_TeachSpecificMove
_08133748:
	ldr r4, _08133764 @ =gStringVar4
	ldr r1, _08133768 @ =gOtherText_GiveUpTeachingMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r1, [r5]
	movs r0, 0xC
	strb r0, [r1]
	b _08133796
	.align 2, 0
_08133764: .4byte gStringVar4
_08133768: .4byte gOtherText_GiveUpTeachingMove
_0813376C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08133796
	movs r0, 0x5
	bl PlaySE
	ldr r0, _081337D4 @ =gUnknown_030007B0
	ldr r1, [r0]
	movs r0, 0xC
	strb r0, [r1]
	ldr r4, _081337D8 @ =gStringVar4
	ldr r1, _081337DC @ =gOtherText_GiveUpTeachingMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
_08133796:
	ldr r0, _081337D4 @ =gUnknown_030007B0
	ldr r4, [r0]
	ldrb r0, [r4, 0x1A]
	cmp r0, 0x3
	bls _081337F8
	ldr r3, _081337E0 @ =gSprites
	adds r5, r3, 0
	adds r5, 0xC6
	ldrb r0, [r5]
	movs r1, 0x5
	negs r1, r1
	adds r2, r1, 0
	ands r2, r0
	strb r2, [r5]
	movs r0, 0x85
	lsls r0, 1
	adds r0, r3
	mov r12, r0
	ldrb r0, [r0]
	adds r3, r1, 0
	ands r3, r0
	mov r1, r12
	strb r3, [r1]
	ldrb r0, [r4, 0x19]
	cmp r0, 0
	bne _081337E4
	movs r1, 0x4
	adds r0, r2, 0
	orrs r0, r1
	strb r0, [r5]
	b _081337F8
	.align 2, 0
_081337D4: .4byte gUnknown_030007B0
_081337D8: .4byte gStringVar4
_081337DC: .4byte gOtherText_GiveUpTeachingMove
_081337E0: .4byte gSprites
_081337E4:
	ldrb r1, [r4, 0x19]
	ldrb r0, [r4, 0x1A]
	subs r0, 0x3
	cmp r1, r0
	bne _081337F8
	movs r1, 0x4
	adds r0, r3, 0
	orrs r0, r1
	mov r3, r12
	strb r0, [r3]
_081337F8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_813362C

	thumb_func_start sub_8133800
sub_8133800: @ 8133800
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r1, _08133834 @ =gUnknown_030007B0
	ldr r0, [r1]
	ldrb r6, [r0, 0x19]
	ldr r3, _08133838 @ =gTileBuffer
	mov r10, r1
	ldr r0, _0813383C @ =gBattleMoves
	mov r9, r0
	movs r1, 0x2
	mov r8, r1
_0813381C:
	mov r4, r10
	ldr r2, [r4]
	ldrb r0, [r2, 0x1A]
	cmp r6, r0
	bcc _08133844
	adds r0, r3, 0
	ldr r1, _08133840 @ =gEmptyString_81E72B0
	movs r2, 0x90
	movs r3, 0
	bl sub_8072C74
	b _081338FA
	.align 2, 0
_08133834: .4byte gUnknown_030007B0
_08133838: .4byte gTileBuffer
_0813383C: .4byte gBattleMoves
_08133840: .4byte gEmptyString_81E72B0
_08133844:
	ldrb r0, [r2, 0x1A]
	subs r0, 0x1
	cmp r6, r0
	bne _08133860
	adds r0, r3, 0
	ldr r1, _0813385C @ =gUnknownText_Exit
	movs r2, 0x90
	movs r3, 0
	bl sub_8072C74
	b _081338FA
	.align 2, 0
_0813385C: .4byte gUnknownText_Exit
_08133860:
	lsls r1, r6, 1
	adds r0, r2, 0
	adds r0, 0x20
	adds r0, r1
	ldrh r5, [r0]
	movs r4, 0xB1
	lsls r4, 2
	adds r0, r2, r4
	ldrb r0, [r0]
	adds r7, r1, 0
	cmp r0, 0
	beq _081338A4
	ldr r1, _0813389C @ =gContestMoves
	lsls r0, r5, 3
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	lsrs r0, 27
	ldr r1, _081338A0 @ =gUnknown_083CAF70
	adds r0, r1
	ldr r1, [r0]
	adds r0, r3, 0
	movs r2, 0x27
	movs r3, 0
	bl sub_8072C74
	adds r3, r0, 0
	lsls r4, r5, 1
	b _081338C2
	.align 2, 0
_0813389C: .4byte gContestMoves
_081338A0: .4byte gUnknown_083CAF70
_081338A4:
	lsls r4, r5, 1
	adds r0, r4, r5
	lsls r0, 2
	add r0, r9
	ldrb r0, [r0, 0x2]
	lsls r1, r0, 3
	subs r1, r0
	ldr r0, _08133938 @ =gTypeNames
	adds r1, r0
	adds r0, r3, 0
	movs r2, 0x27
	movs r3, 0
	bl sub_8072C74
	adds r3, r0, 0
_081338C2:
	adds r0, r7, r6
	lsls r0, 3
	adds r0, r6
	adds r0, 0x52
	mov r2, r10
	ldr r1, [r2]
	adds r1, r0
	adds r0, r3, 0
	movs r2, 0x72
	movs r3, 0
	bl sub_8072C74
	adds r3, r0, 0
	movs r0, 0xCA
	strb r0, [r3]
	strb r0, [r3, 0x1]
	movs r0, 0xBA
	strb r0, [r3, 0x2]
	adds r3, 0x3
	adds r0, r4, r5
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x4]
	adds r0, r3, 0
	movs r2, 0x90
	movs r3, 0
	bl sub_8072C14
_081338FA:
	adds r3, r0, 0
	movs r0, 0xFE
	strb r0, [r3]
	adds r3, 0x1
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0x1
	negs r4, r4
	add r8, r4
	mov r0, r8
	cmp r0, 0
	blt _08133916
	b _0813381C
_08133916:
	movs r0, 0xFF
	strb r0, [r3]
	ldr r0, _0813393C @ =gTileBuffer
	movs r1, 0xB
	movs r2, 0x1
	bl MenuPrint
	movs r0, 0
	bl sub_813360C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08133938: .4byte gTypeNames
_0813393C: .4byte gTileBuffer
	thumb_func_end sub_8133800

	thumb_func_start sub_8133940
sub_8133940: @ 8133940
	push {r4-r7,lr}
	sub sp, 0x34
	adds r4, r1, 0
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _08133968 @ =gExpandedPlaceholder_Empty
	mov r0, sp
	bl StringCopy
	ldrb r0, [r4, 0x2]
	subs r0, 0x1
	cmp r0, 0x6
	bls _0813395C
	b _08133AE2
_0813395C:
	lsls r0, 2
	ldr r1, _0813396C @ =_08133970
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08133968: .4byte gExpandedPlaceholder_Empty
_0813396C: .4byte _08133970
	.align 2, 0
_08133970:
	.4byte _08133AE2
	.4byte _0813398C
	.4byte _08133AE2
	.4byte _081339A4
	.4byte _08133AE2
	.4byte _081339E4
	.4byte _08133A64
_0813398C:
	ldr r0, _081339A0 @ =gBattleMoves
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	cmp r0, 0x1
	bls _081339B4
	ldrb r1, [r1, 0x1]
	b _081339CE
	.align 2, 0
_081339A0: .4byte gBattleMoves
_081339A4:
	ldr r0, _081339C4 @ =gBattleMoves
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	bne _081339CC
_081339B4:
	ldr r1, _081339C8 @ =gOtherText_ThreeDashes2
	mov r0, sp
	movs r2, 0x20
	movs r3, 0x2
	bl sub_8072C74
	b _081339D8
	.align 2, 0
_081339C4: .4byte gBattleMoves
_081339C8: .4byte gOtherText_ThreeDashes2
_081339CC:
	ldrb r1, [r1, 0x3]
_081339CE:
	mov r0, sp
	movs r2, 0x20
	movs r3, 0x2
	bl sub_8072C14
_081339D8:
	ldrb r1, [r4]
	ldrb r2, [r4, 0x1]
	mov r0, sp
	bl MenuPrint
	b _08133AE2
_081339E4:
	ldrb r2, [r4]
	ldrb r1, [r4, 0x1]
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r2, 0
	bl MenuZeroFillWindowRect
	ldr r2, _08133A34 @ =gContestEffects
	ldr r1, _08133A38 @ =gContestMoves
	lsls r0, r5, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xFF
	bne _08133A14
	movs r5, 0
_08133A14:
	movs r4, 0
	ldr r7, _08133A3C @ =gUnknown_030007B0
	ldr r6, _08133A40 @ =gSprites
_08133A1A:
	cmp r4, r5
	bcs _08133A44
	ldr r0, [r7]
	adds r0, r4
	ldrb r1, [r0, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x1
	bl StartSpriteAnim
	b _08133A58
	.align 2, 0
_08133A34: .4byte gContestEffects
_08133A38: .4byte gContestMoves
_08133A3C: .4byte gUnknown_030007B0
_08133A40: .4byte gSprites
_08133A44:
	ldr r0, [r7]
	adds r0, r4
	ldrb r1, [r0, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0
	bl StartSpriteAnim
_08133A58:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08133A1A
	b _08133AE2
_08133A64:
	ldrb r2, [r4]
	ldrb r1, [r4, 0x1]
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r2, 0
	bl MenuZeroFillWindowRect
	ldr r2, _08133AB4 @ =gContestEffects
	ldr r1, _08133AB8 @ =gContestMoves
	lsls r0, r5, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xFF
	bne _08133A94
	movs r5, 0
_08133A94:
	movs r4, 0
	ldr r7, _08133ABC @ =gUnknown_030007B0
	ldr r6, _08133AC0 @ =gSprites
_08133A9A:
	cmp r4, r5
	bcs _08133AC4
	ldr r0, [r7]
	adds r0, r4
	ldrb r1, [r0, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x3
	bl StartSpriteAnim
	b _08133AD8
	.align 2, 0
_08133AB4: .4byte gContestEffects
_08133AB8: .4byte gContestMoves
_08133ABC: .4byte gUnknown_030007B0
_08133AC0: .4byte gSprites
_08133AC4:
	ldr r0, [r7]
	adds r0, r4
	ldrb r1, [r0, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x2
	bl StartSpriteAnim
_08133AD8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08133A9A
_08133AE2:
	add sp, 0x34
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8133940

	thumb_func_start sub_8133AEC
sub_8133AEC: @ 8133AEC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r6, _08133B88 @ =gUnknown_030007B0
	ldr r2, [r6]
	ldrb r1, [r2, 0x1B]
	ldrb r0, [r2, 0x1A]
	subs r0, 0x1
	cmp r1, r0
	bne _08133B08
	b _08133C04
_08133B08:
	lsls r1, 1
	adds r0, r2, 0
	adds r0, 0x20
	adds r0, r1
	ldrh r5, [r0]
	cmp r3, 0
	beq _08133BA0
	movs r4, 0
	lsls r0, r5, 3
	mov r8, r0
	ldr r7, _08133B8C @ =gSprites
	adds r3, r6, 0
	movs r6, 0x5
	negs r6, r6
_08133B24:
	ldr r0, [r3]
	adds r0, r4
	ldrb r0, [r0, 0x7]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _08133B24
	movs r4, 0
_08133B48:
	ldr r0, _08133B90 @ =gUnknown_08402E3D
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, _08133B94 @ =gUnknown_08402E24
	adds r1, r0
	adds r0, r5, 0
	bl sub_8133940
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _08133B48
	ldr r1, _08133B98 @ =gUnknown_083CADD4
	ldr r0, _08133B9C @ =gContestMoves
	add r0, r8
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x20
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r1, 0x58
	movs r2, 0x48
	movs r3, 0x90
	bl sub_8072AB0
	b _08133C92
	.align 2, 0
_08133B88: .4byte gUnknown_030007B0
_08133B8C: .4byte gSprites
_08133B90: .4byte gUnknown_08402E3D
_08133B94: .4byte gUnknown_08402E24
_08133B98: .4byte gUnknown_083CADD4
_08133B9C: .4byte gContestMoves
_08133BA0:
	movs r4, 0
	subs r6, r5, 0x1
_08133BA4:
	ldr r0, _08133BF8 @ =gUnknown_08402E39
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, _08133BFC @ =gUnknown_08402E24
	adds r1, r0
	adds r0, r5, 0
	bl sub_8133940
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _08133BA4
	ldr r1, _08133C00 @ =gMoveDescriptions
	lsls r0, r6, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0x58
	movs r2, 0x48
	movs r3, 0x90
	bl sub_8072A18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08133C92
	lsls r1, r0, 25
	movs r0, 0x90
	lsls r0, 20
	adds r1, r0
	lsrs r1, 24
	movs r0, 0xB
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuFillWindowRectWithBlankTile
	b _08133C92
	.align 2, 0
_08133BF8: .4byte gUnknown_08402E39
_08133BFC: .4byte gUnknown_08402E24
_08133C00: .4byte gMoveDescriptions
_08133C04:
	cmp r3, 0
	beq _08133C5C
	ldr r4, _08133C54 @ =gUnknown_08402E24
	ldrb r2, [r4, 0xF]
	ldrb r1, [r4, 0x10]
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r2, 0
	bl MenuZeroFillWindowRect
	ldrb r2, [r4, 0x12]
	ldrb r1, [r4, 0x13]
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r2, 0
	bl MenuZeroFillWindowRect
	movs r4, 0
	ldr r5, _08133C58 @ =gSprites
	adds r3, r6, 0
	movs r2, 0x4
_08133C32:
	ldr r0, [r3]
	adds r0, r4
	ldrb r1, [r0, 0x7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _08133C32
	b _08133C86
	.align 2, 0
_08133C54: .4byte gUnknown_08402E24
_08133C58: .4byte gSprites
_08133C5C:
	ldr r4, _08133CA0 @ =gUnknown_08402E24
	ldrb r0, [r4, 0x3]
	ldrb r1, [r4, 0x4]
	adds r2, r0, 0x3
	lsls r2, 24
	lsrs r2, 24
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	ldrb r0, [r4, 0x9]
	ldrb r1, [r4, 0xA]
	adds r2, r0, 0x3
	lsls r2, 24
	lsrs r2, 24
	adds r3, r1, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
_08133C86:
	movs r0, 0xB
	movs r1, 0x9
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuZeroFillWindowRect
_08133C92:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08133CA0: .4byte gUnknown_08402E24
	thumb_func_end sub_8133AEC

	thumb_func_start sub_8133CA4
sub_8133CA4: @ 8133CA4
	push {lr}
	movs r0, 0x15
	movs r1, 0x7
	movs r2, 0x1B
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	ldr r0, _08133CC8 @ =gUnknown_030007B0
	ldr r0, [r0]
	movs r1, 0xB1
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8133AEC
	pop {r0}
	bx r0
	.align 2, 0
_08133CC8: .4byte gUnknown_030007B0
	thumb_func_end sub_8133CA4

	.align 2, 0 @ Don't pad with nop.
