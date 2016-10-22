	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_8083D4C
sub_8083D4C: @ 8083D4C
	push {lr}
	ldr r0, _08083D60
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08083D64
	movs r0, 0
	b _08083D6A
	.align 2, 0
_08083D60: .4byte gMain
_08083D64:
	bl sub_8071C20
	movs r0, 0x1
_08083D6A:
	pop {r1}
	bx r1
	thumb_func_end sub_8083D4C

	thumb_func_start MoriDebugMenu_SearchChild
MoriDebugMenu_SearchChild: @ 8083D70
	push {r4-r6,lr}
	sub sp, 0x34
	ldr r0, _08083DE4
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl sub_8041870
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	movs r6, 0xB
	adds r1, r4, 0
	muls r1, r6
	ldr r4, _08083DE8
	adds r1, r4
	mov r0, sp
	bl StringCopy
	ldr r1, _08083DEC
	mov r0, sp
	bl StringAppend
	adds r1, r5, 0
	muls r1, r6
	adds r1, r4
	mov r0, sp
	bl StringAppend
	ldr r1, _08083DF0
	mov r0, sp
	bl StringAppend
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1E
	movs r3, 0x13
	bl MenuDrawTextWindow
	mov r0, sp
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08083DF4
	ldr r0, _08083DF8
	str r0, [r1]
	movs r0, 0
	add sp, 0x34
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08083DE4: .4byte gPlayerParty
_08083DE8: .4byte gSpeciesNames
_08083DEC: .4byte gUnknown_0839B24D
_08083DF0: .4byte gUnknown_0839B255
_08083DF4: .4byte gCallback_03004AE8
_08083DF8: .4byte sub_8083D4C
	thumb_func_end MoriDebugMenu_SearchChild

	thumb_func_start MoriDebugMenu_Egg
MoriDebugMenu_Egg: @ 8083DFC
	push {lr}
	ldr r0, _08083E24
	bl daycare_count_pokemon
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08083E1A
	bl daycare_relationship_score_from_savegame
	lsls r0, 24
	cmp r0, 0
	beq _08083E1A
	bl sub_8041940
_08083E1A:
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08083E24: .4byte gSaveBlock1 + 0x2F9C
	thumb_func_end MoriDebugMenu_Egg

	thumb_func_start MoriDebugMenu_MaleEgg
MoriDebugMenu_MaleEgg: @ 8083E28
	push {lr}
	ldr r0, _08083E50
	bl daycare_count_pokemon
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08083E46
	bl daycare_relationship_score_from_savegame
	lsls r0, 24
	cmp r0, 0
	beq _08083E46
	bl sub_8041950
_08083E46:
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08083E50: .4byte gSaveBlock1 + 0x2F9C
	thumb_func_end MoriDebugMenu_MaleEgg

	thumb_func_start MoriDebugMenu_1000Steps
MoriDebugMenu_1000Steps: @ 8083E54
	push {lr}
	movs r0, 0xFA
	lsls r0, 2
	bl sub_8041790
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end MoriDebugMenu_1000Steps

	thumb_func_start MoriDebugMenu_10000Steps
MoriDebugMenu_10000Steps: @ 8083E68
	push {lr}
	ldr r0, _08083E7C
	bl sub_8041790
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08083E7C: .4byte 0x00002710
	thumb_func_end MoriDebugMenu_10000Steps

	thumb_func_start MoriDebugMenu_MoveTutor
MoriDebugMenu_MoveTutor: @ 8083E80
	push {lr}
	bl sub_8132670
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end MoriDebugMenu_MoveTutor

	thumb_func_start MoriDebugMenu_BreedEgg
MoriDebugMenu_BreedEgg: @ 8083E90
	push {r4-r6,lr}
	sub sp, 0x4
	movs r5, 0
	movs r6, 0
_08083E98:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08083EE0
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _08083EBC
	mov r0, sp
	strb r6, [r0]
	adds r0, r4, 0
	movs r1, 0x20
	mov r2, sp
	bl SetMonData
_08083EBC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08083E98
	ldr r0, _08083EE4
	ldr r1, _08083EE8
	adds r0, r1
	movs r1, 0xFD
	strb r1, [r0]
	bl sub_8071C20
	movs r0, 0x1
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08083EE0: .4byte gPlayerParty
_08083EE4: .4byte gSaveBlock1
_08083EE8: .4byte 0x000030b6
	thumb_func_end MoriDebugMenu_BreedEgg

	thumb_func_start MoriDebugMenu_LongName
MoriDebugMenu_LongName: @ 8083EEC
	push {lr}
	ldr r0, _08083F04
	ldr r2, _08083F08
	movs r1, 0x2
	bl SetMonData
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08083F04: .4byte gPlayerParty
_08083F08: .4byte gUnknown_0839B257
	thumb_func_end MoriDebugMenu_LongName

	thumb_func_start MoriDebugMenu_PokeblockCase
MoriDebugMenu_PokeblockCase: @ 8083F0C
	push {r4,lr}
	movs r4, 0
_08083F10:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_810CA6C
	adds r4, 0x1
	cmp r4, 0x27
	ble _08083F10
	bl sub_8071C20
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MoriDebugMenu_PokeblockCase

	thumb_func_start MoriDebugMenuProcessInput
MoriDebugMenuProcessInput: @ 8083F2C
	push {lr}
	bl ProcessMenuInput
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _08083F52
	adds r0, 0x1
	cmp r1, r0
	beq _08083F60
	ldr r2, _08083F58
	ldr r0, _08083F5C
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	str r0, [r2]
_08083F52:
	movs r0, 0
	b _08083F66
	.align 2, 0
_08083F58: .4byte gCallback_03004AE8
_08083F5C: .4byte gMoriDebugMenuActions
_08083F60:
	bl sub_8071C20
	movs r0, 0x1
_08083F66:
	pop {r1}
	bx r1
	thumb_func_end MoriDebugMenuProcessInput

	thumb_func_start InitMoriDebugMenu
InitMoriDebugMenu: @ 8083F6C
	push {lr}
	sub sp, 0x8
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r3, _08083FB0
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x9
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x9
	bl InitMenu
	ldr r1, _08083FB4
	ldr r0, _08083FB8
	str r0, [r1]
	movs r0, 0
	add sp, 0x8
	pop {r1}
	bx r1
	.align 2, 0
_08083FB0: .4byte gMoriDebugMenuActions
_08083FB4: .4byte gCallback_03004AE8
_08083FB8: .4byte MoriDebugMenuProcessInput
	thumb_func_end InitMoriDebugMenu

	.align 2, 0 @ Don't pad with nop.
