#include "gba/gba.h"
#include "global.h"
#include "pokemon.h"
#include "species.h"

extern u16 SpeciesToNationalPokedexNum(u16);
extern u16 sub_8090D54(u16, u8);
extern bool8 VarSet(u16, u16);
extern u16 *GetVarPointer(u16);
extern u8 FlagSet(u16);

struct UnknownStruct {
    u16 unk0;
    u8 unk2;
    u8 unk3;
    u16 unk4;
    u16 unk6;
};

extern struct UnknownStruct gUnknown_083D180C[];
extern u8 gUnknown_083D188C[];
extern u8 gOtherText_Marco[];
extern u16 gScriptResult;
extern u8 gSpeciesNames[][11];
extern u8 gUnknown_083D188E[];

#define VAR_SHROOMISH_SIZE_RECORD 0x4047
#define VAR_BARBOACH_SIZE_RECORD 0x404F

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

u32 GetBigMonSize(u16 a, u16 b)
{
    u64 r0r1;
    u64 r2r3;
    u64 r4r5;
    u64 s0s4;
    u32 r7;
    u32 var;
    struct UnknownStruct *s;
    
    r7 = sub_8090D54(SpeciesToNationalPokedexNum(a), 0);
    var = TranslateBigMonSizeTableIndex(b);
    s0s4 = gUnknown_083D180C[var].unk0;
    r2r3 = gUnknown_083D180C[var].unk2;
    r4r5 = gUnknown_083D180C[var].unk4;
    s0s4 += (b - r4r5) / r2r3;
    
    return r7 * s0s4 / 10;
}

void FormatBigMonSize(u8 *a, u32 b)
{
    u8 period[2];
    
    memcpy(period, gUnknown_083D188C, 2);
    b = (double)(b * 10) / 25.4;
    a = ConvertIntToDecimalStringN(a, b / 10, 0, 8);
    a = StringAppend(a, period);
    ConvertIntToDecimalStringN(a, b % 10, 0, 1);
}

u8 CompareMonSize(u16 a, u16 *b)
{
    
    if(gScriptResult == 0xFF)
        return 0;
    else
    {
        struct Pokemon *pkmn = &gPlayerParty[gScriptResult];
        // UB: Too few arguments for function 'GetMonData'
        if(GetMonData(pkmn, MON_DATA_IS_EGG) == TRUE || GetMonData(pkmn, MON_DATA_SPECIES) != a)
            return 1;
        else
        {
            u32 oldSize;
            u32 newSize;
            u16 sizeParams;
            u16 *ptr = &sizeParams; //Why the pointer?
            
            *ptr = GetBigMonSizeParams(pkmn);
            newSize = GetBigMonSize(a, sizeParams);
            oldSize = GetBigMonSize(a, *b);
            FormatBigMonSize(gStringVar2, newSize);
            if(newSize <= oldSize)
                return 2;
            else
            {
                *b = sizeParams;
                return 3;
            }
        }
    }
}

void GetBigMonInfo(u16 species, u16 *b)
{
    u32 size = GetBigMonSize(species, *b);
    
    FormatBigMonSize(gStringVar3, size);
    StringCopy(gStringVar1, gSpeciesNames[species]);
    if(*b == 0x8100)
        StringCopy(gStringVar2, gOtherText_Marco);
    else
        StringCopy(gStringVar2, gSaveBlock2.playerName);
}

void InitShroomishSizeRecord(void)
{
    VarSet(VAR_SHROOMISH_SIZE_RECORD, 0x8100);
}

void GetBigShroomishInfo(void)
{
    u16 *sizeRecord = GetVarPointer(VAR_SHROOMISH_SIZE_RECORD);
    
    GetBigMonInfo(SPECIES_SHROOMISH, sizeRecord);
}

void CompareShroomishSize(void)
{
    u16 *sizeRecord = GetVarPointer(VAR_SHROOMISH_SIZE_RECORD);
    
    gScriptResult = CompareMonSize(SPECIES_SHROOMISH, sizeRecord);
}

void InitBarboachSizeRecord(void)
{
    VarSet(VAR_BARBOACH_SIZE_RECORD, 0x8100);
}

void GetBigBarboachInfo(void)
{
    u16 *sizeRecord = GetVarPointer(VAR_BARBOACH_SIZE_RECORD);
    
    GetBigMonInfo(SPECIES_BARBOACH, sizeRecord);
}

void CompareBarboachSize(void)
{
    u16 *sizeRecord = GetVarPointer(VAR_BARBOACH_SIZE_RECORD);
    
    gScriptResult = CompareMonSize(SPECIES_BARBOACH, sizeRecord);
}

/*
void GiveSpecialRibbonToParty(u8 a, u8 b)
{
    s32 i;
    u8 arr[7];
    bool32 r7 = FALSE;
    u8 data = 1;
    
    memcpy(arr, gUnknown_083D188E, 7);
    if(a <= 10 && b <= 64)
    {
        for(i = 0; i < 6; i++)
        {
            struct Pokemon *pkmn = &gPlayerParty[i];
            
            if(GetMonData(pkmn, MON_DATA_SPECIES) != 0 && GetMonData(pkmn, MON_DATA_SANITY_BIT3) == 0)
            {
                SetMonData(pkmn, arr[a], &data);
                r7 = TRUE;
            }
        }
        
        if(r7)
            FlagSet(0x83B);
    }
}
*/