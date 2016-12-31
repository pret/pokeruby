#include "global.h"
#include "asm.h"
#include "text.h"
#include "string_util.h"
#include "pokemon.h"
#include "rng.h"
#include "species.h"
#include "main.h"
#include "sprite.h"
#include "flag.h"
#include "rtc.h"
#include "item.h"

#define EVO_FRIENDSHIP       0x0001 // Pokémon levels up with friendship ≥ 220
#define EVO_FRIENDSHIP_DAY   0x0002 // Pokémon levels up during the day with friendship ≥ 220
#define EVO_FRIENDSHIP_NIGHT 0x0003 // Pokémon levels up at night with friendship ≥ 220
#define EVO_LEVEL            0x0004 // Pokémon reaches the specified level
#define EVO_TRADE            0x0005 // Pokémon is traded
#define EVO_TRADE_ITEM       0x0006 // Pokémon is traded while it's holding the specified item
#define EVO_ITEM             0x0007 // specified item is used on Pokémon
#define EVO_LEVEL_ATK_GT_DEF 0x0008 // Pokémon reaches the specified level with attack > defense
#define EVO_LEVEL_ATK_EQ_DEF 0x0009 // Pokémon reaches the specified level with attack = defense
#define EVO_LEVEL_ATK_LT_DEF 0x000a // Pokémon reaches the specified level with attack < defense
#define EVO_LEVEL_SILCOON    0x000b // Pokémon reaches the specified level with a Silcoon personality value
#define EVO_LEVEL_CASCOON    0x000c // Pokémon reaches the specified level with a Cascoon personality value
#define EVO_LEVEL_NINJASK    0x000d // Pokémon reaches the specified level (special value for Ninjask)
#define EVO_LEVEL_SHEDINJA   0x000e // Pokémon reaches the specified level (special value for Shedinja)
#define EVO_BEAUTY           0x000f // Pokémon levels up with beauty ≥ specified value

struct Evolution
{
    u16 method;
    u16 param;
    u16 targetSpecies;
};

struct EvolutionData
{
    struct Evolution evolutions[5];
};

extern void get_battle_strings_(u8 *);

extern u8 gPlayerPartyCount;
extern struct Pokemon gPlayerParty[6];
extern u8 gEnemyPartyCount;
extern struct Pokemon gEnemyParty[6];
extern struct BattlePokemon gBattleMons[4];
extern u8 * const gItemEffectTable[];
extern u8 gUnknown_02024A60;
extern struct BattleEnigmaBerry gEnigmaBerries[];
extern struct EvolutionData gEvolutionTable[];
extern u16 gSpeciesToHoennPokedexNum[];
extern u16 gSpeciesToNationalPokedexNum[];
extern u16 gHoennToNationalOrder[];
extern u16 gSpeciesIdToCryId[];
extern u8 gUnknown_030041C0[];
extern u8 gUnknown_03004290[];
extern u8 gUnknown_020238CC[];
extern u8 gUnknown_02024C07;
extern u8 gUnknown_02024C08;
extern u8 gUnknown_02024C0B;
extern u8 gUnknown_02024E6C;

extern u8 gUnknown_082082F8[];
extern u8 gUnknown_083FFDB3[];
extern u8 gUnknown_083FFDD3[];
extern u8 gUnknown_083FEE5D[];
extern u8 gUnknown_083FEE92[];
extern u8 *gUnknown_08400F58[];

bool8 HealStatusConditions(struct Pokemon *mon, u32 unused, u32 healMask, u8 battleId)
{
    u32 status = GetMonData(mon, MON_DATA_STATUS, 0);

    if (status & healMask)
    {
        status &= ~healMask;
        SetMonData(mon, MON_DATA_STATUS, (u8 *)&status);
        if (gMain.inBattle && battleId != 4)
            gBattleMons[battleId].status1 &= ~healMask;
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

u8 GetItemEffectParamOffset(u16 itemId, u8 effectByte, u8 effectBit)
{
    u8 *temp;
    u8 *itemEffect;
    u8 offset;
    int i;
    u8 j;
    u8 val;

    offset = 6;

    temp = gItemEffectTable[itemId - 13];

    if (!temp && itemId != 175)
        return 0;

    if (itemId == 175)
    {
        temp = gEnigmaBerries[gUnknown_02024A60].itemEffect;
    }

    itemEffect = temp;

    for (i = 0; i < 6; i++)
    {
        switch (i)
        {
        case 0:
        case 1:
        case 2:
        case 3:
            if (i == effectByte)
                return 0;
            break;
        case 4:
            val = itemEffect[4];
            if (val & 0x20)
                val &= 0xDF;
            j = 0;
            while (val)
            {
                if (val & 1)
                {
                    switch (j)
                    {
                        case 2:
                            if (val & 0x10)
                                val &= 0xEF;
                        case 0:
                            if (i == effectByte && (val & effectBit))
                                return offset;
                            offset++;
                            break;
                        case 1:
                            if (i == effectByte && (val & effectBit))
                                return offset;
                            offset++;
                            break;
                        case 3:
                            if (i == effectByte && (val & effectBit))
                                return offset;
                            offset++;
                            break;
                        case 7:
                            if (i == effectByte)
                                return 0;
                            break;
                    }
                }
                j++;
                val >>= 1;
                if (i == effectByte)
                    effectBit >>= 1;
            }
            break;
        case 5:
            val = itemEffect[5];
            j = 0;
            while (val)
            {
                if (val & 1)
                {
                    switch (j)
                    {
                        case 0:
                        case 1:
                        case 2:
                        case 3:
                        case 4:
                        case 5:
                        case 6:
                            if (i == effectByte && (val & effectBit))
                                return offset;
                            offset++;
                            break;
                        case 7:
                            if (i == effectByte)
                                return 0;
                            break;
                    }
                }
                j++;
                val >>= 1;
                if (i == effectByte)
                    effectBit >>= 1;
            }
            break;
        }
    }

    return offset;
}

void sub_803F324(int stat)
{
    gUnknown_02024C08 = gUnknown_02024E6C;
    StringCopy(gUnknown_030041C0, gUnknown_08400F58[gUnknown_082082F8[stat]]);
    StringCopy(gUnknown_03004290, gUnknown_083FFDB3);
    get_battle_strings_(gUnknown_083FFDD3);
}

u8 *sub_803F378(u16 itemId)
{
    int i;
    u8 *itemEffect;

    if (itemId == 175)
    {
        if (gMain.inBattle)
        {
            itemEffect = gEnigmaBerries[gUnknown_02024E6C].itemEffect;
        }
        else
        {
            itemEffect = gSaveBlock1.enigmaBerry.itemEffect;
        }
    }
    else
    {
        itemEffect = gItemEffectTable[itemId - 13];
    }

    gUnknown_02024C0B = gUnknown_02024E6C;

    for (i = 0; i < 3; i++)
    {
        if (itemEffect[i] & 0xF)
            sub_803F324(i * 2);
        if (itemEffect[i] & 0xF0)
        {
            if (i)
            {
                sub_803F324(i * 2 + 1);
            }
            else
            {
                gUnknown_02024C07 = gUnknown_02024E6C;
                get_battle_strings_(gUnknown_083FEE92);
            }
        }
    }

    if (itemEffect[3] & 0x80)
    {
        gUnknown_02024C07 = gUnknown_02024E6C;
        get_battle_strings_(gUnknown_083FEE5D);
    }

    return gUnknown_020238CC;
}

u8 GetNature(struct Pokemon *mon)
{
    return GetMonData(mon, MON_DATA_PERSONALITY, 0) % 25;
}

u8 GetNatureFromPersonality(u32 personality)
{
    return personality % 25;
}

u16 GetEvolutionTargetSpecies(struct Pokemon *mon, u8 type, u16 evolutionItem)
{
    int i;
    u16 targetSpecies = 0;
    u16 species = GetMonData(mon, MON_DATA_SPECIES, 0);
    u16 heldItem = GetMonData(mon, MON_DATA_HELD_ITEM, 0);
    u32 personality = GetMonData(mon, MON_DATA_PERSONALITY, 0);
    u8 level;
    u16 friendship;
    u8 beauty = GetMonData(mon, MON_DATA_BEAUTY, 0);
    u16 upperPersonality = personality >> 16;
    u8 holdEffect;

    if (heldItem == 175)
        holdEffect = gSaveBlock1.enigmaBerry.holdEffect;
    else
        holdEffect = ItemId_GetHoldEffect(heldItem);

    if (holdEffect == 38 && type != 3)
        return 0;

    switch (type)
    {
    case 0:
        level = GetMonData(mon, MON_DATA_LEVEL, 0);
        friendship = GetMonData(mon, MON_DATA_FRIENDSHIP, 0);

        for (i = 0; i < 5; i++)
        {
            switch (gEvolutionTable[species].evolutions[i].method)
            {
            case EVO_FRIENDSHIP:
                if (friendship >= 220)
                    targetSpecies = gEvolutionTable[species].evolutions[i].targetSpecies;
                break;
            case EVO_FRIENDSHIP_DAY:
                RtcCalcLocalTime();
                if (gLocalTime.hours >= 12 && gLocalTime.hours < 24 && friendship >= 220)
                    targetSpecies = gEvolutionTable[species].evolutions[i].targetSpecies;
                break;
            case EVO_FRIENDSHIP_NIGHT:
                RtcCalcLocalTime();
                if (gLocalTime.hours >= 0 && gLocalTime.hours < 12 && friendship >= 220)
                    targetSpecies = gEvolutionTable[species].evolutions[i].targetSpecies;
                break;
            case EVO_LEVEL:
                if (gEvolutionTable[species].evolutions[i].param <= level)
                    targetSpecies = gEvolutionTable[species].evolutions[i].targetSpecies;
                break;
            case EVO_LEVEL_ATK_GT_DEF:
                if (gEvolutionTable[species].evolutions[i].param <= level)
                    if (GetMonData(mon, MON_DATA_ATK, 0) > GetMonData(mon, MON_DATA_DEF, 0))
                        targetSpecies = gEvolutionTable[species].evolutions[i].targetSpecies;
                break;
            case EVO_LEVEL_ATK_EQ_DEF:
                if (gEvolutionTable[species].evolutions[i].param <= level)
                    if (GetMonData(mon, MON_DATA_ATK, 0) == GetMonData(mon, MON_DATA_DEF, 0))
                        targetSpecies = gEvolutionTable[species].evolutions[i].targetSpecies;
                break;
            case EVO_LEVEL_ATK_LT_DEF:
                if (gEvolutionTable[species].evolutions[i].param <= level)
                    if (GetMonData(mon, MON_DATA_ATK, 0) < GetMonData(mon, MON_DATA_DEF, 0))
                        targetSpecies = gEvolutionTable[species].evolutions[i].targetSpecies;
                break;
            case EVO_LEVEL_SILCOON:
                if (gEvolutionTable[species].evolutions[i].param <= level && (upperPersonality % 10) <= 4)
                    targetSpecies = gEvolutionTable[species].evolutions[i].targetSpecies;
                break;
            case EVO_LEVEL_CASCOON:
                if (gEvolutionTable[species].evolutions[i].param <= level && (upperPersonality % 10) > 4)
                    targetSpecies = gEvolutionTable[species].evolutions[i].targetSpecies;
                break;
            case EVO_LEVEL_NINJASK:
                if (gEvolutionTable[species].evolutions[i].param <= level)
                    targetSpecies = gEvolutionTable[species].evolutions[i].targetSpecies;
                break;
            case EVO_BEAUTY:
                if (gEvolutionTable[species].evolutions[i].param <= beauty)
                    targetSpecies = gEvolutionTable[species].evolutions[i].targetSpecies;
                break;
            }
        }
        break;
    case 1:
        for (i = 0; i < 5; i++)
        {
            switch (gEvolutionTable[species].evolutions[i].method)
            {
            case EVO_TRADE:
                targetSpecies = gEvolutionTable[species].evolutions[i].targetSpecies;
                break;
            case EVO_TRADE_ITEM:
                if (gEvolutionTable[species].evolutions[i].param == heldItem)
                {
                    heldItem = 0;
                    SetMonData(mon, MON_DATA_HELD_ITEM, (u8 *)&heldItem);
                    targetSpecies = gEvolutionTable[species].evolutions[i].targetSpecies;
                }
                break;
            }
        }
        break;
    case 2:
    case 3:
        for (i = 0; i < 5; i++)
        {
            if (gEvolutionTable[species].evolutions[i].method == EVO_ITEM
             && gEvolutionTable[species].evolutions[i].param == evolutionItem)
            {
                targetSpecies = gEvolutionTable[species].evolutions[i].targetSpecies;
                break;
            }
        }
        break;
    }

    return targetSpecies;
}

u16 HoennPokedexNumToSpecies(u16 hoennNum)
{
    u16 species;

    if (!hoennNum)
        return 0;

    species = 0;

    while (species < 411 && gSpeciesToHoennPokedexNum[species] != hoennNum)
        species++;

    if (species == 411)
        return 0;

    return species + 1;
}

u16 NationalPokedexNumToSpecies(u16 nationalNum)
{
    u16 species;

    if (!nationalNum)
        return 0;

    species = 0;

    while (species < 411 && gSpeciesToNationalPokedexNum[species] != nationalNum)
        species++;

    if (species == 411)
        return 0;

    return species + 1;
}

u16 NationalToHoennOrder(u16 nationalNum)
{
    u16 hoennNum;

    if (!nationalNum)
        return 0;

    hoennNum = 0;

    while (hoennNum < 411 && gHoennToNationalOrder[hoennNum] != nationalNum)
        hoennNum++;

    if (hoennNum == 411)
        return 0;

    return hoennNum + 1;
}

u16 SpeciesToNationalPokedexNum(u16 species)
{
    if (!species)
        return 0;

    return gSpeciesToNationalPokedexNum[species - 1];
}

u16 SpeciesToHoennPokedexNum(u16 species)
{
    if (!species)
        return 0;

    return gSpeciesToHoennPokedexNum[species - 1];
}

u16 HoennToNationalOrder(u16 hoennNum)
{
    if (!hoennNum)
        return 0;

    return gHoennToNationalOrder[hoennNum - 1];
}

u32 SpeciesToCryId(u16 species)
{
    if (species <= 250)
        return species;

    if (species < 276)
        return 200;

    return gSpeciesIdToCryId[species - 276];
}
