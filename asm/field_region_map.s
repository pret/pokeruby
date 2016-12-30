	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

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

	.align 2, 0 @ Don't pad with nop.
