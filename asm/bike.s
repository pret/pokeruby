	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80E5DA0
sub_80E5DA0: @ 80E5DA0
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, [sp, 0x10]
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	adds r5, r4, 0
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	str r5, [sp]
	bl CheckForFieldObjectCollision
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bhi _080E5DE0
	cmp r4, 0
	bne _080E5DDC
	adds r0, r5, 0
	bl IsRunningDisallowedByMetatile
	lsls r0, 24
	cmp r0, 0
	beq _080E5DD8
	movs r4, 0x2
_080E5DD8:
	cmp r4, 0
	beq _080E5DE0
_080E5DDC:
	bl sub_80E5E4C
_080E5DE0:
	adds r0, r4, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80E5DA0

	thumb_func_start sub_80E5DEC
sub_80E5DEC: @ 80E5DEC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl IsRunningDisallowedByMetatile
	lsls r0, 24
	cmp r0, 0
	bne _080E5E04
	ldr r0, _080E5E08 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x8
	bne _080E5E0C
_080E5E04:
	movs r0, 0x1
	b _080E5E0E
	.align 2, 0
_080E5E08: .4byte gMapHeader
_080E5E0C:
	movs r0, 0
_080E5E0E:
	pop {r1}
	bx r1
	thumb_func_end sub_80E5DEC

	thumb_func_start IsRunningDisallowedByMetatile
IsRunningDisallowedByMetatile: @ 80E5E14
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsRunningDisallowed
	lsls r0, 24
	cmp r0, 0
	bne _080E5E3E
	adds r0, r4, 0
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	cmp r0, 0
	beq _080E5E42
	bl PlayerGetZCoord
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	bne _080E5E42
_080E5E3E:
	movs r0, 0x1
	b _080E5E44
_080E5E42:
	movs r0, 0
_080E5E44:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsRunningDisallowedByMetatile

	thumb_func_start sub_80E5E4C
sub_80E5E4C: @ 80E5E4C
	push {lr}
	ldr r0, _080E5E68 @ =gUnknown_02039250
	ldrb r0, [r0]
	cmp r0, 0
	beq _080E5E62
	ldr r1, _080E5E6C @ =gUnknown_02039251
	ldrb r0, [r1]
	cmp r0, 0x63
	bhi _080E5E62
	adds r0, 0x1
	strb r0, [r1]
_080E5E62:
	pop {r0}
	bx r0
	.align 2, 0
_080E5E68: .4byte gUnknown_02039250
_080E5E6C: .4byte gUnknown_02039251
	thumb_func_end sub_80E5E4C

	thumb_func_start sub_80E5E70
sub_80E5E70: @ 80E5E70
	push {r4,r5,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	adds r5, r4, 0
	movs r1, 0xFD
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080E5E9A
	adds r0, r4, 0
	bl MetatileBehavior_IsIsolatedVerticalRail
	lsls r0, 24
	cmp r0, 0
	bne _080E5EB2
	adds r0, r4, 0
	bl MetatileBehavior_IsVerticalRail
	b _080E5EAC
_080E5E9A:
	adds r0, r5, 0
	bl MetatileBehavior_IsIsolatedHorizontalRail
	lsls r0, 24
	cmp r0, 0
	bne _080E5EB2
	adds r0, r5, 0
	bl MetatileBehavior_IsHorizontalRail
_080E5EAC:
	lsls r0, 24
	cmp r0, 0
	beq _080E5EB6
_080E5EB2:
	movs r0, 0
	b _080E5EB8
_080E5EB6:
	movs r0, 0x1
_080E5EB8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80E5E70

	thumb_func_start sub_80E5EC0
sub_80E5EC0: @ 80E5EC0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r1, 24
	movs r3, 0xFF
	lsls r3, 24
	adds r1, r3
	lsrs r1, 24
	cmp r1, 0x1
	bhi _080E5EE0
	cmp r0, 0xA
	beq _080E5EE8
	cmp r0, 0xC
	bne _080E5EEC
	b _080E5EE8
_080E5EE0:
	cmp r2, 0xB
	beq _080E5EE8
	cmp r2, 0xD
	bne _080E5EEC
_080E5EE8:
	movs r0, 0
	b _080E5EEE
_080E5EEC:
	movs r0, 0x1
_080E5EEE:
	pop {r1}
	bx r1
	thumb_func_end sub_80E5EC0

	thumb_func_start IsBikingDisallowedByPlayer
IsBikingDisallowedByPlayer: @ 80E5EF4
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080E5F30 @ =gPlayerAvatar
	ldrb r1, [r0]
	movs r0, 0x18
	ands r0, r1
	cmp r0, 0
	bne _080E5F34
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
	lsrs r0, 24
	bl IsRunningDisallowedByMetatile
	lsls r0, 24
	cmp r0, 0
	bne _080E5F34
	movs r0, 0
	b _080E5F36
	.align 2, 0
_080E5F30: .4byte gPlayerAvatar
_080E5F34:
	movs r0, 0x1
_080E5F36:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsBikingDisallowedByPlayer

	thumb_func_start player_should_look_direction_be_enforced_upon_movement
player_should_look_direction_be_enforced_upon_movement: @ 80E5F40
	push {lr}
	movs r0, 0x4
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _080E5F74
	ldr r2, _080E5F6C @ =gMapObjects
	ldr r0, _080E5F70 @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1E]
	bl MetatileBehavior_IsBumpySlope
	lsls r0, 24
	cmp r0, 0
	beq _080E5F74
	movs r0, 0
	b _080E5F76
	.align 2, 0
_080E5F6C: .4byte gMapObjects
_080E5F70: .4byte gPlayerAvatar
_080E5F74:
	movs r0, 0x1
_080E5F76:
	pop {r1}
	bx r1
	thumb_func_end player_should_look_direction_be_enforced_upon_movement

	thumb_func_start GetOnOffBike
GetOnOffBike: @ 80E5F7C
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080E5FA4 @ =gUnknown_0202E854
	movs r0, 0
	strb r0, [r1]
	ldr r0, _080E5FA8 @ =gPlayerAvatar
	ldrb r1, [r0]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	beq _080E5FAC
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
	bl sav1_reset_battle_music_maybe
	bl sub_8053E90
	b _080E5FC0
	.align 2, 0
_080E5FA4: .4byte gUnknown_0202E854
_080E5FA8: .4byte gPlayerAvatar
_080E5FAC:
	adds r0, r2, 0
	bl SetPlayerAvatarTransitionFlags
	ldr r4, _080E5FC8 @ =0x00000193
	adds r0, r4, 0
	bl sav1_set_battle_music_maybe
	adds r0, r4, 0
	bl sub_8053FB0
_080E5FC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E5FC8: .4byte 0x00000193
	thumb_func_end GetOnOffBike

	thumb_func_start sub_80E5FCC
sub_80E5FCC: @ 80E5FCC
	push {lr}
	ldr r2, _080E6008 @ =gPlayerAvatar
	movs r3, 0
	strb r3, [r2, 0x8]
	strb r3, [r2, 0x9]
	strb r3, [r2, 0xA]
	strb r3, [r2, 0xB]
	str r0, [r2, 0xC]
	str r1, [r2, 0x10]
	movs r1, 0
	adds r2, 0x14
_080E5FE2:
	adds r0, r1, r2
	strb r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _080E5FE2
	movs r1, 0
	ldr r3, _080E600C @ =gUnknown_0202E874
	movs r2, 0
_080E5FF6:
	adds r0, r1, r3
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x7
	bls _080E5FF6
	pop {r0}
	bx r0
	.align 2, 0
_080E6008: .4byte gPlayerAvatar
_080E600C: .4byte gUnknown_0202E874
	thumb_func_end sub_80E5FCC

	thumb_func_start sub_80E6010
sub_80E6010: @ 80E6010
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E6020 @ =gPlayerAvatar
	strb r0, [r2, 0xA]
	lsrs r1, r0, 1
	adds r0, r1
	strb r0, [r2, 0xB]
	bx lr
	.align 2, 0
_080E6020: .4byte gPlayerAvatar
	thumb_func_end sub_80E6010

	thumb_func_start sub_80E6024
sub_80E6024: @ 80E6024
	ldr r1, _080E6030 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0xA]
	strb r0, [r1, 0xB]
	bx lr
	.align 2, 0
_080E6030: .4byte gPlayerAvatar
	thumb_func_end sub_80E6024

	thumb_func_start sub_80E6034
sub_80E6034: @ 80E6034
	push {lr}
	sub sp, 0x8
	ldr r1, _080E605C @ =gUnknown_083DB600
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	ldr r2, _080E6060 @ =gPlayerAvatar
	ldrb r1, [r2]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E6064
	ldrb r0, [r2, 0xA]
	lsls r0, 1
	add r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	b _080E607E
	.align 2, 0
_080E605C: .4byte gUnknown_083DB600
_080E6060: .4byte gPlayerAvatar
_080E6064:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080E6070
	movs r0, 0x3
	b _080E607E
_080E6070:
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _080E607C
	movs r0, 0x1
	b _080E607E
_080E607C:
	movs r0, 0x2
_080E607E:
	add sp, 0x8
	pop {r1}
	bx r1
	thumb_func_end sub_80E6034

	thumb_func_start sub_80E6084
sub_80E6084: @ 80E6084
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r5, _080E60D4 @ =gPlayerAvatar
	ldrb r1, [r5]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080E60CC
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
	lsrs r0, 24
	bl MetatileBehavior_IsBumpySlope
	lsls r0, 24
	cmp r0, 0
	beq _080E60CC
	movs r0, 0x2
	strb r0, [r5, 0x8]
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_8059C94
_080E60CC:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E60D4: .4byte gPlayerAvatar
	thumb_func_end sub_80E6084

	.align 2, 0 @ Don't pad with nop.
