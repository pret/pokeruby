	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	thumb_func_start CreateAreaMarkerSprites
CreateAreaMarkerSprites: @ 8111658
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _08111720 @ =gUnknown_083F858C
	bl LoadSpriteSheet
	ldr r0, _08111724 @ =gUnknown_083F8594
	bl LoadSpritePalette
	movs r5, 0
	movs r1, 0
	ldr r0, _08111728 @ =gSharedMem
	movs r3, 0x89
	lsls r3, 1
	adds r2, r0, r3
	ldrh r7, [r2]
	cmp r5, r7
	bge _0811170C
	adds r6, r0, 0
	mov r8, r2
_08111680:
	lsls r0, r1, 16
	asrs r4, r0, 16
	lsls r1, r4, 1
	movs r2, 0xC4
	lsls r2, 3
	adds r0, r6, r2
	adds r1, r0
	ldr r2, _0811172C @ =gRegionMapLocations
	movs r3, 0
	ldrsh r0, [r1, r3]
	lsls r0, 3
	adds r0, r2
	ldrb r1, [r0]
	adds r1, 0x1
	lsls r1, 3
	adds r1, 0x4
	ldrb r2, [r0, 0x1]
	lsls r2, 19
	ldrb r3, [r0, 0x2]
	subs r3, 0x1
	lsls r3, 2
	ldrb r0, [r0, 0x3]
	subs r0, 0x1
	lsls r0, 2
	movs r7, 0xE0
	lsls r7, 13
	adds r2, r7
	asrs r2, 16
	adds r1, r3
	adds r2, r0
	ldr r0, _08111730 @ =gSpriteTemplate_83F85A4
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _081116FC
	ldr r0, _08111734 @ =gSprites
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	adds r1, r5, 0
	lsls r0, r1, 16
	movs r3, 0x80
	lsls r3, 9
	adds r0, r3
	lsrs r5, r0, 16
	lsls r1, 16
	asrs r1, 14
	movs r7, 0xCC
	lsls r7, 3
	adds r0, r6, r7
	adds r1, r0
	str r2, [r1]
_081116FC:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r0, 16
	mov r2, r8
	ldrh r2, [r2]
	cmp r0, r2
	blt _08111680
_0811170C:
	ldr r0, _08111728 @ =gSharedMem
	movs r3, 0xDC
	lsls r3, 3
	adds r0, r3
	strh r5, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08111720: .4byte gUnknown_083F858C
_08111724: .4byte gUnknown_083F8594
_08111728: .4byte gSharedMem
_0811172C: .4byte gRegionMapLocations
_08111730: .4byte gSpriteTemplate_83F85A4
_08111734: .4byte gSprites
	thumb_func_end CreateAreaMarkerSprites

	thumb_func_start DestroyAreaSprites
DestroyAreaSprites: @ 8111738
	push {r4-r6,lr}
	movs r0, 0x2
	bl FreeSpriteTilesByTag
	movs r0, 0x2
	bl FreeSpritePaletteByTag
	movs r4, 0
	ldr r1, _081117A4 @ =gSharedMem
	movs r2, 0xDC
	lsls r2, 3
	adds r0, r1, r2
	ldrh r2, [r0]
	cmp r4, r2
	bcs _08111776
	adds r6, r1, 0
	adds r5, r0, 0
_0811175A:
	lsls r0, r4, 2
	movs r2, 0xCC
	lsls r2, 3
	adds r1, r6, r2
	adds r0, r1
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrh r0, [r5]
	cmp r4, r0
	bcc _0811175A
_08111776:
	movs r0, 0x3
	bl FreeSpriteTilesByTag
	movs r0, 0x3
	bl FreeSpritePaletteByTag
	movs r4, 0
	ldr r5, _081117A8 @ =gSharedMem + 0xFA8
_08111786:
	lsls r0, r4, 2
	adds r0, r5
	ldr r0, [r0]
	cmp r0, 0
	beq _08111794
	bl DestroySprite
_08111794:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _08111786
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081117A4: .4byte gSharedMem
_081117A8: .4byte gSharedMem + 0xFA8
	thumb_func_end DestroyAreaSprites

	thumb_func_start LoadAreaUnknownGraphics
LoadAreaUnknownGraphics: @ 81117AC
	push {lr}
	sub sp, 0x8
	ldr r0, _081117D4 @ =gUnknown_083F8664
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, _081117D8 @ =gAreaUnknownTiles
	ldr r1, _081117DC @ =gSharedMem + 0xFB4
	bl LZ77UnCompWram
	mov r0, sp
	bl LoadSpriteSheet
	ldr r0, _081117E0 @ =gUnknown_083F865C
	bl LoadSpritePalette
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_081117D4: .4byte gUnknown_083F8664
_081117D8: .4byte gAreaUnknownTiles
_081117DC: .4byte gSharedMem + 0xFB4
_081117E0: .4byte gUnknown_083F865C
	thumb_func_end LoadAreaUnknownGraphics

	thumb_func_start CreateAreaUnknownSprites
CreateAreaUnknownSprites: @ 81117E4
	push {r4-r7,lr}
	ldr r1, _08111810 @ =gSharedMem
	movs r2, 0x88
	lsls r2, 1
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, 0
	beq _08111818
	movs r4, 0
	ldr r7, _08111814 @ =0x00000fa8
	adds r2, r1, r7
	movs r1, 0
_081117FC:
	lsls r0, r4, 2
	adds r0, r2
	str r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _081117FC
	b _0811188E
	.align 2, 0
_08111810: .4byte gSharedMem
_08111814: .4byte 0x00000fa8
_08111818:
	movs r4, 0
	ldr r6, _08111868 @ =gSprites
	ldr r0, _0811186C @ =0x00000fa8
	adds r5, r1, r0
_08111820:
	lsls r1, r4, 21
	movs r2, 0xA0
	lsls r2, 16
	adds r1, r2
	asrs r1, 16
	ldr r0, _08111870 @ =gSpriteTemplate_83F8674
	movs r2, 0x8C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _0811187C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r6
	ldrh r3, [r2, 0x4]
	lsls r0, r3, 22
	lsrs r0, 22
	lsls r1, r4, 4
	adds r0, r1
	ldr r7, _08111874 @ =0x000003ff
	adds r1, r7, 0
	ands r0, r1
	ldr r7, _08111878 @ =0xfffffc00
	adds r1, r7, 0
	ands r3, r1
	orrs r3, r0
	strh r3, [r2, 0x4]
	lsls r0, r4, 2
	adds r0, r5
	str r2, [r0]
	b _08111884
	.align 2, 0
_08111868: .4byte gSprites
_0811186C: .4byte 0x00000fa8
_08111870: .4byte gSpriteTemplate_83F8674
_08111874: .4byte 0x000003ff
_08111878: .4byte 0xfffffc00
_0811187C:
	lsls r0, r4, 2
	adds r0, r5
	movs r1, 0
	str r1, [r0]
_08111884:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x2
	bls _08111820
_0811188E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end CreateAreaUnknownSprites

	.align 2, 0 @ Don't pad with nop.
