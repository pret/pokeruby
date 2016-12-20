	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

	.align 2
gUnknown_0830FB58:: @ 830FB58
	.4byte MetatileBehavior_IsTrickHouseSlipperyFloor
	.4byte MetatileBehavior_IsIce_2
	.4byte MetatileBehavior_IsWalkSouth
	.4byte MetatileBehavior_IsWalkNorth
	.4byte MetatileBehavior_IsWalkWest
	.4byte MetatileBehavior_IsWalkEast
	.4byte MetatileBehavior_IsSouthwardCurrent
	.4byte MetatileBehavior_IsNorthwardCurrent
	.4byte MetatileBehavior_IsWestwardCurrent
	.4byte MetatileBehavior_IsEastwardCurrent
	.4byte MetatileBehavior_IsSlideSouth
	.4byte MetatileBehavior_IsSlideNorth
	.4byte MetatileBehavior_IsSlideWest
	.4byte MetatileBehavior_IsSlideEast
	.4byte MetatileBehavior_IsWaterfall
	.4byte MetatileBehavior_0xBB
	.4byte MetatileBehavior_0xBC
	.4byte MetatileBehavior_IsMuddySlope

	.align 2
gUnknown_0830FBA0:: @ 830FBA0
	.4byte ForcedMovement_None
	.4byte ForcedMovement_Slip
	.4byte ForcedMovement_Slip
	.4byte sub_8058AAC
	.4byte sub_8058AC4
	.4byte sub_8058ADC
	.4byte sub_8058AF4
	.4byte sub_8058B0C
	.4byte sub_8058B24
	.4byte sub_8058B3C
	.4byte sub_8058B54
	.4byte ForcedMovement_SlideSouth
	.4byte ForcedMovement_SlideNorth
	.4byte ForcedMovement_SlideWest
	.4byte ForcedMovement_SlideEast
	.4byte sub_8058B0C
	.4byte sub_8058C04
	.4byte sub_8058C10
	.4byte ForcedMovement_MuddySlope

	.align 2
gUnknown_0830FBEC:: @ 830FBEC
	.4byte PlayerNotOnBikeNotMoving
	.4byte PlayerNotOnBikeTurningInPlace
	.4byte sub_8058D0C

	.align 2
gUnknown_0830FBF8:: @ 830FBF8
	.4byte MetatileBehavior_IsBumpySlope
	.4byte MetatileBehavior_IsIsolatedVerticalRail
	.4byte MetatileBehavior_IsIsolatedHorizontalRail
	.4byte MetatileBehavior_IsVerticalRail
	.4byte MetatileBehavior_IsHorizontalRail

gUnknown_0830FC0C:: @ 830FC0C
	.byte 0x9, 0xA, 0xB, 0xC, 0xD

	.align 2
gUnknown_0830FC14:: @ 830FC14
	.4byte PlayerAvatarTransition_Normal
	.4byte PlayerAvatarTransition_MachBike
	.4byte PlayerAvatarTransition_AcroBike
	.4byte PlayerAvatarTransition_Surfing
	.4byte PlayerAvatarTransition_Underwater
	.4byte sub_80591F4
	.4byte nullsub_49
	.4byte nullsub_49

	.align 2
gUnknown_0830FC34:: @ 830FC34
	.4byte MetatileBehavior_IsSouthArrowWarp
	.4byte MetatileBehavior_IsNorthArrowWarp
	.4byte MetatileBehavior_IsWestArrowWarp
	.4byte MetatileBehavior_IsEastArrowWarp

gUnknown_0830FC44:: @ 830FC44
	.byte MAP_OBJ_GFX_RIVAL_BRENDAN_NORMAL,     MAP_OBJ_GFX_RIVAL_MAY_NORMAL
	.byte MAP_OBJ_GFX_RIVAL_BRENDAN_MACH_BIKE,  MAP_OBJ_GFX_RIVAL_MAY_MACH_BIKE
	.byte MAP_OBJ_GFX_RIVAL_BRENDAN_ACRO_BIKE,  MAP_OBJ_GFX_RIVAL_MAY_ACRO_BIKE
	.byte MAP_OBJ_GFX_RIVAL_BRENDAN_SURFING,    MAP_OBJ_GFX_RIVAL_MAY_SURFING
	.byte MAP_OBJ_GFX_BRENDAN_UNDERWATER,       MAP_OBJ_GFX_MAY_UNDERWATER
	.byte MAP_OBJ_GFX_RIVAL_BRENDAN_FIELD_MOVE, MAP_OBJ_GFX_RIVAL_MAY_FIELD_MOVE
	.byte MAP_OBJ_GFX_BRENDAN_FISHING,          MAP_OBJ_GFX_MAY_FISHING
	.byte MAP_OBJ_GFX_BRENDAN_WATERING,         MAP_OBJ_GFX_MAY_WATERING

gUnknown_0830FC54:: @ 830FC54
	.byte MAP_OBJ_GFX_BRENDAN_NORMAL,     MAP_OBJ_GFX_MAY_NORMAL
	.byte MAP_OBJ_GFX_BRENDAN_MACH_BIKE,  MAP_OBJ_GFX_MAY_MACH_BIKE
	.byte MAP_OBJ_GFX_BRENDAN_ACRO_BIKE,  MAP_OBJ_GFX_MAY_ACRO_BIKE
	.byte MAP_OBJ_GFX_BRENDAN_SURFING,    MAP_OBJ_GFX_MAY_SURFING
	.byte MAP_OBJ_GFX_BRENDAN_UNDERWATER, MAP_OBJ_GFX_MAY_UNDERWATER
	.byte MAP_OBJ_GFX_BRENDAN_FIELD_MOVE, MAP_OBJ_GFX_MAY_FIELD_MOVE
	.byte MAP_OBJ_GFX_BRENDAN_FISHING,    MAP_OBJ_GFX_MAY_FISHING
	.byte MAP_OBJ_GFX_BRENDAN_WATERING,   MAP_OBJ_GFX_MAY_WATERING

gUnknown_0830FC64:: @ 830FC64
	@ male
	.byte MAP_OBJ_GFX_BRENDAN_NORMAL,      1
	.byte MAP_OBJ_GFX_BRENDAN_MACH_BIKE,   2
	.byte MAP_OBJ_GFX_BRENDAN_ACRO_BIKE,   4
	.byte MAP_OBJ_GFX_BRENDAN_SURFING,     8
	.byte MAP_OBJ_GFX_BRENDAN_UNDERWATER, 16
	@ female
	.byte MAP_OBJ_GFX_MAY_NORMAL,          1
	.byte MAP_OBJ_GFX_MAY_MACH_BIKE,       2
	.byte MAP_OBJ_GFX_MAY_ACRO_BIKE,       4
	.byte MAP_OBJ_GFX_MAY_SURFING,         8
	.byte MAP_OBJ_GFX_MAY_UNDERWATER,     16

	.align 2
gUnknown_0830FC78:: @ 830FC78
	.4byte MetatileBehavior_IsSouthArrowWarp
	.4byte MetatileBehavior_IsNorthArrowWarp
	.4byte MetatileBehavior_IsWestArrowWarp
	.4byte MetatileBehavior_IsEastArrowWarp

	.align 2
gUnknown_0830FC88:: @ 830FC88
	.4byte sub_8059E84
	.4byte sub_8059EA4
	.4byte sub_8059F40

	.align 2
gUnknown_0830FC94:: @ 830FC94
	.4byte sub_805A000

	.align 2
gUnknown_0830FC98:: @ 830FC98
	.4byte sub_805A0D8
	.4byte sub_805A100
	.4byte sub_805A178
	.4byte sub_805A1B8

gUnknown_0830FCA8:: @ 830FCA8
	.byte DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH

gUnknown_0830FCAC:: @ 830FCAC
	.byte 0x10, 0x10, 0x11, 0x12, 0x13

	.align 2
gUnknown_0830FCB4:: @ 830FCB4
	.4byte Fishing1
	.4byte Fishing2
	.4byte Fishing3
	.4byte Fishing4
	.4byte Fishing5
	.4byte Fishing6
	.4byte Fishing7
	.4byte Fishing8
	.4byte Fishing9
	.4byte Fishing10
	.4byte Fishing11
	.4byte Fishing12
	.4byte Fishing13
	.4byte Fishing14
	.4byte Fishing15
	.4byte Fishing16

	.align 1
gUnknown_0830FCF4:: @ 830FCF4
	.2byte 1, 1, 1

	.align 1
gUnknown_0830FCFA:: @ 830FCFA
	.2byte 1, 3, 6

gUnknown_0830FD00:: @ 830FD00
	.string "·$"

	.align 1
gUnknown_0830FD02:: @ 830FD02
	.2byte 36, 33, 30

	.align 1
gUnknown_0830FD08:: @ 830FD08
	.2byte 0, 0, 40, 10, 70, 30
