#include "global.h"

extern s8 gHealLocations[];


u32 GetHealLocationIndexByMap(u16 arg_0, u16 arg_1)
{
    u32 i = 0;
    
    s8 *temp = &(gHealLocations[0]);
    
    for ( ; i<=0x15; i++)
    {
        if (temp[0] != arg_0)
        {
            temp += 8;
        }
        else if (temp[1] != arg_1)
        {
            temp += 8;
        }
        else
        {
            return i + 1;
        }
    }
    
    return 0;
}

u32 GetHealLocationByMap(u16 arg_0, u16 arg_1)
{
    int temp = GetHealLocationIndexByMap(arg_0, arg_1);
    
    if (!temp)
    {
        return 0;
    }
    else
    {
        return (u32)(gHealLocations - 8 + (temp << 3));
    }
}

u32 GetHealLocation(u32 arg_0)
{
    if (arg_0 == 0)
    {
        return 0;
    }
    else if (arg_0 > 0x16)
    {
        return 0;
    }
    else
    {
        return (u32)(gHealLocations - 8 + (arg_0 << 3));
    }
}
