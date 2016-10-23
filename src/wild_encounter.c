#include "gba/gba.h"
#include "fieldmap.h"
#include "global.h"
#include "rng.h"

extern bool8 sub_805759C(u8);
extern void GetXYCoordsOneStepInFrontOfPlayer(void *, void *);

extern u8 gWildEncountersDisabled;
extern u16 gUnknown_0839DC00[];
extern u32 gUnknown_0202FF80;   //Feebas rng value

u16 FeebasRandom(void);
void FeebasSeedRng(u16 a);

void DisableWildEncounters(u8 a)
{
    gWildEncountersDisabled = a;
}

u16 sub_8084984(s16 a, s16 b, u8 c)
{
    u16 *arr = gUnknown_0839DC00;
    u16 *ptr = &arr[c * 3];
    u16 r9 = gUnknown_0839DC00[c * 3 + 1];
    u16 r6 = gUnknown_0839DC00[c * 3 + 2];
    u16 r5 = *ptr;
   
    while(r5 <= r9)
    {
        u16 i;
       
        for(i = 0; i < gMapHeader.mapData->width; i++)
        {
            if(sub_805759C(MapGridGetMetatileBehaviorAt(i + 7, r5 + 7)) == TRUE)
            {
                r6++;
                if(a == i && b == r5)
                    return r6;
            }
            //_08084A14
        }
        r5++;
    }
 
    return r6 + 1;
}

bool32 CheckFeebas(void)
{
    u16 feebasSpots[6];
    s16 x;
    s16 y;
    u8 r7 = 0;
    u8 i;
    u16 foo;
   
    if(gSaveBlock1.location.mapGroup == 0 && gSaveBlock1.location.mapNum == 0x22)
    {
        GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
        x -= 7;
        y -= 7;
        
        // *sigh* whatever gets the code to match!
        {
        register u16 *arr asm("r0");
        if(y >= (arr = gUnknown_0839DC00)[3 * 1 + 0] && y <= arr[3 * 1 + 1])
            r7 = 1;
        if(y >= arr[3 * 2 + 0] && y <= arr[3 * 2 + 1])
            r7 = 2;
        }
        //_08084A8E
 
        if(Random() % 100 > 0x31)
            return 0;
        //_08084AC8
        FeebasSeedRng(gSaveBlock1.feebasLocationSeed);
        for(i = 0; i != 6;)
        {
            feebasSpots[i] = FeebasRandom() % 0x1BF;
            if(feebasSpots[i] == 0)
                feebasSpots[i] = 0x1BF;
            if((u16)(feebasSpots[i] - 1) > 2)
                i++;
        }
        foo = sub_8084984(x, y, r7);
        for(i = 0; i < 6; i++)
        {
            if(foo == feebasSpots[i])
                return TRUE;
        }        
    }
    //_08084B38
    return FALSE;
}

u16 FeebasRandom(void)
{
    gUnknown_0202FF80 = 0x3039 + 0x41c64e6d * gUnknown_0202FF80;
    return gUnknown_0202FF80 >> 16;
}

void FeebasSeedRng(u16 seed)
{
    gUnknown_0202FF80 = seed;
}

u16 PickWildMon_Grass(void)
{
    u8 val = Random() % 100;
    
    if(val < 20)
        return 0;
    if(val >= 20 && val < 40)
        return 1;
    if(val >= 40 && val < 50)
        return 2;
    if(val >= 50 && val < 60)
        return 3;
    if(val >= 60 && val < 70)
        return 4;
    if(val >= 70 && val < 80)
        return 5;
    if(val >= 80 && val < 85)
        return 6;
    if(val >= 85 && val < 90)
        return 7;
    if(val >= 90 && val < 94)
        return 8;
    if(val >= 94 && val < 98)
        return 9;
    if(val == 98)
        return 10;
    else
        return 11;
}

u16 PickWildMon_Water(void)
{
    u8 val = Random() % 100;
    
    if(val < 60)
        return 0;
    if(val >= 60 && val < 90)
        return 1;
    if(val >= 90 && val < 95)
        return 2;
    if(val >= 95 && val < 99)
        return 3;
    else
        return 4;
}


u16 PickWildMon_Fishing(u8 rod)
{
    u32 r5 = 0;
    u8 val = Random() % 100;
    
    switch(rod)
    {
        case 0:
            r5 = 1;
            if(val < 70)
                r5 = 0;
            return r5;
        case 1:
            if(val < 60)
                r5 = 2;
            if(val >= 60 && val < 80)
                r5 = 3;
            if(val >= 80 && val < 100)
                r5 = 4;
            return r5;
        case 2:
            break;
        default:
            return r5;
    }
    
    if(val < 40)
        r5 = 5;
    if(val >= 40 && val < 80)
        r5 = 6;
    if(val >= 80 && val < 95)
        r5 = 7;
    if(val >= 95 && val < 99)
        r5 = 8;
    if(val == 99)
        r5 = 9;
        
    
    return r5;
}
