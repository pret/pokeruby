#include "global.h"
#include "metatile_behavior.h"
#include "constants/metatile_behaviors.h"

#define TILE_ATTRIBUTES(three, two, one) (((one) ? 1 : 0) | ((two) ? 2 : 0) | ((three) ? 4 : 0))

static const u8 sTileBitAttributes[] =
{
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_NORMAL
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_01
    TILE_ATTRIBUTES(TRUE, FALSE, TRUE),   // MB_TALL_GRASS
    TILE_ATTRIBUTES(TRUE, FALSE, TRUE),   // MB_LONG_GRASS
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_04
    TILE_ATTRIBUTES(FALSE, FALSE, TRUE),  // MB_05
    TILE_ATTRIBUTES(TRUE, FALSE, TRUE),   // MB_DEEP_SAND
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_SHORT_GRASS
    TILE_ATTRIBUTES(TRUE, FALSE, TRUE),   // MB_CAVE
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_LONG_GRASS_SOUTH_EDGE
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_NO_RUNNING
    TILE_ATTRIBUTES(TRUE, FALSE, TRUE),   // MB_0B
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_MOUNTAIN_TOP
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_BATTLE_PYRAMID_WARP
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_MOSSDEEP_GYM_WARP
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_MT_PYRE_HOLE
    TILE_ATTRIBUTES(TRUE, TRUE, TRUE),    // MB_POND_WATER
    TILE_ATTRIBUTES(TRUE, TRUE, TRUE),    // MB_SEMI_DEEP_WATER
    TILE_ATTRIBUTES(TRUE, TRUE, TRUE),    // MB_DEEP_WATER
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),   // MB_WATERFALL
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),   // MB_SOOTOPOLIS_DEEP_WATER
    TILE_ATTRIBUTES(TRUE, TRUE, TRUE),    // MB_OCEAN_WATER
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_PUDDLE
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_SHALLOW_WATER
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_18
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),   // MB_NO_SURFACING
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_1A
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_STAIRS_OUTSIDE_ABANDONED_SHIP
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_SHOAL_CAVE_ENTRANCE
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_1D
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_1E
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_1F
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_ICE
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_SAND
    TILE_ATTRIBUTES(TRUE, TRUE, TRUE),    // MB_SEAWEED
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_23
    TILE_ATTRIBUTES(TRUE, FALSE, TRUE),   // MB_ASHGRASS
    TILE_ATTRIBUTES(TRUE, FALSE, TRUE),   // MB_25
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_THIN_ICE
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_CRACKED_ICE
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_HOT_SPRINGS
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_LAVARIDGE_GYM_B1F_WARP
    TILE_ATTRIBUTES(TRUE, TRUE, TRUE),    // MB_SEAWEED_NO_SURFACING
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_REFLECTION_UNDER_BRIDGE
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_2C
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_2D
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_2E
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_2F
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_IMPASSABLE_EAST
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_IMPASSABLE_WEST
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_IMPASSABLE_NORTH
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_IMPASSABLE_SOUTH
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_IMPASSABLE_NORTHEAST
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_IMPASSABLE_NORTHWEST
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_IMPASSABLE_SOUTHEAST
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_IMPASSABLE_SOUTHWEST
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_JUMP_EAST
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_JUMP_WEST
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_JUMP_NORTH
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_JUMP_SOUTH
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_3C
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_3D
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_JUMP_SOUTHEAST
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_JUMP_SOUTHWEST
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_WALK_EAST
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_WALK_WEST
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_WALK_NORTH
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_WALK_SOUTH
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_SLIDE_EAST
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_SLIDE_WEST
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_SLIDE_NORTH
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_SLIDE_SOUTH
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_TRICK_HOUSE_PUZZLE_8_FLOOR
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_49
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_4A
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_4B
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_4C
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_4D
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_4E
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_4F
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),   // MB_EASTWARD_CURRENT
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),   // MB_WESTWARD_CURRENT
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),   // MB_NORTHWARD_CURRENT
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),   // MB_SOUTHWARD_CURRENT
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_54
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_55
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_56
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_57
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_58
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_59
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_5A
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_5B
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_5C
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_5D
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_5E
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_5F
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_NON_ANIMATED_DOOR
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_LADDER
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_EAST_ARROW_WARP
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_WEST_ARROW_WARP
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_NORTH_ARROW_WARP
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_SOUTH_ARROW_WARP
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_CRACKED_FLOOR_HOLE
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_AQUA_HIDEOUT_WARP
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_LAVARIDGE_GYM_1F_WARP
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_ANIMATED_DOOR
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_UP_ESCALATOR
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_DOWN_ESCALATOR
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),   // MB_WATER_DOOR
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),   // MB_WATER_SOUTH_ARROW_WARP
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_DEEP_SOUTH_WARP
    TILE_ATTRIBUTES(TRUE, TRUE, FALSE),   // MB_6F
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_WARP_OR_BRIDGE
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_71
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_ROUTE120_NORTH_BRIDGE_1
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_ROUTE120_NORTH_BRIDGE_2
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_PACIFIDLOG_VERTICAL_LOG_1
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_PACIFIDLOG_VERTICAL_LOG_2
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_PACIFIDLOG_HORIZONTAL_LOG_1
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_PACIFIDLOG_HORIZONTAL_LOG_2
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_FORTREE_BRIDGE
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_79
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_ROUTE120_SOUTH_BRIDGE_1
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_ROUTE120_SOUTH_BRIDGE_2
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_ROUTE120_NORTH_BRIDGE_3
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_ROUTE120_NORTH_BRIDGE_4
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_7E
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_ROUTE110_BRIDGE
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_COUNTER
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_81
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_82
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_PC
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_84
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_REGION_MAP
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_TELEVISION
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_POKEBLOCK_FEEDER
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_88
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_SLOT_MACHINE
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_ROULETTE
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_CLOSED_SOOTOPOLIS_GYM_DOOR
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_TRICK_HOUSE_PUZZLE_DOOR
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_8D
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_8E
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_QUESTIONNAIRE
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_SECRET_BASE_SPOT_RED_CAVE
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_91
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_SECRET_BASE_SPOT_BROWN_CAVE
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_93
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_SECRET_BASE_SPOT_YELLOW_CAVE
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_95
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_SECRET_BASE_SPOT_TREE_1
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_97
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_SECRET_BASE_SPOT_SHRUB
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_99
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_SECRET_BASE_SPOT_BLUE_CAVE
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_9B
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_SECRET_BASE_SPOT_TREE_2
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_9D
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_9E
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_9F
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_BERRY_TREE_SOIL
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_A1
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_A2
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_A3
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_A4
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_A5
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_A6
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_A7
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_A8
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_A9
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_AA
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_AB
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_AC
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_AD
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_AE
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_AF
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_SECRET_BASE_PC
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_B1
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_B2
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_B3
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_B4
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_B5
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_B6
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_B7
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_B8
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_B9
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_BA
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_BB
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_BC
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_BD
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_BE
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_BF
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_BED
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_C1
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_C2
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_C3
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_C4
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_C5
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_C6
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_C7
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_C8
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_C9
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_CA
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_CB
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_CC
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_CD
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_CE
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_CF
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_MUDDY_SLOPE
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_BUMPY_SLOPE
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_CRACKED_FLOOR
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_ISOLATED_VERTICAL_RAIL
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_ISOLATED_HORIZONTAL_RAIL
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_VERTICAL_RAIL
    TILE_ATTRIBUTES(TRUE, FALSE, FALSE),  // MB_HORIZONTAL_RAIL
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_D7
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_D8
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_D9
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_DA
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_DB
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_DC
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_DD
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_DE
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_DF
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_PICTURE_BOOK_SHELF
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_BOOKSHELF
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_POKEMON_CENTER_BOOKSHELF
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_VASE
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_TRASH_CAN
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_SHOP_SHELF
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_BLUEPRINT
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_E7
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_E8
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_E9
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_EA
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_EB
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_EC
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_EE
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE), // MB_EF
    TILE_ATTRIBUTES(FALSE, FALSE, FALSE)  // MB_F0
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
