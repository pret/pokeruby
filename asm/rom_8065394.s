	.include "constants/gba_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_8067EEC
sub_8067EEC: @ 8067EEC
	push {r4,r5,lr}
	movs r1, 0x2
	negs r1, r1
	movs r3, 0x3
	negs r3, r3
	movs r4, 0x5
	negs r4, r4
	movs r5, 0x9
	negs r5, r5
	movs r2, 0
	strb r2, [r0]
	ldrb r2, [r0, 0x1]
	ands r1, r2
	ands r1, r3
	ands r1, r4
	ands r1, r5
	strb r1, [r0, 0x1]
	movs r1, 0
	strb r1, [r0, 0x2]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8067EEC

	thumb_func_start process_overworld_input
process_overworld_input: @ 8067F18
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	ldr r0, _08067FE8
	ldrb r6, [r0, 0x3]
	ldrb r0, [r0, 0x2]
	mov r9, r0
	bl cur_mapdata_block_role_at_player_pos
	lsls r0, 24
	lsrs r0, 24
	bl sub_8056FFC
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r6, 0x2
	bne _08067F4C
	cmp r7, 0
	beq _08067F50
_08067F4C:
	cmp r6, 0
	bne _08067FB2
_08067F50:
	bl sub_80E6034
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _08067F9C
	movs r0, 0x8
	ands r0, r5
	cmp r0, 0
	beq _08067F6C
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
_08067F6C:
	movs r0, 0x4
	ands r0, r5
	cmp r0, 0
	beq _08067F7C
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
_08067F7C:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _08067F8C
	ldrb r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
_08067F8C:
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _08067F9C
	ldrb r0, [r4]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4]
_08067F9C:
	movs r0, 0xF0
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08067FB2
	ldrb r0, [r4]
	movs r1, 0x10
	orrs r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4]
_08067FB2:
	cmp r7, 0
	bne _08067FD8
	cmp r6, 0x2
	bne _08067FC8
	mov r0, r9
	cmp r0, 0x2
	bne _08067FC8
	ldrb r0, [r4]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4]
_08067FC8:
	cmp r7, 0
	bne _08067FD8
	cmp r6, 0x2
	bne _08067FD8
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
_08067FD8:
	movs r0, 0x40
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08067FEC
	movs r0, 0x2
	b _08068014
	.align 2, 0
_08067FE8: .4byte gPlayerAvatar
_08067FEC:
	movs r0, 0x80
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08067FFA
	movs r0, 0x1
	b _08068014
_08067FFA:
	movs r0, 0x20
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08068008
	movs r0, 0x3
	b _08068014
_08068008:
	movs r0, 0x10
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08068016
	movs r0, 0x4
_08068014:
	strb r0, [r4, 0x2]
_08068016:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end process_overworld_input

	thumb_func_start sub_8068024
sub_8068024: @ 8068024
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r6, r0, 24
	mov r4, sp
	mov r0, sp
	bl player_get_pos_to_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r4, r0, 16
	bl sub_8083FBC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
	bl mapheader_run_first_tag2_script_list_match
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
	ldrb r1, [r5]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08068076
	bl sub_80687A4
	cmp r0, 0x1
	beq _08068150
_08068076:
	ldrb r1, [r5]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08068098
	movs r0, 0x5
	bl sav12_xor_increment
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_80687E4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
_08068098:
	ldrb r1, [r5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080680B0
	adds r0, r4, 0
	bl is_it_battle_time_3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
_080680B0:
	ldrb r1, [r5]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080680D2
	ldrb r0, [r5, 0x2]
	cmp r0, r6
	bne _080680D2
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl mapheader_run_first_tag2_script_list_match_conditionally
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
_080680D2:
	mov r4, sp
	mov r0, sp
	bl player_get_next_pos_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r1, [r5]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08068108
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_80681F0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
_08068108:
	ldrb r1, [r5]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0806812A
	ldrb r0, [r5, 0x2]
	cmp r0, r6
	bne _0806812A
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl map_warp_consider_2_to_inside
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
_0806812A:
	ldrb r1, [r5]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806813C
	bl sub_8068770
	cmp r0, 0x1
	beq _08068150
_0806813C:
	ldrb r1, [r5]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08068154
	movs r0, 0x6
	bl PlaySE
	bl sub_8071310
_08068150:
	movs r0, 0x1
	b _08068166
_08068154:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08068164
	bl sub_80A6D1C
	cmp r0, 0x1
	beq _08068150
_08068164:
	movs r0, 0
_08068166:
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8068024

	thumb_func_start player_get_pos_to_and_height
player_get_pos_to_and_height: @ 8068170
	push {r4,lr}
	adds r4, r0, 0
	adds r1, r4, 0x2
	bl PlayerGetDestCoords
	bl PlayerGetZCoord
	strb r0, [r4, 0x4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end player_get_pos_to_and_height

	thumb_func_start player_get_next_pos_and_height
player_get_next_pos_and_height: @ 8068188
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r1, r5, 0x2
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080681BA
	bl PlayerGetZCoord
_080681BA:
	strb r0, [r5, 0x4]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end player_get_next_pos_and_height

	thumb_func_start cur_mapdata_block_role_at_player_pos
cur_mapdata_block_role_at_player_pos: @ 80681C4
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end cur_mapdata_block_role_at_player_pos

	thumb_func_start sub_80681F0
sub_80681F0: @ 80681F0
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	lsls r1, 24
	lsrs r1, 24
	bl TryGetScriptOnPressingA
	adds r4, r0, 0
	cmp r4, 0
	bne _08068208
	movs r0, 0
	b _08068234
_08068208:
	ldr r0, _0806823C
	cmp r4, r0
	beq _0806822C
	ldr r0, _08068240
	cmp r4, r0
	beq _0806822C
	ldr r0, _08068244
	cmp r4, r0
	beq _0806822C
	ldr r0, _08068248
	cmp r4, r0
	beq _0806822C
	ldr r0, _0806824C
	cmp r4, r0
	beq _0806822C
	movs r0, 0x5
	bl PlaySE
_0806822C:
	adds r0, r4, 0
	bl ScriptContext1_SetupScript
	movs r0, 0x1
_08068234:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806823C: .4byte gUnknown_0815281E
_08068240: .4byte gUnknown_08152C39
_08068244: .4byte gUnknown_0815F36C
_08068248: .4byte gUnknown_0815F43A
_0806824C: .4byte gUnknown_081A0009
	thumb_func_end sub_80681F0

	thumb_func_start TryGetScriptOnPressingA
TryGetScriptOnPressingA: @ 8068250
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	mov r8, r5
	lsls r2, 24
	lsrs r4, r2, 24
	adds r7, r4, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8068364
	cmp r0, 0
	bne _0806829C
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl TryGetInvisibleMapObjectScript
	cmp r0, 0
	bne _0806829C
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8068500
	cmp r0, 0
	bne _0806829C
	adds r0, r6, 0
	mov r1, r8
	adds r2, r7, 0
	bl TryGetFieldMoveScript
	cmp r0, 0
	bne _0806829C
	movs r0, 0
_0806829C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end TryGetScriptOnPressingA

	thumb_func_start sub_80682A8
sub_80682A8: @ 80682A8
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r2, 24
	lsrs r6, r2, 24
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsCounter
	lsls r0, 24
	cmp r0, 0
	bne _080682D0
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	b _080682EE
_080682D0:
	ldr r1, _08068314
	lsls r2, r6, 3
	adds r0, r2, r1
	ldr r3, [r0]
	ldrh r0, [r4]
	adds r0, r3
	lsls r0, 16
	lsrs r0, 16
	adds r1, 0x4
	adds r2, r1
	ldr r2, [r2]
	ldrh r1, [r4, 0x2]
	adds r1, r2
	lsls r1, 16
	lsrs r1, 16
_080682EE:
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x10
	beq _0806830E
	ldr r1, _08068318
	lsls r2, r3, 3
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	adds r5, r1, 0
	cmp r0, 0xFF
	bne _0806831C
_0806830E:
	movs r0, 0
	b _0806834E
	.align 2, 0
_08068314: .4byte gUnknown_0821664C
_08068318: .4byte gMapObjects
_0806831C:
	movs r4, 0
	ldr r1, _08068354
_08068320:
	ldrb r0, [r1]
	cmp r0, 0x1
	bne _0806832C
	ldrb r0, [r1, 0x2]
	cmp r0, r3
	beq _0806830E
_0806832C:
	adds r1, 0x4
	adds r4, 0x1
	cmp r4, 0x3
	ble _08068320
	ldr r0, _08068358
	strb r3, [r0]
	ldr r1, _0806835C
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x8]
	strh r0, [r1]
	ldr r0, _08068360
	strh r6, [r0]
	adds r0, r3, 0
	bl GetFieldObjectScriptPointerByFieldObjectId
_0806834E:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08068354: .4byte gUnknown_02029818
_08068358: .4byte gSelectedMapObject
_0806835C: .4byte gUnknown_0202E8DE
_08068360: .4byte gUnknown_0202E8E0
	thumb_func_end sub_80682A8

	thumb_func_start sub_8068364
sub_8068364: @ 8068364
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x10
	beq _08068392
	ldr r1, _080683E0
	lsls r2, r3, 3
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	cmp r0, 0xFF
	bne _080683E8
_08068392:
	adds r0, r5, 0
	bl MetatileBehavior_IsCounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080683DC
	ldr r1, _080683E4
	lsls r2, r6, 3
	adds r0, r2, r1
	ldr r3, [r0]
	ldrh r0, [r4]
	adds r0, r3
	lsls r0, 16
	lsrs r0, 16
	adds r1, 0x4
	adds r2, r1
	ldr r2, [r2]
	ldrh r1, [r4, 0x2]
	adds r1, r2
	lsls r1, 16
	lsrs r1, 16
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x10
	beq _080683DC
	ldr r1, _080683E0
	lsls r2, r3, 3
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	cmp r0, 0xFF
	bne _080683E8
_080683DC:
	movs r0, 0
	b _0806840C
	.align 2, 0
_080683E0: .4byte gMapObjects
_080683E4: .4byte gUnknown_0821664C
_080683E8:
	ldr r0, _08068414
	strb r3, [r0]
	ldr r4, _08068418
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	strh r0, [r4]
	ldr r0, _0806841C
	strh r6, [r0]
	adds r0, r3, 0
	bl GetFieldObjectScriptPointerByFieldObjectId
	adds r1, r0, 0
	ldrb r0, [r4]
	bl GetRamScript
	adds r1, r0, 0
_0806840C:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08068414: .4byte gSelectedMapObject
_08068418: .4byte gUnknown_0202E8DE
_0806841C: .4byte gUnknown_0202E8E0
	thumb_func_end sub_8068364

	thumb_func_start TryGetInvisibleMapObjectScript
TryGetInvisibleMapObjectScript: @ 8068420
	push {r4,r5,lr}
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r4, _08068450
	ldrh r1, [r0]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r0, 0x4]
	adds r0, r4, 0
	bl FindInvisibleMapObjectByPosition
	cmp r0, 0
	beq _08068494
	ldr r2, [r0, 0x8]
	cmp r2, 0
	bne _08068458
	ldr r0, _08068454
	b _080684FA
	.align 2, 0
_08068450: .4byte gMapHeader
_08068454: .4byte gUnknown_081C6C02
_08068458:
	ldrb r0, [r0, 0x5]
	cmp r0, 0x8
	bhi _080684F8
	lsls r0, 2
	ldr r1, _08068468
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08068468: .4byte _0806846C
	.align 2, 0
_0806846C:
	.4byte _080684F8
	.4byte _08068490
	.4byte _08068498
	.4byte _0806849E
	.4byte _080684A4
	.4byte _080684AA
	.4byte _080684AA
	.4byte _080684AA
	.4byte _080684D8
_08068490:
	cmp r5, 0x2
	beq _080684F8
_08068494:
	movs r0, 0
	b _080684FA
_08068498:
	cmp r5, 0x1
	beq _080684F8
	b _08068494
_0806849E:
	cmp r5, 0x4
	beq _080684F8
	b _08068494
_080684A4:
	cmp r5, 0x3
	beq _080684F8
	b _08068494
_080684AA:
	ldr r1, _080684CC
	lsrs r0, r2, 16
	movs r3, 0x96
	lsls r3, 2
	adds r0, r3
	strh r0, [r1]
	ldr r0, _080684D0
	strh r2, [r0]
	ldrh r0, [r1]
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068494
	ldr r0, _080684D4
	b _080684FA
	.align 2, 0
_080684CC: .4byte gUnknown_0202E8CC
_080684D0: .4byte gUnknown_0202E8CE
_080684D4: .4byte HiddenItemScript
_080684D8:
	cmp r5, 0x2
	bne _08068494
	ldr r0, _080684F0
	strh r2, [r0]
	bl sub_80BC050
	lsls r0, 24
	cmp r0, 0
	beq _08068494
	ldr r0, _080684F4
	b _080684FA
	.align 2, 0
_080684F0: .4byte gUnknown_0202E8CC
_080684F4: .4byte gUnknown_081A2C51
_080684F8:
	adds r0, r2, 0
_080684FA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end TryGetInvisibleMapObjectScript

	thumb_func_start sub_8068500
sub_8068500: @ 8068500
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r2, 0
	bl MetatileBehavior_IsPlayerFacingTVScreen
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068524
	ldr r0, _08068520
	b _080686EE
	.align 2, 0
_08068520: .4byte Event_TV
_08068524:
	adds r0, r5, 0
	bl MetatileBehavior_IsPC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806853C
	ldr r0, _08068538
	b _080686EE
	.align 2, 0
_08068538: .4byte gUnknown_081A0009
_0806853C:
	adds r0, r5, 0
	bl is_tile_x8B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068554
	ldr r0, _08068550
	b _080686EE
	.align 2, 0
_08068550: .4byte ClosedSootopolisGymDoorScript
_08068554:
	adds r0, r5, 0
	bl is_tile_x84
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806856C
	ldr r0, _08068568
	b _080686EE
	.align 2, 0
_08068568: .4byte gUnknown_081A4363
_0806856C:
	adds r0, r5, 0
	bl is_tile_x87
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068584
	ldr r0, _08068580
	b _080686EE
	.align 2, 0
_08068580: .4byte gUnknown_081C346A
_08068584:
	adds r0, r5, 0
	bl is_tile_x8C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806859C
	ldr r0, _08068598
	b _080686EE
	.align 2, 0
_08068598: .4byte gUnknown_081616E1
_0806859C:
	adds r0, r5, 0
	bl is_tile_x85
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080685B4
	ldr r0, _080685B0
	b _080686EE
	.align 2, 0
_080685B0: .4byte Event_WorldMap
_080685B4:
	adds r0, r5, 0
	bl sub_805791C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080685CC
	ldr r0, _080685C8
	b _080686EE
	.align 2, 0
_080685C8: .4byte Event_RunningShoesManual
_080685CC:
	adds r0, r5, 0
	bl sub_8057930
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080685E4
	ldr r0, _080685E0
	b _080686EE
	.align 2, 0
_080685E0: .4byte PictureBookShelfScript
_080685E4:
	adds r0, r5, 0
	bl sub_8057944
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080685FC
	ldr r0, _080685F8
	b _080686EE
	.align 2, 0
_080685F8: .4byte BookshelfScript
_080685FC:
	adds r0, r5, 0
	bl sub_8057958
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068614
	ldr r0, _08068610
	b _080686EE
	.align 2, 0
_08068610: .4byte PokemonCenterBookshelfScript
_08068614:
	adds r0, r5, 0
	bl sub_805796C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806862C
	ldr r0, _08068628
	b _080686EE
	.align 2, 0
_08068628: .4byte VaseScript
_0806862C:
	adds r0, r5, 0
	bl sub_8057980
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068644
	ldr r0, _08068640
	b _080686EE
	.align 2, 0
_08068640: .4byte TrashCanScript
_08068644:
	adds r0, r5, 0
	bl sub_8057994
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806865C
	ldr r0, _08068658
	b _080686EE
	.align 2, 0
_08068658: .4byte ShopShelfScript
_0806865C:
	adds r0, r5, 0
	bl sub_80579A8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068674
	ldr r0, _08068670
	b _080686EE
	.align 2, 0
_08068670: .4byte BlueprintScript
_08068674:
	movs r4, 0x4
	ldrsb r4, [r6, r4]
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0x2
	ldrsh r1, [r6, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _080686EC
	adds r0, r5, 0
	bl sub_8057238
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080686A4
	ldr r0, _080686A0
	b _080686EE
	.align 2, 0
_080686A0: .4byte gUnknown_0815F36C
_080686A4:
	adds r0, r5, 0
	bl sub_805724C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080686BC
	ldr r0, _080686B8
	b _080686EE
	.align 2, 0
_080686B8: .4byte gUnknown_0815F43A
_080686BC:
	adds r0, r5, 0
	bl sub_8057364
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080686D4
	ldr r0, _080686D0
	b _080686EE
	.align 2, 0
_080686D0: .4byte gUnknown_0815F523
_080686D4:
	adds r0, r5, 0
	bl sub_8057378
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080686EC
	ldr r0, _080686E8
	b _080686EE
	.align 2, 0
_080686E8: .4byte gUnknown_0815F528
_080686EC:
	movs r0, 0
_080686EE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8068500

	thumb_func_start TryGetFieldMoveScript
TryGetFieldMoveScript: @ 80686F4
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r0, _08068724
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806872C
	bl PartyHasMonWithSurf
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806872C
	bl IsPlayerFacingSurfableFishableWater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806872C
	ldr r0, _08068728
	b _0806876A
	.align 2, 0
_08068724: .4byte 0x0000080b
_08068728: .4byte UseSurfScript
_0806872C:
	adds r0, r4, 0
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068768
	ldr r0, _08068758
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068760
	bl IsPlayerSurfingNorth
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068760
	ldr r0, _0806875C
	b _0806876A
	.align 2, 0
_08068758: .4byte 0x0000080e
_0806875C: .4byte UseWaterfallScript
_08068760:
	ldr r0, _08068764
	b _0806876A
	.align 2, 0
_08068764: .4byte CannotUseWaterfallScript
_08068768:
	movs r0, 0
_0806876A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end TryGetFieldMoveScript

	thumb_func_start sub_8068770
sub_8068770: @ 8068770
	push {lr}
	ldr r0, _08068794
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0806879C
	bl sub_8068F18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0806879C
	ldr r0, _08068798
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _0806879E
	.align 2, 0
_08068794: .4byte 0x0000080d
_08068798: .4byte UseDiveScript
_0806879C:
	movs r0, 0
_0806879E:
	pop {r1}
	bx r1
	thumb_func_end sub_8068770

	thumb_func_start sub_80687A4
sub_80687A4: @ 80687A4
	push {lr}
	ldr r0, _080687D0
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080687DC
	ldr r0, _080687D4
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _080687DC
	bl sub_8068F18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080687DC
	ldr r0, _080687D8
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _080687DE
	.align 2, 0
_080687D0: .4byte 0x0000080d
_080687D4: .4byte gMapHeader
_080687D8: .4byte UnderwaterUseDiveScript
_080687DC:
	movs r0, 0
_080687DE:
	pop {r1}
	bx r1
	thumb_func_end sub_80687A4

	thumb_func_start sub_80687E4
sub_80687E4: @ 80687E4
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r6, r4, 0
	bl mapheader_trigger_activate_at__run_now
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068834
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8068A64
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068834
	adds r0, r6, 0
	bl sub_8068870
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068834
	bl sub_8068894
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068834
	bl sub_8085558
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068834
	movs r0, 0
	b _08068836
_08068834:
	movs r0, 0x1
_08068836:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80687E4

	thumb_func_start mapheader_trigger_activate_at__run_now
mapheader_trigger_activate_at__run_now: @ 806883C
	push {r4,lr}
	ldr r4, _08068864
	ldrh r1, [r0]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r0, 0x4]
	adds r0, r4, 0
	bl mapheader_trigger_activate_at
	cmp r0, 0
	beq _08068868
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _0806886A
	.align 2, 0
_08068864: .4byte gMapHeader
_08068868:
	movs r0, 0
_0806886A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end mapheader_trigger_activate_at__run_now

	thumb_func_start sub_8068870
sub_8068870: @ 8068870
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8057818
	lsls r0, 24
	cmp r0, 0
	bne _08068884
	movs r0, 0
	b _0806888C
_08068884:
	ldr r0, _08068890
	bl ScriptContext1_SetupScript
	movs r0, 0x1
_0806888C:
	pop {r1}
	bx r1
	.align 2, 0
_08068890: .4byte GraniteCave_B1F_EventScript_1C6BC5
	thumb_func_end sub_8068870

	thumb_func_start sub_8068894
sub_8068894: @ 8068894
	push {lr}
	bl sub_8082B78
	bl happiness_algorithm_step
	bl overworld_poison_step
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080688B4
	ldr r0, _080688B0
	b _080688E8
	.align 2, 0
_080688B0: .4byte gUnknown_081A14B8
_080688B4:
	bl sub_80422A0
	lsls r0, 24
	cmp r0, 0
	beq _080688CC
	movs r0, 0xD
	bl sav12_xor_increment
	ldr r0, _080688C8
	b _080688E8
	.align 2, 0
_080688C8: .4byte Event_EggHatch
_080688CC:
	bl safari_step
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080688EC
	movs r0, 0x1
	bl sub_810D9B0
	cmp r0, 0x1
	beq _080688E6
	movs r0, 0
	b _080688EE
_080688E6:
	ldr r0, _080688F4
_080688E8:
	bl ScriptContext1_SetupScript
_080688EC:
	movs r0, 0x1
_080688EE:
	pop {r1}
	bx r1
	.align 2, 0
_080688F4: .4byte gUnknown_0815FD0D
	thumb_func_end sub_8068894

	thumb_func_start unref_sub_80688F8
unref_sub_80688F8: @ 80688F8
	push {lr}
	ldr r0, _08068908
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_08068908: .4byte 0x0000402a
	thumb_func_end unref_sub_80688F8

	thumb_func_start happiness_algorithm_step
happiness_algorithm_step: @ 806890C
	push {r4,r5,lr}
	ldr r0, _08068940
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	ldrh r1, [r0]
	movs r2, 0x7F
	ands r1, r2
	strh r1, [r0]
	cmp r1, 0
	bne _0806893A
	ldr r5, _08068944
	movs r4, 0x5
_0806892A:
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_803FCD4
	adds r5, 0x64
	subs r4, 0x1
	cmp r4, 0
	bge _0806892A
_0806893A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068940: .4byte 0x0000402a
_08068944: .4byte gPlayerParty
	thumb_func_end happiness_algorithm_step

	thumb_func_start overworld_poison_timer_set
overworld_poison_timer_set: @ 8068948
	push {lr}
	ldr r0, _08068958
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_08068958: .4byte 0x0000402b
	thumb_func_end overworld_poison_timer_set

	thumb_func_start overworld_poison_step
overworld_poison_step: @ 806895C
	push {lr}
	ldr r0, _08068994
	ldrb r0, [r0, 0x17]
	cmp r0, 0x9
	beq _0806899C
	ldr r0, _08068998
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	ldrh r1, [r0]
	movs r2, 0x3
	ands r1, r2
	strh r1, [r0]
	cmp r1, 0
	bne _0806899C
	bl overworld_poison
	cmp r0, 0x1
	beq _0806899C
	cmp r0, 0x1
	ble _0806899C
	cmp r0, 0x2
	bne _0806899C
	movs r0, 0x1
	b _0806899E
	.align 2, 0
_08068994: .4byte gMapHeader
_08068998: .4byte 0x0000402b
_0806899C:
	movs r0, 0
_0806899E:
	pop {r1}
	bx r1
	thumb_func_end overworld_poison_step

	thumb_func_start prev_quest_postbuffer_cursor_backup_reset
prev_quest_postbuffer_cursor_backup_reset: @ 80689A4
	ldr r1, _080689AC
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080689AC: .4byte gUnknown_0202E8C0
	thumb_func_end prev_quest_postbuffer_cursor_backup_reset

	thumb_func_start is_it_battle_time_3
is_it_battle_time_3: @ 80689B0
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r7, r4, 0
	ldr r6, _080689CC
	ldrb r0, [r6]
	cmp r0, 0x3
	bhi _080689D4
	adds r0, 0x1
	strb r0, [r6]
	ldr r0, _080689D0
	strh r4, [r0]
	movs r0, 0
	b _080689F8
	.align 2, 0
_080689CC: .4byte gUnknown_0202E8C0
_080689D0: .4byte gUnknown_0202E8C2
_080689D4:
	ldr r5, _080689EC
	ldrh r1, [r5]
	adds r0, r4, 0
	bl sub_8085104
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080689F0
	strh r4, [r5]
	movs r0, 0
	b _080689F8
	.align 2, 0
_080689EC: .4byte gUnknown_0202E8C2
_080689F0:
	movs r0, 0
	strb r0, [r6]
	strh r7, [r5]
	movs r0, 0x1
_080689F8:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end is_it_battle_time_3

	thumb_func_start mapheader_run_first_tag2_script_list_match_conditionally
mapheader_run_first_tag2_script_list_match_conditionally: @ 8068A00
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08068A54
	mov r8, r0
	adds r1, r7, 0
	bl map_warp_check_packed
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl is_non_stair_warp_tile
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068A58
	lsls r0, r6, 24
	asrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08068A58
	bl walkrun_find_lowest_active_bit_in_bitfield
	mov r0, r8
	adds r1, r4, 0
	adds r2, r7, 0
	bl sub_8068C30
	bl sub_8080E88
	movs r0, 0x1
	b _08068A5A
	.align 2, 0
_08068A54: .4byte gMapHeader
_08068A58:
	movs r0, 0
_08068A5A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end mapheader_run_first_tag2_script_list_match_conditionally

	thumb_func_start sub_8068A64
sub_8068A64: @ 8068A64
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r7, _08068ABC
	adds r0, r7, 0
	adds r1, r6, 0
	bl map_warp_check_packed
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08068B28
	adds r0, r5, 0
	bl sub_8068B30
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068B28
	bl walkrun_find_lowest_active_bit_in_bitfield
	adds r0, r7, 0
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_8068C30
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsEscalator
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068AC0
	adds r0, r4, 0
	bl sub_8080F2C
	movs r0, 0x1
	b _08068B2A
	.align 2, 0
_08068ABC: .4byte gMapHeader
_08068AC0:
	adds r0, r4, 0
	bl sub_8057798
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068AD6
	bl sub_8080F48
	movs r0, 0x1
	b _08068B2A
_08068AD6:
	adds r0, r4, 0
	bl is_role_x68
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068AEC
	bl sub_8080F58
	movs r0, 0x1
	b _08068B2A
_08068AEC:
	adds r0, r4, 0
	bl MetatileBehavior_IsAquaHideoutWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068B02
	bl sub_8080F68
	movs r0, 0x1
	b _08068B2A
_08068B02:
	adds r0, r4, 0
	bl sub_8057804
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068B20
	ldr r0, _08068B1C
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _08068B2A
	.align 2, 0
_08068B1C: .4byte gUnknown_081C6BDE
_08068B20:
	bl sub_8080E88
	movs r0, 0x1
	b _08068B2A
_08068B28:
	movs r0, 0
_08068B2A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8068A64

	thumb_func_start sub_8068B30
sub_8068B30: @ 8068B30
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl is_tile_x69_2_warp_door
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl MetatileBehavior_IsLadder
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl MetatileBehavior_IsEscalator
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl sub_8056F08
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl sub_8057798
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl is_role_x68
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl MetatileBehavior_IsAquaHideoutWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl sub_8057804
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	movs r0, 0
	b _08068BAC
_08068BAA:
	movs r0, 0x1
_08068BAC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8068B30

	thumb_func_start is_non_stair_warp_tile
is_non_stair_warp_tile: @ 8068BB4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x2
	beq _08068BD8
	cmp r1, 0x2
	bgt _08068BCE
	cmp r1, 0x1
	beq _08068BE2
	b _08068C04
_08068BCE:
	cmp r2, 0x3
	beq _08068BEC
	cmp r2, 0x4
	beq _08068BF6
	b _08068C04
_08068BD8:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsNorthArrowWarp
	b _08068BFE
_08068BE2:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSouthArrowWarp
	b _08068BFE
_08068BEC:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWestArrowWarp
	b _08068BFE
_08068BF6:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsEastArrowWarp
_08068BFE:
	lsls r0, 24
	lsrs r0, 24
	b _08068C06
_08068C04:
	movs r0, 0
_08068C06:
	pop {r1}
	bx r1
	thumb_func_end is_non_stair_warp_tile

	thumb_func_start map_warp_check_packed
map_warp_check_packed: @ 8068C0C
	push {lr}
	adds r3, r1, 0
	ldrh r1, [r3]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r3, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r3, 0x4]
	bl map_warp_check
	lsls r0, 24
	asrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end map_warp_check_packed

	thumb_func_start sub_8068C30
sub_8068C30: @ 8068C30
	push {r4-r7,lr}
	adds r5, r2, 0
	ldr r0, _08068C50
	ldr r0, [r0, 0x4]
	lsls r1, 24
	asrs r7, r1, 24
	lsls r6, r7, 3
	ldr r0, [r0, 0x8]
	adds r4, r0, r6
	ldrb r0, [r4, 0x6]
	cmp r0, 0x7F
	bne _08068C54
	ldrb r0, [r4, 0x5]
	bl copy_saved_warp2_bank_and_enter_x_to_warp1
	b _08068C9E
	.align 2, 0
_08068C50: .4byte gMapHeader
_08068C54:
	movs r0, 0x7
	ldrsb r0, [r4, r0]
	movs r1, 0x6
	ldrsb r1, [r4, r1]
	movs r2, 0x5
	ldrsb r2, [r4, r2]
	bl warp1_set_2
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	bl sub_80535C4
	ldrb r0, [r4, 0x7]
	ldrb r1, [r4, 0x6]
	bl get_mapheader_by_bank_and_number
	ldr r1, [r0, 0x4]
	ldrb r0, [r4, 0x5]
	ldr r1, [r1, 0x8]
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x6]
	cmp r0, 0x7F
	bne _08068C9E
	adds r0, r6, r1
	ldrb r0, [r0, 0x5]
	ldr r2, _08068CA4
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, 0x5]
	lsls r2, 24
	asrs r2, 24
	adds r3, r7, 0
	bl saved_warp2_set
_08068C9E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068CA4: .4byte gSaveBlock1
	thumb_func_end sub_8068C30

	thumb_func_start map_warp_consider_2_to_inside
map_warp_consider_2_to_inside: @ 8068CA8
	push {r4-r7,lr}
	adds r5, r0, 0
	lsls r1, 16
	lsrs r0, r1, 16
	adds r7, r0, 0
	lsls r2, 24
	lsrs r2, 24
	cmp r2, 0x2
	bne _08068D2C
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80571C0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068CE0
	ldr r0, _08068CDC
	ldr r1, [r0, 0x4]
	adds r0, r5, 0
	bl sub_80BC038
	movs r0, 0x1
	b _08068D2E
	.align 2, 0
_08068CDC: .4byte gMapHeader
_08068CE0:
	adds r0, r4, 0
	bl is_tile_x69_2_warp_door
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068D2C
	ldr r6, _08068D28
	adds r0, r6, 0
	adds r1, r5, 0
	bl map_warp_check_packed
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08068D2C
	adds r0, r7, 0
	bl sub_8068B30
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068D2C
	bl walkrun_find_lowest_active_bit_in_bitfield
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8068C30
	bl sub_8080EF0
	movs r0, 0x1
	b _08068D2E
	.align 2, 0
_08068D28: .4byte gMapHeader
_08068D2C:
	movs r0, 0
_08068D2E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end map_warp_consider_2_to_inside

	thumb_func_start map_warp_check
map_warp_check: @ 8068D34
	push {r4-r6,lr}
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	lsls r3, 24
	lsrs r4, r3, 24
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0x8]
	ldrb r3, [r0, 0x1]
	movs r2, 0
	cmp r2, r3
	bge _08068D72
_08068D4E:
	ldrh r0, [r1]
	cmp r0, r6
	bne _08068D6A
	ldrh r0, [r1, 0x2]
	cmp r0, r5
	bne _08068D6A
	ldrb r0, [r1, 0x4]
	cmp r0, r4
	beq _08068D64
	cmp r0, 0
	bne _08068D6A
_08068D64:
	lsls r0, r2, 24
	asrs r0, 24
	b _08068D76
_08068D6A:
	adds r2, 0x1
	adds r1, 0x8
	cmp r2, r3
	blt _08068D4E
_08068D72:
	movs r0, 0x1
	negs r0, r0
_08068D76:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end map_warp_check

	thumb_func_start trigger_activate
trigger_activate: @ 8068D7C
	push {r4,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _08068DB2
	ldr r1, [r4, 0xC]
	cmp r1, 0
	bne _08068D92
	ldrb r0, [r4, 0x6]
	bl sub_8069408
	b _08068DB2
_08068D92:
	ldrh r0, [r4, 0x6]
	cmp r0, 0
	beq _08068DAC
	ldrh r0, [r4, 0x6]
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r4, 0x8]
	cmp r0, r1
	bne _08068DB2
	ldr r0, [r4, 0xC]
	b _08068DB4
_08068DAC:
	adds r0, r1, 0
	bl ScriptContext2_RunNewScript
_08068DB2:
	movs r0, 0
_08068DB4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end trigger_activate

	thumb_func_start mapheader_trigger_activate_at
mapheader_trigger_activate_at: @ 8068DBC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0xC]
	ldrb r7, [r0, 0x2]
	movs r6, 0
	cmp r6, r7
	bge _08068E12
	adds r5, r1, 0
	adds r4, r5, 0
_08068DE8:
	ldrh r0, [r4]
	cmp r0, r10
	bne _08068E08
	ldrh r0, [r4, 0x2]
	cmp r0, r9
	bne _08068E08
	ldrb r0, [r4, 0x4]
	cmp r0, r8
	beq _08068DFE
	cmp r0, 0
	bne _08068E08
_08068DFE:
	adds r0, r5, 0
	bl trigger_activate
	cmp r0, 0
	bne _08068E14
_08068E08:
	adds r4, 0x10
	adds r5, 0x10
	adds r6, 0x1
	cmp r6, r7
	blt _08068DE8
_08068E12:
	movs r0, 0
_08068E14:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end mapheader_trigger_activate_at

	thumb_func_start sub_8068E24
sub_8068E24: @ 8068E24
	push {r4,lr}
	ldr r4, _08068E48
	ldrh r1, [r0]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r0, 0x4]
	adds r0, r4, 0
	bl mapheader_trigger_activate_at
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08068E48: .4byte gMapHeader
	thumb_func_end sub_8068E24

	thumb_func_start FindInvisibleMapObjectByPosition
FindInvisibleMapObjectByPosition: @ 8068E4C
	push {r4-r7,lr}
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, [r0, 0x4]
	ldr r4, [r0, 0x10]
	ldrb r3, [r0, 0x3]
	movs r2, 0
	cmp r2, r3
	bcs _08068E92
_08068E66:
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, r7
	bne _08068E88
	ldrh r0, [r1, 0x2]
	cmp r0, r6
	bne _08068E88
	ldrb r0, [r1, 0x4]
	cmp r0, r5
	beq _08068E84
	cmp r0, 0
	bne _08068E88
_08068E84:
	adds r0, r1, 0
	b _08068E94
_08068E88:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r3
	bcc _08068E66
_08068E92:
	movs r0, 0
_08068E94:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end FindInvisibleMapObjectByPosition

	thumb_func_start dive_warp
dive_warp: @ 8068E9C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r0, _08068ED0
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _08068ED4
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_805750C
	lsls r0, 24
	cmp r0, 0
	bne _08068ED4
	ldrh r0, [r4]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4, 0x2]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_80538B0
	b _08068EF8
	.align 2, 0
_08068ED0: .4byte gMapHeader
_08068ED4:
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_80574EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068F10
	ldrh r0, [r4]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4, 0x2]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_80538D0
_08068EF8:
	lsls r0, 24
	cmp r0, 0
	beq _08068F10
	bl walkrun_find_lowest_active_bit_in_bitfield
	bl sp13E_warp_to_last_warp
	movs r0, 0xE9
	bl PlaySE
	movs r0, 0x1
	b _08068F12
_08068F10:
	movs r0, 0
_08068F12:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end dive_warp

	thumb_func_start sub_8068F18
sub_8068F18: @ 8068F18
	push {r4,r5,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08068F70
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _08068F74
	adds r0, r5, 0
	bl sub_805750C
	lsls r0, 24
	cmp r0, 0
	bne _08068F74
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_80538B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068FA4
	movs r0, 0x1
	b _08068FA6
	.align 2, 0
_08068F70: .4byte gMapHeader
_08068F74:
	adds r0, r5, 0
	bl sub_80574EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068FA4
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_80538D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068FA4
	movs r0, 0x2
	b _08068FA6
_08068FA4:
	movs r0, 0
_08068FA6:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8068F18

	thumb_func_start GetFieldObjectScriptPointerForComparison
GetFieldObjectScriptPointerForComparison: @ 8068FB0
	push {r4,r5,lr}
	sub sp, 0x8
	bl player_get_direction_upper_nybble
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r5, sp
	mov r0, sp
	bl player_get_next_pos_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, sp
	adds r2, r4, 0
	bl sub_8068364
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectScriptPointerForComparison

	thumb_func_start sub_8068FEC
sub_8068FEC: @ 8068FEC
	push {r4,lr}
	sub sp, 0x8
	bl player_get_direction_upper_nybble
	mov r4, sp
	mov r0, sp
	bl player_get_pos_to_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	ldr r4, _0806902C
	adds r0, r4, 0
	mov r1, sp
	bl map_warp_check_packed
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r4, 0
	mov r2, sp
	bl sub_8068C30
	movs r0, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806902C: .4byte gMapHeader
	thumb_func_end sub_8068FEC

	thumb_func_start sub_8069030
sub_8069030: @ 8069030
	push {r4,lr}
	ldr r4, _08069064
	movs r2, 0x90
	lsls r2, 1
	adds r0, r4, 0
	movs r1, 0
	bl memset
	movs r0, 0x90
	lsls r0, 1
	adds r4, r0
	movs r2, 0x80
	lsls r2, 2
	adds r0, r4, 0
	movs r1, 0
	bl memset
	ldr r0, _08069068
	movs r1, 0
	movs r2, 0x10
	bl memset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069064: .4byte gSaveBlock1 + 0x1220
_08069068: .4byte gUnknown_0202E8E2
	thumb_func_end sub_8069030

	thumb_func_start sub_806906C
sub_806906C: @ 806906C
	push {lr}
	ldr r0, _080690A0
	movs r1, 0
	str r1, [r0]
	movs r1, 0x90
	lsls r1, 1
	adds r0, r1
	movs r1, 0
	movs r2, 0x20
	bl memset
	ldr r0, _080690A4
	bl FlagReset
	ldr r0, _080690A8
	bl FlagReset
	ldr r0, _080690AC
	bl FlagReset
	ldr r0, _080690B0
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_080690A0: .4byte gSaveBlock1 + 0x1220
_080690A4: .4byte 0x0000084d
_080690A8: .4byte 0x0000084e
_080690AC: .4byte 0x00000829
_080690B0: .4byte 0x00000861
	thumb_func_end sub_806906C

	thumb_func_start sub_80690B4
sub_80690B4: @ 80690B4
	push {lr}
	ldr r0, _080690C4
	movs r1, 0
	movs r2, 0x8
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_080690C4: .4byte gSaveBlock1 + 0x1338
	thumb_func_end sub_80690B4

	thumb_func_start sub_80690C8
sub_80690C8: @ 80690C8
	push {lr}
	ldr r0, _080690E4
	bl GetVarPointer
	ldr r2, _080690E8
	movs r1, 0
	strb r1, [r2, 0x1A]
	strh r1, [r0]
	ldr r0, _080690EC
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_080690E4: .4byte 0x00004046
_080690E8: .4byte gSaveBlock2
_080690EC: .4byte 0x00000836
	thumb_func_end sub_80690C8

	thumb_func_start sub_80690F0
sub_80690F0: @ 80690F0
	push {r4,r5,lr}
	ldr r0, _0806911C
	bl GetVarPointer
	ldr r4, _08069120
	movs r5, 0
	movs r1, 0xDA
	strb r1, [r4, 0x1A]
	ldr r2, _08069124
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _08069128
	bl FlagSet
	movs r0, 0x1
	strb r0, [r4, 0x19]
	strb r5, [r4, 0x18]
	bl sub_808C0A0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806911C: .4byte 0x00004046
_08069120: .4byte gSaveBlock2
_08069124: .4byte 0x00000302
_08069128: .4byte 0x00000836
	thumb_func_end sub_80690F0

	thumb_func_start sub_806912C
sub_806912C: @ 806912C
	push {lr}
	ldr r0, _08069154
	ldrb r0, [r0, 0x1A]
	cmp r0, 0xDA
	bne _08069164
	ldr r0, _08069158
	bl VarGet
	lsls r0, 16
	ldr r1, _0806915C
	cmp r0, r1
	bne _08069164
	ldr r0, _08069160
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08069164
	movs r0, 0x1
	b _08069166
	.align 2, 0
_08069154: .4byte gSaveBlock2
_08069158: .4byte 0x00004046
_0806915C: .4byte 0x03020000
_08069160: .4byte 0x00000836
_08069164:
	movs r0, 0
_08069166:
	pop {r1}
	bx r1
	thumb_func_end sub_806912C

	thumb_func_start unref_sub_806916C
unref_sub_806916C: @ 806916C
	push {lr}
	ldr r0, _08069178
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_08069178: .4byte 0x0000084c
	thumb_func_end unref_sub_806916C

	thumb_func_start unref_sub_806917C
unref_sub_806917C: @ 806917C
	push {lr}
	ldr r0, _08069188
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_08069188: .4byte 0x0000084c
	thumb_func_end unref_sub_806917C

	thumb_func_start IsMysteryGiftAvailable
IsMysteryGiftAvailable: @ 806918C
	push {lr}
	ldr r0, _0806919C
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0806919C: .4byte 0x0000084c
	thumb_func_end IsMysteryGiftAvailable

	thumb_func_start sub_80691A0
sub_80691A0: @ 80691A0
	push {lr}
	ldr r0, _080691B4
	movs r1, 0
	bl VarSet
	ldr r0, _080691B8
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_080691B4: .4byte 0x0000402c
_080691B8: .4byte 0x00000862
	thumb_func_end sub_80691A0

	thumb_func_start sub_80691BC
sub_80691BC: @ 80691BC
	push {lr}
	ldr r0, _080691D4
	movs r1, 0x92
	lsls r1, 4
	bl VarSet
	ldr r0, _080691D8
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_080691D4: .4byte 0x0000402c
_080691D8: .4byte 0x00000862
	thumb_func_end sub_80691BC

	thumb_func_start sub_80691DC
sub_80691DC: @ 80691DC
	push {lr}
	ldr r0, _08069200
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08069208
	ldr r0, _08069204
	bl VarGet
	lsls r0, 16
	movs r1, 0x92
	lsls r1, 20
	cmp r0, r1
	bne _08069208
	movs r0, 0x1
	b _0806920A
	.align 2, 0
_08069200: .4byte 0x00000862
_08069204: .4byte 0x0000402c
_08069208:
	movs r0, 0
_0806920A:
	pop {r1}
	bx r1
	thumb_func_end sub_80691DC

	thumb_func_start GetVarPointer
GetVarPointer: @ 8069210
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, r1, 0
	ldr r0, _08069224
	cmp r1, r0
	bhi _08069228
	movs r0, 0
	b _0806924A
	.align 2, 0
_08069224: .4byte 0x00003fff
_08069228:
	lsls r0, r1, 16
	cmp r0, 0
	bge _08069244
	ldr r0, _0806923C
	ldr r2, _08069240
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	b _0806924A
	.align 2, 0
_0806923C: .4byte gUnknown_0814B14C
_08069240: .4byte 0xffff8000
_08069244:
	lsls r0, r2, 1
	ldr r1, _08069250
	adds r0, r1
_0806924A:
	pop {r1}
	bx r1
	.align 2, 0
_08069250: .4byte 0x0201ea74
	thumb_func_end GetVarPointer

	thumb_func_start VarGet
VarGet: @ 8069254
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetVarPointer
	cmp r0, 0
	beq _08069268
	ldrh r0, [r0]
	b _0806926A
_08069268:
	adds r0, r4, 0
_0806926A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end VarGet

	thumb_func_start VarSet
VarSet: @ 8069270
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	bl GetVarPointer
	cmp r0, 0
	beq _08069288
	strh r4, [r0]
	movs r0, 0x1
	b _0806928A
_08069288:
	movs r0, 0
_0806928A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end VarSet

	thumb_func_start VarGetFieldObjectGraphicsId
VarGetFieldObjectGraphicsId: @ 8069290
	push {lr}
	lsls r0, 24
	lsrs r0, 8
	ldr r1, _080692A8
	adds r0, r1
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080692A8: .4byte 0x40100000
	thumb_func_end VarGetFieldObjectGraphicsId

	thumb_func_start GetFlagPointer
GetFlagPointer: @ 80692AC
	push {lr}
	lsls r2, r0, 16
	lsrs r1, r2, 16
	adds r3, r1, 0
	cmp r1, 0
	bne _080692BC
	movs r0, 0
	b _080692E2
_080692BC:
	ldr r0, _080692C8
	cmp r1, r0
	bhi _080692D0
	lsrs r0, r2, 19
	ldr r1, _080692CC
	b _080692E0
	.align 2, 0
_080692C8: .4byte 0x00003fff
_080692CC: .4byte gSaveBlock1 + 0x1220
_080692D0:
	ldr r1, _080692E8
	adds r0, r3, r1
	cmp r0, 0
	bge _080692DC
	adds r1, 0x7
	adds r0, r3, r1
_080692DC:
	asrs r0, 3
	ldr r1, _080692EC
_080692E0:
	adds r0, r1
_080692E2:
	pop {r1}
	bx r1
	.align 2, 0
_080692E8: .4byte 0xffffc000
_080692EC: .4byte gUnknown_0202E8E2
	thumb_func_end GetFlagPointer

	thumb_func_start FlagSet
FlagSet: @ 80692F0
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetFlagPointer
	adds r2, r0, 0
	cmp r2, 0
	beq _08069310
	movs r0, 0x7
	ands r0, r4
	movs r1, 0x1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r1, r0
	strb r1, [r2]
_08069310:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagSet

	thumb_func_start FlagReset
FlagReset: @ 8069318
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetFlagPointer
	adds r2, r0, 0
	cmp r2, 0
	beq _08069338
	movs r0, 0x7
	ands r0, r4
	movs r1, 0x1
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
_08069338:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagReset

	thumb_func_start FlagGet
FlagGet: @ 8069340
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetFlagPointer
	cmp r0, 0
	beq _08069364
	ldrb r0, [r0]
	movs r1, 0x7
	ands r1, r4
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08069364
	movs r0, 0x1
	b _08069366
_08069364:
	movs r0, 0
_08069366:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagGet

	thumb_func_start sub_806936C
sub_806936C: @ 806936C
	push {lr}
	movs r0, 0x1
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_806936C

	thumb_func_start sub_8069378
sub_8069378: @ 8069378
	push {lr}
	movs r0, 0x2
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_8069378

	thumb_func_start sub_8069384
sub_8069384: @ 8069384
	push {lr}
	movs r0, 0x3
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_8069384

	thumb_func_start sub_8069390
sub_8069390: @ 8069390
	push {lr}
	movs r0, 0x4
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_8069390

	thumb_func_start sub_806939C
sub_806939C: @ 806939C
	push {lr}
	movs r0, 0x5
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_806939C

	thumb_func_start sub_80693A8
sub_80693A8: @ 80693A8
	push {lr}
	movs r0, 0x6
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693A8

	thumb_func_start sub_80693B4
sub_80693B4: @ 80693B4
	push {lr}
	movs r0, 0x9
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693B4

	thumb_func_start sub_80693C0
sub_80693C0: @ 80693C0
	push {lr}
	movs r0, 0x7
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693C0

	thumb_func_start sub_80693CC
sub_80693CC: @ 80693CC
	push {lr}
	movs r0, 0x8
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693CC

	thumb_func_start sub_80693D8
sub_80693D8: @ 80693D8
	push {lr}
	movs r0, 0xB
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693D8

	thumb_func_start sub_80693E4
sub_80693E4: @ 80693E4
	push {lr}
	movs r0, 0xC
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693E4

	thumb_func_start sub_80693F0
sub_80693F0: @ 80693F0
	push {lr}
	movs r0, 0x14
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693F0

	thumb_func_start sub_80693FC
sub_80693FC: @ 80693FC
	push {lr}
	movs r0, 0x15
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693FC

	thumb_func_start sub_8069408
sub_8069408: @ 8069408
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r2, 0
	ldr r3, _08069428
_08069412:
	lsls r1, r2, 3
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r4
	bne _0806942C
	adds r0, r3, 0x4
	adds r0, r1, r0
	ldr r0, [r0]
	bl _call_via_r0
	b _08069436
	.align 2, 0
_08069428: .4byte gUnknown_083762FC
_0806942C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xC
	bls _08069412
_08069436:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8069408

	thumb_func_start task_per_step_callback_manager
task_per_step_callback_manager: @ 806943C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08069460
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x8
	ldrsh r1, [r1, r2]
	ldr r2, _08069464
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08069460: .4byte gTasks
_08069464: .4byte gUnknown_08376364
	thumb_func_end task_per_step_callback_manager

	thumb_func_start sub_8069468
sub_8069468: @ 8069468
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0806947A
	cmp r0, 0x1
	beq _08069498
	b _080694AC
_0806947A:
	ldr r0, _08069494
	ldr r0, [r0, 0x20]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	beq _080694AC
	bl InTrainerHill
	ldrh r0, [r4]
	adds r0, 0x1
	b _080694AA
	.align 2, 0
_08069494: .4byte gMain
_08069498:
	ldr r0, _080694B4
	ldr r0, [r0, 0x20]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	bne _080694AC
	ldrh r0, [r4]
	subs r0, 0x1
_080694AA:
	strh r0, [r4]
_080694AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080694B4: .4byte gMain
	thumb_func_end sub_8069468

	thumb_func_start sub_80694B8
sub_80694B8: @ 80694B8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080694E8
	adds r4, r1, r0
	bl ScriptContext2_IsEnabled
	lsls r0, 24
	cmp r0, 0
	bne _080694E0
	adds r0, r4, 0
	bl sub_8069468
	adds r0, r4, 0x2
	adds r1, r4, 0x4
	bl sub_80540D0
_080694E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080694E8: .4byte gUnknown_03004B28
	thumb_func_end sub_80694B8

	thumb_func_start overworld_ensure_per_step_coros_running
overworld_ensure_per_step_coros_running: @ 80694EC
	push {r4,r5,lr}
	ldr r5, _08069548
	adds r0, r5, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08069516
	adds r0, r5, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806954C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
_08069516:
	ldr r4, _08069550
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _0806952C
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_0806952C:
	ldr r4, _08069554
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08069542
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_08069542:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069548: .4byte task_per_step_callback_manager
_0806954C: .4byte gTasks
_08069550: .4byte sub_806A1E8
_08069554: .4byte sub_80694B8
	thumb_func_end overworld_ensure_per_step_coros_running

	thumb_func_start activate_per_step_callback
activate_per_step_callback: @ 8069558
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08069590
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _0806959A
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08069594
	adds r1, r0, r1
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0x1E
_0806957C:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _0806957C
	cmp r4, 0x7
	bls _08069598
	movs r0, 0
	strh r0, [r1]
	b _0806959A
	.align 2, 0
_08069590: .4byte task_per_step_callback_manager
_08069594: .4byte gUnknown_03004B28
_08069598:
	strh r4, [r1]
_0806959A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end activate_per_step_callback

	thumb_func_start wild_encounter_reset_coro_args
wild_encounter_reset_coro_args: @ 80695A0
	push {lr}
	ldr r0, _080695D0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080695D4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _080695CA
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _080695D8
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x2]
	strh r1, [r0, 0x4]
_080695CA:
	pop {r0}
	bx r0
	.align 2, 0
_080695D0: .4byte task_per_step_callback_manager
_080695D4: .4byte sub_80694B8
_080695D8: .4byte gUnknown_03004B28
	thumb_func_end wild_encounter_reset_coro_args

	thumb_func_start nullsub_51
nullsub_51: @ 80695DC
	bx lr
	thumb_func_end nullsub_51

	thumb_func_start sub_80695E0
sub_80695E0: @ 80695E0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	adds r0, r4, 0
	bl sub_80576A0
	lsls r0, 24
	cmp r0, 0
	beq _080695F8
	adds r0, r5, 0
	b _08069630
_080695F8:
	adds r0, r4, 0
	bl sub_80576B4
	lsls r0, 24
	cmp r0, 0
	beq _0806960A
	adds r0, r5, 0
	adds r0, 0x8
	b _08069630
_0806960A:
	adds r0, r4, 0
	bl sub_80576C8
	lsls r0, 24
	cmp r0, 0
	beq _0806961C
	adds r0, r5, 0
	adds r0, 0x10
	b _08069630
_0806961C:
	adds r0, r4, 0
	bl sub_80576DC
	lsls r0, 24
	cmp r0, 0
	bne _0806962C
	movs r0, 0
	b _08069630
_0806962C:
	adds r0, r5, 0
	adds r0, 0x18
_08069630:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80695E0

	thumb_func_start sub_8069638
sub_8069638: @ 8069638
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	mov r8, r3
	lsls r1, 16
	asrs r6, r1, 16
	lsls r2, 16
	asrs r7, r2, 16
	adds r0, r6, 0
	adds r1, r7, 0
	bl MapGridGetMetatileBehaviorAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	bl sub_80695E0
	adds r4, r0, 0
	adds r5, r4, 0
	cmp r4, 0
	beq _080696B6
	movs r0, 0
	ldrsb r0, [r4, r0]
	adds r0, r6, r0
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	adds r1, r7, r1
	ldrh r2, [r4, 0x2]
	bl MapGridSetMetatileIdAt
	mov r0, r8
	cmp r0, 0
	beq _0806968E
	movs r0, 0
	ldrsb r0, [r4, r0]
	adds r0, r6, r0
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	adds r1, r7, r1
	bl CurrentMapDrawMetatileAt
_0806968E:
	movs r0, 0x4
	ldrsb r0, [r5, r0]
	adds r0, r6, r0
	movs r1, 0x5
	ldrsb r1, [r5, r1]
	adds r1, r7, r1
	ldrh r2, [r5, 0x6]
	bl MapGridSetMetatileIdAt
	mov r0, r8
	cmp r0, 0
	beq _080696B6
	movs r0, 0x4
	ldrsb r0, [r5, r0]
	adds r0, r6, r0
	movs r1, 0x5
	ldrsb r1, [r5, r1]
	adds r1, r7, r1
	bl CurrentMapDrawMetatileAt
_080696B6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8069638

	thumb_func_start sub_80696C0
sub_80696C0: @ 80696C0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldr r0, _080696E0
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8069638
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080696E0: .4byte gUnknown_08376384
	thumb_func_end sub_80696C0

	thumb_func_start sub_80696E4
sub_80696E4: @ 80696E4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldr r0, _08069704
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8069638
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069704: .4byte gUnknown_083763A4
	thumb_func_end sub_80696E4

	thumb_func_start sub_8069708
sub_8069708: @ 8069708
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldr r0, _08069728
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8069638
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069728: .4byte gUnknown_083763C4
	thumb_func_end sub_8069708

	thumb_func_start sub_806972C
sub_806972C: @ 806972C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r10, r8
	lsls r1, 16
	lsrs r7, r1, 16
	mov r9, r7
	lsls r2, 16
	asrs r6, r2, 16
	lsls r3, 16
	asrs r5, r3, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80576A0
	lsls r0, 24
	cmp r0, 0
	beq _08069770
	lsls r0, r7, 16
	asrs r0, 16
	cmp r0, r5
	ble _080697B6
_0806976C:
	movs r0, 0
	b _080697B8
_08069770:
	adds r0, r4, 0
	bl sub_80576B4
	lsls r0, 24
	cmp r0, 0
	beq _08069788
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r5
	bge _080697B6
	b _0806976C
_08069788:
	adds r0, r4, 0
	bl sub_80576C8
	lsls r0, 24
	cmp r0, 0
	beq _080697A0
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r6
	ble _080697B6
	b _0806976C
_080697A0:
	adds r0, r4, 0
	bl sub_80576DC
	lsls r0, 24
	cmp r0, 0
	beq _080697B6
	mov r1, r10
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r6
	blt _0806976C
_080697B6:
	movs r0, 0x1
_080697B8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806972C

	thumb_func_start sub_80697C8
sub_80697C8: @ 80697C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	mov r10, r8
	lsls r3, 16
	lsrs r7, r3, 16
	mov r9, r7
	lsls r0, 16
	asrs r6, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80576A0
	lsls r0, 24
	cmp r0, 0
	beq _0806980C
	lsls r0, r7, 16
	asrs r0, 16
	cmp r5, r0
	bge _08069852
_08069808:
	movs r0, 0
	b _08069854
_0806980C:
	adds r0, r4, 0
	bl sub_80576B4
	lsls r0, 24
	cmp r0, 0
	beq _08069824
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	cmp r5, r0
	ble _08069852
	b _08069808
_08069824:
	adds r0, r4, 0
	bl sub_80576C8
	lsls r0, 24
	cmp r0, 0
	beq _0806983C
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	cmp r6, r0
	bge _08069852
	b _08069808
_0806983C:
	adds r0, r4, 0
	bl sub_80576DC
	lsls r0, 24
	cmp r0, 0
	beq _08069852
	mov r1, r10
	lsls r0, r1, 16
	asrs r0, 16
	cmp r6, r0
	bgt _08069808
_08069852:
	movs r0, 0x1
_08069854:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80697C8

	thumb_func_start sub_8069864
sub_8069864: @ 8069864
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069898
	adds r4, r1, r0
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	adds r6, r5, 0
	cmp r0, 0x1
	beq _080698BE
	cmp r0, 0x1
	bgt _0806989C
	cmp r0, 0
	beq _080698A2
	b _080699CE
	.align 2, 0
_08069898: .4byte gUnknown_03004B28
_0806989C:
	cmp r0, 0x2
	beq _0806998C
	b _080699CE
_080698A2:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r3, 0
	ldrsh r1, [r5, r3]
	movs r2, 0x1
	bl sub_80696E4
	b _080699CA
_080698BE:
	mov r0, sp
	movs r7, 0
	ldrsh r1, [r0, r7]
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080698D8
	movs r3, 0
	ldrsh r1, [r5, r3]
	movs r7, 0x6
	ldrsh r0, [r4, r7]
	cmp r1, r0
	beq _080699CE
_080698D8:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r5, 0x6
	ldrsh r3, [r4, r5]
	bl sub_806972C
	cmp r0, 0
	beq _08069920
	movs r7, 0x4
	ldrsh r0, [r4, r7]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	movs r2, 0x1
	bl sub_80696C0
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	movs r5, 0x6
	ldrsh r1, [r4, r5]
	movs r2, 0
	bl sub_8069708
	ldrh r0, [r4, 0x4]
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0x6]
	strh r0, [r4, 0xA]
	movs r0, 0x2
	strh r0, [r4, 0x2]
	movs r0, 0x8
	strh r0, [r4, 0xC]
	b _0806992A
_08069920:
	movs r7, 0x1
	negs r7, r7
	adds r0, r7, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
_0806992A:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r5, r6, 0
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r7, 0x6
	ldrsh r3, [r4, r7]
	bl sub_80697C8
	cmp r0, 0
	beq _0806995E
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r2, 0x1
	bl sub_80696C0
	movs r0, 0x2
	strh r0, [r4, 0x2]
	movs r0, 0x8
	strh r0, [r4, 0xC]
_0806995E:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	ldrh r0, [r6]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r5, 0
	ldrsh r1, [r6, r5]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsPacifidlogLog
	lsls r0, 24
	cmp r0, 0
	beq _080699CE
	movs r0, 0x46
	bl PlaySE
	b _080699CE
_0806998C:
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _080699CE
	mov r0, sp
	movs r7, 0
	ldrsh r0, [r0, r7]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r2, 0x1
	bl sub_80696E4
	movs r3, 0x8
	ldrsh r0, [r4, r3]
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080699CA
	movs r5, 0xA
	ldrsh r0, [r4, r5]
	cmp r0, r1
	beq _080699CA
	movs r7, 0x8
	ldrsh r0, [r4, r7]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r2, 0x1
	bl sub_8069708
_080699CA:
	movs r0, 0x1
	strh r0, [r4, 0x2]
_080699CE:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8069864

	thumb_func_start sub_80699D8
sub_80699D8: @ 80699D8
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	bl PlayerGetZCoord
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08069A32
	lsls r0, r4, 16
	asrs r4, r0, 16
	lsls r0, r5, 16
	asrs r5, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	ldr r0, _08069A14
	cmp r1, r0
	beq _08069A18
	adds r0, 0x8
	cmp r1, r0
	beq _08069A28
	b _08069A32
	.align 2, 0
_08069A14: .4byte 0x0000024e
_08069A18:
	ldr r2, _08069A24
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _08069A32
	.align 2, 0
_08069A24: .4byte 0x0000024f
_08069A28:
	ldr r2, _08069A38
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_08069A32:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069A38: .4byte 0x00000257
	thumb_func_end sub_80699D8

	thumb_func_start sub_8069A3C
sub_8069A3C: @ 8069A3C
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	bl PlayerGetZCoord
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08069A96
	lsls r0, r4, 16
	asrs r4, r0, 16
	lsls r0, r5, 16
	asrs r5, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	ldr r0, _08069A78
	cmp r1, r0
	beq _08069A7C
	adds r0, 0x8
	cmp r1, r0
	beq _08069A8C
	b _08069A96
	.align 2, 0
_08069A78: .4byte 0x0000024f
_08069A7C:
	ldr r2, _08069A88
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _08069A96
	.align 2, 0
_08069A88: .4byte 0x0000024e
_08069A8C:
	ldr r2, _08069A9C
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_08069A96:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069A9C: .4byte 0x00000256
	thumb_func_end sub_8069A3C

	thumb_func_start sub_8069AA0
sub_8069AA0: @ 8069AA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069ADC
	adds r6, r1, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	movs r0, 0x2
	ldrsh r5, [r6, r0]
	mov r9, r4
	cmp r5, 0x1
	beq _08069B34
	cmp r5, 0x1
	bgt _08069AE0
	cmp r5, 0
	beq _08069AE8
	b _08069CA6
	.align 2, 0
_08069ADC: .4byte gUnknown_03004B28
_08069AE0:
	cmp r5, 0x2
	bne _08069AE6
	b _08069C14
_08069AE6:
	b _08069CA6
_08069AE8:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r6, 0x4]
	mov r1, r9
	ldrh r0, [r1]
	strh r0, [r6, 0x6]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r3, 0
	ldrsh r1, [r1, r3]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	cmp r0, 0
	bne _08069B12
	b _08069CA2
_08069B12:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl sub_80699D8
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl CurrentMapDrawMetatileAt
	b _08069CA2
_08069B34:
	ldrh r0, [r6, 0x6]
	mov r8, r0
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	ldrh r2, [r6, 0x4]
	mov r10, r2
	movs r3, 0x4
	ldrsh r7, [r6, r3]
	cmp r0, r7
	bne _08069B5C
	mov r0, r9
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r3, r8
	lsls r0, r3, 16
	asrs r0, 16
	cmp r1, r0
	bne _08069B5C
	b _08069CA6
_08069B5C:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	mov r0, r8
	lsls r4, r0, 16
	asrs r1, r4, 16
	adds r0, r7, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	lsrs r7, r0, 24
	bl PlayerGetZCoord
	movs r1, 0
	ands r5, r0
	lsls r0, r5, 24
	adds r5, r4, 0
	cmp r0, 0
	bne _08069BA4
	movs r1, 0x1
_08069BA4:
	cmp r1, 0
	beq _08069BB8
	ldr r1, [sp, 0x4]
	cmp r1, 0x1
	beq _08069BB2
	cmp r7, 0x1
	bne _08069BB8
_08069BB2:
	movs r0, 0x47
	bl PlaySE
_08069BB8:
	cmp r7, 0
	beq _08069BF4
	mov r2, r10
	lsls r4, r2, 16
	asrs r4, 16
	asrs r5, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8069A3C
	adds r0, r4, 0
	adds r1, r5, 0
	bl CurrentMapDrawMetatileAt
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl sub_80699D8
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl CurrentMapDrawMetatileAt
_08069BF4:
	mov r0, r10
	strh r0, [r6, 0x8]
	mov r1, r8
	strh r1, [r6, 0xA]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r6, 0x4]
	mov r2, r9
	ldrh r0, [r2]
	strh r0, [r6, 0x6]
	cmp r7, 0
	beq _08069CA6
	movs r0, 0x10
	strh r0, [r6, 0xC]
	movs r0, 0x2
	strh r0, [r6, 0x2]
_08069C14:
	ldrh r0, [r6, 0xC]
	subs r0, 0x1
	strh r0, [r6, 0xC]
	ldrh r3, [r6, 0x8]
	mov r10, r3
	ldrh r0, [r6, 0xA]
	mov r8, r0
	movs r1, 0xC
	ldrsh r0, [r6, r1]
	movs r1, 0x7
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	bhi _08069C9A
	lsls r0, 2
	ldr r1, _08069C40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08069C40: .4byte _08069C44
	.align 2, 0
_08069C44:
	.4byte _08069C64
	.4byte _08069C9A
	.4byte _08069C9A
	.4byte _08069C9A
	.4byte _08069C76
	.4byte _08069C9A
	.4byte _08069C9A
	.4byte _08069C9A
_08069C64:
	mov r2, r10
	lsls r0, r2, 16
	asrs r0, 16
	mov r3, r8
	lsls r1, r3, 16
	asrs r1, 16
	bl CurrentMapDrawMetatileAt
	b _08069C9A
_08069C76:
	mov r0, r10
	lsls r5, r0, 16
	asrs r5, 16
	mov r1, r8
	lsls r4, r1, 16
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80699D8
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8069A3C
_08069C9A:
	movs r2, 0xC
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bne _08069CA6
_08069CA2:
	movs r0, 0x1
	strh r0, [r6, 0x2]
_08069CA6:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8069AA0

	thumb_func_start sub_8069CB8
sub_8069CB8: @ 8069CB8
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r0, 16
	ldr r2, _08069CE8
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0xA
	bhi _08069CF4
	lsls r0, r1, 16
	asrs r1, r0, 16
	ldr r2, _08069CEC
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0xD
	bhi _08069CF4
	ldr r0, _08069CF0
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _08069CF4
	movs r0, 0x1
	b _08069CF6
	.align 2, 0
_08069CE8: .4byte 0xfffd0000
_08069CEC: .4byte 0xfffa0000
_08069CF0: .4byte gUnknown_083763E4
_08069CF4:
	movs r0, 0
_08069CF6:
	pop {r1}
	bx r1
	thumb_func_end sub_8069CB8

	thumb_func_start sub_8069CFC
sub_8069CFC: @ 8069CFC
	push {r4,r5,lr}
	lsls r0, 16
	asrs r5, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8069CB8
	cmp r0, 0
	beq _08069D2A
	ldr r1, _08069D30
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	bl GetVarPointer
	subs r2, r5, 0x3
	movs r1, 0x1
	lsls r1, r2
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
_08069D2A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069D30: .4byte gUnknown_083763E4
	thumb_func_end sub_8069CFC

	thumb_func_start sub_8069D34
sub_8069D34: @ 8069D34
	push {r4,r5,lr}
	lsls r0, 16
	asrs r5, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8069CB8
	cmp r0, 0
	beq _08069D66
	ldr r1, _08069D6C
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	bl VarGet
	lsls r0, 16
	subs r2, r5, 0x3
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r2
	ands r1, r0
	cmp r1, 0
	bne _08069D70
_08069D66:
	movs r0, 0
	b _08069D72
	.align 2, 0
_08069D6C: .4byte gUnknown_083763E4
_08069D70:
	movs r0, 0x1
_08069D72:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8069D34

	thumb_func_start sub_8069D78
sub_8069D78: @ 8069D78
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _08069DCC
	ldr r0, [r0]
	ldr r1, [r0]
	mov r9, r1
	ldr r7, [r0, 0x4]
	movs r5, 0
	cmp r5, r9
	bge _08069DC0
_08069D90:
	movs r4, 0
	adds r0, r5, 0x1
	mov r8, r0
	cmp r4, r7
	bge _08069DBA
	lsls r6, r5, 16
_08069D9C:
	lsls r1, r4, 16
	asrs r1, 16
	asrs r0, r6, 16
	bl sub_8069D34
	cmp r0, 0x1
	bne _08069DB4
	adds r1, r4, 0x7
	adds r0, r5, 0x7
	ldr r2, _08069DD0
	bl MapGridSetMetatileIdAt
_08069DB4:
	adds r4, 0x1
	cmp r4, r7
	blt _08069D9C
_08069DBA:
	mov r5, r8
	cmp r5, r9
	blt _08069D90
_08069DC0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069DCC: .4byte gMapHeader
_08069DD0: .4byte 0x0000020e
	thumb_func_end sub_8069D78

	thumb_func_start sub_8069DD4
sub_8069DD4: @ 8069DD4
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069DF8
	adds r5, r1, r0
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08069E20
	cmp r0, 0x1
	bgt _08069DFC
	cmp r0, 0
	beq _08069E08
	b _08069F56
	.align 2, 0
_08069DF8: .4byte gUnknown_03004B28
_08069DFC:
	cmp r0, 0x2
	beq _08069EB6
	cmp r0, 0x3
	bne _08069E06
	b _08069F10
_08069E06:
	b _08069F56
_08069E08:
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x4]
	ldrh r0, [r4]
	strh r0, [r5, 0x6]
	b _08069F52
_08069E20:
	mov r7, sp
	adds r7, 0x2
	mov r0, sp
	adds r1, r7, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _08069E4A
	movs r0, 0
	ldrsh r1, [r7, r0]
	movs r3, 0x6
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _08069E4A
	b _08069F56
_08069E4A:
	strh r2, [r5, 0x4]
	ldrh r0, [r7]
	strh r0, [r5, 0x6]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08069E8C
	bl GetVarPointer
	adds r6, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8057540
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08069E90
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	movs r0, 0x4
	strh r0, [r5, 0xC]
	movs r0, 0x2
	b _08069EA8
	.align 2, 0
_08069E8C: .4byte 0x00004022
_08069E90:
	adds r0, r4, 0
	bl sub_8057554
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08069F56
	movs r0, 0
	strh r0, [r6]
	movs r0, 0x4
	strh r0, [r5, 0xC]
	movs r0, 0x3
_08069EA8:
	strh r0, [r5, 0x2]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x8]
	ldrh r0, [r7]
	strh r0, [r5, 0xA]
	b _08069F56
_08069EB6:
	ldrh r1, [r5, 0xC]
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	cmp r0, 0
	bne _08069F1A
	mov r1, sp
	ldrh r0, [r5, 0x8]
	strh r0, [r1]
	mov r4, sp
	adds r4, 0x2
	ldrh r0, [r5, 0xA]
	strh r0, [r4]
	movs r0, 0x2A
	bl PlaySE
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _08069F0C
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	asrs r1, 16
	bl sub_8069CFC
	b _08069F52
	.align 2, 0
_08069F0C: .4byte 0x0000020e
_08069F10:
	ldrh r1, [r5, 0xC]
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _08069F20
_08069F1A:
	subs r0, r1, 0x1
	strh r0, [r5, 0xC]
	b _08069F56
_08069F20:
	mov r1, sp
	ldrh r0, [r5, 0x8]
	strh r0, [r1]
	mov r4, sp
	adds r4, 0x2
	ldrh r0, [r5, 0xA]
	strh r0, [r4]
	movs r0, 0x29
	bl PlaySE
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _08069F60
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
_08069F52:
	movs r0, 0x1
	strh r0, [r5, 0x2]
_08069F56:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069F60: .4byte 0x00000206
	thumb_func_end sub_8069DD4

	thumb_func_start sub_8069F64
sub_8069F64: @ 8069F64
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069FE8
	adds r5, r1, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x2
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _08069F9E
	movs r0, 0
	ldrsh r1, [r4, r0]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806A02A
_08069F9E:
	strh r2, [r5, 0x2]
	ldrh r0, [r4]
	strh r0, [r5, 0x4]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsAsh
	lsls r0, 24
	cmp r0, 0
	beq _0806A02A
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	ldr r1, _08069FEC
	cmp r0, r1
	bne _08069FF4
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _08069FF0
	movs r3, 0x4
	bl ash
	b _0806A006
	.align 2, 0
_08069FE8: .4byte gUnknown_03004B28
_08069FEC: .4byte 0x0000020a
_08069FF0: .4byte 0x00000212
_08069FF4:
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _0806A034
	movs r3, 0x4
	bl ash
_0806A006:
	movs r0, 0x87
	lsls r0, 1
	movs r1, 0x1
	bl sub_80A92D4
	lsls r0, 24
	cmp r0, 0
	beq _0806A02A
	ldr r0, _0806A038
	bl GetVarPointer
	adds r2, r0, 0
	ldrh r1, [r2]
	ldr r0, _0806A03C
	cmp r1, r0
	bhi _0806A02A
	adds r0, r1, 0x1
	strh r0, [r2]
_0806A02A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A034: .4byte 0x00000206
_0806A038: .4byte 0x00004048
_0806A03C: .4byte 0x0000270e
	thumb_func_end sub_8069F64

	thumb_func_start sub_806A040
sub_806A040: @ 806A040
	push {r4,r5,lr}
	lsls r0, 16
	asrs r5, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridGetMetatileIdAt
	ldr r1, _0806A074
	ldr r2, _0806A078
	cmp r0, r1
	bne _0806A05C
	subs r2, 0x31
_0806A05C:
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridSetMetatileIdAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A074: .4byte 0x0000022f
_0806A078: .4byte 0x00000237
	thumb_func_end sub_806A040

	thumb_func_start sub_806A07C
sub_806A07C: @ 806A07C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0806A164
	adds r5, r1, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r6, r0, 16
	ldrh r1, [r5, 0x8]
	movs r3, 0x8
	ldrsh r0, [r5, r3]
	adds r7, r4, 0
	cmp r0, 0
	beq _0806A0CE
	subs r0, r1, 0x1
	strh r0, [r5, 0x8]
	lsls r0, 16
	cmp r0, 0
	bne _0806A0CE
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl sub_806A040
_0806A0CE:
	ldrh r1, [r5, 0xE]
	movs r3, 0xE
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _0806A0EE
	subs r0, r1, 0x1
	strh r0, [r5, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _0806A0EE
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	bl sub_806A040
_0806A0EE:
	lsls r0, r6, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	bl sub_8057818
	lsls r0, 24
	cmp r0, 0
	beq _0806A106
	ldr r0, _0806A168
	movs r1, 0
	bl VarSet
_0806A106:
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _0806A122
	movs r0, 0
	ldrsh r1, [r7, r0]
	movs r3, 0x6
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806A182
_0806A122:
	strh r2, [r5, 0x4]
	adds r4, r7, 0
	ldrh r0, [r4]
	strh r0, [r5, 0x6]
	adds r0, r6, 0
	bl sub_805782C
	lsls r0, 24
	cmp r0, 0
	beq _0806A182
	bl sub_80E6034
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _0806A14A
	ldr r0, _0806A168
	movs r1, 0
	bl VarSet
_0806A14A:
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0806A16C
	movs r0, 0x3
	strh r0, [r5, 0x8]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0xA]
	ldrh r0, [r4]
	strh r0, [r5, 0xC]
	b _0806A182
	.align 2, 0
_0806A164: .4byte gUnknown_03004B28
_0806A168: .4byte 0x00004022
_0806A16C:
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _0806A182
	movs r0, 0x3
	strh r0, [r5, 0xE]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x10]
	ldrh r0, [r7]
	strh r0, [r5, 0x12]
_0806A182:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806A07C

	thumb_func_start sub_806A18C
sub_806A18C: @ 806A18C
	push {r4,r5,lr}
	adds r3, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	ldrh r0, [r3]
	subs r0, 0x1
	strh r0, [r3]
	lsls r0, 16
	cmp r0, 0
	bne _0806A1A8
	movs r2, 0xE8
	b _0806A1BC
_0806A1A8:
	ldr r1, _0806A1E4
	movs r2, 0
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _0806A1B4
	adds r0, 0x7
_0806A1B4:
	asrs r0, 3
	lsls r0, 1
	adds r0, r1
	ldrh r2, [r0]
_0806A1BC:
	lsls r5, 16
	asrs r5, 16
	lsls r4, 16
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridSetMetatileIdAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0xE8
	bl MapGridSetMetatileIdAt
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A1E4: .4byte gUnknown_08376418
	thumb_func_end sub_806A18C

	thumb_func_start sub_806A1E8
sub_806A1E8: @ 806A1E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0806A230
	adds r4, r1, r0
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	ldr r0, _0806A234
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	lsls r1, 8
	ldrb r0, [r0, 0x5]
	lsls r0, 24
	asrs r0, 24
	orrs r0, r1
	lsls r0, 16
	lsrs r7, r0, 16
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	mov r8, r5
	cmp r1, 0
	beq _0806A238
	cmp r1, 0x1
	beq _0806A264
	b _0806A2B8
	.align 2, 0
_0806A230: .4byte gUnknown_03004B28
_0806A234: .4byte gSaveBlock1
_0806A238:
	strh r7, [r4]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	movs r0, 0x1
	strh r0, [r4, 0x2]
	strh r1, [r4, 0x8]
	strh r1, [r4, 0xE]
	strh r1, [r4, 0x14]
	strh r1, [r4, 0x1A]
	b _0806A2B8
_0806A252:
	movs r0, 0x20
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r1, 0x2]
	mov r2, r8
	ldrh r0, [r2]
	strh r0, [r1, 0x4]
	b _0806A2B8
_0806A264:
	mov r0, sp
	movs r3, 0x4
	ldrsh r1, [r4, r3]
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bne _0806A280
	movs r0, 0x6
	ldrsh r1, [r4, r0]
	movs r3, 0
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806A2B8
_0806A280:
	strh r2, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsMuddySlope
	lsls r0, 24
	cmp r0, 0
	beq _0806A2B8
	movs r6, 0x4
	adds r1, r4, 0
	adds r1, 0x8
_0806A2A8:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0806A252
	adds r1, 0x6
	adds r6, 0x3
	cmp r6, 0xD
	ble _0806A2A8
_0806A2B8:
	ldr r2, _0806A2D4
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806A2D8
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r7, r0
	beq _0806A2D8
	strh r7, [r4]
	ldrh r0, [r2, 0x4]
	ldrh r1, [r2, 0x8]
	b _0806A2DC
	.align 2, 0
_0806A2D4: .4byte gUnknown_0202E844
_0806A2D8:
	movs r0, 0
	movs r1, 0
_0806A2DC:
	lsls r0, 16
	asrs r0, 16
	mov r8, r0
	lsls r0, r1, 16
	asrs r7, r0, 16
	adds r5, r4, 0
	adds r5, 0x8
	adds r4, r5, 0
	movs r6, 0x9
_0806A2EE:
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0806A312
	ldrh r0, [r4, 0x2]
	mov r3, r8
	subs r0, r3
	strh r0, [r4, 0x2]
	ldrh r0, [r4, 0x4]
	subs r0, r7
	strh r0, [r4, 0x4]
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	adds r0, r5, 0
	bl sub_806A18C
_0806A312:
	adds r4, 0x6
	adds r5, 0x6
	subs r6, 0x3
	cmp r6, 0
	bge _0806A2EE
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806A1E8

	thumb_func_start sub_806A328
sub_806A328: @ 806A328
	push {lr}
	ldr r0, _0806A350
	bl FlagSet
	bl RtcCalcLocalTime
	ldr r2, _0806A354
	adds r2, 0xA0
	ldr r3, _0806A358
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0806A35C
	ldrh r1, [r3]
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0806A350: .4byte 0x00000835
_0806A354: .4byte gSaveBlock2
_0806A358: .4byte gLocalTime
_0806A35C: .4byte 0x00004040
	thumb_func_end sub_806A328

	thumb_func_start InTrainerHill
InTrainerHill: @ 806A360
	push {r4,lr}
	ldr r0, _0806A388
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0806A380
	bl RtcCalcLocalTime
	ldr r4, _0806A38C
	adds r0, r4, 0
	bl sub_806A390
	adds r0, r4, 0
	bl sub_806A3F4
_0806A380:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A388: .4byte 0x00000835
_0806A38C: .4byte gLocalTime
	thumb_func_end InTrainerHill

	thumb_func_start sub_806A390
sub_806A390: @ 806A390
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _0806A3F0
	bl GetVarPointer
	adds r6, r0, 0
	ldrh r0, [r6]
	movs r2, 0
	ldrsh r1, [r5, r2]
	cmp r0, r1
	beq _0806A3EA
	cmp r0, r1
	bgt _0806A3EA
	ldrh r4, [r5]
	subs r4, r0
	lsls r4, 16
	lsrs r4, 16
	bl sub_80690B4
	adds r0, r4, 0
	bl sub_80FA220
	adds r0, r4, 0
	bl sub_80BE8C4
	adds r0, r4, 0
	bl sub_8080834
	adds r0, r4, 0
	bl sub_80401D8
	adds r0, r4, 0
	bl sub_810D2F4
	adds r0, r4, 0
	bl sub_810D410
	adds r0, r4, 0
	bl sub_810F618
	adds r0, r4, 0
	bl sub_8145AA4
	ldrh r0, [r5]
	strh r0, [r6]
_0806A3EA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A3F0: .4byte 0x00004040
	thumb_func_end sub_806A390

	thumb_func_start sub_806A3F4
sub_806A3F4: @ 806A3F4
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	mov r4, sp
	ldr r6, _0806A448
	mov r0, sp
	adds r1, r6, 0
	adds r2, r5, 0
	bl CalcTimeDifference
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 5
	movs r2, 0x2
	ldrsb r2, [r4, r2]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 2
	adds r1, r0
	movs r0, 0x3
	ldrsb r0, [r4, r0]
	adds r0, r1, r0
	cmp r0, 0
	beq _0806A43E
	cmp r0, 0
	blt _0806A43E
	bl BerryTreeTimeUpdate
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	str r0, [r6]
	str r1, [r6, 0x4]
_0806A43E:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A448: .4byte gSaveBlock2 + 0xA0
	thumb_func_end sub_806A3F4

	thumb_func_start sub_806A44C
sub_806A44C: @ 806A44C
	push {lr}
	bl sub_806A328
	ldr r0, _0806A45C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0806A45C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_806A44C

	thumb_func_start sub_806A460
sub_806A460: @ 806A460
	push {lr}
	ldr r0, _0806A474
	bl SetMainCallback2
	ldr r1, _0806A478
	ldr r0, _0806A47C
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0806A474: .4byte Cb2_StartWallClock
_0806A478: .4byte gMain
_0806A47C: .4byte sub_806A44C
	thumb_func_end sub_806A460

	thumb_func_start sub_806A480
sub_806A480: @ 806A480
	push {lr}
	adds r3, r0, 0
	ldr r2, _0806A4B0
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0xC
	ldrsh r1, [r0, r2]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r1, r0
	beq _0806A596
	strh r1, [r3, 0x30]
	subs r0, r1, 0x1
	cmp r0, 0x5
	bhi _0806A596
	lsls r0, 2
	ldr r1, _0806A4B4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A4B0: .4byte gTasks
_0806A4B4: .4byte _0806A4B8
	.align 2, 0
_0806A4B8:
	.4byte _0806A4D0
	.4byte _0806A4F4
	.4byte _0806A518
	.4byte _0806A53C
	.4byte _0806A566
	.4byte _0806A590
_0806A4D0:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x35
	b _0806A55E
_0806A4F4:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x56
	b _0806A55E
_0806A518:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x6B
	b _0806A55E
_0806A53C:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x80
_0806A55E:
	strh r0, [r3, 0x20]
	movs r0, 0x44
	strh r0, [r3, 0x22]
	b _0806A596
_0806A566:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x2
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x42
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x9B
	strh r0, [r3, 0x20]
	movs r0, 0x50
	strh r0, [r3, 0x22]
	b _0806A596
_0806A590:
	adds r0, r3, 0
	bl DestroySprite
_0806A596:
	pop {r0}
	bx r0
	thumb_func_end sub_806A480

	thumb_func_start sub_806A59C
sub_806A59C: @ 806A59C
	push {lr}
	adds r3, r0, 0
	ldr r2, _0806A5CC
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0xC
	ldrsh r1, [r0, r2]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r1, r0
	beq _0806A696
	strh r1, [r3, 0x30]
	subs r0, r1, 0x1
	cmp r0, 0x5
	bhi _0806A696
	lsls r0, 2
	ldr r1, _0806A5D0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A5CC: .4byte gTasks
_0806A5D0: .4byte _0806A5D4
	.align 2, 0
_0806A5D4:
	.4byte _0806A5EC
	.4byte _0806A610
	.4byte _0806A634
	.4byte _0806A658
	.4byte _0806A682
	.4byte _0806A690
_0806A5EC:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x35
	b _0806A67A
_0806A610:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x56
	b _0806A67A
_0806A634:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x6B
	b _0806A67A
_0806A658:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x80
_0806A67A:
	strh r0, [r3, 0x20]
	movs r0, 0x5C
	strh r0, [r3, 0x22]
	b _0806A696
_0806A682:
	adds r0, r3, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0806A696
_0806A690:
	adds r0, r3, 0
	bl DestroySprite
_0806A696:
	pop {r0}
	bx r0
	thumb_func_end sub_806A59C

	thumb_func_start sub_806A69C
sub_806A69C: @ 806A69C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0806A70C
	bl LoadSpritePalette
	ldr r0, _0806A710
	mov r8, r0
	movs r1, 0x35
	movs r2, 0x44
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r6, _0806A714
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r6, 0
	adds r4, 0x1C
	adds r2, r0, r4
	ldr r1, _0806A718
	str r1, [r2]
	adds r0, r6
	strh r5, [r0, 0x2E]
	ldr r1, _0806A71C
	strh r1, [r0, 0x30]
	mov r0, r8
	movs r1, 0x35
	movs r2, 0x44
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r4
	ldr r1, _0806A720
	str r1, [r4]
	adds r0, r6
	strh r5, [r0, 0x2E]
	movs r1, 0x1
	negs r1, r1
	strh r1, [r0, 0x30]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A70C: .4byte gUnknown_083764BC
_0806A710: .4byte gSpriteTemplate_83764E8
_0806A714: .4byte gSprites
_0806A718: .4byte sub_806A480
_0806A71C: .4byte 0x0000ffff
_0806A720: .4byte sub_806A59C
	thumb_func_end sub_806A69C

	thumb_func_start sub_806A724
sub_806A724: @ 806A724
	push {lr}
	ldr r0, _0806A734
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_0806A734: .4byte gUnknown_083764BC
	thumb_func_end sub_806A724

	thumb_func_start sub_806A738
sub_806A738: @ 806A738
	push {lr}
	movs r0, 0x3
	movs r1, 0x8
	movs r2, 0x19
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end sub_806A738

	thumb_func_start sub_806A74C
sub_806A74C: @ 806A74C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	adds r0, r2, 0
	adds r4, r3, 0
	ldr r6, [sp, 0x24]
	ldr r2, [sp, 0x28]
	mov r9, r2
	mov r2, r10
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	ldr r7, _0806A83C
	ldr r1, _0806A840
	bl __umodsi3
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0x18
	bl __umodsi3
	mov r8, r0
	mov r2, r8
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	adds r0, r6, 0
	movs r1, 0x3C
	bl __umodsi3
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	mov r0, r9
	movs r1, 0x3C
	bl __umodsi3
	mov r9, r0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r4, _0806A844
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x18
	movs r3, 0x1
	bl sub_8072C44
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	ldr r1, _0806A848
	bl StringCopy
	adds r7, r0, 0
	adds r0, r4, 0
	mov r1, r8
	movs r2, 0x12
	movs r3, 0x1
	bl sub_8072C44
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	ldr r4, _0806A84C
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r7, r0, 0
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	mov r1, r9
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0806A83C
	mov r1, r10
	ldr r2, [sp]
	bl MenuPrint
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A83C: .4byte gStringVar4
_0806A840: .4byte 0x00002710
_0806A844: .4byte gStringVar1
_0806A848: .4byte gOtherText_Day
_0806A84C: .4byte gUnknown_08376500
	thumb_func_end sub_806A74C

	thumb_func_start sub_806A850
sub_806A850: @ 806A850
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r6, r0, 0
	mov r8, r1
	adds r4, r2, 0
	adds r5, r3, 0
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x3
	movs r1, 0x8
	movs r2, 0x19
	movs r3, 0xB
	bl MenuDrawTextWindow
	ldr r0, _0806A8A8
	movs r1, 0x14
	movs r2, 0x9
	bl MenuPrint
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x4
	movs r1, 0x9
	adds r2, r6, 0
	mov r3, r8
	bl sub_806A74C
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A8A8: .4byte gOtherText_OK
	thumb_func_end sub_806A850

	thumb_func_start sub_806A8AC
sub_806A8AC: @ 806A8AC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r3, 16
	lsrs r3, 16
	adds r1, r3, 0
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _0806A8C6
	ldrh r0, [r4]
	subs r0, 0x1
	b _0806A8E0
_0806A8C6:
	movs r0, 0x40
	ands r0, r3
	cmp r0, 0
	beq _0806A8D4
	ldrh r0, [r4]
	adds r0, 0x1
	b _0806A8FE
_0806A8D4:
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _0806A8EE
	ldrh r0, [r4]
	subs r0, 0xA
_0806A8E0:
	strh r0, [r4]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, r5
	bge _0806A90A
	strh r2, [r4]
	b _0806A90A
_0806A8EE:
	movs r0, 0x10
	ands r1, r0
	cmp r1, 0
	bne _0806A8FA
	movs r0, 0
	b _0806A90C
_0806A8FA:
	ldrh r0, [r4]
	adds r0, 0xA
_0806A8FE:
	strh r0, [r4]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, r2
	ble _0806A90A
	strh r5, [r4]
_0806A90A:
	movs r0, 0x1
_0806A90C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806A8AC

	thumb_func_start sub_806A914
sub_806A914: @ 806A914
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806A928
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x8]
	bx lr
	.align 2, 0
_0806A928: .4byte gTasks
	thumb_func_end sub_806A914

	thumb_func_start sub_806A92C
sub_806A92C: @ 806A92C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_806A738
	bl sub_806A724
	ldr r1, _0806A950
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806A954
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A950: .4byte gTasks
_0806A954: .4byte sub_806A914
	thumb_func_end sub_806A92C

	thumb_func_start sub_806A958
sub_806A958: @ 806A958
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r7, r0, 3
	ldr r0, _0806A99C
	mov r8, r0
	adds r5, r7, r0
	ldrb r4, [r5, 0x4]
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	ldr r1, _0806A9A0
	adds r2, r0, r1
	ldr r1, _0806A9A4
	ldrh r3, [r1, 0x2E]
	movs r0, 0x2
	ands r0, r3
	mov r12, r1
	cmp r0, 0
	beq _0806A9AC
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _0806A9A8
	str r1, [r0]
	movs r0, 0
	strh r0, [r5, 0x2]
	movs r0, 0x6
	b _0806A9CC
	.align 2, 0
_0806A99C: .4byte gUnknown_03004B28
_0806A9A0: .4byte gUnknown_08376414
_0806A9A4: .4byte gMain
_0806A9A8: .4byte sub_806A92C
_0806A9AC:
	movs r0, 0x10
	ands r0, r3
	cmp r0, 0
	beq _0806A9BA
	ldrb r0, [r2, 0x7]
	cmp r0, 0
	bne _0806A9CC
_0806A9BA:
	mov r3, r12
	ldrh r1, [r3, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0806A9D6
	ldrb r0, [r2, 0x6]
	cmp r0, 0
	beq _0806A9D6
_0806A9CC:
	strh r0, [r5, 0x4]
	movs r0, 0x5
	bl PlaySE
	b _0806AA58
_0806A9D6:
	cmp r4, 0x5
	bne _0806AA24
	mov r0, r12
	ldrh r1, [r0, 0x2E]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0806AA58
	ldr r1, _0806AA18
	ldrh r0, [r5, 0x6]
	strh r0, [r1]
	ldrh r0, [r5, 0x8]
	strb r0, [r1, 0x2]
	ldrh r0, [r5, 0xA]
	strb r0, [r1, 0x3]
	ldrh r0, [r5, 0xC]
	strb r0, [r1, 0x4]
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0806AA1C
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806AA20
	str r1, [r0]
	strh r4, [r5, 0x2]
	movs r0, 0x6
	strh r0, [r5, 0x4]
	b _0806AA58
	.align 2, 0
_0806AA18: .4byte gLocalTime
_0806AA1C: .4byte gTasks
_0806AA20: .4byte sub_806A92C
_0806AA24:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r5, r0
	ldrh r1, [r2, 0x2]
	ldrh r2, [r2, 0x4]
	mov r3, r12
	ldrh r4, [r3, 0x30]
	movs r3, 0xC0
	ands r3, r4
	bl sub_806A8AC
	cmp r0, 0
	beq _0806AA58
	movs r0, 0x5
	bl PlaySE
	ldrh r2, [r5, 0x6]
	ldrb r3, [r5, 0x8]
	ldrb r0, [r5, 0xA]
	str r0, [sp]
	ldrb r0, [r5, 0xC]
	str r0, [sp, 0x4]
	movs r0, 0x4
	movs r1, 0x9
	bl sub_806A74C
_0806AA58:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806A958

	thumb_func_start sub_806AA64
sub_806AA64: @ 806AA64
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, r5, 2
	adds r6, r5
	lsls r6, 3
	ldr r0, _0806AACC
	mov r8, r0
	adds r4, r6, r0
	movs r0, 0
	strh r0, [r4]
	ldr r3, _0806AAD0
	ldrh r0, [r3]
	strh r0, [r4, 0x6]
	movs r1, 0x2
	ldrsb r1, [r3, r1]
	strh r1, [r4, 0x8]
	movs r2, 0x3
	ldrsb r2, [r3, r2]
	strh r2, [r4, 0xA]
	ldrb r3, [r3, 0x4]
	lsls r3, 24
	asrs r3, 24
	strh r3, [r4, 0xC]
	ldrh r0, [r4, 0x6]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_806A850
	adds r0, r5, 0
	bl sub_806A69C
	movs r0, 0x2
	strh r0, [r4, 0x4]
	movs r0, 0x8
	negs r0, r0
	add r8, r0
	add r6, r8
	ldr r0, _0806AAD4
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AACC: .4byte gUnknown_03004B28
_0806AAD0: .4byte gLocalTime
_0806AAD4: .4byte sub_806A958
	thumb_func_end sub_806AA64

	thumb_func_start sub_806AAD8
sub_806AAD8: @ 806AAD8
	push {r4-r7,lr}
	sub sp, 0x4
	movs r0, 0x80
	lsls r0, 19
	movs r4, 0
	strh r4, [r0]
	movs r0, 0
	bl SetVBlankCallback
	movs r2, 0xA0
	lsls r2, 19
	mov r0, sp
	strh r4, [r0]
	ldr r1, _0806AB94
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _0806AB98
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	mov r4, sp
	movs r6, 0
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _0806AB9C
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_0806AB16:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _0806AB16
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	bl LoadOam
	bl remove_some_task
	bl dp12_8087EA4
	bl ResetSpriteData
	bl ResetTasks
	bl ResetPaletteFade
	ldr r4, _0806ABA0
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x88
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0806ABA4
	bl SetVBlankCallback
	ldr r0, _0806ABA8
	bl SetMainCallback2
	ldr r0, _0806ABAC
	movs r1, 0x50
	bl CreateTask
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806AB94: .4byte 0x040000d4
_0806AB98: .4byte 0x81000200
_0806AB9C: .4byte 0x81000800
_0806ABA0: .4byte gWindowConfig_81E6CE4
_0806ABA4: .4byte sub_806ABC8
_0806ABA8: .4byte sub_806ABB0
_0806ABAC: .4byte sub_806ACCC
	thumb_func_end sub_806AAD8

	thumb_func_start sub_806ABB0
sub_806ABB0: @ 806ABB0
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_806ABB0

	thumb_func_start sub_806ABC8
sub_806ABC8: @ 806ABC8
	push {lr}
	bl ProcessSpriteCopyRequests
	bl LoadOam
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_806ABC8

	thumb_func_start sub_806ABDC
sub_806ABDC: @ 806ABDC
	push {r4,lr}
	adds r4, r0, 0
	bl MenuDisplayMessageBox
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806ABDC

	thumb_func_start sub_806ABF4
sub_806ABF4: @ 806ABF4
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0806AC14
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0806AC18
	cmp r0, 0x1
	beq _0806AC80
	b _0806ACC4
	.align 2, 0
_0806AC14: .4byte gUnknown_03004B28
_0806AC18:
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0
	movs r2, 0x14
	movs r3, 0xA
	bl MenuDrawTextWindow
	ldr r0, _0806AC98
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
	ldr r0, _0806AC9C
	ldrh r2, [r0]
	ldrb r3, [r0, 0x2]
	ldrb r1, [r0, 0x3]
	str r1, [sp]
	ldrb r0, [r0, 0x4]
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x3
	bl sub_806A74C
	ldr r0, _0806ACA0
	movs r1, 0x1
	movs r2, 0x5
	bl MenuPrint
	ldr r1, _0806ACA4
	adds r0, r1, 0
	adds r0, 0xA0
	ldrh r2, [r0]
	adds r0, 0x2
	ldrb r3, [r0]
	adds r0, 0x1
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r1, 0
	adds r0, 0xA4
	ldrb r0, [r0]
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x7
	bl sub_806A74C
	ldr r0, _0806ACA8
	bl sub_806ABDC
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0806AC80:
	ldr r0, _0806ACAC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0806ACB0
	adds r0, r5, 0
	bl DestroyTask
	bl DoSoftReset
	b _0806ACC4
	.align 2, 0
_0806AC98: .4byte gSystemText_PresentTime
_0806AC9C: .4byte gLocalTime
_0806ACA0: .4byte gSystemText_PreviousTime
_0806ACA4: .4byte gSaveBlock2
_0806ACA8: .4byte gSystemText_ResetRTCPrompt
_0806ACAC: .4byte gMain
_0806ACB0:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806ACC4
	movs r0, 0x5
	bl PlaySE
	adds r0, r5, 0
	bl DestroyTask
_0806ACC4:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806ABF4

	thumb_func_start sub_806ACCC
sub_806ACCC: @ 806ACCC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0806ACF4
	adds r5, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x6
	bls _0806ACE8
	b _0806AEC4
_0806ACE8:
	lsls r0, 2
	ldr r1, _0806ACF8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806ACF4: .4byte gUnknown_03004B28
_0806ACF8: .4byte _0806ACFC
	.align 2, 0
_0806ACFC:
	.4byte _0806AD18
	.4byte _0806AD34
	.4byte _0806AD80
	.4byte _0806ADD8
	.4byte _0806AE5C
	.4byte _0806AE8C
	.4byte _0806AEAE
_0806AD18:
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0806AD30
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0x1
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806AD30: .4byte 0x0000ffff
_0806AD34:
	ldr r0, _0806AD5C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0806AD42
	b _0806AEC4
_0806AD42:
	ldr r0, _0806AD60
	ldrh r0, [r0]
	cmp r0, 0
	beq _0806AD4E
	cmp r0, 0x2
	bne _0806AD68
_0806AD4E:
	ldr r0, _0806AD64
	bl sub_806ABDC
	movs r0, 0x5
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806AD5C: .4byte gPaletteFade
_0806AD60: .4byte gSaveFileStatus
_0806AD64: .4byte gSystemText_NoSaveFileNoTime
_0806AD68:
	bl RtcCalcLocalTime
	ldr r0, _0806AD7C
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x2]
	b _0806ADFC
	.align 2, 0
_0806AD7C: .4byte sub_806ABF4
_0806AD80:
	ldr r2, _0806ADC4
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x4]
	cmp r0, 0x1
	bne _0806AD96
	b _0806AEC4
_0806AD96:
	bl MenuZeroFillScreen
	ldr r0, _0806ADC8
	bl sub_806ABDC
	ldr r2, _0806ADCC
	ldr r0, _0806ADD0
	adds r0, 0xA0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0806ADD4
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x2]
	movs r0, 0x3
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806ADC4: .4byte gTasks
_0806ADC8: .4byte gSystemText_PleaseResetTime
_0806ADCC: .4byte gLocalTime
_0806ADD0: .4byte gSaveBlock2
_0806ADD4: .4byte sub_806AA64
_0806ADD8:
	ldr r2, _0806AE04
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r2
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0806AEC4
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0806AE08
	ldrb r0, [r5, 0x2]
	bl DestroyTask
_0806ADFC:
	movs r0, 0x2
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806AE04: .4byte gTasks
_0806AE08:
	ldrb r0, [r5, 0x2]
	bl DestroyTask
	bl RtcReset
	ldr r4, _0806AE4C
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x2
	ldrsb r1, [r4, r1]
	movs r2, 0x3
	ldrsb r2, [r4, r2]
	movs r3, 0x4
	ldrsb r3, [r4, r3]
	bl RtcCalcLocalTimeOffset
	ldr r2, _0806AE50
	adds r2, 0xA0
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0806AE54
	ldrh r1, [r4]
	bl VarSet
	bl sub_80691A0
	ldr r0, _0806AE58
	bl sub_806ABDC
	movs r0, 0x4
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806AE4C: .4byte gLocalTime
_0806AE50: .4byte gSaveBlock2
_0806AE54: .4byte 0x00004040
_0806AE58: .4byte gSystemText_ClockResetDataSave
_0806AE5C:
	movs r0, 0
	bl sub_8125D44
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806AE7C
	ldr r0, _0806AE78
	bl sub_806ABDC
	movs r0, 0x49
	bl PlaySE
	b _0806AE88
	.align 2, 0
_0806AE78: .4byte gSystemText_SaveCompleted
_0806AE7C:
	ldr r0, _0806AECC
	bl sub_806ABDC
	movs r0, 0x16
	bl PlaySE
_0806AE88:
	movs r0, 0x5
	strh r0, [r5]
_0806AE8C:
	ldr r0, _0806AED0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806AEC4
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0806AED4
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x6
	strh r0, [r5]
_0806AEAE:
	ldr r0, _0806AED8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0806AEC4
	adds r0, r4, 0
	bl DestroyTask
	bl DoSoftReset
_0806AEC4:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AECC: .4byte gSystemText_SaveFailed
_0806AED0: .4byte gMain
_0806AED4: .4byte 0x0000ffff
_0806AED8: .4byte gPaletteFade
	thumb_func_end sub_806ACCC

	.align 2, 0 @ Don't pad with nop.
