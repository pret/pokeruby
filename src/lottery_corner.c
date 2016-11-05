#include "global.h"
#include "pokemon.h"
#include "rng.h"
#include "string_util.h"
#include "var.h"

extern u16 gScriptResult;
extern u16 gSpecialVar_0x8004;
extern struct Pokemon gPlayerParty[6];
extern struct PokemonStorage gPokemonStorage;
extern u16 gSpecialVar_0x8005;
extern u16 gUnknown_0840CB04[];
extern u16 gSpecialVar_0x8006;
static EWRAM_DATA u16 sWinNumberDigit = 0;
static EWRAM_DATA u16 sOtIdDigit = 0;

void sub_8145D14(u32);
u32 sub_8145D3C(void);
static u8 GetMatchingDigits(u16, u16);

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
        var = var * 1103515245 + 12345;
    }
    sub_8145D14(var);    
}

void sub_8145AEC(void)
{
    u16 a = sub_8145D3C();
    gScriptResult = a;
}

//Script special function
void PickLotteryCornerTicket(void)
{
    u16 i;
    u16 j;
    u32 box;
    u32 slot;
    
    gSpecialVar_0x8004 = 0;
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
                u8 a = GetMatchingDigits(gScriptResult, otId);
                
                if(a > gSpecialVar_0x8004 && a > 1)
                {
                    gSpecialVar_0x8004 = a - 1;
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
                u8 a = GetMatchingDigits(gScriptResult, otId);
                
                if(a > gSpecialVar_0x8004 && a > 1)
                {
                    gSpecialVar_0x8004 = a - 1;
                    box = i;
                    slot = j;
                }
            }
        }
    }
    
    if(gSpecialVar_0x8004 != 0)
    {
        gSpecialVar_0x8005 = gUnknown_0840CB04[gSpecialVar_0x8004 - 1];
        
        if(box == 14)
        {
            gSpecialVar_0x8006 = 0;
            GetMonData(&gPlayerParty[slot], MON_DATA_NICKNAME, gStringVar1);
        }
        else
        {
            gSpecialVar_0x8006 = 1;
            GetBoxMonData(&gPokemonStorage.boxes[box][slot], MON_DATA_NICKNAME, gStringVar1);
        }
        StringGetEnd10(gStringVar1);
    }
}

static u8 GetMatchingDigits(u16 winNumber, u16 otId)
{
    u8 i;
    u8 matchingDigits = 0;  //Why not just use i?
    
    for(i = 0; i < 5; i++)
    {
        sWinNumberDigit = winNumber % 10;
        sOtIdDigit = otId % 10;
        
        if(sWinNumberDigit == sOtIdDigit)
        {
            winNumber = winNumber / 10;
            otId = otId / 10;
            matchingDigits++;
        }
        else
            break;
    }
    return matchingDigits;
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
