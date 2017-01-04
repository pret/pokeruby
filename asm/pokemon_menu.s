	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8089A70
sub_8089A70: @ 8089A70
	push {lr}
	ldr r0, _08089A88 @ =gPaletteFade
	ldrb r1, [r0, 0x8]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0, 0x8]
	movs r0, 0
	movs r1, 0
	bl OpenPartyMenu
	pop {r0}
	bx r0
	.align 2, 0
_08089A88: .4byte gPaletteFade
	thumb_func_end sub_8089A70

	thumb_func_start sub_8089A8C
sub_8089A8C: @ 8089A8C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r5, _08089AD0 @ =gUnknown_0202FFA9
	movs r0, 0
	strb r0, [r5]
	ldr r0, _08089AD4 @ =gUnknown_03005CE0
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08089AD8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _08089AE0
	ldr r4, _08089ADC @ =gUnknown_0202FFAA
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl AppendToList
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl AppendToList
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl AppendToList
	b _08089BC8
	.align 2, 0
_08089AD0: .4byte gUnknown_0202FFA9
_08089AD4: .4byte gUnknown_03005CE0
_08089AD8: .4byte gPlayerParty
_08089ADC: .4byte gUnknown_0202FFAA
_08089AE0:
	movs r6, 0
	ldr r0, _08089B24 @ =gUnknown_0839F554
	ldrh r0, [r0]
	mov r8, r0
_08089AE8:
	movs r4, 0
	adds r7, r6, 0x1
	mov r0, r8
	cmp r0, 0xFF
	beq _08089B48
	ldr r5, _08089B24 @ =gUnknown_0839F554
_08089AF4:
	ldr r0, _08089B28 @ =gUnknown_03005CE0
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08089B2C @ =gPlayerParty
	adds r0, r1
	adds r1, r6, 0
	adds r1, 0xD
	bl GetMonData
	lsls r1, r4, 1
	adds r1, r5
	ldrh r1, [r1]
	cmp r0, r1
	bne _08089B38
	adds r2, r4, 0
	adds r2, 0xA
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _08089B30 @ =gUnknown_0202FFAA
	ldr r1, _08089B34 @ =gUnknown_0202FFA9
	bl AppendToList
	b _08089B48
	.align 2, 0
_08089B24: .4byte gUnknown_0839F554
_08089B28: .4byte gUnknown_03005CE0
_08089B2C: .4byte gPlayerParty
_08089B30: .4byte gUnknown_0202FFAA
_08089B34: .4byte gUnknown_0202FFA9
_08089B38:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r4, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, 0xFF
	bne _08089AF4
_08089B48:
	lsls r0, r7, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _08089AE8
	ldr r4, _08089BA4 @ =gUnknown_0202FFAA
	ldr r5, _08089BA8 @ =gUnknown_0202FFA9
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl AppendToList
	ldr r6, _08089BAC @ =gPlayerParty + 1 * 0x64
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08089B76
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl AppendToList
_08089B76:
	ldr r0, _08089BB0 @ =gUnknown_03005CE0
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	adds r1, r6, 0
	subs r1, 0x64
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _08089BB4
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x7
	bl AppendToList
	b _08089BBE
	.align 2, 0
_08089BA4: .4byte gUnknown_0202FFAA
_08089BA8: .4byte gUnknown_0202FFA9
_08089BAC: .4byte gPlayerParty + 1 * 0x64
_08089BB0: .4byte gUnknown_03005CE0
_08089BB4:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl AppendToList
_08089BBE:
	ldr r0, _08089BD4 @ =gUnknown_0202FFAA
	ldr r1, _08089BD8 @ =gUnknown_0202FFA9
	movs r2, 0x3
	bl AppendToList
_08089BC8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089BD4: .4byte gUnknown_0202FFAA
_08089BD8: .4byte gUnknown_0202FFA9
	thumb_func_end sub_8089A8C

	thumb_func_start sub_8089BDC
sub_8089BDC: @ 8089BDC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	mov r8, r3
	ldr r7, [sp, 0x20]
	ldr r1, [sp, 0x24]
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	lsls r4, 24
	lsrs r4, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0x5
	bl sub_806D538
	adds r4, r5, r4
	lsls r4, 24
	lsrs r4, 24
	mov r0, r8
	lsls r3, r0, 1
	adds r3, r6, r3
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl MenuDrawTextWindow
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	adds r6, 0x1
	lsls r6, 24
	lsrs r6, 24
	str r7, [sp]
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, r8
	ldr r3, [sp, 0x1C]
	bl PrintMenuItemsReordered
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8089BDC

	thumb_func_start sub_8089C50
sub_8089C50: @ 8089C50
	push {r4,r5,lr}
	sub sp, 0xC
	ldr r4, [sp, 0x18]
	ldr r5, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r4, 0x1
	str r4, [sp, 0x8]
	bl sub_8089BDC
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8089C50

	thumb_func_start sub_8089C7C
sub_8089C7C: @ 8089C7C
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _08089CC8 @ =gUnknown_0202FFA9
	ldrb r0, [r6]
	lsls r0, 1
	movs r4, 0x12
	subs r4, r0
	lsls r4, 24
	lsrs r4, 24
	ldrb r3, [r6]
	ldr r0, _08089CCC @ =gPokemonMenuActions
	str r0, [sp]
	ldr r0, _08089CD0 @ =gUnknown_0202FFAA
	str r0, [sp, 0x4]
	movs r0, 0x3
	str r0, [sp, 0x8]
	movs r0, 0x13
	adds r1, r4, 0
	movs r2, 0xA
	bl sub_8089BDC
	movs r2, 0x1
	orrs r2, r4
	ldrb r3, [r6]
	str r5, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x14
	bl InitMenu
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08089CC8: .4byte gUnknown_0202FFA9
_08089CCC: .4byte gPokemonMenuActions
_08089CD0: .4byte gUnknown_0202FFAA
	thumb_func_end sub_8089C7C

	thumb_func_start sub_8089CD4
sub_8089CD4: @ 8089CD4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08089D00 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08089D84
	adds r0, r4, 0
	bl sub_806BD80
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _08089D04
	cmp r0, 0x2
	beq _08089D60
	b _08089D84
	.align 2, 0
_08089D00: .4byte gPaletteFade
_08089D04:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _08089D48 @ =gUnknown_03005CE0
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08089D4C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08089D50 @ =gStringVar1
	bl GetMonNickname
	bl sub_8089A8C
	ldr r0, _08089D54 @ =gUnknown_0202FFA8
	strb r5, [r0]
	movs r0, 0
	bl sub_8089C7C
	ldr r1, _08089D58 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08089D5C @ =sub_8089D94
	str r1, [r0]
	adds r0, r4, 0
	bl sub_808B5B4
	b _08089D84
	.align 2, 0
_08089D48: .4byte gUnknown_03005CE0
_08089D4C: .4byte gPlayerParty
_08089D50: .4byte gStringVar1
_08089D54: .4byte gUnknown_0202FFA8
_08089D58: .4byte gTasks
_08089D5C: .4byte sub_8089D94
_08089D60:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08089D8C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08089D90 @ =sub_8089E4C
	str r1, [r0]
_08089D84:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089D8C: .4byte gTasks
_08089D90: .4byte sub_8089E4C
	thumb_func_end sub_8089CD4

	thumb_func_start sub_8089D94
sub_8089D94: @ 8089D94
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r0, _08089DC8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08089E44
	ldr r2, _08089DCC @ =gMain
	ldrh r0, [r2, 0x30]
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0x40
	bne _08089DD4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	ldr r1, _08089DD0 @ =gUnknown_0202FFA8
	strb r0, [r1]
	b _08089E1A
	.align 2, 0
_08089DC8: .4byte gPaletteFade
_08089DCC: .4byte gMain
_08089DD0: .4byte gUnknown_0202FFA8
_08089DD4:
	cmp r1, 0x80
	bne _08089DF0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	ldr r1, _08089DEC @ =gUnknown_0202FFA8
	strb r0, [r1]
	b _08089E1A
	.align 2, 0
_08089DEC: .4byte gUnknown_0202FFA8
_08089DF0:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08089E30
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08089E24 @ =gPokemonMenuActions
	ldr r2, _08089E28 @ =gUnknown_0202FFAA
	ldr r0, _08089E2C @ =gUnknown_0202FFA8
	ldrb r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
_08089E1A:
	adds r0, r4, 0
	bl sub_808B5B4
	b _08089E44
	.align 2, 0
_08089E24: .4byte gPokemonMenuActions
_08089E28: .4byte gUnknown_0202FFAA
_08089E2C: .4byte gUnknown_0202FFA8
_08089E30:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08089E44
	adds r0, r5, 0
	bl PokemonMenu_Cancel
	adds r0, r5, 0
	bl sub_808B5B4
_08089E44:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8089D94

	thumb_func_start sub_8089E4C
sub_8089E4C: @ 8089E4C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08089E78 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08089E72
	ldr r0, _08089E7C @ =gUnknown_03005CE0
	strb r1, [r0]
	ldr r0, _08089E80 @ =sub_805469C
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08089E72:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089E78: .4byte gPaletteFade
_08089E7C: .4byte gUnknown_03005CE0
_08089E80: .4byte sub_805469C
	thumb_func_end sub_8089E4C

	thumb_func_start sub_8089E84
sub_8089E84: @ 8089E84
	push {lr}
	ldr r0, _08089EAC @ =gUnknown_03005CE0
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08089EB0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08089EB4 @ =gStringVar1
	bl GetMonNickname
	bl sub_8089A8C
	ldr r1, _08089EB8 @ =gUnknown_0202FFA8
	movs r0, 0
	strb r0, [r1]
	movs r0, 0
	bl sub_8089C7C
	pop {r0}
	bx r0
	.align 2, 0
_08089EAC: .4byte gUnknown_03005CE0
_08089EB0: .4byte gPlayerParty
_08089EB4: .4byte gStringVar1
_08089EB8: .4byte gUnknown_0202FFA8
	thumb_func_end sub_8089E84

	thumb_func_start sub_8089EBC
sub_8089EBC: @ 8089EBC
	push {r4,r5,lr}
	ldr r4, _08089EC4 @ =0x0201b260
	ldr r5, _08089EC8 @ =gUnknown_020384F0
	b _08089ED8
	.align 2, 0
_08089EC4: .4byte 0x0201b260
_08089EC8: .4byte gUnknown_020384F0
_08089ECC:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08089F04
_08089ED8:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08089ECC
	ldrb r0, [r4]
	ldrb r1, [r5]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r1, _08089F0C @ =gUnknown_03005CE0
	ldrb r0, [r5]
	strb r0, [r1]
	bl sub_8089E84
	ldr r0, _08089F10 @ =sub_806AEDC
	bl SetMainCallback2
_08089F04:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089F0C: .4byte gUnknown_03005CE0
_08089F10: .4byte sub_806AEDC
	thumb_func_end sub_8089EBC

	thumb_func_start sub_8089F14
sub_8089F14: @ 8089F14
	push {lr}
	ldr r2, _08089F38 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r2, _08089F3C @ =sub_8089D94
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0x5
	bl sub_806AF4C
	ldr r0, _08089F40 @ =sub_8089EBC
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08089F38: .4byte gPaletteFade
_08089F3C: .4byte sub_8089D94
_08089F40: .4byte sub_8089EBC
	thumb_func_end sub_8089F14

	thumb_func_start sub_8089F44
sub_8089F44: @ 8089F44
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _08089FAC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08089FA2
	ldr r2, _08089FB0 @ =gSprites
	ldr r1, _08089FB4 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0xE]
	lsls r1, 16
	asrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r4, [r0, 0x2E]
	lsls r4, 24
	lsrs r4, 24
	adds r0, r3, 0
	bl DestroyTask
	ldr r0, _08089FB8 @ =0x0201b000
	ldr r1, _08089FBC @ =0x00000262
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _08089FC0 @ =gPlayerParty
	ldr r1, _08089FC4 @ =gPlayerPartyCount
	ldrb r2, [r1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08089FC8 @ =sub_8089F14
	str r5, [sp]
	adds r1, r4, 0
	bl ShowPokemonSummaryScreen
_08089FA2:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089FAC: .4byte gPaletteFade
_08089FB0: .4byte gSprites
_08089FB4: .4byte gTasks
_08089FB8: .4byte 0x0201b000
_08089FBC: .4byte 0x00000262
_08089FC0: .4byte gPlayerParty
_08089FC4: .4byte gPlayerPartyCount
_08089FC8: .4byte sub_8089F14
	thumb_func_end sub_8089F44

	thumb_func_start PokemonMenu_Summary
PokemonMenu_Summary: @ 8089FCC
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _08089FFC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A000 @ =sub_8089F44
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089FFC: .4byte gTasks
_0808A000: .4byte sub_8089F44
	thumb_func_end PokemonMenu_Summary

	thumb_func_start sub_808A004
sub_808A004: @ 808A004
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0808A024 @ =sub_806CA60
	ldr r2, _0808A028 @ =sub_8089CD4
	bl SetTaskFuncWithFollowupFunc
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	.align 2, 0
_0808A024: .4byte sub_806CA60
_0808A028: .4byte sub_8089CD4
	thumb_func_end sub_808A004

	thumb_func_start PokemonMenu_Switch
PokemonMenu_Switch: @ 808A02C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	ldr r0, _0808A054 @ =0x02001000
	ldr r1, _0808A058 @ =sub_806CD5C
	str r1, [r0, 0xC]
	ldr r1, _0808A05C @ =0x0001a272
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0]
	adds r0, r4, 0
	bl sub_808A004
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A054: .4byte 0x02001000
_0808A058: .4byte sub_806CD5C
_0808A05C: .4byte 0x0001a272
	thumb_func_end PokemonMenu_Switch

	thumb_func_start sub_808A060
sub_808A060: @ 808A060
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0808A0D0 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x40
	bne _0808A086
	ldr r4, _0808A0D4 @ =gUnknown_0202FFA8
	ldrb r0, [r4]
	cmp r0, 0
	beq _0808A086
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	strb r0, [r4]
	movs r0, 0x5
	bl PlaySE
_0808A086:
	ldr r0, _0808A0D0 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x80
	bne _0808A0A4
	ldr r4, _0808A0D4 @ =gUnknown_0202FFA8
	ldrb r0, [r4]
	cmp r0, 0x2
	beq _0808A0A4
	movs r0, 0x1
	bl MoveMenuCursor
	strb r0, [r4]
	movs r0, 0x5
	bl PlaySE
_0808A0A4:
	ldr r0, _0808A0D0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0808A0E0
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0808A0D8 @ =gUnknown_0839F578
	ldr r2, _0808A0DC @ =gPokemonMenuActions
	ldr r0, _0808A0D4 @ =gUnknown_0202FFA8
	ldrb r3, [r0]
	movs r0, 0
	bl sub_806E81C
	adds r1, r0, 0
	adds r0, r5, 0
	bl _call_via_r1
	b _0808A0F6
	.align 2, 0
_0808A0D0: .4byte gMain
_0808A0D4: .4byte gUnknown_0202FFA8
_0808A0D8: .4byte gUnknown_0839F578
_0808A0DC: .4byte gPokemonMenuActions
_0808A0E0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0808A0F6
	ldr r1, _0808A0FC @ =gUnknown_0839F578
	movs r0, 0
	bl sub_806E7D0
	adds r0, r5, 0
	bl PokemonMenu_CancelSubmenu
_0808A0F6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A0FC: .4byte gUnknown_0839F578
	thumb_func_end sub_808A060

	thumb_func_start sub_808A100
sub_808A100: @ 808A100
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0808A130 @ =gUnknown_0839F578
	ldr r2, _0808A134 @ =gPokemonMenuActions
	movs r0, 0
	movs r3, 0
	bl sub_806E750
	movs r0, 0xD
	movs r1, 0x2
	bl sub_806D538
	ldr r1, _0808A138 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A13C @ =sub_808A060
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A130: .4byte gUnknown_0839F578
_0808A134: .4byte gPokemonMenuActions
_0808A138: .4byte gTasks
_0808A13C: .4byte sub_808A060
	thumb_func_end sub_808A100

	thumb_func_start PokemonMenu_Item
PokemonMenu_Item: @ 808A140
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	ldr r1, _0808A174 @ =gUnknown_0202FFA8
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _0808A178 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A17C @ =sub_808A100
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A174: .4byte gUnknown_0202FFA8
_0808A178: .4byte gTasks
_0808A17C: .4byte sub_808A100
	thumb_func_end PokemonMenu_Item

	thumb_func_start sub_808A180
sub_808A180: @ 808A180
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0808A1D0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808A1CA
	adds r0, r5, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0808A1D4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x40
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl DestroyTask
	lsls r1, r4, 3
	adds r1, r4
	lsls r1, 2
	ldr r0, _0808A1D8 @ =gSaveBlock1 + 0x2B4C
	adds r1, r0
	ldr r2, _0808A1DC @ =sub_808A520
	movs r0, 0x4
	movs r3, 0x3
	bl sub_80E62A0
_0808A1CA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A1D0: .4byte gPaletteFade
_0808A1D4: .4byte gPlayerParty
_0808A1D8: .4byte gSaveBlock1 + 0x2B4C
_0808A1DC: .4byte sub_808A520
	thumb_func_end sub_808A180

	thumb_func_start sub_808A1E0
sub_808A1E0: @ 808A1E0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808A21C @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808A216
	adds r0, r4, 0
	bl sub_806CA38
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl SetHeldItemIconVisibility
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldr r1, _0808A220 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A224 @ =sub_8089CD4
	str r1, [r0]
_0808A216:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A21C: .4byte gUnknown_0202E8F6
_0808A220: .4byte gTasks
_0808A224: .4byte sub_8089CD4
	thumb_func_end sub_808A1E0

	thumb_func_start sub_808A228
sub_808A228: @ 808A228
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808A268 @ =gScriptItemId
	ldrh r0, [r0]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0808A278
	ldr r0, _0808A26C @ =gUnknown_0202E8F4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0808A278
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0808A270 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A274 @ =sub_808A180
	str r1, [r0]
	b _0808A29A
	.align 2, 0
_0808A268: .4byte gScriptItemId
_0808A26C: .4byte gUnknown_0202E8F4
_0808A270: .4byte gTasks
_0808A274: .4byte sub_808A180
_0808A278:
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldr r0, _0808A2A4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808A2A8 @ =sub_8089CD4
	str r0, [r1]
_0808A29A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A2A4: .4byte gTasks
_0808A2A8: .4byte sub_8089CD4
	thumb_func_end sub_808A228

	thumb_func_start sub_808A2AC
sub_808A2AC: @ 808A2AC
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0808A2D0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808A2CA
	ldr r0, _0808A2D4 @ =gScriptItemId
	ldrh r1, [r0]
	ldr r2, _0808A2D8 @ =sub_808A228
	adds r0, r3, 0
	bl PartyMenuTryGiveMonHeldItem
_0808A2CA:
	pop {r0}
	bx r0
	.align 2, 0
_0808A2D0: .4byte gPaletteFade
_0808A2D4: .4byte gScriptItemId
_0808A2D8: .4byte sub_808A228
	thumb_func_end sub_808A2AC

	thumb_func_start sub_808A2DC
sub_808A2DC: @ 808A2DC
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r5, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0808A324 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x40
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl DestroyTask
	lsls r1, r4, 3
	adds r1, r4
	lsls r1, 2
	ldr r0, _0808A328 @ =gSaveBlock1 + 0x2B4C
	adds r1, r0
	ldr r2, _0808A32C @ =sub_808A520
	movs r0, 0x4
	movs r3, 0x3
	bl sub_80E62A0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A324: .4byte gPlayerParty
_0808A328: .4byte gSaveBlock1 + 0x2B4C
_0808A32C: .4byte sub_808A520
	thumb_func_end sub_808A2DC

	thumb_func_start sub_808A330
sub_808A330: @ 808A330
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0808A344 @ =gScriptItemId
	ldrh r1, [r1]
	ldr r2, _0808A348 @ =sub_808A2DC
	bl PartyMenuTryGiveMonHeldItem
	pop {r0}
	bx r0
	.align 2, 0
_0808A344: .4byte gScriptItemId
_0808A348: .4byte sub_808A2DC
	thumb_func_end sub_808A330

	thumb_func_start sub_808A34C
sub_808A34C: @ 808A34C
	push {lr}
	bl RunTasks
	pop {r0}
	bx r0
	thumb_func_end sub_808A34C

	thumb_func_start sub_808A358
sub_808A358: @ 808A358
	push {r4,lr}
	ldr r4, _0808A360 @ =0x0201b260
	b _0808A370
	.align 2, 0
_0808A360: .4byte 0x0201b260
_0808A364:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808A394
_0808A370:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808A364
	ldrb r0, [r4]
	ldr r1, _0808A39C @ =gUnknown_03005CE0
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808A3A0 @ =sub_806AEDC
	bl SetMainCallback2
_0808A394:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A39C: .4byte gUnknown_03005CE0
_0808A3A0: .4byte sub_806AEDC
	thumb_func_end sub_808A358

	thumb_func_start sub_808A3A4
sub_808A3A4: @ 808A3A4
	push {r4,r5,lr}
	ldr r4, _0808A3D8 @ =0x0201b260
	adds r5, r4, 0x2
_0808A3AA:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808A3E4
	ldrb r0, [r4]
	ldr r1, _0808A3DC @ =gUnknown_03005CE0
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	movs r0, 0x3
	strb r0, [r5]
	bl sub_8089E84
	ldr r0, _0808A3E0 @ =sub_806AEDC
	bl SetMainCallback2
	b _0808A3F0
	.align 2, 0
_0808A3D8: .4byte 0x0201b260
_0808A3DC: .4byte gUnknown_03005CE0
_0808A3E0: .4byte sub_806AEDC
_0808A3E4:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808A3AA
_0808A3F0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_808A3A4

	thumb_func_start sub_808A3F8
sub_808A3F8: @ 808A3F8
	push {r4,lr}
	ldr r0, _0808A460 @ =gScriptItemId
	ldrh r0, [r0]
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0808A47E
	ldr r0, _0808A464 @ =sub_808A330
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _0808A468 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	adds r0, r4, 0
	movs r1, 0
	bl sub_806BD58
	ldr r0, _0808A46C @ =gUnknown_03005CE0
	ldrb r1, [r0]
	adds r0, r4, 0
	bl sub_806C994
	adds r0, r4, 0
	movs r1, 0
	bl sub_806BF74
	adds r0, r4, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0808A470 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	bl GetMonData
	lsls r0, 24
	cmp r0, 0
	bne _0808A478
	ldr r0, _0808A474 @ =sub_808A34C
	bl SetMainCallback2
	b _0808A4C6
	.align 2, 0
_0808A460: .4byte gScriptItemId
_0808A464: .4byte sub_808A330
_0808A468: .4byte gPaletteFade
_0808A46C: .4byte gUnknown_03005CE0
_0808A470: .4byte gPlayerParty
_0808A474: .4byte sub_808A34C
_0808A478:
	adds r0, r4, 0
	bl DestroyTask
_0808A47E:
	ldr r2, _0808A4A4 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0808A4A8 @ =gScriptItemId
	ldrh r0, [r0]
	cmp r0, 0
	beq _0808A4B4
	ldr r2, _0808A4AC @ =sub_808A2AC
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0xFF
	bl sub_806AF4C
	ldr r0, _0808A4B0 @ =sub_808A358
	bl SetMainCallback2
	b _0808A4C6
	.align 2, 0
_0808A4A4: .4byte gPaletteFade
_0808A4A8: .4byte gScriptItemId
_0808A4AC: .4byte sub_808A2AC
_0808A4B0: .4byte sub_808A358
_0808A4B4:
	ldr r2, _0808A4CC @ =sub_8089D94
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0x5
	bl sub_806AF4C
	ldr r0, _0808A4D0 @ =sub_808A3A4
	bl SetMainCallback2
_0808A4C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A4CC: .4byte sub_8089D94
_0808A4D0: .4byte sub_808A3A4
	thumb_func_end sub_808A3F8

	thumb_func_start sub_808A4D4
sub_808A4D4: @ 808A4D4
	push {r4,lr}
	ldr r4, _0808A4DC @ =0x0201b260
	b _0808A4EC
	.align 2, 0
_0808A4DC: .4byte 0x0201b260
_0808A4E0:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808A510
_0808A4EC:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808A4E0
	ldrb r0, [r4]
	ldr r1, _0808A518 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808A51C @ =sub_806AEDC
	bl SetMainCallback2
_0808A510:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A518: .4byte gUnknown_03005CE0
_0808A51C: .4byte sub_806AEDC
	thumb_func_end sub_808A4D4

	thumb_func_start sub_808A520
sub_808A520: @ 808A520
	push {r4-r7,lr}
	ldr r2, _0808A584 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0808A588 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _0808A59C
	ldr r7, _0808A58C @ =gUnknown_0202E8F8
	ldrh r0, [r7]
	cmp r0, 0
	beq _0808A542
	movs r1, 0x1
	bl RemoveBagItem
_0808A542:
	ldr r6, _0808A590 @ =gUnknown_03005CE0
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _0808A594 @ =gPlayerParty
	adds r0, r4
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl AddBagItem
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	bl sub_80A2DF8
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0xC
	adds r2, r7, 0
	bl SetMonData
	ldr r2, _0808A598 @ =sub_8089CD4
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0
	bl sub_806AF4C
	b _0808A5A8
	.align 2, 0
_0808A584: .4byte gPaletteFade
_0808A588: .4byte gScriptResult
_0808A58C: .4byte gUnknown_0202E8F8
_0808A590: .4byte gUnknown_03005CE0
_0808A594: .4byte gPlayerParty
_0808A598: .4byte sub_8089CD4
_0808A59C:
	ldr r2, _0808A5B4 @ =sub_808A5BC
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0xFF
	bl sub_806AF4C
_0808A5A8:
	ldr r0, _0808A5B8 @ =sub_808A4D4
	bl SetMainCallback2
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A5B4: .4byte sub_808A5BC
_0808A5B8: .4byte sub_808A4D4
	thumb_func_end sub_808A520

	thumb_func_start sub_808A5BC
sub_808A5BC: @ 808A5BC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808A5F0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808A5EA
	ldr r0, _0808A5F4 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	ldr r1, _0808A5F8 @ =gScriptItemId
	ldrh r1, [r1]
	movs r2, 0
	bl DisplayGiveHeldItemMessage
	ldr r1, _0808A5FC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A600 @ =sub_808A1E0
	str r1, [r0]
_0808A5EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A5F0: .4byte gPaletteFade
_0808A5F4: .4byte gUnknown_03005CE0
_0808A5F8: .4byte gScriptItemId
_0808A5FC: .4byte gTasks
_0808A600: .4byte sub_808A1E0
	thumb_func_end sub_808A5BC

	thumb_func_start sub_808A604
sub_808A604: @ 808A604
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808A628 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808A622
	ldr r0, _0808A62C @ =sub_80A61D0
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0808A622:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A628: .4byte gPaletteFade
_0808A62C: .4byte sub_80A61D0
	thumb_func_end sub_808A604

	thumb_func_start PokemonMenu_GiveItem
PokemonMenu_GiveItem: @ 808A630
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _0808A66C @ =gUnknown_0202E8F5
	strb r0, [r1]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0808A670 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A674 @ =sub_808A604
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A66C: .4byte gUnknown_0202E8F5
_0808A670: .4byte gTasks
_0808A674: .4byte sub_808A604
	thumb_func_end PokemonMenu_GiveItem

	thumb_func_start sub_808A678
sub_808A678: @ 808A678
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_808A8D4
	pop {r0}
	bx r0
	thumb_func_end sub_808A678

	thumb_func_start PokemonMenu_TakeItem
PokemonMenu_TakeItem: @ 808A688
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_806D5A4
	ldr r1, _0808A6B4 @ =sub_808A678
	adds r0, r4, 0
	bl PartyMenuTryGiveMonHeldItem_806ECE8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A6B4: .4byte sub_808A678
	thumb_func_end PokemonMenu_TakeItem

	thumb_func_start PokemonMenu_TakeMail
PokemonMenu_TakeMail: @ 808A6B8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_806D5A4
	ldr r1, _0808A6E4 @ =sub_808A678
	adds r0, r4, 0
	bl DoTakeMail
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A6E4: .4byte sub_808A678
	thumb_func_end PokemonMenu_TakeMail

	thumb_func_start PokemonMenu_Mail
PokemonMenu_Mail: @ 808A6E8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	ldr r1, _0808A728 @ =gUnknown_0202FFA8
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _0808A72C @ =gUnknown_0839F584
	ldr r2, _0808A730 @ =gPokemonMenuActions
	movs r0, 0
	movs r3, 0
	bl sub_806E750
	ldr r1, _0808A734 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A738 @ =sub_808A73C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A728: .4byte gUnknown_0202FFA8
_0808A72C: .4byte gUnknown_0839F584
_0808A730: .4byte gPokemonMenuActions
_0808A734: .4byte gTasks
_0808A738: .4byte sub_808A73C
	thumb_func_end PokemonMenu_Mail

	thumb_func_start sub_808A73C
sub_808A73C: @ 808A73C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0808A764 @ =gMain
	ldrh r0, [r0, 0x30]
	cmp r0, 0x40
	bne _0808A77A
	movs r0, 0x5
	bl PlaySE
	ldr r4, _0808A768 @ =gUnknown_0202FFA8
	ldrb r0, [r4]
	cmp r0, 0
	bne _0808A770
	ldr r0, _0808A76C @ =gUnknown_0839F584
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	asrs r0, 24
	b _0808A774
	.align 2, 0
_0808A764: .4byte gMain
_0808A768: .4byte gUnknown_0202FFA8
_0808A76C: .4byte gUnknown_0839F584
_0808A770:
	movs r0, 0x1
	negs r0, r0
_0808A774:
	bl MoveMenuCursor
	strb r0, [r4]
_0808A77A:
	ldr r0, _0808A7A0 @ =gMain
	ldrh r0, [r0, 0x30]
	cmp r0, 0x80
	bne _0808A7B4
	movs r0, 0x5
	bl PlaySE
	ldr r4, _0808A7A4 @ =gUnknown_0202FFA8
	ldrb r0, [r4]
	ldr r1, _0808A7A8 @ =gUnknown_0839F584
	ldrb r2, [r1]
	subs r1, r2, 0x1
	cmp r0, r1
	bne _0808A7AC
	movs r0, 0x1
	subs r0, r2
	lsls r0, 24
	asrs r0, 24
	b _0808A7AE
	.align 2, 0
_0808A7A0: .4byte gMain
_0808A7A4: .4byte gUnknown_0202FFA8
_0808A7A8: .4byte gUnknown_0839F584
_0808A7AC:
	movs r0, 0x1
_0808A7AE:
	bl MoveMenuCursor
	strb r0, [r4]
_0808A7B4:
	ldr r0, _0808A7E0 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0808A7F0
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0808A7E4 @ =gUnknown_0839F584
	ldr r2, _0808A7E8 @ =gPokemonMenuActions
	ldr r0, _0808A7EC @ =gUnknown_0202FFA8
	ldrb r3, [r0]
	movs r0, 0
	bl sub_806E81C
	adds r1, r0, 0
	adds r0, r5, 0
	bl _call_via_r1
	b _0808A806
	.align 2, 0
_0808A7E0: .4byte gMain
_0808A7E4: .4byte gUnknown_0839F584
_0808A7E8: .4byte gPokemonMenuActions
_0808A7EC: .4byte gUnknown_0202FFA8
_0808A7F0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0808A806
	ldr r1, _0808A80C @ =gUnknown_0839F584
	movs r0, 0
	bl sub_806E7D0
	adds r0, r5, 0
	bl PokemonMenu_Cancel
_0808A806:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A80C: .4byte gUnknown_0839F584
	thumb_func_end sub_808A73C

	thumb_func_start PokemonMenu_ReadMail
PokemonMenu_ReadMail: @ 808A810
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0808A840 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A844 @ =sub_808A848
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A840: .4byte gTasks
_0808A844: .4byte sub_808A848
	thumb_func_end PokemonMenu_ReadMail

	thumb_func_start sub_808A848
sub_808A848: @ 808A848
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0808A898 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808A890
	adds r0, r5, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0808A89C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x40
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl DestroyTask
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	ldr r1, _0808A8A0 @ =gSaveBlock1 + 0x2B4C
	adds r0, r1
	ldr r1, _0808A8A4 @ =sub_808A8A8
	movs r2, 0x1
	bl HandleReadMail
_0808A890:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A898: .4byte gPaletteFade
_0808A89C: .4byte gPlayerParty
_0808A8A0: .4byte gSaveBlock1 + 0x2B4C
_0808A8A4: .4byte sub_808A8A8
	thumb_func_end sub_808A848

	thumb_func_start sub_808A8A8
sub_808A8A8: @ 808A8A8
	push {lr}
	ldr r1, _0808A8C4 @ =gUnknown_020384F0
	ldr r0, _0808A8C8 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _0808A8CC @ =0x0201b000
	ldr r1, _0808A8D0 @ =0x00000262
	adds r0, r1
	movs r1, 0x4
	strb r1, [r0]
	bl sub_8089F14
	pop {r0}
	bx r0
	.align 2, 0
_0808A8C4: .4byte gUnknown_020384F0
_0808A8C8: .4byte gUnknown_03005CE0
_0808A8CC: .4byte 0x0201b000
_0808A8D0: .4byte 0x00000262
	thumb_func_end sub_808A8A8

	thumb_func_start sub_808A8D4
sub_808A8D4: @ 808A8D4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0808A90C @ =gUnknown_0202FFA8
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldr r1, _0808A910 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A914 @ =sub_8089CD4
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A90C: .4byte gUnknown_0202FFA8
_0808A910: .4byte gTasks
_0808A914: .4byte sub_8089CD4
	thumb_func_end sub_808A8D4

	thumb_func_start PokemonMenu_Cancel
PokemonMenu_Cancel: @ 808A918
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_808A8D4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PokemonMenu_Cancel

	thumb_func_start PokemonMenu_CancelSubmenu
PokemonMenu_CancelSubmenu: @ 808A938
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_806D5A4
	ldr r0, _0808A978 @ =gUnknown_0202FFA8
	ldrb r0, [r0]
	bl sub_8089C7C
	ldr r1, _0808A97C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808A980 @ =sub_8089D94
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A978: .4byte gUnknown_0202FFA8
_0808A97C: .4byte gTasks
_0808A980: .4byte sub_8089D94
	thumb_func_end PokemonMenu_CancelSubmenu

	thumb_func_start PokemonMenu_FieldMove
PokemonMenu_FieldMove: @ 808A984
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r7, _0808A9D0 @ =gTasks + 0x8
	adds r4, r6, r7
	bl sub_8072DEC
	ldr r1, _0808A9D4 @ =gUnknown_0202FFAA
	ldr r0, _0808A9D8 @ =gUnknown_0202FFA8
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	subs r0, 0xA
	strh r0, [r4, 0x16]
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808A9DC
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldrh r0, [r4, 0x16]
	subs r0, 0xB
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0808AABA
	movs r0, 0x9
	b _0808AAB2
	.align 2, 0
_0808A9D0: .4byte gTasks + 0x8
_0808A9D4: .4byte gUnknown_0202FFAA
_0808A9D8: .4byte gUnknown_0202FFA8
_0808A9DC:
	ldrh r1, [r4, 0x16]
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0x7
	bgt _0808AA2C
	ldr r2, _0808AA20 @ =0x00000807
	adds r0, r1, r2
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808AA2C
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_806D5A4
	ldr r0, _0808AA24 @ =gOtherText_CantBeUsedBadge
	movs r1, 0x1
	bl sub_806E834
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _0808AA28 @ =sub_808AAF0
	str r1, [r0]
	b _0808AADA
	.align 2, 0
_0808AA20: .4byte 0x00000807
_0808AA24: .4byte gOtherText_CantBeUsedBadge
_0808AA28: .4byte sub_808AAF0
_0808AA2C:
	ldr r1, _0808AA78 @ =gFieldMoveFuncs
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	lsls r0, 3
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808AA90
	ldr r1, _0808AA7C @ =gUnknown_0202FFA8
	movs r0, 0
	strb r0, [r1]
	ldrh r0, [r4, 0x16]
	subs r0, 0xB
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _0808AA88
	ldr r1, _0808AA80 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808AA84 @ =sub_808AB34
	str r1, [r0]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0808AADA
	.align 2, 0
_0808AA78: .4byte gFieldMoveFuncs
_0808AA7C: .4byte gUnknown_0202FFA8
_0808AA80: .4byte gTasks
_0808AA84: .4byte sub_808AB34
_0808AA88:
	adds r0, r5, 0
	bl sub_8133D28
	b _0808AADA
_0808AA90:
	movs r0, 0x13
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bne _0808AABA
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0808AABA
	movs r0, 0x8
_0808AAB2:
	movs r1, 0
	bl sub_806D538
	b _0808AACC
_0808AABA:
	ldr r0, _0808AAE4 @ =gFieldMoveFuncs
	movs r2, 0x16
	ldrsh r1, [r4, r2]
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x4]
	movs r1, 0
	bl sub_806D538
_0808AACC:
	ldr r0, _0808AAE8 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808AAEC @ =sub_808ABF4
	str r0, [r1]
_0808AADA:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AAE4: .4byte gFieldMoveFuncs
_0808AAE8: .4byte gTasks
_0808AAEC: .4byte sub_808ABF4
	thumb_func_end PokemonMenu_FieldMove

	thumb_func_start sub_808AAF0
sub_808AAF0: @ 808AAF0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808AB2C @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808AB24
	ldr r0, _0808AB30 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0808AB12
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0808AB24
_0808AB12:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl PokemonMenu_Cancel
_0808AB24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AB2C: .4byte gUnknown_0202E8F6
_0808AB30: .4byte gMain
	thumb_func_end sub_808AAF0

	thumb_func_start sub_808AB34
sub_808AB34: @ 808AB34
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808AB6C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808AB84
	ldr r0, _0808AB70 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0x1E
	ldrsh r0, [r1, r2]
	cmp r0, 0x5
	bne _0808AB62
	bl ShouldDoBrailleFlyEffect
	lsls r0, 24
	cmp r0, 0
	beq _0808AB78
_0808AB62:
	ldr r0, _0808AB74 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	b _0808AB7E
	.align 2, 0
_0808AB6C: .4byte gPaletteFade
_0808AB70: .4byte gTasks
_0808AB74: .4byte c2_exit_to_overworld_2_switch
_0808AB78:
	ldr r0, _0808AB8C @ =sub_80FC074
	bl SetMainCallback2
_0808AB7E:
	adds r0, r4, 0
	bl DestroyTask
_0808AB84:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AB8C: .4byte sub_80FC074
	thumb_func_end sub_808AB34

	thumb_func_start sub_808AB90
sub_808AB90: @ 808AB90
	push {lr}
	bl pal_fill_black
	ldr r0, _0808ABA4 @ =sub_808ABA8
	movs r1, 0x8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0808ABA4: .4byte sub_808ABA8
	thumb_func_end sub_808AB90

	thumb_func_start sub_808ABA8
sub_808ABA8: @ 808ABA8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808ABDE
	ldr r0, _0808ABE4 @ =gUnknown_03005CE0
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808ABE8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	ldr r1, _0808ABEC @ =gUnknown_0202FF84
	str r0, [r1]
	ldr r0, _0808ABF0 @ =gUnknown_03005CE4
	ldr r0, [r0]
	bl _call_via_r0
	adds r0, r4, 0
	bl DestroyTask
_0808ABDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808ABE4: .4byte gUnknown_03005CE0
_0808ABE8: .4byte gPlayerParty
_0808ABEC: .4byte gUnknown_0202FF84
_0808ABF0: .4byte gUnknown_03005CE4
	thumb_func_end sub_808ABA8

	thumb_func_start sub_808ABF4
sub_808ABF4: @ 808ABF4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808AC28 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0808AC0E
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0808AC20
_0808AC0E:
	movs r0, 0x1
	movs r1, 0x11
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl PokemonMenu_Cancel
_0808AC20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AC28: .4byte gMain
	thumb_func_end sub_808ABF4

	thumb_func_start sub_808AC2C
sub_808AC2C: @ 808AC2C
	push {lr}
	ldr r0, _0808AC40 @ =gUnknown_0202FF84
	ldr r1, _0808AC44 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x9
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_0808AC40: .4byte gUnknown_0202FF84
_0808AC44: .4byte gUnknown_03005CE0
	thumb_func_end sub_808AC2C

	thumb_func_start SetUpFieldMove_Surf
SetUpFieldMove_Surf: @ 808AC48
	push {lr}
	bl PartyHasMonWithSurf
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808AC84
	bl IsPlayerFacingSurfableFishableWater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808AC84
	ldr r1, _0808AC74 @ =gUnknown_0300485C
	ldr r0, _0808AC78 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0808AC7C @ =gUnknown_03005CE4
	ldr r0, _0808AC80 @ =sub_808AC2C
	str r0, [r1]
	movs r0, 0x1
	b _0808AC86
	.align 2, 0
_0808AC74: .4byte gUnknown_0300485C
_0808AC78: .4byte sub_808AB90
_0808AC7C: .4byte gUnknown_03005CE4
_0808AC80: .4byte sub_808AC2C
_0808AC84:
	movs r0, 0
_0808AC86:
	pop {r1}
	bx r1
	thumb_func_end SetUpFieldMove_Surf

	thumb_func_start sub_808AC8C
sub_808AC8C: @ 808AC8C
	push {lr}
	ldr r0, _0808ACA0 @ =gUnknown_0202FF84
	ldr r1, _0808ACA4 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x1F
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_0808ACA0: .4byte gUnknown_0202FF84
_0808ACA4: .4byte gUnknown_03005CE0
	thumb_func_end sub_808AC8C

	thumb_func_start SetUpFieldMove_Fly
SetUpFieldMove_Fly: @ 808ACA8
	push {lr}
	bl ShouldDoBrailleFlyEffect
	lsls r0, 24
	cmp r0, 0
	beq _0808ACD0
	ldr r1, _0808ACC0 @ =gUnknown_0300485C
	ldr r0, _0808ACC4 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0808ACC8 @ =gUnknown_03005CE4
	ldr r0, _0808ACCC @ =DoBrailleFlyEffect
	b _0808ACF2
	.align 2, 0
_0808ACC0: .4byte gUnknown_0300485C
_0808ACC4: .4byte sub_808AB90
_0808ACC8: .4byte gUnknown_03005CE4
_0808ACCC: .4byte DoBrailleFlyEffect
_0808ACD0:
	ldr r0, _0808ACE4 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	bl is_light_level_1_2_3_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808ACE8
	movs r0, 0
	b _0808ACF6
	.align 2, 0
_0808ACE4: .4byte gMapHeader
_0808ACE8:
	ldr r1, _0808ACFC @ =gUnknown_0300485C
	ldr r0, _0808AD00 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0808AD04 @ =gUnknown_03005CE4
	ldr r0, _0808AD08 @ =sub_808AC8C
_0808ACF2:
	str r0, [r1]
	movs r0, 0x1
_0808ACF6:
	pop {r1}
	bx r1
	.align 2, 0
_0808ACFC: .4byte gUnknown_0300485C
_0808AD00: .4byte sub_808AB90
_0808AD04: .4byte gUnknown_03005CE4
_0808AD08: .4byte sub_808AC8C
	thumb_func_end SetUpFieldMove_Fly

	thumb_func_start sub_808AD0C
sub_808AD0C: @ 808AD0C
	push {r4,lr}
	ldr r4, _0808AD14 @ =0x0201b260
	b _0808AD24
	.align 2, 0
_0808AD14: .4byte 0x0201b260
_0808AD18:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808AD48
_0808AD24:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808AD18
	ldrb r0, [r4]
	ldr r1, _0808AD50 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808AD54 @ =sub_806AEDC
	bl SetMainCallback2
_0808AD48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AD50: .4byte gUnknown_03005CE0
_0808AD54: .4byte sub_806AEDC
	thumb_func_end sub_808AD0C

	thumb_func_start sub_808AD58
sub_808AD58: @ 808AD58
	push {lr}
	ldr r2, _0808AD7C @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r2, _0808AD80 @ =sub_8089CD4
	movs r0, 0
	movs r1, 0xFF
	movs r3, 0
	bl sub_806AF4C
	ldr r0, _0808AD84 @ =sub_808AD0C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0808AD7C: .4byte gPaletteFade
_0808AD80: .4byte sub_8089CD4
_0808AD84: .4byte sub_808AD0C
	thumb_func_end sub_808AD58

	thumb_func_start unref_sub_808AD88
unref_sub_808AD88: @ 808AD88
	push {lr}
	ldr r0, _0808ADA4 @ =gUnknown_03005CE0
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808ADA8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0808ADA4: .4byte gUnknown_03005CE0
_0808ADA8: .4byte gPlayerParty
	thumb_func_end unref_sub_808AD88

	thumb_func_start sub_808ADAC
sub_808ADAC: @ 808ADAC
	push {lr}
	ldr r0, _0808ADC0 @ =gUnknown_0202FF84
	ldr r1, _0808ADC4 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x2C
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_0808ADC0: .4byte gUnknown_0202FF84
_0808ADC4: .4byte gUnknown_03005CE0
	thumb_func_end sub_808ADAC

	thumb_func_start SetUpFieldMove_Dive
SetUpFieldMove_Dive: @ 808ADC8
	push {lr}
	bl sub_8068F18
	ldr r1, _0808ADE0 @ =gUnknown_0202FF84
	lsls r0, 24
	lsrs r0, 24
	str r0, [r1, 0x4]
	cmp r0, 0
	bne _0808ADE4
	movs r0, 0
	b _0808ADF2
	.align 2, 0
_0808ADE0: .4byte gUnknown_0202FF84
_0808ADE4:
	ldr r1, _0808ADF8 @ =gUnknown_0300485C
	ldr r0, _0808ADFC @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0808AE00 @ =gUnknown_03005CE4
	ldr r0, _0808AE04 @ =sub_808ADAC
	str r0, [r1]
	movs r0, 0x1
_0808ADF2:
	pop {r1}
	bx r1
	.align 2, 0
_0808ADF8: .4byte gUnknown_0300485C
_0808ADFC: .4byte sub_808AB90
_0808AE00: .4byte gUnknown_03005CE4
_0808AE04: .4byte sub_808ADAC
	thumb_func_end SetUpFieldMove_Dive

	thumb_func_start sub_808AE08
sub_808AE08: @ 808AE08
	push {lr}
	ldr r0, _0808AE1C @ =gUnknown_0202FF84
	ldr r1, _0808AE20 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x2B
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_0808AE1C: .4byte gUnknown_0202FF84
_0808AE20: .4byte gUnknown_03005CE0
	thumb_func_end sub_808AE08

	thumb_func_start SetUpFieldMove_Waterfall
SetUpFieldMove_Waterfall: @ 808AE24
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808AE80
	bl IsPlayerSurfingNorth
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808AE80
	ldr r1, _0808AE70 @ =gUnknown_0300485C
	ldr r0, _0808AE74 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0808AE78 @ =gUnknown_03005CE4
	ldr r0, _0808AE7C @ =sub_808AE08
	str r0, [r1]
	movs r0, 0x1
	b _0808AE82
	.align 2, 0
_0808AE70: .4byte gUnknown_0300485C
_0808AE74: .4byte sub_808AB90
_0808AE78: .4byte gUnknown_03005CE4
_0808AE7C: .4byte sub_808AE08
_0808AE80:
	movs r0, 0
_0808AE82:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end SetUpFieldMove_Waterfall

	thumb_func_start sub_808AE8C
sub_808AE8C: @ 808AE8C
	push {r4-r6,lr}
	ldr r0, _0808AED8 @ =gScriptItemId
	ldrb r0, [r0]
	subs r0, 0x21
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
_0808AE9A:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0808AEDC @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0808AF10
	adds r0, r5, 0
	bl sub_806D668
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0808AECE
	adds r0, r4, 0
	adds r1, r6, 0
	bl CanMonLearnTMHM
	cmp r0, 0
	bne _0808AEE0
_0808AECE:
	adds r0, r5, 0
	movs r1, 0x9A
	bl sub_806BC3C
	b _0808AF10
	.align 2, 0
_0808AED8: .4byte gScriptItemId
_0808AEDC: .4byte gPlayerParty
_0808AEE0:
	ldr r0, _0808AF04 @ =gScriptItemId
	ldrh r0, [r0]
	bl ItemIdToBattleMoveId
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl pokemon_has_move
	lsls r0, 24
	cmp r0, 0
	beq _0808AF08
	adds r0, r5, 0
	movs r1, 0xA8
	bl sub_806BC3C
	b _0808AF10
	.align 2, 0
_0808AF04: .4byte gScriptItemId
_0808AF08:
	adds r0, r5, 0
	movs r1, 0x8C
	bl sub_806BC3C
_0808AF10:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _0808AE9A
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_808AE8C

	thumb_func_start sub_808AF20
sub_808AF20: @ 808AF20
	push {r4,r5,lr}
	movs r5, 0
_0808AF24:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0808AF78 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0808AF66
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0808AF58
	ldr r0, _0808AF7C @ =gScriptItemId
	ldrh r2, [r0]
	adds r0, r4, 0
	movs r1, 0x3
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	cmp r0, 0
	bne _0808AF66
_0808AF58:
	adds r0, r5, 0
	bl sub_806D668
	adds r0, r5, 0
	movs r1, 0
	bl sub_806BC3C
_0808AF66:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _0808AF24
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808AF78: .4byte gPlayerParty
_0808AF7C: .4byte gScriptItemId
	thumb_func_end sub_808AF20

	thumb_func_start sub_808AF80
sub_808AF80: @ 808AF80
	push {r4,r5,lr}
	ldr r5, _0808AFB0 @ =0x0201b260
_0808AF84:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B00C
	ldr r0, _0808AFB4 @ =gUnknown_02038561
	ldrb r0, [r0]
	cmp r0, 0
	bne _0808AFC6
	ldr r0, _0808AFB8 @ =gScriptItemId
	ldrh r0, [r0]
	bl CheckIfItemIsTMHMOrEvolutionStone
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808AFBC
	cmp r0, 0x2
	beq _0808AFC2
	b _0808AFC6
	.align 2, 0
_0808AFB0: .4byte 0x0201b260
_0808AFB4: .4byte gUnknown_02038561
_0808AFB8: .4byte gScriptItemId
_0808AFBC:
	bl sub_808AE8C
	b _0808AFC6
_0808AFC2:
	bl sub_808AF20
_0808AFC6:
	ldr r4, _0808B000 @ =gUnknown_03005CE0
	ldrb r0, [r4]
	cmp r0, 0x5
	bhi _0808AFE2
	adds r1, r0, 0
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808B004 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	bne _0808AFE6
_0808AFE2:
	movs r0, 0
	strb r0, [r4]
_0808AFE6:
	ldrb r0, [r5]
	ldr r1, _0808B000 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r5]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808B008 @ =sub_806AEDC
	bl SetMainCallback2
	b _0808B018
	.align 2, 0
_0808B000: .4byte gUnknown_03005CE0
_0808B004: .4byte gPlayerParty
_0808B008: .4byte sub_806AEDC
_0808B00C:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808AF84
_0808B018:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_808AF80

	thumb_func_start sub_808B020
sub_808B020: @ 808B020
	push {lr}
	ldr r2, _0808B040 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0808B044 @ =gUnknown_02038561
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808B0A0
	cmp r0, 0x1
	bgt _0808B048
	cmp r0, 0
	beq _0808B052
	b _0808B0AC
	.align 2, 0
_0808B040: .4byte gPaletteFade
_0808B044: .4byte gUnknown_02038561
_0808B048:
	cmp r0, 0x3
	beq _0808B0A0
	cmp r0, 0x4
	beq _0808B08C
	b _0808B0AC
_0808B052:
	ldr r0, _0808B070 @ =gScriptItemId
	ldrh r0, [r0]
	bl CheckIfItemIsTMHMOrEvolutionStone
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B078
	ldr r2, _0808B074 @ =sub_808B0C0
	movs r0, 0
	movs r1, 0
	movs r3, 0x14
	bl sub_806AF4C
	b _0808B0AC
	.align 2, 0
_0808B070: .4byte gScriptItemId
_0808B074: .4byte sub_808B0C0
_0808B078:
	ldr r2, _0808B088 @ =sub_808B0C0
	movs r0, 0
	movs r1, 0
	movs r3, 0x3
	bl sub_806AF4C
	b _0808B0AC
	.align 2, 0
_0808B088: .4byte sub_808B0C0
_0808B08C:
	ldr r2, _0808B09C @ =sub_808B1EC
	movs r0, 0
	movs r1, 0
	movs r3, 0xFF
	bl sub_806AF4C
	b _0808B0AC
	.align 2, 0
_0808B09C: .4byte sub_808B1EC
_0808B0A0:
	ldr r2, _0808B0B8 @ =sub_808B0C0
	movs r0, 0
	movs r1, 0
	movs r3, 0x4
	bl sub_806AF4C
_0808B0AC:
	ldr r0, _0808B0BC @ =sub_808AF80
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0808B0B8: .4byte sub_808B0C0
_0808B0BC: .4byte sub_808AF80
	thumb_func_end sub_808B020

	thumb_func_start sub_808B0C0
sub_808B0C0: @ 808B0C0
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B0EC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0808B1CE
	adds r0, r4, 0
	bl sub_806BD80
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _0808B0F0
	cmp r0, 0x2
	beq _0808B184
	b _0808B1CE
	.align 2, 0
_0808B0EC: .4byte gPaletteFade
_0808B0F0:
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _0808B118 @ =gUnknown_03005CE0
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808B11C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _0808B120
	movs r0, 0x20
	bl PlaySE
	b _0808B1CE
	.align 2, 0
_0808B118: .4byte gUnknown_03005CE0
_0808B11C: .4byte gPlayerParty
_0808B120:
	bl sub_806D5A4
	ldr r5, _0808B16C @ =gUnknown_02038561
	ldrb r0, [r5]
	cmp r0, 0
	bne _0808B13C
	ldr r3, _0808B170 @ =gUnknown_03004AE4
	ldr r0, _0808B174 @ =gScriptItemId
	ldrh r1, [r0]
	ldr r2, _0808B178 @ =sub_808B224
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
_0808B13C:
	ldrb r0, [r5]
	cmp r0, 0x1
	bne _0808B154
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0808B174 @ =gScriptItemId
	ldrh r1, [r0]
	ldr r2, _0808B17C @ =sub_808B2EC
	adds r0, r4, 0
	bl PartyMenuTryGiveMonHeldItem
_0808B154:
	ldrb r0, [r5]
	cmp r0, 0x3
	bne _0808B1CE
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0808B180 @ =sub_808B2B4
	adds r0, r4, 0
	bl PartyMenuTryGiveMonMail
	b _0808B1CE
	.align 2, 0
_0808B16C: .4byte gUnknown_02038561
_0808B170: .4byte gUnknown_03004AE4
_0808B174: .4byte gScriptItemId
_0808B178: .4byte sub_808B224
_0808B17C: .4byte sub_808B2EC
_0808B180: .4byte sub_808B2B4
_0808B184:
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _0808B1D8 @ =gUnknown_03005CE0
	strb r0, [r1]
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r2, _0808B1DC @ =gUnknown_02038561
	ldrb r0, [r2]
	cmp r0, 0x1
	bhi _0808B1BA
	ldr r0, _0808B1E0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808B1E4 @ =sub_808B25C
	str r0, [r1]
_0808B1BA:
	ldrb r0, [r2]
	cmp r0, 0x3
	bne _0808B1CE
	ldr r0, _0808B1E0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0808B1E8 @ =sub_808B2B4
	str r0, [r1]
_0808B1CE:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808B1D8: .4byte gUnknown_03005CE0
_0808B1DC: .4byte gUnknown_02038561
_0808B1E0: .4byte gTasks
_0808B1E4: .4byte sub_808B25C
_0808B1E8: .4byte sub_808B2B4
	thumb_func_end sub_808B0C0

	thumb_func_start sub_808B1EC
sub_808B1EC: @ 808B1EC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B214 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808B20E
	ldr r3, _0808B218 @ =gUnknown_03004AE4
	ldr r0, _0808B21C @ =gScriptItemId
	ldrh r1, [r0]
	ldr r2, _0808B220 @ =sub_808B224
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
_0808B20E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B214: .4byte gPaletteFade
_0808B218: .4byte gUnknown_03004AE4
_0808B21C: .4byte gScriptItemId
_0808B220: .4byte sub_808B224
	thumb_func_end sub_808B1EC

	thumb_func_start sub_808B224
sub_808B224: @ 808B224
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0808B254 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808B258 @ =sub_808B25C
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B254: .4byte gTasks
_0808B258: .4byte sub_808B25C
	thumb_func_end sub_808B224

	thumb_func_start sub_808B25C
sub_808B25C: @ 808B25C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B280 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808B27A
	ldr r0, _0808B284 @ =sub_80A5B40
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0808B27A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B280: .4byte gPaletteFade
_0808B284: .4byte sub_80A5B40
	thumb_func_end sub_808B25C

	thumb_func_start sub_808B288
sub_808B288: @ 808B288
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B2AC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808B2A6
	ldr r0, _0808B2B0 @ =sub_813B6F8
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0808B2A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B2AC: .4byte gPaletteFade
_0808B2B0: .4byte sub_813B6F8
	thumb_func_end sub_808B288

	thumb_func_start sub_808B2B4
sub_808B2B4: @ 808B2B4
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0808B2E4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808B2E8 @ =sub_808B288
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B2E4: .4byte gTasks
_0808B2E8: .4byte sub_808B288
	thumb_func_end sub_808B2B4

	thumb_func_start sub_808B2EC
sub_808B2EC: @ 808B2EC
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B31C @ =gUnknown_0202E8F4
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _0808B328
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0808B320 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808B324 @ =sub_808B338
	str r1, [r0]
	b _0808B32E
	.align 2, 0
_0808B31C: .4byte gUnknown_0202E8F4
_0808B320: .4byte gTasks
_0808B324: .4byte sub_808B338
_0808B328:
	adds r0, r4, 0
	bl sub_808B224
_0808B32E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_808B2EC

	thumb_func_start sub_808B338
sub_808B338: @ 808B338
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0808B38C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808B384
	adds r0, r5, 0
	bl sub_806CA38
	ldr r1, _0808B390 @ =gUnknown_03005CE0
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0808B394 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x40
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl DestroyTask
	lsls r1, r4, 3
	adds r1, r4
	lsls r1, 2
	ldr r0, _0808B398 @ =gSaveBlock1 + 0x2B4C
	adds r1, r0
	ldr r2, _0808B39C @ =sub_808B3EC
	movs r0, 0x4
	movs r3, 0x3
	bl sub_80E62A0
_0808B384:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808B38C: .4byte gPaletteFade
_0808B390: .4byte gUnknown_03005CE0
_0808B394: .4byte gPlayerParty
_0808B398: .4byte gSaveBlock1 + 0x2B4C
_0808B39C: .4byte sub_808B3EC
	thumb_func_end sub_808B338

	thumb_func_start sub_808B3A0
sub_808B3A0: @ 808B3A0
	push {r4,lr}
	ldr r4, _0808B3A8 @ =0x0201b260
	b _0808B3B8
	.align 2, 0
_0808B3A8: .4byte 0x0201b260
_0808B3AC:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808B3DC
_0808B3B8:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B3AC
	ldrb r0, [r4]
	ldr r1, _0808B3E4 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808B3E8 @ =sub_806AEDC
	bl SetMainCallback2
_0808B3DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B3E4: .4byte gUnknown_03005CE0
_0808B3E8: .4byte sub_806AEDC
	thumb_func_end sub_808B3A0

	thumb_func_start sub_808B3EC
sub_808B3EC: @ 808B3EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _0808B464 @ =gPaletteFade
	mov r8, r0
	ldrb r0, [r0, 0x8]
	movs r1, 0x80
	orrs r0, r1
	mov r1, r8
	strb r0, [r1, 0x8]
	ldr r0, _0808B468 @ =gScriptResult
	ldrh r0, [r0]
	cmp r0, 0
	bne _0808B480
	ldr r7, _0808B46C @ =gUnknown_0202E8F8
	ldrh r0, [r7]
	cmp r0, 0
	beq _0808B416
	movs r1, 0x1
	bl RemoveBagItem
_0808B416:
	ldr r6, _0808B470 @ =gUnknown_03005CE0
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _0808B474 @ =gPlayerParty
	adds r0, r4
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl AddBagItem
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	bl sub_80A2DF8
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0xC
	adds r2, r7, 0
	bl SetMonData
	ldr r0, _0808B478 @ =sub_808B25C
	movs r1, 0x5
	bl CreateTask
	mov r0, r8
	ldrb r1, [r0, 0x8]
	movs r0, 0x7F
	ands r0, r1
	mov r1, r8
	strb r0, [r1, 0x8]
	ldr r0, _0808B47C @ =sub_806AEDC
	b _0808B48E
	.align 2, 0
_0808B464: .4byte gPaletteFade
_0808B468: .4byte gScriptResult
_0808B46C: .4byte gUnknown_0202E8F8
_0808B470: .4byte gUnknown_03005CE0
_0808B474: .4byte gPlayerParty
_0808B478: .4byte sub_808B25C
_0808B47C: .4byte sub_806AEDC
_0808B480:
	ldr r2, _0808B49C @ =sub_808B4A4
	movs r0, 0
	movs r1, 0
	movs r3, 0xFF
	bl sub_806AF4C
	ldr r0, _0808B4A0 @ =sub_808B3A0
_0808B48E:
	bl SetMainCallback2
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B49C: .4byte sub_808B4A4
_0808B4A0: .4byte sub_808B3A0
	thumb_func_end sub_808B3EC

	thumb_func_start sub_808B4A4
sub_808B4A4: @ 808B4A4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0808B4D8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0808B4D2
	ldr r0, _0808B4DC @ =gUnknown_03005CE0
	ldrb r0, [r0]
	ldr r1, _0808B4E0 @ =gScriptItemId
	ldrh r1, [r1]
	movs r2, 0x1
	bl DisplayGiveHeldItemMessage
	ldr r1, _0808B4E4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808B4E8 @ =sub_808B4EC
	str r1, [r0]
_0808B4D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B4D8: .4byte gPaletteFade
_0808B4DC: .4byte gUnknown_03005CE0
_0808B4E0: .4byte gScriptItemId
_0808B4E4: .4byte gTasks
_0808B4E8: .4byte sub_808B4EC
	thumb_func_end sub_808B4A4

	thumb_func_start sub_808B4EC
sub_808B4EC: @ 808B4EC
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _0808B504 @ =gUnknown_0202E8F6
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0808B500
	adds r0, r1, 0
	bl sub_808B224
_0808B500:
	pop {r0}
	bx r0
	.align 2, 0
_0808B504: .4byte gUnknown_0202E8F6
	thumb_func_end sub_808B4EC

	thumb_func_start sub_808B508
sub_808B508: @ 808B508
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_808B224
	pop {r0}
	bx r0
	thumb_func_end sub_808B508

	thumb_func_start sub_808B518
sub_808B518: @ 808B518
	push {r4,lr}
	ldr r4, _0808B520 @ =0x0201b260
	b _0808B530
	.align 2, 0
_0808B520: .4byte 0x0201b260
_0808B524:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808B554
_0808B530:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808B524
	ldrb r0, [r4]
	ldr r1, _0808B55C @ =gUnknown_020384F0
	ldrb r1, [r1]
	bl sub_806C994
	ldrb r0, [r4]
	movs r1, 0
	bl sub_806BF74
	ldr r0, _0808B560 @ =sub_806AEDC
	bl SetMainCallback2
_0808B554:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B55C: .4byte gUnknown_020384F0
_0808B560: .4byte sub_806AEDC
	thumb_func_end sub_808B518

	thumb_func_start sub_808B564
sub_808B564: @ 808B564
	push {lr}
	ldr r2, _0808B58C @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	bl sub_809FA30
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _0808B594
	ldr r2, _0808B590 @ =TaughtMove
	movs r0, 0
	movs r1, 0
	movs r3, 0xFF
	bl sub_806AF4C
	b _0808B5A0
	.align 2, 0
_0808B58C: .4byte gPaletteFade
_0808B590: .4byte TaughtMove
_0808B594:
	ldr r2, _0808B5AC @ =StopTryingToTeachMove_806F588
	movs r0, 0
	movs r1, 0
	movs r3, 0xFF
	bl sub_806AF4C
_0808B5A0:
	ldr r0, _0808B5B0 @ =sub_808B518
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0808B5AC: .4byte StopTryingToTeachMove_806F588
_0808B5B0: .4byte sub_808B518
	thumb_func_end sub_808B564

	thumb_func_start sub_808B5B4
sub_808B5B4: @ 808B5B4
	push {lr}
	ldr r3, _0808B5D8 @ =gUnknown_03005CF0
	ldr r2, _0808B5DC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, [r1]
	str r2, [r3]
	ldr r2, _0808B5E0 @ =sub_808B5E4
	str r2, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_0808B5D8: .4byte gUnknown_03005CF0
_0808B5DC: .4byte gTasks
_0808B5E0: .4byte sub_808B5E4
	thumb_func_end sub_808B5B4

	thumb_func_start sub_808B5E4
sub_808B5E4: @ 808B5E4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8055870
	cmp r0, 0x1
	beq _0808B602
	ldr r1, _0808B608 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0808B60C @ =gUnknown_03005CF0
	ldr r1, [r1]
	str r1, [r0]
_0808B602:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B608: .4byte gTasks
_0808B60C: .4byte gUnknown_03005CF0
	thumb_func_end sub_808B5E4

	.align 2, 0 @ Don't pad with nop.
