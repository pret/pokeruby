#include "global.h"

struct Landmark
{
    u8 *name;
    u16 flag_id;
};

struct LandmarkList
{
    u8 field_0;
    u8 field_1;
    u16 field_2;
    
    struct Landmark **landmark_list;
};

extern const struct LandmarkList gLandmarkLists[];

const struct Landmark **GetLandmarkList(u8 arg_0, u8 arg_1);

u8 *GetLandmarkName(u8 arg_0, u8 arg_1, u8 count)
{
    register struct Landmark **landmark_list asm("r4") 
        = GetLandmarkList(arg_0, arg_1);
    
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


const struct Landmark **GetLandmarkList(u8 arg_0, u8 arg_1)
{
    u16 i;
    
    i = 0;
    
    if (gLandmarkLists[0].field_0 == 0x58)
    {
        return NULL;
    }
    
    
    for (; gLandmarkLists[i].field_0 != 0x58; i++)
    {
        if (gLandmarkLists[i].field_0 > arg_0)
        {
            return NULL;
        }
        if (gLandmarkLists[i].field_0 == arg_0)
        {
            break;
        }
    }
    
    if (gLandmarkLists[i].field_0 == 0x58)
    {
        return NULL;
    }
    
    for (; gLandmarkLists[i].field_0 == arg_0; i++)
    {
        if (gLandmarkLists[i].field_1 == arg_1)
        {
            return gLandmarkLists[i].landmark_list;
        }
    }
    
    return 0;
}

