	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start UnusedPokedexAreaScreen
UnusedPokedexAreaScreen: @ 8110664
	push {lr}
	ldr r3, _08110678 @ =0x02000000
	str r1, [r3, 0x4]
	str r2, [r3, 0x8]
	strh r0, [r3, 0xE]
	ldr r0, _0811067C @ =CB2_UnusedPokedexAreaScreen
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08110678: .4byte 0x02000000
_0811067C: .4byte CB2_UnusedPokedexAreaScreen
	thumb_func_end UnusedPokedexAreaScreen

	thumb_func_start CB2_UnusedPokedexAreaScreen
CB2_UnusedPokedexAreaScreen: @ 8110680
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0811069C @ =gMain
	ldr r1, _081106A0 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x7
	bls _08110692
	b _081107C0
_08110692:
	lsls r0, 2
	ldr r1, _081106A4 @ =_081106A8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811069C: .4byte gMain
_081106A0: .4byte 0x0000043c
_081106A4: .4byte _081106A8
	.align 2, 0
_081106A8:
	.4byte _081106C8
	.4byte _08110720
	.4byte _08110740
	.4byte _08110746
	.4byte _08110752
	.4byte _08110770
	.4byte _08110782
	.4byte _081107A8
_081106C8:
	movs r0, 0
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xC4
	lsls r2, 7
	adds r0, r2, 0
	strh r0, [r1]
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	bl FreeSpriteTileRanges
	bl FreeAllSpritePalettes
	ldr r0, _08110710 @ =REG_BG0HOFS
	movs r1, 0
	strh r1, [r0]
	ldr r2, _08110714 @ =REG_BG0VOFS
	ldr r3, _08110718 @ =0x0000fff8
	adds r0, r3, 0
	strh r0, [r2]
	ldr r0, _0811071C @ =REG_BG2VOFS
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	b _081107C0
	.align 2, 0
_08110710: .4byte REG_BG0HOFS
_08110714: .4byte REG_BG0VOFS
_08110718: .4byte 0x0000fff8
_0811071C: .4byte REG_BG2VOFS
_08110720:
	ldr r4, _0811073C @ =0x020006e8
	adds r0, r4, 0
	movs r1, 0
	bl sub_80FA8EC
	movs r0, 0x88
	lsls r0, 4
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x10
	bl StringFill
	b _081107C0
	.align 2, 0
_0811073C: .4byte 0x020006e8
_08110740:
	bl sub_8110824
	b _081107C0
_08110746:
	bl DrawAreaGlow
	lsls r0, 24
	cmp r0, 0
	bne _081107CC
	b _081107C0
_08110752:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80FBCF0
	movs r1, 0x8
	negs r1, r1
	movs r0, 0
	bl sub_80FB2A4
	ldr r0, _0811076C @ =sub_81107DC
	bl SetVBlankCallback
	b _081107C0
	.align 2, 0
_0811076C: .4byte sub_81107DC
_08110770:
	movs r0, 0x15
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _081107C0
_08110782:
	ldr r1, _0811079C @ =REG_BLDCNT
	ldr r2, _081107A0 @ =0x00003f41
	adds r0, r2, 0
	strh r0, [r1]
	bl sub_8111084
	movs r1, 0x80
	lsls r1, 19
	ldr r3, _081107A4 @ =0x00007741
	adds r0, r3, 0
	strh r0, [r1]
	b _081107C0
	.align 2, 0
_0811079C: .4byte REG_BLDCNT
_081107A0: .4byte 0x00003f41
_081107A4: .4byte 0x00007741
_081107A8:
	ldr r0, _081107B8 @ =sub_8111288
	bl sub_8110814
	ldr r0, _081107BC @ =sub_81107F0
	bl SetMainCallback2
	b _081107CC
	.align 2, 0
_081107B8: .4byte sub_8111288
_081107BC: .4byte sub_81107F0
_081107C0:
	ldr r1, _081107D4 @ =gMain
	ldr r0, _081107D8 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_081107CC:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081107D4: .4byte gMain
_081107D8: .4byte 0x0000043c
	thumb_func_end CB2_UnusedPokedexAreaScreen

	thumb_func_start sub_81107DC
sub_81107DC: @ 81107DC
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_81107DC

	thumb_func_start sub_81107F0
sub_81107F0: @ 81107F0
	push {lr}
	ldr r0, _08110810 @ =0x02000000
	ldr r0, [r0]
	bl _call_via_r0
	bl sub_8111110
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
_08110810: .4byte 0x02000000
	thumb_func_end sub_81107F0

	thumb_func_start sub_8110814
sub_8110814: @ 8110814
	ldr r1, _08110820 @ =0x02000000
	str r0, [r1]
	movs r0, 0
	strh r0, [r1, 0xC]
	bx lr
	.align 2, 0
_08110820: .4byte 0x02000000
	thumb_func_end sub_8110814

	thumb_func_start sub_8110824
sub_8110824: @ 8110824
	ldr r0, _08110834 @ =0x02000000
	movs r1, 0x8A
	lsls r1, 1
	adds r0, r1
	movs r1, 0
	strh r1, [r0]
	bx lr
	.align 2, 0
_08110834: .4byte 0x02000000
	thumb_func_end sub_8110824

	thumb_func_start DrawAreaGlow
DrawAreaGlow: @ 8110838
	push {lr}
	ldr r1, _08110854 @ =0x02000000
	movs r2, 0x8A
	lsls r2, 1
	adds r0, r1, r2
	ldrh r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x5
	bhi _081108E4
	lsls r0, 2
	ldr r1, _08110858 @ =_0811085C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08110854: .4byte 0x02000000
_08110858: .4byte _0811085C
	.align 2, 0
_0811085C:
	.4byte _08110874
	.4byte _08110884
	.4byte _0811088A
	.4byte _0811089C
	.4byte _081108C0
	.4byte _081108D0
_08110874:
	ldr r0, _08110880 @ =0x02000000
	ldrh r0, [r0, 0xE]
	bl FindMapsWithMon
	b _081108F0
	.align 2, 0
_08110880: .4byte 0x02000000
_08110884:
	bl BuildAreaGlowTilemap
	b _081108F0
_0811088A:
	ldr r0, _08110894 @ =gUnknown_083F8438
	ldr r1, _08110898 @ =0x0600c000
	bl LZ77UnCompVram
	b _081108F0
	.align 2, 0
_08110894: .4byte gUnknown_083F8438
_08110898: .4byte 0x0600c000
_0811089C:
	ldr r1, _081108B0 @ =0x040000d4
	ldr r0, _081108B4 @ =0x02000116
	str r0, [r1]
	ldr r0, _081108B8 @ =0x0600f000
	str r0, [r1, 0x4]
	ldr r0, _081108BC @ =0x80000280
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	b _081108F0
	.align 2, 0
_081108B0: .4byte 0x040000d4
_081108B4: .4byte 0x02000116
_081108B8: .4byte 0x0600f000
_081108BC: .4byte 0x80000280
_081108C0:
	ldr r0, _081108CC @ =gUnknown_083F8418
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	b _081108F0
	.align 2, 0
_081108CC: .4byte gUnknown_083F8418
_081108D0:
	ldr r1, _081108E8 @ =REG_BG0CNT
	ldr r3, _081108EC @ =0x00001e0d
	adds r0, r3, 0
	strh r0, [r1]
	movs r0, 0x8A
	lsls r0, 1
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_081108E4:
	movs r0, 0
	b _08110900
	.align 2, 0
_081108E8: .4byte REG_BG0CNT
_081108EC: .4byte 0x00001e0d
_081108F0:
	ldr r1, _08110904 @ =0x02000000
	movs r2, 0x8A
	lsls r2, 1
	adds r1, r2
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
_08110900:
	pop {r1}
	bx r1
	.align 2, 0
_08110904: .4byte 0x02000000
	thumb_func_end DrawAreaGlow

	thumb_func_start FindMapsWithMon
FindMapsWithMon: @ 8110908
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 16
	lsrs r7, r0, 16
	.ifdef SAPPHIRE
	ldr r0, _sub_8110908_Latias @ =407
	.else
	@ Latios
	movs r0, 0xCC
	lsls r0, 1
	.endif
	cmp r7, r0
	bne _0811091E
	b _08110A44
_0811091E:
	ldr r2, _08110988 @ =0x02000000
	movs r1, 0x88
	lsls r1, 1
	adds r0, r2, r1
	movs r1, 0
	strh r1, [r0]
	movs r3, 0x89
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	movs r6, 0
	ldr r1, _0811098C @ =gUnknown_083F856C
_08110936:
	lsls r0, r6, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r7
	bne _08110942
	b _08110A8C
_08110942:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0
	beq _08110936
	movs r6, 0
	ldr r4, _08110990 @ =gUnknown_083F856E
	ldrh r0, [r4]
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _081109D0
	mov r8, r4
	adds r5, r4, 0x4
	mov r9, r1
_08110960:
	lsls r0, r6, 1
	adds r1, r0, r6
	lsls r2, r1, 1
	mov r3, r8
	adds r1, r2, r3
	adds r3, r0, 0
	ldrh r1, [r1]
	cmp r7, r1
	bne _081109BA
	adds r0, r4, 0x2
	adds r0, r2, r0
	ldrh r0, [r0]
	cmp r0, 0x18
	beq _081109A6
	cmp r0, 0x18
	bgt _08110994
	cmp r0, 0
	beq _0811099A
	b _081109BA
	.align 2, 0
	.ifdef SAPPHIRE
_sub_8110908_Latias: .4byte 407
	.endif
_08110988: .4byte 0x02000000
_0811098C: .4byte gUnknown_083F856C
_08110990: .4byte gUnknown_083F856E
_08110994:
	cmp r0, 0x1A
	beq _081109A6
	b _081109BA
_0811099A:
	adds r0, r2, r5
	ldrh r1, [r0]
	movs r0, 0
	bl SetAreaHasMon
	b _081109BA
_081109A6:
	adds r1, r3, r6
	lsls r1, 1
	mov r0, r8
	adds r0, 0x2
	adds r0, r1, r0
	ldrh r0, [r0]
	adds r1, r5
	ldrh r1, [r1]
	bl SetSpecialMapHasMon
_081109BA:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r4, _08110A00 @ =gUnknown_083F856E
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 1
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, r9
	bne _08110960
_081109D0:
	movs r6, 0
	ldr r1, _08110A04 @ =gWildMonHeaders
	ldrb r0, [r1]
	cmp r0, 0xFF
	beq _08110A8C
_081109DA:
	lsls r4, r6, 2
	adds r0, r4, r6
	lsls r0, 2
	adds r5, r0, r1
	adds r0, r5, 0
	adds r1, r7, 0
	bl MapHasMon
	lsls r0, 24
	cmp r0, 0
	beq _08110A28
	ldrb r0, [r5]
	cmp r0, 0x18
	beq _08110A18
	cmp r0, 0x18
	bgt _08110A08
	cmp r0, 0
	beq _08110A0E
	b _08110A28
	.align 2, 0
_08110A00: .4byte gUnknown_083F856E
_08110A04: .4byte gWildMonHeaders
_08110A08:
	cmp r0, 0x1A
	beq _08110A18
	b _08110A28
_08110A0E:
	ldrb r1, [r5, 0x1]
	movs r0, 0
	bl SetAreaHasMon
	b _08110A28
_08110A18:
	ldr r0, _08110A40 @ =gWildMonHeaders
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	bl SetSpecialMapHasMon
_08110A28:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, _08110A40 @ =gWildMonHeaders
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _081109DA
	b _08110A8C
	.align 2, 0
_08110A40: .4byte gWildMonHeaders
_08110A44:
	ldr r4, _08110A7C @ =0x02000000
	movs r0, 0x89
	lsls r0, 1
	adds r1, r4, r0
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08110A80 @ =gSaveBlock1 + 0x3144
	ldrb r2, [r0, 0x13]
	cmp r2, 0
	beq _08110A84
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r4, 0
	adds r1, 0x11
	bl GetRoamerLocation
	ldrb r0, [r4, 0x10]
	ldrb r1, [r4, 0x11]
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x14]
	strh r0, [r4, 0x12]
	movs r3, 0x88
	lsls r3, 1
	adds r1, r4, r3
	movs r0, 0x1
	strh r0, [r1]
	b _08110A8C
	.align 2, 0
_08110A7C: .4byte 0x02000000
_08110A80: .4byte gSaveBlock1 + 0x3144
_08110A84:
	movs r1, 0x88
	lsls r1, 1
	adds r0, r4, r1
	strh r2, [r0]
_08110A8C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end FindMapsWithMon

	thumb_func_start SetAreaHasMon
SetAreaHasMon: @ 8110A98
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r5, _08110AE0 @ =0x02000000
	movs r0, 0x88
	lsls r0, 1
	adds r4, r5, r0
	ldrh r0, [r4]
	cmp r0, 0x3F
	bhi _08110AD8
	lsls r0, 2
	adds r0, r5
	strb r2, [r0, 0x10]
	ldrh r0, [r4]
	lsls r0, 2
	adds r0, r5
	strb r1, [r0, 0x11]
	adds r0, r2, 0
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x14]
	bl sub_80FBA04
	ldrh r1, [r4]
	lsls r1, 2
	adds r1, r5
	strh r0, [r1, 0x12]
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_08110AD8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08110AE0: .4byte 0x02000000
	thumb_func_end SetAreaHasMon

	thumb_func_start SetSpecialMapHasMon
SetSpecialMapHasMon: @ 8110AE4
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08110B9C @ =0x02000000
	movs r3, 0x89
	lsls r3, 1
	adds r0, r3
	ldrh r0, [r0]
	cmp r0, 0x1F
	bhi _08110B96
	adds r0, r2, 0
	bl get_mapheader_by_bank_and_number
	adds r6, r0, 0
	ldrb r0, [r6, 0x14]
	cmp r0, 0x57
	bhi _08110B96
	movs r4, 0
	ldr r1, _08110BA0 @ =gUnknown_083F857A
	ldrh r0, [r1]
	cmp r0, 0x58
	beq _08110B42
	adds r5, r1, 0
_08110B16:
	lsls r2, r4, 2
	adds r1, r2, r5
	ldrb r0, [r6, 0x14]
	ldrh r1, [r1]
	cmp r0, r1
	bne _08110B32
	adds r0, r5, 0x2
	adds r0, r2, r0
	ldrh r0, [r0]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08110B96
_08110B32:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r4, 2
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, 0x58
	bne _08110B16
_08110B42:
	movs r4, 0
	ldr r0, _08110B9C @ =0x02000000
	movs r1, 0x89
	lsls r1, 1
	adds r2, r0, r1
	ldrh r3, [r2]
	adds r1, r0, 0
	cmp r4, r3
	bcs _08110B76
	movs r0, 0xC4
	lsls r0, 3
	adds r5, r1, r0
	ldrh r0, [r5]
	ldrb r2, [r6, 0x14]
	cmp r0, r2
	beq _08110B76
_08110B62:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r3
	bcs _08110B76
	lsls r0, r4, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, r2
	bne _08110B62
_08110B76:
	movs r3, 0x89
	lsls r3, 1
	adds r2, r1, r3
	ldrh r0, [r2]
	cmp r4, r0
	bne _08110B96
	lsls r0, r4, 1
	movs r3, 0xC4
	lsls r3, 3
	adds r1, r3
	adds r0, r1
	ldrb r1, [r6, 0x14]
	strh r1, [r0]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
_08110B96:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08110B9C: .4byte 0x02000000
_08110BA0: .4byte gUnknown_083F857A
	thumb_func_end SetSpecialMapHasMon

	thumb_func_start MapHasMon
MapHasMon: @ 8110BA4
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r6, r4, 0
	ldr r0, [r5, 0x4]
	adds r1, r4, 0
	movs r2, 0xC
	bl MonListHasMon
	lsls r0, 24
	cmp r0, 0
	bne _08110BF2
	ldr r0, [r5, 0x8]
	adds r1, r4, 0
	movs r2, 0x5
	bl MonListHasMon
	lsls r0, 24
	cmp r0, 0
	bne _08110BF2
	ldr r0, [r5, 0x10]
	adds r1, r4, 0
	movs r2, 0xC
	bl MonListHasMon
	lsls r0, 24
	cmp r0, 0
	bne _08110BF2
	ldr r0, [r5, 0xC]
	adds r1, r6, 0
	movs r2, 0x5
	bl MonListHasMon
	lsls r0, 24
	cmp r0, 0
	bne _08110BF2
	movs r0, 0
	b _08110BF4
_08110BF2:
	movs r0, 0x1
_08110BF4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end MapHasMon

	thumb_func_start MonListHasMon
MonListHasMon: @ 8110BFC
	push {r4,lr}
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	cmp r0, 0
	beq _08110C2A
	movs r3, 0
	cmp r3, r2
	bcs _08110C2A
	ldr r1, [r0, 0x4]
_08110C12:
	lsls r0, r3, 2
	adds r0, r1
	ldrh r0, [r0, 0x2]
	cmp r0, r4
	bne _08110C20
	movs r0, 0x1
	b _08110C2C
_08110C20:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r2
	bcc _08110C12
_08110C2A:
	movs r0, 0
_08110C2C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MonListHasMon

	thumb_func_start BuildAreaGlowTilemap
BuildAreaGlowTilemap: @ 8110C34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r1, _08110E5C @ =gUnknown_02039260
	movs r0, 0
	strh r0, [r1]
	mov r9, r1
	ldr r0, _08110E60 @ =0x02000000
	mov r8, r0
	ldr r1, _08110E64 @ =gUnknown_02039262
	mov r12, r1
	mov r1, r9
	movs r4, 0x8B
	lsls r4, 1
	add r4, r8
	ldr r3, _08110E68 @ =0x0000027f
	movs r2, 0
_08110C5C:
	ldrh r0, [r1]
	lsls r0, 1
	adds r0, r4
	strh r2, [r0]
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r3
	bls _08110C5C
	movs r0, 0
	mov r3, r9
	strh r0, [r3]
	movs r1, 0x88
	lsls r1, 1
	add r1, r8
	ldrh r0, [r1]
	cmp r0, 0
	beq _08110D04
	ldr r4, _08110E6C @ =gUnknown_02039266
	movs r2, 0
	ldr r5, _08110E64 @ =gUnknown_02039262
	mov r0, r8
	str r0, [sp, 0x8]
	movs r1, 0x8B
	lsls r1, 1
	add r1, r8
	mov r10, r1
	ldr r6, _08110E70 @ =gUnknown_02039264
	mov r7, r9
_08110C9A:
	strh r2, [r4]
	ldr r3, _08110E70 @ =gUnknown_02039264
	strh r2, [r3]
_08110CA0:
	mov r0, r12
	strh r2, [r0]
_08110CA4:
	ldrh r0, [r5]
	ldrh r1, [r6]
	str r2, [sp]
	bl GetRegionMapSectionAt_
	ldrh r1, [r7]
	lsls r1, 2
	ldr r3, [sp, 0x8]
	adds r1, r3
	lsls r0, 16
	lsrs r0, 16
	ldr r2, [sp]
	ldrh r1, [r1, 0x12]
	cmp r0, r1
	bne _08110CCC
	ldrh r0, [r4]
	lsls r0, 1
	add r0, r10
	ldr r1, _08110E74 @ =0x0000ffff
	strh r1, [r0]
_08110CCC:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1F
	bls _08110CA4
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08110E64 @ =gUnknown_02039262
	mov r12, r1
	cmp r0, 0x13
	bls _08110CA0
	ldrh r0, [r7]
	adds r0, 0x1
	strh r0, [r7]
	lsls r0, 16
	lsrs r0, 16
	ldr r3, _08110E78 @ =0x02000110
	ldrh r3, [r3]
	cmp r0, r3
	bcc _08110C9A
_08110D04:
	movs r0, 0
	ldr r1, _08110E6C @ =gUnknown_02039266
	strh r0, [r1]
	ldr r3, _08110E70 @ =gUnknown_02039264
	strh r0, [r3]
	ldr r6, _08110E64 @ =gUnknown_02039262
	mov r10, r0
	adds r3, r1, 0
	ldr r5, _08110E7C @ =0x02000116
	ldr r4, _08110E74 @ =0x0000ffff
	ldr r7, _08110E70 @ =gUnknown_02039264
_08110D1A:
	mov r0, r10
	strh r0, [r6]
_08110D1E:
	ldrh r1, [r3]
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, r4
	bne _08110E10
	ldrh r0, [r6]
	cmp r0, 0
	beq _08110D42
	subs r0, r1, 0x1
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08110D42
	movs r0, 0x2
	orrs r0, r1
	strh r0, [r2]
_08110D42:
	ldrh r0, [r6]
	cmp r0, 0x1F
	beq _08110D5C
	ldrh r0, [r3]
	adds r0, 0x1
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08110D5C
	movs r0, 0x1
	orrs r0, r1
	strh r0, [r2]
_08110D5C:
	ldrh r0, [r7]
	cmp r0, 0
	beq _08110D76
	ldrh r0, [r3]
	subs r0, 0x20
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08110D76
	movs r0, 0x8
	orrs r0, r1
	strh r0, [r2]
_08110D76:
	ldrh r0, [r7]
	cmp r0, 0x13
	beq _08110D90
	ldrh r0, [r3]
	adds r0, 0x20
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08110D90
	movs r0, 0x4
	orrs r0, r1
	strh r0, [r2]
_08110D90:
	ldrh r0, [r6]
	cmp r0, 0
	beq _08110DB0
	ldrh r0, [r7]
	cmp r0, 0
	beq _08110DB0
	ldrh r0, [r3]
	subs r0, 0x21
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08110DB0
	movs r0, 0x10
	orrs r0, r1
	strh r0, [r2]
_08110DB0:
	ldrh r0, [r6]
	cmp r0, 0x1F
	beq _08110DD0
	ldrh r0, [r7]
	cmp r0, 0
	beq _08110DD0
	ldrh r0, [r3]
	subs r0, 0x1F
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08110DD0
	movs r0, 0x40
	orrs r0, r1
	strh r0, [r2]
_08110DD0:
	ldrh r0, [r6]
	cmp r0, 0
	beq _08110DF0
	ldrh r0, [r7]
	cmp r0, 0x13
	beq _08110DF0
	ldrh r0, [r3]
	adds r0, 0x1F
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08110DF0
	movs r0, 0x20
	orrs r0, r1
	strh r0, [r2]
_08110DF0:
	ldrh r0, [r6]
	cmp r0, 0x1F
	beq _08110E10
	ldrh r0, [r7]
	cmp r0, 0x13
	beq _08110E10
	ldrh r0, [r3]
	adds r0, 0x21
	lsls r0, 1
	adds r2, r0, r5
	ldrh r1, [r2]
	cmp r1, r4
	beq _08110E10
	movs r0, 0x80
	orrs r0, r1
	strh r0, [r2]
_08110E10:
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1F
	bhi _08110E26
	b _08110D1E
_08110E26:
	ldrh r0, [r7]
	adds r0, 0x1
	strh r0, [r7]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x13
	bhi _08110E36
	b _08110D1A
_08110E36:
	movs r0, 0
	mov r1, r9
	strh r0, [r1]
_08110E3C:
	mov r3, r9
	ldrh r0, [r3]
	lsls r0, 1
	movs r4, 0x8B
	lsls r4, 1
	add r4, r8
	adds r3, r0, r4
	ldrh r2, [r3]
	adds r1, r2, 0
	ldr r0, _08110E74 @ =0x0000ffff
	cmp r1, r0
	bne _08110E80
	movs r0, 0x10
	strh r0, [r3]
	b _0811105E
	.align 2, 0
_08110E5C: .4byte gUnknown_02039260
_08110E60: .4byte 0x02000000
_08110E64: .4byte gUnknown_02039262
_08110E68: .4byte 0x0000027f
_08110E6C: .4byte gUnknown_02039266
_08110E70: .4byte gUnknown_02039264
_08110E74: .4byte 0x0000ffff
_08110E78: .4byte 0x02000110
_08110E7C: .4byte 0x02000116
_08110E80:
	cmp r1, 0
	bne _08110E86
	b _0811105E
_08110E86:
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _08110E94
	ldr r0, _08110F28 @ =0x0000ffcf
	ands r0, r2
	strh r0, [r3]
_08110E94:
	mov r1, r9
	ldrh r0, [r1]
	lsls r0, 1
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08110EAC
	ldr r0, _08110F2C @ =0x0000ff3f
	ands r0, r1
	strh r0, [r2]
_08110EAC:
	mov r3, r9
	ldrh r0, [r3]
	lsls r0, 1
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08110EC4
	ldr r0, _08110F30 @ =0x0000ffaf
	ands r0, r1
	strh r0, [r2]
_08110EC4:
	mov r1, r9
	ldrh r0, [r1]
	lsls r0, 1
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08110EDC
	ldr r0, _08110F34 @ =0x0000ff5f
	ands r0, r1
	strh r0, [r2]
_08110EDC:
	ldr r6, _08110F38 @ =gUnknown_02039268
	mov r3, r9
	ldrh r0, [r3]
	lsls r0, 1
	adds r0, r4
	ldrh r1, [r0]
	movs r5, 0xF
	adds r0, r5, 0
	ands r0, r1
	strh r0, [r6]
	ldr r2, _08110F3C @ =gUnknown_0203926A
	ldrh r0, [r3]
	lsls r0, 1
	adds r0, r4
	ldrh r1, [r0]
	movs r0, 0xF0
	ands r0, r1
	strh r0, [r2]
	ldrh r1, [r3]
	adds r3, r2, 0
	cmp r0, 0
	bne _08110F0A
	b _0811105E
_08110F0A:
	lsls r0, r1, 1
	adds r0, r4
	ldrh r2, [r0]
	adds r1, r5, 0
	ands r1, r2
	strh r1, [r0]
	ldrh r0, [r6]
	cmp r0, 0xA
	bls _08110F1E
	b _0811105E
_08110F1E:
	lsls r0, 2
	ldr r1, _08110F40 @ =_08110F44
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08110F28: .4byte 0x0000ffcf
_08110F2C: .4byte 0x0000ff3f
_08110F30: .4byte 0x0000ffaf
_08110F34: .4byte 0x0000ff5f
_08110F38: .4byte gUnknown_02039268
_08110F3C: .4byte gUnknown_0203926A
_08110F40: .4byte _08110F44
	.align 2, 0
_08110F44:
	.4byte _08110F70
	.4byte _08110FAC
	.4byte _08110F8E
	.4byte _0811105E
	.4byte _08111002
	.4byte _08111036
	.4byte _08111036
	.4byte _0811105E
	.4byte _08110FCE
	.4byte _0811104A
	.4byte _0811104A
_08110F70:
	ldrh r0, [r3]
	lsls r1, r0, 16
	cmp r1, 0
	beq _0811105E
	mov r0, r9
	ldrh r2, [r0]
	lsls r2, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x10
	lsrs r1, 20
	b _08110FC8
_08110F8E:
	ldrh r0, [r3]
	lsls r1, r0, 16
	cmp r1, 0
	beq _0811105E
	mov r3, r9
	ldrh r2, [r3]
	lsls r2, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x1E
	lsrs r1, 20
	b _08110FC8
_08110FAC:
	ldrh r0, [r3]
	lsls r1, r0, 16
	cmp r1, 0
	beq _0811105E
	mov r0, r9
	ldrh r2, [r0]
	lsls r2, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r2, r0
	ldrh r0, [r2]
	adds r0, 0x20
	lsrs r1, 22
_08110FC8:
	adds r0, r1
	strh r0, [r2]
	b _0811105E
_08110FCE:
	ldrh r2, [r3]
	cmp r2, 0
	beq _0811105E
	movs r0, 0x80
	ands r0, r2
	lsls r0, 16
	lsrs r0, 16
	negs r0, r0
	lsrs r3, r0, 31
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _08110FEC
	movs r0, 0x2
	orrs r3, r0
_08110FEC:
	mov r0, r9
	ldrh r1, [r0]
	lsls r1, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x20
	adds r0, r3
	b _0811105C
_08111002:
	ldrh r2, [r3]
	cmp r2, 0
	beq _0811105E
	movs r0, 0x40
	ands r0, r2
	lsls r0, 16
	lsrs r0, 16
	negs r0, r0
	lsrs r3, r0, 31
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _08111020
	movs r0, 0x2
	orrs r3, r0
_08111020:
	mov r0, r9
	ldrh r1, [r0]
	lsls r1, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x21
	adds r0, r3
	b _0811105C
_08111036:
	mov r3, r9
	ldrh r1, [r3]
	lsls r1, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x27
	b _0811105C
_0811104A:
	mov r0, r9
	ldrh r1, [r0]
	lsls r1, 1
	movs r0, 0x8B
	lsls r0, 1
	add r0, r8
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x25
_0811105C:
	strh r0, [r1]
_0811105E:
	mov r3, r9
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
	lsls r0, 16
	ldr r1, _08111080 @ =0x027f0000
	cmp r0, r1
	bhi _08111070
	b _08110E3C
_08111070:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08111080: .4byte 0x027f0000
	thumb_func_end BuildAreaGlowTilemap

	thumb_func_start sub_8111084
sub_8111084: @ 8111084
	push {lr}
	ldr r0, _081110AC @ =0x02000000
	movs r2, 0x89
	lsls r2, 1
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r2, r0, 0
	cmp r1, 0
	beq _081110B4
	movs r3, 0x88
	lsls r3, 1
	adds r0, r2, r3
	ldrh r0, [r0]
	cmp r0, 0
	bne _081110B4
	ldr r0, _081110B0 @ =0x0000061e
	adds r1, r2, r0
	movs r0, 0x1
	b _081110BA
	.align 2, 0
_081110AC: .4byte 0x02000000
_081110B0: .4byte 0x0000061e
_081110B4:
	ldr r3, _081110FC @ =0x0000061e
	adds r1, r2, r3
	movs r0, 0
_081110BA:
	strb r0, [r1]
	ldr r1, _08111100 @ =0x00000616
	adds r0, r2, r1
	movs r1, 0
	strh r1, [r0]
	movs r3, 0xC3
	lsls r3, 3
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	ldr r0, _08111104 @ =0x0000061c
	adds r1, r2, r0
	movs r0, 0x40
	strh r0, [r1]
	adds r3, 0x5
	adds r1, r2, r3
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _08111108 @ =REG_BLDCNT
	ldr r2, _0811110C @ =0x00003f41
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0x80
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	bl sub_8111110
	pop {r0}
	bx r0
	.align 2, 0
_081110FC: .4byte 0x0000061e
_08111100: .4byte 0x00000616
_08111104: .4byte 0x0000061c
_08111108: .4byte REG_BLDCNT
_0811110C: .4byte 0x00003f41
	thumb_func_end sub_8111084

	thumb_func_start sub_8111110
sub_8111110: @ 8111110
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _0811114C @ =0x02000000
	ldr r2, _08111150 @ =0x0000061e
	adds r1, r0, r2
	ldrb r1, [r1]
	adds r5, r0, 0
	cmp r1, 0
	bne _081111DE
	ldr r3, _08111154 @ =0x00000616
	adds r1, r5, r3
	ldrh r0, [r1]
	cmp r0, 0
	bne _081111D8
	movs r1, 0xC3
	lsls r1, 3
	adds r0, r5, r1
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08111158
	subs r2, 0x4
	adds r0, r5, r2
	b _0811115C
	.align 2, 0
_0811114C: .4byte 0x02000000
_08111150: .4byte 0x0000061e
_08111154: .4byte 0x00000616
_08111158:
	ldr r3, _081111C0 @ =0x0000061c
	adds r0, r5, r3
_0811115C:
	ldrh r1, [r0]
	adds r1, 0x4
	movs r2, 0x7F
	ands r1, r2
	strh r1, [r0]
	ldr r2, _081111C4 @ =gSineTable
	ldr r1, _081111C8 @ =0x0000061a
	adds r0, r5, r1
	ldrh r0, [r0]
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	lsls r1, 16
	asrs r1, 20
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _081111C0 @ =0x0000061c
	adds r0, r5, r3
	ldrh r0, [r0]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 20
	lsls r0, 16
	ldr r2, _081111CC @ =REG_BLDALPHA
	lsrs r0, 8
	orrs r1, r0
	strh r1, [r2]
	ldr r1, _081111D0 @ =0x00000616
	adds r0, r5, r1
	movs r2, 0
	strh r2, [r0]
	subs r3, 0x4
	adds r1, r5, r3
	ldrh r0, [r1]
	cmp r0, 0x40
	bne _0811126E
	strh r2, [r1]
	movs r1, 0x89
	lsls r1, 1
	adds r0, r5, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _0811126E
	ldr r2, _081111D4 @ =0x0000061e
	adds r1, r5, r2
	movs r0, 0x1
	b _0811126C
	.align 2, 0
_081111C0: .4byte 0x0000061c
_081111C4: .4byte gSineTable
_081111C8: .4byte 0x0000061a
_081111CC: .4byte REG_BLDALPHA
_081111D0: .4byte 0x00000616
_081111D4: .4byte 0x0000061e
_081111D8:
	subs r0, 0x1
	strh r0, [r1]
	b _0811126E
_081111DE:
	ldr r3, _0811127C @ =0x00000616
	adds r1, r5, r3
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xC
	bls _0811126E
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08111280 @ =0x0000061f
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r4, 0
	movs r2, 0x89
	lsls r2, 1
	adds r0, r5, r2
	ldrh r3, [r0]
	cmp r4, r3
	bcs _0811124C
	movs r2, 0xCC
	lsls r2, 3
	adds r2, r5
	mov r9, r2
	mov r8, r1
	movs r3, 0x1
	mov r12, r3
	adds r6, r0, 0
	movs r7, 0x5
	negs r7, r7
_08111220:
	lsls r0, r4, 2
	add r0, r9
	ldr r3, [r0]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x1
	adds r3, 0x3E
	ands r1, r0
	mov r2, r12
	ands r1, r2
	lsls r1, 2
	ldrb r2, [r3]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldrh r3, [r6]
	cmp r4, r3
	bcc _08111220
_0811124C:
	ldr r0, _08111280 @ =0x0000061f
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, 0x4
	bls _0811126E
	movs r0, 0x1
	strb r0, [r1]
	movs r1, 0x88
	lsls r1, 1
	adds r0, r5, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _0811126E
	ldr r2, _08111284 @ =0x0000061e
	adds r1, r5, r2
	movs r0, 0
_0811126C:
	strb r0, [r1]
_0811126E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811127C: .4byte 0x00000616
_08111280: .4byte 0x0000061f
_08111284: .4byte 0x0000061e
	thumb_func_end sub_8111110

	thumb_func_start sub_8111288
sub_8111288: @ 8111288
	push {lr}
	ldr r1, _08111298 @ =0x02000000
	ldrh r0, [r1, 0xC]
	cmp r0, 0
	beq _0811129C
	cmp r0, 0x1
	beq _081112A2
	b _081112B2
	.align 2, 0
_08111298: .4byte 0x02000000
_0811129C:
	movs r0, 0x1
	strh r0, [r1, 0xC]
	b _081112B2
_081112A2:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _081112B2
	ldr r0, _081112B8 @ =sub_81112BC
	bl sub_8110814
_081112B2:
	pop {r0}
	bx r0
	.align 2, 0
_081112B8: .4byte sub_81112BC
	thumb_func_end sub_8111288

	thumb_func_start sub_81112BC
sub_81112BC: @ 81112BC
	push {lr}
	ldr r0, _081112DC @ =0x02000000
	ldrh r0, [r0, 0xC]
	cmp r0, 0
	bne _08111308
	ldr r0, _081112E0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081112E8
	ldr r0, _081112E4 @ =sub_8111314
	bl sub_8110814
	b _08111308
	.align 2, 0
_081112DC: .4byte 0x02000000
_081112E0: .4byte gMain
_081112E4: .4byte sub_8111314
_081112E8:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08111302
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08111308
	ldr r0, _0811130C @ =gSaveBlock2
	ldrb r0, [r0, 0x13]
	cmp r0, 0x1
	bne _08111308
_08111302:
	ldr r0, _08111310 @ =sub_8111360
	bl sub_8110814
_08111308:
	pop {r0}
	bx r0
	.align 2, 0
_0811130C: .4byte gSaveBlock2
_08111310: .4byte sub_8111360
	thumb_func_end sub_81112BC

	thumb_func_start sub_8111314
sub_8111314: @ 8111314
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08111328 @ =0x02000000
	ldrh r1, [r4, 0xC]
	cmp r1, 0
	beq _0811132C
	cmp r1, 0x1
	beq _08111344
	b _08111358
	.align 2, 0
_08111328: .4byte 0x02000000
_0811132C:
	movs r0, 0x15
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _08111358
_08111344:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _08111358
	bl sub_80FAB10
	ldr r0, [r4, 0x4]
	bl SetMainCallback2
_08111358:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8111314

	thumb_func_start sub_8111360
sub_8111360: @ 8111360
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08111374 @ =0x02000000
	ldrh r1, [r4, 0xC]
	cmp r1, 0
	beq _08111378
	cmp r1, 0x1
	beq _08111390
	b _081113A4
	.align 2, 0
_08111374: .4byte 0x02000000
_08111378:
	movs r0, 0x15
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _081113A4
_08111390:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _081113A4
	bl sub_80FAB10
	ldr r0, [r4, 0x8]
	bl SetMainCallback2
_081113A4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8111360

	thumb_func_start ShowPokedexAreaScreen
ShowPokedexAreaScreen: @ 81113AC
	push {r4,lr}
	ldr r2, _081113DC @ =0x02000000
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
_081113DC: .4byte 0x02000000
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
	ldr r4, _081114B4 @ =0x020006e8
	adds r0, r4, 0
	movs r1, 0
	bl sub_80FA8EC
	movs r0, 0x88
	lsls r0, 4
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x10
	bl StringFill
	b _08111540
	.align 2, 0
_081114B4: .4byte 0x020006e8
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
	bl sub_80FBCF0
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
	ldr r0, _08111634 @ =0x02000000
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
_08111634: .4byte 0x02000000
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
	ldr r0, _08111728 @ =0x02000000
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
	ldr r0, _08111728 @ =0x02000000
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
_08111728: .4byte 0x02000000
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
	ldr r1, _081117A4 @ =0x02000000
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
	ldr r5, _081117A8 @ =0x02000fa8
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
_081117A4: .4byte 0x02000000
_081117A8: .4byte 0x02000fa8
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
	ldr r1, _081117DC @ =0x02000fb4
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
_081117DC: .4byte 0x02000fb4
_081117E0: .4byte gUnknown_083F865C
	thumb_func_end LoadAreaUnknownGraphics

	thumb_func_start CreateAreaUnknownSprites
CreateAreaUnknownSprites: @ 81117E4
	push {r4-r7,lr}
	ldr r1, _08111810 @ =0x02000000
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
_08111810: .4byte 0x02000000
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
