#include "global.h"
#include "pokemon_summary_screen.h"
#include "data2.h"
#include "ewram.h"
#include "item.h"
#include "items.h"
#include "link.h"
#include "menu.h"
#include "menu_helpers.h"
#include "party_menu.h"
#include "pokemon.h"
#include "region_map.h"
#include "species.h"
#include "string_util.h"
#include "strings.h"
#include "strings2.h"
#include "tv.h"

struct SummaryScreenStruct
{
    /*0x00*/ u8 filler0[9];
    /*0x09*/ u8 unk9;
};

#define ewramSS (*(struct SummaryScreenStruct *)(gSharedMem + 0x18000))

extern u8 *sub_80A1E58(u8 *, u8);
static void sub_80A0A2C(struct Pokemon *, u8, u8);
extern void sub_80A1FF8(const u8 *, u8, u8, u8);

extern const u8 gUnknown_083C15AE[];
extern const u8 gUnknown_083C15B4[];

bool8 PokemonSummaryScreen_CheckOT(struct Pokemon *mon)
{
    u32 trainerId;

    if (ewram18000_3 == gEnemyParty)
    {
        u8 enemyId = GetMultiplayerId() ^ 1;
        trainerId = gLinkPlayers[enemyId].trainerId & 0xFFFF;
        StringCopy(gStringVar1, gLinkPlayers[enemyId].name);
        StripExtCtrlCodes(gStringVar1);
    }
    else
    {
        trainerId = GetPlayerTrainerId() & 0xFFFF;
        StringCopy(gStringVar1, gSaveBlock2.playerName);
    }

    if (trainerId != (GetMonData(mon, MON_DATA_OT_ID) & 0xFFFF))
        return FALSE;

    GetMonData(mon, MON_DATA_OT_NAME, gStringVar2);

    if (!StringCompareWithoutExtCtrlCodes(gStringVar1, gStringVar2))
        return TRUE;

    return FALSE;
}

void PokemonSummaryScreen_PrintEggTrainerMemo(struct Pokemon *mon, u8 left, u8 top)
{
    u8 locationMet;
    u8 gameMet = GetMonData(mon, MON_DATA_MET_GAME);

    if (!(gameMet == VERSION_RUBY || gameMet == VERSION_SAPPHIRE || gameMet == VERSION_EMERALD))
    {
        MenuPrint(gOtherText_EggObtainedInTrade, left, top);
        return;
    }

    locationMet = GetMonData(mon, MON_DATA_MET_LOCATION);

    if (locationMet == 255)
    {
        // Eggs received from Pokemon Box.
        MenuPrint(gOtherText_EggNicePlace, left, top);
        return;
    }

    if (!PokemonSummaryScreen_CheckOT(mon))
    {
        MenuPrint(gOtherText_EggObtainedInTrade, left, top);
        return;
    }

    asm(""); // needed to match for some reason

    if (locationMet == 253)
    {
        MenuPrint(gOtherText_EggHotSprings, left, top);
        return;
    }

    MenuPrint(gOtherText_EggDayCare, left, top);
}

void PokemonSummaryScreen_PrintTrainerMemo(struct Pokemon *pokemon, u8 left, u8 top)
{
    u8 locationMet;
    u8 gameMet;
    u8 *ptr = gStringVar4;
    u8 nature = GetNature(pokemon);

#if ENGLISH
    ptr = sub_80A1E9C(ptr, gNatureNames[nature], 14);

    if (nature != NATURE_BOLD && nature != NATURE_GENTLE)
    {
        ptr = StringCopy(ptr, gOtherText_Terminator4);
    }

    ptr = StringCopy(ptr, gOtherText_Nature);
#elif GERMAN
    ptr = StringCopy(gStringVar4, gOtherText_Nature);
    ptr = sub_80A1E9C(ptr, gNatureNames[nature], 14);
    ptr = StringCopy(ptr, gOtherText_Terminator4);
#endif

    if (PokemonSummaryScreen_CheckOT(pokemon) == TRUE)
    {
        locationMet = GetMonData(pokemon, MON_DATA_MET_LOCATION);

        if (GetMonData(pokemon, MON_DATA_MET_LEVEL) == 0)
        {
            ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, 5);
            *ptr = CHAR_NEWLINE;
            ptr++;

            CopyLocationName(gStringVar1, locationMet);
            ptr = sub_80A1E9C(ptr, gStringVar1, 14);
            StringCopy(ptr, gOtherText_Egg2);
        }
        else if (locationMet >= 88)
        {
            *ptr = CHAR_NEWLINE;
            ptr++;

            StringCopy(ptr, gOtherText_ObtainedInTrade);
        }
        else
        {
            u8 levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

            ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
            *ptr = CHAR_NEWLINE;
            ptr++;

            CopyLocationName(gStringVar1, locationMet);
            ptr = sub_80A1E9C(ptr, gStringVar1, 14);
            StringCopy(ptr, gOtherText_Met);
        }
    }
    else
    {
        gameMet = GetMonData(pokemon, MON_DATA_MET_GAME);

        if (!(gameMet == VERSION_RUBY || gameMet == VERSION_SAPPHIRE || gameMet == VERSION_EMERALD))
        {
            *ptr = CHAR_NEWLINE;
            ptr++;

            StringCopy(ptr, gOtherText_ObtainedInTrade);
        }
        else
        {
            locationMet = GetMonData(pokemon, MON_DATA_MET_LOCATION);
            if (locationMet == 0xFF)
            {
                u8 levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

                ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
                *ptr = CHAR_NEWLINE;
                ptr++;

                StringCopy(ptr, gOtherText_FatefulEncounter);
            }
            else if (locationMet >= 88)
            {
                *ptr = CHAR_NEWLINE;
                ptr++;

                StringCopy(ptr, gOtherText_ObtainedInTrade);
            }
            else
            {
                u8 levelMet = GetMonData(pokemon, MON_DATA_MET_LEVEL);

                ptr = PokemonSummaryScreen_CopyPokemonLevel(ptr, levelMet);
                *ptr = CHAR_NEWLINE;
                ptr++;

                CopyLocationName(gStringVar1, locationMet);
                ptr = sub_80A1E9C(ptr, gStringVar1, 14);
                StringCopy(ptr, gOtherText_Met2);
            }
        }
    }

    MenuPrint(gStringVar4, left++, top++);
}

void sub_80A0958(struct Pokemon *pokemon)
{
    u16 species;
    u8 *buffer;
    u8 level;

    species = GetMonData(pokemon, MON_DATA_SPECIES);

    buffer = gStringVar1;
    buffer = sub_80A1E58(buffer, 13);
    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x11;
    buffer[2] = 0x7;
    buffer[3] = CHAR_SLASH;
    buffer += 4;
    buffer = StringCopy(buffer, gSpeciesNames[species]);

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x13;
    buffer[2] = 0x50;
    buffer[3] = EOS;

    MenuPrint(gStringVar1, 0, 14);
    MenuZeroFillWindowRect(3, 16, 9, 17);

    level = GetMonData(pokemon, MON_DATA_LEVEL);

    buffer = sub_80A1E58(gStringVar1, 13);
    buffer[0] = 0x34;
    buffer += 1;
    buffer = ConvertIntToDecimalString(buffer, level);

    buffer[0] = EXT_CTRL_CODE_BEGIN;
    buffer[1] = 0x13;
    buffer[2] = 0x20;
    buffer[3] = EOS;

    MenuPrint(gStringVar1, 3, 16);
    sub_80A0A2C(pokemon, 7, 16);
}

void sub_80A0A2C(struct Pokemon *pokemon, u8 left, u8 top)
{
    const u8 *genderSymbol;
    u8 var1;
    u8 bottom;
    u16 species = GetMonData(pokemon, MON_DATA_SPECIES2);

    if (species != SPECIES_NIDORAN_M && species != SPECIES_NIDORAN_F)
    {
        u8 gender = GetMonGender(pokemon);
        switch (gender)
        {
        default:
            bottom = top + 1;
            MenuZeroFillWindowRect(left, top, left, bottom);
            return;
        case MON_MALE:
            genderSymbol = gOtherText_MaleSymbol2;
            var1 = 11;
            break;
        case MON_FEMALE:
            genderSymbol = gOtherText_FemaleSymbolAndLv;
            var1 = 12;
            break;
        }

        sub_80A1FF8(genderSymbol, var1, left, top);
    }
}

u8 GetNumRibbons(struct Pokemon *pokemon)
{
    u8 numRibbons = GetMonData(pokemon, MON_DATA_COOL_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_BEAUTY_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_CUTE_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_SMART_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_TOUGH_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_CHAMPION_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_WINNING_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_VICTORY_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_ARTIST_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_EFFORT_RIBBON);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_1);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_2);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_3);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_4);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_5);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_6);
    numRibbons += GetMonData(pokemon, MON_DATA_GIFT_RIBBON_7);

    return numRibbons;
}

void PrintNumRibbons(struct Pokemon *pokemon)
{
    u8 numRibbons = GetNumRibbons(pokemon);

    if (numRibbons == 0)
    {
        StringCopy(gStringVar1, gOtherText_None);
    }
    else
    {
        u8 ribbonsStringLength;
        u8 *text;

        StringCopy(gStringVar1, gOtherText_Ribbons00);
        ribbonsStringLength = StringLength(gStringVar1);

        text = &gStringVar1[ribbonsStringLength - 2];

        text[0] = EXT_CTRL_CODE_BEGIN;
        text[1] = 0x14;
        text[2] = 6;
        ConvertIntToDecimalStringN(&text[3], numRibbons, 1, 2);
    }

    MenuPrint(gUnknown_083C15AE, 21, 4);
}

void PrintHeldItemName(u16 itemId, u8 left, u8 top)
{
    if (itemId == ITEM_ENIGMA_BERRY
        && sub_80F9344() == TRUE
        && IsLinkDoubleBattle() == TRUE
        && (ewramSS.unk9 == 1 || ewramSS.unk9 == 4 || ewramSS.unk9 == 5))
    {
        StringCopy(gStringVar1, ItemId_GetItem(itemId)->name);
    }
    else if (itemId == 0)
    {
        StringCopy(gStringVar1, gOtherText_None);
    }
    else
    {
        CopyItemName(itemId, gStringVar1);
    }

    MenuPrint(gUnknown_083C15B4, left, top);
}

void DrawExperienceProgressBar(struct Pokemon *pokemon, u8 left, u8 top)
{
    u32 curExperience;
    u8 level;
    u16 species;
    u8 i;
    u16 *vramAddr;
    u32 expToNextLevel = 0;
    s64 numExpProgressBarTicks = 0;

    curExperience = GetMonData(pokemon, MON_DATA_EXP);
    level = GetMonData(pokemon, MON_DATA_LEVEL);
    species = GetMonData(pokemon, MON_DATA_SPECIES);

    // The experience progress bar is shown as empty when the Pokemon is already level 100.
    if (level < 100)
    {
        u32 nextLevelExp;
        u32 expSinceLastLevel;
        u32 expBetweenLevels;
        u32 curLevelExperience;

        nextLevelExp = gExperienceTables[gBaseStats[species].growthRate][level + 1];
        expToNextLevel = nextLevelExp - curExperience;
        curLevelExperience = gExperienceTables[gBaseStats[species].growthRate][level];
        expBetweenLevels = (nextLevelExp - curLevelExperience);
        expSinceLastLevel = curExperience - curLevelExperience;

        // Calculate the number of 1-pixel "ticks" to illuminate in the experience progress bar.
        // There are 8 tiles that make up the bar, and each tile has 8 "ticks". Hence, the numerator
        // is multiplied by 64.
        numExpProgressBarTicks = (expSinceLastLevel * 64) / expBetweenLevels;
        if (numExpProgressBarTicks == 0 && expSinceLastLevel != 0)
        {
            // Ensure sure some exp. gain is visible in the progress bar.
            numExpProgressBarTicks = 1;
        }
    }

    ConvertIntToDecimalString(gStringVar1, expToNextLevel);
    MenuPrint_RightAligned(gStringVar1, left + 6, top);


    // Draw each of the 8 tiles that make up the experience progress bar.
    vramAddr = (u16 *)(VRAM + 0x4CAA);
    for (i = 0; i < 8; i++)
    {
        u16 tile;
        u16 baseTile = 0x2062;

        if (numExpProgressBarTicks > 7)
        {
            tile = 0x206A; // full exp. bar block
        }
        else
        {
            tile = (numExpProgressBarTicks % 8) + baseTile;
        }

        vramAddr[i] = tile;

        numExpProgressBarTicks -= 8;
        if (numExpProgressBarTicks < 0)
        {
            numExpProgressBarTicks = 0;
        }
    }
}
