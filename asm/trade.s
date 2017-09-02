	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

.ifdef ENGLISH
	.set sub_804A96C_alt, sub_804A96C
.endif

	thumb_func_start sub_8049560
sub_8049560: @ 8049560
	push {r4-r7,lr}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r7]
	bl sub_8049514
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xC
	bne _080495B8
	ldr r5, _080495B0 @ =gUnknown_03004824
	ldr r0, [r5]
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080495B4 @ =gSprites
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r2, [r5]
	adds r2, 0x40
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xE0
	strh r1, [r0, 0x20]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xA0
	strh r1, [r0, 0x22]
	b _08049600
	.align 2, 0
_080495B0: .4byte gUnknown_03004824
_080495B4: .4byte gSprites
_080495B8:
	ldr r4, _08049614 @ =gUnknown_03004824
	ldr r0, [r4]
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08049618 @ =gSprites
	adds r0, r5
	movs r1, 0
	bl StartSpriteAnim
	ldr r4, [r4]
	adds r4, 0x40
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldr r2, _0804961C @ =gTradeMonSpriteCoords
	lsls r3, r6, 1
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r0, 0x20
	strh r0, [r1, 0x20]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r2, 0x1
	adds r3, r2
	ldrb r0, [r3]
	lsls r0, 3
	strh r0, [r1, 0x22]
_08049600:
	ldrb r0, [r7]
	cmp r0, r6
	beq _0804960C
	movs r0, 0x5
	bl PlaySE
_0804960C:
	strb r6, [r7]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049614: .4byte gUnknown_03004824
_08049618: .4byte gSprites
_0804961C: .4byte gTradeMonSpriteCoords
	thumb_func_end sub_8049560

	thumb_func_start sub_8049620
sub_8049620: @ 8049620
	push {r4,lr}
	movs r0, 0
	bl sub_804AA0C
	ldr r4, _08049668 @ =gUnknown_03004824
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x5
	strb r1, [r0]
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08049670
	ldr r2, [r4]
	adds r1, r2, 0
	adds r1, 0x8C
	ldr r0, _0804966C @ =0x0000aabb
	strh r0, [r1]
	adds r0, r2, 0
	adds r0, 0x41
	ldrb r1, [r0]
	adds r0, 0x4D
	strh r1, [r0]
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
	b _08049678
	.align 2, 0
_08049668: .4byte gUnknown_03004824
_0804966C: .4byte 0x0000aabb
_08049670:
	ldr r0, [r4]
	adds r0, 0x84
	movs r1, 0x1
	strb r1, [r0]
_08049678:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8049620

	thumb_func_start sub_8049680
sub_8049680: @ 8049680
	push {r4,lr}
	sub sp, 0x8
	ldr r0, _080496A0 @ =gMain
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080496A8
	ldr r0, _080496A4 @ =gUnknown_03004824
	ldr r0, [r0]
	adds r0, 0x41
	movs r1, 0
	bl sub_8049560
	b _080496F4
	.align 2, 0
_080496A0: .4byte gMain
_080496A4: .4byte gUnknown_03004824
_080496A8:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080496C4
	ldr r0, _080496C0 @ =gUnknown_03004824
	ldr r0, [r0]
	adds r0, 0x41
	movs r1, 0x1
	bl sub_8049560
	b _080496F4
	.align 2, 0
_080496C0: .4byte gUnknown_03004824
_080496C4:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080496E0
	ldr r0, _080496DC @ =gUnknown_03004824
	ldr r0, [r0]
	adds r0, 0x41
	movs r1, 0x2
	bl sub_8049560
	b _080496F4
	.align 2, 0
_080496DC: .4byte gUnknown_03004824
_080496E0:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080496F4
	ldr r0, _08049750 @ =gUnknown_03004824
	ldr r0, [r0]
	adds r0, 0x41
	movs r1, 0x3
	bl sub_8049560
_080496F4:
	ldr r0, _08049754 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080497B6
	movs r0, 0x5
	bl PlaySE
	ldr r4, _08049750 @ =gUnknown_03004824
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x41
	ldrb r1, [r1]
	cmp r1, 0x5
	bhi _0804975C
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0x12
	movs r2, 0xE
	movs r3, 0x1C
	bl DrawTextWindow
	ldr r3, _08049758 @ =gUnknown_0820C320
	movs r0, 0x13
	movs r1, 0xF
	movs r2, 0x2
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x13
	movs r2, 0xF
	movs r3, 0x2
	bl InitMenu
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x1
	strb r1, [r0]
	b _080497B6
	.align 2, 0
_08049750: .4byte gUnknown_03004824
_08049754: .4byte gMain
_08049758: .4byte gUnknown_0820C320
_0804975C:
	cmp r1, 0xB
	bhi _0804977A
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x2
	strb r1, [r0]
	b _080497B6
_0804977A:
	cmp r1, 0xC
	bne _080497B6
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0x18
	movs r2, 0xE
	movs r3, 0x1D
	bl DrawTextWindow
	movs r0, 0x18
	movs r1, 0xE
	movs r2, 0x4
	bl InitYesNoMenu
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x4
	strb r1, [r0]
	ldr r0, _080497F4 @ =gUnknown_0820C14C
	ldr r0, [r0, 0x10]
	ldr r1, [r4]
	adds r1, 0x7E
	ldrh r1, [r1]
	lsls r1, 5
	ldr r2, _080497F8 @ =0x06010000
	adds r1, r2
	movs r2, 0x14
	bl sub_804ACD8
_080497B6:
	ldr r0, _080497FC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080497EC
	movs r2, 0
	ldr r3, _08049800 @ =gUnknown_03004824
_080497C8:
	ldr r0, [r3]
	lsls r1, r2, 1
	adds r0, 0x8C
	adds r0, r1
	strh r2, [r0]
	adds r2, 0x1
	cmp r2, 0x9
	ble _080497C8
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08049800 @ =gUnknown_03004824
	ldr r1, [r1]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
_080497EC:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080497F4: .4byte gUnknown_0820C14C
_080497F8: .4byte 0x06010000
_080497FC: .4byte gMain
_08049800: .4byte gUnknown_03004824
	thumb_func_end sub_8049680

	thumb_func_start sub_8049804
sub_8049804: @ 8049804
	push {lr}
	bl HandleDestroyMenuCursors
	bl sub_804A80C
	ldr r3, _08049850 @ =gUnknown_03004824
	ldr r0, [r3]
	adds r0, 0x7B
	movs r1, 0
	strb r1, [r0]
	ldr r2, _08049854 @ =gSprites
	ldr r0, [r3]
	adds r0, 0x40
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
	ldr r0, _08049858 @ =gUnknown_0820C14C
	ldr r0, [r0, 0x4]
	ldr r1, [r3]
	adds r1, 0x7E
	ldrh r1, [r1]
	lsls r1, 5
	ldr r2, _0804985C @ =0x06010000
	adds r1, r2
	movs r2, 0x14
	bl sub_804ACD8
	pop {r0}
	bx r0
	.align 2, 0
_08049850: .4byte gUnknown_03004824
_08049854: .4byte gSprites
_08049858: .4byte gUnknown_0820C14C
_0804985C: .4byte 0x06010000
	thumb_func_end sub_8049804

	thumb_func_start sub_8049860
sub_8049860: @ 8049860
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0804987C @ =gMain
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08049880
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _08049890
	.align 2, 0
_0804987C: .4byte gMain
_08049880:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804989C
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_08049890:
	bl MoveMenuCursor
	ldr r1, _080498D8 @ =gUnknown_03004824
	ldr r1, [r1]
	adds r1, 0x7C
	strb r0, [r1]
_0804989C:
	ldr r0, _080498DC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08049938
	movs r0, 0x5
	bl PlaySE
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080498E0
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080498D8 @ =gUnknown_03004824
	ldr r0, [r0]
	adds r0, 0x7B
	movs r1, 0x2
	strb r1, [r0]
	b _0804994A
	.align 2, 0
_080498D8: .4byte gUnknown_03004824
_080498DC: .4byte gMain
_080498E0:
	ldr r4, _08049910 @ =gUnknown_03004824
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x51
	adds r1, r2, 0
	adds r1, 0x42
	ldrb r1, [r1]
	adds r2, 0x41
	ldrb r2, [r2]
	bl sub_80499F0
	lsls r0, 24
	cmp r0, 0
	bne _08049914
	movs r0, 0x3
	movs r1, 0x2
	bl sub_804AADC
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x8
	strb r1, [r0]
	b _0804994A
	.align 2, 0
_08049910: .4byte gUnknown_03004824
_08049914:
	bl sub_8049620
	ldr r2, _08049934 @ =gSprites
	ldr r0, [r4]
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0804994A
	.align 2, 0
_08049934: .4byte gSprites
_08049938:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0804994A
	movs r0, 0x5
	bl PlaySE
	bl sub_8049804
_0804994A:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8049860

	thumb_func_start sub_8049954
sub_8049954: @ 8049954
	push {lr}
	ldr r0, _08049978 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0804996A
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08049974
_0804996A:
	movs r0, 0x5
	bl PlaySE
	bl sub_8049804
_08049974:
	pop {r0}
	bx r0
	.align 2, 0
_08049978: .4byte gMain
	thumb_func_end sub_8049954

	thumb_func_start sub_804997C
sub_804997C: @ 804997C
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080499B4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080499E0
	ldr r0, _080499B8 @ =gUnknown_03004824
	ldr r2, [r0]
	adds r3, r2, 0
	adds r3, 0x41
	ldrb r1, [r3]
	cmp r1, 0x5
	bhi _080499C4
	ldr r0, _080499BC @ =gPlayerParty
	ldrb r1, [r3]
	adds r2, 0x42
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080499C0 @ =sub_80484F4
	movs r4, 0x4
	str r4, [sp]
	bl ShowPokemonSummaryScreen
	b _080499E0
	.align 2, 0
_080499B4: .4byte gPaletteFade
_080499B8: .4byte gUnknown_03004824
_080499BC: .4byte gPlayerParty
_080499C0: .4byte sub_80484F4
_080499C4:
	ldr r0, _080499E8 @ =gEnemyParty
	subs r1, 0x6
	lsls r1, 24
	lsrs r1, 24
	adds r2, 0x43
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080499EC @ =sub_80484F4
	movs r4, 0x4
	str r4, [sp]
	bl ShowPokemonSummaryScreen
_080499E0:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080499E8: .4byte gEnemyParty
_080499EC: .4byte sub_80484F4
	thumb_func_end sub_804997C

	thumb_func_start sub_80499F0
sub_80499F0: @ 80499F0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0
	movs r3, 0
	cmp r1, r4
	bge _08049A18
_08049A04:
	cmp r2, r3
	beq _08049A12
	adds r0, r5, r3
	ldrb r0, [r0]
	adds r0, r1, r0
	lsls r0, 24
	lsrs r1, r0, 24
_08049A12:
	adds r3, 0x1
	cmp r3, r4
	blt _08049A04
_08049A18:
	adds r0, r1, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80499F0

	thumb_func_start sub_8049A20
sub_8049A20: @ 8049A20
	push {r4,r5,lr}
	sub sp, 0xC
	movs r2, 0
	ldr r0, _08049A80 @ =gUnknown_03004824
	ldr r1, [r0]
	adds r3, r1, 0
	adds r3, 0x42
	adds r5, r0, 0
	ldrb r0, [r3]
	cmp r2, r0
	bge _08049A4C
	adds r4, r1, 0
	adds r4, 0x51
_08049A3A:
	mov r1, sp
	adds r0, r1, r2
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	ldrb r0, [r3]
	cmp r2, r0
	blt _08049A3A
_08049A4C:
	adds r4, r5, 0
	ldr r0, [r4]
	adds r1, r0, 0
	adds r1, 0x42
	ldrb r1, [r1]
	adds r0, 0x41
	ldrb r2, [r0]
	mov r0, sp
	bl sub_80499F0
	lsls r0, 24
	cmp r0, 0
	bne _08049A88
	movs r0, 0x3
	movs r1, 0x2
	bl sub_804AADC
	ldr r0, [r4]
	adds r0, 0x8C
	ldr r1, _08049A84 @ =0x0000bbcc
	strh r1, [r0]
	movs r0, 0xB4
	movs r1, 0
	bl sub_804AADC
	b _08049AB4
	.align 2, 0
_08049A80: .4byte gUnknown_03004824
_08049A84: .4byte 0x0000bbcc
_08049A88:
	movs r0, 0x3
	movs r1, 0x1
	bl sub_804AADC
	ldr r0, [r5]
	adds r0, 0x8C
	ldr r1, _08049ABC @ =0x0000bbbb
	strh r1, [r0]
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _08049AB4
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r5]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
_08049AB4:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049ABC: .4byte 0x0000bbbb
	thumb_func_end sub_8049A20

	thumb_func_start sub_8049AC0
sub_8049AC0: @ 8049AC0
	push {r4,lr}
	ldr r0, _08049ADC @ =gMain
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08049AE0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _08049AF0
	.align 2, 0
_08049ADC: .4byte gMain
_08049AE0:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08049AFC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_08049AF0:
	bl MoveMenuCursor
	ldr r1, _08049B20 @ =gUnknown_03004824
	ldr r1, [r1]
	adds r1, 0x7C
	strb r0, [r1]
_08049AFC:
	ldr r0, _08049B24 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08049B64
	movs r0, 0x5
	bl PlaySE
	bl GetMenuCursorPos
	lsls r0, 24
	cmp r0, 0
	bne _08049B28
	bl sub_8049A20
	b _08049B56
	.align 2, 0
_08049B20: .4byte gUnknown_03004824
_08049B24: .4byte gMain
_08049B28:
	movs r0, 0x3
	movs r1, 0x1
	bl sub_804AADC
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _08049B56
	ldr r4, _08049B5C @ =gUnknown_03004824
	ldr r0, [r4]
	adds r0, 0x8C
	ldr r1, _08049B60 @ =0x0000bbcc
	strh r1, [r0]
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
_08049B56:
	ldr r0, _08049B5C @ =gUnknown_03004824
	ldr r0, [r0]
	b _08049BAA
	.align 2, 0
_08049B5C: .4byte gUnknown_03004824
_08049B60: .4byte 0x0000bbcc
_08049B64:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08049BB0
	movs r0, 0x3
	movs r1, 0x1
	bl sub_804AADC
	bl GetMenuCursorPos
	lsls r0, 24
	cmp r0, 0
	bne _08049B8C
	movs r0, 0x1
	bl MoveMenuCursor
	ldr r1, _08049BB8 @ =gUnknown_03004824
	ldr r1, [r1]
	adds r1, 0x7C
	strb r0, [r1]
_08049B8C:
	ldr r4, _08049BB8 @ =gUnknown_03004824
	ldr r0, [r4]
	adds r0, 0x8C
	ldr r1, _08049BBC @ =0x0000bbcc
	strh r1, [r0]
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
	ldr r0, [r4]
_08049BAA:
	adds r0, 0x7B
	movs r1, 0x64
	strb r1, [r0]
_08049BB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049BB8: .4byte gUnknown_03004824
_08049BBC: .4byte 0x0000bbcc
	thumb_func_end sub_8049AC0

	thumb_func_start sub_8049BC0
sub_8049BC0: @ 8049BC0
	push {r4,r5,lr}
	ldr r0, _08049BDC @ =gMain
	ldrh r1, [r0, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08049BE0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _08049BF0
	.align 2, 0
_08049BDC: .4byte gMain
_08049BE0:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08049BFC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_08049BF0:
	bl MoveMenuCursor
	ldr r1, _08049C5C @ =gUnknown_03004824
	ldr r1, [r1]
	adds r1, 0x7C
	strb r0, [r1]
_08049BFC:
	ldr r0, _08049C60 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08049C72
	movs r0, 0x5
	bl PlaySE
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08049C6C
	movs r0, 0x4
	bl sub_804AA0C
	ldr r4, _08049C5C @ =gUnknown_03004824
	ldr r0, [r4]
	adds r2, r0, 0
	adds r2, 0x8C
	ldr r1, _08049C64 @ =0x0000eeaa
	strh r1, [r2]
	adds r0, 0x8E
	strh r5, [r0]
	movs r0, 0x5
	movs r1, 0
	bl sub_804AADC
	ldr r2, _08049C68 @ =gSprites
	ldr r0, [r4]
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x64
	strb r1, [r0]
	b _08049C84
	.align 2, 0
_08049C5C: .4byte gUnknown_03004824
_08049C60: .4byte gMain
_08049C64: .4byte 0x0000eeaa
_08049C68: .4byte gSprites
_08049C6C:
	bl sub_8049804
	b _08049C84
_08049C72:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08049C84
	movs r0, 0x5
	bl PlaySE
	bl sub_8049804
_08049C84:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8049BC0

	thumb_func_start sub_8049C8C
sub_8049C8C: @ 8049C8C
	push {r4,lr}
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	bne _08049CAE
	ldr r4, _08049CC0 @ =gUnknown_03004824
	ldr r0, [r4]
	adds r0, 0x41
	ldrb r0, [r0]
	bl sub_8049E9C
	ldr r0, [r4]
	adds r0, 0x8A
	ldrb r0, [r0]
	bl sub_8049E9C
_08049CAE:
	ldr r0, _08049CC0 @ =gUnknown_03004824
	ldr r0, [r0]
	adds r0, 0x7B
	movs r1, 0x7
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049CC0: .4byte gUnknown_03004824
	thumb_func_end sub_8049C8C

	thumb_func_start sub_8049CC4
sub_8049CC4: @ 8049CC4
	push {r4,lr}
	ldr r4, _08049CE8 @ =gUnknown_03004824
	ldr r0, [r4]
	adds r0, 0x80
	ldrh r1, [r0]
	ldr r0, _08049CEC @ =0x00000505
	cmp r1, r0
	bne _08049CE0
	bl sub_8049088
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0xE
	strb r1, [r0]
_08049CE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049CE8: .4byte gUnknown_03004824
_08049CEC: .4byte 0x00000505
	thumb_func_end sub_8049CC4

	thumb_func_start DisplayMessageAndContinueTask
DisplayMessageAndContinueTask: @ 8049CF0
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08049D40 @ =gUnknown_03004824
	ldr r1, [r4]
	adds r1, 0xB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0xB4
	ldrb r0, [r0]
	cmp r0, 0x78
	bls _08049D36
	adds r0, r1, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0x18
	movs r2, 0xE
	movs r3, 0x1D
	bl DrawTextWindow
	movs r0, 0x18
	movs r1, 0xE
	movs r2, 0x4
	bl InitYesNoMenu
	ldr r0, [r4]
	adds r0, 0xB4
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0x7B
	movs r1, 0x3
	strb r1, [r0]
_08049D36:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049D40: .4byte gUnknown_03004824
	thumb_func_end DisplayMessageAndContinueTask

	thumb_func_start sub_8049D44
sub_8049D44: @ 8049D44
	push {lr}
	ldr r0, _08049D90 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08049D8A
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_804A840
	movs r0, 0x1
	bl sub_804A840
	ldr r2, _08049D94 @ =gUnknown_03004824
	ldr r0, [r2]
	adds r0, 0x7B
	movs r1, 0
	strb r1, [r0]
	ldr r3, _08049D98 @ =gSprites
	ldr r0, [r2]
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_08049D8A:
	pop {r0}
	bx r0
	.align 2, 0
_08049D90: .4byte gMain
_08049D94: .4byte gUnknown_03004824
_08049D98: .4byte gSprites
	thumb_func_end sub_8049D44

	thumb_func_start sub_8049D9C
sub_8049D9C: @ 8049D9C
	push {lr}
	ldr r0, _08049DBC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08049DB8
	bl sub_800832C
	ldr r0, _08049DC0 @ =gUnknown_03004824
	ldr r0, [r0]
	adds r0, 0x7B
	movs r1, 0xC
	strb r1, [r0]
_08049DB8:
	pop {r0}
	bx r0
	.align 2, 0
_08049DBC: .4byte gPaletteFade
_08049DC0: .4byte gUnknown_03004824
	thumb_func_end sub_8049D9C

	thumb_func_start sub_8049DC4
sub_8049DC4: @ 8049DC4
	push {lr}
	ldr r0, _08049DD8 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _08049DD4
	ldr r0, _08049DDC @ =sub_805465C
	bl SetMainCallback2
_08049DD4:
	pop {r0}
	bx r0
	.align 2, 0
_08049DD8: .4byte gReceivedRemoteLinkPlayers
_08049DDC: .4byte sub_805465C
	thumb_func_end sub_8049DC4

	thumb_func_start sub_8049DE0
sub_8049DE0: @ 8049DE0
	push {lr}
	ldr r0, _08049DF8 @ =gUnknown_03004824
	ldr r0, [r0]
	adds r0, 0x7B
	ldrb r0, [r0]
	cmp r0, 0xF
	bhi _08049E98
	lsls r0, 2
	ldr r1, _08049DFC @ =_08049E00
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08049DF8: .4byte gUnknown_03004824
_08049DFC: .4byte _08049E00
	.align 2, 0
_08049E00:
	.4byte _08049E40
	.4byte _08049E46
	.4byte _08049E4C
	.4byte _08049E52
	.4byte _08049E58
	.4byte _08049E98
	.4byte _08049E5E
	.4byte _08049E64
	.4byte _08049E6A
	.4byte _08049E70
	.4byte _08049E76
	.4byte _08049E7C
	.4byte _08049E82
	.4byte _08049E88
	.4byte _08049E8E
	.4byte _08049E94
_08049E40:
	bl sub_8049680
	b _08049E98
_08049E46:
	bl sub_8049860
	b _08049E98
_08049E4C:
	bl sub_804997C
	b _08049E98
_08049E52:
	bl sub_8049AC0
	b _08049E98
_08049E58:
	bl sub_8049BC0
	b _08049E98
_08049E5E:
	bl sub_8049C8C
	b _08049E98
_08049E64:
	bl sub_8049CC4
	b _08049E98
_08049E6A:
	bl sub_8049D44
	b _08049E98
_08049E70:
	bl sub_8048A14
	b _08049E98
_08049E76:
	bl sub_8048A50
	b _08049E98
_08049E7C:
	bl sub_8049D9C
	b _08049E98
_08049E82:
	bl sub_8049DC4
	b _08049E98
_08049E88:
	bl sub_8048A90
	b _08049E98
_08049E8E:
	bl DisplayMessageAndContinueTask
	b _08049E98
_08049E94:
	bl sub_8049954
_08049E98:
	pop {r0}
	bx r0
	thumb_func_end sub_8049DE0

	thumb_func_start sub_8049E9C
sub_8049E9C: @ 8049E9C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0x6
	bl __udivsi3
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, _08049ED0 @ =gUnknown_03004824
	ldr r0, [r3]
	adds r0, 0x80
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	bne _08049EC8
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, [r3]
	adds r0, 0x82
	adds r0, r2
	strb r4, [r0]
_08049EC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08049ED0: .4byte gUnknown_03004824
	thumb_func_end sub_8049E9C

	thumb_func_start sub_8049ED4
sub_8049ED4: @ 8049ED4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x74
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _08049F24 @ =gUnknown_03004824
	ldr r5, [r0]
	adds r0, r5, 0
	adds r0, 0x82
	add r0, r10
	ldrb r0, [r0]
	movs r1, 0x1
	str r1, [sp, 0x6C]
	cmp r0, 0x5
	bhi _08049EFE
	movs r2, 0
	str r2, [sp, 0x6C]
_08049EFE:
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r5, 0
	adds r0, 0x80
	mov r1, r10
	adds r3, r0, r1
	ldrb r0, [r3]
	cmp r0, 0x2
	bne _08049F1A
	b _0804A0AC
_08049F1A:
	cmp r0, 0x2
	bgt _08049F28
	cmp r0, 0x1
	beq _08049F36
	b _0804A294
	.align 2, 0
_08049F24: .4byte gUnknown_03004824
_08049F28:
	cmp r0, 0x3
	bne _08049F2E
	b _0804A0E4
_08049F2E:
	cmp r0, 0x4
	bne _08049F34
	b _0804A244
_08049F34:
	b _0804A294
_08049F36:
	movs r4, 0
	adds r0, r5, 0
	adds r0, 0x42
	add r0, r10
	ldr r7, _0804A094 @ =gSprites
	ldr r2, [sp, 0x6C]
	lsls r2, 1
	mov r9, r2
	ldr r3, _0804A098 @ =gTradeMonSpriteCoords
	mov r12, r3
	mov r5, r10
	lsls r5, 4
	str r5, [sp, 0x70]
	ldrb r0, [r0]
	cmp r4, r0
	bcs _08049F8E
	adds r6, r7, 0
	ldr r2, _0804A09C @ =gUnknown_03004824
	ldr r0, [sp, 0x6C]
	add r0, r9
	lsls r3, r0, 1
	movs r5, 0x4
_08049F62:
	ldr r0, [r2]
	adds r1, r4, r3
	adds r0, 0x34
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r5
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, [r2]
	adds r0, 0x42
	add r0, r10
	ldrb r0, [r0]
	cmp r4, r0
	bcc _08049F62
_08049F8E:
	ldr r1, _0804A09C @ =gUnknown_03004824
	ldr r0, [r1]
	ldr r5, [sp, 0x6C]
	add r5, r9
	lsls r3, r5, 1
	mov r2, r8
	adds r6, r2, r3
	adds r0, 0x34
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r0, _0804A09C @ =gUnknown_03004824
	ldr r4, [r0]
	adds r4, 0x34
	adds r4, r6
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	movs r1, 0x14
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	lsls r5, 2
	mov r1, r12
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r3, 0x1
	lsls r3, 1
	add r3, r12
	ldrb r1, [r3]
	adds r0, r1
	asrs r0, 1
	lsls r0, 3
	adds r0, 0xE
	strh r0, [r2, 0x32]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	mov r0, r12
	adds r0, 0x1
	adds r5, r0
	ldrb r0, [r5]
	lsls r0, 3
	subs r0, 0xC
	strh r0, [r1, 0x36]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldr r1, _0804A0A0 @ =sub_809D62C
	bl oamt_set_x3A_32
	ldr r2, _0804A09C @ =gUnknown_03004824
	ldr r1, [r2]
	adds r1, 0x80
	add r1, r10
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, 0x34
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	bl sub_8078A34
	bl HandleDestroyMenuCursors
	ldr r3, _0804A09C @ =gUnknown_03004824
	ldr r0, [r3]
	adds r0, 0x4
	ldr r1, _0804A0A4 @ =gUnknown_0820C330
	mov r5, r9
	adds r2, r5, r1
	ldrb r2, [r2]
	adds r1, 0x1
	add r1, r9
	ldrb r1, [r1]
	str r1, [sp]
	movs r1, 0x13
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl FillWindowRect_DefaultPalette
	ldr r1, _0804A09C @ =gUnknown_03004824
	ldr r0, [r1]
	adds r0, 0xC8
	ldr r2, [sp, 0x70]
	mov r3, r10
	subs r1, r2, r3
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0804A0A8 @ =gTradePartyBoxTilemap
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x11
	str r2, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	movs r2, 0
	bl sub_804A96C_alt
	ldr r0, [sp, 0x6C]
	cmp r0, 0
	beq _0804A08C
	b _0804A294
_0804A08C:
	bl sub_804A80C
	b _0804A294
	.align 2, 0
_0804A094: .4byte gSprites
_0804A098: .4byte gTradeMonSpriteCoords
_0804A09C: .4byte gUnknown_03004824
_0804A0A0: .4byte sub_809D62C
_0804A0A4: .4byte gUnknown_0820C330
_0804A0A8: .4byte gTradePartyBoxTilemap
_0804A0AC:
	ldr r2, _0804A0DC @ =gSprites
	ldr r1, [sp, 0x6C]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	add r0, r8
	adds r1, r5, 0
	adds r1, 0x34
	adds r1, r0
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0804A0E0 @ =sub_809D62C
	cmp r1, r0
	beq _0804A0D4
	b _0804A294
_0804A0D4:
	movs r0, 0x3
	strb r0, [r3]
	b _0804A294
	.align 2, 0
_0804A0DC: .4byte gSprites
_0804A0E0: .4byte sub_809D62C
_0804A0E4:
	adds r0, r5, 0
	adds r0, 0xC8
	ldr r2, [sp, 0x6C]
	lsls r1, r2, 4
	subs r1, r2
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _0804A228 @ =gTradeMovesBoxTilemap
	movs r2, 0xF
	str r2, [sp]
	movs r7, 0x11
	str r7, [sp, 0x4]
	movs r5, 0
	str r5, [sp, 0x8]
	movs r2, 0
	bl sub_804A96C_alt
	ldr r0, _0804A22C @ =gUnknown_03004824
	ldr r3, [r0]
	ldr r1, [sp, 0x6C]
	lsls r6, r1, 1
	adds r1, r6
	mov r9, r1
	lsls r1, 1
	mov r2, r8
	adds r0, r2, r1
	adds r3, 0x34
	adds r3, r0
	ldrb r0, [r3]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r5, _0804A230 @ =gSprites
	adds r2, r5
	ldr r4, _0804A234 @ =gTradeMonSpriteCoords
	mov r0, r9
	lsls r5, r0, 2
	adds r0, r5, r4
	ldrb r0, [r0]
	adds r1, 0x1
	lsls r1, 1
	adds r1, r4
	ldrb r1, [r1]
	adds r0, r1
	asrs r0, 1
	lsls r0, 3
	adds r0, 0xE
	strh r0, [r2, 0x20]
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r2, _0804A230 @ =gSprites
	adds r1, r2
	adds r4, 0x1
	adds r5, r4
	ldrb r0, [r5]
	lsls r0, 3
	subs r0, 0xC
	strh r0, [r1, 0x22]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r5, 0
	strh r5, [r0, 0x24]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x26]
	mov r0, sp
	adds r0, 0x12
	ldr r1, [sp, 0x6C]
	mov r2, r8
	bl sub_804A2B4
	add r1, sp, 0xC
	movs r3, 0xFC
	strb r3, [r1]
	adds r2, r1, 0
	movs r1, 0x6
	strb r1, [r2, 0x1]
	movs r1, 0x4
	strb r1, [r2, 0x2]
	adds r1, r2, 0
	strb r3, [r1, 0x3]
	strb r7, [r1, 0x4]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x40
	subs r1, r0
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	strb r1, [r2, 0x5]
	ldr r0, _0804A22C @ =gUnknown_03004824
	ldr r1, [r0]
	adds r0, r1, 0x4
	adds r1, 0x7A
	ldrb r2, [r1]
	mov r1, r9
	lsls r1, 6
	mov r9, r1
	add r2, r9
	ldr r4, _0804A238 @ =gUnknown_0820C334
	ldr r3, [sp, 0x6C]
	lsls r1, r3, 2
	adds r3, r1, r4
	ldrb r3, [r3]
	ldr r5, _0804A23C @ =gUnknown_0820C334 + 0x1
	adds r1, r5
	ldrb r1, [r1]
	str r1, [sp]
	add r1, sp, 0xC
	bl sub_8003460
	add r7, sp, 0x34
	adds r0, r7, 0
	ldr r1, [sp, 0x6C]
	mov r2, r8
	bl sub_804A33C
	ldr r0, _0804A22C @ =gUnknown_03004824
	ldr r2, [r0]
	adds r0, r2, 0x4
	ldr r1, _0804A240 @ =gOtherText_Terminator2
	adds r2, 0x7A
	ldrb r2, [r2]
	add r2, r9
	adds r2, 0x20
	adds r6, 0x1
	lsls r6, 1
	adds r4, r6, r4
	ldrb r5, [r4]
	ldr r3, _0804A23C @ =gUnknown_0820C334 + 0x1
	adds r6, r3
	ldrb r4, [r6]
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp]
	adds r3, r5, 0
	bl sub_8003460
	ldr r0, _0804A22C @ =gUnknown_03004824
	ldr r1, [r0]
	adds r0, r1, 0x4
	adds r1, 0x7A
	ldrb r2, [r1]
	add r2, r9
	adds r2, 0x26
	str r4, [sp]
	adds r1, r7, 0
	adds r3, r5, 0
	bl sub_8003460
	ldr r2, _0804A22C @ =gUnknown_03004824
	ldr r1, [r2]
	b _0804A28A
	.align 2, 0
_0804A228: .4byte gTradeMovesBoxTilemap
_0804A22C: .4byte gUnknown_03004824
_0804A230: .4byte gSprites
_0804A234: .4byte gTradeMonSpriteCoords
_0804A238: .4byte gUnknown_0820C334
_0804A23C: .4byte gUnknown_0820C334 + 0x1
_0804A240: .4byte gOtherText_Terminator2
_0804A244:
	ldr r0, _0804A2A4 @ =gUnknown_0820C14C
	ldr r0, [r0, 0x14]
	adds r1, r5, 0
	adds r1, 0x7E
	ldrh r1, [r1]
	lsls r1, 5
	ldr r3, _0804A2A8 @ =0x06010000
	adds r1, r3
	movs r2, 0x14
	bl sub_804ACD8
	ldr r0, _0804A2AC @ =gUnknown_0820C3D1
	mov r5, r10
	lsls r1, r5, 1
	adds r4, r1, r0
	ldrb r2, [r4]
	adds r2, 0x4
	lsls r2, 24
	lsrs r2, 24
	adds r0, 0x1
	adds r1, r0
	ldrb r3, [r1]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4]
	str r0, [sp]
	ldrb r0, [r1]
	str r0, [sp, 0x4]
	mov r0, r10
	mov r1, r8
	bl sub_804A51C
	ldr r0, _0804A2B0 @ =gUnknown_03004824
	ldr r1, [r0]
_0804A28A:
	adds r1, 0x80
	add r1, r10
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804A294:
	add sp, 0x74
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A2A4: .4byte gUnknown_0820C14C
_0804A2A8: .4byte 0x06010000
_0804A2AC: .4byte gUnknown_0820C3D1
_0804A2B0: .4byte gUnknown_03004824
	thumb_func_end sub_8049ED4

	thumb_func_start sub_804A2B4
sub_804A2B4: @ 804A2B4
	push {r4,r5,lr}
	sub sp, 0xC
	adds r5, r0, 0
	lsls r1, 24
	lsls r2, 24
	lsrs r2, 24
	cmp r1, 0
	bne _0804A2F4
	movs r0, 0x64
	adds r4, r2, 0
	muls r4, r0
	ldr r0, _0804A2F0 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	adds r0, r5, 0
	mov r1, sp
	bl StringCopy10
	adds r0, r4, 0
	bl GetMonGender
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	b _0804A31E
	.align 2, 0
_0804A2F0: .4byte gPlayerParty
_0804A2F4:
	movs r0, 0x64
	adds r4, r2, 0
	muls r4, r0
	ldr r0, _0804A334 @ =gEnemyParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	adds r0, r5, 0
	mov r1, sp
	bl StringCopy10
	adds r0, r4, 0
	bl GetMonGender
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
_0804A31E:
	ldr r0, _0804A338 @ =gWindowConfig_81E7294
	adds r1, r5, 0
	bl GetStringWidthGivenWindowConfig
	lsls r0, 24
	lsrs r0, 24
	add sp, 0xC
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0804A334: .4byte gEnemyParty
_0804A338: .4byte gWindowConfig_81E7294
	thumb_func_end sub_804A2B4

	thumb_func_start sub_804A33C
sub_804A33C: @ 804A33C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _0804A384 @ =gUnknown_03004824
	ldr r1, [r0]
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 1
	adds r0, r2, r0
	adds r1, 0x5D
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _0804A3F4
	movs r4, 0
	movs r0, 0x64
	adds r5, r2, 0
	muls r5, r0
	ldr r0, _0804A388 @ =gPlayerParty
	mov r9, r0
	ldr r2, _0804A38C @ =gEnemyParty
	mov r8, r2
_0804A376:
	cmp r7, 0
	bne _0804A390
	adds r1, r4, 0
	adds r1, 0xD
	mov r2, r9
	b _0804A396
	.align 2, 0
_0804A384: .4byte gUnknown_03004824
_0804A388: .4byte gPlayerParty
_0804A38C: .4byte gEnemyParty
_0804A390:
	adds r1, r4, 0
	adds r1, 0xD
	mov r2, r8
_0804A396:
	adds r0, r5, r2
	movs r2, 0
	bl GetMonData
	lsls r1, r4, 1
	add r1, sp
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _0804A376
	ldr r1, _0804A3E8 @ =gOtherText_Terminator
	adds r0, r6, 0
	bl StringCopy
	movs r4, 0
_0804A3B8:
	lsls r0, r4, 1
	mov r2, sp
	adds r1, r2, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _0804A3D4
	adds r1, r0, 0
	movs r0, 0xD
	muls r1, r0
	ldr r0, _0804A3EC @ =gMoveNames
	adds r1, r0
	adds r0, r6, 0
	bl StringAppend
_0804A3D4:
	adds r0, r6, 0
	ldr r1, _0804A3F0 @ =gOtherText_ControlAndMiscText
	bl StringAppend
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _0804A3B8
	b _0804A404
	.align 2, 0
_0804A3E8: .4byte gOtherText_Terminator
_0804A3EC: .4byte gMoveNames
_0804A3F0: .4byte gOtherText_ControlAndMiscText
_0804A3F4:
	ldr r1, _0804A414 @ =gOtherText_Terminator
	adds r0, r6, 0
	bl StringCopy
	ldr r1, _0804A418 @ =gOtherText_FourQuestions
	adds r0, r6, 0
	bl StringAppend
_0804A404:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A414: .4byte gOtherText_Terminator
_0804A418: .4byte gOtherText_FourQuestions
	thumb_func_end sub_804A33C

	thumb_func_start sub_804A41C
sub_804A41C: @ 804A41C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x44
	lsls r0, 24
	lsrs r5, r0, 24
	add r3, sp, 0x1C
	movs r2, 0
	movs r1, 0xFC
	strb r1, [r3]
	movs r0, 0x6
	strb r0, [r3, 0x1]
	movs r0, 0x4
	strb r0, [r3, 0x2]
	strb r1, [r3, 0x3]
	movs r0, 0x11
	strb r0, [r3, 0x4]
	strb r2, [r3, 0x5]
	movs r6, 0
	ldr r1, _0804A470 @ =gUnknown_03004824
	ldr r0, [r1]
	adds r0, 0x42
	adds r0, r5
	ldrb r0, [r0]
	cmp r6, r0
	bcs _0804A504
	mov r8, r3
	adds r7, r1, 0
	ldr r0, _0804A474 @ =gTradeMonSpriteCoords
	mov r9, r0
	movs r4, 0x1
	add r4, r9
	mov r10, r4
_0804A462:
	cmp r5, 0
	bne _0804A47C
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _0804A478 @ =gPlayerParty
	b _0804A484
	.align 2, 0
_0804A470: .4byte gUnknown_03004824
_0804A474: .4byte gTradeMonSpriteCoords
_0804A478: .4byte gPlayerParty
_0804A47C:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _0804A514 @ =gEnemyParty
_0804A484:
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x2
	add r2, sp, 0x4
	bl GetMonData
	mov r0, sp
	adds r0, 0x22
	add r1, sp, 0x4
	bl StringCopy10
	adds r0, r4, 0
	bl GetMonGender
	mov r1, sp
	adds r1, 0x22
	ldr r0, _0804A518 @ =gWindowConfig_81E7294
	bl GetStringWidthGivenWindowConfig
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x32
	subs r1, r0
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	mov r0, r8
	strb r1, [r0, 0x5]
	ldr r1, [r7]
	adds r0, r1, 0x4
	adds r1, 0x7A
	lsls r2, r5, 5
	adds r2, r5
	lsls r2, 2
	ldrb r1, [r1]
	adds r2, r1
	movs r1, 0x16
	muls r1, r6
	adds r2, r1
	lsls r2, 16
	lsrs r2, 16
	lsls r1, r5, 1
	adds r1, r5
	lsls r1, 1
	adds r1, r6, r1
	lsls r1, 1
	mov r4, r9
	adds r3, r1, r4
	ldrb r3, [r3]
	add r1, r10
	ldrb r1, [r1]
	str r1, [sp]
	mov r1, r8
	bl sub_8003460
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, [r7]
	adds r0, 0x42
	adds r0, r5
	ldrb r0, [r0]
	cmp r6, r0
	bcc _0804A462
_0804A504:
	add sp, 0x44
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A514: .4byte gEnemyParty
_0804A518: .4byte gWindowConfig_81E7294
	thumb_func_end sub_804A41C

	thumb_func_start sub_804A51C
sub_804A51C: @ 804A51C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	ldr r4, [sp, 0x48]
	ldr r5, [sp, 0x4C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x24]
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0804A59C @ =gUnknown_03004824
	ldr r0, [r0]
	adds r0, 0xC8
	ldr r3, _0804A5A0 @ =gTradeMonBoxTilemap
	movs r1, 0x6
	str r1, [sp]
	movs r1, 0x3
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_804A96C
	mov r0, r8
	cmp r0, 0
	bne _0804A5A8
	movs r0, 0x64
	mov r4, r9
	muls r4, r0
	ldr r0, _0804A5A4 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	movs r1, 0x2
	add r2, sp, 0xC
	bl GetMonData
	b _0804A5D4
	.align 2, 0
_0804A59C: .4byte gUnknown_03004824
_0804A5A0: .4byte gTradeMonBoxTilemap
_0804A5A4: .4byte gPlayerParty
_0804A5A8:
	movs r0, 0x64
	mov r4, r9
	muls r4, r0
	ldr r0, _0804A65C @ =gEnemyParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r4, 0
	movs r1, 0x2
	add r2, sp, 0xC
	bl GetMonData
_0804A5D4:
	ldr r1, _0804A660 @ =gUnknown_03004824
	ldr r5, [r1]
	mov r3, r8
	lsls r0, r3, 1
	add r0, r8
	lsls r0, 1
	add r0, r9
	adds r1, r5, 0
	adds r1, 0x5D
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0
	bne _0804A690
	adds r0, r6, 0
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, [sp, 0x24]
	lsls r2, r0, 5
	cmp r4, 0
	beq _0804A614
	mov r1, r10
	adds r0, r1, r2
	lsls r0, 1
	adds r1, r5, 0
	adds r1, 0xDA
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x60
	strh r0, [r1]
_0804A614:
	ldr r3, _0804A660 @ =gUnknown_03004824
	ldr r4, [r3]
	mov r0, r10
	adds r5, r0, r2
	adds r0, r5, 0x1
	lsls r0, 1
	adds r4, 0xDA
	adds r4, r0
	adds r0, r6, 0
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x70
	strh r0, [r4]
	cmp r7, 0
	bne _0804A664
	add r0, sp, 0xC
	movs r1, 0
	bl NameHasGenderSymbol
	lsls r0, 24
	cmp r0, 0
	bne _0804A6CC
	ldr r3, _0804A660 @ =gUnknown_03004824
	ldr r1, [r3]
	adds r0, r5, 0
	subs r0, 0x1F
	lsls r0, 1
	adds r1, 0xDA
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x1
	b _0804A6CA
	.align 2, 0
_0804A65C: .4byte gEnemyParty
_0804A660: .4byte gUnknown_03004824
_0804A664:
	cmp r7, 0xFE
	bne _0804A6CC
	add r0, sp, 0xC
	movs r1, 0xFE
	bl NameHasGenderSymbol
	lsls r0, 24
	cmp r0, 0
	bne _0804A6CC
	ldr r0, _0804A68C @ =gUnknown_03004824
	ldr r1, [r0]
	adds r0, r5, 0
	subs r0, 0x1F
	lsls r0, 1
	adds r1, 0xDA
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x2
	b _0804A6CA
	.align 2, 0
_0804A68C: .4byte gUnknown_03004824
_0804A690:
	ldr r1, [sp, 0x24]
	lsls r0, r1, 5
	mov r1, r10
	adds r3, r1, r0
	adds r1, r3, 0
	subs r1, 0x20
	lsls r1, 1
	adds r2, r5, 0
	adds r2, 0xDA
	adds r1, r2, r1
	adds r0, r3, 0
	subs r0, 0x21
	lsls r0, 1
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, r3, 0
	subs r1, 0x1F
	lsls r1, 1
	adds r1, r2, r1
	adds r0, r3, 0
	subs r0, 0x24
	lsls r0, 1
	adds r2, r0
	ldrh r2, [r2]
	movs r3, 0x80
	lsls r3, 3
	adds r0, r3, 0
	orrs r0, r2
_0804A6CA:
	strh r0, [r1]
_0804A6CC:
.ifdef GERMAN
	ldr r0, _0804A6E8 @ =gUnknown_03004824
	ldr r0, [r0]
	adds r0, 0xD8
	movs r1, 0x1
	strb r1, [r0]
.endif
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
.ifdef GERMAN
	.align 2, 0
_0804A6E8: .4byte gUnknown_03004824
.endif
	thumb_func_end sub_804A51C

	thumb_func_start sub_804A6DC
sub_804A6DC: @ 804A6DC
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	movs r7, 0
	ldr r0, _0804A734 @ =gUnknown_03004824
	ldr r0, [r0]
	adds r0, 0x42
	adds r0, r6
	ldrb r0, [r0]
	cmp r7, r0
	bge _0804A72C
	lsls r0, r6, 1
	adds r0, r6
	ldr r1, _0804A738 @ =gTradeLevelDisplayCoords
	lsls r0, 2
	adds r5, r0, r1
	ldr r1, _0804A73C @ =gTradeMonBoxCoords
	adds r4, r0, r1
_0804A702:
	lsls r1, r7, 24
	lsrs r1, 24
	ldrb r2, [r5]
	ldrb r3, [r5, 0x1]
	ldrb r0, [r4]
	str r0, [sp]
	ldrb r0, [r4, 0x1]
	str r0, [sp, 0x4]
	adds r0, r6, 0
	bl sub_804A51C
	adds r5, 0x2
	adds r4, 0x2
	adds r7, 0x1
	ldr r0, _0804A734 @ =gUnknown_03004824
	ldr r0, [r0]
	adds r0, 0x42
	adds r0, r6
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804A702
_0804A72C:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A734: .4byte gUnknown_03004824
_0804A738: .4byte gTradeLevelDisplayCoords
_0804A73C: .4byte gTradeMonBoxCoords
	thumb_func_end sub_804A6DC

	thumb_func_start sub_804A740
sub_804A740: @ 804A740
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	movs r7, 0
	ldr r3, _0804A800 @ =gUnknown_03004824
	ldr r0, [r3]
	adds r0, 0x42
	add r0, r12
	ldrb r0, [r0]
	cmp r7, r0
	bge _0804A7F2
	ldr r6, _0804A804 @ =gSprites
	mov r9, r3
	mov r1, r12
	lsls r0, r1, 1
	add r0, r12
	lsls r2, r0, 1
	mov r10, r2
	ldr r1, _0804A808 @ =gTradeMonSpriteCoords
	movs r2, 0
	mov r8, r2
	lsls r0, 2
	adds r5, r0, r1
_0804A778:
	mov r1, r9
	ldr r0, [r1]
	mov r2, r10
	adds r4, r7, r2
	adds r0, 0x34
	adds r0, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	mov r0, r9
	ldr r3, [r0]
	adds r2, r3, 0
	adds r2, 0x34
	adds r2, r4
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r5]
	lsls r0, 3
	adds r0, 0xE
	strh r0, [r1, 0x20]
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r5, 0x1]
	lsls r0, 3
	subs r0, 0xC
	strh r0, [r1, 0x22]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r8
	strh r1, [r0, 0x24]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r2, r8
	strh r2, [r0, 0x26]
	adds r5, 0x2
	adds r7, 0x1
	adds r3, 0x42
	add r3, r12
	ldrb r3, [r3]
	cmp r7, r3
	blt _0804A778
_0804A7F2:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A800: .4byte gUnknown_03004824
_0804A804: .4byte gSprites
_0804A808: .4byte gTradeMonSpriteCoords
	thumb_func_end sub_804A740

	thumb_func_start sub_804A80C
sub_804A80C: @ 804A80C
	push {lr}
	sub sp, 0x8
	ldr r0, _0804A838 @ =gUnknown_03004824
	ldr r0, [r0]
	adds r0, 0x4
	ldr r1, _0804A83C @ =gUnknown_0820C330
	ldrb r2, [r1, 0x2]
	ldrb r1, [r1, 0x3]
	str r1, [sp]
	movs r1, 0x13
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl FillWindowRect_DefaultPalette
	movs r0, 0x1
	bl sub_804A41C
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0804A838: .4byte gUnknown_03004824
_0804A83C: .4byte gUnknown_0820C330
	thumb_func_end sub_804A80C

	thumb_func_start sub_804A840
sub_804A840: @ 804A840
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0804A8A8
	ldr r4, _0804A89C @ =gUnknown_03004824
	ldr r0, [r4]
	adds r0, 0x4
	ldr r1, _0804A8A0 @ =gUnknown_0820C330
	ldrb r2, [r1]
	ldrb r1, [r1, 0x1]
	str r1, [sp]
	movs r1, 0x13
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl FillWindowRect_DefaultPalette
	ldr r0, [r4]
	adds r0, 0xC8
	ldr r3, _0804A8A4 @ =gTradePartyBoxTilemap
	movs r1, 0xF
	str r1, [sp]
	movs r1, 0x11
	str r1, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r1, 0
	movs r2, 0
	bl sub_804A96C_alt
	movs r0, 0
	bl sub_804A6DC
	movs r0, 0
	bl sub_804A41C
	movs r0, 0
	bl sub_804A740
	ldr r0, [r4]
	adds r0, 0xC8
	bl sub_804A938
	b _0804A8FA
	.align 2, 0
_0804A89C: .4byte gUnknown_03004824
_0804A8A0: .4byte gUnknown_0820C330
_0804A8A4: .4byte gTradePartyBoxTilemap
_0804A8A8:
	bl HandleDestroyMenuCursors
	ldr r4, _0804A924 @ =gUnknown_03004824
	ldr r0, [r4]
	adds r0, 0x4
	ldr r1, _0804A928 @ =gUnknown_0820C330
	ldrb r2, [r1, 0x2]
	ldrb r1, [r1, 0x3]
	str r1, [sp]
	movs r1, 0x13
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl FillWindowRect_DefaultPalette
	ldr r0, [r4]
	adds r0, 0xC8
	ldr r3, _0804A92C @ =gTradePartyBoxTilemap
	movs r1, 0xF
	str r1, [sp]
	movs r1, 0x11
	str r1, [sp, 0x4]
	movs r1, 0
	str r1, [sp, 0x8]
	movs r1, 0xF
	movs r2, 0
	bl sub_804A96C_alt
	movs r0, 0x1
	bl sub_804A6DC
	movs r0, 0x1
	bl sub_804A41C
	movs r0, 0x1
	bl sub_804A740
	ldr r0, [r4]
	adds r0, 0xC8
	bl sub_804A938
_0804A8FA:
	ldr r0, _0804A930 @ =gUnknown_0820C14C
	ldr r0, [r0, 0x4]
	ldr r4, _0804A924 @ =gUnknown_03004824
	ldr r1, [r4]
	adds r1, 0x7E
	ldrh r1, [r1]
	lsls r1, 5
	ldr r2, _0804A934 @ =0x06010000
	adds r1, r2
	movs r2, 0x14
	bl sub_804ACD8
	ldr r0, [r4]
	adds r0, 0x80
	adds r0, r5
	movs r1, 0
	strb r1, [r0]
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804A924: .4byte gUnknown_03004824
_0804A928: .4byte gUnknown_0820C330
_0804A92C: .4byte gTradePartyBoxTilemap
_0804A930: .4byte gUnknown_0820C14C
_0804A934: .4byte 0x06010000
	thumb_func_end sub_804A840

	thumb_func_start sub_804A938
sub_804A938: @ 804A938
	movs r1, 0x1
	strb r1, [r0, 0x10]
	bx lr
	thumb_func_end sub_804A938

	thumb_func_start sub_804A940
sub_804A940: @ 804A940
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x10]
	cmp r0, 0
	beq _0804A95C
	adds r0, r4, 0
	adds r0, 0x12
	ldr r1, [r4, 0x8]
	movs r2, 0x80
	lsls r2, 3
	bl CpuSet
	movs r0, 0
	strb r0, [r4, 0x10]
_0804A95C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804A940

	thumb_func_start sub_804A964
sub_804A964: @ 804A964
	movs r2, 0
	strb r2, [r0, 0x10]
	str r1, [r0, 0x8]
	bx lr
	thumb_func_end sub_804A964

.section .text.sub_804A9F4

	thumb_func_start sub_804A9F4
sub_804A9F4: @ 804A9F4
	push {lr}
	bl MenuZeroFillScreen
	pop {r0}
	bx r0
	thumb_func_end sub_804A9F4

	thumb_func_start sub_804AA00
sub_804AA00: @ 804AA00
	push {lr}
	bl MenuZeroFillScreen
	pop {r0}
	bx r0
	thumb_func_end sub_804AA00

	thumb_func_start sub_804AA0C
sub_804AA0C: @ 804AA0C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	ldr r0, _0804AA7C @ =gUnknown_03004824
	mov r8, r0
	ldr r0, [r0]
	adds r0, 0x4
	ldr r2, _0804AA80 @ =gTradeMessageWindowRects
	lsrs r4, 22
	adds r1, r4, r2
	ldrb r6, [r1]
	adds r1, r2, 0x1
	adds r1, r4, r1
	ldrb r5, [r1]
	adds r1, r2, 0x2
	adds r1, r4, r1
	ldrb r3, [r1]
	adds r2, 0x3
	adds r2, r4, r2
	ldrb r1, [r2]
	str r1, [sp]
	adds r1, r6, 0
	adds r2, r5, 0
	bl DrawTextWindow
	mov r1, r8
	ldr r3, [r1]
	adds r0, r3, 0x4
	ldr r1, _0804AA84 @ =gUnknown_0820C2F0
	adds r4, r1
	ldr r1, [r4]
	adds r3, 0x7A
	movs r4, 0xC0
	lsls r4, 1
	adds r2, r4, 0
	ldrb r3, [r3]
	adds r2, r3
	adds r6, 0x1
	lsls r6, 24
	lsrs r6, 24
	adds r5, 0x1
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp]
	adds r3, r6, 0
	bl sub_8003460
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804AA7C: .4byte gUnknown_03004824
_0804AA80: .4byte gTradeMessageWindowRects
_0804AA84: .4byte gUnknown_0820C2F0
	thumb_func_end sub_804AA0C

	thumb_func_start sub_804AA88
sub_804AA88: @ 804AA88
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r3, 0
	ldr r5, _0804AAD0 @ =gUnknown_03004824
	ldr r0, _0804AAD4 @ =0x000008dc
	mov r8, r0
	movs r4, 0
	ldr r2, _0804AAD8 @ =0x000008de
	mov r12, r2
	movs r7, 0x8E
	lsls r7, 4
	movs r6, 0xFF
_0804AAA2:
	ldr r0, [r5]
	lsls r2, r3, 3
	adds r0, r2
	add r0, r8
	strb r4, [r0]
	ldr r1, [r5]
	adds r1, r2
	mov r2, r12
	adds r0, r1, r2
	strh r4, [r0]
	adds r1, r7
	ldrb r0, [r1]
	orrs r0, r6
	strb r0, [r1]
	adds r3, 0x1
	cmp r3, 0x3
	ble _0804AAA2
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AAD0: .4byte gUnknown_03004824
_0804AAD4: .4byte 0x000008dc
_0804AAD8: .4byte 0x000008de
	thumb_func_end sub_804AA88

	thumb_func_start sub_804AADC
sub_804AADC: @ 804AADC
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 24
	lsrs r6, r1, 24
	movs r3, 0
	ldr r4, _0804AB18 @ =gUnknown_03004824
	mov r12, r4
	ldr r7, _0804AB1C @ =0x000008dc
_0804AAEE:
	mov r1, r12
	ldr r0, [r1]
	lsls r1, r3, 3
	adds r2, r0, r1
	adds r0, r2, r7
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804AB24
	ldr r3, _0804AB20 @ =0x000008de
	adds r0, r2, r3
	strh r5, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strb r6, [r0]
	ldr r0, [r4]
	adds r0, r1
	ldr r1, _0804AB1C @ =0x000008dc
	adds r0, r1
	movs r1, 0x1
	strb r1, [r0]
	b _0804AB2A
	.align 2, 0
_0804AB18: .4byte gUnknown_03004824
_0804AB1C: .4byte 0x000008dc
_0804AB20: .4byte 0x000008de
_0804AB24:
	adds r3, 0x1
	cmp r3, 0x3
	ble _0804AAEE
_0804AB2A:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_804AADC

	thumb_func_start sub_804AB30
sub_804AB30: @ 804AB30
	push {r4,r5,lr}
	movs r4, 0
	ldr r3, _0804AB58 @ =gUnknown_03004824
_0804AB36:
	ldr r0, [r3]
	lsls r1, r4, 3
	adds r2, r0, r1
	ldr r5, _0804AB5C @ =0x000008dc
	adds r0, r2, r5
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0
	beq _0804ABE2
	ldr r0, _0804AB60 @ =0x000008de
	adds r1, r2, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _0804AB64
	subs r0, 0x1
	strh r0, [r1]
	b _0804ABE2
	.align 2, 0
_0804AB58: .4byte gUnknown_03004824
_0804AB5C: .4byte 0x000008dc
_0804AB60: .4byte 0x000008de
_0804AB64:
	movs r1, 0x8E
	lsls r1, 4
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _0804ABD2
	lsls r0, 2
	ldr r1, _0804AB7C @ =_0804AB80
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804AB7C: .4byte _0804AB80
	.align 2, 0
_0804AB80:
	.4byte _0804AB98
	.4byte _0804ABB4
	.4byte _0804ABBC
	.4byte _0804ABC4
	.4byte _0804ABC4
	.4byte _0804ABCC
_0804AB98:
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0804ABB0 @ =gUnknown_03004824
	ldr r1, [r1]
	adds r1, 0x8C
	movs r2, 0x14
	bl SendBlock
	b _0804ABD2
	.align 2, 0
_0804ABB0: .4byte gUnknown_03004824
_0804ABB4:
	movs r0, 0
	bl sub_804AA0C
	b _0804ABD2
_0804ABBC:
	movs r0, 0x2
	bl sub_804AA0C
	b _0804ABD2
_0804ABC4:
	movs r0, 0x3
	bl sub_804AA0C
	b _0804ABD2
_0804ABCC:
	movs r0, 0x3
	bl sub_804AA0C
_0804ABD2:
	ldr r0, _0804ABF0 @ =gUnknown_03004824
	ldr r1, [r0]
	adds r1, r5
	ldr r2, _0804ABF4 @ =0x000008dc
	adds r1, r2
	movs r2, 0
	strb r2, [r1]
	adds r3, r0, 0
_0804ABE2:
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804AB36
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804ABF0: .4byte gUnknown_03004824
_0804ABF4: .4byte 0x000008dc
	thumb_func_end sub_804AB30

	thumb_func_start sub_804ABF8
sub_804ABF8: @ 804ABF8
	push {r4,lr}
	ldr r0, _0804AC14 @ =gUnknown_03004824
	ldr r1, [r0]
	adds r1, 0xB4
	ldrb r1, [r1]
	subs r1, 0x8
	adds r4, r0, 0
	cmp r1, 0x8
	bhi _0804ACB0
	lsls r0, r1, 2
	ldr r1, _0804AC18 @ =_0804AC1C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804AC14: .4byte gUnknown_03004824
_0804AC18: .4byte _0804AC1C
	.align 2, 0
_0804AC1C:
	.4byte _0804AC40
	.4byte _0804ACB0
	.4byte _0804ACB0
	.4byte _0804ACB0
	.4byte _0804ACB0
	.4byte _0804AC60
	.4byte _0804AC74
	.4byte _0804AC88
	.4byte _0804AC9A
_0804AC40:
	ldr r0, [r4]
	adds r0, 0xB4
	ldrb r0, [r0]
	lsls r0, 3
	ldr r1, _0804AC5C @ =gUnknown_0820C07C
	adds r0, r1
	bl LoadSpriteSheet
	ldr r1, [r4]
	adds r2, r1, 0
	adds r2, 0x7E
	strh r0, [r2]
	b _0804ACC2
	.align 2, 0
_0804AC5C: .4byte gUnknown_0820C07C
_0804AC60:
	ldr r0, _0804AC6C @ =gSpritePalette_TradeScreenText
	bl LoadSpritePalette
	ldr r0, _0804AC70 @ =gUnknown_03004824
	ldr r1, [r0]
	b _0804ACC2
	.align 2, 0
_0804AC6C: .4byte gSpritePalette_TradeScreenText
_0804AC70: .4byte gUnknown_03004824
_0804AC74:
	ldr r0, _0804AC80 @ =gUnknown_0820C12C
	bl LoadSpritePalette
	ldr r0, _0804AC84 @ =gUnknown_03004824
	ldr r1, [r0]
	b _0804ACC2
	.align 2, 0
_0804AC80: .4byte gUnknown_0820C12C
_0804AC84: .4byte gUnknown_03004824
_0804AC88:
	ldr r0, _0804ACA8 @ =gUnknown_0820C124
	bl LoadSpriteSheet
	ldr r0, _0804ACAC @ =gUnknown_03004824
	ldr r1, [r0]
	adds r1, 0xB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804AC9A:
	ldr r0, _0804ACAC @ =gUnknown_03004824
	ldr r0, [r0]
	adds r0, 0xB4
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _0804ACCC
	.align 2, 0
_0804ACA8: .4byte gUnknown_0820C124
_0804ACAC: .4byte gUnknown_03004824
_0804ACB0:
	ldr r0, [r4]
	adds r0, 0xB4
	ldrb r0, [r0]
	lsls r0, 3
	ldr r1, _0804ACD4 @ =gUnknown_0820C07C
	adds r0, r1
	bl LoadSpriteSheet
	ldr r1, [r4]
_0804ACC2:
	adds r1, 0xB4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
_0804ACCC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0804ACD4: .4byte gUnknown_0820C07C
	thumb_func_end sub_804ABF8

	thumb_func_start sub_804ACD8
sub_804ACD8: @ 804ACD8
	push {r4,lr}
	adds r4, r0, 0
	lsls r3, r2, 24
	lsrs r3, 24
	ldr r0, _0804ACF0 @ =gWindowConfig_81E725C
	adds r2, r4, 0
	bl sub_804AFB8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804ACF0: .4byte gWindowConfig_81E725C
	thumb_func_end sub_804ACD8

	thumb_func_start sub_804ACF4
sub_804ACF4: @ 804ACF4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0
	beq _0804AD0C
	cmp r0, 0x1
	beq _0804ADA0
	b _0804AE2C
_0804AD0C:
	movs r7, 0
	ldr r1, _0804AD4C @ =gUnknown_03004824
	ldr r0, [r1]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804AD1C
	b _0804AE2C
_0804AD1C:
	adds r6, r1, 0
	movs r5, 0
	mov r9, r5
_0804AD22:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _0804AD50 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	adds r1, r0, 0
	cmp r1, 0x1
	bne _0804AD54
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	mov r2, r9
	strb r2, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	b _0804AD84
	.align 2, 0
_0804AD4C: .4byte gUnknown_03004824
_0804AD50: .4byte gPlayerParty
_0804AD54:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	cmp r1, 0
	bne _0804AD72
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	b _0804AD84
_0804AD72:
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	mov r1, r9
_0804AD84:
	strb r1, [r0]
	ldr r0, _0804AD9C @ =gUnknown_03004824
	adds r5, 0x1
	adds r7, 0x1
	ldr r0, [r0]
	adds r0, 0x42
	add r0, r8
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804AD22
	b _0804AE2C
	.align 2, 0
_0804AD9C: .4byte gUnknown_03004824
_0804ADA0:
	movs r7, 0
	ldr r1, _0804ADE0 @ =gUnknown_03004824
	ldr r0, [r1]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r7, r0
	bge _0804AE2C
	adds r6, r1, 0
	movs r5, 0x6
	movs r2, 0
	mov r9, r2
_0804ADB6:
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _0804ADE4 @ =gEnemyParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	adds r1, r0, 0
	cmp r1, 0x1
	bne _0804ADE8
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	mov r2, r9
	strb r2, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	b _0804AE18
	.align 2, 0
_0804ADE0: .4byte gUnknown_03004824
_0804ADE4: .4byte gEnemyParty
_0804ADE8:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	cmp r1, 0
	bne _0804AE06
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	b _0804AE18
_0804AE06:
	ldr r0, [r6]
	adds r0, 0x51
	adds r0, r5
	movs r1, 0x1
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0x5D
	adds r0, r5
	mov r1, r9
_0804AE18:
	strb r1, [r0]
	ldr r0, _0804AE38 @ =gUnknown_03004824
	adds r5, 0x1
	adds r7, 0x1
	ldr r0, [r0]
	adds r0, 0x42
	add r0, r8
	ldrb r0, [r0]
	cmp r7, r0
	blt _0804ADB6
_0804AE2C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AE38: .4byte gUnknown_03004824
	thumb_func_end sub_804ACF4

	thumb_func_start sub_804AE3C
sub_804AE3C: @ 804AE3C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0804AE4C
	cmp r0, 0x1
	beq _0804AEAC
	b _0804AF00
_0804AE4C:
	movs r6, 0
	ldr r1, _0804AEA4 @ =gUnknown_03004824
	ldr r0, [r1]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r6, r0
	bcs _0804AF00
	adds r7, r1, 0
_0804AE5C:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _0804AEA8 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r0, r5, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl GetHPBarLevel
	ldr r1, [r7]
	adds r1, 0x69
	adds r1, r6
	strb r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, [r7]
	adds r0, 0x42
	ldrb r0, [r0]
	cmp r6, r0
	bcc _0804AE5C
	b _0804AF00
	.align 2, 0
_0804AEA4: .4byte gUnknown_03004824
_0804AEA8: .4byte gPlayerParty
_0804AEAC:
	movs r6, 0
	ldr r1, _0804AF08 @ =gUnknown_03004824
	ldr r0, [r1]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r6, r0
	bcs _0804AF00
	adds r7, r1, 0
_0804AEBC:
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _0804AF0C @ =gEnemyParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r0, r5, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl GetHPBarLevel
	ldr r1, [r7]
	adds r1, 0x6F
	adds r1, r6
	strb r0, [r1]
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, [r7]
	adds r0, 0x43
	ldrb r0, [r0]
	cmp r6, r0
	bcc _0804AEBC
_0804AF00:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AF08: .4byte gUnknown_03004824
_0804AF0C: .4byte gEnemyParty
	thumb_func_end sub_804AE3C

	thumb_func_start sub_804AF10
sub_804AF10: @ 804AF10
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
_0804AF18:
	movs r4, 0
	ldr r2, _0804AF7C @ =gUnknown_03004824
	ldr r0, [r2]
	adds r0, 0x42
	adds r0, r5
	adds r1, r5, 0x1
	mov r8, r1
	ldrb r0, [r0]
	cmp r4, r0
	bge _0804AF6A
	adds r6, r2, 0
	lsls r0, r5, 1
	adds r0, r5
	lsls r7, r0, 1
_0804AF34:
	ldr r2, [r6]
	adds r3, r4, r7
	adds r0, r2, 0
	adds r0, 0x34
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804AF80 @ =gSprites
	adds r0, r1
	adds r2, 0x69
	adds r2, r3
	ldrb r2, [r2]
	movs r1, 0x4
	subs r1, r2
	lsls r1, 24
	lsrs r1, 24
	bl sub_809D824
	adds r4, 0x1
	ldr r0, [r6]
	adds r0, 0x42
	adds r0, r5
	ldrb r0, [r0]
	cmp r4, r0
	blt _0804AF34
_0804AF6A:
	mov r5, r8
	cmp r5, 0x1
	ble _0804AF18
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AF7C: .4byte gUnknown_03004824
_0804AF80: .4byte gSprites
	thumb_func_end sub_804AF10

	thumb_func_start sub_804AF84
sub_804AF84: @ 804AF84
	push {r4,lr}
	movs r2, 0
	ldr r4, _0804AFB0 @ =gSaveBlock1 + 0x3110
	ldr r3, _0804AFB4 @ =gUnknown_03004824
_0804AF8C:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, 0
	bne _0804AFA2
	ldr r0, [r3]
	adds r0, 0xB5
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804AFA2
	strb r0, [r1]
_0804AFA2:
	adds r2, 0x1
	cmp r2, 0xA
	ble _0804AF8C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804AFB0: .4byte gSaveBlock1 + 0x3110
_0804AFB4: .4byte gUnknown_03004824
	thumb_func_end sub_804AF84

	thumb_func_start sub_804AFB8
sub_804AFB8: @ 804AFB8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r9, r0
	mov r8, r1
	mov r10, r2
	lsls r3, 24
	lsrs r6, r3, 24
	adds r0, r6, 0x3
	lsrs r6, r0, 2
	ldr r7, _0804B054 @ =gTileBuffer
	mov r0, sp
	movs r5, 0
	strh r5, [r0]
	lsls r4, r6, 6
	movs r0, 0x80
	lsls r0, 17
	orrs r4, r0
	mov r0, sp
	adds r1, r7, 0
	adds r2, r4, 0
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	strh r5, [r0]
	mov r2, r9
	ldrb r1, [r2, 0xD]
	lsls r1, 5
	adds r1, r7
	adds r2, r4, 0
	bl CpuSet
	mov r0, r9
	adds r1, r7, 0
	mov r2, r10
	bl sub_8004E3C
	movs r4, 0
	cmp r4, r6
	bcs _0804B042
_0804B010:
	lsls r0, r4, 7
	adds r0, r7, r0
	lsls r1, r4, 8
	add r1, r8
	movs r2, 0x40
	bl CpuSet
	lsls r0, r4, 2
	mov r1, r9
	ldrb r1, [r1, 0xD]
	adds r0, r1
	lsls r0, 5
	adds r0, r7, r0
	lsls r1, r4, 3
	adds r1, 0x4
	lsls r1, 5
	add r1, r8
	movs r2, 0x40
	bl CpuSet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _0804B010
_0804B042:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B054: .4byte gTileBuffer
	thumb_func_end sub_804AFB8

	thumb_func_start sub_804B058
sub_804B058: @ 804B058
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _0804B074
	movs r0, 0x17
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2E]
_0804B074:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804B058

	thumb_func_start sub_804B07C
sub_804B07C: @ 804B07C
	push {lr}
	adds r2, r0, 0
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	cmp r1, 0
	bne _0804B0B2
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _0804B098
	strh r1, [r2, 0x2E]
_0804B098:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	lsls r0, 1
	ldr r1, _0804B0B8 @ =gTradeGlow2PaletteAnimTable
	adds r0, r1
	ldrb r1, [r2, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	lsls r1, 4
	adds r1, 0x4
	movs r2, 0x2
	bl LoadPalette
_0804B0B2:
	pop {r0}
	bx r0
	.align 2, 0
_0804B0B8: .4byte gTradeGlow2PaletteAnimTable
	thumb_func_end sub_804B07C

	thumb_func_start sub_804B0BC
sub_804B0BC: @ 804B0BC
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	adds r1, 0x1
	strh r1, [r2, 0x2E]
	ldrh r0, [r2, 0x26]
	adds r0, 0x1
	strh r0, [r2, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xA
	bne _0804B0DA
	adds r0, r2, 0
	bl DestroySprite
_0804B0DA:
	pop {r0}
	bx r0
	thumb_func_end sub_804B0BC

	thumb_func_start sub_804B0E0
sub_804B0E0: @ 804B0E0
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	adds r1, 0x1
	strh r1, [r2, 0x2E]
	ldrh r0, [r2, 0x26]
	subs r0, 0x1
	strh r0, [r2, 0x26]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xA
	bne _0804B0FE
	adds r0, r2, 0
	bl DestroySprite
_0804B0FE:
	pop {r0}
	bx r0
	thumb_func_end sub_804B0E0

	thumb_func_start sub_804B104
sub_804B104: @ 804B104
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bne _0804B120
	movs r0, 0xCC
	bl PlaySE
	movs r0, 0
	strh r0, [r4, 0x2E]
_0804B120:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804B104

	thumb_func_start sub_804B128
sub_804B128: @ 804B128
	push {r4,r5,lr}
	sub sp, 0x20
	ldr r0, _0804B1B4 @ =gUnknown_03004828
	ldr r0, [r0]
	mov r12, r0
	movs r0, 0x82
	lsls r0, 1
	add r0, r12
	ldrh r1, [r0]
	lsls r1, 8
	movs r0, 0x83
	lsls r0, 1
	add r0, r12
	ldrh r2, [r0]
	lsls r2, 8
	movs r0, 0x86
	lsls r0, 1
	add r0, r12
	movs r4, 0
	ldrsh r3, [r0, r4]
	movs r0, 0x87
	lsls r0, 1
	add r0, r12
	movs r5, 0
	ldrsh r0, [r0, r5]
	str r0, [sp]
	movs r4, 0x8C
	lsls r4, 1
	add r4, r12
	movs r5, 0
	ldrsh r0, [r4, r5]
	str r0, [sp, 0x4]
	movs r5, 0
	ldrsh r0, [r4, r5]
	str r0, [sp, 0x8]
	movs r0, 0x8E
	lsls r0, 1
	add r0, r12
	ldrh r0, [r0]
	str r0, [sp, 0xC]
	add r0, sp, 0x10
	bl DoBgAffineSet
	ldr r1, _0804B1B8 @ =REG_BG2PA
	add r0, sp, 0x10
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	add r0, sp, 0x10
	ldrh r0, [r0, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	add r0, sp, 0x10
	ldrh r0, [r0, 0x4]
	strh r0, [r1]
	adds r1, 0x2
	add r0, sp, 0x10
	ldrh r0, [r0, 0x6]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, [sp, 0x18]
	str r0, [r1]
	adds r1, 0x4
	ldr r0, [sp, 0x1C]
	str r0, [r1]
	add sp, 0x20
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B1B4: .4byte gUnknown_03004828
_0804B1B8: .4byte REG_BG2PA
	thumb_func_end sub_804B128

	thumb_func_start sub_804B1BC
sub_804B1BC: @ 804B1BC
	push {lr}
	ldr r1, _0804B1FC @ =REG_BG1VOFS
	ldr r0, _0804B200 @ =gUnknown_03004828
	ldr r2, [r0]
	movs r3, 0x88
	lsls r3, 1
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	movs r0, 0x80
	lsls r0, 19
	ldrh r0, [r0]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _0804B208
	ldr r1, _0804B204 @ =REG_BG2VOFS
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	b _0804B20C
	.align 2, 0
_0804B1FC: .4byte REG_BG1VOFS
_0804B200: .4byte gUnknown_03004828
_0804B204: .4byte REG_BG2VOFS
_0804B208:
	bl sub_804B128
_0804B20C:
	pop {r0}
	bx r0
	thumb_func_end sub_804B1BC

	thumb_func_start sub_804B210
sub_804B210: @ 804B210
	push {lr}
	bl sub_804B1BC
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_804B210

	thumb_func_start sub_804B228
sub_804B228: @ 804B228
	push {r4,lr}
	ldr r4, _0804B248 @ =gUnknown_03004828
	ldr r1, [r4]
	adds r2, r1, 0
	adds r2, 0xB4
	movs r3, 0
	movs r0, 0
	strh r0, [r2]
	adds r1, 0xB2
	strb r3, [r1]
	ldr r0, [r4]
	adds r0, 0xB3
	strb r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B248: .4byte gUnknown_03004828
	thumb_func_end sub_804B228

	thumb_func_start sub_804B24C
sub_804B24C: @ 804B24C
	push {r4,r5,lr}
	ldr r1, _0804B270 @ =gUnknown_03004828
	ldr r2, [r1]
	adds r0, r2, 0
	adds r0, 0xB2
	adds r3, r2, 0
	adds r3, 0xB3
	ldrb r0, [r0]
	adds r5, r1, 0
	ldrb r3, [r3]
	cmp r0, r3
	bne _0804B274
	adds r1, r2, 0
	adds r1, 0xB4
	ldrh r0, [r1]
	adds r0, 0x1
	b _0804B27A
	.align 2, 0
_0804B270: .4byte gUnknown_03004828
_0804B274:
	adds r1, r2, 0
	adds r1, 0xB4
	movs r0, 0
_0804B27A:
	strh r0, [r1]
	adds r4, r5, 0
	ldr r3, [r4]
	adds r2, r3, 0
	adds r2, 0xB4
	ldrh r0, [r2]
	cmp r0, 0xB4
	bls _0804B29C
	movs r1, 0
	movs r0, 0
	strh r0, [r2]
	adds r0, r3, 0
	adds r0, 0xB3
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0xB2
	strb r1, [r0]
_0804B29C:
	ldr r0, [r5]
	adds r1, r0, 0
	adds r1, 0xB2
	ldrb r1, [r1]
	adds r0, 0xB3
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_804B24C

	thumb_func_start sub_804B2B0
sub_804B2B0: @ 804B2B0
	push {lr}
	ldr r0, _0804B2C0 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804B2C4
	movs r0, 0
	b _0804B2CC
	.align 2, 0
_0804B2C0: .4byte gReceivedRemoteLinkPlayers
_0804B2C4:
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
_0804B2CC:
	pop {r1}
	bx r1
	thumb_func_end sub_804B2B0

	thumb_func_start sub_804B2D0
sub_804B2D0: @ 804B2D0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r4, 0
	mov r10, r4
	cmp r7, 0
	bne _0804B2FC
	ldr r0, _0804B324 @ =gUnknown_020297D8
	ldrb r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0804B328 @ =gPlayerParty
	adds r1, r0
	mov r10, r1
	movs r4, 0x1
_0804B2FC:
	cmp r7, 0x1
	bne _0804B31A
	ldr r0, _0804B324 @ =gUnknown_020297D8
	ldrb r0, [r0, 0x1]
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _0804B32C @ =gEnemyParty
	adds r1, r0
	mov r10, r1
	movs r4, 0x3
_0804B31A:
	cmp r5, 0
	beq _0804B330
	cmp r5, 0x1
	beq _0804B3A4
	b _0804B3FA
	.align 2, 0
_0804B324: .4byte gUnknown_020297D8
_0804B328: .4byte gPlayerParty
_0804B32C: .4byte gEnemyParty
_0804B330:
	mov r0, r10
	movs r1, 0x41
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r0, r10
	movs r1, 0
	bl GetMonData
	mov r9, r0
	lsls r0, r5, 3
	ldr r1, _0804B390 @ =gMonFrontPicTable
	adds r0, r1
	ldr r1, _0804B394 @ =gMonFrontPicCoords
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r3, _0804B398 @ =0x02000000
	ldr r6, _0804B39C @ =gUnknown_081FAF4C
	lsls r7, 1
	mov r8, r7
	mov r4, r8
	adds r4, 0x1
	lsls r4, 2
	adds r4, r6
	ldr r4, [r4]
	str r4, [sp]
	str r5, [sp, 0x4]
	mov r4, r9
	str r4, [sp, 0x8]
	bl HandleLoadSpecialPokePic
	mov r0, r10
	bl sub_8040990
	bl LoadCompressedObjectPalette
	ldr r0, _0804B3A0 @ =gUnknown_03004828
	ldr r0, [r0]
	movs r1, 0x90
	lsls r1, 1
	adds r0, r1
	add r0, r8
	strh r5, [r0]
	b _0804B3FA
	.align 2, 0
_0804B390: .4byte gMonFrontPicTable
_0804B394: .4byte gMonFrontPicCoords
_0804B398: .4byte 0x02000000
_0804B39C: .4byte gUnknown_081FAF4C
_0804B3A0: .4byte gUnknown_03004828
_0804B3A4:
	mov r0, r10
	bl sub_8040990
	ldrh r0, [r0, 0x4]
	adds r1, r4, 0
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _0804B40C @ =gUnknown_02024E8C
	movs r1, 0x78
	movs r2, 0x3C
	movs r3, 0x6
	bl CreateSprite
	ldr r4, _0804B410 @ =gUnknown_03004828
	ldr r1, [r4]
	adds r1, 0xB8
	adds r1, r7
	strb r0, [r1]
	ldr r3, _0804B414 @ =gSprites
	ldr r0, [r4]
	adds r0, 0xB8
	adds r0, r7
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0xB8
	adds r0, r7
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, 0x1C
	adds r0, r3
	ldr r1, _0804B418 @ =SpriteCallbackDummy
	str r1, [r0]
_0804B3FA:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B40C: .4byte gUnknown_02024E8C
_0804B410: .4byte gUnknown_03004828
_0804B414: .4byte gSprites
_0804B418: .4byte SpriteCallbackDummy
	thumb_func_end sub_804B2D0

	thumb_func_start sub_804B41C
sub_804B41C: @ 804B41C
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r1, _0804B43C @ =gMain
	ldr r2, _0804B440 @ =0x0000043c
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0xC
	bls _0804B430
	b _0804B76E
_0804B430:
	lsls r0, 2
	ldr r1, _0804B444 @ =_0804B448
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804B43C: .4byte gMain
_0804B440: .4byte 0x0000043c
_0804B444: .4byte _0804B448
	.align 2, 0
_0804B448:
	.4byte _0804B47C
	.4byte _0804B5AC
	.4byte _0804B5D4
	.4byte _0804B5FC
	.4byte _0804B648
	.4byte _0804B678
	.4byte _0804B6A8
	.4byte _0804B6B2
	.4byte _0804B6CC
	.4byte _0804B6E4
	.4byte _0804B71C
	.4byte _0804B726
	.4byte _0804B75C
_0804B47C:
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	bl ResetTasks
	bl CloseLink
	ldr r6, _0804B570 @ =gUnknown_03004828
	ldr r5, _0804B574 @ =0x0201f000
	str r5, [r6]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0804B578 @ =sub_804B210
	bl SetVBlankCallback
	bl sub_804B228
	ldr r4, _0804B57C @ =gWindowConfig_81E6F84
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, [r6]
	adds r0, 0x4
	adds r1, r4, 0
	bl InitWindowFromConfig
	movs r0, 0x2
	bl SetTextWindowBaseTileNum
	ldr r1, [r6]
	adds r1, 0x34
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	bl MenuZeroFillScreen
	ldr r1, _0804B580 @ =gLinkType
	ldr r4, _0804B584 @ =0x00001144
	adds r0, r4, 0
	strh r0, [r1]
	ldr r1, _0804B588 @ =gMain
	ldr r0, _0804B58C @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, _0804B590 @ =gUnknown_08D00000
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r0, _0804B594 @ =gUnknown_08D00524
	ldr r1, _0804B598 @ =0xfffe1000
	adds r5, r1
	movs r2, 0x80
	lsls r2, 4
	adds r1, r5, 0
	bl CpuSet
	ldr r1, _0804B59C @ =0x06002800
	ldr r0, _0804B5A0 @ =0x040000d4
	str r5, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804B5A4 @ =0x80000280
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _0804B5A8 @ =gUnknown_08D004E0
	movs r1, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, [r6]
	adds r0, r1, 0
	adds r0, 0xB6
	movs r2, 0
	strh r2, [r0]
	adds r0, 0xE
	strh r2, [r0]
	movs r4, 0x8F
	lsls r4, 1
	adds r1, r4
	movs r0, 0x1
	strb r0, [r1]
	ldr r3, [r6]
	movs r1, 0x82
	lsls r1, 1
	adds r0, r3, r1
	movs r1, 0x40
	strh r1, [r0]
	subs r4, 0x18
	adds r0, r3, r4
	strh r1, [r0]
	adds r1, 0xC8
	adds r0, r3, r1
	strh r2, [r0]
	adds r4, 0x4
	adds r0, r3, r4
	strh r2, [r0]
	movs r0, 0x86
	lsls r0, 1
	adds r1, r3, r0
	movs r0, 0x78
	strh r0, [r1]
	adds r4, 0x4
	adds r1, r3, r4
	movs r0, 0x50
	strh r0, [r1]
	adds r0, 0xC8
	adds r1, r3, r0
	subs r0, 0x18
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r3, r1
	strh r2, [r0]
	b _0804B76E
	.align 2, 0
_0804B570: .4byte gUnknown_03004828
_0804B574: .4byte 0x0201f000
_0804B578: .4byte sub_804B210
_0804B57C: .4byte gWindowConfig_81E6F84
_0804B580: .4byte gLinkType
_0804B584: .4byte 0x00001144
_0804B588: .4byte gMain
_0804B58C: .4byte 0x0000043c
_0804B590: .4byte gUnknown_08D00000
_0804B594: .4byte gUnknown_08D00524
_0804B598: .4byte 0xfffe1000
_0804B59C: .4byte 0x06002800
_0804B5A0: .4byte 0x040000d4
_0804B5A4: .4byte 0x80000280
_0804B5A8: .4byte gUnknown_08D004E0
_0804B5AC:
	bl OpenLink
	ldr r1, _0804B5C8 @ =gMain
	ldr r2, _0804B5CC @ =0x0000043c
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, _0804B5D0 @ =gUnknown_03004828
	ldr r0, [r0]
	adds r0, 0xC0
	str r2, [r0]
	b _0804B76E
	.align 2, 0
_0804B5C8: .4byte gMain
_0804B5CC: .4byte 0x0000043c
_0804B5D0: .4byte gUnknown_03004828
_0804B5D4:
	ldr r0, _0804B5F4 @ =gUnknown_03004828
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bhi _0804B5E8
	b _0804B76E
_0804B5E8:
	movs r0, 0
	str r0, [r1]
	ldr r4, _0804B5F8 @ =0x0000043c
	adds r1, r2, r4
	b _0804B74C
	.align 2, 0
_0804B5F4: .4byte gUnknown_03004828
_0804B5F8: .4byte 0x0000043c
_0804B5FC:
	bl IsLinkMaster
	lsls r0, 24
	cmp r0, 0
	bne _0804B608
	b _0804B746
_0804B608:
	bl GetLinkPlayerCount_2
	adds r4, r0, 0
	bl sub_800820C
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bcs _0804B61C
	b _0804B76E
_0804B61C:
	ldr r0, _0804B63C @ =gUnknown_03004828
	ldr r1, [r0]
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x1E
	bhi _0804B62E
	b _0804B76E
_0804B62E:
	bl sub_8007F4C
	ldr r1, _0804B640 @ =gMain
	ldr r0, _0804B644 @ =0x0000043c
	adds r1, r0
	b _0804B74C
	.align 2, 0
_0804B63C: .4byte gUnknown_03004828
_0804B640: .4byte gMain
_0804B644: .4byte 0x0000043c
_0804B648:
	bl sub_804B24C
	ldr r0, _0804B66C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0804B656
	b _0804B76E
_0804B656:
	bl IsLinkPlayerDataExchangeComplete
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0804B664
	b _0804B76E
_0804B664:
	ldr r1, _0804B670 @ =gMain
	ldr r4, _0804B674 @ =0x0000043c
	adds r1, r4
	b _0804B74C
	.align 2, 0
_0804B66C: .4byte gReceivedRemoteLinkPlayers
_0804B670: .4byte gMain
_0804B674: .4byte 0x0000043c
_0804B678:
	ldr r2, _0804B69C @ =gUnknown_03004828
	ldr r0, [r2]
	adds r0, 0x9C
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0x9D
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, 0xBD
	strb r1, [r0]
	movs r0, 0
	bl sub_804B2D0
	ldr r1, _0804B6A0 @ =gMain
	ldr r0, _0804B6A4 @ =0x0000043c
	adds r1, r0
	b _0804B74C
	.align 2, 0
_0804B69C: .4byte gUnknown_03004828
_0804B6A0: .4byte gMain
_0804B6A4: .4byte 0x0000043c
_0804B6A8:
	movs r0, 0
	movs r1, 0x1
	bl sub_804B2D0
	b _0804B746
_0804B6B2:
	movs r0, 0x1
	movs r1, 0
	bl sub_804B2D0
	ldr r1, _0804B6C4 @ =gMain
	ldr r4, _0804B6C8 @ =0x0000043c
	adds r1, r4
	b _0804B74C
	.align 2, 0
_0804B6C4: .4byte gMain
_0804B6C8: .4byte 0x0000043c
_0804B6CC:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_804B2D0
	ldr r1, _0804B6DC @ =gMain
	ldr r0, _0804B6E0 @ =0x0000043c
	adds r1, r0
	b _0804B74C
	.align 2, 0
_0804B6DC: .4byte gMain
_0804B6E0: .4byte 0x0000043c
_0804B6E4:
	bl sub_804C164
	ldr r0, _0804B704 @ =gUnknown_0821594C
	bl LoadSpriteSheet
	ldr r0, _0804B708 @ =gUnknown_08215954
	bl LoadSpritePalette
	ldr r1, _0804B70C @ =REG_BG1CNT
	ldr r2, _0804B710 @ =0x00000502
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0804B714 @ =gMain
	ldr r4, _0804B718 @ =0x0000043c
	adds r1, r4
	b _0804B74C
	.align 2, 0
_0804B704: .4byte gUnknown_0821594C
_0804B708: .4byte gUnknown_08215954
_0804B70C: .4byte REG_BG1CNT
_0804B710: .4byte 0x00000502
_0804B714: .4byte gMain
_0804B718: .4byte 0x0000043c
_0804B71C:
	ldr r0, _0804B754 @ =0x0000043c
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804B726:
	movs r0, 0x5
	bl sub_804BBE8
	movs r0, 0
	bl sub_804BBE8
	bl sub_804C1A8
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0804B746:
	ldr r1, _0804B758 @ =gMain
	ldr r2, _0804B754 @ =0x0000043c
	adds r1, r2
_0804B74C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804B76E
	.align 2, 0
_0804B754: .4byte 0x0000043c
_0804B758: .4byte gMain
_0804B75C:
	ldr r0, _0804B788 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804B76E
	ldr r0, _0804B78C @ =sub_804DB84
	bl SetMainCallback2
_0804B76E:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804B788: .4byte gPaletteFade
_0804B78C: .4byte sub_804DB84
	thumb_func_end sub_804B41C

	thumb_func_start sub_804B790
sub_804B790: @ 804B790
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x10
	ldr r1, _0804B7B4 @ =gMain
	ldr r2, _0804B7B8 @ =0x0000043c
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0xC
	bls _0804B7A8
	b _0804B9F2
_0804B7A8:
	lsls r0, 2
	ldr r1, _0804B7BC @ =_0804B7C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804B7B4: .4byte gMain
_0804B7B8: .4byte 0x0000043c
_0804B7BC: .4byte _0804B7C0
	.align 2, 0
_0804B7C0:
	.4byte _0804B7F4
	.4byte _0804B9F2
	.4byte _0804B9F2
	.4byte _0804B9F2
	.4byte _0804B9F2
	.4byte _0804B914
	.4byte _0804B92C
	.4byte _0804B944
	.4byte _0804B94E
	.4byte _0804B968
	.4byte _0804B9A0
	.4byte _0804B9AA
	.4byte _0804B9E0
_0804B7F4:
	ldr r1, _0804B8E0 @ =gUnknown_020297D8
	ldr r0, _0804B8E4 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	movs r6, 0
	strb r0, [r1]
	movs r0, 0x6
	strb r0, [r1, 0x1]
	ldr r4, _0804B8E8 @ =gLinkPlayers + 0x8
	ldr r1, _0804B8EC @ =gSaveBlock2
	adds r0, r4, 0
	bl StringCopy
	ldr r0, _0804B8F0 @ =gEnemyParty
	movs r1, 0x7
	add r2, sp, 0x4
	bl GetMonData
	adds r4, 0x1C
	adds r0, r4, 0
	add r1, sp, 0x4
	bl StringCopy
	movs r0, 0x80
	lsls r0, 19
	movs r3, 0
	mov r8, r3
	strh r6, [r0]
	bl ResetTasks
	ldr r5, _0804B8F4 @ =gUnknown_03004828
	ldr r0, _0804B8F8 @ =0x0201f000
	str r0, [r5]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r0, _0804B8FC @ =sub_804B210
	bl SetVBlankCallback
	bl sub_804B228
	ldr r4, _0804B900 @ =gWindowConfig_81E717C
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, [r5]
	adds r0, 0x4
	adds r1, r4, 0
	bl InitWindowFromConfig
	movs r0, 0x2
	bl SetTextWindowBaseTileNum
	ldr r1, [r5]
	adds r1, 0x34
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0x4
	bl LoadTextWindowGraphics
	bl MenuZeroFillScreen
	ldr r1, _0804B904 @ =gLinkType
	ldr r2, _0804B908 @ =0x00001144
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, [r5]
	movs r3, 0x8F
	lsls r3, 1
	adds r0, r3
	mov r1, r8
	strb r1, [r0]
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0xB6
	strh r6, [r0]
	adds r0, 0xE
	strh r6, [r0]
	subs r3, 0x1A
	adds r0, r2, r3
	movs r1, 0x40
	strh r1, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	adds r1, 0xC8
	adds r0, r2, r1
	strh r6, [r0]
	adds r3, 0x4
	adds r0, r2, r3
	strh r6, [r0]
	movs r0, 0x86
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0x78
	strh r0, [r1]
	adds r3, 0x4
	adds r1, r2, r3
	movs r0, 0x50
	strh r0, [r1]
	adds r0, 0xC8
	adds r1, r2, r0
	subs r0, 0x18
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r2, r1
	strh r6, [r0]
	adds r0, r2, 0
	adds r0, 0xC0
	str r6, [r0]
	ldr r0, _0804B90C @ =gMain
	ldr r2, _0804B910 @ =0x0000043c
	adds r0, r2
	movs r1, 0x5
	strb r1, [r0]
	b _0804B9F2
	.align 2, 0
_0804B8E0: .4byte gUnknown_020297D8
_0804B8E4: .4byte gSpecialVar_0x8005
_0804B8E8: .4byte gLinkPlayers + 0x8
_0804B8EC: .4byte gSaveBlock2
_0804B8F0: .4byte gEnemyParty
_0804B8F4: .4byte gUnknown_03004828
_0804B8F8: .4byte 0x0201f000
_0804B8FC: .4byte sub_804B210
_0804B900: .4byte gWindowConfig_81E717C
_0804B904: .4byte gLinkType
_0804B908: .4byte 0x00001144
_0804B90C: .4byte gMain
_0804B910: .4byte 0x0000043c
_0804B914:
	movs r0, 0
	movs r1, 0
	bl sub_804B2D0
	ldr r1, _0804B924 @ =gMain
	ldr r3, _0804B928 @ =0x0000043c
	adds r1, r3
	b _0804B9D0
	.align 2, 0
_0804B924: .4byte gMain
_0804B928: .4byte 0x0000043c
_0804B92C:
	movs r0, 0
	movs r1, 0x1
	bl sub_804B2D0
	ldr r1, _0804B93C @ =gMain
	ldr r0, _0804B940 @ =0x0000043c
	adds r1, r0
	b _0804B9D0
	.align 2, 0
_0804B93C: .4byte gMain
_0804B940: .4byte 0x0000043c
_0804B944:
	movs r0, 0x1
	movs r1, 0
	bl sub_804B2D0
	b _0804B9CA
_0804B94E:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_804B2D0
	ldr r1, _0804B960 @ =gMain
	ldr r3, _0804B964 @ =0x0000043c
	adds r1, r3
	b _0804B9D0
	.align 2, 0
_0804B960: .4byte gMain
_0804B964: .4byte 0x0000043c
_0804B968:
	bl sub_804C164
	ldr r0, _0804B988 @ =gUnknown_0821594C
	bl LoadSpriteSheet
	ldr r0, _0804B98C @ =gUnknown_08215954
	bl LoadSpritePalette
	ldr r1, _0804B990 @ =REG_BG1CNT
	ldr r2, _0804B994 @ =0x00000502
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0804B998 @ =gMain
	ldr r3, _0804B99C @ =0x0000043c
	adds r1, r3
	b _0804B9D0
	.align 2, 0
_0804B988: .4byte gUnknown_0821594C
_0804B98C: .4byte gUnknown_08215954
_0804B990: .4byte REG_BG1CNT
_0804B994: .4byte 0x00000502
_0804B998: .4byte gMain
_0804B99C: .4byte 0x0000043c
_0804B9A0:
	ldr r0, _0804B9D8 @ =0x0000043c
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804B9AA:
	movs r0, 0x5
	bl sub_804BBE8
	movs r0, 0
	bl sub_804BBE8
	bl sub_804C1A8
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0804B9CA:
	ldr r1, _0804B9DC @ =gMain
	ldr r2, _0804B9D8 @ =0x0000043c
	adds r1, r2
_0804B9D0:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804B9F2
	.align 2, 0
_0804B9D8: .4byte 0x0000043c
_0804B9DC: .4byte gMain
_0804B9E0:
	ldr r0, _0804BA10 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804B9F2
	ldr r0, _0804BA14 @ =sub_804BBCC
	bl SetMainCallback2
_0804B9F2:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804BA10: .4byte gPaletteFade
_0804BA14: .4byte sub_804BBCC
	thumb_func_end sub_804B790

	thumb_func_start sub_804BA18
sub_804BA18: @ 804BA18
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _0804BA60 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0804BA5A
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl SpeciesToNationalPokedexNum
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x2
	bl GetNationalPokedexFlag
	adds r0, r4, 0
	movs r1, 0x3
	bl GetNationalPokedexFlag
_0804BA5A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BA60: .4byte gPlayerParty
	thumb_func_end sub_804BA18

	thumb_func_start sub_804BA64
sub_804BA64: @ 804BA64
	push {lr}
	bl GetMultiplayerId
	lsls r0, 24
	ldr r2, _0804BA90 @ =gLinkPlayers
	movs r1, 0x80
	lsls r1, 17
	eors r1, r0
	lsrs r1, 24
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2]
	movs r0, 0x80
	lsls r0, 8
	cmp r1, r0
	bne _0804BA8C
	bl EnableNationalPokedex
_0804BA8C:
	pop {r0}
	bx r0
	.align 2, 0
_0804BA90: .4byte gLinkPlayers
	thumb_func_end sub_804BA64

	thumb_func_start sub_804BA94
sub_804BA94: @ 804BA94
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r4, 24
	lsrs r4, 24
	movs r5, 0x64
	mov r1, r9
	muls r1, r5
	ldr r0, _0804BB60 @ =gPlayerParty
	adds r7, r1, r0
	adds r0, r7, 0
	movs r1, 0x40
	bl GetMonData
	lsls r0, 16
	lsrs r6, r0, 16
	adds r1, r4, 0
	muls r1, r5
	ldr r0, _0804BB64 @ =gEnemyParty
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x40
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	cmp r6, 0xFF
	beq _0804BAE8
	lsls r0, r6, 3
	adds r0, r6
	lsls r0, 2
	ldr r1, _0804BB68 @ =gSaveBlock1 + 0x2B4C
	adds r0, r1
	bl ClearMailStruct
_0804BAE8:
	ldr r4, _0804BB6C @ =gUnknown_03004828
	ldr r0, [r4]
	adds r0, 0x38
	adds r1, r7, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r7, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	ldr r1, [r4]
	adds r1, 0x38
	adds r0, r5, 0
	movs r2, 0x64
	bl memcpy
	movs r1, 0x46
	mov r0, sp
	strb r1, [r0]
	adds r0, r7, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0804BB28
	adds r0, r7, 0
	movs r1, 0x20
	mov r2, sp
	bl SetMonData
_0804BB28:
	mov r0, r8
	cmp r0, 0xFF
	beq _0804BB3E
	lsls r1, r0, 3
	add r1, r8
	lsls r1, 2
	ldr r0, _0804BB70 @ =gUnknown_02029700
	adds r1, r0
	adds r0, r7, 0
	bl GiveMailToMon2
_0804BB3E:
	mov r0, r9
	bl sub_804BA18
	ldr r0, _0804BB74 @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804BB50
	bl sub_804BA64
_0804BB50:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804BB60: .4byte gPlayerParty
_0804BB64: .4byte gEnemyParty
_0804BB68: .4byte gSaveBlock1 + 0x2B4C
_0804BB6C: .4byte gUnknown_03004828
_0804BB70: .4byte gUnknown_02029700
_0804BB74: .4byte gReceivedRemoteLinkPlayers
	thumb_func_end sub_804BA94

	thumb_func_start sub_804BB78
sub_804BB78: @ 804BB78
	push {r4,lr}
	ldr r4, _0804BB8C @ =gUnknown_03004828
	ldr r0, [r4]
	adds r0, 0xBD
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0804BB90
	cmp r0, 0x2
	beq _0804BBB6
	b _0804BBC0
	.align 2, 0
_0804BB8C: .4byte gUnknown_03004828
_0804BB90:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _0804BBB6
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x9E
	movs r2, 0x14
	bl SendBlock
	ldr r1, [r4]
	adds r1, 0xBD
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804BBB6:
	ldr r0, _0804BBC8 @ =gUnknown_03004828
	ldr r0, [r0]
	adds r0, 0xBD
	movs r1, 0
	strb r1, [r0]
_0804BBC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BBC8: .4byte gUnknown_03004828
	thumb_func_end sub_804BB78

	thumb_func_start sub_804BBCC
sub_804BBCC: @ 804BBCC
	push {lr}
	bl sub_804C29C
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_804BBCC

	thumb_func_start sub_804BBE8
sub_804BBE8: @ 804BBE8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x7
	bls _0804BBF4
	b _0804C0CA
_0804BBF4:
	lsls r0, 2
	ldr r1, _0804BC00 @ =_0804BC04
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804BC00: .4byte _0804BC04
	.align 2, 0
_0804BC04:
	.4byte _0804BC24
	.4byte _0804BCC4
	.4byte _0804BD5C
	.4byte _0804BDA4
	.4byte _0804BE48
	.4byte _0804BEF8
	.4byte _0804BFA0
	.4byte _0804C060
_0804BC24:
	ldr r0, _0804BCA0 @ =gUnknown_0820C9F8
	movs r1, 0x10
	movs r2, 0xA0
	bl LoadPalette
	ldr r3, _0804BCA4 @ =gUnknown_0820CA98
	ldr r4, _0804BCA8 @ =0x06004000
	movs r5, 0x98
	lsls r5, 5
	ldr r1, _0804BCAC @ =0x040000d4
	ldr r6, _0804BCB0 @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804BC42:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804BC42
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804BCB4 @ =gUnknown_0820F798
	ldr r2, _0804BCB8 @ =0x06009000
	ldr r0, _0804BCAC @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804BCB0 @ =0x80000800
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _0804BCBC @ =gUnknown_03004828
	ldr r2, [r0]
	movs r0, 0x8A
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0
	strh r0, [r1]
	movs r3, 0x8B
	lsls r3, 1
	adds r1, r2, r3
	movs r0, 0xB4
	strh r0, [r1]
	movs r1, 0x80
	lsls r1, 19
	movs r4, 0xBA
	lsls r4, 5
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0xC
	ldr r2, _0804BCC0 @ =0x00005206
	adds r0, r2, 0
	strh r0, [r1]
	b _0804C0CA
	.align 2, 0
_0804BCA0: .4byte gUnknown_0820C9F8
_0804BCA4: .4byte gUnknown_0820CA98
_0804BCA8: .4byte 0x06004000
_0804BCAC: .4byte 0x040000d4
_0804BCB0: .4byte 0x80000800
_0804BCB4: .4byte gUnknown_0820F798
_0804BCB8: .4byte 0x06009000
_0804BCBC: .4byte gUnknown_03004828
_0804BCC0: .4byte 0x00005206
_0804BCC4:
	ldr r0, _0804BD3C @ =gUnknown_03004828
	ldr r2, [r0]
	movs r3, 0x89
	lsls r3, 1
	adds r1, r2, r3
	movs r0, 0
	strh r0, [r1]
	movs r4, 0x88
	lsls r4, 1
	adds r0, r2, r4
	movs r1, 0xAE
	lsls r1, 1
	strh r1, [r0]
	ldr r0, _0804BD40 @ =REG_BG1VOFS
	strh r1, [r0]
	ldr r1, _0804BD44 @ =REG_BG1CNT
	ldr r2, _0804BD48 @ =0x00008502
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804BD4C @ =gUnknown_08210798
	ldr r2, _0804BD50 @ =0x06002800
	movs r3, 0x80
	lsls r3, 5
	adds r1, 0xCA
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	movs r2, 0x80
	lsls r2, 24
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r4, [r1, 0x8]
	ldr r4, _0804BD54 @ =gUnknown_0820CA98
	movs r5, 0xC0
	lsls r5, 19
	movs r6, 0x98
	lsls r6, 5
	adds r7, r0, 0
_0804BD10:
	str r4, [r1]
	str r5, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r4, r3
	adds r5, r3
	subs r6, r3
	cmp r6, r3
	bhi _0804BD10
	str r4, [r1]
	str r5, [r1, 0x4]
	lsrs r0, r6, 1
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r1, 0x80
	lsls r1, 19
	ldr r3, _0804BD58 @ =0x00001241
	adds r0, r3, 0
	strh r0, [r1]
	b _0804C0CA
	.align 2, 0
_0804BD3C: .4byte gUnknown_03004828
_0804BD40: .4byte REG_BG1VOFS
_0804BD44: .4byte REG_BG1CNT
_0804BD48: .4byte 0x00008502
_0804BD4C: .4byte gUnknown_08210798
_0804BD50: .4byte 0x06002800
_0804BD54: .4byte gUnknown_0820CA98
_0804BD58: .4byte 0x00001241
_0804BD5C:
	ldr r0, _0804BD8C @ =gUnknown_03004828
	ldr r2, [r0]
	movs r4, 0x88
	lsls r4, 1
	adds r0, r2, r4
	movs r1, 0
	strh r1, [r0]
	movs r3, 0x89
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	movs r1, 0x80
	lsls r1, 19
	ldr r4, _0804BD90 @ =0x00001241
	adds r0, r4, 0
	strh r0, [r1]
	ldr r1, _0804BD94 @ =gUnknown_08211798
	ldr r2, _0804BD98 @ =0x06002800
	ldr r0, _0804BD9C @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804BDA0 @ =0x80000400
	b _0804C0C6
	.align 2, 0
_0804BD8C: .4byte gUnknown_03004828
_0804BD90: .4byte 0x00001241
_0804BD94: .4byte gUnknown_08211798
_0804BD98: .4byte 0x06002800
_0804BD9C: .4byte 0x040000d4
_0804BDA0: .4byte 0x80000400
_0804BDA4:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x92
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804BE24 @ =gUnknown_03004828
	ldr r3, [r0]
	movs r4, 0x82
	lsls r4, 1
	adds r1, r3, r4
	movs r2, 0
	movs r0, 0x40
	strh r0, [r1]
	adds r4, 0x2
	adds r1, r3, r4
	strh r0, [r1]
	adds r0, 0xCC
	adds r1, r3, r0
	movs r0, 0x78
	strh r0, [r1]
	adds r4, 0x8
	adds r1, r3, r4
	ldr r0, _0804BE28 @ =0x0000ffba
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r3, r1
	strh r2, [r0]
	ldr r3, _0804BE2C @ =gUnknown_0820DD98
	ldr r4, _0804BE30 @ =0x06004000
	movs r5, 0xD0
	lsls r5, 5
	ldr r2, _0804BE34 @ =gUnknown_08211F98
	mov r12, r2
	ldr r1, _0804BE38 @ =0x040000d4
	ldr r6, _0804BE3C @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804BDF6:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804BDF6
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804BE40 @ =0x06009000
	ldr r0, _0804BE38 @ =0x040000d4
	mov r3, r12
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804BE44 @ =0x80000080
	b _0804C0C6
	.align 2, 0
_0804BE24: .4byte gUnknown_03004828
_0804BE28: .4byte 0x0000ffba
_0804BE2C: .4byte gUnknown_0820DD98
_0804BE30: .4byte 0x06004000
_0804BE34: .4byte gUnknown_08211F98
_0804BE38: .4byte 0x040000d4
_0804BE3C: .4byte 0x80000800
_0804BE40: .4byte 0x06009000
_0804BE44: .4byte 0x80000080
_0804BE48:
	movs r1, 0x80
	lsls r1, 19
	ldr r4, _0804BED0 @ =0x00001441
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0xC
	ldr r2, _0804BED4 @ =0x00001287
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804BED8 @ =gUnknown_03004828
	ldr r3, [r0]
	movs r4, 0x82
	lsls r4, 1
	adds r1, r3, r4
	movs r2, 0
	movs r0, 0x40
	strh r0, [r1]
	adds r0, 0xC6
	adds r1, r3, r0
	movs r0, 0x5C
	strh r0, [r1]
	adds r4, 0x14
	adds r1, r3, r4
	movs r0, 0x20
	strh r0, [r1]
	adds r0, 0xFA
	adds r1, r3, r0
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r3, r1
	strh r2, [r0]
	ldr r3, _0804BEDC @ =gUnknown_08213738
	ldr r4, _0804BEE0 @ =0x06004000
	movs r5, 0x81
	lsls r5, 6
	ldr r2, _0804BEE4 @ =gUnknown_08215778
	mov r12, r2
	ldr r1, _0804BEE8 @ =0x040000d4
	ldr r6, _0804BEEC @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804BEA4:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804BEA4
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804BEF0 @ =0x06009000
	ldr r0, _0804BEE8 @ =0x040000d4
	mov r3, r12
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804BEF4 @ =0x80000080
	b _0804C0C6
	.align 2, 0
_0804BED0: .4byte 0x00001441
_0804BED4: .4byte 0x00001287
_0804BED8: .4byte gUnknown_03004828
_0804BEDC: .4byte gUnknown_08213738
_0804BEE0: .4byte 0x06004000
_0804BEE4: .4byte gUnknown_08215778
_0804BEE8: .4byte 0x040000d4
_0804BEEC: .4byte 0x80000800
_0804BEF0: .4byte 0x06009000
_0804BEF4: .4byte 0x80000080
_0804BEF8:
	ldr r0, _0804BF78 @ =gUnknown_03004828
	ldr r2, [r0]
	movs r4, 0x88
	lsls r4, 1
	adds r0, r2, r4
	movs r1, 0
	strh r1, [r0]
	movs r3, 0x89
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	ldr r1, _0804BF7C @ =REG_BG1CNT
	ldr r4, _0804BF80 @ =0x00000502
	adds r0, r4, 0
	strh r0, [r1]
	ldr r0, _0804BF84 @ =gUnknown_08D00000
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r0, _0804BF88 @ =gUnknown_08D00524
	ldr r4, _0804BF8C @ =0x02000000
	movs r2, 0x80
	lsls r2, 4
	adds r1, r4, 0
	bl CpuSet
	ldr r0, _0804BF90 @ =gUnknown_08D004E0
	movs r1, 0x70
	movs r2, 0x20
	bl LoadCompressedPalette
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	movs r0, 0xE0
	lsls r0, 7
	adds r2, r0, 0
	movs r1, 0xA0
	lsls r1, 2
_0804BF4C:
	ldrh r0, [r4]
	orrs r0, r2
	strh r0, [r4]
	adds r4, 0x2
	subs r1, 0x1
	cmp r1, 0
	bne _0804BF4C
	ldr r1, _0804BF8C @ =0x02000000
	ldr r2, _0804BF94 @ =0x06002800
	ldr r0, _0804BF98 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804BF9C @ =0x80000280
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	movs r0, 0x2
	movs r1, 0xF
	movs r2, 0x1B
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	b _0804C0CA
	.align 2, 0
_0804BF78: .4byte gUnknown_03004828
_0804BF7C: .4byte REG_BG1CNT
_0804BF80: .4byte 0x00000502
_0804BF84: .4byte gUnknown_08D00000
_0804BF88: .4byte gUnknown_08D00524
_0804BF8C: .4byte 0x02000000
_0804BF90: .4byte gUnknown_08D004E0
_0804BF94: .4byte 0x06002800
_0804BF98: .4byte 0x040000d4
_0804BF9C: .4byte 0x80000280
_0804BFA0:
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _0804C038 @ =0x00001441
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0xC
	ldr r3, _0804C03C @ =0x00001287
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0804C040 @ =gUnknown_03004828
	ldr r3, [r0]
	movs r4, 0x82
	lsls r4, 1
	adds r1, r3, r4
	movs r2, 0
	movs r0, 0x40
	strh r0, [r1]
	adds r0, 0xC6
	adds r1, r3, r0
	movs r0, 0x5C
	strh r0, [r1]
	adds r4, 0x14
	adds r1, r3, r4
	adds r0, 0xA4
	strh r0, [r1]
	adds r0, 0x1A
	adds r1, r3, r0
	movs r0, 0x80
	strh r0, [r1]
	subs r4, 0xC
	adds r1, r3, r4
	movs r0, 0x78
	strh r0, [r1]
	adds r0, 0x96
	adds r1, r3, r0
	movs r0, 0x50
	strh r0, [r1]
	movs r1, 0x8E
	lsls r1, 1
	adds r0, r3, r1
	strh r2, [r0]
	ldr r3, _0804C044 @ =gUnknown_08213738
	ldr r4, _0804C048 @ =0x06004000
	movs r5, 0x81
	lsls r5, 6
	ldr r2, _0804C04C @ =gUnknown_08215778
	mov r12, r2
	ldr r1, _0804C050 @ =0x040000d4
	ldr r6, _0804C054 @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804C00A:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804C00A
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804C058 @ =0x06009000
	ldr r0, _0804C050 @ =0x040000d4
	mov r3, r12
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804C05C @ =0x80000080
	b _0804C0C6
	.align 2, 0
_0804C038: .4byte 0x00001441
_0804C03C: .4byte 0x00001287
_0804C040: .4byte gUnknown_03004828
_0804C044: .4byte gUnknown_08213738
_0804C048: .4byte 0x06004000
_0804C04C: .4byte gUnknown_08215778
_0804C050: .4byte 0x040000d4
_0804C054: .4byte 0x80000800
_0804C058: .4byte 0x06009000
_0804C05C: .4byte 0x80000080
_0804C060:
	ldr r0, _0804C0D0 @ =gUnknown_03004828
	ldr r2, [r0]
	movs r4, 0x8A
	lsls r4, 1
	adds r0, r2, r4
	movs r1, 0
	strh r1, [r0]
	movs r3, 0x8B
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	ldr r1, _0804C0D4 @ =REG_BG2CNT
	ldr r4, _0804C0D8 @ =0x00005206
	adds r0, r4, 0
	strh r0, [r1]
	ldr r0, _0804C0DC @ =gUnknown_0820C9F8
	movs r1, 0x10
	movs r2, 0xA0
	bl LoadPalette
	ldr r3, _0804C0E0 @ =gUnknown_0820CA98
	ldr r4, _0804C0E4 @ =0x06004000
	movs r5, 0x98
	lsls r5, 5
	ldr r1, _0804C0E8 @ =0x040000d4
	ldr r6, _0804C0EC @ =0x80000800
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804C09C:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804C09C
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _0804C0F0 @ =gUnknown_0820F798
	ldr r2, _0804C0F4 @ =0x06009000
	ldr r0, _0804C0E8 @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804C0EC @ =0x80000800
_0804C0C6:
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
_0804C0CA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C0D0: .4byte gUnknown_03004828
_0804C0D4: .4byte REG_BG2CNT
_0804C0D8: .4byte 0x00005206
_0804C0DC: .4byte gUnknown_0820C9F8
_0804C0E0: .4byte gUnknown_0820CA98
_0804C0E4: .4byte 0x06004000
_0804C0E8: .4byte 0x040000d4
_0804C0EC: .4byte 0x80000800
_0804C0F0: .4byte gUnknown_0820F798
_0804C0F4: .4byte 0x06009000
	thumb_func_end sub_804BBE8

	thumb_func_start sub_804C0F8
sub_804C0F8: @ 804C0F8
	push {lr}
	lsls r0, 24
	cmp r0, 0
	bne _0804C130
	ldr r0, _0804C128 @ =gUnknown_03004828
	ldr r2, [r0]
	movs r1, 0x88
	lsls r1, 1
	adds r0, r2, r1
	movs r3, 0
	ldrsh r1, [r0, r3]
	ldr r0, _0804C12C @ =0x00000109
	cmp r1, r0
	bgt _0804C15A
	adds r0, 0x5
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r3, 0x8E
	lsls r3, 1
	adds r1, r2, r3
	b _0804C154
	.align 2, 0
_0804C128: .4byte gUnknown_03004828
_0804C12C: .4byte 0x00000109
_0804C130:
	ldr r0, _0804C160 @ =gUnknown_03004828
	ldr r0, [r0]
	mov r12, r0
	movs r2, 0x87
	lsls r2, 1
	add r2, r12
	ldrh r3, [r2]
	movs r0, 0
	ldrsh r1, [r2, r0]
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	ble _0804C15A
	subs r0, r3, 0x1
	strh r0, [r2]
	movs r1, 0x8E
	lsls r1, 1
	add r1, r12
_0804C154:
	ldrh r0, [r1]
	adds r0, 0x40
	strh r0, [r1]
_0804C15A:
	pop {r0}
	bx r0
	.align 2, 0
_0804C160: .4byte gUnknown_03004828
	thumb_func_end sub_804C0F8

	thumb_func_start sub_804C164
sub_804C164: @ 804C164
	push {lr}
	ldr r0, _0804C190 @ =gUnknown_082159A4
	bl LoadSpriteSheet
	ldr r0, _0804C194 @ =gUnknown_082159F4
	bl LoadSpriteSheet
	ldr r0, _0804C198 @ =gUnknown_08215A28
	bl LoadSpriteSheet
	ldr r0, _0804C19C @ =gUnknown_08215A78
	bl LoadSpriteSheet
	ldr r0, _0804C1A0 @ =gUnknown_082159AC
	bl LoadSpritePalette
	ldr r0, _0804C1A4 @ =gUnknown_082159B4
	bl LoadSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_0804C190: .4byte gUnknown_082159A4
_0804C194: .4byte gUnknown_082159F4
_0804C198: .4byte gUnknown_08215A28
_0804C19C: .4byte gUnknown_08215A78
_0804C1A0: .4byte gUnknown_082159AC
_0804C1A4: .4byte gUnknown_082159B4
	thumb_func_end sub_804C164

	thumb_func_start sub_804C1A8
sub_804C1A8: @ 804C1A8
	push {r4,r5,lr}
	sub sp, 0x14
	ldr r0, _0804C21C @ =gUnknown_03004828
	ldr r0, [r0]
	movs r1, 0x8F
	lsls r1, 1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804C23C
	bl GetMultiplayerId
	lsls r0, 24
	ldr r3, _0804C220 @ =gStringVar1
	movs r2, 0x80
	lsls r2, 17
	eors r2, r0
	lsrs r2, 24
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r0, _0804C224 @ =gLinkPlayers + 0x8
	adds r1, r0
	adds r0, r3, 0
	bl StringCopy
	ldr r5, _0804C228 @ =gUnknown_020297D8
	ldrb r0, [r5, 0x1]
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0x64
	muls r0, r4
	ldr r1, _0804C22C @ =gEnemyParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _0804C230 @ =gStringVar3
	mov r1, sp
	bl StringCopy10
	ldrb r0, [r5]
	muls r0, r4
	ldr r1, _0804C234 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _0804C238 @ =gStringVar2
	mov r1, sp
	bl StringCopy10
	b _0804C278
	.align 2, 0
_0804C21C: .4byte gUnknown_03004828
_0804C220: .4byte gStringVar1
_0804C224: .4byte gLinkPlayers + 0x8
_0804C228: .4byte gUnknown_020297D8
_0804C22C: .4byte gEnemyParty
_0804C230: .4byte gStringVar3
_0804C234: .4byte gPlayerParty
_0804C238: .4byte gStringVar2
_0804C23C:
	ldr r0, _0804C280 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	lsls r4, r0, 4
	subs r4, r0
	lsls r4, 2
	ldr r0, _0804C284 @ =gIngameTrades
	adds r4, r0
	ldr r0, _0804C288 @ =gStringVar1
	adds r1, r4, 0
	adds r1, 0x2B
	bl StringCopy
	ldr r0, _0804C28C @ =gStringVar3
	adds r1, r4, 0
	bl StringCopy10
	ldr r0, _0804C290 @ =gSpecialVar_0x8005
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0804C294 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _0804C298 @ =gStringVar2
	mov r1, sp
	bl StringCopy10
_0804C278:
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804C280: .4byte gSpecialVar_0x8004
_0804C284: .4byte gIngameTrades
_0804C288: .4byte gStringVar1
_0804C28C: .4byte gStringVar3
_0804C290: .4byte gSpecialVar_0x8005
_0804C294: .4byte gPlayerParty
_0804C298: .4byte gStringVar2
	thumb_func_end sub_804C1A8

	thumb_func_start sub_804C29C
sub_804C29C: @ 804C29C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	ldr r1, _0804C2C0 @ =gUnknown_03004828
	ldr r0, [r1]
	adds r0, 0xC4
	ldrh r0, [r0]
	adds r6, r1, 0
	cmp r0, 0xC8
	bls _0804C2B6
	bl _0804D570
_0804C2B6:
	lsls r0, 2
	ldr r1, _0804C2C4 @ =_0804C2C8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804C2C0: .4byte gUnknown_03004828
_0804C2C4: .4byte _0804C2C8
	.align 2, 0
_0804C2C8:
	.4byte _0804C5EC
	.4byte _0804C66C
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804C6C8
	.4byte _0804C704
	.4byte _0804C79C
	.4byte _0804D570
	.4byte _0804C824
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804C848
	.4byte _0804C868
	.4byte _0804C87A
	.4byte _0804C89C
	.4byte _0804C8F4
	.4byte _0804C92C
	.4byte _0804C978
	.4byte _0804C9C8
	.4byte _0804CA1C
	.4byte _0804CAB4
	.4byte _0804CAD8
	.4byte _0804CB24
	.4byte _0804CB70
	.4byte _0804CBCC
	.4byte _0804CC2C
	.4byte _0804CC40
	.4byte _0804CC54
	.4byte _0804CC68
	.4byte _0804CD94
	.4byte _0804CE64
	.4byte _0804CEEC
	.4byte _0804CF68
	.4byte _0804CF78
	.4byte _0804CFA0
	.4byte _0804CFFC
	.4byte _0804D028
	.4byte _0804D054
	.4byte _0804D06A
	.4byte _0804D0D4
	.4byte _0804D570
	.4byte _0804D0FC
	.4byte _0804D13C
	.4byte _0804D182
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D1A4
	.4byte _0804D1C4
	.4byte _0804D1D2
	.4byte _0804D1F4
	.4byte _0804D2A8
	.4byte _0804D2E4
	.4byte _0804D314
	.4byte _0804D3C4
	.4byte _0804D41C
	.4byte _0804D48C
	.4byte _0804D4A0
	.4byte _0804D4A6
	.4byte _0804D4CC
	.4byte _0804D528
	.4byte _0804D54C
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804D570
	.4byte _0804CA54
_0804C5EC:
	ldr r3, _0804C65C @ =gSprites
	ldr r0, [r6]
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r4, [r6]
	adds r2, r4, 0
	adds r2, 0xB8
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _0804C660 @ =0x0000ff4c
	strh r1, [r0, 0x24]
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldr r2, _0804C664 @ =gMonFrontPicCoords
	movs r3, 0x90
	lsls r3, 1
	adds r0, r4, r3
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	strh r0, [r1, 0x26]
	adds r1, r4, 0
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	bl GetCurrentMapMusic
	ldr r1, [r6]
	movs r7, 0x92
	lsls r7, 1
	adds r1, r7
	strh r0, [r1]
	ldr r0, _0804C668 @ =0x00000179
	bl PlayBGM
	bl _0804D570
	.align 2, 0
_0804C65C: .4byte gSprites
_0804C660: .4byte 0x0000ff4c
_0804C664: .4byte gMonFrontPicCoords
_0804C668: .4byte 0x00000179
_0804C66C:
	ldr r4, [r6]
	movs r0, 0x8B
	lsls r0, 1
	adds r5, r4, r0
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	ble _0804C6A0
	ldr r2, _0804C69C @ =gSprites
	adds r0, r4, 0
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	adds r1, 0x3
	strh r1, [r0, 0x24]
	ldrh r0, [r5]
	subs r0, 0x3
	strh r0, [r5]
	bl _0804D570
	.align 2, 0
_0804C69C: .4byte gSprites
_0804C6A0:
	ldr r2, _0804C6C4 @ =gSprites
	adds r0, r4, 0
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x24]
	strh r1, [r5]
	adds r1, r4, 0
	adds r1, 0xC4
	movs r0, 0xA
	strh r0, [r1]
	bl _0804D570
	.align 2, 0
_0804C6C4: .4byte gSprites
_0804C6C8:
	ldr r5, _0804C6F8 @ =gStringVar4
	ldr r1, _0804C6FC @ =gTradeText_WillBeSent
	adds r0, r5, 0
	bl StringExpandPlaceholders
	ldr r4, _0804C700 @ =gUnknown_03004828
	ldr r1, [r4]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r5, 0
	movs r3, 0x2
	bl sub_8003460
	ldr r1, [r4]
	adds r2, r1, 0
	adds r2, 0xC4
	movs r3, 0
	movs r0, 0xB
	bl _0804D40C
	.align 2, 0
_0804C6F8: .4byte gStringVar4
_0804C6FC: .4byte gTradeText_WillBeSent
_0804C700: .4byte gUnknown_03004828
_0804C704:
	ldr r2, [r6]
	adds r1, r2, 0
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x50
	beq _0804C718
	bl _0804D570
_0804C718:
	adds r0, r2, 0
	adds r0, 0xB8
	ldrb r0, [r0]
	ldr r2, _0804C78C @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	movs r2, 0x14
	str r2, [sp, 0x8]
	ldr r2, _0804C790 @ =0x000fffff
	str r2, [sp, 0xC]
	movs r2, 0x78
	movs r3, 0x20
	bl sub_8047580
	ldr r1, [r6]
	movs r2, 0x81
	lsls r2, 1
	adds r1, r2
	strb r0, [r1]
	ldr r0, [r6]
	adds r2, r0, 0
	adds r2, 0xC4
	ldrh r1, [r2]
	adds r1, 0x1
	strh r1, [r2]
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1D
	bl ZeroFillWindowRect
	ldr r4, _0804C794 @ =gStringVar4
	ldr r1, _0804C798 @ =gTradeText_ByeBye
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r1, [r6]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x2
	bl sub_8003460
	bl _0804D570
	.align 2, 0
_0804C78C: .4byte gSprites
_0804C790: .4byte 0x000fffff
_0804C794: .4byte gStringVar4
_0804C798: .4byte gTradeText_ByeBye
_0804C79C:
	ldr r7, _0804C810 @ =gSprites
	ldr r2, [r6]
	movs r5, 0x81
	lsls r5, 1
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r7, 0
	adds r4, 0x1C
	adds r0, r4
	ldr r1, [r0]
	ldr r0, _0804C814 @ =SpriteCallbackDummy
	cmp r1, r0
	beq _0804C7C0
	bl _0804D570
_0804C7C0:
	adds r0, r2, 0x4
	bl sub_80035AC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0804C7D2
	bl _0804D570
_0804C7D2:
	ldr r0, _0804C818 @ =gSpriteTemplate_821595C
	movs r1, 0x78
	movs r2, 0x20
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	ldr r2, _0804C81C @ =0x00000103
	adds r1, r2
	strb r0, [r1]
	ldr r3, [r6]
	adds r2, r3, r2
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0804C820 @ =sub_804D738
	str r1, [r0]
	adds r3, r5
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	bl DestroySprite
	ldr r1, [r6]
	bl _0804D53C
	.align 2, 0
_0804C810: .4byte gSprites
_0804C814: .4byte SpriteCallbackDummy
_0804C818: .4byte gSpriteTemplate_821595C
_0804C81C: .4byte 0x00000103
_0804C820: .4byte sub_804D738
_0804C824:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0804C844 @ =gUnknown_03004828
	ldr r0, [r0]
	adds r0, 0xC4
	movs r1, 0x14
	strh r1, [r0]
	bl _0804D570
	.align 2, 0
_0804C844: .4byte gUnknown_03004828
_0804C848:
	ldr r0, _0804C864 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804C858
	bl _0804D570
_0804C858:
	movs r0, 0x4
	bl sub_804BBE8
	bl _0804D538
	.align 2, 0
_0804C864: .4byte gPaletteFade
_0804C868:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl _0804D534
_0804C87A:
	ldr r0, _0804C898 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804C88A
	bl _0804D570
_0804C88A:
	ldr r0, [r6]
	adds r0, 0xC4
	movs r1, 0x17
	strh r1, [r0]
	bl _0804D570
	.align 2, 0
_0804C898: .4byte gPaletteFade
_0804C89C:
	ldr r4, _0804C8B8 @ =gUnknown_03004828
	ldr r0, [r4]
	movs r3, 0x8D
	lsls r3, 1
	adds r2, r0, r3
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	bls _0804C8BC
	adds r0, r1, 0
	subs r0, 0x34
	strh r0, [r2]
	b _0804C8E0
	.align 2, 0
_0804C8B8: .4byte gUnknown_03004828
_0804C8BC:
	movs r0, 0x1
	bl sub_804BBE8
	ldr r3, [r4]
	movs r7, 0x8D
	lsls r7, 1
	adds r1, r3, r7
	movs r2, 0
	movs r0, 0x80
	strh r0, [r1]
	adds r1, r3, 0
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	adds r0, r3, 0
	adds r0, 0xC0
	str r2, [r0]
_0804C8E0:
	ldr r0, _0804C8F0 @ =gUnknown_03004828
	ldr r4, [r0]
	movs r1, 0x8D
	lsls r1, 1
	adds r0, r4, r1
	bl _0804D16E
	.align 2, 0
_0804C8F0: .4byte gUnknown_03004828
_0804C8F4:
	ldr r1, [r6]
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x14
	bhi _0804C906
	bl _0804D570
_0804C906:
	movs r0, 0x3
	bl sub_804BBE8
	bl sub_804B128
	ldr r0, _0804C928 @ =gSpriteTemplate_8215A80
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0xBB
	strb r0, [r1]
	ldr r1, [r6]
	bl _0804D53C
	.align 2, 0
_0804C928: .4byte gSpriteTemplate_8215A80
_0804C92C:
	ldr r2, _0804C96C @ =gSprites
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	blt _0804C94C
	bl _0804D570
_0804C94C:
	adds r0, r1, 0
	bl DestroySprite
	ldr r1, _0804C970 @ =REG_BLDCNT
	movs r3, 0xC8
	lsls r3, 3
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r7, _0804C974 @ =0x0000040c
	adds r0, r7, 0
	strh r0, [r1]
	ldr r1, [r6]
	bl _0804D53C
	.align 2, 0
_0804C96C: .4byte gSprites
_0804C970: .4byte REG_BLDCNT
_0804C974: .4byte 0x0000040c
_0804C978:
	ldr r2, [r6]
	movs r3, 0x88
	lsls r3, 1
	adds r0, r2, r3
	ldrh r1, [r0]
	subs r1, 0x1
	strh r1, [r0]
	lsls r1, 16
	movs r0, 0x9E
	lsls r0, 17
	cmp r1, r0
	bne _0804C99A
	adds r1, r2, 0
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0804C99A:
	ldr r0, [r6]
	adds r0, r3
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0xA4
	lsls r0, 1
	cmp r1, r0
	beq _0804C9AE
	bl _0804D570
_0804C9AE:
	ldr r0, _0804C9C4 @ =gSpriteTemplate_8215A30
	movs r1, 0x80
	movs r2, 0x41
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0xBC
	strb r0, [r1]
	bl _0804D570
	.align 2, 0
_0804C9C4: .4byte gSpriteTemplate_8215A30
_0804C9C8:
	ldr r0, _0804CA0C @ =gSpriteTemplate_82159BC
	movs r1, 0x80
	movs r2, 0x50
	movs r3, 0x3
	bl CreateSprite
	ldr r4, _0804CA10 @ =gUnknown_03004828
	ldr r1, [r4]
	adds r1, 0xBA
	strb r0, [r1]
	ldr r0, _0804CA14 @ =gSpriteTemplate_82159FC
	movs r1, 0x80
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, 0xBB
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804CA18 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r1, [r4]
	bl _0804D53C
	.align 2, 0
_0804CA0C: .4byte gSpriteTemplate_82159BC
_0804CA10: .4byte gUnknown_03004828
_0804CA14: .4byte gSpriteTemplate_82159FC
_0804CA18: .4byte gSprites
_0804CA1C:
	ldr r2, [r6]
	movs r3, 0x88
	lsls r3, 1
	adds r1, r2, r3
	ldrh r0, [r1]
	subs r0, 0x2
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA6
	bne _0804CA3A
	adds r1, r2, 0
	adds r1, 0xC4
	movs r0, 0xC8
	strh r0, [r1]
_0804CA3A:
	movs r0, 0
	bl sub_804C0F8
	movs r1, 0x80
	lsls r1, 19
	ldr r7, _0804CA50 @ =0x00001641
	adds r0, r7, 0
	strh r0, [r1]
	bl _0804D570
	.align 2, 0
_0804CA50: .4byte 0x00001641
_0804CA54:
	ldr r4, _0804CAB0 @ =gSprites
	ldr r2, [r6]
	adds r0, r2, 0
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x22]
	subs r1, 0x2
	strh r1, [r0, 0x22]
	adds r2, 0xBB
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x22]
	subs r1, 0x2
	strh r1, [r0, 0x22]
	movs r0, 0
	bl sub_804C0F8
	ldr r2, [r6]
	adds r0, r2, 0
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r3, 0x22
	ldrsh r1, [r0, r3]
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	blt _0804CAA4
	bl _0804D570
_0804CAA4:
	adds r1, r2, 0
	adds r1, 0xC4
	movs r0, 0x1D
	strh r0, [r1]
	bl _0804D570
	.align 2, 0
_0804CAB0: .4byte gSprites
_0804CAB4:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0804CAD4 @ =gUnknown_03004828
	ldr r0, [r0]
	adds r0, 0xC4
	movs r1, 0x1E
	strh r1, [r0]
	bl _0804D570
	.align 2, 0
_0804CAD4: .4byte gUnknown_03004828
_0804CAD8:
	ldr r0, _0804CB1C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804CAE8
	bl _0804D570
_0804CAE8:
	ldr r0, [r6]
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0804CB20 @ =gSprites
	adds r0, r4
	bl DestroySprite
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	movs r0, 0x2
	bl sub_804BBE8
	ldr r1, [r6]
	bl _0804D53C
	.align 2, 0
_0804CB1C: .4byte gPaletteFade
_0804CB20: .4byte gSprites
_0804CB24:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r5, _0804CB68 @ =gSpriteTemplate_82159FC
	adds r0, r5, 0
	movs r1, 0x6F
	movs r2, 0xAA
	movs r3, 0
	bl CreateSprite
	ldr r4, _0804CB6C @ =gUnknown_03004828
	ldr r1, [r4]
	adds r1, 0xBA
	strb r0, [r1]
	movs r2, 0xA
	negs r2, r2
	adds r0, r5, 0
	movs r1, 0x81
	movs r3, 0
	bl CreateSprite
	ldr r1, [r4]
	adds r1, 0xBB
	strb r0, [r1]
	ldr r1, [r4]
	bl _0804D53C
	.align 2, 0
_0804CB68: .4byte gSpriteTemplate_82159FC
_0804CB6C: .4byte gUnknown_03004828
_0804CB70:
	ldr r0, _0804CBC0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804CB8E
	movs r0, 0x2E
	bl PlaySE
	ldr r0, _0804CBC4 @ =gUnknown_03004828
	ldr r1, [r0]
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0804CB8E:
	ldr r3, _0804CBC8 @ =gSprites
	ldr r0, _0804CBC4 @ =gUnknown_03004828
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
	adds r2, 0xBB
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	bl _0804D570
	.align 2, 0
_0804CBC0: .4byte gPaletteFade
_0804CBC4: .4byte gUnknown_03004828
_0804CBC8: .4byte gSprites
_0804CBCC:
	ldr r5, _0804CC28 @ =gSprites
	ldr r4, [r6]
	adds r2, r4, 0
	adds r2, 0xBA
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
	adds r6, r4, 0
	adds r6, 0xBB
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r5
	movs r7, 0x26
	ldrsh r1, [r3, r7]
	movs r0, 0x5A
	negs r0, r0
	cmp r1, r0
	ble _0804CC12
	bl _0804D570
_0804CC12:
	movs r2, 0x1
	strh r2, [r3, 0x30]
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x30]
	adds r1, r4, 0
	bl _0804D53C
	.align 2, 0
_0804CC28: .4byte gSprites
_0804CC2C:
	ldr r2, _0804CC3C @ =0x0000ffff
	movs r0, 0x1
	movs r1, 0x10
	bl BlendPalettes
	bl _0804D538
	.align 2, 0
_0804CC3C: .4byte 0x0000ffff
_0804CC40:
	ldr r2, _0804CC50 @ =0x0000ffff
	movs r0, 0x1
	movs r1, 0
	bl BlendPalettes
	bl _0804D538
	.align 2, 0
_0804CC50: .4byte 0x0000ffff
_0804CC54:
	ldr r2, _0804CC64 @ =0x0000ffff
	movs r0, 0x1
	movs r1, 0x10
	bl BlendPalettes
	bl _0804D538
	.align 2, 0
_0804CC64: .4byte 0x0000ffff
_0804CC68:
	ldr r5, _0804CCD8 @ =gUnknown_03004828
	ldr r0, [r5]
	movs r1, 0x90
	lsls r1, 1
	adds r0, r1
	ldrh r0, [r0]
	bl sub_8040A3C
	lsls r0, 24
	cmp r0, 0
	bne _0804CCE4
	ldr r4, _0804CCDC @ =gSprites
	ldr r2, [r5]
	adds r2, 0xB8
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x10
	adds r0, r1
	ldr r1, _0804CCE0 @ =gSpriteAffineAnimTable_8215AC0
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x1]
	movs r2, 0x3
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldr r0, [r5]
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	ldr r0, [r5]
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0
	bl StartSpriteAffineAnim
	b _0804CCFA
	.align 2, 0
_0804CCD8: .4byte gUnknown_03004828
_0804CCDC: .4byte gSprites
_0804CCE0: .4byte gSpriteAffineAnimTable_8215AC0
_0804CCE4:
	ldr r0, [r5]
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804CD88 @ =gSprites
	adds r0, r1
	movs r1, 0
	bl StartSpriteAffineAnim
_0804CCFA:
	ldr r5, _0804CD8C @ =gUnknown_03004828
	ldr r0, [r5]
	adds r0, 0xB9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0804CD88 @ =gSprites
	adds r0, r4
	movs r1, 0
	bl StartSpriteAffineAnim
	ldr r2, [r5]
	adds r3, r2, 0
	adds r3, 0xB8
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x3C
	strh r1, [r0, 0x20]
	adds r2, 0xB9
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xB4
	strh r1, [r0, 0x20]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xC0
	strh r1, [r0, 0x22]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _0804CD90 @ =0x0000ffe0
	strh r1, [r0, 0x22]
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, 0xB9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	ldr r1, [r5]
	bl _0804D53C
	.align 2, 0
_0804CD88: .4byte gSprites
_0804CD8C: .4byte gUnknown_03004828
_0804CD90: .4byte 0x0000ffe0
_0804CD94:
	ldr r4, _0804CE5C @ =gSprites
	ldr r2, [r6]
	adds r3, r2, 0
	adds r3, 0xB8
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	movs r5, 0
	strh r1, [r0, 0x26]
	adds r2, 0xB9
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x26]
	adds r0, 0xA3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bhi _0804CDDC
	movs r0, 0x2D
	bl PlaySE
_0804CDDC:
	ldr r2, [r6]
	adds r3, r2, 0
	adds r3, 0xB8
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r7, 0x26
	ldrsh r1, [r0, r7]
	movs r0, 0xDE
	negs r0, r0
	cmp r1, r0
	blt _0804CDFA
	b _0804D570
_0804CDFA:
	adds r0, r2, 0
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r5, [r0, 0x30]
	adds r0, r2, 0
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r5, [r0, 0x30]
	adds r1, r2, 0
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r6]
	adds r0, 0xB9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	ldr r2, _0804CE60 @ =0x0000ffff
	movs r0, 0x1
	movs r1, 0
	bl BlendPalettes
	b _0804D570
	.align 2, 0
_0804CE5C: .4byte gSprites
_0804CE60: .4byte 0x0000ffff
_0804CE64:
	ldr r4, _0804CEE8 @ =gSprites
	ldr r2, [r6]
	adds r3, r2, 0
	adds r3, 0xBA
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
	adds r2, 0xBB
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r2, 0x26
	ldrsh r1, [r0, r2]
	movs r0, 0xDE
	negs r0, r0
	cmp r1, r0
	ble _0804CEA6
	b _0804D570
_0804CEA6:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, [r6]
	adds r2, r1, 0
	adds r2, 0xC4
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0xBA
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	b _0804D570
	.align 2, 0
_0804CEE8: .4byte gSprites
_0804CEEC:
	ldr r0, _0804CF58 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804CEFA
	b _0804D570
_0804CEFA:
	ldr r1, [r6]
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x1
	bl sub_804BBE8
	ldr r0, [r6]
	movs r3, 0x88
	lsls r3, 1
	adds r0, r3
	movs r1, 0xA6
	strh r1, [r0]
	ldr r0, _0804CF5C @ =gSpriteTemplate_82159BC
	movs r4, 0x14
	negs r4, r4
	movs r1, 0x80
	adds r2, r4, 0
	movs r3, 0x3
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0xBA
	strb r0, [r1]
	ldr r0, _0804CF60 @ =gSpriteTemplate_82159FC
	movs r1, 0x80
	adds r2, r4, 0
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0xBB
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804CF64 @ =gSprites
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	b _0804D570
	.align 2, 0
_0804CF58: .4byte gPaletteFade
_0804CF5C: .4byte gSpriteTemplate_82159BC
_0804CF60: .4byte gSpriteTemplate_82159FC
_0804CF64: .4byte gSprites
_0804CF68:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0
	str r0, [sp]
	adds r0, r1, 0
	movs r2, 0x10
	movs r3, 0
	b _0804D534
_0804CF78:
	movs r1, 0x80
	lsls r1, 19
	ldr r7, _0804CF98 @ =0x00001641
	adds r0, r7, 0
	strh r0, [r1]
	movs r0, 0x1
	bl sub_804C0F8
	ldr r0, _0804CF9C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804CF96
	b _0804D570
_0804CF96:
	b _0804D538
	.align 2, 0
_0804CF98: .4byte 0x00001641
_0804CF9C: .4byte gPaletteFade
_0804CFA0:
	movs r0, 0x1
	bl sub_804C0F8
	ldr r2, _0804CFF4 @ =gSprites
	ldr r0, _0804CFF8 @ =gUnknown_03004828
	ldr r3, [r0]
	adds r4, r3, 0
	adds r4, 0xBA
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	adds r0, r3, 0
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	strh r1, [r0, 0x26]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r2, 0x26
	ldrsh r1, [r0, r2]
	movs r7, 0x22
	ldrsh r0, [r0, r7]
	adds r1, r0
	cmp r1, 0x40
	beq _0804CFEE
	b _0804D570
_0804CFEE:
	adds r1, r3, 0
	b _0804D53C
	.align 2, 0
_0804CFF4: .4byte gSprites
_0804CFF8: .4byte gUnknown_03004828
_0804CFFC:
	movs r0, 0x1
	bl sub_804C0F8
	ldr r0, _0804D024 @ =gUnknown_03004828
	ldr r1, [r0]
	movs r0, 0x88
	lsls r0, 1
	adds r2, r1, r0
	ldrh r0, [r2]
	adds r0, 0x2
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x9E
	lsls r3, 1
	cmp r0, r3
	bgt _0804D020
	b _0804D570
_0804D020:
	strh r3, [r2]
	b _0804D53C
	.align 2, 0
_0804D024: .4byte gUnknown_03004828
_0804D028:
	ldr r0, [r6]
	adds r0, 0xBA
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0804D050 @ =gSprites
	adds r0, r4
	bl DestroySprite
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	b _0804D400
	.align 2, 0
_0804D050: .4byte gSprites
_0804D054:
	ldr r2, [r6]
	adds r1, r2, 0
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0xA
	beq _0804D066
	b _0804D570
_0804D066:
	adds r1, 0x4
	b _0804D53E
_0804D06A:
	ldr r1, [r6]
	movs r4, 0x88
	lsls r4, 1
	adds r2, r1, r4
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0xAE
	lsls r3, 1
	cmp r0, r3
	ble _0804D08E
	strh r3, [r2]
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0804D08E:
	ldr r0, [r6]
	adds r0, r4
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0xA4
	lsls r0, 1
	cmp r1, r0
	bne _0804D0B0
	ldr r0, _0804D0C8 @ =gSpriteTemplate_8215A30
	movs r1, 0x80
	movs r2, 0x41
	movs r3, 0
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0xBC
	strb r0, [r1]
_0804D0B0:
	ldr r2, _0804D0CC @ =gSprites
	ldr r0, [r6]
	adds r0, 0xBC
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0804D0D0 @ =sub_804B0E0
	str r1, [r0]
	b _0804D570
	.align 2, 0
_0804D0C8: .4byte gSpriteTemplate_8215A30
_0804D0CC: .4byte gSprites
_0804D0D0: .4byte sub_804B0E0
_0804D0D4:
	ldr r0, _0804D0F4 @ =gSpriteTemplate_8215A80
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	ldr r2, _0804D0F8 @ =gUnknown_03004828
	ldr r1, [r2]
	adds r1, 0xBB
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, 0xC4
	movs r1, 0x32
	strh r1, [r0]
	b _0804D570
	.align 2, 0
_0804D0F4: .4byte gSpriteTemplate_8215A80
_0804D0F8: .4byte gUnknown_03004828
_0804D0FC:
	ldr r2, _0804D138 @ =gSprites
	ldr r0, [r6]
	adds r0, 0xBB
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	blt _0804D11A
	b _0804D570
_0804D11A:
	adds r0, r1, 0
	bl DestroySprite
	movs r0, 0x6
	bl sub_804BBE8
	ldr r1, [r6]
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	movs r0, 0x9F
	bl PlaySE
	b _0804D570
	.align 2, 0
_0804D138: .4byte gSprites
_0804D13C:
	ldr r1, [r6]
	movs r3, 0x8D
	lsls r3, 1
	adds r2, r1, r3
	ldrh r3, [r2]
	ldr r0, _0804D154 @ =0x000003ff
	cmp r3, r0
	bhi _0804D158
	adds r0, r3, 0
	adds r0, 0x34
	strh r0, [r2]
	b _0804D166
	.align 2, 0
_0804D154: .4byte 0x000003ff
_0804D158:
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r2]
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_0804D166:
	ldr r4, [r6]
	movs r7, 0x8D
	lsls r7, 1
	adds r0, r4, r7
_0804D16E:
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 8
	bl __divsi3
	movs r2, 0x8C
	lsls r2, 1
	adds r1, r4, r2
	strh r0, [r1]
	b _0804D570
_0804D182:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0804D1A0 @ =gUnknown_03004828
	ldr r0, [r0]
	adds r0, 0xC4
	movs r1, 0x3C
	strh r1, [r0]
	b _0804D570
	.align 2, 0
_0804D1A0: .4byte gUnknown_03004828
_0804D1A4:
	ldr r0, _0804D1C0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804D1B2
	b _0804D570
_0804D1B2:
	movs r0, 0x5
	bl sub_804BBE8
	movs r0, 0x7
	bl sub_804BBE8
	b _0804D538
	.align 2, 0
_0804D1C0: .4byte gPaletteFade
_0804D1C4:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	b _0804D534
_0804D1D2:
	movs r1, 0x80
	lsls r1, 19
	movs r3, 0xA2
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _0804D1F0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804D1EC
	b _0804D570
_0804D1EC:
	ldr r1, [r6]
	b _0804D53C
	.align 2, 0
_0804D1F0: .4byte gPaletteFade
_0804D1F4:
	ldr r0, _0804D290 @ =gSpriteTemplate_821595C
	movs r2, 0x8
	negs r2, r2
	movs r1, 0x78
	movs r3, 0
	bl CreateSprite
	ldr r6, _0804D294 @ =gUnknown_03004828
	ldr r1, [r6]
	ldr r5, _0804D298 @ =0x00000103
	adds r1, r5
	movs r7, 0
	mov r8, r7
	strb r0, [r1]
	ldr r4, _0804D29C @ =gSprites
	ldr r2, [r6]
	adds r2, r5
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x4A
	strh r1, [r0, 0x34]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0804D2A0 @ =sub_804D80C
	str r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldr r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	ldr r2, _0804D2A4 @ =0x0000ffff
	movs r1, 0x10
	bl BlendPalettes
	ldr r1, [r6]
	adds r2, r1, 0
	adds r2, 0xC4
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	adds r1, 0xC0
	mov r0, r8
	str r0, [r1]
	b _0804D570
	.align 2, 0
_0804D290: .4byte gSpriteTemplate_821595C
_0804D294: .4byte gUnknown_03004828
_0804D298: .4byte 0x00000103
_0804D29C: .4byte gSprites
_0804D2A0: .4byte sub_804D80C
_0804D2A4: .4byte 0x0000ffff
_0804D2A8:
	ldr r2, _0804D2D8 @ =gSprites
	ldr r0, [r6]
	ldr r1, _0804D2DC @ =0x00000103
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	ldr r1, _0804D2E0 @ =0x0000ffff
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, [r6]
	b _0804D53C
	.align 2, 0
_0804D2D8: .4byte gSprites
_0804D2DC: .4byte 0x00000103
_0804D2E0: .4byte 0x0000ffff
_0804D2E4:
	ldr r2, _0804D308 @ =gSprites
	ldr r3, [r6]
	ldr r7, _0804D30C @ =0x00000103
	adds r0, r3, r7
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0804D310 @ =SpriteCallbackDummy
	cmp r1, r0
	beq _0804D302
	b _0804D570
_0804D302:
	adds r1, r3, 0
	b _0804D53C
	.align 2, 0
_0804D308: .4byte gSprites
_0804D30C: .4byte 0x00000103
_0804D310: .4byte SpriteCallbackDummy
_0804D314:
	ldr r4, _0804D3B4 @ =gSprites
	ldr r0, [r6]
	mov r8, r0
	mov r5, r8
	adds r5, 0xB9
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r3, 0
	movs r1, 0x78
	strh r1, [r0, 0x20]
	ldrb r0, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldr r2, _0804D3B8 @ =gMonFrontPicCoords
	movs r0, 0x91
	lsls r0, 1
	add r0, r8
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	adds r0, 0x3C
	strh r0, [r1, 0x22]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x24]
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x26]
	ldrb r0, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1
	str r2, [sp, 0x4]
	movs r2, 0x14
	str r2, [sp, 0x8]
	ldr r2, _0804D3BC @ =0x000fffff
	str r2, [sp, 0xC]
	movs r2, 0x78
	movs r3, 0x54
	bl CreatePokeballSprite
	ldr r0, [r6]
	ldr r5, _0804D3C0 @ =0x00000103
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldr r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, [r6]
	b _0804D53C
	.align 2, 0
_0804D3B4: .4byte gSprites
_0804D3B8: .4byte gMonFrontPicCoords
_0804D3BC: .4byte 0x000fffff
_0804D3C0: .4byte 0x00000103
_0804D3C4:
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xBA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, [r6]
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1D
	bl ZeroFillWindowRect
	ldr r4, _0804D414 @ =gStringVar4
	ldr r1, _0804D418 @ =gTradeText_SentOverPoke
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r1, [r6]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x2
	bl sub_8003460
_0804D400:
	ldr r1, [r6]
	adds r2, r1, 0
	adds r2, 0xC4
	ldrh r0, [r2]
	adds r0, 0x1
	movs r3, 0
_0804D40C:
	strh r0, [r2]
	adds r1, 0xC0
	str r3, [r1]
	b _0804D570
	.align 2, 0
_0804D414: .4byte gStringVar4
_0804D418: .4byte gTradeText_SentOverPoke
_0804D41C:
	ldr r1, [r6]
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x4
	bne _0804D430
	ldr r0, _0804D480 @ =0x00000173
	bl PlayFanfare
_0804D430:
	ldr r2, [r6]
	adds r0, r2, 0
	adds r0, 0xC0
	ldr r0, [r0]
	cmp r0, 0xF0
	beq _0804D43E
	b _0804D570
_0804D43E:
	adds r1, r2, 0
	adds r1, 0xC4
	ldrh r0, [r1]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r1]
	adds r0, r2, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1D
	bl ZeroFillWindowRect
	ldr r4, _0804D484 @ =gStringVar4
	ldr r1, _0804D488 @ =gTradeText_TakeGoodCare
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r1, [r6]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x2
	bl sub_8003460
	ldr r0, [r6]
	adds r0, 0xC0
	str r5, [r0]
	b _0804D570
	.align 2, 0
_0804D480: .4byte 0x00000173
_0804D484: .4byte gStringVar4
_0804D488: .4byte gTradeText_TakeGoodCare
_0804D48C:
	ldr r2, [r6]
	adds r1, r2, 0
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bne _0804D570
	adds r1, 0x4
	b _0804D53E
_0804D4A0:
	bl sub_804E1DC
	b _0804D538
_0804D4A6:
	ldr r2, [r6]
	movs r3, 0x8F
	lsls r3, 1
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0
	beq _0804D4B8
	movs r0, 0x1
	b _0804D572
_0804D4B8:
	ldr r0, _0804D4C8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0804D570
	adds r1, r2, 0
	b _0804D53C
	.align 2, 0
_0804D4C8: .4byte gMain
_0804D4CC:
	ldr r0, _0804D510 @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	movs r1, 0
	bl sub_804BA94
	ldr r1, _0804D514 @ =gUnknown_03005E94
	ldr r0, _0804D518 @ =sub_804BBCC
	str r0, [r1]
	ldr r7, _0804D51C @ =gUnknown_020297D8
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0804D520 @ =gPlayerParty
	adds r0, r5
	movs r1, 0x1
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _0804D538
	ldrb r3, [r7]
	adds r0, r3, 0
	muls r0, r6
	adds r0, r5
	ldr r1, _0804D524 @ =gUnknown_03004828
	ldr r1, [r1]
	adds r1, 0xB9
	ldrb r2, [r1]
	adds r1, r4, 0
	bl TradeEvolutionScene
	b _0804D538
	.align 2, 0
_0804D510: .4byte gSpecialVar_0x8005
_0804D514: .4byte gUnknown_03005E94
_0804D518: .4byte sub_804BBCC
_0804D51C: .4byte gUnknown_020297D8
_0804D520: .4byte gPlayerParty
_0804D524: .4byte gUnknown_03004828
_0804D528:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
_0804D534:
	bl BeginNormalPaletteFade
_0804D538:
	ldr r0, _0804D548 @ =gUnknown_03004828
	ldr r1, [r0]
_0804D53C:
	adds r1, 0xC4
_0804D53E:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0804D570
	.align 2, 0
_0804D548: .4byte gUnknown_03004828
_0804D54C:
	ldr r0, _0804D580 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804D570
	ldr r0, [r6]
	movs r7, 0x92
	lsls r7, 1
	adds r0, r7
	ldrh r0, [r0]
	bl PlayBGM
	ldr r0, _0804D584 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	bl sub_804D8E4
_0804D570:
	movs r0, 0
_0804D572:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804D580: .4byte gPaletteFade
_0804D584: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_804C29C

	thumb_func_start sub_804D588
sub_804D588: @ 804D588
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _0804D5A0 @ =gMain
	ldr r2, _0804D5A4 @ =0x0000043c
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _0804D5A8
	cmp r0, 0x4
	beq _0804D5B8
	b _0804D614
	.align 2, 0
_0804D5A0: .4byte gMain
_0804D5A4: .4byte 0x0000043c
_0804D5A8:
	movs r0, 0x4
	strb r0, [r1]
	ldr r1, _0804D5B4 @ =gSoftResetDisabled
	movs r0, 0x1
	b _0804D612
	.align 2, 0
_0804D5B4: .4byte gSoftResetDisabled
_0804D5B8:
	ldr r0, _0804D5F4 @ =gUnknown_03005E94
	ldr r1, _0804D5F8 @ =sub_804DC88
	mov r8, r1
	str r1, [r0]
	ldr r7, _0804D5FC @ =gUnknown_020297D8
	ldrb r0, [r7]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0804D600 @ =gPlayerParty
	adds r0, r5
	movs r1, 0x1
	movs r2, 0
	bl GetEvolutionTargetSpecies
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	beq _0804D608
	ldrb r3, [r7]
	adds r0, r3, 0
	muls r0, r6
	adds r0, r5
	ldr r1, _0804D604 @ =gUnknown_03004828
	ldr r1, [r1]
	adds r1, 0xB9
	ldrb r2, [r1]
	adds r1, r4, 0
	bl TradeEvolutionScene
	b _0804D60E
	.align 2, 0
_0804D5F4: .4byte gUnknown_03005E94
_0804D5F8: .4byte sub_804DC88
_0804D5FC: .4byte gUnknown_020297D8
_0804D600: .4byte gPlayerParty
_0804D604: .4byte gUnknown_03004828
_0804D608:
	mov r0, r8
	bl SetMainCallback2
_0804D60E:
	ldr r1, _0804D638 @ =gUnknown_020297D8
	movs r0, 0xFF
_0804D612:
	strb r0, [r1]
_0804D614:
	bl HasLinkErrorOccurred
	lsls r0, 24
	cmp r0, 0
	bne _0804D622
	bl RunTasks
_0804D622:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804D638: .4byte gUnknown_020297D8
	thumb_func_end sub_804D588

	thumb_func_start sub_804D63C
sub_804D63C: @ 804D63C
	push {r4-r6,lr}
	bl sub_804B2B0
	bl GetBlockReceivedStatus
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0x1
	adds r0, r5, 0
	ands r0, r6
	cmp r0, 0
	beq _0804D67A
	ldr r4, _0804D6A8 @ =gBlockRecvBuffer
	ldrh r1, [r4]
	ldr r0, _0804D6AC @ =0x0000dcba
	cmp r1, r0
	bne _0804D664
	ldr r0, _0804D6B0 @ =sub_804D588
	bl SetMainCallback2
_0804D664:
	ldrh r1, [r4]
	ldr r0, _0804D6B4 @ =0x0000abcd
	cmp r1, r0
	bne _0804D674
	ldr r0, _0804D6B8 @ =gUnknown_03004828
	ldr r0, [r0]
	adds r0, 0x9C
	strb r6, [r0]
_0804D674:
	movs r0, 0
	bl ResetBlockReceivedFlag
_0804D67A:
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _0804D6A2
	ldr r0, _0804D6A8 @ =gBlockRecvBuffer
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0804D6B4 @ =0x0000abcd
	cmp r1, r0
	bne _0804D69C
	ldr r0, _0804D6B8 @ =gUnknown_03004828
	ldr r0, [r0]
	adds r0, 0x9D
	movs r1, 0x1
	strb r1, [r0]
_0804D69C:
	movs r0, 0x1
	bl ResetBlockReceivedFlag
_0804D6A2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D6A8: .4byte gBlockRecvBuffer
_0804D6AC: .4byte 0x0000dcba
_0804D6B0: .4byte sub_804D588
_0804D6B4: .4byte 0x0000abcd
_0804D6B8: .4byte gUnknown_03004828
	thumb_func_end sub_804D63C

	thumb_func_start sub_804D6BC
sub_804D6BC: @ 804D6BC
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	movs r1, 0xA
	bl __divsi3
	ldrh r4, [r5, 0x22]
	adds r4, r0
	strh r4, [r5, 0x22]
	ldrh r0, [r5, 0x30]
	ldrh r2, [r5, 0x38]
	adds r0, r2
	strh r0, [r5, 0x38]
	movs r1, 0x38
	ldrsh r0, [r5, r1]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r5, 0x20]
	lsls r4, 16
	asrs r4, 16
	cmp r4, 0x4C
	ble _0804D70A
	movs r0, 0x4C
	strh r0, [r5, 0x22]
	movs r2, 0x2E
	ldrsh r1, [r5, r2]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	muls r0, r1
	negs r0, r0
	movs r1, 0x64
	bl __divsi3
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
_0804D70A:
	movs r1, 0x20
	ldrsh r0, [r5, r1]
	cmp r0, 0x78
	bne _0804D716
	movs r0, 0
	strh r0, [r5, 0x30]
_0804D716:
	ldrh r0, [r5, 0x36]
	ldrh r2, [r5, 0x2E]
	adds r0, r2
	strh r0, [r5, 0x2E]
	movs r1, 0x34
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bne _0804D72E
	movs r0, 0x1
	strh r0, [r5, 0x3C]
	ldr r0, _0804D734 @ =SpriteCallbackDummy
	str r0, [r5, 0x1C]
_0804D72E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804D734: .4byte SpriteCallbackDummy
	thumb_func_end sub_804D6BC

	thumb_func_start sub_804D738
sub_804D738: @ 804D738
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _0804D7A0 @ =gTradeBallVerticalVelocityTable
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x16
	bne _0804D760
	movs r0, 0x38
	bl PlaySE
_0804D760:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2C
	bne _0804D796
	movs r0, 0x8C
	bl PlaySE
	ldr r0, _0804D7A4 @ =sub_804D7AC
	str r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldrb r1, [r4, 0x5]
	lsrs r1, 4
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	movs r1, 0x1
	negs r1, r1
	ldr r2, _0804D7A8 @ =0x0000ffff
	str r2, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0804D796:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D7A0: .4byte gTradeBallVerticalVelocityTable
_0804D7A4: .4byte sub_804D7AC
_0804D7A8: .4byte 0x0000ffff
	thumb_func_end sub_804D738

	thumb_func_start sub_804D7AC
sub_804D7AC: @ 804D7AC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x14
	bne _0804D7C0
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_0804D7C0:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _0804D7FE
	ldr r1, _0804D804 @ =gTradeBallVerticalVelocityTable
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	ldrh r0, [r4, 0x26]
	subs r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x17
	bne _0804D7FE
	adds r0, r4, 0
	bl DestroySprite
	ldr r0, _0804D808 @ =gUnknown_03004828
	ldr r0, [r0]
	adds r0, 0xC4
	movs r1, 0xE
	strh r1, [r0]
_0804D7FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D804: .4byte gTradeBallVerticalVelocityTable
_0804D808: .4byte gUnknown_03004828
	thumb_func_end sub_804D7AC

	thumb_func_start sub_804D80C
sub_804D80C: @ 804D80C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x32]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0804D83C
	ldrh r0, [r4, 0x22]
	adds r0, 0x4
	strh r0, [r4, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x34
	ldrsh r1, [r4, r3]
	cmp r0, r1
	ble _0804D88C
	adds r0, r2, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0x16
	strh r0, [r4, 0x2E]
	movs r0, 0x38
	bl PlaySE
	b _0804D88C
_0804D83C:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x42
	bne _0804D84A
	movs r0, 0x39
	bl PlaySE
_0804D84A:
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x5C
	bne _0804D858
	movs r0, 0x3A
	bl PlaySE
_0804D858:
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	cmp r0, 0x6B
	bne _0804D866
	movs r0, 0x3B
	bl PlaySE
_0804D866:
	ldr r1, _0804D894 @ =gTradeBallVerticalVelocityTable
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldrh r3, [r4, 0x26]
	adds r0, r3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6C
	bne _0804D88C
	ldr r0, _0804D898 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_0804D88C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D894: .4byte gTradeBallVerticalVelocityTable
_0804D898: .4byte SpriteCallbackDummy
	thumb_func_end sub_804D80C

	thumb_func_start sub_804D89C
sub_804D89C: @ 804D89C
	push {r4-r6,lr}
	ldr r0, _0804D8D0 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	lsls r4, r0, 4
	subs r4, r0
	lsls r4, 2
	ldr r0, _0804D8D4 @ =gIngameTrades
	adds r4, r0
	ldr r0, _0804D8D8 @ =gStringVar1
	ldrh r1, [r4, 0x38]
	movs r6, 0xB
	muls r1, r6
	ldr r5, _0804D8DC @ =gSpeciesNames
	adds r1, r5
	bl StringCopy
	ldr r0, _0804D8E0 @ =gStringVar2
	ldrh r1, [r4, 0xC]
	muls r1, r6
	adds r1, r5
	bl StringCopy
	ldrh r0, [r4, 0x38]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804D8D0: .4byte gSpecialVar_0x8004
_0804D8D4: .4byte gIngameTrades
_0804D8D8: .4byte gStringVar1
_0804D8DC: .4byte gSpeciesNames
_0804D8E0: .4byte gStringVar2
	thumb_func_end sub_804D89C

	thumb_func_start sub_804D8E4
sub_804D8E4: @ 804D8E4
	push {r4,lr}
	sub sp, 0x20
	ldr r0, _0804D92C @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	lsls r4, r0, 4
	subs r4, r0
	lsls r4, 2
	ldr r0, _0804D930 @ =gIngameTrades
	adds r4, r0
	ldr r0, _0804D934 @ =gSpecialVar_0x8005
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0804D938 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	ldr r0, _0804D93C @ =gStringVar1
	mov r1, sp
	bl StringCopy10
	ldr r0, _0804D940 @ =gStringVar2
	ldrh r2, [r4, 0xC]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _0804D944 @ =gSpeciesNames
	adds r1, r2
	bl StringCopy
	add sp, 0x20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D92C: .4byte gSpecialVar_0x8004
_0804D930: .4byte gIngameTrades
_0804D934: .4byte gSpecialVar_0x8005
_0804D938: .4byte gPlayerParty
_0804D93C: .4byte gStringVar1
_0804D940: .4byte gStringVar2
_0804D944: .4byte gSpeciesNames
	thumb_func_end sub_804D8E4

	thumb_func_start sub_804D948
sub_804D948: @ 804D948
	push {r4-r7,lr}
	sub sp, 0x38
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, r1, 4
	subs r2, r1
	lsls r2, 2
	ldr r1, _0804DAA4 @ =gIngameTrades
	adds r5, r2, r1
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0804DAA8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	add r4, sp, 0x34
	movs r0, 0xFE
	strb r0, [r4]
	ldr r6, _0804DAAC @ =gEnemyParty
	ldrh r1, [r5, 0xC]
	movs r3, 0x1
	str r3, [sp]
	ldr r0, [r5, 0x24]
	str r0, [sp, 0x4]
	str r3, [sp, 0x8]
	ldr r0, [r5, 0x18]
	str r0, [sp, 0xC]
	adds r0, r6, 0
	movs r3, 0x20
	bl CreateMon
	adds r2, r5, 0
	adds r2, 0xE
	adds r0, r6, 0
	movs r1, 0x27
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0xF
	adds r0, r6, 0
	movs r1, 0x28
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x10
	adds r0, r6, 0
	movs r1, 0x29
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x11
	adds r0, r6, 0
	movs r1, 0x2A
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x12
	adds r0, r6, 0
	movs r1, 0x2B
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x13
	adds r0, r6, 0
	movs r1, 0x2C
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x2
	adds r2, r5, 0
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x2B
	adds r0, r6, 0
	movs r1, 0x7
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x36
	adds r0, r6, 0
	movs r1, 0x31
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x14
	adds r0, r6, 0
	movs r1, 0x2E
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x1D
	adds r0, r6, 0
	movs r1, 0x17
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x1E
	adds r0, r6, 0
	movs r1, 0x18
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x1C
	adds r0, r6, 0
	movs r1, 0x16
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x1F
	adds r0, r6, 0
	movs r1, 0x21
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x20
	adds r0, r6, 0
	movs r1, 0x2F
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x37
	adds r0, r6, 0
	movs r1, 0x30
	bl SetMonData
	adds r0, r6, 0
	movs r1, 0x23
	adds r2, r4, 0
	bl SetMonData
	mov r4, sp
	adds r4, 0x35
	movs r0, 0
	strb r0, [r4]
	ldrh r0, [r5, 0x28]
	cmp r0, 0
	beq _0804DAC0
	bl ItemIsMail
	lsls r0, 24
	cmp r0, 0
	beq _0804DAB4
	add r0, sp, 0x10
	adds r1, r5, 0
	bl sub_804DAD4
	ldr r0, _0804DAB0 @ =gUnknown_02029700
	add r1, sp, 0x10
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	ldm r1!, {r2,r3,r7}
	stm r0!, {r2,r3,r7}
	adds r0, r6, 0
	movs r1, 0x40
	adds r2, r4, 0
	bl SetMonData
	adds r2, r5, 0
	adds r2, 0x28
	adds r0, r6, 0
	movs r1, 0xC
	bl SetMonData
	b _0804DAC0
	.align 2, 0
_0804DAA4: .4byte gIngameTrades
_0804DAA8: .4byte gPlayerParty
_0804DAAC: .4byte gEnemyParty
_0804DAB0: .4byte gUnknown_02029700
_0804DAB4:
	adds r2, r5, 0
	adds r2, 0x28
	adds r0, r6, 0
	movs r1, 0xC
	bl SetMonData
_0804DAC0:
	ldr r0, _0804DAD0 @ =gEnemyParty
	bl CalculateMonStats
	add sp, 0x38
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804DAD0: .4byte gEnemyParty
	thumb_func_end sub_804D948

.section .text.sub_804DB2C

	thumb_func_start sub_804DB2C
sub_804DB2C: @ 804DB2C
	push {r4-r6,lr}
	ldr r6, _0804DB58 @ =gSpecialVar_0x8005
	ldrh r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _0804DB5C @ =gPlayerParty
	adds r0, r4
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0804DB60
	ldrh r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	b _0804DB62
	.align 2, 0
_0804DB58: .4byte gSpecialVar_0x8005
_0804DB5C: .4byte gPlayerParty
_0804DB60:
	movs r0, 0
_0804DB62:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_804DB2C

	thumb_func_start sub_804DB68
sub_804DB68: @ 804DB68
	push {lr}
	ldr r0, _0804DB7C @ =gSpecialVar_0x8005
	ldrb r0, [r0]
	ldr r1, _0804DB80 @ =gSpecialVar_0x8004
	ldrb r1, [r1]
	bl sub_804D948
	pop {r0}
	bx r0
	.align 2, 0
_0804DB7C: .4byte gSpecialVar_0x8005
_0804DB80: .4byte gSpecialVar_0x8004
	thumb_func_end sub_804DB68

	thumb_func_start sub_804DB84
sub_804DB84: @ 804DB84
	push {r4-r6,lr}
	bl sub_804C29C
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	bne _0804DBE6
	ldr r5, _0804DC04 @ =gUnknown_03004828
	ldr r0, [r5]
	adds r0, 0xB8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0804DC08 @ =gSprites
	adds r0, r4
	bl DestroySprite
	ldr r0, [r5]
	adds r0, 0xB9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldr r0, _0804DC0C @ =gUnknown_020297D8
	ldrb r4, [r0]
	ldrb r0, [r0, 0x1]
	movs r1, 0x6
	bl __umodsi3
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_804BA94
	ldr r0, [r5]
	adds r2, r0, 0
	adds r2, 0x9E
	ldr r1, _0804DC10 @ =0x0000abcd
	strh r1, [r2]
	adds r0, 0xBD
	strb r6, [r0]
	ldr r0, _0804DC14 @ =sub_804DC18
	bl SetMainCallback2
_0804DBE6:
	bl sub_804BB78
	bl sub_804D63C
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804DC04: .4byte gUnknown_03004828
_0804DC08: .4byte gSprites
_0804DC0C: .4byte gUnknown_020297D8
_0804DC10: .4byte 0x0000abcd
_0804DC14: .4byte sub_804DC18
	thumb_func_end sub_804DB84

	thumb_func_start sub_804DC18
sub_804DC18: @ 804DC18
	push {r4,lr}
	bl sub_804B2B0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_804D63C
	cmp r4, 0
	bne _0804DC64
	ldr r4, _0804DC7C @ =gUnknown_03004828
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0x9C
	ldrh r1, [r0]
	ldr r0, _0804DC80 @ =0x00000101
	cmp r1, r0
	bne _0804DC64
	adds r1, r2, 0
	adds r1, 0x9E
	ldr r0, _0804DC84 @ =0x0000dcba
	strh r0, [r1]
	bl bitmask_all_link_players_but_self
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	adds r1, 0x9E
	movs r2, 0x14
	bl SendBlock
	ldr r0, [r4]
	adds r0, 0x9C
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, [r4]
	adds r0, 0x9D
	strb r1, [r0]
_0804DC64:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804DC7C: .4byte gUnknown_03004828
_0804DC80: .4byte 0x00000101
_0804DC84: .4byte 0x0000dcba
	thumb_func_end sub_804DC18

	thumb_func_start sub_804DC88
sub_804DC88: @ 804DC88
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r1, _0804DCA8 @ =gMain
	ldr r2, _0804DCAC @ =0x0000043c
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x65
	bls _0804DC9C
	b _0804E11A
_0804DC9C:
	lsls r0, 2
	ldr r1, _0804DCB0 @ =_0804DCB4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804DCA8: .4byte gMain
_0804DCAC: .4byte 0x0000043c
_0804DCB0: .4byte _0804DCB4
	.align 2, 0
_0804DCB4:
	.4byte _0804DE4C
	.4byte _0804DE9C
	.4byte _0804DF14
	.4byte _0804E11A
	.4byte _0804DFE0
	.4byte _0804E078
	.4byte _0804E0A0
	.4byte _0804E0BC
	.4byte _0804E0E4
	.4byte _0804E10C
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E008
	.4byte _0804E034
	.4byte _0804E04C
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804DF54
	.4byte _0804DF7C
	.4byte _0804DF9C
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804E11A
	.4byte _0804DEB4
	.4byte _0804DEF4
_0804DE4C:
	ldr r5, _0804DE88 @ =gUnknown_03004828
	ldr r0, _0804DE8C @ =0x0201f000
	str r0, [r5]
	ldr r1, _0804DE90 @ =0x0000043c
	adds r2, r1
	ldrb r1, [r2]
	adds r1, 0x1
	strb r1, [r2]
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1D
	bl ZeroFillWindowRect
	ldr r4, _0804DE94 @ =gStringVar4
	ldr r1, _0804DE98 @ =gOtherText_LinkStandby2
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r1, [r5]
	adds r0, r1, 0x4
	adds r1, 0x34
	ldrb r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	b _0804DF3E
	.align 2, 0
_0804DE88: .4byte gUnknown_03004828
_0804DE8C: .4byte 0x0201f000
_0804DE90: .4byte 0x0000043c
_0804DE94: .4byte gStringVar4
_0804DE98: .4byte gOtherText_LinkStandby2
_0804DE9C:
	bl sub_80084A4
	ldr r0, _0804DEAC @ =gMain
	ldr r2, _0804DEB0 @ =0x0000043c
	adds r0, r2
	movs r2, 0
	movs r1, 0x64
	b _0804DFEE
	.align 2, 0
_0804DEAC: .4byte gMain
_0804DEB0: .4byte 0x0000043c
_0804DEB4:
	ldr r0, _0804DEE8 @ =gUnknown_03004828
	ldr r0, [r0]
	adds r3, r0, 0
	adds r3, 0xC0
	ldr r0, [r3]
	adds r0, 0x1
	str r0, [r3]
	cmp r0, 0xB4
	bls _0804DED2
	ldr r1, _0804DEEC @ =0x0000043c
	adds r0, r2, r1
	movs r2, 0
	movs r1, 0x65
	strb r1, [r0]
	str r2, [r3]
_0804DED2:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0804DEDE
	b _0804E11A
_0804DEDE:
	ldr r0, _0804DEF0 @ =gMain
	ldr r2, _0804DEEC @ =0x0000043c
	adds r0, r2
	b _0804DF06
	.align 2, 0
_0804DEE8: .4byte gUnknown_03004828
_0804DEEC: .4byte 0x0000043c
_0804DEF0: .4byte gMain
_0804DEF4:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0804DF00
	b _0804E11A
_0804DF00:
	ldr r0, _0804DF0C @ =gMain
	ldr r1, _0804DF10 @ =0x0000043c
	adds r0, r1
_0804DF06:
	movs r1, 0x2
	strb r1, [r0]
	b _0804E11A
	.align 2, 0
_0804DF0C: .4byte gMain
_0804DF10: .4byte 0x0000043c
_0804DF14:
	ldr r0, _0804DF48 @ =0x0000043c
	adds r1, r2, r0
	movs r0, 0x32
	strb r0, [r1]
	ldr r4, _0804DF4C @ =gUnknown_03004828
	ldr r0, [r4]
	adds r0, 0x4
	movs r1, 0x13
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x1D
	bl ZeroFillWindowRect
	ldr r2, [r4]
	adds r0, r2, 0x4
	ldr r1, _0804DF50 @ =gSystemText_Saving
	adds r2, 0x34
	ldrb r2, [r2]
	movs r3, 0xF
	str r3, [sp]
_0804DF3E:
	movs r3, 0x2
	bl sub_8003460
	b _0804E11A
	.align 2, 0
_0804DF48: .4byte 0x0000043c
_0804DF4C: .4byte gUnknown_03004828
_0804DF50: .4byte gSystemText_Saving
_0804DF54:
	bl SetSecretBase2Field_9_AndHideBG
	movs r0, 0x15
	bl IncrementGameStat
	bl sub_8125D80
	ldr r1, _0804DF74 @ =gMain
	ldr r2, _0804DF78 @ =0x0000043c
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	b _0804DFF0
	.align 2, 0
_0804DF74: .4byte gMain
_0804DF78: .4byte 0x0000043c
_0804DF7C:
	ldr r0, _0804DF94 @ =gUnknown_03004828
	ldr r1, [r0]
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x5
	beq _0804DF8E
	b _0804E11A
_0804DF8E:
	ldr r0, _0804DF98 @ =0x0000043c
	adds r1, r2, r0
	b _0804E0FA
	.align 2, 0
_0804DF94: .4byte gUnknown_03004828
_0804DF98: .4byte 0x0000043c
_0804DF9C:
	bl sub_8125DA8
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _0804DFC0
	bl ClearSecretBase2Field_9_2
	ldr r0, _0804DFB8 @ =gMain
	ldr r1, _0804DFBC @ =0x0000043c
	adds r0, r1
	movs r1, 0x4
	strb r1, [r0]
	b _0804E11A
	.align 2, 0
_0804DFB8: .4byte gMain
_0804DFBC: .4byte 0x0000043c
_0804DFC0:
	ldr r0, _0804DFD4 @ =gUnknown_03004828
	ldr r0, [r0]
	adds r0, 0xC0
	str r1, [r0]
	ldr r0, _0804DFD8 @ =gMain
	ldr r2, _0804DFDC @ =0x0000043c
	adds r0, r2
	movs r1, 0x33
	strb r1, [r0]
	b _0804E11A
	.align 2, 0
_0804DFD4: .4byte gUnknown_03004828
_0804DFD8: .4byte gMain
_0804DFDC: .4byte 0x0000043c
_0804DFE0:
	bl sub_8125DDC
	ldr r0, _0804DFFC @ =gMain
	ldr r1, _0804E000 @ =0x0000043c
	adds r0, r1
	movs r2, 0
	movs r1, 0x28
_0804DFEE:
	strb r1, [r0]
_0804DFF0:
	ldr r0, _0804E004 @ =gUnknown_03004828
	ldr r0, [r0]
	adds r0, 0xC0
	str r2, [r0]
	b _0804E11A
	.align 2, 0
_0804DFFC: .4byte gMain
_0804E000: .4byte 0x0000043c
_0804E004: .4byte gUnknown_03004828
_0804E008:
	ldr r0, _0804E02C @ =gUnknown_03004828
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x32
	bhi _0804E01C
	b _0804E11A
_0804E01C:
	movs r0, 0
	str r0, [r1]
	ldr r0, _0804E030 @ =0x0000043c
	adds r1, r2, r0
	movs r0, 0x29
	strb r0, [r1]
	b _0804E11A
	.align 2, 0
_0804E02C: .4byte gUnknown_03004828
_0804E030: .4byte 0x0000043c
_0804E034:
	bl sub_80084A4
	ldr r0, _0804E044 @ =gMain
	ldr r1, _0804E048 @ =0x0000043c
	adds r0, r1
	movs r1, 0x2A
	strb r1, [r0]
	b _0804E11A
	.align 2, 0
_0804E044: .4byte gMain
_0804E048: .4byte 0x0000043c
_0804E04C:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _0804E11A
	bl sub_8125E04
	ldr r1, _0804E06C @ =gSoftResetDisabled
	movs r0, 0
	strb r0, [r1]
	ldr r0, _0804E070 @ =gMain
	ldr r2, _0804E074 @ =0x0000043c
	adds r0, r2
	movs r1, 0x5
	strb r1, [r0]
	b _0804E11A
	.align 2, 0
_0804E06C: .4byte gSoftResetDisabled
_0804E070: .4byte gMain
_0804E074: .4byte 0x0000043c
_0804E078:
	ldr r0, _0804E098 @ =gUnknown_03004828
	ldr r1, [r0]
	adds r1, 0xC0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bls _0804E11A
	ldr r0, _0804E09C @ =0x0000043c
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_80084A4
	b _0804E11A
	.align 2, 0
_0804E098: .4byte gUnknown_03004828
_0804E09C: .4byte 0x0000043c
_0804E0A0:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _0804E11A
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0804E0F4
_0804E0BC:
	ldr r0, _0804E0D8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804E11A
	movs r0, 0x3
	bl FadeOutBGM
	ldr r1, _0804E0DC @ =gMain
	ldr r0, _0804E0E0 @ =0x0000043c
	adds r1, r0
	b _0804E0FA
	.align 2, 0
_0804E0D8: .4byte gPaletteFade
_0804E0DC: .4byte gMain
_0804E0E0: .4byte 0x0000043c
_0804E0E4:
	bl IsBGMStopped
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0804E11A
	bl sub_800832C
_0804E0F4:
	ldr r1, _0804E104 @ =gMain
	ldr r2, _0804E108 @ =0x0000043c
	adds r1, r2
_0804E0FA:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804E11A
	.align 2, 0
_0804E104: .4byte gMain
_0804E108: .4byte 0x0000043c
_0804E10C:
	ldr r0, _0804E13C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804E11A
	ldr r0, _0804E140 @ =sub_804E144
	bl SetMainCallback2
_0804E11A:
	bl HasLinkErrorOccurred
	lsls r0, 24
	cmp r0, 0
	bne _0804E128
	bl RunTasks
_0804E128:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E13C: .4byte gReceivedRemoteLinkPlayers
_0804E140: .4byte sub_804E144
	thumb_func_end sub_804DC88

	thumb_func_start sub_804E144
sub_804E144: @ 804E144
	push {lr}
	ldr r0, _0804E16C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804E158
	ldr r0, _0804E170 @ =sub_8047CD8
	bl SetMainCallback2
_0804E158:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
_0804E16C: .4byte gPaletteFade
_0804E170: .4byte sub_8047CD8
	thumb_func_end sub_804E144

	thumb_func_start sub_804E174
sub_804E174: @ 804E174
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _0804E19C @ =sub_804E1A0
	movs r1, 0xA
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0804E19C: .4byte sub_804E1A0
	thumb_func_end sub_804E174

	thumb_func_start sub_804E1A0
sub_804E1A0: @ 804E1A0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0804E1CC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804E1C4
	ldr r0, _0804E1D0 @ =sub_804B790
	bl SetMainCallback2
	ldr r1, _0804E1D4 @ =gFieldCallback
	ldr r0, _0804E1D8 @ =sub_8080990
	str r0, [r1]
	adds r0, r4, 0
	bl DestroyTask
_0804E1C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804E1CC: .4byte gPaletteFade
_0804E1D0: .4byte sub_804B790
_0804E1D4: .4byte gFieldCallback
_0804E1D8: .4byte sub_8080990
	thumb_func_end sub_804E1A0

	thumb_func_start sub_804E1DC
sub_804E1DC: @ 804E1DC
	push {r4,r5,lr}
	movs r5, 0
	movs r4, 0
_0804E1E2:
	ldr r0, _0804E220 @ =gUnknown_020297D8
	ldrb r0, [r0, 0x1]
	movs r1, 0x6
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0804E224 @ =gEnemyParty
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x43
	bl GetMonData
	adds r0, r5, r0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xB
	bls _0804E1E2
	cmp r5, 0
	beq _0804E21A
	ldr r0, _0804E228 @ =0x0000083b
	bl FlagSet
_0804E21A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E220: .4byte gUnknown_020297D8
_0804E224: .4byte gEnemyParty
_0804E228: .4byte 0x0000083b
	thumb_func_end sub_804E1DC

	thumb_func_start sub_804E22C
sub_804E22C: @ 804E22C
	push {r4,lr}
	ldr r0, _0804E26C @ =gUnknown_08D00000
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r0, _0804E270 @ =gUnknown_08D00524
	ldr r4, _0804E274 @ =0x02000000
	movs r2, 0x80
	lsls r2, 4
	adds r1, r4, 0
	bl CpuSet
	ldr r1, _0804E278 @ =0x06002800
	ldr r0, _0804E27C @ =0x040000d4
	str r4, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804E280 @ =0x80000280
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _0804E284 @ =gUnknown_08D004E0
	movs r1, 0
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r1, _0804E288 @ =REG_BG1CNT
	ldr r2, _0804E28C @ =0x00000502
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804E26C: .4byte gUnknown_08D00000
_0804E270: .4byte gUnknown_08D00524
_0804E274: .4byte 0x02000000
_0804E278: .4byte 0x06002800
_0804E27C: .4byte 0x040000d4
_0804E280: .4byte 0x80000280
_0804E284: .4byte gUnknown_08D004E0
_0804E288: .4byte REG_BG1CNT
_0804E28C: .4byte 0x00000502
	thumb_func_end sub_804E22C

	.align 2, 0 @ Don't pad with nop.
