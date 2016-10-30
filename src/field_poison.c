#include "global.h"
#include "pokemon.h"

bool32 CheckMonIsValid(struct Pokemon *pkmn)
{
    // UB: Too few arguments for function 'GetMonData'
    u16 species2 = GetMonData(pkmn, MON_DATA_SPECIES2);
    
    if(species2 == 0 || species2 == 0x19C)
        return FALSE;
    else
        return TRUE;
}

bool8 CheckMonFainted(struct Pokemon *pkmn)
{
    int i;
    
    for(i = 0; i < 6; i++, pkmn++)
    {
        // UB: Too few arguments for function 'GetMonData'
        if(CheckMonIsValid(pkmn) && GetMonData(pkmn, MON_DATA_HP) != 0)
            return FALSE;
    }
    return TRUE;
}