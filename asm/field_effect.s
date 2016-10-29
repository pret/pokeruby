	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start FieldEffectStart
FieldEffectStart: @ 8085668
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl FieldEffectActiveListAdd
	ldr r0, _080856A8 @ =gFieldEffectScriptPointers
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	str r0, [sp]
	add r4, sp, 0x4
	ldr r5, _080856AC @ =gUnknown_0839F0D4
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
	ldr r1, _080857B8 @ =0xffff0000
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
	ldr r0, _080858B0 @ =0x0000ffff
	cmp r3, r0
	beq _080858A8
	movs r2, 0
	ldr r5, _080858B4 @ =gSprites
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
	ldr r0, _08085908 @ =0x0000ffff
	cmp r5, r0
	beq _08085900
	movs r2, 0
	ldr r6, _0808590C @ =gSprites
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
	ldr r4, _08085930 @ =gUnknown_030006E0
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
	ldr r4, _0808594C @ =gUnknown_030006E0
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
	ldr r4, _0808597C @ =gUnknown_030006E0
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
	ldr r3, _080859A8 @ =gUnknown_030006E0
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

	.align 2, 0 @ Don't pad with nop.
