	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_14
nullsub_14: @ 807AD54
	bx lr
	thumb_func_end nullsub_14

	thumb_func_start sub_807AD58
sub_807AD58: @ 807AD58
	push {lr}
	ldr r2, _0807AD90 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, _0807AD94 @ =REG_MOSAIC
	movs r2, 0
	strh r2, [r0]
	ldr r0, _0807AD98 @ =0x02000000
	ldr r3, _0807AD9C @ =0x0001ffff
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _0807ADA0 @ =0x0001fffe
	adds r0, r1
	strb r2, [r0]
	ldr r0, _0807ADA4 @ =sub_807ADA8
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0807AD90: .4byte gPaletteFade
_0807AD94: .4byte REG_MOSAIC
_0807AD98: .4byte 0x02000000
_0807AD9C: .4byte 0x0001ffff
_0807ADA0: .4byte 0x0001fffe
_0807ADA4: .4byte sub_807ADA8
	thumb_func_end sub_807AD58

	thumb_func_start sub_807ADA8
sub_807ADA8: @ 807ADA8
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r0, _0807ADC4 @ =0x02000000
	ldr r1, _0807ADC8 @ =0x0001ffff
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x13
	bls _0807ADBA
	b _0807B010
_0807ADBA:
	lsls r0, 2
	ldr r1, _0807ADCC @ =_0807ADD0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807ADC4: .4byte 0x02000000
_0807ADC8: .4byte 0x0001ffff
_0807ADCC: .4byte _0807ADD0
	.align 2, 0
_0807ADD0:
	.4byte _0807AE20
	.4byte _0807AE84
	.4byte _0807AE9C
	.4byte _0807AEC8
	.4byte _0807AECE
	.4byte _0807AEE0
	.4byte _0807AEE6
	.4byte _0807AF18
	.4byte _0807AF1C
	.4byte _0807AF20
	.4byte _0807AF24
	.4byte _0807AF48
	.4byte _0807AF50
	.4byte _0807AF58
	.4byte _0807AF60
	.4byte _0807AF68
	.4byte _0807AF70
	.4byte _0807AF78
	.4byte _0807AF80
	.4byte _0807AF88
_0807AE20:
	bl dp12_8087EA4
	ldr r4, _0807AE5C @ =gWindowConfig_81E6C58
	adds r0, r4, 0
	bl SetUpWindowConfig
	bl ResetPaletteFade
	ldr r0, _0807AE60 @ =gUnknown_03004210
	adds r1, r4, 0
	bl InitWindowFromConfig
	ldr r0, _0807AE64 @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0807AE68 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r0, _0807AE6C @ =gUnknown_030042C0
	strh r1, [r0]
	ldr r0, _0807AE70 @ =gUnknown_030041B4
	strh r1, [r0]
	ldr r0, _0807AE74 @ =gUnknown_03004288
	strh r1, [r0]
	ldr r0, _0807AE78 @ =gUnknown_03004280
	strh r1, [r0]
	ldr r0, _0807AE7C @ =gUnknown_030041B0
	strh r1, [r0]
	ldr r0, _0807AE80 @ =gUnknown_030041B8
	strh r1, [r0]
	b _0807B040
	.align 2, 0
_0807AE5C: .4byte gWindowConfig_81E6C58
_0807AE60: .4byte gUnknown_03004210
_0807AE64: .4byte gUnknown_030042A4
_0807AE68: .4byte gUnknown_030042A0
_0807AE6C: .4byte gUnknown_030042C0
_0807AE70: .4byte gUnknown_030041B4
_0807AE74: .4byte gUnknown_03004288
_0807AE78: .4byte gUnknown_03004280
_0807AE7C: .4byte gUnknown_030041B0
_0807AE80: .4byte gUnknown_030041B8
_0807AE84:
	movs r0, 0
	str r0, [sp, 0x4]
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _0807AE98 @ =0x01006000
	add r0, sp, 0x4
	bl CpuFastSet
	b _0807B040
	.align 2, 0
_0807AE98: .4byte 0x01006000
_0807AE9C:
	ldr r5, _0807AEBC @ =0x02000000
	ldr r0, _0807AEC0 @ =0x0001fffe
	adds r4, r5, r0
	ldrb r0, [r4]
	bl sub_800E414
	lsls r0, 24
	cmp r0, 0
	bne _0807AEF8
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r0, _0807AEC4 @ =0x0001ffff
	adds r1, r5, r0
	b _0807AF38
	.align 2, 0
_0807AEBC: .4byte 0x02000000
_0807AEC0: .4byte 0x0001fffe
_0807AEC4: .4byte 0x0001ffff
_0807AEC8:
	bl ResetSpriteData
	b _0807B040
_0807AECE:
	bl FreeAllSpritePalettes
	ldr r1, _0807AEDC @ =gReservedSpritePaletteCount
	movs r0, 0x4
	strb r0, [r1]
	b _0807B040
	.align 2, 0
_0807AEDC: .4byte gReservedSpritePaletteCount
_0807AEE0:
	bl sub_8031EE8
	b _0807B040
_0807AEE6:
	ldr r5, _0807AF00 @ =0x02000000
	ldr r1, _0807AF04 @ =0x0001fffe
	adds r4, r5, r1
	ldrb r0, [r4]
	bl sub_8031C30
	lsls r0, 24
	cmp r0, 0
	beq _0807AF08
_0807AEF8:
	movs r0, 0
	strb r0, [r4]
	b _0807B040
	.align 2, 0
_0807AF00: .4byte 0x02000000
_0807AF04: .4byte 0x0001fffe
_0807AF08:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r0, _0807AF14 @ =0x0001ffff
	adds r1, r5, r0
	b _0807AF38
	.align 2, 0
_0807AF14: .4byte 0x0001ffff
_0807AF18:
	movs r0, 0
	b _0807AF26
_0807AF1C:
	movs r0, 0x1
	b _0807AF26
_0807AF20:
	movs r0, 0x2
	b _0807AF26
_0807AF24:
	movs r0, 0x3
_0807AF26:
	bl sub_807B094
	lsls r0, 24
	cmp r0, 0
	beq _0807AF32
	b _0807B040
_0807AF32:
	ldr r1, _0807AF40 @ =0x02000000
	ldr r0, _0807AF44 @ =0x0001ffff
	adds r1, r0
_0807AF38:
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	b _0807B040
	.align 2, 0
_0807AF40: .4byte 0x02000000
_0807AF44: .4byte 0x0001ffff
_0807AF48:
	movs r0, 0
	bl sub_807B184
	b _0807B040
_0807AF50:
	movs r0, 0x1
	bl sub_807B184
	b _0807B040
_0807AF58:
	movs r0, 0x2
	bl sub_807B184
	b _0807B040
_0807AF60:
	movs r0, 0x3
	bl sub_807B184
	b _0807B040
_0807AF68:
	movs r0, 0
	bl sub_807B508
	b _0807B040
_0807AF70:
	movs r0, 0x1
	bl sub_807B508
	b _0807B040
_0807AF78:
	movs r0, 0x2
	bl sub_807B508
	b _0807B040
_0807AF80:
	movs r0, 0x3
	bl sub_807B508
	b _0807B040
_0807AF88:
	bl sub_80327CC
	movs r0, 0x1
	bl battle_get_side_with_given_state
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r7, _0807B000 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0807B004 @ =gEnemyParty
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8032984
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _0807AFEC
	movs r0, 0x3
	bl battle_get_side_with_given_state
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 1
	adds r0, r7
	ldrh r0, [r0]
	muls r0, r6
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8032984
_0807AFEC:
	ldr r1, _0807B008 @ =gUnknown_02024E60
	ldr r0, _0807B00C @ =gUnknown_02024E6C
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_802E3E4
	b _0807B040
	.align 2, 0
_0807B000: .4byte gUnknown_02024A6A
_0807B004: .4byte gEnemyParty
_0807B008: .4byte gUnknown_02024E60
_0807B00C: .4byte gUnknown_02024E6C
_0807B010:
	ldr r0, _0807B054 @ =sub_800FCD4
	bl SetHBlankCallback
	ldr r0, _0807B058 @ =sub_800FCFC
	bl SetVBlankCallback
	bl sub_807B06C
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginHardwarePaletteFade
	ldr r2, _0807B05C @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0807B060 @ =sub_800F808
	bl SetMainCallback2
_0807B040:
	ldr r1, _0807B064 @ =0x02000000
	ldr r0, _0807B068 @ =0x0001ffff
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B054: .4byte sub_800FCD4
_0807B058: .4byte sub_800FCFC
_0807B05C: .4byte gPaletteFade
_0807B060: .4byte sub_800F808
_0807B064: .4byte 0x02000000
_0807B068: .4byte 0x0001ffff
	thumb_func_end sub_807ADA8

	thumb_func_start sub_807B06C
sub_807B06C: @ 807B06C
	push {lr}
	bl sub_800D6D4
	ldr r3, _0807B08C @ =REG_BG1CNT
	ldrb r2, [r3]
	movs r1, 0xD
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3]
	ldr r2, _0807B090 @ =REG_BG2CNT
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0807B08C: .4byte REG_BG1CNT
_0807B090: .4byte REG_BG2CNT
	thumb_func_end sub_807B06C

	thumb_func_start sub_807B094
sub_807B094: @ 807B094
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0807B0D8 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r4, r0
	bcs _0807B172
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807B0F2
	lsls r0, r4, 2
	ldr r1, _0807B0DC @ =0x02017800
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0807B0E8
	ldr r1, _0807B0E0 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807B0E4 @ =gEnemyParty
	adds r0, r1
	adds r1, r4, 0
	bl sub_8031794
	b _0807B168
	.align 2, 0
_0807B0D8: .4byte gUnknown_02024A68
_0807B0DC: .4byte 0x02017800
_0807B0E0: .4byte gUnknown_02024A6A
_0807B0E4: .4byte gEnemyParty
_0807B0E8:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8032350
	b _0807B168
_0807B0F2:
	ldr r2, _0807B108 @ =gUnknown_020239F8
	ldrh r1, [r2]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807B110
	cmp r4, 0
	bne _0807B110
	ldr r0, _0807B10C @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	b _0807B122
	.align 2, 0
_0807B108: .4byte gUnknown_020239F8
_0807B10C: .4byte gSaveBlock2
_0807B110:
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0807B12A
	cmp r4, 0
	bne _0807B12A
	movs r0, 0x2
_0807B122:
	movs r1, 0
	bl sub_8031AF4
	b _0807B168
_0807B12A:
	lsls r0, r4, 2
	ldr r1, _0807B154 @ =0x02017800
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0807B160
	ldr r1, _0807B158 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807B15C @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	bl sub_80318FC
	b _0807B168
	.align 2, 0
_0807B154: .4byte 0x02017800
_0807B158: .4byte gUnknown_02024A6A
_0807B15C: .4byte gPlayerParty
_0807B160:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8032350
_0807B168:
	ldr r0, _0807B17C @ =0x02000000
	ldr r1, _0807B180 @ =0x0001fffe
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807B172:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807B17C: .4byte 0x02000000
_0807B180: .4byte 0x0001fffe
	thumb_func_end sub_807B094

	thumb_func_start sub_807B184
sub_807B184: @ 807B184
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0807B1B8 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r7, r0
	bcc _0807B19E
	b _0807B4D8
_0807B19E:
	lsls r2, r7, 2
	ldr r0, _0807B1BC @ =0x02017800
	adds r0, r2, r0
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	str r2, [sp]
	cmp r0, 0
	beq _0807B1C0
	adds r0, r7, 0
	bl sub_8077F7C
	b _0807B1C6
	.align 2, 0
_0807B1B8: .4byte gUnknown_02024A68
_0807B1BC: .4byte 0x02017800
_0807B1C0:
	adds r0, r7, 0
	bl sub_8077F68
_0807B1C6:
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r7, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0807B1DA
	b _0807B2D8
_0807B1DA:
	ldr r1, _0807B2BC @ =gUnknown_02024A6A
	lsls r0, r7, 1
	adds r6, r0, r1
	ldrh r0, [r6]
	movs r1, 0x64
	mov r10, r1
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r1, _0807B2C0 @ =gEnemyParty
	mov r9, r1
	add r0, r9
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _0807B1FE
	b _0807B4D8
_0807B1FE:
	ldrh r0, [r6]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetMonSpriteTemplate_803C56C
	ldr r5, _0807B2C4 @ =gUnknown_02024E8C
	adds r0, r7, 0
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r7, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, r8
	bl CreateSprite
	ldr r4, _0807B2C8 @ =gUnknown_02024BE0
	adds r4, r7, r4
	strb r0, [r4]
	ldr r5, _0807B2CC @ =gSprites
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r7, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0807B2D0 @ =SpriteCallbackDummy
	str r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r7, [r0, 0x2E]
	ldrh r0, [r6]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	strh r0, [r1, 0x32]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0807B2D4 @ =gUnknown_02024E84
	adds r1, r7, r1
	ldrb r1, [r1]
	bl StartSpriteAnim
	b _0807B4AC
	.align 2, 0
_0807B2BC: .4byte gUnknown_02024A6A
_0807B2C0: .4byte gEnemyParty
_0807B2C4: .4byte gUnknown_02024E8C
_0807B2C8: .4byte gUnknown_02024BE0
_0807B2CC: .4byte gSprites
_0807B2D0: .4byte SpriteCallbackDummy
_0807B2D4: .4byte gUnknown_02024E84
_0807B2D8:
	ldr r2, _0807B328 @ =gUnknown_020239F8
	ldrh r1, [r2]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807B338
	cmp r7, 0
	bne _0807B338
	ldr r5, _0807B32C @ =gSaveBlock2
	ldrb r4, [r5, 0x8]
	movs r0, 0
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetMonSpriteTemplate_803C5A0
	ldr r6, _0807B330 @ =gUnknown_02024E8C
	ldr r1, _0807B334 @ =gTrainerBackPicCoords
	ldrb r0, [r5, 0x8]
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r0, 0xA0
	lsls r0, 15
	adds r4, r0
	asrs r4, 16
	movs r0, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r6, 0
	b _0807B37C
	.align 2, 0
_0807B328: .4byte gUnknown_020239F8
_0807B32C: .4byte gSaveBlock2
_0807B330: .4byte gUnknown_02024E8C
_0807B334: .4byte gTrainerBackPicCoords
_0807B338:
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0807B3D0
	cmp r7, 0
	bne _0807B3D0
	movs r0, 0
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x2
	bl GetMonSpriteTemplate_803C5A0
	ldr r5, _0807B3BC @ =gUnknown_02024E8C
	ldr r0, _0807B3C0 @ =gTrainerBackPicCoords
	ldrb r0, [r0, 0x8]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r4, r1
	asrs r4, 16
	movs r0, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
_0807B37C:
	movs r1, 0x50
	adds r2, r4, 0
	bl CreateSprite
	ldr r3, _0807B3C4 @ =gUnknown_02024BE0
	strb r0, [r3]
	ldr r4, _0807B3C8 @ =gSprites
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	strb r0, [r1, 0x5]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0807B3CC @ =SpriteCallbackDummy
	str r1, [r0]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x2E]
	b _0807B4AC
	.align 2, 0
_0807B3BC: .4byte gUnknown_02024E8C
_0807B3C0: .4byte gTrainerBackPicCoords
_0807B3C4: .4byte gUnknown_02024BE0
_0807B3C8: .4byte gSprites
_0807B3CC: .4byte SpriteCallbackDummy
_0807B3D0:
	ldr r1, _0807B4E8 @ =gUnknown_02024A6A
	lsls r0, r7, 1
	adds r6, r0, r1
	ldrh r0, [r6]
	movs r1, 0x64
	mov r10, r1
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r1, _0807B4EC @ =gPlayerParty
	mov r9, r1
	add r0, r9
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _0807B4D8
	ldrh r0, [r6]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetMonSpriteTemplate_803C56C
	ldr r5, _0807B4F0 @ =gUnknown_02024E8C
	adds r0, r7, 0
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r7, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, r8
	bl CreateSprite
	ldr r4, _0807B4F4 @ =gUnknown_02024BE0
	adds r4, r7, r4
	strb r0, [r4]
	ldr r5, _0807B4F8 @ =gSprites
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r7, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0807B4FC @ =SpriteCallbackDummy
	str r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r7, [r0, 0x2E]
	ldrh r0, [r6]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	add r0, r9
	movs r1, 0xB
	bl GetMonData
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	strh r0, [r1, 0x32]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0807B500 @ =gUnknown_02024E84
	adds r1, r7, r1
	ldrb r1, [r1]
	bl StartSpriteAnim
_0807B4AC:
	ldr r1, _0807B4F8 @ =gSprites
	ldr r0, _0807B4F4 @ =gUnknown_02024BE0
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldr r0, _0807B504 @ =0x02017800
	ldr r1, [sp]
	adds r0, r1, r0
	ldr r1, [r0]
	lsls r1, 31
	adds r2, 0x3E
	lsrs r1, 31
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_0807B4D8:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B4E8: .4byte gUnknown_02024A6A
_0807B4EC: .4byte gPlayerParty
_0807B4F0: .4byte gUnknown_02024E8C
_0807B4F4: .4byte gUnknown_02024BE0
_0807B4F8: .4byte gSprites
_0807B4FC: .4byte SpriteCallbackDummy
_0807B500: .4byte gUnknown_02024E84
_0807B504: .4byte 0x02017800
	thumb_func_end sub_807B184

	thumb_func_start sub_807B508
sub_807B508: @ 807B508
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0807B530 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r5, r0
	bcc _0807B518
	b _0807B68A
_0807B518:
	ldr r2, _0807B534 @ =gUnknown_020239F8
	ldrh r1, [r2]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807B538
	cmp r5, 0
	bne _0807B538
	bl battle_make_oam_safari_battle
	b _0807B550
	.align 2, 0
_0807B530: .4byte gUnknown_02024A68
_0807B534: .4byte gUnknown_020239F8
_0807B538:
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0807B54A
	cmp r5, 0
	bne _0807B54A
	b _0807B68A
_0807B54A:
	adds r0, r5, 0
	bl battle_make_oam_normal_battle
_0807B550:
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0807B58C @ =gUnknown_03004340
	adds r4, r5, r0
	strb r6, [r4]
	adds r0, r5, 0
	bl sub_8043F44
	adds r0, r6, 0
	bl sub_8043DFC
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807B598
	ldrb r0, [r4]
	ldr r1, _0807B590 @ =gUnknown_02024A6A
	lsls r4, r5, 1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0807B594 @ =gEnemyParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	b _0807B5E4
	.align 2, 0
_0807B58C: .4byte gUnknown_03004340
_0807B590: .4byte gUnknown_02024A6A
_0807B594: .4byte gEnemyParty
_0807B598:
	ldr r0, _0807B5C0 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807B5CC
	ldrb r0, [r4]
	ldr r1, _0807B5C4 @ =gUnknown_02024A6A
	lsls r4, r5, 1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0807B5C8 @ =gPlayerParty
	adds r1, r2
	movs r2, 0xA
	bl sub_8045A5C
	b _0807B5E4
	.align 2, 0
_0807B5C0: .4byte gUnknown_020239F8
_0807B5C4: .4byte gUnknown_02024A6A
_0807B5C8: .4byte gPlayerParty
_0807B5CC:
	ldrb r0, [r4]
	ldr r1, _0807B610 @ =gUnknown_02024A6A
	lsls r4, r5, 1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0807B614 @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
_0807B5E4:
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0807B600
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0807B61C
_0807B600:
	ldr r0, _0807B618 @ =gUnknown_03004340
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r1, 0x1
	bl nullsub_11
	b _0807B628
	.align 2, 0
_0807B610: .4byte gUnknown_02024A6A
_0807B614: .4byte gPlayerParty
_0807B618: .4byte gUnknown_03004340
_0807B61C:
	ldr r0, _0807B654 @ =gUnknown_03004340
	adds r0, r5, r0
	ldrb r0, [r0]
	movs r1, 0
	bl nullsub_11
_0807B628:
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807B660
	ldr r0, _0807B658 @ =gUnknown_02024A6A
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807B65C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _0807B68A
	adds r0, r6, 0
	bl sub_8043DB0
	b _0807B68A
	.align 2, 0
_0807B654: .4byte gUnknown_03004340
_0807B658: .4byte gUnknown_02024A6A
_0807B65C: .4byte gEnemyParty
_0807B660:
	ldr r0, _0807B690 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0807B68A
	ldr r0, _0807B694 @ =gUnknown_02024A6A
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807B698 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _0807B68A
	adds r0, r6, 0
	bl sub_8043DB0
_0807B68A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807B690: .4byte gUnknown_020239F8
_0807B694: .4byte gUnknown_02024A6A
_0807B698: .4byte gPlayerParty
	thumb_func_end sub_807B508

	.align 2, 0 @ Don't pad with nop.
