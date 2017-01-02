	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CB2_BeginEvolutionScene
CB2_BeginEvolutionScene: @ 8111894
	push {lr}
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	thumb_func_end CB2_BeginEvolutionScene

	thumb_func_start Task_BeginEvolutionScene
Task_BeginEvolutionScene: @ 81118A4
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	movs r7, 0
	ldr r1, _081118C8 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _081118CC
	cmp r0, 0x1
	beq _081118E4
	b _08111918
	.align 2, 0
_081118C8: .4byte gTasks
_081118CC:
	movs r0, 0x1
	negs r0, r0
	str r7, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08111918
_081118E4:
	ldr r0, _08111920 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08111918
	movs r0, 0xA
	ldrsh r7, [r4, r0]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	lsls r0, 16
	orrs r7, r0
	ldrh r5, [r4, 0x10]
	ldrb r6, [r4, 0x12]
	ldrh r4, [r4, 0x20]
	lsls r4, 24
	lsrs r4, 24
	adds r0, r2, 0
	bl DestroyTask
	adds r0, r7, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r4, 0
	bl EvolutionScene
_08111918:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08111920: .4byte gPaletteFade
	thumb_func_end Task_BeginEvolutionScene

	thumb_func_start BeginEvolutionScene
BeginEvolutionScene: @ 8111924
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _08111978 @ =Task_BeginEvolutionScene
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811197C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	mov r0, r8
	strh r0, [r1, 0xA]
	mov r0, r8
	lsrs r0, 16
	strh r0, [r1, 0xC]
	strh r4, [r1, 0x10]
	strh r5, [r1, 0x12]
	strh r6, [r1, 0x20]
	ldr r0, _08111980 @ =CB2_BeginEvolutionScene
	bl SetMainCallback2
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08111978: .4byte Task_BeginEvolutionScene
_0811197C: .4byte gTasks
_08111980: .4byte CB2_BeginEvolutionScene
	thumb_func_end BeginEvolutionScene

	thumb_func_start EvolutionScene
EvolutionScene: @ 8111984
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x38
	str r0, [sp, 0x20]
	mov r10, r1
	mov r0, r10
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x24]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x28]
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	movs r5, 0
	str r5, [sp, 0x1C]
	add r0, sp, 0x1C
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _08111C10 @ =0x05006000
	bl CpuSet
	ldr r0, _08111C14 @ =REG_MOSAIC
	strh r5, [r0]
	subs r0, 0xC
	strh r5, [r0]
	adds r0, 0x4
	strh r5, [r0]
	subs r0, 0x2
	strh r5, [r0]
	adds r0, 0x4
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	ldr r4, _08111C18 @ =gWindowConfig_81E6C58
	adds r0, r4, 0
	bl SetUpWindowConfig
	bl ResetPaletteFade
	ldr r0, _08111C1C @ =gUnknown_030042A4
	strh r5, [r0]
	ldr r0, _08111C20 @ =gUnknown_030042A0
	strh r5, [r0]
	ldr r0, _08111C24 @ =gUnknown_030042C0
	strh r5, [r0]
	ldr r0, _08111C28 @ =gUnknown_030041B4
	strh r5, [r0]
	ldr r0, _08111C2C @ =gUnknown_03004288
	strh r5, [r0]
	ldr r0, _08111C30 @ =gUnknown_03004280
	strh r5, [r0]
	ldr r1, _08111C34 @ =gUnknown_030041B0
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08111C38 @ =gUnknown_030041B8
	strh r5, [r0]
	ldr r0, _08111C3C @ =gUnknown_03004210
	adds r1, r4, 0
	bl InitWindowFromConfig
	ldr r1, _08111C40 @ =gBattleTerrain
	movs r0, 0x9
	strb r0, [r1]
	bl sub_800D6D4
	bl sub_800DAB8
	bl ResetSpriteData
	bl remove_some_task
	bl ResetTasks
	bl FreeAllSpritePalettes
	ldr r0, _08111C44 @ =gReservedSpritePaletteCount
	movs r3, 0x4
	strb r3, [r0]
	ldr r0, [sp, 0x20]
	movs r1, 0x2
	add r2, sp, 0x8
	bl GetMonData
	ldr r0, _08111C48 @ =gStringVar1
	add r1, sp, 0x8
	bl StringCopy10
	ldr r0, _08111C4C @ =gStringVar2
	movs r1, 0xB
	mov r4, r10
	muls r4, r1
	adds r1, r4, 0
	ldr r2, _08111C50 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r0, [sp, 0x20]
	movs r1, 0xB
	bl GetMonData
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	ldr r0, [sp, 0x20]
	movs r1, 0x1
	bl GetMonData
	str r0, [sp, 0x2C]
	ldr r0, [sp, 0x20]
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x30]
	lsls r0, r6, 3
	ldr r1, _08111C54 @ =gMonFrontPicTable
	adds r0, r1
	lsls r2, r6, 2
	ldr r3, _08111C58 @ =gMonFrontPicCoords
	adds r2, r3
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r4, _08111C5C @ =gUnknown_081FAF4C
	ldr r3, [r4, 0x4]
	str r3, [sp]
	str r6, [sp, 0x4]
	movs r3, 0x80
	lsls r3, 18
	bl DecompressPicFromTable_2
	adds r0, r6, 0
	ldr r1, [sp, 0x2C]
	ldr r2, [sp, 0x30]
	bl sub_80409C8
	ldr r0, [r0]
	movs r1, 0x88
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _08111C60 @ =gUnknown_02024E8C
	mov r9, r0
	ldr r1, _08111C64 @ =gDummySpriteAffineAnimTable
	str r1, [r0, 0x10]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	lsls r1, r0, 24
	lsrs r2, r1, 24
	ldr r3, _08111C68 @ =0x02014800
	strb r0, [r3]
	ldr r7, _08111C6C @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	movs r4, 0x1C
	adds r4, r7
	mov r8, r4
	adds r0, r1, r4
	ldr r2, _08111C70 @ =nullsub_37
	str r2, [r0]
	adds r1, r7
	ldrb r2, [r1, 0x5]
	movs r4, 0xF
	adds r0, r4, 0
	ands r0, r2
	movs r2, 0x10
	orrs r0, r2
	strb r0, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1]
	mov r1, r10
	lsls r0, r1, 3
	ldr r2, _08111C54 @ =gMonFrontPicTable
	adds r0, r2
	lsls r2, r1, 2
	ldr r3, _08111C58 @ =gMonFrontPicCoords
	adds r2, r3
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	str r2, [sp, 0x34]
	ldr r2, _08111C5C @ =gUnknown_081FAF4C
	ldr r2, [r2, 0xC]
	str r2, [sp]
	mov r3, r10
	str r3, [sp, 0x4]
	ldr r2, [sp, 0x34]
	movs r3, 0x80
	lsls r3, 18
	bl DecompressPicFromTable_2
	mov r0, r10
	ldr r1, [sp, 0x2C]
	ldr r2, [sp, 0x30]
	bl sub_80409C8
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	mov r0, r10
	movs r1, 0x3
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _08111C64 @ =gDummySpriteAffineAnimTable
	mov r1, r9
	str r0, [r1, 0x10]
	mov r0, r9
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	lsls r1, r0, 24
	lsrs r2, r1, 24
	ldr r3, _08111C68 @ =0x02014800
	strb r0, [r3, 0x1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r8, r1
	ldr r0, _08111C70 @ =nullsub_37
	mov r2, r8
	str r0, [r2]
	adds r1, r7
	ldrb r0, [r1, 0x5]
	ands r4, r0
	movs r0, 0x20
	orrs r4, r0
	strb r4, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1]
	bl sub_8149954
	ldr r0, _08111C74 @ =Task_EvolutionScene
	movs r1, 0
	bl CreateTask
	lsls r1, r0, 24
	lsrs r2, r1, 24
	ldr r4, _08111C68 @ =0x02014800
	strb r0, [r4, 0x2]
	ldr r1, _08111C78 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	strh r6, [r0, 0xE]
	mov r1, r10
	strh r1, [r0, 0x10]
	mov r2, sp
	ldrh r2, [r2, 0x20]
	strh r2, [r0, 0xA]
	ldr r3, [sp, 0x20]
	lsrs r1, r3, 16
	strh r1, [r0, 0xC]
	mov r4, sp
	ldrh r4, [r4, 0x24]
	strh r4, [r0, 0x12]
	movs r1, 0x1
	strh r1, [r0, 0x14]
	strh r5, [r0, 0x1E]
	mov r1, sp
	ldrh r1, [r1, 0x28]
	strh r1, [r0, 0x20]
	ldr r0, _08111C7C @ =0x02009000
	ldr r1, _08111C80 @ =gPlttBufferUnfaded + 0x40
	movs r2, 0x60
	bl memcpy
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08111C84 @ =HBlankCB_EvolutionScene
	bl SetHBlankCallback
	ldr r0, _08111C88 @ =VBlankCB_EvolutionScene
	bl SetVBlankCallback
	bl m4aMPlayAllStop
	ldr r0, _08111C8C @ =CB2_EvolutionSceneUpdate_0
	bl SetMainCallback2
	add sp, 0x38
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08111C10: .4byte 0x05006000
_08111C14: .4byte REG_MOSAIC
_08111C18: .4byte gWindowConfig_81E6C58
_08111C1C: .4byte gUnknown_030042A4
_08111C20: .4byte gUnknown_030042A0
_08111C24: .4byte gUnknown_030042C0
_08111C28: .4byte gUnknown_030041B4
_08111C2C: .4byte gUnknown_03004288
_08111C30: .4byte gUnknown_03004280
_08111C34: .4byte gUnknown_030041B0
_08111C38: .4byte gUnknown_030041B8
_08111C3C: .4byte gUnknown_03004210
_08111C40: .4byte gBattleTerrain
_08111C44: .4byte gReservedSpritePaletteCount
_08111C48: .4byte gStringVar1
_08111C4C: .4byte gStringVar2
_08111C50: .4byte gSpeciesNames
_08111C54: .4byte gMonFrontPicTable
_08111C58: .4byte gMonFrontPicCoords
_08111C5C: .4byte gUnknown_081FAF4C
_08111C60: .4byte gUnknown_02024E8C
_08111C64: .4byte gDummySpriteAffineAnimTable
_08111C68: .4byte 0x02014800
_08111C6C: .4byte gSprites
_08111C70: .4byte nullsub_37
_08111C74: .4byte Task_EvolutionScene
_08111C78: .4byte gTasks
_08111C7C: .4byte 0x02009000
_08111C80: .4byte gPlttBufferUnfaded + 0x40
_08111C84: .4byte HBlankCB_EvolutionScene
_08111C88: .4byte VBlankCB_EvolutionScene
_08111C8C: .4byte CB2_EvolutionSceneUpdate_0
	thumb_func_end EvolutionScene

	thumb_func_start CB2_EvolutionSceneLoadGraphics
CB2_EvolutionSceneLoadGraphics: @ 8111C90
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0xC
	ldr r2, _08111E14 @ =gTasks
	ldr r0, _08111E18 @ =0x02014800
	mov r9, r0
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x20
	ldrsh r2, [r0, r1]
	movs r1, 0x64
	adds r4, r2, 0
	muls r4, r1
	ldr r1, _08111E1C @ =gPlayerParty
	adds r4, r1
	ldrh r6, [r0, 0x10]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	mov r10, r0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	mov r8, r0
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	movs r5, 0
	str r5, [sp, 0x8]
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _08111E20 @ =0x05006000
	add r0, sp, 0x8
	bl CpuSet
	ldr r0, _08111E24 @ =REG_MOSAIC
	strh r5, [r0]
	subs r0, 0xC
	strh r5, [r0]
	adds r0, 0x4
	strh r5, [r0]
	subs r0, 0x2
	strh r5, [r0]
	adds r0, 0x4
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	ldr r4, _08111E28 @ =gWindowConfig_81E6C58
	adds r0, r4, 0
	bl SetUpWindowConfig
	bl ResetPaletteFade
	ldr r0, _08111E2C @ =gUnknown_030042A4
	strh r5, [r0]
	ldr r0, _08111E30 @ =gUnknown_030042A0
	strh r5, [r0]
	ldr r0, _08111E34 @ =gUnknown_030042C0
	strh r5, [r0]
	ldr r0, _08111E38 @ =gUnknown_030041B4
	strh r5, [r0]
	ldr r0, _08111E3C @ =gUnknown_03004288
	strh r5, [r0]
	ldr r0, _08111E40 @ =gUnknown_03004280
	strh r5, [r0]
	ldr r1, _08111E44 @ =gUnknown_030041B0
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08111E48 @ =gUnknown_030041B8
	strh r5, [r0]
	ldr r0, _08111E4C @ =gUnknown_03004210
	adds r1, r4, 0
	bl InitWindowFromConfig
	ldr r1, _08111E50 @ =gBattleTerrain
	movs r0, 0x9
	strb r0, [r1]
	bl sub_800D6D4
	bl sub_800DAB8
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _08111E54 @ =gReservedSpritePaletteCount
	movs r0, 0x4
	strb r0, [r1]
	lsls r0, r6, 3
	ldr r1, _08111E58 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _08111E5C @ =gMonFrontPicCoords
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08111E60 @ =gUnknown_081FAF4C
	ldr r4, [r4, 0xC]
	str r4, [sp]
	str r6, [sp, 0x4]
	bl DecompressPicFromTable_2
	adds r0, r6, 0
	mov r1, r10
	mov r2, r8
	bl sub_80409C8
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	adds r0, r6, 0
	movs r1, 0x3
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _08111E64 @ =gUnknown_02024E8C
	ldr r1, _08111E68 @ =gDummySpriteAffineAnimTable
	str r1, [r0, 0x10]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	lsls r2, r0, 24
	lsrs r2, 24
	mov r1, r9
	strb r0, [r1, 0x1]
	ldr r3, _08111E6C @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _08111E70 @ =nullsub_37
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08111E74 @ =HBlankCB_EvolutionScene
	bl SetHBlankCallback
	ldr r0, _08111E78 @ =VBlankCB_EvolutionScene
	bl SetVBlankCallback
	ldr r0, _08111E7C @ =CB2_EvolutionSceneUpdate_0
	bl SetMainCallback2
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08111E14: .4byte gTasks
_08111E18: .4byte 0x02014800
_08111E1C: .4byte gPlayerParty
_08111E20: .4byte 0x05006000
_08111E24: .4byte REG_MOSAIC
_08111E28: .4byte gWindowConfig_81E6C58
_08111E2C: .4byte gUnknown_030042A4
_08111E30: .4byte gUnknown_030042A0
_08111E34: .4byte gUnknown_030042C0
_08111E38: .4byte gUnknown_030041B4
_08111E3C: .4byte gUnknown_03004288
_08111E40: .4byte gUnknown_03004280
_08111E44: .4byte gUnknown_030041B0
_08111E48: .4byte gUnknown_030041B8
_08111E4C: .4byte gUnknown_03004210
_08111E50: .4byte gBattleTerrain
_08111E54: .4byte gReservedSpritePaletteCount
_08111E58: .4byte gMonFrontPicTable
_08111E5C: .4byte gMonFrontPicCoords
_08111E60: .4byte gUnknown_081FAF4C
_08111E64: .4byte gUnknown_02024E8C
_08111E68: .4byte gDummySpriteAffineAnimTable
_08111E6C: .4byte gSprites
_08111E70: .4byte nullsub_37
_08111E74: .4byte HBlankCB_EvolutionScene
_08111E78: .4byte VBlankCB_EvolutionScene
_08111E7C: .4byte CB2_EvolutionSceneUpdate_0
	thumb_func_end CB2_EvolutionSceneLoadGraphics

	thumb_func_start CB2_TradeEvolutionSceneLoadGraphics
CB2_TradeEvolutionSceneLoadGraphics: @ 8111E80
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r2, _08111EB8 @ =gTasks
	ldr r0, _08111EBC @ =0x02014800
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x20
	ldrsh r2, [r0, r1]
	movs r1, 0x64
	muls r2, r1
	ldr r1, _08111EC0 @ =gPlayerParty
	adds r4, r2, r1
	ldrh r7, [r0, 0x10]
	ldr r0, _08111EC4 @ =gMain
	ldr r2, _08111EC8 @ =0x0000043c
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x6
	bls _08111EAE
	b _081120D6
_08111EAE:
	lsls r0, 2
	ldr r1, _08111ECC @ =_08111ED0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08111EB8: .4byte gTasks
_08111EBC: .4byte 0x02014800
_08111EC0: .4byte gPlayerParty
_08111EC4: .4byte gMain
_08111EC8: .4byte 0x0000043c
_08111ECC: .4byte _08111ED0
	.align 2, 0
_08111ED0:
	.4byte _08111EEC
	.4byte _08111F68
	.4byte _08111F88
	.4byte _08111FDC
	.4byte _08111FE2
	.4byte _08112048
	.4byte _081120B4
_08111EEC:
	movs r0, 0x80
	lsls r0, 19
	movs r4, 0
	strh r4, [r0]
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _08111F3C @ =gReservedSpritePaletteCount
	movs r0, 0x4
	strb r0, [r1]
	ldr r0, _08111F40 @ =gUnknown_030042A4
	strh r4, [r0]
	ldr r0, _08111F44 @ =gUnknown_030042A0
	strh r4, [r0]
	ldr r0, _08111F48 @ =gUnknown_030042C0
	strh r4, [r0]
	ldr r0, _08111F4C @ =gUnknown_030041B4
	strh r4, [r0]
	ldr r0, _08111F50 @ =gUnknown_03004288
	strh r4, [r0]
	ldr r0, _08111F54 @ =gUnknown_03004280
	strh r4, [r0]
	ldr r1, _08111F58 @ =gUnknown_030041B0
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08111F5C @ =gUnknown_030041B8
	strh r4, [r0]
	ldr r1, _08111F60 @ =gMain
	ldr r0, _08111F64 @ =0x0000043c
	adds r1, r0
	b _0811208E
	.align 2, 0
_08111F3C: .4byte gReservedSpritePaletteCount
_08111F40: .4byte gUnknown_030042A4
_08111F44: .4byte gUnknown_030042A0
_08111F48: .4byte gUnknown_030042C0
_08111F4C: .4byte gUnknown_030041B4
_08111F50: .4byte gUnknown_03004288
_08111F54: .4byte gUnknown_03004280
_08111F58: .4byte gUnknown_030041B0
_08111F5C: .4byte gUnknown_030041B8
_08111F60: .4byte gMain
_08111F64: .4byte 0x0000043c
_08111F68:
	ldr r4, _08111F80 @ =gWindowConfig_81E6F84
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, _08111F84 @ =gUnknown_03004828
	ldr r0, [r0]
	adds r0, 0x4
	adds r1, r4, 0
	bl InitWindowFromConfig
	b _08112088
	.align 2, 0
_08111F80: .4byte gWindowConfig_81E6F84
_08111F84: .4byte gUnknown_03004828
_08111F88:
	ldr r4, _08111FC8 @ =gUnknown_03004828
	ldr r0, [r4]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	movs r0, 0x2
	bl SetTextWindowBaseTileNum
	ldr r1, [r4]
	adds r1, 0x34
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	bl MenuZeroFillScreen
	bl ResetPaletteFade
	ldr r1, _08111FCC @ =gMain
	ldr r0, _08111FD0 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, _08111FD4 @ =HBlankCB_EvolutionScene
	bl SetHBlankCallback
	ldr r0, _08111FD8 @ =VBlankCB_TradeEvolutionScene
	bl SetVBlankCallback
	b _081120D6
	.align 2, 0
_08111FC8: .4byte gUnknown_03004828
_08111FCC: .4byte gMain
_08111FD0: .4byte 0x0000043c
_08111FD4: .4byte HBlankCB_EvolutionScene
_08111FD8: .4byte VBlankCB_TradeEvolutionScene
_08111FDC:
	bl sub_804E22C
	b _08112088
_08111FE2:
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	adds r6, r0, 0
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r5, r0, 0
	lsls r0, r7, 3
	ldr r1, _08112034 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _08112038 @ =gMonFrontPicCoords
	lsls r2, r7, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _0811203C @ =gUnknown_081FAF4C
	ldr r4, [r4, 0xC]
	str r4, [sp]
	str r7, [sp, 0x4]
	bl DecompressPicFromTable_2
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80409C8
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, _08112040 @ =gMain
	ldr r0, _08112044 @ =0x0000043c
	adds r1, r0
	b _0811208E
	.align 2, 0
_08112034: .4byte gMonFrontPicTable
_08112038: .4byte gMonFrontPicCoords
_0811203C: .4byte gUnknown_081FAF4C
_08112040: .4byte gMain
_08112044: .4byte 0x0000043c
_08112048:
	adds r0, r7, 0
	movs r1, 0x3
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _08112098 @ =gUnknown_02024E8C
	ldr r1, _0811209C @ =gDummySpriteAffineAnimTable
	str r1, [r0, 0x10]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	ldr r1, _081120A0 @ =0x02014800
	lsls r2, r0, 24
	lsrs r2, 24
	strb r0, [r1, 0x1]
	ldr r3, _081120A4 @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _081120A8 @ =nullsub_37
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x5]
_08112088:
	ldr r1, _081120AC @ =gMain
	ldr r2, _081120B0 @ =0x0000043c
	adds r1, r2
_0811208E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _081120D6
	.align 2, 0
_08112098: .4byte gUnknown_02024E8C
_0811209C: .4byte gDummySpriteAffineAnimTable
_081120A0: .4byte 0x02014800
_081120A4: .4byte gSprites
_081120A8: .4byte nullsub_37
_081120AC: .4byte gMain
_081120B0: .4byte 0x0000043c
_081120B4:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _081120E0 @ =CB2_EvolutionSceneUpdate_1
	bl SetMainCallback2
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x9A
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
_081120D6:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081120E0: .4byte CB2_EvolutionSceneUpdate_1
	thumb_func_end CB2_TradeEvolutionSceneLoadGraphics

	thumb_func_start TradeEvolutionScene
TradeEvolutionScene: @ 81120E4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	str r0, [sp, 0x1C]
	adds r5, r1, 0
	adds r4, r2, 0
	mov r10, r3
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 24
	lsrs r4, 24
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, [sp, 0x1C]
	movs r1, 0x2
	add r2, sp, 0x8
	bl GetMonData
	ldr r0, _08112234 @ =gStringVar1
	add r1, sp, 0x8
	bl StringCopy10
	ldr r0, _08112238 @ =gStringVar2
	movs r1, 0xB
	muls r1, r5
	ldr r2, _0811223C @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	ldr r1, _08112240 @ =gAffineAnimsDisabled
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, [sp, 0x1C]
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	mov r1, r8
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	ldr r0, [sp, 0x1C]
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	ldr r0, [sp, 0x1C]
	movs r1, 0x1
	bl GetMonData
	adds r7, r0, 0
	ldr r2, _08112244 @ =0x02014800
	mov r9, r2
	strb r4, [r2]
	lsls r0, r5, 3
	ldr r1, _08112248 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _0811224C @ =gMonFrontPicCoords
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _08112250 @ =gUnknown_081FAF4C
	ldr r4, [r4, 0x4]
	str r4, [sp]
	str r5, [sp, 0x4]
	bl DecompressPicFromTable_2
	adds r0, r5, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl sub_80409C8
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	adds r0, r5, 0
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _08112254 @ =gUnknown_02024E8C
	ldr r1, _08112258 @ =gDummySpriteAffineAnimTable
	str r1, [r0, 0x10]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0x1E
	bl CreateSprite
	lsls r1, r0, 24
	lsrs r2, r1, 24
	mov r1, r9
	strb r0, [r1, 0x1]
	ldr r3, _0811225C @ =gSprites
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _08112260 @ =nullsub_37
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x5]
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	bl sub_8149954
	ldr r0, _08112264 @ =Task_TradeEvolutionScene
	movs r1, 0
	bl CreateTask
	lsls r1, r0, 24
	lsrs r2, r1, 24
	mov r1, r9
	strb r0, [r1, 0x2]
	ldr r1, _08112268 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	strh r2, [r0, 0x8]
	mov r1, r8
	strh r1, [r0, 0xE]
	strh r5, [r0, 0x10]
	mov r2, sp
	ldrh r2, [r2, 0x1C]
	strh r2, [r0, 0xA]
	ldr r1, [sp, 0x1C]
	lsrs r1, 16
	str r1, [sp, 0x20]
	strh r1, [r0, 0xC]
	movs r1, 0x1
	strh r1, [r0, 0x14]
	movs r1, 0
	strh r1, [r0, 0x1E]
	mov r2, r10
	strh r2, [r0, 0x20]
	ldr r0, _0811226C @ =CB2_EvolutionSceneUpdate_1
	bl SetMainCallback2
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08112234: .4byte gStringVar1
_08112238: .4byte gStringVar2
_0811223C: .4byte gSpeciesNames
_08112240: .4byte gAffineAnimsDisabled
_08112244: .4byte 0x02014800
_08112248: .4byte gMonFrontPicTable
_0811224C: .4byte gMonFrontPicCoords
_08112250: .4byte gUnknown_081FAF4C
_08112254: .4byte gUnknown_02024E8C
_08112258: .4byte gDummySpriteAffineAnimTable
_0811225C: .4byte gSprites
_08112260: .4byte nullsub_37
_08112264: .4byte Task_TradeEvolutionScene
_08112268: .4byte gTasks
_0811226C: .4byte CB2_EvolutionSceneUpdate_1
	thumb_func_end TradeEvolutionScene

	thumb_func_start CB2_EvolutionSceneUpdate_0
CB2_EvolutionSceneUpdate_0: @ 8112270
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _0811228C @ =gUnknown_03004210
	bl sub_800374C
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
_0811228C: .4byte gUnknown_03004210
	thumb_func_end CB2_EvolutionSceneUpdate_0

	thumb_func_start CB2_EvolutionSceneUpdate_1
CB2_EvolutionSceneUpdate_1: @ 8112290
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _081122B0 @ =gUnknown_03004828
	ldr r0, [r0]
	adds r0, 0x4
	bl sub_80035AC
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	.align 2, 0
_081122B0: .4byte gUnknown_03004828
	thumb_func_end CB2_EvolutionSceneUpdate_1

	thumb_func_start CreateShedinja
CreateShedinja: @ 81122B4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r1
	lsls r0, 16
	lsrs r7, r0, 16
	movs r0, 0
	str r0, [sp]
	ldr r0, _081123F4 @ =gEvolutionTable
	mov r8, r0
	lsls r1, r7, 2
	mov r9, r1
	adds r0, r1, r7
	lsls r4, r0, 3
	mov r0, r8
	adds r6, r4, r0
	ldrh r0, [r6]
	cmp r0, 0xD
	beq _081122E2
	b _081123E2
_081122E2:
	ldr r1, _081123F8 @ =gPlayerPartyCount
	ldrb r0, [r1]
	cmp r0, 0x5
	bhi _081123E2
	adds r1, r0, 0
	movs r0, 0x64
	muls r1, r0
	ldr r0, _081123FC @ =gPlayerParty
	adds r5, r1, r0
	adds r0, r5, 0
	mov r1, r10
	movs r2, 0x64
	bl CopyMon
	mov r1, r8
	adds r2, r1, r4
	adds r2, 0xC
	adds r0, r5, 0
	movs r1, 0xB
	bl SetMonData
	ldrh r1, [r6, 0xC]
	movs r0, 0xB
	adds r2, r1, 0
	muls r2, r0
	ldr r0, _08112400 @ =gSpeciesNames
	adds r2, r0
	adds r0, r5, 0
	movs r1, 0x2
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0xC
	mov r2, sp
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0x8
	mov r2, sp
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0xA
	mov r2, sp
	bl SetMonData
	movs r4, 0x32
	mov r6, r9
_08112342:
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, sp
	bl SetMonData
	adds r4, 0x1
	cmp r4, 0x36
	ble _08112342
	movs r4, 0x43
_08112354:
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, sp
	bl SetMonData
	adds r4, 0x1
	cmp r4, 0x4F
	ble _08112354
	adds r0, r5, 0
	movs r1, 0x37
	mov r2, sp
	bl SetMonData
	movs r0, 0xFF
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0x40
	mov r2, sp
	bl SetMonData
	adds r0, r5, 0
	bl CalculateMonStats
	bl CalculatePlayerPartyCount
	ldr r0, _081123F4 @ =gEvolutionTable
	adds r4, r6, r7
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0xC]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
	ldrh r0, [r4, 0xC]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl sub_8090D90
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	ldr r1, _08112404 @ =0x0000012f
	cmp r0, r1
	bne _081123E2
	adds r0, r5, 0
	movs r1, 0x3
	bl GetMonData
	cmp r0, 0x1
	bne _081123E2
	mov r0, r10
	movs r1, 0xB
	bl GetMonData
	movs r1, 0x97
	lsls r1, 1
	cmp r0, r1
	bne _081123E2
	ldr r2, _08112408 @ =gUnknown_083F868C
	adds r0, r5, 0
	movs r1, 0x2
	bl SetMonData
_081123E2:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081123F4: .4byte gEvolutionTable
_081123F8: .4byte gPlayerPartyCount
_081123FC: .4byte gPlayerParty
_08112400: .4byte gSpeciesNames
_08112404: .4byte 0x0000012f
_08112408: .4byte gUnknown_083F868C
	thumb_func_end CreateShedinja

	thumb_func_start Task_EvolutionScene
Task_EvolutionScene: @ 811240C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _08112490 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r3, r0, r2
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	mov r9, r0
	movs r1, 0xC
	ldrsh r0, [r3, r1]
	lsls r0, 16
	mov r1, r9
	orrs r1, r0
	mov r9, r1
	ldr r0, _08112494 @ =gMain
	ldrh r1, [r0, 0x2C]
	adds r6, r2, 0
	adds r4, r0, 0
	cmp r1, 0x2
	bne _0811246E
	movs r2, 0x8
	ldrsh r0, [r3, r2]
	cmp r0, 0x8
	bne _0811246E
	ldrh r1, [r3, 0x12]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0811246E
	movs r0, 0x10
	strh r0, [r3, 0x8]
	ldr r0, _08112498 @ =gUnknown_02024D1E
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _0811246E
	strh r2, [r1, 0x18]
_0811246E:
	lsls r1, r7, 2
	adds r0, r1, r7
	lsls r0, 3
	adds r0, r6
	movs r3, 0x8
	ldrsh r0, [r0, r3]
	mov r8, r1
	cmp r0, 0x15
	bls _08112484
	bl _08112FD0
_08112484:
	lsls r0, 2
	ldr r1, _0811249C @ =_081124A0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08112490: .4byte gTasks
_08112494: .4byte gMain
_08112498: .4byte gUnknown_02024D1E
_0811249C: .4byte _081124A0
	.align 2, 0
_081124A0:
	.4byte _081124F8
	.4byte _0811253C
	.4byte _08112588
	.4byte _08112594
	.4byte _081125BC
	.4byte _081125FC
	.4byte _08112630
	.4byte _0811266C
	.4byte _081126A0
	.4byte _081126E0
	.4byte _081126FC
	.4byte _08112728
	.4byte _08112754
	.4byte _081127A0
	.4byte _0811284C
	.4byte _081128E4
	.4byte _08112934
	.4byte _08112974
	.4byte _081129A0
	.4byte _081129E8
	.4byte _08112A4C
	.4byte _08112A88
_081124F8:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _08112530 @ =gSprites
	ldr r0, _08112534 @ =0x02014800
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r0, _08112538 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	b _08112A2E
	.align 2, 0
_08112530: .4byte gSprites
_08112534: .4byte 0x02014800
_08112538: .4byte gTasks
_0811253C:
	ldr r0, _08112574 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0811254C
	bl _08112FD0
_0811254C:
	ldr r4, _08112578 @ =gStringVar4
	ldr r1, _0811257C @ =gUnknown_08400C4A
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _08112580 @ =gUnknown_03004210
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112584 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	b _08112A2E
	.align 2, 0
_08112574: .4byte gPaletteFade
_08112578: .4byte gStringVar4
_0811257C: .4byte gUnknown_08400C4A
_08112580: .4byte gUnknown_03004210
_08112584: .4byte gTasks
_08112588:
	ldr r0, _08112590 @ =gUnknown_03004210
	ldrh r0, [r0, 0x16]
	b _0811297C
	.align 2, 0
_08112590: .4byte gUnknown_03004210
_08112594:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _081125A2
	bl _08112FD0
_081125A2:
	movs r0, 0xBC
	lsls r0, 1
	bl PlaySE
	ldr r0, _081125B8 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	b _08112A2E
	.align 2, 0
_081125B8: .4byte gTasks
_081125BC:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _081125CC
	bl _08112FD0
_081125CC:
	ldr r0, _081125F4 @ =0x00000179
	bl PlayNewMapMusic
	ldr r0, _081125F8 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r4, [sp]
	movs r0, 0x1C
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	bl _08112FD0
	.align 2, 0
_081125F4: .4byte 0x00000179
_081125F8: .4byte gTasks
_081125FC:
	ldr r0, _08112624 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0811260C
	bl _08112FD0
_0811260C:
	movs r0, 0x11
	bl sub_8149970
	ldr r1, _08112628 @ =gUnknown_02024D1E
	strb r0, [r1, 0x2]
	ldr r0, _0811262C @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	b _08112A2E
	.align 2, 0
_08112624: .4byte gPaletteFade
_08112628: .4byte gUnknown_02024D1E
_0811262C: .4byte gTasks
_08112630:
	ldr r4, _08112664 @ =gUnknown_02024D1E
	ldrb r0, [r4, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _08112646
	bl _08112FD0
_08112646:
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r6
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r1, _08112668 @ =0x02014800
	movs r0, 0x1
	strb r0, [r1, 0x3]
	bl sub_8149A90
	strb r0, [r4, 0x2]
	bl _08112FD0
	.align 2, 0
_08112664: .4byte gUnknown_02024D1E
_08112668: .4byte 0x02014800
_0811266C:
	ldr r4, _08112698 @ =gUnknown_02024D1E
	ldrb r0, [r4, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _08112682
	bl _08112FD0
_08112682:
	ldr r1, _0811269C @ =0x02014800
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	bl sub_8149E7C
	strb r0, [r4, 0x2]
	mov r0, r8
	adds r1, r0, r7
	lsls r1, 3
	adds r1, r6
	b _08112A2E
	.align 2, 0
_08112698: .4byte gUnknown_02024D1E
_0811269C: .4byte 0x02014800
_081126A0:
	ldr r1, _081126D8 @ =0x02014800
	ldrb r0, [r1, 0x3]
	subs r0, 0x1
	strb r0, [r1, 0x3]
	lsls r0, 24
	cmp r0, 0
	beq _081126B2
	bl _08112FD0
_081126B2:
	movs r0, 0x3
	strb r0, [r1, 0x3]
	ldr r0, _081126DC @ =gUnknown_02024D1E
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _081126CC
	bl _08112FD0
_081126CC:
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r6
	b _08112A2E
	.align 2, 0
_081126D8: .4byte 0x02014800
_081126DC: .4byte gUnknown_02024D1E
_081126E0:
	bl sub_8149B44
	ldr r1, _081126F4 @ =gUnknown_02024D1E
	strb r0, [r1, 0x2]
	ldr r0, _081126F8 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	b _08112A2E
	.align 2, 0
_081126F4: .4byte gUnknown_02024D1E
_081126F8: .4byte gTasks
_081126FC:
	ldr r5, _08112724 @ =gUnknown_02024D1E
	ldrb r0, [r5, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _08112712
	bl _08112FD0
_08112712:
	mov r0, r8
	adds r4, r0, r7
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0x10]
	bl sub_8149C20
	strb r0, [r5, 0x2]
	b _08112992
	.align 2, 0
_08112724: .4byte gUnknown_02024D1E
_08112728:
	ldr r0, _08112750 @ =gUnknown_02024D1E
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _0811273E
	bl _08112FD0
_0811273E:
	movs r0, 0x21
	bl PlaySE
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r6
	b _08112A2E
	.align 2, 0
_08112750: .4byte gUnknown_02024D1E
_08112754:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08112762
	bl _08112FD0
_08112762:
	bl m4aMPlayAllStop
	ldr r0, _08112794 @ =gTasks
	mov r3, r8
	adds r4, r3, r7
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0x10]
	movs r1, 0
	bl PlayCry1
	ldr r0, _08112798 @ =gPlttBufferUnfaded + 0x40
	ldr r1, _0811279C @ =0x02009000
	movs r2, 0x60
	bl memcpy
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1C
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _08112992
	.align 2, 0
_08112794: .4byte gTasks
_08112798: .4byte gPlttBufferUnfaded + 0x40
_0811279C: .4byte 0x02009000
_081127A0:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _081127AE
	bl _08112FD0
_081127AE:
	ldr r0, _08112834 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081127BE
	bl _08112FD0
_081127BE:
	ldr r4, _08112838 @ =gStringVar4
	ldr r1, _0811283C @ =gUnknown_08400C60
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _08112840 @ =gUnknown_03004210
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112844 @ =0x00000173
	bl PlayBGM
	ldr r2, _08112848 @ =gTasks
	mov r0, r8
	adds r1, r0, r7
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	adds r2, r1
	adds r2, 0x10
	mov r0, r9
	movs r1, 0xB
	bl SetMonData
	mov r0, r9
	bl CalculateMonStats
	ldrh r1, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	mov r0, r9
	bl sub_803FB68
	ldrh r0, [r4, 0x10]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
	ldrh r0, [r4, 0x10]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl sub_8090D90
	movs r0, 0xE
	bl sav12_xor_increment
	b _08112FD0
	.align 2, 0
_08112834: .4byte gPaletteFade
_08112838: .4byte gStringVar4
_0811283C: .4byte gUnknown_08400C60
_08112840: .4byte gUnknown_03004210
_08112844: .4byte 0x00000173
_08112848: .4byte gTasks
_0811284C:
	ldr r0, _081128A4 @ =gUnknown_03004210
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	beq _08112856
	b _08112FD0
_08112856:
	mov r1, r8
	adds r0, r1, r7
	lsls r0, 3
	adds r5, r0, r6
	ldrb r1, [r5, 0x14]
	mov r0, r9
	bl sub_803B7C8
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0
	beq _081128C4
	movs r2, 0x1E
	ldrsh r4, [r5, r2]
	cmp r4, 0
	bne _081128C4
	bl sub_8053E90
	ldrh r1, [r5, 0x12]
	movs r0, 0x80
	orrs r0, r1
	strh r0, [r5, 0x12]
	strh r4, [r5, 0x14]
	strh r4, [r5, 0x18]
	mov r0, r9
	movs r1, 0x2
	add r2, sp, 0x4
	bl GetMonData
	ldr r0, _081128A8 @ =gUnknown_030041C0
	add r1, sp, 0x4
	bl StringCopy10
	ldr r0, _081128AC @ =0x0000ffff
	cmp r6, r0
	bne _081128B0
	movs r0, 0x15
	strh r0, [r5, 0x8]
	b _08112FD0
	.align 2, 0
_081128A4: .4byte gUnknown_03004210
_081128A8: .4byte gUnknown_030041C0
_081128AC: .4byte 0x0000ffff
_081128B0:
	ldr r0, _081128C0 @ =0x0000fffe
	cmp r6, r0
	bne _081128B8
	b _08112FD0
_081128B8:
	movs r0, 0x13
	strh r0, [r5, 0x8]
	b _08112FD0
	.align 2, 0
_081128C0: .4byte 0x0000fffe
_081128C4:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _081128E0 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	b _08112A2E
	.align 2, 0
_081128E0: .4byte gTasks
_081128E4:
	ldr r0, _0811292C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r2, 0x80
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _081128F4
	b _08112FD0
_081128F4:
	mov r1, r8
	adds r0, r1, r7
	lsls r0, 3
	adds r4, r0, r6
	ldrh r1, [r4, 0x12]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0811290A
	bl sub_8053E90
_0811290A:
	movs r2, 0x1E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0811291A
	ldrh r0, [r4, 0xE]
	mov r1, r9
	bl CreateShedinja
_0811291A:
	adds r0, r7, 0
	bl DestroyTask
	ldr r0, _08112930 @ =gUnknown_03005E94
	ldr r0, [r0]
	bl SetMainCallback2
	b _08112FD0
	.align 2, 0
_0811292C: .4byte gPaletteFade
_08112930: .4byte gUnknown_03005E94
_08112934:
	ldr r0, _08112968 @ =gUnknown_02024D1E
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _08112948
	b _08112FD0
_08112948:
	bl m4aMPlayAllStop
	ldr r0, _0811296C @ =0x0006001c
	ldr r1, _08112970 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r6
	b _08112A2E
	.align 2, 0
_08112968: .4byte gUnknown_02024D1E
_0811296C: .4byte 0x0006001c
_08112970: .4byte 0x00007fff
_08112974:
	ldr r0, _0811299C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
_0811297C:
	cmp r0, 0
	beq _08112982
	b _08112FD0
_08112982:
	mov r0, r8
	adds r4, r0, r7
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0xE]
	movs r1, 0
	bl PlayCry1
_08112992:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08112FD0
	.align 2, 0
_0811299C: .4byte gPaletteFade
_081129A0:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _081129AC
	b _08112FD0
_081129AC:
	ldr r4, _081129D8 @ =gStringVar4
	ldr r1, _081129DC @ =gUnknown_08400C8D
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _081129E0 @ =gUnknown_03004210
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _081129E4 @ =gTasks
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x1E]
	b _08112F9A
	.align 2, 0
_081129D8: .4byte gStringVar4
_081129DC: .4byte gUnknown_08400C8D
_081129E0: .4byte gUnknown_03004210
_081129E4: .4byte gTasks
_081129E8:
	ldr r4, _08112A38 @ =gUnknown_03004210
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	beq _081129F2
	b _08112FD0
_081129F2:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _081129FE
	b _08112FD0
_081129FE:
	bl sub_8024CEC
	ldr r0, _08112A3C @ =0x0000016f
	bl PlayFanfare
	ldr r0, _08112A40 @ =gUnknown_08400F8C
	ldr r0, [r0, 0xC]
	bl get_battle_strings_
	ldr r1, _08112A44 @ =gUnknown_020238CC
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112A48 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x40
	strh r0, [r1, 0x14]
_08112A2E:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _08112FD0
	.align 2, 0
_08112A38: .4byte gUnknown_03004210
_08112A3C: .4byte 0x0000016f
_08112A40: .4byte gUnknown_08400F8C
_08112A44: .4byte gUnknown_020238CC
_08112A48: .4byte gTasks
_08112A4C:
	ldr r0, _08112A80 @ =gUnknown_03004210
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	beq _08112A56
	b _08112FD0
_08112A56:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08112A62
	b _08112FD0
_08112A62:
	ldr r0, _08112A84 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	subs r0, 0x1
	strh r0, [r1, 0x14]
	lsls r0, 16
	cmp r0, 0
	beq _08112A7A
	b _08112FD0
_08112A7A:
	movs r0, 0xE
	strh r0, [r1, 0x8]
	b _08112FD0
	.align 2, 0
_08112A80: .4byte gUnknown_03004210
_08112A84: .4byte gTasks
_08112A88:
	mov r3, r8
	adds r0, r3, r7
	lsls r0, 3
	adds r0, r6
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0xB
	bls _08112A9A
	b _08112FD0
_08112A9A:
	lsls r0, 2
	ldr r1, _08112AA4 @ =_08112AA8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08112AA4: .4byte _08112AA8
	.align 2, 0
_08112AA8:
	.4byte _08112AD8
	.4byte _08112B2C
	.4byte _08112B7C
	.4byte _08112BC0
	.4byte _08112C0C
	.4byte _08112D3C
	.4byte _08112D8C
	.4byte _08112E98
	.4byte _08112EE8
	.4byte _08112F38
	.4byte _08112F78
	.4byte _08112FB0
_08112AD8:
	ldr r4, _08112B1C @ =gUnknown_03004210
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	beq _08112AE2
	b _08112FD0
_08112AE2:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08112AEE
	b _08112FD0
_08112AEE:
	bl sub_8024CEC
	ldr r0, _08112B20 @ =gUnknown_08400F8C
	ldr r0, [r0, 0x10]
	bl get_battle_strings_
	ldr r1, _08112B24 @ =gUnknown_020238CC
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112B28 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08112FCE
	.align 2, 0
_08112B1C: .4byte gUnknown_03004210
_08112B20: .4byte gUnknown_08400F8C
_08112B24: .4byte gUnknown_020238CC
_08112B28: .4byte gTasks
_08112B2C:
	ldr r4, _08112B6C @ =gUnknown_03004210
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	beq _08112B36
	b _08112FD0
_08112B36:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08112B42
	b _08112FD0
_08112B42:
	ldr r0, _08112B70 @ =gUnknown_08400F8C
	ldr r0, [r0, 0x14]
	bl get_battle_strings_
	ldr r1, _08112B74 @ =gUnknown_020238CC
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112B78 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08112FCE
	.align 2, 0
_08112B6C: .4byte gUnknown_03004210
_08112B70: .4byte gUnknown_08400F8C
_08112B74: .4byte gUnknown_020238CC
_08112B78: .4byte gTasks
_08112B7C:
	ldr r4, _08112BF8 @ =gUnknown_03004210
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	beq _08112B86
	b _08112FD0
_08112B86:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08112BC0
	ldr r0, _08112BFC @ =gUnknown_08400F8C
	ldr r0, [r0, 0x18]
	bl get_battle_strings_
	ldr r1, _08112C00 @ =gUnknown_020238CC
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112C04 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x5
	strh r0, [r1, 0x1A]
	movs r0, 0x9
	strh r0, [r1, 0x1C]
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	strh r0, [r1, 0x18]
_08112BC0:
	ldr r0, _08112BF8 @ =gUnknown_03004210
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	beq _08112BCA
	b _08112FD0
_08112BCA:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08112BD6
	b _08112FD0
_08112BD6:
	bl sub_8023A80
	ldr r0, _08112C04 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r1, 0x18]
	ldr r0, _08112C08 @ =gUnknown_02024D1E
	strb r2, [r0, 0x1]
	bl sub_802BC6C
	b _08112FD0
	.align 2, 0
_08112BF8: .4byte gUnknown_03004210
_08112BFC: .4byte gUnknown_08400F8C
_08112C00: .4byte gUnknown_020238CC
_08112C04: .4byte gTasks
_08112C08: .4byte gUnknown_02024D1E
_08112C0C:
	ldr r0, _08112CA4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08112C32
	ldr r4, _08112CA8 @ =gUnknown_02024D1E
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _08112C32
	movs r0, 0x5
	bl PlaySE
	bl nullsub_6
	movs r0, 0
	strb r0, [r4, 0x1]
	bl sub_802BC6C
_08112C32:
	ldr r0, _08112CA4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08112C58
	ldr r4, _08112CA8 @ =gUnknown_02024D1E
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08112C58
	movs r0, 0x5
	bl PlaySE
	bl nullsub_6
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl sub_802BC6C
_08112C58:
	ldr r0, _08112CA4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08112CE2
	bl sub_8023AD8
	ldr r0, _08112CAC @ =gUnknown_08400F8C
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _08112CB0 @ =gUnknown_03004210
	ldr r1, _08112CB4 @ =gUnknown_020238CC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08112CA8 @ =gUnknown_02024D1E
	ldrb r2, [r0, 0x1]
	cmp r2, 0
	beq _08112CBC
	ldr r0, _08112CB8 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1C]
	strh r0, [r1, 0x18]
	b _08112CE2
	.align 2, 0
_08112CA4: .4byte gMain
_08112CA8: .4byte gUnknown_02024D1E
_08112CAC: .4byte gUnknown_08400F8C
_08112CB0: .4byte gUnknown_03004210
_08112CB4: .4byte gUnknown_020238CC
_08112CB8: .4byte gTasks
_08112CBC:
	ldr r0, _08112D28 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1A]
	strh r0, [r1, 0x18]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _08112CE2
	movs r0, 0x1
	negs r0, r0
	str r2, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_08112CE2:
	ldr r0, _08112D2C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08112CF0
	b _08112FD0
_08112CF0:
	bl sub_8023AD8
	ldr r0, _08112D30 @ =gUnknown_08400F8C
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _08112D34 @ =gUnknown_03004210
	ldr r1, _08112D38 @ =gUnknown_020238CC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08112D28 @ =gTasks
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x1C]
	strh r1, [r0, 0x18]
	b _08112FD0
	.align 2, 0
_08112D28: .4byte gTasks
_08112D2C: .4byte gMain
_08112D30: .4byte gUnknown_08400F8C
_08112D34: .4byte gUnknown_03004210
_08112D38: .4byte gUnknown_020238CC
_08112D3C:
	ldr r0, _08112D78 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08112D4A
	b _08112FD0
_08112D4A:
	ldr r0, _08112D7C @ =gPlayerParty
	mov r3, r8
	adds r5, r3, r7
	lsls r5, 3
	adds r5, r6
	ldrh r1, [r5, 0x20]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08112D80 @ =gPlayerPartyCount
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08112D84 @ =CB2_EvolutionSceneLoadGraphics
	ldr r4, _08112D88 @ =word_2024E82
	ldrh r4, [r4]
	str r4, [sp]
	bl sub_809D9F0
	ldrh r0, [r5, 0x18]
	adds r0, 0x1
	strh r0, [r5, 0x18]
	b _08112FD0
	.align 2, 0
_08112D78: .4byte gPaletteFade
_08112D7C: .4byte gPlayerParty
_08112D80: .4byte gPlayerPartyCount
_08112D84: .4byte CB2_EvolutionSceneLoadGraphics
_08112D88: .4byte word_2024E82
_08112D8C:
	ldr r0, _08112DC0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08112D9A
	b _08112FD0
_08112D9A:
	ldr r1, [r4, 0x4]
	ldr r0, _08112DC4 @ =CB2_EvolutionSceneUpdate_0
	cmp r1, r0
	beq _08112DA4
	b _08112FD0
_08112DA4:
	bl sub_809FA30
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x4
	bne _08112DCC
	ldr r0, _08112DC8 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x9
	b _08112FCE
	.align 2, 0
_08112DC0: .4byte gPaletteFade
_08112DC4: .4byte CB2_EvolutionSceneUpdate_0
_08112DC8: .4byte gTasks
_08112DCC:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r9
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_8040A00
	cmp r0, 0
	beq _08112E24
	ldr r0, _08112E10 @ =gUnknown_08400F8C
	ldr r3, _08112E14 @ =0x000004cc
	adds r0, r3
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _08112E18 @ =gUnknown_03004210
	ldr r1, _08112E1C @ =gUnknown_020238CC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08112E20 @ =gTasks
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0xB
	strh r1, [r0, 0x18]
	b _08112FD0
	.align 2, 0
_08112E10: .4byte gUnknown_08400F8C
_08112E14: .4byte 0x000004cc
_08112E18: .4byte gUnknown_03004210
_08112E1C: .4byte gUnknown_020238CC
_08112E20: .4byte gTasks
_08112E24:
	ldr r1, _08112E80 @ =gUnknown_03004290
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	strb r4, [r1, 0x2]
	lsrs r0, r4, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	lsls r4, r6, 24
	lsrs r4, 24
	mov r0, r9
	adds r1, r4, 0
	bl RemoveMonPPBonus
	ldr r0, _08112E84 @ =word_2024E82
	ldrh r1, [r0]
	mov r0, r9
	adds r2, r4, 0
	bl SetMonMoveSlot
	ldr r0, _08112E88 @ =gUnknown_08400F8C
	movs r3, 0xCF
	lsls r3, 2
	adds r0, r3
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _08112E8C @ =gUnknown_03004210
	ldr r1, _08112E90 @ =gUnknown_020238CC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112E94 @ =gTasks
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08112FCE
	.align 2, 0
_08112E80: .4byte gUnknown_03004290
_08112E84: .4byte word_2024E82
_08112E88: .4byte gUnknown_08400F8C
_08112E8C: .4byte gUnknown_03004210
_08112E90: .4byte gUnknown_020238CC
_08112E94: .4byte gTasks
_08112E98:
	ldr r4, _08112ED8 @ =gUnknown_03004210
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	beq _08112EA2
	b _08112FD0
_08112EA2:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08112EAE
	b _08112FD0
_08112EAE:
	ldr r0, _08112EDC @ =gUnknown_08400F8C
	ldr r0, [r0, 0x1C]
	bl get_battle_strings_
	ldr r1, _08112EE0 @ =gUnknown_020238CC
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08112EE4 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08112FCE
	.align 2, 0
_08112ED8: .4byte gUnknown_03004210
_08112EDC: .4byte gUnknown_08400F8C
_08112EE0: .4byte gUnknown_020238CC
_08112EE4: .4byte gTasks
_08112EE8:
	ldr r4, _08112F28 @ =gUnknown_03004210
	ldrh r0, [r4, 0x16]
	cmp r0, 0
	bne _08112FD0
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08112FD0
	ldr r0, _08112F2C @ =gUnknown_08400F8C
	movs r1, 0xD0
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r1, _08112F30 @ =gUnknown_020238CC
	movs r0, 0xF
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08112F34 @ =gTasks
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0x13
	strh r1, [r0, 0x8]
	b _08112FD0
	.align 2, 0
_08112F28: .4byte gUnknown_03004210
_08112F2C: .4byte gUnknown_08400F8C
_08112F30: .4byte gUnknown_020238CC
_08112F34: .4byte gTasks
_08112F38:
	ldr r0, _08112F68 @ =gUnknown_08400F8C
	ldr r0, [r0, 0x20]
	bl get_battle_strings_
	ldr r0, _08112F6C @ =gUnknown_03004210
	ldr r1, _08112F70 @ =gUnknown_020238CC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08112F74 @ =gTasks
	mov r3, r8
	adds r0, r3, r7
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0xA
	strh r1, [r0, 0x1A]
	strh r2, [r0, 0x1C]
	movs r1, 0x3
	strh r1, [r0, 0x18]
	b _08112FD0
	.align 2, 0
_08112F68: .4byte gUnknown_08400F8C
_08112F6C: .4byte gUnknown_03004210
_08112F70: .4byte gUnknown_020238CC
_08112F74: .4byte gTasks
_08112F78:
	ldr r0, _08112FA0 @ =gUnknown_08400F8C
	ldr r0, [r0, 0x24]
	bl get_battle_strings_
	ldr r0, _08112FA4 @ =gUnknown_03004210
	ldr r1, _08112FA8 @ =gUnknown_020238CC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08112FAC @ =gTasks
	mov r2, r8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
_08112F9A:
	movs r1, 0xE
	strh r1, [r0, 0x8]
	b _08112FD0
	.align 2, 0
_08112FA0: .4byte gUnknown_08400F8C
_08112FA4: .4byte gUnknown_03004210
_08112FA8: .4byte gUnknown_020238CC
_08112FAC: .4byte gTasks
_08112FB0:
	ldr r0, _08112FE0 @ =gUnknown_03004210
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	bne _08112FD0
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08112FD0
	ldr r0, _08112FE4 @ =gTasks
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x5
_08112FCE:
	strh r0, [r1, 0x18]
_08112FD0:
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08112FE0: .4byte gUnknown_03004210
_08112FE4: .4byte gTasks
	thumb_func_end Task_EvolutionScene

	thumb_func_start Task_TradeEvolutionScene
Task_TradeEvolutionScene: @ 8112FE8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _0811302C @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r2
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	mov r8, r0
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	lsls r0, 16
	mov r3, r8
	orrs r3, r0
	mov r8, r3
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	adds r6, r2, 0
	cmp r0, 0x11
	bls _08113020
	bl _08113B3A
_08113020:
	lsls r0, 2
	ldr r1, _08113030 @ =_08113034
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811302C: .4byte gTasks
_08113030: .4byte _08113034
	.align 2, 0
_08113034:
	.4byte _0811307C
	.4byte _081130B8
	.4byte _081130DC
	.4byte _0811310C
	.4byte _0811314C
	.4byte _0811318C
	.4byte _081131C8
	.4byte _081131F4
	.4byte _0811322C
	.4byte _08113248
	.4byte _08113274
	.4byte _081132A8
	.4byte _081132F8
	.4byte _081133A8
	.4byte _0811346C
	.4byte _08113490
	.4byte _081134F8
	.4byte _08113538
_0811307C:
	ldr r4, _081130A8 @ =gStringVar4
	ldr r1, _081130AC @ =gUnknown_08400C4A
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _081130B0 @ =gUnknown_03004828
	ldr r1, [r0]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _081130B4 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	b _08113298
	.align 2, 0
_081130A8: .4byte gStringVar4
_081130AC: .4byte gUnknown_08400C4A
_081130B0: .4byte gUnknown_03004828
_081130B4: .4byte gTasks
_081130B8:
	ldr r0, _081130D8 @ =gUnknown_03004828
	ldr r0, [r0]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _081130C6
	bl _08113B3A
_081130C6:
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0xE]
	movs r1, 0
	bl PlayCry1
	b _081132E2
	.align 2, 0
_081130D8: .4byte gUnknown_03004828
_081130DC:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _081130EA
	bl _08113B3A
_081130EA:
	ldr r0, _08113104 @ =0x00000179
	bl m4aSongNumStop
	movs r0, 0xBC
	lsls r0, 1
	bl PlaySE
	ldr r1, _08113108 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	b _08113298
	.align 2, 0
_08113104: .4byte 0x00000179
_08113108: .4byte gTasks
_0811310C:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _0811311C
	bl _08113B3A
_0811311C:
	ldr r0, _08113144 @ =0x00000179
	bl PlayBGM
	ldr r1, _08113148 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	str r5, [sp]
	movs r0, 0x1C
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	bl _08113B3A
	.align 2, 0
_08113144: .4byte 0x00000179
_08113148: .4byte gTasks
_0811314C:
	ldr r0, _08113180 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0811315C
	bl _08113B3A
_0811315C:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x9A
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0x11
	bl sub_8149970
	ldr r1, _08113184 @ =gUnknown_02024D1E
	strb r0, [r1, 0x2]
	ldr r1, _08113188 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	b _08113298
	.align 2, 0
_08113180: .4byte gPaletteFade
_08113184: .4byte gUnknown_02024D1E
_08113188: .4byte gTasks
_0811318C:
	ldr r4, _081131C0 @ =gUnknown_02024D1E
	ldrb r0, [r4, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _081131A2
	bl _08113B3A
_081131A2:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r6
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	ldr r1, _081131C4 @ =0x02014800
	movs r0, 0x1
	strb r0, [r1, 0x3]
	bl sub_8149A90
	strb r0, [r4, 0x2]
	bl _08113B3A
	.align 2, 0
_081131C0: .4byte gUnknown_02024D1E
_081131C4: .4byte 0x02014800
_081131C8:
	ldr r4, _081131EC @ =gUnknown_02024D1E
	ldrb r0, [r4, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _081131DE
	bl _08113B3A
_081131DE:
	ldr r1, _081131F0 @ =0x02014800
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	bl sub_8149E7C
	strb r0, [r4, 0x2]
	b _08113290
	.align 2, 0
_081131EC: .4byte gUnknown_02024D1E
_081131F0: .4byte 0x02014800
_081131F4:
	ldr r1, _08113224 @ =0x02014800
	ldrb r0, [r1, 0x3]
	subs r0, 0x1
	strb r0, [r1, 0x3]
	lsls r0, 24
	cmp r0, 0
	beq _08113206
	bl _08113B3A
_08113206:
	movs r0, 0x3
	strb r0, [r1, 0x3]
	ldr r0, _08113228 @ =gUnknown_02024D1E
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _08113220
	bl _08113B3A
_08113220:
	b _08113290
	.align 2, 0
_08113224: .4byte 0x02014800
_08113228: .4byte gUnknown_02024D1E
_0811322C:
	bl sub_8149B44
	ldr r1, _08113240 @ =gUnknown_02024D1E
	strb r0, [r1, 0x2]
	ldr r1, _08113244 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	b _08113298
	.align 2, 0
_08113240: .4byte gUnknown_02024D1E
_08113244: .4byte gTasks
_08113248:
	ldr r5, _08113270 @ =gUnknown_02024D1E
	ldrb r0, [r5, 0x2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r6
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _0811325E
	bl _08113B3A
_0811325E:
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r6
	ldrh r0, [r4, 0x10]
	bl sub_8149D5C
	strb r0, [r5, 0x2]
	b _081132E2
	.align 2, 0
_08113270: .4byte gUnknown_02024D1E
_08113274:
	ldr r0, _081132A4 @ =gUnknown_02024D1E
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r6
	ldrb r0, [r0, 0x4]
	cmp r0, 0
	beq _0811328A
	bl _08113B3A
_0811328A:
	movs r0, 0x21
	bl PlaySE
_08113290:
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r6
_08113298:
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	bl _08113B3A
	.align 2, 0
_081132A4: .4byte gUnknown_02024D1E
_081132A8:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _081132B6
	bl _08113B3A
_081132B6:
	ldr r0, _081132EC @ =gTasks
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0x10]
	movs r1, 0
	bl PlayCry1
	ldr r0, _081132F0 @ =gPlttBufferUnfaded + 0x40
	ldr r1, _081132F4 @ =0x02009000
	movs r2, 0x60
	bl memcpy
	movs r0, 0
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_081132E2:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl _08113B3A
	.align 2, 0
_081132EC: .4byte gTasks
_081132F0: .4byte gPlttBufferUnfaded + 0x40
_081132F4: .4byte 0x02009000
_081132F8:
	bl IsCryFinished
	lsls r0, 24
	cmp r0, 0
	bne _08113306
	bl _08113B3A
_08113306:
	ldr r0, _08113390 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08113316
	bl _08113B3A
_08113316:
	ldr r4, _08113394 @ =gStringVar4
	ldr r1, _08113398 @ =gUnknown_08400C60
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _0811339C @ =gUnknown_03004828
	ldr r1, [r0]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _081133A0 @ =0x00000173
	bl PlayFanfare
	ldr r2, _081133A4 @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	adds r2, r1
	adds r2, 0x10
	mov r0, r8
	movs r1, 0xB
	bl SetMonData
	mov r0, r8
	bl CalculateMonStats
	ldrh r1, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	mov r0, r8
	bl sub_803FB68
	ldrh r0, [r4, 0x10]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
	ldrh r0, [r4, 0x10]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl sub_8090D90
	movs r0, 0xE
	bl sav12_xor_increment
	b _08113B3A
	.align 2, 0
_08113390: .4byte gPaletteFade
_08113394: .4byte gStringVar4
_08113398: .4byte gUnknown_08400C60
_0811339C: .4byte gUnknown_03004828
_081133A0: .4byte 0x00000173
_081133A4: .4byte gTasks
_081133A8:
	ldr r0, _08113410 @ =gUnknown_03004828
	ldr r0, [r0]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _081133B4
	b _08113B3A
_081133B4:
	bl IsFanfareTaskInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081133C2
	b _08113B3A
_081133C2:
	ldr r1, _08113414 @ =gTasks
	lsls r4, r7, 2
	adds r0, r4, r7
	lsls r0, 3
	adds r5, r0, r1
	ldrb r1, [r5, 0x14]
	mov r0, r8
	bl sub_803B7C8
	lsls r0, 16
	lsrs r6, r0, 16
	mov r9, r4
	cmp r6, 0
	beq _08113434
	movs r3, 0x1E
	ldrsh r2, [r5, r3]
	cmp r2, 0
	bne _08113434
	ldrh r1, [r5, 0x12]
	movs r0, 0x80
	orrs r0, r1
	strh r0, [r5, 0x12]
	strh r2, [r5, 0x14]
	strh r2, [r5, 0x18]
	mov r0, r8
	movs r1, 0x2
	add r2, sp, 0x4
	bl GetMonData
	ldr r0, _08113418 @ =gUnknown_030041C0
	add r1, sp, 0x4
	bl StringCopy10
	ldr r0, _0811341C @ =0x0000ffff
	cmp r6, r0
	bne _08113420
	movs r0, 0x11
	strh r0, [r5, 0x8]
	b _08113B3A
	.align 2, 0
_08113410: .4byte gUnknown_03004828
_08113414: .4byte gTasks
_08113418: .4byte gUnknown_030041C0
_0811341C: .4byte 0x0000ffff
_08113420:
	ldr r0, _08113430 @ =0x0000fffe
	cmp r6, r0
	bne _08113428
	b _08113B3A
_08113428:
	movs r0, 0xF
	strh r0, [r5, 0x8]
	b _08113B3A
	.align 2, 0
_08113430: .4byte 0x0000fffe
_08113434:
	ldr r0, _0811345C @ =0x00000179
	bl PlayBGM
	ldr r0, _08113460 @ =gUnknown_03004828
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _08113464 @ =gOtherText_LinkStandby2
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08113468 @ =gTasks
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	b _081134DC
	.align 2, 0
_0811345C: .4byte 0x00000179
_08113460: .4byte gUnknown_03004828
_08113464: .4byte gOtherText_LinkStandby2
_08113468: .4byte gTasks
_0811346C:
	ldr r0, _08113488 @ =gUnknown_03004828
	ldr r0, [r0]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _08113478
	b _08113B3A
_08113478:
	adds r0, r7, 0
	bl DestroyTask
	ldr r0, _0811348C @ =gUnknown_03005E94
	ldr r0, [r0]
	bl SetMainCallback2
	b _08113B3A
	.align 2, 0
_08113488: .4byte gUnknown_03004828
_0811348C: .4byte gUnknown_03005E94
_08113490:
	ldr r4, _081134E4 @ =gUnknown_03004828
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _0811349C
	b _08113B3A
_0811349C:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _081134A8
	b _08113B3A
_081134A8:
	bl sub_8024CEC
	ldr r0, _081134E8 @ =0x0000016f
	bl PlayFanfare
	ldr r0, _081134EC @ =gUnknown_08400F8C
	ldr r0, [r0, 0xC]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _081134F0 @ =gUnknown_020238CC
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _081134F4 @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x40
	strh r0, [r1, 0x14]
_081134DC:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _08113B3A
	.align 2, 0
_081134E4: .4byte gUnknown_03004828
_081134E8: .4byte 0x0000016f
_081134EC: .4byte gUnknown_08400F8C
_081134F0: .4byte gUnknown_020238CC
_081134F4: .4byte gTasks
_081134F8:
	ldr r0, _08113530 @ =gUnknown_03004828
	ldr r0, [r0]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _08113504
	b _08113B3A
_08113504:
	bl IsFanfareTaskInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08113512
	b _08113B3A
_08113512:
	ldr r0, _08113534 @ =gTasks
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x14]
	subs r0, 0x1
	strh r0, [r1, 0x14]
	lsls r0, 16
	cmp r0, 0
	beq _0811352A
	b _08113B3A
_0811352A:
	movs r0, 0xD
	strh r0, [r1, 0x8]
	b _08113B3A
	.align 2, 0
_08113530: .4byte gUnknown_03004828
_08113534: .4byte gTasks
_08113538:
	lsls r1, r7, 2
	adds r0, r1, r7
	lsls r0, 3
	adds r0, r6
	movs r3, 0x18
	ldrsh r0, [r0, r3]
	mov r9, r1
	cmp r0, 0xB
	bls _0811354C
	b _08113B3A
_0811354C:
	lsls r0, 2
	ldr r1, _08113558 @ =_0811355C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08113558: .4byte _0811355C
	.align 2, 0
_0811355C:
	.4byte _0811358C
	.4byte _081135E4
	.4byte _08113638
	.4byte _08113682
	.4byte _0811371C
	.4byte _0811387C
	.4byte _081138CC
	.4byte _081139E8
	.4byte _08113A3C
	.4byte _08113A90
	.4byte _08113AD8
	.4byte _08113B18
_0811358C:
	ldr r4, _081135D4 @ =gUnknown_03004828
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _08113598
	b _08113B3A
_08113598:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _081135A4
	b _08113B3A
_081135A4:
	bl sub_8024CEC
	ldr r0, _081135D8 @ =gUnknown_08400F8C
	ldr r0, [r0, 0x10]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _081135DC @ =gUnknown_020238CC
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _081135E0 @ =gTasks
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08113B38
	.align 2, 0
_081135D4: .4byte gUnknown_03004828
_081135D8: .4byte gUnknown_08400F8C
_081135DC: .4byte gUnknown_020238CC
_081135E0: .4byte gTasks
_081135E4:
	ldr r4, _08113628 @ =gUnknown_03004828
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _081135F0
	b _08113B3A
_081135F0:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _081135FC
	b _08113B3A
_081135FC:
	ldr r0, _0811362C @ =gUnknown_08400F8C
	ldr r0, [r0, 0x14]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _08113630 @ =gUnknown_020238CC
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08113634 @ =gTasks
	mov r3, r9
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08113B38
	.align 2, 0
_08113628: .4byte gUnknown_03004828
_0811362C: .4byte gUnknown_08400F8C
_08113630: .4byte gUnknown_020238CC
_08113634: .4byte gTasks
_08113638:
	ldr r4, _081136FC @ =gUnknown_03004828
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _08113644
	b _08113B3A
_08113644:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08113682
	ldr r0, _08113700 @ =gUnknown_08400F8C
	ldr r0, [r0, 0x18]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _08113704 @ =gUnknown_020238CC
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08113708 @ =gTasks
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x5
	strh r0, [r1, 0x1A]
	movs r0, 0x9
	strh r0, [r1, 0x1C]
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	strh r0, [r1, 0x18]
_08113682:
	ldr r5, _081136FC @ =gUnknown_03004828
	ldr r0, [r5]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _0811368E
	b _08113B3A
_0811368E:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _0811369C
	b _08113B3A
_0811369C:
	ldr r0, [r5]
	adds r0, 0x4
	movs r1, 0xD
	str r1, [sp]
	movs r1, 0x18
	movs r2, 0x8
	movs r3, 0x1D
	bl DrawTextWindow
	ldr r4, _0811370C @ =gUnknown_02024D1E
	strb r6, [r4, 0x1]
	ldr r2, [r5]
	adds r0, r2, 0x4
	ldr r1, _08113710 @ =gOtherText_YesNoAndPlayer
	adds r2, 0x34
	ldrb r2, [r2]
	adds r2, 0x80
	movs r3, 0x9
	str r3, [sp]
	movs r3, 0x19
	bl InitWindow
	ldr r0, [r5]
	adds r0, 0x4
	bl sub_8002F44
	ldr r1, _08113714 @ =0x0000ffff
	ldr r3, _08113718 @ =0x00002d9f
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0
	movs r2, 0xC
	bl sub_814A5C0
	bl sub_81150D8
	ldr r0, _08113708 @ =gTasks
	mov r3, r9
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r1, 0x18]
	strb r2, [r4, 0x1]
	b _08113B3A
	.align 2, 0
_081136FC: .4byte gUnknown_03004828
_08113700: .4byte gUnknown_08400F8C
_08113704: .4byte gUnknown_020238CC
_08113708: .4byte gTasks
_0811370C: .4byte gUnknown_02024D1E
_08113710: .4byte gOtherText_YesNoAndPlayer
_08113714: .4byte 0x0000ffff
_08113718: .4byte 0x00002d9f
_0811371C:
	ldr r0, _081137CC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08113742
	ldr r4, _081137D0 @ =gUnknown_02024D1E
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _08113742
	movs r0, 0x5
	bl PlaySE
	bl HBlankCB_TradeEvolutionScene
	movs r0, 0
	strb r0, [r4, 0x1]
	bl sub_81150D8
_08113742:
	ldr r0, _081137CC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08113768
	ldr r4, _081137D0 @ =gUnknown_02024D1E
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08113768
	movs r0, 0x5
	bl PlaySE
	bl HBlankCB_TradeEvolutionScene
	movs r0, 0x1
	strb r0, [r4, 0x1]
	bl sub_81150D8
_08113768:
	ldr r0, _081137CC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0811380A
	ldr r4, _081137D4 @ =gUnknown_03004828
	ldr r0, [r4]
	adds r0, 0x4
	movs r1, 0xD
	str r1, [sp]
	movs r1, 0x18
	movs r2, 0x8
	movs r3, 0x1D
	bl ZeroFillWindowRect
	bl sub_814A7FC
	ldr r0, _081137D8 @ =gUnknown_08400F8C
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _081137DC @ =gUnknown_020238CC
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	movs r0, 0x5
	bl PlaySE
	ldr r0, _081137D0 @ =gUnknown_02024D1E
	ldrb r2, [r0, 0x1]
	cmp r2, 0
	beq _081137E4
	ldr r0, _081137E0 @ =gTasks
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1C]
	strh r0, [r1, 0x18]
	b _0811380A
	.align 2, 0
_081137CC: .4byte gMain
_081137D0: .4byte gUnknown_02024D1E
_081137D4: .4byte gUnknown_03004828
_081137D8: .4byte gUnknown_08400F8C
_081137DC: .4byte gUnknown_020238CC
_081137E0: .4byte gTasks
_081137E4:
	ldr r0, _08113868 @ =gTasks
	mov r3, r9
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1A]
	strh r0, [r1, 0x18]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _0811380A
	movs r0, 0x1
	negs r0, r0
	str r2, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0811380A:
	ldr r0, _0811386C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08113818
	b _08113B3A
_08113818:
	ldr r4, _08113870 @ =gUnknown_03004828
	ldr r0, [r4]
	adds r0, 0x4
	movs r1, 0xD
	str r1, [sp]
	movs r1, 0x18
	movs r2, 0x8
	movs r3, 0x1D
	bl ZeroFillWindowRect
	bl sub_814A7FC
	ldr r0, _08113874 @ =gUnknown_08400F8C
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _08113878 @ =gUnknown_020238CC
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08113868 @ =gTasks
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x1C]
	strh r1, [r0, 0x18]
	b _08113B3A
	.align 2, 0
_08113868: .4byte gTasks
_0811386C: .4byte gMain
_08113870: .4byte gUnknown_03004828
_08113874: .4byte gUnknown_08400F8C
_08113878: .4byte gUnknown_020238CC
_0811387C:
	ldr r0, _081138B8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0811388A
	b _08113B3A
_0811388A:
	ldr r0, _081138BC @ =gPlayerParty
	mov r3, r9
	adds r5, r3, r7
	lsls r5, 3
	adds r5, r6
	ldrh r1, [r5, 0x20]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _081138C0 @ =gPlayerPartyCount
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _081138C4 @ =CB2_TradeEvolutionSceneLoadGraphics
	ldr r4, _081138C8 @ =word_2024E82
	ldrh r4, [r4]
	str r4, [sp]
	bl sub_809D9F0
	ldrh r0, [r5, 0x18]
	adds r0, 0x1
	strh r0, [r5, 0x18]
	b _08113B3A
	.align 2, 0
_081138B8: .4byte gPaletteFade
_081138BC: .4byte gPlayerParty
_081138C0: .4byte gPlayerPartyCount
_081138C4: .4byte CB2_TradeEvolutionSceneLoadGraphics
_081138C8: .4byte word_2024E82
_081138CC:
	ldr r0, _08113900 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081138DA
	b _08113B3A
_081138DA:
	ldr r0, _08113904 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _08113908 @ =CB2_EvolutionSceneUpdate_1
	cmp r1, r0
	beq _081138E6
	b _08113B3A
_081138E6:
	bl sub_809FA30
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x4
	bne _08113910
	ldr r0, _0811390C @ =gTasks
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x9
	b _08113B38
	.align 2, 0
_08113900: .4byte gPaletteFade
_08113904: .4byte gMain
_08113908: .4byte CB2_EvolutionSceneUpdate_1
_0811390C: .4byte gTasks
_08113910:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r8
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl sub_8040A00
	cmp r0, 0
	beq _08113970
	ldr r0, _0811395C @ =gUnknown_08400F8C
	ldr r3, _08113960 @ =0x000004cc
	adds r0, r3
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _08113964 @ =gUnknown_03004828
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _08113968 @ =gUnknown_020238CC
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _0811396C @ =gTasks
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0xB
	strh r1, [r0, 0x18]
	b _08113B3A
	.align 2, 0
_0811395C: .4byte gUnknown_08400F8C
_08113960: .4byte 0x000004cc
_08113964: .4byte gUnknown_03004828
_08113968: .4byte gUnknown_020238CC
_0811396C: .4byte gTasks
_08113970:
	ldr r1, _081139D0 @ =gUnknown_03004290
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	strb r4, [r1, 0x2]
	lsrs r0, r4, 8
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	lsls r4, r6, 24
	lsrs r4, 24
	mov r0, r8
	adds r1, r4, 0
	bl RemoveMonPPBonus
	ldr r0, _081139D4 @ =word_2024E82
	ldrh r1, [r0]
	mov r0, r8
	adds r2, r4, 0
	bl SetMonMoveSlot
	ldr r0, _081139D8 @ =gUnknown_08400F8C
	movs r3, 0xCF
	lsls r3, 2
	adds r0, r3
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r0, _081139DC @ =gUnknown_03004828
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _081139E0 @ =gUnknown_020238CC
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _081139E4 @ =gTasks
	mov r2, r9
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08113B38
	.align 2, 0
_081139D0: .4byte gUnknown_03004290
_081139D4: .4byte word_2024E82
_081139D8: .4byte gUnknown_08400F8C
_081139DC: .4byte gUnknown_03004828
_081139E0: .4byte gUnknown_020238CC
_081139E4: .4byte gTasks
_081139E8:
	ldr r4, _08113A2C @ =gUnknown_03004828
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	beq _081139F4
	b _08113B3A
_081139F4:
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08113A00
	b _08113B3A
_08113A00:
	ldr r0, _08113A30 @ =gUnknown_08400F8C
	ldr r0, [r0, 0x1C]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _08113A34 @ =gUnknown_020238CC
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r0, _08113A38 @ =gTasks
	mov r3, r9
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	adds r0, 0x1
	b _08113B38
	.align 2, 0
_08113A2C: .4byte gUnknown_03004828
_08113A30: .4byte gUnknown_08400F8C
_08113A34: .4byte gUnknown_020238CC
_08113A38: .4byte gTasks
_08113A3C:
	ldr r4, _08113A80 @ =gUnknown_03004828
	ldr r0, [r4]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	bne _08113B3A
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08113B3A
	ldr r0, _08113A84 @ =gUnknown_08400F8C
	movs r1, 0xD0
	lsls r1, 2
	adds r0, r1
	ldr r0, [r0]
	bl get_battle_strings_
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _08113A88 @ =gUnknown_020238CC
	adds r2, 0x34
	ldrb r2, [r2]
	movs r4, 0xF
	str r4, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08113A8C @ =gTasks
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x8]
	b _08113B3A
	.align 2, 0
_08113A80: .4byte gUnknown_03004828
_08113A84: .4byte gUnknown_08400F8C
_08113A88: .4byte gUnknown_020238CC
_08113A8C: .4byte gTasks
_08113A90:
	ldr r0, _08113AC8 @ =gUnknown_08400F8C
	ldr r0, [r0, 0x20]
	bl get_battle_strings_
	ldr r0, _08113ACC @ =gUnknown_03004828
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _08113AD0 @ =gUnknown_020238CC
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08113AD4 @ =gTasks
	mov r3, r9
	adds r0, r3, r7
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0xA
	strh r1, [r0, 0x1A]
	strh r2, [r0, 0x1C]
	movs r1, 0x3
	strh r1, [r0, 0x18]
	b _08113B3A
	.align 2, 0
_08113AC8: .4byte gUnknown_08400F8C
_08113ACC: .4byte gUnknown_03004828
_08113AD0: .4byte gUnknown_020238CC
_08113AD4: .4byte gTasks
_08113AD8:
	ldr r0, _08113B08 @ =gUnknown_08400F8C
	ldr r0, [r0, 0x24]
	bl get_battle_strings_
	ldr r0, _08113B0C @ =gUnknown_03004828
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _08113B10 @ =gUnknown_020238CC
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _08113B14 @ =gTasks
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0xD
	strh r1, [r0, 0x8]
	b _08113B3A
	.align 2, 0
_08113B08: .4byte gUnknown_08400F8C
_08113B0C: .4byte gUnknown_03004828
_08113B10: .4byte gUnknown_020238CC
_08113B14: .4byte gTasks
_08113B18:
	ldr r0, _08113B48 @ =gUnknown_03004828
	ldr r0, [r0]
	ldrh r0, [r0, 0x1A]
	cmp r0, 0
	bne _08113B3A
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08113B3A
	ldr r0, _08113B4C @ =gTasks
	mov r3, r9
	adds r1, r3, r7
	lsls r1, 3
	adds r1, r0
	movs r0, 0x5
_08113B38:
	strh r0, [r1, 0x18]
_08113B3A:
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08113B48: .4byte gUnknown_03004828
_08113B4C: .4byte gTasks
	thumb_func_end Task_TradeEvolutionScene

	thumb_func_start unref_sub_8113B50
unref_sub_8113B50: @ 8113B50
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x3C
	str r0, [sp]
	str r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	movs r1, 0
	str r1, [sp, 0x10]
	movs r2, 0
	str r2, [sp, 0x8]
	ldr r3, _08113C60 @ =0x02014800
	mov r12, r3
	ldr r4, _08113C64 @ =0x000018c4
	add r4, r12
	mov r10, r4
	ldr r5, _08113C68 @ =0x000020c4
	add r5, r12
	mov r8, r5
_08113B7C:
	adds r0, r3, 0
	adds r0, 0x84
	ldr r1, [sp, 0x8]
	adds r0, r1, r0
	strb r2, [r0]
	adds r0, r3, 0x4
	adds r0, r1, r0
	strb r2, [r0]
	ldr r4, _08113C6C @ =0x02014844
	adds r0, r1, r4
	strb r2, [r0]
	movs r6, 0
	lsls r1, 5
	mov r9, r1
	ldr r5, [sp, 0x8]
	lsls r4, r5, 6
_08113B9C:
	mov r0, r9
	adds r1, r6, r0
	ldr r5, _08113C70 @ =0x020158c4
	adds r0, r1, r5
	strb r2, [r0]
	mov r5, r10
	adds r0, r1, r5
	strb r2, [r0]
	mov r5, r8
	adds r0, r1, r5
	strb r2, [r0]
	ldr r5, _08113C74 @ =0x020170c4
	adds r0, r1, r5
	strb r2, [r0]
	adds r7, r3, 0
	adds r7, 0xC4
	adds r0, r1, r7
	strb r2, [r0]
	ldr r5, _08113C78 @ =0x000008c4
	adds r0, r3, r5
	adds r0, r1, r0
	strb r2, [r0]
	ldr r5, _08113C7C @ =0x000030c4
	adds r0, r3, r5
	adds r0, r1, r0
	strb r2, [r0]
	ldr r5, _08113C80 @ =0x000038c4
	adds r0, r3, r5
	adds r1, r0
	strb r2, [r1]
	lsls r1, r6, 1
	adds r1, r4
	ldr r5, _08113C84 @ =0x000060c4
	adds r0, r3, r5
	adds r0, r1, r0
	strh r2, [r0]
	ldr r5, _08113C88 @ =0x000070c4
	adds r0, r3, r5
	adds r0, r1, r0
	strh r2, [r0]
	ldr r5, _08113C8C @ =0x000080c4
	adds r0, r3, r5
	adds r0, r1, r0
	strh r2, [r0]
	ldr r5, _08113C90 @ =0x000090c4
	adds r0, r3, r5
	adds r1, r0
	strh r2, [r1]
	adds r6, 0x1
	cmp r6, 0x1F
	ble _08113B9C
	ldr r0, [sp, 0x8]
	adds r0, 0x1
	str r0, [sp, 0x8]
	cmp r0, 0x3F
	ble _08113B7C
	ldr r1, _08113C94 @ =0x0000a0c4
	add r1, r12
	movs r0, 0x40
	strb r0, [r1]
	movs r1, 0
	mov r8, r1
	movs r2, 0
	str r2, [sp, 0x8]
	movs r3, 0x80
	lsls r3, 5
	adds r3, r7
	mov r12, r3
	movs r4, 0xC0
	lsls r4, 5
	adds r4, r7
	mov r9, r4
	movs r5, 0
	adds r4, r7, 0
	subs r4, 0xC0
_08113C32:
	movs r3, 0
	ldr r2, [sp]
	add r2, r8
	movs r6, 0
	ldr r0, [sp, 0x8]
	adds r0, 0x1
	str r0, [sp, 0x30]
	ldr r1, [sp, 0x8]
	lsls r1, 7
	mov r10, r1
	movs r7, 0x1
	negs r7, r7
_08113C4A:
	asrs r0, r6, 1
	lsls r0, 2
	add r0, r10
	ldr r1, _08113C98 @ =0x020188c4
	adds r0, r1
	str r2, [r0]
	cmp r3, 0
	beq _08113C9C
	cmp r3, 0x1
	beq _08113CC6
	b _08113CF4
	.align 2, 0
_08113C60: .4byte 0x02014800
_08113C64: .4byte 0x000018c4
_08113C68: .4byte 0x000020c4
_08113C6C: .4byte 0x02014844
_08113C70: .4byte 0x020158c4
_08113C74: .4byte 0x020170c4
_08113C78: .4byte 0x000008c4
_08113C7C: .4byte 0x000030c4
_08113C80: .4byte 0x000038c4
_08113C84: .4byte 0x000060c4
_08113C88: .4byte 0x000070c4
_08113C8C: .4byte 0x000080c4
_08113C90: .4byte 0x000090c4
_08113C94: .4byte 0x0000a0c4
_08113C98: .4byte 0x020188c4
_08113C9C:
	movs r0, 0x1
	ands r0, r6
	cmp r0, 0
	beq _08113CAA
	cmp r0, 0x1
	beq _08113CB0
	b _08113CF4
_08113CAA:
	ldrb r1, [r2]
	movs r0, 0xF
	b _08113CB4
_08113CB0:
	ldrb r1, [r2]
	movs r0, 0xF0
_08113CB4:
	ands r0, r1
	cmp r0, 0
	beq _08113CF4
	ldrb r0, [r4]
	adds r0, r5
	add r0, r12
	strb r6, [r0]
	movs r3, 0x1
	b _08113CF4
_08113CC6:
	adds r0, r6, 0
	ands r0, r3
	cmp r0, 0
	beq _08113CD4
	cmp r0, 0x1
	beq _08113CDA
	b _08113CF4
_08113CD4:
	ldrb r1, [r2]
	movs r0, 0xF
	b _08113CDE
_08113CDA:
	ldrb r1, [r2]
	movs r0, 0xF0
_08113CDE:
	ands r0, r1
	cmp r0, 0
	bne _08113CF4
	ldrb r0, [r4]
	adds r0, r5
	add r0, r9
	strb r7, [r0]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r3, 0
_08113CF4:
	adds r0, r6, 0x1
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08113D02
	adds r2, 0x1D
	b _08113D0C
_08113D02:
	movs r0, 0x1
	ands r0, r6
	cmp r0, 0
	beq _08113D0C
	adds r2, 0x1
_08113D0C:
	adds r7, 0x1
	adds r6, 0x1
	cmp r6, 0x3F
	ble _08113C4A
	cmp r3, 0
	beq _08113D26
	ldrb r0, [r4]
	adds r0, r5
	add r0, r9
	strb r6, [r0]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_08113D26:
	movs r0, 0x7
	ldr r2, [sp, 0x30]
	ands r2, r0
	cmp r2, 0
	bne _08113D36
	movs r3, 0xE4
	add r8, r3
	b _08113D3A
_08113D36:
	movs r0, 0x4
	add r8, r0
_08113D3A:
	adds r5, 0x20
	adds r4, 0x1
	ldr r1, [sp, 0x8]
	adds r1, 0x1
	str r1, [sp, 0x8]
	cmp r1, 0x3F
	bgt _08113D4A
	b _08113C32
_08113D4A:
	movs r2, 0
	mov r8, r2
	movs r3, 0
	str r3, [sp, 0x8]
	ldr r0, _08113D84 @ =0x02014844
	movs r4, 0x82
	lsls r4, 6
	adds r4, r0
	mov r10, r4
	movs r5, 0xA2
	lsls r5, 6
	adds r7, r0, r5
	movs r5, 0
	adds r4, r0, 0
	movs r0, 0x1
	mov r9, r0
_08113D6A:
	movs r3, 0
	ldr r2, [sp, 0x4]
	add r2, r8
	movs r6, 0
	ldr r1, [sp, 0x8]
	adds r1, 0x1
	str r1, [sp, 0x30]
_08113D78:
	cmp r3, 0
	beq _08113D88
	cmp r3, 0x1
	beq _08113DB4
	b _08113DE4
	.align 2, 0
_08113D84: .4byte 0x02014844
_08113D88:
	adds r0, r6, 0
	mov r1, r9
	ands r0, r1
	cmp r0, 0
	beq _08113D98
	cmp r0, 0x1
	beq _08113D9E
	b _08113DE4
_08113D98:
	ldrb r1, [r2]
	movs r0, 0xF
	b _08113DA2
_08113D9E:
	ldrb r1, [r2]
	movs r0, 0xF0
_08113DA2:
	ands r0, r1
	cmp r0, 0
	beq _08113DE4
	ldrb r0, [r4]
	adds r0, r5
	add r0, r10
	strb r6, [r0]
	movs r3, 0x1
	b _08113DE4
_08113DB4:
	adds r0, r6, 0
	ands r0, r3
	cmp r0, 0
	beq _08113DC2
	cmp r0, 0x1
	beq _08113DC8
	b _08113DE4
_08113DC2:
	ldrb r1, [r2]
	movs r0, 0xF
	b _08113DCC
_08113DC8:
	ldrb r1, [r2]
	movs r0, 0xF0
_08113DCC:
	ands r0, r1
	cmp r0, 0
	bne _08113DE4
	ldrb r0, [r4]
	adds r0, r5
	adds r0, r7
	subs r1, r6, 0x1
	strb r1, [r0]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r3, 0
_08113DE4:
	adds r1, r6, 0x1
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08113DF2
	adds r2, 0x1D
	b _08113DFC
_08113DF2:
	mov r0, r9
	ands r6, r0
	cmp r6, 0
	beq _08113DFC
	adds r2, 0x1
_08113DFC:
	adds r6, r1, 0
	cmp r6, 0x3F
	ble _08113D78
	cmp r3, 0
	beq _08113E14
	ldrb r0, [r4]
	adds r0, r5
	adds r0, r7
	strb r6, [r0]
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
_08113E14:
	movs r0, 0x7
	ldr r1, [sp, 0x30]
	ands r1, r0
	cmp r1, 0
	bne _08113E24
	movs r2, 0xE4
	add r8, r2
	b _08113E28
_08113E24:
	movs r3, 0x4
	add r8, r3
_08113E28:
	adds r5, 0x20
	adds r4, 0x1
	ldr r0, [sp, 0x8]
	adds r0, 0x1
	str r0, [sp, 0x8]
	cmp r0, 0x3F
	ble _08113D6A
	movs r1, 0
	str r1, [sp, 0x8]
_08113E3A:
	ldr r3, [sp, 0x8]
	ldr r4, _08113EBC @ =0x02014804
	adds r2, r3, r4
	ldr r5, _08113EC0 @ =0x02014844
	adds r1, r3, r5
	ldrb r0, [r2]
	adds r3, 0x1
	str r3, [sp, 0x30]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08113E52
	b _08113F9E
_08113E52:
	movs r0, 0
	str r0, [sp, 0xC]
	ldrb r2, [r2]
	cmp r0, r2
	bge _08113F54
	ldr r0, _08113EC4 @ =0x02014800
	adds r0, 0x4
	ldr r1, [sp, 0x8]
	adds r0, r1, r0
	str r0, [sp, 0x18]
_08113E66:
	movs r2, 0x80
	lsls r2, 1
	str r2, [sp, 0x14]
	movs r6, 0
	ldr r3, [sp, 0x8]
	ldr r4, _08113EC0 @ =0x02014844
	adds r0, r3, r4
	ldr r5, [sp, 0xC]
	adds r5, 0x1
	str r5, [sp, 0x34]
	ldrb r0, [r0]
	cmp r6, r0
	bge _08113F3E
	ldr r0, _08113EC4 @ =0x02014800
	mov r10, r0
	lsls r0, r3, 5
	ldr r2, [sp, 0xC]
	adds r1, r2, r0
	mov r9, r0
	ldr r0, _08113EC4 @ =0x02014800
	adds r0, 0xC4
	mov r3, r9
	adds r7, r3, r0
	mov r5, r9
	ldr r4, _08113EC4 @ =0x02014800
	ldr r2, _08113EC8 @ =0x000010c4
	adds r0, r4, r2
	adds r1, r0
	mov r8, r1
	ldrb r3, [r1]
	str r3, [sp, 0x1C]
_08113EA4:
	ldr r0, _08113ECC @ =0x000020c4
	add r0, r10
	adds r0, r5, r0
	ldr r4, [sp, 0x1C]
	ldrb r1, [r0]
	cmp r4, r1
	bls _08113ED0
	mov r2, r8
	ldrb r1, [r2]
	ldrb r0, [r0]
	b _08113ED6
	.align 2, 0
_08113EBC: .4byte 0x02014804
_08113EC0: .4byte 0x02014844
_08113EC4: .4byte 0x02014800
_08113EC8: .4byte 0x000010c4
_08113ECC: .4byte 0x000020c4
_08113ED0:
	ldrb r1, [r0]
	mov r3, r8
	ldrb r0, [r3]
_08113ED6:
	subs r3, r1, r0
	ldr r1, [sp, 0xC]
	add r1, r9
	ldr r0, _08113EFC @ =0x000018c4
	add r0, r10
	adds r4, r1, r0
	ldr r0, _08113F00 @ =0x000028c4
	add r0, r10
	adds r2, r5, r0
	ldrb r0, [r4]
	ldr r1, _08113F04 @ =0x02014800
	mov r12, r1
	ldrb r1, [r2]
	cmp r0, r1
	bls _08113F08
	adds r1, r0, 0
	ldrb r0, [r2]
	b _08113F0C
	.align 2, 0
_08113EFC: .4byte 0x000018c4
_08113F00: .4byte 0x000028c4
_08113F04: .4byte 0x02014800
_08113F08:
	ldrb r1, [r2]
	ldrb r0, [r4]
_08113F0C:
	subs r1, r0
	adds r3, r1
	ldr r2, [sp, 0x14]
	cmp r2, r3
	ble _08113F2C
	ldrb r0, [r7]
	cmp r0, 0
	bne _08113F2C
	ldr r0, _08114050 @ =0x000008c4
	add r0, r12
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08113F2C
	str r6, [sp, 0x10]
	str r3, [sp, 0x14]
_08113F2C:
	adds r7, 0x1
	adds r5, 0x1
	adds r6, 0x1
	ldr r3, [sp, 0x8]
	ldr r4, _08114054 @ =0x02014844
	adds r0, r3, r4
	ldrb r0, [r0]
	cmp r6, r0
	blt _08113EA4
_08113F3E:
	ldr r0, [sp, 0xC]
	ldr r1, [sp, 0x10]
	ldr r2, [sp, 0x8]
	bl sub_81141F0
	ldr r5, [sp, 0x34]
	str r5, [sp, 0xC]
	ldr r0, [sp, 0x18]
	ldrb r0, [r0]
	cmp r5, r0
	blt _08113E66
_08113F54:
	movs r6, 0
	ldr r2, _08114058 @ =0x02014800
	ldr r1, [sp, 0x8]
	ldr r3, _08114054 @ =0x02014844
	adds r0, r1, r3
	adds r4, r2, 0
	mov r12, r4
	ldrb r0, [r0]
	cmp r6, r0
	bge _08113F9E
	mov r0, r12
	adds r0, 0x44
	adds r4, r1, r0
_08113F6E:
	ldr r5, [sp, 0x8]
	lsls r0, r5, 5
	adds r1, r6, r0
	adds r0, r2, 0
	adds r0, 0xC4
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08113F94
	ldr r3, _08114050 @ =0x000008c4
	adds r0, r2, r3
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08113F94
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_811430C
_08113F94:
	adds r6, 0x1
	ldr r2, _08114058 @ =0x02014800
	ldrb r5, [r4]
	cmp r6, r5
	blt _08113F6E
_08113F9E:
	ldr r0, [sp, 0x8]
	ldr r1, _0811405C @ =0x02014804
	adds r2, r0, r1
	ldr r3, _08114054 @ =0x02014844
	adds r1, r0, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08113FCC
	movs r6, 0
	ldrb r4, [r2]
	cmp r6, r4
	bge _08113FCC
	adds r4, r2, 0
_08113FBA:
	adds r0, r6, 0
	adds r1, r6, 0
	ldr r2, [sp, 0x8]
	bl sub_81141F0
	adds r6, 0x1
	ldrb r5, [r4]
	cmp r6, r5
	blt _08113FBA
_08113FCC:
	ldr r0, [sp, 0x8]
	ldr r1, _0811405C @ =0x02014804
	adds r2, r0, r1
	ldr r3, _08114054 @ =0x02014844
	adds r1, r0, r3
	ldrb r0, [r2]
	ldr r4, _08114058 @ =0x02014800
	ldrb r5, [r1]
	cmp r0, r5
	bhi _08113FE2
	b _081141C4
_08113FE2:
	movs r0, 0
	str r0, [sp, 0x10]
	ldrb r1, [r1]
	cmp r0, r1
	blt _08113FEE
	b _08114104
_08113FEE:
	str r2, [sp, 0x2C]
	ldr r1, [sp, 0x8]
	lsls r1, 5
	mov r9, r1
	adds r0, r4, 0
	adds r0, 0x44
	ldr r2, [sp, 0x8]
	adds r0, r2, r0
	str r0, [sp, 0x20]
	mov r3, r9
	str r3, [sp, 0x24]
_08114004:
	movs r4, 0x80
	lsls r4, 1
	str r4, [sp, 0x14]
	movs r6, 0
	ldr r5, [sp, 0x10]
	adds r5, 0x1
	str r5, [sp, 0x38]
	ldr r0, [sp, 0x2C]
	ldrb r0, [r0]
	cmp r6, r0
	bge _081140C4
	ldr r1, [sp, 0x10]
	ldr r2, [sp, 0x24]
	adds r1, r2
	mov r10, r1
	ldr r0, _08114058 @ =0x02014800
	adds r0, 0xC4
	adds r2, r0
	mov r8, r2
	ldr r7, [sp, 0x24]
	ldr r3, _08114058 @ =0x02014800
	ldr r4, _08114060 @ =0x000010c4
	adds r0, r3, r4
	adds r5, r7, r0
	ldr r0, _08114064 @ =0x020168c4
	add r0, r10
	mov r12, r0
	ldrb r1, [r0]
	str r1, [sp, 0x28]
_0811403E:
	ldrb r0, [r5]
	ldr r2, [sp, 0x28]
	cmp r0, r2
	bls _08114068
	adds r1, r0, 0
	mov r3, r12
	ldrb r0, [r3]
	b _0811406E
	.align 2, 0
_08114050: .4byte 0x000008c4
_08114054: .4byte 0x02014844
_08114058: .4byte 0x02014800
_0811405C: .4byte 0x02014804
_08114060: .4byte 0x000010c4
_08114064: .4byte 0x020168c4
_08114068:
	mov r4, r12
	ldrb r1, [r4]
	ldrb r0, [r5]
_0811406E:
	subs r3, r1, r0
	ldr r1, _0811408C @ =0x02014800
	ldr r2, _08114090 @ =0x000018c4
	adds r0, r1, r2
	adds r4, r7, r0
	ldr r2, _08114094 @ =0x020170c4
	add r2, r10
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bls _08114098
	adds r1, r0, 0
	ldrb r0, [r2]
	b _0811409C
	.align 2, 0
_0811408C: .4byte 0x02014800
_08114090: .4byte 0x000018c4
_08114094: .4byte 0x020170c4
_08114098:
	ldrb r1, [r2]
	ldrb r0, [r4]
_0811409C:
	subs r1, r0
	adds r3, r1
	ldr r2, [sp, 0x14]
	cmp r2, r3
	ble _081140B2
	mov r4, r8
	ldrb r0, [r4]
	cmp r0, 0
	bne _081140B2
	str r6, [sp, 0xC]
	str r3, [sp, 0x14]
_081140B2:
	movs r0, 0x1
	add r8, r0
	adds r7, 0x1
	adds r5, 0x1
	adds r6, 0x1
	ldr r1, [sp, 0x2C]
	ldrb r1, [r1]
	cmp r6, r1
	blt _0811403E
_081140C4:
	ldr r3, [sp, 0xC]
	add r3, r9
	ldr r2, _08114164 @ =0x02014800
	ldr r4, _08114168 @ =0x000030c4
	adds r1, r2, r4
	adds r1, r3, r1
	ldr r2, [sp, 0x10]
	add r2, r9
	ldr r5, _0811416C @ =0x020168c4
	adds r0, r2, r5
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08114164 @ =0x02014800
	ldr r4, _08114170 @ =0x000038c4
	adds r1, r0, r4
	adds r1, r3, r1
	ldr r5, _08114174 @ =0x020170c4
	adds r2, r5
	ldrb r0, [r2]
	strb r0, [r1]
	ldr r0, _08114164 @ =0x02014800
	adds r0, 0xC4
	adds r3, r0
	movs r0, 0x1
	strb r0, [r3]
	ldr r0, [sp, 0x38]
	str r0, [sp, 0x10]
	ldr r1, [sp, 0x20]
	ldrb r1, [r1]
	cmp r0, r1
	bge _08114104
	b _08114004
_08114104:
	movs r6, 0
	ldr r4, _08114164 @ =0x02014800
	ldr r2, [sp, 0x8]
	ldr r3, _08114178 @ =0x02014804
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r6, r0
	bge _081141C4
	adds r7, r4, 0
	mov r9, r6
	movs r5, 0xC4
	adds r5, r7
	mov r8, r5
_0811411E:
	ldr r1, [sp, 0x8]
	lsls r0, r1, 5
	adds r2, r6, r0
	ldr r3, _0811417C @ =0x000020c4
	adds r0, r7, r3
	adds r0, r2
	mov r10, r0
	ldr r5, _08114168 @ =0x000030c4
	adds r0, r7, r5
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, r10
	strb r0, [r1]
	ldr r3, _08114180 @ =0x000028c4
	adds r0, r7, r3
	adds r3, r2, r0
	ldr r5, _08114170 @ =0x000038c4
	adds r0, r7, r5
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r3]
	mov r0, r8
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _08114184
	mov r2, r9
	strb r2, [r1]
	adds r0, r6, 0
	adds r1, r6, 0
	ldr r2, [sp, 0x8]
	bl sub_81141F0
	b _081141B4
	.align 2, 0
_08114164: .4byte 0x02014800
_08114168: .4byte 0x000030c4
_0811416C: .4byte 0x020168c4
_08114170: .4byte 0x000038c4
_08114174: .4byte 0x020170c4
_08114178: .4byte 0x02014804
_0811417C: .4byte 0x000020c4
_08114180: .4byte 0x000028c4
_08114184:
	ldr r5, _081141E0 @ =0x000010c4
	adds r1, r4, r5
	adds r1, r2, r1
	ldr r5, _081141E4 @ =0x000018c4
	adds r0, r4, r5
	adds r0, r2, r0
	ldrb r0, [r0]
	ldrb r2, [r1]
	subs r0, r2
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r2, r0
	strb r2, [r3]
	mov r0, r10
	strb r2, [r0]
	ldrb r0, [r3]
	subs r0, 0x1
	strb r0, [r3]
	adds r0, r6, 0
	adds r1, r6, 0
	ldr r2, [sp, 0x8]
	bl sub_81141F0
_081141B4:
	adds r6, 0x1
	ldr r4, _081141E8 @ =0x02014800
	ldr r1, [sp, 0x8]
	ldr r2, _081141EC @ =0x02014804
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r6, r0
	blt _0811411E
_081141C4:
	ldr r3, [sp, 0x30]
	str r3, [sp, 0x8]
	cmp r3, 0x3F
	bgt _081141CE
	b _08113E3A
_081141CE:
	add sp, 0x3C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081141E0: .4byte 0x000010c4
_081141E4: .4byte 0x000018c4
_081141E8: .4byte 0x02014800
_081141EC: .4byte 0x02014804
	thumb_func_end unref_sub_8113B50

	thumb_func_start sub_81141F0
sub_81141F0: @ 81141F0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	mov r8, r1
	mov r9, r2
	ldr r3, _0811424C @ =0x02014800
	lsls r1, r2, 5
	mov r0, r8
	adds r4, r0, r1
	ldr r5, _08114250 @ =0x000030c4
	adds r2, r3, r5
	adds r2, r4, r2
	adds r1, r6, r1
	ldr r7, _08114254 @ =0x000010c4
	adds r0, r3, r7
	adds r5, r1, r0
	ldrb r0, [r5]
	strb r0, [r2]
	ldr r0, _08114258 @ =0x000038c4
	adds r2, r3, r0
	adds r2, r4, r2
	ldr r7, _0811425C @ =0x000018c4
	adds r0, r3, r7
	adds r1, r0
	ldrb r0, [r1]
	strb r0, [r2]
	movs r7, 0
	ldr r1, _08114260 @ =0x000020c4
	adds r0, r3, r1
	adds r2, r4, r0
	ldrb r1, [r5]
	ldrb r0, [r2]
	mov r12, r3
	cmp r1, r0
	bcs _08114264
	mov r0, r12
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0x4
	strb r1, [r0]
	ldrb r1, [r2]
	ldrb r0, [r5]
	b _08114276
	.align 2, 0
_0811424C: .4byte 0x02014800
_08114250: .4byte 0x000030c4
_08114254: .4byte 0x000010c4
_08114258: .4byte 0x000038c4
_0811425C: .4byte 0x000018c4
_08114260: .4byte 0x000020c4
_08114264:
	cmp r1, r0
	bls _08114278
	mov r0, r12
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0x1
	strb r1, [r0]
	ldrb r1, [r5]
	ldrb r0, [r2]
_08114276:
	subs r7, r1, r0
_08114278:
	mov r5, r8
	lsls r3, r5, 1
	mov r0, r9
	lsls r4, r0, 6
	adds r0, r3, r4
	ldr r1, _081142BC @ =0x000080c4
	add r1, r12
	adds r0, r1
	lsls r1, r7, 4
	strh r1, [r0]
	movs r7, 0
	mov r1, r9
	lsls r2, r1, 5
	adds r1, r6, r2
	ldr r0, _081142C0 @ =0x000018c4
	add r0, r12
	adds r6, r1, r0
	adds r1, r5, r2
	ldr r0, _081142C4 @ =0x000028c4
	add r0, r12
	adds r5, r1, r0
	ldrb r2, [r6]
	ldrb r0, [r5]
	cmp r2, r0
	bcs _081142CC
	ldr r0, _081142C8 @ =0x000008c4
	add r0, r12
	adds r0, r1, r0
	movs r1, 0x3
	strb r1, [r0]
	ldrb r1, [r5]
	ldrb r0, [r6]
	b _081142DE
	.align 2, 0
_081142BC: .4byte 0x000080c4
_081142C0: .4byte 0x000018c4
_081142C4: .4byte 0x000028c4
_081142C8: .4byte 0x000008c4
_081142CC:
	cmp r2, r0
	bls _081142E0
	ldr r0, _08114304 @ =0x000008c4
	add r0, r12
	adds r0, r1, r0
	movs r1, 0x2
	strb r1, [r0]
	ldrb r1, [r6]
	ldrb r0, [r5]
_081142DE:
	subs r7, r1, r0
_081142E0:
	adds r0, r3, r4
	ldr r1, _08114308 @ =0x000090c4
	add r1, r12
	adds r0, r1
	lsls r1, r7, 4
	strh r1, [r0]
	mov r1, r12
	adds r1, 0x84
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08114304: .4byte 0x000008c4
_08114308: .4byte 0x000090c4
	thumb_func_end sub_81141F0

	thumb_func_start sub_811430C
sub_811430C: @ 811430C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r5, _081143AC @ =0x02014800
	lsls r4, r1, 5
	adds r4, r0, r4
	ldr r2, _081143B0 @ =0x000028c4
	adds r2, r5
	mov r10, r2
	add r10, r4
	mov r3, r10
	ldrb r2, [r3]
	ldr r6, _081143B4 @ =0x000020c4
	adds r6, r5
	mov r8, r6
	add r8, r4
	mov r6, r8
	ldrb r3, [r6]
	subs r7, r2, r3
	ldr r2, _081143B8 @ =0x000030c4
	adds r6, r5, r2
	adds r6, r4, r6
	ldr r2, _081143BC @ =0x000038c4
	adds r2, r5
	mov r9, r2
	add r9, r4
	lsrs r2, r7, 31
	adds r2, r7, r2
	asrs r2, 1
	adds r3, r2
	mov r2, r9
	strb r3, [r2]
	strb r3, [r6]
	adds r2, r5, 0
	adds r2, 0xC4
	adds r2, r4, r2
	movs r3, 0x5
	strb r3, [r2]
	ldr r3, _081143C0 @ =0x000008c4
	adds r2, r5, r3
	adds r4, r2
	movs r2, 0x7
	strb r2, [r4]
	adds r3, r5, 0
	adds r3, 0x84
	adds r3, r1, r3
	ldrb r2, [r3]
	adds r2, 0x1
	strb r2, [r3]
	ldrb r3, [r6]
	mov r4, r8
	ldrb r2, [r4]
	subs r7, r3, r2
	lsls r0, 1
	lsls r1, 6
	adds r0, r1
	ldr r6, _081143C4 @ =0x000080c4
	adds r1, r5, r6
	adds r1, r0, r1
	lsls r2, r7, 4
	strh r2, [r1]
	mov r1, r10
	ldrb r2, [r1]
	mov r3, r9
	ldrb r1, [r3]
	subs r7, r2, r1
	ldr r4, _081143C8 @ =0x000090c4
	adds r5, r4
	adds r0, r5
	lsls r1, r7, 4
	strh r1, [r0]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081143AC: .4byte 0x02014800
_081143B0: .4byte 0x000028c4
_081143B4: .4byte 0x000020c4
_081143B8: .4byte 0x000030c4
_081143BC: .4byte 0x000038c4
_081143C0: .4byte 0x000008c4
_081143C4: .4byte 0x000080c4
_081143C8: .4byte 0x000090c4
	thumb_func_end sub_811430C

	thumb_func_start unref_sub_81143CC
unref_sub_81143CC: @ 81143CC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	movs r0, 0x1
	str r0, [sp, 0x4]
	ldr r0, _08114408 @ =0x02014800
	ldr r2, _0811440C @ =0x0000a0c4
	adds r1, r0, r2
	ldrb r3, [r1]
	adds r4, r0, 0
	cmp r3, 0
	beq _081143EE
	subs r0, r3, 0x1
	strb r0, [r1]
_081143EE:
	movs r5, 0
	str r5, [sp]
_081143F2:
	movs r3, 0
	adds r2, r4, 0
	adds r0, r4, 0
	adds r0, 0x84
	ldr r1, [sp]
	adds r0, r1, r0
	adds r1, 0x1
	str r1, [sp, 0x8]
	bl _08114D84
	.align 2, 0
_08114408: .4byte 0x02014800
_0811440C: .4byte 0x0000a0c4
_08114410:
	ldr r5, [sp]
	lsls r0, r5, 5
	adds r1, r3, r0
	adds r2, 0xC4
	adds r1, r2
	ldrb r2, [r1]
	mov r8, r0
	adds r0, r3, 0x1
	mov r10, r0
	cmp r2, 0xC
	bls _08114428
	b _081148D2
_08114428:
	lsls r0, r2, 2
	ldr r1, _08114434 @ =_08114438
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08114434: .4byte _08114438
	.align 2, 0
_08114438:
	.4byte _081148D2
	.4byte _0811446C
	.4byte _081144F0
	.4byte _0811457C
	.4byte _08114600
	.4byte _0811468C
	.4byte _081146C8
	.4byte _08114704
	.4byte _08114740
	.4byte _0811477C
	.4byte _081147D0
	.4byte _08114810
	.4byte _08114858
_0811446C:
	movs r1, 0
	str r1, [sp, 0x4]
	lsls r0, r3, 1
	ldr r2, [sp]
	lsls r1, r2, 6
	adds r0, r1
	ldr r5, _081144E0 @ =0x000060c4
	adds r2, r4, r5
	adds r2, r0, r2
	ldr r5, _081144E4 @ =0x000080c4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	adds r1, r3, 0x1
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r2, r5
	blt _081144A6
	b _081148D2
_081144A6:
	mov r9, r4
	mov r4, r8
	adds r7, r3, r4
	ldr r0, _081144E8 @ =0x000030c4
	add r0, r9
	adds r4, r7, r0
	ldr r0, _081144EC @ =0x000020c4
	add r0, r9
	adds r2, r7, r0
_081144B8:
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldrb r0, [r4]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	ldrb r1, [r2]
	cmp r0, r1
	bne _081144D8
	b _081148A0
_081144D8:
	adds r6, 0x1
	cmp r6, r5
	blt _081144B8
	b _081148D2
	.align 2, 0
_081144E0: .4byte 0x000060c4
_081144E4: .4byte 0x000080c4
_081144E8: .4byte 0x000030c4
_081144EC: .4byte 0x000020c4
_081144F0:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r4, _08114568 @ =0x02014800
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _0811456C @ =0x000060c4
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114570 @ =0x000080c4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	adds r1, r3, 0x1
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r2, r5
	blt _0811452C
	b _081148D2
_0811452C:
	mov r9, r4
	mov r4, r8
	adds r7, r3, r4
	ldr r0, _08114574 @ =0x000030c4
	add r0, r9
	adds r4, r7, r0
	ldr r0, _08114578 @ =0x000020c4
	add r0, r9
	adds r2, r7, r0
_0811453E:
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114548
	b _081148B8
_08114548:
	adds r1, r0, 0
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DF0
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	adds r6, 0x1
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	cmp r6, r5
	blt _0811453E
	b _081148D2
	.align 2, 0
_08114568: .4byte 0x02014800
_0811456C: .4byte 0x000060c4
_08114570: .4byte 0x000080c4
_08114574: .4byte 0x000030c4
_08114578: .4byte 0x000020c4
_0811457C:
	movs r2, 0
	str r2, [sp, 0x4]
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _081145F0 @ =0x000060c4
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _081145F4 @ =0x000080c4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	adds r1, r3, 0x1
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r2, r5
	blt _081145B6
	b _081148D2
_081145B6:
	mov r9, r4
	mov r4, r8
	adds r7, r3, r4
	ldr r0, _081145F8 @ =0x000030c4
	add r0, r9
	adds r4, r7, r0
	ldr r0, _081145FC @ =0x000020c4
	add r0, r9
	adds r2, r7, r0
_081145C8:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldrb r0, [r4]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	ldrb r1, [r2]
	cmp r0, r1
	bne _081145E8
	b _081148AC
_081145E8:
	adds r6, 0x1
	cmp r6, r5
	blt _081145C8
	b _081148D2
	.align 2, 0
_081145F0: .4byte 0x000060c4
_081145F4: .4byte 0x000080c4
_081145F8: .4byte 0x000030c4
_081145FC: .4byte 0x000020c4
_08114600:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r4, _08114678 @ =0x02014800
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _0811467C @ =0x000060c4
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114680 @ =0x000080c4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	adds r1, r3, 0x1
	mov r10, r1
	ldr r2, [sp, 0x4]
	cmp r2, r5
	blt _0811463C
	b _081148D2
_0811463C:
	mov r9, r4
	mov r4, r8
	adds r7, r3, r4
	ldr r0, _08114684 @ =0x000030c4
	add r0, r9
	adds r4, r7, r0
	ldr r0, _08114688 @ =0x000020c4
	add r0, r9
	adds r2, r7, r0
_0811464E:
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114658
	b _081148B8
_08114658:
	adds r1, r0, 0
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DF0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r6, 0x1
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	cmp r6, r5
	blt _0811464E
	b _081148D2
	.align 2, 0
_08114678: .4byte 0x02014800
_0811467C: .4byte 0x000060c4
_08114680: .4byte 0x000080c4
_08114684: .4byte 0x000030c4
_08114688: .4byte 0x000020c4
_0811468C:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r5, _081146C0 @ =0x02014800
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _081146C4 @ =0x000030c4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114E48
	lsls r0, 24
	ldr r3, [sp, 0x10]
	adds r2, r3, 0x1
	mov r10, r2
	cmp r0, 0
	bne _081146B4
	b _081148D2
_081146B4:
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0x9
	strb r1, [r0]
	b _081148D2
	.align 2, 0
_081146C0: .4byte 0x02014800
_081146C4: .4byte 0x000030c4
_081146C8:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _081146FC @ =0x02014800
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114700 @ =0x000030c4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114E48
	lsls r0, 24
	ldr r3, [sp, 0x10]
	adds r2, r3, 0x1
	mov r10, r2
	cmp r0, 0
	bne _081146F0
	b _081148D2
_081146F0:
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0xA
	strb r1, [r0]
	b _081148D2
	.align 2, 0
_081146FC: .4byte 0x02014800
_08114700: .4byte 0x000030c4
_08114704:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114738 @ =0x02014800
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _0811473C @ =0x000030c4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114E48
	lsls r0, 24
	ldr r3, [sp, 0x10]
	adds r2, r3, 0x1
	mov r10, r2
	cmp r0, 0
	bne _0811472C
	b _081148D2
_0811472C:
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0xB
	strb r1, [r0]
	b _081148D2
	.align 2, 0
_08114738: .4byte 0x02014800
_0811473C: .4byte 0x000030c4
_08114740:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114774 @ =0x02014800
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114778 @ =0x000030c4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114E48
	lsls r0, 24
	ldr r3, [sp, 0x10]
	adds r2, r3, 0x1
	mov r10, r2
	cmp r0, 0
	bne _08114768
	b _081148D2
_08114768:
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r4, r0
	movs r1, 0xC
	strb r1, [r0]
	b _081148D2
	.align 2, 0
_08114774: .4byte 0x02014800
_08114778: .4byte 0x000030c4
_0811477C:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r6, _081147B4 @ =0x02014800
	mov r0, r8
	adds r5, r3, r0
	ldr r1, _081147B8 @ =0x000030c4
	adds r4, r6, r1
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldr r2, _081147BC @ =0x000020c4
	adds r0, r6, r2
	adds r0, r5, r0
	ldrb r1, [r4]
	ldr r3, [sp, 0x10]
	ldrb r0, [r0]
	cmp r1, r0
	bne _081147C0
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	mov r4, sp
	ldrb r4, [r4, 0x4]
	strb r4, [r0]
	b _08114844
	.align 2, 0
_081147B4: .4byte 0x02014800
_081147B8: .4byte 0x000030c4
_081147BC: .4byte 0x000020c4
_081147C0:
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	movs r1, 0x1
	strb r1, [r0]
	adds r0, r3, 0x1
	mov r10, r0
	b _081148D2
_081147D0:
	movs r1, 0
	str r1, [sp, 0x4]
	ldr r6, _08114804 @ =0x02014800
	mov r2, r8
	adds r5, r3, r2
	ldr r0, _08114808 @ =0x000030c4
	adds r4, r6, r0
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114DF0
	ldr r1, _0811480C @ =0x000020c4
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldr r3, [sp, 0x10]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08114882
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	movs r1, 0x2
	b _08114842
	.align 2, 0
_08114804: .4byte 0x02014800
_08114808: .4byte 0x000030c4
_0811480C: .4byte 0x000020c4
_08114810:
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r6, _0811484C @ =0x02014800
	mov r1, r8
	adds r5, r3, r1
	ldr r2, _08114850 @ =0x000030c4
	adds r4, r6, r2
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldr r1, _08114854 @ =0x000020c4
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldr r3, [sp, 0x10]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08114882
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	movs r1, 0x3
_08114842:
	strb r1, [r0]
_08114844:
	adds r5, r3, 0x1
	mov r10, r5
	b _081148D2
	.align 2, 0
_0811484C: .4byte 0x02014800
_08114850: .4byte 0x000030c4
_08114854: .4byte 0x000020c4
_08114858:
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r6, _08114894 @ =0x02014800
	mov r1, r8
	adds r5, r3, r1
	ldr r2, _08114898 @ =0x000030c4
	adds r4, r6, r2
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	str r3, [sp, 0x10]
	bl sub_8114DF0
	ldr r1, _0811489C @ =0x000020c4
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldr r3, [sp, 0x10]
	ldrb r0, [r0]
	cmp r1, r0
	bne _081148C4
_08114882:
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	mov r2, sp
	ldrb r2, [r2, 0x4]
	strb r2, [r0]
	adds r4, r3, 0x1
	mov r10, r4
	b _081148D2
	.align 2, 0
_08114894: .4byte 0x02014800
_08114898: .4byte 0x000030c4
_0811489C: .4byte 0x000020c4
_081148A0:
	mov r0, r9
	adds r0, 0xC4
	adds r0, r7, r0
	movs r5, 0
	strb r5, [r0]
	b _081148D2
_081148AC:
	mov r0, r9
	adds r0, 0xC4
	adds r0, r7, r0
	movs r1, 0
	strb r1, [r0]
	b _081148D2
_081148B8:
	mov r0, r9
	adds r0, 0xC4
	adds r0, r7, r0
	movs r1, 0
	strb r1, [r0]
	b _081148D2
_081148C4:
	adds r0, r6, 0
	adds r0, 0xC4
	adds r0, r5, r0
	movs r1, 0x4
	strb r1, [r0]
	adds r2, r3, 0x1
	mov r10, r2
_081148D2:
	ldr r0, _081148F4 @ =0x02014800
	mov r4, r8
	adds r1, r3, r4
	ldr r5, _081148F8 @ =0x000008c4
	adds r2, r0, r5
	adds r1, r2
	ldrb r1, [r1]
	adds r4, r0, 0
	cmp r1, 0xC
	bls _081148E8
	b _08114D76
_081148E8:
	lsls r0, r1, 2
	ldr r1, _081148FC @ =_08114900
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081148F4: .4byte 0x02014800
_081148F8: .4byte 0x000008c4
_081148FC: .4byte _08114900
	.align 2, 0
_08114900:
	.4byte _08114D76
	.4byte _08114934
	.4byte _081149B8
	.4byte _08114A3C
	.4byte _08114AC0
	.4byte _08114B44
	.4byte _08114B7C
	.4byte _08114BB4
	.4byte _08114BEC
	.4byte _08114C24
	.4byte _08114C78
	.4byte _08114CB8
	.4byte _08114CF8
_08114934:
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r0, r3, 1
	ldr r2, [sp]
	lsls r1, r2, 6
	adds r0, r1
	ldr r5, _081149A8 @ =0x000070c4
	adds r2, r4, r5
	adds r2, r0, r2
	ldr r5, _081149AC @ =0x000090c4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	ldr r1, [sp, 0x4]
	cmp r1, r5
	blt _0811496A
	b _08114D76
_0811496A:
	mov r9, r4
	mov r2, r8
	adds r7, r3, r2
	ldr r0, _081149B0 @ =0x000038c4
	add r0, r9
	adds r4, r7, r0
	movs r3, 0
	ldr r0, _081149B4 @ =0x000028c4
	add r0, r9
	adds r2, r7, r0
_0811497E:
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldrb r0, [r4]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0811499E
	b _08114D4C
_0811499E:
	adds r6, 0x1
	cmp r6, r5
	blt _0811497E
	b _08114D76
	.align 2, 0
_081149A8: .4byte 0x000070c4
_081149AC: .4byte 0x000090c4
_081149B0: .4byte 0x000038c4
_081149B4: .4byte 0x000028c4
_081149B8:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r4, _08114A28 @ =0x02014800
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _08114A2C @ =0x000070c4
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114A30 @ =0x000090c4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	ldr r1, [sp, 0x4]
	cmp r1, r5
	blt _081149F0
	b _08114D76
_081149F0:
	mov r9, r4
	mov r2, r8
	adds r7, r3, r2
	ldr r0, _08114A34 @ =0x000038c4
	add r0, r9
	adds r4, r7, r0
	ldr r0, _08114A38 @ =0x000028c4
	add r0, r9
	adds r2, r7, r0
_08114A02:
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114A0C
	b _08114D3C
_08114A0C:
	adds r1, r0, 0
	ldr r0, [sp]
	str r2, [sp, 0xC]
	bl sub_8114DF0
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	adds r6, 0x1
	ldr r2, [sp, 0xC]
	cmp r6, r5
	blt _08114A02
	b _08114D76
	.align 2, 0
_08114A28: .4byte 0x02014800
_08114A2C: .4byte 0x000070c4
_08114A30: .4byte 0x000090c4
_08114A34: .4byte 0x000038c4
_08114A38: .4byte 0x000028c4
_08114A3C:
	movs r2, 0
	str r2, [sp, 0x4]
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _08114AB0 @ =0x000070c4
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114AB4 @ =0x000090c4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	ldr r1, [sp, 0x4]
	cmp r1, r5
	blt _08114A72
	b _08114D76
_08114A72:
	mov r9, r4
	mov r2, r8
	adds r7, r3, r2
	ldr r0, _08114AB8 @ =0x000038c4
	add r0, r9
	adds r4, r7, r0
	movs r3, 0
	ldr r0, _08114ABC @ =0x000028c4
	add r0, r9
	adds r2, r7, r0
_08114A86:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [sp]
	str r2, [sp, 0xC]
	str r3, [sp, 0x10]
	bl sub_8114DB4
	ldrb r0, [r4]
	ldr r2, [sp, 0xC]
	ldr r3, [sp, 0x10]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114AA6
	b _08114D4C
_08114AA6:
	adds r6, 0x1
	cmp r6, r5
	blt _08114A86
	b _08114D76
	.align 2, 0
_08114AB0: .4byte 0x000070c4
_08114AB4: .4byte 0x000090c4
_08114AB8: .4byte 0x000038c4
_08114ABC: .4byte 0x000028c4
_08114AC0:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r4, _08114B30 @ =0x02014800
	lsls r0, r3, 1
	ldr r5, [sp]
	lsls r1, r5, 6
	adds r0, r1
	ldr r1, _08114B34 @ =0x000070c4
	adds r2, r4, r1
	adds r2, r0, r2
	ldr r5, _08114B38 @ =0x000090c4
	adds r1, r4, r5
	adds r0, r1
	ldrh r1, [r0]
	ldrh r0, [r2]
	adds r1, r0
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r5, r0, 8
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2]
	movs r6, 0
	ldr r1, [sp, 0x4]
	cmp r1, r5
	blt _08114AF8
	b _08114D76
_08114AF8:
	mov r9, r4
	mov r2, r8
	adds r7, r3, r2
	ldr r0, _08114B3C @ =0x000038c4
	add r0, r9
	adds r4, r7, r0
	ldr r0, _08114B40 @ =0x000028c4
	add r0, r9
	adds r2, r7, r0
_08114B0A:
	ldrb r0, [r4]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08114B14
	b _08114D5C
_08114B14:
	adds r1, r0, 0
	ldr r0, [sp]
	str r2, [sp, 0xC]
	bl sub_8114DF0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	adds r6, 0x1
	ldr r2, [sp, 0xC]
	cmp r6, r5
	blt _08114B0A
	b _08114D76
	.align 2, 0
_08114B30: .4byte 0x02014800
_08114B34: .4byte 0x000070c4
_08114B38: .4byte 0x000090c4
_08114B3C: .4byte 0x000038c4
_08114B40: .4byte 0x000028c4
_08114B44:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r5, _08114B70 @ =0x02014800
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114B74 @ =0x000038c4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8114E48
	lsls r0, 24
	cmp r0, 0
	bne _08114B64
	b _08114D76
_08114B64:
	ldr r2, _08114B78 @ =0x000008c4
	adds r0, r5, r2
	adds r0, r4, r0
	movs r1, 0x9
	b _08114D74
	.align 2, 0
_08114B70: .4byte 0x02014800
_08114B74: .4byte 0x000038c4
_08114B78: .4byte 0x000008c4
_08114B7C:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114BA8 @ =0x02014800
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114BAC @ =0x000038c4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8114E48
	lsls r0, 24
	cmp r0, 0
	bne _08114B9C
	b _08114D76
_08114B9C:
	ldr r2, _08114BB0 @ =0x000008c4
	adds r0, r5, r2
	adds r0, r4, r0
	movs r1, 0xA
	b _08114D74
	.align 2, 0
_08114BA8: .4byte 0x02014800
_08114BAC: .4byte 0x000038c4
_08114BB0: .4byte 0x000008c4
_08114BB4:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114BE0 @ =0x02014800
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114BE4 @ =0x000038c4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8114E48
	lsls r0, 24
	cmp r0, 0
	bne _08114BD4
	b _08114D76
_08114BD4:
	ldr r2, _08114BE8 @ =0x000008c4
	adds r0, r5, r2
	adds r0, r4, r0
	movs r1, 0xB
	b _08114D74
	.align 2, 0
_08114BE0: .4byte 0x02014800
_08114BE4: .4byte 0x000038c4
_08114BE8: .4byte 0x000008c4
_08114BEC:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r5, _08114C18 @ =0x02014800
	mov r0, r8
	adds r4, r3, r0
	ldr r1, _08114C1C @ =0x000038c4
	adds r0, r5, r1
	adds r0, r4, r0
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8114E48
	lsls r0, 24
	cmp r0, 0
	bne _08114C0C
	b _08114D76
_08114C0C:
	ldr r2, _08114C20 @ =0x000008c4
	adds r0, r5, r2
	adds r0, r4, r0
	movs r1, 0xC
	b _08114D74
	.align 2, 0
_08114C18: .4byte 0x02014800
_08114C1C: .4byte 0x000038c4
_08114C20: .4byte 0x000008c4
_08114C24:
	movs r4, 0
	str r4, [sp, 0x4]
	ldr r6, _08114C58 @ =0x02014800
	mov r0, r8
	adds r5, r3, r0
	ldr r1, _08114C5C @ =0x000038c4
	adds r4, r6, r1
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	bl sub_8114DB4
	ldr r2, _08114C60 @ =0x000028c4
	adds r0, r6, r2
	adds r0, r5, r0
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08114C68
	ldr r4, _08114C64 @ =0x000008c4
	adds r0, r6, r4
	adds r0, r5, r0
	mov r5, sp
	ldrb r5, [r5, 0x4]
	strb r5, [r0]
	b _08114D76
	.align 2, 0
_08114C58: .4byte 0x02014800
_08114C5C: .4byte 0x000038c4
_08114C60: .4byte 0x000028c4
_08114C64: .4byte 0x000008c4
_08114C68:
	ldr r1, _08114C74 @ =0x000008c4
	adds r0, r6, r1
	adds r0, r5, r0
	movs r1, 0x1
	b _08114D74
	.align 2, 0
_08114C74: .4byte 0x000008c4
_08114C78:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r6, _08114CA8 @ =0x02014800
	mov r4, r8
	adds r5, r3, r4
	ldr r0, _08114CAC @ =0x000038c4
	adds r4, r6, r0
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	bl sub_8114DF0
	ldr r1, _08114CB0 @ =0x000028c4
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08114D1E
	ldr r1, _08114CB4 @ =0x000008c4
	adds r0, r6, r1
	adds r0, r5, r0
	movs r1, 0x2
	b _08114D74
	.align 2, 0
_08114CA8: .4byte 0x02014800
_08114CAC: .4byte 0x000038c4
_08114CB0: .4byte 0x000028c4
_08114CB4: .4byte 0x000008c4
_08114CB8:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r6, _08114CE8 @ =0x02014800
	mov r4, r8
	adds r5, r3, r4
	ldr r0, _08114CEC @ =0x000038c4
	adds r4, r6, r0
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	bl sub_8114DB4
	ldr r1, _08114CF0 @ =0x000028c4
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	beq _08114D1E
	ldr r1, _08114CF4 @ =0x000008c4
	adds r0, r6, r1
	adds r0, r5, r0
	movs r1, 0x3
	b _08114D74
	.align 2, 0
_08114CE8: .4byte 0x02014800
_08114CEC: .4byte 0x000038c4
_08114CF0: .4byte 0x000028c4
_08114CF4: .4byte 0x000008c4
_08114CF8:
	movs r2, 0
	str r2, [sp, 0x4]
	ldr r6, _08114D2C @ =0x02014800
	mov r4, r8
	adds r5, r3, r4
	ldr r0, _08114D30 @ =0x000038c4
	adds r4, r6, r0
	adds r4, r5, r4
	ldrb r1, [r4]
	ldr r0, [sp]
	bl sub_8114DF0
	ldr r1, _08114D34 @ =0x000028c4
	adds r0, r6, r1
	adds r0, r5, r0
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08114D6C
_08114D1E:
	ldr r2, _08114D38 @ =0x000008c4
	adds r0, r6, r2
	adds r0, r5, r0
	mov r4, sp
	ldrb r4, [r4, 0x4]
	strb r4, [r0]
	b _08114D76
	.align 2, 0
_08114D2C: .4byte 0x02014800
_08114D30: .4byte 0x000038c4
_08114D34: .4byte 0x000028c4
_08114D38: .4byte 0x000008c4
_08114D3C:
	ldr r0, _08114D48 @ =0x000008c4
	add r0, r9
	adds r0, r7, r0
	movs r1, 0
	b _08114D74
	.align 2, 0
_08114D48: .4byte 0x000008c4
_08114D4C:
	ldr r0, _08114D58 @ =0x000008c4
	add r0, r9
	adds r0, r7, r0
	strb r3, [r0]
	b _08114D76
	.align 2, 0
_08114D58: .4byte 0x000008c4
_08114D5C:
	ldr r0, _08114D68 @ =0x000008c4
	add r0, r9
	adds r0, r7, r0
	movs r1, 0
	b _08114D74
	.align 2, 0
_08114D68: .4byte 0x000008c4
_08114D6C:
	ldr r1, _08114DAC @ =0x000008c4
	adds r0, r6, r1
	adds r0, r5, r0
	movs r1, 0x4
_08114D74:
	strb r1, [r0]
_08114D76:
	mov r3, r10
	ldr r2, _08114DB0 @ =0x02014800
	adds r0, r2, 0
	adds r0, 0x84
	ldr r4, [sp]
	adds r0, r4, r0
	adds r4, r2, 0
_08114D84:
	ldrb r0, [r0]
	cmp r3, r0
	bge _08114D8E
	bl _08114410
_08114D8E:
	ldr r5, [sp, 0x8]
	str r5, [sp]
	cmp r5, 0x3F
	bgt _08114D9A
	bl _081143F2
_08114D9A:
	ldr r0, [sp, 0x4]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08114DAC: .4byte 0x000008c4
_08114DB0: .4byte 0x02014800
	thumb_func_end unref_sub_81143CC

	thumb_func_start sub_8114DB4
sub_8114DB4: @ 8114DB4
	push {lr}
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r2, _08114DDC @ =0x02014800
	lsrs r1, 25
	lsls r1, 2
	lsls r0, 7
	adds r1, r0
	ldr r0, _08114DE0 @ =0x000040c4
	adds r2, r0
	adds r1, r2
	ldr r2, [r1]
	movs r0, 0x1
	ands r3, r0
	cmp r3, 0
	beq _08114DE4
	ldrb r0, [r2]
	movs r1, 0xF0
	b _08114DE8
	.align 2, 0
_08114DDC: .4byte 0x02014800
_08114DE0: .4byte 0x000040c4
_08114DE4:
	ldrb r0, [r2]
	movs r1, 0xF
_08114DE8:
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	thumb_func_end sub_8114DB4

	thumb_func_start sub_8114DF0
sub_8114DF0: @ 8114DF0
	push {lr}
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r2, _08114E28 @ =0x02014800
	lsrs r1, 25
	lsls r1, 2
	lsls r0, 7
	adds r1, r0
	ldr r0, _08114E2C @ =0x000040c4
	adds r2, r0
	adds r1, r2
	ldr r2, [r1]
	movs r0, 0xC0
	lsls r0, 7
	adds r1, r2, r0
	movs r0, 0x1
	ands r3, r0
	cmp r3, 0
	beq _08114E30
	ldrb r1, [r1]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	bne _08114E42
	ldrb r1, [r2]
	movs r0, 0xF
	b _08114E3E
	.align 2, 0
_08114E28: .4byte 0x02014800
_08114E2C: .4byte 0x000040c4
_08114E30:
	ldrb r1, [r1]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _08114E42
	ldrb r1, [r2]
	movs r0, 0xF0
_08114E3E:
	ands r0, r1
	strb r0, [r2]
_08114E42:
	pop {r0}
	bx r0
	thumb_func_end sub_8114DF0

	thumb_func_start sub_8114E48
sub_8114E48: @ 8114E48
	push {r4-r7,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _08114E6C @ =0x02014800
	ldr r2, _08114E70 @ =0x0000a0c4
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0
	bne _08114E60
	b _08114F5E
_08114E60:
	movs r1, 0
	movs r3, 0
	cmp r4, 0
	bne _08114E74
	movs r1, 0x1
	b _08114EA6
	.align 2, 0
_08114E6C: .4byte 0x02014800
_08114E70: .4byte 0x0000a0c4
_08114E74:
	subs r0, r4, 0x1
	lsls r0, 5
	adds r2, r3, r0
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08114EA6
	ldr r7, _08114EC4 @ =0x000008c4
	adds r0, r5, r7
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08114EA6
	adds r3, 0x1
	cmp r3, 0x1F
	bgt _08114EA6
	cmp r4, 0
	bne _08114E74
	lsls r0, r1, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r1, r0, 24
_08114EA6:
	cmp r3, 0x20
	bne _08114EB4
	lsls r0, r1, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r1, r0, 24
_08114EB4:
	movs r3, 0
	cmp r4, 0x3F
	bne _08114EC8
	lsls r0, r1, 24
	movs r7, 0x80
	lsls r7, 17
	adds r0, r7
	b _08114EF8
	.align 2, 0
_08114EC4: .4byte 0x000008c4
_08114EC8:
	adds r0, r4, 0x1
	lsls r0, 5
	adds r2, r3, r0
	adds r0, r5, 0
	adds r0, 0xC4
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08114EFA
	ldr r7, _08114F64 @ =0x000008c4
	adds r0, r5, r7
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _08114EFA
	adds r3, 0x1
	cmp r3, 0x1F
	bgt _08114EFA
	cmp r4, 0x3F
	bne _08114EC8
	lsls r0, r1, 24
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
_08114EF8:
	lsrs r1, r0, 24
_08114EFA:
	cmp r3, 0x20
	bne _08114F08
	lsls r0, r1, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r1, r0, 24
_08114F08:
	cmp r1, 0x2
	beq _08114F5E
	subs r0, r6, 0x2
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r0, 0
	bge _08114F18
	movs r1, 0
_08114F18:
	adds r0, r6, 0x2
	lsls r0, 24
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, 0x3F
	ble _08114F26
	movs r2, 0x3F
_08114F26:
	lsls r1, 24
	asrs r3, r1, 24
	lsls r0, r2, 24
	asrs r2, r0, 24
	adds r6, r1, 0
	adds r7, r0, 0
	cmp r3, r2
	bge _08114F7C
	cmp r4, 0
	beq _08114F7C
	subs r0, r4, 0x1
	lsls r5, r0, 7
	ldr r0, _08114F68 @ =0x020188c4
	mov r12, r0
_08114F42:
	asrs r0, r3, 1
	lsls r0, 2
	adds r0, r5
	add r0, r12
	ldr r1, [r0]
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _08114F6C
	ldrb r1, [r1]
	movs r0, 0xF0
_08114F58:
	ands r0, r1
	cmp r0, 0
	beq _08114F72
_08114F5E:
	movs r0, 0x1
	b _08114FCA
	.align 2, 0
_08114F64: .4byte 0x000008c4
_08114F68: .4byte 0x020188c4
_08114F6C:
	ldrb r1, [r1]
	movs r0, 0xF
	b _08114F58
_08114F72:
	adds r3, 0x1
	cmp r3, r2
	bge _08114F7C
	cmp r4, 0
	bne _08114F42
_08114F7C:
	asrs r3, r6, 24
	asrs r1, r7, 24
	cmp r3, r1
	bge _08114FC8
	cmp r4, 0x3F
	beq _08114FC8
	adds r0, r4, 0x1
	lsls r5, r0, 7
	ldr r6, _08114FB0 @ =0x020188c4
	adds r2, r1, 0
_08114F90:
	asrs r0, r3, 1
	lsls r0, 2
	adds r0, r5
	adds r0, r6
	ldr r1, [r0]
	movs r0, 0x1
	ands r0, r3
	cmp r0, 0
	beq _08114FB4
	ldrb r1, [r1]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	beq _08114FBE
	b _08114F5E
	.align 2, 0
_08114FB0: .4byte 0x020188c4
_08114FB4:
	ldrb r1, [r1]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _08114F5E
_08114FBE:
	adds r3, 0x1
	cmp r3, r2
	bge _08114FC8
	cmp r4, 0x3F
	bne _08114F90
_08114FC8:
	movs r0, 0
_08114FCA:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8114E48

	thumb_func_start HBlankCB_EvolutionScene
HBlankCB_EvolutionScene: @ 8114FD0
	bx lr
	thumb_func_end HBlankCB_EvolutionScene

	thumb_func_start VBlankCB_EvolutionScene
VBlankCB_EvolutionScene: @ 8114FD4
	push {lr}
	ldr r1, _08115034 @ =REG_BG0CNT
	ldr r2, _08115038 @ =0x00009803
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x8
	ldr r0, _0811503C @ =gUnknown_030042A4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115040 @ =gUnknown_030042A0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115044 @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115048 @ =gUnknown_030041B4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0811504C @ =gUnknown_03004288
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115050 @ =gUnknown_03004280
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115054 @ =gUnknown_030041B0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _08115058 @ =gUnknown_030041B8
	ldrh r0, [r0]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8089668
	pop {r0}
	bx r0
	.align 2, 0
_08115034: .4byte REG_BG0CNT
_08115038: .4byte 0x00009803
_0811503C: .4byte gUnknown_030042A4
_08115040: .4byte gUnknown_030042A0
_08115044: .4byte gUnknown_030042C0
_08115048: .4byte gUnknown_030041B4
_0811504C: .4byte gUnknown_03004288
_08115050: .4byte gUnknown_03004280
_08115054: .4byte gUnknown_030041B0
_08115058: .4byte gUnknown_030041B8
	thumb_func_end VBlankCB_EvolutionScene

	thumb_func_start VBlankCB_TradeEvolutionScene
VBlankCB_TradeEvolutionScene: @ 811505C
	push {lr}
	ldr r1, _081150B4 @ =REG_BG0HOFS
	ldr r0, _081150B8 @ =gUnknown_030042A4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150BC @ =gUnknown_030042A0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150C0 @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150C4 @ =gUnknown_030041B4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150C8 @ =gUnknown_03004288
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150CC @ =gUnknown_03004280
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150D0 @ =gUnknown_030041B0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _081150D4 @ =gUnknown_030041B8
	ldrh r0, [r0]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8089668
	pop {r0}
	bx r0
	.align 2, 0
_081150B4: .4byte REG_BG0HOFS
_081150B8: .4byte gUnknown_030042A4
_081150BC: .4byte gUnknown_030042A0
_081150C0: .4byte gUnknown_030042C0
_081150C4: .4byte gUnknown_030041B4
_081150C8: .4byte gUnknown_03004288
_081150CC: .4byte gUnknown_03004280
_081150D0: .4byte gUnknown_030041B0
_081150D4: .4byte gUnknown_030041B8
	thumb_func_end VBlankCB_TradeEvolutionScene

	thumb_func_start sub_81150D8
sub_81150D8: @ 81150D8
	push {lr}
	ldr r0, _081150F4 @ =gUnknown_02024D1E
	ldrb r1, [r0, 0x1]
	lsls r1, 28
	movs r0, 0x90
	lsls r0, 23
	adds r1, r0
	lsrs r1, 24
	movs r0, 0xC8
	bl sub_814A880
	pop {r0}
	bx r0
	.align 2, 0
_081150F4: .4byte gUnknown_02024D1E
	thumb_func_end sub_81150D8

	thumb_func_start HBlankCB_TradeEvolutionScene
HBlankCB_TradeEvolutionScene: @ 81150F8
	bx lr
	thumb_func_end HBlankCB_TradeEvolutionScene

	.align 2, 0 @ Don't pad with nop.
