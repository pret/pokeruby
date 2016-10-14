	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start nullsub_14
nullsub_14: @ 807AD54
	bx lr
	thumb_func_end nullsub_14

	thumb_func_start sub_807AD58
sub_807AD58: @ 807AD58
	push {lr}
	ldr r2, _0807AD90
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, _0807AD94
	movs r2, 0
	strh r2, [r0]
	ldr r0, _0807AD98
	ldr r3, _0807AD9C
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _0807ADA0
	adds r0, r1
	strb r2, [r0]
	ldr r0, _0807ADA4
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
	ldr r0, _0807ADC4
	ldr r1, _0807ADC8
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x13
	bls _0807ADBA
	b _0807B010
_0807ADBA:
	lsls r0, 2
	ldr r1, _0807ADCC
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
	ldr r4, _0807AE5C
	adds r0, r4, 0
	bl SetUpWindowConfig
	bl ResetPaletteFade
	ldr r0, _0807AE60
	adds r1, r4, 0
	bl InitWindowFromConfig
	ldr r0, _0807AE64
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0807AE68
	strh r1, [r0]
	ldr r0, _0807AE6C
	strh r1, [r0]
	ldr r0, _0807AE70
	strh r1, [r0]
	ldr r0, _0807AE74
	strh r1, [r0]
	ldr r0, _0807AE78
	strh r1, [r0]
	ldr r0, _0807AE7C
	strh r1, [r0]
	ldr r0, _0807AE80
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
	ldr r2, _0807AE98
	add r0, sp, 0x4
	bl CpuFastSet
	b _0807B040
	.align 2, 0
_0807AE98: .4byte 0x01006000
_0807AE9C:
	ldr r5, _0807AEBC
	ldr r0, _0807AEC0
	adds r4, r5, r0
	ldrb r0, [r4]
	bl sub_800E414
	lsls r0, 24
	cmp r0, 0
	bne _0807AEF8
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r0, _0807AEC4
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
	ldr r1, _0807AEDC
	movs r0, 0x4
	strb r0, [r1]
	b _0807B040
	.align 2, 0
_0807AEDC: .4byte gReservedSpritePaletteCount
_0807AEE0:
	bl sub_8031EE8
	b _0807B040
_0807AEE6:
	ldr r5, _0807AF00
	ldr r1, _0807AF04
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
	ldr r0, _0807AF14
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
	ldr r1, _0807AF40
	ldr r0, _0807AF44
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
	ldr r7, _0807B000
	lsls r0, r4, 1
	adds r0, r7
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0807B004
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
	ldr r1, _0807B008
	ldr r0, _0807B00C
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
	ldr r0, _0807B054
	bl SetHBlankCallback
	ldr r0, _0807B058
	bl SetVBlankCallback
	bl sub_807B06C
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginHardwarePaletteFade
	ldr r2, _0807B05C
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0807B060
	bl SetMainCallback2
_0807B040:
	ldr r1, _0807B064
	ldr r0, _0807B068
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
	ldr r3, _0807B08C
	ldrb r2, [r3]
	movs r1, 0xD
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3]
	ldr r2, _0807B090
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
	ldr r0, _0807B0D8
	ldrb r0, [r0]
	cmp r4, r0
	bcs _0807B172
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807B0F2
	lsls r0, r4, 2
	ldr r1, _0807B0DC
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0807B0E8
	ldr r1, _0807B0E0
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807B0E4
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
	ldr r2, _0807B108
	ldrh r1, [r2]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807B110
	cmp r4, 0
	bne _0807B110
	ldr r0, _0807B10C
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
	ldr r1, _0807B154
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0807B160
	ldr r1, _0807B158
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807B15C
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
	ldr r0, _0807B17C
	ldr r1, _0807B180
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
	ldr r0, _0807B1B8
	ldrb r0, [r0]
	cmp r7, r0
	bcc _0807B19E
	b _0807B4D8
_0807B19E:
	lsls r2, r7, 2
	ldr r0, _0807B1BC
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
	ldr r1, _0807B2BC
	lsls r0, r7, 1
	adds r6, r0, r1
	ldrh r0, [r6]
	movs r1, 0x64
	mov r10, r1
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r1, _0807B2C0
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
	ldr r5, _0807B2C4
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
	ldr r4, _0807B2C8
	adds r4, r7, r4
	strb r0, [r4]
	ldr r5, _0807B2CC
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
	ldr r1, _0807B2D0
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
	ldr r1, _0807B2D4
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
	ldr r2, _0807B328
	ldrh r1, [r2]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807B338
	cmp r7, 0
	bne _0807B338
	ldr r5, _0807B32C
	ldrb r4, [r5, 0x8]
	movs r0, 0
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetMonSpriteTemplate_803C5A0
	ldr r6, _0807B330
	ldr r1, _0807B334
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
	ldr r5, _0807B3BC
	ldr r0, _0807B3C0
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
	ldr r3, _0807B3C4
	strb r0, [r3]
	ldr r4, _0807B3C8
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
	ldr r1, _0807B3CC
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
	ldr r1, _0807B4E8
	lsls r0, r7, 1
	adds r6, r0, r1
	ldrh r0, [r6]
	movs r1, 0x64
	mov r10, r1
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r1, _0807B4EC
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
	ldr r5, _0807B4F0
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
	ldr r4, _0807B4F4
	adds r4, r7, r4
	strb r0, [r4]
	ldr r5, _0807B4F8
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
	ldr r1, _0807B4FC
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
	ldr r1, _0807B500
	adds r1, r7, r1
	ldrb r1, [r1]
	bl StartSpriteAnim
_0807B4AC:
	ldr r1, _0807B4F8
	ldr r0, _0807B4F4
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldr r0, _0807B504
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
	ldr r0, _0807B530
	ldrb r0, [r0]
	cmp r5, r0
	bcc _0807B518
	b _0807B68A
_0807B518:
	ldr r2, _0807B534
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
	ldr r0, _0807B58C
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
	ldr r1, _0807B590
	lsls r4, r5, 1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0807B594
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	b _0807B5E4
	.align 2, 0
_0807B58C: .4byte gUnknown_03004340
_0807B590: .4byte gUnknown_02024A6A
_0807B594: .4byte gEnemyParty
_0807B598:
	ldr r0, _0807B5C0
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807B5CC
	ldrb r0, [r4]
	ldr r1, _0807B5C4
	lsls r4, r5, 1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0807B5C8
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
	ldr r1, _0807B610
	lsls r4, r5, 1
	adds r1, r4, r1
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0807B614
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
	ldr r0, _0807B618
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
	ldr r0, _0807B654
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
	ldr r0, _0807B658
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807B65C
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
	ldr r0, _0807B690
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0807B68A
	ldr r0, _0807B694
	adds r0, r4, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0807B698
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
	ldr r0, _0807B740
	adds r0, r4, r0
	ldrb r6, [r0]
	ldr r0, _0807B744
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0807B748
	bl LoadCompressedObjectPic
	ldr r0, _0807B74C
	bl LoadCompressedObjectPalette
	ldr r1, _0807B750
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
	ldr r7, _0807B754
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
	ldr r0, _0807B758
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
	ldr r7, _0807B7D8
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
	ldr r0, _0807B7DC
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
	ldr r0, _0807B7D8
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
	ldr r1, _0807B838
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
	ldr r1, _0807B898
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
	ldr r4, _0807B9B0
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	ldr r1, _0807B9B4
	adds r0, r1
	lsrs r5, r0, 16
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	ldr r2, _0807B9B8
	adds r0, r2
	lsrs r4, r0, 16
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0807B95E
	lsls r0, r5, 16
	ldr r1, _0807B9BC
	adds r0, r1
	lsrs r5, r0, 16
_0807B95E:
	ldr r1, _0807B9C0
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0807B9C4
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
	ldr r1, _0807B9C8
	adds r0, r1
	ldr r1, _0807B9CC
	bl SetSubspriteTables
	ldr r1, _0807B9D0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x26]
	ldr r1, _0807B9D4
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
_0807B9CC: .4byte gUnknown_083931D8
_0807B9D0: .4byte gTasks
_0807B9D4: .4byte sub_807B9D8
	thumb_func_end sub_807B920

	thumb_func_start sub_807B9D8
sub_807B9D8: @ 807B9D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807BA04
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
	ldr r0, _0807BA08
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
	ldr r2, _0807BA20
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
	ldr r0, _0807BABC
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0807BAC0
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
	ldr r3, _0807BAC4
	lsls r2, 4
	mov r12, r2
	ldr r1, _0807BAC8
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
	ldr r0, _0807BACC
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
	ldr r0, _0807BAD0
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
	ldr r2, _0807BB04
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
	ldr r0, _0807BB08
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
	ldr r2, _0807BB20
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
	ldr r1, _0807BB64
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
	ldr r0, _0807BB68
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
	ldr r0, _0807BB84
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
	ldr r0, _0807BBA8
	ldrh r0, [r0]
	subs r0, 0xF
	cmp r0, 0x2B
	bls _0807BB9C
	b _0807BD20
_0807BB9C:
	lsls r0, 2
	ldr r1, _0807BBAC
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
	ldr r0, _0807BD50
	movs r1, 0
	strh r5, [r0]
	strh r2, [r0, 0x2]
	strh r1, [r0, 0x4]
	strh r1, [r0, 0x6]
	strh r3, [r0, 0x8]
	ldr r1, _0807BD54
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0807BD58
	str r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
_0807BD4A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BD50: .4byte gUnknown_03004B00
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
	ldr r0, _0807BD98
	strb r4, [r0]
	ldr r0, _0807BD9C
	strb r4, [r0]
	ldr r0, _0807BDA0
	movs r2, 0
	bl move_something
	ldr r0, _0807BDA4
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807BDA8
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
	ldr r0, _0807BDF0
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _0807BDF4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807BDEA
	ldr r1, _0807BDF8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _0807BDFC
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

	thumb_func_start item_menu_type_2
item_menu_type_2: @ 807BE00
	push {r4,lr}
	adds r2, r0, 0
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0807BE34
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0807BE38
	ldrb r1, [r2, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	movs r0, 0x42
	strh r0, [r2, 0x22]
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x47
	ands r0, r1
	strb r0, [r2]
	b _0807BE80
	.align 2, 0
_0807BE34: .4byte gTasks
_0807BE38:
	ldrh r1, [r4, 0x12]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _0807BE46
	subs r0, r1, 0x1
	strh r0, [r4, 0x12]
_0807BE46:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0x3F
	bgt _0807BE80
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r3]
	ldrh r1, [r2, 0x22]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	cmp r0, 0x42
	beq _0807BE6A
	adds r0, r1, 0x1
	strh r0, [r2, 0x22]
_0807BE6A:
	ldr r3, _0807BE88
	ldr r2, _0807BE8C
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r3]
_0807BE80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BE88: .4byte REG_BLDALPHA
_0807BE8C: .4byte gUnknown_08393E64
	thumb_func_end item_menu_type_2

	thumb_func_start sub_807BE90
sub_807BE90: @ 807BE90
	push {lr}
	adds r2, r0, 0
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0807BEC4
	adds r1, r0, r1
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0807BEC8
	ldrb r1, [r2, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	movs r0, 0x42
	strh r0, [r2, 0x22]
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x47
	ands r0, r1
	strb r0, [r2]
	b _0807BEEC
	.align 2, 0
_0807BEC4: .4byte gTasks
_0807BEC8:
	movs r3, 0x12
	ldrsh r0, [r1, r3]
	cmp r0, 0x3F
	bgt _0807BEEC
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r3]
	ldrh r1, [r2, 0x22]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	cmp r0, 0x42
	beq _0807BEEC
	adds r0, r1, 0x1
	strh r0, [r2, 0x22]
_0807BEEC:
	pop {r0}
	bx r0
	thumb_func_end sub_807BE90

	thumb_func_start sub_807BEF0
sub_807BEF0: @ 807BEF0
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _0807BF18
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	movs r1, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0807BF18
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0807BF24
_0807BF18:
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0807BF24:
	pop {r0}
	bx r0
	thumb_func_end sub_807BEF0

	thumb_func_start sub_807BF28
sub_807BF28: @ 807BF28
	push {r4-r7,lr}
	lsls r0, 16
	ldr r2, _0807BF78
	adds r0, r2
	lsrs r0, 16
	movs r6, 0
	lsls r7, r1, 16
_0807BF36:
	lsls r5, r0, 16
	asrs r5, 16
	ldr r0, _0807BF7C
	adds r1, r5, 0
	asrs r2, r7, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807BF80
	adds r4, r0
	adds r0, r4, 0
	adds r1, r6, 0
	bl StartSpriteAnim
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r5, 0x20
	lsls r5, 16
	lsrs r0, r5, 16
	cmp r6, 0x2
	bls _0807BF36
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807BF78: .4byte 0xffe00000
_0807BF7C: .4byte gSpriteTemplate_8393F74
_0807BF80: .4byte gSprites
	thumb_func_end sub_807BF28

	thumb_func_start sub_807BF84
sub_807BF84: @ 807BF84
	push {r4-r6,lr}
	lsls r0, 16
	ldr r2, _0807BFD4
	adds r0, r2
	lsrs r0, 16
	movs r5, 0
	lsls r6, r1, 16
_0807BF92:
	lsls r4, r0, 16
	asrs r4, 16
	ldr r0, _0807BFD8
	adds r1, r4, 0
	asrs r2, r6, 16
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _0807BFDC
	adds r2, r0
	adds r1, r5, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r2, 0
	bl StartSpriteAnim
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x20
	lsls r4, 16
	lsrs r0, r4, 16
	cmp r5, 0x4
	bls _0807BF92
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BFD4: .4byte 0xffc00000
_0807BFD8: .4byte gSpriteTemplate_8393F74
_0807BFDC: .4byte gSprites
	thumb_func_end sub_807BF84

	thumb_func_start sub_807BFE0
sub_807BFE0: @ 807BFE0
	push {r4,lr}
	adds r3, r0, 0
	ldr r2, _0807C02C
	ldr r0, _0807C030
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0807C070
	movs r2, 0x20
	ldrsh r1, [r3, r2]
	ldr r0, _0807C034
	ldrh r4, [r3, 0x20]
	cmp r1, r0
	bgt _0807C070
	movs r2, 0x2E
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _0807C064
	cmp r1, 0x77
	bgt _0807C038
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0x1E
	bgt _0807C050
	adds r1, 0x1
	strh r1, [r3, 0x30]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x1E
	bgt _0807C050
	adds r0, r1, 0x1
	b _0807C04E
	.align 2, 0
_0807C02C: .4byte gTasks
_0807C030: .4byte gUnknown_0202F7E4
_0807C034: .4byte 0x0000010f
_0807C038:
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _0807C050
	subs r0, r1, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	cmp r0, 0
	beq _0807C050
	subs r0, r1, 0x2
_0807C04E:
	strh r0, [r3, 0x30]
_0807C050:
	ldrh r1, [r3, 0x30]
	movs r0, 0x1F
	ands r0, r1
	lsls r1, r0, 10
	lsls r2, r0, 5
	adds r1, r2
	orrs r1, r0
	ldr r0, _0807C06C
	strh r1, [r0]
	.ifdef SAPPHIRE
	strh r1, [r0, 0x34]
	.else
	strh r1, [r0, 0x2A]
	.endif
_0807C064:
	adds r0, r4, 0x4
	strh r0, [r3, 0x20]
	b _0807C07E
	.align 2, 0
_0807C06C: .4byte gPlttBufferFaded
_0807C070:
	ldr r1, _0807C084
	movs r0, 0
	strh r0, [r1]
	.ifdef SAPPHIRE
	strh r0, [r1, 0x34]
	.else
	strh r0, [r1, 0x2A]
	.endif
	adds r0, r3, 0
	bl DestroySprite
_0807C07E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C084: .4byte gPlttBufferFaded
	thumb_func_end sub_807BFE0

	thumb_func_start sub_807C088
sub_807C088: @ 807C088
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0807C0C0
	movs r1, 0
	movs r2, 0x44
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807C0C4
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x1]
	strh r4, [r1, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C0C0: .4byte gSpriteTemplate_8393FC0
_0807C0C4: .4byte gSprites
	thumb_func_end sub_807C088

	thumb_func_start sub_807C0C8
sub_807C0C8: @ 807C0C8
	push {lr}
	bl sub_8089668
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r0, _0807C0E8
	ldr r1, _0807C0EC
	ldrh r1, [r1]
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0807C0E8: .4byte REG_BG1VOFS
_0807C0EC: .4byte gUnknown_030041B4
	thumb_func_end sub_807C0C8

	thumb_func_start CB2_InitTitleScreen
CB2_InitTitleScreen: @ 807C0F0
	push {r4,r5,lr}
	sub sp, 0x14
	ldr r0, _0807C10C
	ldr r1, _0807C110
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _0807C130
	lsls r0, 2
	ldr r1, _0807C114
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807C10C: .4byte gMain
_0807C110: .4byte 0x0000043c
_0807C114: .4byte _0807C118
	.align 2, 0
_0807C118:
	.4byte _0807C130
	.4byte _0807C1E4
	.4byte _0807C2B8
	.4byte _0807C308
	.4byte _0807C33C
	.4byte _0807C418
_0807C130:
	movs r0, 0
	bl SetVBlankCallback
	ldr r0, _0807C1C0
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	movs r2, 0xA0
	lsls r2, 19
	ldr r3, _0807C1C4
	adds r0, r3, 0
	strh r0, [r2]
	movs r0, 0x80
	lsls r0, 19
	strh r1, [r0]
	adds r0, 0xC
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x10
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
	add r0, sp, 0xC
	strh r1, [r0]
	ldr r1, _0807C1C8
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0807C1CC
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0
	str r2, [sp, 0x10]
	add r0, sp, 0x10
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0807C1D0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0xC
	strh r2, [r0]
	str r0, [r1]
	ldr r0, _0807C1D4
	str r0, [r1, 0x4]
	ldr r0, _0807C1D8
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	ldr r0, _0807C1DC
	ldr r1, _0807C1E0
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	b _0807C446
	.align 2, 0
_0807C1C0: .4byte REG_BLDCNT
_0807C1C4: .4byte 0x00007fff
_0807C1C8: .4byte 0x040000d4
_0807C1CC: .4byte 0x8100c000
_0807C1D0: .4byte 0x85000100
_0807C1D4: .4byte 0x05000002
_0807C1D8: .4byte 0x810001ff
_0807C1DC: .4byte gMain
_0807C1E0: .4byte 0x0000043c
_0807C1E4:
	ldr r0, _0807C270
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _0807C274
	ldr r1, _0807C278
	bl LZ77UnCompVram
	ldr r4, _0807C27C
	movs r5, 0xE0
	lsls r5, 1
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl LoadPalette
	ldr r0, _0807C280
	ldr r1, _0807C284
	bl LZ77UnCompVram
	ldr r0, _0807C288
	ldr r1, _0807C28C
	bl LZ77UnCompVram
	ldr r0, _0807C290
	ldr r1, _0807C294
	bl LZ77UnCompVram
	ldr r0, _0807C298
	movs r1, 0xE0
	movs r2, 0x40
	bl LoadPalette
	bl remove_some_task
	bl ResetTasks
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _0807C29C
	movs r0, 0xE
	strb r0, [r1]
	ldr r0, _0807C2A0
	bl LoadCompressedObjectPic
	ldr r0, _0807C2A4
	bl LoadCompressedObjectPic
	ldr r0, _0807C2A8
	bl LoadCompressedObjectPic
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, 0
	adds r2, r5, 0
	bl LoadPalette
	ldr r0, _0807C2AC
	bl LoadSpritePalette
	ldr r0, _0807C2B0
	ldr r2, _0807C2B4
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0]
	b _0807C446
	.align 2, 0
_0807C270: .4byte gUnknown_08E9D8CC
_0807C274: .4byte gUnknown_08E9F7E4
_0807C278: .4byte 0x06004800
_0807C27C: .4byte gUnknown_08E9F624
_0807C280: .4byte gUnknown_08393250
_0807C284: .4byte 0x06008000
_0807C288: .4byte gUnknown_083939EC
_0807C28C: .4byte 0x0600c000
_0807C290: .4byte gUnknown_08393BF8
_0807C294: .4byte 0x0600c800
_0807C298: .4byte gUnknown_08393210
_0807C29C: .4byte gReservedSpritePaletteCount
_0807C2A0: .4byte gUnknown_08393EFC
_0807C2A4: .4byte gUnknown_08393F8C
_0807C2A8: .4byte gUnknown_08393FD8
_0807C2AC: .4byte gUnknown_08393F9C
_0807C2B0: .4byte gMain
_0807C2B4: .4byte 0x0000043c
_0807C2B8:
	ldr r0, _0807C2F0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0807C2F4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r3, 0
	movs r2, 0x80
	lsls r2, 1
	strh r2, [r1, 0x8]
	strh r3, [r1, 0xA]
	ldr r2, _0807C2F8
	strh r2, [r1, 0xC]
	subs r2, 0x10
	strh r2, [r1, 0xE]
	ldr r1, _0807C2FC
	strb r0, [r1]
	ldr r0, _0807C300
	ldr r3, _0807C304
	adds r0, r3
	movs r1, 0x3
	strb r1, [r0]
	b _0807C446
	.align 2, 0
_0807C2F0: .4byte sub_807C46C
_0807C2F4: .4byte gTasks
_0807C2F8: .4byte 0x0000fff0
_0807C2FC: .4byte gUnknown_0202F7E4
_0807C300: .4byte gMain
_0807C304: .4byte 0x0000043c
_0807C308:
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0807C32C
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _0807C330
	bl SetVBlankCallback
	ldr r0, _0807C334
	ldr r1, _0807C338
	adds r0, r1
	movs r1, 0x4
	strb r1, [r0]
	b _0807C446
	.align 2, 0
_0807C32C: .4byte 0x0000ffff
_0807C330: .4byte sub_807C0C8
_0807C334: .4byte gMain
_0807C338: .4byte 0x0000043c
_0807C33C:
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x78
	movs r1, 0x50
	movs r3, 0
	bl sub_813CE30
	ldr r1, _0807C3D4
	ldr r0, _0807C3D8
	str r0, [r1]
	adds r1, 0x4
	ldr r0, _0807C3DC
	str r0, [r1]
	ldr r0, _0807C3E0
	movs r4, 0
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	subs r0, 0x2
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	adds r1, 0x1C
	ldr r2, _0807C3E4
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _0807C3E8
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x6
	movs r0, 0x84
	strh r0, [r1]
	ldr r0, _0807C3EC
	strh r4, [r0]
	adds r0, 0x2
	movs r5, 0x8
	strh r5, [r0]
	subs r1, 0x48
	ldr r2, _0807C3F0
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _0807C3F4
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0807C3F8
	adds r0, r2, 0
	strh r0, [r1]
	ldr r3, _0807C3FC
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _0807C400
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r1, _0807C404
	ldrh r0, [r1]
	orrs r0, r5
	strh r0, [r1]
	subs r1, 0x4
	ldr r3, _0807C408
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0807C40C
	bl m4aSongNumStart
	ldr r0, _0807C410
	ldr r1, _0807C414
	adds r0, r1
	movs r1, 0x5
	strb r1, [r0]
	b _0807C446
	.align 2, 0
_0807C3D4: .4byte REG_BG2X_L
_0807C3D8: .4byte 0xffffe300
_0807C3DC: .4byte 0xffffdf00
_0807C3E0: .4byte REG_WIN0H
_0807C3E4: .4byte 0x00001f1f
_0807C3E8: .4byte 0x00003f1f
_0807C3EC: .4byte REG_BLDALPHA
_0807C3F0: .4byte 0x0000180b
_0807C3F4: .4byte 0x0000190a
_0807C3F8: .4byte 0x00004981
_0807C3FC: .4byte 0x04000208
_0807C400: .4byte 0x04000200
_0807C404: .4byte REG_DISPSTAT
_0807C408: .4byte 0x0000b441
_0807C40C: .4byte 0x0000019d
_0807C410: .4byte gMain
_0807C414: .4byte 0x0000043c
_0807C418:
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0807C446
	movs r0, 0
	bl sub_807C088
	str r4, [sp]
	movs r0, 0x4
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	movs r0, 0
	movs r1, 0xA0
	movs r2, 0x4
	movs r3, 0x4
	bl sub_8089944
	ldr r0, _0807C450
	bl SetMainCallback2
_0807C446:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807C450: .4byte sub_807C454
	thumb_func_end CB2_InitTitleScreen

	thumb_func_start sub_807C454
sub_807C454: @ 807C454
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_807C454

	thumb_func_start sub_807C46C
sub_807C46C: @ 807C46C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0807C4D4
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF
	ands r0, r1
	ldr r5, _0807C4D8
	cmp r0, 0
	bne _0807C492
	lsls r0, r6, 2
	adds r1, r0, r6
	lsls r1, 3
	adds r1, r5
	movs r2, 0xA
	ldrsh r1, [r1, r2]
	adds r4, r0, 0
	cmp r1, 0
	beq _0807C4A4
_0807C492:
	lsls r3, r6, 2
	adds r0, r3, r6
	lsls r0, 3
	adds r0, r5
	movs r2, 0
	movs r1, 0x1
	strh r1, [r0, 0xA]
	strh r2, [r0, 0x8]
	adds r4, r3, 0
_0807C4A4:
	adds r0, r4, r6
	lsls r0, 3
	adds r7, r0, r5
	movs r3, 0x8
	ldrsh r2, [r7, r3]
	cmp r2, 0
	beq _0807C4DC
	ldrh r0, [r7, 0x8]
	cmp r0, 0xA0
	beq _0807C4BC
	cmp r0, 0x40
	bne _0807C4C2
_0807C4BC:
	movs r0, 0x1
	bl sub_807C088
_0807C4C2:
	ldr r0, _0807C4D8
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	subs r0, 0x1
	strh r0, [r1, 0x8]
	b _0807C558
	.align 2, 0
_0807C4D4: .4byte gMain
_0807C4D8: .4byte gTasks
_0807C4DC:
	movs r1, 0x80
	lsls r1, 19
	ldr r3, _0807C560
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0807C564
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r1, 0x50
	ldr r3, _0807C568
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x1F
	strh r0, [r1]
	ldr r0, _0807C56C
	strh r2, [r0]
	ldr r0, _0807C570
	movs r1, 0x62
	movs r2, 0x1A
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0807C574
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r2, r1, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r4, 0x4
	orrs r0, r4
	strb r0, [r2]
	strh r6, [r1, 0x30]
	ldr r0, _0807C578
	movs r1, 0xA2
	movs r2, 0x1A
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r2, r1, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	orrs r0, r4
	strb r0, [r2]
	strh r6, [r1, 0x30]
	movs r0, 0x58
	strh r0, [r7, 0x12]
	movs r0, 0x90
	strh r0, [r7, 0x8]
	ldr r0, _0807C57C
	str r0, [r7]
_0807C558:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C560: .4byte 0x00001441
_0807C564: .4byte REG_WININ
_0807C568: .4byte 0x00003f50
_0807C56C: .4byte REG_BLDY
_0807C570: .4byte gSpriteTemplate_8393ECC
_0807C574: .4byte gSprites
_0807C578: .4byte gSpriteTemplate_8393EE4
_0807C57C: .4byte sub_807C580
	thumb_func_end sub_807C46C

	thumb_func_start sub_807C580
sub_807C580: @ 807C580
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0807C5D0
	ldrh r1, [r0, 0x2E]
	movs r0, 0xF
	ands r0, r1
	ldr r2, _0807C5D4
	cmp r0, 0
	bne _0807C5A6
	lsls r0, r5, 2
	adds r1, r0, r5
	lsls r1, 3
	adds r1, r2
	movs r3, 0xA
	ldrsh r1, [r1, r3]
	adds r7, r0, 0
	cmp r1, 0
	beq _0807C5B8
_0807C5A6:
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r2
	movs r2, 0
	movs r1, 0x1
	strh r1, [r0, 0xA]
	strh r2, [r0, 0x8]
	adds r7, r3, 0
_0807C5B8:
	ldr r1, _0807C5D4
	adds r0, r7, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x8]
	movs r1, 0x8
	ldrsh r6, [r4, r1]
	cmp r6, 0
	beq _0807C5D8
	subs r0, 0x1
	strh r0, [r4, 0x8]
	b _0807C5FC
	.align 2, 0
_0807C5D0: .4byte gMain
_0807C5D4: .4byte gTasks
_0807C5D8:
	movs r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _0807C634
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0x78
	movs r1, 0x6C
	bl sub_807BF28
	movs r0, 0x78
	movs r1, 0x94
	bl sub_807BF84
	strh r6, [r4, 0x10]
	ldr r0, _0807C638
	str r0, [r4]
_0807C5FC:
	ldr r2, _0807C63C
	adds r0, r7, r5
	lsls r0, 3
	adds r3, r0, r2
	ldrh r1, [r3, 0x8]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0807C61C
	ldrh r1, [r3, 0xE]
	movs r4, 0xE
	ldrsh r0, [r3, r4]
	cmp r0, 0
	beq _0807C61C
	adds r0, r1, 0x1
	strh r0, [r3, 0xE]
_0807C61C:
	ldr r0, _0807C640
	adds r1, r7, r5
	lsls r1, 3
	adds r1, r2
	movs r2, 0xE
	ldrsh r1, [r1, r2]
	lsls r1, 8
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C634: .4byte 0x00001741
_0807C638: .4byte sub_807C644
_0807C63C: .4byte gTasks
_0807C640: .4byte REG_BG2Y_L
	thumb_func_end sub_807C580

	thumb_func_start sub_807C644
sub_807C644: @ 807C644
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0807C69C
	ldr r2, _0807C6A0
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0807C6A4
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0
	strh r0, [r1]
	ldr r4, _0807C6A8
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0807C67A
	movs r0, 0x8
	ands r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	beq _0807C6B4
_0807C67A:
	movs r0, 0x4
	bl FadeOutBGM
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0807C6AC
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807C6B0
	bl SetMainCallback2
	b _0807C74E
	.align 2, 0
_0807C69C: .4byte REG_BLDCNT
_0807C6A0: .4byte 0x00002142
_0807C6A4: .4byte 0x00001f0f
_0807C6A8: .4byte gMain
_0807C6AC: .4byte 0x0000ffff
_0807C6B0: .4byte sub_807C774
_0807C6B4:
	ldrh r1, [r4, 0x2C]
	movs r0, 0x46
	ands r0, r1
	cmp r0, 0x46
	bne _0807C6C4
	ldr r0, _0807C6F4
	bl SetMainCallback2
_0807C6C4:
	ldrh r1, [r4, 0x2C]
	movs r0, 0x26
	ands r0, r1
	cmp r0, 0x26
	bne _0807C6FC
	bl sub_80691DC
	cmp r0, 0x1
	bne _0807C6FC
	movs r0, 0x4
	bl FadeOutBGM
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807C6F8
	bl SetMainCallback2
	b _0807C74E
	.align 2, 0
_0807C6F4: .4byte sub_807C7AC
_0807C6F8: .4byte sub_807C7C8
_0807C6FC:
	ldr r0, _0807C758
	movs r3, 0
	str r3, [r0]
	ldr r1, _0807C75C
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0807C728
	ldrh r0, [r2, 0x10]
	adds r0, 0x1
	strh r0, [r2, 0x10]
	ldr r1, _0807C760
	strh r0, [r1]
	ldr r0, _0807C764
	strh r3, [r0]
_0807C728:
	ldrb r0, [r2, 0x8]
	bl sub_807C7E4
	ldr r0, _0807C768
	ldr r1, _0807C76C
	ldrh r0, [r0, 0x4]
	cmp r0, 0
	bne _0807C74E
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807C770
	bl SetMainCallback2
_0807C74E:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C758: .4byte REG_BG2Y_L
_0807C75C: .4byte gTasks
_0807C760: .4byte gUnknown_030041B4
_0807C764: .4byte gUnknown_030042C0
_0807C768: .4byte gMPlay_BGM
_0807C76C: .4byte 0x0000ffff
_0807C770: .4byte sub_807C790
	thumb_func_end sub_807C644

	thumb_func_start sub_807C774
sub_807C774: @ 807C774
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0807C786
	ldr r0, _0807C78C
	bl SetMainCallback2
_0807C786:
	pop {r0}
	bx r0
	.align 2, 0
_0807C78C: .4byte CB2_InitMainMenu
	thumb_func_end sub_807C774

	thumb_func_start sub_807C790
sub_807C790: @ 807C790
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0807C7A2
	ldr r0, _0807C7A8
	bl SetMainCallback2
_0807C7A2:
	pop {r0}
	bx r0
	.align 2, 0
_0807C7A8: .4byte sub_813BA88
	thumb_func_end sub_807C790

	thumb_func_start sub_807C7AC
sub_807C7AC: @ 807C7AC
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0807C7BE
	ldr r0, _0807C7C4
	bl SetMainCallback2
_0807C7BE:
	pop {r0}
	bx r0
	.align 2, 0
_0807C7C4: .4byte c2_clear_save_data_screen_2
	thumb_func_end sub_807C7AC

	thumb_func_start sub_807C7C8
sub_807C7C8: @ 807C7C8
	push {lr}
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _0807C7DA
	ldr r0, _0807C7E0
	bl SetMainCallback2
_0807C7DA:
	pop {r0}
	bx r0
	.align 2, 0
_0807C7E0: .4byte sub_806AAD8
	thumb_func_end sub_807C7C8

	thumb_func_start sub_807C7E4
sub_807C7E4: @ 807C7E4
	push {lr}
	sub sp, 0x4
	lsls r1, r0, 24
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r1
	cmp r0, 0
	bne _0807C820
	lsrs r0, r1, 26
	movs r1, 0x1F
	adds r2, r0, 0
	ands r2, r1
	movs r1, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0807C80C
	.ifdef SAPPHIRE
	mov r0, sp
	strh r2, [r0]
	.else
	lsls r1, r2, 10
	mov r0, sp
	strh r1, [r0]
	.endif
	b _0807C816
_0807C80C:
	movs r0, 0x1F
	subs r0, r2
	.ifndef SAPPHIRE
	lsls r0, 10
	.endif
	mov r1, sp
	strh r0, [r1]
_0807C816:
	mov r0, sp
	movs r1, 0xEF
	movs r2, 0x2
	bl LoadPalette
_0807C820:
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end sub_807C7E4

	thumb_func_start sub_807C828
sub_807C828: @ 807C828
	push {r4-r6,lr}
	ldr r0, _0807C8EC
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _0807C8E4
	movs r0, 0x90
	lsls r0, 5
	bl AllocSpritePalette
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0807C8F0
	lsls r1, r5, 5
	ldr r2, _0807C8F4
	adds r1, r2
	ldr r2, _0807C8F8
	bl CpuSet
	bl sub_807CB10
	ldr r4, _0807C8FC
	ldr r1, _0807C900
	adds r0, r4, r1
	strb r5, [r0]
	ldr r0, _0807C904
	bl AllocSpritePalette
	ldr r2, _0807C908
	adds r1, r4, r2
	strb r0, [r1]
	ldr r1, _0807C90C
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, 0x4
	adds r0, r4, r2
	strb r6, [r0]
	adds r1, 0x4
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, 0xC
	adds r0, r4, r2
	strb r6, [r0]
	adds r1, 0x22
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, 0x17
	adds r0, r4, r2
	strb r6, [r0]
	adds r1, 0x24
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, 0x1B
	adds r0, r4, r2
	strb r6, [r0]
	subs r1, 0xD
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, 0x18
	adds r0, r4, r2
	strb r6, [r0]
	subs r1, 0x1D
	adds r0, r4, r1
	strb r6, [r0]
	movs r0, 0x10
	movs r1, 0
	bl sub_807DB64
	movs r2, 0xDA
	lsls r2, 3
	adds r0, r4, r2
	strb r6, [r0]
	ldr r0, _0807C910
	adds r1, r4, r0
	movs r0, 0x3
	strb r0, [r1]
	movs r1, 0xD9
	lsls r1, 3
	adds r0, r4, r1
	strb r6, [r0]
	adds r2, 0x3
	adds r1, r4, r2
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _0807C914
	movs r1, 0x50
	bl CreateTask
	ldr r1, _0807C918
	adds r4, r1
	strb r0, [r4]
_0807C8E4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C8EC: .4byte sub_807CA34
_0807C8F0: .4byte gUnknown_083970E8
_0807C8F4: .4byte gPlttBufferUnfaded + 0x200
_0807C8F8: .4byte REG_BG0CNT
_0807C8FC: .4byte gUnknown_0202F7E8
_0807C900: .4byte 0x000006d5
_0807C904: .4byte 0x00001201
_0807C908: .4byte 0x000006d4
_0807C90C: .4byte 0x000006da
_0807C910: .4byte 0x000006c6
_0807C914: .4byte sub_807C9E4
_0807C918: .4byte 0x000006c9
	thumb_func_end sub_807C828

	thumb_func_start sub_807C91C
sub_807C91C: @ 807C91C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	beq _0807C932
	cmp r4, 0x5
	beq _0807C932
	cmp r4, 0xD
	beq _0807C932
	bl play_some_sound
_0807C932:
	ldr r1, _0807C974
	ldr r2, _0807C978
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, r4
	beq _0807C956
	movs r3, 0xDA
	lsls r3, 3
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r4
	bne _0807C956
	ldr r0, _0807C97C
	lsls r1, r4, 4
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_0807C956:
	ldr r1, _0807C974
	ldr r2, _0807C980
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _0807C978
	adds r0, r1, r3
	strb r4, [r0]
	ldr r0, _0807C984
	adds r1, r0
	strh r2, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C974: .4byte gUnknown_0202F7E8
_0807C978: .4byte 0x000006d1
_0807C97C: .4byte gUnknown_08396FC8
_0807C980: .4byte 0x000006d3
_0807C984: .4byte 0x000006ce
	thumb_func_end sub_807C91C

	thumb_func_start sub_807C988
sub_807C988: @ 807C988
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl play_some_sound
	ldr r0, _0807C9AC
	movs r2, 0xDA
	lsls r2, 3
	adds r1, r0, r2
	strb r4, [r1]
	ldr r1, _0807C9B0
	adds r0, r1
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C9AC: .4byte gUnknown_0202F7E8
_0807C9B0: .4byte 0x000006d1
	thumb_func_end sub_807C988

	thumb_func_start sub_807C9B4
sub_807C9B4: @ 807C9B4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl play_some_sound
	ldr r1, _0807C9E0
	movs r2, 0xDA
	lsls r2, 3
	adds r0, r1, r2
	strb r4, [r0]
	adds r2, 0x1
	adds r0, r1, r2
	strb r4, [r0]
	movs r0, 0xD9
	lsls r0, 3
	adds r1, r0
	movs r0, 0x1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807C9E0: .4byte gUnknown_0202F7E8
	thumb_func_end sub_807C9B4

	thumb_func_start sub_807C9E4
sub_807C9E4: @ 807C9E4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _0807CA24
	movs r1, 0xD9
	lsls r1, 3
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807CA1C
	ldr r1, _0807CA28
	movs r3, 0xDA
	lsls r3, 3
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, 4
	adds r1, 0x8
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _0807CA2C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0807CA30
	str r1, [r0]
_0807CA1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CA24: .4byte gUnknown_0202F7E8
_0807CA28: .4byte gUnknown_08396FC8
_0807CA2C: .4byte gTasks
_0807CA30: .4byte sub_807CA34
	thumb_func_end sub_807C9E4

	thumb_func_start sub_807CA34
sub_807CA34: @ 807CA34
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r5, _0807CA90
	movs r0, 0xDA
	lsls r0, 3
	adds r6, r5, r0
	ldr r1, _0807CA94
	adds r7, r5, r1
	ldrb r0, [r6]
	ldrb r2, [r7]
	cmp r0, r2
	beq _0807CAA8
	ldr r0, _0807CA98
	mov r8, r0
	ldrb r0, [r6]
	lsls r0, 4
	mov r1, r8
	adds r1, 0xC
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0807CAB8
	ldrb r0, [r7]
	lsls r0, 4
	add r0, r8
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _0807CA9C
	adds r0, r5, r1
	strb r4, [r0]
	ldr r2, _0807CAA0
	adds r0, r5, r2
	strb r4, [r0]
	ldrb r0, [r7]
	strb r0, [r6]
	ldr r0, _0807CAA4
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
	b _0807CAB8
	.align 2, 0
_0807CA90: .4byte gUnknown_0202F7E8
_0807CA94: .4byte 0x000006d1
_0807CA98: .4byte gUnknown_08396FC8
_0807CA9C: .4byte 0x000006c3
_0807CAA0: .4byte 0x000006c6
_0807CAA4: .4byte 0x000006d3
_0807CAA8:
	ldr r0, _0807CAD8
	ldrb r1, [r6]
	lsls r1, 4
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_0807CAB8:
	ldr r1, _0807CADC
	ldr r0, _0807CAE0
	ldr r2, _0807CAE4
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807CAD8: .4byte gUnknown_08396FC8
_0807CADC: .4byte gUnknown_083970B8
_0807CAE0: .4byte gUnknown_0202F7E8
_0807CAE4: .4byte 0x000006c6
	thumb_func_end sub_807CA34

	thumb_func_start sub_807CAE8
sub_807CAE8: @ 807CAE8
	ldr r0, _0807CAFC
	ldr r2, _0807CB00
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r1, _0807CB04
	adds r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0807CAFC: .4byte gUnknown_0202F7E8
_0807CB00: .4byte 0x000006c1
_0807CB04: .4byte 0x000006c2
	thumb_func_end sub_807CAE8

	thumb_func_start nullsub_38
nullsub_38: @ 807CB08
	bx lr
	thumb_func_end nullsub_38

	thumb_func_start sub_807CB0C
sub_807CB0C: @ 807CB0C
	movs r0, 0
	bx lr
	thumb_func_end sub_807CB0C

	thumb_func_start sub_807CB10
sub_807CB10: @ 807CB10
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r1, _0807CB50
	ldr r0, _0807CB54
	str r0, [r1]
	movs r0, 0
	mov r12, r0
	ldr r1, _0807CB58
	mov r10, r1
_0807CB28:
	mov r7, r10
	mov r0, r12
	cmp r0, 0
	bne _0807CB34
	ldr r1, _0807CB5C
	adds r7, r1
_0807CB34:
	movs r5, 0
	movs r0, 0x1
	add r0, r12
	mov r9, r0
_0807CB3C:
	lsls r1, r5, 8
	lsls r0, r5, 24
	lsrs r2, r0, 16
	mov r0, r12
	cmp r0, 0
	bne _0807CB60
	adds r0, r1, 0
	lsls r0, 12
	lsrs r4, r0, 16
	b _0807CB62
	.align 2, 0
_0807CB50: .4byte gUnknown_030006DC
_0807CB54: .4byte gUnknown_083970C8
_0807CB58: .4byte gUnknown_0202FC48
_0807CB5C: .4byte 0xfffffda0
_0807CB60:
	movs r4, 0
_0807CB62:
	movs r3, 0
	adds r1, r5, 0x1
	mov r8, r1
_0807CB68:
	subs r1, r2, r4
	lsls r1, 16
	lsrs r2, r1, 16
	lsls r0, r3, 5
	adds r0, r7
	adds r0, r5
	lsrs r1, 24
	strb r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x2
	bls _0807CB68
	adds r6, r2, 0
	movs r0, 0xF8
	lsls r0, 5
	subs r0, r2
	cmp r0, 0
	bge _0807CB90
	adds r0, 0xF
_0807CB90:
	lsls r0, 12
	lsrs r4, r0, 16
	cmp r5, 0xB
	bhi _0807CBDA
	cmp r3, 0x12
	bhi _0807CC00
_0807CB9C:
	adds r0, r2, r4
	lsls r0, 16
	lsrs r2, r0, 16
	subs r0, r2, r6
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	ble _0807CBB8
	lsrs r0, 31
	adds r0, r1, r0
	asrs r0, 1
	subs r0, r2, r0
	lsls r0, 16
	lsrs r2, r0, 16
_0807CBB8:
	lsls r0, r3, 5
	adds r0, r7
	adds r1, r0, r5
	lsrs r0, r2, 8
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _0807CBCE
	movs r0, 0x1F
	strb r0, [r1]
_0807CBCE:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x12
	bls _0807CB9C
	b _0807CC00
_0807CBDA:
	cmp r3, 0x12
	bhi _0807CC00
	movs r6, 0x1F
_0807CBE0:
	adds r1, r2, r4
	lsls r1, 16
	lsrs r2, r1, 16
	lsls r0, r3, 5
	adds r0, r7
	adds r0, r5
	lsrs r1, 24
	strb r1, [r0]
	cmp r1, 0x1F
	bls _0807CBF6
	strb r6, [r0]
_0807CBF6:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x12
	bls _0807CBE0
_0807CC00:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r5, r0, 16
	cmp r5, 0x1F
	bls _0807CB3C
	mov r1, r9
	lsls r0, r1, 16
	lsrs r0, 16
	mov r12, r0
	cmp r0, 0x1
	bls _0807CB28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807CB10

	thumb_func_start sub_807CC24
sub_807CC24: @ 807CC24
	push {r4-r7,lr}
	ldr r0, _0807CC50
	movs r1, 0xD8
	lsls r1, 3
	adds r4, r0, r1
	ldr r2, _0807CC54
	adds r1, r0, r2
	ldrb r7, [r4]
	mov r12, r7
	movs r6, 0
	ldrsb r6, [r4, r6]
	movs r5, 0
	ldrsb r5, [r1, r5]
	adds r3, r0, 0
	cmp r6, r5
	bne _0807CC5C
	ldr r0, _0807CC58
	adds r1, r3, r0
	movs r0, 0x3
	strb r0, [r1]
	b _0807CCA4
	.align 2, 0
_0807CC50: .4byte gUnknown_0202F7E8
_0807CC54: .4byte 0x000006c1
_0807CC58: .4byte 0x000006c6
_0807CC5C:
	ldr r1, _0807CC84
	adds r2, r3, r1
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	ldr r7, _0807CC88
	adds r1, r3, r7
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0807CCA4
	movs r0, 0
	strb r0, [r2]
	mov r0, r12
	cmp r6, r5
	bge _0807CC8C
	adds r0, 0x1
	b _0807CC90
	.align 2, 0
_0807CC84: .4byte 0x000006c3
_0807CC88: .4byte 0x000006c2
_0807CC8C:
	mov r0, r12
	subs r0, 0x1
_0807CC90:
	strb r0, [r4]
	movs r1, 0xD8
	lsls r1, 3
	adds r0, r3, r1
	movs r2, 0
	ldrsb r2, [r0, r2]
	movs r0, 0
	movs r1, 0x20
	bl sub_807CEBC
_0807CCA4:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807CC24

	thumb_func_start sub_807CCAC
sub_807CCAC: @ 807CCAC
	push {lr}
	ldr r2, _0807CCE4
	ldr r0, _0807CCE8
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0807CCCA
	ldr r3, _0807CCEC
	adds r1, r2, r3
	movs r0, 0
	strb r0, [r1]
_0807CCCA:
	movs r1, 0xDA
	lsls r1, 3
	adds r0, r2, r1
	ldrb r0, [r0]
	subs r0, 0x3
	cmp r0, 0xA
	bhi _0807CD94
	lsls r0, 2
	ldr r1, _0807CCF0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807CCE4: .4byte gUnknown_0202F7E8
_0807CCE8: .4byte 0x000006cb
_0807CCEC: .4byte 0x000006ca
_0807CCF0: .4byte _0807CCF4
	.align 2, 0
_0807CCF4:
	.4byte _0807CD20
	.4byte _0807CD20
	.4byte _0807CD20
	.4byte _0807CD6C
	.4byte _0807CD94
	.4byte _0807CD94
	.4byte _0807CD94
	.4byte _0807CD94
	.4byte _0807CD20
	.4byte _0807CD48
	.4byte _0807CD20
_0807CD20:
	bl sub_807CDC4
	lsls r0, 24
	cmp r0, 0
	bne _0807CDB4
	ldr r0, _0807CD40
	movs r2, 0xD8
	lsls r2, 3
	adds r1, r0, r2
	movs r2, 0x3
	strb r2, [r1]
	ldr r3, _0807CD44
	adds r0, r3
	strb r2, [r0]
	b _0807CDB4
	.align 2, 0
_0807CD40: .4byte gUnknown_0202F7E8
_0807CD44: .4byte 0x000006c6
_0807CD48:
	bl sub_807CE24
	lsls r0, 24
	cmp r0, 0
	bne _0807CDB4
	ldr r1, _0807CD64
	movs r0, 0xD8
	lsls r0, 3
	adds r2, r1, r0
	movs r0, 0xFA
	strb r0, [r2]
	ldr r2, _0807CD68
	adds r1, r2
	b _0807CDB0
	.align 2, 0
_0807CD64: .4byte gUnknown_0202F7E8
_0807CD68: .4byte 0x000006c6
_0807CD6C:
	bl sub_807CE7C
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0807CDB4
	ldr r0, _0807CD8C
	movs r3, 0xD8
	lsls r3, 3
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _0807CD90
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	b _0807CDB4
	.align 2, 0
_0807CD8C: .4byte gUnknown_0202F7E8
_0807CD90: .4byte 0x000006c6
_0807CD94:
	ldr r0, _0807CDB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0807CDB4
	ldr r3, _0807CDBC
	adds r0, r2, r3
	ldrb r1, [r0]
	subs r3, 0x1
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _0807CDC0
	adds r1, r2, r0
_0807CDB0:
	movs r0, 0x3
	strb r0, [r1]
_0807CDB4:
	pop {r0}
	bx r0
	.align 2, 0
_0807CDB8: .4byte gPaletteFade
_0807CDBC: .4byte 0x000006c1
_0807CDC0: .4byte 0x000006c6
	thumb_func_end sub_807CCAC

	thumb_func_start sub_807CDC4
sub_807CDC4: @ 807CDC4
	push {r4,lr}
	sub sp, 0x4
	ldr r2, _0807CE00
	ldr r0, _0807CE04
	adds r4, r2, r0
	ldrb r0, [r4]
	cmp r0, 0x10
	beq _0807CE1A
	adds r1, r0, 0x1
	strb r1, [r4]
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0xF
	bhi _0807CE0C
	movs r3, 0x10
	subs r3, r1
	lsls r3, 24
	lsrs r3, 24
	ldr r1, _0807CE08
	adds r0, r2, r1
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, 0
	movs r1, 0x20
	movs r2, 0x3
	bl sub_807D1BC
	movs r0, 0x1
	b _0807CE1C
	.align 2, 0
_0807CE00: .4byte gUnknown_0202F7E8
_0807CE04: .4byte 0x000006c7
_0807CE08: .4byte 0x000006c4
_0807CE0C:
	movs r0, 0
	movs r1, 0x20
	movs r2, 0x3
	bl sub_807CEBC
	movs r0, 0x10
	strb r0, [r4]
_0807CE1A:
	movs r0, 0
_0807CE1C:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807CDC4

	thumb_func_start sub_807CE24
sub_807CE24: @ 807CE24
	push {r4,lr}
	ldr r2, _0807CE58
	ldr r0, _0807CE5C
	adds r4, r2, r0
	ldrb r0, [r4]
	cmp r0, 0x10
	beq _0807CE74
	adds r3, r0, 0x1
	strb r3, [r4]
	lsls r0, r3, 24
	lsrs r0, 24
	cmp r0, 0xF
	bhi _0807CE64
	movs r0, 0x6
	negs r0, r0
	movs r1, 0x10
	subs r1, r3
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0807CE60
	adds r2, r3
	ldrh r2, [r2]
	bl sub_807D304
	movs r0, 0x1
	b _0807CE76
	.align 2, 0
_0807CE58: .4byte gUnknown_0202F7E8
_0807CE5C: .4byte 0x000006c7
_0807CE60: .4byte 0x000006c4
_0807CE64:
	movs r2, 0x6
	negs r2, r2
	movs r0, 0
	movs r1, 0x20
	bl sub_807CEBC
	movs r0, 0x10
	strb r0, [r4]
_0807CE74:
	movs r0, 0
_0807CE76:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807CE24

	thumb_func_start sub_807CE7C
sub_807CE7C: @ 807CE7C
	push {lr}
	ldr r2, _0807CEA4
	ldr r1, _0807CEA8
	adds r0, r2, r1
	ldrb r1, [r0]
	cmp r1, 0x10
	beq _0807CEB0
	adds r1, 0x1
	strb r1, [r0]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0807CEAC
	adds r1, r2, r3
	ldrh r1, [r1]
	bl sub_807D424
	movs r0, 0x1
	b _0807CEB2
	.align 2, 0
_0807CEA4: .4byte gUnknown_0202F7E8
_0807CEA8: .4byte 0x000006c7
_0807CEAC: .4byte 0x000006c4
_0807CEB0:
	movs r0, 0
_0807CEB2:
	pop {r1}
	bx r1
	thumb_func_end sub_807CE7C

	thumb_func_start nullsub_39
nullsub_39: @ 807CEB8
	bx lr
	thumb_func_end nullsub_39

	thumb_func_start sub_807CEBC
sub_807CEBC: @ 807CEBC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	asrs r0, r2, 24
	cmp r0, 0
	bgt _0807CEDE
	b _0807D048
_0807CEDE:
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r5, r3, 4
	adds r0, r1, r3
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r4, r9
	bcc _0807CEF6
	b _0807D1A2
_0807CEF6:
	ldr r1, [sp]
	lsls r0, r1, 24
	asrs r0, 19
	str r0, [sp, 0x4]
_0807CEFE:
	ldr r0, _0807CF30
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807CF3C
	lsls r1, r5, 1
	ldr r0, _0807CF34
	adds r0, r1, r0
	ldr r2, _0807CF38
	adds r1, r2
	movs r2, 0x8
	bl CpuFastSet
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r5, r0, 16
	mov r2, r9
	lsls r2, 16
	mov r8, r2
	adds r4, 0x1
	mov r12, r4
	b _0807D032
	.align 2, 0
_0807CF30: .4byte gUnknown_030006DC
_0807CF34: .4byte gPlttBufferUnfaded
_0807CF38: .4byte gPlttBufferFaded
_0807CF3C:
	cmp r0, 0x2
	beq _0807CF50
	adds r1, r4, 0
	subs r1, 0x10
	ldr r2, _0807CF54
	ldr r3, _0807CF58
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807CF60
_0807CF50:
	ldr r0, _0807CF5C
	b _0807CF66
	.align 2, 0
_0807CF54: .4byte gUnknown_0202F7E8
_0807CF58: .4byte 0x000006d5
_0807CF5C: .4byte gUnknown_0202FC48
_0807CF60:
	movs r3, 0x80
	lsls r3, 2
	adds r0, r2, r3
_0807CF66:
	ldr r1, [sp, 0x4]
	adds r6, r1, r0
	cmp r4, 0x10
	beq _0807CF72
	cmp r4, 0x1B
	bls _0807CFE2
_0807CF72:
	movs r7, 0
	mov r2, r9
	lsls r2, 16
	mov r8, r2
	adds r4, 0x1
	mov r12, r4
	ldr r3, _0807CF9C
	mov r10, r3
_0807CF82:
	adds r2, r5, 0
	lsls r0, r5, 1
	ldr r4, _0807CFA0
	adds r1, r0, r4
	ldrh r0, [r1]
	ldr r3, _0807CFA4
	cmp r0, r3
	bne _0807CFA8
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	b _0807CFD6
	.align 2, 0
_0807CF9C: .4byte gPlttBufferFaded
_0807CFA0: .4byte gPlttBufferUnfaded
_0807CFA4: .4byte 0x00002d9f
_0807CFA8:
	ldr r1, [r1]
	lsls r0, r1, 27
	lsrs r0, 27
	adds r0, r6, r0
	ldrb r4, [r0]
	lsls r0, r1, 22
	lsrs r0, 27
	adds r0, r6, r0
	ldrb r3, [r0]
	lsls r1, 17
	lsrs r1, 27
	adds r1, r6, r1
	ldrb r1, [r1]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r2, 1
	add r2, r10
	lsls r0, r1, 10
	lsls r1, r3, 5
	orrs r0, r1
	orrs r0, r4
	strh r0, [r2]
_0807CFD6:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807CF82
	b _0807D032
_0807CFE2:
	movs r7, 0
	mov r0, r9
	lsls r0, 16
	mov r8, r0
	adds r4, 0x1
	mov r12, r4
	ldr r1, _0807D040
	mov r10, r1
_0807CFF2:
	adds r2, r5, 0
	lsls r0, r2, 1
	ldr r3, _0807D044
	adds r0, r3
	ldr r1, [r0]
	lsls r0, r1, 27
	lsrs r0, 27
	adds r0, r6, r0
	ldrb r4, [r0]
	lsls r0, r1, 22
	lsrs r0, 27
	adds r0, r6, r0
	ldrb r3, [r0]
	lsls r1, 17
	lsrs r1, 27
	adds r1, r6, r1
	ldrb r1, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r2, 1
	add r2, r10
	lsls r0, r1, 10
	lsls r1, r3, 5
	orrs r0, r1
	orrs r0, r4
	strh r0, [r2]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807CFF2
_0807D032:
	mov r4, r12
	lsls r0, r4, 16
	lsrs r4, r0, 16
	cmp r0, r8
	bcs _0807D03E
	b _0807CEFE
_0807D03E:
	b _0807D1A2
	.align 2, 0
_0807D040: .4byte gPlttBufferFaded
_0807D044: .4byte gPlttBufferUnfaded
_0807D048:
	cmp r0, 0
	blt _0807D04E
	b _0807D190
_0807D04E:
	mvns r0, r0
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r5, r3, 4
	adds r0, r1, r3
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	adds r4, r3, 0
	cmp r4, r9
	bcc _0807D068
	b _0807D1A2
_0807D068:
	ldr r0, _0807D098
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807D0A4
	lsls r1, r5, 1
	ldr r0, _0807D09C
	adds r0, r1, r0
	ldr r2, _0807D0A0
	adds r1, r2
	movs r2, 0x8
	bl CpuFastSet
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, r9
	lsls r0, 16
	mov r8, r0
	adds r4, 0x1
	mov r12, r4
	b _0807D174
	.align 2, 0
_0807D098: .4byte gUnknown_030006DC
_0807D09C: .4byte gPlttBufferUnfaded
_0807D0A0: .4byte gPlttBufferFaded
_0807D0A4:
	cmp r4, 0x10
	beq _0807D0AC
	cmp r4, 0x1B
	bls _0807D11C
_0807D0AC:
	movs r7, 0
	mov r1, r9
	lsls r1, 16
	mov r8, r1
	adds r4, 0x1
	mov r12, r4
	ldr r2, _0807D10C
	mov r10, r2
	ldr r3, [sp]
	lsls r0, r3, 24
	asrs r6, r0, 11
_0807D0C2:
	lsls r1, r5, 1
	ldr r4, _0807D110
	adds r0, r1, r4
	ldrh r0, [r0]
	lsls r4, r0, 16
	ldr r2, _0807D114
	cmp r0, r2
	beq _0807D0FA
	ldr r3, _0807D118
	adds r3, r1, r3
	lsrs r0, r4, 17
	movs r1, 0xF
	ands r0, r1
	lsrs r1, r4, 18
	movs r2, 0xF0
	ands r1, r2
	orrs r0, r1
	lsrs r1, r4, 19
	movs r4, 0xF0
	lsls r4, 4
	adds r2, r4, 0
	ands r1, r2
	orrs r0, r1
	lsls r0, 1
	adds r0, r6
	add r0, r10
	ldrh r0, [r0]
	strh r0, [r3]
_0807D0FA:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807D0C2
	b _0807D174
	.align 2, 0
_0807D10C: .4byte 0x02000000
_0807D110: .4byte gPlttBufferUnfaded
_0807D114: .4byte 0x00002d9f
_0807D118: .4byte gPlttBufferFaded
_0807D11C:
	movs r7, 0
	ldr r1, [sp]
	lsls r0, r1, 24
	mov r2, r9
	lsls r2, 16
	mov r8, r2
	adds r4, 0x1
	mov r12, r4
	ldr r3, _0807D184
	mov r10, r3
	asrs r6, r0, 11
_0807D132:
	lsls r0, r5, 1
	ldr r1, _0807D188
	adds r4, r0, r1
	ldr r2, _0807D18C
	adds r0, r2
	ldrh r3, [r0]
	lsls r3, 16
	lsrs r0, r3, 17
	movs r1, 0xF
	ands r0, r1
	lsrs r1, r3, 18
	movs r2, 0xF0
	ands r1, r2
	orrs r0, r1
	lsrs r3, 19
	movs r2, 0xF0
	lsls r2, 4
	adds r1, r2, 0
	ands r3, r1
	orrs r0, r3
	lsls r0, 1
	adds r0, r6
	add r0, r10
	ldrh r0, [r0]
	strh r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807D132
_0807D174:
	mov r3, r12
	lsls r0, r3, 16
	lsrs r4, r0, 16
	cmp r0, r8
	bcs _0807D180
	b _0807D068
_0807D180:
	b _0807D1A2
	.align 2, 0
_0807D184: .4byte 0x02000000
_0807D188: .4byte gPlttBufferFaded
_0807D18C: .4byte gPlttBufferUnfaded
_0807D190:
	lsls r1, r4, 5
	ldr r0, _0807D1B4
	adds r0, r1, r0
	ldr r2, _0807D1B8
	adds r1, r2
	mov r4, r9
	lsls r2, r4, 3
	bl CpuFastSet
_0807D1A2:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D1B4: .4byte gPlttBufferUnfaded
_0807D1B8: .4byte gPlttBufferFaded
	thumb_func_end sub_807CEBC

	thumb_func_start sub_807D1BC
sub_807D1BC: @ 807D1BC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	ldr r4, [sp, 0x34]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	mov r1, sp
	strh r4, [r1]
	ldr r1, [sp]
	lsls r3, r1, 27
	lsrs r3, 27
	str r3, [sp, 0x4]
	lsls r3, r1, 22
	lsrs r3, 27
	str r3, [sp, 0x8]
	lsls r1, 17
	lsrs r1, 27
	str r1, [sp, 0xC]
	lsls r6, r0, 4
	mov r3, r10
	adds r1, r3, r0
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	movs r1, 0xFF
	lsls r1, 24
	adds r2, r1
	lsrs r2, 24
	adds r4, r0, 0
	cmp r4, r10
	bcs _0807D2E8
	lsls r0, r2, 24
	asrs r0, 19
	str r0, [sp, 0x10]
_0807D214:
	ldr r0, _0807D244
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807D248
	mov r0, sp
	ldrh r3, [r0]
	adds r0, r6, 0
	movs r1, 0x10
	mov r2, r8
	bl BlendPalette
	adds r0, r6, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r6, r0, 16
	mov r3, r10
	lsls r3, 16
	mov r9, r3
	adds r4, 0x1
	mov r12, r4
	b _0807D2DE
	.align 2, 0
_0807D244: .4byte gUnknown_030006DC
_0807D248:
	cmp r0, 0x1
	bne _0807D258
	ldr r0, _0807D254
	ldr r1, [sp, 0x10]
	adds r5, r1, r0
	b _0807D25E
	.align 2, 0
_0807D254: .4byte gUnknown_0202F9E8
_0807D258:
	ldr r0, _0807D2F8
	ldr r3, [sp, 0x10]
	adds r5, r3, r0
_0807D25E:
	movs r7, 0
	mov r0, r10
	lsls r0, 16
	mov r9, r0
	adds r4, 0x1
	mov r12, r4
_0807D26A:
	adds r4, r6, 0
	lsls r0, r4, 1
	ldr r1, _0807D2FC
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r1, 27
	lsrs r0, 27
	adds r0, r5, r0
	ldrb r3, [r0]
	lsls r0, r1, 22
	lsrs r0, 27
	adds r0, r5, r0
	ldrb r2, [r0]
	lsls r1, 17
	lsrs r1, 27
	adds r1, r5, r1
	ldrb r1, [r1]
	ldr r6, [sp, 0x4]
	subs r0, r6, r3
	mov r6, r8
	muls r6, r0
	adds r0, r6, 0
	asrs r0, 4
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	ldr r6, [sp, 0x8]
	subs r0, r6, r2
	mov r6, r8
	muls r6, r0
	adds r0, r6, 0
	asrs r0, 4
	adds r2, r0
	lsls r2, 24
	ldr r6, [sp, 0xC]
	subs r0, r6, r1
	mov r6, r8
	muls r6, r0
	adds r0, r6, 0
	asrs r0, 4
	adds r1, r0
	lsls r1, 24
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r4, 1
	ldr r0, _0807D300
	adds r4, r0
	lsrs r1, 14
	lsrs r2, 19
	orrs r1, r2
	orrs r1, r3
	strh r1, [r4]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0xF
	bls _0807D26A
_0807D2DE:
	mov r1, r12
	lsls r0, r1, 16
	lsrs r4, r0, 16
	cmp r0, r9
	bcc _0807D214
_0807D2E8:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D2F8: .4byte gUnknown_0202FC48
_0807D2FC: .4byte gPlttBufferUnfaded
_0807D300: .4byte gPlttBufferFaded
	thumb_func_end sub_807D1BC

	thumb_func_start sub_807D304
sub_807D304: @ 807D304
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r1, 24
	lsrs r6, r1, 24
	mov r1, sp
	strh r2, [r1]
	lsls r0, 24
	movs r1, 0xFF
	lsls r1, 24
	eors r0, r1
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldr r0, [sp]
	lsls r1, r0, 27
	lsrs r1, 27
	str r1, [sp, 0x8]
	lsls r1, r0, 22
	lsrs r1, 27
	str r1, [sp, 0xC]
	lsls r0, 17
	lsrs r0, 27
	mov r10, r0
	movs r5, 0
	movs r4, 0
_0807D33C:
	ldr r0, _0807D364
	ldr r0, [r0]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807D368
	mov r0, sp
	ldrh r3, [r0]
	adds r0, r5, 0
	movs r1, 0x10
	adds r2, r6, 0
	bl BlendPalette
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, 0x1
	mov r8, r4
	b _0807D3FE
	.align 2, 0
_0807D364: .4byte gUnknown_030006DC
_0807D368:
	movs r0, 0
	mov r12, r0
	ldr r1, [sp, 0x4]
	lsls r0, r1, 24
	adds r4, 0x1
	mov r8, r4
	movs r7, 0x1E
	asrs r0, 11
	mov r9, r0
_0807D37A:
	adds r4, r5, 0
	lsls r0, r4, 1
	ldr r5, _0807D418
	adds r0, r5
	ldr r0, [r0]
	lsls r2, r0, 27
	lsrs r2, 27
	lsls r1, r0, 22
	lsrs r1, 27
	lsls r0, 17
	lsrs r0, 27
	ands r0, r7
	lsls r0, 7
	ands r1, r7
	lsls r1, 3
	orrs r0, r1
	ands r2, r7
	lsls r0, 1
	orrs r0, r2
	add r0, r9
	ldr r1, _0807D41C
	adds r0, r1
	ldr r1, [r0]
	lsls r3, r1, 27
	lsrs r3, 27
	lsls r2, r1, 22
	lsrs r2, 27
	lsls r1, 17
	lsrs r1, 27
	ldr r5, [sp, 0x8]
	subs r0, r5, r3
	muls r0, r6
	asrs r0, 4
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	ldr r5, [sp, 0xC]
	subs r0, r5, r2
	muls r0, r6
	asrs r0, 4
	adds r2, r0
	lsls r2, 24
	mov r5, r10
	subs r0, r5, r1
	muls r0, r6
	asrs r0, 4
	adds r1, r0
	lsls r1, 24
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r4, 1
	ldr r0, _0807D420
	adds r4, r0
	lsrs r1, 14
	lsrs r2, 19
	orrs r1, r2
	orrs r1, r3
	strh r1, [r4]
	mov r0, r12
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	cmp r0, 0xF
	bls _0807D37A
_0807D3FE:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r4, r0, 16
	cmp r4, 0x1F
	bls _0807D33C
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D418: .4byte gPlttBufferUnfaded
_0807D41C: .4byte 0x02000000
_0807D420: .4byte gPlttBufferFaded
	thumb_func_end sub_807D304

	thumb_func_start sub_807D424
sub_807D424: @ 807D424
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r3, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r3, 16
	lsrs r3, 16
	mov r0, sp
	strh r3, [r0]
	movs r1, 0x80
	lsls r1, 1
	movs r0, 0
	adds r2, r7, 0
	bl BlendPalette
	ldr r0, [sp]
	lsls r1, r0, 27
	lsrs r1, 27
	str r1, [sp, 0x4]
	lsls r1, r0, 22
	lsrs r1, 27
	str r1, [sp, 0x8]
	lsls r0, 17
	lsrs r0, 27
	mov r10, r0
	movs r4, 0x10
_0807D460:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_807D574
	lsls r0, 24
	cmp r0, 0
	beq _0807D510
	adds r0, r4, 0x1
	lsls r1, r0, 20
	lsrs r1, 16
	mov r12, r1
	lsls r1, r4, 20
	lsrs r6, r1, 16
	mov r9, r0
	cmp r6, r12
	bcs _0807D524
	movs r0, 0x1C
	mov r8, r0
_0807D484:
	lsls r5, r6, 1
	ldr r0, _0807D508
	adds r0, r5, r0
	ldr r2, [r0]
	lsls r4, r2, 27
	lsrs r4, 27
	lsls r3, r2, 22
	lsrs r3, 27
	lsls r2, 17
	lsrs r2, 27
	mov r0, r8
	subs r1, r0, r4
	lsls r0, r1, 1
	adds r0, r1
	asrs r0, 2
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0x1F
	subs r1, r3
	lsls r0, r1, 1
	adds r0, r1
	asrs r0, 2
	adds r3, r0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	subs r1, r0, r2
	lsls r0, r1, 1
	adds r0, r1
	asrs r0, 2
	adds r2, r0
	lsls r2, 24
	lsrs r2, 24
	ldr r1, [sp, 0x4]
	subs r0, r1, r4
	muls r0, r7
	asrs r0, 4
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, [sp, 0x8]
	subs r0, r1, r3
	muls r0, r7
	asrs r0, 4
	adds r3, r0
	lsls r3, 24
	mov r1, r10
	subs r0, r1, r2
	muls r0, r7
	asrs r0, 4
	adds r2, r0
	lsls r2, 24
	ldr r0, _0807D50C
	adds r5, r0
	lsrs r2, 14
	lsrs r3, 19
	orrs r2, r3
	orrs r2, r4
	strh r2, [r5]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r12
	bcc _0807D484
	b _0807D524
	.align 2, 0
_0807D508: .4byte gPlttBufferUnfaded
_0807D50C: .4byte gPlttBufferFaded
_0807D510:
	lsls r0, r4, 20
	lsrs r0, 16
	mov r1, sp
	ldrh r3, [r1]
	movs r1, 0x10
	adds r2, r7, 0
	bl BlendPalette
	adds r4, 0x1
	mov r9, r4
_0807D524:
	mov r1, r9
	lsls r0, r1, 16
	lsrs r4, r0, 16
	cmp r4, 0x1F
	bls _0807D460
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807D424

	thumb_func_start sub_807D540
sub_807D540: @ 807D540
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, _0807D568
	ldr r0, _0807D56C
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, 0x5
	bhi _0807D562
	ldr r4, _0807D570
	adds r0, r3, r4
	ldrb r3, [r1]
	adds r0, r3
	strb r2, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0807D562:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D568: .4byte gUnknown_0202F7E8
_0807D56C: .4byte 0x000006fa
_0807D570: .4byte 0x000006f4
	thumb_func_end sub_807D540

	thumb_func_start sub_807D574
sub_807D574: @ 807D574
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r1, 0
	ldr r2, _0807D59C
	ldr r4, _0807D5A0
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r1, r0
	bcs _0807D5B2
	ldr r5, _0807D5A4
	adds r4, r2, r5
	adds r2, r0, 0
_0807D58E:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _0807D5A8
	movs r0, 0x1
	b _0807D5B4
	.align 2, 0
_0807D59C: .4byte gUnknown_0202F7E8
_0807D5A0: .4byte 0x000006fa
_0807D5A4: .4byte 0x000006f4
_0807D5A8:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r2
	bcc _0807D58E
_0807D5B2:
	movs r0, 0
_0807D5B4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_807D574

	thumb_func_start sub_807D5BC
sub_807D5BC: @ 807D5BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _0807D5E8
	ldr r1, _0807D5EC
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0807D5E2
	lsls r2, r4, 24
	asrs r2, 24
	movs r0, 0
	movs r1, 0x20
	bl sub_807CEBC
	movs r1, 0xD8
	lsls r1, 3
	adds r0, r5, r1
	strb r4, [r0]
_0807D5E2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D5E8: .4byte gUnknown_0202F7E8
_0807D5EC: .4byte 0x000006c6
	thumb_func_end sub_807D5BC

	thumb_func_start sub_807D5F0
sub_807D5F0: @ 807D5F0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r3, _0807D638
	ldr r0, _0807D63C
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, 0x3
	bne _0807D630
	movs r1, 0
	strb r1, [r2]
	movs r2, 0xD8
	lsls r2, 3
	adds r0, r3, r2
	strb r4, [r0]
	adds r2, 0x1
	adds r0, r3, r2
	strb r5, [r0]
	adds r2, 0x2
	adds r0, r3, r2
	strb r1, [r0]
	ldr r1, _0807D640
	adds r0, r3, r1
	strb r6, [r0]
	lsls r0, r4, 24
	asrs r0, 24
	bl sub_807D5BC
_0807D630:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D638: .4byte gUnknown_0202F7E8
_0807D63C: .4byte 0x000006c6
_0807D640: .4byte 0x000006c2
	thumb_func_end sub_807D5F0

	thumb_func_start fade_screen
fade_screen: @ 807D644
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r0, 0x1
	beq _0807D67C
	cmp r0, 0x1
	bgt _0807D660
	cmp r0, 0
	beq _0807D66A
	b _0807D758
_0807D660:
	cmp r2, 0x2
	beq _0807D670
	cmp r2, 0x3
	beq _0807D680
	b _0807D758
_0807D66A:
	movs r4, 0
	movs r1, 0
	b _0807D684
_0807D670:
	ldr r4, _0807D678
	movs r1, 0
	b _0807D684
	.align 2, 0
_0807D678: .4byte 0x0000ffff
_0807D67C:
	movs r4, 0
	b _0807D682
_0807D680:
	ldr r4, _0807D6A4
_0807D682:
	movs r1, 0x1
_0807D684:
	ldr r0, _0807D6A8
	movs r2, 0xDA
	lsls r2, 3
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x3
	blt _0807D6AC
	cmp r0, 0x6
	ble _0807D69E
	cmp r0, 0xD
	bgt _0807D6AC
	cmp r0, 0xB
	blt _0807D6AC
_0807D69E:
	movs r2, 0x1
	b _0807D6AE
	.align 2, 0
_0807D6A4: .4byte 0x0000ffff
_0807D6A8: .4byte gUnknown_0202F7E8
_0807D6AC:
	movs r2, 0
_0807D6AE:
	cmp r1, 0
	beq _0807D6F0
	cmp r2, 0
	beq _0807D6C2
	ldr r0, _0807D6E0
	ldr r1, _0807D6E4
	movs r2, 0x80
	lsls r2, 1
	bl CpuFastSet
_0807D6C2:
	movs r0, 0x1
	negs r0, r0
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0807D6E8
	ldr r3, _0807D6EC
	adds r0, r3
	movs r1, 0x2
	strb r1, [r0]
	b _0807D758
	.align 2, 0
_0807D6E0: .4byte gPlttBufferFaded
_0807D6E4: .4byte gPlttBufferUnfaded
_0807D6E8: .4byte gUnknown_0202F7E8
_0807D6EC: .4byte 0x000006c6
_0807D6F0:
	ldr r1, _0807D708
	ldr r3, _0807D70C
	adds r0, r1, r3
	strh r4, [r0]
	cmp r2, 0
	beq _0807D714
	ldr r0, _0807D710
	adds r1, r0
	movs r0, 0
	strb r0, [r1]
	b _0807D726
	.align 2, 0
_0807D708: .4byte gUnknown_0202F7E8
_0807D70C: .4byte 0x000006c4
_0807D710: .4byte 0x000006c7
_0807D714:
	movs r0, 0x1
	negs r0, r0
	lsls r1, r5, 24
	asrs r1, 24
	str r4, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0807D726:
	ldr r4, _0807D760
	ldr r1, _0807D764
	adds r0, r4, r1
	movs r1, 0
	movs r5, 0x1
	strb r5, [r0]
	ldr r2, _0807D768
	adds r0, r4, r2
	strb r5, [r0]
	ldr r3, _0807D76C
	adds r0, r4, r3
	strb r1, [r0]
	movs r1, 0xE6
	lsls r1, 3
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r2, 0x68
	adds r1, r4, r2
	ldrb r1, [r1]
	bl sub_807DB64
	movs r3, 0xD9
	lsls r3, 3
	adds r4, r3
	strb r5, [r4]
_0807D758:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D760: .4byte gUnknown_0202F7E8
_0807D764: .4byte 0x000006c6
_0807D768: .4byte 0x000006ca
_0807D76C: .4byte 0x000006cb
	thumb_func_end fade_screen

	thumb_func_start sub_807D770
sub_807D770: @ 807D770
	ldr r0, _0807D784
	ldr r1, _0807D788
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
	bx lr
	.align 2, 0
_0807D784: .4byte gUnknown_0202F7E8
_0807D788: .4byte 0x000006c6
	thumb_func_end sub_807D770

	thumb_func_start sub_807D78C
sub_807D78C: @ 807D78C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0x80
	lsls r1, 13
	adds r0, r1
	lsrs r4, r0, 16
	ldr r5, _0807D7CC
	ldr r2, _0807D7D0
	adds r0, r5, r2
	ldrb r0, [r0]
	adds r1, r5, 0
	cmp r0, 0x1
	beq _0807D7D4
	cmp r0, 0x2
	beq _0807D820
	adds r2, 0xA
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x6
	beq _0807D858
	lsls r0, r4, 24
	lsrs r0, 24
	subs r2, 0x10
	adds r1, r2
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r1, 0x1
	bl sub_807CEBC
	b _0807D868
	.align 2, 0
_0807D7CC: .4byte gUnknown_0202F7E8
_0807D7D0: .4byte 0x000006c6
_0807D7D4:
	ldr r2, _0807D814
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807D868
	adds r2, 0x6
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _0807D7F0
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_807D540
_0807D7F0:
	lsls r0, r4, 20
	lsrs r4, r0, 16
	movs r2, 0
	ldr r6, _0807D818
	ldr r0, _0807D81C
	adds r3, r5, r0
_0807D7FC:
	adds r0, r4, r2
	lsls r0, 1
	adds r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xF
	bls _0807D7FC
	b _0807D868
	.align 2, 0
_0807D814: .4byte 0x000006ca
_0807D818: .4byte gPlttBufferFaded
_0807D81C: .4byte 0x000006c4
_0807D820:
	lsls r0, r4, 20
	lsrs r4, r0, 16
	lsls r1, r4, 1
	ldr r0, _0807D84C
	adds r0, r1, r0
	ldr r2, _0807D850
	adds r1, r2
	movs r2, 0x8
	bl CpuFastSet
	ldr r0, _0807D854
	ldrh r2, [r0, 0x4]
	lsls r2, 21
	lsrs r2, 27
	ldrh r3, [r0, 0x6]
	lsls r3, 17
	lsrs r3, 17
	adds r0, r4, 0
	movs r1, 0x10
	bl BlendPalette
	b _0807D868
	.align 2, 0
_0807D84C: .4byte gPlttBufferFaded
_0807D850: .4byte gPlttBufferUnfaded
_0807D854: .4byte gPaletteFade
_0807D858:
	lsls r0, r4, 20
	lsrs r4, r0, 16
	ldr r3, _0807D870
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0xC
	bl BlendPalette
_0807D868:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807D870: .4byte 0x000073fc
	thumb_func_end sub_807D78C

	thumb_func_start sub_807D874
sub_807D874: @ 807D874
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0807D890
	movs r2, 0xD8
	lsls r2, 3
	adds r1, r2
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r1, 0x1
	bl sub_807CEBC
	pop {r0}
	bx r0
	.align 2, 0
_0807D890: .4byte gUnknown_0202F7E8
	thumb_func_end sub_807D874

	thumb_func_start unref_sub_807D894
unref_sub_807D894: @ 807D894
	push {lr}
	ldr r1, _0807D8A8
	ldr r2, _0807D8AC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0807D8B0
	movs r0, 0
	b _0807D8B6
	.align 2, 0
_0807D8A8: .4byte gUnknown_0202F7E8
_0807D8AC: .4byte 0x000006c6
_0807D8B0:
	ldr r2, _0807D8BC
	adds r0, r1, r2
	ldrb r0, [r0]
_0807D8B6:
	pop {r1}
	bx r1
	.align 2, 0
_0807D8BC: .4byte 0x000006ca
	thumb_func_end unref_sub_807D894

	thumb_func_start sub_807D8C0
sub_807D8C0: @ 807D8C0
	push {r4,lr}
	ldr r4, _0807D8E8
	ldr r1, _0807D8EC
	adds r4, r1
	ldrb r1, [r4]
	lsls r1, 20
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadPalette
	ldrb r0, [r4]
	bl sub_807D78C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D8E8: .4byte gUnknown_0202F7E8
_0807D8EC: .4byte 0x000006d4
	thumb_func_end sub_807D8C0

	thumb_func_start sub_807D8F0
sub_807D8F0: @ 807D8F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	mov r8, r1
	ldrb r4, [r7]
	cmp r4, 0x6
	bhi _0807D99A
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0807D94C
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r6, r4, 13
	ldr r5, _0807D950
	adds r1, r6, r5
	bl LZ77UnCompWram
	subs r0, r4, 0x1
	cmp r4, 0
	bne _0807D95C
	ldr r0, _0807D954
	strh r0, [r5]
	movs r2, 0x1
	adds r4, r5, 0
	movs r3, 0
	ldr r5, _0807D958
_0807D92A:
	lsls r1, r2, 1
	adds r1, r3
	adds r1, r4
	subs r0, r2, 0x1
	lsls r0, 1
	adds r0, r3
	adds r0, r4
	ldrh r0, [r0]
	ldrh r6, [r1]
	adds r0, r6
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r5
	bls _0807D92A
	b _0807D984
	.align 2, 0
_0807D94C: .4byte gUnknown_08396FA8
_0807D950: .4byte 0x02000000
_0807D954: .4byte 0x00000421
_0807D958: .4byte 0x00000fff
_0807D95C:
	movs r2, 0
	adds r3, r5, 0
	adds r5, r6, 0
	lsls r4, r0, 13
	ldr r0, _0807D9A4
	mov r12, r0
_0807D968:
	lsls r0, r2, 1
	adds r1, r0, r5
	adds r1, r3
	adds r0, r4
	adds r0, r3
	ldrh r0, [r0]
	ldrh r6, [r1]
	adds r0, r6
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r12
	bls _0807D968
_0807D984:
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x7
	bne _0807D99A
	movs r0, 0x20
	strb r0, [r7]
	mov r1, r8
	strb r0, [r1]
_0807D99A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807D9A4: .4byte 0x00000fff
	thumb_func_end sub_807D8F0

	thumb_func_start sub_807D9A8
sub_807D9A8: @ 807D9A8
	ldr r0, _0807D9BC
	ldr r2, _0807D9C0
	adds r1, r0, r2
	movs r2, 0x1
	strb r2, [r1]
	ldr r1, _0807D9C4
	adds r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0807D9BC: .4byte gUnknown_0202F7E8
_0807D9C0: .4byte 0x0000074d
_0807D9C4: .4byte 0x0000074e
	thumb_func_end sub_807D9A8

	thumb_func_start sub_807D9C8
sub_807D9C8: @ 807D9C8
	push {r4,lr}
	ldr r1, _0807D9F0
	ldr r0, _0807D9F4
	adds r4, r1, r0
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x1F
	bgt _0807D9FC
	ldr r0, _0807D9F8
	adds r1, r0
	adds r0, r4, 0
	bl sub_807D8F0
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x1F
	bgt _0807D9FC
	movs r0, 0x1
	b _0807D9FE
	.align 2, 0
_0807D9F0: .4byte gUnknown_0202F7E8
_0807D9F4: .4byte 0x0000074d
_0807D9F8: .4byte 0x0000074e
_0807D9FC:
	movs r0, 0
_0807D9FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807D9C8

	thumb_func_start sub_807DA04
sub_807DA04: @ 807DA04
	push {lr}
	lsls r0, 24
	asrs r0, 24
	mvns r0, r0
	bl sub_807D5BC
	pop {r0}
	bx r0
	thumb_func_end sub_807DA04

	thumb_func_start sub_807DA14
sub_807DA14: @ 807DA14
	ldr r1, _0807DA3C
	ldr r2, _0807DA40
	adds r0, r1, r2
	movs r2, 0
	strh r2, [r0]
	movs r3, 0xE8
	lsls r3, 3
	adds r0, r1, r3
	strh r2, [r0]
	adds r3, 0x2
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _0807DA44
	adds r1, r0
	strh r2, [r1]
	ldr r1, _0807DA48
	movs r0, 0x5
	strh r0, [r1]
	bx lr
	.align 2, 0
_0807DA3C: .4byte gUnknown_0202F7E8
_0807DA40: .4byte 0x0000073c
_0807DA44: .4byte 0x0000073e
_0807DA48: .4byte gUnknown_0202FF58
	thumb_func_end sub_807DA14

	thumb_func_start sub_807DA4C
sub_807DA4C: @ 807DA4C
	push {r4-r7,lr}
	ldr r5, _0807DA68
	ldr r0, _0807DA6C
	adds r7, r5, r0
	movs r1, 0
	ldrsh r2, [r7, r1]
	cmp r2, 0x1
	beq _0807DAC8
	cmp r2, 0x1
	bgt _0807DA70
	cmp r2, 0
	beq _0807DA76
	b _0807DB54
	.align 2, 0
_0807DA68: .4byte gUnknown_0202F7E8
_0807DA6C: .4byte 0x00000742
_0807DA70:
	cmp r2, 0x2
	beq _0807DB1C
	b _0807DB54
_0807DA76:
	movs r3, 0xE8
	lsls r3, 3
	adds r6, r5, r3
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	lsls r0, 16
	asrs r0, 16
	ldr r1, _0807DABC
	ldrh r1, [r1]
	cmp r0, r1
	ble _0807DB54
	strh r2, [r6]
	ldr r0, _0807DAC0
	adds r4, r5, r0
	ldrh r0, [r4]
	adds r1, r0, 0x1
	strh r1, [r4]
	lsls r0, 24
	asrs r0, 24
	bl sub_807DA04
	ldrh r1, [r4]
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0x5
	ble _0807DB54
	ldr r3, _0807DAC4
	adds r0, r5, r3
	strh r1, [r0]
	movs r0, 0x1
	strh r0, [r7]
	movs r0, 0x3C
	strh r0, [r6]
	b _0807DB54
	.align 2, 0
_0807DABC: .4byte gUnknown_0202FF58
_0807DAC0: .4byte 0x0000073c
_0807DAC4: .4byte 0x0000073e
_0807DAC8:
	movs r0, 0xE8
	lsls r0, 3
	adds r2, r5, r0
	ldrh r0, [r2]
	adds r0, 0x3
	movs r1, 0x7F
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0807DB10
	movs r3, 0
	ldrsh r0, [r2, r3]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	subs r0, 0x1
	asrs r0, 6
	adds r0, 0x2
	ldr r2, _0807DB14
	adds r6, r5, r2
	adds r2, r0, 0
	strh r0, [r6]
	ldr r3, _0807DB18
	adds r4, r5, r3
	movs r3, 0
	ldrsh r1, [r4, r3]
	cmp r0, r1
	beq _0807DB08
	lsls r0, r2, 24
	asrs r0, 24
	bl sub_807DA04
_0807DB08:
	ldrh r0, [r6]
	strh r0, [r4]
	b _0807DB54
	.align 2, 0
_0807DB10: .4byte gSineTable
_0807DB14: .4byte 0x0000073c
_0807DB18: .4byte 0x0000073e
_0807DB1C:
	movs r0, 0xE8
	lsls r0, 3
	adds r2, r5, r0
	ldrh r0, [r2]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	ldr r1, _0807DB5C
	ldrh r1, [r1]
	cmp r0, r1
	ble _0807DB54
	strh r6, [r2]
	ldr r1, _0807DB60
	adds r4, r5, r1
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	lsls r0, 24
	asrs r0, 24
	bl sub_807DA04
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	bne _0807DB54
	strh r6, [r7]
_0807DB54:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807DB5C: .4byte gUnknown_0202FF58
_0807DB60: .4byte 0x0000073c
	thumb_func_end sub_807DA4C

	thumb_func_start sub_807DB64
sub_807DB64: @ 807DB64
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0807DB98
	movs r4, 0xE6
	lsls r4, 3
	adds r2, r3, r4
	strh r0, [r2]
	adds r4, 0x2
	adds r2, r3, r4
	strh r1, [r2]
	adds r4, 0x2
	adds r2, r3, r4
	strh r0, [r2]
	ldr r2, _0807DB9C
	adds r3, r2
	strh r1, [r3]
	ldr r2, _0807DBA0
	lsls r1, 8
	orrs r1, r0
	strh r1, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DB98: .4byte gUnknown_0202F7E8
_0807DB9C: .4byte 0x00000736
_0807DBA0: .4byte REG_BLDALPHA
	thumb_func_end sub_807DB64

	thumb_func_start sub_807DBA4
sub_807DBA4: @ 807DBA4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0807DBD8
	ldr r5, _0807DBDC
	adds r4, r3, r5
	movs r5, 0
	strh r0, [r4]
	ldr r4, _0807DBE0
	adds r0, r3, r4
	strh r1, [r0]
	ldr r1, _0807DBE4
	adds r0, r3, r1
	strb r2, [r0]
	adds r4, 0x3
	adds r0, r3, r4
	strb r5, [r0]
	movs r0, 0xE7
	lsls r0, 3
	adds r3, r0
	strb r5, [r3]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DBD8: .4byte gUnknown_0202F7E8
_0807DBDC: .4byte 0x00000734
_0807DBE0: .4byte 0x00000736
_0807DBE4: .4byte 0x0000073a
	thumb_func_end sub_807DBA4

	thumb_func_start sub_807DBE8
sub_807DBE8: @ 807DBE8
	push {r4-r6,lr}
	ldr r0, _0807DC40
	movs r1, 0xE6
	lsls r1, 3
	adds r3, r0, r1
	ldr r2, [r3]
	ldr r6, _0807DC44
	adds r5, r0, r6
	ldr r1, [r5]
	adds r4, r0, 0
	cmp r2, r1
	beq _0807DCAC
	ldr r0, _0807DC48
	adds r2, r4, r0
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	ldr r6, _0807DC4C
	adds r1, r4, r6
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bls _0807DC78
	movs r0, 0
	strb r0, [r2]
	movs r0, 0xE7
	lsls r0, 3
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0807DC50
	ldrh r1, [r3]
	adds r2, r1, 0
	ldrh r0, [r5]
	cmp r2, r0
	bcs _0807DC70
	adds r0, r1, 0x1
	b _0807DC76
	.align 2, 0
_0807DC40: .4byte gUnknown_0202F7E8
_0807DC44: .4byte 0x00000734
_0807DC48: .4byte 0x00000739
_0807DC4C: .4byte 0x0000073a
_0807DC50:
	ldr r1, _0807DC68
	adds r3, r4, r1
	ldr r2, _0807DC6C
	adds r0, r4, r2
	ldrh r1, [r3]
	adds r2, r1, 0
	ldrh r0, [r0]
	cmp r2, r0
	bcs _0807DC70
	adds r0, r1, 0x1
	b _0807DC76
	.align 2, 0
_0807DC68: .4byte 0x00000732
_0807DC6C: .4byte 0x00000736
_0807DC70:
	cmp r2, r0
	bls _0807DC78
	subs r0, r1, 0x1
_0807DC76:
	strh r0, [r3]
_0807DC78:
	ldr r3, _0807DCA0
	ldr r6, _0807DCA4
	adds r0, r4, r6
	ldrh r0, [r0]
	lsls r0, 8
	movs r1, 0xE6
	lsls r1, 3
	adds r2, r4, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r3]
	ldr r1, [r2]
	ldr r2, _0807DCA8
	adds r0, r4, r2
	ldr r0, [r0]
	cmp r1, r0
	beq _0807DCAC
	movs r0, 0
	b _0807DCAE
	.align 2, 0
_0807DCA0: .4byte REG_BLDALPHA
_0807DCA4: .4byte 0x00000732
_0807DCA8: .4byte 0x00000734
_0807DCAC:
	movs r0, 0x1
_0807DCAE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_807DBE8

	thumb_func_start unref_sub_807DCB4
unref_sub_807DCB4: @ 807DCB4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x9
	bhi _0807DD46
	lsls r0, 2
	ldr r1, _0807DCCC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807DCCC: .4byte _0807DCD0
	.align 2, 0
_0807DCD0:
	.4byte _0807DCF8
	.4byte _0807DD00
	.4byte _0807DD08
	.4byte _0807DD10
	.4byte _0807DD18
	.4byte _0807DD20
	.4byte _0807DD28
	.4byte _0807DD30
	.4byte _0807DD38
	.4byte _0807DD40
_0807DCF8:
	movs r0, 0x1
	bl sub_808070C
	b _0807DD46
_0807DD00:
	movs r0, 0x2
	bl sub_808070C
	b _0807DD46
_0807DD08:
	movs r0, 0x3
	bl sub_808070C
	b _0807DD46
_0807DD10:
	movs r0, 0x4
	bl sub_808070C
	b _0807DD46
_0807DD18:
	movs r0, 0x5
	bl sub_808070C
	b _0807DD46
_0807DD20:
	movs r0, 0x6
	bl sub_808070C
	b _0807DD46
_0807DD28:
	movs r0, 0x9
	bl sub_808070C
	b _0807DD46
_0807DD30:
	movs r0, 0x7
	bl sub_808070C
	b _0807DD46
_0807DD38:
	movs r0, 0x8
	bl sub_808070C
	b _0807DD46
_0807DD40:
	movs r0, 0xB
	bl sub_808070C
_0807DD46:
	pop {r0}
	bx r0
	thumb_func_end unref_sub_807DCB4

	thumb_func_start weather_get_current
weather_get_current: @ 807DD4C
	ldr r0, _0807DD58
	movs r1, 0xDA
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0807DD58: .4byte gUnknown_0202F7E8
	thumb_func_end weather_get_current

	thumb_func_start sub_807DD5C
sub_807DD5C: @ 807DD5C
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r1, _0807DD7C
	ldr r3, _0807DD80
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _0807DDAE
	cmp r2, 0x53
	beq _0807DD94
	cmp r2, 0x53
	bgt _0807DD84
	cmp r2, 0x51
	beq _0807DDA0
	b _0807DDAE
	.align 2, 0
_0807DD7C: .4byte gUnknown_0202F7E8
_0807DD80: .4byte 0x000006c6
_0807DD84:
	cmp r2, 0x55
	bne _0807DDAE
	ldr r0, _0807DD90
	adds r1, r0
	movs r0, 0
	b _0807DDA6
	.align 2, 0
_0807DD90: .4byte 0x000006dd
_0807DD94:
	ldr r3, _0807DD9C
	adds r1, r3
	movs r0, 0x1
	b _0807DDA6
	.align 2, 0
_0807DD9C: .4byte 0x000006dd
_0807DDA0:
	ldr r0, _0807DDB4
	adds r1, r0
	movs r0, 0x2
_0807DDA6:
	strb r0, [r1]
	adds r0, r2, 0
	bl PlaySE
_0807DDAE:
	pop {r0}
	bx r0
	.align 2, 0
_0807DDB4: .4byte 0x000006dd
	thumb_func_end sub_807DD5C

	thumb_func_start play_some_sound
play_some_sound: @ 807DDB8
	push {lr}
	bl IsSpecialSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _0807DDF6
	ldr r0, _0807DDE0
	ldr r1, _0807DDE4
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0807DDE8
	cmp r0, 0x1
	bgt _0807DDF0
	cmp r0, 0
	bne _0807DDF0
	movs r0, 0x56
	bl PlaySE
	b _0807DDF6
	.align 2, 0
_0807DDE0: .4byte gUnknown_0202F7E8
_0807DDE4: .4byte 0x000006dd
_0807DDE8:
	movs r0, 0x54
	bl PlaySE
	b _0807DDF6
_0807DDF0:
	movs r0, 0x52
	bl PlaySE
_0807DDF6:
	pop {r0}
	bx r0
	thumb_func_end play_some_sound

	thumb_func_start sub_807DDFC
sub_807DDFC: @ 807DDFC
	ldr r0, _0807DE08
	ldr r1, _0807DE0C
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0807DE08: .4byte gUnknown_0202F7E8
_0807DE0C: .4byte 0x000006d3
	thumb_func_end sub_807DDFC

	thumb_func_start sub_807DE10
sub_807DE10: @ 807DE10
	ldr r0, _0807DE1C
	ldr r1, _0807DE20
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0807DE1C: .4byte gUnknown_0202F7E8
_0807DE20: .4byte 0x000006c6
	thumb_func_end sub_807DE10

	thumb_func_start unref_sub_807DE24
unref_sub_807DE24: @ 807DE24
	ldr r0, _0807DE30
	ldr r1, _0807DE34
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	bx lr
	.align 2, 0
_0807DE30: .4byte gUnknown_0202F7E8
_0807DE34: .4byte 0x000006c6
	thumb_func_end unref_sub_807DE24

	thumb_func_start sub_807DE38
sub_807DE38: @ 807DE38
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0807DE5C
	ldr r5, _0807DE60
	adds r1, r5, 0
	movs r2, 0x10
	bl CpuSet
	adds r4, r5
	movs r0, 0
	strb r0, [r4]
	ldr r0, _0807DE64
	str r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DE5C: .4byte gUnknown_083970C8
_0807DE60: .4byte gUnknown_0202FF38
_0807DE64: .4byte gUnknown_030006DC
	thumb_func_end sub_807DE38

	thumb_func_start sub_807DE68
sub_807DE68: @ 807DE68
	ldr r1, _0807DE70
	ldr r0, _0807DE74
	str r0, [r1]
	bx lr
	.align 2, 0
_0807DE70: .4byte gUnknown_030006DC
_0807DE74: .4byte gUnknown_083970C8
	thumb_func_end sub_807DE68

	thumb_func_start sub_807DE78
sub_807DE78: @ 807DE78
	push {lr}
	ldr r0, _0807DEB0
	ldr r0, [r0]
	ldr r2, _0807DEB4
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r1, _0807DEB8
	adds r3, r0, r1
	movs r1, 0x14
	strb r1, [r3]
	ldr r3, _0807DEBC
	adds r1, r0, r3
	strb r2, [r1]
	subs r3, 0x6
	adds r1, r0, r3
	strh r2, [r1]
	ldr r1, _0807DEC0
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807DEAC
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
_0807DEAC:
	pop {r0}
	bx r0
	.align 2, 0
_0807DEB0: .4byte gUnknown_08396FC4
_0807DEB4: .4byte 0x000006c1
_0807DEB8: .4byte 0x000006c2
_0807DEBC: .4byte 0x000006d2
_0807DEC0: .4byte 0x000006de
	thumb_func_end sub_807DE78

	thumb_func_start sub_807DEC4
sub_807DEC4: @ 807DEC4
	push {r4,lr}
	bl sub_807DE78
	ldr r0, _0807DEEC
	ldr r1, [r0]
	ldr r2, _0807DEF0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807DEE4
	adds r4, r1, r2
_0807DEDA:
	bl sub_807DEF4
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807DEDA
_0807DEE4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807DEEC: .4byte gUnknown_08396FC4
_0807DEF0: .4byte 0x000006d2
	thumb_func_end sub_807DEC4

	thumb_func_start sub_807DEF4
sub_807DEF4: @ 807DEF4
	push {r4,r5,lr}
	ldr r0, _0807DF10
	ldr r5, [r0]
	ldr r0, _0807DF14
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807DF24
	cmp r0, 0x1
	bgt _0807DF18
	cmp r0, 0
	beq _0807DF1E
	b _0807DF48
	.align 2, 0
_0807DF10: .4byte gUnknown_08396FC4
_0807DF14: .4byte 0x000006cc
_0807DF18:
	cmp r0, 0x2
	beq _0807DF30
	b _0807DF48
_0807DF1E:
	bl sub_807DFD4
	b _0807DF42
_0807DF24:
	movs r0, 0xC
	movs r1, 0x8
	movs r2, 0x1
	bl sub_807DBA4
	b _0807DF42
_0807DF30:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807DF48
	ldr r0, _0807DF50
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807DF42:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807DF48:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DF50: .4byte 0x000006d2
	thumb_func_end sub_807DEF4

	thumb_func_start sub_807DF54
sub_807DF54: @ 807DF54
	push {r4,lr}
	ldr r0, _0807DF6C
	ldr r0, [r0]
	ldr r1, _0807DF70
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0
	beq _0807DF74
	cmp r0, 0x1
	beq _0807DF80
	movs r0, 0
	b _0807DF96
	.align 2, 0
_0807DF6C: .4byte gUnknown_08396FC4
_0807DF70: .4byte 0x000006ce
_0807DF74:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1
	bl sub_807DBA4
	b _0807DF8E
_0807DF80:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807DF94
	bl sub_807E0A0
_0807DF8E:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807DF94:
	movs r0, 0x1
_0807DF96:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807DF54

	thumb_func_start sub_807DF9C
sub_807DF9C: @ 807DF9C
	ldr r0, _0807DFB4
	ldr r1, [r0]
	ldr r0, _0807DFB8
	adds r2, r1, r0
	movs r0, 0
	strb r0, [r2]
	ldr r0, _0807DFBC
	adds r1, r0
	movs r0, 0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_0807DFB4: .4byte gUnknown_08396FC4
_0807DFB8: .4byte 0x000006c1
_0807DFBC: .4byte 0x000006c2
	thumb_func_end sub_807DF9C

	thumb_func_start sub_807DFC0
sub_807DFC0: @ 807DFC0
	push {lr}
	bl sub_807DF9C
	pop {r0}
	bx r0
	thumb_func_end sub_807DFC0

	thumb_func_start nullsub_55
nullsub_55: @ 807DFCC
	bx lr
	thumb_func_end nullsub_55

	thumb_func_start sub_807DFD0
sub_807DFD0: @ 807DFD0
	movs r0, 0
	bx lr
	thumb_func_end sub_807DFD0

	thumb_func_start sub_807DFD4
sub_807DFD4: @ 807DFD4
	push {r4,r5,lr}
	ldr r0, _0807E04C
	ldr r0, [r0]
	ldr r1, _0807E050
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0807E090
	ldr r0, _0807E054
	bl LoadSpriteSheet
	ldr r0, _0807E058
	bl sub_807D8C0
	movs r5, 0
_0807DFF2:
	ldr r0, _0807E05C
	movs r1, 0
	movs r2, 0
	movs r3, 0xFF
	bl CreateSprite
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x40
	beq _0807E068
	ldr r0, _0807E04C
	ldr r1, [r0]
	lsls r2, r5, 2
	movs r0, 0xFA
	lsls r0, 1
	adds r1, r0
	adds r1, r2
	lsls r4, r3, 4
	adds r4, r3
	lsls r4, 2
	ldr r0, _0807E060
	adds r4, r0
	str r4, [r1]
	ldr r0, _0807E064
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x7
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r2, 0x2]
	adds r1, 0x7
	lsls r1, 16
	asrs r1, 16
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	bl sub_80603CC
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	b _0807E07A
	.align 2, 0
_0807E04C: .4byte gUnknown_08396FC4
_0807E050: .4byte 0x000006de
_0807E054: .4byte gUnknown_0839A9D4
_0807E058: .4byte gUnknown_08397108
_0807E05C: .4byte gSpriteTemplate_839A9F0
_0807E060: .4byte gSprites
_0807E064: .4byte gUnknown_0839A9C8
_0807E068:
	ldr r0, _0807E098
	ldr r1, [r0]
	lsls r0, r5, 2
	movs r2, 0xFA
	lsls r2, 1
	adds r1, r2
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807E07A:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x2
	bls _0807DFF2
	ldr r0, _0807E098
	ldr r0, [r0]
	ldr r1, _0807E09C
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807E090:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E098: .4byte gUnknown_08396FC4
_0807E09C: .4byte 0x000006de
	thumb_func_end sub_807DFD4

	thumb_func_start sub_807E0A0
sub_807E0A0: @ 807E0A0
	push {r4,r5,lr}
	ldr r0, _0807E0EC
	ldr r1, [r0]
	ldr r2, _0807E0F0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807E0E4
	movs r4, 0
	movs r0, 0xFA
	lsls r0, 1
	adds r5, r1, r0
_0807E0B8:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807E0C6
	bl DestroySprite
_0807E0C6:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _0807E0B8
	movs r0, 0x90
	lsls r0, 5
	bl FreeSpriteTilesByTag
	ldr r0, _0807E0EC
	ldr r0, [r0]
	ldr r1, _0807E0F0
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807E0E4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E0EC: .4byte gUnknown_08396FC4
_0807E0F0: .4byte 0x000006de
	thumb_func_end sub_807E0A0

	thumb_func_start sub_807E0F4
sub_807E0F4: @ 807E0F4
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	movs r1, 0x1
	ands r0, r1
	strh r0, [r2, 0x2E]
	cmp r0, 0
	beq _0807E10C
	ldrh r0, [r2, 0x20]
	subs r0, 0x1
	strh r0, [r2, 0x20]
_0807E10C:
	pop {r0}
	bx r0
	thumb_func_end sub_807E0F4

	thumb_func_start sub_807E110
sub_807E110: @ 807E110
	ldr r0, _0807E134
	ldr r1, [r0]
	ldr r0, _0807E138
	adds r3, r1, r0
	movs r2, 0
	movs r0, 0
	strh r0, [r3]
	ldr r3, _0807E13C
	adds r0, r1, r3
	strb r2, [r0]
	subs r3, 0x11
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _0807E140
	adds r1, r0
	strb r2, [r1]
	bx lr
	.align 2, 0
_0807E134: .4byte gUnknown_08396FC4
_0807E138: .4byte 0x000006cc
_0807E13C: .4byte 0x000006d2
_0807E140: .4byte 0x000006c2
	thumb_func_end sub_807E110

	thumb_func_start sub_807E144
sub_807E144: @ 807E144
	push {r4,lr}
	bl sub_807E110
	ldr r0, _0807E16C
	ldr r1, [r0]
	ldr r2, _0807E170
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807E164
	adds r4, r1, r2
_0807E15A:
	bl sub_807E174
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807E15A
_0807E164:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E16C: .4byte gUnknown_08396FC4
_0807E170: .4byte 0x000006d2
	thumb_func_end sub_807E144

	thumb_func_start sub_807E174
sub_807E174: @ 807E174
	push {lr}
	ldr r1, _0807E190
	ldr r0, [r1]
	ldr r2, _0807E194
	adds r0, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _0807E250
	lsls r0, 2
	ldr r1, _0807E198
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807E190: .4byte gUnknown_08396FC4
_0807E194: .4byte 0x000006cc
_0807E198: .4byte _0807E19C
	.align 2, 0
_0807E19C:
	.4byte _0807E1B0
	.4byte _0807E1CC
	.4byte _0807E1E4
	.4byte _0807E200
	.4byte _0807E218
_0807E1B0:
	ldr r1, [r2]
	ldr r2, _0807E1C4
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807E254
	ldr r0, _0807E1C8
	adds r1, r0
	b _0807E238
	.align 2, 0
_0807E1C4: .4byte 0x000006c6
_0807E1C8: .4byte 0x000006cc
_0807E1CC:
	bl sub_807D9A8
	ldr r0, _0807E1DC
	ldr r1, [r0]
	ldr r2, _0807E1E0
	adds r1, r2
	b _0807E238
	.align 2, 0
_0807E1DC: .4byte gUnknown_08396FC4
_0807E1E0: .4byte 0x000006cc
_0807E1E4:
	bl sub_807D9C8
	lsls r0, 24
	cmp r0, 0
	bne _0807E254
	ldr r0, _0807E1F8
	ldr r1, [r0]
	ldr r0, _0807E1FC
	adds r1, r0
	b _0807E238
	.align 2, 0
_0807E1F8: .4byte gUnknown_08396FC4
_0807E1FC: .4byte 0x000006cc
_0807E200:
	bl sub_807DA14
	ldr r0, _0807E210
	ldr r1, [r0]
	ldr r2, _0807E214
	adds r1, r2
	b _0807E238
	.align 2, 0
_0807E210: .4byte gUnknown_08396FC4
_0807E214: .4byte 0x000006cc
_0807E218:
	bl sub_807DA4C
	ldr r0, _0807E240
	ldr r2, [r0]
	ldr r1, _0807E244
	adds r0, r2, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x6
	bne _0807E254
	ldr r0, _0807E248
	adds r1, r2, r0
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _0807E24C
	adds r1, r2, r0
_0807E238:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0807E254
	.align 2, 0
_0807E240: .4byte gUnknown_08396FC4
_0807E244: .4byte 0x0000073c
_0807E248: .4byte 0x000006d2
_0807E24C: .4byte 0x000006cc
_0807E250:
	bl sub_807DA4C
_0807E254:
	pop {r0}
	bx r0
	thumb_func_end sub_807E174

	thumb_func_start sub_807E258
sub_807E258: @ 807E258
	movs r0, 0
	bx lr
	thumb_func_end sub_807E258

	thumb_func_start sub_807E25C
sub_807E25C: @ 807E25C
	push {lr}
	ldr r0, _0807E26C
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807E26C: .4byte task50_0807B6D4
	thumb_func_end sub_807E25C

	thumb_func_start task50_0807B6D4
task50_0807B6D4: @ 807E270
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0807E294
	adds r3, r0, r1
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	cmp r0, 0x4
	bhi _0807E35E
	lsls r0, 2
	ldr r1, _0807E298
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807E294: .4byte gTasks
_0807E298: .4byte _0807E29C
	.align 2, 0
_0807E29C:
	.4byte _0807E2B0
	.4byte _0807E2D2
	.4byte _0807E300
	.4byte _0807E334
	.4byte _0807E354
_0807E2B0:
	movs r2, 0
	strh r2, [r3, 0xA]
	strh r2, [r3, 0xC]
	ldr r1, _0807E2F4
	ldrh r0, [r1]
	strh r0, [r3, 0xE]
	ldr r4, _0807E2F8
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x8
	movs r0, 0x9E
	strh r0, [r1]
	ldr r0, _0807E2FC
	strh r2, [r0]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_0807E2D2:
	ldrh r0, [r3, 0xA]
	adds r0, 0x3
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _0807E2E4
	movs r0, 0x10
	strh r0, [r3, 0xA]
_0807E2E4:
	ldr r0, _0807E2FC
	ldrh r1, [r3, 0xA]
	strh r1, [r0]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0xF
	ble _0807E35E
	b _0807E344
	.align 2, 0
_0807E2F4: .4byte REG_WININ
_0807E2F8: .4byte 0x00003f3f
_0807E2FC: .4byte REG_BLDY
_0807E300:
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _0807E35E
	strh r1, [r3, 0xC]
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	cmp r0, 0
	bgt _0807E326
	strh r1, [r3, 0xA]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_0807E326:
	ldr r1, _0807E330
	ldrh r0, [r3, 0xA]
	strh r0, [r1]
	b _0807E35E
	.align 2, 0
_0807E330: .4byte REG_BLDY
_0807E334:
	ldr r0, _0807E34C
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldr r1, _0807E350
	ldrh r0, [r3, 0xE]
	strh r0, [r1]
_0807E344:
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _0807E35E
	.align 2, 0
_0807E34C: .4byte REG_BLDCNT
_0807E350: .4byte REG_WININ
_0807E354:
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_0807E35E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task50_0807B6D4

	thumb_func_start sub_807E364
sub_807E364: @ 807E364
	push {r4,lr}
	ldr r0, _0807E3B4
	ldr r1, [r0]
	ldr r2, _0807E3B8
	adds r0, r1, r2
	movs r3, 0
	movs r2, 0
	strh r2, [r0]
	ldr r4, _0807E3BC
	adds r0, r1, r4
	strb r3, [r0]
	adds r4, 0x4
	adds r0, r1, r4
	strh r2, [r0]
	ldr r0, _0807E3C0
	adds r2, r1, r0
	movs r0, 0x8
	strb r0, [r2]
	ldr r2, _0807E3C4
	adds r0, r1, r2
	strb r3, [r0]
	adds r4, 0x3
	adds r2, r1, r4
	movs r0, 0xA
	strb r0, [r2]
	ldr r0, _0807E3C8
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	ldr r2, _0807E3CC
	adds r1, r2
	movs r0, 0x14
	strb r0, [r1]
	movs r0, 0x55
	bl sub_807DD5C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E3B4: .4byte gUnknown_08396FC4
_0807E3B8: .4byte 0x000006cc
_0807E3BC: .4byte 0x000006d2
_0807E3C0: .4byte 0x000006db
_0807E3C4: .4byte 0x000006dc
_0807E3C8: .4byte 0x000006c1
_0807E3CC: .4byte 0x000006c2
	thumb_func_end sub_807E364

	thumb_func_start sub_807E3D0
sub_807E3D0: @ 807E3D0
	push {r4,lr}
	bl sub_807E364
	ldr r0, _0807E3F8
	ldr r1, [r0]
	ldr r2, _0807E3FC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807E3F0
	adds r4, r1, r2
_0807E3E6:
	bl sub_807E400
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807E3E6
_0807E3F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807E3F8: .4byte gUnknown_08396FC4
_0807E3FC: .4byte 0x000006d2
	thumb_func_end sub_807E3D0

	thumb_func_start sub_807E400
sub_807E400: @ 807E400
	push {r4,r5,lr}
	ldr r0, _0807E41C
	ldr r5, [r0]
	ldr r0, _0807E420
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807E430
	cmp r0, 0x1
	bgt _0807E424
	cmp r0, 0
	beq _0807E42A
	b _0807E454
	.align 2, 0
_0807E41C: .4byte gUnknown_08396FC4
_0807E420: .4byte 0x000006cc
_0807E424:
	cmp r0, 0x2
	beq _0807E43C
	b _0807E454
_0807E42A:
	bl sub_807E7A4
	b _0807E44E
_0807E430:
	bl sub_807E7B4
	lsls r0, 24
	cmp r0, 0
	bne _0807E454
	b _0807E44E
_0807E43C:
	bl sub_807E8E8
	lsls r0, 24
	cmp r0, 0
	bne _0807E454
	ldr r0, _0807E45C
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807E44E:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807E454:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807E45C: .4byte 0x000006d2
	thumb_func_end sub_807E400

	thumb_func_start sub_807E460
sub_807E460: @ 807E460
	push {r4,r5,lr}
	ldr r0, _0807E47C
	ldr r2, [r0]
	ldr r1, _0807E480
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r4, r0, 0
	cmp r1, 0
	beq _0807E484
	cmp r1, 0x1
	beq _0807E4B8
	movs r0, 0
	b _0807E4E6
	.align 2, 0
_0807E47C: .4byte gUnknown_08396FC4
_0807E480: .4byte 0x000006ce
_0807E484:
	ldr r5, _0807E4A4
	adds r0, r2, r5
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _0807E496
	cmp r0, 0x5
	beq _0807E496
	cmp r0, 0xD
	bne _0807E4AC
_0807E496:
	ldr r0, [r4]
	ldr r1, _0807E4A8
	adds r0, r1
	movs r1, 0xFF
	strh r1, [r0]
	movs r0, 0
	b _0807E4E6
	.align 2, 0
_0807E4A4: .4byte 0x000006d1
_0807E4A8: .4byte 0x000006ce
_0807E4AC:
	ldr r4, _0807E4D8
	adds r0, r2, r4
	strb r1, [r0]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_0807E4B8:
	bl sub_807E8E8
	lsls r0, 24
	cmp r0, 0
	bne _0807E4E4
	bl sub_807E974
	ldr r0, _0807E4DC
	ldr r1, [r0]
	ldr r5, _0807E4E0
	adds r1, r5
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0
	b _0807E4E6
	.align 2, 0
_0807E4D8: .4byte 0x000006d9
_0807E4DC: .4byte gUnknown_08396FC4
_0807E4E0: .4byte 0x000006ce
_0807E4E4:
	movs r0, 0x1
_0807E4E6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_807E460

	thumb_func_start sub_807E4EC
sub_807E4EC: @ 807E4EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	movs r1, 0x30
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bne _0807E500
	ldr r0, _0807E5A4
	strh r0, [r7, 0x30]
_0807E500:
	movs r2, 0x30
	ldrsh r1, [r7, r2]
	ldr r0, _0807E5A8
	muls r0, r1
	ldr r3, _0807E5AC
	adds r0, r3
	lsls r0, 1
	lsrs r0, 17
	movs r1, 0x96
	lsls r1, 2
	bl __umodsi3
	movs r1, 0
	mov r8, r1
	strh r0, [r7, 0x30]
	ldr r1, _0807E5B0
	ldr r0, _0807E5B4
	ldr r5, [r0]
	ldr r2, _0807E5B8
	adds r5, r2
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldrh r6, [r0]
	movs r3, 0x30
	ldrsh r0, [r7, r3]
	movs r1, 0x1E
	bl __modsi3
	adds r4, r0, 0
	lsls r4, 16
	asrs r4, 16
	lsls r0, r4, 3
	strh r0, [r7, 0x32]
	movs r1, 0x30
	ldrsh r0, [r7, r1]
	movs r1, 0x1E
	bl __divsi3
	lsls r0, 16
	lsls r4, 7
	strh r4, [r7, 0x32]
	asrs r0, 9
	strh r0, [r7, 0x34]
	ldr r2, _0807E5BC
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r2
	movs r3, 0
	ldrsh r1, [r1, r3]
	muls r1, r6
	subs r4, r1
	strh r4, [r7, 0x32]
	ldrb r1, [r5]
	lsls r1, 2
	adds r2, 0x2
	adds r1, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	muls r1, r6
	subs r0, r1
	strh r0, [r7, 0x34]
	adds r0, r7, 0
	movs r1, 0
	bl StartSpriteAnim
	mov r3, r8
	strh r3, [r7, 0x36]
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	strh r6, [r7, 0x2E]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E5A4: .4byte 0x00000169
_0807E5A8: .4byte 0x41c64e6d
_0807E5AC: .4byte 0x00003039
_0807E5B0: .4byte gUnknown_0839AAC4
_0807E5B4: .4byte gUnknown_08396FC4
_0807E5B8: .4byte 0x000006dc
_0807E5BC: .4byte gUnknown_0839AABC
	thumb_func_end sub_807E4EC

	thumb_func_start sub_807E5C0
sub_807E5C0: @ 807E5C0
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x36
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0807E69C
	ldr r3, _0807E634
	ldr r4, _0807E638
	ldr r2, [r4]
	ldr r0, _0807E63C
	adds r2, r0
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0]
	ldrh r0, [r5, 0x32]
	adds r1, r0
	strh r1, [r5, 0x32]
	ldrb r0, [r2]
	lsls r0, 2
	adds r3, 0x2
	adds r0, r3
	ldrh r0, [r0]
	ldrh r2, [r5, 0x34]
	adds r0, r2
	strh r0, [r5, 0x34]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r5, 0x20]
	lsls r0, 16
	asrs r2, r0, 20
	strh r2, [r5, 0x22]
	movs r3, 0x38
	ldrsh r0, [r5, r3]
	adds r3, r4, 0
	cmp r0, 0
	beq _0807E640
	adds r0, r1, 0
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bhi _0807E640
	adds r1, r2, 0
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	blt _0807E640
	cmp r1, 0xB0
	bgt _0807E640
	adds r0, r5, 0
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	b _0807E64A
	.align 2, 0
_0807E634: .4byte gUnknown_0839AABC
_0807E638: .4byte gUnknown_08396FC4
_0807E63C: .4byte 0x000006dc
_0807E640:
	adds r0, r5, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
_0807E64A:
	strb r1, [r0]
	adds r4, r0, 0
	ldrh r0, [r5, 0x2E]
	subs r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _0807E6BC
	ldr r0, [r3]
	ldr r1, _0807E690
	adds r0, r1
	ldrb r1, [r0]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	movs r0, 0x1
	strh r0, [r5, 0x36]
	ldr r1, _0807E694
	ldrh r0, [r5, 0x20]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r5, 0x20]
	ldr r1, _0807E698
	ldrh r0, [r5, 0x22]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	b _0807E6BC
	.align 2, 0
_0807E690: .4byte 0x000006dc
_0807E694: .4byte gSpriteCoordOffsetX
_0807E698: .4byte gSpriteCoordOffsetY
_0807E69C:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0807E6BC
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, 0
	bl sub_807E4EC
_0807E6BC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807E5C0

	thumb_func_start sub_807E6C4
sub_807E6C4: @ 807E6C4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0807E6E4
	adds r0, r4, 0
	bl sub_807E4EC
	ldr r0, _0807E6E0
	str r0, [r4, 0x1C]
	b _0807E6E8
	.align 2, 0
_0807E6E0: .4byte sub_807E5C0
_0807E6E4:
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
_0807E6E8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807E6C4

	thumb_func_start sub_807E6F0
sub_807E6F0: @ 807E6F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	lsls r5, r1, 16
	lsrs r5, 16
	ldr r2, _0807E774
	ldr r0, _0807E778
	ldr r0, [r0]
	ldr r1, _0807E77C
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r1, r0, r2
	ldrh r1, [r1]
	mov r8, r1
	adds r2, 0x2
	adds r0, r2
	ldrh r4, [r0]
	add r4, r8
	adds r0, r5, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 16
	lsrs r4, r0, 16
	subs r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _0807E780
	cmp r6, r0
	beq _0807E74E
	adds r5, r0, 0
_0807E73E:
	adds r0, r7, 0
	bl sub_807E4EC
	subs r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, r5
	bne _0807E73E
_0807E74E:
	cmp r4, r8
	bcs _0807E784
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _0807E780
	cmp r4, r0
	beq _0807E770
	adds r5, r0, 0
_0807E760:
	adds r0, r7, 0
	bl sub_807E5C0
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r5
	bne _0807E760
_0807E770:
	movs r0, 0
	b _0807E798
	.align 2, 0
_0807E774: .4byte gUnknown_0839AAC4
_0807E778: .4byte gUnknown_08396FC4
_0807E77C: .4byte 0x000006dc
_0807E780: .4byte 0x0000ffff
_0807E784:
	mov r1, r8
	subs r0, r4, r1
	strh r0, [r7, 0x2E]
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_0807E798:
	strh r0, [r7, 0x3A]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807E6F0

	thumb_func_start sub_807E7A4
sub_807E7A4: @ 807E7A4
	push {lr}
	ldr r0, _0807E7B0
	bl LoadSpriteSheet
	pop {r0}
	bx r0
	.align 2, 0
_0807E7B0: .4byte gUnknown_0839AACC
	thumb_func_end sub_807E7A4

	thumb_func_start sub_807E7B4
sub_807E7B4: @ 807E7B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _0807E860
	ldr r4, [r0]
	ldr r0, _0807E864
	adds r2, r4, r0
	ldrb r0, [r2]
	cmp r0, 0x18
	bne _0807E7CE
	b _0807E8D4
_0807E7CE:
	ldrb r7, [r2]
	ldr r0, _0807E868
	ldr r2, _0807E86C
	lsls r6, r7, 2
	adds r2, r6, r2
	movs r3, 0
	ldrsh r1, [r2, r3]
	movs r3, 0x2
	ldrsh r2, [r2, r3]
	movs r3, 0x4E
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _0807E87C
	ldr r3, _0807E870
	lsls r4, r5, 4
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r3
	movs r0, 0
	strh r0, [r1, 0x38]
	lsls r2, r7, 3
	adds r0, r2, r7
	lsls r0, 4
	adds r0, r7
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	ldr r1, _0807E874
	mov r10, r6
	mov r9, r3
	mov r12, r4
	mov r8, r2
	cmp r0, r1
	ble _0807E832
	adds r2, r1, 0
_0807E81A:
	adds r0, r4, r5
	lsls r0, 2
	ldr r6, _0807E870
	adds r0, r6
	ldr r3, _0807E878
	ldrh r6, [r0, 0x30]
	adds r1, r3, r6
	strh r1, [r0, 0x30]
	lsls r1, 16
	asrs r1, 16
	cmp r1, r2
	bgt _0807E81A
_0807E832:
	mov r0, r12
	adds r4, r0, r5
	lsls r4, 2
	add r4, r9
	adds r0, r4, 0
	bl sub_807E4EC
	mov r3, r8
	adds r1, r3, r7
	adds r0, r4, 0
	bl sub_807E6F0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0807E860
	ldr r0, [r0]
	add r0, r10
	str r4, [r0]
	b _0807E882
	.align 2, 0
_0807E860: .4byte gUnknown_08396FC4
_0807E864: .4byte 0x000006da
_0807E868: .4byte gSpriteTemplate_839AAA4
_0807E86C: .4byte gUnknown_0839AA08
_0807E870: .4byte gSprites
_0807E874: .4byte 0x00000257
_0807E878: .4byte 0xfffffda8
_0807E87C:
	adds r1, r4, r6
	movs r0, 0
	str r0, [r1]
_0807E882:
	ldr r0, _0807E8B8
	ldr r2, [r0]
	ldr r6, _0807E8BC
	adds r1, r2, r6
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x18
	bne _0807E8D8
	movs r3, 0
	adds r1, r2, 0
	ldr r5, _0807E8C0
	ldr r4, _0807E8C4
_0807E8A0:
	lsls r0, r3, 2
	adds r0, r1, r0
	ldr r2, [r0]
	cmp r2, 0
	beq _0807E8CA
	movs r6, 0x3A
	ldrsh r0, [r2, r6]
	cmp r0, 0
	bne _0807E8C8
	str r5, [r2, 0x1C]
	b _0807E8CA
	.align 2, 0
_0807E8B8: .4byte gUnknown_08396FC4
_0807E8BC: .4byte 0x000006da
_0807E8C0: .4byte sub_807E5C0
_0807E8C4: .4byte sub_807E6C4
_0807E8C8:
	str r4, [r2, 0x1C]
_0807E8CA:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x17
	bls _0807E8A0
_0807E8D4:
	movs r0, 0
	b _0807E8DA
_0807E8D8:
	movs r0, 0x1
_0807E8DA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_807E7B4

	thumb_func_start sub_807E8E8
sub_807E8E8: @ 807E8E8
	push {r4-r7,lr}
	ldr r0, _0807E904
	ldr r3, [r0]
	movs r0, 0xDB
	lsls r0, 3
	adds r4, r3, r0
	ldr r1, _0807E908
	adds r5, r3, r1
	ldrb r0, [r4]
	ldrb r7, [r5]
	cmp r0, r7
	bne _0807E90C
	movs r0, 0
	b _0807E96E
	.align 2, 0
_0807E904: .4byte gUnknown_08396FC4
_0807E908: .4byte 0x000006d9
_0807E90C:
	ldr r0, _0807E944
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r2]
	ldr r7, _0807E948
	adds r1, r3, r7
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1]
	cmp r0, r1
	bls _0807E96C
	strh r6, [r2]
	ldrb r0, [r4]
	adds r1, r0, 0
	ldrb r5, [r5]
	cmp r1, r5
	bcs _0807E94C
	adds r0, 0x1
	strb r0, [r4]
	lsls r0, r1, 2
	adds r0, r3, r0
	ldr r1, [r0]
	movs r0, 0x1
	strh r0, [r1, 0x38]
	b _0807E96C
	.align 2, 0
_0807E944: .4byte 0x000006d6
_0807E948: .4byte 0x000006db
_0807E94C:
	subs r0, 0x1
	strb r0, [r4]
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r3, r0
	ldr r0, [r0]
	strh r6, [r0, 0x38]
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r3, r0
	ldr r1, [r0]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
_0807E96C:
	movs r0, 0x1
_0807E96E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_807E8E8

	thumb_func_start sub_807E974
sub_807E974: @ 807E974
	push {r4-r7,lr}
	movs r4, 0
	ldr r0, _0807E9BC
	ldr r2, [r0]
	ldr r3, _0807E9C0
	adds r1, r2, r3
	adds r7, r0, 0
	ldrb r1, [r1]
	cmp r4, r1
	bcs _0807E9A6
	adds r5, r2, 0
	adds r6, r5, r3
_0807E98C:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807E99A
	bl DestroySprite
_0807E99A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r0, [r6]
	cmp r4, r0
	bcc _0807E98C
_0807E9A6:
	ldr r0, [r7]
	ldr r1, _0807E9C0
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0807E9C4
	bl FreeSpriteTilesByTag
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E9BC: .4byte gUnknown_08396FC4
_0807E9C0: .4byte 0x000006da
_0807E9C4: .4byte 0x00001206
	thumb_func_end sub_807E974

	thumb_func_start sub_807E9C8
sub_807E9C8: @ 807E9C8
	push {r4,lr}
	ldr r0, _0807EA04
	ldr r1, [r0]
	ldr r2, _0807EA08
	adds r0, r1, r2
	movs r2, 0
	movs r3, 0
	strh r3, [r0]
	ldr r4, _0807EA0C
	adds r0, r1, r4
	strb r2, [r0]
	ldr r0, _0807EA10
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	subs r4, 0x10
	adds r2, r1, r4
	movs r0, 0x14
	strb r0, [r2]
	ldr r0, _0807EA14
	adds r2, r1, r0
	movs r0, 0x10
	strb r0, [r2]
	movs r2, 0xDC
	lsls r2, 3
	adds r1, r2
	strh r3, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EA04: .4byte gUnknown_08396FC4
_0807EA08: .4byte 0x000006cc
_0807EA0C: .4byte 0x000006d2
_0807EA10: .4byte 0x000006c1
_0807EA14: .4byte 0x000006e5
	thumb_func_end sub_807E9C8

	thumb_func_start sub_807EA18
sub_807EA18: @ 807EA18
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	bl sub_807E9C8
	ldr r2, _0807EA78
	ldr r1, [r2]
	ldr r3, _0807EA7C
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807EA6E
	mov r8, r2
	adds r7, r1, r3
_0807EA34:
	bl snowflakes_progress2
	movs r4, 0
	mov r1, r8
	ldr r0, [r1]
	ldr r3, _0807EA80
	adds r0, r3
	ldrb r0, [r0]
	cmp r4, r0
	bcs _0807EA68
	ldr r0, _0807EA78
	ldr r5, [r0]
	adds r6, r5, r3
_0807EA4E:
	lsls r1, r4, 2
	adds r0, r5, 0
	adds r0, 0x60
	adds r0, r1
	ldr r0, [r0]
	bl sub_807ED48
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r0, [r6]
	cmp r4, r0
	bcc _0807EA4E
_0807EA68:
	ldrb r0, [r7]
	cmp r0, 0
	beq _0807EA34
_0807EA6E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EA78: .4byte gUnknown_08396FC4
_0807EA7C: .4byte 0x000006d2
_0807EA80: .4byte 0x000006e4
	thumb_func_end sub_807EA18

	thumb_func_start snowflakes_progress2
snowflakes_progress2: @ 807EA84
	push {r4,r5,lr}
	ldr r0, _0807EAB4
	ldr r5, [r0]
	ldr r0, _0807EAB8
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0
	bne _0807EAAC
	bl snowflakes_progress
	lsls r0, 24
	cmp r0, 0
	bne _0807EAAC
	ldr r0, _0807EABC
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807EAAC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EAB4: .4byte gUnknown_08396FC4
_0807EAB8: .4byte 0x000006cc
_0807EABC: .4byte 0x000006d2
	thumb_func_end snowflakes_progress2

	thumb_func_start sub_807EAC0
sub_807EAC0: @ 807EAC0
	push {r4,lr}
	ldr r0, _0807EAD8
	ldr r2, [r0]
	ldr r0, _0807EADC
	adds r3, r2, r0
	ldrh r1, [r3]
	cmp r1, 0
	beq _0807EAE0
	cmp r1, 0x1
	beq _0807EAF2
	movs r0, 0
	b _0807EB1E
	.align 2, 0
_0807EAD8: .4byte gUnknown_08396FC4
_0807EADC: .4byte 0x000006ce
_0807EAE0:
	ldr r4, _0807EB10
	adds r0, r2, r4
	strb r1, [r0]
	subs r4, 0x5
	adds r0, r2, r4
	strh r1, [r0]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_0807EAF2:
	bl snowflakes_progress
	lsls r0, 24
	cmp r0, 0
	bne _0807EB1C
	ldr r0, _0807EB14
	ldr r1, [r0]
	ldr r0, _0807EB18
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0
	b _0807EB1E
	.align 2, 0
_0807EB10: .4byte 0x000006e5
_0807EB14: .4byte gUnknown_08396FC4
_0807EB18: .4byte 0x000006ce
_0807EB1C:
	movs r0, 0x1
_0807EB1E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807EAC0

	thumb_func_start snowflakes_progress
snowflakes_progress: @ 807EB24
	push {r4,lr}
	ldr r0, _0807EB40
	ldr r1, [r0]
	ldr r0, _0807EB44
	adds r3, r1, r0
	ldr r4, _0807EB48
	adds r2, r1, r4
	ldrb r0, [r3]
	ldrb r4, [r2]
	cmp r0, r4
	bne _0807EB4C
	movs r0, 0
	b _0807EB8E
	.align 2, 0
_0807EB40: .4byte gUnknown_08396FC4
_0807EB44: .4byte 0x000006e4
_0807EB48: .4byte 0x000006e5
_0807EB4C:
	movs r0, 0xDC
	lsls r0, 3
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x24
	bls _0807EB76
	movs r0, 0
	strh r0, [r1]
	ldrb r0, [r3]
	ldrb r2, [r2]
	cmp r0, r2
	bcs _0807EB72
	bl snowflake_add
	b _0807EB76
_0807EB72:
	bl snowflake_remove
_0807EB76:
	ldr r0, _0807EB94
	ldr r0, [r0]
	ldr r2, _0807EB98
	adds r1, r0, r2
	ldr r4, _0807EB9C
	adds r0, r4
	ldrb r1, [r1]
	ldrb r0, [r0]
	eors r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_0807EB8E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807EB94: .4byte gUnknown_08396FC4
_0807EB98: .4byte 0x000006e4
_0807EB9C: .4byte 0x000006e5
	thumb_func_end snowflakes_progress

	thumb_func_start snowflake_add
snowflake_add: @ 807EBA0
	push {r4-r6,lr}
	ldr r0, _0807EBF4
	movs r1, 0
	movs r2, 0
	movs r3, 0x4E
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0807EC04
	ldr r0, _0807EBF8
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	ldr r0, _0807EBFC
	ldr r5, [r0]
	ldr r0, _0807EC00
	adds r6, r5, r0
	ldrb r0, [r6]
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_807EC40
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	adds r1, r0, 0x1
	strb r1, [r6]
	lsls r0, 24
	lsrs r0, 22
	adds r5, 0x60
	adds r5, r0
	str r4, [r5]
	movs r0, 0x1
	b _0807EC06
	.align 2, 0
_0807EBF4: .4byte gSpriteTemplate_839AB04
_0807EBF8: .4byte gSprites
_0807EBFC: .4byte gUnknown_08396FC4
_0807EC00: .4byte 0x000006e4
_0807EC04:
	movs r0, 0
_0807EC06:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end snowflake_add

	thumb_func_start snowflake_remove
snowflake_remove: @ 807EC0C
	push {lr}
	ldr r0, _0807EC20
	ldr r1, [r0]
	ldr r0, _0807EC24
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, 0
	bne _0807EC28
	movs r0, 0
	b _0807EC3C
	.align 2, 0
_0807EC20: .4byte gUnknown_08396FC4
_0807EC24: .4byte 0x000006e4
_0807EC28:
	subs r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 22
	adds r1, 0x60
	adds r1, r0
	ldr r0, [r1]
	bl DestroySprite
	movs r0, 0x1
_0807EC3C:
	pop {r1}
	bx r1
	thumb_func_end snowflake_remove

	thumb_func_start sub_807EC40
sub_807EC40: @ 807EC40
	push {r4-r7,lr}
	adds r5, r0, 0
	bl Random
	movs r1, 0x36
	ldrsh r2, [r5, r1]
	lsls r1, r2, 2
	adds r1, r2
	movs r2, 0x7
	ands r1, r2
	lsls r4, r1, 4
	subs r4, r1
	lsls r4, 1
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1E
	bl __umodsi3
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	ldr r1, _0807ECE4
	adds r0, r5, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r1]
	adds r0, r1
	movs r2, 0x3
	negs r2, r2
	adds r1, r2, 0
	subs r1, r0
	movs r7, 0
	strh r1, [r5, 0x22]
	ldr r1, _0807ECE8
	adds r0, r5, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r1]
	adds r0, r1
	subs r4, r0
	strh r4, [r5, 0x20]
	movs r1, 0x22
	ldrsh r0, [r5, r1]
	lsls r0, 7
	strh r0, [r5, 0x2E]
	strh r7, [r5, 0x24]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r6, r0, 0
	movs r4, 0x3
	ands r4, r6
	lsls r0, r4, 2
	adds r0, r4
	adds r0, 0x40
	strh r0, [r5, 0x30]
	strh r0, [r5, 0x3C]
	movs r1, 0x1
	bics r1, r6
	adds r0, r5, 0
	bl StartSpriteAnim
	strh r7, [r5, 0x34]
	movs r0, 0x1
	cmp r4, 0
	bne _0807ECD0
	movs r0, 0x2
_0807ECD0:
	strh r0, [r5, 0x32]
	movs r0, 0x1F
	ands r0, r6
	adds r0, 0xD2
	strh r0, [r5, 0x3A]
	strh r7, [r5, 0x38]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807ECE4: .4byte gSpriteCoordOffsetY
_0807ECE8: .4byte gSpriteCoordOffsetX
	thumb_func_end sub_807EC40

	thumb_func_start sub_807ECEC
sub_807ECEC: @ 807ECEC
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0807ED38
	ldr r0, [r0]
	ldr r1, _0807ED3C
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x12
	bls _0807ED32
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0807ED40
	str r0, [r3, 0x1C]
	ldr r1, _0807ED44
	adds r0, r3, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r1]
	adds r0, r1
	movs r1, 0xFA
	subs r1, r0
	movs r2, 0
	strh r1, [r3, 0x22]
	movs r1, 0x22
	ldrsh r0, [r3, r1]
	lsls r0, 7
	strh r0, [r3, 0x2E]
	strh r2, [r4]
_0807ED32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807ED38: .4byte gUnknown_08396FC4
_0807ED3C: .4byte 0x000006e2
_0807ED40: .4byte sub_807ED48
_0807ED44: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_807ECEC

	thumb_func_start sub_807ED48
sub_807ED48: @ 807ED48
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 23
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x34]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
	ldr r1, _0807EDC0
	movs r3, 0x34
	ldrsh r0, [r4, r3]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0807ED7A
	adds r0, 0x3F
_0807ED7A:
	asrs r0, 6
	strh r0, [r4, 0x24]
	adds r0, r4, 0
	adds r0, 0x28
	movs r5, 0
	ldrsb r5, [r0, r5]
	ldrh r0, [r4, 0x20]
	adds r0, r5
	ldr r1, _0807EDC4
	ldrh r1, [r1]
	adds r3, r1, r0
	ldr r2, _0807EDC8
	adds r0, r2, 0
	ands r3, r0
	adds r2, r3, 0
	movs r0, 0x80
	lsls r0, 1
	ands r0, r2
	cmp r0, 0
	beq _0807EDAC
	ldr r3, _0807EDCC
	adds r0, r3, 0
	orrs r2, r0
	lsls r0, r2, 16
	lsrs r3, r0, 16
_0807EDAC:
	lsls r0, r3, 16
	asrs r0, 16
	movs r2, 0x3
	negs r2, r2
	cmp r0, r2
	bge _0807EDD0
	adds r1, r5
	movs r0, 0xF2
	subs r0, r1
	b _0807EDD8
	.align 2, 0
_0807EDC0: .4byte gSineTable
_0807EDC4: .4byte gSpriteCoordOffsetX
_0807EDC8: .4byte 0x000001ff
_0807EDCC: .4byte 0xffffff00
_0807EDD0:
	cmp r0, 0xF2
	ble _0807EDDA
	adds r0, r1, r5
	subs r0, r2, r0
_0807EDD8:
	strh r0, [r4, 0x20]
_0807EDDA:
	adds r0, r4, 0
	adds r0, 0x29
	movs r3, 0
	ldrsb r3, [r0, r3]
	ldrh r0, [r4, 0x22]
	adds r0, r3
	ldr r1, _0807EE18
	ldrh r1, [r1]
	adds r2, r1, r0
	movs r0, 0xFF
	ands r2, r0
	adds r0, r2, 0
	subs r0, 0xA4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x6
	bhi _0807EE1C
	adds r1, r3
	movs r0, 0xFA
	subs r0, r1
	movs r1, 0
	strh r0, [r4, 0x22]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	lsls r0, 7
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x38]
	movs r0, 0xDC
	strh r0, [r4, 0x3A]
	b _0807EE48
	.align 2, 0
_0807EE18: .4byte gSpriteCoordOffsetY
_0807EE1C:
	adds r0, r2, 0
	subs r0, 0xF3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x6
	bhi _0807EE48
	movs r1, 0
	movs r0, 0xA3
	strh r0, [r4, 0x22]
	lsls r0, 7
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x38]
	movs r0, 0xDC
	strh r0, [r4, 0x3A]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0807EE7C
	str r0, [r4, 0x1C]
_0807EE48:
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x3A
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _0807EE74
	adds r0, r4, 0
	bl sub_807EC40
	movs r0, 0xFA
	strh r0, [r4, 0x22]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0807EE7C
	str r0, [r4, 0x1C]
_0807EE74:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EE7C: .4byte sub_807ECEC
	thumb_func_end sub_807ED48

	thumb_func_start sub_807EE80
sub_807EE80: @ 807EE80
	push {r4,r5,lr}
	ldr r0, _0807EED8
	ldr r1, [r0]
	ldr r2, _0807EEDC
	adds r0, r1, r2
	movs r3, 0
	movs r2, 0
	strh r2, [r0]
	ldr r5, _0807EEE0
	adds r4, r1, r5
	strb r3, [r4]
	adds r5, 0x4
	adds r0, r1, r5
	strh r2, [r0]
	ldr r0, _0807EEE4
	adds r2, r1, r0
	movs r0, 0x4
	strb r0, [r2]
	ldr r2, _0807EEE8
	adds r0, r1, r2
	strb r3, [r0]
	adds r5, 0x3
	adds r2, r1, r5
	movs r0, 0x10
	strb r0, [r2]
	ldr r0, _0807EEEC
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	subs r5, 0x17
	adds r2, r1, r5
	movs r0, 0x14
	strb r0, [r2]
	strb r3, [r4]
	ldr r0, _0807EEF0
	adds r1, r0
	strb r3, [r1]
	movs r0, 0x51
	bl sub_807DD5C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EED8: .4byte gUnknown_08396FC4
_0807EEDC: .4byte 0x000006cc
_0807EEE0: .4byte 0x000006d2
_0807EEE4: .4byte 0x000006db
_0807EEE8: .4byte 0x000006dc
_0807EEEC: .4byte 0x000006c1
_0807EEF0: .4byte 0x000006ed
	thumb_func_end sub_807EE80

	thumb_func_start sub_807EEF4
sub_807EEF4: @ 807EEF4
	push {r4,lr}
	bl sub_807EE80
	ldr r0, _0807EF1C
	ldr r1, [r0]
	ldr r2, _0807EF20
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807EF14
	adds r4, r1, r2
_0807EF0A:
	bl sub_807EFC0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807EF0A
_0807EF14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EF1C: .4byte gUnknown_08396FC4
_0807EF20: .4byte 0x000006d2
	thumb_func_end sub_807EEF4

	thumb_func_start sub_807EF24
sub_807EF24: @ 807EF24
	push {r4,r5,lr}
	ldr r0, _0807EF78
	ldr r1, [r0]
	ldr r2, _0807EF7C
	adds r0, r1, r2
	movs r4, 0
	movs r2, 0
	strh r2, [r0]
	ldr r5, _0807EF80
	adds r3, r1, r5
	strb r4, [r3]
	adds r5, 0x4
	adds r0, r1, r5
	strh r2, [r0]
	ldr r0, _0807EF84
	adds r2, r1, r0
	movs r0, 0x4
	strb r0, [r2]
	adds r5, 0x6
	adds r2, r1, r5
	movs r0, 0x1
	strb r0, [r2]
	ldr r0, _0807EF88
	adds r2, r1, r0
	movs r0, 0x18
	strb r0, [r2]
	subs r5, 0x1B
	adds r2, r1, r5
	movs r0, 0x3
	strb r0, [r2]
	ldr r0, _0807EF8C
	adds r1, r0
	movs r0, 0x14
	strb r0, [r1]
	strb r4, [r3]
	movs r0, 0x53
	bl sub_807DD5C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EF78: .4byte gUnknown_08396FC4
_0807EF7C: .4byte 0x000006cc
_0807EF80: .4byte 0x000006d2
_0807EF84: .4byte 0x000006db
_0807EF88: .4byte 0x000006d9
_0807EF8C: .4byte 0x000006c2
	thumb_func_end sub_807EF24

	thumb_func_start sub_807EF90
sub_807EF90: @ 807EF90
	push {r4,lr}
	bl sub_807EF24
	ldr r0, _0807EFB8
	ldr r1, [r0]
	ldr r2, _0807EFBC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807EFB0
	adds r4, r1, r2
_0807EFA6:
	bl sub_807EFC0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807EFA6
_0807EFB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807EFB8: .4byte gUnknown_08396FC4
_0807EFBC: .4byte 0x000006d2
	thumb_func_end sub_807EF90

	thumb_func_start sub_807EFC0
sub_807EFC0: @ 807EFC0
	push {r4,r5,lr}
	bl sub_807F434
	ldr r0, _0807EFE0
	ldr r0, [r0]
	ldr r1, _0807EFE4
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0xE
	bls _0807EFD6
	b _0807F336
_0807EFD6:
	lsls r0, 2
	ldr r1, _0807EFE8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807EFE0: .4byte gUnknown_08396FC4
_0807EFE4: .4byte 0x000006cc
_0807EFE8: .4byte _0807EFEC
	.align 2, 0
_0807EFEC:
	.4byte _0807F028
	.4byte _0807F044
	.4byte _0807F068
	.4byte _0807F098
	.4byte _0807F0BC
	.4byte _0807F0EC
	.4byte _0807F11C
	.4byte _0807F148
	.4byte _0807F166
	.4byte _0807F1C4
	.4byte _0807F248
	.4byte _0807F270
	.4byte _0807F2A0
	.4byte _0807F2E4
	.4byte _0807F318
_0807F028:
	bl sub_807E7A4
	ldr r0, _0807F03C
	ldr r1, [r0]
	ldr r2, _0807F040
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F334
	.align 2, 0
_0807F03C: .4byte gUnknown_08396FC4
_0807F040: .4byte 0x000006cc
_0807F044:
	bl sub_807E7B4
	lsls r0, 24
	cmp r0, 0
	beq _0807F050
	b _0807F336
_0807F050:
	ldr r0, _0807F060
	ldr r1, [r0]
	ldr r3, _0807F064
	adds r1, r3
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F334
	.align 2, 0
_0807F060: .4byte gUnknown_08396FC4
_0807F064: .4byte 0x000006cc
_0807F068:
	bl sub_807E8E8
	lsls r0, 24
	cmp r0, 0
	beq _0807F074
	b _0807F336
_0807F074:
	ldr r0, _0807F08C
	ldr r1, [r0]
	ldr r0, _0807F090
	adds r2, r1, r0
	movs r0, 0x1
	strb r0, [r2]
	ldr r2, _0807F094
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F334
	.align 2, 0
_0807F08C: .4byte gUnknown_08396FC4
_0807F090: .4byte 0x000006d2
_0807F094: .4byte 0x000006cc
_0807F098:
	ldr r0, _0807F0B0
	ldr r1, [r0]
	ldr r3, _0807F0B4
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F0A8
	b _0807F336
_0807F0A8:
	ldr r0, _0807F0B8
	adds r1, r0
	movs r0, 0x6
	b _0807F334
	.align 2, 0
_0807F0B0: .4byte gUnknown_08396FC4
_0807F0B4: .4byte 0x000006c6
_0807F0B8: .4byte 0x000006cc
_0807F0BC:
	ldr r0, _0807F10C
	ldr r4, [r0]
	ldr r2, _0807F110
	adds r1, r4, r2
	movs r0, 0x1
	strb r0, [r1]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r5, 0xB4
	lsls r5, 1
	adds r1, r5, 0
	bl __umodsi3
	adds r0, r5
	ldr r3, _0807F114
	adds r1, r4, r3
	strh r0, [r1]
	ldr r0, _0807F118
	adds r4, r0
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807F0EC:
	ldr r0, _0807F10C
	ldr r2, [r0]
	ldr r3, _0807F114
	adds r1, r2, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _0807F102
	b _0807F336
_0807F102:
	ldr r0, _0807F118
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F334
	.align 2, 0
_0807F10C: .4byte gUnknown_08396FC4
_0807F110: .4byte 0x000006ea
_0807F114: .4byte 0x000006e6
_0807F118: .4byte 0x000006cc
_0807F11C:
	ldr r0, _0807F13C
	ldr r4, [r0]
	ldr r1, _0807F140
	adds r0, r4, r1
	movs r5, 0x1
	strb r5, [r0]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ands r0, r5
	ldr r2, _0807F144
	adds r1, r4, r2
	strb r0, [r1]
	b _0807F1A4
	.align 2, 0
_0807F13C: .4byte gUnknown_08396FC4
_0807F140: .4byte 0x000006ea
_0807F144: .4byte 0x000006eb
_0807F148:
	bl Random
	ldr r1, _0807F1B0
	ldr r2, [r1]
	movs r1, 0x1
	ands r1, r0
	adds r1, 0x1
	ldr r3, _0807F1B4
	adds r0, r2, r3
	strb r1, [r0]
	ldr r0, _0807F1B8
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_0807F166:
	movs r0, 0x13
	bl sub_807D5BC
	ldr r0, _0807F1B0
	ldr r1, [r0]
	ldr r2, _0807F1BC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F18A
	ldr r3, _0807F1B4
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0807F18A
	movs r0, 0x14
	bl sub_807F3F8
_0807F18A:
	bl Random
	ldr r1, _0807F1B0
	ldr r4, [r1]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	adds r0, 0x6
	ldr r2, _0807F1C0
	adds r1, r4, r2
	strh r0, [r1]
_0807F1A4:
	ldr r3, _0807F1B8
	adds r4, r3
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807F336
	.align 2, 0
_0807F1B0: .4byte gUnknown_08396FC4
_0807F1B4: .4byte 0x000006ec
_0807F1B8: .4byte 0x000006cc
_0807F1BC: .4byte 0x000006eb
_0807F1C0: .4byte 0x000006e6
_0807F1C4:
	ldr r0, _0807F210
	ldr r4, [r0]
	ldr r0, _0807F214
	adds r5, r4, r0
	ldrh r0, [r5]
	subs r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	cmp r0, 0
	beq _0807F1DA
	b _0807F336
_0807F1DA:
	movs r0, 0x3
	bl sub_807D5BC
	ldr r2, _0807F218
	adds r1, r4, r2
	movs r0, 0x1
	strb r0, [r1]
	ldr r3, _0807F21C
	adds r1, r4, r3
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	beq _0807F224
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	ands r0, r1
	adds r0, 0x3C
	strh r0, [r5]
	ldr r0, _0807F220
	adds r1, r4, r0
	movs r0, 0xA
	b _0807F334
	.align 2, 0
_0807F210: .4byte gUnknown_08396FC4
_0807F214: .4byte 0x000006e6
_0807F218: .4byte 0x000006ea
_0807F21C: .4byte 0x000006ec
_0807F220: .4byte 0x000006cc
_0807F224:
	ldr r1, _0807F234
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F23C
	ldr r2, _0807F238
	adds r1, r4, r2
	b _0807F332
	.align 2, 0
_0807F234: .4byte 0x000006eb
_0807F238: .4byte 0x000006cc
_0807F23C:
	ldr r3, _0807F244
	adds r1, r4, r3
	movs r0, 0xB
	b _0807F334
	.align 2, 0
_0807F244: .4byte 0x000006cc
_0807F248:
	ldr r0, _0807F264
	ldr r2, [r0]
	ldr r0, _0807F268
	adds r1, r2, r0
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _0807F336
	ldr r3, _0807F26C
	adds r1, r2, r3
	movs r0, 0x8
	b _0807F334
	.align 2, 0
_0807F264: .4byte gUnknown_08396FC4
_0807F268: .4byte 0x000006e6
_0807F26C: .4byte 0x000006cc
_0807F270:
	bl Random
	ldr r1, _0807F294
	ldr r2, [r1]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF
	ands r0, r1
	adds r0, 0x3C
	ldr r3, _0807F298
	adds r1, r2, r3
	strh r0, [r1]
	ldr r0, _0807F29C
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	b _0807F336
	.align 2, 0
_0807F294: .4byte gUnknown_08396FC4
_0807F298: .4byte 0x000006e6
_0807F29C: .4byte 0x000006cc
_0807F2A0:
	ldr r0, _0807F2D8
	ldr r5, [r0]
	ldr r1, _0807F2DC
	adds r4, r5, r1
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	cmp r0, 0
	bne _0807F336
	movs r0, 0x64
	bl sub_807F3F8
	movs r0, 0x13
	bl sub_807D5BC
	bl Random
	movs r1, 0xF
	ands r1, r0
	adds r1, 0x1E
	strh r1, [r4]
	ldr r2, _0807F2E0
	adds r1, r5, r2
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F334
	.align 2, 0
_0807F2D8: .4byte gUnknown_08396FC4
_0807F2DC: .4byte 0x000006e6
_0807F2E0: .4byte 0x000006cc
_0807F2E4:
	ldr r0, _0807F30C
	ldr r4, [r0]
	ldr r3, _0807F310
	adds r1, r4, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _0807F336
	movs r0, 0x13
	movs r1, 0x3
	movs r2, 0x5
	bl sub_807D5F0
	ldr r0, _0807F314
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, 0x1
	b _0807F334
	.align 2, 0
_0807F30C: .4byte gUnknown_08396FC4
_0807F310: .4byte 0x000006e6
_0807F314: .4byte 0x000006cc
_0807F318:
	ldr r0, _0807F33C
	ldr r2, [r0]
	ldr r1, _0807F340
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _0807F336
	ldr r3, _0807F344
	adds r1, r2, r3
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _0807F348
	adds r1, r2, r0
_0807F332:
	movs r0, 0x4
_0807F334:
	strh r0, [r1]
_0807F336:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F33C: .4byte gUnknown_08396FC4
_0807F340: .4byte 0x000006c6
_0807F344: .4byte 0x000006ea
_0807F348: .4byte 0x000006cc
	thumb_func_end sub_807EFC0

	thumb_func_start sub_807F34C
sub_807F34C: @ 807F34C
	push {r4-r6,lr}
	ldr r0, _0807F368
	ldr r6, [r0]
	ldr r0, _0807F36C
	adds r5, r6, r0
	ldrh r1, [r5]
	cmp r1, 0x1
	beq _0807F382
	cmp r1, 0x1
	bgt _0807F370
	cmp r1, 0
	beq _0807F376
	b _0807F3E8
	.align 2, 0
_0807F368: .4byte gUnknown_08396FC4
_0807F36C: .4byte 0x000006ce
_0807F370:
	cmp r1, 0x2
	beq _0807F3CC
	b _0807F3E8
_0807F376:
	ldr r2, _0807F3BC
	adds r0, r6, r2
	strb r1, [r0]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0807F382:
	bl sub_807EFC0
	ldr r0, _0807F3C0
	ldr r2, [r0]
	ldr r1, _0807F3BC
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807F3F0
	subs r1, 0x19
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x3
	beq _0807F3E8
	cmp r0, 0x5
	beq _0807F3E8
	cmp r0, 0xD
	beq _0807F3E8
	ldr r0, _0807F3C4
	adds r1, r2, r0
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0807F3C8
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0807F3F0
	.align 2, 0
_0807F3BC: .4byte 0x000006ea
_0807F3C0: .4byte gUnknown_08396FC4
_0807F3C4: .4byte 0x000006d9
_0807F3C8: .4byte 0x000006ce
_0807F3CC:
	bl sub_807E8E8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0807F3F0
	bl sub_807E974
	ldr r1, _0807F3EC
	adds r0, r6, r1
	strb r4, [r0]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0807F3E8:
	movs r0, 0
	b _0807F3F2
	.align 2, 0
_0807F3EC: .4byte 0x000006ed
_0807F3F0:
	movs r0, 0x1
_0807F3F2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_807F34C

	thumb_func_start sub_807F3F8
sub_807F3F8: @ 807F3F8
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _0807F42C
	ldr r4, [r0]
	ldr r0, _0807F430
	adds r5, r4, r0
	ldrb r0, [r5]
	cmp r0, 0
	bne _0807F426
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	bl __umodsi3
	movs r2, 0xDD
	lsls r2, 3
	adds r1, r4, r2
	strh r0, [r1]
	movs r0, 0x1
	strb r0, [r5]
_0807F426:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F42C: .4byte gUnknown_08396FC4
_0807F430: .4byte 0x000006ed
	thumb_func_end sub_807F3F8

	thumb_func_start sub_807F434
sub_807F434: @ 807F434
	push {r4,lr}
	ldr r0, _0807F46C
	ldr r1, [r0]
	ldr r2, _0807F470
	adds r0, r1, r2
	ldrb r4, [r0]
	cmp r4, 0x1
	bne _0807F494
	movs r0, 0xDD
	lsls r0, 3
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	bne _0807F490
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _0807F494
	bl Random
	ands r4, r0
	cmp r4, 0
	beq _0807F474
	movs r0, 0x57
	bl PlaySE
	b _0807F47A
	.align 2, 0
_0807F46C: .4byte gUnknown_08396FC4
_0807F470: .4byte 0x000006ed
_0807F474:
	movs r0, 0x58
	bl PlaySE
_0807F47A:
	ldr r0, _0807F488
	ldr r0, [r0]
	ldr r1, _0807F48C
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _0807F494
	.align 2, 0
_0807F488: .4byte gUnknown_08396FC4
_0807F48C: .4byte 0x000006ed
_0807F490:
	subs r0, 0x1
	strh r0, [r1]
_0807F494:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_807F434

	thumb_func_start sub_807F49C
sub_807F49C: @ 807F49C
	push {lr}
	ldr r0, _0807F4E8
	ldr r3, [r0]
	ldr r0, _0807F4EC
	adds r1, r3, r0
	movs r2, 0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807F4F0
	adds r0, r3, r1
	strb r2, [r0]
	subs r1, 0x11
	adds r0, r3, r1
	strb r2, [r0]
	ldr r2, _0807F4F4
	adds r1, r3, r2
	movs r0, 0x14
	strb r0, [r1]
	ldr r1, _0807F4F8
	adds r0, r3, r1
	ldrb r1, [r0]
	cmp r1, 0
	bne _0807F4E4
	adds r2, 0x2E
	adds r0, r3, r2
	strh r1, [r0]
	adds r2, 0x2
	adds r0, r3, r2
	strh r1, [r0]
	subs r2, 0x4
	adds r0, r3, r2
	strh r1, [r0]
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
_0807F4E4:
	pop {r0}
	bx r0
	.align 2, 0
_0807F4E8: .4byte gUnknown_08396FC4
_0807F4EC: .4byte 0x000006cc
_0807F4F0: .4byte 0x000006d2
_0807F4F4: .4byte 0x000006c2
_0807F4F8: .4byte 0x000006fb
	thumb_func_end sub_807F49C

	thumb_func_start sub_807F4FC
sub_807F4FC: @ 807F4FC
	push {r4,lr}
	bl sub_807F49C
	ldr r0, _0807F524
	ldr r1, [r0]
	ldr r2, _0807F528
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F51C
	adds r4, r1, r2
_0807F512:
	bl sub_807F52C
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807F512
_0807F51C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F524: .4byte gUnknown_08396FC4
_0807F528: .4byte 0x000006d2
	thumb_func_end sub_807F4FC

	thumb_func_start sub_807F52C
sub_807F52C: @ 807F52C
	push {r4-r6,lr}
	ldr r0, _0807F578
	ldr r6, [r0]
	ldr r0, _0807F57C
	ldr r1, _0807F580
	adds r2, r6, r1
	ldrh r0, [r0]
	ldrh r1, [r2]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r3, _0807F584
	adds r1, r6, r3
	strh r0, [r1]
	movs r0, 0xDE
	lsls r0, 3
	adds r1, r6, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bls _0807F566
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_0807F566:
	ldr r1, _0807F588
	adds r5, r6, r1
	ldrh r4, [r5]
	cmp r4, 0
	beq _0807F58C
	cmp r4, 0x1
	beq _0807F5CC
	b _0807F5E2
	.align 2, 0
_0807F578: .4byte gUnknown_08396FC4
_0807F57C: .4byte gSpriteCoordOffsetX
_0807F580: .4byte 0x000006f2
_0807F584: .4byte 0x000006ee
_0807F588: .4byte 0x000006cc
_0807F58C:
	bl sub_807F6E8
	movs r3, 0xDA
	lsls r3, 3
	adds r0, r6, r3
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _0807F5A8
	movs r0, 0xC
	movs r1, 0x8
	movs r2, 0x3
	bl sub_807DBA4
	b _0807F5B2
_0807F5A8:
	movs r0, 0x4
	movs r1, 0x10
	movs r2, 0
	bl sub_807DBA4
_0807F5B2:
	ldr r0, _0807F5C4
	ldr r1, [r0]
	ldr r0, _0807F5C8
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0807F5E2
	.align 2, 0
_0807F5C4: .4byte gUnknown_08396FC4
_0807F5C8: .4byte 0x000006cc
_0807F5CC:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807F5E2
	ldr r1, _0807F5E8
	adds r0, r6, r1
	strb r4, [r0]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0807F5E2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F5E8: .4byte 0x000006d2
	thumb_func_end sub_807F52C

	thumb_func_start sub_807F5EC
sub_807F5EC: @ 807F5EC
	push {r4,lr}
	ldr r0, _0807F63C
	ldr r2, [r0]
	ldr r0, _0807F640
	ldr r1, _0807F644
	adds r3, r2, r1
	ldrh r0, [r0]
	ldrh r1, [r3]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r4, _0807F648
	adds r1, r2, r4
	strh r0, [r1]
	movs r0, 0xDE
	lsls r0, 3
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bls _0807F626
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_0807F626:
	ldr r1, _0807F64C
	adds r4, r2, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807F662
	cmp r0, 0x1
	bgt _0807F650
	cmp r0, 0
	beq _0807F656
	b _0807F67A
	.align 2, 0
_0807F63C: .4byte gUnknown_08396FC4
_0807F640: .4byte gSpriteCoordOffsetX
_0807F644: .4byte 0x000006f2
_0807F648: .4byte 0x000006ee
_0807F64C: .4byte 0x000006ce
_0807F650:
	cmp r0, 0x2
	beq _0807F66E
	b _0807F67A
_0807F656:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x3
	bl sub_807DBA4
	b _0807F672
_0807F662:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807F67E
	b _0807F672
_0807F66E:
	bl sub_807F7A4
_0807F672:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807F67E
_0807F67A:
	movs r0, 0
	b _0807F680
_0807F67E:
	movs r0, 0x1
_0807F680:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807F5EC

	thumb_func_start sub_807F688
sub_807F688: @ 807F688
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0807F6D4
	ldrb r0, [r0]
	strh r0, [r3, 0x26]
	ldr r0, _0807F6D8
	ldr r0, [r0]
	ldr r1, _0807F6DC
	adds r2, r0, r1
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _0807F6E0
	cmp r1, r0
	ble _0807F6CC
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x2E
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _0807F6E4
	ands r1, r0
	strh r1, [r3, 0x20]
_0807F6CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F6D4: .4byte gSpriteCoordOffsetY
_0807F6D8: .4byte gUnknown_08396FC4
_0807F6DC: .4byte 0x000006ee
_0807F6E0: .4byte 0x010f0000
_0807F6E4: .4byte 0x000001ff
	thumb_func_end sub_807F688

	thumb_func_start sub_807F6E8
sub_807F6E8: @ 807F6E8
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _0807F75C
	ldr r0, [r0]
	ldr r1, _0807F760
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F792
	ldr r0, _0807F764
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	movs r5, 0
_0807F70C:
	ldr r0, _0807F768
	movs r1, 0
	movs r2, 0
	movs r3, 0xFF
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0807F770
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807F76C
	adds r4, r0
	adds r0, r5, 0
	movs r1, 0x5
	bl __umodsi3
	strh r0, [r4, 0x2E]
	lsls r0, 16
	lsrs r0, 10
	adds r0, 0x20
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 10
	adds r0, 0x20
	strh r0, [r4, 0x22]
	ldr r2, _0807F75C
	ldr r0, [r2]
	lsls r1, r5, 2
	adds r0, 0xA0
	adds r0, r1
	str r4, [r0]
	b _0807F77E
	.align 2, 0
_0807F75C: .4byte gUnknown_08396FC4
_0807F760: .4byte 0x000006fb
_0807F764: .4byte gUnknown_0839ABA8
_0807F768: .4byte gSpriteTemplate_839AB90
_0807F76C: .4byte gSprites
_0807F770:
	ldr r2, _0807F79C
	ldr r1, [r2]
	lsls r0, r5, 2
	adds r1, 0xA0
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807F77E:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x13
	bls _0807F70C
	ldr r0, [r2]
	ldr r1, _0807F7A0
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807F792:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F79C: .4byte gUnknown_08396FC4
_0807F7A0: .4byte 0x000006fb
	thumb_func_end sub_807F6E8

	thumb_func_start sub_807F7A4
sub_807F7A4: @ 807F7A4
	push {r4,r5,lr}
	ldr r0, _0807F7EC
	ldr r1, [r0]
	ldr r2, _0807F7F0
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807F7E4
	movs r4, 0
	adds r5, r1, 0
	adds r5, 0xA0
_0807F7BA:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807F7C8
	bl DestroySprite
_0807F7C8:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0807F7BA
	ldr r0, _0807F7F4
	bl FreeSpriteTilesByTag
	ldr r0, _0807F7EC
	ldr r0, [r0]
	ldr r1, _0807F7F0
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807F7E4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F7EC: .4byte gUnknown_08396FC4
_0807F7F0: .4byte 0x000006fb
_0807F7F4: .4byte 0x00001201
	thumb_func_end sub_807F7A4

	thumb_func_start sub_807F7F8
sub_807F7F8: @ 807F7F8
	push {lr}
	ldr r0, _0807F844
	ldr r1, [r0]
	ldr r0, _0807F848
	adds r2, r1, r0
	movs r3, 0
	movs r0, 0
	strh r0, [r2]
	ldr r2, _0807F84C
	adds r0, r1, r2
	strb r3, [r0]
	subs r2, 0x11
	adds r0, r1, r2
	strb r3, [r0]
	ldr r3, _0807F850
	adds r0, r1, r3
	movs r2, 0x14
	strb r2, [r0]
	adds r3, 0x3C
	adds r0, r1, r3
	strh r2, [r0]
	movs r0, 0xE0
	lsls r0, 3
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _0807F840
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
	ldr r1, _0807F854
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
_0807F840:
	pop {r0}
	bx r0
	.align 2, 0
_0807F844: .4byte gUnknown_08396FC4
_0807F848: .4byte 0x000006cc
_0807F84C: .4byte 0x000006d2
_0807F850: .4byte 0x000006c2
_0807F854: .4byte REG_BLDALPHA
	thumb_func_end sub_807F7F8

	thumb_func_start sub_807F858
sub_807F858: @ 807F858
	push {r4,lr}
	bl sub_807F7F8
	ldr r0, _0807F880
	ldr r1, [r0]
	ldr r2, _0807F884
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F878
	adds r4, r1, r2
_0807F86E:
	bl sub_807F888
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807F86E
_0807F878:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F880: .4byte gUnknown_08396FC4
_0807F884: .4byte 0x000006d2
	thumb_func_end sub_807F858

	thumb_func_start sub_807F888
sub_807F888: @ 807F888
	push {r4,r5,lr}
	ldr r2, _0807F8CC
	ldr r1, [r2]
	ldr r0, _0807F8D0
	ldrh r0, [r0]
	ldr r3, _0807F8D4
	ands r3, r0
	ldr r0, _0807F8D8
	adds r1, r0
	strh r3, [r1]
	cmp r3, 0xEF
	bls _0807F8B4
	adds r4, r1, 0
	adds r1, r3, 0
_0807F8A4:
	adds r3, r1, 0
	subs r3, 0xF0
	adds r1, r3, 0
	lsls r0, r3, 16
	lsrs r0, 16
	cmp r0, 0xEF
	bhi _0807F8A4
	strh r3, [r4]
_0807F8B4:
	ldr r5, [r2]
	ldr r1, _0807F8DC
	adds r4, r5, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807F8EC
	cmp r0, 0x1
	bgt _0807F8E0
	cmp r0, 0
	beq _0807F8E6
	b _0807F928
	.align 2, 0
_0807F8CC: .4byte gUnknown_08396FC4
_0807F8D0: .4byte gSpriteCoordOffsetX
_0807F8D4: .4byte 0x000001ff
_0807F8D8: .4byte 0x000006fc
_0807F8DC: .4byte 0x000006cc
_0807F8E0:
	cmp r0, 0x2
	beq _0807F908
	b _0807F928
_0807F8E6:
	bl sub_807F99C
	b _0807F91A
_0807F8EC:
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807F8FC
	bl sub_807F9AC
_0807F8FC:
	movs r0, 0x10
	movs r1, 0
	movs r2, 0x1
	bl sub_807DBA4
	b _0807F91A
_0807F908:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807F92C
	ldr r0, _0807F924
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807F91A:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807F92C
	.align 2, 0
_0807F924: .4byte 0x000006d2
_0807F928:
	bl sub_807DBE8
_0807F92C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807F888

	thumb_func_start sub_807F934
sub_807F934: @ 807F934
	push {r4,lr}
	ldr r0, _0807F950
	ldr r0, [r0]
	ldr r1, _0807F954
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807F96A
	cmp r0, 0x1
	bgt _0807F958
	cmp r0, 0
	beq _0807F95E
	b _0807F98C
	.align 2, 0
_0807F950: .4byte gUnknown_08396FC4
_0807F954: .4byte 0x000006ce
_0807F958:
	cmp r0, 0x2
	beq _0807F980
	b _0807F98C
_0807F95E:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1
	bl sub_807DBA4
	b _0807F978
_0807F96A:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807F994
	bl sub_807FA54
_0807F978:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807F994
_0807F980:
	ldr r1, _0807F990
	movs r0, 0
	strh r0, [r1]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807F98C:
	movs r0, 0
	b _0807F996
	.align 2, 0
_0807F990: .4byte REG_BLDALPHA
_0807F994:
	movs r0, 0x1
_0807F996:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807F934

	thumb_func_start sub_807F99C
sub_807F99C: @ 807F99C
	push {lr}
	ldr r0, _0807F9A8
	bl LoadSpriteSheet
	pop {r0}
	bx r0
	.align 2, 0
_0807F9A8: .4byte gUnknown_0839ABB0
	thumb_func_end sub_807F99C

	thumb_func_start sub_807F9AC
sub_807F9AC: @ 807F9AC
	push {r4,r5,lr}
	ldr r0, _0807FA18
	ldr r0, [r0]
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FA48
	movs r5, 0
_0807F9C0:
	ldr r0, _0807FA1C
	movs r1, 0
	movs r2, 0
	movs r3, 0x4E
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0807FA24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807FA20
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r0, r5, 0
	movs r1, 0x5
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	adds r0, r5, 0
	movs r1, 0x5
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x34]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 6
	adds r0, 0x20
	strh r0, [r4, 0x2E]
	ldr r2, _0807FA18
	ldr r0, [r2]
	lsls r1, r5, 2
	adds r0, 0xF0
	adds r0, r1
	str r4, [r0]
	b _0807FA32
	.align 2, 0
_0807FA18: .4byte gUnknown_08396FC4
_0807FA1C: .4byte gSpriteTemplate_839ABD0
_0807FA20: .4byte gSprites
_0807FA24:
	ldr r2, _0807FA50
	ldr r1, [r2]
	lsls r0, r5, 2
	adds r1, 0xF0
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807FA32:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _0807F9C0
	ldr r0, [r2]
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807FA48:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FA50: .4byte gUnknown_08396FC4
	thumb_func_end sub_807F9AC

	thumb_func_start sub_807FA54
sub_807FA54: @ 807FA54
	push {r4,r5,lr}
	ldr r0, _0807FAA0
	ldr r1, [r0]
	movs r2, 0xE0
	lsls r2, 3
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807FA98
	movs r4, 0
	adds r5, r1, 0
	adds r5, 0xF0
_0807FA6C:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807FA7A
	bl DestroySprite
_0807FA7A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0807FA6C
	ldr r0, _0807FAA4
	bl FreeSpriteTilesByTag
	ldr r0, _0807FAA0
	ldr r0, [r0]
	movs r1, 0xE0
	lsls r1, 3
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807FA98:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FAA0: .4byte gUnknown_08396FC4
_0807FAA4: .4byte 0x00001202
	thumb_func_end sub_807FA54

	thumb_func_start sub_807FAA8
sub_807FAA8: @ 807FAA8
	push {r4,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _0807FAC4
	movs r0, 0
	strh r0, [r3, 0x30]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
_0807FAC4:
	ldr r1, _0807FB10
	ldrh r0, [r3, 0x2E]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r3, 0x22]
	ldr r0, _0807FB14
	ldr r0, [r0]
	ldr r1, _0807FB18
	adds r2, r0, r1
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x32
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _0807FB1C
	cmp r1, r0
	ble _0807FB08
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x32
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _0807FB20
	ands r1, r0
	strh r1, [r3, 0x20]
_0807FB08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FB10: .4byte gSpriteCoordOffsetY
_0807FB14: .4byte gUnknown_08396FC4
_0807FB18: .4byte 0x000006fc
_0807FB1C: .4byte 0x010f0000
_0807FB20: .4byte 0x000001ff
	thumb_func_end sub_807FAA8

	thumb_func_start sub_807FB24
sub_807FB24: @ 807FB24
	push {r4,lr}
	ldr r0, _0807FB94
	ldr r3, [r0]
	ldr r1, _0807FB98
	adds r0, r3, r1
	movs r1, 0
	movs r2, 0
	strh r2, [r0]
	ldr r4, _0807FB9C
	adds r0, r3, r4
	strb r1, [r0]
	subs r4, 0x11
	adds r0, r3, r4
	strb r1, [r0]
	ldr r0, _0807FBA0
	adds r1, r3, r0
	movs r0, 0x14
	strb r0, [r1]
	movs r1, 0xDE
	lsls r1, 3
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, 0x31
	adds r1, r3, r4
	movs r0, 0x1
	strh r0, [r1]
	ldr r1, _0807FBA4
	adds r0, r3, r1
	ldrb r2, [r0]
	cmp r2, 0
	bne _0807FB8E
	adds r4, 0x2A
	adds r0, r3, r4
	strh r2, [r0]
	subs r1, 0x6
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, 0x4
	adds r0, r3, r4
	strh r2, [r0]
	adds r1, 0x4
	adds r0, r3, r1
	strh r2, [r0]
	subs r4, 0x8
	adds r0, r3, r4
	strh r2, [r0]
	subs r1, 0x8
	adds r0, r3, r1
	strh r2, [r0]
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
_0807FB8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FB94: .4byte gUnknown_08396FC4
_0807FB98: .4byte 0x000006cc
_0807FB9C: .4byte 0x000006d2
_0807FBA0: .4byte 0x000006c2
_0807FBA4: .4byte 0x00000724
	thumb_func_end sub_807FB24

	thumb_func_start sub_807FBA8
sub_807FBA8: @ 807FBA8
	push {r4,lr}
	bl sub_807FB24
	ldr r0, _0807FBD0
	ldr r1, [r0]
	ldr r2, _0807FBD4
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FBC8
	adds r4, r1, r2
_0807FBBE:
	bl sub_807FBD8
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807FBBE
_0807FBC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FBD0: .4byte gUnknown_08396FC4
_0807FBD4: .4byte 0x000006d2
	thumb_func_end sub_807FBA8

	thumb_func_start sub_807FBD8
sub_807FBD8: @ 807FBD8
	push {r4,r5,lr}
	bl sub_807FC9C
	ldr r0, _0807FBF8
	ldr r5, [r0]
	ldr r0, _0807FBFC
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807FC0C
	cmp r0, 0x1
	bgt _0807FC00
	cmp r0, 0
	beq _0807FC06
	b _0807FC30
	.align 2, 0
_0807FBF8: .4byte gUnknown_08396FC4
_0807FBFC: .4byte 0x000006cc
_0807FC00:
	cmp r0, 0x2
	beq _0807FC18
	b _0807FC30
_0807FC06:
	bl sub_807FD30
	b _0807FC2A
_0807FC0C:
	movs r0, 0xC
	movs r1, 0x8
	movs r2, 0x8
	bl sub_807DBA4
	b _0807FC2A
_0807FC18:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807FC30
	ldr r0, _0807FC38
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807FC2A:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807FC30:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FC38: .4byte 0x000006d2
	thumb_func_end sub_807FBD8

	thumb_func_start sub_807FC3C
sub_807FC3C: @ 807FC3C
	push {r4,lr}
	bl sub_807FC9C
	ldr r0, _0807FC5C
	ldr r0, [r0]
	ldr r1, _0807FC60
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807FC76
	cmp r0, 0x1
	bgt _0807FC64
	cmp r0, 0
	beq _0807FC6A
	b _0807FC8E
	.align 2, 0
_0807FC5C: .4byte gUnknown_08396FC4
_0807FC60: .4byte 0x000006ce
_0807FC64:
	cmp r0, 0x2
	beq _0807FC82
	b _0807FC8E
_0807FC6A:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1
	bl sub_807DBA4
	b _0807FC86
_0807FC76:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807FC92
	b _0807FC86
_0807FC82:
	bl sub_807FDE8
_0807FC86:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0807FC92
_0807FC8E:
	movs r0, 0
	b _0807FC94
_0807FC92:
	movs r0, 0x1
_0807FC94:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807FC3C

	thumb_func_start sub_807FC9C
sub_807FC9C: @ 807FC9C
	push {r4,r5,lr}
	ldr r0, _0807FD14
	ldr r3, [r0]
	ldr r0, _0807FD18
	adds r2, r3, r0
	ldrh r0, [r2]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r2]
	ldr r1, _0807FD1C
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bls _0807FCC8
	movs r0, 0xE4
	lsls r0, 3
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	strh r5, [r2]
_0807FCC8:
	ldr r1, _0807FD20
	adds r2, r3, r1
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	ands r0, r4
	cmp r0, 0x4
	bls _0807FCE4
	ldr r0, _0807FD24
	adds r1, r3, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	strh r5, [r2]
_0807FCE4:
	ldr r0, _0807FD28
	movs r2, 0xE4
	lsls r2, 3
	adds r1, r3, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	subs r2, 0x8
	adds r1, r3, r2
	strh r0, [r1]
	ldr r1, _0807FD2C
	adds r2, 0xA
	adds r0, r3, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r1
	subs r2, 0x8
	adds r1, r3, r2
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FD14: .4byte gUnknown_08396FC4
_0807FD18: .4byte 0x0000071c
_0807FD1C: .4byte 0x0000ffff
_0807FD20: .4byte 0x0000071e
_0807FD24: .4byte 0x00000722
_0807FD28: .4byte gSpriteCoordOffsetX
_0807FD2C: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_807FC9C

	thumb_func_start sub_807FD30
sub_807FD30: @ 807FD30
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r0, _0807FD9C
	ldr r0, [r0]
	ldr r1, _0807FDA0
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FDD6
	ldr r0, _0807FDA4
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	movs r6, 0
_0807FD54:
	adds r0, r6, 0
	movs r1, 0x5
	bl __udivsi3
	adds r5, r0, 0
	lsls r2, r5, 22
	asrs r2, 16
	ldr r0, _0807FDA8
	movs r1, 0
	movs r3, 0xFF
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0807FDB0
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0807FDAC
	adds r4, r0
	adds r0, r6, 0
	movs r1, 0x5
	bl __umodsi3
	strh r0, [r4, 0x2E]
	strh r5, [r4, 0x30]
	ldr r2, _0807FD9C
	ldr r0, [r2]
	lsls r1, r6, 2
	movs r3, 0xA0
	lsls r3, 1
	adds r0, r3
	adds r0, r1
	str r4, [r0]
	b _0807FDC2
	.align 2, 0
_0807FD9C: .4byte gUnknown_08396FC4
_0807FDA0: .4byte 0x00000724
_0807FDA4: .4byte gUnknown_0839ABE8
_0807FDA8: .4byte gSpriteTemplate_839AC04
_0807FDAC: .4byte gSprites
_0807FDB0:
	ldr r2, _0807FDE0
	ldr r1, [r2]
	lsls r0, r6, 2
	movs r3, 0xA0
	lsls r3, 1
	adds r1, r3
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_0807FDC2:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x13
	bls _0807FD54
	ldr r0, [r2]
	ldr r1, _0807FDE4
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_0807FDD6:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807FDE0: .4byte gUnknown_08396FC4
_0807FDE4: .4byte 0x00000724
	thumb_func_end sub_807FD30

	thumb_func_start sub_807FDE8
sub_807FDE8: @ 807FDE8
	push {r4,r5,lr}
	ldr r0, _0807FE30
	ldr r1, [r0]
	ldr r2, _0807FE34
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0807FE2A
	movs r4, 0
	movs r0, 0xA0
	lsls r0, 1
	adds r5, r1, r0
_0807FE00:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0807FE0E
	bl DestroySprite
_0807FE0E:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0807FE00
	ldr r0, _0807FE38
	bl FreeSpriteTilesByTag
	ldr r0, _0807FE30
	ldr r0, [r0]
	ldr r1, _0807FE34
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_0807FE2A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FE30: .4byte gUnknown_08396FC4
_0807FE34: .4byte 0x00000724
_0807FE38: .4byte 0x00001203
	thumb_func_end sub_807FDE8

	thumb_func_start sub_807FE3C
sub_807FE3C: @ 807FE3C
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _0807FE8C
	ldr r1, [r0]
	ldr r2, _0807FE90
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r3, 0x26]
	movs r4, 0xE3
	lsls r4, 3
	adds r2, r1, r4
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _0807FE94
	cmp r1, r0
	ble _0807FE84
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x2E
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _0807FE98
	ands r1, r0
	strh r1, [r3, 0x20]
_0807FE84:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FE8C: .4byte gUnknown_08396FC4
_0807FE90: .4byte 0x0000071a
_0807FE94: .4byte 0x010f0000
_0807FE98: .4byte 0x000001ff
	thumb_func_end sub_807FE3C

	thumb_func_start sub_807FE9C
sub_807FE9C: @ 807FE9C
	push {r4,lr}
	ldr r0, _0807FF00
	ldr r3, [r0]
	ldr r0, _0807FF04
	adds r1, r3, r0
	movs r2, 0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0807FF08
	adds r0, r3, r1
	strb r2, [r0]
	ldr r4, _0807FF0C
	adds r0, r3, r4
	strb r2, [r0]
	ldr r0, _0807FF10
	adds r1, r3, r0
	movs r0, 0x14
	strb r0, [r1]
	ldr r1, _0807FF14
	adds r0, r3, r1
	ldrb r2, [r0]
	cmp r2, 0
	bne _0807FEF8
	adds r4, 0x43
	adds r1, r3, r4
	adds r4, 0x4
	adds r0, r3, r4
	str r2, [r0]
	str r2, [r1]
	ldr r0, _0807FF18
	adds r1, r3, r0
	movs r0, 0x8
	strh r0, [r1]
	adds r4, 0xC
	adds r0, r3, r4
	strh r2, [r0]
	ldrh r2, [r1]
	cmp r2, 0x5F
	bls _0807FEF0
	movs r0, 0x80
	subs r0, r2
	strh r0, [r1]
_0807FEF0:
	movs r0, 0
	movs r1, 0x10
	bl sub_807DB64
_0807FEF8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FF00: .4byte gUnknown_08396FC4
_0807FF04: .4byte 0x000006cc
_0807FF08: .4byte 0x000006d2
_0807FF0C: .4byte 0x000006c1
_0807FF10: .4byte 0x000006c2
_0807FF14: .4byte 0x00000716
_0807FF18: .4byte 0x00000712
	thumb_func_end sub_807FE9C

	thumb_func_start sub_807FF1C
sub_807FF1C: @ 807FF1C
	push {r4,lr}
	bl sub_807FE9C
	ldr r0, _0807FF44
	ldr r1, [r0]
	ldr r2, _0807FF48
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0807FF3C
	adds r4, r1, r2
_0807FF32:
	bl sub_807FF4C
	ldrb r0, [r4]
	cmp r0, 0
	beq _0807FF32
_0807FF3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807FF44: .4byte gUnknown_08396FC4
_0807FF48: .4byte 0x000006d2
	thumb_func_end sub_807FF1C

	thumb_func_start sub_807FF4C
sub_807FF4C: @ 807FF4C
	push {r4,r5,lr}
	bl sub_8080064
	bl sub_808002C
	ldr r0, _0807FF7C
	ldr r5, [r0]
	ldr r0, _0807FF80
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, 0x5F
	bls _0807FF68
	movs r0, 0x20
	strh r0, [r1]
_0807FF68:
	ldr r0, _0807FF84
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _0807FF98
	cmp r0, 0x1
	bgt _0807FF88
	cmp r0, 0
	beq _0807FF8E
	b _0807FFBC
	.align 2, 0
_0807FF7C: .4byte gUnknown_08396FC4
_0807FF80: .4byte 0x00000712
_0807FF84: .4byte 0x000006cc
_0807FF88:
	cmp r0, 0x2
	beq _0807FFA4
	b _0807FFBC
_0807FF8E:
	bl sub_8080178
	bl sub_8080238
	b _0807FFB6
_0807FF98:
	movs r0, 0x10
	movs r1, 0
	movs r2, 0
	bl sub_807DBA4
	b _0807FFB6
_0807FFA4:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _0807FFBC
	ldr r0, _0807FFC4
	adds r1, r5, r0
	movs r0, 0x1
	strb r0, [r1]
_0807FFB6:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0807FFBC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FFC4: .4byte 0x000006d2
	thumb_func_end sub_807FF4C

	thumb_func_start sub_807FFC8
sub_807FFC8: @ 807FFC8
	push {r4,lr}
	bl sub_8080064
	bl sub_808002C
	ldr r0, _0807FFEC
	ldr r0, [r0]
	ldr r1, _0807FFF0
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, 0x1
	beq _08080006
	cmp r0, 0x1
	bgt _0807FFF4
	cmp r0, 0
	beq _0807FFFA
	b _0808001E
	.align 2, 0
_0807FFEC: .4byte gUnknown_08396FC4
_0807FFF0: .4byte 0x000006ce
_0807FFF4:
	cmp r0, 0x2
	beq _08080012
	b _0808001E
_0807FFFA:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0
	bl sub_807DBA4
	b _08080016
_08080006:
	bl sub_807DBE8
	lsls r0, 24
	cmp r0, 0
	beq _08080022
	b _08080016
_08080012:
	bl sub_80800E4
_08080016:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _08080022
_0808001E:
	movs r0, 0
	b _08080024
_08080022:
	movs r0, 0x1
_08080024:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_807FFC8

	thumb_func_start sub_808002C
sub_808002C: @ 808002C
	push {lr}
	ldr r0, _08080058
	ldr r2, [r0]
	ldr r0, _0808005C
	adds r3, r2, r0
	ldrh r0, [r3]
	adds r1, r0, 0x1
	strh r1, [r3]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bls _08080052
	ldr r1, _08080060
	adds r0, r2, r1
	ldrh r1, [r0]
	adds r1, 0x1
	movs r2, 0
	strh r1, [r0]
	strh r2, [r3]
_08080052:
	pop {r0}
	bx r0
	.align 2, 0
_08080058: .4byte gUnknown_08396FC4
_0808005C: .4byte 0x00000714
_08080060: .4byte 0x00000712
	thumb_func_end sub_808002C

	thumb_func_start sub_8080064
sub_8080064: @ 8080064
	push {r4-r6,lr}
	ldr r0, _080800C8
	ldr r2, [r0]
	ldr r0, _080800CC
	adds r4, r2, r0
	ldr r6, _080800D0
	ldr r1, _080800D4
	adds r5, r2, r1
	ldrh r0, [r5]
	lsls r0, 1
	adds r0, r6
	movs r3, 0
	ldrsh r1, [r0, r3]
	lsls r1, 2
	ldr r0, [r4]
	subs r0, r1
	str r0, [r4]
	movs r0, 0xE1
	lsls r0, 3
	adds r3, r2, r0
	ldrh r0, [r5]
	lsls r0, 1
	adds r0, r6
	movs r5, 0
	ldrsh r1, [r0, r5]
	ldr r0, [r3]
	subs r0, r1
	str r0, [r3]
	ldr r1, _080800D8
	ldr r0, [r4]
	lsrs r0, 8
	ldrh r1, [r1]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	ldr r4, _080800DC
	adds r1, r2, r4
	strh r0, [r1]
	ldr r1, _080800E0
	ldr r0, [r3]
	lsrs r0, 8
	ldrh r1, [r1]
	adds r0, r1
	movs r5, 0xE2
	lsls r5, 3
	adds r2, r5
	strh r0, [r2]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080800C8: .4byte gUnknown_08396FC4
_080800CC: .4byte 0x00000704
_080800D0: .4byte gSineTable
_080800D4: .4byte 0x00000712
_080800D8: .4byte gSpriteCoordOffsetX
_080800DC: .4byte 0x0000070e
_080800E0: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_8080064

	thumb_func_start sub_80800E4
sub_80800E4: @ 80800E4
	push {r4,r5,lr}
	ldr r0, _08080168
	ldr r1, [r0]
	ldr r2, _0808016C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08080126
	movs r4, 0
	movs r0, 0xC8
	lsls r0, 1
	adds r5, r1, r0
_080800FC:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0808010A
	bl DestroySprite
_0808010A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _080800FC
	ldr r0, _08080168
	ldr r0, [r0]
	ldr r1, _0808016C
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08080170
	bl FreeSpriteTilesByTag
_08080126:
	ldr r0, _08080168
	ldr r1, [r0]
	ldr r2, _08080174
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08080160
	movs r4, 0
	movs r0, 0xF0
	lsls r0, 1
	adds r5, r1, r0
_0808013C:
	lsls r0, r4, 2
	adds r0, r5, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _0808014A
	bl DestroySprite
_0808014A:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x4
	bls _0808013C
	ldr r0, _08080168
	ldr r0, [r0]
	ldr r1, _08080174
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
_08080160:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080168: .4byte gUnknown_08396FC4
_0808016C: .4byte 0x00000716
_08080170: .4byte 0x00001204
_08080174: .4byte 0x00000717
	thumb_func_end sub_80800E4

	thumb_func_start sub_8080178
sub_8080178: @ 8080178
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r0, _080801E8
	ldr r0, [r0]
	ldr r1, _080801EC
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08080226
	ldr r0, _080801F0
	bl LoadSpriteSheet
	ldr r0, _080801F4
	bl sub_807D8C0
	movs r7, 0
_08080198:
	adds r0, r7, 0
	movs r1, 0x5
	bl __udivsi3
	adds r6, r0, 0
	lsls r2, r6, 22
	asrs r2, 16
	ldr r0, _080801F8
	movs r1, 0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08080200
	ldr r2, _080801E8
	ldr r5, [r2]
	lsls r0, r7, 2
	movs r3, 0xC8
	lsls r3, 1
	adds r5, r3
	adds r5, r0
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	ldr r0, _080801FC
	adds r4, r0
	str r4, [r5]
	adds r0, r7, 0
	movs r1, 0x5
	str r2, [sp]
	bl __umodsi3
	strh r0, [r4, 0x2E]
	ldr r0, [r5]
	strh r6, [r0, 0x30]
	ldr r2, [sp]
	b _08080212
	.align 2, 0
_080801E8: .4byte gUnknown_08396FC4
_080801EC: .4byte 0x00000716
_080801F0: .4byte gUnknown_0839AC54
_080801F4: .4byte gUnknown_08397128
_080801F8: .4byte gSpriteTemplate_839AC3C
_080801FC: .4byte gSprites
_08080200:
	ldr r2, _08080230
	ldr r1, [r2]
	lsls r0, r7, 2
	movs r3, 0xC8
	lsls r3, 1
	adds r1, r3
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_08080212:
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x13
	bls _08080198
	ldr r0, [r2]
	ldr r1, _08080234
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_08080226:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080230: .4byte gUnknown_08396FC4
_08080234: .4byte 0x00000716
	thumb_func_end sub_8080178

	thumb_func_start sub_8080238
sub_8080238: @ 8080238
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, _080802E0
	ldr r0, [r4]
	ldr r1, _080802E4
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08080324
	movs r7, 0
	mov r9, r4
	movs r2, 0
	mov r10, r2
_08080258:
	lsls r0, r7, 1
	mov r8, r0
	adds r6, r0, r7
	lsls r5, r6, 4
	adds r1, r5, 0
	adds r1, 0x18
	lsls r1, 16
	asrs r1, 16
	ldr r0, _080802E8
	movs r2, 0xD0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080802FC
	mov r2, r9
	ldr r4, [r2]
	lsls r0, r7, 2
	movs r2, 0xF0
	lsls r2, 1
	adds r4, r2
	adds r4, r0
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	ldr r0, _080802EC
	adds r2, r0
	str r2, [r4]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x3]
	ldr r1, [r4]
	adds r0, r6, r5
	strh r0, [r1, 0x30]
	ldr r1, [r4]
	movs r0, 0x8
	strh r0, [r1, 0x2E]
	ldr r0, [r4]
	mov r1, r10
	strh r1, [r0, 0x32]
	ldr r1, [r4]
	ldr r0, _080802F0
	strh r0, [r1, 0x36]
	ldr r1, [r4]
	ldr r0, _080802F4
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r1, 0x34]
	ldr r0, [r4]
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, [r4]
	movs r1, 0
	movs r2, 0x2
	movs r3, 0
	bl CalcCenterToCornerVec
	ldr r1, [r4]
	ldr r0, _080802F8
	str r0, [r1, 0x1C]
	b _0808030E
	.align 2, 0
_080802E0: .4byte gUnknown_08396FC4
_080802E4: .4byte 0x00000717
_080802E8: .4byte gSpriteTemplate_839AC3C
_080802EC: .4byte gSprites
_080802F0: .4byte 0x00006730
_080802F4: .4byte gUnknown_0839AC5C
_080802F8: .4byte sub_8080398
_080802FC:
	mov r2, r9
	ldr r0, [r2]
	lsls r1, r7, 2
	movs r2, 0xF0
	lsls r2, 1
	adds r0, r2
	adds r0, r1
	mov r1, r10
	str r1, [r0]
_0808030E:
	mov r2, r9
	ldr r0, [r2]
	ldr r1, _08080334
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x4
	bls _08080258
_08080324:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080334: .4byte 0x00000717
	thumb_func_end sub_8080238

	thumb_func_start sub_8080338
sub_8080338: @ 8080338
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _08080388
	ldr r1, [r0]
	movs r2, 0xE2
	lsls r2, 3
	adds r0, r1, r2
	ldrh r0, [r0]
	strh r0, [r3, 0x26]
	ldr r4, _0808038C
	adds r2, r1, r4
	ldrh r1, [r2]
	adds r1, 0x20
	movs r4, 0x2E
	ldrsh r0, [r3, r4]
	lsls r0, 6
	adds r1, r0
	strh r1, [r3, 0x20]
	lsls r1, 16
	ldr r0, _08080390
	cmp r1, r0
	ble _08080380
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r2]
	adds r1, r2
	movs r4, 0x2E
	ldrsh r2, [r3, r4]
	movs r0, 0x4
	subs r0, r2
	lsls r0, 6
	subs r1, r0
	ldr r0, _08080394
	ands r1, r0
	strh r1, [r3, 0x20]
_08080380:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080388: .4byte gUnknown_08396FC4
_0808038C: .4byte 0x0000070e
_08080390: .4byte 0x010f0000
_08080394: .4byte 0x000001ff
	thumb_func_end sub_8080338

	thumb_func_start sub_8080398
sub_8080398: @ 8080398
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x34]
	subs r0, 0x1
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080803B2
	ldr r0, _080803B8
	str r0, [r2, 0x1C]
_080803B2:
	pop {r0}
	bx r0
	.align 2, 0
_080803B8: .4byte sub_80803BC
	thumb_func_end sub_8080398

	thumb_func_start sub_80803BC
sub_80803BC: @ 80803BC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x22]
	subs r0, 0x1
	strh r0, [r5, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x30
	negs r1, r1
	cmp r0, r1
	bge _080803DA
	movs r0, 0xD0
	strh r0, [r5, 0x22]
	movs r0, 0x4
	strh r0, [r5, 0x2E]
_080803DA:
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	ldr r3, _0808042C
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	lsls r0, r1, 1
	adds r0, r3
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r2, r4, 0
	muls r2, r0
	adds r1, 0x40
	lsls r1, 1
	adds r1, r3
	movs r3, 0
	ldrsh r0, [r1, r3]
	muls r0, r4
	lsrs r2, 8
	strh r2, [r5, 0x24]
	lsrs r0, 8
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x30]
	adds r0, 0xA
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _08080426
	movs r0, 0
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_08080426:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808042C: .4byte gSineTable
	thumb_func_end sub_80803BC

	thumb_func_start sub_8080430
sub_8080430: @ 8080430
	ldr r0, _08080450
	ldr r1, [r0]
	ldr r0, _08080454
	adds r2, r1, r0
	movs r0, 0
	strh r0, [r2]
	ldr r0, _08080458
	adds r2, r1, r0
	movs r0, 0x3
	strb r0, [r2]
	ldr r0, _0808045C
	adds r1, r0
	movs r0, 0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_08080450: .4byte gUnknown_08396FC4
_08080454: .4byte 0x000006cc
_08080458: .4byte 0x000006c1
_0808045C: .4byte 0x000006c2
	thumb_func_end sub_8080430

	thumb_func_start sub_8080460
sub_8080460: @ 8080460
	push {lr}
	bl sub_8080430
	pop {r0}
	bx r0
	thumb_func_end sub_8080460

	thumb_func_start nullsub_56
nullsub_56: @ 808046C
	bx lr
	thumb_func_end nullsub_56

	thumb_func_start sub_8080470
sub_8080470: @ 8080470
	movs r0, 0
	bx lr
	thumb_func_end sub_8080470

	thumb_func_start sub_8080474
sub_8080474: @ 8080474
	push {r4,r5,lr}
	bl sub_807F49C
	ldr r0, _080804B4
	ldr r4, [r0]
	ldr r1, _080804B8
	adds r0, r4, r1
	ldrb r5, [r0]
	cmp r5, 0
	bne _080804AC
	ldr r0, _080804BC
	bl LoadSpriteSheet
	movs r2, 0xE5
	lsls r2, 3
	adds r0, r4, r2
	strh r5, [r0]
	ldr r0, _080804C0
	ldrb r1, [r0]
	subs r2, 0x2
	adds r0, r4, r2
	strh r1, [r0]
	ldr r1, _080804C4
	adds r0, r4, r1
	strh r5, [r0]
	adds r2, 0x6
	adds r0, r4, r2
	strh r5, [r0]
_080804AC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080804B4: .4byte gUnknown_08396FC4
_080804B8: .4byte 0x0000072e
_080804BC: .4byte gUnknown_0839AC70
_080804C0: .4byte gUnknown_0839AC68
_080804C4: .4byte 0x0000072a
	thumb_func_end sub_8080474

	thumb_func_start sub_80804C8
sub_80804C8: @ 80804C8
	push {r4,lr}
	bl sub_8080474
	ldr r0, _080804F0
	ldr r1, [r0]
	ldr r2, _080804F4
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080804E8
	adds r4, r1, r2
_080804DE:
	bl sub_80804F8
	ldrb r0, [r4]
	cmp r0, 0
	beq _080804DE
_080804E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080804F0: .4byte gUnknown_08396FC4
_080804F4: .4byte 0x000006d2
	thumb_func_end sub_80804C8

	thumb_func_start sub_80804F8
sub_80804F8: @ 80804F8
	push {r4-r7,lr}
	bl sub_807F52C
	ldr r0, _08080558
	ldr r5, [r0]
	ldr r0, _0808055C
	adds r4, r5, r0
	ldrh r0, [r4]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r4]
	ldr r1, _08080560
	adds r7, r1, 0
	ldr r2, _08080564
	movs r1, 0xE5
	lsls r1, 3
	adds r3, r5, r1
	ldrh r1, [r3]
	adds r1, r2
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1]
	cmp r0, r1
	bls _08080550
	strh r6, [r4]
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	ands r0, r7
	cmp r0, 0x7
	bls _08080538
	strh r6, [r3]
_08080538:
	ldr r0, _08080568
	adds r4, r5, r0
	ldrh r0, [r4]
	bl sub_8080588
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ands r0, r7
	cmp r0, 0xC
	bls _08080550
	strh r6, [r4]
_08080550:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080558: .4byte gUnknown_08396FC4
_0808055C: .4byte 0x00000726
_08080560: .4byte 0x0000ffff
_08080564: .4byte gUnknown_0839AC68
_08080568: .4byte 0x0000072a
	thumb_func_end sub_80804F8

	thumb_func_start sub_808056C
sub_808056C: @ 808056C
	push {lr}
	bl sub_807F5EC
	lsls r0, 24
	cmp r0, 0
	beq _0808057C
	movs r0, 0x1
	b _08080582
_0808057C:
	bl sub_8080610
	movs r0, 0
_08080582:
	pop {r1}
	bx r1
	thumb_func_end sub_808056C

	thumb_func_start sub_8080588
sub_8080588: @ 8080588
	push {r4,lr}
	lsls r0, 16
	ldr r1, _080805F8
	lsrs r0, 14
	adds r3, r0, r1
	adds r1, 0x2
	adds r0, r1
	ldr r1, _080805FC
	ldrh r2, [r0]
	ldrh r0, [r1]
	subs r2, r0
	ldr r0, _08080600
	movs r4, 0
	ldrsh r1, [r3, r4]
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080805F0
	ldr r0, _08080604
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1, 0x5]
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r3]
	movs r0, 0
	strh r0, [r1, 0x2E]
	strh r0, [r1, 0x30]
	strh r0, [r1, 0x32]
	ldr r0, _08080608
	ldr r1, [r0]
	ldr r0, _0808060C
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080805F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080805F8: .4byte gUnknown_0839AC78
_080805FC: .4byte gSpriteCoordOffsetY
_08080600: .4byte gSpriteTemplate_839ACBC
_08080604: .4byte gSprites
_08080608: .4byte gUnknown_08396FC4
_0808060C: .4byte 0x0000072c
	thumb_func_end sub_8080588

	thumb_func_start sub_8080610
sub_8080610: @ 8080610
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08080648
_08080616:
	lsls r0, r4, 4
	adds r0, r4
	lsls r2, r0, 2
	adds r0, r5, 0
	adds r0, 0x14
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _0808064C
	cmp r1, r0
	bne _08080630
	adds r0, r2, r5
	bl DestroySprite
_08080630:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3F
	bls _08080616
	ldr r0, _08080650
	bl FreeSpriteTilesByTag
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080648: .4byte gSprites
_0808064C: .4byte gSpriteTemplate_839ACBC
_08080650: .4byte 0x00001205
	thumb_func_end sub_8080610

	thumb_func_start unc_0807DAB4
unc_0807DAB4: @ 8080654
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	movs r2, 0
	adds r0, 0x2
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _08080694
	strh r2, [r1, 0x2E]
	movs r3, 0x30
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _08080686
	ldrh r0, [r1, 0x24]
	adds r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08080694
	movs r0, 0x1
	strh r0, [r1, 0x30]
	b _08080694
_08080686:
	ldrh r0, [r1, 0x24]
	subs r0, 0x1
	strh r0, [r1, 0x24]
	lsls r0, 16
	cmp r0, 0
	bgt _08080694
	strh r2, [r1, 0x30]
_08080694:
	ldrh r0, [r1, 0x22]
	subs r0, 0x3
	strh r0, [r1, 0x22]
	ldrh r0, [r1, 0x32]
	adds r0, 0x1
	strh r0, [r1, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x77
	ble _080806AE
	adds r0, r1, 0
	bl DestroySprite
_080806AE:
	pop {r0}
	bx r0
	thumb_func_end unc_0807DAB4

	thumb_func_start sub_80806B4
sub_80806B4: @ 80806B4
	push {r4,r5,lr}
	ldr r4, _080806D4
	adds r4, 0x2E
	ldrb r5, [r4]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8080764
	strb r0, [r4]
	ldrb r0, [r4]
	adds r1, r5, 0
	bl sub_8080854
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080806D4: .4byte gSaveBlock1
	thumb_func_end sub_80806B4

	thumb_func_start sav1_get_weather_probably
sav1_get_weather_probably: @ 80806D8
	ldr r0, _080806E0
	adds r0, 0x2E
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080806E0: .4byte gSaveBlock1
	thumb_func_end sav1_get_weather_probably

	thumb_func_start sub_80806E4
sub_80806E4: @ 80806E4
	push {r4,r5,lr}
	ldr r4, _08080704
	adds r4, 0x2E
	ldrb r5, [r4]
	ldr r0, _08080708
	ldrb r0, [r0, 0x16]
	bl sub_8080764
	strb r0, [r4]
	ldrb r0, [r4]
	adds r1, r5, 0
	bl sub_8080854
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080704: .4byte gSaveBlock1
_08080708: .4byte gMapHeader
	thumb_func_end sub_80806E4

	thumb_func_start sub_808070C
sub_808070C: @ 808070C
	push {lr}
	bl sub_80806B4
	bl sav1_get_weather_probably
	lsls r0, 24
	lsrs r0, 24
	bl sub_807C91C
	pop {r0}
	bx r0
	thumb_func_end sub_808070C

	thumb_func_start sub_8080724
sub_8080724: @ 8080724
	push {lr}
	bl sub_80806B4
	bl sav1_get_weather_probably
	lsls r0, 24
	lsrs r0, 24
	bl sub_807C988
	pop {r0}
	bx r0
	thumb_func_end sub_8080724

	thumb_func_start sub_808073C
sub_808073C: @ 808073C
	push {lr}
	bl sav1_get_weather_probably
	lsls r0, 24
	lsrs r0, 24
	bl sub_807C91C
	pop {r0}
	bx r0
	thumb_func_end sub_808073C

	thumb_func_start sub_8080750
sub_8080750: @ 8080750
	push {lr}
	bl sav1_get_weather_probably
	lsls r0, 24
	lsrs r0, 24
	bl sub_807C988
	pop {r0}
	bx r0
	thumb_func_end sub_8080750

	thumb_func_start sub_8080764
sub_8080764: @ 8080764
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x15
	bhi _0808082C
	lsls r0, 2
	ldr r1, _08080778
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08080778: .4byte _0808077C
	.align 2, 0
_0808077C:
	.4byte _0808082C
	.4byte _080807D4
	.4byte _080807D8
	.4byte _080807DC
	.4byte _080807E0
	.4byte _080807E4
	.4byte _080807E8
	.4byte _080807EC
	.4byte _080807F0
	.4byte _080807F4
	.4byte _080807F8
	.4byte _080807FC
	.4byte _08080800
	.4byte _08080804
	.4byte _08080808
	.4byte _0808082C
	.4byte _0808082C
	.4byte _0808082C
	.4byte _0808082C
	.4byte _0808082C
	.4byte _0808080C
	.4byte _08080814
_080807D4:
	movs r0, 0x1
	b _0808082E
_080807D8:
	movs r0, 0x2
	b _0808082E
_080807DC:
	movs r0, 0x3
	b _0808082E
_080807E0:
	movs r0, 0x4
	b _0808082E
_080807E4:
	movs r0, 0x5
	b _0808082E
_080807E8:
	movs r0, 0x6
	b _0808082E
_080807EC:
	movs r0, 0x7
	b _0808082E
_080807F0:
	movs r0, 0x8
	b _0808082E
_080807F4:
	movs r0, 0x9
	b _0808082E
_080807F8:
	movs r0, 0xA
	b _0808082E
_080807FC:
	movs r0, 0xB
	b _0808082E
_08080800:
	movs r0, 0xC
	b _0808082E
_08080804:
	movs r0, 0xD
	b _0808082E
_08080808:
	movs r0, 0xE
	b _0808082E
_0808080C:
	ldr r1, _08080810
	b _08080816
	.align 2, 0
_08080810: .4byte gUnknown_0839ACD4
_08080814:
	ldr r1, _08080824
_08080816:
	ldr r0, _08080828
	adds r0, 0x2F
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	b _0808082E
	.align 2, 0
_08080824: .4byte gUnknown_0839ACD8
_08080828: .4byte gSaveBlock1
_0808082C:
	movs r0, 0
_0808082E:
	pop {r1}
	bx r1
	thumb_func_end sub_8080764

	thumb_func_start sub_8080834
sub_8080834: @ 8080834
	lsls r0, 16
	ldr r2, _08080850
	adds r2, 0x2F
	lsrs r0, 16
	ldrb r1, [r2]
	adds r0, r1
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r0
	lsrs r1, 16
	strb r1, [r2]
	bx lr
	.align 2, 0
_08080850: .4byte gSaveBlock1
	thumb_func_end sub_8080834

	thumb_func_start sub_8080854
sub_8080854: @ 8080854
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r0, 24
	cmp r0, r1
	beq _0808086E
	cmp r2, 0x3
	beq _08080868
	cmp r2, 0x5
	bne _0808086E
_08080868:
	movs r0, 0x28
	bl sav12_xor_increment
_0808086E:
	pop {r0}
	bx r0
	thumb_func_end sub_8080854

	thumb_func_start palette_bg_faded_fill_black
palette_bg_faded_fill_black: @ 8080874
	push {lr}
	sub sp, 0x4
	ldr r0, _0808088C
	str r0, [sp]
	ldr r1, _08080890
	ldr r2, _08080894
	mov r0, sp
	bl CpuFastSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0808088C: .4byte 0x7fff7fff
_08080890: .4byte gPlttBufferFaded
_08080894: .4byte 0x01000100
	thumb_func_end palette_bg_faded_fill_black

	thumb_func_start palette_bg_faded_fill_white
palette_bg_faded_fill_white: @ 8080898
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r1, _080808B0
	ldr r2, _080808B4
	mov r0, sp
	bl CpuFastSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080808B0: .4byte gPlttBufferFaded
_080808B4: .4byte 0x01000100
	thumb_func_end palette_bg_faded_fill_white

	thumb_func_start pal_fill_for_maplights
pal_fill_for_maplights: @ 80808B8
	push {r4,lr}
	bl get_map_light_from_warp0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sav1_map_get_light_level
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl fade_type_for_given_maplight_pair
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080808E2
	cmp r0, 0x1
	beq _080808F0
	b _080808FC
_080808E2:
	movs r0, 0
	movs r1, 0
	bl fade_screen
	bl palette_bg_faded_fill_white
	b _080808FC
_080808F0:
	movs r0, 0x2
	movs r1, 0
	bl fade_screen
	bl palette_bg_faded_fill_black
_080808FC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end pal_fill_for_maplights

	thumb_func_start pal_fill_black
pal_fill_black: @ 8080904
	push {lr}
	movs r0, 0
	movs r1, 0
	bl fade_screen
	bl palette_bg_faded_fill_white
	pop {r0}
	bx r0
	thumb_func_end pal_fill_black

	thumb_func_start sub_8080918
sub_8080918: @ 8080918
	push {r4,lr}
	bl sav1_map_get_light_level
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl warp1_get_mapheader
	ldrb r1, [r0, 0x17]
	adds r0, r4, 0
	bl sub_810CDB8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0808093E
	cmp r0, 0x1
	beq _08080948
	b _08080950
_0808093E:
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	b _08080950
_08080948:
	movs r0, 0x3
	movs r1, 0
	bl fade_screen
_08080950:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8080918

	thumb_func_start sub_8080958
sub_8080958: @ 8080958
	push {lr}
	lsls r0, 24
	movs r1, 0
	cmp r0, 0
	bne _08080964
	movs r1, 0x1
_08080964:
	adds r0, r1, 0
	bl sub_8059B88
	pop {r0}
	bx r0
	thumb_func_end sub_8080958

	thumb_func_start task0A_asap_script_env_2_enable_and_set_ctx_running
task0A_asap_script_env_2_enable_and_set_ctx_running: @ 8080970
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8080E70
	cmp r0, 0x1
	bne _08080988
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_08080988:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task0A_asap_script_env_2_enable_and_set_ctx_running

	thumb_func_start sub_8080990
sub_8080990: @ 8080990
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053E90
	bl pal_fill_black
	ldr r0, _080809AC
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080809AC: .4byte task0A_asap_script_env_2_enable_and_set_ctx_running
	thumb_func_end sub_8080990

	thumb_func_start sub_80809B0
sub_80809B0: @ 80809B0
	push {lr}
	bl ScriptContext2_Enable
	bl pal_fill_black
	ldr r0, _080809C8
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080809C8: .4byte task0A_asap_script_env_2_enable_and_set_ctx_running
	thumb_func_end sub_80809B0

	thumb_func_start task_mpl_807DD60
task_mpl_807DD60: @ 80809CC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r2, _080809F0
	adds r4, r0, r2
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08080A06
	cmp r0, 0x1
	bgt _080809F4
	cmp r0, 0
	beq _080809FA
	b _08080A36
	.align 2, 0
_080809F0: .4byte gTasks
_080809F4:
	cmp r0, 0x2
	beq _08080A24
	b _08080A36
_080809FA:
	bl sub_8083664
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	b _08080A1C
_08080A06:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _08080A36
	bl pal_fill_for_maplights
_08080A1C:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08080A36
_08080A24:
	bl sub_8080E70
	cmp r0, 0x1
	bne _08080A36
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
_08080A36:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end task_mpl_807DD60

	thumb_func_start sub_8080A3C
sub_8080A3C: @ 8080A3C
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053E90
	bl palette_bg_faded_fill_white
	ldr r0, _08080A58
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080A58: .4byte task_mpl_807DD60
	thumb_func_end sub_8080A3C

	thumb_func_start sub_8080A5C
sub_8080A5C: @ 8080A5C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08080A80
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08080A90
	cmp r0, 0x1
	bgt _08080A84
	cmp r0, 0
	beq _08080A8A
	b _08080ABC
	.align 2, 0
_08080A80: .4byte gTasks
_08080A84:
	cmp r0, 0x2
	beq _08080AA6
	b _08080ABC
_08080A8A:
	bl sub_80084A4
	b _08080A9E
_08080A90:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _08080ABC
	bl pal_fill_for_maplights
_08080A9E:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08080ABC
_08080AA6:
	bl sub_8080E70
	cmp r0, 0x1
	bne _08080ABC
	bl sub_8007B14
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
_08080ABC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8080A5C

	thumb_func_start sub_8080AC4
sub_8080AC4: @ 8080AC4
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053E90
	bl palette_bg_faded_fill_white
	ldr r0, _08080AE0
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080AE0: .4byte sub_8080A5C
	thumb_func_end sub_8080AC4

	thumb_func_start sub_8080AE4
sub_8080AE4: @ 8080AE4
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8056EAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08080B1C
	ldr r1, _08080B18
	b _08080B2E
	.align 2, 0
_08080B18: .4byte sub_8080B9C
_08080B1C:
	adds r0, r4, 0
	bl sub_8056F08
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08080B40
	cmp r0, 0x1
	bne _08080B2E
	ldr r1, _08080B44
_08080B2E:
	adds r0, r1, 0
	movs r1, 0xA
	bl CreateTask
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080B40: .4byte task_map_chg_seq_0807E2CC
_08080B44: .4byte task_map_chg_seq_0807E20C
	thumb_func_end sub_8080AE4

	thumb_func_start mapldr_default
mapldr_default: @ 8080B48
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_maplights
	bl sub_8080AE4
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	thumb_func_end mapldr_default

	thumb_func_start sub_8080B60
sub_8080B60: @ 8080B60
	push {lr}
	bl sub_8053E90
	bl pal_fill_black
	bl sub_8080AE4
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	thumb_func_end sub_8080B60

	thumb_func_start sub_8080B78
sub_8080B78: @ 8080B78
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_maplights
	movs r0, 0x2E
	bl PlaySE
	ldr r0, _08080B98
	movs r1, 0xA
	bl CreateTask
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08080B98: .4byte task_map_chg_seq_0807E2CC
	thumb_func_end sub_8080B78

	thumb_func_start sub_8080B9C
sub_8080B9C: @ 8080B9C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08080BC8
	adds r5, r0, r1
	adds r6, r5, 0
	adds r6, 0xC
	adds r7, r5, 0
	adds r7, 0xE
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _08080CAE
	lsls r0, 2
	ldr r1, _08080BCC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08080BC8: .4byte gTasks
_08080BCC: .4byte _08080BD0
	.align 2, 0
_08080BD0:
	.4byte _08080BE4
	.4byte _08080C08
	.4byte _08080C40
	.4byte _08080C84
	.4byte _08080CA4
_08080BE4:
	movs r0, 0
	bl sub_8080958
	bl player_bitmagic
	adds r0, r6, 0
	adds r1, r7, 0
	bl PlayerGetDestCoords
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl sub_80586B4
	movs r0, 0x1
	strh r0, [r5, 0x8]
	b _08080CAE
_08080C08:
	bl sub_8080E70
	cmp r0, 0
	beq _08080CAE
	movs r0, 0x1
	bl sub_8080958
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08080C3C
	adds r0, r1
	movs r1, 0x8
	bl FieldObjectSetSpecialAnim
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _08080CAE
	.align 2, 0
_08080C3C: .4byte gMapObjects
_08080C40:
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _08080CAE
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl sub_805870C
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08080C80
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _08080CAE
	.align 2, 0
_08080C80: .4byte gMapObjects
_08080C84:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _08080C9A
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _08080CAE
_08080C9A:
	bl sub_806451C
	movs r0, 0x4
	strh r0, [r5, 0x8]
	b _08080CAE
_08080CA4:
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
_08080CAE:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8080B9C

	thumb_func_start task_map_chg_seq_0807E20C
task_map_chg_seq_0807E20C: @ 8080CB4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08080CE0
	adds r5, r0, r1
	adds r6, r5, 0
	adds r6, 0xC
	adds r7, r5, 0
	adds r7, 0xE
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08080D06
	cmp r0, 0x1
	bgt _08080CE4
	cmp r0, 0
	beq _08080CEE
	b _08080D6E
	.align 2, 0
_08080CE0: .4byte gTasks
_08080CE4:
	cmp r0, 0x2
	beq _08080D50
	cmp r0, 0x3
	beq _08080D64
	b _08080D6E
_08080CEE:
	movs r0, 0
	bl sub_8080958
	bl player_bitmagic
	adds r0, r6, 0
	adds r1, r7, 0
	bl PlayerGetDestCoords
	movs r0, 0x1
	strh r0, [r5, 0x8]
	b _08080D6E
_08080D06:
	bl sub_8080E70
	cmp r0, 0
	beq _08080D6E
	movs r0, 0x1
	bl sub_8080958
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08080D4C
	adds r4, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetGoSpeed0AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _08080D6E
	.align 2, 0
_08080D4C: .4byte gMapObjects
_08080D50:
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _08080D6E
	bl sub_806451C
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _08080D6E
_08080D64:
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
_08080D6E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end task_map_chg_seq_0807E20C

	thumb_func_start task_map_chg_seq_0807E2CC
task_map_chg_seq_0807E2CC: @ 8080D74
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08080D94
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08080D98
	cmp r0, 0x1
	beq _08080DA8
	b _08080DBE
	.align 2, 0
_08080D94: .4byte gTasks
_08080D98:
	bl player_bitmagic
	bl ScriptContext2_Enable
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08080DBE
_08080DA8:
	bl sub_8080E70
	cmp r0, 0
	beq _08080DBE
	bl sub_806451C
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
_08080DBE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end task_map_chg_seq_0807E2CC

	thumb_func_start sub_8080DC4
sub_8080DC4: @ 8080DC4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8080E70
	cmp r0, 0x1
	bne _08080DE0
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _08080DE8
	movs r1, 0x50
	bl CreateTask
_08080DE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080DE8: .4byte sub_80712B4
	thumb_func_end sub_8080DC4

	thumb_func_start atk17_seteffectuser
atk17_seteffectuser: @ 8080DEC
	push {lr}
	bl pal_fill_black
	ldr r0, _08080E00
	bl CreateStartMenuTask
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08080E00: .4byte sub_8080DC4
	thumb_func_end atk17_seteffectuser

	thumb_func_start task_mpl_807E3C8
task_mpl_807E3C8: @ 8080E04
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8080E70
	cmp r0, 0x1
	bne _08080E20
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	bl sub_8064E2C
_08080E20:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task_mpl_807E3C8

	thumb_func_start sub_8080E28
sub_8080E28: @ 8080E28
	push {lr}
	bl ScriptContext2_Enable
	bl pal_fill_black
	ldr r0, _08080E40
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080E40: .4byte task_mpl_807E3C8
	thumb_func_end sub_8080E28

	thumb_func_start sub_8080E44
sub_8080E44: @ 8080E44
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053E90
	bl pal_fill_black
	ldr r0, _08080E60
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080E60: .4byte task_mpl_807E3C8
	thumb_func_end sub_8080E44

	thumb_func_start sub_8080E64
sub_8080E64: @ 8080E64
	ldr r0, _08080E6C
	ldrb r0, [r0, 0x7]
	lsrs r0, 7
	bx lr
	.align 2, 0
_08080E6C: .4byte gPaletteFade
	thumb_func_end sub_8080E64

	thumb_func_start sub_8080E70
sub_8080E70: @ 8080E70
	push {lr}
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08080E82
	movs r0, 0
	b _08080E84
_08080E82:
	movs r0, 0x1
_08080E84:
	pop {r1}
	bx r1
	thumb_func_end sub_8080E70

	thumb_func_start sub_8080E88
sub_8080E88: @ 8080E88
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053FF8
	bl sub_8080918
	bl play_some_sound
	movs r0, 0x9
	bl PlaySE
	ldr r0, _08080EB4
	ldr r1, _08080EB8
	str r1, [r0]
	ldr r0, _08080EBC
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080EB4: .4byte gUnknown_0300485C
_08080EB8: .4byte mapldr_default
_08080EBC: .4byte task0A_fade_n_map_maybe
	thumb_func_end sub_8080E88

	thumb_func_start sp13E_warp_to_last_warp
sp13E_warp_to_last_warp: @ 8080EC0
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053FF8
	bl sub_8080918
	bl play_some_sound
	ldr r0, _08080EE4
	ldr r1, _08080EE8
	str r1, [r0]
	ldr r0, _08080EEC
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080EE4: .4byte gUnknown_0300485C
_08080EE8: .4byte mapldr_default
_08080EEC: .4byte task0A_fade_n_map_maybe
	thumb_func_end sp13E_warp_to_last_warp

	thumb_func_start sub_8080EF0
sub_8080EF0: @ 8080EF0
	push {lr}
	bl ScriptContext2_Enable
	ldr r0, _08080F08
	ldr r1, _08080F0C
	str r1, [r0]
	ldr r0, _08080F10
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08080F08: .4byte gUnknown_0300485C
_08080F0C: .4byte mapldr_default
_08080F10: .4byte sub_808115C
	thumb_func_end sub_8080EF0

	thumb_func_start sp13F_fall_to_last_warp
sp13F_fall_to_last_warp: @ 8080F14
	push {lr}
	bl sp13E_warp_to_last_warp
	ldr r1, _08080F24
	ldr r0, _08080F28
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08080F24: .4byte gUnknown_0300485C
_08080F28: .4byte sub_8086748
	thumb_func_end sp13F_fall_to_last_warp

	thumb_func_start sub_8080F2C
sub_8080F2C: @ 8080F2C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ScriptContext2_Enable
	adds r0, r4, 0
	movs r1, 0xA
	bl sub_8086A2C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8080F2C

	thumb_func_start sub_8080F48
sub_8080F48: @ 8080F48
	push {lr}
	bl ScriptContext2_Enable
	movs r0, 0xA
	bl sub_80871B8
	pop {r0}
	bx r0
	thumb_func_end sub_8080F48

	thumb_func_start sub_8080F58
sub_8080F58: @ 8080F58
	push {lr}
	bl ScriptContext2_Enable
	movs r0, 0xA
	bl sub_8087654
	pop {r0}
	bx r0
	thumb_func_end sub_8080F58

	thumb_func_start sub_8080F68
sub_8080F68: @ 8080F68
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053FF8
	bl sub_8080918
	movs r0, 0x2D
	bl PlaySE
	ldr r0, _08080F90
	movs r1, 0xA
	bl CreateTask
	ldr r1, _08080F94
	ldr r0, _08080F98
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08080F90: .4byte task0A_fade_n_map_maybe
_08080F94: .4byte gUnknown_0300485C
_08080F98: .4byte sub_8080B78
	thumb_func_end sub_8080F68

	thumb_func_start sub_8080F9C
sub_8080F9C: @ 8080F9C
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8080918
	ldr r0, _08080FB8
	movs r1, 0xA
	bl CreateTask
	ldr r1, _08080FBC
	ldr r0, _08080FC0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08080FB8: .4byte task0A_fade_n_map_maybe
_08080FBC: .4byte gUnknown_0300485C
_08080FC0: .4byte sub_80C791C
	thumb_func_end sub_8080F9C

	thumb_func_start sub_8080FC4
sub_8080FC4: @ 8080FC4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08080FE8
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08080FF8
	cmp r0, 0x1
	bgt _08080FEC
	cmp r0, 0
	beq _08080FF2
	b _08081022
	.align 2, 0
_08080FE8: .4byte gTasks
_08080FEC:
	cmp r0, 0x2
	beq _08081012
	b _08081022
_08080FF2:
	bl ScriptContext2_Enable
	b _0808100A
_08080FF8:
	bl sub_8080E64
	cmp r0, 0
	bne _08081022
	bl sub_8054034
	lsls r0, 24
	cmp r0, 0
	beq _08081022
_0808100A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08081022
_08081012:
	bl warp_in
	ldr r0, _08081028
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_08081022:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081028: .4byte sub_8054588
	thumb_func_end sub_8080FC4

	thumb_func_start sub_808102C
sub_808102C: @ 808102C
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053FF8
	bl sub_8080918
	movs r0, 0x9
	bl PlaySE
	ldr r0, _0808104C
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0808104C: .4byte sub_8080FC4
	thumb_func_end sub_808102C

	thumb_func_start sub_8081050
sub_8081050: @ 8081050
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08081074
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08081096
	cmp r0, 0x1
	bgt _08081078
	cmp r0, 0
	beq _0808107E
	b _080810CC
	.align 2, 0
_08081074: .4byte gUnknown_03004B28
_08081078:
	cmp r0, 0x2
	beq _080810B4
	b _080810CC
_0808107E:
	bl ClearLinkCallback_2
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	bl sub_8053FF8
	movs r0, 0x9
	bl PlaySE
	b _080810AC
_08081096:
	bl sub_8080E64
	cmp r0, 0
	bne _080810CC
	bl sub_8054034
	lsls r0, 24
	cmp r0, 0
	beq _080810CC
	bl sub_800832C
_080810AC:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080810CC
_080810B4:
	ldr r0, _080810D4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080810CC
	bl warp_in
	ldr r0, _080810D8
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_080810CC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080810D4: .4byte gReceivedRemoteLinkPlayers
_080810D8: .4byte CB2_LoadMap
	thumb_func_end sub_8081050

	thumb_func_start sub_80810DC
sub_80810DC: @ 80810DC
	push {lr}
	ldr r0, _080810EC
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080810EC: .4byte sub_8081050
	thumb_func_end sub_80810DC

	thumb_func_start task0A_fade_n_map_maybe
task0A_fade_n_map_maybe: @ 80810F0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08081114
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08081128
	cmp r0, 0x1
	bgt _08081118
	cmp r0, 0
	beq _0808111E
	b _08081152
	.align 2, 0
_08081114: .4byte gTasks
_08081118:
	cmp r0, 0x2
	beq _08081142
	b _08081152
_0808111E:
	bl player_bitmagic
	bl ScriptContext2_Enable
	b _0808113A
_08081128:
	bl sub_8080E64
	cmp r0, 0
	bne _08081152
	bl sub_8054034
	lsls r0, 24
	cmp r0, 0
	beq _08081152
_0808113A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08081152
_08081142:
	bl warp_in
	ldr r0, _08081158
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_08081152:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081158: .4byte CB2_LoadMap
	thumb_func_end task0A_fade_n_map_maybe

	thumb_func_start sub_808115C
sub_808115C: @ 808115C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0808118C
	adds r5, r1, r0
	adds r4, r5, 0
	adds r4, 0xC
	adds r6, r5, 0
	adds r6, 0xE
	movs r2, 0x8
	ldrsh r1, [r5, r2]
	adds r2, r0, 0
	cmp r1, 0x4
	bls _08081180
	b _080812BC
_08081180:
	lsls r0, r1, 2
	ldr r1, _08081190
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808118C: .4byte gTasks
_08081190: .4byte _08081194
	.align 2, 0
_08081194:
	.4byte _080811A8
	.4byte _080811E4
	.4byte _08081240
	.4byte _0808128C
	.4byte _080812A8
_080811A8:
	bl player_bitmagic
	adds r0, r4, 0
	adds r1, r6, 0
	bl PlayerGetDestCoords
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0
	ldrsh r1, [r6, r2]
	subs r1, 0x1
	bl sub_8058790
	lsls r0, 16
	lsrs r0, 16
	bl PlaySE
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0
	ldrsh r1, [r6, r2]
	subs r1, 0x1
	bl task_overworld_door_add_if_role_69_for_opening_door_at
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0x1
	strh r0, [r5, 0x8]
	b _080812BC
_080811E4:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _080811FA
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _080812BC
_080811FA:
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r4, _0808123C
	adds r0, r4
	bl FieldObjectClearAnimIfSpecialAnimActive
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x9
	bl FieldObjectSetSpecialAnim
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _080812BC
	.align 2, 0
_0808123C: .4byte gMapObjects
_08081240:
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _080812BC
	movs r2, 0
	ldrsh r0, [r4, r2]
	movs r2, 0
	ldrsh r1, [r6, r2]
	subs r1, 0x1
	bl sub_805870C
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0xA]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08081288
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	movs r0, 0
	bl sub_8080958
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _080812BC
	.align 2, 0
_08081288: .4byte gMapObjects
_0808128C:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _080812A2
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0x4]
	cmp r0, 0x1
	beq _080812BC
_080812A2:
	movs r0, 0x4
	strh r0, [r5, 0x8]
	b _080812BC
_080812A8:
	bl sub_8053FF8
	bl sub_8080918
	bl play_some_sound
	movs r0, 0
	strh r0, [r5, 0x8]
	ldr r0, _080812C4
	str r0, [r5]
_080812BC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080812C4: .4byte task0A_fade_n_map_maybe
	thumb_func_end sub_808115C

	thumb_func_start sub_80812C8
sub_80812C8: @ 80812C8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080812EC
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08081300
	cmp r0, 0x1
	bgt _080812F0
	cmp r0, 0
	beq _080812F6
	b _0808132A
	.align 2, 0
_080812EC: .4byte gTasks
_080812F0:
	cmp r0, 0x2
	beq _0808131A
	b _0808132A
_080812F6:
	bl player_bitmagic
	bl ScriptContext2_Enable
	b _08081312
_08081300:
	bl sub_8080E64
	cmp r0, 0
	bne _0808132A
	bl sub_8054034
	lsls r0, 24
	cmp r0, 0
	beq _0808132A
_08081312:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _0808132A
_0808131A:
	bl warp_in
	ldr r0, _08081330
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0808132A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081330: .4byte sub_8054534
	thumb_func_end sub_80812C8

	thumb_func_start sub_8081334
sub_8081334: @ 8081334
	push {lr}
	bl ScriptContext2_Enable
	bl sub_8053FF8
	bl sub_8080918
	bl play_some_sound
	movs r0, 0x9
	bl PlaySE
	ldr r0, _08081360
	ldr r1, _08081364
	str r1, [r0]
	ldr r0, _08081368
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08081360: .4byte gUnknown_0300485C
_08081364: .4byte sub_8080B60
_08081368: .4byte sub_80812C8
	thumb_func_end sub_8081334

	thumb_func_start sub_808136C
sub_808136C: @ 808136C
	push {lr}
	cmp r1, 0xA0
	bhi _08081394
	cmp r2, 0
	bge _08081378
	movs r2, 0
_08081378:
	cmp r2, 0xFF
	ble _0808137E
	movs r2, 0xFF
_0808137E:
	cmp r3, 0
	bge _08081384
	movs r3, 0
_08081384:
	cmp r3, 0xFF
	ble _0808138A
	movs r3, 0xFF
_0808138A:
	lsls r1, 1
	adds r1, r0
	lsls r0, r2, 8
	orrs r0, r3
	strh r0, [r1]
_08081394:
	pop {r0}
	bx r0
	thumb_func_end sub_808136C

	thumb_func_start sub_8081398
sub_8081398: @ 8081398
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	str r0, [sp]
	mov r10, r1
	mov r9, r2
	adds r6, r3, 0
	mov r8, r6
	movs r7, 0
	cmp r6, 0
	blt _08081414
_080813B4:
	mov r0, r9
	subs r1, r0, r7
	mov r0, r10
	subs r4, r0, r6
	adds r5, r0, r6
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_808136C
	mov r0, r9
	adds r1, r0, r7
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_808136C
	mov r0, r9
	subs r1, r0, r6
	mov r0, r10
	subs r4, r0, r7
	adds r5, r0, r7
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_808136C
	mov r0, r9
	adds r1, r0, r6
	ldr r0, [sp]
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_808136C
	mov r1, r8
	adds r1, 0x1
	lsls r0, r7, 1
	subs r1, r0
	mov r8, r1
	adds r7, 0x1
	cmp r1, 0
	bge _08081410
	subs r1, r6, 0x1
	lsls r0, r1, 1
	add r8, r0
	adds r6, r1, 0
_08081410:
	cmp r6, r7
	bge _080813B4
_08081414:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8081398

	thumb_func_start sub_8081424
sub_8081424: @ 8081424
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08081448
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08081480
	cmp r0, 0x1
	bgt _0808144C
	cmp r0, 0
	beq _08081452
	b _080814E2
	.align 2, 0
_08081448: .4byte gUnknown_03004B28
_0808144C:
	cmp r0, 0x2
	beq _080814D8
	b _080814E2
_08081452:
	ldr r0, _08081478
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _0808147C
	adds r0, r1
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r5, 0x6
	ldrsh r3, [r4, r5]
	bl sub_8081398
	movs r0, 0x1
	strh r0, [r4]
	b _080814E2
	.align 2, 0
_08081478: .4byte gUnknown_03004DC0
_0808147C: .4byte gUnknown_03004DE0
_08081480:
	ldr r0, _080814C8
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _080814CC
	adds r0, r1
	movs r6, 0x2
	ldrsh r1, [r4, r6]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r6, 0x6
	ldrsh r3, [r4, r6]
	bl sub_8081398
	movs r0, 0
	strh r0, [r4]
	ldrh r0, [r4, 0xA]
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r4, 0x6]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080814E2
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _080814D0
	bl remove_some_task
	movs r0, 0x2
	strh r0, [r4]
	b _080814E2
	.align 2, 0
_080814C8: .4byte gUnknown_03004DC0
_080814CC: .4byte gUnknown_03004DE0
_080814D0:
	adds r0, r5, 0
	bl DestroyTask
	b _080814E2
_080814D8:
	bl dp12_8087EA4
	adds r0, r5, 0
	bl DestroyTask
_080814E2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8081424

	thumb_func_start sub_80814E8
sub_80814E8: @ 80814E8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808150C
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08081504
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_08081504:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808150C: .4byte sub_8081424
	thumb_func_end sub_80814E8

	thumb_func_start sub_8081510
sub_8081510: @ 8081510
	push {r4,lr}
	ldr r4, _08081530
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08081528
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_08081528:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081530: .4byte sub_80814E8
	thumb_func_end sub_8081510

	thumb_func_start sub_8081534
sub_8081534: @ 8081534
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r8, r0
	mov r9, r1
	adds r5, r2, 0
	adds r4, r3, 0
	ldr r6, [sp, 0x1C]
	ldr r0, [sp, 0x20]
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08081578
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _0808157C
	adds r1, r0, r1
	strh r5, [r1, 0x6]
	strh r4, [r1, 0x8]
	mov r0, r8
	strh r0, [r1, 0x2]
	mov r0, r9
	strh r0, [r1, 0x4]
	strh r6, [r1, 0xC]
	cmp r5, r4
	bge _08081580
	strh r7, [r1, 0xA]
	b _08081584
	.align 2, 0
_08081578: .4byte sub_8081424
_0808157C: .4byte gUnknown_03004B28
_08081580:
	negs r0, r7
	strh r0, [r1, 0xA]
_08081584:
	adds r0, r2, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8081534

	thumb_func_start sub_8081594
sub_8081594: @ 8081594
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	bl sav1_get_flash_used_on_map
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	cmp r4, 0
	bne _080815AE
	movs r5, 0x1
_080815AE:
	ldr r1, _080815DC
	lsls r0, 1
	adds r0, r1
	ldrh r2, [r0]
	lsls r0, r4, 1
	adds r0, r1
	ldrh r3, [r0]
	str r5, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	movs r0, 0x78
	movs r1, 0x50
	bl sub_8081534
	bl sub_8081510
	bl ScriptContext2_Enable
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080815DC: .4byte gUnknown_0839ACDC
	thumb_func_end sub_8081594

	thumb_func_start sub_80815E0
sub_80815E0: @ 80815E0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0808160E
	ldr r4, _08081614
	ldr r1, _08081618
	lsls r0, 1
	adds r0, r1
	ldrh r3, [r0]
	adds r0, r4, 0
	movs r1, 0x78
	movs r2, 0x50
	bl sub_8081398
	movs r0, 0xF0
	lsls r0, 3
	adds r1, r4, r0
	movs r2, 0xF0
	lsls r2, 1
	adds r0, r4, 0
	bl CpuFastSet
_0808160E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081614: .4byte gUnknown_03004DE0
_08081618: .4byte gUnknown_0839ACDC
	thumb_func_end sub_80815E0

	thumb_func_start sub_808161C
sub_808161C: @ 808161C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	cmp r0, 0
	bne _0808162A
	movs r1, 0x1F
	b _08081630
_0808162A:
	movs r0, 0xF8
	lsls r0, 7
	adds r1, r0, 0
_08081630:
	mov r0, sp
	strh r1, [r0]
	movs r5, 0
	movs r4, 0xF0
	lsls r4, 16
_0808163A:
	lsrs r1, r4, 16
	mov r0, sp
	movs r2, 0x2
	bl LoadPalette
	movs r0, 0x80
	lsls r0, 9
	adds r4, r0
	adds r5, 0x1
	cmp r5, 0xF
	ble _0808163A
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_808161C

	thumb_func_start sub_8081658
sub_8081658: @ 8081658
	push {lr}
	lsls r0, 16
	ldr r2, _08081678
	ldrh r1, [r2]
	lsls r1, 24
	lsrs r3, r1, 24
	ldrh r1, [r2]
	lsrs r2, r1, 8
	cmp r0, 0
	beq _0808167C
	cmp r3, 0
	beq _08081686
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	b _08081686
	.align 2, 0
_08081678: .4byte REG_BLDALPHA
_0808167C:
	cmp r2, 0xF
	bhi _08081686
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_08081686:
	ldr r1, _0808169C
	lsls r0, r2, 8
	orrs r0, r3
	strh r0, [r1]
	cmp r3, 0
	bne _080816A0
	cmp r2, 0x10
	bne _080816A0
	movs r0, 0x1
	b _080816A2
	.align 2, 0
_0808169C: .4byte REG_BLDALPHA
_080816A0:
	movs r0, 0
_080816A2:
	pop {r1}
	bx r1
	thumb_func_end sub_8081658

	thumb_func_start sub_80816A8
sub_80816A8: @ 80816A8
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080816D0
	adds r7, r0, r1
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0x7
	bls _080816C4
	b _08081892
_080816C4:
	lsls r0, 2
	ldr r1, _080816D4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080816D0: .4byte gUnknown_03004B28
_080816D4: .4byte _080816D8
	.align 2, 0
_080816D8:
	.4byte _080816F8
	.4byte _08081790
	.4byte _080817BC
	.4byte _080817D8
	.4byte _080817EE
	.4byte _08081852
	.4byte _08081818
	.4byte _08081826
_080816F8:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	strh r0, [r7, 0xC]
	ldr r3, _0808176C
	ldrh r0, [r3]
	strh r0, [r7, 0xE]
	ldr r6, _08081770
	ldrh r0, [r6]
	strh r0, [r7, 0x10]
	ldr r5, _08081774
	ldrh r0, [r5]
	strh r0, [r7, 0x12]
	ldr r4, _08081778
	ldrh r0, [r4]
	strh r0, [r7, 0x14]
	ldrh r1, [r2]
	ldr r0, _0808177C
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08081780
	ldrh r0, [r3]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r3]
	ldr r2, _08081784
	adds r0, r2, 0
	strh r0, [r6]
	movs r0, 0x3F
	strh r0, [r5]
	movs r0, 0x1E
	strh r0, [r4]
	ldr r4, _08081788
	movs r0, 0x4
	ldrsh r1, [r7, r0]
	movs r0, 0x6
	ldrsh r2, [r7, r0]
	adds r0, r4, 0
	movs r3, 0x1
	bl sub_8081398
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r4, r2
	movs r2, 0xF0
	lsls r2, 1
	adds r0, r4, 0
	bl CpuFastSet
	ldr r2, _0808178C
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [r2, 0x8]
	bl sub_80895F8
	movs r0, 0x1
	strh r0, [r7]
	b _08081892
	.align 2, 0
_0808176C: .4byte REG_BLDCNT
_08081770: .4byte REG_BLDALPHA
_08081774: .4byte REG_WININ
_08081778: .4byte REG_WINOUT
_0808177C: .4byte 0x0000bfff
_08081780: .4byte gUnknown_081E29E8
_08081784: .4byte 0x0000070c
_08081788: .4byte gUnknown_03004DE0
_0808178C: .4byte gUnknown_0839ACEC
_08081790:
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuFillWindowRectWithBlankTile
	ldrb r0, [r7, 0x2]
	bl sub_808161C
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	movs r2, 0x6
	ldrsh r1, [r7, r2]
	movs r2, 0x1
	str r2, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r3, 0xA0
	bl sub_8081534
	strh r4, [r7]
	b _08081892
_080817BC:
	ldr r0, _080817D4
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08081892
	bl EnableBothScriptContexts
	movs r0, 0x3
	strh r0, [r7]
	b _08081892
	.align 2, 0
_080817D4: .4byte sub_8081424
_080817D8:
	bl InstallCameraPanAheadCallback
	movs r0, 0
	bl SetCameraPanningCallback
	movs r0, 0
	strh r0, [r7, 0xA]
	movs r0, 0x4
	strh r0, [r7, 0x8]
	strh r0, [r7]
	b _08081892
_080817EE:
	ldrh r0, [r7, 0x8]
	subs r0, 0x1
	strh r0, [r7, 0x8]
	lsls r0, 16
	cmp r0, 0
	bne _08081892
	movs r0, 0x4
	strh r0, [r7, 0x8]
	ldrh r0, [r7, 0xA]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r7, 0xA]
	movs r1, 0x4
	negs r1, r1
	cmp r0, 0
	beq _08081810
	movs r1, 0x4
_08081810:
	movs r0, 0
	bl SetCameraPanning
	b _08081892
_08081818:
	bl InstallCameraPanAheadCallback
	movs r0, 0x8
	strh r0, [r7, 0x8]
	movs r0, 0x7
	strh r0, [r7]
	b _08081892
_08081826:
	ldrh r0, [r7, 0x8]
	subs r0, 0x1
	strh r0, [r7, 0x8]
	lsls r0, 16
	cmp r0, 0
	bne _08081892
	movs r0, 0x8
	strh r0, [r7, 0x8]
	ldrh r0, [r7, 0xA]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r7, 0xA]
	ldrh r0, [r7, 0xA]
	bl sub_8081658
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08081892
	movs r0, 0x5
	strh r0, [r7]
	b _08081892
_08081852:
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r0, _0808189C
	bl LoadFontDefaultPalette
	ldr r1, _080818A0
	movs r0, 0xFF
	strh r0, [r1]
	subs r1, 0x40
	ldrh r0, [r7, 0xC]
	strh r0, [r1]
	adds r1, 0x50
	ldrh r0, [r7, 0xE]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r7, 0x10]
	strh r0, [r1]
	subs r1, 0xA
	ldrh r0, [r7, 0x12]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r7, 0x14]
	strh r0, [r1]
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_08081892:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808189C: .4byte gWindowConfig_81E6CE4
_080818A0: .4byte REG_WIN0H
	thumb_func_end sub_80816A8

	thumb_func_start sub_80818A4
sub_80818A4: @ 80818A4
	push {lr}
	ldr r0, _080818CC
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080818D0
	adds r1, r0
	ldr r0, _080818D4
	ldrh r0, [r0]
	cmp r0, 0
	bne _080818D8
	strh r0, [r1, 0x2]
	movs r0, 0x68
	b _080818F0
	.align 2, 0
_080818CC: .4byte sub_80816A8
_080818D0: .4byte gUnknown_03004B28
_080818D4: .4byte gScriptResult
_080818D8:
	cmp r0, 0x1
	bne _080818E2
	strh r0, [r1, 0x2]
	movs r0, 0x68
	b _080818F0
_080818E2:
	cmp r0, 0x2
	bne _080818EA
	movs r0, 0
	b _080818EC
_080818EA:
	movs r0, 0x1
_080818EC:
	strh r0, [r1, 0x2]
	movs r0, 0x78
_080818F0:
	strh r0, [r1, 0x4]
	movs r0, 0x50
	strh r0, [r1, 0x6]
	pop {r0}
	bx r0
	thumb_func_end sub_80818A4

	thumb_func_start sub_80818FC
sub_80818FC: @ 80818FC
	push {lr}
	ldr r0, _0808191C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08081920
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x6
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0808191C: .4byte sub_80816A8
_08081920: .4byte gTasks
	thumb_func_end sub_80818FC

	thumb_func_start sub_8081924
sub_8081924: @ 8081924
	push {lr}
	bl sub_8054044
	ldr r0, _08081938
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08081938: .4byte task50_0807F0C8
	thumb_func_end sub_8081924

	thumb_func_start task50_0807F0C8
task50_0807F0C8: @ 808193C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08081958
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_08081958:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task50_0807F0C8

	thumb_func_start task01_battle_start
task01_battle_start: @ 8081960
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08081980
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08081984
	cmp r0, 0x1
	beq _0808199A
	b _080819BA
	.align 2, 0
_08081980: .4byte gUnknown_03004B28
_08081984:
	bl c3_80A0DD8_is_running
	cmp r0, 0
	bne _080819BA
	ldrb r0, [r4, 0x2]
	bl sub_811AABC
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080819BA
_0808199A:
	bl sub_811AAE8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080819BA
	ldr r0, _080819C0
	bl SetMainCallback2
	bl prev_quest_postbuffer_cursor_backup_reset
	bl overworld_poison_timer_set
	adds r0, r5, 0
	bl DestroyTask
_080819BA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080819C0: .4byte sub_800E7C4
	thumb_func_end task01_battle_start

	thumb_func_start task_add_01_battle_start
task_add_01_battle_start: @ 80819C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _080819F8
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080819FC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	adds r0, r5, 0
	bl current_map_music_set__default_for_battle
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080819F8: .4byte task01_battle_start
_080819FC: .4byte gTasks
	thumb_func_end task_add_01_battle_start

	thumb_func_start sub_8081A00
sub_8081A00: @ 8081A00
	push {lr}
	bl GetSafariZoneFlag
	cmp r0, 0
	beq _08081A10
	bl sub_8081AA4
	b _08081A14
_08081A10:
	bl sub_8081A18
_08081A14:
	pop {r0}
	bx r0
	thumb_func_end sub_8081A00

	thumb_func_start sub_8081A18
sub_8081A18: @ 8081A18
	push {lr}
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl sub_80597F4
	ldr r1, _08081A50
	ldr r0, _08081A54
	str r0, [r1, 0x8]
	ldr r1, _08081A58
	movs r0, 0
	strh r0, [r1]
	bl sub_8082034
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081A50: .4byte gMain
_08081A54: .4byte sub_8081C8C
_08081A58: .4byte gUnknown_020239F8
	thumb_func_end sub_8081A18

	thumb_func_start sub_8081A5C
sub_8081A5C: @ 8081A5C
	push {lr}
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl sub_80597F4
	ldr r1, _08081A98
	ldr r0, _08081A9C
	str r0, [r1, 0x8]
	ldr r1, _08081AA0
	movs r2, 0x80
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_8082034
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081A98: .4byte gMain
_08081A9C: .4byte sub_8081C8C
_08081AA0: .4byte gUnknown_020239F8
	thumb_func_end sub_8081A5C

	thumb_func_start sub_8081AA4
sub_8081AA4: @ 8081AA4
	push {lr}
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl sub_80597F4
	ldr r1, _08081AD0
	ldr r0, _08081AD4
	str r0, [r1, 0x8]
	ldr r1, _08081AD8
	movs r0, 0x80
	strh r0, [r1]
	bl sub_8082034
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	pop {r0}
	bx r0
	.align 2, 0
_08081AD0: .4byte gMain
_08081AD4: .4byte sub_80C824C
_08081AD8: .4byte gUnknown_020239F8
	thumb_func_end sub_8081AA4

	thumb_func_start task_add_01_battle_start_with_music_and_stats
task_add_01_battle_start_with_music_and_stats: @ 8081ADC
	push {lr}
	bl sub_8082080
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x9
	bl sav12_xor_increment
	pop {r0}
	bx r0
	thumb_func_end task_add_01_battle_start_with_music_and_stats

	thumb_func_start sub_8081AFC
sub_8081AFC: @ 8081AFC
	push {lr}
	ldr r0, _08081B2C
	movs r1, 0xC4
	lsls r1, 1
	movs r2, 0x5
	bl CreateMaleMon
	bl ScriptContext2_Enable
	ldr r1, _08081B30
	ldr r0, _08081B34
	str r0, [r1, 0x8]
	ldr r1, _08081B38
	movs r2, 0x80
	lsls r2, 2
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0x8
	movs r1, 0
	bl task_add_01_battle_start
	pop {r0}
	bx r0
	.align 2, 0
_08081B2C: .4byte gEnemyParty
_08081B30: .4byte gMain
_08081B34: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_08081B38: .4byte gUnknown_020239F8
	thumb_func_end sub_8081AFC

	thumb_func_start sub_8081B3C
sub_8081B3C: @ 8081B3C
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _08081B6C
	ldr r0, _08081B70
	str r0, [r1, 0x8]
	ldr r1, _08081B74
	movs r0, 0
	strh r0, [r1]
	bl sub_8082034
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081B6C: .4byte gMain
_08081B70: .4byte sub_8081CEC
_08081B74: .4byte gUnknown_020239F8
	thumb_func_end sub_8081B3C

	thumb_func_start sub_8081B78
sub_8081B78: @ 8081B78
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _08081BAC
	ldr r0, _08081BB0
	str r0, [r1, 0x8]
	ldr r1, _08081BB4
	movs r2, 0x80
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_8082034
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081BAC: .4byte gMain
_08081BB0: .4byte sub_8081CEC
_08081BB4: .4byte gUnknown_020239F8
	thumb_func_end sub_8081B78

	thumb_func_start sub_8081BB8
sub_8081BB8: @ 8081BB8
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _08081BE8
	ldr r0, _08081BEC
	str r0, [r1, 0x8]
	ldr r1, _08081BF0
	movs r2, 0x80
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08081BF4
	movs r0, 0
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081BE8: .4byte gMain
_08081BEC: .4byte sub_8081CEC
_08081BF0: .4byte gUnknown_020239F8
_08081BF4: .4byte 0x000001cf
	thumb_func_end sub_8081BB8

	thumb_func_start sub_8081BF8
sub_8081BF8: @ 8081BF8
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _08081C20
	ldr r0, _08081C24
	str r0, [r1, 0x8]
	ldr r1, _08081C28
	movs r2, 0xC0
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08081C2C
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08081C34
	ldr r1, _08081C30
	movs r0, 0xB
	bl task_add_01_battle_start
	b _08081C3C
	.align 2, 0
_08081C20: .4byte gMain
_08081C24: .4byte sub_8081CEC
_08081C28: .4byte gUnknown_020239F8
_08081C2C: .4byte gGameVersion
_08081C30: .4byte 0x000001cf
_08081C34:
	ldr r1, _08081C4C
	movs r0, 0x6
	bl task_add_01_battle_start
_08081C3C:
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081C4C: .4byte 0x000001cf
	thumb_func_end sub_8081BF8

	thumb_func_start sub_8081C50
sub_8081C50: @ 8081C50
	push {lr}
	bl ScriptContext2_Enable
	ldr r1, _08081C80
	ldr r0, _08081C84
	str r0, [r1, 0x8]
	ldr r1, _08081C88
	movs r2, 0xC0
	lsls r2, 7
	adds r0, r2, 0
	strh r0, [r1]
	movs r1, 0xE7
	lsls r1, 1
	movs r0, 0xA
	bl task_add_01_battle_start
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
	pop {r0}
	bx r0
	.align 2, 0
_08081C80: .4byte gMain
_08081C84: .4byte sub_8081CEC
_08081C88: .4byte gUnknown_020239F8
	thumb_func_end sub_8081C50

	thumb_func_start sub_8081C8C
sub_8081C8C: @ 8081C8C
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	movs r1, 0xA0
	lsls r1, 19
	ldr r2, _08081CC0
	mov r0, sp
	bl CpuSet
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	ldr r0, _08081CC4
	ldrb r0, [r0]
	bl battle_exit_is_player_defeat
	cmp r0, 0x1
	bne _08081CCC
	ldr r0, _08081CC8
	bl SetMainCallback2
	b _08081CD8
	.align 2, 0
_08081CC0: .4byte 0x01000100
_08081CC4: .4byte gUnknown_02024D26
_08081CC8: .4byte c2_whiteout
_08081CCC:
	ldr r0, _08081CE0
	bl SetMainCallback2
	ldr r1, _08081CE4
	ldr r0, _08081CE8
	str r0, [r1]
_08081CD8:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08081CE0: .4byte c2_exit_to_overworld_2_switch
_08081CE4: .4byte gUnknown_0300485C
_08081CE8: .4byte sub_8080E44
	thumb_func_end sub_8081C8C

	thumb_func_start sub_8081CEC
sub_8081CEC: @ 8081CEC
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	movs r1, 0xA0
	lsls r1, 19
	ldr r2, _08081D20
	mov r0, sp
	bl CpuSet
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	ldr r0, _08081D24
	ldrb r0, [r0]
	bl battle_exit_is_player_defeat
	cmp r0, 0x1
	bne _08081D2C
	ldr r0, _08081D28
	bl SetMainCallback2
	b _08081D32
	.align 2, 0
_08081D20: .4byte 0x01000100
_08081D24: .4byte gUnknown_02024D26
_08081D28: .4byte c2_whiteout
_08081D2C:
	ldr r0, _08081D38
	bl SetMainCallback2
_08081D32:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08081D38: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_8081CEC

	thumb_func_start sub_8081D3C
sub_8081D3C: @ 8081D3C
	push {r4,r5,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsTallGrass
	lsls r0, 24
	cmp r0, 0
	beq _08081D72
	movs r0, 0
	b _08081E86
_08081D72:
	adds r0, r4, 0
	bl MetatileBehavior_IsLongGrass
	lsls r0, 24
	cmp r0, 0
	beq _08081D82
	movs r0, 0x1
	b _08081E86
_08081D82:
	adds r0, r4, 0
	bl MetatileBehavior_IsSandOrDeepSand
	lsls r0, 24
	cmp r0, 0
	bne _08081E84
	ldr r0, _08081DA4
	ldrb r0, [r0, 0x17]
	subs r0, 0x1
	cmp r0, 0x8
	bhi _08081E08
	lsls r0, 2
	ldr r1, _08081DA8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08081DA4: .4byte gMapHeader
_08081DA8: .4byte _08081DAC
	.align 2, 0
_08081DAC:
	.4byte _08081E08
	.4byte _08081E08
	.4byte _08081E08
	.4byte _08081DD0
	.4byte _08081DF4
	.4byte _08081DF8
	.4byte _08081E08
	.4byte _08081DE0
	.4byte _08081DE0
_08081DD0:
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80574C4
	lsls r0, 24
	cmp r0, 0
	beq _08081DE4
_08081DE0:
	movs r0, 0x8
	b _08081E86
_08081DE4:
	adds r0, r4, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _08081E4C
	movs r0, 0x7
	b _08081E86
_08081DF4:
	movs r0, 0x3
	b _08081E86
_08081DF8:
	lsls r0, r5, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _08081E5E
	b _08081E7A
_08081E08:
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8057568
	lsls r0, 24
	cmp r0, 0
	bne _08081E5E
	adds r0, r4, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _08081E4C
	adds r0, r4, 0
	bl sub_80574D8
	lsls r0, 24
	cmp r0, 0
	beq _08081E34
	movs r0, 0x6
	b _08081E86
_08081E34:
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08081E62
	adds r0, r4, 0
	bl sub_8057450
	lsls r0, 24
	cmp r0, 0
	beq _08081E50
_08081E4C:
	movs r0, 0x5
	b _08081E86
_08081E50:
	adds r0, r4, 0
	bl sub_8057434
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08081E62
_08081E5E:
	movs r0, 0x4
	b _08081E86
_08081E62:
	ldr r0, _08081E80
	ldrh r1, [r0, 0x4]
	movs r0, 0xE0
	lsls r0, 5
	cmp r1, r0
	beq _08081E84
	bl sav1_get_weather_probably
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	beq _08081E84
_08081E7A:
	movs r0, 0x9
	b _08081E86
	.align 2, 0
_08081E80: .4byte gSaveBlock1
_08081E84:
	movs r0, 0x2
_08081E86:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8081D3C

	thumb_func_start sub_8081E90
sub_8081E90: @ 8081E90
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r4, r0, 16
	bl sav1_get_flash_used_on_map
	lsls r0, 24
	cmp r0, 0
	beq _08081EC0
	movs r0, 0x2
	b _08081EEA
_08081EC0:
	lsls r0, r4, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _08081EE8
	ldr r0, _08081EE0
	ldrb r0, [r0, 0x17]
	cmp r0, 0x4
	beq _08081EE4
	cmp r0, 0x5
	beq _08081EE8
	movs r0, 0
	b _08081EEA
	.align 2, 0
_08081EE0: .4byte gMapHeader
_08081EE4:
	movs r0, 0x1
	b _08081EEA
_08081EE8:
	movs r0, 0x3
_08081EEA:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8081E90

	thumb_func_start sub_8081EF4
sub_8081EF4: @ 8081EF4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r7, 0
	movs r6, 0
_08081EFE:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _08081F50
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	adds r1, r0, 0
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	beq _08081F42
	cmp r1, 0
	beq _08081F42
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08081F42
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	adds r0, r7, r0
	lsls r0, 24
	lsrs r7, r0, 24
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _08081F48
_08081F42:
	adds r6, 0x1
	cmp r6, 0x5
	ble _08081EFE
_08081F48:
	adds r0, r7, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08081F50: .4byte gPlayerParty
	thumb_func_end sub_8081EF4

	thumb_func_start reads_trainer_data_byte0
reads_trainer_data_byte0: @ 8081F54
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r5, _08081F88
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r5
	adds r0, r2, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, r4
	bcs _08081F74
	adds r4, r0, 0
_08081F74:
	movs r3, 0
	ldrb r0, [r2]
	cmp r0, 0x1
	beq _08081FBC
	cmp r0, 0x1
	bgt _08081F8C
	cmp r0, 0
	beq _08081F96
	b _0808202C
	.align 2, 0
_08081F88: .4byte gTrainers
_08081F8C:
	cmp r0, 0x2
	beq _08081FE2
	cmp r0, 0x3
	beq _08082008
	b _0808202C
_08081F96:
	adds r0, r5, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r1, [r0]
	movs r2, 0
	cmp r3, r4
	bcs _0808202C
_08081FA4:
	lsls r0, r2, 3
	adds r0, r1
	ldrb r0, [r0, 0x2]
	adds r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _08081FA4
	b _0808202C
_08081FBC:
	adds r0, r5, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r1, [r0]
	movs r2, 0
	cmp r3, r4
	bcs _0808202C
_08081FCA:
	lsls r0, r2, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	adds r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _08081FCA
	b _0808202C
_08081FE2:
	adds r0, r5, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r1, [r0]
	movs r2, 0
	cmp r3, r4
	bcs _0808202C
_08081FF0:
	lsls r0, r2, 3
	adds r0, r1
	ldrb r0, [r0, 0x2]
	adds r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _08081FF0
	b _0808202C
_08082008:
	adds r0, r5, 0
	adds r0, 0x24
	adds r0, r1, r0
	ldr r1, [r0]
	movs r2, 0
	cmp r3, r4
	bcs _0808202C
_08082016:
	lsls r0, r2, 4
	adds r0, r1
	ldrb r0, [r0, 0x2]
	adds r0, r3, r0
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bcc _08082016
_0808202C:
	adds r0, r3, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end reads_trainer_data_byte0

	thumb_func_start sub_8082034
sub_8082034: @ 8082034
	push {r4,r5,lr}
	bl sub_8081E90
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08082064
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl sub_8081EF4
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _0808206C
	ldr r0, _08082068
	lsls r1, r5, 1
	adds r0, 0x1
	b _08082070
	.align 2, 0
_08082064: .4byte gEnemyParty
_08082068: .4byte gUnknown_0839ACF8
_0808206C:
	ldr r0, _0808207C
	lsls r1, r5, 1
_08082070:
	adds r1, r0
	ldrb r0, [r1]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808207C: .4byte gUnknown_0839ACF8
	thumb_func_end sub_8082034

	thumb_func_start sub_8082080
sub_8082080: @ 8082080
	push {r4-r6,lr}
	ldr r4, _080820AC
	ldrh r1, [r4]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	beq _080820E4
	ldr r1, _080820B0
	ldrh r2, [r4]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x1]
	cmp r1, 0x18
	bne _080820E0
	adds r1, r2, 0
	ldr r0, _080820B4
	cmp r1, r0
	bne _080820B8
	movs r0, 0xC
	b _0808212C
	.align 2, 0
_080820AC: .4byte word_202FF5E
_080820B0: .4byte gTrainers
_080820B4: .4byte 0x00000105
_080820B8:
	movs r0, 0x83
	lsls r0, 1
	cmp r1, r0
	bne _080820C4
	movs r0, 0xD
	b _0808212C
_080820C4:
	ldr r0, _080820D0
	cmp r1, r0
	bne _080820D4
	movs r0, 0xE
	b _0808212C
	.align 2, 0
_080820D0: .4byte 0x00000107
_080820D4:
	movs r0, 0x84
	lsls r0, 1
	cmp r1, r0
	bne _080820E4
	movs r0, 0xF
	b _0808212C
_080820E0:
	cmp r1, 0x20
	bne _080820E8
_080820E4:
	movs r0, 0x10
	b _0808212C
_080820E8:
	ldrb r0, [r0, 0x18]
	movs r5, 0x1
	cmp r0, 0x1
	bne _080820F2
	movs r5, 0x2
_080820F2:
	bl sub_8081E90
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r4]
	adds r1, r5, 0
	bl reads_trainer_data_byte0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl sub_8081EF4
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _08082124
	ldr r0, _08082120
	lsls r1, r6, 1
	adds r0, 0x1
	b _08082128
	.align 2, 0
_08082120: .4byte gUnknown_0839AD00
_08082124:
	ldr r0, _08082134
	lsls r1, r6, 1
_08082128:
	adds r1, r0
	ldrb r0, [r1]
_0808212C:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08082134: .4byte gUnknown_0839AD00
	thumb_func_end sub_8082080

	thumb_func_start sub_8082138
sub_8082138: @ 8082138
	push {r4,lr}
	ldr r0, _0808215C
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl sub_8081EF4
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _08082160
	movs r0, 0x3
	b _08082162
	.align 2, 0
_0808215C: .4byte gEnemyParty
_08082160:
	movs r0, 0x4
_08082162:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8082138

	thumb_func_start sub_8082168
sub_8082168: @ 8082168
	push {lr}
	ldr r0, _0808217C
	bl SetMainCallback2
	ldr r1, _08082180
	ldr r0, _08082184
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0808217C: .4byte CB2_ChooseStarter
_08082180: .4byte gMain
_08082184: .4byte sub_8082188
	thumb_func_end sub_8082168

	thumb_func_start sub_8082188
sub_8082188: @ 8082188
	push {lr}
	sub sp, 0x8
	ldr r0, _080821CC
	bl GetVarPointer
	ldr r2, _080821D0
	ldrh r1, [r2]
	strh r1, [r0]
	ldrh r0, [r2]
	bl GetStarterPokemon
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0x5
	movs r2, 0
	movs r3, 0
	bl sub_80C5374
	bl ResetTasks
	bl sub_80408BC
	ldr r0, _080821D4
	bl SetMainCallback2
	movs r0, 0
	bl sub_811AAD8
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080821CC: .4byte 0x00004023
_080821D0: .4byte gScriptResult
_080821D4: .4byte sub_80821D8
	thumb_func_end sub_8082188

	thumb_func_start sub_80821D8
sub_80821D8: @ 80821D8
	push {lr}
	bl UpdatePaletteFade
	bl RunTasks
	bl sub_811AAE8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082214
	ldr r1, _08082218
	movs r0, 0x10
	strh r0, [r1]
	ldr r1, _0808221C
	ldr r0, _08082220
	str r0, [r1, 0x8]
	ldr r0, _08082224
	bl SetMainCallback2
	bl prev_quest_postbuffer_cursor_backup_reset
	bl overworld_poison_timer_set
	movs r0, 0x7
	bl sav12_xor_increment
	movs r0, 0x8
	bl sav12_xor_increment
_08082214:
	pop {r0}
	bx r0
	.align 2, 0
_08082218: .4byte gUnknown_020239F8
_0808221C: .4byte gMain
_08082220: .4byte sub_8082228
_08082224: .4byte sub_800E7C4
	thumb_func_end sub_80821D8

	thumb_func_start sub_8082228
sub_8082228: @ 8082228
	push {lr}
	bl sav1_reset_battle_music_maybe
	ldr r0, _08082238
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08082238: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_8082228

	thumb_func_start TrainerBattleLoadArg32
TrainerBattleLoadArg32: @ 808223C
	adds r2, r0, 0
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	orrs r0, r1
	ldrb r1, [r2, 0x2]
	lsls r1, 16
	orrs r0, r1
	ldrb r1, [r2, 0x3]
	lsls r1, 24
	orrs r0, r1
	bx lr
	thumb_func_end TrainerBattleLoadArg32

	thumb_func_start TrainerBattleLoadArg16
TrainerBattleLoadArg16: @ 8082254
	adds r1, r0, 0
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	lsls r1, 8
	orrs r0, r1
	bx lr
	thumb_func_end TrainerBattleLoadArg16

	thumb_func_start TrainerBattleLoadArg8
TrainerBattleLoadArg8: @ 8082260
	ldrb r0, [r0]
	bx lr
	thumb_func_end TrainerBattleLoadArg8

	thumb_func_start trainerflag_opponent
trainerflag_opponent: @ 8082264
	ldr r1, _08082278
	movs r2, 0xA0
	lsls r2, 3
	adds r0, r2, 0
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bx lr
	.align 2, 0
_08082278: .4byte word_202FF5E
	thumb_func_end trainerflag_opponent

	thumb_func_start battle_exit_is_player_defeat
battle_exit_is_player_defeat: @ 808227C
	push {lr}
	subs r0, 0x1
	cmp r0, 0x6
	bhi _080822B4
	lsls r0, 2
	ldr r1, _08082290
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082290: .4byte _08082294
	.align 2, 0
_08082294:
	.4byte _080822B4
	.4byte _080822B0
	.4byte _080822B0
	.4byte _080822B4
	.4byte _080822B4
	.4byte _080822B4
	.4byte _080822B4
_080822B0:
	movs r0, 0x1
	b _080822B6
_080822B4:
	movs r0, 0
_080822B6:
	pop {r1}
	bx r1
	thumb_func_end battle_exit_is_player_defeat

	thumb_func_start sub_80822BC
sub_80822BC: @ 80822BC
	ldr r0, _080822E8
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080822EC
	strh r1, [r0]
	ldr r0, _080822F0
	strh r1, [r0]
	ldr r0, _080822F4
	movs r1, 0
	str r1, [r0]
	ldr r0, _080822F8
	str r1, [r0]
	ldr r0, _080822FC
	str r1, [r0]
	ldr r0, _08082300
	str r1, [r0]
	ldr r0, _08082304
	str r1, [r0]
	ldr r0, _08082308
	str r1, [r0]
	bx lr
	.align 2, 0
_080822E8: .4byte gUnknown_0202FF5C
_080822EC: .4byte word_202FF5E
_080822F0: .4byte gUnknown_0202FF60
_080822F4: .4byte gUnknown_0202FF64
_080822F8: .4byte gUnknown_0202FF68
_080822FC: .4byte gUnknown_0202FF6C
_08082300: .4byte gUnknown_0202FF70
_08082304: .4byte gUnknown_0202FF74
_08082308: .4byte gUnknown_0202FF78
	thumb_func_end sub_80822BC

	thumb_func_start TrainerBattleLoadArgs
TrainerBattleLoadArgs: @ 808230C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
_08082312:
	ldrb r0, [r4, 0x4]
	cmp r0, 0x6
	bhi _08082384
	lsls r0, 2
	ldr r1, _08082324
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082324: .4byte _08082328
	.align 2, 0
_08082328:
	.4byte _08082344
	.4byte _08082352
	.4byte _08082360
	.4byte _0808236E
	.4byte _08082376
	.4byte _0808237E
	.4byte _08082388
_08082344:
	adds r0, r5, 0
	bl TrainerBattleLoadArg8
	ldr r1, [r4]
	strb r0, [r1]
	adds r5, 0x1
	b _08082384
_08082352:
	adds r0, r5, 0
	bl TrainerBattleLoadArg16
	ldr r1, [r4]
	strh r0, [r1]
	adds r5, 0x2
	b _08082384
_08082360:
	adds r0, r5, 0
	bl TrainerBattleLoadArg32
	ldr r1, [r4]
	str r0, [r1]
	adds r5, 0x4
	b _08082384
_0808236E:
	ldr r1, [r4]
	movs r0, 0
	strb r0, [r1]
	b _08082384
_08082376:
	ldr r1, [r4]
	movs r0, 0
	strh r0, [r1]
	b _08082384
_0808237E:
	ldr r1, [r4]
	movs r0, 0
	str r0, [r1]
_08082384:
	adds r4, 0x8
	b _08082312
_08082388:
	ldr r0, [r4]
	str r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end TrainerBattleLoadArgs

	thumb_func_start battle_80801F0
battle_80801F0: @ 8082394
	push {lr}
	ldr r0, _080823B8
	ldrh r1, [r0]
	cmp r1, 0
	beq _080823B4
	ldr r0, _080823BC
	strh r1, [r0]
	lsls r0, r1, 24
	lsrs r0, 24
	ldr r2, _080823C0
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl GetFieldObjectIdByLocalIdAndMap
	ldr r1, _080823C4
	strb r0, [r1]
_080823B4:
	pop {r0}
	bx r0
	.align 2, 0
_080823B8: .4byte gUnknown_0202FF60
_080823BC: .4byte gUnknown_0202E8DE
_080823C0: .4byte gSaveBlock1
_080823C4: .4byte gSelectedMapObject
	thumb_func_end battle_80801F0

	thumb_func_start sub_80823C8
sub_80823C8: @ 80823C8
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80822BC
	ldr r4, _080823F0
	adds r0, r5, 0
	bl TrainerBattleLoadArg8
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldrh r0, [r4]
	subs r0, 0x1
	cmp r0, 0x7
	bhi _080824A4
	lsls r0, 2
	ldr r1, _080823F4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080823F0: .4byte gUnknown_0202FF5C
_080823F4: .4byte _080823F8
	.align 2, 0
_080823F8:
	.4byte _08082434
	.4byte _08082434
	.4byte _08082418
	.4byte _0808242C
	.4byte _0808247C
	.4byte _0808243C
	.4byte _08082454
	.4byte _0808243C
_08082418:
	ldr r0, _08082424
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	ldr r0, _08082428
	b _080824B2
	.align 2, 0
_08082424: .4byte gUnknown_0839ADE0
_08082428: .4byte gUnknown_0819F878
_0808242C:
	ldr r0, _08082430
	b _0808243E
	.align 2, 0
_08082430: .4byte gUnknown_0839AD98
_08082434:
	ldr r0, _08082438
	b _080824A6
	.align 2, 0
_08082438: .4byte gUnknown_0839AD50
_0808243C:
	ldr r0, _0808244C
_0808243E:
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r0, _08082450
	b _080824B2
	.align 2, 0
_0808244C: .4byte gUnknown_0839AE28
_08082450: .4byte gUnknown_0819F840
_08082454:
	ldr r0, _08082470
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r4, _08082474
	ldrh r0, [r4]
	bl sub_8082C4C
	strh r0, [r4]
	ldr r0, _08082478
	b _080824B2
	.align 2, 0
_08082470: .4byte gUnknown_0839AD98
_08082474: .4byte word_202FF5E
_08082478: .4byte gUnknown_0819F8AE
_0808247C:
	ldr r0, _08082498
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r4, _0808249C
	ldrh r0, [r4]
	bl sub_8082C4C
	strh r0, [r4]
	ldr r0, _080824A0
	b _080824B2
	.align 2, 0
_08082498: .4byte gUnknown_0839AD08
_0808249C: .4byte word_202FF5E
_080824A0: .4byte gUnknown_0819F887
_080824A4:
	ldr r0, _080824B8
_080824A6:
	adds r1, r5, 0
	bl TrainerBattleLoadArgs
	bl battle_80801F0
	ldr r0, _080824BC
_080824B2:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080824B8: .4byte gUnknown_0839AD08
_080824BC: .4byte gUnknown_0819F818
	thumb_func_end sub_80823C8

	thumb_func_start SingleTrainerWantsBattle
SingleTrainerWantsBattle: @ 80824C0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080824F4
	strb r0, [r2]
	ldr r4, _080824F8
	ldr r3, _080824FC
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrb r0, [r2, 0x8]
	strh r0, [r4]
	adds r1, 0x1
	adds r0, r1, 0
	bl sub_80823C8
	ldr r0, _08082500
	bl ScriptContext1_SetupScript
	bl ScriptContext2_Enable
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080824F4: .4byte gSelectedMapObject
_080824F8: .4byte gUnknown_0202E8DE
_080824FC: .4byte gMapObjects
_08082500: .4byte gUnknown_0819F80B
	thumb_func_end SingleTrainerWantsBattle

	thumb_func_start GetTrainerFlagFromScriptPointer
GetTrainerFlagFromScriptPointer: @ 8082504
	push {lr}
	adds r0, 0x2
	bl TrainerBattleLoadArg16
	lsls r0, 16
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetTrainerFlagFromScriptPointer

	thumb_func_start sub_8082524
sub_8082524: @ 8082524
	push {r4,lr}
	ldr r0, _08082550
	ldrb r0, [r0]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08082554
	adds r4, r0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl npc_set_running_behaviour_etc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082550: .4byte gSelectedMapObject
_08082554: .4byte gMapObjects
	thumb_func_end sub_8082524

	thumb_func_start sub_8082558
sub_8082558: @ 8082558
	ldr r0, _08082560
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08082560: .4byte gUnknown_0202FF5C
	thumb_func_end sub_8082558

	thumb_func_start sub_8082564
sub_8082564: @ 8082564
	push {lr}
	bl trainerflag_opponent
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8082564

	thumb_func_start sub_808257C
sub_808257C: @ 808257C
	push {lr}
	bl trainerflag_opponent
	lsls r0, 16
	lsrs r0, 16
	bl FlagSet
	pop {r0}
	bx r0
	thumb_func_end sub_808257C

	thumb_func_start unref_sub_8082590
unref_sub_8082590: @ 8082590
	push {lr}
	bl trainerflag_opponent
	lsls r0, 16
	lsrs r0, 16
	bl FlagSet
	pop {r0}
	bx r0
	thumb_func_end unref_sub_8082590

	thumb_func_start trainer_flag_check
trainer_flag_check: @ 80825A4
	push {lr}
	lsls r0, 16
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end trainer_flag_check

	thumb_func_start trainer_flag_set
trainer_flag_set: @ 80825BC
	push {lr}
	lsls r0, 16
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	lsrs r0, 16
	bl FlagSet
	pop {r0}
	bx r0
	thumb_func_end trainer_flag_set

	thumb_func_start trainer_flag_clear
trainer_flag_clear: @ 80825D0
	push {lr}
	lsls r0, 16
	movs r1, 0xA0
	lsls r1, 19
	adds r0, r1
	lsrs r0, 16
	bl FlagReset
	pop {r0}
	bx r0
	thumb_func_end trainer_flag_clear

	thumb_func_start sub_80825E4
sub_80825E4: @ 80825E4
	push {lr}
	ldr r1, _08082600
	movs r0, 0x8
	strh r0, [r1]
	ldr r1, _08082604
	ldr r0, _08082608
	str r0, [r1, 0x8]
	bl task_add_01_battle_start_with_music_and_stats
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	.align 2, 0
_08082600: .4byte gUnknown_020239F8
_08082604: .4byte gMain
_08082608: .4byte sub_808260C
	thumb_func_end sub_80825E4

	thumb_func_start sub_808260C
sub_808260C: @ 808260C
	push {lr}
	ldr r0, _08082624
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _0808262C
	ldr r0, _08082628
	bl SetMainCallback2
	b _08082652
	.align 2, 0
_08082624: .4byte word_202FF5E
_08082628: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_0808262C:
	ldr r0, _08082640
	ldrb r0, [r0]
	bl battle_exit_is_player_defeat
	cmp r0, 0x1
	bne _08082648
	ldr r0, _08082644
	bl SetMainCallback2
	b _08082652
	.align 2, 0
_08082640: .4byte gUnknown_02024D26
_08082644: .4byte c2_whiteout
_08082648:
	ldr r0, _08082658
	bl SetMainCallback2
	bl sub_808257C
_08082652:
	pop {r0}
	bx r0
	.align 2, 0
_08082658: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_808260C

	thumb_func_start do_choose_name_or_words_screen
do_choose_name_or_words_screen: @ 808265C
	push {lr}
	ldr r0, _08082674
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _0808267C
	ldr r0, _08082678
	bl SetMainCallback2
	b _080826A6
	.align 2, 0
_08082674: .4byte word_202FF5E
_08082678: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
_0808267C:
	ldr r0, _08082690
	ldrb r0, [r0]
	bl battle_exit_is_player_defeat
	cmp r0, 0x1
	bne _08082698
	ldr r0, _08082694
	bl SetMainCallback2
	b _080826A6
	.align 2, 0
_08082690: .4byte gUnknown_02024D26
_08082694: .4byte c2_whiteout
_08082698:
	ldr r0, _080826AC
	bl SetMainCallback2
	bl sub_808257C
	bl sub_8082CB8
_080826A6:
	pop {r0}
	bx r0
	.align 2, 0
_080826AC: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end do_choose_name_or_words_screen

	thumb_func_start sub_80826B0
sub_80826B0: @ 80826B0
	push {lr}
	ldr r1, _080826CC
	movs r0, 0x8
	strh r0, [r1]
	ldr r1, _080826D0
	ldr r0, _080826D4
	str r0, [r1, 0x8]
	bl task_add_01_battle_start_with_music_and_stats
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	.align 2, 0
_080826CC: .4byte gUnknown_020239F8
_080826D0: .4byte gMain
_080826D4: .4byte do_choose_name_or_words_screen
	thumb_func_end sub_80826B0

	thumb_func_start sub_80826D8
sub_80826D8: @ 80826D8
	push {lr}
	bl sub_808281C
	bl ShowFieldMessage
	pop {r0}
	bx r0
	thumb_func_end sub_80826D8

	thumb_func_start sub_80826E8
sub_80826E8: @ 80826E8
	push {lr}
	ldr r0, _080826F8
	ldr r0, [r0]
	cmp r0, 0
	bne _080826F4
	ldr r0, _080826FC
_080826F4:
	pop {r1}
	bx r1
	.align 2, 0
_080826F8: .4byte gUnknown_0202FF74
_080826FC: .4byte gUnknown_081C6C02
	thumb_func_end sub_80826E8

	thumb_func_start sub_8082700
sub_8082700: @ 8082700
	push {lr}
	ldr r0, _08082710
	ldr r0, [r0]
	cmp r0, 0
	bne _0808270C
	ldr r0, _08082714
_0808270C:
	pop {r1}
	bx r1
	.align 2, 0
_08082710: .4byte gUnknown_0202FF78
_08082714: .4byte gUnknown_081C6C02
	thumb_func_end sub_8082700

	thumb_func_start sub_8082718
sub_8082718: @ 8082718
	push {lr}
	bl sub_8082880
	bl ShowFieldMessage
	pop {r0}
	bx r0
	thumb_func_end sub_8082718

	thumb_func_start sub_8082728
sub_8082728: @ 8082728
	push {lr}
	ldr r0, _08082750
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _08082802
	cmp r0, 0x8
	beq _08082802
	ldr r0, _08082754
	ldrh r0, [r0]
	bl sub_803FC58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD
	bhi _080827FC
	lsls r0, 2
	ldr r1, _08082758
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082750: .4byte gUnknown_0202FF5C
_08082754: .4byte word_202FF5E
_08082758: .4byte _0808275C
	.align 2, 0
_0808275C:
	.4byte _08082794
	.4byte _0808279A
	.4byte _080827A4
	.4byte _080827FC
	.4byte _080827AC
	.4byte _080827B2
	.4byte _080827BC
	.4byte _080827C4
	.4byte _080827CC
	.4byte _080827D4
	.4byte _080827DC
	.4byte _080827E2
	.4byte _080827EC
	.4byte _080827F4
_08082794:
	movs r0, 0xBE
	lsls r0, 1
	b _080827FE
_0808279A:
	ldr r0, _080827A0
	b _080827FE
	.align 2, 0
_080827A0: .4byte 0x00000197
_080827A4:
	ldr r0, _080827A8
	b _080827FE
	.align 2, 0
_080827A8: .4byte 0x0000017b
_080827AC:
	movs r0, 0xD0
	lsls r0, 1
	b _080827FE
_080827B2:
	ldr r0, _080827B8
	b _080827FE
	.align 2, 0
_080827B8: .4byte 0x000001a1
_080827BC:
	ldr r0, _080827C0
	b _080827FE
	.align 2, 0
_080827C0: .4byte 0x000001a3
_080827C4:
	ldr r0, _080827C8
	b _080827FE
	.align 2, 0
_080827C8: .4byte 0x000001b9
_080827CC:
	ldr r0, _080827D0
	b _080827FE
	.align 2, 0
_080827D0: .4byte 0x00000181
_080827D4:
	ldr r0, _080827D8
	b _080827FE
	.align 2, 0
_080827D8: .4byte 0x000001c1
_080827DC:
	movs r0, 0xE1
	lsls r0, 1
	b _080827FE
_080827E2:
	ldr r0, _080827E8
	b _080827FE
	.align 2, 0
_080827E8: .4byte 0x000001c3
_080827EC:
	ldr r0, _080827F0
	b _080827FE
	.align 2, 0
_080827F0: .4byte 0x000001c5
_080827F4:
	ldr r0, _080827F8
	b _080827FE
	.align 2, 0
_080827F8: .4byte 0x0000018d
_080827FC:
	ldr r0, _08082808
_080827FE:
	bl PlayNewMapMusic
_08082802:
	pop {r0}
	bx r0
	.align 2, 0
_08082808: .4byte 0x000001a7
	thumb_func_end sub_8082728

	thumb_func_start ReturnEmptyStringIfNull
ReturnEmptyStringIfNull: @ 808280C
	push {lr}
	cmp r0, 0
	bne _08082814
	ldr r0, _08082818
_08082814:
	pop {r1}
	bx r1
	.align 2, 0
_08082818: .4byte gOtherText_CancelWithTerminator
	thumb_func_end ReturnEmptyStringIfNull

	thumb_func_start sub_808281C
sub_808281C: @ 808281C
	push {lr}
	ldr r0, _0808282C
	ldr r0, [r0]
	bl ReturnEmptyStringIfNull
	pop {r1}
	bx r1
	.align 2, 0
_0808282C: .4byte gUnknown_0202FF64
	thumb_func_end sub_808281C

	thumb_func_start sub_8082830
sub_8082830: @ 8082830
	push {r4,lr}
	ldr r0, _08082844
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 3
	cmp r1, r0
	bne _08082848
	bl sub_80BCCE8
	b _0808284C
	.align 2, 0
_08082844: .4byte word_202FF5E
_08082848:
	ldr r0, _08082864
	ldr r0, [r0]
_0808284C:
	ldr r4, _08082868
	bl ReturnEmptyStringIfNull
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringExpandPlaceholders
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08082864: .4byte gUnknown_0202FF68
_08082868: .4byte gStringVar4
	thumb_func_end sub_8082830

	thumb_func_start unref_sub_808286C
unref_sub_808286C: @ 808286C
	push {lr}
	ldr r0, _0808287C
	ldr r0, [r0]
	bl ReturnEmptyStringIfNull
	pop {r1}
	bx r1
	.align 2, 0
_0808287C: .4byte gUnknown_0202FF6C
	thumb_func_end unref_sub_808286C

	thumb_func_start sub_8082880
sub_8082880: @ 8082880
	push {lr}
	ldr r0, _08082890
	ldr r0, [r0]
	bl ReturnEmptyStringIfNull
	pop {r1}
	bx r1
	.align 2, 0
_08082890: .4byte gUnknown_0202FF70
	thumb_func_end sub_8082880

	thumb_func_start sub_8082894
sub_8082894: @ 8082894
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	movs r3, 0
	adds r2, r0, 0
_0808289E:
	ldrh r0, [r2]
	cmp r0, r1
	bne _080828A8
	adds r0, r3, 0
	b _080828B4
_080828A8:
	adds r2, 0x10
	adds r3, 0x1
	cmp r3, 0x37
	ble _0808289E
	movs r0, 0x1
	negs r0, r0
_080828B4:
	pop {r1}
	bx r1
	thumb_func_end sub_8082894

	thumb_func_start sub_80828B8
sub_80828B8: @ 80828B8
	push {r4,r5,lr}
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
	adds r2, r0, 0
_080828C2:
	movs r1, 0
	ldrh r0, [r2]
	cmp r0, 0
	beq _080828E8
	movs r3, 0
_080828CC:
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, r5
	bne _080828D8
	adds r0, r4, 0
	b _080828F4
_080828D8:
	adds r3, 0x2
	adds r1, 0x1
	cmp r1, 0x4
	bgt _080828E8
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, 0
	bne _080828CC
_080828E8:
	adds r2, 0x10
	adds r4, 0x1
	cmp r4, 0x37
	ble _080828C2
	movs r0, 0x1
	negs r0, r0
_080828F4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80828B8

	thumb_func_start sub_80828FC
sub_80828FC: @ 80828FC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	movs r4, 0
	movs r5, 0
	ldr r0, _08082968
	mov r9, r0
_0808291E:
	lsls r0, r5, 4
	adds r2, r0, r7
	ldrh r1, [r2, 0xA]
	adds r6, r0, 0
	adds r0, r5, 0x1
	mov r8, r0
	ldr r0, [sp]
	cmp r1, r0
	bne _08082990
	ldrh r0, [r2, 0xC]
	cmp r0, r10
	bne _08082990
	mov r1, r9
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0808298E
	ldrh r0, [r2]
	bl trainer_flag_check
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082990
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1E
	bhi _08082990
	movs r4, 0x1
	b _0808296E
	.align 2, 0
_08082968: .4byte gSaveBlock1 + 0x97A
_0808296C:
	adds r4, 0x1
_0808296E:
	cmp r4, 0x4
	bgt _08082988
	adds r0, r6, r7
	lsls r1, r4, 1
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, 0
	beq _08082988
	bl trainer_flag_check
	lsls r0, 24
	cmp r0, 0
	bne _0808296C
_08082988:
	mov r1, r9
	adds r0, r5, r1
	strb r4, [r0]
_0808298E:
	movs r4, 0x1
_08082990:
	mov r5, r8
	cmp r5, 0x37
	ble _0808291E
	adds r0, r4, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80828FC

	thumb_func_start sub_80829A8
sub_80829A8: @ 80829A8
	push {r4,r5,lr}
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	movs r1, 0
	ldr r5, _080829D4
	adds r3, r0, 0
	adds r3, 0xA
_080829BA:
	ldrh r0, [r3]
	cmp r0, r4
	bne _080829D8
	ldrh r0, [r3, 0x2]
	cmp r0, r2
	bne _080829D8
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, 0
	beq _080829D8
	movs r0, 0x1
	b _080829E2
	.align 2, 0
_080829D4: .4byte gSaveBlock1 + 0x97A
_080829D8:
	adds r3, 0x10
	adds r1, 0x1
	cmp r1, 0x37
	ble _080829BA
	movs r0, 0
_080829E2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80829A8

	thumb_func_start sub_80829E8
sub_80829E8: @ 80829E8
	push {r4,lr}
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	movs r1, 0
	adds r3, r0, 0
	adds r3, 0xA
_080829F8:
	ldrh r0, [r3]
	cmp r0, r4
	bne _08082A08
	ldrh r0, [r3, 0x2]
	cmp r0, r2
	bne _08082A08
	movs r0, 0x1
	b _08082A12
_08082A08:
	adds r3, 0x10
	adds r1, 0x1
	cmp r1, 0x37
	ble _080829F8
	movs r0, 0
_08082A12:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80829E8

	thumb_func_start sub_8082A18
sub_8082A18: @ 8082A18
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_8082894
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08082A4C
	cmp r1, 0x63
	bgt _08082A4C
	ldr r0, _08082A44
	ldr r2, _08082A48
	adds r0, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _08082A4C
	movs r0, 0x1
	b _08082A4E
	.align 2, 0
_08082A44: .4byte gSaveBlock1
_08082A48: .4byte 0x0000097a
_08082A4C:
	movs r0, 0
_08082A4E:
	pop {r1}
	bx r1
	thumb_func_end sub_8082A18

	thumb_func_start sub_8082A54
sub_8082A54: @ 8082A54
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_80828B8
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08082A88
	cmp r1, 0x63
	bgt _08082A88
	ldr r0, _08082A80
	ldr r2, _08082A84
	adds r0, r2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	beq _08082A88
	movs r0, 0x1
	b _08082A8A
	.align 2, 0
_08082A80: .4byte gSaveBlock1
_08082A84: .4byte 0x0000097a
_08082A88:
	movs r0, 0
_08082A8A:
	pop {r1}
	bx r1
	thumb_func_end sub_8082A54

	thumb_func_start sub_8082A90
sub_8082A90: @ 8082A90
	push {r4-r7,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	bl sub_8082894
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _08082AB8
	movs r0, 0
	b _08082ADE
_08082AAA:
	subs r0, r6, 0x1
	lsls r0, 1
	adds r0, r7, r0
	ldrh r0, [r0]
	b _08082ADE
_08082AB4:
	ldrh r0, [r5]
	b _08082ADE
_08082AB8:
	lsls r0, r1, 4
	adds r7, r4, r0
	movs r6, 0x1
	adds r5, r7, 0x2
	adds r4, r5, 0
_08082AC2:
	ldrh r0, [r4]
	cmp r0, 0
	beq _08082AAA
	bl trainer_flag_check
	lsls r0, 24
	cmp r0, 0
	beq _08082AB4
	adds r4, 0x2
	adds r5, 0x2
	adds r6, 0x1
	cmp r6, 0x4
	ble _08082AC2
	ldrh r0, [r7, 0x8]
_08082ADE:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8082A90

	thumb_func_start sub_8082AE4
sub_8082AE4: @ 8082AE4
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl sub_80828B8
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08082B04
	ldr r0, _08082B08
	ldr r2, _08082B0C
	adds r0, r2
	adds r0, r1, r0
	movs r1, 0
	strb r1, [r0]
_08082B04:
	pop {r0}
	bx r0
	.align 2, 0
_08082B08: .4byte gSaveBlock1
_08082B0C: .4byte 0x0000097a
	thumb_func_end sub_8082AE4

	thumb_func_start sub_8082B10
sub_8082B10: @ 8082B10
	push {r4,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	bl sub_8082894
	adds r1, r0, 0
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08082B3A
	lsls r0, r1, 4
	adds r0, r4
	ldrh r0, [r0, 0x2]
	bl trainer_flag_check
	lsls r0, 24
	cmp r0, 0
	beq _08082B3A
	movs r0, 0x1
	b _08082B3C
_08082B3A:
	movs r0, 0
_08082B3C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8082B10

	thumb_func_start sub_8082B44
sub_8082B44: @ 8082B44
	push {r4-r6,lr}
	movs r6, 0
	movs r5, 0
	ldr r4, _08082B64
_08082B4C:
	ldrh r0, [r4]
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082B68
	adds r6, 0x1
	cmp r6, 0x4
	ble _08082B68
	movs r0, 0x1
	b _08082B72
	.align 2, 0
_08082B64: .4byte gUnknown_0839B1F0
_08082B68:
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x7
	bls _08082B4C
	movs r0, 0
_08082B72:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8082B44

	thumb_func_start sub_8082B78
sub_8082B78: @ 8082B78
	push {lr}
	bl sub_8082B44
	cmp r0, 0
	beq _08082BA0
	ldr r0, _08082B94
	ldr r2, _08082B98
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, 0xFE
	bls _08082B9C
	movs r0, 0xFF
	b _08082B9E
	.align 2, 0
_08082B94: .4byte gSaveBlock1
_08082B98: .4byte 0x00000978
_08082B9C:
	adds r0, 0x1
_08082B9E:
	strh r0, [r1]
_08082BA0:
	pop {r0}
	bx r0
	thumb_func_end sub_8082B78

	thumb_func_start sub_8082BA4
sub_8082BA4: @ 8082BA4
	push {lr}
	bl sub_8082B44
	cmp r0, 0
	beq _08082BC8
	ldr r0, _08082BC0
	ldr r1, _08082BC4
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0xFE
	bls _08082BC8
	movs r0, 0x1
	b _08082BCA
	.align 2, 0
_08082BC0: .4byte gSaveBlock1
_08082BC4: .4byte 0x00000978
_08082BC8:
	movs r0, 0
_08082BCA:
	pop {r1}
	bx r1
	thumb_func_end sub_8082BA4

	thumb_func_start sub_8082BD0
sub_8082BD0: @ 8082BD0
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	bl sub_8082BA4
	cmp r0, 0
	beq _08082BFA
	ldr r0, _08082C00
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_80828FC
	cmp r0, 0x1
	bne _08082BFA
	ldr r0, _08082C04
	ldr r1, _08082C08
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
_08082BFA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082C00: .4byte gTrainerEyeTrainers
_08082C04: .4byte gSaveBlock1
_08082C08: .4byte 0x00000978
	thumb_func_end sub_8082BD0

	thumb_func_start sub_8082C0C
sub_8082C0C: @ 8082C0C
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _08082C28
	adds r1, r3, 0
	bl sub_80829A8
	pop {r1}
	bx r1
	.align 2, 0
_08082C28: .4byte gTrainerEyeTrainers
	thumb_func_end sub_8082C0C

	thumb_func_start unref_sub_8082C2C
unref_sub_8082C2C: @ 8082C2C
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _08082C48
	adds r1, r3, 0
	bl sub_80829E8
	pop {r1}
	bx r1
	.align 2, 0
_08082C48: .4byte gTrainerEyeTrainers
	thumb_func_end unref_sub_8082C2C

	thumb_func_start sub_8082C4C
sub_8082C4C: @ 8082C4C
	push {lr}
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08082C64
	bl sub_8082A90
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08082C64: .4byte gTrainerEyeTrainers
	thumb_func_end sub_8082C4C

	thumb_func_start sub_8082C68
sub_8082C68: @ 8082C68
	push {r4,r5,lr}
	ldr r5, _08082C8C
	ldr r4, _08082C90
	ldrh r1, [r4]
	adds r0, r5, 0
	bl sub_8082A18
	lsls r0, 24
	cmp r0, 0
	bne _08082C94
	ldrh r1, [r4]
	adds r0, r5, 0
	bl sub_8082B10
	lsls r0, 24
	lsrs r0, 24
	b _08082C96
	.align 2, 0
_08082C8C: .4byte gTrainerEyeTrainers
_08082C90: .4byte word_202FF5E
_08082C94:
	movs r0, 0x1
_08082C96:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8082C68

	thumb_func_start sub_8082C9C
sub_8082C9C: @ 8082C9C
	push {lr}
	ldr r0, _08082CB0
	ldr r1, _08082CB4
	ldrh r1, [r1]
	bl sub_8082A54
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08082CB0: .4byte gTrainerEyeTrainers
_08082CB4: .4byte word_202FF5E
	thumb_func_end sub_8082C9C

	thumb_func_start sub_8082CB8
sub_8082CB8: @ 8082CB8
	push {lr}
	ldr r0, _08082CCC
	ldr r1, _08082CD0
	ldrh r1, [r1]
	bl sub_8082AE4
	bl sub_808257C
	pop {r0}
	bx r0
	.align 2, 0
_08082CCC: .4byte gTrainerEyeTrainers
_08082CD0: .4byte word_202FF5E
	thumb_func_end sub_8082CB8

	thumb_func_start sub_8082CD4
sub_8082CD4: @ 8082CD4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r4, _08082D10
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _08082D08
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08082D14
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r6, [r1, 0xA]
	strh r5, [r1, 0xC]
_08082D08:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08082D10: .4byte sub_8082F20
_08082D14: .4byte gTasks
	thumb_func_end sub_8082CD4

	thumb_func_start sub_8082D18
sub_8082D18: @ 8082D18
	push {lr}
	adds r1, r0, 0
	ldr r0, _08082D44
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	movs r0, 0x12
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuDrawTextWindow
	ldr r0, _08082D48
	movs r1, 0x13
	movs r2, 0xB
	movs r3, 0x48
	bl sub_8072BD8
	pop {r0}
	bx r0
	.align 2, 0
_08082D44: .4byte gStringVar1
_08082D48: .4byte gOtherText_PLink
	thumb_func_end sub_8082D18

	thumb_func_start sub_8082D4C
sub_8082D4C: @ 8082D4C
	push {lr}
	movs r0, 0x12
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_8082D4C

	thumb_func_start sub_8082D60
sub_8082D60: @ 8082D60
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08082D88
	adds r1, r0
	adds r5, r1, 0x6
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r4, r0
	beq _08082D94
	cmp r4, 0x1
	bhi _08082D8C
	bl sub_8082D4C
	b _08082D92
	.align 2, 0
_08082D88: .4byte gUnknown_03004B28
_08082D8C:
	adds r0, r4, 0
	bl sub_8082D18
_08082D92:
	strh r4, [r5]
_08082D94:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8082D60

	thumb_func_start sub_8082D9C
sub_8082D9C: @ 8082D9C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	bl GetLinkPlayerDataExchangeStatusTimed
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _08082DEC
	cmp r0, 0x2
	bgt _08082DBC
	cmp r0, 0x1
	beq _08082DC2
	b _08082DEC
_08082DBC:
	cmp r0, 0x3
	beq _08082DE8
	b _08082DEC
_08082DC2:
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r4, r1
	bgt _08082DD6
	cmp r1, r5
	bgt _08082DD6
	movs r0, 0x1
	b _08082DEE
_08082DD6:
	ldr r0, _08082DE4
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	movs r0, 0x4
	b _08082DEE
	.align 2, 0
_08082DE4: .4byte gStringVar1
_08082DE8:
	movs r0, 0x3
	b _08082DEE
_08082DEC:
	movs r0, 0
_08082DEE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8082D9C

	thumb_func_start sub_8082DF4
sub_8082DF4: @ 8082DF4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl HasLinkErrorOccurred
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08082E0A
	movs r0, 0
	b _08082E1A
_08082E0A:
	ldr r0, _08082E20
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08082E24
	str r0, [r1]
	movs r0, 0x1
_08082E1A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08082E20: .4byte gTasks
_08082E24: .4byte sub_8083418
	thumb_func_end sub_8082DF4

	thumb_func_start sub_8082E28
sub_8082E28: @ 8082E28
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08082E58
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08082E64
	bl IsLinkConnectionEstablished
	lsls r0, 24
	cmp r0, 0
	bne _08082E64
	ldr r0, _08082E5C
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08082E60
	str r0, [r1]
	movs r0, 0x1
	b _08082E66
	.align 2, 0
_08082E58: .4byte gMain
_08082E5C: .4byte gTasks
_08082E60: .4byte sub_80833EC
_08082E64:
	movs r0, 0
_08082E66:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8082E28

	thumb_func_start sub_8082E6C
sub_8082E6C: @ 8082E6C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsLinkConnectionEstablished
	lsls r0, 24
	cmp r0, 0
	beq _08082E82
	movs r0, 0x1
	bl SetSuppressLinkErrorMessage
_08082E82:
	ldr r0, _08082E94
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08082E98
	movs r0, 0
	b _08082EA8
	.align 2, 0
_08082E94: .4byte gMain
_08082E98:
	ldr r0, _08082EB0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08082EB4
	str r0, [r1]
	movs r0, 0x1
_08082EA8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08082EB0: .4byte gTasks
_08082EB4: .4byte sub_80833EC
	thumb_func_end sub_8082E6C

	thumb_func_start sub_8082EB8
sub_8082EB8: @ 8082EB8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl GetSioMultiSI
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08082ECE
	movs r0, 0
	b _08082EDE
_08082ECE:
	ldr r0, _08082EE4
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08082EE8
	str r0, [r1]
	movs r0, 0x1
_08082EDE:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08082EE4: .4byte gTasks
_08082EE8: .4byte sub_8083418
	thumb_func_end sub_8082EB8

	thumb_func_start unref_sub_8082EEC
unref_sub_8082EEC: @ 8082EEC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08082F1C
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _08082F16
	movs r0, 0x2
	bl sub_8007E9C
	adds r0, r4, 0
	bl DestroyTask
_08082F16:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082F1C: .4byte gTasks
	thumb_func_end unref_sub_8082EEC

	thumb_func_start sub_8082F20
sub_8082F20: @ 8082F20
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08082F48
	adds r4, r1, r0
	movs r3, 0
	ldrsh r2, [r4, r3]
	cmp r2, 0
	bne _08082F4C
	bl OpenLinkTimed
	bl sub_80082EC
	bl ResetLinkPlayers
	b _08082F58
	.align 2, 0
_08082F48: .4byte gUnknown_03004B28
_08082F4C:
	cmp r2, 0x9
	ble _08082F58
	subs r0, 0x8
	adds r0, r1, r0
	ldr r1, _08082F64
	str r1, [r0]
_08082F58:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08082F64: .4byte sub_8082F68
	thumb_func_end sub_8082F20

	thumb_func_start sub_8082F68
sub_8082F68: @ 8082F68
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	bl sub_8082E28
	cmp r0, 0x1
	beq _08082FDC
	adds r0, r4, 0
	bl sub_8082E6C
	cmp r0, 0x1
	beq _08082FDC
	cmp r5, 0x1
	bls _08082FDC
	movs r0, 0x1
	bl SetSuppressLinkErrorMessage
	ldr r1, _08082FC0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r1
	movs r0, 0
	strh r0, [r4, 0xE]
	bl IsLinkMaster
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08082FCC
	movs r0, 0x15
	bl PlaySE
	ldr r0, _08082FC4
	bl ShowFieldAutoScrollMessage
	ldr r0, _08082FC8
	b _08082FDA
	.align 2, 0
_08082FC0: .4byte gTasks
_08082FC4: .4byte gUnknown_081A4932
_08082FC8: .4byte sub_8082FEC
_08082FCC:
	movs r0, 0x16
	bl PlaySE
	ldr r0, _08082FE4
	bl ShowFieldAutoScrollMessage
	ldr r0, _08082FE8
_08082FDA:
	str r0, [r4]
_08082FDC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082FE4: .4byte gUnknown_081A49B6
_08082FE8: .4byte sub_80831F8
	thumb_func_end sub_8082F68

	thumb_func_start sub_8082FEC
sub_8082FEC: @ 8082FEC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8082E28
	cmp r0, 0x1
	beq _0808302C
	adds r0, r4, 0
	bl sub_8082EB8
	cmp r0, 0x1
	beq _0808302C
	adds r0, r4, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _0808302C
	bl GetFieldMessageBoxMode
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0808302C
	ldr r0, _08083034
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	strh r2, [r1, 0xE]
	ldr r0, _08083038
	str r0, [r1]
_0808302C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083034: .4byte gTasks
_08083038: .4byte sub_808303C
	thumb_func_end sub_8082FEC

	thumb_func_start sub_808303C
sub_808303C: @ 808303C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	mov r8, r0
	ldr r0, _080830D0
	mov r9, r0
	mov r7, r8
	add r7, r9
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	bl sub_8082E28
	cmp r0, 0x1
	beq _080830C2
	adds r0, r4, 0
	bl sub_8082EB8
	cmp r0, 0x1
	beq _080830C2
	adds r0, r4, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _080830C2
	adds r6, r5, 0
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8082D60
	ldr r0, _080830D4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080830C2
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	cmp r5, r0
	blt _080830C2
	adds r0, r6, 0
	bl sub_80081C8
	bl sub_8082D4C
	ldr r0, _080830D8
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	ldr r0, _080830DC
	bl ShowFieldAutoScrollMessage
	mov r0, r9
	subs r0, 0x8
	add r0, r8
	ldr r1, _080830E0
	str r1, [r0]
_080830C2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080830D0: .4byte gUnknown_03004B28
_080830D4: .4byte gMain
_080830D8: .4byte gStringVar1
_080830DC: .4byte gUnknown_081A4975
_080830E0: .4byte sub_80830E4
	thumb_func_end sub_808303C

	thumb_func_start sub_80830E4
sub_80830E4: @ 80830E4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	adds r0, r5, 0
	bl sub_8082E28
	cmp r0, 0x1
	beq _08083178
	adds r0, r5, 0
	bl sub_8082EB8
	cmp r0, 0x1
	beq _08083178
	adds r0, r5, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _08083178
	bl GetFieldMessageBoxMode
	lsls r0, 24
	cmp r0, 0
	bne _08083178
	bl sub_800820C
	adds r4, r0, 0
	bl GetLinkPlayerCount_2
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _08083132
	ldr r0, _08083148
	ldrh r1, [r0, 0x2C]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08083158
_08083132:
	ldr r0, _0808314C
	bl ShowFieldAutoScrollMessage
	ldr r1, _08083150
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08083154
	str r1, [r0]
	b _08083178
	.align 2, 0
_08083148: .4byte gMain
_0808314C: .4byte gUnknown_081A4932
_08083150: .4byte gTasks
_08083154: .4byte sub_8082FEC
_08083158:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08083178
	movs r0, 0x5
	bl PlaySE
	bl sub_8007F4C
	ldr r0, _08083180
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _08083184
	str r0, [r1]
_08083178:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08083180: .4byte gTasks
_08083184: .4byte sub_8083188
	thumb_func_end sub_80830E4

	thumb_func_start sub_8083188
sub_8083188: @ 8083188
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080831CC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	ldrb r7, [r5, 0xA]
	ldrb r6, [r5, 0xC]
	adds r0, r4, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _080831EA
	adds r0, r4, 0
	bl sub_8083444
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080831EA
	bl GetLinkPlayerCount_2
	adds r4, r0, 0
	bl sub_800820C
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _080831D4
	ldr r0, _080831D0
	b _080831E8
	.align 2, 0
_080831CC: .4byte gTasks
_080831D0: .4byte sub_8083418
_080831D4:
	ldr r4, _080831F0
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_8082D9C
	strh r0, [r4]
	lsls r0, 16
	cmp r0, 0
	beq _080831EA
	ldr r0, _080831F4
_080831E8:
	str r0, [r5]
_080831EA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080831F0: .4byte gScriptResult
_080831F4: .4byte sub_8083288
	thumb_func_end sub_8083188

	thumb_func_start sub_80831F8
sub_80831F8: @ 80831F8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08083244
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	ldrb r7, [r5, 0xA]
	ldrb r6, [r5, 0xC]
	adds r0, r4, 0
	bl sub_8082E28
	cmp r0, 0x1
	beq _08083270
	adds r0, r4, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _08083270
	ldr r4, _08083248
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_8082D9C
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _08083270
	cmp r0, 0x3
	bne _08083250
	bl sub_800832C
	bl HideFieldMessageBox
	ldr r0, _0808324C
	b _0808326E
	.align 2, 0
_08083244: .4byte gTasks
_08083248: .4byte gScriptResult
_0808324C: .4byte sub_80833C4
_08083250:
	bl GetLinkPlayerCount_2
	ldr r4, _08083278
	strb r0, [r4]
	bl GetMultiplayerId
	ldr r1, _0808327C
	strb r0, [r1]
	ldrb r0, [r4]
	bl sub_80081C8
	ldr r0, _08083280
	bl sub_8093390
	ldr r0, _08083284
_0808326E:
	str r0, [r5]
_08083270:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083278: .4byte gUnknown_03004864
_0808327C: .4byte gUnknown_03004860
_08083280: .4byte gBlockSendBuffer
_08083284: .4byte sub_8083314
	thumb_func_end sub_80831F8

	thumb_func_start sub_8083288
sub_8083288: @ 8083288
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	adds r0, r4, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _080832F8
	ldr r0, _080832BC
	ldrh r0, [r0]
	cmp r0, 0x3
	bne _080832C8
	bl sub_800832C
	bl HideFieldMessageBox
	ldr r0, _080832C0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080832C4
	str r0, [r1]
	b _080832F8
	.align 2, 0
_080832BC: .4byte gScriptResult
_080832C0: .4byte gTasks
_080832C4: .4byte sub_80833C4
_080832C8:
	bl GetLinkPlayerCount_2
	ldr r4, _08083300
	strb r0, [r4]
	bl GetMultiplayerId
	ldr r1, _08083304
	strb r0, [r1]
	ldrb r0, [r4]
	bl sub_80081C8
	ldr r0, _08083308
	bl sub_8093390
	ldr r1, _0808330C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _08083310
	str r1, [r0]
	movs r0, 0x2
	bl sub_8007E9C
_080832F8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083300: .4byte gUnknown_03004864
_08083304: .4byte gUnknown_03004860
_08083308: .4byte gBlockSendBuffer
_0808330C: .4byte gTasks
_08083310: .4byte sub_8083314
	thumb_func_end sub_8083288

	thumb_func_start sub_8083314
sub_8083314: @ 8083314
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_8082DF4
	cmp r0, 0x1
	beq _080833B6
	bl GetBlockRecievedStatus
	adds r4, r0, 0
	bl sub_8008198
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080833B6
	movs r4, 0
	ldr r6, _0808333C
	b _0808335A
	.align 2, 0
_0808333C: .4byte gUnknown_0202FFC0
_08083340:
	lsls r1, r4, 8
	ldr r0, _08083394
	adds r1, r0
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 3
	adds r0, r6
	movs r2, 0x38
	bl memcpy
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0808335A:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _08083340
	movs r0, 0
	bl SetSuppressLinkErrorMessage
	bl ResetBlockReceivedFlags
	bl HideFieldMessageBox
	ldr r0, _08083398
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _080833A4
	ldr r0, _0808339C
	ldrh r1, [r0]
	ldr r0, _080833A0
	bl sub_8082D4C
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
	b _080833B6
	.align 2, 0
_08083394: .4byte gBlockRecvBuffer
_08083398: .4byte gScriptResult
_0808339C: .4byte gLinkType
_080833A0: .4byte 0x00004411
_080833A4:
	bl sub_800832C
	ldr r0, _080833BC
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080833C0
	str r0, [r1]
_080833B6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080833BC: .4byte gTasks
_080833C0: .4byte sub_80833C4
	thumb_func_end sub_8083314

	thumb_func_start sub_80833C4
sub_80833C4: @ 80833C4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080833E8
	ldrb r0, [r0]
	cmp r0, 0
	bne _080833E0
	bl sub_8082D4C
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_080833E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080833E8: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_80833C4

	thumb_func_start sub_80833EC
sub_80833EC: @ 80833EC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08083414
	movs r0, 0x5
	strh r0, [r1]
	bl sub_8082D4C
	bl HideFieldMessageBox
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083414: .4byte gScriptResult
	thumb_func_end sub_80833EC

	thumb_func_start sub_8083418
sub_8083418: @ 8083418
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08083440
	movs r0, 0x6
	strh r0, [r1]
	bl sub_8082D4C
	bl HideFieldMessageBox
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083440: .4byte gScriptResult
	thumb_func_end sub_8083418

	thumb_func_start sub_8083444
sub_8083444: @ 8083444
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08083468
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r2
	ldrh r0, [r2, 0x10]
	adds r0, 0x1
	strh r0, [r2, 0x10]
	lsls r0, 16
	movs r1, 0x96
	lsls r1, 18
	cmp r0, r1
	bgt _0808346C
	movs r0, 0
	b _08083472
	.align 2, 0
_08083468: .4byte gTasks
_0808346C:
	ldr r0, _08083478
	str r0, [r2]
	movs r0, 0x1
_08083472:
	pop {r1}
	bx r1
	.align 2, 0
_08083478: .4byte sub_8083418
	thumb_func_end sub_8083444

	thumb_func_start sub_808347C
sub_808347C: @ 808347C
	push {r4,lr}
	movs r3, 0x2
	movs r2, 0x2
	ldr r0, _08083494
	ldrh r0, [r0]
	cmp r0, 0x2
	beq _080834B0
	cmp r0, 0x2
	bgt _08083498
	cmp r0, 0x1
	beq _0808349E
	b _080834CC
	.align 2, 0
_08083494: .4byte gUnknown_0202E8CC
_08083498:
	cmp r0, 0x5
	beq _080834C0
	b _080834CC
_0808349E:
	movs r3, 0x2
	ldr r1, _080834A8
	ldr r4, _080834AC
	b _080834C8
	.align 2, 0
_080834A8: .4byte gLinkType
_080834AC: .4byte 0x00002233
_080834B0:
	movs r3, 0x2
	ldr r1, _080834B8
	ldr r4, _080834BC
	b _080834C8
	.align 2, 0
_080834B8: .4byte gLinkType
_080834BC: .4byte 0x00002244
_080834C0:
	movs r3, 0x4
	movs r2, 0x4
	ldr r1, _080834DC
	ldr r4, _080834E0
_080834C8:
	adds r0, r4, 0
	strh r0, [r1]
_080834CC:
	adds r0, r3, 0
	adds r1, r2, 0
	bl sub_8082CD4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080834DC: .4byte gLinkType
_080834E0: .4byte 0x00002255
	thumb_func_end sub_808347C

	thumb_func_start sub_80834E4
sub_80834E4: @ 80834E4
	push {lr}
	ldr r1, _08083500
	ldr r2, _08083504
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08083508
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x2
	movs r1, 0x2
	bl sub_8082CD4
	pop {r0}
	bx r0
	.align 2, 0
_08083500: .4byte gLinkType
_08083504: .4byte 0x00001133
_08083508: .4byte gUnknown_020239F8
	thumb_func_end sub_80834E4

	thumb_func_start sub_808350C
sub_808350C: @ 808350C
	push {lr}
	ldr r0, _0808352C
	movs r2, 0
	strh r2, [r0]
	ldr r1, _08083530
	ldr r3, _08083534
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _08083538
	strh r2, [r0]
	movs r0, 0x2
	movs r1, 0x4
	bl sub_8082CD4
	pop {r0}
	bx r0
	.align 2, 0
_0808352C: .4byte gScriptResult
_08083530: .4byte gLinkType
_08083534: .4byte 0x00003311
_08083538: .4byte gUnknown_020239F8
	thumb_func_end sub_808350C

	thumb_func_start sub_808353C
sub_808353C: @ 808353C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0808355C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08083560
	cmp r0, 0x1
	beq _080835BC
	b _080835CE
	.align 2, 0
_0808355C: .4byte gTasks
_08083560:
	ldr r0, _08083594
	ldrh r0, [r0]
	cmp r0, 0x1
	bne _08083586
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	cmp r1, r0
	bge _08083586
	ldr r2, _08083598
_08083578:
	ldrh r4, [r2, 0x1A]
	cmp r4, 0x1
	beq _0808359C
	adds r2, 0x1C
	adds r1, 0x1
	cmp r1, r0
	blt _08083578
_08083586:
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
	b _080835CE
	.align 2, 0
_08083594: .4byte gScriptResult
_08083598: .4byte gLinkPlayers
_0808359C:
	ldr r1, _080835B4
	movs r0, 0x7
	strh r0, [r1]
	bl sub_8008480
	ldr r1, _080835B8
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x8]
	b _080835CE
	.align 2, 0
_080835B4: .4byte gScriptResult
_080835B8: .4byte gTasks
_080835BC:
	ldr r0, _080835D4
	ldrb r0, [r0]
	cmp r0, 0
	bne _080835CE
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
_080835CE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080835D4: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_808353C

	thumb_func_start sub_80835D8
sub_80835D8: @ 80835D8
	push {r4,lr}
	ldr r4, _0808360C
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _08083604
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08083610
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
_08083604:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808360C: .4byte sub_808353C
_08083610: .4byte gTasks
	thumb_func_end sub_80835D8

	thumb_func_start sub_8083614
sub_8083614: @ 8083614
	push {lr}
	ldr r1, _08083630
	ldr r2, _08083634
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08083638
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	bl sub_8082CD4
	pop {r0}
	bx r0
	.align 2, 0
_08083630: .4byte gLinkType
_08083634: .4byte 0x00004411
_08083638: .4byte gUnknown_020239F8
	thumb_func_end sub_8083614

	thumb_func_start sub_808363C
sub_808363C: @ 808363C
	push {lr}
	ldr r1, _08083658
	ldr r2, _0808365C
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _08083660
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x4
	movs r1, 0x4
	bl sub_8082CD4
	pop {r0}
	bx r0
	.align 2, 0
_08083658: .4byte gLinkType
_0808365C: .4byte 0x00006601
_08083660: .4byte gUnknown_020239F8
	thumb_func_end sub_808363C

	thumb_func_start sub_8083664
sub_8083664: @ 8083664
	push {lr}
	ldr r0, _08083678
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	beq _0808367C
	movs r0, 0xFF
	b _08083700
	.align 2, 0
_08083678: .4byte sub_8083710
_0808367C:
	ldr r0, _08083690
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x4
	bhi _080836F4
	lsls r0, 2
	ldr r1, _08083694
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08083690: .4byte gUnknown_0202E8CC
_08083694: .4byte _08083698
	.align 2, 0
_08083698:
	.4byte _080836AC
	.4byte _080836BC
	.4byte _080836DC
	.4byte _080836EC
	.4byte _080836CC
_080836AC:
	ldr r1, _080836B4
	ldr r2, _080836B8
	b _080836F0
	.align 2, 0
_080836B4: .4byte gLinkType
_080836B8: .4byte 0x00002233
_080836BC:
	ldr r1, _080836C4
	ldr r2, _080836C8
	b _080836F0
	.align 2, 0
_080836C4: .4byte gLinkType
_080836C8: .4byte 0x00002244
_080836CC:
	ldr r1, _080836D4
	ldr r2, _080836D8
	b _080836F0
	.align 2, 0
_080836D4: .4byte gLinkType
_080836D8: .4byte 0x00002255
_080836DC:
	ldr r1, _080836E4
	ldr r2, _080836E8
	b _080836F0
	.align 2, 0
_080836E4: .4byte gLinkType
_080836E8: .4byte 0x00001111
_080836EC:
	ldr r1, _08083704
	ldr r2, _08083708
_080836F0:
	adds r0, r2, 0
	strh r0, [r1]
_080836F4:
	ldr r0, _0808370C
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
_08083700:
	pop {r1}
	bx r1
	.align 2, 0
_08083704: .4byte gLinkType
_08083708: .4byte 0x00003322
_0808370C: .4byte sub_8083710
	thumb_func_end sub_8083664

	thumb_func_start sub_8083710
sub_8083710: @ 8083710
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0808373C
	adds r4, r1, r0
	movs r3, 0
	ldrsh r2, [r4, r3]
	cmp r2, 0
	bne _08083744
	bl OpenLink
	bl ResetLinkPlayers
	ldr r0, _08083740
	movs r1, 0x50
	bl CreateTask
	b _08083750
	.align 2, 0
_0808373C: .4byte gUnknown_03004B28
_08083740: .4byte sub_8083C50
_08083744:
	cmp r2, 0x9
	ble _08083750
	subs r0, 0x8
	adds r0, r1, r0
	ldr r1, _0808375C
	str r1, [r0]
_08083750:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808375C: .4byte sub_8083760
	thumb_func_end sub_8083710

	thumb_func_start sub_8083760
sub_8083760: @ 8083760
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl GetLinkPlayerCount_2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _080837A6
	bl IsLinkMaster
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08083798
	ldr r0, _08083790
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _08083794
	b _080837A4
	.align 2, 0
_08083790: .4byte gTasks
_08083794: .4byte sub_80837B4
_08083798:
	ldr r0, _080837AC
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080837B0
_080837A4:
	str r0, [r1]
_080837A6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080837AC: .4byte gTasks
_080837B0: .4byte sub_80837EC
	thumb_func_end sub_8083760

	thumb_func_start sub_80837B4
sub_80837B4: @ 80837B4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_800820C
	adds r4, r0, 0
	bl GetLinkPlayerCount_2
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080837DE
	bl sub_8007F4C
	ldr r0, _080837E4
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080837E8
	str r0, [r1]
_080837DE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080837E4: .4byte gTasks
_080837E8: .4byte sub_80837EC
	thumb_func_end sub_80837B4

	thumb_func_start sub_80837EC
sub_80837EC: @ 80837EC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808381C
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08083814
	bl IsLinkPlayerDataExchangeComplete
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08083814
	bl sub_800826C
	bl sub_8007B14
	adds r0, r4, 0
	bl DestroyTask
_08083814:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808381C: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_80837EC

	thumb_func_start sub_8083820
sub_8083820: @ 8083820
	push {lr}
	bl InitSaveDialog
	pop {r0}
	bx r0
	thumb_func_end sub_8083820

	thumb_func_start sub_808382C
sub_808382C: @ 808382C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08083850
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _08083846
	b _08083940
_08083846:
	lsls r0, 2
	ldr r1, _08083854
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08083850: .4byte gTasks
_08083854: .4byte _08083858
	.align 2, 0
_08083858:
	.4byte _08083870
	.4byte _08083890
	.4byte _080838A0
	.4byte _080838B0
	.4byte _080838B6
	.4byte _080838CC
_08083870:
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r1, _08083888
	ldr r2, _0808388C
	adds r0, r2, 0
	strh r0, [r1]
	bl ClearLinkCallback_2
	b _080838BE
	.align 2, 0
_08083888: .4byte gLinkType
_0808388C: .4byte 0x00002211
_08083890:
	ldr r0, _0808389C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	b _080838BA
	.align 2, 0
_0808389C: .4byte gPaletteFade
_080838A0:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _08083940
	b _080838BE
_080838B0:
	bl sub_800832C
	b _080838BE
_080838B6:
	ldr r0, _080838C8
	ldrb r0, [r0]
_080838BA:
	cmp r0, 0
	bne _08083940
_080838BE:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08083940
	.align 2, 0
_080838C8: .4byte gReceivedRemoteLinkPlayers
_080838CC:
	ldr r0, _080838E4
	ldr r0, [r0, 0x4]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080838E8
	movs r0, 0xE6
	lsls r0, 1
	bl current_map_music_set__default_for_battle
	b _080838EE
	.align 2, 0
_080838E4: .4byte gLinkPlayers
_080838E8:
	ldr r0, _08083900
	bl current_map_music_set__default_for_battle
_080838EE:
	ldr r0, _08083904
	ldrh r0, [r0]
	cmp r0, 0x2
	beq _08083918
	cmp r0, 0x2
	bgt _08083908
	cmp r0, 0x1
	beq _0808390E
	b _0808392E
	.align 2, 0
_08083900: .4byte 0x000001cb
_08083904: .4byte gUnknown_0202E8CC
_08083908:
	cmp r0, 0x5
	beq _08083924
	b _0808392E
_0808390E:
	ldr r1, _08083914
	movs r0, 0xA
	b _0808392C
	.align 2, 0
_08083914: .4byte gUnknown_020239F8
_08083918:
	ldr r1, _08083920
	movs r0, 0xB
	b _0808392C
	.align 2, 0
_08083920: .4byte gUnknown_020239F8
_08083924:
	bl sub_80C5604
	ldr r1, _08083948
	movs r0, 0x4B
_0808392C:
	strh r0, [r1]
_0808392E:
	ldr r0, _0808394C
	bl SetMainCallback2
	ldr r1, _08083950
	ldr r0, _08083954
	str r0, [r1, 0x8]
	adds r0, r5, 0
	bl DestroyTask
_08083940:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083948: .4byte gUnknown_020239F8
_0808394C: .4byte sub_800E7C4
_08083950: .4byte gMain
_08083954: .4byte sub_8083958
	thumb_func_end sub_808382C

	thumb_func_start sub_8083958
sub_8083958: @ 8083958
	push {lr}
	bl call_map_music_set_to_zero
	bl copy_player_party_from_sav1
	bl copy_bags_and_unk_data_to_save_blocks
	bl sub_810FEFC
	ldr r0, _08083990
	ldrh r0, [r0]
	cmp r0, 0x5
	beq _0808397E
	ldr r0, _08083994
	ldrb r1, [r0]
	movs r0, 0x1
	eors r0, r1
	bl sub_8110290
_0808397E:
	ldr r0, _08083998
	ldr r1, _0808399C
	str r1, [r0, 0x8]
	ldr r0, _080839A0
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08083990: .4byte gUnknown_0202E8CC
_08083994: .4byte gUnknown_03004860
_08083998: .4byte gMain
_0808399C: .4byte sub_805465C
_080839A0: .4byte sub_8071B28
	thumb_func_end sub_8083958

	thumb_func_start sub_80839A4
sub_80839A4: @ 80839A4
	push {lr}
	ldr r0, _080839CC
	ldrh r1, [r0]
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080839B8
	cmp r1, 0x5
	bne _080839C0
_080839B8:
	bl copy_player_party_from_sav1
	bl copy_bags_and_unk_data_to_save_blocks
_080839C0:
	movs r0, 0x7F
	bl copy_saved_warp2_bank_and_enter_x_to_warp1
	pop {r0}
	bx r0
	.align 2, 0
_080839CC: .4byte gUnknown_0202E8CC
	thumb_func_end sub_80839A4

	thumb_func_start sub_80839D0
sub_80839D0: @ 80839D0
	push {lr}
	bl sub_805559C
	pop {r0}
	bx r0
	thumb_func_end sub_80839D0

	thumb_func_start sub_80839DC
sub_80839DC: @ 80839DC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08083A00
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08083A20
	cmp r0, 0x1
	bgt _08083A04
	cmp r0, 0
	beq _08083A0E
	b _08083A7E
	.align 2, 0
_08083A00: .4byte gTasks
_08083A04:
	cmp r0, 0x2
	beq _08083A40
	cmp r0, 0x3
	beq _08083A68
	b _08083A7E
_08083A0E:
	ldr r0, _08083A1C
	bl ShowFieldMessage
	movs r0, 0x1
	strh r0, [r5, 0x8]
	b _08083A7E
	.align 2, 0
_08083A1C: .4byte gUnknown_081A490C
_08083A20:
	bl IsFieldMessageBoxHidden
	lsls r0, 24
	cmp r0, 0
	beq _08083A7E
	bl sub_8055574
	ldr r0, _08083A3C
	ldrb r0, [r0]
	bl sub_8007270
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _08083A7E
	.align 2, 0
_08083A3C: .4byte gUnknown_0202E8CE
_08083A40:
	bl sub_80554F8
	cmp r0, 0x1
	beq _08083A52
	cmp r0, 0x1
	ble _08083A7E
	cmp r0, 0x2
	beq _08083A62
	b _08083A7E
_08083A52:
	bl HideFieldMessageBox
	movs r0, 0
	strh r0, [r5, 0x8]
	adds r0, r4, 0
	bl SwitchTaskToFollowupFunc
	b _08083A7E
_08083A62:
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _08083A7E
_08083A68:
	bl sub_8055588
	bl HideFieldMessageBox
	bl MenuZeroFillScreen
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_08083A7E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80839DC

	thumb_func_start sub_8083A84
sub_8083A84: @ 8083A84
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08083AA8
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl SetTaskFuncWithFollowupFunc
	bl ScriptContext1_Stop
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083AA8: .4byte sub_80839DC
	thumb_func_end sub_8083A84

	thumb_func_start sub_8083AAC
sub_8083AAC: @ 8083AAC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08083AD0
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08083AF0
	cmp r0, 0x1
	bgt _08083AD4
	cmp r0, 0
	beq _08083ADE
	b _08083B34
	.align 2, 0
_08083AD0: .4byte gTasks
_08083AD4:
	cmp r0, 0x2
	beq _08083B04
	cmp r0, 0x3
	beq _08083B20
	b _08083B34
_08083ADE:
	bl ScriptContext2_Enable
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	bl ClearLinkCallback_2
	b _08083B14
_08083AF0:
	ldr r0, _08083B00
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08083B34
	b _08083B14
	.align 2, 0
_08083B00: .4byte gPaletteFade
_08083B04:
	ldr r1, _08083B1C
	movs r0, 0
	strb r0, [r1]
	strb r0, [r1, 0x1]
	bl m4aMPlayAllStop
	bl sub_800832C
_08083B14:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08083B34
	.align 2, 0
_08083B1C: .4byte gUnknown_020297D8
_08083B20:
	ldr r0, _08083B3C
	ldrb r0, [r0]
	cmp r0, 0
	bne _08083B34
	ldr r0, _08083B40
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_08083B34:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083B3C: .4byte gReceivedRemoteLinkPlayers
_08083B40: .4byte sub_8047CD8
	thumb_func_end sub_8083AAC

	thumb_func_start sub_8083B44
sub_8083B44: @ 8083B44
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8083B6C
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8083B44

	thumb_func_start sub_8083B5C
sub_8083B5C: @ 8083B5C
	push {lr}
	ldr r0, _08083B68
	bl sub_8083A84
	pop {r0}
	bx r0
	.align 2, 0
_08083B68: .4byte sub_8083B44
	thumb_func_end sub_8083B5C

	thumb_func_start sub_8083B6C
sub_8083B6C: @ 8083B6C
	push {lr}
	ldr r0, _08083B7C
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08083B7C: .4byte sub_8083AAC
	thumb_func_end sub_8083B6C

	thumb_func_start sub_8083B80
sub_8083B80: @ 8083B80
	push {lr}
	bl sub_8083B6C
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	thumb_func_end sub_8083B80

	thumb_func_start sub_8083B90
sub_8083B90: @ 8083B90
	push {lr}
	ldr r0, _08083BA4
	ldr r2, _08083BA8
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _08083BAC
	bl sub_8083A84
	pop {r0}
	bx r0
	.align 2, 0
_08083BA4: .4byte gLinkType
_08083BA8: .4byte 0x00002211
_08083BAC: .4byte sub_808382C
	thumb_func_end sub_8083B90

	thumb_func_start unref_sub_8083BB0
unref_sub_8083BB0: @ 8083BB0
	push {r4,lr}
	ldr r4, _08083BD4
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08083BD8
	adds r1, r4, 0
	bl SetTaskFuncWithFollowupFunc
	bl ScriptContext1_Stop
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083BD4: .4byte sub_80839DC
_08083BD8: .4byte sub_80B9484
	thumb_func_end unref_sub_8083BB0

	thumb_func_start sub_8083BDC
sub_8083BDC: @ 8083BDC
	push {lr}
	ldr r0, _08083BEC
	ldrb r0, [r0]
	ldr r1, _08083BF0
	bl sub_8093130
	pop {r0}
	bx r0
	.align 2, 0
_08083BEC: .4byte gUnknown_0202E8D0
_08083BF0: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_8083BDC

	thumb_func_start sub_8083BF4
sub_8083BF4: @ 8083BF4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08083C34
	strh r4, [r0]
	ldr r0, _08083C38
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	ldr r2, _08083C3C
	adds r1, r2
	bl StringCopy
	adds r0, r4, 0
	bl sub_80934C4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08083C48
	ldr r0, _08083C40
	ldr r2, _08083C44
	subs r1, 0x1
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	movs r0, 0x1
	b _08083C4A
	.align 2, 0
_08083C34: .4byte gUnknown_0202E8D0
_08083C38: .4byte gStringVar1
_08083C3C: .4byte gLinkPlayers + 0x8
_08083C40: .4byte gStringVar2
_08083C44: .4byte gTrainerCardColorNames
_08083C48:
	movs r0, 0
_08083C4A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8083BF4

	thumb_func_start sub_8083C50
sub_8083C50: @ 8083C50
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08083C98
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 16
	movs r0, 0x96
	lsls r0, 17
	cmp r1, r0
	ble _08083C82
	bl CloseLink
	ldr r0, _08083C9C
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08083C82:
	ldr r0, _08083CA0
	ldrb r0, [r0]
	cmp r0, 0
	beq _08083C90
	adds r0, r5, 0
	bl DestroyTask
_08083C90:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08083C98: .4byte gTasks
_08083C9C: .4byte CB2_LinkError
_08083CA0: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_8083C50

	thumb_func_start sub_8083CA4
sub_8083CA4: @ 8083CA4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08083CC4
	ldrb r0, [r0]
	cmp r0, 0
	bne _08083CBC
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_08083CBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083CC4: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_8083CA4

	thumb_func_start unref_sub_8083CC8
unref_sub_8083CC8: @ 8083CC8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_800832C
	ldr r1, _08083CE8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08083CEC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08083CE8: .4byte gTasks
_08083CEC: .4byte sub_8083CA4
	thumb_func_end unref_sub_8083CC8

	thumb_func_start unref_sub_8083CF0
unref_sub_8083CF0: @ 8083CF0
	push {r4-r7,lr}
	ldr r0, _08083D38
	ldr r4, [r0]
	lsls r4, 26
	lsrs r4, 30
	ldr r0, _08083D3C
	movs r1, 0xFF
	strb r1, [r0]
	ldr r1, _08083D40
	bl StringAppend
	movs r5, 0
	ldr r0, _08083D44
	movs r6, 0x1
	eors r4, r6
	lsls r4, 1
	adds r7, r4, r0
	movs r4, 0
_08083D14:
	ldrh r0, [r7]
	asrs r0, r5
	ands r0, r6
	cmp r0, 0
	beq _08083D28
	ldr r1, _08083D48
	adds r1, r4, r1
	ldr r0, _08083D3C
	bl StringAppend
_08083D28:
	adds r4, 0x3
	adds r5, 0x1
	cmp r5, 0x9
	ble _08083D14
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083D38: .4byte 0x04000128
_08083D3C: .4byte gUnknown_03004DA0
_08083D40: .4byte gUnknown_0839B24A
_08083D44: .4byte word_3002910
_08083D48: .4byte gUnknown_0839B22C
	thumb_func_end unref_sub_8083CF0

	thumb_func_start sub_8083D4C
sub_8083D4C: @ 8083D4C
	push {lr}
	ldr r0, _08083D60
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08083D64
	movs r0, 0
	b _08083D6A
	.align 2, 0
_08083D60: .4byte gMain
_08083D64:
	bl sub_8071C20
	movs r0, 0x1
_08083D6A:
	pop {r1}
	bx r1
	thumb_func_end sub_8083D4C

	thumb_func_start sub_8083D70
sub_8083D70: @ 8083D70
	push {r4-r6,lr}
	sub sp, 0x34
	ldr r0, _08083DE4
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl sub_8041870
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	movs r6, 0xB
	adds r1, r4, 0
	muls r1, r6
	ldr r4, _08083DE8
	adds r1, r4
	mov r0, sp
	bl StringCopy
	ldr r1, _08083DEC
	mov r0, sp
	bl StringAppend
	adds r1, r5, 0
	muls r1, r6
	adds r1, r4
	mov r0, sp
	bl StringAppend
	ldr r1, _08083DF0
	mov r0, sp
	bl StringAppend
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1E
	movs r3, 0x13
	bl MenuDrawTextWindow
	mov r0, sp
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08083DF4
	ldr r0, _08083DF8
	str r0, [r1]
	movs r0, 0
	add sp, 0x34
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08083DE4: .4byte gPlayerParty
_08083DE8: .4byte gSpeciesNames
_08083DEC: .4byte gUnknown_0839B24D
_08083DF0: .4byte gUnknown_0839B255
_08083DF4: .4byte gCallback_03004AE8
_08083DF8: .4byte sub_8083D4C
	thumb_func_end sub_8083D70

	thumb_func_start sub_8083DFC
sub_8083DFC: @ 8083DFC
	push {lr}
	ldr r0, _08083E24
	bl daycare_count_pokemon
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08083E1A
	bl daycare_relationship_score_from_savegame
	lsls r0, 24
	cmp r0, 0
	beq _08083E1A
	bl sub_8041940
_08083E1A:
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08083E24: .4byte gSaveBlock1 + 0x2F9C
	thumb_func_end sub_8083DFC

	thumb_func_start sub_8083E28
sub_8083E28: @ 8083E28
	push {lr}
	ldr r0, _08083E50
	bl daycare_count_pokemon
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08083E46
	bl daycare_relationship_score_from_savegame
	lsls r0, 24
	cmp r0, 0
	beq _08083E46
	bl sub_8041950
_08083E46:
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08083E50: .4byte gSaveBlock1 + 0x2F9C
	thumb_func_end sub_8083E28

	thumb_func_start sub_8083E54
sub_8083E54: @ 8083E54
	push {lr}
	movs r0, 0xFA
	lsls r0, 2
	bl sub_8041790
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8083E54

	thumb_func_start sub_8083E68
sub_8083E68: @ 8083E68
	push {lr}
	ldr r0, _08083E7C
	bl sub_8041790
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08083E7C: .4byte 0x00002710
	thumb_func_end sub_8083E68

	thumb_func_start sub_8083E80
sub_8083E80: @ 8083E80
	push {lr}
	bl sub_8132670
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8083E80

	thumb_func_start sub_8083E90
sub_8083E90: @ 8083E90
	push {r4-r6,lr}
	sub sp, 0x4
	movs r5, 0
	movs r6, 0
_08083E98:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08083EE0
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _08083EBC
	mov r0, sp
	strb r6, [r0]
	adds r0, r4, 0
	movs r1, 0x20
	mov r2, sp
	bl SetMonData
_08083EBC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08083E98
	ldr r0, _08083EE4
	ldr r1, _08083EE8
	adds r0, r1
	movs r1, 0xFD
	strb r1, [r0]
	bl sub_8071C20
	movs r0, 0x1
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08083EE0: .4byte gPlayerParty
_08083EE4: .4byte gSaveBlock1
_08083EE8: .4byte 0x000030b6
	thumb_func_end sub_8083E90

	thumb_func_start sub_8083EEC
sub_8083EEC: @ 8083EEC
	push {lr}
	ldr r0, _08083F04
	ldr r2, _08083F08
	movs r1, 0x2
	bl SetMonData
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08083F04: .4byte gPlayerParty
_08083F08: .4byte gUnknown_0839B257
	thumb_func_end sub_8083EEC

	thumb_func_start sub_8083F0C
sub_8083F0C: @ 8083F0C
	push {r4,lr}
	movs r4, 0
_08083F10:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_810CA6C
	adds r4, 0x1
	cmp r4, 0x27
	ble _08083F10
	bl sub_8071C20
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8083F0C

	thumb_func_start sub_8083F2C
sub_8083F2C: @ 8083F2C
	push {lr}
	bl ProcessMenuInput
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _08083F52
	adds r0, 0x1
	cmp r1, r0
	beq _08083F60
	ldr r2, _08083F58
	ldr r0, _08083F5C
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	str r0, [r2]
_08083F52:
	movs r0, 0
	b _08083F66
	.align 2, 0
_08083F58: .4byte gCallback_03004AE8
_08083F5C: .4byte gUnknown_0839B2C0
_08083F60:
	bl sub_8071C20
	movs r0, 0x1
_08083F66:
	pop {r1}
	bx r1
	thumb_func_end sub_8083F2C

	thumb_func_start unref_sub_8083F6C
unref_sub_8083F6C: @ 8083F6C
	push {lr}
	sub sp, 0x8
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r3, _08083FB0
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x9
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x9
	bl InitMenu
	ldr r1, _08083FB4
	ldr r0, _08083FB8
	str r0, [r1]
	movs r0, 0
	add sp, 0x8
	pop {r1}
	bx r1
	.align 2, 0
_08083FB0: .4byte gUnknown_0839B2C0
_08083FB4: .4byte gCallback_03004AE8
_08083FB8: .4byte sub_8083F2C
	thumb_func_end unref_sub_8083F6C

	thumb_func_start sub_8083FBC
sub_8083FBC: @ 8083FBC
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08083FEC
_08083FC2:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08083FF0
	ldrb r0, [r1, 0x7]
	cmp r0, 0x1
	beq _08083FDC
	cmp r0, 0x3
	bne _08083FF0
_08083FDC:
	adds r0, r4, 0
	bl sub_8084004
	lsls r0, 24
	cmp r0, 0
	beq _08083FF0
	movs r0, 0x1
	b _08083FFC
	.align 2, 0
_08083FEC: .4byte gMapObjects
_08083FF0:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08083FC2
	movs r0, 0
_08083FFC:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8083FBC

	thumb_func_start sub_8084004
sub_8084004: @ 8084004
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	adds r0, r4, 0
	bl GetFieldObjectScriptPointerByFieldObjectId
	adds r6, r0, 0
	bl GetTrainerFlagFromScriptPointer
	cmp r0, 0
	bne _08084034
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	ldr r1, _08084038
	adds r5, r0, r1
	adds r0, r5, 0
	bl CheckIfTrainerCanApproachPlayer
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0808403C
_08084034:
	movs r0, 0
	b _08084052
	.align 2, 0
_08084038: .4byte gMapObjects
_0808403C:
	adds r0, r7, 0
	adds r1, r6, 0
	bl SingleTrainerWantsBattle
	subs r1, r4, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_80842C8
	movs r0, 0x1
_08084052:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8084004

	thumb_func_start CheckIfTrainerCanApproachPlayer
CheckIfTrainerCanApproachPlayer: @ 8084058
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r7, r0, 0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	ldrb r0, [r7, 0x7]
	mov r8, r4
	cmp r0, 0x1
	bne _080840B8
	ldr r1, _080840B0
	ldrb r0, [r7, 0x18]
	lsls r0, 28
	lsrs r0, 26
	subs r0, 0x4
	adds r0, r1
	ldrb r1, [r7, 0x1D]
	mov r2, sp
	movs r3, 0
	ldrsh r2, [r2, r3]
	movs r5, 0
	ldrsh r3, [r4, r5]
	ldr r4, [r0]
	adds r0, r7, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r2, [r7, 0x18]
	lsls r2, 28
	lsrs r2, 28
	adds r0, r7, 0
	adds r1, r6, 0
	bl CheckPathBetweenTrainerAndPlayer
	lsls r0, 24
	lsrs r0, 24
	b _080840F8
	.align 2, 0
_080840B0: .4byte gUnknown_0839B488
_080840B4:
	adds r0, r6, 0
	b _080840F8
_080840B8:
	movs r5, 0
_080840BA:
	ldr r0, _08084104
	lsls r4, r5, 2
	adds r4, r0
	ldrb r1, [r7, 0x1D]
	mov r0, sp
	movs r6, 0
	ldrsh r2, [r0, r6]
	mov r0, r8
	movs r6, 0
	ldrsh r3, [r0, r6]
	ldr r4, [r4]
	adds r0, r7, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl CheckPathBetweenTrainerAndPlayer
	lsls r0, 24
	cmp r0, 0
	bne _080840B4
	adds r5, r4, 0
	cmp r5, 0x3
	bls _080840BA
	movs r0, 0
_080840F8:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08084104: .4byte gUnknown_0839B488
	thumb_func_end CheckIfTrainerCanApproachPlayer

	thumb_func_start IsTrainerInRangeSouth
IsTrainerInRangeSouth: @ 8084108
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r3, 16
	lsrs r5, r3, 16
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	lsls r2, 16
	asrs r2, 16
	cmp r0, r2
	bne _08084142
	lsls r0, r5, 16
	asrs r2, r0, 16
	ldrh r3, [r4, 0x12]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r2, r0
	ble _08084142
	adds r1, r0, 0
	lsls r0, r6, 16
	asrs r0, 16
	adds r1, r0
	cmp r2, r1
	bgt _08084142
	subs r0, r5, r3
	lsls r0, 24
	lsrs r0, 24
	b _08084144
_08084142:
	movs r0, 0
_08084144:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsTrainerInRangeSouth

	thumb_func_start IsTrainerInRangeNorth
IsTrainerInRangeNorth: @ 808414C
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r3, 16
	lsrs r5, r3, 16
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	lsls r2, 16
	asrs r2, 16
	cmp r0, r2
	bne _08084186
	lsls r0, r5, 16
	asrs r2, r0, 16
	ldrh r3, [r4, 0x12]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r2, r0
	bge _08084186
	adds r1, r0, 0
	lsls r0, r6, 16
	asrs r0, 16
	subs r1, r0
	cmp r2, r1
	blt _08084186
	subs r0, r3, r5
	lsls r0, 24
	lsrs r0, 24
	b _08084188
_08084186:
	movs r0, 0
_08084188:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsTrainerInRangeNorth

	thumb_func_start IsTrainerInRangeWest
IsTrainerInRangeWest: @ 8084190
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r3, 16
	asrs r3, 16
	cmp r0, r3
	bne _080841CA
	lsls r0, r5, 16
	asrs r3, r0, 16
	ldrh r2, [r4, 0x10]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _080841CA
	adds r1, r0, 0
	lsls r0, r6, 16
	asrs r0, 16
	subs r1, r0
	cmp r3, r1
	blt _080841CA
	subs r0, r2, r5
	lsls r0, 24
	lsrs r0, 24
	b _080841CC
_080841CA:
	movs r0, 0
_080841CC:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsTrainerInRangeWest

	thumb_func_start IsTrainerInRangeEast
IsTrainerInRangeEast: @ 80841D4
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	lsls r3, 16
	asrs r3, 16
	cmp r0, r3
	bne _0808420E
	lsls r0, r5, 16
	asrs r3, r0, 16
	ldrh r2, [r4, 0x10]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	ble _0808420E
	adds r1, r0, 0
	lsls r0, r6, 16
	asrs r0, 16
	adds r1, r0
	cmp r3, r1
	bgt _0808420E
	subs r0, r5, r2
	lsls r0, 24
	lsrs r0, 24
	b _08084210
_0808420E:
	movs r0, 0
_08084210:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsTrainerInRangeEast

	thumb_func_start CheckPathBetweenTrainerAndPlayer
CheckPathBetweenTrainerAndPlayer: @ 8084218
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r7, r2, 24
	cmp r1, 0
	beq _080842B2
	ldrh r1, [r6, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r6, 0x12]
	mov r1, sp
	adds r1, 0x2
	strh r0, [r1]
	movs r4, 0
	mov r8, r1
	mov r5, r9
	subs r5, 0x1
	cmp r4, r5
	bgt _08084284
_0808424C:
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r3, r8
	movs r0, 0
	ldrsh r2, [r3, r0]
	adds r0, r6, 0
	adds r3, r7, 0
	bl sub_8060024
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08084270
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	bne _080842B2
_08084270:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r7, 0
	mov r1, sp
	mov r2, r8
	bl MoveCoords
	cmp r4, r5
	ble _0808424C
_08084284:
	ldrb r4, [r6, 0x19]
	lsls r5, r4, 28
	lsrs r5, 28
	lsrs r4, 4
	movs r0, 0
	strb r0, [r6, 0x19]
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r3, r8
	movs r0, 0
	ldrsh r2, [r3, r0]
	adds r0, r6, 0
	adds r3, r7, 0
	bl npc_block_way
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r4, 4
	orrs r5, r4
	strb r5, [r6, 0x19]
	cmp r1, 0x4
	beq _080842B6
_080842B2:
	movs r0, 0
	b _080842B8
_080842B6:
	mov r0, r9
_080842B8:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckPathBetweenTrainerAndPlayer

	thumb_func_start sub_80842C8
sub_80842C8: @ 80842C8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r0, _080842F4
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080842F8
	adds r1, r0
	lsrs r0, r5, 16
	strh r0, [r1, 0xA]
	strh r5, [r1, 0xC]
	strh r4, [r1, 0xE]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080842F4: .4byte sub_808433C
_080842F8: .4byte gTasks
	thumb_func_end sub_80842C8

	thumb_func_start sub_80842FC
sub_80842FC: @ 80842FC
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r5, _08084334
	adds r0, r5, 0
	bl FindTaskIdByFunc
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl SetTaskFuncWithFollowupFunc
	ldr r1, _08084338
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x8]
	adds r0, r4, 0
	bl _call_via_r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08084334: .4byte sub_808433C
_08084338: .4byte gTasks
	thumb_func_end sub_80842FC

	thumb_func_start sub_808433C
sub_808433C: @ 808433C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _08084368
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	lsls r5, r0, 16
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	orrs r5, r0
	ldrb r0, [r5]
	lsls r0, 31
	cmp r0, 0
	bne _0808436C
	adds r0, r6, 0
	bl SwitchTaskToFollowupFunc
	b _08084388
	.align 2, 0
_08084368: .4byte gTasks
_0808436C:
	ldr r7, _08084390
_0808436E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r7
	ldr r3, [r0]
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _0808436E
_08084388:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084390: .4byte gUnknown_0839B498
	thumb_func_end sub_808433C

	thumb_func_start sub_8084394
sub_8084394: @ 8084394
	movs r0, 0
	bx lr
	thumb_func_end sub_8084394

	thumb_func_start sub_8084398
sub_8084398: @ 8084398
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	ldr r1, _080843D8
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	adds r0, r4, 0
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0
	bl FieldEffectStart
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080843D8: .4byte gUnknown_0202FF84
	thumb_func_end sub_8084398

	thumb_func_start sub_80843DC
sub_80843DC: @ 80843DC
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	movs r0, 0
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	beq _080843F2
	movs r0, 0
	b _08084414
_080843F2:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldrb r0, [r5, 0x6]
	subs r0, 0x39
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08084408
	movs r0, 0x6
	strh r0, [r4, 0x8]
_08084408:
	ldrb r0, [r5, 0x6]
	cmp r0, 0x3F
	bne _08084412
	movs r0, 0x8
	strh r0, [r4, 0x8]
_08084412:
	movs r0, 0x1
_08084414:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80843DC

	thumb_func_start sub_808441C
sub_808441C: @ 808441C
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0808443A
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0808446E
_0808443A:
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08084460
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetGoSpeed0AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0xE]
	subs r0, 0x1
	strh r0, [r5, 0xE]
	b _0808446E
_08084460:
	adds r0, r4, 0
	movs r1, 0x3E
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_0808446E:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_808441C

	thumb_func_start sub_8084478
sub_8084478: @ 8084478
	push {r4-r6,lr}
	adds r6, r1, 0
	adds r5, r2, 0
	adds r0, r5, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08084496
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08084524
_08084496:
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl npc_set_running_behaviour_etc
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_805C774
	adds r0, r5, 0
	bl sub_805C754
	ldr r0, _0808452C
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08084530
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080844EE
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08084524
_080844EE:
	bl sub_80597E8
	ldr r0, _0808452C
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08084530
	adds r4, r0
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r0, 24
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_08084524:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808452C: .4byte gPlayerAvatar
_08084530: .4byte gMapObjects
	thumb_func_end sub_8084478

	thumb_func_start sub_8084534
sub_8084534: @ 8084534
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08084570
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08084574
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08084560
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08084566
_08084560:
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
_08084566:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08084570: .4byte gPlayerAvatar
_08084574: .4byte gMapObjects
	thumb_func_end sub_8084534

	thumb_func_start sub_8084578
sub_8084578: @ 8084578
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08084596
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080845A4
_08084596:
	adds r0, r4, 0
	movs r1, 0x59
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_080845A4:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8084578

	thumb_func_start sub_80845AC
sub_80845AC: @ 80845AC
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r2, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080845C0
	movs r0, 0x3
	strh r0, [r4, 0x8]
_080845C0:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80845AC

	thumb_func_start sub_80845C8
sub_80845C8: @ 80845C8
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080845E6
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080845F4
_080845E6:
	adds r0, r4, 0
	movs r1, 0x3E
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_080845F4:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80845C8

	thumb_func_start sub_80845FC
sub_80845FC: @ 80845FC
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r4, 0
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	beq _08084642
	ldr r2, _0808464C
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	str r0, [r2]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	str r0, [r2, 0x4]
	ldr r3, _08084650
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r2, 0x8]
	movs r0, 0x2
	str r0, [r2, 0xC]
	movs r0, 0x31
	bl FieldEffectStart
	strh r0, [r5, 0x10]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08084642:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808464C: .4byte gUnknown_0202FF84
_08084650: .4byte gSprites
	thumb_func_end sub_80845FC

	thumb_func_start sub_8084654
sub_8084654: @ 8084654
	push {r4,r5,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	ldr r2, _080846C4
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x2B
	ldrb r0, [r1]
	cmp r0, 0x2
	bne _080846BC
	ldrb r1, [r4, 0x3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x3]
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x5]
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_806084C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_080846BC:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080846C4: .4byte gSprites
	thumb_func_end sub_8084654

	thumb_func_start sub_80846C8
sub_80846C8: @ 80846C8
	push {r4,lr}
	adds r4, r1, 0
	movs r0, 0x31
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _080846DC
	movs r0, 0x3
	strh r0, [r4, 0x8]
_080846DC:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80846C8

	thumb_func_start sub_80846E4
sub_80846E4: @ 80846E4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08084778
	adds r4, r0, r1
	adds r0, r4, 0
	adds r0, 0xA
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08084716
	ldr r0, [sp]
	bl FieldObjectClearAnim
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
_08084716:
	ldr r1, _0808477C
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r2, [sp]
	ldr r3, [r0]
	adds r0, r5, 0
	adds r1, r4, 0
	bl _call_via_r3
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	bne _08084780
	movs r0, 0x31
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08084780
	ldr r4, [sp]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl npc_set_running_behaviour_etc
	ldr r4, [sp]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl npc_running_behaviour_by_direction
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805C774
	adds r0, r5, 0
	bl DestroyTask
	b _0808478A
	.align 2, 0
_08084778: .4byte gTasks
_0808477C: .4byte gUnknown_0839B4C8
_08084780:
	ldr r2, [sp]
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
_0808478A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80846E4

	thumb_func_start sub_8084794
sub_8084794: @ 8084794
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080847C0
	movs r1, 0
	bl CreateTask
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _080847C4
	adds r0, r1
	adds r0, 0x2
	adds r1, r4, 0
	bl StoreWordInTwoHalfwords
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080847C0: .4byte sub_80846E4
_080847C4: .4byte gUnknown_03004B28
	thumb_func_end sub_8084794

	thumb_func_start sub_80847C8
sub_80847C8: @ 80847C8
	push {lr}
	ldr r0, _080847D4
	bl sub_80842FC
	pop {r0}
	bx r0
	.align 2, 0
_080847D4: .4byte sub_80847D8
	thumb_func_end sub_80847C8

	thumb_func_start sub_80847D8
sub_80847D8: @ 80847D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80847D8

	thumb_func_start oei_exclamation_mark
oei_exclamation_mark: @ 80847EC
	push {lr}
	ldr r0, _0808481C
	movs r1, 0
	movs r2, 0
	movs r3, 0x53
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08084814
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08084820
	adds r0, r1
	movs r1, 0
	movs r2, 0
	bl sub_8084894
_08084814:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0808481C: .4byte gSpriteTemplate_839B510
_08084820: .4byte gSprites
	thumb_func_end oei_exclamation_mark

	thumb_func_start sub_8084824
sub_8084824: @ 8084824
	push {lr}
	ldr r0, _08084854
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _0808484C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08084858
	adds r0, r1
	movs r1, 0x21
	movs r2, 0x1
	bl sub_8084894
_0808484C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08084854: .4byte gSpriteTemplate_839B510
_08084858: .4byte gSprites
	thumb_func_end sub_8084824

	thumb_func_start sub_808485C
sub_808485C: @ 808485C
	push {lr}
	ldr r0, _0808488C
	movs r1, 0
	movs r2, 0
	movs r3, 0x52
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _08084884
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08084890
	adds r0, r1
	movs r1, 0x2E
	movs r2, 0
	bl sub_8084894
_08084884:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0808488C: .4byte gSpriteTemplate_839B528
_08084890: .4byte gSprites
	thumb_func_end sub_808485C

	thumb_func_start sub_8084894
sub_8084894: @ 8084894
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	ldrb r4, [r0, 0x5]
	movs r3, 0xD
	negs r3, r3
	ands r3, r4
	movs r4, 0x4
	orrs r3, r4
	strb r3, [r0, 0x5]
	movs r3, 0x3E
	adds r3, r0
	mov r12, r3
	ldrb r3, [r3]
	movs r4, 0x2
	orrs r3, r4
	mov r4, r12
	strb r3, [r4]
	ldr r4, _080848D8
	ldr r3, [r4]
	strh r3, [r0, 0x2E]
	ldr r3, [r4, 0x4]
	strh r3, [r0, 0x30]
	ldr r3, [r4, 0x8]
	strh r3, [r0, 0x32]
	ldr r3, _080848DC
	strh r3, [r0, 0x34]
	strh r1, [r0, 0x3C]
	adds r1, r2, 0
	bl StartSpriteAnim
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080848D8: .4byte gUnknown_0202FF84
_080848DC: .4byte 0x0000fffb
	thumb_func_end sub_8084894

	thumb_func_start objc_exclamation_mark_probably
objc_exclamation_mark_probably: @ 80848E0
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x32]
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08084912
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08084920
_08084912:
	ldrh r1, [r4, 0x3C]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldEffectStop
	b _0808496E
_08084920:
	ldr r2, _08084964
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08084968
	adds r1, r0
	ldrh r3, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r2, r3, r0
	strh r2, [r4, 0x36]
	ldrh r0, [r1, 0x20]
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x22]
	subs r0, 0x10
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x24]
	strh r0, [r4, 0x24]
	ldrh r0, [r1, 0x26]
	adds r0, r2
	strh r0, [r4, 0x26]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _0808496C
	adds r0, r3, 0x1
	strh r0, [r4, 0x34]
	b _0808496E
	.align 2, 0
_08084964: .4byte gMapObjects
_08084968: .4byte gSprites
_0808496C:
	strh r2, [r4, 0x34]
_0808496E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end objc_exclamation_mark_probably

	thumb_func_start unref_sub_8084978
unref_sub_8084978: @ 8084978
	ldr r1, _08084980
	strb r0, [r1]
	bx lr
	.align 2, 0
_08084980: .4byte gUnknown_0202FF7C
	thumb_func_end unref_sub_8084978

	thumb_func_start sub_8084984
sub_8084984: @ 8084984
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x4]
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08084A0C
	lsls r1, r2, 1
	adds r1, r2
	lsls r2, r1, 1
	adds r2, r3
	adds r0, r1, 0x1
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	mov r9, r0
	adds r1, 0x2
	lsls r1, 1
	adds r1, r3
	ldrh r6, [r1]
	ldrh r5, [r2]
	cmp r5, r9
	bhi _08084A2E
	ldr r0, _08084A10
	mov r10, r0
_080849C6:
	movs r4, 0
	mov r1, r10
	ldr r0, [r1]
	ldr r0, [r0]
	cmp r4, r0
	bge _08084A24
	ldr r1, [sp]
	lsls r0, r1, 16
	asrs r0, 16
	mov r8, r0
	ldr r1, [sp, 0x4]
	lsls r0, r1, 16
	asrs r7, r0, 16
_080849E0:
	adds r0, r4, 0x7
	adds r1, r5, 0x7
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_805759C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08084A14
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r8, r4
	bne _08084A14
	cmp r7, r5
	bne _08084A14
	adds r0, r6, 0
	b _08084A34
	.align 2, 0
_08084A0C: .4byte gUnknown_0839DC00
_08084A10: .4byte gMapHeader
_08084A14:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	mov r1, r10
	ldr r0, [r1]
	ldr r0, [r0]
	cmp r4, r0
	blt _080849E0
_08084A24:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r9
	bls _080849C6
_08084A2E:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r0, 16
_08084A34:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8084984

	thumb_func_start check_feebas
check_feebas: @ 8084A44
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	movs r7, 0
	ldr r0, _08084ABC
	ldrh r1, [r0, 0x4]
	movs r0, 0x88
	lsls r0, 6
	cmp r1, r0
	bne _08084B38
	add r5, sp, 0xC
	mov r4, sp
	adds r4, 0xE
	adds r0, r5, 0
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldrh r0, [r5]
	subs r0, 0x7
	strh r0, [r5]
	ldrh r0, [r4]
	subs r0, 0x7
	strh r0, [r4]
	movs r0, 0
	ldrsh r1, [r4, r0]
	ldr r0, _08084AC0
	mov r9, r5
	mov r8, r4
	ldrh r2, [r0, 0x6]
	cmp r1, r2
	blt _08084A8E
	ldrh r3, [r0, 0x8]
	cmp r1, r3
	bgt _08084A8E
	movs r7, 0x1
_08084A8E:
	mov r2, r8
	movs r3, 0
	ldrsh r1, [r2, r3]
	ldrh r2, [r0, 0xC]
	cmp r1, r2
	blt _08084AA2
	ldrh r0, [r0, 0xE]
	cmp r1, r0
	bgt _08084AA2
	movs r7, 0x2
_08084AA2:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bls _08084AC8
	b _08084B38
	.align 2, 0
_08084ABC: .4byte gSaveBlock1
_08084AC0: .4byte gUnknown_0839DC00
_08084AC4:
	movs r0, 0x1
	b _08084B3A
_08084AC8:
	ldr r0, _08084B48
	ldr r3, _08084B4C
	adds r0, r3
	ldrh r0, [r0]
	bl sub_8084B74
	movs r5, 0
	ldr r6, _08084B50
_08084AD8:
	bl sub_8084B54
	lsls r1, r5, 1
	mov r2, sp
	adds r4, r2, r1
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	bl __umodsi3
	strh r0, [r4]
	lsls r0, 16
	cmp r0, 0
	bne _08084AF6
	strh r6, [r4]
_08084AF6:
	ldrh r0, [r4]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bls _08084B08
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08084B08:
	cmp r5, 0x6
	bne _08084AD8
	mov r3, r9
	movs r1, 0
	ldrsh r0, [r3, r1]
	mov r2, r8
	movs r3, 0
	ldrsh r1, [r2, r3]
	adds r2, r7, 0
	bl sub_8084984
	lsls r0, 16
	lsrs r1, r0, 16
	movs r5, 0
_08084B24:
	lsls r0, r5, 1
	add r0, sp
	ldrh r0, [r0]
	cmp r1, r0
	beq _08084AC4
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08084B24
_08084B38:
	movs r0, 0
_08084B3A:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08084B48: .4byte gSaveBlock1
_08084B4C: .4byte 0x00002dd6
_08084B50: .4byte 0x000001bf
	thumb_func_end check_feebas

	thumb_func_start sub_8084B54
sub_8084B54: @ 8084B54
	ldr r2, _08084B68
	ldr r1, [r2]
	ldr r0, _08084B6C
	muls r0, r1
	ldr r1, _08084B70
	adds r0, r1
	str r0, [r2]
	lsrs r0, 16
	bx lr
	.align 2, 0
_08084B68: .4byte gUnknown_0202FF80
_08084B6C: .4byte 0x41c64e6d
_08084B70: .4byte 0x00003039
	thumb_func_end sub_8084B54

	thumb_func_start sub_8084B74
sub_8084B74: @ 8084B74
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08084B80
	str r0, [r1]
	bx lr
	.align 2, 0
_08084B80: .4byte gUnknown_0202FF80
	thumb_func_end sub_8084B74

	thumb_func_start wild_pokemon_rand_grass
wild_pokemon_rand_grass: @ 8084B84
	push {lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x13
	bhi _08084BA0
	movs r0, 0
	b _08084C3A
_08084BA0:
	adds r0, r1, 0
	subs r0, 0x14
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _08084BB0
	movs r0, 0x1
	b _08084C3A
_08084BB0:
	adds r0, r1, 0
	subs r0, 0x28
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bhi _08084BC0
	movs r0, 0x2
	b _08084C3A
_08084BC0:
	adds r0, r1, 0
	subs r0, 0x32
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bhi _08084BD0
	movs r0, 0x3
	b _08084C3A
_08084BD0:
	adds r0, r1, 0
	subs r0, 0x3C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bhi _08084BE0
	movs r0, 0x4
	b _08084C3A
_08084BE0:
	adds r0, r1, 0
	subs r0, 0x46
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bhi _08084BF0
	movs r0, 0x5
	b _08084C3A
_08084BF0:
	adds r0, r1, 0
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _08084C00
	movs r0, 0x6
	b _08084C3A
_08084C00:
	adds r0, r1, 0
	subs r0, 0x55
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _08084C10
	movs r0, 0x7
	b _08084C3A
_08084C10:
	adds r0, r1, 0
	subs r0, 0x5A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08084C20
	movs r0, 0x8
	b _08084C3A
_08084C20:
	adds r0, r1, 0
	subs r0, 0x5E
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08084C30
	movs r0, 0x9
	b _08084C3A
_08084C30:
	cmp r1, 0x62
	beq _08084C38
	movs r0, 0xB
	b _08084C3A
_08084C38:
	movs r0, 0xA
_08084C3A:
	pop {r1}
	bx r1
	thumb_func_end wild_pokemon_rand_grass

	thumb_func_start wild_pokemon_rand_water
wild_pokemon_rand_water: @ 8084C40
	push {lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	cmp r1, 0x3B
	bhi _08084C5E
	movs r0, 0
	b _08084C90
_08084C5E:
	adds r0, r1, 0
	subs r0, 0x3C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1D
	bhi _08084C6E
	movs r0, 0x1
	b _08084C90
_08084C6E:
	adds r0, r1, 0
	subs r0, 0x5A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _08084C7E
	movs r0, 0x2
	b _08084C90
_08084C7E:
	adds r0, r2, 0
	subs r0, 0x5F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _08084C8E
	movs r0, 0x4
	b _08084C90
_08084C8E:
	movs r0, 0x3
_08084C90:
	pop {r1}
	bx r1
	thumb_func_end wild_pokemon_rand_water

	thumb_func_start sub_8084C94
sub_8084C94: @ 8084C94
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	movs r5, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r4, 0x1
	beq _08084CCE
	cmp r4, 0x1
	bgt _08084CBE
	cmp r4, 0
	beq _08084CC4
	b _08084D28
_08084CBE:
	cmp r6, 0x2
	beq _08084CF2
	b _08084D28
_08084CC4:
	movs r5, 0x1
	cmp r1, 0x45
	bhi _08084D28
	movs r5, 0
	b _08084D28
_08084CCE:
	cmp r1, 0x3B
	bhi _08084CD4
	movs r5, 0x2
_08084CD4:
	adds r0, r1, 0
	subs r0, 0x3C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _08084CE2
	movs r5, 0x3
_08084CE2:
	adds r0, r1, 0
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _08084D28
	movs r5, 0x4
	b _08084D28
_08084CF2:
	cmp r1, 0x27
	bhi _08084CF8
	movs r5, 0x5
_08084CF8:
	adds r0, r1, 0
	subs r0, 0x28
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x27
	bhi _08084D06
	movs r5, 0x6
_08084D06:
	adds r0, r1, 0
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE
	bhi _08084D14
	movs r5, 0x7
_08084D14:
	adds r0, r1, 0
	subs r0, 0x5F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08084D22
	movs r5, 0x8
_08084D22:
	cmp r1, 0x63
	bne _08084D28
	movs r5, 0x9
_08084D28:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8084C94

	thumb_func_start random_number_in_range
random_number_in_range: @ 8084D30
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x1]
	ldrb r1, [r4]
	cmp r0, r1
	bcc _08084D40
	ldrb r5, [r4]
	b _08084D44
_08084D40:
	ldrb r5, [r4, 0x1]
	ldrb r0, [r4]
_08084D44:
	subs r4, r0, r5
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 24
	lsrs r0, 24
	adds r0, r5, r0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end random_number_in_range

	thumb_func_start sub_8084D6C
sub_8084D6C: @ 8084D6C
	push {r4-r6,lr}
	movs r3, 0
	ldr r5, _08084D9C
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _08084DB8
	adds r6, r5, 0
	ldr r4, _08084DA0
_08084D7C:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r6
	ldrb r1, [r2]
	movs r0, 0x4
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne _08084DA4
	ldrb r1, [r2, 0x1]
	movs r0, 0x5
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne _08084DA4
	adds r0, r3, 0
	b _08084DBA
	.align 2, 0
_08084D9C: .4byte gWildMonHeaders
_08084DA0: .4byte gSaveBlock1
_08084DA4:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _08084D7C
_08084DB8:
	ldr r0, _08084DC0
_08084DBA:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08084DC0: .4byte 0x0000ffff
	thumb_func_end sub_8084D6C

	thumb_func_start sub_8084DC4
sub_8084DC4: @ 8084DC4
	push {r4-r7,lr}
	sub sp, 0x1C
	bl GetSafariZoneFlag
	cmp r0, 0x1
	bne _08084E5E
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4F
	bhi _08084E5E
	bl sub_80C8448
	adds r7, r0, 0
	cmp r7, 0
	beq _08084E5E
	movs r5, 0
_08084DF2:
	mov r1, sp
	adds r0, r1, r5
	strb r5, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x18
	bls _08084DF2
	movs r5, 0
_08084E04:
	adds r1, r5, 0x1
	lsls r0, r1, 24
	lsrs r4, r0, 24
	adds r6, r1, 0
	cmp r4, 0x18
	bhi _08084E34
	add r5, sp
_08084E12:
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08084E2A
	ldrb r2, [r5]
	mov r0, sp
	adds r1, r0, r4
	ldrb r0, [r1]
	strb r0, [r5]
	strb r2, [r1]
_08084E2A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x18
	bls _08084E12
_08084E34:
	lsls r0, r6, 24
	lsrs r5, r0, 24
	cmp r5, 0x17
	bls _08084E04
	movs r5, 0
_08084E3E:
	mov r1, sp
	adds r4, r1, r5
	ldrb r0, [r4]
	adds r1, r7, 0
	bl sub_810CAE4
	lsls r0, 16
	cmp r0, 0
	ble _08084E54
	ldrb r0, [r4]
	b _08084E70
_08084E54:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x18
	bls _08084E3E
_08084E5E:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
_08084E70:
	add sp, 0x1C
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8084DC4

	thumb_func_start sub_8084E78
sub_8084E78: @ 8084E78
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	bl ZeroEnemyPartyMons
	bl sub_8084DC4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08084EAC
	str r0, [sp]
	adds r0, r1, 0
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x20
	bl CreateMonWithNature
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08084EAC: .4byte gEnemyParty
	thumb_func_end sub_8084E78

	thumb_func_start sub_8084EB0
sub_8084EB0: @ 8084EB0
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r3, r1, 0
	lsls r2, 24
	lsrs r7, r2, 24
	movs r0, 0
	cmp r1, 0x1
	beq _08084EDA
	cmp r1, 0x1
	bgt _08084ECE
	cmp r1, 0
	beq _08084ED4
	b _08084EE2
_08084ECE:
	cmp r3, 0x2
	beq _08084EDA
	b _08084EE2
_08084ED4:
	bl wild_pokemon_rand_grass
	b _08084EDE
_08084EDA:
	bl wild_pokemon_rand_water
_08084EDE:
	lsls r0, 24
	lsrs r0, 24
_08084EE2:
	lsls r4, r0, 2
	ldr r0, [r6, 0x4]
	adds r0, r4
	bl random_number_in_range
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r7, 0x1
	bne _08084F04
	adds r0, r5, 0
	bl sub_8085598
	lsls r0, 24
	cmp r0, 0
	bne _08084F04
	movs r0, 0
	b _08084F12
_08084F04:
	ldr r0, [r6, 0x4]
	adds r0, r4, r0
	ldrh r0, [r0, 0x2]
	adds r1, r5, 0
	bl sub_8084E78
	movs r0, 0x1
_08084F12:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8084EB0

	thumb_func_start sub_8084F18
sub_8084F18: @ 8084F18
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r0, r1, 24
	lsrs r0, 24
	bl sub_8084C94
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 22
	ldr r0, [r5, 0x4]
	adds r0, r4
	bl random_number_in_range
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, [r5, 0x4]
	adds r0, r4, r0
	ldrh r0, [r0, 0x2]
	bl sub_8084E78
	ldr r0, [r5, 0x4]
	adds r4, r0
	ldrh r0, [r4, 0x2]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8084F18

	thumb_func_start SetUpMassOutbreakEncounter
SetUpMassOutbreakEncounter: @ 8084F50
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08084F78
	ldr r0, _08084F74
	movs r1, 0xAC
	lsls r1, 6
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8085598
	lsls r0, 24
	cmp r0, 0
	bne _08084F78
	movs r0, 0
	b _08084FAC
	.align 2, 0
_08084F74: .4byte gSaveBlock1
_08084F78:
	ldr r4, _08084FB4
	ldr r2, _08084FB8
	adds r0, r4, r2
	ldrh r0, [r0]
	adds r2, 0x4
	adds r1, r4, r2
	ldrb r1, [r1]
	bl sub_8084E78
	movs r5, 0
	ldr r0, _08084FBC
	adds r4, r0
_08084F90:
	lsls r0, r5, 1
	adds r0, r4
	ldrh r1, [r0]
	lsls r2, r5, 24
	lsrs r2, 24
	ldr r0, _08084FC0
	bl SetMonMoveSlot
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _08084F90
	movs r0, 0x1
_08084FAC:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08084FB4: .4byte gSaveBlock1
_08084FB8: .4byte 0x00002afc
_08084FBC: .4byte 0x00002b04
_08084FC0: .4byte gEnemyParty
	thumb_func_end SetUpMassOutbreakEncounter

	thumb_func_start DoMassOutbreakEncounterTest
DoMassOutbreakEncounterTest: @ 8084FC4
	push {r4,lr}
	ldr r4, _08085010
	ldr r1, _08085014
	adds r0, r4, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _08085020
	movs r1, 0x5
	ldrsb r1, [r4, r1]
	ldr r2, _08085018
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r1, r0
	bne _08085020
	movs r1, 0x4
	ldrsb r1, [r4, r1]
	adds r2, 0x1
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r1, r0
	bne _08085020
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	ldr r2, _0808501C
	adds r1, r4, r2
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08085020
	movs r0, 0x1
	b _08085022
	.align 2, 0
_08085010: .4byte gSaveBlock1
_08085014: .4byte 0x00002afc
_08085018: .4byte 0x00002afe
_0808501C: .4byte 0x00002b0d
_08085020:
	movs r0, 0
_08085022:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end DoMassOutbreakEncounterTest

	thumb_func_start DoWildEncounterRateDiceRoll
DoWildEncounterRateDiceRoll: @ 8085028
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xB4
	lsls r1, 4
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r4
	bcc _0808504C
	movs r0, 0
	b _0808504E
_0808504C:
	movs r0, 0x1
_0808504E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end DoWildEncounterRateDiceRoll

	thumb_func_start sub_8085054
sub_8085054: @ 8085054
	push {r4,lr}
	sub sp, 0x4
	str r0, [sp]
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r0, 4
	str r0, [sp]
	movs r0, 0x6
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0808507E
	ldr r1, [sp]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	movs r1, 0x64
	bl __udivsi3
	str r0, [sp]
_0808507E:
	mov r0, sp
	bl affects_encounter_rate_based_on_flags
	mov r0, sp
	bl ApplyCleanseTagWildEncounterRateReduction
	cmp r4, 0
	bne _080850BA
	ldr r4, _080850DC
	adds r0, r4, 0
	movs r1, 0x6
	bl GetMonData
	cmp r0, 0
	bne _080850BA
	adds r0, r4, 0
	bl GetMonAbility
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bne _080850B0
	ldr r0, [sp]
	lsrs r0, 1
	str r0, [sp]
_080850B0:
	cmp r1, 0x23
	bne _080850BA
	ldr r0, [sp]
	lsls r0, 1
	str r0, [sp]
_080850BA:
	ldr r0, [sp]
	movs r1, 0xB4
	lsls r1, 4
	cmp r0, r1
	bls _080850C6
	str r1, [sp]
_080850C6:
	ldr r0, [sp]
	lsls r0, 16
	lsrs r0, 16
	bl DoWildEncounterRateDiceRoll
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080850DC: .4byte gPlayerParty
	thumb_func_end sub_8085054

	thumb_func_start DoGlobalWildEncounterDiceRoll
DoGlobalWildEncounterDiceRoll: @ 80850E0
	push {lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3B
	bhi _080850FC
	movs r0, 0x1
	b _080850FE
_080850FC:
	movs r0, 0
_080850FE:
	pop {r1}
	bx r1
	thumb_func_end DoGlobalWildEncounterDiceRoll

	thumb_func_start sub_8085104
sub_8085104: @ 8085104
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 16
	lsrs r6, r0, 16
	mov r9, r6
	lsls r1, 16
	lsrs r7, r1, 16
	mov r8, r7
	ldr r0, _080851CC
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08085122
	b _08085282
_08085122:
	bl sub_8084D6C
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080851D0
	cmp r5, r0
	bne _08085132
	b _08085282
_08085132:
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8057468
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080851D8
	ldr r1, _080851D4
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 2
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	adds r4, r2, 0
	cmp r0, 0
	bne _0808515A
	b _08085282
_0808515A:
	cmp r7, r6
	beq _0808516A
	bl DoGlobalWildEncounterDiceRoll
	lsls r0, 24
	cmp r0, 0
	bne _0808516A
	b _08085282
_0808516A:
	ldr r1, _080851D4
	adds r0, r4, r5
	lsls r0, 2
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8085054
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08085188
	b _08085282
_08085188:
	bl sub_81344CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808524A
	bl DoMassOutbreakEncounterTest
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080851AE
	movs r0, 0x1
	bl SetUpMassOutbreakEncounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808527A
_080851AE:
	ldr r1, _080851D4
	adds r0, r4, r5
	lsls r0, 2
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0x1
	bl sub_8084EB0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808527A
	b _08085282
	.align 2, 0
_080851CC: .4byte gUnknown_0202FF7C
_080851D0: .4byte 0x0000ffff
_080851D4: .4byte gWildMonHeaders
_080851D8:
	adds r0, r4, 0
	bl sub_8057494
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08085200
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08085282
	adds r0, r4, 0
	bl sub_8057434
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085282
_08085200:
	ldr r1, _08085260
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	ldr r0, [r0]
	adds r4, r2, 0
	cmp r0, 0
	beq _08085282
	cmp r8, r9
	beq _08085222
	bl DoGlobalWildEncounterDiceRoll
	lsls r0, 24
	cmp r0, 0
	beq _08085282
_08085222:
	ldr r1, _08085260
	adds r0, r4, r5
	lsls r0, 2
	adds r1, 0x8
	adds r4, r0, r1
	ldr r0, [r4]
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8085054
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085282
	bl sub_81344CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085268
_0808524A:
	ldr r0, _08085264
	ldrb r0, [r0, 0xC]
	bl sub_8085598
	lsls r0, 24
	cmp r0, 0
	beq _08085282
	bl sub_8081A5C
	movs r0, 0x1
	b _08085284
	.align 2, 0
_08085260: .4byte gWildMonHeaders
_08085264: .4byte gSaveBlock1 + 0x3144
_08085268:
	ldr r0, [r4]
	movs r1, 0x1
	movs r2, 0x1
	bl sub_8084EB0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085282
_0808527A:
	bl sub_8081A00
	movs r0, 0x1
	b _08085284
_08085282:
	movs r0, 0
_08085284:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8085104

	thumb_func_start rock_smash_wild_pokemon_encounter
rock_smash_wild_pokemon_encounter: @ 8085290
	push {r4,lr}
	bl sub_8084D6C
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _080852E0
	cmp r2, r0
	beq _080852EC
	ldr r1, _080852E4
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 2
	adds r1, 0xC
	adds r0, r1
	ldr r4, [r0]
	cmp r4, 0
	beq _080852D8
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8085054
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080852EC
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0x1
	bl sub_8084EB0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _080852EC
	bl sub_8081A00
_080852D8:
	ldr r0, _080852E8
	strh r4, [r0]
	b _080852F2
	.align 2, 0
_080852E0: .4byte 0x0000ffff
_080852E4: .4byte gWildMonHeaders
_080852E8: .4byte gScriptResult
_080852EC:
	ldr r1, _080852F8
	movs r0, 0
	strh r0, [r1]
_080852F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080852F8: .4byte gScriptResult
	thumb_func_end rock_smash_wild_pokemon_encounter

	thumb_func_start sub_80852FC
sub_80852FC: @ 80852FC
	push {r4,r5,lr}
	sub sp, 0x4
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	bl sub_8084D6C
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _0808536C
	cmp r4, r0
	beq _080853DA
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_8057468
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085380
	ldr r1, _08085370
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 2
	adds r1, 0x4
	adds r0, r1
	ldr r4, [r0]
	cmp r4, 0
	beq _080853DA
	bl sub_81344CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080853BC
	bl DoMassOutbreakEncounterTest
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085374
	movs r0, 0
	bl SetUpMassOutbreakEncounter
	b _080853D2
	.align 2, 0
_0808536C: .4byte 0x0000ffff
_08085370: .4byte gWildMonHeaders
_08085374:
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl sub_8084EB0
	b _080853D2
_08085380:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_8057494
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080853DA
	ldr r1, _080853C4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	ldr r4, [r0]
	cmp r4, 0
	beq _080853DA
	bl sub_81344CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080853C8
_080853BC:
	bl sub_8081A5C
	movs r0, 0x1
	b _080853DC
	.align 2, 0
_080853C4: .4byte gWildMonHeaders
_080853C8:
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_8084EB0
_080853D2:
	bl sub_8081A00
	movs r0, 0x1
	b _080853DC
_080853DA:
	movs r0, 0
_080853DC:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80852FC

	thumb_func_start GetFishingWildMonListHeader
GetFishingWildMonListHeader: @ 80853E4
	push {lr}
	bl sub_8084D6C
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _0808540C
	cmp r2, r0
	beq _08085414
	ldr r0, _08085410
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 2
	adds r0, 0x10
	adds r1, r0
	ldr r0, [r1]
	cmp r0, 0
	beq _08085414
	movs r0, 0x1
	b _08085416
	.align 2, 0
_0808540C: .4byte 0x0000ffff
_08085410: .4byte gWildMonHeaders
_08085414:
	movs r0, 0
_08085416:
	pop {r1}
	bx r1
	thumb_func_end GetFishingWildMonListHeader

	thumb_func_start sub_808541C
sub_808541C: @ 808541C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl check_feebas
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808544C
	ldr r4, _08085448
	adds r0, r4, 0
	bl random_number_in_range
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4, 0
	bl sub_8084E78
	b _0808546C
	.align 2, 0
_08085448: .4byte gWildFeebasRoute119Data
_0808544C:
	ldr r4, _08085484
	bl sub_8084D6C
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r4, 0x10
	adds r1, r4
	ldr r0, [r1]
	adds r1, r5, 0
	bl sub_8084F18
	lsls r0, 16
	lsrs r4, r0, 16
_0808546C:
	movs r0, 0xC
	bl sav12_xor_increment
	adds r0, r4, 0
	bl sub_80BEA50
	bl sub_8081A00
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085484: .4byte gWildMonHeaders
	thumb_func_end sub_808541C

	thumb_func_start wild_pokemon_rand_for_map
wild_pokemon_rand_for_map: @ 8085488
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r0, 0
	strb r0, [r6]
	bl sub_8084D6C
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _080854C0
	cmp r3, r0
	beq _080854BA
	ldr r2, _080854C4
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
	adds r0, r2, 0x4
	adds r0, r1, r0
	ldr r5, [r0]
	adds r2, 0x8
	adds r1, r2
	ldr r4, [r1]
	cmp r5, 0
	bne _080854C8
	cmp r4, 0
	bne _080854CE
_080854BA:
	movs r0, 0
	b _0808550E
	.align 2, 0
_080854C0: .4byte 0x0000ffff
_080854C4: .4byte gWildMonHeaders
_080854C8:
	cmp r4, 0
	bne _080854DC
	b _08085500
_080854CE:
	movs r0, 0x1
	strb r0, [r6]
	bl wild_pokemon_rand_water
	lsls r0, 24
	ldr r1, [r4, 0x4]
	b _08085508
_080854DC:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4F
	bls _08085500
	movs r0, 0x1
	strb r0, [r6]
	bl wild_pokemon_rand_water
	lsls r0, 24
	ldr r1, [r4, 0x4]
	b _08085508
_08085500:
	bl wild_pokemon_rand_grass
	lsls r0, 24
	ldr r1, [r5, 0x4]
_08085508:
	lsrs r0, 22
	adds r0, r1
	ldrh r0, [r0, 0x2]
_0808550E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end wild_pokemon_rand_for_map

	thumb_func_start sub_8085514
sub_8085514: @ 8085514
	push {r4,lr}
	bl sub_8084D6C
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08085548
	cmp r2, r0
	beq _08085550
	ldr r1, _0808554C
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	ldr r4, [r0]
	cmp r4, 0
	beq _08085550
	bl wild_pokemon_rand_water
	lsls r0, 24
	ldr r1, [r4, 0x4]
	lsrs r0, 22
	adds r0, r1
	ldrh r0, [r0, 0x2]
	b _08085552
	.align 2, 0
_08085548: .4byte 0x0000ffff
_0808554C: .4byte gWildMonHeaders
_08085550:
	movs r0, 0
_08085552:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8085514

	thumb_func_start sub_8085558
sub_8085558: @ 8085558
	push {r4,r5,lr}
	ldr r5, _08085588
	adds r0, r5, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _08085590
	subs r4, r0, 0x1
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl VarSet
	cmp r4, 0
	bne _08085590
	ldr r0, _0808558C
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _08085592
	.align 2, 0
_08085588: .4byte 0x00004021
_0808558C: .4byte Event_RepelWoreOff
_08085590:
	movs r0, 0
_08085592:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8085558

	thumb_func_start sub_8085598
sub_8085598: @ 8085598
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080855E4
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	beq _080855DE
	movs r5, 0
_080855AC:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080855E8
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080855EC
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _080855EC
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bcc _080855F6
_080855DE:
	movs r0, 0x1
	b _080855F8
	.align 2, 0
_080855E4: .4byte 0x00004021
_080855E8: .4byte gPlayerParty
_080855EC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080855AC
_080855F6:
	movs r0, 0
_080855F8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8085598

	thumb_func_start affects_encounter_rate_based_on_flags
affects_encounter_rate_based_on_flags: @ 8085600
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0808561C
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085620
	ldr r0, [r4]
	lsrs r1, r0, 1
	adds r0, r1
	b _08085632
	.align 2, 0
_0808561C: .4byte 0x0000084d
_08085620:
	ldr r0, _0808563C
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085634
	ldr r0, [r4]
	lsrs r0, 1
_08085632:
	str r0, [r4]
_08085634:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808563C: .4byte 0x0000084e
	thumb_func_end affects_encounter_rate_based_on_flags

	thumb_func_start ApplyCleanseTagWildEncounterRateReduction
ApplyCleanseTagWildEncounterRateReduction: @ 8085640
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08085664
	movs r1, 0xC
	bl GetMonData
	cmp r0, 0xBE
	bne _0808565C
	ldr r0, [r4]
	lsls r0, 1
	movs r1, 0x3
	bl __udivsi3
	str r0, [r4]
_0808565C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085664: .4byte gPlayerParty
	thumb_func_end ApplyCleanseTagWildEncounterRateReduction

	thumb_func_start FieldEffectStart
FieldEffectStart: @ 8085668
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl FieldEffectActiveListAdd
	ldr r0, _080856A8
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	str r0, [sp]
	add r4, sp, 0x4
	ldr r5, _080856AC
_08085686:
	ldr r0, [sp]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r5
	ldr r2, [r0]
	mov r0, sp
	adds r1, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _08085686
	ldr r0, [sp, 0x4]
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080856A8: .4byte gFieldEffectScriptPointers
_080856AC: .4byte gUnknown_0839F0D4
	thumb_func_end FieldEffectStart

	thumb_func_start FieldEffectCmd_loadtiles
FieldEffectCmd_loadtiles: @ 80856B0
	push {lr}
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	bl FieldEffectScript_LoadTiles
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadtiles

	thumb_func_start FieldEffectCmd_loadfadedpal
FieldEffectCmd_loadfadedpal: @ 80856C4
	push {lr}
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	bl FieldEffectScript_LoadFadedPalette
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadfadedpal

	thumb_func_start FieldEffectCmd_loadpal
FieldEffectCmd_loadpal: @ 80856D8
	push {lr}
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	bl FieldEffectScript_LoadPalette
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadpal

	thumb_func_start FieldEffectCmd_callnative
FieldEffectCmd_callnative: @ 80856EC
	push {lr}
	ldr r2, [r0]
	adds r2, 0x1
	str r2, [r0]
	bl FieldEffectScript_CallNative
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_callnative

	thumb_func_start sub_8085700
sub_8085700: @ 8085700
	movs r0, 0
	bx lr
	thumb_func_end sub_8085700

	thumb_func_start FieldEffectCmd_loadgfx_callnative
FieldEffectCmd_loadgfx_callnative: @ 8085704
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	adds r0, r4, 0
	bl FieldEffectScript_LoadTiles
	adds r0, r4, 0
	bl FieldEffectScript_LoadFadedPalette
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldEffectScript_CallNative
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadgfx_callnative

	thumb_func_start FieldEffectCmd_loadtiles_callnative
FieldEffectCmd_loadtiles_callnative: @ 808572C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	adds r0, r4, 0
	bl FieldEffectScript_LoadTiles
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldEffectScript_CallNative
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadtiles_callnative

	thumb_func_start FieldEffectCmd_loadfadedpal_callnative
FieldEffectCmd_loadfadedpal_callnative: @ 8085750
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	adds r0, r4, 0
	bl FieldEffectScript_LoadFadedPalette
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldEffectScript_CallNative
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadfadedpal_callnative

	thumb_func_start FieldEffectScript_ReadWord
FieldEffectScript_ReadWord: @ 8085774
	ldr r2, [r0]
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	ldrb r1, [r2, 0x2]
	lsls r1, 16
	adds r0, r1
	ldrb r1, [r2, 0x3]
	lsls r1, 24
	adds r0, r1
	bx lr
	thumb_func_end FieldEffectScript_ReadWord

	thumb_func_start FieldEffectScript_LoadTiles
FieldEffectScript_LoadTiles: @ 808578C
	push {r4,r5,lr}
	adds r4, r0, 0
	bl FieldEffectScript_ReadWord
	adds r5, r0, 0
	ldrh r0, [r5, 0x6]
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _080857B8
	cmp r0, r1
	bne _080857AA
	adds r0, r5, 0
	bl LoadSpriteSheet
_080857AA:
	ldr r0, [r4]
	adds r0, 0x4
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080857B8: .4byte 0xffff0000
	thumb_func_end FieldEffectScript_LoadTiles

	thumb_func_start FieldEffectScript_LoadFadedPalette
FieldEffectScript_LoadFadedPalette: @ 80857BC
	push {r4,r5,lr}
	adds r5, r0, 0
	bl FieldEffectScript_ReadWord
	adds r4, r0, 0
	bl LoadSpritePalette
	ldrh r0, [r4, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	bl sub_807D78C
	ldr r0, [r5]
	adds r0, 0x4
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectScript_LoadFadedPalette

	thumb_func_start FieldEffectScript_LoadPalette
FieldEffectScript_LoadPalette: @ 80857E4
	push {r4,lr}
	adds r4, r0, 0
	bl FieldEffectScript_ReadWord
	bl LoadSpritePalette
	ldr r0, [r4]
	adds r0, 0x4
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectScript_LoadPalette

	thumb_func_start FieldEffectScript_CallNative
FieldEffectScript_CallNative: @ 80857FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldEffectScript_ReadWord
	bl _call_via_r0
	str r0, [r5]
	ldr r0, [r4]
	adds r0, 0x4
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectScript_CallNative

	thumb_func_start FieldEffectFreeGraphicsResources
FieldEffectFreeGraphicsResources: @ 8085818
	push {r4,r5,lr}
	adds r1, r0, 0
	adds r1, 0x40
	ldrh r5, [r1]
	ldrb r4, [r0, 0x5]
	lsrs r4, 4
	bl DestroySprite
	adds r0, r5, 0
	bl FieldEffectFreeTilesIfUnused
	adds r0, r4, 0
	bl FieldEffectFreePaletteIfUnused
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectFreeGraphicsResources

	thumb_func_start FieldEffectStop
FieldEffectStop: @ 808583C
	push {r4,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	bl FieldEffectFreeGraphicsResources
	adds r0, r4, 0
	bl FieldEffectActiveListRemove
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectStop

	thumb_func_start FieldEffectFreeTilesIfUnused
FieldEffectFreeTilesIfUnused: @ 8085854
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetSpriteTileTagByTileStart
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _080858B0
	cmp r3, r0
	beq _080858A8
	movs r2, 0
	ldr r5, _080858B4
_0808586E:
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r5
	adds r0, r1, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _08085898
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 25
	cmp r0, 0
	bge _08085898
	adds r0, r1, 0
	adds r0, 0x40
	ldrh r0, [r0]
	cmp r4, r0
	beq _080858A8
_08085898:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _0808586E
	adds r0, r3, 0
	bl FreeSpriteTilesByTag
_080858A8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080858B0: .4byte 0x0000ffff
_080858B4: .4byte gSprites
	thumb_func_end FieldEffectFreeTilesIfUnused

	thumb_func_start FieldEffectFreePaletteIfUnused
FieldEffectFreePaletteIfUnused: @ 80858B8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _08085908
	cmp r5, r0
	beq _08085900
	movs r2, 0
	ldr r6, _0808590C
	adds r3, r4, 0
_080858D4:
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r6
	adds r0, r1, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _080858F0
	ldrb r0, [r1, 0x5]
	lsrs r0, 4
	cmp r0, r3
	beq _08085900
_080858F0:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _080858D4
	adds r0, r5, 0
	bl FreeSpritePaletteByTag
_08085900:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085908: .4byte 0x0000ffff
_0808590C: .4byte gSprites
	thumb_func_end FieldEffectFreePaletteIfUnused

	thumb_func_start FieldEffectActiveListClear
FieldEffectActiveListClear: @ 8085910
	push {r4,lr}
	movs r2, 0
	ldr r4, _08085930
	movs r3, 0xFF
_08085918:
	adds r0, r2, r4
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1F
	bls _08085918
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085930: .4byte gUnknown_030006E0
	thumb_func_end FieldEffectActiveListClear

	thumb_func_start FieldEffectActiveListAdd
FieldEffectActiveListAdd: @ 8085934
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r4, _0808594C
_0808593E:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08085950
	strb r3, [r1]
	b _0808595A
	.align 2, 0
_0808594C: .4byte gUnknown_030006E0
_08085950:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1F
	bls _0808593E
_0808595A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectActiveListAdd

	thumb_func_start FieldEffectActiveListRemove
FieldEffectActiveListRemove: @ 8085960
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r4, _0808597C
	movs r5, 0xFF
_0808596C:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, r3
	bne _08085980
	orrs r0, r5
	strb r0, [r1]
	b _0808598A
	.align 2, 0
_0808597C: .4byte gUnknown_030006E0
_08085980:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1F
	bls _0808596C
_0808598A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectActiveListRemove

	thumb_func_start FieldEffectActiveListContains
FieldEffectActiveListContains: @ 8085990
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r3, _080859A8
_0808599A:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _080859AC
	movs r0, 0x1
	b _080859B8
	.align 2, 0
_080859A8: .4byte gUnknown_030006E0
_080859AC:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1F
	bls _0808599A
	movs r0, 0
_080859B8:
	pop {r1}
	bx r1
	thumb_func_end FieldEffectActiveListContains

	thumb_func_start sub_80859BC
sub_80859BC: @ 80859BC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	mov r9, r3
	ldr r7, [sp, 0x34]
	lsls r4, 24
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsrs r4, 21
	ldr r3, _08085A44
	mov r8, r3
	add r8, r4
	mov r0, r8
	adds r1, r7, 0
	bl LoadCompressedObjectPaletteOverrideBuffer
	ldr r0, _08085A48
	adds r4, r0
	adds r0, r4, 0
	adds r1, r7, 0
	bl LoadCompressedObjectPicOverrideBuffer
	mov r1, sp
	ldrh r0, [r4, 0x6]
	movs r2, 0
	strh r0, [r1]
	mov r3, r8
	ldrh r0, [r3, 0x4]
	strh r0, [r1, 0x2]
	ldr r0, _08085A4C
	str r0, [sp, 0x4]
	ldr r0, _08085A50
	str r0, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r0, _08085A54
	str r0, [sp, 0x10]
	ldr r0, _08085A58
	str r0, [sp, 0x14]
	lsls r5, 16
	asrs r5, 16
	lsls r6, 16
	asrs r6, 16
	mov r0, sp
	adds r1, r5, 0
	adds r2, r6, 0
	mov r3, r9
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08085A44: .4byte gTrainerFrontPicPaletteTable
_08085A48: .4byte gTrainerFrontPicTable
_08085A4C: .4byte gOamData_839F0F4
_08085A50: .4byte gDummySpriteAnimTable
_08085A54: .4byte gDummySpriteAffineAnimTable
_08085A58: .4byte SpriteCallbackDummy
	thumb_func_end sub_80859BC

	thumb_func_start sub_8085A5C
sub_8085A5C: @ 8085A5C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r1, r2, 0
	lsls r4, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _08085A8C
	lsrs r4, 21
	adds r0, r4, r0
	ldr r0, [r0]
	bl LZDecompressVram
	ldr r0, _08085A90
	adds r4, r0
	ldr r0, [r4]
	adds r1, r5, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085A8C: .4byte gTrainerFrontPicTable
_08085A90: .4byte gTrainerFrontPicPaletteTable
	thumb_func_end sub_8085A5C

	thumb_func_start AddNewGameBirchObject
AddNewGameBirchObject: @ 8085A94
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _08085ACC
	bl LoadSpritePalette
	ldr r0, _08085AD0
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08085ACC: .4byte gUnknown_0839F114
_08085AD0: .4byte gSpriteTemplate_839F128
	thumb_func_end AddNewGameBirchObject

	thumb_func_start sub_8085AD4
sub_8085AD4: @ 8085AD4
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	adds r4, r0, 0
	adds r6, r1, 0
	mov r8, r2
	mov r10, r3
	lsls r4, 16
	lsrs r4, 16
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r0, r4, 3
	mov r9, r0
	ldr r0, _08085B74
	add r0, r9
	ldr r1, _08085B78
	lsls r2, r4, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r3, _08085B7C
	ldr r3, [r3, 0xC]
	str r3, [sp]
	str r4, [sp, 0x4]
	bl DecompressPicFromTable_2
	ldr r5, _08085B80
	add r9, r5
	mov r0, r9
	bl LoadCompressedObjectPalette
	adds r0, r4, 0
	movs r1, 0x3
	bl GetMonSpriteTemplate_803C56C
	ldr r4, _08085B84
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2]
	ldrh r0, [r5, 0x4]
	bl IndexOfSpritePaletteTag
	adds r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	bl sub_807DE38
	lsls r6, 16
	asrs r6, 16
	mov r0, r8
	lsls r0, 16
	asrs r0, 16
	mov r8, r0
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, r8
	mov r3, r10
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08085B74: .4byte gMonFrontPicTable
_08085B78: .4byte gMonFrontPicCoords
_08085B7C: .4byte gUnknown_081FAF4C
_08085B80: .4byte gMonPaletteTable
_08085B84: .4byte gUnknown_02024E8C
	thumb_func_end sub_8085AD4

	thumb_func_start sub_8085B88
sub_8085B88: @ 8085B88
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0xC
	adds r5, r0, 0
	mov r10, r1
	adds r4, r2, 0
	adds r6, r3, 0
	ldr r0, [sp, 0x28]
	mov r8, r0
	ldr r0, [sp, 0x2C]
	mov r9, r0
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r0, r5, 3
	ldr r1, _08085C34
	adds r0, r1
	ldr r1, _08085C38
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r3, _08085C3C
	ldr r3, [r3, 0xC]
	str r3, [sp]
	str r5, [sp, 0x4]
	str r4, [sp, 0x8]
	bl sub_800D334
	adds r0, r5, 0
	mov r1, r10
	adds r2, r4, 0
	bl sub_80409C8
	adds r4, r0, 0
	bl LoadCompressedObjectPalette
	adds r0, r5, 0
	movs r1, 0x3
	bl GetMonSpriteTemplate_803C56C
	ldr r5, _08085C40
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x2]
	ldrh r0, [r4, 0x4]
	bl IndexOfSpritePaletteTag
	adds r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	bl sub_807DE38
	lsls r6, 16
	asrs r6, 16
	mov r0, r8
	lsls r0, 16
	asrs r0, 16
	mov r8, r0
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, r8
	mov r3, r9
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08085C34: .4byte gMonFrontPicTable
_08085C38: .4byte gMonFrontPicCoords
_08085C3C: .4byte gUnknown_081FAF4C
_08085C40: .4byte gUnknown_02024E8C
	thumb_func_end sub_8085B88

	thumb_func_start sub_8085C44
sub_8085C44: @ 8085C44
	push {r4,lr}
	adds r4, r0, 0
	bl sub_807DE68
	ldrb r0, [r4, 0x5]
	lsrs r0, 4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	cmp r0, 0
	beq _08085C6E
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
_08085C6E:
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8085C44

	thumb_func_start sub_8085C7C
sub_8085C7C: @ 8085C7C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 16
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r4, _08085D00
	lsrs r0, 15
	adds r4, r0, r4
	ldrh r4, [r4]
	movs r5, 0x1F
	mov r9, r5
	mov r8, r4
	mov r6, r8
	ands r6, r5
	mov r8, r6
	movs r6, 0xF8
	lsls r6, 2
	ands r6, r4
	lsrs r6, 5
	movs r5, 0xF8
	lsls r5, 7
	ands r4, r5
	lsrs r4, 10
	mov r7, r9
	mov r5, r8
	subs r7, r5
	mov r12, r7
	mov r7, r12
	muls r7, r1
	adds r1, r7, 0
	asrs r1, 4
	add r8, r1
	mov r5, r9
	subs r1, r5, r6
	muls r1, r2
	asrs r1, 4
	adds r6, r1
	subs r5, r4
	mov r9, r5
	mov r1, r9
	muls r1, r3
	asrs r1, 4
	adds r4, r1
	mov r7, r8
	lsls r7, 16
	lsls r6, 21
	orrs r6, r7
	lsls r4, 26
	orrs r4, r6
	lsrs r4, 16
	ldr r1, _08085D04
	adds r0, r1
	strh r4, [r0]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08085D00: .4byte gPlttBufferUnfaded
_08085D04: .4byte gPlttBufferFaded
	thumb_func_end sub_8085C7C

	thumb_func_start sub_8085D08
sub_8085D08: @ 8085D08
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 16
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	ldr r4, _08085D78
	lsrs r0, 15
	adds r4, r0, r4
	ldrh r4, [r4]
	movs r5, 0x1F
	mov r8, r5
	mov r6, r8
	ands r6, r4
	mov r8, r6
	movs r5, 0xF8
	lsls r5, 2
	ands r5, r4
	lsrs r5, 5
	movs r6, 0xF8
	lsls r6, 7
	ands r4, r6
	lsrs r4, 10
	mov r6, r8
	muls r6, r1
	adds r1, r6, 0
	asrs r1, 4
	mov r6, r8
	subs r6, r1
	adds r1, r5, 0
	muls r1, r2
	asrs r1, 4
	subs r5, r1
	adds r1, r4, 0
	muls r1, r3
	asrs r1, 4
	subs r4, r1
	lsls r6, 16
	lsls r5, 21
	orrs r5, r6
	lsls r4, 26
	orrs r4, r5
	lsrs r4, 16
	ldr r1, _08085D7C
	adds r0, r1
	strh r4, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085D78: .4byte gPlttBufferUnfaded
_08085D7C: .4byte gPlttBufferFaded
	thumb_func_end sub_8085D08

	thumb_func_start sub_8085D80
sub_8085D80: @ 8085D80
	push {r4,lr}
	bl CalculatePlayerPartyCount
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08085DBC
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08085DC0
	adds r1, r0
	strh r4, [r1, 0xA]
	movs r0, 0x5D
	strh r0, [r1, 0xC]
	movs r0, 0x24
	strh r0, [r1, 0xE]
	movs r0, 0x7C
	strh r0, [r1, 0x10]
	movs r0, 0x18
	strh r0, [r1, 0x12]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08085DBC: .4byte sub_8085DC4
_08085DC0: .4byte gTasks
	thumb_func_end sub_8085D80

	thumb_func_start sub_8085DC4
sub_8085DC4: @ 8085DC4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08085DEC
	adds r1, r0
	ldr r2, _08085DF0
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	lsls r0, 2
	adds r0, r2
	ldr r2, [r0]
	adds r0, r1, 0
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_08085DEC: .4byte gTasks
_08085DF0: .4byte gUnknown_0839F268
	thumb_func_end sub_8085DC4

	thumb_func_start sub_8085DF4
sub_8085DF4: @ 8085DF4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	movs r3, 0xE
	ldrsh r2, [r4, r3]
	movs r3, 0x1
	bl sub_808604C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl sub_8086430
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x16]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8085DF4

	thumb_func_start sub_8085E30
sub_8085E30: @ 8085E30
	push {r4,lr}
	adds r2, r0, 0
	ldr r3, _08085E68
	movs r1, 0x14
	ldrsh r0, [r2, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r4, 0x2E
	ldrsh r0, [r1, r4]
	cmp r0, 0x1
	ble _08085E62
	movs r0, 0x16
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	strh r1, [r0, 0x2E]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_08085E62:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085E68: .4byte gSprites
	thumb_func_end sub_8085E30

	thumb_func_start sub_8085E6C
sub_8085E6C: @ 8085E6C
	push {lr}
	adds r3, r0, 0
	ldr r2, _08085E90
	movs r0, 0x14
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	ble _08085E8C
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08085E8C:
	pop {r0}
	bx r0
	.align 2, 0
_08085E90: .4byte gSprites
	thumb_func_end sub_8085E6C

	thumb_func_start sub_8085E94
sub_8085E94: @ 8085E94
	push {lr}
	ldr r2, _08085ECC
	movs r3, 0x14
	ldrsh r1, [r0, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x6
	ble _08085EC6
	adds r0, r1, 0
	bl DestroySprite
	movs r0, 0x19
	bl FieldEffectActiveListRemove
	ldr r0, _08085ED0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08085EC6:
	pop {r0}
	bx r0
	.align 2, 0
_08085ECC: .4byte gSprites
_08085ED0: .4byte sub_8085DC4
	thumb_func_end sub_8085E94

	thumb_func_start sub_8085ED4
sub_8085ED4: @ 8085ED4
	push {r4,lr}
	bl CalculatePlayerPartyCount
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08085F08
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08085F0C
	adds r1, r0
	strh r4, [r1, 0xA]
	movs r0, 0x75
	strh r0, [r1, 0xC]
	movs r0, 0x34
	strh r0, [r1, 0xE]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08085F08: .4byte sub_8085F10
_08085F0C: .4byte gTasks
	thumb_func_end sub_8085ED4

	thumb_func_start sub_8085F10
sub_8085F10: @ 8085F10
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08085F38
	adds r1, r0
	ldr r2, _08085F3C
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	lsls r0, 2
	adds r0, r2
	ldr r2, [r0]
	adds r0, r1, 0
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_08085F38: .4byte gTasks
_08085F3C: .4byte gUnknown_0839F278
	thumb_func_end sub_8085F10

	thumb_func_start sub_8085F40
sub_8085F40: @ 8085F40
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	movs r3, 0xE
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl sub_808604C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	ldr r0, _08085FB0
	bl FindTaskIdByFunc
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x78
	movs r2, 0x18
	movs r3, 0
	bl sub_80864CC
	adds r0, r4, 0
	movs r1, 0x28
	movs r2, 0x8
	movs r3, 0x1
	bl sub_80864CC
	adds r0, r4, 0
	movs r1, 0x48
	movs r2, 0x8
	movs r3, 0x1
	bl sub_80864CC
	adds r0, r4, 0
	movs r1, 0xA8
	movs r2, 0x8
	movs r3, 0x1
	bl sub_80864CC
	adds r0, r4, 0
	movs r1, 0xC8
	movs r2, 0x8
	movs r3, 0x1
	bl sub_80864CC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085FB0: .4byte sub_8085F10
	thumb_func_end sub_8085F40

	thumb_func_start sub_8085FB4
sub_8085FB4: @ 8085FB4
	push {lr}
	adds r3, r0, 0
	ldr r2, _08085FE0
	movs r0, 0x14
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	ble _08085FDA
	ldrh r0, [r3, 0x26]
	adds r0, 0x1
	strh r0, [r3, 0x26]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08085FDA:
	pop {r0}
	bx r0
	.align 2, 0
_08085FE0: .4byte gSprites
	thumb_func_end sub_8085FB4

	thumb_func_start sub_8085FE4
sub_8085FE4: @ 8085FE4
	push {lr}
	adds r3, r0, 0
	ldr r2, _08086008
	movs r0, 0x14
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	ble _08086004
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08086004:
	pop {r0}
	bx r0
	.align 2, 0
_08086008: .4byte gSprites
	thumb_func_end sub_8085FE4

	thumb_func_start sub_808600C
sub_808600C: @ 808600C
	push {lr}
	ldr r2, _08086044
	movs r3, 0x14
	ldrsh r1, [r0, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x6
	ble _0808603E
	adds r0, r1, 0
	bl DestroySprite
	movs r0, 0x3E
	bl FieldEffectActiveListRemove
	ldr r0, _08086048
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0808603E:
	pop {r0}
	bx r0
	.align 2, 0
_08086044: .4byte gSprites
_08086048: .4byte sub_8085F10
	thumb_func_end sub_808600C

	thumb_func_start sub_808604C
sub_808604C: @ 808604C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _08086098
	bl CreateInvisibleSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r2, _0808609C
	adds r1, r2
	strh r4, [r1, 0x24]
	strh r5, [r1, 0x26]
	strh r6, [r1, 0x38]
	mov r2, r8
	strh r2, [r1, 0x3A]
	strh r0, [r1, 0x3C]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08086098: .4byte sub_80860A0
_0808609C: .4byte gSprites
	thumb_func_end sub_808604C

	thumb_func_start sub_80860A0
sub_80860A0: @ 80860A0
	push {lr}
	ldr r2, _080860B8
	movs r3, 0x2E
	ldrsh r1, [r0, r3]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080860B8: .4byte gUnknown_0839F288
	thumb_func_end sub_80860A0

	thumb_func_start sub_80860BC
sub_80860BC: @ 80860BC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080860D4
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _08086130
_080860D4:
	movs r0, 0x19
	strh r0, [r4, 0x30]
	ldr r0, _08086148
	ldr r1, _0808614C
	movs r2, 0x32
	ldrsh r3, [r4, r2]
	lsls r3, 2
	adds r3, r1
	ldrh r1, [r4, 0x24]
	ldrh r2, [r3]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r4, 0x26]
	ldrh r3, [r3, 0x2]
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08086150
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x5]
	ldrh r0, [r4, 0x3C]
	strh r0, [r1, 0x2E]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x3A]
	subs r0, 0x1
	strh r0, [r4, 0x3A]
	movs r0, 0x17
	bl PlaySE
_08086130:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08086142
	movs r0, 0x20
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_08086142:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086148: .4byte gSpriteTemplate_839F208
_0808614C: .4byte gUnknown_0839F2A8
_08086150: .4byte gSprites
	thumb_func_end sub_80860BC

	thumb_func_start sub_8086154
sub_8086154: @ 8086154
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bne _08086184
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	movs r0, 0x8
	strh r0, [r1, 0x30]
	strh r2, [r1, 0x32]
	strh r2, [r1, 0x34]
	movs r2, 0x38
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _08086184
	movs r0, 0xB8
	lsls r0, 1
	bl PlayFanfare
_08086184:
	pop {r0}
	bx r0
	thumb_func_end sub_8086154

	thumb_func_start sub_8086188
sub_8086188: @ 8086188
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	ldrh r0, [r7, 0x30]
	subs r0, 0x1
	strh r0, [r7, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080861B8
	movs r0, 0x8
	strh r0, [r7, 0x30]
	ldrh r0, [r7, 0x32]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r7, 0x32]
	cmp r0, 0
	bne _080861B8
	ldrh r0, [r7, 0x34]
	adds r0, 0x1
	strh r0, [r7, 0x34]
_080861B8:
	ldrh r4, [r7, 0x32]
	adds r4, 0x3
	movs r0, 0x3
	mov r8, r0
	mov r1, r8
	ands r4, r1
	ldr r3, _080862B0
	mov r10, r3
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x84
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	ldr r6, _080862B4
	adds r1, r4, r6
	ldrb r1, [r1]
	ldr r5, _080862B8
	adds r2, r4, r5
	ldrb r2, [r2]
	ldr r3, _080862BC
	mov r9, r3
	add r4, r9
	ldrb r3, [r4]
	bl sub_8085C7C
	ldrh r4, [r7, 0x32]
	adds r4, 0x2
	mov r0, r8
	ands r4, r0
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x83
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	adds r1, r4, r6
	ldrb r1, [r1]
	adds r2, r4, r5
	ldrb r2, [r2]
	add r4, r9
	ldrb r3, [r4]
	bl sub_8085C7C
	ldrh r4, [r7, 0x32]
	adds r4, 0x1
	mov r3, r8
	ands r4, r3
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x81
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	adds r1, r4, r6
	ldrb r1, [r1]
	adds r2, r4, r5
	ldrb r2, [r2]
	add r4, r9
	ldrb r3, [r4]
	bl sub_8085C7C
	ldrh r4, [r7, 0x32]
	lsls r4, 24
	lsrs r4, 24
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r3, _080862C0
	adds r0, r3
	lsrs r0, 16
	adds r6, r4, r6
	ldrb r6, [r6]
	adds r5, r4, r5
	ldrb r5, [r5]
	add r4, r9
	ldrb r4, [r4]
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_8085C7C
	mov r0, r10
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r1, _080862C4
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_8085C7C
	movs r3, 0x34
	ldrsh r0, [r7, r3]
	cmp r0, 0x2
	ble _080862A2
	ldrh r0, [r7, 0x2E]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r7, 0x2E]
	movs r0, 0x8
	strh r0, [r7, 0x30]
	strh r1, [r7, 0x32]
_080862A2:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080862B0: .4byte 0x00001007
_080862B4: .4byte gUnknown_0839F2C0
_080862B8: .4byte gUnknown_0839F2C4
_080862BC: .4byte gUnknown_0839F2C8
_080862C0: .4byte 0x01050000
_080862C4: .4byte 0x01030000
	thumb_func_end sub_8086188

	thumb_func_start sub_80862C8
sub_80862C8: @ 80862C8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	subs r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080862F8
	movs r0, 0x8
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r2, 0x32]
	cmp r0, 0x3
	bne _080862F8
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	movs r0, 0x1E
	strh r0, [r2, 0x30]
_080862F8:
	ldrh r4, [r2, 0x32]
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080863A4
	mov r8, r0
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x84
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	ldr r1, _080863A8
	adds r1, r4, r1
	ldrb r6, [r1]
	ldr r1, _080863AC
	adds r1, r4, r1
	ldrb r5, [r1]
	ldr r1, _080863B0
	adds r4, r1
	ldrb r4, [r4]
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_8085C7C
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x83
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_8085C7C
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	movs r1, 0x81
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_8085C7C
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r1, _080863B4
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_8085C7C
	mov r0, r8
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r1, _080863B8
	adds r0, r1
	lsrs r0, 16
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_8085C7C
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080863A4: .4byte 0x00001007
_080863A8: .4byte gUnknown_0839F2C0
_080863AC: .4byte gUnknown_0839F2C4
_080863B0: .4byte gUnknown_0839F2C8
_080863B4: .4byte 0x01050000
_080863B8: .4byte 0x01030000
	thumb_func_end sub_80862C8

	thumb_func_start sub_80863BC
sub_80863BC: @ 80863BC
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080863D2
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
_080863D2:
	pop {r0}
	bx r0
	thumb_func_end sub_80863BC

	thumb_func_start sub_80863D8
sub_80863D8: @ 80863D8
	ldrh r1, [r0, 0x2E]
	adds r1, 0x1
	strh r1, [r0, 0x2E]
	bx lr
	thumb_func_end sub_80863D8

	thumb_func_start sub_80863E0
sub_80863E0: @ 80863E0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080863F6
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _080863FC
_080863F6:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_080863FC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80863E0

	thumb_func_start nullsub_57
nullsub_57: @ 8086404
	bx lr
	thumb_func_end nullsub_57

	thumb_func_start sub_8086408
sub_8086408: @ 8086408
	push {lr}
	adds r3, r0, 0
	ldr r2, _0808642C
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x2E
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	ble _08086428
	adds r0, r3, 0
	bl FieldEffectFreeGraphicsResources
_08086428:
	pop {r0}
	bx r0
	.align 2, 0
_0808642C: .4byte gSprites
	thumb_func_end sub_8086408

	thumb_func_start sub_8086430
sub_8086430: @ 8086430
	push {r4,lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _08086480
	lsls r3, 16
	asrs r3, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r3, 0
	movs r3, 0
	bl CreateSpriteAtEnd
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _08086484
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x5]
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _08086488
	bl SetSubspriteTables
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086480: .4byte gSpriteTemplate_839F220
_08086484: .4byte gSprites
_08086488: .4byte gUnknown_0839F1A0
	thumb_func_end sub_8086430

	thumb_func_start sub_808648C
sub_808648C: @ 808648C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080864B0
	movs r0, 0
	strh r0, [r4, 0x2E]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080864B0:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080864C4
	adds r0, r4, 0
	bl FieldEffectFreeGraphicsResources
_080864C4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_808648C

	thumb_func_start sub_80864CC
sub_80864CC: @ 80864CC
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	cmp r3, 0
	bne _08086514
	ldr r0, _08086508
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _0808650C
	adds r0, r1
	ldr r1, _08086510
	bl SetSubspriteTables
	b _08086528
	.align 2, 0
_08086508: .4byte gSpriteTemplate_839F238
_0808650C: .4byte gSprites
_08086510: .4byte gUnknown_0839F1C8
_08086514:
	ldr r0, _08086548
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r4, r0, 24
_08086528:
	ldr r1, _0808654C
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r3]
	strh r5, [r0, 0x2E]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086548: .4byte gSpriteTemplate_839F250
_0808654C: .4byte gSprites
	thumb_func_end sub_80864CC

	thumb_func_start sub_8086550
sub_8086550: @ 8086550
	push {lr}
	adds r3, r0, 0
	ldr r2, _080865B8
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x26
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080865A6
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _0808657E
	subs r0, r1, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080865A0
_0808657E:
	movs r0, 0x10
	strh r0, [r3, 0x30]
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
_080865A0:
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
_080865A6:
	movs r2, 0x32
	ldrsh r0, [r3, r2]
	cmp r0, 0x7F
	ble _080865B4
	adds r0, r3, 0
	bl FieldEffectFreeGraphicsResources
_080865B4:
	pop {r0}
	bx r0
	.align 2, 0
_080865B8: .4byte gTasks
	thumb_func_end sub_8086550

	thumb_func_start sub_80865BC
sub_80865BC: @ 80865BC
	push {lr}
	ldr r0, _080865D0
	bl SetMainCallback2
	ldr r1, _080865D4
	ldr r0, _080865D8
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080865D0: .4byte c2_exit_to_overworld_2_switch
_080865D4: .4byte gUnknown_0300485C
_080865D8: .4byte mapldr_080842E8
	thumb_func_end sub_80865BC

	thumb_func_start mapldr_080842E8
mapldr_080842E8: @ 80865DC
	push {lr}
	bl pal_fill_black
	ldr r0, _080865FC
	movs r1, 0
	bl CreateTask
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r1, _08086600
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080865FC: .4byte task00_8084310
_08086600: .4byte gUnknown_0300485C
	thumb_func_end mapldr_080842E8

	thumb_func_start task00_8084310
task00_8084310: @ 8086604
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _0808666C
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0
	bne _08086640
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	beq _08086666
	ldr r1, _08086670
	ldr r0, _08086674
	ldrb r0, [r0]
	str r0, [r1]
	cmp r0, 0x5
	ble _08086634
	str r5, [r1]
_08086634:
	movs r0, 0x1F
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086640:
	movs r0, 0x1F
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08086666
	bl flag_var_implications_of_teleport_
	bl warp_in
	ldr r0, _08086678
	bl SetMainCallback2
	ldr r1, _0808667C
	ldr r0, _08086680
	str r0, [r1]
	adds r0, r6, 0
	bl DestroyTask
_08086666:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808666C: .4byte gTasks
_08086670: .4byte gUnknown_0202FF84
_08086674: .4byte gUnknown_03005CE0
_08086678: .4byte CB2_LoadMap
_0808667C: .4byte gUnknown_0300485C
_08086680: .4byte mapldr_08084390
	thumb_func_end task00_8084310

	thumb_func_start mapldr_08084390
mapldr_08084390: @ 8086684
	push {r4,lr}
	bl sub_8053E90
	bl pal_fill_black
	ldr r0, _080866DC
	movs r1, 0
	bl CreateTask
	ldr r4, _080866E0
	ldr r3, _080866E4
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldrb r1, [r3]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080866C6
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x3
	bl FieldObjectTurn
_080866C6:
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r1, _080866E8
	movs r0, 0
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080866DC: .4byte c3_080843F8
_080866E0: .4byte gMapObjects
_080866E4: .4byte gPlayerAvatar
_080866E8: .4byte gUnknown_0300485C
	thumb_func_end mapldr_08084390

	thumb_func_start c3_080843F8
c3_080843F8: @ 80866EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08086740
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0808671E
	ldr r0, _08086744
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08086738
	movs r0, 0x20
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0808671E:
	movs r0, 0x20
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08086738
	bl ScriptContext2_Disable
	bl sub_806451C
	adds r0, r5, 0
	bl DestroyTask
_08086738:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086740: .4byte gTasks
_08086744: .4byte gPaletteFade
	thumb_func_end c3_080843F8

	thumb_func_start sub_8086748
sub_8086748: @ 8086748
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_maplights
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r0, _0808676C
	movs r1, 0
	bl CreateTask
	ldr r1, _08086770
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0808676C: .4byte sub_8086774
_08086770: .4byte gUnknown_0300485C
	thumb_func_end sub_8086748

	thumb_func_start sub_8086774
sub_8086774: @ 8086774
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080867A4
	adds r4, r1, r0
	ldr r5, _080867A8
_08086786:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08086786
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080867A4: .4byte gTasks
_080867A8: .4byte gUnknown_0839F2CC
	thumb_func_end sub_8086774

	thumb_func_start sub_80867AC
sub_80867AC: @ 80867AC
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	mov r9, r0
	ldr r6, _08086848
	ldrb r0, [r6, 0x5]
	lsls r5, r0, 3
	adds r5, r0
	lsls r5, 2
	ldr r0, _0808684C
	mov r8, r0
	add r5, r8
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08086850
	adds r4, r0
	bl CameraObjectReset2
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	movs r0, 0x1
	strb r0, [r6, 0x6]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	adds r3, r4, 0
	adds r3, 0x42
	ldrb r0, [r3]
	lsrs r0, 6
	mov r1, r9
	strh r0, [r1, 0x10]
	ldrb r0, [r5, 0x3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r5, 0x3]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
	ldrb r1, [r3]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3]
	mov r1, r9
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x1
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08086848: .4byte gPlayerAvatar
_0808684C: .4byte gMapObjects
_08086850: .4byte gSprites
	thumb_func_end sub_80867AC

	thumb_func_start sub_8086854
sub_8086854: @ 8086854
	push {r4,lr}
	adds r4, r0, 0
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	beq _08086868
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086868:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8086854

	thumb_func_start sub_8086870
sub_8086870: @ 8086870
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080868D4
	ldrb r0, [r6, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080868D8
	adds r2, r0
	adds r0, r2, 0
	adds r0, 0x29
	movs r4, 0
	ldrsb r4, [r0, r4]
	lsls r0, r4, 17
	negs r0, r0
	ldrh r1, [r2, 0x22]
	ldr r3, _080868DC
	adds r1, r4
	ldrh r3, [r3]
	adds r1, r3
	asrs r0, 16
	adds r0, r1
	negs r0, r0
	movs r1, 0
	strh r0, [r2, 0x26]
	movs r0, 0x1
	strh r0, [r5, 0xA]
	strh r1, [r5, 0xC]
	ldr r2, _080868E0
	ldrb r0, [r6, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	movs r0, 0x2B
	bl PlaySE
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080868D4: .4byte gPlayerAvatar
_080868D8: .4byte gSprites
_080868DC: .4byte gSpriteCoordOffsetY
_080868E0: .4byte gMapObjects
	thumb_func_end sub_8086870

	thumb_func_start sub_80868E4
sub_80868E4: @ 80868E4
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r2, _08086990
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086994
	adds r6, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086998
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	ldrh r1, [r5, 0x26]
	adds r0, r1
	strh r0, [r5, 0x26]
	ldrh r2, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bgt _08086926
	ldrh r1, [r4, 0xC]
	adds r0, r2, r1
	strh r0, [r4, 0xC]
	movs r1, 0xF
	ands r0, r1
	cmp r0, 0
	beq _08086926
	lsls r0, r2, 1
	strh r0, [r4, 0xA]
_08086926:
	ldrh r2, [r4, 0xE]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08086964
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	blt _08086964
	adds r0, r2, 0x1
	strh r0, [r4, 0xE]
	ldrb r1, [r6, 0x3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r6, 0x3]
	ldrb r1, [r4, 0x10]
	adds r3, r5, 0
	adds r3, 0x42
	lsls r1, 6
	ldrb r2, [r3]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
_08086964:
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _08086988
	movs r0, 0xD6
	bl PlaySE
	ldrb r0, [r6]
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r6]
	movs r0, 0
	strh r0, [r5, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086988:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08086990: .4byte gPlayerAvatar
_08086994: .4byte gMapObjects
_08086998: .4byte gSprites
	thumb_func_end sub_80868E4

	thumb_func_start sub_808699C
sub_808699C: @ 808699C
	push {lr}
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	movs r2, 0
	strh r1, [r0, 0x8]
	movs r1, 0x4
	strh r1, [r0, 0xA]
	strh r2, [r0, 0xC]
	movs r0, 0
	bl SetCameraPanningCallback
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_808699C

	thumb_func_start sub_80869B8
sub_80869B8: @ 80869B8
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
	ldrh r0, [r4, 0xA]
	negs r2, r0
	strh r2, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _080869E0
	lsls r0, r2, 16
	asrs r0, 17
	strh r0, [r4, 0xA]
_080869E0:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080869EE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080869EE:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80869B8

	thumb_func_start sub_80869F8
sub_80869F8: @ 80869F8
	push {lr}
	ldr r1, _08086A24
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	bl CameraObjectReset1
	bl sub_806451C
	bl InstallCameraPanAheadCallback
	ldr r0, _08086A28
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08086A24: .4byte gPlayerAvatar
_08086A28: .4byte sub_8086774
	thumb_func_end sub_80869F8

	thumb_func_start sub_8086A2C
sub_8086A2C: @ 8086A2C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08086A60
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08086A64
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0xA]
	cmp r4, 0x6A
	bne _08086A58
	movs r0, 0x1
	strh r0, [r1, 0xA]
_08086A58:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086A60: .4byte sub_8086A68
_08086A64: .4byte gTasks
	thumb_func_end sub_8086A2C

	thumb_func_start sub_8086A68
sub_8086A68: @ 8086A68
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08086A98
	adds r4, r1, r0
	ldr r5, _08086A9C
_08086A7A:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08086A7A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086A98: .4byte gTasks
_08086A9C: .4byte gUnknown_0839F2E8
	thumb_func_end sub_8086A68

	thumb_func_start sub_8086AA0
sub_8086AA0: @ 8086AA0
	push {r4,lr}
	adds r4, r0, 0
	bl player_bitmagic
	bl CameraObjectReset2
	ldrb r0, [r4, 0xA]
	bl sub_80B4824
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8086AA0

	thumb_func_start sub_8086AC0
sub_8086AC0: @ 8086AC0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08086B28
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086B2C
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08086AEA
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086B1E
_08086AEA:
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0x8]
	strh r1, [r5, 0xC]
	strh r1, [r5, 0xE]
	ldrb r0, [r5, 0xA]
	cmp r0, 0
	bne _08086B18
	movs r0, 0x4
	strh r0, [r5, 0x8]
_08086B18:
	movs r0, 0x50
	bl PlaySE
_08086B1E:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08086B28: .4byte gPlayerAvatar
_08086B2C: .4byte gMapObjects
	thumb_func_end sub_8086AC0

	thumb_func_start sub_8086B30
sub_8086B30: @ 8086B30
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8086B98
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _08086B4A
	bl sub_8086C30
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086B4A:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8086B30

	thumb_func_start sub_8086B54
sub_8086B54: @ 8086B54
	push {lr}
	bl sub_8086B98
	bl sub_8086C40
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8086B54

	thumb_func_start sub_8086B64
sub_8086B64: @ 8086B64
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8086BE4
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _08086B7E
	bl sub_8086C30
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086B7E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8086B64

	thumb_func_start sub_8086B88
sub_8086B88: @ 8086B88
	push {lr}
	bl sub_8086BE4
	bl sub_8086C40
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8086B88

	thumb_func_start sub_8086B98
sub_8086B98: @ 8086B98
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08086BDC
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08086BE0
	adds r4, r0
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	movs r0, 0x84
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	movs r0, 0x94
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08086BD6
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
_08086BD6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086BDC: .4byte gPlayerAvatar
_08086BE0: .4byte gSprites
	thumb_func_end sub_8086B98

	thumb_func_start sub_8086BE4
sub_8086BE4: @ 8086BE4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08086C28
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08086C2C
	adds r4, r0
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	movs r0, 0x7C
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	movs r0, 0x76
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08086C22
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
_08086C22:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086C28: .4byte gPlayerAvatar
_08086C2C: .4byte gSprites
	thumb_func_end sub_8086BE4

	thumb_func_start sub_8086C30
sub_8086C30: @ 8086C30
	push {lr}
	bl sub_8053FF8
	bl sub_8080918
	pop {r0}
	bx r0
	thumb_func_end sub_8086C30

	thumb_func_start sub_8086C40
sub_8086C40: @ 8086C40
	push {lr}
	ldr r0, _08086C80
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08086C7C
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08086C7C
	bl sub_80B483C
	bl warp_in
	ldr r1, _08086C84
	ldr r0, _08086C88
	str r0, [r1]
	ldr r0, _08086C8C
	bl SetMainCallback2
	ldr r0, _08086C90
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08086C7C:
	pop {r0}
	bx r0
	.align 2, 0
_08086C80: .4byte gPaletteFade
_08086C84: .4byte gUnknown_0300485C
_08086C88: .4byte sub_8086C94
_08086C8C: .4byte CB2_LoadMap
_08086C90: .4byte sub_8086A68
	thumb_func_end sub_8086C40

	thumb_func_start sub_8086C94
sub_8086C94: @ 8086C94
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_maplights
	bl ScriptContext2_Enable
	ldr r0, _08086CB4
	movs r1, 0
	bl CreateTask
	ldr r1, _08086CB8
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08086CB4: .4byte sub_8086CBC
_08086CB8: .4byte gUnknown_0300485C
	thumb_func_end sub_8086C94

	thumb_func_start sub_8086CBC
sub_8086CBC: @ 8086CBC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08086CEC
	adds r4, r1, r0
	ldr r5, _08086CF0
_08086CCE:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08086CCE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086CEC: .4byte gTasks
_08086CF0: .4byte gUnknown_0839F300
	thumb_func_end sub_8086CBC

	thumb_func_start sub_8086CF4
sub_8086CF4: @ 8086CF4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	bl CameraObjectReset2
	ldr r0, _08086D54
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08086D58
	adds r4, r0
	movs r0, 0x4
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r1, r0, 24
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x10
	strh r0, [r5, 0xA]
	cmp r1, 0x6B
	bne _08086D5C
	movs r1, 0x1
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _08086D5E
	.align 2, 0
_08086D54: .4byte gPlayerAvatar
_08086D58: .4byte gMapObjects
_08086D5C:
	movs r1, 0
_08086D5E:
	adds r0, r1, 0
	bl sub_80B4824
	movs r0, 0x1
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8086CF4

	thumb_func_start sub_8086D70
sub_8086D70: @ 8086D70
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08086DA8
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08086DAC
	adds r4, r0
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x84
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x94
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08086DA8: .4byte gPlayerAvatar
_08086DAC: .4byte gSprites
	thumb_func_end sub_8086D70

	thumb_func_start sub_8086DB0
sub_8086DB0: @ 8086DB0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _08086E08
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086E0C
	adds r5, r0, r1
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x84
	bl Cos
	strh r0, [r5, 0x24]
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x94
	bl Sin
	strh r0, [r5, 0x26]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08086DEE
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
_08086DEE:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08086DFE
	strh r0, [r5, 0x24]
	strh r0, [r5, 0x26]
	movs r0, 0x5
	strh r0, [r4, 0x8]
_08086DFE:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08086E08: .4byte gPlayerAvatar
_08086E0C: .4byte gSprites
	thumb_func_end sub_8086DB0

	thumb_func_start sub_8086E10
sub_8086E10: @ 8086E10
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08086E48
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08086E4C
	adds r4, r0
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x7C
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x76
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08086E48: .4byte gPlayerAvatar
_08086E4C: .4byte gSprites
	thumb_func_end sub_8086E10

	thumb_func_start sub_8086E50
sub_8086E50: @ 8086E50
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _08086EA8
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086EAC
	adds r5, r0, r1
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x7C
	bl Cos
	strh r0, [r5, 0x24]
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0x76
	bl Sin
	strh r0, [r5, 0x26]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08086E8E
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
_08086E8E:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08086EA0
	strh r0, [r5, 0x24]
	strh r0, [r5, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08086EA0:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08086EA8: .4byte gPlayerAvatar
_08086EAC: .4byte gSprites
	thumb_func_end sub_8086E50

	thumb_func_start sub_8086EB0
sub_8086EB0: @ 8086EB0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80B4850
	lsls r0, 24
	cmp r0, 0
	bne _08086ECC
	bl sub_80B483C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	b _08086ECE
_08086ECC:
	movs r0, 0
_08086ECE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8086EB0

	thumb_func_start sub_8086ED4
sub_8086ED4: @ 8086ED4
	push {r4,lr}
	ldr r0, _08086F20
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08086F24
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08086F18
	bl CameraObjectReset1
	bl ScriptContext2_Disable
	movs r0, 0x4
	bl GetGoSpeed0AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldr r0, _08086F28
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08086F18:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086F20: .4byte gPlayerAvatar
_08086F24: .4byte gMapObjects
_08086F28: .4byte sub_8086CBC
	thumb_func_end sub_8086ED4

	thumb_func_start sub_8086F2C
sub_8086F2C: @ 8086F2C
	push {r4,lr}
	ldr r4, _08086F58
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08086F5C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _08086F60
	ldr r2, [r2]
	strh r2, [r1, 0xA]
	bl _call_via_r4
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086F58: .4byte sub_8086F64
_08086F5C: .4byte gTasks
_08086F60: .4byte gUnknown_0202FF84
	thumb_func_end sub_8086F2C

	thumb_func_start sub_8086F64
sub_8086F64: @ 8086F64
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08086FA0
	ldr r2, _08086FA4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08086F76:
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	lsls r2, 2
	adds r2, r5
	ldr r0, _08086FA8
	ldrb r0, [r0, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08086FAC
	adds r1, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _08086F76
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08086FA0: .4byte gUnknown_0839F31C
_08086FA4: .4byte gTasks
_08086FA8: .4byte gPlayerAvatar
_08086FAC: .4byte gMapObjects
	thumb_func_end sub_8086F64

	thumb_func_start sub_8086FB0
sub_8086FB0: @ 8086FB0
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	ldr r1, _08086FCC
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08086FCC: .4byte gPlayerAvatar
	thumb_func_end sub_8086FB0

	thumb_func_start waterfall_1_do_anim_probably
waterfall_1_do_anim_probably: @ 8086FD0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl ScriptContext2_Enable
	adds r0, r5, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	bne _08087000
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	ldr r1, _08087008
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, 0x3B
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08087000:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08087008: .4byte gUnknown_0202FF84
	thumb_func_end waterfall_1_do_anim_probably

	thumb_func_start waterfall_2_wait_anim_finish_probably
waterfall_2_wait_anim_finish_probably: @ 808700C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08087026
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	b _08087028
_08087026:
	movs r0, 0
_08087028:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end waterfall_2_wait_anim_finish_probably

	thumb_func_start sub_8087030
sub_8087030: @ 8087030
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r0, 0x2
	bl GetSimpleGoAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8087030

	thumb_func_start sub_8087058
sub_8087058: @ 8087058
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	bne _0808706E
	movs r0, 0
	b _080870AA
_0808706E:
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080870A4
	bl ScriptContext2_Disable
	ldr r0, _0808709C
	strb r4, [r0, 0x6]
	ldr r0, _080870A0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0x2B
	bl FieldEffectActiveListRemove
	movs r0, 0
	b _080870AA
	.align 2, 0
_0808709C: .4byte gPlayerAvatar
_080870A0: .4byte sub_8086F64
_080870A4:
	movs r0, 0x3
	strh r0, [r5, 0x8]
	movs r0, 0x1
_080870AA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8087058

	thumb_func_start sub_80870B0
sub_80870B0: @ 80870B0
	push {r4,lr}
	ldr r4, _080870E0
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080870E4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080870E8
	ldr r2, [r3]
	strh r2, [r1, 0x26]
	ldr r2, [r3, 0x4]
	strh r2, [r1, 0x24]
	bl _call_via_r4
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080870E0: .4byte sub_80870EC
_080870E4: .4byte gTasks
_080870E8: .4byte gUnknown_0202FF84
	thumb_func_end sub_80870B0

	thumb_func_start sub_80870EC
sub_80870EC: @ 80870EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0808711C
	ldr r2, _08087120
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080870FE:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080870FE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808711C: .4byte gUnknown_0839F330
_08087120: .4byte gTasks
	thumb_func_end sub_80870EC

	thumb_func_start sub_8087124
sub_8087124: @ 8087124
	ldr r2, _08087134
	movs r1, 0x1
	strb r1, [r2, 0x6]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	movs r0, 0
	bx lr
	.align 2, 0
_08087134: .4byte gPlayerAvatar
	thumb_func_end sub_8087124

	thumb_func_start dive_2_unknown
dive_2_unknown: @ 8087138
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	ldr r1, _0808715C
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, 0x3B
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808715C: .4byte gUnknown_0202FF84
	thumb_func_end dive_2_unknown

	thumb_func_start dive_3_unknown
dive_3_unknown: @ 8087160
	push {lr}
	sub sp, 0x8
	mov r1, sp
	adds r1, 0x2
	mov r0, sp
	bl PlayerGetDestCoords
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _080871A4
	ldr r2, _080871AC
	ldr r0, _080871B0
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1E]
	mov r0, sp
	bl dive_warp
	ldr r0, _080871B4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0x2C
	bl FieldEffectActiveListRemove
_080871A4:
	movs r0, 0
	add sp, 0x8
	pop {r1}
	bx r1
	.align 2, 0
_080871AC: .4byte gMapObjects
_080871B0: .4byte gPlayerAvatar
_080871B4: .4byte sub_80870EC
	thumb_func_end dive_3_unknown

	thumb_func_start sub_80871B8
sub_80871B8: @ 80871B8
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _080871CC
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080871CC: .4byte sub_80871D0
	thumb_func_end sub_80871B8

	thumb_func_start sub_80871D0
sub_80871D0: @ 80871D0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _08087218
	ldr r2, _0808721C
	ldr r5, _08087220
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080871E4:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08087224
	adds r1, r0
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08087228
	adds r2, r0
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _080871E4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087218: .4byte gUnknown_0839F33C
_0808721C: .4byte gTasks
_08087220: .4byte gPlayerAvatar
_08087224: .4byte gMapObjects
_08087228: .4byte gSprites
	thumb_func_end sub_80871D0

	thumb_func_start sub_808722C
sub_808722C: @ 808722C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl player_bitmagic
	bl CameraObjectReset2
	movs r0, 0
	bl SetCameraPanningCallback
	ldr r0, _08087260
	movs r2, 0x1
	strb r2, [r0, 0x6]
	ldrb r0, [r5, 0x3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x3]
	strh r2, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08087260: .4byte gPlayerAvatar
	thumb_func_end sub_808722C

	thumb_func_start sub_8087264
sub_8087264: @ 8087264
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
	ldrh r0, [r4, 0xA]
	negs r0, r0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _08087290
	movs r0, 0
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08087290:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8087264

	thumb_func_start sub_8087298
sub_8087298: @ 8087298
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r2, 0x26]
	movs r0, 0x1
	strh r0, [r4, 0xE]
	ldr r3, _080872E0
	movs r5, 0x10
	ldrsh r0, [r1, r5]
	str r0, [r3]
	movs r5, 0x12
	ldrsh r0, [r1, r5]
	str r0, [r3, 0x4]
	adds r0, r2, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r3, 0x8]
	ldrb r0, [r2, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r3, 0xC]
	movs r0, 0x32
	bl FieldEffectStart
	movs r0, 0xB2
	bl PlaySE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080872E0: .4byte gUnknown_0202FF84
	thumb_func_end sub_8087298

	thumb_func_start sub_80872E4
sub_80872E4: @ 80872E4
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	adds r5, r2, 0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	movs r0, 0
	bl SetCameraPanning
	ldrh r0, [r4, 0xA]
	negs r2, r0
	strh r2, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r1, r0, 0x1
	strh r1, [r4, 0xC]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x11
	bgt _0808731E
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	bne _08087330
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x3
	bgt _08087330
	lsls r0, r2, 1
	b _0808732E
_0808731E:
	movs r0, 0x4
	ands r1, r0
	cmp r1, 0
	bne _08087330
	lsls r0, r2, 16
	cmp r0, 0
	ble _08087330
	asrs r0, 17
_0808732E:
	strh r0, [r4, 0xA]
_08087330:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	ble _0808737C
	adds r0, r5, 0
	adds r0, 0x29
	movs r1, 0
	ldrsb r1, [r0, r1]
	lsls r2, r1, 17
	negs r2, r2
	movs r7, 0x26
	ldrsh r3, [r5, r7]
	movs r7, 0x22
	ldrsh r0, [r5, r7]
	adds r0, r1
	ldr r1, _08087374
	movs r7, 0
	ldrsh r1, [r1, r7]
	adds r0, r1
	asrs r2, 16
	adds r0, r2
	cmn r3, r0
	ble _08087378
	ldrh r0, [r5, 0x26]
	ldrh r1, [r4, 0xE]
	subs r0, r1
	strh r0, [r5, 0x26]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x7
	bgt _0808737C
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _0808737C
	.align 2, 0
_08087374: .4byte gSpriteCoordOffsetY
_08087378:
	movs r0, 0x1
	strh r0, [r4, 0x10]
_0808737C:
	ldrh r2, [r4, 0x12]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080873BA
	movs r7, 0x26
	ldrsh r1, [r5, r7]
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080873BA
	adds r0, r2, 0x1
	strh r0, [r4, 0x12]
	ldrb r0, [r6, 0x3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r6, 0x3]
	ldrb r1, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
_080873BA:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080873D0
	movs r7, 0x10
	ldrsh r0, [r4, r7]
	cmp r0, 0
	beq _080873D0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080873D0:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80872E4

	thumb_func_start sub_80873D8
sub_80873D8: @ 80873D8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8053FF8
	bl sub_8080918
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80873D8

	thumb_func_start sub_80873F4
sub_80873F4: @ 80873F4
	push {lr}
	ldr r0, _08087434
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808742C
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808742C
	bl warp_in
	ldr r1, _08087438
	ldr r0, _0808743C
	str r0, [r1]
	ldr r0, _08087440
	bl SetMainCallback2
	ldr r0, _08087444
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0808742C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08087434: .4byte gPaletteFade
_08087438: .4byte gUnknown_0300485C
_0808743C: .4byte mapldr_080851BC
_08087440: .4byte CB2_LoadMap
_08087444: .4byte sub_80871D0
	thumb_func_end sub_80873F4

	thumb_func_start mapldr_080851BC
mapldr_080851BC: @ 8087448
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_maplights
	bl ScriptContext2_Enable
	ldr r0, _08087468
	movs r1, 0
	str r1, [r0]
	ldr r0, _0808746C
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08087468: .4byte gUnknown_0300485C
_0808746C: .4byte sub_8087470
	thumb_func_end mapldr_080851BC

	thumb_func_start sub_8087470
sub_8087470: @ 8087470
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _080874B8
	ldr r2, _080874BC
	ldr r5, _080874C0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08087484:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _080874C4
	adds r1, r0
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080874C8
	adds r2, r0
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _08087484
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080874B8: .4byte gUnknown_0839F354
_080874BC: .4byte gTasks
_080874C0: .4byte gPlayerAvatar
_080874C4: .4byte gMapObjects
_080874C8: .4byte gSprites
	thumb_func_end sub_8087470

	thumb_func_start sub_80874CC
sub_80874CC: @ 80874CC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	bl CameraObjectReset2
	bl player_bitmagic
	ldr r1, _080874F8
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080874F8: .4byte gPlayerAvatar
	thumb_func_end sub_80874CC

	thumb_func_start sub_80874FC
sub_80874FC: @ 80874FC
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	beq _0808753C
	ldr r1, _08087544
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	str r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r5, r2]
	str r0, [r1, 0x4]
	adds r0, r6, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r1, 0x8]
	ldrb r0, [r6, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r1, 0xC]
	movs r0, 0x31
	bl FieldEffectStart
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0808753C:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08087544: .4byte gUnknown_0202FF84
	thumb_func_end sub_80874FC

	thumb_func_start sub_8087548
sub_8087548: @ 8087548
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0xA
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087598
	adds r0, r1
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _08087590
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	ldrb r1, [r4, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	bl CameraObjectReset1
	movs r0, 0xAF
	bl PlaySE
	movs r0, 0x4
	bl sub_80608A4
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
_08087590:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08087598: .4byte gSprites
	thumb_func_end sub_8087548

	thumb_func_start sub_808759C
sub_808759C: @ 808759C
	push {lr}
	adds r0, r1, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080875C6
	ldr r1, _080875CC
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	bl sub_806451C
	ldr r0, _080875D0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_080875C6:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080875CC: .4byte gPlayerAvatar
_080875D0: .4byte sub_8087470
	thumb_func_end sub_808759C

	thumb_func_start sub_80875D4
sub_80875D4: @ 80875D4
	push {r4,lr}
	ldr r4, _0808762C
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08087630
	adds r0, 0x84
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08087634
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	movs r1, 0x3
	ldrb r3, [r4, 0xC]
	ands r3, r1
	lsls r3, 2
	ldrb r4, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	orrs r1, r3
	strb r1, [r2, 0x5]
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x2
	orrs r1, r3
	strb r1, [r2]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808762C: .4byte gUnknown_0202FF84
_08087630: .4byte gFieldEffectObjectTemplatePointers
_08087634: .4byte gSprites
	thumb_func_end sub_80875D4

	thumb_func_start sub_8087638
sub_8087638: @ 8087638
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08087650
	adds r0, r2, 0
	movs r1, 0x32
	bl FieldEffectStop
_08087650:
	pop {r0}
	bx r0
	thumb_func_end sub_8087638

	thumb_func_start sub_8087654
sub_8087654: @ 8087654
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08087668
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08087668: .4byte sub_808766C
	thumb_func_end sub_8087654

	thumb_func_start sub_808766C
sub_808766C: @ 808766C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _080876B4
	ldr r2, _080876B8
	ldr r5, _080876BC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08087680:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _080876C0
	adds r1, r0
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080876C4
	adds r2, r0
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _08087680
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080876B4: .4byte gUnknown_0839F364
_080876B8: .4byte gTasks
_080876BC: .4byte gPlayerAvatar
_080876C0: .4byte gMapObjects
_080876C4: .4byte gSprites
	thumb_func_end sub_808766C

	thumb_func_start sub_80876C8
sub_80876C8: @ 80876C8
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	bl player_bitmagic
	bl CameraObjectReset2
	ldr r1, _080876F4
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrb r0, [r4, 0x3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x3]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080876F4: .4byte gPlayerAvatar
	thumb_func_end sub_80876C8

	thumb_func_start sub_80876F8
sub_80876F8: @ 80876F8
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0808776C
	ldrh r1, [r5, 0xA]
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	cmp r0, 0x3
	ble _0808774C
	ldr r1, _08087748
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	str r0, [r1, 0x4]
	adds r0, r6, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r1, 0x8]
	ldrb r0, [r6, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r1, 0xC]
	movs r0, 0x31
	bl FieldEffectStart
	strh r0, [r5, 0xA]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _0808776C
	.align 2, 0
_08087748: .4byte gUnknown_0202FF84
_0808774C:
	adds r0, r1, 0x1
	strh r0, [r5, 0xA]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay4AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	movs r0, 0x27
	bl PlaySE
_0808776C:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80876F8

	thumb_func_start sub_8087774
sub_8087774: @ 8087774
	push {r4,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	ldr r2, _080877A8
	movs r0, 0xA
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0808779E
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_0808779E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080877A8: .4byte gSprites
	thumb_func_end sub_8087774

	thumb_func_start sub_80877AC
sub_80877AC: @ 80877AC
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x31
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _080877CA
	bl sub_8053FF8
	bl sub_8080918
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080877CA:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80877AC

	thumb_func_start sub_80877D4
sub_80877D4: @ 80877D4
	push {lr}
	ldr r0, _08087814
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808780C
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808780C
	bl warp_in
	ldr r1, _08087818
	ldr r0, _0808781C
	str r0, [r1]
	ldr r0, _08087820
	bl SetMainCallback2
	ldr r0, _08087824
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0808780C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08087814: .4byte gPaletteFade
_08087818: .4byte gUnknown_0300485C
_0808781C: .4byte sub_8086748
_08087820: .4byte CB2_LoadMap
_08087824: .4byte sub_808766C
	thumb_func_end sub_80877D4

	thumb_func_start sub_8087828
sub_8087828: @ 8087828
	push {r4,lr}
	ldr r4, _08087880
	adds r1, r4, 0x4
	adds r0, r4, 0
	movs r2, 0x8
	movs r3, 0x8
	bl sub_8060470
	ldr r0, _08087884
	adds r0, 0x80
	ldr r0, [r0]
	movs r2, 0
	ldrsh r1, [r4, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	ldrb r3, [r4, 0x8]
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08087888
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	movs r1, 0x3
	ldrb r3, [r4, 0xC]
	ands r3, r1
	lsls r3, 2
	ldrb r4, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r4
	orrs r1, r3
	strb r1, [r2, 0x5]
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x2
	orrs r1, r3
	strb r1, [r2]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08087880: .4byte gUnknown_0202FF84
_08087884: .4byte gFieldEffectObjectTemplatePointers
_08087888: .4byte gSprites
	thumb_func_end sub_8087828

	thumb_func_start sub_808788C
sub_808788C: @ 808788C
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080878A4
	adds r0, r2, 0
	movs r1, 0x31
	bl FieldEffectStop
_080878A4:
	pop {r0}
	bx r0
	thumb_func_end sub_808788C

	thumb_func_start sub_80878A8
sub_80878A8: @ 80878A8
	push {lr}
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r0, _080878C0
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080878C0: .4byte sub_80878C4
	thumb_func_end sub_80878A8

	thumb_func_start sub_80878C4
sub_80878C4: @ 80878C4
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080878EC
	ldr r2, _080878F0
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080878EC: .4byte gUnknown_0839F378
_080878F0: .4byte gTasks
	thumb_func_end sub_80878C4

	thumb_func_start sub_80878F4
sub_80878F4: @ 80878F4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x40
	strh r0, [r4, 0x24]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80878F4

	thumb_func_start sub_8087914
sub_8087914: @ 8087914
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _080879B8
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldrh r1, [r4, 0x24]
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08087940
	subs r0, r1, 0x1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _08087940
	bl sub_8053FF8
	bl sub_8080918
_08087940:
	ldr r0, _080879BC
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080879C0
	adds r5, r0, r1
	adds r0, r5, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08087966
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08087A20
_08087966:
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080879D8
	ldr r0, _080879C4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080879D8
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080879D8
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetDirection
	bl sub_8053678
	bl warp_in
	ldr r1, _080879C8
	ldr r0, _080879CC
	str r0, [r1]
	ldr r0, _080879D0
	bl SetMainCallback2
	ldr r0, _080879D4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	b _08087A20
	.align 2, 0
_080879B8: .4byte gUnknown_0839F380
_080879BC: .4byte gPlayerAvatar
_080879C0: .4byte gMapObjects
_080879C4: .4byte gPaletteFade
_080879C8: .4byte gUnknown_0300485C
_080879CC: .4byte mapldr_080859D4
_080879D0: .4byte CB2_LoadMap
_080879D4: .4byte sub_80878C4
_080879D8:
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080879EC
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08087A20
_080879EC:
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r0, [r0]
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	ldrh r1, [r4, 0xC]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0xB
	bgt _08087A14
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
_08087A14:
	ldrh r1, [r4, 0xC]
	lsls r1, 16
	asrs r1, 18
	movs r0, 0x8
	asrs r0, r1
	strh r0, [r4, 0xA]
_08087A20:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8087914

	thumb_func_start mapldr_080859D4
mapldr_080859D4: @ 8087A28
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_maplights
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r1, _08087A64
	movs r0, 0
	str r0, [r1]
	ldr r2, _08087A68
	ldr r0, _08087A6C
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldr r0, _08087A70
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08087A64: .4byte gUnknown_0300485C
_08087A68: .4byte gMapObjects
_08087A6C: .4byte gPlayerAvatar
_08087A70: .4byte sub_8087A74
	thumb_func_end mapldr_080859D4

	thumb_func_start sub_8087A74
sub_8087A74: @ 8087A74
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08087A9C
	ldr r2, _08087AA0
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08087A9C: .4byte gUnknown_0839F388
_08087AA0: .4byte gTasks
	thumb_func_end sub_8087A74

	thumb_func_start sub_8087AA4
sub_8087AA4: @ 8087AA4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	beq _08087AC2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
_08087AC2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8087AA4

	thumb_func_start sub_8087AC8
sub_8087AC8: @ 8087AC8
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r1, _08087B4C
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r0, _08087B50
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087B54
	adds r6, r0, r1
	ldrh r1, [r5, 0xA]
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _08087AFA
	subs r0, r1, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08087B8C
_08087AFA:
	adds r0, r6, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08087B12
	adds r0, r6, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08087BA0
_08087B12:
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0x1F
	ble _08087B5C
	movs r2, 0x26
	ldrsh r4, [r5, r2]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08087B5C
	ldrb r1, [r6, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r6, 0x1]
	bl ScriptContext2_Disable
	bl sub_806451C
	ldr r0, _08087B58
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	b _08087BA0
	.align 2, 0
_08087B4C: .4byte gUnknown_0839F380
_08087B50: .4byte gPlayerAvatar
_08087B54: .4byte gMapObjects
_08087B58: .4byte sub_8087A74
_08087B5C:
	ldrb r0, [r6, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r0, [r0]
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl FieldObjectSetSpecialAnim
	ldrh r1, [r5, 0xC]
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0x1F
	bgt _08087B84
	adds r0, r1, 0x1
	strh r0, [r5, 0xC]
_08087B84:
	ldrh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 18
	strh r0, [r5, 0xA]
_08087B8C:
	ldrb r2, [r6, 0x1]
	lsls r1, r2, 26
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 5
	subs r0, 0x22
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x1]
_08087BA0:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8087AC8

	thumb_func_start sub_8087BA8
sub_8087BA8: @ 8087BA8
	push {lr}
	ldr r0, _08087BB8
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08087BB8: .4byte sub_8087BBC
	thumb_func_end sub_8087BA8

	thumb_func_start sub_8087BBC
sub_8087BBC: @ 8087BBC
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08087BE4
	ldr r2, _08087BE8
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08087BE4: .4byte gUnknown_0839F390
_08087BE8: .4byte gTasks
	thumb_func_end sub_8087BBC

	thumb_func_start sub_8087BEC
sub_8087BEC: @ 8087BEC
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	bl player_bitmagic
	bl CameraObjectReset2
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8087BEC

	thumb_func_start sub_8087C14
sub_8087C14: @ 8087C14
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08087C98
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r0, _08087C9C
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087CA0
	adds r5, r0, r1
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08087C46
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08087C60
_08087C46:
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, 0
	bl FieldObjectTurn
	movs r0, 0x8
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_08087C60:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	ble _08087C8E
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r1, r0
	bne _08087C8E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x4
	strh r0, [r4, 0xA]
	movs r0, 0x8
	strh r0, [r4, 0xC]
	movs r0, 0x1
	strh r0, [r4, 0xE]
	movs r0, 0x2D
	bl PlaySE
_08087C8E:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087C98: .4byte gUnknown_0839F380
_08087C9C: .4byte gPlayerAvatar
_08087CA0: .4byte gMapObjects
	thumb_func_end sub_8087C14

	thumb_func_start sub_8087CA4
sub_8087CA4: @ 8087CA4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08087D68
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r2, _08087D6C
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087D70
	adds r3, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087D74
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bgt _08087CEE
	movs r0, 0x4
	strh r0, [r4, 0xA]
	ldrb r0, [r3, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r3, 0
	bl FieldObjectTurn
_08087CEE:
	ldrh r0, [r5, 0x22]
	ldrh r1, [r4, 0xE]
	subs r0, r1
	strh r0, [r5, 0x22]
	ldrh r1, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	adds r0, r1, r2
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bgt _08087D1A
	movs r0, 0x4
	strh r0, [r4, 0xC]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x7
	bgt _08087D1A
	lsls r0, r1, 1
	strh r0, [r4, 0xE]
_08087D1A:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _08087D48
	ldrb r1, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x5]
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _08087D48
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
_08087D48:
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0xA7
	ble _08087D5E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl sub_8053FF8
	bl sub_8080918
_08087D5E:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087D68: .4byte gUnknown_0839F380
_08087D6C: .4byte gPlayerAvatar
_08087D70: .4byte gMapObjects
_08087D74: .4byte gSprites
	thumb_func_end sub_8087CA4

	thumb_func_start sub_8087D78
sub_8087D78: @ 8087D78
	push {lr}
	ldr r0, _08087DB8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08087DB4
	bl sub_8054034
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08087DB4
	bl sub_8053570
	bl warp_in
	ldr r0, _08087DBC
	bl SetMainCallback2
	ldr r1, _08087DC0
	ldr r0, _08087DC4
	str r0, [r1]
	ldr r0, _08087DC8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08087DB4:
	pop {r0}
	bx r0
	.align 2, 0
_08087DB8: .4byte gPaletteFade
_08087DBC: .4byte CB2_LoadMap
_08087DC0: .4byte gUnknown_0300485C
_08087DC4: .4byte mapldr_08085D88
_08087DC8: .4byte sub_8087BBC
	thumb_func_end sub_8087D78

	thumb_func_start mapldr_08085D88
mapldr_08085D88: @ 8087DCC
	push {lr}
	bl sub_8053E90
	bl pal_fill_for_maplights
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r1, _08087E0C
	movs r0, 0
	str r0, [r1]
	ldr r2, _08087E10
	ldr r0, _08087E14
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x20
	orrs r1, r2
	strb r1, [r0, 0x1]
	bl CameraObjectReset2
	ldr r0, _08087E18
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08087E0C: .4byte gUnknown_0300485C
_08087E10: .4byte gMapObjects
_08087E14: .4byte gPlayerAvatar
_08087E18: .4byte sub_8087E1C
	thumb_func_end mapldr_08085D88

	thumb_func_start sub_8087E1C
sub_8087E1C: @ 8087E1C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08087E44
	ldr r2, _08087E48
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08087E44: .4byte gUnknown_0839F3A0
_08087E48: .4byte gTasks
	thumb_func_end sub_8087E1C

	thumb_func_start sub_8087E4C
sub_8087E4C: @ 8087E4C
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_807D770
	lsls r0, 24
	cmp r0, 0
	beq _08087EC2
	ldr r5, _08087EC8
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _08087ECC
	adds r2, r0
	adds r0, r2, 0
	adds r0, 0x29
	movs r4, 0
	ldrsb r4, [r0, r4]
	lsls r0, r4, 17
	negs r0, r0
	ldrh r1, [r2, 0x22]
	ldr r3, _08087ED0
	adds r1, r4
	ldrh r3, [r3]
	adds r1, r3
	asrs r0, 16
	adds r0, r1
	negs r0, r0
	strh r0, [r2, 0x26]
	ldr r3, _08087ED4
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r3, [r1, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r3
	strb r0, [r1, 0x1]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0x8
	strh r0, [r6, 0xA]
	movs r0, 0x1
	strh r0, [r6, 0xC]
	adds r2, 0x42
	ldrb r0, [r2]
	lsrs r0, 6
	strh r0, [r6, 0x24]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x26]
	movs r0, 0x2D
	bl PlaySE
_08087EC2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087EC8: .4byte gPlayerAvatar
_08087ECC: .4byte gSprites
_08087ED0: .4byte gSpriteCoordOffsetY
_08087ED4: .4byte gMapObjects
	thumb_func_end sub_8087E4C

	thumb_func_start sub_8087ED8
sub_8087ED8: @ 8087ED8
	push {r4-r7,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08087F40
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r2, _08087F44
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087F48
	adds r6, r0, r1
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08087F4C
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	ldrh r1, [r5, 0x26]
	adds r0, r1
	strh r0, [r5, 0x26]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x8
	negs r1, r1
	cmp r0, r1
	blt _08087F50
	ldrh r1, [r4, 0x22]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08087F76
	adds r0, r1, 0x1
	strh r0, [r4, 0x22]
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	ldrh r1, [r4, 0x24]
	adds r3, r5, 0
	adds r3, 0x42
	lsls r1, 6
	ldrb r2, [r3]
	movs r0, 0x3F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _08087F76
	.align 2, 0
_08087F40: .4byte gUnknown_0839F380
_08087F44: .4byte gPlayerAvatar
_08087F48: .4byte gMapObjects
_08087F4C: .4byte gSprites
_08087F50:
	ldrb r1, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r5, 0x5]
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _08087F76
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
_08087F76:
	ldrh r2, [r5, 0x26]
	movs r3, 0x26
	ldrsh r1, [r5, r3]
	movs r0, 0x30
	negs r0, r0
	cmp r1, r0
	blt _08087F9A
	ldrh r1, [r4, 0xA]
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	ble _08087F9A
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _08087F9A
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
_08087F9A:
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	movs r7, 0
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _08087FBC
	movs r0, 0x4
	strh r0, [r4, 0xC]
	ldrb r0, [r6, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r6, 0
	bl FieldObjectTurn
_08087FBC:
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r0, 0
	blt _08087FD2
	strh r7, [r5, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	strh r0, [r4, 0xA]
	strh r7, [r4, 0xC]
_08087FD2:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8087ED8

	thumb_func_start sub_8087FDC
sub_8087FDC: @ 8087FDC
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _08088058
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	ldr r0, _0808805C
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088060
	adds r5, r0, r1
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08088050
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
	adds r0, r5, 0
	bl FieldObjectTurn
	movs r0, 0x8
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08088050
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r1, r0
	bne _08088050
	bl ScriptContext2_Disable
	bl CameraObjectReset1
	bl sub_806451C
	ldr r0, _08088064
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08088050:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088058: .4byte gUnknown_0839F380
_0808805C: .4byte gPlayerAvatar
_08088060: .4byte gMapObjects
_08088064: .4byte sub_8087E1C
	thumb_func_end sub_8087FDC

	thumb_func_start sub_8088068
sub_8088068: @ 8088068
	push {r4,lr}
	bl sav1_map_get_light_level
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08088088
	ldr r0, _08088084
	b _0808808A
	.align 2, 0
_08088084: .4byte sub_8088120
_08088088:
	ldr r0, _080880B8
_0808808A:
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _080880BC
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [r2, 0x8]
	bl sub_8088830
	ldr r2, _080880C0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r2
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x26]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080880B8: .4byte sub_808847C
_080880BC: .4byte gUnknown_0202FF84
_080880C0: .4byte gTasks
	thumb_func_end sub_8088068

	thumb_func_start sub_80880C4
sub_80880C4: @ 80880C4
	push {r4-r6,lr}
	ldr r5, _08088118
	ldr r0, [r5]
	movs r6, 0x80
	lsls r6, 24
	ands r6, r0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	adds r4, r0, 0
	muls r4, r1
	ldr r0, _0808811C
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	str r0, [r5]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [r5, 0x4]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [r5, 0x8]
	ldr r0, [r5]
	orrs r0, r6
	str r0, [r5]
	movs r0, 0x6
	bl FieldEffectStart
	movs r0, 0x3B
	bl FieldEffectActiveListRemove
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08088118: .4byte gUnknown_0202FF84
_0808811C: .4byte gPlayerParty
	thumb_func_end sub_80880C4

	thumb_func_start sub_8088120
sub_8088120: @ 8088120
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08088148
	ldr r2, _0808814C
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08088148: .4byte gUnknown_0839F3AC
_0808814C: .4byte gTasks
	thumb_func_end sub_8088120

	thumb_func_start sub_8088150
sub_8088150: @ 8088150
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _080881A0
	ldrh r0, [r6]
	strh r0, [r4, 0x1E]
	ldr r5, _080881A4
	ldrh r0, [r5]
	strh r0, [r4, 0x20]
	adds r0, r4, 0
	adds r0, 0x22
	ldr r1, _080881A8
	ldr r1, [r1, 0xC]
	bl StoreWordInTwoHalfwords
	ldr r1, _080881AC
	strh r1, [r4, 0xA]
	ldr r0, _080881B0
	strh r0, [r4, 0xC]
	movs r0, 0x3F
	strh r0, [r4, 0xE]
	movs r0, 0x3E
	strh r0, [r4, 0x10]
	ldr r0, _080881B4
	strh r1, [r0]
	ldr r1, _080881B8
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	ldrh r0, [r4, 0xE]
	strh r0, [r6]
	ldrh r0, [r4, 0x10]
	strh r0, [r5]
	ldr r0, _080881BC
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080881A0: .4byte REG_WININ
_080881A4: .4byte REG_WINOUT
_080881A8: .4byte gMain
_080881AC: .4byte 0x0000f0f1
_080881B0: .4byte 0x00005051
_080881B4: .4byte REG_WIN0H
_080881B8: .4byte REG_WIN0V
_080881BC: .4byte sub_80883DC
	thumb_func_end sub_8088150

	thumb_func_start sub_80881C0
sub_80881C0: @ 80881C0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r0, _08088218
	ldrh r1, [r0]
	lsrs r1, 2
	lsls r1, 30
	lsrs r1, 16
	ldrh r4, [r0]
	lsrs r4, 8
	lsls r4, 27
	lsrs r4, 16
	ldr r0, _0808821C
	movs r5, 0xC0
	lsls r5, 19
	adds r1, r5
	movs r2, 0x80
	lsls r2, 1
	bl CpuSet
	movs r0, 0
	str r0, [sp]
	adds r5, r4, r5
	ldr r2, _08088220
	mov r0, sp
	adds r1, r5, 0
	bl CpuSet
	ldr r0, _08088224
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r4, 0
	bl sub_808843C
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088218: .4byte REG_BG0CNT
_0808821C: .4byte gFieldMoveStreaksTiles
_08088220: .4byte 0x05000200
_08088224: .4byte gFieldMoveStreaksPalette
	thumb_func_end sub_80881C0

	thumb_func_start sub_8088228
sub_8088228: @ 8088228
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldrh r6, [r3, 0xA]
	ldrh r2, [r3, 0xC]
	movs r7, 0xFF
	lsrs r1, r6, 8
	subs r1, 0x10
	lsls r1, 16
	lsrs r0, r2, 8
	subs r0, 0x2
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r7, 0
	ands r0, r2
	adds r5, r0, 0x2
	lsrs r2, r1, 16
	cmp r1, 0
	bge _08088254
	movs r2, 0
_08088254:
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, 0x27
	bgt _0808825E
	movs r4, 0x28
_0808825E:
	cmp r5, 0x78
	ble _08088264
	movs r5, 0x78
_08088264:
	lsls r2, 16
	asrs r2, 16
	lsls r1, r2, 8
	adds r0, r7, 0
	ands r0, r6
	orrs r1, r0
	strh r1, [r3, 0xA]
	lsls r0, r4, 16
	asrs r4, r0, 16
	lsls r0, r4, 8
	adds r1, r5, 0
	orrs r0, r1
	strh r0, [r3, 0xC]
	cmp r2, 0
	bne _080882A4
	cmp r4, 0x28
	bne _080882A4
	cmp r1, 0x78
	bne _080882A4
	ldr r2, _080882AC
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080882B0
	str r1, [r0]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_080882A4:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080882AC: .4byte gSprites
_080882B0: .4byte sub_8088890
	thumb_func_end sub_8088228

	thumb_func_start sub_80882B4
sub_80882B4: @ 80882B4
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldr r2, _080882E0
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3C
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080882DA
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_080882DA:
	pop {r0}
	bx r0
	.align 2, 0
_080882E0: .4byte gSprites
	thumb_func_end sub_80882B4

	thumb_func_start sub_80882E4
sub_80882E4: @ 80882E4
	push {r4,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x12]
	subs r0, 0x10
	strh r0, [r3, 0x12]
	ldrh r2, [r3, 0xC]
	lsls r1, r2, 16
	movs r0, 0xFF
	asrs r1, 24
	adds r1, 0x6
	lsls r1, 16
	ands r0, r2
	subs r0, 0x6
	lsls r0, 16
	lsrs r2, r0, 16
	lsrs r4, r1, 16
	asrs r1, 16
	cmp r1, 0x50
	ble _0808830C
	movs r4, 0x50
_0808830C:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x50
	bgt _08088316
	movs r2, 0x51
_08088316:
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r0, 8
	lsls r2, 16
	asrs r2, 16
	orrs r1, r2
	strh r1, [r3, 0xC]
	cmp r0, 0x50
	bne _08088332
	cmp r2, 0x51
	bne _08088332
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08088332:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80882E4

	thumb_func_start sub_8088338
sub_8088338: @ 8088338
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, _08088378
	ldrh r1, [r0]
	lsrs r1, 8
	lsls r1, 27
	lsrs r1, 16
	movs r0, 0
	str r0, [sp]
	movs r0, 0xC0
	lsls r0, 19
	adds r1, r0
	ldr r2, _0808837C
	mov r0, sp
	bl CpuSet
	movs r0, 0xF1
	strh r0, [r4, 0xA]
	movs r0, 0xA1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x1E]
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088378: .4byte REG_BG0CNT
_0808837C: .4byte 0x05000200
	thumb_func_end sub_8088338

	thumb_func_start sub_8088380
sub_8088380: @ 8088380
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl SetVBlankCallback
	ldr r4, _080883D0
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080883D4
	adds r0, r1
	bl sub_8085C44
	movs r0, 0x6
	bl FieldEffectActiveListRemove
	ldr r0, _080883D8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080883D0: .4byte gWindowConfig_81E6CE4
_080883D4: .4byte gSprites
_080883D8: .4byte sub_8088120
	thumb_func_end sub_8088380

	thumb_func_start sub_80883DC
sub_80883DC: @ 80883DC
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08088430
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08088434
	adds r4, r0
	adds r0, r4, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl _call_via_r0
	ldr r1, _08088438
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	adds r1, 0x4
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	adds r1, 0x4
	ldrh r0, [r4, 0xE]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x10]
	strh r0, [r1]
	subs r1, 0x3A
	ldrh r0, [r4, 0x12]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x14]
	strh r0, [r1]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088430: .4byte sub_8088120
_08088434: .4byte gTasks
_08088438: .4byte REG_WIN0H
	thumb_func_end sub_80883DC

	thumb_func_start sub_808843C
sub_808843C: @ 808843C
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08088470
	adds r2, r0, r1
	movs r1, 0
	ldr r5, _08088474
	movs r0, 0xF0
	lsls r0, 8
	adds r4, r0, 0
	ldr r3, _08088478
_08088452:
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	orrs r0, r4
	strh r0, [r2]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, 0x2
	cmp r1, r3
	bls _08088452
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088470: .4byte 0x06000140
_08088474: .4byte gFieldMoveStreaksTilemap
_08088478: .4byte 0x0000013f
	thumb_func_end sub_808843C

	thumb_func_start sub_808847C
sub_808847C: @ 808847C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080884A4
	ldr r2, _080884A8
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080884A4: .4byte gUnknown_0839F3C8
_080884A8: .4byte gTasks
	thumb_func_end sub_808847C

	thumb_func_start sub_80884AC
sub_80884AC: @ 80884AC
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080884DC
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	adds r0, r4, 0
	adds r0, 0x22
	ldr r1, _080884E0
	ldr r1, [r1, 0xC]
	bl StoreWordInTwoHalfwords
	ldr r0, _080884E4
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080884DC: .4byte REG_BG0HOFS
_080884E0: .4byte gMain
_080884E4: .4byte sub_80886B0
	thumb_func_end sub_80884AC

	thumb_func_start sub_80884E8
sub_80884E8: @ 80884E8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r0, _08088544
	ldrh r1, [r0]
	lsrs r1, 2
	lsls r1, 30
	lsrs r1, 16
	ldrh r4, [r0]
	lsrs r4, 8
	lsls r4, 27
	lsrs r4, 16
	movs r0, 0
	mov r8, r0
	strh r4, [r6, 0x20]
	ldr r0, _08088548
	movs r5, 0xC0
	lsls r5, 19
	adds r1, r5
	movs r2, 0x40
	bl CpuSet
	mov r0, r8
	str r0, [sp]
	adds r4, r5
	ldr r2, _0808854C
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	ldr r0, _08088550
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088544: .4byte REG_BG0CNT
_08088548: .4byte gDarknessFieldMoveStreaksTiles
_0808854C: .4byte 0x05000200
_08088550: .4byte gDarknessFieldMoveStreaksPalette
	thumb_func_end sub_80884E8

	thumb_func_start sub_8088554
sub_8088554: @ 8088554
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8088708
	lsls r0, 24
	cmp r0, 0
	beq _0808858A
	ldr r1, _08088598
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _0808859C
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080885A0
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080885A4
	str r1, [r0]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0808858A:
	adds r0, r4, 0
	bl sub_80886F8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088598: .4byte REG_WIN1H
_0808859C: .4byte 0x00002878
_080885A0: .4byte gSprites
_080885A4: .4byte sub_8088890
	thumb_func_end sub_8088554

	thumb_func_start sub_80885A8
sub_80885A8: @ 80885A8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80886F8
	ldr r2, _080885D4
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3C
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080885CC
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080885CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080885D4: .4byte gSprites
	thumb_func_end sub_80885A8

	thumb_func_start sub_80885D8
sub_80885D8: @ 80885D8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80886F8
	ldrh r1, [r4, 0xA]
	movs r0, 0x7
	ands r0, r1
	movs r1, 0
	strh r0, [r4, 0xE]
	strh r1, [r4, 0x10]
	ldr r0, _08088604
	ldr r2, _08088608
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088604: .4byte REG_WIN1H
_08088608: .4byte 0x0000ffff
	thumb_func_end sub_80885D8

	thumb_func_start sub_808860C
sub_808860C: @ 808860C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80886F8
	adds r0, r4, 0
	bl sub_80887C0
	lsls r0, 24
	cmp r0, 0
	beq _08088626
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08088626:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_808860C

	thumb_func_start sub_808862C
sub_808862C: @ 808862C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, _0808869C
	ldrh r1, [r0]
	lsrs r1, 8
	lsls r1, 27
	lsrs r1, 16
	movs r0, 0
	str r0, [sp]
	movs r0, 0xC0
	lsls r0, 19
	adds r1, r0
	ldr r2, _080886A0
	mov r0, sp
	bl CpuSet
	adds r0, r5, 0
	adds r0, 0x22
	add r1, sp, 0x4
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp, 0x4]
	bl SetVBlankCallback
	ldr r4, _080886A4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080886A8
	adds r0, r1
	bl sub_8085C44
	movs r0, 0x6
	bl FieldEffectActiveListRemove
	ldr r0, _080886AC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808869C: .4byte REG_BG0CNT
_080886A0: .4byte 0x05000200
_080886A4: .4byte gWindowConfig_81E6CE4
_080886A8: .4byte gSprites
_080886AC: .4byte sub_808847C
	thumb_func_end sub_808862C

	thumb_func_start sub_80886B0
sub_80886B0: @ 80886B0
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080886EC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080886F0
	adds r4, r0
	adds r0, r4, 0
	adds r0, 0x22
	mov r1, sp
	bl LoadWordFromTwoHalfwords
	ldr r0, [sp]
	bl _call_via_r0
	ldr r1, _080886F4
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080886EC: .4byte sub_808847C
_080886F0: .4byte gTasks
_080886F4: .4byte REG_BG0HOFS
	thumb_func_end sub_80886B0

	thumb_func_start sub_80886F8
sub_80886F8: @ 80886F8
	ldrh r1, [r0, 0xA]
	subs r1, 0x10
	strh r1, [r0, 0xA]
	ldrh r1, [r0, 0xE]
	adds r1, 0x10
	strh r1, [r0, 0xE]
	bx lr
	thumb_func_end sub_80886F8

	thumb_func_start sub_8088708
sub_8088708: @ 8088708
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r2, [r5, 0x10]
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0x1F
	ble _08088724
	movs r0, 0x1
	b _080887A8
_08088724:
	ldrh r0, [r5, 0xE]
	lsls r0, 16
	asrs r3, r0, 19
	movs r1, 0x1F
	ands r3, r1
	movs r4, 0x10
	ldrsh r0, [r5, r4]
	cmp r3, r0
	blt _080887A6
	movs r0, 0x20
	subs r3, r0, r3
	ands r3, r1
	subs r0, r2
	mov r12, r0
	mov r7, r12
	ands r7, r1
	mov r12, r7
	ldrh r0, [r5, 0x20]
	ldr r1, _080887B8
	adds r1, r0
	mov r8, r1
	movs r4, 0
	ldr r7, _080887BC
	mov r10, r7
	movs r0, 0xF0
	lsls r0, 8
	mov r9, r0
	adds r1, r3, 0x1
	movs r0, 0x1F
	ands r1, r0
	str r1, [sp]
	mov r6, r12
	adds r6, 0x1
	ands r6, r0
_08088768:
	lsls r1, r4, 5
	adds r2, r1, r3
	lsls r2, 1
	add r2, r8
	mov r7, r12
	adds r0, r7, r1
	lsls r0, 1
	add r0, r10
	ldrh r0, [r0]
	mov r7, r9
	orrs r0, r7
	strh r0, [r2]
	ldr r0, [sp]
	adds r2, r1, r0
	lsls r2, 1
	add r2, r8
	adds r1, r6, r1
	lsls r1, 1
	add r1, r10
	ldrh r0, [r1]
	mov r1, r9
	orrs r0, r1
	strh r0, [r2]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x9
	bls _08088768
	ldrh r0, [r5, 0x10]
	adds r0, 0x2
	strh r0, [r5, 0x10]
_080887A6:
	movs r0, 0
_080887A8:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080887B8: .4byte 0x06000140
_080887BC: .4byte gDarknessFieldMoveStreaksTilemap
	thumb_func_end sub_8088708

	thumb_func_start sub_80887C0
sub_80887C0: @ 80887C0
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0x1F
	ble _080887D0
	movs r0, 0x1
	b _08088824
_080887D0:
	ldrh r0, [r5, 0xE]
	lsls r0, 16
	asrs r0, 19
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r2, r0
	blt _08088822
	ldrh r0, [r5, 0xA]
	lsls r0, 16
	asrs r2, r0, 19
	movs r0, 0x1F
	ands r2, r0
	ldrh r0, [r5, 0x20]
	ldr r1, _0808882C
	adds r6, r0, r1
	movs r3, 0
	movs r0, 0xF0
	lsls r0, 8
	adds r7, r0, 0
	adds r4, r2, 0x1
	movs r0, 0x1F
	ands r4, r0
_08088800:
	lsls r0, r3, 5
	adds r1, r0, r2
	lsls r1, 1
	adds r1, r6
	strh r7, [r1]
	adds r0, r4
	lsls r0, 1
	adds r0, r6
	strh r7, [r0]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x9
	bls _08088800
	ldrh r0, [r5, 0x10]
	adds r0, 0x2
	strh r0, [r5, 0x10]
_08088822:
	movs r0, 0
_08088824:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808882C: .4byte 0x06000140
	thumb_func_end sub_80887C0

	thumb_func_start sub_8088830
sub_8088830: @ 8088830
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	movs r5, 0x80
	lsls r5, 24
	ands r5, r6
	lsrs r5, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _08088884
	ands r6, r0
	lsls r0, r6, 16
	lsrs r0, 16
	movs r3, 0xA0
	lsls r3, 1
	movs r4, 0x50
	str r4, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	bl sub_8085B88
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r1, _08088888
	adds r2, r1
	ldr r1, _0808888C
	str r1, [r2, 0x1C]
	ldrb r3, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	strb r1, [r2, 0x5]
	strh r6, [r2, 0x2E]
	strh r5, [r2, 0x3A]
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08088884: .4byte 0x7fffffff
_08088888: .4byte gSprites
_0808888C: .4byte SpriteCallbackDummy
	thumb_func_end sub_8088830

	thumb_func_start sub_8088890
sub_8088890: @ 8088890
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x20]
	subs r0, 0x14
	strh r0, [r1, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	bgt _080888D0
	movs r0, 0x78
	strh r0, [r1, 0x20]
	movs r0, 0x1E
	strh r0, [r1, 0x30]
	ldr r0, _080888C4
	str r0, [r1, 0x1C]
	movs r2, 0x3A
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080888C8
	ldrh r0, [r1, 0x2E]
	movs r1, 0
	movs r2, 0x7D
	movs r3, 0xA
	bl PlayCry2
	b _080888D0
	.align 2, 0
_080888C4: .4byte sub_80888D4
_080888C8:
	ldrh r0, [r1, 0x2E]
	movs r1, 0
	bl PlayCry1
_080888D0:
	pop {r0}
	bx r0
	thumb_func_end sub_8088890

	thumb_func_start sub_80888D4
sub_80888D4: @ 80888D4
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080888E8
	ldr r0, _080888EC
	str r0, [r1, 0x1C]
_080888E8:
	pop {r0}
	bx r0
	.align 2, 0
_080888EC: .4byte sub_80888F0
	thumb_func_end sub_80888D4

	thumb_func_start sub_80888F0
sub_80888F0: @ 80888F0
	push {lr}
	adds r2, r0, 0
	ldrh r3, [r2, 0x20]
	movs r0, 0x20
	ldrsh r1, [r2, r0]
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	bge _08088908
	movs r0, 0x1
	strh r0, [r2, 0x3C]
	b _0808890E
_08088908:
	adds r0, r3, 0
	subs r0, 0x14
	strh r0, [r2, 0x20]
_0808890E:
	pop {r0}
	bx r0
	thumb_func_end sub_80888F0

	thumb_func_start sub_8088914
sub_8088914: @ 8088914
	push {lr}
	ldr r0, _08088944
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08088948
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0808894C
	ldr r0, [r0]
	strh r0, [r1, 0x26]
	bl sav1_reset_battle_music_maybe
	ldr r0, _08088950
	bl sub_8053FB0
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08088944: .4byte sub_8088954
_08088948: .4byte gTasks
_0808894C: .4byte gUnknown_0202FF84
_08088950: .4byte 0x0000016d
	thumb_func_end sub_8088914

	thumb_func_start sub_8088954
sub_8088954: @ 8088954
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0808897C
	ldr r2, _08088980
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_0808897C: .4byte gUnknown_0839F3E4
_08088980: .4byte gTasks
	thumb_func_end sub_8088954

	thumb_func_start sub_8088984
sub_8088984: @ 8088984
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	bl player_bitmagic
	ldr r5, _080889DC
	movs r0, 0x1
	strb r0, [r5, 0x6]
	movs r0, 0x8
	bl SetPlayerAvatarStateMask
	adds r6, r4, 0
	adds r6, 0xA
	movs r0, 0xC
	adds r0, r4
	mov r8, r0
	adds r0, r6, 0
	mov r1, r8
	bl PlayerGetDestCoords
	ldr r2, _080889E0
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsrs r0, 4
	adds r1, r6, 0
	mov r2, r8
	bl MoveCoords
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080889DC: .4byte gPlayerAvatar
_080889E0: .4byte gMapObjects
	thumb_func_end sub_8088984

	thumb_func_start sub_80889E4
sub_80889E4: @ 80889E4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _08088A28
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088A2C
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08088A0E
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08088A20
_08088A0E:
	bl sub_8059BF4
	adds r0, r4, 0
	movs r1, 0x39
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08088A20:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088A28: .4byte gPlayerAvatar
_08088A2C: .4byte gMapObjects
	thumb_func_end sub_80889E4

	thumb_func_start sub_8088A30
sub_8088A30: @ 8088A30
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08088A6C
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088A70
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	beq _08088A66
	ldr r2, _08088A74
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r2]
	movs r0, 0x3B
	bl FieldEffectStart
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08088A66:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088A6C: .4byte gPlayerAvatar
_08088A70: .4byte gMapObjects
_08088A74: .4byte gUnknown_0202FF84
	thumb_func_end sub_8088A30

	thumb_func_start sub_8088A78
sub_8088A78: @ 8088A78
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08088AE2
	ldr r5, _08088AE8
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08088AEC
	adds r4, r0
	movs r0, 0x3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl sub_80608D0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldr r1, _08088AF0
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	str r0, [r1]
	movs r2, 0xC
	ldrsh r0, [r6, r2]
	str r0, [r1, 0x4]
	ldrb r0, [r5, 0x5]
	str r0, [r1, 0x8]
	movs r0, 0x8
	bl FieldEffectStart
	strb r0, [r4, 0x1A]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_08088AE2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088AE8: .4byte gPlayerAvatar
_08088AEC: .4byte gMapObjects
_08088AF0: .4byte gUnknown_0202FF84
	thumb_func_end sub_8088A78

	thumb_func_start sub_8088AF4
sub_8088AF4: @ 8088AF4
	push {r4,r5,lr}
	ldr r5, _08088B5C
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088B60
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08088B54
	movs r0, 0
	strb r0, [r5, 0x6]
	ldrb r1, [r5]
	movs r0, 0xDF
	ands r0, r1
	strb r0, [r5]
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrb r0, [r4, 0x1A]
	movs r1, 0x1
	bl sub_8127ED0
	bl sub_806451C
	bl ScriptContext2_Disable
	movs r0, 0x9
	bl FieldEffectActiveListRemove
	ldr r0, _08088B64
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08088B54:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088B5C: .4byte gPlayerAvatar
_08088B60: .4byte gMapObjects
_08088B64: .4byte sub_8088954
	thumb_func_end sub_8088AF4

	thumb_func_start sub_8088B68
sub_8088B68: @ 8088B68
	push {r4,lr}
	ldr r0, _08088BB4
	ldr r0, [r0, 0x68]
	movs r1, 0x78
	movs r2, 0
	movs r3, 0x1
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r2, r4, 4
	adds r2, r4
	lsls r2, 2
	ldr r0, _08088BB8
	adds r2, r0
	ldrb r1, [r2, 0x5]
	movs r0, 0xF
	ands r0, r1
	movs r1, 0xD
	negs r1, r1
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldr r0, _08088BBC
	str r0, [r2, 0x1C]
	ldr r0, _08088BC0
	ldr r0, [r0]
	strh r0, [r2, 0x30]
	movs r0, 0x9E
	bl PlaySE
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08088BB4: .4byte gFieldEffectObjectTemplatePointers
_08088BB8: .4byte gSprites
_08088BBC: .4byte sub_8088BC4
_08088BC0: .4byte gUnknown_0202FF84
	thumb_func_end sub_8088B68

	thumb_func_start sub_8088BC4
sub_8088BC4: @ 8088BC4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0x8C
	bl Cos
	movs r5, 0
	strh r0, [r4, 0x24]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r1, 0x48
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08088C26
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08088C3C
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r3]
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r1, 0x22]
	strh r5, [r1, 0x24]
	strh r5, [r1, 0x26]
_08088C26:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _08088C36
	adds r0, r4, 0
	movs r1, 0x1E
	bl FieldEffectStop
_08088C36:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088C3C: .4byte gSprites
	thumb_func_end sub_8088BC4

	thumb_func_start sub_8088C40
sub_8088C40: @ 8088C40
	push {lr}
	ldr r0, _08088C64
	movs r1, 0xFE
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08088C68
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _08088C6C
	ldr r0, [r0]
	strh r0, [r1, 0xA]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08088C64: .4byte sub_8088C70
_08088C68: .4byte gTasks
_08088C6C: .4byte gUnknown_0202FF84
	thumb_func_end sub_8088C40

	thumb_func_start sub_8088C70
sub_8088C70: @ 8088C70
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08088C98
	ldr r2, _08088C9C
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08088C98: .4byte gUnknown_0839F3F8
_08088C9C: .4byte gTasks
	thumb_func_end sub_8088C70

	thumb_func_start sub_8088CA0
sub_8088CA0: @ 8088CA0
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _08088CF0
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088CF4
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08088CCA
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08088CE8
_08088CCA:
	ldrb r0, [r6]
	strh r0, [r5, 0x26]
	movs r0, 0x1
	strb r0, [r6, 0x6]
	bl SetPlayerAvatarStateMask
	bl sub_8059BF4
	adds r0, r4, 0
	movs r1, 0x39
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08088CE8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088CF0: .4byte gPlayerAvatar
_08088CF4: .4byte gMapObjects
	thumb_func_end sub_8088CA0

	thumb_func_start sub_8088CF8
sub_8088CF8: @ 8088CF8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08088D30
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088D34
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08088D28
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldr r1, _08088D38
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r0, 0x3B
	bl FieldEffectStart
_08088D28:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088D30: .4byte gPlayerAvatar
_08088D34: .4byte gMapObjects
_08088D38: .4byte gUnknown_0202FF84
	thumb_func_end sub_8088CF8

	thumb_func_start sub_8088D3C
sub_8088D3C: @ 8088D3C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _08088D84
	ldr r0, _08088D8C
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088D90
	adds r5, r0, r1
	ldrh r1, [r4, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08088D74
	ldrb r0, [r5, 0x1A]
	movs r1, 0x2
	bl sub_8127ED0
	ldrb r0, [r5, 0x1A]
	movs r1, 0
	bl sub_8127EFC
_08088D74:
	bl sub_8088F60
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08088D84:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088D8C: .4byte gPlayerAvatar
_08088D90: .4byte gMapObjects
	thumb_func_end sub_8088D3C

	thumb_func_start sub_8088D94
sub_8088D94: @ 8088D94
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_8088FA4
	lsls r0, 24
	cmp r0, 0
	beq _08088DC8
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x10
	strh r0, [r4, 0xC]
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
	ldr r0, _08088DD0
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088DD4
	adds r0, r1
	movs r1, 0x2
	bl FieldObjectSetSpecialAnim
_08088DC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088DD0: .4byte gPlayerAvatar
_08088DD4: .4byte gMapObjects
	thumb_func_end sub_8088D94

	thumb_func_start sub_8088DD8
sub_8088DD8: @ 8088DD8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08088E24
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088E28
	adds r2, r0, r1
	ldrh r1, [r4, 0xC]
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _08088DFE
	subs r0, r1, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _08088E1C
_08088DFE:
	adds r0, r2, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08088E1C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x9E
	bl PlaySE
	ldrb r0, [r4, 0xA]
	bl sub_8088FC0
_08088E1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088E24: .4byte gPlayerAvatar
_08088E28: .4byte gMapObjects
	thumb_func_end sub_8088DD8

	thumb_func_start sub_8088E2C
sub_8088E2C: @ 8088E2C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _08088EA2
	ldr r0, _08088EA8
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08088EAC
	adds r4, r0, r1
	movs r0, 0x3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r6, _08088EB0
	adds r0, r6
	movs r1, 0x16
	bl StartSpriteAnim
	ldrb r0, [r4, 0x1]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	movs r1, 0x48
	bl FieldObjectSetSpecialAnim
	ldrh r1, [r5, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08088E98
	ldrb r1, [r4, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
_08088E98:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	strh r0, [r5, 0xC]
_08088EA2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088EA8: .4byte gPlayerAvatar
_08088EAC: .4byte gMapObjects
_08088EB0: .4byte gSprites
	thumb_func_end sub_8088E2C

	thumb_func_start sub_8088EB4
sub_8088EB4: @ 8088EB4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _08088F00
	ldr r0, _08088F08
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08088F0C
	adds r4, r0
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimActive
	ldrb r1, [r4, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
	ldrb r0, [r5, 0xA]
	ldrb r1, [r4, 0x4]
	bl sub_8088FFC
	bl CameraObjectReset2
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08088F00:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08088F08: .4byte gPlayerAvatar
_08088F0C: .4byte gMapObjects
	thumb_func_end sub_8088EB4

	thumb_func_start sub_8088F10
sub_8088F10: @ 8088F10
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_8088FA4
	lsls r0, 24
	cmp r0, 0
	beq _08088F2A
	bl sub_8080918
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08088F2A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8088F10

	thumb_func_start sub_8088F30
sub_8088F30: @ 8088F30
	push {lr}
	ldr r0, _08088F58
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08088F52
	movs r0, 0x1F
	bl FieldEffectActiveListRemove
	ldr r0, _08088F5C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08088F52:
	pop {r0}
	bx r0
	.align 2, 0
_08088F58: .4byte gPaletteFade
_08088F5C: .4byte sub_8088C70
	thumb_func_end sub_8088F30

	thumb_func_start sub_8088F60
sub_8088F60: @ 8088F60
	push {lr}
	ldr r0, _08088F98
	ldr r0, [r0, 0x68]
	movs r1, 0xFF
	movs r2, 0xB4
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r1, _08088F9C
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xF
	ands r1, r3
	movs r3, 0xD
	negs r3, r3
	ands r1, r3
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2, 0x5]
	ldr r1, _08088FA0
	str r1, [r2, 0x1C]
	pop {r1}
	bx r1
	.align 2, 0
_08088F98: .4byte gFieldEffectObjectTemplatePointers
_08088F9C: .4byte gSprites
_08088FA0: .4byte sub_8089018
	thumb_func_end sub_8088F60

	thumb_func_start sub_8088FA4
sub_8088FA4: @ 8088FA4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08088FBC
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_08088FBC: .4byte gSprites
	thumb_func_end sub_8088FA4

	thumb_func_start sub_8088FC0
sub_8088FC0: @ 8088FC0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08088FF4
	adds r4, r0
	ldr r0, _08088FF8
	str r0, [r4, 0x1C]
	movs r1, 0
	movs r0, 0x78
	strh r0, [r4, 0x20]
	strh r1, [r4, 0x22]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x2E
	movs r2, 0x10
	bl memset
	movs r0, 0x40
	strh r0, [r4, 0x3A]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088FF4: .4byte gSprites
_08088FF8: .4byte sub_80890D8
	thumb_func_end sub_8088FC0

	thumb_func_start sub_8088FFC
sub_8088FFC: @ 8088FFC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08089014
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	strh r1, [r2, 0x3A]
	bx lr
	.align 2, 0
_08089014: .4byte gSprites
	thumb_func_end sub_8088FFC

	thumb_func_start sub_8089018
sub_8089018: @ 8089018
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080890C4
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0808905C
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080890CC
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r0, 0x76
	strh r0, [r4, 0x20]
	ldr r0, _080890D0
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x40
	strh r0, [r4, 0x30]
	adds r0, 0xC0
	strh r0, [r4, 0x32]
_0808905C:
	ldrh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x32]
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	ldr r0, _080890D4
	cmp r1, r0
	bgt _08089092
	adds r0, r2, 0
	adds r0, 0x60
	strh r0, [r4, 0x32]
_08089092:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x81
	ble _080890C4
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	lsrs r1, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	adds r0, r4, 0
	movs r3, 0
	bl CalcCenterToCornerVec
_080890C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080890CC: .4byte gUnknown_0839F44C
_080890D0: .4byte 0x0000ffd0
_080890D4: .4byte 0x000007ff
	thumb_func_end sub_8089018

	thumb_func_start sub_80890D8
sub_80890D8: @ 80890D8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0x8C
	bl Cos
	movs r5, 0
	strh r0, [r4, 0x24]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r1, 0x48
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	beq _08089136
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08089148
	adds r1, r0
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r3]
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	subs r0, 0x8
	strh r0, [r1, 0x22]
	strh r5, [r1, 0x24]
	strh r5, [r1, 0x26]
_08089136:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _08089142
	movs r0, 0x1
	strh r0, [r4, 0x3C]
_08089142:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089148: .4byte gSprites
	thumb_func_end sub_80890D8

	thumb_func_start sub_808914C
sub_808914C: @ 808914C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08089220
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _08089196
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _08089228
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	movs r0, 0x5E
	strh r0, [r4, 0x20]
	ldr r0, _0808922C
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0xF0
	strh r0, [r4, 0x30]
	movs r0, 0x80
	lsls r0, 4
	strh r0, [r4, 0x32]
	movs r0, 0x80
	strh r0, [r4, 0x36]
_08089196:
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r2, r1
	ldrh r0, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r4, 0x30]
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	movs r1, 0x20
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r2, 0x80
	lsls r2, 1
	cmp r0, r2
	ble _080891D8
	ldrh r0, [r4, 0x36]
	subs r0, r1, r0
	strh r0, [r4, 0x32]
_080891D8:
	ldrh r1, [r4, 0x36]
	movs r3, 0x36
	ldrsh r0, [r4, r3]
	cmp r0, 0xFF
	bgt _080891E8
	adds r0, r1, 0
	adds r0, 0x18
	strh r0, [r4, 0x36]
_080891E8:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0xFF
	bgt _080891F2
	strh r2, [r4, 0x32]
_080891F2:
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0x3B
	ble _08089220
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_08089220:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089228: .4byte gUnknown_0839F44C
_0808922C: .4byte 0x0000ffe0
	thumb_func_end sub_808914C

	thumb_func_start sub_8089230
sub_8089230: @ 8089230
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8088FC0
	ldr r1, _08089254
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08089258
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089254: .4byte gSprites
_08089258: .4byte sub_808914C
	thumb_func_end sub_8089230

	thumb_func_start sub_808925C
sub_808925C: @ 808925C
	push {lr}
	ldr r0, _0808926C
	movs r1, 0xFE
	bl CreateTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0808926C: .4byte sub_8089270
	thumb_func_end sub_808925C

	thumb_func_start sub_8089270
sub_8089270: @ 8089270
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08089298
	ldr r2, _0808929C
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08089298: .4byte gUnknown_0839F454
_0808929C: .4byte gTasks
	thumb_func_end sub_8089270

	thumb_func_start sub_80892A0
sub_80892A0: @ 80892A0
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _08089348
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0808934C
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _080892CA
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _08089342
_080892CA:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x11
	strh r0, [r5, 0xC]
	ldrb r0, [r6]
	strh r0, [r5, 0x26]
	movs r0, 0x1
	strb r0, [r6, 0x6]
	bl SetPlayerAvatarStateMask
	ldrh r1, [r5, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080892F2
	ldrb r0, [r4, 0x1A]
	movs r1, 0
	bl sub_8127ED0
_080892F2:
	movs r0, 0x3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	bl CameraObjectReset2
	adds r0, r4, 0
	movs r1, 0x3
	bl FieldObjectTurn
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08089350
	adds r0, r1
	movs r1, 0x16
	bl StartSpriteAnim
	ldrb r1, [r4, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	bl sub_8088F60
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xA]
	bl sub_8088FC0
	ldrb r0, [r5, 0xA]
	ldrb r1, [r4, 0x4]
	bl sub_8088FFC
_08089342:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089348: .4byte gPlayerAvatar
_0808934C: .4byte gMapObjects
_08089350: .4byte gSprites
	thumb_func_end sub_80892A0

	thumb_func_start sub_8089354
sub_8089354: @ 8089354
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0xC]
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _0808936C
	subs r0, r1, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _080893AC
_0808936C:
	ldr r0, _080893B4
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080893B8
	adds r0, r1
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080893BC
	adds r4, r0
	ldrb r0, [r5, 0xA]
	movs r1, 0x40
	bl sub_8088FFC
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
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	strh r1, [r5, 0xC]
_080893AC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080893B4: .4byte gPlayerAvatar
_080893B8: .4byte gMapObjects
_080893BC: .4byte gSprites
	thumb_func_end sub_8089354

	thumb_func_start sub_80893C0
sub_80893C0: @ 80893C0
	push {r4,lr}
	sub sp, 0x24
	adds r4, r0, 0
	ldr r1, _08089408
	mov r0, sp
	movs r2, 0x24
	bl memcpy
	ldr r0, _0808940C
	ldrb r0, [r0, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08089410
	adds r1, r0
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x11
	ble _080893FE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080893FE:
	add sp, 0x24
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089408: .4byte gUnknown_0839F470
_0808940C: .4byte gPlayerAvatar
_08089410: .4byte gSprites
	thumb_func_end sub_80893C0

	thumb_func_start sub_8089414
sub_8089414: @ 8089414
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrb r0, [r6, 0xA]
	bl sub_8088FA4
	lsls r0, 24
	cmp r0, 0
	beq _08089478
	ldr r0, _08089480
	ldrb r0, [r0, 0x5]
	lsls r5, r0, 3
	adds r5, r0
	lsls r5, 2
	ldr r0, _08089484
	adds r5, r0
	ldrb r0, [r5, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08089488
	adds r4, r0
	ldrb r1, [r5, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	movs r0, 0x10
	ldrsh r1, [r5, r0]
	movs r0, 0x12
	ldrsh r2, [r5, r0]
	adds r0, r5, 0
	bl sub_805C058
	movs r0, 0
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	bl sub_8059BF4
	adds r0, r5, 0
	movs r1, 0x39
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_08089478:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089480: .4byte gPlayerAvatar
_08089484: .4byte gMapObjects
_08089488: .4byte gSprites
	thumb_func_end sub_8089414

	thumb_func_start sub_808948C
sub_808948C: @ 808948C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080894BC
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080894C0
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _080894B4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldrb r0, [r4, 0xA]
	bl sub_8089230
_080894B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080894BC: .4byte gPlayerAvatar
_080894C0: .4byte gMapObjects
	thumb_func_end sub_808948C

	thumb_func_start sub_80894C4
sub_80894C4: @ 80894C4
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0xA]
	bl sub_8088FA4
	lsls r0, 24
	cmp r0, 0
	beq _080894F0
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080894F8
	adds r0, r1
	bl DestroySprite
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x10
	strh r0, [r4, 0xA]
_080894F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080894F8: .4byte gSprites
	thumb_func_end sub_80894C4

	thumb_func_start fishE
fishE: @ 80894FC
	push {r4-r7,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0xA]
	subs r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _08089566
	ldr r6, _0808956C
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08089570
	adds r4, r0, r1
	movs r7, 0
	ldrh r1, [r5, 0x26]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08089530
	movs r7, 0x3
	ldrb r0, [r4, 0x1A]
	movs r1, 0x1
	bl sub_8127ED0
_08089530:
	adds r0, r7, 0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	adds r0, r4, 0
	movs r1, 0x1
	bl FieldObjectTurn
	ldrh r0, [r5, 0x26]
	strb r0, [r6]
	movs r0, 0
	strb r0, [r6, 0x6]
	movs r0, 0x20
	bl FieldEffectActiveListRemove
	ldr r0, _08089574
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08089566:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808956C: .4byte gPlayerAvatar
_08089570: .4byte gMapObjects
_08089574: .4byte sub_8089270
	thumb_func_end fishE

	thumb_func_start remove_some_task
remove_some_task: @ 8089578
	push {r4,lr}
	ldr r4, _080895A8
	movs r0, 0
	strb r0, [r4, 0x15]
	ldr r1, _080895AC
	ldrh r2, [r1, 0xA]
	ldr r0, _080895B0
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _080895B4
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldrb r0, [r4, 0x18]
	cmp r0, 0xFF
	beq _080895A2
	bl DestroyTask
	movs r0, 0xFF
	strb r0, [r4, 0x18]
_080895A2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080895A8: .4byte gUnknown_03004DC0
_080895AC: .4byte 0x040000b0
_080895B0: .4byte 0x0000c5ff
_080895B4: .4byte 0x00007fff
	thumb_func_end remove_some_task

	thumb_func_start dp12_8087EA4
dp12_8087EA4: @ 80895B8
	push {r4,lr}
	sub sp, 0x4
	mov r0, sp
	movs r4, 0
	strh r4, [r0]
	ldr r1, _080895EC
	ldr r2, _080895F0
	bl CpuSet
	ldr r0, _080895F4
	movs r1, 0
	str r1, [r0]
	str r1, [r0, 0x4]
	str r1, [r0, 0x8]
	str r1, [r0, 0xC]
	strb r4, [r0, 0x14]
	strb r4, [r0, 0x15]
	strb r4, [r0, 0x16]
	strb r4, [r0, 0x17]
	movs r1, 0xFF
	strb r1, [r0, 0x18]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080895EC: .4byte gUnknown_03004DE0
_080895F0: .4byte 0x01000780
_080895F4: .4byte gUnknown_03004DC0
	thumb_func_end dp12_8087EA4

	thumb_func_start sub_80895F8
sub_80895F8: @ 80895F8
	push {lr}
	sub sp, 0xC
	str r0, [sp]
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	ldr r0, _0808961C
	cmp r1, r0
	bne _0808962C
	ldr r0, _08089620
	ldr r1, _08089624
	str r1, [r0]
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	str r1, [r0, 0x4]
	ldr r1, _08089628
	b _0808963C
	.align 2, 0
_0808961C: .4byte 0xa2600001
_08089620: .4byte gUnknown_03004DC0
_08089624: .4byte gUnknown_03004DE2
_08089628: .4byte sub_80896F4
_0808962C:
	ldr r0, _0808965C
	ldr r1, _08089660
	str r1, [r0]
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	str r1, [r0, 0x4]
	ldr r1, _08089664
_0808963C:
	str r1, [r0, 0x10]
	adds r1, r0, 0
	ldr r0, [sp, 0x4]
	str r0, [r1, 0xC]
	ldr r0, [sp]
	str r0, [r1, 0x8]
	mov r0, sp
	ldrb r0, [r0, 0x8]
	strb r0, [r1, 0x15]
	mov r0, sp
	ldrb r0, [r0, 0x9]
	strb r0, [r1, 0x16]
	strb r0, [r1, 0x17]
	add sp, 0xC
	pop {r0}
	bx r0
	.align 2, 0
_0808965C: .4byte gUnknown_03004DC0
_08089660: .4byte gUnknown_03004DE4
_08089664: .4byte sub_8089714
	thumb_func_end sub_80895F8

	thumb_func_start sub_8089668
sub_8089668: @ 8089668
	push {r4,lr}
	ldr r4, _08089698
	ldrb r0, [r4, 0x15]
	cmp r0, 0
	beq _080896E2
	cmp r0, 0x3
	bne _080896AC
	movs r0, 0
	strb r0, [r4, 0x15]
	ldr r1, _0808969C
	ldrh r2, [r1, 0xA]
	ldr r0, _080896A0
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _080896A4
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldr r1, _080896A8
	movs r0, 0x1
	strb r0, [r1]
	b _080896E2
	.align 2, 0
_08089698: .4byte gUnknown_03004DC0
_0808969C: .4byte 0x040000b0
_080896A0: .4byte 0x0000c5ff
_080896A4: .4byte 0x00007fff
_080896A8: .4byte gUnknown_0202FFA4
_080896AC:
	ldr r1, _080896E8
	ldrh r2, [r1, 0xA]
	ldr r0, _080896EC
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _080896F0
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldrb r0, [r4, 0x14]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r4, 0x8]
	str r0, [r1, 0x4]
	ldr r0, [r4, 0xC]
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r0, [r4, 0x10]
	bl _call_via_r0
	ldrb r0, [r4, 0x14]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r4, 0x14]
_080896E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080896E8: .4byte 0x040000b0
_080896EC: .4byte 0x0000c5ff
_080896F0: .4byte 0x00007fff
	thumb_func_end sub_8089668

	thumb_func_start sub_80896F4
sub_80896F4: @ 80896F4
	ldr r0, _0808970C
	ldr r2, [r0, 0x8]
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _08089710
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_0808970C: .4byte gUnknown_03004DC0
_08089710: .4byte gUnknown_03004DE0
	thumb_func_end sub_80896F4

	thumb_func_start sub_8089714
sub_8089714: @ 8089714
	ldr r0, _0808972C
	ldr r2, [r0, 0x8]
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	ldr r1, _08089730
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	bx lr
	.align 2, 0
_0808972C: .4byte gUnknown_03004DC0
_08089730: .4byte gUnknown_03004DE0
	thumb_func_end sub_8089714

	thumb_func_start task00_for_dp12
task00_for_dp12: @ 8089734
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	movs r6, 0
	ldr r0, _0808975C
	ldrb r0, [r0]
	cmp r0, 0
	beq _08089764
	mov r0, r12
	bl DestroyTask
	ldr r1, _08089760
	movs r0, 0xFF
	strb r0, [r1, 0x18]
	b _080898E4
	.align 2, 0
_0808975C: .4byte gUnknown_0202FFA4
_08089760: .4byte gUnknown_03004DC0
_08089764:
	ldr r1, _08089790
	mov r0, r12
	lsls r2, r0, 2
	adds r0, r2, r0
	lsls r0, 3
	adds r3, r0, r1
	movs r4, 0x16
	ldrsh r0, [r3, r4]
	mov r10, r1
	mov r9, r2
	cmp r0, 0
	beq _08089810
	movs r1, 0x14
	ldrsh r0, [r3, r1]
	cmp r0, 0xE
	bhi _08089810
	lsls r0, 2
	ldr r1, _08089794
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08089790: .4byte gTasks
_08089794: .4byte _08089798
	.align 2, 0
_08089798:
	.4byte _080897D4
	.4byte _08089810
	.4byte _080897DC
	.4byte _08089810
	.4byte _080897E4
	.4byte _08089810
	.4byte _080897EC
	.4byte _08089810
	.4byte _080897F4
	.4byte _08089810
	.4byte _080897FC
	.4byte _08089810
	.4byte _08089804
	.4byte _08089810
	.4byte _0808980C
_080897D4:
	ldr r0, _080897D8
	b _0808980E
	.align 2, 0
_080897D8: .4byte gUnknown_030042A4
_080897DC:
	ldr r0, _080897E0
	b _0808980E
	.align 2, 0
_080897E0: .4byte gUnknown_030042A0
_080897E4:
	ldr r0, _080897E8
	b _0808980E
	.align 2, 0
_080897E8: .4byte gUnknown_030042C0
_080897EC:
	ldr r0, _080897F0
	b _0808980E
	.align 2, 0
_080897F0: .4byte gUnknown_030041B4
_080897F4:
	ldr r0, _080897F8
	b _0808980E
	.align 2, 0
_080897F8: .4byte gUnknown_03004288
_080897FC:
	ldr r0, _08089800
	b _0808980E
	.align 2, 0
_08089800: .4byte gUnknown_03004280
_08089804:
	ldr r0, _08089808
	b _0808980E
	.align 2, 0
_08089808: .4byte gUnknown_030041B0
_0808980C:
	ldr r0, _08089870
_0808980E:
	ldrh r6, [r0]
_08089810:
	mov r0, r9
	add r0, r12
	lsls r0, 3
	mov r2, r10
	adds r1, r0, r2
	ldrh r2, [r1, 0x10]
	movs r3, 0x10
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0808987C
	subs r0, r2, 0x1
	strh r0, [r1, 0x10]
	movs r4, 0xE
	ldrsh r0, [r1, r4]
	movs r3, 0xA0
	lsls r3, 1
	adds r2, r0, r3
	movs r4, 0x8
	ldrsh r3, [r1, r4]
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	cmp r3, r0
	bge _080898E4
	ldr r5, _08089874
	ldr r0, _08089878
	mov r8, r0
	adds r7, r1, 0
	lsls r0, r2, 1
	adds r4, r0, r5
_0808984A:
	lsls r2, r3, 1
	mov r0, r8
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r5
	ldrh r0, [r4]
	adds r0, r6
	strh r0, [r2]
	adds r4, 0x2
	adds r3, 0x1
	movs r1, 0xA
	ldrsh r0, [r7, r1]
	cmp r3, r0
	blt _0808984A
	b _080898E4
	.align 2, 0
_08089870: .4byte gUnknown_030041B8
_08089874: .4byte gUnknown_03004DE0
_08089878: .4byte gUnknown_03004DC0
_0808987C:
	ldrh r0, [r1, 0x12]
	strh r0, [r1, 0x10]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	movs r3, 0xA0
	lsls r3, 1
	adds r2, r0, r3
	movs r4, 0x8
	ldrsh r3, [r1, r4]
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	cmp r3, r0
	bge _080898C4
	ldr r5, _080898F4
	adds r7, r1, 0
	lsls r0, r2, 1
	adds r4, r0, r5
	ldr r0, _080898F8
	mov r8, r0
_080898A2:
	lsls r2, r3, 1
	mov r0, r8
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r5
	ldrh r0, [r4]
	adds r0, r6
	strh r0, [r2]
	adds r4, 0x2
	adds r3, 0x1
	movs r1, 0xA
	ldrsh r0, [r7, r1]
	cmp r3, r0
	blt _080898A2
_080898C4:
	mov r0, r9
	add r0, r12
	lsls r0, 3
	mov r3, r10
	adds r2, r0, r3
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r4, 0xC
	ldrsh r1, [r2, r4]
	cmp r0, r1
	bne _080898E4
	movs r0, 0
	strh r0, [r2, 0xE]
_080898E4:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080898F4: .4byte gUnknown_03004DE0
_080898F8: .4byte gUnknown_03004DC0
	thumb_func_end task00_for_dp12

	thumb_func_start sub_80898FC
sub_80898FC: @ 80898FC
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	movs r1, 0
	movs r2, 0
	ldr r0, _08089940
	mov r12, r0
_08089910:
	lsls r0, r1, 1
	adds r3, r0, r6
	lsls r0, r2, 1
	add r0, r12
	movs r7, 0
	ldrsh r0, [r0, r7]
	muls r0, r4
	cmp r0, 0
	bge _08089924
	adds r0, 0xFF
_08089924:
	asrs r0, 8
	strh r0, [r3]
	adds r0, r2, r5
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xFF
	bls _08089910
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089940: .4byte gSineTable
	thumb_func_end sub_80898FC

	thumb_func_start sub_8089944
sub_8089944: @ 8089944
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	adds r5, r0, 0
	str r1, [sp, 0x10]
	ldr r0, [sp, 0x40]
	mov r8, r0
	ldr r1, [sp, 0x44]
	mov r9, r1
	ldr r0, [sp, 0x48]
	mov r10, r0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, [sp, 0x10]
	lsls r1, 24
	str r1, [sp, 0x14]
	lsrs r0, r1, 24
	str r0, [sp, 0xC]
	lsls r1, r2, 24
	lsrs r1, 24
	str r1, [sp, 0x18]
	lsls r2, r3, 24
	lsrs r2, 24
	str r2, [sp, 0x1C]
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	mov r3, r9
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	bl dp12_8087EA4
	ldr r0, _08089A50
	add r0, r9
	str r0, [sp]
	ldr r0, _08089A54
	str r0, [sp, 0x4]
	mov r1, sp
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	movs r1, 0
	strb r1, [r0, 0x9]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_80895F8
	ldr r0, _08089A58
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08089A5C
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	strh r5, [r4, 0x8]
	mov r3, sp
	ldrh r3, [r3, 0xC]
	strh r3, [r4, 0xA]
	movs r0, 0x80
	lsls r0, 1
	ldr r1, [sp, 0x18]
	bl __divsi3
	strh r0, [r4, 0xC]
	movs r0, 0
	strh r0, [r4, 0xE]
	mov r1, r8
	strh r1, [r4, 0x10]
	strh r1, [r4, 0x12]
	mov r3, r9
	strh r3, [r4, 0x14]
	mov r0, r10
	strh r0, [r4, 0x16]
	ldr r0, _08089A60
	strb r7, [r0, 0x18]
	ldr r0, _08089A64
	movs r1, 0
	strb r1, [r0]
	ldr r4, _08089A68
	ldr r3, [sp, 0xC]
	subs r6, r3, r5
	lsls r3, r6, 24
	lsrs r3, 24
	adds r0, r4, 0
	ldr r1, [sp, 0x18]
	ldr r2, [sp, 0x1C]
	bl sub_80898FC
	ldr r0, [sp, 0xC]
	cmp r5, r0
	bge _08089A3E
	ldr r1, _08089A6C
	adds r2, r4, r1
	lsls r1, r5, 1
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r1, r3
	adds r3, r0, r2
	adds r1, r2
	adds r2, r4, 0
	adds r5, r6, 0
_08089A2A:
	ldrh r0, [r2]
	strh r0, [r1]
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, 0x2
	adds r3, 0x2
	adds r1, 0x2
	subs r5, 0x1
	cmp r5, 0
	bne _08089A2A
_08089A3E:
	adds r0, r7, 0
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08089A50: .4byte REG_BG0HOFS
_08089A54: .4byte 0xa2600001
_08089A58: .4byte task00_for_dp12
_08089A5C: .4byte gTasks
_08089A60: .4byte gUnknown_03004DC0
_08089A64: .4byte gUnknown_0202FFA4
_08089A68: .4byte gUnknown_03005060
_08089A6C: .4byte 0xfffffd80
	thumb_func_end sub_8089944

	thumb_func_start sub_8089A70
sub_8089A70: @ 8089A70
	push {lr}
	ldr r0, _08089A88
	ldrb r1, [r0, 0x8]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0, 0x8]
	movs r0, 0
	movs r1, 0
	bl sub_806AFAC
	pop {r0}
	bx r0
	.align 2, 0
_08089A88: .4byte gPaletteFade
	thumb_func_end sub_8089A70

	thumb_func_start sub_8089A8C
sub_8089A8C: @ 8089A8C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r5, _08089AD0
	movs r0, 0
	strb r0, [r5]
	ldr r0, _08089AD4
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08089AD8
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _08089AE0
	ldr r4, _08089ADC
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl AppendToList
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl AppendToList
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl AppendToList
	b _08089BC8
	.align 2, 0
_08089AD0: .4byte gUnknown_0202FFA9
_08089AD4: .4byte gUnknown_03005CE0
_08089AD8: .4byte gPlayerParty
_08089ADC: .4byte gUnknown_0202FFAA
_08089AE0:
	movs r6, 0
	ldr r0, _08089B24
	ldrh r0, [r0]
	mov r8, r0
_08089AE8:
	movs r4, 0
	adds r7, r6, 0x1
	mov r0, r8
	cmp r0, 0xFF
	beq _08089B48
	ldr r5, _08089B24
_08089AF4:
	ldr r0, _08089B28
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08089B2C
	adds r0, r1
	adds r1, r6, 0
	adds r1, 0xD
	bl GetMonData
	lsls r1, r4, 1
	adds r1, r5
	ldrh r1, [r1]
	cmp r0, r1
	bne _08089B38
	adds r2, r4, 0
	adds r2, 0xA
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _08089B30
	ldr r1, _08089B34
	bl AppendToList
	b _08089B48
	.align 2, 0
_08089B24: .4byte gUnknown_0839F554
_08089B28: .4byte gUnknown_03005CE0
_08089B2C: .4byte gPlayerParty
_08089B30: .4byte gUnknown_0202FFAA
_08089B34: .4byte gUnknown_0202FFA9
_08089B38:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r4, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, 0xFF
	bne _08089AF4
_08089B48:
	lsls r0, r7, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _08089AE8
	ldr r4, _08089BA4
	ldr r5, _08089BA8
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl AppendToList
	ldr r6, _08089BAC
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08089B76
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl AppendToList
_08089B76:
	ldr r0, _08089BB0
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	adds r1, r6, 0
	subs r1, 0x64
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _08089BB4
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x7
	bl AppendToList
	b _08089BBE
	.align 2, 0
_08089BA4: .4byte gUnknown_0202FFAA
_08089BA8: .4byte gUnknown_0202FFA9
_08089BAC: .4byte gUnknown_030043C4
_08089BB0: .4byte gUnknown_03005CE0
_08089BB4:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl AppendToList
_08089BBE:
	ldr r0, _08089BD4
	ldr r1, _08089BD8
	movs r2, 0x3
	bl AppendToList
_08089BC8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089BD4: .4byte gUnknown_0202FFAA
_08089BD8: .4byte gUnknown_0202FFA9
	thumb_func_end sub_8089A8C

	thumb_func_start sub_8089BDC
sub_8089BDC: @ 8089BDC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	mov r8, r3
	ldr r7, [sp, 0x20]
	ldr r1, [sp, 0x24]
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x5
	bl sub_806D538
	adds r4, r5, r4
	lsls r4, 24
	lsrs r4, 24
	mov r0, r8
	lsls r3, r0, 1
	adds r3, r6, r3
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl MenuDrawTextWindow
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	adds r6, 0x1
	lsls r6, 24
	lsrs r6, 24
	str r7, [sp]
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, r8
	ldr r3, [sp, 0x1C]
	bl PrintMenuItemsReordered
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8089BDC

	thumb_func_start sub_8089C50
sub_8089C50: @ 8089C50
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r4, [sp, 0x18]
	ldr r5, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r4, 0x1
	str r4, [sp, 0x8]
	bl sub_8089BDC
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8089C50

	thumb_func_start sub_8089C7C
sub_8089C7C: @ 8089C7C
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _08089CC8
	ldrb r0, [r6]
	lsls r0, 1
	movs r4, 0x12
	subs r4, r0
	lsls r4, 24
	lsrs r4, 24
	ldrb r3, [r6]
	ldr r0, _08089CCC
	str r0, [sp]
	ldr r0, _08089CD0
	str r0, [sp, 0x4]
	movs r0, 0x3
	str r0, [sp, 0x8]
	movs r0, 0x13
	adds r1, r4, 0
	movs r2, 0xA
	bl sub_8089BDC
	movs r2, 0x1
	orrs r2, r4
	ldrb r3, [r6]
	str r5, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x14
	bl InitMenu
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089CC8: .4byte gUnknown_0202FFA9
_08089CCC: .4byte gUnknown_0839F494
_08089CD0: .4byte gUnknown_0202FFAA
	thumb_func_end sub_8089C7C

	thumb_func_start sub_8089CD4
sub_8089CD4: @ 8089CD4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08089D00
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08089D84
	adds r0, r4, 0
	bl sub_806BD80
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _08089D04
	cmp r0, 0x2
	beq _08089D60
	b _08089D84
	.align 2, 0
_08089D00: .4byte gPaletteFade
_08089D04:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _08089D48
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08089D4C
	adds r0, r1
	ldr r1, _08089D50
	bl GetMonNickname
	bl sub_8089A8C
	ldr r0, _08089D54
	strb r5, [r0]
	movs r0, 0
	bl sub_8089C7C
	ldr r1, _08089D58
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08089D5C
	str r1, [r0]
	adds r0, r4, 0
	bl sub_808B5B4
	b _08089D84
	.align 2, 0
_08089D48: .4byte gUnknown_03005CE0
_08089D4C: .4byte gPlayerParty
_08089D50: .4byte gStringVar1
_08089D54: .4byte gUnknown_0202FFA8
_08089D58: .4byte gTasks
_08089D5C: .4byte sub_8089D94
_08089D60:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08089D8C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08089D90
	str r1, [r0]
_08089D84:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089D8C: .4byte gTasks
_08089D90: .4byte sub_8089E4C
	thumb_func_end sub_8089CD4

	thumb_func_start sub_8089D94
sub_8089D94: @ 8089D94
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r0, _08089DC8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08089E44
	ldr r2, _08089DCC
	ldrh r0, [r2, 0x30]
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0x40
	bne _08089DD4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	ldr r1, _08089DD0
	strb r0, [r1]
	b _08089E1A
	.align 2, 0
_08089DC8: .4byte gPaletteFade
_08089DCC: .4byte gMain
_08089DD0: .4byte gUnknown_0202FFA8
_08089DD4:
	cmp r1, 0x80
	bne _08089DF0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	ldr r1, _08089DEC
	strb r0, [r1]
	b _08089E1A
	.align 2, 0
_08089DEC: .4byte gUnknown_0202FFA8
_08089DF0:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08089E30
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08089E24
	ldr r2, _08089E28
	ldr r0, _08089E2C
	ldrb r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
_08089E1A:
	adds r0, r4, 0
	bl sub_808B5B4
	b _08089E44
	.align 2, 0
_08089E24: .4byte gUnknown_0839F494
_08089E28: .4byte gUnknown_0202FFAA
_08089E2C: .4byte gUnknown_0202FFA8
_08089E30:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08089E44
	adds r0, r5, 0
	bl sub_808A918
	adds r0, r5, 0
	bl sub_808B5B4
_08089E44:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8089D94

	thumb_func_start sub_8089E4C
sub_8089E4C: @ 8089E4C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08089E78
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08089E72
	ldr r0, _08089E7C
	strb r1, [r0]
	ldr r0, _08089E80
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08089E72:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089E78: .4byte gPaletteFade
_08089E7C: .4byte gUnknown_03005CE0
_08089E80: .4byte sub_805469C
	thumb_func_end sub_8089E4C

	thumb_func_start sub_8089E84
sub_8089E84: @ 8089E84
	push {lr}
	ldr r0, _08089EAC
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08089EB0
	adds r0, r1
	ldr r1, _08089EB4
	bl GetMonNickname
	bl sub_8089A8C
	ldr r1, _08089EB8
	movs r0, 0
	strb r0, [r1]
	movs r0, 0
	bl sub_8089C7C
	pop {r0}
	bx r0
	.align 2, 0
_08089EAC: .4byte gUnknown_03005CE0
_08089EB0: .4byte gPlayerParty
_08089EB4: .4byte gStringVar1
_08089EB8: .4byte gUnknown_0202FFA8
	thumb_func_end sub_8089E84

	thumb_func_start sub_8089EBC
sub_8089EBC: @ 8089EBC
	push {r4,r5,lr}
	ldr r4, _08089EC4
	ldr r5, _08089EC8
	b _08089ED8
	.align 2, 0
_08089EC4: .4byte 0x0201b260
_08089EC8: .4byte gUnknown_020384F0
_08089ECC:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08089F04
_08089ED8:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08089ECC
	ldrb r0, [r4]
	ldrb r1, [r5]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r1, _08089F0C
	ldrb r0, [r5]
	strb r0, [r1]
	bl sub_8089E84
	ldr r0, _08089F10
	bl SetMainCallback2
_08089F04:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089F0C: .4byte gUnknown_03005CE0
_08089F10: .4byte sub_806AEDC
	thumb_func_end sub_8089EBC

	thumb_func_start sub_8089F14
sub_8089F14: @ 8089F14
	push {lr}
	ldr r2, _08089F38
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r2, _08089F3C
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0x5
	bl sub_806AF4C
	ldr r0, _08089F40
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08089F38: .4byte gPaletteFade
_08089F3C: .4byte sub_8089D94
_08089F40: .4byte sub_8089EBC
	thumb_func_end sub_8089F14

	thumb_func_start sub_8089F44
sub_8089F44: @ 8089F44
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _08089FAC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08089FA2
	ldr r2, _08089FB0
	ldr r1, _08089FB4
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0xE]
	lsls r1, 16
	asrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r4, [r0, 0x2E]
	lsls r4, 24
	lsrs r4, 24
	adds r0, r3, 0
	bl DestroyTask
	ldr r0, _08089FB8
	ldr r1, _08089FBC
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _08089FC0
	ldr r1, _08089FC4
	ldrb r2, [r1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08089FC8
	str r5, [sp]
	adds r1, r4, 0
	bl sub_809D8BC
_08089FA2:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089FAC: .4byte gPaletteFade
_08089FB0: .4byte gSprites
_08089FB4: .4byte gTasks
_08089FB8: .4byte 0x0201b000
_08089FBC: .4byte 0x00000262
_08089FC0: .4byte gPlayerParty
_08089FC4: .4byte gPlayerPartyCount
_08089FC8: .4byte sub_8089F14
	thumb_func_end sub_8089F44

	thumb_func_start sub_8089FCC
sub_8089FCC: @ 8089FCC
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
	ldr r1, _08089FFC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A000
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089FFC: .4byte gTasks
_0808A000: .4byte sub_8089F44
	thumb_func_end sub_8089FCC

	thumb_func_start sub_808A004
sub_808A004: @ 808A004
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0808A024
	ldr r2, _0808A028
	bl SetTaskFuncWithFollowupFunc
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	.align 2, 0
_0808A024: .4byte sub_806CA60
_0808A028: .4byte sub_8089CD4
	thumb_func_end sub_808A004

	thumb_func_start sub_808A02C
sub_808A02C: @ 808A02C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	ldr r0, _0808A054
	ldr r1, _0808A058
	str r1, [r0, 0xC]
	ldr r1, _0808A05C
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0]
	adds r0, r4, 0
	bl sub_808A004
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A054: .4byte 0x02001000
_0808A058: .4byte sub_806CD5C
_0808A05C: .4byte 0x0001a272
	thumb_func_end sub_808A02C

	thumb_func_start sub_808A060
sub_808A060: @ 808A060
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0808A0D0
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x40
	bne _0808A086
	ldr r4, _0808A0D4
	ldrb r0, [r4]
	cmp r0, 0
	beq _0808A086
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	strb r0, [r4]
	movs r0, 0x5
	bl PlaySE
_0808A086:
	ldr r0, _0808A0D0
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x80
	bne _0808A0A4
	ldr r4, _0808A0D4
	ldrb r0, [r4]
	cmp r0, 0x2
	beq _0808A0A4
	movs r0, 0x1
	bl MoveMenuCursor
	strb r0, [r4]
	movs r0, 0x5
	bl PlaySE
_0808A0A4:
	ldr r0, _0808A0D0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0808A0E0
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0808A0D8
	ldr r2, _0808A0DC
	ldr r0, _0808A0D4
	ldrb r3, [r0]
	movs r0, 0
	bl sub_806E81C
	adds r1, r0, 0
	adds r0, r5, 0
	bl _call_via_r1
	b _0808A0F6
	.align 2, 0
_0808A0D0: .4byte gMain
_0808A0D4: .4byte gUnknown_0202FFA8
_0808A0D8: .4byte gUnknown_0839F578
_0808A0DC: .4byte gUnknown_0839F494
_0808A0E0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0808A0F6
	ldr r1, _0808A0FC
	movs r0, 0
	bl sub_806E7D0
	adds r0, r5, 0
	bl sub_808A938
_0808A0F6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A0FC: .4byte gUnknown_0839F578
	thumb_func_end sub_808A060

	thumb_func_start sub_808A100
sub_808A100: @ 808A100
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0808A130
	ldr r2, _0808A134
	movs r0, 0
	movs r3, 0
	bl sub_806E750
	movs r0, 0xD
	movs r1, 0x2
	bl sub_806D538
	ldr r1, _0808A138
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A13C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A130: .4byte gUnknown_0839F578
_0808A134: .4byte gUnknown_0839F494
_0808A138: .4byte gTasks
_0808A13C: .4byte sub_808A060
	thumb_func_end sub_808A100

	thumb_func_start sub_808A140
sub_808A140: @ 808A140
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	ldr r1, _0808A174
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _0808A178
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A17C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A174: .4byte gUnknown_0202FFA8
_0808A178: .4byte gTasks
_0808A17C: .4byte sub_808A100
	thumb_func_end sub_808A140

	thumb_func_start sub_808A180
sub_808A180: @ 808A180
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0808A1D0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808A1CA
	adds r0, r5, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0808A1D4
	adds r0, r1
	movs r1, 0x40
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl DestroyTask
	lsls r1, r4, 3
	adds r1, r4
	lsls r1, 2
	ldr r0, _0808A1D8
	adds r1, r0
	ldr r2, _0808A1DC
	movs r0, 0x4
	movs r3, 0x3
	bl sub_80E62A0
_0808A1CA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A1D0: .4byte gPaletteFade
_0808A1D4: .4byte gPlayerParty
_0808A1D8: .4byte gSaveBlock1 + 0x2B4C
_0808A1DC: .4byte sub_808A520
	thumb_func_end sub_808A180

	thumb_func_start sub_808A1E0
sub_808A1E0: @ 808A1E0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808A21C
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808A216
	adds r0, r4, 0
	bl sub_806CA38
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_806DF60
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldr r1, _0808A220
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A224
	str r1, [r0]
_0808A216:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A21C: .4byte gUnknown_0202E8F6
_0808A220: .4byte gTasks
_0808A224: .4byte sub_8089CD4
	thumb_func_end sub_808A1E0

	thumb_func_start sub_808A228
sub_808A228: @ 808A228
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808A268
	ldrh r0, [r0]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0808A278
	ldr r0, _0808A26C
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808A278
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0808A270
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A274
	str r1, [r0]
	b _0808A29A
	.align 2, 0
_0808A268: .4byte word_203855E
_0808A26C: .4byte gUnknown_0202E8F4
_0808A270: .4byte gTasks
_0808A274: .4byte sub_808A180
_0808A278:
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldr r0, _0808A2A4
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808A2A8
	str r0, [r1]
_0808A29A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A2A4: .4byte gTasks
_0808A2A8: .4byte sub_8089CD4
	thumb_func_end sub_808A228

	thumb_func_start sub_808A2AC
sub_808A2AC: @ 808A2AC
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0808A2D0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808A2CA
	ldr r0, _0808A2D4
	ldrh r1, [r0]
	ldr r2, _0808A2D8
	adds r0, r3, 0
	bl sub_806E964
_0808A2CA:
	pop {r0}
	bx r0
	.align 2, 0
_0808A2D0: .4byte gPaletteFade
_0808A2D4: .4byte word_203855E
_0808A2D8: .4byte sub_808A228
	thumb_func_end sub_808A2AC

	thumb_func_start sub_808A2DC
sub_808A2DC: @ 808A2DC
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r5, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0808A324
	adds r0, r1
	movs r1, 0x40
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl DestroyTask
	lsls r1, r4, 3
	adds r1, r4
	lsls r1, 2
	ldr r0, _0808A328
	adds r1, r0
	ldr r2, _0808A32C
	movs r0, 0x4
	movs r3, 0x3
	bl sub_80E62A0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A324: .4byte gPlayerParty
_0808A328: .4byte gSaveBlock1 + 0x2B4C
_0808A32C: .4byte sub_808A520
	thumb_func_end sub_808A2DC

	thumb_func_start sub_808A330
sub_808A330: @ 808A330
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0808A344
	ldrh r1, [r1]
	ldr r2, _0808A348
	bl sub_806E964
	pop {r0}
	bx r0
	.align 2, 0
_0808A344: .4byte word_203855E
_0808A348: .4byte sub_808A2DC
	thumb_func_end sub_808A330

	thumb_func_start sub_808A34C
sub_808A34C: @ 808A34C
	push {lr}
	bl RunTasks
	pop {r0}
	bx r0
	thumb_func_end sub_808A34C

	thumb_func_start sub_808A358
sub_808A358: @ 808A358
	push {r4,lr}
	ldr r4, _0808A360
	b _0808A370
	.align 2, 0
_0808A360: .4byte 0x0201b260
_0808A364:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808A394
_0808A370:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808A364
	ldrb r0, [r4]
	ldr r1, _0808A39C
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808A3A0
	bl SetMainCallback2
_0808A394:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A39C: .4byte gUnknown_03005CE0
_0808A3A0: .4byte sub_806AEDC
	thumb_func_end sub_808A358

	thumb_func_start sub_808A3A4
sub_808A3A4: @ 808A3A4
	push {r4,r5,lr}
	ldr r4, _0808A3D8
	adds r5, r4, 0x2
_0808A3AA:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808A3E4
	ldrb r0, [r4]
	ldr r1, _0808A3DC
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	movs r0, 0x3
	strb r0, [r5]
	bl sub_8089E84
	ldr r0, _0808A3E0
	bl SetMainCallback2
	b _0808A3F0
	.align 2, 0
_0808A3D8: .4byte 0x0201b260
_0808A3DC: .4byte gUnknown_03005CE0
_0808A3E0: .4byte sub_806AEDC
_0808A3E4:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808A3AA
_0808A3F0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_808A3A4

	thumb_func_start sub_808A3F8
sub_808A3F8: @ 808A3F8
	push {r4,lr}
	ldr r0, _0808A460
	ldrh r0, [r0]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0808A47E
	ldr r0, _0808A464
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _0808A468
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	adds r0, r4, 0
	movs r1, 0
	bl sub_806BD58
	ldr r0, _0808A46C
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_806C994
	adds r0, r4, 0
	movs r1, 0
	bl sub_806BF74
	adds r0, r4, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0808A470
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	lsls r0, 24
	cmp r0, 0
	bne _0808A478
	ldr r0, _0808A474
	bl SetMainCallback2
	b _0808A4C6
	.align 2, 0
_0808A460: .4byte word_203855E
_0808A464: .4byte sub_808A330
_0808A468: .4byte gPaletteFade
_0808A46C: .4byte gUnknown_03005CE0
_0808A470: .4byte gPlayerParty
_0808A474: .4byte sub_808A34C
_0808A478:
	adds r0, r4, 0
	bl DestroyTask
_0808A47E:
	ldr r2, _0808A4A4
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0808A4A8
	ldrh r0, [r0]
	cmp r0, 0
	beq _0808A4B4
	ldr r2, _0808A4AC
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0xFF
	bl sub_806AF4C
	ldr r0, _0808A4B0
	bl SetMainCallback2
	b _0808A4C6
	.align 2, 0
_0808A4A4: .4byte gPaletteFade
_0808A4A8: .4byte word_203855E
_0808A4AC: .4byte sub_808A2AC
_0808A4B0: .4byte sub_808A358
_0808A4B4:
	ldr r2, _0808A4CC
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0x5
	bl sub_806AF4C
	ldr r0, _0808A4D0
	bl SetMainCallback2
_0808A4C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A4CC: .4byte sub_8089D94
_0808A4D0: .4byte sub_808A3A4
	thumb_func_end sub_808A3F8

	thumb_func_start sub_808A4D4
sub_808A4D4: @ 808A4D4
	push {r4,lr}
	ldr r4, _0808A4DC
	b _0808A4EC
	.align 2, 0
_0808A4DC: .4byte 0x0201b260
_0808A4E0:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808A510
_0808A4EC:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808A4E0
	ldrb r0, [r4]
	ldr r1, _0808A518
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808A51C
	bl SetMainCallback2
_0808A510:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A518: .4byte gUnknown_03005CE0
_0808A51C: .4byte sub_806AEDC
	thumb_func_end sub_808A4D4

	thumb_func_start sub_808A520
sub_808A520: @ 808A520
	push {r4-r7,lr}
	ldr r2, _0808A584
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0808A588
	ldrh r0, [r0]
	cmp r0, 0
	bne _0808A59C
	ldr r7, _0808A58C
	ldrh r0, [r7]
	cmp r0, 0
	beq _0808A542
	movs r1, 0x1
	bl sub_80A9538
_0808A542:
	ldr r6, _0808A590
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _0808A594
	adds r0, r4
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_80A9424
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	bl sub_80A2DF8
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0xC
	adds r2, r7, 0
	bl SetMonData
	ldr r2, _0808A598
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0
	bl sub_806AF4C
	b _0808A5A8
	.align 2, 0
_0808A584: .4byte gPaletteFade
_0808A588: .4byte gScriptResult
_0808A58C: .4byte gUnknown_0202E8F8
_0808A590: .4byte gUnknown_03005CE0
_0808A594: .4byte gPlayerParty
_0808A598: .4byte sub_8089CD4
_0808A59C:
	ldr r2, _0808A5B4
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0xFF
	bl sub_806AF4C
_0808A5A8:
	ldr r0, _0808A5B8
	bl SetMainCallback2
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A5B4: .4byte sub_808A5BC
_0808A5B8: .4byte sub_808A4D4
	thumb_func_end sub_808A520

	thumb_func_start sub_808A5BC
sub_808A5BC: @ 808A5BC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808A5F0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808A5EA
	ldr r0, _0808A5F4
	ldrb r0, [r0]
	ldr r1, _0808A5F8
	ldrh r1, [r1]
	movs r2, 0
	bl sub_806EBF0
	ldr r1, _0808A5FC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A600
	str r1, [r0]
_0808A5EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A5F0: .4byte gPaletteFade
_0808A5F4: .4byte gUnknown_03005CE0
_0808A5F8: .4byte word_203855E
_0808A5FC: .4byte gTasks
_0808A600: .4byte sub_808A1E0
	thumb_func_end sub_808A5BC

	thumb_func_start sub_808A604
sub_808A604: @ 808A604
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808A628
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808A622
	ldr r0, _0808A62C
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0808A622:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A628: .4byte gPaletteFade
_0808A62C: .4byte sub_80A61D0
	thumb_func_end sub_808A604

	thumb_func_start sub_808A630
sub_808A630: @ 808A630
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _0808A66C
	strb r0, [r1]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0808A670
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A674
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A66C: .4byte gUnknown_0202E8F5
_0808A670: .4byte gTasks
_0808A674: .4byte sub_808A604
	thumb_func_end sub_808A630

	thumb_func_start sub_808A678
sub_808A678: @ 808A678
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_808A8D4
	pop {r0}
	bx r0
	thumb_func_end sub_808A678

	thumb_func_start sub_808A688
sub_808A688: @ 808A688
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_806D5A4
	ldr r1, _0808A6B4
	adds r0, r4, 0
	bl sub_806ECE8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A6B4: .4byte sub_808A678
	thumb_func_end sub_808A688

	thumb_func_start sub_808A6B8
sub_808A6B8: @ 808A6B8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_806D5A4
	ldr r1, _0808A6E4
	adds r0, r4, 0
	bl sub_806EE08
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A6E4: .4byte sub_808A678
	thumb_func_end sub_808A6B8

	thumb_func_start sub_808A6E8
sub_808A6E8: @ 808A6E8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	ldr r1, _0808A728
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _0808A72C
	ldr r2, _0808A730
	movs r0, 0
	movs r3, 0
	bl sub_806E750
	ldr r1, _0808A734
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A738
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A728: .4byte gUnknown_0202FFA8
_0808A72C: .4byte gUnknown_0839F584
_0808A730: .4byte gUnknown_0839F494
_0808A734: .4byte gTasks
_0808A738: .4byte sub_808A73C
	thumb_func_end sub_808A6E8

	thumb_func_start sub_808A73C
sub_808A73C: @ 808A73C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0808A764
	ldrh r0, [r0, 0x30]
	cmp r0, 0x40
	bne _0808A77A
	movs r0, 0x5
	bl PlaySE
	ldr r4, _0808A768
	ldrb r0, [r4]
	cmp r0, 0
	bne _0808A770
	ldr r0, _0808A76C
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	asrs r0, 24
	b _0808A774
	.align 2, 0
_0808A764: .4byte gMain
_0808A768: .4byte gUnknown_0202FFA8
_0808A76C: .4byte gUnknown_0839F584
_0808A770:
	movs r0, 0x1
	negs r0, r0
_0808A774:
	bl MoveMenuCursor
	strb r0, [r4]
_0808A77A:
	ldr r0, _0808A7A0
	ldrh r0, [r0, 0x30]
	cmp r0, 0x80
	bne _0808A7B4
	movs r0, 0x5
	bl PlaySE
	ldr r4, _0808A7A4
	ldrb r0, [r4]
	ldr r1, _0808A7A8
	ldrb r2, [r1]
	subs r1, r2, 0x1
	cmp r0, r1
	bne _0808A7AC
	movs r0, 0x1
	subs r0, r2
	lsls r0, 24
	asrs r0, 24
	b _0808A7AE
	.align 2, 0
_0808A7A0: .4byte gMain
_0808A7A4: .4byte gUnknown_0202FFA8
_0808A7A8: .4byte gUnknown_0839F584
_0808A7AC:
	movs r0, 0x1
_0808A7AE:
	bl MoveMenuCursor
	strb r0, [r4]
_0808A7B4:
	ldr r0, _0808A7E0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0808A7F0
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0808A7E4
	ldr r2, _0808A7E8
	ldr r0, _0808A7EC
	ldrb r3, [r0]
	movs r0, 0
	bl sub_806E81C
	adds r1, r0, 0
	adds r0, r5, 0
	bl _call_via_r1
	b _0808A806
	.align 2, 0
_0808A7E0: .4byte gMain
_0808A7E4: .4byte gUnknown_0839F584
_0808A7E8: .4byte gUnknown_0839F494
_0808A7EC: .4byte gUnknown_0202FFA8
_0808A7F0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0808A806
	ldr r1, _0808A80C
	movs r0, 0
	bl sub_806E7D0
	adds r0, r5, 0
	bl sub_808A918
_0808A806:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A80C: .4byte gUnknown_0839F584
	thumb_func_end sub_808A73C

	thumb_func_start sub_808A810
sub_808A810: @ 808A810
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
	ldr r1, _0808A840
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A844
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A840: .4byte gTasks
_0808A844: .4byte sub_808A848
	thumb_func_end sub_808A810

	thumb_func_start sub_808A848
sub_808A848: @ 808A848
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0808A898
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808A890
	adds r0, r5, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0808A89C
	adds r0, r1
	movs r1, 0x40
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl DestroyTask
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	ldr r1, _0808A8A0
	adds r0, r1
	ldr r1, _0808A8A4
	movs r2, 0x1
	bl sub_80F890C
_0808A890:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A898: .4byte gPaletteFade
_0808A89C: .4byte gPlayerParty
_0808A8A0: .4byte gSaveBlock1 + 0x2B4C
_0808A8A4: .4byte sub_808A8A8
	thumb_func_end sub_808A848

	thumb_func_start sub_808A8A8
sub_808A8A8: @ 808A8A8
	push {lr}
	ldr r1, _0808A8C4
	ldr r0, _0808A8C8
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0808A8CC
	ldr r1, _0808A8D0
	adds r0, r1
	movs r1, 0x4
	strb r1, [r0]
	bl sub_8089F14
	pop {r0}
	bx r0
	.align 2, 0
_0808A8C4: .4byte gUnknown_020384F0
_0808A8C8: .4byte gUnknown_03005CE0
_0808A8CC: .4byte 0x0201b000
_0808A8D0: .4byte 0x00000262
	thumb_func_end sub_808A8A8

	thumb_func_start sub_808A8D4
sub_808A8D4: @ 808A8D4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0808A90C
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldr r1, _0808A910
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A914
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A90C: .4byte gUnknown_0202FFA8
_0808A910: .4byte gTasks
_0808A914: .4byte sub_8089CD4
	thumb_func_end sub_808A8D4

	thumb_func_start sub_808A918
sub_808A918: @ 808A918
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_808A8D4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_808A918

	thumb_func_start sub_808A938
sub_808A938: @ 808A938
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_806D5A4
	ldr r0, _0808A978
	ldrb r0, [r0]
	bl sub_8089C7C
	ldr r1, _0808A97C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A980
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A978: .4byte gUnknown_0202FFA8
_0808A97C: .4byte gTasks
_0808A980: .4byte sub_8089D94
	thumb_func_end sub_808A938

	thumb_func_start sub_808A984
sub_808A984: @ 808A984
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r7, _0808A9D0
	adds r4, r6, r7
	bl sub_8072DEC
	ldr r1, _0808A9D4
	ldr r0, _0808A9D8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	subs r0, 0xA
	strh r0, [r4, 0x16]
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808A9DC
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldrh r0, [r4, 0x16]
	subs r0, 0xB
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0808AABA
	movs r0, 0x9
	b _0808AAB2
	.align 2, 0
_0808A9D0: .4byte gUnknown_03004B28
_0808A9D4: .4byte gUnknown_0202FFAA
_0808A9D8: .4byte gUnknown_0202FFA8
_0808A9DC:
	ldrh r1, [r4, 0x16]
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0x7
	bgt _0808AA2C
	ldr r2, _0808AA20
	adds r0, r1, r2
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808AA2C
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_806D5A4
	ldr r0, _0808AA24
	movs r1, 0x1
	bl sub_806E834
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0808AA28
	str r1, [r0]
	b _0808AADA
	.align 2, 0
_0808AA20: .4byte 0x00000807
_0808AA24: .4byte gOtherText_CantBeUsedBadge
_0808AA28: .4byte sub_808AAF0
_0808AA2C:
	ldr r1, _0808AA78
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808AA90
	ldr r1, _0808AA7C
	movs r0, 0
	strb r0, [r1]
	ldrh r0, [r4, 0x16]
	subs r0, 0xB
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _0808AA88
	ldr r1, _0808AA80
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808AA84
	str r1, [r0]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0808AADA
	.align 2, 0
_0808AA78: .4byte gUnknown_0839F58C
_0808AA7C: .4byte gUnknown_0202FFA8
_0808AA80: .4byte gTasks
_0808AA84: .4byte sub_808AB34
_0808AA88:
	adds r0, r5, 0
	bl unref_sub_8133D28
	b _0808AADA
_0808AA90:
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bne _0808AABA
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0808AABA
	movs r0, 0x8
_0808AAB2:
	movs r1, 0
	bl sub_806D538
	b _0808AACC
_0808AABA:
	ldr r0, _0808AAE4
	movs r2, 0x16
	ldrsh r1, [r4, r2]
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x4]
	movs r1, 0
	bl sub_806D538
_0808AACC:
	ldr r0, _0808AAE8
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808AAEC
	str r0, [r1]
_0808AADA:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AAE4: .4byte gUnknown_0839F58C
_0808AAE8: .4byte gTasks
_0808AAEC: .4byte sub_808ABF4
	thumb_func_end sub_808A984

	thumb_func_start sub_808AAF0
sub_808AAF0: @ 808AAF0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808AB2C
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808AB24
	ldr r0, _0808AB30
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0808AB12
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0808AB24
_0808AB12:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_808A918
_0808AB24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AB2C: .4byte gUnknown_0202E8F6
_0808AB30: .4byte gMain
	thumb_func_end sub_808AAF0

	thumb_func_start sub_808AB34
sub_808AB34: @ 808AB34
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808AB6C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808AB84
	ldr r0, _0808AB70
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0x1E
	ldrsh r0, [r1, r2]
	cmp r0, 0x5
	bne _0808AB62
	bl sub_8147588
	lsls r0, 24
	cmp r0, 0
	beq _0808AB78
_0808AB62:
	ldr r0, _0808AB74
	bl SetMainCallback2
	b _0808AB7E
	.align 2, 0
_0808AB6C: .4byte gPaletteFade
_0808AB70: .4byte gTasks
_0808AB74: .4byte c2_exit_to_overworld_2_switch
_0808AB78:
	ldr r0, _0808AB8C
	bl SetMainCallback2
_0808AB7E:
	adds r0, r4, 0
	bl DestroyTask
_0808AB84:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AB8C: .4byte sub_80FC074
	thumb_func_end sub_808AB34

	thumb_func_start sub_808AB90
sub_808AB90: @ 808AB90
	push {lr}
	bl pal_fill_black
	ldr r0, _0808ABA4
	movs r1, 0x8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0808ABA4: .4byte sub_808ABA8
	thumb_func_end sub_808AB90

	thumb_func_start sub_808ABA8
sub_808ABA8: @ 808ABA8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808ABDE
	ldr r0, _0808ABE4
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808ABE8
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	ldr r1, _0808ABEC
	str r0, [r1]
	ldr r0, _0808ABF0
	ldr r0, [r0]
	bl _call_via_r0
	adds r0, r4, 0
	bl DestroyTask
_0808ABDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808ABE4: .4byte gUnknown_03005CE0
_0808ABE8: .4byte gPlayerParty
_0808ABEC: .4byte gUnknown_0202FF84
_0808ABF0: .4byte gUnknown_03005CE4
	thumb_func_end sub_808ABA8

	thumb_func_start sub_808ABF4
sub_808ABF4: @ 808ABF4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808AC28
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0808AC0E
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0808AC20
_0808AC0E:
	movs r0, 0x1
	movs r1, 0x11
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_808A918
_0808AC20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AC28: .4byte gMain
	thumb_func_end sub_808ABF4

	thumb_func_start sub_808AC2C
sub_808AC2C: @ 808AC2C
	push {lr}
	ldr r0, _0808AC40
	ldr r1, _0808AC44
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x9
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_0808AC40: .4byte gUnknown_0202FF84
_0808AC44: .4byte gUnknown_03005CE0
	thumb_func_end sub_808AC2C

	thumb_func_start sub_808AC48
sub_808AC48: @ 808AC48
	push {lr}
	bl PartyHasMonWithSurf
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808AC84
	bl IsPlayerFacingSurfableFishableWater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808AC84
	ldr r1, _0808AC74
	ldr r0, _0808AC78
	str r0, [r1]
	ldr r1, _0808AC7C
	ldr r0, _0808AC80
	str r0, [r1]
	movs r0, 0x1
	b _0808AC86
	.align 2, 0
_0808AC74: .4byte gUnknown_0300485C
_0808AC78: .4byte sub_808AB90
_0808AC7C: .4byte gUnknown_03005CE4
_0808AC80: .4byte sub_808AC2C
_0808AC84:
	movs r0, 0
_0808AC86:
	pop {r1}
	bx r1
	thumb_func_end sub_808AC48

	thumb_func_start sub_808AC8C
sub_808AC8C: @ 808AC8C
	push {lr}
	ldr r0, _0808ACA0
	ldr r1, _0808ACA4
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x1F
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_0808ACA0: .4byte gUnknown_0202FF84
_0808ACA4: .4byte gUnknown_03005CE0
	thumb_func_end sub_808AC8C

	thumb_func_start sub_808ACA8
sub_808ACA8: @ 808ACA8
	push {lr}
	bl sub_8147588
	lsls r0, 24
	cmp r0, 0
	beq _0808ACD0
	ldr r1, _0808ACC0
	ldr r0, _0808ACC4
	str r0, [r1]
	ldr r1, _0808ACC8
	ldr r0, _0808ACCC
	b _0808ACF2
	.align 2, 0
_0808ACC0: .4byte gUnknown_0300485C
_0808ACC4: .4byte sub_808AB90
_0808ACC8: .4byte gUnknown_03005CE4
_0808ACCC: .4byte sub_81475C4
_0808ACD0:
	ldr r0, _0808ACE4
	ldrb r0, [r0, 0x17]
	bl is_light_level_1_2_3_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808ACE8
	movs r0, 0
	b _0808ACF6
	.align 2, 0
_0808ACE4: .4byte gMapHeader
_0808ACE8:
	ldr r1, _0808ACFC
	ldr r0, _0808AD00
	str r0, [r1]
	ldr r1, _0808AD04
	ldr r0, _0808AD08
_0808ACF2:
	str r0, [r1]
	movs r0, 0x1
_0808ACF6:
	pop {r1}
	bx r1
	.align 2, 0
_0808ACFC: .4byte gUnknown_0300485C
_0808AD00: .4byte sub_808AB90
_0808AD04: .4byte gUnknown_03005CE4
_0808AD08: .4byte sub_808AC8C
	thumb_func_end sub_808ACA8

	thumb_func_start sub_808AD0C
sub_808AD0C: @ 808AD0C
	push {r4,lr}
	ldr r4, _0808AD14
	b _0808AD24
	.align 2, 0
_0808AD14: .4byte 0x0201b260
_0808AD18:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808AD48
_0808AD24:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808AD18
	ldrb r0, [r4]
	ldr r1, _0808AD50
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808AD54
	bl SetMainCallback2
_0808AD48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AD50: .4byte gUnknown_03005CE0
_0808AD54: .4byte sub_806AEDC
	thumb_func_end sub_808AD0C

	thumb_func_start sub_808AD58
sub_808AD58: @ 808AD58
	push {lr}
	ldr r2, _0808AD7C
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r2, _0808AD80
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0
	bl sub_806AF4C
	ldr r0, _0808AD84
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0808AD7C: .4byte gPaletteFade
_0808AD80: .4byte sub_8089CD4
_0808AD84: .4byte sub_808AD0C
	thumb_func_end sub_808AD58

	thumb_func_start unref_sub_808AD88
unref_sub_808AD88: @ 808AD88
	push {lr}
	ldr r0, _0808ADA4
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808ADA8
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0808ADA4: .4byte gUnknown_03005CE0
_0808ADA8: .4byte gPlayerParty
	thumb_func_end unref_sub_808AD88

	thumb_func_start sub_808ADAC
sub_808ADAC: @ 808ADAC
	push {lr}
	ldr r0, _0808ADC0
	ldr r1, _0808ADC4
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x2C
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_0808ADC0: .4byte gUnknown_0202FF84
_0808ADC4: .4byte gUnknown_03005CE0
	thumb_func_end sub_808ADAC

	thumb_func_start sub_808ADC8
sub_808ADC8: @ 808ADC8
	push {lr}
	bl sub_8068F18
	ldr r1, _0808ADE0
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1, 0x4]
	cmp r0, 0
	bne _0808ADE4
	movs r0, 0
	b _0808ADF2
	.align 2, 0
_0808ADE0: .4byte gUnknown_0202FF84
_0808ADE4:
	ldr r1, _0808ADF8
	ldr r0, _0808ADFC
	str r0, [r1]
	ldr r1, _0808AE00
	ldr r0, _0808AE04
	str r0, [r1]
	movs r0, 0x1
_0808ADF2:
	pop {r1}
	bx r1
	.align 2, 0
_0808ADF8: .4byte gUnknown_0300485C
_0808ADFC: .4byte sub_808AB90
_0808AE00: .4byte gUnknown_03005CE4
_0808AE04: .4byte sub_808ADAC
	thumb_func_end sub_808ADC8

	thumb_func_start sub_808AE08
sub_808AE08: @ 808AE08
	push {lr}
	ldr r0, _0808AE1C
	ldr r1, _0808AE20
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x2B
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_0808AE1C: .4byte gUnknown_0202FF84
_0808AE20: .4byte gUnknown_03005CE0
	thumb_func_end sub_808AE08

	thumb_func_start hm_prepare_waterfall
hm_prepare_waterfall: @ 808AE24
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808AE80
	bl IsPlayerSurfingNorth
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808AE80
	ldr r1, _0808AE70
	ldr r0, _0808AE74
	str r0, [r1]
	ldr r1, _0808AE78
	ldr r0, _0808AE7C
	str r0, [r1]
	movs r0, 0x1
	b _0808AE82
	.align 2, 0
_0808AE70: .4byte gUnknown_0300485C
_0808AE74: .4byte sub_808AB90
_0808AE78: .4byte gUnknown_03005CE4
_0808AE7C: .4byte sub_808AE08
_0808AE80:
	movs r0, 0
_0808AE82:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end hm_prepare_waterfall

	thumb_func_start sub_808AE8C
sub_808AE8C: @ 808AE8C
	push {r4-r6,lr}
	ldr r0, _0808AED8
	ldrb r0, [r0]
	subs r0, 0x21
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
_0808AE9A:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0808AEDC
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0808AF10
	adds r0, r5, 0
	bl sub_806D668
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0808AECE
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8040374
	cmp r0, 0
	bne _0808AEE0
_0808AECE:
	adds r0, r5, 0
	movs r1, 0x9A
	bl sub_806BC3C
	b _0808AF10
	.align 2, 0
_0808AED8: .4byte word_203855E
_0808AEDC: .4byte gPlayerParty
_0808AEE0:
	ldr r0, _0808AF04
	ldrh r0, [r0]
	bl ItemIdToBattleMoveId
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl pokemon_has_move
	lsls r0, 24
	cmp r0, 0
	beq _0808AF08
	adds r0, r5, 0
	movs r1, 0xA8
	bl sub_806BC3C
	b _0808AF10
	.align 2, 0
_0808AF04: .4byte word_203855E
_0808AF08:
	adds r0, r5, 0
	movs r1, 0x8C
	bl sub_806BC3C
_0808AF10:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _0808AE9A
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_808AE8C

	thumb_func_start sub_808AF20
sub_808AF20: @ 808AF20
	push {r4,r5,lr}
	movs r5, 0
_0808AF24:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0808AF78
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0808AF66
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0808AF58
	ldr r0, _0808AF7C
	ldrh r2, [r0]
	adds r0, r4, 0
	movs r1, 0x3
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	cmp r0, 0
	bne _0808AF66
_0808AF58:
	adds r0, r5, 0
	bl sub_806D668
	adds r0, r5, 0
	movs r1, 0
	bl sub_806BC3C
_0808AF66:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _0808AF24
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808AF78: .4byte gPlayerParty
_0808AF7C: .4byte word_203855E
	thumb_func_end sub_808AF20

	thumb_func_start sub_808AF80
sub_808AF80: @ 808AF80
	push {r4,r5,lr}
	ldr r5, _0808AFB0
_0808AF84:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B00C
	ldr r0, _0808AFB4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0808AFC6
	ldr r0, _0808AFB8
	ldrh r0, [r0]
	bl CheckIfItemIsTMHMOrEvolutionStone
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808AFBC
	cmp r0, 0x2
	beq _0808AFC2
	b _0808AFC6
	.align 2, 0
_0808AFB0: .4byte 0x0201b260
_0808AFB4: .4byte gUnknown_02038561
_0808AFB8: .4byte word_203855E
_0808AFBC:
	bl sub_808AE8C
	b _0808AFC6
_0808AFC2:
	bl sub_808AF20
_0808AFC6:
	ldr r4, _0808B000
	ldrb r0, [r4]
	cmp r0, 0x5
	bhi _0808AFE2
	adds r1, r0, 0
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808B004
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	bne _0808AFE6
_0808AFE2:
	movs r0, 0
	strb r0, [r4]
_0808AFE6:
	ldrb r0, [r5]
	ldr r1, _0808B000
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r5]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808B008
	bl SetMainCallback2
	b _0808B018
	.align 2, 0
_0808B000: .4byte gUnknown_03005CE0
_0808B004: .4byte gPlayerParty
_0808B008: .4byte sub_806AEDC
_0808B00C:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808AF84
_0808B018:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_808AF80

	thumb_func_start sub_808B020
sub_808B020: @ 808B020
	push {lr}
	ldr r2, _0808B040
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0808B044
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808B0A0
	cmp r0, 0x1
	bgt _0808B048
	cmp r0, 0
	beq _0808B052
	b _0808B0AC
	.align 2, 0
_0808B040: .4byte gPaletteFade
_0808B044: .4byte gUnknown_02038561
_0808B048:
	cmp r0, 0x3
	beq _0808B0A0
	cmp r0, 0x4
	beq _0808B08C
	b _0808B0AC
_0808B052:
	ldr r0, _0808B070
	ldrh r0, [r0]
	bl CheckIfItemIsTMHMOrEvolutionStone
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B078
	ldr r2, _0808B074
	movs r0, 0
	movs r1, 0
	movs r3, 0x14
	bl sub_806AF4C
	b _0808B0AC
	.align 2, 0
_0808B070: .4byte word_203855E
_0808B074: .4byte sub_808B0C0
_0808B078:
	ldr r2, _0808B088
	movs r0, 0
	movs r1, 0
	movs r3, 0x3
	bl sub_806AF4C
	b _0808B0AC
	.align 2, 0
_0808B088: .4byte sub_808B0C0
_0808B08C:
	ldr r2, _0808B09C
	movs r0, 0
	movs r1, 0
	movs r3, 0xFF
	bl sub_806AF4C
	b _0808B0AC
	.align 2, 0
_0808B09C: .4byte sub_808B1EC
_0808B0A0:
	ldr r2, _0808B0B8
	movs r0, 0
	movs r1, 0
	movs r3, 0x4
	bl sub_806AF4C
_0808B0AC:
	ldr r0, _0808B0BC
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0808B0B8: .4byte sub_808B0C0
_0808B0BC: .4byte sub_808AF80
	thumb_func_end sub_808B020

	thumb_func_start sub_808B0C0
sub_808B0C0: @ 808B0C0
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B0EC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0808B1CE
	adds r0, r4, 0
	bl sub_806BD80
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _0808B0F0
	cmp r0, 0x2
	beq _0808B184
	b _0808B1CE
	.align 2, 0
_0808B0EC: .4byte gPaletteFade
_0808B0F0:
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _0808B118
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808B11C
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _0808B120
	movs r0, 0x20
	bl PlaySE
	b _0808B1CE
	.align 2, 0
_0808B118: .4byte gUnknown_03005CE0
_0808B11C: .4byte gPlayerParty
_0808B120:
	bl sub_806D5A4
	ldr r5, _0808B16C
	ldrb r0, [r5]
	cmp r0, 0
	bne _0808B13C
	ldr r3, _0808B170
	ldr r0, _0808B174
	ldrh r1, [r0]
	ldr r2, _0808B178
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
_0808B13C:
	ldrb r0, [r5]
	cmp r0, 0x1
	bne _0808B154
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808B174
	ldrh r1, [r0]
	ldr r2, _0808B17C
	adds r0, r4, 0
	bl sub_806E964
_0808B154:
	ldrb r0, [r5]
	cmp r0, 0x3
	bne _0808B1CE
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0808B180
	adds r0, r4, 0
	bl sub_806EC44
	b _0808B1CE
	.align 2, 0
_0808B16C: .4byte gUnknown_02038561
_0808B170: .4byte gUnknown_03004AE4
_0808B174: .4byte word_203855E
_0808B178: .4byte sub_808B224
_0808B17C: .4byte sub_808B2EC
_0808B180: .4byte sub_808B2B4
_0808B184:
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _0808B1D8
	strb r0, [r1]
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r2, _0808B1DC
	ldrb r0, [r2]
	cmp r0, 0x1
	bhi _0808B1BA
	ldr r0, _0808B1E0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808B1E4
	str r0, [r1]
_0808B1BA:
	ldrb r0, [r2]
	cmp r0, 0x3
	bne _0808B1CE
	ldr r0, _0808B1E0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808B1E8
	str r0, [r1]
_0808B1CE:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808B1D8: .4byte gUnknown_03005CE0
_0808B1DC: .4byte gUnknown_02038561
_0808B1E0: .4byte gTasks
_0808B1E4: .4byte sub_808B25C
_0808B1E8: .4byte sub_808B2B4
	thumb_func_end sub_808B0C0

	thumb_func_start sub_808B1EC
sub_808B1EC: @ 808B1EC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B214
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808B20E
	ldr r3, _0808B218
	ldr r0, _0808B21C
	ldrh r1, [r0]
	ldr r2, _0808B220
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
_0808B20E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B214: .4byte gPaletteFade
_0808B218: .4byte gUnknown_03004AE4
_0808B21C: .4byte word_203855E
_0808B220: .4byte sub_808B224
	thumb_func_end sub_808B1EC

	thumb_func_start sub_808B224
sub_808B224: @ 808B224
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
	ldr r1, _0808B254
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808B258
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B254: .4byte gTasks
_0808B258: .4byte sub_808B25C
	thumb_func_end sub_808B224

	thumb_func_start sub_808B25C
sub_808B25C: @ 808B25C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B280
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808B27A
	ldr r0, _0808B284
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0808B27A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B280: .4byte gPaletteFade
_0808B284: .4byte sub_80A5B40
	thumb_func_end sub_808B25C

	thumb_func_start sub_808B288
sub_808B288: @ 808B288
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B2AC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808B2A6
	ldr r0, _0808B2B0
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0808B2A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B2AC: .4byte gPaletteFade
_0808B2B0: .4byte sub_813B6F8
	thumb_func_end sub_808B288

	thumb_func_start sub_808B2B4
sub_808B2B4: @ 808B2B4
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
	ldr r1, _0808B2E4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808B2E8
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B2E4: .4byte gTasks
_0808B2E8: .4byte sub_808B288
	thumb_func_end sub_808B2B4

	thumb_func_start sub_808B2EC
sub_808B2EC: @ 808B2EC
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B31C
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0808B328
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0808B320
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808B324
	str r1, [r0]
	b _0808B32E
	.align 2, 0
_0808B31C: .4byte gUnknown_0202E8F4
_0808B320: .4byte gTasks
_0808B324: .4byte sub_808B338
_0808B328:
	adds r0, r4, 0
	bl sub_808B224
_0808B32E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_808B2EC

	thumb_func_start sub_808B338
sub_808B338: @ 808B338
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0808B38C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808B384
	adds r0, r5, 0
	bl sub_806CA38
	ldr r1, _0808B390
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808B394
	adds r0, r1
	movs r1, 0x40
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl DestroyTask
	lsls r1, r4, 3
	adds r1, r4
	lsls r1, 2
	ldr r0, _0808B398
	adds r1, r0
	ldr r2, _0808B39C
	movs r0, 0x4
	movs r3, 0x3
	bl sub_80E62A0
_0808B384:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808B38C: .4byte gPaletteFade
_0808B390: .4byte gUnknown_03005CE0
_0808B394: .4byte gPlayerParty
_0808B398: .4byte gSaveBlock1 + 0x2B4C
_0808B39C: .4byte sub_808B3EC
	thumb_func_end sub_808B338

	thumb_func_start sub_808B3A0
sub_808B3A0: @ 808B3A0
	push {r4,lr}
	ldr r4, _0808B3A8
	b _0808B3B8
	.align 2, 0
_0808B3A8: .4byte 0x0201b260
_0808B3AC:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808B3DC
_0808B3B8:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B3AC
	ldrb r0, [r4]
	ldr r1, _0808B3E4
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808B3E8
	bl SetMainCallback2
_0808B3DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B3E4: .4byte gUnknown_03005CE0
_0808B3E8: .4byte sub_806AEDC
	thumb_func_end sub_808B3A0

	thumb_func_start sub_808B3EC
sub_808B3EC: @ 808B3EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _0808B464
	mov r8, r0
	ldrb r0, [r0, 0x8]
	movs r1, 0x80
	orrs r0, r1
	mov r1, r8
	strb r0, [r1, 0x8]
	ldr r0, _0808B468
	ldrh r0, [r0]
	cmp r0, 0
	bne _0808B480
	ldr r7, _0808B46C
	ldrh r0, [r7]
	cmp r0, 0
	beq _0808B416
	movs r1, 0x1
	bl sub_80A9538
_0808B416:
	ldr r6, _0808B470
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _0808B474
	adds r0, r4
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_80A9424
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	bl sub_80A2DF8
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0xC
	adds r2, r7, 0
	bl SetMonData
	ldr r0, _0808B478
	movs r1, 0x5
	bl CreateTask
	mov r0, r8
	ldrb r1, [r0, 0x8]
	movs r0, 0x7F
	ands r0, r1
	mov r1, r8
	strb r0, [r1, 0x8]
	ldr r0, _0808B47C
	b _0808B48E
	.align 2, 0
_0808B464: .4byte gPaletteFade
_0808B468: .4byte gScriptResult
_0808B46C: .4byte gUnknown_0202E8F8
_0808B470: .4byte gUnknown_03005CE0
_0808B474: .4byte gPlayerParty
_0808B478: .4byte sub_808B25C
_0808B47C: .4byte sub_806AEDC
_0808B480:
	ldr r2, _0808B49C
	movs r0, 0
	movs r1, 0
	movs r3, 0xFF
	bl sub_806AF4C
	ldr r0, _0808B4A0
_0808B48E:
	bl SetMainCallback2
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B49C: .4byte sub_808B4A4
_0808B4A0: .4byte sub_808B3A0
	thumb_func_end sub_808B3EC

	thumb_func_start sub_808B4A4
sub_808B4A4: @ 808B4A4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B4D8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808B4D2
	ldr r0, _0808B4DC
	ldrb r0, [r0]
	ldr r1, _0808B4E0
	ldrh r1, [r1]
	movs r2, 0x1
	bl sub_806EBF0
	ldr r1, _0808B4E4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808B4E8
	str r1, [r0]
_0808B4D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B4D8: .4byte gPaletteFade
_0808B4DC: .4byte gUnknown_03005CE0
_0808B4E0: .4byte word_203855E
_0808B4E4: .4byte gTasks
_0808B4E8: .4byte sub_808B4EC
	thumb_func_end sub_808B4A4

	thumb_func_start sub_808B4EC
sub_808B4EC: @ 808B4EC
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _0808B504
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808B500
	adds r0, r1, 0
	bl sub_808B224
_0808B500:
	pop {r0}
	bx r0
	.align 2, 0
_0808B504: .4byte gUnknown_0202E8F6
	thumb_func_end sub_808B4EC

	thumb_func_start sub_808B508
sub_808B508: @ 808B508
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_808B224
	pop {r0}
	bx r0
	thumb_func_end sub_808B508

	thumb_func_start sub_808B518
sub_808B518: @ 808B518
	push {r4,lr}
	ldr r4, _0808B520
	b _0808B530
	.align 2, 0
_0808B520: .4byte 0x0201b260
_0808B524:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808B554
_0808B530:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B524
	ldrb r0, [r4]
	ldr r1, _0808B55C
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808B560
	bl SetMainCallback2
_0808B554:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B55C: .4byte gUnknown_020384F0
_0808B560: .4byte sub_806AEDC
	thumb_func_end sub_808B518

	thumb_func_start sub_808B564
sub_808B564: @ 808B564
	push {lr}
	ldr r2, _0808B58C
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	bl sub_809FA30
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _0808B594
	ldr r2, _0808B590
	movs r0, 0
	movs r1, 0
	movs r3, 0xFF
	bl sub_806AF4C
	b _0808B5A0
	.align 2, 0
_0808B58C: .4byte gPaletteFade
_0808B590: .4byte sub_806F490
_0808B594:
	ldr r2, _0808B5AC
	movs r0, 0
	movs r1, 0
	movs r3, 0xFF
	bl sub_806AF4C
_0808B5A0:
	ldr r0, _0808B5B0
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0808B5AC: .4byte sub_806F588
_0808B5B0: .4byte sub_808B518
	thumb_func_end sub_808B564

	thumb_func_start sub_808B5B4
sub_808B5B4: @ 808B5B4
	push {lr}
	ldr r3, _0808B5D8
	ldr r2, _0808B5DC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, [r1]
	str r2, [r3]
	ldr r2, _0808B5E0
	str r2, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0808B5D8: .4byte gUnknown_03005CF0
_0808B5DC: .4byte gTasks
_0808B5E0: .4byte sub_808B5E4
	thumb_func_end sub_808B5B4

	thumb_func_start sub_808B5E4
sub_808B5E4: @ 808B5E4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8055870
	cmp r0, 0x1
	beq _0808B602
	ldr r1, _0808B608
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808B60C
	ldr r1, [r1]
	str r1, [r0]
_0808B602:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B608: .4byte gTasks
_0808B60C: .4byte gUnknown_03005CF0
	thumb_func_end sub_808B5E4

	thumb_func_start sub_808B610
sub_808B610: @ 808B610
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_808B610

	thumb_func_start sub_808B628
sub_808B628: @ 808B628
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_808B628

	thumb_func_start CB2_InitOptionMenu
CB2_InitOptionMenu: @ 808B63C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r0, _0808B65C
	ldr r1, _0808B660
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x9
	bhi _0808B690
	lsls r0, 2
	ldr r1, _0808B664
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808B65C: .4byte gMain
_0808B660: .4byte 0x0000043c
_0808B664: .4byte _0808B668
	.align 2, 0
_0808B668:
	.4byte _0808B690
	.4byte _0808B758
	.4byte _0808B76A
	.4byte _0808B784
	.4byte _0808B790
	.4byte _0808B7AC
	.4byte _0808B7D0
	.4byte _0808B7F0
	.4byte _0808B874
	.4byte _0808B9AC
_0808B690:
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0xC
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x10
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
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r2, sp, 0x8
	mov r8, r2
	add r2, sp, 0x4
	movs r6, 0
	ldr r1, _0808B748
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _0808B74C
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_0808B6E0:
	strh r6, [r2]
	add r0, sp, 0x4
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _0808B6E0
	strh r6, [r2]
	add r2, sp, 0x4
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
	str r4, [sp, 0x8]
	ldr r2, _0808B748
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
	add r0, sp, 0x4
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r1, _0808B750
	ldr r2, _0808B754
	adds r1, r2
	b _0808B962
	.align 2, 0
_0808B748: .4byte 0x040000d4
_0808B74C: .4byte 0x81000800
_0808B750: .4byte gMain
_0808B754: .4byte 0x0000043c
_0808B758:
	bl ResetPaletteFade
	bl remove_some_task
	bl ResetTasks
	bl ResetSpriteData
	b _0808B95C
_0808B76A:
	ldr r0, _0808B778
	bl SetUpWindowConfig
	ldr r1, _0808B77C
	ldr r2, _0808B780
	adds r1, r2
	b _0808B962
	.align 2, 0
_0808B778: .4byte gWindowConfig_81E71B4
_0808B77C: .4byte gMain
_0808B780: .4byte 0x0000043c
_0808B784:
	ldr r0, _0808B78C
	bl MultistepInitMenuWindowBegin
	b _0808B95C
	.align 2, 0
_0808B78C: .4byte gWindowConfig_81E71B4
_0808B790:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _0808B79A
	b _0808B9B2
_0808B79A:
	ldr r1, _0808B7A4
	ldr r2, _0808B7A8
	adds r1, r2
	b _0808B962
	.align 2, 0
_0808B7A4: .4byte gMain
_0808B7A8: .4byte 0x0000043c
_0808B7AC:
	ldr r0, _0808B7C4
	movs r1, 0x80
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _0808B7C8
	ldr r1, _0808B7CC
	movs r2, 0x20
	bl CpuSet
	b _0808B95C
	.align 2, 0
_0808B7C4: .4byte gUnknown_0839F5FC
_0808B7C8: .4byte gUnknown_0839F63C
_0808B7CC: .4byte 0x0600bee0
_0808B7D0:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _0808B7E8
	ldr r2, _0808B7EC
	adds r1, r2
	b _0808B962
	.align 2, 0
_0808B7E8: .4byte gMain
_0808B7EC: .4byte 0x0000043c
_0808B7F0:
	ldr r0, _0808B850
	movs r4, 0
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	subs r0, 0x2
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	ldr r1, _0808B854
	ldr r2, _0808B858
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x31
	strh r0, [r1]
	adds r1, 0x6
	movs r0, 0xE1
	strh r0, [r1]
	ldr r0, _0808B85C
	strh r4, [r0]
	adds r1, 0x4
	movs r0, 0x7
	strh r0, [r1]
	ldr r3, _0808B860
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _0808B864
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _0808B868
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0808B86C
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _0808B870
	adds r0, r2, 0
	strh r0, [r1]
	b _0808B95C
	.align 2, 0
_0808B850: .4byte REG_WIN0H
_0808B854: .4byte REG_WININ
_0808B858: .4byte 0x00001111
_0808B85C: .4byte REG_BLDALPHA
_0808B860: .4byte 0x04000208
_0808B864: .4byte 0x04000200
_0808B868: .4byte REG_DISPSTAT
_0808B86C: .4byte sub_808B628
_0808B870: .4byte 0x00007140
_0808B874:
	ldr r0, _0808B96C
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0808B970
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r1, _0808B974
	ldrb r0, [r1, 0x14]
	lsls r0, 29
	lsrs r0, 29
	strh r0, [r4, 0xA]
	ldrb r0, [r1, 0x15]
	lsls r0, 29
	lsrs r0, 31
	strh r0, [r4, 0xC]
	ldrb r0, [r1, 0x15]
	lsls r0, 30
	lsrs r0, 31
	strh r0, [r4, 0xE]
	ldrb r0, [r1, 0x15]
	lsls r0, 31
	lsrs r0, 31
	strh r0, [r4, 0x10]
	ldrb r0, [r1, 0x13]
	strh r0, [r4, 0x12]
	ldrb r0, [r1, 0x14]
	lsrs r0, 3
	strh r0, [r4, 0x14]
	movs r0, 0x2
	movs r1, 0
	movs r2, 0x1B
	movs r3, 0x3
	bl MenuDrawTextWindow
	movs r0, 0x2
	movs r1, 0x4
	movs r2, 0x1B
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _0808B978
	movs r1, 0x4
	movs r2, 0x1
	bl MenuPrint
	ldr r0, _0808B97C
	movs r1, 0x4
	movs r2, 0x5
	bl MenuPrint
	ldr r0, _0808B980
	movs r1, 0x4
	movs r2, 0x7
	bl MenuPrint
	ldr r0, _0808B984
	movs r1, 0x4
	movs r2, 0x9
	bl MenuPrint
	ldr r0, _0808B988
	movs r1, 0x4
	movs r2, 0xB
	bl MenuPrint
	ldr r0, _0808B98C
	movs r1, 0x4
	movs r2, 0xD
	bl MenuPrint
	ldr r0, _0808B990
	movs r1, 0x4
	movs r2, 0xF
	bl MenuPrint
	ldr r0, _0808B994
	movs r1, 0x4
	movs r2, 0x11
	bl MenuPrint
	ldrb r0, [r4, 0xA]
	bl sub_808BCF8
	ldrb r0, [r4, 0xC]
	bl sub_808BD6C
	ldrb r0, [r4, 0xE]
	bl sub_808BDCC
	ldrb r0, [r4, 0x10]
	bl sub_808BE34
	ldrb r0, [r4, 0x12]
	bl sub_808BFD8
	ldrb r0, [r4, 0x14]
	bl sub_808BECC
	ldr r1, _0808B998
	ldr r2, _0808B99C
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _0808B9A0
	adds r0, r2, 0
	strh r0, [r1]
	ldrb r0, [r4, 0x8]
	bl sub_808BC3C
_0808B95C:
	ldr r1, _0808B9A4
	ldr r0, _0808B9A8
	adds r1, r0
_0808B962:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0808B9B2
	.align 2, 0
_0808B96C: .4byte sub_808B9C4
_0808B970: .4byte gTasks
_0808B974: .4byte gSaveBlock2
_0808B978: .4byte gSystemText_OptionMenu
_0808B97C: .4byte gSystemText_TextSpeed
_0808B980: .4byte gSystemText_BattleScene
_0808B984: .4byte gSystemText_BattleStyle
_0808B988: .4byte gSystemText_Sound
_0808B98C: .4byte gSystemText_ButtonMode
_0808B990: .4byte gSystemText_Frame
_0808B994: .4byte gSystemText_Cancel
_0808B998: .4byte REG_WIN0H
_0808B99C: .4byte 0x000011df
_0808B9A0: .4byte 0x0000011f
_0808B9A4: .4byte gMain
_0808B9A8: .4byte 0x0000043c
_0808B9AC:
	ldr r0, _0808B9C0
	bl SetMainCallback2
_0808B9B2:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B9C0: .4byte sub_808B610
	thumb_func_end CB2_InitOptionMenu

	thumb_func_start sub_808B9C4
sub_808B9C4: @ 808B9C4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0808B9E8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808B9E4
	ldr r0, _0808B9EC
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808B9F0
	str r0, [r1]
_0808B9E4:
	pop {r0}
	bx r0
	.align 2, 0
_0808B9E8: .4byte gPaletteFade
_0808B9EC: .4byte gTasks
_0808B9F0: .4byte sub_808B9F4
	thumb_func_end sub_808B9C4

	thumb_func_start sub_808B9F4
sub_808B9F4: @ 808B9F4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808BA1C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0808BA24
	ldr r0, _0808BA20
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x6
	beq _0808BA1A
	b _0808BB7A
_0808BA1A:
	b _0808BA36
	.align 2, 0
_0808BA1C: .4byte gMain
_0808BA20: .4byte gTasks
_0808BA24:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0808BA44
	ldr r0, _0808BA3C
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
_0808BA36:
	ldr r0, _0808BA40
	str r0, [r1]
	b _0808BB7A
	.align 2, 0
_0808BA3C: .4byte gTasks
_0808BA40: .4byte sub_808BB80
_0808BA44:
	movs r0, 0x40
	ands r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0
	beq _0808BA74
	ldr r1, _0808BA6C
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r1
	ldrh r5, [r3, 0x8]
	movs r6, 0x8
	ldrsh r0, [r3, r6]
	adds r7, r1, 0
	cmp r0, 0
	ble _0808BA70
	subs r0, r5, 0x1
	b _0808BA94
	.align 2, 0
_0808BA6C: .4byte gTasks
_0808BA70:
	movs r0, 0x6
	b _0808BA94
_0808BA74:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0808BAAC
	ldr r1, _0808BA98
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r1
	ldrh r5, [r3, 0x8]
	movs r7, 0x8
	ldrsh r0, [r3, r7]
	adds r7, r1, 0
	cmp r0, 0x5
	bgt _0808BA9C
	adds r0, r5, 0x1
_0808BA94:
	strh r0, [r3, 0x8]
	b _0808BA9E
	.align 2, 0
_0808BA98: .4byte gTasks
_0808BA9C:
	strh r6, [r3, 0x8]
_0808BA9E:
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r7
	ldrb r0, [r0, 0x8]
	bl sub_808BC3C
	b _0808BB7A
_0808BAAC:
	ldr r0, _0808BACC
	lsls r2, r4, 2
	adds r1, r2, r4
	lsls r1, 3
	adds r1, r0
	movs r3, 0x8
	ldrsh r1, [r1, r3]
	adds r7, r0, 0
	cmp r1, 0x5
	bhi _0808BB7A
	lsls r0, r1, 2
	ldr r1, _0808BAD0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808BACC: .4byte gTasks
_0808BAD0: .4byte _0808BAD4
	.align 2, 0
_0808BAD4:
	.4byte _0808BAEC
	.4byte _0808BB04
	.4byte _0808BB1C
	.4byte _0808BB34
	.4byte _0808BB4C
	.4byte _0808BB64
_0808BAEC:
	adds r4, r2, r4
	lsls r4, 3
	adds r4, r7
	ldrb r0, [r4, 0xA]
	bl sub_808BCB4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	bl sub_808BCF8
	b _0808BB7A
_0808BB04:
	adds r4, r2, r4
	lsls r4, 3
	adds r4, r7
	ldrb r0, [r4, 0xC]
	bl sub_808BD4C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xC]
	bl sub_808BD6C
	b _0808BB7A
_0808BB1C:
	adds r4, r2, r4
	lsls r4, 3
	adds r4, r7
	ldrb r0, [r4, 0xE]
	bl sub_808BDAC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xE]
	bl sub_808BDCC
	b _0808BB7A
_0808BB34:
	adds r4, r2, r4
	lsls r4, 3
	adds r4, r7
	ldrb r0, [r4, 0x10]
	bl sub_808BE0C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x10]
	bl sub_808BE34
	b _0808BB7A
_0808BB4C:
	adds r4, r2, r4
	lsls r4, 3
	adds r4, r7
	ldrb r0, [r4, 0x12]
	bl sub_808BF94
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x12]
	bl sub_808BFD8
	b _0808BB7A
_0808BB64:
	adds r4, r2, r4
	lsls r4, 3
	adds r4, r7
	ldrb r0, [r4, 0x14]
	bl sub_808BE74
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x14]
	bl sub_808BECC
_0808BB7A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_808B9F4

	thumb_func_start sub_808BB80
sub_808BB80: @ 808BB80
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0808BC04
	ldr r1, _0808BC08
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r1, 0x7
	ldrb r0, [r4, 0xA]
	ands r0, r1
	ldrb r1, [r5, 0x14]
	movs r3, 0x8
	negs r3, r3
	ands r3, r1
	orrs r3, r0
	strb r3, [r5, 0x14]
	movs r6, 0x1
	ldrb r0, [r4, 0xC]
	ands r0, r6
	lsls r0, 2
	ldrb r1, [r5, 0x15]
	movs r2, 0x5
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r5, 0x15]
	ldrb r1, [r4, 0xE]
	ands r1, r6
	lsls r1, 1
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x15]
	ldrb r1, [r4, 0x10]
	ands r1, r6
	movs r2, 0x2
	negs r2, r2
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x15]
	ldrh r0, [r4, 0x12]
	movs r2, 0
	strb r0, [r5, 0x13]
	ldrb r0, [r4, 0x14]
	lsls r0, 3
	movs r1, 0x7
	ands r3, r1
	orrs r3, r0
	strb r3, [r5, 0x14]
	movs r0, 0x1
	negs r0, r0
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0808BC0C
	str r0, [r4]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808BC04: .4byte gSaveBlock2
_0808BC08: .4byte gTasks
_0808BC0C: .4byte sub_808BC10
	thumb_func_end sub_808BB80

	thumb_func_start sub_808BC10
sub_808BC10: @ 808BC10
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0808BC34
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808BC30
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _0808BC38
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_0808BC30:
	pop {r0}
	bx r0
	.align 2, 0
_0808BC34: .4byte gPaletteFade
_0808BC38: .4byte gMain
	thumb_func_end sub_808BC10

	thumb_func_start sub_808BC3C
sub_808BC3C: @ 808BC3C
	lsls r0, 24
	ldr r2, _0808BC58
	ldr r3, _0808BC5C
	adds r1, r3, 0
	strh r1, [r2]
	adds r2, 0x4
	lsrs r0, 20
	adds r1, r0, 0
	adds r1, 0x28
	lsls r1, 8
	adds r0, 0x38
	adds r1, r0
	strh r1, [r2]
	bx lr
	.align 2, 0
_0808BC58: .4byte REG_WIN1H
_0808BC5C: .4byte 0x000018d7
	thumb_func_end sub_808BC3C

	thumb_func_start sub_808BC60
sub_808BC60: @ 808BC60
	push {r4-r7,lr}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r2, 0
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _0808BC96
_0808BC7C:
	mov r7, sp
	adds r0, r7, r2
	strb r1, [r0]
	adds r4, 0x1
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _0808BC96
	cmp r2, 0xE
	bls _0808BC7C
_0808BC96:
	mov r0, sp
	strb r3, [r0, 0x2]
	adds r1, r0, r2
	movs r0, 0xFF
	strb r0, [r1]
	mov r0, sp
	adds r1, r6, 0
	adds r2, r5, 0
	movs r3, 0x1
	bl sub_80729D8
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_808BC60

	thumb_func_start sub_808BCB4
sub_808BCB4: @ 808BCB4
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _0808BCD4
	ldrh r1, [r2, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0808BCDA
	cmp r3, 0x1
	bhi _0808BCD8
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	b _0808BCDA
	.align 2, 0
_0808BCD4: .4byte gMain
_0808BCD8:
	movs r3, 0
_0808BCDA:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0808BCF2
	cmp r3, 0
	beq _0808BCF0
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	b _0808BCF2
_0808BCF0:
	movs r3, 0x2
_0808BCF2:
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end sub_808BCB4

	thumb_func_start sub_808BCF8
sub_808BCF8: @ 808BCF8
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	movs r2, 0xF
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	adds r1, r0
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _0808BD40
	mov r1, sp
	ldrb r3, [r1]
	movs r1, 0x78
	movs r2, 0x28
	bl sub_808BC60
	ldr r0, _0808BD44
	mov r1, sp
	ldrb r3, [r1, 0x1]
	movs r1, 0x9B
	movs r2, 0x28
	bl sub_808BC60
	ldr r0, _0808BD48
	mov r1, sp
	ldrb r3, [r1, 0x2]
	movs r1, 0xB8
	movs r2, 0x28
	bl sub_808BC60
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0808BD40: .4byte gSystemText_Slow
_0808BD44: .4byte gSystemText_Mid
_0808BD48: .4byte gSystemText_Fast
	thumb_func_end sub_808BCF8

	thumb_func_start sub_808BD4C
sub_808BD4C: @ 808BD4C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0808BD68
	ldrh r1, [r0, 0x2E]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _0808BD62
	movs r0, 0x1
	eors r2, r0
_0808BD62:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_0808BD68: .4byte gMain
	thumb_func_end sub_808BD4C

	thumb_func_start sub_808BD6C
sub_808BD6C: @ 808BD6C
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	movs r2, 0xF
	strb r2, [r1]
	strb r2, [r1, 0x1]
	adds r1, r0
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _0808BDA4
	mov r1, sp
	ldrb r3, [r1]
	movs r1, 0x78
	movs r2, 0x38
	bl sub_808BC60
	ldr r0, _0808BDA8
	mov r1, sp
	ldrb r3, [r1, 0x1]
	movs r1, 0xBE
	movs r2, 0x38
	bl sub_808BC60
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0808BDA4: .4byte gSystemText_On
_0808BDA8: .4byte gSystemText_Off
	thumb_func_end sub_808BD6C

	thumb_func_start sub_808BDAC
sub_808BDAC: @ 808BDAC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0808BDC8
	ldrh r1, [r0, 0x2E]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _0808BDC2
	movs r0, 0x1
	eors r2, r0
_0808BDC2:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_0808BDC8: .4byte gMain
	thumb_func_end sub_808BDAC

	thumb_func_start sub_808BDCC
sub_808BDCC: @ 808BDCC
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	movs r2, 0xF
	strb r2, [r1]
	strb r2, [r1, 0x1]
	adds r1, r0
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _0808BE04
	mov r1, sp
	ldrb r3, [r1]
	movs r1, 0x78
	movs r2, 0x48
	bl sub_808BC60
	ldr r0, _0808BE08
	mov r1, sp
	ldrb r3, [r1, 0x1]
	movs r1, 0xBE
	movs r2, 0x48
	bl sub_808BC60
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0808BE04: .4byte gSystemText_Shift
_0808BE08: .4byte gSystemText_Set
	thumb_func_end sub_808BDCC

	thumb_func_start sub_808BE0C
sub_808BE0C: @ 808BE0C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808BE30
	ldrh r1, [r0, 0x2E]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _0808BE28
	movs r0, 0x1
	eors r4, r0
	adds r0, r4, 0
	bl SetPokemonCryStereo
_0808BE28:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808BE30: .4byte gMain
	thumb_func_end sub_808BE0C

	thumb_func_start sub_808BE34
sub_808BE34: @ 808BE34
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	movs r2, 0xF
	strb r2, [r1]
	strb r2, [r1, 0x1]
	adds r1, r0
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _0808BE6C
	mov r1, sp
	ldrb r3, [r1]
	movs r1, 0x78
	movs r2, 0x58
	bl sub_808BC60
	ldr r0, _0808BE70
	mov r1, sp
	ldrb r3, [r1, 0x1]
	movs r1, 0xAC
	movs r2, 0x58
	bl sub_808BC60
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0808BE6C: .4byte gSystemText_Mono
_0808BE70: .4byte gSystemText_Stereo
	thumb_func_end sub_808BE34

	thumb_func_start sub_808BE74
sub_808BE74: @ 808BE74
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808BE94
	ldrh r1, [r0, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0808BEA0
	cmp r4, 0x12
	bhi _0808BE98
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	b _0808BE9A
	.align 2, 0
_0808BE94: .4byte gMain
_0808BE98:
	movs r4, 0
_0808BE9A:
	adds r0, r4, 0
	bl MenuLoadTextWindowGraphics_OverrideFrameType
_0808BEA0:
	ldr r0, _0808BEB8
	ldrh r1, [r0, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0808BEC4
	cmp r4, 0
	beq _0808BEBC
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	b _0808BEBE
	.align 2, 0
_0808BEB8: .4byte gMain
_0808BEBC:
	movs r4, 0x13
_0808BEBE:
	adds r0, r4, 0
	bl MenuLoadTextWindowGraphics_OverrideFrameType
_0808BEC4:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_808BE74

	thumb_func_start sub_808BECC
sub_808BECC: @ 808BECC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r7, r0, 24
	movs r5, 0
	ldr r1, _0808BF40
	ldrb r0, [r1]
	ldr r2, _0808BF44
	mov r8, r2
	cmp r0, 0xFF
	beq _0808BF0A
	adds r2, r1, 0
_0808BEEE:
	mov r0, sp
	adds r1, r0, r5
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _0808BF0A
	cmp r5, 0x5
	bls _0808BEEE
_0808BF0A:
	adds r0, r7, 0
	movs r1, 0xA
	bl __udivsi3
	adds r2, r0, 0
	lsls r0, r2, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _0808BF48
	mov r0, sp
	adds r1, r0, r5
	adds r0, r2, 0
	adds r0, 0xA1
	strb r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	mov r1, sp
	adds r4, r1, r5
	adds r0, r7, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r4]
	b _0808BF64
	.align 2, 0
_0808BF40: .4byte gSystemText_Terminator
_0808BF44: .4byte gSystemText_Type
_0808BF48:
	mov r2, sp
	adds r4, r2, r5
	adds r0, r7, 0
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	mov r1, sp
	adds r0, r1, r5
	strb r6, [r0]
_0808BF64:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	mov r2, sp
	adds r1, r2, r5
	movs r0, 0xFF
	strb r0, [r1]
	mov r0, r8
	movs r1, 0xF
	movs r2, 0xF
	bl MenuPrint
	mov r0, sp
	movs r1, 0x12
	movs r2, 0xF
	bl MenuPrint
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_808BECC

	thumb_func_start sub_808BF94
sub_808BF94: @ 808BF94
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _0808BFB4
	ldrh r1, [r2, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _0808BFBA
	cmp r3, 0x1
	bhi _0808BFB8
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	b _0808BFBA
	.align 2, 0
_0808BFB4: .4byte gMain
_0808BFB8:
	movs r3, 0
_0808BFBA:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0808BFD2
	cmp r3, 0
	beq _0808BFD0
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	b _0808BFD2
_0808BFD0:
	movs r3, 0x2
_0808BFD2:
	adds r0, r3, 0
	pop {r1}
	bx r1
	thumb_func_end sub_808BF94

	thumb_func_start sub_808BFD8
sub_808BFD8: @ 808BFD8
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	movs r2, 0xF
	strb r2, [r1]
	strb r2, [r1, 0x1]
	strb r2, [r1, 0x2]
	adds r1, r0
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _0808C020
	mov r1, sp
	ldrb r3, [r1]
	movs r1, 0x78
	movs r2, 0x68
	bl sub_808BC60
	ldr r0, _0808C024
	mov r1, sp
	ldrb r3, [r1, 0x1]
	movs r1, 0xA6
	movs r2, 0x68
	bl sub_808BC60
	ldr r0, _0808C028
	mov r1, sp
	ldrb r3, [r1, 0x2]
	movs r1, 0xBC
	movs r2, 0x68
	bl sub_808BC60
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0808C020: .4byte gSystemText_Normal
_0808C024: .4byte gSystemText_LR
_0808C028: .4byte gSystemText_LA
	thumb_func_end sub_808BFD8

	thumb_func_start sub_808C02C
sub_808C02C: @ 808C02C
	push {r4-r6,lr}
	ldr r0, _0808C088
	movs r1, 0
	strh r1, [r0]
	ldr r2, _0808C08C
	movs r0, 0x40
	strb r0, [r2]
	ldr r0, _0808C090
	strb r1, [r0]
	ldr r4, _0808C094
	movs r0, 0
	strb r1, [r4, 0x19]
	strb r1, [r4, 0x18]
	strb r1, [r4, 0x1A]
	strb r1, [r4, 0x1B]
	str r0, [r4, 0x1C]
	str r0, [r4, 0x20]
	str r0, [r4, 0x24]
	bl sub_80690C8
	movs r1, 0
	adds r6, r4, 0
	adds r6, 0x28
	movs r2, 0
	adds r5, r4, 0
	adds r5, 0x5C
	ldr r3, _0808C098
	ldr r0, _0808C09C
	adds r4, r3, r0
_0808C066:
	adds r0, r1, r6
	strb r2, [r0]
	adds r0, r1, r5
	strb r2, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, r4
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x33
	bls _0808C066
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808C088: .4byte gUnknown_0202FFB8
_0808C08C: .4byte gUnknown_0202FFBA
_0808C090: .4byte gUnknown_03005CE8
_0808C094: .4byte gSaveBlock2
_0808C098: .4byte gSaveBlock1 + 0x938
_0808C09C: .4byte 0x00003154
	thumb_func_end sub_808C02C

	.align 2, 0 @ Don't pad with nop.
