#include "global.h"
#include "flag.h"

#define MAPSEC_NONE 0x58

struct Landmark
{
    u8 *name;
    u16 flag_id;
};

struct LandmarkList
{
    u8 mapSection;
    u8 field_1;
    u16 field_2;
    
    struct Landmark **landmarks;
};

extern const struct LandmarkList gLandmarkLists[];

static const struct Landmark **GetLandmarks(u8 arg_0, u8 arg_1);

u8 *GetLandmarkName(u8 arg_0, u8 arg_1, u8 count)
{
    register struct Landmark **landmark_list asm("r4") 
        = GetLandmarks(arg_0, arg_1);
    
    if (landmark_list == NULL)
    {
        return NULL;
    }
    
    while (1)
    {
        register struct Landmark *landmark asm("r1") = *landmark_list;
        
        u16 temp_flag_id = landmark->flag_id;
        
        if (temp_flag_id != 0xFFFF)
        {
            bool8 temp_flag = FlagGet(temp_flag_id);
            
            if (temp_flag == TRUE)
            {
                if (count == 0)
                {
                    break;
                }
                else
                {
                    count--;
                    goto _0811A8F6;
                }
            }
            else
            {
                goto _0811A8F6;
            }
        }
        else
        {
            if (count == 0)
            {
                break;
            }
            else
            {
                count--;
                goto _0811A8F6;
            }
        }
        
        continue;
        
        _0811A8F6:
            landmark_list++;
            
            if (*landmark_list == NULL)
            {
                return NULL;
            }
    }
    
    return (*landmark_list)->name;
    
}

static const struct Landmark **GetLandmarks(u8 arg_0, u8 arg_1)
{
    u16 i = 0;
    
    for (; gLandmarkLists[i].mapSection != MAPSEC_NONE; i++)
    {
        if (gLandmarkLists[i].mapSection > arg_0)
            return NULL;
        if (gLandmarkLists[i].mapSection == arg_0)
            break;
    }
    if (gLandmarkLists[i].mapSection == MAPSEC_NONE)
        return NULL;
    
    for (; gLandmarkLists[i].mapSection == arg_0; i++)
    {
        if (gLandmarkLists[i].field_1 == arg_1)
            return gLandmarkLists[i].landmarks;
    }
    return NULL;
}
