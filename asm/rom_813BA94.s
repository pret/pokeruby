	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_813CAF4
sub_813CAF4: @ 813CAF4
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0813CB2C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r4, 0x26]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bne _0813CB18
	b _0813CC28
_0813CB18:
	cmp r0, 0x4
	bgt _0813CB30
	cmp r0, 0x2
	beq _0813CB60
	cmp r0, 0x2
	bgt _0813CBC4
	cmp r0, 0
	beq _0813CB46
	b _0813CC8E
	.align 2, 0
_0813CB2C: .4byte gTasks
_0813CB30:
	cmp r0, 0x1E
	beq _0813CBEE
	cmp r0, 0x1E
	bgt _0813CB3E
	cmp r0, 0x14
	beq _0813CB8A
	b _0813CC8E
_0813CB3E:
	cmp r0, 0x28
	bne _0813CB44
	b _0813CC56
_0813CB44:
	b _0813CC8E
_0813CB46:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xE5
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0813CB5C @ =REG_BG2CNT
	strh r6, [r0]
	movs r0, 0xFF
	strh r0, [r4, 0x8]
	b _0813CC8E
	.align 2, 0
_0813CB5C: .4byte REG_BG2CNT
_0813CB60:
	ldr r0, _0813CBB0 @ =0x0000ffff
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _0813CBB4 @ =REG_BG2CNT
	ldr r2, _0813CBB8 @ =0x00000e07
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xC
	movs r2, 0xF5
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	strh r6, [r4, 0xA]
	strh r6, [r4, 0xC]
	movs r0, 0x14
	strh r0, [r4, 0x8]
_0813CB8A:
	ldr r2, _0813CBBC @ =REG_BG2VOFS
	ldr r0, _0813CBC0 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xA]
	strh r0, [r2]
	subs r2, 0x2
	ldrh r0, [r1, 0xC]
	strh r0, [r2]
	ldrh r0, [r1, 0xA]
	adds r0, 0x6
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xC]
	subs r0, 0x8
	strh r0, [r1, 0xC]
	b _0813CC8E
	.align 2, 0
_0813CBB0: .4byte 0x0000ffff
_0813CBB4: .4byte REG_BG2CNT
_0813CBB8: .4byte 0x00000e07
_0813CBBC: .4byte REG_BG2VOFS
_0813CBC0: .4byte gTasks
_0813CBC4:
	ldr r0, _0813CC14 @ =0x0000ffff
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _0813CC18 @ =REG_BG2CNT
	ldr r2, _0813CC1C @ =0x00000e07
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xC
	movs r2, 0xF5
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	strh r6, [r4, 0xA]
	strh r6, [r4, 0xC]
	movs r0, 0x1E
	strh r0, [r4, 0x8]
_0813CBEE:
	ldr r2, _0813CC20 @ =REG_BG2VOFS
	ldr r0, _0813CC24 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xA]
	strh r0, [r2]
	subs r2, 0x2
	ldrh r0, [r1, 0xC]
	strh r0, [r2]
	ldrh r0, [r1, 0xA]
	subs r0, 0x6
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xC]
	adds r0, 0x8
	strh r0, [r1, 0xC]
	b _0813CC8E
	.align 2, 0
_0813CC14: .4byte 0x0000ffff
_0813CC18: .4byte REG_BG2CNT
_0813CC1C: .4byte 0x00000e07
_0813CC20: .4byte REG_BG2VOFS
_0813CC24: .4byte gTasks
_0813CC28:
	ldr r0, _0813CC98 @ =0x000037f7
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0x5
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0813CC9C @ =REG_BG2CNT
	ldr r2, _0813CCA0 @ =0x00000e07
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xC
	movs r2, 0xF5
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	strh r6, [r4, 0xA]
	strh r6, [r4, 0xC]
	movs r0, 0x8
	strh r0, [r4, 0xE]
	movs r0, 0x28
	strh r0, [r4, 0x8]
_0813CC56:
	ldr r2, _0813CCA4 @ =REG_BG2VOFS
	ldr r1, _0813CCA8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r1
	ldrh r0, [r3, 0xA]
	strh r0, [r2]
	ldr r1, _0813CCAC @ =REG_BG2HOFS
	ldrh r0, [r3, 0xC]
	strh r0, [r1]
	ldrh r0, [r3, 0xA]
	ldrh r2, [r3, 0xE]
	subs r0, r2
	strh r0, [r3, 0xA]
	ldrh r1, [r3, 0xC]
	adds r0, r2, r1
	strh r0, [r3, 0xC]
	ldrh r1, [r3, 0x26]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0813CC8E
	lsls r0, r2, 16
	cmp r0, 0
	beq _0813CC8E
	subs r0, r2, 0x1
	strh r0, [r3, 0xE]
_0813CC8E:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813CC98: .4byte 0x000037f7
_0813CC9C: .4byte REG_BG2CNT
_0813CCA0: .4byte 0x00000e07
_0813CCA4: .4byte REG_BG2VOFS
_0813CCA8: .4byte gTasks
_0813CCAC: .4byte REG_BG2HOFS
	thumb_func_end sub_813CAF4

	thumb_func_start intro_reset_and_hide_bgs
intro_reset_and_hide_bgs: @ 813CCB0
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x1C
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x3E
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	thumb_func_end intro_reset_and_hide_bgs

	thumb_func_start sub_813CCE8
sub_813CCE8: @ 813CCE8
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0813CD0C @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _0813CD28
	lsls r0, 2
	ldr r1, _0813CD10 @ =_0813CD14
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813CD0C: .4byte gTasks
_0813CD10: .4byte _0813CD14
	.align 2, 0
_0813CD14:
	.4byte _0813CD28
	.4byte _0813CD5C
	.4byte _0813CD8C
	.4byte _0813CDA8
	.4byte _0813CDFC
_0813CD28:
	ldr r1, _0813CD54 @ =REG_BLDCNT
	ldr r4, _0813CD58 @ =0x00003f50
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r4, 0x80
	lsls r4, 5
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0
	strh r0, [r1]
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r2
	movs r1, 0x40
	strh r1, [r0, 0xA]
	movs r1, 0x1
	strh r1, [r0, 0x8]
	b _0813CE26
	.align 2, 0
_0813CD54: .4byte REG_BLDCNT
_0813CD58: .4byte 0x00003f50
_0813CD5C:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r2
	ldrh r1, [r2, 0xA]
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _0813CD78
	subs r0, r1, 0x1
	strh r0, [r2, 0xA]
	movs r4, 0xA
	ldrsh r0, [r2, r4]
	b _0813CDC2
_0813CD78:
	ldr r1, _0813CD84 @ =REG_BLDALPHA
	ldr r0, _0813CD88 @ =gUnknown_08393E64
	ldrh r0, [r0]
	strh r0, [r1]
	movs r0, 0x80
	b _0813CDEA
	.align 2, 0
_0813CD84: .4byte REG_BLDALPHA
_0813CD88: .4byte gUnknown_08393E64
_0813CD8C:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r1, r0, r2
	ldrh r0, [r1, 0xA]
	movs r3, 0xA
	ldrsh r2, [r1, r3]
	cmp r2, 0
	bne _0813CE0E
	strh r2, [r1, 0xA]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0813CE26
_0813CDA8:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r2
	ldrh r1, [r2, 0xA]
	movs r4, 0xA
	ldrsh r0, [r2, r4]
	cmp r0, 0x3D
	bgt _0813CDE0
	adds r0, r1, 0x1
	strh r0, [r2, 0xA]
	movs r1, 0xA
	ldrsh r0, [r2, r1]
_0813CDC2:
	lsrs r1, r0, 31
	adds r0, r1
	movs r2, 0xFF
	lsls r2, 1
	ldr r3, _0813CDD8 @ =REG_BLDALPHA
	ldr r1, _0813CDDC @ =gUnknown_08393E64
	ands r0, r2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r3]
	b _0813CE26
	.align 2, 0
_0813CDD8: .4byte REG_BLDALPHA
_0813CDDC: .4byte gUnknown_08393E64
_0813CDE0:
	ldr r1, _0813CDF4 @ =REG_BLDALPHA
	ldr r0, _0813CDF8 @ =gUnknown_08393E64
	ldrh r0, [r0, 0x3E]
	strh r0, [r1]
	movs r0, 0x10
_0813CDEA:
	strh r0, [r2, 0xA]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _0813CE26
	.align 2, 0
_0813CDF4: .4byte REG_BLDALPHA
_0813CDF8: .4byte gUnknown_08393E64
_0813CDFC:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r1, r0, r2
	ldrh r0, [r1, 0xA]
	movs r4, 0xA
	ldrsh r2, [r1, r4]
	cmp r2, 0
	beq _0813CE14
_0813CE0E:
	subs r0, 0x1
	strh r0, [r1, 0xA]
	b _0813CE26
_0813CE14:
	ldr r0, _0813CE2C @ =REG_BLDCNT
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, r3, 0
	bl DestroyTask
_0813CE26:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813CE2C: .4byte REG_BLDCNT
	thumb_func_end sub_813CCE8

	thumb_func_start sub_813CE30
sub_813CE30: @ 813CE30
	push {r4,lr}
	sub sp, 0x24
	lsls r2, 16
	lsrs r2, 16
	movs r4, 0x80
	lsls r4, 8
	str r4, [sp]
	str r4, [sp, 0x4]
	mov r4, sp
	strh r0, [r4, 0x8]
	mov r0, sp
	strh r1, [r0, 0xA]
	strh r2, [r0, 0xC]
	strh r2, [r0, 0xE]
	strh r3, [r0, 0x10]
	add r4, sp, 0x14
	adds r1, r4, 0
	movs r2, 0x1
	bl BgAffineSet
	ldr r1, _0813CE84 @ =REG_BG2PA
	ldrh r0, [r4]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x4]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x6]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, [r4, 0x8]
	str r0, [r1]
	adds r1, 0x4
	ldr r0, [r4, 0xC]
	str r0, [r1]
	add sp, 0x24
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813CE84: .4byte REG_BG2PA
	thumb_func_end sub_813CE30

	thumb_func_start sub_813CE88
sub_813CE88: @ 813CE88
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r4, [sp, 0x30]
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	lsls r3, 16
	lsrs r3, 16
	mov r8, r3
	lsls r4, 24
	lsrs r6, r4, 24
	cmp r6, 0
	beq _0813CEF0
	lsls r0, r7, 3
	ldr r1, _0813CEE4 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _0813CEE8 @ =gMonFrontPicCoords
	lsls r2, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r5, _0813CEEC @ =gUnknown_0840B5A0
	mov r6, r8
	lsls r4, r6, 2
	adds r4, r5
	ldr r4, [r4]
	str r4, [sp]
	str r7, [sp, 0x4]
	movs r4, 0
	str r4, [sp, 0x8]
	movs r4, 0x1
	str r4, [sp, 0xC]
	bl sub_800D378
	b _0813CF1C
	.align 2, 0
_0813CEE4: .4byte gMonFrontPicTable
_0813CEE8: .4byte gMonFrontPicCoords
_0813CEEC: .4byte gUnknown_0840B5A0
_0813CEF0:
	lsls r0, r7, 3
	ldr r1, _0813CF90 @ =gMonBackPicTable
	adds r0, r1
	ldr r1, _0813CF94 @ =gMonBackPicCoords
	lsls r2, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _0813CF98 @ =gUnknown_0840B5A0
	mov r12, r4
	mov r5, r8
	lsls r4, r5, 2
	add r4, r12
	ldr r4, [r4]
	str r4, [sp]
	str r7, [sp, 0x4]
	str r6, [sp, 0x8]
	str r6, [sp, 0xC]
	bl sub_800D378
_0813CF1C:
	ldr r2, _0813CF9C @ =0x0000ffff
	adds r0, r7, 0
	movs r1, 0
	bl species_and_otid_get_pal
	mov r6, r8
	lsls r4, r6, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r1, r6, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_8143648
	ldr r0, _0813CFA0 @ =gUnknown_02024E8C
	mov r3, r9
	lsls r1, r3, 16
	asrs r1, 16
	mov r5, r10
	lsls r2, r5, 16
	asrs r2, 16
	mov r3, r8
	adds r3, 0x1
	lsls r3, 26
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813CFA4 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r4
	movs r3, 0xD
	negs r3, r3
	ands r1, r3
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2, 0x5]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0813CF90: .4byte gMonBackPicTable
_0813CF94: .4byte gMonBackPicCoords
_0813CF98: .4byte gUnknown_0840B5A0
_0813CF9C: .4byte 0x0000ffff
_0813CFA0: .4byte gUnknown_02024E8C
_0813CFA4: .4byte gSprites
	thumb_func_end sub_813CE88

	thumb_func_start sub_813CFA8
sub_813CFA8: @ 813CFA8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r9, r1
	mov r10, r2
	adds r6, r3, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	lsls r6, 16
	lsrs r6, 16
	lsls r7, r0, 3
	ldr r1, _0813D068 @ =gTrainerBackPicTable
	mov r8, r1
	add r8, r7
	ldr r1, _0813D06C @ =gTrainerBackPicCoords
	lsls r2, r0, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r5, _0813D070 @ =gUnknown_0840B5A0
	lsls r4, r6, 2
	adds r4, r5
	ldr r4, [r4]
	str r4, [sp]
	str r0, [sp, 0x4]
	mov r0, r8
	bl DecompressPicFromTable_2
	ldr r0, _0813D074 @ =gTrainerBackPicPaletteTable
	adds r0, r7, r0
	ldr r0, [r0]
	lsls r4, r6, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r1, r6, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8143680
	ldr r0, _0813D078 @ =gUnknown_02024E8C
	ldr r1, _0813D07C @ =gUnknown_0840B064
	str r1, [r0, 0x8]
	mov r1, r9
	lsls r1, 16
	asrs r1, 16
	mov r9, r1
	mov r2, r10
	lsls r2, 16
	asrs r2, 16
	mov r10, r2
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0813D080 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r4
	movs r3, 0xD
	negs r3, r3
	ands r1, r3
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2, 0x5]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0813D068: .4byte gTrainerBackPicTable
_0813D06C: .4byte gTrainerBackPicCoords
_0813D070: .4byte gUnknown_0840B5A0
_0813D074: .4byte gTrainerBackPicPaletteTable
_0813D078: .4byte gUnknown_02024E8C
_0813D07C: .4byte gUnknown_0840B064
_0813D080: .4byte gSprites
	thumb_func_end sub_813CFA8

	thumb_func_start sub_813D084
sub_813D084: @ 813D084
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0813D0A0
	cmp r0, 0x1
	ble _0813D096
	cmp r0, 0x2
	beq _0813D0A8
_0813D096:
	ldr r2, _0813D09C @ =0x00003ff6
	b _0813D0AA
	.align 2, 0
_0813D09C: .4byte 0x00003ff6
_0813D0A0:
	ldr r2, _0813D0A4 @ =0x000031df
	b _0813D0AA
	.align 2, 0
_0813D0A4: .4byte 0x000031df
_0813D0A8:
	ldr r2, _0813D0C0 @ =0x0000518c
_0813D0AA:
	ldr r0, _0813D0C4 @ =gPlttBufferUnfaded
	movs r1, 0xF1
	lsls r1, 1
	adds r0, r1
	strh r2, [r0]
	ldr r0, _0813D0C8 @ =gPlttBufferFaded
	adds r0, r1
	strh r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0813D0C0: .4byte 0x0000518c
_0813D0C4: .4byte gPlttBufferUnfaded
_0813D0C8: .4byte gPlttBufferFaded
	thumb_func_end sub_813D084

	thumb_func_start sub_813D0CC
sub_813D0CC: @ 813D0CC
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0xBF
	ble _0813D148
	ldrh r1, [r4, 0x34]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0813D0EA
	subs r0, r1, 0x1
	strh r0, [r4, 0x34]
	b _0813D14E
_0813D0EA:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x32]
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 5
	subs r0, r1
	movs r1, 0x64
	bl __divsi3
	strh r0, [r4, 0x32]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	adds r0, r1, 0
	subs r0, 0xC0
	cmp r0, 0
	bge _0813D12C
	adds r0, 0x7F
_0813D12C:
	asrs r0, 7
	adds r0, 0x9
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xF
	bls _0813D13A
	movs r0, 0xF
_0813D13A:
	lsls r2, r0, 4
	ldrb r1, [r4, 0x5]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	b _0813D14E
_0813D148:
	adds r0, r4, 0
	bl DestroySprite
_0813D14E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_813D0CC

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

	thumb_func_start GetCurrentTrainerHillMapId
GetCurrentTrainerHillMapId: @ 813E980
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
	thumb_func_end GetCurrentTrainerHillMapId

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

	thumb_func_start sub_813EB4C
sub_813EB4C: @ 813EB4C
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
	thumb_func_end sub_813EB4C

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

	thumb_func_start sub_813EDBC
sub_813EDBC: @ 813EDBC
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
	thumb_func_end sub_813EDBC

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

	thumb_func_start FieldInitRegionMap
FieldInitRegionMap: @ 813EEB4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	bl SetVBlankCallback
	ldr r2, _0813EED8 @ =0x02000000
	ldr r0, _0813EEDC @ =0x00000888
	adds r1, r2, r0
	movs r0, 0
	strh r0, [r1]
	str r4, [r2]
	ldr r0, _0813EEE0 @ =CB2_FieldInitRegionMap
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EED8: .4byte 0x02000000
_0813EEDC: .4byte 0x00000888
_0813EEE0: .4byte CB2_FieldInitRegionMap
	thumb_func_end FieldInitRegionMap

	thumb_func_start CB2_FieldInitRegionMap
CB2_FieldInitRegionMap: @ 813EEE4
	push {r4,lr}
	sub sp, 0x4
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x10
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0813EF98 @ =0x02000008
	movs r1, 0
	bl sub_80FA8EC
	movs r0, 0
	movs r1, 0
	bl sub_80FBCF0
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80FBB3C
	ldr r4, _0813EF9C @ =gWindowConfig_81E709C
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	ldr r1, _0813EFA0 @ =REG_BG0CNT
	movs r2, 0xF8
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0x15
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x3
	bl MenuDrawTextWindow
	ldr r0, _0813EFA4 @ =gOtherText_Hoenn
	movs r1, 0x16
	movs r2, 0x1
	movs r3, 0x38
	bl sub_8072BD8
	movs r0, 0x10
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	bl sub_813F0C8
	ldr r0, _0813EFA8 @ =CB2_FieldRegionMap
	bl SetMainCallback2
	ldr r0, _0813EFAC @ =VBlankCB_FieldRegionMap
	bl SetVBlankCallback
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EF98: .4byte 0x02000008
_0813EF9C: .4byte gWindowConfig_81E709C
_0813EFA0: .4byte REG_BG0CNT
_0813EFA4: .4byte gOtherText_Hoenn
_0813EFA8: .4byte CB2_FieldRegionMap
_0813EFAC: .4byte VBlankCB_FieldRegionMap
	thumb_func_end CB2_FieldInitRegionMap

	thumb_func_start VBlankCB_FieldRegionMap
VBlankCB_FieldRegionMap: @ 813EFB0
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_FieldRegionMap

	thumb_func_start CB2_FieldRegionMap
CB2_FieldRegionMap: @ 813EFC4
	push {lr}
	bl sub_813EFDC
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end CB2_FieldRegionMap

	thumb_func_start sub_813EFDC
sub_813EFDC: @ 813EFDC
	push {lr}
	sub sp, 0x4
	ldr r1, _0813EFF8 @ =0x02000000
	ldr r2, _0813EFFC @ =0x00000888
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _0813F0B8
	lsls r0, 2
	ldr r1, _0813F000 @ =_0813F004
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813EFF8: .4byte 0x02000000
_0813EFFC: .4byte 0x00000888
_0813F000: .4byte _0813F004
	.align 2, 0
_0813F004:
	.4byte _0813F018
	.4byte _0813F030
	.4byte _0813F04C
	.4byte _0813F078
	.4byte _0813F0A0
_0813F018:
	movs r1, 0x80
	lsls r1, 19
	ldr r3, _0813F028 @ =0x00001541
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0813F02C @ =0x00000888
	adds r1, r2, r0
	b _0813F08E
	.align 2, 0
_0813F028: .4byte 0x00001541
_0813F02C: .4byte 0x00000888
_0813F030:
	ldr r0, _0813F044 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813F0B8
	ldr r3, _0813F048 @ =0x00000888
	adds r1, r2, r3
	b _0813F08E
	.align 2, 0
_0813F044: .4byte gPaletteFade
_0813F048: .4byte 0x00000888
_0813F04C:
	bl sub_80FAB60
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0813F05E
	bl sub_813F0C8
	b _0813F0B8
_0813F05E:
	cmp r0, 0x3
	blt _0813F0B8
	cmp r0, 0x5
	bgt _0813F0B8
	ldr r1, _0813F070 @ =0x02000000
	ldr r0, _0813F074 @ =0x00000888
	adds r1, r0
	b _0813F08E
	.align 2, 0
_0813F070: .4byte 0x02000000
_0813F074: .4byte 0x00000888
_0813F078:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0813F098 @ =0x02000000
	ldr r2, _0813F09C @ =0x00000888
	adds r1, r2
_0813F08E:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0813F0B8
	.align 2, 0
_0813F098: .4byte 0x02000000
_0813F09C: .4byte 0x00000888
_0813F0A0:
	ldr r0, _0813F0C0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813F0B8
	bl sub_80FAB10
	ldr r0, _0813F0C4 @ =0x02000000
	ldr r0, [r0]
	bl SetMainCallback2
_0813F0B8:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0813F0C0: .4byte gPaletteFade
_0813F0C4: .4byte 0x02000000
	thumb_func_end sub_813EFDC

	thumb_func_start sub_813F0C8
sub_813F0C8: @ 813F0C8
	push {lr}
	movs r0, 0x11
	movs r1, 0x11
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuFillWindowRectWithBlankTile
	ldr r1, _0813F0F0 @ =0x02000000
	ldrb r0, [r1, 0x1E]
	cmp r0, 0
	beq _0813F0EA
	adds r0, r1, 0
	adds r0, 0x8
	movs r1, 0x11
	movs r2, 0x11
	bl MenuPrint
_0813F0EA:
	pop {r0}
	bx r0
	.align 2, 0
_0813F0F0: .4byte 0x02000000
	thumb_func_end sub_813F0C8

	thumb_func_start unref_sub_813F0F4
unref_sub_813F0F4: @ 813F0F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x10]
	ldr r0, _0813F2AC @ =gUnknown_0202F7C8
	ldrb r3, [r0]
	ldr r0, _0813F2B0 @ =gUnknown_030042C4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0813F2B4 @ =gUnknown_03004240
	strh r1, [r0]
	ldr r1, _0813F2B8 @ =REG_WININ
	ldr r2, _0813F2BC @ =0x00003f3f
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r4, _0813F2C0 @ =0x00003f3d
	adds r0, r4, 0
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r4, 0x80
	lsls r4, 8
	adds r1, r4, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0813F2C4 @ =REG_BLDCNT
	ldr r2, _0813F2C8 @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r4, 0x80
	lsls r4, 5
	adds r0, r4, 0
	strh r0, [r1]
	ldr r2, _0813F2CC @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	mov r9, r0
	ands r0, r1
	movs r1, 0x4
	mov r8, r1
	mov r4, r8
	orrs r0, r4
	strb r0, [r2]
	ldr r0, _0813F2D0 @ =gUnknown_03004340
	adds r3, r0
	ldrb r0, [r3]
	ldr r1, _0813F2D4 @ =gSprites
	mov r10, r1
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r10
	ldrb r7, [r4, 0x6]
	ldrh r6, [r4, 0x38]
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0813F2D8 @ =SpriteCallbackDummy
	bl object_new_hidden_with_callback
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
	ldr r0, _0813F2D8 @ =SpriteCallbackDummy
	bl object_new_hidden_with_callback
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x18]
	ldrb r1, [r4, 0x5]
	mov r0, r9
	ands r0, r1
	mov r2, r8
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r5, r7, 4
	adds r5, r7
	lsls r5, 2
	add r5, r10
	ldrb r1, [r5, 0x5]
	mov r0, r9
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	add r1, r10
	ldrb r2, [r1, 0x5]
	mov r0, r9
	ands r0, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldr r0, [sp, 0x14]
	lsls r6, r0, 4
	adds r6, r0
	lsls r6, 2
	mov r1, r10
	adds r7, r6, r1
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0x44
	bl memcpy
	ldr r2, [sp, 0x18]
	lsls r4, r2, 4
	adds r4, r2
	lsls r4, 2
	adds r0, r4, 0
	add r0, r10
	mov r8, r0
	adds r1, r5, 0
	movs r2, 0x44
	bl memcpy
	ldrb r1, [r7, 0x1]
	mov r0, r9
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r7, 0x1]
	mov r2, r8
	ldrb r0, [r2, 0x1]
	mov r2, r9
	ands r2, r0
	orrs r2, r1
	mov r0, r8
	strb r2, [r0, 0x1]
	movs r1, 0x1C
	add r10, r1
	add r6, r10
	ldr r2, _0813F2D8 @ =SpriteCallbackDummy
	str r2, [r6]
	add r4, r10
	str r2, [r4]
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r2, _0813F2DC @ =0x040000d4
	add r0, sp, 0xC
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0813F2E0 @ =0x85000400
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _0813F2E4 @ =gUnknown_08D2EE48
	bl LZDecompressVram
	ldr r0, _0813F2E8 @ =gUnknown_08D2EDFC
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _0813F2EC @ =gUnknown_08D2E150
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, _0813F2F0 @ =gUnknown_030042C0
	ldrh r0, [r7, 0x20]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r1]
	ldr r1, _0813F2F4 @ =gUnknown_030041B4
	ldrh r0, [r7, 0x22]
	negs r0, r0
	subs r0, 0x20
	strh r0, [r1]
	ldr r1, _0813F2F8 @ =gTasks
	ldr r4, [sp, 0x10]
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0xA0
	lsls r1, 2
	strh r1, [r0, 0xA]
	mov r1, sp
	ldrh r1, [r1, 0x14]
	strh r1, [r0, 0x8]
	mov r2, sp
	ldrh r2, [r2, 0x18]
	strh r2, [r0, 0xC]
	ldr r1, _0813F2FC @ =sub_813F300
	str r1, [r0]
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813F2AC: .4byte gUnknown_0202F7C8
_0813F2B0: .4byte gUnknown_030042C4
_0813F2B4: .4byte gUnknown_03004240
_0813F2B8: .4byte REG_WININ
_0813F2BC: .4byte 0x00003f3f
_0813F2C0: .4byte 0x00003f3d
_0813F2C4: .4byte REG_BLDCNT
_0813F2C8: .4byte 0x00003f42
_0813F2CC: .4byte REG_BG1CNT
_0813F2D0: .4byte gUnknown_03004340
_0813F2D4: .4byte gSprites
_0813F2D8: .4byte SpriteCallbackDummy
_0813F2DC: .4byte 0x040000d4
_0813F2E0: .4byte 0x85000400
_0813F2E4: .4byte gUnknown_08D2EE48
_0813F2E8: .4byte gUnknown_08D2EDFC
_0813F2EC: .4byte gUnknown_08D2E150
_0813F2F0: .4byte gUnknown_030042C0
_0813F2F4: .4byte gUnknown_030041B4
_0813F2F8: .4byte gTasks
_0813F2FC: .4byte sub_813F300
	thumb_func_end unref_sub_813F0F4

	thumb_func_start sub_813F300
sub_813F300: @ 813F300
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0813F34C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	mov r9, r0
	ldr r1, _0813F350 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0xA]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	movs r3, 0
	strh r1, [r4, 0x22]
	ldr r2, _0813F354 @ =gUnknown_030041B4
	lsls r0, r1, 16
	lsrs r0, 24
	ldrh r5, [r2]
	adds r0, r5
	strh r0, [r2]
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r4, 0x22]
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0813F394
	cmp r0, 0x1
	bgt _0813F358
	cmp r0, 0
	beq _0813F35E
	b _0813F4B2
	.align 2, 0
_0813F34C: .4byte gUnknown_0202F7C8
_0813F350: .4byte gTasks
_0813F354: .4byte gUnknown_030041B4
_0813F358:
	cmp r0, 0x2
	beq _0813F3AC
	b _0813F4B2
_0813F35E:
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bgt _0813F36E
	b _0813F4B2
_0813F36E:
	strh r3, [r4, 0x1E]
	ldrh r1, [r4, 0x20]
	adds r1, 0x1
	strh r1, [r4, 0x20]
	ldr r2, _0813F390 @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x8
	beq _0813F38C
	b _0813F4B2
_0813F38C:
	b _0813F3A4
	.align 2, 0
_0813F390: .4byte REG_BLDALPHA
_0813F394:
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	beq _0813F3A4
	b _0813F4B2
_0813F3A4:
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	b _0813F4B2
_0813F3AC:
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0813F4B2
	strh r3, [r4, 0x1E]
	ldrh r1, [r4, 0x20]
	subs r1, 0x1
	strh r1, [r4, 0x20]
	ldr r6, _0813F4C0 @ =REG_BLDALPHA
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r6]
	movs r3, 0x20
	ldrsh r5, [r4, r3]
	cmp r5, 0
	bne _0813F4B2
	movs r0, 0
	bl sub_8076464
	ldr r0, _0813F4C4 @ =gUnknown_030042C4
	strh r5, [r0]
	ldr r0, _0813F4C8 @ =gUnknown_03004240
	strh r5, [r0]
	ldr r0, _0813F4CC @ =REG_WININ
	ldr r2, _0813F4D0 @ =0x00003f3f
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0813F406
	ldr r2, _0813F4D4 @ =REG_BG1CNT
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0813F406:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	eors r0, r1
	strh r0, [r2]
	ldr r0, _0813F4D8 @ =REG_BLDCNT
	strh r5, [r0]
	strh r5, [r6]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0813F4DC @ =gSprites
	mov r8, r1
	add r0, r8
	bl DestroySprite
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	bl DestroySprite
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp, 0x4]
	str r5, [sp, 0xC]
	ldr r1, _0813F4E0 @ =0x040000d4
	add r0, sp, 0xC
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _0813F4E4 @ =0x85000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r2, _0813F4D4 @ =REG_BG1CNT
	ldrb r1, [r2, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	ldr r0, _0813F4E8 @ =gUnknown_03004340
	add r0, r9
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r6, [r1, 0x6]
	ldrh r4, [r1, 0x38]
	lsls r4, 24
	lsrs r4, 24
	ldrb r3, [r1, 0x5]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	movs r5, 0x4
	orrs r0, r5
	strb r0, [r1, 0x5]
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	add r1, r8
	ldrb r3, [r1, 0x5]
	adds r0, r2, 0
	ands r0, r3
	orrs r0, r5
	strb r0, [r1, 0x5]
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	add r0, r8
	ldrb r1, [r0, 0x5]
	ands r2, r1
	orrs r2, r5
	strb r2, [r0, 0x5]
	adds r0, r7, 0
	bl move_anim_task_del
_0813F4B2:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813F4C0: .4byte REG_BLDALPHA
_0813F4C4: .4byte gUnknown_030042C4
_0813F4C8: .4byte gUnknown_03004240
_0813F4CC: .4byte REG_WININ
_0813F4D0: .4byte 0x00003f3f
_0813F4D4: .4byte REG_BG1CNT
_0813F4D8: .4byte REG_BLDCNT
_0813F4DC: .4byte gSprites
_0813F4E0: .4byte 0x040000d4
_0813F4E4: .4byte 0x85000200
_0813F4E8: .4byte gUnknown_03004340
	thumb_func_end sub_813F300

	thumb_func_start sub_813F4EC
sub_813F4EC: @ 813F4EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	ldr r1, _0813F5D0 @ =gUnknown_03004340
	ldr r0, _0813F5D4 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	ldr r7, _0813F5D8 @ =gSprites
	lsls r6, r0, 4
	adds r6, r0
	lsls r6, 2
	adds r6, r7
	ldrb r0, [r6, 0x6]
	str r0, [sp, 0x4]
	ldrh r4, [r6, 0x38]
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813F5DC @ =0x0000d709
	bl AllocSpritePalette
	mov r8, r0
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	ldr r0, _0813F5E0 @ =0x0000d70a
	bl AllocSpritePalette
	mov r9, r0
	mov r2, r9
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	ldrb r0, [r6, 0x5]
	lsrs r0, 4
	lsls r0, 4
	movs r1, 0x80
	lsls r1, 1
	adds r3, r1, 0
	orrs r0, r3
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	adds r5, r7
	ldrb r4, [r5, 0x5]
	lsrs r4, 4
	lsls r4, 4
	orrs r4, r3
	lsls r0, 1
	ldr r2, _0813F5E4 @ =gPlttBufferUnfaded
	mov r10, r2
	add r0, r10
	mov r1, r8
	lsls r1, 4
	mov r8, r1
	adds r1, r3, r1
	movs r2, 0x20
	str r3, [sp, 0x8]
	bl LoadPalette
	lsls r4, 1
	add r4, r10
	mov r2, r9
	lsls r2, 4
	mov r9, r2
	ldr r3, [sp, 0x8]
	add r3, r9
	adds r0, r4, 0
	adds r1, r3, 0
	movs r2, 0x20
	bl LoadPalette
	ldrb r1, [r6, 0x5]
	movs r2, 0xF
	adds r0, r2, 0
	ands r0, r1
	mov r3, r8
	orrs r0, r3
	strb r0, [r6, 0x5]
	ldr r0, [sp, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r3, [r1, 0x5]
	adds r0, r2, 0
	ands r0, r3
	mov r3, r8
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r5, 0x5]
	ands r2, r0
	mov r0, r9
	orrs r2, r0
	strb r2, [r5, 0x5]
	ldr r0, [sp]
	bl move_anim_task_del
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813F5D0: .4byte gUnknown_03004340
_0813F5D4: .4byte gUnknown_0202F7C8
_0813F5D8: .4byte gSprites
_0813F5DC: .4byte 0x0000d709
_0813F5E0: .4byte 0x0000d70a
_0813F5E4: .4byte gPlttBufferUnfaded
	thumb_func_end sub_813F4EC

	thumb_func_start sub_813F5E8
sub_813F5E8: @ 813F5E8
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _0813F684 @ =gUnknown_03004340
	ldr r0, _0813F688 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _0813F68C @ =gSprites
	mov r9, r1
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	add r5, r9
	ldrb r0, [r5, 0x6]
	mov r10, r0
	ldrh r6, [r5, 0x38]
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0813F690 @ =0x0000d709
	bl FreeSpritePaletteByTag
	ldr r0, _0813F694 @ =0x0000d70a
	bl FreeSpritePaletteByTag
	ldr r0, _0813F698 @ =0x0000d6ff
	bl IndexOfSpritePaletteTag
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813F69C @ =0x0000d704
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsls r4, 4
	ldrb r2, [r5, 0x5]
	movs r3, 0xF
	adds r1, r3, 0
	ands r1, r2
	orrs r1, r4
	strb r1, [r5, 0x5]
	mov r1, r10
	lsls r2, r1, 4
	add r2, r10
	lsls r2, 2
	add r2, r9
	ldrb r5, [r2, 0x5]
	adds r1, r3, 0
	ands r1, r5
	orrs r1, r4
	strb r1, [r2, 0x5]
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	add r1, r9
	lsrs r0, 20
	ldrb r2, [r1, 0x5]
	ands r3, r2
	orrs r3, r0
	strb r3, [r1, 0x5]
	mov r0, r8
	bl move_anim_task_del
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813F684: .4byte gUnknown_03004340
_0813F688: .4byte gUnknown_0202F7C8
_0813F68C: .4byte gSprites
_0813F690: .4byte 0x0000d709
_0813F694: .4byte 0x0000d70a
_0813F698: .4byte 0x0000d6ff
_0813F69C: .4byte 0x0000d704
	thumb_func_end sub_813F5E8

	thumb_func_start sub_813F6A0
sub_813F6A0: @ 813F6A0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813F6C0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0813F6C4 @ =gUnknown_03004B00
	ldrh r0, [r2]
	strh r0, [r1, 0x1C]
	ldrh r0, [r2, 0x2]
	strh r0, [r1, 0x1E]
	ldr r0, _0813F6C8 @ =sub_813F6CC
	str r0, [r1]
	bx lr
	.align 2, 0
_0813F6C0: .4byte gTasks
_0813F6C4: .4byte gUnknown_03004B00
_0813F6C8: .4byte sub_813F6CC
	thumb_func_end sub_813F6A0

	thumb_func_start sub_813F6CC
sub_813F6CC: @ 813F6CC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0813F718 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r6, 0
	adds r1, r0, 0x1
	strh r1, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x1E
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _0813F78C
	strh r6, [r4, 0x8]
	ldr r0, _0813F71C @ =0x0000d709
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r2, r0, 24
	movs r3, 0x1C
	ldrsh r0, [r4, r3]
	movs r1, 0x2
	cmp r0, 0
	bne _0813F70A
	movs r1, 0x6
_0813F70A:
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _0813F720
	cmp r0, 0x1
	beq _0813F75C
	b _0813F78C
	.align 2, 0
_0813F718: .4byte gTasks
_0813F71C: .4byte 0x0000d709
_0813F720:
	ldrh r0, [r4, 0xC]
	adds r0, 0x2
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _0813F732
	movs r0, 0x10
	strh r0, [r4, 0xC]
_0813F732:
	lsls r0, r2, 4
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2
	orrs r0, r1
	ldrb r2, [r4, 0xC]
	ldr r3, _0813F758 @ =0x00007f74
	movs r1, 0x1
	bl BlendPalette
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0x10
	bne _0813F78C
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _0813F78C
	.align 2, 0
_0813F758: .4byte 0x00007f74
_0813F75C:
	ldrh r0, [r4, 0xC]
	subs r0, 0x2
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bge _0813F76A
	strh r6, [r4, 0xC]
_0813F76A:
	lsls r0, r2, 4
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2
	orrs r0, r1
	ldrb r2, [r4, 0xC]
	ldr r3, _0813F794 @ =0x00007f74
	movs r1, 0x1
	bl BlendPalette
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _0813F78C
	adds r0, r5, 0
	bl move_anim_task_del
_0813F78C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813F794: .4byte 0x00007f74
	thumb_func_end sub_813F6CC

	thumb_func_start sub_813F798
sub_813F798: @ 813F798
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0813F7C4 @ =gUnknown_02024BE0
	ldr r0, _0813F7C8 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r5, [r0]
	ldr r1, _0813F7CC @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0813F7E6
	cmp r0, 0x1
	bgt _0813F7D0
	cmp r0, 0
	beq _0813F7D6
	b _0813F838
	.align 2, 0
_0813F7C4: .4byte gUnknown_02024BE0
_0813F7C8: .4byte gUnknown_0202F7C8
_0813F7CC: .4byte gTasks
_0813F7D0:
	cmp r0, 0x2
	beq _0813F818
	b _0813F838
_0813F7D6:
	adds r0, r5, 0
	movs r1, 0
	bl sub_8078E70
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0x1C]
	b _0813F80A
_0813F7E6:
	ldrh r0, [r4, 0x1C]
	adds r0, 0x30
	strh r0, [r4, 0x1C]
	movs r0, 0x1C
	ldrsh r2, [r4, r0]
	adds r0, r5, 0
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	adds r0, r5, 0
	bl sub_8079A64
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	ldr r0, _0813F814 @ =0x000002cf
	cmp r1, r0
	ble _0813F838
_0813F80A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0813F838
	.align 2, 0
_0813F814: .4byte 0x000002cf
_0813F818:
	adds r0, r5, 0
	bl sub_8078F40
	ldr r1, _0813F840 @ =gSprites
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r6, 0
	bl move_anim_task_del
_0813F838:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813F840: .4byte gSprites
	thumb_func_end sub_813F798

	thumb_func_start sub_813F844
sub_813F844: @ 813F844
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0813F87C @ =gUnknown_02024BE0
	ldr r4, _0813F880 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	adds r1, r0, r1
	ldrb r1, [r1]
	mov r9, r1
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0813F88C
	ldr r1, _0813F884 @ =gUnknown_02024A6A
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0813F888 @ =gPlayerParty
	b _0813F89C
	.align 2, 0
_0813F87C: .4byte gUnknown_02024BE0
_0813F880: .4byte gUnknown_0202F7C8
_0813F884: .4byte gUnknown_02024A6A
_0813F888: .4byte gPlayerParty
_0813F88C:
	ldr r1, _0813F8CC @ =gUnknown_02024A6A
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0813F8D0 @ =gEnemyParty
_0813F89C:
	adds r0, r1
	movs r1, 0x26
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl ball_number_to_ball_processing_index
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r2, _0813F8D4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r6, r0, r2
	movs r0, 0x8
	ldrsh r7, [r6, r0]
	cmp r7, 0
	beq _0813F8D8
	cmp r7, 0x1
	beq _0813F958
	b _0813F982
	.align 2, 0
_0813F8CC: .4byte gUnknown_02024A6A
_0813F8D0: .4byte gEnemyParty
_0813F8D4: .4byte gTasks
_0813F8D8:
	ldr r5, _0813F950 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	adds r1, r0, 0
	lsls r1, 24
	ldr r2, _0813F954 @ =gSprites
	mov r3, r9
	lsls r0, r3, 4
	add r0, r9
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x5]
	lsls r2, 28
	lsrs r2, 30
	adds r0, 0x43
	ldrb r3, [r0]
	movs r0, 0x80
	lsls r0, 22
	adds r1, r0
	lsrs r1, 24
	mov r0, r8
	str r0, [sp]
	adds r0, r4, 0
	bl sub_814086C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x1C]
	str r7, [sp]
	str r7, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80791A8
	adds r2, r0, 0
	ldrb r1, [r5]
	movs r0, 0
	mov r3, r8
	bl sub_8141314
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x1E]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	b _0813F982
	.align 2, 0
_0813F950: .4byte gUnknown_0202F7C8
_0813F954: .4byte gSprites
_0813F958:
	movs r1, 0x1C
	ldrsh r0, [r6, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	bne _0813F982
	movs r3, 0x1E
	ldrsh r0, [r6, r3]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	bne _0813F982
	adds r0, r5, 0
	bl move_anim_task_del
_0813F982:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_813F844

	thumb_func_start sub_813F990
sub_813F990: @ 813F990
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813F9B4 @ =gUnknown_02024C04
	ldrh r0, [r0]
	bl ball_number_to_ball_processing_index
	lsls r0, 24
	lsrs r0, 24
	bl sub_80478DC
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813F9B4: .4byte gUnknown_02024C04
	thumb_func_end sub_813F990

	thumb_func_start sub_813F9B8
sub_813F9B8: @ 813F9B8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813F9DC @ =gUnknown_02024C04
	ldrh r0, [r0]
	bl ball_number_to_ball_processing_index
	lsls r0, 24
	lsrs r0, 24
	bl sub_804794C
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813F9DC: .4byte gUnknown_02024C04
	thumb_func_end sub_813F9B8

	thumb_func_start sub_813F9E0
sub_813F9E0: @ 813F9E0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0813F9F4 @ =0x02017840
	ldrb r0, [r0, 0x8]
	cmp r0, 0x5
	bne _0813FA00
	ldr r1, _0813F9F8 @ =gUnknown_03004B00
	ldr r0, _0813F9FC @ =0x0000ffff
	b _0813FA04
	.align 2, 0
_0813F9F4: .4byte 0x02017840
_0813F9F8: .4byte gUnknown_03004B00
_0813F9FC: .4byte 0x0000ffff
_0813FA00:
	ldr r1, _0813FA10 @ =gUnknown_03004B00
	movs r0, 0
_0813FA04:
	strh r0, [r1, 0xE]
	adds r0, r2, 0
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_0813FA10: .4byte gUnknown_03004B00
	thumb_func_end sub_813F9E0

	thumb_func_start ball_number_to_ball_processing_index
ball_number_to_ball_processing_index: @ 813FA14
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	subs r0, 0x1
	cmp r0, 0xB
	bhi _0813FA8C
	lsls r0, 2
	ldr r1, _0813FA2C @ =_0813FA30
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0813FA2C: .4byte _0813FA30
	.align 2, 0
_0813FA30:
	.4byte _0813FA60
	.4byte _0813FA64
	.4byte _0813FA68
	.4byte _0813FA8C
	.4byte _0813FA6C
	.4byte _0813FA70
	.4byte _0813FA74
	.4byte _0813FA78
	.4byte _0813FA7C
	.4byte _0813FA80
	.4byte _0813FA84
	.4byte _0813FA88
_0813FA60:
	movs r0, 0x4
	b _0813FA8E
_0813FA64:
	movs r0, 0x3
	b _0813FA8E
_0813FA68:
	movs r0, 0x1
	b _0813FA8E
_0813FA6C:
	movs r0, 0x2
	b _0813FA8E
_0813FA70:
	movs r0, 0x5
	b _0813FA8E
_0813FA74:
	movs r0, 0x6
	b _0813FA8E
_0813FA78:
	movs r0, 0x7
	b _0813FA8E
_0813FA7C:
	movs r0, 0x8
	b _0813FA8E
_0813FA80:
	movs r0, 0x9
	b _0813FA8E
_0813FA84:
	movs r0, 0xA
	b _0813FA8E
_0813FA88:
	movs r0, 0xB
	b _0813FA8E
_0813FA8C:
	movs r0, 0
_0813FA8E:
	pop {r1}
	bx r1
	thumb_func_end ball_number_to_ball_processing_index

	thumb_func_start sub_813FA94
sub_813FA94: @ 813FA94
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	mov r10, r0
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _0813FB58 @ =gUnknown_02024C04
	ldrh r0, [r0]
	bl ball_number_to_ball_processing_index
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r1, _0813FB5C @ =gSpriteTemplate_820AAB4
	adds r0, r1
	movs r1, 0x20
	movs r2, 0x50
	movs r3, 0x1D
	bl CreateSprite
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _0813FB60 @ =gSprites
	mov r9, r1
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	adds r6, r4, r1
	movs r0, 0x22
	strh r0, [r6, 0x2E]
	ldr r2, _0813FB64 @ =gUnknown_0202F7C9
	mov r8, r2
	ldrb r0, [r2]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x30]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x10
	strh r0, [r6, 0x32]
	mov r0, r9
	adds r0, 0x1C
	adds r4, r0
	ldr r0, _0813FB68 @ =sub_813FD90
	str r0, [r4]
	ldr r3, _0813FB6C @ =0x02017840
	ldr r1, _0813FB70 @ =gUnknown_02024BE0
	mov r2, r8
	ldrb r0, [r2]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	adds r0, 0x3E
	ldrb r1, [r0]
	lsls r1, 29
	lsrs r1, 31
	lsls r1, 1
	ldrb r2, [r3, 0x9]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x9]
	ldr r1, _0813FB74 @ =gTasks
	mov r2, r10
	lsls r0, r2, 2
	add r0, r10
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	ldr r1, _0813FB78 @ =sub_813FB7C
	str r1, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813FB58: .4byte gUnknown_02024C04
_0813FB5C: .4byte gSpriteTemplate_820AAB4
_0813FB60: .4byte gSprites
_0813FB64: .4byte gUnknown_0202F7C9
_0813FB68: .4byte sub_813FD90
_0813FB6C: .4byte 0x02017840
_0813FB70: .4byte gUnknown_02024BE0
_0813FB74: .4byte gTasks
_0813FB78: .4byte sub_813FB7C
	thumb_func_end sub_813FA94

	thumb_func_start sub_813FB7C
sub_813FB7C: @ 813FB7C
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0813FBAC @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x8]
	ldr r2, _0813FBB0 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2E]
	ldr r0, _0813FBB4 @ =0x0000ffff
	cmp r1, r0
	bne _0813FBA6
	adds r0, r3, 0
	bl move_anim_task_del
_0813FBA6:
	pop {r0}
	bx r0
	.align 2, 0
_0813FBAC: .4byte gTasks
_0813FBB0: .4byte gSprites
_0813FBB4: .4byte 0x0000ffff
	thumb_func_end sub_813FB7C

	thumb_func_start sub_813FBB8
sub_813FBB8: @ 813FBB8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0813FBD8 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0813FBDC
	movs r6, 0x20
	movs r5, 0xB
	b _0813FBE0
	.align 2, 0
_0813FBD8: .4byte gUnknown_020239F8
_0813FBDC:
	movs r6, 0x17
	movs r5, 0x5
_0813FBE0:
	ldr r0, _0813FC9C @ =gUnknown_02024C04
	ldrh r0, [r0]
	bl ball_number_to_ball_processing_index
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079E90
	adds r3, r0, 0
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r1, _0813FCA0 @ =gSpriteTemplate_820AAB4
	adds r0, r1
	adds r1, r6, 0
	adds r1, 0x20
	movs r2, 0x50
	orrs r5, r2
	adds r2, r5, 0
	bl CreateSprite
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0813FCA4 @ =gSprites
	mov r9, r0
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	adds r6, r4, r0
	movs r0, 0x22
	strh r0, [r6, 0x2E]
	ldr r1, _0813FCA8 @ =gUnknown_0202F7C9
	mov r8, r1
	ldrb r0, [r1]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x30]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x10
	strh r0, [r6, 0x32]
	mov r0, r9
	adds r0, 0x1C
	adds r4, r0
	ldr r0, _0813FCAC @ =SpriteCallbackDummy
	str r0, [r4]
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r1, _0813FCB0 @ =gUnknown_02024BE0
	lsls r0, 24
	lsrs r0, 24
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r1, _0813FCB4 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	ldr r1, _0813FCB8 @ =sub_813FCBC
	str r1, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813FC9C: .4byte gUnknown_02024C04
_0813FCA0: .4byte gSpriteTemplate_820AAB4
_0813FCA4: .4byte gSprites
_0813FCA8: .4byte gUnknown_0202F7C9
_0813FCAC: .4byte SpriteCallbackDummy
_0813FCB0: .4byte gUnknown_02024BE0
_0813FCB4: .4byte gTasks
_0813FCB8: .4byte sub_813FCBC
	thumb_func_end sub_813FBB8

	thumb_func_start sub_813FCBC
sub_813FCBC: @ 813FCBC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _0813FD1C @ =gSprites
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r1, _0813FD20 @ =gUnknown_02024BE0
	lsls r0, 24
	lsrs r0, 24
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0813FD16
	movs r0, 0x3D
	movs r1, 0
	bl PlaySE12WithPanning
	ldr r0, _0813FD24 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0813FD28 @ =sub_813FD90
	str r1, [r0]
	ldr r0, _0813FD2C @ =sub_813FD34
	movs r1, 0xA
	bl CreateTask
	ldr r0, _0813FD30 @ =sub_813FB7C
	str r0, [r4]
_0813FD16:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813FD1C: .4byte gSprites
_0813FD20: .4byte gUnknown_02024BE0
_0813FD24: .4byte gTasks
_0813FD28: .4byte sub_813FD90
_0813FD2C: .4byte sub_813FD34
_0813FD30: .4byte sub_813FB7C
	thumb_func_end sub_813FCBC

	thumb_func_start sub_813FD34
sub_813FD34: @ 813FD34
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _0813FD88 @ =gSprites
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r4, _0813FD8C @ =gUnknown_02024BE0
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	bge _0813FD80
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0
	bl StartSpriteAnim
	adds r0, r5, 0
	bl DestroyTask
_0813FD80:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813FD88: .4byte gSprites
_0813FD8C: .4byte gUnknown_02024BE0
	thumb_func_end sub_813FD34

	thumb_func_start sub_813FD90
sub_813FD90: @ 813FD90
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	ldrh r2, [r4, 0x32]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r1, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	strh r2, [r4, 0x36]
	ldr r0, _0813FDB8 @ =0x0000ffd8
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r0, _0813FDBC @ =sub_813FDC0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813FDB8: .4byte 0x0000ffd8
_0813FDBC: .4byte sub_813FDC0
	thumb_func_end sub_813FD90

	thumb_func_start sub_813FDC0
sub_813FDC0: @ 813FDC0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _0813FE5A
	ldr r0, _0813FDE0 @ =0x02017840
	ldrb r0, [r0, 0x8]
	cmp r0, 0x5
	bne _0813FDE8
	ldr r0, _0813FDE4 @ =sub_81407B8
	str r0, [r4, 0x1C]
	b _0813FE5A
	.align 2, 0
_0813FDE0: .4byte 0x02017840
_0813FDE4: .4byte sub_81407B8
_0813FDE8:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x26]
	adds r1, r4, 0
	adds r1, 0x2E
	movs r2, 0
	adds r0, r4, 0
	adds r0, 0x3C
_0813FE10:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _0813FE10
	movs r0, 0
	strh r0, [r4, 0x38]
	ldr r0, _0813FE64 @ =sub_813FE70
	str r0, [r4, 0x1C]
	ldr r0, _0813FE68 @ =gUnknown_02024C04
	ldrh r0, [r0]
	bl ball_number_to_ball_processing_index
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xB
	bgt _0813FE5A
	cmp r5, 0
	blt _0813FE5A
	ldrh r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	str r5, [sp]
	movs r2, 0x1
	movs r3, 0x1C
	bl sub_814086C
	ldr r0, _0813FE6C @ =gUnknown_0202F7C9
	ldrb r1, [r0]
	movs r0, 0
	movs r2, 0xE
	adds r3, r5, 0
	bl sub_8141314
_0813FE5A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813FE64: .4byte sub_813FE70
_0813FE68: .4byte gUnknown_02024C04
_0813FE6C: .4byte gUnknown_0202F7C9
	thumb_func_end sub_813FDC0

	thumb_func_start sub_813FE70
sub_813FE70: @ 813FE70
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _0813FEAC
	ldr r0, _0813FEB4 @ =TaskDummy
	movs r1, 0x32
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x38]
	ldr r0, _0813FEB8 @ =sub_813FEC8
	str r0, [r4, 0x1C]
	ldr r2, _0813FEBC @ =gSprites
	ldr r1, _0813FEC0 @ =gUnknown_02024BE0
	ldr r0, _0813FEC4 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x30]
_0813FEAC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813FEB4: .4byte TaskDummy
_0813FEB8: .4byte sub_813FEC8
_0813FEBC: .4byte gSprites
_0813FEC0: .4byte gUnknown_02024BE0
_0813FEC4: .4byte gUnknown_0202F7C9
	thumb_func_end sub_813FE70

	thumb_func_start sub_813FEC8
sub_813FEC8: @ 813FEC8
	push {r4-r7,lr}
	adds r7, r0, 0
	ldr r1, _0813FF0C @ =gUnknown_02024BE0
	ldr r0, _0813FF10 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	adds r0, r1
	ldrb r4, [r0]
	ldrh r0, [r7, 0x38]
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0813FF14 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	bne _0813FEFA
	movs r0, 0x3C
	bl PlaySE
_0813FEFA:
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _0813FF70
	cmp r0, 0x1
	bgt _0813FF18
	cmp r0, 0
	beq _0813FF1E
	b _0813FFDC
	.align 2, 0
_0813FF0C: .4byte gUnknown_02024BE0
_0813FF10: .4byte gUnknown_0202F7C9
_0813FF14: .4byte gTasks
_0813FF18:
	cmp r0, 0x2
	beq _0813FFB4
	b _0813FFDC
_0813FF1E:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078E70
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0x1C]
	ldr r1, _0813FF60 @ =gUnknown_03005F0C
	movs r0, 0x1C
	str r0, [r1]
	ldr r2, _0813FF64 @ =gUnknown_03005F14
	ldr r1, _0813FF68 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	ldrh r0, [r7, 0x26]
	ldrh r7, [r7, 0x22]
	adds r0, r7
	subs r1, r0
	strh r1, [r2]
	ldr r4, _0813FF6C @ =gUnknown_03005F10
	ldrh r0, [r2]
	lsls r0, 8
	movs r1, 0x1C
	bl __udivsi3
	strh r0, [r4]
	strh r0, [r5, 0xC]
	b _0813FFCE
	.align 2, 0
_0813FF60: .4byte gUnknown_03005F0C
_0813FF64: .4byte gUnknown_03005F14
_0813FF68: .4byte gSprites
_0813FF6C: .4byte gUnknown_03005F10
_0813FF70:
	ldrh r0, [r5, 0x1C]
	adds r0, 0x20
	strh r0, [r5, 0x1C]
	movs r0, 0x1C
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r5, 0xC]
	ldrh r1, [r5, 0xE]
	adds r0, r1
	strh r0, [r5, 0xE]
	ldr r0, _0813FFAC @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	negs r0, r0
	asrs r0, 8
	strh r0, [r1, 0x26]
	movs r0, 0x1C
	ldrsh r1, [r5, r0]
	ldr r0, _0813FFB0 @ =0x0000047f
	cmp r1, r0
	ble _08140004
	b _0813FFCE
	.align 2, 0
_0813FFAC: .4byte gSprites
_0813FFB0: .4byte 0x0000047f
_0813FFB4:
	adds r0, r4, 0
	bl sub_8078F40
	ldr r1, _0813FFD8 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_0813FFCE:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _08140004
	.align 2, 0
_0813FFD8: .4byte gSprites
_0813FFDC:
	ldr r0, _0814000C @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0xA
	ble _08140004
	adds r0, r6, 0
	bl DestroyTask
	adds r0, r7, 0
	movs r1, 0x2
	bl StartSpriteAnim
	movs r0, 0
	strh r0, [r7, 0x38]
	ldr r0, _08140010 @ =sub_8140014
	str r0, [r7, 0x1C]
_08140004:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814000C: .4byte gTasks
_08140010: .4byte sub_8140014
	thumb_func_end sub_813FEC8

	thumb_func_start sub_8140014
sub_8140014: @ 8140014
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0814004E
	movs r1, 0
	strh r1, [r4, 0x34]
	movs r0, 0x20
	strh r0, [r4, 0x36]
	strh r1, [r4, 0x38]
	movs r0, 0
	movs r1, 0x20
	bl Cos
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldr r0, _08140054 @ =sub_8140058
	str r0, [r4, 0x1C]
_0814004E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08140054: .4byte sub_8140058
	thumb_func_end sub_8140014

	thumb_func_start sub_8140058
sub_8140058: @ 8140058
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r5, 0
	ldrh r0, [r4, 0x34]
	movs r1, 0xFF
	ands r1, r0
	cmp r1, 0
	beq _0814006E
	cmp r1, 0x1
	beq _081400E2
	b _0814010E
_0814006E:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x38]
	adds r1, 0x4
	ldrh r2, [r4, 0x34]
	lsls r0, r2, 16
	asrs r0, 24
	adds r1, r0
	strh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x3F
	ble _0814010E
	ldrh r0, [r4, 0x36]
	subs r0, 0xA
	strh r0, [r4, 0x36]
	ldr r1, _081400B8 @ =0x00000101
	adds r0, r2, r1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 24
	cmp r0, 0x4
	bne _081400AA
	movs r5, 0x1
_081400AA:
	cmp r0, 0x2
	beq _081400CA
	cmp r0, 0x2
	bgt _081400BC
	cmp r0, 0x1
	beq _081400C2
	b _081400DA
	.align 2, 0
_081400B8: .4byte 0x00000101
_081400BC:
	cmp r0, 0x3
	beq _081400D2
	b _081400DA
_081400C2:
	movs r0, 0x38
	bl PlaySE
	b _0814010E
_081400CA:
	movs r0, 0x39
	bl PlaySE
	b _0814010E
_081400D2:
	movs r0, 0x3A
	bl PlaySE
	b _0814010E
_081400DA:
	movs r0, 0x3B
	bl PlaySE
	b _0814010E
_081400E2:
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl Cos
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x38]
	subs r1, 0x4
	ldrh r2, [r4, 0x34]
	lsls r0, r2, 16
	asrs r0, 24
	subs r1, r0
	strh r1, [r4, 0x38]
	lsls r1, 16
	cmp r1, 0
	bgt _0814010E
	strh r5, [r4, 0x38]
	ldr r0, _08140138 @ =0xffffff00
	ands r0, r2
	strh r0, [r4, 0x34]
_0814010E:
	cmp r5, 0
	beq _0814014E
	movs r5, 0
	strh r5, [r4, 0x34]
	movs r0, 0x40
	movs r1, 0x20
	bl Cos
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x26]
	ldr r0, _0814013C @ =0x02017840
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08140144
	strh r5, [r4, 0x38]
	ldr r0, _08140140 @ =sub_8140410
	str r0, [r4, 0x1C]
	b _0814014E
	.align 2, 0
_08140138: .4byte 0xffffff00
_0814013C: .4byte 0x02017840
_08140140: .4byte sub_8140410
_08140144:
	ldr r0, _08140154 @ =sub_8140158
	str r0, [r4, 0x1C]
	movs r0, 0x1
	strh r0, [r4, 0x36]
	strh r5, [r4, 0x38]
_0814014E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08140154: .4byte sub_8140158
	thumb_func_end sub_8140058

	thumb_func_start sub_8140158
sub_8140158: @ 8140158
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _08140190
	strh r5, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _08140198 @ =0x02017840
	strh r5, [r0, 0xC]
	ldr r0, _0814019C @ =sub_81401A0
	str r0, [r4, 0x1C]
	movs r0, 0x17
	bl PlaySE
_08140190:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08140198: .4byte 0x02017840
_0814019C: .4byte sub_81401A0
	thumb_func_end sub_8140158

	thumb_func_start sub_81401A0
sub_81401A0: @ 81401A0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	movs r1, 0xFF
	ands r1, r0
	cmp r1, 0x6
	bls _081401B0
	b _081403C4
_081401B0:
	lsls r0, r1, 2
	ldr r1, _081401BC @ =_081401C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081401BC: .4byte _081401C0
	.align 2, 0
_081401C0:
	.4byte _081401DC
	.4byte _08140226
	.4byte _0814026C
	.4byte _081402C0
	.4byte _08140310
	.4byte _08140368
	.4byte _081403C4
_081401DC:
	ldr r0, _081401F8 @ =0x02017840
	ldrh r2, [r0, 0xC]
	movs r3, 0xC
	ldrsh r1, [r0, r3]
	adds r5, r0, 0
	cmp r1, 0xFF
	ble _081401FC
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r0, 0xFF
	ands r0, r2
	b _08140200
	.align 2, 0
_081401F8: .4byte 0x02017840
_081401FC:
	adds r0, r2, 0
	adds r0, 0xB0
_08140200:
	strh r0, [r5, 0xC]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r4, 0x38]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	adds r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xE
	bhi _08140224
	b _0814040A
_08140224:
	b _081402B4
_08140226:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _081402CC
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x36]
	negs r0, r0
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	movs r3, 0x36
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bge _08140262
	adds r0, r4, 0
	movs r1, 0x2
	bl ChangeSpriteAffineAnim
	b _0814040A
_08140262:
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
	b _0814040A
_0814026C:
	ldr r0, _08140288 @ =0x02017840
	ldrh r2, [r0, 0xC]
	movs r3, 0xC
	ldrsh r1, [r0, r3]
	adds r5, r0, 0
	cmp r1, 0xFF
	ble _0814028C
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r0, 0xFF
	ands r0, r2
	b _08140290
	.align 2, 0
_08140288: .4byte 0x02017840
_0814028C:
	adds r0, r2, 0
	adds r0, 0xB0
_08140290:
	strh r0, [r5, 0xC]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r4, 0x38]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	adds r0, 0xC
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x18
	bhi _081402B4
	b _0814040A
_081402B4:
	strh r3, [r5, 0xC]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	strh r3, [r4, 0x38]
	b _0814040A
_081402C0:
	ldrh r0, [r4, 0x38]
	adds r1, r0, 0x1
	strh r1, [r4, 0x38]
	lsls r0, 16
	cmp r0, 0
	bge _081402DA
_081402CC:
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	b _0814040A
_081402DA:
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x36]
	negs r0, r0
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	movs r3, 0x36
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bge _08140308
	adds r0, r4, 0
	movs r1, 0x2
	bl ChangeSpriteAffineAnim
	b _08140310
_08140308:
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
_08140310:
	ldr r0, _0814032C @ =0x02017840
	ldrh r2, [r0, 0xC]
	movs r3, 0xC
	ldrsh r1, [r0, r3]
	adds r5, r0, 0
	cmp r1, 0xFF
	ble _08140330
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r0, 0xFF
	ands r0, r2
	b _08140334
	.align 2, 0
_0814032C: .4byte 0x02017840
_08140330:
	adds r0, r2, 0
	adds r0, 0xB0
_08140334:
	strh r0, [r5, 0xC]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r4, 0x38]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	adds r0, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x8
	bls _0814040A
	strh r3, [r5, 0xC]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	strh r3, [r4, 0x38]
	ldrh r0, [r4, 0x36]
	negs r0, r0
	strh r0, [r4, 0x36]
	b _0814040A
_08140368:
	movs r3, 0x80
	lsls r3, 1
	adds r0, r3, 0
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r1, r0, 24
	ldr r0, _08140394 @ =0x02017840
	ldrb r0, [r0, 0x8]
	cmp r1, r0
	bne _0814039C
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08140398 @ =sub_8140410
	str r0, [r4, 0x1C]
	b _0814040A
	.align 2, 0
_08140394: .4byte 0x02017840
_08140398: .4byte sub_8140410
_0814039C:
	cmp r0, 0x4
	bne _081403B0
	cmp r1, 0x3
	bne _081403B0
	ldr r0, _081403AC @ =sub_8140434
	str r0, [r4, 0x1C]
	b _081403B6
	.align 2, 0
_081403AC: .4byte sub_8140434
_081403B0:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
_081403B6:
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	b _0814040A
_081403C4:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _0814040A
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r1, [r4, 0x34]
	ldr r0, _081403F8 @ =0xffffff00
	ands r0, r1
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAffineAnim
	movs r3, 0x36
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bge _081403FC
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	b _08140404
	.align 2, 0
_081403F8: .4byte 0xffffff00
_081403FC:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_08140404:
	movs r0, 0x17
	bl PlaySE
_0814040A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81401A0

	thumb_func_start sub_8140410
sub_8140410: @ 8140410
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x38]
	adds r0, 0x1
	strh r0, [r1, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _0814042A
	movs r0, 0
	strh r0, [r1, 0x38]
	ldr r0, _08140430 @ =sub_81405F4
	str r0, [r1, 0x1C]
_0814042A:
	pop {r0}
	bx r0
	.align 2, 0
_08140430: .4byte sub_81405F4
	thumb_func_end sub_8140410

	thumb_func_start sub_8140434
sub_8140434: @ 8140434
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r1, [r3]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _08140450 @ =sub_8140454
	str r1, [r0, 0x1C]
	movs r1, 0
	strh r1, [r0, 0x34]
	strh r1, [r0, 0x36]
	strh r1, [r0, 0x38]
	bx lr
	.align 2, 0
_08140450: .4byte sub_8140454
	thumb_func_end sub_8140434

	thumb_func_start sub_8140454
sub_8140454: @ 8140454
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r7, _08140484 @ =gUnknown_0202F7C9
	ldrh r0, [r6, 0x36]
	adds r0, 0x1
	strh r0, [r6, 0x36]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0x28
	beq _081404CC
	cmp r1, 0x5F
	bne _08140490
	ldr r0, _08140488 @ =gUnknown_02024E6D
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	bl sub_8043EB4
	bl m4aMPlayAllStop
	ldr r0, _0814048C @ =0x00000173
	bl PlaySE
	b _081404CC
	.align 2, 0
_08140484: .4byte gUnknown_0202F7C9
_08140488: .4byte gUnknown_02024E6D
_0814048C: .4byte 0x00000173
_08140490:
	ldr r0, _081404D4 @ =0x0000013b
	cmp r1, r0
	bne _081404CC
	ldr r5, _081404D8 @ =gSprites
	ldr r4, _081404DC @ =gUnknown_02024BE0
	ldrb r0, [r7]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r7]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	movs r0, 0
	strh r0, [r6, 0x2E]
	ldr r0, _081404E0 @ =sub_81404E4
	str r0, [r6, 0x1C]
_081404CC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081404D4: .4byte 0x0000013b
_081404D8: .4byte gSprites
_081404DC: .4byte gUnknown_02024BE0
_081404E0: .4byte sub_81404E4
	thumb_func_end sub_8140454

	thumb_func_start sub_81404E4
sub_81404E4: @ 81404E4
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08140550
	cmp r0, 0x1
	bgt _081404FC
	cmp r0, 0
	beq _08140502
	b _08140594
_081404FC:
	cmp r0, 0x2
	beq _08140580
	b _08140594
_08140502:
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrb r1, [r4, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r1, _08140548 @ =REG_BLDCNT
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x10
	strh r0, [r1]
	ldr r0, [r4, 0x14]
	ldrh r0, [r0, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	ldr r0, _0814054C @ =0x00007fff
	str r0, [sp]
	adds r0, r1, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0814058C
	.align 2, 0
_08140548: .4byte REG_BLDCNT
_0814054C: .4byte 0x00007fff
_08140550:
	ldrh r0, [r4, 0x30]
	adds r1, r0, 0x1
	strh r1, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	ble _081405B2
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x32]
	adds r1, 0x1
	strh r1, [r4, 0x32]
	ldr r3, _0814057C @ =REG_BLDALPHA
	lsls r2, r1, 8
	movs r0, 0x10
	subs r0, r1
	orrs r2, r0
	strh r2, [r3]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _081405B2
	b _0814058C
	.align 2, 0
_0814057C: .4byte REG_BLDALPHA
_08140580:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0814058C:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _081405B2
_08140594:
	ldr r0, _081405BC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _081405B2
	ldr r0, _081405C0 @ =REG_BLDCNT
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	strh r1, [r4, 0x2E]
	ldr r0, _081405C4 @ =sub_81405C8
	str r0, [r4, 0x1C]
_081405B2:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081405BC: .4byte gPaletteFade
_081405C0: .4byte REG_BLDCNT
_081405C4: .4byte sub_81405C8
	thumb_func_end sub_81404E4

	thumb_func_start sub_81405C8
sub_81405C8: @ 81405C8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _081405E0
	ldr r0, _081405DC @ =0x0000ffff
	strh r0, [r4, 0x2E]
	b _081405EC
	.align 2, 0
_081405DC: .4byte 0x0000ffff
_081405E0:
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_081405EC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81405C8

	thumb_func_start sub_81405F4
sub_81405F4: @ 81405F4
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	ldr r0, _081406A8 @ =sub_81406BC
	str r0, [r4, 0x1C]
	ldr r0, _081406AC @ =gUnknown_02024C04
	ldrh r0, [r0]
	bl ball_number_to_ball_processing_index
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xB
	bgt _08140646
	cmp r5, 0
	blt _08140646
	ldrh r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	subs r1, 0x5
	lsls r1, 24
	lsrs r1, 24
	str r5, [sp]
	movs r2, 0x1
	movs r3, 0x1C
	bl sub_814086C
	ldr r0, _081406B0 @ =gUnknown_0202F7C9
	ldrb r1, [r0]
	movs r0, 0x1
	movs r2, 0xE
	adds r3, r5, 0
	bl sub_8141314
_08140646:
	ldr r6, _081406B4 @ =gSprites
	ldr r5, _081406B8 @ =gUnknown_02024BE0
	ldr r4, _081406B0 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl AnimateSprite
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x80
	lsls r1, 5
	strh r1, [r0, 0x30]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081406A8: .4byte sub_81406BC
_081406AC: .4byte gUnknown_02024C04
_081406B0: .4byte gUnknown_0202F7C9
_081406B4: .4byte gSprites
_081406B8: .4byte gUnknown_02024BE0
	thumb_func_end sub_81405F4

	thumb_func_start sub_81406BC
sub_81406BC: @ 81406BC
	push {r4-r7,lr}
	adds r7, r0, 0
	movs r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _081406DA
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_081406DA:
	ldr r4, _08140708 @ =gSprites
	ldr r3, _0814070C @ =gUnknown_02024BE0
	ldr r2, _08140710 @ =gUnknown_0202F7C9
	ldrb r0, [r2]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r4
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _08140714
	adds r0, r1, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r5, 0x1
	b _08140734
	.align 2, 0
_08140708: .4byte gSprites
_0814070C: .4byte gUnknown_02024BE0
_08140710: .4byte gUnknown_0202F7C9
_08140714:
	ldr r6, _0814079C @ =0xfffffee0
	adds r0, r6, 0
	ldrh r6, [r1, 0x30]
	adds r0, r6
	strh r0, [r1, 0x30]
	ldrb r0, [r2]
	adds r0, r3
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r1, 0x26]
_08140734:
	adds r0, r7, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08140796
	cmp r5, 0
	beq _08140796
	ldr r4, _081407A0 @ =gSprites
	ldr r3, _081407A4 @ =gUnknown_02024BE0
	ldr r2, _081407A8 @ =gUnknown_0202F7C9
	ldrb r0, [r2]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r6, 0
	movs r5, 0
	strh r5, [r0, 0x26]
	ldrb r0, [r2]
	adds r0, r3
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	ldr r0, _081407AC @ =0x02017840
	ldrb r1, [r0, 0x9]
	lsls r1, 30
	adds r2, 0x3E
	lsrs r1, 31
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	strh r5, [r7, 0x2E]
	ldr r0, _081407B0 @ =sub_81405C8
	str r0, [r7, 0x1C]
	ldr r0, _081407B4 @ =gUnknown_02024E6D
	strb r6, [r0]
	movs r0, 0x1
	bl sub_8043EB4
_08140796:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814079C: .4byte 0xfffffee0
_081407A0: .4byte gSprites
_081407A4: .4byte gUnknown_02024BE0
_081407A8: .4byte gUnknown_0202F7C9
_081407AC: .4byte 0x02017840
_081407B0: .4byte sub_81405C8
_081407B4: .4byte gUnknown_02024E6D
	thumb_func_end sub_81406BC

	thumb_func_start sub_81407B8
sub_81407B8: @ 81407B8
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x24]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x26]
	ldrh r3, [r2, 0x22]
	adds r0, r3
	strh r0, [r2, 0x22]
	strh r1, [r2, 0x26]
	strh r1, [r2, 0x24]
	ldr r4, _081407F0 @ =sub_81407F4
	movs r3, 0
	movs r1, 0x5
	adds r0, r2, 0
	adds r0, 0x38
_081407DC:
	strh r3, [r0]
	subs r0, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _081407DC
	str r4, [r2, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081407F0: .4byte sub_81407F4
	thumb_func_end sub_81407B8

	thumb_func_start sub_81407F4
sub_81407F4: @ 81407F4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x80
	lsls r0, 4
	adds r2, r0, 0
	ldrh r1, [r4, 0x2E]
	adds r2, r1
	movs r0, 0xD0
	lsls r0, 3
	adds r3, r0, 0
	ldrh r1, [r4, 0x30]
	adds r3, r1
	lsls r1, r3, 16
	asrs r1, 24
	ldrh r0, [r4, 0x24]
	subs r0, r1
	strh r0, [r4, 0x24]
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r4, 0x2E]
	ands r3, r0
	strh r3, [r4, 0x30]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	cmp r0, 0xA0
	bgt _0814084A
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x8
	negs r1, r1
	cmp r0, r1
	bge _0814085E
_0814084A:
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _08140864 @ =sub_81405C8
	str r0, [r4, 0x1C]
	ldr r1, _08140868 @ =gUnknown_02024E6D
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	bl sub_8043EB4
_0814085E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08140864: .4byte sub_81405C8
_08140868: .4byte gUnknown_02024E6D
	thumb_func_end sub_81407F4

	thumb_func_start sub_814086C
sub_814086C: @ 814086C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, [sp, 0x20]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r4, 24
	lsrs r4, 24
	adds r5, r4, 0
	ldr r0, _08140910 @ =gUnknown_0840B258
	lsls r6, r5, 3
	adds r4, r6, r0
	ldrh r0, [r4, 0x6]
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _08140914 @ =0xffff0000
	cmp r0, r1
	bne _081408B6
	adds r0, r4, 0
	bl LoadCompressedObjectPic
	ldr r0, _08140918 @ =gUnknown_0840B2B8
	adds r0, r6, r0
	bl LoadCompressedObjectPalette
_081408B6:
	ldr r1, _0814091C @ =gUnknown_0840B384
	lsls r0, r5, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08140920 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	mov r1, r10
	strh r1, [r0, 0xA]
	mov r1, r9
	strh r1, [r0, 0xC]
	mov r1, r8
	strh r1, [r0, 0xE]
	strh r7, [r0, 0x10]
	strh r5, [r0, 0x26]
	movs r0, 0xF
	bl PlaySE
	ldr r0, _08140924 @ =gMain
	ldr r1, _08140928 @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08140900
	ldr r1, _0814092C @ =0x02017840
	ldrb r0, [r1, 0xA]
	adds r0, 0x1
	strb r0, [r1, 0xA]
_08140900:
	adds r0, r4, 0
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08140910: .4byte gUnknown_0840B258
_08140914: .4byte 0xffff0000
_08140918: .4byte gUnknown_0840B2B8
_0814091C: .4byte gUnknown_0840B384
_08140920: .4byte gTasks
_08140924: .4byte gMain
_08140928: .4byte 0x0000043d
_0814092C: .4byte 0x02017840
	thumb_func_end sub_814086C

	thumb_func_start sub_8140930
sub_8140930: @ 8140930
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _081409D0 @ =gTasks
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	adds r7, r0, r1
	ldrh r0, [r7, 0x26]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	cmp r0, 0xF
	bgt _081409E4
	ldrb r1, [r7, 0xA]
	ldrb r2, [r7, 0xC]
	ldrb r6, [r7, 0xE]
	ldrb r3, [r7, 0x10]
	mov r4, r8
	lsls r0, r4, 1
	add r0, r8
	lsls r0, 3
	ldr r4, _081409D4 @ =gSpriteTemplate_840B3B4
	adds r0, r4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r5, _081409D8 @ =gSprites
	adds r2, r4, r5
	ldr r0, _081409DC @ =gUnknown_0840B378
	add r0, r8
	ldrb r1, [r0]
	adds r0, r2, 0
	str r2, [sp]
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _081409E0 @ =sub_8140A08
	str r0, [r4]
	movs r0, 0x3
	ands r6, r0
	lsls r6, 2
	ldr r2, [sp]
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r6
	strb r0, [r2, 0x5]
	ldrb r0, [r7, 0x8]
	cmp r0, 0x7
	bls _081409B6
	subs r0, 0x8
	lsls r0, 24
	lsrs r0, 24
_081409B6:
	lsls r0, 5
	strh r0, [r2, 0x2E]
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	cmp r0, 0xF
	bne _081409E4
	movs r0, 0x1
	strh r0, [r2, 0x3C]
	mov r0, r9
	bl DestroyTask
	b _081409F6
	.align 2, 0
_081409D0: .4byte gTasks
_081409D4: .4byte gSpriteTemplate_840B3B4
_081409D8: .4byte gSprites
_081409DC: .4byte gUnknown_0840B378
_081409E0: .4byte sub_8140A08
_081409E4:
	ldr r0, _08140A04 @ =gTasks
	mov r2, r9
	lsls r1, r2, 2
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_081409F6:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140A04: .4byte gTasks
	thumb_func_end sub_8140930

	thumb_func_start sub_8140A08
sub_8140A08: @ 8140A08
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x30]
	movs r3, 0x30
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _08140A20
	ldr r0, _08140A1C @ =sub_8140A28
	str r0, [r1, 0x1C]
	b _08140A24
	.align 2, 0
_08140A1C: .4byte sub_8140A28
_08140A20:
	subs r0, r2, 0x1
	strh r0, [r1, 0x30]
_08140A24:
	pop {r0}
	bx r0
	thumb_func_end sub_8140A08

	thumb_func_start sub_8140A28
sub_8140A28: @ 8140A28
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x2
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x32
	bne _08140A5C
	adds r0, r4, 0
	bl sub_8141294
_08140A5C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8140A28

	thumb_func_start sub_8140A64
sub_8140A64: @ 8140A64
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08140B24 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _08140B28 @ =gSprites
	mov r8, r3
	ldr r0, _08140B2C @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_08140AA8:
	ldr r0, _08140B30 @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _08140B34 @ =gSprites + 0x1C
	adds r1, r5, r3
	ldr r0, _08140B38 @ =sub_8140ECC
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 5
	strh r0, [r4, 0x2E]
	movs r0, 0xA
	strh r0, [r4, 0x36]
	movs r0, 0x2
	strh r0, [r4, 0x38]
	movs r2, 0x1
	strh r2, [r4, 0x3A]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _08140AA8
	ldr r0, _08140B28 @ =gSprites
	adds r0, r5, r0
	strh r2, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140B24: .4byte gTasks
_08140B28: .4byte gSprites
_08140B2C: .4byte gUnknown_0840B378
_08140B30: .4byte gSpriteTemplate_840B3B4
_08140B34: .4byte gSprites + 0x1C
_08140B38: .4byte sub_8140ECC
	thumb_func_end sub_8140A64

	thumb_func_start sub_8140B3C
sub_8140B3C: @ 8140B3C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08140BFC @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _08140C00 @ =gSprites
	mov r8, r3
	ldr r0, _08140C04 @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_08140B80:
	ldr r0, _08140C08 @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _08140C0C @ =gSprites + 0x1C
	adds r1, r5, r3
	ldr r0, _08140C10 @ =sub_8140ECC
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 5
	strh r0, [r4, 0x2E]
	movs r0, 0xA
	strh r0, [r4, 0x36]
	movs r1, 0x1
	strh r1, [r4, 0x38]
	movs r0, 0x2
	strh r0, [r4, 0x3A]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _08140B80
	ldr r0, _08140C00 @ =gSprites
	adds r0, r5, r0
	strh r1, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140BFC: .4byte gTasks
_08140C00: .4byte gSprites
_08140C04: .4byte gUnknown_0840B378
_08140C08: .4byte gSpriteTemplate_840B3B4
_08140C0C: .4byte gSprites + 0x1C
_08140C10: .4byte sub_8140ECC
	thumb_func_end sub_8140B3C

	thumb_func_start sub_8140C14
sub_8140C14: @ 8140C14
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08140CD0 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _08140CD4 @ =gSprites
	mov r8, r3
	ldr r0, _08140CD8 @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_08140C58:
	ldr r0, _08140CDC @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _08140CE0 @ =gSprites + 0x1C
	adds r1, r5, r3
	ldr r0, _08140CE4 @ =sub_8140ECC
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 5
	strh r0, [r4, 0x2E]
	movs r0, 0x4
	strh r0, [r4, 0x36]
	movs r2, 0x1
	strh r2, [r4, 0x38]
	strh r2, [r4, 0x3A]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _08140C58
	ldr r0, _08140CD4 @ =gSprites
	adds r0, r5, r0
	strh r2, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140CD0: .4byte gTasks
_08140CD4: .4byte gSprites
_08140CD8: .4byte gUnknown_0840B378
_08140CDC: .4byte gSpriteTemplate_840B3B4
_08140CE0: .4byte gSprites + 0x1C
_08140CE4: .4byte sub_8140ECC
	thumb_func_end sub_8140C14

	thumb_func_start sub_8140CE8
sub_8140CE8: @ 8140CE8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08140DAC @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _08140DB0 @ =gSprites
	mov r8, r3
	ldr r0, _08140DB4 @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_08140D2C:
	ldr r0, _08140DB8 @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _08140DBC @ =gSprites + 0x1C
	adds r1, r5, r3
	ldr r0, _08140DC0 @ =sub_8140ECC
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 3
	adds r0, r6
	strh r0, [r4, 0x2E]
	movs r0, 0x5
	strh r0, [r4, 0x36]
	movs r2, 0x1
	strh r2, [r4, 0x38]
	strh r2, [r4, 0x3A]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x9
	bls _08140D2C
	ldr r0, _08140DB0 @ =gSprites
	adds r0, r5, r0
	strh r2, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140DAC: .4byte gTasks
_08140DB0: .4byte gSprites
_08140DB4: .4byte gUnknown_0840B378
_08140DB8: .4byte gSpriteTemplate_840B3B4
_08140DBC: .4byte gSprites + 0x1C
_08140DC0: .4byte sub_8140ECC
	thumb_func_end sub_8140CE8

	thumb_func_start sub_8140DC4
sub_8140DC4: @ 8140DC4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08140DF0 @ =gTasks
	lsls r2, r7, 2
	adds r0, r2, r7
	lsls r0, 3
	adds r3, r0, r1
	ldrh r1, [r3, 0x16]
	movs r4, 0x16
	ldrsh r0, [r3, r4]
	cmp r0, 0
	beq _08140DF4
	subs r0, r1, 0x1
	strh r0, [r3, 0x16]
	b _08140EA4
	.align 2, 0
_08140DF0: .4byte gTasks
_08140DF4:
	ldrh r0, [r3, 0x26]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r3, 0xA]
	str r1, [sp]
	ldrb r4, [r3, 0xC]
	str r4, [sp, 0x4]
	ldrb r1, [r3, 0xE]
	str r1, [sp, 0x8]
	ldrb r3, [r3, 0x10]
	str r3, [sp, 0xC]
	movs r6, 0
	str r2, [sp, 0x10]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	mov r10, r1
	ldr r3, _08140EB4 @ =gSprites
	mov r8, r3
	ldr r1, _08140EB8 @ =gUnknown_0840B378
	adds r0, r1
	mov r9, r0
_08140E20:
	ldr r0, _08140EBC @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r3, r9
	ldrb r1, [r3]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _08140EC0 @ =gSprites + 0x1C
	adds r1, r5, r0
	ldr r0, _08140EC4 @ =sub_8140ECC
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 5
	strh r0, [r4, 0x2E]
	movs r2, 0x8
	strh r2, [r4, 0x36]
	movs r0, 0x2
	strh r0, [r4, 0x38]
	strh r0, [r4, 0x3A]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _08140E20
	ldr r0, _08140EC8 @ =gTasks
	ldr r4, [sp, 0x10]
	adds r1, r4, r7
	lsls r1, 3
	adds r1, r0
	strh r2, [r1, 0x16]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _08140EA4
	ldr r0, _08140EB4 @ =gSprites
	adds r0, r5, r0
	movs r1, 0x1
	strh r1, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
_08140EA4:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140EB4: .4byte gSprites
_08140EB8: .4byte gUnknown_0840B378
_08140EBC: .4byte gSpriteTemplate_840B3B4
_08140EC0: .4byte gSprites + 0x1C
_08140EC4: .4byte sub_8140ECC
_08140EC8: .4byte gTasks
	thumb_func_end sub_8140DC4

	thumb_func_start sub_8140ECC
sub_8140ECC: @ 8140ECC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x38]
	ldrh r2, [r4, 0x30]
	adds r0, r2
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _08140F1C
	adds r0, r4, 0
	bl sub_8141294
_08140F1C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8140ECC

	thumb_func_start sub_8140F24
sub_8140F24: @ 8140F24
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08140FE0 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _08140FE4 @ =gSprites
	mov r8, r3
	ldr r0, _08140FE8 @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_08140F68:
	ldr r0, _08140FEC @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _08140FF0 @ =gSprites + 0x1C
	adds r1, r5, r3
	ldr r0, _08140FF4 @ =sub_8140FF8
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 2
	adds r0, r6
	strh r0, [r4, 0x2E]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xB
	bls _08140F68
	ldr r0, _08140FE4 @ =gSprites
	adds r0, r5, r0
	movs r1, 0x1
	strh r1, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08140FE0: .4byte gTasks
_08140FE4: .4byte gSprites
_08140FE8: .4byte gUnknown_0840B378
_08140FEC: .4byte gSpriteTemplate_840B3B4
_08140FF0: .4byte gSprites + 0x1C
_08140FF4: .4byte sub_8140FF8
	thumb_func_end sub_8140F24

	thumb_func_start sub_8140FF8
sub_8140FF8: @ 8140FF8
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x24]
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	adds r0, r4, 0
	bl Sin
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl Cos
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x6
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _08141050
	adds r0, r5, 0
	bl sub_8141294
_08141050:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8140FF8

	thumb_func_start sub_8141058
sub_8141058: @ 8141058
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	ldr r1, _08141104 @ =gTasks
	lsls r0, 2
	ldr r2, [sp]
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r3, [r0, 0xA]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xC]
	str r2, [sp, 0x8]
	ldrb r3, [r0, 0xE]
	str r3, [sp, 0xC]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0x10]
	movs r0, 0
	mov r8, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	str r0, [sp, 0x14]
	ldr r0, _08141108 @ =gUnknown_0840B378
	adds r1, r0
	mov r10, r1
_0814109E:
	movs r7, 0
	movs r1, 0x1
	add r1, r8
	mov r9, r1
_081410A6:
	ldr r0, _0814110C @ =gSpriteTemplate_840B3B4
	ldr r2, [sp, 0x14]
	adds r0, r2, r0
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	ldr r3, [sp, 0x10]
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	ldr r3, _08141110 @ =gSprites
	adds r5, r4, r3
	mov r0, r10
	ldrb r1, [r0]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r1, _08141114 @ =gSprites + 0x1C
	adds r4, r1
	ldr r0, _08141118 @ =sub_8140ECC
	str r0, [r4]
	movs r0, 0x3
	ldr r1, [sp, 0xC]
	ands r1, r0
	lsls r1, 2
	ldrb r0, [r5, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r2, r3, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	lsls r0, r7, 5
	strh r0, [r5, 0x2E]
	movs r0, 0x8
	strh r0, [r5, 0x36]
	mov r0, r8
	cmp r0, 0
	bne _0814111C
	movs r0, 0x2
	strh r0, [r5, 0x38]
	movs r0, 0x1
	b _08141122
	.align 2, 0
_08141104: .4byte gTasks
_08141108: .4byte gUnknown_0840B378
_0814110C: .4byte gSpriteTemplate_840B3B4
_08141110: .4byte gSprites
_08141114: .4byte gSprites + 0x1C
_08141118: .4byte sub_8140ECC
_0814111C:
	movs r0, 0x1
	strh r0, [r5, 0x38]
	movs r0, 0x2
_08141122:
	strh r0, [r5, 0x3A]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x7
	bls _081410A6
	mov r1, r9
	lsls r0, r1, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x1
	bls _0814109E
	ldr r0, _08141160 @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x3C]
	ldr r0, [sp]
	bl DestroyTask
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141160: .4byte gSprites
	thumb_func_end sub_8141058

	thumb_func_start sub_8141164
sub_8141164: @ 8141164
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08141218 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xA]
	str r2, [sp]
	ldrb r3, [r0, 0xC]
	str r3, [sp, 0x4]
	ldrb r2, [r0, 0xE]
	str r2, [sp, 0x8]
	ldrb r0, [r0, 0x10]
	str r0, [sp, 0xC]
	movs r6, 0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r10, r0
	ldr r3, _0814121C @ =gSprites
	mov r8, r3
	ldr r0, _08141220 @ =gUnknown_0840B378
	adds r1, r0
	mov r9, r1
_081411A8:
	ldr r0, _08141224 @ =gSpriteTemplate_840B3B4
	add r0, r10
	ldr r1, [sp]
	ldr r2, [sp, 0x4]
	ldr r3, [sp, 0xC]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r5, r1, 2
	mov r0, r8
	adds r4, r5, r0
	mov r2, r9
	ldrb r1, [r2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r3, _08141228 @ =gSprites + 0x1C
	adds r1, r5, r3
	ldr r0, _0814122C @ =sub_8141230
	str r0, [r1]
	movs r0, 0x3
	ldr r2, [sp, 0x8]
	ands r2, r0
	lsls r2, 2
	ldrb r0, [r4, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	lsls r0, r6, 5
	strh r0, [r4, 0x2E]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x7
	bls _081411A8
	ldr r0, _0814121C @ =gSprites
	adds r0, r5, r0
	movs r1, 0x1
	strh r1, [r0, 0x3C]
	adds r0, r7, 0
	bl DestroyTask
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141218: .4byte gTasks
_0814121C: .4byte gSprites
_08141220: .4byte gUnknown_0840B378
_08141224: .4byte gSpriteTemplate_840B3B4
_08141228: .4byte gSprites + 0x1C
_0814122C: .4byte sub_8141230
	thumb_func_end sub_8141164

	thumb_func_start sub_8141230
sub_8141230: @ 8141230
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x24]
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	ldrh r1, [r5, 0x2E]
	movs r0, 0x3F
	ands r0, r1
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	bl Sin
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl Cos
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x2E]
	adds r0, 0xA
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _0814128C
	adds r0, r5, 0
	bl sub_8141294
_0814128C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8141230

	thumb_func_start sub_8141294
sub_8141294: @ 8141294
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _081412B8 @ =gMain
	ldr r1, _081412BC @ =0x0000043d
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _081412C0
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _081412F2
	adds r0, r5, 0
	bl DestroySpriteAndFreeResources
	b _0814130E
	.align 2, 0
_081412B8: .4byte gMain
_081412BC: .4byte 0x0000043d
_081412C0:
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _08141308
	ldr r1, _081412FC @ =0x02017840
	ldrb r0, [r1, 0xA]
	subs r0, 0x1
	strb r0, [r1, 0xA]
	lsls r0, 24
	cmp r0, 0
	bne _081412F2
	movs r7, 0
	ldr r6, _08141300 @ =gUnknown_0840B258
	ldr r4, _08141304 @ =gUnknown_0840B2B8
_081412DC:
	ldrh r0, [r6, 0x6]
	bl FreeSpriteTilesByTag
	ldrh r0, [r4, 0x4]
	bl FreeSpritePaletteByTag
	adds r6, 0x8
	adds r4, 0x8
	adds r7, 0x1
	cmp r7, 0xB
	ble _081412DC
_081412F2:
	adds r0, r5, 0
	bl DestroySprite
	b _0814130E
	.align 2, 0
_081412FC: .4byte 0x02017840
_08141300: .4byte gUnknown_0840B258
_08141304: .4byte gUnknown_0840B2B8
_08141308:
	adds r0, r5, 0
	bl DestroySprite
_0814130E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8141294

	thumb_func_start sub_8141314
sub_8141314: @ 8141314
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r4, r0, 0
	mov r9, r2
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r3, 24
	lsrs r7, r3, 24
	ldr r0, _08141378 @ =sub_81413DC
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _0814137C @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r5, r0, r1
	strh r7, [r5, 0x26]
	strh r6, [r5, 0xE]
	mov r0, r9
	strh r0, [r5, 0x1C]
	mov r1, r9
	lsrs r0, r1, 16
	strh r0, [r5, 0x1E]
	cmp r4, 0
	bne _08141384
	lsls r0, r6, 20
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r0, 16
	ldr r2, _08141380 @ =gUnknown_0840B4D4
	lsls r1, r7, 1
	adds r1, r2
	ldrh r3, [r1]
	movs r1, 0x10
	movs r2, 0
	bl BlendPalette
	movs r0, 0x1
	strh r0, [r5, 0xA]
	b _081413AA
	.align 2, 0
_08141378: .4byte sub_81413DC
_0814137C: .4byte gTasks
_08141380: .4byte gUnknown_0840B4D4
_08141384:
	lsls r0, r6, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	ldr r2, _081413CC @ =gUnknown_0840B4D4
	lsls r1, r7, 1
	adds r1, r2
	ldrh r3, [r1]
	movs r1, 0x10
	movs r2, 0x10
	bl BlendPalette
	movs r0, 0x10
	strh r0, [r5, 0x8]
	ldr r0, _081413D0 @ =0x0000ffff
	strh r0, [r5, 0xA]
	ldr r0, _081413D4 @ =sub_814146C
	str r0, [r5]
_081413AA:
	ldr r0, _081413D8 @ =0x00007fff
	str r0, [sp]
	mov r0, r9
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	mov r0, r8
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081413CC: .4byte gUnknown_0840B4D4
_081413D0: .4byte 0x0000ffff
_081413D4: .4byte sub_814146C
_081413D8: .4byte 0x00007fff
	thumb_func_end sub_8141314

	thumb_func_start sub_81413DC
sub_81413DC: @ 81413DC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _0814142C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0x10
	bgt _08141434
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	lsls r0, 20
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r0, 16
	ldrb r2, [r4, 0x8]
	ldr r3, _08141430 @ =gUnknown_0840B4D4
	lsls r1, 1
	adds r1, r3
	ldrh r3, [r1]
	movs r1, 0x10
	bl BlendPalette
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x8]
	adds r0, r1
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _0814145C
	.align 2, 0
_0814142C: .4byte gTasks
_08141430: .4byte gUnknown_0840B4D4
_08141434:
	ldr r0, _08141464 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0814145C
	ldrh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	lsls r1, 16
	orrs r0, r1
	ldr r1, _08141468 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	adds r0, r5, 0
	bl DestroyTask
_0814145C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08141464: .4byte gPaletteFade
_08141468: .4byte 0x00007fff
	thumb_func_end sub_81413DC

	thumb_func_start sub_814146C
sub_814146C: @ 814146C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _081414AC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081414A4
	ldr r0, _081414B0 @ =gTasks
	lsls r4, r2, 2
	adds r4, r2
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	lsls r1, 16
	orrs r0, r1
	ldr r1, _081414B4 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _081414B8 @ =sub_81414BC
	str r0, [r4]
_081414A4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081414AC: .4byte gPaletteFade
_081414B0: .4byte gTasks
_081414B4: .4byte 0x00007fff
_081414B8: .4byte sub_81414BC
	thumb_func_end sub_814146C

	thumb_func_start sub_81414BC
sub_81414BC: @ 81414BC
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08141508 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r1, r0, 24
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0x10
	bgt _08141510
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	lsls r0, 20
	movs r3, 0x80
	lsls r3, 17
	adds r0, r3
	lsrs r0, 16
	ldrb r2, [r4, 0x8]
	ldr r3, _0814150C @ =gUnknown_0840B4D4
	lsls r1, 1
	adds r1, r3
	ldrh r3, [r1]
	movs r1, 0x10
	bl BlendPalette
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x8]
	adds r0, r1
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _08141516
	.align 2, 0
_08141508: .4byte gTasks
_0814150C: .4byte gUnknown_0840B4D4
_08141510:
	adds r0, r2, 0
	bl DestroyTask
_08141516:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81414BC

	thumb_func_start sub_814151C
sub_814151C: @ 814151C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0
	mov r8, r0
	ldr r0, _08141550 @ =gUnknown_02024BE0
	ldr r3, _08141554 @ =gUnknown_0202F7C8
	ldrb r2, [r3]
	adds r0, r2, r0
	ldrb r6, [r0]
	ldr r1, _08141558 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _081415F4
	cmp r0, 0x1
	bgt _0814155C
	cmp r0, 0
	beq _08141562
	b _081416B6
	.align 2, 0
_08141550: .4byte gUnknown_02024BE0
_08141554: .4byte gUnknown_0202F7C8
_08141558: .4byte gTasks
_0814155C:
	cmp r0, 0x2
	beq _08141606
	b _081416B6
_08141562:
	ldr r0, _0814159C @ =gUnknown_03004B00
	ldrh r0, [r0]
	strh r0, [r5, 0x1E]
	movs r2, 0xA0
	lsls r2, 3
	adds r0, r2, 0
	ldrh r4, [r5, 0x8]
	adds r0, r4
	strh r0, [r5, 0x8]
	ldrb r0, [r3]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _081415A4
	ldr r2, _081415A0 @ =gSprites
	lsls r3, r6, 4
	adds r1, r3, r6
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 24
	ldrh r4, [r1, 0x24]
	adds r0, r4
	strh r0, [r1, 0x24]
	adds r4, r3, 0
	b _081415BC
	.align 2, 0
_0814159C: .4byte gUnknown_03004B00
_081415A0: .4byte gSprites
_081415A4:
	ldr r3, _081415EC @ =gSprites
	lsls r4, r6, 4
	adds r2, r4, r6
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r5, 0x8]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	adds r2, r3, 0
_081415BC:
	ldr r1, _081415F0 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r3, r0, r1
	ldrb r0, [r3, 0x8]
	strh r0, [r3, 0x8]
	adds r0, r4, r6
	lsls r0, 2
	adds r0, r2
	movs r2, 0x20
	ldrsh r1, [r0, r2]
	movs r4, 0x24
	ldrsh r0, [r0, r4]
	adds r1, r0
	adds r1, 0x20
	movs r0, 0x98
	lsls r0, 1
	cmp r1, r0
	bls _081416B6
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	strh r0, [r3, 0x1C]
	b _081416B6
	.align 2, 0
_081415EC: .4byte gSprites
_081415F0: .4byte gTasks
_081415F4:
	ldrb r1, [r5, 0x1E]
	adds r0, r2, 0
	adds r2, r6, 0
	bl refresh_graphics_maybe
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	b _081416B6
_08141606:
	movs r1, 0xA0
	lsls r1, 3
	adds r0, r1, 0
	ldrh r2, [r5, 0x8]
	adds r0, r2
	strh r0, [r5, 0x8]
	ldrb r0, [r3]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0814163C
	ldr r0, _08141638 @ =gSprites
	lsls r3, r6, 4
	adds r2, r3, r6
	lsls r2, 2
	adds r2, r0
	ldrh r1, [r5, 0x8]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2, 0x24]
	subs r0, r1
	strh r0, [r2, 0x24]
	adds r4, r3, 0
	b _08141654
	.align 2, 0
_08141638: .4byte gSprites
_0814163C:
	ldr r0, _08141688 @ =gSprites
	lsls r2, r6, 4
	adds r1, r2, r6
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 24
	ldrh r3, [r1, 0x24]
	adds r0, r3
	strh r0, [r1, 0x24]
	adds r4, r2, 0
_08141654:
	ldr r1, _0814168C @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x8]
	strh r1, [r0, 0x8]
	ldr r0, _08141690 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08141694
	ldr r0, _08141688 @ =gSprites
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r0
	movs r4, 0x24
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bgt _081416AA
	movs r0, 0
	strh r0, [r1, 0x24]
	b _081416B0
	.align 2, 0
_08141688: .4byte gSprites
_0814168C: .4byte gTasks
_08141690: .4byte gUnknown_0202F7C8
_08141694:
	ldr r0, _081416C0 @ =gSprites
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r0
	movs r3, 0x24
	ldrsh r0, [r1, r3]
	cmp r0, 0
	blt _081416AA
	strh r2, [r1, 0x24]
	movs r4, 0x1
	mov r8, r4
_081416AA:
	mov r0, r8
	cmp r0, 0
	beq _081416B6
_081416B0:
	adds r0, r7, 0
	bl move_anim_task_del
_081416B6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081416C0: .4byte gSprites
	thumb_func_end sub_814151C

	thumb_func_start sub_81416C4
sub_81416C4: @ 81416C4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _081416E8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08141744
	cmp r0, 0x1
	bgt _081416EC
	cmp r0, 0
	beq _081416F2
	b _081417B8
	.align 2, 0
_081416E8: .4byte gTasks
_081416EC:
	cmp r0, 0x2
	beq _0814177C
	b _081417B8
_081416F2:
	ldr r0, _08141708 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08141714
	ldr r1, _0814170C @ =REG_BLDCNT
	ldr r2, _08141710 @ =0x00003f42
	b _08141718
	.align 2, 0
_08141708: .4byte gUnknown_0202F7C8
_0814170C: .4byte REG_BLDCNT
_08141710: .4byte 0x00003f42
_08141714:
	ldr r1, _08141734 @ =REG_BLDCNT
	ldr r2, _08141738 @ =0x00003f44
_08141718:
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0814173C @ =REG_BLDALPHA
	movs r0, 0x10
	strh r0, [r1]
	ldr r1, _08141740 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x26]
	adds r1, 0x1
	strh r1, [r0, 0x26]
	b _081417B8
	.align 2, 0
_08141734: .4byte REG_BLDCNT
_08141738: .4byte 0x00003f44
_0814173C: .4byte REG_BLDALPHA
_08141740: .4byte gTasks
_08141744:
	ldrh r0, [r4, 0xA]
	adds r1, r0, 0x1
	strh r1, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _081417B8
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0x8]
	adds r1, 0x1
	strh r1, [r4, 0x8]
	ldr r3, _08141778 @ =REG_BLDALPHA
	lsls r2, r1, 8
	movs r0, 0x10
	subs r0, r1
	orrs r2, r0
	strh r2, [r3]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _081417B8
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	b _081417B8
	.align 2, 0
_08141778: .4byte REG_BLDALPHA
_0814177C:
	ldr r1, _081417C0 @ =gUnknown_02024BE0
	ldr r3, _081417C4 @ =gUnknown_0202F7C8
	ldrb r0, [r3]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _081417C8 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldr r1, _081417CC @ =0x06010000
	adds r0, r1
	movs r1, 0
	str r1, [sp]
	ldr r1, _081417D0 @ =0x040000d4
	mov r2, sp
	str r2, [r1]
	str r0, [r1, 0x4]
	ldr r0, _081417D4 @ =0x85000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldrb r0, [r3]
	bl sub_80324E0
	adds r0, r5, 0
	bl move_anim_task_del
_081417B8:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081417C0: .4byte gUnknown_02024BE0
_081417C4: .4byte gUnknown_0202F7C8
_081417C8: .4byte gSprites
_081417CC: .4byte 0x06010000
_081417D0: .4byte 0x040000d4
_081417D4: .4byte 0x85000200
	thumb_func_end sub_81416C4

	thumb_func_start sub_81417D8
sub_81417D8: @ 81417D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _081417FC @ =gUnknown_03004B00
	ldr r1, _08141800 @ =gUnknown_0202F7C8
	ldrb r1, [r1]
	lsls r1, 2
	ldr r2, _08141804 @ =0x02017800
	adds r1, r2
	ldr r1, [r1]
	lsls r1, 29
	lsrs r1, 31
	strh r1, [r3, 0xE]
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_081417FC: .4byte gUnknown_03004B00
_08141800: .4byte gUnknown_0202F7C8
_08141804: .4byte 0x02017800
	thumb_func_end sub_81417D8

	thumb_func_start sub_8141808
sub_8141808: @ 8141808
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08141820 @ =gUnknown_0202F7C9
	ldr r1, _08141824 @ =gUnknown_02024C0A
	ldrb r1, [r1]
	strb r1, [r2]
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_08141820: .4byte gUnknown_0202F7C9
_08141824: .4byte gUnknown_02024C0A
	thumb_func_end sub_8141808

	thumb_func_start sub_8141828
sub_8141828: @ 8141828
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	mov r8, r0
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	ldr r1, _081418E0 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	adds r5, r0, 0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r4, r0, 0
	adds r0, r6, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _081418FC
	lsrs r0, r5, 16
	ldr r7, _081418E4 @ =0x0000ffff
	ands r5, r7
	eors r0, r5
	lsrs r1, r4, 16
	eors r0, r1
	ands r4, r7
	eors r0, r4
	cmp r0, 0x7
	bhi _08141882
	movs r0, 0x1
	mov r8, r0
_08141882:
	mov r0, r8
	cmp r0, 0
	beq _081418FC
	ldr r0, _081418E8 @ =0x000027f9
	bl GetSpriteTileStartByTag
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r7
	bne _081418A2
	ldr r0, _081418EC @ =gBattleAnimPicTable + (233 * 8)
	bl LoadCompressedObjectPic
	ldr r0, _081418F0 @ =gBattleAnimPaletteTable + (233 * 8)
	bl LoadCompressedObjectPalette
_081418A2:
	ldr r5, _081418F4 @ =sub_814191C
	adds r0, r5, 0
	movs r1, 0xA
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _081418F8 @ =gTasks
	lsls r2, r4, 2
	adds r2, r4
	lsls r2, 3
	adds r2, r3
	movs r4, 0
	strh r6, [r2, 0x8]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	strh r6, [r1, 0x8]
	strh r4, [r2, 0xA]
	movs r0, 0x1
	strh r0, [r1, 0xA]
	b _0814190E
	.align 2, 0
_081418E0: .4byte 0x02017810
_081418E4: .4byte 0x0000ffff
_081418E8: .4byte 0x000027f9
_081418EC: .4byte gBattleAnimPicTable + (233 * 8)
_081418F0: .4byte gBattleAnimPaletteTable + (233 * 8)
_081418F4: .4byte sub_814191C
_081418F8: .4byte gTasks
_081418FC:
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	ldr r1, _08141918 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0, 0x1]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x1]
_0814190E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141918: .4byte 0x02017810
	thumb_func_end sub_8141828

	thumb_func_start sub_814191C
sub_814191C: @ 814191C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08141944 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0x22]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r0, 0x3B
	bgt _08141948
	adds r0, r1, 0x1
	strh r0, [r4, 0x22]
	b _08141AB8
	.align 2, 0
_08141944: .4byte gTasks
_08141948:
	ldr r0, _08141998 @ =0x02017840
	ldrb r0, [r0, 0xA]
	cmp r0, 0
	beq _08141952
	b _08141AB8
_08141952:
	ldrh r0, [r4, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1C]
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	cmp r1, 0
	beq _08141966
	b _08141AB8
_08141966:
	ldrb r0, [r4, 0x8]
	mov r8, r0
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r8
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _081419A0
	ldr r0, _0814199C @ =gBattleAnimSpriteTemplate_84024E8
	adds r1, r5, 0
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	b _08141A02
	.align 2, 0
_08141998: .4byte 0x02017840
_0814199C: .4byte gBattleAnimSpriteTemplate_84024E8
_081419A0:
	cmp r0, 0
	blt _081419D4
	cmp r0, 0x3
	bgt _081419D4
	ldr r0, _081419CC @ =gSpriteTemplate_8402500
	adds r1, r5, 0
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _081419D0 @ =gSprites
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	adds r2, r0
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x4
	b _081419F4
	.align 2, 0
_081419CC: .4byte gSpriteTemplate_8402500
_081419D0: .4byte gSprites
_081419D4:
	ldr r0, _08141A2C @ =gSpriteTemplate_8402500
	adds r1, r5, 0
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08141A30 @ =gSprites
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	adds r2, r0
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x5
_081419F4:
	ldr r4, _08141A34 @ =0x000003ff
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _08141A38 @ =0xfffffc00
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
_08141A02:
	ldr r2, _08141A3C @ =gTasks
	lsls r1, r7, 2
	adds r0, r1, r7
	lsls r0, 3
	adds r6, r0, r2
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	mov r9, r1
	cmp r0, 0
	bne _08141A44
	ldr r1, _08141A30 @ =gSprites
	lsls r2, r5, 4
	adds r0, r2, r5
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08141A40 @ =sub_8141B20
	str r1, [r0]
	adds r4, r2, 0
	b _08141A8C
	.align 2, 0
_08141A2C: .4byte gSpriteTemplate_8402500
_08141A30: .4byte gSprites
_08141A34: .4byte 0x000003ff
_08141A38: .4byte 0xfffffc00
_08141A3C: .4byte gTasks
_08141A40: .4byte sub_8141B20
_08141A44:
	ldr r3, _08141AC4 @ =gSprites
	lsls r4, r5, 4
	adds r1, r4, r5
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _08141AC8 @ =sub_8141B74
	str r2, [r0]
	adds r1, r3
	ldr r0, _08141ACC @ =0x0000ffe0
	strh r0, [r1, 0x24]
	movs r0, 0x20
	strh r0, [r1, 0x26]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	movs r1, 0x1E
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08141A8C
	mov r0, r8
	bl battle_side_get_owner
	lsls r0, 24
	movs r1, 0x3F
	cmp r0, 0
	bne _08141A82
	movs r1, 0xC0
_08141A82:
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x66
	bl PlaySE12WithPanning
_08141A8C:
	ldr r1, _08141AC4 @ =gSprites
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	strh r7, [r0, 0x2E]
	ldr r1, _08141AD0 @ =gTasks
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r2, r0, r1
	ldrh r1, [r2, 0x1E]
	adds r1, 0x1
	strh r1, [r2, 0x1E]
	ldrh r0, [r2, 0x20]
	adds r0, 0x1
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x5
	bne _08141AB8
	ldr r0, _08141AD4 @ =sub_8141AD8
	str r0, [r2]
_08141AB8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08141AC4: .4byte gSprites
_08141AC8: .4byte sub_8141B74
_08141ACC: .4byte 0x0000ffe0
_08141AD0: .4byte gTasks
_08141AD4: .4byte sub_8141AD8
	thumb_func_end sub_814191C

	thumb_func_start sub_8141AD8
sub_8141AD8: @ 8141AD8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	ldr r1, _08141B18 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r1, r0, r1
	movs r2, 0x20
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08141B14
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	bne _08141B0E
	ldrb r1, [r1, 0x8]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08141B1C @ =0x02017810
	adds r0, r1
	ldrb r1, [r0, 0x1]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x1]
_08141B0E:
	adds r0, r3, 0
	bl DestroyTask
_08141B14:
	pop {r0}
	bx r0
	.align 2, 0
_08141B18: .4byte gTasks
_08141B1C: .4byte 0x02017810
	thumb_func_end sub_8141AD8

	thumb_func_start sub_8141B20
sub_8141B20: @ 8141B20
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x18
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x18
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0xC
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08141B6A
	ldr r2, _08141B70 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x20]
	subs r1, 0x1
	strh r1, [r0, 0x20]
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_08141B6A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141B70: .4byte gTasks
	thumb_func_end sub_8141B20

	thumb_func_start sub_8141B74
sub_8141B74: @ 8141B74
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	bgt _08141B88
	adds r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _08141BCA
_08141B88:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r4, 0x24]
	adds r1, 0x5
	strh r1, [r4, 0x24]
	ldrh r0, [r4, 0x26]
	subs r0, 0x5
	strh r0, [r4, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x20
	ble _08141BCA
	ldr r2, _08141BD0 @ =gTasks
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x20]
	subs r1, 0x1
	strh r1, [r0, 0x20]
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_08141BCA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141BD0: .4byte gTasks
	thumb_func_end sub_8141B74

	thumb_func_start sub_8141BD4
sub_8141BD4: @ 8141BD4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08141BFC @ =gBattleAnimPicTable + (269 * 8)
	bl LoadCompressedObjectPic
	ldr r0, _08141C00 @ =gBattleAnimPaletteTable + (269 * 8)
	bl LoadCompressedObjectPalette
	ldr r0, _08141C04 @ =0x0000281d
	bl IndexOfSpritePaletteTag
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141BFC: .4byte gBattleAnimPicTable + (269 * 8)
_08141C00: .4byte gBattleAnimPaletteTable + (269 * 8)
_08141C04: .4byte 0x0000281d
	thumb_func_end sub_8141BD4

	thumb_func_start sub_8141C08
sub_8141C08: @ 8141C08
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08141C2C @ =0x0000281d
	adds r0, r5, 0
	bl FreeSpriteTilesByTag
	adds r0, r5, 0
	bl FreeSpritePaletteByTag
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08141C2C: .4byte 0x0000281d
	thumb_func_end sub_8141C08

	thumb_func_start sub_8141C30
sub_8141C30: @ 8141C30
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_80787B0
	movs r0, 0x1E
	strh r0, [r4, 0x2E]
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	ldr r5, _08141CA4 @ =gUnknown_03004B00
	lsrs r0, 24
	ldrh r1, [r5, 0x4]
	adds r0, r1
	strh r0, [r4, 0x32]
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	strh r0, [r4, 0x36]
	ldr r0, _08141CA8 @ =0x0000ffe0
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r1, _08141CAC @ =gUnknown_02024BE0
	ldr r0, _08141CB0 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08141CB4 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _08141CB8 @ =sub_8141CBC
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08141CA4: .4byte gUnknown_03004B00
_08141CA8: .4byte 0x0000ffe0
_08141CAC: .4byte gUnknown_02024BE0
_08141CB0: .4byte gUnknown_0202F7C8
_08141CB4: .4byte gSprites
_08141CB8: .4byte sub_8141CBC
	thumb_func_end sub_8141C30

	thumb_func_start sub_8141CBC
sub_8141CBC: @ 8141CBC
	push {lr}
	adds r3, r0, 0
	ldr r2, _08141CE4 @ =gSprites
	ldr r1, _08141CE8 @ =gUnknown_02024BE0
	ldr r0, _08141CEC @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08141CE0
	ldr r0, _08141CF0 @ =sub_8141CF4
	str r0, [r3, 0x1C]
_08141CE0:
	pop {r0}
	bx r0
	.align 2, 0
_08141CE4: .4byte gSprites
_08141CE8: .4byte gUnknown_02024BE0
_08141CEC: .4byte gUnknown_0202F7C8
_08141CF0: .4byte sub_8141CF4
	thumb_func_end sub_8141CBC

	thumb_func_start sub_8141CF4
sub_8141CF4: @ 8141CF4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _08141D16
	movs r0, 0
	strh r0, [r4, 0x2E]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08141D1C @ =sub_8141D20
	str r0, [r4, 0x1C]
_08141D16:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141D1C: .4byte sub_8141D20
	thumb_func_end sub_8141CF4

	thumb_func_start sub_8141D20
sub_8141D20: @ 8141D20
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _08141D70 @ =gSprites
	ldr r3, _08141D74 @ =gUnknown_02024BE0
	ldr r2, _08141D78 @ =gUnknown_0202F7C8
	ldrb r0, [r2]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	bge _08141D68
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	ble _08141D68
	ldrb r0, [r2]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl move_anim_8072740
_08141D68:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08141D70: .4byte gSprites
_08141D74: .4byte gUnknown_02024BE0
_08141D78: .4byte gUnknown_0202F7C8
	thumb_func_end sub_8141D20

	thumb_func_start sub_8141D7C
sub_8141D7C: @ 8141D7C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r1, _08141DA4 @ =gUnknown_0202F7C8
	strb r0, [r1]
	movs r0, 0x1
	bl battle_get_side_with_given_state
	ldr r1, _08141DA8 @ =gUnknown_0202F7C9
	strb r0, [r1]
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141DA4: .4byte gUnknown_0202F7C8
_08141DA8: .4byte gUnknown_0202F7C9
	thumb_func_end sub_8141D7C

	thumb_func_start sub_8141DAC
sub_8141DAC: @ 8141DAC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08141DC0 @ =0x02017840
	ldrh r1, [r0]
	cmp r1, 0x53
	bne _08141DC8
	ldr r1, _08141DC4 @ =gUnknown_03004B00
	movs r0, 0x1
	b _08141E00
	.align 2, 0
_08141DC0: .4byte 0x02017840
_08141DC4: .4byte gUnknown_03004B00
_08141DC8:
	cmp r1, 0xFA
	bne _08141DD8
	ldr r1, _08141DD4 @ =gUnknown_03004B00
	movs r0, 0x2
	b _08141E00
	.align 2, 0
_08141DD4: .4byte gUnknown_03004B00
_08141DD8:
	cmp r1, 0x80
	bne _08141DE8
	ldr r1, _08141DE4 @ =gUnknown_03004B00
	movs r0, 0x3
	b _08141E00
	.align 2, 0
_08141DE4: .4byte gUnknown_03004B00
_08141DE8:
	movs r0, 0xA4
	lsls r0, 1
	cmp r1, r0
	bne _08141DFC
	ldr r1, _08141DF8 @ =gUnknown_03004B00
	movs r0, 0x4
	b _08141E00
	.align 2, 0
_08141DF8: .4byte gUnknown_03004B00
_08141DFC:
	ldr r1, _08141E0C @ =gUnknown_03004B00
	movs r0, 0
_08141E00:
	strh r0, [r1]
	adds r0, r2, 0
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_08141E0C: .4byte gUnknown_03004B00
	thumb_func_end sub_8141DAC

	thumb_func_start sub_8141E10
sub_8141E10: @ 8141E10
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08141E2C @ =gUnknown_0202F7C8
	ldr r1, _08141E30 @ =0x02017840
	ldrh r1, [r1]
	strb r1, [r2]
	ldr r2, _08141E34 @ =gUnknown_0202F7C9
	lsrs r1, 8
	strb r1, [r2]
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_08141E2C: .4byte gUnknown_0202F7C8
_08141E30: .4byte 0x02017840
_08141E34: .4byte gUnknown_0202F7C9
	thumb_func_end sub_8141E10

	thumb_func_start sub_8141E38
sub_8141E38: @ 8141E38
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8141E38

	thumb_func_start sub_8141E4C
sub_8141E4C: @ 8141E4C
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8141E4C

	thumb_func_start sub_8141E64
sub_8141E64: @ 8141E64
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08141E80 @ =gMain
	ldr r1, _08141E84 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _08141EA0
	lsls r0, 2
	ldr r1, _08141E88 @ =_08141E8C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08141E80: .4byte gMain
_08141E84: .4byte 0x0000043c
_08141E88: .4byte _08141E8C
	.align 2, 0
_08141E8C:
	.4byte _08141EA0
	.4byte _08141EC0
	.4byte _08141EC6
	.4byte _08141F1C
	.4byte _08141F58
_08141EA0:
	movs r0, 0
	bl SetVBlankCallback
	bl sub_81433E0
	ldr r0, _08141EB8 @ =gMain
	ldr r2, _08141EBC @ =0x0000043c
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0]
	b _08141F84
	.align 2, 0
_08141EB8: .4byte gMain
_08141EBC: .4byte 0x0000043c
_08141EC0:
	bl sub_8143570
	b _08141F38
_08141EC6:
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08141F04 @ =sub_8141E38
	bl SetVBlankCallback
	ldr r3, _08141F08 @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _08141F0C @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08141F10 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08141F14 @ =gMain
	ldr r2, _08141F18 @ =0x0000043c
	adds r1, r2
	b _08141F3E
	.align 2, 0
_08141F04: .4byte sub_8141E38
_08141F08: .4byte 0x04000208
_08141F0C: .4byte 0x04000200
_08141F10: .4byte REG_DISPSTAT
_08141F14: .4byte gMain
_08141F18: .4byte 0x0000043c
_08141F1C:
	ldr r1, _08141F48 @ =REG_BLDCNT
	ldr r2, _08141F4C @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0xE2
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0
	strh r0, [r1]
	bl sub_81435B8
_08141F38:
	ldr r1, _08141F50 @ =gMain
	ldr r0, _08141F54 @ =0x0000043c
	adds r1, r0
_08141F3E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08141F84
	.align 2, 0
_08141F48: .4byte REG_BLDCNT
_08141F4C: .4byte 0x00003f42
_08141F50: .4byte gMain
_08141F54: .4byte 0x0000043c
_08141F58:
	bl UpdatePaletteFade
	ldr r0, _08141F7C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08141F84
	ldr r0, _08141F80 @ =sub_8141E4C
	bl SetMainCallback2
	movs r0, 0xDA
	lsls r0, 1
	bl PlayBGM
	movs r0, 0
	b _08141F86
	.align 2, 0
_08141F7C: .4byte gPaletteFade
_08141F80: .4byte sub_8141E4C
_08141F84:
	movs r0, 0x1
_08141F86:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8141E64

	thumb_func_start sub_8141F90
sub_8141F90: @ 8141F90
	push {r4,lr}
	bl sub_8141E64
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08141FB6
	ldr r0, _08141FBC @ =sub_8141FF8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08141FC0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
_08141FB6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08141FBC: .4byte sub_8141FF8
_08141FC0: .4byte gTasks
	thumb_func_end sub_8141F90

	thumb_func_start sub_8141FC4
sub_8141FC4: @ 8141FC4
	push {lr}
	bl sub_8141E64
	lsls r0, 24
	cmp r0, 0
	bne _08141FEA
	ldr r0, _08141FF0 @ =sub_8141FF8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08141FF4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x8]
_08141FEA:
	pop {r0}
	bx r0
	.align 2, 0
_08141FF0: .4byte sub_8141FF8
_08141FF4: .4byte gTasks
	thumb_func_end sub_8141FC4

	thumb_func_start sub_8141FF8
sub_8141FF8: @ 8141FF8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _081420C8 @ =0x0201c000
	mov r9, r0
	ldr r1, _081420CC @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	movs r7, 0
	ldr r4, _081420D0 @ =0xfffffe00
	mov r10, r4
_08142024:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _081420D4 @ =gPlayerParty
	adds r6, r1, r0
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	adds r3, r0, 0
	cmp r3, 0
	beq _081420DC
	adds r0, r6, 0
	movs r1, 0x41
	bl GetMonData
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 2
	mov r1, r9
	adds r5, r1, r4
	ldr r2, _081420D8 @ =0x000001ff
	adds r1, r2, 0
	ands r0, r1
	ldrh r1, [r5, 0x8]
	mov r2, r10
	ands r1, r2
	orrs r1, r0
	strh r1, [r5, 0x8]
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [r5]
	adds r0, r6, 0
	movs r1, 0
	bl GetMonData
	mov r1, r9
	adds r1, 0x4
	adds r1, r4
	str r0, [r1]
	adds r0, r6, 0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 1
	ldrb r2, [r5, 0x9]
	movs r1, 0x1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x9]
	adds r0, r6, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	movs r2, 0
	mov r6, r8
	lsls r5, r6, 2
	mov r3, r9
	adds r3, 0xA
_081420A0:
	adds r1, r2, r4
	adds r1, r3, r1
	mov r6, sp
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x9
	bls _081420A0
	ldr r0, _081420CC @ =gTasks
	mov r2, r8
	adds r1, r5, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	adds r0, 0x1
	strh r0, [r1, 0xC]
	b _08142108
	.align 2, 0
_081420C8: .4byte 0x0201c000
_081420CC: .4byte gTasks
_081420D0: .4byte 0xfffffe00
_081420D4: .4byte gPlayerParty
_081420D8: .4byte 0x000001ff
_081420DC:
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 2
	mov r4, r9
	adds r2, r4, r1
	ldrh r0, [r2, 0x8]
	mov r6, r10
	ands r0, r6
	strh r0, [r2, 0x8]
	str r3, [r2]
	mov r0, r9
	adds r0, 0x4
	adds r0, r1
	str r3, [r0]
	ldrb r1, [r2, 0x9]
	movs r0, 0x1
	ands r0, r1
	strb r0, [r2, 0x9]
	movs r0, 0xFF
	strb r0, [r2, 0xA]
	mov r0, r8
	lsls r5, r0, 2
_08142108:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x5
	bls _08142024
	ldr r0, _08142158 @ =gUnknown_0203931C
	movs r3, 0
	str r3, [r0]
	ldr r4, _0814215C @ =gTasks
	mov r2, r8
	adds r1, r5, r2
	lsls r1, 3
	adds r2, r1, r4
	strh r3, [r2, 0xA]
	movs r0, 0xFF
	strh r0, [r2, 0x10]
	movs r7, 0
	adds r3, r4, 0
	adds r3, 0x8
	movs r2, 0xFF
_08142130:
	adds r0, r7, 0x5
	lsls r0, 1
	adds r0, r1
	adds r0, r3
	strh r2, [r0]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x5
	bls _08142130
	mov r6, r8
	adds r0, r5, r6
	lsls r0, 3
	adds r1, r0, r4
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _08142164
	ldr r0, _08142160 @ =sub_81422E8
	b _08142166
	.align 2, 0
_08142158: .4byte gUnknown_0203931C
_0814215C: .4byte gTasks
_08142160: .4byte sub_81422E8
_08142164:
	ldr r0, _08142178 @ =sub_814217C
_08142166:
	str r0, [r1]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142178: .4byte sub_814217C
	thumb_func_end sub_8141FF8

	thumb_func_start sub_814217C
sub_814217C: @ 814217C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _081421C4 @ =0x0201c000
	mov r9, r0
	movs r7, 0x80
	lsls r7, 6
	add r7, r9
	ldr r0, _081421C8 @ =gUnknown_02039324
	ldrb r0, [r0]
	cmp r0, 0
	bne _081421D4
	movs r4, 0
	mov r0, r8
	lsls r0, 2
	mov r10, r0
	ldr r5, _081421CC @ =0xfffe4000
	add r5, r9
	movs r3, 0xF0
	lsls r3, 9
	movs r2, 0
	ldr r1, _081421D0 @ =0x00001fff
_081421B2:
	adds r0, r4, r3
	adds r0, r5
	strb r2, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r1
	bls _081421B2
	b _081421E0
	.align 2, 0
_081421C4: .4byte 0x0201c000
_081421C8: .4byte gUnknown_02039324
_081421CC: .4byte 0xfffe4000
_081421D0: .4byte 0x00001fff
_081421D4:
	movs r0, 0x3
	bl sub_8125EC8
	mov r0, r8
	lsls r0, 2
	mov r10, r0
_081421E0:
	movs r4, 0
	ldrh r1, [r7, 0x8]
	ldr r2, _081421E8 @ =0x000001ff
	b _081421FA
	.align 2, 0
_081421E8: .4byte 0x000001ff
_081421EC:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r7, 0x78
	cmp r4, 0x31
	bhi _08142206
	ldrh r1, [r7, 0x8]
_081421FA:
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _081421EC
	cmp r4, 0x31
	bls _08142228
_08142206:
	ldr r5, _08142264 @ =0x0201e000
	adds r6, r5, 0
	adds r5, 0x78
	movs r4, 0
	subs r7, 0x78
_08142210:
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x78
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	adds r6, 0x78
	adds r5, 0x78
	cmp r4, 0x30
	bls _08142210
_08142228:
	adds r0, r7, 0
	mov r1, r9
	movs r2, 0x78
	bl memcpy
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08142268 @ =gMenuText_HOFSaving
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _0814226C @ =gTasks
	mov r0, r10
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _08142270 @ =sub_8142274
	str r1, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142264: .4byte 0x0201e000
_08142268: .4byte gMenuText_HOFSaving
_0814226C: .4byte gTasks
_08142270: .4byte sub_8142274
	thumb_func_end sub_814217C

	thumb_func_start sub_8142274
sub_8142274: @ 8142274
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _081422A8 @ =gUnknown_03005EBC
	ldr r0, _081422AC @ =sub_8141FC4
	str r0, [r1]
	movs r0, 0x3
	bl sub_8125D44
	movs r0, 0x37
	bl PlaySE
	ldr r1, _081422B0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081422B4 @ =sub_81422B8
	str r1, [r0]
	movs r1, 0x20
	strh r1, [r0, 0xE]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081422A8: .4byte gUnknown_03005EBC
_081422AC: .4byte sub_8141FC4
_081422B0: .4byte gTasks
_081422B4: .4byte sub_81422B8
	thumb_func_end sub_8142274

	thumb_func_start sub_81422B8
sub_81422B8: @ 81422B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081422D8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r2, [r1, 0xE]
	movs r3, 0xE
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _081422DC
	subs r0, r2, 0x1
	strh r0, [r1, 0xE]
	b _081422E0
	.align 2, 0
_081422D8: .4byte gTasks
_081422DC:
	ldr r0, _081422E4 @ =sub_81422E8
	str r0, [r1]
_081422E0:
	pop {r0}
	bx r0
	.align 2, 0
_081422E4: .4byte sub_81422E8
	thumb_func_end sub_81422B8

	thumb_func_start sub_81422E8
sub_81422E8: @ 81422E8
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08142314 @ =gWindowConfig_81E7198
	adds r0, r5, 0
	bl SetUpWindowConfig
	adds r0, r5, 0
	bl InitMenuWindow
	ldr r1, _08142318 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0814231C @ =sub_8142320
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08142314: .4byte gWindowConfig_81E7198
_08142318: .4byte gTasks
_0814231C: .4byte sub_8142320
	thumb_func_end sub_81422E8

	thumb_func_start sub_8142320
sub_8142320: @ 8142320
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _08142350 @ =0x0201c000
	ldr r0, _08142354 @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldrh r6, [r1, 0xA]
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 2
	adds r4, r0, r2
	movs r2, 0xC
	ldrsh r0, [r1, r2]
	cmp r0, 0x3
	ble _0814235C
	ldr r1, _08142358 @ =gUnknown_0840B534
	b _0814235E
	.align 2, 0
_08142350: .4byte 0x0201c000
_08142354: .4byte gTasks
_08142358: .4byte gUnknown_0840B534
_0814235C:
	ldr r1, _081423F0 @ =gUnknown_0840B564
_0814235E:
	lsls r2, r6, 3
	adds r0, r2, r1
	ldrh r5, [r0]
	adds r0, r1, 0x2
	adds r0, r2, r0
	ldrh r3, [r0]
	adds r0, r1, 0x4
	adds r0, r2, r0
	ldrh r0, [r0]
	mov r9, r0
	adds r1, 0x6
	adds r2, r1
	ldrh r2, [r2]
	mov r8, r2
	ldrh r0, [r4, 0x8]
	lsls r0, 23
	lsrs r0, 23
	lsls r1, r5, 16
	asrs r1, 16
	lsls r2, r3, 16
	asrs r2, 16
	ldr r3, [r4]
	str r3, [sp]
	ldr r3, [r4, 0x4]
	str r3, [sp, 0x4]
	adds r3, r6, 0
	bl sub_81436BC
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _081423F4 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r2, r1, r3
	movs r4, 0
	mov r5, r9
	strh r5, [r2, 0x30]
	mov r5, r8
	strh r5, [r2, 0x32]
	strh r4, [r2, 0x2E]
	adds r3, 0x1C
	adds r1, r3
	ldr r2, _081423F8 @ =sub_81435DC
	str r2, [r1]
	ldr r5, _081423FC @ =gTasks
	adds r1, r6, 0x5
	lsls r1, 1
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r1, r4
	adds r2, r5, 0
	adds r2, 0x8
	adds r1, r2
	strh r0, [r1]
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r4, r5
	ldr r0, _08142400 @ =sub_8142404
	str r0, [r4]
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081423F0: .4byte gUnknown_0840B564
_081423F4: .4byte gSprites
_081423F8: .4byte sub_81435DC
_081423FC: .4byte gTasks
_08142400: .4byte sub_8142404
	thumb_func_end sub_8142320

	thumb_func_start sub_8142404
sub_8142404: @ 8142404
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08142470 @ =0x0201c000
	ldr r3, _08142474 @ =gTasks
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r5, r2, r3
	ldrh r1, [r5, 0xA]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r6, r0, r4
	ldr r4, _08142478 @ =gSprites
	adds r1, 0x5
	lsls r1, 1
	adds r1, r2
	adds r3, 0x8
	adds r1, r3
	movs r0, 0
	ldrsh r1, [r1, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0814246A
	ldrh r2, [r6, 0x8]
	ldr r0, _0814247C @ =0x000001ff
	ands r0, r2
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _08142458
	lsls r0, r2, 23
	lsrs r0, 23
	movs r1, 0
	bl PlayCry1
_08142458:
	adds r0, r6, 0
	movs r1, 0
	movs r2, 0xE
	bl sub_8143088
	movs r0, 0x78
	strh r0, [r5, 0xE]
	ldr r0, _08142480 @ =sub_8142484
	str r0, [r5]
_0814246A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08142470: .4byte 0x0201c000
_08142474: .4byte gTasks
_08142478: .4byte gSprites
_0814247C: .4byte 0x000001ff
_08142480: .4byte sub_8142484
	thumb_func_end sub_8142404

	thumb_func_start sub_8142484
sub_8142484: @ 8142484
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _081424BC @ =0x0201c000
	ldr r1, _081424C0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	adds r4, r6, r1
	ldrh r3, [r4, 0xA]
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r0, r2
	mov r9, r0
	ldrh r2, [r4, 0xE]
	movs r7, 0xE
	ldrsh r0, [r4, r7]
	mov r12, r1
	cmp r0, 0
	beq _081424C4
	subs r0, r2, 0x1
	strh r0, [r4, 0xE]
	b _0814255C
	.align 2, 0
_081424BC: .4byte 0x0201c000
_081424C0: .4byte gTasks
_081424C4:
	ldr r2, _0814253C @ =gUnknown_0203931C
	ldr r0, _08142540 @ =gSprites
	mov r8, r0
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r6
	mov r1, r12
	adds r1, 0x8
	adds r6, r0, r1
	movs r7, 0
	ldrsh r1, [r6, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r0
	ldr r3, [r2]
	orrs r3, r1
	str r3, [r2]
	ldrh r2, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bgt _08142550
	mov r7, r9
	ldrh r1, [r7, 0x1C]
	ldr r0, _08142544 @ =0x000001ff
	ands r0, r1
	cmp r0, 0
	beq _08142550
	adds r0, r2, 0x1
	strh r0, [r4, 0xA]
	ldr r0, _08142548 @ =0x0000735f
	str r0, [sp]
	adds r0, r3, 0
	movs r1, 0
	movs r2, 0xC
	movs r3, 0xC
	bl BeginNormalPaletteFade
	movs r0, 0
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r0, _0814254C @ =sub_8142320
	str r0, [r4]
	b _0814255C
	.align 2, 0
_0814253C: .4byte gUnknown_0203931C
_08142540: .4byte gSprites
_08142544: .4byte 0x000001ff
_08142548: .4byte 0x0000735f
_0814254C: .4byte sub_8142320
_08142550:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	add r0, r12
	ldr r1, _0814256C @ =sub_8142570
	str r1, [r0]
_0814255C:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814256C: .4byte sub_8142570
	thumb_func_end sub_8142484

	thumb_func_start sub_8142570
sub_8142570: @ 8142570
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08142604 @ =0xffff0000
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r3, 0
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r5, r0, 3
	ldr r0, _08142608 @ =gTasks + 0x8
	mov r12, r0
	mov r8, r1
	ldr r6, _0814260C @ =gSprites
	movs r7, 0xD
	negs r7, r7
_0814259E:
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r5
	mov r2, r12
	adds r1, r0, r2
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0xFF
	beq _081425C0
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	strb r0, [r1, 0x5]
_081425C0:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _0814259E
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xF
	bl sub_8143068
	movs r0, 0x69
	bl PlaySE
	ldr r1, _08142610 @ =gTasks
	mov r2, r8
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0xC8
	lsls r1, 1
	strh r1, [r0, 0xE]
	ldr r1, _08142614 @ =sub_8142618
	str r1, [r0]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142604: .4byte 0xffff0000
_08142608: .4byte gTasks + 0x8
_0814260C: .4byte gSprites
_08142610: .4byte gTasks
_08142614: .4byte sub_8142618
	thumb_func_end sub_8142570

	thumb_func_start sub_8142618
sub_8142618: @ 8142618
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r7, _08142658 @ =gTasks
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r5, r0, 3
	adds r1, r5, r7
	ldrh r2, [r1, 0xE]
	movs r3, 0xE
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0814265C
	subs r2, 0x1
	strh r2, [r1, 0xE]
	movs r0, 0x3
	ands r0, r2
	cmp r0, 0
	bne _081426D2
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x6E
	ble _081426D2
	bl sub_81438C4
	b _081426D2
	.align 2, 0
_08142658: .4byte gTasks
_0814265C:
	movs r3, 0
	mov r9, r4
	ldr r0, _081426E4 @ =gUnknown_0203931C
	mov r10, r0
	adds r4, r5, 0
	adds r7, 0x8
	mov r8, r7
	ldr r7, _081426E8 @ =gSprites
	movs r1, 0xD
	negs r1, r1
	mov r12, r1
	movs r5, 0x4
_08142674:
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r4
	mov r2, r8
	adds r1, r0, r2
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0xFF
	beq _08142698
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r2, [r1, 0x5]
	mov r0, r12
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
_08142698:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _08142674
	mov r3, r10
	ldr r0, [r3]
	ldr r1, _081426EC @ =0x0000735f
	str r1, [sp]
	movs r1, 0
	movs r2, 0xC
	movs r3, 0xC
	bl BeginNormalPaletteFade
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _081426F0 @ =gTasks
	mov r2, r9
	adds r0, r2, r6
	lsls r0, 3
	adds r0, r1
	movs r1, 0x7
	strh r1, [r0, 0xE]
	ldr r1, _081426F4 @ =sub_81426F8
	str r1, [r0]
_081426D2:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081426E4: .4byte gUnknown_0203931C
_081426E8: .4byte gSprites
_081426EC: .4byte 0x0000735f
_081426F0: .4byte gTasks
_081426F4: .4byte sub_81426F8
	thumb_func_end sub_8142618

	thumb_func_start sub_81426F8
sub_81426F8: @ 81426F8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08142718 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r2
	ldrh r1, [r2, 0xE]
	movs r3, 0xE
	ldrsh r0, [r2, r3]
	cmp r0, 0xF
	ble _08142720
	ldr r0, _0814271C @ =sub_8142738
	str r0, [r2]
	b _0814272E
	.align 2, 0
_08142718: .4byte gTasks
_0814271C: .4byte sub_8142738
_08142720:
	adds r0, r1, 0x1
	strh r0, [r2, 0xE]
	ldr r1, _08142734 @ =REG_BLDALPHA
	movs r3, 0xE
	ldrsh r0, [r2, r3]
	lsls r0, 8
	strh r0, [r1]
_0814272E:
	pop {r0}
	bx r0
	.align 2, 0
_08142734: .4byte REG_BLDALPHA
	thumb_func_end sub_81426F8

	thumb_func_start sub_8142738
sub_8142738: @ 8142738
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xCA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _08142784 @ =gWindowConfig_81E71B4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r0, _08142788 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	movs r1, 0x78
	movs r2, 0x48
	movs r3, 0x6
	bl sub_81437A4
	ldr r2, _0814278C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r2
	strh r0, [r1, 0x10]
	movs r0, 0x78
	strh r0, [r1, 0xE]
	ldr r0, _08142790 @ =sub_8142794
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08142784: .4byte gWindowConfig_81E71B4
_08142788: .4byte gSaveBlock2
_0814278C: .4byte gTasks
_08142790: .4byte sub_8142794
	thumb_func_end sub_8142738

	thumb_func_start sub_8142794
sub_8142794: @ 8142794
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081427B4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _081427B8
	subs r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _0814280A
	.align 2, 0
_081427B4: .4byte gTasks
_081427B8:
	ldr r2, _081427D8 @ =gSprites
	movs r3, 0x10
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrh r2, [r1, 0x20]
	movs r3, 0x20
	ldrsh r0, [r1, r3]
	cmp r0, 0xA0
	beq _081427DC
	adds r0, r2, 0x1
	strh r0, [r1, 0x20]
	b _0814280A
	.align 2, 0
_081427D8: .4byte gSprites
_081427DC:
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0xF
	movs r3, 0x9
	bl MenuDrawTextWindow
	movs r0, 0x1
	movs r1, 0x2
	bl sub_8143300
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08142810 @ =gMenuText_HOFCongratulations
	movs r1, 0x4
	movs r2, 0xF
	bl MenuPrint
	ldr r0, _08142814 @ =sub_8142818
	str r0, [r4]
_0814280A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142810: .4byte gMenuText_HOFCongratulations
_08142814: .4byte sub_8142818
	thumb_func_end sub_8142794

	thumb_func_start sub_8142818
sub_8142818: @ 8142818
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08142844 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0814283E
	movs r0, 0x4
	bl FadeOutBGM
	ldr r0, _08142848 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0814284C @ =sub_8142850
	str r0, [r1]
_0814283E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142844: .4byte gMain
_08142848: .4byte gTasks
_0814284C: .4byte sub_8142850
	thumb_func_end sub_8142818

	thumb_func_start sub_8142850
sub_8142850: @ 8142850
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08142890 @ =gPlttBufferFaded
	ldr r1, _08142894 @ =gPlttBufferUnfaded
	movs r2, 0x80
	lsls r2, 2
	bl CpuSet
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r1, 0x8
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08142898 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0814289C @ =sub_81428A0
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08142890: .4byte gPlttBufferFaded
_08142894: .4byte gPlttBufferUnfaded
_08142898: .4byte gTasks
_0814289C: .4byte sub_81428A0
	thumb_func_end sub_8142850

	thumb_func_start sub_81428A0
sub_81428A0: @ 81428A0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _081428C4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081428BE
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _081428C8 @ =sub_81439D0
	bl SetMainCallback2
_081428BE:
	pop {r0}
	bx r0
	.align 2, 0
_081428C4: .4byte gPaletteFade
_081428C8: .4byte sub_81439D0
	thumb_func_end sub_81428A0

	thumb_func_start sub_81428CC
sub_81428CC: @ 81428CC
	push {r4,r5,lr}
	ldr r0, _081428E4 @ =gMain
	ldr r1, _081428E8 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _08142908
	lsls r0, 2
	ldr r1, _081428EC @ =_081428F0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081428E4: .4byte gMain
_081428E8: .4byte 0x0000043c
_081428EC: .4byte _081428F0
	.align 2, 0
_081428F0:
	.4byte _08142908
	.4byte _08142928
	.4byte _0814293C
	.4byte _08142980
	.4byte _081429C0
	.4byte _081429EC
_08142908:
	movs r0, 0
	bl SetVBlankCallback
	bl sub_81433E0
	ldr r0, _08142920 @ =gMain
	ldr r2, _08142924 @ =0x0000043c
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0]
	b _08142A12
	.align 2, 0
_08142920: .4byte gMain
_08142924: .4byte 0x0000043c
_08142928:
	bl sub_8143570
	ldr r1, _08142934 @ =gMain
	ldr r3, _08142938 @ =0x0000043c
	adds r1, r3
	b _081429DC
	.align 2, 0
_08142934: .4byte gMain
_08142938: .4byte 0x0000043c
_0814293C:
	ldr r0, _08142968 @ =sub_8141E38
	bl SetVBlankCallback
	ldr r3, _0814296C @ =0x04000208
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _08142970 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08142974 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08142978 @ =gMain
	ldr r4, _0814297C @ =0x0000043c
	adds r1, r4
	b _081429DC
	.align 2, 0
_08142968: .4byte sub_8141E38
_0814296C: .4byte 0x04000208
_08142970: .4byte 0x04000200
_08142974: .4byte REG_DISPSTAT
_08142978: .4byte gMain
_0814297C: .4byte 0x0000043c
_08142980:
	ldr r0, _081429AC @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl sub_81435B8
	ldr r0, _081429B0 @ =0x0201c000
	adds r2, r0, 0
	ldr r1, _081429B4 @ =gUnknown_0840B57C
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	ldm r1!, {r3,r5}
	stm r2!, {r3,r5}
	bl sub_80C5CD4
	ldr r1, _081429B8 @ =gMain
	ldr r4, _081429BC @ =0x0000043c
	adds r1, r4
	b _081429DC
	.align 2, 0
_081429AC: .4byte REG_BLDCNT
_081429B0: .4byte 0x0201c000
_081429B4: .4byte gUnknown_0840B57C
_081429B8: .4byte gMain
_081429BC: .4byte 0x0000043c
_081429C0:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl sub_80C5DCC
	lsls r0, 24
	cmp r0, 0
	beq _08142A12
	ldr r1, _081429E4 @ =gMain
	ldr r5, _081429E8 @ =0x0000043c
	adds r1, r5
_081429DC:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08142A12
	.align 2, 0
_081429E4: .4byte gMain
_081429E8: .4byte 0x0000043c
_081429EC:
	ldr r1, _08142A18 @ =REG_BLDCNT
	ldr r2, _08142A1C @ =0x00003f42
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0xE2
	lsls r3, 3
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08142A20 @ =sub_8142A28
	movs r1, 0
	bl CreateTask
	ldr r0, _08142A24 @ =sub_8141E4C
	bl SetMainCallback2
_08142A12:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08142A18: .4byte REG_BLDCNT
_08142A1C: .4byte 0x00003f42
_08142A20: .4byte sub_8142A28
_08142A24: .4byte sub_8141E4C
	thumb_func_end sub_81428CC

	thumb_func_start sub_8142A28
sub_8142A28: @ 8142A28
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x3
	bl sub_8125EC8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08142A54
	ldr r0, _08142A4C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08142A50 @ =sub_8142FEC
	str r0, [r1]
	b _08142AEA
	.align 2, 0
_08142A4C: .4byte gTasks
_08142A50: .4byte sub_8142FEC
_08142A54:
	ldr r2, _08142A8C @ =0x0201e000
	movs r3, 0
	ldrh r1, [r2, 0x8]
	ldr r4, _08142A90 @ =0x000001ff
	adds r0, r4, 0
	ands r0, r1
	ldr r7, _08142A94 @ =gTasks
	lsls r6, r5, 2
	cmp r0, 0
	beq _08142A7E
_08142A68:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	adds r2, 0x78
	cmp r3, 0x31
	bhi _08142A98
	ldrh r1, [r2, 0x8]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _08142A68
_08142A7E:
	cmp r3, 0x31
	bhi _08142A98
	adds r0, r6, r5
	lsls r0, 3
	adds r0, r7
	subs r1, r3, 0x1
	b _08142AA0
	.align 2, 0
_08142A8C: .4byte 0x0201e000
_08142A90: .4byte 0x000001ff
_08142A94: .4byte gTasks
_08142A98:
	adds r0, r6, r5
	lsls r0, 3
	adds r0, r7
	movs r1, 0x31
_08142AA0:
	strh r1, [r0, 0x8]
	movs r0, 0xA
	bl sub_8053108
	ldr r2, _08142AF0 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r2
	strh r0, [r1, 0xA]
	movs r3, 0
	ldr r7, _08142AF4 @ =0x0600381a
	ldr r4, _08142AF8 @ =0x0600385a
_08142AB8:
	lsls r1, r3, 1
	adds r2, r1, r7
	adds r0, r3, 0x3
	strh r0, [r2]
	adds r1, r4
	adds r0, 0x11
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x10
	bls _08142AB8
	ldr r4, _08142AFC @ =gWindowConfig_81E7198
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r1, _08142AF0 @ =gTasks
	adds r0, r6, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08142B00 @ =sub_8142B04
	str r1, [r0]
_08142AEA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142AF0: .4byte gTasks
_08142AF4: .4byte 0x0600381a
_08142AF8: .4byte 0x0600385a
_08142AFC: .4byte gWindowConfig_81E7198
_08142B00: .4byte sub_8142B04
	thumb_func_end sub_8142A28

	thumb_func_start sub_8142B04
sub_8142B04: @ 8142B04
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r3, _08142BB8 @ =0x0201e000
	movs r5, 0
	ldr r1, _08142BBC @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r6, r1, 0
	ldr r2, _08142BC0 @ =gUnknown_0203931C
	cmp r5, r0
	bge _08142B3E
	adds r1, r0, 0
_08142B32:
	adds r3, 0x78
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r1
	blt _08142B32
_08142B3E:
	adds r4, r3, 0
	movs r0, 0
	str r0, [r2]
	mov r5, r8
	lsls r2, r5, 2
	adds r1, r2, r5
	lsls r1, 3
	adds r1, r6
	strh r0, [r1, 0xC]
	strh r0, [r1, 0x10]
	movs r5, 0
	str r2, [sp, 0xC]
	ldr r6, _08142BC4 @ =0x000001ff
	adds r2, r1, 0
_08142B5A:
	ldrh r1, [r4, 0x8]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _08142B6A
	ldrh r0, [r2, 0x10]
	adds r0, 0x1
	strh r0, [r2, 0x10]
_08142B6A:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, 0x14
	cmp r5, 0x5
	bls _08142B5A
	adds r4, r3, 0
	movs r5, 0
	ldr r1, _08142BBC @ =gTasks
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r7, r0, 3
	adds r6, r7, r1
	str r6, [sp, 0x8]
	adds r1, 0x8
	mov r9, r1
	ldr r0, _08142BC8 @ =gUnknown_0840B564
	mov r10, r0
_08142B8E:
	ldrh r1, [r4, 0x8]
	ldr r2, _08142BC4 @ =0x000001ff
	adds r0, r2, 0
	ands r0, r1
	adds r6, r1, 0
	cmp r0, 0
	beq _08142C30
	ldr r1, [sp, 0x8]
	movs r2, 0x10
	ldrsh r0, [r1, r2]
	cmp r0, 0x3
	ble _08142BD4
	lsls r1, r5, 3
	ldr r0, _08142BCC @ =gUnknown_0840B534
	adds r0, 0x4
	adds r0, r1, r0
	ldrh r3, [r0]
	ldr r0, _08142BD0 @ =gUnknown_0840B53A
	adds r1, r0
	b _08142BE2
	.align 2, 0
_08142BB8: .4byte 0x0201e000
_08142BBC: .4byte gTasks
_08142BC0: .4byte gUnknown_0203931C
_08142BC4: .4byte 0x000001ff
_08142BC8: .4byte gUnknown_0840B564
_08142BCC: .4byte gUnknown_0840B534
_08142BD0: .4byte gUnknown_0840B53A
_08142BD4:
	lsls r1, r5, 3
	mov r0, r10
	adds r0, 0x4
	adds r0, r1, r0
	ldrh r3, [r0]
	ldr r2, _08142C28 @ =gUnknown_0840B56A
	adds r1, r2
_08142BE2:
	ldrh r2, [r1]
	lsls r0, r6, 23
	lsrs r0, 23
	lsls r1, r3, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	ldr r3, [r4]
	str r3, [sp]
	ldr r3, [r4, 0x4]
	str r3, [sp, 0x4]
	adds r3, r5, 0
	bl sub_81436BC
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08142C2C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r3, [r1, 0x5]
	movs r6, 0xD
	negs r6, r6
	adds r2, r6, 0
	ands r3, r2
	movs r2, 0x4
	orrs r3, r2
	strb r3, [r1, 0x5]
	adds r1, r5, 0x5
	lsls r1, 1
	adds r1, r7
	add r1, r9
	strh r0, [r1]
	b _08142C3C
	.align 2, 0
_08142C28: .4byte gUnknown_0840B56A
_08142C2C: .4byte gSprites
_08142C30:
	adds r0, r5, 0x5
	lsls r0, 1
	adds r0, r7
	add r0, r9
	movs r1, 0xFF
	strh r1, [r0]
_08142C3C:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, 0x14
	cmp r5, 0x5
	bls _08142B8E
	ldr r0, _08142CB0 @ =0xffff0000
	ldr r2, _08142CB4 @ =0x0000735f
	movs r1, 0xC
	bl BlendPalettes
	ldr r3, _08142CB8 @ =gStringVar1
	ldr r1, _08142CBC @ =gMenuText_HOFNumber
	adds r0, r3, 0
	bl StringCopy
	adds r3, r0, 0
	movs r5, 0xFC
	strb r5, [r3]
	movs r0, 0x14
	strb r0, [r3, 0x1]
	movs r0, 0x6
	strb r0, [r3, 0x2]
	adds r3, 0x3
	ldr r0, _08142CC0 @ =gTasks
	ldr r4, [sp, 0xC]
	add r4, r8
	lsls r4, 3
	adds r4, r0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	adds r0, r3, 0
	bl ConvertIntToDecimalString
	adds r3, r0, 0
	strb r5, [r3]
	movs r0, 0x13
	strb r0, [r3, 0x1]
	movs r0, 0xF0
	strb r0, [r3, 0x2]
	movs r0, 0xFF
	strb r0, [r3, 0x3]
	ldr r0, _08142CB8 @ =gStringVar1
	movs r1, 0
	movs r2, 0
	bl MenuPrint
	ldr r0, _08142CC4 @ =sub_8142CC8
	str r0, [r4]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142CB0: .4byte 0xffff0000
_08142CB4: .4byte 0x0000735f
_08142CB8: .4byte gStringVar1
_08142CBC: .4byte gMenuText_HOFNumber
_08142CC0: .4byte gTasks
_08142CC4: .4byte sub_8142CC8
	thumb_func_end sub_8142B04

	thumb_func_start sub_8142CC8
sub_8142CC8: @ 8142CC8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08142DD0 @ =0x0201e000
	mov r8, r0
	movs r3, 0
	ldr r1, _08142DD4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	cmp r3, r0
	bge _08142CFE
	adds r1, r0, 0
_08142CF0:
	movs r0, 0x78
	add r8, r0
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r1
	blt _08142CF0
_08142CFE:
	movs r3, 0
	lsls r6, r4, 2
	adds r0, r6, r4
	lsls r5, r0, 3
	ldr r1, _08142DD8 @ =gTasks + 0x8
	mov r10, r1
	ldr r2, _08142DDC @ =gSprites
	mov r12, r2
	movs r0, 0xD
	negs r0, r0
	mov r9, r0
	movs r7, 0x4
_08142D16:
	adds r0, r3, 0x5
	lsls r0, 1
	adds r0, r5
	add r0, r10
	ldrh r1, [r0]
	cmp r1, 0xFF
	beq _08142D36
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r12
	ldrb r2, [r0, 0x5]
	mov r1, r9
	ands r1, r2
	orrs r1, r7
	strb r1, [r0, 0x5]
_08142D36:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x5
	bls _08142D16
	adds r1, r6, r4
	lsls r1, 3
	ldr r2, _08142DD4 @ =gTasks
	adds r5, r1, r2
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	adds r0, 0x5
	lsls r0, 1
	adds r0, r1
	ldr r1, _08142DD4 @ =gTasks
	adds r1, 0x8
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08142DDC @ =gSprites
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	strb r1, [r0, 0x5]
	lsrs r1, 4
	movs r0, 0x80
	lsls r0, 9
	lsls r0, r1
	ldr r1, _08142DE0 @ =0xffff0000
	eors r0, r1
	ldr r2, _08142DE4 @ =gUnknown_0203931C
	str r0, [r2]
	ldr r2, _08142DE8 @ =0x0000735f
	movs r1, 0xC
	bl BlendPalettesUnfaded
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	mov r1, r8
	adds r4, r1, r0
	ldrh r1, [r4, 0x8]
	ldr r0, _08142DEC @ =0x000001ff
	ands r0, r1
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _08142DB2
	bl StopCryAndClearCrySongs
	ldrh r0, [r4, 0x8]
	lsls r0, 23
	lsrs r0, 23
	movs r1, 0
	bl PlayCry1
_08142DB2:
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xE
	bl sub_8143088
	ldr r0, _08142DF0 @ =sub_8142DF4
	str r0, [r5]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142DD0: .4byte 0x0201e000
_08142DD4: .4byte gTasks
_08142DD8: .4byte gTasks + 0x8
_08142DDC: .4byte gSprites
_08142DE0: .4byte 0xffff0000
_08142DE4: .4byte gUnknown_0203931C
_08142DE8: .4byte 0x0000735f
_08142DEC: .4byte 0x000001ff
_08142DF0: .4byte sub_8142DF4
	thumb_func_end sub_8142CC8

	thumb_func_start sub_8142DF4
sub_8142DF4: @ 8142DF4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08142E88 @ =gMain
	ldrh r2, [r1, 0x2E]
	movs r0, 0x1
	ands r0, r2
	adds r3, r1, 0
	cmp r0, 0
	beq _08142EC4
	ldr r7, _08142E8C @ =gTasks
	lsls r0, r6, 2
	adds r1, r0, r6
	lsls r3, r1, 3
	adds r4, r3, r7
	ldrh r2, [r4, 0x8]
	movs r5, 0x8
	ldrsh r1, [r4, r5]
	mov r8, r0
	cmp r1, 0
	beq _08142E98
	subs r0, r2, 0x1
	strh r0, [r4, 0x8]
	movs r5, 0
	adds r7, 0x8
	mov r9, r7
	adds r7, r3, 0
_08142E30:
	adds r0, r5, 0x5
	lsls r0, 1
	adds r0, r7
	add r0, r9
	ldrb r1, [r0]
	cmp r1, 0xFF
	beq _08142E5E
	ldr r0, _08142E90 @ =gSprites
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	ldrb r0, [r4, 0x5]
	lsrs r0, 4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	adds r0, r4, 0
	bl DestroySprite
_08142E5E:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _08142E30
	ldr r0, _08142E8C @ =gTasks
	mov r2, r8
	adds r1, r2, r6
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08142E80
	subs r0, r2, 0x1
	strh r0, [r1, 0xA]
_08142E80:
	ldr r0, _08142E94 @ =sub_8142B04
	str r0, [r1]
	b _08142F64
	.align 2, 0
_08142E88: .4byte gMain
_08142E8C: .4byte gTasks
_08142E90: .4byte gSprites
_08142E94: .4byte sub_8142B04
_08142E98:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	beq _08142EB2
	bl StopCryAndClearCrySongs
	ldr r0, _08142EB8 @ =gMPlay_BGM
	ldr r1, _08142EBC @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
_08142EB2:
	ldr r0, _08142EC0 @ =sub_8142F78
	str r0, [r4]
	b _08142F64
	.align 2, 0
_08142EB8: .4byte gMPlay_BGM
_08142EBC: .4byte 0x0000ffff
_08142EC0: .4byte sub_8142F78
_08142EC4:
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _08142F08
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	beq _08142EE6
	bl StopCryAndClearCrySongs
	ldr r0, _08142EF8 @ =gMPlay_BGM
	ldr r1, _08142EFC @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
_08142EE6:
	ldr r0, _08142F00 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _08142F04 @ =sub_8142F78
	str r0, [r1]
	b _08142F64
	.align 2, 0
_08142EF8: .4byte gMPlay_BGM
_08142EFC: .4byte 0x0000ffff
_08142F00: .4byte gTasks
_08142F04: .4byte sub_8142F78
_08142F08:
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	beq _08142F38
	ldr r0, _08142F30 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xC]
	movs r4, 0xC
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _08142F38
	subs r0, r2, 0x1
	strh r0, [r1, 0xC]
	ldr r0, _08142F34 @ =sub_8142CC8
	str r0, [r1]
	b _08142F64
	.align 2, 0
_08142F30: .4byte gTasks
_08142F34: .4byte sub_8142CC8
_08142F38:
	ldrh r1, [r3, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08142F64
	ldr r1, _08142F70 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r2, r0, r1
	movs r5, 0xC
	ldrsh r1, [r2, r5]
	movs r3, 0x10
	ldrsh r0, [r2, r3]
	subs r0, 0x1
	cmp r1, r0
	bge _08142F64
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	ldr r0, _08142F74 @ =sub_8142CC8
	str r0, [r2]
_08142F64:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142F70: .4byte gTasks
_08142F74: .4byte sub_8142CC8
	thumb_func_end sub_8142DF4

	thumb_func_start sub_8142F78
sub_8142F78: @ 8142F78
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08142FB4 @ =gPlttBufferFaded
	ldr r1, _08142FB8 @ =gPlttBufferUnfaded
	movs r2, 0x80
	lsls r2, 2
	bl CpuSet
	ldr r0, _08142FBC @ =0x0201c000
	adds r2, r0, 0
	ldr r1, _08142FC0 @ =gUnknown_0840B57C
	ldm r1!, {r3,r5,r6}
	stm r2!, {r3,r5,r6}
	ldm r1!, {r3,r5}
	stm r2!, {r3,r5}
	bl sub_80C5E38
	ldr r1, _08142FC4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08142FC8 @ =sub_8142FCC
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08142FB4: .4byte gPlttBufferFaded
_08142FB8: .4byte gPlttBufferUnfaded
_08142FBC: .4byte 0x0201c000
_08142FC0: .4byte gUnknown_0840B57C
_08142FC4: .4byte gTasks
_08142FC8: .4byte sub_8142FCC
	thumb_func_end sub_8142F78

	thumb_func_start sub_8142FCC
sub_8142FCC: @ 8142FCC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80C5F98
	lsls r0, 24
	cmp r0, 0
	beq _08142FE6
	adds r0, r4, 0
	bl DestroyTask
	bl ReturnFromHallOfFamePC
_08142FE6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8142FCC

	thumb_func_start sub_8142FEC
sub_8142FEC: @ 8142FEC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08143020 @ =gMenuText_HOFCorrupt
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r1, _08143024 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08143028 @ =sub_814302C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08143020: .4byte gMenuText_HOFCorrupt
_08143024: .4byte gTasks
_08143028: .4byte sub_814302C
	thumb_func_end sub_8142FEC

	thumb_func_start sub_814302C
sub_814302C: @ 814302C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08143056
	ldr r0, _0814305C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08143056
	ldr r0, _08143060 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08143064 @ =sub_8142F78
	str r0, [r1]
_08143056:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814305C: .4byte gMain
_08143060: .4byte gTasks
_08143064: .4byte sub_8142F78
	thumb_func_end sub_814302C

	thumb_func_start sub_8143068
sub_8143068: @ 8143068
	push {lr}
	lsls r2, r1, 24
	ldr r0, _08143084 @ =gMenuText_WelcomeToHOFAndDexRating
	movs r1, 0x80
	lsls r1, 17
	adds r2, r1
	lsrs r2, 24
	movs r1, 0
	movs r3, 0xF0
	bl sub_8072BD8
	pop {r0}
	bx r0
	.align 2, 0
_08143084: .4byte gMenuText_WelcomeToHOFAndDexRating
	thumb_func_end sub_8143068

	thumb_func_start sub_8143088
sub_8143088: @ 8143088
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	ldr r7, _08143188 @ =gStringVar1
	movs r0, 0xFC
	strb r0, [r7]
	movs r0, 0x13
	strb r0, [r7, 0x1]
	movs r0, 0x28
	strb r0, [r7, 0x2]
	movs r0, 0xFF
	strb r0, [r7, 0x3]
	mov r0, r9
	ldrh r2, [r0, 0x8]
	ldr r0, _0814318C @ =0x000001ff
	ands r0, r2
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _081430EA
	lsls r0, r2, 23
	lsrs r0, 23
	bl SpeciesToPokedexNum
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _08143190 @ =0x0000ffff
	cmp r6, r0
	beq _081430EA
	ldr r1, _08143194 @ =gOtherText_Number2
	adds r0, r7, 0
	bl StringCopy
	adds r7, r0, 0
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
_081430EA:
	ldr r5, _08143188 @ =gStringVar1
	mov r1, r8
	adds r1, 0x4
	lsls r1, 24
	lsrs r1, 24
	mov r4, r10
	adds r4, 0x1
	lsls r2, r4, 24
	lsrs r2, 24
	adds r0, r5, 0
	bl MenuPrint
	adds r7, r5, 0
	movs r3, 0
	mov r1, r9
	ldrb r0, [r1, 0xA]
	str r4, [sp]
	mov r2, r8
	adds r2, 0x9
	str r2, [sp, 0xC]
	mov r6, r10
	adds r6, 0x3
	str r6, [sp, 0x8]
	cmp r0, 0xFF
	beq _0814313A
	mov r2, r9
	adds r2, 0xA
_08143120:
	adds r1, r7, r3
	adds r0, r2, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x9
	bhi _0814313A
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08143120
_0814313A:
	adds r7, r3
	movs r2, 0xFF
	strb r2, [r7]
	mov r1, r9
	ldrh r0, [r1, 0x8]
	ldr r1, _0814318C @ =0x000001ff
	ands r1, r0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bne _08143198
	movs r0, 0xFC
	strb r0, [r7]
	movs r0, 0x13
	strb r0, [r7, 0x1]
	movs r0, 0xA0
	strb r0, [r7, 0x2]
	strb r2, [r7, 0x3]
	ldr r0, _08143188 @ =gStringVar1
	ldr r2, [sp, 0xC]
	lsls r1, r2, 24
	lsrs r1, 24
	ldr r3, [sp]
	lsls r2, r3, 24
	lsrs r2, 24
	bl MenuPrint
	ldr r6, [sp, 0x8]
	lsls r1, r6, 24
	lsrs r1, 24
	mov r3, r10
	adds r3, 0x4
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0
	movs r2, 0x1D
	bl MenuZeroFillWindowRect
	b _081432E4
	.align 2, 0
_08143188: .4byte gStringVar1
_0814318C: .4byte 0x000001ff
_08143190: .4byte 0x0000ffff
_08143194: .4byte gOtherText_Number2
_08143198:
	movs r0, 0xFC
	strb r0, [r7]
	movs r0, 0x13
	strb r0, [r7, 0x1]
	movs r0, 0x3E
	strb r0, [r7, 0x2]
	adds r7, 0x3
	movs r0, 0xBA
	strb r0, [r7]
	adds r7, 0x1
	movs r3, 0
	ldr r2, _08143238 @ =gSpeciesNames
	mov r1, r9
	ldrh r0, [r1, 0x8]
	lsls r0, 23
	lsrs r0, 23
	movs r1, 0xB
	muls r0, r1
	adds r0, r2
	ldrb r0, [r0]
	mov r6, r8
	adds r6, 0x7
	str r6, [sp, 0x4]
	mov r1, r8
	adds r1, 0xD
	str r1, [sp, 0x10]
	cmp r0, 0xFF
	beq _08143204
	adds r5, r2, 0
	movs r4, 0xB
_081431D4:
	adds r1, r7, r3
	mov r6, r9
	ldrh r0, [r6, 0x8]
	lsls r0, 23
	lsrs r0, 23
	muls r0, r4
	adds r0, r3, r0
	adds r0, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x9
	bhi _08143204
	ldrh r0, [r6, 0x8]
	lsls r0, 23
	lsrs r0, 23
	muls r0, r4
	adds r0, r3, r0
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _081431D4
_08143204:
	adds r7, r3
	movs r0, 0
	strb r0, [r7]
	adds r7, 0x1
	mov r1, r9
	ldrh r0, [r1, 0x8]
	ldr r1, _0814323C @ =0x000001ff
	ands r1, r0
	cmp r1, 0x20
	beq _0814324A
	cmp r1, 0x1D
	beq _0814324A
	lsls r0, 23
	lsrs r0, 23
	mov r2, r9
	ldr r1, [r2, 0x4]
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08143240
	cmp r0, 0xFE
	beq _08143244
	b _0814324A
	.align 2, 0
_08143238: .4byte gSpeciesNames
_0814323C: .4byte 0x000001ff
_08143240:
	movs r0, 0xB5
	b _08143246
_08143244:
	movs r0, 0xB6
_08143246:
	strb r0, [r7]
	adds r7, 0x1
_0814324A:
	movs r4, 0xFC
	strb r4, [r7]
	movs r3, 0x13
	mov r8, r3
	strb r3, [r7, 0x1]
	movs r0, 0xA0
	strb r0, [r7, 0x2]
	movs r6, 0xFF
	mov r10, r6
	strb r6, [r7, 0x3]
	ldr r5, _081432F4 @ =gStringVar1
	ldr r0, [sp, 0xC]
	lsls r1, r0, 24
	lsrs r1, 24
	ldr r3, [sp]
	lsls r2, r3, 24
	lsrs r2, 24
	adds r0, r5, 0
	bl MenuPrint
	mov r6, r9
	ldrb r0, [r6, 0x9]
	lsrs r6, r0, 1
	ldr r1, _081432F8 @ =gOtherText_Level3
	adds r0, r5, 0
	bl StringCopy
	adds r7, r0, 0
	strb r4, [r7]
	movs r0, 0x14
	strb r0, [r7, 0x1]
	movs r0, 0x6
	strb r0, [r7, 0x2]
	adds r7, 0x3
	adds r0, r7, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r7, r0, 0
	strb r4, [r7]
	mov r0, r8
	strb r0, [r7, 0x1]
	movs r0, 0x30
	strb r0, [r7, 0x2]
	mov r1, r10
	strb r1, [r7, 0x3]
	ldr r2, [sp, 0x4]
	lsls r1, r2, 24
	lsrs r1, 24
	ldr r3, [sp, 0x8]
	lsls r4, r3, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r2, r4, 0
	bl MenuPrint
	mov r0, r9
	ldrh r6, [r0]
	ldr r1, _081432FC @ =gOtherText_IDNumber
	adds r0, r5, 0
	bl StringCopy
	adds r7, r0, 0
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	ldr r2, [sp, 0x10]
	lsls r1, r2, 24
	lsrs r1, 24
	adds r0, r5, 0
	adds r2, r4, 0
	bl MenuPrint
_081432E4:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081432F4: .4byte gStringVar1
_081432F8: .4byte gOtherText_Level3
_081432FC: .4byte gOtherText_IDNumber
	thumb_func_end sub_8143088

	thumb_func_start sub_8143300
sub_8143300: @ 8143300
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r5, 24
	lsls r4, 24
	ldr r0, _081433CC @ =gOtherText_Name
	lsrs r1, r5, 24
	mov r8, r1
	movs r2, 0x80
	lsls r2, 17
	adds r5, r2
	lsrs r5, 24
	lsrs r6, r4, 24
	adds r4, r2
	lsrs r4, 24
	adds r1, r5, 0
	adds r2, r4, 0
	bl MenuPrint
	ldr r0, _081433D0 @ =gSaveBlock2
	mov r10, r0
	movs r1, 0xE
	add r8, r1
	mov r2, r8
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	mov r1, r8
	adds r2, r4, 0
	bl MenuPrint_RightAligned
	ldr r0, _081433D4 @ =gOtherText_IDNumber2
	adds r4, r6, 0x3
	lsls r4, 24
	lsrs r4, 24
	adds r1, r5, 0
	adds r2, r4, 0
	bl MenuPrint
	mov r0, r10
	ldrb r1, [r0, 0xA]
	ldrb r0, [r0, 0xB]
	lsls r0, 8
	orrs r1, r0
	ldr r2, _081433D8 @ =gStringVar1
	mov r9, r2
	mov r0, r9
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	mov r0, r9
	mov r1, r8
	adds r2, r4, 0
	bl MenuPrint_RightAligned
	ldr r0, _081433DC @ =gMainMenuString_Time
	adds r6, 0x5
	lsls r6, 24
	lsrs r6, 24
	adds r1, r5, 0
	adds r2, r6, 0
	bl MenuPrint
	mov r0, r10
	ldrh r1, [r0, 0xE]
	mov r0, r9
	bl ConvertIntToDecimalString
	adds r2, r0, 0
	movs r1, 0
	strb r1, [r2]
	movs r0, 0xF0
	strb r0, [r2, 0x1]
	strb r1, [r2, 0x2]
	adds r2, 0x3
	mov r0, r10
	ldrb r1, [r0, 0x10]
	adds r0, r2, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r2, r0, 0
	movs r0, 0xFF
	strb r0, [r2]
	mov r0, r9
	mov r1, r8
	adds r2, r6, 0
	bl MenuPrint_RightAligned
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081433CC: .4byte gOtherText_Name
_081433D0: .4byte gSaveBlock2
_081433D4: .4byte gOtherText_IDNumber2
_081433D8: .4byte gStringVar1
_081433DC: .4byte gMainMenuString_Time
	thumb_func_end sub_8143300

	thumb_func_start sub_81433E0
sub_81433E0: @ 81433E0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x8
	strh r1, [r0]
	adds r0, 0x8
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x8
	strh r1, [r0]
	adds r0, 0xA
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0xA
	strh r1, [r0]
	adds r0, 0xC
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0xC
	strh r1, [r0]
	adds r0, 0xE
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0x4
	mov r8, r0
	ldr r1, _0814354C @ =gHallOfFame_Gfx
	mov r9, r1
	mov r2, sp
	movs r6, 0
	ldr r1, _08143550 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08143554 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_08143444:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _08143444
	strh r6, [r2]
	mov r2, sp
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r2, _08143550 @ =0x040000d4
	mov r1, r8
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xC0
	lsls r1, 19
	mov r0, r9
	bl LZ77UnCompVram
	movs r1, 0
	ldr r3, _08143558 @ =0x06003800
	movs r2, 0x1
_081434B2:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3F
	bls _081434B2
	movs r1, 0
	ldr r5, _0814355C @ =0x02000000
	ldr r3, _08143560 @ =0x06003b80
	movs r2, 0x1
_081434CA:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xBF
	bls _081434CA
	movs r1, 0
	ldr r4, _08143564 @ =0x06003000
	movs r3, 0x2
	ldr r2, _08143568 @ =0x000003ff
_081434E2:
	lsls r0, r1, 1
	adds r0, r4
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bls _081434E2
	adds r2, r5, 0
	movs r3, 0x80
	lsls r3, 7
	mov r4, sp
	movs r6, 0
	ldr r1, _08143550 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08143554 @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_0814350A:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _0814350A
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	ldr r0, _0814356C @ =gHallOfFame_Pal
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814354C: .4byte gHallOfFame_Gfx
_08143550: .4byte 0x040000d4
_08143554: .4byte 0x81000800
_08143558: .4byte 0x06003800
_0814355C: .4byte 0x02000000
_08143560: .4byte 0x06003b80
_08143564: .4byte 0x06003000
_08143568: .4byte 0x000003ff
_0814356C: .4byte gHallOfFame_Pal
	thumb_func_end sub_81433E0

	thumb_func_start sub_8143570
sub_8143570: @ 8143570
	push {r4,lr}
	bl remove_some_task
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _081435A8 @ =gReservedSpritePaletteCount
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _081435AC @ =gUnknown_0840B514
	bl LoadCompressedObjectPic
	ldr r0, _081435B0 @ =gUnknown_0840B524
	bl LoadCompressedObjectPalette
	ldr r4, _081435B4 @ =gWindowConfig_81E71B4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081435A8: .4byte gReservedSpritePaletteCount
_081435AC: .4byte gUnknown_0840B514
_081435B0: .4byte gUnknown_0840B524
_081435B4: .4byte gWindowConfig_81E71B4
	thumb_func_end sub_8143570

	thumb_func_start sub_81435B8
sub_81435B8: @ 81435B8
	ldr r1, _081435D8 @ =REG_BG1CNT
	movs r2, 0xE0
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	subs r2, 0xFD
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xE
	movs r2, 0xDA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_081435D8: .4byte REG_BG1CNT
	thumb_func_end sub_81435B8

	thumb_func_start sub_81435DC
sub_81435DC: @ 81435DC
	push {r4,lr}
	adds r2, r0, 0
	ldr r1, [r2, 0x20]
	ldr r0, [r2, 0x30]
	cmp r1, r0
	beq _08143632
	ldrh r3, [r2, 0x20]
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	movs r4, 0x30
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bge _081435FC
	adds r0, r3, 0
	adds r0, 0xF
	strh r0, [r2, 0x20]
_081435FC:
	ldrh r3, [r2, 0x20]
	movs r4, 0x20
	ldrsh r0, [r2, r4]
	cmp r0, r1
	ble _0814360C
	adds r0, r3, 0
	subs r0, 0xF
	strh r0, [r2, 0x20]
_0814360C:
	ldrh r3, [r2, 0x22]
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r4, 0x32
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bge _08143620
	adds r0, r3, 0
	adds r0, 0xA
	strh r0, [r2, 0x22]
_08143620:
	ldrh r3, [r2, 0x22]
	movs r4, 0x22
	ldrsh r0, [r2, r4]
	cmp r0, r1
	ble _0814363A
	adds r0, r3, 0
	subs r0, 0xA
	strh r0, [r2, 0x22]
	b _0814363A
_08143632:
	movs r0, 0x1
	strh r0, [r2, 0x2E]
	ldr r0, _08143640 @ =nullsub_81
	str r0, [r2, 0x1C]
_0814363A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08143640: .4byte nullsub_81
	thumb_func_end sub_81435DC

	thumb_func_start nullsub_81
nullsub_81: @ 8143644
	bx lr
	thumb_func_end nullsub_81

	thumb_func_start sub_8143648
sub_8143648: @ 8143648
	push {r4-r7,lr}
	lsls r1, 24
	ldr r4, _08143670 @ =gUnknown_02024E8C
	adds r3, r4, 0
	ldr r2, _08143674 @ =gUnknown_0840B6B8
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	strh r0, [r4, 0x2]
	ldr r0, _08143678 @ =gUnknown_0840B69C
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	str r0, [r4, 0xC]
	ldr r0, _0814367C @ =gSpriteAnimTable_81E7C64
	str r0, [r4, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08143670: .4byte gUnknown_02024E8C
_08143674: .4byte gUnknown_0840B6B8
_08143678: .4byte gUnknown_0840B69C
_0814367C: .4byte gSpriteAnimTable_81E7C64
	thumb_func_end sub_8143648

	thumb_func_start sub_8143680
sub_8143680: @ 8143680
	push {r4-r7,lr}
	lsls r1, 24
	ldr r4, _081436AC @ =gUnknown_02024E8C
	adds r3, r4, 0
	ldr r2, _081436B0 @ =gUnknown_0840B6B8
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	strh r0, [r4, 0x2]
	ldr r0, _081436B4 @ =gUnknown_0840B69C
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	str r0, [r4, 0xC]
	ldr r0, _081436B8 @ =gUnknown_081EC2A4
	ldr r0, [r0]
	str r0, [r4, 0x8]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081436AC: .4byte gUnknown_02024E8C
_081436B0: .4byte gUnknown_0840B6B8
_081436B4: .4byte gUnknown_0840B69C
_081436B8: .4byte gUnknown_081EC2A4
	thumb_func_end sub_8143680

	thumb_func_start sub_81436BC
sub_81436BC: @ 81436BC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r6, r0, 0
	mov r9, r1
	mov r10, r2
	mov r8, r3
	ldr r7, [sp, 0x34]
	lsls r6, 16
	lsrs r6, 16
	mov r0, r9
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	mov r1, r10
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	mov r2, r8
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	lsls r0, r6, 3
	ldr r1, _08143790 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _08143794 @ =gMonFrontPicCoords
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08143798 @ =gUnknown_0840B5A0
	mov r12, r4
	mov r5, r8
	lsls r4, r5, 2
	add r4, r12
	ldr r4, [r4]
	str r4, [sp]
	str r6, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r4, 0x1
	str r4, [sp, 0xC]
	bl sub_800D378
	adds r0, r6, 0
	ldr r1, [sp, 0x30]
	adds r2, r7, 0
	bl species_and_otid_get_pal
	lsls r4, r5, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r1, r5, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_8143648
	ldr r0, _0814379C @ =gUnknown_02024E8C
	mov r5, r9
	lsls r5, 16
	asrs r5, 16
	mov r9, r5
	mov r1, r10
	lsls r1, 16
	asrs r1, 16
	mov r10, r1
	movs r3, 0xA
	mov r2, r8
	subs r3, r2
	lsls r3, 24
	lsrs r3, 24
	mov r1, r9
	mov r2, r10
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _081437A0 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r4
	strb r1, [r2, 0x5]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08143790: .4byte gMonFrontPicTable
_08143794: .4byte gMonFrontPicCoords
_08143798: .4byte gUnknown_0840B5A0
_0814379C: .4byte gUnknown_02024E8C
_081437A0: .4byte gSprites
	thumb_func_end sub_81436BC

	thumb_func_start sub_81437A4
sub_81437A4: @ 81437A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r9, r1
	mov r10, r2
	adds r6, r3, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	lsls r6, 16
	lsrs r6, 16
	lsls r7, r0, 3
	ldr r1, _08143854 @ =gTrainerFrontPicTable
	mov r8, r1
	add r8, r7
	ldr r1, _08143858 @ =gTrainerFrontPicCoords
	lsls r2, r0, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r5, _0814385C @ =gUnknown_0840B5A0
	lsls r4, r6, 2
	adds r4, r5
	ldr r4, [r4]
	str r4, [sp]
	str r0, [sp, 0x4]
	mov r0, r8
	bl DecompressPicFromTable_2
	ldr r0, _08143860 @ =gTrainerFrontPicPaletteTable
	adds r0, r7, r0
	ldr r0, [r0]
	lsls r4, r6, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r1, r6, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8143680
	ldr r0, _08143864 @ =gUnknown_02024E8C
	mov r1, r9
	lsls r1, 16
	asrs r1, 16
	mov r9, r1
	mov r2, r10
	lsls r2, 16
	asrs r2, 16
	mov r10, r2
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08143868 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	orrs r1, r4
	strb r1, [r2, 0x5]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08143854: .4byte gTrainerFrontPicTable
_08143858: .4byte gTrainerFrontPicCoords
_0814385C: .4byte gUnknown_0840B5A0
_08143860: .4byte gTrainerFrontPicPaletteTable
_08143864: .4byte gUnknown_02024E8C
_08143868: .4byte gSprites
	thumb_func_end sub_81437A4

	thumb_func_start sub_814386C
sub_814386C: @ 814386C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x26]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	cmp r0, 0x78
	ble _08143882
	adds r0, r5, 0
	bl DestroySprite
	b _081438BA
_08143882:
	adds r0, r1, 0x1
	ldrh r1, [r5, 0x30]
	adds r0, r1
	strh r0, [r5, 0x26]
	ldrh r4, [r5, 0x2E]
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	ands r0, r1
	adds r0, 0x8
	ldr r1, _081438C0 @ =gSineTable
	lsls r4, 1
	adds r4, r1
	movs r2, 0
	ldrsh r1, [r4, r2]
	muls r0, r1
	cmp r0, 0
	bge _081438B0
	adds r0, 0xFF
_081438B0:
	asrs r0, 8
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x4
	strh r0, [r5, 0x2E]
_081438BA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081438C0: .4byte gSineTable
	thumb_func_end sub_814386C

	thumb_func_start sub_81438C4
sub_81438C4: @ 81438C4
	push {r4,lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF0
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl Random
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x7
	ands r2, r0
	negs r2, r2
	ldr r0, _08143934 @ =gSpriteTemplate_840B7A4
	lsls r4, 16
	asrs r4, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r4, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08143938 @ =gSprites
	adds r4, r1, r0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x11
	bl __umodsi3
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	bl Random
	movs r1, 0x3
	ands r1, r0
	cmp r1, 0
	beq _0814393C
	movs r0, 0
	b _0814393E
	.align 2, 0
_08143934: .4byte gSpriteTemplate_840B7A4
_08143938: .4byte gSprites
_0814393C:
	movs r0, 0x1
_0814393E:
	strh r0, [r4, 0x30]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81438C4

	thumb_func_start sub_8143948
sub_8143948: @ 8143948
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8143948

	thumb_func_start sub_814395C
sub_814395C: @ 814395C
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r0, _081439B8 @ =gMain
	ldrh r1, [r0, 0x2C]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081439B2
	ldr r0, _081439BC @ =gUnknown_02039324
	ldrb r0, [r0]
	cmp r0, 0
	beq _081439B2
	ldr r2, _081439C0 @ =gTasks
	ldr r0, _081439C4 @ =gUnknown_02039322
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _081439C8 @ =sub_8143B68
	cmp r1, r0
	bne _081439B2
	bl sub_8143948
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r1, _081439CC @ =gUnknown_02039325
	movs r0, 0x1
	strb r0, [r1]
_081439B2:
	pop {r0}
	bx r0
	.align 2, 0
_081439B8: .4byte gMain
_081439BC: .4byte gUnknown_02039324
_081439C0: .4byte gTasks
_081439C4: .4byte gUnknown_02039322
_081439C8: .4byte sub_8143B68
_081439CC: .4byte gUnknown_02039325
	thumb_func_end sub_814395C

	thumb_func_start sub_81439D0
sub_81439D0: @ 81439D0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	bl sub_8144130
	movs r0, 0
	bl SetVBlankCallback
	bl ResetPaletteFade
	bl ResetTasks
	ldr r0, _08143AF0 @ =sub_8143B38
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08143AF4 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x10]
	strh r1, [r0, 0x16]
	strh r1, [r0, 0x1E]
	movs r1, 0x1
	strh r1, [r0, 0x22]
_08143A0E:
	movs r0, 0
	adds r1, r7, 0
	bl sub_8144ECC
	lsls r0, 24
	cmp r0, 0
	beq _08143A0E
	ldr r6, _08143AF4 @ =gTasks
	lsls r5, r7, 2
	adds r5, r7
	lsls r5, 3
	adds r5, r6
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	movs r1, 0
	mov r9, r1
	movs r2, 0
	mov r8, r2
	movs r1, 0x28
	strh r1, [r0, 0x8]
	ldr r4, _08143AF8 @ =gWindowConfig_81E7208
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r0, _08143AFC @ =gUnknown_0840B7BC
	movs r1, 0x80
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _08143B00 @ =gUnknown_0840B7FC
	ldr r1, _08143B04 @ =0x0600bee0
	movs r2, 0x20
	bl CpuSet
	ldr r1, _08143B08 @ =REG_BG0VOFS
	ldr r2, _08143B0C @ =0x0000fffc
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08143B10 @ =sub_81441B8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	strh r7, [r1, 0xA]
	strh r0, [r5, 0x26]
	movs r0, 0x1
	negs r0, r0
	mov r1, r8
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r3, _08143B14 @ =0x04000208
	ldrh r2, [r3]
	mov r0, r8
	strh r0, [r3]
	ldr r4, _08143B18 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08143B1C @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08143B20 @ =sub_8143948
	bl SetVBlankCallback
	ldr r0, _08143B24 @ =0x000001c7
	bl m4aSongNumStart
	ldr r0, _08143B28 @ =sub_814395C
	bl SetMainCallback2
	ldr r0, _08143B2C @ =gUnknown_02039325
	mov r1, r9
	strb r1, [r0]
	ldr r4, _08143B30 @ =0x0201c000
	bl sub_81458DC
	adds r0, r4, 0
	adds r0, 0x88
	mov r2, r8
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	ldr r0, _08143B34 @ =gUnknown_02039322
	strh r7, [r0]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08143AF0: .4byte sub_8143B38
_08143AF4: .4byte gTasks
_08143AF8: .4byte gWindowConfig_81E7208
_08143AFC: .4byte gUnknown_0840B7BC
_08143B00: .4byte gUnknown_0840B7FC
_08143B04: .4byte 0x0600bee0
_08143B08: .4byte REG_BG0VOFS
_08143B0C: .4byte 0x0000fffc
_08143B10: .4byte sub_81441B8
_08143B14: .4byte 0x04000208
_08143B18: .4byte 0x04000200
_08143B1C: .4byte REG_DISPSTAT
_08143B20: .4byte sub_8143948
_08143B24: .4byte 0x000001c7
_08143B28: .4byte sub_814395C
_08143B2C: .4byte gUnknown_02039325
_08143B30: .4byte 0x0201c000
_08143B34: .4byte gUnknown_02039322
	thumb_func_end sub_81439D0

	thumb_func_start sub_8143B38
sub_8143B38: @ 8143B38
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08143B5C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08143B58
	ldr r0, _08143B60 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _08143B64 @ =sub_8143B68
	str r0, [r1]
_08143B58:
	pop {r0}
	bx r0
	.align 2, 0
_08143B5C: .4byte gPaletteFade
_08143B60: .4byte gTasks
_08143B64: .4byte sub_8143B68
	thumb_func_end sub_8143B38

	thumb_func_start sub_8143B68
sub_8143B68: @ 8143B68
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08143B9C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _08143BA4
	movs r3, 0xA
	ldrsh r1, [r4, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x1E
	strh r1, [r0, 0x8]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0x20]
	ldr r0, _08143BA0 @ =sub_8143EBC
	b _08143BEE
	.align 2, 0
_08143B9C: .4byte gTasks
_08143BA0: .4byte sub_8143EBC
_08143BA4:
	ldr r0, _08143BCC @ =gUnknown_02039320
	strh r1, [r0]
	ldrh r2, [r4, 0x1E]
	movs r3, 0x1E
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _08143BD4
	strh r2, [r4, 0x22]
	strh r1, [r4, 0x1E]
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08143BD0 @ =sub_8143BFC
	b _08143BEE
	.align 2, 0
_08143BCC: .4byte gUnknown_02039320
_08143BD0: .4byte sub_8143BFC
_08143BD4:
	cmp r0, 0x2
	bne _08143BF0
	strh r2, [r4, 0x22]
	strh r1, [r4, 0x1E]
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08143BF8 @ =sub_8143CC0
_08143BEE:
	str r0, [r4]
_08143BF0:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08143BF8: .4byte sub_8143CC0
	thumb_func_end sub_8143B68

	thumb_func_start sub_8143BFC
sub_8143BFC: @ 8143BFC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08143C34 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08143C2C
	movs r0, 0x80
	lsls r0, 19
	strh r1, [r0]
	adds r0, r4, 0
	bl sub_81450AC
	ldr r1, _08143C38 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08143C3C @ =c2_080C9BFC
	str r1, [r0]
_08143C2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08143C34: .4byte gPaletteFade
_08143C38: .4byte gTasks
_08143C3C: .4byte c2_080C9BFC
	thumb_func_end sub_8143BFC

	thumb_func_start c2_080C9BFC
c2_080C9BFC: @ 8143C40
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl SetVBlankCallback
	ldr r1, _08143CA8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	ldrb r0, [r5, 0x16]
	adds r1, r4, 0
	bl sub_8144ECC
	lsls r0, 24
	cmp r0, 0
	beq _08143CA0
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r3, _08143CAC @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _08143CB0 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08143CB4 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08143CB8 @ =sub_8143948
	bl SetVBlankCallback
	ldr r0, _08143CBC @ =sub_8143B38
	str r0, [r5]
_08143CA0:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08143CA8: .4byte gTasks
_08143CAC: .4byte 0x04000208
_08143CB0: .4byte 0x04000200
_08143CB4: .4byte REG_DISPSTAT
_08143CB8: .4byte sub_8143948
_08143CBC: .4byte sub_8143B38
	thumb_func_end c2_080C9BFC

	thumb_func_start sub_8143CC0
sub_8143CC0: @ 8143CC0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08143CF8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08143CF0
	movs r0, 0x80
	lsls r0, 19
	strh r1, [r0]
	adds r0, r4, 0
	bl sub_81450AC
	ldr r1, _08143CFC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08143D00 @ =sub_8143D04
	str r1, [r0]
_08143CF0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08143CF8: .4byte gPaletteFade
_08143CFC: .4byte gTasks
_08143D00: .4byte sub_8143D04
	thumb_func_end sub_8143CC0

	thumb_func_start sub_8143D04
sub_8143D04: @ 8143D04
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08143DC8 @ =gMain
	ldr r1, _08143DCC @ =0x0000043c
	adds r1, r0
	mov r8, r1
	ldrb r7, [r1]
	cmp r7, 0
	beq _08143D24
	cmp r7, 0x1
	beq _08143E0C
_08143D24:
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _08143DD0 @ =gReservedSpritePaletteCount
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _08143DD4 @ =gUnknown_083F66F0
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08143DD8 @ =gBirchGrassTilemap
	ldr r1, _08143DDC @ =0x06003800
	bl LZ77UnCompVram
	ldr r0, _08143DE0 @ =gUnknown_083F62EC + 0x2
	movs r1, 0x1
	movs r2, 0x3E
	bl LoadPalette
	movs r1, 0
	ldr r4, _08143DE4 @ =0x0201e000
	movs r3, 0x11
	ldr r2, _08143DE8 @ =0x000007ff
_08143D56:
	adds r0, r1, r4
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bls _08143D56
	movs r1, 0
	ldr r2, _08143DEC @ =0x0201f800
	ldr r6, _08143DF0 @ =gUnknown_0840CAA0
	ldr r0, _08143DF4 @ =0xfffff000
	adds r5, r2, r0
	movs r4, 0x22
	ldr r3, _08143DE8 @ =0x000007ff
_08143D72:
	adds r0, r1, r5
	strb r4, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r3
	bls _08143D72
	movs r1, 0
	ldr r5, _08143DF8 @ =0x0201f000
	movs r4, 0x33
	ldr r3, _08143DE8 @ =0x000007ff
_08143D88:
	adds r0, r1, r5
	strb r4, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r3
	bls _08143D88
	movs r0, 0
	strh r0, [r2]
	ldr r1, _08143DFC @ =0x000053ff
	adds r0, r1, 0
	strh r0, [r2, 0x2]
	ldr r1, _08143E00 @ =0x0000529f
	adds r0, r1, 0
	strh r0, [r2, 0x4]
	ldr r1, _08143E04 @ =0x00007e94
	adds r0, r1, 0
	strh r0, [r2, 0x6]
	adds r0, r6, 0
	bl LoadSpriteSheet
	ldr r0, _08143E08 @ =gUnknown_0840CAB0
	bl LoadSpritePalette
	ldr r1, _08143DC8 @ =gMain
	ldr r2, _08143DCC @ =0x0000043c
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08143E90
	.align 2, 0
_08143DC8: .4byte gMain
_08143DCC: .4byte 0x0000043c
_08143DD0: .4byte gReservedSpritePaletteCount
_08143DD4: .4byte gUnknown_083F66F0
_08143DD8: .4byte gBirchGrassTilemap
_08143DDC: .4byte 0x06003800
_08143DE0: .4byte gUnknown_083F62EC + 0x2
_08143DE4: .4byte 0x0201e000
_08143DE8: .4byte 0x000007ff
_08143DEC: .4byte 0x0201f800
_08143DF0: .4byte gUnknown_0840CAA0
_08143DF4: .4byte 0xfffff000
_08143DF8: .4byte 0x0201f000
_08143DFC: .4byte 0x000053ff
_08143E00: .4byte 0x0000529f
_08143E04: .4byte 0x00007e94
_08143E08: .4byte gUnknown_0840CAB0
_08143E0C:
	ldr r0, _08143EA0 @ =sub_8144514
	movs r1, 0
	bl CreateTask
	ldr r2, _08143EA4 @ =gTasks
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r2
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	mov r9, r1
	movs r5, 0
	strh r0, [r4, 0xE]
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	strh r7, [r0, 0x8]
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	strh r6, [r0, 0xA]
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r4, 0x16]
	strh r1, [r0, 0xC]
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08143EA8 @ =REG_BG3HOFS
	strh r5, [r0]
	ldr r1, _08143EAC @ =REG_BG3VOFS
	movs r0, 0x20
	strh r0, [r1]
	subs r1, 0x10
	ldr r2, _08143EB0 @ =0x00000703
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xE
	movs r2, 0xCA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	mov r1, r9
	mov r0, r8
	strb r1, [r0]
	ldr r0, _08143EB4 @ =gUnknown_0203935C
	strh r5, [r0]
	ldr r0, _08143EB8 @ =sub_8143B38
	str r0, [r4]
_08143E90:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08143EA0: .4byte sub_8144514
_08143EA4: .4byte gTasks
_08143EA8: .4byte REG_BG3HOFS
_08143EAC: .4byte REG_BG3VOFS
_08143EB0: .4byte 0x00000703
_08143EB4: .4byte gUnknown_0203935C
_08143EB8: .4byte sub_8143B38
	thumb_func_end sub_8143D04

	thumb_func_start sub_8143EBC
sub_8143EBC: @ 8143EBC
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08143EE0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x20]
	movs r2, 0x20
	ldrsh r1, [r4, r2]
	cmp r1, 0
	beq _08143EE4
	subs r0, 0x1
	strh r0, [r4, 0x20]
	b _08143EF8
	.align 2, 0
_08143EE0: .4byte gTasks
_08143EE4:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0xC
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08143F00 @ =sub_8143F04
	str r0, [r4]
_08143EF8:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08143F00: .4byte sub_8143F04
	thumb_func_end sub_8143EBC

	thumb_func_start sub_8143F04
sub_8143F04: @ 8143F04
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08143F30 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08143F2A
	adds r0, r4, 0
	bl sub_81450AC
	ldr r0, _08143F34 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08143F38 @ =sub_8143F3C
	str r0, [r1]
_08143F2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08143F30: .4byte gPaletteFade
_08143F34: .4byte gTasks
_08143F38: .4byte sub_8143F3C
	thumb_func_end sub_8143F04

	thumb_func_start sub_8143F3C
sub_8143F3C: @ 8143F3C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	bl sub_8144130
	bl ResetPaletteFade
	movs r1, 0xE0
	lsls r1, 6
	movs r0, 0
	movs r2, 0
	bl sub_8145128
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0x8
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _08143FC4 @ =REG_BG0CNT
	movs r2, 0xE0
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	ldr r3, _08143FC8 @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _08143FCC @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08143FD0 @ =REG_DISPSTAT
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08143FD4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r0, 0x8]
	ldr r1, _08143FD8 @ =sub_8143FDC
	str r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08143FC4: .4byte REG_BG0CNT
_08143FC8: .4byte 0x04000208
_08143FCC: .4byte 0x04000200
_08143FD0: .4byte REG_DISPSTAT
_08143FD4: .4byte gTasks
_08143FD8: .4byte sub_8143FDC
	thumb_func_end sub_8143F3C

	thumb_func_start sub_8143FDC
sub_8143FDC: @ 8143FDC
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08144000 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	cmp r1, 0
	beq _08144004
	subs r0, 0x1
	strh r0, [r4, 0x8]
	b _08144018
	.align 2, 0
_08144000: .4byte gTasks
_08144004:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0x6
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08144020 @ =sub_8144024
	str r0, [r4]
_08144018:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08144020: .4byte sub_8144024
	thumb_func_end sub_8143FDC

	thumb_func_start sub_8144024
sub_8144024: @ 8144024
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08144074 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0814406A
	movs r0, 0xE0
	lsls r0, 6
	movs r1, 0
	bl sub_81452D0
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _08144078 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0xE1
	lsls r1, 5
	strh r1, [r0, 0x8]
	ldr r1, _0814407C @ =sub_8144080
	str r1, [r0]
_0814406A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08144074: .4byte gPaletteFade
_08144078: .4byte gTasks
_0814407C: .4byte sub_8144080
	thumb_func_end sub_8144024

	thumb_func_start sub_8144080
sub_8144080: @ 8144080
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _081440CC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08144104
	ldr r1, _081440D0 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _081440AE
	ldr r0, _081440D4 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0
	beq _081440E0
_081440AE:
	movs r0, 0x4
	bl FadeOutBGM
	movs r0, 0x1
	negs r0, r0
	ldr r1, _081440D8 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0x8
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _081440DC @ =sub_8144114
	str r0, [r4]
	b _08144104
	.align 2, 0
_081440CC: .4byte gPaletteFade
_081440D0: .4byte gTasks
_081440D4: .4byte gMain
_081440D8: .4byte 0x0000ffff
_081440DC: .4byte sub_8144114
_081440E0:
	ldr r0, _0814410C @ =0x00001be8
	cmp r1, r0
	bne _081440EC
	movs r0, 0x8
	bl FadeOutBGM
_081440EC:
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	ldr r0, _08144110 @ =0x00001ab8
	cmp r1, r0
	bne _081440FE
	movs r0, 0xE4
	lsls r0, 1
	bl m4aSongNumStart
_081440FE:
	ldrh r0, [r4, 0x8]
	subs r0, 0x1
	strh r0, [r4, 0x8]
_08144104:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814410C: .4byte 0x00001be8
_08144110: .4byte 0x00001ab8
	thumb_func_end sub_8144080

	thumb_func_start sub_8144114
sub_8144114: @ 8144114
	push {lr}
	ldr r0, _0814412C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08144128
	movs r0, 0xFF
	bl SoftReset
_08144128:
	pop {r0}
	bx r0
	.align 2, 0
_0814412C: .4byte gPaletteFade
	thumb_func_end sub_8144114

	thumb_func_start sub_8144130
sub_8144130: @ 8144130
	sub sp, 0x8
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x1C
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x3E
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	mov r0, sp
	strh r1, [r0]
	ldr r1, _081441A4 @ =0x040000d4
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _081441A8 @ =0x8100c000
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0
	str r2, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _081441AC @ =0x85000100
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, sp
	strh r2, [r0]
	str r0, [r1]
	ldr r0, _081441B0 @ =0x05000002
	str r0, [r1, 0x4]
	ldr r0, _081441B4 @ =0x810001ff
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add sp, 0x8
	bx lr
	.align 2, 0
_081441A4: .4byte 0x040000d4
_081441A8: .4byte 0x8100c000
_081441AC: .4byte 0x85000100
_081441B0: .4byte 0x05000002
_081441B4: .4byte 0x810001ff
	thumb_func_end sub_8144130

	thumb_func_start sub_81441B8
sub_81441B8: @ 81441B8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _081441E4 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r6, r1, 0
	cmp r0, 0xA
	bhi _08144218
	lsls r0, 2
	ldr r1, _081441E8 @ =_081441EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081441E4: .4byte gTasks
_081441E8: .4byte _081441EC
	.align 2, 0
_081441EC:
	.4byte _08144218
	.4byte _08144258
	.4byte _08144278
	.4byte _08144358
	.4byte _0814438C
	.4byte _081443F8
	.4byte _08144218
	.4byte _08144218
	.4byte _08144218
	.4byte _08144218
	.4byte _08144428
_08144218:
	ldr r0, _08144250 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _0814422A
	b _08144446
_0814422A:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r6
	movs r1, 0x1
	strh r1, [r0, 0x8]
	movs r1, 0x58
	strh r1, [r0, 0xE]
	movs r3, 0xA
	ldrsh r1, [r0, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r2, [r0, 0x24]
	ldr r0, _08144254 @ =gUnknown_02039320
	strh r2, [r0]
	b _08144446
	.align 2, 0
_08144250: .4byte gPaletteFade
_08144254: .4byte gUnknown_02039320
_08144258:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r6
	ldrh r2, [r1, 0xE]
	movs r3, 0xE
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08144270
	subs r0, r2, 0x1
	strh r0, [r1, 0xE]
	b _08144446
_08144270:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _08144446
_08144278:
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _08144320 @ =0x0000feff
	ands r0, r1
	strh r0, [r2]
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r3, r0, r6
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r4, r0, r6
	ldr r1, [r4]
	ldr r0, _08144324 @ =sub_8143B68
	mov r8, r2
	cmp r1, r0
	bne _08144352
	movs r1, 0xC
	ldrsh r0, [r3, r1]
	cmp r0, 0x33
	bgt _0814434C
	movs r4, 0
	ldr r7, _08144328 @ =gCreditsEntryPointerTable
	adds r6, r3, 0
_081442B0:
	movs r2, 0xC
	ldrsh r1, [r6, r2]
	lsls r0, r1, 2
	adds r0, r1
	adds r0, r4
	lsls r0, 2
	adds r0, r7
	ldr r0, [r0]
	ldr r0, [r0, 0x4]
	lsls r2, r4, 25
	movs r3, 0x90
	lsls r3, 20
	adds r2, r3
	lsrs r2, 24
	movs r1, 0
	movs r3, 0xF0
	bl sub_8072BD8
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _081442B0
	ldr r3, _0814432C @ =gTasks
	mov r0, r8
	adds r1, r0, r5
	lsls r1, 3
	adds r1, r3
	ldrh r0, [r1, 0xC]
	adds r0, 0x1
	strh r0, [r1, 0xC]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xA
	ldrsh r2, [r1, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r3
	movs r2, 0x1
	strh r2, [r0, 0x24]
	movs r2, 0xA
	ldrsh r1, [r1, r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	movs r3, 0x22
	ldrsh r0, [r0, r3]
	cmp r0, 0x1
	bne _08144334
	movs r0, 0xC0
	lsls r0, 2
	ldr r1, _08144330 @ =0x0000328d
	b _0814433A
	.align 2, 0
_08144320: .4byte 0x0000feff
_08144324: .4byte sub_8143B68
_08144328: .4byte gCreditsEntryPointerTable
_0814432C: .4byte gTasks
_08144330: .4byte 0x0000328d
_08144334:
	movs r0, 0xC0
	lsls r0, 2
	ldr r1, _08144348 @ =0x00001967
_0814433A:
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08144446
	.align 2, 0
_08144348: .4byte 0x00001967
_0814434C:
	movs r0, 0xA
	strh r0, [r3, 0x8]
	b _08144446
_08144352:
	movs r0, 0
	strh r0, [r4, 0x24]
	b _08144446
_08144358:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 1
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08144388 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08144446
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r6
	movs r1, 0x82
	strh r1, [r0, 0xE]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _08144446
	.align 2, 0
_08144388: .4byte gPaletteFade
_0814438C:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r6
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _081443A4
	subs r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _08144446
_081443A4:
	ldrb r0, [r4, 0xC]
	ldrb r1, [r4, 0xA]
	bl sub_8144454
	lsls r0, 24
	cmp r0, 0
	beq _081443BA
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08144446
_081443BA:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r3, 0xA
	ldrsh r1, [r4, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	movs r1, 0x22
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _081443E0
	movs r0, 0xC0
	lsls r0, 2
	ldr r1, _081443DC @ =0x0000328d
	b _081443E6
	.align 2, 0
_081443DC: .4byte 0x0000328d
_081443E0:
	movs r0, 0xC0
	lsls r0, 2
	ldr r1, _081443F4 @ =0x00001967
_081443E6:
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _08144446
	.align 2, 0
_081443F4: .4byte 0x00001967
_081443F8:
	ldr r0, _08144420 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08144446
	movs r0, 0
	movs r1, 0x9
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r0, _08144424 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r0, 0x2
	strh r0, [r1, 0x8]
	b _08144446
	.align 2, 0
_08144420: .4byte gPaletteFade
_08144424: .4byte gTasks
_08144428:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r6
	movs r2, 0xA
	ldrsh r1, [r0, r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	movs r1, 0x1
	strh r1, [r0, 0x10]
	adds r0, r5, 0
	bl DestroyTask
_08144446:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81441B8

	thumb_func_start sub_8144454
sub_8144454: @ 8144454
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r6, r3, 0
	lsls r1, 24
	lsrs r2, r1, 24
	adds r5, r2, 0
	ldr r4, _08144508 @ =gTasks
	cmp r3, 0x6
	bne _08144474
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x1E]
_08144474:
	cmp r3, 0xC
	bne _08144486
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r4
	movs r1, 0x1
	strh r1, [r0, 0x16]
	strh r1, [r0, 0x1E]
_08144486:
	cmp r3, 0x12
	bne _08144496
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x1E]
_08144496:
	cmp r3, 0x18
	bne _081444AA
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x16]
	movs r1, 0x1
	strh r1, [r0, 0x1E]
_081444AA:
	cmp r3, 0x1E
	bne _081444BA
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x1E]
_081444BA:
	cmp r3, 0x23
	bne _081444CE
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r4
	movs r1, 0x3
	strh r1, [r0, 0x16]
	movs r1, 0x1
	strh r1, [r0, 0x1E]
_081444CE:
	cmp r3, 0x28
	bne _081444DE
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x1E]
_081444DE:
	cmp r6, 0x2E
	bne _081444F2
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r4
	movs r1, 0x4
	strh r1, [r0, 0x16]
	movs r1, 0x1
	strh r1, [r0, 0x1E]
_081444F2:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r4
	movs r1, 0x1E
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0814450C
	movs r0, 0
	b _0814450E
	.align 2, 0
_08144508: .4byte gTasks
_0814450C:
	movs r0, 0x1
_0814450E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8144454

	thumb_func_start sub_8144514
sub_8144514: @ 8144514
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r6, _08144548 @ =0x0201c000
	ldr r3, _0814454C @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r2, r0, r3
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _08144550
	cmp r0, 0x1
	bgt _0814453C
	b _08144658
_0814453C:
	cmp r0, 0x2
	beq _08144584
	cmp r0, 0x3
	bne _08144546
	b _08144644
_08144546:
	b _08144658
	.align 2, 0
_08144548: .4byte 0x0201c000
_0814454C: .4byte gTasks
_08144550:
	adds r0, r6, 0
	adds r0, 0x8A
	ldrh r0, [r0]
	cmp r0, 0
	bne _0814456E
	movs r4, 0xA
	ldrsh r0, [r2, r4]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r3
	movs r4, 0x24
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _08144658
_0814456E:
	movs r0, 0xA
	ldrsh r1, [r2, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x24]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	b _08144656
_08144584:
	adds r0, r6, 0
	adds r0, 0x88
	ldrh r1, [r0]
	mov r9, r0
	cmp r1, 0x44
	beq _08144658
	movs r4, 0xA
	ldrsh r1, [r2, r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	ldr r1, [r0]
	ldr r0, _081445EC @ =sub_8143B68
	cmp r1, r0
	bne _08144658
	adds r7, r6, 0
	adds r7, 0x8C
	ldrh r0, [r7]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	ldr r4, _081445F0 @ =gUnknown_0840CA00
	adds r5, r6, 0
	adds r5, 0x8A
	ldrh r3, [r5]
	lsls r2, r3, 1
	adds r1, r2, r4
	ldrb r1, [r1]
	adds r4, 0x1
	adds r2, r4
	ldrb r2, [r2]
	bl sub_81456B4
	lsls r0, 24
	lsrs r2, r0, 24
	ldrh r1, [r7]
	adds r0, r6, 0
	adds r0, 0x8E
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	bge _081445F8
	adds r0, r1, 0x1
	strh r0, [r7]
	ldr r1, _081445F4 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0x32
	b _0814460A
	.align 2, 0
_081445EC: .4byte sub_8143B68
_081445F0: .4byte gUnknown_0840CA00
_081445F4: .4byte gSprites
_081445F8:
	movs r0, 0
	strh r0, [r7]
	ldr r1, _08144620 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0x80
	lsls r1, 2
_0814460A:
	strh r1, [r0, 0x34]
	mov r1, r9
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldrh r0, [r5]
	cmp r0, 0x2
	bne _08144624
	movs r0, 0
	b _08144626
	.align 2, 0
_08144620: .4byte gSprites
_08144624:
	adds r0, 0x1
_08144626:
	strh r0, [r5]
	ldr r0, _08144640 @ =gTasks
	mov r2, r8
	lsls r1, r2, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0x32
	strh r0, [r1, 0xE]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _08144658
	.align 2, 0
_08144640: .4byte gTasks
_08144644:
	ldrh r1, [r2, 0xE]
	movs r3, 0xE
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _08144654
	subs r0, r1, 0x1
	strh r0, [r2, 0xE]
	b _08144658
_08144654:
	movs r0, 0x1
_08144656:
	strh r0, [r2, 0x8]
_08144658:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8144514

	thumb_func_start sub_8144664
sub_8144664: @ 8144664
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0814468C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r6, r1, 0
	cmp r0, 0x32
	bls _08144680
	b _0814492C
_08144680:
	lsls r0, 2
	ldr r1, _08144690 @ =_08144694
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0814468C: .4byte gTasks
_08144690: .4byte _08144694
	.align 2, 0
_08144694:
	.4byte _08144760
	.4byte _08144784
	.4byte _081447D8
	.4byte _081447F0
	.4byte _0814482C
	.4byte _08144850
	.4byte _0814489C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _081448A8
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _081448C8
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _081448EC
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _0814492C
	.4byte _08144920
_08144760:
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 17
	movs r1, 0x7F
	ands r0, r1
	movs r1, 0xC
	bl Sin
	ldr r1, _08144780 @ =gUnknown_0203935A
	strh r0, [r1]
	b _081447A8
	.align 2, 0
_08144780: .4byte gUnknown_0203935A
_08144784:
	ldr r7, _081447B0 @ =gUnknown_0203935A
	movs r3, 0
	ldrsh r4, [r7, r3]
	cmp r4, 0
	beq _081447B4
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 17
	movs r1, 0x7F
	ands r0, r1
	movs r1, 0xC
	bl Sin
	strh r0, [r7]
_081447A8:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	b _0814492C
	.align 2, 0
_081447B0: .4byte gUnknown_0203935A
_081447B4:
	ldr r3, _081447D4 @ =gSprites
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r6
	movs r0, 0xC
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x2
	strh r2, [r0, 0x2E]
	strh r4, [r1, 0x12]
	b _08144848
	.align 2, 0
_081447D4: .4byte gSprites
_081447D8:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r6
	ldrh r2, [r1, 0x12]
	movs r3, 0x12
	ldrsh r0, [r1, r3]
	cmp r0, 0x3F
	bgt _08144848
	adds r0, r2, 0x1
	strh r0, [r1, 0x12]
	b _08144866
_081447F0:
	ldr r3, _08144828 @ =gSprites
	lsls r2, r5, 2
	adds r2, r5
	lsls r2, 3
	adds r2, r6
	movs r0, 0xC
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x3
	strh r1, [r0, 0x2E]
	movs r0, 0xE
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	movs r0, 0x78
	strh r0, [r2, 0x10]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _0814492C
	.align 2, 0
_08144828: .4byte gSprites
_0814482C:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r6
	ldrh r2, [r1, 0x10]
	movs r3, 0x10
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08144844
	subs r0, r2, 0x1
	strh r0, [r1, 0x10]
	b _0814492C
_08144844:
	movs r0, 0x40
	strh r0, [r1, 0x12]
_08144848:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0814492C
_08144850:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r6
	ldrh r1, [r4, 0x12]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _0814487C
	subs r0, r1, 0x1
	strh r0, [r4, 0x12]
_08144866:
	movs r1, 0x7F
	ands r0, r1
	movs r1, 0x14
	bl Sin
	ldr r1, _08144878 @ =gUnknown_0203935A
	strh r0, [r1]
	b _0814492C
	.align 2, 0
_08144878: .4byte gUnknown_0203935A
_0814487C:
	ldr r2, _08144898 @ =gSprites
	movs r3, 0xC
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strh r1, [r0, 0x2E]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0814492C
	.align 2, 0
_08144898: .4byte gSprites
_0814489C:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r6
	movs r1, 0x32
	b _0814492A
_081448A8:
	ldr r3, _081448C4 @ =gSprites
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r6
	movs r0, 0xE
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x2
	b _081448E0
	.align 2, 0
_081448C4: .4byte gSprites
_081448C8:
	ldr r3, _081448E8 @ =gSprites
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r6
	movs r0, 0xC
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x4
_081448E0:
	strh r2, [r0, 0x2E]
	movs r0, 0x32
	strh r0, [r1, 0x8]
	b _0814492C
	.align 2, 0
_081448E8: .4byte gSprites
_081448EC:
	ldr r3, _0814491C @ =gSprites
	lsls r2, r5, 2
	adds r2, r5
	lsls r2, 3
	adds r2, r6
	movs r0, 0xC
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x5
	strh r1, [r0, 0x2E]
	movs r0, 0xE
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x3
	strh r1, [r0, 0x2E]
	movs r0, 0x32
	strh r0, [r2, 0x8]
	b _0814492C
	.align 2, 0
_0814491C: .4byte gSprites
_08144920:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r6
	movs r1, 0
_0814492A:
	strh r1, [r0, 0x8]
_0814492C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8144664

	thumb_func_start sub_8144934
sub_8144934: @ 8144934
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08144958 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r3, 0x8
	ldrsh r0, [r0, r3]
	adds r4, r1, 0
	cmp r0, 0x4
	bhi _08144974
	lsls r0, 2
	ldr r1, _0814495C @ =_08144960
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08144958: .4byte gTasks
_0814495C: .4byte _08144960
	.align 2, 0
_08144960:
	.4byte _08144974
	.4byte _081449B8
	.4byte _081449C4
	.4byte _08144A0C
	.4byte _08144A5C
_08144974:
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r2, r0, r4
	movs r1, 0xA
	ldrsh r0, [r2, r1]
	ldr r5, _081449C0 @ =0x00007fff
	cmp r0, r5
	beq _081449B8
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r3, r0, r4
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0x2
	bne _081449B8
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	movs r0, 0x14
	strh r0, [r1, 0x8]
	strh r5, [r2, 0xA]
_081449B8:
	movs r0, 0
	bl sub_8149020
	b _08144A62
	.align 2, 0
_081449C0: .4byte 0x00007fff
_081449C4:
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r2, r0, r4
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	ldr r5, _08144A08 @ =0x00007fff
	cmp r0, r5
	beq _08144A54
	movs r0, 0xC
	ldrsh r1, [r2, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r3, 0xA
	ldrsh r1, [r0, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r3, r0, r4
	ldrh r1, [r3, 0x12]
	movs r0, 0x80
	negs r0, r0
	ands r0, r1
	movs r1, 0xA0
	lsls r1, 2
	cmp r0, r1
	bne _08144A54
	movs r0, 0x1
	strh r0, [r3, 0x8]
	strh r5, [r2, 0xA]
	b _08144A54
	.align 2, 0
_08144A08: .4byte 0x00007fff
_08144A0C:
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r2, r0, r4
	ldrh r3, [r2, 0xA]
	movs r0, 0xA
	ldrsh r1, [r2, r0]
	ldr r5, _08144A48 @ =0x00007fff
	cmp r1, r5
	beq _08144A54
	ldr r0, _08144A4C @ =0x000001f3
	cmp r1, r0
	bne _08144A50
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r3, 0xA
	ldrsh r1, [r0, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0xA
	strh r1, [r0, 0x8]
	strh r5, [r2, 0xA]
	b _08144A54
	.align 2, 0
_08144A48: .4byte 0x00007fff
_08144A4C: .4byte 0x000001f3
_08144A50:
	adds r0, r3, 0x1
	strh r0, [r2, 0xA]
_08144A54:
	movs r0, 0x1
	bl sub_8149020
	b _08144A62
_08144A5C:
	movs r0, 0x2
	bl sub_8149020
_08144A62:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8144934

	thumb_func_start sub_8144A68
sub_8144A68: @ 8144A68
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r7, r1, 24
	cmp r0, 0x4
	bls _08144A7E
	b _08144DFC
_08144A7E:
	lsls r0, 2
	ldr r1, _08144A88 @ =_08144A8C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08144A88: .4byte _08144A8C
	.align 2, 0
_08144A8C:
	.4byte _08144AA0
	.4byte _08144B48
	.4byte _08144BF4
	.4byte _08144CA0
	.4byte _08144D50
_08144AA0:
	ldr r5, _08144B40 @ =gSprites
	ldr r0, _08144B44 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r3, 0
	movs r2, 0x88
	lsls r2, 1
	strh r2, [r0, 0x20]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x20]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r2, 0x2E
	strh r2, [r0, 0x22]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x22]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	movs r2, 0x20
	b _08144DF0
	.align 2, 0
_08144B40: .4byte gSprites
_08144B44: .4byte gTasks
_08144B48:
	ldr r5, _08144BEC @ =gSprites
	ldr r0, _08144BF0 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r3, 0
	movs r1, 0x78
	strh r1, [r0, 0x20]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x88
	lsls r1, 1
	strh r1, [r0, 0x20]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r2, 0x2E
	strh r2, [r0, 0x22]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x22]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r1, 0x80
	lsls r1, 6
	movs r0, 0
	movs r2, 0x20
	b _08144DF0
	.align 2, 0
_08144BEC: .4byte gSprites
_08144BF0: .4byte gTasks
_08144BF4:
	ldr r5, _08144C98 @ =gSprites
	ldr r0, _08144C9C @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r3, 0
	movs r1, 0x78
	strh r1, [r0, 0x20]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x88
	lsls r1, 1
	strh r1, [r0, 0x20]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r2, 0x2E
	strh r2, [r0, 0x22]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x22]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r1, 0x80
	lsls r1, 6
	movs r2, 0x80
	lsls r2, 2
	movs r0, 0x1
	b _08144DF0
	.align 2, 0
_08144C98: .4byte gSprites
_08144C9C: .4byte gTasks
_08144CA0:
	ldr r5, _08144D44 @ =gSprites
	ldr r0, _08144D48 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r3, 0
	movs r1, 0x78
	strh r1, [r0, 0x20]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08144D4C @ =0x0000ffe0
	strh r1, [r0, 0x20]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r2, 0x2E
	strh r2, [r0, 0x22]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x22]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r1, 0x80
	lsls r1, 6
	movs r2, 0x80
	lsls r2, 2
	movs r0, 0x1
	b _08144DF0
	.align 2, 0
_08144D44: .4byte gSprites
_08144D48: .4byte gTasks
_08144D4C: .4byte 0x0000ffe0
_08144D50:
	ldr r5, _08144EBC @ =gSprites
	ldr r0, _08144EC0 @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r3, 0
	movs r1, 0x58
	strh r1, [r0, 0x20]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x98
	strh r1, [r0, 0x20]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r2, 0x2E
	strh r2, [r0, 0x22]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x22]
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r3, [r0, 0x2E]
	movs r1, 0x80
	lsls r1, 6
	movs r2, 0x80
	lsls r2, 2
	movs r0, 0x2
_08144DF0:
	movs r3, 0x8
	bl sub_8148EC0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x8]
_08144DFC:
	ldr r0, _08144EC4 @ =sub_8144934
	movs r1, 0
	bl CreateTask
	ldr r6, _08144EC0 @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r5, r1, r6
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0
	strh r0, [r5, 0xC]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	mov r1, r8
	strh r1, [r0, 0x8]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r4, [r0, 0xA]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r7, [r0, 0xC]
	ldr r0, _08144EC8 @ =sub_8144664
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r4, [r0, 0x8]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r7, [r0, 0xA]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrh r1, [r5, 0x12]
	strh r1, [r0, 0xC]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrh r1, [r5, 0x14]
	strh r1, [r0, 0xE]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r4, [r0, 0x10]
	mov r1, r8
	cmp r1, 0x2
	bne _08144EB0
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	movs r0, 0x45
	strh r0, [r1, 0x12]
_08144EB0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08144EBC: .4byte gSprites
_08144EC0: .4byte gTasks
_08144EC4: .4byte sub_8144934
_08144EC8: .4byte sub_8144664
	thumb_func_end sub_8144A68

	thumb_func_start sub_8144ECC
sub_8144ECC: @ 8144ECC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _08144F28 @ =gMain
	ldr r1, _08144F2C @ =0x0000043c
	adds r6, r0, r1
	ldrb r0, [r6]
	cmp r0, 0x1
	beq _08144F38
	cmp r0, 0x1
	ble _08144EF0
	cmp r0, 0x2
	beq _08144F5C
	cmp r0, 0x3
	bne _08144EF0
	b _0814508C
_08144EF0:
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	ldr r2, _08144F30 @ =REG_BG3HOFS
	movs r0, 0x8
	strh r0, [r2]
	ldr r0, _08144F34 @ =REG_BG3VOFS
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x3A
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, 0x1
	strb r0, [r6]
	b _081450A2
	.align 2, 0
_08144F28: .4byte gMain
_08144F2C: .4byte 0x0000043c
_08144F30: .4byte REG_BG3HOFS
_08144F34: .4byte REG_BG3VOFS
_08144F38:
	ldr r1, _08144F54 @ =gUnknown_02039358
	movs r0, 0x22
	strh r0, [r1]
	ldr r1, _08144F58 @ =gUnknown_0203935A
	movs r0, 0
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_8148CB0
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	b _081450A2
	.align 2, 0
_08144F54: .4byte gUnknown_02039358
_08144F58: .4byte gUnknown_0203935A
_08144F5C:
	ldr r0, _08144FBC @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08144FE0
	ldr r0, _08144FC0 @ =gIntro2BrendanSpriteSheet
	bl LoadCompressedObjectPic
	ldr r0, _08144FC4 @ =gUnknown_08416E34
	bl LoadCompressedObjectPic
	ldr r0, _08144FC8 @ =gIntro2BicycleSpriteSheet
	bl LoadCompressedObjectPic
	ldr r0, _08144FCC @ =gIntro2SpritePalettes
	bl LoadSpritePalettes
	movs r0, 0x78
	movs r1, 0x2E
	bl intro_create_brendan_sprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08144FD0 @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	strh r2, [r4, 0x12]
	ldr r6, _08144FD4 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r6, 0
	adds r5, 0x1C
	adds r2, r0, r5
	ldr r1, _08144FD8 @ =sub_8145378
	str r1, [r2]
	adds r6, 0x8
	adds r0, r6
	ldr r1, _08144FDC @ =gUnknown_0840CA54
	str r1, [r0]
	movs r0, 0x88
	lsls r0, 1
	movs r1, 0x2E
	bl intro_create_may_sprite
	b _08145034
	.align 2, 0
_08144FBC: .4byte gSaveBlock2
_08144FC0: .4byte gIntro2BrendanSpriteSheet
_08144FC4: .4byte gUnknown_08416E34
_08144FC8: .4byte gIntro2BicycleSpriteSheet
_08144FCC: .4byte gIntro2SpritePalettes
_08144FD0: .4byte gTasks
_08144FD4: .4byte gSprites
_08144FD8: .4byte sub_8145378
_08144FDC: .4byte gUnknown_0840CA54
_08144FE0:
	ldr r0, _0814505C @ =gIntro2MaySpriteSheet
	bl LoadCompressedObjectPic
	ldr r0, _08145060 @ =gUnknown_08416E24
	bl LoadCompressedObjectPic
	ldr r0, _08145064 @ =gIntro2BicycleSpriteSheet
	bl LoadCompressedObjectPic
	ldr r0, _08145068 @ =gIntro2SpritePalettes
	bl LoadSpritePalettes
	movs r0, 0x78
	movs r1, 0x2E
	bl intro_create_may_sprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0814506C @ =gTasks
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	strh r2, [r4, 0x12]
	ldr r6, _08145070 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r6, 0
	adds r5, 0x1C
	adds r2, r0, r5
	ldr r1, _08145074 @ =sub_8145378
	str r1, [r2]
	adds r6, 0x8
	adds r0, r6
	ldr r1, _08145078 @ =gUnknown_0840CA54
	str r1, [r0]
	movs r0, 0x88
	lsls r0, 1
	movs r1, 0x2E
	bl intro_create_brendan_sprite
_08145034:
	lsls r0, 24
	lsrs r2, r0, 24
	strh r2, [r4, 0x14]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r0, r5
	ldr r1, _0814507C @ =sub_8145420
	str r1, [r5]
	adds r0, r6
	ldr r1, _08145080 @ =gUnknown_0840CA94
	str r1, [r0]
	ldr r1, _08145084 @ =gMain
	ldr r0, _08145088 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _081450A2
	.align 2, 0
_0814505C: .4byte gIntro2MaySpriteSheet
_08145060: .4byte gUnknown_08416E24
_08145064: .4byte gIntro2BicycleSpriteSheet
_08145068: .4byte gIntro2SpritePalettes
_0814506C: .4byte gTasks
_08145070: .4byte gSprites
_08145074: .4byte sub_8145378
_08145078: .4byte gUnknown_0840CA54
_0814507C: .4byte sub_8145420
_08145080: .4byte gUnknown_0840CA94
_08145084: .4byte gMain
_08145088: .4byte 0x0000043c
_0814508C:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8144A68
	adds r0, r4, 0
	bl sub_8148E90
	movs r0, 0
	strb r0, [r6]
	movs r0, 0x1
	b _081450A4
_081450A2:
	movs r0, 0
_081450A4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8144ECC

	thumb_func_start sub_81450AC
sub_81450AC: @ 81450AC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08145120 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r1, [r4, 0x8]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _081450D2
	lsls r0, r1, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	strh r0, [r4, 0x8]
_081450D2:
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _081450E8
	lsls r0, r1, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	strh r0, [r4, 0xA]
_081450E8:
	ldrh r1, [r4, 0xC]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _081450FE
	lsls r0, r1, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	strh r0, [r4, 0xC]
_081450FE:
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08145114
	lsls r0, r1, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	strh r0, [r4, 0xE]
_08145114:
	ldr r1, _08145124 @ =gUnknown_0203935C
	movs r0, 0x1
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08145120: .4byte gTasks
_08145124: .4byte gUnknown_0203935C
	thumb_func_end sub_81450AC

	thumb_func_start sub_8145128
sub_8145128: @ 8145128
	push {r4-r7,lr}
	adds r3, r0, 0
	adds r4, r2, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r4, 16
	lsrs r5, r4, 16
	ldr r0, _081451EC @ =gCreditsCopyrightEnd_Gfx
	movs r6, 0xC0
	lsls r6, 19
	adds r3, r6
	adds r1, r3, 0
	bl LZ77UnCompVram
	ldr r0, _081451F0 @ =gIntroCopyright_Pal
	adds r1, r5, 0
	movs r2, 0x20
	bl LoadPalette
	lsrs r4, 20
	lsls r4, 28
	lsrs r4, 16
	movs r2, 0
	adds r1, r4, 0x1
	ldr r3, _081451F4 @ =0x000003ff
_0814515E:
	lsls r0, r2, 1
	adds r0, r7
	adds r0, r6
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	bls _0814515E
	movs r2, 0
	adds r0, r4, 0x2
	adds r6, r4, 0
	adds r6, 0x17
	movs r1, 0x2B
	adds r1, r4
	mov r12, r1
	adds r4, 0x42
	ldr r5, _081451F8 @ =0x060001c8
	adds r3, r0, 0
_08145184:
	lsls r0, r2, 1
	adds r0, r7
	adds r0, r5
	adds r1, r2, r3
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x14
	bls _08145184
	movs r2, 0
	ldr r5, _081451FC @ =0x06000248
	adds r3, r6, 0
_0814519E:
	lsls r0, r2, 1
	adds r0, r7
	adds r0, r5
	adds r1, r2, r3
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x13
	bls _0814519E
	movs r2, 0
	ldr r5, _08145200 @ =0x060002c8
	mov r3, r12
_081451B8:
	lsls r0, r2, 1
	adds r0, r7
	adds r0, r5
	adds r1, r2, r3
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x16
	bls _081451B8
	movs r2, 0
	ldr r3, _08145204 @ =0x06000348
_081451D0:
	lsls r0, r2, 1
	adds r0, r7
	adds r0, r3
	adds r1, r2, r4
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xB
	bls _081451D0
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081451EC: .4byte gCreditsCopyrightEnd_Gfx
_081451F0: .4byte gIntroCopyright_Pal
_081451F4: .4byte 0x000003ff
_081451F8: .4byte 0x060001c8
_081451FC: .4byte 0x06000248
_08145200: .4byte 0x060002c8
_08145204: .4byte 0x06000348
	thumb_func_end sub_8145128

	thumb_func_start sub_8145208
sub_8145208: @ 8145208
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	movs r0, 0x3F
	ands r0, r2
	adds r1, r0, 0
	adds r1, 0x50
	cmp r2, 0xFF
	bne _08145220
	movs r0, 0x1
	b _08145246
_08145220:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _08145230
	movs r2, 0x80
	lsls r2, 4
	adds r0, r2, 0
	orrs r1, r0
_08145230:
	movs r0, 0x40
	ands r3, r0
	cmp r3, 0
	beq _08145244
	movs r2, 0x80
	lsls r2, 3
	adds r0, r2, 0
	orrs r1, r0
	lsls r0, r1, 16
	lsrs r1, r0, 16
_08145244:
	adds r0, r1, 0
_08145246:
	pop {r1}
	bx r1
	thumb_func_end sub_8145208

	thumb_func_start sub_814524C
sub_814524C: @ 814524C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	str r0, [sp]
	ldr r0, [sp, 0x2C]
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x4]
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0x8]
	lsls r0, 16
	lsrs r0, 20
	lsls r0, 28
	lsrs r0, 16
	mov r9, r0
	movs r5, 0
_0814527A:
	movs r4, 0
	lsls r7, r5, 1
	ldr r1, [sp, 0x4]
	adds r0, r1, r5
	adds r2, r5, 0x1
	mov r8, r2
	lsls r0, 6
	ldr r1, [sp, 0x8]
	adds r6, r0, r1
_0814528C:
	adds r0, r7, r5
	adds r0, r4
	ldr r2, [sp]
	adds r0, r2, r0
	ldrb r0, [r0]
	bl sub_8145208
	mov r2, r10
	adds r1, r2, r4
	lsls r1, 1
	adds r1, r6
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r2
	add r0, r9
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0814528C
	mov r1, r8
	lsls r0, r1, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _0814527A
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_814524C

	thumb_func_start sub_81452D0
sub_81452D0: @ 81452D0
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	lsrs r1, 20
	lsls r1, 28
	lsrs r1, 16
	movs r2, 0
	ldr r7, _08145360 @ =gUnknown_0840B83C
	movs r4, 0xC0
	lsls r4, 19
	adds r1, 0x1
	ldr r3, _08145364 @ =0x000003ff
_081452EE:
	lsls r0, r2, 1
	adds r0, r5
	adds r0, r4
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	bls _081452EE
	str r6, [sp]
	adds r0, r7, 0
	movs r1, 0x3
	movs r2, 0x7
	adds r3, r5, 0
	bl sub_814524C
	ldr r0, _08145368 @ =gUnknown_0840B84B
	str r6, [sp]
	movs r1, 0x7
	movs r2, 0x7
	adds r3, r5, 0
	bl sub_814524C
	ldr r4, _0814536C @ =gUnknown_0840B85A
	str r6, [sp]
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0x7
	adds r3, r5, 0
	bl sub_814524C
	str r6, [sp]
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0x7
	adds r3, r5, 0
	bl sub_814524C
	ldr r0, _08145370 @ =gUnknown_0840B869
	str r6, [sp]
	movs r1, 0x14
	movs r2, 0x7
	adds r3, r5, 0
	bl sub_814524C
	ldr r0, _08145374 @ =gUnknown_0840B878
	str r6, [sp]
	movs r1, 0x18
	movs r2, 0x7
	adds r3, r5, 0
	bl sub_814524C
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08145360: .4byte gUnknown_0840B83C
_08145364: .4byte 0x000003ff
_08145368: .4byte gUnknown_0840B84B
_0814536C: .4byte gUnknown_0840B85A
_08145370: .4byte gUnknown_0840B869
_08145374: .4byte gUnknown_0840B878
	thumb_func_end sub_81452D0

	thumb_func_start sub_8145378
sub_8145378: @ 8145378
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08145390 @ =gUnknown_0203935C
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08145394
	adds r0, r4, 0
	bl DestroySprite
	b _08145418
	.align 2, 0
_08145390: .4byte gUnknown_0203935C
_08145394:
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x5
	bhi _08145418
	lsls r0, 2
	ldr r1, _081453A8 @ =_081453AC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081453A8: .4byte _081453AC
	.align 2, 0
_081453AC:
	.4byte _081453C4
	.4byte _081453CE
	.4byte _081453D4
	.4byte _081453DE
	.4byte _081453E8
	.4byte _081453FE
_081453C4:
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	b _08145418
_081453CE:
	adds r0, r4, 0
	movs r1, 0x1
	b _08145402
_081453D4:
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnimIfDifferent
	b _08145418
_081453DE:
	adds r0, r4, 0
	movs r1, 0x3
	bl StartSpriteAnimIfDifferent
	b _08145418
_081453E8:
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	ldrh r1, [r4, 0x20]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x78
	ble _08145418
	subs r0, r1, 0x1
	b _08145416
_081453FE:
	adds r0, r4, 0
	movs r1, 0
_08145402:
	bl StartSpriteAnimIfDifferent
	ldrh r2, [r4, 0x20]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r0, 0x20
	negs r0, r0
	cmp r1, r0
	ble _08145418
	subs r0, r2, 0x1
_08145416:
	strh r0, [r4, 0x20]
_08145418:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8145378

	thumb_func_start sub_8145420
sub_8145420: @ 8145420
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08145438 @ =gUnknown_0203935C
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0814543C
	adds r0, r4, 0
	bl DestroySprite
	b _081454D8
	.align 2, 0
_08145438: .4byte gUnknown_0203935C
_0814543C:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08145464
	cmp r0, 0x1
	bgt _0814544E
	cmp r0, 0
	beq _08145458
	b _081454D8
_0814544E:
	cmp r0, 0x2
	beq _081454A0
	cmp r0, 0x3
	beq _081454BE
	b _081454D8
_08145458:
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	b _081454D8
_08145464:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	cmp r0, 0xC8
	ble _08145476
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnimIfDifferent
	b _0814547E
_08145476:
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnimIfDifferent
_0814547E:
	ldrh r2, [r4, 0x20]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r0, 0x20
	negs r0, r0
	cmp r1, r0
	ble _08145490
	subs r0, r2, 0x2
	strh r0, [r4, 0x20]
_08145490:
	ldr r0, _0814549C @ =gUnknown_0203935A
	ldrh r0, [r0]
	negs r0, r0
	strh r0, [r4, 0x26]
	b _081454D8
	.align 2, 0
_0814549C: .4byte gUnknown_0203935A
_081454A0:
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	ldrh r1, [r4, 0x3C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _081454D8
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	b _081454D6
_081454BE:
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	ldrh r2, [r4, 0x20]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r0, 0x20
	negs r0, r0
	cmp r1, r0
	ble _081454D8
	subs r0, r2, 0x1
_081454D6:
	strh r0, [r4, 0x20]
_081454D8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8145420

	thumb_func_start sub_81454E0
sub_81454E0: @ 81454E0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, _081454F8 @ =gUnknown_0203935C
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _081454FC
	adds r0, r5, 0
	bl DestroySprite
	b _081456A6
	.align 2, 0
_081454F8: .4byte gUnknown_0203935C
_081454FC:
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0xA
	bhi _08145544
	lsls r0, 2
	ldr r1, _08145514 @ =_08145518
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08145514: .4byte _08145518
	.align 2, 0
_08145518:
	.4byte _08145544
	.4byte _0814559E
	.4byte _08145620
	.4byte _08145660
	.4byte _08145544
	.4byte _08145544
	.4byte _08145544
	.4byte _08145544
	.4byte _08145544
	.4byte _08145544
	.4byte _08145696
_08145544:
	ldrb r1, [r5, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r5, 0x1]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x3]
	movs r0, 0x10
	strh r0, [r5, 0x32]
	ldrh r4, [r5, 0x30]
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x80
	lsls r0, 9
	movs r1, 0x10
	bl __divsi3
	adds r1, r0, 0
	str r1, [sp]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r5, 0x2E]
	b _081456A6
_0814559E:
	ldrh r1, [r5, 0x32]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	cmp r0, 0xFF
	bgt _081455D4
	adds r0, r1, 0
	adds r0, 0x8
	strh r0, [r5, 0x32]
	ldrh r4, [r5, 0x30]
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x32
	ldrsh r1, [r5, r0]
	movs r0, 0x80
	lsls r0, 9
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	b _081455DA
_081455D4:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_081455DA:
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	cmp r1, 0x2
	beq _081456A6
	cmp r1, 0x2
	bgt _081455EC
	cmp r1, 0x1
	beq _081455F2
	b _081456A6
_081455EC:
	cmp r1, 0x3
	beq _0814560A
	b _081456A6
_081455F2:
	ldrh r1, [r5, 0x3C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08145602
	ldrh r0, [r5, 0x22]
	adds r0, 0x1
	strh r0, [r5, 0x22]
_08145602:
	ldrh r0, [r5, 0x20]
	subs r0, 0x2
	strh r0, [r5, 0x20]
	b _081456A6
_0814560A:
	ldrh r0, [r5, 0x3C]
	ands r1, r0
	cmp r1, 0
	bne _08145618
	ldrh r0, [r5, 0x22]
	adds r0, 0x1
	strh r0, [r5, 0x22]
_08145618:
	ldrh r0, [r5, 0x20]
	adds r0, 0x2
	strh r0, [r5, 0x20]
	b _081456A6
_08145620:
	ldrh r1, [r5, 0x34]
	movs r2, 0x34
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _08145630
	subs r0, r1, 0x1
	strh r0, [r5, 0x34]
	b _081456A6
_08145630:
	ldr r1, _0814565C @ =REG_BLDCNT
	movs r2, 0xF4
	lsls r2, 4
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x10
	strh r0, [r1]
	ldrb r1, [r5, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x1]
	movs r0, 0x10
	strh r0, [r5, 0x34]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _081456A6
	.align 2, 0
_0814565C: .4byte REG_BLDCNT
_08145660:
	ldrh r1, [r5, 0x34]
	movs r2, 0x34
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _08145684
	subs r1, 0x1
	strh r1, [r5, 0x34]
	ldr r3, _08145680 @ =REG_BLDALPHA
	movs r0, 0x34
	ldrsh r2, [r5, r0]
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	adds r1, r0
	strh r1, [r3]
	b _081456A6
	.align 2, 0
_08145680: .4byte REG_BLDALPHA
_08145684:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0xA
	strh r0, [r5, 0x2E]
	b _081456A6
_08145696:
	ldr r0, _081456B0 @ =REG_BLDCNT
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r5, 0
	bl DestroySprite
_081456A6:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081456B0: .4byte REG_BLDCNT
	thumb_func_end sub_81454E0

	thumb_func_start sub_81456B4
sub_81456B4: @ 81456B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0x10]
	lsls r3, 16
	lsrs r3, 16
	mov r9, r3
	adds r0, r6, 0
	bl NationalPokedexNumToSpecies
	adds r6, r0, 0
	cmp r6, 0xC9
	beq _081456F8
	movs r0, 0x9A
	lsls r0, 1
	cmp r6, r0
	beq _081456EE
	movs r7, 0
	b _081456FC
_081456EE:
	ldr r0, _081456F4 @ =gSaveBlock2
	ldr r7, [r0, 0x20]
	b _081456FC
	.align 2, 0
_081456F4: .4byte gSaveBlock2
_081456F8:
	ldr r0, _081457E8 @ =gSaveBlock2
	ldr r7, [r0, 0x1C]
_081456FC:
	lsls r0, r6, 3
	ldr r1, _081457EC @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _081457F0 @ =gMonFrontPicCoords
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _081457F4 @ =gUnknown_0840B5A0
	mov r8, r4
	mov r5, r9
	lsls r4, r5, 2
	add r4, r8
	ldr r4, [r4]
	str r4, [sp]
	str r6, [sp, 0x4]
	str r7, [sp, 0x8]
	movs r4, 0x1
	str r4, [sp, 0xC]
	bl sub_800D378
	ldr r2, _081457F8 @ =0x0000ffff
	adds r0, r6, 0
	movs r1, 0
	bl species_and_otid_get_pal
	lsls r5, 4
	mov r8, r5
	movs r1, 0x80
	lsls r1, 1
	add r1, r8
	lsls r1, 16
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	mov r7, r9
	lsls r6, r7, 24
	lsrs r6, 24
	mov r0, r9
	adds r1, r6, 0
	bl sub_8143648
	ldr r0, _081457FC @ =gUnknown_02024E8C
	mov r2, r10
	lsls r1, r2, 16
	asrs r1, 16
	ldr r3, [sp, 0x10]
	lsls r2, r3, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08145800 @ =gSprites
	lsls r2, r4, 4
	adds r2, r4
	lsls r2, 2
	adds r3, r2, r5
	ldrb r1, [r3, 0x5]
	movs r0, 0xF
	ands r0, r1
	mov r7, r8
	orrs r0, r7
	movs r1, 0xD
	negs r1, r1
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3, 0x5]
	mov r0, r9
	adds r0, 0x1
	strh r0, [r3, 0x30]
	movs r0, 0x3E
	adds r0, r3
	mov r8, r0
	ldrb r0, [r0]
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	adds r0, r5, 0
	adds r0, 0x1C
	adds r2, r0
	ldr r0, _08145804 @ =sub_81454E0
	str r0, [r2]
	ldr r0, _08145808 @ =gSpriteTemplate_840CAEC
	movs r2, 0x20
	ldrsh r1, [r3, r2]
	movs r7, 0x22
	ldrsh r2, [r3, r7]
	movs r3, 0x1
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r4, [r0, 0x2E]
	adds r1, r6, 0
	bl StartSpriteAnimIfDifferent
	adds r0, r4, 0
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081457E8: .4byte gSaveBlock2
_081457EC: .4byte gMonFrontPicTable
_081457F0: .4byte gMonFrontPicCoords
_081457F4: .4byte gUnknown_0840B5A0
_081457F8: .4byte 0x0000ffff
_081457FC: .4byte gUnknown_02024E8C
_08145800: .4byte gSprites
_08145804: .4byte sub_81454E0
_08145808: .4byte gSpriteTemplate_840CAEC
	thumb_func_end sub_81456B4

	thumb_func_start sub_814580C
sub_814580C: @ 814580C
	push {r4,lr}
	adds r3, r0, 0
	ldr r4, _08145838 @ =gSprites
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0xA
	beq _08145830
	ldr r0, _0814583C @ =gUnknown_0203935C
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	beq _08145840
_08145830:
	adds r0, r3, 0
	bl DestroySprite
	b _081458D4
	.align 2, 0
_08145838: .4byte gSprites
_0814583C: .4byte gUnknown_0203935C
_08145840:
	adds r0, r1, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	movs r1, 0x4
	ands r1, r0
	mov r0, r12
	ldrb r2, [r0]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	movs r2, 0x2E
	ldrsh r1, [r3, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	movs r0, 0xC
	ands r0, r1
	ldrb r2, [r3, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x1]
	movs r0, 0x2E
	ldrsh r2, [r3, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r2, 0x4
	negs r2, r2
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x1]
	movs r2, 0x2E
	ldrsh r1, [r3, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x3]
	movs r1, 0x3E
	ands r1, r0
	ldrb r2, [r3, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x3]
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x20]
	strh r0, [r3, 0x20]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x22]
	strh r0, [r3, 0x22]
_081458D4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_814580C

	thumb_func_start sub_81458DC
sub_81458DC: @ 81458DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r7, _0814597C @ =0x0201c000
	ldr r0, _08145980 @ =0x00004023
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl GetStarterPokemon
	lsls r0, 16
	lsrs r0, 16
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	movs r4, 0x1
	movs r5, 0
	ldr r0, _08145984 @ =0x00000181
	mov r8, r0
_0814590E:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	adds r6, r7, 0
	adds r6, 0x90
	cmp r0, 0
	beq _0814592C
	lsls r0, r5, 1
	adds r0, r6, r0
	strh r4, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_0814592C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r8
	bls _0814590E
	adds r4, r5, 0
	ldr r0, _08145984 @ =0x00000181
	lsls r1, r4, 16
	mov r9, r1
	movs r2, 0x8E
	adds r2, r7
	mov r8, r2
	adds r1, r7, 0
	adds r1, 0x86
	str r1, [sp]
	cmp r4, r0
	bhi _08145964
	adds r1, r6, 0
	movs r3, 0
	adds r2, r0, 0
_08145954:
	lsls r0, r4, 1
	adds r0, r1, r0
	strh r3, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r2
	bls _08145954
_08145964:
	movs r2, 0xE5
	lsls r2, 2
	adds r0, r7, r2
	strh r5, [r0]
	mov r1, r9
	lsrs r0, r1, 16
	cmp r0, 0x43
	bhi _08145988
	mov r2, r8
	strh r5, [r2]
	b _0814598E
	.align 2, 0
_0814597C: .4byte 0x0201c000
_08145980: .4byte 0x00004023
_08145984: .4byte 0x00000181
_08145988:
	movs r0, 0x44
	mov r1, r8
	strh r0, [r1]
_0814598E:
	movs r5, 0
	movs r2, 0xE5
	lsls r2, 2
	adds r4, r7, r2
	mov r9, r5
	b _0814599E
_0814599A:
	cmp r5, 0x43
	bhi _081459EE
_0814599E:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	bl __umodsi3
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, r5, 1
	adds r1, r7, r1
	lsls r0, r2, 1
	adds r3, r6, r0
	ldrh r0, [r3]
	strh r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, r9
	strh r0, [r3]
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r2, r0
	beq _081459E8
	ldrh r0, [r4]
	lsls r0, 1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r3]
	ldrh r0, [r4]
	lsls r0, 1
	adds r0, r6, r0
	mov r1, r9
	strh r1, [r0]
_081459E8:
	ldrh r0, [r4]
	cmp r0, 0
	bne _0814599A
_081459EE:
	mov r2, r8
	ldrh r0, [r2]
	cmp r0, 0x43
	bhi _08145A26
	adds r5, r0, 0
	movs r2, 0
	cmp r5, 0x43
	bhi _08145A5C
	mov r3, r8
_08145A00:
	lsls r1, r5, 1
	adds r1, r7, r1
	lsls r0, r2, 1
	adds r0, r7, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r3]
	cmp r2, r0
	bne _08145A1A
	movs r2, 0
_08145A1A:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x43
	bls _08145A00
	b _08145A5C
_08145A26:
	movs r4, 0
	ldrh r0, [r7]
	cmp r0, r10
	beq _08145A42
_08145A2E:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r4, 1
	adds r0, r7, r0
	ldrh r0, [r0]
	cmp r0, r10
	beq _08145A42
	cmp r4, 0x43
	bls _08145A2E
_08145A42:
	mov r1, r8
	ldrh r0, [r1]
	subs r0, 0x1
	cmp r4, r0
	bge _08145A5C
	lsls r0, r4, 1
	adds r0, r7, r0
	ldr r2, [sp]
	ldrh r1, [r2]
	strh r1, [r0]
	mov r0, r10
	strh r0, [r2]
	b _08145A62
_08145A5C:
	mov r2, r10
	ldr r1, [sp]
	strh r2, [r1]
_08145A62:
	movs r0, 0x44
	mov r1, r8
	strh r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81458DC

	.align 2, 0 @ Don't pad with nop.
