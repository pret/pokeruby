#include "global.h"
#include "heal_location.h"
#include "map_constants.h"

#define NUM_HEAL_LOCATIONS 22

static const struct HealLocation sHealLocations[] = {
    {MAP_GROUP_LITTLEROOT_TOWN_BRENDANS_HOUSE_2F, MAP_ID_LITTLEROOT_TOWN_BRENDANS_HOUSE_2F, 4, 2},
    {MAP_GROUP_LITTLEROOT_TOWN_MAYS_HOUSE_2F, MAP_ID_LITTLEROOT_TOWN_MAYS_HOUSE_2F, 4, 2},
    {MAP_GROUP_PETALBURG_CITY, MAP_ID_PETALBURG_CITY, 20, 17},
    {MAP_GROUP_SLATEPORT_CITY, MAP_ID_SLATEPORT_CITY, 19, 20},
    {MAP_GROUP_MAUVILLE_CITY, MAP_ID_MAUVILLE_CITY, 22, 6},
    {MAP_GROUP_RUSTBORO_CITY, MAP_ID_RUSTBORO_CITY, 16, 39},
    {MAP_GROUP_FORTREE_CITY, MAP_ID_FORTREE_CITY, 5, 7},
    {MAP_GROUP_LILYCOVE_CITY, MAP_ID_LILYCOVE_CITY, 24, 15},
    {MAP_GROUP_MOSSDEEP_CITY, MAP_ID_MOSSDEEP_CITY, 28, 17},
    {MAP_GROUP_SOOTOPOLIS_CITY, MAP_ID_SOOTOPOLIS_CITY, 43, 32},
    {MAP_GROUP_EVER_GRANDE_CITY, MAP_ID_EVER_GRANDE_CITY, 27, 49},
    {MAP_GROUP_LITTLEROOT_TOWN, MAP_ID_LITTLEROOT_TOWN, 5, 9},
    {MAP_GROUP_LITTLEROOT_TOWN, MAP_ID_LITTLEROOT_TOWN, 14, 9},
    {MAP_GROUP_OLDALE_TOWN, MAP_ID_OLDALE_TOWN, 6, 17},
    {MAP_GROUP_DEWFORD_TOWN, MAP_ID_DEWFORD_TOWN, 2, 11},
    {MAP_GROUP_LAVARIDGE_TOWN, MAP_ID_LAVARIDGE_TOWN, 9, 7},
    {MAP_GROUP_FALLARBOR_TOWN, MAP_ID_FALLARBOR_TOWN, 14, 8},
    {MAP_GROUP_VERDANTURF_TOWN, MAP_ID_VERDANTURF_TOWN, 16, 4},
    {MAP_GROUP_PACIFIDLOG_TOWN, MAP_ID_PACIFIDLOG_TOWN, 8, 16},
    {MAP_GROUP_EVER_GRANDE_CITY, MAP_ID_EVER_GRANDE_CITY, 18, 6},
    {MAP_GROUP_BATTLE_TOWER_OUTSIDE, MAP_ID_BATTLE_TOWER_OUTSIDE, 14, 9},
    {MAP_GROUP_SOUTHERN_ISLAND_EXTERIOR, MAP_ID_SOUTHERN_ISLAND_EXTERIOR, 15, 20},
};

u32 GetHealLocationIndexByMap(u16 mapGroup, u16 mapNum)
{
    u32 i;

    for (i = 0; i < NUM_HEAL_LOCATIONS; i++)
    {
        if (sHealLocations[i].group == mapGroup && sHealLocations[i].map == mapNum)
            return i + 1;
    }
    return 0;
}

const struct HealLocation *GetHealLocationByMap(u16 mapGroup, u16 mapNum)
{
    u32 index = GetHealLocationIndexByMap(mapGroup, mapNum);

    if (index == 0)
        return NULL;
    else
        return &sHealLocations[index - 1];
}

const struct HealLocation *GetHealLocation(u32 index)
{
    if (index == 0)
        return NULL;
    else if (index > NUM_HEAL_LOCATIONS)
        return NULL;
    else
        return &sHealLocations[index - 1];
}
