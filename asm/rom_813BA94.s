	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start task_intro_1
task_intro_1: @ 813BA94
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	mov r8, r0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r0, 0
	bl SetVBlankCallback
	ldr r4, _0813BC18
	bl Random
	movs r1, 0x1
	ands r1, r0
	strh r1, [r4]
	bl intro_reset_and_hide_bgs
	ldr r0, _0813BC1C
	movs r6, 0
	strh r6, [r0]
	ldr r1, _0813BC20
	movs r0, 0x50
	strh r0, [r1]
	subs r1, 0x4
	movs r0, 0x18
	strh r0, [r1]
	subs r1, 0x4
	movs r0, 0x28
	strh r0, [r1]
	ldr r0, _0813BC24
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _0813BC28
	ldr r1, _0813BC2C
	bl LZ77UnCompVram
	ldr r1, _0813BC30
	add r0, sp, 0x8
	strh r6, [r0]
	ldr r4, _0813BC34
	str r0, [r4]
	str r1, [r4, 0x4]
	ldr r5, _0813BC38
	str r5, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _0813BC3C
	ldr r1, _0813BC40
	bl LZ77UnCompVram
	ldr r1, _0813BC44
	add r0, sp, 0x8
	strh r6, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
	str r5, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _0813BC48
	ldr r1, _0813BC4C
	bl LZ77UnCompVram
	ldr r1, _0813BC50
	add r0, sp, 0x8
	strh r6, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
	str r5, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _0813BC54
	ldr r1, _0813BC58
	bl LZ77UnCompVram
	ldr r1, _0813BC5C
	add r0, sp, 0x8
	strh r6, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
	str r5, [r4, 0x8]
	ldr r0, [r4, 0x8]
	ldr r0, _0813BC60
	movs r5, 0x80
	lsls r5, 2
	movs r1, 0
	adds r2, r5, 0
	bl LoadPalette
	ldr r1, _0813BC64
	ldr r2, _0813BC68
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r3, _0813BC6C
	adds r0, r3, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _0813BC70
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	movs r3, 0x90
	lsls r3, 8
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0813BC74
	bl LoadCompressedObjectPic
	ldr r0, _0813BC78
	bl LoadCompressedObjectPic
	ldr r0, _0813BC7C
	bl LoadSpritePalettes
	ldr r4, _0813BC80
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r4, r0
	adds r0, r4, 0
	movs r2, 0x10
	bl CpuSet
	movs r2, 0xE1
	lsls r2, 1
	adds r1, r4, r2
	adds r0, r4, 0
	movs r2, 0xF
	bl CpuSet
	movs r3, 0xD2
	lsls r3, 1
	adds r1, r4, r3
	adds r0, r4, 0
	movs r2, 0xE
	bl CpuSet
	movs r0, 0xC3
	lsls r0, 1
	adds r1, r4, r0
	adds r0, r4, 0
	movs r2, 0xD
	bl CpuSet
	movs r2, 0xB4
	lsls r2, 1
	adds r1, r4, r2
	adds r0, r4, 0
	movs r2, 0xC
	bl CpuSet
	movs r3, 0xA5
	lsls r3, 1
	adds r1, r4, r3
	adds r0, r4, 0
	movs r2, 0xB
	bl CpuSet
	movs r0, 0x96
	lsls r0, 1
	adds r1, r4, r0
	adds r0, r4, 0
	movs r2, 0xA
	bl CpuSet
	movs r1, 0xE
	negs r1, r1
	movs r0, 0x78
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r0, 0xEC
	adds r2, r5, 0
	movs r3, 0x1
	bl sub_813D584
	ldr r2, _0813BC84
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x8]
	ldr r0, _0813BC88
	str r0, [r1]
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813BC18: .4byte gUnknown_02039318
_0813BC1C: .4byte REG_BG3VOFS
_0813BC20: .4byte REG_BG2VOFS
_0813BC24: .4byte gUnknown_08407764
_0813BC28: .4byte gUnknown_08406B74
_0813BC2C: .4byte 0x06008000
_0813BC30: .4byte 0x06008800
_0813BC34: .4byte 0x040000d4
_0813BC38: .4byte 0x81000400
_0813BC3C: .4byte gUnknown_08406F28
_0813BC40: .4byte 0x06009000
_0813BC44: .4byte 0x06009800
_0813BC48: .4byte gUnknown_0840725C
_0813BC4C: .4byte 0x0600a000
_0813BC50: .4byte 0x0600a800
_0813BC54: .4byte gUnknown_0840754C
_0813BC58: .4byte 0x0600b000
_0813BC5C: .4byte 0x0600b800
_0813BC60: .4byte gUnknown_08406974
_0813BC64: .4byte REG_BG3CNT
_0813BC68: .4byte 0x00009603
_0813BC6C: .4byte 0x00009402
_0813BC70: .4byte 0x00009201
_0813BC74: .4byte gUnknown_0840B008
_0813BC78: .4byte gUnknown_0840B018
_0813BC7C: .4byte gUnknown_0840B028
_0813BC80: .4byte gPlttBufferUnfaded + 0x200
_0813BC84: .4byte gTasks
_0813BC88: .4byte task_intro_2
	thumb_func_end task_intro_1

	thumb_func_start task_intro_2
task_intro_2: @ 813BC8C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r5, 0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _0813BCE0
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0813BCE4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813BCE8
	str r1, [r0]
	ldr r0, _0813BCEC
	str r5, [r0]
	movs r0, 0xCF
	lsls r0, 1
	bl m4aSongNumStart
	bl ResetSerial
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813BCE0: .4byte sub_813B784
_0813BCE4: .4byte gTasks
_0813BCE8: .4byte sub_813BCF0
_0813BCEC: .4byte gUnknown_03005ED0
	thumb_func_end task_intro_2

	thumb_func_start sub_813BCF0
sub_813BCF0: @ 813BCF0
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r3, r0, 24
	adds r5, r3, 0
	ldr r4, _0813BDD4
	ldr r0, [r4]
	cmp r0, 0x4C
	bne _0813BD1E
	ldr r2, _0813BDD8
	ldr r1, _0813BDDC
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r6, 0x8
	ldrsh r1, [r0, r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strh r1, [r0, 0x2E]
_0813BD1E:
	ldr r0, [r4]
	cmp r0, 0xFB
	bne _0813BD40
	ldr r2, _0813BDD8
	ldr r1, _0813BDDC
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r3, 0x8
	ldrsh r1, [r0, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	strh r1, [r0, 0x2E]
_0813BD40:
	ldr r1, [r4]
	movs r0, 0xB8
	lsls r0, 1
	cmp r1, r0
	bne _0813BD60
	movs r2, 0x80
	lsls r2, 3
	movs r0, 0x70
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0x30
	movs r1, 0
	movs r3, 0x5
	bl sub_813D584
_0813BD60:
	ldr r1, [r4]
	movs r0, 0xC0
	lsls r0, 1
	cmp r1, r0
	bne _0813BD80
	movs r2, 0x80
	lsls r2, 3
	movs r0, 0x80
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0xC8
	movs r1, 0x3C
	movs r3, 0x9
	bl sub_813D584
_0813BD80:
	ldr r1, [r4]
	movs r0, 0x8C
	lsls r0, 2
	cmp r1, r0
	bne _0813BDA0
	ldr r0, _0813BDE0
	movs r1, 0
	bl CreateTask
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x78
	movs r1, 0x50
	bl sub_813D954
_0813BDA0:
	ldr r1, [r4]
	ldr r0, _0813BDE4
	cmp r1, r0
	bls _0813BDCA
	ldr r1, _0813BDDC
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0x50
	strh r1, [r0, 0xA]
	strh r2, [r0, 0xC]
	movs r1, 0x18
	strh r1, [r0, 0xE]
	strh r2, [r0, 0x10]
	movs r1, 0x28
	strh r1, [r0, 0x12]
	strh r2, [r0, 0x14]
	ldr r1, _0813BDE8
	str r1, [r0]
_0813BDCA:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0813BDD4: .4byte gUnknown_03005ED0
_0813BDD8: .4byte gSprites
_0813BDDC: .4byte gTasks
_0813BDE0: .4byte sub_813CCE8
_0813BDE4: .4byte 0x000002e3
_0813BDE8: .4byte task_intro_4
	thumb_func_end sub_813BCF0

	thumb_func_start task_intro_4
task_intro_4: @ 813BDEC
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	adds r4, r2, 0
	ldr r0, _0813BE80
	ldr r3, [r0]
	ldr r0, _0813BE84
	cmp r3, r0
	bhi _0813BEAC
	ldr r0, _0813BE88
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	lsls r0, 16
	ldrh r2, [r1, 0xC]
	adds r0, r2
	ldr r2, _0813BE8C
	adds r0, r2
	asrs r2, r0, 16
	strh r2, [r1, 0xA]
	strh r0, [r1, 0xC]
	ldr r0, _0813BE90
	strh r2, [r0]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	lsls r0, 16
	ldrh r2, [r1, 0x10]
	adds r0, r2
	ldr r2, _0813BE94
	adds r0, r2
	asrs r2, r0, 16
	strh r2, [r1, 0xE]
	strh r0, [r1, 0x10]
	ldr r0, _0813BE98
	strh r2, [r0]
	movs r2, 0x12
	ldrsh r0, [r1, r2]
	lsls r0, 16
	ldrh r2, [r1, 0x14]
	adds r0, r2
	ldr r2, _0813BE9C
	adds r0, r2
	asrs r2, r0, 16
	strh r2, [r1, 0x12]
	strh r0, [r1, 0x14]
	ldr r0, _0813BEA0
	strh r2, [r0]
	movs r0, 0xDC
	lsls r0, 2
	cmp r3, r0
	bne _0813BED2
	ldr r0, _0813BEA4
	movs r1, 0xC8
	movs r2, 0xA0
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813BEA8
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	b _0813BED2
	.align 2, 0
_0813BE80: .4byte gUnknown_03005ED0
_0813BE84: .4byte 0x00000387
_0813BE88: .4byte gTasks
_0813BE8C: .4byte 0xffff4000
_0813BE90: .4byte REG_BG2VOFS
_0813BE94: .4byte 0xffff0000
_0813BE98: .4byte REG_BG1VOFS
_0813BE9C: .4byte 0xfffe8000
_0813BEA0: .4byte REG_BG0VOFS
_0813BEA4: .4byte gSpriteTemplate_840AFF0
_0813BEA8: .4byte gSprites
_0813BEAC:
	ldr r0, _0813BEDC
	cmp r3, r0
	bls _0813BED2
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0813BEE0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0813BEE4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813BEE8
	str r1, [r0]
_0813BED2:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813BEDC: .4byte 0x000003ef
_0813BEE0: .4byte 0x0000ffff
_0813BEE4: .4byte gTasks
_0813BEE8: .4byte sub_813BEEC
	thumb_func_end task_intro_4

	thumb_func_start sub_813BEEC
sub_813BEEC: @ 813BEEC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0813BF10
	ldr r1, [r0]
	ldr r0, _0813BF14
	cmp r1, r0
	bls _0813BF0A
	ldr r0, _0813BF18
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813BF1C
	str r0, [r1]
_0813BF0A:
	pop {r0}
	bx r0
	.align 2, 0
_0813BF10: .4byte gUnknown_03005ED0
_0813BF14: .4byte 0x00000402
_0813BF18: .4byte gTasks
_0813BF1C: .4byte task_intro_6
	thumb_func_end sub_813BEEC

	thumb_func_start task_intro_6
task_intro_6: @ 813BF20
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl intro_reset_and_hide_bgs
	movs r0, 0
	bl SetVBlankCallback
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0813BF60
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0813BF64
	strh r1, [r0]
	.ifdef SAPPHIRE
	movs r0, 0
	.else
	movs r0, 0x1
	.endif
	bl load_intro_part2_graphics
	ldr r1, _0813BF68
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813BF6C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813BF60: .4byte gUnknown_02039358
_0813BF64: .4byte gUnknown_0203935A
_0813BF68: .4byte gTasks
_0813BF6C: .4byte sub_813BF70
	thumb_func_end task_intro_6

	thumb_func_start sub_813BF70
sub_813BF70: @ 813BF70
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0813BF88
	ldrh r0, [r0]
	cmp r0, 0
	bne _0813BF90
	ldr r0, _0813BF8C
	bl LoadCompressedObjectPic
	b _0813BF96
	.align 2, 0
_0813BF88: .4byte gUnknown_02039318
_0813BF8C: .4byte gIntro2BrendanSpriteSheet
_0813BF90:
	ldr r0, _0813BFBC
	bl LoadCompressedObjectPic
_0813BF96:
	ldr r0, _0813BFC0
	bl LoadCompressedObjectPic
	ldr r0, _0813BFC4
	bl LoadCompressedObjectPic
	ldr r0, _0813BFC8
	bl LoadSpritePalettes
	ldr r0, _0813BFCC
	ldrh r0, [r0]
	cmp r0, 0
	bne _0813BFD0
	movs r0, 0x88
	lsls r0, 1
	movs r1, 0x64
	bl sub_8149310
	b _0813BFDA
	.align 2, 0
_0813BFBC: .4byte gIntro2MaySpriteSheet
_0813BFC0: .4byte gIntro2BicycleSpriteSheet
	.ifdef SAPPHIRE
_0813BFC4: .4byte gIntro2LatiasSpriteSheet
	.else
_0813BFC4: .4byte gIntro2LatiosSpriteSheet
	.endif
_0813BFC8: .4byte gIntro2SpritePalettes
_0813BFCC: .4byte gUnknown_02039318
_0813BFD0:
	movs r0, 0x88
	lsls r0, 1
	movs r1, 0x64
	bl sub_8149368
_0813BFDA:
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _0813C060
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r5, r2, 0
	adds r5, 0x1C
	adds r3, r0, r5
	ldr r1, _0813C064
	str r1, [r3]
	adds r2, 0x8
	adds r0, r2
	ldr r1, _0813C068
	str r1, [r0]
	ldr r0, _0813C06C
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	strh r6, [r4, 0xA]
	movs r0, 0x40
	negs r0, r0
	movs r1, 0x3C
	.ifdef SAPPHIRE
	bl sapphire_sub_81494A0
	.else
	bl sub_8149424
	.endif
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	ldr r1, _0813C070
	str r1, [r0]
	strh r6, [r4, 0xC]
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0813C074
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _0813C078
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 7
	.ifdef SAPPHIRE
	movs r0, 0
	movs r2, 0x40
	.else
	movs r2, 0x80
	lsls r2, 3
	movs r0, 0x1
	.endif
	movs r3, 0x10
	bl sub_8148EC0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x8]
	.ifdef SAPPHIRE
	movs r0, 0
	.else
	movs r0, 0x1
	.endif
	bl sub_8148C78
	ldr r0, _0813C07C
	str r0, [r4]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813C060: .4byte gSprites
_0813C064: .4byte sub_813D788
_0813C068: .4byte gUnknown_0840AE80
_0813C06C: .4byte gTasks
_0813C070: .4byte sub_813D880
_0813C074: .4byte 0x0000ffff
_0813C078: .4byte sub_813B784
_0813C07C: .4byte sub_813C080
	thumb_func_end sub_813BF70

	thumb_func_start sub_813C080
sub_813C080: @ 813C080
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	ldr r5, _0813C1BC
	ldr r1, [r5]
	ldr r0, _0813C1C0
	cmp r1, r0
	bls _0813C0B4
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0813C1C4
	str r1, [sp]
	movs r1, 0x10
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0813C1C8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813C1CC
	str r1, [r0]
_0813C0B4:
	ldr r1, [r5]
	ldr r0, _0813C1D0
	ldr r3, _0813C1C8
	cmp r1, r0
	bne _0813C0D8
	ldr r2, _0813C1D4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r3
	movs r7, 0xA
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strh r1, [r0, 0x2E]
_0813C0D8:
	ldr r1, [r5]
	ldr r0, _0813C1D8
	cmp r1, r0
	bne _0813C0FA
	ldr r2, _0813C1D4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r3
	movs r7, 0xA
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
_0813C0FA:
	ldr r1, [r5]
	ldr r0, _0813C1DC
	cmp r1, r0
	bne _0813C11C
	ldr r2, _0813C1D4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r3
	movs r7, 0xC
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x1
	strh r1, [r0, 0x2E]
_0813C11C:
	ldr r1, [r5]
	ldr r0, _0813C1E0
	cmp r1, r0
	bne _0813C13E
	ldr r2, _0813C1D4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r3
	movs r7, 0xA
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	strh r1, [r0, 0x2E]
_0813C13E:
	ldr r1, [r5]
	ldr r0, _0813C1E4
	cmp r1, r0
	bne _0813C160
	ldr r2, _0813C1D4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r3
	movs r7, 0xA
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	strh r1, [r0, 0x2E]
_0813C160:
	ldr r1, [r5]
	ldr r0, _0813C1E8
	cmp r1, r0
	bne _0813C182
	ldr r2, _0813C1D4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r3
	movs r4, 0xA
	ldrsh r1, [r0, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x4
	strh r1, [r0, 0x2E]
_0813C182:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r3
	ldrh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 18
	movs r1, 0x7F
	ands r0, r1
	movs r1, 0x30
	bl Sin
	ldr r1, _0813C1EC
	strh r0, [r1]
	ldrh r2, [r4, 0xE]
	movs r7, 0xE
	ldrsh r1, [r4, r7]
	ldr r0, _0813C1F0
	cmp r1, r0
	bgt _0813C1AE
	adds r0, r2, 0x1
	strh r0, [r4, 0xE]
_0813C1AE:
	.ifdef SAPPHIRE
	movs r0, 0
	.else
	movs r0, 0x1
	.endif
	bl sub_8149020
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813C1BC: .4byte gUnknown_03005ED0
_0813C1C0: .4byte 0x0000071f
_0813C1C4: .4byte 0x0000ffff
_0813C1C8: .4byte gTasks
_0813C1CC: .4byte sub_813C1F4
_0813C1D0: .4byte 0x00000455
_0813C1D4: .4byte gSprites
_0813C1D8: .4byte 0x000004be
_0813C1DC: .4byte 0x00000572
_0813C1E0: .4byte 0x00000576
_0813C1E4: .4byte 0x00000632
_0813C1E8: .4byte 0x000006bf
_0813C1EC: .4byte gUnknown_0203935A
_0813C1F0: .4byte 0x000001ff
	thumb_func_end sub_813C080

	thumb_func_start sub_813C1F4
sub_813C1F4: @ 813C1F4
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0813C220
	ldr r1, [r0]
	ldr r0, _0813C224
	cmp r1, r0
	bls _0813C218
	ldr r0, _0813C228
	lsls r4, r2, 2
	adds r4, r2
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x8]
	bl DestroyTask
	ldr r0, _0813C22C
	str r0, [r4]
_0813C218:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C220: .4byte gUnknown_03005ED0
_0813C224: .4byte 0x00000814
_0813C228: .4byte gTasks
_0813C22C: .4byte task_intro_10
	thumb_func_end sub_813C1F4

	thumb_func_start task_intro_10
task_intro_10: @ 813C230
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	bl intro_reset_and_hide_bgs
	ldr r0, _0813C2C0
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _0813C2C4
	ldr r1, _0813C2C8
	bl LZ77UnCompVram
	ldr r0, _0813C2CC
	movs r2, 0x80
	lsls r2, 2
	movs r1, 0
	bl LoadPalette
	ldr r0, _0813C2D0
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	movs r5, 0
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	strh r5, [r4, 0xE]
	movs r0, 0x78
	movs r1, 0x50
	movs r2, 0
	movs r3, 0
	bl sub_813CE30
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0813C2D4
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _0813C2D8
	ldr r2, _0813C2DC
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xC
	ldr r2, _0813C2E0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0813C2E4
	str r0, [r4]
	ldr r0, _0813C2E8
	str r5, [r0]
	movs r0, 0xDD
	lsls r0, 1
	bl m4aSongNumStart
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813C2C0: .4byte gUnknown_08409C04
_0813C2C4: .4byte gUnknown_08409AD4
_0813C2C8: .4byte 0x06004000
_0813C2CC: .4byte gUnknown_084098D4
_0813C2D0: .4byte gTasks
_0813C2D4: .4byte 0x0000ffff
_0813C2D8: .4byte REG_BG2CNT
_0813C2DC: .4byte 0x00004883
_0813C2E0: .4byte 0x00001441
_0813C2E4: .4byte task_intro_11
_0813C2E8: .4byte gUnknown_03005ED0
	thumb_func_end task_intro_10

	thumb_func_start task_intro_11
task_intro_11: @ 813C2EC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _0813C324
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r2
	movs r1, 0x80
	lsls r1, 3
	adds r0, r1, 0
	ldrh r1, [r3, 0x8]
	adds r0, r1
	strh r0, [r3, 0x8]
	ldrh r4, [r3, 0xA]
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	ldr r0, _0813C328
	cmp r1, r0
	bgt _0813C32C
	ldrh r0, [r3, 0xC]
	adds r1, r4, r0
	strh r1, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	b _0813C330
	.align 2, 0
_0813C324: .4byte gTasks
_0813C328: .4byte 0x000006bf
_0813C32C:
	ldr r0, _0813C378
	str r0, [r3]
_0813C330:
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r2
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x80
	lsls r0, 9
	bl __divsi3
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	ldrh r3, [r4, 0x8]
	movs r0, 0x78
	movs r1, 0x50
	bl sub_813CE30
	ldr r0, _0813C37C
	ldr r0, [r0]
	cmp r0, 0x2C
	bne _0813C36E
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0813C380
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0813C36E:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813C378: .4byte sub_813C384
_0813C37C: .4byte gUnknown_03005ED0
_0813C380: .4byte 0x0000ffff
	thumb_func_end task_intro_11

	thumb_func_start sub_813C384
sub_813C384: @ 813C384
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0813C3A4
	ldr r0, [r0]
	cmp r0, 0x3B
	bls _0813C3A0
	ldr r0, _0813C3A8
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813C3AC
	str r0, [r1]
_0813C3A0:
	pop {r0}
	bx r0
	.align 2, 0
_0813C3A4: .4byte gUnknown_03005ED0
_0813C3A8: .4byte gTasks
_0813C3AC: .4byte sub_813C3B0
	thumb_func_end sub_813C384

	thumb_func_start sub_813C3B0
sub_813C3B0: @ 813C3B0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	bl intro_reset_and_hide_bgs
	movs r1, 0
	ldr r2, _0813C4E4
	movs r7, 0
	adds r6, r2, 0
	adds r6, 0x20
	adds r5, r2, 0
	adds r5, 0x40
	mov r12, r2
	movs r4, 0x11
	movs r3, 0x22
_0813C3D4:
	adds r0, r1, r2
	strb r7, [r0]
	adds r0, r1, r6
	strb r4, [r0]
	adds r0, r1, r5
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x1F
	bls _0813C3D4
	movs r1, 0xC0
	lsls r1, 19
	ldr r0, _0813C4E8
	mov r2, r12
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0813C4EC
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	movs r1, 0
	ldr r5, _0813C4F0
	ldr r6, _0813C4F4
	mov r0, r8
	lsls r7, r0, 2
	ldr r4, _0813C4F8
	ldr r2, _0813C4FC
	adds r3, r2, 0
	ldr r2, _0813C500
_0813C40E:
	lsls r0, r1, 1
	adds r0, r4
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bls _0813C40E
	movs r1, 0
	ldr r3, _0813C504
	ldr r0, _0813C508
	adds r2, r0, 0
_0813C426:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x7F
	bls _0813C426
	movs r1, 0
	ldr r4, _0813C50C
	movs r2, 0xF0
	lsls r2, 8
	adds r3, r2, 0
	ldr r2, _0813C510
_0813C442:
	lsls r0, r1, 1
	adds r0, r4
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bls _0813C442
	movs r1, 0
	ldr r3, _0813C514
	ldr r0, _0813C508
	adds r2, r0, 0
_0813C45A:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x7F
	bls _0813C45A
	movs r0, 0xF0
	lsls r0, 1
	adds r2, r5, r0
	movs r4, 0
	ldr r1, _0813C518
	strh r1, [r2]
	adds r0, r6, r0
	strh r1, [r0]
	movs r0, 0x1
	bl sub_813D084
	movs r0, 0xF2
	lsls r0, 1
	adds r1, r5, r0
	strh r4, [r1]
	adds r0, r6, r0
	strh r4, [r0]
	ldr r0, _0813C51C
	ldr r1, _0813C520
	bl LZ77UnCompVram
	ldr r0, _0813C524
	ldr r1, _0813C528
	bl LZ77UnCompVram
	ldr r0, _0813C52C
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _0813C530
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _0813C534
	bl LoadCompressedObjectPic
	ldr r0, _0813C538
	bl LoadCompressedObjectPic
	ldr r0, _0813C53C
	bl LoadCompressedObjectPalette
	ldr r0, _0813C540
	bl LoadSpritePalettes
	ldr r1, _0813C544
	mov r2, r8
	adds r0, r7, r2
	lsls r0, 3
	adds r0, r1
	ldr r1, _0813C548
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813C4E4: .4byte 0x02000000
_0813C4E8: .4byte 0x040000d4
_0813C4EC: .4byte 0x80000030
_0813C4F0: .4byte gPlttBufferUnfaded
_0813C4F4: .4byte gPlttBufferFaded
_0813C4F8: .4byte 0x06003000
_0813C4FC: .4byte 0x0000f001
_0813C500: .4byte 0x0000027f
_0813C504: .4byte 0x06003800
_0813C508: .4byte 0x0000f002
_0813C50C: .4byte 0x06003900
_0813C510: .4byte 0x0000017f
_0813C514: .4byte 0x06003c00
_0813C518: .4byte 0x00007fff
_0813C51C: .4byte gUnknown_0840A778
_0813C520: .4byte 0x06004000
_0813C524: .4byte gUnknown_0840A7E4
_0813C528: .4byte 0x06007000
_0813C52C: .4byte gUnknown_0840A758
_0813C530: .4byte gReservedSpritePaletteCount
_0813C534: .4byte gUnknown_0840B20C
_0813C538: .4byte gUnknown_0840B21C
_0813C53C: .4byte gUnknown_0840B22C
_0813C540: .4byte gUnknown_0840B23C
_0813C544: .4byte gTasks
_0813C548: .4byte sub_813C54C
	thumb_func_end sub_813C3B0

	thumb_func_start sub_813C54C
sub_813C54C: @ 813C54C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0813C5BC
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0xA0
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0x1C
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1D
	strh r0, [r1]
	subs r1, 0x3C
	ldr r2, _0813C5C0
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x6
	adds r2, 0xFD
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x8
	movs r2, 0xE5
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0813C5C4
	movs r1, 0
	bl CreateTask
	ldr r5, _0813C5C8
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	strh r0, [r1, 0x26]
	movs r0, 0x26
	ldrsh r2, [r1, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r5
	strh r3, [r0, 0x8]
	strh r3, [r1, 0x8]
	ldr r0, _0813C5CC
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0813C5BC: .4byte REG_WIN0H
_0813C5C0: .4byte 0x00000603
_0813C5C4: .4byte sub_813CAF4
_0813C5C8: .4byte gTasks
_0813C5CC: .4byte sub_813C5D0
	thumb_func_end sub_813C54C

	thumb_func_start sub_813C5D0
sub_813C5D0: @ 813C5D0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813C600
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r1, [r3, 0x8]
	movs r2, 0x8
	ldrsh r0, [r3, r2]
	cmp r0, 0x20
	beq _0813C608
	adds r0, r1, 0x4
	strh r0, [r3, 0x8]
	ldr r2, _0813C604
	movs r4, 0x8
	ldrsh r0, [r3, r4]
	lsls r0, 8
	subs r1, 0x9C
	subs r0, r1
	strh r0, [r2]
	b _0813C616
	.align 2, 0
_0813C600: .4byte gTasks
_0813C604: .4byte REG_WIN0V
_0813C608:
	ldr r0, _0813C61C
	movs r2, 0x82
	lsls r2, 6
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _0813C620
	str r0, [r3]
_0813C616:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813C61C: .4byte REG_WIN0V
_0813C620: .4byte sub_813C624
	thumb_func_end sub_813C5D0

	thumb_func_start sub_813C624
sub_813C624: @ 813C624
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813C638
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0813C63C
	str r0, [r1]
	bx lr
	.align 2, 0
_0813C638: .4byte gTasks
_0813C63C: .4byte sub_813C640
	thumb_func_end sub_813C624

	thumb_func_start sub_813C640
sub_813C640: @ 813C640
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0813C65C
	movs r1, 0
	strh r1, [r2]
	ldr r2, _0813C660
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0813C664
	str r0, [r1]
	bx lr
	.align 2, 0
_0813C65C: .4byte gUnknown_0203931A
_0813C660: .4byte gTasks
_0813C664: .4byte sub_813C668
	thumb_func_end sub_813C640

	thumb_func_start sub_813C668
sub_813C668: @ 813C668
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0813CA24
	mov r8, r0
	ldr r0, [r0]
	cmp r0, 0x50
	bne _0813C6AC
	ldr r0, _0813CA28
	movs r4, 0x1
	str r4, [sp]
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x5
	bl sub_813CE88
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, _0813CA2C
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x1C
	adds r1, r0, r1
	ldr r2, _0813CA30
	str r2, [r1]
	adds r0, r3
	movs r1, 0
	strh r4, [r0, 0x30]
	strh r1, [r0, 0x32]
_0813C6AC:
	mov r1, r8
	ldr r0, [r1]
	cmp r0, 0x98
	bne _0813C6E2
	ldr r0, _0813CA34
	movs r4, 0x1
	str r4, [sp]
	movs r1, 0
	movs r2, 0xA0
	movs r3, 0x4
	bl sub_813CE88
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, _0813CA2C
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x1C
	adds r1, r0, r1
	ldr r2, _0813CA30
	str r2, [r1]
	adds r0, r3
	movs r1, 0x2
	strh r1, [r0, 0x30]
	strh r4, [r0, 0x32]
_0813C6E2:
	mov r3, r8
	ldr r0, [r3]
	cmp r0, 0xDB
	bne _0813C720
	movs r0, 0
	bl sub_813D084
	ldr r0, _0813CA38
	ldrh r0, [r0]
	movs r1, 0x88
	lsls r1, 1
	movs r2, 0x60
	movs r3, 0x6
	bl sub_813CFA8
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0813CA2C
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0813CA3C
	str r1, [r0]
	ldr r1, _0813CA40
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0xA]
_0813C720:
	mov r0, r8
	ldr r1, [r0]
	movs r0, 0x98
	lsls r0, 1
	cmp r1, r0
	bne _0813C758
	ldr r3, _0813CA40
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r3
	movs r0, 0x26
	ldrsh r2, [r1, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r3
	movs r2, 0x4
	strh r2, [r0, 0x8]
	ldr r2, _0813CA2C
	movs r3, 0xA
	ldrsh r1, [r1, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2
	strh r1, [r0, 0x2E]
_0813C758:
	mov r0, r8
	ldr r1, [r0]
	movs r0, 0xC0
	lsls r0, 1
	cmp r1, r0
	bne _0813C790
	ldr r3, _0813CA40
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r3
	movs r0, 0x26
	ldrsh r2, [r1, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r3
	movs r2, 0
	strh r2, [r0, 0x8]
	ldr r2, _0813CA2C
	movs r3, 0xA
	ldrsh r1, [r1, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x4
	strh r1, [r0, 0x2E]
_0813C790:
	mov r0, r8
	ldr r1, [r0]
	movs r0, 0xC8
	lsls r0, 1
	cmp r1, r0
	bne _0813C7AE
	movs r0, 0xFF
	lsls r0, 16
	ldr r1, _0813CA44
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0813C7AE:
	mov r3, r8
	ldr r1, [r3]
	movs r0, 0xD8
	lsls r0, 1
	cmp r1, r0
	bne _0813C7D6
	ldr r2, _0813CA2C
	ldr r1, _0813CA40
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	movs r3, 0xA
	ldrsh r1, [r0, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x5
	strh r1, [r0, 0x2E]
_0813C7D6:
	mov r0, r8
	ldr r1, [r0]
	movs r0, 0xE7
	lsls r0, 1
	cmp r1, r0
	bne _0813C80E
	ldr r3, _0813CA2C
	ldr r4, _0813CA40
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r4
	movs r0, 0xA
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	movs r2, 0x6
	strh r2, [r0, 0x2E]
	movs r3, 0x26
	ldrsh r1, [r1, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0x2
	strh r1, [r0, 0x8]
_0813C80E:
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _0813CA48
	cmp r1, r0
	bne _0813C854
	movs r0, 0x1
	bl sub_813D084
	ldr r0, _0813CA28
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0xD0
	movs r2, 0x8
	movs r3, 0x5
	bl sub_813CE88
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0813CA2C
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0813CA4C
	str r1, [r0]
	ldr r1, _0813CA40
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0xC]
	adds r0, r2, 0
	bl sub_813E7C0
_0813C854:
	mov r3, r8
	ldr r1, [r3]
	ldr r0, _0813CA50
	cmp r1, r0
	bne _0813C894
	subs r0, 0xB2
	movs r1, 0x1
	str r1, [sp]
	movs r1, 0xF8
	movs r2, 0x10
	movs r3, 0x4
	bl sub_813CE88
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0813CA2C
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0813CA4C
	str r1, [r0]
	ldr r1, _0813CA40
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0xE]
	adds r0, r2, 0
	bl sub_813E930
_0813C894:
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _0813CA54
	cmp r1, r0
	bne _0813C8D8
	ldr r4, _0813CA2C
	ldr r5, _0813CA40
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r5
	movs r3, 0xC
	ldrsh r2, [r1, r3]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	movs r3, 0x2
	strh r3, [r0, 0x2E]
	movs r0, 0xE
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x2E]
	movs r3, 0x26
	ldrsh r1, [r1, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	movs r1, 0x3
	strh r1, [r0, 0x8]
_0813C8D8:
	mov r0, r8
	ldr r1, [r0]
	movs r0, 0x9C
	lsls r0, 2
	cmp r1, r0
	bne _0813C920
	movs r0, 0
	bl sub_813D084
	ldr r0, _0813CA58
	movs r1, 0
	str r1, [sp]
	movs r1, 0x20
	movs r2, 0x98
	movs r3, 0
	bl sub_813CE88
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0813CA2C
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0813CA5C
	str r1, [r0]
	ldr r1, _0813CA40
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x10]
	adds r0, r2, 0
	bl sub_813EDBC
_0813C920:
	mov r3, r8
	ldr r1, [r3]
	movs r0, 0xAF
	lsls r0, 2
	cmp r1, r0
	bne _0813C966
	movs r0, 0x8C
	lsls r0, 1
	movs r1, 0x8
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x1
	bl sub_813CE88
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0813CA2C
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0813CA5C
	str r1, [r0]
	ldr r1, _0813CA40
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x12]
	adds r0, r2, 0
	bl sub_813EB4C
_0813C966:
	mov r0, r8
	ldr r1, [r0]
	movs r0, 0xC2
	lsls r0, 2
	cmp r1, r0
	bne _0813C9B2
	ldr r1, _0813CA60
	movs r0, 0x1
	strh r0, [r1]
	ldr r4, _0813CA2C
	ldr r6, _0813CA40
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r6
	movs r3, 0x10
	ldrsh r2, [r1, r3]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	movs r5, 0
	movs r3, 0x2
	strh r3, [r0, 0x2E]
	movs r0, 0x12
	ldrsh r2, [r1, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x2E]
	movs r3, 0x26
	ldrsh r1, [r1, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	strh r5, [r0, 0x8]
_0813C9B2:
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _0813CA64
	cmp r1, r0
	bne _0813CA76
	movs r0, 0x2
	bl sub_813D084
	ldr r4, _0813CA2C
	ldr r0, _0813CA40
	lsls r2, r7, 2
	adds r2, r7
	lsls r2, 3
	adds r2, r0
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r3, 0x3
	strh r3, [r0, 0x2E]
	movs r0, 0xE
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x2E]
	movs r0, 0x10
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x2E]
	movs r0, 0x12
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x2E]
	ldr r0, _0813CA68
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0xF
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r4
	b _0813CA6C
	.align 2, 0
_0813CA24: .4byte gUnknown_03005ED0
_0813CA28: .4byte 0x0000014b
_0813CA2C: .4byte gSprites
_0813CA30: .4byte sub_813DB9C
_0813CA34: .4byte 0x00000169
_0813CA38: .4byte gUnknown_02039318
_0813CA3C: .4byte sub_813DE70
_0813CA40: .4byte gTasks
_0813CA44: .4byte 0x00007eff
_0813CA48: .4byte 0x000001cf
_0813CA4C: .4byte sub_813E10C
_0813CA50: .4byte 0x0000021b
_0813CA54: .4byte 0x0000026f
_0813CA58: .4byte 0x0000011b
_0813CA5C: .4byte sub_813E210
_0813CA60: .4byte gUnknown_0203931A
_0813CA64: .4byte 0x0000030d
_0813CA68: .4byte gSpriteTemplate_840B1F4
_0813CA6C:
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_0813CA76:
	mov r3, r8
	ldr r1, [r3]
	movs r0, 0xC8
	lsls r0, 2
	cmp r1, r0
	bne _0813CA88
	movs r0, 0x67
	bl PlaySoundEffect
_0813CA88:
	mov r0, r8
	ldr r1, [r0]
	ldr r0, _0813CAC8
	cmp r1, r0
	bne _0813CAA4
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0813CACC
	str r1, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0813CAA4:
	mov r3, r8
	ldr r1, [r3]
	ldr r0, _0813CAD0
	cmp r1, r0
	bne _0813CABC
	ldr r0, _0813CAD4
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _0813CAD8
	str r0, [r1]
_0813CABC:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0813CAC8: .4byte 0x00000352
_0813CACC: .4byte 0x0000ffff
_0813CAD0: .4byte 0x000003b2
_0813CAD4: .4byte gTasks
_0813CAD8: .4byte sub_813CADC
	thumb_func_end sub_813C668

	thumb_func_start sub_813CADC
sub_813CADC: @ 813CADC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r0, _0813CAF0
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0813CAF0: .4byte CB2_813B7EC
	thumb_func_end sub_813CADC

	thumb_func_start sub_813CAF4
sub_813CAF4: @ 813CAF4
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0813CB2C
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
	ldr r0, _0813CB5C
	strh r6, [r0]
	movs r0, 0xFF
	strh r0, [r4, 0x8]
	b _0813CC8E
	.align 2, 0
_0813CB5C: .4byte REG_BG2CNT
_0813CB60:
	ldr r0, _0813CBB0
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _0813CBB4
	ldr r2, _0813CBB8
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
	ldr r2, _0813CBBC
	ldr r0, _0813CBC0
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
	ldr r0, _0813CC14
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _0813CC18
	ldr r2, _0813CC1C
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
	ldr r2, _0813CC20
	ldr r0, _0813CC24
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
	ldr r0, _0813CC98
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0x5
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0813CC9C
	ldr r2, _0813CCA0
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
	ldr r2, _0813CCA4
	ldr r1, _0813CCA8
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r1
	ldrh r0, [r3, 0xA]
	strh r0, [r2]
	ldr r1, _0813CCAC
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
	ldr r1, _0813CD0C
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
	ldr r1, _0813CD10
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
	ldr r1, _0813CD54
	ldr r4, _0813CD58
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
	ldr r1, _0813CD84
	ldr r0, _0813CD88
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
	ldr r3, _0813CDD8
	ldr r1, _0813CDDC
	ands r0, r2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r3]
	b _0813CE26
	.align 2, 0
_0813CDD8: .4byte REG_BLDALPHA
_0813CDDC: .4byte gUnknown_08393E64
_0813CDE0:
	ldr r1, _0813CDF4
	ldr r0, _0813CDF8
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
	ldr r0, _0813CE2C
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
	ldr r1, _0813CE84
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
	ldr r1, _0813CEE4
	adds r0, r1
	ldr r1, _0813CEE8
	lsls r2, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r5, _0813CEEC
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
	ldr r1, _0813CF90
	adds r0, r1
	ldr r1, _0813CF94
	lsls r2, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _0813CF98
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
	ldr r2, _0813CF9C
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
	ldr r0, _0813CFA0
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
	ldr r1, _0813CFA4
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
	ldr r1, _0813D068
	mov r8, r1
	add r8, r7
	ldr r1, _0813D06C
	lsls r2, r0, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r5, _0813D070
	lsls r4, r6, 2
	adds r4, r5
	ldr r4, [r4]
	str r4, [sp]
	str r0, [sp, 0x4]
	mov r0, r8
	bl DecompressPicFromTable_2
	ldr r0, _0813D074
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
	ldr r0, _0813D078
	ldr r1, _0813D07C
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
	ldr r1, _0813D080
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
	ldr r2, _0813D09C
	b _0813D0AA
	.align 2, 0
_0813D09C: .4byte 0x00003ff6
_0813D0A0:
	ldr r2, _0813D0A4
	b _0813D0AA
	.align 2, 0
_0813D0A4: .4byte 0x000031df
_0813D0A8:
	ldr r2, _0813D0C0
_0813D0AA:
	ldr r0, _0813D0C4
	movs r1, 0xF1
	lsls r1, 1
	adds r0, r1
	strh r2, [r0]
	ldr r0, _0813D0C8
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
	ldr r2, _0813D1CC
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
	ldr r0, _0813D1D0
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
	ldr r0, _0813D21C
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
	ldr r0, _0813D258
	strh r0, [r7, 0x24]
	movs r0, 0x80
	strh r0, [r7, 0x36]
	ldr r0, _0813D25C
	str r0, [r7, 0x1C]
	b _0813D352
	.align 2, 0
_0813D258: .4byte 0x0000fffc
_0813D25C: .4byte sub_813D368
_0813D260:
	ldrh r1, [r7, 0x36]
	ldr r5, _0813D364
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
	ldr r2, _0813D3FC
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
	ldr r0, _0813D410
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
	ldr r3, _0813D470
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
	ldr r0, _0813D480
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
	ldr r0, _0813D500
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
	ldr r0, _0813D580
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
	ldr r0, _0813D640
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
	ldr r2, _0813D644
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
	ldr r1, _0813D648
	b _0813D654
	.align 2, 0
_0813D640: .4byte gSpriteTemplate_840AE20
_0813D644: .4byte gSprites
_0813D648: .4byte sub_813D208
_0813D64C:
	mov r0, r9
	adds r0, 0x1C
	adds r0, r5, r0
	ldr r1, _0813D774
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
	ldr r0, _0813D778
	mov r1, r10
	mov r2, r8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r5, _0813D77C
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
	ldr r2, _0813D780
	adds r4, r2
	ldr r0, _0813D784
	str r0, [r4]
	ldr r0, _0813D778
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
	ldr r0, _0813D780
	adds r4, r0
	ldr r1, _0813D784
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
	ldr r1, _0813D7A0
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
	ldr r0, _0813D7E0
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0813D87A
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	b _0813D82E
	.align 2, 0
_0813D7E0: .4byte gUnknown_03005ED0
_0813D7E4:
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnimIfDifferent
	ldrh r2, [r4, 0x20]
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	cmp r0, 0x78
	ble _0813D802
	ldr r0, _0813D808
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _0813D83C
_0813D802:
	adds r0, r2, 0x1
	b _0813D82E
	.align 2, 0
_0813D808: .4byte gUnknown_03005ED0
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
	ldr r0, _0813D84C
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
_0813D84C: .4byte gUnknown_03005ED0
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
	ldr r0, _0813D874
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
	ldr r1, _0813D8B0
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
	ldr r1, _0813D904
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
	ldr r2, _0813D930
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
	ldr r7, _0813DA48
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
	ldr r0, _0813DA4C
	adds r2, r0
	ldr r0, _0813DA50
	asrs r2, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0813DA54
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
	ldr r7, _0813DA58
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
	ldr r0, _0813DA5C
	mov r3, r10
	asrs r2, r3, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r6, _0813DA54
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
	ldr r0, _0813DA60
	ldr r3, [sp, 0x4]
	ldr r1, _0813DA4C
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
	ldr r0, _0813DABC
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
	ldr r2, _0813DB60
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
	ldr r1, _0813DBB4
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
	ldr r1, _0813DE90
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
	ldr r4, _0813DEF0
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
	ldr r2, _0813DF28
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
	ldr r6, _0813E094
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
	ldr r1, _0813E098
	adds r0, r1
	ldr r2, _0813E09C
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
	ldr r0, _0813E0A0
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
	ldr r1, _0813E098
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
	ldr r1, _0813E0A4
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
	ldr r3, _0813E0CC
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
	ldr r4, _0813E108
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
	ldr r1, _0813E124
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
	ldr r0, _0813E198
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
	ldr r1, _0813E228
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
	ldr r0, _0813E298
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
	ldr r1, _0813E32C
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
	ldr r2, _0813E418
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
	ldr r2, _0813E4B4
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
	ldr r3, _0813E57C
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
	ldr r7, _0813E5D8
	lsls r6, r0, 16
	lsls r5, r1, 16
_0813E58A:
	ldr r0, _0813E5DC
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
	ldr r0, _0813E5F4
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813E5F8
	adds r0, r3, 0
	bl DestroySprite
	b _0813E6B2
	.align 2, 0
_0813E5F4: .4byte gUnknown_0203931A
_0813E5F8:
	ldr r2, _0813E6B8
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
	ldr r4, _0813E6BC
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
	ldr r0, _0813E6E0
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
	ldr r3, _0813E7B8
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
	ldr r0, _0813E7BC
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
	ldr r0, _0813E7F8
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0813E7F2
	ldr r1, _0813E7FC
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r2, 0
	strh r4, [r0, 0x2E]
	ldr r1, _0813E800
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
	ldr r0, _0813E818
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813E81C
	adds r0, r3, 0
	bl DestroySprite
	b _0813E928
	.align 2, 0
_0813E818: .4byte gUnknown_0203931A
_0813E81C:
	ldr r6, _0813E904
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
	ldr r4, _0813E908
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
	ldr r1, _0813E90C
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
	ldr r7, _0813E978
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r5, r0, r7
_0813E942:
	movs r0, 0x20
	ldrsh r1, [r5, r0]
	movs r0, 0x22
	ldrsh r2, [r5, r0]
	ldr r0, _0813E97C
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
	ldr r0, _0813E994
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813E998
	adds r0, r3, 0
	bl DestroySprite
	b _0813EA50
	.align 2, 0
_0813E994: .4byte gUnknown_0203931A
_0813E998:
	ldr r2, _0813EA58
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
	ldr r2, _0813EA5C
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
	ldr r0, _0813EA7C
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
	ldr r0, _0813EB40
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
	ldr r0, _0813EB44
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
	ldr r2, _0813EB48
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
	ldr r0, _0813EBB0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0813EB80
	ldr r1, _0813EBB4
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
	ldr r5, _0813EBB8
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
	ldr r0, _0813EBD0
	ldrh r0, [r0]
	cmp r0, 0
	beq _0813EBD4
	adds r0, r3, 0
	bl DestroySprite
	b _0813EC80
	.align 2, 0
_0813EBD0: .4byte gUnknown_0203931A
_0813EBD4:
	ldr r2, _0813EC88
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
	ldr r2, _0813EC8C
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
	ldr r0, _0813ECAC
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
	ldr r0, _0813EDB0
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
	ldr r0, _0813EDB4
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
	ldr r1, _0813EDB8
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
	ldr r0, _0813EDF4
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _0813EDEE
	ldr r1, _0813EDF8
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
	ldr r1, _0813EEB0
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

	thumb_func_start sub_813EEB4
sub_813EEB4: @ 813EEB4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	bl SetVBlankCallback
	ldr r2, _0813EED8
	ldr r0, _0813EEDC
	adds r1, r2, r0
	movs r0, 0
	strh r0, [r1]
	str r4, [r2]
	ldr r0, _0813EEE0
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0813EED8: .4byte 0x02000000
_0813EEDC: .4byte 0x00000888
_0813EEE0: .4byte sub_813EEE4
	thumb_func_end sub_813EEB4

	thumb_func_start sub_813EEE4
sub_813EEE4: @ 813EEE4
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
	ldr r0, _0813EF98
	movs r1, 0
	bl sub_80FA8EC
	movs r0, 0
	movs r1, 0
	bl sub_80FBCF0
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80FBB3C
	ldr r4, _0813EF9C
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	ldr r1, _0813EFA0
	movs r2, 0xF8
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0x15
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x3
	bl MenuDrawTextWindow
	ldr r0, _0813EFA4
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
	ldr r0, _0813EFA8
	bl SetMainCallback2
	ldr r0, _0813EFAC
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
_0813EFA8: .4byte sub_813EFC4
_0813EFAC: .4byte sub_813EFB0
	thumb_func_end sub_813EEE4

	thumb_func_start sub_813EFB0
sub_813EFB0: @ 813EFB0
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_813EFB0

	thumb_func_start sub_813EFC4
sub_813EFC4: @ 813EFC4
	push {lr}
	bl sub_813EFDC
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_813EFC4

	thumb_func_start sub_813EFDC
sub_813EFDC: @ 813EFDC
	push {lr}
	sub sp, 0x4
	ldr r1, _0813EFF8
	ldr r2, _0813EFFC
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _0813F0B8
	lsls r0, 2
	ldr r1, _0813F000
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
	ldr r3, _0813F028
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0813F02C
	adds r1, r2, r0
	b _0813F08E
	.align 2, 0
_0813F028: .4byte 0x00001541
_0813F02C: .4byte 0x00000888
_0813F030:
	ldr r0, _0813F044
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813F0B8
	ldr r3, _0813F048
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
	ldr r1, _0813F070
	ldr r0, _0813F074
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
	ldr r1, _0813F098
	ldr r2, _0813F09C
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
	ldr r0, _0813F0C0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0813F0B8
	bl sub_80FAB10
	ldr r0, _0813F0C4
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
	ldr r1, _0813F0F0
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
	ldr r0, _0813F2AC
	ldrb r3, [r0]
	ldr r0, _0813F2B0
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0813F2B4
	strh r1, [r0]
	ldr r1, _0813F2B8
	ldr r2, _0813F2BC
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r4, _0813F2C0
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
	ldr r1, _0813F2C4
	ldr r2, _0813F2C8
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r4, 0x80
	lsls r4, 5
	adds r0, r4, 0
	strh r0, [r1]
	ldr r2, _0813F2CC
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
	ldr r0, _0813F2D0
	adds r3, r0
	ldrb r0, [r3]
	ldr r1, _0813F2D4
	mov r10, r1
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r10
	ldrb r7, [r4, 0x6]
	ldrh r6, [r4, 0x38]
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0813F2D8
	bl object_new_hidden_with_callback
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
	ldr r0, _0813F2D8
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
	ldr r2, _0813F2D8
	str r2, [r6]
	add r4, r10
	str r2, [r4]
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r2, _0813F2DC
	add r0, sp, 0xC
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0813F2E0
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _0813F2E4
	bl LZDecompressVram
	ldr r0, _0813F2E8
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _0813F2EC
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, _0813F2F0
	ldrh r0, [r7, 0x20]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r1]
	ldr r1, _0813F2F4
	ldrh r0, [r7, 0x22]
	negs r0, r0
	subs r0, 0x20
	strh r0, [r1]
	ldr r1, _0813F2F8
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
	ldr r1, _0813F2FC
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
	ldr r0, _0813F34C
	ldrb r0, [r0]
	mov r9, r0
	ldr r1, _0813F350
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0xA]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	movs r3, 0
	strh r1, [r4, 0x22]
	ldr r2, _0813F354
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
	ldr r2, _0813F390
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
	ldr r6, _0813F4C0
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
	ldr r0, _0813F4C4
	strh r5, [r0]
	ldr r0, _0813F4C8
	strh r5, [r0]
	ldr r0, _0813F4CC
	ldr r2, _0813F4D0
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0813F406
	ldr r2, _0813F4D4
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
	ldr r0, _0813F4D8
	strh r5, [r0]
	strh r5, [r6]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0813F4DC
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
	ldr r1, _0813F4E0
	add r0, sp, 0xC
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _0813F4E4
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r2, _0813F4D4
	ldrb r1, [r2, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	ldr r0, _0813F4E8
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
	ldr r1, _0813F5D0
	ldr r0, _0813F5D4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	ldr r7, _0813F5D8
	lsls r6, r0, 4
	adds r6, r0
	lsls r6, 2
	adds r6, r7
	ldrb r0, [r6, 0x6]
	str r0, [sp, 0x4]
	ldrh r4, [r6, 0x38]
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813F5DC
	bl AllocSpritePalette
	mov r8, r0
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	ldr r0, _0813F5E0
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
	ldr r2, _0813F5E4
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
	ldr r1, _0813F684
	ldr r0, _0813F688
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _0813F68C
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
	ldr r0, _0813F690
	bl FreeSpritePaletteByTag
	ldr r0, _0813F694
	bl FreeSpritePaletteByTag
	ldr r0, _0813F698
	bl IndexOfSpritePaletteTag
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0813F69C
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
	ldr r2, _0813F6C0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0813F6C4
	ldrh r0, [r2]
	strh r0, [r1, 0x1C]
	ldrh r0, [r2, 0x2]
	strh r0, [r1, 0x1E]
	ldr r0, _0813F6C8
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
	ldr r1, _0813F718
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
	ldr r0, _0813F71C
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
	ldr r3, _0813F758
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
	ldr r3, _0813F794
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
	ldr r1, _0813F7C4
	ldr r0, _0813F7C8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r5, [r0]
	ldr r1, _0813F7CC
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
	ldr r0, _0813F814
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
	ldr r1, _0813F840
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
	ldr r1, _0813F87C
	ldr r4, _0813F880
	ldrb r0, [r4]
	adds r1, r0, r1
	ldrb r1, [r1]
	mov r9, r1
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0813F88C
	ldr r1, _0813F884
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0813F888
	b _0813F89C
	.align 2, 0
_0813F87C: .4byte gUnknown_02024BE0
_0813F880: .4byte gUnknown_0202F7C8
_0813F884: .4byte gUnknown_02024A6A
_0813F888: .4byte gPlayerParty
_0813F88C:
	ldr r1, _0813F8CC
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0813F8D0
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
	ldr r2, _0813F8D4
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
	ldr r5, _0813F950
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
	ldr r2, _0813F954
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
	ldr r0, _0813F9B4
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
	ldr r0, _0813F9DC
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
	ldr r0, _0813F9F4
	ldrb r0, [r0, 0x8]
	cmp r0, 0x5
	bne _0813FA00
	ldr r1, _0813F9F8
	ldr r0, _0813F9FC
	b _0813FA04
	.align 2, 0
_0813F9F4: .4byte 0x02017840
_0813F9F8: .4byte gUnknown_03004B00
_0813F9FC: .4byte 0x0000ffff
_0813FA00:
	ldr r1, _0813FA10
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
	ldr r1, _0813FA2C
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
	ldr r0, _0813FB58
	ldrh r0, [r0]
	bl ball_number_to_ball_processing_index
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r1, _0813FB5C
	adds r0, r1
	movs r1, 0x20
	movs r2, 0x50
	movs r3, 0x1D
	bl CreateSprite
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _0813FB60
	mov r9, r1
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	adds r6, r4, r1
	movs r0, 0x22
	strh r0, [r6, 0x2E]
	ldr r2, _0813FB64
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
	ldr r0, _0813FB68
	str r0, [r4]
	ldr r3, _0813FB6C
	ldr r1, _0813FB70
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
	ldr r1, _0813FB74
	mov r2, r10
	lsls r0, r2, 2
	add r0, r10
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	ldr r1, _0813FB78
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
	ldr r1, _0813FBAC
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x8]
	ldr r2, _0813FBB0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2E]
	ldr r0, _0813FBB4
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
	ldr r0, _0813FBD8
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
	ldr r0, _0813FC9C
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
	ldr r1, _0813FCA0
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
	ldr r0, _0813FCA4
	mov r9, r0
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	adds r6, r4, r0
	movs r0, 0x22
	strh r0, [r6, 0x2E]
	ldr r1, _0813FCA8
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
	ldr r0, _0813FCAC
	str r0, [r4]
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r1, _0813FCB0
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
	ldr r1, _0813FCB4
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	ldr r1, _0813FCB8
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
	ldr r6, _0813FD1C
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r1, _0813FD20
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
	bl PlaySoundEffect12WithPanning
	ldr r0, _0813FD24
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
	ldr r1, _0813FD28
	str r1, [r0]
	ldr r0, _0813FD2C
	movs r1, 0xA
	bl CreateTask
	ldr r0, _0813FD30
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
	ldr r6, _0813FD88
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r4, _0813FD8C
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
	ldr r0, _0813FDB8
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r0, _0813FDBC
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
	ldr r0, _0813FDE0
	ldrb r0, [r0, 0x8]
	cmp r0, 0x5
	bne _0813FDE8
	ldr r0, _0813FDE4
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
	ldr r0, _0813FE64
	str r0, [r4, 0x1C]
	ldr r0, _0813FE68
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
	ldr r0, _0813FE6C
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
	ldr r0, _0813FEB4
	movs r1, 0x32
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x38]
	ldr r0, _0813FEB8
	str r0, [r4, 0x1C]
	ldr r2, _0813FEBC
	ldr r1, _0813FEC0
	ldr r0, _0813FEC4
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
	ldr r1, _0813FF0C
	ldr r0, _0813FF10
	ldrb r0, [r0]
	adds r0, r1
	ldrb r4, [r0]
	ldrh r0, [r7, 0x38]
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0813FF14
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
	bl PlaySoundEffect
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
	ldr r1, _0813FF60
	movs r0, 0x1C
	str r0, [r1]
	ldr r2, _0813FF64
	ldr r1, _0813FF68
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
	ldr r4, _0813FF6C
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
	ldr r0, _0813FFAC
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
	ldr r0, _0813FFB0
	cmp r1, r0
	ble _08140004
	b _0813FFCE
	.align 2, 0
_0813FFAC: .4byte gSprites
_0813FFB0: .4byte 0x0000047f
_0813FFB4:
	adds r0, r4, 0
	bl sub_8078F40
	ldr r1, _0813FFD8
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
	ldr r0, _0814000C
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
	ldr r0, _08140010
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
	ldr r0, _08140054
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
	ldr r1, _081400B8
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
	bl PlaySoundEffect
	b _0814010E
_081400CA:
	movs r0, 0x39
	bl PlaySoundEffect
	b _0814010E
_081400D2:
	movs r0, 0x3A
	bl PlaySoundEffect
	b _0814010E
_081400DA:
	movs r0, 0x3B
	bl PlaySoundEffect
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
	ldr r0, _08140138
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
	ldr r0, _0814013C
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08140144
	strh r5, [r4, 0x38]
	ldr r0, _08140140
	str r0, [r4, 0x1C]
	b _0814014E
	.align 2, 0
_08140138: .4byte 0xffffff00
_0814013C: .4byte 0x02017840
_08140140: .4byte sub_8140410
_08140144:
	ldr r0, _08140154
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
	ldr r0, _08140198
	strh r5, [r0, 0xC]
	ldr r0, _0814019C
	str r0, [r4, 0x1C]
	movs r0, 0x17
	bl PlaySoundEffect
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
	ldr r1, _081401BC
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
	ldr r0, _081401F8
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
	ldr r0, _08140288
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
	ldr r0, _0814032C
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
	ldr r0, _08140394
	ldrb r0, [r0, 0x8]
	cmp r1, r0
	bne _0814039C
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08140398
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
	ldr r0, _081403AC
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
	ldr r0, _081403F8
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
	bl PlaySoundEffect
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
	ldr r0, _08140430
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
	ldr r1, _08140450
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
	ldr r7, _08140484
	ldrh r0, [r6, 0x36]
	adds r0, 0x1
	strh r0, [r6, 0x36]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0x28
	beq _081404CC
	cmp r1, 0x5F
	bne _08140490
	ldr r0, _08140488
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	bl sub_8043EB4
	bl m4aMPlayAllStop
	ldr r0, _0814048C
	bl PlaySoundEffect
	b _081404CC
	.align 2, 0
_08140484: .4byte gUnknown_0202F7C9
_08140488: .4byte gUnknown_02024E6D
_0814048C: .4byte 0x00000173
_08140490:
	ldr r0, _081404D4
	cmp r1, r0
	bne _081404CC
	ldr r5, _081404D8
	ldr r4, _081404DC
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
	ldr r0, _081404E0
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
	ldr r1, _08140548
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
	ldr r0, _0814054C
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
	ldr r3, _0814057C
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
	ldr r0, _081405BC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _081405B2
	ldr r0, _081405C0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	strh r1, [r4, 0x2E]
	ldr r0, _081405C4
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
	ldr r0, _081405DC
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
	ldr r0, _081406A8
	str r0, [r4, 0x1C]
	ldr r0, _081406AC
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
	ldr r0, _081406B0
	ldrb r1, [r0]
	movs r0, 0x1
	movs r2, 0xE
	adds r3, r5, 0
	bl sub_8141314
_08140646:
	ldr r6, _081406B4
	ldr r5, _081406B8
	ldr r4, _081406B0
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
	ldr r4, _08140708
	ldr r3, _0814070C
	ldr r2, _08140710
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
	ldr r6, _0814079C
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
	ldr r4, _081407A0
	ldr r3, _081407A4
	ldr r2, _081407A8
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
	ldr r0, _081407AC
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
	ldr r0, _081407B0
	str r0, [r7, 0x1C]
	ldr r0, _081407B4
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
	ldr r4, _081407F0
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
	ldr r0, _08140864
	str r0, [r4, 0x1C]
	ldr r1, _08140868
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
	ldr r0, _08140910
	lsls r6, r5, 3
	adds r4, r6, r0
	ldrh r0, [r4, 0x6]
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _08140914
	cmp r0, r1
	bne _081408B6
	adds r0, r4, 0
	bl LoadCompressedObjectPic
	ldr r0, _08140918
	adds r0, r6, r0
	bl LoadCompressedObjectPalette
_081408B6:
	ldr r1, _0814091C
	lsls r0, r5, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08140920
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
	bl PlaySoundEffect
	ldr r0, _08140924
	ldr r1, _08140928
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08140900
	ldr r1, _0814092C
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
	ldr r1, _081409D0
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
	ldr r4, _081409D4
	adds r0, r4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r5, _081409D8
	adds r2, r4, r5
	ldr r0, _081409DC
	add r0, r8
	ldrb r1, [r0]
	adds r0, r2, 0
	str r2, [sp]
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _081409E0
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
	ldr r0, _08140A04
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
	ldr r0, _08140A1C
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
	ldr r1, _08140B24
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
	ldr r3, _08140B28
	mov r8, r3
	ldr r0, _08140B2C
	adds r1, r0
	mov r9, r1
_08140AA8:
	ldr r0, _08140B30
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
	ldr r3, _08140B34
	adds r1, r5, r3
	ldr r0, _08140B38
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
	ldr r0, _08140B28
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
	ldr r1, _08140BFC
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
	ldr r3, _08140C00
	mov r8, r3
	ldr r0, _08140C04
	adds r1, r0
	mov r9, r1
_08140B80:
	ldr r0, _08140C08
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
	ldr r3, _08140C0C
	adds r1, r5, r3
	ldr r0, _08140C10
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
	ldr r0, _08140C00
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
	ldr r1, _08140CD0
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
	ldr r3, _08140CD4
	mov r8, r3
	ldr r0, _08140CD8
	adds r1, r0
	mov r9, r1
_08140C58:
	ldr r0, _08140CDC
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
	ldr r3, _08140CE0
	adds r1, r5, r3
	ldr r0, _08140CE4
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
	ldr r0, _08140CD4
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
	ldr r1, _08140DAC
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
	ldr r3, _08140DB0
	mov r8, r3
	ldr r0, _08140DB4
	adds r1, r0
	mov r9, r1
_08140D2C:
	ldr r0, _08140DB8
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
	ldr r3, _08140DBC
	adds r1, r5, r3
	ldr r0, _08140DC0
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
	ldr r0, _08140DB0
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
	ldr r1, _08140DF0
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
	ldr r3, _08140EB4
	mov r8, r3
	ldr r1, _08140EB8
	adds r0, r1
	mov r9, r0
_08140E20:
	ldr r0, _08140EBC
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
	ldr r0, _08140EC0
	adds r1, r5, r0
	ldr r0, _08140EC4
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
	ldr r0, _08140EC8
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
	ldr r0, _08140EB4
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
	ldr r1, _08140FE0
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
	ldr r3, _08140FE4
	mov r8, r3
	ldr r0, _08140FE8
	adds r1, r0
	mov r9, r1
_08140F68:
	ldr r0, _08140FEC
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
	ldr r3, _08140FF0
	adds r1, r5, r3
	ldr r0, _08140FF4
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
	ldr r0, _08140FE4
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
	ldr r1, _08141104
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
	ldr r0, _08141108
	adds r1, r0
	mov r10, r1
_0814109E:
	movs r7, 0
	movs r1, 0x1
	add r1, r8
	mov r9, r1
_081410A6:
	ldr r0, _0814110C
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
	ldr r3, _08141110
	adds r5, r4, r3
	mov r0, r10
	ldrb r1, [r0]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r1, _08141114
	adds r4, r1
	ldr r0, _08141118
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
	ldr r0, _08141160
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
	ldr r1, _08141218
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
	ldr r3, _0814121C
	mov r8, r3
	ldr r0, _08141220
	adds r1, r0
	mov r9, r1
_081411A8:
	ldr r0, _08141224
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
	ldr r3, _08141228
	adds r1, r5, r3
	ldr r0, _0814122C
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
	ldr r0, _0814121C
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
	ldr r0, _081412B8
	ldr r1, _081412BC
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
	ldr r1, _081412FC
	ldrb r0, [r1, 0xA]
	subs r0, 0x1
	strb r0, [r1, 0xA]
	lsls r0, 24
	cmp r0, 0
	bne _081412F2
	movs r7, 0
	ldr r6, _08141300
	ldr r4, _08141304
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
	ldr r0, _08141378
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _0814137C
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
	ldr r2, _08141380
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
	ldr r2, _081413CC
	lsls r1, r7, 1
	adds r1, r2
	ldrh r3, [r1]
	movs r1, 0x10
	movs r2, 0x10
	bl BlendPalette
	movs r0, 0x10
	strh r0, [r5, 0x8]
	ldr r0, _081413D0
	strh r0, [r5, 0xA]
	ldr r0, _081413D4
	str r0, [r5]
_081413AA:
	ldr r0, _081413D8
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
	ldr r1, _0814142C
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
	ldr r3, _08141430
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
	ldr r0, _08141464
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0814145C
	ldrh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	lsls r1, 16
	orrs r0, r1
	ldr r1, _08141468
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
	ldr r0, _081414AC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081414A4
	ldr r0, _081414B0
	lsls r4, r2, 2
	adds r4, r2
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	lsls r1, 16
	orrs r0, r1
	ldr r1, _081414B4
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _081414B8
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
	ldr r1, _08141508
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
	ldr r3, _0814150C
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
	ldr r0, _08141550
	ldr r3, _08141554
	ldrb r2, [r3]
	adds r0, r2, r0
	ldrb r6, [r0]
	ldr r1, _08141558
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
	ldr r0, _0814159C
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
	ldr r2, _081415A0
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
	ldr r3, _081415EC
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
	ldr r1, _081415F0
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
	ldr r0, _08141638
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
	ldr r0, _08141688
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
	ldr r1, _0814168C
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x8]
	strh r1, [r0, 0x8]
	ldr r0, _08141690
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08141694
	ldr r0, _08141688
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
	ldr r0, _081416C0
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
	ldr r1, _081416E8
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
	ldr r0, _08141708
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08141714
	ldr r1, _0814170C
	ldr r2, _08141710
	b _08141718
	.align 2, 0
_08141708: .4byte gUnknown_0202F7C8
_0814170C: .4byte REG_BLDCNT
_08141710: .4byte 0x00003f42
_08141714:
	ldr r1, _08141734
	ldr r2, _08141738
_08141718:
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0814173C
	movs r0, 0x10
	strh r0, [r1]
	ldr r1, _08141740
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
	ldr r3, _08141778
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
	ldr r1, _081417C0
	ldr r3, _081417C4
	ldrb r0, [r3]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _081417C8
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldr r1, _081417CC
	adds r0, r1
	movs r1, 0
	str r1, [sp]
	ldr r1, _081417D0
	mov r2, sp
	str r2, [r1]
	str r0, [r1, 0x4]
	ldr r0, _081417D4
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
	ldr r3, _081417FC
	ldr r1, _08141800
	ldrb r1, [r1]
	lsls r1, 2
	ldr r2, _08141804
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
	ldr r2, _08141820
	ldr r1, _08141824
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
	ldr r1, _081418E0
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
	ldr r7, _081418E4
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
	ldr r0, _081418E8
	bl GetSpriteTileStartByTag
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r7
	bne _081418A2
	ldr r0, _081418EC
	bl LoadCompressedObjectPic
	ldr r0, _081418F0
	bl LoadCompressedObjectPalette
_081418A2:
	ldr r5, _081418F4
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
	ldr r3, _081418F8
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
	ldr r1, _08141918
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
	ldr r1, _08141944
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
	ldr r0, _08141998
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
	ldr r0, _0814199C
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
	ldr r0, _081419CC
	adds r1, r5, 0
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _081419D0
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
	ldr r0, _08141A2C
	adds r1, r5, 0
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08141A30
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	adds r2, r0
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x5
_081419F4:
	ldr r4, _08141A34
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _08141A38
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
_08141A02:
	ldr r2, _08141A3C
	lsls r1, r7, 2
	adds r0, r1, r7
	lsls r0, 3
	adds r6, r0, r2
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	mov r9, r1
	cmp r0, 0
	bne _08141A44
	ldr r1, _08141A30
	lsls r2, r5, 4
	adds r0, r2, r5
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08141A40
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
	ldr r3, _08141AC4
	lsls r4, r5, 4
	adds r1, r4, r5
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _08141AC8
	str r2, [r0]
	adds r1, r3
	ldr r0, _08141ACC
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
	bl PlaySoundEffect12WithPanning
_08141A8C:
	ldr r1, _08141AC4
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	strh r7, [r0, 0x2E]
	ldr r1, _08141AD0
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
	ldr r0, _08141AD4
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
	ldr r1, _08141B18
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
	ldr r1, _08141B1C
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
	ldr r2, _08141B70
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
	ldr r2, _08141BD0
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
	ldr r0, _08141BFC
	bl LoadCompressedObjectPic
	ldr r0, _08141C00
	bl LoadCompressedObjectPalette
	ldr r0, _08141C04
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
	ldr r5, _08141C2C
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
	ldr r5, _08141CA4
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
	ldr r0, _08141CA8
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r1, _08141CAC
	ldr r0, _08141CB0
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08141CB4
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _08141CB8
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
	ldr r2, _08141CE4
	ldr r1, _08141CE8
	ldr r0, _08141CEC
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
	ldr r0, _08141CF0
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
	ldr r0, _08141D1C
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
	ldr r5, _08141D70
	ldr r3, _08141D74
	ldr r2, _08141D78
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
	ldr r1, _08141DA4
	strb r0, [r1]
	movs r0, 0x1
	bl battle_get_side_with_given_state
	ldr r1, _08141DA8
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
	ldr r0, _08141DC0
	ldrh r1, [r0]
	cmp r1, 0x53
	bne _08141DC8
	ldr r1, _08141DC4
	movs r0, 0x1
	b _08141E00
	.align 2, 0
_08141DC0: .4byte 0x02017840
_08141DC4: .4byte gUnknown_03004B00
_08141DC8:
	cmp r1, 0xFA
	bne _08141DD8
	ldr r1, _08141DD4
	movs r0, 0x2
	b _08141E00
	.align 2, 0
_08141DD4: .4byte gUnknown_03004B00
_08141DD8:
	cmp r1, 0x80
	bne _08141DE8
	ldr r1, _08141DE4
	movs r0, 0x3
	b _08141E00
	.align 2, 0
_08141DE4: .4byte gUnknown_03004B00
_08141DE8:
	movs r0, 0xA4
	lsls r0, 1
	cmp r1, r0
	bne _08141DFC
	ldr r1, _08141DF8
	movs r0, 0x4
	b _08141E00
	.align 2, 0
_08141DF8: .4byte gUnknown_03004B00
_08141DFC:
	ldr r1, _08141E0C
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
	ldr r2, _08141E2C
	ldr r1, _08141E30
	ldrh r1, [r1]
	strb r1, [r2]
	ldr r2, _08141E34
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
	ldr r0, _08141E80
	ldr r1, _08141E84
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _08141EA0
	lsls r0, 2
	ldr r1, _08141E88
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
	ldr r0, _08141EB8
	ldr r2, _08141EBC
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
	ldr r0, _08141F04
	bl SetVBlankCallback
	ldr r3, _08141F08
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _08141F0C
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08141F10
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08141F14
	ldr r2, _08141F18
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
	ldr r1, _08141F48
	ldr r2, _08141F4C
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
	ldr r1, _08141F50
	ldr r0, _08141F54
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
	ldr r0, _08141F7C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08141F84
	ldr r0, _08141F80
	bl SetMainCallback2
	movs r0, 0xDA
	lsls r0, 1
	bl PlayBkgndMusic
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
	ldr r0, _08141FBC
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08141FC0
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
	ldr r0, _08141FF0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08141FF4
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
	ldr r0, _081420C8
	mov r9, r0
	ldr r1, _081420CC
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	movs r7, 0
	ldr r4, _081420D0
	mov r10, r4
_08142024:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _081420D4
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
	ldr r2, _081420D8
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
	ldr r0, _081420CC
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
	ldr r0, _08142158
	movs r3, 0
	str r3, [r0]
	ldr r4, _0814215C
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
	ldr r0, _08142160
	b _08142166
	.align 2, 0
_08142158: .4byte gUnknown_0203931C
_0814215C: .4byte gTasks
_08142160: .4byte sub_81422E8
_08142164:
	ldr r0, _08142178
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
	ldr r0, _081421C4
	mov r9, r0
	movs r7, 0x80
	lsls r7, 6
	add r7, r9
	ldr r0, _081421C8
	ldrb r0, [r0]
	cmp r0, 0
	bne _081421D4
	movs r4, 0
	mov r0, r8
	lsls r0, 2
	mov r10, r0
	ldr r5, _081421CC
	add r5, r9
	movs r3, 0xF0
	lsls r3, 9
	movs r2, 0
	ldr r1, _081421D0
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
	ldr r2, _081421E8
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
	ldr r5, _08142264
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
	ldr r0, _08142268
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _0814226C
	mov r0, r10
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _08142270
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
	ldr r1, _081422A8
	ldr r0, _081422AC
	str r0, [r1]
	movs r0, 0x3
	bl sub_8125D44
	movs r0, 0x37
	bl PlaySoundEffect
	ldr r1, _081422B0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081422B4
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
	ldr r2, _081422D8
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
	ldr r0, _081422E4
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
	ldr r5, _08142314
	adds r0, r5, 0
	bl SetUpWindowConfig
	adds r0, r5, 0
	bl InitMenuWindow
	ldr r1, _08142318
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0814231C
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
	ldr r2, _08142350
	ldr r0, _08142354
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
	ldr r1, _08142358
	b _0814235E
	.align 2, 0
_08142350: .4byte 0x0201c000
_08142354: .4byte gTasks
_08142358: .4byte gUnknown_0840B534
_0814235C:
	ldr r1, _081423F0
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
	ldr r3, _081423F4
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
	ldr r2, _081423F8
	str r2, [r1]
	ldr r5, _081423FC
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
	ldr r0, _08142400
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
	ldr r4, _08142470
	ldr r3, _08142474
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r5, r2, r3
	ldrh r1, [r5, 0xA]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r6, r0, r4
	ldr r4, _08142478
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
	ldr r0, _0814247C
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
	ldr r0, _08142480
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
	ldr r2, _081424BC
	ldr r1, _081424C0
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
	ldr r2, _0814253C
	ldr r0, _08142540
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
	ldr r0, _08142544
	ands r0, r1
	cmp r0, 0
	beq _08142550
	adds r0, r2, 0x1
	strh r0, [r4, 0xA]
	ldr r0, _08142548
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
	ldr r0, _0814254C
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
	ldr r1, _0814256C
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
	ldr r0, _08142604
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r3, 0
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r5, r0, 3
	ldr r0, _08142608
	mov r12, r0
	mov r8, r1
	ldr r6, _0814260C
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
	bl PlaySoundEffect
	ldr r1, _08142610
	mov r2, r8
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0xC8
	lsls r1, 1
	strh r1, [r0, 0xE]
	ldr r1, _08142614
	str r1, [r0]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08142604: .4byte 0xffff0000
_08142608: .4byte gUnknown_03004B28
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
	ldr r7, _08142658
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
	ldr r0, _081426E4
	mov r10, r0
	adds r4, r5, 0
	adds r7, 0x8
	mov r8, r7
	ldr r7, _081426E8
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
	ldr r1, _081426EC
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
	ldr r1, _081426F0
	mov r2, r9
	adds r0, r2, r6
	lsls r0, 3
	adds r0, r1
	movs r1, 0x7
	strh r1, [r0, 0xE]
	ldr r1, _081426F4
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
	ldr r2, _08142718
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r2
	ldrh r1, [r2, 0xE]
	movs r3, 0xE
	ldrsh r0, [r2, r3]
	cmp r0, 0xF
	ble _08142720
	ldr r0, _0814271C
	str r0, [r2]
	b _0814272E
	.align 2, 0
_08142718: .4byte gTasks
_0814271C: .4byte sub_8142738
_08142720:
	adds r0, r1, 0x1
	strh r0, [r2, 0xE]
	ldr r1, _08142734
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
	ldr r4, _08142784
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r0, _08142788
	ldrb r0, [r0, 0x8]
	movs r1, 0x78
	movs r2, 0x48
	movs r3, 0x6
	bl sub_81437A4
	ldr r2, _0814278C
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r2
	strh r0, [r1, 0x10]
	movs r0, 0x78
	strh r0, [r1, 0xE]
	ldr r0, _08142790
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
	ldr r2, _081427B4
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
	ldr r2, _081427D8
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
	ldr r0, _08142810
	movs r1, 0x4
	movs r2, 0xF
	bl MenuPrint
	ldr r0, _08142814
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
	ldr r0, _08142844
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0814283E
	movs r0, 0x4
	bl FadeOutBkgndMusic
	ldr r0, _08142848
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0814284C
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
	ldr r0, _08142890
	ldr r1, _08142894
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
	ldr r1, _08142898
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0814289C
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
	ldr r0, _081428C4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081428BE
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _081428C8
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
	ldr r0, _081428E4
	ldr r1, _081428E8
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _08142908
	lsls r0, 2
	ldr r1, _081428EC
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
	ldr r0, _08142920
	ldr r2, _08142924
	adds r0, r2
	movs r1, 0x1
	strb r1, [r0]
	b _08142A12
	.align 2, 0
_08142920: .4byte gMain
_08142924: .4byte 0x0000043c
_08142928:
	bl sub_8143570
	ldr r1, _08142934
	ldr r3, _08142938
	adds r1, r3
	b _081429DC
	.align 2, 0
_08142934: .4byte gMain
_08142938: .4byte 0x0000043c
_0814293C:
	ldr r0, _08142968
	bl SetVBlankCallback
	ldr r3, _0814296C
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _08142970
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08142974
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08142978
	ldr r4, _0814297C
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
	ldr r0, _081429AC
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl sub_81435B8
	ldr r0, _081429B0
	adds r2, r0, 0
	ldr r1, _081429B4
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	ldm r1!, {r3,r5}
	stm r2!, {r3,r5}
	bl sub_80C5CD4
	ldr r1, _081429B8
	ldr r4, _081429BC
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
	ldr r1, _081429E4
	ldr r5, _081429E8
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
	ldr r1, _08142A18
	ldr r2, _08142A1C
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
	ldr r0, _08142A20
	movs r1, 0
	bl CreateTask
	ldr r0, _08142A24
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
	ldr r0, _08142A4C
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _08142A50
	str r0, [r1]
	b _08142AEA
	.align 2, 0
_08142A4C: .4byte gTasks
_08142A50: .4byte sub_8142FEC
_08142A54:
	ldr r2, _08142A8C
	movs r3, 0
	ldrh r1, [r2, 0x8]
	ldr r4, _08142A90
	adds r0, r4, 0
	ands r0, r1
	ldr r7, _08142A94
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
	ldr r2, _08142AF0
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r2
	strh r0, [r1, 0xA]
	movs r3, 0
	ldr r7, _08142AF4
	ldr r4, _08142AF8
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
	ldr r4, _08142AFC
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r1, _08142AF0
	adds r0, r6, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08142B00
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
	ldr r3, _08142BB8
	movs r5, 0
	ldr r1, _08142BBC
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r6, r1, 0
	ldr r2, _08142BC0
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
	ldr r6, _08142BC4
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
	ldr r1, _08142BBC
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r7, r0, 3
	adds r6, r7, r1
	str r6, [sp, 0x8]
	adds r1, 0x8
	mov r9, r1
	ldr r0, _08142BC8
	mov r10, r0
_08142B8E:
	ldrh r1, [r4, 0x8]
	ldr r2, _08142BC4
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
	ldr r0, _08142BCC
	adds r0, 0x4
	adds r0, r1, r0
	ldrh r3, [r0]
	ldr r0, _08142BD0
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
	ldr r2, _08142C28
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
	ldr r2, _08142C2C
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
	ldr r0, _08142CB0
	ldr r2, _08142CB4
	movs r1, 0xC
	bl BlendPalettes
	ldr r3, _08142CB8
	ldr r1, _08142CBC
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
	ldr r0, _08142CC0
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
	ldr r0, _08142CB8
	movs r1, 0
	movs r2, 0
	bl MenuPrint
	ldr r0, _08142CC4
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
	ldr r0, _08142DD0
	mov r8, r0
	movs r3, 0
	ldr r1, _08142DD4
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
	ldr r1, _08142DD8
	mov r10, r1
	ldr r2, _08142DDC
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
	ldr r2, _08142DD4
	adds r5, r1, r2
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	adds r0, 0x5
	lsls r0, 1
	adds r0, r1
	ldr r1, _08142DD4
	adds r1, 0x8
	adds r0, r1
	ldrh r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08142DDC
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
	ldr r1, _08142DE0
	eors r0, r1
	ldr r2, _08142DE4
	str r0, [r2]
	ldr r2, _08142DE8
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
	ldr r0, _08142DEC
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
	ldr r0, _08142DF0
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
_08142DD8: .4byte gUnknown_03004B28
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
	ldr r1, _08142E88
	ldrh r2, [r1, 0x2E]
	movs r0, 0x1
	ands r0, r2
	adds r3, r1, 0
	cmp r0, 0
	beq _08142EC4
	ldr r7, _08142E8C
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
	ldr r0, _08142E90
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
	ldr r0, _08142E8C
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
	ldr r0, _08142E94
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
	ldr r0, _08142EB8
	ldr r1, _08142EBC
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
_08142EB2:
	ldr r0, _08142EC0
	str r0, [r4]
	b _08142F64
	.align 2, 0
_08142EB8: .4byte gMPlay_BkgndMusic
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
	ldr r0, _08142EF8
	ldr r1, _08142EFC
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
_08142EE6:
	ldr r0, _08142F00
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _08142F04
	str r0, [r1]
	b _08142F64
	.align 2, 0
_08142EF8: .4byte gMPlay_BkgndMusic
_08142EFC: .4byte 0x0000ffff
_08142F00: .4byte gTasks
_08142F04: .4byte sub_8142F78
_08142F08:
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	beq _08142F38
	ldr r0, _08142F30
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
	ldr r0, _08142F34
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
	ldr r1, _08142F70
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
	ldr r0, _08142F74
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
	ldr r0, _08142FB4
	ldr r1, _08142FB8
	movs r2, 0x80
	lsls r2, 2
	bl CpuSet
	ldr r0, _08142FBC
	adds r2, r0, 0
	ldr r1, _08142FC0
	ldm r1!, {r3,r5,r6}
	stm r2!, {r3,r5,r6}
	ldm r1!, {r3,r5}
	stm r2!, {r3,r5}
	bl sub_80C5E38
	ldr r1, _08142FC4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08142FC8
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
	bl sub_810D62C
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
	ldr r0, _08143020
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r1, _08143024
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08143028
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
	ldr r0, _0814305C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08143056
	ldr r0, _08143060
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08143064
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
	ldr r0, _08143084
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
	ldr r7, _08143188
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
	ldr r0, _0814318C
	ands r0, r2
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _081430EA
	lsls r0, r2, 23
	lsrs r0, 23
	bl sub_80406D8
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _08143190
	cmp r6, r0
	beq _081430EA
	ldr r1, _08143194
	adds r0, r7, 0
	bl StringCopy
	adds r7, r0, 0
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
_081430EA:
	ldr r5, _08143188
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
	ldr r1, _0814318C
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
	ldr r0, _08143188
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
	ldr r2, _08143238
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
	ldr r1, _0814323C
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
	ldr r5, _081432F4
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
	ldr r1, _081432F8
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
	ldr r1, _081432FC
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
	ldr r0, _081433CC
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
	ldr r0, _081433D0
	mov r10, r0
	movs r1, 0xE
	add r8, r1
	mov r2, r8
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	mov r1, r8
	adds r2, r4, 0
	bl sub_8072B4C
	ldr r0, _081433D4
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
	ldr r2, _081433D8
	mov r9, r2
	mov r0, r9
	movs r2, 0x2
	movs r3, 0x5
	bl ConvertIntToDecimalStringN
	mov r0, r9
	mov r1, r8
	adds r2, r4, 0
	bl sub_8072B4C
	ldr r0, _081433DC
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
	bl sub_8072B4C
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
	ldr r1, _0814354C
	mov r9, r1
	mov r2, sp
	movs r6, 0
	ldr r1, _08143550
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08143554
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
	ldr r2, _08143550
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
	ldr r3, _08143558
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
	ldr r5, _0814355C
	ldr r3, _08143560
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
	ldr r4, _08143564
	movs r3, 0x2
	ldr r2, _08143568
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
	ldr r1, _08143550
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08143554
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
	ldr r0, _0814356C
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
	ldr r1, _081435A8
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _081435AC
	bl LoadCompressedObjectPic
	ldr r0, _081435B0
	bl LoadCompressedObjectPalette
	ldr r4, _081435B4
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
	ldr r1, _081435D8
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
	ldr r0, _08143640
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
	ldr r4, _08143670
	adds r3, r4, 0
	ldr r2, _08143674
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	strh r0, [r4, 0x2]
	ldr r0, _08143678
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	str r0, [r4, 0xC]
	ldr r0, _0814367C
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
	ldr r4, _081436AC
	adds r3, r4, 0
	ldr r2, _081436B0
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	ldm r2!, {r5-r7}
	stm r3!, {r5-r7}
	strh r0, [r4, 0x2]
	ldr r0, _081436B4
	lsrs r1, 22
	adds r1, r0
	ldr r0, [r1]
	str r0, [r4, 0xC]
	ldr r0, _081436B8
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
	ldr r1, _08143790
	adds r0, r1
	ldr r1, _08143794
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08143798
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
	ldr r0, _0814379C
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
	ldr r1, _081437A0
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
	ldr r1, _08143854
	mov r8, r1
	add r8, r7
	ldr r1, _08143858
	lsls r2, r0, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r5, _0814385C
	lsls r4, r6, 2
	adds r4, r5
	ldr r4, [r4]
	str r4, [sp]
	str r0, [sp, 0x4]
	mov r0, r8
	bl DecompressPicFromTable_2
	ldr r0, _08143860
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
	ldr r0, _08143864
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
	ldr r1, _08143868
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
	ldr r1, _081438C0
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
	ldr r0, _08143934
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
	ldr r0, _08143938
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
	ldr r0, _081439B8
	ldrh r1, [r0, 0x2C]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081439B2
	ldr r0, _081439BC
	ldrb r0, [r0]
	cmp r0, 0
	beq _081439B2
	ldr r2, _081439C0
	ldr r0, _081439C4
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _081439C8
	cmp r1, r0
	bne _081439B2
	bl sub_8143948
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r1, _081439CC
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
	ldr r0, _08143AF0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _08143AF4
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
	ldr r6, _08143AF4
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
	ldr r4, _08143AF8
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r0, _08143AFC
	movs r1, 0x80
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _08143B00
	ldr r1, _08143B04
	movs r2, 0x20
	bl CpuSet
	ldr r1, _08143B08
	ldr r2, _08143B0C
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08143B10
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
	ldr r3, _08143B14
	ldrh r2, [r3]
	mov r0, r8
	strh r0, [r3]
	ldr r4, _08143B18
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08143B1C
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08143B20
	bl SetVBlankCallback
	ldr r0, _08143B24
	bl m4aSongNumStart
	ldr r0, _08143B28
	bl SetMainCallback2
	ldr r0, _08143B2C
	mov r1, r9
	strb r1, [r0]
	ldr r4, _08143B30
	bl sub_81458DC
	adds r0, r4, 0
	adds r0, 0x88
	mov r2, r8
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	ldr r0, _08143B34
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
	ldr r0, _08143B5C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08143B58
	ldr r0, _08143B60
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _08143B64
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
	ldr r2, _08143B9C
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
	ldr r0, _08143BA0
	b _08143BEE
	.align 2, 0
_08143B9C: .4byte gTasks
_08143BA0: .4byte sub_8143EBC
_08143BA4:
	ldr r0, _08143BCC
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
	ldr r0, _08143BD0
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
	ldr r0, _08143BF8
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
	ldr r0, _08143C34
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
	ldr r1, _08143C38
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08143C3C
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
	ldr r1, _08143CA8
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
	ldr r3, _08143CAC
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _08143CB0
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08143CB4
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08143CB8
	bl SetVBlankCallback
	ldr r0, _08143CBC
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
	ldr r0, _08143CF8
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
	ldr r1, _08143CFC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08143D00
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
	ldr r0, _08143DC8
	ldr r1, _08143DCC
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
	ldr r1, _08143DD0
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _08143DD4
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08143DD8
	ldr r1, _08143DDC
	bl LZ77UnCompVram
	ldr r0, _08143DE0
	movs r1, 0x1
	movs r2, 0x3E
	bl LoadPalette
	movs r1, 0
	ldr r4, _08143DE4
	movs r3, 0x11
	ldr r2, _08143DE8
_08143D56:
	adds r0, r1, r4
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bls _08143D56
	movs r1, 0
	ldr r2, _08143DEC
	ldr r6, _08143DF0
	ldr r0, _08143DF4
	adds r5, r2, r0
	movs r4, 0x22
	ldr r3, _08143DE8
_08143D72:
	adds r0, r1, r5
	strb r4, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r3
	bls _08143D72
	movs r1, 0
	ldr r5, _08143DF8
	movs r4, 0x33
	ldr r3, _08143DE8
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
	ldr r1, _08143DFC
	adds r0, r1, 0
	strh r0, [r2, 0x2]
	ldr r1, _08143E00
	adds r0, r1, 0
	strh r0, [r2, 0x4]
	ldr r1, _08143E04
	adds r0, r1, 0
	strh r0, [r2, 0x6]
	adds r0, r6, 0
	bl LoadSpriteSheet
	ldr r0, _08143E08
	bl LoadSpritePalette
	ldr r1, _08143DC8
	ldr r2, _08143DCC
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
	ldr r0, _08143EA0
	movs r1, 0
	bl CreateTask
	ldr r2, _08143EA4
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
	ldr r0, _08143EA8
	strh r5, [r0]
	ldr r1, _08143EAC
	movs r0, 0x20
	strh r0, [r1]
	subs r1, 0x10
	ldr r2, _08143EB0
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
	ldr r0, _08143EB4
	strh r5, [r0]
	ldr r0, _08143EB8
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
	ldr r2, _08143EE0
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
	ldr r0, _08143F00
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
	ldr r0, _08143F30
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08143F2A
	adds r0, r4, 0
	bl sub_81450AC
	ldr r0, _08143F34
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08143F38
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
	ldr r1, _08143FC4
	movs r2, 0xE0
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	ldr r3, _08143FC8
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _08143FCC
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08143FD0
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
	ldr r1, _08143FD4
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r0, 0x8]
	ldr r1, _08143FD8
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
	ldr r2, _08144000
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
	ldr r0, _08144020
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
	ldr r0, _08144074
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
	ldr r1, _08144078
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0xE1
	lsls r1, 5
	strh r1, [r0, 0x8]
	ldr r1, _0814407C
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
	ldr r0, _081440CC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08144104
	ldr r1, _081440D0
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _081440AE
	ldr r0, _081440D4
	ldrh r0, [r0, 0x2E]
	cmp r0, 0
	beq _081440E0
_081440AE:
	movs r0, 0x4
	bl FadeOutBkgndMusic
	movs r0, 0x1
	negs r0, r0
	ldr r1, _081440D8
	str r1, [sp]
	movs r1, 0x8
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _081440DC
	str r0, [r4]
	b _08144104
	.align 2, 0
_081440CC: .4byte gPaletteFade
_081440D0: .4byte gTasks
_081440D4: .4byte gMain
_081440D8: .4byte 0x0000ffff
_081440DC: .4byte sub_8144114
_081440E0:
	ldr r0, _0814410C
	cmp r1, r0
	bne _081440EC
	movs r0, 0x8
	bl FadeOutBkgndMusic
_081440EC:
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	ldr r0, _08144110
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
	ldr r0, _0814412C
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
	ldr r1, _081441A4
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _081441A8
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0
	str r2, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _081441AC
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, sp
	strh r2, [r0]
	str r0, [r1]
	ldr r0, _081441B0
	str r0, [r1, 0x4]
	ldr r0, _081441B4
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
	ldr r1, _081441E4
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
	ldr r1, _081441E8
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
	ldr r0, _08144250
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
	ldr r0, _08144254
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
	ldr r0, _08144320
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
	ldr r0, _08144324
	mov r8, r2
	cmp r1, r0
	bne _08144352
	movs r1, 0xC
	ldrsh r0, [r3, r1]
	cmp r0, 0x33
	bgt _0814434C
	movs r4, 0
	ldr r7, _08144328
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
	ldr r3, _0814432C
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
	ldr r1, _08144330
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
	ldr r1, _08144348
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
	ldr r0, _08144388
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
	ldr r1, _081443DC
	b _081443E6
	.align 2, 0
_081443DC: .4byte 0x0000328d
_081443E0:
	movs r0, 0xC0
	lsls r0, 2
	ldr r1, _081443F4
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
	ldr r0, _08144420
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
	ldr r0, _08144424
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
	ldr r4, _08144508
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
	ldr r6, _08144548
	ldr r3, _0814454C
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
	ldr r0, _081445EC
	cmp r1, r0
	bne _08144658
	adds r7, r6, 0
	adds r7, 0x8C
	ldrh r0, [r7]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	ldr r4, _081445F0
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
	ldr r1, _081445F4
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
	ldr r1, _08144620
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
	ldr r0, _08144640
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
	ldr r1, _0814468C
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
	ldr r1, _08144690
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
	ldr r1, _08144780
	strh r0, [r1]
	b _081447A8
	.align 2, 0
_08144780: .4byte gUnknown_0203935A
_08144784:
	ldr r7, _081447B0
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
	ldr r3, _081447D4
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
	ldr r3, _08144828
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
	ldr r1, _08144878
	strh r0, [r1]
	b _0814492C
	.align 2, 0
_08144878: .4byte gUnknown_0203935A
_0814487C:
	ldr r2, _08144898
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
	ldr r3, _081448C4
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
	ldr r3, _081448E8
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
	ldr r3, _0814491C
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
	ldr r1, _08144958
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
	ldr r1, _0814495C
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
	ldr r5, _081449C0
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
	ldr r5, _08144A08
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
	ldr r5, _08144A48
	cmp r1, r5
	beq _08144A54
	ldr r0, _08144A4C
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
	ldr r1, _08144A88
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
	ldr r5, _08144B40
	ldr r0, _08144B44
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
	ldr r5, _08144BEC
	ldr r0, _08144BF0
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
	ldr r5, _08144C98
	ldr r0, _08144C9C
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
	ldr r5, _08144D44
	ldr r0, _08144D48
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
	ldr r1, _08144D4C
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
	ldr r5, _08144EBC
	ldr r0, _08144EC0
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
	ldr r0, _08144EC4
	movs r1, 0
	bl CreateTask
	ldr r6, _08144EC0
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
	ldr r0, _08144EC8
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
	ldr r0, _08144F28
	ldr r1, _08144F2C
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
	ldr r2, _08144F30
	movs r0, 0x8
	strh r0, [r2]
	ldr r0, _08144F34
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
	ldr r1, _08144F54
	movs r0, 0x22
	strh r0, [r1]
	ldr r1, _08144F58
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
	ldr r0, _08144FBC
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _08144FE0
	ldr r0, _08144FC0
	bl LoadCompressedObjectPic
	ldr r0, _08144FC4
	bl LoadCompressedObjectPic
	ldr r0, _08144FC8
	bl LoadCompressedObjectPic
	ldr r0, _08144FCC
	bl LoadSpritePalettes
	movs r0, 0x78
	movs r1, 0x2E
	bl sub_8149310
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08144FD0
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	strh r2, [r4, 0x12]
	ldr r6, _08144FD4
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r6, 0
	adds r5, 0x1C
	adds r2, r0, r5
	ldr r1, _08144FD8
	str r1, [r2]
	adds r6, 0x8
	adds r0, r6
	ldr r1, _08144FDC
	str r1, [r0]
	movs r0, 0x88
	lsls r0, 1
	movs r1, 0x2E
	bl sub_8149368
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
	ldr r0, _0814505C
	bl LoadCompressedObjectPic
	ldr r0, _08145060
	bl LoadCompressedObjectPic
	ldr r0, _08145064
	bl LoadCompressedObjectPic
	ldr r0, _08145068
	bl LoadSpritePalettes
	movs r0, 0x78
	movs r1, 0x2E
	bl sub_8149368
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0814506C
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	strh r2, [r4, 0x12]
	ldr r6, _08145070
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r6, 0
	adds r5, 0x1C
	adds r2, r0, r5
	ldr r1, _08145074
	str r1, [r2]
	adds r6, 0x8
	adds r0, r6
	ldr r1, _08145078
	str r1, [r0]
	movs r0, 0x88
	lsls r0, 1
	movs r1, 0x2E
	bl sub_8149310
_08145034:
	lsls r0, 24
	lsrs r2, r0, 24
	strh r2, [r4, 0x14]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r0, r5
	ldr r1, _0814507C
	str r1, [r5]
	adds r0, r6
	ldr r1, _08145080
	str r1, [r0]
	ldr r1, _08145084
	ldr r0, _08145088
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
	ldr r2, _08145120
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
	ldr r1, _08145124
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
	ldr r0, _081451EC
	movs r6, 0xC0
	lsls r6, 19
	adds r3, r6
	adds r1, r3, 0
	bl LZ77UnCompVram
	ldr r0, _081451F0
	adds r1, r5, 0
	movs r2, 0x20
	bl LoadPalette
	lsrs r4, 20
	lsls r4, 28
	lsrs r4, 16
	movs r2, 0
	adds r1, r4, 0x1
	ldr r3, _081451F4
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
	ldr r5, _081451F8
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
	ldr r5, _081451FC
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
	ldr r5, _08145200
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
	ldr r3, _08145204
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
	ldr r7, _08145360
	movs r4, 0xC0
	lsls r4, 19
	adds r1, 0x1
	ldr r3, _08145364
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
	ldr r0, _08145368
	str r6, [sp]
	movs r1, 0x7
	movs r2, 0x7
	adds r3, r5, 0
	bl sub_814524C
	ldr r4, _0814536C
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
	ldr r0, _08145370
	str r6, [sp]
	movs r1, 0x14
	movs r2, 0x7
	adds r3, r5, 0
	bl sub_814524C
	ldr r0, _08145374
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
	ldr r0, _08145390
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
	ldr r1, _081453A8
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
	ldr r0, _08145438
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
	ldr r0, _0814549C
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
	ldr r0, _081454F8
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
	ldr r1, _08145514
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
	ldr r1, _0814565C
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
	ldr r3, _08145680
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
	ldr r0, _081456B0
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
	ldr r0, _081456F4
	ldr r7, [r0, 0x20]
	b _081456FC
	.align 2, 0
_081456F4: .4byte gSaveBlock2
_081456F8:
	ldr r0, _081457E8
	ldr r7, [r0, 0x1C]
_081456FC:
	lsls r0, r6, 3
	ldr r1, _081457EC
	adds r0, r1
	ldr r1, _081457F0
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _081457F4
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
	ldr r2, _081457F8
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
	ldr r0, _081457FC
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
	ldr r5, _08145800
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
	ldr r0, _08145804
	str r0, [r2]
	ldr r0, _08145808
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
	ldr r4, _08145838
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
	ldr r0, _0814583C
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
	ldr r7, _0814597C
	ldr r0, _08145980
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
	ldr r0, _08145984
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
	ldr r0, _08145984
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

	thumb_func_start sub_8145A78
sub_8145A78: @ 8145A78
	push {r4,lr}
	bl Random
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl Random
	lsls r0, 16
	orrs r0, r4
	bl sub_8145D14
	ldr r0, _08145AA0
	movs r1, 0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08145AA0: .4byte 0x00004045
	thumb_func_end sub_8145A78

	thumb_func_start sub_8145AA4
sub_8145AA4: @ 8145AA4
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl Random
	lsls r0, 16
	lsrs r1, r0, 16
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _08145AE0
	cmp r4, r0
	beq _08145AD4
	ldr r5, _08145AE4
	ldr r3, _08145AE8
	adds r2, r0, 0
_08145AC4:
	adds r0, r1, 0
	muls r0, r5
	adds r1, r0, r3
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r2
	bne _08145AC4
_08145AD4:
	adds r0, r1, 0
	bl sub_8145D14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08145AE0: .4byte 0x0000ffff
_08145AE4: .4byte 0x41c64e6d
_08145AE8: .4byte 0x00003039
	thumb_func_end sub_8145AA4

	thumb_func_start sub_8145AEC
sub_8145AEC: @ 8145AEC
	push {lr}
	bl sub_8145D3C
	ldr r1, _08145AFC
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08145AFC: .4byte gScriptResult
	thumb_func_end sub_8145AEC

	thumb_func_start sub_8145B00
sub_8145B00: @ 8145B00
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r1, _08145C24
	movs r0, 0
	strh r0, [r1]
	movs r0, 0
	mov r10, r0
	mov r9, r0
	movs r6, 0
_08145B18:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _08145C28
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08145B74
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08145B6A
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	adds r1, r0, 0
	ldr r0, _08145C2C
	ldrh r0, [r0]
	lsls r1, 16
	lsrs r1, 16
	bl sub_8145C8C
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08145C24
	ldrh r2, [r1]
	cmp r0, r2
	bls _08145B6A
	cmp r0, 0x1
	bls _08145B6A
	subs r0, 0x1
	strh r0, [r1]
	movs r0, 0xE
	mov r9, r0
	mov r10, r6
_08145B6A:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _08145B18
_08145B74:
	movs r6, 0
_08145B76:
	movs r5, 0
	adds r1, r6, 0x1
	mov r8, r1
	lsls r0, r6, 2
	adds r7, r0, r6
_08145B80:
	lsls r2, r7, 4
	subs r2, r7
	lsls r2, 5
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 4
	ldr r1, _08145C30
	adds r0, r1
	adds r4, r2, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _08145BD8
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetBoxMonData
	cmp r0, 0
	bne _08145BD8
	adds r0, r4, 0
	movs r1, 0x1
	bl GetBoxMonData
	adds r1, r0, 0
	ldr r0, _08145C2C
	ldrh r0, [r0]
	lsls r1, 16
	lsrs r1, 16
	bl sub_8145C8C
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08145C24
	ldrh r2, [r1]
	cmp r0, r2
	bls _08145BD8
	cmp r0, 0x1
	bls _08145BD8
	subs r0, 0x1
	strh r0, [r1]
	mov r9, r6
	mov r10, r5
_08145BD8:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1D
	bls _08145B80
	mov r1, r8
	lsls r0, r1, 16
	lsrs r6, r0, 16
	cmp r6, 0xD
	bls _08145B76
	ldr r3, _08145C24
	ldrh r0, [r3]
	cmp r0, 0
	beq _08145C72
	ldr r2, _08145C34
	ldr r1, _08145C38
	subs r0, 0x1
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	mov r2, r9
	cmp r2, 0xE
	bne _08145C44
	ldr r1, _08145C3C
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x64
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r1, _08145C28
	adds r0, r1
	ldr r2, _08145C40
	movs r1, 0x2
	bl GetMonData
	b _08145C6C
	.align 2, 0
_08145C24: .4byte gUnknown_0202E8CC
_08145C28: .4byte gPlayerParty
_08145C2C: .4byte gScriptResult
_08145C30: .4byte gUnknown_020300A4
_08145C34: .4byte gUnknown_0202E8CE
_08145C38: .4byte gUnknown_0840CB04
_08145C3C: .4byte gUnknown_0202E8D0
_08145C40: .4byte gStringVar1
_08145C44:
	ldr r1, _08145C80
	movs r0, 0x1
	strh r0, [r1]
	mov r2, r9
	lsls r1, r2, 2
	add r1, r9
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	mov r2, r10
	lsls r1, r2, 2
	add r1, r10
	lsls r1, 4
	ldr r2, _08145C84
	adds r1, r2
	adds r0, r1
	ldr r2, _08145C88
	movs r1, 0x2
	bl GetBoxMonData
_08145C6C:
	ldr r0, _08145C88
	bl StringGetEnd10
_08145C72:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08145C80: .4byte gUnknown_0202E8D0
_08145C84: .4byte gUnknown_020300A4
_08145C88: .4byte gStringVar1
	thumb_func_end sub_8145B00

	thumb_func_start sub_8145C8C
sub_8145C8C: @ 8145C8C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	movs r0, 0
	mov r8, r0
	movs r7, 0
	ldr r1, _08145D0C
	mov r10, r1
	ldr r0, _08145D10
	mov r9, r0
_08145CAC:
	adds r0, r6, 0
	movs r1, 0xA
	bl __umodsi3
	adds r4, r0, 0
	mov r1, r10
	strh r4, [r1]
	adds r0, r5, 0
	movs r1, 0xA
	bl __umodsi3
	mov r1, r9
	strh r0, [r1]
	lsls r4, 16
	lsls r0, 16
	cmp r4, r0
	bne _08145CFA
	adds r0, r6, 0
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x4
	bls _08145CAC
_08145CFA:
	mov r0, r8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08145D0C: .4byte gUnknown_02039328
_08145D10: .4byte gUnknown_0203932A
	thumb_func_end sub_8145C8C

	thumb_func_start sub_8145D14
sub_8145D14: @ 8145D14
	push {r4,lr}
	adds r1, r0, 0
	lsrs r4, r1, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08145D34
	bl VarSet
	ldr r0, _08145D38
	adds r1, r4, 0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08145D34: .4byte 0x0000404b
_08145D38: .4byte 0x0000404c
	thumb_func_end sub_8145D14

	thumb_func_start sub_8145D3C
sub_8145D3C: @ 8145D3C
	push {r4,lr}
	ldr r0, _08145D5C
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08145D60
	bl VarGet
	lsls r0, 16
	orrs r0, r4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08145D5C: .4byte 0x0000404b
_08145D60: .4byte 0x0000404c
	thumb_func_end sub_8145D3C

	thumb_func_start unref_sub_8145D64
unref_sub_8145D64: @ 8145D64
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl sub_8145D14
	pop {r0}
	bx r0
	thumb_func_end unref_sub_8145D64

	thumb_func_start sub_8145D74
sub_8145D74: @ 8145D74
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8145D74

	thumb_func_start sub_8145D88
sub_8145D88: @ 8145D88
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	mov r8, r0
	movs r1, 0
	strh r1, [r0]
	ldr r6, _08145EB0
	strh r1, [r6]
	adds r0, 0xC
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x14
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
	add r0, sp, 0x4
	strh r1, [r0]
	ldr r2, _08145EB4
	str r0, [r2]
	movs r1, 0xC0
	lsls r1, 19
	str r1, [r2, 0x4]
	ldr r0, _08145EB8
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r5, 0
	str r5, [sp, 0x8]
	add r0, sp, 0x8
	str r0, [r2]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r2, 0x4]
	ldr r0, _08145EBC
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	add r0, sp, 0x4
	strh r5, [r0]
	str r0, [r2]
	movs r0, 0xA0
	lsls r0, 19
	str r0, [r2, 0x4]
	ldr r0, _08145EC0
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _08145EC4
	bl LZ77UnCompVram
	ldr r0, _08145EC8
	ldr r1, _08145ECC
	bl LZ77UnCompVram
	bl remove_some_task
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	bl FreeAllSpritePalettes
	ldr r0, _08145ED0
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _08145ED4
	bl SetUpWindowConfig
	ldr r0, _08145ED8
	bl InitMenuWindow
	bl pokedex_diploma_something
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r3, _08145EDC
	ldrh r2, [r3]
	strh r5, [r3]
	ldr r4, _08145EE0
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08145EE4
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08145EE8
	bl SetVBlankCallback
	ldr r0, _08145EEC
	bl SetMainCallback2
	ldr r0, _08145EF0
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	ldr r1, _08145EF4
	adds r0, r1, 0
	strh r0, [r6]
	movs r1, 0xCA
	lsls r1, 5
	adds r0, r1, 0
	mov r1, r8
	strh r0, [r1]
	ldr r0, _08145EF8
	movs r1, 0
	bl CreateTask
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08145EB0: .4byte REG_BG3CNT
_08145EB4: .4byte 0x040000d4
_08145EB8: .4byte 0x8100c000
_08145EBC: .4byte 0x85000100
_08145EC0: .4byte 0x81000200
_08145EC4: .4byte gUnknown_0840D288
_08145EC8: .4byte gUnknown_0840CB4C
_08145ECC: .4byte 0x06003000
_08145ED0: .4byte gUnknown_0840CB0C
_08145ED4: .4byte gWindowConfig_81E6C3C
_08145ED8: .4byte gWindowConfig_81E6CE4
_08145EDC: .4byte 0x04000208
_08145EE0: .4byte 0x04000200
_08145EE4: .4byte REG_DISPSTAT
_08145EE8: .4byte sub_8145D74
_08145EEC: .4byte sub_8145EFC
_08145EF0: .4byte REG_BLDCNT
_08145EF4: .4byte 0x00004603
_08145EF8: .4byte sub_8145F14
	thumb_func_end sub_8145D88

	thumb_func_start sub_8145EFC
sub_8145EFC: @ 8145EFC
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8145EFC

	thumb_func_start sub_8145F14
sub_8145F14: @ 8145F14
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08145F38
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08145F34
	ldr r0, _08145F3C
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _08145F40
	str r0, [r1]
_08145F34:
	pop {r0}
	bx r0
	.align 2, 0
_08145F38: .4byte gPaletteFade
_08145F3C: .4byte gTasks
_08145F40: .4byte sub_8145F44
	thumb_func_end sub_8145F14

	thumb_func_start sub_8145F44
sub_8145F44: @ 8145F44
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08145F80
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08145F76
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08145F84
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08145F88
	str r1, [r0]
_08145F76:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08145F80: .4byte gMain
_08145F84: .4byte gTasks
_08145F88: .4byte sub_8145F8C
	thumb_func_end sub_8145F44

	thumb_func_start sub_8145F8C
sub_8145F8C: @ 8145F8C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08145FB0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08145FAA
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _08145FB4
	bl SetMainCallback2
_08145FAA:
	pop {r0}
	bx r0
	.align 2, 0
_08145FB0: .4byte gPaletteFade
_08145FB4: .4byte sub_80546F0
	thumb_func_end sub_8145F8C

	thumb_func_start pokedex_diploma_something
pokedex_diploma_something: @ 8145FB8
	push {lr}
	bl sub_8090FF4
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _08145FE8
	ldr r1, _08145FDC
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08145FE0
	ldr r1, _08145FE4
	bl StringCopy
	b _08145FF4
	.align 2, 0
_08145FDC: .4byte REG_BG3HOFS
_08145FE0: .4byte gStringVar1
_08145FE4: .4byte gOtherText_NationalDex
_08145FE8:
	ldr r0, _08146004
	strh r1, [r0]
	ldr r0, _08146008
	ldr r1, _0814600C
	bl StringCopy
_08145FF4:
	ldr r0, _08146010
	movs r1, 0x6
	movs r2, 0x2
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_08146004: .4byte REG_BG3HOFS
_08146008: .4byte gStringVar1
_0814600C: .4byte gOtherText_HoennDex
_08146010: .4byte gOtherText_DiplomaCertificationGameFreak
	thumb_func_end pokedex_diploma_something

	thumb_func_start sub_8146014
sub_8146014: @ 8146014
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8146014

	thumb_func_start sub_814602C
sub_814602C: @ 814602C
	push {lr}
	ldr r2, _0814604C
	ldr r0, _08146050
	ldrh r1, [r0]
	strh r1, [r2]
	ldr r0, _08146054
	strh r1, [r0]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
_0814604C: .4byte REG_BG0VOFS
_08146050: .4byte gUnknown_030041B4
_08146054: .4byte REG_BG1VOFS
	thumb_func_end sub_814602C

	thumb_func_start sub_8146058
sub_8146058: @ 8146058
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08146074
	ldr r1, _08146078
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xC
	bls _0814606A
	b _08146250
_0814606A:
	lsls r0, 2
	ldr r1, _0814607C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08146074: .4byte gMain
_08146078: .4byte 0x0000043c
_0814607C: .4byte _08146080
	.align 2, 0
_08146080:
	.4byte _081460B4
	.4byte _081460CC
	.4byte _081460F0
	.4byte _081460F6
	.4byte _08146110
	.4byte _0814611C
	.4byte _0814613C
	.4byte _0814615C
	.4byte _08146170
	.4byte _08146190
	.4byte _081461B4
	.4byte _08146204
	.4byte _08146224
_081460B4:
	bl sub_80F9438
	bl sub_80F9368
	bl sub_8146288
	ldr r1, _081460C8
	movs r0, 0
	strh r0, [r1]
	b _0814620C
	.align 2, 0
_081460C8: .4byte REG_BLDCNT
_081460CC:
	bl ResetPaletteFade
	ldr r2, _081460E4
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _081460E8
	ldr r0, _081460EC
	adds r1, r0
	b _08146212
	.align 2, 0
_081460E4: .4byte gPaletteFade
_081460E8: .4byte gMain
_081460EC: .4byte 0x0000043c
_081460F0:
	bl ResetSpriteData
	b _0814620C
_081460F6:
	ldr r0, _08146104
	bl SetUpWindowConfig
	ldr r1, _08146108
	ldr r0, _0814610C
	adds r1, r0
	b _08146212
	.align 2, 0
_08146104: .4byte gWindowConfig_81E6E18
_08146108: .4byte gMain
_0814610C: .4byte 0x0000043c
_08146110:
	ldr r0, _08146118
	bl MultistepInitMenuWindowBegin
	b _0814620C
	.align 2, 0
_08146118: .4byte gWindowConfig_81E6E18
_0814611C:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _08146126
	b _08146250
_08146126:
	ldr r0, _08146134
	ldr r1, _08146138
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _0814620C
	.align 2, 0
_08146134: .4byte 0x02000000
_08146138: .4byte 0x0001ffff
_0814613C:
	bl sub_81462B8
	lsls r0, 24
	cmp r0, 0
	bne _08146148
	b _08146250
_08146148:
	ldr r0, _08146154
	ldr r1, _08146158
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _0814620C
	.align 2, 0
_08146154: .4byte 0x02000000
_08146158: .4byte 0x0001ffff
_0814615C:
	bl sub_81464E4
	ldr r1, _08146168
	ldr r0, _0814616C
	adds r1, r0
	b _08146212
	.align 2, 0
_08146168: .4byte gMain
_0814616C: .4byte 0x0000043c
_08146170:
	ldr r0, _08146188
	ldrb r0, [r0]
	adds r0, 0x7B
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x38
	movs r2, 0x40
	bl sub_80A7D8C
	ldr r1, _0814618C
	strb r0, [r1]
	b _0814620C
	.align 2, 0
_08146188: .4byte word_203855E
_0814618C: .4byte gUnknown_0203932C
_08146190:
	ldr r0, _081461A8
	ldrb r0, [r0]
	adds r0, 0x7B
	lsls r0, 24
	lsrs r0, 24
	bl sub_8146600
	ldr r1, _081461AC
	ldr r0, _081461B0
	adds r1, r0
	b _08146212
	.align 2, 0
_081461A8: .4byte word_203855E
_081461AC: .4byte gMain
_081461B0: .4byte 0x0000043c
_081461B4:
	ldr r3, _081461EC
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _081461F0
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _081461F4
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _081461F8
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _081461FC
	ldr r0, _08146200
	adds r1, r0
	b _08146212
	.align 2, 0
_081461EC: .4byte 0x04000208
_081461F0: .4byte 0x04000200
_081461F4: .4byte REG_DISPSTAT
_081461F8: .4byte sub_814602C
_081461FC: .4byte gMain
_08146200: .4byte 0x0000043c
_08146204:
	bl sub_8055870
	cmp r0, 0x1
	beq _08146250
_0814620C:
	ldr r1, _0814621C
	ldr r2, _08146220
	adds r1, r2
_08146212:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08146250
	.align 2, 0
_0814621C: .4byte gMain
_08146220: .4byte 0x0000043c
_08146224:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _08146248
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0814624C
	bl SetMainCallback2
	movs r0, 0x1
	b _08146252
	.align 2, 0
_08146248: .4byte gPaletteFade
_0814624C: .4byte sub_8146014
_08146250:
	movs r0, 0
_08146252:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8146058

	thumb_func_start sub_814625C
sub_814625C: @ 814625C
	push {lr}
_0814625E:
	bl sub_8146058
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08146278
	ldr r0, _08146274
	movs r1, 0
	bl CreateTask
	b _08146284
	.align 2, 0
_08146274: .4byte sub_8146480
_08146278:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0814625E
_08146284:
	pop {r0}
	bx r0
	thumb_func_end sub_814625C

	thumb_func_start sub_8146288
sub_8146288: @ 8146288
	ldr r1, _081462A8
	ldr r2, _081462AC
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	adds r2, 0xFE
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _081462B0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _081462B4
	movs r0, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_081462A8: .4byte REG_BG1CNT
_081462AC: .4byte 0x00000502
_081462B0: .4byte 0x00000703
_081462B4: .4byte gUnknown_030041B4
	thumb_func_end sub_8146288

	thumb_func_start sub_81462B8
sub_81462B8: @ 81462B8
	push {r4-r7,lr}
	ldr r1, _081462D4
	ldr r2, _081462D8
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r12, r1
	cmp r0, 0x6
	bls _081462CA
	b _08146404
_081462CA:
	lsls r0, 2
	ldr r1, _081462DC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081462D4: .4byte 0x02000000
_081462D8: .4byte 0x0001ffff
_081462DC: .4byte _081462E0
	.align 2, 0
_081462E0:
	.4byte _081462FC
	.4byte _0814630C
	.4byte _0814632C
	.4byte _08146340
	.4byte _081463A4
	.4byte _081463C4
	.4byte _081463E4
_081462FC:
	ldr r0, _08146308
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	b _081463CA
	.align 2, 0
_08146308: .4byte gBerryCheck_Gfx
_0814630C:
	ldr r0, _0814631C
	ldr r1, _08146320
	bl LZDecompressVram
	ldr r1, _08146324
	ldr r2, _08146328
	adds r1, r2
	b _081463D0
	.align 2, 0
_0814631C: .4byte gUnknown_08E788E4
_08146320: .4byte 0x06002800
_08146324: .4byte 0x02000000
_08146328: .4byte 0x0001ffff
_0814632C:
	ldr r0, _08146338
	ldr r1, _0814633C
	bl LZDecompressVram
	b _081463CA
	.align 2, 0
_08146338: .4byte gUnknown_08E78A84
_0814633C: .4byte 0x06003000
_08146340:
	movs r1, 0
	ldr r7, _0814635C
	adds r2, r7, 0
	ldr r6, _08146360
	ldr r5, _08146364
	ldr r4, _08146368
	ldr r3, _0814636C
_0814634E:
	ldrb r0, [r5, 0x8]
	cmp r0, 0
	bne _08146370
	lsls r0, r1, 1
	adds r0, r2
	strh r6, [r0]
	b _08146376
	.align 2, 0
_0814635C: .4byte gBG2TilemapBuffer
_08146360: .4byte 0x00004042
_08146364: .4byte gSaveBlock2
_08146368: .4byte 0x00005042
_0814636C: .4byte 0x000003ff
_08146370:
	lsls r0, r1, 1
	adds r0, r2
	strh r4, [r0]
_08146376:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r3
	bls _0814634E
	ldr r1, _08146394
	ldr r0, _08146398
	str r7, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0814639C
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r1, _081463A0
	add r1, r12
	b _081463D0
	.align 2, 0
_08146394: .4byte 0x06003800
_08146398: .4byte 0x040000d4
_0814639C: .4byte 0x80000400
_081463A0: .4byte 0x0001ffff
_081463A4:
	ldr r0, _081463B8
	movs r1, 0
	movs r2, 0xC0
	bl LoadCompressedPalette
	ldr r1, _081463BC
	ldr r2, _081463C0
	adds r1, r2
	b _081463D0
	.align 2, 0
_081463B8: .4byte gBerryCheck_Pal
_081463BC: .4byte 0x02000000
_081463C0: .4byte 0x0001ffff
_081463C4:
	ldr r0, _081463D8
	bl LoadCompressedObjectPic
_081463CA:
	ldr r1, _081463DC
	ldr r0, _081463E0
	adds r1, r0
_081463D0:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08146404
	.align 2, 0
_081463D8: .4byte gUnknown_083C1F74
_081463DC: .4byte 0x02000000
_081463E0: .4byte 0x0001ffff
_081463E4:
	ldr r0, _081463F8
	bl LoadCompressedObjectPalette
	ldr r0, _081463FC
	ldr r1, _08146400
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _08146406
	.align 2, 0
_081463F8: .4byte gUnknown_083C1F7C
_081463FC: .4byte 0x02000000
_08146400: .4byte 0x0001ffff
_08146404:
	movs r0, 0
_08146406:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81462B8

	thumb_func_start sub_814640C
sub_814640C: @ 814640C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08146438
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08146432
	ldr r0, _0814643C
	bl SetMainCallback2
	bl sub_80A7DD4
	bl gpu_pal_allocator_reset__manage_upper_four
	adds r0, r4, 0
	bl DestroyTask
_08146432:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08146438: .4byte gPaletteFade
_0814643C: .4byte sub_80A5B40
	thumb_func_end sub_814640C

	thumb_func_start sub_8146440
sub_8146440: @ 8146440
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySoundEffect
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08146478
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0814647C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08146478: .4byte gTasks
_0814647C: .4byte sub_814640C
	thumb_func_end sub_8146440

	thumb_func_start sub_8146480
sub_8146480: @ 8146480
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	ldr r0, _081464DC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081464D6
	ldr r5, _081464E0
	ldrh r1, [r5, 0x30]
	movs r6, 0xF0
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0x40
	bne _081464AC
	movs r1, 0x1
	negs r1, r1
	adds r0, r4, 0
	bl sub_81466E8
_081464AC:
	ldrh r1, [r5, 0x30]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0x80
	bne _081464BE
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81466E8
_081464BE:
	ldrh r1, [r5, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _081464D0
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081464D6
_081464D0:
	adds r0, r7, 0
	bl sub_8146440
_081464D6:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081464DC: .4byte gPaletteFade
_081464E0: .4byte gMain
	thumb_func_end sub_8146480

	thumb_func_start sub_81464E4
sub_81464E4: @ 81464E4
	push {r4-r7,lr}
	ldr r4, _0814659C
	ldrb r0, [r4]
	adds r0, 0x7C
	lsls r0, 24
	lsrs r0, 24
	bl GetBerryInfo
	adds r5, r0, 0
	ldr r7, _081465A0
	ldrh r1, [r4]
	subs r1, 0x84
	adds r0, r7, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r0, r7, 0
	movs r1, 0xC
	movs r2, 0x4
	bl MenuPrint
	adds r0, r5, 0
	movs r1, 0xE
	movs r2, 0x4
	bl MenuPrint
	ldr r0, [r5, 0xC]
	movs r1, 0x4
	movs r2, 0xE
	bl MenuPrint
	ldr r0, [r5, 0x10]
	movs r1, 0x4
	movs r2, 0x10
	bl MenuPrint
	ldrh r1, [r5, 0x8]
	lsls r0, r1, 5
	subs r0, r1
	lsls r0, 2
	adds r0, r1
	lsls r0, 3
	movs r1, 0xFE
	bl __divsi3
	adds r4, r0, 0
	movs r1, 0xA
	bl __umodsi3
	cmp r0, 0x4
	bls _0814654E
	adds r4, 0xA
_0814654E:
	adds r0, r4, 0
	movs r1, 0x64
	bl __umodsi3
	movs r1, 0xA
	bl __udivsi3
	adds r6, r0, 0
	adds r0, r4, 0
	movs r1, 0x64
	bl __udivsi3
	adds r4, r0, 0
	ldr r0, _081465A4
	movs r1, 0xB
	movs r2, 0x7
	bl MenuPrint
	ldrh r0, [r5, 0x8]
	cmp r0, 0
	beq _081465B0
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _081465A8
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _081465AC
	movs r1, 0x10
	movs r2, 0x7
	bl MenuPrint
	b _081465BA
	.align 2, 0
_0814659C: .4byte word_203855E
_081465A0: .4byte gStringVar1
_081465A4: .4byte gOtherText_Size
_081465A8: .4byte gStringVar2
_081465AC: .4byte gContestStatsText_Unknown1
_081465B0:
	ldr r0, _081465E0
	movs r1, 0x10
	movs r2, 0x7
	bl MenuPrint
_081465BA:
	ldr r0, _081465E4
	movs r1, 0xB
	movs r2, 0x9
	bl MenuPrint
	ldrb r0, [r5, 0x7]
	cmp r0, 0
	beq _081465EC
	ldr r0, _081465E8
	ldrb r1, [r5, 0x7]
	subs r1, 0x1
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	movs r1, 0x10
	movs r2, 0x9
	bl MenuPrint
	b _081465F6
	.align 2, 0
_081465E0: .4byte gOtherText_ThreeQuestions2
_081465E4: .4byte gOtherText_Firm
_081465E8: .4byte gUnknown_0841192C
_081465EC:
	ldr r0, _081465FC
	movs r1, 0x10
	movs r2, 0x9
	bl MenuPrint
_081465F6:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081465FC: .4byte gOtherText_ThreeQuestions2
	thumb_func_end sub_81464E4

	thumb_func_start sub_8146600
sub_8146600: @ 8146600
	push {r4,r5,lr}
	lsls r0, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 24
	bl GetBerryInfo
	adds r4, r0, 0
	movs r2, 0
	ldr r5, _08146698
	ldr r0, _0814669C
	adds r3, r0, 0
_0814661A:
	lsls r0, r2, 1
	adds r0, r5
	ldrh r1, [r0]
	orrs r1, r3
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x4
	bls _0814661A
	ldrb r0, [r4, 0x15]
	cmp r0, 0
	beq _08146642
	movs r0, 0x30
	bl sub_80A7E5C
	ldr r1, _08146698
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
_08146642:
	ldrb r0, [r4, 0x16]
	cmp r0, 0
	beq _08146656
	movs r0, 0x58
	bl sub_80A7E5C
	ldr r1, _08146698
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x2]
_08146656:
	ldrb r0, [r4, 0x17]
	cmp r0, 0
	beq _0814666A
	movs r0, 0x80
	bl sub_80A7E5C
	ldr r1, _08146698
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x4]
_0814666A:
	ldrb r0, [r4, 0x18]
	cmp r0, 0
	beq _0814667E
	movs r0, 0xA8
	bl sub_80A7E5C
	ldr r1, _08146698
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x6]
_0814667E:
	ldrb r0, [r4, 0x19]
	cmp r0, 0
	beq _08146692
	movs r0, 0xD0
	bl sub_80A7E5C
	ldr r1, _08146698
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x8]
_08146692:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08146698: .4byte gUnknown_0203932E
_0814669C: .4byte 0x0000ffff
	thumb_func_end sub_8146600

	thumb_func_start sub_81466A0
sub_81466A0: @ 81466A0
	push {r4-r7,lr}
	movs r5, 0
	movs r7, 0x1
	negs r7, r7
	ldr r6, _081466DC
_081466AA:
	lsls r0, r5, 1
	adds r4, r0, r6
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, r7
	beq _081466CA
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081466E0
	adds r0, r1
	bl DestroySprite
	ldr r0, _081466E4
	strh r0, [r4]
_081466CA:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x4
	bls _081466AA
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081466DC: .4byte gUnknown_0203932E
_081466E0: .4byte gSprites
_081466E4: .4byte 0x0000ffff
	thumb_func_end sub_81466A0

	thumb_func_start sub_81466E8
sub_81466E8: @ 81466E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _08146748
	adds r6, r0, r1
	ldr r4, _0814674C
	movs r0, 0xC
	adds r0, r4
	mov r8, r0
	ldrb r1, [r0, 0x1]
	ldrb r0, [r4, 0xC]
	adds r1, r0
	cmp r1, 0
	bne _08146718
	lsls r0, r2, 24
	cmp r0, 0
	blt _0814678C
_08146718:
	adds r0, r1, 0x1
	lsls r5, r2, 24
	mov r1, r8
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	bne _08146728
	cmp r5, 0
	bgt _0814678C
_08146728:
	movs r0, 0x5
	bl PlaySoundEffect
	mov r2, r8
	ldrb r3, [r2, 0x1]
	ldrb r4, [r4, 0xC]
	mov r12, r4
	adds r0, r3, r4
	asrs r2, r5, 24
	adds r1, r0, r2
	cmp r1, 0
	bge _08146750
	negs r0, r0
	strh r0, [r6, 0x2]
	b _08146766
	.align 2, 0
_08146748: .4byte gUnknown_03004B28
_0814674C: .4byte gUnknown_03005D10
_08146750:
	mov r4, r8
	ldrb r0, [r4, 0x2]
	cmp r1, r0
	blt _08146764
	subs r0, r3
	mov r1, r12
	subs r0, r1
	subs r0, 0x1
	strh r0, [r6, 0x2]
	b _08146766
_08146764:
	strh r2, [r6, 0x2]
_08146766:
	ldr r0, _08146780
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _08146784
	str r0, [r1]
	cmp r5, 0
	bge _08146788
	movs r2, 0x10
	negs r2, r2
	adds r0, r2, 0
	b _0814678A
	.align 2, 0
_08146780: .4byte gTasks
_08146784: .4byte sub_8146798
_08146788:
	movs r0, 0x10
_0814678A:
	strh r0, [r6]
_0814678C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81466E8

	thumb_func_start sub_8146798
sub_8146798: @ 8146798
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08146800
	adds r0, r1
	ldr r2, _08146804
	ldrh r1, [r0]
	ldrh r5, [r2]
	adds r3, r1, r5
	movs r1, 0xFF
	ands r3, r1
	strh r3, [r2]
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	ble _081467C2
	cmp r3, 0x90
	beq _081467CA
_081467C2:
	cmp r0, 0
	bge _081467E0
	cmp r3, 0x70
	bne _081467E0
_081467CA:
	ldr r0, _08146808
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0xA
	ldrsb r0, [r1, r0]
	bl sub_8146810
	bl sub_81468BC
_081467E0:
	ldr r0, _08146804
	ldrh r2, [r0]
	cmp r2, 0
	bne _081467FA
	ldr r0, _08146808
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	strh r2, [r1, 0x8]
	strh r2, [r1, 0xA]
	ldr r0, _0814680C
	str r0, [r1]
_081467FA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08146800: .4byte gUnknown_03004B28
_08146804: .4byte gUnknown_030041B4
_08146808: .4byte gTasks
_0814680C: .4byte sub_8146480
	thumb_func_end sub_8146798

	thumb_func_start sub_8146810
sub_8146810: @ 8146810
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	lsls r0, r3, 24
	asrs r1, r0, 24
	cmp r1, 0
	ble _08146848
	ldr r0, _08146840
	adds r4, r0, 0
	adds r4, 0xC
	ldrb r2, [r0, 0xC]
	adds r1, r2, r1
	adds r6, r0, 0
	cmp r1, 0x7
	ble _08146844
	adds r0, r3, 0
	adds r0, 0xF9
	adds r0, r2, r0
	ldrb r1, [r4, 0x1]
	adds r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x7
	b _0814686E
	.align 2, 0
_08146840: .4byte gUnknown_03005D10
_08146844:
	adds r0, r2, r3
	b _0814686E
_08146848:
	ldr r0, _08146868
	adds r5, r0, 0
	adds r5, 0xC
	ldrb r2, [r0, 0xC]
	adds r1, r2, r1
	adds r6, r0, 0
	cmp r1, 0
	bge _0814686C
	adds r0, r2, r3
	ldrb r1, [r5, 0x1]
	adds r0, r1
	movs r1, 0
	strb r0, [r5, 0x1]
	strb r1, [r6, 0xC]
	b _08146870
	.align 2, 0
_08146868: .4byte gUnknown_03005D10
_0814686C:
	adds r0, r2, r4
_0814686E:
	strb r0, [r6, 0xC]
_08146870:
	ldr r2, _081468AC
	movs r0, 0x3
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x1]
	ldrb r0, [r0]
	adds r1, r0
	ldr r0, _081468B0
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1]
	strh r0, [r2]
	ldr r0, _081468B4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081468B8
	adds r0, r1
	bl DestroySprite
	bl sub_81466A0
	bl sub_80A7DD4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081468AC: .4byte word_203855E
_081468B0: .4byte gUnknown_03005D24
_081468B4: .4byte gUnknown_0203932C
_081468B8: .4byte gSprites
	thumb_func_end sub_8146810

	thumb_func_start sub_81468BC
sub_81468BC: @ 81468BC
	push {r4,lr}
	movs r0, 0
	movs r1, 0x4
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_81464E4
	ldr r4, _081468F8
	ldrb r0, [r4]
	adds r0, 0x7B
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x38
	movs r2, 0x40
	bl sub_80A7D8C
	ldr r1, _081468FC
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, 0x7B
	lsls r0, 24
	lsrs r0, 24
	bl sub_8146600
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081468F8: .4byte word_203855E
_081468FC: .4byte gUnknown_0203932C
	thumb_func_end sub_81468BC

	thumb_func_start sub_8146900
sub_8146900: @ 8146900
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8146900

	thumb_func_start sub_8146914
sub_8146914: @ 8146914
	push {lr}
	movs r2, 0
	ldr r1, _0814692C
	ldrh r0, [r1, 0x1A]
	ldrh r1, [r1, 0x36]
	cmp r0, r1
	bne _08146924
	movs r2, 0x1
_08146924:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_0814692C: .4byte gLinkPlayers
	thumb_func_end sub_8146914

	thumb_func_start CB2_InitMysteryEventMenu
CB2_InitMysteryEventMenu: @ 8146930
	push {r4,lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _0814699C
	bl SetVBlankCallback
	ldr r4, _081469A0
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl MenuZeroFillScreen
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x50
	movs r0, 0
	strh r0, [r1]
	ldr r0, _081469A4
	movs r1, 0
	bl CreateTask
	bl StopMapMusic
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	ldr r0, _081469A8
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814699C: .4byte sub_8146900
_081469A0: .4byte gWindowConfig_81E6CE4
_081469A4: .4byte Task_DestroySelf
_081469A8: .4byte sub_81469E4
	thumb_func_end CB2_InitMysteryEventMenu

	thumb_func_start sub_81469AC
sub_81469AC: @ 81469AC
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	movs r5, 0x1
	cmp r4, 0
	bne _081469C0
	ldr r1, _081469DC
	bl StringCopy
	movs r5, 0
_081469C0:
	cmp r4, 0x2
	bne _081469C6
	movs r5, 0
_081469C6:
	cmp r4, 0x1
	bne _081469D2
	ldr r1, _081469E0
	adds r0, r6, 0
	bl StringCopy
_081469D2:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081469DC: .4byte gSystemText_EventLoadSuccess
_081469E0: .4byte gSystemText_LoadingError
	thumb_func_end sub_81469AC

	thumb_func_start sub_81469E4
sub_81469E4: @ 81469E4
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r1, _08146A04
	ldr r2, _08146A08
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x10
	bls _081469F8
	b _08146DA4
_081469F8:
	lsls r0, 2
	ldr r1, _08146A0C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08146A04: .4byte gMain
_08146A08: .4byte 0x0000043c
_08146A0C: .4byte _08146A10
	.align 2, 0
_08146A10:
	.4byte _08146A54
	.4byte _08146A6E
	.4byte _08146A9C
	.4byte _08146AD4
	.4byte _08146B18
	.4byte _08146B26
	.4byte _08146B90
	.4byte _08146C64
	.4byte _08146C72
	.4byte _08146C94
	.4byte _08146CA0
	.4byte _08146CB4
	.4byte _08146CFC
	.4byte _08146D18
	.4byte _08146D50
	.4byte _08146D6C
	.4byte _08146D94
_08146A54:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	b _08146D78
_08146A6E:
	ldr r0, _08146A8C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08146A7C
	b _08146DA4
_08146A7C:
	ldr r0, _08146A90
	bl sub_8072044
	ldr r1, _08146A94
	ldr r2, _08146A98
	adds r1, r2
	b _08146D82
	.align 2, 0
_08146A8C: .4byte gPaletteFade
_08146A90: .4byte gSystemText_LinkStandby
_08146A94: .4byte gMain
_08146A98: .4byte 0x0000043c
_08146A9C:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08146AA8
	b _08146DA4
_08146AA8:
	ldr r1, _08146AC4
	ldr r0, _08146AC8
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _08146ACC
	ldr r2, _08146AD0
	adds r0, r2, 0
	strh r0, [r1]
	bl OpenLink
	b _08146DA4
	.align 2, 0
_08146AC4: .4byte gMain
_08146AC8: .4byte 0x0000043c
_08146ACC: .4byte gLinkType
_08146AD0: .4byte 0x00005501
_08146AD4:
	ldr r0, _08146B08
	ldr r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08146AE2
	b _08146C38
_08146AE2:
	movs r0, 0x1C
	ands r1, r0
	cmp r1, 0x4
	bhi _08146AEC
	b _08146C38
_08146AEC:
	movs r0, 0x15
	bl PlaySoundEffect
	ldr r0, _08146B0C
	bl sub_8072044
	ldr r1, _08146B10
	ldr r0, _08146B14
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08146C38
	.align 2, 0
_08146B08: .4byte gLinkStatus
_08146B0C: .4byte gSystemText_LoadEventPressA
_08146B10: .4byte gMain
_08146B14: .4byte 0x0000043c
_08146B18:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08146B24
	b _08146DA4
_08146B24:
	b _08146D7C
_08146B26:
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bne _08146C10
	ldr r4, _08146B64
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08146B70
	movs r0, 0x5
	bl PlaySoundEffect
	bl sub_8007F4C
	movs r0, 0x6
	movs r1, 0x5
	movs r2, 0x17
	movs r3, 0x8
	bl MenuDrawTextWindow
	ldr r0, _08146B68
	movs r1, 0x7
	movs r2, 0x6
	bl MenuPrint
	ldr r2, _08146B6C
	adds r1, r4, r2
	b _08146D82
	.align 2, 0
_08146B64: .4byte gMain
_08146B68: .4byte gSystemText_LoadingEvent
_08146B6C: .4byte 0x0000043c
_08146B70:
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _08146B7A
	b _08146DA4
_08146B7A:
	movs r0, 0x5
	bl PlaySoundEffect
	bl CloseLink
	ldr r0, _08146B8C
	adds r1, r4, r0
	b _08146C54
	.align 2, 0
_08146B8C: .4byte 0x0000043c
_08146B90:
	bl IsLinkConnectionEstablished
	lsls r0, 24
	cmp r0, 0
	beq _08146C38
	ldr r0, _08146BD8
	ldrb r0, [r0]
	cmp r0, 0
	bne _08146BA4
	b _08146DA4
_08146BA4:
	bl GetLinkPlayerDataExchangeStatusTimed
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _08146BE8
	bl sub_800832C
	movs r0, 0x6
	movs r1, 0x5
	movs r2, 0x17
	movs r3, 0x8
	bl MenuZeroFillWindowRect
	ldr r4, _08146BDC
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81469AC
	adds r0, r4, 0
	bl sub_8072044
	ldr r0, _08146BE0
	ldr r2, _08146BE4
	adds r0, r2
	b _08146C26
	.align 2, 0
_08146BD8: .4byte gReceivedRemoteLinkPlayers
_08146BDC: .4byte gStringVar4
_08146BE0: .4byte gMain
_08146BE4: .4byte 0x0000043c
_08146BE8:
	bl sub_8146914
	lsls r0, 24
	cmp r0, 0
	beq _08146C00
	ldr r0, _08146BFC
	bl sub_8072044
	b _08146D7C
	.align 2, 0
_08146BFC: .4byte gSystemText_DontCutLink
_08146C00:
	bl CloseLink
	movs r0, 0x6
	movs r1, 0x5
	movs r2, 0x17
	movs r3, 0x8
	bl MenuZeroFillWindowRect
_08146C10:
	ldr r4, _08146C2C
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81469AC
	adds r0, r4, 0
	bl sub_8072044
	ldr r0, _08146C30
	ldr r1, _08146C34
	adds r0, r1
_08146C26:
	movs r1, 0xD
	strb r1, [r0]
	b _08146DA4
	.align 2, 0
_08146C2C: .4byte gStringVar4
_08146C30: .4byte gMain
_08146C34: .4byte 0x0000043c
_08146C38:
	ldr r4, _08146C5C
	ldrh r1, [r4, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08146C46
	b _08146DA4
_08146C46:
	movs r0, 0x5
	bl PlaySoundEffect
	bl CloseLink
	ldr r2, _08146C60
	adds r1, r4, r2
_08146C54:
	movs r0, 0xF
	strb r0, [r1]
	b _08146DA4
	.align 2, 0
_08146C5C: .4byte gMain
_08146C60: .4byte 0x0000043c
_08146C64:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08146C70
	b _08146DA4
_08146C70:
	b _08146D7C
_08146C72:
	bl GetBlockRecievedStatus
	lsls r0, 24
	cmp r0, 0
	bne _08146C7E
	b _08146DA4
_08146C7E:
	bl ResetBlockReceivedFlags
	ldr r1, _08146C8C
	ldr r2, _08146C90
	adds r1, r2
	b _08146D82
	.align 2, 0
_08146C8C: .4byte gMain
_08146C90: .4byte 0x0000043c
_08146C94:
	ldr r0, _08146C9C
	adds r1, r4, r0
	b _08146D82
	.align 2, 0
_08146C9C: .4byte 0x0000043c
_08146CA0:
	bl sub_800832C
	ldr r1, _08146CAC
	ldr r2, _08146CB0
	adds r1, r2
	b _08146D82
	.align 2, 0
_08146CAC: .4byte gMain
_08146CB0: .4byte 0x0000043c
_08146CB4:
	ldr r0, _08146CEC
	ldrb r6, [r0]
	cmp r6, 0
	bne _08146DA4
	ldr r5, _08146CF0
	adds r0, r5, 0
	bl sub_812613C
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	str r6, [sp, 0x4]
	ldr r2, _08146CF4
	add r0, sp, 0x4
	adds r1, r5, 0
	bl CpuSet
	ldr r0, _08146CF8
	adds r1, r4, 0
	bl sub_81469AC
	lsls r0, 24
	cmp r0, 0
	bne _08146D7C
	movs r0, 0
	bl sub_8125D44
	b _08146D7C
	.align 2, 0
_08146CEC: .4byte gReceivedRemoteLinkPlayers
_08146CF0: .4byte 0x02000000
_08146CF4: .4byte 0x050001f5
_08146CF8: .4byte gStringVar4
_08146CFC:
	ldr r0, _08146D0C
	bl sub_8072044
	ldr r1, _08146D10
	ldr r2, _08146D14
	adds r1, r2
	b _08146D82
	.align 2, 0
_08146D0C: .4byte gStringVar4
_08146D10: .4byte gMain
_08146D14: .4byte 0x0000043c
_08146D18:
	movs r0, 0x6
	movs r1, 0x5
	movs r2, 0x17
	movs r3, 0x8
	bl MenuZeroFillWindowRect
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08146DA4
	ldr r1, _08146D44
	ldr r0, _08146D48
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, _08146D4C
	strb r2, [r0]
	b _08146DA4
	.align 2, 0
_08146D44: .4byte gMain
_08146D48: .4byte 0x0000043c
_08146D4C: .4byte gUnknown_02039338
_08146D50:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08146DA4
	movs r0, 0x5
	bl PlaySoundEffect
	ldr r2, _08146D68
	adds r1, r4, r2
	b _08146D82
	.align 2, 0
_08146D68: .4byte 0x0000043c
_08146D6C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
_08146D78:
	bl BeginNormalPaletteFade
_08146D7C:
	ldr r1, _08146D8C
	ldr r0, _08146D90
	adds r1, r0
_08146D82:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08146DA4
	.align 2, 0
_08146D8C: .4byte gMain
_08146D90: .4byte 0x0000043c
_08146D94:
	ldr r0, _08146DFC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08146DA4
	bl DoSoftReset
_08146DA4:
	ldr r0, _08146E00
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08146DE4
	bl IsLinkMaster
	lsls r0, 24
	cmp r0, 0
	bne _08146DE4
	bl CloseLink
	movs r0, 0x6
	movs r1, 0x5
	movs r2, 0x17
	movs r3, 0x8
	bl MenuZeroFillWindowRect
	ldr r4, _08146E04
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_81469AC
	adds r0, r4, 0
	bl sub_8072044
	ldr r0, _08146E08
	ldr r1, _08146E0C
	adds r0, r1
	movs r1, 0xD
	strb r1, [r0]
_08146DE4:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08146DFC: .4byte gPaletteFade
_08146E00: .4byte gLinkStatus
_08146E04: .4byte gStringVar4
_08146E08: .4byte gMain
_08146E0C: .4byte 0x0000043c
	thumb_func_end sub_81469E4

	thumb_func_start fullscreen_save_activate
fullscreen_save_activate: @ 8146E10
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08146E30
	bl SetMainCallback2
	ldr r0, _08146E34
	strh r4, [r0]
	ldr r1, _08146E38
	movs r0, 0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08146E30: .4byte sub_8146E50
_08146E34: .4byte gUnknown_0203933C
_08146E38: .4byte gUnknown_0203933E
	thumb_func_end fullscreen_save_activate

	thumb_func_start sub_8146E3C
sub_8146E3C: @ 8146E3C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8146E3C

	thumb_func_start sub_8146E50
sub_8146E50: @ 8146E50
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	ldr r0, _08146FB0
	ldr r1, _08146FB4
	adds r7, r0, r1
	ldrb r0, [r7]
	cmp r0, 0
	beq _08146E6C
	cmp r0, 0x1
	bne _08146E6C
	b _0814701C
_08146E6C:
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	mov r9, r0
	movs r1, 0
	strh r1, [r0]
	ldr r6, _08146FB8
	strh r1, [r6]
	adds r0, 0xC
	mov r8, r0
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	ldr r5, _08146FBC
	strh r1, [r5]
	adds r0, 0x12
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
	add r0, sp, 0x4
	strh r1, [r0]
	ldr r2, _08146FC0
	str r0, [r2]
	movs r1, 0xC0
	lsls r1, 19
	str r1, [r2, 0x4]
	ldr r0, _08146FC4
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r4, 0
	str r4, [sp, 0x8]
	add r0, sp, 0x8
	str r0, [r2]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r2, 0x4]
	ldr r0, _08146FC8
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	add r0, sp, 0x4
	strh r4, [r0]
	str r0, [r2]
	movs r0, 0xA0
	lsls r0, 19
	str r0, [r2, 0x4]
	ldr r0, _08146FCC
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _08146FD0
	bl LZ77UnCompVram
	ldr r0, _08146FD4
	ldr r1, _08146FD8
	bl LZ77UnCompVram
	ldr r0, _08146FDC
	ldr r1, _08146FE0
	bl LZ77UnCompVram
	ldr r0, _08146FE4
	ldr r1, _08146FE8
	bl LZ77UnCompVram
	bl ResetSpriteData
	bl ResetTasks
	bl ResetPaletteFade
	ldr r0, _08146FEC
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _08146FF0
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08146FF4
	bl SetUpWindowConfig
	ldr r0, _08146FF8
	bl InitMenuWindow
	.if REVISION >= 1
	movs r0, 0xD
	movs r1, 0x6
	movs r2, 0x10
	movs r3, 0x9
	.else
	movs r0, 0xD
	movs r1, 0x8
	movs r2, 0x10
	movs r3, 0xB
	.endif
	bl MenuDrawTextWindow
	.if REVISION >= 1
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	.else
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0x13
	.endif
	bl MenuDrawTextWindow
	ldr r0, _08146FFC
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r3, _08147000
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _08147004
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08147008
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0814700C
	bl SetVBlankCallback
	ldr r1, _08147010
	adds r0, r1, 0
	strh r0, [r6]
	ldr r1, _08147014
	adds r0, r1, 0
	mov r1, r8
	strh r0, [r1]
	ldr r1, _08147018
	adds r0, r1, 0
	strh r0, [r5]
	movs r1, 0xEA
	lsls r1, 5
	adds r0, r1, 0
	mov r1, r9
	strh r0, [r1]
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	b _08147032
	.align 2, 0
_08146FB0: .4byte gMain
_08146FB4: .4byte 0x0000043c
_08146FB8: .4byte REG_BG3CNT
_08146FBC: .4byte REG_BG0CNT
_08146FC0: .4byte 0x040000d4
_08146FC4: .4byte 0x8100c000
_08146FC8: .4byte 0x85000100
_08146FCC: .4byte 0x81000200
_08146FD0: .4byte gUnknown_083F66F0
_08146FD4: .4byte gBirchBagTilemap
_08146FD8: .4byte 0x06003000
_08146FDC: .4byte gBirchGrassTilemap
_08146FE0: .4byte 0x06003800
_08146FE4: .4byte gUnknown_08411980
_08146FE8: .4byte 0x06010020
_08146FEC: .4byte gUnknown_083F62EC
_08146FF0: .4byte gUnknown_08411960
_08146FF4: .4byte gWindowConfig_81E6C3C
_08146FF8: .4byte gWindowConfig_81E6CE4
_08146FFC: .4byte gSystemText_SaveFailedBackupCheck
_08147000: .4byte 0x04000208
_08147004: .4byte 0x04000200
_08147008: .4byte REG_DISPSTAT
_0814700C: .4byte sub_8146E3C
_08147010: .4byte 0x00000703
_08147014: .4byte 0x00000602
_08147018: .4byte 0x00001f08
_0814701C:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08147032
	ldr r0, _08147040
	bl SetMainCallback2
	ldr r0, _08147044
	bl SetVBlankCallback
_08147032:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08147040: .4byte sub_8147048
_08147044: .4byte sub_8147218
	thumb_func_end sub_8146E50

	thumb_func_start sub_8147048
sub_8147048: @ 8147048
	push {r4,r5,lr}
	movs r4, 0
	ldr r0, _081470C8
	movs r1, 0x1
	strh r1, [r0]
	ldr r1, _081470CC
	ldr r0, [r1]
	cmp r0, 0
	beq _081470A6
	adds r5, r1, 0
_0814705C:
	ldr r0, [r5]
	bl sub_814737C
	lsls r0, 24
	cmp r0, 0
	bne _0814710C
	.if REVISION >= 1
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	.else
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0x13
	.endif
	bl MenuDrawTextWindow
	ldr r0, _081470D0
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
	ldr r0, _081470D4
	ldrb r0, [r0]
	bl sub_8125C3C
	ldr r0, [r5]
	cmp r0, 0
	beq _08147096
	ldr r0, _081470D8
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
_08147096:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, [r5]
	cmp r0, 0
	beq _081470A6
	cmp r4, 0x2
	bls _0814705C
_081470A6:
	cmp r4, 0x3
	bne _081470E4
	.if REVISION >= 1
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	.else
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0x13
	.endif
	bl MenuDrawTextWindow
	ldr r0, _081470DC
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
	ldr r0, _081470E0
	bl SetMainCallback2
	b _0814713E
	.align 2, 0
_081470C8: .4byte gUnknown_0203933E
_081470CC: .4byte gUnknown_03005EA8
_081470D0: .4byte gSystemText_CheckCompleteSaveAttempt
_081470D4: .4byte gUnknown_0203933C
_081470D8: .4byte gSystemText_SaveFailedBackupCheck
_081470DC: .4byte gSystemText_BackupDamagedGameContinue
_081470E0: .4byte sub_81471A4
_081470E4:
	.if REVISION >= 1
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	.else
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0x13
	.endif
	bl MenuDrawTextWindow
	ldr r0, _08147104
	ldr r0, [r0]
	cmp r0, 0
	bne _08147134
	ldr r0, _08147108
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
	b _0814713E
	.align 2, 0
_08147104: .4byte gUnknown_03005EBC
_08147108: .4byte gSystemText_SaveCompletedGameEnd
_0814710C:
	.if REVISION >= 1
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	.else
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0x13
	.endif
	bl MenuDrawTextWindow
	ldr r0, _0814712C
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
	ldr r0, _08147130
	bl SetMainCallback2
	b _08147144
	.align 2, 0
_0814712C: .4byte gSystemText_BackupDamagedGameContinue
_08147130: .4byte sub_8147154
_08147134:
	ldr r0, _0814714C
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
_0814713E:
	ldr r0, _08147150
	bl SetMainCallback2
_08147144:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814714C: .4byte gSystemText_SaveCompletedPressA
_08147150: .4byte sub_81471A4
	thumb_func_end sub_8147048

	thumb_func_start sub_8147154
sub_8147154: @ 8147154
	push {lr}
	ldr r1, _08147190
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08147194
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0814718A
	.if REVISION >= 1
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	.else
	movs r0, 0x1
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0x13
	.endif
	bl MenuDrawTextWindow
	ldr r0, _08147198
	.if REVISION >= 1
	movs r1, 0x2
	movs r2, 0xB
	.else
	movs r1, 0x2
	movs r2, 0xD
	.endif
	bl MenuPrint
	ldr r0, _0814719C
	bl SetVBlankCallback
	ldr r0, _081471A0
	bl SetMainCallback2
_0814718A:
	pop {r0}
	bx r0
	.align 2, 0
_08147190: .4byte gUnknown_0203933E
_08147194: .4byte gMain
_08147198: .4byte gSystemText_GameplayEnded
_0814719C: .4byte sub_8146E3C
_081471A0: .4byte sub_81471A4
	thumb_func_end sub_8147154

	thumb_func_start sub_81471A4
sub_81471A4: @ 81471A4
	push {lr}
	sub sp, 0x4
	ldr r0, _081471DC
	movs r2, 0
	strh r2, [r0]
	ldr r0, _081471E0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081471D4
	movs r0, 0x1
	negs r0, r0
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _081471E4
	bl SetVBlankCallback
	ldr r0, _081471E8
	bl SetMainCallback2
_081471D4:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_081471DC: .4byte gUnknown_0203933E
_081471E0: .4byte gMain
_081471E4: .4byte sub_8146E3C
_081471E8: .4byte sub_81471EC
	thumb_func_end sub_81471A4

	thumb_func_start sub_81471EC
sub_81471EC: @ 81471EC
	push {r4,r5,lr}
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08147212
	ldr r5, _08147208
	ldr r0, [r5]
	cmp r0, 0
	bne _0814720C
	bl DoSoftReset
	b _08147212
	.align 2, 0
_08147208: .4byte gUnknown_03005EBC
_0814720C:
	bl SetMainCallback2
	str r4, [r5]
_08147212:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81471EC

	thumb_func_start sub_8147218
sub_8147218: @ 8147218
	push {r4,r5,lr}
	ldr r0, _08147290
	mov r12, r0
	ldr r0, [r0, 0x24]
	lsrs r4, r0, 3
	movs r0, 0x7
	ands r4, r0
	ldr r0, _08147294
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	mov r2, r12
	str r0, [r2, 0x3C]
	str r1, [r2, 0x40]
	ldrh r1, [r2, 0x3E]
	ldr r0, _08147298
	ands r0, r1
	movs r1, 0x70
	orrs r0, r1
	strh r0, [r2, 0x3E]
	mov r1, r12
	adds r1, 0x3C
	.if REVISION >= 1
	movs r0, 0x38
	.else
	movs r0, 0x48
	.endif
	strb r0, [r1]
	ldr r0, _0814729C
	ldrh r0, [r0]
	cmp r0, 0
	beq _081472A8
	ldr r3, _081472A0
	lsls r2, r4, 1
	adds r2, r4
	adds r0, r2, r3
	mov r4, r12
	adds r4, 0x40
	ldrb r5, [r0]
	ldrh r1, [r4]
	ldr r0, _081472A4
	ands r0, r1
	orrs r0, r5
	strh r0, [r4]
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r1, 4
	adds r3, 0x1
	adds r2, r3
	ldrb r0, [r2]
	lsls r0, 3
	orrs r1, r0
	mov r3, r12
	adds r3, 0x3F
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _081472B8
	.align 2, 0
_08147290: .4byte gMain
_08147294: .4byte gUnknown_08411940
_08147298: .4byte 0xfffffe00
_0814729C: .4byte gUnknown_0203933E
_081472A0: .4byte gUnknown_08411948
_081472A4: .4byte 0xfffffc00
_081472A8:
	mov r2, r12
	adds r2, 0x40
	ldrh r1, [r2]
	ldr r0, _081472D8
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
_081472B8:
	ldr r0, _081472DC
	movs r1, 0xE0
	lsls r1, 19
	movs r2, 0x1
	bl CpuFastSet
	ldr r1, _081472E0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	beq _081472D0
	subs r0, 0x1
	strh r0, [r1, 0x2]
_081472D0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081472D8: .4byte 0xfffffc00
_081472DC: .4byte gMain + 0x3C
_081472E0: .4byte gUnknown_0203933E
	thumb_func_end sub_8147218

	thumb_func_start sub_81472E4
sub_81472E4: @ 81472E4
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _08147308
	movs r3, 0x80
	lsls r3, 5
	movs r1, 0
	adds r2, r4, 0
	bl ReadFlash
	movs r1, 0
	ldr r2, _0814730C
_081472FC:
	ldr r0, [r4]
	cmp r0, 0
	beq _08147310
	movs r0, 0x1
	b _0814731E
	.align 2, 0
_08147308: .4byte 0x02000000
_0814730C: .4byte 0x000003ff
_08147310:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	adds r4, 0x4
	cmp r1, r2
	bls _081472FC
	movs r0, 0
_0814731E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81472E4

	thumb_func_start sub_8147324
sub_8147324: @ 8147324
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r6, r0, 16
	movs r0, 0
	ldr r1, _08147374
	mov r8, r1
	ldr r7, _08147378
_08147336:
	movs r4, 0
	adds r5, r0, 0x1
_0814733A:
	ldr r3, [r7]
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0
	bl _call_via_r3
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r8
	bls _0814733A
	adds r0, r6, 0
	bl sub_81472E4
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r5, 16
	lsrs r0, 16
	cmp r1, 0
	beq _08147366
	cmp r0, 0x81
	bls _08147336
_08147366:
	adds r0, r1, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08147374: .4byte 0x00000fff
_08147378: .4byte ProgramFlashByte
	thumb_func_end sub_8147324

	thumb_func_start sub_814737C
sub_814737C: @ 814737C
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r6, 0
_08147382:
	movs r4, 0x1
	lsls r4, r6
	adds r0, r5, 0
	ands r0, r4
	cmp r0, 0
	beq _0814739C
	adds r0, r6, 0
	bl sub_8147324
	lsls r0, 24
	cmp r0, 0
	bne _0814739C
	bics r5, r4
_0814739C:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x1F
	bls _08147382
	cmp r5, 0
	beq _081473AE
	movs r0, 0x1
	b _081473B0
_081473AE:
	movs r0, 0
_081473B0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_814737C

	thumb_func_start sub_81473B8
sub_81473B8: @ 81473B8
	push {lr}
	ldr r0, _081473E8
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _08147400
	ldr r2, _081473EC
	ldrh r1, [r2, 0x4]
	ldr r0, _081473F0
	cmp r1, r0
	bne _08147400
	ldr r1, [r2]
	ldr r0, _081473F4
	cmp r1, r0
	beq _081473E4
	ldr r0, _081473F8
	cmp r1, r0
	beq _081473E4
	ldr r0, _081473FC
	cmp r1, r0
	bne _08147400
_081473E4:
	movs r0, 0x1
	b _08147402
	.align 2, 0
_081473E8: .4byte 0x0000084f
_081473EC: .4byte gSaveBlock1
_081473F0: .4byte 0x00004718
_081473F4: .4byte 0x0003000a
_081473F8: .4byte 0x00030009
_081473FC: .4byte 0x0003000b
_08147400:
	movs r0, 0
_08147402:
	pop {r1}
	bx r1
	thumb_func_end sub_81473B8

	thumb_func_start sub_8147408
sub_8147408: @ 8147408
	push {lr}
	ldr r2, _08147460
	movs r0, 0x10
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _08147464
	movs r0, 0x11
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	movs r2, 0x8B
	lsls r2, 2
	movs r0, 0x12
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _08147468
	movs r0, 0x10
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	ldr r2, _0814746C
	movs r0, 0x11
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	ldr r2, _08147470
	movs r0, 0x12
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, 0x14
	bl PlaySoundEffect
	ldr r0, _08147474
	bl FlagSet
	bl ScriptContext2_Disable
	pop {r0}
	bx r0
	.align 2, 0
_08147460: .4byte 0x0000022a
_08147464: .4byte 0x0000022b
_08147468: .4byte 0x00000e32
_0814746C: .4byte 0x00000233
_08147470: .4byte 0x00000e34
_08147474: .4byte 0x0000084f
	thumb_func_end sub_8147408

	thumb_func_start sub_8147478
sub_8147478: @ 8147478
	push {r4,lr}
	ldr r4, _081474B4
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	ldr r1, _081474B8
	cmp r0, r1
	bne _081474C0
	bl CalculatePlayerPartyCount
	ldr r0, _081474BC
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	adds r1, r4, 0
	subs r1, 0x64
	adds r0, r1
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	movs r1, 0x9D
	lsls r1, 1
	cmp r0, r1
	bne _081474C0
	movs r0, 0x1
	b _081474C2
	.align 2, 0
_081474B4: .4byte gPlayerParty
_081474B8: .4byte 0x0000017d
_081474BC: .4byte gPlayerPartyCount
_081474C0:
	movs r0, 0
_081474C2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8147478

	thumb_func_start sub_81474C8
sub_81474C8: @ 81474C8
	push {lr}
	movs r0, 0x85
	lsls r0, 4
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0814750C
	ldr r2, _081474FC
	ldrh r1, [r2, 0x4]
	movs r0, 0xC3
	lsls r0, 3
	cmp r1, r0
	bne _0814750C
	ldr r1, [r2]
	ldr r0, _08147500
	cmp r1, r0
	beq _081474F8
	ldr r0, _08147504
	cmp r1, r0
	beq _081474F8
	ldr r0, _08147508
	cmp r1, r0
	bne _0814750C
_081474F8:
	movs r0, 0x1
	b _0814750E
	.align 2, 0
_081474FC: .4byte gSaveBlock1
_08147500: .4byte 0x0017000a
_08147504: .4byte 0x00170009
_08147508: .4byte 0x0017000b
_0814750C:
	movs r0, 0
_0814750E:
	pop {r1}
	bx r1
	thumb_func_end sub_81474C8

	thumb_func_start sub_8147514
sub_8147514: @ 8147514
	push {lr}
	movs r0, 0x28
	bl FieldEffectActiveListRemove
	ldr r2, _08147574
	movs r0, 0xE
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	ldr r2, _08147578
	movs r0, 0xF
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	movs r2, 0x8B
	lsls r2, 2
	movs r0, 0x10
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	ldr r2, _0814757C
	movs r0, 0xE
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	ldr r2, _08147580
	movs r0, 0xF
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	ldr r2, _08147584
	movs r0, 0x10
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, 0x14
	bl PlaySoundEffect
	movs r0, 0x85
	lsls r0, 4
	bl FlagSet
	bl ScriptContext2_Disable
	pop {r0}
	bx r0
	.align 2, 0
_08147574: .4byte 0x0000022a
_08147578: .4byte 0x0000022b
_0814757C: .4byte 0x00000e32
_08147580: .4byte 0x00000233
_08147584: .4byte 0x00000e34
	thumb_func_end sub_8147514

	thumb_func_start sub_8147588
sub_8147588: @ 8147588
	push {lr}
	ldr r0, _081475AC
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _081475BC
	ldr r2, _081475B0
	ldrh r1, [r2, 0x4]
	ldr r0, _081475B4
	cmp r1, r0
	bne _081475BC
	ldr r1, [r2]
	ldr r0, _081475B8
	cmp r1, r0
	bne _081475BC
	movs r0, 0x1
	b _081475BE
	.align 2, 0
_081475AC: .4byte 0x00000852
_081475B0: .4byte gSaveBlock1
_081475B4: .4byte 0x00004418
_081475B8: .4byte 0x00190008
_081475BC:
	movs r0, 0
_081475BE:
	pop {r1}
	bx r1
	thumb_func_end sub_8147588

	thumb_func_start sub_81475C4
sub_81475C4: @ 81475C4
	push {lr}
	ldr r0, _081475D8
	ldr r1, _081475DC
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x3C
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_081475D8: .4byte gUnknown_0202FF84
_081475DC: .4byte gUnknown_03005CE0
	thumb_func_end sub_81475C4

	thumb_func_start FldEff_UseFlyAncientTomb
FldEff_UseFlyAncientTomb: @ 81475E0
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08147604
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _08147608
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08147604: .4byte gTasks
_08147608: .4byte sub_814760C
	thumb_func_end FldEff_UseFlyAncientTomb

	thumb_func_start sub_814760C
sub_814760C: @ 814760C
	push {lr}
	movs r0, 0x3C
	bl FieldEffectActiveListRemove
	bl sub_814761C
	pop {r0}
	bx r0
	thumb_func_end sub_814760C

	thumb_func_start sub_814761C
sub_814761C: @ 814761C
	push {lr}
	ldr r2, _08147674
	movs r0, 0xE
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	ldr r2, _08147678
	movs r0, 0xF
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	movs r2, 0x8B
	lsls r2, 2
	movs r0, 0x10
	movs r1, 0x1A
	bl MapGridSetMetatileIdAt
	ldr r2, _0814767C
	movs r0, 0xE
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	ldr r2, _08147680
	movs r0, 0xF
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	ldr r2, _08147684
	movs r0, 0x10
	movs r1, 0x1B
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	movs r0, 0x14
	bl PlaySoundEffect
	ldr r0, _08147688
	bl FlagSet
	bl ScriptContext2_Disable
	pop {r0}
	bx r0
	.align 2, 0
_08147674: .4byte 0x0000022a
_08147678: .4byte 0x0000022b
_0814767C: .4byte 0x00000e32
_08147680: .4byte 0x00000233
_08147684: .4byte 0x00000e34
_08147688: .4byte 0x00000852
	thumb_func_end sub_814761C

	thumb_func_start sub_814768C
sub_814768C: @ 814768C
	push {lr}
	ldr r0, _081476A8
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _081476A2
	ldr r0, _081476AC
	movs r1, 0x50
	bl CreateTask
_081476A2:
	pop {r0}
	bx r0
	.align 2, 0
_081476A8: .4byte 0x00000851
_081476AC: .4byte sub_81476B0
	thumb_func_end sub_814768C

	thumb_func_start sub_81476B0
sub_81476B0: @ 81476B0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _081476D4
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bhi _0814776A
	lsls r0, 2
	ldr r1, _081476D8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081476D4: .4byte gUnknown_03004B28
_081476D8: .4byte _081476DC
	.align 2, 0
_081476DC:
	.4byte _081476F0
	.4byte _081476FE
	.4byte _08147730
	.4byte _08147748
	.4byte _0814775A
_081476F0:
	movs r1, 0xE1
	lsls r1, 5
	adds r0, r1, 0
	strh r0, [r4, 0x2]
	movs r0, 0x1
	strh r0, [r4]
	b _0814776A
_081476FE:
	bl sub_8147774
	cmp r0, 0
	beq _08147716
	bl MenuZeroFillScreen
	movs r0, 0x5
	bl PlaySoundEffect
	movs r0, 0x2
	strh r0, [r4]
	b _0814776A
_08147716:
	ldrh r0, [r4, 0x2]
	subs r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	cmp r0, 0
	bne _0814776A
	bl MenuZeroFillScreen
	movs r0, 0x3
	strh r0, [r4]
	movs r0, 0x1E
	strh r0, [r4, 0x2]
	b _0814776A
_08147730:
	bl sub_8147774
	cmp r0, 0
	beq _08147748
	bl sub_8064E2C
	adds r0, r5, 0
	bl DestroyTask
	bl ScriptContext2_Disable
	b _0814776A
_08147748:
	ldrh r0, [r4, 0x2]
	subs r0, 0x1
	strh r0, [r4, 0x2]
	lsls r0, 16
	cmp r0, 0
	bne _0814776A
	movs r0, 0x4
	strh r0, [r4]
	b _0814776A
_0814775A:
	bl sub_8064E2C
	ldr r0, _08147770
	bl ScriptContext1_SetupScript
	adds r0, r5, 0
	bl DestroyTask
_0814776A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08147770: .4byte gUnknown_0815EF19
	thumb_func_end sub_81476B0

	thumb_func_start sub_8147774
sub_8147774: @ 8147774
	push {lr}
	movs r1, 0xFF
	ldr r0, _081477A4
	ldrb r2, [r0, 0x13]
	cmp r2, 0x1
	bne _08147788
	movs r3, 0xC0
	lsls r3, 2
	adds r0, r3, 0
	orrs r1, r0
_08147788:
	cmp r2, 0x2
	bne _08147794
	movs r2, 0x80
	lsls r2, 2
	adds r0, r2, 0
	orrs r1, r0
_08147794:
	ldr r0, _081477A8
	ldrh r0, [r0, 0x2E]
	ands r1, r0
	cmp r1, 0
	bne _081477AC
	movs r0, 0
	b _081477AE
	.align 2, 0
_081477A4: .4byte gSaveBlock2
_081477A8: .4byte gMain
_081477AC:
	movs r0, 0x1
_081477AE:
	pop {r1}
	bx r1
	thumb_func_end sub_8147774

	thumb_func_start sub_81477B4
sub_81477B4: @ 81477B4
	push {lr}
	ldr r0, _081477E8
	movs r1, 0x9
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081477EC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0xA]
	strh r0, [r1, 0xC]
	movs r0, 0x2
	strh r0, [r1, 0x10]
	movs r0, 0x5
	strh r0, [r1, 0x12]
	movs r0, 0x32
	strh r0, [r1, 0x14]
	movs r0, 0
	bl SetCameraPanningCallback
	pop {r0}
	bx r0
	.align 2, 0
_081477E8: .4byte sub_814782C
_081477EC: .4byte gTasks
	thumb_func_end sub_81477B4

	thumb_func_start sub_81477F0
sub_81477F0: @ 81477F0
	push {lr}
	ldr r0, _08147824
	movs r1, 0x9
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08147828
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0xA]
	strh r0, [r1, 0xC]
	movs r0, 0x3
	strh r0, [r1, 0x10]
	movs r0, 0x5
	strh r0, [r1, 0x12]
	movs r0, 0x2
	strh r0, [r1, 0x14]
	movs r0, 0
	bl SetCameraPanningCallback
	pop {r0}
	bx r0
	.align 2, 0
_08147824: .4byte sub_814782C
_08147828: .4byte gTasks
	thumb_func_end sub_81477F0

	thumb_func_start sub_814782C
sub_814782C: @ 814782C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0814788C
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _08147884
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x10]
	negs r0, r0
	strh r0, [r4, 0x10]
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08147884
	adds r0, r5, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	bl InstallCameraPanAheadCallback
_08147884:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814788C: .4byte gTasks
	thumb_func_end sub_814782C

	thumb_func_start sub_8147890
sub_8147890: @ 8147890
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8147890

	thumb_func_start sub_81478A8
sub_81478A8: @ 81478A8
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_81478A8

	thumb_func_start sub_81478BC
sub_81478BC: @ 81478BC
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _081478D8
	ldr r1, _081478DC
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xD
	bls _081478CE
	b _08147AD0
_081478CE:
	lsls r0, 2
	ldr r1, _081478E0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081478D8: .4byte gMain
_081478DC: .4byte 0x0000043c
_081478E0: .4byte _081478E4
	.align 2, 0
_081478E4:
	.4byte _0814791C
	.4byte _08147938
	.4byte _0814794C
	.4byte _08147960
	.4byte _08147966
	.4byte _08147980
	.4byte _0814798C
	.4byte _081479B8
	.4byte _081479DC
	.4byte _081479F4
	.4byte _08147A20
	.4byte _08147A3C
	.4byte _08147A5C
	.4byte _08147A8C
_0814791C:
	bl sub_80F9438
	bl sub_80F9368
	bl sub_8147B04
	ldr r1, _08147930
	ldr r2, _08147934
	adds r1, r2
	b _08147A4A
	.align 2, 0
_08147930: .4byte gMain
_08147934: .4byte 0x0000043c
_08147938:
	bl ResetPaletteFade
	ldr r2, _08147948
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	b _08147A44
	.align 2, 0
_08147948: .4byte gPaletteFade
_0814794C:
	bl ResetSpriteData
	ldr r1, _08147958
	ldr r2, _0814795C
	adds r1, r2
	b _08147A4A
	.align 2, 0
_08147958: .4byte gMain
_0814795C: .4byte 0x0000043c
_08147960:
	bl FreeAllSpritePalettes
	b _08147A44
_08147966:
	ldr r0, _08147974
	bl SetUpWindowConfig
	ldr r1, _08147978
	ldr r2, _0814797C
	adds r1, r2
	b _08147A4A
	.align 2, 0
_08147974: .4byte gWindowConfig_81E6E50
_08147978: .4byte gMain
_0814797C: .4byte 0x0000043c
_08147980:
	ldr r0, _08147988
	bl MultistepInitMenuWindowBegin
	b _08147A44
	.align 2, 0
_08147988: .4byte gWindowConfig_81E6E50
_0814798C:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _08147996
	b _08147AD0
_08147996:
	ldr r0, _081479A8
	ldr r1, _081479AC
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r1, _081479B0
	ldr r2, _081479B4
	adds r1, r2
	b _08147A4A
	.align 2, 0
_081479A8: .4byte 0x02000000
_081479AC: .4byte 0x0001ffff
_081479B0: .4byte gMain
_081479B4: .4byte 0x0000043c
_081479B8:
	ldr r0, _081479D4
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _081479D8
	adds r0, r1
	bl sub_8147B20
	lsls r0, 24
	cmp r0, 0
	bne _081479D0
	b _08147AD0
_081479D0:
	b _08147A44
	.align 2, 0
_081479D4: .4byte gUnknown_02039310
_081479D8: .4byte gPlayerParty
_081479DC:
	bl sub_81480B4
	ldr r1, _081479EC
	ldr r2, _081479F0
	adds r1, r2
	strb r0, [r1]
	b _08147A44
	.align 2, 0
_081479EC: .4byte 0x02000000
_081479F0: .4byte 0x0001fffd
_081479F4:
	ldr r0, _08147A10
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08147A14
	adds r0, r1
	bl sub_8147F84
	ldr r1, _08147A18
	ldr r2, _08147A1C
	adds r1, r2
	strb r0, [r1]
	b _08147A44
	.align 2, 0
_08147A10: .4byte gUnknown_02039310
_08147A14: .4byte gPlayerParty
_08147A18: .4byte 0x02000000
_08147A1C: .4byte 0x0001fffe
_08147A20:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r1, _08147A34
	ldr r2, _08147A38
	adds r1, r2
	b _08147A4A
	.align 2, 0
_08147A34: .4byte gMain
_08147A38: .4byte 0x0000043c
_08147A3C:
	bl sub_8055870
	cmp r0, 0x1
	beq _08147AD0
_08147A44:
	ldr r1, _08147A54
	ldr r0, _08147A58
	adds r1, r0
_08147A4A:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08147AD0
	.align 2, 0
_08147A54: .4byte gMain
_08147A58: .4byte 0x0000043c
_08147A5C:
	ldr r3, _08147AB0
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _08147AB4
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08147AB8
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08147ABC
	bl SetVBlankCallback
	ldr r1, _08147AC0
	ldr r2, _08147AC4
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08147A8C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _08147AC8
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _08147ACC
	bl SetMainCallback2
	movs r0, 0x1
	b _08147AD2
	.align 2, 0
_08147AB0: .4byte 0x04000208
_08147AB4: .4byte 0x04000200
_08147AB8: .4byte REG_DISPSTAT
_08147ABC: .4byte sub_81478A8
_08147AC0: .4byte gMain
_08147AC4: .4byte 0x0000043c
_08147AC8: .4byte gPaletteFade
_08147ACC: .4byte sub_8147890
_08147AD0:
	movs r0, 0
_08147AD2:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81478BC

	thumb_func_start sub_8147ADC
sub_8147ADC: @ 8147ADC
	push {lr}
_08147ADE:
	bl sub_81478BC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08147AF2
	movs r0, 0x1
	bl sub_8147DDC
	b _08147AFE
_08147AF2:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08147ADE
_08147AFE:
	pop {r0}
	bx r0
	thumb_func_end sub_8147ADC

	thumb_func_start sub_8147B04
sub_8147B04: @ 8147B04
	ldr r1, _08147B18
	ldr r2, _08147B1C
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	movs r2, 0x9A
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08147B18: .4byte REG_BG1CNT
_08147B1C: .4byte 0x00001d02
	thumb_func_end sub_8147B04

	thumb_func_start sub_8147B20
sub_8147B20: @ 8147B20
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r0, _08147B40
	ldr r1, _08147B44
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x8
	bls _08147B34
	b _08147C84
_08147B34:
	lsls r0, 2
	ldr r1, _08147B48
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08147B40: .4byte 0x02000000
_08147B44: .4byte 0x0001ffff
_08147B48: .4byte _08147B4C
	.align 2, 0
_08147B4C:
	.4byte _08147B70
	.4byte _08147BB8
	.4byte _08147BF0
	.4byte _08147BFC
	.4byte _08147C08
	.4byte _08147C14
	.4byte _08147C2C
	.4byte _08147C38
	.4byte _08147C60
_08147B70:
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	lsls r0, r5, 3
	ldr r1, _08147BAC
	adds r0, r1
	ldr r1, _08147BB0
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08147BB4
	ldr r4, [r4, 0x4]
	str r4, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	bl sub_800D334
	b _08147C40
	.align 2, 0
_08147BAC: .4byte gMonFrontPicTable
_08147BB0: .4byte gMonFrontPicCoords
_08147BB4: .4byte gUnknown_081FAF4C
_08147BB8:
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	adds r1, r0, 0
	adds r0, r5, 0
	adds r2, r6, 0
	bl sub_80409C8
	adds r4, r0, 0
	bl LoadCompressedObjectPalette
	ldrh r0, [r4, 0x4]
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	b _08147C40
_08147BF0:
	ldr r0, _08147BF8
	bl LoadCompressedObjectPic
	b _08147C40
	.align 2, 0
_08147BF8: .4byte gUnknown_083F7F74
_08147BFC:
	ldr r0, _08147C04
	bl LoadCompressedObjectPalette
	b _08147C40
	.align 2, 0
_08147C04: .4byte gUnknown_083F7F7C
_08147C08:
	ldr r0, _08147C10
	bl LoadCompressedObjectPic
	b _08147C40
	.align 2, 0
_08147C10: .4byte gUnknown_084121DC
_08147C14:
	ldr r0, _08147C24
	ldrb r0, [r0]
	bl sub_8147C90
	ldr r0, _08147C28
	bl LoadCompressedObjectPalette
	b _08147C40
	.align 2, 0
_08147C24: .4byte word_203855E
_08147C28: .4byte gUnknown_02039350
_08147C2C:
	ldr r0, _08147C34
	movs r1, 0xC0
	lsls r1, 19
	b _08147C3C
	.align 2, 0
_08147C34: .4byte gBattleTerrainTiles_Building
_08147C38:
	ldr r0, _08147C50
	ldr r1, _08147C54
_08147C3C:
	bl LZDecompressVram
_08147C40:
	ldr r1, _08147C58
	ldr r0, _08147C5C
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08147C84
	.align 2, 0
_08147C50: .4byte gUnknown_08E782FC
_08147C54: .4byte 0x0600e800
_08147C58: .4byte 0x02000000
_08147C5C: .4byte 0x0001ffff
_08147C60:
	ldr r0, _08147C78
	movs r1, 0x20
	movs r2, 0x60
	bl LoadCompressedPalette
	ldr r0, _08147C7C
	ldr r1, _08147C80
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _08147C86
	.align 2, 0
_08147C78: .4byte gBattleTerrainPalette_BattleTower
_08147C7C: .4byte 0x02000000
_08147C80: .4byte 0x0001ffff
_08147C84:
	movs r0, 0
_08147C86:
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8147B20

	thumb_func_start sub_8147C90
sub_8147C90: @ 8147C90
	push {lr}
	lsls r0, 24
	lsrs r0, 21
	ldr r1, _08147CB8
	adds r0, r1
	movs r1, 0
	bl sub_810CA9C
	lsls r0, 24
	ldr r2, _08147CBC
	ldr r1, _08147CC0
	lsrs r0, 22
	subs r0, 0x4
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _08147CC4
	strh r0, [r2, 0x4]
	pop {r0}
	bx r0
	.align 2, 0
_08147CB8: .4byte gSaveBlock1 + 0x7F8
_08147CBC: .4byte gUnknown_02039350
_08147CC0: .4byte gUnknown_084120A4
_08147CC4: .4byte 0x000039e2
	thumb_func_end sub_8147C90

	thumb_func_start sub_8147CC8
sub_8147CC8: @ 8147CC8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08147D00
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08147CDC
	b _08147DCE
_08147CDC:
	ldr r0, _08147D04
	lsls r2, r4, 2
	adds r1, r2, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x8
	ldrsh r3, [r1, r0]
	ldr r0, _08147D08
	adds r5, r2, 0
	cmp r3, r0
	beq _08147D50
	cmp r3, r0
	bgt _08147D0C
	cmp r3, 0
	beq _08147D20
	cmp r3, 0xFF
	beq _08147D38
	b _08147D8C
	.align 2, 0
_08147D00: .4byte gPaletteFade
_08147D04: .4byte gTasks
_08147D08: .4byte 0x0000010d
_08147D0C:
	ldr r0, _08147D1C
	cmp r3, r0
	beq _08147D68
	adds r0, 0x10
	cmp r3, r0
	beq _08147D80
	b _08147D8C
	.align 2, 0
_08147D1C: .4byte 0x00000119
_08147D20:
	ldr r0, _08147D30
	strb r3, [r0]
	ldr r0, _08147D34
	strh r3, [r0]
	bl sub_81481DC
	b _08147D8C
	.align 2, 0
_08147D30: .4byte gUnknown_03005F3C
_08147D34: .4byte gUnknown_03005F94
_08147D38:
	ldr r0, _08147D48
	ldr r2, _08147D4C
	adds r0, r2
	ldrb r0, [r0]
	ldrb r1, [r1, 0xA]
	bl sub_8148108
	b _08147D8C
	.align 2, 0
_08147D48: .4byte 0x02000000
_08147D4C: .4byte 0x0001fffd
_08147D50:
	bl sub_814817C
	ldr r1, _08147D60
	ldr r2, _08147D64
	adds r1, r2
	strb r0, [r1]
	b _08147D8C
	.align 2, 0
_08147D60: .4byte 0x02000000
_08147D64: .4byte 0x0001fffc
_08147D68:
	ldr r0, _08147D78
	ldr r1, _08147D7C
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8148044
	b _08147D8C
	.align 2, 0
_08147D78: .4byte 0x02000000
_08147D7C: .4byte 0x0001fffe
_08147D80:
	ldr r0, _08147D88
	str r0, [r1]
	b _08147DCE
	.align 2, 0
_08147D88: .4byte sub_8147E40
_08147D8C:
	ldr r0, _08147DA0
	ldr r1, _08147DA4
	ldrh r2, [r0]
	ldrh r0, [r1]
	cmp r2, r0
	bcs _08147DA8
	bl sub_814825C
	b _08147DB8
	.align 2, 0
_08147DA0: .4byte gUnknown_03005F94
_08147DA4: .4byte gUnknown_03005F34
_08147DA8:
	cmp r2, r0
	bne _08147DB8
	ldr r0, _08147DD4
	adds r1, r5, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0xFE
	strh r0, [r1, 0x8]
_08147DB8:
	ldr r1, _08147DD8
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldr r0, _08147DD4
	adds r1, r5, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_08147DCE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08147DD4: .4byte gTasks
_08147DD8: .4byte gUnknown_03005F94
	thumb_func_end sub_8147CC8

	thumb_func_start sub_8147DDC
sub_8147DDC: @ 8147DDC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08147E08
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08147E0C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r4, [r1, 0xA]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08147E08: .4byte sub_8147CC8
_08147E0C: .4byte gTasks
	thumb_func_end sub_8147DDC

	thumb_func_start sub_8147E10
sub_8147E10: @ 8147E10
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl MenuUpdateWindowText
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08147E30
	ldr r0, _08147E38
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08147E3C
	str r0, [r1]
_08147E30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08147E38: .4byte gTasks
_08147E3C: .4byte sub_8147F4C
	thumb_func_end sub_8147E10

	thumb_func_start sub_8147E40
sub_8147E40: @ 8147E40
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08147E94
	ldrb r1, [r0]
	movs r0, 0x64
	adds r5, r1, 0
	muls r5, r0
	ldr r0, _08147E98
	adds r5, r0
	ldr r0, _08147E9C
	ldrh r4, [r0]
	lsls r4, 3
	ldr r0, _08147EA0
	adds r4, r0
	adds r0, r5, 0
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_810CAE4
	ldr r6, _08147EA4
	strh r0, [r6]
	ldr r1, _08147EA8
	adds r0, r5, 0
	bl GetMonNickname
	ldr r1, _08147EAC
	adds r0, r4, 0
	bl sub_810CB44
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08147EB8
	ldr r0, _08147EB0
	ldr r1, _08147EB4
	bl StringExpandPlaceholders
	b _08147ED8
	.align 2, 0
_08147E94: .4byte gUnknown_02039310
_08147E98: .4byte gPlayerParty
_08147E9C: .4byte word_203855E
_08147EA0: .4byte gSaveBlock1 + 0x7F8
_08147EA4: .4byte gUnknown_02039312
_08147EA8: .4byte gStringVar1
_08147EAC: .4byte gStringVar2
_08147EB0: .4byte gStringVar4
_08147EB4: .4byte gContestStatsText_NormallyAte
_08147EB8:
	cmp r0, 0
	ble _08147ED0
	ldr r0, _08147EC8
	ldr r1, _08147ECC
	bl StringExpandPlaceholders
	b _08147ED8
	.align 2, 0
_08147EC8: .4byte gStringVar4
_08147ECC: .4byte gContestStatsText_HappilyAte
_08147ED0:
	ldr r0, _08147EF8
	ldr r1, _08147EFC
	bl StringExpandPlaceholders
_08147ED8:
	ldr r0, _08147EF8
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r1, _08147F00
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _08147F04
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08147EF8: .4byte gStringVar4
_08147EFC: .4byte gContestStatsText_DisdainfullyAte
_08147F00: .4byte gTasks
_08147F04: .4byte sub_8147E10
	thumb_func_end sub_8147E40

	thumb_func_start sub_8147F08
sub_8147F08: @ 8147F08
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08147F3C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08147F34
	ldr r0, _08147F40
	ldr r1, _08147F44
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	ldr r0, _08147F48
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08147F34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08147F3C: .4byte gPaletteFade
_08147F40: .4byte gMPlay_BkgndMusic
_08147F44: .4byte 0x0000ffff
_08147F48: .4byte gMain
	thumb_func_end sub_8147F08

	thumb_func_start sub_8147F4C
sub_8147F4C: @ 8147F4C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08147F7C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08147F80
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08147F7C: .4byte gTasks
_08147F80: .4byte sub_8147F08
	thumb_func_end sub_8147F4C

	thumb_func_start sub_8147F84
sub_8147F84: @ 8147F84
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	movs r1, 0x41
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08148024
	movs r1, 0x30
	movs r2, 0x50
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _08148028
	strh r4, [r0]
	ldr r0, _0814802C
	mov r1, r8
	strb r1, [r0]
	adds r0, r5, 0
	bl GetNature
	ldr r1, _08148030
	strb r0, [r1]
	ldr r7, _08148034
	mov r1, r8
	lsls r0, r1, 4
	add r0, r8
	lsls r5, r0, 2
	adds r6, r5, r7
	strh r4, [r6, 0x32]
	adds r0, r7, 0
	adds r0, 0x1C
	adds r0, r5, r0
	ldr r1, _08148038
	str r1, [r0]
	ldr r0, _0814803C
	mov r9, r0
	movs r0, 0x1
	mov r1, r9
	strb r0, [r1]
	adds r0, r4, 0
	bl sub_8040A3C
	lsls r0, 24
	cmp r0, 0
	bne _08148016
	adds r0, r7, 0
	adds r0, 0x10
	adds r0, r5, r0
	ldr r1, _08148040
	str r1, [r0]
	ldrb r3, [r6, 0x1]
	movs r0, 0x3
	orrs r3, r0
	strb r3, [r6, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r6, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r6, 0
	bl CalcCenterToCornerVec
	movs r0, 0
	mov r1, r9
	strb r0, [r1]
_08148016:
	mov r0, r8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08148024: .4byte gUnknown_02024E8C
_08148028: .4byte gUnknown_03005F24
_0814802C: .4byte gUnknown_03005F2C
_08148030: .4byte gUnknown_03005F30
_08148034: .4byte gSprites
_08148038: .4byte SpriteCallbackDummy
_0814803C: .4byte gUnknown_03005F28
_08148040: .4byte gSpriteAffineAnimTable_84120EC
	thumb_func_end sub_8147F84

	thumb_func_start sub_8148044
sub_8148044: @ 8148044
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0814806C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r2, r1, r3
	movs r0, 0x30
	strh r0, [r2, 0x20]
	movs r0, 0x50
	strh r0, [r2, 0x22]
	ldr r0, _08148070
	strh r0, [r2, 0x2E]
	movs r0, 0x1
	strh r0, [r2, 0x30]
	adds r3, 0x1C
	adds r1, r3
	ldr r0, _08148074
	str r0, [r1]
	bx lr
	.align 2, 0
_0814806C: .4byte gSprites
_08148070: .4byte 0x0000fff8
_08148074: .4byte sub_8148078
	thumb_func_end sub_8148044

	thumb_func_start sub_8148078
sub_8148078: @ 8148078
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	adds r0, 0x4
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x2E]
	ldrh r2, [r4, 0x22]
	adds r1, r0, r2
	strh r1, [r4, 0x22]
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _0814809E
	ldrh r0, [r4, 0x32]
	movs r1, 0
	bl PlayCry1
_0814809E:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x9
	bne _081480AA
	ldr r0, _081480B0
	str r0, [r4, 0x1C]
_081480AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081480B0: .4byte SpriteCallbackDummy
	thumb_func_end sub_8148078

	thumb_func_start sub_81480B4
sub_81480B4: @ 81480B4
	push {r4,r5,lr}
	movs r0, 0xBC
	movs r1, 0x64
	movs r2, 0x2
	bl sub_810BA50
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _081480FC
	lsls r3, r4, 4
	adds r3, r4
	lsls r3, 2
	adds r0, r3, r5
	ldrb r2, [r0, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0, 0x1]
	adds r1, r5, 0
	adds r1, 0x10
	adds r1, r3, r1
	ldr r2, _08148100
	str r2, [r1]
	adds r5, 0x1C
	adds r3, r5
	ldr r1, _08148104
	str r1, [r3]
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081480FC: .4byte gSprites
_08148100: .4byte gSpriteAffineAnimTable_84121A0
_08148104: .4byte SpriteCallbackDummy
	thumb_func_end sub_81480B4

	thumb_func_start sub_8148108
sub_8148108: @ 8148108
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08148148
	mov r8, r0
	lsls r0, r7, 4
	adds r0, r7
	lsls r6, r0, 2
	mov r0, r8
	adds r4, r6, r0
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	cmp r5, 0
	bne _08148150
	mov r0, r8
	adds r0, 0x10
	adds r0, r6, r0
	ldr r1, _0814814C
	b _08148158
	.align 2, 0
_08148148: .4byte gSprites
_0814814C: .4byte gSpriteAffineAnimTable_84121A4
_08148150:
	mov r0, r8
	adds r0, 0x10
	adds r0, r6, r0
	ldr r1, _08148174
_08148158:
	str r1, [r0]
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	ldr r1, _08148178
	adds r0, r1
	bl InitSpriteAffineAnim
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08148174: .4byte gSpriteAffineAnimTable_84121A8
_08148178: .4byte gSprites
	thumb_func_end sub_8148108

	thumb_func_start sub_814817C
sub_814817C: @ 814817C
	push {lr}
	ldr r0, _081481A4
	movs r1, 0xAE
	movs r2, 0x54
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081481A8
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldr r2, _081481AC
	strh r2, [r1, 0x2E]
	movs r2, 0x1
	strh r2, [r1, 0x30]
	pop {r1}
	bx r1
	.align 2, 0
_081481A4: .4byte gSpriteTemplate_84121E4
_081481A8: .4byte gSprites
_081481AC: .4byte 0x0000fff4
	thumb_func_end sub_814817C

	thumb_func_start sub_81481B0
sub_81481B0: @ 81481B0
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x20]
	subs r0, 0x4
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x2E]
	ldrh r3, [r2, 0x22]
	adds r1, r0, r3
	strh r1, [r2, 0x22]
	ldrh r1, [r2, 0x30]
	adds r0, r1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _081481D6
	adds r0, r2, 0
	bl DestroySprite
_081481D6:
	pop {r0}
	bx r0
	thumb_func_end sub_81481B0

	thumb_func_start sub_81481DC
sub_81481DC: @ 81481DC
	push {r4-r7,lr}
	ldr r6, _0814824C
	movs r0, 0x1
	strh r0, [r6]
	ldr r1, _08148250
	ldr r0, _08148254
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrb r3, [r0]
	movs r4, 0
	ldr r2, _08148258
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
	adds r7, r2, 0
	adds r7, 0x8
	adds r0, r1, r7
	ldrh r0, [r0]
	adds r0, 0x1
	strh r0, [r6]
	adds r5, r2, 0
	adds r5, 0x12
	adds r1, r5
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _08148244
	adds r2, r6, 0
	adds r6, r5, 0
	adds r5, r7, 0
_0814821A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r4, 0x7
	bhi _08148244
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
	adds r0, r1, r5
	ldrh r0, [r0]
	ldrh r7, [r2]
	adds r0, r7
	strh r0, [r2]
	adds r1, r6
	movs r7, 0
	ldrsh r0, [r1, r7]
	cmp r0, 0x1
	bne _0814821A
_08148244:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814824C: .4byte gUnknown_03005F34
_08148250: .4byte gNatureToMonPokeblockAnim
_08148254: .4byte gUnknown_03005F30
_08148258: .4byte gMonPokeblockAnims
	thumb_func_end sub_81481DC

	thumb_func_start sub_814825C
sub_814825C: @ 814825C
	push {lr}
	ldr r0, _08148274
	ldrb r0, [r0]
	cmp r0, 0x5A
	bls _08148268
	b _08148532
_08148268:
	lsls r0, 2
	ldr r1, _08148278
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08148274: .4byte gUnknown_03005F3C
_08148278: .4byte _0814827C
	.align 2, 0
_0814827C:
	.4byte _081483E8
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _0814843C
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _0814847A
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _081484CC
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148524
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
	.4byte _08148532
_081483E8:
	ldr r2, _0814841C
	ldr r1, _08148420
	ldr r0, _08148424
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r2, _08148428
	ldr r0, _0814842C
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08148430
	adds r1, r0
	str r1, [r2]
	ldr r0, _08148434
	movs r2, 0x44
	bl memcpy
	ldr r1, _08148438
	movs r0, 0xA
	strb r0, [r1]
	b _08148532
	.align 2, 0
_0814841C: .4byte gUnknown_03005F40
_08148420: .4byte gNatureToMonPokeblockAnim
_08148424: .4byte gUnknown_03005F30
_08148428: .4byte gUnknown_03005F20
_0814842C: .4byte gUnknown_03005F2C
_08148430: .4byte gSprites
_08148434: .4byte gUnknown_03005F50
_08148438: .4byte gUnknown_03005F3C
_0814843C:
	bl sub_8148540
	ldr r1, _081484A4
	ldr r0, _081484A8
	ldrb r0, [r0]
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08148474
	ldr r3, _081484AC
	ldr r2, [r3]
	ldrb r0, [r2, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldr r2, [r3]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x3]
	ldr r0, [r3]
	ldr r1, _081484B0
	str r1, [r0, 0x10]
	bl InitSpriteAffineAnim
_08148474:
	ldr r1, _081484B4
	movs r0, 0x32
	strb r0, [r1]
_0814847A:
	ldr r1, _081484A4
	ldr r0, _081484A8
	ldrb r0, [r0]
	lsls r0, 1
	adds r1, 0x1
	adds r2, r0, r1
	ldrb r1, [r2]
	cmp r1, 0
	beq _081484EE
	ldr r0, _081484B8
	ldrb r0, [r0]
	cmp r0, 0
	bne _081484BC
	ldr r0, _081484AC
	ldr r0, [r0]
	adds r1, 0xA
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAffineAnim
	b _081484EE
	.align 2, 0
_081484A4: .4byte gNatureToMonPokeblockAnim
_081484A8: .4byte gUnknown_03005F30
_081484AC: .4byte gUnknown_03005F20
_081484B0: .4byte gSpriteAffineAnimTable_8412050
_081484B4: .4byte gUnknown_03005F3C
_081484B8: .4byte gUnknown_03005F28
_081484BC:
	ldr r0, _081484C8
	ldr r0, [r0]
	ldrb r1, [r2]
	bl StartSpriteAffineAnim
	b _081484EE
	.align 2, 0
_081484C8: .4byte gUnknown_03005F20
_081484CC:
	bl sub_81485CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08148532
	ldr r0, _081484F8
	movs r1, 0x12
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08148504
	ldr r1, _081484FC
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_8148540
_081484EE:
	ldr r1, _08148500
	movs r0, 0x3C
	strb r0, [r1]
	b _08148532
	.align 2, 0
_081484F8: .4byte gUnknown_03005FA0
_081484FC: .4byte gUnknown_03005F40
_08148500: .4byte gUnknown_03005F3C
_08148504:
	ldr r0, _0814851C
	ldr r0, [r0]
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldr r1, _08148520
	movs r0, 0x46
	strb r0, [r1]
	b _08148532
	.align 2, 0
_0814851C: .4byte gUnknown_03005F20
_08148520: .4byte gUnknown_03005F3C
_08148524:
	bl sub_8148618
	ldr r0, _08148538
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0814853C
	strb r1, [r0]
_08148532:
	pop {r0}
	bx r0
	.align 2, 0
_08148538: .4byte gUnknown_03005F40
_0814853C: .4byte gUnknown_03005F3C
	thumb_func_end sub_814825C

	thumb_func_start sub_8148540
sub_8148540: @ 8148540
	push {r4-r7,lr}
	movs r4, 0
	ldr r5, _081485B4
	mov r12, r5
	ldr r7, _081485B8
	ldr r6, _081485BC
_0814854C:
	lsls r2, r4, 1
	mov r0, r12
	adds r3, r2, r0
	ldrb r1, [r6]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, r0
	adds r2, r7
	ldrh r0, [r2]
	strh r0, [r3]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _0814854C
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _081485C4
	movs r2, 0
	ldrsh r0, [r5, r2]
	movs r2, 0x4
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x14]
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r2, 0x6
	ldrsh r1, [r5, r2]
	bl Cos
	strh r0, [r5, 0x16]
	ldrh r0, [r5, 0x8]
	strh r0, [r5, 0x18]
	ldr r0, _081485C0
	ldr r1, [r0]
	ldrh r0, [r1, 0x24]
	strh r0, [r5, 0x1A]
	ldrh r0, [r1, 0x26]
	strh r0, [r5, 0x1C]
	bl sub_8148710
	ldrh r0, [r5, 0x18]
	strh r0, [r5, 0x8]
	bl sub_814862C
	ldrh r0, [r5, 0x18]
	strh r0, [r5, 0x8]
	movs r0, 0
	b _081485C6
	.align 2, 0
_081485B4: .4byte gUnknown_03005FA0
_081485B8: .4byte gMonPokeblockAnims
_081485BC: .4byte gUnknown_03005F40
_081485C0: .4byte gUnknown_03005F20
_081485C4:
	movs r0, 0x1
_081485C6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8148540

	thumb_func_start sub_81485CC
sub_81485CC: @ 81485CC
	push {r4,lr}
	ldr r3, _08148604
	ldrh r0, [r3, 0x18]
	ldrh r1, [r3, 0x8]
	subs r0, r1
	lsls r0, 16
	ldr r1, _08148608
	ldr r4, [r1]
	lsrs r0, 15
	ldr r1, _0814860C
	adds r2, r0, r1
	ldrh r2, [r2]
	strh r2, [r4, 0x24]
	movs r2, 0x80
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r4, 0x26]
	ldrh r0, [r3, 0x8]
	subs r0, 0x1
	strh r0, [r3, 0x8]
	lsls r0, 16
	cmp r0, 0
	beq _08148610
	movs r0, 0
	b _08148612
	.align 2, 0
_08148604: .4byte gUnknown_03005FA0
_08148608: .4byte gUnknown_03005F20
_0814860C: .4byte 0x0201d000
_08148610:
	movs r0, 0x1
_08148612:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81485CC

	thumb_func_start sub_8148618
sub_8148618: @ 8148618
	push {lr}
	ldr r0, _08148628
	ldr r0, [r0]
	bl FreeSpriteOamMatrix
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08148628: .4byte gUnknown_03005F20
	thumb_func_end sub_8148618

	thumb_func_start sub_814862C
sub_814862C: @ 814862C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	ldr r1, _08148700
	ldrh r0, [r1, 0x10]
	mov r8, r0
	ldrh r0, [r1, 0x18]
	mov r2, r8
	subs r0, r2
	lsls r0, 16
	lsrs r7, r0, 16
	ldrh r0, [r1, 0xC]
	ldrh r3, [r1, 0x1A]
	adds r0, r3
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	ldrh r0, [r1, 0xE]
	ldrh r1, [r1, 0x1C]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	movs r6, 0
	subs r0, r7, 0x1
	ldr r4, _08148704
	mov r10, r4
	cmp r6, r0
	bge _081486D4
	ldr r1, [sp]
	lsls r0, r1, 16
	asrs r0, 16
	str r0, [sp, 0x4]
_08148674:
	mov r2, r8
	adds r5, r2, r6
	lsls r5, 1
	ldr r4, _08148708
	adds r3, r5, r4
	ldrh r2, [r3]
	ldr r0, [sp, 0x4]
	subs r1, r2, r0
	ldr r4, _0814870C
	adds r5, r4
	ldrh r0, [r5]
	mov r12, r0
	mov r4, r9
	lsls r0, r4, 16
	asrs r0, 16
	mov r4, r12
	subs r0, r4, r0
	lsls r4, r0, 16
	lsrs r4, 16
	lsls r1, 16
	asrs r1, 16
	adds r6, 0x1
	adds r0, r1, 0
	muls r0, r6
	adds r1, r7, 0
	str r2, [sp, 0x8]
	str r3, [sp, 0xC]
	bl __divsi3
	ldr r2, [sp, 0x8]
	subs r2, r0
	ldr r3, [sp, 0xC]
	strh r2, [r3]
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	muls r0, r6
	adds r1, r7, 0
	bl __divsi3
	ldrh r1, [r5]
	subs r1, r0
	strh r1, [r5]
	lsls r6, 16
	lsrs r6, 16
	subs r0, r7, 0x1
	cmp r6, r0
	blt _08148674
_081486D4:
	mov r1, r8
	adds r0, r1, r7
	lsls r0, 1
	mov r2, r10
	adds r1, r0, r2
	mov r3, sp
	ldrh r3, [r3]
	strh r3, [r1]
	movs r1, 0x80
	lsls r1, 3
	add r1, r10
	adds r0, r1
	mov r4, r9
	strh r4, [r0]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08148700: .4byte gUnknown_03005FA0
_08148704: .4byte 0x0201cffe
_08148708: .4byte 0x0201d000
_0814870C: .4byte 0x0201d400
	thumb_func_end sub_814862C

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
	ldr r1, _081487A4
	ldrh r2, [r1, 0x1A]
	ldrh r0, [r1, 0x14]
	subs r2, r0
	ldrh r3, [r1, 0x1C]
	ldrh r0, [r1, 0x16]
	subs r3, r0
	adds r6, r1, 0
	ldr r1, _081487A8
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

	thumb_func_start c2_clear_save_data_screen_2
c2_clear_save_data_screen_2: @ 8148800
	push {lr}
	bl sub_8148970
	lsls r0, 24
	cmp r0, 0
	beq _08148814
	ldr r0, _08148818
	movs r1, 0
	bl CreateTask
_08148814:
	pop {r0}
	bx r0
	.align 2, 0
_08148818: .4byte sub_8148830
	thumb_func_end c2_clear_save_data_screen_2

	thumb_func_start sub_814881C
sub_814881C: @ 814881C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_814881C

	thumb_func_start sub_8148830
sub_8148830: @ 8148830
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ResetSpriteData
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xCA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _081488A8
	bl SetVBlankCallback
	movs r0, 0x2
	movs r1, 0xE
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _081488AC
	movs r1, 0x3
	movs r2, 0xF
	bl MenuPrint
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x8
	movs r3, 0x6
	bl MenuDrawTextWindow
	ldr r3, _081488B0
	movs r0, 0x3
	movs r1, 0x2
	movs r2, 0x2
	bl PrintMenuItems
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x5
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x3
	movs r2, 0x2
	movs r3, 0x2
	bl InitMenu
	ldr r1, _081488B4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081488B8
	str r1, [r0]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081488A8: .4byte sub_814881C
_081488AC: .4byte gSystemText_ClearAllSaveDataPrompt
_081488B0: .4byte gUnknown_08376D74
_081488B4: .4byte gTasks
_081488B8: .4byte sub_81488BC
	thumb_func_end sub_8148830

	thumb_func_start sub_81488BC
sub_81488BC: @ 81488BC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _081488E2
	cmp r1, 0
	bgt _081488DC
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0814890C
	b _0814891E
_081488DC:
	cmp r1, 0x1
	beq _0814890C
	b _0814891E
_081488E2:
	movs r0, 0x5
	bl PlaySoundEffect
	ldr r0, _08148900
	bl sub_8071F40
	ldr r1, _08148904
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08148908
	str r1, [r0]
	b _0814891E
	.align 2, 0
_08148900: .4byte gSystemText_ClearingData
_08148904: .4byte gTasks
_08148908: .4byte sub_8148930
_0814890C:
	movs r0, 0x5
	bl PlaySoundEffect
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _0814892C
	bl SetMainCallback2
_0814891E:
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814892C: .4byte sub_8148B34
	thumb_func_end sub_81488BC

	thumb_func_start sub_8148930
sub_8148930: @ 8148930
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl calls_flash_erase_block
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _08148950
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08148950: .4byte sub_8148B34
	thumb_func_end sub_8148930

	thumb_func_start sub_8148954
sub_8148954: @ 8148954
	push {lr}
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8148954

	thumb_func_start sub_8148964
sub_8148964: @ 8148964
	push {lr}
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8148964

	thumb_func_start sub_8148970
sub_8148970: @ 8148970
	push {r4,lr}
	sub sp, 0xC
	ldr r0, _08148AA4
	ldr r1, _08148AA8
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08148986
	cmp r0, 0x1
	bne _08148986
	b _08148B04
_08148986:
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	movs r4, 0
	strh r4, [r0]
	adds r0, 0x10
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0xA
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x22
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x6
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	add r0, sp, 0x4
	strh r4, [r0]
	ldr r1, _08148AAC
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _08148AB0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0
	str r2, [sp, 0x8]
	add r0, sp, 0x8
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _08148AB4
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0x4
	strh r2, [r0]
	str r0, [r1]
	ldr r0, _08148AB8
	str r0, [r1, 0x4]
	ldr r0, _08148ABC
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	ldr r2, _08148AC0
	ldr r0, _08148AC4
	strh r0, [r2]
	ldr r1, _08148AC8
	strh r0, [r1]
	ldr r0, _08148ACC
	strh r0, [r2, 0x2]
	strh r0, [r1, 0x2]
	movs r1, 0
	ldr r3, _08148AD0
	ldr r0, _08148AD4
	adds r2, r0, 0
_08148A14:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xF
	bls _08148A14
	movs r1, 0
	ldr r4, _08148AD8
	movs r3, 0x1
	ldr r2, _08148ADC
_08148A2C:
	lsls r0, r1, 1
	adds r0, r4
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bls _08148A2C
	bl ResetTasks
	bl ResetSpriteData
	ldr r0, _08148AE0
	bl SetUpWindowConfig
	ldr r0, _08148AE4
	bl InitMenuWindow
	movs r0, 0x1
	negs r0, r0
	ldr r1, _08148AE8
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _08148AEC
	ldrh r1, [r2]
	movs r0, 0
	strh r0, [r2]
	ldr r3, _08148AF0
	ldrh r0, [r3]
	movs r4, 0x1
	orrs r0, r4
	strh r0, [r3]
	strh r1, [r2]
	ldr r2, _08148AF4
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08148AF8
	bl SetVBlankCallback
	ldr r1, _08148AFC
	ldr r2, _08148B00
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xE
	movs r2, 0x90
	lsls r2, 4
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08148AA4
	ldr r1, _08148AA8
	adds r0, r1
	strb r4, [r0]
	b _08148B28
	.align 2, 0
_08148AA4: .4byte gMain
_08148AA8: .4byte 0x0000043c
_08148AAC: .4byte 0x040000d4
_08148AB0: .4byte 0x8100c000
_08148AB4: .4byte 0x85000100
_08148AB8: .4byte 0x05000002
_08148ABC: .4byte 0x810001ff
_08148AC0: .4byte gPlttBufferUnfaded
_08148AC4: .4byte 0x00007fff
_08148AC8: .4byte gPlttBufferFaded
_08148ACC: .4byte 0x00003945
_08148AD0: .4byte 0x06000020
_08148AD4: .4byte 0x00001111
_08148AD8: .4byte 0x06003800
_08148ADC: .4byte 0x000004ff
_08148AE0: .4byte gWindowConfig_81E6C3C
_08148AE4: .4byte gWindowConfig_81E6CE4
_08148AE8: .4byte 0x0000ffff
_08148AEC: .4byte 0x04000208
_08148AF0: .4byte 0x04000200
_08148AF4: .4byte REG_DISPSTAT
_08148AF8: .4byte sub_8148964
_08148AFC: .4byte REG_BG3CNT
_08148B00: .4byte 0x00000703
_08148B04:
	bl UpdatePaletteFade
	ldr r0, _08148B20
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08148B28
	ldr r0, _08148B24
	bl SetMainCallback2
	movs r0, 0x1
	b _08148B2A
	.align 2, 0
_08148B20: .4byte gPaletteFade
_08148B24: .4byte sub_8148954
_08148B28:
	movs r0, 0
_08148B2A:
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8148970

	thumb_func_start sub_8148B34
sub_8148B34: @ 8148B34
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08148B60
	ldr r1, _08148B64
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _08148B48
	cmp r0, 0x1
	beq _08148B6C
_08148B48:
	movs r0, 0x1
	negs r0, r0
	ldr r1, _08148B68
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x1
	strb r0, [r4]
	b _08148B80
	.align 2, 0
_08148B60: .4byte gMain
_08148B64: .4byte 0x0000043c
_08148B68: .4byte 0x0000ffff
_08148B6C:
	bl UpdatePaletteFade
	ldr r0, _08148B88
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08148B80
	bl DoSoftReset
_08148B80:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08148B88: .4byte gPaletteFade
	thumb_func_end sub_8148B34

	thumb_func_start load_intro_part2_graphics
load_intro_part2_graphics: @ 8148B8C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08148BE8
	ldr r1, _08148BEC
	bl LZ77UnCompVram
	ldr r0, _08148BF0
	ldr r1, _08148BF4
	bl LZ77UnCompVram
	ldr r0, _08148BF8
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	cmp r4, 0
	beq _08148BB4
	cmp r4, 0x1
	beq _08148C14
_08148BB4:
	ldr r0, _08148BFC
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148C00
	ldr r1, _08148C04
	bl LZ77UnCompVram
	ldr r0, _08148C08
	movs r1, 0
	movs r2, 0x60
	bl LoadPalette
	ldr r0, _08148C0C
	bl LoadCompressedObjectPic
	ldr r0, _08148C10
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	bl sub_8149248
	b _08148C46
	.align 2, 0
_08148BE8: .4byte gUnknown_0841225C
_08148BEC: .4byte 0x06004000
_08148BF0: .4byte gUnknown_084126DC
_08148BF4: .4byte 0x06007800
_08148BF8: .4byte gUnknown_084121FC
_08148BFC: .4byte gUnknown_084128D8
_08148C00: .4byte gUnknown_08412EB4
_08148C04: .4byte 0x06003000
_08148C08: .4byte gUnknown_08412818
_08148C0C: .4byte gUnknown_08416B54
_08148C10: .4byte gUnknown_08413184
_08148C14:
	ldr r0, _08148C58
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148C5C
	ldr r1, _08148C60
	bl LZ77UnCompVram
	ldr r0, _08148C64
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148C68
	bl LoadCompressedObjectPic
	ldr r0, _08148C6C
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	bl sub_8149264
_08148C46:
	ldr r1, _08148C70
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08148C74
	movs r0, 0x8
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08148C58: .4byte gUnknown_08413340
_08148C5C: .4byte gUnknown_084139C8
_08148C60: .4byte 0x06003000
_08148C64: .4byte gUnknown_08413300
_08148C68: .4byte gUnknown_08416BDC
_08148C6C: .4byte gUnknown_08413CCC
_08148C70: .4byte gUnknown_0203935C
_08148C74: .4byte gReservedSpritePaletteCount
	thumb_func_end load_intro_part2_graphics

	thumb_func_start sub_8148C78
sub_8148C78: @ 8148C78
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08148CA4
	ldr r2, _08148CA8
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	adds r2, 0xFF
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _08148CAC
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	movs r2, 0xF2
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08148CA4: .4byte REG_BG3CNT
_08148CA8: .4byte 0x00000603
_08148CAC: .4byte 0x00000f05
	thumb_func_end sub_8148C78

	thumb_func_start sub_8148CB0
sub_8148CB0: @ 8148CB0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08148CD4
	ldr r1, _08148CD8
	bl LZ77UnCompVram
	ldr r0, _08148CDC
	ldr r1, _08148CE0
	bl LZ77UnCompVram
	cmp r4, 0x4
	bhi _08148CFC
	lsls r0, r4, 2
	ldr r1, _08148CE4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08148CD4: .4byte gUnknown_0841225C
_08148CD8: .4byte 0x06004000
_08148CDC: .4byte gUnknown_084126DC
_08148CE0: .4byte 0x06007800
_08148CE4: .4byte _08148CE8
	.align 2, 0
_08148CE8:
	.4byte _08148CFC
	.4byte _08148D58
	.4byte _08148DC4
	.4byte _08148DC4
	.4byte _08148E1C
_08148CFC:
	ldr r0, _08148D34
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148D38
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148D3C
	ldr r1, _08148D40
	bl LZ77UnCompVram
	ldr r0, _08148D44
	movs r1, 0
	movs r2, 0x60
	bl LoadPalette
	ldr r0, _08148D48
	bl LoadCompressedObjectPic
	ldr r0, _08148D4C
	ldr r1, _08148D50
	bl LZ77UnCompVram
	ldr r0, _08148D54
	b _08148D8E
	.align 2, 0
_08148D34: .4byte gUnknown_084121FC
_08148D38: .4byte gUnknown_084128D8
_08148D3C: .4byte gUnknown_08412EB4
_08148D40: .4byte 0x06003000
_08148D44: .4byte gUnknown_08412818
_08148D48: .4byte gUnknown_08416B54
_08148D4C: .4byte gUnknown_084131C4
_08148D50: .4byte 0x06010000
_08148D54: .4byte gUnknown_08413184
_08148D58:
	ldr r0, _08148DA0
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148DA4
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148DA8
	ldr r1, _08148DAC
	bl LZ77UnCompVram
	ldr r0, _08148DB0
	movs r1, 0
	movs r2, 0x60
	bl LoadPalette
	ldr r0, _08148DB4
	bl LoadCompressedObjectPic
	ldr r0, _08148DB8
	ldr r1, _08148DBC
	bl LZ77UnCompVram
	ldr r0, _08148DC0
_08148D8E:
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	bl sub_8149248
	b _08148E58
	.align 2, 0
_08148DA0: .4byte gUnknown_0841221C
_08148DA4: .4byte gUnknown_084128D8
_08148DA8: .4byte gUnknown_08412EB4
_08148DAC: .4byte 0x06003000
_08148DB0: .4byte gUnknown_08412878
_08148DB4: .4byte gUnknown_08416B54
_08148DB8: .4byte gUnknown_084131C4
_08148DBC: .4byte 0x06010000
_08148DC0: .4byte gUnknown_084131A4
_08148DC4:
	ldr r0, _08148E04
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148E08
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148E0C
	ldr r1, _08148E10
	bl LZ77UnCompVram
	ldr r4, _08148E14
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148E18
	bl LoadCompressedObjectPic
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	bl sub_8149264
	b _08148E58
	.align 2, 0
_08148E04: .4byte gUnknown_0841221C
_08148E08: .4byte gUnknown_08413340
_08148E0C: .4byte gUnknown_084139C8
_08148E10: .4byte 0x06003000
_08148E14: .4byte gUnknown_08413320
_08148E18: .4byte gUnknown_08416BDC
_08148E1C:
	ldr r0, _08148E6C
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08148E70
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148E74
	ldr r1, _08148E78
	bl LZ77UnCompVram
	ldr r0, _08148E7C
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _08148E80
	bl LoadCompressedObjectPic
	ldr r0, _08148E84
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	bl sub_8149280
_08148E58:
	ldr r1, _08148E88
	movs r0, 0x8
	strb r0, [r1]
	ldr r1, _08148E8C
	movs r0, 0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08148E6C: .4byte gUnknown_0841223C
_08148E70: .4byte gUnknown_08413E78
_08148E74: .4byte gUnknown_08414084
_08148E78: .4byte 0x06003000
_08148E7C: .4byte gUnknown_08413E38
_08148E80: .4byte gUnknown_08416C70
_08148E84: .4byte gUnknown_08414064
_08148E88: .4byte gReservedSpritePaletteCount
_08148E8C: .4byte gUnknown_0203935C
	thumb_func_end sub_8148CB0

	thumb_func_start sub_8148E90
sub_8148E90: @ 8148E90
	ldr r1, _08148EB4
	ldr r2, _08148EB8
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	adds r2, 0xFF
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _08148EBC
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08148EB4: .4byte REG_BG3CNT
_08148EB8: .4byte 0x00000603
_08148EBC: .4byte 0x00000f05
	thumb_func_end sub_8148E90

	thumb_func_start sub_8148EC0
sub_8148EC0: @ 8148EC0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r3, 16
	lsrs r3, 16
	ldr r1, _08148F34
	mov r9, r1
	mov r0, r9
	movs r1, 0
	str r3, [sp]
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08148F38
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	strh r5, [r0, 0x8]
	strh r6, [r0, 0xA]
	strh r2, [r0, 0xC]
	strh r2, [r0, 0xE]
	mov r1, r8
	strh r1, [r0, 0x10]
	strh r2, [r0, 0x12]
	strh r2, [r0, 0x14]
	ldr r3, [sp]
	strh r3, [r0, 0x16]
	movs r1, 0x8
	strh r1, [r0, 0x18]
	strh r2, [r0, 0x1A]
	adds r0, r4, 0
	bl _call_via_r9
	adds r0, r4, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08148F34: .4byte sub_8148F3C
_08148F38: .4byte gTasks
	thumb_func_end sub_8148EC0

	thumb_func_start sub_8148F3C
sub_8148F3C: @ 8148F3C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08148FB4
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r1
	ldrh r0, [r3, 0xA]
	lsls r4, r0, 16
	adds r6, r1, 0
	cmp r4, 0
	beq _08148F7C
	movs r1, 0xC
	ldrsh r0, [r3, r1]
	lsls r0, 16
	ldrh r1, [r3, 0xE]
	adds r2, r0, r1
	lsrs r0, r4, 12
	subs r2, r0
	asrs r1, r2, 16
	strh r1, [r3, 0xC]
	strh r2, [r3, 0xE]
	ldr r0, _08148FB8
	strh r1, [r0]
	ldr r2, _08148FBC
	ldr r1, _08148FC0
	ldr r0, _08148FC4
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r2]
_08148F7C:
	ldrh r0, [r3, 0x10]
	lsls r4, r0, 16
	cmp r4, 0
	beq _08148FD8
	movs r1, 0x12
	ldrsh r0, [r3, r1]
	lsls r0, 16
	ldrh r1, [r3, 0x14]
	adds r2, r0, r1
	lsrs r0, r4, 12
	subs r2, r0
	asrs r1, r2, 16
	strh r1, [r3, 0x12]
	strh r2, [r3, 0x14]
	ldr r0, _08148FC8
	strh r1, [r0]
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _08148FD0
	ldr r2, _08148FCC
	ldr r1, _08148FC0
	ldr r0, _08148FC4
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r2]
	b _08148FD8
	.align 2, 0
_08148FB4: .4byte gTasks
_08148FB8: .4byte REG_BG1HOFS
_08148FBC: .4byte REG_BG1VOFS
_08148FC0: .4byte gUnknown_02039358
_08148FC4: .4byte gUnknown_0203935A
_08148FC8: .4byte REG_BG2HOFS
_08148FCC: .4byte REG_BG2VOFS
_08148FD0:
	ldr r0, _08149010
	ldr r1, _08149014
	ldrh r1, [r1]
	strh r1, [r0]
_08148FD8:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r6
	ldrh r0, [r3, 0x16]
	lsls r4, r0, 16
	cmp r4, 0
	beq _08149008
	movs r1, 0x18
	ldrsh r0, [r3, r1]
	lsls r0, 16
	ldrh r1, [r3, 0x1A]
	adds r2, r0, r1
	lsrs r0, r4, 12
	subs r2, r0
	asrs r1, r2, 16
	strh r1, [r3, 0x18]
	strh r2, [r3, 0x1A]
	ldr r0, _08149018
	strh r1, [r0]
	ldr r1, _0814901C
	ldr r0, _08149014
	ldrh r0, [r0]
	strh r0, [r1]
_08149008:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149010: .4byte REG_BG2VOFS
_08149014: .4byte gUnknown_02039358
_08149018: .4byte REG_BG3HOFS
_0814901C: .4byte REG_BG3VOFS
	thumb_func_end sub_8148F3C

	thumb_func_start sub_8149020
sub_8149020: @ 8149020
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08149100
	cmp r0, 0x1
	ble _08149034
	cmp r0, 0x2
	beq _08149098
_08149034:
	ldr r0, _08149060
	ldr r2, [r0, 0x20]
	movs r0, 0x3
	ands r0, r2
	cmp r0, 0
	bne _08149100
	ldr r0, _08149064
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08149100
	movs r0, 0x4
	ands r2, r0
	cmp r2, 0
	beq _0814906C
	ldr r2, _08149068
	ldrh r1, [r2, 0x12]
	mov r0, sp
	strh r1, [r0]
	ldrh r1, [r2, 0x14]
	b _08149076
	.align 2, 0
_08149060: .4byte gMain
_08149064: .4byte gPaletteFade
_08149068: .4byte gPlttBufferUnfaded
_0814906C:
	ldr r2, _08149094
	ldrh r1, [r2, 0x14]
	mov r0, sp
	strh r1, [r0]
	ldrh r1, [r2, 0x12]
_08149076:
	adds r0, 0x2
	strh r1, [r0]
	adds r4, r0, 0
	mov r0, sp
	movs r1, 0x9
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0x2
	bl LoadPalette
	b _08149100
	.align 2, 0
_08149094: .4byte gPlttBufferUnfaded
_08149098:
	ldr r0, _081490C8
	ldr r2, [r0, 0x20]
	movs r0, 0x3
	ands r0, r2
	cmp r0, 0
	bne _08149100
	ldr r0, _081490CC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08149100
	movs r0, 0x4
	ands r2, r0
	cmp r2, 0
	beq _081490D8
	mov r1, sp
	ldr r2, _081490D0
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _081490D4
	b _081490E6
	.align 2, 0
_081490C8: .4byte gMain
_081490CC: .4byte gPaletteFade
_081490D0: .4byte 0x00003d27
_081490D4: .4byte 0x00000295
_081490D8:
	mov r1, sp
	movs r2, 0xC7
	lsls r2, 2
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _08149108
_081490E6:
	adds r0, r2, 0
	strh r0, [r1]
	adds r4, r1, 0
	mov r0, sp
	movs r1, 0xC
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xD
	movs r2, 0x2
	bl LoadPalette
_08149100:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149108: .4byte 0x00003d27
	thumb_func_end sub_8149020

	thumb_func_start sub_814910C
sub_814910C: @ 814910C
	push {lr}
	adds r2, r0, 0
	ldr r0, _08149124
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08149128
	adds r0, r2, 0
	bl DestroySprite
	b _0814916C
	.align 2, 0
_08149124: .4byte gUnknown_0203935C
_08149128:
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	lsls r0, 16
	ldrh r1, [r2, 0x32]
	orrs r0, r1
	ldrh r1, [r2, 0x30]
	adds r0, r1
	asrs r1, r0, 16
	strh r1, [r2, 0x20]
	strh r0, [r2, 0x32]
	cmp r1, 0xFF
	ble _08149144
	ldr r0, _08149158
	strh r0, [r2, 0x20]
_08149144:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _08149164
	ldr r1, _0814915C
	ldr r0, _08149160
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r1
	b _08149168
	.align 2, 0
_08149158: .4byte 0x0000ffe0
_0814915C: .4byte gUnknown_02039358
_08149160: .4byte gUnknown_0203935A
_08149164:
	ldr r0, _08149170
	ldrh r0, [r0]
_08149168:
	negs r0, r0
	strh r0, [r2, 0x26]
_0814916C:
	pop {r0}
	bx r0
	.align 2, 0
_08149170: .4byte gUnknown_02039358
	thumb_func_end sub_814910C

	thumb_func_start sub_8149174
sub_8149174: @ 8149174
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	movs r7, 0
	cmp r7, r8
	bcs _0814922A
	ldr r0, _0814923C
	mov r10, r0
	movs r2, 0x3F
	mov r9, r2
_0814919E:
	lsls r6, r7, 3
	ldr r0, [sp, 0x4]
	adds r6, r0
	ldrb r1, [r6, 0x1]
	ldrb r2, [r6, 0x2]
	ldrb r3, [r6, 0x3]
	ldr r0, _08149240
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	mov r2, r10
	adds r4, r5, r2
	ldrb r2, [r6]
	lsls r1, r2, 26
	lsrs r1, 30
	lsrs r2, 6
	adds r0, r4, 0
	movs r3, 0
	bl CalcCenterToCornerVec
	ldrb r3, [r4, 0x5]
	movs r0, 0xC
	orrs r3, r0
	strb r3, [r4, 0x5]
	ldrb r1, [r6]
	lsls r1, 26
	lsrs r1, 30
	lsls r1, 6
	ldrb r2, [r4, 0x1]
	mov r0, r9
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r6]
	lsrs r1, 6
	lsls r1, 6
	ldrb r2, [r4, 0x3]
	mov r0, r9
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
	movs r0, 0xF
	ands r3, r0
	strb r3, [r4, 0x5]
	ldr r0, _08149244
	adds r5, r0
	ldr r2, [sp, 0x8]
	str r2, [r5]
	ldrb r1, [r6]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl StartSpriteAnim
	movs r1, 0
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x2E]
	ldrh r0, [r6, 0x4]
	strh r0, [r4, 0x30]
	strh r1, [r4, 0x32]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, r8
	bcc _0814919E
_0814922A:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814923C: .4byte gSprites
_08149240: .4byte gSpriteTemplate_8416B3C
_08149244: .4byte gSprites + 0x8
	thumb_func_end sub_8149174

	thumb_func_start sub_8149248
sub_8149248: @ 8149248
	push {lr}
	ldr r1, _0814925C
	ldr r2, _08149260
	movs r0, 0
	movs r3, 0x9
	bl sub_8149174
	pop {r0}
	bx r0
	.align 2, 0
_0814925C: .4byte gUnknown_08416B94
_08149260: .4byte gSpriteAnimTable_8416B84
	thumb_func_end sub_8149248

	thumb_func_start sub_8149264
sub_8149264: @ 8149264
	push {lr}
	ldr r1, _08149278
	ldr r2, _0814927C
	movs r0, 0x1
	movs r3, 0xC
	bl sub_8149174
	pop {r0}
	bx r0
	.align 2, 0
_08149278: .4byte gUnknown_08416C10
_0814927C: .4byte gSpriteAnimTable_8416C04
	thumb_func_end sub_8149264

	thumb_func_start sub_8149280
sub_8149280: @ 8149280
	push {lr}
	ldr r1, _08149294
	ldr r2, _08149298
	movs r0, 0x1
	movs r3, 0x6
	bl sub_8149174
	pop {r0}
	bx r0
	.align 2, 0
_08149294: .4byte gUnknown_08416C8C
_08149298: .4byte gSpriteAnimTable_8416C88
	thumb_func_end sub_8149280

	thumb_func_start nullsub_82
nullsub_82: @ 814929C
	bx lr
	thumb_func_end nullsub_82

	thumb_func_start sub_81492A0
sub_81492A0: @ 81492A0
	push {r4,lr}
	ldr r4, _0814930C
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r1, [r1]
	movs r2, 0x3E
	adds r2, r0
	mov r12, r2
	movs r2, 0x4
	ands r2, r1
	mov r1, r12
	ldrb r3, [r1]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	mov r2, r12
	strb r1, [r2]
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x20]
	strh r1, [r0, 0x20]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x22]
	adds r1, 0x8
	strh r1, [r0, 0x22]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x24]
	strh r1, [r0, 0x24]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x26]
	strh r1, [r0, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814930C: .4byte gSprites
	thumb_func_end sub_81492A0

	thumb_func_start sub_8149310
sub_8149310: @ 8149310
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r0, _0814935C
	lsls r5, 16
	asrs r5, 16
	lsls r4, 16
	asrs r4, 16
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _08149360
	adds r4, 0x8
	lsls r4, 16
	asrs r4, 16
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08149364
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	strh r6, [r1, 0x2E]
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0814935C: .4byte gSpriteTemplate_8416CDC
_08149360: .4byte gSpriteTemplate_8416D2C
_08149364: .4byte gSprites
	thumb_func_end sub_8149310

	thumb_func_start sub_8149368
sub_8149368: @ 8149368
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r0, _081493B4
	lsls r5, 16
	asrs r5, 16
	lsls r4, 16
	asrs r4, 16
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _081493B8
	adds r4, 0x8
	lsls r4, 16
	asrs r4, 16
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081493BC
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	strh r6, [r1, 0x2E]
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081493B4: .4byte gSpriteTemplate_8416CF4
_081493B8: .4byte gSpriteTemplate_8416D44
_081493BC: .4byte gSprites
	thumb_func_end sub_8149368

	thumb_func_start nullsub_83
nullsub_83: @ 81493C0
	bx lr
	thumb_func_end nullsub_83

	thumb_func_start sub_81493C4
sub_81493C4: @ 81493C4
	push {r4,lr}
	ldr r4, _08149420
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r1, [r1]
	movs r2, 0x3E
	adds r2, r0
	mov r12, r2
	movs r2, 0x4
	ands r2, r1
	mov r1, r12
	ldrb r3, [r1]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	mov r2, r12
	strb r1, [r2]
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x22]
	strh r1, [r0, 0x22]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x24]
	strh r1, [r0, 0x24]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x26]
	strh r1, [r0, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149420: .4byte gSprites
	thumb_func_end sub_81493C4

	thumb_func_start sub_8149424
sub_8149424: @ 8149424
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r2, r0, 0
	adds r5, r1, 0
	ldr r0, _08149490
	mov r8, r0
	lsls r2, 16
	asrs r4, r2, 16
	ldr r0, _08149494
	adds r2, r0
	asrs r2, 16
	lsls r5, 16
	asrs r5, 16
	mov r0, r8
	adds r1, r2, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	adds r4, 0x20
	lsls r4, 16
	asrs r4, 16
	mov r0, r8
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08149498
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r4, r5
	strh r6, [r0, 0x2E]
	movs r1, 0x1
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _0814949C
	str r0, [r4]
	adds r0, r6, 0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08149490: .4byte gSpriteTemplate_8416D7C
_08149494: .4byte 0xffe00000
_08149498: .4byte gSprites
_0814949C: .4byte sub_81493C4
	thumb_func_end sub_8149424

	thumb_func_start sapphire_sub_81494A0
sapphire_sub_81494A0: @ 81494A0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r2, r0, 0
	adds r5, r1, 0
	ldr r0, _0814950C
	mov r8, r0
	lsls r2, 16
	asrs r4, r2, 16
	ldr r0, _08149510
	adds r2, r0
	asrs r2, 16
	lsls r5, 16
	asrs r5, 16
	mov r0, r8
	adds r1, r2, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	adds r4, 0x20
	lsls r4, 16
	asrs r4, 16
	mov r0, r8
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08149514
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r4, r5
	strh r6, [r0, 0x2E]
	movs r1, 0x1
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _08149518
	str r0, [r4]
	adds r0, r6, 0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0814950C: .4byte gSpriteTemplate_8416D94
_08149510: .4byte 0xffe00000
_08149514: .4byte gSprites
_08149518: .4byte sub_81493C4
	thumb_func_end sapphire_sub_81494A0

	thumb_func_start nullsub_84
nullsub_84: @ 814951C
	bx lr
	thumb_func_end nullsub_84

	thumb_func_start sub_8149520
sub_8149520: @ 8149520
	push {r4,r5,lr}
	sub sp, 0x4
	movs r4, 0
	ldr r5, _08149554
_08149528:
	adds r0, r4, 0
	adds r0, 0x14
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
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xB
	bls _08149528
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149554: .4byte gUnknown_08416ED0
	thumb_func_end sub_8149520

	thumb_func_start sub_8149558
sub_8149558: @ 8149558
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _08149606
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	adds r1, r0, 0
	muls r1, r0
	adds r0, r1, 0
	movs r1, 0x50
	bl __divsi3
	movs r1, 0x58
	subs r1, r0
	strh r1, [r4, 0x22]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _08149592
	adds r0, 0x3
_08149592:
	asrs r0, 2
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x3A]
	adds r0, 0x4
	strh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081495BC
	ldrh r0, [r4, 0x38]
	subs r0, 0x1
	strh r0, [r4, 0x38]
_081495BC:
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	cmp r0, 0
	ble _081495D2
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1
	b _081495D8
_081495D2:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x14
_081495D8:
	strb r0, [r1]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _081495E4
	adds r0, 0x3
_081495E4:
	asrs r0, 2
	adds r0, 0x14
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1F
	bls _081495F2
	movs r2, 0x1F
_081495F2:
	movs r0, 0x1F
	ands r2, r0
	lsls r2, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	b _0814960C
_08149606:
	adds r0, r4, 0
	bl DestroySprite
_0814960C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8149558

	thumb_func_start sub_8149614
sub_8149614: @ 8149614
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08149664
	movs r1, 0x78
	movs r2, 0x58
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0814965E
	ldr r4, _08149668
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r4
	movs r1, 0
	movs r0, 0x30
	strh r0, [r2, 0x38]
	strh r5, [r2, 0x3A]
	strh r1, [r2, 0x3C]
	ldrb r1, [r2, 0x1]
	subs r0, 0x34
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x3]
	movs r1, 0x3E
	orrs r0, r1
	strb r0, [r2, 0x3]
	adds r4, 0x1C
	adds r3, r4
	ldr r0, _0814966C
	str r0, [r3]
_0814965E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149664: .4byte gSpriteTemplate_8416EB8
_08149668: .4byte gSprites
_0814966C: .4byte sub_8149558
	thumb_func_end sub_8149614

	thumb_func_start sub_8149670
sub_8149670: @ 8149670
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r0, 0x57
	bgt _081496D6
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	adds r1, r0, 0
	muls r1, r0
	adds r0, r1, 0
	movs r1, 0x5
	bl __divsi3
	adds r0, 0x8
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _081496A8
	adds r0, 0x3
_081496A8:
	asrs r0, 2
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r0, 26
	lsrs r0, 24
	movs r1, 0x28
	bl Sin
	adds r0, 0x8
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	b _081496DC
_081496D6:
	adds r0, r4, 0
	bl DestroySprite
_081496DC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8149670

	thumb_func_start sub_81496E4
sub_81496E4: @ 81496E4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08149740
	movs r1, 0x78
	movs r2, 0x8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0814973A
	ldr r4, _08149744
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r4
	movs r1, 0
	movs r0, 0x8
	strh r0, [r2, 0x38]
	strh r5, [r2, 0x3A]
	strh r1, [r2, 0x3C]
	ldrb r1, [r2, 0x1]
	subs r0, 0xC
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x32
	orrs r0, r1
	strb r0, [r2, 0x3]
	adds r2, 0x43
	movs r0, 0x1
	strb r0, [r2]
	adds r4, 0x1C
	adds r3, r4
	ldr r0, _08149748
	str r0, [r3]
_0814973A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149740: .4byte gSpriteTemplate_8416EB8
_08149744: .4byte gSprites
_08149748: .4byte sub_8149670
	thumb_func_end sub_81496E4

	thumb_func_start sub_814974C
sub_814974C: @ 814974C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _08149788
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x38]
	ldrh r1, [r4, 0x34]
	subs r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3A]
	adds r0, 0x4
	strh r0, [r4, 0x3A]
	b _0814978E
_08149788:
	adds r0, r4, 0
	bl DestroySprite
_0814978E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_814974C

	thumb_func_start sub_8149794
sub_8149794: @ 8149794
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _081497F0
	movs r1, 0x78
	movs r2, 0x38
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _081497EA
	ldr r4, _081497F4
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r4
	movs r1, 0
	strh r5, [r2, 0x34]
	movs r0, 0x78
	strh r0, [r2, 0x38]
	strh r6, [r2, 0x3A]
	strh r1, [r2, 0x3C]
	ldrb r1, [r2, 0x1]
	subs r0, 0x7C
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x3]
	movs r1, 0x3E
	orrs r0, r1
	strb r0, [r2, 0x3]
	adds r2, 0x43
	movs r0, 0x1
	strb r0, [r2]
	adds r4, 0x1C
	adds r3, r4
	ldr r0, _081497F8
	str r0, [r3]
_081497EA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081497F0: .4byte gSpriteTemplate_8416EB8
_081497F4: .4byte gSprites
_081497F8: .4byte sub_814974C
	thumb_func_end sub_8149794

	thumb_func_start sub_81497FC
sub_81497FC: @ 81497FC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x3C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08149810
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
_08149810:
	ldrh r1, [r4, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0x7F
	bgt _081498C0
	lsls r0, r1, 24
	lsrs r0, 24
	movs r5, 0x38
	ldrsh r1, [r4, r5]
	bl Sin
	negs r0, r0
	strh r0, [r4, 0x26]
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	muls r0, r1
	movs r1, 0x3
	bl __divsi3
	adds r0, 0x78
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x3A]
	adds r3, r0, 0x1
	strh r3, [r4, 0x3A]
	movs r5, 0x3A
	ldrsh r1, [r4, r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	cmp r0, 0
	bge _08149854
	adds r0, 0x7F
_08149854:
	asrs r0, 7
	movs r1, 0x1F
	subs r1, r0
	lsls r1, 24
	lsrs r2, r1, 24
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0x40
	ble _08149870
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1
	strb r0, [r1]
	b _081498A0
_08149870:
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x14
	strb r0, [r1]
	ldrh r1, [r4, 0x3A]
	movs r5, 0x3A
	ldrsh r0, [r4, r5]
	cmp r0, 0x70
	ble _081498A0
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081498A0
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
_081498A0:
	cmp r2, 0x13
	bhi _081498A6
	movs r2, 0x14
_081498A6:
	movs r0, 0x1F
	ands r2, r0
	lsls r2, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	b _081498C6
_081498C0:
	adds r0, r4, 0
	bl DestroySprite
_081498C6:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81497FC

	thumb_func_start sub_81498CC
sub_81498CC: @ 81498CC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _08149948
	movs r1, 0x78
	movs r2, 0x38
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x40
	beq _0814993C
	bl Random
	ldr r6, _0814994C
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	adds r4, r5, r6
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x7
	bl __umodsi3
	movs r1, 0x3
	subs r1, r0
	movs r0, 0
	mov r8, r0
	strh r1, [r4, 0x34]
	bl Random
	movs r1, 0x3F
	ands r1, r0
	adds r1, 0x30
	strh r1, [r4, 0x38]
	mov r0, r8
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	movs r1, 0x3E
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r4, 0x43
	movs r0, 0x14
	strb r0, [r4]
	adds r6, 0x1C
	adds r5, r6
	ldr r0, _08149950
	str r0, [r5]
_0814993C:
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149948: .4byte gSpriteTemplate_8416EB8
_0814994C: .4byte gSprites
_08149950: .4byte sub_81497FC
	thumb_func_end sub_81498CC

	thumb_func_start sub_8149954
sub_8149954: @ 8149954
	push {lr}
	ldr r0, _08149968
	bl LoadCompressedObjectPic
	ldr r0, _0814996C
	bl LoadSpritePalettes
	pop {r0}
	bx r0
	.align 2, 0
_08149968: .4byte gUnknown_08416E84
_0814996C: .4byte gUnknown_08416E94
	thumb_func_end sub_8149954

	thumb_func_start sub_8149970
sub_8149970: @ 8149970
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08149998
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0814999C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149998: .4byte sub_81499A0
_0814999C: .4byte gTasks
	thumb_func_end sub_8149970

	thumb_func_start sub_81499A0
sub_81499A0: @ 81499A0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r0, _081499E4
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	movs r0, 0
	strh r0, [r5, 0x26]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x3
	lsls r0, r1
	ldr r1, _081499E8
	str r1, [sp]
	movs r1, 0xA
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _081499EC
	str r0, [r5]
	movs r0, 0x8C
	bl PlaySoundEffect
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081499E4: .4byte gTasks
_081499E8: .4byte 0x00007fff
_081499EC: .4byte sub_81499F0
	thumb_func_end sub_81499A0

	thumb_func_start sub_81499F0
sub_81499F0: @ 81499F0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08149A48
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x26]
	movs r4, 0x26
	ldrsh r0, [r1, r4]
	cmp r0, 0x3F
	bgt _08149A4C
	movs r0, 0x7
	ands r0, r2
	adds r7, r3, 0
	cmp r0, 0
	bne _08149A36
	movs r4, 0
	adds r6, r1, 0
_08149A18:
	ldrh r1, [r6, 0x26]
	movs r0, 0x78
	ands r0, r1
	lsls r0, 1
	lsls r1, r4, 6
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl sub_8149614
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08149A18
_08149A36:
	ldr r0, _08149A48
	adds r1, r7, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149A54
	.align 2, 0
_08149A48: .4byte gTasks
_08149A4C:
	movs r0, 0x60
	strh r0, [r1, 0x26]
	ldr r0, _08149A5C
	str r0, [r1]
_08149A54:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08149A5C: .4byte sub_8149A60
	thumb_func_end sub_81499F0

	thumb_func_start sub_8149A60
sub_8149A60: @ 8149A60
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08149A80
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r1
	ldrh r3, [r1, 0x26]
	movs r4, 0x26
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _08149A84
	subs r0, r3, 0x1
	strh r0, [r1, 0x26]
	b _08149A8A
	.align 2, 0
_08149A80: .4byte gTasks
_08149A84:
	adds r0, r2, 0
	bl DestroyTask
_08149A8A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8149A60

	thumb_func_start sub_8149A90
sub_8149A90: @ 8149A90
	push {lr}
	ldr r0, _08149AA4
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08149AA4: .4byte sub_8149AA8
	thumb_func_end sub_8149A90

	thumb_func_start sub_8149AA8
sub_8149AA8: @ 8149AA8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r1, _08149AD4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x26]
	ldr r1, _08149AD8
	str r1, [r0]
	movs r0, 0xB7
	bl PlaySoundEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149AD4: .4byte gTasks
_08149AD8: .4byte sub_8149ADC
	thumb_func_end sub_8149AA8

	thumb_func_start sub_8149ADC
sub_8149ADC: @ 8149ADC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08149B20
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0x26
	ldrsh r0, [r1, r3]
	cmp r0, 0x5F
	bgt _08149B24
	adds r6, r2, 0
	cmp r0, 0x5
	bgt _08149B0E
	movs r4, 0
_08149AFC:
	lsls r0, r4, 28
	lsrs r0, 24
	bl sub_81496E4
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x8
	bls _08149AFC
_08149B0E:
	ldr r0, _08149B20
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149B28
	.align 2, 0
_08149B20: .4byte gTasks
_08149B24:
	ldr r0, _08149B30
	str r0, [r1]
_08149B28:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149B30: .4byte sub_8149B34
	thumb_func_end sub_8149ADC

	thumb_func_start sub_8149B34
sub_8149B34: @ 8149B34
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	thumb_func_end sub_8149B34

	thumb_func_start sub_8149B44
sub_8149B44: @ 8149B44
	push {lr}
	ldr r0, _08149B58
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08149B58: .4byte sub_8149B5C
	thumb_func_end sub_8149B44

	thumb_func_start sub_8149B5C
sub_8149B5C: @ 8149B5C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r1, _08149B88
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x26]
	ldr r1, _08149B8C
	str r1, [r0]
	movs r0, 0x66
	bl PlaySoundEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149B88: .4byte gTasks
_08149B8C: .4byte sub_8149B90
	thumb_func_end sub_8149B5C

	thumb_func_start sub_8149B90
sub_8149B90: @ 8149B90
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08149BFC
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0x26
	ldrsh r0, [r1, r3]
	cmp r0, 0x2F
	bgt _08149C00
	adds r6, r2, 0
	cmp r0, 0
	bne _08149BC4
	movs r4, 0
_08149BB0:
	lsls r0, r4, 28
	lsrs r0, 24
	movs r1, 0x4
	bl sub_8149794
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08149BB0
_08149BC4:
	ldr r0, _08149BFC
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x26
	ldrsh r0, [r1, r2]
	cmp r0, 0x20
	bne _08149BEA
	movs r4, 0
_08149BD6:
	lsls r0, r4, 28
	lsrs r0, 24
	movs r1, 0x8
	bl sub_8149794
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08149BD6
_08149BEA:
	ldr r0, _08149BFC
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149C04
	.align 2, 0
_08149BFC: .4byte gTasks
_08149C00:
	ldr r0, _08149C0C
	str r0, [r1]
_08149C04:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149C0C: .4byte sub_8149C10
	thumb_func_end sub_8149B90

	thumb_func_start sub_8149C10
sub_8149C10: @ 8149C10
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	thumb_func_end sub_8149C10

	thumb_func_start sub_8149C20
sub_8149C20: @ 8149C20
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08149C48
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08149C4C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xC]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149C48: .4byte sub_8149C50
_08149C4C: .4byte gTasks
	thumb_func_end sub_8149C20

	thumb_func_start sub_8149C50
sub_8149C50: @ 8149C50
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r0, _08149C98
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	movs r0, 0
	strh r0, [r5, 0x26]
	ldr r0, _08149C9C
	ldr r1, _08149CA0
	movs r2, 0x30
	bl CpuSet
	ldr r0, _08149CA4
	ldr r1, _08149CA8
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08149CAC
	str r0, [r5]
	movs r0, 0xCA
	bl PlaySoundEffect
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149C98: .4byte gTasks
_08149C9C: .4byte gPlttBufferFaded + 0x40
_08149CA0: .4byte gPlttBufferUnfaded + 0x40
_08149CA4: .4byte 0xfff9001c
_08149CA8: .4byte 0x00007fff
_08149CAC: .4byte sub_8149CB0
	thumb_func_end sub_8149C50

	thumb_func_start sub_8149CB0
sub_8149CB0: @ 8149CB0
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08149CE8
	lsls r5, r6, 2
	adds r0, r5, r6
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0x26
	ldrsh r2, [r1, r0]
	cmp r2, 0x7F
	bgt _08149D2C
	adds r0, r2, 0
	cmp r0, 0
	beq _08149CEC
	cmp r0, 0x20
	beq _08149D00
	cmp r2, 0x31
	bgt _08149D10
	bl Random
	movs r1, 0x7
	ands r0, r1
	bl sub_81498CC
	b _08149D10
	.align 2, 0
_08149CE8: .4byte gTasks
_08149CEC:
	movs r4, 0
_08149CEE:
	adds r0, r4, 0
	bl sub_81498CC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08149CEE
	b _08149D10
_08149D00:
	ldr r0, _08149D20
	ldr r1, _08149D24
	str r1, [sp]
	movs r1, 0x10
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_08149D10:
	ldr r0, _08149D28
	adds r1, r5, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149D30
	.align 2, 0
_08149D20: .4byte 0xffff001c
_08149D24: .4byte 0x00007fff
_08149D28: .4byte gTasks
_08149D2C:
	ldr r0, _08149D38
	str r0, [r1]
_08149D30:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149D38: .4byte sub_8149D3C
	thumb_func_end sub_8149CB0

	thumb_func_start sub_8149D3C
sub_8149D3C: @ 8149D3C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _08149D58
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08149D54
	adds r0, r2, 0
	bl DestroyTask
_08149D54:
	pop {r0}
	bx r0
	.align 2, 0
_08149D58: .4byte gPaletteFade
	thumb_func_end sub_8149D3C

	thumb_func_start sub_8149D5C
sub_8149D5C: @ 8149D5C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08149D84
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08149D88
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xC]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149D84: .4byte sub_8149D8C
_08149D88: .4byte gTasks
	thumb_func_end sub_8149D5C

	thumb_func_start sub_8149D8C
sub_8149D8C: @ 8149D8C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r0, _08149DD4
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	movs r0, 0
	strh r0, [r5, 0x26]
	ldr r0, _08149DD8
	ldr r1, _08149DDC
	movs r2, 0x30
	bl CpuSet
	ldr r0, _08149DE0
	ldr r1, _08149DE4
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08149DE8
	str r0, [r5]
	movs r0, 0xCA
	bl PlaySoundEffect
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149DD4: .4byte gTasks
_08149DD8: .4byte gPlttBufferFaded + 0x40
_08149DDC: .4byte gPlttBufferUnfaded + 0x40
_08149DE0: .4byte 0xfff90001
_08149DE4: .4byte 0x00007fff
_08149DE8: .4byte sub_8149DEC
	thumb_func_end sub_8149D8C

	thumb_func_start sub_8149DEC
sub_8149DEC: @ 8149DEC
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08149E24
	lsls r5, r6, 2
	adds r0, r5, r6
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0x26
	ldrsh r2, [r1, r0]
	cmp r2, 0x7F
	bgt _08149E68
	adds r0, r2, 0
	cmp r0, 0
	beq _08149E28
	cmp r0, 0x20
	beq _08149E3C
	cmp r2, 0x31
	bgt _08149E4C
	bl Random
	movs r1, 0x7
	ands r0, r1
	bl sub_81498CC
	b _08149E4C
	.align 2, 0
_08149E24: .4byte gTasks
_08149E28:
	movs r4, 0
_08149E2A:
	adds r0, r4, 0
	bl sub_81498CC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _08149E2A
	b _08149E4C
_08149E3C:
	ldr r0, _08149E5C
	ldr r1, _08149E60
	str r1, [sp]
	movs r1, 0x10
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_08149E4C:
	ldr r0, _08149E64
	adds r1, r5, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149E6C
	.align 2, 0
_08149E5C: .4byte 0xffff0001
_08149E60: .4byte 0x00007fff
_08149E64: .4byte gTasks
_08149E68:
	ldr r0, _08149E74
	str r0, [r1]
_08149E6C:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149E74: .4byte sub_8149D3C
	thumb_func_end sub_8149DEC

	thumb_func_start nullsub_85
nullsub_85: @ 8149E78
	bx lr
	thumb_func_end nullsub_85

	thumb_func_start sub_8149E7C
sub_8149E7C: @ 8149E7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	movs r1, 0
	ldr r3, _08149FB0
	ldr r2, _08149FB4
_08149E96:
	lsls r0, r1, 1
	add r0, sp
	adds r0, 0x4
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xF
	bls _08149E96
	adds r0, r3, 0
	movs r1, 0
	bl CreateTask
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _08149FB8
	mov r1, r8
	lsls r6, r1, 2
	add r6, r8
	lsls r6, 3
	adds r6, r0
	strh r5, [r6, 0xA]
	strh r7, [r6, 0xC]
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r6, 0xE]
	movs r0, 0x10
	strh r0, [r6, 0x10]
	movs r4, 0x80
	lsls r4, 9
	str r1, [sp]
	movs r0, 0x1E
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	movs r0, 0x10
	ldrsh r1, [r6, r0]
	adds r0, r4, 0
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x1F
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldr r1, _08149FBC
	mov r9, r1
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	mov r3, r9
	adds r3, 0x1C
	adds r0, r2, r3
	ldr r1, _08149FC0
	str r1, [r0]
	add r2, r9
	ldrb r1, [r2, 0x1]
	movs r4, 0x4
	negs r4, r4
	adds r0, r4, 0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x3C
	orrs r0, r1
	strb r0, [r2, 0x3]
	movs r0, 0x3E
	adds r0, r2
	mov r10, r0
	ldrb r1, [r0]
	movs r5, 0x5
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	mov r1, r10
	strb r0, [r1]
	ldrb r1, [r2, 0x5]
	lsrs r1, 4
	lsls r1, 5
	ldr r0, _08149FC4
	mov r10, r0
	add r1, r10
	add r0, sp, 0x4
	movs r2, 0x10
	str r3, [sp, 0x24]
	bl CpuSet
	lsls r1, r7, 4
	adds r1, r7
	lsls r1, 2
	ldr r3, [sp, 0x24]
	adds r3, r1, r3
	ldr r0, _08149FC0
	str r0, [r3]
	add r1, r9
	ldrb r0, [r1, 0x1]
	ands r4, r0
	movs r0, 0x1
	orrs r4, r0
	strb r4, [r1, 0x1]
	ldrb r0, [r1, 0x3]
	movs r2, 0x3E
	orrs r0, r2
	strb r0, [r1, 0x3]
	adds r2, r1, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	ands r5, r0
	strb r5, [r2]
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	lsls r1, 5
	add r1, r10
	add r0, sp, 0x4
	movs r2, 0x10
	bl CpuSet
	movs r1, 0
	strh r1, [r6, 0x18]
	mov r0, r8
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08149FB0: .4byte sub_8149FC8
_08149FB4: .4byte 0x00007fff
_08149FB8: .4byte gTasks
_08149FBC: .4byte gSprites
_08149FC0: .4byte nullsub_85
_08149FC4: .4byte gPlttBufferFaded + 0x200
	thumb_func_end sub_8149E7C

	thumb_func_start sub_8149FC8
sub_8149FC8: @ 8149FC8
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08149FE4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x12]
	movs r0, 0x8
	strh r0, [r1, 0x14]
	ldr r0, _08149FE8
	str r0, [r1]
	bx lr
	.align 2, 0
_08149FE4: .4byte gTasks
_08149FE8: .4byte sub_8149FEC
	thumb_func_end sub_8149FC8

	thumb_func_start sub_8149FEC
sub_8149FEC: @ 8149FEC
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0814A00C
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0x18
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _0814A010
	adds r0, r3, 0
	bl sub_814A208
	b _0814A032
	.align 2, 0
_0814A00C: .4byte gTasks
_0814A010:
	ldrh r1, [r2, 0x14]
	movs r4, 0x14
	ldrsh r0, [r2, r4]
	cmp r0, 0x80
	bne _0814A022
	adds r0, r3, 0
	bl sub_814A158
	b _0814A032
_0814A022:
	adds r0, r1, 0x2
	strh r0, [r2, 0x14]
	ldrh r0, [r2, 0x12]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r2, 0x12]
	ldr r0, _0814A038
	str r0, [r2]
_0814A032:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814A038: .4byte sub_814A03C
	thumb_func_end sub_8149FEC

	thumb_func_start sub_814A03C
sub_814A03C: @ 814A03C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0814A060
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x18
	ldrsh r0, [r2, r3]
	adds r5, r1, 0
	cmp r0, 0
	beq _0814A068
	ldr r0, _0814A064
	str r0, [r2]
	b _0814A14C
	.align 2, 0
_0814A060: .4byte gTasks
_0814A064: .4byte sub_814A208
_0814A068:
	movs r6, 0
	movs r7, 0x12
	ldrsh r0, [r2, r7]
	cmp r0, 0
	bne _0814A0B8
	movs r0, 0xE
	ldrsh r1, [r2, r0]
	movs r3, 0x14
	ldrsh r0, [r2, r3]
	movs r3, 0x80
	lsls r3, 1
	subs r0, r3, r0
	cmp r1, r0
	bge _0814A08E
	ldrh r0, [r2, 0x14]
	ldrh r7, [r2, 0xE]
	adds r0, r7
	strh r0, [r2, 0xE]
	b _0814A092
_0814A08E:
	strh r3, [r2, 0xE]
	movs r6, 0x1
_0814A092:
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r5
	movs r0, 0x10
	ldrsh r1, [r3, r0]
	movs r7, 0x14
	ldrsh r0, [r3, r7]
	adds r0, 0x10
	cmp r1, r0
	ble _0814A0B2
	ldrh r0, [r3, 0x10]
	ldrh r1, [r3, 0x14]
	subs r0, r1
	strh r0, [r3, 0x10]
	b _0814A102
_0814A0B2:
	movs r0, 0x10
	strh r0, [r3, 0x10]
	b _0814A0FC
_0814A0B8:
	movs r0, 0x10
	ldrsh r1, [r2, r0]
	movs r3, 0x14
	ldrsh r0, [r2, r3]
	movs r3, 0x80
	lsls r3, 1
	subs r0, r3, r0
	cmp r1, r0
	bge _0814A0D4
	ldrh r0, [r2, 0x14]
	ldrh r7, [r2, 0x10]
	adds r0, r7
	strh r0, [r2, 0x10]
	b _0814A0D8
_0814A0D4:
	strh r3, [r2, 0x10]
	movs r6, 0x1
_0814A0D8:
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r5
	movs r0, 0xE
	ldrsh r1, [r3, r0]
	movs r7, 0x14
	ldrsh r0, [r3, r7]
	adds r0, 0x10
	cmp r1, r0
	ble _0814A0F8
	ldrh r0, [r3, 0xE]
	ldrh r1, [r3, 0x14]
	subs r0, r1
	strh r0, [r3, 0xE]
	b _0814A102
_0814A0F8:
	movs r0, 0x10
	strh r0, [r3, 0xE]
_0814A0FC:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0814A102:
	adds r0, r2, r4
	lsls r0, 3
	adds r5, r0, r5
	movs r0, 0xE
	ldrsh r1, [r5, r0]
	movs r4, 0x80
	lsls r4, 9
	adds r0, r4, 0
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x1E
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	movs r3, 0x10
	ldrsh r1, [r5, r3]
	adds r0, r4, 0
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x1F
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	cmp r6, 0x2
	bne _0814A14C
	ldr r0, _0814A154
	str r0, [r5]
_0814A14C:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814A154: .4byte sub_8149FEC
	thumb_func_end sub_814A03C

	thumb_func_start sub_814A158
sub_814A158: @ 814A158
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0814A200
	mov r8, r1
	ldr r1, _0814A204
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x1]
	movs r6, 0x4
	negs r6, r6
	adds r1, r6, 0
	ands r1, r3
	strb r1, [r2, 0x1]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x3]
	movs r5, 0x3F
	negs r5, r5
	adds r1, r5, 0
	ands r1, r3
	strb r1, [r2, 0x3]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x1]
	ands r6, r2
	strb r6, [r1, 0x1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x3]
	ands r5, r2
	strb r5, [r1, 0x3]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	ands r2, r3
	strb r2, [r1]
	bl DestroyTask
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814A200: .4byte gSprites
_0814A204: .4byte gTasks
	thumb_func_end sub_814A158

	thumb_func_start sub_814A208
sub_814A208: @ 814A208
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0814A2B0
	mov r8, r1
	ldr r1, _0814A2B4
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x1]
	movs r6, 0x4
	negs r6, r6
	adds r1, r6, 0
	ands r1, r3
	strb r1, [r2, 0x1]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x3]
	movs r5, 0x3F
	negs r5, r5
	adds r1, r5, 0
	ands r1, r3
	strb r1, [r2, 0x3]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	ands r2, r3
	strb r2, [r1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x1]
	ands r6, r2
	strb r6, [r1, 0x1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x3]
	ands r5, r2
	strb r5, [r1, 0x3]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r1]
	bl DestroyTask
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814A2B0: .4byte gSprites
_0814A2B4: .4byte gTasks
	thumb_func_end sub_814A208

	thumb_func_start sub_814A2B8
sub_814A2B8: @ 814A2B8
	ldr r2, _0814A2CC
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	lsls r1, 1
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_0814A2CC: .4byte gUnknown_08417068
	thumb_func_end sub_814A2B8

	thumb_func_start sub_814A2D0
sub_814A2D0: @ 814A2D0
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _0814A2E8
	lsrs r0, 14
	adds r0, r2
	ldr r0, [r0]
	lsls r2, r1, 1
	adds r2, r1
	lsls r2, 4
	adds r0, r2
	bx lr
	.align 2, 0
_0814A2E8: .4byte gBardMusicTable
	thumb_func_end sub_814A2D0

	thumb_func_start sub_814A2EC
sub_814A2EC: @ 814A2EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	ldr r4, _0814A370
	adds r2, r1, 0
	adds r3, r6, 0
	adds r3, 0x18
	movs r7, 0x5
_0814A306:
	ldrb r0, [r2]
	strh r0, [r3]
	ldrb r0, [r2]
	cmp r0, 0xFF
	beq _0814A328
	movs r1, 0x1
	ldrsb r1, [r2, r1]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	adds r1, r0
	strh r1, [r3, 0x2]
	ldrh r0, [r2, 0x4]
	strh r0, [r3, 0x6]
	ldrh r0, [r6, 0x4]
	adds r0, r1
	strh r0, [r6, 0x4]
_0814A328:
	adds r2, 0x8
	adds r3, 0x8
	subs r7, 0x1
	cmp r7, 0
	bge _0814A306
	movs r7, 0x6
	movs r5, 0
	movs r0, 0x1E
	mov r8, r0
	adds r4, r6, 0
_0814A33C:
	mov r0, r8
	add r0, r9
	adds r1, r5, 0
	bl sub_814A2B8
	adds r1, r0, 0
	strh r1, [r4, 0x1C]
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, r7
	blt _0814A33C
	ldrb r1, [r6]
	adds r1, 0x1
	movs r2, 0
	strb r1, [r6]
	strb r2, [r6, 0x1]
	strb r2, [r6, 0x2]
	strb r2, [r6, 0x3]
	strh r2, [r6, 0xA]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814A370: .4byte gUnknown_084170F4
	thumb_func_end sub_814A2EC

	thumb_func_start SetUpFieldMove_Teleport
SetUpFieldMove_Teleport: @ 814A374
	push {lr}
	ldr r0, _0814A38C
	ldrb r0, [r0, 0x17]
	bl is_light_level_1_2_3_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0814A390
	movs r0, 0
	b _0814A39E
	.align 2, 0
_0814A38C: .4byte gMapHeader
_0814A390:
	ldr r1, _0814A3A4
	ldr r0, _0814A3A8
	str r0, [r1]
	ldr r1, _0814A3AC
	ldr r0, _0814A3B0
	str r0, [r1]
	movs r0, 0x1
_0814A39E:
	pop {r1}
	bx r1
	.align 2, 0
_0814A3A4: .4byte gUnknown_0300485C
_0814A3A8: .4byte sub_808AB90
_0814A3AC: .4byte gUnknown_03005CE4
_0814A3B0: .4byte hm_teleport_run_dp02scr
	thumb_func_end SetUpFieldMove_Teleport

	thumb_func_start hm_teleport_run_dp02scr
hm_teleport_run_dp02scr: @ 814A3B4
	push {lr}
	bl new_game
	movs r0, 0x3F
	bl FieldEffectStart
	ldr r0, _0814A3CC
	ldr r1, _0814A3D0
	ldrb r1, [r1]
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0814A3CC: .4byte gUnknown_0202FF84
_0814A3D0: .4byte gUnknown_03005CE0
	thumb_func_end hm_teleport_run_dp02scr

	thumb_func_start FldEff_UseTeleport
FldEff_UseTeleport: @ 814A3D4
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0814A3FC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0814A400
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0814A3FC: .4byte gTasks
_0814A400: .4byte sub_814A404
	thumb_func_end FldEff_UseTeleport

	thumb_func_start sub_814A404
sub_814A404: @ 814A404
	push {lr}
	movs r0, 0x3F
	bl FieldEffectActiveListRemove
	bl sub_8087BA8
	pop {r0}
	bx r0
	thumb_func_end sub_814A404

	thumb_func_start unref_sub_814A414
unref_sub_814A414: @ 814A414
	push {lr}
	sub sp, 0x8
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0
	movs r2, 0x10
	movs r3, 0x12
	bl MenuDrawTextWindow
	ldr r3, _0814A458
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x8
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0xF
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x8
	bl InitMenu
	ldr r1, _0814A45C
	ldr r0, _0814A460
	str r0, [r1]
	movs r0, 0
	add sp, 0x8
	pop {r1}
	bx r1
	.align 2, 0
_0814A458: .4byte gUnknown_0842C29C
_0814A45C: .4byte gCallback_03004AE8
_0814A460: .4byte sub_814A464
	thumb_func_end unref_sub_814A414

	thumb_func_start sub_814A464
sub_814A464: @ 814A464
	push {lr}
	bl ProcessMenuInput
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r0, r2, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	bne _0814A480
	movs r0, 0
	b _0814A4B2
_0814A480:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0814A4AC
	ldr r0, _0814A4A0
	strb r2, [r0]
	ldr r2, _0814A4A4
	ldr r0, _0814A4A8
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	str r0, [r2]
	movs r0, 0
	b _0814A4B2
	.align 2, 0
_0814A4A0: .4byte gUnknown_02024D1E
_0814A4A4: .4byte gCallback_03004AE8
_0814A4A8: .4byte gUnknown_0842C29C
_0814A4AC:
	bl sub_8071C20
	movs r0, 0x1
_0814A4B2:
	pop {r1}
	bx r1
	thumb_func_end sub_814A464

	thumb_func_start sub_814A4B8
sub_814A4B8: @ 814A4B8
	push {r4,lr}
	ldr r2, _0814A4FC
	ldr r1, _0814A500
	adds r0, r2, r1
	movs r1, 0x3
	strb r1, [r0]
	ldr r3, _0814A504
	adds r0, r2, r3
	strb r1, [r0]
	ldr r3, _0814A508
	ldrb r0, [r3]
	adds r0, 0x1
	ldr r4, _0814A50C
	adds r1, r2, r4
	strh r0, [r1]
	ldrb r0, [r3]
	adds r0, 0x1
	ldr r3, _0814A510
	adds r1, r2, r3
	strh r0, [r1]
	subs r4, 0x4
	adds r0, r2, r4
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, _0814A514
	adds r2, r0
	strh r1, [r2]
	bl sub_8071C20
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0814A4FC: .4byte gSaveBlock2
_0814A500: .4byte 0x00000556
_0814A504: .4byte 0x00000557
_0814A508: .4byte gUnknown_02024D1E
_0814A50C: .4byte 0x0000055c
_0814A510: .4byte 0x0000055e
_0814A514: .4byte 0x0000055a
	thumb_func_end sub_814A4B8

	thumb_func_start sub_814A518
sub_814A518: @ 814A518
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	bl SkipExtCtrlCodes
	adds r0, r4, 0
	bl StringLength
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r5, 0xFC
	bne _0814A556
	cmp r1, 0x5
	bhi _0814A55A
	movs r3, 0xFC
	movs r2, 0x7
_0814A53A:
	adds r0, r4, r1
	strb r3, [r0]
	strb r2, [r0, 0x1]
	adds r0, r1, 0x2
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x5
	bls _0814A53A
	b _0814A55A
_0814A54C:
	adds r0, r4, r1
	strb r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
_0814A556:
	cmp r1, 0x5
	bls _0814A54C
_0814A55A:
	adds r1, r4, r1
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_814A518

	thumb_func_start sub_814A568
sub_814A568: @ 814A568
	push {r4,lr}
	adds r4, r0, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5
	bhi _0814A582
	adds r0, r4, 0
	movs r1, 0x1
	bl ConvertInternationalString
	b _0814A588
_0814A582:
	adds r0, r4, 0
	bl SkipExtCtrlCodes
_0814A588:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_814A568

	thumb_func_start sub_814A590
sub_814A590: @ 814A590
	ldr r0, _0814A5AC
	movs r1, 0x40
	strb r1, [r0]
	ldr r0, _0814A5B0
	strb r1, [r0]
	ldr r0, _0814A5B4
	strb r1, [r0]
	ldr r0, _0814A5B8
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0814A5BC
	strb r1, [r0]
	bx lr
	.align 2, 0
_0814A5AC: .4byte gUnknown_0203A3D0
_0814A5B0: .4byte gUnknown_0203A3D1
_0814A5B4: .4byte gUnknown_0203A3D2
_0814A5B8: .4byte gUnknown_0203A3D3
_0814A5BC: .4byte gUnknown_0203A3D4
	thumb_func_end sub_814A590

	thumb_func_start sub_814A5C0
sub_814A5C0: @ 814A5C0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 16
	lsrs r7, r3, 16
	lsls r4, 24
	lsrs r4, 24
	mov r9, r4
	ldr r0, _0814A678
	ldrb r0, [r0]
	cmp r0, 0x40
	bne _0814A5F2
	ldr r0, _0814A67C
	ldrb r0, [r0]
	cmp r0, 0x40
	beq _0814A5F6
_0814A5F2:
	bl sub_814A7FC
_0814A5F6:
	movs r4, 0x1
	ldr r0, _0814A680
	cmp r6, r0
	bne _0814A61C
	ldr r1, _0814A684
	movs r0, 0xF
	ands r0, r5
	lsls r0, 1
	adds r0, r1
	strh r7, [r0]
	ldr r0, _0814A688
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0814A61C
	ldr r6, _0814A68C
	movs r4, 0
_0814A61C:
	movs r7, 0xF
	adds r0, r5, 0
	ands r0, r7
	lsls r0, 3
	ldr r1, _0814A690
	adds r0, r1
	bl LoadSpriteSheetDeferred
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r4, _0814A694
	adds r0, r4
	movs r1, 0
	movs r2, 0xA0
	mov r3, r8
	bl CreateSprite
	ldr r5, _0814A678
	strb r0, [r5]
	adds r4, 0x30
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xA0
	mov r3, r8
	bl CreateSprite
	ldr r1, _0814A67C
	strb r0, [r1]
	ldrb r0, [r5]
	cmp r0, 0x40
	beq _0814A6AE
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A698
	adds r4, r0, r1
	ldr r0, _0814A680
	cmp r6, r0
	bne _0814A69C
	ldrb r1, [r4, 0x5]
	adds r0, r7, 0
	ands r0, r1
	strb r0, [r4, 0x5]
	b _0814A6AE
	.align 2, 0
_0814A678: .4byte gUnknown_0203A3D0
_0814A67C: .4byte gUnknown_0203A3D1
_0814A680: .4byte 0x0000ffff
_0814A684: .4byte gUnknown_0203A360
_0814A688: .4byte gUnknown_0842F240
_0814A68C: .4byte 0x0000fff0
_0814A690: .4byte gUnknown_0842F140
_0814A694: .4byte gSpriteTemplate_842F250
_0814A698: .4byte gSprites
_0814A69C:
	adds r0, r6, 0
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r4, 0x5]
	adds r1, r7, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
_0814A6AE:
	ldr r1, _0814A6D4
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814A72C
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A6D8
	adds r4, r0, r1
	ldr r0, _0814A6DC
	cmp r6, r0
	bne _0814A6E0
	ldrb r1, [r4, 0x5]
	movs r0, 0xF
	ands r0, r1
	strb r0, [r4, 0x5]
	b _0814A6F2
	.align 2, 0
_0814A6D4: .4byte gUnknown_0203A3D1
_0814A6D8: .4byte gSprites
_0814A6DC: .4byte 0x0000ffff
_0814A6E0:
	adds r0, r6, 0
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r4, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
_0814A6F2:
	movs r3, 0x80
	lsls r3, 19
	ldrh r1, [r3]
	movs r0, 0xC0
	lsls r0, 7
	ands r0, r1
	cmp r0, 0
	bne _0814A70C
	ldr r0, _0814A744
	ldrb r1, [r0]
	movs r2, 0x1F
	orrs r1, r2
	strb r1, [r0]
_0814A70C:
	ldr r1, _0814A748
	ldrh r0, [r3]
	lsrs r0, 15
	strb r0, [r1]
	ldr r1, _0814A74C
	ldr r2, _0814A750
	ldrb r0, [r2]
	strb r0, [r1]
	ldrh r0, [r3]
	movs r4, 0x80
	lsls r4, 8
	adds r1, r4, 0
	orrs r0, r1
	strh r0, [r3]
	movs r0, 0x10
	strb r0, [r2]
_0814A72C:
	mov r0, r9
	bl sub_814A958
	ldr r0, _0814A754
	ldrb r0, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814A744: .4byte REG_WINOUT
_0814A748: .4byte gUnknown_0203A3D3
_0814A74C: .4byte gUnknown_0203A3D4
_0814A750: .4byte 0x0400004b
_0814A754: .4byte gUnknown_0203A3D0
	thumb_func_end sub_814A5C0

	thumb_func_start sub_814A758
sub_814A758: @ 814A758
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	movs r1, 0
	movs r3, 0
	bl sub_814A5C0
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	cmp r4, 0x40
	beq _0814A79A
	ldr r0, _0814A7A4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0814A7A8
	adds r1, r0
	lsls r3, r5, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
_0814A79A:
	adds r0, r4, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0814A7A4: .4byte gUnknown_0203A3D0
_0814A7A8: .4byte gSprites
	thumb_func_end sub_814A758

	thumb_func_start unref_sub_814A7AC
unref_sub_814A7AC: @ 814A7AC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r7, r2, 24
	movs r3, 0
	movs r2, 0xF
	movs r1, 0
	ldr r6, _0814A7F8
	movs r5, 0xF
_0814A7C6:
	lsls r0, r1, 1
	adds r0, r6
	ldrh r0, [r0]
	cmp r0, r4
	bne _0814A7DA
	lsrs r0, r1, 4
	lsls r0, 24
	lsrs r3, r0, 24
	adds r2, r1, 0
	ands r2, r5
_0814A7DA:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xFF
	bls _0814A7C6
	mov r0, r12
	adds r1, r3, 0
	adds r3, r7, 0
	bl sub_814A758
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814A7F8: .4byte gPlttBufferUnfaded
	thumb_func_end unref_sub_814A7AC

	thumb_func_start sub_814A7FC
sub_814A7FC: @ 814A7FC
	push {r4,lr}
	ldr r4, _0814A860
	ldrb r0, [r4]
	cmp r0, 0x40
	beq _0814A820
	ldr r0, _0814A864
	bl LoadTilesForSpriteSheet
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A868
	adds r0, r1
	bl DestroySpriteAndFreeResources
	movs r0, 0x40
	strb r0, [r4]
_0814A820:
	ldr r4, _0814A86C
	ldrb r0, [r4]
	cmp r0, 0x40
	beq _0814A858
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A868
	adds r0, r1
	bl DestroySpriteAndFreeResources
	movs r0, 0x40
	strb r0, [r4]
	ldr r0, _0814A870
	ldrb r0, [r0]
	cmp r0, 0
	bne _0814A850
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _0814A874
	ands r0, r1
	strh r0, [r2]
_0814A850:
	ldr r0, _0814A878
	ldr r1, _0814A87C
	ldrb r1, [r1]
	strb r1, [r0]
_0814A858:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814A860: .4byte gUnknown_0203A3D0
_0814A864: .4byte gUnknown_0842F140
_0814A868: .4byte gSprites
_0814A86C: .4byte gUnknown_0203A3D1
_0814A870: .4byte gUnknown_0203A3D3
_0814A874: .4byte 0x00007fff
_0814A878: .4byte 0x0400004b
_0814A87C: .4byte gUnknown_0203A3D4
	thumb_func_end sub_814A7FC

	thumb_func_start sub_814A880
sub_814A880: @ 814A880
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	lsls r1, 24
	lsrs r4, r1, 24
	adds r6, r4, 0
	ldr r1, _0814A8F8
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814A8C0
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A8FC
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x28
	movs r1, 0
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	strh r5, [r2, 0x20]
	strh r4, [r2, 0x22]
_0814A8C0:
	ldr r1, _0814A900
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814A8F2
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A8FC
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x28
	movs r1, 0
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	strh r7, [r2, 0x20]
	strh r6, [r2, 0x22]
_0814A8F2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814A8F8: .4byte gUnknown_0203A3D0
_0814A8FC: .4byte gSprites
_0814A900: .4byte gUnknown_0203A3D1
	thumb_func_end sub_814A880

	thumb_func_start sub_814A904
sub_814A904: @ 814A904
	push {lr}
	ldr r1, _0814A94C
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814A926
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A950
	adds r0, r1
	adds r2, r0, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0814A926:
	ldr r1, _0814A954
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814A946
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814A950
	adds r0, r1
	adds r2, r0, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_0814A946:
	pop {r0}
	bx r0
	.align 2, 0
_0814A94C: .4byte gUnknown_0203A3D0
_0814A950: .4byte gSprites
_0814A954: .4byte gUnknown_0203A3D1
	thumb_func_end sub_814A904

	thumb_func_start sub_814A958
sub_814A958: @ 814A958
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	ldr r4, _0814A9C4
	ldr r2, _0814A9C8
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r1, 0x2
	str r0, [r4]
	str r1, [r4, 0x4]
	strh r2, [r4]
	adds r4, 0x8
	movs r7, 0x1
	movs r2, 0x1
	ldr r1, [sp]
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0814AA3A
	ldr r0, _0814A9CC
	mov r12, r0
	mov r8, r1
	movs r1, 0x8
	negs r1, r1
	mov r10, r1
	ldr r5, _0814A9D0
	mov r9, r5
_0814A99E:
	lsls r0, r3, 16
	asrs r3, r0, 16
	cmp r3, 0x1F
	ble _0814A9D4
	mov r6, r12
	ldr r0, [r6]
	ldr r1, [r6, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	strh r2, [r4]
	lsls r0, r2, 16
	movs r1, 0x80
	lsls r1, 14
	adds r0, r1
	lsrs r2, r0, 16
	ldr r3, [sp]
	lsls r5, r3, 16
	b _0814AA20
	.align 2, 0
_0814A9C4: .4byte gSubspriteTable_203A380
_0814A9C8: .4byte 0x0000ffff
_0814A9CC: .4byte gUnknown_0842F780
_0814A9D0: .4byte gUnknown_0842F788
_0814A9D4:
	ldr r6, [sp]
	lsls r5, r6, 16
	mov r0, r8
	cmp r0, 0x27
	ble _0814AA0A
	cmp r3, 0x8
	ble _0814AA0A
	mov r6, r12
	ldr r0, [r6]
	ldr r1, [r6, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	lsls r1, r2, 16
	asrs r1, 16
	adds r2, r1, 0
	subs r2, 0x20
	adds r0, r3, 0
	mov r6, r10
	ands r0, r6
	adds r2, r0
	strh r2, [r4]
	movs r0, 0x18
	ands r0, r3
	adds r1, r0
	lsls r1, 16
	lsrs r2, r1, 16
	b _0814AA20
_0814AA0A:
	mov r3, r9
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	strh r2, [r4]
	lsls r0, r2, 16
	movs r6, 0x80
	lsls r6, 12
	adds r0, r6
	lsrs r2, r0, 16
_0814AA20:
	adds r4, 0x8
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	asrs r1, r5, 16
	lsls r0, r2, 16
	asrs r0, 16
	subs r1, r0
	lsls r1, 16
	lsrs r3, r1, 16
	asrs r1, 16
	cmp r1, 0x7
	bgt _0814A99E
_0814AA3A:
	ldr r5, _0814AAA8
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	str r0, [r4]
	str r1, [r4, 0x4]
	lsls r1, r2, 16
	asrs r1, 16
	subs r1, 0x7
	lsls r0, r3, 16
	asrs r0, 16
	adds r0, r1
	strh r0, [r4]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r6, _0814AAAC
	ldrb r0, [r6]
	cmp r0, 0x40
	beq _0814AA78
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AAB0
	adds r2, r0, r1
	lsls r1, r7, 3
	ldr r0, _0814AAB4
	adds r1, r0
	adds r0, r2, 0
	bl SetSubspriteTables
_0814AA78:
	ldr r1, _0814AAB8
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AA98
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AAB0
	adds r2, r0, r1
	lsls r1, r7, 3
	ldr r0, _0814AAB4
	adds r1, r0
	adds r0, r2, 0
	bl SetSubspriteTables
_0814AA98:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814AAA8: .4byte gUnknown_0842F790
_0814AAAC: .4byte gUnknown_0203A3D0
_0814AAB0: .4byte gSprites
_0814AAB4: .4byte gSubspriteTables_842F5C0
_0814AAB8: .4byte gUnknown_0203A3D1
	thumb_func_end sub_814A958

	thumb_func_start sub_814AABC
sub_814AABC: @ 814AABC
	push {lr}
	adds r2, r0, 0
	ldr r1, _0814AAEC
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AAD4
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0814AAF0
	adds r1, r0
	str r2, [r1, 0x1C]
_0814AAD4:
	ldr r1, _0814AAF4
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AAE8
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0814AAF0
	adds r1, r0
	str r2, [r1, 0x1C]
_0814AAE8:
	pop {r0}
	bx r0
	.align 2, 0
_0814AAEC: .4byte gUnknown_0203A3D0
_0814AAF0: .4byte gSprites
_0814AAF4: .4byte gUnknown_0203A3D1
	thumb_func_end sub_814AABC

	thumb_func_start sub_814AAF8
sub_814AAF8: @ 814AAF8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	ldr r1, _0814AB70
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AB66
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AB74
	adds r4, r0, r1
	ldr r0, [r4, 0x14]
	ldrh r1, [r0, 0x2]
	ldr r0, _0814AB78
	cmp r1, r0
	bne _0814AB66
	movs r2, 0
	movs r3, 0xF
	movs r1, 0
	ldrb r5, [r4, 0x5]
	ldr r0, _0814AB7C
	mov r8, r0
	ldr r7, _0814AB80
	movs r6, 0xF
_0814AB32:
	lsls r0, r1, 1
	adds r0, r7
	ldrh r0, [r0]
	cmp r0, r12
	bne _0814AB46
	lsrs r0, r1, 4
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r1, 0
	ands r3, r6
_0814AB46:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xFF
	bls _0814AB32
	lsls r2, 4
	movs r1, 0xF
	adds r0, r1, 0
	ands r0, r5
	orrs r0, r2
	strb r0, [r4, 0x5]
	ands r3, r1
	lsls r0, r3, 3
	add r0, r8
	bl RequestSpriteSheetCopy
_0814AB66:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814AB70: .4byte gUnknown_0203A3D0
_0814AB74: .4byte gSprites
_0814AB78: .4byte 0x0000ffff
_0814AB7C: .4byte gUnknown_0842F140
_0814AB80: .4byte gPlttBufferUnfaded
	thumb_func_end sub_814AAF8

	thumb_func_start sub_814AB84
sub_814AB84: @ 814AB84
	push {r4,r5,lr}
	ldr r5, _0814ABCC
	ldrb r0, [r5]
	cmp r0, 0x40
	beq _0814ABC4
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0814ABD0
	adds r4, r0
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	movs r0, 0x40
	strb r0, [r5]
	ldr r0, _0814ABD4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0814ABBC
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _0814ABD8
	ands r0, r1
	strh r0, [r2]
_0814ABBC:
	ldr r0, _0814ABDC
	ldr r1, _0814ABE0
	ldrb r1, [r1]
	strb r1, [r0]
_0814ABC4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814ABCC: .4byte gUnknown_0203A3D1
_0814ABD0: .4byte gSprites
_0814ABD4: .4byte gUnknown_0203A3D3
_0814ABD8: .4byte 0x00007fff
_0814ABDC: .4byte 0x0400004b
_0814ABE0: .4byte gUnknown_0203A3D4
	thumb_func_end sub_814AB84

	thumb_func_start unref_sub_814ABE4
unref_sub_814ABE4: @ 814ABE4
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0814AC40
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _0814AC44
	movs r2, 0x28
	bl CpuSet
	ldr r1, _0814AC48
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AC18
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AC4C
	adds r2, r0, r1
	lsls r1, r4, 3
	ldr r0, _0814AC50
	adds r1, r0
	adds r0, r2, 0
	bl SetSubspriteTables
_0814AC18:
	ldr r1, _0814AC54
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AC38
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AC4C
	adds r2, r0, r1
	lsls r1, r4, 3
	ldr r0, _0814AC50
	adds r1, r0
	adds r0, r2, 0
	bl SetSubspriteTables
_0814AC38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814AC40: .4byte gUnknown_0842F5BC
_0814AC44: .4byte gSubspriteTable_203A380
_0814AC48: .4byte gUnknown_0203A3D0
_0814AC4C: .4byte gSprites
_0814AC50: .4byte gUnknown_0842F758
_0814AC54: .4byte gUnknown_0203A3D1
	thumb_func_end unref_sub_814ABE4

	thumb_func_start sub_814AC58
sub_814AC58: @ 814AC58
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 16
	lsrs r6, r3, 16
	lsls r4, 24
	lsrs r4, 24
	mov r9, r4
	ldr r0, _0814ACF8
	ldrb r0, [r0]
	cmp r0, 0x40
	beq _0814AC86
	bl sub_814AD44
_0814AC86:
	movs r4, 0x1
	ldr r0, _0814ACFC
	cmp r5, r0
	bne _0814ACAC
	ldr r1, _0814AD00
	movs r0, 0xF
	ands r0, r7
	lsls r0, 1
	adds r0, r1
	strh r6, [r0]
	ldr r0, _0814AD04
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0814ACAC
	ldr r5, _0814AD08
	movs r4, 0
_0814ACAC:
	movs r6, 0xF
	adds r0, r7, 0
	ands r0, r6
	lsls r0, 3
	ldr r1, _0814AD0C
	adds r0, r1
	bl LoadSpriteSheetDeferred
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r1, _0814AD10
	adds r0, r1
	movs r1, 0
	movs r2, 0xA0
	mov r3, r8
	bl CreateSprite
	ldr r1, _0814ACF8
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0814AD2A
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AD14
	adds r4, r0, r1
	ldr r0, _0814ACFC
	cmp r5, r0
	bne _0814AD18
	ldrb r1, [r4, 0x5]
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r4, 0x5]
	b _0814AD2A
	.align 2, 0
_0814ACF8: .4byte gUnknown_0203A3D2
_0814ACFC: .4byte 0x0000ffff
_0814AD00: .4byte gUnknown_0203A360
_0814AD04: .4byte gUnknown_0842F248
_0814AD08: .4byte 0x0000fff1
_0814AD0C: .4byte gUnknown_0842F1C0
_0814AD10: .4byte gSpriteTemplate_842F298
_0814AD14: .4byte gSprites
_0814AD18:
	adds r0, r5, 0
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r4, 0x5]
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
_0814AD2A:
	mov r0, r9
	bl sub_814ADF4
	ldr r0, _0814AD40
	ldrb r0, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814AD40: .4byte gUnknown_0203A3D2
	thumb_func_end sub_814AC58

	thumb_func_start sub_814AD44
sub_814AD44: @ 814AD44
	push {r4,lr}
	ldr r4, _0814AD70
	ldrb r0, [r4]
	cmp r0, 0x40
	beq _0814AD68
	ldr r0, _0814AD74
	bl LoadTilesForSpriteSheet
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AD78
	adds r0, r1
	bl DestroySpriteAndFreeResources
	movs r0, 0x40
	strb r0, [r4]
_0814AD68:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814AD70: .4byte gUnknown_0203A3D2
_0814AD74: .4byte gUnknown_0842F1C0
_0814AD78: .4byte gSprites
	thumb_func_end sub_814AD44

	thumb_func_start sub_814AD7C
sub_814AD7C: @ 814AD7C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r1, _0814ADC0
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814ADB8
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814ADC4
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r0, r2, 0
	adds r0, 0x28
	movs r1, 0
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	strh r5, [r2, 0x20]
	strh r4, [r2, 0x22]
_0814ADB8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814ADC0: .4byte gUnknown_0203A3D2
_0814ADC4: .4byte gSprites
	thumb_func_end sub_814AD7C

	thumb_func_start sub_814ADC8
sub_814ADC8: @ 814ADC8
	push {lr}
	ldr r1, _0814ADEC
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814ADE8
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814ADF0
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_0814ADE8:
	pop {r0}
	bx r0
	.align 2, 0
_0814ADEC: .4byte gUnknown_0203A3D2
_0814ADF0: .4byte gSprites
	thumb_func_end sub_814ADC8

	thumb_func_start sub_814ADF4
sub_814ADF4: @ 814ADF4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x12
	bls _0814AE00
	movs r2, 0
_0814AE00:
	ldr r1, _0814AE24
	ldrb r0, [r1]
	cmp r0, 0x40
	beq _0814AE1E
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0814AE28
	adds r0, r1
	lsls r1, r2, 3
	ldr r2, _0814AE2C
	adds r1, r2
	bl SetSubspriteTables
_0814AE1E:
	pop {r0}
	bx r0
	.align 2, 0
_0814AE24: .4byte gUnknown_0203A3D2
_0814AE28: .4byte gSprites
_0814AE2C: .4byte gUnknown_0842F6C0
	thumb_func_end sub_814ADF4

	.align 2, 0 @ Don't pad with nop.
