	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_809D844
sub_809D844: @ 809D844
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_809D844

	thumb_func_start sub_809D85C
sub_809D85C: @ 809D85C
	push {lr}
	ldr r1, _0809D8A0 @ =REG_BG1HOFS
	ldr r0, _0809D8A4 @ =gUnknown_030042C0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0809D8A8 @ =gUnknown_030041B4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0809D8AC @ =gUnknown_03004288
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0809D8B0 @ =gUnknown_03004280
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0809D8B4 @ =gUnknown_030041B0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _0809D8B8 @ =gUnknown_030041B8
	ldrh r0, [r0]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	.align 2, 0
_0809D8A0: .4byte REG_BG1HOFS
_0809D8A4: .4byte gUnknown_030042C0
_0809D8A8: .4byte gUnknown_030041B4
_0809D8AC: .4byte gUnknown_03004288
_0809D8B0: .4byte gUnknown_03004280
_0809D8B4: .4byte gUnknown_030041B0
_0809D8B8: .4byte gUnknown_030041B8
	thumb_func_end sub_809D85C

	thumb_func_start ShowPokemonSummaryScreen
ShowPokemonSummaryScreen: @ 809D8BC
	push {r4-r7,lr}
	ldr r4, [sp, 0x14]
	lsls r4, 24
	lsrs r7, r4, 24
	ldr r6, _0809D904 @ =gPaletteFade
	ldrb r4, [r6, 0x8]
	movs r5, 0x80
	orrs r4, r5
	strb r4, [r6, 0x8]
	ldr r5, _0809D908 @ =gSharedMem + 0x18000
	str r0, [r5]
	movs r4, 0
	strb r7, [r5, 0x8]
	strb r1, [r5, 0x9]
	strb r2, [r5, 0xA]
	str r3, [r5, 0x4]
	adds r0, r5, 0
	adds r0, 0x74
	strb r4, [r0]
	adds r1, r5, 0
	adds r1, 0x79
	movs r0, 0x4
	strb r0, [r1]
	adds r0, r5, 0
	adds r0, 0x7C
	movs r1, 0
	strh r4, [r0]
	adds r0, 0x4
	strb r1, [r0]
	subs r0, 0x5
	strb r1, [r0]
	cmp r7, 0x4
	bls _0809D90C
	movs r0, 0x1
	strb r0, [r5, 0xE]
	b _0809D90E
	.align 2, 0
_0809D904: .4byte gPaletteFade
_0809D908: .4byte gSharedMem + 0x18000
_0809D90C:
	strb r1, [r5, 0xE]
_0809D90E:
	cmp r7, 0x6
	bhi _0809D9D6
	lsls r0, r7, 2
	ldr r1, _0809D91C @ =_0809D920
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809D91C: .4byte _0809D920
	.align 2, 0
_0809D920:
	.4byte _0809D93C
	.4byte _0809D9BC
	.4byte _0809D992
	.4byte _0809D9D6
	.4byte _0809D966
	.4byte _0809D93C
	.4byte _0809D9BC
_0809D93C:
	adds r0, r5, 0
	adds r0, 0x75
	movs r1, 0
	strb r1, [r0]
	adds r2, r5, 0
	adds r2, 0x76
	movs r0, 0x3
	strb r0, [r2]
	adds r0, r5, 0
	adds r0, 0x77
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	adds r1, r5, 0
	adds r1, 0x7E
	movs r0, 0x1
	strb r0, [r1]
	adds r1, 0x1
	movs r0, 0x7
	strb r0, [r1]
	b _0809D9D6
_0809D966:
	adds r0, r5, 0
	adds r0, 0x75
	movs r1, 0
	strb r1, [r0]
	adds r2, r5, 0
	adds r2, 0x76
	movs r0, 0x3
	strb r0, [r2]
	adds r0, r5, 0
	adds r0, 0x77
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	adds r0, 0x6
	movs r1, 0x1
	strb r1, [r0]
	adds r2, 0x9
	movs r0, 0x7
	strb r0, [r2]
	adds r0, r5, 0
	adds r0, 0x7B
	b _0809D9D4
_0809D992:
	adds r1, r5, 0
	adds r1, 0x75
	movs r3, 0
	movs r0, 0x2
	strb r0, [r1]
	adds r0, r5, 0
	adds r0, 0x76
	movs r2, 0x3
	strb r2, [r0]
	adds r0, 0x1
	movs r1, 0x1
	strb r1, [r0]
	adds r0, 0x1
	strb r1, [r0]
	adds r0, 0x6
	strb r2, [r0]
	adds r0, 0x1
	strb r3, [r0]
	subs r0, 0x6
	strb r3, [r0]
	b _0809D9D6
_0809D9BC:
	adds r1, r5, 0
	adds r1, 0x75
	movs r0, 0x2
	strb r0, [r1]
	adds r1, 0x1
	movs r0, 0x3
	strb r0, [r1]
	adds r0, r5, 0
	adds r0, 0x77
	movs r1, 0x1
	strb r1, [r0]
	adds r0, 0x1
_0809D9D4:
	strb r1, [r0]
_0809D9D6:
	adds r0, r5, 0
	adds r0, 0x75
	ldrb r0, [r0]
	strb r0, [r5, 0xB]
	ldr r0, _0809D9EC @ =sub_809DE44
	bl SetMainCallback2
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D9EC: .4byte sub_809DE44
	thumb_func_end ShowPokemonSummaryScreen

	thumb_func_start sub_809D9F0
sub_809D9F0: @ 809D9F0
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, [sp, 0x10]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r5, 16
	lsrs r5, 16
	movs r4, 0x2
	str r4, [sp]
	bl ShowPokemonSummaryScreen
	ldr r0, _0809DA18 @ =gSharedMem + 0x18000
	adds r0, 0x7C
	strh r5, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809DA18: .4byte gSharedMem + 0x18000
	thumb_func_end sub_809D9F0

	thumb_func_start sub_809DA1C
sub_809DA1C: @ 809DA1C
	push {lr}
	ldr r0, _0809DA30 @ =gSharedMem + 0x18000
	ldrb r0, [r0, 0x8]
	cmp r0, 0x6
	bhi _0809DA78
	lsls r0, 2
	ldr r1, _0809DA34 @ =_0809DA38
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809DA30: .4byte gSharedMem + 0x18000
_0809DA34: .4byte _0809DA38
	.align 2, 0
_0809DA38:
	.4byte _0809DA54
	.4byte _0809DA6C
	.4byte _0809DA64
	.4byte _0809DA64
	.4byte _0809DA5C
	.4byte _0809DA54
	.4byte _0809DA6C
_0809DA54:
	ldr r0, _0809DA58 @ =SummaryScreenHandleKeyInput
	b _0809DA6E
	.align 2, 0
_0809DA58: .4byte SummaryScreenHandleKeyInput
_0809DA5C:
	ldr r0, _0809DA60 @ =SummaryScreenHandleKeyInput
	b _0809DA6E
	.align 2, 0
_0809DA60: .4byte SummaryScreenHandleKeyInput
_0809DA64:
	ldr r0, _0809DA68 @ =sub_809EB40
	b _0809DA6E
	.align 2, 0
_0809DA68: .4byte sub_809EB40
_0809DA6C:
	ldr r0, _0809DA7C @ =sub_809E3FC
_0809DA6E:
	movs r1, 0
	bl CreateTask
	ldr r1, _0809DA80 @ =gSharedMem + 0x18000
	strb r0, [r1, 0xF]
_0809DA78:
	pop {r0}
	bx r0
	.align 2, 0
_0809DA7C: .4byte sub_809E3FC
_0809DA80: .4byte gSharedMem + 0x18000
	thumb_func_end sub_809DA1C

	thumb_func_start sub_809DA84
sub_809DA84: @ 809DA84
	push {r4-r7,lr}
	sub sp, 0x8
	ldr r1, _0809DAA4 @ =gMain
	ldr r2, _0809DAA8 @ =0x0000043c
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r12, r1
	cmp r0, 0x16
	bls _0809DA98
	b _0809DE00
_0809DA98:
	lsls r0, 2
	ldr r1, _0809DAAC @ =_0809DAB0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809DAA4: .4byte gMain
_0809DAA8: .4byte 0x0000043c
_0809DAAC: .4byte _0809DAB0
	.align 2, 0
_0809DAB0:
	.4byte _0809DB0C
	.4byte _0809DB18
	.4byte _0809DB2C
	.4byte _0809DB32
	.4byte _0809DB80
	.4byte _0809DB94
	.4byte _0809DBA0
	.4byte _0809DBBC
	.4byte _0809DBC8
	.4byte _0809DBDC
	.4byte _0809DC2C
	.4byte _0809DC48
	.4byte _0809DC5C
	.4byte _0809DC90
	.4byte _0809DCB0
	.4byte _0809DCC4
	.4byte _0809DCF8
	.4byte _0809DD02
	.4byte _0809DD30
	.4byte _0809DD3C
	.4byte _0809DD68
	.4byte _0809DD98
	.4byte _0809DDE0
_0809DB0C:
	movs r0, 0
	bl SetVBlankCallback
	bl ResetSpriteData
	b _0809DDE8
_0809DB18:
	bl remove_some_task
	ldr r1, _0809DB24 @ =gMain
	ldr r2, _0809DB28 @ =0x0000043c
	adds r1, r2
	b _0809DDEE
	.align 2, 0
_0809DB24: .4byte gMain
_0809DB28: .4byte 0x0000043c
_0809DB2C:
	bl FreeAllSpritePalettes
	b _0809DDE8
_0809DB32:
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0x80
	lsls r3, 9
	movs r5, 0
	ldr r1, _0809DB74 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	ldr r6, _0809DB78 @ =0x85000400
	movs r7, 0x85
	lsls r7, 24
_0809DB48:
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r1]
	str r2, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _0809DB48
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0809DB7C @ =0x0000043c
	add r1, r12
	b _0809DDEE
	.align 2, 0
_0809DB74: .4byte 0x040000d4
_0809DB78: .4byte 0x85000400
_0809DB7C: .4byte 0x0000043c
_0809DB80:
	bl sub_809DE64
	ldr r1, _0809DB8C @ =gMain
	ldr r2, _0809DB90 @ =0x0000043c
	adds r1, r2
	b _0809DDEE
	.align 2, 0
_0809DB8C: .4byte gMain
_0809DB90: .4byte 0x0000043c
_0809DB94:
	ldr r0, _0809DB9C @ =gWindowConfig_81E6E6C
	bl SetUpWindowConfig
	b _0809DDE8
	.align 2, 0
_0809DB9C: .4byte gWindowConfig_81E6E6C
_0809DBA0:
	ldr r0, _0809DBB0 @ =gWindowConfig_81E6E6C
	bl MultistepInitMenuWindowBegin
	ldr r1, _0809DBB4 @ =gMain
	ldr r2, _0809DBB8 @ =0x0000043c
	adds r1, r2
	b _0809DDEE
	.align 2, 0
_0809DBB0: .4byte gWindowConfig_81E6E6C
_0809DBB4: .4byte gMain
_0809DBB8: .4byte 0x0000043c
_0809DBBC:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _0809DBC6
	b _0809DE38
_0809DBC6:
	b _0809DDE8
_0809DBC8:
	bl sub_809DA1C
	ldr r1, _0809DBD4 @ =gMain
	ldr r2, _0809DBD8 @ =0x0000043c
	adds r1, r2
	b _0809DDEE
	.align 2, 0
_0809DBD4: .4byte gMain
_0809DBD8: .4byte 0x0000043c
_0809DBDC:
	ldr r1, _0809DC08 @ =gSummaryScreenTextTiles
	ldr r2, _0809DC0C @ =0x0600d000
	ldr r0, _0809DC10 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0809DC14 @ =0x800000a0
	str r1, [r0, 0x8]
	ldr r1, [r0, 0x8]
	ldr r1, _0809DC18 @ =gSummaryScreenButtonTiles
	ldr r2, _0809DC1C @ =0x0600d140
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0809DC20 @ =0x80000080
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _0809DC24 @ =gSharedMem + 0x18000
	adds r0, 0x74
	movs r1, 0
	strb r1, [r0]
	ldr r1, _0809DC28 @ =0x0000043c
	add r1, r12
	b _0809DDEE
	.align 2, 0
_0809DC08: .4byte gSummaryScreenTextTiles
_0809DC0C: .4byte 0x0600d000
_0809DC10: .4byte 0x040000d4
_0809DC14: .4byte 0x800000a0
_0809DC18: .4byte gSummaryScreenButtonTiles
_0809DC1C: .4byte 0x0600d140
_0809DC20: .4byte 0x80000080
_0809DC24: .4byte gSharedMem + 0x18000
_0809DC28: .4byte 0x0000043c
_0809DC2C:
	bl sub_809DF00
	lsls r0, 24
	cmp r0, 0
	bne _0809DC38
	b _0809DE38
_0809DC38:
	ldr r0, _0809DC44 @ =gSharedMem + 0x18000
	adds r0, 0x74
	movs r1, 0
	strb r1, [r0]
	b _0809DDE8
	.align 2, 0
_0809DC44: .4byte gSharedMem + 0x18000
_0809DC48:
	bl sub_80A18C4
	ldr r1, _0809DC54 @ =gMain
	ldr r2, _0809DC58 @ =0x0000043c
	adds r1, r2
	b _0809DDEE
	.align 2, 0
_0809DC54: .4byte gMain
_0809DC58: .4byte 0x0000043c
_0809DC5C:
	ldr r4, _0809DC78 @ =gSharedMem + 0x18010
	adds r0, r4, 0
	bl sub_809F678
	adds r0, r4, 0
	bl GetMonStatusAndPokerus
	lsls r0, 24
	cmp r0, 0
	bne _0809DC7C
	movs r0, 0
	bl sub_80A12D0
	b _0809DC82
	.align 2, 0
_0809DC78: .4byte gSharedMem + 0x18010
_0809DC7C:
	movs r0, 0xA
	bl sub_80A12D0
_0809DC82:
	ldr r0, _0809DC8C @ =gSharedMem + 0x18010
	bl DrawPokerusSurvivorDot
	b _0809DDE8
	.align 2, 0
_0809DC8C: .4byte gSharedMem + 0x18010
_0809DC90:
	bl sub_80A1950
	ldr r0, _0809DCA4 @ =gSharedMem + 0x18010
	bl sub_80A1D84
	ldr r1, _0809DCA8 @ =gMain
	ldr r2, _0809DCAC @ =0x0000043c
	adds r1, r2
	b _0809DDEE
	.align 2, 0
_0809DCA4: .4byte gSharedMem + 0x18010
_0809DCA8: .4byte gMain
_0809DCAC: .4byte 0x0000043c
_0809DCB0:
	ldr r4, _0809DCC0 @ =gSharedMem + 0x18010
	adds r0, r4, 0
	bl sub_80A1DE8
	adds r4, 0x64
	movs r0, 0
	strb r0, [r4]
	b _0809DDE8
	.align 2, 0
_0809DCC0: .4byte gSharedMem + 0x18010
_0809DCC4:
	ldr r4, _0809DCEC @ =gSharedMem + 0x18010
	adds r5, r4, 0
	adds r5, 0x64
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_809F6B4
	subs r4, 0x10
	strb r0, [r4, 0xC]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0809DCE0
	b _0809DE38
_0809DCE0:
	movs r0, 0
	strb r0, [r5]
	ldr r1, _0809DCF0 @ =gMain
	ldr r2, _0809DCF4 @ =0x0000043c
	adds r1, r2
	b _0809DDEE
	.align 2, 0
_0809DCEC: .4byte gSharedMem + 0x18010
_0809DCF0: .4byte gMain
_0809DCF4: .4byte 0x0000043c
_0809DCF8:
	bl sub_809E044
	bl DrawSummaryScreenNavigationDots
	b _0809DDE8
_0809DD02:
	ldr r1, _0809DD20 @ =gSharedMem + 0x18000
	ldrb r0, [r1, 0xB]
	cmp r0, 0x1
	bhi _0809DD18
	ldr r0, _0809DD24 @ =gUnknown_083C1580
	ldrb r1, [r1, 0xB]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_0809DD18:
	ldr r1, _0809DD28 @ =gMain
	ldr r2, _0809DD2C @ =0x0000043c
	adds r1, r2
	b _0809DDEE
	.align 2, 0
_0809DD20: .4byte gSharedMem + 0x18000
_0809DD24: .4byte gUnknown_083C1580
_0809DD28: .4byte gMain
_0809DD2C: .4byte 0x0000043c
_0809DD30:
	ldr r0, _0809DD38 @ =gSharedMem + 0x18010
	bl sub_809FAC8
	b _0809DDE8
	.align 2, 0
_0809DD38: .4byte gSharedMem + 0x18010
_0809DD3C:
	ldr r2, _0809DD58 @ =gUnknown_083C1598
	ldr r0, _0809DD5C @ =gSharedMem + 0x18000
	ldrb r1, [r0, 0xB]
	lsls r1, 2
	adds r1, r2
	adds r0, 0x10
	ldr r1, [r1]
	bl _call_via_r1
	ldr r1, _0809DD60 @ =gMain
	ldr r2, _0809DD64 @ =0x0000043c
	adds r1, r2
	b _0809DDEE
	.align 2, 0
_0809DD58: .4byte gUnknown_083C1598
_0809DD5C: .4byte gSharedMem + 0x18000
_0809DD60: .4byte gMain
_0809DD64: .4byte 0x0000043c
_0809DD68:
	ldr r0, _0809DD84 @ =gSharedMem + 0x18010
	movs r1, 0x2D
	bl GetMonData
	adds r1, r0, 0
	cmp r1, 0
	beq _0809DD8C
	ldr r1, _0809DD88 @ =gUnknown_030041B0
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	b _0809DDE8
	.align 2, 0
_0809DD84: .4byte gSharedMem + 0x18010
_0809DD88: .4byte gUnknown_030041B0
_0809DD8C:
	ldr r0, _0809DD94 @ =gUnknown_030041B0
	strh r1, [r0]
	b _0809DDE8
	.align 2, 0
_0809DD94: .4byte gUnknown_030041B0
_0809DD98:
	bl sub_809EBC4
	ldr r0, _0809DDB8 @ =gSharedMem + 0x18000
	adds r0, 0x79
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809DDBC
	movs r0, 0
	movs r1, 0
	bl sub_80A1488
	movs r0, 0
	movs r1, 0
	bl sub_80A1654
	b _0809DDCC
	.align 2, 0
_0809DDB8: .4byte gSharedMem + 0x18000
_0809DDBC:
	movs r0, 0xA
	movs r1, 0
	bl sub_80A1488
	movs r0, 0xA
	movs r1, 0
	bl sub_80A1654
_0809DDCC:
	bl PrintSummaryWindowHeaderText
	ldr r1, _0809DDD8 @ =gMain
	ldr r2, _0809DDDC @ =0x0000043c
	adds r1, r2
	b _0809DDEE
	.align 2, 0
_0809DDD8: .4byte gMain
_0809DDDC: .4byte 0x0000043c
_0809DDE0:
	bl sub_8055870
	cmp r0, 0x1
	beq _0809DE38
_0809DDE8:
	ldr r1, _0809DDF8 @ =gMain
	ldr r0, _0809DDFC @ =0x0000043c
	adds r1, r0
_0809DDEE:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0809DE38
	.align 2, 0
_0809DDF8: .4byte gMain
_0809DDFC: .4byte 0x0000043c
_0809DE00:
	ldr r0, _0809DE2C @ =sub_809D85C
	bl SetVBlankCallback
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginHardwarePaletteFade
	ldr r0, _0809DE30 @ =sub_809D844
	bl SetMainCallback2
	ldr r2, _0809DE34 @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	movs r0, 0x1
	b _0809DE3A
	.align 2, 0
_0809DE2C: .4byte sub_809D85C
_0809DE30: .4byte sub_809D844
_0809DE34: .4byte gPaletteFade
_0809DE38:
	movs r0, 0
_0809DE3A:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809DA84

	thumb_func_start sub_809DE44
sub_809DE44: @ 809DE44
	push {lr}
_0809DE46:
	bl sub_809DA84
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0809DE5E
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809DE46
_0809DE5E:
	pop {r0}
	bx r0
	thumb_func_end sub_809DE44

	thumb_func_start sub_809DE64
sub_809DE64: @ 809DE64
	ldr r1, _0809DED0 @ =REG_BG0CNT
	ldr r2, _0809DED4 @ =0x00001e08
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0809DED8 @ =0x00004801
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0809DEDC @ =0x00004a02
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0809DEE0 @ =0x00005c03
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0809DEE4 @ =gUnknown_030042C0
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0809DEE8 @ =gUnknown_030041B4
	strh r0, [r1]
	ldr r1, _0809DEEC @ =gUnknown_03004288
	strh r0, [r1]
	ldr r1, _0809DEF0 @ =gUnknown_03004280
	strh r0, [r1]
	ldr r1, _0809DEF4 @ =gUnknown_030041B0
	strh r0, [r1]
	ldr r1, _0809DEF8 @ =gUnknown_030041B8
	strh r0, [r1]
	ldr r1, _0809DEFC @ =REG_BG0HOFS
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x32
	strh r0, [r1]
	subs r1, 0x50
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0809DED0: .4byte REG_BG0CNT
_0809DED4: .4byte 0x00001e08
_0809DED8: .4byte 0x00004801
_0809DEDC: .4byte 0x00004a02
_0809DEE0: .4byte 0x00005c03
_0809DEE4: .4byte gUnknown_030042C0
_0809DEE8: .4byte gUnknown_030041B4
_0809DEEC: .4byte gUnknown_03004288
_0809DEF0: .4byte gUnknown_03004280
_0809DEF4: .4byte gUnknown_030041B0
_0809DEF8: .4byte gUnknown_030041B8
_0809DEFC: .4byte REG_BG0HOFS
	thumb_func_end sub_809DE64

	thumb_func_start sub_809DF00
sub_809DF00: @ 809DF00
	push {lr}
	ldr r0, _0809DF18 @ =gSharedMem + 0x18000
	adds r0, 0x74
	ldrb r0, [r0]
	cmp r0, 0xC
	bls _0809DF0E
	b _0809E030
_0809DF0E:
	lsls r0, 2
	ldr r1, _0809DF1C @ =_0809DF20
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809DF18: .4byte gSharedMem + 0x18000
_0809DF1C: .4byte _0809DF20
	.align 2, 0
_0809DF20:
	.4byte _0809DF54
	.4byte _0809DF64
	.4byte _0809DF74
	.4byte _0809DF88
	.4byte _0809DF9C
	.4byte _0809DFAC
	.4byte _0809DFC4
	.4byte _0809DFD4
	.4byte _0809DFE0
	.4byte _0809DFEC
	.4byte _0809DFF8
	.4byte _0809E004
	.4byte _0809E010
_0809DF54:
	ldr r0, _0809DF60 @ =gStatusScreen_Gfx
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	b _0809E030
	.align 2, 0
_0809DF60: .4byte gStatusScreen_Gfx
_0809DF64:
	ldr r0, _0809DF6C @ =gUnknown_08E73508
	ldr r1, _0809DF70 @ =0x0600e000
	b _0809DFB0
	.align 2, 0
_0809DF6C: .4byte gUnknown_08E73508
_0809DF70: .4byte 0x0600e000
_0809DF74:
	ldr r0, _0809DF80 @ =gUnknown_08E74E88
	ldr r1, _0809DF84 @ =0x0600e800
	bl LZDecompressVram
	b _0809E030
	.align 2, 0
_0809DF80: .4byte gUnknown_08E74E88
_0809DF84: .4byte 0x0600e800
_0809DF88:
	ldr r0, _0809DF94 @ =gStatusScreen_Tilemap
	ldr r1, _0809DF98 @ =0x06004800
	bl LZDecompressVram
	b _0809E030
	.align 2, 0
_0809DF94: .4byte gStatusScreen_Tilemap
_0809DF98: .4byte 0x06004800
_0809DF9C:
	ldr r0, _0809DFA4 @ =gUnknown_08E73E88
	ldr r1, _0809DFA8 @ =0x06005800
	b _0809DFB0
	.align 2, 0
_0809DFA4: .4byte gUnknown_08E73E88
_0809DFA8: .4byte 0x06005800
_0809DFAC:
	ldr r0, _0809DFBC @ =gUnknown_08E74688
	ldr r1, _0809DFC0 @ =0x06006800
_0809DFB0:
	movs r2, 0x80
	lsls r2, 3
	bl CpuSet
	b _0809E030
	.align 2, 0
_0809DFBC: .4byte gUnknown_08E74688
_0809DFC0: .4byte 0x06006800
_0809DFC4:
	ldr r0, _0809DFD0 @ =gStatusScreen_Pal
	movs r1, 0
	movs r2, 0xA0
	bl LoadCompressedPalette
	b _0809E030
	.align 2, 0
_0809DFD0: .4byte gStatusScreen_Pal
_0809DFD4:
	ldr r0, _0809DFDC @ =gUnknown_083C11B8
	bl LoadCompressedObjectPic
	b _0809E030
	.align 2, 0
_0809DFDC: .4byte gUnknown_083C11B8
_0809DFE0:
	ldr r0, _0809DFE8 @ =gUnknown_083C1270
	bl LoadCompressedObjectPic
	b _0809E030
	.align 2, 0
_0809DFE8: .4byte gUnknown_083C1270
_0809DFEC:
	ldr r0, _0809DFF4 @ =gUnknown_083C12F4
	bl LoadCompressedObjectPic
	b _0809E030
	.align 2, 0
_0809DFF4: .4byte gUnknown_083C12F4
_0809DFF8:
	ldr r0, _0809E000 @ =gUnknown_083C12FC
	bl LoadCompressedObjectPalette
	b _0809E030
	.align 2, 0
_0809E000: .4byte gUnknown_083C12FC
_0809E004:
	ldr r0, _0809E00C @ =gUnknown_083C1278
	bl LoadCompressedObjectPalette
	b _0809E030
	.align 2, 0
_0809E00C: .4byte gUnknown_083C1278
_0809E010:
	ldr r0, _0809E028 @ =gMoveTypes_Pal
	movs r1, 0xE8
	lsls r1, 1
	movs r2, 0x60
	bl LoadCompressedPalette
	ldr r0, _0809E02C @ =gSharedMem + 0x18000
	adds r0, 0x74
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _0809E03C
	.align 2, 0
_0809E028: .4byte gMoveTypes_Pal
_0809E02C: .4byte gSharedMem + 0x18000
_0809E030:
	ldr r1, _0809E040 @ =gSharedMem + 0x18000
	adds r1, 0x74
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
_0809E03C:
	pop {r1}
	bx r1
	.align 2, 0
_0809E040: .4byte gSharedMem + 0x18000
	thumb_func_end sub_809DF00

	thumb_func_start sub_809E044
sub_809E044: @ 809E044
	push {r4,r5,lr}
	ldr r4, _0809E0F4 @ =gUnknownPalette_81E6692+0x1C
	adds r0, r4, 0
	movs r1, 0x81
	movs r2, 0x2
	bl LoadPalette
	adds r5, r4, 0x2
	adds r0, r5, 0
	movs r1, 0x88
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0x8F
	movs r2, 0x2
	bl LoadPalette
	adds r0, r5, 0
	movs r1, 0x89
	movs r2, 0x2
	bl LoadPalette
	subs r5, 0x12
	adds r0, r5, 0
	movs r1, 0xD1
	movs r2, 0x4
	bl LoadPalette
	adds r0, r4, 0
	subs r0, 0x8
	movs r1, 0xD3
	movs r2, 0x4
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xD5
	movs r2, 0x4
	bl LoadPalette
	adds r0, r5, 0
	movs r1, 0xD7
	movs r2, 0x4
	bl LoadPalette
	adds r0, r4, 0
	subs r0, 0x14
	movs r1, 0xD9
	movs r2, 0x4
	bl LoadPalette
	adds r0, r4, 0
	subs r0, 0xC
	movs r1, 0xDB
	movs r2, 0x4
	bl LoadPalette
	adds r0, r4, 0
	subs r0, 0x18
	movs r1, 0xDD
	movs r2, 0x2
	bl LoadPalette
	subs r5, 0x6
	adds r0, r5, 0
	movs r1, 0xDE
	movs r2, 0x2
	bl LoadPalette
	subs r4, 0x1A
	adds r0, r4, 0
	movs r1, 0xDF
	movs r2, 0x2
	bl LoadPalette
	ldr r0, _0809E0F8 @ =gFontDefaultPalette
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	adds r0, r5, 0
	movs r1, 0xF9
	movs r2, 0x2
	bl LoadPalette
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E0F4: .4byte gUnknownPalette_81E6692+0x1C
_0809E0F8: .4byte gFontDefaultPalette
	thumb_func_end sub_809E044

	thumb_func_start SummaryScreenExit
SummaryScreenExit: @ 809E0FC
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0809E134 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809E138 @ =sub_809E13C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809E134: .4byte gTasks
_0809E138: .4byte sub_809E13C
	thumb_func_end SummaryScreenExit

	thumb_func_start sub_809E13C
sub_809E13C: @ 809E13C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_8055870
	cmp r0, 0x1
	beq _0809E182
	ldr r0, _0809E188 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0809E182
	ldr r1, _0809E18C @ =gUnknown_020384F0
	ldr r4, _0809E190 @ =gSharedMem + 0x18000
	ldrb r0, [r4, 0x9]
	strb r0, [r1]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl StopCryAndClearCrySongs
	ldr r0, _0809E194 @ =gMPlay_BGM
	ldr r1, _0809E198 @ =0x0000ffff
	movs r2, 0x80
	lsls r2, 1
	bl m4aMPlayVolumeControl
	ldr r0, [r4, 0x4]
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0809E182:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E188: .4byte gPaletteFade
_0809E18C: .4byte gUnknown_020384F0
_0809E190: .4byte gSharedMem + 0x18000
_0809E194: .4byte gMPlay_BGM
_0809E198: .4byte 0x0000ffff
	thumb_func_end sub_809E13C

	thumb_func_start SummaryScreenHandleKeyInput
SummaryScreenHandleKeyInput: @ 809E19C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0809E1C8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r2, 0x80
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0809E25A
	ldr r5, _0809E1CC @ =gMain
	ldrh r1, [r5, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0809E1D0
	movs r1, 0x1
	negs r1, r1
	adds r0, r4, 0
	bl SummaryScreenHandleUpDownInput
	b _0809E25A
	.align 2, 0
_0809E1C8: .4byte gPaletteFade
_0809E1CC: .4byte gMain
_0809E1D0:
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0809E1E2
	adds r0, r4, 0
	movs r1, 0x1
	bl SummaryScreenHandleUpDownInput
	b _0809E25A
_0809E1E2:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0809E1F6
	bl sub_80F9284
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809E202
_0809E1F6:
	movs r1, 0x1
	negs r1, r1
	adds r0, r4, 0
	bl SummaryScreenHandleLeftRightInput
	b _0809E25A
_0809E202:
	ldrh r1, [r5, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0809E218
	bl sub_80F9284
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0809E222
_0809E218:
	adds r0, r4, 0
	movs r1, 0x1
	bl SummaryScreenHandleLeftRightInput
	b _0809E25A
_0809E222:
	ldrh r1, [r5, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809E24C
	ldr r5, _0809E248 @ =gSharedMem + 0x18000
	ldrb r0, [r5, 0xB]
	cmp r0, 0x1
	bls _0809E23A
	adds r0, r4, 0
	bl SummaryScreenHandleAButton
_0809E23A:
	ldrb r0, [r5, 0xB]
	cmp r0, 0
	bne _0809E25A
	adds r0, r4, 0
	bl SummaryScreenExit
	b _0809E25A
	.align 2, 0
_0809E248: .4byte gSharedMem + 0x18000
_0809E24C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809E25A
	adds r0, r4, 0
	bl SummaryScreenExit
_0809E25A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end SummaryScreenHandleKeyInput

	thumb_func_start sub_809E260
sub_809E260: @ 809E260
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0809E29C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r2, 0x80
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0809E276
	b _0809E3EE
_0809E276:
	ldr r5, _0809E2A0 @ =gMain
	ldrh r1, [r5, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0809E2AC
	ldr r1, _0809E2A4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x4
	strh r1, [r0, 0x8]
	subs r1, 0x5
	ldr r2, _0809E2A8 @ =gSharedMem + 0x18079
	adds r0, r4, 0
	bl sub_809E8F0
	b _0809E3EE
	.align 2, 0
_0809E29C: .4byte gPaletteFade
_0809E2A0: .4byte gMain
_0809E2A4: .4byte gTasks
_0809E2A8: .4byte gSharedMem + 0x18079
_0809E2AC:
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0809E2D8
	ldr r1, _0809E2D0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x4
	strh r1, [r0, 0x8]
	ldr r2, _0809E2D4 @ =gSharedMem + 0x18079
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_809E8F0
	b _0809E3EE
	.align 2, 0
_0809E2D0: .4byte gTasks
_0809E2D4: .4byte gSharedMem + 0x18079
_0809E2D8:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0809E2EC
	bl sub_80F9284
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809E324
_0809E2EC:
	ldr r1, _0809E320 @ =gSharedMem + 0x18000
	ldrb r0, [r1, 0xB]
	cmp r0, 0x3
	bne _0809E314
	adds r0, r1, 0
	adds r0, 0x79
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _0809E308
	adds r0, r1, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0
	beq _0809E314
_0809E308:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x9
	movs r3, 0x12
	bl MenuZeroFillWindowRect
_0809E314:
	movs r1, 0x1
	negs r1, r1
	adds r0, r4, 0
	bl SummaryScreenHandleLeftRightInput
	b _0809E3EE
	.align 2, 0
_0809E320: .4byte gSharedMem + 0x18000
_0809E324:
	ldrh r1, [r5, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0809E33A
	bl sub_80F9284
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0809E37C
_0809E33A:
	ldr r1, _0809E378 @ =gSharedMem + 0x18000
	adds r2, r1, 0
	adds r2, 0x76
	ldrb r0, [r1, 0xB]
	ldrb r2, [r2]
	cmp r0, r2
	beq _0809E3EE
	cmp r0, 0x2
	bne _0809E36C
	adds r0, r1, 0
	adds r0, 0x79
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _0809E360
	adds r0, r1, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0
	beq _0809E36C
_0809E360:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x9
	movs r3, 0x12
	bl MenuZeroFillWindowRect
_0809E36C:
	adds r0, r4, 0
	movs r1, 0x1
	bl SummaryScreenHandleLeftRightInput
	b _0809E3EE
	.align 2, 0
_0809E378: .4byte gSharedMem + 0x18000
_0809E37C:
	ldrh r1, [r5, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809E3D4
	adds r0, r4, 0
	bl sub_809F7D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0809E3A0
	ldr r0, _0809E3BC @ =gSharedMem + 0x18000
	adds r5, r0, 0
	adds r5, 0x79
	ldrb r0, [r5]
	cmp r0, 0x4
	bne _0809E3C4
_0809E3A0:
	ldr r0, _0809E3BC @ =gSharedMem + 0x18000
	adds r1, r0, 0
	adds r1, 0x79
	ldrb r1, [r1]
	adds r0, 0x7A
	strb r1, [r0]
	ldr r1, _0809E3C0 @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	strh r0, [r1]
	adds r0, r4, 0
	bl SummaryScreenExit
	b _0809E3EE
	.align 2, 0
_0809E3BC: .4byte gSharedMem + 0x18000
_0809E3C0: .4byte gSpecialVar_0x8005
_0809E3C4:
	movs r0, 0x20
	bl PlaySE
	ldrb r1, [r5]
	adds r0, r4, 0
	bl sub_809F9D0
	b _0809E3EE
_0809E3D4:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809E3EE
	ldr r0, _0809E3F4 @ =gSharedMem + 0x18000
	adds r0, 0x7A
	movs r1, 0x4
	strb r1, [r0]
	ldr r0, _0809E3F8 @ =gSpecialVar_0x8005
	strh r1, [r0]
	adds r0, r4, 0
	bl SummaryScreenExit
_0809E3EE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E3F4: .4byte gSharedMem + 0x18000
_0809E3F8: .4byte gSpecialVar_0x8005
	thumb_func_end sub_809E260

	thumb_func_start sub_809E3FC
sub_809E3FC: @ 809E3FC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	ldr r0, _0809E438 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r2, 0x80
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _0809E502
	ldr r0, _0809E43C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0809E448
	ldr r1, _0809E440 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x4
	strh r1, [r0, 0x8]
	subs r1, 0x5
	ldr r2, _0809E444 @ =gSharedMem + 0x18079
	adds r0, r5, 0
	bl sub_809E8F0
	b _0809E502
	.align 2, 0
_0809E438: .4byte gPaletteFade
_0809E43C: .4byte gMain
_0809E440: .4byte gTasks
_0809E444: .4byte gSharedMem + 0x18079
_0809E448:
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _0809E474
	ldr r1, _0809E46C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x4
	strh r1, [r0, 0x8]
	ldr r2, _0809E470 @ =gSharedMem + 0x18079
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_809E8F0
	b _0809E502
	.align 2, 0
_0809E46C: .4byte gTasks
_0809E470: .4byte gSharedMem + 0x18079
_0809E474:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809E4EE
	ldr r4, _0809E4A8 @ =gSharedMem + 0x18000
	adds r6, r4, 0
	adds r6, 0x79
	ldrb r0, [r6]
	cmp r0, 0x4
	beq _0809E4E0
	adds r0, r4, 0
	adds r0, 0x7B
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809E4E0
	adds r0, r4, 0
	adds r0, 0x10
	bl sub_809E508
	lsls r0, 24
	cmp r0, 0
	bne _0809E4AC
	movs r0, 0x20
	bl PlaySE
	b _0809E502
	.align 2, 0
_0809E4A8: .4byte gSharedMem + 0x18000
_0809E4AC:
	movs r0, 0x5
	bl PlaySE
	ldrb r1, [r6]
	adds r0, r4, 0
	adds r0, 0x7A
	strb r1, [r0]
	movs r0, 0x1
	bl sub_80A1B40
	movs r0, 0x13
	bl sub_80A1A30
	ldr r1, _0809E4D8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809E4DC @ =sub_809E534
	str r1, [r0]
	b _0809E502
	.align 2, 0
_0809E4D8: .4byte gTasks
_0809E4DC: .4byte sub_809E534
_0809E4E0:
	movs r0, 0x5
	bl PlaySE
	adds r0, r7, 0
	bl sub_809EAC8
	b _0809E502
_0809E4EE:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809E502
	movs r0, 0x5
	bl PlaySE
	adds r0, r7, 0
	bl sub_809EAC8
_0809E502:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_809E3FC

	thumb_func_start sub_809E508
sub_809E508: @ 809E508
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0x1
_0809E50E:
	adds r0, r5, 0
	adds r1, r4, 0
	bl GetMonMove
	lsls r0, 16
	cmp r0, 0
	beq _0809E520
	movs r0, 0x1
	b _0809E52C
_0809E520:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _0809E50E
	movs r0, 0
_0809E52C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809E508

	thumb_func_start sub_809E534
sub_809E534: @ 809E534
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r2, r3, 0
	ldr r0, _0809E564 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0809E570
	ldr r1, _0809E568 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r1, 0x3
	strh r1, [r0, 0x8]
	subs r1, 0x4
	ldr r2, _0809E56C @ =gSharedMem + 0x1807A
	adds r0, r3, 0
	bl sub_809E8F0
	b _0809E5C0
	.align 2, 0
_0809E564: .4byte gMain
_0809E568: .4byte gTasks
_0809E56C: .4byte gSharedMem + 0x1807A
_0809E570:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0809E59C
	ldr r1, _0809E594 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	movs r1, 0x3
	strh r1, [r0, 0x8]
	ldr r2, _0809E598 @ =gSharedMem + 0x1807A
	adds r0, r3, 0
	movs r1, 0x1
	bl sub_809E8F0
	b _0809E5C0
	.align 2, 0
_0809E594: .4byte gTasks
_0809E598: .4byte gSharedMem + 0x1807A
_0809E59C:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0809E5AE
	adds r0, r3, 0
	movs r1, 0x1
	bl sub_809E83C
	b _0809E5C0
_0809E5AE:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809E5C0
	movs r1, 0x1
	negs r1, r1
	adds r0, r2, 0
	bl sub_809E83C
_0809E5C0:
	pop {r0}
	bx r0
	thumb_func_end sub_809E534

	thumb_func_start sub_809E5C4
sub_809E5C4: @ 809E5C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	ldr r1, _0809E6D0 @ =gSharedMem + 0x18000
	ldr r5, [r1]
	ldrb r2, [r1, 0x9]
	movs r0, 0x64
	muls r0, r2
	adds r5, r0
	adds r0, r1, 0
	adds r0, 0x79
	ldrb r0, [r0]
	mov r8, r0
	adds r1, 0x7A
	ldrb r6, [r1]
	adds r0, 0xD
	str r0, [sp, 0x8]
	adds r0, r5, 0
	ldr r1, [sp, 0x8]
	bl GetMonData
	mov r1, sp
	adds r1, 0x2
	str r1, [sp, 0x14]
	strh r0, [r1]
	adds r2, r6, 0
	adds r2, 0xD
	str r2, [sp, 0xC]
	adds r0, r5, 0
	adds r1, r2, 0
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	mov r3, r8
	adds r3, 0x11
	str r3, [sp, 0x10]
	adds r0, r5, 0
	adds r1, r3, 0
	bl GetMonData
	mov r7, sp
	adds r7, 0x5
	str r7, [sp, 0x18]
	strb r0, [r7]
	adds r0, r6, 0
	adds r0, 0x11
	str r0, [sp, 0x1C]
	adds r0, r5, 0
	ldr r1, [sp, 0x1C]
	bl GetMonData
	add r1, sp, 0x4
	mov r10, r1
	strb r0, [r1]
	adds r0, r5, 0
	movs r1, 0x15
	bl GetMonData
	mov r4, sp
	adds r4, 0x6
	strb r0, [r4]
	ldr r1, _0809E6D4 @ =gUnknown_08208238
	mov r2, r8
	adds r0, r2, r1
	ldrb r0, [r0]
	mov r9, r0
	ldrb r0, [r4]
	adds r2, r0, 0
	mov r3, r9
	ands r2, r3
	mov r7, r8
	lsls r7, 1
	mov r8, r7
	asrs r2, r7
	lsls r2, 24
	lsrs r2, 24
	adds r1, r6, r1
	ldrb r3, [r1]
	adds r1, r0, 0
	ands r1, r3
	lsls r6, 1
	asrs r1, r6
	lsls r1, 24
	lsrs r1, 24
	mov r7, r9
	bics r0, r7
	strb r0, [r4]
	ldrb r0, [r4]
	bics r0, r3
	strb r0, [r4]
	lsls r2, r6
	mov r0, r8
	lsls r1, r0
	adds r2, r1
	ldrb r0, [r4]
	orrs r0, r2
	strb r0, [r4]
	adds r0, r5, 0
	ldr r1, [sp, 0x8]
	mov r2, sp
	bl SetMonData
	adds r0, r5, 0
	ldr r1, [sp, 0xC]
	ldr r2, [sp, 0x14]
	bl SetMonData
	adds r0, r5, 0
	ldr r1, [sp, 0x10]
	mov r2, r10
	bl SetMonData
	adds r0, r5, 0
	ldr r1, [sp, 0x1C]
	ldr r2, [sp, 0x18]
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0x15
	adds r2, r4, 0
	bl SetMonData
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E6D0: .4byte gSharedMem + 0x18000
_0809E6D4: .4byte gUnknown_08208238
	thumb_func_end sub_809E5C4

	thumb_func_start sub_809E6D8
sub_809E6D8: @ 809E6D8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	ldr r2, _0809E7E8 @ =gSharedMem + 0x18000
	ldr r5, [r2]
	ldrb r1, [r2, 0x9]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	adds r5, r0
	adds r0, r2, 0
	adds r0, 0x79
	ldrb r0, [r0]
	mov r8, r0
	adds r2, 0x7A
	ldrb r6, [r2]
	adds r0, 0xD
	str r0, [sp, 0x8]
	adds r0, r5, 0
	ldr r1, [sp, 0x8]
	bl GetBoxMonData
	mov r1, sp
	adds r1, 0x2
	str r1, [sp, 0x14]
	strh r0, [r1]
	adds r2, r6, 0
	adds r2, 0xD
	str r2, [sp, 0xC]
	adds r0, r5, 0
	adds r1, r2, 0
	bl GetBoxMonData
	mov r1, sp
	strh r0, [r1]
	mov r3, r8
	adds r3, 0x11
	str r3, [sp, 0x10]
	adds r0, r5, 0
	adds r1, r3, 0
	bl GetBoxMonData
	mov r7, sp
	adds r7, 0x5
	str r7, [sp, 0x18]
	strb r0, [r7]
	adds r0, r6, 0
	adds r0, 0x11
	str r0, [sp, 0x1C]
	adds r0, r5, 0
	ldr r1, [sp, 0x1C]
	bl GetBoxMonData
	add r1, sp, 0x4
	mov r10, r1
	strb r0, [r1]
	adds r0, r5, 0
	movs r1, 0x15
	bl GetBoxMonData
	mov r4, sp
	adds r4, 0x6
	strb r0, [r4]
	ldr r1, _0809E7EC @ =gUnknown_08208238
	mov r2, r8
	adds r0, r2, r1
	ldrb r0, [r0]
	mov r9, r0
	ldrb r0, [r4]
	adds r2, r0, 0
	mov r3, r9
	ands r2, r3
	mov r7, r8
	lsls r7, 1
	mov r8, r7
	asrs r2, r7
	lsls r2, 24
	lsrs r2, 24
	adds r1, r6, r1
	ldrb r3, [r1]
	adds r1, r0, 0
	ands r1, r3
	lsls r6, 1
	asrs r1, r6
	lsls r1, 24
	lsrs r1, 24
	mov r7, r9
	bics r0, r7
	strb r0, [r4]
	ldrb r0, [r4]
	bics r0, r3
	strb r0, [r4]
	lsls r2, r6
	mov r0, r8
	lsls r1, r0
	adds r2, r1
	ldrb r0, [r4]
	orrs r0, r2
	strb r0, [r4]
	adds r0, r5, 0
	ldr r1, [sp, 0x8]
	mov r2, sp
	bl SetBoxMonData
	adds r0, r5, 0
	ldr r1, [sp, 0xC]
	ldr r2, [sp, 0x14]
	bl SetBoxMonData
	adds r0, r5, 0
	ldr r1, [sp, 0x10]
	mov r2, r10
	bl SetBoxMonData
	adds r0, r5, 0
	ldr r1, [sp, 0x1C]
	ldr r2, [sp, 0x18]
	bl SetBoxMonData
	adds r0, r5, 0
	movs r1, 0x15
	adds r2, r4, 0
	bl SetBoxMonData
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809E7E8: .4byte gSharedMem + 0x18000
_0809E7EC: .4byte gUnknown_08208238
	thumb_func_end sub_809E6D8

	thumb_func_start sub_809E7F0
sub_809E7F0: @ 809E7F0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_809F5F8
	lsls r0, 24
	cmp r0, 0
	beq _0809E828
	ldr r1, _0809E830 @ =gSharedMem + 0x18000
	adds r2, r1, 0
	adds r2, 0x74
	movs r0, 0
	strb r0, [r2]
	adds r0, r1, 0
	adds r0, 0x10
	adds r1, 0x79
	bl sub_80A0428
	ldr r1, _0809E834 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809E838 @ =sub_809E3FC
	str r1, [r0]
	adds r0, r4, 0
	bl sub_80A2078
_0809E828:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809E830: .4byte gSharedMem + 0x18000
_0809E834: .4byte gTasks
_0809E838: .4byte sub_809E3FC
	thumb_func_end sub_809E7F0

	thumb_func_start sub_809E83C
sub_809E83C: @ 809E83C
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x13
	bl sub_80A1B1C
	movs r0, 0
	bl sub_80A1B40
	cmp r4, 0x1
	bne _0809E8C0
	ldr r1, _0809E87C @ =gSharedMem + 0x18000
	adds r0, r1, 0
	adds r0, 0x79
	adds r2, r1, 0
	adds r2, 0x7A
	ldrb r0, [r0]
	ldrb r2, [r2]
	cmp r0, r2
	beq _0809E8CA
	ldrb r0, [r1, 0xE]
	cmp r0, 0
	bne _0809E880
	bl sub_809E5C4
	b _0809E884
	.align 2, 0
_0809E87C: .4byte gSharedMem + 0x18000
_0809E880:
	bl sub_809E6D8
_0809E884:
	ldr r4, _0809E8B4 @ =gSharedMem + 0x18000
	adds r0, r4, 0
	adds r0, 0x7A
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x79
	strb r0, [r1]
	adds r0, r4, 0
	adds r0, 0x10
	bl sub_809F678
	adds r1, r4, 0
	adds r1, 0x74
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _0809E8B8 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809E8BC @ =sub_809E7F0
	str r1, [r0]
	b _0809E8DE
	.align 2, 0
_0809E8B4: .4byte gSharedMem + 0x18000
_0809E8B8: .4byte gTasks
_0809E8BC: .4byte sub_809E7F0
_0809E8C0:
	ldr r0, _0809E8E4 @ =gSharedMem + 0x18010
	adds r1, r0, 0
	adds r1, 0x69
	bl sub_80A0428
_0809E8CA:
	ldr r0, _0809E8E8 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0809E8EC @ =sub_809E3FC
	str r0, [r1]
	adds r0, r5, 0
	bl sub_80A2078
_0809E8DE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809E8E4: .4byte gSharedMem + 0x18010
_0809E8E8: .4byte gTasks
_0809E8EC: .4byte sub_809E3FC
	thumb_func_end sub_809E83C

	thumb_func_start sub_809E8F0
sub_809E8F0: @ 809E8F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r4, r1, 0
	mov r9, r2
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0x5
	bl PlaySE
	mov r1, r9
	ldrb r6, [r1]
	ldr r1, _0809E944 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x8]
	movs r2, 0
	lsls r4, 24
	asrs r4, 24
	mov r10, r4
	lsls r7, r0, 24
_0809E930:
	lsls r0, r6, 24
	asrs r0, 24
	add r0, r10
	lsls r0, 24
	lsrs r6, r0, 24
	asrs r1, r0, 24
	cmp r0, r7
	ble _0809E948
	movs r6, 0
	b _0809E94E
	.align 2, 0
_0809E944: .4byte gTasks
_0809E948:
	cmp r1, 0
	bge _0809E94E
	lsrs r6, r7, 24
_0809E94E:
	lsls r4, r6, 24
	lsrs r1, r4, 24
	ldr r0, _0809EA10 @ =gSharedMem + 0x18010
	str r2, [sp, 0x4]
	bl GetMonMove
	lsls r0, 16
	adds r5, r4, 0
	ldr r2, [sp, 0x4]
	cmp r0, 0
	bne _0809E97A
	asrs r0, r5, 24
	cmp r0, 0x4
	beq _0809E97A
	lsls r0, r2, 24
	movs r3, 0x80
	lsls r3, 17
	adds r0, r3
	lsrs r2, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _0809E930
_0809E97A:
	mov r1, r9
	ldrb r0, [r1]
	cmp r0, 0x4
	bne _0809E996
	asrs r0, r5, 24
	cmp r0, 0x4
	beq _0809E996
	ldr r0, _0809EA14 @ =gSharedMem + 0x18000
	adds r0, 0x7C
	ldrh r0, [r0]
	mov r2, r8
	lsls r7, r2, 2
	cmp r0, 0
	beq _0809E9AC
_0809E996:
	ldr r2, _0809EA18 @ =gTasks
	mov r3, r8
	lsls r1, r3, 2
	adds r0, r1, r3
	lsls r0, 3
	adds r0, r2
	movs r2, 0x22
	ldrsh r0, [r0, r2]
	adds r7, r1, 0
	cmp r0, 0x1
	bne _0809E9D0
_0809E9AC:
	lsrs r4, r5, 24
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_80A1488
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_80A1654
	ldr r1, _0809EA18 @ =gTasks
	mov r3, r8
	adds r0, r7, r3
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x22]
	movs r0, 0
	str r0, [sp]
_0809E9D0:
	mov r1, r9
	ldrb r0, [r1]
	cmp r0, 0x4
	beq _0809E9FE
	asrs r0, r5, 24
	cmp r0, 0x4
	bne _0809E9FE
	ldr r0, _0809EA14 @ =gSharedMem + 0x18000
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0
	bne _0809E9FE
	movs r4, 0x2
	negs r4, r4
	lsrs r5, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80A1488
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80A1654
_0809E9FE:
	mov r2, r9
	strb r6, [r2]
	ldr r0, _0809EA1C @ =gSharedMem + 0x18079
	cmp r9, r0
	bne _0809EA20
	movs r0, 0
	bl sub_80A1C30
	b _0809EA26
	.align 2, 0
_0809EA10: .4byte gSharedMem + 0x18010
_0809EA14: .4byte gSharedMem + 0x18000
_0809EA18: .4byte gTasks
_0809EA1C: .4byte gSharedMem + 0x18079
_0809EA20:
	movs r0, 0x1
	bl sub_80A1C30
_0809EA26:
	ldr r3, [sp]
	cmp r3, 0
	beq _0809EA34
	ldr r0, _0809EA4C @ =gSharedMem + 0x18010
	mov r1, r9
	bl sub_80A0428
_0809EA34:
	mov r0, r8
	bl sub_80A2078
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809EA4C: .4byte gSharedMem + 0x18010
	thumb_func_end sub_809E8F0

	thumb_func_start SummaryScreenHandleAButton
SummaryScreenHandleAButton: @ 809EA50
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x5
	bl PlaySE
	ldr r4, _0809EABC @ =gSharedMem + 0x18000
	adds r1, r4, 0
	adds r1, 0x79
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0
	bl sub_80A1488
	movs r0, 0x2
	movs r1, 0
	bl sub_80A1654
	adds r0, r4, 0
	adds r0, 0x7B
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809EA8C
	adds r1, r4, 0
	adds r1, 0x7F
	movs r0, 0x5
	strb r0, [r1]
	bl PrintSummaryWindowHeaderText
_0809EA8C:
	movs r0, 0
	bl sub_80A16CC
	adds r0, r4, 0
	adds r0, 0x10
	bl sub_80A029C
	movs r0, 0x9
	bl sub_80A1A30
	ldr r1, _0809EAC0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809EAC4 @ =sub_809E3FC
	str r1, [r0]
	adds r0, r5, 0
	bl sub_80A2078
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809EABC: .4byte gSharedMem + 0x18000
_0809EAC0: .4byte gTasks
_0809EAC4: .4byte sub_809E3FC
	thumb_func_end SummaryScreenHandleAButton

	thumb_func_start sub_809EAC8
sub_809EAC8: @ 809EAC8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _0809EB34 @ =gSharedMem + 0x18000
	adds r0, r6, 0
	adds r0, 0x79
	ldrb r0, [r0]
	cmp r0, 0x4
	beq _0809EAEE
	movs r4, 0x2
	negs r4, r4
	adds r0, r4, 0
	movs r1, 0
	bl sub_80A1488
	adds r0, r4, 0
	movs r1, 0
	bl sub_80A1654
_0809EAEE:
	movs r0, 0x9
	bl sub_80A1B1C
	movs r0, 0x1
	bl sub_80A16CC
	movs r0, 0xF
	movs r1, 0xC
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	movs r0, 0xB
	movs r1, 0xF
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	adds r1, r6, 0
	adds r1, 0x7F
	movs r0, 0x6
	strb r0, [r1]
	bl PrintSummaryWindowHeaderText
	ldr r1, _0809EB38 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809EB3C @ =SummaryScreenHandleKeyInput
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809EB34: .4byte gSharedMem + 0x18000
_0809EB38: .4byte gTasks
_0809EB3C: .4byte SummaryScreenHandleKeyInput
	thumb_func_end sub_809EAC8

	thumb_func_start sub_809EB40
sub_809EB40: @ 809EB40
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0809EB6C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0809EB74
	cmp r0, 0x5
	bne _0809EBA4
	movs r0, 0x9
	bl sub_80A1A30
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r0, _0809EB70 @ =sub_809E260
	str r0, [r4]
	b _0809EBB4
	.align 2, 0
_0809EB6C: .4byte gTasks
_0809EB70: .4byte sub_809E260
_0809EB74:
	ldr r4, _0809EBBC @ =gSharedMem + 0x18000
	adds r6, r4, 0
	adds r6, 0x79
	strb r0, [r6]
	adds r0, r4, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0
	beq _0809EB96
	movs r0, 0xA
	movs r1, 0
	bl sub_80A1488
	ldrb r1, [r6]
	movs r0, 0xA
	bl sub_80A1654
_0809EB96:
	movs r0, 0
	bl sub_80A16CC
	adds r0, r4, 0
	adds r0, 0x10
	bl sub_80A029C
_0809EBA4:
	ldr r0, _0809EBC0 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_0809EBB4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809EBBC: .4byte gSharedMem + 0x18000
_0809EBC0: .4byte gTasks
	thumb_func_end sub_809EB40

	thumb_func_start sub_809EBC4
sub_809EBC4: @ 809EBC4
	push {r4,lr}
	ldr r4, _0809EC28 @ =gSharedMem + 0x18000
	ldrb r0, [r4, 0xB]
	cmp r0, 0
	beq _0809EC22
	bl DrawSummaryScreenNavigationDots
	ldr r0, _0809EC2C @ =gUnknown_030042C0
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	strh r1, [r0]
	ldrb r0, [r4, 0xB]
	cmp r0, 0x1
	bne _0809EBF4
	ldr r2, _0809EC30 @ =REG_BG1CNT
	ldrh r1, [r2]
	ldr r0, _0809EC34 @ =0x0000e0ff
	ands r0, r1
	movs r3, 0x80
	lsls r3, 4
	adds r1, r3, 0
	adds r0, r1
	strh r0, [r2]
_0809EBF4:
	ldrb r3, [r4, 0xB]
	cmp r3, 0x2
	bne _0809EC0C
	ldr r2, _0809EC30 @ =REG_BG1CNT
	ldrh r1, [r2]
	ldr r0, _0809EC34 @ =0x0000e0ff
	ands r0, r1
	movs r4, 0xA0
	lsls r4, 4
	adds r1, r4, 0
	adds r0, r1
	strh r0, [r2]
_0809EC0C:
	cmp r3, 0x3
	bne _0809EC22
	ldr r2, _0809EC30 @ =REG_BG1CNT
	ldrh r1, [r2]
	ldr r0, _0809EC34 @ =0x0000e0ff
	ands r0, r1
	movs r3, 0xC0
	lsls r3, 4
	adds r1, r3, 0
	adds r0, r1
	strh r0, [r2]
_0809EC22:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809EC28: .4byte gSharedMem + 0x18000
_0809EC2C: .4byte gUnknown_030042C0
_0809EC30: .4byte REG_BG1CNT
_0809EC34: .4byte 0x0000e0ff
	thumb_func_end sub_809EBC4

	thumb_func_start sub_809EC38
sub_809EC38: @ 809EC38
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0809EC5C @ =gTasks + 0x8
	adds r6, r0, r1
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x5
	bls _0809EC52
	b _0809EE64
_0809EC52:
	lsls r0, 2
	ldr r1, _0809EC60 @ =_0809EC64
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809EC5C: .4byte gTasks + 0x8
_0809EC60: .4byte _0809EC64
	.align 2, 0
_0809EC64:
	.4byte _0809EC7C
	.4byte _0809ED14
	.4byte _0809ED98
	.4byte _0809EE12
	.4byte _0809EE1C
	.4byte _0809EE4C
_0809EC7C:
	ldr r1, _0809ECB8 @ =gSharedMem + 0x18000
	adds r0, r1, 0
	adds r0, 0x80
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809ECC8
	ldrb r3, [r1, 0xB]
	cmp r3, 0
	beq _0809EC98
	ldr r1, _0809ECBC @ =gUnknown_03004288
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
_0809EC98:
	cmp r3, 0x1
	bne _0809ECAE
	ldr r2, _0809ECC0 @ =REG_BG2CNT
	ldrh r1, [r2]
	ldr r0, _0809ECC4 @ =0x0000e0ff
	ands r0, r1
	movs r4, 0x80
	lsls r4, 4
	adds r1, r4, 0
	adds r0, r1
	strh r0, [r2]
_0809ECAE:
	cmp r3, 0x2
	beq _0809ECB4
	b _0809EE3A
_0809ECB4:
	ldr r2, _0809ECC0 @ =REG_BG2CNT
	b _0809ECF6
	.align 2, 0
_0809ECB8: .4byte gSharedMem + 0x18000
_0809ECBC: .4byte gUnknown_03004288
_0809ECC0: .4byte REG_BG2CNT
_0809ECC4: .4byte 0x0000e0ff
_0809ECC8:
	ldrb r3, [r1, 0xB]
	cmp r3, 0
	beq _0809ECD8
	ldr r1, _0809ED08 @ =gUnknown_030042C0
	movs r4, 0x80
	lsls r4, 1
	adds r0, r4, 0
	strh r0, [r1]
_0809ECD8:
	cmp r3, 0x1
	bne _0809ECEE
	ldr r2, _0809ED0C @ =REG_BG1CNT
	ldrh r1, [r2]
	ldr r0, _0809ED10 @ =0x0000e0ff
	ands r0, r1
	movs r4, 0x80
	lsls r4, 4
	adds r1, r4, 0
	adds r0, r1
	strh r0, [r2]
_0809ECEE:
	cmp r3, 0x2
	beq _0809ECF4
	b _0809EE3A
_0809ECF4:
	ldr r2, _0809ED0C @ =REG_BG1CNT
_0809ECF6:
	ldrh r1, [r2]
	ldr r0, _0809ED10 @ =0x0000e0ff
	ands r0, r1
	movs r3, 0xA0
	lsls r3, 4
	adds r1, r3, 0
	adds r0, r1
	strh r0, [r2]
	b _0809EE3A
	.align 2, 0
_0809ED08: .4byte gUnknown_030042C0
_0809ED0C: .4byte REG_BG1CNT
_0809ED10: .4byte 0x0000e0ff
_0809ED14:
	ldr r0, _0809ED48 @ =gSharedMem + 0x18000
	adds r0, 0x80
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809ED5C
	ldr r1, _0809ED4C @ =gUnknown_030042C0
	ldrh r0, [r1]
	subs r0, 0x20
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _0809ED2E
	b _0809EE64
_0809ED2E:
	ldr r3, _0809ED50 @ =REG_BG1CNT
	ldrh r2, [r3]
	ldr r1, _0809ED54 @ =0x0000fffc
	adds r0, r1, 0
	ands r0, r2
	adds r0, 0x2
	strh r0, [r3]
	ldr r2, _0809ED58 @ =REG_BG2CNT
	ldrh r0, [r2]
	ands r1, r0
	adds r1, 0x1
	strh r1, [r2]
	b _0809EE3A
	.align 2, 0
_0809ED48: .4byte gSharedMem + 0x18000
_0809ED4C: .4byte gUnknown_030042C0
_0809ED50: .4byte REG_BG1CNT
_0809ED54: .4byte 0x0000fffc
_0809ED58: .4byte REG_BG2CNT
_0809ED5C:
	ldr r1, _0809ED88 @ =gUnknown_03004288
	ldrh r0, [r1]
	subs r0, 0x20
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _0809ED6C
	b _0809EE64
_0809ED6C:
	ldr r3, _0809ED8C @ =REG_BG1CNT
	ldrh r2, [r3]
	ldr r1, _0809ED90 @ =0x0000fffc
	adds r0, r1, 0
	ands r0, r2
	adds r0, 0x1
	strh r0, [r3]
	ldr r2, _0809ED94 @ =REG_BG2CNT
	ldrh r0, [r2]
	ands r1, r0
	adds r1, 0x2
	strh r1, [r2]
	b _0809EE3A
	.align 2, 0
_0809ED88: .4byte gUnknown_03004288
_0809ED8C: .4byte REG_BG1CNT
_0809ED90: .4byte 0x0000fffc
_0809ED94: .4byte REG_BG2CNT
_0809ED98:
	ldr r1, _0809EDD4 @ =gSharedMem + 0x18000
	ldrb r3, [r1, 0xB]
	adds r0, r3, 0x1
	adds r2, r1, 0
	adds r2, 0x7E
	strb r0, [r2]
	ldrb r2, [r1, 0x8]
	subs r0, r2, 0x2
	lsls r0, 24
	lsrs r0, 24
	adds r5, r1, 0
	cmp r0, 0x1
	bhi _0809EDD8
	adds r1, 0x7F
	movs r0, 0
	strb r0, [r1]
	adds r4, r5, 0
	adds r4, 0x10
	adds r0, r4, 0
	bl sub_80A029C
	adds r5, 0x79
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80A0428
	ldrb r0, [r5]
	bl sub_80A00F4
	b _0809EE3A
	.align 2, 0
_0809EDD4: .4byte gSharedMem + 0x18000
_0809EDD8:
	lsls r0, r3, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0809EDFA
	adds r0, r5, 0
	adds r0, 0x7B
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809EDF2
	lsls r0, r2, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _0809EDFA
_0809EDF2:
	adds r1, r5, 0
	adds r1, 0x7F
	movs r0, 0x6
	b _0809EE0E
_0809EDFA:
	ldrb r0, [r5, 0xB]
	cmp r0, 0
	bne _0809EE08
	adds r1, r5, 0
	adds r1, 0x7F
	movs r0, 0x7
	b _0809EE0E
_0809EE08:
	adds r1, r5, 0
	adds r1, 0x7F
	movs r0, 0
_0809EE0E:
	strb r0, [r1]
	b _0809EE3A
_0809EE12:
	bl DrawSummaryScreenNavigationDots
	bl PrintSummaryWindowHeaderText
	b _0809EE3A
_0809EE1C:
	ldr r0, _0809EE44 @ =gUnknown_083C1598
	ldr r4, _0809EE48 @ =gSharedMem + 0x18000
	ldrb r1, [r4, 0xB]
	lsls r1, 2
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x10
	ldr r1, [r1]
	bl _call_via_r1
	adds r4, 0x80
	ldrb r0, [r4]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r4]
_0809EE3A:
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	b _0809EE64
	.align 2, 0
_0809EE44: .4byte gUnknown_083C1598
_0809EE48: .4byte gSharedMem + 0x18000
_0809EE4C:
	bl sub_8055870
	cmp r0, 0x1
	beq _0809EE64
	ldr r1, _0809EE6C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809EE70 @ =gUnknown_03005CF0
	ldr r1, [r1]
	str r1, [r0]
_0809EE64:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809EE6C: .4byte gTasks
_0809EE70: .4byte gUnknown_03005CF0
	thumb_func_end sub_809EC38

	thumb_func_start sub_809EE74
sub_809EE74: @ 809EE74
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0809EE98 @ =gTasks + 0x8
	adds r6, r0, r1
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x6
	bls _0809EE8E
	b _0809F0C0
_0809EE8E:
	lsls r0, 2
	ldr r1, _0809EE9C @ =_0809EEA0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809EE98: .4byte gTasks + 0x8
_0809EE9C: .4byte _0809EEA0
	.align 2, 0
_0809EEA0:
	.4byte _0809EEBC
	.4byte _0809EEE0
	.4byte _0809EFB4
	.4byte _0809EFF4
	.4byte _0809F06E
	.4byte _0809F078
	.4byte _0809F0A8
_0809EEBC:
	ldr r0, _0809EECC @ =gSharedMem + 0x18000
	adds r0, 0x80
	ldrb r1, [r0]
	cmp r1, 0
	bne _0809EED4
	ldr r0, _0809EED0 @ =gUnknown_03004288
	strh r1, [r0]
	b _0809F096
	.align 2, 0
_0809EECC: .4byte gSharedMem + 0x18000
_0809EED0: .4byte gUnknown_03004288
_0809EED4:
	ldr r1, _0809EEDC @ =gUnknown_030042C0
	movs r0, 0
	strh r0, [r1]
	b _0809F096
	.align 2, 0
_0809EEDC: .4byte gUnknown_030042C0
_0809EEE0:
	ldr r1, _0809EF30 @ =gSharedMem + 0x18000
	adds r0, r1, 0
	adds r0, 0x80
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809EF4C
	ldrb r3, [r1, 0xB]
	cmp r3, 0x1
	bne _0809EF02
	ldr r2, _0809EF34 @ =REG_BG2CNT
	ldrh r1, [r2]
	ldr r0, _0809EF38 @ =0x0000e0fc
	ands r0, r1
	ldr r4, _0809EF3C @ =0x00000801
	adds r1, r4, 0
	adds r0, r1
	strh r0, [r2]
_0809EF02:
	cmp r3, 0x2
	bne _0809EF16
	ldr r2, _0809EF34 @ =REG_BG2CNT
	ldrh r1, [r2]
	ldr r0, _0809EF38 @ =0x0000e0fc
	ands r0, r1
	ldr r4, _0809EF40 @ =0x00000a01
	adds r1, r4, 0
	adds r0, r1
	strh r0, [r2]
_0809EF16:
	cmp r3, 0x3
	bne _0809EF2A
	ldr r2, _0809EF34 @ =REG_BG2CNT
	ldrh r1, [r2]
	ldr r0, _0809EF38 @ =0x0000e0fc
	ands r0, r1
	ldr r3, _0809EF44 @ =0x00000c01
	adds r1, r3, 0
	adds r0, r1
	strh r0, [r2]
_0809EF2A:
	ldr r2, _0809EF48 @ =REG_BG1CNT
	b _0809EF8C
	.align 2, 0
_0809EF30: .4byte gSharedMem + 0x18000
_0809EF34: .4byte REG_BG2CNT
_0809EF38: .4byte 0x0000e0fc
_0809EF3C: .4byte 0x00000801
_0809EF40: .4byte 0x00000a01
_0809EF44: .4byte 0x00000c01
_0809EF48: .4byte REG_BG1CNT
_0809EF4C:
	ldrb r3, [r1, 0xB]
	cmp r3, 0x1
	bne _0809EF62
	ldr r2, _0809EF98 @ =REG_BG1CNT
	ldrh r1, [r2]
	ldr r0, _0809EF9C @ =0x0000e0fc
	ands r0, r1
	ldr r4, _0809EFA0 @ =0x00000801
	adds r1, r4, 0
	adds r0, r1
	strh r0, [r2]
_0809EF62:
	cmp r3, 0x2
	bne _0809EF76
	ldr r2, _0809EF98 @ =REG_BG1CNT
	ldrh r1, [r2]
	ldr r0, _0809EF9C @ =0x0000e0fc
	ands r0, r1
	ldr r4, _0809EFA4 @ =0x00000a01
	adds r1, r4, 0
	adds r0, r1
	strh r0, [r2]
_0809EF76:
	cmp r3, 0x3
	bne _0809EF8A
	ldr r2, _0809EF98 @ =REG_BG1CNT
	ldrh r1, [r2]
	ldr r0, _0809EF9C @ =0x0000e0fc
	ands r0, r1
	ldr r3, _0809EFA8 @ =0x00000c01
	adds r1, r3, 0
	adds r0, r1
	strh r0, [r2]
_0809EF8A:
	ldr r2, _0809EFAC @ =REG_BG2CNT
_0809EF8C:
	ldrh r1, [r2]
	ldr r0, _0809EFB0 @ =0x0000fffc
	ands r0, r1
	adds r0, 0x2
	strh r0, [r2]
	b _0809F096
	.align 2, 0
_0809EF98: .4byte REG_BG1CNT
_0809EF9C: .4byte 0x0000e0fc
_0809EFA0: .4byte 0x00000801
_0809EFA4: .4byte 0x00000a01
_0809EFA8: .4byte 0x00000c01
_0809EFAC: .4byte REG_BG2CNT
_0809EFB0: .4byte 0x0000fffc
_0809EFB4:
	ldr r0, _0809EFD4 @ =gSharedMem + 0x18000
	adds r0, 0x80
	ldrb r0, [r0]
	cmp r0, 0
	bne _0809EFDC
	ldr r0, _0809EFD8 @ =gUnknown_03004288
	ldrh r1, [r0]
	adds r1, 0x20
	strh r1, [r0]
	lsls r1, 16
	movs r0, 0x80
	lsls r0, 17
	cmp r1, r0
	bne _0809F0C0
	b _0809F096
	.align 2, 0
_0809EFD4: .4byte gSharedMem + 0x18000
_0809EFD8: .4byte gUnknown_03004288
_0809EFDC:
	ldr r0, _0809EFF0 @ =gUnknown_030042C0
	ldrh r1, [r0]
	adds r1, 0x20
	strh r1, [r0]
	lsls r1, 16
	movs r0, 0x80
	lsls r0, 17
	cmp r1, r0
	bne _0809F0C0
	b _0809F096
	.align 2, 0
_0809EFF0: .4byte gUnknown_030042C0
_0809EFF4:
	ldr r1, _0809F030 @ =gSharedMem + 0x18000
	ldrb r3, [r1, 0xB]
	adds r0, r3, 0x1
	adds r2, r1, 0
	adds r2, 0x7E
	strb r0, [r2]
	ldrb r2, [r1, 0x8]
	subs r0, r2, 0x2
	lsls r0, 24
	lsrs r0, 24
	adds r5, r1, 0
	cmp r0, 0x1
	bhi _0809F034
	adds r1, 0x7F
	movs r0, 0
	strb r0, [r1]
	adds r4, r5, 0
	adds r4, 0x10
	adds r0, r4, 0
	bl sub_80A029C
	adds r5, 0x79
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80A0428
	ldrb r0, [r5]
	bl sub_80A00F4
	b _0809F096
	.align 2, 0
_0809F030: .4byte gSharedMem + 0x18000
_0809F034:
	lsls r0, r3, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _0809F056
	adds r0, r5, 0
	adds r0, 0x7B
	ldrb r0, [r0]
	cmp r0, 0
	beq _0809F04E
	lsls r0, r2, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _0809F056
_0809F04E:
	adds r1, r5, 0
	adds r1, 0x7F
	movs r0, 0x6
	b _0809F06A
_0809F056:
	ldrb r0, [r5, 0xB]
	cmp r0, 0
	bne _0809F064
	adds r1, r5, 0
	adds r1, 0x7F
	movs r0, 0x7
	b _0809F06A
_0809F064:
	adds r1, r5, 0
	adds r1, 0x7F
	movs r0, 0
_0809F06A:
	strb r0, [r1]
	b _0809F096
_0809F06E:
	bl DrawSummaryScreenNavigationDots
	bl PrintSummaryWindowHeaderText
	b _0809F096
_0809F078:
	ldr r0, _0809F0A0 @ =gUnknown_083C1598
	ldr r4, _0809F0A4 @ =gSharedMem + 0x18000
	ldrb r1, [r4, 0xB]
	lsls r1, 2
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x10
	ldr r1, [r1]
	bl _call_via_r1
	adds r4, 0x80
	ldrb r0, [r4]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r4]
_0809F096:
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	b _0809F0C0
	.align 2, 0
_0809F0A0: .4byte gUnknown_083C1598
_0809F0A4: .4byte gSharedMem + 0x18000
_0809F0A8:
	bl sub_8055870
	cmp r0, 0x1
	beq _0809F0C0
	ldr r1, _0809F0C8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809F0CC @ =gUnknown_03005CF0
	ldr r1, [r1]
	str r1, [r0]
_0809F0C0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809F0C8: .4byte gTasks
_0809F0CC: .4byte gUnknown_03005CF0
	thumb_func_end sub_809EE74

	thumb_func_start sub_809F0D0
sub_809F0D0: @ 809F0D0
	push {r4-r7,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0809F110 @ =gSharedMem + 0x18000
	ldrb r0, [r1, 0xB]
	adds r0, r4
	movs r5, 0
	strb r0, [r1, 0xB]
	ldr r2, _0809F114 @ =gUnknown_03005CF0
	ldr r1, _0809F118 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r6, r0, r1
	ldr r0, [r6]
	str r0, [r2]
	bl sub_809FBE4
	strh r5, [r6, 0x8]
	lsls r4, 24
	asrs r4, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	bne _0809F120
	ldr r0, _0809F11C @ =sub_809EC38
	str r0, [r6]
	b _0809F12A
	.align 2, 0
_0809F110: .4byte gSharedMem + 0x18000
_0809F114: .4byte gUnknown_03005CF0
_0809F118: .4byte gTasks
_0809F11C: .4byte sub_809EC38
_0809F120:
	ldr r1, _0809F130 @ =sub_809EE74
	str r1, [r6]
	adds r0, r7, 0
	bl _call_via_r1
_0809F12A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F130: .4byte sub_809EE74
	thumb_func_end sub_809F0D0

	thumb_func_start SummaryScreenHandleLeftRightInput
SummaryScreenHandleLeftRightInput: @ 809F134
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r4, _0809F1AC @ =gSharedMem + 0x18010
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0809F1A6
	lsls r0, r5, 24
	asrs r5, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r5, r0
	bne _0809F168
	adds r0, r4, 0
	subs r0, 0x10
	adds r1, r4, 0
	adds r1, 0x65
	ldrb r0, [r0, 0xB]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0809F1A6
_0809F168:
	cmp r5, 0x1
	bne _0809F17C
	adds r0, r4, 0
	subs r0, 0x10
	adds r1, r4, 0
	adds r1, 0x66
	ldrb r0, [r0, 0xB]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0809F1A6
_0809F17C:
	ldr r0, _0809F1B0 @ =sub_80A1334
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0809F1A6
	ldr r0, _0809F1B4 @ =sub_80A1500
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0809F1A6
	movs r0, 0x5
	bl PlaySE
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_809F0D0
_0809F1A6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809F1AC: .4byte gSharedMem + 0x18010
_0809F1B0: .4byte sub_80A1334
_0809F1B4: .4byte sub_80A1500
	thumb_func_end SummaryScreenHandleLeftRightInput

	thumb_func_start SummaryScreenHandleUpDownInput
SummaryScreenHandleUpDownInput: @ 809F1B8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r0, _0809F1E4 @ =gSharedMem + 0x18000
	ldrb r1, [r0, 0xE]
	adds r2, r0, 0
	cmp r1, 0x1
	bne _0809F202
	ldrb r0, [r2, 0xB]
	cmp r0, 0
	beq _0809F1E8
	lsls r1, r4, 24
	asrs r1, 24
	movs r4, 0x1
	eors r1, r4
	negs r0, r1
	orrs r0, r1
	lsrs r4, r0, 31
	b _0809F1F4
	.align 2, 0
_0809F1E4: .4byte gSharedMem + 0x18000
_0809F1E8:
	lsls r0, r4, 24
	asrs r0, 24
	movs r4, 0x3
	cmp r0, 0x1
	bne _0809F1F4
	movs r4, 0x2
_0809F1F4:
	ldr r0, [r2]
	ldrb r1, [r2, 0x9]
	ldrb r2, [r2, 0xA]
	adds r3, r4, 0
	bl StorageSystemGetNextMonIndex
	b _0809F22C
_0809F202:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809F224
	bl IsLinkDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809F224
	lsls r0, r4, 24
	asrs r0, 24
	bl sub_809F3CC
	b _0809F22C
_0809F224:
	lsls r0, r4, 24
	asrs r0, 24
	bl sub_809F284
_0809F22C:
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _0809F270
	movs r0, 0x5
	bl PlaySE
	ldr r5, _0809F278 @ =gSharedMem + 0x18010
	adds r0, r5, 0
	bl GetMonStatusAndPokerus
	lsls r0, 24
	cmp r0, 0
	beq _0809F258
	movs r0, 0x2
	negs r0, r0
	bl sub_80A12D0
_0809F258:
	adds r0, r5, 0
	subs r0, 0x10
	strb r4, [r0, 0x9]
	ldr r1, _0809F27C @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, [r0]
	str r1, [r5, 0x74]
	ldr r1, _0809F280 @ =sub_809F43C
	str r1, [r0]
_0809F270:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809F278: .4byte gSharedMem + 0x18010
_0809F27C: .4byte gTasks
_0809F280: .4byte sub_809F43C
	thumb_func_end SummaryScreenHandleUpDownInput

	thumb_func_start sub_809F284
sub_809F284: @ 809F284
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0809F2C0 @ =gSharedMem + 0x18000
	ldr r7, [r0]
	movs r6, 0
	ldrb r1, [r0, 0xB]
	adds r4, r0, 0
	cmp r1, 0
	bne _0809F2C4
	lsls r0, r3, 24
	asrs r2, r0, 24
	movs r1, 0x1
	negs r1, r1
	adds r5, r0, 0
	cmp r2, r1
	bne _0809F2AC
	ldrb r0, [r4, 0x9]
	cmp r0, 0
	beq _0809F2E4
_0809F2AC:
	asrs r0, r5, 24
	cmp r0, 0x1
	bne _0809F2BA
	ldrb r0, [r4, 0x9]
	ldrb r1, [r4, 0xA]
	cmp r0, r1
	bcs _0809F2E4
_0809F2BA:
	ldrb r0, [r4, 0x9]
	adds r0, r3
	b _0809F304
	.align 2, 0
_0809F2C0: .4byte gSharedMem + 0x18000
_0809F2C4:
	lsls r5, r3, 24
_0809F2C6:
	lsls r0, r6, 24
	asrs r0, 24
	asrs r1, r5, 24
	adds r0, r1
	lsls r0, 24
	ldr r4, _0809F2EC @ =gSharedMem + 0x18000
	lsrs r6, r0, 24
	asrs r0, 24
	ldrb r2, [r4, 0x9]
	adds r1, r0, r2
	cmp r1, 0
	blt _0809F2E4
	ldrb r0, [r4, 0xA]
	cmp r1, r0
	ble _0809F2F0
_0809F2E4:
	movs r0, 0x1
	negs r0, r0
	b _0809F308
	.align 2, 0
_0809F2EC: .4byte gSharedMem + 0x18000
_0809F2F0:
	movs r0, 0x64
	muls r0, r1
	adds r0, r7, r0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0809F2C6
	ldrb r0, [r4, 0x9]
	adds r0, r6
_0809F304:
	lsls r0, 24
	asrs r0, 24
_0809F308:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809F284

	thumb_func_start sub_809F310
sub_809F310: @ 809F310
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0809F33C
	ldr r0, _0809F338 @ =gSharedMem + 0x18000
	ldrb r0, [r0, 0xB]
	cmp r0, 0
	bne _0809F332
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0809F33C
_0809F332:
	movs r0, 0x1
	b _0809F33E
	.align 2, 0
_0809F338: .4byte gSharedMem + 0x18000
_0809F33C:
	movs r0, 0
_0809F33E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_809F310

	thumb_func_start sub_809F344
sub_809F344: @ 809F344
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
_0809F34A:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	beq _0809F37C
	ldr r0, _0809F374 @ =gUnknown_083C15A8
	adds r5, r4, r0
	ldrb r1, [r5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0809F378 @ =gPlayerParty
	adds r0, r1
	bl sub_809F310
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809F34A
	movs r0, 0
	ldrsb r0, [r5, r0]
	b _0809F380
	.align 2, 0
_0809F374: .4byte gUnknown_083C15A8
_0809F378: .4byte gPlayerParty
_0809F37C:
	movs r0, 0x1
	negs r0, r0
_0809F380:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809F344

	thumb_func_start sub_809F388
sub_809F388: @ 809F388
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
_0809F38E:
	cmp r4, 0
	beq _0809F3C0
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0809F3B8 @ =gUnknown_083C15A8
	adds r5, r4, r0
	ldrb r1, [r5]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0809F3BC @ =gPlayerParty
	adds r0, r1
	bl sub_809F310
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809F38E
	movs r0, 0
	ldrsb r0, [r5, r0]
	b _0809F3C4
	.align 2, 0
_0809F3B8: .4byte gUnknown_083C15A8
_0809F3BC: .4byte gPlayerParty
_0809F3C0:
	movs r0, 0x1
	negs r0, r0
_0809F3C4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_809F388

	thumb_func_start sub_809F3CC
sub_809F3CC: @ 809F3CC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r2, 0
	movs r1, 0
	ldr r3, _0809F41C @ =gUnknown_083C15A8
	ldr r4, _0809F420 @ =gSharedMem + 0x18000
	ldrb r0, [r3]
	ldrb r5, [r4, 0x9]
	cmp r0, r5
	beq _0809F3FC
	adds r5, r3, 0
	adds r3, r4, 0
_0809F3E6:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x5
	bhi _0809F3FC
	adds r0, r1, r5
	ldrb r0, [r0]
	ldrb r4, [r3, 0x9]
	cmp r0, r4
	bne _0809F3E6
	adds r2, r1, 0
_0809F3FC:
	lsls r0, r6, 24
	asrs r1, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _0809F40C
	cmp r2, 0
	beq _0809F414
_0809F40C:
	cmp r1, 0x1
	bne _0809F424
	cmp r2, 0x5
	bne _0809F42C
_0809F414:
	movs r0, 0x1
	negs r0, r0
	b _0809F436
	.align 2, 0
_0809F41C: .4byte gUnknown_083C15A8
_0809F420: .4byte gSharedMem + 0x18000
_0809F424:
	adds r0, r2, 0
	bl sub_809F388
	b _0809F432
_0809F42C:
	adds r0, r2, 0
	bl sub_809F344
_0809F432:
	lsls r0, 24
	asrs r0, 24
_0809F436:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_809F3CC

	thumb_func_start sub_809F43C
sub_809F43C: @ 809F43C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0809F45C @ =gMain
	ldr r1, _0809F460 @ =0x0000043c
	adds r5, r0, r1
	ldrb r2, [r5]
	adds r3, r0, 0
	cmp r2, 0x8
	bls _0809F452
	b _0809F5CC
_0809F452:
	lsls r0, r2, 2
	ldr r1, _0809F464 @ =_0809F468
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809F45C: .4byte gMain
_0809F460: .4byte 0x0000043c
_0809F464: .4byte _0809F468
	.align 2, 0
_0809F468:
	.4byte _0809F48C
	.4byte _0809F492
	.4byte _0809F4BC
	.4byte _0809F4D8
	.4byte _0809F4F4
	.4byte _0809F51C
	.4byte _0809F578
	.4byte _0809F584
	.4byte _0809F5A0
_0809F48C:
	bl StopCryAndClearCrySongs
	b _0809F5B2
_0809F492:
	ldr r0, _0809F4AC @ =gSharedMem + 0x18000
	ldrb r1, [r0, 0xC]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809F4B0 @ =gSprites
	adds r0, r1
	bl DestroySpriteAndFreeResources
	ldr r1, _0809F4B4 @ =gMain
	ldr r0, _0809F4B8 @ =0x0000043c
	adds r1, r0
	b _0809F5B8
	.align 2, 0
_0809F4AC: .4byte gSharedMem + 0x18000
_0809F4B0: .4byte gSprites
_0809F4B4: .4byte gMain
_0809F4B8: .4byte 0x0000043c
_0809F4BC:
	ldr r0, _0809F4D0 @ =gSharedMem + 0x18000
	ldrb r1, [r0, 0xD]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0809F4D4 @ =gSprites
	adds r0, r1
	bl DestroySpriteAndFreeResources
	b _0809F5B2
	.align 2, 0
_0809F4D0: .4byte gSharedMem + 0x18000
_0809F4D4: .4byte gSprites
_0809F4D8:
	ldr r0, _0809F4EC @ =gSharedMem + 0x18000
	adds r1, r0, 0
	adds r1, 0x74
	movs r2, 0
	strb r2, [r1]
	adds r0, 0x79
	strb r2, [r0]
	ldr r0, _0809F4F0 @ =0x0000043c
	adds r1, r3, r0
	b _0809F5B8
	.align 2, 0
_0809F4EC: .4byte gSharedMem + 0x18000
_0809F4F0: .4byte 0x0000043c
_0809F4F4:
	ldr r4, _0809F518 @ =gSharedMem + 0x18010
	adds r0, r4, 0
	bl sub_809F678
	adds r0, r4, 0
	bl GetMonStatusAndPokerus
	lsls r0, 24
	cmp r0, 0
	beq _0809F50E
	movs r0, 0x2
	bl sub_80A12D0
_0809F50E:
	adds r0, r4, 0
	bl DrawPokerusSurvivorDot
	b _0809F5B2
	.align 2, 0
_0809F518: .4byte gSharedMem + 0x18010
_0809F51C:
	ldr r4, _0809F558 @ =gSharedMem + 0x18010
	adds r5, r4, 0
	adds r5, 0x64
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_809F6B4
	adds r1, r4, 0
	subs r1, 0x10
	strb r0, [r1, 0xC]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0809F5EA
	movs r0, 0
	strb r0, [r5]
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	adds r1, r0, 0
	cmp r1, 0
	beq _0809F560
	ldr r1, _0809F55C @ =gUnknown_030041B0
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	b _0809F564
	.align 2, 0
_0809F558: .4byte gSharedMem + 0x18010
_0809F55C: .4byte gUnknown_030041B0
_0809F560:
	ldr r0, _0809F56C @ =gUnknown_030041B0
	strh r1, [r0]
_0809F564:
	ldr r1, _0809F570 @ =gMain
	ldr r0, _0809F574 @ =0x0000043c
	adds r1, r0
	b _0809F5B8
	.align 2, 0
_0809F56C: .4byte gUnknown_030041B0
_0809F570: .4byte gMain
_0809F574: .4byte 0x0000043c
_0809F578:
	ldr r0, _0809F580 @ =gSharedMem + 0x18010
	bl sub_80A1DCC
	b _0809F5B2
	.align 2, 0
_0809F580: .4byte gSharedMem + 0x18010
_0809F584:
	ldr r0, _0809F594 @ =gSharedMem + 0x18010
	bl sub_80A1DE8
	ldr r1, _0809F598 @ =gMain
	ldr r0, _0809F59C @ =0x0000043c
	adds r1, r0
	b _0809F5B8
	.align 2, 0
_0809F594: .4byte gSharedMem + 0x18010
_0809F598: .4byte gMain
_0809F59C: .4byte 0x0000043c
_0809F5A0:
	bl sub_809F5F8
	lsls r0, 24
	cmp r0, 0
	beq _0809F5EA
	ldr r0, _0809F5C0 @ =gSharedMem + 0x18000
	adds r0, 0x74
	movs r1, 0
	strb r1, [r0]
_0809F5B2:
	ldr r1, _0809F5C4 @ =gMain
	ldr r2, _0809F5C8 @ =0x0000043c
	adds r1, r2
_0809F5B8:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0809F5EA
	.align 2, 0
_0809F5C0: .4byte gSharedMem + 0x18000
_0809F5C4: .4byte gMain
_0809F5C8: .4byte 0x0000043c
_0809F5CC:
	bl sub_8055870
	cmp r0, 0x1
	beq _0809F5EA
	movs r0, 0
	strb r0, [r5]
	ldr r0, _0809F5F0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0809F5F4 @ =gSharedMem + 0x18000
	adds r0, 0x84
	ldr r0, [r0]
	str r0, [r1]
_0809F5EA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809F5F0: .4byte gTasks
_0809F5F4: .4byte gSharedMem + 0x18000
	thumb_func_end sub_809F43C

	thumb_func_start sub_809F5F8
sub_809F5F8: @ 809F5F8
	push {r4,lr}
	ldr r2, _0809F61C @ =gSharedMem + 0x18000
	adds r4, r2, 0
	adds r4, 0x74
	ldrb r0, [r4]
	cmp r0, 0
	beq _0809F624
	ldr r0, _0809F620 @ =gUnknown_083C1588
	ldrb r1, [r2, 0xB]
	lsls r1, 2
	adds r1, r0
	adds r0, r2, 0
	adds r0, 0x10
	ldr r1, [r1]
	bl _call_via_r1
	movs r0, 0x1
	b _0809F634
	.align 2, 0
_0809F61C: .4byte gSharedMem + 0x18000
_0809F620: .4byte gUnknown_083C1588
_0809F624:
	adds r0, r2, 0
	adds r0, 0x10
	bl sub_809FAC8
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r0, 0
_0809F634:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_809F5F8

	thumb_func_start sub_809F63C
sub_809F63C: @ 809F63C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_809FE80
	adds r0, r4, 0
	bl sub_809FC34
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_809F63C

	thumb_func_start sub_809F650
sub_809F650: @ 809F650
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80A00A4
	adds r0, r4, 0
	bl sub_809FF64
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_809F650

	thumb_func_start sub_809F664
sub_809F664: @ 809F664
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80A0390
	adds r0, r4, 0
	bl sub_80A015C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_809F664

	thumb_func_start sub_809F678
sub_809F678: @ 809F678
	push {lr}
	adds r3, r0, 0
	ldr r1, _0809F698 @ =gSharedMem + 0x18000
	ldrb r0, [r1, 0xE]
	cmp r0, 0
	bne _0809F69C
	ldr r2, [r1]
	ldrb r1, [r1, 0x9]
	movs r0, 0x64
	muls r1, r0
	adds r1, r2
	adds r0, r3, 0
	movs r2, 0x64
	bl memcpy
	b _0809F6AE
	.align 2, 0
_0809F698: .4byte gSharedMem + 0x18000
_0809F69C:
	ldr r0, [r1]
	ldrb r2, [r1, 0x9]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	adds r0, r1
	adds r1, r3, 0
	bl sub_803B4B4
_0809F6AE:
	pop {r0}
	bx r0
	thumb_func_end sub_809F678

	.align 2, 0 @ Don't pad with nop.
