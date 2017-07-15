	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80FBCA0
sub_80FBCA0: @ 80FBCA0
	push {r4,lr}
	ldr r4, _080FBCCC @ =gUnknown_020388CC
	ldr r0, [r4]
	ldr r0, [r0, 0x1C]
	cmp r0, 0
	beq _080FBCC4
	bl DestroySprite
	ldr r0, [r4]
	adds r0, 0x58
	ldrh r0, [r0]
	bl FreeSpriteTilesByTag
	ldr r0, [r4]
	adds r0, 0x5A
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
_080FBCC4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FBCCC: .4byte gUnknown_020388CC
	thumb_func_end sub_80FBCA0

	thumb_func_start unref_sub_80FBCD0
unref_sub_80FBCD0: @ 80FBCD0
	ldr r0, _080FBCDC @ =gUnknown_020388CC
	ldr r0, [r0]
	ldr r1, [r0, 0x1C]
	movs r0, 0x1
	strh r0, [r1, 0x34]
	bx lr
	.align 2, 0
_080FBCDC: .4byte gUnknown_020388CC
	thumb_func_end unref_sub_80FBCD0

	thumb_func_start unref_sub_80FBCE0
unref_sub_80FBCE0: @ 80FBCE0
	ldr r0, _080FBCEC @ =gUnknown_020388CC
	ldr r0, [r0]
	ldr r1, [r0, 0x1C]
	movs r0, 0
	strh r0, [r1, 0x34]
	bx lr
	.align 2, 0
_080FBCEC: .4byte gUnknown_020388CC
	thumb_func_end unref_sub_80FBCE0

	thumb_func_start sub_80FBCF0
sub_80FBCF0: @ 80FBCF0
	push {r4,r5,lr}
	sub sp, 0x28
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _080FBD98 @ =gRegionMapBrendanIconTiles
	str r2, [sp, 0x18]
	movs r2, 0x80
	add r5, sp, 0x18
	lsrs r3, r0, 16
	orrs r0, r2
	str r0, [r5, 0x4]
	ldr r0, _080FBD9C @ =gRegionMapBrendanIconPalette
	str r0, [sp, 0x20]
	ldr r2, _080FBDA0 @ =0xffff0000
	add r4, sp, 0x20
	ldr r0, [r4, 0x4]
	ands r0, r2
	orrs r0, r1
	str r0, [r4, 0x4]
	mov r0, sp
	movs r2, 0
	strh r3, [r0]
	strh r1, [r0, 0x2]
	ldr r0, _080FBDA4 @ =gOamData_083E7708
	str r0, [sp, 0x4]
	ldr r0, _080FBDA8 @ =gSpriteAnimTable_083E7718
	str r0, [sp, 0x8]
	str r2, [sp, 0xC]
	ldr r0, _080FBDAC @ =gDummySpriteAffineAnimTable
	str r0, [sp, 0x10]
	ldr r0, _080FBDB0 @ =SpriteCallbackDummy
	str r0, [sp, 0x14]
	ldr r0, _080FBDB4 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0x1
	bne _080FBD42
	ldr r0, _080FBDB8 @ =gRegionMapMayIconTiles
	str r0, [sp, 0x18]
	ldr r0, _080FBDBC @ =gRegionMapMayIconPalette
	str r0, [sp, 0x20]
_080FBD42:
	adds r0, r5, 0
	bl LoadSpriteSheet
	adds r0, r4, 0
	bl LoadSpritePalette
	mov r0, sp
	movs r1, 0
	movs r2, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080FBDC0 @ =gUnknown_020388CC
	ldr r2, [r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _080FBDC4 @ =gSprites
	adds r1, r0
	str r1, [r2, 0x20]
	adds r0, r2, 0
	adds r0, 0x78
	ldrb r0, [r0]
	cmp r0, 0
	bne _080FBDCC
	adds r0, r2, 0
	adds r0, 0x74
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r1, 0x20]
	ldr r1, [r2, 0x20]
	adds r0, r2, 0
	adds r0, 0x76
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r1, 0x22]
	ldr r1, [r2, 0x20]
	ldr r0, _080FBDC8 @ =sub_80FBF34
	b _080FBDEA
	.align 2, 0
_080FBD98: .4byte gRegionMapBrendanIconTiles
_080FBD9C: .4byte gRegionMapBrendanIconPalette
_080FBDA0: .4byte 0xffff0000
_080FBDA4: .4byte gOamData_083E7708
_080FBDA8: .4byte gSpriteAnimTable_083E7718
_080FBDAC: .4byte gDummySpriteAffineAnimTable
_080FBDB0: .4byte SpriteCallbackDummy
_080FBDB4: .4byte gSaveBlock2
_080FBDB8: .4byte gRegionMapMayIconTiles
_080FBDBC: .4byte gRegionMapMayIconPalette
_080FBDC0: .4byte gUnknown_020388CC
_080FBDC4: .4byte gSprites
_080FBDC8: .4byte sub_80FBF34
_080FBDCC:
	adds r0, r2, 0
	adds r0, 0x74
	ldrh r0, [r0]
	lsls r0, 4
	subs r0, 0x30
	strh r0, [r1, 0x20]
	ldr r1, [r2, 0x20]
	adds r0, r2, 0
	adds r0, 0x76
	ldrh r0, [r0]
	lsls r0, 4
	subs r0, 0x42
	strh r0, [r1, 0x22]
	ldr r1, [r2, 0x20]
	ldr r0, _080FBDF4 @ =sub_80FBEA4
_080FBDEA:
	str r0, [r1, 0x1C]
	add sp, 0x28
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FBDF4: .4byte sub_80FBEA4
	thumb_func_end sub_80FBCF0

	thumb_func_start sub_80FBDF8
sub_80FBDF8: @ 80FBDF8
	push {lr}
	ldr r3, _080FBE1C @ =gUnknown_020388CC
	ldr r0, [r3]
	ldr r2, [r0, 0x20]
	cmp r2, 0
	beq _080FBE16
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r3]
	ldr r1, [r0, 0x20]
	ldr r0, _080FBE20 @ =SpriteCallbackDummy
	str r0, [r1, 0x1C]
_080FBE16:
	pop {r0}
	bx r0
	.align 2, 0
_080FBE1C: .4byte gUnknown_020388CC
_080FBE20: .4byte SpriteCallbackDummy
	thumb_func_end sub_80FBDF8

	thumb_func_start sub_80FBE24
sub_80FBE24: @ 80FBE24
	push {lr}
	ldr r0, _080FBE5C @ =gUnknown_020388CC
	ldr r3, [r0]
	ldr r1, [r3, 0x20]
	cmp r1, 0
	beq _080FBE9A
	adds r0, r3, 0
	adds r0, 0x78
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080FBE64
	adds r0, r3, 0
	adds r0, 0x74
	ldrh r0, [r0]
	lsls r0, 4
	subs r0, 0x30
	strh r0, [r1, 0x20]
	ldr r1, [r3, 0x20]
	adds r0, r3, 0
	adds r0, 0x76
	ldrh r0, [r0]
	lsls r0, 4
	subs r0, 0x42
	strh r0, [r1, 0x22]
	ldr r1, [r3, 0x20]
	ldr r0, _080FBE60 @ =sub_80FBEA4
	b _080FBE8C
	.align 2, 0
_080FBE5C: .4byte gUnknown_020388CC
_080FBE60: .4byte sub_80FBEA4
_080FBE64:
	adds r0, r3, 0
	adds r0, 0x74
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x4
	movs r2, 0
	strh r0, [r1, 0x20]
	ldr r1, [r3, 0x20]
	adds r0, r3, 0
	adds r0, 0x76
	ldrh r0, [r0]
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r1, 0x22]
	ldr r0, [r3, 0x20]
	strh r2, [r0, 0x24]
	ldr r0, [r3, 0x20]
	strh r2, [r0, 0x26]
	ldr r1, [r3, 0x20]
	ldr r0, _080FBEA0 @ =sub_80FBF34
_080FBE8C:
	str r0, [r1, 0x1C]
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
_080FBE9A:
	pop {r0}
	bx r0
	.align 2, 0
_080FBEA0: .4byte sub_80FBF34
	thumb_func_end sub_80FBE24

	thumb_func_start sub_80FBEA4
sub_80FBEA4: @ 80FBEA4
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _080FBF08 @ =gUnknown_020388CC
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x5C
	movs r4, 0
	ldrsh r2, [r0, r4]
	lsls r2, 1
	negs r2, r2
	strh r2, [r3, 0x24]
	adds r1, 0x5E
	movs r4, 0
	ldrsh r0, [r1, r4]
	lsls r0, 1
	negs r0, r0
	strh r0, [r3, 0x26]
	ldrh r1, [r3, 0x22]
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	strh r0, [r3, 0x2E]
	ldrh r1, [r3, 0x20]
	adds r1, r2
	adds r2, r3, 0
	adds r2, 0x28
	ldrb r2, [r2]
	lsls r2, 24
	asrs r2, 24
	adds r2, r1
	strh r2, [r3, 0x30]
	adds r0, 0x8
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xB0
	bhi _080FBF04
	lsls r0, r2, 16
	asrs r2, r0, 16
	movs r0, 0x8
	negs r0, r0
	cmp r2, r0
	blt _080FBF04
	cmp r2, 0xF8
	ble _080FBF0C
_080FBF04:
	movs r0, 0
	b _080FBF0E
	.align 2, 0
_080FBF08: .4byte gUnknown_020388CC
_080FBF0C:
	movs r0, 0x1
_080FBF0E:
	strh r0, [r3, 0x32]
	movs r1, 0x32
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	bne _080FBF20
	adds r0, r3, 0
	bl sub_80FBF40
	b _080FBF2C
_080FBF20:
	adds r0, r3, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080FBF2C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80FBEA4

	thumb_func_start sub_80FBF34
sub_80FBF34: @ 80FBF34
	push {lr}
	bl sub_80FBF40
	pop {r0}
	bx r0
	thumb_func_end sub_80FBF34

	thumb_func_start sub_80FBF40
sub_80FBF40: @ 80FBF40
	push {lr}
	adds r2, r0, 0
	ldr r0, _080FBF80 @ =gUnknown_020388CC
	ldr r0, [r0]
	adds r0, 0x7E
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FBF84
	ldrh r0, [r2, 0x3C]
	adds r0, 0x1
	strh r0, [r2, 0x3C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080FBF90
	movs r0, 0
	strh r0, [r2, 0x3C]
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080FBF90
	.align 2, 0
_080FBF80: .4byte gUnknown_020388CC
_080FBF84:
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080FBF90:
	pop {r0}
	bx r0
	thumb_func_end sub_80FBF40

	thumb_func_start sub_80FBF94
sub_80FBF94: @ 80FBF94
	push {lr}
	ldr r0, _080FBFB0 @ =gUnknown_020388CC
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x7F
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FBFAA
	adds r1, 0x7E
	movs r0, 0x1
	strb r0, [r1]
_080FBFAA:
	pop {r0}
	bx r0
	.align 2, 0
_080FBFB0: .4byte gUnknown_020388CC
	thumb_func_end sub_80FBF94

	thumb_func_start sub_80FBFB4
sub_80FBFB4: @ 80FBFB4
	push {lr}
	adds r3, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	cmp r1, 0x56
	bne _080FBFCA
	bl GetSecretBaseMapName
	b _080FBFF2
_080FBFCA:
	cmp r1, 0x57
	bhi _080FBFE4
	ldr r0, _080FBFE0 @ =gRegionMapLocations
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r1, [r1]
	adds r0, r3, 0
	bl StringCopy
	b _080FBFF2
	.align 2, 0
_080FBFE0: .4byte gRegionMapLocations
_080FBFE4:
	cmp r2, 0
	bne _080FBFEA
	movs r2, 0x12
_080FBFEA:
	adds r0, r3, 0
	movs r1, 0
	bl StringFill
_080FBFF2:
	pop {r1}
	bx r1
	thumb_func_end sub_80FBFB4

	thumb_func_start CopyMapName
CopyMapName: @ 80FBFF8
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0x56
	beq _080FC014
	cmp r1, 0x57
	bne _080FC020
	ldr r1, _080FC010 @ =gOtherText_Ferry
	bl StringCopy
	b _080FC026
	.align 2, 0
_080FC010: .4byte gOtherText_Ferry
_080FC014:
	ldr r1, _080FC01C @ =gOtherText_SecretBase
	bl StringCopy
	b _080FC026
	.align 2, 0
_080FC01C: .4byte gOtherText_SecretBase
_080FC020:
	movs r2, 0
	bl sub_80FBFB4
_080FC026:
	pop {r1}
	bx r1
	thumb_func_end CopyMapName

	thumb_func_start CopyLocationName
CopyLocationName: @ 80FC02C
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0x42
	beq _080FC03C
	bl CopyMapName
	b _080FC042
_080FC03C:
	ldr r1, _080FC048 @ =gOtherText_Hideout
	bl StringCopy
_080FC042:
	pop {r1}
	bx r1
	.align 2, 0
_080FC048: .4byte gOtherText_Hideout
	thumb_func_end CopyLocationName

	thumb_func_start sub_80FC04C
sub_80FC04C: @ 80FC04C
	push {r4,r5,lr}
	ldr r5, [sp, 0xC]
	lsls r0, 16
	ldr r4, _080FC070 @ =gRegionMapLocations
	lsrs r0, 13
	adds r0, r4
	ldrb r4, [r0]
	strh r4, [r1]
	ldrb r1, [r0, 0x1]
	strh r1, [r2]
	ldrb r1, [r0, 0x2]
	strh r1, [r3]
	ldrb r0, [r0, 0x3]
	strh r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FC070: .4byte gRegionMapLocations
	thumb_func_end sub_80FC04C

	thumb_func_start sub_80FC074
sub_80FC074: @ 80FC074
	push {r4,lr}
	ldr r0, _080FC090 @ =gMain
	ldr r1, _080FC094 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x9
	bls _080FC084
	b _080FC1F2
_080FC084:
	lsls r0, 2
	ldr r1, _080FC098 @ =_080FC09C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FC090: .4byte gMain
_080FC094: .4byte 0x0000043c
_080FC098: .4byte _080FC09C
	.align 2, 0
_080FC09C:
	.4byte _080FC0C4
	.4byte _080FC104
	.4byte _080FC110
	.4byte _080FC120
	.4byte _080FC15C
	.4byte _080FC170
	.4byte _080FC184
	.4byte _080FC1A4
	.4byte _080FC1AA
	.4byte _080FC1C4
_080FC0C4:
	movs r0, 0
	bl SetVBlankCallback
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
	adds r0, 0x4
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeSpriteTileRanges
	bl FreeAllSpritePalettes
	b _080FC1E6
_080FC104:
	ldr r0, _080FC10C @ =gWindowConfig_81E7224
	bl SetUpWindowConfig
	b _080FC1E6
	.align 2, 0
_080FC10C: .4byte gWindowConfig_81E7224
_080FC110:
	ldr r0, _080FC11C @ =gWindowConfig_81E7224
	bl InitMenuWindow
	bl MenuZeroFillScreen
	b _080FC1E6
	.align 2, 0
_080FC11C: .4byte gWindowConfig_81E7224
_080FC120:
	ldr r4, _080FC158 @ =0x02000008
	adds r0, r4, 0
	movs r1, 0
	bl sub_80FA8EC
	movs r0, 0
	movs r1, 0
	bl sub_80FBB3C
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80FBCF0
	adds r1, r4, 0
	subs r1, 0x8
	ldrh r0, [r1, 0x1C]
	strh r0, [r1, 0x6]
	movs r2, 0xA4
	lsls r2, 4
	adds r4, r2
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0xC
	bl StringFill
	bl sub_80FC254
	b _080FC1E6
	.align 2, 0
_080FC158: .4byte 0x02000008
_080FC15C:
	ldr r0, _080FC168 @ =gUnknown_083E773C
	ldr r1, _080FC16C @ =0x0600c000
	bl LZ77UnCompVram
	b _080FC1E6
	.align 2, 0
_080FC168: .4byte gUnknown_083E773C
_080FC16C: .4byte 0x0600c000
_080FC170:
	ldr r0, _080FC17C @ =gUnknown_083E7774
	ldr r1, _080FC180 @ =0x0600f000
	bl LZ77UnCompVram
	b _080FC1E6
	.align 2, 0
_080FC17C: .4byte gUnknown_083E7774
_080FC180: .4byte 0x0600f000
_080FC184:
	ldr r0, _080FC19C @ =gUnknown_083E771C
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _080FC1A0 @ =gOtherText_FlyToWhere
	movs r1, 0x1
	movs r2, 0x90
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	b _080FC1E6
	.align 2, 0
_080FC19C: .4byte gUnknown_083E771C
_080FC1A0: .4byte gOtherText_FlyToWhere
_080FC1A4:
	bl sub_80FC31C
	b _080FC1E6
_080FC1AA:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldr r0, _080FC1C0 @ =sub_80FC214
	bl SetVBlankCallback
	b _080FC1E6
	.align 2, 0
_080FC1C0: .4byte sub_80FC214
_080FC1C4:
	ldr r1, _080FC1F8 @ =REG_BLDCNT
	movs r0, 0
	strh r0, [r1]
	subs r1, 0x46
	ldr r2, _080FC1FC @ =0x00001e0d
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	ldr r2, _080FC200 @ =0x00001741
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080FC204 @ =sub_80FC5B4
	bl sub_80FC244
	ldr r0, _080FC208 @ =sub_80FC228
	bl SetMainCallback2
_080FC1E6:
	ldr r1, _080FC20C @ =gMain
	ldr r0, _080FC210 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080FC1F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC1F8: .4byte REG_BLDCNT
_080FC1FC: .4byte 0x00001e0d
_080FC200: .4byte 0x00001741
_080FC204: .4byte sub_80FC5B4
_080FC208: .4byte sub_80FC228
_080FC20C: .4byte gMain
_080FC210: .4byte 0x0000043c
	thumb_func_end sub_80FC074

	thumb_func_start sub_80FC214
sub_80FC214: @ 80FC214
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80FC214

	thumb_func_start sub_80FC228
sub_80FC228: @ 80FC228
	push {lr}
	ldr r0, _080FC240 @ =0x02000000
	ldr r0, [r0]
	bl _call_via_r0
	bl AnimateSprites
	bl BuildOamBuffer
	pop {r0}
	bx r0
	.align 2, 0
_080FC240: .4byte 0x02000000
	thumb_func_end sub_80FC228

	thumb_func_start sub_80FC244
sub_80FC244: @ 80FC244
	ldr r1, _080FC250 @ =0x02000000
	str r0, [r1]
	movs r0, 0
	strh r0, [r1, 0x4]
	bx lr
	.align 2, 0
_080FC250: .4byte 0x02000000
	thumb_func_end sub_80FC244

	thumb_func_start sub_80FC254
sub_80FC254: @ 80FC254
	push {r4,r5,lr}
	ldr r4, _080FC2AC @ =0x02000000
	ldrb r0, [r4, 0x1E]
	cmp r0, 0x2
	beq _080FC262
	cmp r0, 0x4
	bne _080FC2EC
_080FC262:
	movs r1, 0
	ldr r2, _080FC2B0 @ =gUnknown_083E79C0
	adds r5, r4, 0
_080FC268:
	lsls r0, r1, 3
	adds r4, r0, r2
	ldrh r0, [r5, 0x1C]
	ldrh r3, [r4, 0x4]
	cmp r0, r3
	bne _080FC2B4
	ldrh r0, [r4, 0x6]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080FC2BE
	movs r0, 0x10
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	adds r0, r5, 0
	adds r0, 0x8
	movs r1, 0x11
	movs r2, 0xF
	bl MenuPrint
	ldrb r0, [r5, 0x1F]
	ldr r1, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x1D
	movs r2, 0x11
	bl MenuPrint_RightAligned
	b _080FC310
	.align 2, 0
_080FC2AC: .4byte 0x02000000
_080FC2B0: .4byte gUnknown_083E79C0
_080FC2B4:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _080FC268
_080FC2BE:
	movs r0, 0
	cmp r0, 0
	bne _080FC310
	movs r0, 0x10
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _080FC2E8 @ =0x02000008
	movs r1, 0x11
	movs r2, 0x11
	bl MenuPrint
	movs r0, 0x10
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0xF
	bl MenuZeroFillWindowRect
	b _080FC310
	.align 2, 0
_080FC2E8: .4byte 0x02000008
_080FC2EC:
	movs r0, 0x10
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r1, _080FC318 @ =0x00000a48
	adds r0, r4, r1
	movs r1, 0x11
	movs r2, 0x11
	bl MenuPrint
	movs r0, 0x10
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0xF
	bl MenuZeroFillWindowRect
_080FC310:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FC318: .4byte 0x00000a48
	thumb_func_end sub_80FC254

	thumb_func_start sub_80FC31C
sub_80FC31C: @ 80FC31C
	push {r4,lr}
	sub sp, 0x8
	ldr r0, _080FC360 @ =gUnknown_083E784C
	ldr r4, _080FC364 @ =0x02000888
	adds r1, r4, 0
	bl LZ77UnCompWram
	str r4, [sp]
	ldr r1, _080FC368 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0xE0
	lsls r1, 1
	orrs r0, r1
	ldr r1, _080FC36C @ =0x0000ffff
	ands r0, r1
	movs r1, 0x80
	lsls r1, 10
	orrs r0, r1
	str r0, [sp, 0x4]
	mov r0, sp
	bl LoadSpriteSheet
	ldr r0, _080FC370 @ =gUnknown_083E79CC
	bl LoadSpritePalette
	bl sub_80FC374
	bl sub_80FC484
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC360: .4byte gUnknown_083E784C
_080FC364: .4byte 0x02000888
_080FC368: .4byte 0xffff0000
_080FC36C: .4byte 0x0000ffff
_080FC370: .4byte gUnknown_083E79CC
	thumb_func_end sub_80FC31C

	thumb_func_start sub_80FC374
sub_80FC374: @ 80FC374
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r0, _080FC3D4 @ =0x0000080f
	str r0, [sp, 0xC]
	movs r1, 0
	mov r9, r1
	mov r2, sp
	adds r2, 0x6
	str r2, [sp, 0x14]
	mov r3, sp
	adds r3, 0xA
	str r3, [sp, 0x18]
	mov r0, sp
	adds r0, 0x8
	str r0, [sp, 0x10]
	add r1, sp, 0x4
	mov r10, r1
_080FC39E:
	ldr r2, [sp, 0x18]
	str r2, [sp]
	mov r0, r9
	add r1, sp, 0x4
	mov r2, sp
	adds r2, 0x6
	ldr r3, [sp, 0x10]
	bl sub_80FC04C
	mov r3, r10
	ldrh r0, [r3]
	adds r0, 0x1
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r3]
	mov r1, sp
	ldrh r0, [r1, 0x6]
	adds r0, 0x2
	lsls r0, 3
	adds r0, 0x4
	strh r0, [r1, 0x6]
	ldr r2, [sp, 0x10]
	ldrh r0, [r2]
	cmp r0, 0x2
	bne _080FC3D8
	movs r7, 0x1
	b _080FC3E4
	.align 2, 0
_080FC3D4: .4byte 0x0000080f
_080FC3D8:
	ldr r3, [sp, 0x18]
	ldrh r0, [r3]
	movs r7, 0
	cmp r0, 0x2
	bne _080FC3E4
	movs r7, 0x2
_080FC3E4:
	mov r0, r10
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r3, [sp, 0x14]
	movs r0, 0
	ldrsh r2, [r3, r0]
	ldr r0, _080FC430 @ =gSpriteTemplate_83E7A38
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _080FC458
	ldr r1, _080FC434 @ =gSprites
	mov r8, r1
	lsls r4, r5, 4
	adds r0, r4, r5
	lsls r6, r0, 2
	adds r2, r6, r1
	lsls r3, r7, 6
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	orrs r0, r3
	strb r0, [r2, 0x1]
	ldr r0, [sp, 0xC]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080FC43C
	mov r0, r8
	adds r0, 0x1C
	adds r0, r6, r0
	ldr r1, _080FC438 @ =sub_80FC55C
	str r1, [r0]
	b _080FC442
	.align 2, 0
_080FC430: .4byte gSpriteTemplate_83E7A38
_080FC434: .4byte gSprites
_080FC438: .4byte sub_80FC55C
_080FC43C:
	adds r0, r7, 0x3
	lsls r0, 16
	lsrs r7, r0, 16
_080FC442:
	adds r4, r5
	lsls r4, 2
	ldr r0, _080FC480 @ =gSprites
	adds r4, r0
	lsls r1, r7, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	mov r2, r9
	strh r2, [r4, 0x2E]
_080FC458:
	ldr r0, [sp, 0xC]
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0xC]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	cmp r0, 0xF
	bls _080FC39E
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FC480: .4byte gSprites
	thumb_func_end sub_80FC374

	thumb_func_start sub_80FC484
sub_80FC484: @ 80FC484
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r0, 0
	mov r8, r0
	ldr r6, _080FC54C @ =gUnknown_083E79D4
	ldrh r0, [r6, 0x2]
	cmp r0, 0x58
	beq _080FC53C
	mov r5, sp
	adds r5, 0x6
	add r7, sp, 0x4
	ldr r1, _080FC550 @ =gSprites
	mov r9, r1
	movs r0, 0x1C
	add r0, r9
	mov r10, r0
_080FC4AC:
	mov r1, r8
	lsls r4, r1, 2
	adds r0, r4, r6
	ldrh r0, [r0]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080FC524
	adds r0, r6, 0x2
	adds r0, r4, r0
	ldrh r6, [r0]
	mov r0, sp
	adds r0, 0xA
	str r0, [sp]
	adds r0, r6, 0
	add r1, sp, 0x4
	adds r2, r5, 0
	add r3, sp, 0x8
	bl sub_80FC04C
	ldrh r0, [r7]
	adds r0, 0x1
	lsls r0, 3
	strh r0, [r7]
	ldrh r0, [r5]
	adds r0, 0x2
	lsls r0, 3
	strh r0, [r5]
	movs r0, 0
	ldrsh r1, [r7, r0]
	movs r0, 0
	ldrsh r2, [r5, r0]
	ldr r0, _080FC554 @ =gSpriteTemplate_83E7A38
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080FC524
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	mov r1, r9
	adds r4, r2, r1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4, 0x3]
	add r2, r10
	ldr r0, _080FC558 @ =sub_80FC55C
	str r0, [r2]
	adds r0, r4, 0
	movs r1, 0x6
	bl StartSpriteAnim
	strh r6, [r4, 0x2E]
_080FC524:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r6, _080FC54C @ =gUnknown_083E79D4
	lsls r0, 2
	adds r1, r6, 0x2
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x58
	bne _080FC4AC
_080FC53C:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FC54C: .4byte gUnknown_083E79D4
_080FC550: .4byte gSprites
_080FC554: .4byte gSpriteTemplate_83E7A38
_080FC558: .4byte sub_80FC55C
	thumb_func_end sub_80FC484

	thumb_func_start sub_80FC55C
sub_80FC55C: @ 80FC55C
	push {lr}
	adds r2, r0, 0
	ldr r0, _080FC59C @ =0x02000000
	ldrh r1, [r0, 0x1C]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _080FC5A0
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080FC5AE
	movs r0, 0
	strh r0, [r2, 0x30]
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080FC5AE
	.align 2, 0
_080FC59C: .4byte 0x02000000
_080FC5A0:
	movs r0, 0x10
	strh r0, [r2, 0x30]
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x15
	ands r0, r1
	strb r0, [r2]
_080FC5AE:
	pop {r0}
	bx r0
	thumb_func_end sub_80FC55C

	thumb_func_start sub_80FC5B4
sub_80FC5B4: @ 80FC5B4
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _080FC5C8 @ =0x02000000
	ldrh r1, [r4, 0x4]
	cmp r1, 0
	beq _080FC5CC
	cmp r1, 0x1
	beq _080FC5E4
	b _080FC5F4
	.align 2, 0
_080FC5C8: .4byte 0x02000000
_080FC5CC:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	b _080FC5F4
_080FC5E4:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080FC5F4
	ldr r0, _080FC5FC @ =sub_80FC600
	bl sub_80FC244
_080FC5F4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC5FC: .4byte sub_80FC600
	thumb_func_end sub_80FC5B4

	thumb_func_start sub_80FC600
sub_80FC600: @ 80FC600
	push {r4,lr}
	ldr r0, _080FC620 @ =0x02000000
	ldrh r0, [r0, 0x4]
	cmp r0, 0
	bne _080FC68A
	bl sub_80FAB60
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bhi _080FC68A
	lsls r0, 2
	ldr r1, _080FC624 @ =_080FC628
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FC620: .4byte 0x02000000
_080FC624: .4byte _080FC628
	.align 2, 0
_080FC628:
	.4byte _080FC68A
	.4byte _080FC68A
	.4byte _080FC68A
	.4byte _080FC640
	.4byte _080FC646
	.4byte _080FC674
_080FC640:
	bl sub_80FC254
	b _080FC68A
_080FC646:
	ldr r4, _080FC668 @ =0x02000000
	ldrb r0, [r4, 0x1E]
	cmp r0, 0x2
	beq _080FC652
	cmp r0, 0x4
	bne _080FC68A
_080FC652:
	movs r0, 0x5
	bl m4aSongNumStart
	ldr r1, _080FC66C @ =0x00000a6e
	adds r0, r4, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _080FC670 @ =sub_80FC69C
	bl sub_80FC244
	b _080FC68A
	.align 2, 0
_080FC668: .4byte 0x02000000
_080FC66C: .4byte 0x00000a6e
_080FC670: .4byte sub_80FC69C
_080FC674:
	movs r0, 0x5
	bl m4aSongNumStart
	ldr r0, _080FC690 @ =0x02000000
	ldr r1, _080FC694 @ =0x00000a6e
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080FC698 @ =sub_80FC69C
	bl sub_80FC244
_080FC68A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC690: .4byte 0x02000000
_080FC694: .4byte 0x00000a6e
_080FC698: .4byte sub_80FC69C
	thumb_func_end sub_80FC600

	thumb_func_start sub_80FC69C
sub_80FC69C: @ 80FC69C
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _080FC6B0 @ =0x02000000
	ldrh r1, [r4, 0x4]
	cmp r1, 0
	beq _080FC6B4
	cmp r1, 0x1
	beq _080FC6CC
	b _080FC792
	.align 2, 0
_080FC6B0: .4byte 0x02000000
_080FC6B4:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
	strh r0, [r4, 0x4]
	b _080FC792
_080FC6CC:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _080FC792
	bl sub_80FAB10
	ldr r1, _080FC6F4 @ =0x00000a6e
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080FC78C
	ldrh r0, [r4, 0x1C]
	cmp r0, 0xF
	beq _080FC724
	cmp r0, 0xF
	bgt _080FC6F8
	cmp r0, 0
	beq _080FC710
	b _080FC748
	.align 2, 0
_080FC6F4: .4byte 0x00000a6e
_080FC6F8:
	cmp r0, 0x3A
	beq _080FC708
	cmp r0, 0x49
	bne _080FC748
	movs r0, 0x16
	bl sub_8053538
	b _080FC786
_080FC708:
	movs r0, 0x15
	bl sub_8053538
	b _080FC786
_080FC710:
	ldr r0, _080FC720 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	movs r1, 0xD
	cmp r0, 0
	bne _080FC73A
	movs r1, 0xC
	b _080FC73A
	.align 2, 0
_080FC720: .4byte gSaveBlock2
_080FC724:
	ldr r0, _080FC744 @ =0x00000854
	bl FlagGet
	lsls r0, 24
	movs r1, 0xB
	cmp r0, 0
	beq _080FC73A
	ldrb r0, [r4, 0x1F]
	cmp r0, 0
	bne _080FC73A
	movs r1, 0x14
_080FC73A:
	adds r0, r1, 0
	bl sub_8053538
	b _080FC786
	.align 2, 0
_080FC744: .4byte 0x00000854
_080FC748:
	ldr r3, _080FC764 @ =gUnknown_083E7920
	ldr r0, _080FC768 @ =0x02000000
	ldrh r1, [r0, 0x1C]
	lsls r0, r1, 1
	adds r2, r0, r1
	adds r0, r3, 0x2
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080FC76C
	bl sub_8053538
	b _080FC786
	.align 2, 0
_080FC764: .4byte gUnknown_083E7920
_080FC768: .4byte 0x02000000
_080FC76C:
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	bl warp1_set_2
_080FC786:
	bl sub_80865BC
	b _080FC792
_080FC78C:
	ldr r0, _080FC79C @ =sub_808AD58
	bl SetMainCallback2
_080FC792:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FC79C: .4byte sub_808AD58
	thumb_func_end sub_80FC69C

	.align 2, 0 @ Don't pad with nop.
