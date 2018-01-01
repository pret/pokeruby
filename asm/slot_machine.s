	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

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
