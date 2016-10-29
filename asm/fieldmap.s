	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start mapconnection_get_mapheader
mapconnection_get_mapheader: @ 8055F90
	push {lr}
	ldrb r2, [r0, 0x8]
	ldrb r1, [r0, 0x9]
	adds r0, r2, 0
	bl get_mapheader_by_bank_and_number
	pop {r1}
	bx r1
	thumb_func_end mapconnection_get_mapheader

	thumb_func_start not_trainer_hill_battle_pyramid
not_trainer_hill_battle_pyramid: @ 8055FA0
	push {r4,lr}
	ldr r4, _08055FBC @ =gMapHeader
	adds r0, r4, 0
	bl mapheader_copy_mapdata_with_padding
	ldr r0, [r4, 0x4]
	bl sub_80BB970
	bl mapheader_run_script_with_tag_x1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055FBC: .4byte gMapHeader
	thumb_func_end not_trainer_hill_battle_pyramid

	thumb_func_start sub_8055FC0
sub_8055FC0: @ 8055FC0
	push {r4,lr}
	ldr r4, _08055FF0 @ =gMapHeader
	adds r0, r4, 0
	bl mapheader_copy_mapdata_with_padding
	movs r0, 0
	bl sub_80BBCCC
	ldr r0, [r4, 0x4]
	bl sub_80BB970
	bl sub_8056670
	bl mapheader_run_script_with_tag_x1
	ldr r1, _08055FF4 @ =gUnknown_03004870
	ldr r0, [r1]
	ldr r1, [r1, 0x4]
	bl UpdateTVScreensOnMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055FF0: .4byte gMapHeader
_08055FF4: .4byte gUnknown_03004870
	thumb_func_end sub_8055FC0

	thumb_func_start mapheader_copy_mapdata_with_padding
mapheader_copy_mapdata_with_padding: @ 8055FF8
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r5, [r6]
	ldr r0, _08056044 @ =0x03ff03ff
	str r0, [sp]
	ldr r4, _08056048 @ =gUnknown_02029828
	ldr r2, _0805604C @ =0x01001400
	mov r0, sp
	adds r1, r4, 0
	bl CpuFastSet
	ldr r2, _08056050 @ =gUnknown_03004870
	str r4, [r2, 0x8]
	ldr r1, [r5]
	adds r1, 0xF
	str r1, [r2]
	ldr r0, [r5, 0x4]
	adds r0, 0xE
	str r0, [r2, 0x4]
	muls r1, r0
	movs r0, 0xA0
	lsls r0, 6
	cmp r1, r0
	bgt _0805603A
	ldr r0, [r5, 0xC]
	ldrh r1, [r5]
	ldrh r2, [r5, 0x4]
	bl map_copy_with_padding
	adds r0, r6, 0
	bl sub_80560AC
_0805603A:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08056044: .4byte 0x03ff03ff
_08056048: .4byte gUnknown_02029828
_0805604C: .4byte 0x01001400
_08056050: .4byte gUnknown_03004870
	thumb_func_end mapheader_copy_mapdata_with_padding

	thumb_func_start map_copy_with_padding
map_copy_with_padding: @ 8056054
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _080560A8 @ =gUnknown_03004870
	ldr r4, [r0, 0x8]
	ldr r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, 0xE
	adds r4, r0
	cmp r2, 0
	beq _0805609C
	mov r0, r8
	lsls r6, r0, 1
	adds r5, r2, 0
	movs r0, 0x1E
	adds r0, r6
	mov r9, r0
_08056088:
	adds r0, r7, 0
	adds r1, r4, 0
	mov r2, r8
	bl CpuSet
	add r4, r9
	adds r7, r6
	subs r5, 0x1
	cmp r5, 0
	bne _08056088
_0805609C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080560A8: .4byte gUnknown_03004870
	thumb_func_end map_copy_with_padding

	thumb_func_start sub_80560AC
sub_80560AC: @ 80560AC
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r0, [r6, 0xC]
	ldr r1, [r0]
	ldr r5, [r0, 0x4]
	ldr r2, _080560E0 @ =gUnknown_0202E850
	ldr r0, _080560E4 @ =gUnknown_08308E28
	ldr r0, [r0]
	str r0, [r2]
	cmp r1, 0
	ble _0805612C
	adds r4, r2, 0
	adds r7, r1, 0
_080560C6:
	adds r0, r5, 0
	bl mapconnection_get_mapheader
	adds r1, r0, 0
	ldr r2, [r5, 0x4]
	ldrb r0, [r5]
	cmp r0, 0x2
	beq _080560FE
	cmp r0, 0x2
	bgt _080560E8
	cmp r0, 0x1
	beq _080560F2
	b _08056124
	.align 2, 0
_080560E0: .4byte gUnknown_0202E850
_080560E4: .4byte gUnknown_08308E28
_080560E8:
	cmp r0, 0x3
	beq _0805610A
	cmp r0, 0x4
	beq _08056116
	b _08056124
_080560F2:
	adds r0, r6, 0
	bl sub_8056198
	ldrb r0, [r4]
	movs r1, 0x1
	b _08056120
_080560FE:
	adds r0, r6, 0
	bl sub_8056200
	ldrb r0, [r4]
	movs r1, 0x2
	b _08056120
_0805610A:
	adds r0, r6, 0
	bl sub_8056260
	ldrb r0, [r4]
	movs r1, 0x4
	b _08056120
_08056116:
	adds r0, r6, 0
	bl sub_80562C0
	ldrb r0, [r4]
	movs r1, 0x8
_08056120:
	orrs r0, r1
	strb r0, [r4]
_08056124:
	subs r7, 0x1
	adds r5, 0xC
	cmp r7, 0
	bne _080560C6
_0805612C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80560AC

	thumb_func_start sub_8056134
sub_8056134: @ 8056134
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r5, [sp, 0x18]
	ldr r4, [r2]
	ldr r7, [r4]
	adds r2, r7, 0
	muls r2, r5
	adds r2, r3
	lsls r2, 1
	ldr r3, [r4, 0xC]
	adds r6, r3, r2
	ldr r3, _08056190 @ =gUnknown_03004870
	ldr r2, [r3]
	muls r1, r2
	adds r1, r0
	lsls r1, 1
	ldr r0, [r3, 0x8]
	adds r5, r0, r1
	ldr r0, [sp, 0x20]
	cmp r0, 0
	ble _08056186
	adds r4, r0, 0
	ldr r3, _08056194 @ =0x001fffff
	mov r8, r3
_08056166:
	adds r0, r6, 0
	adds r1, r5, 0
	ldr r2, [sp, 0x1C]
	mov r3, r8
	ands r2, r3
	bl CpuSet
	ldr r0, _08056190 @ =gUnknown_03004870
	ldr r0, [r0]
	lsls r0, 1
	adds r5, r0
	lsls r0, r7, 1
	adds r6, r0
	subs r4, 0x1
	cmp r4, 0
	bne _08056166
_08056186:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056190: .4byte gUnknown_03004870
_08056194: .4byte 0x001fffff
	thumb_func_end sub_8056134

	thumb_func_start sub_8056198
sub_8056198: @ 8056198
	push {r4-r7,lr}
	sub sp, 0xC
	adds r3, r0, 0
	adds r5, r1, 0
	cmp r5, 0
	beq _080561F2
	ldr r0, [r5]
	ldr r4, [r0]
	adds r2, 0x7
	ldr r0, [r3]
	ldr r0, [r0, 0x4]
	adds r7, r0, 0x7
	cmp r2, 0
	bge _080561CC
	negs r6, r2
	adds r2, r4
	ldr r0, _080561C8 @ =gUnknown_03004870
	ldr r3, [r0]
	cmp r2, r3
	bge _080561C2
	adds r3, r2, 0
_080561C2:
	movs r2, 0
	b _080561DC
	.align 2, 0
_080561C8: .4byte gUnknown_03004870
_080561CC:
	movs r6, 0
	adds r0, r2, r4
	ldr r1, _080561FC @ =gUnknown_03004870
	ldr r1, [r1]
	subs r3, r1, r2
	cmp r0, r1
	bge _080561DC
	adds r3, r4, 0
_080561DC:
	movs r0, 0
	str r0, [sp]
	str r3, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	adds r0, r2, 0
	adds r1, r7, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_8056134
_080561F2:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080561FC: .4byte gUnknown_03004870
	thumb_func_end sub_8056198

	thumb_func_start sub_8056200
sub_8056200: @ 8056200
	push {r4-r7,lr}
	sub sp, 0xC
	adds r5, r1, 0
	cmp r5, 0
	beq _08056254
	ldr r0, [r5]
	ldr r4, [r0]
	ldr r0, [r0, 0x4]
	adds r2, 0x7
	subs r7, r0, 0x7
	cmp r2, 0
	bge _08056230
	negs r6, r2
	adds r2, r4
	ldr r0, _0805622C @ =gUnknown_03004870
	ldr r3, [r0]
	cmp r2, r3
	bge _08056226
	adds r3, r2, 0
_08056226:
	movs r2, 0
	b _08056240
	.align 2, 0
_0805622C: .4byte gUnknown_03004870
_08056230:
	movs r6, 0
	adds r0, r2, r4
	ldr r1, _0805625C @ =gUnknown_03004870
	ldr r1, [r1]
	subs r3, r1, r2
	cmp r0, r1
	bge _08056240
	adds r3, r4, 0
_08056240:
	str r7, [sp]
	str r3, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	adds r0, r2, 0
	movs r1, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_8056134
_08056254:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805625C: .4byte gUnknown_03004870
	thumb_func_end sub_8056200

	thumb_func_start sub_8056260
sub_8056260: @ 8056260
	push {r4-r7,lr}
	sub sp, 0xC
	adds r5, r1, 0
	cmp r5, 0
	beq _080562B4
	ldr r0, [r5]
	ldr r1, [r0]
	ldr r4, [r0, 0x4]
	adds r2, 0x7
	subs r7, r1, 0x7
	cmp r2, 0
	bge _08056290
	negs r6, r2
	adds r1, r2, r4
	ldr r0, _0805628C @ =gUnknown_03004870
	ldr r3, [r0, 0x4]
	cmp r1, r3
	bge _08056286
	adds r3, r1, 0
_08056286:
	movs r2, 0
	b _080562A0
	.align 2, 0
_0805628C: .4byte gUnknown_03004870
_08056290:
	movs r6, 0
	adds r0, r2, r4
	ldr r1, _080562BC @ =gUnknown_03004870
	ldr r1, [r1, 0x4]
	subs r3, r1, r2
	cmp r0, r1
	bge _080562A0
	adds r3, r4, 0
_080562A0:
	str r6, [sp]
	movs r0, 0x7
	str r0, [sp, 0x4]
	str r3, [sp, 0x8]
	movs r0, 0
	adds r1, r2, 0
	adds r2, r5, 0
	adds r3, r7, 0
	bl sub_8056134
_080562B4:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080562BC: .4byte gUnknown_03004870
	thumb_func_end sub_8056260

	thumb_func_start sub_80562C0
sub_80562C0: @ 80562C0
	push {r4-r7,lr}
	sub sp, 0xC
	adds r3, r0, 0
	adds r5, r1, 0
	cmp r5, 0
	beq _08056318
	ldr r0, [r5]
	ldr r4, [r0, 0x4]
	ldr r0, [r3]
	ldr r0, [r0]
	adds r7, r0, 0x7
	adds r2, 0x7
	cmp r2, 0
	bge _080562F4
	negs r6, r2
	adds r1, r2, r4
	ldr r0, _080562F0 @ =gUnknown_03004870
	ldr r3, [r0, 0x4]
	cmp r1, r3
	bge _080562EA
	adds r3, r1, 0
_080562EA:
	movs r2, 0
	b _08056304
	.align 2, 0
_080562F0: .4byte gUnknown_03004870
_080562F4:
	movs r6, 0
	adds r0, r2, r4
	ldr r1, _08056320 @ =gUnknown_03004870
	ldr r1, [r1, 0x4]
	subs r3, r1, r2
	cmp r0, r1
	bge _08056304
	adds r3, r4, 0
_08056304:
	str r6, [sp]
	movs r0, 0x8
	str r0, [sp, 0x4]
	str r3, [sp, 0x8]
	adds r0, r7, 0
	adds r1, r2, 0
	adds r2, r5, 0
	movs r3, 0
	bl sub_8056134
_08056318:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056320: .4byte gUnknown_03004870
	thumb_func_end sub_80562C0

	thumb_func_start MapGridGetZCoordAt
MapGridGetZCoordAt: @ 8056324
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	cmp r2, 0
	blt _08056354
	ldr r1, _08056350 @ =gUnknown_03004870
	ldr r3, [r1]
	cmp r2, r3
	bge _08056354
	cmp r4, 0
	blt _08056354
	ldr r0, [r1, 0x4]
	cmp r4, r0
	bge _08056354
	adds r0, r3, 0
	muls r0, r4
	adds r0, r2, r0
	ldr r1, [r1, 0x8]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _08056376
	.align 2, 0
_08056350: .4byte gUnknown_03004870
_08056354:
	ldr r0, _08056380 @ =gMapHeader
	ldr r3, [r0]
	adds r1, r2, 0x1
	movs r2, 0x1
	ands r1, r2
	adds r0, r4, 0x1
	ands r0, r2
	lsls r0, 1
	adds r1, r0
	ldr r0, [r3, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r1, [r1]
	movs r2, 0xC0
	lsls r2, 4
	adds r0, r2, 0
	orrs r1, r0
_08056376:
	ldr r0, _08056384 @ =0x000003ff
	cmp r1, r0
	beq _08056388
	lsrs r0, r1, 12
	b _0805638A
	.align 2, 0
_08056380: .4byte gMapHeader
_08056384: .4byte 0x000003ff
_08056388:
	movs r0, 0
_0805638A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MapGridGetZCoordAt

	thumb_func_start MapGridIsImpassableAt
MapGridIsImpassableAt: @ 8056390
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	cmp r2, 0
	blt _080563C0
	ldr r1, _080563BC @ =gUnknown_03004870
	ldr r3, [r1]
	cmp r2, r3
	bge _080563C0
	cmp r4, 0
	blt _080563C0
	ldr r0, [r1, 0x4]
	cmp r4, r0
	bge _080563C0
	adds r0, r3, 0
	muls r0, r4
	adds r0, r2, r0
	ldr r1, [r1, 0x8]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _080563E2
	.align 2, 0
_080563BC: .4byte gUnknown_03004870
_080563C0:
	ldr r0, _080563F4 @ =gMapHeader
	ldr r3, [r0]
	adds r1, r2, 0x1
	movs r2, 0x1
	ands r1, r2
	adds r0, r4, 0x1
	ands r0, r2
	lsls r0, 1
	adds r1, r0
	ldr r0, [r3, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r1, [r1]
	movs r2, 0xC0
	lsls r2, 4
	adds r0, r2, 0
	orrs r1, r0
_080563E2:
	ldr r0, _080563F8 @ =0x000003ff
	cmp r1, r0
	beq _080563FC
	movs r0, 0xC0
	lsls r0, 4
	ands r1, r0
	lsrs r0, r1, 10
	b _080563FE
	.align 2, 0
_080563F4: .4byte gMapHeader
_080563F8: .4byte 0x000003ff
_080563FC:
	movs r0, 0x1
_080563FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MapGridIsImpassableAt

	thumb_func_start MapGridGetMetatileIdAt
MapGridGetMetatileIdAt: @ 8056404
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	cmp r5, 0
	blt _08056434
	ldr r1, _08056430 @ =gUnknown_03004870
	ldr r2, [r1]
	cmp r5, r2
	bge _08056434
	cmp r6, 0
	blt _08056434
	ldr r0, [r1, 0x4]
	cmp r6, r0
	bge _08056434
	adds r0, r2, 0
	muls r0, r6
	adds r0, r5, r0
	ldr r1, [r1, 0x8]
	lsls r0, 1
	adds r0, r1
	ldrh r4, [r0]
	b _08056458
	.align 2, 0
_08056430: .4byte gUnknown_03004870
_08056434:
	ldr r0, _08056464 @ =gMapHeader
	ldr r3, [r0]
	adds r1, r5, 0x1
	movs r2, 0x1
	ands r1, r2
	adds r0, r6, 0x1
	ands r0, r2
	lsls r0, 1
	adds r1, r0
	ldr r0, [r3, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r1, [r1]
	movs r2, 0xC0
	lsls r2, 4
	adds r0, r2, 0
	adds r4, r0, 0
	orrs r4, r1
_08056458:
	ldr r0, _08056468 @ =0x000003ff
	cmp r4, r0
	beq _0805646C
	ands r4, r0
	adds r0, r4, 0
	b _08056490
	.align 2, 0
_08056464: .4byte gMapHeader
_08056468: .4byte 0x000003ff
_0805646C:
	ldr r0, _08056498 @ =gMapHeader
	ldr r3, [r0]
	adds r1, r5, 0x1
	movs r2, 0x1
	ands r1, r2
	adds r0, r6, 0x1
	ands r0, r2
	lsls r0, 1
	adds r1, r0
	ldr r0, [r3, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	movs r2, 0xC0
	lsls r2, 4
	adds r1, r2, 0
	orrs r0, r1
	ands r0, r4
_08056490:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08056498: .4byte gMapHeader
	thumb_func_end MapGridGetMetatileIdAt

	thumb_func_start MapGridGetMetatileBehaviorAt
MapGridGetMetatileBehaviorAt: @ 805649C
	push {lr}
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	lsrs r0, 16
	bl GetBehaviorByMetatileId
	adds r1, r0, 0
	movs r0, 0xFF
	ands r0, r1
	pop {r1}
	bx r1
	thumb_func_end MapGridGetMetatileBehaviorAt

	thumb_func_start MapGridGetMetatileLayerTypeAt
MapGridGetMetatileLayerTypeAt: @ 80564B4
	push {lr}
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	lsrs r0, 16
	bl GetBehaviorByMetatileId
	adds r1, r0, 0
	movs r0, 0xF0
	lsls r0, 8
	ands r0, r1
	lsrs r0, 12
	pop {r1}
	bx r1
	thumb_func_end MapGridGetMetatileLayerTypeAt

	thumb_func_start MapGridSetMetatileIdAt
MapGridSetMetatileIdAt: @ 80564D0
	push {r4,r5,lr}
	adds r3, r0, 0
	lsls r2, 16
	lsrs r5, r2, 16
	cmp r3, 0
	blt _08056508
	ldr r2, _08056510 @ =gUnknown_03004870
	ldr r4, [r2]
	cmp r3, r4
	bge _08056508
	cmp r1, 0
	blt _08056508
	ldr r0, [r2, 0x4]
	cmp r1, r0
	bge _08056508
	muls r1, r4
	adds r1, r3, r1
	ldr r0, [r2, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	movs r2, 0xF0
	lsls r2, 8
	ands r2, r0
	ldr r0, _08056514 @ =0x00000fff
	ands r0, r5
	orrs r2, r0
	strh r2, [r1]
_08056508:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056510: .4byte gUnknown_03004870
_08056514: .4byte 0x00000fff
	thumb_func_end MapGridSetMetatileIdAt

	thumb_func_start MapGridSetMetatileEntryAt
MapGridSetMetatileEntryAt: @ 8056518
	push {r4,r5,lr}
	adds r3, r0, 0
	lsls r2, 16
	lsrs r5, r2, 16
	cmp r3, 0
	blt _08056544
	ldr r2, _0805654C @ =gUnknown_03004870
	ldr r4, [r2]
	cmp r3, r4
	bge _08056544
	cmp r1, 0
	blt _08056544
	ldr r0, [r2, 0x4]
	cmp r1, r0
	bge _08056544
	adds r0, r4, 0
	muls r0, r1
	adds r0, r3, r0
	ldr r1, [r2, 0x8]
	lsls r0, 1
	adds r0, r1
	strh r5, [r0]
_08056544:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805654C: .4byte gUnknown_03004870
	thumb_func_end MapGridSetMetatileEntryAt

	thumb_func_start GetBehaviorByMetatileId
GetBehaviorByMetatileId: @ 8056550
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	adds r3, r2, 0
	ldr r0, _0805656C @ =0x000001ff
	cmp r2, r0
	bhi _08056574
	ldr r0, _08056570 @ =gMapHeader
	ldr r0, [r0]
	ldr r0, [r0, 0x10]
	ldr r1, [r0, 0x10]
	lsls r0, r2, 1
	b _08056592
	.align 2, 0
_0805656C: .4byte 0x000001ff
_08056570: .4byte gMapHeader
_08056574:
	ldr r0, _08056580 @ =0x000003ff
	cmp r2, r0
	bls _08056584
	movs r0, 0xFF
	b _08056596
	.align 2, 0
_08056580: .4byte 0x000003ff
_08056584:
	ldr r0, _0805659C @ =gMapHeader
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldr r1, [r0, 0x10]
	lsls r0, r3, 1
	adds r0, r1
	ldr r1, _080565A0 @ =0xfffffc00
_08056592:
	adds r0, r1
	ldrh r0, [r0]
_08056596:
	pop {r1}
	bx r1
	.align 2, 0
_0805659C: .4byte gMapHeader
_080565A0: .4byte 0xfffffc00
	thumb_func_end GetBehaviorByMetatileId

	thumb_func_start save_serialize_map
save_serialize_map: @ 80565A4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r5, _0805660C @ =gSaveBlock1 + 0x34
	ldr r0, _08056610 @ =gUnknown_03004870
	ldr r0, [r0]
	mov r8, r0
	adds r0, r5, 0
	subs r0, 0x34
	movs r1, 0
	ldrsh r6, [r0, r1]
	movs r2, 0x2
	ldrsh r0, [r0, r2]
	adds r1, r0, 0
	adds r1, 0xE
	cmp r0, r1
	bge _080565FE
	mov r12, r1
	ldr r1, _08056614 @ =gUnknown_02029828
	mov r9, r1
	lsls r7, r6, 1
_080565D0:
	adds r1, r6, 0
	adds r3, r1, 0
	adds r3, 0xF
	adds r4, r0, 0x1
	cmp r1, r3
	bge _080565F8
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	lsls r0, 1
	add r0, r9
	adds r2, r7, r0
	subs r1, r3, r1
_080565EA:
	ldrh r0, [r2]
	strh r0, [r5]
	adds r5, 0x2
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bne _080565EA
_080565F8:
	adds r0, r4, 0
	cmp r0, r12
	blt _080565D0
_080565FE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805660C: .4byte gSaveBlock1 + 0x34
_08056610: .4byte gUnknown_03004870
_08056614: .4byte gUnknown_02029828
	thumb_func_end save_serialize_map

	thumb_func_start sub_8056618
sub_8056618: @ 8056618
	push {r4,lr}
	movs r2, 0
	movs r1, 0
	ldr r4, _0805663C @ =gSaveBlock1 + 0x34
	ldr r3, _08056640 @ =0x000001ff
_08056622:
	lsls r0, r1, 1
	adds r0, r4
	ldrh r0, [r0]
	orrs r2, r0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r3
	bls _08056622
	cmp r2, 0
	beq _08056644
	movs r0, 0
	b _08056646
	.align 2, 0
_0805663C: .4byte gSaveBlock1 + 0x34
_08056640: .4byte 0x000001ff
_08056644:
	movs r0, 0x1
_08056646:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8056618

	thumb_func_start sav2_mapdata_clear
sav2_mapdata_clear: @ 805664C
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08056668 @ =gSaveBlock1 + 0x34
	ldr r2, _0805666C @ =0x01000100
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08056668: .4byte gSaveBlock1 + 0x34
_0805666C: .4byte 0x01000100
	thumb_func_end sav2_mapdata_clear

	thumb_func_start sub_8056670
sub_8056670: @ 8056670
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r5, _080566E4 @ =gSaveBlock1 + 0x34
	bl sub_8056618
	cmp r0, 0
	bne _080566D6
	ldr r0, _080566E8 @ =gUnknown_03004870
	ldr r0, [r0]
	mov r8, r0
	adds r0, r5, 0
	subs r0, 0x34
	movs r1, 0
	ldrsh r6, [r0, r1]
	movs r2, 0x2
	ldrsh r0, [r0, r2]
	adds r1, r0, 0
	adds r1, 0xE
	cmp r0, r1
	bge _080566D2
	mov r12, r1
	ldr r1, _080566EC @ =gUnknown_02029828
	mov r9, r1
	lsls r7, r6, 1
_080566A4:
	adds r1, r6, 0
	adds r3, r1, 0
	adds r3, 0xF
	adds r4, r0, 0x1
	cmp r1, r3
	bge _080566CC
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	lsls r0, 1
	add r0, r9
	adds r2, r7, r0
	subs r1, r3, r1
_080566BE:
	ldrh r0, [r5]
	strh r0, [r2]
	adds r5, 0x2
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bne _080566BE
_080566CC:
	adds r0, r4, 0
	cmp r0, r12
	blt _080566A4
_080566D2:
	bl sav2_mapdata_clear
_080566D6:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080566E4: .4byte gSaveBlock1 + 0x34
_080566E8: .4byte gUnknown_03004870
_080566EC: .4byte gUnknown_02029828
	thumb_func_end sub_8056670

	thumb_func_start sub_80566F0
sub_80566F0: @ 80566F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	ldr r0, _08056734 @ =gSaveBlock1 + 0x34
	mov r10, r0
	ldr r0, _08056738 @ =gUnknown_03004870
	ldr r0, [r0]
	str r0, [sp]
	movs r3, 0
	mov r9, r3
	mov r8, r3
	mov r0, r10
	subs r0, 0x34
	movs r6, 0
	ldrsh r4, [r0, r6]
	str r4, [sp, 0x4]
	movs r3, 0x2
	ldrsh r5, [r0, r3]
	movs r7, 0xF
	movs r4, 0xE
	mov r12, r4
	cmp r1, 0x2
	beq _08056746
	cmp r1, 0x2
	bgt _0805673C
	cmp r1, 0x1
	beq _0805674E
	b _08056766
	.align 2, 0
_08056734: .4byte gSaveBlock1 + 0x34
_08056738: .4byte gUnknown_03004870
_0805673C:
	cmp r2, 0x3
	beq _08056758
	cmp r2, 0x4
	beq _08056760
	b _08056766
_08056746:
	adds r5, 0x1
	movs r6, 0xD
	mov r12, r6
	b _08056766
_0805674E:
	movs r0, 0x1
	mov r8, r0
	movs r1, 0xD
	mov r12, r1
	b _08056766
_08056758:
	ldr r3, [sp, 0x4]
	adds r3, 0x1
	str r3, [sp, 0x4]
	b _08056764
_08056760:
	movs r4, 0x1
	mov r9, r4
_08056764:
	movs r7, 0xE
_08056766:
	movs r1, 0
	cmp r1, r12
	bge _080567A8
_0805676C:
	adds r4, r1, 0x1
	cmp r7, 0
	beq _080567A2
	adds r0, r1, r5
	ldr r6, [sp]
	adds r2, r6, 0
	muls r2, r0
	add r1, r8
	lsls r0, r1, 4
	subs r0, r1
	add r0, r9
	ldr r1, [sp, 0x4]
	adds r2, r1, r2
	adds r3, r7, 0
	lsls r2, 1
	ldr r6, _080567BC @ =gUnknown_02029828
	adds r2, r6
	lsls r0, 1
	mov r6, r10
	adds r1, r0, r6
_08056794:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _08056794
_080567A2:
	adds r1, r4, 0
	cmp r1, r12
	blt _0805676C
_080567A8:
	bl sav2_mapdata_clear
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080567BC: .4byte gUnknown_02029828
	thumb_func_end sub_80566F0

	thumb_func_start GetMapBorderIdAt
GetMapBorderIdAt: @ 80567C0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	cmp r4, 0
	blt _080567FC
	ldr r1, _080567F4 @ =gUnknown_03004870
	ldr r2, [r1]
	cmp r4, r2
	bge _080567FC
	cmp r5, 0
	blt _080567FC
	ldr r0, [r1, 0x4]
	cmp r5, r0
	bge _080567FC
	adds r0, r2, 0
	muls r0, r5
	adds r0, r4, r0
	ldr r1, [r1, 0x8]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _080567F8 @ =0x000003ff
	cmp r1, r0
	beq _08056894
	b _08056824
	.align 2, 0
_080567F4: .4byte gUnknown_03004870
_080567F8: .4byte 0x000003ff
_080567FC:
	ldr r0, _08056840 @ =gMapHeader
	ldr r3, [r0]
	adds r1, r4, 0x1
	movs r2, 0x1
	ands r1, r2
	adds r0, r5, 0x1
	ands r0, r2
	lsls r0, 1
	adds r1, r0
	ldr r0, [r3, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r1, [r1]
	movs r2, 0xC0
	lsls r2, 4
	adds r0, r2, 0
	orrs r0, r1
	ldr r1, _08056844 @ =0x000003ff
	cmp r0, r1
	beq _08056894
_08056824:
	ldr r1, _08056848 @ =gUnknown_03004870
	ldr r0, [r1]
	subs r0, 0x8
	cmp r4, r0
	blt _08056850
	ldr r0, _0805684C @ =gUnknown_0202E850
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08056894
	movs r0, 0x4
	b _080568A6
	.align 2, 0
_08056840: .4byte gMapHeader
_08056844: .4byte 0x000003ff
_08056848: .4byte gUnknown_03004870
_0805684C: .4byte gUnknown_0202E850
_08056850:
	cmp r4, 0x6
	bgt _08056868
	ldr r0, _08056864 @ =gUnknown_0202E850
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08056894
	movs r0, 0x3
	b _080568A6
	.align 2, 0
_08056864: .4byte gUnknown_0202E850
_08056868:
	ldr r0, [r1, 0x4]
	subs r0, 0x7
	cmp r5, r0
	blt _08056884
	ldr r0, _08056880 @ =gUnknown_0202E850
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08056894
	movs r0, 0x1
	b _080568A6
	.align 2, 0
_08056880: .4byte gUnknown_0202E850
_08056884:
	cmp r5, 0x6
	bgt _080568A4
	ldr r0, _0805689C @ =gUnknown_0202E850
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080568A0
_08056894:
	movs r0, 0x1
	negs r0, r0
	b _080568A6
	.align 2, 0
_0805689C: .4byte gUnknown_0202E850
_080568A0:
	movs r0, 0x2
	b _080568A6
_080568A4:
	movs r0, 0
_080568A6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetMapBorderIdAt

	thumb_func_start GetPostCameraMoveMapBorderId
GetPostCameraMoveMapBorderId: @ 80568AC
	push {r4,lr}
	adds r3, r1, 0
	ldr r1, _080568D0 @ =gSaveBlock1
	movs r4, 0
	ldrsh r2, [r1, r4]
	adds r0, 0x7
	adds r2, r0
	movs r0, 0x2
	ldrsh r1, [r1, r0]
	adds r3, 0x7
	adds r1, r3
	adds r0, r2, 0
	bl GetMapBorderIdAt
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080568D0: .4byte gSaveBlock1
	thumb_func_end GetPostCameraMoveMapBorderId

	thumb_func_start CanCameraMoveInDirection
CanCameraMoveInDirection: @ 80568D4
	push {r4,r5,lr}
	ldr r4, _08056908 @ =gSaveBlock1
	movs r1, 0
	ldrsh r3, [r4, r1]
	ldr r2, _0805690C @ =gUnknown_0821664C
	lsls r0, 3
	adds r1, r0, r2
	ldr r1, [r1]
	adds r1, 0x7
	adds r3, r1
	movs r5, 0x2
	ldrsh r1, [r4, r5]
	adds r2, 0x4
	adds r0, r2
	ldr r0, [r0]
	adds r0, 0x7
	adds r1, r0
	adds r0, r3, 0
	bl GetMapBorderIdAt
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _08056910
	movs r0, 0x1
	b _08056912
	.align 2, 0
_08056908: .4byte gSaveBlock1
_0805690C: .4byte gUnknown_0821664C
_08056910:
	movs r0, 0
_08056912:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end CanCameraMoveInDirection

	thumb_func_start sub_8056918
sub_8056918: @ 8056918
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	adds r7, r3, 0
	bl mapconnection_get_mapheader
	adds r3, r0, 0
	cmp r4, 0x2
	beq _08056978
	cmp r4, 0x2
	bgt _08056936
	cmp r4, 0x1
	beq _08056964
	b _08056988
_08056936:
	cmp r4, 0x3
	beq _08056950
	cmp r4, 0x4
	bne _08056988
	ldr r1, _0805694C @ =gSaveBlock1
	negs r0, r6
	strh r0, [r1]
	ldr r2, [r5, 0x4]
	ldrh r0, [r1, 0x2]
	subs r0, r2
	b _08056986
	.align 2, 0
_0805694C: .4byte gSaveBlock1
_08056950:
	ldr r1, _08056960 @ =gSaveBlock1
	ldr r0, [r3]
	ldr r0, [r0]
	strh r0, [r1]
	ldr r2, [r5, 0x4]
	ldrh r0, [r1, 0x2]
	subs r0, r2
	b _08056986
	.align 2, 0
_08056960: .4byte gSaveBlock1
_08056964:
	ldr r1, _08056974 @ =gSaveBlock1
	ldr r2, [r5, 0x4]
	ldrh r0, [r1]
	subs r0, r2
	strh r0, [r1]
	negs r0, r7
	b _08056986
	.align 2, 0
_08056974: .4byte gSaveBlock1
_08056978:
	ldr r1, _08056990 @ =gSaveBlock1
	ldr r2, [r5, 0x4]
	ldrh r0, [r1]
	subs r0, r2
	strh r0, [r1]
	ldr r0, [r3]
	ldr r0, [r0, 0x4]
_08056986:
	strh r0, [r1, 0x2]
_08056988:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056990: .4byte gSaveBlock1
	thumb_func_end sub_8056918

	thumb_func_start CameraMove
CameraMove: @ 8056994
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	str r1, [sp]
	ldr r1, _080569D4 @ =gUnknown_0202E844
	ldrb r0, [r1]
	movs r1, 0x2
	negs r1, r1
	ands r1, r0
	ldr r2, _080569D4 @ =gUnknown_0202E844
	strb r1, [r2]
	mov r0, r10
	ldr r1, [sp]
	bl GetPostCameraMoveMapBorderId
	adds r7, r0, 0
	adds r0, r7, 0x1
	cmp r0, 0x1
	bhi _080569DC
	ldr r0, _080569D8 @ =gSaveBlock1
	ldrh r1, [r0]
	add r1, r10
	strh r1, [r0]
	ldrh r1, [r0, 0x2]
	ldr r2, [sp]
	adds r1, r2
	strh r1, [r0, 0x2]
	b _08056A42
	.align 2, 0
_080569D4: .4byte gUnknown_0202E844
_080569D8: .4byte gSaveBlock1
_080569DC:
	bl save_serialize_map
	ldr r5, _08056A5C @ =gSaveBlock1
	movs r0, 0
	ldrsh r6, [r5, r0]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	mov r8, r1
	lsls r0, r7, 24
	lsrs r0, 24
	mov r9, r0
	adds r1, r6, 0
	mov r2, r8
	bl sub_8056A64
	adds r4, r0, 0
	adds r1, r7, 0
	mov r2, r10
	ldr r3, [sp]
	bl sub_8056918
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	bl sub_80538F0
	ldr r1, _08056A60 @ =gUnknown_0202E844
	ldrb r0, [r1]
	movs r1, 0x1
	orrs r0, r1
	ldr r2, _08056A60 @ =gUnknown_0202E844
	strb r0, [r2]
	movs r1, 0
	ldrsh r0, [r5, r1]
	subs r6, r0
	str r6, [r2, 0x4]
	movs r2, 0x2
	ldrsh r0, [r5, r2]
	mov r1, r8
	subs r1, r0
	ldr r2, _08056A60 @ =gUnknown_0202E844
	str r1, [r2, 0x8]
	ldrh r0, [r5]
	add r0, r10
	strh r0, [r5]
	ldrh r0, [r5, 0x2]
	ldr r1, [sp]
	adds r0, r1
	strh r0, [r5, 0x2]
	mov r0, r9
	bl sub_80566F0
_08056A42:
	ldr r0, _08056A60 @ =gUnknown_0202E844
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08056A5C: .4byte gSaveBlock1
_08056A60: .4byte gUnknown_0202E844
	thumb_func_end CameraMove

	thumb_func_start sub_8056A64
sub_8056A64: @ 8056A64
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r1
	mov r8, r2
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08056AA0 @ =gMapHeader
	ldr r0, [r0, 0xC]
	ldr r7, [r0]
	ldr r4, [r0, 0x4]
	movs r5, 0
	cmp r5, r7
	bge _08056AAC
_08056A82:
	ldrb r0, [r4]
	cmp r0, r6
	bne _08056AA4
	adds r0, r6, 0
	mov r1, r9
	mov r2, r8
	adds r3, r4, 0
	bl sub_8056ABC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08056AA4
	adds r0, r4, 0
	b _08056AAE
	.align 2, 0
_08056AA0: .4byte gMapHeader
_08056AA4:
	adds r5, 0x1
	adds r4, 0xC
	cmp r5, r7
	blt _08056A82
_08056AAC:
	movs r0, 0
_08056AAE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8056A64

	thumb_func_start sub_8056ABC
sub_8056ABC: @ 8056ABC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r1, 0
	mov r8, r2
	adds r5, r3, 0
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	adds r0, r5, 0
	bl mapconnection_get_mapheader
	adds r2, r0, 0
	cmp r4, 0x1
	blt _08056B14
	cmp r4, 0x2
	bgt _08056AF4
	ldr r0, _08056AF0 @ =gMapHeader
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r0, [r2]
	ldr r2, [r0]
	ldr r3, [r5, 0x4]
	adds r0, r7, 0
	b _08056B06
	.align 2, 0
_08056AF0: .4byte gMapHeader
_08056AF4:
	cmp r6, 0x4
	bgt _08056B14
	ldr r0, _08056B10 @ =gMapHeader
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	ldr r0, [r2]
	ldr r2, [r0, 0x4]
	ldr r3, [r5, 0x4]
	mov r0, r8
_08056B06:
	bl sub_8056B20
	lsls r0, 24
	lsrs r0, 24
	b _08056B16
	.align 2, 0
_08056B10: .4byte gMapHeader
_08056B14:
	movs r0, 0
_08056B16:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8056ABC

	thumb_func_start sub_8056B20
sub_8056B20: @ 8056B20
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r2, 0
	adds r2, r3, 0
	cmp r3, 0
	bge _08056B2E
	movs r3, 0
_08056B2E:
	adds r2, r0, r2
	cmp r2, r1
	bge _08056B36
	adds r1, r2, 0
_08056B36:
	cmp r3, r4
	bgt _08056B42
	cmp r4, r1
	bgt _08056B42
	movs r0, 0x1
	b _08056B44
_08056B42:
	movs r0, 0
_08056B44:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8056B20

	thumb_func_start sub_8056B4C
sub_8056B4C: @ 8056B4C
	push {lr}
	cmp r0, 0
	blt _08056B5A
	cmp r0, r1
	bge _08056B5A
	movs r0, 0x1
	b _08056B5C
_08056B5A:
	movs r0, 0
_08056B5C:
	pop {r1}
	bx r1
	thumb_func_end sub_8056B4C

	thumb_func_start sub_8056B60
sub_8056B60: @ 8056B60
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl mapconnection_get_mapheader
	adds r1, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x1
	blt _08056B98
	cmp r0, 0x2
	bgt _08056B86
	ldr r0, [r4, 0x4]
	subs r0, r5, r0
	ldr r1, [r1]
	ldr r1, [r1]
	bl sub_8056B4C
	b _08056B9A
_08056B86:
	cmp r0, 0x4
	bgt _08056B98
	ldr r0, [r4, 0x4]
	subs r0, r6, r0
	ldr r1, [r1]
	ldr r1, [r1, 0x4]
	bl sub_8056B4C
	b _08056B9A
_08056B98:
	movs r0, 0
_08056B9A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8056B60

	thumb_func_start sub_8056BA0
sub_8056BA0: @ 8056BA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _08056BC0 @ =gMapHeader
	ldr r0, [r2, 0xC]
	cmp r0, 0
	bne _08056BC8
	b _08056C3E
	.align 2, 0
_08056BC0: .4byte gMapHeader
_08056BC4:
	adds r0, r4, 0
	b _08056C40
_08056BC8:
	ldr r7, [r0]
	ldr r4, [r0, 0x4]
	movs r6, 0
	cmp r6, r7
	bge _08056C3E
	lsls r0, r1, 16
	asrs r5, r0, 16
	mov r9, r2
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	mov r10, r0
_08056BE0:
	ldrb r1, [r4]
	adds r3, r1, 0
	subs r0, r1, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08056C36
	cmp r1, 0x2
	bne _08056BF6
	cmp r5, 0x6
	bgt _08056C36
_08056BF6:
	cmp r1, 0x1
	bne _08056C06
	mov r2, r9
	ldr r0, [r2]
	ldr r0, [r0, 0x4]
	adds r0, 0x7
	cmp r5, r0
	blt _08056C36
_08056C06:
	mov r0, r8
	lsls r2, r0, 16
	cmp r1, 0x3
	bne _08056C14
	mov r1, r10
	cmp r1, 0x6
	bgt _08056C36
_08056C14:
	cmp r3, 0x4
	bne _08056C26
	asrs r1, r2, 16
	mov r3, r9
	ldr r0, [r3]
	ldr r0, [r0]
	adds r0, 0x7
	cmp r1, r0
	blt _08056C36
_08056C26:
	asrs r1, r2, 16
	subs r1, 0x7
	adds r0, r4, 0
	subs r2, r5, 0x7
	bl sub_8056B60
	cmp r0, 0x1
	beq _08056BC4
_08056C36:
	adds r6, 0x1
	adds r4, 0xC
	cmp r6, r7
	blt _08056BE0
_08056C3E:
	movs r0, 0
_08056C40:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8056BA0

	thumb_func_start sub_8056C50
sub_8056C50: @ 8056C50
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _08056C64 @ =gSaveBlock1
	subs r0, 0x7
	strh r0, [r2]
	subs r1, 0x7
	strh r1, [r2, 0x2]
	bx lr
	.align 2, 0
_08056C64: .4byte gSaveBlock1
	thumb_func_end sub_8056C50

	thumb_func_start sav1_camera_get_focus_coords
sav1_camera_get_focus_coords: @ 8056C68
	ldr r3, _08056C78 @ =gSaveBlock1
	ldrh r2, [r3]
	adds r2, 0x7
	strh r2, [r0]
	ldrh r0, [r3, 0x2]
	adds r0, 0x7
	strh r0, [r1]
	bx lr
	.align 2, 0
_08056C78: .4byte gSaveBlock1
	thumb_func_end sav1_camera_get_focus_coords

	thumb_func_start unref_sub_8056C7C
unref_sub_8056C7C: @ 8056C7C
	ldr r2, _08056C84 @ =gSaveBlock1
	strh r0, [r2]
	strh r1, [r2, 0x2]
	bx lr
	.align 2, 0
_08056C84: .4byte gSaveBlock1
	thumb_func_end unref_sub_8056C7C

	thumb_func_start GetCameraCoords
GetCameraCoords: @ 8056C88
	ldr r3, _08056C94 @ =gSaveBlock1
	ldrh r2, [r3]
	strh r2, [r0]
	ldrh r0, [r3, 0x2]
	strh r0, [r1]
	bx lr
	.align 2, 0
_08056C94: .4byte gSaveBlock1
	thumb_func_end GetCameraCoords

	thumb_func_start sub_8056C98
sub_8056C98: @ 8056C98
	push {lr}
	adds r2, r0, 0
	cmp r2, 0
	beq _08056CB8
	ldrb r0, [r2]
	cmp r0, 0
	bne _08056CB2
	ldr r0, [r2, 0x4]
	movs r2, 0x80
	lsls r2, 5
	bl CpuFastSet
	b _08056CB8
_08056CB2:
	ldr r0, [r2, 0x4]
	bl LZ77UnCompVram
_08056CB8:
	pop {r0}
	bx r0
	thumb_func_end sub_8056C98

	thumb_func_start sub_8056CBC
sub_8056CBC: @ 8056CBC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	cmp r4, 0
	beq _08056D1E
	ldrb r1, [r4, 0x1]
	cmp r1, 0
	bne _08056CEE
	mov r0, sp
	strh r1, [r0]
	lsls r1, r5, 16
	lsrs r1, 16
	movs r2, 0x2
	bl LoadPalette
	ldr r0, [r4, 0x8]
	adds r0, 0x2
	adds r1, r5, 0x1
	lsls r1, 16
	lsrs r1, 16
	subs r2, r6, 0x2
	lsls r2, 16
	b _08056CFC
_08056CEE:
	cmp r1, 0x1
	bne _08056D04
	ldr r0, [r4, 0x8]
	adds r0, 0xC0
	lsls r1, r5, 16
	lsrs r1, 16
	lsls r2, r6, 16
_08056CFC:
	lsrs r2, 16
	bl LoadPalette
	b _08056D1E
_08056D04:
	ldr r0, [r4, 0x8]
	movs r4, 0x80
	lsls r4, 18
	adds r1, r4, 0
	bl LZ77UnCompVram
	lsls r1, r5, 16
	lsrs r1, 16
	lsls r2, r6, 16
	lsrs r2, 16
	adds r0, r4, 0
	bl LoadPalette
_08056D1E:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8056CBC

	thumb_func_start sub_8056D28
sub_8056D28: @ 8056D28
	push {lr}
	movs r1, 0xC0
	lsls r1, 19
	ldr r0, [r0, 0x10]
	bl sub_8056C98
	pop {r0}
	bx r0
	thumb_func_end sub_8056D28

	thumb_func_start sub_8056D38
sub_8056D38: @ 8056D38
	push {lr}
	ldr r1, _08056D48 @ =0x06004000
	ldr r0, [r0, 0x14]
	bl sub_8056C98
	pop {r0}
	bx r0
	.align 2, 0
_08056D48: .4byte 0x06004000
	thumb_func_end sub_8056D38

	thumb_func_start apply_map_tileset1_palette
apply_map_tileset1_palette: @ 8056D4C
	push {lr}
	ldr r0, [r0, 0x10]
	movs r1, 0
	movs r2, 0xC0
	bl sub_8056CBC
	pop {r0}
	bx r0
	thumb_func_end apply_map_tileset1_palette

	thumb_func_start apply_map_tileset2_palette
apply_map_tileset2_palette: @ 8056D5C
	push {lr}
	ldr r0, [r0, 0x14]
	movs r1, 0x60
	movs r2, 0xC0
	bl sub_8056CBC
	pop {r0}
	bx r0
	thumb_func_end apply_map_tileset2_palette

	thumb_func_start copy_map_tileset1_tileset2_to_vram
copy_map_tileset1_tileset2_to_vram: @ 8056D6C
	push {r4,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _08056D7E
	bl sub_8056D28
	adds r0, r4, 0
	bl sub_8056D38
_08056D7E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end copy_map_tileset1_tileset2_to_vram

	thumb_func_start apply_map_tileset1_tileset2_palette
apply_map_tileset1_tileset2_palette: @ 8056D84
	push {r4,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _08056D96
	bl apply_map_tileset1_palette
	adds r0, r4, 0
	bl apply_map_tileset2_palette
_08056D96:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end apply_map_tileset1_tileset2_palette

	.align 2, 0 @ Don't pad with nop.
