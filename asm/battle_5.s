	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_802E220
sub_802E220: @ 802E220
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r4, _0802E2B8 @ =gBattleBufferA
	ldr r6, _0802E2BC @ =gActiveBank
	ldrb r0, [r6]
	lsls r1, r0, 9
	adds r0, r4, 0x2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0802E2B0
	adds r4, 0x4
	adds r4, r1, r4
	ldr r2, _0802E2C0 @ =gDisplayedStringBattle
	ldr r1, _0802E2C4 @ =gUnknown_08400D49
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	movs r1, 0xFC
	strb r1, [r2]
	movs r0, 0x11
	strb r0, [r2, 0x1]
	movs r0, 0x2
	strb r0, [r2, 0x2]
	adds r2, 0x3
	strb r1, [r2]
	movs r0, 0x14
	strb r0, [r2, 0x1]
	movs r0, 0x6
	strb r0, [r2, 0x2]
	adds r2, 0x3
	ldr r5, _0802E2C8 @ =gMoveSelectionCursor
	ldrb r1, [r6]
	adds r1, r5
	adds r0, r4, 0
	adds r0, 0x8
	ldrb r1, [r1]
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r2, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r2, r0, 0
	movs r0, 0xBA
	strb r0, [r2]
	adds r2, 0x1
	ldrb r0, [r6]
	adds r0, r5
	adds r4, 0xC
	ldrb r0, [r0]
	adds r4, r0
	ldrb r1, [r4]
	adds r0, r2, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r4, _0802E2CC @ =gUnknown_03004210
	ldr r1, _0802E2C0 @ =gDisplayedStringBattle
	ldr r2, _0802E2D0 @ =0x000002a2
	movs r0, 0x37
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x19
	bl InitWindow
	adds r0, r4, 0
	bl sub_8002F44
_0802E2B0:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E2B8: .4byte gBattleBufferA
_0802E2BC: .4byte gActiveBank
_0802E2C0: .4byte gDisplayedStringBattle
_0802E2C4: .4byte gUnknown_08400D49
_0802E2C8: .4byte gMoveSelectionCursor
_0802E2CC: .4byte gUnknown_03004210
_0802E2D0: .4byte 0x000002a2
	thumb_func_end sub_802E220

	thumb_func_start sub_802E2D4
sub_802E2D4: @ 802E2D4
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, _0802E314 @ =gBattleBufferA
	ldr r5, _0802E318 @ =gActiveBank
	ldrb r0, [r5]
	lsls r1, r0, 9
	adds r0, r4, 0x2
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0802E328
	ldr r4, _0802E31C @ =gUnknown_03004210
	ldr r1, _0802E320 @ =0x00001016
	movs r0, 0x1C
	str r0, [sp]
	movs r0, 0x3A
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r2, 0x17
	movs r3, 0x37
	bl FillWindowRect
	ldr r1, _0802E324 @ =gUnknown_08400D52
	movs r2, 0xA4
	lsls r2, 2
	movs r0, 0x37
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x13
	bl InitWindow
	b _0802E388
	.align 2, 0
_0802E314: .4byte gBattleBufferA
_0802E318: .4byte gActiveBank
_0802E31C: .4byte gUnknown_03004210
_0802E320: .4byte 0x00001016
_0802E324: .4byte gUnknown_08400D52
_0802E328:
	adds r4, 0x4
	adds r4, r1, r4
	ldr r3, _0802E398 @ =gDisplayedStringBattle
	ldr r1, _0802E39C @ =gUnknown_08400D49
	adds r0, r3, 0
	bl StringCopy
	adds r3, r0, 0
	ldr r2, _0802E3A0 @ =gBattleMoves
	ldr r1, _0802E3A4 @ =gMoveSelectionCursor
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r4, r0
	ldrh r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	lsls r1, r0, 3
	subs r1, r0
	ldr r0, _0802E3A8 @ =gTypeNames
	adds r1, r0
	adds r0, r3, 0
	bl StringCopy
	ldr r4, _0802E3AC @ =gUnknown_03004210
	ldr r1, _0802E3B0 @ =0x00001016
	movs r0, 0x1C
	str r0, [sp]
	movs r0, 0x3A
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r2, 0x17
	movs r3, 0x39
	bl FillWindowRect
	ldr r1, _0802E398 @ =gDisplayedStringBattle
	movs r2, 0xB0
	lsls r2, 2
	movs r0, 0x39
	str r0, [sp]
	adds r0, r4, 0
	movs r3, 0x17
	bl InitWindow
_0802E388:
	ldr r0, _0802E3AC @ =gUnknown_03004210
	bl sub_8002F44
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E398: .4byte gDisplayedStringBattle
_0802E39C: .4byte gUnknown_08400D49
_0802E3A0: .4byte gBattleMoves
_0802E3A4: .4byte gMoveSelectionCursor
_0802E3A8: .4byte gTypeNames
_0802E3AC: .4byte gUnknown_03004210
_0802E3B0: .4byte 0x00001016
	thumb_func_end sub_802E2D4

	thumb_func_start sub_802E3B4
sub_802E3B4: @ 802E3B4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x48
	bl sub_814A958
	ldr r1, _0802E3DC @ =gUnknown_081FAE89
	lsls r4, 1
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r1, 0x1
	adds r4, r1
	ldrb r1, [r4]
	bl sub_814A880
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E3DC: .4byte gUnknown_081FAE89
	thumb_func_end sub_802E3B4

	thumb_func_start nullsub_7
nullsub_7: @ 802E3E0
	bx lr
	thumb_func_end nullsub_7

	thumb_func_start sub_802E3E4
sub_802E3E4: @ 802E3E4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2A
	bl sub_814A958
	ldr r1, _0802E40C @ =gUnknown_081FAE91
	lsls r4, 1
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r1, 0x1
	adds r4, r1
	ldrb r1, [r4]
	bl sub_814A880
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E40C: .4byte gUnknown_081FAE91
	thumb_func_end sub_802E3E4

	thumb_func_start nullsub_8
nullsub_8: @ 802E410
	bx lr
	thumb_func_end nullsub_8

	thumb_func_start sub_802E414
sub_802E414: @ 802E414
	push {lr}
	ldr r0, _0802E420 @ =ReshowBattleScreenAfterMenu
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0802E420: .4byte ReshowBattleScreenAfterMenu
	thumb_func_end sub_802E414

	thumb_func_start sub_802E424
sub_802E424: @ 802E424
	push {lr}
	ldr r0, _0802E430 @ =ReshowBattleScreenAfterMenu
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0802E430: .4byte ReshowBattleScreenAfterMenu
	thumb_func_end sub_802E424

	thumb_func_start sub_802E434
sub_802E434: @ 802E434
	push {lr}
	ldr r0, _0802E458 @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0802E45C @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0802E452
	bl PlayerBufferExecCompleted
_0802E452:
	pop {r0}
	bx r0
	.align 2, 0
_0802E458: .4byte gActiveBank
_0802E45C: .4byte 0x02017810
	thumb_func_end sub_802E434

	thumb_func_start sub_802E460
sub_802E460: @ 802E460
	push {lr}
	ldr r0, _0802E484 @ =gActiveBank
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0802E488 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0802E47E
	bl PlayerBufferExecCompleted
_0802E47E:
	pop {r0}
	bx r0
	.align 2, 0
_0802E484: .4byte gActiveBank
_0802E488: .4byte 0x02017810
	thumb_func_end sub_802E460

	thumb_func_start b_link_standby_message
b_link_standby_message: @ 802E48C
	push {lr}
	sub sp, 0x4
	ldr r0, _0802E4BC @ =gBattleTypeFlags
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0802E4B6
	ldr r0, _0802E4C0 @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _0802E4C4 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r0, _0802E4C8 @ =gUnknown_03004210
	ldr r1, _0802E4CC @ =gUnknown_08400CE0
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
_0802E4B6:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0802E4BC: .4byte gBattleTypeFlags
_0802E4C0: .4byte gUnknown_030042A4
_0802E4C4: .4byte gUnknown_030042A0
_0802E4C8: .4byte gUnknown_03004210
_0802E4CC: .4byte gUnknown_08400CE0
	thumb_func_end b_link_standby_message

	.align 2, 0 @ Don't pad with nop.
