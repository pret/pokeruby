	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start unref_sub_807B69C
unref_sub_807B69C: @ 807B69C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0807B740 @ =gUnknown_02024BE0
	adds r0, r4, r0
	ldrb r6, [r0]
	ldr r0, _0807B744 @ =sub_807B7E0
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0807B748 @ =gBattleAnimPicTable + (136 * 8)
	bl LoadCompressedObjectPic
	ldr r0, _0807B74C @ =gBattleAnimPaletteTable + (136 * 8)
	bl LoadCompressedObjectPalette
	ldr r1, _0807B750 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r1, r0, r1
	strh r4, [r1, 0x8]
	cmp r5, 0
	beq _0807B75C
	movs r0, 0x1F
	strh r0, [r1, 0xA]
	movs r5, 0
	lsls r0, r6, 4
	ldr r7, _0807B754 @ =gSprites
	adds r0, r6
	lsls r0, 2
	adds r6, r0, r7
_0807B6F0:
	movs r0, 0x20
	ldrsh r1, [r6, r0]
	ldrh r2, [r6, 0x22]
	adds r2, 0x20
	lsls r2, 16
	asrs r2, 16
	ldr r0, _0807B758 @ =gSpriteTemplate_83931F8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r3, r0, r7
	lsls r0, r5, 1
	adds r0, r5
	lsls r1, r0, 4
	adds r0, r1
	strh r0, [r3, 0x2E]
	movs r0, 0xFF
	lsls r0, 8
	strh r0, [r3, 0x30]
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	cmp r5, 0x4
	bls _0807B734
	movs r0, 0x15
	strh r0, [r3, 0x3A]
_0807B734:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x9
	bls _0807B6F0
	b _0807B7BC
	.align 2, 0
_0807B740: .4byte gUnknown_02024BE0
_0807B744: .4byte sub_807B7E0
_0807B748: .4byte gBattleAnimPicTable + (136 * 8)
_0807B74C: .4byte gBattleAnimPaletteTable + (136 * 8)
_0807B750: .4byte gTasks
_0807B754: .4byte gSprites
_0807B758: .4byte gSpriteTemplate_83931F8
_0807B75C:
	movs r0, 0xF8
	lsls r0, 7
	strh r0, [r1, 0xA]
	movs r5, 0
	lsls r0, r6, 4
	ldr r7, _0807B7D8 @ =gSprites
	adds r0, r6
	lsls r0, 2
	adds r6, r0, r7
_0807B76E:
	movs r2, 0x20
	ldrsh r1, [r6, r2]
	ldrh r2, [r6, 0x22]
	subs r2, 0x20
	lsls r2, 16
	asrs r2, 16
	ldr r0, _0807B7DC @ =gSpriteTemplate_83931F8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r3, r0, r7
	lsls r0, r5, 1
	adds r0, r5
	lsls r1, r0, 4
	adds r0, r1
	strh r0, [r3, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r3, 0x30]
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	cmp r5, 0x4
	bls _0807B7B2
	movs r0, 0x15
	strh r0, [r3, 0x3A]
_0807B7B2:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x9
	bls _0807B76E
_0807B7BC:
	ldr r0, _0807B7D8 @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x3C]
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807B7D8: .4byte gSprites
_0807B7DC: .4byte gSpriteTemplate_83931F8
	thumb_func_end unref_sub_807B69C

	thumb_func_start sub_807B7E0
sub_807B7E0: @ 807B7E0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0807B838 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0xC]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0x2
	bne _0807B866
	movs r0, 0
	strh r0, [r4, 0xC]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 20
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r0, 16
	ldrb r2, [r4, 0x10]
	ldrh r3, [r4, 0xA]
	movs r1, 0x10
	bl BlendPalette
	ldrh r2, [r4, 0x12]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0807B83C
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _0807B86A
	movs r0, 0x1
	eors r0, r2
	strh r0, [r4, 0x12]
	b _0807B86A
	.align 2, 0
_0807B838: .4byte gTasks
_0807B83C:
	ldrh r1, [r4, 0x10]
	subs r0, r1, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bge _0807B86A
	strh r1, [r4, 0x10]
	movs r0, 0x1
	eors r0, r2
	strh r0, [r4, 0x12]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _0807B86A
	adds r0, r5, 0
	bl DestroyTask
	b _0807B86A
_0807B866:
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
_0807B86A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807B7E0

	thumb_func_start sub_807B870
sub_807B870: @ 807B870
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x3A]
	movs r3, 0x3A
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _0807B89C
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r3]
	ldr r1, _0807B898 @ =sub_807B8A4
	str r1, [r2, 0x1C]
	adds r0, r2, 0
	bl _call_via_r1
	b _0807B8A0
	.align 2, 0
_0807B898: .4byte sub_807B8A4
_0807B89C:
	subs r0, r1, 0x1
	strh r0, [r2, 0x3A]
_0807B8A0:
	pop {r0}
	bx r0
	thumb_func_end sub_807B870

	thumb_func_start sub_807B8A4
sub_807B8A4: @ 807B8A4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x20
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Sin
	strh r0, [r4, 0x26]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	bgt _0807B8D0
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1D
	b _0807B8D6
_0807B8D0:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1F
_0807B8D6:
	strb r0, [r1]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x8
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x34
	bne _0807B918
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0807B912
	adds r0, r4, 0
	bl DestroySpriteAndFreeResources
	b _0807B918
_0807B912:
	adds r0, r4, 0
	bl DestroySprite
_0807B918:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807B8A4

	thumb_func_start sub_807B920
sub_807B920: @ 807B920
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r4, _0807B9B0 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	ldr r1, _0807B9B4 @ =0xffe00000
	adds r0, r1
	lsrs r5, r0, 16
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	ldr r2, _0807B9B8 @ =0xffdc0000
	adds r0, r2
	lsrs r4, r0, 16
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0807B95E
	lsls r0, r5, 16
	ldr r1, _0807B9BC @ =0xfffa0000
	adds r0, r1
	lsrs r5, r0, 16
_0807B95E:
	ldr r1, _0807B9C0 @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0807B9C4 @ =gSpriteTemplate_83931E0
	lsls r1, r5, 16
	asrs r1, 16
	lsls r2, r4, 16
	asrs r2, 16
	movs r3, 0x4
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _0807B9C8 @ =gSprites
	adds r0, r1
	ldr r1, _0807B9CC @ =gSubspriteTables_83931D8
	bl SetSubspriteTables
	ldr r1, _0807B9D0 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x26]
	ldr r1, _0807B9D4 @ =sub_807B9D8
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B9B0: .4byte gUnknown_0202F7C9
_0807B9B4: .4byte 0xffe00000
_0807B9B8: .4byte 0xffdc0000
_0807B9BC: .4byte 0xfffa0000
_0807B9C0: .4byte REG_BLDCNT
_0807B9C4: .4byte gSpriteTemplate_83931E0
_0807B9C8: .4byte gSprites
_0807B9CC: .4byte gSubspriteTables_83931D8
_0807B9D0: .4byte gTasks
_0807B9D4: .4byte sub_807B9D8
	thumb_func_end sub_807B920

	thumb_func_start sub_807B9D8
sub_807B9D8: @ 807B9D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807BA04 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	adds r2, r0, 0
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _0807BA0C
	ldr r0, _0807BA08 @ =sub_807BA24
	str r0, [r1]
	movs r0, 0
	strh r0, [r1, 0xA]
	b _0807BA1C
	.align 2, 0
_0807BA04: .4byte gTasks
_0807BA08: .4byte sub_807BA24
_0807BA0C:
	lsls r0, r2, 24
	lsrs r0, 24
	ldr r2, _0807BA20 @ =REG_BLDALPHA
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	strh r1, [r2]
_0807BA1C:
	pop {r0}
	bx r0
	.align 2, 0
_0807BA20: .4byte REG_BLDALPHA
	thumb_func_end sub_807B9D8

	thumb_func_start sub_807BA24
sub_807BA24: @ 807BA24
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0807BABC @ =0x0000271a
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0807BAC0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0xA]
	adds r1, r0, 0x1
	strh r1, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD
	ble _0807BAB4
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _0807BAB4
	ldr r3, _0807BAC4 @ =gPlttBufferFaded
	lsls r2, 4
	mov r12, r2
	ldr r1, _0807BAC8 @ =0x0000010d
	add r1, r12
	lsls r1, 1
	adds r1, r3
	ldrh r4, [r1]
	movs r2, 0x87
	lsls r2, 1
	add r2, r12
	lsls r2, 1
	adds r2, r3
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r0, _0807BACC @ =0x0000010f
	add r0, r12
	lsls r0, 1
	adds r0, r3
	ldrh r1, [r0]
	strh r1, [r2]
	strh r4, [r0]
	strh r6, [r5, 0xC]
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _0807BAB4
	strh r6, [r5, 0xE]
	strh r6, [r5, 0xA]
	ldrh r0, [r5, 0x10]
	adds r0, 0x1
	strh r0, [r5, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _0807BAB4
	movs r0, 0x9
	strh r0, [r5, 0xA]
	ldr r0, _0807BAD0 @ =sub_807BAD4
	str r0, [r5]
_0807BAB4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BABC: .4byte 0x0000271a
_0807BAC0: .4byte gTasks
_0807BAC4: .4byte gPlttBufferFaded
_0807BAC8: .4byte 0x0000010d
_0807BACC: .4byte 0x0000010f
_0807BAD0: .4byte sub_807BAD4
	thumb_func_end sub_807BA24

	thumb_func_start sub_807BAD4
sub_807BAD4: @ 807BAD4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807BB04 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r2
	ldrh r0, [r2, 0xA]
	subs r0, 0x1
	adds r3, r0, 0
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0807BB0C
	ldr r0, _0807BB08 @ =sub_807BB24
	str r0, [r2]
	movs r0, 0
	strh r0, [r2, 0xA]
	b _0807BB1C
	.align 2, 0
_0807BB04: .4byte gTasks
_0807BB08: .4byte sub_807BB24
_0807BB0C:
	lsls r0, r3, 24
	lsrs r0, 24
	ldr r2, _0807BB20 @ =REG_BLDALPHA
	movs r1, 0x10
	subs r1, r0
	lsls r1, 8
	orrs r1, r0
	strh r1, [r2]
_0807BB1C:
	pop {r0}
	bx r0
	.align 2, 0
_0807BB20: .4byte REG_BLDALPHA
	thumb_func_end sub_807BAD4

	thumb_func_start sub_807BB24
sub_807BB24: @ 807BB24
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	ldr r1, _0807BB64 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r1
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x25
	bne _0807BB6C
	ldrh r0, [r1, 0x26]
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807BB68 @ =gSprites
	adds r4, r0
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	b _0807BB7E
	.align 2, 0
_0807BB64: .4byte gTasks
_0807BB68: .4byte gSprites
_0807BB6C:
	cmp r0, 0x27
	bne _0807BB7E
	ldr r0, _0807BB84 @ =REG_BLDCNT
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, r2, 0
	bl move_anim_task_del
_0807BB7E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BB84: .4byte REG_BLDCNT
	thumb_func_end sub_807BB24

	thumb_func_start sub_807BB88
sub_807BB88: @ 807BB88
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r3, 0
	ldr r0, _0807BBA8 @ =0x02017840
	ldrh r0, [r0]
	subs r0, 0xF
	cmp r0, 0x2B
	bls _0807BB9C
	b _0807BD20
_0807BB9C:
	lsls r0, 2
	ldr r1, _0807BBAC @ =_0807BBB0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807BBA8: .4byte 0x02017840
_0807BBAC: .4byte _0807BBB0
	.align 2, 0
_0807BBB0:
	.4byte _0807BC60
	.4byte _0807BC66
	.4byte _0807BC6C
	.4byte _0807BC72
	.4byte _0807BC78
	.4byte _0807BC7E
	.4byte _0807BC84
	.4byte _0807BC8A
	.4byte _0807BC90
	.4byte _0807BC96
	.4byte _0807BC9C
	.4byte _0807BCA2
	.4byte _0807BCA8
	.4byte _0807BCAE
	.4byte _0807BD20
	.4byte _0807BD20
	.4byte _0807BD20
	.4byte _0807BD20
	.4byte _0807BD20
	.4byte _0807BD20
	.4byte _0807BD20
	.4byte _0807BD20
	.4byte _0807BD20
	.4byte _0807BD20
	.4byte _0807BCB4
	.4byte _0807BCB8
	.4byte _0807BCBC
	.4byte _0807BCC0
	.4byte _0807BCC4
	.4byte _0807BCC8
	.4byte _0807BCCC
	.4byte _0807BCD0
	.4byte _0807BCD8
	.4byte _0807BCE0
	.4byte _0807BCE8
	.4byte _0807BCF0
	.4byte _0807BCF8
	.4byte _0807BD00
	.4byte _0807BD20
	.4byte _0807BD20
	.4byte _0807BD08
	.4byte _0807BD0C
	.4byte _0807BD10
	.4byte _0807BD18
_0807BC60:
	movs r5, 0
	movs r2, 0
	b _0807BD28
_0807BC66:
	movs r5, 0
	movs r2, 0x1
	b _0807BD28
_0807BC6C:
	movs r5, 0
	movs r2, 0x3
	b _0807BD28
_0807BC72:
	movs r5, 0
	movs r2, 0x5
	b _0807BD28
_0807BC78:
	movs r5, 0
	movs r2, 0x6
	b _0807BD28
_0807BC7E:
	movs r5, 0
	movs r2, 0x2
	b _0807BD28
_0807BC84:
	movs r5, 0
	movs r2, 0x4
	b _0807BD28
_0807BC8A:
	movs r5, 0x1
	movs r2, 0
	b _0807BD28
_0807BC90:
	movs r5, 0x1
	movs r2, 0x1
	b _0807BD28
_0807BC96:
	movs r5, 0x1
	movs r2, 0x3
	b _0807BD28
_0807BC9C:
	movs r5, 0x1
	movs r2, 0x5
	b _0807BD28
_0807BCA2:
	movs r5, 0x1
	movs r2, 0x6
	b _0807BD28
_0807BCA8:
	movs r5, 0x1
	movs r2, 0x2
	b _0807BD28
_0807BCAE:
	movs r5, 0x1
	movs r2, 0x4
	b _0807BD28
_0807BCB4:
	movs r5, 0
	b _0807BCD2
_0807BCB8:
	movs r5, 0
	b _0807BCDA
_0807BCBC:
	movs r5, 0
	b _0807BCE2
_0807BCC0:
	movs r5, 0
	b _0807BCEA
_0807BCC4:
	movs r5, 0
	b _0807BCF2
_0807BCC8:
	movs r5, 0
	b _0807BCFA
_0807BCCC:
	movs r5, 0
	b _0807BD02
_0807BCD0:
	movs r5, 0x1
_0807BCD2:
	movs r2, 0
	movs r3, 0x1
	b _0807BD28
_0807BCD8:
	movs r5, 0x1
_0807BCDA:
	movs r2, 0x1
	movs r3, 0x1
	b _0807BD28
_0807BCE0:
	movs r5, 0x1
_0807BCE2:
	movs r2, 0x3
	movs r3, 0x1
	b _0807BD28
_0807BCE8:
	movs r5, 0x1
_0807BCEA:
	movs r2, 0x5
	movs r3, 0x1
	b _0807BD28
_0807BCF0:
	movs r5, 0x1
_0807BCF2:
	movs r2, 0x6
	movs r3, 0x1
	b _0807BD28
_0807BCF8:
	movs r5, 0x1
_0807BCFA:
	movs r2, 0x2
	movs r3, 0x1
	b _0807BD28
_0807BD00:
	movs r5, 0x1
_0807BD02:
	movs r2, 0x4
	movs r3, 0x1
	b _0807BD28
_0807BD08:
	movs r5, 0
	b _0807BD12
_0807BD0C:
	movs r5, 0
	b _0807BD1A
_0807BD10:
	movs r5, 0x1
_0807BD12:
	movs r2, 0xFF
	movs r3, 0
	b _0807BD28
_0807BD18:
	movs r5, 0x1
_0807BD1A:
	movs r2, 0xFF
	movs r3, 0x1
	b _0807BD28
_0807BD20:
	adds r0, r4, 0
	bl move_anim_task_del
	b _0807BD4A
_0807BD28:
	ldr r0, _0807BD50 @ =gBattleAnimArgs
	movs r1, 0
	strh r5, [r0]
	strh r2, [r0, 0x2]
	strh r1, [r0, 0x4]
	strh r1, [r0, 0x6]
	strh r3, [r0, 0x8]
	ldr r1, _0807BD54 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0807BD58 @ =sub_80E32E0
	str r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
_0807BD4A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BD50: .4byte gBattleAnimArgs
_0807BD54: .4byte gTasks
_0807BD58: .4byte sub_80E32E0
	thumb_func_end sub_807BB88

	thumb_func_start move_anim_start_t2
move_anim_start_t2: @ 807BD5C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _0807BD98 @ =gUnknown_0202F7C8
	strb r4, [r0]
	ldr r0, _0807BD9C @ =gUnknown_0202F7C9
	strb r4, [r0]
	ldr r0, _0807BDA0 @ =gBattleAnims_StatusConditions
	movs r2, 0
	bl move_something
	ldr r0, _0807BDA4 @ =sub_807BDAC
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807BDA8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BD98: .4byte gUnknown_0202F7C8
_0807BD9C: .4byte gUnknown_0202F7C9
_0807BDA0: .4byte gBattleAnims_StatusConditions
_0807BDA4: .4byte sub_807BDAC
_0807BDA8: .4byte gTasks
	thumb_func_end move_anim_start_t2

	thumb_func_start sub_807BDAC
sub_807BDAC: @ 807BDAC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0807BDF0 @ =gUnknown_0202F7AC
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _0807BDF4 @ =gUnknown_0202F7B1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807BDEA
	ldr r1, _0807BDF8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _0807BDFC @ =0x02017810
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_0807BDEA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BDF0: .4byte gUnknown_0202F7AC
_0807BDF4: .4byte gUnknown_0202F7B1
_0807BDF8: .4byte gTasks
_0807BDFC: .4byte 0x02017810
	thumb_func_end sub_807BDAC

	.align 2, 0 @ Don't pad with nop.
