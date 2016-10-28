	.include "constants/gba_constants.s"
	.include "constants/species_constants.s"
	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start sub_80C8FAC
sub_80C8FAC: @ 80C8FAC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080C8FD0 @ =word_203855E
	ldrh r0, [r1]
	cmp r0, 0xAF
	bne _080C8FD8
	ldr r1, _080C8FD4 @ =gTasks
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x26]
	subs r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	b _080C8FE6
	.align 2, 0
_080C8FD0: .4byte word_203855E
_080C8FD4: .4byte gTasks
_080C8FD8:
	ldrh r0, [r1]
	bl ItemId_GetType
	subs r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r2, r4, 2
_080C8FE6:
	ldr r0, _080C9008 @ =gTasks
	adds r1, r2, r4
	lsls r1, 3
	adds r1, r0
	ldr r2, _080C900C @ =gUnknown_083D61E4
	lsls r0, r3, 2
	adds r0, r2
	ldr r2, [r0]
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	ldr r0, _080C9010 @ =sub_80A5B00
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9008: .4byte gTasks
_080C900C: .4byte gUnknown_083D61E4
_080C9010: .4byte sub_80A5B00
	thumb_func_end sub_80C8FAC

	thumb_func_start unknown_ItemMenu_Confirm
unknown_ItemMenu_Confirm: @ 80C9014
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	bl sub_80C8FAC
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
	thumb_func_end unknown_ItemMenu_Confirm

	thumb_func_start sub_80C9038
sub_80C9038: @ 80C9038
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80C8FAC
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	pop {r0}
	bx r0
	thumb_func_end sub_80C9038

	thumb_func_start SetUpItemUseOnFieldCallback
SetUpItemUseOnFieldCallback: @ 80C9050
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080C9078 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _080C9084
	ldr r1, _080C907C @ =gUnknown_0300485C
	ldr r0, _080C9080 @ =sub_80A5CC4
	str r0, [r1]
	adds r0, r2, 0
	bl unknown_ItemMenu_Confirm
	b _080C908E
	.align 2, 0
_080C9078: .4byte gTasks
_080C907C: .4byte gUnknown_0300485C
_080C9080: .4byte sub_80A5CC4
_080C9084:
	ldr r0, _080C9094 @ =gUnknown_03005D00
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
_080C908E:
	pop {r0}
	bx r0
	.align 2, 0
_080C9094: .4byte gUnknown_03005D00
	thumb_func_end SetUpItemUseOnFieldCallback

	thumb_func_start sub_80C9098
sub_80C9098: @ 80C9098
	push {r4-r6,lr}
	adds r4, r1, 0
	adds r1, r2, 0
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080C90CC @ =gStringVar4
	adds r0, r5, 0
	bl StringExpandPlaceholders
	cmp r4, 0
	bne _080C90D4
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r2, _080C90D0 @ =sub_80A5C48
	adds r0, r6, 0
	adds r1, r5, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080C90E0
	.align 2, 0
_080C90CC: .4byte gStringVar4
_080C90D0: .4byte sub_80A5C48
_080C90D4:
	ldr r2, _080C90E8 @ =sub_80A5C9C
	adds r0, r6, 0
	adds r1, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C90E0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C90E8: .4byte sub_80A5C9C
	thumb_func_end sub_80C9098

	thumb_func_start DisplayDadsAdviceCannotUseItemMessage
DisplayDadsAdviceCannotUseItemMessage: @ 80C90EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080C9100 @ =gOtherText_DadsAdvice
	bl sub_80C9098
	pop {r0}
	bx r0
	.align 2, 0
_080C9100: .4byte gOtherText_DadsAdvice
	thumb_func_end DisplayDadsAdviceCannotUseItemMessage

	thumb_func_start sub_80C9104
sub_80C9104: @ 80C9104
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080C9118 @ =gOtherText_CantGetOffBike
	bl sub_80C9098
	pop {r0}
	bx r0
	.align 2, 0
_080C9118: .4byte gOtherText_CantGetOffBike
	thumb_func_end sub_80C9104

	thumb_func_start CheckIfItemIsTMHMOrEvolutionStone
CheckIfItemIsTMHMOrEvolutionStone: @ 80C911C
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl ItemId_GetFieldFunc
	ldr r1, _080C9134 @ =ItemUseOutOfBattle_TMHM
	cmp r0, r1
	bne _080C9138
	movs r0, 0x1
	b _080C914E
	.align 2, 0
_080C9134: .4byte ItemUseOutOfBattle_TMHM
_080C9138:
	adds r0, r4, 0
	bl ItemId_GetFieldFunc
	ldr r1, _080C9148 @ =ItemUseOutOfBattle_EvolutionStone
	cmp r0, r1
	beq _080C914C
	movs r0, 0
	b _080C914E
	.align 2, 0
_080C9148: .4byte ItemUseOutOfBattle_EvolutionStone
_080C914C:
	movs r0, 0x2
_080C914E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CheckIfItemIsTMHMOrEvolutionStone

	thumb_func_start sub_80C9154
sub_80C9154: @ 80C9154
	push {r4,lr}
	sub sp, 0x24
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C9188 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080C9180
	mov r1, sp
	ldr r0, _080C918C @ =word_203855E
	ldrh r0, [r0]
	strh r0, [r1, 0x20]
	ldr r1, _080C9190 @ =sub_80A5D04
	mov r0, sp
	movs r2, 0
	bl sub_80F890C
	adds r0, r4, 0
	bl DestroyTask
_080C9180:
	add sp, 0x24
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9188: .4byte gPaletteFade
_080C918C: .4byte word_203855E
_080C9190: .4byte sub_80A5D04
	thumb_func_end sub_80C9154

	thumb_func_start ItemUseOutOfBattle_Mail
ItemUseOutOfBattle_Mail: @ 80C9194
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
	ldr r1, _080C91C4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C91C8 @ =sub_80C9154
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C91C4: .4byte gTasks
_080C91C8: .4byte sub_80C9154
	thumb_func_end ItemUseOutOfBattle_Mail

	thumb_func_start ItemUseOutOfBattle_Bike
ItemUseOutOfBattle_Bike: @ 80C91CC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
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
	lsrs r4, r0, 24
	ldr r0, _080C924C @ =0x0000082b
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9238
	adds r0, r4, 0
	bl MetatileBehavior_IsVerticalRail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9238
	adds r0, r4, 0
	bl MetatileBehavior_IsHorizontalRail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9238
	adds r0, r4, 0
	bl MetatileBehavior_IsIsolatedVerticalRail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9238
	adds r0, r4, 0
	bl MetatileBehavior_IsIsolatedHorizontalRail
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C9254
_080C9238:
	ldr r0, _080C9250 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r5, 0
	bl sub_80C9104
	b _080C928E
	.align 2, 0
_080C924C: .4byte 0x0000082b
_080C9250: .4byte gTasks
_080C9254:
	bl sub_8053C44
	cmp r0, 0x1
	bne _080C927C
	bl sub_80E5EF4
	lsls r0, 24
	cmp r0, 0
	bne _080C927C
	ldr r1, _080C9274 @ =gUnknown_03005D00
	ldr r0, _080C9278 @ =ItemUseOnFieldCB_Bike
	str r0, [r1]
	adds r0, r5, 0
	bl SetUpItemUseOnFieldCallback
	b _080C928E
	.align 2, 0
_080C9274: .4byte gUnknown_03005D00
_080C9278: .4byte ItemUseOnFieldCB_Bike
_080C927C:
	ldr r0, _080C9298 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r5, 0
	bl DisplayDadsAdviceCannotUseItemMessage
_080C928E:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9298: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_Bike

	thumb_func_start ItemUseOnFieldCB_Bike
ItemUseOnFieldCB_Bike: @ 80C929C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080C92E0 @ =word_203855E
	ldrh r0, [r4]
	bl ItemId_GetSecondaryId
	lsls r0, 24
	cmp r0, 0
	bne _080C92B6
	movs r0, 0x2
	bl GetOnOffBike
_080C92B6:
	ldrh r0, [r4]
	bl ItemId_GetSecondaryId
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C92CA
	movs r0, 0x4
	bl GetOnOffBike
_080C92CA:
	bl sub_8064E2C
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C92E0: .4byte word_203855E
	thumb_func_end ItemUseOnFieldCB_Bike

	thumb_func_start CanFish
CanFish: @ 80C92E4
	push {r4-r6,lr}
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
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r0, r6, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	cmp r0, 0
	bne _080C936C
	movs r0, 0x10
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	bne _080C936C
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	bne _080C933C
	bl IsPlayerFacingSurfableFishableWater
	lsls r0, 24
	cmp r0, 0
	beq _080C936C
_080C9338:
	movs r0, 0x1
	b _080C936E
_080C933C:
	adds r0, r5, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	beq _080C935C
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridIsImpassableAt
	lsls r0, 24
	cmp r0, 0
	beq _080C9338
_080C935C:
	lsls r0, r6, 24
	lsrs r0, 24
	bl MetatileBehavior_IsBridge
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9338
_080C936C:
	movs r0, 0
_080C936E:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CanFish

	thumb_func_start ItemUseOutOfBattle_Rod
ItemUseOutOfBattle_Rod: @ 80C9378
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl CanFish
	cmp r0, 0x1
	bne _080C939C
	ldr r1, _080C9394 @ =gUnknown_03005D00
	ldr r0, _080C9398 @ =ItemUseOnFieldCB_Rod
	str r0, [r1]
	adds r0, r4, 0
	bl SetUpItemUseOnFieldCallback
	b _080C93AE
	.align 2, 0
_080C9394: .4byte gUnknown_03005D00
_080C9398: .4byte ItemUseOnFieldCB_Rod
_080C939C:
	ldr r0, _080C93B4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl DisplayDadsAdviceCannotUseItemMessage
_080C93AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C93B4: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_Rod

	thumb_func_start ItemUseOnFieldCB_Rod
ItemUseOnFieldCB_Rod: @ 80C93B8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080C93DC @ =word_203855E
	ldrh r0, [r0]
	bl ItemId_GetSecondaryId
	lsls r0, 24
	lsrs r0, 24
	bl StartFishing
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C93DC: .4byte word_203855E
	thumb_func_end ItemUseOnFieldCB_Rod

	thumb_func_start ItemUseOutOfBattle_Itemfinder
ItemUseOutOfBattle_Itemfinder: @ 80C93E0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x27
	bl sav12_xor_increment
	ldr r1, _080C9400 @ =gUnknown_03005D00
	ldr r0, _080C9404 @ =ItemUseOnFieldCB_Itemfinder
	str r0, [r1]
	adds r0, r4, 0
	bl SetUpItemUseOnFieldCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9400: .4byte gUnknown_03005D00
_080C9404: .4byte ItemUseOnFieldCB_Itemfinder
	thumb_func_end ItemUseOutOfBattle_Itemfinder

	thumb_func_start ItemUseOnFieldCB_Itemfinder
ItemUseOnFieldCB_Itemfinder: @ 80C9408
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080C9430 @ =gMapHeader
	ldr r0, [r0, 0x4]
	adds r1, r4, 0
	bl ItemfinderCheckForHiddenItems
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C943C
	ldr r0, _080C9434 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080C9438 @ =sub_80C9458
	str r0, [r1]
	b _080C9448
	.align 2, 0
_080C9430: .4byte gMapHeader
_080C9434: .4byte gTasks
_080C9438: .4byte sub_80C9458
_080C943C:
	ldr r1, _080C9450 @ =gOtherText_NoResponse
	ldr r2, _080C9454 @ =sub_80C9520
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C9448:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9450: .4byte gOtherText_NoResponse
_080C9454: .4byte sub_80C9520
	thumb_func_end ItemUseOnFieldCB_Itemfinder

	thumb_func_start sub_80C9458
sub_80C9458: @ 80C9458
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r6, r5, 2
	adds r0, r6, r5
	lsls r7, r0, 3
	ldr r0, _080C94AC @ =gTasks + 0x8
	mov r8, r0
	adds r4, r7, r0
	movs r1, 0x6
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C950C
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0x4
	bne _080C9500
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl sub_80C9908
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080C94B8
	ldr r1, _080C94B0 @ =gUnknown_083D61F0
	subs r0, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80C997C
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _080C94B4 @ =sub_80C99EC
	str r1, [r0]
	b _080C9516
	.align 2, 0
_080C94AC: .4byte gTasks + 0x8
_080C94B0: .4byte gUnknown_083D61F0
_080C94B4: .4byte sub_80C99EC
_080C94B8:
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	adds r3, r6, 0
	ldr r7, _080C94F4 @ =gUnknown_083D61F0
	movs r6, 0x3
_080C94C8:
	adds r0, r1, r7
	adds r1, 0x1
	ldrb r0, [r0]
	cmp r2, r0
	bne _080C94D8
	adds r0, r1, 0
	ands r0, r6
	strh r0, [r4, 0xA]
_080C94D8:
	lsls r0, r1, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bls _080C94C8
	ldr r1, _080C94F8 @ =gTasks
	adds r0, r3, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C94FC @ =sub_80C9A38
	str r1, [r0]
	movs r0, 0
	strh r0, [r4, 0x6]
	strh r0, [r4, 0x4]
	b _080C9516
	.align 2, 0
_080C94F4: .4byte gUnknown_083D61F0
_080C94F8: .4byte gTasks
_080C94FC: .4byte sub_80C9A38
_080C9500:
	movs r0, 0x48
	bl PlaySE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080C950C:
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	movs r1, 0x1F
	ands r0, r1
	strh r0, [r4, 0x6]
_080C9516:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C9458

	thumb_func_start sub_80C9520
sub_80C9520: @ 80C9520
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	bl sub_8064E2C
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80C9520

	thumb_func_start ItemfinderCheckForHiddenItems
ItemfinderCheckForHiddenItems: @ 80C9548
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	ldr r1, _080C9618 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0xC]
	movs r3, 0
	mov r9, r4
	ldrb r0, [r5, 0x3]
	cmp r3, r0
	bge _080C95FC
	subs r1, 0x5
	mov r8, r1
_080C9580:
	lsls r3, 16
	asrs r1, r3, 16
	ldr r2, [r5, 0x10]
	lsls r0, r1, 1
	adds r0, r1
	lsls r4, r0, 2
	adds r1, r4, r2
	ldrb r0, [r1, 0x5]
	adds r7, r3, 0
	cmp r0, 0x7
	bne _080C95EC
	movs r2, 0x96
	lsls r2, 2
	adds r0, r2, 0
	ldrh r1, [r1, 0xA]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080C95EC
	ldr r1, [r5, 0x10]
	adds r1, r4, r1
	ldrh r2, [r1]
	adds r2, 0x7
	mov r0, sp
	ldrh r0, [r0]
	subs r2, r0
	ldrh r0, [r1, 0x2]
	adds r0, 0x7
	mov r3, r9
	ldrh r1, [r3]
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 16
	asrs r1, r2, 16
	movs r3, 0xE0
	lsls r3, 11
	adds r2, r3
	lsrs r2, 16
	cmp r2, 0xE
	bhi _080C95EC
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, r8
	blt _080C95EC
	cmp r2, 0x5
	bgt _080C95EC
	adds r0, r6, 0
	bl sub_80C9838
_080C95EC:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r7, r1
	lsrs r3, r0, 16
	asrs r0, 16
	ldrb r2, [r5, 0x3]
	cmp r0, r2
	blt _080C9580
_080C95FC:
	adds r0, r6, 0
	bl sub_80C9720
	ldr r0, _080C9618 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0x1
	beq _080C961C
	movs r0, 0
	b _080C961E
	.align 2, 0
_080C9618: .4byte gTasks
_080C961C:
	movs r0, 0x1
_080C961E:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ItemfinderCheckForHiddenItems

	thumb_func_start sub_80C962C
sub_80C962C: @ 80C962C
	push {r4-r6,lr}
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	ldrb r2, [r0, 0x3]
	ldr r5, [r0, 0x10]
	movs r1, 0
	cmp r1, r2
	bge _080C9680
	lsls r0, r3, 16
	asrs r6, r0, 16
	lsls r0, r4, 16
	asrs r4, r0, 16
	adds r3, r5, 0
_080C964A:
	ldrb r0, [r3, 0x5]
	cmp r0, 0x7
	bne _080C9678
	ldrh r0, [r3]
	cmp r6, r0
	bne _080C9678
	ldrh r0, [r3, 0x2]
	cmp r4, r0
	bne _080C9678
	movs r1, 0x96
	lsls r1, 2
	adds r0, r1, 0
	ldrh r3, [r3, 0xA]
	adds r0, r3
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080C9680
	movs r0, 0x1
	b _080C9682
_080C9678:
	adds r3, 0xC
	adds r1, 0x1
	cmp r1, r2
	blt _080C964A
_080C9680:
	movs r0, 0
_080C9682:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C962C

	thumb_func_start sub_80C9688
sub_80C9688: @ 80C9688
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl mapconnection_get_mapheader
	adds r3, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x2
	beq _080C96B0
	cmp r0, 0x2
	bgt _080C96A6
	cmp r0, 0x1
	beq _080C96C4
	b _080C9704
_080C96A6:
	cmp r0, 0x3
	beq _080C96DC
	cmp r0, 0x4
	beq _080C96E6
	b _080C9704
_080C96B0:
	ldr r0, [r4, 0x4]
	adds r0, 0x7
	subs r0, r5, r0
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r3]
	ldr r0, [r0, 0x4]
	subs r0, 0x7
	adds r0, r6
	b _080C96FA
_080C96C4:
	ldr r0, [r4, 0x4]
	adds r0, 0x7
	subs r0, r5, r0
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080C96D8 @ =gMapHeader
	ldr r0, [r0]
	ldr r0, [r0, 0x4]
	b _080C96F6
	.align 2, 0
_080C96D8: .4byte gMapHeader
_080C96DC:
	ldr r0, [r3]
	ldr r0, [r0]
	subs r0, 0x7
	adds r0, r5
	b _080C96F0
_080C96E6:
	ldr r0, _080C9700 @ =gMapHeader
	ldr r0, [r0]
	ldr r0, [r0]
	adds r0, 0x7
	subs r0, r5, r0
_080C96F0:
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, [r4, 0x4]
_080C96F6:
	adds r0, 0x7
	subs r0, r6, r0
_080C96FA:
	lsls r0, 16
	lsrs r2, r0, 16
	b _080C9708
	.align 2, 0
_080C9700: .4byte gMapHeader
_080C9704:
	movs r0, 0
	b _080C971A
_080C9708:
	ldr r0, [r3, 0x4]
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	bl sub_80C962C
	lsls r0, 24
	lsrs r0, 24
_080C971A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80C9688

	thumb_func_start sub_80C9720
sub_80C9720: @ 80C9720
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldr r0, _080C9834 @ =gMapHeader
	ldr r1, [r0]
	ldr r0, [r1]
	adds r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	ldr r0, [r1, 0x4]
	adds r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0xC]
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	mov r1, sp
	movs r2, 0
	ldrsh r1, [r1, r2]
	adds r1, 0x7
	cmp r0, r1
	bgt _080C9824
_080C976E:
	mov r5, sp
	ldrh r0, [r5, 0x2]
	subs r0, 0x5
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r2, r4, 16
	asrs r1, r2, 16
	movs r6, 0x2
	ldrsh r0, [r5, r6]
	adds r0, 0x5
	lsls r3, 16
	mov r8, r3
	cmp r1, r0
	bgt _080C980E
	movs r0, 0x7
	str r0, [sp, 0x10]
	mov r1, r8
	asrs r1, 16
	mov r9, r1
	mov r10, r0
_080C9796:
	ldr r3, [sp, 0x10]
	cmp r3, r9
	bgt _080C97B8
	ldr r5, [sp, 0x8]
	lsls r0, r5, 16
	asrs r0, 16
	cmp r9, r0
	bge _080C97B8
	asrs r1, r2, 16
	cmp r10, r1
	bgt _080C97B8
	ldr r6, [sp, 0xC]
	lsls r0, r6, 16
	asrs r0, 16
	lsls r7, r4, 16
	cmp r1, r0
	blt _080C97F6
_080C97B8:
	mov r0, r8
	asrs r5, r0, 16
	lsls r4, 16
	asrs r6, r4, 16
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_8056BA0
	adds r7, r4, 0
	cmp r0, 0
	beq _080C97F6
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_80C9688
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C97F6
	mov r0, sp
	ldrh r1, [r0]
	subs r1, r5, r1
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, r6, r2
	lsls r2, 16
	asrs r2, 16
	ldr r0, [sp, 0x4]
	bl sub_80C9838
_080C97F6:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r7, r1
	lsrs r4, r0, 16
	lsls r2, r4, 16
	asrs r1, r2, 16
	mov r3, sp
	movs r5, 0x2
	ldrsh r0, [r3, r5]
	adds r0, 0x5
	cmp r1, r0
	ble _080C9796
_080C980E:
	movs r1, 0x80
	lsls r1, 9
	add r1, r8
	lsrs r3, r1, 16
	asrs r1, 16
	mov r0, sp
	movs r6, 0
	ldrsh r0, [r0, r6]
	adds r0, 0x7
	cmp r1, r0
	ble _080C976E
_080C9824:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C9834: .4byte gMapHeader
	thumb_func_end sub_80C9720

	thumb_func_start sub_80C9838
sub_80C9838: @ 80C9838
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r12, r2
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080C986C @ =gTasks + 0x8
	adds r3, r1, r0
	movs r1, 0x4
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080C9870
	strh r7, [r3]
	mov r0, r12
	strh r0, [r3, 0x2]
	movs r0, 0x1
	strh r0, [r3, 0x4]
	b _080C98FA
	.align 2, 0
_080C986C: .4byte gTasks + 0x8
_080C9870:
	movs r1, 0
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bge _080C9880
	negs r0, r0
	lsls r0, 16
	lsrs r4, r0, 16
	b _080C9882
_080C9880:
	ldrh r4, [r3]
_080C9882:
	movs r1, 0x2
	ldrsh r0, [r3, r1]
	ldrh r1, [r3, 0x2]
	mov r9, r1
	cmp r0, 0
	bge _080C9896
	negs r0, r0
	lsls r0, 16
	lsrs r2, r0, 16
	b _080C9898
_080C9896:
	ldrh r2, [r3, 0x2]
_080C9898:
	lsls r1, r7, 16
	asrs r0, r1, 16
	cmp r0, 0
	bge _080C98A8
	negs r0, r0
	lsls r0, 16
	lsrs r6, r0, 16
	b _080C98AA
_080C98A8:
	lsrs r6, r1, 16
_080C98AA:
	mov r1, r12
	lsls r0, r1, 16
	asrs r1, r0, 16
	mov r8, r0
	cmp r1, 0
	bge _080C98BC
	negs r0, r1
	lsls r0, 16
	b _080C98BE
_080C98BC:
	mov r0, r8
_080C98BE:
	lsrs r5, r0, 16
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r2, 16
	asrs r2, r1, 16
	adds r4, r0, r2
	lsls r0, r6, 16
	asrs r0, 16
	lsls r1, r5, 16
	asrs r1, 16
	adds r0, r1
	cmp r4, r0
	ble _080C98E0
	strh r7, [r3]
	mov r1, r12
	strh r1, [r3, 0x2]
	b _080C98FA
_080C98E0:
	cmp r4, r0
	bne _080C98FA
	cmp r2, r1
	bgt _080C98F4
	cmp r2, r1
	bne _080C98FA
	mov r1, r9
	lsls r0, r1, 16
	cmp r0, r8
	bge _080C98FA
_080C98F4:
	strh r7, [r3]
	mov r0, r12
	strh r0, [r3, 0x2]
_080C98FA:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80C9838

	thumb_func_start sub_80C9908
sub_80C9908: @ 80C9908
	push {r4,r5,lr}
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	lsrs r2, r0, 16
	cmp r0, 0
	bne _080C991A
	cmp r1, 0
	beq _080C9974
_080C991A:
	lsls r0, r2, 16
	asrs r2, r0, 16
	adds r5, r0, 0
	cmp r2, 0
	bge _080C992C
	negs r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	b _080C992E
_080C992C:
	lsrs r4, r5, 16
_080C992E:
	lsls r0, r1, 16
	asrs r2, r0, 16
	adds r1, r0, 0
	cmp r2, 0
	bge _080C9940
	negs r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	b _080C9942
_080C9940:
	lsrs r3, r1, 16
_080C9942:
	lsls r0, r4, 16
	asrs r2, r0, 16
	lsls r0, r3, 16
	asrs r0, 16
	cmp r2, r0
	ble _080C995A
	cmp r5, 0
	bge _080C9956
	movs r0, 0x4
	b _080C9976
_080C9956:
	movs r0, 0x2
	b _080C9976
_080C995A:
	cmp r2, r0
	bge _080C9964
	cmp r1, 0
	blt _080C996C
	b _080C9970
_080C9964:
	cmp r2, r0
	bne _080C9974
	cmp r1, 0
	bge _080C9970
_080C996C:
	movs r0, 0x1
	b _080C9976
_080C9970:
	movs r0, 0x3
	b _080C9976
_080C9974:
	movs r0, 0
_080C9976:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80C9908

	thumb_func_start sub_80C997C
sub_80C997C: @ 80C997C
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r4, _080C99E8 @ =gMapObjects
	adds r0, r4
	bl FieldObjectClearAnimIfSpecialAnimFinished
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FieldObjectClearAnim
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl npc_sync_anim_pause_bits
	adds r0, r5, 0
	bl PlayerTurnInPlace
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C99E8: .4byte gMapObjects
	thumb_func_end sub_80C997C

	thumb_func_start sub_80C99EC
sub_80C99EC: @ 80C99EC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C9A2C @ =gMapObjects
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C9A24
	ldr r1, _080C9A30 @ =gOtherText_ItemfinderResponding
	ldr r2, _080C9A34 @ =sub_80C9520
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C9A24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9A2C: .4byte gMapObjects
_080C9A30: .4byte gOtherText_ItemfinderResponding
_080C9A34: .4byte sub_80C9520
	thumb_func_end sub_80C99EC

	thumb_func_start sub_80C9A38
sub_80C9A38: @ 80C9A38
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C9AB4 @ =gTasks + 0x8
	adds r4, r0, r1
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C9AB8 @ =gMapObjects
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080C9A78
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080C9AAE
_080C9A78:
	ldr r1, _080C9ABC @ =gUnknown_083D61F0
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80C997C
	movs r0, 0x1
	strh r0, [r4, 0x4]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x6]
	adds r0, 0x1
	strh r0, [r4, 0x6]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080C9AAE
	ldr r1, _080C9AC0 @ =gOtherText_ItemfinderFoundItem
	ldr r2, _080C9AC4 @ =sub_80C9520
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C9AAE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9AB4: .4byte gTasks + 0x8
_080C9AB8: .4byte gMapObjects
_080C9ABC: .4byte gUnknown_083D61F0
_080C9AC0: .4byte gOtherText_ItemfinderFoundItem
_080C9AC4: .4byte sub_80C9520
	thumb_func_end sub_80C9A38

	thumb_func_start ItemUseOutOfBattle_PokeblockCase
ItemUseOutOfBattle_PokeblockCase: @ 80C9AC8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C9AF4
	ldr r0, _080C9AF0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl DisplayDadsAdviceCannotUseItemMessage
	b _080C9B2A
	.align 2, 0
_080C9AF0: .4byte gTasks
_080C9AF4:
	ldr r0, _080C9B14 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0xC
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _080C9B18
	movs r0, 0
	bl sub_810BA7C
	adds r0, r4, 0
	bl unknown_ItemMenu_Confirm
	b _080C9B2A
	.align 2, 0
_080C9B14: .4byte gTasks
_080C9B18:
	ldr r1, _080C9B30 @ =gUnknown_0300485C
	ldr r0, _080C9B34 @ =sub_8080E28
	str r0, [r1]
	movs r0, 0x1
	bl sub_810BA7C
	adds r0, r5, 0
	bl sub_80C9038
_080C9B2A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9B30: .4byte gUnknown_0300485C
_080C9B34: .4byte sub_8080E28
	thumb_func_end ItemUseOutOfBattle_PokeblockCase

	thumb_func_start ItemUseOutOfBattle_CoinCase
ItemUseOutOfBattle_CoinCase: @ 80C9B38
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080C9B8C @ =gStringVar1
	bl GetCoins
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	ldr r4, _080C9B90 @ =gStringVar4
	ldr r1, _080C9B94 @ =gOtherText_Coins3
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r1, _080C9B98 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080C9BA0
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r2, _080C9B9C @ =sub_80A5C48
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080C9BAC
	.align 2, 0
_080C9B8C: .4byte gStringVar1
_080C9B90: .4byte gStringVar4
_080C9B94: .4byte gOtherText_Coins3
_080C9B98: .4byte gTasks
_080C9B9C: .4byte sub_80A5C48
_080C9BA0:
	ldr r2, _080C9BB4 @ =sub_80A5C9C
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C9BAC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9BB4: .4byte sub_80A5C9C
	thumb_func_end ItemUseOutOfBattle_CoinCase

	thumb_func_start sub_80C9BB8
sub_80C9BB8: @ 80C9BB8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080C9BD4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C9BD0
	adds r0, r2, 0
	bl sub_80A5C48
_080C9BD0:
	pop {r0}
	bx r0
	.align 2, 0
_080C9BD4: .4byte gMain
	thumb_func_end sub_80C9BB8

	thumb_func_start sub_80C9BD8
sub_80C9BD8: @ 80C9BD8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080C9BF4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C9BF0
	adds r0, r2, 0
	bl sub_80A5C9C
_080C9BF0:
	pop {r0}
	bx r0
	.align 2, 0
_080C9BF4: .4byte gMain
	thumb_func_end sub_80C9BD8

	thumb_func_start unref_sub_80C9BF8
unref_sub_80C9BF8: @ 80C9BF8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080C9C3C @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080C9C4C
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r4, _080C9C40 @ =gUnknown_083D61DC
	ldr r0, _080C9C44 @ =word_203855E
	ldrh r0, [r0]
	bl ItemId_GetSecondaryId
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r1, [r0]
	ldr r2, _080C9C48 @ =sub_80C9BB8
	adds r0, r5, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080C9C68
	.align 2, 0
_080C9C3C: .4byte gTasks
_080C9C40: .4byte gUnknown_083D61DC
_080C9C44: .4byte word_203855E
_080C9C48: .4byte sub_80C9BB8
_080C9C4C:
	ldr r4, _080C9C70 @ =gUnknown_083D61DC
	ldr r0, _080C9C74 @ =word_203855E
	ldrh r0, [r0]
	bl ItemId_GetSecondaryId
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r1, [r0]
	ldr r2, _080C9C78 @ =sub_80C9BD8
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080C9C68:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9C70: .4byte gUnknown_083D61DC
_080C9C74: .4byte word_203855E
_080C9C78: .4byte sub_80C9BD8
	thumb_func_end unref_sub_80C9BF8

	thumb_func_start sub_80C9C7C
sub_80C9C7C: @ 80C9C7C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	bl IsPlayerFacingPlantedBerryTree
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C9CE4
	ldr r1, _080C9CC8 @ =gUnknown_03005D00
	ldr r0, _080C9CCC @ =sub_80C9D00
	str r0, [r1]
	ldr r1, _080C9CD0 @ =gUnknown_0300485C
	ldr r0, _080C9CD4 @ =sub_80A5CC4
	str r0, [r1]
	ldr r1, _080C9CD8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r2, _080C9CDC @ =c2_exit_to_overworld_2_switch
	lsrs r1, r2, 16
	movs r3, 0
	strh r1, [r0, 0x18]
	strh r2, [r0, 0x1A]
	ldr r1, _080C9CE0 @ =sub_80A5B00
	str r1, [r0]
	movs r0, 0x1
	negs r0, r0
	str r3, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _080C9CF4
	.align 2, 0
_080C9CC8: .4byte gUnknown_03005D00
_080C9CCC: .4byte sub_80C9D00
_080C9CD0: .4byte gUnknown_0300485C
_080C9CD4: .4byte sub_80A5CC4
_080C9CD8: .4byte gTasks
_080C9CDC: .4byte c2_exit_to_overworld_2_switch
_080C9CE0: .4byte sub_80A5B00
_080C9CE4:
	ldr r0, _080C9CFC @ =word_203855E
	ldrh r0, [r0]
	bl ItemId_GetFieldFunc
	adds r1, r0, 0
	adds r0, r4, 0
	bl _call_via_r1
_080C9CF4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9CFC: .4byte word_203855E
	thumb_func_end sub_80C9C7C

	thumb_func_start sub_80C9D00
sub_80C9D00: @ 80C9D00
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080C9D28 @ =word_203855E
	ldrh r0, [r0]
	movs r1, 0x1
	bl RemoveBagItem
	bl ScriptContext2_Enable
	ldr r0, _080C9D2C @ =gUnknown_081A1654
	bl ScriptContext1_SetupScript
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9D28: .4byte word_203855E
_080C9D2C: .4byte gUnknown_081A1654
	thumb_func_end sub_80C9D00

	thumb_func_start ItemUseOutOfBattle_WailmerPail
ItemUseOutOfBattle_WailmerPail: @ 80C9D30
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl WaterBerryTree
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C9D58
	ldr r1, _080C9D50 @ =gUnknown_03005D00
	ldr r0, _080C9D54 @ =sub_80C9D74
	str r0, [r1]
	adds r0, r4, 0
	bl SetUpItemUseOnFieldCallback
	b _080C9D6A
	.align 2, 0
_080C9D50: .4byte gUnknown_03005D00
_080C9D54: .4byte sub_80C9D74
_080C9D58:
	ldr r0, _080C9D70 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl DisplayDadsAdviceCannotUseItemMessage
_080C9D6A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9D70: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_WailmerPail

	thumb_func_start sub_80C9D74
sub_80C9D74: @ 80C9D74
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ScriptContext2_Enable
	ldr r0, _080C9D94 @ =gUnknown_081A168F
	bl ScriptContext1_SetupScript
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9D94: .4byte gUnknown_081A168F
	thumb_func_end sub_80C9D74

	thumb_func_start sub_80C9D98
sub_80C9D98: @ 80C9D98
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9DAC @ =gUnknown_02038561
	movs r1, 0
	strb r1, [r2]
	bl unknown_ItemMenu_Confirm
	pop {r0}
	bx r0
	.align 2, 0
_080C9DAC: .4byte gUnknown_02038561
	thumb_func_end sub_80C9D98

	thumb_func_start ItemUseOutOfBattle_Medicine
ItemUseOutOfBattle_Medicine: @ 80C9DB0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9DC4 @ =gUnknown_03004AE4
	ldr r1, _080C9DC8 @ =sub_806FE2C
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080C9DC4: .4byte gUnknown_03004AE4
_080C9DC8: .4byte sub_806FE2C
	thumb_func_end ItemUseOutOfBattle_Medicine

	thumb_func_start ItemUseOutOfBattle_SacredAsh
ItemUseOutOfBattle_SacredAsh: @ 80C9DCC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080C9DDC @ =gUnknown_03005CE0
	movs r0, 0
	strb r0, [r1]
	movs r5, 0
	b _080C9DE6
	.align 2, 0
_080C9DDC: .4byte gUnknown_03005CE0
_080C9DE0:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_080C9DE6:
	cmp r5, 0x5
	bhi _080C9E10
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080C9E28 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _080C9DE0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _080C9DE0
	ldr r0, _080C9E2C @ =gUnknown_03005CE0
	strb r5, [r0]
_080C9E10:
	ldr r1, _080C9E30 @ =gUnknown_03004AE4
	ldr r0, _080C9E34 @ =sub_8070048
	str r0, [r1]
	ldr r1, _080C9E38 @ =gUnknown_02038561
	movs r0, 0x4
	strb r0, [r1]
	adds r0, r6, 0
	bl unknown_ItemMenu_Confirm
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C9E28: .4byte gPlayerParty
_080C9E2C: .4byte gUnknown_03005CE0
_080C9E30: .4byte gUnknown_03004AE4
_080C9E34: .4byte sub_8070048
_080C9E38: .4byte gUnknown_02038561
	thumb_func_end ItemUseOutOfBattle_SacredAsh

	thumb_func_start ItemUseOutOfBattle_PPRecovery
ItemUseOutOfBattle_PPRecovery: @ 80C9E3C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9E50 @ =gUnknown_03004AE4
	ldr r1, _080C9E54 @ =dp05_ether
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080C9E50: .4byte gUnknown_03004AE4
_080C9E54: .4byte dp05_ether
	thumb_func_end ItemUseOutOfBattle_PPRecovery

	thumb_func_start ItemUseOutOfBattle_PPUp
ItemUseOutOfBattle_PPUp: @ 80C9E58
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9E6C @ =gUnknown_03004AE4
	ldr r1, _080C9E70 @ =dp05_pp_up
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080C9E6C: .4byte gUnknown_03004AE4
_080C9E70: .4byte dp05_pp_up
	thumb_func_end ItemUseOutOfBattle_PPUp

	thumb_func_start ItemUseOutOfBattle_RareCandy
ItemUseOutOfBattle_RareCandy: @ 80C9E74
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9E88 @ =gUnknown_03004AE4
	ldr r1, _080C9E8C @ =sub_8070680
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080C9E88: .4byte gUnknown_03004AE4
_080C9E8C: .4byte sub_8070680
	thumb_func_end ItemUseOutOfBattle_RareCandy

	thumb_func_start ItemUseOutOfBattle_TMHM
ItemUseOutOfBattle_TMHM: @ 80C9E90
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r0, _080C9EBC @ =word_203855E
	ldrh r1, [r0]
	movs r0, 0xA9
	lsls r0, 1
	cmp r1, r0
	bls _080C9EC8
	ldr r1, _080C9EC0 @ =gOtherText_BootedHM
	ldr r2, _080C9EC4 @ =sub_80C9EE4
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080C9ED4
	.align 2, 0
_080C9EBC: .4byte word_203855E
_080C9EC0: .4byte gOtherText_BootedHM
_080C9EC4: .4byte sub_80C9EE4
_080C9EC8:
	ldr r1, _080C9EDC @ =gOtherText_BootedTM
	ldr r2, _080C9EE0 @ =sub_80C9EE4
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080C9ED4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9EDC: .4byte gOtherText_BootedTM
_080C9EE0: .4byte sub_80C9EE4
	thumb_func_end ItemUseOutOfBattle_TMHM

	thumb_func_start sub_80C9EE4
sub_80C9EE4: @ 80C9EE4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	bl PlaySE
	ldr r1, _080C9F08 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080C9F0C @ =sub_80C9F10
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9F08: .4byte gTasks
_080C9F0C: .4byte sub_80C9F10
	thumb_func_end sub_80C9EE4

	thumb_func_start sub_80C9F10
sub_80C9F10: @ 80C9F10
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080C9F64 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080C9F2A
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080C9F5C
_080C9F2A:
	ldr r4, _080C9F68 @ =gStringVar1
	ldr r0, _080C9F6C @ =word_203855E
	ldrh r0, [r0]
	bl ItemIdToBattleMoveId
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xD
	muls r1, r0
	ldr r0, _080C9F70 @ =gMoveNames
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	ldr r4, _080C9F74 @ =gStringVar4
	ldr r1, _080C9F78 @ =gOtherText_ContainsMove
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080C9F7C @ =sub_80C9F80
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080C9F5C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9F64: .4byte gMain
_080C9F68: .4byte gStringVar1
_080C9F6C: .4byte word_203855E
_080C9F70: .4byte gMoveNames
_080C9F74: .4byte gStringVar4
_080C9F78: .4byte gOtherText_ContainsMove
_080C9F7C: .4byte sub_80C9F80
	thumb_func_end sub_80C9F10

	thumb_func_start sub_80C9F80
sub_80C9F80: @ 80C9F80
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	movs r1, 0x7
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _080C9FB8 @ =gBG1TilemapBuffer
	movs r1, 0x4
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	movs r1, 0x8
	movs r2, 0x8
	movs r3, 0x5
	bl sub_80A3FA0
	ldr r1, _080C9FBC @ =gUnknown_083D61F4
	adds r0, r4, 0
	bl sub_80F914C
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C9FB8: .4byte gBG1TilemapBuffer
_080C9FBC: .4byte gUnknown_083D61F4
	thumb_func_end sub_80C9F80

	thumb_func_start sub_80C9FC0
sub_80C9FC0: @ 80C9FC0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080C9FD4 @ =gUnknown_03004AE4
	ldr r1, _080C9FD8 @ =sub_806F06C
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080C9FD4: .4byte gUnknown_03004AE4
_080C9FD8: .4byte sub_806F06C
	thumb_func_end sub_80C9FC0

	thumb_func_start sub_80C9FDC
sub_80C9FDC: @ 80C9FDC
	push {r4,lr}
	ldr r4, _080CA004 @ =word_203855E
	ldrh r0, [r4]
	movs r1, 0x1
	bl RemoveBagItem
	bl sub_80A3E0C
	ldrh r0, [r4]
	ldr r1, _080CA008 @ =gStringVar2
	bl CopyItemName
	ldr r0, _080CA00C @ =gStringVar4
	ldr r1, _080CA010 @ =gOtherText_UsedItem
	bl StringExpandPlaceholders
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA004: .4byte word_203855E
_080CA008: .4byte gStringVar2
_080CA00C: .4byte gStringVar4
_080CA010: .4byte gOtherText_UsedItem
	thumb_func_end sub_80C9FDC

	thumb_func_start ItemUseOutOfBattle_Repel
ItemUseOutOfBattle_Repel: @ 80CA014
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _080CA050 @ =0x00004021
	adds r0, r5, 0
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	bne _080CA060
	ldr r0, _080CA054 @ =word_203855E
	ldrh r0, [r0]
	bl ItemId_GetHoldEffectParam
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl VarSet
	bl sub_80C9FDC
	ldr r1, _080CA058 @ =gStringVar4
	ldr r2, _080CA05C @ =sub_80A5C48
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080CA06C
	.align 2, 0
_080CA050: .4byte 0x00004021
_080CA054: .4byte word_203855E
_080CA058: .4byte gStringVar4
_080CA05C: .4byte sub_80A5C48
_080CA060:
	ldr r1, _080CA074 @ =gOtherText_RepelLingers
	ldr r2, _080CA078 @ =sub_80A5C48
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080CA06C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA074: .4byte gOtherText_RepelLingers
_080CA078: .4byte sub_80A5C48
	thumb_func_end ItemUseOutOfBattle_Repel

	thumb_func_start sub_80CA07C
sub_80CA07C: @ 80CA07C
	push {lr}
	bl sub_80A3E0C
	ldr r0, _080CA090 @ =word_203855E
	ldrh r0, [r0]
	ldr r1, _080CA094 @ =gStringVar2
	bl CopyItemName
	pop {r0}
	bx r0
	.align 2, 0
_080CA090: .4byte word_203855E
_080CA094: .4byte gStringVar2
	thumb_func_end sub_80CA07C

	thumb_func_start sub_80CA098
sub_80CA098: @ 80CA098
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080CA0D0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080CA0C8
	movs r0, 0x75
	bl PlaySE
	ldr r1, _080CA0D4 @ =gStringVar4
	ldr r2, _080CA0D8 @ =sub_80A5C48
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080CA0C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA0D0: .4byte gTasks
_080CA0D4: .4byte gStringVar4
_080CA0D8: .4byte sub_80A5C48
	thumb_func_end sub_80CA098

	thumb_func_start ItemUseOutOfBattle_BlackWhiteFlute
ItemUseOutOfBattle_BlackWhiteFlute: @ 80CA0DC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r0, _080CA10C @ =word_203855E
	ldrh r0, [r0]
	cmp r0, 0x2B
	bne _080CA124
	ldr r0, _080CA110 @ =0x0000084d
	bl FlagSet
	ldr r0, _080CA114 @ =0x0000084e
	bl FlagReset
	bl sub_80CA07C
	ldr r0, _080CA118 @ =gStringVar4
	ldr r1, _080CA11C @ =gOtherText_UsedFlute
	bl StringExpandPlaceholders
	ldr r1, _080CA120 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	b _080CA146
	.align 2, 0
_080CA10C: .4byte word_203855E
_080CA110: .4byte 0x0000084d
_080CA114: .4byte 0x0000084e
_080CA118: .4byte gStringVar4
_080CA11C: .4byte gOtherText_UsedFlute
_080CA120: .4byte gTasks
_080CA124:
	cmp r0, 0x2A
	bne _080CA152
	ldr r0, _080CA158 @ =0x0000084e
	bl FlagSet
	ldr r0, _080CA15C @ =0x0000084d
	bl FlagReset
	bl sub_80CA07C
	ldr r0, _080CA160 @ =gStringVar4
	ldr r1, _080CA164 @ =gOtherText_UsedRepel
	bl StringExpandPlaceholders
	ldr r1, _080CA168 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
_080CA146:
	lsls r0, 3
	adds r0, r1
	ldr r1, _080CA16C @ =sub_80CA098
	str r1, [r0]
	movs r1, 0
	strh r1, [r0, 0x26]
_080CA152:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA158: .4byte 0x0000084e
_080CA15C: .4byte 0x0000084d
_080CA160: .4byte gStringVar4
_080CA164: .4byte gOtherText_UsedRepel
_080CA168: .4byte gTasks
_080CA16C: .4byte sub_80CA098
	thumb_func_end ItemUseOutOfBattle_BlackWhiteFlute

	thumb_func_start task08_080A1C44
task08_080A1C44: @ 80CA170
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl player_avatar_init_params_reset
	bl sub_80878A8
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end task08_080A1C44

	thumb_func_start sub_80CA18C
sub_80CA18C: @ 80CA18C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8053014
	bl sub_80C9FDC
	ldr r1, _080CA1BC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
	ldr r1, _080CA1C0 @ =gStringVar4
	ldr r2, _080CA1C4 @ =task08_080A1C44
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA1BC: .4byte gTasks
_080CA1C0: .4byte gStringVar4
_080CA1C4: .4byte task08_080A1C44
	thumb_func_end sub_80CA18C

	thumb_func_start sub_80CA1C8
sub_80CA1C8: @ 80CA1C8
	push {lr}
	ldr r0, _080CA1D8 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x4
	beq _080CA1DC
	movs r0, 0
	b _080CA1DE
	.align 2, 0
_080CA1D8: .4byte gMapHeader
_080CA1DC:
	movs r0, 0x1
_080CA1DE:
	pop {r1}
	bx r1
	thumb_func_end sub_80CA1C8

	thumb_func_start ItemUseOutOfBattle_EscapeRope
ItemUseOutOfBattle_EscapeRope: @ 80CA1E4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80CA1C8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CA20C
	ldr r1, _080CA204 @ =gUnknown_03005D00
	ldr r0, _080CA208 @ =sub_80CA18C
	str r0, [r1]
	adds r0, r4, 0
	bl SetUpItemUseOnFieldCallback
	b _080CA21E
	.align 2, 0
_080CA204: .4byte gUnknown_03005D00
_080CA208: .4byte sub_80CA18C
_080CA20C:
	ldr r0, _080CA224 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl DisplayDadsAdviceCannotUseItemMessage
_080CA21E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA224: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_EscapeRope

	thumb_func_start ItemUseOutOfBattle_EvolutionStone
ItemUseOutOfBattle_EvolutionStone: @ 80CA228
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA23C @ =gUnknown_03004AE4
	ldr r1, _080CA240 @ =sub_8070DBC
	str r1, [r2]
	bl sub_80C9D98
	pop {r0}
	bx r0
	.align 2, 0
_080CA23C: .4byte gUnknown_03004AE4
_080CA240: .4byte sub_8070DBC
	thumb_func_end ItemUseOutOfBattle_EvolutionStone

	thumb_func_start ItemUseInBattle_PokeBall
ItemUseInBattle_PokeBall: @ 80CA244
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl PlayerPartyAndPokemonStorageFull
	lsls r0, 24
	cmp r0, 0
	bne _080CA26C
	ldr r0, _080CA268 @ =word_203855E
	ldrh r0, [r0]
	movs r1, 0x1
	bl RemoveBagItem
	adds r0, r4, 0
	bl sub_80A7094
	b _080CA284
	.align 2, 0
_080CA268: .4byte word_203855E
_080CA26C:
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r1, _080CA28C @ =gOtherText_BoxIsFull
	ldr r2, _080CA290 @ =sub_80A5C48
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080CA284:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA28C: .4byte gOtherText_BoxIsFull
_080CA290: .4byte sub_80A5C48
	thumb_func_end ItemUseInBattle_PokeBall

	thumb_func_start sub_80CA294
sub_80CA294: @ 80CA294
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080CA2B8 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080CA2AE
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080CA2B4
_080CA2AE:
	adds r0, r2, 0
	bl sub_80A7094
_080CA2B4:
	pop {r0}
	bx r0
	.align 2, 0
_080CA2B8: .4byte gMain
	thumb_func_end sub_80CA294

	thumb_func_start sub_80CA2BC
sub_80CA2BC: @ 80CA2BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080CA304 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080CA2FC
	movs r0, 0x1
	bl PlaySE
	ldr r4, _080CA308 @ =word_203855E
	ldrh r0, [r4]
	movs r1, 0x1
	bl RemoveBagItem
	ldrh r0, [r4]
	bl sub_803F378
	adds r1, r0, 0
	ldr r2, _080CA30C @ =sub_80CA294
	adds r0, r5, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080CA2FC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA304: .4byte gTasks
_080CA308: .4byte word_203855E
_080CA30C: .4byte sub_80CA294
	thumb_func_end sub_80CA2BC

	thumb_func_start ItemUseInBattle_StatIncrease
ItemUseInBattle_StatIncrease: @ 80CA310
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080CA35C @ =gUnknown_02024A6A
	ldr r0, _080CA360 @ =gUnknown_02024E6C
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r4, [r0]
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	movs r0, 0x64
	muls r0, r4
	ldr r1, _080CA364 @ =gPlayerParty
	adds r0, r1
	ldr r1, _080CA368 @ =word_203855E
	ldrh r1, [r1]
	lsls r4, 24
	lsrs r4, 24
	adds r2, r4, 0
	movs r3, 0
	bl ExecuteTableBasedItemEffect_
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080CA374
	ldr r1, _080CA36C @ =gOtherText_WontHaveAnyEffect
	ldr r2, _080CA370 @ =sub_80A5C48
	adds r0, r5, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080CA384
	.align 2, 0
_080CA35C: .4byte gUnknown_02024A6A
_080CA360: .4byte gUnknown_02024E6C
_080CA364: .4byte gPlayerParty
_080CA368: .4byte word_203855E
_080CA36C: .4byte gOtherText_WontHaveAnyEffect
_080CA370: .4byte sub_80A5C48
_080CA374:
	ldr r0, _080CA38C @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080CA390 @ =sub_80CA2BC
	str r0, [r1]
	strh r2, [r1, 0x26]
_080CA384:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA38C: .4byte gTasks
_080CA390: .4byte sub_80CA2BC
	thumb_func_end ItemUseInBattle_StatIncrease

	thumb_func_start sub_80CA394
sub_80CA394: @ 80CA394
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080CA3BC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080CA3B4
	bl sub_8094E4C
	bl gpu_pal_allocator_reset__manage_upper_four
	adds r0, r4, 0
	bl DestroyTask
_080CA3B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA3BC: .4byte gPaletteFade
	thumb_func_end sub_80CA394

	thumb_func_start sub_80CA3C0
sub_80CA3C0: @ 80CA3C0
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA3EC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080CA3F0 @ =sub_80CA394
	str r0, [r1]
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
_080CA3EC: .4byte gTasks
_080CA3F0: .4byte sub_80CA394
	thumb_func_end sub_80CA3C0

	thumb_func_start ItemUseInBattle_Medicine
ItemUseInBattle_Medicine: @ 80CA3F4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA408 @ =gUnknown_03004AE4
	ldr r1, _080CA40C @ =sub_806FE2C
	str r1, [r2]
	bl sub_80CA3C0
	pop {r0}
	bx r0
	.align 2, 0
_080CA408: .4byte gUnknown_03004AE4
_080CA40C: .4byte sub_806FE2C
	thumb_func_end ItemUseInBattle_Medicine

	thumb_func_start unref_sub_80CA410
unref_sub_80CA410: @ 80CA410
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA424 @ =gUnknown_03004AE4
	ldr r1, _080CA428 @ =sub_8070048
	str r1, [r2]
	bl sub_80CA3C0
	pop {r0}
	bx r0
	.align 2, 0
_080CA424: .4byte gUnknown_03004AE4
_080CA428: .4byte sub_8070048
	thumb_func_end unref_sub_80CA410

	thumb_func_start ItemUseInBattle_PPRecovery
ItemUseInBattle_PPRecovery: @ 80CA42C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA440 @ =gUnknown_03004AE4
	ldr r1, _080CA444 @ =dp05_ether
	str r1, [r2]
	bl sub_80CA3C0
	pop {r0}
	bx r0
	.align 2, 0
_080CA440: .4byte gUnknown_03004AE4
_080CA444: .4byte dp05_ether
	thumb_func_end ItemUseInBattle_PPRecovery

	thumb_func_start unref_sub_80CA448
unref_sub_80CA448: @ 80CA448
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r4, _080CA494 @ =word_203855E
	ldrh r1, [r4]
	movs r0, 0
	movs r2, 0
	bl ExecuteTableBasedItemEffect__
	lsls r0, 24
	cmp r0, 0
	bne _080CA4AC
	ldrh r0, [r4]
	movs r1, 0x1
	bl RemoveBagItem
	ldr r0, _080CA498 @ =gPlayerParty
	ldr r1, _080CA49C @ =gStringVar1
	bl GetMonNickname
	ldr r4, _080CA4A0 @ =gStringVar4
	ldr r1, _080CA4A4 @ =gOtherText_SnapConfusion
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080CA4A8 @ =sub_80A7094
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080CA4B8
	.align 2, 0
_080CA494: .4byte word_203855E
_080CA498: .4byte gPlayerParty
_080CA49C: .4byte gStringVar1
_080CA4A0: .4byte gStringVar4
_080CA4A4: .4byte gOtherText_SnapConfusion
_080CA4A8: .4byte sub_80A7094
_080CA4AC:
	ldr r1, _080CA4C0 @ =gOtherText_WontHaveAnyEffect
	ldr r2, _080CA4C4 @ =sub_80A5C48
	adds r0, r5, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
_080CA4B8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA4C0: .4byte gOtherText_WontHaveAnyEffect
_080CA4C4: .4byte sub_80A5C48
	thumb_func_end unref_sub_80CA448

	thumb_func_start ItemUseInBattle_Escape
ItemUseInBattle_Escape: @ 80CA4C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	movs r1, 0xD
	movs r2, 0xD
	movs r3, 0x14
	bl MenuZeroFillWindowRect
	ldr r0, _080CA4F8 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _080CA504
	bl sub_80C9FDC
	ldr r1, _080CA4FC @ =gStringVar4
	ldr r2, _080CA500 @ =sub_80A7094
	adds r0, r4, 0
	movs r3, 0x1
	bl DisplayItemMessageOnField
	b _080CA516
	.align 2, 0
_080CA4F8: .4byte gUnknown_020239F8
_080CA4FC: .4byte gStringVar4
_080CA500: .4byte sub_80A7094
_080CA504:
	ldr r0, _080CA51C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl DisplayDadsAdviceCannotUseItemMessage
_080CA516:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA51C: .4byte gTasks
	thumb_func_end ItemUseInBattle_Escape

	thumb_func_start ItemUseOutOfBattle_EnigmaBerry
ItemUseOutOfBattle_EnigmaBerry: @ 80CA520
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080CA544 @ =word_203855E
	ldrh r0, [r0]
	bl sub_8070E48
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	cmp r0, 0x14
	bls _080CA53A
	b _080CA62C
_080CA53A:
	lsls r0, 2
	ldr r1, _080CA548 @ =_080CA54C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CA544: .4byte word_203855E
_080CA548: .4byte _080CA54C
	.align 2, 0
_080CA54C:
	.4byte _080CA5D8
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA62C
	.4byte _080CA62C
	.4byte _080CA5BC
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA5A0
	.4byte _080CA62C
	.4byte _080CA5F4
	.4byte _080CA5F4
	.4byte _080CA610
_080CA5A0:
	ldr r0, _080CA5B8 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_Medicine
	b _080CA640
	.align 2, 0
_080CA5B8: .4byte gTasks
_080CA5BC:
	ldr r0, _080CA5D4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_SacredAsh
	b _080CA640
	.align 2, 0
_080CA5D4: .4byte gTasks
_080CA5D8:
	ldr r0, _080CA5F0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_RareCandy
	b _080CA640
	.align 2, 0
_080CA5F0: .4byte gTasks
_080CA5F4:
	ldr r0, _080CA60C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_PPUp
	b _080CA640
	.align 2, 0
_080CA60C: .4byte gTasks
_080CA610:
	ldr r0, _080CA628 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_PPRecovery
	b _080CA640
	.align 2, 0
_080CA628: .4byte gTasks
_080CA62C:
	ldr r0, _080CA648 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x4
	strh r0, [r1, 0x26]
	adds r0, r4, 0
	bl ItemUseOutOfBattle_CannotUse
_080CA640:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CA648: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_EnigmaBerry

	thumb_func_start ItemUseInBattle_EnigmaBerry
ItemUseInBattle_EnigmaBerry: @ 80CA64C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080CA66C @ =word_203855E
	ldrh r0, [r0]
	bl sub_8070E48
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x15
	bhi _080CA6E4
	lsls r0, 2
	ldr r1, _080CA670 @ =_080CA674
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CA66C: .4byte word_203855E
_080CA670: .4byte _080CA674
	.align 2, 0
_080CA674:
	.4byte _080CA6CC
	.4byte _080CA6E4
	.4byte _080CA6D4
	.4byte _080CA6D4
	.4byte _080CA6D4
	.4byte _080CA6D4
	.4byte _080CA6D4
	.4byte _080CA6D4
	.4byte _080CA6D4
	.4byte _080CA6D4
	.4byte _080CA6E4
	.4byte _080CA6D4
	.4byte _080CA6E4
	.4byte _080CA6E4
	.4byte _080CA6E4
	.4byte _080CA6E4
	.4byte _080CA6E4
	.4byte _080CA6E4
	.4byte _080CA6E4
	.4byte _080CA6E4
	.4byte _080CA6E4
	.4byte _080CA6DC
_080CA6CC:
	adds r0, r4, 0
	bl ItemUseInBattle_StatIncrease
	b _080CA6EA
_080CA6D4:
	adds r0, r4, 0
	bl ItemUseInBattle_Medicine
	b _080CA6EA
_080CA6DC:
	adds r0, r4, 0
	bl ItemUseInBattle_PPRecovery
	b _080CA6EA
_080CA6E4:
	adds r0, r4, 0
	bl ItemUseOutOfBattle_CannotUse
_080CA6EA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ItemUseInBattle_EnigmaBerry

	thumb_func_start ItemUseOutOfBattle_CannotUse
ItemUseOutOfBattle_CannotUse: @ 80CA6F0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080CA70C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r1, [r1, 0xC]
	bl DisplayDadsAdviceCannotUseItemMessage
	pop {r0}
	bx r0
	.align 2, 0
_080CA70C: .4byte gTasks
	thumb_func_end ItemUseOutOfBattle_CannotUse

	.align 2, 0 @ Don't pad with nop.
