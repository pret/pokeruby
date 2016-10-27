#include "gba/gba.h"
#include "global.h"
#include "pokemon.h"
#include "rng.h"
#include "string_util.h"

extern bool8 VarSet(u16 id, u16 value);
extern u16 VarGet(u16 id);

extern u16 gScriptResult;
extern u16 gUnknown_0202E8CC;
extern struct Pokemon gPlayerParty[6];
extern struct PokemonStorage gPokemonStorage;
extern u16 gUnknown_0202E8CE;
extern u16 gUnknown_0840CB04[];
extern u16 gUnknown_0202E8D0;
extern u16 gUnknown_02039328;
extern u16 gUnknown_0203932A;

void sub_8145D14(u32);
u32 sub_8145D3C(void);
static u8 sub_8145C8C(u16, u16);

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
    u16 a = sub_8145D3C();
    gScriptResult = a;
}

void sub_8145B00(void)
{
    u16 i;
    u16 j;
    u32 box;
    u32 slot;
    
    gUnknown_0202E8CC = 0;
    slot = 0;
    box = 0;
    for(i = 0; i < 6; i++)
    {
        struct Pokemon *pkmn = &gPlayerParty[i];
        
        // UB: Too few arguments for function GetMonData
        if(GetMonData(pkmn, MON_DATA_SPECIES) != 0)
        {
            if(!GetMonData(pkmn, MON_DATA_IS_EGG))
            {
                u32 otId = GetMonData(pkmn, MON_DATA_OT_ID);
                u8 a = sub_8145C8C(gScriptResult, otId);
                
                if(a > gUnknown_0202E8CC && a > 1)
                {
                    gUnknown_0202E8CC = a - 1;
                    box = 14;
                    slot = i;
                }
            }
        }
        else
            break;
    }
    
    for(i = 0; i < 14; i++)
    {
        for(j = 0; j < 0x1E; j++)
        {
            struct BoxPokemon *pkmn = &gPokemonStorage.boxes[i][j];
            
            // UB: Too few arguments for function GetMonData
            if(GetBoxMonData(pkmn, MON_DATA_SPECIES) != 0 &&
            !GetBoxMonData(pkmn, MON_DATA_IS_EGG))
            {
                u32 otId = GetBoxMonData(pkmn, MON_DATA_OT_ID);
                u8 a = sub_8145C8C(gScriptResult, otId);
                
                if(a > gUnknown_0202E8CC && a > 1)
                {
                    gUnknown_0202E8CC = a - 1;
                    box = i;
                    slot = j;
                }
            }
        }
    }
    
    if(gUnknown_0202E8CC != 0)
    {
        gUnknown_0202E8CE = gUnknown_0840CB04[gUnknown_0202E8CC - 1];
        
        if(box == 14)
        {
            gUnknown_0202E8D0 = 0;
            GetMonData(&gPlayerParty[slot], MON_DATA_NICKNAME, gStringVar1);
        }
        else
        {
            gUnknown_0202E8D0 = 1;
            GetBoxMonData(&gPokemonStorage.boxes[box][slot], MON_DATA_NICKNAME, gStringVar1);
        }
        StringGetEnd10(gStringVar1);
    }
}

static u8 sub_8145C8C(u16 a, u16 b)
{
    u8 i;
    u8 j = 0;  //Why not just use i?
    
    for(i = 0; i < 5; i++)
    {
        gUnknown_02039328 = a % 10;
        gUnknown_0203932A = b % 10;
        
        if(gUnknown_02039328 == gUnknown_0203932A)
        {
            a = a / 10;
            b = b / 10;
            j++;
        }
        else
            break;
    }
    return j;
}

void sub_8145D14(u32 a)
{
    u16 b = a >> 16;
    u16 c = a;
    
    VarSet(0x404B, c);
    VarSet(0x404C, b);
}

u32 sub_8145D3C(void)
{
    u16 var1 = VarGet(0x404B);
    u16 var2 = VarGet(0x404C);
    
    return (var2 << 16) | var1;
}

void unref_sub_8145D64(u16 a)
{
    sub_8145D14(a);
}