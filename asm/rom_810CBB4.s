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
	ldr r1, _0810CBE4 @ =gUnknown_0300485C
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
_0810CBE4: .4byte gUnknown_0300485C
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

	thumb_func_start sub_810D180
sub_810D180: @ 810D180
	push {r4-r7,lr}
	sub sp, 0x4
	bl HealPlayerParty
	ldr r4, _0810D1A0 @ =0x00000804
	adds r0, r4, 0
	bl FlagGet
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bne _0810D1A8
	ldr r0, _0810D1A4 @ =gUnknown_02039324
	strb r1, [r0]
	b _0810D1B4
	.align 2, 0
_0810D1A0: .4byte 0x00000804
_0810D1A4: .4byte gUnknown_02039324
_0810D1A8:
	ldr r1, _0810D1E8 @ =gUnknown_02039324
	movs r0, 0
	strb r0, [r1]
	adds r0, r4, 0
	bl FlagSet
_0810D1B4:
	movs r0, 0x1
	bl GetGameStat
	cmp r0, 0
	bne _0810D1D4
	ldr r2, _0810D1EC @ =gSaveBlock2
	ldrh r1, [r2, 0xE]
	lsls r1, 16
	ldrb r0, [r2, 0x10]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x11]
	orrs r1, r0
	movs r0, 0x1
	bl SetGameStat
_0810D1D4:
	bl SetSecretBase2Field_9
	ldr r0, _0810D1EC @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _0810D1F0
	movs r0, 0x1
	bl sub_80537CC
	b _0810D1F6
	.align 2, 0
_0810D1E8: .4byte gUnknown_02039324
_0810D1EC: .4byte gSaveBlock2
_0810D1F0:
	movs r0, 0x2
	bl sub_80537CC
_0810D1F6:
	movs r6, 0
	movs r5, 0
	mov r7, sp
_0810D1FC:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0810D260 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _0810D23A
	adds r0, r4, 0
	movs r1, 0x6
	bl GetMonData
	cmp r0, 0
	bne _0810D23A
	adds r0, r4, 0
	movs r1, 0x43
	bl GetMonData
	cmp r0, 0
	bne _0810D23A
	movs r0, 0x1
	strb r0, [r7]
	adds r0, r4, 0
	movs r1, 0x43
	mov r2, sp
	bl SetMonData
	movs r6, 0x1
_0810D23A:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0810D1FC
	cmp r6, 0x1
	bne _0810D250
	movs r0, 0x2A
	bl IncrementGameStat
	ldr r0, _0810D264 @ =0x0000083b
	bl FlagSet
_0810D250:
	ldr r0, _0810D268 @ =sub_8141F90
	bl SetMainCallback2
	movs r0, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810D260: .4byte gPlayerParty
_0810D264: .4byte 0x0000083b
_0810D268: .4byte sub_8141F90
	thumb_func_end sub_810D180

	thumb_func_start sp0C8_whiteout_maybe
sp0C8_whiteout_maybe: @ 810D26C
	push {lr}
	ldr r0, _0810D27C @ =CB2_WhiteOut
	bl SetMainCallback2
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0810D27C: .4byte CB2_WhiteOut
	thumb_func_end sp0C8_whiteout_maybe

	thumb_func_start sub_810D280
sub_810D280: @ 810D280
	push {r4,lr}
	ldr r0, _0810D2A4 @ =0x00004024
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0810D2A8 @ =0x00004025
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	orrs r4, r0
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0810D2A4: .4byte 0x00004024
_0810D2A8: .4byte 0x00004025
	thumb_func_end sub_810D280

	thumb_func_start sub_810D2AC
sub_810D2AC: @ 810D2AC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0810D2CC @ =0x00004024
	lsrs r1, r4, 16
	bl VarSet
	ldr r0, _0810D2D0 @ =0x00004025
	lsls r4, 16
	lsrs r4, 16
	adds r1, r4, 0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D2CC: .4byte 0x00004024
_0810D2D0: .4byte 0x00004025
	thumb_func_end sub_810D2AC

	thumb_func_start unref_sub_810D2D4
unref_sub_810D2D4: @ 810D2D4
	push {r4,lr}
	bl Random
	adds r4, r0, 0
	bl Random
	lsls r4, 16
	lsls r0, 16
	lsrs r0, 16
	orrs r4, r0
	adds r0, r4, 0
	bl sub_810D2AC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_810D2D4

	thumb_func_start sub_810D2F4
sub_810D2F4: @ 810D2F4
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl sub_810D280
	adds r1, r0, 0
	cmp r4, 0
	beq _0810D318
	ldr r3, _0810D324 @ =0x41c64e6d
	ldr r2, _0810D328 @ =0x00003039
_0810D308:
	adds r0, r1, 0
	muls r0, r3
	adds r1, r0, r2
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	bne _0810D308
_0810D318:
	adds r0, r1, 0
	bl sub_810D2AC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D324: .4byte 0x41c64e6d
_0810D328: .4byte 0x00003039
	thumb_func_end sub_810D2F4

	thumb_func_start sub_810D32C
sub_810D32C: @ 810D32C
	push {r4-r6,lr}
	bl sub_810D280
	lsrs r6, r0, 16
	movs r5, 0
_0810D336:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0810D360 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0810D368
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	ldr r1, _0810D364 @ =0x0000ffff
	ands r1, r0
	cmp r1, r6
	bne _0810D368
	movs r0, 0x1
	b _0810D370
	.align 2, 0
_0810D360: .4byte gPlayerParty
_0810D364: .4byte 0x0000ffff
_0810D368:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0810D336
	movs r0, 0
_0810D370:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_810D32C

	thumb_func_start UpdateShoalTideFlag
UpdateShoalTideFlag: @ 810D378
	push {lr}
	bl get_map_light_from_warp0
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	cmp r0, 0
	beq _0810D3BE
	bl RtcCalcLocalTime
	ldr r1, _0810D3AC @ =gUnknown_083F8340
	ldr r0, _0810D3B0 @ =gLocalTime
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0810D3B8
	ldr r0, _0810D3B4 @ =0x0000083a
	bl FlagSet
	b _0810D3BE
	.align 2, 0
_0810D3AC: .4byte gUnknown_083F8340
_0810D3B0: .4byte gLocalTime
_0810D3B4: .4byte 0x0000083a
_0810D3B8:
	ldr r0, _0810D3C4 @ =0x0000083a
	bl FlagReset
_0810D3BE:
	pop {r0}
	bx r0
	.align 2, 0
_0810D3C4: .4byte 0x0000083a
	thumb_func_end UpdateShoalTideFlag

	thumb_func_start sub_810D3C8
sub_810D3C8: @ 810D3C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807DDFC
	lsls r0, 24
	cmp r0, 0
	beq _0810D3E2
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_0810D3E2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_810D3C8

	thumb_func_start sub_810D3E8
sub_810D3E8: @ 810D3E8
	push {lr}
	ldr r0, _0810D3F8 @ =sub_810D3C8
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0810D3F8: .4byte sub_810D3C8
	thumb_func_end sub_810D3E8

	thumb_func_start sub_810D3FC
sub_810D3FC: @ 810D3FC
	push {lr}
	ldr r0, _0810D40C @ =0x00004049
	bl GetVarPointer
	movs r1, 0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0810D40C: .4byte 0x00004049
	thumb_func_end sub_810D3FC

	thumb_func_start UpdateBirchState
UpdateBirchState: @ 810D410
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0810D438 @ =0x00004049
	bl GetVarPointer
	adds r5, r0, 0
	ldrh r0, [r5]
	adds r4, r0
	strh r4, [r5]
	ldrh r0, [r5]
	movs r1, 0x7
	bl __umodsi3
	strh r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810D438: .4byte 0x00004049
	thumb_func_end UpdateBirchState

	thumb_func_start ScriptGetPokedexInfo
ScriptGetPokedexInfo: @ 810D43C
	push {lr}
	ldr r0, _0810D458 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	bne _0810D460
	movs r0, 0
	bl GetHoennPokedexCount
	ldr r1, _0810D45C @ =gSpecialVar_0x8005
	strh r0, [r1]
	movs r0, 0x1
	bl GetHoennPokedexCount
	b _0810D470
	.align 2, 0
_0810D458: .4byte gSpecialVar_0x8004
_0810D45C: .4byte gSpecialVar_0x8005
_0810D460:
	movs r0, 0
	bl GetNationalPokedexCount
	ldr r1, _0810D480 @ =gSpecialVar_0x8005
	strh r0, [r1]
	movs r0, 0x1
	bl GetNationalPokedexCount
_0810D470:
	ldr r1, _0810D484 @ =gSpecialVar_0x8006
	strh r0, [r1]
	bl IsNationalPokedexEnabled
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0810D480: .4byte gSpecialVar_0x8005
_0810D484: .4byte gSpecialVar_0x8006
	thumb_func_end ScriptGetPokedexInfo

	thumb_func_start GetPokedexRatingText
GetPokedexRatingText: @ 810D488
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x9
	bhi _0810D494
	b _0810D5EC
_0810D494:
	cmp r0, 0x13
	bhi _0810D4A0
	ldr r0, _0810D49C @ =gUnknown_081C456A
	b _0810D5F6
	.align 2, 0
_0810D49C: .4byte gUnknown_081C456A
_0810D4A0:
	cmp r0, 0x1D
	bhi _0810D4AC
	ldr r0, _0810D4A8 @ =gUnknown_081C45B0
	b _0810D5F6
	.align 2, 0
_0810D4A8: .4byte gUnknown_081C45B0
_0810D4AC:
	cmp r0, 0x27
	bhi _0810D4B8
	ldr r0, _0810D4B4 @ =gUnknown_081C45F9
	b _0810D5F6
	.align 2, 0
_0810D4B4: .4byte gUnknown_081C45F9
_0810D4B8:
	cmp r0, 0x31
	bhi _0810D4C4
	ldr r0, _0810D4C0 @ =gUnknown_081C4648
	b _0810D5F6
	.align 2, 0
_0810D4C0: .4byte gUnknown_081C4648
_0810D4C4:
	cmp r0, 0x3B
	bhi _0810D4D0
	ldr r0, _0810D4CC @ =gUnknown_081C467E
	b _0810D5F6
	.align 2, 0
_0810D4CC: .4byte gUnknown_081C467E
_0810D4D0:
	cmp r0, 0x45
	bhi _0810D4DC
	ldr r0, _0810D4D8 @ =gUnknown_081C46B9
	b _0810D5F6
	.align 2, 0
_0810D4D8: .4byte gUnknown_081C46B9
_0810D4DC:
	cmp r0, 0x4F
	bhi _0810D4E8
	ldr r0, _0810D4E4 @ =gUnknown_081C46FE
	b _0810D5F6
	.align 2, 0
_0810D4E4: .4byte gUnknown_081C46FE
_0810D4E8:
	cmp r0, 0x59
	bhi _0810D4F4
	ldr r0, _0810D4F0 @ =gUnknown_081C4747
	b _0810D5F6
	.align 2, 0
_0810D4F0: .4byte gUnknown_081C4747
_0810D4F4:
	cmp r0, 0x63
	bhi _0810D500
	ldr r0, _0810D4FC @ =gUnknown_081C4780
	b _0810D5F6
	.align 2, 0
_0810D4FC: .4byte gUnknown_081C4780
_0810D500:
	cmp r0, 0x6D
	bhi _0810D50C
	ldr r0, _0810D508 @ =gUnknown_081C47DF
	b _0810D5F6
	.align 2, 0
_0810D508: .4byte gUnknown_081C47DF
_0810D50C:
	cmp r0, 0x77
	bhi _0810D518
	ldr r0, _0810D514 @ =gUnknown_081C4828
	b _0810D5F6
	.align 2, 0
_0810D514: .4byte gUnknown_081C4828
_0810D518:
	cmp r0, 0x81
	bhi _0810D524
	ldr r0, _0810D520 @ =gUnknown_081C4863
	b _0810D5F6
	.align 2, 0
_0810D520: .4byte gUnknown_081C4863
_0810D524:
	cmp r0, 0x8B
	bhi _0810D530
	ldr r0, _0810D52C @ =gUnknown_081C489C
	b _0810D5F6
	.align 2, 0
_0810D52C: .4byte gUnknown_081C489C
_0810D530:
	cmp r0, 0x95
	bhi _0810D53C
	ldr r0, _0810D538 @ =gUnknown_081C48EB
	b _0810D5F6
	.align 2, 0
_0810D538: .4byte gUnknown_081C48EB
_0810D53C:
	cmp r0, 0x9F
	bhi _0810D548
	ldr r0, _0810D544 @ =gUnknown_081C4936
	b _0810D5F6
	.align 2, 0
_0810D544: .4byte gUnknown_081C4936
_0810D548:
	cmp r0, 0xA9
	bhi _0810D554
	ldr r0, _0810D550 @ =gUnknown_081C49A2
	b _0810D5F6
	.align 2, 0
_0810D550: .4byte gUnknown_081C49A2
_0810D554:
	cmp r0, 0xB3
	bhi _0810D560
	ldr r0, _0810D55C @ =gUnknown_081C4A06
	b _0810D5F6
	.align 2, 0
_0810D55C: .4byte gUnknown_081C4A06
_0810D560:
	cmp r0, 0xBD
	bhi _0810D56C
	ldr r0, _0810D568 @ =gUnknown_081C4A4F
	b _0810D5F6
	.align 2, 0
_0810D568: .4byte gUnknown_081C4A4F
_0810D56C:
	cmp r0, 0xC7
	bls _0810D5DA
	cmp r0, 0xC8
	bne _0810D5A8
	ldr r0, _0810D5A4 @ =0x00000199
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	bne _0810D5DA
	movs r0, 0xCD
	lsls r0, 1
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	bne _0810D5DA
	b _0810D5F4
	.align 2, 0
_0810D5A4: .4byte 0x00000199
_0810D5A8:
	cmp r0, 0xC9
	bne _0810D5E8
	ldr r0, _0810D5E0 @ =0x00000199
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _0810D5F4
	movs r0, 0xCD
	lsls r0, 1
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _0810D5F4
_0810D5DA:
	ldr r0, _0810D5E4 @ =gUnknown_081C4A91
	b _0810D5F6
	.align 2, 0
_0810D5E0: .4byte 0x00000199
_0810D5E4: .4byte gUnknown_081C4A91
_0810D5E8:
	cmp r0, 0xCA
	beq _0810D5F4
_0810D5EC:
	ldr r0, _0810D5F0 @ =gUnknown_081C4520
	b _0810D5F6
	.align 2, 0
_0810D5F0: .4byte gUnknown_081C4520
_0810D5F4:
	ldr r0, _0810D5FC @ =gUnknown_081C4ADA
_0810D5F6:
	pop {r1}
	bx r1
	.align 2, 0
_0810D5FC: .4byte gUnknown_081C4ADA
	thumb_func_end GetPokedexRatingText

	thumb_func_start ShowPokedexRatingMessage
ShowPokedexRatingMessage: @ 810D600
	push {lr}
	ldr r0, _0810D614 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	bl GetPokedexRatingText
	bl ShowFieldMessage
	pop {r0}
	bx r0
	.align 2, 0
_0810D614: .4byte gSpecialVar_0x8004
	thumb_func_end ShowPokedexRatingMessage

	thumb_func_start AccessHallOfFamePC
AccessHallOfFamePC: @ 810D618
	push {lr}
	ldr r0, _0810D628 @ =sub_81428CC
	bl SetMainCallback2
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0810D628: .4byte sub_81428CC
	thumb_func_end AccessHallOfFamePC

	thumb_func_start ReturnFromHallOfFamePC
ReturnFromHallOfFamePC: @ 810D62C
	push {lr}
	ldr r0, _0810D640 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	ldr r1, _0810D644 @ =gUnknown_0300485C
	ldr r0, _0810D648 @ =ReshowPCMenuAfterHallOfFamePC
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0810D640: .4byte c2_exit_to_overworld_2_switch
_0810D644: .4byte gUnknown_0300485C
_0810D648: .4byte ReshowPCMenuAfterHallOfFamePC
	thumb_func_end ReturnFromHallOfFamePC

	thumb_func_start ReshowPCMenuAfterHallOfFamePC
ReshowPCMenuAfterHallOfFamePC: @ 810D64C
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	bl sub_8053E90
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	bl TryCreatePCMenu
	bl sub_80B5838
	ldr r0, _0810D680 @ =sub_810D684
	movs r1, 0xA
	bl CreateTask
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0810D680: .4byte sub_810D684
	thumb_func_end ReshowPCMenuAfterHallOfFamePC

	thumb_func_start sub_810D684
sub_810D684: @ 810D684
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0810D6A0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810D69C
	adds r0, r2, 0
	bl DestroyTask
_0810D69C:
	pop {r0}
	bx r0
	.align 2, 0
_0810D6A0: .4byte gPaletteFade
	thumb_func_end sub_810D684

	thumb_func_start sub_810D6A4
sub_810D6A4: @ 810D6A4
	push {lr}
	ldr r0, _0810D6B4 @ =sub_8145D88
	bl SetMainCallback2
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0810D6B4: .4byte sub_8145D88
	thumb_func_end sub_810D6A4

	thumb_func_start sub_810D6B8
sub_810D6B8: @ 810D6B8
	push {lr}
	ldr r0, _0810D6D0 @ =gMain
	ldr r1, _0810D6D4 @ =c2_exit_to_overworld_2_switch
	str r1, [r0, 0x8]
	ldr r0, _0810D6D8 @ =CB2_ViewWallClock
	bl SetMainCallback2
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0810D6D0: .4byte gMain
_0810D6D4: .4byte c2_exit_to_overworld_2_switch
_0810D6D8: .4byte CB2_ViewWallClock
	thumb_func_end sub_810D6B8

	thumb_func_start ResetCyclingRoadChallengeData
ResetCyclingRoadChallengeData: @ 810D6DC
	ldr r0, _0810D6F0 @ =gUnknown_02039250
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0810D6F4 @ =gUnknown_02039251
	strb r1, [r0]
	ldr r1, _0810D6F8 @ =gUnknown_02039254
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_0810D6F0: .4byte gUnknown_02039250
_0810D6F4: .4byte gUnknown_02039251
_0810D6F8: .4byte gUnknown_02039254
	thumb_func_end ResetCyclingRoadChallengeData

	thumb_func_start BeginCyclingRoadChallenge
BeginCyclingRoadChallenge: @ 810D6FC
	ldr r1, _0810D714 @ =gUnknown_02039250
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _0810D718 @ =gUnknown_02039251
	movs r0, 0
	strb r0, [r1]
	ldr r1, _0810D71C @ =gUnknown_02039254
	ldr r0, _0810D720 @ =gMain
	ldr r0, [r0, 0x20]
	str r0, [r1]
	bx lr
	.align 2, 0
_0810D714: .4byte gUnknown_02039250
_0810D718: .4byte gUnknown_02039251
_0810D71C: .4byte gUnknown_02039254
_0810D720: .4byte gMain
	thumb_func_end BeginCyclingRoadChallenge

	thumb_func_start GetPlayerAvatarBike
GetPlayerAvatarBike: @ 810D724
	push {lr}
	movs r0, 0x4
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0810D736
	movs r0, 0x1
	b _0810D748
_0810D736:
	movs r0, 0x2
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	bne _0810D746
	movs r0, 0
	b _0810D748
_0810D746:
	movs r0, 0x2
_0810D748:
	pop {r1}
	bx r1
	thumb_func_end GetPlayerAvatarBike

	thumb_func_start DetermineCyclingRoadResults
DetermineCyclingRoadResults: @ 810D74C
	push {r4-r7,lr}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	cmp r6, 0x63
	bhi _0810D778
	ldr r4, _0810D770 @ =gStringVar1
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r1, _0810D774 @ =gOtherText_Times
	adds r0, r4, 0
	bl StringAppend
	b _0810D780
	.align 2, 0
_0810D770: .4byte gStringVar1
_0810D774: .4byte gOtherText_Times
_0810D778:
	ldr r0, _0810D7CC @ =gStringVar1
	ldr r1, _0810D7D0 @ =gOtherText_99Times
	bl StringCopy
_0810D780:
	ldr r0, _0810D7D4 @ =0x00000e0f
	cmp r7, r0
	bhi _0810D7E0
	ldr r4, _0810D7D8 @ =gStringVar2
	adds r0, r7, 0
	movs r1, 0x3C
	bl __udivsi3
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	movs r0, 0xAD
	strb r0, [r4, 0x2]
	adds r5, r4, 0x3
	adds r0, r7, 0
	movs r1, 0x3C
	bl __umodsi3
	movs r1, 0x64
	muls r0, r1
	movs r1, 0x3C
	bl __udivsi3
	adds r1, r0, 0
	adds r0, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r1, _0810D7DC @ =gOtherText_Seconds
	adds r0, r4, 0
	bl StringAppend
	b _0810D7E8
	.align 2, 0
_0810D7CC: .4byte gStringVar1
_0810D7D0: .4byte gOtherText_99Times
_0810D7D4: .4byte 0x00000e0f
_0810D7D8: .4byte gStringVar2
_0810D7DC: .4byte gOtherText_Seconds
_0810D7E0:
	ldr r0, _0810D7F4 @ =gStringVar2
	ldr r1, _0810D7F8 @ =gOtherText_1Minute
	bl StringCopy
_0810D7E8:
	movs r4, 0
	cmp r6, 0
	bne _0810D7FC
	movs r4, 0x5
	b _0810D81A
	.align 2, 0
_0810D7F4: .4byte gStringVar2
_0810D7F8: .4byte gOtherText_1Minute
_0810D7FC:
	cmp r6, 0x3
	bhi _0810D804
	movs r4, 0x4
	b _0810D81A
_0810D804:
	cmp r6, 0x9
	bhi _0810D80C
	movs r4, 0x3
	b _0810D81A
_0810D80C:
	cmp r6, 0x13
	bhi _0810D814
	movs r4, 0x2
	b _0810D81A
_0810D814:
	cmp r6, 0x63
	bhi _0810D81A
	movs r4, 0x1
_0810D81A:
	adds r0, r7, 0
	movs r1, 0x3C
	bl __udivsi3
	cmp r0, 0xA
	bhi _0810D82A
	adds r0, r4, 0x5
	b _0810D848
_0810D82A:
	cmp r0, 0xF
	bhi _0810D832
	adds r0, r4, 0x4
	b _0810D848
_0810D832:
	cmp r0, 0x14
	bhi _0810D83A
	adds r0, r4, 0x3
	b _0810D848
_0810D83A:
	cmp r0, 0x28
	bhi _0810D842
	adds r0, r4, 0x2
	b _0810D848
_0810D842:
	cmp r0, 0x3B
	bhi _0810D84C
	adds r0, r4, 0x1
_0810D848:
	lsls r0, 24
	lsrs r4, r0, 24
_0810D84C:
	ldr r0, _0810D858 @ =gScriptResult
	strh r4, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810D858: .4byte gScriptResult
	thumb_func_end DetermineCyclingRoadResults

	thumb_func_start FinishCyclingRoadChallenge
FinishCyclingRoadChallenge: @ 810D85C
	push {r4,r5,lr}
	ldr r0, _0810D880 @ =gMain
	ldr r1, _0810D884 @ =gUnknown_02039254
	ldr r4, [r0, 0x20]
	ldr r0, [r1]
	subs r4, r0
	ldr r5, _0810D888 @ =gUnknown_02039251
	ldrb r1, [r5]
	adds r0, r4, 0
	bl DetermineCyclingRoadResults
	ldrb r1, [r5]
	adds r0, r4, 0
	bl RecordCyclingRoadResults
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810D880: .4byte gMain
_0810D884: .4byte gUnknown_02039254
_0810D888: .4byte gUnknown_02039251
	thumb_func_end FinishCyclingRoadChallenge

	thumb_func_start RecordCyclingRoadResults
RecordCyclingRoadResults: @ 810D88C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	ldr r6, _0810D8E0 @ =0x00004028
	adds r0, r6, 0
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r7, _0810D8E4 @ =0x00004029
	adds r0, r7, 0
	bl VarGet
	lsls r0, 16
	adds r4, r0
	cmp r4, r5
	bhi _0810D8BC
	cmp r4, 0
	bne _0810D8D6
_0810D8BC:
	lsls r1, r5, 16
	lsrs r1, 16
	adds r0, r6, 0
	bl VarSet
	lsrs r1, r5, 16
	adds r0, r7, 0
	bl VarSet
	ldr r0, _0810D8E8 @ =0x00004027
	mov r1, r8
	bl VarSet
_0810D8D6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810D8E0: .4byte 0x00004028
_0810D8E4: .4byte 0x00004029
_0810D8E8: .4byte 0x00004027
	thumb_func_end RecordCyclingRoadResults

	thumb_func_start GetRecordedCyclingRoadResults
GetRecordedCyclingRoadResults: @ 810D8EC
	push {r4,lr}
	ldr r0, _0810D920 @ =0x00004028
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0810D924 @ =0x00004029
	bl VarGet
	lsls r0, 16
	adds r4, r0
	cmp r4, 0
	beq _0810D92C
	ldr r0, _0810D928 @ =0x00004027
	bl VarGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl DetermineCyclingRoadResults
	movs r0, 0x1
	b _0810D92E
	.align 2, 0
_0810D920: .4byte 0x00004028
_0810D924: .4byte 0x00004029
_0810D928: .4byte 0x00004027
_0810D92C:
	movs r0, 0
_0810D92E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetRecordedCyclingRoadResults

	thumb_func_start UpdateCyclingRoadState
UpdateCyclingRoadState: @ 810D934
	push {r4,lr}
	ldr r0, _0810D974 @ =gUnknown_020297F0
	ldrh r1, [r0]
	ldr r0, _0810D978 @ =0x00000c1d
	cmp r1, r0
	beq _0810D96C
	ldr r4, _0810D97C @ =0x000040a9
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	beq _0810D95E
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bne _0810D96C
_0810D95E:
	adds r0, r4, 0
	movs r1, 0
	bl VarSet
	movs r0, 0
	bl sav1_set_battle_music_maybe
_0810D96C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D974: .4byte gUnknown_020297F0
_0810D978: .4byte 0x00000c1d
_0810D97C: .4byte 0x000040a9
	thumb_func_end UpdateCyclingRoadState

	thumb_func_start SetSSTidalFlag
SetSSTidalFlag: @ 810D980
	push {lr}
	ldr r0, _0810D998 @ =0x0000082d
	bl FlagSet
	ldr r0, _0810D99C @ =0x0000404a
	bl GetVarPointer
	movs r1, 0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0810D998: .4byte 0x0000082d
_0810D99C: .4byte 0x0000404a
	thumb_func_end SetSSTidalFlag

	thumb_func_start ResetSSTidalFlag
ResetSSTidalFlag: @ 810D9A0
	push {lr}
	ldr r0, _0810D9AC @ =0x0000082d
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_0810D9AC: .4byte 0x0000082d
	thumb_func_end ResetSSTidalFlag

	thumb_func_start sub_810D9B0
sub_810D9B0: @ 810D9B0
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _0810D9DC @ =0x0000082d
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810D9D6
	ldr r0, _0810D9E0 @ =0x0000404a
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, r4, r1
	strh r1, [r0]
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0xCC
	bhi _0810D9E4
_0810D9D6:
	movs r0, 0
	b _0810D9E6
	.align 2, 0
_0810D9DC: .4byte 0x0000082d
_0810D9E0: .4byte 0x0000404a
_0810D9E4:
	movs r0, 0x1
_0810D9E6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810D9B0

	thumb_func_start sub_810D9EC
sub_810D9EC: @ 810D9EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, 0
	adds r6, r2, 0
	adds r7, r3, 0
	ldr r0, _0810DA1C @ =0x0000404a
	bl GetVarPointer
	adds r4, r0, 0
	ldr r0, _0810DA20 @ =0x000040b4
	bl GetVarPointer
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x9
	bhi _0810DAB2
	lsls r0, 2
	ldr r1, _0810DA24 @ =_0810DA28
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810DA1C: .4byte 0x0000404a
_0810DA20: .4byte 0x000040b4
_0810DA24: .4byte _0810DA28
	.align 2, 0
_0810DA28:
	.4byte _0810DA50
	.4byte _0810DA60
	.4byte _0810DA54
	.4byte _0810DA58
	.4byte _0810DA58
	.4byte _0810DA5C
	.4byte _0810DA88
	.4byte _0810DA50
	.4byte _0810DA54
	.4byte _0810DA5C
_0810DA50:
	movs r0, 0x1
	b _0810DABE
_0810DA54:
	movs r0, 0x4
	b _0810DABE
_0810DA58:
	movs r0, 0x2
	b _0810DABE
_0810DA5C:
	movs r0, 0x3
	b _0810DABE
_0810DA60:
	ldrh r0, [r4]
	cmp r0, 0x3B
	bhi _0810DA70
	movs r0, 0x31
	strb r0, [r5]
	ldrh r0, [r4]
	adds r0, 0x13
	b _0810DAB0
_0810DA70:
	cmp r0, 0x8B
	bhi _0810DA7E
	movs r0, 0x30
	strb r0, [r5]
	ldrh r0, [r4]
	subs r0, 0x3C
	b _0810DAB0
_0810DA7E:
	movs r0, 0x2F
	strb r0, [r5]
	ldrh r0, [r4]
	subs r0, 0x8C
	b _0810DAB0
_0810DA88:
	ldrh r0, [r4]
	cmp r0, 0x41
	bhi _0810DA98
	movs r0, 0x2F
	strb r0, [r5]
	ldrh r1, [r4]
	movs r0, 0x41
	b _0810DAAE
_0810DA98:
	cmp r0, 0x91
	bhi _0810DAA6
	movs r0, 0x30
	strb r0, [r5]
	ldrh r1, [r4]
	movs r0, 0x91
	b _0810DAAE
_0810DAA6:
	movs r0, 0x31
	strb r0, [r5]
	ldrh r1, [r4]
	movs r0, 0xE0
_0810DAAE:
	subs r0, r1
_0810DAB0:
	strh r0, [r6]
_0810DAB2:
	movs r0, 0
	mov r1, r8
	strb r0, [r1]
	movs r0, 0x14
	strh r0, [r7]
	movs r0, 0
_0810DABE:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810D9EC

	thumb_func_start GetLinkPartnerNames
GetLinkPartnerNames: @ 810DAC8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	bl sub_8008218
	lsls r0, 24
	lsrs r7, r0, 24
	bl sub_800820C
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	cmp r4, r5
	bcs _0810DB12
	ldr r0, _0810DB20 @ =gUnknown_083D1464
	mov r8, r0
_0810DAEA:
	cmp r7, r4
	beq _0810DB08
	lsls r0, r6, 2
	add r0, r8
	ldr r0, [r0]
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	ldr r2, _0810DB24 @ =gLinkPlayers + 0x8
	adds r1, r2
	bl StringCopy
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0810DB08:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _0810DAEA
_0810DB12:
	adds r0, r5, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810DB20: .4byte gUnknown_083D1464
_0810DB24: .4byte gLinkPlayers + 0x8
	thumb_func_end GetLinkPartnerNames

	thumb_func_start sub_810DB28
sub_810DB28: @ 810DB28
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	movs r7, 0
	movs r0, 0
	mov r9, r0
	mov r8, r0
	ldr r1, _0810DB74 @ =gUnknown_083F8358
	add r0, sp, 0x8
	movs r2, 0x4
	bl memcpy
	add r4, sp, 0xC
	ldr r1, _0810DB78 @ =gUnknown_083F835C
	adds r0, r4, 0
	movs r2, 0x8
	bl memcpy
	bl sub_8008218
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x2
	beq _0810DB94
	cmp r0, 0x2
	bgt _0810DB7C
	cmp r0, 0x1
	beq _0810DBC0
	b _0810DBD2
	.align 2, 0
_0810DB74: .4byte gUnknown_083F8358
_0810DB78: .4byte gUnknown_083F835C
_0810DB7C:
	cmp r1, 0x3
	beq _0810DB86
	cmp r1, 0x4
	beq _0810DBA8
	b _0810DBD2
_0810DB86:
	movs r7, 0x2
	ldr r1, _0810DB90 @ =gSaveBlock1
	ldrh r0, [r1]
	subs r0, 0x1
	b _0810DBAE
	.align 2, 0
_0810DB90: .4byte gSaveBlock1
_0810DB94:
	movs r7, 0x1
	ldr r0, _0810DBA4 @ =gSaveBlock1
	ldrh r1, [r0]
	mov r9, r1
	ldrh r0, [r0, 0x2]
	subs r0, 0x1
	b _0810DBCC
	.align 2, 0
_0810DBA4: .4byte gSaveBlock1
_0810DBA8:
	ldr r1, _0810DBBC @ =gSaveBlock1
	ldrh r0, [r1]
	adds r0, 0x1
_0810DBAE:
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldrh r1, [r1, 0x2]
	mov r8, r1
	b _0810DBD2
	.align 2, 0
_0810DBBC: .4byte gSaveBlock1
_0810DBC0:
	movs r7, 0x3
	ldr r0, _0810DBD8 @ =gSaveBlock1
	ldrh r4, [r0]
	mov r9, r4
	ldrh r0, [r0, 0x2]
	adds r0, 0x1
_0810DBCC:
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_0810DBD2:
	movs r6, 0
	b _0810DC5C
	.align 2, 0
_0810DBD8: .4byte gSaveBlock1
_0810DBDC:
	cmp r10, r6
	beq _0810DC56
	ldr r1, _0810DC74 @ =gLinkPlayers
	lsls r0, r6, 3
	subs r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x13]
	movs r0, 0
	bl GetRivalAvatarGraphicsIdByStateIdAndGender
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	adds r1, r7
	adds r1, 0x8
	ldrb r1, [r1]
	movs r2, 0xF0
	subs r2, r6
	lsls r2, 24
	lsrs r2, 24
	lsls r5, r7, 1
	mov r3, sp
	adds r3, r5
	adds r3, 0xC
	ldrb r3, [r3]
	lsls r3, 24
	asrs r3, 24
	mov r12, r3
	mov r4, r9
	lsls r3, r4, 16
	asrs r3, 16
	add r3, r12
	adds r3, 0x7
	lsls r3, 16
	asrs r3, 16
	mov r4, sp
	adds r4, 0xD
	adds r4, r5
	ldrb r4, [r4]
	lsls r4, 24
	asrs r4, 24
	mov r12, r4
	mov r5, r8
	lsls r4, r5, 16
	asrs r4, 16
	add r4, r12
	adds r4, 0x7
	lsls r4, 16
	asrs r4, 16
	str r4, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	bl SpawnSpecialFieldObjectParametrized
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x4
	bne _0810DC56
	movs r7, 0
_0810DC56:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0810DC5C:
	ldr r0, _0810DC78 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r6, r0
	bcc _0810DBDC
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810DC74: .4byte gLinkPlayers
_0810DC78: .4byte gSpecialVar_0x8004
	thumb_func_end sub_810DB28

	thumb_func_start sub_810DC7C
sub_810DC7C: @ 810DC7C
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0810DC9C @ =gUnknown_083F8364
_0810DC82:
	ldr r0, _0810DCA0 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r4, r0
	bne _0810DCA8
	lsls r1, r4, 2
	adds r1, r5
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	ldr r2, _0810DCA4 @ =0x00000206
	bl MapGridSetMetatileIdAt
	b _0810DCB6
	.align 2, 0
_0810DC9C: .4byte gUnknown_083F8364
_0810DCA0: .4byte gSpecialVar_0x8004
_0810DCA4: .4byte 0x00000206
_0810DCA8:
	lsls r1, r4, 2
	adds r1, r5
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	ldr r2, _0810DCC8 @ =0x00000205
	bl MapGridSetMetatileIdAt
_0810DCB6:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0810DC82
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810DCC8: .4byte 0x00000205
	thumb_func_end sub_810DC7C

	thumb_func_start sub_810DCCC
sub_810DCCC: @ 810DCCC
	push {r4-r6,lr}
	movs r5, 0xC
_0810DCD0:
	movs r4, 0x7
	adds r6, r5, 0x1
_0810DCD4:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	ldr r1, _0810DCF0 @ =0xfffffde6
	adds r0, r1
	cmp r0, 0x37
	bls _0810DCE6
	b _0810DEC0
_0810DCE6:
	lsls r0, 2
	ldr r1, _0810DCF4 @ =_0810DCF8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810DCF0: .4byte 0xfffffde6
_0810DCF4: .4byte _0810DCF8
	.align 2, 0
_0810DCF8:
	.4byte _0810DE7E
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DDD8
	.4byte _0810DDDE
	.4byte _0810DE18
	.4byte _0810DE20
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DDE8
	.4byte _0810DDEE
	.4byte _0810DE28
	.4byte _0810DE30
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DDF8
	.4byte _0810DDFE
	.4byte _0810DE38
	.4byte _0810DE40
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DE08
	.4byte _0810DE10
	.4byte _0810DE48
	.4byte _0810DE50
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DE58
	.4byte _0810DE68
	.4byte _0810DE78
	.4byte _0810DEA0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DE60
	.4byte _0810DE70
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEC0
	.4byte _0810DEB6
	.4byte _0810DEA8
_0810DDD8:
	movs r2, 0x8C
	lsls r2, 2
	b _0810DEAC
_0810DDDE:
	ldr r2, _0810DDE4 @ =0x00000231
	b _0810DEAC
	.align 2, 0
_0810DDE4: .4byte 0x00000231
_0810DDE8:
	movs r2, 0x8E
	lsls r2, 2
	b _0810DEAC
_0810DDEE:
	ldr r2, _0810DDF4 @ =0x00000239
	b _0810DEAC
	.align 2, 0
_0810DDF4: .4byte 0x00000239
_0810DDF8:
	movs r2, 0x88
	lsls r2, 2
	b _0810DEAC
_0810DDFE:
	ldr r2, _0810DE04 @ =0x00000221
	b _0810DEAC
	.align 2, 0
_0810DE04: .4byte 0x00000221
_0810DE08:
	ldr r2, _0810DE0C @ =0x00000e28
	b _0810DEAC
	.align 2, 0
_0810DE0C: .4byte 0x00000e28
_0810DE10:
	ldr r2, _0810DE14 @ =0x00000e29
	b _0810DEAC
	.align 2, 0
_0810DE14: .4byte 0x00000e29
_0810DE18:
	ldr r2, _0810DE1C @ =0x00000232
	b _0810DEAC
	.align 2, 0
_0810DE1C: .4byte 0x00000232
_0810DE20:
	ldr r2, _0810DE24 @ =0x00000233
	b _0810DEAC
	.align 2, 0
_0810DE24: .4byte 0x00000233
_0810DE28:
	ldr r2, _0810DE2C @ =0x0000023a
	b _0810DEAC
	.align 2, 0
_0810DE2C: .4byte 0x0000023a
_0810DE30:
	ldr r2, _0810DE34 @ =0x0000023b
	b _0810DEAC
	.align 2, 0
_0810DE34: .4byte 0x0000023b
_0810DE38:
	ldr r2, _0810DE3C @ =0x00000222
	b _0810DEAC
	.align 2, 0
_0810DE3C: .4byte 0x00000222
_0810DE40:
	ldr r2, _0810DE44 @ =0x00000223
	b _0810DEAC
	.align 2, 0
_0810DE44: .4byte 0x00000223
_0810DE48:
	ldr r2, _0810DE4C @ =0x00000e2a
	b _0810DEAC
	.align 2, 0
_0810DE4C: .4byte 0x00000e2a
_0810DE50:
	ldr r2, _0810DE54 @ =0x00000e2b
	b _0810DEAC
	.align 2, 0
_0810DE54: .4byte 0x00000e2b
_0810DE58:
	ldr r2, _0810DE5C @ =0x00000e42
	b _0810DEAC
	.align 2, 0
_0810DE5C: .4byte 0x00000e42
_0810DE60:
	ldr r2, _0810DE64 @ =0x0000021a
	b _0810DEAC
	.align 2, 0
_0810DE64: .4byte 0x0000021a
_0810DE68:
	ldr r2, _0810DE6C @ =0x00000e43
	b _0810DEAC
	.align 2, 0
_0810DE6C: .4byte 0x00000e43
_0810DE70:
	ldr r2, _0810DE74 @ =0x0000021a
	b _0810DEAC
	.align 2, 0
_0810DE74: .4byte 0x0000021a
_0810DE78:
	movs r2, 0xE4
	lsls r2, 4
	b _0810DEAC
_0810DE7E:
	subs r1, r5, 0x1
	adds r0, r4, 0
	bl MapGridGetMetatileIdAt
	movs r1, 0x90
	lsls r1, 2
	cmp r0, r1
	bne _0810DE98
	ldr r2, _0810DE94 @ =0x00000e48
	b _0810DEAC
	.align 2, 0
_0810DE94: .4byte 0x00000e48
_0810DE98:
	ldr r2, _0810DE9C @ =0x00000e49
	b _0810DEAC
	.align 2, 0
_0810DE9C: .4byte 0x00000e49
_0810DEA0:
	ldr r2, _0810DEA4 @ =0x00000e41
	b _0810DEAC
	.align 2, 0
_0810DEA4: .4byte 0x00000e41
_0810DEA8:
	movs r2, 0xE5
	lsls r2, 4
_0810DEAC:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _0810DEC0
_0810DEB6:
	ldr r2, _0810DED8 @ =0x00000251
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_0810DEC0:
	adds r4, 0x1
	cmp r4, 0xF
	bgt _0810DEC8
	b _0810DCD4
_0810DEC8:
	adds r5, r6, 0
	cmp r5, 0x17
	bgt _0810DED0
	b _0810DCD0
_0810DED0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810DED8: .4byte 0x00000251
	thumb_func_end sub_810DCCC

	thumb_func_start sub_810DEDC
sub_810DEDC: @ 810DEDC
	push {r4-r6,lr}
	ldr r4, _0810DF18 @ =gUnknown_083F8364
	movs r5, 0x2
_0810DEE2:
	ldrb r0, [r4]
	ldrb r1, [r4, 0x1]
	ldr r2, _0810DF1C @ =0x00000206
	bl MapGridSetMetatileIdAt
	adds r4, 0x4
	subs r5, 0x1
	cmp r5, 0
	bge _0810DEE2
	movs r5, 0xC
_0810DEF6:
	movs r4, 0x7
	adds r6, r5, 0x1
_0810DEFA:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	ldr r1, _0810DF20 @ =0xfffffde0
	adds r0, r1
	cmp r0, 0x30
	bls _0810DF0C
	b _0810E056
_0810DF0C:
	lsls r0, 2
	ldr r1, _0810DF24 @ =_0810DF28
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810DF18: .4byte gUnknown_083F8364
_0810DF1C: .4byte 0x00000206
_0810DF20: .4byte 0xfffffde0
_0810DF24: .4byte _0810DF28
	.align 2, 0
_0810DF28:
	.4byte _0810DFEC
	.4byte _0810DFF2
	.4byte _0810E00C
	.4byte _0810E014
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810DFFC
	.4byte _0810E002
	.4byte _0810E01C
	.4byte _0810E024
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E02C
	.4byte _0810E034
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E03C
	.4byte _0810E03C
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E056
	.4byte _0810E04C
_0810DFEC:
	movs r2, 0x8C
	lsls r2, 2
	b _0810E03E
_0810DFF2:
	ldr r2, _0810DFF8 @ =0x00000231
	b _0810E03E
	.align 2, 0
_0810DFF8: .4byte 0x00000231
_0810DFFC:
	movs r2, 0x8E
	lsls r2, 2
	b _0810E03E
_0810E002:
	ldr r2, _0810E008 @ =0x00000239
	b _0810E03E
	.align 2, 0
_0810E008: .4byte 0x00000239
_0810E00C:
	ldr r2, _0810E010 @ =0x00000232
	b _0810E03E
	.align 2, 0
_0810E010: .4byte 0x00000232
_0810E014:
	ldr r2, _0810E018 @ =0x00000233
	b _0810E03E
	.align 2, 0
_0810E018: .4byte 0x00000233
_0810E01C:
	ldr r2, _0810E020 @ =0x0000023a
	b _0810E03E
	.align 2, 0
_0810E020: .4byte 0x0000023a
_0810E024:
	ldr r2, _0810E028 @ =0x0000023b
	b _0810E03E
	.align 2, 0
_0810E028: .4byte 0x0000023b
_0810E02C:
	ldr r2, _0810E030 @ =0x00000e42
	b _0810E03E
	.align 2, 0
_0810E030: .4byte 0x00000e42
_0810E034:
	ldr r2, _0810E038 @ =0x00000e43
	b _0810E03E
	.align 2, 0
_0810E038: .4byte 0x00000e43
_0810E03C:
	ldr r2, _0810E048 @ =0x0000021a
_0810E03E:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _0810E056
	.align 2, 0
_0810E048: .4byte 0x0000021a
_0810E04C:
	ldr r2, _0810E06C @ =0x00000251
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_0810E056:
	adds r4, 0x1
	cmp r4, 0xF
	bgt _0810E05E
	b _0810DEFA
_0810E05E:
	adds r5, r6, 0
	cmp r5, 0x17
	bgt _0810E066
	b _0810DEF6
_0810E066:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E06C: .4byte 0x00000251
	thumb_func_end sub_810DEDC

	thumb_func_start sub_810E070
sub_810E070: @ 810E070
	push {lr}
	ldr r0, _0810E090 @ =gUnknown_02039258
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0810E094 @ =gUnknown_02039259
	strb r1, [r0]
	movs r0, 0x2C
	bl PlaySE
	ldr r0, _0810E098 @ =sub_810E09C
	movs r1, 0x8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0810E090: .4byte gUnknown_02039258
_0810E094: .4byte gUnknown_02039259
_0810E098: .4byte sub_810E09C
	thumb_func_end sub_810E070

	thumb_func_start sub_810E09C
sub_810E09C: @ 810E09C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0810E0E4 @ =gUnknown_083F8370
	ldr r5, _0810E0E8 @ =gUnknown_02039259
	ldrb r1, [r5]
	adds r0, r1, r0
	ldr r4, _0810E0EC @ =gUnknown_02039258
	ldrb r2, [r4]
	ldrb r0, [r0]
	cmp r0, r2
	bne _0810E0F8
	ldr r0, _0810E0F0 @ =gSpecialVar_0x8004
	ldrb r0, [r0]
	ldr r2, _0810E0F4 @ =gUnknown_083F8376
	lsls r1, 1
	adds r1, r2
	ldrh r1, [r1]
	bl sub_810E104
	movs r0, 0
	strb r0, [r4]
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _0810E0FC
	adds r0, r6, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	b _0810E0FC
	.align 2, 0
_0810E0E4: .4byte gUnknown_083F8370
_0810E0E8: .4byte gUnknown_02039259
_0810E0EC: .4byte gUnknown_02039258
_0810E0F0: .4byte gSpecialVar_0x8004
_0810E0F4: .4byte gUnknown_083F8376
_0810E0F8:
	adds r0, r2, 0x1
	strb r0, [r4]
_0810E0FC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_810E09C

	thumb_func_start sub_810E104
sub_810E104: @ 810E104
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r2, r1, 16
	movs r7, 0
	subs r0, 0x1
	cmp r0, 0x7
	bhi _0810E1CC
	lsls r0, 2
	ldr r1, _0810E128 @ =_0810E12C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810E128: .4byte _0810E12C
	.align 2, 0
_0810E12C:
	.4byte _0810E14C
	.4byte _0810E15E
	.4byte _0810E170
	.4byte _0810E182
	.4byte _0810E190
	.4byte _0810E1A6
	.4byte _0810E1B2
	.4byte _0810E1C0
_0810E14C:
	movs r7, 0x2
	mov r1, sp
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0x7
	strh r0, [r1, 0x2]
	add r1, sp, 0x8
	movs r0, 0x68
	b _0810E1A0
_0810E15E:
	movs r7, 0x2
	mov r1, sp
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0x7
	strh r0, [r1, 0x2]
	add r1, sp, 0x8
	movs r0, 0x4E
	b _0810E1A0
_0810E170:
	movs r7, 0x2
	mov r1, sp
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0x7
	strh r0, [r1, 0x2]
	add r1, sp, 0x8
	movs r0, 0x5B
	b _0810E1A0
_0810E182:
	movs r7, 0x1
	mov r1, sp
	movs r0, 0x7
	strh r0, [r1]
	add r1, sp, 0x8
	movs r0, 0x27
	b _0810E1CA
_0810E190:
	movs r7, 0x2
	mov r1, sp
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0x7
	strh r0, [r1, 0x2]
	add r1, sp, 0x8
	movs r0, 0x34
_0810E1A0:
	strh r0, [r1]
	strh r0, [r1, 0x2]
	b _0810E1CC
_0810E1A6:
	movs r7, 0x1
	mov r0, sp
	strh r7, [r0]
	add r1, sp, 0x8
	movs r0, 0x41
	b _0810E1CA
_0810E1B2:
	movs r7, 0x1
	mov r1, sp
	movs r0, 0x7
	strh r0, [r1]
	add r1, sp, 0x8
	movs r0, 0xD
	b _0810E1CA
_0810E1C0:
	movs r7, 0x1
	mov r0, sp
	strh r7, [r0]
	add r1, sp, 0x8
	movs r0, 0x1A
_0810E1CA:
	strh r0, [r1]
_0810E1CC:
	movs r6, 0
	cmp r6, r7
	bcs _0810E21E
	movs r1, 0xC0
	lsls r1, 4
	adds r0, r1, 0
	adds r1, r2, 0
	orrs r1, r0
	lsls r1, 16
	mov r9, r1
	adds r1, r2, 0
	adds r1, 0x8
	orrs r1, r0
	lsls r1, 16
	mov r8, r1
_0810E1EA:
	lsls r1, r6, 1
	mov r3, sp
	adds r5, r3, r1
	ldrh r0, [r5]
	adds r0, 0x7
	add r4, sp, 0x8
	adds r4, r1
	ldrh r1, [r4]
	adds r1, 0x7
	mov r3, r9
	lsrs r2, r3, 16
	bl MapGridSetMetatileIdAt
	ldrh r0, [r5]
	adds r0, 0x7
	ldrh r1, [r4]
	adds r1, 0x8
	mov r3, r8
	lsrs r2, r3, 16
	bl MapGridSetMetatileIdAt
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _0810E1EA
_0810E21E:
	bl DrawWholeMapView
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810E104

	thumb_func_start sub_810E230
sub_810E230: @ 810E230
	push {lr}
	ldr r0, _0810E244 @ =gSpecialVar_0x8004
	ldrb r0, [r0]
	ldr r1, _0810E248 @ =gUnknown_083F8376
	ldrh r1, [r1, 0x8]
	bl sub_810E104
	pop {r0}
	bx r0
	.align 2, 0
_0810E244: .4byte gSpecialVar_0x8004
_0810E248: .4byte gUnknown_083F8376
	thumb_func_end sub_810E230

	thumb_func_start ShowFieldMessageStringVar4
ShowFieldMessageStringVar4: @ 810E24C
	push {lr}
	ldr r0, _0810E258 @ =gStringVar4
	bl ShowFieldMessage
	pop {r0}
	bx r0
	.align 2, 0
_0810E258: .4byte gStringVar4
	thumb_func_end ShowFieldMessageStringVar4

	thumb_func_start StorePlayerCoordsInVars
StorePlayerCoordsInVars: @ 810E25C
	ldr r1, _0810E26C @ =gSpecialVar_0x8004
	ldr r2, _0810E270 @ =gSaveBlock1
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r1, _0810E274 @ =gSpecialVar_0x8005
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0810E26C: .4byte gSpecialVar_0x8004
_0810E270: .4byte gSaveBlock1
_0810E274: .4byte gSpecialVar_0x8005
	thumb_func_end StorePlayerCoordsInVars

	thumb_func_start GetPlayerTrainerIdOnesDigit
GetPlayerTrainerIdOnesDigit: @ 810E278
	push {lr}
	ldr r0, _0810E294 @ =gSaveBlock2
	ldrb r1, [r0, 0xB]
	lsls r1, 8
	ldrb r0, [r0, 0xA]
	orrs r0, r1
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0810E294: .4byte gSaveBlock2
	thumb_func_end GetPlayerTrainerIdOnesDigit

	thumb_func_start GetPlayerBigGuyGirlString
GetPlayerBigGuyGirlString: @ 810E298
	push {lr}
	ldr r0, _0810E2AC @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _0810E2B8
	ldr r0, _0810E2B0 @ =gStringVar1
	ldr r1, _0810E2B4 @ =gOtherText_BigGuy
	bl StringCopy
	b _0810E2C0
	.align 2, 0
_0810E2AC: .4byte gSaveBlock2
_0810E2B0: .4byte gStringVar1
_0810E2B4: .4byte gOtherText_BigGuy
_0810E2B8:
	ldr r0, _0810E2C4 @ =gStringVar1
	ldr r1, _0810E2C8 @ =gOtherText_BigGirl
	bl StringCopy
_0810E2C0:
	pop {r0}
	bx r0
	.align 2, 0
_0810E2C4: .4byte gStringVar1
_0810E2C8: .4byte gOtherText_BigGirl
	thumb_func_end GetPlayerBigGuyGirlString

	thumb_func_start GetRivalSonDaughterString
GetRivalSonDaughterString: @ 810E2CC
	push {lr}
	ldr r0, _0810E2E0 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _0810E2EC
	ldr r0, _0810E2E4 @ =gStringVar1
	ldr r1, _0810E2E8 @ =gOtherText_Daughter
	bl StringCopy
	b _0810E2F4
	.align 2, 0
_0810E2E0: .4byte gSaveBlock2
_0810E2E4: .4byte gStringVar1
_0810E2E8: .4byte gOtherText_Daughter
_0810E2EC:
	ldr r0, _0810E2F8 @ =gStringVar1
	ldr r1, _0810E2FC @ =gOtherText_Son
	bl StringCopy
_0810E2F4:
	pop {r0}
	bx r0
	.align 2, 0
_0810E2F8: .4byte gStringVar1
_0810E2FC: .4byte gOtherText_Son
	thumb_func_end GetRivalSonDaughterString

	thumb_func_start sub_810E300
sub_810E300: @ 810E300
	ldr r0, _0810E308 @ =gUnknown_02024D26
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0810E308: .4byte gUnknown_02024D26
	thumb_func_end sub_810E300

	thumb_func_start CableCarWarp
CableCarWarp: @ 810E30C
	push {lr}
	sub sp, 0x4
	ldr r0, _0810E32C @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	beq _0810E330
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x4
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r3, 0x6
	bl warp1_set
	b _0810E342
	.align 2, 0
_0810E32C: .4byte gSpecialVar_0x8004
_0810E330:
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x4
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0x1
	movs r3, 0x6
	bl warp1_set
_0810E342:
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end CableCarWarp

	thumb_func_start SetFlagInVar
SetFlagInVar: @ 810E348
	push {lr}
	ldr r0, _0810E358 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0810E358: .4byte gSpecialVar_0x8004
	thumb_func_end SetFlagInVar

	thumb_func_start GetWeekCount
GetWeekCount: @ 810E35C
	push {lr}
	ldr r0, _0810E37C @ =gLocalTime
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x7
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0810E380 @ =0x0000270f
	cmp r0, r1
	bls _0810E376
	adds r0, r1, 0
_0810E376:
	pop {r1}
	bx r1
	.align 2, 0
_0810E37C: .4byte gLocalTime
_0810E380: .4byte 0x0000270f
	thumb_func_end GetWeekCount

	thumb_func_start GetLeadMonFriendshipScore
GetLeadMonFriendshipScore: @ 810E384
	push {r4,lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _0810E3A8 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0xFF
	bne _0810E3AC
	movs r0, 0x6
	b _0810E3FE
	.align 2, 0
_0810E3A8: .4byte gPlayerParty
_0810E3AC:
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0xC7
	bls _0810E3BC
	movs r0, 0x5
	b _0810E3FE
_0810E3BC:
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0x95
	bls _0810E3CC
	movs r0, 0x4
	b _0810E3FE
_0810E3CC:
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0x63
	bls _0810E3DC
	movs r0, 0x3
	b _0810E3FE
_0810E3DC:
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0x31
	bls _0810E3EC
	movs r0, 0x2
	b _0810E3FE
_0810E3EC:
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0
	bne _0810E3FC
	movs r0, 0
	b _0810E3FE
_0810E3FC:
	movs r0, 0x1
_0810E3FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetLeadMonFriendshipScore

	thumb_func_start CB2_FieldShowRegionMap
CB2_FieldShowRegionMap: @ 810E404
	push {lr}
	ldr r0, _0810E410 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl FieldInitRegionMap
	pop {r0}
	bx r0
	.align 2, 0
_0810E410: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end CB2_FieldShowRegionMap

	thumb_func_start FieldShowRegionMap
FieldShowRegionMap: @ 810E414
	push {lr}
	ldr r0, _0810E420 @ =CB2_FieldShowRegionMap
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0810E420: .4byte CB2_FieldShowRegionMap
	thumb_func_end FieldShowRegionMap

	thumb_func_start DoPCTurnOnEffect
DoPCTurnOnEffect: @ 810E424
	push {r4,lr}
	ldr r4, _0810E460 @ =Task_PCTurnOnEffect
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810E458
	adds r0, r4, 0
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810E464 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x8]
	strh r0, [r1, 0xA]
	strh r2, [r1, 0xC]
	strh r2, [r1, 0xE]
	strh r2, [r1, 0x10]
_0810E458:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E460: .4byte Task_PCTurnOnEffect
_0810E464: .4byte gTasks
	thumb_func_end DoPCTurnOnEffect

	thumb_func_start Task_PCTurnOnEffect
Task_PCTurnOnEffect: @ 810E468
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0810E48C @ =gTasks
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0810E486
	adds r0, r1, 0
	bl PCTurnOffEffect_0
_0810E486:
	pop {r0}
	bx r0
	.align 2, 0
_0810E48C: .4byte gTasks
	thumb_func_end Task_PCTurnOnEffect

	thumb_func_start PCTurnOffEffect_0
PCTurnOffEffect_0: @ 810E490
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r6, 0
	movs r5, 0
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bne _0810E4FC
	strh r5, [r4, 0xE]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x3
	beq _0810E4C4
	cmp r0, 0x3
	bgt _0810E4BA
	cmp r0, 0x2
	beq _0810E4C0
	b _0810E4CC
_0810E4BA:
	cmp r1, 0x4
	beq _0810E4C8
	b _0810E4CC
_0810E4C0:
	movs r6, 0
	b _0810E4CA
_0810E4C4:
	movs r6, 0xFF
	b _0810E4CA
_0810E4C8:
	movs r6, 0x1
_0810E4CA:
	movs r5, 0xFF
_0810E4CC:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	lsls r1, r6, 24
	asrs r1, 24
	lsls r2, r5, 24
	asrs r2, 24
	bl PCTurnOffEffect_1
	bl DrawWholeMapView
	ldrh r0, [r4, 0x10]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _0810E4FC
	ldrb r0, [r4, 0xA]
	bl DestroyTask
_0810E4FC:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end PCTurnOffEffect_0

	thumb_func_start PCTurnOffEffect_1
PCTurnOffEffect_1: @ 810E508
	push {r4,r5,lr}
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	movs r3, 0
	lsls r0, 16
	cmp r0, 0
	beq _0810E544
	ldr r0, _0810E528 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	bne _0810E52C
	movs r3, 0x4
	b _0810E566
	.align 2, 0
_0810E528: .4byte gSpecialVar_0x8004
_0810E52C:
	cmp r0, 0x1
	bne _0810E538
	ldr r3, _0810E534 @ =0x0000025a
	b _0810E566
	.align 2, 0
_0810E534: .4byte 0x0000025a
_0810E538:
	cmp r0, 0x2
	bne _0810E566
	ldr r3, _0810E540 @ =0x00000259
	b _0810E566
	.align 2, 0
_0810E540: .4byte 0x00000259
_0810E544:
	ldr r0, _0810E550 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	bne _0810E554
	movs r3, 0x5
	b _0810E566
	.align 2, 0
_0810E550: .4byte gSpecialVar_0x8004
_0810E554:
	cmp r0, 0x1
	bne _0810E560
	ldr r3, _0810E55C @ =0x0000027f
	b _0810E566
	.align 2, 0
_0810E55C: .4byte 0x0000027f
_0810E560:
	cmp r0, 0x2
	bne _0810E566
	ldr r3, _0810E594 @ =0x0000027e
_0810E566:
	ldr r2, _0810E598 @ =gSaveBlock1
	movs r5, 0
	ldrsh r0, [r2, r5]
	lsls r1, 24
	asrs r1, 24
	adds r0, r1
	adds r0, 0x7
	movs r5, 0x2
	ldrsh r1, [r2, r5]
	lsls r2, r4, 24
	asrs r2, 24
	adds r1, r2
	adds r1, 0x7
	movs r4, 0xC0
	lsls r4, 4
	adds r2, r4, 0
	orrs r3, r2
	adds r2, r3, 0
	bl MapGridSetMetatileIdAt
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E594: .4byte 0x0000027e
_0810E598: .4byte gSaveBlock1
	thumb_func_end PCTurnOffEffect_1

	thumb_func_start DoPCTurnOffEffect
DoPCTurnOffEffect: @ 810E59C
	push {lr}
	bl PCTurnOffEffect
	pop {r0}
	bx r0
	thumb_func_end DoPCTurnOffEffect

	thumb_func_start PCTurnOffEffect
PCTurnOffEffect: @ 810E5A8
	push {r4-r6,lr}
	movs r6, 0
	movs r5, 0
	movs r4, 0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x3
	beq _0810E5D2
	cmp r0, 0x3
	bgt _0810E5C8
	cmp r0, 0x2
	beq _0810E5CE
	b _0810E5DA
_0810E5C8:
	cmp r1, 0x4
	beq _0810E5D6
	b _0810E5DA
_0810E5CE:
	movs r6, 0
	b _0810E5D8
_0810E5D2:
	movs r6, 0xFF
	b _0810E5D8
_0810E5D6:
	movs r6, 0x1
_0810E5D8:
	movs r5, 0xFF
_0810E5DA:
	ldr r0, _0810E5E8 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	bne _0810E5EC
	movs r4, 0x4
	b _0810E5FE
	.align 2, 0
_0810E5E8: .4byte gSpecialVar_0x8004
_0810E5EC:
	cmp r0, 0x1
	bne _0810E5F8
	ldr r4, _0810E5F4 @ =0x0000025a
	b _0810E5FE
	.align 2, 0
_0810E5F4: .4byte 0x0000025a
_0810E5F8:
	cmp r0, 0x2
	bne _0810E5FE
	ldr r4, _0810E630 @ =0x00000259
_0810E5FE:
	ldr r2, _0810E634 @ =gSaveBlock1
	movs r1, 0
	ldrsh r0, [r2, r1]
	lsls r1, r6, 24
	asrs r1, 24
	adds r0, r1
	adds r0, 0x7
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	lsls r2, r5, 24
	asrs r2, 24
	adds r1, r2
	adds r1, 0x7
	movs r3, 0xC0
	lsls r3, 4
	adds r2, r3, 0
	orrs r4, r2
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E630: .4byte 0x00000259
_0810E634: .4byte gSaveBlock1
	thumb_func_end PCTurnOffEffect

	thumb_func_start DoLotteryCornerComputerEffect
DoLotteryCornerComputerEffect: @ 810E638
	push {r4,lr}
	ldr r4, _0810E674 @ =Task_LotteryCornerComputerEffect
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810E66C
	adds r0, r4, 0
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810E678 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x8]
	strh r0, [r1, 0xA]
	strh r2, [r1, 0xC]
	strh r2, [r1, 0xE]
	strh r2, [r1, 0x10]
_0810E66C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E674: .4byte Task_LotteryCornerComputerEffect
_0810E678: .4byte gTasks
	thumb_func_end DoLotteryCornerComputerEffect

	thumb_func_start Task_LotteryCornerComputerEffect
Task_LotteryCornerComputerEffect: @ 810E67C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0810E6A0 @ =gTasks
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0810E69A
	adds r0, r1, 0
	bl LotteryCornerComputerEffect
_0810E69A:
	pop {r0}
	bx r0
	.align 2, 0
_0810E6A0: .4byte gTasks
	thumb_func_end Task_LotteryCornerComputerEffect

	thumb_func_start LotteryCornerComputerEffect
LotteryCornerComputerEffect: @ 810E6A4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bne _0810E712
	movs r0, 0
	strh r0, [r4, 0xE]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0810E6DC
	ldr r2, _0810E6D4 @ =0x00000e9d
	movs r0, 0x12
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _0810E6D8 @ =0x00000ea5
	movs r0, 0x12
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	b _0810E6F2
	.align 2, 0
_0810E6D4: .4byte 0x00000e9d
_0810E6D8: .4byte 0x00000ea5
_0810E6DC:
	ldr r2, _0810E720 @ =0x00000e58
	movs r0, 0x12
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	movs r2, 0xE6
	lsls r2, 4
	movs r0, 0x12
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
_0810E6F2:
	bl DrawWholeMapView
	ldrh r0, [r4, 0x10]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _0810E712
	ldrb r0, [r4, 0xA]
	bl DestroyTask
_0810E712:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E720: .4byte 0x00000e58
	thumb_func_end LotteryCornerComputerEffect

	thumb_func_start EndLotteryCornerComputerEffect
EndLotteryCornerComputerEffect: @ 810E724
	push {lr}
	ldr r2, _0810E744 @ =0x00000e9d
	movs r0, 0x12
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _0810E748 @ =0x00000ea5
	movs r0, 0x12
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	pop {r0}
	bx r0
	.align 2, 0
_0810E744: .4byte 0x00000e9d
_0810E748: .4byte 0x00000ea5
	thumb_func_end EndLotteryCornerComputerEffect

	thumb_func_start SetDepartmentStoreFloorVar
SetDepartmentStoreFloorVar: @ 810E74C
	push {lr}
	ldr r0, _0810E768 @ =gSaveBlock1
	ldrb r0, [r0, 0x15]
	subs r0, 0x11
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x5
	bhi _0810E79C
	lsls r0, 2
	ldr r1, _0810E76C @ =_0810E770
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810E768: .4byte gSaveBlock1
_0810E76C: .4byte _0810E770
	.align 2, 0
_0810E770:
	.4byte _0810E79C
	.4byte _0810E788
	.4byte _0810E78C
	.4byte _0810E790
	.4byte _0810E794
	.4byte _0810E798
_0810E788:
	movs r1, 0x1
	b _0810E79E
_0810E78C:
	movs r1, 0x2
	b _0810E79E
_0810E790:
	movs r1, 0x3
	b _0810E79E
_0810E794:
	movs r1, 0x4
	b _0810E79E
_0810E798:
	movs r1, 0xF
	b _0810E79E
_0810E79C:
	movs r1, 0
_0810E79E:
	ldr r0, _0810E7A8 @ =0x00004043
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0810E7A8: .4byte 0x00004043
	thumb_func_end SetDepartmentStoreFloorVar

	thumb_func_start ScriptAddElevatorMenuItem
ScriptAddElevatorMenuItem: @ 810E7AC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r12, r2
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	ldr r0, _0810E81C @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	adds r2, r0, 0
	ldr r3, _0810E820 @ =gUnknown_03000760
	cmp r1, 0
	bne _0810E7E8
	movs r1, 0
	adds r5, r3, 0
	movs r4, 0x10
_0810E7D8:
	lsls r0, r1, 2
	adds r0, r5
	strb r4, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x13
	bls _0810E7D8
_0810E7E8:
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r3
	strb r6, [r0]
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r3
	strb r7, [r0, 0x1]
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r3
	mov r1, r12
	strb r1, [r0, 0x2]
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r3
	mov r1, r8
	strb r1, [r0, 0x3]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810E81C: .4byte gSpecialVar_0x8004
_0810E820: .4byte gUnknown_03000760
	thumb_func_end ScriptAddElevatorMenuItem

	thumb_func_start ScriptShowElevatorMenu
ScriptShowElevatorMenu: @ 810E824
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0810E868 @ =gUnknown_0203925A
	strb r4, [r5]
	ldr r0, _0810E86C @ =gUnknown_0203925B
	strb r4, [r0]
	movs r0, 0x10
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl ScriptAddElevatorMenuItem
	ldr r2, _0810E870 @ =gUnknown_03000760
	ldrb r0, [r2]
	cmp r0, 0x10
	beq _0810E85C
	adds r1, r5, 0
_0810E846:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x10
	bne _0810E846
_0810E85C:
	bl sub_810E874
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E868: .4byte gUnknown_0203925A
_0810E86C: .4byte gUnknown_0203925B
_0810E870: .4byte gUnknown_03000760
	thumb_func_end ScriptShowElevatorMenu

	thumb_func_start sub_810E874
sub_810E874: @ 810E874
	push {r4-r6,lr}
	sub sp, 0x8
	bl ScriptContext2_Enable
	ldr r4, _0810E8B8 @ =gUnknown_0203925A
	ldrb r0, [r4]
	cmp r0, 0x5
	bls _0810E8C0
	movs r0, 0
	movs r1, 0
	movs r2, 0x8
	movs r3, 0xB
	bl MenuDrawTextWindow
	movs r4, 0
	str r4, [sp]
	movs r0, 0x7
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x5
	bl InitMenu
	ldr r0, _0810E8BC @ =gUnknown_0203925C
	strb r4, [r0]
	bl sub_80F944C
	bl LoadScrollIndicatorPalette
	bl sub_810ECD4
	b _0810E8E8
	.align 2, 0
_0810E8B8: .4byte gUnknown_0203925A
_0810E8BC: .4byte gUnknown_0203925C
_0810E8C0:
	ldrb r3, [r4]
	lsls r3, 1
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x8
	bl MenuDrawTextWindow
	ldrb r3, [r4]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x7
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	bl InitMenu
_0810E8E8:
	movs r4, 0
	ldr r1, _0810E938 @ =gUnknown_03000760
	ldrb r0, [r1]
	cmp r0, 0x10
	beq _0810E924
	ldr r6, _0810E93C @ =gUnknown_083F8380
	adds r5, r1, 0
_0810E8F6:
	lsls r0, r4, 2
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	lsls r2, r4, 1
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bhi _0810E924
	lsls r0, r4, 2
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0x10
	bne _0810E8F6
_0810E924:
	bl sub_810E944
	ldr r0, _0810E940 @ =sub_810E984
	movs r1, 0x8
	bl CreateTask
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E938: .4byte gUnknown_03000760
_0810E93C: .4byte gUnknown_083F8380
_0810E940: .4byte sub_810E984
	thumb_func_end sub_810E874

	thumb_func_start sub_810E944
sub_810E944: @ 810E944
	push {lr}
	movs r0, 0x14
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x5
	bl MenuDrawTextWindow
	ldr r0, _0810E978 @ =gOtherText_NowOn
	movs r1, 0x15
	movs r2, 0x1
	movs r3, 0x40
	bl sub_8072BD8
	ldr r1, _0810E97C @ =gUnknown_083F8380
	ldr r0, _0810E980 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x15
	movs r2, 0x3
	movs r3, 0x40
	bl sub_8072BD8
	pop {r0}
	bx r0
	.align 2, 0
_0810E978: .4byte gOtherText_NowOn
_0810E97C: .4byte gUnknown_083F8380
_0810E980: .4byte gSpecialVar_0x8005
	thumb_func_end sub_810E944

	thumb_func_start sub_810E984
sub_810E984: @ 810E984
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0810EA44 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x40
	bne _0810E9B8
	ldr r1, _0810EA48 @ =gUnknown_0203925B
	ldrb r0, [r1]
	cmp r0, 0
	beq _0810E9B8
	subs r0, 0x1
	strb r0, [r1]
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursorNoWrap
	adds r0, r4, 0
	movs r1, 0x40
	bl sub_810EAC8
_0810E9B8:
	ldr r0, _0810EA44 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x80
	bne _0810E9E8
	ldr r2, _0810EA48 @ =gUnknown_0203925B
	ldrb r1, [r2]
	ldr r0, _0810EA4C @ =gUnknown_0203925A
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	beq _0810E9E8
	adds r0, r1, 0x1
	strb r0, [r2]
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	bl MoveMenuCursorNoWrap
	adds r0, r4, 0
	movs r1, 0x80
	bl sub_810EAC8
_0810E9E8:
	ldr r0, _0810EA44 @ =gMain
	ldrh r2, [r0, 0x2E]
	movs r5, 0x1
	adds r1, r5, 0
	ands r1, r2
	cmp r1, 0
	beq _0810EA94
	ldr r1, _0810EA50 @ =gUnknown_03000760
	ldr r4, _0810EA48 @ =gUnknown_0203925B
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	movs r1, 0x1
	ldrsb r1, [r0, r1]
	movs r2, 0x2
	ldrsb r2, [r0, r2]
	movs r3, 0x1
	negs r3, r3
	movs r0, 0x2
	str r0, [sp]
	str r5, [sp, 0x4]
	movs r0, 0
	bl saved_warp2_set_2
	ldr r1, _0810EA54 @ =gSpecialVar_0x8005
	ldrh r0, [r1]
	ldrb r2, [r4]
	cmp r0, r2
	bne _0810EA5C
	ldr r1, _0810EA58 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r6, 0
	bl sub_810EC9C
	b _0810EABC
	.align 2, 0
_0810EA44: .4byte gMain
_0810EA48: .4byte gUnknown_0203925B
_0810EA4C: .4byte gUnknown_0203925A
_0810EA50: .4byte gUnknown_03000760
_0810EA54: .4byte gSpecialVar_0x8005
_0810EA58: .4byte gScriptResult
_0810EA5C:
	ldr r0, _0810EA88 @ =gScriptResult
	strh r5, [r0]
	ldrb r0, [r4]
	strh r0, [r1]
	bl sub_810EBEC
	ldr r0, _0810EA8C @ =gScriptLastTalked
	ldrb r0, [r0]
	ldr r2, _0810EA90 @ =gSaveBlock1
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	movs r3, 0x1
	bl FieldObjectTurnByLocalIdAndMap
	bl sub_810EEDC
	bl MenuZeroFillScreen
	adds r0, r6, 0
	bl DestroyTask
	b _0810EABC
	.align 2, 0
_0810EA88: .4byte gScriptResult
_0810EA8C: .4byte gScriptLastTalked
_0810EA90: .4byte gSaveBlock1
_0810EA94:
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _0810EABC
	ldr r0, _0810EAC4 @ =gScriptResult
	strh r1, [r0]
	movs r0, 0x5
	bl PlaySE
	bl sub_810EEDC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r6, 0
	bl sub_810EC9C
_0810EABC:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810EAC4: .4byte gScriptResult
	thumb_func_end sub_810E984

	thumb_func_start sub_810EAC8
sub_810EAC8: @ 810EAC8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	lsls r1, 24
	lsrs r1, 24
	adds r3, r1, 0
	movs r7, 0
	movs r4, 0
	ldr r0, _0810EAEC @ =gUnknown_0203925A
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _0810EAF0
	movs r0, 0
	b _0810EB78
	.align 2, 0
_0810EAEC: .4byte gUnknown_0203925A
_0810EAF0:
	cmp r1, 0x40
	bne _0810EB04
	cmp r2, 0
	bne _0810EB18
	ldr r0, _0810EB00 @ =gUnknown_0203925B
	ldrb r4, [r0]
	movs r7, 0x1
	b _0810EB1C
	.align 2, 0
_0810EB00: .4byte gUnknown_0203925B
_0810EB04:
	cmp r3, 0x80
	bne _0810EB18
	cmp r5, 0x4
	bne _0810EB18
	ldr r0, _0810EB84 @ =gUnknown_0203925B
	ldrb r0, [r0]
	subs r0, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r7, 0x1
_0810EB18:
	cmp r7, 0
	beq _0810EB76
_0810EB1C:
	adds r0, r4, 0
	movs r1, 0x5
	bl sub_810EB90
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x7
	movs r3, 0xA
	bl MenuFillWindowRectWithBlankTile
	movs r5, 0
	ldr r2, _0810EB88 @ =gUnknown_03000760
	lsls r1, r4, 2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x10
	beq _0810EB76
	ldr r0, _0810EB8C @ =gUnknown_083F8380
	mov r8, r0
	adds r6, r2, 0
_0810EB44:
	adds r0, r1, r6
	ldrb r0, [r0]
	lsls r0, 2
	add r0, r8
	ldr r0, [r0]
	lsls r2, r5, 1
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bhi _0810EB76
	lsls r1, r4, 2
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, 0x10
	bne _0810EB44
_0810EB76:
	adds r0, r7, 0
_0810EB78:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810EB84: .4byte gUnknown_0203925B
_0810EB88: .4byte gUnknown_03000760
_0810EB8C: .4byte gUnknown_083F8380
	thumb_func_end sub_810EAC8

	thumb_func_start sub_810EB90
sub_810EB90: @ 810EB90
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r4, 0
	bne _0810EBB4
	ldr r0, _0810EBB0 @ =gUnknown_0203925C
	ldrb r1, [r0]
	movs r2, 0x2
	eors r1, r2
	strb r1, [r0]
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	b _0810EBB8
	.align 2, 0
_0810EBB0: .4byte gUnknown_0203925C
_0810EBB4:
	bl sub_810ECB0
_0810EBB8:
	adds r1, r4, r5
	ldr r0, _0810EBC8 @ =gUnknown_0203925A
	ldrb r0, [r0]
	cmp r1, r0
	bge _0810EBCC
	bl sub_810ECD4
	b _0810EBE0
	.align 2, 0
_0810EBC8: .4byte gUnknown_0203925A
_0810EBCC:
	cmp r1, r0
	bne _0810EBE0
	ldr r0, _0810EBE8 @ =gUnknown_0203925C
	ldrb r1, [r0]
	movs r2, 0x1
	eors r1, r2
	strb r1, [r0]
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
_0810EBE0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810EBE8: .4byte gUnknown_0203925C
	thumb_func_end sub_810EB90

	thumb_func_start sub_810EBEC
sub_810EBEC: @ 810EBEC
	push {lr}
	ldr r0, _0810EC2C @ =sub_810EC34
	movs r1, 0x9
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810EC30 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	movs r2, 0x1
	strh r2, [r1, 0x8]
	strh r0, [r1, 0xA]
	strh r0, [r1, 0xC]
	strh r0, [r1, 0xE]
	strh r2, [r1, 0x10]
	movs r0, 0x3
	strh r0, [r1, 0x12]
	movs r0, 0
	bl SetCameraPanningCallback
	bl sub_810ECFC
	movs r0, 0x59
	bl PlaySE
	pop {r0}
	bx r0
	.align 2, 0
_0810EC2C: .4byte sub_810EC34
_0810EC30: .4byte gTasks
	thumb_func_end sub_810EBEC

	thumb_func_start sub_810EC34
sub_810EC34: @ 810EC34
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0810EC98 @ =gTasks
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _0810EC92
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0810EC92
	ldrh r0, [r4, 0x10]
	negs r0, r0
	strh r0, [r4, 0x10]
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	movs r0, 0
	bl SetCameraPanning
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x17
	bne _0810EC92
	movs r0, 0x49
	bl PlaySE
	adds r0, r5, 0
	bl sub_810EC9C
	bl InstallCameraPanAheadCallback
_0810EC92:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810EC98: .4byte gTasks
	thumb_func_end sub_810EC34

	thumb_func_start sub_810EC9C
sub_810EC9C: @ 810EC9C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_810EC9C

	thumb_func_start sub_810ECB0
sub_810ECB0: @ 810ECB0
	push {lr}
	ldr r2, _0810ECD0 @ =gUnknown_0203925C
	ldrb r1, [r2]
	lsrs r0, r1, 1
	cmp r0, 0x1
	beq _0810ECCC
	movs r0, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0
	movs r1, 0x24
	movs r2, 0x8
	bl CreateVerticalScrollIndicators
_0810ECCC:
	pop {r0}
	bx r0
	.align 2, 0
_0810ECD0: .4byte gUnknown_0203925C
	thumb_func_end sub_810ECB0

	thumb_func_start sub_810ECD4
sub_810ECD4: @ 810ECD4
	push {lr}
	ldr r2, _0810ECF8 @ =gUnknown_0203925C
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810ECF2
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	movs r1, 0x24
	movs r2, 0x48
	bl CreateVerticalScrollIndicators
_0810ECF2:
	pop {r0}
	bx r0
	.align 2, 0
_0810ECF8: .4byte gUnknown_0203925C
	thumb_func_end sub_810ECD4

	thumb_func_start sub_810ECFC
sub_810ECFC: @ 810ECFC
	push {r4,lr}
	ldr r4, _0810ED38 @ =sub_810ED40
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810ED30
	adds r0, r4, 0
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810ED3C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x8]
	strh r0, [r1, 0xA]
	strh r2, [r1, 0xC]
	strh r2, [r1, 0xE]
	strh r2, [r1, 0x10]
_0810ED30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810ED38: .4byte sub_810ED40
_0810ED3C: .4byte gTasks
	thumb_func_end sub_810ECFC

	thumb_func_start sub_810ED40
sub_810ED40: @ 810ED40
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0810ED5C @ =gTasks
	adds r0, r1
	bl sub_810ED60
	pop {r0}
	bx r0
	.align 2, 0
_0810ED5C: .4byte gTasks
	thumb_func_end sub_810ED40

	thumb_func_start sub_810ED60
sub_810ED60: @ 810ED60
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0x8
	beq _0810ED6E
	b _0810EEB2
_0810ED6E:
	movs r0, 0
	strh r0, [r5, 0xE]
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0810EE14
	ldr r2, _0810EDFC @ =0x00000e68
	movs r0, 0x7
	movs r1, 0x7
	bl MapGridSetMetatileIdAt
	ldr r4, _0810EE00 @ =0x00000e69
	movs r0, 0x8
	movs r1, 0x7
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x7
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EE04 @ =0x00000e6a
	movs r0, 0xA
	movs r1, 0x7
	bl MapGridSetMetatileIdAt
	movs r2, 0xE7
	lsls r2, 4
	movs r0, 0x7
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	adds r4, 0x8
	movs r0, 0x8
	movs r1, 0x8
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x8
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EE08 @ =0x00000e72
	movs r0, 0xA
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EE0C @ =0x00000e78
	movs r0, 0x7
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	adds r4, 0x8
	movs r0, 0x8
	movs r1, 0x9
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x9
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EE10 @ =0x00000e7a
	movs r0, 0xA
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	b _0810EE92
	.align 2, 0
_0810EDFC: .4byte 0x00000e68
_0810EE00: .4byte 0x00000e69
_0810EE04: .4byte 0x00000e6a
_0810EE08: .4byte 0x00000e72
_0810EE0C: .4byte 0x00000e78
_0810EE10: .4byte 0x00000e7a
_0810EE14:
	ldr r2, _0810EEC0 @ =0x00000e6b
	movs r0, 0x7
	movs r1, 0x7
	bl MapGridSetMetatileIdAt
	ldr r4, _0810EEC4 @ =0x00000e6c
	movs r0, 0x8
	movs r1, 0x7
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x7
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EEC8 @ =0x00000e6d
	movs r0, 0xA
	movs r1, 0x7
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EECC @ =0x00000e73
	movs r0, 0x7
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	adds r4, 0x8
	movs r0, 0x8
	movs r1, 0x8
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x8
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EED0 @ =0x00000e75
	movs r0, 0xA
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EED4 @ =0x00000e7b
	movs r0, 0x7
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	adds r4, 0x8
	movs r0, 0x8
	movs r1, 0x9
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x9
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EED8 @ =0x00000e7d
	movs r0, 0xA
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
_0810EE92:
	bl DrawWholeMapView
	ldrh r0, [r5, 0x10]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r5, 0x10]
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _0810EEB2
	ldrb r0, [r5, 0xA]
	bl DestroyTask
_0810EEB2:
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810EEC0: .4byte 0x00000e6b
_0810EEC4: .4byte 0x00000e6c
_0810EEC8: .4byte 0x00000e6d
_0810EECC: .4byte 0x00000e73
_0810EED0: .4byte 0x00000e75
_0810EED4: .4byte 0x00000e7b
_0810EED8: .4byte 0x00000e7d
	thumb_func_end sub_810ED60

	thumb_func_start sub_810EEDC
sub_810EEDC: @ 810EEDC
	push {r4,lr}
	ldr r4, _0810EF08 @ =gUnknown_0203925C
	ldrb r1, [r4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810EEF0
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
_0810EEF0:
	ldrb r0, [r4]
	lsrs r0, 1
	cmp r0, 0x1
	bne _0810EEFE
	movs r0, 0
	bl DestroyVerticalScrollIndicator
_0810EEFE:
	bl BuyMenuFreeMemory
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810EF08: .4byte gUnknown_0203925C
	thumb_func_end sub_810EEDC

	thumb_func_start SetTrickHouseEndRoomFlag
SetTrickHouseEndRoomFlag: @ 810EF0C
	push {lr}
	ldr r1, _0810EF1C @ =gSpecialVar_0x8004
	ldr r0, _0810EF20 @ =0x00000259
	strh r0, [r1]
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0810EF1C: .4byte gSpecialVar_0x8004
_0810EF20: .4byte 0x00000259
	thumb_func_end SetTrickHouseEndRoomFlag

	thumb_func_start ResetTrickHouseEndRoomFlag
ResetTrickHouseEndRoomFlag: @ 810EF24
	push {lr}
	ldr r1, _0810EF34 @ =gSpecialVar_0x8004
	ldr r0, _0810EF38 @ =0x00000259
	strh r0, [r1]
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_0810EF34: .4byte gSpecialVar_0x8004
_0810EF38: .4byte 0x00000259
	thumb_func_end ResetTrickHouseEndRoomFlag

	thumb_func_start CheckLeadMonCool
CheckLeadMonCool: @ 810EF3C
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810EF5C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x16
	bl GetMonData
	cmp r0, 0xC7
	bls _0810EF60
	movs r0, 0x1
	b _0810EF62
	.align 2, 0
_0810EF5C: .4byte gPlayerParty
_0810EF60:
	movs r0, 0
_0810EF62:
	pop {r1}
	bx r1
	thumb_func_end CheckLeadMonCool

	thumb_func_start CheckLeadMonBeauty
CheckLeadMonBeauty: @ 810EF68
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810EF88 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x17
	bl GetMonData
	cmp r0, 0xC7
	bls _0810EF8C
	movs r0, 0x1
	b _0810EF8E
	.align 2, 0
_0810EF88: .4byte gPlayerParty
_0810EF8C:
	movs r0, 0
_0810EF8E:
	pop {r1}
	bx r1
	thumb_func_end CheckLeadMonBeauty

	thumb_func_start CheckLeadMonCute
CheckLeadMonCute: @ 810EF94
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810EFB4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x18
	bl GetMonData
	cmp r0, 0xC7
	bls _0810EFB8
	movs r0, 0x1
	b _0810EFBA
	.align 2, 0
_0810EFB4: .4byte gPlayerParty
_0810EFB8:
	movs r0, 0
_0810EFBA:
	pop {r1}
	bx r1
	thumb_func_end CheckLeadMonCute

	thumb_func_start CheckLeadMonSmart
CheckLeadMonSmart: @ 810EFC0
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810EFE0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x21
	bl GetMonData
	cmp r0, 0xC7
	bls _0810EFE4
	movs r0, 0x1
	b _0810EFE6
	.align 2, 0
_0810EFE0: .4byte gPlayerParty
_0810EFE4:
	movs r0, 0
_0810EFE6:
	pop {r1}
	bx r1
	thumb_func_end CheckLeadMonSmart

	thumb_func_start CheckLeadMonTough
CheckLeadMonTough: @ 810EFEC
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F00C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2F
	bl GetMonData
	cmp r0, 0xC7
	bls _0810F010
	movs r0, 0x1
	b _0810F012
	.align 2, 0
_0810F00C: .4byte gPlayerParty
_0810F010:
	movs r0, 0
_0810F012:
	pop {r1}
	bx r1
	thumb_func_end CheckLeadMonTough

	thumb_func_start IsGrassTypeInParty
IsGrassTypeInParty: @ 810F018
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _0810F068 @ =gBaseStats
_0810F01E:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0810F06C @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _0810F074
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0810F074
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1, 0x6]
	cmp r0, 0xC
	beq _0810F060
	ldrb r0, [r1, 0x7]
	cmp r0, 0xC
	bne _0810F074
_0810F060:
	ldr r1, _0810F070 @ =gScriptResult
	movs r0, 0x1
	b _0810F082
	.align 2, 0
_0810F068: .4byte gBaseStats
_0810F06C: .4byte gPlayerParty
_0810F070: .4byte gScriptResult
_0810F074:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _0810F01E
	ldr r1, _0810F08C @ =gScriptResult
	movs r0, 0
_0810F082:
	strh r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810F08C: .4byte gScriptResult
	thumb_func_end IsGrassTypeInParty

	thumb_func_start ShowGlassWorkshopMenu
ShowGlassWorkshopMenu: @ 810F090
	push {r4,r5,lr}
	sub sp, 0x8
	bl ScriptContext2_Enable
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0xB
	bl MenuDrawTextWindow
	movs r4, 0
	str r4, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x5
	bl InitMenu
	ldr r0, _0810F104 @ =gUnknown_0203925C
	strb r4, [r0]
	bl sub_80F944C
	bl LoadScrollIndicatorPalette
	bl sub_810F2B4
	ldr r5, _0810F108 @ =gUnknown_083F83C0
_0810F0CA:
	lsls r0, r4, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r2, r4, 1
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _0810F0CA
	ldr r1, _0810F10C @ =gUnknown_0203925B
	movs r0, 0
	strb r0, [r1]
	ldr r1, _0810F110 @ =gUnknown_0203925A
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _0810F114 @ =sub_810F118
	movs r1, 0x8
	bl CreateTask
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F104: .4byte gUnknown_0203925C
_0810F108: .4byte gUnknown_083F83C0
_0810F10C: .4byte gUnknown_0203925B
_0810F110: .4byte gUnknown_0203925A
_0810F114: .4byte sub_810F118
	thumb_func_end ShowGlassWorkshopMenu

	thumb_func_start sub_810F118
sub_810F118: @ 810F118
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0810F1E4 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x40
	bne _0810F14A
	ldr r1, _0810F1E8 @ =gUnknown_0203925B
	ldrb r0, [r1]
	cmp r0, 0
	beq _0810F14A
	subs r0, 0x1
	strb r0, [r1]
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursorNoWrap
	adds r0, r4, 0
	movs r1, 0x40
	bl sub_810F1F4
_0810F14A:
	ldr r0, _0810F1E4 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x80
	bne _0810F17A
	ldr r2, _0810F1E8 @ =gUnknown_0203925B
	ldrb r1, [r2]
	ldr r0, _0810F1EC @ =gUnknown_0203925A
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	beq _0810F17A
	adds r0, r1, 0x1
	strb r0, [r2]
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	bl MoveMenuCursorNoWrap
	adds r0, r4, 0
	movs r1, 0x80
	bl sub_810F1F4
_0810F17A:
	ldr r4, _0810F1E4 @ =gMain
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810F1AE
	bl sub_8072DEC
	ldr r0, _0810F1F0 @ =gScriptResult
	ldr r1, _0810F1E8 @ =gUnknown_0203925B
	ldrb r1, [r1]
	strh r1, [r0]
	movs r0, 0x5
	bl PlaySE
	bl sub_810EEDC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl sub_810EC9C
_0810F1AE:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810F1DE
	bl sub_8072DEC
	ldr r1, _0810F1F0 @ =gScriptResult
	movs r0, 0x7F
	strh r0, [r1]
	movs r0, 0x5
	bl PlaySE
	bl sub_810EEDC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl sub_810EC9C
_0810F1DE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F1E4: .4byte gMain
_0810F1E8: .4byte gUnknown_0203925B
_0810F1EC: .4byte gUnknown_0203925A
_0810F1F0: .4byte gScriptResult
	thumb_func_end sub_810F118

	thumb_func_start sub_810F1F4
sub_810F1F4: @ 810F1F4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	lsls r1, 24
	lsrs r1, 24
	adds r3, r1, 0
	movs r6, 0
	movs r4, 0
	ldr r0, _0810F214 @ =gUnknown_0203925A
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _0810F218
	movs r0, 0
	b _0810F282
	.align 2, 0
_0810F214: .4byte gUnknown_0203925A
_0810F218:
	cmp r1, 0x40
	bne _0810F22C
	cmp r2, 0
	bne _0810F240
	ldr r0, _0810F228 @ =gUnknown_0203925B
	ldrb r4, [r0]
	movs r6, 0x1
	b _0810F244
	.align 2, 0
_0810F228: .4byte gUnknown_0203925B
_0810F22C:
	cmp r3, 0x80
	bne _0810F240
	cmp r5, 0x4
	bne _0810F240
	ldr r0, _0810F288 @ =gUnknown_0203925B
	ldrb r0, [r0]
	subs r0, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r6, 0x1
_0810F240:
	cmp r6, 0
	beq _0810F280
_0810F244:
	adds r0, r4, 0
	movs r1, 0x5
	bl GlassWorkshopUpdateScrollIndicators
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x9
	movs r3, 0xA
	bl MenuFillWindowRectWithBlankTile
	movs r5, 0
	ldr r7, _0810F28C @ =gUnknown_083F83C0
_0810F25C:
	lsls r0, r4, 2
	adds r0, r7
	ldr r0, [r0]
	lsls r2, r5, 1
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _0810F25C
_0810F280:
	adds r0, r6, 0
_0810F282:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810F288: .4byte gUnknown_0203925B
_0810F28C: .4byte gUnknown_083F83C0
	thumb_func_end sub_810F1F4

	thumb_func_start sub_810F290
sub_810F290: @ 810F290
	push {lr}
	ldr r2, _0810F2B0 @ =gUnknown_0203925C
	ldrb r1, [r2]
	lsrs r0, r1, 1
	cmp r0, 0x1
	beq _0810F2AC
	movs r0, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0
	movs r1, 0x2C
	movs r2, 0x8
	bl CreateVerticalScrollIndicators
_0810F2AC:
	pop {r0}
	bx r0
	.align 2, 0
_0810F2B0: .4byte gUnknown_0203925C
	thumb_func_end sub_810F290

	thumb_func_start sub_810F2B4
sub_810F2B4: @ 810F2B4
	push {lr}
	ldr r2, _0810F2D8 @ =gUnknown_0203925C
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810F2D2
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	movs r1, 0x2C
	movs r2, 0x58
	bl CreateVerticalScrollIndicators
_0810F2D2:
	pop {r0}
	bx r0
	.align 2, 0
_0810F2D8: .4byte gUnknown_0203925C
	thumb_func_end sub_810F2B4

	thumb_func_start GlassWorkshopUpdateScrollIndicators
GlassWorkshopUpdateScrollIndicators: @ 810F2DC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r4, 0
	bne _0810F300
	ldr r0, _0810F2FC @ =gUnknown_0203925C
	ldrb r1, [r0]
	movs r2, 0x2
	eors r1, r2
	strb r1, [r0]
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	b _0810F304
	.align 2, 0
_0810F2FC: .4byte gUnknown_0203925C
_0810F300:
	bl sub_810F290
_0810F304:
	adds r1, r4, r5
	ldr r0, _0810F314 @ =gUnknown_0203925A
	ldrb r0, [r0]
	cmp r1, r0
	bge _0810F318
	bl sub_810F2B4
	b _0810F32C
	.align 2, 0
_0810F314: .4byte gUnknown_0203925A
_0810F318:
	cmp r1, r0
	bne _0810F32C
	ldr r0, _0810F334 @ =gUnknown_0203925C
	ldrb r1, [r0]
	movs r2, 0x1
	eors r1, r2
	strb r1, [r0]
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
_0810F32C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F334: .4byte gUnknown_0203925C
	thumb_func_end GlassWorkshopUpdateScrollIndicators

	thumb_func_start SpawnCameraDummy
SpawnCameraDummy: @ 810F338
	push {lr}
	sub sp, 0x8
	ldr r0, _0810F380 @ =gSaveBlock1
	ldrh r3, [r0]
	adds r3, 0x7
	lsls r3, 16
	asrs r3, 16
	ldrh r0, [r0, 0x2]
	adds r0, 0x7
	lsls r0, 16
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x3
	str r0, [sp, 0x4]
	movs r0, 0x7
	movs r1, 0x8
	movs r2, 0x7F
	bl SpawnSpecialFieldObjectParametrized
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810F384 @ =gMapObjects
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x1]
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x1]
	ldrb r0, [r1, 0x4]
	bl CameraObjectSetFollowedObjectId
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0810F380: .4byte gSaveBlock1
_0810F384: .4byte gMapObjects
	thumb_func_end SpawnCameraDummy

	thumb_func_start RemoveCameraDummy
RemoveCameraDummy: @ 810F388
	push {lr}
	bl GetPlayerAvatarObjectId
	lsls r0, 24
	lsrs r0, 24
	bl CameraObjectSetFollowedObjectId
	ldr r0, _0810F3A8 @ =gSaveBlock1
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x7F
	bl RemoveFieldObjectByLocalIdAndMap
	pop {r0}
	bx r0
	.align 2, 0
_0810F3A8: .4byte gSaveBlock1
	thumb_func_end RemoveCameraDummy

	thumb_func_start GetPokeblockNameByMonNature
GetPokeblockNameByMonNature: @ 810F3AC
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F3D4 @ =gPlayerParty
	adds r0, r1
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810F3D8 @ =gStringVar1
	bl sub_810CB68
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0810F3D4: .4byte gPlayerParty
_0810F3D8: .4byte gStringVar1
	thumb_func_end GetPokeblockNameByMonNature

	thumb_func_start GetSecretBaseNearbyMapName
GetSecretBaseNearbyMapName: @ 810F3DC
	push {r4,lr}
	ldr r4, _0810F3FC @ =gStringVar1
	ldr r0, _0810F400 @ =0x00004026
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	bl sub_80FBFB4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810F3FC: .4byte gStringVar1
_0810F400: .4byte 0x00004026
	thumb_func_end GetSecretBaseNearbyMapName

	thumb_func_start sub_810F404
sub_810F404: @ 810F404
	push {lr}
	movs r0, 0x20
	bl GetGameStat
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_810F404

	thumb_func_start sub_810F414
sub_810F414: @ 810F414
	push {lr}
	ldr r0, _0810F420 @ =gStringVar1
	bl sub_8135FF4
	pop {r0}
	bx r0
	.align 2, 0
_0810F420: .4byte gStringVar1
	thumb_func_end sub_810F414

	thumb_func_start sub_810F424
sub_810F424: @ 810F424
	push {r4,r5,lr}
	ldr r2, _0810F458 @ =gSaveBlock1
	ldr r1, _0810F45C @ =0x00002dd4
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r1, 25
	ldr r0, _0810F460 @ =0x00002dd6
	adds r2, r0
	lsrs r1, 25
	ldrh r2, [r2]
	adds r1, r2
	ldr r2, _0810F464 @ =gUnknown_083F83E0
	ldr r0, _0810F468 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	adds r5, r1, r0
	movs r0, 0x2
	bl GetPriceReduction
	lsls r0, 24
	cmp r0, 0
	bne _0810F470
	ldr r4, _0810F46C @ =gUnknown_083F83EC
	b _0810F472
	.align 2, 0
_0810F458: .4byte gSaveBlock1
_0810F45C: .4byte 0x00002dd4
_0810F460: .4byte 0x00002dd6
_0810F464: .4byte gUnknown_083F83E0
_0810F468: .4byte gSpecialVar_0x8004
_0810F46C: .4byte gUnknown_083F83EC
_0810F470:
	ldr r4, _0810F484 @ =gUnknown_083F83F8
_0810F472:
	adds r0, r5, 0
	movs r1, 0xC
	bl __umodsi3
	adds r0, r4
	ldrb r0, [r0]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810F484: .4byte gUnknown_083F83F8
	thumb_func_end sub_810F424

	thumb_func_start sub_810F488
sub_810F488: @ 810F488
	push {lr}
	ldr r1, _0810F4A0 @ =gSpecialVar_0x8004
	ldr r0, _0810F4A4 @ =0x00000277
	strh r0, [r1]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F4A8
	movs r0, 0x1
	b _0810F4AA
	.align 2, 0
_0810F4A0: .4byte gSpecialVar_0x8004
_0810F4A4: .4byte 0x00000277
_0810F4A8:
	movs r0, 0
_0810F4AA:
	pop {r1}
	bx r1
	thumb_func_end sub_810F488

	thumb_func_start sub_810F4B0
sub_810F4B0: @ 810F4B0
	push {lr}
	ldr r1, _0810F4C8 @ =gSpecialVar_0x8004
	movs r0, 0x9E
	lsls r0, 2
	strh r0, [r1]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F4CC
	movs r0, 0x1
	b _0810F4CE
	.align 2, 0
_0810F4C8: .4byte gSpecialVar_0x8004
_0810F4CC:
	movs r0, 0
_0810F4CE:
	pop {r1}
	bx r1
	thumb_func_end sub_810F4B0

	thumb_func_start sub_810F4D4
sub_810F4D4: @ 810F4D4
	push {lr}
	ldr r1, _0810F4EC @ =gSpecialVar_0x8004
	ldr r0, _0810F4F0 @ =0x00000279
	strh r0, [r1]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F4F4
	movs r0, 0x1
	b _0810F4F6
	.align 2, 0
_0810F4EC: .4byte gSpecialVar_0x8004
_0810F4F0: .4byte 0x00000279
_0810F4F4:
	movs r0, 0
_0810F4F6:
	pop {r1}
	bx r1
	thumb_func_end sub_810F4D4

	thumb_func_start sub_810F4FC
sub_810F4FC: @ 810F4FC
	push {lr}
	ldr r1, _0810F514 @ =gSpecialVar_0x8004
	ldr r0, _0810F518 @ =0x0000027a
	strh r0, [r1]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F51C
	movs r0, 0x1
	b _0810F51E
	.align 2, 0
_0810F514: .4byte gSpecialVar_0x8004
_0810F518: .4byte 0x0000027a
_0810F51C:
	movs r0, 0
_0810F51E:
	pop {r1}
	bx r1
	thumb_func_end sub_810F4FC

	thumb_func_start LeadMonHasEffortRibbon
LeadMonHasEffortRibbon: @ 810F524
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F548 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x47
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0810F548: .4byte gPlayerParty
	thumb_func_end LeadMonHasEffortRibbon

	thumb_func_start GivLeadMonEffortRibbon
GivLeadMonEffortRibbon: @ 810F54C
	push {lr}
	sub sp, 0x4
	movs r0, 0x2A
	bl IncrementGameStat
	ldr r0, _0810F580 @ =0x0000083b
	bl FlagSet
	movs r1, 0x1
	mov r0, sp
	strb r1, [r0]
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F584 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x47
	mov r2, sp
	bl SetMonData
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0810F580: .4byte 0x0000083b
_0810F584: .4byte gPlayerParty
	thumb_func_end GivLeadMonEffortRibbon

	thumb_func_start GetLeadMonEVCount
GetLeadMonEVCount: @ 810F588
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F5AC @ =gPlayerParty
	adds r0, r1
	bl GetMonEVCount
	lsls r0, 16
	ldr r1, _0810F5B0 @ =0x01fd0000
	cmp r0, r1
	bhi _0810F5B4
	movs r0, 0
	b _0810F5B6
	.align 2, 0
_0810F5AC: .4byte gPlayerParty
_0810F5B0: .4byte 0x01fd0000
_0810F5B4:
	movs r0, 0x1
_0810F5B6:
	pop {r1}
	bx r1
	thumb_func_end GetLeadMonEVCount

	thumb_func_start sub_810F5BC
sub_810F5BC: @ 810F5BC
	push {lr}
	movs r0, 0xC7
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0810F610
	ldr r0, _0810F5E8 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	movs r0, 0x83
	lsls r0, 3
	cmp r1, r0
	bne _0810F610
	subs r0, 0x75
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F5F0
	ldr r0, _0810F5EC @ =0x0000409a
	movs r1, 0x4
	b _0810F602
	.align 2, 0
_0810F5E8: .4byte gSaveBlock1
_0810F5EC: .4byte 0x0000409a
_0810F5F0:
	movs r0, 0xE9
	lsls r0, 2
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F610
	ldr r0, _0810F60C @ =0x0000409a
	movs r1, 0x5
_0810F602:
	bl VarSet
	movs r0, 0x1
	b _0810F612
	.align 2, 0
_0810F60C: .4byte 0x0000409a
_0810F610:
	movs r0, 0
_0810F612:
	pop {r1}
	bx r1
	thumb_func_end sub_810F5BC

	thumb_func_start sub_810F618
sub_810F618: @ 810F618
	push {lr}
	ldr r0, _0810F624 @ =0x0000085f
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0810F624: .4byte 0x0000085f
	thumb_func_end sub_810F618

	thumb_func_start PutZigzagoonInPlayerParty
PutZigzagoonInPlayerParty: @ 810F628
	push {r4,r5,lr}
	sub sp, 0x14
	ldr r5, _0810F690 @ =gPlayerParty
	movs r1, 0x90
	lsls r1, 1
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r5, 0
	movs r2, 0x7
	movs r3, 0x20
	bl CreateMon
	movs r1, 0x1
	add r0, sp, 0x10
	strh r1, [r0]
	adds r0, r5, 0
	movs r1, 0x2E
	add r2, sp, 0x10
	bl SetMonData
	add r1, sp, 0x10
	movs r0, 0x21
	strh r0, [r1]
	adds r0, r5, 0
	movs r1, 0xD
	add r2, sp, 0x10
	bl SetMonData
	add r0, sp, 0x10
	strh r4, [r0]
	adds r0, r5, 0
	movs r1, 0xE
	add r2, sp, 0x10
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0xF
	add r2, sp, 0x10
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0x10
	add r2, sp, 0x10
	bl SetMonData
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F690: .4byte gPlayerParty
	thumb_func_end PutZigzagoonInPlayerParty

	thumb_func_start IsStarterInParty
IsStarterInParty: @ 810F694
	push {r4-r6,lr}
	ldr r0, _0810F6D0 @ =0x00004023
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl GetStarterPokemon
	lsls r0, 16
	lsrs r6, r0, 16
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	cmp r4, r5
	bcs _0810F6E2
_0810F6B6:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0810F6D4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	cmp r0, r6
	bne _0810F6D8
	movs r0, 0x1
	b _0810F6E4
	.align 2, 0
_0810F6D0: .4byte 0x00004023
_0810F6D4: .4byte gPlayerParty
_0810F6D8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _0810F6B6
_0810F6E2:
	movs r0, 0
_0810F6E4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsStarterInParty

	thumb_func_start CheckFreePokemonStorageSpace
CheckFreePokemonStorageSpace: @ 810F6EC
	push {r4-r6,lr}
	movs r5, 0
_0810F6F0:
	movs r4, 0
	lsls r1, r5, 2
	adds r1, r5
	lsls r0, r1, 4
	subs r0, r1
	lsls r6, r0, 5
_0810F6FC:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	ldr r1, _0810F718 @ =gPokemonStorage + 0x4
	adds r0, r1
	adds r0, r6, r0
	movs r1, 0xB
	movs r2, 0
	bl GetBoxMonData
	cmp r0, 0
	bne _0810F71C
	movs r0, 0x1
	b _0810F732
	.align 2, 0
_0810F718: .4byte gPokemonStorage + 0x4
_0810F71C:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bls _0810F6FC
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xD
	bls _0810F6F0
	movs r0, 0
_0810F732:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CheckFreePokemonStorageSpace

	thumb_func_start IsPokerusInParty
IsPokerusInParty: @ 810F738
	push {lr}
	ldr r0, _0810F74C @ =gPlayerParty
	movs r1, 0x3F
	bl CheckPartyPokerus
	lsls r0, 24
	cmp r0, 0
	beq _0810F750
	movs r0, 0x1
	b _0810F752
	.align 2, 0
_0810F74C: .4byte gPlayerParty
_0810F750:
	movs r0, 0
_0810F752:
	pop {r1}
	bx r1
	thumb_func_end IsPokerusInParty

	thumb_func_start sub_810F758
sub_810F758: @ 810F758
	push {lr}
	ldr r0, _0810F798 @ =sub_810F7A8
	movs r1, 0x9
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810F79C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0810F7A0 @ =gSpecialVar_0x8005
	ldrh r2, [r0]
	movs r0, 0
	strh r2, [r1, 0x8]
	strh r0, [r1, 0xA]
	strh r0, [r1, 0xC]
	strh r0, [r1, 0xE]
	ldr r0, _0810F7A4 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	strh r0, [r1, 0x10]
	movs r0, 0x5
	strh r0, [r1, 0x12]
	movs r0, 0
	bl SetCameraPanningCallback
	movs r0, 0xD6
	bl PlaySE
	pop {r0}
	bx r0
	.align 2, 0
_0810F798: .4byte sub_810F7A8
_0810F79C: .4byte gTasks
_0810F7A0: .4byte gSpecialVar_0x8005
_0810F7A4: .4byte gSpecialVar_0x8004
	thumb_func_end sub_810F758

	thumb_func_start sub_810F7A8
sub_810F7A8: @ 810F7A8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0810F810 @ =gTasks
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _0810F808
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0810F808
	ldrh r0, [r4, 0x8]
	negs r0, r0
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0x10]
	negs r0, r0
	strh r0, [r4, 0x10]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	bl SetCameraPanning
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	bne _0810F808
	adds r0, r5, 0
	bl sub_810F814
	bl InstallCameraPanAheadCallback
_0810F808:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F810: .4byte gTasks
	thumb_func_end sub_810F7A8

	thumb_func_start sub_810F814
sub_810F814: @ 810F814
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_810F814

	thumb_func_start sub_810F828
sub_810F828: @ 810F828
	push {lr}
	movs r0, 0xAE
	lsls r0, 2
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_810F828

	thumb_func_start SetRoute119Weather
SetRoute119Weather: @ 810F83C
	push {lr}
	bl get_map_light_from_warp0
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810F858
	movs r0, 0x14
	bl SetSav1Weather
_0810F858:
	pop {r0}
	bx r0
	thumb_func_end SetRoute119Weather

	thumb_func_start SetRoute123Weather
SetRoute123Weather: @ 810F85C
	push {lr}
	bl get_map_light_from_warp0
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810F878
	movs r0, 0x15
	bl SetSav1Weather
_0810F878:
	pop {r0}
	bx r0
	thumb_func_end SetRoute123Weather

	thumb_func_start GetLeadMonIndex
GetLeadMonIndex: @ 810F87C
	push {r4-r6,lr}
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	cmp r5, r6
	bcs _0810F8CA
_0810F88C:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0810F8BC @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0810F8C0
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _0810F8C0
	adds r0, r5, 0
	b _0810F8CC
	.align 2, 0
_0810F8BC: .4byte gPlayerParty
_0810F8C0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r6
	bcc _0810F88C
_0810F8CA:
	movs r0, 0
_0810F8CC:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetLeadMonIndex

	thumb_func_start ScriptGetPartyMonSpecies
ScriptGetPartyMonSpecies: @ 810F8D4
	push {lr}
	ldr r0, _0810F8F4 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0810F8F8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0810F8F4: .4byte gSpecialVar_0x8004
_0810F8F8: .4byte gPlayerParty
	thumb_func_end ScriptGetPartyMonSpecies

	thumb_func_start sub_810F8FC
sub_810F8FC: @ 810F8FC
	push {lr}
	movs r0, 0x6
	bl sub_805ADDC
	pop {r0}
	bx r0
	thumb_func_end sub_810F8FC

	thumb_func_start sub_810F908
sub_810F908: @ 810F908
	push {r4,lr}
	ldr r0, _0810F928 @ =0x000040c2
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	adds r3, r0, 0
	ldr r2, _0810F92C @ =gLocalTime
	movs r1, 0
	ldrsh r0, [r2, r1]
	subs r0, r3
	cmp r0, 0x6
	ble _0810F930
	movs r0, 0
	b _0810F948
	.align 2, 0
_0810F928: .4byte 0x000040c2
_0810F92C: .4byte gLocalTime
_0810F930:
	ldrh r1, [r2]
	movs r4, 0
	ldrsh r0, [r2, r4]
	cmp r0, 0
	blt _0810F946
	subs r1, r3
	movs r0, 0x7
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	b _0810F948
_0810F946:
	movs r0, 0x8
_0810F948:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810F908

	thumb_func_start sub_810F950
sub_810F950: @ 810F950
	push {r4,lr}
	ldr r0, _0810F964 @ =0x000040c2
	ldr r4, _0810F968 @ =gLocalTime
	ldrh r1, [r4]
	bl VarSet
	ldrh r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0810F964: .4byte 0x000040c2
_0810F968: .4byte gLocalTime
	thumb_func_end sub_810F950

	thumb_func_start sub_810F96C
sub_810F96C: @ 810F96C
	push {r4,lr}
	ldr r0, _0810F994 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0810F998 @ =gPlayerParty
	adds r0, r1
	ldr r4, _0810F99C @ =gStringVar1
	movs r1, 0x7
	adds r2, r4, 0
	bl GetMonData
	ldr r0, _0810F9A0 @ =gSaveBlock2
	adds r1, r4, 0
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	beq _0810F9A4
	movs r0, 0x1
	b _0810F9A6
	.align 2, 0
_0810F994: .4byte gSpecialVar_0x8004
_0810F998: .4byte gPlayerParty
_0810F99C: .4byte gStringVar1
_0810F9A0: .4byte gSaveBlock2
_0810F9A4:
	movs r0, 0
_0810F9A6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810F96C

	thumb_func_start sub_810F9AC
sub_810F9AC: @ 810F9AC
	push {r4,r5,lr}
	ldr r2, _0810F9C0 @ =gScriptResult
	ldrh r1, [r2]
	ldr r0, _0810F9C4 @ =0x0000270f
	cmp r1, r0
	bls _0810F9C8
	movs r0, 0
	bl sub_80BF088
	b _0810FA4A
	.align 2, 0
_0810F9C0: .4byte gScriptResult
_0810F9C4: .4byte 0x0000270f
_0810F9C8:
	ldr r0, _0810F9D8 @ =0x000003e7
	cmp r1, r0
	bls _0810F9E0
	ldr r4, _0810F9DC @ =gStringVar1
	movs r0, 0xA1
	strb r0, [r4]
	adds r4, 0x1
	b _0810FA04
	.align 2, 0
_0810F9D8: .4byte 0x000003e7
_0810F9DC: .4byte gStringVar1
_0810F9E0:
	cmp r1, 0x63
	bls _0810F9F4
	ldr r4, _0810F9F0 @ =gStringVar1
	movs r0, 0xA1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	adds r4, 0x2
	b _0810FA04
	.align 2, 0
_0810F9F0: .4byte gStringVar1
_0810F9F4:
	cmp r1, 0x9
	bls _0810FA24
	ldr r4, _0810FA20 @ =gStringVar1
	movs r0, 0xA1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	adds r4, 0x3
_0810FA04:
	ldrh r5, [r2]
	adds r0, r5, 0
	bl sub_80BF0B8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
	b _0810FA4A
	.align 2, 0
_0810FA20: .4byte gStringVar1
_0810FA24:
	ldr r4, _0810FA50 @ =gStringVar1
	movs r0, 0xA1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	strb r0, [r4, 0x3]
	adds r4, 0x4
	ldrh r5, [r2]
	adds r0, r5, 0
	bl sub_80BF0B8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
_0810FA4A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810FA50: .4byte gStringVar1
	thumb_func_end sub_810F9AC

	thumb_func_start sub_810FA54
sub_810FA54: @ 810FA54
	ldr r0, _0810FA68 @ =gSaveBlock1
	ldr r2, _0810FA6C @ =0x000013c2
	adds r1, r0, r2
	movs r2, 0
	strh r2, [r1]
	ldr r1, _0810FA70 @ =0x000013c4
	adds r0, r1
	strh r2, [r0]
	bx lr
	.align 2, 0
_0810FA68: .4byte gSaveBlock1
_0810FA6C: .4byte 0x000013c2
_0810FA70: .4byte 0x000013c4
	thumb_func_end sub_810FA54

	thumb_func_start sub_810FA74
sub_810FA74: @ 810FA74
	push {lr}
	bl sub_810FF30
	lsls r0, 24
	cmp r0, 0
	beq _0810FA90
	bl sub_810FCE8
	ldr r0, _0810FA94 @ =gSaveBlock1
	ldr r1, _0810FA98 @ =gSaveBlock2
	ldrh r1, [r1, 0xE]
	ldr r2, _0810FA9C @ =0x000013c4
	adds r0, r2
	strh r1, [r0]
_0810FA90:
	pop {r0}
	bx r0
	.align 2, 0
_0810FA94: .4byte gSaveBlock1
_0810FA98: .4byte gSaveBlock2
_0810FA9C: .4byte 0x000013c4
	thumb_func_end sub_810FA74

	thumb_func_start sub_810FAA0
sub_810FAA0: @ 810FAA0
	push {r4,lr}
	ldr r4, _0810FAF0 @ =gSaveBlock1
	ldr r1, _0810FAF4 @ =0x000013c2
	adds r0, r4, r1
	ldrh r0, [r0]
	lsrs r0, 7
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810FAE8
	bl sub_810FF48
	bl sub_810FD80
	ldr r0, _0810FAF8 @ =gSaveBlock2
	ldrh r1, [r0, 0xE]
	ldr r2, _0810FAFC @ =0x000013c4
	adds r0, r4, r2
	strh r1, [r0]
	ldr r0, _0810FB00 @ =0x00000315
	bl FlagReset
	ldr r0, _0810FB04 @ =0x00000316
	bl FlagReset
	ldr r0, _0810FB08 @ =0x00000317
	bl FlagReset
	movs r0, 0xC6
	lsls r0, 2
	bl FlagReset
	ldr r0, _0810FB0C @ =0x00004095
	movs r1, 0x1
	bl VarSet
_0810FAE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810FAF0: .4byte gSaveBlock1
_0810FAF4: .4byte 0x000013c2
_0810FAF8: .4byte gSaveBlock2
_0810FAFC: .4byte 0x000013c4
_0810FB00: .4byte 0x00000315
_0810FB04: .4byte 0x00000316
_0810FB08: .4byte 0x00000317
_0810FB0C: .4byte 0x00004095
	thumb_func_end sub_810FAA0

	thumb_func_start sub_810FB10
sub_810FB10: @ 810FB10
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0810FB54 @ =0x00004095
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _0810FB80
	ldr r0, _0810FB58 @ =gSaveBlock1
	ldr r1, _0810FB5C @ =0x000013c2
	adds r4, r0, r1
	ldrh r2, [r4]
	movs r1, 0x7F
	ands r1, r2
	ldr r0, _0810FB60 @ =gUnknown_083F8404
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r1, r0
	cmp r1, 0x13
	ble _0810FB7C
	bl sub_810FCB0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bhi _0810FB68
	bl sub_810FB9C
	ldrh r1, [r4]
	ldr r0, _0810FB64 @ =0x0000ff80
	ands r0, r1
	b _0810FB7E
	.align 2, 0
_0810FB54: .4byte 0x00004095
_0810FB58: .4byte gSaveBlock1
_0810FB5C: .4byte 0x000013c2
_0810FB60: .4byte gUnknown_083F8404
_0810FB64: .4byte 0x0000ff80
_0810FB68:
	ldrh r0, [r4]
	ldr r1, _0810FB78 @ =0x0000ff80
	ands r1, r0
	movs r0, 0x14
	orrs r1, r0
	strh r1, [r4]
	b _0810FB80
	.align 2, 0
_0810FB78: .4byte 0x0000ff80
_0810FB7C:
	adds r0, r2, r0
_0810FB7E:
	strh r0, [r4]
_0810FB80:
	ldr r0, _0810FB94 @ =gSaveBlock1
	ldr r1, _0810FB98 @ =0x000013c2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x7F
	ands r0, r1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810FB94: .4byte gSaveBlock1
_0810FB98: .4byte 0x000013c2
	thumb_func_end sub_810FB10

	thumb_func_start sub_810FB9C
sub_810FB9C: @ 810FB9C
	push {r4-r7,lr}
	sub sp, 0x4
	movs r3, 0
	movs r5, 0
	ldr r7, _0810FBD8 @ =gSaveBlock1 + 0x13C2
	movs r6, 0x1
_0810FBA8:
	ldrh r1, [r7]
	ldr r0, _0810FBDC @ =gUnknown_083F8408
	adds r0, r5, r0
	ldrb r4, [r0]
	asrs r1, r4
	ands r1, r6
	cmp r1, 0
	bne _0810FBE0
	adds r3, r5, 0
	str r3, [sp]
	bl Random
	adds r1, r6, 0
	ands r1, r0
	ldr r3, [sp]
	cmp r1, 0
	beq _0810FBE0
	adds r0, r6, 0
	lsls r0, r4
	ldrh r1, [r7]
	orrs r0, r1
	strh r0, [r7]
	b _0810FC00
	.align 2, 0
_0810FBD8: .4byte gSaveBlock1 + 0x13C2
_0810FBDC: .4byte gUnknown_083F8408
_0810FBE0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0810FBA8
	ldr r2, _0810FC0C @ =gSaveBlock1
	ldr r0, _0810FC10 @ =0x000013c2
	adds r2, r0
	ldr r1, _0810FC14 @ =gUnknown_083F8408
	adds r1, r3, r1
	movs r0, 0x1
	ldrb r1, [r1]
	lsls r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
_0810FC00:
	adds r0, r3, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810FC0C: .4byte gSaveBlock1
_0810FC10: .4byte 0x000013c2
_0810FC14: .4byte gUnknown_083F8408
	thumb_func_end sub_810FB9C

	thumb_func_start sub_810FC18
sub_810FC18: @ 810FC18
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r0, 0
	mov r8, r0
	bl sub_810FCB0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _0810FC3E
	movs r0, 0
	b _0810FC94
_0810FC34:
	lsls r4, r6
	ldrh r0, [r2]
	eors r4, r0
	strh r4, [r2]
	b _0810FC92
_0810FC3E:
	movs r5, 0
	ldr r2, _0810FCA0 @ =gSaveBlock1 + 0x13C2
	movs r4, 0x1
_0810FC44:
	ldrh r1, [r2]
	ldr r7, _0810FCA4 @ =gUnknown_083F8410
	adds r0, r5, r7
	ldrb r6, [r0]
	asrs r1, r6
	ands r1, r4
	cmp r1, 0
	beq _0810FC66
	mov r8, r5
	str r2, [sp]
	bl Random
	adds r1, r4, 0
	ands r1, r0
	ldr r2, [sp]
	cmp r1, 0
	bne _0810FC34
_0810FC66:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0810FC44
	ldr r0, _0810FCA8 @ =gSaveBlock1
	ldr r1, _0810FCAC @ =0x000013c2
	adds r4, r0, r1
	ldrh r1, [r4]
	mov r2, r8
	adds r0, r2, r7
	ldrb r2, [r0]
	adds r0, r1, 0
	asrs r0, r2
	movs r3, 0x1
	ands r0, r3
	cmp r0, 0
	beq _0810FC92
	adds r0, r3, 0
	lsls r0, r2
	eors r1, r0
	strh r1, [r4]
_0810FC92:
	mov r0, r8
_0810FC94:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810FCA0: .4byte gSaveBlock1 + 0x13C2
_0810FCA4: .4byte gUnknown_083F8410
_0810FCA8: .4byte gSaveBlock1
_0810FCAC: .4byte 0x000013c2
	thumb_func_end sub_810FC18

	thumb_func_start sub_810FCB0
sub_810FCB0: @ 810FCB0
	push {r4,r5,lr}
	movs r3, 0
	movs r2, 0
	ldr r0, _0810FCE4 @ =gSaveBlock1 + 0x13C2
	ldrh r4, [r0]
	movs r5, 0x1
_0810FCBC:
	adds r1, r2, 0
	adds r1, 0x8
	adds r0, r4, 0
	asrs r0, r1
	ands r0, r5
	cmp r0, 0
	beq _0810FCD0
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_0810FCD0:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _0810FCBC
	adds r0, r3, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810FCE4: .4byte gSaveBlock1 + 0x13C2
	thumb_func_end sub_810FCB0

	thumb_func_start sub_810FCE8
sub_810FCE8: @ 810FCE8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r2, _0810FD08 @ =gSaveBlock2
	ldrh r1, [r2, 0xE]
	ldr r0, _0810FD0C @ =0x000003e6
	cmp r1, r0
	bhi _0810FD54
	ldr r7, _0810FD10 @ =gSaveBlock1
	adds r6, r2, 0
	ldr r0, _0810FD14 @ =0x000013c4
	adds r0, r7
	mov r8, r0
	b _0810FD36
	.align 2, 0
_0810FD08: .4byte gSaveBlock2
_0810FD0C: .4byte 0x000003e6
_0810FD10: .4byte gSaveBlock1
_0810FD14: .4byte 0x000013c4
_0810FD18:
	ldrh r1, [r6, 0xE]
	ldr r0, _0810FD4C @ =0x000013c4
	adds r4, r7, r0
	ldrh r0, [r4]
	subs r1, r0
	cmp r1, 0xB
	ble _0810FD54
	bl sub_810FC18
	ldrh r0, [r4]
	adds r0, 0xC
	strh r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0810FD36:
	bl sub_810FCB0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bhi _0810FD50
	ldrh r0, [r6, 0xE]
	mov r1, r8
	strh r0, [r1]
	b _0810FD54
	.align 2, 0
_0810FD4C: .4byte 0x000013c4
_0810FD50:
	cmp r5, 0x8
	bne _0810FD18
_0810FD54:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810FCE8

	thumb_func_start sub_810FD60
sub_810FD60: @ 810FD60
	ldr r0, _0810FD74 @ =gSaveBlock1
	ldr r1, _0810FD78 @ =0x000013c2
	adds r0, r1
	ldrh r0, [r0]
	ldr r1, _0810FD7C @ =gSpecialVar_0x8004
	ldrh r1, [r1]
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0810FD74: .4byte gSaveBlock1
_0810FD78: .4byte 0x000013c2
_0810FD7C: .4byte gSpecialVar_0x8004
	thumb_func_end sub_810FD60

	thumb_func_start sub_810FD80
sub_810FD80: @ 810FD80
	ldr r2, _0810FDA4 @ =gSaveBlock1
	ldr r0, _0810FDA8 @ =0x000013c2
	adds r2, r0
	ldrh r1, [r2]
	movs r3, 0x80
	lsls r3, 6
	adds r0, r3, 0
	orrs r0, r1
	movs r3, 0x80
	lsls r3, 1
	adds r1, r3, 0
	orrs r0, r1
	movs r3, 0x80
	lsls r3, 3
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_0810FDA4: .4byte gSaveBlock1
_0810FDA8: .4byte 0x000013c2
	thumb_func_end sub_810FD80

	thumb_func_start sub_810FDAC
sub_810FDAC: @ 810FDAC
	push {lr}
	movs r3, 0
	movs r2, 0
	ldr r0, _0810FDC8 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	subs r0, 0x8
	cmp r0, 0x7
	bhi _0810FE0C
	lsls r0, 2
	ldr r1, _0810FDCC @ =_0810FDD0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810FDC8: .4byte gSpecialVar_0x8004
_0810FDCC: .4byte _0810FDD0
	.align 2, 0
_0810FDD0:
	.4byte _0810FE0C
	.4byte _0810FE0C
	.4byte _0810FDF0
	.4byte _0810FDF6
	.4byte _0810FDFC
	.4byte _0810FE02
	.4byte _0810FE08
	.4byte _0810FE0C
_0810FDF0:
	movs r3, 0
	movs r2, 0x3
	b _0810FE0C
_0810FDF6:
	movs r3, 0
	movs r2, 0x1
	b _0810FE0C
_0810FDFC:
	movs r3, 0x1
	movs r2, 0
	b _0810FE0C
_0810FE02:
	movs r3, 0
	movs r2, 0x4
	b _0810FE0C
_0810FE08:
	movs r3, 0x1
	movs r2, 0x5
_0810FE0C:
	ldr r0, _0810FE18 @ =gSaveBlock1 + 0x30B8
	adds r1, r3, 0
	bl sub_810FE1C
	pop {r0}
	bx r0
	.align 2, 0
_0810FE18: .4byte gSaveBlock1 + 0x30B8
	thumb_func_end sub_810FDAC

	thumb_func_start sub_810FE1C
sub_810FE1C: @ 810FE1C
	push {r4,lr}
	lsls r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsrs r1, 20
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _0810FED0
	cmp r2, 0x5
	bhi _0810FEBC
	lsls r0, r2, 2
	ldr r1, _0810FE3C @ =_0810FE40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810FE3C: .4byte _0810FE40
	.align 2, 0
_0810FE40:
	.4byte _0810FEBC
	.4byte _0810FE58
	.4byte _0810FE6C
	.4byte _0810FE80
	.4byte _0810FE94
	.4byte _0810FEA8
_0810FE58:
	ldr r0, _0810FE64 @ =gStringVar1
	ldr r1, _0810FE68 @ =gOtherText_Steven
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FE64: .4byte gStringVar1
_0810FE68: .4byte gOtherText_Steven
_0810FE6C:
	ldr r0, _0810FE78 @ =gStringVar1
	ldr r1, _0810FE7C @ =gOtherText_Brawly
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FE78: .4byte gStringVar1
_0810FE7C: .4byte gOtherText_Brawly
_0810FE80:
	ldr r0, _0810FE8C @ =gStringVar1
	ldr r1, _0810FE90 @ =gOtherText_Winona
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FE8C: .4byte gStringVar1
_0810FE90: .4byte gOtherText_Winona
_0810FE94:
	ldr r0, _0810FEA0 @ =gStringVar1
	ldr r1, _0810FEA4 @ =gOtherText_Phoebe
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FEA0: .4byte gStringVar1
_0810FEA4: .4byte gOtherText_Phoebe
_0810FEA8:
	ldr r0, _0810FEB4 @ =gStringVar1
	ldr r1, _0810FEB8 @ =gOtherText_Glacia
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FEB4: .4byte gStringVar1
_0810FEB8: .4byte gOtherText_Glacia
_0810FEBC:
	ldr r0, _0810FEC8 @ =gStringVar1
	ldr r1, _0810FECC @ =gOtherText_Wallace
	bl StringCopy
	b _0810FEF2
	.align 2, 0
_0810FEC8: .4byte gStringVar1
_0810FECC: .4byte gOtherText_Wallace
_0810FED0:
	ldr r4, _0810FEF8 @ =gStringVar1
	adds r0, r4, 0
	movs r2, 0x7
	bl StringCopyN
	movs r0, 0xFF
	strb r0, [r4, 0x7]
	ldrb r0, [r4]
	cmp r0, 0xFC
	bne _0810FEF2
	ldrb r0, [r4, 0x1]
	cmp r0, 0x15
	bne _0810FEF2
	adds r0, r4, 0
	movs r1, 0x1
	bl ConvertInternationalString
_0810FEF2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810FEF8: .4byte gStringVar1
	thumb_func_end sub_810FE1C

	thumb_func_start sub_810FEFC
sub_810FEFC: @ 810FEFC
	push {lr}
	ldr r0, _0810FF20 @ =0x00004095
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _0810FF2C
	bl sub_810FA74
	ldr r0, _0810FF24 @ =gUnknown_02024D26
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0810FF28
	bl sub_810FB9C
	b _0810FF2C
	.align 2, 0
_0810FF20: .4byte 0x00004095
_0810FF24: .4byte gUnknown_02024D26
_0810FF28:
	bl sub_810FC18
_0810FF2C:
	pop {r0}
	bx r0
	thumb_func_end sub_810FEFC

	thumb_func_start sub_810FF30
sub_810FF30: @ 810FF30
	ldr r0, _0810FF40 @ =gSaveBlock1
	ldr r1, _0810FF44 @ =0x000013c2
	adds r0, r1
	ldrh r0, [r0]
	lsrs r0, 7
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_0810FF40: .4byte gSaveBlock1
_0810FF44: .4byte 0x000013c2
	thumb_func_end sub_810FF30

	thumb_func_start sub_810FF48
sub_810FF48: @ 810FF48
	ldr r0, _0810FF58 @ =gSaveBlock1
	ldr r1, _0810FF5C @ =0x000013c2
	adds r0, r1
	ldrh r2, [r0]
	movs r1, 0x80
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_0810FF58: .4byte gSaveBlock1
_0810FF5C: .4byte 0x000013c2
	thumb_func_end sub_810FF48

	thumb_func_start sub_810FF60
sub_810FF60: @ 810FF60
	push {lr}
	ldr r0, _0810FF74 @ =gSpecialVar_0x8004
	ldrb r0, [r0]
	bl sub_810FB10
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0810FF74: .4byte gSpecialVar_0x8004
	thumb_func_end sub_810FF60

	.align 2, 0 @ Don't pad with nop.
