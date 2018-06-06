#include "global.h"
#include "metatile_behavior.h"
#include "constants/metatile_behaviors.h"

#define TILE_ATTRIBUTES(three, two, one) (((one) ? 1 : 0) | ((two) ? 2 : 0) | ((three) ? 4 : 0))

static const u8 sTileBitAttributes[] =
{
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, TRUE),
    TILE_ATTRIBUTES(TRUE, FALSE, TRUE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, TRUE),
    TILE_ATTRIBUTES(TRUE, FALSE, TRUE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, TRUE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, TRUE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, TRUE, TRUE),
    TILE_ATTRIBUTES(TRUE, TRUE, TRUE),
    TILE_ATTRIBUTES(TRUE, TRUE, TRUE),
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),
    TILE_ATTRIBUTES(TRUE, TRUE, TRUE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, TRUE, TRUE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, TRUE),
    TILE_ATTRIBUTES(TRUE, FALSE, TRUE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, TRUE, TRUE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE),
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE)
};

// only used as default case for checking jump landing in field_ground_effect.
bool8 MetatileBehavior_IsATile(u8 var)
{
    return TRUE;
}

bool8 MetatileBehavior_IsEncounterTile(u8 var)
{
    if ((sTileBitAttributes[var] & 1) != 0)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsJumpEast(u8 var)
{
    if (var == MB_JUMP_EAST)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsJumpWest(u8 var)
{
    if (var == MB_JUMP_WEST)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsJumpNorth(u8 var)
{
    if (var == MB_JUMP_NORTH)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsJumpSouth(u8 var)
{
    if (var == MB_JUMP_SOUTH)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsPokeGrass(u8 var)
{
    if (var == MB_TALL_GRASS || var == MB_LONG_GRASS)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSandOrDeepSand(u8 var)
{
    if (var == MB_SAND || var == MB_DEEP_SAND)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsDeepSand(u8 var)
{
    if (var == MB_DEEP_SAND)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsReflective(u8 var)
{
    if (var == MB_POND_WATER || var == MB_PUDDLE || var == MB_1A || var == MB_ICE || var == MB_SOOTOPOLIS_DEEP_WATER || var == MB_REFLECTION_UNDER_BRIDGE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsIce(u8 var)
{
    if (var == MB_ICE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWarpDoor(u8 var)
{
    if (var == MB_ANIMATED_DOOR)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsDoor(u8 var)
{
    if (var == MB_8D || var == MB_ANIMATED_DOOR)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsEscalator(u8 var)
{
    if (var == MB_UP_ESCALATOR || var == MB_DOWN_ESCALATOR)
        return TRUE;
    else
        return FALSE;
}

bool8 unref_sub_8056EE0(u8 var)
{
    if (var == MB_04)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsLadder(u8 var)
{
    if (var == MB_LADDER)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsNonAnimDoor(u8 var)
{
    if (var == MB_NON_ANIMATED_DOOR || var == MB_WATER_DOOR || var == MB_DEEP_SOUTH_WARP)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsDeepSouthWarp(u8 var)
{
    if (var == MB_DEEP_SOUTH_WARP)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSurfableWaterOrUnderwater(u8 var)
{
    if ((sTileBitAttributes[var] & 2) != 0)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsEastArrowWarp(u8 var)
{
    if (var == MB_EAST_ARROW_WARP)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWestArrowWarp(u8 var)
{
    if (var == MB_WEST_ARROW_WARP)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsNorthArrowWarp(u8 var)
{
    if (var == MB_NORTH_ARROW_WARP || var == MB_STAIRS_OUTSIDE_ABANDONED_SHIP)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSouthArrowWarp(u8 var)
{
    if (var == MB_SOUTH_ARROW_WARP || var == MB_WATER_SOUTH_ARROW_WARP || var == MB_SHOAL_CAVE_ENTRANCE)
        return TRUE;
    else
        return FALSE;
}

// unused
bool8 MetatileBehavior_IsArrowWarp(u8 var)
{
    u8 var2 = 0;

    if (MetatileBehavior_IsEastArrowWarp(var)
        || MetatileBehavior_IsWestArrowWarp(var)
        || MetatileBehavior_IsNorthArrowWarp(var)
        || MetatileBehavior_IsSouthArrowWarp(var))
    {
        var2 = 1;
    }
        return var2;
}

bool8 MetatileBehavior_IsMoveTile(u8 var)
{
    if ((var >= MB_WALK_EAST && var <= MB_TRICK_HOUSE_PUZZLE_8_FLOOR) || (var >= MB_EASTWARD_CURRENT && var <= MB_SOUTHWARD_CURRENT)
    || var == MB_MUDDY_SLOPE || var == MB_CRACKED_FLOOR || var == MB_WATERFALL || var == MB_ICE || var == MB_BB || var == MB_BC)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsIce_2(u8 var)
{
    if (var == MB_ICE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsTrickHouseSlipperyFloor(u8 var)
{
    if (var == MB_TRICK_HOUSE_PUZZLE_8_FLOOR)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_0x05(u8 var)
{
    if (var == MB_05)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWalkNorth(u8 var)
{
    if (var == MB_WALK_NORTH)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWalkSouth(u8 var)
{
    if (var == MB_WALK_SOUTH)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWalkWest(u8 var)
{
    if (var == MB_WALK_WEST)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWalkEast(u8 var)
{
    if (var == MB_WALK_EAST)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsNorthwardCurrent(u8 var)
{
    if (var == MB_NORTHWARD_CURRENT)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSouthwardCurrent(u8 var)
{
    if (var == MB_SOUTHWARD_CURRENT)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWestwardCurrent(u8 var)
{
    if (var == MB_WESTWARD_CURRENT)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsEastwardCurrent(u8 var)
{
    if (var == MB_EASTWARD_CURRENT)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSlideNorth(u8 var)
{
    if (var == MB_SLIDE_NORTH)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSlideSouth(u8 var)
{
    if (var == MB_SLIDE_SOUTH)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSlideWest(u8 var)
{
    if (var == MB_SLIDE_WEST)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSlideEast(u8 var)
{
    if (var == MB_SLIDE_EAST)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsCounter(u8 var)
{
    if (var == MB_COUNTER)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsPlayerFacingTVScreen(u8 tile, u8 playerDir)
{
    if (playerDir != CONNECTION_NORTH) // if the player isn't facing north, forget about it.
        return FALSE;
    else if (tile == MB_TELEVISION) // is the player's north tile a TV?
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsPC(u8 var)
{
    if (var == MB_PC)
        return TRUE;
    else
        return FALSE;
}

bool8 is_tile_x84(u8 var)
{
    if (var == MB_84)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80571C0(u8 var)
{
    if (var == MB_91 || var == MB_93 || var == MB_95 || var == MB_97
    || var == MB_99 || var == MB_9B || var == MB_9D)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSecretBaseCave(u8 var)
{
    if (var == MB_SECRET_BASE_SPOT_RED_CAVE || var == MB_SECRET_BASE_SPOT_BROWN_CAVE || var == MB_SECRET_BASE_SPOT_YELLOW_CAVE || var == MB_SECRET_BASE_SPOT_BLUE_CAVE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSecretBaseTree(u8 var)
{
    if (var == MB_SECRET_BASE_SPOT_TREE_1 || var == MB_SECRET_BASE_SPOT_TREE_2)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSecretBaseShrub(u8 var)
{
    if (var == MB_SECRET_BASE_SPOT_SHRUB)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSecretBasePC(u8 var)
{
    if (var == MB_SECRET_BASE_PC)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_805724C(u8 var)
{
    if (var == MB_B1)
        return TRUE;
    else
        return FALSE;
}

bool8 unref_sub_8057260(u8 var)
{
    if (var == MB_B2)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057274(u8 var)
{
    if (var == MB_B3)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057288(u8 var)
{
    if (var == MB_B9)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_805729C(u8 var)
{
    if (var == MB_NORMAL)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80572B0(u8 var)
{
    if (var == MB_B7)
        return TRUE;
    else
        return FALSE;
}

bool8 unref_sub_80572C4(u8 var)
{
    if (var == MB_B2)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80572D8(u8 var)
{
    if (var == MB_B5)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80572EC(u8 var)
{
    if (var == MB_C3)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057300(u8 var)
{
    if (var == MB_C2)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057314(u8 var)
{
    if (var == MB_B8)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057328(u8 var)
{
    if (var == MB_BE)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_805733C(u8 var)
{
    if (var == MB_BD)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057350(u8 var)
{
    if (var == MB_BA)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057364(u8 var)
{
    if (var == MB_BF)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057378(u8 var)
{
    if (var == MB_C4)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_805738C(u8 var)
{
    if (var == MB_C5)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_HasRipples(u8 var)
{
    if (var == MB_POND_WATER || var == MB_PUDDLE || var == MB_SOOTOPOLIS_DEEP_WATER)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsPuddle(u8 var)
{
    if (var == MB_PUDDLE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsTallGrass(u8 var)
{
    if (var == MB_TALL_GRASS)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsLongGrass(u8 var)
{
    if (var == MB_LONG_GRASS)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsBerryTreeSoil(u8 var)
{
    if (var == MB_BERRY_TREE_SOIL)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsAshGrass(u8 var)
{
    if (var == MB_ASHGRASS)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsUnusedFootprintMetatile(u8 var)
{
    if (var == MB_25)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsBridge(u8 var)
{
    if (var >= MB_WARP_OR_BRIDGE && var <= MB_ROUTE120_NORTH_BRIDGE_2)
        return TRUE;
    else
        return FALSE;
}

u8 sub_8057450(u8 var)
{
    u8 result = var - MB_WARP_OR_BRIDGE;

    if (result > 3)
        result = 0;

    return result;
}

bool8 MetatileBehavior_IsLandWildEncounter(u8 var)
{
    if (MetatileBehavior_IsSurfableWaterOrUnderwater(var) == FALSE && MetatileBehavior_IsEncounterTile(var) == TRUE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWaterWildEncounter(u8 var)
{
    if (MetatileBehavior_IsSurfableWaterOrUnderwater(var) == TRUE && MetatileBehavior_IsEncounterTile(var) == TRUE)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80574C4(u8 var)
{
    if (var == MB_0B)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80574D8(u8 var)
{
    if (var == MB_MOUNTAIN_TOP)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsDiveable(u8 metatileBehavior)
{
    if (metatileBehavior == MB_SEMI_DEEP_WATER
     || metatileBehavior == MB_DEEP_WATER
     || metatileBehavior == MB_SOOTOPOLIS_DEEP_WATER)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsNotSurfacable(u8 var)
{
    if (var == MB_NO_SURFACING || var == MB_SEAWEED_NO_SURFACING)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsShallowFlowingWater(u8 var)
{
    if (var == MB_SHALLOW_WATER || var == MB_STAIRS_OUTSIDE_ABANDONED_SHIP || var == MB_SHOAL_CAVE_ENTRANCE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsThinIce(u8 var)
{
    if (var == MB_THIN_ICE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsCrackedIce(u8 var)
{
    if (var == MB_CRACKED_ICE)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057568(u8 var)
{
    if (var == MB_OCEAN_WATER || var == MB_SEMI_DEEP_WATER || var == MB_DEEP_WATER)
        return TRUE;
    else
        return FALSE;
}

bool8 unref_sub_8057584(u8 var)
{
    if (var == MB_18 || var == MB_1A)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_805759C(u8 var)
{
    if (MetatileBehavior_IsSurfableWaterOrUnderwater(var) && MetatileBehavior_IsWaterfall(var) == FALSE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsEastBlocked(u8 var)
{
    if (var == MB_IMPASSABLE_EAST || var == MB_IMPASSABLE_NORTHEAST || var == MB_IMPASSABLE_SOUTHEAST || var == MB_C1 || var == MB_BE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWestBlocked(u8 var)
{
    if (var == MB_IMPASSABLE_WEST || var == MB_IMPASSABLE_NORTHWEST || var == MB_IMPASSABLE_SOUTHWEST || var == MB_C1 || var == MB_BE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsNorthBlocked(u8 var)
{
    if (var == MB_IMPASSABLE_NORTH || var == MB_IMPASSABLE_NORTHEAST || var == MB_IMPASSABLE_NORTHWEST || var == MB_BED)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSouthBlocked(u8 var)
{
    if (var == MB_IMPASSABLE_SOUTH || var == MB_IMPASSABLE_SOUTHEAST || var == MB_IMPASSABLE_SOUTHWEST || var == MB_BED)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsShortGrass(u8 var)
{
    if (var == MB_SHORT_GRASS)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsHotSprings(u8 var)
{
    if (var == MB_HOT_SPRINGS)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWaterfall(u8 var)
{
    if (var == MB_WATERFALL)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsFortreeBridge(u8 var)
{
    if (var == MB_FORTREE_BRIDGE)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80576A0(u8 var)
{
    if (var == MB_PACIFIDLOG_VERTICAL_LOG_1)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80576B4(u8 var)
{
    if (var == MB_PACIFIDLOG_VERTICAL_LOG_2)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80576C8(u8 var)
{
    if (var == MB_PACIFIDLOG_HORIZONTAL_LOG_1)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80576DC(u8 var)
{
    if (var == MB_PACIFIDLOG_HORIZONTAL_LOG_2)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsPacifidlogLog(u8 var)
{
    if (var >= MB_PACIFIDLOG_VERTICAL_LOG_1 && var <= MB_PACIFIDLOG_HORIZONTAL_LOG_2)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsTrickHousePuzzleDoor(u8 var)
{
    if (var == MB_TRICK_HOUSE_PUZZLE_DOOR)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsRegionMap(u8 var)
{
    if (var == MB_REGION_MAP)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsClosedSootopolisGymDoor(u8 var)
{
    if (var == MB_CLOSED_SOOTOPOLIS_GYM_DOOR)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsRoulette(u8 var)
{
    if (var == MB_ROULETTE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsPokeblockFeeder(u8 var)
{
    if (var == MB_POKEBLOCK_FEEDER)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_0xBB(u8 var)
{
    if (var == MB_BB)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_0xBC(u8 var)
{
    if (var == MB_BC)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsLavaridgeB1FWarp(u8 var)
{
    if (var == MB_LAVARIDGE_GYM_B1F_WARP)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsLavaridge1FWarp(u8 var)
{
    if (var == MB_LAVARIDGE_GYM_1F_WARP)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsAquaHideoutWarp(u8 var)
{
    if (var == MB_AQUA_HIDEOUT_WARP)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSurfableFishableWater(u8 var)
{
    if (var == MB_POND_WATER || var == MB_OCEAN_WATER || var == MB_SEMI_DEEP_WATER || var == MB_DEEP_WATER || var == MB_SOOTOPOLIS_DEEP_WATER || (var >= MB_EASTWARD_CURRENT && var <= MB_SOUTHWARD_CURRENT))
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsMtPyreHole(u8 var)
{
    if (var == MB_MT_PYRE_HOLE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsCrackedFloorHole(u8 var)
{
    if (var == MB_CRACKED_FLOOR_HOLE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsCrackedFloor(u8 var)
{
    if (var == MB_CRACKED_FLOOR)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsMuddySlope(u8 var)
{
    if (var == MB_MUDDY_SLOPE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsBumpySlope(u8 var)
{
    if (var == MB_BUMPY_SLOPE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsIsolatedVerticalRail(u8 var)
{
    if (var == MB_ISOLATED_VERTICAL_RAIL)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsIsolatedHorizontalRail(u8 var)
{
    if (var == MB_ISOLATED_HORIZONTAL_RAIL)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsVerticalRail(u8 var)
{
    if (var == MB_VERTICAL_RAIL)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsHorizontalRail(u8 var)
{
    if (var == MB_HORIZONTAL_RAIL)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSeaweed(u8 var)
{
    if (var == MB_SEAWEED || var == MB_SEAWEED_NO_SURFACING)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsRunningDisallowed(u8 var)
{
    if (var == MB_NO_RUNNING || var == MB_LONG_GRASS || var == MB_HOT_SPRINGS || MetatileBehavior_IsPacifidlogLog(var) != FALSE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsCuttableGrass(u8 var)
{
    if (var == MB_TALL_GRASS || var == MB_LONG_GRASS || var == MB_ASHGRASS || var == MB_LONG_GRASS_SOUTH_EDGE)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_805791C(u8 var)
{
    if (var == MB_8E)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsPictureBookShelf(u8 var)
{
    if (var == MB_PICTURE_BOOK_SHELF)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsBookShelf(u8 var)
{
    if (var == MB_BOOKSHELF)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsPokeCenterBookShelf(u8 var)
{
    if (var == MB_POKEMON_CENTER_BOOKSHELF)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsVase(u8 var)
{
    if (var == MB_VASE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsTrashCan(u8 var)
{
    if (var == MB_TRASH_CAN)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsShopShelf(u8 var)
{
    if (var == MB_SHOP_SHELF)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsBlueprint(u8 var)
{
    if (var == MB_BLUEPRINT)
        return TRUE;
    else
        return FALSE;
}
