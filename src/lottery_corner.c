#include "gba/gba.h"
#include "pokemon.h"
#include "rng.h"

extern bool8 VarSet(u16 id, u16 value);

extern u16 gScriptResult;
extern u16 gUnknown_0202E8CC;
extern struct Pokemon gPlayerParty[6];

void sub_8145D14(u32);
u16 sub_8145D3C(void);
u32 sub_8145C8C(u16, u16);

void sub_8145A78(void)
{
    u16 rand = Random();

    sub_8145D14((Random() << 16) | rand);
    VarSet(0x4045, 0);
}

void sub_8145AA4(u16 a)
{
    u32 var = Random();
    
    while(--a != 0xFFFF)
    {
        var = 0x41c64e6d * var + 0x3039;
    }
    sub_8145D14(var);    
}

void sub_8145AEC(void)
{
    gScriptResult = sub_8145D3C();
}

/*
void sub_8145B00(void)
{
    u16 i;
    
    gUnknown_0202E8CC = 0;
    
    for(i = 0; i < 6; i++)
    {
        struct Pokemon *pkmn = &gPlayerParty[i];
        
        if(!GetMonData(pkmn, MON_DATA_SPECIES, NULL))
            break;
        if(!GetMonData(pkmn, MON_DATA_IS_EGG, NULL))
        {
            //sub_8145C8C(gScriptResult, GetMonData(pkmn, MON_DATA_OT_ID, NULL))
            
        }
    }
}
*/