#include "gba/gba.h"
#include "global.h"
#include "pokemon.h"

extern u16 SpeciesToNationalPokedexNum(u16);
extern u16 sub_8090D54(u16, u8);

struct UnknownStruct {
    u16 unk0;
    u8 unk2;
    u8 unk3;
    u16 unk4;
    u16 unk6;
};

extern struct UnknownStruct gUnknown_083D180C[];

u32 GetBigMonSizeParams(struct Pokemon *pkmn)
{
    // UB: Too few arguments for function 'GetMonData'
    u16 personality = GetMonData(pkmn, MON_DATA_PERSONALITY);
    u16 hpIV = GetMonData(pkmn, MON_DATA_HP_IV) & 0xF;
    u16 attackIV = GetMonData(pkmn, MON_DATA_ATK_IV) & 0xF;
    u16 defenseIV = GetMonData(pkmn, MON_DATA_DEF_IV) & 0xF;
    u16 speedIV = GetMonData(pkmn, MON_DATA_SPD_IV) & 0xF;
    u16 spAtkIV = GetMonData(pkmn, MON_DATA_SPATK_IV) & 0xF;
    u16 spDefIV = GetMonData(pkmn, MON_DATA_SPDEF_IV) & 0xF;
    
    u32 val1 = ((attackIV ^ defenseIV) * hpIV) ^ (personality & 0xFF);
    u32 val2 = ((spAtkIV ^ spDefIV) * speedIV) ^ (personality >> 8);
    
    return (val1 << 8) + val2;
}

u8 TranslateBigMonSizeTableIndex(u16 a)
{
    u8 i;
    
    for(i = 1; i < 15; i++)
    {
        if(a < gUnknown_083D180C[i].unk4)
            return i - 1;
    }
    return i;
}
