#include "global.h"

extern u8 gUnknown_08308E2C[];

bool8 MetatileBehavior_IsWaterfall(u8);

s8 sub_8056D9C(void)
{
    return 1;
}

bool8 sub_8056DA0(u8 var)
{
    if((gUnknown_08308E2C[var] & 1) != 0)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsJumpEast(u8 var)
{
    if(var == 0x38)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsJumpWest(u8 var)
{
    if(var == 0x39)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsJumpNorth(u8 var)
{
    if(var == 0x3A)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsJumpSouth(u8 var)
{
    if(var == 0x3B)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8056E14(u8 var)
{
    if(var == 2 || var == 3)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSandOrDeepSand(u8 var)
{
    if(var == 0x21 || var == 0x6)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsDeepSand(u8 var)
{
    if(var == 0x6)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsReflective(u8 var)
{
    if(var == 0x10 || var == 0x16 || var == 0x1A || var == 0x20 || var == 0x14 || var == 0x2B)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsIce(u8 var)
{
    if(var == 0x20)
        return TRUE;
    else
        return FALSE;
}

bool8 is_tile_x69_2_warp_door(u8 var)
{
    if(var == 0x69)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsDoor(u8 var)
{
    if(var == 0x8D || var == 0x69)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsEscalator(u8 var)
{
    if(var == 0x6A || var == 0x6B)
        return TRUE;
    else
        return FALSE;
}

bool8 unref_sub_8056EE0(u8 var)
{
    if(var == 0x4)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsLadder(u8 var)
{
    if(var == 0x61)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8056F08(u8 var)
{
    if(var == 0x60 || var == 0x6C || var == 0x6E)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8056F24(u8 var)
{
    if(var == 0x6E)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSurfableWaterOrUnderwater(u8 var)
{
    if((gUnknown_08308E2C[var] & 2) != 0)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsEastArrowWarp(u8 var)
{
    if(var == 0x62)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWestArrowWarp(u8 var)
{
    if(var == 0x63)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsNorthArrowWarp(u8 var)
{
    if(var == 0x64 || var == 0x1B)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSouthArrowWarp(u8 var)
{
    if(var == 0x65 || var == 0x6D || var == 0x1C)
        return TRUE;
    else
        return FALSE;
}

// unused
bool8 MetatileBehavior_IsArrowWarp(u8 var)
{
    u8 var2 = 0;

    if(MetatileBehavior_IsEastArrowWarp(var)
        || MetatileBehavior_IsWestArrowWarp(var)
        || MetatileBehavior_IsNorthArrowWarp(var)
        || MetatileBehavior_IsSouthArrowWarp(var))
    {
        var2 = 1;
    }
        return var2;
}

bool8 sub_8056FFC(u8 var)
{
    if((var >= 0x40 && var <= 0x48) || (var >= 0x50 && var <= 0x53)
    || var == 0xD0 || var == 0xD2 || var == 0x13 || var == 0x20 || var == 0xBB || var == 0xBC)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsIce_2(u8 var)
{
    if(var == 0x20)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsTrickHouseSlipperyFloor(u8 var)
{
    if(var == 0x48)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_0x05(u8 var)
{
    if(var == 0x5)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWalkNorth(u8 var)
{
    if(var == 0x42)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWalkSouth(u8 var)
{
    if(var == 0x43)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWalkWest(u8 var)
{
    if(var == 0x41)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWalkEast(u8 var)
{
    if(var == 0x40)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsNorthwardCurrent(u8 var)
{
    if(var == 0x52)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSouthwardCurrent(u8 var)
{
    if(var == 0x53)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWestwardCurrent(u8 var)
{
    if(var == 0x51)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsEastwardCurrent(u8 var)
{
    if(var == 0x50)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSlideNorth(u8 var)
{
    if(var == 0x46)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSlideSouth(u8 var)
{
    if(var == 0x47)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSlideWest(u8 var)
{
    if(var == 0x45)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSlideEast(u8 var)
{
    if(var == 0x44)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsCounter(u8 var)
{
    if(var == 0x80)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsPlayerFacingTVScreen(u8 tile, u8 playerDir)
{
    if(playerDir != 2) // if the player isn't facing north, forget about it.
        return FALSE;
    else if(tile == 0x86) // is the player's north tile a TV?
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsPC(u8 var)
{
    if(var == 0x83)
        return TRUE;
    else
        return FALSE;
}

bool8 is_tile_x84(u8 var)
{
    if(var == 0x84)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80571C0(u8 var)
{
    if(var == 0x91 || var == 0x93 || var == 0x95 || var == 0x97 
    || var == 0x99 || var == 0x9B || var == 0x9D)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80571EC(u8 var)
{
    if(var == 0x90 || var == 0x92 || var == 0x94 || var == 0x9A)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_805720C(u8 var)
{
    if(var == 0x96 || var == 0x9C)
        return TRUE;
    else
        return FALSE;
}

bool8 is_tile_x98(u8 var)
{
    if(var == 0x98)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057238(u8 var)
{
    if(var == 0xB0)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_805724C(u8 var)
{
    if(var == 0xB1)
        return TRUE;
    else
        return FALSE;
}

bool8 unref_sub_8057260(u8 var)
{
    if(var == 0xB2)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057274(u8 var)
{
    if(var == 0xB3)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057288(u8 var)
{
    if(var == 0xB9)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_805729C(u8 var)
{
    if(var == 0x0)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80572B0(u8 var)
{
    if(var == 0xB7)
        return TRUE;
    else
        return FALSE;
}

bool8 unref_sub_80572C4(u8 var)
{
    if(var == 0xB2)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80572D8(u8 var)
{
    if(var == 0xB5)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80572EC(u8 var)
{
    if(var == 0xC3)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057300(u8 var)
{
    if(var == 0xC2)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057314(u8 var)
{
    if(var == 0xB8)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057328(u8 var)
{
    if(var == 0xBE)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_805733C(u8 var)
{
    if(var == 0xBD)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057350(u8 var)
{
    if(var == 0xBA)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057364(u8 var)
{
    if(var == 0xBF)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057378(u8 var)
{
    if(var == 0xC4)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_805738C(u8 var)
{
    if(var == 0xC5)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_HasRipples(u8 var)
{
    if(var == 0x10 || var == 0x16 || var == 0x14)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsPuddle(u8 var)
{
    if(var == 0x16)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsTallGrass(u8 var)
{
    if(var == 0x2)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsLongGrass(u8 var)
{
    if(var == 0x3)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsBerryTreeSoil(u8 var)
{
    if(var == 0xA0)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsAsh(u8 var)
{
    if(var == 0x24)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsUnusedFootprintMetatile(u8 var)
{
    if(var == 0x25)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsBridge(u8 var)
{
    if(var >= 0x70 && var <= 0x73)
        return TRUE;
    else
        return FALSE;
}

u8 sub_8057450(u8 var)
{
    u8 result = var - 0x70;

    if(result > 3)
        result = 0;

    return result;
}

bool8 MetatileBehavior_IsLandWildEncounter(u8 var)
{
    if(MetatileBehavior_IsSurfableWaterOrUnderwater(var) == FALSE && sub_8056DA0(var) == TRUE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWaterWildEncounter(u8 var)
{
    if(MetatileBehavior_IsSurfableWaterOrUnderwater(var) == TRUE && sub_8056DA0(var) == TRUE)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80574C4(u8 var)
{
    if(var == 0xB)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80574D8(u8 var)
{
    if(var == 0xC)
        return TRUE;
    else
        return FALSE;    
}

bool8 sub_80574EC(u8 var)
{
    if(var == 0x11 || var == 0x12 || var == 0x14)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_805750C(u8 var)
{
    if(var == 0x19 || var == 0x2A)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsShallowFlowingWater(u8 var)
{
    if(var == 0x17 || var == 0x1B || var == 0x1C)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057540(u8 var)
{
    if(var == 0x26)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057554(u8 var)
{
    if(var == 0x27)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057568(u8 var)
{
    if(var == 0x15 || var == 0x11 || var == 0x12)
        return TRUE;
    else
        return FALSE;
}

bool8 unref_sub_8057584(u8 var)
{
    if(var == 0x18 || var == 0x1A)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_805759C(u8 var)
{
    if(MetatileBehavior_IsSurfableWaterOrUnderwater(var) && MetatileBehavior_IsWaterfall(var) == FALSE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsEastBlocked(u8 var)
{
    if(var == 0x30 || var == 0x34 || var == 0x36 || var == 0xC1 || var == 0xBE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWestBlocked(u8 var)
{
    if(var == 0x31 || var == 0x35 || var == 0x37 || var == 0xC1 || var == 0xBE)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsNorthBlocked(u8 var)
{
    if(var == 0x32 || var == 0x34 || var == 0x35 || var == 0xC0)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSouthBlocked(u8 var)
{
    if(var == 0x33 || var == 0x36 || var == 0x37 || var == 0xC0)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsShortGrass(u8 var)
{
    if(var == 0x7)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsHotSprings(u8 var)
{
    if(var == 0x28)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsWaterfall(u8 var)
{
    if(var == 0x13)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsFortreeBridge(u8 var)
{
    if(var == 0x78)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80576A0(u8 var)
{
    if(var == 0x74)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80576B4(u8 var)
{
    if(var == 0x75)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80576C8(u8 var)
{
    if(var == 0x76)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80576DC(u8 var)
{
    if(var == 0x77)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsPacifidlogLog(u8 var)
{
    if(var >= 0x74 && var <= 0x77)
        return TRUE;
    else
        return FALSE;
}

bool8 is_tile_x8C(u8 var)
{
    if(var == 0x8C)
        return TRUE;
    else
        return FALSE;
}

bool8 is_tile_x85(u8 var)
{
    if(var == 0x85)
        return TRUE;
    else
        return FALSE;
}

bool8 is_tile_x8B(u8 var)
{
    if(var == 0x8B)
        return TRUE;
    else
        return FALSE;
}

bool8 is_tile_x8A(u8 var)
{
    if(var == 0x8A)
        return TRUE;
    else
        return FALSE;
}

bool8 is_tile_x87(u8 var)
{
    if(var == 0x87)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_0xBB(u8 var)
{
    if(var == 0xBB)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_0xBC(u8 var)
{
    if(var == 0xBC)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057798(u8 var)
{
    if(var == 0x29)
        return TRUE;
    else
        return FALSE;
}

bool8 is_role_x68(u8 var)
{
    if(var == 0x68)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsAquaHideoutWarp(u8 var)
{
    if(var == 0x67)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSurfableFishableWater(u8 var)
{
    if(var == 0x10 || var == 0x15 || var == 0x11 || var == 0x12 || var == 0x14 || (u8)(var - 0x50) < 4)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057804(u8 var)
{
    if(var == 0xF)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057818(u8 var)
{
    if(var == 0x66)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_805782C(u8 var)
{
    if(var == 0xD2)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsMuddySlope(u8 var)
{
    if(var == 0xD0)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsBumpySlope(u8 var)
{
    if(var == 0xD1)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsIsolatedVerticalRail(u8 var)
{
    if(var == 0xD3)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsIsolatedHorizontalRail(u8 var)
{
    if(var == 0xD4)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsVerticalRail(u8 var)
{
    if(var == 0xD5)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsHorizontalRail(u8 var)
{
    if(var == 0xD6)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsSeaweed(u8 var)
{
    if(var == 0x22 || var == 0x2A)
        return TRUE;
    else
        return FALSE;
}

bool8 MetatileBehavior_IsRunningDisallowed(u8 var)
{
    if(var == 0xA || var == 0x3 || var == 0x28 || MetatileBehavior_IsPacifidlogLog(var) != FALSE)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80578F8(u8 var)
{
    if(var == 0x02 || var == 0x03 || var == 0x24 || var == 0x9)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_805791C(u8 var)
{
    if(var == 0x8E)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057930(u8 var)
{
    if(var == 0xE0)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057944(u8 var)
{
    if(var == 0xE1)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057958(u8 var)
{
    if(var == 0xE2)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_805796C(u8 var)
{
    if(var == 0xE3)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057980(u8 var)
{
    if(var == 0xE4)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_8057994(u8 var)
{
    if(var == 0xE5)
        return TRUE;
    else
        return FALSE;
}

bool8 sub_80579A8(u8 var)
{
    if(var == 0xE6)
        return TRUE;
    else
        return FALSE;
}
