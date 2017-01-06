#include "global.h"
#include "pokemon_size_record.h"
#include "string_util.h"
#include "species.h"
#include "event_data.h"

extern u16 SpeciesToNationalPokedexNum(u16);
extern u16 GetPokedexHeightWeight(u16, u8);

struct UnknownStruct
{
    u16 unk0;
    u8 unk2;
    u16 unk4;
};

extern u8 gOtherText_Marco[];
extern u16 gScriptResult;
extern u8 gSpeciesNames[][11];

static const struct UnknownStruct sBigMonSizeTable[] =
{
    {  290,   1,      0 },
    {  300,   1,     10 },
    {  400,   2,    110 },
    {  500,   4,    310 },
    {  600,  20,    710 },
    {  700,  50,   2710 },
    {  800, 100,   7710 },
    {  900, 150,  17710 },
    { 1000, 150,  32710 },
    { 1100, 100, -17826 },
    { 1200,  50,  -7826 },
    { 1300,  20,  -2826 },
    { 1400,   5,   -826 },
    { 1500,   2,   -326 },
    { 1600,   1,   -126 },
    { 1700,   1,    -26 },
};

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
        if(a < sBigMonSizeTable[i].unk4)
            return i - 1;
    }
    return i;
}

static u32 GetMonSize(u16 species, u16 b)
{
    u64 unk2;
    u64 unk4;
    u64 unk0;
    u32 height;
    u32 var;

    height = GetPokedexHeightWeight(SpeciesToNationalPokedexNum(species), 0);
    var = TranslateBigMonSizeTableIndex(b);
    unk0 = sBigMonSizeTable[var].unk0;
    unk2 = sBigMonSizeTable[var].unk2;
    unk4 = sBigMonSizeTable[var].unk4;
    unk0 += (b - unk4) / unk2;
    return height * unk0 / 10;
}

static void FormatMonSizeRecord(u8 *string, u32 size)
{
    u8 decimalPoint[] = _".";

    //Convert size from centimeters to inches
    size = (double)(size * 10) / (CM_PER_INCH * 10);
    string = ConvertIntToDecimalStringN(string, size / 10, 0, 8);
    string = StringAppend(string, decimalPoint);
    ConvertIntToDecimalStringN(string, size % 10, 0, 1);
}

static u8 CompareMonSize(u16 species, u16 *sizeRecord)
{
    if(gScriptResult == 0xFF)
    {
        return 0;
    }
    else
    {
        struct Pokemon *pkmn = &gPlayerParty[gScriptResult];

        // UB: Too few arguments for function 'GetMonData'
        if(GetMonData(pkmn, MON_DATA_IS_EGG) == TRUE || GetMonData(pkmn, MON_DATA_SPECIES) != species)
        {
            return 1;
        }
        else
        {
            u32 oldSize;
            u32 newSize;
            u16 sizeParams;

            *(&sizeParams) = GetMonSizeHash(pkmn);
            newSize = GetMonSize(species, sizeParams);
            oldSize = GetMonSize(species, *sizeRecord);
            FormatMonSizeRecord(gStringVar2, newSize);
            if(newSize <= oldSize)
            {
                return 2;
            }
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
    bool32 gotRibbon = FALSE;
    u8 data = 1;
    u8 arr[] = { 0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E };

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
