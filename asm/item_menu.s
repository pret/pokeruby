	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80A79EC
sub_80A79EC: @ 80A79EC
	push {r4-r6,lr}
	adds r2, r0, 0
	movs r0, 0x34
	ldrsh r4, [r2, r0]
	cmp r4, 0
	beq _080A79FE
	cmp r4, 0x1
	beq _080A7A54
	b _080A7A8A
_080A79FE:
	ldr r5, _080A7A28 @ =gUnknown_0203855B
	ldrb r6, [r5]
	movs r0, 0
	ldrsb r0, [r5, r0]
	cmp r0, 0x6
	beq _080A7A2C
	adds r3, r2, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x2A
	strb r6, [r0]
	movs r1, 0x1
	negs r1, r1
	adds r0, r1, 0
	strb r0, [r5]
	b _080A7A8A
	.align 2, 0
_080A7A28: .4byte gUnknown_0203855B
_080A7A2C:
	adds r3, r2, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x2A
	strb r4, [r0]
	ldrh r0, [r2, 0x22]
	subs r0, 0x4
	strh r0, [r2, 0x22]
	movs r0, 0x4
	strh r0, [r2, 0x2E]
	movs r0, 0x1
	strh r0, [r2, 0x34]
	adds r0, r2, 0
	bl sub_80A7AE4
	b _080A7A8A
_080A7A54:
	ldrh r4, [r2, 0x2E]
	movs r0, 0x2E
	ldrsh r3, [r2, r0]
	cmp r3, 0
	beq _080A7A7C
	ldrh r1, [r2, 0x30]
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080A7A72
	ldrh r0, [r2, 0x22]
	adds r0, 0x1
	strh r0, [r2, 0x22]
	subs r0, r4, 0x1
	strh r0, [r2, 0x2E]
_080A7A72:
	adds r0, r1, 0x1
	movs r1, 0x1
	ands r0, r1
	strh r0, [r2, 0x30]
	b _080A7A8A
_080A7A7C:
	ldr r1, _080A7A90 @ =gUnknown_0203855B
	movs r4, 0x1
	negs r4, r4
	adds r0, r4, 0
	strb r0, [r1]
	strh r3, [r2, 0x30]
	strh r3, [r2, 0x34]
_080A7A8A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7A90: .4byte gUnknown_0203855B
	thumb_func_end sub_80A79EC

	thumb_func_start sub_80A7A94
sub_80A7A94: @ 80A7A94
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080A7AA6
	cmp r0, 0x1
	beq _080A7AC8
	b _080A7ADC
_080A7AA6:
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080A7AC4 @ =gSpriteAffineAnimTable_83C1CC4
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	movs r0, 0x1
	strh r0, [r4, 0x36]
	b _080A7ADC
	.align 2, 0
_080A7AC4: .4byte gSpriteAffineAnimTable_83C1CC4
_080A7AC8:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _080A7ADC
	adds r0, r4, 0
	bl sub_80A7AE4
_080A7ADC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7A94

	thumb_func_start sub_80A7AE4
sub_80A7AE4: @ 80A7AE4
	push {lr}
	ldr r2, _080A7B0C @ =gUnknown_0203855C
	movs r1, 0
	strb r1, [r2]
	ldrb r2, [r0, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	strb r1, [r0, 0x1]
	movs r1, 0
	strh r1, [r0, 0x32]
	strh r1, [r0, 0x36]
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	pop {r0}
	bx r0
	.align 2, 0
_080A7B0C: .4byte gUnknown_0203855C
	thumb_func_end sub_80A7AE4

	thumb_func_start CreateBagSprite
CreateBagSprite: @ 80A7B10
	push {lr}
	ldr r0, _080A7B24 @ =gSpriteTemplate_83C1CE0
	movs r1, 0x3A
	movs r2, 0x28
	movs r3, 0
	bl CreateSprite
	pop {r0}
	bx r0
	.align 2, 0
_080A7B24: .4byte gSpriteTemplate_83C1CE0
	thumb_func_end CreateBagSprite

	thumb_func_start sub_80A7B28
sub_80A7B28: @ 80A7B28
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r4, 0x34]
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_80A7B6C
	ldr r0, _080A7B44 @ =sub_80A7B6C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7B44: .4byte sub_80A7B6C
	thumb_func_end sub_80A7B28

	thumb_func_start sub_80A7B48
sub_80A7B48: @ 80A7B48
	ldrh r2, [r0, 0x38]
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	movs r3, 0x1
	ands r1, r3
	subs r2, r1
	adds r1, r0, 0
	adds r1, 0x28
	strb r2, [r1]
	ldrh r2, [r0, 0x3A]
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	ands r1, r3
	subs r2, r1
	adds r0, 0x29
	strb r2, [r0]
	bx lr
	thumb_func_end sub_80A7B48

	thumb_func_start sub_80A7B6C
sub_80A7B6C: @ 80A7B6C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x3C
	ldrsh r2, [r4, r0]
	cmp r2, 0
	beq _080A7C16
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080A7B86
	cmp r0, 0x1
	beq _080A7BD4
	b _080A7C16
_080A7B86:
	ldrb r0, [r4, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r0
	movs r0, 0x1
	orrs r1, r0
	strb r1, [r4, 0x1]
	cmp r2, 0x1
	bne _080A7BA0
	ldr r0, _080A7B9C @ =gSpriteAffineAnimTable_83C1D20
	b _080A7BA2
	.align 2, 0
_080A7B9C: .4byte gSpriteAffineAnimTable_83C1D20
_080A7BA0:
	ldr r0, _080A7BD0 @ =gSpriteAffineAnimTable_83C1D20 + 0x4
_080A7BA2:
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	movs r0, 0x1
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x3A]
	adds r0, r4, 0
	bl sub_80A7B48
	b _080A7C16
	.align 2, 0
_080A7BD0: .4byte gSpriteAffineAnimTable_83C1D20 + 0x4
_080A7BD4:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_80A7B48
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _080A7C16
	strh r5, [r4, 0x2E]
	strh r5, [r4, 0x34]
	ldrh r1, [r4, 0x38]
	adds r0, r4, 0
	adds r0, 0x28
	strb r1, [r0]
	ldrh r0, [r4, 0x3A]
	adds r1, r4, 0
	adds r1, 0x29
	strb r0, [r1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080A7C1C @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_080A7C16:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C1C: .4byte SpriteCallbackDummy
	thumb_func_end sub_80A7B6C

	thumb_func_start CreateBagPokeballSprite
CreateBagPokeballSprite: @ 80A7C20
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080A7C54 @ =gUnknown_083C1D30
	bl LoadSpritePalette
	ldr r0, _080A7C58 @ =gSpriteTemplate_83C1D38
	movs r1, 0x10
	movs r2, 0x58
	movs r3, 0
	bl CreateSprite
	ldr r1, _080A7C5C @ =gUnknown_02038568
	strb r0, [r1]
	ldr r2, _080A7C60 @ =gSprites
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x3C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C54: .4byte gUnknown_083C1D30
_080A7C58: .4byte gSpriteTemplate_83C1D38
_080A7C5C: .4byte gUnknown_02038568
_080A7C60: .4byte gSprites
	thumb_func_end CreateBagPokeballSprite

	thumb_func_start sub_80A7C64
sub_80A7C64: @ 80A7C64
	push {r4,r5,lr}
	movs r0, 0x8
	bl FreeSpritePaletteByTag
	ldr r5, _080A7C98 @ =gSprites
	ldr r4, _080A7C9C @ =gUnknown_02038568
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C98: .4byte gSprites
_080A7C9C: .4byte gUnknown_02038568
	thumb_func_end sub_80A7C64

	thumb_func_start sub_80A7CA0
sub_80A7CA0: @ 80A7CA0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r4, r1, 0
	movs r2, 0x80
	lsls r2, 4
	adds r0, r4, 0
	movs r1, 0
	bl memset
	movs r0, 0x80
	lsls r0, 1
	adds r4, r0
	movs r7, 0
_080A7CBE:
	adds r4, 0x20
	movs r5, 0
	adds r1, r7, 0x1
	mov r8, r1
_080A7CC6:
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0x20
	bl memcpy
	adds r4, 0x20
	adds r6, 0x20
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080A7CC6
	cmp r7, 0x5
	beq _080A7CE4
	adds r4, 0x20
_080A7CE4:
	mov r1, r8
	lsls r0, r1, 24
	lsrs r7, r0, 24
	cmp r7, 0x5
	bls _080A7CBE
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A7CA0

	thumb_func_start sub_80A7CF8
sub_80A7CF8: @ 80A7CF8
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2A
	bne _080A7D44
	bl IsEnigmaBerryValid
	cmp r0, 0x1
	bne _080A7D44
	ldr r4, _080A7D34 @ =gSaveBlock1 + 0x317C
	ldr r1, _080A7D38 @ =0x02000000
	adds r0, r4, 0
	bl sub_80A7CA0
	movs r0, 0x90
	lsls r0, 3
	adds r4, r0
	str r4, [sp]
	ldr r1, _080A7D3C @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	ldr r1, _080A7D40 @ =0x00007544
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpritePalette
	b _080A7D72
	.align 2, 0
_080A7D34: .4byte gSaveBlock1 + 0x317C
_080A7D38: .4byte 0x02000000
_080A7D3C: .4byte 0xffff0000
_080A7D40: .4byte 0x00007544
_080A7D44:
	ldr r5, _080A7D7C @ =gBerryGraphicsTable
	lsls r4, 3
	adds r0, r5, 0x4
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [sp]
	mov r1, sp
	ldr r0, _080A7D80 @ =0x00007544
	strh r0, [r1, 0x4]
	mov r0, sp
	bl LoadCompressedObjectPalette
	adds r4, r5
	ldr r0, [r4]
	ldr r4, _080A7D84 @ =0x02001000
	adds r1, r4, 0
	bl sub_800D238
	ldr r0, _080A7D88 @ =0xfffff000
	adds r1, r4, r0
	adds r0, r4, 0
	bl sub_80A7CA0
_080A7D72:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7D7C: .4byte gBerryGraphicsTable
_080A7D80: .4byte 0x00007544
_080A7D84: .4byte 0x02001000
_080A7D88: .4byte 0xfffff000
	thumb_func_end sub_80A7CF8

	thumb_func_start sub_80A7D8C
sub_80A7D8C: @ 80A7D8C
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	bl sub_80A7CF8
	ldr r0, _080A7DC0 @ =gSpriteTemplate_83C1D74
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A7DC0: .4byte gSpriteTemplate_83C1D74
	thumb_func_end sub_80A7D8C

	thumb_func_start sub_80A7DC4
sub_80A7DC4: @ 80A7DC4
	ldr r1, _080A7DD0 @ =gUnknown_030041B4
	ldrh r1, [r1]
	negs r1, r1
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_080A7DD0: .4byte gUnknown_030041B4
	thumb_func_end sub_80A7DC4

	thumb_func_start sub_80A7DD4
sub_80A7DD4: @ 80A7DD4
	push {lr}
	ldr r0, _080A7DE8 @ =0x00007544
	bl FreeSpritePaletteByTag
	movs r0, 0x8
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_080A7DE8: .4byte 0x00007544
	thumb_func_end sub_80A7DD4

	thumb_func_start sub_80A7DEC
sub_80A7DEC: @ 80A7DEC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	mov r8, r3
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _080A7E50 @ =0x00007544
	bl FreeSpritePaletteByTag
	adds r0, r4, 0
	bl sub_80A7CF8
	ldr r0, _080A7E54 @ =gSpriteTemplate_83C1E04
	adds r1, r5, 0
	adds r2, r6, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	adds r4, r1, 0
	mov r0, r8
	cmp r0, 0x1
	bne _080A7E42
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080A7E58 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080A7E42:
	adds r0, r4, 0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A7E50: .4byte 0x00007544
_080A7E54: .4byte gSpriteTemplate_83C1E04
_080A7E58: .4byte gSprites
	thumb_func_end sub_80A7DEC

	thumb_func_start sub_80A7E5C
sub_80A7E5C: @ 80A7E5C
	push {lr}
	adds r1, r0, 0
	ldr r0, _080A7E78 @ =gSpriteTemplate_83C1F98
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x63
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080A7E78: .4byte gSpriteTemplate_83C1F98
	thumb_func_end sub_80A7E5C

	.align 2, 0 @ Don't pad with nop.
