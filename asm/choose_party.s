	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8122854
sub_8122854: @ 8122854
	push {r4,lr}
	ldr r1, _08122874 @ =0x0201b000
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x4
	bhi _081228E0
	lsls r0, 2
	ldr r1, _08122878 @ =_0812287C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08122874: .4byte 0x0201b000
_08122878: .4byte _0812287C
	.align 2, 0
_0812287C:
	.4byte _08122890
	.4byte _081228A4
	.4byte _081228AA
	.4byte _081228BE
	.4byte _081228D8
_08122890:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_81228E8
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _081228CA
_081228A4:
	bl LoadHeldItemIconGraphics
	b _081228C2
_081228AA:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_8122950
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _081228CA
_081228BE:
	bl sub_81229B8
_081228C2:
	ldr r1, _081228D4 @ =0x0201b000
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
_081228CA:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _081228E0
	.align 2, 0
_081228D4: .4byte 0x0201b000
_081228D8:
	bl sub_806B908
	movs r0, 0x1
	b _081228E2
_081228E0:
	movs r0, 0
_081228E2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8122854

	thumb_func_start sub_81228E8
sub_81228E8: @ 81228E8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
_081228F0:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08122948 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08122912
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x3
	adds r3, r4, 0
	bl CreatePartyMenuMonIcon
_08122912:
	ldr r0, _0812294C @ =gUnknown_02023A00
	lsls r1, r5, 5
	adds r3, r1, r0
	ldrh r0, [r3]
	cmp r0, 0
	beq _08122936
	adds r4, r5, 0x3
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0x3
	bl CreateMonIcon_806D99C
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_806D50C
_08122936:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _081228F0
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08122948: .4byte gPlayerParty
_0812294C: .4byte gUnknown_02023A00
	thumb_func_end sub_81228E8

	thumb_func_start sub_8122950
sub_8122950: @ 8122950
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
_08122958:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _081229B0 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08122984
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl CreateHeldItemIcon_806DCD4
_08122984:
	ldr r0, _081229B4 @ =gUnknown_02023A00
	lsls r1, r5, 5
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, 0
	beq _0812299E
	adds r1, r5, 0x3
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r2, 0x2]
	adds r0, r6, 0
	bl CreateHeldItemIcon_806DCD4
_0812299E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _08122958
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081229B0: .4byte gPlayerParty
_081229B4: .4byte gUnknown_02023A00
	thumb_func_end sub_8122950

	thumb_func_start sub_81229B8
sub_81229B8: @ 81229B8
	push {r4-r7,lr}
	movs r5, 0
	movs r7, 0x64
	ldr r6, _08122A00 @ =gPlayerParty
_081229C0:
	adds r0, r5, 0
	muls r0, r7
	adds r4, r0, r6
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08122A36
	adds r0, r5, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl PartyMenuPrintHP
	adds r0, r4, 0
	bl GetMonStatusAndPokerus
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08122A04
	cmp r0, 0x6
	beq _08122A04
	subs r2, r0, 0x1
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	movs r1, 0x3
	bl PartyMenuPutStatusTilemap
	b _08122A12
	.align 2, 0
_08122A00: .4byte gPlayerParty
_08122A04:
	adds r2, r5, 0
	muls r2, r7
	adds r2, r6
	adds r0, r5, 0
	movs r1, 0x3
	bl PartyMenuPrintLevel
_08122A12:
	adds r4, r5, 0
	muls r4, r7
	adds r4, r6
	adds r0, r5, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl PartyMenuPutNicknameTilemap
	adds r0, r5, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl PrintPartyMenuMonNickname
	adds r0, r5, 0
	movs r1, 0x3
	adds r2, r4, 0
	bl PartyMenuDrawHPBar
_08122A36:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _081229C0
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_81229B8

	thumb_func_start sub_8122A48
sub_8122A48: @ 8122A48
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08122AA0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08122A98
	ldr r0, _08122AA4 @ =gTasks
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r0
	movs r0, 0x1E
	strh r0, [r4, 0x8]
	ldr r5, _08122AA8 @ =gUnknown_02023A00
	ldrh r1, [r5]
	adds r0, r6, 0
	movs r2, 0
	bl sub_806D4AC
	ldrh r1, [r5, 0x20]
	adds r0, r6, 0
	movs r2, 0x1
	bl sub_806D4AC
	adds r5, 0x40
	ldrh r1, [r5]
	adds r0, r6, 0
	movs r2, 0x2
	bl sub_806D4AC
	ldr r0, _08122AAC @ =sub_8122AB8
	str r0, [r4]
	ldr r0, _08122AB0 @ =0x0201b000
	ldr r1, _08122AB4 @ =0x00000261
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
_08122A98:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08122AA0: .4byte gPaletteFade
_08122AA4: .4byte gTasks
_08122AA8: .4byte gUnknown_02023A00
_08122AAC: .4byte sub_8122AB8
_08122AB0: .4byte 0x0201b000
_08122AB4: .4byte 0x00000261
	thumb_func_end sub_8122A48

	thumb_func_start sub_8122AB8
sub_8122AB8: @ 8122AB8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08122AFC @ =gUnknown_02023A00
	ldrh r1, [r0, 0x20]
	adds r0, 0x40
	ldrh r2, [r0]
	adds r0, r4, 0
	bl sub_806D3B4
	ldr r1, _08122B00 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _08122AF4
	ldr r0, _08122B04 @ =sub_8122B10
	str r0, [r1]
	ldr r0, _08122B08 @ =0x0201b000
	ldr r1, _08122B0C @ =0x00000261
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	movs r0, 0x78
	bl PlaySE
_08122AF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122AFC: .4byte gUnknown_02023A00
_08122B00: .4byte gTasks
_08122B04: .4byte sub_8122B10
_08122B08: .4byte 0x0201b000
_08122B0C: .4byte 0x00000261
	thumb_func_end sub_8122AB8

	thumb_func_start sub_8122B10
sub_8122B10: @ 8122B10
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	mov r8, r0
	ldr r1, _08122B5C @ =gUnknown_02023A00
	mov r10, r1
	ldr r2, _08122B60 @ =gStringVar1
	mov r9, r2
_08122B2E:
	mov r1, r8
	lsls r0, r1, 5
	mov r2, r10
	adds r6, r0, r2
	ldrh r1, [r6]
	adds r7, r0, 0
	cmp r1, 0
	beq _08122BDA
	mov r4, r8
	adds r4, 0x3
	lsls r0, r4, 24
	lsrs r5, r0, 24
	ldrh r2, [r6, 0x10]
	ldrh r3, [r6, 0x12]
	adds r0, r5, 0
	movs r1, 0x3
	bl PartyMenuDoPrintHP
	ldrh r0, [r6, 0x10]
	cmp r0, 0
	bne _08122B64
	movs r2, 0x7
	b _08122B76
	.align 2, 0
_08122B5C: .4byte gUnknown_02023A00
_08122B60: .4byte gStringVar1
_08122B64:
	ldr r1, _08122B88 @ =gUnknown_02023A14
	adds r0, r7, r1
	ldr r0, [r0]
	bl pokemon_ailments_get_primary
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08122B8C
_08122B76:
	lsls r0, r4, 24
	lsrs r0, 24
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x3
	bl PartyMenuPutStatusTilemap
	b _08122B96
	.align 2, 0
_08122B88: .4byte gUnknown_02023A14
_08122B8C:
	ldrb r2, [r6, 0xF]
	adds r0, r5, 0
	movs r1, 0x3
	bl PartyMenuDoPrintLevel
_08122B96:
	mov r2, r10
	adds r6, r7, r2
	ldrh r0, [r6]
	ldrb r1, [r6, 0x1C]
	lsls r4, 24
	lsrs r4, 24
	ldr r2, _08122C0C @ =gUnknown_02023A04
	adds r5, r7, r2
	str r5, [sp]
	movs r2, 0x3
	adds r3, r4, 0
	bl PartyMenuDoPutNicknameTilemap
	mov r0, r9
	adds r1, r5, 0
	bl StringCopy
	mov r0, r9
	bl StringGetEnd10
	mov r0, r9
	bl SanitizeNameString
	adds r0, r4, 0
	movs r1, 0x3
	mov r2, r9
	bl box_print
	ldrh r2, [r6, 0x10]
	ldrh r3, [r6, 0x12]
	adds r0, r4, 0
	movs r1, 0x3
	bl PartyMenuDoDrawHPBar
_08122BDA:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x2
	bls _08122B2E
	ldr r1, _08122C10 @ =gTasks
	ldr r2, [sp, 0x4]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122C14 @ =sub_8122C18
	str r1, [r0]
	movs r1, 0
	strh r1, [r0, 0x8]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08122C0C: .4byte gUnknown_02023A04
_08122C10: .4byte gTasks
_08122C14: .4byte sub_8122C18
	thumb_func_end sub_8122B10

	thumb_func_start sub_8122C18
sub_8122C18: @ 8122C18
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08122C58 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bne _08122C4E
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08122C5C @ =sub_8122450
	str r0, [r4]
_08122C4E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122C58: .4byte gTasks
_08122C5C: .4byte sub_8122450
	thumb_func_end sub_8122C18

	thumb_func_start unref_sub_8122C60
unref_sub_8122C60: @ 8122C60
	push {r4,r5,lr}
	ldr r1, _08122C80 @ =0x0201b000
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x7
	bls _08122C76
	b _08122D8A
_08122C76:
	lsls r0, 2
	ldr r1, _08122C84 @ =_08122C88
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08122C80: .4byte 0x0201b000
_08122C84: .4byte _08122C88
	.align 2, 0
_08122C88:
	.4byte _08122CA8
	.4byte _08122CE8
	.4byte _08122CEE
	.4byte _08122D02
	.4byte _08122D2C
	.4byte _08122D32
	.4byte _08122D44
	.4byte _08122D5C
_08122CA8:
	ldr r0, _08122CD0 @ =0x00000266
	adds r5, r4, r0
	movs r1, 0
	ldrsh r3, [r5, r1]
	ldr r0, _08122CD4 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r3, r0
	bge _08122CDC
	movs r2, 0x98
	lsls r2, 2
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r5]
	movs r2, 0x64
	muls r2, r3
	ldr r3, _08122CD8 @ =gPlayerParty
	adds r2, r3
	bl TryCreatePartyMenuMonIcon
	b _08122D84
	.align 2, 0
_08122CD0: .4byte 0x00000266
_08122CD4: .4byte gPlayerPartyCount
_08122CD8: .4byte gPlayerParty
_08122CDC:
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _08122D50
_08122CE8:
	bl LoadHeldItemIconGraphics
	b _08122D48
_08122CEE:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl CreateHeldItemIcons_806DC34
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _08122D50
_08122D02:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _08122D28 @ =0x00000266
	adds r5, r4, r2
	ldrb r1, [r5]
	bl sub_806BD58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08122D84
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _08122D50
	.align 2, 0
_08122D28: .4byte 0x00000266
_08122D2C:
	bl PartyMenuPrintMonsLevelOrStatus
	b _08122D48
_08122D32:
	bl PrintPartyMenuMonNicknames
	ldr r1, _08122D40 @ =0x0201b000
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _08122D50
	.align 2, 0
_08122D40: .4byte 0x0201b000
_08122D44:
	bl sub_806BCE8
_08122D48:
	ldr r1, _08122D58 @ =0x0201b000
	movs r2, 0x99
	lsls r2, 2
	adds r1, r2
_08122D50:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _08122D8A
	.align 2, 0
_08122D58: .4byte 0x0201b000
_08122D5C:
	ldr r0, _08122D80 @ =0x00000266
	adds r5, r4, r0
	ldrb r0, [r5]
	bl sub_806B58C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08122D84
	movs r1, 0
	strh r1, [r5]
	movs r2, 0x99
	lsls r2, 2
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, 0x1
	b _08122D8C
	.align 2, 0
_08122D80: .4byte 0x00000266
_08122D84:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_08122D8A:
	movs r0, 0
_08122D8C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8122C60

	thumb_func_start sub_8122D94
sub_8122D94: @ 8122D94
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08122DCC @ =gLastFieldPokeMenuOpened
	ldrb r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08122DD0 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2D
	bl GetMonData
	adds r2, r0, 0
	cmp r2, 0
	bne _08122DE0
	ldr r1, _08122DD4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x10]
	ldr r1, _08122DD8 @ =gUnknown_08401810
	ldr r2, _08122DDC @ =gUnknown_084017F0
	movs r0, 0
	movs r3, 0
	bl sub_806E750
	b _08122DFA
	.align 2, 0
_08122DCC: .4byte gLastFieldPokeMenuOpened
_08122DD0: .4byte gPlayerParty
_08122DD4: .4byte gTasks
_08122DD8: .4byte gUnknown_08401810
_08122DDC: .4byte gUnknown_084017F0
_08122DE0:
	ldr r1, _08122E00 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x10]
	ldr r1, _08122E04 @ =gUnknown_08401810
	ldr r2, _08122E08 @ =gUnknown_084017F0
	movs r0, 0x1
	movs r3, 0
	bl sub_806E750
_08122DFA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122E00: .4byte gTasks
_08122E04: .4byte gUnknown_08401810
_08122E08: .4byte gUnknown_084017F0
	thumb_func_end sub_8122D94

	thumb_func_start sub_8122E0C
sub_8122E0C: @ 8122E0C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08122E34 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08122E9C
	adds r0, r4, 0
	bl sub_806BD80
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _08122E38
	cmp r0, 0x2
	beq _08122E84
	b _08122E9C
	.align 2, 0
_08122E34: .4byte gPaletteFade
_08122E38:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _08122E70 @ =gLastFieldPokeMenuOpened
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08122E74 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08122E78 @ =gStringVar1
	bl GetMonNickname
	adds r0, r4, 0
	bl sub_8122D94
	ldr r1, _08122E7C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08122E80 @ =sub_8122EAC
	str r1, [r0]
	b _08122E9C
	.align 2, 0
_08122E70: .4byte gLastFieldPokeMenuOpened
_08122E74: .4byte gPlayerParty
_08122E78: .4byte gStringVar1
_08122E7C: .4byte gTasks
_08122E80: .4byte sub_8122EAC
_08122E84:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08122EA4 @ =gLastFieldPokeMenuOpened
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, _08122EA8 @ =gSpecialVar_0x8004
	movs r0, 0xFF
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_8123138
_08122E9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08122EA4: .4byte gLastFieldPokeMenuOpened
_08122EA8: .4byte gSpecialVar_0x8004
	thumb_func_end sub_8122E0C

	thumb_func_start sub_8122EAC
sub_8122EAC: @ 8122EAC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	adds r4, r7, 0
	ldr r0, _08122EE8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r3, 0x80
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _08122F6A
	ldr r2, _08122EEC @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08122EF0
	bl GetMenuCursorPos
	lsls r0, 24
	cmp r0, 0
	beq _08122F6A
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _08122F6A
	.align 2, 0
_08122EE8: .4byte gPaletteFade
_08122EEC: .4byte gMain
_08122EF0:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _08122F12
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _08122F6A
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _08122F6A
_08122F12:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08122F5C
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08122F50 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrb r4, [r0, 0x10]
	ldr r5, _08122F54 @ =gUnknown_08401810
	ldr r6, _08122F58 @ =gUnknown_084017F0
	bl GetMenuCursorPos
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl PartyMenuGetPopupMenuFunc
	adds r1, r0, 0
	adds r0, r7, 0
	bl _call_via_r1
	b _08122F6A
	.align 2, 0
_08122F50: .4byte gTasks
_08122F54: .4byte gUnknown_08401810
_08122F58: .4byte gUnknown_084017F0
_08122F5C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08122F6A
	adds r0, r4, 0
	bl sub_81230F4
_08122F6A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8122EAC

	thumb_func_start sub_8122F70
sub_8122F70: @ 8122F70
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08122F88 @ =gSpecialVar_0x8004
	ldr r1, _08122F8C @ =gLastFieldPokeMenuOpened
	ldrb r1, [r1]
	strh r1, [r2]
	bl sub_8123138
	pop {r0}
	bx r0
	.align 2, 0
_08122F88: .4byte gSpecialVar_0x8004
_08122F8C: .4byte gLastFieldPokeMenuOpened
	thumb_func_end sub_8122F70

	thumb_func_start sub_8122F90
sub_8122F90: @ 8122F90
	push {r4,r5,lr}
	ldr r5, _08122FD8 @ =0x0201b260
	ldr r4, _08122FDC @ =gUnknown_020384F0
_08122F96:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08122FF0
	ldrb r0, [r5]
	ldrb r1, [r4]
	bl sub_806C994
	ldrb r0, [r5]
	movs r1, 0
	bl sub_806BF74
	ldrb r1, [r4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08122FE0 @ =gPlayerParty
	adds r0, r1
	ldr r1, _08122FE4 @ =gStringVar1
	bl GetMonNickname
	ldr r1, _08122FE8 @ =gLastFieldPokeMenuOpened
	ldrb r0, [r4]
	strb r0, [r1]
	ldrb r0, [r5]
	bl sub_8122D94
	ldr r0, _08122FEC @ =sub_806AEDC
	bl SetMainCallback2
	b _08122FFC
	.align 2, 0
_08122FD8: .4byte 0x0201b260
_08122FDC: .4byte gUnknown_020384F0
_08122FE0: .4byte gPlayerParty
_08122FE4: .4byte gStringVar1
_08122FE8: .4byte gLastFieldPokeMenuOpened
_08122FEC: .4byte sub_806AEDC
_08122FF0:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08122F96
_08122FFC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8122F90

	thumb_func_start sub_8123004
sub_8123004: @ 8123004
	push {lr}
	ldr r2, _08123028 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r2, _0812302C @ =sub_8122EAC
	movs r0, 0x6
	movs r1, 0xFF
	movs r3, 0x5
	bl sub_806AF4C
	ldr r0, _08123030 @ =sub_8122F90
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08123028: .4byte gPaletteFade
_0812302C: .4byte sub_8122EAC
_08123030: .4byte sub_8122F90
	thumb_func_end sub_8123004

	thumb_func_start sub_8123034
sub_8123034: @ 8123034
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _0812309C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08123092
	ldr r2, _081230A0 @ =gSprites
	ldr r1, _081230A4 @ =gTasks
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
	ldr r0, _081230A8 @ =0x0201b000
	ldr r1, _081230AC @ =0x00000262
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, _081230B0 @ =gPlayerParty
	ldr r1, _081230B4 @ =gPlayerPartyCount
	ldrb r2, [r1]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _081230B8 @ =sub_8123004
	str r5, [sp]
	adds r1, r4, 0
	bl ShowPokemonSummaryScreen
_08123092:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812309C: .4byte gPaletteFade
_081230A0: .4byte gSprites
_081230A4: .4byte gTasks
_081230A8: .4byte 0x0201b000
_081230AC: .4byte 0x00000262
_081230B0: .4byte gPlayerParty
_081230B4: .4byte gPlayerPartyCount
_081230B8: .4byte sub_8123004
	thumb_func_end sub_8123034

	thumb_func_start sub_81230BC
sub_81230BC: @ 81230BC
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
	ldr r1, _081230EC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _081230F0 @ =sub_8123034
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081230EC: .4byte gTasks
_081230F0: .4byte sub_8123034
	thumb_func_end sub_81230BC

	thumb_func_start sub_81230F4
sub_81230F4: @ 81230F4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x14
	movs r1, 0xA
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl HandleDestroyMenuCursors
	movs r0, 0xF
	movs r1, 0
	bl sub_806D538
	ldr r1, _08123130 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _08123134 @ =sub_8122E0C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123130: .4byte gTasks
_08123134: .4byte sub_8122E0C
	thumb_func_end sub_81230F4

	thumb_func_start sub_8123138
sub_8123138: @ 8123138
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
	ldr r1, _08123168 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0812316C @ =sub_8123170
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123168: .4byte gTasks
_0812316C: .4byte sub_8123170
	thumb_func_end sub_8123138

	thumb_func_start sub_8123170
sub_8123170: @ 8123170
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0812319C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08123194
	ldr r0, _081231A0 @ =gFieldCallback
	ldr r1, _081231A4 @ =sub_81231AC
	str r1, [r0]
	ldr r0, _081231A8 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_08123194:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812319C: .4byte gPaletteFade
_081231A0: .4byte gFieldCallback
_081231A4: .4byte sub_81231AC
_081231A8: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_8123170

	thumb_func_start sub_81231AC
sub_81231AC: @ 81231AC
	push {lr}
	bl pal_fill_black
	ldr r0, _081231C0 @ =sub_81231C4
	movs r1, 0xA
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_081231C0: .4byte sub_81231C4
	thumb_func_end sub_81231AC

	thumb_func_start sub_81231C4
sub_81231C4: @ 81231C4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _081231E4
	adds r0, r4, 0
	bl DestroyTask
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
_081231E4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81231C4

	.align 2, 0 @ Don't pad with nop.
