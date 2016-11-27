#include "pokemon_size_record.h"
#include "global.h"
#include "string_util.h"
#include "species.h"
#include "flag.h"
#include "var.h"

extern u16 SpeciesToNationalPokedexNum(u16);
extern u16 sub_8090D54(u16, u8);

struct UnknownStruct
{
    u16 unk0;
    u8 unk2;
    u16 unk4;
};

extern struct UnknownStruct gUnknown_083D180C[];
extern u8 gOtherText_DecimalPoint[];
extern u8 gOtherText_Marco[];
extern u16 gScriptResult;
extern u8 gSpeciesNames[][11];
extern u8 gUnknown_083D188E[];

#define VAR_SHROOMISH_SIZE_RECORD 0x4047
#define VAR_BARBOACH_SIZE_RECORD 0x404F
#define CM_PER_INCH 2.54

static u32 GetMonSizeHash(struct Pokemon *pkmn)
{
    // UB: Too few arguments for function 'GetMonData'
    u16 personality = GetMonData(pkmn, MON_DATA_PERSONALITY);
    u16 hpIV = GetMonData(pkmn, MON_DATA_HP_IV) & 0xF;
    u16 attackIV = GetMonData(pkmn, MON_DATA_ATK_IV) & 0xF;
    u16 defenseIV = GetMonData(pkmn, MON_DATA_DEF_IV) & 0xF;
    u16 speedIV = GetMonData(pkmn, MON_DATA_SPD_IV) & 0xF;
    u16 spAtkIV = GetMonData(pkmn, MON_DATA_SPATK_IV) & 0xF;
    u16 spDefIV = GetMonData(pkmn, MON_DATA_SPDEF_IV) & 0xF;
    u32 hibyte = ((attackIV ^ defenseIV) * hpIV) ^ (personality & 0xFF);
    u32 lobyte = ((spAtkIV ^ spDefIV) * speedIV) ^ (personality >> 8);
    
    return (hibyte << 8) + lobyte;
}

static u8 TranslateBigMonSizeTableIndex(u16 a)
{
    u8 i;
    
    for(i = 1; i < 15; i++)
    {
        if(a < gUnknown_083D180C[i].unk4)
            return i - 1;
    }
    return i;
}

static u32 GetMonSize(u16 species, u16 b)
{
    u64 unk2;
    u64 unk4;
    u64 unk0;
    u32 r7;
    u32 var;
    struct UnknownStruct *s;
    
    r7 = sub_8090D54(SpeciesToNationalPokedexNum(species), 0);
    var = TranslateBigMonSizeTableIndex(b);
    unk0 = gUnknown_083D180C[var].unk0;
    unk2 = gUnknown_083D180C[var].unk2;
    unk4 = gUnknown_083D180C[var].unk4;
    unk0 += (b - unk4) / unk2;
    return r7 * unk0 / 10;
}

static void FormatMonSizeRecord(u8 *string, u32 size)
{
    u8 decimalPoint[2];
    
    memcpy(decimalPoint, gOtherText_DecimalPoint, 2);
    //Convert size from centimeters to inches
    size = (double)(size * 10) / (CM_PER_INCH * 10);
    string = ConvertIntToDecimalStringN(string, size / 10, 0, 8);
    string = StringAppend(string, decimalPoint);
    ConvertIntToDecimalStringN(string, size % 10, 0, 1);
}

static u8 CompareMonSize(u16 species, u16 *sizeRecord)
{    
    if(gScriptResult == 0xFF)
        return 0;
    else
    {
        struct Pokemon *pkmn = &gPlayerParty[gScriptResult];
        
        // UB: Too few arguments for function 'GetMonData'
        if(GetMonData(pkmn, MON_DATA_IS_EGG) == TRUE || GetMonData(pkmn, MON_DATA_SPECIES) != species)
            return 1;
        else
        {
            u32 oldSize;
            u32 newSize;
            u16 sizeParams;
            u16 *ptr = &sizeParams; //Why the pointer?
            
            *ptr = GetMonSizeHash(pkmn);
            newSize = GetMonSize(species, sizeParams);
            oldSize = GetMonSize(species, *sizeRecord);
            FormatMonSizeRecord(gStringVar2, newSize);
            if(newSize <= oldSize)
                return 2;
            else
            {
                *sizeRecord = sizeParams;
                return 3;
            }
        }
    }
}

//Stores species name in gStringVar1, trainer's name in gStringVar2, and size in gStringVar3
static void GetMonSizeRecordInfo(u16 species, u16 *sizeRecord)
{
    u32 size = GetMonSize(species, *sizeRecord);
    
    FormatMonSizeRecord(gStringVar3, size);
    StringCopy(gStringVar1, gSpeciesNames[species]);
    if(*sizeRecord == 0x8100)
        StringCopy(gStringVar2, gOtherText_Marco);
    else
        StringCopy(gStringVar2, gSaveBlock2.playerName);
}

void InitShroomishSizeRecord(void)
{
    VarSet(VAR_SHROOMISH_SIZE_RECORD, 0x8100);
}

void GetShroomishSizeRecordInfo(void)
{
    u16 *sizeRecord = GetVarPointer(VAR_SHROOMISH_SIZE_RECORD);
    
    GetMonSizeRecordInfo(SPECIES_SHROOMISH, sizeRecord);
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

void GetBarboachSizeRecordInfo(void)
{
    u16 *sizeRecord = GetVarPointer(VAR_BARBOACH_SIZE_RECORD);
    
    GetMonSizeRecordInfo(SPECIES_BARBOACH, sizeRecord);
}

void CompareBarboachSize(void)
{
    u16 *sizeRecord = GetVarPointer(VAR_BARBOACH_SIZE_RECORD);
    
    gScriptResult = CompareMonSize(SPECIES_BARBOACH, sizeRecord);
}

void GiveGiftRibbonToParty(u8 index, u8 ribbonId)
{
    s32 i;
    u8 arr[7];
    bool32 gotRibbon = FALSE;
    u8 data = 1;
    
    memcpy(arr, gUnknown_083D188E, 7);
    if(index < 11 && ribbonId < 65)
    {
        gSaveBlock1.giftRibbons[index] = ribbonId;
        for(i = 0; i < 6; i++)
        {
            struct Pokemon *pkmn = &gPlayerParty[i];
            
            if(GetMonData(pkmn, MON_DATA_SPECIES) != 0 && GetMonData(pkmn, MON_DATA_SANITY_BIT3) == 0)
            {
                SetMonData(pkmn, arr[index], &data);
                gotRibbon = TRUE;
            }
        }
        if(gotRibbon)
            FlagSet(SYS_RIBBON_GET);
    }
}
