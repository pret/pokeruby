	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CheckForFieldObjectCollision
CheckForFieldObjectCollision: @ 8058E20
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, [sp, 0x24]
	lsls r1, 16
	lsls r2, 16
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r4, 24
	lsrs r4, 24
	mov r10, r4
	lsrs r7, r1, 16
	asrs r5, r1, 16
	lsrs r1, r2, 16
	mov r9, r1
	asrs r4, r2, 16
	adds r1, r5, 0
	adds r2, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	cmp r0, 0x3
	bne _08058E70
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_8058EF0
	lsls r0, 24
	cmp r0, 0
	beq _08058E70
	movs r0, 0x5
	b _08058EDE
_08058E70:
	lsls r5, r7, 16
	asrs r0, r5, 16
	mov r8, r0
	mov r1, r9
	lsls r4, r1, 16
	asrs r7, r4, 16
	adds r1, r7, 0
	adds r2, r6, 0
	bl ShouldJumpLedge
	lsls r0, 24
	cmp r0, 0
	beq _08058E94
	movs r0, 0x2B
	bl sav12_xor_increment
	movs r0, 0x6
	b _08058EDE
_08058E94:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _08058EB0
	mov r0, r8
	adds r1, r7, 0
	adds r2, r6, 0
	bl sub_8058F6C
	lsls r0, 24
	cmp r0, 0
	beq _08058EB0
	movs r0, 0x7
	b _08058EDE
_08058EB0:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	bne _08058EDA
	asrs r5, 16
	asrs r4, 16
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl CheckForRotatingGatePuzzleCollision
	cmp r0, 0
	beq _08058ECE
	movs r0, 0x8
	b _08058EDE
_08058ECE:
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, r10
	mov r3, sp
	bl check_acro_bike_metatile
_08058EDA:
	mov r0, sp
	ldrb r0, [r0]
_08058EDE:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckForFieldObjectCollision

	thumb_func_start sub_8058EF0
sub_8058EF0: @ 8058EF0
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r0, _08058F3C @ =gPlayerAvatar
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08058F40
	lsls r5, r3, 16
	asrs r0, r5, 16
	lsls r4, 16
	asrs r1, r4, 16
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _08058F40
	lsrs r0, r5, 16
	lsrs r1, r4, 16
	movs r2, 0x3
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	bne _08058F40
	adds r0, r6, 0
	bl sub_805A20C
	movs r0, 0x1
	b _08058F42
	.align 2, 0
_08058F3C: .4byte gPlayerAvatar
_08058F40:
	movs r0, 0
_08058F42:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8058EF0

	thumb_func_start ShouldJumpLedge
ShouldJumpLedge: @ 8058F48
	push {lr}
	lsls r2, 24
	lsrs r2, 24
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl GetLedgeJumpDirection
	lsls r0, 24
	cmp r0, 0
	bne _08058F64
	movs r0, 0
	b _08058F66
_08058F64:
	movs r0, 0x1
_08058F66:
	pop {r1}
	bx r1
	thumb_func_end ShouldJumpLedge

	thumb_func_start sub_8058F6C
sub_8058F6C: @ 8058F6C
	push {r4-r7,lr}
	sub sp, 0x4
	mov r3, sp
	strh r0, [r3]
	mov r5, sp
	adds r5, 0x2
	strh r1, [r5]
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r0, _08059004 @ =0x00000829
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0805900C
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl GetFieldObjectIdByXY
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x10
	beq _0805900C
	ldr r0, _08059008 @ =gMapObjects
	lsls r1, r6, 3
	adds r1, r6
	lsls r1, 2
	adds r4, r1, r0
	ldrb r0, [r4, 0x5]
	cmp r0, 0x57
	bne _0805900C
	ldrh r1, [r4, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r4, 0x12]
	strh r0, [r5]
	adds r0, r7, 0
	mov r1, sp
	adds r2, r5, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r7, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805900C
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_8056F08
	lsls r0, 24
	cmp r0, 0
	bne _0805900C
	adds r0, r6, 0
	adds r1, r7, 0
	bl task_add_bump_boulder
	movs r0, 0x1
	b _0805900E
	.align 2, 0
_08059004: .4byte 0x00000829
_08059008: .4byte gMapObjects
_0805900C:
	movs r0, 0
_0805900E:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8058F6C

	thumb_func_start check_acro_bike_metatile
check_acro_bike_metatile: @ 8059018
	push {r4-r7,lr}
	adds r6, r3, 0
	lsls r2, 24
	lsrs r5, r2, 24
	movs r4, 0
	ldr r7, _08059040 @ =gUnknown_0830FBF8
_08059024:
	lsls r0, r4, 2
	adds r0, r7
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	beq _08059048
	ldr r0, _08059044 @ =gUnknown_0830FC0C
	adds r0, r4, r0
	ldrb r0, [r0]
	strb r0, [r6]
	b _08059052
	.align 2, 0
_08059040: .4byte gUnknown_0830FBF8
_08059044: .4byte gUnknown_0830FC0C
_08059048:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _08059024
_08059052:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end check_acro_bike_metatile

	thumb_func_start SetPlayerAvatarTransitionFlags
SetPlayerAvatarTransitionFlags: @ 8059058
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08059070 @ =gPlayerAvatar
	ldrb r1, [r2, 0x1]
	orrs r0, r1
	strb r0, [r2, 0x1]
	bl DoPlayerAvatarTransition
	pop {r0}
	bx r0
	.align 2, 0
_08059070: .4byte gPlayerAvatar
	thumb_func_end SetPlayerAvatarTransitionFlags

	thumb_func_start DoPlayerAvatarTransition
DoPlayerAvatarTransition: @ 8059074
	push {r4,r5,lr}
	ldr r0, _080590BC @ =gPlayerAvatar
	ldrb r4, [r0, 0x1]
	cmp r4, 0
	beq _080590B4
	movs r5, 0
_08059080:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080590A2
	ldr r0, _080590C0 @ =gUnknown_0830FC14
	lsls r2, r5, 2
	adds r2, r0
	ldr r0, _080590BC @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080590C4 @ =gMapObjects
	adds r0, r1
	ldr r1, [r2]
	bl _call_via_r1
_080590A2:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	lsrs r4, 1
	cmp r5, 0x7
	bls _08059080
	ldr r1, _080590BC @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x1]
_080590B4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080590BC: .4byte gPlayerAvatar
_080590C0: .4byte gUnknown_0830FC14
_080590C4: .4byte gMapObjects
	thumb_func_end DoPlayerAvatarTransition

	thumb_func_start nullsub_49
nullsub_49: @ 80590C8
	bx lr
	thumb_func_end nullsub_49

	thumb_func_start PlayerAvatarTransition_Normal
PlayerAvatarTransition_Normal: @ 80590CC
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x1
	bl SetPlayerAvatarStateMask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerAvatarTransition_Normal

	thumb_func_start PlayerAvatarTransition_MachBike
PlayerAvatarTransition_MachBike: @ 80590F8
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x2
	bl SetPlayerAvatarStateMask
	movs r0, 0
	movs r1, 0
	bl sub_80E5FCC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerAvatarTransition_MachBike

	thumb_func_start PlayerAvatarTransition_AcroBike
PlayerAvatarTransition_AcroBike: @ 805912C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x4
	bl SetPlayerAvatarStateMask
	movs r0, 0
	movs r1, 0
	bl sub_80E5FCC
	bl sub_80E6084
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerAvatarTransition_AcroBike

	thumb_func_start PlayerAvatarTransition_Surfing
PlayerAvatarTransition_Surfing: @ 8059164
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x8
	bl SetPlayerAvatarStateMask
	ldr r1, _080591B8 @ =gUnknown_0202FF84
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	str r0, [r1, 0x4]
	ldr r0, _080591BC @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	str r0, [r1, 0x8]
	movs r0, 0x8
	bl FieldEffectStart
	lsls r0, 24
	lsrs r0, 24
	strb r0, [r4, 0x1A]
	movs r1, 0x1
	bl sub_8127ED0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080591B8: .4byte gUnknown_0202FF84
_080591BC: .4byte gPlayerAvatar
	thumb_func_end PlayerAvatarTransition_Surfing

	thumb_func_start PlayerAvatarTransition_Underwater
PlayerAvatarTransition_Underwater: @ 80591C0
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x4
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x10
	bl SetPlayerAvatarStateMask
	ldrb r0, [r4, 0x4]
	bl sub_8128124
	strb r0, [r4, 0x1A]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerAvatarTransition_Underwater

	thumb_func_start sub_80591F4
sub_80591F4: @ 80591F4
	ldr r2, _08059200 @ =gPlayerAvatar
	ldrb r1, [r2]
	movs r0, 0x20
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08059200: .4byte gPlayerAvatar
	thumb_func_end sub_80591F4

	thumb_func_start sub_8059204
sub_8059204: @ 8059204
	push {r4,lr}
	ldr r4, _08059230 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r4, 0x3]
	bl PlayerIsAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08059242
	bl PlayerCheckIfAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	bne _08059234
	bl player_is_anim_in_certain_ranges
	lsls r0, 24
	cmp r0, 0
	bne _08059242
	movs r0, 0x1
	b _08059240
	.align 2, 0
_08059230: .4byte gPlayerAvatar
_08059234:
	bl sub_80592A4
	lsls r0, 24
	cmp r0, 0
	bne _08059242
	movs r0, 0x2
_08059240:
	strb r0, [r4, 0x3]
_08059242:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8059204

	thumb_func_start player_is_anim_in_certain_ranges
player_is_anim_in_certain_ranges: @ 8059248
	push {lr}
	ldr r2, _08059294 @ =gMapObjects
	ldr r0, _08059298 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1C]
	cmp r1, 0x3
	bls _0805928E
	adds r0, r1, 0
	subs r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _0805928E
	adds r0, r1, 0
	subs r0, 0x19
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xF
	bls _0805928E
	adds r0, r1, 0
	subs r0, 0x62
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB
	bls _0805928E
	adds r0, r1, 0
	subs r0, 0x7A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _0805929C
_0805928E:
	movs r0, 0x1
	b _0805929E
	.align 2, 0
_08059294: .4byte gMapObjects
_08059298: .4byte gPlayerAvatar
_0805929C:
	movs r0, 0
_0805929E:
	pop {r1}
	bx r1
	thumb_func_end player_is_anim_in_certain_ranges

	thumb_func_start sub_80592A4
sub_80592A4: @ 80592A4
	push {lr}
	bl player_is_anim_in_certain_ranges
	lsls r0, 24
	cmp r0, 0
	beq _080592C0
	ldr r0, _080592BC @ =gPlayerAvatar
	ldrb r0, [r0, 0x2]
	cmp r0, 0x1
	beq _080592C0
	movs r0, 0x1
	b _080592C2
	.align 2, 0
_080592BC: .4byte gPlayerAvatar
_080592C0:
	movs r0, 0
_080592C2:
	pop {r1}
	bx r1
	thumb_func_end sub_80592A4

	thumb_func_start PlayerIsAnimActive
PlayerIsAnimActive: @ 80592C8
	push {lr}
	ldr r0, _080592E4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080592E8 @ =gMapObjects
	adds r0, r1
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080592E4: .4byte gPlayerAvatar
_080592E8: .4byte gMapObjects
	thumb_func_end PlayerIsAnimActive

	thumb_func_start PlayerCheckIfAnimFinishedOrInactive
PlayerCheckIfAnimFinishedOrInactive: @ 80592EC
	push {lr}
	ldr r0, _08059308 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805930C @ =gMapObjects
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08059308: .4byte gPlayerAvatar
_0805930C: .4byte gMapObjects
	thumb_func_end PlayerCheckIfAnimFinishedOrInactive

	thumb_func_start player_set_x22
player_set_x22: @ 8059310
	ldr r3, _08059324 @ =gMapObjects
	ldr r1, _08059328 @ =gPlayerAvatar
	ldrb r2, [r1, 0x5]
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	adds r1, 0x22
	strb r0, [r1]
	bx lr
	.align 2, 0
_08059324: .4byte gMapObjects
_08059328: .4byte gPlayerAvatar
	thumb_func_end player_set_x22

	thumb_func_start player_get_x22
player_get_x22: @ 805932C
	ldr r2, _08059340 @ =gMapObjects
	ldr r0, _08059344 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x22
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08059340: .4byte gMapObjects
_08059344: .4byte gPlayerAvatar
	thumb_func_end player_get_x22

	thumb_func_start sub_8059348
sub_8059348: @ 8059348
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08059368 @ =gPlayerAvatar
	ldrb r2, [r0, 0x5]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805936C @ =gMapObjects
	adds r0, r2
	bl FieldObjectForceSetSpecialAnim
	pop {r0}
	bx r0
	.align 2, 0
_08059368: .4byte gPlayerAvatar
_0805936C: .4byte gMapObjects
	thumb_func_end sub_8059348

	thumb_func_start player_npc_set_state_and_x22_etc
player_npc_set_state_and_x22_etc: @ 8059370
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	bl PlayerIsAnimActive
	lsls r0, 24
	cmp r0, 0
	bne _0805939E
	adds r0, r4, 0
	bl player_set_x22
	ldr r0, _080593A4 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080593A8 @ =gMapObjects
	adds r0, r1
	adds r1, r5, 0
	bl FieldObjectSetSpecialAnim
_0805939E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080593A4: .4byte gPlayerAvatar
_080593A8: .4byte gMapObjects
	thumb_func_end player_npc_set_state_and_x22_etc

	thumb_func_start PlayerGoSpeed0
PlayerGoSpeed0: @ 80593AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetGoSpeed0AnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end PlayerGoSpeed0

	thumb_func_start sub_80593C4
sub_80593C4: @ 80593C4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060744
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_80593C4

	thumb_func_start npc_use_some_d2s
npc_use_some_d2s: @ 80593DC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl d2s_08064034
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end npc_use_some_d2s

	thumb_func_start sub_80593F4
sub_80593F4: @ 80593F4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_806079C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_80593F4

	thumb_func_start sub_805940C
sub_805940C: @ 805940C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80607F4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_805940C

	thumb_func_start PlayerOnBikeCollide
PlayerOnBikeCollide: @ 8059424
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl PlayCollisionSoundIfNotFacingWarp
	adds r0, r4, 0
	bl GetStepInPlaceDelay16AnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerOnBikeCollide

	thumb_func_start PlayerNotOnBikeCollide
PlayerNotOnBikeCollide: @ 8059448
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl PlayCollisionSoundIfNotFacingWarp
	adds r0, r4, 0
	bl GetStepInPlaceDelay32AnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerNotOnBikeCollide

	thumb_func_start PlayerFaceDirection
PlayerFaceDirection: @ 805946C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetFaceDirectionAnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end PlayerFaceDirection

	thumb_func_start PlayerTurnInPlace
PlayerTurnInPlace: @ 8059484
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetStepInPlaceDelay8AnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end PlayerTurnInPlace

	thumb_func_start PlayerJumpLedge
PlayerJumpLedge: @ 805949C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0xA
	bl PlaySE
	adds r0, r4, 0
	bl GetJumpLedgeAnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x8
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerJumpLedge

	thumb_func_start sub_80594C0
sub_80594C0: @ 80594C0
	push {r4,lr}
	ldr r4, _080594FC @ =gPlayerAvatar
	ldrb r0, [r4, 0x3]
	cmp r0, 0x2
	beq _080594CE
	cmp r0, 0
	bne _080594F6
_080594CE:
	bl player_should_look_direction_be_enforced_upon_movement
	lsls r0, 24
	cmp r0, 0
	beq _080594F6
	ldr r2, _08059500 @ =gMapObjects
	ldrb r1, [r4, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	lsls r0, 24
	lsrs r0, 24
	bl sub_8059348
_080594F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080594FC: .4byte gPlayerAvatar
_08059500: .4byte gMapObjects
	thumb_func_end sub_80594C0

	thumb_func_start sub_8059504
sub_8059504: @ 8059504
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80609D8
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_8059504

	thumb_func_start sub_805951C
sub_805951C: @ 805951C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060A04
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_805951C

	thumb_func_start sub_8059534
sub_8059534: @ 8059534
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060A30
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_8059534

	thumb_func_start sub_805954C
sub_805954C: @ 805954C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x22
	bl PlaySE
	adds r0, r4, 0
	bl sub_8060A5C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_805954C

	thumb_func_start sub_8059570
sub_8059570: @ 8059570
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x22
	bl PlaySE
	adds r0, r4, 0
	bl sub_8060A88
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8059570

	thumb_func_start sub_8059594
sub_8059594: @ 8059594
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x22
	bl PlaySE
	adds r0, r4, 0
	bl sub_8060AB4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x8
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8059594

	thumb_func_start sub_80595B8
sub_80595B8: @ 80595B8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x22
	bl PlaySE
	adds r0, r4, 0
	bl sub_8060878
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80595B8

	thumb_func_start sub_80595DC
sub_80595DC: @ 80595DC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	bl PlaySE
	adds r0, r4, 0
	bl sub_8060AE0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80595DC

	thumb_func_start sub_8059600
sub_8059600: @ 8059600
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060B0C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_8059600

	thumb_func_start sub_8059618
sub_8059618: @ 8059618
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060B38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_8059618

	thumb_func_start sub_8059630
sub_8059630: @ 8059630
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060B64
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_8059630

	thumb_func_start PlayCollisionSoundIfNotFacingWarp
PlayCollisionSoundIfNotFacingWarp: @ 8059648
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _080596B8 @ =gMapObjects
	ldr r0, _080596BC @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1E]
	ldr r2, _080596C0 @ =gUnknown_0830FC34
	subs r1, r4, 0x1
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080596B0
	cmp r4, 0x2
	bne _080596AA
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	movs r0, 0x2
	mov r1, sp
	adds r2, r4, 0
	bl MoveCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl is_tile_x69_2_warp_door
	lsls r0, 24
	cmp r0, 0
	bne _080596B0
_080596AA:
	movs r0, 0x7
	bl PlaySE
_080596B0:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080596B8: .4byte gMapObjects
_080596BC: .4byte gPlayerAvatar
_080596C0: .4byte gUnknown_0830FC34
	thumb_func_end PlayCollisionSoundIfNotFacingWarp

	thumb_func_start GetXYCoordsOneStepInFrontOfPlayer
GetXYCoordsOneStepInFrontOfPlayer: @ 80596C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r3, _08059700 @ =gMapObjects
	ldr r2, _08059704 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x10]
	strh r0, [r4]
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x12]
	strh r0, [r5]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl MoveCoords
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059700: .4byte gMapObjects
_08059704: .4byte gPlayerAvatar
	thumb_func_end GetXYCoordsOneStepInFrontOfPlayer

	thumb_func_start PlayerGetDestCoords
PlayerGetDestCoords: @ 8059708
	push {r4,r5,lr}
	ldr r5, _08059730 @ =gMapObjects
	ldr r4, _08059734 @ =gPlayerAvatar
	ldrb r3, [r4, 0x5]
	lsls r2, r3, 3
	adds r2, r3
	lsls r2, 2
	adds r2, r5
	ldrh r2, [r2, 0x10]
	strh r2, [r0]
	ldrb r2, [r4, 0x5]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r0, r5
	ldrh r0, [r0, 0x12]
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059730: .4byte gMapObjects
_08059734: .4byte gPlayerAvatar
	thumb_func_end PlayerGetDestCoords

	thumb_func_start player_get_direction_lower_nybble
player_get_direction_lower_nybble: @ 8059738
	ldr r2, _08059750 @ =gMapObjects
	ldr r0, _08059754 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bx lr
	.align 2, 0
_08059750: .4byte gMapObjects
_08059754: .4byte gPlayerAvatar
	thumb_func_end player_get_direction_lower_nybble

	thumb_func_start player_get_direction_upper_nybble
player_get_direction_upper_nybble: @ 8059758
	ldr r2, _0805976C @ =gMapObjects
	ldr r0, _08059770 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsrs r0, 4
	bx lr
	.align 2, 0
_0805976C: .4byte gMapObjects
_08059770: .4byte gPlayerAvatar
	thumb_func_end player_get_direction_upper_nybble

	thumb_func_start PlayerGetZCoord
PlayerGetZCoord: @ 8059774
	ldr r2, _08059788 @ =gMapObjects
	ldr r0, _0805978C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0xB]
	lsrs r0, 4
	bx lr
	.align 2, 0
_08059788: .4byte gMapObjects
_0805978C: .4byte gPlayerAvatar
	thumb_func_end PlayerGetZCoord

	thumb_func_start unref_sub_8059790
unref_sub_8059790: @ 8059790
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _080597B8 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080597BC @ =gMapObjects
	adds r0, r1
	lsls r3, 16
	asrs r3, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r3, 0
	bl sub_805C058
	pop {r0}
	bx r0
	.align 2, 0
_080597B8: .4byte gPlayerAvatar
_080597BC: .4byte gMapObjects
	thumb_func_end unref_sub_8059790

	thumb_func_start TestPlayerAvatarFlags
TestPlayerAvatarFlags: @ 80597C0
	ldr r1, _080597CC @ =gPlayerAvatar
	ldrb r1, [r1]
	ands r1, r0
	adds r0, r1, 0
	bx lr
	.align 2, 0
_080597CC: .4byte gPlayerAvatar
	thumb_func_end TestPlayerAvatarFlags

	thumb_func_start sub_80597D0
sub_80597D0: @ 80597D0
	ldr r0, _080597D8 @ =gPlayerAvatar
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080597D8: .4byte gPlayerAvatar
	thumb_func_end sub_80597D0

	thumb_func_start GetPlayerAvatarObjectId
GetPlayerAvatarObjectId: @ 80597DC
	ldr r0, _080597E4 @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	bx lr
	.align 2, 0
_080597E4: .4byte gPlayerAvatar
	thumb_func_end GetPlayerAvatarObjectId

	thumb_func_start sub_80597E8
sub_80597E8: @ 80597E8
	push {lr}
	bl ForcedMovement_None
	pop {r0}
	bx r0
	thumb_func_end sub_80597E8

	thumb_func_start sub_80597F4
sub_80597F4: @ 80597F4
	push {r4,lr}
	ldr r0, _08059834 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059838 @ =gMapObjects
	adds r4, r0
	adds r0, r4, 0
	bl npc_clear_strange_bits
	ldrb r1, [r4, 0x18]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x6
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0805982C
	bl sub_80E6084
	movs r0, 0
	bl sub_80E6010
_0805982C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059834: .4byte gPlayerAvatar
_08059838: .4byte gMapObjects
	thumb_func_end sub_80597F4

	thumb_func_start sub_805983C
sub_805983C: @ 805983C
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08059850 @ =gUnknown_0830FC44
	lsrs r0, 23
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_08059850: .4byte gUnknown_0830FC44
	thumb_func_end sub_805983C

	thumb_func_start GetPlayerAvatarGraphicsIdByStateIdAndGender
GetPlayerAvatarGraphicsIdByStateIdAndGender: @ 8059854
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08059868 @ =gUnknown_0830FC54
	lsrs r0, 23
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_08059868: .4byte gUnknown_0830FC54
	thumb_func_end GetPlayerAvatarGraphicsIdByStateIdAndGender

	thumb_func_start GetPlayerAvatarGraphicsIdByStateId
GetPlayerAvatarGraphicsIdByStateId: @ 805986C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08059884 @ =gPlayerAvatar
	ldrb r1, [r1, 0x7]
	bl GetPlayerAvatarGraphicsIdByStateIdAndGender
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08059884: .4byte gPlayerAvatar
	thumb_func_end GetPlayerAvatarGraphicsIdByStateId

	thumb_func_start unref_sub_8059888
unref_sub_8059888: @ 8059888
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x70
	beq _080598AA
	cmp r0, 0x70
	bgt _080598A2
	cmp r0, 0x6D
	bgt _080598AE
	cmp r0, 0x69
	blt _080598AE
	b _080598AA
_080598A2:
	cmp r1, 0x8A
	beq _080598AA
	cmp r1, 0xC0
	bne _080598AE
_080598AA:
	movs r0, 0x1
	b _080598B0
_080598AE:
	movs r0, 0
_080598B0:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8059888

	thumb_func_start GetPlayerAvatarGenderByGraphicsId
GetPlayerAvatarGenderByGraphicsId: @ 80598B4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x70
	beq _080598D6
	cmp r0, 0x70
	bgt _080598CE
	cmp r0, 0x5D
	bgt _080598DA
	cmp r0, 0x59
	blt _080598DA
	b _080598D6
_080598CE:
	cmp r1, 0x8A
	beq _080598D6
	cmp r1, 0xC0
	bne _080598DA
_080598D6:
	movs r0, 0x1
	b _080598DC
_080598DA:
	movs r0, 0
_080598DC:
	pop {r1}
	bx r1
	thumb_func_end GetPlayerAvatarGenderByGraphicsId

	thumb_func_start PartyHasMonWithSurf
PartyHasMonWithSurf: @ 80598E0
	push {r4,r5,lr}
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	bne _08059924
	movs r5, 0
	b _0805990A
_080598F2:
	adds r0, r4, 0
	movs r1, 0x39
	bl pokemon_has_move
	lsls r0, 24
	cmp r0, 0
	beq _08059904
	movs r0, 0x1
	b _08059926
_08059904:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0805990A:
	cmp r5, 0x5
	bhi _08059924
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0805992C @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	bne _080598F2
_08059924:
	movs r0, 0
_08059926:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805992C: .4byte gPlayerParty
	thumb_func_end PartyHasMonWithSurf

	thumb_func_start IsPlayerSurfingNorth
IsPlayerSurfingNorth: @ 8059930
	push {lr}
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0805994E
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0805994E
	movs r0, 0x1
	b _08059950
_0805994E:
	movs r0, 0
_08059950:
	pop {r1}
	bx r1
	thumb_func_end IsPlayerSurfingNorth

	thumb_func_start IsPlayerFacingSurfableFishableWater
IsPlayerFacingSurfableFishableWater: @ 8059954
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _080599CC @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080599D0 @ =gMapObjects
	adds r4, r0
	ldrh r1, [r4, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r4, 0x12]
	mov r5, sp
	adds r5, 0x2
	strh r0, [r5]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	mov r1, sp
	adds r2, r5, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	ldrb r3, [r4, 0x18]
	lsls r3, 28
	lsrs r3, 28
	adds r0, r4, 0
	bl npc_block_way
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _080599D4
	bl PlayerGetZCoord
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _080599D4
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfableFishableWater
	lsls r0, 24
	cmp r0, 0
	beq _080599D4
	movs r0, 0x1
	b _080599D6
	.align 2, 0
_080599CC: .4byte gPlayerAvatar
_080599D0: .4byte gMapObjects
_080599D4:
	movs r0, 0
_080599D6:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end IsPlayerFacingSurfableFishableWater

	thumb_func_start ClearPlayerAvatarInfo
ClearPlayerAvatarInfo: @ 80599E0
	push {lr}
	ldr r0, _080599F0 @ =gPlayerAvatar
	movs r1, 0
	movs r2, 0x24
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_080599F0: .4byte gPlayerAvatar
	thumb_func_end ClearPlayerAvatarInfo

	thumb_func_start SetPlayerAvatarStateMask
SetPlayerAvatarStateMask: @ 80599F4
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08059A08 @ =gPlayerAvatar
	ldrb r2, [r3]
	movs r1, 0xE0
	ands r1, r2
	orrs r0, r1
	strb r0, [r3]
	bx lr
	.align 2, 0
_08059A08: .4byte gPlayerAvatar
	thumb_func_end SetPlayerAvatarStateMask

	thumb_func_start GetPlayerAvatarStateTransitionByGraphicsId
GetPlayerAvatarStateTransitionByGraphicsId: @ 8059A0C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	ldr r3, _08059A34 @ =gUnknown_0830FC64
	lsls r0, r1, 2
	adds r0, r1
	lsls r4, r0, 1
	adds r6, r3, 0x1
_08059A22:
	lsls r0, r2, 1
	adds r1, r0, r4
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r5
	bne _08059A38
	adds r0, r1, r6
	ldrb r0, [r0]
	b _08059A44
	.align 2, 0
_08059A34: .4byte gUnknown_0830FC64
_08059A38:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x4
	bls _08059A22
	movs r0, 0x1
_08059A44:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetPlayerAvatarStateTransitionByGraphicsId

	thumb_func_start GetPlayerAvatarGraphicsIdByCurrentState
GetPlayerAvatarGraphicsIdByCurrentState: @ 8059A4C
	push {r4-r6,lr}
	ldr r0, _08059A74 @ =gPlayerAvatar
	ldrb r5, [r0]
	movs r2, 0
	ldr r3, _08059A78 @ =gUnknown_0830FC64
	ldrb r1, [r0, 0x7]
	lsls r0, r1, 2
	adds r0, r1
	lsls r4, r0, 1
	adds r6, r3, 0x1
_08059A60:
	lsls r0, r2, 1
	adds r1, r0, r4
	adds r0, r1, r6
	ldrb r0, [r0]
	ands r0, r5
	cmp r0, 0
	beq _08059A7C
	adds r0, r1, r3
	ldrb r0, [r0]
	b _08059A88
	.align 2, 0
_08059A74: .4byte gPlayerAvatar
_08059A78: .4byte gUnknown_0830FC64
_08059A7C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x4
	bls _08059A60
	movs r0, 0
_08059A88:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetPlayerAvatarGraphicsIdByCurrentState

	thumb_func_start SetPlayerAvatarExtraStateTransition
SetPlayerAvatarExtraStateTransition: @ 8059A90
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08059ABC @ =gPlayerAvatar
	ldrb r1, [r5, 0x7]
	bl GetPlayerAvatarStateTransitionByGraphicsId
	lsls r0, 24
	lsrs r0, 24
	orrs r0, r4
	ldrb r1, [r5, 0x1]
	orrs r0, r1
	strb r0, [r5, 0x1]
	bl DoPlayerAvatarTransition
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059ABC: .4byte gPlayerAvatar
	thumb_func_end SetPlayerAvatarExtraStateTransition

	thumb_func_start InitPlayerAvatar
InitPlayerAvatar: @ 8059AC0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x18
	adds r4, r0, 0
	adds r5, r1, 0
	mov r9, r2
	mov r8, r3
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1]
	movs r0, 0
	mov r1, r8
	bl GetPlayerAvatarGraphicsIdByStateIdAndGender
	mov r1, sp
	movs r3, 0
	strb r0, [r1, 0x1]
	mov r0, sp
	lsls r4, 16
	asrs r4, 16
	subs r4, 0x7
	movs r6, 0
	strh r4, [r0, 0x4]
	lsls r5, 16
	asrs r5, 16
	subs r5, 0x7
	strh r5, [r0, 0x6]
	strb r6, [r0, 0x8]
	movs r0, 0xB
	strb r0, [r1, 0x9]
	mov r2, sp
	ldrb r1, [r2, 0xA]
	subs r0, 0x1B
	ands r0, r1
	strb r0, [r2, 0xA]
	mov r0, sp
	strb r6, [r0, 0xA]
	strh r3, [r0, 0xC]
	strh r3, [r0, 0xE]
	str r3, [sp, 0x10]
	strh r3, [r0, 0x14]
	bl SpawnSpecialFieldObject
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 3
	adds r4, r5
	lsls r4, 2
	ldr r0, _08059B80 @ =gMapObjects
	adds r4, r0
	ldrb r0, [r4, 0x2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x2]
	bl sub_8126B54
	strb r0, [r4, 0x1B]
	adds r0, r4, 0
	mov r1, r9
	bl FieldObjectTurn
	bl ClearPlayerAvatarInfo
	ldr r0, _08059B84 @ =gPlayerAvatar
	strb r6, [r0, 0x2]
	strb r6, [r0, 0x3]
	strb r5, [r0, 0x5]
	ldrb r1, [r4, 0x4]
	strb r1, [r0, 0x4]
	mov r1, r8
	strb r1, [r0, 0x7]
	movs r0, 0x21
	bl SetPlayerAvatarStateMask
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059B80: .4byte gMapObjects
_08059B84: .4byte gPlayerAvatar
	thumb_func_end InitPlayerAvatar

	thumb_func_start sub_8059B88
sub_8059B88: @ 8059B88
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r6, _08059BE8 @ =gMapObjects
	ldr r5, _08059BEC @ =gPlayerAvatar
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x1
	ands r4, r0
	lsls r3, r4, 5
	ldrb r2, [r1, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x1]
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08059BE0
	ldr r2, _08059BF0 @ =gSprites
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x1A]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	lsls r3, r4, 2
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
_08059BE0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059BE8: .4byte gMapObjects
_08059BEC: .4byte gPlayerAvatar
_08059BF0: .4byte gSprites
	thumb_func_end sub_8059B88

	thumb_func_start sub_8059BF4
sub_8059BF4: @ 8059BF4
	push {r4,r5,lr}
	ldr r5, _08059C30 @ =gPlayerAvatar
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059C34 @ =gMapObjects
	adds r4, r0
	movs r0, 0x5
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08059C38 @ =gSprites
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059C30: .4byte gPlayerAvatar
_08059C34: .4byte gMapObjects
_08059C38: .4byte gSprites
	thumb_func_end sub_8059BF4

	thumb_func_start sub_8059C3C
sub_8059C3C: @ 8059C3C
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _08059C88 @ =gPlayerAvatar
	ldrb r0, [r6, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059C8C @ =gMapObjects
	adds r4, r0
	movs r0, 0x6
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059C90 @ =gSprites
	adds r4, r0
	adds r0, r5, 0
	bl sub_805FDE8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059C88: .4byte gPlayerAvatar
_08059C8C: .4byte gMapObjects
_08059C90: .4byte gSprites
	thumb_func_end sub_8059C3C

	thumb_func_start sub_8059C94
sub_8059C94: @ 8059C94
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _08059CFC @ =gPlayerAvatar
	ldrb r0, [r6, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059D00 @ =gMapObjects
	adds r4, r0
	movs r0, 0x2
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059D04 @ =gSprites
	mov r8, r0
	add r4, r8
	adds r0, r5, 0
	bl sub_805FD98
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrb r1, [r6, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	movs r1, 0x1
	bl SeekSpriteAnim
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059CFC: .4byte gPlayerAvatar
_08059D00: .4byte gMapObjects
_08059D04: .4byte gSprites
	thumb_func_end sub_8059C94

	thumb_func_start sub_8059D08
sub_8059D08: @ 8059D08
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _08059D54 @ =gPlayerAvatar
	ldrb r0, [r6, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059D58 @ =gMapObjects
	adds r4, r0
	movs r0, 0x7
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059D5C @ =gSprites
	adds r4, r0
	adds r0, r5, 0
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059D54: .4byte gPlayerAvatar
_08059D58: .4byte gMapObjects
_08059D5C: .4byte gSprites
	thumb_func_end sub_8059D08

	thumb_func_start sub_8059D60
sub_8059D60: @ 8059D60
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrb r0, [r5, 0x1E]
	mov r8, r0
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
	movs r6, 0x1
	ldr r1, _08059DC4 @ =gUnknown_0830FC78
	mov r9, r1
	mov r4, sp
	mov r7, sp
	adds r7, 0x2
_08059D82:
	movs r1, 0
	ldrsh r0, [r4, r1]
	lsls r0, 2
	add r0, r9
	ldr r1, [r0]
	mov r0, r8
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	beq _08059DC8
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	cmp r6, r0
	bne _08059DC8
	ldrh r0, [r5, 0x10]
	strh r0, [r4]
	ldrh r0, [r5, 0x12]
	strh r0, [r7]
	adds r0, r6, 0
	mov r1, sp
	adds r2, r7, 0
	bl MoveCoords
	ldrb r0, [r5, 0x1B]
	movs r1, 0
	ldrsh r2, [r4, r1]
	movs r1, 0
	ldrsh r3, [r7, r1]
	adds r1, r6, 0
	bl sub_8126BC4
	b _08059DE2
	.align 2, 0
_08059DC4: .4byte gUnknown_0830FC78
_08059DC8:
	ldrh r1, [r4]
	adds r1, 0x1
	strh r1, [r4]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x3
	ble _08059D82
	ldrb r0, [r5, 0x1B]
	bl objid_set_invisible
_08059DE2:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8059D60

	thumb_func_start task_add_bump_boulder
task_add_bump_boulder: @ 8059DF0
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _08059E24 @ =sub_8059E2C
	adds r0, r6, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08059E28 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	strh r5, [r1, 0xC]
	bl _call_via_r6
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059E24: .4byte sub_8059E2C
_08059E28: .4byte gTasks
	thumb_func_end task_add_bump_boulder

	thumb_func_start sub_8059E2C
sub_8059E2C: @ 8059E2C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _08059E74 @ =gUnknown_0830FC88
	ldr r2, _08059E78 @ =gTasks
	ldr r5, _08059E7C @ =gMapObjects
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08059E40:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldr r0, _08059E80 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _08059E40
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059E74: .4byte gUnknown_0830FC88
_08059E78: .4byte gTasks
_08059E7C: .4byte gMapObjects
_08059E80: .4byte gPlayerAvatar
	thumb_func_end sub_8059E2C

	thumb_func_start sub_8059E84
sub_8059E84: @ 8059E84
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	ldr r1, _08059EA0 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08059EA0: .4byte gPlayerAvatar
	thumb_func_end sub_8059E84

	thumb_func_start sub_8059EA4
sub_8059EA4: @ 8059EA4
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r5, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	bne _08059F2E
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	bne _08059F2E
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	ldrb r0, [r6, 0xC]
	bl GetStepInPlaceDelay16AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	ldrb r0, [r6, 0xC]
	bl GetSimpleGoAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldr r2, _08059F38 @ =gUnknown_0202FF84
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	str r0, [r2]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	str r0, [r2, 0x4]
	ldrb r0, [r4, 0xB]
	lsrs r0, 4
	str r0, [r2, 0x8]
	ldr r3, _08059F3C @ =gSprites
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r2, 0xC]
	movs r0, 0xA
	bl FieldEffectStart
	movs r0, 0xD6
	bl PlaySE
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_08059F2E:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08059F38: .4byte gUnknown_0202FF84
_08059F3C: .4byte gSprites
	thumb_func_end sub_8059EA4

	thumb_func_start sub_8059F40
sub_8059F40: @ 8059F40
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	adds r0, r4, 0
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	beq _08059F82
	adds r0, r5, 0
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	beq _08059F82
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	ldr r1, _08059F8C @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	ldr r0, _08059F90 @ =sub_8059E2C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08059F82:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08059F8C: .4byte gPlayerAvatar
_08059F90: .4byte sub_8059E2C
	thumb_func_end sub_8059F40

	thumb_func_start sub_8059F94
sub_8059F94: @ 8059F94
	push {r4,lr}
	ldr r4, _08059FB0 @ =sub_8059FB4
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059FB0: .4byte sub_8059FB4
	thumb_func_end sub_8059F94

	thumb_func_start sub_8059FB4
sub_8059FB4: @ 8059FB4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08059FF0 @ =gUnknown_0830FC94
	ldr r2, _08059FF4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08059FC6:
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	lsls r2, 2
	adds r2, r5
	ldr r0, _08059FF8 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08059FFC @ =gMapObjects
	adds r1, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _08059FC6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059FF0: .4byte gUnknown_0830FC94
_08059FF4: .4byte gTasks
_08059FF8: .4byte gPlayerAvatar
_08059FFC: .4byte gMapObjects
	thumb_func_end sub_8059FB4

	thumb_func_start sub_805A000
sub_805A000: @ 805A000
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	ldr r5, _0805A064 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r5, 0x6]
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A05C
	movs r0, 0xA
	bl PlaySE
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_806084C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0805A05C
	movs r0, 0
	strb r0, [r5, 0x6]
	ldrb r0, [r5, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r5, 0x1]
	ldr r0, _0805A068 @ =sub_8059FB4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805A05C:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805A064: .4byte gPlayerAvatar
_0805A068: .4byte sub_8059FB4
	thumb_func_end sub_805A000

	thumb_func_start sub_805A06C
sub_805A06C: @ 805A06C
	push {r4,lr}
	ldr r4, _0805A088 @ =sub_805A08C
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A088: .4byte sub_805A08C
	thumb_func_end sub_805A06C

	thumb_func_start sub_805A08C
sub_805A08C: @ 805A08C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0805A0C8 @ =gUnknown_0830FC98
	ldr r2, _0805A0CC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0805A09E:
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	lsls r2, 2
	adds r2, r5
	ldr r0, _0805A0D0 @ =gPlayerAvatar
	ldrb r0, [r0, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0805A0D4 @ =gMapObjects
	adds r1, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _0805A09E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A0C8: .4byte gUnknown_0830FC98
_0805A0CC: .4byte gTasks
_0805A0D0: .4byte gPlayerAvatar
_0805A0D4: .4byte gMapObjects
	thumb_func_end sub_805A08C

	thumb_func_start sub_805A0D8
sub_805A0D8: @ 805A0D8
	push {lr}
	ldrh r2, [r0, 0x8]
	adds r2, 0x1
	strh r2, [r0, 0x8]
	ldrb r1, [r1, 0x18]
	lsrs r1, 4
	strh r1, [r0, 0xA]
	ldr r1, _0805A0FC @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	bl ScriptContext2_Enable
	movs r0, 0x2D
	bl PlaySE
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0805A0FC: .4byte gPlayerAvatar
	thumb_func_end sub_805A0D8

	thumb_func_start sub_805A100
sub_805A100: @ 805A100
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805A174 @ =gUnknown_0830FCA8
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A168
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	subs r0, 0x1
	add r0, sp
	ldrb r6, [r0]
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	ldrb r0, [r4, 0xA]
	cmp r6, r0
	bne _0805A146
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_0805A146:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _0805A168
	ldrb r0, [r4, 0xA]
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _0805A168
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0805A168:
	movs r0, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805A174: .4byte gUnknown_0830FCA8
	thumb_func_end sub_805A100

	thumb_func_start sub_805A178
sub_805A178: @ 805A178
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r1, _0805A1B4 @ =gUnknown_0830FCAC
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A1A8
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	add r0, sp
	ldrb r1, [r0]
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	movs r0, 0x1
	strh r0, [r5, 0x8]
_0805A1A8:
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805A1B4: .4byte gUnknown_0830FCAC
	thumb_func_end sub_805A178

	thumb_func_start sub_805A1B8
sub_805A1B8: @ 805A1B8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A1FC
	ldrb r0, [r4, 0xA]
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r0, 24
	bl GetSimpleGoAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	bl ScriptContext2_Disable
	ldr r1, _0805A204 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	ldr r0, _0805A208 @ =sub_805A08C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805A1FC:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805A204: .4byte gPlayerAvatar
_0805A208: .4byte sub_805A08C
	thumb_func_end sub_805A1B8

	thumb_func_start sub_805A20C
sub_805A20C: @ 805A20C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ScriptContext2_Enable
	bl sav1_reset_battle_music_maybe
	bl sub_8053F84
	ldr r2, _0805A258 @ =gPlayerAvatar
	ldrb r1, [r2]
	movs r0, 0xF7
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strb r0, [r2, 0x6]
	ldr r5, _0805A25C @ =taskFF_0805D1D4
	adds r0, r5, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805A260 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	bl _call_via_r5
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A258: .4byte gPlayerAvatar
_0805A25C: .4byte taskFF_0805D1D4
_0805A260: .4byte gTasks
	thumb_func_end sub_805A20C

	thumb_func_start taskFF_0805D1D4
taskFF_0805D1D4: @ 805A264
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0805A2C0 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805A2C4 @ =gMapObjects
	adds r5, r0, r1
	adds r0, r5, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0805A290
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A2B8
_0805A290:
	ldrb r0, [r5, 0x1A]
	movs r1, 0x2
	bl sub_8127ED0
	ldr r0, _0805A2C8 @ =gTasks
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x8]
	bl sub_80608D0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	ldr r0, _0805A2CC @ =sub_805A2D0
	str r0, [r4]
_0805A2B8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A2C0: .4byte gPlayerAvatar
_0805A2C4: .4byte gMapObjects
_0805A2C8: .4byte gTasks
_0805A2CC: .4byte sub_805A2D0
	thumb_func_end taskFF_0805D1D4

	thumb_func_start sub_805A2D0
sub_805A2D0: @ 805A2D0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _0805A33C @ =gPlayerAvatar
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805A340 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A336
	movs r0, 0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	movs r0, 0
	strb r0, [r6, 0x6]
	bl ScriptContext2_Disable
	ldrb r1, [r4, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805A344 @ =gSprites
	adds r0, r1
	bl DestroySprite
	adds r0, r5, 0
	bl DestroyTask
_0805A336:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A33C: .4byte gPlayerAvatar
_0805A340: .4byte gMapObjects
_0805A344: .4byte gSprites
	thumb_func_end sub_805A2D0

	thumb_func_start StartFishing
StartFishing: @ 805A348
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _0805A374 @ =sub_805A37C
	adds r0, r5, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805A378 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x26]
	bl _call_via_r5
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A374: .4byte sub_805A37C
_0805A378: .4byte gTasks
	thumb_func_end StartFishing

	thumb_func_start sub_805A37C
sub_805A37C: @ 805A37C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0805A3AC @ =gUnknown_0830FCB4
	ldr r2, _0805A3B0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0805A38E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0805A38E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A3AC: .4byte gUnknown_0830FCB4
_0805A3B0: .4byte gTasks
	thumb_func_end sub_805A37C

	thumb_func_start sub_805A3B4
sub_805A3B4: @ 805A3B4
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	ldr r1, _0805A3D0 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A3D0: .4byte gPlayerAvatar
	thumb_func_end sub_805A3B4

	thumb_func_start fish1
fish1: @ 805A3D4
	push {r4-r6,lr}
	sub sp, 0x10
	adds r5, r0, 0
	ldr r1, _0805A45C @ =gUnknown_0830FCF4
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r4, sp, 0x8
	ldr r1, _0805A460 @ =gUnknown_0830FCFA
	adds r0, r4, 0
	movs r2, 0x6
	bl memcpy
	movs r0, 0
	strh r0, [r5, 0x20]
	bl Random
	movs r2, 0x26
	ldrsh r1, [r5, r2]
	lsls r1, 1
	mov r2, sp
	adds r6, r2, r1
	lsls r0, 16
	lsrs r0, 16
	adds r4, r1
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl __modsi3
	ldrh r1, [r6]
	adds r1, r0
	strh r1, [r5, 0x22]
	ldr r3, _0805A464 @ =gMapObjects
	ldr r2, _0805A468 @ =gPlayerAvatar
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x5]
	strh r0, [r5, 0x24]
	ldrb r0, [r2, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	adds r4, r3
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimActive
	ldrb r0, [r4, 0x1]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8059C3C
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805A45C: .4byte gUnknown_0830FCF4
_0805A460: .4byte gUnknown_0830FCFA
_0805A464: .4byte gMapObjects
_0805A468: .4byte gPlayerAvatar
	thumb_func_end fish1

	thumb_func_start fish2
fish2: @ 805A46C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3B
	ble _0805A488
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0805A488:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end fish2

	thumb_func_start fish3
fish3: @ 805A490
	push {r4,lr}
	adds r4, r0, 0
	bl MenuDisplayMessageBox
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	strh r1, [r4, 0xC]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	adds r1, r0, 0
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0805A4C4
	adds r0, r1, 0x4
	strh r0, [r4, 0xE]
_0805A4C4:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x9
	ble _0805A4D0
	movs r0, 0xA
	strh r0, [r4, 0xE]
_0805A4D0:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end fish3

	thumb_func_start fish4
fish4: @ 805A4D8
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _0805A514 @ =gUnknown_0830FD00
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	bl sub_805A954
	ldrh r0, [r4, 0xA]
	adds r2, r0, 0x1
	strh r2, [r4, 0xA]
	ldr r0, _0805A518 @ =gMain
	ldrh r0, [r0, 0x2E]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0805A51C
	movs r0, 0xB
	strh r0, [r4, 0x8]
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0805A50E
	movs r0, 0xC
	strh r0, [r4, 0x8]
_0805A50E:
	movs r0, 0x1
	b _0805A564
	.align 2, 0
_0805A514: .4byte gUnknown_0830FD00
_0805A518: .4byte gMain
_0805A51C:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _0805A562
	strh r1, [r4, 0xA]
	ldrh r2, [r4, 0xC]
	movs r3, 0xC
	ldrsh r1, [r4, r3]
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _0805A54E
	ldrh r0, [r4, 0x8]
	adds r1, r0, 0x1
	strh r1, [r4, 0x8]
	ldrh r2, [r4, 0x20]
	movs r3, 0x20
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _0805A548
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
_0805A548:
	adds r0, r2, 0x1
	strh r0, [r4, 0x20]
	b _0805A562
_0805A54E:
	adds r1, r2, 0x4
	lsls r1, 24
	lsrs r1, 24
	mov r0, sp
	movs r2, 0xF
	bl MenuPrint
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_0805A562:
	movs r0, 0
_0805A564:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end fish4

	thumb_func_start party_menu_update_status_condition_object
party_menu_update_status_condition_object: @ 805A56C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl GetFishingWildMonListHeader
	lsls r0, 24
	cmp r0, 0
	beq _0805A590
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0805A596
_0805A590:
	movs r0, 0xB
	strh r0, [r4, 0x8]
	b _0805A5BC
_0805A596:
	ldr r0, _0805A5C4 @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805A5C8 @ =gSprites
	adds r4, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_805FE08
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_0805A5BC:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A5C4: .4byte gPlayerAvatar
_0805A5C8: .4byte gSprites
	thumb_func_end party_menu_update_status_condition_object

	thumb_func_start sub_805A5CC
sub_805A5CC: @ 805A5CC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	ldr r0, _0805A5F0 @ =gOtherText_OhABite
	movs r1, 0x4
	movs r2, 0x11
	bl MenuPrint
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A5F0: .4byte gOtherText_OhABite
	thumb_func_end sub_805A5CC

	thumb_func_start fish7
fish7: @ 805A5F4
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _0805A628 @ =gUnknown_0830FD02
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	bl sub_805A954
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	lsls r1, 16
	asrs r1, 16
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _0805A62C
	movs r0, 0xC
	b _0805A63C
	.align 2, 0
_0805A628: .4byte gUnknown_0830FD02
_0805A62C:
	ldr r0, _0805A648 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805A63E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
_0805A63C:
	strh r0, [r4, 0x8]
_0805A63E:
	movs r0, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A648: .4byte gMain
	thumb_func_end fish7

	thumb_func_start fish8
fish8: @ 805A64C
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r1, _0805A6B0 @ =gUnknown_0830FD08
	mov r0, sp
	movs r2, 0xC
	bl memcpy
	bl sub_805A954
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0805A6A2
	cmp r1, 0x1
	bgt _0805A6A6
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	movs r3, 0x20
	ldrsh r2, [r4, r3]
	lsls r2, 1
	movs r3, 0x26
	ldrsh r1, [r4, r3]
	lsls r1, 2
	adds r2, r1
	mov r3, sp
	adds r1, r3, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	lsls r0, 16
	asrs r0, 16
	cmp r1, r0
	ble _0805A6A6
_0805A6A2:
	movs r0, 0x3
	strh r0, [r4, 0x8]
_0805A6A6:
	movs r0, 0
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A6B0: .4byte gUnknown_0830FD08
	thumb_func_end fish8

	thumb_func_start sub_805A6B4
sub_805A6B4: @ 805A6B4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	ldr r0, _0805A6D8 @ =gOtherText_PokeOnHook
	bl sub_8072044
	bl MenuDisplayMessageBox
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A6D8: .4byte gOtherText_PokeOnHook
	thumb_func_end sub_805A6B4

	thumb_func_start sub_805A6DC
sub_805A6DC: @ 805A6DC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0805A780
	bl sub_805A954
	movs r0, 0xA
	ldrsh r6, [r5, r0]
	cmp r6, 0
	bne _0805A780
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0805A778
	ldr r7, _0805A76C @ =gPlayerAvatar
	ldrb r0, [r7, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r1, _0805A770 @ =gMapObjects
	mov r8, r1
	add r4, r8
	ldrh r1, [r5, 0x24]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	ldrb r1, [r7]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805A746
	ldrb r0, [r7, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r0, [r1, 0x1A]
	movs r1, 0
	movs r2, 0
	bl sub_8127F28
_0805A746:
	ldr r2, _0805A774 @ =gSprites
	ldrb r1, [r7, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x24]
	ldrb r1, [r7, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x26]
	bl MenuZeroFillScreen
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	b _0805A7A8
	.align 2, 0
_0805A76C: .4byte gPlayerAvatar
_0805A770: .4byte gMapObjects
_0805A774: .4byte gSprites
_0805A778:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0805A7A8
_0805A780:
	ldr r1, _0805A7B4 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	ldrh r0, [r5, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl FishingWildEncounter
	movs r0, 0x1
	bl sub_80BE97C
	ldr r0, _0805A7B8 @ =sub_805A37C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805A7A8:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805A7B4: .4byte gPlayerAvatar
_0805A7B8: .4byte sub_805A37C
	thumb_func_end sub_805A6DC

	thumb_func_start sub_805A7BC
sub_805A7BC: @ 805A7BC
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_805A954
	ldr r0, _0805A7FC @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805A800 @ =gSprites
	adds r4, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_805FDF8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _0805A804 @ =gOtherText_NotEvenANibble
	bl sub_8072044
	movs r0, 0xD
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805A7FC: .4byte gPlayerAvatar
_0805A800: .4byte gSprites
_0805A804: .4byte gOtherText_NotEvenANibble
	thumb_func_end sub_805A7BC

	thumb_func_start sub_805A808
sub_805A808: @ 805A808
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_805A954
	ldr r0, _0805A84C @ =gPlayerAvatar
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805A850 @ =gSprites
	adds r4, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_805FDF8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _0805A854 @ =gOtherText_ItGotAway
	bl sub_8072044
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805A84C: .4byte gPlayerAvatar
_0805A850: .4byte gSprites
_0805A854: .4byte gOtherText_ItGotAway
	thumb_func_end sub_805A808

	thumb_func_start fishD
fishD: @ 805A858
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	bl MenuDisplayMessageBox
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end fishD

	thumb_func_start sub_805A874
sub_805A874: @ 805A874
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	bl sub_805A954
	ldr r7, _0805A908 @ =gSprites
	ldr r5, _0805A90C @ =gPlayerAvatar
	ldrb r0, [r5, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3F
	ldrb r0, [r1]
	lsls r0, 27
	cmp r0, 0
	bge _0805A8FA
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805A910 @ =gMapObjects
	mov r8, r0
	add r4, r8
	ldrh r1, [r6, 0x24]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	ldrb r1, [r5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805A8DA
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r0, [r1, 0x1A]
	movs r1, 0
	movs r2, 0
	bl sub_8127F28
_0805A8DA:
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	movs r2, 0
	strh r2, [r0, 0x24]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r2, [r0, 0x26]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_0805A8FA:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805A908: .4byte gSprites
_0805A90C: .4byte gPlayerAvatar
_0805A910: .4byte gMapObjects
	thumb_func_end sub_805A874

	thumb_func_start fishF
fishF: @ 805A914
	push {lr}
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0805A946
	ldr r1, _0805A94C @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	bl sub_806451C
	bl MenuZeroFillScreen
	movs r0, 0
	bl sub_80BE97C
	ldr r0, _0805A950 @ =sub_805A37C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805A946:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0805A94C: .4byte gPlayerAvatar
_0805A950: .4byte sub_805A37C
	thumb_func_end fishF

	thumb_func_start sub_805A954
sub_805A954: @ 805A954
	push {r4-r7,lr}
	ldr r0, _0805AA40 @ =gPlayerAvatar
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805AA44 @ =gSprites
	adds r4, r0, r1
	adds r0, r4, 0
	bl AnimateSprite
	movs r0, 0
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r5, [r0]
	movs r0, 0x2A
	adds r0, r4
	mov r12, r0
	ldrb r0, [r0]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r6, r5, 2
	adds r0, r6, r0
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r7, 0x1
	negs r7, r7
	cmp r0, r7
	beq _0805A9C6
	adds r3, r4, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	lsls r1, r2, 26
	lsrs r1, 26
	adds r1, 0x1
	movs r0, 0x3F
	ands r1, r0
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	mov r1, r12
	ldrb r0, [r1]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	adds r0, r6, r0
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, r7
	bne _0805A9CC
_0805A9C6:
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0805A9CC:
	adds r0, r4, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrb r5, [r0]
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _0805A9FE
	movs r0, 0x8
	strh r0, [r4, 0x24]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0805A9FE
	ldr r0, _0805AA48 @ =0x0000fff8
	strh r0, [r4, 0x24]
_0805A9FE:
	cmp r5, 0x5
	bne _0805AA06
	ldr r0, _0805AA48 @ =0x0000fff8
	strh r0, [r4, 0x26]
_0805AA06:
	adds r0, r5, 0
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0805AA16
	movs r0, 0x8
	strh r0, [r4, 0x26]
_0805AA16:
	ldr r3, _0805AA40 @ =gPlayerAvatar
	ldrb r1, [r3]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805AA3A
	ldr r2, _0805AA4C @ =gMapObjects
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1A]
	movs r1, 0x26
	ldrsh r2, [r4, r1]
	movs r1, 0x1
	bl sub_8127F28
_0805AA3A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AA40: .4byte gPlayerAvatar
_0805AA44: .4byte gSprites
_0805AA48: .4byte 0x0000fff8
_0805AA4C: .4byte gMapObjects
	thumb_func_end sub_805A954

	.align 2, 0 @ Don't pad with nop.
