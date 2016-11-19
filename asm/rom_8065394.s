	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

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
	ldr r0, _08067FE8 @ =gPlayerAvatar
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
	bl CheckTrainers
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
	ldr r0, _0806823C @ =gUnknown_0815281E
	cmp r4, r0
	beq _0806822C
	ldr r0, _08068240 @ =gUnknown_08152C39
	cmp r4, r0
	beq _0806822C
	ldr r0, _08068244 @ =gUnknown_0815F36C
	cmp r4, r0
	beq _0806822C
	ldr r0, _08068248 @ =gUnknown_0815F43A
	cmp r4, r0
	beq _0806822C
	ldr r0, _0806824C @ =gUnknown_081A0009
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
	ldr r1, _08068314 @ =gUnknown_0821664C
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
	ldr r1, _08068318 @ =gMapObjects
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
	ldr r1, _08068354 @ =gLinkPlayerMapObjects
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
	ldr r0, _08068358 @ =gSelectedMapObject
	strb r3, [r0]
	ldr r1, _0806835C @ =gScriptLastTalked
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x8]
	strh r0, [r1]
	ldr r0, _08068360 @ =gScriptFacing
	strh r6, [r0]
	adds r0, r3, 0
	bl GetFieldObjectScriptPointerByFieldObjectId
_0806834E:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08068354: .4byte gLinkPlayerMapObjects
_08068358: .4byte gSelectedMapObject
_0806835C: .4byte gScriptLastTalked
_08068360: .4byte gScriptFacing
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
	ldr r1, _080683E0 @ =gMapObjects
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
	ldr r1, _080683E4 @ =gUnknown_0821664C
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
	ldr r1, _080683E0 @ =gMapObjects
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
	ldr r0, _08068414 @ =gSelectedMapObject
	strb r3, [r0]
	ldr r4, _08068418 @ =gScriptLastTalked
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	strh r0, [r4]
	ldr r0, _0806841C @ =gScriptFacing
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
_08068418: .4byte gScriptLastTalked
_0806841C: .4byte gScriptFacing
	thumb_func_end sub_8068364

	thumb_func_start TryGetInvisibleMapObjectScript
TryGetInvisibleMapObjectScript: @ 8068420
	push {r4,r5,lr}
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r4, _08068450 @ =gMapHeader
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
	ldr r0, _08068454 @ =gUnknown_081C6C02
	b _080684FA
	.align 2, 0
_08068450: .4byte gMapHeader
_08068454: .4byte gUnknown_081C6C02
_08068458:
	ldrb r0, [r0, 0x5]
	cmp r0, 0x8
	bhi _080684F8
	lsls r0, 2
	ldr r1, _08068468 @ =_0806846C
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
	ldr r1, _080684CC @ =gSpecialVar_0x8004
	lsrs r0, r2, 16
	movs r3, 0x96
	lsls r3, 2
	adds r0, r3
	strh r0, [r1]
	ldr r0, _080684D0 @ =gSpecialVar_0x8005
	strh r2, [r0]
	ldrh r0, [r1]
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068494
	ldr r0, _080684D4 @ =HiddenItemScript
	b _080684FA
	.align 2, 0
_080684CC: .4byte gSpecialVar_0x8004
_080684D0: .4byte gSpecialVar_0x8005
_080684D4: .4byte HiddenItemScript
_080684D8:
	cmp r5, 0x2
	bne _08068494
	ldr r0, _080684F0 @ =gSpecialVar_0x8004
	strh r2, [r0]
	bl sub_80BC050
	lsls r0, 24
	cmp r0, 0
	beq _08068494
	ldr r0, _080684F4 @ =gUnknown_081A2C51
	b _080684FA
	.align 2, 0
_080684F0: .4byte gSpecialVar_0x8004
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
	ldr r0, _08068520 @ =Event_TV
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
	ldr r0, _08068538 @ =gUnknown_081A0009
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
	ldr r0, _08068550 @ =ClosedSootopolisGymDoorScript
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
	ldr r0, _08068568 @ =gUnknown_081A4363
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
	ldr r0, _08068580 @ =gUnknown_081C346A
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
	ldr r0, _08068598 @ =gUnknown_081616E1
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
	ldr r0, _080685B0 @ =Event_WorldMap
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
	ldr r0, _080685C8 @ =Event_RunningShoesManual
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
	ldr r0, _080685E0 @ =PictureBookShelfScript
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
	ldr r0, _080685F8 @ =BookshelfScript
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
	ldr r0, _08068610 @ =PokemonCenterBookshelfScript
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
	ldr r0, _08068628 @ =VaseScript
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
	ldr r0, _08068640 @ =TrashCanScript
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
	ldr r0, _08068658 @ =ShopShelfScript
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
	ldr r0, _08068670 @ =BlueprintScript
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
	ldr r0, _080686A0 @ =gUnknown_0815F36C
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
	ldr r0, _080686B8 @ =gUnknown_0815F43A
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
	ldr r0, _080686D0 @ =gUnknown_0815F523
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
	ldr r0, _080686E8 @ =gUnknown_0815F528
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
	ldr r0, _08068724 @ =0x0000080b
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
	ldr r0, _08068728 @ =UseSurfScript
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
	ldr r0, _08068758 @ =0x0000080e
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
	ldr r0, _0806875C @ =UseWaterfallScript
	b _0806876A
	.align 2, 0
_08068758: .4byte 0x0000080e
_0806875C: .4byte UseWaterfallScript
_08068760:
	ldr r0, _08068764 @ =CannotUseWaterfallScript
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
	ldr r0, _08068794 @ =0x0000080d
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0806879C
	bl sub_8068F18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0806879C
	ldr r0, _08068798 @ =UseDiveScript
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
	ldr r0, _080687D0 @ =0x0000080d
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080687DC
	ldr r0, _080687D4 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _080687DC
	bl sub_8068F18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080687DC
	ldr r0, _080687D8 @ =UnderwaterUseDiveScript
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
	bl UpdateRepelCounter
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
	ldr r4, _08068864 @ =gMapHeader
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
	ldr r0, _08068890 @ =GraniteCave_B1F_EventScript_1C6BC5
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
	ldr r0, _080688B0 @ =gUnknown_081A14B8
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
	ldr r0, _080688C8 @ =Event_EggHatch
	b _080688E8
	.align 2, 0
_080688C8: .4byte Event_EggHatch
_080688CC:
	bl SafariZoneTakeStep
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
	ldr r0, _080688F4 @ =gUnknown_0815FD0D
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
	ldr r0, _08068908 @ =0x0000402a
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
	ldr r0, _08068940 @ =0x0000402a
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
	ldr r5, _08068944 @ =gPlayerParty
	movs r4, 0x5
_0806892A:
	adds r0, r5, 0
	movs r1, 0x5
	bl AdjustFriendship
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
	ldr r0, _08068958 @ =0x0000402b
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
	ldr r0, _08068994 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x9
	beq _0806899C
	ldr r0, _08068998 @ =0x0000402b
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
	ldr r1, _080689AC @ =gUnknown_0202E8C0
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
	ldr r6, _080689CC @ =gUnknown_0202E8C0
	ldrb r0, [r6]
	cmp r0, 0x3
	bhi _080689D4
	adds r0, 0x1
	strb r0, [r6]
	ldr r0, _080689D0 @ =gUnknown_0202E8C2
	strh r4, [r0]
	movs r0, 0
	b _080689F8
	.align 2, 0
_080689CC: .4byte gUnknown_0202E8C0
_080689D0: .4byte gUnknown_0202E8C2
_080689D4:
	ldr r5, _080689EC @ =gUnknown_0202E8C2
	ldrh r1, [r5]
	adds r0, r4, 0
	bl StandardWildEncounter
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
	ldr r0, _08068A54 @ =gMapHeader
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
	ldr r7, _08068ABC @ =gMapHeader
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
	ldr r0, _08068B1C @ =gUnknown_081C6BDE
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
	ldr r0, _08068C50 @ =gMapHeader
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
	ldr r2, _08068CA4 @ =gSaveBlock1
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
	ldr r0, _08068CDC @ =gMapHeader
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
	ldr r6, _08068D28 @ =gMapHeader
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
	ldr r4, _08068E48 @ =gMapHeader
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
	ldr r0, _08068ED0 @ =gMapHeader
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
	ldr r0, _08068F70 @ =gMapHeader
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
	ldr r4, _0806902C @ =gMapHeader
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
	ldr r4, _08069064 @ =gSaveBlock1 + 0x1220
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
	ldr r0, _08069068 @ =gUnknown_0202E8E2
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
	ldr r0, _080690A0 @ =gSaveBlock1 + 0x1220
	movs r1, 0
	str r1, [r0]
	movs r1, 0x90
	lsls r1, 1
	adds r0, r1
	movs r1, 0
	movs r2, 0x20
	bl memset
	ldr r0, _080690A4 @ =0x0000084d
	bl FlagReset
	ldr r0, _080690A8 @ =0x0000084e
	bl FlagReset
	ldr r0, _080690AC @ =0x00000829
	bl FlagReset
	ldr r0, _080690B0 @ =0x00000861
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
	ldr r0, _080690C4 @ =gSaveBlock1 + 0x1338
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
	ldr r0, _080690E4 @ =0x00004046
	bl GetVarPointer
	ldr r2, _080690E8 @ =gSaveBlock2
	movs r1, 0
	strb r1, [r2, 0x1A]
	strh r1, [r0]
	ldr r0, _080690EC @ =0x00000836
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
	ldr r0, _0806911C @ =0x00004046
	bl GetVarPointer
	ldr r4, _08069120 @ =gSaveBlock2
	movs r5, 0
	movs r1, 0xDA
	strb r1, [r4, 0x1A]
	ldr r2, _08069124 @ =0x00000302
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _08069128 @ =0x00000836
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

	thumb_func_start IsNationalPokedex
IsNationalPokedex: @ 806912C
	push {lr}
	ldr r0, _08069154 @ =gSaveBlock2
	ldrb r0, [r0, 0x1A]
	cmp r0, 0xDA
	bne _08069164
	ldr r0, _08069158 @ =0x00004046
	bl VarGet
	lsls r0, 16
	ldr r1, _0806915C @ =0x03020000
	cmp r0, r1
	bne _08069164
	ldr r0, _08069160 @ =0x00000836
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
	thumb_func_end IsNationalPokedex

	thumb_func_start unref_sub_806916C
unref_sub_806916C: @ 806916C
	push {lr}
	ldr r0, _08069178 @ =0x0000084c
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_08069178: .4byte 0x0000084c
	thumb_func_end unref_sub_806916C

	thumb_func_start unref_sub_806917C
unref_sub_806917C: @ 806917C
	push {lr}
	ldr r0, _08069188 @ =0x0000084c
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_08069188: .4byte 0x0000084c
	thumb_func_end unref_sub_806917C

	thumb_func_start IsMysteryGiftAvailable
IsMysteryGiftAvailable: @ 806918C
	push {lr}
	ldr r0, _0806919C @ =0x0000084c
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
	ldr r0, _080691B4 @ =0x0000402c
	movs r1, 0
	bl VarSet
	ldr r0, _080691B8 @ =0x00000862
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
	ldr r0, _080691D4 @ =0x0000402c
	movs r1, 0x92
	lsls r1, 4
	bl VarSet
	ldr r0, _080691D8 @ =0x00000862
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
	ldr r0, _08069200 @ =0x00000862
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08069208
	ldr r0, _08069204 @ =0x0000402c
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

	.align 2, 0 @ Don't pad with nop.
