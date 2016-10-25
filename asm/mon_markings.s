	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_80F727C
sub_80F727C: @ 80F727C
	ldr r1, _080F7288 @ =gUnknown_020388B8
	str r0, [r1]
	movs r1, 0
	strb r1, [r0, 0xB]
	bx lr
	.align 2, 0
_080F7288: .4byte gUnknown_020388B8
	thumb_func_end sub_80F727C

	thumb_func_start sub_80F728C
sub_80F728C: @ 80F728C
	push {lr}
	sub sp, 0x4
	ldr r0, _080F72C4 @ =gSaveBlock2
	ldrb r0, [r0, 0x14]
	lsrs r0, 3
	bl GetTextWindowFrameGraphics
	ldr r3, _080F72C8 @ =gUnknown_020388B8
	ldr r2, [r3]
	ldr r1, [r0]
	str r1, [r2, 0x28]
	ldr r0, [r0, 0x4]
	str r0, [r2, 0x2C]
	ldr r0, _080F72CC @ =0x000010b0
	adds r2, r0
	movs r1, 0
	strb r1, [r2]
	mov r0, sp
	strh r1, [r0]
	ldr r1, [r3]
	adds r1, 0x30
	ldr r2, _080F72D0 @ =0x01000800
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080F72C4: .4byte gSaveBlock2
_080F72C8: .4byte gUnknown_020388B8
_080F72CC: .4byte 0x000010b0
_080F72D0: .4byte 0x01000800
	thumb_func_end sub_80F728C

	thumb_func_start sub_80F72D4
sub_80F72D4: @ 80F72D4
	push {r4-r7,lr}
	ldr r0, _080F72F4 @ =gUnknown_020388B8
	ldr r1, [r0]
	ldr r2, _080F72F8 @ =0x000010b0
	adds r0, r1, r2
	ldrb r2, [r0]
	lsls r0, r2, 8
	adds r0, 0x30
	adds r5, r1, r0
	cmp r2, 0xD
	beq _080F73A4
	cmp r2, 0xD
	bgt _080F72FC
	cmp r2, 0
	beq _080F7302
	b _080F734C
	.align 2, 0
_080F72F4: .4byte gUnknown_020388B8
_080F72F8: .4byte 0x000010b0
_080F72FC:
	cmp r2, 0xE
	beq _080F73F0
	b _080F734C
_080F7302:
	ldr r0, [r1, 0x28]
	adds r1, r5, 0
	movs r2, 0x8
	bl CpuFastSet
	movs r4, 0
	adds r7, r5, 0
	adds r7, 0xE0
_080F7312:
	ldr r6, _080F7344 @ =gUnknown_020388B8
	ldr r0, [r6]
	ldr r0, [r0, 0x28]
	adds r0, 0x20
	adds r4, 0x1
	lsls r1, r4, 5
	adds r1, r5, r1
	movs r2, 0x8
	bl CpuFastSet
	lsls r4, 16
	lsrs r4, 16
	cmp r4, 0x5
	bls _080F7312
	ldr r0, [r6]
	ldr r0, [r0, 0x28]
	adds r0, 0x40
	adds r1, r7, 0
	movs r2, 0x8
	bl CpuFastSet
	ldr r1, [r6]
	ldr r0, _080F7348 @ =0x000010b0
	adds r1, r0
	b _080F7392
	.align 2, 0
_080F7344: .4byte gUnknown_020388B8
_080F7348: .4byte 0x000010b0
_080F734C:
	ldr r0, _080F739C @ =gUnknown_020388B8
	ldr r0, [r0]
	ldr r0, [r0, 0x28]
	adds r0, 0x60
	adds r1, r5, 0
	movs r2, 0x8
	bl CpuFastSet
	movs r4, 0
	adds r7, r5, 0
	adds r7, 0xE0
_080F7362:
	ldr r6, _080F739C @ =gUnknown_020388B8
	ldr r0, [r6]
	ldr r0, [r0, 0x28]
	adds r0, 0x80
	adds r4, 0x1
	lsls r1, r4, 5
	adds r1, r5, r1
	movs r2, 0x8
	bl CpuFastSet
	lsls r4, 16
	lsrs r4, 16
	cmp r4, 0x5
	bls _080F7362
	ldr r0, [r6]
	ldr r0, [r0, 0x28]
	adds r0, 0xA0
	adds r1, r7, 0
	movs r2, 0x8
	bl CpuFastSet
	ldr r1, [r6]
	ldr r2, _080F73A0 @ =0x000010b0
	adds r1, r2
_080F7392:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080F73FC
	.align 2, 0
_080F739C: .4byte gUnknown_020388B8
_080F73A0: .4byte 0x000010b0
_080F73A4:
	ldr r0, [r1, 0x28]
	adds r0, 0xC0
	adds r1, r5, 0
	movs r2, 0x8
	bl CpuFastSet
	movs r4, 0
	adds r7, r5, 0
	adds r7, 0xE0
_080F73B6:
	ldr r6, _080F73F4 @ =gUnknown_020388B8
	ldr r0, [r6]
	ldr r0, [r0, 0x28]
	adds r0, 0xE0
	adds r4, 0x1
	lsls r1, r4, 5
	adds r1, r5, r1
	movs r2, 0x8
	bl CpuFastSet
	lsls r4, 16
	lsrs r4, 16
	cmp r4, 0x5
	bls _080F73B6
	ldr r0, [r6]
	ldr r0, [r0, 0x28]
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	adds r1, r7, 0
	movs r2, 0x8
	bl CpuFastSet
	ldr r1, [r6]
	ldr r2, _080F73F8 @ =0x000010b0
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080F73F0:
	movs r0, 0
	b _080F73FE
	.align 2, 0
_080F73F4: .4byte gUnknown_020388B8
_080F73F8: .4byte 0x000010b0
_080F73FC:
	movs r0, 0x1
_080F73FE:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F72D4

	thumb_func_start sub_80F7404
sub_80F7404: @ 80F7404
	push {lr}
	bl sub_80F728C
_080F740A:
	bl sub_80F72D4
	lsls r0, 24
	cmp r0, 0
	bne _080F740A
	pop {r0}
	bx r0
	thumb_func_end sub_80F7404

	thumb_func_start sub_80F7418
sub_80F7418: @ 80F7418
	push {r4-r6,lr}
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	ldr r2, _080F746C @ =gUnknown_020388B8
	ldr r3, [r2]
	movs r1, 0
	strb r1, [r3, 0x5]
	ldr r1, [r2]
	strb r0, [r1, 0x4]
	movs r3, 0
	adds r4, r2, 0
	movs r2, 0x1
_080F7434:
	ldr r0, [r4]
	adds r1, r0, 0x6
	adds r1, r3
	ldrb r0, [r0, 0x4]
	asrs r0, r3
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080F7434
	bl sub_814A7FC
	lsls r0, r5, 16
	asrs r0, 16
	lsls r1, r6, 16
	asrs r1, 16
	ldr r2, _080F746C @ =gUnknown_020388B8
	ldr r3, [r2]
	ldrh r2, [r3]
	ldrh r3, [r3, 0x2]
	bl sub_80F761C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F746C: .4byte gUnknown_020388B8
	thumb_func_end sub_80F7418

	thumb_func_start sub_80F7470
sub_80F7470: @ 80F7470
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _080F74FC @ =gUnknown_020388B8
_080F7476:
	ldr r0, [r5]
	ldrh r0, [r0]
	adds r0, r4, r0
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpriteTilesByTag
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _080F7476
	ldr r4, _080F74FC @ =gUnknown_020388B8
	ldr r0, [r4]
	ldrh r0, [r0, 0x2]
	bl FreeSpritePaletteByTag
	ldr r0, [r4]
	ldrh r0, [r0, 0x2]
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	movs r4, 0
_080F74A8:
	ldr r0, _080F74FC @ =gUnknown_020388B8
	ldr r0, [r0]
	lsls r1, r4, 2
	adds r0, 0xC
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _080F74F6
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1
	bls _080F74A8
	movs r4, 0
_080F74C8:
	ldr r5, _080F74FC @ =gUnknown_020388B8
	ldr r0, [r5]
	lsls r1, r4, 2
	adds r0, 0x14
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	beq _080F74F6
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080F74C8
	bl sub_814A7FC
	ldr r0, [r5]
	ldr r0, [r0, 0x24]
	cmp r0, 0
	beq _080F74F6
	bl DestroySprite
_080F74F6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F74FC: .4byte gUnknown_020388B8
	thumb_func_end sub_80F7470

	thumb_func_start sub_80F7500
sub_80F7500: @ 80F7500
	push {r4,r5,lr}
	sub sp, 0x30
	ldr r4, _080F7580 @ =gUnknown_020388B8
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x30
	str r0, [sp, 0x18]
	add r1, sp, 0x1C
	movs r5, 0
	movs r0, 0x80
	lsls r0, 5
	strh r0, [r1]
	ldrh r1, [r2]
	mov r0, sp
	adds r0, 0x1E
	strh r1, [r0]
	add r1, sp, 0x20
	ldr r0, _080F7584 @ =gPokenavConditionMenuMisc_Gfx
	str r0, [sp, 0x20]
	movs r0, 0xA4
	lsls r0, 3
	strh r0, [r1, 0x4]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r1, 0x6]
	add r0, sp, 0x28
	movs r1, 0
	movs r2, 0x8
	bl memset
	add r1, sp, 0x18
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	ldr r0, [r4]
	ldrb r0, [r0, 0xB]
	cmp r0, 0
	beq _080F7558
	mov r0, sp
	bl LoadTilesForSpriteSheets
	ldr r0, [r4]
	strb r5, [r0, 0xB]
_080F7558:
	ldr r0, _080F7588 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080F758C
	movs r0, 0x5
	bl PlaySE
	ldr r1, [r4]
	ldrb r0, [r1, 0x5]
	subs r0, 0x1
	strb r0, [r1, 0x5]
	lsls r0, 24
	cmp r0, 0
	bge _080F75FE
	ldr r1, [r4]
	movs r0, 0x5
	strb r0, [r1, 0x5]
	b _080F75FE
	.align 2, 0
_080F7580: .4byte gUnknown_020388B8
_080F7584: .4byte gPokenavConditionMenuMisc_Gfx
_080F7588: .4byte gMain
_080F758C:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080F75B0
	movs r0, 0x5
	bl PlaySE
	ldr r1, [r4]
	ldrb r0, [r1, 0x5]
	adds r0, 0x1
	strb r0, [r1, 0x5]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x5
	ble _080F75FE
	ldr r0, [r4]
	strb r5, [r0, 0x5]
	b _080F75FE
_080F75B0:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080F7602
	movs r0, 0x5
	bl PlaySE
	ldr r0, [r4]
	movs r1, 0x5
	ldrsb r1, [r0, r1]
	cmp r1, 0x4
	beq _080F75DC
	cmp r1, 0x5
	beq _080F7610
	adds r0, 0x6
	adds r1, r0, r1
	movs r2, 0
	ldrb r0, [r1]
	cmp r0, 0
	bne _080F75FC
	movs r2, 0x1
	b _080F75FC
_080F75DC:
	strb r5, [r0, 0x4]
	movs r3, 0
_080F75E0:
	ldr r2, [r4]
	adds r0, r2, 0x6
	adds r0, r3
	ldrb r0, [r0]
	lsls r0, r3
	ldrb r1, [r2, 0x4]
	orrs r0, r1
	strb r0, [r2, 0x4]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080F75E0
	b _080F7610
_080F75FC:
	strb r2, [r1]
_080F75FE:
	movs r0, 0x1
	b _080F7612
_080F7602:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080F75FE
	movs r0, 0x5
	bl PlaySE
_080F7610:
	movs r0, 0
_080F7612:
	add sp, 0x30
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F7500

	thumb_func_start sub_80F761C
sub_80F761C: @ 80F761C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x5C
	adds r5, r2, 0
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x4C]
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x50]
	lsls r5, 16
	lsrs r5, 16
	lsls r3, 16
	lsrs r3, 16
	str r3, [sp, 0x54]
	ldr r0, _080F7820 @ =gUnknown_020388B8
	mov r8, r0
	ldr r0, [r0]
	adds r0, 0x30
	str r0, [sp, 0x1C]
	add r1, sp, 0x20
	movs r2, 0
	mov r9, r2
	movs r0, 0x80
	lsls r0, 5
	strh r0, [r1]
	mov r0, sp
	adds r0, 0x22
	strh r5, [r0]
	add r1, sp, 0x24
	ldr r0, _080F7824 @ =gPokenavConditionMenuMisc_Gfx
	str r0, [sp, 0x24]
	movs r0, 0xA4
	lsls r0, 3
	strh r0, [r1, 0x4]
	adds r0, r5, 0x1
	strh r0, [r1, 0x6]
	add r0, sp, 0x2C
	movs r1, 0
	movs r2, 0x8
	bl memset
	add r6, sp, 0x1C
	add r0, sp, 0x4
	adds r1, r6, 0
	movs r2, 0x18
	bl memcpy
	mov r3, r8
	ldr r0, [r3]
	ldr r0, [r0, 0x2C]
	str r0, [sp, 0x34]
	add r0, sp, 0x38
	add r1, sp, 0x54
	ldrh r1, [r1]
	strh r1, [r0]
	add r1, sp, 0x3C
	ldr r0, _080F7828 @ =gUnknown_08E966B8
	str r0, [sp, 0x3C]
	ldr r0, [sp, 0x54]
	adds r0, 0x1
	strh r0, [r1, 0x4]
	add r0, sp, 0x44
	movs r1, 0
	movs r2, 0x8
	bl memset
	add r4, sp, 0x34
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x18
	bl memcpy
	strh r5, [r4]
	add r2, sp, 0x54
	ldrh r2, [r2]
	strh r2, [r4, 0x2]
	ldr r0, _080F782C @ =gUnknown_083E5214
	str r0, [r4, 0x4]
	ldr r0, _080F7830 @ =gSpriteAnimTable_83E52AC
	str r0, [r4, 0x8]
	mov r3, r9
	str r3, [r4, 0xC]
	ldr r0, _080F7834 @ =gDummySpriteAffineAnimTable
	str r0, [r4, 0x10]
	ldr r0, _080F7838 @ =nullsub_65
	str r0, [r4, 0x14]
	mov r0, r8
	ldr r1, [r0]
	movs r0, 0x1
	strb r0, [r1, 0xB]
	add r0, sp, 0x4
	bl AllocTilesForSpriteSheets
	adds r0, r6, 0
	bl LoadSpritePalettes
	movs r5, 0
	ldr r1, [sp, 0x4C]
	lsls r0, r1, 16
	movs r2, 0x80
	lsls r2, 14
	adds r2, r0
	mov r8, r2
	str r0, [sp, 0x58]
	ldr r3, [sp, 0x50]
	lsls r0, r3, 16
	movs r1, 0x80
	lsls r1, 14
	adds r7, r0, r1
	mov r9, r0
_080F7700:
	adds r0, r4, 0
	mov r2, r8
	asrs r1, r2, 16
	asrs r2, r7, 16
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	bne _080F7718
	b _080F7850
_080F7718:
	ldr r6, _080F7820 @ =gUnknown_020388B8
	ldr r2, [r6]
	lsls r0, r5, 2
	adds r2, 0xC
	adds r2, r0
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r1, _080F783C @ =gSprites
	adds r0, r1
	str r0, [r2]
	lsls r1, r5, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1
	bls _080F7700
	ldr r0, [r6]
	ldr r1, [r0, 0x10]
	mov r3, r9
	asrs r0, r3, 16
	adds r0, 0x60
	strh r0, [r1, 0x22]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	ldr r0, _080F7840 @ =gSpriteAnimTable_83E5274
	str r0, [r4, 0x8]
	ldr r0, _080F7844 @ =sub_80F78CC
	str r0, [r4, 0x14]
	ldr r0, _080F7848 @ =gUnknown_083E521C
	str r0, [r4, 0x4]
	movs r5, 0
	ldr r0, [sp, 0x58]
	movs r1, 0x80
	lsls r1, 14
	adds r0, r1
	mov r10, r0
_080F7770:
	lsls r2, r5, 4
	adds r2, 0x10
	mov r3, r9
	asrs r3, 16
	mov r8, r3
	add r2, r8
	lsls r2, 16
	asrs r2, 16
	adds r0, r4, 0
	mov r3, r10
	asrs r1, r3, 16
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080F7860
	ldr r6, _080F7820 @ =gUnknown_020388B8
	ldr r1, [r6]
	lsls r0, r5, 2
	adds r1, 0x14
	adds r1, r0
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r7, _080F783C @ =gSprites
	adds r0, r7
	str r0, [r1]
	strh r5, [r0, 0x2E]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080F7770
	ldr r0, _080F784C @ =SpriteCallbackDummy
	str r0, [r4, 0x14]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _080F7874
	ldr r1, [r6]
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	adds r0, r7
	str r0, [r1, 0x24]
	ldrb r2, [r0, 0x1]
	movs r1, 0x3F
	ands r1, r2
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldr r0, [r6]
	ldr r2, [r0, 0x24]
	ldrb r0, [r2, 0x3]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r2, 0x3]
	ldr r0, [r6]
	ldr r0, [r0, 0x24]
	movs r1, 0x9
	bl StartSpriteAnim
	ldr r1, [r6]
	ldr r2, [r1, 0x24]
	ldr r3, [sp, 0x58]
	asrs r0, r3, 16
	adds r0, 0x20
	strh r0, [r2, 0x20]
	ldr r2, [r1, 0x24]
	mov r0, r8
	adds r0, 0x50
	strh r0, [r2, 0x22]
	ldr r0, [r1, 0x24]
	movs r1, 0x1
	movs r2, 0x2
	movs r3, 0
	bl CalcCenterToCornerVec
	b _080F787A
	.align 2, 0
_080F7820: .4byte gUnknown_020388B8
_080F7824: .4byte gPokenavConditionMenuMisc_Gfx
_080F7828: .4byte gUnknown_08E966B8
_080F782C: .4byte gUnknown_083E5214
_080F7830: .4byte gSpriteAnimTable_83E52AC
_080F7834: .4byte gDummySpriteAffineAnimTable
_080F7838: .4byte nullsub_65
_080F783C: .4byte gSprites
_080F7840: .4byte gSpriteAnimTable_83E5274
_080F7844: .4byte sub_80F78CC
_080F7848: .4byte gUnknown_083E521C
_080F784C: .4byte SpriteCallbackDummy
_080F7850:
	ldr r0, _080F785C @ =gUnknown_020388B8
	ldr r0, [r0]
	lsls r1, r5, 2
	adds r0, 0xC
	b _080F7868
	.align 2, 0
_080F785C: .4byte gUnknown_020388B8
_080F7860:
	ldr r0, _080F7870 @ =gUnknown_020388B8
	ldr r0, [r0]
	lsls r1, r5, 2
	adds r0, 0x14
_080F7868:
	adds r0, r1
	movs r1, 0
	str r1, [r0]
	b _080F78B0
	.align 2, 0
_080F7870: .4byte gUnknown_020388B8
_080F7874:
	ldr r1, [r6]
	movs r0, 0
	str r0, [r1, 0x24]
_080F787A:
	ldr r4, _080F78C0 @ =gUnknown_020388B8
	ldr r1, [r4]
	ldr r0, [sp, 0x50]
	adds r0, 0x8
	strb r0, [r1, 0xA]
	ldr r1, [sp, 0x54]
	adds r1, 0x1
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x30
	str r0, [sp]
	movs r0, 0
	movs r2, 0xF
	movs r3, 0
	bl sub_814A5C0
	ldr r0, [sp, 0x4C]
	adds r0, 0x8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	ldrb r1, [r1, 0xA]
	bl sub_814A880
	ldr r0, _080F78C4 @ =sub_80F7908
	bl sub_814AABC
_080F78B0:
	add sp, 0x5C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F78C0: .4byte gUnknown_020388B8
_080F78C4: .4byte sub_80F7908
	thumb_func_end sub_80F761C

	thumb_func_start nullsub_65
nullsub_65: @ 80F78C8
	bx lr
	thumb_func_end nullsub_65

	thumb_func_start sub_80F78CC
sub_80F78CC: @ 80F78CC
	push {lr}
	adds r2, r0, 0
	ldr r0, _080F78F4 @ =gUnknown_020388B8
	ldr r0, [r0]
	movs r3, 0x2E
	ldrsh r1, [r2, r3]
	adds r0, 0x6
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080F78F8
	lsls r1, 1
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r2, 0
	bl StartSpriteAnim
	b _080F7902
	.align 2, 0
_080F78F4: .4byte gUnknown_020388B8
_080F78F8:
	lsls r1, 25
	lsrs r1, 24
	adds r0, r2, 0
	bl StartSpriteAnim
_080F7902:
	pop {r0}
	bx r0
	thumb_func_end sub_80F78CC

	thumb_func_start sub_80F7908
sub_80F7908: @ 80F7908
	ldr r1, _080F791C @ =gUnknown_020388B8
	ldr r2, [r1]
	movs r1, 0x5
	ldrsb r1, [r2, r1]
	lsls r1, 4
	ldrb r2, [r2, 0xA]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080F791C: .4byte gUnknown_020388B8
	thumb_func_end sub_80F7908

	thumb_func_start sub_80F7920
sub_80F7920: @ 80F7920
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	cmp r2, 0
	bne _080F7930
	ldr r2, _080F793C @ =gUnknown_083E49F4
_080F7930:
	movs r3, 0x10
	bl sub_80F7960
	pop {r1}
	bx r1
	.align 2, 0
_080F793C: .4byte gUnknown_083E49F4
	thumb_func_end sub_80F7920

	thumb_func_start sub_80F7940
sub_80F7940: @ 80F7940
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	cmp r2, 0
	bne _080F7950
	ldr r2, _080F795C @ =gUnknown_083E49F4
_080F7950:
	movs r3, 0x1
	bl sub_80F7960
	pop {r1}
	bx r1
	.align 2, 0
_080F795C: .4byte gUnknown_083E49F4
	thumb_func_end sub_80F7940

	thumb_func_start sub_80F7960
sub_80F7960: @ 80F7960
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x28
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r4, _080F79DC @ =gUnknown_083E4A14
	str r4, [sp, 0x18]
	movs r4, 0x80
	add r5, sp, 0x18
	lsrs r6, r0, 16
	orrs r0, r4
	str r0, [r5, 0x4]
	str r2, [sp, 0x20]
	ldr r0, _080F79E0 @ =0xffff0000
	mov r8, r0
	add r4, sp, 0x20
	ldr r0, [r4, 0x4]
	mov r2, r8
	ands r0, r2
	orrs r0, r1
	str r0, [r4, 0x4]
	mov r0, sp
	movs r2, 0
	strh r6, [r0]
	strh r1, [r0, 0x2]
	ldr r0, _080F79E4 @ =gUnknown_083E52B4
	str r0, [sp, 0x4]
	ldr r0, _080F79E8 @ =gSpriteAnimTable_83E533C
	str r0, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r0, _080F79EC @ =gDummySpriteAffineAnimTable
	str r0, [sp, 0x10]
	ldr r0, _080F79F0 @ =nullsub_65
	str r0, [sp, 0x14]
	lsls r3, 23
	lsrs r3, 16
	ldr r0, [r5, 0x4]
	mov r1, r8
	ands r0, r1
	orrs r0, r3
	str r0, [r5, 0x4]
	adds r0, r5, 0
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	mov r0, sp
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	bne _080F79F4
	movs r0, 0
	b _080F79FE
	.align 2, 0
_080F79DC: .4byte gUnknown_083E4A14
_080F79E0: .4byte 0xffff0000
_080F79E4: .4byte gUnknown_083E52B4
_080F79E8: .4byte gSpriteAnimTable_83E533C
_080F79EC: .4byte gDummySpriteAffineAnimTable
_080F79F0: .4byte nullsub_65
_080F79F4:
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080F7A0C @ =gSprites
	adds r0, r1
_080F79FE:
	add sp, 0x28
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080F7A0C: .4byte gSprites
	thumb_func_end sub_80F7960

	thumb_func_start sub_80F7A10
sub_80F7A10: @ 80F7A10
	lsls r0, 24
	lsrs r0, 17
	ldr r2, _080F7A28 @ =gUnknown_083E4A14
	adds r0, r2
	ldr r2, _080F7A2C @ =0x040000d4
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _080F7A30 @ =0x80000040
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	bx lr
	.align 2, 0
_080F7A28: .4byte gUnknown_083E4A14
_080F7A2C: .4byte 0x040000d4
_080F7A30: .4byte 0x80000040
	thumb_func_end sub_80F7A10

	.align 2, 0 @ Don't pad with nop.
