	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_800FCD4
sub_800FCD4: @ 800FCD4
	push {lr}
	ldr r0, _0800FCF4 @ =REG_VCOUNT
	ldrh r0, [r0]
	subs r0, 0x6F
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x30
	bhi _0800FCEE
	ldr r1, _0800FCF8 @ =REG_BG0CNT
	movs r2, 0x98
	lsls r2, 8
	adds r0, r2, 0
	strh r0, [r1]
_0800FCEE:
	pop {r0}
	bx r0
	.align 2, 0
_0800FCF4: .4byte REG_VCOUNT
_0800FCF8: .4byte REG_BG0CNT
	thumb_func_end sub_800FCD4

	thumb_func_start sub_800FCFC
sub_800FCFC: @ 800FCFC
	push {lr}
	bl Random
	ldr r1, _0800FD78 @ =REG_BG0HOFS
	ldr r0, _0800FD7C @ =gUnknown_030042A4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0800FD80 @ =gUnknown_030042A0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0800FD84 @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0800FD88 @ =gUnknown_030041B4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0800FD8C @ =gUnknown_03004288
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0800FD90 @ =gUnknown_03004280
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0800FD94 @ =gUnknown_030041B0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0800FD98 @ =gUnknown_030041B8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x22
	ldr r0, _0800FD9C @ =gUnknown_030042C4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x4
	ldr r0, _0800FDA0 @ =gUnknown_03004240
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, 0x2
	ldr r0, _0800FDA4 @ =gUnknown_03004200
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x4
	ldr r0, _0800FDA8 @ =gUnknown_03004244
	ldrh r0, [r0]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_8089668
	pop {r0}
	bx r0
	.align 2, 0
_0800FD78: .4byte REG_BG0HOFS
_0800FD7C: .4byte gUnknown_030042A4
_0800FD80: .4byte gUnknown_030042A0
_0800FD84: .4byte gUnknown_030042C0
_0800FD88: .4byte gUnknown_030041B4
_0800FD8C: .4byte gUnknown_03004288
_0800FD90: .4byte gUnknown_03004280
_0800FD94: .4byte gUnknown_030041B0
_0800FD98: .4byte gUnknown_030041B8
_0800FD9C: .4byte gUnknown_030042C4
_0800FDA0: .4byte gUnknown_03004240
_0800FDA4: .4byte gUnknown_03004200
_0800FDA8: .4byte gUnknown_03004244
	thumb_func_end sub_800FCFC

	thumb_func_start nullsub_36
nullsub_36: @ 800FDAC
	bx lr
	thumb_func_end nullsub_36

	thumb_func_start sub_800FDB0
sub_800FDB0: @ 800FDB0
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0800FDD0
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	lsrs r0, 8
	ldrh r1, [r5, 0x30]
	adds r0, r1
	strh r0, [r5, 0x20]
	b _0800FDE2
_0800FDD0:
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	asrs r0, 8
	ldrh r1, [r5, 0x30]
	subs r1, r0
	strh r1, [r5, 0x20]
_0800FDE2:
	movs r1, 0xC0
	lsls r1, 1
	adds r0, r1, 0
	ldrh r1, [r5, 0x32]
	adds r0, r1
	strh r0, [r5, 0x32]
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0800FE16
	ldr r4, _0800FE1C @ =0x00002710
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	adds r0, r5, 0
	bl FreeSpriteOamMatrix
	adds r0, r5, 0
	bl DestroySprite
_0800FE16:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800FE1C: .4byte 0x00002710
	thumb_func_end sub_800FDB0

	thumb_func_start sub_800FE20
sub_800FE20: @ 800FE20
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _0800FE3C @ =sub_800FDB0
	str r0, [r4, 0x1C]
	movs r0, 0x68
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800FE3C: .4byte sub_800FDB0
	thumb_func_end sub_800FE20

	thumb_func_start sub_800FE40
sub_800FE40: @ 800FE40
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	ldr r0, _0800FE88 @ =0x02000000
	ldr r2, _0800FE8C @ =0x000160cb
	adds r0, r2
	ldrb r2, [r0]
	ldr r0, _0800FE90 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0800FEB4
	ldr r1, _0800FE94 @ =gLinkPlayers
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x18]
	cmp r0, 0x1
	beq _0800FEA0
	cmp r0, 0x1
	bgt _0800FE98
	cmp r0, 0
	beq _0800FEB4
	b _0800FEBC
	.align 2, 0
_0800FE88: .4byte 0x02000000
_0800FE8C: .4byte 0x000160cb
_0800FE90: .4byte gBattleTypeFlags
_0800FE94: .4byte gLinkPlayers
_0800FE98:
	cmp r0, 0x2
	beq _0800FEB4
	cmp r0, 0x3
	bne _0800FEBC
_0800FEA0:
	ldr r1, _0800FEAC @ =gEnemyParty
	str r1, [sp, 0x4]
	ldr r2, _0800FEB0 @ =gPlayerParty
	str r2, [sp, 0x8]
	b _0800FEBC
	.align 2, 0
_0800FEAC: .4byte gEnemyParty
_0800FEB0: .4byte gPlayerParty
_0800FEB4:
	ldr r3, _08010008 @ =gPlayerParty
	str r3, [sp, 0x4]
	ldr r0, _0801000C @ =gEnemyParty
	str r0, [sp, 0x8]
_0800FEBC:
	movs r7, 0
	movs r1, 0
	mov r8, r1
	ldr r2, [sp]
	lsls r2, 2
	str r2, [sp, 0xC]
	movs r3, 0xCE
	lsls r3, 1
	mov r10, r3
	mov r9, r1
_0800FED0:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	ldr r0, [sp, 0x4]
	adds r4, r0, r4
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	adds r1, r0, 0
	cmp r5, 0
	beq _0800FF40
	cmp r5, r10
	beq _0800FF14
	cmp r6, 0
	beq _0800FF14
	cmp r1, 0
	bne _0800FF14
	movs r0, 0x1
	mov r2, r9
	lsls r0, r2
	orrs r7, r0
_0800FF14:
	cmp r5, 0
	beq _0800FF40
	cmp r6, 0
	beq _0800FF2C
	cmp r5, r10
	beq _0800FF24
	cmp r1, 0
	beq _0800FF2C
_0800FF24:
	movs r0, 0x2
	mov r3, r9
	lsls r0, r3
	orrs r7, r0
_0800FF2C:
	cmp r5, 0
	beq _0800FF40
	cmp r5, r10
	beq _0800FF40
	cmp r6, 0
	bne _0800FF40
	movs r0, 0x3
	mov r1, r9
	lsls r0, r1
	orrs r7, r0
_0800FF40:
	movs r2, 0x2
	add r9, r2
	movs r3, 0x1
	add r8, r3
	mov r0, r8
	cmp r0, 0x5
	ble _0800FED0
	ldr r1, _08010010 @ =gTasks
	ldr r2, [sp, 0xC]
	ldr r3, [sp]
	adds r0, r2, r3
	lsls r0, 3
	adds r0, r1
	strh r7, [r0, 0xE]
	movs r7, 0
	movs r0, 0
	mov r8, r0
	movs r1, 0xCE
	lsls r1, 1
	mov r10, r1
	mov r9, r0
_0800FF6A:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	ldr r2, [sp, 0x8]
	adds r4, r2, r4
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	adds r1, r0, 0
	cmp r5, 0
	beq _0800FFDA
	cmp r5, r10
	beq _0800FFAE
	cmp r6, 0
	beq _0800FFAE
	cmp r1, 0
	bne _0800FFAE
	movs r0, 0x1
	mov r3, r9
	lsls r0, r3
	orrs r7, r0
_0800FFAE:
	cmp r5, 0
	beq _0800FFDA
	cmp r6, 0
	beq _0800FFC6
	cmp r5, r10
	beq _0800FFBE
	cmp r1, 0
	beq _0800FFC6
_0800FFBE:
	movs r0, 0x2
	mov r1, r9
	lsls r0, r1
	orrs r7, r0
_0800FFC6:
	cmp r5, 0
	beq _0800FFDA
	cmp r5, r10
	beq _0800FFDA
	cmp r6, 0
	bne _0800FFDA
	movs r0, 0x3
	mov r2, r9
	lsls r0, r2
	orrs r7, r0
_0800FFDA:
	movs r3, 0x2
	add r9, r3
	movs r0, 0x1
	add r8, r0
	mov r1, r8
	cmp r1, 0x5
	ble _0800FF6A
	ldr r1, _08010010 @ =gTasks
	ldr r2, [sp, 0xC]
	ldr r3, [sp]
	adds r0, r2, r3
	lsls r0, 3
	adds r0, r1
	strh r7, [r0, 0x10]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010008: .4byte gPlayerParty
_0801000C: .4byte gEnemyParty
_08010010: .4byte gTasks
	thumb_func_end sub_800FE40

	thumb_func_start c2_8011A1C
c2_8011A1C: @ 8010014
	push {r4,r5,lr}
	sub sp, 0x4
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0
	bl SetVBlankCallback
	movs r4, 0
	str r4, [sp]
	movs r1, 0xC0
	lsls r1, 19
	ldr r2, _08010144 @ =0x05006000
	mov r0, sp
	bl CpuSet
	ldr r0, _08010148 @ =REG_MOSAIC
	strh r4, [r0]
	subs r0, 0xC
	movs r2, 0xF0
	strh r2, [r0]
	adds r0, 0x4
	ldr r3, _0801014C @ =0x00005051
	adds r1, r3, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r0, _08010150 @ =gUnknown_030042C4
	strh r2, [r0]
	ldr r0, _08010154 @ =gUnknown_03004240
	strh r1, [r0]
	bl dp12_8087EA4
	ldr r0, _08010158 @ =gUnknown_03004DE0
	movs r3, 0xF0
	movs r4, 0xF0
	lsls r4, 3
	adds r2, r0, r4
	movs r1, 0x4F
_08010066:
	strh r3, [r0]
	strh r3, [r2]
	adds r2, 0x2
	adds r0, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _08010066
	movs r1, 0x50
	ldr r5, _0801015C @ =gWindowConfig_81E6C58
	ldr r0, _08010158 @ =gUnknown_03004DE0
	ldr r3, _08010160 @ =0x0000ff10
	movs r4, 0x82
	lsls r4, 4
	adds r2, r0, r4
	adds r0, 0xA0
_08010084:
	strh r3, [r0]
	strh r3, [r2]
	adds r2, 0x2
	adds r0, 0x2
	adds r1, 0x1
	cmp r1, 0x9F
	ble _08010084
	adds r0, r5, 0
	bl SetUpWindowConfig
	bl ResetPaletteFade
	ldr r0, _08010164 @ =gUnknown_030042A4
	movs r4, 0
	strh r4, [r0]
	ldr r0, _08010168 @ =gUnknown_030042A0
	strh r4, [r0]
	ldr r0, _0801016C @ =gUnknown_030042C0
	strh r4, [r0]
	ldr r0, _08010170 @ =gUnknown_030041B4
	strh r4, [r0]
	ldr r0, _08010174 @ =gUnknown_03004288
	strh r4, [r0]
	ldr r0, _08010178 @ =gUnknown_03004280
	strh r4, [r0]
	ldr r0, _0801017C @ =gUnknown_030041B0
	strh r4, [r0]
	ldr r0, _08010180 @ =gUnknown_030041B8
	strh r4, [r0]
	ldr r0, _08010184 @ =gUnknown_03004210
	adds r1, r5, 0
	bl InitWindowFromConfig
	ldr r0, _08010188 @ =gUnknown_030041D0
	ldr r1, _0801018C @ =gWindowConfig_81E71D0
	bl InitWindowFromConfig
	ldr r0, _08010190 @ =gUnknown_03004250
	ldr r1, _08010194 @ =gWindowConfig_81E71EC
	bl InitWindowFromConfig
	bl sub_800D6D4
	ldr r0, _08010198 @ =gUnknown_08D004E0
	movs r1, 0
	movs r2, 0x40
	bl LoadCompressedPalette
	bl sub_800D74C
	bl ResetSpriteData
	bl ResetTasks
	bl sub_800E23C
	ldr r1, _0801019C @ =REG_WINOUT
	movs r0, 0x37
	strh r0, [r1]
	bl FreeAllSpritePalettes
	ldr r1, _080101A0 @ =gReservedSpritePaletteCount
	movs r0, 0x4
	strb r0, [r1]
	ldr r0, _080101A4 @ =sub_800FCFC
	bl SetVBlankCallback
	ldr r0, _080101A8 @ =sub_800DE30
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080101AC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x87
	lsls r2, 1
	strh r2, [r1, 0xA]
	movs r2, 0x5A
	strh r2, [r1, 0xC]
	movs r2, 0x1
	strh r2, [r1, 0x12]
	bl sub_800FE40
	ldr r0, _080101B0 @ =sub_80101B8
	bl SetMainCallback2
	ldr r0, _080101B4 @ =gUnknown_02024D1E
	strb r4, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010144: .4byte 0x05006000
_08010148: .4byte REG_MOSAIC
_0801014C: .4byte 0x00005051
_08010150: .4byte gUnknown_030042C4
_08010154: .4byte gUnknown_03004240
_08010158: .4byte gUnknown_03004DE0
_0801015C: .4byte gWindowConfig_81E6C58
_08010160: .4byte 0x0000ff10
_08010164: .4byte gUnknown_030042A4
_08010168: .4byte gUnknown_030042A0
_0801016C: .4byte gUnknown_030042C0
_08010170: .4byte gUnknown_030041B4
_08010174: .4byte gUnknown_03004288
_08010178: .4byte gUnknown_03004280
_0801017C: .4byte gUnknown_030041B0
_08010180: .4byte gUnknown_030041B8
_08010184: .4byte gUnknown_03004210
_08010188: .4byte gUnknown_030041D0
_0801018C: .4byte gWindowConfig_81E71D0
_08010190: .4byte gUnknown_03004250
_08010194: .4byte gWindowConfig_81E71EC
_08010198: .4byte gUnknown_08D004E0
_0801019C: .4byte REG_WINOUT
_080101A0: .4byte gReservedSpritePaletteCount
_080101A4: .4byte sub_800FCFC
_080101A8: .4byte sub_800DE30
_080101AC: .4byte gTasks
_080101B0: .4byte sub_80101B8
_080101B4: .4byte gUnknown_02024D1E
	thumb_func_end c2_8011A1C

	thumb_func_start sub_80101B8
sub_80101B8: @ 80101B8
	push {lr}
	bl c2_081284E0
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl RunTasks
	pop {r0}
	bx r0
	thumb_func_end sub_80101B8

	thumb_func_start c2_081284E0
c2_081284E0: @ 80101D4
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _080101EC @ =gUnknown_02024D1E
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _080101FC
	cmp r0, 0x1
	bgt _080101F0
	cmp r0, 0
	beq _080101F6
	b _08010236
	.align 2, 0
_080101EC: .4byte gUnknown_02024D1E
_080101F0:
	cmp r0, 0x2
	beq _08010222
	b _08010236
_080101F6:
	movs r0, 0xFF
	strb r0, [r4, 0x1]
	b _0801021A
_080101FC:
	ldrb r0, [r4, 0x1]
	subs r0, 0x1
	strb r0, [r4, 0x1]
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08010236
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0801021A:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08010236
_08010222:
	ldr r0, _08010240 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08010236
	ldr r0, _08010244 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_08010236:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010240: .4byte gPaletteFade
_08010244: .4byte gMain
	thumb_func_end c2_081284E0

	thumb_func_start oac_poke_opponent
oac_poke_opponent: @ 8010248
	push {lr}
	sub sp, 0x4
	ldr r1, _08010270 @ =sub_8010278
	str r1, [r0, 0x1C]
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	movs r0, 0x80
	lsls r0, 10
	ldr r1, _08010274 @ =0x00003def
	str r1, [sp]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0xA
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08010270: .4byte sub_8010278
_08010274: .4byte 0x00003def
	thumb_func_end oac_poke_opponent

	thumb_func_start sub_8010278
sub_8010278: @ 8010278
	push {lr}
	adds r2, r0, 0
	ldr r0, _080102A4 @ =gUnknown_02024DE8
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080102A0
	ldrh r0, [r2, 0x24]
	adds r0, 0x2
	strh r0, [r2, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _080102A0
	ldr r0, _080102A8 @ =sub_80102AC
	str r0, [r2, 0x1C]
	ldrh r0, [r2, 0x32]
	movs r1, 0x19
	bl PlayCry1
_080102A0:
	pop {r0}
	bx r0
	.align 2, 0
_080102A4: .4byte gUnknown_02024DE8
_080102A8: .4byte sub_80102AC
	thumb_func_end sub_8010278

	thumb_func_start sub_80102AC
sub_80102AC: @ 80102AC
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080102F4
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	bl sub_804777C
	ldr r1, _080102FC @ =gUnknown_03004340
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DFC
	ldr r0, _08010300 @ =nullsub_37
	str r0, [r4, 0x1C]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnimIfDifferent
	movs r0, 0x80
	lsls r0, 10
	ldr r1, _08010304 @ =0x00003def
	str r1, [sp]
	movs r1, 0
	movs r2, 0xA
	movs r3, 0
	bl BeginNormalPaletteFade
_080102F4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080102FC: .4byte gUnknown_03004340
_08010300: .4byte nullsub_37
_08010304: .4byte 0x00003def
	thumb_func_end sub_80102AC

	thumb_func_start nullsub_37
nullsub_37: @ 8010308
	bx lr
	thumb_func_end nullsub_37

	thumb_func_start unref_sub_801030C
unref_sub_801030C: @ 801030C
	movs r1, 0x6
	strh r1, [r0, 0x34]
	movs r1, 0x1
	strh r1, [r0, 0x36]
	ldr r1, _0801031C @ =sub_8010320
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_0801031C: .4byte sub_8010320
	thumb_func_end unref_sub_801030C

	thumb_func_start sub_8010320
sub_8010320: @ 8010320
	push {r4,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x36]
	subs r0, 0x1
	strh r0, [r3, 0x36]
	lsls r0, 16
	cmp r0, 0
	bne _08010374
	movs r0, 0x8
	strh r0, [r3, 0x36]
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r4, 0x5
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x34]
	subs r0, 0x1
	strh r0, [r3, 0x34]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bne _08010374
	ldrb r1, [r1]
	adds r0, r4, 0
	ands r0, r1
	mov r1, r12
	strb r0, [r1]
	ldr r0, _0801037C @ =nullsub_37
	str r0, [r3, 0x1C]
	ldr r0, _08010380 @ =gUnknown_03004284
	str r2, [r0]
_08010374:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801037C: .4byte nullsub_37
_08010380: .4byte gUnknown_03004284
	thumb_func_end sub_8010320

	thumb_func_start sub_8010384
sub_8010384: @ 8010384
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, r6, 2
	ldr r0, _080103A4 @ =0x02017800
	adds r1, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	beq _080103A8
	adds r4, r0, 0
	b _080103AC
	.align 2, 0
_080103A4: .4byte 0x02017800
_080103A8:
	mov r0, r9
	ldrh r4, [r0, 0x32]
_080103AC:
	ldr r1, _08010414 @ =gUnknown_02024A6A
	lsls r0, r6, 1
	adds r5, r0, r1
	ldrh r0, [r5]
	movs r1, 0x64
	mov r8, r1
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	ldr r7, _08010418 @ =gEnemyParty
	adds r0, r7
	movs r1, 0
	bl GetMonData
	cmp r4, SPECIES_UNOWN
	bne _08010430
	ldrh r0, [r5]
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	adds r0, r7
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0801041C
	movs r0, SPECIES_UNOWN
	b _08010426
	.align 2, 0
_08010414: .4byte gUnknown_02024A6A
_08010418: .4byte gEnemyParty
_0801041C:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_08010426:
	ldr r1, _0801042C @ =gMonFrontPicCoords
	lsls r0, 2
	b _08010468
	.align 2, 0
_0801042C: .4byte gMonFrontPicCoords
_08010430:
	ldr r0, _08010448 @ =SPECIES_CASTFORM
	cmp r4, r0  @ Check if pokemon species is Castform
	bne _08010454
	ldr r0, _0801044C @ =gUnknownCastformCoords_0837F598
	ldr r1, _08010450 @ =gBattleMonForms
	adds r1, r6, r1
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	b _0801046C
	.align 2, 0
_08010448: .4byte SPECIES_CASTFORM
_0801044C: .4byte gUnknownCastformCoords_0837F598
_08010450: .4byte gBattleMonForms
_08010454:
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _08010464
	ldr r0, _08010460 @ =gMonFrontPicCoords
	b _0801046A
	.align 2, 0
_08010460: .4byte gMonFrontPicCoords
_08010464:
	ldr r1, _0801048C @ =gMonFrontPicCoords
	lsls r0, r4, 2
_08010468:
	adds r0, r1
_0801046A:
	ldrb r0, [r0, 0x1]
_0801046C:
	lsrs r1, r0, 3
	movs r0, 0x8
	subs r0, r1
	mov r1, r9
	strh r0, [r1, 0x34]
	movs r0, 0x1
	strh r0, [r1, 0x36]
	ldr r0, _08010490 @ =sub_8010494
	str r0, [r1, 0x1C]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801048C: .4byte gMonFrontPicCoords
_08010490: .4byte sub_8010494
	thumb_func_end sub_8010384

	thumb_func_start sub_8010494
sub_8010494: @ 8010494
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x36]
	subs r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	cmp r0, 0
	bne _08010510
	movs r0, 0x2
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x26]
	adds r0, 0x8
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	cmp r0, 0
	bge _080104C8
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	b _08010510
_080104C8:
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	ldr r1, _08010518 @ =gUnknown_081FAF4C
	lsls r0, 24
	lsrs r0, 22
	adds r0, r1
	ldr r2, _0801051C @ =gBattleMonForms
	movs r3, 0x2E
	ldrsh r1, [r4, r3]
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 11
	ldr r2, [r0]
	adds r2, r1
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 8
	adds r2, r0
	movs r1, 0
	movs r0, 0xFF
_080104F6:
	strb r1, [r2]
	adds r2, 0x1
	subs r0, 0x1
	cmp r0, 0
	bge _080104F6
	ldr r0, _0801051C @ =gBattleMonForms
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	adds r1, r0
	ldrb r1, [r1]
	adds r0, r4, 0
	bl StartSpriteAnim
_08010510:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010518: .4byte gUnknown_081FAF4C
_0801051C: .4byte gBattleMonForms
	thumb_func_end sub_8010494

	thumb_func_start sub_8010520
sub_8010520: @ 8010520
	movs r1, 0x8
	strh r1, [r0, 0x34]
	adds r1, r0, 0
	adds r1, 0x3E
	ldrb r1, [r1]
	lsls r1, 29
	lsrs r1, 31
	strh r1, [r0, 0x36]
	ldr r1, _08010538 @ =sub_801053C
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_08010538: .4byte sub_801053C
	thumb_func_end sub_8010520

	thumb_func_start sub_801053C
sub_801053C: @ 801053C
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x34]
	subs r0, 0x1
	strh r0, [r3, 0x34]
	lsls r0, 16
	cmp r0, 0
	bne _0801056E
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
	movs r0, 0x8
	strh r0, [r3, 0x34]
_0801056E:
	pop {r0}
	bx r0
	thumb_func_end sub_801053C

	thumb_func_start sub_8010574
sub_8010574: @ 8010574
	movs r1, 0x3E
	adds r1, r0
	mov r12, r1
	movs r1, 0x1
	ldrh r2, [r0, 0x36]
	ands r2, r1
	lsls r2, 2
	mov r1, r12
	ldrb r3, [r1]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	mov r2, r12
	strb r1, [r2]
	movs r1, 0
	strh r1, [r0, 0x36]
	ldr r1, _0801059C @ =nullsub_37
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_0801059C: .4byte nullsub_37
	thumb_func_end sub_8010574

	thumb_func_start sub_80105A0
sub_80105A0: @ 80105A0
	ldr r1, _080105A8 @ =oac_poke_ally_
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080105A8: .4byte oac_poke_ally_
	thumb_func_end sub_80105A0

	thumb_func_start oac_poke_ally_
oac_poke_ally_: @ 80105AC
	push {lr}
	adds r2, r0, 0
	ldr r0, _080105D4 @ =gUnknown_02024DE8
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080105D0
	ldrh r0, [r2, 0x24]
	subs r0, 0x2
	strh r0, [r2, 0x24]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	bne _080105D0
	ldr r0, _080105D8 @ =nullsub_86
	str r0, [r2, 0x1C]
	strh r1, [r2, 0x30]
_080105D0:
	pop {r0}
	bx r0
	.align 2, 0
_080105D4: .4byte gUnknown_02024DE8
_080105D8: .4byte nullsub_86
	thumb_func_end oac_poke_ally_

	thumb_func_start sub_80105DC
sub_80105DC: @ 80105DC
	ldr r1, _080105E4 @ =nullsub_86
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080105E4: .4byte nullsub_86
	thumb_func_end sub_80105DC

	thumb_func_start nullsub_86
nullsub_86: @ 80105E8
	bx lr
	thumb_func_end nullsub_86

	thumb_func_start sub_80105EC
sub_80105EC: @ 80105EC
	push {lr}
	adds r2, r0, 0
	ldr r0, _08010610 @ =gUnknown_02024DE8
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0801060C
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x26]
	adds r0, r1
	strh r0, [r2, 0x26]
_0801060C:
	pop {r0}
	bx r0
	.align 2, 0
_08010610: .4byte gUnknown_02024DE8
	thumb_func_end sub_80105EC

	thumb_func_start dp11b_obj_instanciate
dp11b_obj_instanciate: @ 8010614
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	cmp r1, 0
	beq _0801064C
	lsls r2, r4, 1
	adds r0, r2, r4
	lsls r0, 2
	ldr r1, _08010648 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	b _0801065A
	.align 2, 0
_08010648: .4byte 0x02017810
_0801064C:
	lsls r2, r4, 1
	adds r0, r2, r4
	lsls r0, 2
	ldr r1, _08010698 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
_0801065A:
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	bne _080106FA
	ldr r0, _0801069C @ =objc_dp11b_pingpong
	bl CreateInvisibleSpriteWithCallback
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r8
	cmp r0, 0x1
	bne _080106A8
	ldr r0, _080106A0 @ =gUnknown_03004340
	adds r0, r4, r0
	ldrb r7, [r0]
	adds r0, r6, r4
	lsls r0, 2
	ldr r1, _08010698 @ =0x02017810
	adds r0, r1
	strb r5, [r0, 0x2]
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
	ldr r2, _080106A4 @ =gSprites
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0x80
	b _080106CC
	.align 2, 0
_08010698: .4byte 0x02017810
_0801069C: .4byte objc_dp11b_pingpong
_080106A0: .4byte gUnknown_03004340
_080106A4: .4byte gSprites
_080106A8:
	ldr r0, _08010708 @ =gUnknown_02024BE0
	adds r0, r4, r0
	ldrb r7, [r0]
	adds r0, r6, r4
	lsls r0, 2
	ldr r1, _0801070C @ =0x02017810
	adds r0, r1
	strb r5, [r0, 0x3]
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r2, _08010710 @ =gSprites
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0xC0
_080106CC:
	strh r1, [r0, 0x2E]
	adds r4, r2, 0
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r4
	mov r2, r9
	lsls r0, r2, 24
	asrs r0, 24
	movs r2, 0
	strh r0, [r1, 0x30]
	mov r3, r10
	lsls r0, r3, 24
	asrs r0, 24
	strh r0, [r1, 0x32]
	strh r7, [r1, 0x34]
	mov r0, r8
	strh r0, [r1, 0x36]
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r0, r4
	strh r2, [r0, 0x24]
	strh r2, [r0, 0x26]
_080106FA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010708: .4byte gUnknown_02024BE0
_0801070C: .4byte 0x02017810
_08010710: .4byte gSprites
	thumb_func_end dp11b_obj_instanciate

	thumb_func_start dp11b_obj_free
dp11b_obj_free: @ 8010714
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x1
	bne _0801075C
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _08010754 @ =0x02017810
	adds r5, r0, r1
	ldrb r1, [r5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080107A0
	ldr r2, _08010758 @ =gSprites
	ldrb r1, [r5, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x34]
	lsls r1, 24
	lsrs r4, r1, 24
	bl DestroySprite
	ldrb r1, [r5]
	movs r0, 0x3
	negs r0, r0
	b _0801078C
	.align 2, 0
_08010754: .4byte 0x02017810
_08010758: .4byte gSprites
_0801075C:
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _080107A8 @ =0x02017810
	adds r5, r0, r1
	ldrb r1, [r5]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080107A0
	ldr r2, _080107AC @ =gSprites
	ldrb r1, [r5, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x34]
	lsls r1, 24
	lsrs r4, r1, 24
	bl DestroySprite
	ldrb r1, [r5]
	movs r0, 0x5
	negs r0, r0
_0801078C:
	ands r0, r1
	strb r0, [r5]
	ldr r0, _080107AC @ =gSprites
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x24]
	strh r0, [r1, 0x26]
_080107A0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080107A8: .4byte 0x02017810
_080107AC: .4byte gSprites
	thumb_func_end dp11b_obj_free

	thumb_func_start objc_dp11b_pingpong
objc_dp11b_pingpong: @ 80107B0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x34]
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080107C8
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	b _080107CC
_080107C8:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
_080107CC:
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Sin
	ldr r2, _080107F8 @ =gSprites
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r4, 0x32]
	adds r0, r2
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080107F8: .4byte gSprites
	thumb_func_end objc_dp11b_pingpong

	thumb_func_start nullsub_41
nullsub_41: @ 80107FC
	bx lr
	thumb_func_end nullsub_41

	thumb_func_start sub_8010800
sub_8010800: @ 8010800
	push {lr}
	bl sub_8010874
	ldr r1, _08010818 @ =gUnknown_02024D1E
	movs r0, 0
	strb r0, [r1, 0x1]
	ldr r1, _0801081C @ =gUnknown_030042D4
	ldr r0, _08010820 @ =bc_8012FAC
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08010818: .4byte gUnknown_02024D1E
_0801081C: .4byte gUnknown_030042D4
_08010820: .4byte bc_8012FAC
	thumb_func_end sub_8010800

	thumb_func_start sub_8010824
sub_8010824: @ 8010824
	push {r4,r5,lr}
	ldr r0, _08010864 @ =gUnknown_030042D4
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _08010868 @ =gUnknown_02024A60
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0801086C @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r0, 0
	beq _0801085E
	ldr r5, _08010870 @ =gUnknown_03004330
	adds r4, r1, 0
_08010840:
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _0801086C @ =gUnknown_02024A68
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08010840
_0801085E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010864: .4byte gUnknown_030042D4
_08010868: .4byte gUnknown_02024A60
_0801086C: .4byte gUnknown_02024A68
_08010870: .4byte gUnknown_03004330
	thumb_func_end sub_8010824

	thumb_func_start sub_8010874
sub_8010874: @ 8010874
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0
	bl sub_801365C
	bl sub_801377C
	movs r2, 0
	movs r3, 0
	ldr r0, _08010AC8 @ =gUnknown_02024C4C
	mov r10, r0
	ldr r1, _08010ACC @ =gUnknown_02024C44
	mov r9, r1
	ldr r4, _08010AD0 @ =gUnknown_02024C3C
	mov r8, r4
	ldr r0, _08010AD4 @ =gUnknown_02024C34
	mov r12, r0
	ldr r4, _08010AD8 @ =gUnknown_02024CA8
	movs r5, 0
	ldr r7, _08010ADC @ =gUnknown_02024C2C
	ldr r6, _08010AE0 @ =gUnknown_02024C54
_080108A4:
	ldr r0, _08010AE4 @ =gUnknown_02024C98
	adds r0, r5, r0
	str r3, [r0]
	movs r1, 0
_080108AC:
	adds r0, r4, r1
	strb r3, [r0]
	adds r1, 0x1
	cmp r1, 0x1B
	bls _080108AC
	movs r0, 0x2
	strb r0, [r4, 0x16]
	ldr r1, _08010AE8 @ =gUnknown_02024C70
	adds r0, r2, r1
	strb r3, [r0]
	mov r0, r12
	strh r3, [r0]
	mov r1, r8
	strh r3, [r1]
	mov r0, r9
	strh r3, [r0]
	mov r1, r10
	strh r3, [r1]
	ldr r0, _08010AEC @ =gUnknown_02024C5C
	adds r1, r2, r0
	movs r0, 0xFF
	strb r0, [r1]
	strh r3, [r6]
	strh r3, [r7]
	ldr r1, _08010AF0 @ =0x02017100
	adds r0, r5, r1
	str r3, [r0]
	movs r0, 0x2
	add r10, r0
	add r9, r0
	add r8, r0
	add r12, r0
	adds r4, 0x1C
	adds r5, 0x4
	adds r7, 0x2
	adds r6, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	ble _080108A4
	movs r5, 0
	ldr r3, _08010AF4 @ =gUnknown_02024C80
	ldr r4, _08010AF8 @ =gUnknown_02024C7A
	movs r2, 0x1
_08010902:
	strh r5, [r4]
	movs r1, 0
_08010906:
	adds r0, r3, r1
	strb r5, [r0]
	adds r1, 0x1
	cmp r1, 0xB
	bls _08010906
	adds r3, 0xC
	adds r4, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _08010902
	movs r1, 0
	ldr r2, _08010AFC @ =gPlayerMonIndex
	strb r1, [r2]
	ldr r3, _08010B00 @ =gEnemyMonIndex
	strb r1, [r3]
	ldr r4, _08010B04 @ =gBattleWeather
	strh r1, [r4]
	ldr r1, _08010B08 @ =gUnknown_02024DBC
	movs r2, 0
	movs r3, 0
_0801092E:
	adds r0, r1, r2
	strb r3, [r0]
	adds r2, 0x1
	cmp r2, 0x2B
	bls _0801092E
	movs r0, 0
	ldr r1, _08010B0C @ =gUnknown_02024C6C
	str r0, [r1]
	ldr r2, _08010B10 @ =gBattleTypeFlags
	ldrh r1, [r2]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _0801095C
	ldr r3, _08010B14 @ =gSaveBlock2
	ldrb r1, [r3, 0x15]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0801095C
	movs r0, 0x80
	ldr r4, _08010B0C @ =gUnknown_02024C6C
	str r0, [r4]
_0801095C:
	ldr r1, _08010B14 @ =gSaveBlock2
	ldrb r0, [r1, 0x15]
	lsls r0, 30
	lsrs r0, 31
	ldr r3, _08010B18 @ =0x02000000
	ldr r4, _08010B1C @ =0x00016084
	adds r2, r3, r4
	movs r1, 0
	strb r0, [r2]
	ldr r0, _08010B20 @ =gUnknown_02024C0E
	strb r1, [r0]
	ldr r2, _08010B24 @ =gUnknown_02024D26
	strb r1, [r2]
	ldr r3, _08010B28 @ =gUnknown_02024A64
	str r1, [r3]
	movs r2, 0
	ldr r4, _08010B2C @ =gUnknown_02024D1A
	strh r1, [r4]
	ldr r1, _08010B18 @ =0x02000000
	ldr r3, _08010B30 @ =0x00017130
	adds r0, r1, r3
	strb r2, [r0]
	ldr r4, _08010B34 @ =0x00017160
	adds r0, r1, r4
	strb r2, [r0]
	ldr r1, _08010B38 @ =gUnknown_02024D1E
	movs r2, 0
	adds r0, r1, 0x7
_08010994:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08010994
	movs r5, 0
	ldr r0, _08010B3C @ =gUnknown_02024D18
	strh r5, [r0]
	movs r0, 0
	ldr r1, _08010B40 @ =gBattleMoveDamage
	str r0, [r1]
	ldr r2, _08010B44 @ =gUnknown_02024DE8
	strh r0, [r2]
	ldr r4, _08010B18 @ =0x02000000
	ldr r3, _08010B48 @ =0x00016002
	adds r0, r4, r3
	strb r5, [r0]
	ldr r1, _08010B4C @ =0x000160a1
	adds r0, r4, r1
	strb r5, [r0]
	ldr r2, _08010B50 @ =gUnknown_03004324
	strb r5, [r2]
	ldr r3, _08010B54 @ =gUnknown_02024C0C
	strb r5, [r3]
	subs r1, 0x29
	adds r0, r4, r1
	strb r5, [r0]
	ldr r2, _08010B58 @ =0x00016086
	adds r0, r4, r2
	strb r5, [r0]
	ldr r3, _08010B5C @ =0x00016087
	adds r0, r4, r3
	strb r5, [r0]
	ldr r0, _08010B60 @ =gEnemyParty
	movs r1, 0xB
	bl GetMonData
	ldr r2, _08010B64 @ =gBaseStats
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x8]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08010B68 @ =0x000004fb
	bl __divsi3
	ldr r2, _08010B6C @ =0x00016089
	adds r1, r4, r2
	strb r0, [r1]
	ldr r3, _08010B70 @ =0x00016088
	adds r1, r4, r3
	movs r0, 0x3
	strb r0, [r1]
	ldr r1, _08010B74 @ =0x0001601b
	adds r0, r4, r1
	strb r5, [r0]
	subs r2, 0x33
	adds r1, r4, r2
	movs r0, 0x1
	strb r0, [r1]
	movs r2, 0
	movs r1, 0
_08010A12:
	ldr r3, _08010B78 @ =0x000160ac
	adds r0, r2, r3
	adds r0, r4
	strb r1, [r0]
	adds r3, 0x20
	adds r0, r2, r3
	adds r0, r4
	strb r1, [r0]
	adds r3, 0x1C
	adds r0, r2, r3
	adds r0, r4
	strb r1, [r0]
	adds r3, 0x8
	adds r0, r2, r3
	adds r0, r4
	strb r1, [r0]
	adds r3, 0x10
	adds r0, r2, r3
	adds r0, r4
	strb r1, [r0]
	adds r3, 0x8
	adds r0, r2, r3
	adds r0, r4
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x7
	ble _08010A12
	ldr r4, _08010B18 @ =0x02000000
	ldr r1, _08010B7C @ =0x000160c8
	adds r0, r4, r1
	movs r2, 0
	movs r1, 0x6
	strb r1, [r0]
	subs r3, 0x3F
	adds r0, r4, r3
	strb r1, [r0]
	ldr r1, _08010B80 @ =0x00016113
	adds r0, r4, r1
	strb r2, [r0]
	ldr r3, _08010B84 @ =gUnknown_030042E0
	movs r1, 0
	movs r2, 0xA
	adds r0, r3, 0
	adds r0, 0x40
_08010A6A:
	strb r1, [r0]
	subs r0, 0x1
	subs r2, 0x1
	cmp r2, 0
	bge _08010A6A
	movs r1, 0
	strb r1, [r3, 0x13]
	strb r1, [r3]
	strb r1, [r3, 0x1]
	strb r1, [r3, 0x2]
	strb r1, [r3, 0x3]
	strb r1, [r3, 0x4]
	ldrb r2, [r3, 0x5]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	movs r2, 0x3
	negs r2, r2
	ands r0, r2
	strb r0, [r3, 0x5]
	strh r1, [r3, 0x20]
	strh r1, [r3, 0x22]
	strh r1, [r3, 0x24]
	strh r1, [r3, 0x6]
	strh r1, [r3, 0x26]
	strh r1, [r3, 0x28]
	movs r2, 0
	adds r5, r3, 0
	adds r5, 0x8
	movs r4, 0
	adds r1, r3, 0
	adds r1, 0x14
_08010AAA:
	adds r0, r2, r5
	strb r4, [r0]
	strb r4, [r1]
	strb r4, [r1, 0x16]
	adds r1, 0x1
	adds r2, 0x1
	cmp r2, 0x9
	ble _08010AAA
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010AC8: .4byte gUnknown_02024C4C
_08010ACC: .4byte gUnknown_02024C44
_08010AD0: .4byte gUnknown_02024C3C
_08010AD4: .4byte gUnknown_02024C34
_08010AD8: .4byte gUnknown_02024CA8
_08010ADC: .4byte gUnknown_02024C2C
_08010AE0: .4byte gUnknown_02024C54
_08010AE4: .4byte gUnknown_02024C98
_08010AE8: .4byte gUnknown_02024C70
_08010AEC: .4byte gUnknown_02024C5C
_08010AF0: .4byte 0x02017100
_08010AF4: .4byte gUnknown_02024C80
_08010AF8: .4byte gUnknown_02024C7A
_08010AFC: .4byte gPlayerMonIndex
_08010B00: .4byte gEnemyMonIndex
_08010B04: .4byte gBattleWeather
_08010B08: .4byte gUnknown_02024DBC
_08010B0C: .4byte gUnknown_02024C6C
_08010B10: .4byte gBattleTypeFlags
_08010B14: .4byte gSaveBlock2
_08010B18: .4byte 0x02000000
_08010B1C: .4byte 0x00016084
_08010B20: .4byte gUnknown_02024C0E
_08010B24: .4byte gUnknown_02024D26
_08010B28: .4byte gUnknown_02024A64
_08010B2C: .4byte gUnknown_02024D1A
_08010B30: .4byte 0x00017130
_08010B34: .4byte 0x00017160
_08010B38: .4byte gUnknown_02024D1E
_08010B3C: .4byte gUnknown_02024D18
_08010B40: .4byte gBattleMoveDamage
_08010B44: .4byte gUnknown_02024DE8
_08010B48: .4byte 0x00016002
_08010B4C: .4byte 0x000160a1
_08010B50: .4byte gUnknown_03004324
_08010B54: .4byte gUnknown_02024C0C
_08010B58: .4byte 0x00016086
_08010B5C: .4byte 0x00016087
_08010B60: .4byte gEnemyParty
_08010B64: .4byte gBaseStats
_08010B68: .4byte 0x000004fb
_08010B6C: .4byte 0x00016089
_08010B70: .4byte 0x00016088
_08010B74: .4byte 0x0001601b
_08010B78: .4byte 0x000160ac
_08010B7C: .4byte 0x000160c8
_08010B80: .4byte 0x00016113
_08010B84: .4byte gUnknown_030042E0
	thumb_func_end sub_8010874

	thumb_func_start sub_8010B88
sub_8010B88: @ 8010B88
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	ldr r4, _08010CEC @ =gUnknown_02024CA8
	ldr r5, _08010CF0 @ =gUnknown_02024A60
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	mov r1, sp
	adds r0, r4
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r2, _08010CF4 @ =gBattleMoves
	ldr r3, _08010CF8 @ =gUnknown_02024BE6
	ldrh r1, [r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	mov r10, r4
	adds r7, r5, 0
	ldr r1, _08010CFC @ =gBattleMons
	mov r8, r1
	ldr r2, _08010D00 @ =gUnknown_02024C98
	mov r12, r2
	cmp r0, 0x7F
	beq _08010C66
	movs r5, 0
	adds r4, r7, 0
	movs r3, 0x58
	mov r2, r8
	adds r2, 0x18
	movs r1, 0x6
_08010BDC:
	ldrb r0, [r4]
	muls r0, r3
	adds r0, r5, r0
	adds r0, r2
	strb r1, [r0]
	adds r5, 0x1
	cmp r5, 0x7
	ble _08010BDC
	movs r5, 0
	ldr r3, _08010D04 @ =gUnknown_02024A68
	ldrb r3, [r3]
	cmp r5, r3
	bge _08010C52
	ldr r6, _08010D08 @ =gUnknown_02024AD0
	mov r9, r6
	ldr r3, _08010CEC @ =gUnknown_02024CA8
	ldr r4, _08010D00 @ =gUnknown_02024C98
_08010BFE:
	movs r0, 0x58
	muls r0, r5
	add r0, r9
	str r0, [sp, 0x20]
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 19
	ands r0, r1
	cmp r0, 0
	beq _08010C24
	ldrb r0, [r3, 0x14]
	ldr r2, _08010CF0 @ =gUnknown_02024A60
	ldrb r2, [r2]
	cmp r0, r2
	bne _08010C24
	ldr r0, _08010D0C @ =0xfbffffff
	ands r1, r0
	ldr r6, [sp, 0x20]
	str r1, [r6]
_08010C24:
	ldr r1, [r4]
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _08010C44
	ldrb r0, [r3, 0x15]
	ldr r2, _08010CF0 @ =gUnknown_02024A60
	ldrb r2, [r2]
	cmp r0, r2
	bne _08010C44
	movs r0, 0x19
	negs r0, r0
	ands r1, r0
	str r1, [r4]
	movs r0, 0
	strb r0, [r3, 0x15]
_08010C44:
	adds r3, 0x1C
	adds r4, 0x4
	adds r5, 0x1
	ldr r6, _08010D04 @ =gUnknown_02024A68
	ldrb r6, [r6]
	cmp r5, r6
	blt _08010BFE
_08010C52:
	ldr r1, _08010CF8 @ =gUnknown_02024BE6
	ldrh r0, [r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r2, _08010CF4 @ =gBattleMoves
	adds r1, r2
	ldrb r0, [r1]
	cmp r0, 0x7F
	bne _08010D18
_08010C66:
	ldrb r1, [r7]
	movs r0, 0x58
	adds r2, r1, 0
	muls r2, r0
	mov r0, r8
	adds r0, 0x50
	adds r2, r0
	ldr r0, [r2]
	ldr r1, _08010D10 @ =0x15100007
	ands r0, r1
	str r0, [r2]
	ldrb r1, [r7]
	lsls r1, 2
	add r1, r12
	ldr r0, [r1]
	ldr r2, _08010D14 @ =0x0003043f
	ands r0, r2
	str r0, [r1]
	movs r5, 0
	ldr r3, _08010D04 @ =gUnknown_02024A68
	ldrb r3, [r3]
	cmp r5, r3
	bge _08010D30
	movs r6, 0
_08010C96:
	ldrb r0, [r7]
	bl battle_side_get_owner
	adds r4, r0, 0
	lsls r0, r5, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _08010CD6
	ldr r1, _08010D00 @ =gUnknown_02024C98
	lsls r0, r5, 2
	adds r2, r0, r1
	ldr r1, [r2]
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	beq _08010CD6
	ldr r0, _08010CEC @ =gUnknown_02024CA8
	adds r0, r6, r0
	ldrb r0, [r0, 0x15]
	ldrb r3, [r7]
	cmp r0, r3
	bne _08010CD6
	movs r0, 0x19
	negs r0, r0
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	str r1, [r2]
_08010CD6:
	adds r6, 0x1C
	adds r5, 0x1
	ldr r0, _08010D04 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r5, r0
	blt _08010C96
	ldr r6, _08010CEC @ =gUnknown_02024CA8
	mov r10, r6
	ldr r7, _08010CF0 @ =gUnknown_02024A60
	b _08010D30
	.align 2, 0
_08010CEC: .4byte gUnknown_02024CA8
_08010CF0: .4byte gUnknown_02024A60
_08010CF4: .4byte gBattleMoves
_08010CF8: .4byte gUnknown_02024BE6
_08010CFC: .4byte gBattleMons
_08010D00: .4byte gUnknown_02024C98
_08010D04: .4byte gUnknown_02024A68
_08010D08: .4byte gUnknown_02024AD0
_08010D0C: .4byte 0xfbffffff
_08010D10: .4byte 0x15100007
_08010D14: .4byte 0x0003043f
_08010D18:
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	mov r1, r8
	adds r1, 0x50
	adds r0, r1
	movs r1, 0
	str r1, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	add r0, r12
	str r1, [r0]
_08010D30:
	movs r5, 0
	ldr r6, _08010EFC @ =0x02000000
	ldr r0, _08010F00 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r5, r0
	bge _08010D92
	ldr r1, _08010F04 @ =gUnknown_02024AD0
	mov r9, r1
	ldr r2, _08010F08 @ =gBitTable
	mov r8, r2
	ldr r4, _08010F0C @ =gUnknown_02024A60
	mov r12, r6
_08010D48:
	movs r0, 0x58
	muls r0, r5
	mov r1, r9
	adds r3, r0, r1
	ldrb r0, [r4]
	lsls r0, 2
	add r0, r8
	ldr r0, [r0]
	lsls r2, r0, 16
	ldr r1, [r3]
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _08010D68
	bics r1, r2
	str r1, [r3]
_08010D68:
	ldr r1, [r3]
	movs r0, 0xE0
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _08010D88
	ldr r2, _08010F10 @ =0x00016020
	adds r0, r5, r2
	add r0, r12
	ldrb r0, [r0]
	ldrb r2, [r4]
	cmp r0, r2
	bne _08010D88
	ldr r0, _08010F14 @ =0xffff1fff
	ands r1, r0
	str r1, [r3]
_08010D88:
	adds r5, 0x1
	ldr r3, _08010F00 @ =gUnknown_02024A68
	ldrb r3, [r3]
	cmp r5, r3
	blt _08010D48
_08010D92:
	ldrb r0, [r7]
	ldr r1, _08010F18 @ =gUnknown_02024E60
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldrb r0, [r7]
	ldr r2, _08010F1C @ =gUnknown_02024E64
	adds r0, r2
	strb r1, [r0]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	mov r3, r10
	adds r1, r0, r3
	movs r5, 0
	movs r2, 0
_08010DB4:
	adds r0, r1, r5
	strb r2, [r0]
	adds r5, 0x1
	cmp r5, 0x1B
	bls _08010DB4
	ldr r1, _08010F20 @ =gUnknown_02024BE6
	ldrh r0, [r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r2, _08010F24 @ =gBattleMoves
	adds r1, r2
	ldrb r0, [r1]
	cmp r0, 0x7F
	bne _08010E2C
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r10
	mov r1, sp
	ldrb r1, [r1, 0xA]
	strb r1, [r0, 0xA]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r10
	mov r1, sp
	ldrb r1, [r1, 0x15]
	strb r1, [r0, 0x15]
	ldrb r0, [r7]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	add r1, r10
	mov r0, sp
	ldrb r2, [r0, 0xF]
	lsls r2, 28
	movs r4, 0xF
	lsrs r2, 28
	ldrb r3, [r1, 0xF]
	movs r0, 0x10
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0xF]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r10
	mov r1, sp
	ldrb r1, [r1, 0xF]
	lsrs r1, 4
	lsls r1, 4
	ldrb r2, [r0, 0xF]
	ands r4, r2
	orrs r4, r1
	strb r4, [r0, 0xF]
_08010E2C:
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r10
	movs r3, 0
	movs r1, 0x2
	strb r1, [r0, 0x16]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08010F28 @ =gUnknown_02024C34
	adds r0, r1
	movs r2, 0
	strh r3, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08010F2C @ =gUnknown_02024C3C
	adds r0, r1
	strh r3, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08010F30 @ =gUnknown_02024C44
	adds r0, r1
	strh r3, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08010F34 @ =gUnknown_02024C4C
	adds r0, r1
	strh r3, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08010F38 @ =gUnknown_02024C2C
	adds r0, r1
	strh r3, [r0]
	ldrb r0, [r7]
	ldr r1, _08010F3C @ =gUnknown_02024C5C
	adds r0, r1
	movs r1, 0xFF
	strb r1, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _08010F40 @ =0x000160ac
	adds r0, r1
	adds r0, r6
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	adds r0, r6
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	adds r1, 0x53
	adds r0, r1
	adds r0, r6
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	adds r1, 0x1
	adds r0, r1
	adds r0, r6
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	adds r1, 0x1
	adds r0, r1
	adds r0, r6
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	adds r1, 0x1
	adds r0, r1
	adds r0, r6
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	subs r1, 0x1B
	adds r0, r1
	adds r0, r6
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	adds r0, r6
	strb r2, [r0]
	ldr r2, _08010F44 @ =0x00017100
	adds r1, r6, r2
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	str r3, [r0]
	ldr r6, _08010F20 @ =gUnknown_02024BE6
	strh r3, [r6]
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010EFC: .4byte 0x02000000
_08010F00: .4byte gUnknown_02024A68
_08010F04: .4byte gUnknown_02024AD0
_08010F08: .4byte gBitTable
_08010F0C: .4byte gUnknown_02024A60
_08010F10: .4byte 0x00016020
_08010F14: .4byte 0xffff1fff
_08010F18: .4byte gUnknown_02024E60
_08010F1C: .4byte gUnknown_02024E64
_08010F20: .4byte gUnknown_02024BE6
_08010F24: .4byte gBattleMoves
_08010F28: .4byte gUnknown_02024C34
_08010F2C: .4byte gUnknown_02024C3C
_08010F30: .4byte gUnknown_02024C44
_08010F34: .4byte gUnknown_02024C4C
_08010F38: .4byte gUnknown_02024C2C
_08010F3C: .4byte gUnknown_02024C5C
_08010F40: .4byte 0x000160ac
_08010F44: .4byte 0x00017100
	thumb_func_end sub_8010B88

	thumb_func_start sub_8010F48
sub_8010F48: @ 8010F48
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r4, 0
	ldr r7, _08011268 @ =gUnknown_02024A60
	ldr r0, _0801126C @ =gUnknown_02024C98
	mov r9, r0
	ldr r1, _08011270 @ =gUnknown_02024A68
	mov r8, r1
	ldr r2, _08011274 @ =0x02000000
	mov r12, r2
	ldr r6, _08011278 @ =gUnknown_02024D28
	adds r5, r7, 0
	movs r3, 0x58
	ldr r2, _0801127C @ =gBattleMons
	adds r2, 0x18
	movs r1, 0x6
_08010F70:
	ldrb r0, [r5]
	muls r0, r3
	adds r0, r4, r0
	adds r0, r2
	strb r1, [r0]
	adds r4, 0x1
	cmp r4, 0x7
	ble _08010F70
	ldrb r1, [r7]
	movs r0, 0x58
	muls r0, r1
	ldr r2, _0801127C @ =gBattleMons
	adds r2, 0x50
	adds r0, r2
	movs r1, 0
	str r1, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	add r0, r9
	str r1, [r0]
	movs r4, 0
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	bge _08011012
	adds r3, r2, 0
	movs r5, 0
	ldr r1, _08011280 @ =gBitTable
	mov r10, r1
	ldr r2, _08011274 @ =0x02000000
	mov r9, r2
_08010FAE:
	ldr r1, [r3]
	movs r0, 0x80
	lsls r0, 19
	ands r0, r1
	cmp r0, 0
	beq _08010FCC
	ldr r2, _08011284 @ =gUnknown_02024CA8
	adds r0, r5, r2
	ldrb r0, [r0, 0x14]
	ldrb r2, [r7]
	cmp r0, r2
	bne _08010FCC
	ldr r0, _08011288 @ =0xfbffffff
	ands r1, r0
	str r1, [r3]
_08010FCC:
	ldrb r0, [r7]
	lsls r0, 2
	add r0, r10
	ldr r0, [r0]
	lsls r2, r0, 16
	ldr r1, [r3]
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _08010FE4
	bics r1, r2
	str r1, [r3]
_08010FE4:
	ldr r1, [r3]
	movs r0, 0xE0
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _08011004
	ldr r2, _0801128C @ =0x00016020
	adds r0, r4, r2
	add r0, r9
	ldrb r0, [r0]
	ldrb r2, [r7]
	cmp r0, r2
	bne _08011004
	ldr r0, _08011290 @ =0xffff1fff
	ands r1, r0
	str r1, [r3]
_08011004:
	adds r3, 0x58
	adds r5, 0x1C
	adds r4, 0x1
	mov r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt _08010FAE
_08011012:
	ldrb r0, [r7]
	ldr r1, _08011294 @ =gUnknown_02024E60
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	ldrb r0, [r7]
	ldr r2, _08011298 @ =gUnknown_02024E64
	adds r0, r2
	strb r1, [r0]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r2, _08011284 @ =gUnknown_02024CA8
	adds r1, r0, r2
	movs r4, 0
	movs r2, 0
_08011034:
	adds r0, r1, r4
	strb r2, [r0]
	adds r4, 0x1
	cmp r4, 0x1B
	bls _08011034
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r0, 0x2
	negs r0, r0
	mov r9, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r0, 0x3
	negs r0, r0
	mov r8, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r0, 0x9
	negs r0, r0
	mov r10, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r5, 0x21
	negs r5, r5
	adds r0, r5, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r4, 0x41
	negs r4, r4
	adds r0, r4, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1]
	movs r3, 0x7F
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1, 0x1]
	mov r0, r9
	ands r0, r2
	strb r0, [r1, 0x1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1, 0x1]
	mov r0, r8
	ands r0, r2
	strb r0, [r1, 0x1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1, 0x1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldrb r1, [r7]
	lsls r1, 4
	adds r1, r6
	ldrb r2, [r1, 0x1]
	movs r0, 0x19
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r6
	ldrb r1, [r0, 0x1]
	ands r5, r1
	strb r5, [r0, 0x1]
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r6
	ldrb r1, [r0, 0x1]
	ands r4, r1
	strb r4, [r0, 0x1]
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r6
	ldrb r1, [r0, 0x1]
	ands r3, r1
	strb r3, [r0, 0x1]
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r6
	ldrb r1, [r0, 0x2]
	mov r2, r9
	ands r2, r1
	strb r2, [r0, 0x2]
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r6
	ldrb r1, [r0, 0x2]
	mov r2, r8
	ands r2, r1
	strb r2, [r0, 0x2]
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r6
	ldrb r1, [r0, 0x2]
	movs r2, 0x5
	negs r2, r2
	ands r2, r1
	strb r2, [r0, 0x2]
	ldrb r0, [r7]
	lsls r0, 4
	adds r0, r6
	ldrb r1, [r0, 0x2]
	mov r2, r10
	ands r2, r1
	strb r2, [r0, 0x2]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _08011284 @ =gUnknown_02024CA8
	adds r0, r1
	movs r3, 0
	movs r1, 0x2
	strb r1, [r0, 0x16]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r2, _0801129C @ =gUnknown_02024C34
	adds r0, r2
	movs r2, 0
	strh r3, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _080112A0 @ =gUnknown_02024C3C
	adds r0, r1
	strh r3, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _080112A4 @ =gUnknown_02024C44
	adds r0, r1
	strh r3, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _080112A8 @ =gUnknown_02024C4C
	adds r0, r1
	strh r3, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _080112AC @ =gUnknown_02024C2C
	adds r0, r1
	strh r3, [r0]
	ldrb r0, [r7]
	ldr r1, _080112B0 @ =gUnknown_02024C5C
	adds r0, r1
	movs r1, 0xFF
	strb r1, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	ldr r1, _080112B4 @ =0x000160e8
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	subs r1, 0x3D
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	adds r1, 0x53
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	adds r1, 0x1
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	adds r1, 0x1
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldrb r0, [r7]
	lsls r0, 2
	adds r1, 0x1
	adds r0, r1
	add r0, r12
	strb r2, [r0]
	ldr r1, _080112B8 @ =0x00017100
	add r1, r12
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	str r3, [r0]
	ldrb r0, [r7]
	movs r3, 0x58
	adds r1, r0, 0
	muls r1, r3
	ldr r2, _0801127C @ =gBattleMons
	adds r1, r2
	ldrh r2, [r1]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	ldr r2, _080112BC @ =gBaseStats
	adds r0, r2
	ldrb r0, [r0, 0x6]
	adds r1, 0x21
	strb r0, [r1]
	ldrb r0, [r7]
	adds r1, r0, 0
	muls r1, r3
	ldr r0, _0801127C @ =gBattleMons
	adds r1, r0
	ldrh r2, [r1]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	ldr r2, _080112BC @ =gBaseStats
	adds r0, r2
	ldrb r0, [r0, 0x7]
	adds r1, 0x22
	strb r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011268: .4byte gUnknown_02024A60
_0801126C: .4byte gUnknown_02024C98
_08011270: .4byte gUnknown_02024A68
_08011274: .4byte 0x02000000
_08011278: .4byte gUnknown_02024D28
_0801127C: .4byte gBattleMons
_08011280: .4byte gBitTable
_08011284: .4byte gUnknown_02024CA8
_08011288: .4byte 0xfbffffff
_0801128C: .4byte 0x00016020
_08011290: .4byte 0xffff1fff
_08011294: .4byte gUnknown_02024E60
_08011298: .4byte gUnknown_02024E64
_0801129C: .4byte gUnknown_02024C34
_080112A0: .4byte gUnknown_02024C3C
_080112A4: .4byte gUnknown_02024C44
_080112A8: .4byte gUnknown_02024C4C
_080112AC: .4byte gUnknown_02024C2C
_080112B0: .4byte gUnknown_02024C5C
_080112B4: .4byte 0x000160e8
_080112B8: .4byte 0x00017100
_080112BC: .4byte gBaseStats
	thumb_func_end sub_8010F48

	thumb_func_start bc_8012FAC
bc_8012FAC: @ 80112C0
	push {r4,r5,lr}
	ldr r5, _080112D0 @ =gUnknown_02024D1E
	ldrb r0, [r5]
	cmp r0, 0
	beq _080112D4
	cmp r0, 0x1
	beq _080112F8
	b _0801132E
	.align 2, 0
_080112D0: .4byte gUnknown_02024D1E
_080112D4:
	ldr r4, _080112F4 @ =gUnknown_02024A60
	ldrb r0, [r5, 0x1]
	strb r0, [r4]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	bl dp01_build_cmdbuf_x00_a_b_0
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	b _0801132E
	.align 2, 0
_080112F4: .4byte gUnknown_02024A60
_080112F8:
	ldr r0, _0801131C @ =gUnknown_02024A64
	ldr r2, [r0]
	cmp r2, 0
	bne _0801132E
	ldrb r0, [r5, 0x1]
	adds r0, 0x1
	strb r0, [r5, 0x1]
	ldr r1, _08011320 @ =gUnknown_02024A68
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bne _0801132C
	ldr r1, _08011324 @ =gUnknown_030042D4
	ldr r0, _08011328 @ =bc_load_battlefield
	str r0, [r1]
	b _0801132E
	.align 2, 0
_0801131C: .4byte gUnknown_02024A64
_08011320: .4byte gUnknown_02024A68
_08011324: .4byte gUnknown_030042D4
_08011328: .4byte bc_load_battlefield
_0801132C:
	strb r2, [r5]
_0801132E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end bc_8012FAC

	thumb_func_start bc_load_battlefield
bc_load_battlefield: @ 8011334
	push {r4,r5,lr}
	ldr r0, _0801136C @ =gUnknown_02024A64
	ldr r5, [r0]
	cmp r5, 0
	bne _08011364
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r4, _08011370 @ =gUnknown_02024A60
	strb r0, [r4]
	ldr r0, _08011374 @ =gBattleTerrain
	ldrb r1, [r0]
	movs r0, 0
	bl dp01_build_cmdbuf_x2E_a
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _08011378 @ =gUnknown_030042D4
	ldr r0, _0801137C @ =sub_8011384
	str r0, [r1]
	ldr r0, _08011380 @ =gUnknown_02024D1E
	strb r5, [r0]
	strb r5, [r0, 0x1]
_08011364:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801136C: .4byte gUnknown_02024A64
_08011370: .4byte gUnknown_02024A60
_08011374: .4byte gBattleTerrain
_08011378: .4byte gUnknown_030042D4
_0801137C: .4byte sub_8011384
_08011380: .4byte gUnknown_02024D1E
	thumb_func_end bc_load_battlefield

	thumb_func_start sub_8011384
sub_8011384: @ 8011384
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _080113E0 @ =gUnknown_02024A64
	ldr r1, [r0]
	cmp r1, 0
	beq _08011396
	b _080115DA
_08011396:
	ldr r2, _080113E4 @ =gUnknown_02024A60
	strb r1, [r2]
	ldr r0, _080113E8 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r1, r0
	bcc _080113A4
	b _080115D4
_080113A4:
	movs r7, 0x58
	ldr r0, _080113EC @ =gBattleMons
	mov r9, r0
	mov r8, r2
_080113AC:
	ldr r0, _080113F0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080113F4
	ldr r4, _080113E4 @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080113F4
	ldrb r0, [r4]
	muls r0, r7
	mov r1, r9
	adds r3, r0, r1
	movs r2, 0
	movs r1, 0
_080113D2:
	adds r0, r3, r2
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x57
	bls _080113D2
	b _080114BE
	.align 2, 0
_080113E0: .4byte gUnknown_02024A64
_080113E4: .4byte gUnknown_02024A60
_080113E8: .4byte gUnknown_02024A68
_080113EC: .4byte gBattleMons
_080113F0: .4byte gBattleTypeFlags
_080113F4:
	mov r2, r8
	ldrb r0, [r2]
	muls r0, r7
	mov r1, r9
	adds r3, r0, r1
	movs r2, 0
	ldr r6, _08011530 @ =gBaseStats
	ldr r5, _08011534 @ =gUnknown_02024260
	ldr r4, _08011538 @ =gUnknown_02024A60
_08011406:
	adds r0, r3, r2
	ldrb r1, [r4]
	lsls r1, 9
	adds r1, 0x4
	adds r1, r2, r1
	adds r1, r5
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x57
	bls _08011406
	mov r2, r8
	ldrb r0, [r2]
	adds r2, r0, 0
	muls r2, r7
	add r2, r9
	ldrh r1, [r2]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x6]
	adds r2, 0x21
	strb r0, [r2]
	mov r1, r8
	ldrb r0, [r1]
	adds r2, r0, 0
	muls r2, r7
	add r2, r9
	ldrh r1, [r2]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x7]
	adds r2, 0x22
	strb r0, [r2]
	mov r2, r8
	ldrb r0, [r2]
	adds r1, r0, 0
	muls r1, r7
	add r1, r9
	ldrh r0, [r1]
	ldrb r1, [r1, 0x17]
	lsrs r1, 7
	bl GetAbilityBySpecies
	mov r2, r8
	ldrb r1, [r2]
	muls r1, r7
	add r1, r9
	adds r1, 0x20
	strb r0, [r1]
	ldrb r0, [r2]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 23
	ldr r1, _0801153C @ =0x020160bc
	adds r0, r1
	mov r2, r8
	ldrb r1, [r2]
	muls r1, r7
	add r1, r9
	ldrh r1, [r1, 0x28]
	strh r1, [r0]
	movs r2, 0
	ldr r4, _08011538 @ =gUnknown_02024A60
	movs r5, 0x58
	ldr r1, _08011540 @ =gUnknown_02024A98
	adds r6, r4, 0
	movs r0, 0x18
	negs r0, r0
	adds r0, r1
	mov r12, r0
	movs r3, 0x6
_0801149E:
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r2, r0
	adds r0, r1
	strb r3, [r0]
	adds r2, 0x1
	cmp r2, 0x7
	ble _0801149E
	ldrb r0, [r6]
	adds r1, r0, 0
	muls r1, r7
	mov r0, r12
	adds r0, 0x50
	adds r1, r0
	movs r0, 0
	str r0, [r1]
_080114BE:
	ldr r4, _08011538 @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	cmp r0, 0
	bne _080114D8
	movs r0, 0
	bl dp01_build_cmdbuf_x07_7_7_7
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_080114D8:
	ldr r5, _08011544 @ =gBattleTypeFlags
	ldrh r1, [r5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0801154C
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080114FE
	movs r0, 0
	bl dp01_build_cmdbuf_x07_7_7_7
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_080114FE:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08011588
	ldrh r1, [r5]
	ldr r2, _08011548 @ =0x00000902
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _08011588
	ldrb r0, [r4]
	muls r0, r7
	add r0, r9
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
	b _08011588
	.align 2, 0
_08011530: .4byte gBaseStats
_08011534: .4byte gUnknown_02024260
_08011538: .4byte gUnknown_02024A60
_0801153C: .4byte 0x020160bc
_08011540: .4byte gUnknown_02024A98
_08011544: .4byte gBattleTypeFlags
_08011548: .4byte 0x00000902
_0801154C:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08011588
	ldrh r1, [r5]
	ldr r2, _080115E8 @ =0x00000902
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _08011588
	ldrb r0, [r4]
	muls r0, r7
	add r0, r9
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
	movs r0, 0
	bl dp01_build_cmdbuf_x04_4_4_4
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_08011588:
	ldr r0, _080115EC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080115BE
	ldr r4, _080115F0 @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080115B2
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _080115BE
_080115B2:
	movs r0, 0
	bl dp01_build_cmdbuf_x07_7_7_7
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_080115BE:
	mov r1, r8
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, _080115F4 @ =gUnknown_02024A68
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcs _080115D4
	b _080113AC
_080115D4:
	ldr r1, _080115F8 @ =gUnknown_030042D4
	ldr r0, _080115FC @ =bc_801333C
	str r0, [r1]
_080115DA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080115E8: .4byte 0x00000902
_080115EC: .4byte gBattleTypeFlags
_080115F0: .4byte gUnknown_02024A60
_080115F4: .4byte gUnknown_02024A68
_080115F8: .4byte gUnknown_030042D4
_080115FC: .4byte bc_801333C
	thumb_func_end sub_8011384

	thumb_func_start bc_801333C
bc_801333C: @ 8011600
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x30
	ldr r0, _08011658 @ =gUnknown_02024A64
	ldr r0, [r0]
	cmp r0, 0
	beq _08011612
	b _0801178C
_08011612:
	ldr r0, _0801165C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08011620
	b _0801172C
_08011620:
	movs r7, 0
	add r0, sp, 0x4
	mov r8, r0
	mov r6, r8
	mov r5, sp
_0801162A:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _08011660 @ =gEnemyParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _08011650
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	bne _08011668
_08011650:
	ldr r0, _08011664 @ =0x0000ffff
	strh r0, [r5]
	movs r0, 0
	b _0801167A
	.align 2, 0
_08011658: .4byte gUnknown_02024A64
_0801165C: .4byte gBattleTypeFlags
_08011660: .4byte gEnemyParty
_08011664: .4byte 0x0000ffff
_08011668:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
_0801167A:
	str r0, [r6]
	adds r6, 0x8
	adds r5, 0x8
	adds r7, 0x1
	cmp r7, 0x5
	ble _0801162A
	movs r0, 0x1
	bl battle_get_side_with_given_state
	ldr r4, _080116D4 @ =gUnknown_02024A60
	strb r0, [r4]
	movs r0, 0
	mov r1, sp
	movs r2, 0x80
	bl dp01_build_cmdbuf_x30_TODO
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	movs r7, 0
	mov r6, r8
	mov r5, sp
_080116A6:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _080116D8 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _080116CC
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	bne _080116E0
_080116CC:
	ldr r0, _080116DC @ =0x0000ffff
	strh r0, [r5]
	movs r0, 0
	b _080116F2
	.align 2, 0
_080116D4: .4byte gUnknown_02024A60
_080116D8: .4byte gPlayerParty
_080116DC: .4byte 0x0000ffff
_080116E0:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
_080116F2:
	str r0, [r6]
	adds r6, 0x8
	adds r5, 0x8
	adds r7, 0x1
	cmp r7, 0x5
	ble _080116A6
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r4, _08011720 @ =gUnknown_02024A60
	strb r0, [r4]
	movs r0, 0
	mov r1, sp
	movs r2, 0x80
	bl dp01_build_cmdbuf_x30_TODO
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r1, _08011724 @ =gUnknown_030042D4
	ldr r0, _08011728 @ =bc_battle_begin_message
	b _0801178A
	.align 2, 0
_08011720: .4byte gUnknown_02024A60
_08011724: .4byte gUnknown_030042D4
_08011728: .4byte bc_battle_begin_message
_0801172C:
	movs r7, 0
	add r6, sp, 0x4
	mov r5, sp
_08011732:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _08011760 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	cmp r0, 0
	beq _08011758
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	bne _08011768
_08011758:
	ldr r0, _08011764 @ =0x0000ffff
	strh r0, [r5]
	movs r0, 0
	b _0801177A
	.align 2, 0
_08011760: .4byte gPlayerParty
_08011764: .4byte 0x0000ffff
_08011768:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	strh r0, [r5]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
_0801177A:
	str r0, [r6]
	adds r6, 0x8
	adds r5, 0x8
	adds r7, 0x1
	cmp r7, 0x5
	ble _08011732
	ldr r1, _08011798 @ =gUnknown_030042D4
	ldr r0, _0801179C @ =bc_8013568
_0801178A:
	str r0, [r1]
_0801178C:
	add sp, 0x30
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011798: .4byte gUnknown_030042D4
_0801179C: .4byte bc_8013568
	thumb_func_end bc_801333C

	thumb_func_start bc_battle_begin_message
bc_battle_begin_message: @ 80117A0
	push {lr}
	ldr r0, _080117C8 @ =gUnknown_02024A64
	ldr r0, [r0]
	cmp r0, 0
	bne _080117C2
	movs r0, 0x1
	bl battle_get_side_with_given_state
	ldr r1, _080117CC @ =gUnknown_02024A60
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, 0
	bl b_std_message
	ldr r1, _080117D0 @ =gUnknown_030042D4
	ldr r0, _080117D4 @ =sub_8011800
	str r0, [r1]
_080117C2:
	pop {r0}
	bx r0
	.align 2, 0
_080117C8: .4byte gUnknown_02024A64
_080117CC: .4byte gUnknown_02024A60
_080117D0: .4byte gUnknown_030042D4
_080117D4: .4byte sub_8011800
	thumb_func_end bc_battle_begin_message

	thumb_func_start bc_8013568
bc_8013568: @ 80117D8
	push {lr}
	ldr r0, _080117F4 @ =gUnknown_02024A64
	ldr r0, [r0]
	cmp r0, 0
	bne _080117F0
	ldr r1, _080117F8 @ =gUnknown_030042D4
	ldr r0, _080117FC @ =sub_8011970
	str r0, [r1]
	movs r0, 0
	movs r1, 0
	bl b_std_message
_080117F0:
	pop {r0}
	bx r0
	.align 2, 0
_080117F4: .4byte gUnknown_02024A64
_080117F8: .4byte gUnknown_030042D4
_080117FC: .4byte sub_8011970
	thumb_func_end bc_8013568

	thumb_func_start sub_8011800
sub_8011800: @ 8011800
	push {lr}
	ldr r0, _08011828 @ =gUnknown_02024A64
	ldr r0, [r0]
	cmp r0, 0
	bne _08011822
	movs r0, 0x1
	bl battle_get_side_with_given_state
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	bl b_std_message
	ldr r1, _0801182C @ =gUnknown_030042D4
	ldr r0, _08011830 @ =sub_8011834
	str r0, [r1]
_08011822:
	pop {r0}
	bx r0
	.align 2, 0
_08011828: .4byte gUnknown_02024A64
_0801182C: .4byte gUnknown_030042D4
_08011830: .4byte sub_8011834
	thumb_func_end sub_8011800

	thumb_func_start sub_8011834
sub_8011834: @ 8011834
	push {r4,lr}
	ldr r0, _080118AC @ =gUnknown_02024A64
	ldr r1, [r0]
	cmp r1, 0
	bne _080118A4
	ldr r2, _080118B0 @ =gUnknown_02024A60
	strb r1, [r2]
	ldr r0, _080118B4 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r1, r0
	bcs _0801189E
	adds r4, r2, 0
_0801184C:
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08011866
	movs r0, 0
	bl dp01_build_cmdbuf_x2F_2F_2F_2F
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_08011866:
	ldr r0, _080118B8 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801188C
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0801188C
	movs r0, 0
	bl dp01_build_cmdbuf_x2F_2F_2F_2F
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_0801188C:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _080118B4 @ =gUnknown_02024A68
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0801184C
_0801189E:
	ldr r1, _080118BC @ =gUnknown_030042D4
	ldr r0, _080118C0 @ =bc_801362C
	str r0, [r1]
_080118A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080118AC: .4byte gUnknown_02024A64
_080118B0: .4byte gUnknown_02024A60
_080118B4: .4byte gUnknown_02024A68
_080118B8: .4byte gBattleTypeFlags
_080118BC: .4byte gUnknown_030042D4
_080118C0: .4byte bc_801362C
	thumb_func_end sub_8011834

	thumb_func_start bc_801362C
bc_801362C: @ 80118C4
	push {r4,r5,lr}
	ldr r0, _08011930 @ =gUnknown_02024A64
	ldr r1, [r0]
	cmp r1, 0
	bne _0801192A
	ldr r2, _08011934 @ =gUnknown_02024A60
	strb r1, [r2]
	ldr r0, _08011938 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08011924
	adds r4, r2, 0
	ldr r5, _0801193C @ =gBattleMons
_080118DE:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08011912
	ldr r0, _08011940 @ =gBattleTypeFlags
	ldrh r1, [r0]
	ldr r2, _08011944 @ =0x00000902
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _08011912
	ldrb r1, [r4]
	movs r0, 0x58
	muls r0, r1
	adds r0, r5
	ldrh r0, [r0]
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x2
	bl sub_8090D90
_08011912:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08011938 @ =gUnknown_02024A68
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _080118DE
_08011924:
	ldr r1, _08011948 @ =gUnknown_030042D4
	ldr r0, _0801194C @ =sub_8011970
	str r0, [r1]
_0801192A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011930: .4byte gUnknown_02024A64
_08011934: .4byte gUnknown_02024A60
_08011938: .4byte gUnknown_02024A68
_0801193C: .4byte gBattleMons
_08011940: .4byte gBattleTypeFlags
_08011944: .4byte 0x00000902
_08011948: .4byte gUnknown_030042D4
_0801194C: .4byte sub_8011970
	thumb_func_end bc_801362C

	thumb_func_start unref_sub_8011950
unref_sub_8011950: @ 8011950
	push {lr}
	ldr r0, _08011964 @ =gUnknown_02024A64
	ldr r0, [r0]
	cmp r0, 0
	bne _08011960
	ldr r1, _08011968 @ =gUnknown_030042D4
	ldr r0, _0801196C @ =sub_8011970
	str r0, [r1]
_08011960:
	pop {r0}
	bx r0
	.align 2, 0
_08011964: .4byte gUnknown_02024A64
_08011968: .4byte gUnknown_030042D4
_0801196C: .4byte sub_8011970
	thumb_func_end unref_sub_8011950

	thumb_func_start sub_8011970
sub_8011970: @ 8011970
	push {lr}
	ldr r0, _080119A4 @ =gUnknown_02024A64
	ldr r0, [r0]
	cmp r0, 0
	bne _0801199E
	ldr r0, _080119A8 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08011998
	movs r0, 0
	bl battle_get_side_with_given_state
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x1
	bl b_std_message
_08011998:
	ldr r1, _080119AC @ =gUnknown_030042D4
	ldr r0, _080119B0 @ =sub_80119B4
	str r0, [r1]
_0801199E:
	pop {r0}
	bx r0
	.align 2, 0
_080119A4: .4byte gUnknown_02024A64
_080119A8: .4byte gBattleTypeFlags
_080119AC: .4byte gUnknown_030042D4
_080119B0: .4byte sub_80119B4
	thumb_func_end sub_8011970

	thumb_func_start sub_80119B4
sub_80119B4: @ 80119B4
	push {r4,lr}
	ldr r0, _08011A40 @ =gUnknown_02024A64
	ldr r1, [r0]
	cmp r1, 0
	bne _08011A38
	ldr r2, _08011A44 @ =gUnknown_02024A60
	strb r1, [r2]
	ldr r0, _08011A48 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08011A1C
	adds r4, r2, 0
_080119CC:
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	cmp r0, 0
	bne _080119E4
	movs r0, 0
	bl dp01_build_cmdbuf_x2F_2F_2F_2F
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_080119E4:
	ldr r0, _08011A4C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08011A0A
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08011A0A
	movs r0, 0
	bl dp01_build_cmdbuf_x2F_2F_2F_2F
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_08011A0A:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08011A48 @ =gUnknown_02024A68
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _080119CC
_08011A1C:
	ldr r1, _08011A50 @ =0x02000000
	ldr r2, _08011A54 @ =0x00016058
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _08011A58 @ =0x000160f9
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _08011A5C @ =0x000160e6
	adds r1, r0
	strb r2, [r1]
	ldr r1, _08011A60 @ =gUnknown_030042D4
	ldr r0, _08011A64 @ =sub_8011B00
	str r0, [r1]
_08011A38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011A40: .4byte gUnknown_02024A64
_08011A44: .4byte gUnknown_02024A60
_08011A48: .4byte gUnknown_02024A68
_08011A4C: .4byte gBattleTypeFlags
_08011A50: .4byte 0x02000000
_08011A54: .4byte 0x00016058
_08011A58: .4byte 0x000160f9
_08011A5C: .4byte 0x000160e6
_08011A60: .4byte gUnknown_030042D4
_08011A64: .4byte sub_8011B00
	thumb_func_end sub_80119B4

	thumb_func_start unref_sub_8011A68
unref_sub_8011A68: @ 8011A68
	push {r4,r5,lr}
	ldr r0, _08011AD8 @ =gUnknown_02024A64
	ldr r1, [r0]
	cmp r1, 0
	bne _08011AD2
	ldr r2, _08011ADC @ =gUnknown_02024A60
	strb r1, [r2]
	ldr r0, _08011AE0 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08011AB6
	adds r4, r2, 0
	ldr r5, _08011AE4 @ =gUnknown_02024A6A
_08011A82:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08011AA4
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0
	movs r2, 0
	bl sub_800C704
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_08011AA4:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08011AE0 @ =gUnknown_02024A68
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08011A82
_08011AB6:
	ldr r1, _08011AE8 @ =0x02000000
	ldr r2, _08011AEC @ =0x00016058
	adds r0, r1, r2
	movs r2, 0
	strb r2, [r0]
	ldr r3, _08011AF0 @ =0x000160f9
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _08011AF4 @ =0x000160e6
	adds r1, r0
	strb r2, [r1]
	ldr r1, _08011AF8 @ =gUnknown_030042D4
	ldr r0, _08011AFC @ =sub_8011B00
	str r0, [r1]
_08011AD2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011AD8: .4byte gUnknown_02024A64
_08011ADC: .4byte gUnknown_02024A60
_08011AE0: .4byte gUnknown_02024A68
_08011AE4: .4byte gUnknown_02024A6A
_08011AE8: .4byte 0x02000000
_08011AEC: .4byte 0x00016058
_08011AF0: .4byte 0x000160f9
_08011AF4: .4byte 0x000160e6
_08011AF8: .4byte gUnknown_030042D4
_08011AFC: .4byte sub_8011B00
	thumb_func_end unref_sub_8011A68

	thumb_func_start sub_8011B00
sub_8011B00: @ 8011B00
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	movs r0, 0
	mov r9, r0
	ldr r0, _08011B44 @ =gUnknown_02024A64
	ldr r0, [r0]
	cmp r0, 0
	beq _08011B18
	b _08011D6E
_08011B18:
	ldr r0, _08011B48 @ =0x02000000
	ldr r1, _08011B4C @ =0x00016058
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _08011BA2
	movs r5, 0
	ldr r1, _08011B50 @ =gUnknown_02024A68
	adds r3, r1, 0
	ldrb r2, [r1]
	cmp r5, r2
	bge _08011B3E
	ldr r2, _08011B54 @ =gUnknown_02024A7A
_08011B32:
	adds r0, r5, r2
	strb r5, [r0]
	adds r5, 0x1
	ldrb r0, [r1]
	cmp r5, r0
	blt _08011B32
_08011B3E:
	movs r5, 0
	b _08011B98
	.align 2, 0
_08011B44: .4byte gUnknown_02024A64
_08011B48: .4byte 0x02000000
_08011B4C: .4byte 0x00016058
_08011B50: .4byte gUnknown_02024A68
_08011B54: .4byte gUnknown_02024A7A
_08011B58:
	adds r4, r5, 0x1
	mov r8, r4
	ldrb r1, [r1]
	cmp r8, r1
	bge _08011B96
	ldr r6, _08011BC8 @ =gUnknown_02024A7A
	ldr r3, _08011BCC @ =gUnknown_02024A68
	lsls r7, r5, 24
_08011B68:
	adds r0, r5, r6
	ldrb r0, [r0]
	adds r1, r4, r6
	ldrb r1, [r1]
	movs r2, 0x1
	str r3, [sp, 0x4]
	bl b_first_side
	lsls r0, 24
	ldr r3, [sp, 0x4]
	cmp r0, 0
	beq _08011B8C
	lsls r1, r4, 24
	lsrs r1, 24
	lsrs r0, r7, 24
	bl sub_8012FBC
	ldr r3, [sp, 0x4]
_08011B8C:
	adds r4, 0x1
	ldr r0, _08011BCC @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r4, r0
	blt _08011B68
_08011B96:
	mov r5, r8
_08011B98:
	adds r1, r3, 0
	ldrb r0, [r3]
	subs r0, 0x1
	cmp r5, r0
	blt _08011B58
_08011BA2:
	ldr r0, _08011BD0 @ =0x02000000
	ldr r1, _08011BD4 @ =0x000160e6
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	bne _08011BD8
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0xFF
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _08011BD8
	movs r0, 0x1
	strb r0, [r4]
	b _08011D6E
	.align 2, 0
_08011BC8: .4byte gUnknown_02024A7A
_08011BCC: .4byte gUnknown_02024A68
_08011BD0: .4byte 0x02000000
_08011BD4: .4byte 0x000160e6
_08011BD8:
	ldr r0, _08011D7C @ =0x02000000
	ldr r3, _08011D80 @ =0x00016058
	adds r2, r0, r3
	ldr r1, _08011D84 @ =gUnknown_02024A68
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08011C28
	ldr r5, _08011D88 @ =gUnknown_02024A7A
	adds r4, r2, 0
_08011BEC:
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0
	str r0, [sp]
	movs r2, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _08011C0E
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08011C0E:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	mov r1, r9
	cmp r1, 0
	beq _08011C1C
	b _08011D6E
_08011C1C:
	ldr r1, _08011D84 @ =gUnknown_02024A68
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08011BEC
_08011C28:
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08011C42
	b _08011D6E
_08011C42:
	str r0, [sp]
	movs r0, 0xB
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	beq _08011C58
	b _08011D6E
_08011C58:
	ldr r0, _08011D7C @ =0x02000000
	ldr r3, _08011D8C @ =0x000160f9
	adds r2, r0, r3
	ldr r0, _08011D84 @ =gUnknown_02024A68
	ldrb r1, [r2]
	adds r3, r0, 0
	ldrb r0, [r3]
	cmp r1, r0
	bcs _08011CA8
	ldr r5, _08011D88 @ =gUnknown_02024A7A
	adds r4, r2, 0
_08011C6E:
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0
	movs r2, 0
	str r3, [sp, 0x4]
	bl sub_801A02C
	lsls r0, 24
	ldr r3, [sp, 0x4]
	cmp r0, 0
	beq _08011C90
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
_08011C90:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	mov r1, r9
	cmp r1, 0
	bne _08011D6E
	ldr r1, _08011D84 @ =gUnknown_02024A68
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08011C6E
_08011CA8:
	ldrb r0, [r3]
	cmp r0, 0
	beq _08011CB6
	adds r5, r0, 0
_08011CB0:
	subs r5, 0x1
	cmp r5, 0
	bne _08011CB0
_08011CB6:
	movs r5, 0
	ldr r0, _08011D7C @ =0x02000000
	mov r8, r5
	ldr r3, _08011D90 @ =gUnknown_02024C60
	ldr r1, _08011D94 @ =0x00016068
	adds r2, r0, r1
	movs r7, 0x6
	ldr r6, _08011D98 @ =gUnknown_02024C18
	movs r4, 0xFF
_08011CC8:
	strb r7, [r2]
	adds r1, r5, r6
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	mov r0, r8
	strh r0, [r3]
	adds r3, 0x2
	adds r2, 0x1
	adds r5, 0x1
	cmp r5, 0x3
	ble _08011CC8
	movs r0, 0
	bl sub_801365C
	bl sub_801377C
	ldr r0, _08011D7C @ =0x02000000
	ldr r1, _08011D9C @ =gUnknown_02024C0C
	ldrb r1, [r1]
	ldr r2, _08011DA0 @ =0x000160a6
	adds r0, r2
	strb r1, [r0]
	ldr r1, _08011DA4 @ =gUnknown_030042D4
	ldr r0, _08011DA8 @ =sub_8012324
	str r0, [r1]
	bl sub_80156DC
	ldr r1, _08011DAC @ =gUnknown_02024D1E
	movs r2, 0
	adds r0, r1, 0x7
_08011D06:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08011D06
	movs r5, 0
	ldr r3, _08011D84 @ =gUnknown_02024A68
	ldr r2, _08011D7C @ =0x02000000
	ldr r6, _08011DB0 @ =gBattleMoveFlags
	ldrb r0, [r3]
	cmp r5, r0
	bge _08011D36
	ldr r0, _08011DB4 @ =gBattleMons
	movs r4, 0x9
	negs r4, r4
	adds r1, r0, 0
	adds r1, 0x50
_08011D26:
	ldr r0, [r1]
	ands r0, r4
	str r0, [r1]
	adds r1, 0x58
	adds r5, 0x1
	ldrb r0, [r3]
	cmp r5, r0
	blt _08011D26
_08011D36:
	movs r1, 0xB0
	lsls r1, 9
	adds r0, r2, r1
	movs r1, 0
	strb r1, [r0]
	ldr r3, _08011DB8 @ =0x00016001
	adds r0, r2, r3
	strb r1, [r0]
	ldr r3, _08011DBC @ =0x00016110
	adds r0, r2, r3
	strb r1, [r0]
	adds r3, 0x1
	adds r0, r2, r3
	strb r1, [r0]
	ldr r3, _08011DC0 @ =0x0001600c
	adds r0, r2, r3
	strb r1, [r0]
	adds r3, 0x4D
	adds r0, r2, r3
	strb r1, [r0]
	subs r3, 0x4B
	adds r0, r2, r3
	strb r1, [r0]
	strb r1, [r6]
	bl Random
	ldr r1, _08011DC4 @ =gUnknown_02024D1C
	strh r0, [r1]
_08011D6E:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011D7C: .4byte 0x02000000
_08011D80: .4byte 0x00016058
_08011D84: .4byte gUnknown_02024A68
_08011D88: .4byte gUnknown_02024A7A
_08011D8C: .4byte 0x000160f9
_08011D90: .4byte gUnknown_02024C60
_08011D94: .4byte 0x00016068
_08011D98: .4byte gUnknown_02024C18
_08011D9C: .4byte gUnknown_02024C0C
_08011DA0: .4byte 0x000160a6
_08011DA4: .4byte gUnknown_030042D4
_08011DA8: .4byte sub_8012324
_08011DAC: .4byte gUnknown_02024D1E
_08011DB0: .4byte gBattleMoveFlags
_08011DB4: .4byte gBattleMons
_08011DB8: .4byte 0x00016001
_08011DBC: .4byte 0x00016110
_08011DC0: .4byte 0x0001600c
_08011DC4: .4byte gUnknown_02024D1C
	thumb_func_end sub_8011B00

	thumb_func_start bc_8013B1C
bc_8013B1C: @ 8011DC8
	push {r4-r6,lr}
	ldr r0, _08011E60 @ =gUnknown_02024A64
	ldr r0, [r0]
	cmp r0, 0
	bne _08011E5A
	ldr r1, _08011E64 @ =gUnknown_030042D4
	ldr r0, _08011E68 @ =sub_8011E8C
	str r0, [r1]
	ldr r3, _08011E6C @ =gUnknown_02024A68
	ldr r1, _08011E70 @ =gUnknown_02024D1E
	movs r2, 0
	adds r0, r1, 0x7
_08011DE0:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08011DE0
	movs r4, 0
	ldrb r3, [r3]
	cmp r4, r3
	bge _08011E32
	ldr r5, _08011E74 @ =gBattleMons
	adds r6, r5, 0
	adds r6, 0x4C
_08011DF6:
	movs r0, 0x58
	adds r2, r4, 0
	muls r2, r0
	adds r1, r5, 0
	adds r1, 0x50
	adds r1, r2, r1
	ldr r3, [r1]
	subs r0, 0x61
	ands r3, r0
	str r3, [r1]
	adds r2, r6
	ldr r0, [r2]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	beq _08011E28
	movs r0, 0x80
	lsls r0, 5
	ands r3, r0
	cmp r3, 0
	beq _08011E28
	lsls r0, r4, 24
	lsrs r0, 24
	bl b_cancel_multi_turn_move_maybe
_08011E28:
	adds r4, 0x1
	ldr r0, _08011E6C @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r4, r0
	blt _08011DF6
_08011E32:
	ldr r0, _08011E78 @ =0x02000000
	movs r2, 0xB0
	lsls r2, 9
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r3, _08011E7C @ =0x00016001
	adds r1, r0, r3
	strb r2, [r1]
	ldr r3, _08011E80 @ =0x00016110
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _08011E84 @ =0x0001600e
	adds r0, r1
	strb r2, [r0]
	ldr r0, _08011E88 @ =gBattleMoveFlags
	strb r2, [r0]
_08011E5A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08011E60: .4byte gUnknown_02024A64
_08011E64: .4byte gUnknown_030042D4
_08011E68: .4byte sub_8011E8C
_08011E6C: .4byte gUnknown_02024A68
_08011E70: .4byte gUnknown_02024D1E
_08011E74: .4byte gBattleMons
_08011E78: .4byte 0x02000000
_08011E7C: .4byte 0x00016001
_08011E80: .4byte 0x00016110
_08011E84: .4byte 0x0001600e
_08011E88: .4byte gBattleMoveFlags
	thumb_func_end bc_8013B1C

	thumb_func_start sub_8011E8C
sub_8011E8C: @ 8011E8C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r0, 0x1
	bl sub_801365C
	ldr r0, _08011F3C @ =gUnknown_02024D26
	ldrb r0, [r0]
	cmp r0, 0
	bne _08011EBC
	bl sub_8015DFC
	lsls r0, 24
	cmp r0, 0
	beq _08011EB0
	b _08011FEE
_08011EB0:
	bl sub_8016558
	lsls r0, 24
	cmp r0, 0
	beq _08011EBC
	b _08011FEE
_08011EBC:
	bl sub_80173A4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _08011ECA
	b _08011FEE
_08011ECA:
	ldr r5, _08011F40 @ =0x02000000
	ldr r2, _08011F44 @ =0x00016059
	adds r0, r5, r2
	strb r1, [r0]
	bl sub_80170DC
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _08011EE0
	b _08011FEE
_08011EE0:
	movs r0, 0
	bl sub_801365C
	ldr r2, _08011F48 @ =gUnknown_02024C6C
	ldr r0, [r2]
	ldr r1, _08011F4C @ =0xfffffdff
	ands r0, r1
	ldr r1, _08011F50 @ =0xfff7ffff
	ands r0, r1
	ldr r1, _08011F54 @ =0xffbfffff
	ands r0, r1
	ldr r1, _08011F58 @ =0xffefffff
	ands r0, r1
	str r0, [r2]
	ldr r3, _08011F5C @ =0x00016002
	adds r0, r5, r3
	strb r4, [r0]
	ldr r1, _08011F60 @ =0x000160a1
	adds r0, r5, r1
	strb r4, [r0]
	ldr r2, _08011F64 @ =0x0001600c
	adds r0, r5, r2
	strb r4, [r0]
	ldr r0, _08011F68 @ =gBattleMoveDamage
	str r4, [r0]
	ldr r0, _08011F6C @ =gBattleMoveFlags
	strb r4, [r0]
	ldr r1, _08011F70 @ =gUnknown_02024D1E
	movs r2, 0
	adds r0, r1, 0x4
_08011F1C:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08011F1C
	ldr r0, _08011F3C @ =gUnknown_02024D26
	ldrb r0, [r0]
	cmp r0, 0
	beq _08011F80
	ldr r1, _08011F74 @ =gUnknown_02024A7F
	movs r0, 0xC
	strb r0, [r1]
	ldr r1, _08011F78 @ =gUnknown_030042D4
	ldr r0, _08011F7C @ =sub_80138F0
	str r0, [r1]
	b _08011FEE
	.align 2, 0
_08011F3C: .4byte gUnknown_02024D26
_08011F40: .4byte 0x02000000
_08011F44: .4byte 0x00016059
_08011F48: .4byte gUnknown_02024C6C
_08011F4C: .4byte 0xfffffdff
_08011F50: .4byte 0xfff7ffff
_08011F54: .4byte 0xffbfffff
_08011F58: .4byte 0xffefffff
_08011F5C: .4byte 0x00016002
_08011F60: .4byte 0x000160a1
_08011F64: .4byte 0x0001600c
_08011F68: .4byte gBattleMoveDamage
_08011F6C: .4byte gBattleMoveFlags
_08011F70: .4byte gUnknown_02024D1E
_08011F74: .4byte gUnknown_02024A7F
_08011F78: .4byte gUnknown_030042D4
_08011F7C: .4byte sub_80138F0
_08011F80:
	ldr r1, _08011FFC @ =gUnknown_030042E0
	ldrb r0, [r1, 0x13]
	cmp r0, 0xFE
	bhi _08011F8C
	adds r0, 0x1
	strb r0, [r1, 0x13]
_08011F8C:
	movs r2, 0
	ldr r4, _08012000 @ =gUnknown_02024A68
	ldr r3, _08012004 @ =0x02000000
	mov r9, r3
	ldr r0, _08012008 @ =gUnknown_030042D4
	mov r10, r0
	ldr r1, _0801200C @ =gUnknown_02024C0C
	mov r12, r1
	ldr r3, _08012010 @ =sub_8012324
	mov r8, r3
	ldrb r0, [r4]
	cmp r2, r0
	bge _08011FC2
	ldr r7, _08012014 @ =gUnknown_02024C18
	movs r6, 0xFF
	movs r5, 0
	ldr r3, _08012018 @ =gUnknown_02024C60
_08011FAE:
	adds r1, r2, r7
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	strh r5, [r3]
	adds r3, 0x2
	adds r2, 0x1
	ldrb r1, [r4]
	cmp r2, r1
	blt _08011FAE
_08011FC2:
	ldr r0, _08012004 @ =0x02000000
	movs r1, 0x6
	movs r2, 0x3
	ldr r3, _0801201C @ =0x0001606b
	adds r0, r3
_08011FCC:
	strb r1, [r0]
	subs r0, 0x1
	subs r2, 0x1
	cmp r2, 0
	bge _08011FCC
	mov r0, r12
	ldrb r1, [r0]
	ldr r0, _08012020 @ =0x000160a6
	add r0, r9
	strb r1, [r0]
	mov r1, r8
	mov r2, r10
	str r1, [r2]
	bl Random
	ldr r1, _08012024 @ =gUnknown_02024D1C
	strh r0, [r1]
_08011FEE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011FFC: .4byte gUnknown_030042E0
_08012000: .4byte gUnknown_02024A68
_08012004: .4byte 0x02000000
_08012008: .4byte gUnknown_030042D4
_0801200C: .4byte gUnknown_02024C0C
_08012010: .4byte sub_8012324
_08012014: .4byte gUnknown_02024C18
_08012018: .4byte gUnknown_02024C60
_0801201C: .4byte 0x0001606b
_08012020: .4byte 0x000160a6
_08012024: .4byte gUnknown_02024D1C
	thumb_func_end sub_8011E8C

	thumb_func_start sub_8012028
sub_8012028: @ 8012028
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r1, _0801204C @ =gBattleMons
	ldr r0, _08012050 @ =gUnknown_02024A60
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, r0, r1
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _08012058
	ldr r1, _08012054 @ =gEnigmaBerries
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x7]
	b _08012062
	.align 2, 0
_0801204C: .4byte gBattleMons
_08012050: .4byte gUnknown_02024A60
_08012054: .4byte gEnigmaBerries
_08012058:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r2, r0, 24
_08012062:
	ldr r1, _0801217C @ =gUnknown_02024C0B
	ldr r3, _08012180 @ =gUnknown_02024A60
	ldrb r0, [r3]
	strb r0, [r1]
	cmp r2, 0x25
	bne _08012070
	b _080121F4
_08012070:
	ldr r0, _08012184 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0801207E
	b _080121F4
_0801207E:
	ldr r1, _08012188 @ =gBattleMons
	ldrb r2, [r3]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x32
	bne _08012092
	b _080121F4
_08012092:
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r0, _0801218C @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r5, r0
	bge _08012126
	movs r7, 0
_080120A8:
	lsrs r4, r7, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	beq _080120CC
	ldr r1, _08012188 @ =gBattleMons
	movs r0, 0x58
	muls r0, r5
	adds r0, r1
	adds r2, r0, 0
	adds r2, 0x20
	ldrb r0, [r2]
	cmp r0, 0x17
	bne _080120CC
	b _080121FC
_080120CC:
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	beq _08012116
	ldr r3, _08012188 @ =gBattleMons
	ldr r0, _08012180 @ =gUnknown_02024A60
	ldrb r0, [r0]
	movs r2, 0x58
	muls r0, r2
	adds r1, r0, r3
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1A
	beq _08012116
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08012116
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08012116
	adds r0, r5, 0
	muls r0, r2
	adds r0, r3
	adds r2, r0, 0
	adds r2, 0x20
	ldrb r0, [r2]
	cmp r0, 0x47
	bne _08012116
	b _08012220
_08012116:
	movs r0, 0x80
	lsls r0, 17
	adds r7, r0
	adds r5, 0x1
	ldr r0, _0801218C @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r5, r0
	blt _080120A8
_08012126:
	ldr r4, _08012180 @ =gUnknown_02024A60
	ldrb r1, [r4]
	movs r0, 0
	str r0, [sp]
	movs r0, 0xF
	movs r2, 0x2A
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _080121A0
	ldr r6, _08012188 @ =gBattleMons
	ldrb r0, [r4]
	movs r3, 0x58
	muls r0, r3
	adds r1, r0, r6
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x8
	beq _0801215E
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _080121A0
_0801215E:
	ldr r0, _08012190 @ =0x02000000
	subs r1, r5, 0x1
	ldr r2, _08012194 @ =0x00016003
	adds r0, r2
	strb r1, [r0]
	ldr r2, _08012198 @ =byte_2024C06
	adds r0, r1, 0
	muls r0, r3
	adds r0, r6
	adds r0, 0x20
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r1, _0801219C @ =gUnknown_02024D1E
	movs r0, 0x2
	b _08012248
	.align 2, 0
_0801217C: .4byte gUnknown_02024C0B
_08012180: .4byte gUnknown_02024A60
_08012184: .4byte gBattleTypeFlags
_08012188: .4byte gBattleMons
_0801218C: .4byte gUnknown_02024A68
_08012190: .4byte 0x02000000
_08012194: .4byte 0x00016003
_08012198: .4byte byte_2024C06
_0801219C: .4byte gUnknown_02024D1E
_080121A0:
	ldr r1, _080121D4 @ =gBattleMons
	ldr r0, _080121D8 @ =gUnknown_02024A60
	ldrb r2, [r0]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080121DC @ =0x0400e000
	ands r0, r1
	cmp r0, 0
	bne _080121CA
	ldr r1, _080121E0 @ =gUnknown_02024C98
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 3
	ands r0, r1
	cmp r0, 0
	beq _080121E8
_080121CA:
	ldr r1, _080121E4 @ =gUnknown_02024D1E
	movs r0, 0
	strb r0, [r1, 0x5]
	movs r0, 0x1
	b _0801224A
	.align 2, 0
_080121D4: .4byte gBattleMons
_080121D8: .4byte gUnknown_02024A60
_080121DC: .4byte 0x0400e000
_080121E0: .4byte gUnknown_02024C98
_080121E4: .4byte gUnknown_02024D1E
_080121E8:
	ldr r0, _080121F8 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08012244
_080121F4:
	movs r0, 0
	b _0801224A
	.align 2, 0
_080121F8: .4byte gBattleTypeFlags
_080121FC:
	ldr r0, _08012210 @ =0x02000000
	ldr r1, _08012214 @ =0x00016003
	adds r0, r1
	strb r5, [r0]
	ldr r1, _08012218 @ =byte_2024C06
	ldrb r0, [r2]
	strb r0, [r1]
	ldr r1, _0801221C @ =gUnknown_02024D1E
	movs r0, 0x2
	b _08012248
	.align 2, 0
_08012210: .4byte 0x02000000
_08012214: .4byte 0x00016003
_08012218: .4byte byte_2024C06
_0801221C: .4byte gUnknown_02024D1E
_08012220:
	ldr r0, _08012234 @ =0x02000000
	ldr r1, _08012238 @ =0x00016003
	adds r0, r1
	strb r5, [r0]
	ldr r1, _0801223C @ =byte_2024C06
	ldrb r0, [r2]
	strb r0, [r1]
	ldr r1, _08012240 @ =gUnknown_02024D1E
	movs r0, 0x2
	b _08012248
	.align 2, 0
_08012234: .4byte 0x02000000
_08012238: .4byte 0x00016003
_0801223C: .4byte byte_2024C06
_08012240: .4byte gUnknown_02024D1E
_08012244:
	ldr r1, _08012254 @ =gUnknown_02024D1E
	movs r0, 0x1
_08012248:
	strb r0, [r1, 0x5]
_0801224A:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08012254: .4byte gUnknown_02024D1E
	thumb_func_end sub_8012028

	thumb_func_start sub_8012258
sub_8012258: @ 8012258
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0
	ldr r7, _080122E4 @ =gUnknown_02024A6A
	ldr r4, _080122E8 @ =gUnknown_02038470
	ldr r1, _080122EC @ =0x02000000
	lsls r6, r5, 1
	ldr r2, _080122F0 @ =0x0001606c
	adds r0, r5, r2
	adds r0, r6, r0
	adds r2, r0, r1
_08012270:
	adds r1, r3, r4
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x2
	ble _08012270
	adds r0, r6, r7
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r7, _080122EC @ =0x02000000
	ldr r1, _080122F4 @ =0x00016068
	adds r0, r5, r1
	adds r0, r7
	ldrb r0, [r0]
	bl pokemon_order_func
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8094C98
	ldr r0, _080122F8 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080122FC
	movs r3, 0
	ldr r2, _080122F0 @ =0x0001606c
	movs r0, 0x2
	adds r1, r5, 0
	eors r1, r0
	adds r0, r5, r2
	adds r0, r6, r0
	adds r4, r0, r7
	ldr r5, _080122E8 @ =gUnknown_02038470
	lsls r0, r1, 1
	adds r0, r1
	adds r0, r2
	adds r2, r0, r7
_080122CC:
	adds r0, r3, r5
	ldrb r1, [r0]
	strb r1, [r4]
	ldrb r0, [r0]
	strb r0, [r2]
	adds r4, 0x1
	adds r2, 0x1
	adds r3, 0x1
	cmp r3, 0x2
	ble _080122CC
	b _08012316
	.align 2, 0
_080122E4: .4byte gUnknown_02024A6A
_080122E8: .4byte gUnknown_02038470
_080122EC: .4byte 0x02000000
_080122F0: .4byte 0x0001606c
_080122F4: .4byte 0x00016068
_080122F8: .4byte gBattleTypeFlags
_080122FC:
	movs r3, 0
	ldr r2, _0801231C @ =0x0001606c
	adds r0, r5, r2
	adds r0, r6, r0
	adds r1, r0, r7
	ldr r2, _08012320 @ =gUnknown_02038470
_08012308:
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, 0x1
	adds r3, 0x1
	cmp r3, 0x2
	ble _08012308
_08012316:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801231C: .4byte 0x0001606c
_08012320: .4byte gUnknown_02038470
	thumb_func_end sub_8012258

	thumb_func_start sub_8012324
sub_8012324: @ 8012324
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r0, _08012340 @ =gUnknown_02024D1E
	movs r1, 0
	strb r1, [r0, 0x4]
	ldr r0, _08012344 @ =gUnknown_02024A60
	strb r1, [r0]
	ldr r0, _08012348 @ =gUnknown_02024A68
	bl _08012F74
	.align 2, 0
_08012340: .4byte gUnknown_02024D1E
_08012344: .4byte gUnknown_02024A60
_08012348: .4byte gUnknown_02024A68
_0801234C:
	ldr r4, _08012374 @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08012378 @ =gUnknown_02024D1E
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x6
	bls _08012368
	bl _08012F66
_08012368:
	lsls r0, 2
	ldr r1, _0801237C @ =_08012380
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012374: .4byte gUnknown_02024A60
_08012378: .4byte gUnknown_02024D1E
_0801237C: .4byte _08012380
	.align 2, 0
_08012380:
	.4byte _0801239C
	.4byte _080124C8
	.4byte _08012A28
	.4byte _08012DA8
	.4byte _08012E50
	.4byte _08012E94
	.4byte _08012F38
_0801239C:
	ldr r4, _08012434 @ =0x02000000
	ldr r0, _08012438 @ =gUnknown_02024A60
	ldrb r0, [r0]
	ldr r1, _0801243C @ =0x00016068
	adds r0, r1
	adds r0, r4
	movs r1, 0x6
	strb r1, [r0]
	ldr r0, _08012440 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080123F8
	movs r1, 0x2
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _080123F8
	eors r5, r1
	adds r0, r5, 0
	bl battle_get_side_with_given_state
	ldr r2, _08012444 @ =0x000160a6
	adds r1, r4, r2
	ldrb r1, [r1]
	ldr r2, _08012448 @ =gBitTable
	lsls r0, 24
	lsrs r0, 22
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080123F8
	ldr r4, _0801244C @ =gUnknown_02024D1E
	adds r0, r5, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x4
	beq _080123F8
	bl _08012F66
_080123F8:
	ldr r0, _08012434 @ =0x02000000
	ldr r3, _08012444 @ =0x000160a6
	adds r0, r3
	ldrb r3, [r0]
	ldr r1, _08012448 @ =gBitTable
	ldr r4, _08012438 @ =gUnknown_02024A60
	ldrb r2, [r4]
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	ands r3, r0
	cmp r3, 0
	beq _08012468
	ldr r0, _08012450 @ =gUnknown_02024C18
	adds r0, r2, r0
	movs r1, 0xD
	strb r1, [r0]
	ldr r0, _08012440 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _08012454
	ldr r0, _0801244C @ =gUnknown_02024D1E
	ldrb r1, [r4]
	adds r1, r0
	movs r0, 0x4
	strb r0, [r1]
	bl _08012F66
	.align 2, 0
_08012434: .4byte 0x02000000
_08012438: .4byte gUnknown_02024A60
_0801243C: .4byte 0x00016068
_08012440: .4byte gBattleTypeFlags
_08012444: .4byte 0x000160a6
_08012448: .4byte gBitTable
_0801244C: .4byte gUnknown_02024D1E
_08012450: .4byte gUnknown_02024C18
_08012454:
	ldr r0, _08012464 @ =gUnknown_02024D1E
	ldrb r1, [r4]
	adds r1, r0
	movs r0, 0x3
	strb r0, [r1]
	bl _08012F66
	.align 2, 0
_08012464: .4byte gUnknown_02024D1E
_08012468:
	ldr r1, _0801249C @ =gBattleMons
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r1, [r0]
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	bne _08012488
	movs r0, 0x80
	lsls r0, 15
	ands r1, r0
	cmp r1, 0
	beq _080124A8
_08012488:
	ldr r0, _080124A0 @ =gUnknown_02024C18
	adds r0, r2, r0
	strb r3, [r0]
	ldr r1, _080124A4 @ =gUnknown_02024D1E
	ldrb r0, [r4]
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	bl _08012F66
	.align 2, 0
_0801249C: .4byte gBattleMons
_080124A0: .4byte gUnknown_02024C18
_080124A4: .4byte gUnknown_02024D1E
_080124A8:
	ldr r0, _080124C0 @ =gUnknown_02024C18
	ldrb r1, [r0]
	ldr r0, _080124C4 @ =gUnknown_02024260
	ldrb r2, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r2, r0
	movs r0, 0
	bl dp01_build_cmdbuf_x12_a_bb
	bl _08012E32
	.align 2, 0
_080124C0: .4byte gUnknown_02024C18
_080124C4: .4byte gUnknown_02024260
_080124C8:
	ldr r4, _08012520 @ =gUnknown_02024A64
	ldr r1, _08012524 @ =gBitTable
	ldr r3, _08012528 @ =gUnknown_02024A60
	ldrb r5, [r3]
	lsls r0, r5, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r0, r2, 4
	movs r1, 0xF0
	lsls r1, 24
	orrs r0, r1
	orrs r0, r2
	lsls r1, r2, 8
	orrs r0, r1
	lsls r2, 12
	orrs r0, r2
	ldr r1, [r4]
	ands r1, r0
	mov r8, r3
	cmp r1, 0
	beq _080124F6
	bl _08012F66
_080124F6:
	ldr r2, _0801252C @ =gUnknown_02024C18
	adds r2, r5, r2
	ldr r1, _08012530 @ =gUnknown_02024260
	lsls r0, r5, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldrb r0, [r3]
	lsls r0, 9
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xC
	bls _08012514
	b _08012968
_08012514:
	lsls r0, 2
	ldr r1, _08012534 @ =_08012538
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012520: .4byte gUnknown_02024A64
_08012524: .4byte gBitTable
_08012528: .4byte gUnknown_02024A60
_0801252C: .4byte gUnknown_02024C18
_08012530: .4byte gUnknown_02024260
_08012534: .4byte _08012538
	.align 2, 0
_08012538:
	.4byte _0801256C
	.4byte _080126B4
	.4byte _080126E0
	.4byte _08012968
	.4byte _08012968
	.4byte _080128B0
	.4byte _08012908
	.4byte _08012968
	.4byte _08012968
	.4byte _08012968
	.4byte _08012968
	.4byte _08012968
	.4byte _0801292C
_0801256C:
	bl sub_8015C90
	lsls r0, 24
	cmp r0, 0
	beq _080125D0
	ldr r0, _080125B4 @ =gUnknown_02024D1E
	ldr r2, _080125B8 @ =gUnknown_02024A60
	ldrb r1, [r2]
	adds r1, r0
	movs r4, 0
	movs r0, 0x5
	strb r0, [r1]
	ldr r3, _080125BC @ =0x02000000
	ldrb r0, [r2]
	ldr r1, _080125C0 @ =0x00016060
	adds r0, r1
	adds r0, r3
	strb r4, [r0]
	ldrb r0, [r2]
	ldr r4, _080125C4 @ =0x00016094
	adds r0, r4
	adds r0, r3
	movs r1, 0x3
	strb r1, [r0]
	ldrb r1, [r2]
	ldr r0, _080125C8 @ =0x00016010
	adds r2, r1, r0
	adds r2, r3
	ldr r0, _080125CC @ =gUnknown_02024260
	lsls r1, 9
	adds r0, 0x3
	adds r1, r0
	ldrb r0, [r1]
	strb r0, [r2]
	bl _08012F90
	.align 2, 0
_080125B4: .4byte gUnknown_02024D1E
_080125B8: .4byte gUnknown_02024A60
_080125BC: .4byte 0x02000000
_080125C0: .4byte 0x00016060
_080125C4: .4byte 0x00016094
_080125C8: .4byte 0x00016010
_080125CC: .4byte gUnknown_02024260
_080125D0:
	ldr r1, _080125FC @ =gUnknown_02024CA8
	ldr r5, _08012600 @ =gUnknown_02024A60
	ldrb r4, [r5]
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r2, [r0, 0x6]
	cmp r2, 0
	beq _0801260C
	ldr r1, _08012604 @ =gUnknown_02024C60
	lsls r0, r4, 1
	adds r0, r1
	strh r2, [r0]
	ldr r1, _08012608 @ =gUnknown_02024D1E
	ldrb r0, [r5]
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0]
	bl _08012F90
	.align 2, 0
_080125FC: .4byte gUnknown_02024CA8
_08012600: .4byte gUnknown_02024A60
_08012604: .4byte gUnknown_02024C60
_08012608: .4byte gUnknown_02024D1E
_0801260C:
	add r2, sp, 0x4
	ldr r3, _080126AC @ =gBattleMons
	movs r1, 0x58
	adds r0, r4, 0
	muls r0, r1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2, 0x10]
	ldrb r0, [r5]
	muls r0, r1
	adds r0, r3
	adds r0, 0x21
	ldrb r0, [r0]
	strb r0, [r2, 0x12]
	ldrb r0, [r5]
	muls r0, r1
	adds r0, r3
	adds r0, 0x22
	ldrb r0, [r0]
	strb r0, [r2, 0x13]
	movs r4, 0
	mov r1, sp
	adds r1, 0xC
	str r1, [sp, 0x18]
	add r2, sp, 0x10
	mov r10, r2
	mov r8, r3
	adds r7, r5, 0
	movs r6, 0x58
	movs r3, 0xC
	add r3, r8
	mov r9, r3
	add r5, sp, 0x4
_0801264E:
	lsls r2, r4, 1
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r2, r0
	add r0, r9
	ldrh r0, [r0]
	strh r0, [r5]
	ldr r0, [sp, 0x18]
	adds r3, r0, r4
	ldrb r0, [r7]
	muls r0, r6
	adds r0, r4, r0
	mov r1, r8
	adds r1, 0x24
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r3]
	ldrb r0, [r7]
	adds r1, r0, 0
	muls r1, r6
	adds r2, r1
	add r2, r9
	ldrh r0, [r2]
	add r1, r8
	adds r1, 0x3B
	ldrb r1, [r1]
	lsls r2, r4, 24
	lsrs r2, 24
	bl CalculatePPWithBonus
	mov r2, r10
	adds r1, r2, r4
	strb r0, [r1]
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0801264E
	ldr r0, _080126B0 @ =gBattleTypeFlags
	ldrb r0, [r0]
	movs r1, 0x1
	ands r1, r0
	movs r0, 0
	movs r2, 0
	add r3, sp, 0x4
	bl sub_800CBA4
	b _0801289E
	.align 2, 0
_080126AC: .4byte gBattleMons
_080126B0: .4byte gBattleTypeFlags
_080126B4:
	ldr r0, _080126D0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	ldr r0, _080126D4 @ =0x00000902
	ands r0, r1
	cmp r0, 0
	bne _080126C2
	b _08012908
_080126C2:
	ldr r1, _080126D8 @ =gUnknown_02024C1C
	mov r3, r8
	ldrb r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080126DC @ =gUnknown_081D9B29
	b _080129CC
	.align 2, 0
_080126D0: .4byte gBattleTypeFlags
_080126D4: .4byte 0x00000902
_080126D8: .4byte gUnknown_02024C1C
_080126DC: .4byte gUnknown_081D9B29
_080126E0:
	ldr r3, _08012738 @ =0x02000000
	ldr r5, _0801273C @ =gUnknown_02024A60
	ldrb r0, [r5]
	ldr r4, _08012740 @ =0x00016064
	adds r1, r0, r4
	adds r1, r3
	ldr r2, _08012744 @ =gUnknown_02024A6A
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1]
	ldr r7, _08012748 @ =gBattleMons
	ldrb r2, [r5]
	movs r6, 0x58
	adds r0, r2, 0
	muls r0, r6
	adds r1, r7, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _0801274C @ =0x0400e000
	ands r0, r1
	cmp r0, 0
	bne _08012722
	ldr r0, _08012750 @ =gUnknown_02024C98
	lsls r1, r2, 2
	adds r1, r0
	ldr r1, [r1]
	movs r0, 0x80
	lsls r0, 3
	ands r1, r0
	cmp r1, 0
	beq _08012758
_08012722:
	lsls r0, r2, 1
	adds r0, r2
	ldr r2, _08012754 @ =0x0001606c
	adds r1, r3, r2
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x6
	b _0801286C
	.align 2, 0
_08012738: .4byte 0x02000000
_0801273C: .4byte gUnknown_02024A60
_08012740: .4byte 0x00016064
_08012744: .4byte gUnknown_02024A6A
_08012748: .4byte gBattleMons
_0801274C: .4byte 0x0400e000
_08012750: .4byte gUnknown_02024C98
_08012754: .4byte 0x0001606c
_08012758:
	str r1, [sp]
	movs r0, 0xC
	adds r1, r2, 0
	movs r2, 0x17
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080127E0
	ldrb r1, [r5]
	str r4, [sp]
	movs r0, 0xC
	movs r2, 0x47
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080127A8
	ldrb r0, [r5]
	muls r0, r6
	adds r1, r0, r7
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080127A8
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080127A8
	adds r0, r1, 0
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1A
	bne _080127E0
_080127A8:
	ldr r5, _08012808 @ =gUnknown_02024A60
	ldrb r1, [r5]
	movs r0, 0
	str r0, [sp]
	movs r0, 0xF
	movs r2, 0x2A
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _08012818
	ldr r2, _0801280C @ =gBattleMons
	ldrb r1, [r5]
	movs r0, 0x58
	muls r0, r1
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0x8
	beq _080127E0
	adds r0, r1, 0
	adds r0, 0x22
	ldrb r0, [r0]
	cmp r0, 0x8
	bne _08012818
_080127E0:
	subs r1, r4, 0x1
	lsls r1, 4
	movs r0, 0x4
	orrs r1, r0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08012810 @ =byte_2024C06
	ldrb r3, [r0]
	ldr r0, _08012808 @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 1
	adds r0, r2
	ldr r2, _08012814 @ =0x0201606c
	adds r0, r2
	str r0, [sp]
	movs r0, 0
	movs r2, 0x6
	bl dp01_build_cmdbuf_x16_a_b_c_ptr_d_e_f
	b _0801289E
	.align 2, 0
_08012808: .4byte gUnknown_02024A60
_0801280C: .4byte gBattleMons
_08012810: .4byte byte_2024C06
_08012814: .4byte 0x0201606c
_08012818:
	ldr r0, _08012830 @ =gUnknown_02024A60
	ldrb r1, [r0]
	mov r8, r0
	cmp r1, 0x2
	bne _08012840
	ldr r0, _08012834 @ =gUnknown_02024C18
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08012840
	ldr r3, _08012838 @ =0x02000000
	ldr r4, _0801283C @ =0x00016068
	b _08012854
	.align 2, 0
_08012830: .4byte gUnknown_02024A60
_08012834: .4byte gUnknown_02024C18
_08012838: .4byte 0x02000000
_0801283C: .4byte 0x00016068
_08012840:
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, 0x3
	bne _08012884
	ldr r0, _08012874 @ =gUnknown_02024C18
	ldrb r0, [r0, 0x1]
	cmp r0, 0x2
	bne _08012884
	ldr r3, _08012878 @ =0x02000000
	ldr r4, _0801287C @ =0x00016069
_08012854:
	adds r0, r3, r4
	ldrb r2, [r0]
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	ldr r1, _08012880 @ =0x0001606c
	adds r3, r1
	adds r0, r3
	str r0, [sp]
	movs r0, 0
	movs r1, 0
_0801286C:
	movs r3, 0
	bl dp01_build_cmdbuf_x16_a_b_c_ptr_d_e_f
	b _0801289E
	.align 2, 0
_08012874: .4byte gUnknown_02024C18
_08012878: .4byte 0x02000000
_0801287C: .4byte 0x00016069
_08012880: .4byte 0x0001606c
_08012884:
	ldr r0, _080128A8 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	ldr r1, _080128AC @ =0x0201606c
	adds r0, r1
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r2, 0x6
	movs r3, 0
	bl dp01_build_cmdbuf_x16_a_b_c_ptr_d_e_f
_0801289E:
	ldr r0, _080128A8 @ =gUnknown_02024A60
	ldrb r0, [r0]
	bl dp01_battle_side_mark_buffer_for_execution
	b _08012968
	.align 2, 0
_080128A8: .4byte gUnknown_02024A60
_080128AC: .4byte 0x0201606c
_080128B0:
	bl PlayerPartyAndPokemonStorageFull
	lsls r0, 24
	cmp r0, 0
	beq _08012968
	ldr r1, _080128EC @ =gUnknown_02024C1C
	ldr r2, _080128F0 @ =gUnknown_02024A60
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _080128F4 @ =gUnknown_081D8E4A
	str r1, [r0]
	ldr r0, _080128F8 @ =gUnknown_02024D1E
	ldrb r1, [r2]
	adds r1, r0
	movs r3, 0
	movs r0, 0x5
	strb r0, [r1]
	ldr r1, _080128FC @ =0x02000000
	ldrb r0, [r2]
	ldr r4, _08012900 @ =0x00016060
	adds r0, r4
	adds r0, r1
	strb r3, [r0]
	ldrb r0, [r2]
	ldr r2, _08012904 @ =0x00016094
	adds r0, r2
	adds r0, r1
	strb r3, [r0]
	b _08012F90
	.align 2, 0
_080128EC: .4byte gUnknown_02024C1C
_080128F0: .4byte gUnknown_02024A60
_080128F4: .4byte gUnknown_081D8E4A
_080128F8: .4byte gUnknown_02024D1E
_080128FC: .4byte 0x02000000
_08012900: .4byte 0x00016060
_08012904: .4byte 0x00016094
_08012908:
	ldr r4, _08012924 @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	ldr r0, _08012928 @ =0x0201606c
	adds r1, r0
	movs r0, 0
	bl sub_800CBE0
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	b _08012968
	.align 2, 0
_08012924: .4byte gUnknown_02024A60
_08012928: .4byte 0x0201606c
_0801292C:
	ldr r4, _08012964 @ =gUnknown_02024D1E
	mov r3, r8
	ldrb r1, [r3]
	adds r1, r4
	movs r5, 0
	movs r0, 0x6
	strb r0, [r1]
	ldrb r0, [r3]
	bl battle_get_per_side_status
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	strb r5, [r0]
	movs r0, 0
	bl dp01_build_cmdbuf_x32_32_32_32
	mov r4, r8
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	b _08012F90
	.align 2, 0
_08012964: .4byte gUnknown_02024D1E
_08012968:
	ldr r0, _08012994 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0xA
	ands r0, r1
	cmp r0, 0x8
	bne _080129A8
	ldr r0, _08012998 @ =gUnknown_02024260
	ldr r4, _0801299C @ =gUnknown_02024A60
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x3
	bne _080129A8
	ldr r0, _080129A0 @ =gUnknown_081D8E37
	bl b_call_bc_move_exec
	ldr r1, _080129A4 @ =gUnknown_02024D1E
	ldrb r0, [r4]
	adds r0, r1
	b _08012BFE
	.align 2, 0
_08012994: .4byte gBattleTypeFlags
_08012998: .4byte gUnknown_02024260
_0801299C: .4byte gUnknown_02024A60
_080129A0: .4byte gUnknown_081D8E37
_080129A4: .4byte gUnknown_02024D1E
_080129A8:
	bl sub_8012028
	lsls r0, 24
	cmp r0, 0
	beq _08012A14
	ldr r0, _080129F4 @ =gUnknown_02024260
	ldr r3, _080129F8 @ =gUnknown_02024A60
	ldrb r2, [r3]
	lsls r1, r2, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x3
	bne _08012A14
	ldr r1, _080129FC @ =gUnknown_02024C1C
	lsls r0, r2, 2
	adds r0, r1
	ldr r1, _08012A00 @ =gUnknown_081D8E44
_080129CC:
	str r1, [r0]
	ldr r0, _08012A04 @ =gUnknown_02024D1E
	ldrb r1, [r3]
	adds r1, r0
	movs r2, 0
	movs r0, 0x5
	strb r0, [r1]
	ldr r1, _08012A08 @ =0x02000000
	ldrb r0, [r3]
	ldr r4, _08012A0C @ =0x00016060
	adds r0, r4
	adds r0, r1
	strb r2, [r0]
	ldrb r0, [r3]
	ldr r3, _08012A10 @ =0x00016094
	adds r0, r3
	adds r0, r1
	strb r2, [r0]
	b _08012F90
	.align 2, 0
_080129F4: .4byte gUnknown_02024260
_080129F8: .4byte gUnknown_02024A60
_080129FC: .4byte gUnknown_02024C1C
_08012A00: .4byte gUnknown_081D8E44
_08012A04: .4byte gUnknown_02024D1E
_08012A08: .4byte 0x02000000
_08012A0C: .4byte 0x00016060
_08012A10: .4byte 0x00016094
_08012A14:
	ldr r2, _08012A20 @ =gUnknown_02024D1E
	ldr r0, _08012A24 @ =gUnknown_02024A60
	ldrb r1, [r0]
	adds r1, r2
	b _08012E3E
	.align 2, 0
_08012A20: .4byte gUnknown_02024D1E
_08012A24: .4byte gUnknown_02024A60
_08012A28:
	ldr r4, _08012A6C @ =gUnknown_02024A64
	ldr r1, _08012A70 @ =gBitTable
	ldr r3, _08012A74 @ =gUnknown_02024A60
	ldrb r5, [r3]
	lsls r0, r5, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r0, r2, 4
	movs r1, 0xF0
	lsls r1, 24
	orrs r0, r1
	orrs r0, r2
	lsls r1, r2, 8
	orrs r0, r1
	lsls r2, 12
	orrs r0, r2
	ldr r1, [r4]
	ands r1, r0
	mov r8, r3
	cmp r1, 0
	beq _08012A54
	b _08012F66
_08012A54:
	ldr r1, _08012A78 @ =gUnknown_02024C18
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0x9
	bls _08012A62
	b _08012F66
_08012A62:
	lsls r0, 2
	ldr r1, _08012A7C @ =_08012A80
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012A6C: .4byte gUnknown_02024A64
_08012A70: .4byte gBitTable
_08012A74: .4byte gUnknown_02024A60
_08012A78: .4byte gUnknown_02024C18
_08012A7C: .4byte _08012A80
	.align 2, 0
_08012A80:
	.4byte _08012AA8
	.4byte _08012BB0
	.4byte _08012BE8
	.4byte _08012CE0
	.4byte _08012D04
	.4byte _08012D18
	.4byte _08012D2C
	.4byte _08012D5C
	.4byte _08012D70
	.4byte _08012D94
_08012AA8:
	ldr r0, _08012AC8 @ =gUnknown_02024260
	mov r1, r8
	ldrb r4, [r1]
	lsls r1, r4, 9
	adds r2, r0, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r6, r0, 0
	cmp r1, 0x9
	bgt _08012ACC
	cmp r1, 0x3
	blt _08012ACC
	adds r0, r4, r3
	strb r1, [r0]
	b _08012F90
	.align 2, 0
_08012AC8: .4byte gUnknown_02024260
_08012ACC:
	adds r3, r6, 0
	mov r5, r8
	ldrb r4, [r5]
	lsls r1, r4, 9
	adds r7, r3, 0x2
	adds r0, r1, r7
	ldrb r2, [r0]
	adds r3, 0x3
	mov r9, r3
	add r1, r9
	ldrb r0, [r1]
	lsls r0, 8
	orrs r2, r0
	ldr r0, _08012AF4 @ =0x0000ffff
	cmp r2, r0
	bne _08012AFC
	ldr r0, _08012AF8 @ =gUnknown_02024D1E
	adds r0, r4, r0
	b _08012BFE
	.align 2, 0
_08012AF4: .4byte 0x0000ffff
_08012AF8: .4byte gUnknown_02024D1E
_08012AFC:
	bl sub_8015894
	lsls r0, 24
	cmp r0, 0
	beq _08012B48
	ldr r0, _08012B38 @ =gUnknown_02024D1E
	ldrb r1, [r5]
	adds r1, r0
	movs r2, 0
	movs r0, 0x5
	strb r0, [r1]
	ldr r3, _08012B3C @ =0x02000000
	ldrb r0, [r5]
	ldr r4, _08012B40 @ =0x00016060
	adds r0, r4
	adds r0, r3
	strb r2, [r0]
	ldrb r0, [r5]
	lsls r0, 9
	adds r1, r6, 0x1
	adds r0, r1
	strb r2, [r0]
	ldrb r0, [r5]
	ldr r1, _08012B44 @ =0x00016094
	adds r0, r1
	adds r0, r3
	movs r1, 0x1
	strb r1, [r0]
	b _08012F90
	.align 2, 0
_08012B38: .4byte gUnknown_02024D1E
_08012B3C: .4byte 0x02000000
_08012B40: .4byte 0x00016060
_08012B44: .4byte 0x00016094
_08012B48:
	ldr r6, _08012B98 @ =0x02000000
	mov r2, r8
	ldrb r0, [r2]
	ldr r2, _08012B9C @ =0x0001608c
	adds r1, r0, r2
	adds r1, r6
	lsls r0, 9
	adds r0, r7
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08012BA0 @ =gUnknown_02024C60
	mov r4, r8
	ldrb r3, [r4]
	lsls r5, r3, 1
	adds r5, r0
	ldr r4, _08012BA4 @ =gBattleMons
	adds r2, r3, r2
	adds r2, r6
	ldrb r0, [r2]
	lsls r0, 1
	movs r1, 0x58
	muls r1, r3
	adds r0, r1
	adds r4, 0xC
	adds r0, r4
	ldrh r0, [r0]
	strh r0, [r5]
	mov r1, r8
	ldrb r0, [r1]
	ldr r2, _08012BA8 @ =0x00016010
	adds r1, r0, r2
	adds r1, r6
	lsls r0, 9
	add r0, r9
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _08012BAC @ =gUnknown_02024D1E
	mov r3, r8
	ldrb r1, [r3]
	b _08012E3C
	.align 2, 0
_08012B98: .4byte 0x02000000
_08012B9C: .4byte 0x0001608c
_08012BA0: .4byte gUnknown_02024C60
_08012BA4: .4byte gBattleMons
_08012BA8: .4byte 0x00016010
_08012BAC: .4byte gUnknown_02024D1E
_08012BB0:
	ldr r2, _08012BD8 @ =gUnknown_02024260
	ldr r5, _08012BDC @ =gUnknown_02024A60
	ldrb r4, [r5]
	lsls r1, r4, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r0, [r1]
	lsls r0, 8
	orrs r3, r0
	cmp r3, 0
	bne _08012BCE
	b _08012F60
_08012BCE:
	ldr r0, _08012BE0 @ =gUnknown_02024C04
	strh r3, [r0]
	ldr r0, _08012BE4 @ =gUnknown_02024D1E
	ldrb r1, [r5]
	b _08012E3C
	.align 2, 0
_08012BD8: .4byte gUnknown_02024260
_08012BDC: .4byte gUnknown_02024A60
_08012BE0: .4byte gUnknown_02024C04
_08012BE4: .4byte gUnknown_02024D1E
_08012BE8:
	ldr r4, _08012C04 @ =gUnknown_02024260
	ldr r7, _08012C08 @ =gUnknown_02024A60
	ldrb r2, [r7]
	lsls r0, r2, 9
	adds r1, r4, 0x1
	adds r0, r1
	ldrb r1, [r0]
	cmp r1, 0x6
	bne _08012C10
	ldr r0, _08012C0C @ =gUnknown_02024D1E
	adds r0, r2, r0
_08012BFE:
	movs r1, 0
	strb r1, [r0]
	b _08012F66
	.align 2, 0
_08012C04: .4byte gUnknown_02024260
_08012C08: .4byte gUnknown_02024A60
_08012C0C: .4byte gUnknown_02024D1E
_08012C10:
	ldr r0, _08012CC4 @ =0x02000000
	mov r12, r0
	ldr r3, _08012CC8 @ =0x00016068
	adds r0, r2, r3
	add r0, r12
	strb r1, [r0]
	ldr r0, _08012CCC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08012CBE
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	ldr r5, _08012CD0 @ =0x0001606c
	adds r1, r5
	add r1, r12
	ldrb r2, [r1]
	movs r0, 0xF
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r7]
	lsls r2, r0, 1
	adds r2, r0
	adds r2, r5
	add r2, r12
	lsls r0, 9
	adds r6, r4, 0x2
	adds r0, r6
	ldrb r1, [r0]
	movs r3, 0xF0
	adds r0, r3, 0
	ands r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	ldr r2, _08012CD4 @ =0x0001606d
	adds r1, r2
	add r1, r12
	lsls r0, 9
	adds r4, 0x3
	mov r8, r4
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r4, 0x2
	eors r0, r4
	lsls r1, r0, 1
	adds r1, r0
	adds r1, r5
	add r1, r12
	ldrb r2, [r1]
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r7]
	eors r0, r4
	lsls r1, r0, 1
	adds r1, r0
	adds r1, r5
	add r1, r12
	ldrb r0, [r7]
	lsls r0, 9
	adds r0, r6
	ldrb r0, [r0]
	ands r3, r0
	lsrs r3, 4
	ldrb r0, [r1]
	orrs r3, r0
	strb r3, [r1]
	ldrb r0, [r7]
	eors r4, r0
	lsls r1, r4, 1
	adds r1, r4
	ldr r3, _08012CD8 @ =0x0001606e
	adds r1, r3
	add r1, r12
	ldrb r0, [r7]
	lsls r0, 9
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r1]
_08012CBE:
	ldr r0, _08012CDC @ =gUnknown_02024D1E
	ldrb r1, [r7]
	b _08012E3C
	.align 2, 0
_08012CC4: .4byte 0x02000000
_08012CC8: .4byte 0x00016068
_08012CCC: .4byte gBattleTypeFlags
_08012CD0: .4byte 0x0001606c
_08012CD4: .4byte 0x0001606d
_08012CD8: .4byte 0x0001606e
_08012CDC: .4byte gUnknown_02024D1E
_08012CE0:
	ldr r2, _08012CF8 @ =gUnknown_02024C6C
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 8
	orrs r0, r1
	str r0, [r2]
	ldr r2, _08012CFC @ =gUnknown_02024D1E
	ldr r0, _08012D00 @ =gUnknown_02024A60
	ldrb r1, [r0]
	adds r1, r2
	b _08012E3E
	.align 2, 0
_08012CF8: .4byte gUnknown_02024C6C
_08012CFC: .4byte gUnknown_02024D1E
_08012D00: .4byte gUnknown_02024A60
_08012D04:
	ldr r2, _08012D10 @ =gUnknown_02024D1E
	ldr r0, _08012D14 @ =gUnknown_02024A60
	ldrb r1, [r0]
	adds r1, r2
	b _08012E3E
	.align 2, 0
_08012D10: .4byte gUnknown_02024D1E
_08012D14: .4byte gUnknown_02024A60
_08012D18:
	ldr r2, _08012D24 @ =gUnknown_02024D1E
	ldr r0, _08012D28 @ =gUnknown_02024A60
	ldrb r1, [r0]
	adds r1, r2
	b _08012E3E
	.align 2, 0
_08012D24: .4byte gUnknown_02024D1E
_08012D28: .4byte gUnknown_02024A60
_08012D2C:
	ldr r2, _08012D50 @ =gUnknown_02024260
	ldr r0, _08012D54 @ =gUnknown_02024A60
	ldrb r4, [r0]
	lsls r1, r4, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r0, [r1]
	lsls r0, 8
	orrs r3, r0
	cmp r3, 0
	bne _08012D4A
	b _08012F60
_08012D4A:
	ldr r1, _08012D58 @ =gUnknown_02024D1E
	adds r1, r4, r1
	b _08012E3E
	.align 2, 0
_08012D50: .4byte gUnknown_02024260
_08012D54: .4byte gUnknown_02024A60
_08012D58: .4byte gUnknown_02024D1E
_08012D5C:
	ldr r2, _08012D68 @ =gUnknown_02024D1E
	ldr r0, _08012D6C @ =gUnknown_02024A60
	ldrb r1, [r0]
	adds r1, r2
	b _08012E3E
	.align 2, 0
_08012D68: .4byte gUnknown_02024D1E
_08012D6C: .4byte gUnknown_02024A60
_08012D70:
	ldr r2, _08012D88 @ =gUnknown_02024C6C
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 8
	orrs r0, r1
	str r0, [r2]
	ldr r2, _08012D8C @ =gUnknown_02024D1E
	ldr r0, _08012D90 @ =gUnknown_02024A60
	ldrb r1, [r0]
	adds r1, r2
	b _08012E3E
	.align 2, 0
_08012D88: .4byte gUnknown_02024C6C
_08012D8C: .4byte gUnknown_02024D1E
_08012D90: .4byte gUnknown_02024A60
_08012D94:
	ldr r2, _08012DA0 @ =gUnknown_02024D1E
	ldr r0, _08012DA4 @ =gUnknown_02024A60
	ldrb r1, [r0]
	adds r1, r2
	b _08012E3E
	.align 2, 0
_08012DA0: .4byte gUnknown_02024D1E
_08012DA4: .4byte gUnknown_02024A60
_08012DA8:
	ldr r3, _08012E10 @ =gUnknown_02024A64
	ldr r4, _08012E14 @ =gBitTable
	ldr r0, _08012E18 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldr r2, [r0]
	lsls r1, r2, 4
	movs r0, 0xF0
	lsls r0, 24
	orrs r1, r0
	orrs r1, r2
	lsls r0, r2, 8
	orrs r1, r0
	lsls r2, 12
	orrs r1, r2
	ldr r0, [r3]
	ands r0, r1
	cmp r0, 0
	beq _08012DD2
	b _08012F66
_08012DD2:
	ldr r0, _08012E1C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x41
	ands r0, r1
	cmp r0, 0x1
	bne _08012E06
	movs r1, 0x2
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	bne _08012E06
	adds r0, r5, 0
	eors r0, r1
	bl battle_get_side_with_given_state
	ldr r1, _08012E20 @ =0x02000000
	ldr r2, _08012E24 @ =0x000160a6
	adds r1, r2
	ldrb r1, [r1]
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _08012E28
_08012E06:
	movs r0, 0
	movs r1, 0
	bl sub_800D1D8
	b _08012E30
	.align 2, 0
_08012E10: .4byte gUnknown_02024A64
_08012E14: .4byte gBitTable
_08012E18: .4byte gUnknown_02024A60
_08012E1C: .4byte gBattleTypeFlags
_08012E20: .4byte 0x02000000
_08012E24: .4byte 0x000160a6
_08012E28:
	movs r0, 0
	movs r1, 0x1
	bl sub_800D1D8
_08012E30:
	ldr r4, _08012E48 @ =gUnknown_02024A60
_08012E32:
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	ldr r0, _08012E4C @ =gUnknown_02024D1E
	ldrb r1, [r4]
_08012E3C:
	adds r1, r0
_08012E3E:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08012F66
	.align 2, 0
_08012E48: .4byte gUnknown_02024A60
_08012E4C: .4byte gUnknown_02024D1E
_08012E50:
	ldr r3, _08012E84 @ =gUnknown_02024A64
	ldr r1, _08012E88 @ =gBitTable
	ldr r0, _08012E8C @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r1, r2, 4
	movs r0, 0xF0
	lsls r0, 24
	orrs r1, r0
	orrs r1, r2
	lsls r0, r2, 8
	orrs r1, r0
	lsls r2, 12
	orrs r1, r2
	ldr r0, [r3]
	ands r0, r1
	cmp r0, 0
	bne _08012F66
	ldr r1, _08012E90 @ =gUnknown_02024D1E
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _08012F66
	.align 2, 0
_08012E84: .4byte gUnknown_02024A64
_08012E88: .4byte gBitTable
_08012E8C: .4byte gUnknown_02024A60
_08012E90: .4byte gUnknown_02024D1E
_08012E94:
	ldr r2, _08012EB8 @ =0x02000000
	ldr r5, _08012EBC @ =gUnknown_02024A60
	ldrb r1, [r5]
	ldr r3, _08012EC0 @ =0x00016060
	adds r0, r1, r3
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _08012ECC
	ldr r0, _08012EC4 @ =gUnknown_02024D1E
	adds r0, r1, r0
	ldr r4, _08012EC8 @ =0x00016094
	adds r1, r4
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	b _08012F66
	.align 2, 0
_08012EB8: .4byte 0x02000000
_08012EBC: .4byte gUnknown_02024A60
_08012EC0: .4byte 0x00016060
_08012EC4: .4byte gUnknown_02024D1E
_08012EC8: .4byte 0x00016094
_08012ECC:
	ldr r0, _08012F20 @ =gPlayerMonIndex
	strb r1, [r0]
	ldr r7, _08012F24 @ =gUnknown_02024C10
	ldr r6, _08012F28 @ =gUnknown_02024C1C
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r6
	ldr r4, [r0]
	str r4, [r7]
	ldr r3, _08012F2C @ =gUnknown_02024A64
	ldr r1, _08012F30 @ =gBitTable
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r1, r2, 4
	movs r0, 0xF0
	lsls r0, 24
	orrs r1, r0
	orrs r1, r2
	lsls r0, r2, 8
	orrs r1, r0
	lsls r2, 12
	orrs r1, r2
	ldr r0, [r3]
	ands r0, r1
	cmp r0, 0
	bne _08012F12
	ldr r0, _08012F34 @ =gUnknown_081FA73C
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_08012F12:
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r6
	ldr r1, [r7]
	str r1, [r0]
	b _08012F66
	.align 2, 0
_08012F20: .4byte gPlayerMonIndex
_08012F24: .4byte gUnknown_02024C10
_08012F28: .4byte gUnknown_02024C1C
_08012F2C: .4byte gUnknown_02024A64
_08012F30: .4byte gBitTable
_08012F34: .4byte gUnknown_081FA73C
_08012F38:
	ldr r3, _08012FA0 @ =gUnknown_02024A64
	ldr r1, _08012FA4 @ =gBitTable
	ldr r0, _08012FA8 @ =gUnknown_02024A60
	ldrb r4, [r0]
	lsls r0, r4, 2
	adds r0, r1
	ldr r2, [r0]
	lsls r0, r2, 4
	movs r1, 0xF0
	lsls r1, 24
	orrs r0, r1
	orrs r0, r2
	lsls r1, r2, 8
	orrs r0, r1
	lsls r2, 12
	orrs r0, r2
	ldr r3, [r3]
	ands r3, r0
	cmp r3, 0
	bne _08012F66
_08012F60:
	ldr r0, _08012FAC @ =gUnknown_02024D1E
	adds r0, r4, r0
	strb r3, [r0]
_08012F66:
	ldr r0, _08012FA8 @ =gUnknown_02024A60
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	ldr r0, _08012FB0 @ =gUnknown_02024A68
	lsls r1, 24
	lsrs r1, 24
_08012F74:
	adds r2, r0, 0
	ldrb r0, [r2]
	cmp r1, r0
	bcs _08012F80
	bl _0801234C
_08012F80:
	ldr r0, _08012FAC @ =gUnknown_02024D1E
	ldrb r0, [r0, 0x4]
	ldrb r2, [r2]
	cmp r0, r2
	bne _08012F90
	ldr r1, _08012FB4 @ =gUnknown_030042D4
	ldr r0, _08012FB8 @ =sub_80133C8
	str r0, [r1]
_08012F90:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012FA0: .4byte gUnknown_02024A64
_08012FA4: .4byte gBitTable
_08012FA8: .4byte gUnknown_02024A60
_08012FAC: .4byte gUnknown_02024D1E
_08012FB0: .4byte gUnknown_02024A68
_08012FB4: .4byte gUnknown_030042D4
_08012FB8: .4byte sub_80133C8
	thumb_func_end sub_8012324

	thumb_func_start sub_8012FBC
sub_8012FBC: @ 8012FBC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08012FE8 @ =gUnknown_02024A76
	adds r4, r0, r2
	ldrb r5, [r4]
	adds r2, r1, r2
	ldrb r3, [r2]
	strb r3, [r4]
	strb r5, [r2]
	ldr r2, _08012FEC @ =gUnknown_02024A7A
	adds r0, r2
	ldrb r5, [r0]
	adds r1, r2
	ldrb r2, [r1]
	strb r2, [r0]
	strb r5, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012FE8: .4byte gUnknown_02024A76
_08012FEC: .4byte gUnknown_02024A7A
	thumb_func_end sub_8012FBC

	thumb_func_start b_first_side
b_first_side: @ 8012FF0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0xD
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _080130B8
	ldr r1, [sp, 0x8]
	str r1, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x4D
	movs r3, 0
	bl sub_8018324
	lsls r0, 24
	cmp r0, 0
	bne _080130B8
	ldr r1, _08013070 @ =gBattleMons
	movs r0, 0x58
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	adds r0, r1
	adds r0, 0x20
	ldrb r3, [r0]
	cmp r3, 0x21
	bne _0801305C
	ldr r0, _08013074 @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801306C
_0801305C:
	cmp r3, 0x22
	bne _08013078
	ldr r0, _08013074 @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _08013078
_0801306C:
	movs r3, 0x2
	b _0801307A
	.align 2, 0
_08013070: .4byte gBattleMons
_08013074: .4byte gBattleWeather
_08013078:
	movs r3, 0x1
_0801307A:
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r2, _080130B0 @ =gBattleMons
	adds r0, r2
	adds r0, 0x20
	ldrb r2, [r0]
	cmp r2, 0x21
	bne _0801309A
	ldr r0, _080130B4 @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	bne _080130AA
_0801309A:
	cmp r2, 0x22
	bne _080130BA
	ldr r0, _080130B4 @ =gBattleWeather
	ldrh r1, [r0]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _080130BA
_080130AA:
	movs r7, 0x2
	b _080130BC
	.align 2, 0
_080130B0: .4byte gBattleMons
_080130B4: .4byte gBattleWeather
_080130B8:
	movs r3, 0x1
_080130BA:
	movs r7, 0x1
_080130BC:
	ldr r1, _08013100 @ =gBattleMons
	movs r0, 0x58
	mov r2, r9
	muls r2, r0
	adds r0, r2, 0
	adds r4, r0, r1
	ldrh r0, [r4, 0x6]
	muls r3, r0
	ldr r2, _08013104 @ =gStatStageRatios
	movs r1, 0x1B
	ldrsb r1, [r4, r1]
	lsls r1, 1
	adds r0, r1, r2
	ldrb r0, [r0]
	muls r0, r3
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	bl __divsi3
	mov r8, r0
	ldrh r0, [r4, 0x2E]
	cmp r0, 0xAF
	bne _0801310C
	ldr r1, _08013108 @ =gEnigmaBerries
	mov r3, r9
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r6, [r0, 0x7]
	ldrb r5, [r0, 0x1A]
	b _08013120
	.align 2, 0
_08013100: .4byte gBattleMons
_08013104: .4byte gStatStageRatios
_08013108: .4byte gEnigmaBerries
_0801310C:
	ldrh r0, [r4, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r4, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r5, r0, 24
_08013120:
	ldr r0, _080131DC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08013154
	ldr r0, _080131E0 @ =0x00000809
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08013154
	mov r0, r9
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08013154
	movs r0, 0x6E
	mov r1, r8
	muls r1, r0
	adds r0, r1, 0
	movs r1, 0x64
	bl __udivsi3
	mov r8, r0
_08013154:
	cmp r6, 0x18
	bne _0801315E
	mov r2, r8
	lsrs r2, 1
	mov r8, r2
_0801315E:
	ldr r1, _080131E4 @ =gBattleMons
	movs r0, 0x58
	mov r3, r9
	muls r3, r0
	adds r0, r3, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801317C
	mov r0, r8
	lsrs r0, 2
	mov r8, r0
_0801317C:
	cmp r6, 0x1A
	bne _08013198
	ldr r0, _080131E8 @ =gUnknown_02024D1C
	ldrh r4, [r0]
	lsls r0, r5, 16
	subs r0, r5
	movs r1, 0x64
	bl __divsi3
	cmp r4, r0
	bge _08013198
	movs r1, 0x1
	negs r1, r1
	mov r8, r1
_08013198:
	ldr r1, _080131E4 @ =gBattleMons
	movs r0, 0x58
	mov r2, r10
	muls r2, r0
	adds r0, r2, 0
	adds r4, r0, r1
	ldrh r0, [r4, 0x6]
	adds r3, r0, 0
	muls r3, r7
	ldr r2, _080131EC @ =gStatStageRatios
	movs r1, 0x1B
	ldrsb r1, [r4, r1]
	lsls r1, 1
	adds r0, r1, r2
	ldrb r0, [r0]
	muls r0, r3
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	bl __divsi3
	adds r7, r0, 0
	ldrh r0, [r4, 0x2E]
	cmp r0, 0xAF
	bne _080131F4
	ldr r1, _080131F0 @ =gEnigmaBerries
	mov r3, r10
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r6, [r0, 0x7]
	ldrb r5, [r0, 0x1A]
	b _08013208
	.align 2, 0
_080131DC: .4byte gBattleTypeFlags
_080131E0: .4byte 0x00000809
_080131E4: .4byte gBattleMons
_080131E8: .4byte gUnknown_02024D1C
_080131EC: .4byte gStatStageRatios
_080131F0: .4byte gEnigmaBerries
_080131F4:
	ldrh r0, [r4, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r4, 0x2E]
	bl ItemId_GetHoldEffectParam
	lsls r0, 24
	lsrs r5, r0, 24
_08013208:
	ldr r0, _08013280 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08013238
	ldr r0, _08013284 @ =0x00000809
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08013238
	mov r0, r10
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08013238
	movs r0, 0x6E
	muls r0, r7
	movs r1, 0x64
	bl __udivsi3
	adds r7, r0, 0
_08013238:
	cmp r6, 0x18
	bne _0801323E
	lsrs r7, 1
_0801323E:
	ldr r2, _08013288 @ =gBattleMons
	movs r0, 0x58
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	adds r1, r2, 0
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0801325A
	lsrs r7, 2
_0801325A:
	cmp r6, 0x1A
	bne _08013274
	ldr r0, _0801328C @ =gUnknown_02024D1C
	ldrh r4, [r0]
	lsls r0, r5, 16
	subs r0, r5
	movs r1, 0x64
	bl __divsi3
	cmp r4, r0
	bge _08013274
	movs r7, 0x1
	negs r7, r7
_08013274:
	ldr r2, [sp, 0x4]
	cmp r2, 0
	beq _08013290
	movs r3, 0
	b _08013334
	.align 2, 0
_08013280: .4byte gBattleTypeFlags
_08013284: .4byte 0x00000809
_08013288: .4byte gBattleMons
_0801328C: .4byte gUnknown_02024D1C
_08013290:
	ldr r0, _080132B0 @ =gUnknown_02024C18
	mov r3, r9
	adds r1, r3, r0
	ldrb r1, [r1]
	adds r2, r0, 0
	cmp r1, 0
	bne _080132E4
	ldr r0, _080132B4 @ =gUnknown_02024D28
	lsls r1, r3, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 29
	cmp r0, 0
	bge _080132B8
	movs r3, 0xA5
	b _080132E6
	.align 2, 0
_080132B0: .4byte gUnknown_02024C18
_080132B4: .4byte gUnknown_02024D28
_080132B8:
	ldr r1, _080132D8 @ =0x02000000
	ldr r0, _080132DC @ =0x0001608c
	add r0, r9
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x58
	mov r3, r9
	muls r3, r1
	adds r1, r3, 0
	adds r0, r1
	ldr r1, _080132E0 @ =gBattleMons
	adds r1, 0xC
	adds r0, r1
	ldrh r3, [r0]
	b _080132E6
	.align 2, 0
_080132D8: .4byte 0x02000000
_080132DC: .4byte 0x0001608c
_080132E0: .4byte gBattleMons
_080132E4:
	movs r3, 0
_080132E6:
	mov r1, r10
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _08013334
	ldr r0, _08013304 @ =gUnknown_02024D28
	lsls r1, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 29
	cmp r0, 0
	bge _08013308
	movs r2, 0xA5
	b _08013336
	.align 2, 0
_08013304: .4byte gUnknown_02024D28
_08013308:
	ldr r1, _08013328 @ =0x02000000
	ldr r0, _0801332C @ =0x0001608c
	add r0, r10
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	movs r1, 0x58
	mov r2, r10
	muls r2, r1
	adds r1, r2, 0
	adds r0, r1
	ldr r1, _08013330 @ =gBattleMons
	adds r1, 0xC
	adds r0, r1
	ldrh r2, [r0]
	b _08013336
	.align 2, 0
_08013328: .4byte 0x02000000
_0801332C: .4byte 0x0001608c
_08013330: .4byte gBattleMons
_08013334:
	movs r2, 0
_08013336:
	ldr r4, _08013380 @ =gBattleMoves
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	adds r0, r4
	movs r1, 0x7
	ldrsb r1, [r0, r1]
	lsls r3, r2, 1
	cmp r1, 0
	bne _0801335A
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x7]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0
	beq _08013398
_0801335A:
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x7]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _0801338E
	cmp r8, r7
	bne _08013384
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08013384
	movs r3, 0x2
	b _080133B4
	.align 2, 0
_08013380: .4byte gBattleMoves
_08013384:
	cmp r8, r7
	bcs _080133B6
	movs r0, 0x1
	str r0, [sp, 0x8]
	b _080133B6
_0801338E:
	cmp r1, r0
	bge _080133B6
	movs r1, 0x1
	str r1, [sp, 0x8]
	b _080133B6
_08013398:
	cmp r8, r7
	bne _080133AE
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080133AE
	movs r2, 0x2
	str r2, [sp, 0x8]
	b _080133B6
_080133AE:
	cmp r8, r7
	bcs _080133B6
	movs r3, 0x1
_080133B4:
	str r3, [sp, 0x8]
_080133B6:
	ldr r0, [sp, 0x8]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end b_first_side

	thumb_func_start sub_80133C8
sub_80133C8: @ 80133C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r3, 0
	ldr r0, _0801341C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08013434
	ldr r0, _08013420 @ =gUnknown_02024A60
	strb r3, [r0]
	ldr r4, _08013424 @ =gUnknown_02024A68
	mov r8, r0
	ldrb r0, [r4]
	cmp r3, r0
	bcc _080133F0
	b _08013622
_080133F0:
	ldr r7, _08013428 @ =gUnknown_02024A76
	ldr r6, _0801342C @ =gUnknown_02024C18
	mov r2, r8
	ldr r5, _08013430 @ =gUnknown_02024A7A
_080133F8:
	adds r1, r3, r7
	ldrb r0, [r2]
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r1, r3, r5
	ldrb r0, [r2]
	strb r0, [r1]
	adds r3, 0x1
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4]
	cmp r0, r1
	bcc _080133F8
	b _08013622
	.align 2, 0
_0801341C: .4byte gBattleTypeFlags
_08013420: .4byte gUnknown_02024A60
_08013424: .4byte gUnknown_02024A68
_08013428: .4byte gUnknown_02024A76
_0801342C: .4byte gUnknown_02024C18
_08013430: .4byte gUnknown_02024A7A
_08013434:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08013484
	ldr r0, _08013478 @ =gUnknown_02024A60
	strb r3, [r0]
	ldr r1, _0801347C @ =gUnknown_02024A68
	mov r8, r0
	adds r2, r1, 0
	ldrb r2, [r2]
	cmp r3, r2
	bcs _08013494
	ldr r0, _08013480 @ =gUnknown_02024C18
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x3
	beq _08013492
_08013456:
	mov r7, r8
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0801347C @ =gUnknown_02024A68
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08013494
	ldrb r0, [r7]
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08013456
	b _08013492
	.align 2, 0
_08013478: .4byte gUnknown_02024A60
_0801347C: .4byte gUnknown_02024A68
_08013480: .4byte gUnknown_02024C18
_08013484:
	ldr r0, _080134FC @ =gUnknown_02024C18
	ldrb r0, [r0]
	ldr r2, _08013500 @ =gUnknown_02024A60
	mov r8, r2
	cmp r0, 0x3
	bne _08013494
	strb r3, [r2]
_08013492:
	movs r3, 0x5
_08013494:
	cmp r3, 0x5
	bne _08013520
	ldr r6, _08013504 @ =gUnknown_02024A76
	ldr r1, _080134FC @ =gUnknown_02024C18
	mov r3, r8
	ldrb r0, [r3]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r6]
	ldr r2, _08013508 @ =gUnknown_02024A7A
	ldrb r0, [r3]
	strb r0, [r2]
	movs r3, 0x1
	movs r5, 0
	adds r4, r1, 0
	ldr r7, _0801350C @ =gUnknown_030042D4
	mov r9, r7
	ldr r0, _08013510 @ =bc_80154A0
	mov r12, r0
	ldr r1, _08013514 @ =0x02000000
	mov r10, r1
	ldr r7, _08013518 @ =gUnknown_02024A68
	ldrb r7, [r7]
	cmp r5, r7
	bge _080134EC
	adds r7, r6, 0
	adds r6, r4, 0
	adds r4, r2, 0
	ldr r2, _08013518 @ =gUnknown_02024A68
_080134CE:
	mov r0, r8
	ldrb r0, [r0]
	cmp r5, r0
	beq _080134E4
	adds r1, r3, r7
	adds r0, r5, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, r4
	strb r5, [r0]
	adds r3, 0x1
_080134E4:
	adds r5, 0x1
	ldrb r1, [r2]
	cmp r5, r1
	blt _080134CE
_080134EC:
	mov r2, r12
	mov r3, r9
	str r2, [r3]
	ldr r1, _0801351C @ =0x0001601d
	add r1, r10
	movs r0, 0
	strb r0, [r1]
	b _08013632
	.align 2, 0
_080134FC: .4byte gUnknown_02024C18
_08013500: .4byte gUnknown_02024A60
_08013504: .4byte gUnknown_02024A76
_08013508: .4byte gUnknown_02024A7A
_0801350C: .4byte gUnknown_030042D4
_08013510: .4byte bc_80154A0
_08013514: .4byte 0x02000000
_08013518: .4byte gUnknown_02024A68
_0801351C: .4byte 0x0001601d
_08013520:
	movs r0, 0
	mov r7, r8
	strb r0, [r7]
	ldr r1, _080135B0 @ =gUnknown_02024A68
	ldrb r0, [r1]
	cmp r0, 0
	beq _08013566
	ldr r6, _080135B4 @ =gUnknown_02024C18
	mov r2, r8
	ldr r5, _080135B8 @ =gUnknown_02024A76
	ldr r4, _080135BC @ =gUnknown_02024A7A
_08013536:
	ldrb r0, [r2]
	adds r0, r6
	ldrb r1, [r0]
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08013554
	adds r0, r3, r5
	strb r1, [r0]
	adds r1, r3, r4
	mov r7, r8
	ldrb r0, [r7]
	strb r0, [r1]
	adds r3, 0x1
_08013554:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080135B0 @ =gUnknown_02024A68
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08013536
_08013566:
	movs r0, 0
	mov r2, r8
	strb r0, [r2]
	ldr r7, _080135B0 @ =gUnknown_02024A68
	ldrb r0, [r7]
	cmp r0, 0
	beq _080135AA
	ldr r6, _080135B4 @ =gUnknown_02024C18
	ldr r5, _080135B8 @ =gUnknown_02024A76
	ldr r4, _080135BC @ =gUnknown_02024A7A
_0801357A:
	ldrb r0, [r2]
	adds r0, r6
	ldrb r1, [r0]
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08013598
	adds r0, r3, r5
	strb r1, [r0]
	adds r1, r3, r4
	mov r7, r8
	ldrb r0, [r7]
	strb r0, [r1]
	adds r3, 0x1
_08013598:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080135B0 @ =gUnknown_02024A68
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0801357A
_080135AA:
	movs r5, 0
	b _08013618
	.align 2, 0
_080135B0: .4byte gUnknown_02024A68
_080135B4: .4byte gUnknown_02024C18
_080135B8: .4byte gUnknown_02024A76
_080135BC: .4byte gUnknown_02024A7A
_080135C0:
	adds r4, r5, 0x1
	adds r7, r4, 0
	ldrb r1, [r1]
	cmp r7, r1
	bge _08013616
	ldr r6, _08013640 @ =gUnknown_02024A76
	lsls r2, r5, 24
	mov r8, r2
_080135D0:
	ldr r0, _08013644 @ =gUnknown_02024A7A
	adds r1, r5, r0
	ldrb r3, [r1]
	adds r0, r4, r0
	ldrb r1, [r0]
	adds r0, r5, r6
	ldrb r2, [r0]
	cmp r2, 0x1
	beq _0801360C
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0801360C
	cmp r2, 0x2
	beq _0801360C
	cmp r0, 0x2
	beq _0801360C
	adds r0, r3, 0
	movs r2, 0
	bl b_first_side
	lsls r0, 24
	cmp r0, 0
	beq _0801360C
	lsls r1, r4, 24
	lsrs r1, 24
	mov r3, r8
	lsrs r0, r3, 24
	bl sub_8012FBC
_0801360C:
	adds r4, 0x1
	ldr r0, _08013648 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r4, r0
	blt _080135D0
_08013616:
	adds r5, r7, 0
_08013618:
	ldr r1, _08013648 @ =gUnknown_02024A68
	ldrb r0, [r1]
	subs r0, 0x1
	cmp r5, r0
	blt _080135C0
_08013622:
	ldr r1, _0801364C @ =gUnknown_030042D4
	ldr r0, _08013650 @ =bc_80154A0
	str r0, [r1]
	ldr r0, _08013654 @ =0x02000000
	ldr r7, _08013658 @ =0x0001601d
	adds r0, r7
	movs r1, 0
	strb r1, [r0]
_08013632:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013640: .4byte gUnknown_02024A76
_08013644: .4byte gUnknown_02024A7A
_08013648: .4byte gUnknown_02024A68
_0801364C: .4byte gUnknown_030042D4
_08013650: .4byte bc_80154A0
_08013654: .4byte 0x02000000
_08013658: .4byte 0x0001601d
	thumb_func_end sub_80133C8

	thumb_func_start sub_801365C
sub_801365C: @ 801365C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _080136B4 @ =gUnknown_02024A60
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080136B8 @ =gUnknown_02024A68
	ldrb r2, [r0]
	adds r5, r1, 0
	cmp r2, 0
	beq _08013754
	ldr r7, _080136BC @ =gUnknown_02024D28
	adds r6, r5, 0
	ldr r0, _080136C0 @ =gUnknown_02024AD0
	mov r12, r0
	ldr r1, _080136C4 @ =gUnknown_02024CA8
	mov r8, r1
	mov r10, r8
_0801368A:
	mov r2, r9
	cmp r2, 0
	beq _080136C8
	ldrb r1, [r6]
	lsls r1, 4
	adds r1, r7
	ldrb r2, [r1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldrb r1, [r6]
	lsls r1, 4
	adds r1, r7
	ldrb r2, [r1]
	movs r0, 0x3
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	b _08013724
	.align 2, 0
_080136B4: .4byte gUnknown_02024A60
_080136B8: .4byte gUnknown_02024A68
_080136BC: .4byte gUnknown_02024D28
_080136C0: .4byte gUnknown_02024AD0
_080136C4: .4byte gUnknown_02024CA8
_080136C8:
	ldrb r0, [r6]
	lsls r0, 4
	adds r2, r0, r7
	movs r1, 0
	mov r4, r10
	movs r3, 0
_080136D4:
	adds r0, r2, r1
	strb r3, [r0]
	adds r1, 0x1
	cmp r1, 0xF
	bls _080136D4
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1, 0x16]
	cmp r0, 0
	beq _080136F2
	subs r0, 0x1
	strb r0, [r1, 0x16]
_080136F2:
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1, 0x19]
	cmp r0, 0
	beq _08013724
	subs r0, 0x1
	strb r0, [r1, 0x19]
	ldrb r2, [r5]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x19]
	cmp r0, 0
	bne _08013724
	movs r0, 0x58
	muls r2, r0
	add r2, r12
	ldr r0, [r2]
	ldr r1, _0801376C @ =0xffbfffff
	ands r0, r1
	str r0, [r2]
_08013724:
	ldrb r2, [r5]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	add r0, r8
	ldrb r0, [r0, 0xA]
	cmp r0, 0
	bne _08013742
	movs r0, 0x58
	muls r2, r0
	add r2, r12
	ldr r0, [r2]
	ldr r1, _08013770 @ =0xfeffffff
	ands r0, r1
	str r0, [r2]
_08013742:
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08013774 @ =gUnknown_02024A68
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0801368A
_08013754:
	movs r0, 0
	ldr r2, _08013778 @ =gUnknown_02024C80
	strb r0, [r2, 0x8]
	strb r0, [r2, 0x14]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801376C: .4byte 0xffbfffff
_08013770: .4byte 0xfeffffff
_08013774: .4byte gUnknown_02024A68
_08013778: .4byte gUnknown_02024C80
	thumb_func_end sub_801365C

	thumb_func_start sub_801377C
sub_801377C: @ 801377C
	push {r4-r6,lr}
	ldr r2, _080137C0 @ =gUnknown_02024A60
	movs r0, 0
	strb r0, [r2]
	ldr r0, _080137C4 @ =gUnknown_02024A68
	ldrb r1, [r0]
	adds r6, r0, 0
	cmp r1, 0
	beq _080137BA
	adds r3, r2, 0
	movs r4, 0
	ldr r5, _080137C8 @ =gUnknown_02024D68
_08013794:
	ldrb r1, [r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r5
	movs r1, 0
_080137A0:
	adds r0, r2, r1
	strb r4, [r0]
	adds r1, 0x1
	cmp r1, 0x13
	bls _080137A0
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r6]
	cmp r0, r1
	bcc _08013794
_080137BA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080137C0: .4byte gUnknown_02024A60
_080137C4: .4byte gUnknown_02024A68
_080137C8: .4byte gUnknown_02024D68
	thumb_func_end sub_801377C

	thumb_func_start bc_80154A0
bc_80154A0: @ 80137CC
	push {r4-r7,lr}
	ldr r0, _08013850 @ =gUnknown_02024C6C
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	bne _08013884
	ldr r0, _08013854 @ =0x02000000
	ldr r1, _08013858 @ =0x0001601d
	adds r2, r0, r1
	ldr r0, _0801385C @ =gUnknown_02024A68
	ldrb r1, [r2]
	adds r7, r0, 0
	ldrb r0, [r7]
	cmp r1, r0
	bcs _08013884
	ldr r6, _08013860 @ =gUnknown_02024A60
	ldr r5, _08013864 @ =gPlayerMonIndex
	adds r4, r2, 0
	movs r1, 0x84
	lsls r1, 1
	mov r12, r1
_080137FA:
	ldrb r0, [r4]
	strb r0, [r5]
	strb r0, [r6]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08013868 @ =gUnknown_02024C60
	ldrb r3, [r6]
	lsls r0, r3, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r12
	bne _0801387C
	ldr r1, _0801386C @ =gBattleMons
	movs r0, 0x58
	muls r0, r3
	adds r1, 0x4C
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0801387C
	ldr r2, _08013870 @ =gUnknown_02024CA8
	ldrb r1, [r5]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsls r0, 31
	cmp r0, 0
	bne _0801387C
	ldr r0, _08013874 @ =gUnknown_02024D28
	lsls r1, r3, 4
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 29
	cmp r0, 0
	blt _0801387C
	ldr r0, _08013878 @ =gUnknown_081D94DA
	bl b_call_bc_move_exec
	b _080138BE
	.align 2, 0
_08013850: .4byte gUnknown_02024C6C
_08013854: .4byte 0x02000000
_08013858: .4byte 0x0001601d
_0801385C: .4byte gUnknown_02024A68
_08013860: .4byte gUnknown_02024A60
_08013864: .4byte gPlayerMonIndex
_08013868: .4byte gUnknown_02024C60
_0801386C: .4byte gBattleMons
_08013870: .4byte gUnknown_02024CA8
_08013874: .4byte gUnknown_02024D28
_08013878: .4byte gUnknown_081D94DA
_0801387C:
	ldrb r0, [r4]
	ldrb r2, [r7]
	cmp r0, r2
	bcc _080137FA
_08013884:
	bl b_clear_atk_up_if_hit_flag_unless_enraged
	ldr r1, _080138C4 @ =gUnknown_02024A7E
	movs r0, 0
	strb r0, [r1]
	ldr r1, _080138C8 @ =gUnknown_02024A7F
	ldr r0, _080138CC @ =gUnknown_02024A76
	movs r2, 0
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080138D0 @ =gUnknown_02024DEC
	movs r3, 0
	strh r2, [r0]
	ldr r1, _080138D4 @ =0x02000000
	ldr r2, _080138D8 @ =0x0001601c
	adds r0, r1, r2
	strb r3, [r0]
	ldr r2, _080138DC @ =gUnknown_030042D4
	ldr r0, _080138E0 @ =sub_80138F0
	str r0, [r2]
	ldr r0, _080138E4 @ =gUnknown_02024D1E
	strb r3, [r0, 0x3]
	strb r3, [r0, 0x4]
	ldr r2, _080138E8 @ =0x00016112
	adds r0, r1, r2
	strb r3, [r0]
	ldr r0, _080138EC @ =0x00017130
	adds r1, r0
	strb r3, [r1]
_080138BE:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080138C4: .4byte gUnknown_02024A7E
_080138C8: .4byte gUnknown_02024A7F
_080138CC: .4byte gUnknown_02024A76
_080138D0: .4byte gUnknown_02024DEC
_080138D4: .4byte 0x02000000
_080138D8: .4byte 0x0001601c
_080138DC: .4byte gUnknown_030042D4
_080138E0: .4byte sub_80138F0
_080138E4: .4byte gUnknown_02024D1E
_080138E8: .4byte 0x00016112
_080138EC: .4byte 0x00017130
	thumb_func_end bc_80154A0

	thumb_func_start sub_80138F0
sub_80138F0: @ 80138F0
	push {r4-r6,lr}
	ldr r6, _08013944 @ =gUnknown_02024D26
	ldrb r0, [r6]
	ldr r2, _08013948 @ =gUnknown_02024A7F
	cmp r0, 0
	beq _08013900
	movs r0, 0xC
	strb r0, [r2]
_08013900:
	ldr r1, _0801394C @ =0x02000000
	ldr r4, _08013950 @ =gUnknown_02024A7E
	ldrb r0, [r4]
	ldr r3, _08013954 @ =0x00016057
	adds r5, r1, r3
	strb r0, [r5]
	ldr r1, _08013958 @ =gUnknown_081FA640
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _0801395C @ =gUnknown_02024A68
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bcc _08013970
	ldr r2, _08013960 @ =gUnknown_02024C6C
	ldr r0, [r2]
	ldr r1, _08013964 @ =0xffefffff
	ands r0, r1
	str r0, [r2]
	ldr r3, _08013968 @ =gUnknown_030042D4
	ldr r2, _0801396C @ =gUnknown_081FA678
	ldrb r1, [r6]
	movs r0, 0x7F
	ands r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r3]
	b _08013984
	.align 2, 0
_08013944: .4byte gUnknown_02024D26
_08013948: .4byte gUnknown_02024A7F
_0801394C: .4byte 0x02000000
_08013950: .4byte gUnknown_02024A7E
_08013954: .4byte 0x00016057
_08013958: .4byte gUnknown_081FA640
_0801395C: .4byte gUnknown_02024A68
_08013960: .4byte gUnknown_02024C6C
_08013964: .4byte 0xffefffff
_08013968: .4byte gUnknown_030042D4
_0801396C: .4byte gUnknown_081FA678
_08013970:
	ldrb r0, [r5]
	cmp r0, r1
	beq _08013984
	ldr r2, _0801398C @ =gUnknown_02024C6C
	ldr r0, [r2]
	ldr r1, _08013990 @ =0xfffffdff
	ands r0, r1
	ldr r1, _08013994 @ =0xfff7ffff
	ands r0, r1
	str r0, [r2]
_08013984:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801398C: .4byte gUnknown_02024C6C
_08013990: .4byte 0xfffffdff
_08013994: .4byte 0xfff7ffff
	thumb_func_end sub_80138F0

	thumb_func_start sub_8013998
sub_8013998: @ 8013998
	push {r4,lr}
	ldr r1, _080139D0 @ =gUnknown_02024A7F
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080139D4 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080139EC
	ldr r1, _080139D8 @ =gUnknown_030041C0
	ldr r4, _080139DC @ =gUnknown_02024D26
	ldrb r0, [r4]
	strb r0, [r1]
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r1, _080139E0 @ =gPlayerMonIndex
	strb r0, [r1]
	ldr r1, _080139E4 @ =gUnknown_02024C10
	ldr r0, _080139E8 @ =gUnknown_081D8E02
	str r0, [r1]
	ldrb r1, [r4]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r4]
	b _08013B48
	.align 2, 0
_080139D0: .4byte gUnknown_02024A7F
_080139D4: .4byte gBattleTypeFlags
_080139D8: .4byte gUnknown_030041C0
_080139DC: .4byte gUnknown_02024D26
_080139E0: .4byte gPlayerMonIndex
_080139E4: .4byte gUnknown_02024C10
_080139E8: .4byte gUnknown_081D8E02
_080139EC:
	movs r0, 0x90
	lsls r0, 4
	ands r0, r1
	cmp r0, 0
	beq _08013A04
	ldr r1, _080139FC @ =gUnknown_02024C10
	ldr r0, _08013A00 @ =gUnknown_081D8E0D
	b _08013B46
	.align 2, 0
_080139FC: .4byte gUnknown_02024C10
_08013A00: .4byte gUnknown_081D8E0D
_08013A04:
	movs r0, 0xA
	ands r0, r1
	cmp r0, 0x8
	beq _08013A0E
	b _08013B42
_08013A0E:
	bl sub_80325B8
	ldr r1, _08013A3C @ =gUnknown_02024C10
	ldr r0, _08013A40 @ =gUnknown_081D8DBE
	str r0, [r1]
	ldr r2, _08013A44 @ =gTrainers
	ldr r0, _08013A48 @ =gTrainerBattleOpponent
	ldrh r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x1]
	subs r0, 0x2
	cmp r0, 0x31
	bls _08013A30
	b _08013B38
_08013A30:
	lsls r0, 2
	ldr r1, _08013A4C @ =_08013A50
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08013A3C: .4byte gUnknown_02024C10
_08013A40: .4byte gUnknown_081D8DBE
_08013A44: .4byte gTrainers
_08013A48: .4byte gTrainerBattleOpponent
_08013A4C: .4byte _08013A50
	.align 2, 0
_08013A50:
	.4byte _08013B24
	.4byte _08013B24
	.4byte _08013B24
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B18
	.4byte _08013B2E
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B18
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B38
	.4byte _08013B24
	.4byte _08013B24
	.4byte _08013B24
_08013B18:
	ldr r0, _08013B20 @ =0x00000163
	bl PlayBGM
	b _08013B48
	.align 2, 0
_08013B20: .4byte 0x00000163
_08013B24:
	movs r0, 0xD4
	lsls r0, 1
	bl PlayBGM
	b _08013B48
_08013B2E:
	movs r0, 0xB1
	lsls r0, 1
	bl PlayBGM
	b _08013B48
_08013B38:
	movs r0, 0xCE
	lsls r0, 1
	bl PlayBGM
	b _08013B48
_08013B42:
	ldr r1, _08013B54 @ =gUnknown_02024C10
	ldr r0, _08013B58 @ =gUnknown_081D8DCE
_08013B46:
	str r0, [r1]
_08013B48:
	ldr r1, _08013B5C @ =gUnknown_030042D4
	ldr r0, _08013B60 @ =sub_8013C9C
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013B54: .4byte gUnknown_02024C10
_08013B58: .4byte gUnknown_081D8DCE
_08013B5C: .4byte gUnknown_030042D4
_08013B60: .4byte sub_8013C9C
	thumb_func_end sub_8013998

	thumb_func_start sub_8013B64
sub_8013B64: @ 8013B64
	push {r4,lr}
	ldr r1, _08013B9C @ =gUnknown_02024A7F
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08013BA0 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08013BB8
	ldr r1, _08013BA4 @ =gUnknown_030041C0
	ldr r4, _08013BA8 @ =gUnknown_02024D26
	ldrb r0, [r4]
	strb r0, [r1]
	movs r0, 0
	bl battle_get_side_with_given_state
	ldr r1, _08013BAC @ =gPlayerMonIndex
	strb r0, [r1]
	ldr r1, _08013BB0 @ =gUnknown_02024C10
	ldr r0, _08013BB4 @ =gUnknown_081D8E02
	str r0, [r1]
	ldrb r1, [r4]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r4]
	b _08013BBE
	.align 2, 0
_08013B9C: .4byte gUnknown_02024A7F
_08013BA0: .4byte gBattleTypeFlags
_08013BA4: .4byte gUnknown_030041C0
_08013BA8: .4byte gUnknown_02024D26
_08013BAC: .4byte gPlayerMonIndex
_08013BB0: .4byte gUnknown_02024C10
_08013BB4: .4byte gUnknown_081D8E02
_08013BB8:
	ldr r1, _08013BCC @ =gUnknown_02024C10
	ldr r0, _08013BD0 @ =gUnknown_081D8DD1
	str r0, [r1]
_08013BBE:
	ldr r1, _08013BD4 @ =gUnknown_030042D4
	ldr r0, _08013BD8 @ =sub_8013C9C
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013BCC: .4byte gUnknown_02024C10
_08013BD0: .4byte gUnknown_081D8DD1
_08013BD4: .4byte gUnknown_030042D4
_08013BD8: .4byte sub_8013C9C
	thumb_func_end sub_8013B64

	thumb_func_start sub_8013BDC
sub_8013BDC: @ 8013BDC
	push {lr}
	ldr r1, _08013C04 @ =gUnknown_02024A7F
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08013C08 @ =gUnknown_02024D28
	ldr r0, _08013C0C @ =gPlayerMonIndex
	ldrb r0, [r0]
	lsls r0, 4
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 27
	lsrs r0, 30
	cmp r0, 0x1
	beq _08013C18
	cmp r0, 0x2
	beq _08013C28
	ldr r1, _08013C10 @ =gUnknown_02024C10
	ldr r0, _08013C14 @ =gUnknown_081D8E29
	b _08013C2C
	.align 2, 0
_08013C04: .4byte gUnknown_02024A7F
_08013C08: .4byte gUnknown_02024D28
_08013C0C: .4byte gPlayerMonIndex
_08013C10: .4byte gUnknown_02024C10
_08013C14: .4byte gUnknown_081D8E29
_08013C18:
	ldr r1, _08013C20 @ =gUnknown_02024C10
	ldr r0, _08013C24 @ =gUnknown_081D8E14
	b _08013C2C
	.align 2, 0
_08013C20: .4byte gUnknown_02024C10
_08013C24: .4byte gUnknown_081D8E14
_08013C28:
	ldr r1, _08013C38 @ =gUnknown_02024C10
	ldr r0, _08013C3C @ =gUnknown_081D8E22
_08013C2C:
	str r0, [r1]
	ldr r1, _08013C40 @ =gUnknown_030042D4
	ldr r0, _08013C44 @ =sub_8013C9C
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08013C38: .4byte gUnknown_02024C10
_08013C3C: .4byte gUnknown_081D8E22
_08013C40: .4byte gUnknown_030042D4
_08013C44: .4byte sub_8013C9C
	thumb_func_end sub_8013BDC

	thumb_func_start sub_8013C48
sub_8013C48: @ 8013C48
	ldr r1, _08013C7C @ =gUnknown_02024A7F
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08013C80 @ =gUnknown_030041C0
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x7
	strb r0, [r1, 0x1]
	ldr r2, _08013C84 @ =gPlayerMonIndex
	ldrb r0, [r2]
	strb r0, [r1, 0x2]
	ldr r3, _08013C88 @ =gUnknown_02024A6A
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08013C8C @ =gUnknown_02024C10
	ldr r0, _08013C90 @ =gUnknown_081D8E30
	str r0, [r1]
	ldr r1, _08013C94 @ =gUnknown_030042D4
	ldr r0, _08013C98 @ =sub_8013C9C
	str r0, [r1]
	bx lr
	.align 2, 0
_08013C7C: .4byte gUnknown_02024A7F
_08013C80: .4byte gUnknown_030041C0
_08013C84: .4byte gPlayerMonIndex
_08013C88: .4byte gUnknown_02024A6A
_08013C8C: .4byte gUnknown_02024C10
_08013C90: .4byte gUnknown_081D8E30
_08013C94: .4byte gUnknown_030042D4
_08013C98: .4byte sub_8013C9C
	thumb_func_end sub_8013C48

	thumb_func_start sub_8013C9C
sub_8013C9C: @ 8013C9C
	push {r4-r7,lr}
	ldr r0, _08013D00 @ =gUnknown_02024A7F
	ldrb r0, [r0]
	subs r0, 0xB
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08013D7C
	ldr r0, _08013D04 @ =gBattleTypeFlags
	ldrh r0, [r0]
	ldr r1, _08013D08 @ =0x00000b92
	ands r1, r0
	cmp r1, 0
	bne _08013D4C
	ldr r2, _08013D0C @ =gUnknown_02024A60
	strb r1, [r2]
	ldr r0, _08013D10 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08013D48
	adds r4, r2, 0
	ldr r6, _08013D14 @ =gBattleMons
	movs r5, 0x58
	adds r7, r6, 0
	adds r7, 0x30
_08013CCE:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08013D36
	ldr r2, _08013D18 @ =gUnknown_030042E0
	ldrh r0, [r2, 0x6]
	cmp r0, 0
	bne _08013D1C
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r2, 0x6]
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r7
	adds r0, r2, 0
	adds r0, 0x8
	bl StringCopy
	b _08013D36
	.align 2, 0
_08013D00: .4byte gUnknown_02024A7F
_08013D04: .4byte gBattleTypeFlags
_08013D08: .4byte 0x00000b92
_08013D0C: .4byte gUnknown_02024A60
_08013D10: .4byte gUnknown_02024A68
_08013D14: .4byte gBattleMons
_08013D18: .4byte gUnknown_030042E0
_08013D1C:
	ldrb r0, [r4]
	muls r0, r5
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r2, 0x26]
	ldrb r0, [r4]
	adds r1, r0, 0
	muls r1, r5
	adds r1, r7
	adds r0, r2, 0
	adds r0, 0x14
	bl StringCopy
_08013D36:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08013D68 @ =gUnknown_02024A68
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08013CCE
_08013D48:
	bl sub_80BDEC8
_08013D4C:
	movs r0, 0x3
	bl BeginFastPaletteFade
	movs r0, 0x5
	bl FadeOutMapMusic
	ldr r1, _08013D6C @ =gUnknown_030042D4
	ldr r0, _08013D70 @ =sub_8013DA8
	str r0, [r1]
	ldr r1, _08013D74 @ =gUnknown_03005E94
	ldr r0, _08013D78 @ =sub_800F808
	str r0, [r1]
	b _08013D96
	.align 2, 0
_08013D68: .4byte gUnknown_02024A68
_08013D6C: .4byte gUnknown_030042D4
_08013D70: .4byte sub_8013DA8
_08013D74: .4byte gUnknown_03005E94
_08013D78: .4byte sub_800F808
_08013D7C:
	ldr r0, _08013D9C @ =gUnknown_02024A64
	ldr r0, [r0]
	cmp r0, 0
	bne _08013D96
	ldr r1, _08013DA0 @ =gUnknown_081FA73C
	ldr r0, _08013DA4 @ =gUnknown_02024C10
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_08013D96:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08013D9C: .4byte gUnknown_02024A64
_08013DA0: .4byte gUnknown_081FA73C
_08013DA4: .4byte gUnknown_02024C10
	thumb_func_end sub_8013C9C

	thumb_func_start sub_8013DA8
sub_8013DA8: @ 8013DA8
	push {lr}
	ldr r0, _08013DD0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08013DEA
	bl ResetSpriteData
	ldr r0, _08013DD4 @ =gUnknown_03004324
	ldrb r0, [r0]
	cmp r0, 0
	beq _08013DCA
	ldr r0, _08013DD8 @ =gUnknown_02024D26
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08013DE4
_08013DCA:
	ldr r1, _08013DDC @ =gUnknown_030042D4
	ldr r0, _08013DE0 @ =c4_overworld
	b _08013DE8
	.align 2, 0
_08013DD0: .4byte gPaletteFade
_08013DD4: .4byte gUnknown_03004324
_08013DD8: .4byte gUnknown_02024D26
_08013DDC: .4byte gUnknown_030042D4
_08013DE0: .4byte c4_overworld
_08013DE4:
	ldr r1, _08013DF0 @ =gUnknown_030042D4
	ldr r0, _08013DF4 @ =bc_evolution_cutscene
_08013DE8:
	str r0, [r1]
_08013DEA:
	pop {r0}
	bx r0
	.align 2, 0
_08013DF0: .4byte gUnknown_030042D4
_08013DF4: .4byte bc_evolution_cutscene
	thumb_func_end sub_8013DA8

	thumb_func_start bc_evolution_cutscene
bc_evolution_cutscene: @ 8013DF8
	push {r4,r5,lr}
	ldr r0, _08013E4C @ =gUnknown_03004324
	ldrb r1, [r0]
	adds r3, r0, 0
	cmp r1, 0
	beq _08013E6E
_08013E04:
	movs r5, 0
_08013E06:
	ldrb r2, [r3]
	ldr r0, _08013E50 @ =gBitTable
	lsls r1, r5, 2
	adds r1, r0
	ldr r1, [r1]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _08013E60
	bics r2, r1
	strb r2, [r3]
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08013E54 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08013E60
	ldr r0, _08013E58 @ =gUnknown_030042D4
	ldr r1, _08013E5C @ =sub_8013E88
	str r1, [r0]
	lsls r3, r5, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r2, 0
	movs r2, 0x81
	bl EvolutionScene
	b _08013E74
	.align 2, 0
_08013E4C: .4byte gUnknown_03004324
_08013E50: .4byte gBitTable
_08013E54: .4byte gPlayerParty
_08013E58: .4byte gUnknown_030042D4
_08013E5C: .4byte sub_8013E88
_08013E60:
	adds r5, 0x1
	ldr r3, _08013E7C @ =gUnknown_03004324
	cmp r5, 0x5
	ble _08013E06
	ldrb r0, [r3]
	cmp r0, 0
	bne _08013E04
_08013E6E:
	ldr r1, _08013E80 @ =gUnknown_030042D4
	ldr r0, _08013E84 @ =c4_overworld
	str r0, [r1]
_08013E74:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08013E7C: .4byte gUnknown_03004324
_08013E80: .4byte gUnknown_030042D4
_08013E84: .4byte c4_overworld
	thumb_func_end bc_evolution_cutscene

	thumb_func_start sub_8013E88
sub_8013E88: @ 8013E88
	push {lr}
	ldr r0, _08013EA0 @ =gMain
	ldr r1, [r0, 0x4]
	ldr r0, _08013EA4 @ =sub_800F808
	cmp r1, r0
	bne _08013E9A
	ldr r1, _08013EA8 @ =gUnknown_030042D4
	ldr r0, _08013EAC @ =bc_evolution_cutscene
	str r0, [r1]
_08013E9A:
	pop {r0}
	bx r0
	.align 2, 0
_08013EA0: .4byte gMain
_08013EA4: .4byte sub_800F808
_08013EA8: .4byte gUnknown_030042D4
_08013EAC: .4byte bc_evolution_cutscene
	thumb_func_end sub_8013E88

	thumb_func_start c4_overworld
c4_overworld: @ 8013EB0
	push {r4-r6,lr}
	ldr r5, _08013F30 @ =gBattleTypeFlags
	ldrh r1, [r5]
	movs r6, 0x2
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	bne _08013ECE
	ldr r4, _08013F34 @ =gPlayerParty
	adds r0, r4, 0
	bl RandomlyGivePartyPokerus
	adds r0, r4, 0
	bl PartySpreadPokerus
_08013ECE:
	ldrh r4, [r5]
	adds r0, r6, 0
	ands r0, r4
	cmp r0, 0
	beq _08013EE0
	ldr r0, _08013F38 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08013F2A
_08013EE0:
	ldr r1, _08013F3C @ =gScriptResult
	ldr r5, _08013F40 @ =gUnknown_02024D26
	ldrb r0, [r5]
	strh r0, [r1]
	ldr r3, _08013F44 @ =gMain
	ldr r0, _08013F48 @ =0x0000043d
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _08013F4C @ =gUnknown_030042D0
	ldr r0, [r0]
	str r0, [r3]
	movs r0, 0x80
	lsls r0, 3
	ands r0, r4
	cmp r0, 0
	beq _08013F1C
	ldr r0, _08013F50 @ =gEnemyParty
	bl UpdateRoamerHPStatus
	ldrb r0, [r5]
	cmp r0, 0x1
	beq _08013F18
	cmp r0, 0x7
	bne _08013F1C
_08013F18:
	bl SetRoamerInactive
_08013F1C:
	movs r0, 0x5A
	bl m4aSongNumStop
	ldr r0, _08013F44 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_08013F2A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013F30: .4byte gBattleTypeFlags
_08013F34: .4byte gPlayerParty
_08013F38: .4byte gReceivedRemoteLinkPlayers
_08013F3C: .4byte gScriptResult
_08013F40: .4byte gUnknown_02024D26
_08013F44: .4byte gMain
_08013F48: .4byte 0x0000043d
_08013F4C: .4byte gUnknown_030042D0
_08013F50: .4byte gEnemyParty
	thumb_func_end c4_overworld

	thumb_func_start sub_8013F54
sub_8013F54: @ 8013F54
	push {lr}
	ldr r0, _08013F84 @ =gUnknown_02024A7F
	ldrb r0, [r0]
	subs r0, 0xB
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08013F90
	ldr r2, _08013F88 @ =0x02017140
	adds r1, r2, 0
	adds r1, 0x20
	ldrb r0, [r1]
	cmp r0, 0
	beq _08013F74
	subs r0, 0x1
	strb r0, [r1]
_08013F74:
	ldr r0, _08013F8C @ =gUnknown_030042D4
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	str r1, [r0]
	b _08013FAA
	.align 2, 0
_08013F84: .4byte gUnknown_02024A7F
_08013F88: .4byte 0x02017140
_08013F8C: .4byte gUnknown_030042D4
_08013F90:
	ldr r0, _08013FB0 @ =gUnknown_02024A64
	ldr r0, [r0]
	cmp r0, 0
	bne _08013FAA
	ldr r1, _08013FB4 @ =gUnknown_081FA73C
	ldr r0, _08013FB8 @ =gUnknown_02024C10
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_08013FAA:
	pop {r0}
	bx r0
	.align 2, 0
_08013FB0: .4byte gUnknown_02024A64
_08013FB4: .4byte gUnknown_081FA73C
_08013FB8: .4byte gUnknown_02024C10
	thumb_func_end sub_8013F54

	thumb_func_start sub_8013FBC
sub_8013FBC: @ 8013FBC
	push {lr}
	ldr r0, _08013FDC @ =gUnknown_02024A64
	ldr r0, [r0]
	cmp r0, 0
	bne _08013FD8
	ldr r1, _08013FE0 @ =gUnknown_081FA73C
	ldr r0, _08013FE4 @ =gUnknown_02024C10
	ldr r0, [r0]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_08013FD8:
	pop {r0}
	bx r0
	.align 2, 0
_08013FDC: .4byte gUnknown_02024A64
_08013FE0: .4byte gUnknown_081FA73C
_08013FE4: .4byte gUnknown_02024C10
	thumb_func_end sub_8013FBC

	thumb_func_start sub_8013FE8
sub_8013FE8: @ 8013FE8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r0, 0x4
	str r0, [sp]
	ldr r7, _08014028 @ =gPlayerMonIndex
	ldr r1, _0801402C @ =gUnknown_02024A7A
	ldr r0, _08014030 @ =gUnknown_02024A7E
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r7]
	ldr r1, _08014034 @ =0x02000000
	mov r10, r1
	ldr r0, _08014038 @ =0x000160a6
	add r0, r10
	ldrb r2, [r0]
	ldr r1, _0801403C @ =gBitTable
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	ands r2, r0
	cmp r2, 0
	beq _08014044
	ldr r1, _08014040 @ =gUnknown_02024A7F
	movs r0, 0xC
	b _080146CC
	.align 2, 0
_08014028: .4byte gPlayerMonIndex
_0801402C: .4byte gUnknown_02024A7A
_08014030: .4byte gUnknown_02024A7E
_08014034: .4byte 0x02000000
_08014038: .4byte 0x000160a6
_0801403C: .4byte gBitTable
_08014040: .4byte gUnknown_02024A7F
_08014044:
	ldr r1, _080140B8 @ =gCritMultiplier
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _080140BC @ =0x0001601f
	add r1, r10
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080140C0 @ =0x000160e7
	add r0, r10
	strb r2, [r0]
	ldr r0, _080140C4 @ =gBattleMoveFlags
	strb r2, [r0]
	ldr r0, _080140C8 @ =gUnknown_02024C0E
	strb r2, [r0]
	ldr r0, _080140CC @ =gUnknown_02024D1E
	strb r2, [r0, 0x6]
	ldr r3, _080140D0 @ =gUnknown_02024BE4
	ldrb r0, [r7]
	ldr r2, _080140D4 @ =0x0001608c
	adds r0, r2
	add r0, r10
	ldrb r0, [r0]
	ldr r4, _080140D8 @ =gUnknown_02024BE5
	strb r0, [r4]
	strb r0, [r3]
	ldr r1, _080140DC @ =gUnknown_02024D28
	ldrb r2, [r7]
	lsls r0, r2, 4
	adds r5, r0, r1
	ldrb r1, [r5]
	lsls r0, r1, 29
	adds r4, r2, 0
	mov r8, r3
	cmp r0, 0
	bge _080140F0
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r5]
	ldr r2, _080140E0 @ =gUnknown_02024BE6
	ldr r1, _080140E4 @ =gUnknown_02024BE8
	movs r0, 0xA5
	strh r0, [r1]
	strh r0, [r2]
	ldr r2, _080140E8 @ =gUnknown_02024C6C
	ldr r0, [r2]
	movs r1, 0x80
	lsls r1, 4
	orrs r0, r1
	str r0, [r2]
	movs r0, 0xA5
	movs r1, 0
	bl sub_801B5C0
	ldrb r1, [r7]
	ldr r2, _080140EC @ =0x00016010
	adds r1, r2
	b _08014200
	.align 2, 0
_080140B8: .4byte gCritMultiplier
_080140BC: .4byte 0x0001601f
_080140C0: .4byte 0x000160e7
_080140C4: .4byte gBattleMoveFlags
_080140C8: .4byte gUnknown_02024C0E
_080140CC: .4byte gUnknown_02024D1E
_080140D0: .4byte gUnknown_02024BE4
_080140D4: .4byte 0x0001608c
_080140D8: .4byte gUnknown_02024BE5
_080140DC: .4byte gUnknown_02024D28
_080140E0: .4byte gUnknown_02024BE6
_080140E4: .4byte gUnknown_02024BE8
_080140E8: .4byte gUnknown_02024C6C
_080140EC: .4byte 0x00016010
_080140F0:
	ldr r1, _08014128 @ =gBattleMons
	movs r0, 0x58
	adds r5, r4, 0
	muls r5, r0
	adds r0, r1, 0
	adds r0, 0x50
	adds r0, r5, r0
	ldr r2, [r0]
	movs r0, 0x80
	lsls r0, 5
	ands r0, r2
	cmp r0, 0
	bne _08014114
	movs r6, 0x80
	lsls r6, 15
	ands r6, r2
	cmp r6, 0
	beq _08014138
_08014114:
	ldr r3, _0801412C @ =gUnknown_02024BE6
	ldr r2, _08014130 @ =gUnknown_02024BE8
	ldr r1, _08014134 @ =gUnknown_02024C54
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	strh r0, [r3]
	b _08014280
	.align 2, 0
_08014128: .4byte gBattleMons
_0801412C: .4byte gUnknown_02024BE6
_08014130: .4byte gUnknown_02024BE8
_08014134: .4byte gUnknown_02024C54
_08014138:
	ldr r3, _08014188 @ =gUnknown_02024CA8
	mov r12, r3
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r2, r0, r3
	ldrh r4, [r2, 0x6]
	adds r1, r4, 0
	cmp r1, 0
	beq _08014218
	ldrb r3, [r2, 0xC]
	lsls r0, r3, 1
	adds r0, r5
	str r0, [sp, 0x8]
	ldr r0, _0801418C @ =gBattleMons
	adds r0, 0xC
	mov r9, r0
	ldr r0, [sp, 0x8]
	add r0, r9
	ldrh r0, [r0]
	cmp r1, r0
	bne _080141A0
	ldr r1, _08014190 @ =gUnknown_02024BE6
	ldr r0, _08014194 @ =gUnknown_02024BE8
	strh r4, [r0]
	strh r4, [r1]
	ldrb r0, [r2, 0xC]
	ldr r2, _08014198 @ =gUnknown_02024BE5
	strb r0, [r2]
	mov r3, r8
	strb r0, [r3]
	ldrh r0, [r1]
	movs r1, 0
	bl sub_801B5C0
	ldrb r1, [r7]
	ldr r4, _0801419C @ =0x00016010
	adds r1, r4
	b _08014200
	.align 2, 0
_08014188: .4byte gUnknown_02024CA8
_0801418C: .4byte gBattleMons
_08014190: .4byte gUnknown_02024BE6
_08014194: .4byte gUnknown_02024BE8
_08014198: .4byte gUnknown_02024BE5
_0801419C: .4byte 0x00016010
_080141A0:
	cmp r1, 0
	beq _08014218
	cmp r1, r0
	beq _08014218
	ldr r0, _08014208 @ =gUnknown_02024BE5
	strb r3, [r0]
	mov r1, r8
	strb r3, [r1]
	ldr r3, _0801420C @ =gUnknown_02024BE6
	ldr r1, _08014210 @ =gUnknown_02024BE8
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r5
	add r0, r9
	ldrh r0, [r0]
	strh r0, [r1]
	strh r0, [r3]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	movs r2, 0
	strh r6, [r0, 0x6]
	ldrb r1, [r7]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r12
	strb r2, [r0, 0xC]
	ldrb r0, [r7]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	add r1, r12
	ldrb r2, [r1, 0xE]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0xE]
	ldrh r0, [r3]
	movs r1, 0
	bl sub_801B5C0
	ldrb r1, [r7]
	ldr r3, _08014214 @ =0x00016010
	adds r1, r3
_08014200:
	add r1, r10
	strb r0, [r1]
	b _08014280
	.align 2, 0
_08014208: .4byte gUnknown_02024BE5
_0801420C: .4byte gUnknown_02024BE6
_08014210: .4byte gUnknown_02024BE8
_08014214: .4byte 0x00016010
_08014218:
	mov r4, r8
	ldrb r0, [r4]
	lsls r0, 1
	ldr r4, _0801425C @ =gPlayerMonIndex
	ldrb r2, [r4]
	movs r1, 0x58
	muls r1, r2
	adds r0, r1
	ldr r1, _08014260 @ =gBattleMons
	adds r1, 0xC
	adds r0, r1
	ldr r1, _08014264 @ =gUnknown_02024C60
	lsls r2, 1
	adds r2, r1
	ldrh r3, [r0]
	ldrh r2, [r2]
	cmp r3, r2
	beq _08014278
	ldr r1, _08014268 @ =gUnknown_02024BE6
	ldr r0, _0801426C @ =gUnknown_02024BE8
	strh r3, [r0]
	strh r3, [r1]
	ldrh r0, [r1]
	movs r1, 0
	bl sub_801B5C0
	ldr r2, _08014270 @ =0x02000000
	ldrb r1, [r4]
	ldr r3, _08014274 @ =0x00016010
	adds r1, r3
	adds r1, r2
	strb r0, [r1]
	b _08014280
	.align 2, 0
_0801425C: .4byte gPlayerMonIndex
_08014260: .4byte gBattleMons
_08014264: .4byte gUnknown_02024C60
_08014268: .4byte gUnknown_02024BE6
_0801426C: .4byte gUnknown_02024BE8
_08014270: .4byte 0x02000000
_08014274: .4byte 0x00016010
_08014278:
	ldr r1, _08014298 @ =gUnknown_02024BE6
	ldr r0, _0801429C @ =gUnknown_02024BE8
	strh r3, [r0]
	strh r3, [r1]
_08014280:
	ldr r0, _080142A0 @ =gPlayerMonIndex
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080142A8
	ldr r0, _080142A4 @ =gUnknown_030042E0
	ldr r1, _08014298 @ =gUnknown_02024BE6
	ldrh r1, [r1]
	strh r1, [r0, 0x22]
	b _080142B0
	.align 2, 0
_08014298: .4byte gUnknown_02024BE6
_0801429C: .4byte gUnknown_02024BE8
_080142A0: .4byte gPlayerMonIndex
_080142A4: .4byte gUnknown_030042E0
_080142A8:
	ldr r0, _08014314 @ =gUnknown_030042E0
	ldr r1, _08014318 @ =gUnknown_02024BE6
	ldrh r1, [r1]
	strh r1, [r0, 0x24]
_080142B0:
	ldr r4, _0801431C @ =gPlayerMonIndex
	ldrb r0, [r4]
	bl battle_side_get_owner
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08014320 @ =gUnknown_02024C80
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r5, r0, r1
	ldrb r0, [r5, 0x8]
	adds r3, r4, 0
	cmp r0, 0
	beq _08014330
	ldr r2, _08014324 @ =gBattleMoves
	ldr r0, _08014318 @ =gUnknown_02024BE6
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x6]
	cmp r0, 0
	bne _08014330
	ldrb r0, [r3]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldrb r0, [r5, 0x9]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _08014330
	ldr r1, _08014328 @ =gBattleMons
	ldrb r2, [r5, 0x9]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	ldrh r0, [r0, 0x28]
	cmp r0, 0
	beq _08014330
	ldr r0, _0801432C @ =gEnemyMonIndex
	strb r2, [r0]
	b _080146AC
	.align 2, 0
_08014314: .4byte gUnknown_030042E0
_08014318: .4byte gUnknown_02024BE6
_0801431C: .4byte gPlayerMonIndex
_08014320: .4byte gUnknown_02024C80
_08014324: .4byte gBattleMoves
_08014328: .4byte gBattleMons
_0801432C: .4byte gEnemyMonIndex
_08014330:
	ldr r2, _08014454 @ =gBattleTypeFlags
	ldrh r1, [r2]
	movs r0, 0x1
	ands r0, r1
	ldr r3, _08014458 @ =gPlayerMonIndex
	mov r9, r2
	cmp r0, 0
	bne _08014342
	b _0801461C
_08014342:
	ldr r1, _0801445C @ =gUnknown_02024C80
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r7, [r0, 0x8]
	cmp r7, 0
	beq _08014354
	b _08014570
_08014354:
	ldr r2, _08014460 @ =gBattleMoves
	ldr r0, _08014464 @ =gUnknown_02024BE6
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _08014370
	ldrb r0, [r4, 0x6]
	cmp r0, 0x10
	bne _08014370
	b _08014570
_08014370:
	ldr r3, _08014468 @ =gBattleMons
	ldr r0, _0801446C @ =0x02000000
	mov r8, r0
	ldr r2, _08014458 @ =gPlayerMonIndex
	ldrb r5, [r2]
	ldr r1, _08014470 @ =0x00016010
	adds r0, r5, r1
	add r0, r8
	ldrb r1, [r0]
	movs r0, 0x58
	muls r0, r1
	adds r0, r3
	adds r0, 0x20
	ldrb r0, [r0]
	adds r3, r2, 0
	cmp r0, 0x1F
	bne _08014394
	b _08014570
_08014394:
	ldrb r0, [r4, 0x2]
	cmp r0, 0xD
	beq _0801439C
	b _08014570
_0801439C:
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _08014474 @ =gUnknown_02024A60
	strb r7, [r1]
	ldr r0, _08014478 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r7, r0
	bcs _08014416
	adds r4, r1, 0
	mov r5, r8
_080143B6:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	beq _08014404
	ldr r0, _08014458 @ =gPlayerMonIndex
	ldrb r0, [r0]
	ldr r2, _08014470 @ =0x00016010
	adds r0, r2
	adds r0, r5
	ldrb r0, [r0]
	ldrb r3, [r4]
	cmp r0, r3
	beq _08014404
	ldr r1, _08014468 @ =gBattleMons
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	cmp r0, 0x1F
	bne _08014404
	adds r0, r2, 0
	bl sub_801E3B4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [sp]
	cmp r0, r1
	bcs _08014404
	ldrb r0, [r4]
	bl sub_801E3B4
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
_08014404:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08014478 @ =gUnknown_02024A68
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _080143B6
_08014416:
	ldr r2, [sp]
	cmp r2, 0x4
	beq _0801441E
	b _08014522
_0801441E:
	ldr r2, _08014460 @ =gBattleMoves
	ldr r0, _0801447C @ =gUnknown_02024BE8
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x6]
	ldr r3, [sp]
	ands r3, r0
	cmp r3, 0
	beq _080144A4
	ldr r0, _08014458 @ =gPlayerMonIndex
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08014484
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08014480
	movs r0, 0x1
	b _08014496
	.align 2, 0
_08014454: .4byte gBattleTypeFlags
_08014458: .4byte gPlayerMonIndex
_0801445C: .4byte gUnknown_02024C80
_08014460: .4byte gBattleMoves
_08014464: .4byte gUnknown_02024BE6
_08014468: .4byte gBattleMons
_0801446C: .4byte 0x02000000
_08014470: .4byte 0x00016010
_08014474: .4byte gUnknown_02024A60
_08014478: .4byte gUnknown_02024A68
_0801447C: .4byte gUnknown_02024BE8
_08014480:
	movs r0, 0x3
	b _08014496
_08014484:
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08014494
	movs r0, 0
	b _08014496
_08014494:
	movs r0, 0x2
_08014496:
	bl battle_get_side_with_given_state
	ldr r1, _080144A0 @ =gEnemyMonIndex
	strb r0, [r1]
	b _080144B6
	.align 2, 0
_080144A0: .4byte gEnemyMonIndex
_080144A4:
	ldr r2, _080144EC @ =gEnemyMonIndex
	ldr r1, _080144F0 @ =0x02000000
	ldr r0, _080144F4 @ =gPlayerMonIndex
	ldrb r0, [r0]
	ldr r4, _080144F8 @ =0x00016010
	adds r0, r4
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
_080144B6:
	ldr r7, _080144FC @ =gUnknown_02024C0C
	ldrb r0, [r7]
	ldr r1, _08014500 @ =gBitTable
	mov r8, r1
	ldr r5, _080144EC @ =gEnemyMonIndex
	ldrb r1, [r5]
	lsls r1, 2
	add r1, r8
	ldr r1, [r1]
	ands r0, r1
	cmp r0, 0
	bne _080144D0
	b _080146AC
_080144D0:
	ldr r6, _080144F4 @ =gPlayerMonIndex
	ldrb r0, [r6]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _08014504
	ldrb r0, [r5]
	b _0801469A
	.align 2, 0
_080144EC: .4byte gEnemyMonIndex
_080144F0: .4byte 0x02000000
_080144F4: .4byte gPlayerMonIndex
_080144F8: .4byte 0x00016010
_080144FC: .4byte gUnknown_02024C0C
_08014500: .4byte gBitTable
_08014504:
	ldrb r0, [r6]
	bl battle_get_per_side_status
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	strb r0, [r5]
	ldrb r1, [r7]
	ldrb r2, [r5]
	lsls r0, r2, 2
	add r0, r8
	b _08014690
_08014522:
	ldr r4, _0801455C @ =gUnknown_02024A60
	ldr r0, _08014560 @ =gUnknown_02024A7A
	ldr r2, [sp]
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r4]
	ldrb r0, [r4]
	ldr r2, _08014564 @ =gBattleMons
	movs r1, 0x58
	muls r1, r0
	adds r1, r2
	adds r1, 0x20
	ldrb r1, [r1]
	bl sub_81074C4
	ldr r2, _08014568 @ =gUnknown_02024D68
	ldrb r1, [r4]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
	ldr r1, _0801456C @ =gEnemyMonIndex
	ldrb r0, [r4]
	strb r0, [r1]
	b _080146AC
	.align 2, 0
_0801455C: .4byte gUnknown_02024A60
_08014560: .4byte gUnknown_02024A7A
_08014564: .4byte gBattleMons
_08014568: .4byte gUnknown_02024D68
_0801456C: .4byte gEnemyMonIndex
_08014570:
	mov r4, r9
	ldrh r1, [r4]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0801461C
	ldr r2, _080145B4 @ =gBattleMoves
	ldr r0, _080145B8 @ =gUnknown_02024BE8
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x6]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0801461C
	ldrb r0, [r3]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080145C0
	bl Random
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _080145BC
	movs r0, 0x1
	b _080145D2
	.align 2, 0
_080145B4: .4byte gBattleMoves
_080145B8: .4byte gUnknown_02024BE8
_080145BC:
	movs r0, 0x3
	b _080145D2
_080145C0:
	bl Random
	adds r1, r4, 0
	ands r1, r0
	cmp r1, 0
	beq _080145D0
	movs r0, 0
	b _080145D2
_080145D0:
	movs r0, 0x2
_080145D2:
	bl battle_get_side_with_given_state
	ldr r1, _0801460C @ =gEnemyMonIndex
	strb r0, [r1]
	ldr r0, _08014610 @ =gUnknown_02024C0C
	ldrb r1, [r0]
	ldr r2, _08014614 @ =gBitTable
	ldr r5, _0801460C @ =gEnemyMonIndex
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080146AC
	ldr r0, _08014618 @ =gPlayerMonIndex
	ldrb r0, [r0]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _080146AC
	ldrb r0, [r5]
	b _0801469A
	.align 2, 0
_0801460C: .4byte gEnemyMonIndex
_08014610: .4byte gUnknown_02024C0C
_08014614: .4byte gBitTable
_08014618: .4byte gPlayerMonIndex
_0801461C:
	ldr r5, _08014660 @ =gEnemyMonIndex
	ldr r1, _08014664 @ =0x02000000
	adds r2, r3, 0
	ldrb r0, [r2]
	ldr r4, _08014668 @ =0x00016010
	adds r0, r4
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r6, _0801466C @ =gUnknown_02024C0C
	ldrb r1, [r6]
	ldr r7, _08014670 @ =gBitTable
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r7
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080146AC
	ldrb r0, [r2]
	str r3, [sp, 0x4]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	ldr r3, [sp, 0x4]
	cmp r4, r0
	beq _08014674
	ldrb r0, [r5]
	b _0801469A
	.align 2, 0
_08014660: .4byte gEnemyMonIndex
_08014664: .4byte 0x02000000
_08014668: .4byte 0x00016010
_0801466C: .4byte gUnknown_02024C0C
_08014670: .4byte gBitTable
_08014674:
	ldrb r0, [r3]
	bl battle_get_per_side_status
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	strb r0, [r5]
	ldrb r1, [r6]
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r0, r7
_08014690:
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080146AC
	adds r0, r2, 0
_0801469A:
	bl battle_get_per_side_status
	movs r1, 0x2
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	strb r0, [r5]
_080146AC:
	ldr r4, _080146E0 @ =gUnknown_02024C10
	ldr r3, _080146E4 @ =gUnknown_081D6BBC
	ldr r2, _080146E8 @ =gBattleMoves
	ldr r0, _080146EC @ =gUnknown_02024BE6
	ldrh r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r3
	ldr r0, [r0]
	str r0, [r4]
	ldr r1, _080146F0 @ =gUnknown_02024A7F
	movs r0, 0xA
_080146CC:
	strb r0, [r1]
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080146E0: .4byte gUnknown_02024C10
_080146E4: .4byte gUnknown_081D6BBC
_080146E8: .4byte gBattleMoves
_080146EC: .4byte gUnknown_02024BE6
_080146F0: .4byte gUnknown_02024A7F
	thumb_func_end sub_8013FE8

	thumb_func_start sub_80146F4
sub_80146F4: @ 80146F4
	push {r4,lr}
	ldr r3, _08014764 @ =gPlayerMonIndex
	ldr r1, _08014768 @ =gUnknown_02024A7A
	ldr r0, _0801476C @ =gUnknown_02024A7E
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r3]
	ldr r0, _08014770 @ =gUnknown_030042A4
	movs r2, 0
	strh r2, [r0]
	ldr r0, _08014774 @ =gUnknown_030042A0
	strh r2, [r0]
	ldr r1, _08014778 @ =gUnknown_02024E60
	ldrb r0, [r3]
	adds r0, r1
	strb r2, [r0]
	ldr r1, _0801477C @ =gUnknown_02024E64
	ldrb r0, [r3]
	adds r0, r1
	strb r2, [r0]
	ldr r2, _08014780 @ =gUnknown_030041C0
	movs r0, 0xFD
	strb r0, [r2]
	movs r0, 0x7
	strb r0, [r2, 0x1]
	ldrb r4, [r3]
	strb r4, [r2, 0x2]
	ldr r1, _08014784 @ =0x02000000
	ldrb r0, [r3]
	ldr r3, _08014788 @ =0x00016064
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2, 0x3]
	movs r0, 0xFF
	strb r0, [r2, 0x4]
	ldr r0, _0801478C @ =0x00016003
	adds r1, r0
	strb r4, [r1]
	ldr r1, _08014790 @ =gUnknown_02024C10
	ldr r0, _08014794 @ =gUnknown_081D8E4E
	str r0, [r1]
	ldr r1, _08014798 @ =gUnknown_02024A7F
	movs r0, 0xA
	strb r0, [r1]
	ldr r1, _0801479C @ =gUnknown_030042E0
	ldrb r0, [r1, 0x2]
	cmp r0, 0xFE
	bhi _0801475C
	adds r0, 0x1
	strb r0, [r1, 0x2]
_0801475C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014764: .4byte gPlayerMonIndex
_08014768: .4byte gUnknown_02024A7A
_0801476C: .4byte gUnknown_02024A7E
_08014770: .4byte gUnknown_030042A4
_08014774: .4byte gUnknown_030042A0
_08014778: .4byte gUnknown_02024E60
_0801477C: .4byte gUnknown_02024E64
_08014780: .4byte gUnknown_030041C0
_08014784: .4byte 0x02000000
_08014788: .4byte 0x00016064
_0801478C: .4byte 0x00016003
_08014790: .4byte gUnknown_02024C10
_08014794: .4byte gUnknown_081D8E4E
_08014798: .4byte gUnknown_02024A7F
_0801479C: .4byte gUnknown_030042E0
	thumb_func_end sub_80146F4

	thumb_func_start sub_80147A0
sub_80147A0: @ 80147A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r4, _08014804 @ =gPlayerMonIndex
	ldr r2, _08014808 @ =gEnemyMonIndex
	ldr r1, _0801480C @ =gUnknown_02024A7A
	ldr r0, _08014810 @ =gUnknown_02024A7E
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	strb r0, [r4]
	ldr r0, _08014814 @ =gUnknown_030042A4
	movs r2, 0
	strh r2, [r0]
	ldr r0, _08014818 @ =gUnknown_030042A0
	strh r2, [r0]
	ldr r3, _0801481C @ =gUnknown_02024CA8
	ldrb r1, [r4]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r3
	strb r2, [r0, 0x10]
	ldr r5, _08014820 @ =gUnknown_02024C04
	ldr r2, _08014824 @ =gUnknown_02024260
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r0, [r1]
	lsls r0, 8
	orrs r3, r0
	strh r3, [r5]
	cmp r3, 0xC
	bhi _08014830
	ldr r2, _08014828 @ =gUnknown_02024C10
	ldr r1, _0801482C @ =gUnknown_081D9E48
	ldrh r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	b _08014A8C
	.align 2, 0
_08014804: .4byte gPlayerMonIndex
_08014808: .4byte gEnemyMonIndex
_0801480C: .4byte gUnknown_02024A7A
_08014810: .4byte gUnknown_02024A7E
_08014814: .4byte gUnknown_030042A4
_08014818: .4byte gUnknown_030042A0
_0801481C: .4byte gUnknown_02024CA8
_08014820: .4byte gUnknown_02024C04
_08014824: .4byte gUnknown_02024260
_08014828: .4byte gUnknown_02024C10
_0801482C: .4byte gUnknown_081D9E48
_08014830:
	adds r0, r3, 0
	subs r0, 0x50
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0801484C
	ldr r0, _08014844 @ =gUnknown_02024C10
	ldr r1, _08014848 @ =gUnknown_081D9E94
	b _0801485C
	.align 2, 0
_08014844: .4byte gUnknown_02024C10
_08014848: .4byte gUnknown_081D9E94
_0801484C:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0801486C
	ldr r0, _08014864 @ =gUnknown_02024C10
	ldr r1, _08014868 @ =gUnknown_081D9E7C
_0801485C:
	ldr r1, [r1]
	str r1, [r0]
	b _08014A8C
	.align 2, 0
_08014864: .4byte gUnknown_02024C10
_08014868: .4byte gUnknown_081D9E7C
_0801486C:
	ldr r2, _080148A0 @ =0x02000000
	ldrb r0, [r4]
	ldr r3, _080148A4 @ =0x00016003
	adds r1, r2, r3
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 25
	ldr r1, _080148A8 @ =0x000160d8
	adds r0, r1
	adds r0, r2
	ldrb r0, [r0]
	subs r0, 0x1
	mov r8, r4
	ldr r3, _080148AC @ =gUnknown_02024C10
	mov r9, r3
	ldr r1, _080148B0 @ =gUnknown_081D9E7C
	mov r10, r1
	adds r7, r2, 0
	cmp r0, 0x4
	bls _08014896
	b _08014A74
_08014896:
	lsls r0, 2
	ldr r1, _080148B4 @ =_080148B8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080148A0: .4byte 0x02000000
_080148A4: .4byte 0x00016003
_080148A8: .4byte 0x000160d8
_080148AC: .4byte gUnknown_02024C10
_080148B0: .4byte gUnknown_081D9E7C
_080148B4: .4byte _080148B8
	.align 2, 0
_080148B8:
	.4byte _08014A74
	.4byte _08014A74
	.4byte _080148CC
	.4byte _08014958
	.4byte _08014A30
_080148CC:
	ldr r2, _08014904 @ =gUnknown_02024D1E
	movs r0, 0
	strb r0, [r2, 0x5]
	ldr r1, _08014908 @ =gPlayerMonIndex
	ldrb r0, [r1]
	lsrs r0, 1
	ldr r6, _0801490C @ =0x000160da
	adds r0, r6
	adds r0, r7
	ldrb r3, [r0]
	movs r0, 0x1
	ands r0, r3
	mov r8, r1
	cmp r0, 0
	beq _08014918
	movs r0, 0x3E
	ands r0, r3
	ldr r3, _08014910 @ =gUnknown_02024C10
	mov r9, r3
	ldr r1, _08014914 @ =gUnknown_081D9E7C
	mov r10, r1
	cmp r0, 0
	bne _080148FC
	b _08014A74
_080148FC:
	movs r0, 0x5
	strb r0, [r2, 0x5]
	b _08014A74
	.align 2, 0
_08014904: .4byte gUnknown_02024D1E
_08014908: .4byte gPlayerMonIndex
_0801490C: .4byte 0x000160da
_08014910: .4byte gUnknown_02024C10
_08014914: .4byte gUnknown_081D9E7C
_08014918:
	ldr r3, _08014950 @ =gUnknown_02024C10
	mov r9, r3
	ldr r0, _08014954 @ =gUnknown_081D9E7C
	mov r10, r0
	adds r5, r7, 0
	mov r4, r8
	adds r3, r6, 0
_08014926:
	ldrb r0, [r4]
	lsrs r0, 1
	adds r0, r3
	adds r0, r5
	ldrb r1, [r0]
	lsrs r1, 1
	strb r1, [r0]
	ldrb r0, [r2, 0x5]
	adds r0, 0x1
	strb r0, [r2, 0x5]
	ldrb r0, [r4]
	lsrs r0, 1
	adds r0, r3
	adds r0, r5
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08014926
	b _08014A74
	.align 2, 0
_08014950: .4byte gUnknown_02024C10
_08014954: .4byte gUnknown_081D9E7C
_08014958:
	ldr r3, _0801498C @ =gUnknown_02024D1E
	movs r0, 0x4
	strb r0, [r3, 0x5]
	ldr r2, _08014990 @ =gPlayerMonIndex
	ldrb r0, [r2]
	lsrs r0, 1
	ldr r1, _08014994 @ =0x000160da
	mov r12, r1
	add r0, r12
	adds r6, r0, r7
	ldrb r1, [r6]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r8, r2
	cmp r5, 0
	beq _080149A0
	movs r0, 0x5
	strb r0, [r3, 0x5]
	ldr r2, _08014998 @ =gUnknown_02024C10
	mov r9, r2
	ldr r3, _0801499C @ =gUnknown_081D9E7C
	mov r10, r3
	b _08014A74
	.align 2, 0
_0801498C: .4byte gUnknown_02024D1E
_08014990: .4byte gPlayerMonIndex
_08014994: .4byte 0x000160da
_08014998: .4byte gUnknown_02024C10
_0801499C: .4byte gUnknown_081D9E7C
_080149A0:
	ldr r3, _08014A18 @ =gUnknown_030041C0
	movs r4, 0xFD
	strb r4, [r3]
	movs r0, 0x5
	strb r0, [r3, 0x1]
	movs r2, 0x1
	strb r2, [r3, 0x2]
	movs r0, 0xFF
	strb r0, [r3, 0x3]
	ldr r1, _08014A1C @ =gUnknown_03004290
	strb r4, [r1]
	strb r5, [r1, 0x1]
	movs r0, 0xD2
	strb r0, [r1, 0x2]
	strb r5, [r1, 0x3]
	subs r0, 0xD3
	strb r0, [r1, 0x4]
	ldrb r0, [r6]
	ands r2, r0
	ldr r0, _08014A20 @ =gUnknown_02024C10
	mov r9, r0
	ldr r1, _08014A24 @ =gUnknown_081D9E7C
	mov r10, r1
	adds r6, r3, 0
	cmp r2, 0
	bne _08014A02
	adds r3, r7, 0
	mov r5, r8
	mov r4, r12
	adds r2, r6, 0
_080149DC:
	ldrb r0, [r5]
	lsrs r0, 1
	adds r0, r4
	adds r0, r3
	ldrb r1, [r0]
	lsrs r1, 1
	strb r1, [r0]
	ldrb r0, [r2, 0x2]
	adds r0, 0x1
	strb r0, [r2, 0x2]
	ldrb r0, [r5]
	lsrs r0, 1
	adds r0, r4
	adds r0, r3
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080149DC
_08014A02:
	ldrb r0, [r6, 0x2]
	adds r0, 0xE
	ldr r2, _08014A28 @ =0x000160a4
	adds r1, r7, r2
	movs r2, 0
	strb r0, [r1]
	ldr r3, _08014A2C @ =0x000160a5
	adds r0, r7, r3
	strb r2, [r0]
	b _08014A74
	.align 2, 0
_08014A18: .4byte gUnknown_030041C0
_08014A1C: .4byte gUnknown_03004290
_08014A20: .4byte gUnknown_02024C10
_08014A24: .4byte gUnknown_081D9E7C
_08014A28: .4byte 0x000160a4
_08014A2C: .4byte 0x000160a5
_08014A30:
	ldr r0, _08014A50 @ =gBattleTypeFlags
	ldrh r0, [r0]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08014A64
	ldr r1, _08014A54 @ =gUnknown_02024D1E
	movs r0, 0x2
	strb r0, [r1, 0x5]
	ldr r0, _08014A58 @ =gPlayerMonIndex
	mov r8, r0
	ldr r1, _08014A5C @ =gUnknown_02024C10
	mov r9, r1
	ldr r2, _08014A60 @ =gUnknown_081D9E7C
	mov r10, r2
	b _08014A74
	.align 2, 0
_08014A50: .4byte gBattleTypeFlags
_08014A54: .4byte gUnknown_02024D1E
_08014A58: .4byte gPlayerMonIndex
_08014A5C: .4byte gUnknown_02024C10
_08014A60: .4byte gUnknown_081D9E7C
_08014A64:
	ldr r0, _08014AA0 @ =gUnknown_02024D1E
	strb r1, [r0, 0x5]
	ldr r3, _08014AA4 @ =gPlayerMonIndex
	mov r8, r3
	ldr r0, _08014AA8 @ =gUnknown_02024C10
	mov r9, r0
	ldr r1, _08014AAC @ =gUnknown_081D9E7C
	mov r10, r1
_08014A74:
	mov r2, r8
	ldrb r0, [r2]
	lsrs r0, 1
	ldr r3, _08014AB0 @ =0x000160d8
	adds r0, r3
	adds r0, r7
	ldrb r0, [r0]
	lsls r0, 2
	add r0, r10
	ldr r0, [r0]
	mov r1, r9
	str r0, [r1]
_08014A8C:
	movs r0, 0xA
	ldr r2, _08014AB4 @ =gUnknown_02024A7F
	strb r0, [r2]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08014AA0: .4byte gUnknown_02024D1E
_08014AA4: .4byte gPlayerMonIndex
_08014AA8: .4byte gUnknown_02024C10
_08014AAC: .4byte gUnknown_081D9E7C
_08014AB0: .4byte 0x000160d8
_08014AB4: .4byte gUnknown_02024A7F
	thumb_func_end sub_80147A0

	thumb_func_start sub_8014AB8
sub_8014AB8: @ 8014AB8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	ldr r1, _08014ADC @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r1, r0, r1
	ldrh r0, [r1, 0x2E]
	cmp r0, 0xAF
	bne _08014AE4
	ldr r1, _08014AE0 @ =gEnigmaBerries
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x7]
	b _08014AEE
	.align 2, 0
_08014ADC: .4byte gBattleMons
_08014AE0: .4byte gEnigmaBerries
_08014AE4:
	ldrh r0, [r1, 0x2E]
	bl ItemId_GetHoldEffect
	lsls r0, 24
	lsrs r1, r0, 24
_08014AEE:
	ldr r0, _08014B18 @ =gUnknown_02024C0B
	strb r4, [r0]
	cmp r1, 0x25
	bne _08014B28
	ldr r2, _08014B1C @ =gUnknown_02024C04
	ldr r1, _08014B20 @ =gBattleMons
	movs r0, 0x58
	muls r0, r4
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	strh r0, [r2]
	ldr r0, _08014B24 @ =gUnknown_02024D28
	lsls r2, r4, 4
	adds r2, r0
	ldrb r1, [r2, 0x1]
	movs r0, 0x19
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	b _08014B50
	.align 2, 0
_08014B18: .4byte gUnknown_02024C0B
_08014B1C: .4byte gUnknown_02024C04
_08014B20: .4byte gBattleMons
_08014B24: .4byte gUnknown_02024D28
_08014B28:
	ldr r6, _08014B5C @ =gBattleMons
	movs r2, 0x58
	adds r0, r4, 0
	muls r0, r2
	adds r3, r0, r6
	adds r0, r3, 0
	adds r0, 0x20
	ldrb r1, [r0]
	cmp r1, 0x32
	bne _08014B68
	ldr r0, _08014B60 @ =byte_2024C06
	strb r1, [r0]
	ldr r0, _08014B64 @ =gUnknown_02024D28
	lsls r2, r4, 4
	adds r2, r0
	ldrb r1, [r2, 0x1]
	movs r0, 0x19
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
_08014B50:
	orrs r0, r1
	strb r0, [r2, 0x1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	b _08014BC2
	.align 2, 0
_08014B5C: .4byte gBattleMons
_08014B60: .4byte byte_2024C06
_08014B64: .4byte gUnknown_02024D28
_08014B68:
	ldr r0, _08014BDC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08014BB6
	movs r1, 0x1
	adds r0, r4, 0
	eors r0, r1
	muls r0, r2
	adds r2, r0, r6
	ldrh r0, [r3, 0x6]
	ldrh r1, [r2, 0x6]
	cmp r0, r1
	bcs _08014BB0
	lsls r0, 7
	ldrh r1, [r2, 0x6]
	bl __divsi3
	adds r4, r0, 0
	ldr r0, _08014BE0 @ =0x02000000
	ldr r1, _08014BE4 @ =0x00016078
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 1
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	movs r1, 0xFF
	ands r1, r0
	cmp r4, r1
	bls _08014BB6
_08014BB0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08014BB6:
	ldr r1, _08014BE0 @ =0x02000000
	ldr r0, _08014BE4 @ =0x00016078
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08014BC2:
	cmp r5, 0
	beq _08014BD4
	ldr r1, _08014BE8 @ =gUnknown_02024A7E
	ldr r0, _08014BEC @ =gUnknown_02024A68
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _08014BF0 @ =gUnknown_02024D26
	movs r0, 0x4
	strb r0, [r1]
_08014BD4:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08014BDC: .4byte gBattleTypeFlags
_08014BE0: .4byte 0x02000000
_08014BE4: .4byte 0x00016078
_08014BE8: .4byte gUnknown_02024A7E
_08014BEC: .4byte gUnknown_02024A68
_08014BF0: .4byte gUnknown_02024D26
	thumb_func_end sub_8014AB8

	thumb_func_start sub_8014BF4
sub_8014BF4: @ 8014BF4
	push {r4-r6,lr}
	ldr r4, _08014C44 @ =gPlayerMonIndex
	ldr r1, _08014C48 @ =gUnknown_02024A7A
	ldr r5, _08014C4C @ =gUnknown_02024A7E
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r0, _08014C50 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08014C9C
	ldr r0, _08014C54 @ =gUnknown_02024A68
	ldrb r1, [r0]
	strb r1, [r5]
	ldr r2, _08014C58 @ =gUnknown_02024A60
	movs r0, 0
	strb r0, [r2]
	lsls r1, 24
	cmp r1, 0
	beq _08014C88
	adds r4, r2, 0
	ldr r6, _08014C5C @ =gUnknown_02024C18
	ldr r5, _08014C60 @ =gUnknown_02024D26
_08014C28:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08014C64
	ldrb r0, [r4]
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08014C76
	ldrb r0, [r5]
	movs r1, 0x2
	b _08014C72
	.align 2, 0
_08014C44: .4byte gPlayerMonIndex
_08014C48: .4byte gUnknown_02024A7A
_08014C4C: .4byte gUnknown_02024A7E
_08014C50: .4byte gBattleTypeFlags
_08014C54: .4byte gUnknown_02024A68
_08014C58: .4byte gUnknown_02024A60
_08014C5C: .4byte gUnknown_02024C18
_08014C60: .4byte gUnknown_02024D26
_08014C64:
	ldrb r0, [r4]
	adds r0, r6
	ldrb r0, [r0]
	cmp r0, 0x3
	bne _08014C76
	ldrb r0, [r5]
	movs r1, 0x1
_08014C72:
	orrs r0, r1
	strb r0, [r5]
_08014C76:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	ldr r1, _08014C94 @ =gUnknown_02024A68
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1]
	cmp r0, r1
	bcc _08014C28
_08014C88:
	ldr r0, _08014C98 @ =gUnknown_02024D26
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	b _08014D40
	.align 2, 0
_08014C94: .4byte gUnknown_02024A68
_08014C98: .4byte gUnknown_02024D26
_08014C9C:
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08014CF4
	ldrb r0, [r4]
	bl sub_8014AB8
	lsls r0, 24
	cmp r0, 0
	bne _08014D40
	ldr r1, _08014CDC @ =gBattleMons
	ldrb r2, [r4]
	movs r0, 0x58
	muls r2, r0
	adds r1, 0x50
	adds r2, r1
	ldr r0, [r2]
	ldr r1, _08014CE0 @ =0xfdffffff
	ands r0, r1
	str r0, [r2]
	ldr r1, _08014CE4 @ =gUnknown_02024D1E
	movs r0, 0x3
	strb r0, [r1, 0x5]
	ldr r1, _08014CE8 @ =gUnknown_02024C10
	ldr r0, _08014CEC @ =gUnknown_081D8E3B
	str r0, [r1]
	ldr r1, _08014CF0 @ =gUnknown_02024A7F
	movs r0, 0xA
	b _08014D3E
	.align 2, 0
_08014CDC: .4byte gBattleMons
_08014CE0: .4byte 0xfdffffff
_08014CE4: .4byte gUnknown_02024D1E
_08014CE8: .4byte gUnknown_02024C10
_08014CEC: .4byte gUnknown_081D8E3B
_08014CF0: .4byte gUnknown_02024A7F
_08014CF4:
	ldr r1, _08014D1C @ =gBattleMons
	ldrb r2, [r4]
	movs r0, 0x58
	muls r0, r2
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _08014D20 @ =0x0400e000
	ands r0, r1
	cmp r0, 0
	beq _08014D34
	ldr r1, _08014D24 @ =gUnknown_02024D1E
	movs r0, 0x4
	strb r0, [r1, 0x5]
	ldr r1, _08014D28 @ =gUnknown_02024C10
	ldr r0, _08014D2C @ =gUnknown_081D8E3B
	str r0, [r1]
	ldr r1, _08014D30 @ =gUnknown_02024A7F
	movs r0, 0xA
	b _08014D3E
	.align 2, 0
_08014D1C: .4byte gBattleMons
_08014D20: .4byte 0x0400e000
_08014D24: .4byte gUnknown_02024D1E
_08014D28: .4byte gUnknown_02024C10
_08014D2C: .4byte gUnknown_081D8E3B
_08014D30: .4byte gUnknown_02024A7F
_08014D34:
	ldr r0, _08014D48 @ =gUnknown_02024A68
	ldrb r0, [r0]
	strb r0, [r5]
	ldr r1, _08014D4C @ =gUnknown_02024D26
	movs r0, 0x6
_08014D3E:
	strb r0, [r1]
_08014D40:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014D48: .4byte gUnknown_02024A68
_08014D4C: .4byte gUnknown_02024D26
	thumb_func_end sub_8014BF4

	thumb_func_start sub_8014D50
sub_8014D50: @ 8014D50
	ldr r2, _08014D78 @ =gPlayerMonIndex
	ldr r1, _08014D7C @ =gUnknown_02024A7A
	ldr r0, _08014D80 @ =gUnknown_02024A7E
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08014D84 @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08014D88 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r1, _08014D8C @ =gUnknown_02024C10
	ldr r0, _08014D90 @ =gUnknown_081D9E98
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _08014D94 @ =gUnknown_02024A7F
	movs r0, 0xA
	strb r0, [r1]
	bx lr
	.align 2, 0
_08014D78: .4byte gPlayerMonIndex
_08014D7C: .4byte gUnknown_02024A7A
_08014D80: .4byte gUnknown_02024A7E
_08014D84: .4byte gUnknown_030042A4
_08014D88: .4byte gUnknown_030042A0
_08014D8C: .4byte gUnknown_02024C10
_08014D90: .4byte gUnknown_081D9E98
_08014D94: .4byte gUnknown_02024A7F
	thumb_func_end sub_8014D50

	thumb_func_start sub_8014D98
sub_8014D98: @ 8014D98
	ldr r2, _08014DD0 @ =gPlayerMonIndex
	ldr r1, _08014DD4 @ =gUnknown_02024A7A
	ldr r0, _08014DD8 @ =gUnknown_02024A7E
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08014DDC @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08014DE0 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r1, _08014DE4 @ =gNumSafariBalls
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	ldr r1, _08014DE8 @ =gUnknown_02024C04
	movs r0, 0x5
	strh r0, [r1]
	ldr r1, _08014DEC @ =gUnknown_02024C10
	ldr r0, _08014DF0 @ =gUnknown_081D9E48
	ldr r0, [r0, 0x14]
	str r0, [r1]
	ldr r1, _08014DF4 @ =gUnknown_02024A7F
	movs r0, 0xA
	strb r0, [r1]
	bx lr
	.align 2, 0
_08014DD0: .4byte gPlayerMonIndex
_08014DD4: .4byte gUnknown_02024A7A
_08014DD8: .4byte gUnknown_02024A7E
_08014DDC: .4byte gUnknown_030042A4
_08014DE0: .4byte gUnknown_030042A0
_08014DE4: .4byte gNumSafariBalls
_08014DE8: .4byte gUnknown_02024C04
_08014DEC: .4byte gUnknown_02024C10
_08014DF0: .4byte gUnknown_081D9E48
_08014DF4: .4byte gUnknown_02024A7F
	thumb_func_end sub_8014D98

	thumb_func_start sub_8014DF8
sub_8014DF8: @ 8014DF8
	push {r4-r6,lr}
	ldr r3, _08014E68 @ =gPlayerMonIndex
	ldr r1, _08014E6C @ =gUnknown_02024A7A
	ldr r0, _08014E70 @ =gUnknown_02024A7E
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r3]
	ldr r0, _08014E74 @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08014E78 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r6, _08014E7C @ =gUnknown_02024D1E
	ldr r2, _08014E80 @ =gUnknown_02024260
	ldrb r0, [r3]
	lsls r0, 9
	adds r1, r2, 0x1
	adds r0, r1
	ldrb r0, [r0]
	subs r0, 0x1
	strb r0, [r6, 0x5]
	ldr r1, _08014E84 @ =gUnknown_02024C04
	ldrb r0, [r3]
	lsls r0, 9
	adds r2, 0x2
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r1]
	ldr r2, _08014E88 @ =0x02000000
	ldr r0, _08014E8C @ =0x00016087
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, 0x2
	bhi _08014E42
	adds r0, 0x1
	strb r0, [r1]
_08014E42:
	ldr r0, _08014E90 @ =0x00016088
	adds r4, r2, r0
	ldrb r5, [r4]
	adds r3, r5, 0
	cmp r3, 0x1
	bls _08014E9C
	ldr r2, _08014E94 @ =gUnknown_081FA70C
	ldrb r1, [r1]
	lsls r0, r1, 1
	adds r0, r1
	ldrb r6, [r6, 0x5]
	adds r0, r6
	adds r0, r2
	ldrb r0, [r0]
	cmp r3, r0
	bcs _08014E98
	movs r0, 0x1
	b _08014E9A
	.align 2, 0
_08014E68: .4byte gPlayerMonIndex
_08014E6C: .4byte gUnknown_02024A7A
_08014E70: .4byte gUnknown_02024A7E
_08014E74: .4byte gUnknown_030042A4
_08014E78: .4byte gUnknown_030042A0
_08014E7C: .4byte gUnknown_02024D1E
_08014E80: .4byte gUnknown_02024260
_08014E84: .4byte gUnknown_02024C04
_08014E88: .4byte 0x02000000
_08014E8C: .4byte 0x00016087
_08014E90: .4byte 0x00016088
_08014E94: .4byte gUnknown_081FA70C
_08014E98:
	subs r0, r5, r0
_08014E9A:
	strb r0, [r4]
_08014E9C:
	ldr r1, _08014EB0 @ =gUnknown_02024C10
	ldr r0, _08014EB4 @ =gUnknown_081D9E98
	ldr r0, [r0, 0x8]
	str r0, [r1]
	ldr r1, _08014EB8 @ =gUnknown_02024A7F
	movs r0, 0xA
	strb r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08014EB0: .4byte gUnknown_02024C10
_08014EB4: .4byte gUnknown_081D9E98
_08014EB8: .4byte gUnknown_02024A7F
	thumb_func_end sub_8014DF8

	thumb_func_start sub_8014EBC
sub_8014EBC: @ 8014EBC
	push {r4,r5,lr}
	ldr r2, _08014F28 @ =gPlayerMonIndex
	ldr r1, _08014F2C @ =gUnknown_02024A7A
	ldr r0, _08014F30 @ =gUnknown_02024A7E
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, _08014F34 @ =gUnknown_030042A4
	movs r5, 0
	strh r5, [r0]
	ldr r0, _08014F38 @ =gUnknown_030042A0
	strh r5, [r0]
	ldr r3, _08014F3C @ =0x02000000
	ldr r0, _08014F40 @ =0x00016089
	adds r2, r3, r0
	ldr r1, _08014F44 @ =gUnknown_081FA71B
	subs r0, 0x3
	adds r4, r3, r0
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2]
	adds r0, r1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x14
	bls _08014EFA
	movs r0, 0x14
	strb r0, [r2]
_08014EFA:
	ldr r0, _08014F48 @ =0x00016088
	adds r2, r3, r0
	ldr r1, _08014F4C @ =gUnknown_081FA71F
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2]
	adds r0, r1
	strb r0, [r2]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x14
	bls _08014F18
	movs r0, 0x14
	strb r0, [r2]
_08014F18:
	ldrb r0, [r4]
	cmp r0, 0x2
	bhi _08014F54
	adds r0, 0x1
	strb r0, [r4]
	ldr r0, _08014F50 @ =gUnknown_02024D1E
	strb r5, [r0, 0x5]
	b _08014F5A
	.align 2, 0
_08014F28: .4byte gPlayerMonIndex
_08014F2C: .4byte gUnknown_02024A7A
_08014F30: .4byte gUnknown_02024A7E
_08014F34: .4byte gUnknown_030042A4
_08014F38: .4byte gUnknown_030042A0
_08014F3C: .4byte 0x02000000
_08014F40: .4byte 0x00016089
_08014F44: .4byte gUnknown_081FA71B
_08014F48: .4byte 0x00016088
_08014F4C: .4byte gUnknown_081FA71F
_08014F50: .4byte gUnknown_02024D1E
_08014F54:
	ldr r1, _08014F70 @ =gUnknown_02024D1E
	movs r0, 0x1
	strb r0, [r1, 0x5]
_08014F5A:
	ldr r1, _08014F74 @ =gUnknown_02024C10
	ldr r0, _08014F78 @ =gUnknown_081D9E98
	ldr r0, [r0, 0x4]
	str r0, [r1]
	ldr r1, _08014F7C @ =gUnknown_02024A7F
	movs r0, 0xA
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014F70: .4byte gUnknown_02024D1E
_08014F74: .4byte gUnknown_02024C10
_08014F78: .4byte gUnknown_081D9E98
_08014F7C: .4byte gUnknown_02024A7F
	thumb_func_end sub_8014EBC

	thumb_func_start bs8_exit_by_flight
bs8_exit_by_flight: @ 8014F80
	push {r4,lr}
	ldr r2, _08014FA8 @ =gPlayerMonIndex
	ldr r1, _08014FAC @ =gUnknown_02024A7A
	ldr r4, _08014FB0 @ =gUnknown_02024A7E
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x11
	bl PlaySE
	ldr r0, _08014FB4 @ =gUnknown_02024A68
	ldrb r0, [r0]
	strb r0, [r4]
	ldr r1, _08014FB8 @ =gUnknown_02024D26
	movs r0, 0x4
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014FA8: .4byte gPlayerMonIndex
_08014FAC: .4byte gUnknown_02024A7A
_08014FB0: .4byte gUnknown_02024A7E
_08014FB4: .4byte gUnknown_02024A68
_08014FB8: .4byte gUnknown_02024D26
	thumb_func_end bs8_exit_by_flight

	thumb_func_start sub_8014FBC
sub_8014FBC: @ 8014FBC
	ldr r3, _08015008 @ =gPlayerMonIndex
	ldr r1, _0801500C @ =gUnknown_02024A7A
	ldr r0, _08015010 @ =gUnknown_02024A7E
	ldrb r0, [r0]
	adds r0, r1
	ldrb r2, [r0]
	strb r2, [r3]
	ldr r0, _08015014 @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08015018 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r1, _0801501C @ =gUnknown_030041C0
	movs r0, 0xFD
	strb r0, [r1]
	movs r0, 0x7
	strb r0, [r1, 0x1]
	strb r2, [r1, 0x2]
	ldr r2, _08015020 @ =gUnknown_02024A6A
	ldrb r0, [r3]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	ldr r1, _08015024 @ =gUnknown_02024C10
	ldr r0, _08015028 @ =gUnknown_081D9E98
	ldr r0, [r0, 0xC]
	str r0, [r1]
	ldr r1, _0801502C @ =gUnknown_02024A7F
	movs r0, 0xA
	strb r0, [r1]
	ldr r1, _08015030 @ =gUnknown_02024A76
	movs r0, 0xC
	strb r0, [r1, 0x1]
	bx lr
	.align 2, 0
_08015008: .4byte gPlayerMonIndex
_0801500C: .4byte gUnknown_02024A7A
_08015010: .4byte gUnknown_02024A7E
_08015014: .4byte gUnknown_030042A4
_08015018: .4byte gUnknown_030042A0
_0801501C: .4byte gUnknown_030041C0
_08015020: .4byte gUnknown_02024A6A
_08015024: .4byte gUnknown_02024C10
_08015028: .4byte gUnknown_081D9E98
_0801502C: .4byte gUnknown_02024A7F
_08015030: .4byte gUnknown_02024A76
	thumb_func_end sub_8014FBC

	thumb_func_start bsB_exit_by_move
bsB_exit_by_move: @ 8015034
	push {lr}
	bl sub_80173A4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08015050
	ldr r0, _08015054 @ =0x02000000
	ldr r2, _08015058 @ =0x00016059
	adds r0, r2
	strb r1, [r0]
	ldr r1, _0801505C @ =gUnknown_02024A7F
	movs r0, 0xC
	strb r0, [r1]
_08015050:
	pop {r0}
	bx r0
	.align 2, 0
_08015054: .4byte 0x02000000
_08015058: .4byte 0x00016059
_0801505C: .4byte gUnknown_02024A7F
	thumb_func_end bsB_exit_by_move

	thumb_func_start sub_8015060
sub_8015060: @ 8015060
	ldr r1, _08015080 @ =gUnknown_02024A7E
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r3, _08015084 @ =gUnknown_02024A7F
	ldr r2, _08015088 @ =gUnknown_02024A76
	ldrb r0, [r1]
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	ldr r2, _0801508C @ =gUnknown_02024C6C
	ldr r0, [r2]
	ldr r1, _08015090 @ =0xf1e892af
	ands r0, r1
	str r0, [r2]
	bx lr
	.align 2, 0
_08015080: .4byte gUnknown_02024A7E
_08015084: .4byte gUnknown_02024A7F
_08015088: .4byte gUnknown_02024A76
_0801508C: .4byte gUnknown_02024C6C
_08015090: .4byte 0xf1e892af
	thumb_func_end sub_8015060

	thumb_func_start bsC_8016D70
bsC_8016D70: @ 8015094
	push {r4,r5,lr}
	ldr r1, _0801510C @ =gUnknown_02024A7E
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r3, _08015110 @ =gUnknown_02024A7F
	ldr r2, _08015114 @ =gUnknown_02024A76
	ldrb r0, [r1]
	adds r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	bl sub_801377C
	ldr r2, _08015118 @ =gUnknown_02024C6C
	ldr r0, [r2]
	ldr r1, _0801511C @ =0xf1e892af
	ands r0, r1
	str r0, [r2]
	ldr r0, _08015120 @ =gBattleMoveDamage
	movs r4, 0
	str r4, [r0]
	ldr r1, _08015124 @ =0x02000000
	ldr r2, _08015128 @ =0x00016002
	adds r0, r1, r2
	strb r4, [r0]
	ldr r3, _0801512C @ =0x000160a1
	adds r0, r1, r3
	strb r4, [r0]
	ldr r2, _08015130 @ =gUnknown_02024C3C
	ldr r5, _08015134 @ =gPlayerMonIndex
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r2
	movs r2, 0
	strh r4, [r0]
	ldr r3, _08015138 @ =gUnknown_02024C44
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, r3
	strh r4, [r0]
	ldr r3, _0801513C @ =0x0001601c
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _08015140 @ =gUnknown_02024DEC
	strh r4, [r0]
	subs r3, 0x10
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _08015144 @ =gUnknown_02024D1E
	strb r2, [r0, 0x3]
	strb r2, [r0, 0x4]
	ldr r3, _08015148 @ =0x00016112
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _0801514C @ =0x00017130
	adds r1, r0
	strb r2, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801510C: .4byte gUnknown_02024A7E
_08015110: .4byte gUnknown_02024A7F
_08015114: .4byte gUnknown_02024A76
_08015118: .4byte gUnknown_02024C6C
_0801511C: .4byte 0xf1e892af
_08015120: .4byte gBattleMoveDamage
_08015124: .4byte 0x02000000
_08015128: .4byte 0x00016002
_0801512C: .4byte 0x000160a1
_08015130: .4byte gUnknown_02024C3C
_08015134: .4byte gPlayerMonIndex
_08015138: .4byte gUnknown_02024C44
_0801513C: .4byte 0x0001601c
_08015140: .4byte gUnknown_02024DEC
_08015144: .4byte gUnknown_02024D1E
_08015148: .4byte 0x00016112
_0801514C: .4byte 0x00017130
	thumb_func_end bsC_8016D70

	thumb_func_start sub_8015150
sub_8015150: @ 8015150
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	cmp r0, 0xA
	bhi _080151C8
	lsls r0, 2
	ldr r1, _08015168 @ =_0801516C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08015168: .4byte _0801516C
	.align 2, 0
_0801516C:
	.4byte _08015198
	.4byte _080151A0
	.4byte _080151A8
	.4byte _080151C4
	.4byte _080151C8
	.4byte _080151C4
	.4byte _080151C8
	.4byte _080151B0
	.4byte _080151C8
	.4byte _080151C8
	.4byte _080151B4
_08015198:
	ldr r0, _0801519C @ =gEnemyMonIndex
	b _080151C6
	.align 2, 0
_0801519C: .4byte gEnemyMonIndex
_080151A0:
	ldr r0, _080151A4 @ =gPlayerMonIndex
	b _080151C6
	.align 2, 0
_080151A4: .4byte gPlayerMonIndex
_080151A8:
	ldr r0, _080151AC @ =gUnknown_02024C0A
	b _080151C6
	.align 2, 0
_080151AC: .4byte gUnknown_02024C0A
_080151B0:
	movs r2, 0
	b _080151C8
_080151B4:
	ldr r0, _080151BC @ =0x02000000
	ldr r1, _080151C0 @ =0x00016003
	adds r0, r1
	b _080151C6
	.align 2, 0
_080151BC: .4byte 0x02000000
_080151C0: .4byte 0x00016003
_080151C4:
	ldr r0, _080151D0 @ =gUnknown_02024C09
_080151C6:
	ldrb r2, [r0]
_080151C8:
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_080151D0: .4byte gUnknown_02024C09
	thumb_func_end sub_8015150

	thumb_func_start sub_80151D4
sub_80151D4: @ 80151D4
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 16
	lsrs r2, 16
	ldr r1, _08015204 @ =gBattleMons
	movs r4, 0x58
	muls r0, r4
	adds r0, r1
	adds r0, 0x20
	ldrb r0, [r0]
	mov r12, r1
	cmp r0, 0x2E
	bne _08015286
	movs r3, 0
	adds r0, r5, 0
	muls r0, r4
	adds r1, 0xC
	adds r1, r0, r1
	b _08015210
	.align 2, 0
_08015204: .4byte gBattleMons
_08015208:
	adds r1, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	bgt _08015216
_08015210:
	ldrh r0, [r1]
	cmp r0, r2
	bne _08015208
_08015216:
	cmp r3, 0x4
	beq _08015286
	movs r7, 0x58
	adds r2, r5, 0
	muls r2, r7
	adds r0, r3, r2
	mov r6, r12
	adds r6, 0x24
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, 0
	beq _08015232
	subs r0, 0x1
	strb r0, [r1]
_08015232:
	mov r0, r12
	adds r0, 0x50
	adds r0, r2, r0
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _08015286
	ldr r1, _08015290 @ =gUnknown_02024CA8
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _08015294 @ =gBitTable
	lsls r0, r3, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _08015286
	ldr r4, _08015298 @ =gUnknown_02024A60
	strb r5, [r4]
	adds r1, r3, 0
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	muls r0, r7
	adds r0, r6
	adds r0, r3
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_08015286:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015290: .4byte gUnknown_02024CA8
_08015294: .4byte gBitTable
_08015298: .4byte gUnknown_02024A60
	thumb_func_end sub_80151D4

	thumb_func_start sub_801529C
sub_801529C: @ 801529C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x4
	mov r8, r0
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r4, 0
	ldr r0, _080153BC @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r4, r0
	bge _08015344
	ldr r1, _080153C0 @ =gBattleMons
	movs r0, 0x58
	adds r7, r5, 0
	muls r7, r0
	adds r1, 0xC
	mov r10, r1
_080152D2:
	lsls r0, r4, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	adds r6, r4, 0x1
	cmp r9, r0
	beq _0801533A
	ldr r0, _080153C0 @ =gBattleMons
	movs r3, 0x58
	adds r1, r4, 0
	muls r1, r3
	adds r1, r0
	adds r1, 0x20
	ldrb r1, [r1]
	adds r4, r0, 0
	cmp r1, 0x2E
	bne _0801533A
	movs r2, 0
	adds r0, r5, 0
	muls r0, r3
	adds r1, r4, 0
	adds r1, 0xC
	adds r0, r1
	ldrh r0, [r0]
	movs r1, 0x8F
	lsls r1, 1
	cmp r0, r1
	beq _08015322
	adds r3, r1, 0
	mov r0, r10
	adds r1, r7, r0
_08015314:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	bgt _08015322
	ldrh r0, [r1]
	cmp r0, r3
	bne _08015314
_08015322:
	cmp r2, 0x4
	beq _0801533A
	mov r8, r2
	adds r1, r2, r7
	adds r0, r4, 0
	adds r0, 0x24
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _0801533A
	subs r0, 0x1
	strb r0, [r1]
_0801533A:
	adds r4, r6, 0
	ldr r0, _080153BC @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r4, r0
	blt _080152D2
_08015344:
	mov r1, r8
	cmp r1, 0x4
	beq _080153AC
	ldr r6, _080153C0 @ =gBattleMons
	movs r3, 0x58
	adds r0, r5, 0
	muls r0, r3
	adds r1, r6, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _080153AC
	ldr r1, _080153C4 @ =gUnknown_02024CA8
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _080153C8 @ =gBitTable
	mov r4, r8
	lsls r0, r4, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080153AC
	ldr r4, _080153CC @ =gUnknown_02024A60
	strb r5, [r4]
	mov r1, r8
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	muls r0, r3
	adds r2, r6, 0
	adds r2, 0x24
	adds r0, r2
	add r0, r8
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_080153AC:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080153BC: .4byte gUnknown_02024A68
_080153C0: .4byte gBattleMons
_080153C4: .4byte gUnknown_02024CA8
_080153C8: .4byte gBitTable
_080153CC: .4byte gUnknown_02024A60
	thumb_func_end sub_801529C

	thumb_func_start sub_80153D0
sub_80153D0: @ 80153D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r3, r0, 24
	movs r6, 0x4
	movs r1, 0
	ldr r0, _080154C8 @ =gUnknown_02024A68
	mov r8, r0
	ldrb r0, [r0]
	cmp r1, r0
	bge _08015452
	ldr r7, _080154CC @ =gBattleMons
	movs r2, 0x58
	mov r12, r2
	mov r5, r12
	muls r5, r3
	adds r0, r7, 0
	adds r0, 0xC
	adds r2, r5, r0
	mov r10, r2
	mov r9, r5
_08015402:
	mov r0, r12
	muls r0, r1
	adds r0, r7
	adds r0, 0x20
	ldrb r0, [r0]
	adds r4, r1, 0x1
	cmp r0, 0x2E
	bne _08015448
	cmp r1, r3
	beq _08015448
	movs r2, 0
	mov r1, r10
	ldrh r0, [r1]
	cmp r0, 0xC3
	beq _08015432
	ldr r1, _080154D0 @ =gUnknown_02024A8C
	add r1, r9
_08015424:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x3
	bgt _08015432
	ldrh r0, [r1]
	cmp r0, 0xC3
	bne _08015424
_08015432:
	cmp r2, 0x4
	beq _08015448
	adds r6, r2, 0
	adds r0, r6, r5
	ldr r2, _080154D4 @ =gUnknown_02024AA4
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _08015448
	subs r0, 0x1
	strb r0, [r1]
_08015448:
	adds r1, r4, 0
	mov r0, r8
	ldrb r0, [r0]
	cmp r1, r0
	blt _08015402
_08015452:
	cmp r6, 0x4
	beq _080154B6
	ldr r7, _080154CC @ =gBattleMons
	movs r5, 0x58
	adds r0, r3, 0
	muls r0, r5
	adds r1, r7, 0
	adds r1, 0x50
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x80
	lsls r1, 14
	ands r0, r1
	cmp r0, 0
	bne _080154B6
	ldr r1, _080154D8 @ =gUnknown_02024CA8
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x18]
	lsrs r1, 4
	ldr r2, _080154DC @ =gBitTable
	lsls r0, r6, 2
	adds r0, r2
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	bne _080154B6
	ldr r4, _080154E0 @ =gUnknown_02024A60
	strb r3, [r4]
	adds r1, r6, 0
	adds r1, 0x9
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r4]
	muls r0, r5
	adds r2, r7, 0
	adds r2, 0x24
	adds r0, r2
	adds r0, r6
	str r0, [sp]
	movs r0, 0
	movs r2, 0
	movs r3, 0x1
	bl dp01_build_cmdbuf_x02_a_b_varargs
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
_080154B6:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080154C8: .4byte gUnknown_02024A68
_080154CC: .4byte gBattleMons
_080154D0: .4byte gUnknown_02024A8C
_080154D4: .4byte gUnknown_02024AA4
_080154D8: .4byte gUnknown_02024CA8
_080154DC: .4byte gBitTable
_080154E0: .4byte gUnknown_02024A60
	thumb_func_end sub_80153D0

	thumb_func_start unref_sub_80154E4
unref_sub_80154E4: @ 80154E4
	push {r4,r5,lr}
	ldr r0, _08015514 @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08015524
	movs r2, 0
	ldr r4, _08015518 @ =gUnknown_02024A68
	ldrb r0, [r4]
	cmp r2, r0
	bge _08015542
	ldr r3, _0801551C @ =gUnknown_02024A64
	ldr r5, _08015520 @ =gBitTable
_08015500:
	ldm r5!, {r1}
	lsls r1, 28
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	adds r2, 0x1
	ldrb r0, [r4]
	cmp r2, r0
	blt _08015500
	b _08015542
	.align 2, 0
_08015514: .4byte gBattleTypeFlags
_08015518: .4byte gUnknown_02024A68
_0801551C: .4byte gUnknown_02024A64
_08015520: .4byte gBitTable
_08015524:
	movs r2, 0
	ldr r4, _08015548 @ =gUnknown_02024A68
	ldrb r0, [r4]
	cmp r2, r0
	bge _08015542
	ldr r3, _0801554C @ =gUnknown_02024A64
	ldr r5, _08015550 @ =gBitTable
_08015532:
	ldr r0, [r3]
	ldm r5!, {r1}
	orrs r0, r1
	str r0, [r3]
	adds r2, 0x1
	ldrb r0, [r4]
	cmp r2, r0
	blt _08015532
_08015542:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015548: .4byte gUnknown_02024A68
_0801554C: .4byte gUnknown_02024A64
_08015550: .4byte gBitTable
	thumb_func_end unref_sub_80154E4

	thumb_func_start dp01_battle_side_mark_buffer_for_execution
dp01_battle_side_mark_buffer_for_execution: @ 8015554
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0801557C @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08015588
	ldr r2, _08015580 @ =gUnknown_02024A64
	ldr r1, _08015584 @ =gBitTable
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r1, 28
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	b _08015598
	.align 2, 0
_0801557C: .4byte gBattleTypeFlags
_08015580: .4byte gUnknown_02024A64
_08015584: .4byte gBitTable
_08015588:
	ldr r2, _0801559C @ =gUnknown_02024A64
	ldr r1, _080155A0 @ =gBitTable
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r2]
_08015598:
	pop {r0}
	bx r0
	.align 2, 0
_0801559C: .4byte gUnknown_02024A64
_080155A0: .4byte gBitTable
	thumb_func_end dp01_battle_side_mark_buffer_for_execution

	thumb_func_start sub_80155A4
sub_80155A4: @ 80155A4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r4, 0
	ldr r5, _080155B8 @ =gUnknown_02024A64
	ldr r1, _080155BC @ =gBitTable
	lsls r0, r7, 2
	adds r6, r0, r1
	b _080155CE
	.align 2, 0
_080155B8: .4byte gUnknown_02024A64
_080155BC: .4byte gBitTable
_080155C0:
	lsls r0, r4, 2
	ldr r1, [r6]
	lsls r1, r0
	ldr r0, [r5]
	orrs r0, r1
	str r0, [r5]
	adds r4, 0x1
_080155CE:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	blt _080155C0
	ldr r2, _080155F0 @ =gUnknown_02024A64
	movs r1, 0x80
	lsls r1, 21
	lsls r1, r7
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080155F0: .4byte gUnknown_02024A64
	thumb_func_end sub_80155A4

	thumb_func_start b_cancel_multi_turn_move_maybe
b_cancel_multi_turn_move_maybe: @ 80155F4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08015644 @ =gBattleMons
	movs r2, 0x58
	adds r3, r0, 0
	muls r3, r2
	adds r1, 0x50
	adds r3, r1
	ldr r1, [r3]
	ldr r2, _08015648 @ =0xffffefff
	ands r1, r2
	ldr r2, _0801564C @ =0xfffff3ff
	ands r1, r2
	movs r2, 0x71
	negs r2, r2
	ands r1, r2
	ldr r2, _08015650 @ =0xfffffcff
	ands r1, r2
	str r1, [r3]
	ldr r1, _08015654 @ =gUnknown_02024C98
	lsls r2, r0, 2
	adds r2, r1
	ldr r1, [r2]
	ldr r3, _08015658 @ =0xfffbff3f
	ands r1, r3
	str r1, [r2]
	ldr r2, _0801565C @ =gUnknown_02024CA8
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r2, [r1, 0x11]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x11]
	movs r0, 0
	strb r0, [r1, 0x10]
	bx lr
	.align 2, 0
_08015644: .4byte gBattleMons
_08015648: .4byte 0xffffefff
_0801564C: .4byte 0xfffff3ff
_08015650: .4byte 0xfffffcff
_08015654: .4byte gUnknown_02024C98
_08015658: .4byte 0xfffbff3f
_0801565C: .4byte gUnknown_02024CA8
	thumb_func_end b_cancel_multi_turn_move_maybe

	thumb_func_start sub_8015660
sub_8015660: @ 8015660
	push {lr}
	lsls r0, 24
	ldr r1, _080156AC @ =gUnknown_02024D28
	lsrs r0, 20
	adds r1, r0, r1
	ldrb r0, [r1]
	lsrs r0, 7
	cmp r0, 0
	bne _080156A6
	ldrb r2, [r1, 0x1]
	lsls r0, r2, 30
	cmp r0, 0
	blt _080156A6
	lsls r0, r2, 26
	cmp r0, 0
	blt _080156A6
	lsls r0, r2, 25
	cmp r0, 0
	blt _080156A6
	lsrs r0, r2, 7
	cmp r0, 0
	bne _080156A6
	ldrb r1, [r1, 0x2]
	lsls r0, r1, 31
	cmp r0, 0
	bne _080156A6
	lsls r0, r1, 30
	cmp r0, 0
	blt _080156A6
	lsls r0, r1, 29
	cmp r0, 0
	blt _080156A6
	lsls r0, r2, 31
	cmp r0, 0
	beq _080156B0
_080156A6:
	movs r0, 0x1
	b _080156B2
	.align 2, 0
_080156AC: .4byte gUnknown_02024D28
_080156B0:
	movs r0, 0
_080156B2:
	pop {r1}
	bx r1
	thumb_func_end sub_8015660

	thumb_func_start b_std_message
b_std_message: @ 80156B8
	push {r4,lr}
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	ldr r4, _080156D8 @ =gUnknown_02024A60
	strb r1, [r4]
	movs r0, 0
	adds r1, r2, 0
	bl dp01_build_cmdbuf_x10_TODO
	ldrb r0, [r4]
	bl dp01_battle_side_mark_buffer_for_execution
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080156D8: .4byte gUnknown_02024A60
	thumb_func_end b_std_message

	thumb_func_start sub_80156DC
sub_80156DC: @ 80156DC
	push {r4-r6,lr}
	movs r3, 0
	ldr r0, _08015730 @ =gUnknown_02024DEA
	strb r3, [r0]
	strb r3, [r0, 0x1]
	movs r1, 0
	ldr r0, _08015734 @ =gUnknown_02024A68
	ldrb r2, [r0]
	adds r6, r0, 0
	cmp r1, r2
	bge _0801570A
	ldr r5, _08015738 @ =gBitTable
	adds r4, r2, 0
	ldr r2, _0801573C @ =gUnknown_02024A6A
_080156F8:
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r5
	ldr r0, [r0]
	orrs r3, r0
	adds r2, 0x4
	adds r1, 0x2
	cmp r1, r4
	blt _080156F8
_0801570A:
	movs r1, 0x1
	adds r2, r6, 0
	ldrb r0, [r2]
	cmp r1, r0
	bge _0801572A
	ldr r5, _08015730 @ =gUnknown_02024DEA
	movs r4, 0x2
_08015718:
	adds r0, r1, 0
	ands r0, r4
	asrs r0, 1
	adds r0, r5
	strb r3, [r0]
	adds r1, 0x2
	ldrb r0, [r2]
	cmp r1, r0
	blt _08015718
_0801572A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08015730: .4byte gUnknown_02024DEA
_08015734: .4byte gUnknown_02024A68
_08015738: .4byte gBitTable
_0801573C: .4byte gUnknown_02024A6A
	thumb_func_end sub_80156DC

	thumb_func_start sub_8015740
sub_8015740: @ 8015740
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080157A4
	movs r0, 0x2
	ands r0, r5
	lsls r0, 24
	lsrs r0, 25
	mov r12, r0
	ldr r1, _080157B0 @ =gUnknown_02024DEA
	adds r0, r1
	strb r4, [r0]
	adds r5, r4, 0
	ldr r0, _080157B4 @ =gUnknown_02024A68
	ldrb r2, [r0]
	mov r8, r1
	cmp r4, r2
	bge _0801579E
	ldr r0, _080157B8 @ =gUnknown_02024C0C
	ldrb r7, [r0]
	ldr r1, _080157BC @ =gBitTable
	adds r6, r2, 0
	ldr r3, _080157C0 @ =gUnknown_02024A6A
	adds r2, r1, 0
_08015782:
	ldr r0, [r2]
	ands r0, r7
	cmp r0, 0
	bne _08015794
	ldrh r0, [r3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	orrs r4, r0
_08015794:
	adds r3, 0x4
	adds r2, 0x8
	adds r5, 0x2
	cmp r5, r6
	blt _08015782
_0801579E:
	mov r0, r12
	add r0, r8
	strb r4, [r0]
_080157A4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080157B0: .4byte gUnknown_02024DEA
_080157B4: .4byte gUnknown_02024A68
_080157B8: .4byte gUnknown_02024C0C
_080157BC: .4byte gBitTable
_080157C0: .4byte gUnknown_02024A6A
	thumb_func_end sub_8015740

	thumb_func_start sub_80157C4
sub_80157C4: @ 80157C4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080157E0
	adds r0, r4, 0
	bl sub_8015740
	b _08015816
_080157E0:
	movs r3, 0x1
	ldr r5, _0801581C @ =gUnknown_02024A68
	ldrb r0, [r5]
	cmp r3, r0
	bge _08015816
	ldr r0, _08015820 @ =gUnknown_02024DEA
	mov r12, r0
	movs r7, 0x2
	ldr r6, _08015824 @ =gBitTable
	ldr r1, _08015828 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r4, r0, r1
_080157F8:
	adds r2, r3, 0
	ands r2, r7
	asrs r2, 1
	add r2, r12
	ldrh r0, [r4]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	adds r3, 0x1
	ldrb r0, [r5]
	cmp r3, r0
	blt _080157F8
_08015816:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801581C: .4byte gUnknown_02024A68
_08015820: .4byte gUnknown_02024DEA
_08015824: .4byte gBitTable
_08015828: .4byte gUnknown_02024A6A
	thumb_func_end sub_80157C4

	.align 2, 0 @ Don't pad with nop.
