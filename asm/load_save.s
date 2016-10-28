	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CheckForFlashMemory
CheckForFlashMemory: @ 80479CC
	push {lr}
	bl IdentifyFlash
	lsls r0, 16
	cmp r0, 0
	bne _080479E8
	ldr r1, _080479E4 @ =gUnknown_3004820
	movs r0, 0x1
	str r0, [r1]
	bl InitFlashTimer
	b _080479EE
	.align 2, 0
_080479E4: .4byte gUnknown_3004820
_080479E8:
	ldr r1, _080479F4 @ =gUnknown_3004820
	movs r0, 0
	str r0, [r1]
_080479EE:
	pop {r0}
	bx r0
	.align 2, 0
_080479F4: .4byte gUnknown_3004820
	thumb_func_end CheckForFlashMemory

	thumb_func_start sub_80479F8
sub_80479F8: @ 80479F8
	ldr r0, _08047A00 @ =gSaveBlock2
	ldrb r0, [r0, 0x9]
	bx lr
	.align 2, 0
_08047A00: .4byte gSaveBlock2
	thumb_func_end sub_80479F8

	thumb_func_start sub_8047A04
sub_8047A04: @ 8047A04
	ldr r1, _08047A0C @ =gSaveBlock2
	movs r0, 0
	strb r0, [r1, 0x9]
	bx lr
	.align 2, 0
_08047A0C: .4byte gSaveBlock2
	thumb_func_end sub_8047A04

	thumb_func_start sub_8047A10
sub_8047A10: @ 8047A10
	ldr r1, _08047A18 @ =gSaveBlock2
	movs r0, 0x1
	strb r0, [r1, 0x9]
	bx lr
	.align 2, 0
_08047A18: .4byte gSaveBlock2
	thumb_func_end sub_8047A10

	thumb_func_start sub_8047A1C
sub_8047A1C: @ 8047A1C
	push {lr}
	movs r0, 0
	bl gpu_sync_bg_hide
	ldr r1, _08047A30 @ =gSaveBlock2
	movs r0, 0x1
	strb r0, [r1, 0x9]
	pop {r0}
	bx r0
	.align 2, 0
_08047A30: .4byte gSaveBlock2
	thumb_func_end sub_8047A1C

	thumb_func_start sub_8047A34
sub_8047A34: @ 8047A34
	ldr r1, _08047A3C @ =gSaveBlock2
	movs r0, 0
	strb r0, [r1, 0x9]
	bx lr
	.align 2, 0
_08047A3C: .4byte gSaveBlock2
	thumb_func_end sub_8047A34

	thumb_func_start sub_8047A40
sub_8047A40: @ 8047A40
	push {r4-r6,lr}
	ldr r2, _08047A78 @ =gSaveBlock1
	ldr r0, _08047A7C @ =gPlayerPartyCount
	ldrb r1, [r0]
	movs r3, 0x8D
	lsls r3, 2
	adds r0, r2, r3
	strb r1, [r0]
	movs r6, 0
	movs r0, 0x8E
	lsls r0, 2
	adds r5, r2, r0
	movs r4, 0
_08047A5A:
	ldr r1, _08047A80 @ =gPlayerParty
	adds r1, r4, r1
	adds r0, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r5, 0x64
	adds r4, 0x64
	adds r6, 0x1
	cmp r6, 0x5
	ble _08047A5A
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047A78: .4byte gSaveBlock1
_08047A7C: .4byte gPlayerPartyCount
_08047A80: .4byte gPlayerParty
	thumb_func_end sub_8047A40

	thumb_func_start copy_player_party_from_sav1
copy_player_party_from_sav1: @ 8047A84
	push {r4-r6,lr}
	ldr r0, _08047AC0 @ =gPlayerPartyCount
	ldr r1, _08047AC4 @ =gSaveBlock1
	movs r2, 0x8D
	lsls r2, 2
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	ldr r4, _08047AC8 @ =gPlayerParty
	movs r5, 0
	movs r0, 0xFA
	lsls r0, 1
	adds r6, r4, r0
_08047A9E:
	ldr r1, _08047AC4 @ =gSaveBlock1
	adds r1, r5, r1
	movs r2, 0x8E
	lsls r2, 2
	adds r1, r2
	adds r0, r4, 0
	movs r2, 0x64
	bl memcpy
	adds r4, 0x64
	adds r5, 0x64
	cmp r4, r6
	ble _08047A9E
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047AC0: .4byte gPlayerPartyCount
_08047AC4: .4byte gSaveBlock1
_08047AC8: .4byte gPlayerParty
	thumb_func_end copy_player_party_from_sav1

	thumb_func_start sub_8047ACC
sub_8047ACC: @ 8047ACC
	push {r4-r7,lr}
	ldr r0, _08047AFC @ =gSaveBlock1
	ldr r4, _08047B00 @ =gMapObjects
	movs r1, 0x9E
	lsls r1, 4
	adds r3, r0, r1
	movs r2, 0xF
_08047ADA:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	adds r4, 0x24
	adds r3, 0x24
	subs r2, 0x1
	cmp r2, 0
	bge _08047ADA
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047AFC: .4byte gSaveBlock1
_08047B00: .4byte gMapObjects
	thumb_func_end sub_8047ACC

	thumb_func_start save_deserialize_npcs
save_deserialize_npcs: @ 8047B04
	push {r4-r7,lr}
	ldr r0, _08047B34 @ =gSaveBlock1
	movs r1, 0x9E
	lsls r1, 4
	adds r4, r0, r1
	ldr r3, _08047B38 @ =gMapObjects
	movs r2, 0xF
_08047B12:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	adds r4, 0x24
	adds r3, 0x24
	subs r2, 0x1
	cmp r2, 0
	bge _08047B12
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047B34: .4byte gSaveBlock1
_08047B38: .4byte gMapObjects
	thumb_func_end save_deserialize_npcs

	thumb_func_start save_serialize_game
save_serialize_game: @ 8047B3C
	push {lr}
	bl sub_8047A40
	bl sub_8047ACC
	pop {r0}
	bx r0
	thumb_func_end save_serialize_game

	thumb_func_start save_deserialize_game
save_deserialize_game: @ 8047B4C
	push {lr}
	bl copy_player_party_from_sav1
	bl save_deserialize_npcs
	pop {r0}
	bx r0
	thumb_func_end save_deserialize_game

	thumb_func_start copy_bags_and_unk_data_from_save_blocks
copy_bags_and_unk_data_from_save_blocks: @ 8047B5C
	push {r4-r7,lr}
	ldr r0, _08047C0C @ =gSaveBlock1
	movs r1, 0xAC
	lsls r1, 3
	adds r3, r0, r1
	ldr r1, _08047C10 @ =gUnknown_020291F4
	movs r2, 0x13
_08047B6A:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047B6A
	ldr r1, _08047C10 @ =gUnknown_020291F4
	ldr r0, _08047C0C @ =gSaveBlock1
	movs r2, 0xB6
	lsls r2, 3
	adds r3, r0, r2
	adds r1, 0x50
	movs r2, 0x13
_08047B82:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047B82
	ldr r1, _08047C10 @ =gUnknown_020291F4
	ldr r0, _08047C0C @ =gSaveBlock1
	movs r5, 0xC0
	lsls r5, 3
	adds r3, r0, r5
	adds r1, 0xA0
	movs r2, 0xF
_08047B9A:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047B9A
	ldr r1, _08047C10 @ =gUnknown_020291F4
	ldr r0, _08047C0C @ =gSaveBlock1
	movs r6, 0xC8
	lsls r6, 3
	adds r3, r0, r6
	adds r1, 0xE0
	movs r2, 0x3F
_08047BB2:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047BB2
	ldr r1, _08047C10 @ =gUnknown_020291F4
	ldr r0, _08047C0C @ =gSaveBlock1
	movs r7, 0xE8
	lsls r7, 3
	adds r3, r0, r7
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0
	movs r2, 0x2D
_08047BCE:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047BCE
	ldr r0, _08047C10 @ =gUnknown_020291F4
	ldr r4, _08047C0C @ =gSaveBlock1
	movs r1, 0xA6
	lsls r1, 2
	adds r3, r0, r1
	ldr r2, _08047C14 @ =0x00002b4c
	mov r12, r2
	movs r2, 0xF
_08047BE8:
	adds r1, r3, 0
	mov r5, r12
	adds r0, r4, r5
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	adds r4, 0x24
	adds r3, 0x24
	subs r2, 0x1
	cmp r2, 0
	bge _08047BE8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047C0C: .4byte gSaveBlock1
_08047C10: .4byte gUnknown_020291F4
_08047C14: .4byte 0x00002b4c
	thumb_func_end copy_bags_and_unk_data_from_save_blocks

	thumb_func_start copy_bags_and_unk_data_to_save_blocks
copy_bags_and_unk_data_to_save_blocks: @ 8047C18
	push {r4-r7,lr}
	ldr r0, _08047CCC @ =gSaveBlock1
	ldr r3, _08047CD0 @ =gUnknown_020291F4
	movs r2, 0xAC
	lsls r2, 3
	adds r1, r0, r2
	movs r2, 0x13
_08047C26:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047C26
	ldr r1, _08047CCC @ =gSaveBlock1
	ldr r0, _08047CD0 @ =gUnknown_020291F4
	adds r3, r0, 0
	adds r3, 0x50
	movs r5, 0xB6
	lsls r5, 3
	adds r1, r5
	movs r2, 0x13
_08047C40:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047C40
	ldr r1, _08047CCC @ =gSaveBlock1
	ldr r0, _08047CD0 @ =gUnknown_020291F4
	adds r3, r0, 0
	adds r3, 0xA0
	movs r6, 0xC0
	lsls r6, 3
	adds r1, r6
	movs r2, 0xF
_08047C5A:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047C5A
	ldr r1, _08047CCC @ =gSaveBlock1
	ldr r0, _08047CD0 @ =gUnknown_020291F4
	adds r3, r0, 0
	adds r3, 0xE0
	movs r7, 0xC8
	lsls r7, 3
	adds r1, r7
	movs r2, 0x3F
_08047C74:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047C74
	ldr r1, _08047CCC @ =gSaveBlock1
	ldr r0, _08047CD0 @ =gUnknown_020291F4
	movs r2, 0xF0
	lsls r2, 1
	adds r3, r0, r2
	movs r5, 0xE8
	lsls r5, 3
	adds r1, r5
	movs r2, 0x2D
_08047C90:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047C90
	ldr r0, _08047CCC @ =gSaveBlock1
	ldr r4, _08047CD0 @ =gUnknown_020291F4
	ldr r6, _08047CD4 @ =0x00002b4c
	adds r3, r0, r6
	movs r7, 0xA6
	lsls r7, 2
	mov r12, r7
	movs r2, 0xF
_08047CAA:
	adds r1, r3, 0
	mov r5, r12
	adds r0, r4, r5
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	adds r4, 0x24
	adds r3, 0x24
	subs r2, 0x1
	cmp r2, 0
	bge _08047CAA
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047CCC: .4byte gSaveBlock1
_08047CD0: .4byte gUnknown_020291F4
_08047CD4: .4byte 0x00002b4c
	thumb_func_end copy_bags_and_unk_data_to_save_blocks

	.align 2, 0 @ Don't pad with nop.
