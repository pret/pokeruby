	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start SetUpFieldMove_Flash
SetUpFieldMove_Flash: @ 810CBB4
	push {lr}
	ldr r0, _0810CBDC @ =gMapHeader
	ldrb r0, [r0, 0x15]
	cmp r0, 0x1
	bne _0810CBF4
	ldr r0, _0810CBE0 @ =0x00000828
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0810CBF4
	ldr r1, _0810CBE4 @ =gFieldCallback
	ldr r0, _0810CBE8 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0810CBEC @ =gUnknown_03005CE4
	ldr r0, _0810CBF0 @ =sub_810CBFC
	str r0, [r1]
	movs r0, 0x1
	b _0810CBF6
	.align 2, 0
_0810CBDC: .4byte gMapHeader
_0810CBE0: .4byte 0x00000828
_0810CBE4: .4byte gFieldCallback
_0810CBE8: .4byte sub_808AB90
_0810CBEC: .4byte gUnknown_03005CE4
_0810CBF0: .4byte sub_810CBFC
_0810CBF4:
	movs r0, 0
_0810CBF6:
	pop {r1}
	bx r1
	thumb_func_end SetUpFieldMove_Flash

	thumb_func_start sub_810CBFC
sub_810CBFC: @ 810CBFC
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810CC24 @ =gUnknown_0202FF84
	ldr r1, _0810CC28 @ =gLastFieldPokeMenuOpened
	ldrb r1, [r1]
	str r1, [r2]
	ldr r2, _0810CC2C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0810CC30 @ =sub_810CC34
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	pop {r0}
	bx r0
	.align 2, 0
_0810CC24: .4byte gUnknown_0202FF84
_0810CC28: .4byte gLastFieldPokeMenuOpened
_0810CC2C: .4byte gTasks
_0810CC30: .4byte sub_810CC34
	thumb_func_end sub_810CBFC

	thumb_func_start sub_810CC34
sub_810CC34: @ 810CC34
	push {lr}
	movs r0, 0xCF
	bl PlaySE
	ldr r0, _0810CC4C @ =0x00000828
	bl FlagSet
	ldr r0, _0810CC50 @ =gUnknown_081B694A
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_0810CC4C: .4byte 0x00000828
_0810CC50: .4byte gUnknown_081B694A
	thumb_func_end sub_810CC34

	thumb_func_start sub_810CC54
sub_810CC54: @ 810CC54
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_810CC54

	thumb_func_start sub_810CC6C
sub_810CC6C: @ 810CC6C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_810CC6C

	thumb_func_start sub_810CC80
sub_810CC80: @ 810CC80
	push {r4,lr}
	sub sp, 0x8
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
	mov r0, sp
	strh r1, [r0]
	ldr r1, _0810CD34 @ =0x040000d4
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0810CD38 @ =0x8100c000
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r4, 0
	str r4, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0810CD3C @ =0x85000100
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, sp
	strh r4, [r0]
	str r0, [r1]
	ldr r0, _0810CD40 @ =0x05000002
	str r0, [r1, 0x4]
	ldr r0, _0810CD44 @ =0x810001ff
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	bl ResetTasks
	bl ResetSpriteData
	ldr r3, _0810CD48 @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _0810CD4C @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r0, _0810CD50 @ =sub_810CC6C
	bl SetVBlankCallback
	ldr r0, _0810CD54 @ =sub_810CC54
	bl SetMainCallback2
	bl sub_810CD5C
	lsls r0, 24
	cmp r0, 0
	bne _0810CD2A
	ldr r0, _0810CD58 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_0810CD2A:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810CD34: .4byte 0x040000d4
_0810CD38: .4byte 0x8100c000
_0810CD3C: .4byte 0x85000100
_0810CD40: .4byte 0x05000002
_0810CD44: .4byte 0x810001ff
_0810CD48: .4byte 0x04000208
_0810CD4C: .4byte 0x04000200
_0810CD50: .4byte sub_810CC6C
_0810CD54: .4byte sub_810CC54
_0810CD58: .4byte gMain
	thumb_func_end sub_810CC80

	thumb_func_start sub_810CD5C
sub_810CD5C: @ 810CD5C
	push {r4-r7,lr}
	bl get_map_light_from_warp0
	lsls r0, 24
	lsrs r6, r0, 24
	bl sav1_map_get_light_level
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0
	ldr r4, _0810CD9C @ =gUnknown_083F7FC4
	ldrb r0, [r4]
	cmp r0, 0
	beq _0810CDB0
	adds r7, r4, 0
	adds r0, r4, 0x4
	mov r12, r0
_0810CD7E:
	lsls r2, r3, 3
	adds r1, r2, r7
	ldrb r0, [r1]
	cmp r0, r6
	bne _0810CDA0
	ldrb r0, [r1, 0x1]
	cmp r0, r5
	bne _0810CDA0
	mov r1, r12
	adds r0, r2, r1
	ldr r0, [r0]
	bl _call_via_r0
	movs r0, 0x1
	b _0810CDB2
	.align 2, 0
_0810CD9C: .4byte gUnknown_083F7FC4
_0810CDA0:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0810CD7E
_0810CDB0:
	movs r0, 0
_0810CDB2:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810CD5C

	thumb_func_start sub_810CDB8
sub_810CDB8: @ 810CDB8
	push {r4-r6,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r0, 24
	lsrs r4, r1, 24
	movs r3, 0
	ldr r1, _0810CDE4 @ =gUnknown_083F7FC4
	ldrb r0, [r1]
	cmp r0, 0
	beq _0810CDF8
	adds r6, r1, 0
_0810CDCE:
	lsls r0, r3, 3
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, r5
	bne _0810CDE8
	ldrb r0, [r2, 0x1]
	cmp r0, r4
	bne _0810CDE8
	ldrb r0, [r2, 0x2]
	b _0810CDFA
	.align 2, 0
_0810CDE4: .4byte gUnknown_083F7FC4
_0810CDE8:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0810CDCE
_0810CDF8:
	movs r0, 0
_0810CDFA:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_810CDB8

	thumb_func_start fade_type_for_given_maplight_pair
fade_type_for_given_maplight_pair: @ 810CE00
	push {r4-r6,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r0, 24
	lsrs r4, r1, 24
	movs r3, 0
	ldr r1, _0810CE2C @ =gUnknown_083F7FC4
	ldrb r0, [r1]
	cmp r0, 0
	beq _0810CE40
	adds r6, r1, 0
_0810CE16:
	lsls r0, r3, 3
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, r5
	bne _0810CE30
	ldrb r0, [r2, 0x1]
	cmp r0, r4
	bne _0810CE30
	ldrb r0, [r2, 0x3]
	b _0810CE42
	.align 2, 0
_0810CE2C: .4byte gUnknown_083F7FC4
_0810CE30:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0810CE16
_0810CE40:
	movs r0, 0
_0810CE42:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end fade_type_for_given_maplight_pair

	thumb_func_start sub_810CE48
sub_810CE48: @ 810CE48
	push {lr}
	ldr r0, _0810CE58 @ =sub_810CE5C
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0810CE58: .4byte sub_810CE5C
	thumb_func_end sub_810CE48

	thumb_func_start sub_810CE5C
sub_810CE5C: @ 810CE5C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810CE70 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0810CE74 @ =sub_810CE78
	str r0, [r1]
	bx lr
	.align 2, 0
_0810CE70: .4byte gTasks
_0810CE74: .4byte sub_810CE78
	thumb_func_end sub_810CE5C

	thumb_func_start sub_810CE78
sub_810CE78: @ 810CE78
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r6, 0x80
	lsls r6, 19
	movs r5, 0
	strh r5, [r6]
	ldr r0, _0810CEE8 @ =gCaveTransitionTiles
	ldr r1, _0810CEEC @ =0x0600c000
	bl LZ77UnCompVram
	ldr r0, _0810CEF0 @ =gCaveTransitionTilemap
	ldr r1, _0810CEF4 @ =0x0600f800
	bl LZ77UnCompVram
	ldr r0, _0810CEF8 @ =gCaveTransitionPalette_White
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0810CEFC @ =gUnknown_083F809C
	movs r1, 0xE0
	movs r2, 0x10
	bl LoadPalette
	ldr r1, _0810CF00 @ =REG_BLDCNT
	ldr r2, _0810CF04 @ =0x00003e41
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0810CF08 @ =REG_BLDALPHA
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	subs r1, 0x48
	ldr r2, _0810CF0C @ =0x00001f0c
	adds r0, r2, 0
	strh r0, [r1]
	movs r1, 0x8A
	lsls r1, 5
	adds r0, r1, 0
	strh r0, [r6]
	ldr r1, _0810CF10 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810CF14 @ =sub_810CF18
	str r1, [r0]
	movs r2, 0
	movs r1, 0x10
	strh r1, [r0, 0x8]
	strh r2, [r0, 0xA]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810CEE8: .4byte gCaveTransitionTiles
_0810CEEC: .4byte 0x0600c000
_0810CEF0: .4byte gCaveTransitionTilemap
_0810CEF4: .4byte 0x0600f800
_0810CEF8: .4byte gCaveTransitionPalette_White
_0810CEFC: .4byte gUnknown_083F809C
_0810CF00: .4byte REG_BLDCNT
_0810CF04: .4byte 0x00003e41
_0810CF08: .4byte REG_BLDALPHA
_0810CF0C: .4byte 0x00001f0c
_0810CF10: .4byte gTasks
_0810CF14: .4byte sub_810CF18
	thumb_func_end sub_810CE78

	thumb_func_start sub_810CF18
sub_810CF18: @ 810CF18
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810CF44 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r2, [r3, 0xA]
	movs r1, 0x80
	lsls r1, 5
	adds r0, r2, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0810CF48 @ =REG_BLDALPHA
	strh r0, [r1]
	cmp r2, 0x10
	bhi _0810CF4C
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	b _0810CF54
	.align 2, 0
_0810CF44: .4byte gTasks
_0810CF48: .4byte REG_BLDALPHA
_0810CF4C:
	movs r0, 0
	strh r0, [r3, 0xC]
	ldr r0, _0810CF58 @ =sub_810CF5C
	str r0, [r3]
_0810CF54:
	pop {r0}
	bx r0
	.align 2, 0
_0810CF58: .4byte sub_810CF5C
	thumb_func_end sub_810CF18

	thumb_func_start sub_810CF5C
sub_810CF5C: @ 810CF5C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810CF94 @ =REG_BLDALPHA
	ldr r3, _0810CF98 @ =0x00001010
	adds r1, r3, 0
	strh r1, [r2]
	ldr r2, _0810CF9C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r1, [r4, 0xC]
	cmp r1, 0x7
	bhi _0810CFA4
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
	lsls r1, 1
	ldr r0, _0810CFA0 @ =gUnknown_083F809C
	adds r0, r1, r0
	movs r2, 0x10
	subs r2, r1
	lsls r2, 16
	lsrs r2, 16
	movs r1, 0xE0
	bl LoadPalette
	b _0810CFB6
	.align 2, 0
_0810CF94: .4byte REG_BLDALPHA
_0810CF98: .4byte 0x00001010
_0810CF9C: .4byte gTasks
_0810CFA0: .4byte gUnknown_083F809C
_0810CFA4:
	ldr r0, _0810CFBC @ =gCaveTransitionPalette_White
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0810CFC0 @ =sub_810CFC4
	str r0, [r4]
	movs r0, 0x8
	strh r0, [r4, 0xC]
_0810CFB6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810CFBC: .4byte gCaveTransitionPalette_White
_0810CFC0: .4byte sub_810CFC4
	thumb_func_end sub_810CF5C

	thumb_func_start sub_810CFC4
sub_810CFC4: @ 810CFC4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810CFE4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0810CFE8
	subs r0, r2, 0x1
	strh r0, [r1, 0xC]
	b _0810CFF0
	.align 2, 0
_0810CFE4: .4byte gTasks
_0810CFE8:
	ldr r0, _0810CFF4 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_0810CFF0:
	pop {r0}
	bx r0
	.align 2, 0
_0810CFF4: .4byte gMain
	thumb_func_end sub_810CFC4

	thumb_func_start sub_810CFF8
sub_810CFF8: @ 810CFF8
	push {lr}
	ldr r0, _0810D008 @ =sub_810D00C
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0810D008: .4byte sub_810D00C
	thumb_func_end sub_810CFF8

	thumb_func_start sub_810D00C
sub_810D00C: @ 810D00C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810D020 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0810D024 @ =sub_810D028
	str r0, [r1]
	bx lr
	.align 2, 0
_0810D020: .4byte gTasks
_0810D024: .4byte sub_810D028
	thumb_func_end sub_810D00C

	thumb_func_start sub_810D028
sub_810D028: @ 810D028
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r6, 0x80
	lsls r6, 19
	movs r4, 0
	strh r4, [r6]
	ldr r0, _0810D098 @ =gCaveTransitionTiles
	ldr r1, _0810D09C @ =0x0600c000
	bl LZ77UnCompVram
	ldr r0, _0810D0A0 @ =gCaveTransitionTilemap
	ldr r1, _0810D0A4 @ =0x0600f800
	bl LZ77UnCompVram
	ldr r0, _0810D0A8 @ =REG_BLDCNT
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r1, _0810D0AC @ =REG_BG0CNT
	ldr r2, _0810D0B0 @ =0x00001f0c
	adds r0, r2, 0
	strh r0, [r1]
	movs r1, 0x8A
	lsls r1, 5
	adds r0, r1, 0
	strh r0, [r6]
	ldr r0, _0810D0B4 @ =gCaveTransitionPalette_White
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0810D0B8 @ =gCaveTransitionPalette_Black
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _0810D0BC @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810D0C0 @ =sub_810D0C4
	str r1, [r0]
	movs r2, 0
	movs r1, 0x10
	strh r1, [r0, 0x8]
	strh r2, [r0, 0xA]
	strh r2, [r0, 0xC]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810D098: .4byte gCaveTransitionTiles
_0810D09C: .4byte 0x0600c000
_0810D0A0: .4byte gCaveTransitionTilemap
_0810D0A4: .4byte 0x0600f800
_0810D0A8: .4byte REG_BLDCNT
_0810D0AC: .4byte REG_BG0CNT
_0810D0B0: .4byte 0x00001f0c
_0810D0B4: .4byte gCaveTransitionPalette_White
_0810D0B8: .4byte gCaveTransitionPalette_Black
_0810D0BC: .4byte gTasks
_0810D0C0: .4byte sub_810D0C4
	thumb_func_end sub_810D028

	thumb_func_start sub_810D0C4
sub_810D0C4: @ 810D0C4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810D0F8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r1, [r3, 0xC]
	cmp r1, 0xF
	bhi _0810D100
	adds r2, r1, 0x1
	adds r0, r2, 0x1
	strh r0, [r3, 0xC]
	movs r0, 0xF
	subs r0, r1
	lsls r0, 1
	ldr r1, _0810D0FC @ =gUnknown_083F808C
	adds r0, r1
	lsls r2, 17
	lsrs r2, 16
	movs r1, 0xE0
	bl LoadPalette
	b _0810D114
	.align 2, 0
_0810D0F8: .4byte gTasks
_0810D0FC: .4byte gUnknown_083F808C
_0810D100:
	ldr r1, _0810D118 @ =REG_BLDALPHA
	ldr r2, _0810D11C @ =0x00001010
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _0810D120 @ =0x00003e41
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0810D124 @ =sub_810D128
	str r0, [r3]
_0810D114:
	pop {r0}
	bx r0
	.align 2, 0
_0810D118: .4byte REG_BLDALPHA
_0810D11C: .4byte 0x00001010
_0810D120: .4byte 0x00003e41
_0810D124: .4byte sub_810D128
	thumb_func_end sub_810D0C4

	thumb_func_start sub_810D128
sub_810D128: @ 810D128
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810D158 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r0, [r3, 0xA]
	movs r1, 0x10
	subs r1, r0
	lsls r1, 16
	movs r2, 0x80
	lsls r2, 21
	adds r0, r1, r2
	lsrs r0, 16
	ldr r2, _0810D15C @ =REG_BLDALPHA
	strh r0, [r2]
	cmp r1, 0
	beq _0810D160
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	b _0810D172
	.align 2, 0
_0810D158: .4byte gTasks
_0810D15C: .4byte REG_BLDALPHA
_0810D160:
	ldr r0, _0810D178 @ =gCaveTransitionPalette_Black
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0810D17C @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_0810D172:
	pop {r0}
	bx r0
	.align 2, 0
_0810D178: .4byte gCaveTransitionPalette_Black
_0810D17C: .4byte gMain
	thumb_func_end sub_810D128
	
	.align 2, 0 @ Don't pad with nop.
