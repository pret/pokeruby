	.include "constants/gba_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

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
	bl MetatileBehavior_IsClosedSootpolisGymDoor
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
	bl MetatileBehavior_IsPokeblockFeeder
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
	bl MetatileBehavior_IsTrickHousePuzzleDoor
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
	bl MetatileBehavior_IsRegionMap
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
	bl MetatileBehavior_IsPictureBookShelf
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
	bl MetatileBehavior_IsBookShelf
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
	bl MetatileBehavior_IsPokeCenterBookShelf
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
	bl MetatileBehavior_IsVase
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
	bl MetatileBehavior_IsTrashCan
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
	bl MetatileBehavior_IsShopShelf
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
	bl MetatileBehavior_IsBlueprint
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
	bl MetatileBehavior_IsSecretBasePC
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
	bl MetatileBehavior_IsCrackedFloorHole
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
	bl IncrementGameStat
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
	bl MetatileBehavior_IsLavaridgeB1FWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068AD6
	bl sub_8080F48
	movs r0, 0x1
	b _08068B2A
_08068AD6:
	adds r0, r4, 0
	bl MetatileBehavior_IsLavaridge1FWarp
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
	bl MetatileBehavior_IsMtPyreHole
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
	bl MetatileBehavior_IsWarpDoor
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
	bl MetatileBehavior_IsNonAnimDoor
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl MetatileBehavior_IsLavaridgeB1FWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl MetatileBehavior_IsLavaridge1FWarp
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
	bl MetatileBehavior_IsMtPyreHole
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
	bl MetatileBehavior_IsWarpDoor
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
	bl DoCoordEventWeather
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

	.align 2, 0 @ Don't pad with nop.
