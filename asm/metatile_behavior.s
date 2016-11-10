	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8056D9C
sub_8056D9C: @ 8056D9C
	movs r0, 0x1
	bx lr
	thumb_func_end sub_8056D9C

	thumb_func_start sub_8056DA0
sub_8056DA0: @ 8056DA0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08056DB8 @ =gUnknown_08308E2C
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08056DBC
	movs r0, 0
	b _08056DBE
	.align 2, 0
_08056DB8: .4byte gUnknown_08308E2C
_08056DBC:
	movs r0, 0x1
_08056DBE:
	pop {r1}
	bx r1
	thumb_func_end sub_8056DA0

	thumb_func_start MetatileBehavior_IsJumpEast
MetatileBehavior_IsJumpEast: @ 8056DC4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x38
	beq _08056DD2
	movs r0, 0
	b _08056DD4
_08056DD2:
	movs r0, 0x1
_08056DD4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpEast

	thumb_func_start MetatileBehavior_IsJumpWest
MetatileBehavior_IsJumpWest: @ 8056DD8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x39
	beq _08056DE6
	movs r0, 0
	b _08056DE8
_08056DE6:
	movs r0, 0x1
_08056DE8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpWest

	thumb_func_start MetatileBehavior_IsJumpNorth
MetatileBehavior_IsJumpNorth: @ 8056DEC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3A
	beq _08056DFA
	movs r0, 0
	b _08056DFC
_08056DFA:
	movs r0, 0x1
_08056DFC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpNorth

	thumb_func_start MetatileBehavior_IsJumpSouth
MetatileBehavior_IsJumpSouth: @ 8056E00
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	beq _08056E0E
	movs r0, 0
	b _08056E10
_08056E0E:
	movs r0, 0x1
_08056E10:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpSouth

	thumb_func_start sub_8056E14
sub_8056E14: @ 8056E14
	push {lr}
	lsls r0, 24
	movs r1, 0xFE
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08056E28
	movs r0, 0
	b _08056E2A
_08056E28:
	movs r0, 0x1
_08056E2A:
	pop {r1}
	bx r1
	thumb_func_end sub_8056E14

	thumb_func_start MetatileBehavior_IsSandOrDeepSand
MetatileBehavior_IsSandOrDeepSand: @ 8056E30
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x21
	beq _08056E3E
	cmp r0, 0x6
	bne _08056E42
_08056E3E:
	movs r0, 0x1
	b _08056E44
_08056E42:
	movs r0, 0
_08056E44:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSandOrDeepSand

	thumb_func_start MetatileBehavior_IsDeepSand
MetatileBehavior_IsDeepSand: @ 8056E48
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	beq _08056E56
	movs r0, 0
	b _08056E58
_08056E56:
	movs r0, 0x1
_08056E58:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsDeepSand

	thumb_func_start MetatileBehavior_IsReflective
MetatileBehavior_IsReflective: @ 8056E5C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _08056E7A
	cmp r0, 0x16
	beq _08056E7A
	cmp r0, 0x1A
	beq _08056E7A
	cmp r0, 0x20
	beq _08056E7A
	cmp r0, 0x14
	beq _08056E7A
	cmp r0, 0x2B
	bne _08056E7E
_08056E7A:
	movs r0, 0x1
	b _08056E80
_08056E7E:
	movs r0, 0
_08056E80:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsReflective

	thumb_func_start MetatileBehavior_IsIce
MetatileBehavior_IsIce: @ 8056E84
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x20
	beq _08056E92
	movs r0, 0
	b _08056E94
_08056E92:
	movs r0, 0x1
_08056E94:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIce

	thumb_func_start is_tile_x69_2_warp_door
is_tile_x69_2_warp_door: @ 8056E98
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x69
	beq _08056EA6
	movs r0, 0
	b _08056EA8
_08056EA6:
	movs r0, 0x1
_08056EA8:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x69_2_warp_door

	thumb_func_start MetatileBehavior_IsDoor
MetatileBehavior_IsDoor: @ 8056EAC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8D
	beq _08056EBA
	cmp r0, 0x69
	bne _08056EBE
_08056EBA:
	movs r0, 0x1
	b _08056EC0
_08056EBE:
	movs r0, 0
_08056EC0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsDoor

	thumb_func_start MetatileBehavior_IsEscalator
MetatileBehavior_IsEscalator: @ 8056EC4
	push {lr}
	lsls r0, 24
	movs r1, 0x96
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08056ED8
	movs r0, 0
	b _08056EDA
_08056ED8:
	movs r0, 0x1
_08056EDA:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsEscalator

	thumb_func_start unref_sub_8056EE0
unref_sub_8056EE0: @ 8056EE0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _08056EEE
	movs r0, 0
	b _08056EF0
_08056EEE:
	movs r0, 0x1
_08056EF0:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8056EE0

	thumb_func_start MetatileBehavior_IsLadder
MetatileBehavior_IsLadder: @ 8056EF4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x61
	beq _08056F02
	movs r0, 0
	b _08056F04
_08056F02:
	movs r0, 0x1
_08056F04:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsLadder

	thumb_func_start sub_8056F08
sub_8056F08: @ 8056F08
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x60
	beq _08056F1A
	cmp r0, 0x6C
	beq _08056F1A
	cmp r0, 0x6E
	bne _08056F1E
_08056F1A:
	movs r0, 0x1
	b _08056F20
_08056F1E:
	movs r0, 0
_08056F20:
	pop {r1}
	bx r1
	thumb_func_end sub_8056F08

	thumb_func_start sub_8056F24
sub_8056F24: @ 8056F24
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6E
	beq _08056F32
	movs r0, 0
	b _08056F34
_08056F32:
	movs r0, 0x1
_08056F34:
	pop {r1}
	bx r1
	thumb_func_end sub_8056F24

	thumb_func_start MetatileBehavior_IsSurfableWaterOrUnderwater
MetatileBehavior_IsSurfableWaterOrUnderwater: @ 8056F38
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08056F50 @ =gUnknown_08308E2C
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08056F54
	movs r0, 0
	b _08056F56
	.align 2, 0
_08056F50: .4byte gUnknown_08308E2C
_08056F54:
	movs r0, 0x1
_08056F56:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSurfableWaterOrUnderwater

	thumb_func_start MetatileBehavior_IsEastArrowWarp
MetatileBehavior_IsEastArrowWarp: @ 8056F5C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x62
	beq _08056F6A
	movs r0, 0
	b _08056F6C
_08056F6A:
	movs r0, 0x1
_08056F6C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsEastArrowWarp

	thumb_func_start MetatileBehavior_IsWestArrowWarp
MetatileBehavior_IsWestArrowWarp: @ 8056F70
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x63
	beq _08056F7E
	movs r0, 0
	b _08056F80
_08056F7E:
	movs r0, 0x1
_08056F80:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWestArrowWarp

	thumb_func_start MetatileBehavior_IsNorthArrowWarp
MetatileBehavior_IsNorthArrowWarp: @ 8056F84
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x64
	beq _08056F92
	cmp r0, 0x1B
	bne _08056F96
_08056F92:
	movs r0, 0x1
	b _08056F98
_08056F96:
	movs r0, 0
_08056F98:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsNorthArrowWarp

	thumb_func_start MetatileBehavior_IsSouthArrowWarp
MetatileBehavior_IsSouthArrowWarp: @ 8056F9C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x65
	beq _08056FAE
	cmp r0, 0x6D
	beq _08056FAE
	cmp r0, 0x1C
	bne _08056FB2
_08056FAE:
	movs r0, 0x1
	b _08056FB4
_08056FB2:
	movs r0, 0
_08056FB4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSouthArrowWarp

	thumb_func_start unref_sub_8056FB8
unref_sub_8056FB8: @ 8056FB8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	adds r0, r4, 0
	bl MetatileBehavior_IsEastArrowWarp
	lsls r0, 24
	cmp r0, 0
	bne _08056FF0
	adds r0, r4, 0
	bl MetatileBehavior_IsWestArrowWarp
	lsls r0, 24
	cmp r0, 0
	bne _08056FF0
	adds r0, r4, 0
	bl MetatileBehavior_IsNorthArrowWarp
	lsls r0, 24
	cmp r0, 0
	bne _08056FF0
	adds r0, r4, 0
	bl MetatileBehavior_IsSouthArrowWarp
	lsls r0, 24
	cmp r0, 0
	beq _08056FF2
_08056FF0:
	movs r5, 0x1
_08056FF2:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8056FB8

	thumb_func_start sub_8056FFC
sub_8056FFC: @ 8056FFC
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xC0
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x8
	bls _08057032
	adds r0, r1, 0
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _08057032
	cmp r1, 0xD0
	beq _08057032
	cmp r1, 0xD2
	beq _08057032
	cmp r1, 0x13
	beq _08057032
	cmp r1, 0x20
	beq _08057032
	cmp r1, 0xBB
	beq _08057032
	cmp r1, 0xBC
	bne _08057036
_08057032:
	movs r0, 0x1
	b _08057038
_08057036:
	movs r0, 0
_08057038:
	pop {r1}
	bx r1
	thumb_func_end sub_8056FFC

	thumb_func_start MetatileBehavior_IsIce_2
MetatileBehavior_IsIce_2: @ 805703C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x20
	beq _0805704A
	movs r0, 0
	b _0805704C
_0805704A:
	movs r0, 0x1
_0805704C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIce_2

	thumb_func_start MetatileBehavior_IsTrickHouseSlipperyFloor
MetatileBehavior_IsTrickHouseSlipperyFloor: @ 8057050
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x48
	beq _0805705E
	movs r0, 0
	b _08057060
_0805705E:
	movs r0, 0x1
_08057060:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsTrickHouseSlipperyFloor

	thumb_func_start MetatileBehavior_0x05
MetatileBehavior_0x05: @ 8057064
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	beq _08057072
	movs r0, 0
	b _08057074
_08057072:
	movs r0, 0x1
_08057074:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_0x05

	thumb_func_start MetatileBehavior_IsWalkNorth
MetatileBehavior_IsWalkNorth: @ 8057078
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x42
	beq _08057086
	movs r0, 0
	b _08057088
_08057086:
	movs r0, 0x1
_08057088:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkNorth

	thumb_func_start MetatileBehavior_IsWalkSouth
MetatileBehavior_IsWalkSouth: @ 805708C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x43
	beq _0805709A
	movs r0, 0
	b _0805709C
_0805709A:
	movs r0, 0x1
_0805709C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkSouth

	thumb_func_start MetatileBehavior_IsWalkWest
MetatileBehavior_IsWalkWest: @ 80570A0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x41
	beq _080570AE
	movs r0, 0
	b _080570B0
_080570AE:
	movs r0, 0x1
_080570B0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkWest

	thumb_func_start MetatileBehavior_IsWalkEast
MetatileBehavior_IsWalkEast: @ 80570B4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080570C2
	movs r0, 0
	b _080570C4
_080570C2:
	movs r0, 0x1
_080570C4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkEast

	thumb_func_start MetatileBehavior_IsNorthwardCurrent
MetatileBehavior_IsNorthwardCurrent: @ 80570C8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x52
	beq _080570D6
	movs r0, 0
	b _080570D8
_080570D6:
	movs r0, 0x1
_080570D8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsNorthwardCurrent

	thumb_func_start MetatileBehavior_IsSouthwardCurrent
MetatileBehavior_IsSouthwardCurrent: @ 80570DC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x53
	beq _080570EA
	movs r0, 0
	b _080570EC
_080570EA:
	movs r0, 0x1
_080570EC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSouthwardCurrent

	thumb_func_start MetatileBehavior_IsWestwardCurrent
MetatileBehavior_IsWestwardCurrent: @ 80570F0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x51
	beq _080570FE
	movs r0, 0
	b _08057100
_080570FE:
	movs r0, 0x1
_08057100:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWestwardCurrent

	thumb_func_start MetatileBehavior_IsEastwardCurrent
MetatileBehavior_IsEastwardCurrent: @ 8057104
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x50
	beq _08057112
	movs r0, 0
	b _08057114
_08057112:
	movs r0, 0x1
_08057114:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsEastwardCurrent

	thumb_func_start MetatileBehavior_IsSlideNorth
MetatileBehavior_IsSlideNorth: @ 8057118
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x46
	beq _08057126
	movs r0, 0
	b _08057128
_08057126:
	movs r0, 0x1
_08057128:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideNorth

	thumb_func_start MetatileBehavior_IsSlideSouth
MetatileBehavior_IsSlideSouth: @ 805712C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x47
	beq _0805713A
	movs r0, 0
	b _0805713C
_0805713A:
	movs r0, 0x1
_0805713C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideSouth

	thumb_func_start MetatileBehavior_IsSlideWest
MetatileBehavior_IsSlideWest: @ 8057140
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x45
	beq _0805714E
	movs r0, 0
	b _08057150
_0805714E:
	movs r0, 0x1
_08057150:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideWest

	thumb_func_start MetatileBehavior_IsSlideEast
MetatileBehavior_IsSlideEast: @ 8057154
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x44
	beq _08057162
	movs r0, 0
	b _08057164
_08057162:
	movs r0, 0x1
_08057164:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideEast

	thumb_func_start MetatileBehavior_IsCounter
MetatileBehavior_IsCounter: @ 8057168
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x80
	beq _08057176
	movs r0, 0
	b _08057178
_08057176:
	movs r0, 0x1
_08057178:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsCounter

	thumb_func_start MetatileBehavior_IsPlayerFacingTVScreen
MetatileBehavior_IsPlayerFacingTVScreen: @ 805717C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x2
	bne _0805718E
	cmp r0, 0x86
	beq _08057192
_0805718E:
	movs r0, 0
	b _08057194
_08057192:
	movs r0, 0x1
_08057194:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPlayerFacingTVScreen

	thumb_func_start MetatileBehavior_IsPC
MetatileBehavior_IsPC: @ 8057198
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x83
	beq _080571A6
	movs r0, 0
	b _080571A8
_080571A6:
	movs r0, 0x1
_080571A8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPC

	thumb_func_start is_tile_x84
is_tile_x84: @ 80571AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x84
	beq _080571BA
	movs r0, 0
	b _080571BC
_080571BA:
	movs r0, 0x1
_080571BC:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x84

	thumb_func_start sub_80571C0
sub_80571C0: @ 80571C0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x91
	beq _080571E2
	cmp r0, 0x93
	beq _080571E2
	cmp r0, 0x95
	beq _080571E2
	cmp r0, 0x97
	beq _080571E2
	cmp r0, 0x99
	beq _080571E2
	cmp r0, 0x9B
	beq _080571E2
	cmp r0, 0x9D
	bne _080571E6
_080571E2:
	movs r0, 0x1
	b _080571E8
_080571E6:
	movs r0, 0
_080571E8:
	pop {r1}
	bx r1
	thumb_func_end sub_80571C0

	thumb_func_start sub_80571EC
sub_80571EC: @ 80571EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x90
	beq _08057202
	cmp r0, 0x92
	beq _08057202
	cmp r0, 0x94
	beq _08057202
	cmp r0, 0x9A
	bne _08057206
_08057202:
	movs r0, 0x1
	b _08057208
_08057206:
	movs r0, 0
_08057208:
	pop {r1}
	bx r1
	thumb_func_end sub_80571EC

	thumb_func_start sub_805720C
sub_805720C: @ 805720C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x96
	beq _0805721A
	cmp r0, 0x9C
	bne _0805721E
_0805721A:
	movs r0, 0x1
	b _08057220
_0805721E:
	movs r0, 0
_08057220:
	pop {r1}
	bx r1
	thumb_func_end sub_805720C

	thumb_func_start is_tile_x98
is_tile_x98: @ 8057224
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x98
	beq _08057232
	movs r0, 0
	b _08057234
_08057232:
	movs r0, 0x1
_08057234:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x98

	thumb_func_start sub_8057238
sub_8057238: @ 8057238
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB0
	beq _08057246
	movs r0, 0
	b _08057248
_08057246:
	movs r0, 0x1
_08057248:
	pop {r1}
	bx r1
	thumb_func_end sub_8057238

	thumb_func_start sub_805724C
sub_805724C: @ 805724C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB1
	beq _0805725A
	movs r0, 0
	b _0805725C
_0805725A:
	movs r0, 0x1
_0805725C:
	pop {r1}
	bx r1
	thumb_func_end sub_805724C

	thumb_func_start unref_sub_8057260
unref_sub_8057260: @ 8057260
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB2
	beq _0805726E
	movs r0, 0
	b _08057270
_0805726E:
	movs r0, 0x1
_08057270:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8057260

	thumb_func_start sub_8057274
sub_8057274: @ 8057274
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB3
	beq _08057282
	movs r0, 0
	b _08057284
_08057282:
	movs r0, 0x1
_08057284:
	pop {r1}
	bx r1
	thumb_func_end sub_8057274

	thumb_func_start sub_8057288
sub_8057288: @ 8057288
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB9
	beq _08057296
	movs r0, 0
	b _08057298
_08057296:
	movs r0, 0x1
_08057298:
	pop {r1}
	bx r1
	thumb_func_end sub_8057288

	thumb_func_start sub_805729C
sub_805729C: @ 805729C
	push {lr}
	lsls r0, 24
	cmp r0, 0
	beq _080572A8
	movs r0, 0
	b _080572AA
_080572A8:
	movs r0, 0x1
_080572AA:
	pop {r1}
	bx r1
	thumb_func_end sub_805729C

	thumb_func_start sub_80572B0
sub_80572B0: @ 80572B0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB7
	beq _080572BE
	movs r0, 0
	b _080572C0
_080572BE:
	movs r0, 0x1
_080572C0:
	pop {r1}
	bx r1
	thumb_func_end sub_80572B0

	thumb_func_start unref_sub_80572C4
unref_sub_80572C4: @ 80572C4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB2
	beq _080572D2
	movs r0, 0
	b _080572D4
_080572D2:
	movs r0, 0x1
_080572D4:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80572C4

	thumb_func_start sub_80572D8
sub_80572D8: @ 80572D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB5
	beq _080572E6
	movs r0, 0
	b _080572E8
_080572E6:
	movs r0, 0x1
_080572E8:
	pop {r1}
	bx r1
	thumb_func_end sub_80572D8

	thumb_func_start sub_80572EC
sub_80572EC: @ 80572EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xC3
	beq _080572FA
	movs r0, 0
	b _080572FC
_080572FA:
	movs r0, 0x1
_080572FC:
	pop {r1}
	bx r1
	thumb_func_end sub_80572EC

	thumb_func_start sub_8057300
sub_8057300: @ 8057300
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xC2
	beq _0805730E
	movs r0, 0
	b _08057310
_0805730E:
	movs r0, 0x1
_08057310:
	pop {r1}
	bx r1
	thumb_func_end sub_8057300

	thumb_func_start sub_8057314
sub_8057314: @ 8057314
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB8
	beq _08057322
	movs r0, 0
	b _08057324
_08057322:
	movs r0, 0x1
_08057324:
	pop {r1}
	bx r1
	thumb_func_end sub_8057314

	thumb_func_start sub_8057328
sub_8057328: @ 8057328
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBE
	beq _08057336
	movs r0, 0
	b _08057338
_08057336:
	movs r0, 0x1
_08057338:
	pop {r1}
	bx r1
	thumb_func_end sub_8057328

	thumb_func_start sub_805733C
sub_805733C: @ 805733C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBD
	beq _0805734A
	movs r0, 0
	b _0805734C
_0805734A:
	movs r0, 0x1
_0805734C:
	pop {r1}
	bx r1
	thumb_func_end sub_805733C

	thumb_func_start sub_8057350
sub_8057350: @ 8057350
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBA
	beq _0805735E
	movs r0, 0
	b _08057360
_0805735E:
	movs r0, 0x1
_08057360:
	pop {r1}
	bx r1
	thumb_func_end sub_8057350

	thumb_func_start sub_8057364
sub_8057364: @ 8057364
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBF
	beq _08057372
	movs r0, 0
	b _08057374
_08057372:
	movs r0, 0x1
_08057374:
	pop {r1}
	bx r1
	thumb_func_end sub_8057364

	thumb_func_start sub_8057378
sub_8057378: @ 8057378
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xC4
	beq _08057386
	movs r0, 0
	b _08057388
_08057386:
	movs r0, 0x1
_08057388:
	pop {r1}
	bx r1
	thumb_func_end sub_8057378

	thumb_func_start sub_805738C
sub_805738C: @ 805738C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xC5
	beq _0805739A
	movs r0, 0
	b _0805739C
_0805739A:
	movs r0, 0x1
_0805739C:
	pop {r1}
	bx r1
	thumb_func_end sub_805738C

	thumb_func_start MetatileBehavior_HasRipples
MetatileBehavior_HasRipples: @ 80573A0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _080573B2
	cmp r0, 0x16
	beq _080573B2
	cmp r0, 0x14
	bne _080573B6
_080573B2:
	movs r0, 0x1
	b _080573B8
_080573B6:
	movs r0, 0
_080573B8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_HasRipples

	thumb_func_start MetatileBehavior_IsPuddle
MetatileBehavior_IsPuddle: @ 80573BC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x16
	beq _080573CA
	movs r0, 0
	b _080573CC
_080573CA:
	movs r0, 0x1
_080573CC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPuddle

	thumb_func_start MetatileBehavior_IsTallGrass
MetatileBehavior_IsTallGrass: @ 80573D0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080573DE
	movs r0, 0
	b _080573E0
_080573DE:
	movs r0, 0x1
_080573E0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsTallGrass

	thumb_func_start MetatileBehavior_IsLongGrass
MetatileBehavior_IsLongGrass: @ 80573E4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080573F2
	movs r0, 0
	b _080573F4
_080573F2:
	movs r0, 0x1
_080573F4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsLongGrass

	thumb_func_start MetatileBehavior_IsBerryTreeSoil
MetatileBehavior_IsBerryTreeSoil: @ 80573F8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA0
	beq _08057406
	movs r0, 0
	b _08057408
_08057406:
	movs r0, 0x1
_08057408:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsBerryTreeSoil

	thumb_func_start MetatileBehavior_IsAsh
MetatileBehavior_IsAsh: @ 805740C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x24
	beq _0805741A
	movs r0, 0
	b _0805741C
_0805741A:
	movs r0, 0x1
_0805741C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsAsh

	thumb_func_start MetatileBehavior_IsUnusedFootprintMetatile
MetatileBehavior_IsUnusedFootprintMetatile: @ 8057420
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x25
	beq _0805742E
	movs r0, 0
	b _08057430
_0805742E:
	movs r0, 0x1
_08057430:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsUnusedFootprintMetatile

	thumb_func_start MetatileBehavior_IsBridge
MetatileBehavior_IsBridge: @ 8057434
	push {lr}
	lsls r0, 24
	movs r1, 0x90
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x3
	bls _08057448
	movs r0, 0
	b _0805744A
_08057448:
	movs r0, 0x1
_0805744A:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsBridge

	thumb_func_start sub_8057450
sub_8057450: @ 8057450
	push {lr}
	lsls r0, 24
	movs r1, 0x90
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x3
	bls _08057462
	movs r0, 0
_08057462:
	pop {r1}
	bx r1
	thumb_func_end sub_8057450

	thumb_func_start MetatileBehavior_IsLandWildEncounter
MetatileBehavior_IsLandWildEncounter: @ 8057468
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _0805748C
	adds r0, r4, 0
	bl sub_8056DA0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0805748C
	movs r0, 0x1
	b _0805748E
_0805748C:
	movs r0, 0
_0805748E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsLandWildEncounter

	thumb_func_start MetatileBehavior_IsWaterWildEncounter
MetatileBehavior_IsWaterWildEncounter: @ 8057494
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080574BA
	adds r0, r4, 0
	bl sub_8056DA0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080574BA
	movs r0, 0x1
	b _080574BC
_080574BA:
	movs r0, 0
_080574BC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWaterWildEncounter

	thumb_func_start sub_80574C4
sub_80574C4: @ 80574C4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB
	beq _080574D2
	movs r0, 0
	b _080574D4
_080574D2:
	movs r0, 0x1
_080574D4:
	pop {r1}
	bx r1
	thumb_func_end sub_80574C4

	thumb_func_start sub_80574D8
sub_80574D8: @ 80574D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xC
	beq _080574E6
	movs r0, 0
	b _080574E8
_080574E6:
	movs r0, 0x1
_080574E8:
	pop {r1}
	bx r1
	thumb_func_end sub_80574D8

	thumb_func_start sub_80574EC
sub_80574EC: @ 80574EC
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xEF
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x1
	bls _08057502
	cmp r1, 0x14
	bne _08057506
_08057502:
	movs r0, 0x1
	b _08057508
_08057506:
	movs r0, 0
_08057508:
	pop {r1}
	bx r1
	thumb_func_end sub_80574EC

	thumb_func_start sub_805750C
sub_805750C: @ 805750C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x19
	beq _0805751A
	cmp r0, 0x2A
	bne _0805751E
_0805751A:
	movs r0, 0x1
	b _08057520
_0805751E:
	movs r0, 0
_08057520:
	pop {r1}
	bx r1
	thumb_func_end sub_805750C

	thumb_func_start MetatileBehavior_IsShallowFlowingWater
MetatileBehavior_IsShallowFlowingWater: @ 8057524
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x17
	beq _08057536
	cmp r0, 0x1B
	beq _08057536
	cmp r0, 0x1C
	bne _0805753A
_08057536:
	movs r0, 0x1
	b _0805753C
_0805753A:
	movs r0, 0
_0805753C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsShallowFlowingWater

	thumb_func_start sub_8057540
sub_8057540: @ 8057540
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x26
	beq _0805754E
	movs r0, 0
	b _08057550
_0805754E:
	movs r0, 0x1
_08057550:
	pop {r1}
	bx r1
	thumb_func_end sub_8057540

	thumb_func_start sub_8057554
sub_8057554: @ 8057554
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x27
	beq _08057562
	movs r0, 0
	b _08057564
_08057562:
	movs r0, 0x1
_08057564:
	pop {r1}
	bx r1
	thumb_func_end sub_8057554

	thumb_func_start sub_8057568
sub_8057568: @ 8057568
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x15
	beq _0805757A
	cmp r0, 0x11
	beq _0805757A
	cmp r0, 0x12
	bne _0805757E
_0805757A:
	movs r0, 0x1
	b _08057580
_0805757E:
	movs r0, 0
_08057580:
	pop {r1}
	bx r1
	thumb_func_end sub_8057568

	thumb_func_start unref_sub_8057584
unref_sub_8057584: @ 8057584
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x18
	beq _08057592
	cmp r0, 0x1A
	bne _08057596
_08057592:
	movs r0, 0x1
	b _08057598
_08057596:
	movs r0, 0
_08057598:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8057584

	thumb_func_start sub_805759C
sub_805759C: @ 805759C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	beq _080575BE
	adds r0, r4, 0
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	cmp r0, 0
	bne _080575BE
	movs r0, 0x1
	b _080575C0
_080575BE:
	movs r0, 0
_080575C0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805759C

	thumb_func_start MetatileBehavior_IsEastBlocked
MetatileBehavior_IsEastBlocked: @ 80575C8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x30
	beq _080575E2
	cmp r0, 0x34
	beq _080575E2
	cmp r0, 0x36
	beq _080575E2
	cmp r0, 0xC1
	beq _080575E2
	cmp r0, 0xBE
	bne _080575E6
_080575E2:
	movs r0, 0x1
	b _080575E8
_080575E6:
	movs r0, 0
_080575E8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsEastBlocked

	thumb_func_start MetatileBehavior_IsWestBlocked
MetatileBehavior_IsWestBlocked: @ 80575EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	beq _08057606
	cmp r0, 0x35
	beq _08057606
	cmp r0, 0x37
	beq _08057606
	cmp r0, 0xC1
	beq _08057606
	cmp r0, 0xBE
	bne _0805760A
_08057606:
	movs r0, 0x1
	b _0805760C
_0805760A:
	movs r0, 0
_0805760C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWestBlocked

	thumb_func_start MetatileBehavior_IsNorthBlocked
MetatileBehavior_IsNorthBlocked: @ 8057610
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x32
	beq _08057626
	cmp r0, 0x34
	beq _08057626
	cmp r0, 0x35
	beq _08057626
	cmp r0, 0xC0
	bne _0805762A
_08057626:
	movs r0, 0x1
	b _0805762C
_0805762A:
	movs r0, 0
_0805762C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsNorthBlocked

	thumb_func_start MetatileBehavior_IsSouthBlocked
MetatileBehavior_IsSouthBlocked: @ 8057630
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x33
	beq _08057646
	cmp r0, 0x36
	beq _08057646
	cmp r0, 0x37
	beq _08057646
	cmp r0, 0xC0
	bne _0805764A
_08057646:
	movs r0, 0x1
	b _0805764C
_0805764A:
	movs r0, 0
_0805764C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSouthBlocked

	thumb_func_start MetatileBehavior_IsShortGrass
MetatileBehavior_IsShortGrass: @ 8057650
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x7
	beq _0805765E
	movs r0, 0
	b _08057660
_0805765E:
	movs r0, 0x1
_08057660:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsShortGrass

	thumb_func_start MetatileBehavior_IsHotSprings
MetatileBehavior_IsHotSprings: @ 8057664
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x28
	beq _08057672
	movs r0, 0
	b _08057674
_08057672:
	movs r0, 0x1
_08057674:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsHotSprings

	thumb_func_start MetatileBehavior_IsWaterfall
MetatileBehavior_IsWaterfall: @ 8057678
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	beq _08057686
	movs r0, 0
	b _08057688
_08057686:
	movs r0, 0x1
_08057688:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWaterfall

	thumb_func_start MetatileBehavior_IsFortreeBridge
MetatileBehavior_IsFortreeBridge: @ 805768C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x78
	beq _0805769A
	movs r0, 0
	b _0805769C
_0805769A:
	movs r0, 0x1
_0805769C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsFortreeBridge

	thumb_func_start sub_80576A0
sub_80576A0: @ 80576A0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x74
	beq _080576AE
	movs r0, 0
	b _080576B0
_080576AE:
	movs r0, 0x1
_080576B0:
	pop {r1}
	bx r1
	thumb_func_end sub_80576A0

	thumb_func_start sub_80576B4
sub_80576B4: @ 80576B4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x75
	beq _080576C2
	movs r0, 0
	b _080576C4
_080576C2:
	movs r0, 0x1
_080576C4:
	pop {r1}
	bx r1
	thumb_func_end sub_80576B4

	thumb_func_start sub_80576C8
sub_80576C8: @ 80576C8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x76
	beq _080576D6
	movs r0, 0
	b _080576D8
_080576D6:
	movs r0, 0x1
_080576D8:
	pop {r1}
	bx r1
	thumb_func_end sub_80576C8

	thumb_func_start sub_80576DC
sub_80576DC: @ 80576DC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x77
	beq _080576EA
	movs r0, 0
	b _080576EC
_080576EA:
	movs r0, 0x1
_080576EC:
	pop {r1}
	bx r1
	thumb_func_end sub_80576DC

	thumb_func_start MetatileBehavior_IsPacifidlogLog
MetatileBehavior_IsPacifidlogLog: @ 80576F0
	push {lr}
	lsls r0, 24
	movs r1, 0x8C
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x3
	bls _08057704
	movs r0, 0
	b _08057706
_08057704:
	movs r0, 0x1
_08057706:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPacifidlogLog

	thumb_func_start is_tile_x8C
is_tile_x8C: @ 805770C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8C
	beq _0805771A
	movs r0, 0
	b _0805771C
_0805771A:
	movs r0, 0x1
_0805771C:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x8C

	thumb_func_start is_tile_x85
is_tile_x85: @ 8057720
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x85
	beq _0805772E
	movs r0, 0
	b _08057730
_0805772E:
	movs r0, 0x1
_08057730:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x85

	thumb_func_start is_tile_x8B
is_tile_x8B: @ 8057734
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8B
	beq _08057742
	movs r0, 0
	b _08057744
_08057742:
	movs r0, 0x1
_08057744:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x8B

	thumb_func_start is_tile_x8A
is_tile_x8A: @ 8057748
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8A
	beq _08057756
	movs r0, 0
	b _08057758
_08057756:
	movs r0, 0x1
_08057758:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x8A

	thumb_func_start is_tile_x87
is_tile_x87: @ 805775C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x87
	beq _0805776A
	movs r0, 0
	b _0805776C
_0805776A:
	movs r0, 0x1
_0805776C:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x87

	thumb_func_start MetatileBehavior_0xBB
MetatileBehavior_0xBB: @ 8057770
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBB
	beq _0805777E
	movs r0, 0
	b _08057780
_0805777E:
	movs r0, 0x1
_08057780:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_0xBB

	thumb_func_start MetatileBehavior_0xBC
MetatileBehavior_0xBC: @ 8057784
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBC
	beq _08057792
	movs r0, 0
	b _08057794
_08057792:
	movs r0, 0x1
_08057794:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_0xBC

	thumb_func_start sub_8057798
sub_8057798: @ 8057798
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x29
	beq _080577A6
	movs r0, 0
	b _080577A8
_080577A6:
	movs r0, 0x1
_080577A8:
	pop {r1}
	bx r1
	thumb_func_end sub_8057798

	thumb_func_start is_role_x68
is_role_x68: @ 80577AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x68
	beq _080577BA
	movs r0, 0
	b _080577BC
_080577BA:
	movs r0, 0x1
_080577BC:
	pop {r1}
	bx r1
	thumb_func_end is_role_x68

	thumb_func_start MetatileBehavior_IsAquaHideoutWarp
MetatileBehavior_IsAquaHideoutWarp: @ 80577C0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x67
	beq _080577CE
	movs r0, 0
	b _080577D0
_080577CE:
	movs r0, 0x1
_080577D0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsAquaHideoutWarp

	thumb_func_start MetatileBehavior_IsSurfableFishableWater
MetatileBehavior_IsSurfableFishableWater: @ 80577D4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _080577F8
	cmp r0, 0x15
	beq _080577F8
	cmp r0, 0x11
	beq _080577F8
	cmp r0, 0x12
	beq _080577F8
	cmp r0, 0x14
	beq _080577F8
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _080577FC
_080577F8:
	movs r0, 0x1
	b _080577FE
_080577FC:
	movs r0, 0
_080577FE:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSurfableFishableWater

	thumb_func_start sub_8057804
sub_8057804: @ 8057804
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xF
	beq _08057812
	movs r0, 0
	b _08057814
_08057812:
	movs r0, 0x1
_08057814:
	pop {r1}
	bx r1
	thumb_func_end sub_8057804

	thumb_func_start sub_8057818
sub_8057818: @ 8057818
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x66
	beq _08057826
	movs r0, 0
	b _08057828
_08057826:
	movs r0, 0x1
_08057828:
	pop {r1}
	bx r1
	thumb_func_end sub_8057818

	thumb_func_start sub_805782C
sub_805782C: @ 805782C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD2
	beq _0805783A
	movs r0, 0
	b _0805783C
_0805783A:
	movs r0, 0x1
_0805783C:
	pop {r1}
	bx r1
	thumb_func_end sub_805782C

	thumb_func_start MetatileBehavior_IsMuddySlope
MetatileBehavior_IsMuddySlope: @ 8057840
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD0
	beq _0805784E
	movs r0, 0
	b _08057850
_0805784E:
	movs r0, 0x1
_08057850:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsMuddySlope

	thumb_func_start MetatileBehavior_IsBumpySlope
MetatileBehavior_IsBumpySlope: @ 8057854
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD1
	beq _08057862
	movs r0, 0
	b _08057864
_08057862:
	movs r0, 0x1
_08057864:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsBumpySlope

	thumb_func_start MetatileBehavior_IsIsolatedVerticalRail
MetatileBehavior_IsIsolatedVerticalRail: @ 8057868
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD3
	beq _08057876
	movs r0, 0
	b _08057878
_08057876:
	movs r0, 0x1
_08057878:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIsolatedVerticalRail

	thumb_func_start MetatileBehavior_IsIsolatedHorizontalRail
MetatileBehavior_IsIsolatedHorizontalRail: @ 805787C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD4
	beq _0805788A
	movs r0, 0
	b _0805788C
_0805788A:
	movs r0, 0x1
_0805788C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIsolatedHorizontalRail

	thumb_func_start MetatileBehavior_IsVerticalRail
MetatileBehavior_IsVerticalRail: @ 8057890
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD5
	beq _0805789E
	movs r0, 0
	b _080578A0
_0805789E:
	movs r0, 0x1
_080578A0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsVerticalRail

	thumb_func_start MetatileBehavior_IsHorizontalRail
MetatileBehavior_IsHorizontalRail: @ 80578A4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD6
	beq _080578B2
	movs r0, 0
	b _080578B4
_080578B2:
	movs r0, 0x1
_080578B4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsHorizontalRail

	thumb_func_start MetatileBehavior_IsSeaweed
MetatileBehavior_IsSeaweed: @ 80578B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x22
	beq _080578C6
	cmp r0, 0x2A
	bne _080578CA
_080578C6:
	movs r0, 0x1
	b _080578CC
_080578CA:
	movs r0, 0
_080578CC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSeaweed

	thumb_func_start MetatileBehavior_IsRunningDisallowed
MetatileBehavior_IsRunningDisallowed: @ 80578D0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	beq _080578EC
	cmp r0, 0x3
	beq _080578EC
	cmp r0, 0x28
	beq _080578EC
	bl MetatileBehavior_IsPacifidlogLog
	lsls r0, 24
	cmp r0, 0
	beq _080578F0
_080578EC:
	movs r0, 0x1
	b _080578F2
_080578F0:
	movs r0, 0
_080578F2:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsRunningDisallowed

	thumb_func_start sub_80578F8
sub_80578F8: @ 80578F8
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFE
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x1
	bls _08057912
	cmp r1, 0x24
	beq _08057912
	cmp r1, 0x9
	bne _08057916
_08057912:
	movs r0, 0x1
	b _08057918
_08057916:
	movs r0, 0
_08057918:
	pop {r1}
	bx r1
	thumb_func_end sub_80578F8

	thumb_func_start sub_805791C
sub_805791C: @ 805791C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8E
	beq _0805792A
	movs r0, 0
	b _0805792C
_0805792A:
	movs r0, 0x1
_0805792C:
	pop {r1}
	bx r1
	thumb_func_end sub_805791C

	thumb_func_start sub_8057930
sub_8057930: @ 8057930
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE0
	beq _0805793E
	movs r0, 0
	b _08057940
_0805793E:
	movs r0, 0x1
_08057940:
	pop {r1}
	bx r1
	thumb_func_end sub_8057930

	thumb_func_start sub_8057944
sub_8057944: @ 8057944
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE1
	beq _08057952
	movs r0, 0
	b _08057954
_08057952:
	movs r0, 0x1
_08057954:
	pop {r1}
	bx r1
	thumb_func_end sub_8057944

	thumb_func_start sub_8057958
sub_8057958: @ 8057958
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE2
	beq _08057966
	movs r0, 0
	b _08057968
_08057966:
	movs r0, 0x1
_08057968:
	pop {r1}
	bx r1
	thumb_func_end sub_8057958

	thumb_func_start sub_805796C
sub_805796C: @ 805796C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE3
	beq _0805797A
	movs r0, 0
	b _0805797C
_0805797A:
	movs r0, 0x1
_0805797C:
	pop {r1}
	bx r1
	thumb_func_end sub_805796C

	thumb_func_start sub_8057980
sub_8057980: @ 8057980
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE4
	beq _0805798E
	movs r0, 0
	b _08057990
_0805798E:
	movs r0, 0x1
_08057990:
	pop {r1}
	bx r1
	thumb_func_end sub_8057980

	thumb_func_start sub_8057994
sub_8057994: @ 8057994
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE5
	beq _080579A2
	movs r0, 0
	b _080579A4
_080579A2:
	movs r0, 0x1
_080579A4:
	pop {r1}
	bx r1
	thumb_func_end sub_8057994

	thumb_func_start sub_80579A8
sub_80579A8: @ 80579A8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE6
	beq _080579B6
	movs r0, 0
	b _080579B8
_080579B6:
	movs r0, 0x1
_080579B8:
	pop {r1}
	bx r1
	thumb_func_end sub_80579A8

	.align 2, 0 @ Don't pad with nop.
