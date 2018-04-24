	.include "constants/gba_constants.inc"
	.include "include/macros.inc"

	.syntax unified

	.text

	thumb_func_start ShowPokedexAreaScreen
ShowPokedexAreaScreen: @ 81113AC
	push {r4,lr}
	ldr r2, _081113DC @ =gSharedMem
	movs r3, 0
	movs r4, 0
	strh r0, [r2, 0xE]
	ldr r0, _081113E0 @ =0x000006e4
	adds r2, r0
	str r1, [r2]
	strb r3, [r1]
	ldr r0, _081113E4 @ =Task_PokedexAreaScreen_0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081113E8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081113DC: .4byte gSharedMem
_081113E0: .4byte 0x000006e4
_081113E4: .4byte Task_PokedexAreaScreen_0
_081113E8: .4byte gTasks
	thumb_func_end ShowPokedexAreaScreen

	thumb_func_start Task_PokedexAreaScreen_0
Task_PokedexAreaScreen_0: @ 81113EC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08111414 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0xB
	bls _0811140A
	b _08111540
_0811140A:
	lsls r0, 2
	ldr r1, _08111418 @ =_0811141C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08111414: .4byte gTasks
_08111418: .4byte _0811141C
	.align 2, 0
_0811141C:
	.4byte _0811144C
	.4byte _08111488
	.4byte _08111496
	.4byte _081114B8
	.4byte _081114BE
	.4byte _081114CA
	.4byte _081114DE
	.4byte _081114E4
	.4byte _081114EA
	.4byte _081114F0
	.4byte _08111502
	.4byte _08111528
_0811144C:
	movs r1, 0x80
	lsls r1, 19
	movs r3, 0xC4
	lsls r3, 7
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _08111478 @ =REG_BG0HOFS
	movs r1, 0
	strh r1, [r0]
	ldr r2, _0811147C @ =REG_BG0VOFS
	ldr r3, _08111480 @ =0x0000fff8
	adds r0, r3, 0
	strh r0, [r2]
	ldr r0, _08111484 @ =REG_BG2VOFS
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	b _08111540
	.align 2, 0
_08111478: .4byte REG_BG0HOFS
_0811147C: .4byte REG_BG0VOFS
_08111480: .4byte 0x0000fff8
_08111484: .4byte REG_BG2VOFS
_08111488:
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	b _08111540
_08111496:
	ldr r4, _081114B4 @ =gSharedMem + 0x6E8
	adds r0, r4, 0
	movs r1, 0
	bl InitRegionMap
	movs r0, 0x88
	lsls r0, 4
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x10
	bl StringFill
	b _08111540
	.align 2, 0
_081114B4: .4byte gSharedMem + 0x6E8
_081114B8:
	bl sub_8110824
	b _08111540
_081114BE:
	bl DrawAreaGlow
	lsls r0, 24
	cmp r0, 0
	bne _08111550
	b _08111540
_081114CA:
	movs r0, 0x1
	movs r1, 0x1
	bl CreateRegionMapPlayerIcon
	movs r1, 0x8
	negs r1, r1
	movs r0, 0
	bl sub_80FB2A4
	b _08111540
_081114DE:
	bl CreateAreaMarkerSprites
	b _08111540
_081114E4:
	bl LoadAreaUnknownGraphics
	b _08111540
_081114EA:
	bl CreateAreaUnknownSprites
	b _08111540
_081114F0:
	movs r0, 0x15
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08111540
_08111502:
	ldr r1, _0811151C @ =REG_BLDCNT
	ldr r2, _08111520 @ =0x00003f41
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_8111084
	movs r1, 0x80
	lsls r1, 19
	ldr r3, _08111524 @ =0x00007741
	adds r0, r3, 0
	strh r0, [r1]
	b _08111540
	.align 2, 0
_0811151C: .4byte REG_BLDCNT
_08111520: .4byte 0x00003f41
_08111524: .4byte 0x00007741
_08111528:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	ldr r1, _0811153C @ =Task_PokedexAreaScreen_1
	str r1, [r0]
	movs r1, 0
	strh r1, [r0, 0x8]
	b _08111550
	.align 2, 0
_0811153C: .4byte Task_PokedexAreaScreen_1
_08111540:
	ldr r0, _08111558 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_08111550:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08111558: .4byte gTasks
	thumb_func_end Task_PokedexAreaScreen_0

	thumb_func_start Task_PokedexAreaScreen_1
Task_PokedexAreaScreen_1: @ 811155C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8111110
	ldr r1, _08111584 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	cmp r1, 0x1
	beq _081115B4
	cmp r1, 0x1
	bgt _08111588
	cmp r1, 0
	beq _0811159E
	b _08111590
	.align 2, 0
_08111584: .4byte gTasks
_08111588:
	cmp r1, 0x2
	beq _081115F8
	cmp r1, 0x3
	beq _0811160A
_08111590:
	ldr r0, _081115AC @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x8]
_0811159E:
	ldr r0, _081115B0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811164C
	b _0811163C
	.align 2, 0
_081115AC: .4byte gTasks
_081115B0: .4byte gPaletteFade
_081115B4:
	ldr r0, _081115CC @ =gMain
	ldrh r2, [r0, 0x2E]
	movs r3, 0x2
	adds r0, r3, 0
	ands r0, r2
	cmp r0, 0
	beq _081115D0
	strh r1, [r5, 0xA]
	movs r0, 0x3
	bl PlaySE
	b _0811163C
	.align 2, 0
_081115CC: .4byte gMain
_081115D0:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	bne _081115EA
	movs r0, 0x80
	lsls r0, 1
	ands r0, r2
	cmp r0, 0
	beq _0811164C
	ldr r0, _081115F4 @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _0811164C
_081115EA:
	strh r3, [r5, 0xA]
	movs r0, 0x6D
	bl PlaySE
	b _0811163C
	.align 2, 0
_081115F4: .4byte gSaveBlock2
_081115F8:
	movs r0, 0x15
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0811163C
_0811160A:
	ldr r0, _08111630 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811164C
	bl DestroyAreaSprites
	ldr r0, _08111634 @ =gSharedMem
	ldr r1, _08111638 @ =0x000006e4
	adds r0, r1
	ldr r1, [r0]
	ldrh r0, [r5, 0xA]
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
	b _0811164C
	.align 2, 0
_08111630: .4byte gPaletteFade
_08111634: .4byte gSharedMem
_08111638: .4byte 0x000006e4
_0811163C:
	ldr r0, _08111654 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_0811164C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08111654: .4byte gTasks
	thumb_func_end Task_PokedexAreaScreen_1

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
