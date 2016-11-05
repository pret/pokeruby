#include "global.h"

#define NUM_HEAL_LOCATIONS 22

struct HealLocation
{
    s8 group;
    s8 map;
    u16 x;
    u16 y;
};

extern const struct HealLocation gHealLocations[];

u32 GetHealLocationIndexByMap(u16 some_group, u16 some_map)
{
    u32 i = 0;
    
    const struct HealLocation *temp = gHealLocations;
    
    for (; i<NUM_HEAL_LOCATIONS; i++)
    {
        if (temp->group != some_group)
        {
            temp++;
        }
        else if (temp->map != some_map)
        {
            temp++;
        }
        else
        {
            return i + 1;
        }
    }
    
    return 0;
}

const struct HealLocation *GetHealLocationByMap(u16 some_group, 
    u16 some_map)
{
    u32 index = GetHealLocationIndexByMap(some_group, some_map);
    
    if (index == 0)
    {
        return NULL;
    }
    else
    {
        return &(gHealLocations[index - 1].group);
    }
}

const struct HealLocation *GetHealLocation(u32 index)
{
    if (index == 0)
    {
        return NULL;
    }
    else if (index > NUM_HEAL_LOCATIONS)
    {
        return NULL;
    }
    else
    {
        return &(gHealLocations[index - 1].group);
    }
}
