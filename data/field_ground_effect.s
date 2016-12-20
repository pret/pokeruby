	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.section .rodata

@ Functions used to determine which category of tile the player is landing
@ on after jumping over a ledge.
	.align 2
gJumpLanding_MetatileFunctionPointers:: @ 8376010
	.4byte MetatileBehavior_IsTallGrass
	.4byte MetatileBehavior_IsLongGrass
	.4byte MetatileBehavior_IsPuddle
	.4byte MetatileBehavior_IsSurfableWaterOrUnderwater
	.4byte MetatileBehavior_IsShallowFlowingWater
	.4byte sub_8056D9C

@ This table contains bitmasks used for determining the animation that happens when the player lands on
@ the ground after jumping over a ledge. Each entry corresponds to the gJumpLanding_MetatileFunctionPointers table.
	.align 2
gJumpLanding_Bitmasks:: @ 8376028
	.4byte 0x00001000  @ Landing in tall grass
	.4byte 0x00002000  @ Landing in long grass
	.4byte 0x00004000  @ Landing on puddle
	.4byte 0x00008000  @ Landing on surfable water or underwater
	.4byte 0x00004000  @ Landing on shallow flowing water
	.4byte 0x00010000  @ Landing on any other type of ground

	.align 2
gUnknown_08376040:: @ 8376040
	.4byte MetatileBehavior_IsJumpSouth
	.4byte MetatileBehavior_IsJumpNorth
	.4byte MetatileBehavior_IsJumpWest
	.4byte MetatileBehavior_IsJumpEast

gUnknown_08376050:: @ 8376050
	.byte 0x73, 0x73, 0x53, 0x73, 0x53, 0x73, 0x53, 0x73, 0x53, 0x73, 0x53, 0x73, 0x53, 0x00, 0x00, 0x73

@ Each byte corresponds to a sprite priority for a field object.
@ This is directly the inverse of gFieldObjectPriorities_08376070.
gFieldObjectPriorities_08376060:: @ 8376060
	.byte 2, 2, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 0, 0, 2

@ Each byte corresponds to a sprite priority for a field object.
@ This is the inverse of gFieldObjectPriorities_08376060.
@ 1 = Above player sprite
@ 2 = Below player sprite
gFieldObjectPriorities_08376070:: @ 8376070
	.byte 1, 1, 1, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 0, 0, 1

	.align 2
gUnknown_08376080:: @ 8376080
	.4byte nullsub_50
	.4byte DoTracksGroundEffect_Footprints
	.4byte DoTracksGroundEffect_BikeTireTracks

@ First byte is a Field Effect script id. (gFieldEffectScriptPointers)
@ Last three bytes are unknown.
gSandFootprints_FieldEffectData:: @ 837608C
	.byte 0xD, 0x0, 0x18, 0x0

@ Specifies which bike track shape to show next.
@ For example, when the bike turns from up to right, it will show
@ a track that curves to the right.
@ Each 4-byte row corresponds to the initial direction of the bike, and
@ each byte in that row is for the next direction of the bike in the order
@ of down, up, left, right.
gBikeTireTracks_Transitions:: @ 8376090
	.byte 1, 2, 7, 8
	.byte 1, 2, 6, 5
	.byte 5, 8, 3, 4
	.byte 6, 7, 3, 4

	.align 2
gUnknown_083760A0:: @ 83760A0
	.4byte GroundEffect_SpawnOnTallGrass
	.4byte sub_8063E94
	.4byte sub_8063EE0
	.4byte sub_8063F2C
	.4byte GroundEffect_WaterReflection
	.4byte GroundEffect_IceReflection
	.4byte GroundEffect_FlowingWater
	.4byte sub_8063FA0
	.4byte sub_8063FCC
	.4byte GroundEffect_Ripple
	.4byte GroundEffect_StepOnPuddle
	.4byte GroundEffect_SandPile
	.4byte GroundEffect_JumpOnTallGrass
	.4byte GroundEffect_JumpOnLongGrass
	.4byte GroundEffect_JumpOnShallowWater
	.4byte GroundEffect_JumpOnWater
	.4byte GroundEffect_JumpLandingDust
	.4byte GroundEffect_ShortGrass
	.4byte GroundEffect_HotSprings
	.4byte GroundEffect_Seaweed
