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
	bl sub_80A0EA4
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
	bl sub_80A0EE8
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
	bl sub_80A0DD0
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
	bl sub_809F760
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
	bl sub_809F760
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
	bl sub_80A0DD0
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
	bl sub_80A0DD0
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
	bl sub_80A0EE8
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
	bl sub_80A0EE8
	bl sub_80A0DD0
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
	bl sub_80A0EE8
	bl sub_80A0DD0
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
	bl sub_80A0EA4
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

	thumb_func_start sub_809F6B4
sub_809F6B4: @ 809F6B4
	push {r4-r7,lr}
	sub sp, 0xC
	adds r4, r0, 0
	adds r7, r1, 0
	ldrb r0, [r7]
	cmp r0, 0
	beq _0809F6D2
	cmp r0, 0x1
	beq _0809F718
	adds r0, r4, 0
	bl sub_80A1808
	lsls r0, 24
	lsrs r0, 24
	b _0809F756
_0809F6D2:
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	lsls r0, r5, 3
	ldr r1, _0809F70C @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _0809F710 @ =gMonFrontPicCoords
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _0809F714 @ =gUnknown_081FAF4C
	ldr r4, [r4, 0x4]
	str r4, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	bl HandleLoadSpecialPokePic
	b _0809F74E
	.align 2, 0
_0809F70C: .4byte gMonFrontPicTable
_0809F710: .4byte gMonFrontPicCoords
_0809F714: .4byte gUnknown_081FAF4C
_0809F718:
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	adds r1, r0, 0
	adds r0, r5, 0
	adds r2, r6, 0
	bl GetMonSpritePalStructFromOtIdPersonality
	adds r4, r0, 0
	bl LoadCompressedObjectPalette
	ldrh r0, [r4, 0x4]
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
_0809F74E:
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	movs r0, 0xFF
_0809F756:
	add sp, 0xC
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_809F6B4

	thumb_func_start sub_809F760
sub_809F760: @ 809F760
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x1
	beq _0809F780
	cmp r1, 0x1
	bgt _0809F776
	cmp r1, 0
	beq _0809F77C
	b _0809F788
_0809F776:
	cmp r2, 0x2
	beq _0809F784
	b _0809F788
_0809F77C:
	movs r1, 0xD
	b _0809F78A
_0809F780:
	movs r1, 0xE
	b _0809F78A
_0809F784:
	movs r1, 0xF
	b _0809F78A
_0809F788:
	movs r1, 0x10
_0809F78A:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_809F760

	thumb_func_start sub_809F798
sub_809F798: @ 809F798
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x1
	beq _0809F7B8
	cmp r1, 0x1
	bgt _0809F7AE
	cmp r1, 0
	beq _0809F7B4
	b _0809F7C0
_0809F7AE:
	cmp r2, 0x2
	beq _0809F7BC
	b _0809F7C0
_0809F7B4:
	movs r1, 0x11
	b _0809F7C2
_0809F7B8:
	movs r1, 0x12
	b _0809F7C2
_0809F7BC:
	movs r1, 0x13
	b _0809F7C2
_0809F7C0:
	movs r1, 0x14
_0809F7C2:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_809F798

	thumb_func_start sub_809F7D0
sub_809F7D0: @ 809F7D0
	push {r4,lr}
	sub sp, 0x64
	mov r0, sp
	bl sub_809F678
	ldr r4, _0809F804 @ =gSharedMem + 0x18000
	adds r0, r4, 0
	adds r0, 0x79
	ldrb r1, [r0]
	mov r0, sp
	bl sub_809F760
	lsls r0, 16
	lsrs r0, 16
	bl IsHMMove
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809F808
	ldrb r0, [r4, 0x8]
	cmp r0, 0x3
	beq _0809F808
	movs r0, 0
	b _0809F80A
	.align 2, 0
_0809F804: .4byte gSharedMem + 0x18000
_0809F808:
	movs r0, 0x1
_0809F80A:
	add sp, 0x64
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_809F7D0

	thumb_func_start sub_809F814
sub_809F814: @ 809F814
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r0, _0809F83C @ =gTasks + 0x8
	mov r8, r0
	adds r4, r6, r0
	ldrh r1, [r4, 0x1C]
	movs r2, 0x1C
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	bgt _0809F840
	adds r0, r1, 0x1
	strh r0, [r4, 0x1C]
	b _0809F9C0
	.align 2, 0
_0809F83C: .4byte gTasks + 0x8
_0809F840:
	ldr r7, _0809F874 @ =gMain
	ldrh r1, [r7, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0809F880
	mov r0, r8
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0809F878 @ =sub_809E260
	str r1, [r0]
	movs r0, 0x4
	strh r0, [r4]
	movs r0, 0x1
	strh r0, [r4, 0x1A]
	ldr r2, _0809F87C @ =gSharedMem + 0x18000
	ldrh r0, [r4, 0x1E]
	adds r2, 0x79
	strb r0, [r2]
	movs r1, 0x1
	negs r1, r1
	adds r0, r5, 0
	bl sub_809E8F0
	b _0809F9C0
	.align 2, 0
_0809F874: .4byte gMain
_0809F878: .4byte sub_809E260
_0809F87C: .4byte gSharedMem + 0x18000
_0809F880:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0809F8B4
	mov r0, r8
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0809F8AC @ =sub_809E260
	str r1, [r0]
	movs r0, 0x4
	strh r0, [r4]
	movs r0, 0x1
	strh r0, [r4, 0x1A]
	ldr r2, _0809F8B0 @ =gSharedMem + 0x18000
	ldrh r0, [r4, 0x1E]
	adds r2, 0x79
	strb r0, [r2]
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_809E8F0
	b _0809F9C0
	.align 2, 0
_0809F8AC: .4byte sub_809E260
_0809F8B0: .4byte gSharedMem + 0x18000
_0809F8B4:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0809F8C8
	bl sub_80F9284
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0809F918
_0809F8C8:
	ldr r1, _0809F90C @ =gSharedMem + 0x18000
	ldrb r0, [r1, 0xB]
	cmp r0, 0x2
	beq _0809F9C0
	cmp r0, 0x3
	bne _0809F8F4
	adds r0, r1, 0
	adds r0, 0x79
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _0809F8E8
	adds r0, r1, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0
	beq _0809F8F4
_0809F8E8:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x9
	movs r3, 0x12
	bl MenuZeroFillWindowRect
_0809F8F4:
	ldr r1, _0809F910 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809F914 @ =sub_809E260
	str r1, [r0]
	movs r1, 0x1
	negs r1, r1
	adds r0, r5, 0
	b _0809F972
	.align 2, 0
_0809F90C: .4byte gSharedMem + 0x18000
_0809F910: .4byte gTasks
_0809F914: .4byte sub_809E260
_0809F918:
	ldrh r1, [r7, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0809F92E
	bl sub_80F9284
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0809F994
_0809F92E:
	ldr r1, _0809F988 @ =gSharedMem + 0x18000
	adds r2, r1, 0
	adds r2, 0x76
	ldrb r0, [r1, 0xB]
	ldrb r2, [r2]
	cmp r0, r2
	beq _0809F9C0
	cmp r0, 0x2
	bne _0809F960
	adds r0, r1, 0
	adds r0, 0x79
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _0809F954
	adds r0, r1, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0
	beq _0809F960
_0809F954:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x9
	movs r3, 0x12
	bl MenuZeroFillWindowRect
_0809F960:
	ldr r1, _0809F98C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0809F990 @ =sub_809E260
	str r1, [r0]
	adds r0, r5, 0
	movs r1, 0x1
_0809F972:
	bl SummaryScreenHandleLeftRightInput
	ldrb r1, [r4, 0x1E]
	movs r0, 0x1
	bl sub_80A1488
	ldrb r1, [r4, 0x1E]
	movs r0, 0x1
	bl sub_80A1654
	b _0809F9C0
	.align 2, 0
_0809F988: .4byte gSharedMem + 0x18000
_0809F98C: .4byte gTasks
_0809F990: .4byte sub_809E260
_0809F994:
	ldrh r1, [r7, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0809F9A6
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0809F9C0
_0809F9A6:
	ldrb r1, [r4, 0x1E]
	movs r0, 0x2
	bl sub_80A1488
	ldrb r1, [r4, 0x1E]
	movs r0, 0x2
	bl sub_80A1654
	mov r0, r8
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0809F9CC @ =sub_809E260
	str r1, [r0]
_0809F9C0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809F9CC: .4byte sub_809E260
	thumb_func_end sub_809F814

	thumb_func_start sub_809F9D0
sub_809F9D0: @ 809F9D0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r6, _0809FA24 @ =gTasks + 0x8
	adds r2, r4, r6
	movs r0, 0
	strh r0, [r2, 0x1C]
	strh r1, [r2, 0x1E]
	movs r5, 0x2
	negs r5, r5
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_80A1488
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_80A1654
	movs r0, 0xB
	movs r1, 0xF
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	ldr r0, _0809FA28 @ =gOtherText_CantForgetHMs
	movs r1, 0xB
	movs r2, 0xF
	bl MenuPrint
	subs r6, 0x8
	adds r4, r6
	ldr r0, _0809FA2C @ =sub_809F814
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FA24: .4byte gTasks + 0x8
_0809FA28: .4byte gOtherText_CantForgetHMs
_0809FA2C: .4byte sub_809F814
	thumb_func_end sub_809F9D0

	thumb_func_start sub_809FA30
sub_809FA30: @ 809FA30
	ldr r0, _0809FA38 @ =gSharedMem + 0x18000
	adds r0, 0x7A
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0809FA38: .4byte gSharedMem + 0x18000
	thumb_func_end sub_809FA30

	thumb_func_start GetStringCenterAlignXOffsetWithLetterSpacing
GetStringCenterAlignXOffsetWithLetterSpacing: @ 809FA3C
	push {r4,lr}
	lsls r0, 24
	lsls r1, 24
	lsls r2, 24
	lsls r3, 24
	lsrs r2, 23
	lsrs r3, 18
	ldr r4, _0809FA70 @ =0x0600f000
	adds r3, r4
	adds r2, r3
	lsrs r1, 12
	lsrs r0, 23
	movs r4, 0x80
	lsls r4, 2
	adds r3, r4, 0
	adds r0, r3
	adds r1, r0
	adds r0, r1, 0
	adds r0, 0x80
	strh r0, [r2]
	adds r2, 0x40
	adds r1, 0x81
	strh r1, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FA70: .4byte 0x0600f000
	thumb_func_end GetStringCenterAlignXOffsetWithLetterSpacing

	thumb_func_start GetStringCenterAlignXOffset
GetStringCenterAlignXOffset: @ 809FA74
	push {r4,lr}
	adds r4, r1, 0
	adds r3, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0xF
	adds r2, r4, 0
	bl GetStringCenterAlignXOffsetWithLetterSpacing
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetStringCenterAlignXOffset

	thumb_func_start sub_809FA94
sub_809FA94: @ 809FA94
	push {lr}
	bl IsShiny
	lsls r0, 24
	cmp r0, 0
	beq _0809FAB4
	ldr r0, _0809FAB0 @ =gUnknown_083C157E
	movs r1, 0x4
	movs r2, 0x2
	bl LoadPalette
	movs r0, 0x1
	b _0809FAC0
	.align 2, 0
_0809FAB0: .4byte gUnknown_083C157E
_0809FAB4:
	ldr r0, _0809FAC4 @ =gUnknown_083C157C
	movs r1, 0x4
	movs r2, 0x2
	bl LoadPalette
	movs r0, 0
_0809FAC0:
	pop {r1}
	bx r1
	.align 2, 0
_0809FAC4: .4byte gUnknown_083C157C
	thumb_func_end sub_809FA94

	thumb_func_start sub_809FAC8
sub_809FAC8: @ 809FAC8
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _0809FB28
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x4
	movs r3, 0x3
	bl MenuZeroFillWindowRect
	movs r0, 0x3
	movs r1, 0x10
	movs r2, 0x9
	movs r3, 0x11
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xC
	movs r2, 0xB
	movs r3, 0xF
	bl MenuZeroFillWindowRect
	ldr r4, _0809FB20 @ =gStringVar1
	adds r0, r5, 0
	adds r1, r4, 0
	bl GetMonNickname
	adds r0, r4, 0
	movs r1, 0xD
	movs r2, 0x3
	movs r3, 0x10
	bl sub_80A1FF8
	ldr r0, _0809FB24 @ =gUnknown_083C157C
	movs r1, 0x4
	movs r2, 0x2
	bl LoadPalette
	b _0809FBD6
	.align 2, 0
_0809FB20: .4byte gStringVar1
_0809FB24: .4byte gUnknown_083C157C
_0809FB28:
	adds r0, r5, 0
	bl sub_809FA94
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl SpeciesToPokedexNum
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _0809FB6C @ =0x0000ffff
	cmp r4, r0
	beq _0809FB96
	cmp r6, 0
	bne _0809FB70
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x2
	bl GetStringCenterAlignXOffset
	movs r0, 0x11
	str r0, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r1, 0xD
	b _0809FB8C
	.align 2, 0
_0809FB6C: .4byte 0x0000ffff
_0809FB70:
	movs r0, 0x2
	movs r1, 0x8
	movs r2, 0x1
	movs r3, 0x2
	bl GetStringCenterAlignXOffsetWithLetterSpacing
	movs r0, 0x11
	str r0, [sp]
	movs r0, 0x10
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r1, 0x8
_0809FB8C:
	movs r2, 0x3
	movs r3, 0x2
	bl sub_80A1F98
	b _0809FBA2
_0809FB96:
	movs r0, 0x1
	movs r1, 0x2
	movs r2, 0x4
	movs r3, 0x3
	bl MenuZeroFillWindowRect
_0809FBA2:
	ldr r1, _0809FBE0 @ =gStringVar1
	adds r0, r1, 0
	movs r1, 0xD
	bl sub_80A1E58
	adds r1, r0, 0
	adds r0, r5, 0
	bl GetMonNickname
	adds r1, r0, 0
	movs r0, 0xFC
	strb r0, [r1]
	movs r0, 0x13
	strb r0, [r1, 0x1]
	movs r0, 0x3C
	strb r0, [r1, 0x2]
	movs r0, 0xFF
	strb r0, [r1, 0x3]
	ldr r0, _0809FBE0 @ =gStringVar1
	movs r1, 0x1
	movs r2, 0xC
	bl MenuPrint
	adds r0, r5, 0
	bl sub_80A0958
_0809FBD6:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FBE0: .4byte gStringVar1
	thumb_func_end sub_809FAC8

	thumb_func_start sub_809FBE4
sub_809FBE4: @ 809FBE4
	push {r4,lr}
	movs r4, 0
_0809FBE8:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80A1918
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1B
	bls _0809FBE8
	movs r0, 0xB
	movs r1, 0x4
	movs r2, 0x1D
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_809FBE4

	thumb_func_start sub_809FC0C
sub_809FC0C: @ 809FC0C
	push {lr}
	ldr r0, _0809FC30 @ =gOtherText_Type2
	movs r1, 0xB
	movs r2, 0x6
	bl MenuPrint
	movs r0, 0
	movs r1, 0x16
	movs r2, 0x4
	bl GetStringCenterAlignXOffset
	movs r0, 0x2
	movs r1, 0x17
	movs r2, 0x4
	bl GetStringCenterAlignXOffset
	pop {r0}
	bx r0
	.align 2, 0
_0809FC30: .4byte gOtherText_Type2
	thumb_func_end sub_809FC0C

	thumb_func_start sub_809FC34
sub_809FC34: @ 809FC34
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	movs r4, 0
_0809FC3C:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80A1918
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _0809FC3C
	movs r0, 0xB
	movs r1, 0x9
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r6, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _0809FD1C
	ldr r5, _0809FCD0 @ =gStringVar1
	adds r0, r5, 0
	movs r1, 0xD
	bl sub_80A1E58
	adds r5, r0, 0
	ldr r1, _0809FCD4 @ =gOtherText_OriginalTrainer
	bl StringCopy
	adds r5, r0, 0
	ldr r4, _0809FCD8 @ =gOtherText_FiveQuestionsAndSlash
	adds r1, r4, 0
	bl StringCopy
	adds r5, r0, 0
	movs r0, 0xFC
	strb r0, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	movs r0, 0x4E
	strb r0, [r5, 0x2]
	movs r0, 0xFF
	strb r0, [r5, 0x3]
	ldr r0, _0809FCD0 @ =gStringVar1
	movs r1, 0xB
	movs r2, 0x4
	bl MenuPrint
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0xD
	movs r2, 0xC1
	movs r3, 0x20
	bl sub_80A1EF8
	movs r0, 0x9
	movs r1, 0x78
	movs r2, 0x30
	movs r3, 0
	bl sub_80A198C
	adds r0, r6, 0
	movs r1, 0x20
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, 0x5
	bhi _0809FCE0
	ldr r0, _0809FCDC @ =gOtherText_EggAbout
	b _0809FCF2
	.align 2, 0
_0809FCD0: .4byte gStringVar1
_0809FCD4: .4byte gOtherText_OriginalTrainer
_0809FCD8: .4byte gOtherText_FiveQuestionsAndSlash
_0809FCDC: .4byte gOtherText_EggAbout
_0809FCE0:
	cmp r0, 0xA
	bhi _0809FCEC
	ldr r0, _0809FCE8 @ =gOtherText_EggSoon
	b _0809FCF2
	.align 2, 0
_0809FCE8: .4byte gOtherText_EggSoon
_0809FCEC:
	cmp r1, 0x28
	bhi _0809FD00
	ldr r0, _0809FCFC @ =gOtherText_EggSomeTime
_0809FCF2:
	movs r1, 0xB
	movs r2, 0x9
	bl MenuPrint
	b _0809FD0A
	.align 2, 0
_0809FCFC: .4byte gOtherText_EggSomeTime
_0809FD00:
	ldr r0, _0809FD18 @ =gOtherText_EggLongTime
	movs r1, 0xB
	movs r2, 0x9
	bl MenuPrint
_0809FD0A:
	adds r0, r6, 0
	movs r1, 0xB
	movs r2, 0xE
	bl PokemonSummaryScreen_PrintEggTrainerMemo
	b _0809FE4C
	.align 2, 0
_0809FD18: .4byte gOtherText_EggLongTime
_0809FD1C:
	ldr r4, _0809FD64 @ =gStringVar2
	adds r0, r6, 0
	movs r1, 0x7
	adds r2, r4, 0
	bl GetMonData
	adds r0, r6, 0
	movs r1, 0x3
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl ConvertInternationalString
	ldr r5, _0809FD68 @ =gStringVar1
	adds r0, r5, 0
	movs r1, 0xD
	bl sub_80A1E58
	adds r5, r0, 0
	ldr r1, _0809FD6C @ =gOtherText_OriginalTrainer
	bl StringCopy
	adds r5, r0, 0
	adds r0, r6, 0
	movs r1, 0x31
	bl GetMonData
	cmp r0, 0
	bne _0809FD70
	adds r0, r5, 0
	movs r1, 0x9
	b _0809FD74
	.align 2, 0
_0809FD64: .4byte gStringVar2
_0809FD68: .4byte gStringVar1
_0809FD6C: .4byte gOtherText_OriginalTrainer
_0809FD70:
	adds r0, r5, 0
	movs r1, 0xA
_0809FD74:
	bl sub_80A1E58
	adds r5, r0, 0
	ldr r1, _0809FE54 @ =gStringVar2
	adds r0, r5, 0
	bl StringCopy
	adds r5, r0, 0
	movs r0, 0xFC
	strb r0, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	movs r0, 0x4E
	strb r0, [r5, 0x2]
	movs r0, 0xFF
	strb r0, [r5, 0x3]
	ldr r0, _0809FE58 @ =gStringVar1
	movs r1, 0xB
	movs r2, 0x4
	bl MenuPrint
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonData
	ldr r1, _0809FE5C @ =0x0000ffff
	ands r1, r0
	movs r0, 0xC1
	str r0, [sp]
	movs r0, 0x20
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	adds r0, r1, 0
	movs r1, 0xD
	movs r2, 0x5
	movs r3, 0x2
	bl sub_80A1F98
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _0809FE60 @ =gBaseStats
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r5, r1, r2
	ldrb r4, [r5, 0x6]
	adds r0, r4, 0
	movs r1, 0x78
	movs r2, 0x30
	movs r3, 0
	bl sub_80A198C
	ldrb r0, [r5, 0x7]
	cmp r4, r0
	beq _0809FDF8
	ldrb r0, [r5, 0x7]
	movs r1, 0xA0
	movs r2, 0x30
	movs r3, 0x1
	bl sub_80A198C
_0809FDF8:
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	movs r1, 0x2E
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetAbilityBySpecies
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0xD
	muls r0, r4
	ldr r1, _0809FE64 @ =gAbilityNames
	adds r0, r1
	movs r1, 0xD
	movs r2, 0xB
	movs r3, 0x9
	bl sub_80A1FF8
	ldr r0, _0809FE68 @ =gAbilityDescriptions
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	movs r1, 0xB
	movs r2, 0xB
	bl MenuPrint
	adds r0, r6, 0
	movs r1, 0xB
	movs r2, 0xE
	bl PokemonSummaryScreen_PrintTrainerMemo
_0809FE4C:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FE54: .4byte gStringVar2
_0809FE58: .4byte gStringVar1
_0809FE5C: .4byte 0x0000ffff
_0809FE60: .4byte gBaseStats
_0809FE64: .4byte gAbilityNames
_0809FE68: .4byte gAbilityDescriptions
	thumb_func_end sub_809FC34

	thumb_func_start sub_809FE6C
sub_809FE6C: @ 809FE6C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_809FC0C
	adds r0, r4, 0
	bl sub_809FC34
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_809FE6C

	thumb_func_start sub_809FE80
sub_809FE80: @ 809FE80
	push {lr}
	movs r0, 0xE
	movs r1, 0x4
	movs r2, 0x12
	movs r3, 0x5
	bl MenuZeroFillWindowRect
	movs r0, 0x19
	movs r1, 0x4
	movs r2, 0x1E
	movs r3, 0x5
	bl MenuZeroFillWindowRect
	movs r0, 0xB
	movs r1, 0x9
	movs r2, 0x1C
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	movs r0, 0xB
	movs r1, 0xE
	movs r2, 0x1C
	movs r3, 0x11
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_809FE80

	thumb_func_start sub_809FEB8
sub_809FEB8: @ 809FEB8
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0809FF40 @ =gOtherText_ExpPoints
	movs r1, 0xD
	movs r2, 0xB
	movs r3, 0xE
	bl sub_80A1FF8
	ldr r0, _0809FF44 @ =gOtherText_NextLv
	movs r1, 0xD
	movs r2, 0xB
	movs r3, 0x10
	bl sub_80A1FF8
	ldr r0, _0809FF48 @ =gOtherText_Terminator18
	movs r1, 0x15
	movs r2, 0x10
	bl MenuPrint
	ldr r0, _0809FF4C @ =gOtherText_HP
	movs r4, 0x2A
	str r4, [sp]
	movs r1, 0xD
	movs r2, 0xB
	movs r3, 0x7
	bl sub_80A1F48
	ldr r0, _0809FF50 @ =gOtherText_Attack
	str r4, [sp]
	movs r1, 0xD
	movs r2, 0xB
	movs r3, 0x9
	bl sub_80A1F48
	ldr r0, _0809FF54 @ =gOtherText_Defense
	str r4, [sp]
	movs r1, 0xD
	movs r2, 0xB
	movs r3, 0xB
	bl sub_80A1F48
	ldr r0, _0809FF58 @ =gOtherText_SpAtk
	movs r4, 0x24
	str r4, [sp]
	movs r1, 0xD
	movs r2, 0x16
	movs r3, 0x7
	bl sub_80A1F48
	ldr r0, _0809FF5C @ =gOtherText_SpDef
	str r4, [sp]
	movs r1, 0xD
	movs r2, 0x16
	movs r3, 0x9
	bl sub_80A1F48
	ldr r0, _0809FF60 @ =gOtherText_Speed
	str r4, [sp]
	movs r1, 0xD
	movs r2, 0x16
	movs r3, 0xB
	bl sub_80A1F48
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FF40: .4byte gOtherText_ExpPoints
_0809FF44: .4byte gOtherText_NextLv
_0809FF48: .4byte gOtherText_Terminator18
_0809FF4C: .4byte gOtherText_HP
_0809FF50: .4byte gOtherText_Attack
_0809FF54: .4byte gOtherText_Defense
_0809FF58: .4byte gOtherText_SpAtk
_0809FF5C: .4byte gOtherText_SpDef
_0809FF60: .4byte gOtherText_Speed
	thumb_func_end sub_809FEB8

	thumb_func_start sub_809FF64
sub_809FF64: @ 809FF64
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r4, 0
_0809FF6A:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80A1918
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _0809FF6A
	adds r0, r5, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xB
	movs r2, 0x4
	bl sub_80A0BF4
	adds r0, r5, 0
	bl sub_80A0B88
	ldr r4, _080A008C @ =gStringVar1
	adds r0, r5, 0
	movs r1, 0x19
	bl GetMonData
	adds r1, r0, 0
	adds r0, r4, 0
	bl ConvertIntToDecimalString
	adds r0, r4, 0
	movs r1, 0x1D
	movs r2, 0xE
	bl MenuPrint_RightAligned
	adds r0, r5, 0
	movs r1, 0x17
	movs r2, 0x10
	bl sub_80A0C80
	adds r0, r5, 0
	movs r1, 0x3B
	bl GetMonData
	adds r1, r0, 0
	adds r0, r4, 0
	bl ConvertIntToDecimalString
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0x9
	movs r3, 0x32
	bl sub_8072BD8
	adds r0, r5, 0
	movs r1, 0x3C
	bl GetMonData
	adds r1, r0, 0
	adds r0, r4, 0
	bl ConvertIntToDecimalString
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0xB
	movs r3, 0x32
	bl sub_8072BD8
	adds r0, r5, 0
	movs r1, 0x3E
	bl GetMonData
	adds r1, r0, 0
	adds r0, r4, 0
	bl ConvertIntToDecimalString
	adds r0, r4, 0
	movs r1, 0x1B
	movs r2, 0x7
	movs r3, 0x12
	bl sub_8072BD8
	adds r0, r5, 0
	movs r1, 0x3F
	bl GetMonData
	adds r1, r0, 0
	adds r0, r4, 0
	bl ConvertIntToDecimalString
	adds r0, r4, 0
	movs r1, 0x1B
	movs r2, 0x9
	movs r3, 0x12
	bl sub_8072BD8
	adds r0, r5, 0
	movs r1, 0x3D
	bl GetMonData
	adds r1, r0, 0
	adds r0, r4, 0
	bl ConvertIntToDecimalString
	adds r0, r4, 0
	movs r1, 0x1B
	movs r2, 0xB
	movs r3, 0x12
	bl sub_8072BD8
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x18
	movs r3, 0x1
	bl sub_8072C14
	adds r4, r0, 0
	movs r0, 0xBA
	strb r0, [r4]
	adds r4, 0x1
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x30
	movs r3, 0x1
	bl sub_8072C14
	ldr r0, _080A008C @ =gStringVar1
	movs r1, 0x7E
	movs r2, 0x38
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A008C: .4byte gStringVar1
	thumb_func_end sub_809FF64

	thumb_func_start sub_80A0090
sub_80A0090: @ 80A0090
	push {r4,lr}
	adds r4, r0, 0
	bl sub_809FEB8
	adds r0, r4, 0
	bl sub_809FF64
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A0090

	thumb_func_start sub_80A00A4
sub_80A00A4: @ 80A00A4
	push {lr}
	movs r0, 0xB
	movs r1, 0x4
	movs r2, 0x13
	movs r3, 0x5
	bl MenuZeroFillWindowRect
	movs r0, 0x10
	movs r1, 0x7
	movs r2, 0x15
	movs r3, 0x8
	bl MenuZeroFillWindowRect
	movs r0, 0x11
	movs r1, 0x9
	movs r2, 0x15
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	movs r0, 0x1B
	movs r1, 0x7
	movs r2, 0x1D
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	movs r0, 0x16
	movs r1, 0xE
	movs r2, 0x1C
	movs r3, 0xF
	bl MenuZeroFillWindowRect
	movs r0, 0x17
	movs r1, 0x10
	movs r2, 0x1C
	movs r3, 0x11
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_80A00A4

	thumb_func_start sub_80A00F4
sub_80A00F4: @ 80A00F4
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r2, _080A012C @ =gSharedMem + 0x18000
	adds r0, r2, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0
	bne _080A010A
	cmp r1, 0x4
	beq _080A0150
_080A010A:
	ldrb r0, [r2, 0xB]
	cmp r0, 0x2
	bne _080A0138
	ldr r0, _080A0130 @ =gOtherText_Power2
	movs r1, 0xD
	movs r2, 0x1
	movs r3, 0xF
	bl sub_80A1FF8
	ldr r0, _080A0134 @ =gOtherText_Accuracy2
	movs r1, 0xD
	movs r2, 0x1
	movs r3, 0x11
	bl sub_80A1FF8
	b _080A0150
	.align 2, 0
_080A012C: .4byte gSharedMem + 0x18000
_080A0130: .4byte gOtherText_Power2
_080A0134: .4byte gOtherText_Accuracy2
_080A0138:
	ldr r0, _080A0154 @ =gOtherText_Appeal2
	movs r1, 0xD
	movs r2, 0x1
	movs r3, 0xF
	bl sub_80A1FF8
	ldr r0, _080A0158 @ =gOtherText_Jam2
	movs r1, 0xD
	movs r2, 0x1
	movs r3, 0x11
	bl sub_80A1FF8
_080A0150:
	pop {r0}
	bx r0
	.align 2, 0
_080A0154: .4byte gOtherText_Appeal2
_080A0158: .4byte gOtherText_Jam2
	thumb_func_end sub_80A00F4

	thumb_func_start sub_80A015C
sub_80A015C: @ 80A015C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r8, r0
	movs r7, 0
_080A0168:
	mov r0, r8
	adds r1, r7, 0
	bl sub_809F760
	lsls r0, 16
	lsrs r6, r0, 16
	mov r0, r8
	adds r1, r7, 0
	bl sub_809F798
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	cmp r6, 0
	bne _080A01B8
	adds r0, r7, 0
	movs r1, 0x1
	bl sub_80A1918
	lsls r4, r7, 25
	movs r0, 0x80
	lsls r0, 19
	adds r4, r0
	lsrs r4, 24
	ldr r0, _080A01B0 @ =gOtherText_OneDash
	movs r1, 0xD
	movs r2, 0xF
	adds r3, r4, 0
	bl sub_80A1FF8
	ldr r0, _080A01B4 @ =gOtherText_TwoDashes
	movs r1, 0x1A
	adds r2, r4, 0
	bl MenuPrint
	b _080A0276
	.align 2, 0
_080A01B0: .4byte gOtherText_OneDash
_080A01B4: .4byte gOtherText_TwoDashes
_080A01B8:
	ldr r0, _080A01E0 @ =gSharedMem + 0x18000
	ldrb r0, [r0, 0xB]
	cmp r0, 0x2
	bne _080A01E8
	ldr r1, _080A01E4 @ =gBattleMoves
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x2]
	lsls r4, r7, 1
	adds r2, r4, 0x4
	lsls r2, 27
	lsrs r2, 24
	movs r1, 0x57
	adds r3, r7, 0
	bl sub_80A198C
	b _080A020C
	.align 2, 0
_080A01E0: .4byte gSharedMem + 0x18000
_080A01E4: .4byte gBattleMoves
_080A01E8:
	ldr r1, _080A0290 @ =gContestMoves
	lsls r0, r6, 3
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	lsrs r0, 5
	movs r1, 0x90
	lsls r1, 21
	adds r0, r1
	lsrs r0, 24
	lsls r4, r7, 1
	adds r2, r4, 0x4
	lsls r2, 27
	lsrs r2, 24
	movs r1, 0x57
	adds r3, r7, 0
	bl sub_80A198C
_080A020C:
	movs r0, 0xD
	muls r0, r6
	ldr r1, _080A0294 @ =gMoveNames
	adds r0, r1
	adds r5, r4, 0x4
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0xD
	movs r2, 0xF
	adds r3, r5, 0
	bl sub_80A1FF8
	movs r0, 0x1
	movs r1, 0x18
	adds r2, r5, 0
	bl GetStringCenterAlignXOffset
	mov r0, r8
	movs r1, 0x15
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	adds r2, r7, 0
	bl CalculatePPWithBonus
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080A0298 @ =gStringVar1
	adds r0, r1, 0
	mov r1, r9
	movs r2, 0xE
	movs r3, 0x1
	bl sub_8072C14
	adds r1, r0, 0
	movs r0, 0xBA
	strb r0, [r1]
	adds r1, 0x1
	adds r0, r1, 0
	adds r1, r4, 0
	movs r2, 0x20
	movs r3, 0x1
	bl sub_8072C14
	ldr r0, _080A0298 @ =gStringVar1
	movs r1, 0x19
	adds r2, r5, 0
	bl MenuPrint
_080A0276:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bhi _080A0282
	b _080A0168
_080A0282:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0290: .4byte gContestMoves
_080A0294: .4byte gMoveNames
_080A0298: .4byte gStringVar1
	thumb_func_end sub_80A015C

	thumb_func_start sub_80A029C
sub_80A029C: @ 80A029C
	push {r4,r5,lr}
	ldr r1, _080A02B8 @ =gSharedMem + 0x18000
	adds r4, r1, 0
	adds r4, 0x7C
	ldrh r0, [r4]
	cmp r0, 0
	bne _080A02C0
	ldr r0, _080A02BC @ =gOtherText_CancelNoTerminator
	movs r1, 0xD
	movs r2, 0xF
	movs r3, 0xC
	bl sub_80A1FF8
	b _080A037E
	.align 2, 0
_080A02B8: .4byte gSharedMem + 0x18000
_080A02BC: .4byte gOtherText_CancelNoTerminator
_080A02C0:
	ldrh r5, [r4]
	ldrb r0, [r1, 0xB]
	cmp r0, 0x2
	bne _080A02E4
	ldr r1, _080A02E0 @ =gBattleMoves
	lsls r4, r5, 1
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x2]
	movs r1, 0x57
	movs r2, 0x60
	movs r3, 0x4
	bl sub_80A198C
	b _080A0304
	.align 2, 0
_080A02E0: .4byte gBattleMoves
_080A02E4:
	ldr r1, _080A0320 @ =gContestMoves
	lsls r0, r5, 3
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	lsrs r0, 5
	movs r1, 0x90
	lsls r1, 21
	adds r0, r1
	lsrs r0, 24
	movs r1, 0x57
	movs r2, 0x60
	movs r3, 0x4
	bl sub_80A198C
	lsls r4, r5, 1
_080A0304:
	ldr r0, _080A0324 @ =gSharedMem + 0x18000
	ldrb r0, [r0, 0xB]
	cmp r0, 0x2
	bne _080A032C
	movs r0, 0xD
	muls r0, r5
	ldr r1, _080A0328 @ =gMoveNames
	adds r0, r1
	movs r1, 0xA
	movs r2, 0xF
	movs r3, 0xC
	bl sub_80A1FF8
	b _080A033E
	.align 2, 0
_080A0320: .4byte gContestMoves
_080A0324: .4byte gSharedMem + 0x18000
_080A0328: .4byte gMoveNames
_080A032C:
	movs r0, 0xD
	muls r0, r5
	ldr r1, _080A0384 @ =gMoveNames
	adds r0, r1
	movs r1, 0x9
	movs r2, 0xF
	movs r3, 0xC
	bl sub_80A1FF8
_080A033E:
	movs r0, 0x1
	movs r1, 0x18
	movs r2, 0xC
	bl GetStringCenterAlignXOffset
	ldr r2, _080A0388 @ =gStringVar1
	ldr r1, _080A038C @ =gBattleMoves
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x4]
	adds r0, r2, 0
	adds r1, r4, 0
	movs r2, 0xE
	movs r3, 0x1
	bl sub_8072C14
	adds r2, r0, 0
	movs r0, 0xBA
	strb r0, [r2]
	adds r2, 0x1
	adds r0, r2, 0
	adds r1, r4, 0
	movs r2, 0x20
	movs r3, 0x1
	bl sub_8072C14
	ldr r0, _080A0388 @ =gStringVar1
	movs r1, 0x19
	movs r2, 0xC
	bl MenuPrint
_080A037E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0384: .4byte gMoveNames
_080A0388: .4byte gStringVar1
_080A038C: .4byte gBattleMoves
	thumb_func_end sub_80A029C

	thumb_func_start sub_80A0390
sub_80A0390: @ 80A0390
	push {r4,lr}
	movs r4, 0
_080A0394:
	lsls r3, r4, 1
	adds r1, r3, 0x4
	lsls r1, 24
	lsrs r1, 24
	adds r3, 0x5
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0xF
	movs r2, 0x1C
	bl MenuZeroFillWindowRect
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080A0394
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80A0390

	thumb_func_start sub_80A03BC
sub_80A03BC: @ 80A03BC
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x4
	beq _080A03D0
	bl sub_809F760
	lsls r0, 16
	lsrs r1, r0, 16
	b _080A03E0
_080A03D0:
	ldr r0, _080A03E8 @ =gSharedMem + 0x18000
	adds r2, r0, 0
	adds r2, 0x7C
	ldrh r0, [r2]
	ldr r1, _080A03EC @ =0x0000ffff
	cmp r0, 0
	beq _080A03E0
	adds r1, r0, 0
_080A03E0:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080A03E8: .4byte gSharedMem + 0x18000
_080A03EC: .4byte 0x0000ffff
	thumb_func_end sub_80A03BC

	thumb_func_start sub_80A03F0
sub_80A03F0: @ 80A03F0
	push {lr}
	ldrb r1, [r1]
	bl sub_80A03BC
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080A0414 @ =gSharedMem + 0x18000
	ldrb r0, [r0, 0xB]
	cmp r0, 0x2
	bne _080A041C
	adds r0, r1, 0
	bl sub_80A04CC
	ldr r0, _080A0418 @ =0x0000ffff
	bl sub_80A057C
	b _080A0422
	.align 2, 0
_080A0414: .4byte gSharedMem + 0x18000
_080A0418: .4byte 0x0000ffff
_080A041C:
	adds r0, r1, 0
	bl sub_80A057C
_080A0422:
	pop {r0}
	bx r0
	thumb_func_end sub_80A03F0

	thumb_func_start sub_80A0428
sub_80A0428: @ 80A0428
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldrb r1, [r6]
	bl sub_80A03BC
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0xB
	movs r1, 0xF
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	ldr r0, _080A0454 @ =gSharedMem + 0x18000
	ldrb r0, [r0, 0xB]
	cmp r0, 0x2
	bne _080A0458
	adds r0, r4, 0
	bl sub_80A046C
	b _080A045E
	.align 2, 0
_080A0454: .4byte gSharedMem + 0x18000
_080A0458:
	adds r0, r4, 0
	bl sub_80A0498
_080A045E:
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_80A03F0
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80A0428

	thumb_func_start sub_80A046C
sub_80A046C: @ 80A046C
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080A0490 @ =0x0000ffff
	cmp r1, r0
	beq _080A048A
	ldr r0, _080A0494 @ =gMoveDescriptions
	subs r1, 0x1
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	movs r1, 0xB
	movs r2, 0xF
	bl MenuPrint
_080A048A:
	pop {r0}
	bx r0
	.align 2, 0
_080A0490: .4byte 0x0000ffff
_080A0494: .4byte gMoveDescriptions
	thumb_func_end sub_80A046C

	thumb_func_start sub_80A0498
sub_80A0498: @ 80A0498
	push {lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _080A04C0 @ =0x0000ffff
	cmp r3, r0
	beq _080A04BC
	ldr r2, _080A04C4 @ =gUnknown_083CADD4
	ldr r1, _080A04C8 @ =gContestMoves
	lsls r0, r3, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	movs r1, 0xB
	movs r2, 0xF
	bl MenuPrint
_080A04BC:
	pop {r0}
	bx r0
	.align 2, 0
_080A04C0: .4byte 0x0000ffff
_080A04C4: .4byte gUnknown_083CADD4
_080A04C8: .4byte gContestMoves
	thumb_func_end sub_80A0498

	thumb_func_start sub_80A04CC
sub_80A04CC: @ 80A04CC
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080A0504 @ =0x0000ffff
	cmp r4, r0
	beq _080A0572
	ldr r2, _080A0508 @ =gBattleMoves
	lsls r1, r4, 1
	adds r0, r1, r4
	lsls r0, 2
	adds r2, r0, r2
	ldrb r0, [r2, 0x1]
	adds r5, r1, 0
	cmp r0, 0x1
	bhi _080A0514
	ldr r0, _080A050C @ =gStringVar1
	ldr r1, _080A0510 @ =gOtherText_ThreeDashes2
	movs r2, 0x15
	movs r3, 0x1
	bl sub_8072C74
	ldr r0, _080A050C @ =gStringVar1
	movs r1, 0x7
	movs r2, 0xF
	bl MenuPrint
	b _080A052A
	.align 2, 0
_080A0504: .4byte 0x0000ffff
_080A0508: .4byte gBattleMoves
_080A050C: .4byte gStringVar1
_080A0510: .4byte gOtherText_ThreeDashes2
_080A0514:
	ldr r0, _080A0550 @ =gStringVar1
	ldrb r1, [r2, 0x1]
	movs r2, 0x15
	movs r3, 0x1
	bl sub_8072C14
	ldr r0, _080A0550 @ =gStringVar1
	movs r1, 0x7
	movs r2, 0xF
	bl MenuPrint
_080A052A:
	ldr r0, _080A0554 @ =gBattleMoves
	adds r1, r5, r4
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	bne _080A055C
	ldr r0, _080A0550 @ =gStringVar1
	ldr r1, _080A0558 @ =gOtherText_ThreeDashes2
	movs r2, 0x15
	movs r3, 0x1
	bl sub_8072C74
	ldr r0, _080A0550 @ =gStringVar1
	movs r1, 0x7
	movs r2, 0x11
	bl MenuPrint
	b _080A0572
	.align 2, 0
_080A0550: .4byte gStringVar1
_080A0554: .4byte gBattleMoves
_080A0558: .4byte gOtherText_ThreeDashes2
_080A055C:
	ldr r0, _080A0578 @ =gStringVar1
	ldrb r1, [r1, 0x3]
	movs r2, 0x15
	movs r3, 0x1
	bl sub_8072C14
	ldr r0, _080A0578 @ =gStringVar1
	movs r1, 0x7
	movs r2, 0x11
	bl MenuPrint
_080A0572:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0578: .4byte gStringVar1
	thumb_func_end sub_80A04CC

	thumb_func_start sub_80A057C
sub_80A057C: @ 80A057C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080A0648 @ =0x06006800
	mov r8, r0
	ldr r0, _080A064C @ =0x0000ffff
	cmp r5, r0
	beq _080A063A
	ldr r1, _080A0650 @ =gContestEffects
	ldr r2, _080A0654 @ =gContestMoves
	lsls r3, r5, 3
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x1]
	mov r10, r2
	mov r9, r3
	cmp r4, 0xFF
	beq _080A05B8
	adds r0, r4, 0
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r4, r0, 24
_080A05B8:
	movs r2, 0
	movs r7, 0x3
	movs r6, 0xF3
	lsls r6, 2
_080A05C0:
	ldr r3, _080A0658 @ =0x00001039
	cmp r4, 0xFF
	beq _080A05CC
	cmp r2, r4
	bcs _080A05CC
	adds r3, 0x1
_080A05CC:
	lsrs r0, r2, 2
	lsls r0, 5
	adds r1, r2, 0
	ands r1, r7
	adds r1, r0
	lsls r1, 1
	add r1, r8
	adds r1, r6
	strh r3, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _080A05C0
	ldr r0, _080A064C @ =0x0000ffff
	cmp r5, r0
	beq _080A063A
	mov r0, r9
	add r0, r10
	ldrb r0, [r0]
	lsls r0, 2
	ldr r1, _080A0650 @ =gContestEffects
	adds r0, r1
	ldrb r4, [r0, 0x2]
	cmp r4, 0xFF
	beq _080A060C
	adds r0, r4, 0
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r4, r0, 24
_080A060C:
	movs r2, 0
	movs r6, 0x3
	ldr r5, _080A065C @ =0x0000044c
_080A0612:
	ldr r3, _080A0660 @ =0x0000103d
	cmp r4, 0xFF
	beq _080A061E
	cmp r2, r4
	bcs _080A061E
	subs r3, 0x1
_080A061E:
	lsrs r0, r2, 2
	lsls r0, 5
	adds r1, r2, 0
	ands r1, r6
	adds r1, r0
	lsls r1, 1
	add r1, r8
	adds r1, r5
	strh r3, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _080A0612
_080A063A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0648: .4byte 0x06006800
_080A064C: .4byte 0x0000ffff
_080A0650: .4byte gContestEffects
_080A0654: .4byte gContestMoves
_080A0658: .4byte 0x00001039
_080A065C: .4byte 0x0000044c
_080A0660: .4byte 0x0000103d
	thumb_func_end sub_80A057C

    .section .text_80A0958

	thumb_func_start sub_80A0958
sub_80A0958: @ 80A0958
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	mov r8, r0
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r2, _080A0A24 @ =gStringVar1
	adds r0, r2, 0
	movs r1, 0xD
	bl sub_80A1E58
	adds r2, r0, 0
	movs r6, 0xFC
	strb r6, [r2]
	movs r0, 0x11
	strb r0, [r2, 0x1]
	movs r0, 0x7
	strb r0, [r2, 0x2]
	movs r0, 0xBA
	strb r0, [r2, 0x3]
	adds r2, 0x4
	movs r0, 0xB
	adds r1, r4, 0
	muls r1, r0
	ldr r0, _080A0A28 @ =gSpeciesNames
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	strb r6, [r2]
	movs r0, 0x13
	mov r10, r0
	strb r0, [r2, 0x1]
	movs r0, 0x50
	strb r0, [r2, 0x2]
	movs r0, 0xFF
	mov r9, r0
	strb r0, [r2, 0x3]
	ldr r5, _080A0A24 @ =gStringVar1
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0xE
	bl MenuPrint
	movs r0, 0x3
	movs r1, 0x10
	movs r2, 0x9
	movs r3, 0x11
	bl MenuZeroFillWindowRect
	mov r0, r8
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0xD
	bl sub_80A1E58
	adds r2, r0, 0
	movs r0, 0x34
	strb r0, [r2]
	adds r2, 0x1
	adds r0, r2, 0
	adds r1, r4, 0
	bl ConvertIntToDecimalString
	adds r2, r0, 0
	strb r6, [r2]
	mov r0, r10
	strb r0, [r2, 0x1]
	movs r0, 0x20
	strb r0, [r2, 0x2]
	mov r0, r9
	strb r0, [r2, 0x3]
	adds r0, r5, 0
	movs r1, 0x3
	movs r2, 0x10
	bl MenuPrint
	mov r0, r8
	movs r1, 0x7
	movs r2, 0x10
	bl sub_80A0A2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A0A24: .4byte gStringVar1
_080A0A28: .4byte gSpeciesNames
	thumb_func_end sub_80A0958

	thumb_func_start sub_80A0A2C
sub_80A0A2C: @ 80A0A2C
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x20
	beq _080A0A84
	cmp r0, 0x1D
	beq _080A0A84
	adds r0, r6, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080A0A6E
	cmp r0, 0xFE
	beq _080A0A78
	adds r3, r4, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl MenuZeroFillWindowRect
	b _080A0A84
_080A0A6E:
	ldr r0, _080A0A74 @ =gOtherText_MaleSymbol2
	movs r1, 0xB
	b _080A0A7C
	.align 2, 0
_080A0A74: .4byte gOtherText_MaleSymbol2
_080A0A78:
	ldr r0, _080A0A8C @ =gOtherText_FemaleSymbolAndLv
	movs r1, 0xC
_080A0A7C:
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_80A1FF8
_080A0A84:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A0A8C: .4byte gOtherText_FemaleSymbolAndLv
	thumb_func_end sub_80A0A2C

	thumb_func_start sub_80A0A90
sub_80A0A90: @ 80A0A90
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x32
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x33
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x34
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x35
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x36
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x43
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x44
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x45
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x46
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x47
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x48
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x49
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x4A
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x4B
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x4C
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x4D
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x4E
	bl GetMonData
	adds r4, r0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80A0A90

	thumb_func_start sub_80A0B88
sub_80A0B88: @ 80A0B88
	push {r4,r5,lr}
	bl sub_80A0A90
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080A0BA8
	ldr r0, _080A0BA0 @ =gStringVar1
	ldr r1, _080A0BA4 @ =gOtherText_None
	bl StringCopy
	b _080A0BD8
	.align 2, 0
_080A0BA0: .4byte gStringVar1
_080A0BA4: .4byte gOtherText_None
_080A0BA8:
	ldr r4, _080A0BE8 @ =gStringVar1
	ldr r1, _080A0BEC @ =gOtherText_Ribbons00
	adds r0, r4, 0
	bl StringCopy
	adds r0, r4, 0
	bl StringLength
	lsls r0, 24
	lsrs r0, 24
	subs r4, 0x2
	adds r0, r4
	movs r1, 0xFC
	strb r1, [r0]
	movs r1, 0x14
	strb r1, [r0, 0x1]
	movs r1, 0x6
	strb r1, [r0, 0x2]
	adds r0, 0x3
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
_080A0BD8:
	ldr r0, _080A0BF0 @ =gUnknown_083C15AE
	movs r1, 0x15
	movs r2, 0x4
	bl MenuPrint
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0BE8: .4byte gStringVar1
_080A0BEC: .4byte gOtherText_Ribbons00
_080A0BF0: .4byte gUnknown_083C15AE
	thumb_func_end sub_80A0B88

	thumb_func_start sub_80A0BF4
sub_80A0BF4: @ 80A0BF4
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	cmp r5, 0xAF
	bne _080A0C48
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A0C48
	bl IsLinkDoubleBattle
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080A0C48
	ldr r0, _080A0C40 @ =gSharedMem + 0x18000
	ldrb r0, [r0, 0x9]
	cmp r0, 0x1
	beq _080A0C2E
	cmp r0, 0x4
	beq _080A0C2E
	cmp r0, 0x5
	bne _080A0C48
_080A0C2E:
	ldr r4, _080A0C44 @ =gStringVar1
	adds r0, r5, 0
	bl ItemId_GetItem
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	b _080A0C68
	.align 2, 0
_080A0C40: .4byte gSharedMem + 0x18000
_080A0C44: .4byte gStringVar1
_080A0C48:
	cmp r5, 0
	bne _080A0C60
	ldr r0, _080A0C58 @ =gStringVar1
	ldr r1, _080A0C5C @ =gOtherText_None
	bl StringCopy
	b _080A0C68
	.align 2, 0
_080A0C58: .4byte gStringVar1
_080A0C5C: .4byte gOtherText_None
_080A0C60:
	ldr r1, _080A0C78 @ =gStringVar1
	adds r0, r5, 0
	bl CopyItemName
_080A0C68:
	ldr r0, _080A0C7C @ =gUnknown_083C15B4
	adds r1, r7, 0
	adds r2, r6, 0
	bl MenuPrint
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0C78: .4byte gStringVar1
_080A0C7C: .4byte gUnknown_083C15B4
	thumb_func_end sub_80A0BF4

	thumb_func_start sub_80A0C80
sub_80A0C80: @ 80A0C80
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	movs r0, 0
	mov r9, r0
	movs r6, 0
	movs r7, 0
	adds r0, r4, 0
	movs r1, 0x19
	bl GetMonData
	mov r8, r0
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r5, 0x63
	bhi _080A0D14
	ldr r3, _080A0D4C @ =gExperienceTables
	adds r1, r5, 0x1
	lsls r1, 2
	ldr r2, _080A0D50 @ =gBaseStats
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r2, r0
	adds r1, r2
	adds r1, r3
	ldr r1, [r1]
	mov r0, r8
	subs r0, r1, r0
	mov r9, r0
	lsls r0, r5, 2
	adds r0, r2
	adds r0, r3
	ldr r0, [r0]
	subs r1, r0
	mov r2, r8
	subs r4, r2, r0
	lsls r0, r4, 6
	bl __udivsi3
	adds r6, r0, 0
	movs r7, 0
	adds r0, r7, 0
	orrs r0, r6
	cmp r0, 0
	bne _080A0D14
	cmp r4, 0
	beq _080A0D14
	movs r6, 0x1
	movs r7, 0
_080A0D14:
	ldr r4, _080A0D54 @ =gStringVar1
	adds r0, r4, 0
	mov r1, r9
	bl ConvertIntToDecimalString
	mov r1, r10
	adds r1, 0x6
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	ldr r2, [sp]
	bl MenuPrint_RightAligned
	ldr r0, _080A0D58 @ =0x06004caa
	mov r9, r0
	movs r2, 0
	mov r12, r2
	ldr r0, _080A0D5C @ =0x00002062
	mov r8, r0
_080A0D3A:
	cmp r7, 0
	bgt _080A0D46
	cmp r7, 0
	bne _080A0D64
	cmp r6, 0x7
	bls _080A0D64
_080A0D46:
	ldr r1, _080A0D60 @ =0x0000206a
	b _080A0D96
	.align 2, 0
_080A0D4C: .4byte gExperienceTables
_080A0D50: .4byte gBaseStats
_080A0D54: .4byte gStringVar1
_080A0D58: .4byte 0x06004caa
_080A0D5C: .4byte 0x00002062
_080A0D60: .4byte 0x0000206a
_080A0D64:
	adds r5, r7, 0
	adds r4, r6, 0
	cmp r7, 0
	bge _080A0D74
	movs r4, 0x7
	movs r5, 0
	adds r4, r6
	adcs r5, r7
_080A0D74:
	lsls r3, r5, 29
	lsrs r2, r4, 3
	adds r0, r3, 0
	orrs r0, r2
	asrs r1, r5, 3
	lsrs r5, r0, 29
	lsls r4, r1, 3
	adds r3, r5, 0
	orrs r3, r4
	lsls r2, r0, 3
	adds r1, r7, 0
	adds r0, r6, 0
	subs r0, r2
	sbcs r1, r3
	add r0, r8
	lsls r0, 16
	lsrs r1, r0, 16
_080A0D96:
	mov r2, r12
	lsls r0, r2, 1
	add r0, r9
	strh r1, [r0]
	movs r0, 0x8
	negs r0, r0
	asrs r1, r0, 31
	adds r6, r0
	adcs r7, r1
	cmp r7, 0
	bge _080A0DB0
	movs r6, 0
	movs r7, 0
_080A0DB0:
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	cmp r0, 0x7
	bls _080A0D3A
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A0C80

	thumb_func_start sub_80A0DD0
sub_80A0DD0: @ 80A0DD0
	push {r4,r5,lr}
	ldr r2, _080A0E3C @ =gStringVar1
	movs r5, 0xFC
	strb r5, [r2]
	movs r0, 0x12
	strb r0, [r2, 0x1]
	movs r0, 0x2
	strb r0, [r2, 0x2]
	adds r2, 0x3
	adds r0, r2, 0
	movs r1, 0xD
	bl sub_80A1E58
	adds r2, r0, 0
	ldr r1, _080A0E40 @ =gUnknown_083C1068
	ldr r4, _080A0E44 @ =gSharedMem + 0x18000
	adds r0, r4, 0
	adds r0, 0x7E
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	strb r5, [r2]
	movs r0, 0x13
	strb r0, [r2, 0x1]
	movs r0, 0x58
	strb r0, [r2, 0x2]
	movs r0, 0xFF
	strb r0, [r2, 0x3]
	ldr r0, _080A0E3C @ =gStringVar1
	movs r1, 0
	movs r2, 0
	bl MenuPrint
	adds r4, 0x7F
	ldrb r0, [r4]
	cmp r0, 0
	beq _080A0E48
	movs r0, 0x5
	movs r1, 0x17
	movs r2, 0
	bl GetStringCenterAlignXOffset
	movs r0, 0x6
	movs r1, 0x18
	movs r2, 0
	bl GetStringCenterAlignXOffset
	b _080A0E54
	.align 2, 0
_080A0E3C: .4byte gStringVar1
_080A0E40: .4byte gUnknown_083C1068
_080A0E44: .4byte gSharedMem + 0x18000
_080A0E48:
	movs r0, 0x17
	movs r1, 0
	movs r2, 0x18
	movs r3, 0x1
	bl MenuZeroFillWindowRect
_080A0E54:
	ldr r2, _080A0E98 @ =gStringVar1
	adds r0, r2, 0
	movs r1, 0xD
	bl sub_80A1E58
	adds r2, r0, 0
	ldr r1, _080A0E9C @ =gUnknown_083C1068
	ldr r0, _080A0EA0 @ =gSharedMem + 0x18000
	adds r0, 0x7F
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x13
	strb r0, [r2, 0x1]
	movs r0, 0x28
	strb r0, [r2, 0x2]
	movs r0, 0xFF
	strb r0, [r2, 0x3]
	ldr r0, _080A0E98 @ =gStringVar1
	movs r1, 0x19
	movs r2, 0
	bl MenuPrint
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0E98: .4byte gStringVar1
_080A0E9C: .4byte gUnknown_083C1068
_080A0EA0: .4byte gSharedMem + 0x18000
	thumb_func_end sub_80A0DD0

	thumb_func_start sub_80A0EA4
sub_80A0EA4: @ 80A0EA4
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _080A0ECC @ =0x0600e444
	ldr r6, _080A0ED0 @ =0x0600ec44
	movs r1, 0
	bl CheckPartyPokerus
	lsls r0, 24
	cmp r0, 0
	bne _080A0ED4
	adds r0, r4, 0
	movs r1, 0
	bl CheckPartyHasHadPokerus
	lsls r0, 24
	cmp r0, 0
	beq _080A0ED4
	movs r0, 0x2C
	b _080A0ED8
	.align 2, 0
_080A0ECC: .4byte 0x0600e444
_080A0ED0: .4byte 0x0600ec44
_080A0ED4:
	ldr r1, _080A0EE4 @ =0x0000081a
	adds r0, r1, 0
_080A0ED8:
	strh r0, [r5]
	strh r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A0EE4: .4byte 0x0000081a
	thumb_func_end sub_80A0EA4

	thumb_func_start sub_80A0EE8
sub_80A0EE8: @ 80A0EE8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	movs r3, 0
	ldr r6, _080A0F24 @ =gSharedMem + 0x18000
	adds r5, r6, 0
	ldr r1, _080A0F28 @ =0x00004040
	mov r8, r1
	ldr r2, _080A0F2C @ =0x0000404a
	mov r10, r2
_080A0F02:
	adds r0, r5, 0
	adds r0, 0x75
	ldrb r0, [r0]
	cmp r3, r0
	bcs _080A0F30
	lsls r1, r3, 1
	lsls r0, r3, 2
	add r0, sp
	mov r4, r8
	strh r4, [r0]
	adds r1, 0x1
	lsls r1, 1
	mov r7, sp
	adds r0, r7, r1
	strh r4, [r0]
	b _080A0FE2
	.align 2, 0
_080A0F24: .4byte gSharedMem + 0x18000
_080A0F28: .4byte 0x00004040
_080A0F2C: .4byte 0x0000404a
_080A0F30:
	movs r0, 0x76
	adds r0, r6
	mov r12, r0
	ldrb r1, [r0]
	cmp r3, r1
	bls _080A0F52
	lsls r1, r3, 1
	lsls r0, r3, 2
	add r0, sp
	mov r2, r10
	strh r2, [r0]
	adds r1, 0x1
	lsls r1, 1
	mov r4, sp
	adds r0, r4, r1
	strh r2, [r0]
	b _080A0FE2
_080A0F52:
	ldrb r4, [r5, 0xB]
	cmp r3, r4
	bcs _080A0F6E
	lsls r1, r3, 1
	lsls r0, r3, 2
	mov r7, sp
	adds r2, r7, r0
	ldr r0, _080A0F88 @ =0x00004046
	strh r0, [r2]
	adds r1, 0x1
	lsls r1, 1
	add r1, sp
	adds r0, 0x1
	strh r0, [r1]
_080A0F6E:
	cmp r3, r4
	bne _080A0FA6
	mov r0, r12
	ldrb r0, [r0]
	cmp r3, r0
	beq _080A0F90
	lsls r1, r3, 1
	lsls r0, r3, 2
	mov r4, sp
	adds r2, r4, r0
	ldr r0, _080A0F8C @ =0x00004041
	b _080A0F9A
	.align 2, 0
_080A0F88: .4byte 0x00004046
_080A0F8C: .4byte 0x00004041
_080A0F90:
	lsls r1, r3, 1
	lsls r0, r3, 2
	mov r7, sp
	adds r2, r7, r0
	ldr r0, _080A0FC4 @ =0x0000404b
_080A0F9A:
	strh r0, [r2]
	adds r1, 0x1
	lsls r1, 1
	add r1, sp
	adds r0, 0x1
	strh r0, [r1]
_080A0FA6:
	ldrb r0, [r5, 0xB]
	cmp r3, r0
	bls _080A0FE2
	adds r0, r6, 0
	adds r0, 0x76
	ldrb r0, [r0]
	cmp r3, r0
	beq _080A0FCC
	lsls r1, r3, 1
	lsls r0, r3, 2
	mov r4, sp
	adds r2, r4, r0
	ldr r0, _080A0FC8 @ =0x00004043
	b _080A0FD6
	.align 2, 0
_080A0FC4: .4byte 0x0000404b
_080A0FC8: .4byte 0x00004043
_080A0FCC:
	lsls r1, r3, 1
	lsls r0, r3, 2
	mov r7, sp
	adds r2, r7, r0
	ldr r0, _080A1034 @ =0x00004048
_080A0FD6:
	strh r0, [r2]
	adds r1, 0x1
	lsls r1, 1
	add r1, sp
	adds r0, 0x1
	strh r0, [r1]
_080A0FE2:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _080A0F02
	ldr r1, _080A1038 @ =0x0600e016
	ldr r0, _080A103C @ =0x040000d4
	mov r2, sp
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080A1040 @ =0x80000008
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	movs r3, 0
_080A0FFE:
	lsls r0, r3, 1
	mov r4, sp
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, 0x10
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x7
	bls _080A0FFE
	ldr r1, _080A1044 @ =0x0600e056
	ldr r0, _080A103C @ =0x040000d4
	str r4, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080A1040 @ =0x80000008
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1034: .4byte 0x00004048
_080A1038: .4byte 0x0600e016
_080A103C: .4byte 0x040000d4
_080A1040: .4byte 0x80000008
_080A1044: .4byte 0x0600e056
	thumb_func_end sub_80A0EE8

	thumb_func_start sub_80A1048
sub_80A1048: @ 80A1048
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	ldr r1, _080A10A0 @ =gTasks + 0x8
	adds r6, r0, r1
	ldrh r0, [r6]
	ldrh r1, [r6, 0x2]
	adds r0, r1
	strh r0, [r6, 0x2]
	lsls r0, 16
	cmp r0, 0
	bne _080A106E
	b _080A1224
_080A106E:
	movs r5, 0x2
	ldrsh r2, [r6, r5]
	ldr r0, _080A10A4 @ =0x0000024a
	subs r0, r2
	lsls r0, 1
	ldr r1, _080A10A8 @ =gUnknown_08E73508
	adds r4, r0, r1
	ldr r5, _080A10AC @ =0x0600e480
	lsls r2, 1
	movs r0, 0x80
	lsls r0, 5
	adds r7, r1, 0
	cmp r2, r0
	bhi _080A10B4
	ldr r0, _080A10B0 @ =0x040000d4
	str r4, [r0]
	str r5, [r0, 0x4]
	lsrs r1, r2, 1
	movs r2, 0x80
	lsls r2, 24
	orrs r1, r2
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _080A10E0
	.align 2, 0
_080A10A0: .4byte gTasks + 0x8
_080A10A4: .4byte 0x0000024a
_080A10A8: .4byte gUnknown_08E73508
_080A10AC: .4byte 0x0600e480
_080A10B0: .4byte 0x040000d4
_080A10B4:
	ldr r3, _080A110C @ =0x040000d4
	str r4, [r3]
	str r5, [r3, 0x4]
	ldr r0, _080A1110 @ =0x80000800
	str r0, [r3, 0x8]
	ldr r0, [r3, 0x8]
	movs r0, 0x80
	lsls r0, 5
	adds r4, r0
	adds r5, r0
	ldr r1, _080A1114 @ =0xfffff000
	adds r2, r1
	cmp r2, r0
	bhi _080A10B4
	str r4, [r3]
	str r5, [r3, 0x4]
	lsrs r0, r2, 1
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r3, 0x8]
	ldr r0, [r3, 0x8]
_080A10E0:
	movs r5, 0x2
	ldrsh r0, [r6, r5]
	ldr r1, _080A1118 @ =0x0000026a
	subs r1, r0
	lsls r1, 1
	adds r3, r1, r7
	ldr r4, _080A111C @ =0x0600e4c0
	lsls r1, r0, 1
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	bhi _080A1120
	ldr r0, _080A110C @ =0x040000d4
	str r3, [r0]
	str r4, [r0, 0x4]
	lsrs r1, 1
	movs r2, 0x80
	lsls r2, 24
	orrs r1, r2
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _080A114C
	.align 2, 0
_080A110C: .4byte 0x040000d4
_080A1110: .4byte 0x80000800
_080A1114: .4byte 0xfffff000
_080A1118: .4byte 0x0000026a
_080A111C: .4byte 0x0600e4c0
_080A1120:
	ldr r2, _080A1178 @ =0x040000d4
	str r3, [r2]
	str r4, [r2, 0x4]
	ldr r0, _080A117C @ =0x80000800
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r0, 0x80
	lsls r0, 5
	adds r3, r0
	adds r4, r0
	ldr r5, _080A1180 @ =0xfffff000
	adds r1, r5
	cmp r1, r0
	bhi _080A1120
	str r3, [r2]
	str r4, [r2, 0x4]
	lsrs r0, r1, 1
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
_080A114C:
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	ldr r1, _080A1184 @ =0x0000024a
	subs r1, r0
	lsls r1, 1
	adds r3, r1, r7
	ldr r4, _080A1188 @ =0x0600ec80
	lsls r1, r0, 1
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	bhi _080A118C
	ldr r0, _080A1178 @ =0x040000d4
	str r3, [r0]
	str r4, [r0, 0x4]
	lsrs r1, 1
	movs r2, 0x80
	lsls r2, 24
	orrs r1, r2
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _080A11B8
	.align 2, 0
_080A1178: .4byte 0x040000d4
_080A117C: .4byte 0x80000800
_080A1180: .4byte 0xfffff000
_080A1184: .4byte 0x0000024a
_080A1188: .4byte 0x0600ec80
_080A118C:
	ldr r2, _080A11E4 @ =0x040000d4
	str r3, [r2]
	str r4, [r2, 0x4]
	ldr r0, _080A11E8 @ =0x80000800
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r0, 0x80
	lsls r0, 5
	adds r3, r0
	adds r4, r0
	ldr r5, _080A11EC @ =0xfffff000
	adds r1, r5
	cmp r1, r0
	bhi _080A118C
	str r3, [r2]
	str r4, [r2, 0x4]
	lsrs r0, r1, 1
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
_080A11B8:
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	ldr r1, _080A11F0 @ =0x0000026a
	subs r1, r0
	lsls r1, 1
	adds r3, r1, r7
	ldr r4, _080A11F4 @ =0x0600ecc0
	lsls r1, r0, 1
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	bhi _080A11F8
	ldr r0, _080A11E4 @ =0x040000d4
	str r3, [r0]
	str r4, [r0, 0x4]
	lsrs r1, 1
	movs r2, 0x80
	lsls r2, 24
	orrs r1, r2
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _080A1224
	.align 2, 0
_080A11E4: .4byte 0x040000d4
_080A11E8: .4byte 0x80000800
_080A11EC: .4byte 0xfffff000
_080A11F0: .4byte 0x0000026a
_080A11F4: .4byte 0x0600ecc0
_080A11F8:
	ldr r2, _080A12B0 @ =0x040000d4
	str r3, [r2]
	str r4, [r2, 0x4]
	ldr r0, _080A12B4 @ =0x80000800
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r0, 0x80
	lsls r0, 5
	adds r3, r0
	adds r4, r0
	ldr r5, _080A12B8 @ =0xfffff000
	adds r1, r5
	cmp r1, r0
	bhi _080A11F8
	str r3, [r2]
	str r4, [r2, 0x4]
	lsrs r0, r1, 1
	movs r1, 0x80
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
_080A1224:
	ldrb r4, [r6, 0x2]
	ldrh r7, [r6, 0x2]
	ldrh r0, [r6]
	mov r12, r0
	cmp r4, 0x9
	bhi _080A1272
	adds r3, r6, 0x4
	ldr r2, _080A12B0 @ =0x040000d4
	ldr r5, _080A12BC @ =0x80000001
_080A1236:
	lsls r1, r4, 1
	ldr r6, _080A12C0 @ =0x0600e480
	adds r0, r1, r6
	str r3, [r2]
	str r0, [r2, 0x4]
	str r5, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r6, 0x40
	adds r0, r1, r6
	str r3, [r2]
	str r0, [r2, 0x4]
	str r5, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r6, _080A12C4 @ =0x0600ec80
	adds r0, r1, r6
	str r3, [r2]
	str r0, [r2, 0x4]
	str r5, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _080A12C8 @ =0x0600ecc0
	adds r1, r0
	str r3, [r2]
	str r1, [r2, 0x4]
	str r5, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _080A1236
_080A1272:
	mov r1, r12
	lsls r0, r1, 16
	cmp r0, 0
	beq _080A1286
	lsls r0, r7, 16
	asrs r0, 16
	cmp r0, 0
	ble _080A1286
	cmp r0, 0x9
	ble _080A12A4
_080A1286:
	lsls r0, r7, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _080A129A
	ldr r0, _080A12CC @ =gOtherText_Status
	movs r1, 0xD
	movs r2, 0x1
	movs r3, 0x12
	bl sub_80A1FF8
_080A129A:
	bl sub_80A1D18
	mov r0, r8
	bl DestroyTask
_080A12A4:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A12B0: .4byte 0x040000d4
_080A12B4: .4byte 0x80000800
_080A12B8: .4byte 0xfffff000
_080A12BC: .4byte 0x80000001
_080A12C0: .4byte 0x0600e480
_080A12C4: .4byte 0x0600ec80
_080A12C8: .4byte 0x0600ecc0
_080A12CC: .4byte gOtherText_Status
	thumb_func_end sub_80A1048

	thumb_func_start sub_80A12D0
sub_80A12D0: @ 80A12D0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0x12
	movs r2, 0x5
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0x1D
	bl sub_80A18E4
	ldr r0, _080A1310 @ =sub_80A1048
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080A1314 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r1
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0x8]
	cmp r4, 0
	bge _080A1318
	movs r0, 0xA
	b _080A131A
	.align 2, 0
_080A1310: .4byte sub_80A1048
_080A1314: .4byte gTasks
_080A1318:
	movs r0, 0
_080A131A:
	strh r0, [r1, 0xA]
	ldr r0, _080A1330 @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0xC]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1330: .4byte gTasks
	thumb_func_end sub_80A12D0

	thumb_func_start sub_80A1334
sub_80A1334: @ 80A1334
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r0, 2
	add r0, r10
	lsls r0, 3
	ldr r1, _080A13E4 @ =gTasks + 0x8
	adds r7, r0, r1
	ldrh r0, [r7]
	ldrh r1, [r7, 0x2]
	adds r0, r1
	strh r0, [r7, 0x2]
	lsls r0, 16
	asrs r1, r0, 16
	movs r0, 0
	cmp r1, 0
	blt _080A136A
	movs r0, 0xA
	cmp r1, 0xA
	bgt _080A136A
	ldrh r0, [r7, 0x2]
_080A136A:
	lsls r0, 16
	asrs r2, r0, 16
	mov r9, r0
	cmp r2, 0
	ble _080A13A6
	movs r0, 0xA
	subs r0, r2
	lsls r0, 1
	ldr r1, _080A13E8 @ =0x06005b40
	adds r4, r0, r1
	movs r5, 0
	adds r6, r2, 0
	ldr r0, _080A13EC @ =0x001fffff
	mov r8, r0
_080A1386:
	adds r0, r5, 0
	adds r0, 0xD
	lsls r0, 6
	ldr r1, _080A13F0 @ =gUnknown_08E73E88
	adds r0, r1
	adds r1, r4, 0
	mov r2, r8
	ands r2, r6
	bl CpuSet
	adds r4, 0x40
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x6
	bls _080A1386
_080A13A6:
	mov r1, r9
	asrs r2, r1, 16
	cmp r2, 0x9
	bgt _080A13F4
	ldr r4, _080A13E8 @ =0x06005b40
	movs r5, 0
	mov r8, sp
	movs r0, 0xA
	subs r6, r0, r2
	ldr r0, _080A13EC @ =0x001fffff
	ands r6, r0
	movs r0, 0x80
	lsls r0, 17
	mov r9, r0
_080A13C2:
	ldrh r0, [r7, 0x4]
	mov r1, r8
	strh r0, [r1]
	mov r0, sp
	adds r1, r4, 0
	mov r2, r9
	orrs r2, r6
	bl CpuSet
	adds r4, 0x40
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x6
	bls _080A13C2
	b _080A1400
	.align 2, 0
_080A13E4: .4byte gTasks + 0x8
_080A13E8: .4byte 0x06005b40
_080A13EC: .4byte 0x001fffff
_080A13F0: .4byte gUnknown_08E73E88
_080A13F4:
	movs r0, 0
	movs r1, 0x13
	movs r2, 0x9
	movs r3, 0x13
	bl MenuZeroFillWindowRect
_080A1400:
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0
	beq _080A1410
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bge _080A144A
_080A1410:
	ldr r4, _080A1480 @ =gSharedMem + 0x18000
	ldrb r0, [r4, 0xB]
	cmp r0, 0x2
	bne _080A1444
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x9
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	adds r4, 0x10
	adds r0, r4, 0
	bl sub_80A0958
	adds r0, r4, 0
	bl GetMonStatusAndPokerus
	lsls r0, 24
	cmp r0, 0
	beq _080A1444
	ldr r0, _080A1484 @ =gOtherText_Status
	movs r1, 0xD
	movs r2, 0x1
	movs r3, 0x12
	bl sub_80A1FF8
_080A1444:
	mov r0, r10
	bl DestroyTask
_080A144A:
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	cmp r0, 0x9
	ble _080A1470
	ldr r4, _080A1480 @ =gSharedMem + 0x18000
	ldrb r0, [r4, 0xB]
	cmp r0, 0x2
	bne _080A1460
	ldrb r0, [r7, 0x6]
	bl sub_80A00F4
_080A1460:
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r7, 0x6
	bl sub_80A0428
	mov r0, r10
	bl DestroyTask
_080A1470:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1480: .4byte gSharedMem + 0x18000
_080A1484: .4byte gOtherText_Status
	thumb_func_end sub_80A1334

	thumb_func_start sub_80A1488
sub_80A1488: @ 80A1488
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _080A14DC @ =gSharedMem + 0x18000
	ldrb r0, [r0, 0xB]
	cmp r0, 0x2
	bne _080A14A6
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x9
	movs r3, 0x13
	bl MenuZeroFillWindowRect
_080A14A6:
	ldr r5, _080A14E0 @ =sub_80A1334
	adds r0, r5, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	bne _080A14C2
	adds r0, r5, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
_080A14C2:
	ldr r1, _080A14E4 @ =gTasks
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r1
	lsls r0, r6, 24
	asrs r0, 24
	strh r0, [r3, 0x8]
	cmp r0, 0
	bge _080A14E8
	movs r0, 0xA
	b _080A14EA
	.align 2, 0
_080A14DC: .4byte gSharedMem + 0x18000
_080A14E0: .4byte sub_80A1334
_080A14E4: .4byte gTasks
_080A14E8:
	movs r0, 0
_080A14EA:
	strh r0, [r3, 0xA]
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	strh r7, [r0, 0xE]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A1488

	thumb_func_start sub_80A1500
sub_80A1500: @ 80A1500
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r0, 2
	add r0, r10
	lsls r0, 3
	ldr r1, _080A15B0 @ =gTasks + 0x8
	adds r7, r0, r1
	ldrh r0, [r7]
	ldrh r1, [r7, 0x2]
	adds r0, r1
	strh r0, [r7, 0x2]
	lsls r0, 16
	asrs r1, r0, 16
	movs r0, 0
	cmp r1, 0
	blt _080A1536
	movs r0, 0xA
	cmp r1, 0xA
	bgt _080A1536
	ldrh r0, [r7, 0x2]
_080A1536:
	lsls r0, 16
	asrs r2, r0, 16
	mov r9, r0
	cmp r2, 0
	ble _080A1572
	movs r0, 0xA
	subs r0, r2
	lsls r0, 1
	ldr r1, _080A15B4 @ =0x06006b40
	adds r4, r0, r1
	movs r5, 0
	adds r6, r2, 0
	ldr r0, _080A15B8 @ =0x001fffff
	mov r8, r0
_080A1552:
	adds r0, r5, 0
	adds r0, 0xD
	lsls r0, 6
	ldr r1, _080A15BC @ =gUnknown_08E74688
	adds r0, r1
	adds r1, r4, 0
	mov r2, r8
	ands r2, r6
	bl CpuSet
	adds r4, 0x40
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x6
	bls _080A1552
_080A1572:
	mov r1, r9
	asrs r2, r1, 16
	cmp r2, 0x9
	bgt _080A15C0
	ldr r4, _080A15B4 @ =0x06006b40
	movs r5, 0
	mov r8, sp
	movs r0, 0xA
	subs r6, r0, r2
	ldr r0, _080A15B8 @ =0x001fffff
	ands r6, r0
	movs r0, 0x80
	lsls r0, 17
	mov r9, r0
_080A158E:
	ldrh r0, [r7, 0x4]
	mov r1, r8
	strh r0, [r1]
	mov r0, sp
	adds r1, r4, 0
	mov r2, r9
	orrs r2, r6
	bl CpuSet
	adds r4, 0x40
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x6
	bls _080A158E
	b _080A15CC
	.align 2, 0
_080A15B0: .4byte gTasks + 0x8
_080A15B4: .4byte 0x06006b40
_080A15B8: .4byte 0x001fffff
_080A15BC: .4byte gUnknown_08E74688
_080A15C0:
	movs r0, 0
	movs r1, 0x13
	movs r2, 0x9
	movs r3, 0x13
	bl MenuZeroFillWindowRect
_080A15CC:
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0
	beq _080A15DC
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bge _080A1616
_080A15DC:
	ldr r4, _080A164C @ =gSharedMem + 0x18000
	ldrb r0, [r4, 0xB]
	cmp r0, 0x3
	bne _080A1610
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x9
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	adds r4, 0x10
	adds r0, r4, 0
	bl sub_80A0958
	adds r0, r4, 0
	bl GetMonStatusAndPokerus
	lsls r0, 24
	cmp r0, 0
	beq _080A1610
	ldr r0, _080A1650 @ =gOtherText_Status
	movs r1, 0xD
	movs r2, 0x1
	movs r3, 0x12
	bl sub_80A1FF8
_080A1610:
	mov r0, r10
	bl DestroyTask
_080A1616:
	movs r1, 0x2
	ldrsh r0, [r7, r1]
	cmp r0, 0x9
	ble _080A163C
	ldr r4, _080A164C @ =gSharedMem + 0x18000
	ldrb r0, [r4, 0xB]
	cmp r0, 0x3
	bne _080A162C
	ldrb r0, [r7, 0x6]
	bl sub_80A00F4
_080A162C:
	adds r0, r4, 0
	adds r0, 0x10
	adds r1, r7, 0x6
	bl sub_80A0428
	mov r0, r10
	bl DestroyTask
_080A163C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A164C: .4byte gSharedMem + 0x18000
_080A1650: .4byte gOtherText_Status
	thumb_func_end sub_80A1500

	thumb_func_start sub_80A1654
sub_80A1654: @ 80A1654
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _080A16A8 @ =gSharedMem + 0x18000
	ldrb r0, [r0, 0xB]
	cmp r0, 0x3
	bne _080A1672
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x9
	movs r3, 0x13
	bl MenuZeroFillWindowRect
_080A1672:
	ldr r5, _080A16AC @ =sub_80A1500
	adds r0, r5, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xFF
	bne _080A168E
	adds r0, r5, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
_080A168E:
	ldr r1, _080A16B0 @ =gTasks
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r1
	lsls r0, r6, 24
	asrs r0, 24
	strh r0, [r3, 0x8]
	cmp r0, 0
	bge _080A16B4
	movs r0, 0xA
	b _080A16B6
	.align 2, 0
_080A16A8: .4byte gSharedMem + 0x18000
_080A16AC: .4byte sub_80A1500
_080A16B0: .4byte gTasks
_080A16B4:
	movs r0, 0
_080A16B6:
	strh r0, [r3, 0xA]
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	strh r7, [r0, 0xE]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80A1654

	thumb_func_start sub_80A16CC
sub_80A16CC: @ 80A16CC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _080A1724 @ =0x06006ad4
	mov r12, r0
	mov r1, r9
	cmp r1, 0
	bne _080A172C
	movs r5, 0
	ldr r7, _080A1728 @ =gUnknown_08E94510
	movs r0, 0x80
	lsls r0, 5
	adds r6, r0, 0
	movs r1, 0x40
	adds r1, r7
	mov r8, r1
_080A16F4:
	lsls r2, r5, 1
	mov r0, r12
	adds r3, r2, r0
	adds r4, r2, r7
	ldrh r1, [r4]
	adds r0, r6, r1
	strh r0, [r3]
	adds r1, r3, 0
	adds r1, 0x40
	ldrh r4, [r4]
	adds r0, r6, r4
	strh r0, [r1]
	adds r3, 0x80
	add r2, r8
	ldrh r2, [r2]
	adds r0, r6, r2
	strh r0, [r3]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080A16F4
	b _080A1768
	.align 2, 0
_080A1724: .4byte 0x06006ad4
_080A1728: .4byte gUnknown_08E94510
_080A172C:
	movs r5, 0
	ldr r6, _080A17B0 @ =gUnknown_08E94550
	movs r7, 0x80
	lsls r7, 5
	adds r4, r7, 0
	movs r0, 0x40
	adds r0, r6
	mov r8, r0
_080A173C:
	lsls r1, r5, 1
	mov r7, r12
	adds r2, r1, r7
	adds r0, r1, r6
	ldrh r0, [r0]
	adds r0, r4, r0
	strh r0, [r2]
	adds r3, r2, 0
	adds r3, 0x40
	add r1, r8
	ldrh r7, [r1]
	adds r0, r4, r7
	strh r0, [r3]
	adds r2, 0x80
	ldrh r1, [r1]
	adds r0, r4, r1
	strh r0, [r2]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080A173C
_080A1768:
	ldr r0, _080A17B4 @ =0x06005ad4
	mov r12, r0
	mov r1, r9
	cmp r1, 0
	bne _080A17BC
	movs r5, 0
	ldr r7, _080A17B8 @ =gUnknown_08E94510
	movs r0, 0xC0
	lsls r0, 6
	adds r6, r0, 0
	movs r1, 0x40
	adds r1, r7
	mov r8, r1
_080A1782:
	lsls r2, r5, 1
	mov r0, r12
	adds r3, r2, r0
	adds r4, r2, r7
	ldrh r1, [r4]
	adds r0, r6, r1
	strh r0, [r3]
	adds r1, r3, 0
	adds r1, 0x40
	ldrh r4, [r4]
	adds r0, r6, r4
	strh r0, [r1]
	adds r3, 0x80
	add r2, r8
	ldrh r2, [r2]
	adds r0, r6, r2
	strh r0, [r3]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080A1782
	b _080A17F8
	.align 2, 0
_080A17B0: .4byte gUnknown_08E94550
_080A17B4: .4byte 0x06005ad4
_080A17B8: .4byte gUnknown_08E94510
_080A17BC:
	movs r5, 0
	ldr r6, _080A1804 @ =gUnknown_08E94550
	movs r7, 0xC0
	lsls r7, 6
	adds r4, r7, 0
	movs r0, 0x40
	adds r0, r6
	mov r8, r0
_080A17CC:
	lsls r1, r5, 1
	mov r7, r12
	adds r2, r1, r7
	adds r0, r1, r6
	ldrh r0, [r0]
	adds r0, r4, r0
	strh r0, [r2]
	adds r3, r2, 0
	adds r3, 0x40
	add r1, r8
	ldrh r7, [r1]
	adds r0, r4, r7
	strh r0, [r3]
	adds r2, 0x80
	ldrh r1, [r1]
	adds r0, r4, r1
	strh r0, [r2]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080A17CC
_080A17F8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1804: .4byte gUnknown_08E94550
	thumb_func_end sub_80A16CC

	thumb_func_start sub_80A1808
sub_80A1808: @ 80A1808
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r1, 0x41
	bl GetMonData
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _080A1860 @ =gUnknown_02024E8C
	movs r1, 0x28
	movs r2, 0x40
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, r0, 4
	add r4, r8
	lsls r4, 2
	ldr r5, _080A1864 @ =gSprites
	adds r7, r4, r5
	adds r0, r7, 0
	bl FreeSpriteOamMatrix
	strh r6, [r7, 0x2E]
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _080A1868 @ =sub_80A1888
	str r0, [r4]
	adds r0, r6, 0
	bl IsPokeSpriteNotFlipped
	lsls r0, 24
	cmp r0, 0
	bne _080A186C
	adds r0, r7, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	b _080A187A
	.align 2, 0
_080A1860: .4byte gUnknown_02024E8C
_080A1864: .4byte gSprites
_080A1868: .4byte sub_80A1888
_080A186C:
	adds r2, r7, 0
	adds r2, 0x3F
	ldrb r1, [r2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080A187A:
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80A1808

	thumb_func_start sub_80A1888
sub_80A1888: @ 80A1888
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080A18B8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080A18B0
	ldr r0, _080A18BC @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
	ldr r0, _080A18C0 @ =gSharedMem + 0x18010
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _080A18B0
	ldrh r0, [r4, 0x2E]
	movs r1, 0
	bl PlayCry1
_080A18B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A18B8: .4byte gPaletteFade
_080A18BC: .4byte SpriteCallbackDummy
_080A18C0: .4byte gSharedMem + 0x18010
	thumb_func_end sub_80A1888

	thumb_func_start sub_80A18C4
sub_80A18C4: @ 80A18C4
	push {lr}
	movs r1, 0
	ldr r3, _080A18E0 @ =gSharedMem + 0x1A000
	movs r2, 0xFF
_080A18CC:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1D
	bls _080A18CC
	pop {r0}
	bx r0
	.align 2, 0
_080A18E0: .4byte gSharedMem + 0x1A000
	thumb_func_end sub_80A18C4

	thumb_func_start sub_80A18E4
sub_80A18E4: @ 80A18E4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080A1910 @ =gSharedMem + 0x1A000
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080A1908
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080A1914 @ =gSprites
	adds r0, r1
	bl DestroySprite
	movs r0, 0xFF
	strb r0, [r4]
_080A1908:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1910: .4byte gSharedMem + 0x1A000
_080A1914: .4byte gSprites
	thumb_func_end sub_80A18E4

	thumb_func_start sub_80A1918
sub_80A1918: @ 80A1918
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080A1948 @ =gSprites
	ldr r2, _080A194C @ =gSharedMem + 0x1A000
	adds r0, r2
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	adds r2, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_080A1948: .4byte gSprites
_080A194C: .4byte gSharedMem + 0x1A000
	thumb_func_end sub_80A1918

	thumb_func_start sub_80A1950
sub_80A1950: @ 80A1950
	push {r4,r5,lr}
	movs r5, 0
_080A1954:
	ldr r0, _080A1984 @ =gSharedMem + 0x1A000
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _080A196C
	ldr r0, _080A1988 @ =gSpriteTemplate_83C11C0
	movs r1, 0
	movs r2, 0
	movs r3, 0x2
	bl CreateSprite
	strb r0, [r4]
_080A196C:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80A1918
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _080A1954
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1984: .4byte gSharedMem + 0x1A000
_080A1988: .4byte gSpriteTemplate_83C11C0
	thumb_func_end sub_80A1950

	thumb_func_start sub_80A198C
sub_80A198C: @ 80A198C
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	mov r10, r3
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r10
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r1, _080A1A24 @ =gSharedMem + 0x1A000
	mov r8, r1
	add r8, r10
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080A1A28 @ =gSprites
	mov r9, r1
	add r0, r9
	adds r1, r4, 0
	bl StartSpriteAnim
	mov r1, r8
	ldrb r0, [r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r9
	ldr r0, _080A1A2C @ =gUnknown_083C11D8
	adds r4, r0
	ldrb r2, [r4]
	lsls r2, 4
	ldrb r3, [r1, 0x5]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	adds r5, 0x10
	strh r5, [r0, 0x20]
	mov r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	adds r6, 0x8
	strh r6, [r0, 0x22]
	mov r0, r10
	movs r1, 0
	bl sub_80A1918
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1A24: .4byte gSharedMem + 0x1A000
_080A1A28: .4byte gSprites
_080A1A2C: .4byte gUnknown_083C11D8
	thumb_func_end sub_80A198C

	thumb_func_start sub_80A1A30
sub_80A1A30: @ 80A1A30
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	mov r9, r0
	ldr r1, _080A1A98 @ =gSharedMem + 0x18000
	ldrb r0, [r1, 0xB]
	cmp r0, 0x1
	bls _080A1B0A
	cmp r4, 0x9
	bne _080A1A52
	movs r3, 0x1
	mov r9, r3
_080A1A52:
	movs r5, 0
	movs r0, 0x80
	lsls r0, 6
	adds r0, r1
	mov r8, r0
	ldr r6, _080A1A9C @ =gSprites
	mov r10, r5
_080A1A60:
	lsls r1, r5, 20
	movs r3, 0xB0
	lsls r3, 15
	adds r1, r3
	asrs r1, 16
	ldr r0, _080A1AA0 @ =gSpriteTemplate_83C1280
	movs r2, 0x28
	mov r3, r9
	bl CreateSprite
	adds r1, r4, r5
	mov r3, r8
	adds r2, r1, r3
	strb r0, [r2]
	adds r7, r1, 0
	cmp r5, 0
	bne _080A1AA4
	adds r0, r4, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x4
	bl StartSpriteAnim
	b _080A1AD0
	.align 2, 0
_080A1A98: .4byte gSharedMem + 0x18000
_080A1A9C: .4byte gSprites
_080A1AA0: .4byte gSpriteTemplate_83C1280
_080A1AA4:
	cmp r5, 0x9
	bne _080A1AC0
	adds r0, r4, 0
	adds r0, 0x9
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x5
	bl StartSpriteAnim
	b _080A1AD0
_080A1AC0:
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x6
	bl StartSpriteAnim
_080A1AD0:
	mov r0, r8
	adds r2, r7, r0
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080A1B18 @ =sub_80A1BC0
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r4, [r0, 0x2E]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r10
	strh r1, [r0, 0x30]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x9
	bls _080A1A60
_080A1B0A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1B18: .4byte sub_80A1BC0
	thumb_func_end sub_80A1A30

	thumb_func_start sub_80A1B1C
sub_80A1B1C: @ 80A1B1C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
_080A1B24:
	adds r0, r5, r4
	lsls r0, 24
	lsrs r0, 24
	bl sub_80A18E4
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x9
	bls _080A1B24
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80A1B1C

	thumb_func_start sub_80A1B40
sub_80A1B40: @ 80A1B40
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, r7, 1
	adds r1, r7
	lsls r1, 24
	ldr r0, _080A1BB4 @ =gSharedMem + 0x1A009
	ldrb r2, [r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r2, _080A1BB8 @ =gSprites
	adds r0, r2
	lsrs r7, r1, 24
	movs r2, 0x80
	lsls r2, 19
	adds r1, r2
	lsrs r1, 24
	bl StartSpriteAnim
	movs r4, 0
	adds r0, r7, 0x6
	lsls r0, 24
	mov r8, r0
_080A1B74:
	ldr r6, _080A1BBC @ =gSharedMem + 0x1A00A
	adds r0, r4, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _080A1BB8 @ =gSprites
	adds r0, r5
	mov r2, r8
	lsrs r1, r2, 24
	bl StartSpriteAnim
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _080A1B74
	ldrb r1, [r6, 0x8]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r1, r7, 0x5
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1BB4: .4byte gSharedMem + 0x1A009
_080A1BB8: .4byte gSprites
_080A1BBC: .4byte gSharedMem + 0x1A00A
	thumb_func_end sub_80A1B40

	thumb_func_start sub_80A1BC0
sub_80A1BC0: @ 80A1BC0
	push {lr}
	adds r2, r0, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	subs r0, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _080A1BF8
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	strh r0, [r2, 0x30]
	cmp r0, 0x18
	ble _080A1BEC
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	b _080A1C06
_080A1BEC:
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	b _080A1C04
_080A1BF8:
	movs r0, 0
	strh r0, [r2, 0x30]
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	subs r0, 0x5
_080A1C04:
	ands r0, r1
_080A1C06:
	strb r0, [r3]
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x9
	bne _080A1C1C
	ldr r0, _080A1C18 @ =gSharedMem + 0x18000
	adds r0, 0x79
	b _080A1C20
	.align 2, 0
_080A1C18: .4byte gSharedMem + 0x18000
_080A1C1C:
	ldr r0, _080A1C2C @ =gSharedMem + 0x18000
	adds r0, 0x7A
_080A1C20:
	ldrb r0, [r0]
	lsls r0, 4
	strh r0, [r2, 0x26]
	pop {r0}
	bx r0
	.align 2, 0
_080A1C2C: .4byte gSharedMem + 0x18000
	thumb_func_end sub_80A1BC0

	thumb_func_start sub_80A1C30
sub_80A1C30: @ 80A1C30
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 25
	lsrs r3, r0, 24
	adds r4, r3, 0
	adds r0, r3, 0
	adds r0, 0xA
	cmp r3, r0
	bge _080A1C82
	ldr r5, _080A1C88 @ =gSprites
	movs r7, 0x5
	negs r7, r7
	ldr r6, _080A1C8C @ =gSharedMem + 0x1A009
_080A1C50:
	adds r2, r3, r6
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0
	strh r1, [r0, 0x30]
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r7, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r4, 0
	adds r0, 0xA
	cmp r3, r0
	blt _080A1C50
_080A1C82:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1C88: .4byte gSprites
_080A1C8C: .4byte gSharedMem + 0x1A009
	thumb_func_end sub_80A1C30

	thumb_func_start pokemon_ailments_get_primary
pokemon_ailments_get_primary: @ 80A1C90
	push {lr}
	adds r1, r0, 0
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	beq _080A1CA0
	movs r0, 0x1
	b _080A1CD2
_080A1CA0:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080A1CAC
	movs r0, 0x2
	b _080A1CD2
_080A1CAC:
	movs r0, 0x7
	ands r0, r1
	cmp r0, 0
	beq _080A1CB8
	movs r0, 0x3
	b _080A1CD2
_080A1CB8:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080A1CC4
	movs r0, 0x4
	b _080A1CD2
_080A1CC4:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080A1CD0
	movs r0, 0
	b _080A1CD2
_080A1CD0:
	movs r0, 0x5
_080A1CD2:
	pop {r1}
	bx r1
	thumb_func_end pokemon_ailments_get_primary

	thumb_func_start GetMonStatusAndPokerus
GetMonStatusAndPokerus: @ 80A1CD8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _080A1CEA
	movs r0, 0x7
	b _080A1D12
_080A1CEA:
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	bl pokemon_ailments_get_primary
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080A1D12
	adds r0, r4, 0
	movs r1, 0
	bl CheckPartyPokerus
	lsls r0, 24
	cmp r0, 0
	bne _080A1D10
	movs r0, 0
	b _080A1D12
_080A1D10:
	movs r0, 0x6
_080A1D12:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetMonStatusAndPokerus

	thumb_func_start sub_80A1D18
sub_80A1D18: @ 80A1D18
	push {r4,r5,lr}
	sub sp, 0x64
	mov r0, sp
	bl sub_809F678
	mov r0, sp
	bl GetMonStatusAndPokerus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080A1D58
	subs r0, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080A1D50 @ =gSharedMem + 0x1A01D
	ldrb r0, [r4]
	cmp r0, 0xFF
	bne _080A1D60
	ldr r0, _080A1D54 @ =gSpriteTemplate_83C1304
	movs r1, 0x40
	movs r2, 0x98
	movs r3, 0
	bl CreateSprite
	strb r0, [r4]
	b _080A1D60
	.align 2, 0
_080A1D50: .4byte gSharedMem + 0x1A01D
_080A1D54: .4byte gSpriteTemplate_83C1304
_080A1D58:
	movs r0, 0x1D
	bl sub_80A18E4
	b _080A1D74
_080A1D60:
	ldr r0, _080A1D7C @ =gSharedMem + 0x1A01D
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080A1D80 @ =gSprites
	adds r0, r1
	adds r1, r5, 0
	bl StartSpriteAnim
_080A1D74:
	add sp, 0x64
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1D7C: .4byte gSharedMem + 0x1A01D
_080A1D80: .4byte gSprites
	thumb_func_end sub_80A1D18

	thumb_func_start sub_80A1D84
sub_80A1D84: @ 80A1D84
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r1, _080A1DC0 @ =0x00007533
	ldr r2, _080A1DC4 @ =gSummaryScreenMonMarkingsPalette
	adds r0, r1, 0
	bl sub_80F7920
	adds r4, r0, 0
	ldr r6, _080A1DC8 @ =gUnknown_020384F4
	str r4, [r6]
	cmp r4, 0
	beq _080A1DBA
	adds r0, r5, 0
	movs r1, 0x8
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r1, [r6]
	movs r0, 0x3C
	strh r0, [r1, 0x20]
	movs r0, 0x1A
	strh r0, [r1, 0x22]
_080A1DBA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1DC0: .4byte 0x00007533
_080A1DC4: .4byte gSummaryScreenMonMarkingsPalette
_080A1DC8: .4byte gUnknown_020384F4
	thumb_func_end sub_80A1D84

	thumb_func_start sub_80A1DCC
sub_80A1DCC: @ 80A1DCC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080A1DE4 @ =gUnknown_020384F4
	ldr r0, [r0]
	bl DestroySprite
	adds r0, r4, 0
	bl sub_80A1D84
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1DE4: .4byte gUnknown_020384F4
	thumb_func_end sub_80A1DCC

	thumb_func_start sub_80A1DE8
sub_80A1DE8: @ 80A1DE8
	push {r4,lr}
	movs r1, 0x26
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl ball_number_to_ball_processing_index
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80478DC
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 3
	ldr r1, _080A1E48 @ =gBallSpriteTemplates
	adds r0, r1
	movs r1, 0x6
	movs r2, 0x88
	movs r3, 0
	bl CreateSprite
	ldr r2, _080A1E4C @ =gSharedMem + 0x18000
	strb r0, [r2, 0xD]
	ldr r3, _080A1E50 @ =gSprites
	ldrb r1, [r2, 0xD]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080A1E54 @ =SpriteCallbackDummy
	str r1, [r0]
	ldrb r1, [r2, 0xD]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1E48: .4byte gBallSpriteTemplates
_080A1E4C: .4byte gSharedMem + 0x18000
_080A1E50: .4byte gSprites
_080A1E54: .4byte SpriteCallbackDummy
	thumb_func_end sub_80A1DE8

	thumb_func_start sub_80A1E58
sub_80A1E58: @ 80A1E58
	push {r4,lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0xFF
	beq _080A1E92
	ldr r3, _080A1E6C @ =gUnknown_083C15BC
	ldrb r0, [r3]
	adds r4, r2, 0x5
	b _080A1E74
	.align 2, 0
_080A1E6C: .4byte gUnknown_083C15BC
_080A1E70:
	adds r3, 0x4
	ldrb r0, [r3]
_080A1E74:
	cmp r0, 0xFF
	beq _080A1E7C
	cmp r0, r1
	bne _080A1E70
_080A1E7C:
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x4
	strb r0, [r2, 0x1]
	ldrb r0, [r3, 0x1]
	strb r0, [r2, 0x2]
	ldrb r0, [r3, 0x2]
	strb r0, [r2, 0x3]
	ldrb r0, [r3, 0x3]
	strb r0, [r2, 0x4]
	adds r2, r4, 0
_080A1E92:
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80A1E58

	thumb_func_start sub_80A1E9C
sub_80A1E9C: @ 80A1E9C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	adds r5, r1, 0
	lsls r4, r2, 24
	lsrs r4, 24
	mov r1, sp
	adds r1, 0x1
	mov r2, sp
	adds r2, 0x2
	mov r0, sp
	bl sub_8072CD4
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_80A1E58
	adds r6, r0, 0
	adds r1, r5, 0
	bl StringCopy
	adds r6, r0, 0
	cmp r4, 0xFF
	beq _080A1EEC
	movs r0, 0xFC
	strb r0, [r6]
	movs r0, 0x4
	strb r0, [r6, 0x1]
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r6, 0x2]
	mov r0, sp
	ldrb r0, [r0, 0x1]
	strb r0, [r6, 0x3]
	mov r0, sp
	ldrb r0, [r0, 0x2]
	strb r0, [r6, 0x4]
	movs r0, 0xFF
	strb r0, [r6, 0x5]
	adds r6, 0x5
_080A1EEC:
	adds r0, r6, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80A1E9C

	thumb_func_start sub_80A1EF8
sub_80A1EF8: @ 80A1EF8
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r9, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r3, [sp, 0x1C]
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _080A1F44 @ =gStringVar4
	mov r8, r0
	mov r1, r9
	adds r2, r4, 0
	str r3, [sp]
	bl sub_80A1E9C
	ldr r3, [sp]
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	adds r1, r5, 0
	adds r2, r6, 0
	bl MenuPrint_PixelCoords
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F44: .4byte gStringVar4
	thumb_func_end sub_80A1EF8

	thumb_func_start sub_80A1F48
sub_80A1F48: @ 80A1F48
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r9, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r3, [sp, 0x1C]
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r3, 16
	lsrs r3, 16
	ldr r0, _080A1F94 @ =gStringVar4
	mov r8, r0
	mov r1, r9
	adds r2, r4, 0
	str r3, [sp]
	bl sub_80A1E9C
	mov r0, r8
	adds r1, r5, 0
	adds r2, r6, 0
	ldr r3, [sp]
	bl sub_8072BD8
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1F94: .4byte gStringVar4
	thumb_func_end sub_80A1F48

	thumb_func_start sub_80A1F98
sub_80A1F98: @ 80A1F98
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	mov r8, r1
	adds r4, r2, 0
	adds r2, r3, 0
	ldr r5, [sp, 0x24]
	ldr r6, [sp, 0x28]
	ldr r7, [sp, 0x2C]
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _080A1FF4 @ =gStringVar1
	mov r9, r0
	mov r1, r10
	adds r3, r4, 0
	bl ConvertIntToDecimalStringN
	str r7, [sp]
	mov r0, r9
	mov r1, r8
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_80A1EF8
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1FF4: .4byte gStringVar1
	thumb_func_end sub_80A1F98

	thumb_func_start sub_80A1FF8
sub_80A1FF8: @ 80A1FF8
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	mov r9, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _080A2038 @ =gStringVar4
	mov r8, r0
	mov r1, r9
	adds r2, r4, 0
	bl sub_80A1E9C
	mov r0, r8
	adds r1, r5, 0
	adds r2, r6, 0
	bl MenuPrint
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A2038: .4byte gStringVar4
	thumb_func_end sub_80A1FF8

	thumb_func_start PokemonSummaryScreen_CopyPokemonLevel
PokemonSummaryScreen_CopyPokemonLevel: @ 80A203C
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x34
	strb r0, [r4]
	adds r4, 0x1
	cmp r1, 0
	bne _080A2052
	movs r1, 0x5
_080A2052:
	mov r0, sp
	bl ConvertIntToDecimalString
	adds r0, r4, 0
	mov r1, sp
	movs r2, 0xE
	bl sub_80A1E9C
	adds r4, r0, 0
	ldr r1, _080A2074 @ =gOtherText_Comma
	bl StringCopy
	adds r4, r0, 0
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A2074: .4byte gOtherText_Comma
	thumb_func_end PokemonSummaryScreen_CopyPokemonLevel

	thumb_func_start sub_80A2078
sub_80A2078: @ 80A2078
	push {lr}
	ldr r3, _080A209C @ =gUnknown_03005CF0
	ldr r2, _080A20A0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, [r1]
	str r2, [r3]
	ldr r2, _080A20A4 @ =sub_80A20A8
	str r2, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_080A209C: .4byte gUnknown_03005CF0
_080A20A0: .4byte gTasks
_080A20A4: .4byte sub_80A20A8
	thumb_func_end sub_80A2078

	thumb_func_start sub_80A20A8
sub_80A20A8: @ 80A20A8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8055870
	cmp r0, 0x1
	beq _080A20C6
	ldr r1, _080A20CC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080A20D0 @ =gUnknown_03005CF0
	ldr r1, [r1]
	str r1, [r0]
_080A20C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A20CC: .4byte gTasks
_080A20D0: .4byte gUnknown_03005CF0
	thumb_func_end sub_80A20A8

	.align 2, 0 @ Don't pad with nop.
