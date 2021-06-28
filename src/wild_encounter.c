#include "global.h"
#include "wild_encounter.h"
#include "constants/abilities.h"
#include "battle_setup.h"
#include "event_data.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "constants/maps.h"
#include "metatile_behavior.h"
#include "pokeblock.h"
#include "random.h"
#include "roamer.h"
#include "overworld.h"
#include "safari_zone.h"
#include "script.h"
#include "constants/species.h"
#include "tv.h"

#include "data/wild_encounters.h"

const struct WildPokemon gWildFeebasRoute119Data = {20, 25, SPECIES_FEEBAS};

const u16 gRoute119WaterTileData[] =
{
	0, 0x2D, 0,
	0x2E, 0x5B, 0x83,
	0x5C, 0x8B, 0x12A,
};

extern u16 gSpecialVar_Result;
extern u8 S_RepelWoreOff[];

EWRAM_DATA u8 gWildEncountersDisabled = 0;
EWRAM_DATA static u32 sFeebasRngValue = 0;

#define NUM_FEEBAS_SPOTS 6

u16 FeebasRandom(void);
void FeebasSeedRng(u16 seed);

static bool8 IsWildLevelAllowedByRepel(u8 level);
static void ApplyFluteEncounterRateMod(u32 *encRate);
static void ApplyCleanseTagEncounterRateMod(u32 *encRate);

void DisableWildEncounters(bool8 disabled)
{
    gWildEncountersDisabled = disabled;
}

static u16 GetRoute119WaterTileNum(s16 x, s16 y, u8 section)
{
    u16 xCur;
    u16 yCur;
    u16 yMin = gRoute119WaterTileData[section * 3 + 0];
    u16 yMax = gRoute119WaterTileData[section * 3 + 1];
    u16 tileNum = gRoute119WaterTileData[section * 3 + 2];

    for (yCur = yMin; yCur <= yMax; yCur++)
    {
        for (xCur = 0; xCur < gMapHeader.mapLayout->width; xCur++)
        {
            if (MetatileBehavior_IsFeebasEncounterable(MapGridGetMetatileBehaviorAt(xCur + 7, yCur + 7)) == TRUE)
            {
                tileNum++;
                if (x == xCur && y == yCur)
                    return tileNum;
            }
        }
    }
    return tileNum + 1;
}

static bool8 CheckFeebas(void)
{
    u8 i;
    u16 feebasSpots[6];
    s16 x;
    s16 y;
    u8 route119section = 0;
    u16 waterTileNum;

    if (gSaveBlock1.location.mapGroup == MAP_GROUP(ROUTE119)
     && gSaveBlock1.location.mapNum == MAP_NUM(ROUTE119))
    {
        GetXYCoordsOneStepInFrontOfPlayer(&x, &y);
        x -= 7;
        y -= 7;

        if (y >= gRoute119WaterTileData[3 * 0 + 0] && y <= gRoute119WaterTileData[3 * 0 + 1])
            route119section = 0;
        if (y >= gRoute119WaterTileData[3 * 1 + 0] && y <= gRoute119WaterTileData[3 * 1 + 1])
            route119section = 1;
        if (y >= gRoute119WaterTileData[3 * 2 + 0] && y <= gRoute119WaterTileData[3 * 2 + 1])
            route119section = 2;

        if (Random() % 100 > 49) //50% chance of encountering Feebas
            return FALSE;

        FeebasSeedRng(gSaveBlock1.easyChatPairs[0].unk2);
        for (i = 0; i != NUM_FEEBAS_SPOTS;)
        {
            feebasSpots[i] = FeebasRandom() % 447;
            if (feebasSpots[i] == 0)
                feebasSpots[i] = 447;
            if (feebasSpots[i] < 1 || feebasSpots[i] >= 4)
                i++;
        }
        waterTileNum = GetRoute119WaterTileNum(x, y, route119section);
        for (i = 0; i < NUM_FEEBAS_SPOTS; i++)
        {
            if (waterTileNum == feebasSpots[i])
                return TRUE;
        }
    }
    return FALSE;
}

u16 FeebasRandom(void)
{
    sFeebasRngValue = 12345 + 0x41C64E6D * sFeebasRngValue;
    return sFeebasRngValue >> 16;
}

void FeebasSeedRng(u16 seed)
{
    sFeebasRngValue = seed;
}

#if DEBUG
u16 FeebasDebug_GetTrueNumberOfWaterTilesInMapThird(u8 arg0)
{
    if (arg0 == 0)
        return 131;
    if (arg0 == 1)
        return 167;
    if (arg0 == 2)
        return 149;
    return 0;
}
#endif

static u8 ChooseWildMonIndex_Land(void)
{
    u8 rand = Random() % ENCOUNTER_CHANCE_LAND_MONS_TOTAL;

    if (rand < ENCOUNTER_CHANCE_LAND_MONS_SLOT_0)
        return 0;
    else if (rand >= ENCOUNTER_CHANCE_LAND_MONS_SLOT_0 && rand < ENCOUNTER_CHANCE_LAND_MONS_SLOT_1)
        return 1;
    else if (rand >= ENCOUNTER_CHANCE_LAND_MONS_SLOT_1 && rand < ENCOUNTER_CHANCE_LAND_MONS_SLOT_2)
        return 2;
    else if (rand >= ENCOUNTER_CHANCE_LAND_MONS_SLOT_2 && rand < ENCOUNTER_CHANCE_LAND_MONS_SLOT_3)
        return 3;
    else if (rand >= ENCOUNTER_CHANCE_LAND_MONS_SLOT_3 && rand < ENCOUNTER_CHANCE_LAND_MONS_SLOT_4)
        return 4;
    else if (rand >= ENCOUNTER_CHANCE_LAND_MONS_SLOT_4 && rand < ENCOUNTER_CHANCE_LAND_MONS_SLOT_5)
        return 5;
    else if (rand >= ENCOUNTER_CHANCE_LAND_MONS_SLOT_5 && rand < ENCOUNTER_CHANCE_LAND_MONS_SLOT_6)
        return 6;
    else if (rand >= ENCOUNTER_CHANCE_LAND_MONS_SLOT_6 && rand < ENCOUNTER_CHANCE_LAND_MONS_SLOT_7)
        return 7;
    else if (rand >= ENCOUNTER_CHANCE_LAND_MONS_SLOT_7 && rand < ENCOUNTER_CHANCE_LAND_MONS_SLOT_8)
        return 8;
    else if (rand >= ENCOUNTER_CHANCE_LAND_MONS_SLOT_8 && rand < ENCOUNTER_CHANCE_LAND_MONS_SLOT_9)
        return 9;
    else if (rand >= ENCOUNTER_CHANCE_LAND_MONS_SLOT_9 && rand < ENCOUNTER_CHANCE_LAND_MONS_SLOT_10)
        return 10;
    else
        return 11;
}

static u8 ChooseWildMonIndex_Water(void)
{
    u8 rand = Random() % ENCOUNTER_CHANCE_WATER_MONS_TOTAL;

    if (rand < ENCOUNTER_CHANCE_WATER_MONS_SLOT_0)
        return 0;
    else if (rand >= ENCOUNTER_CHANCE_WATER_MONS_SLOT_0 && rand < ENCOUNTER_CHANCE_WATER_MONS_SLOT_1)
        return 1;
    else if (rand >= ENCOUNTER_CHANCE_WATER_MONS_SLOT_1 && rand < ENCOUNTER_CHANCE_WATER_MONS_SLOT_2)
        return 2;
    else if (rand >= ENCOUNTER_CHANCE_WATER_MONS_SLOT_2 && rand < ENCOUNTER_CHANCE_WATER_MONS_SLOT_3)
        return 3;
    else
        return 4;
}

enum
{
    OLD_ROD,
    GOOD_ROD,
    SUPER_ROD
};

static u8 ChooseWildMonIndex_Fishing(u8 rod)
{
    u8 wildMonIndex = 0;
    u8 rand = Random() % max(max(ENCOUNTER_CHANCE_FISHING_MONS_OLD_ROD_TOTAL, ENCOUNTER_CHANCE_FISHING_MONS_GOOD_ROD_TOTAL),
                             ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_TOTAL);;

    switch (rod)
    {
    case OLD_ROD:
        if (rand < ENCOUNTER_CHANCE_FISHING_MONS_OLD_ROD_SLOT_0)
            wildMonIndex = 0;
        else
            wildMonIndex = 1;
        break;
    case GOOD_ROD:
        if (rand < ENCOUNTER_CHANCE_FISHING_MONS_GOOD_ROD_SLOT_2)
            wildMonIndex = 2;
        if (rand >= ENCOUNTER_CHANCE_FISHING_MONS_GOOD_ROD_SLOT_2 && rand < ENCOUNTER_CHANCE_FISHING_MONS_GOOD_ROD_SLOT_3)
            wildMonIndex = 3;
        if (rand >= ENCOUNTER_CHANCE_FISHING_MONS_GOOD_ROD_SLOT_3 && rand < ENCOUNTER_CHANCE_FISHING_MONS_GOOD_ROD_SLOT_4)
            wildMonIndex = 4;
        break;
    case SUPER_ROD:
        if (rand < ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_5)
            wildMonIndex = 5;
        if (rand >= ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_5 && rand < ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_6)
            wildMonIndex = 6;
        if (rand >= ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_6 && rand < ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_7)
            wildMonIndex = 7;
        if (rand >= ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_7 && rand < ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_8)
            wildMonIndex = 8;
        if (rand >= ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_8 && rand < ENCOUNTER_CHANCE_FISHING_MONS_SUPER_ROD_SLOT_9)
            wildMonIndex = 9;
        break;
    }
    return wildMonIndex;
}

static u8 ChooseWildMonLevel(const struct WildPokemon *wildPokemon)
{
    u8 min;
    u8 max;
    u8 range;
    u8 rand;

    //Make sure minimum level is less than maximum level
    if (wildPokemon->maxLevel >= wildPokemon->minLevel)
    {
        min = wildPokemon->minLevel;
        max = wildPokemon->maxLevel;
    }
    else
    {
        min = wildPokemon->maxLevel;
        max = wildPokemon->minLevel;
    }
    range = max - min + 1;
    rand = Random() % range;
    return min + rand;
}

static u16 GetCurrentMapWildMonHeader(void)
{
    u16 i;

    for (i = 0; gWildMonHeaders[i].mapGroup != 0xFF; i++)
    {
        if (gWildMonHeaders[i].mapGroup == gSaveBlock1.location.mapGroup &&
        gWildMonHeaders[i].mapNum == gSaveBlock1.location.mapNum)
            return i;
    }
    return -1;
}

static u8 PickWildMonNature(void)
{
    u8 i;
    u8 j;
    struct Pokeblock *safariPokeblock;
    u8 natures[25];

    if (GetSafariZoneFlag() == TRUE && Random() % 100 < 80)
    {
        safariPokeblock = SafariZoneGetActivePokeblock();
        if (safariPokeblock != NULL)
        {
            for (i = 0; i < 25; i++)
                natures[i] = i;
            for (i = 0; i < 24; i++)
            {
                for (j = i + 1; j < 25; j++)
                {
                    if (Random() & 1)
                    {
                        u8 temp = natures[i];

                        natures[i] = natures[j];
                        natures[j] = temp;
                    }
                }
            }
            for (i = 0; i < 25; i++)
            {
                if (PokeblockGetGain(natures[i], safariPokeblock) > 0)
                    return natures[i];
            }
        }
    }
    return Random() % 25;
}

static void CreateWildMon(u16 species, u8 b)
{
    ZeroEnemyPartyMons();
    CreateMonWithNature(&gEnemyParty[0], species, b, 0x20, PickWildMonNature());
}

static bool8 GenerateWildMon(const struct WildPokemonInfo *wildMonInfo, u8 area, bool8 checkRepel)
{
    u8 wildMonIndex = 0;
    u8 level;

    switch (area)
    {
    case 0:
        wildMonIndex = ChooseWildMonIndex_Land();
        break;
    case 1:
        wildMonIndex = ChooseWildMonIndex_Water();
        break;
    case 2:
        wildMonIndex = ChooseWildMonIndex_Water();
        break;
    }
    level = ChooseWildMonLevel(&wildMonInfo->wildPokemon[wildMonIndex]);
    if (checkRepel == TRUE && IsWildLevelAllowedByRepel(level) == FALSE)
        return FALSE;
    else
    {
        CreateWildMon(wildMonInfo->wildPokemon[wildMonIndex].species, level);
        return TRUE;
    }
}

static u16 GenerateFishingWildMon(const struct WildPokemonInfo *wildMonInfo, u8 rod)
{
    u8 wildMonIndex = ChooseWildMonIndex_Fishing(rod);
    u8 level = ChooseWildMonLevel(&wildMonInfo->wildPokemon[wildMonIndex]);

    CreateWildMon(wildMonInfo->wildPokemon[wildMonIndex].species, level);
    return wildMonInfo->wildPokemon[wildMonIndex].species;
}

static bool8 SetUpMassOutbreakEncounter(bool8 checkRepel)
{
    u16 i;

    if (checkRepel == TRUE && IsWildLevelAllowedByRepel(gSaveBlock1.outbreakPokemonLevel) == FALSE)
        return FALSE;
    else
    {
        CreateWildMon(gSaveBlock1.outbreakPokemonSpecies, gSaveBlock1.outbreakPokemonLevel);
        for (i = 0; i < 4; i++)
            SetMonMoveSlot(&gEnemyParty[0], gSaveBlock1.outbreakPokemonMoves[i], i);
        return TRUE;
    }
}

static bool8 DoMassOutbreakEncounterTest(void)
{
    if (gSaveBlock1.outbreakPokemonSpecies != 0
     && gSaveBlock1.location.mapNum == gSaveBlock1.outbreakLocationMapNum
     && gSaveBlock1.location.mapGroup == gSaveBlock1.outbreakLocationMapGroup)
    {
        if (Random() % 100 < gSaveBlock1.outbreakPokemonProbability)
            return TRUE;
    }
    return FALSE;
}

static bool8 DoWildEncounterRateDiceRoll(u16 encounterRate)
{
    if (Random() % 2880 < encounterRate)
        return TRUE;
    else
        return FALSE;
}

#if DEBUG
u16 debug_sub_809283C(u16 attempts)
{
    u16 retval = 0;
    u16 i = 0;

    while (i < attempts)
    {
        if (DoWildEncounterRateDiceRoll(320) == TRUE)
            retval++;

        i++;
    }

    return retval;
}
#endif

static bool8 DoWildEncounterTest(u32 encounterRate, bool8 ignoreAbility)
{
    encounterRate *= 16;
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE))
        encounterRate = encounterRate * 80 / 100;
    ApplyFluteEncounterRateMod(&encounterRate);
    ApplyCleanseTagEncounterRateMod(&encounterRate);
    if (!ignoreAbility)
    {
        // UB: Too few arguments for function 'GetMonData'
        if (!GetMonData(&gPlayerParty[0], MON_DATA_SANITY_BIT3))
        {
            u32 ability = GetMonAbility(&gPlayerParty[0]);
            if (ability == ABILITY_STENCH)
                encounterRate /= 2;
            if (ability == ABILITY_ILLUMINATE)
                encounterRate *= 2;
        }
    }
    if (encounterRate > 2880)
        encounterRate = 2880;
    return DoWildEncounterRateDiceRoll(encounterRate);
}

static bool8 DoGlobalWildEncounterDiceRoll(void)
{
    if (Random() % 100 >= 60)
        return FALSE;
    else
        return TRUE;
}

bool8 StandardWildEncounter(u16 curMetatileBehavior, u16 prevMetatileBehavior)
{
    u16 headerNum;
    struct Roamer *roamer;

    if (gWildEncountersDisabled == TRUE)
        return 0;
    else
    {
        headerNum = GetCurrentMapWildMonHeader();
        if (headerNum != 0xFFFF)
        {
            if (MetatileBehavior_IsLandWildEncounter(curMetatileBehavior) == TRUE)
            {
                if (gWildMonHeaders[headerNum].landMonsInfo)
                {
                    if (prevMetatileBehavior != curMetatileBehavior && !DoGlobalWildEncounterDiceRoll())
                        return 0;

                    if (DoWildEncounterTest(gWildMonHeaders[headerNum].landMonsInfo->encounterRate, 0) == TRUE)
                    {
                        if (TryStartRoamerEncounter() == TRUE)
                        {
                            roamer = &gSaveBlock1.roamer;
                            if (IsWildLevelAllowedByRepel(roamer->level))
                            {
                                BattleSetup_StartRoamerBattle();
                                return 1;
                            }
                        }
                        else
                        {
                            if (DoMassOutbreakEncounterTest() == TRUE && SetUpMassOutbreakEncounter(1) == TRUE)
                            {
                                BattleSetup_StartWildBattle();
                                return 1;
                            }
                            if (GenerateWildMon(gWildMonHeaders[headerNum].landMonsInfo, 0, TRUE) == TRUE)
                            {
                                goto label;
                            }
                        }
                    }
                }
            }
            else if (MetatileBehavior_IsWaterWildEncounter(curMetatileBehavior) == TRUE
             || (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING) && MetatileBehavior_IsBridge(curMetatileBehavior) == TRUE))
            {
                if (gWildMonHeaders[headerNum].waterMonsInfo)
                {
                    if (prevMetatileBehavior != curMetatileBehavior && !DoGlobalWildEncounterDiceRoll())
                        return 0;

                    if (DoWildEncounterTest(gWildMonHeaders[headerNum].waterMonsInfo->encounterRate, 0) == TRUE)
                    {
                        if (TryStartRoamerEncounter() == TRUE)
                        {
                            roamer = &gSaveBlock1.roamer;
                            if (IsWildLevelAllowedByRepel(roamer->level))
                            {
                                BattleSetup_StartRoamerBattle();
                                return 1;
                            }
                        }
                        else
                        {
                            //_08085268
                            if (GenerateWildMon(gWildMonHeaders[headerNum].waterMonsInfo, 1, TRUE) == TRUE)
                            {
                            label:
                                //_0808527A
                                BattleSetup_StartWildBattle();
                                return 1;
                            }
                        }
                    }
                }
            }
        }
    }
    return 0;
}

void ScrSpecial_RockSmashWildEncounter(void)
{
    u16 headerNum = GetCurrentMapWildMonHeader();

    if (headerNum != 0xFFFF)
    {
        const struct WildPokemonInfo *wildPokemonInfo = gWildMonHeaders[headerNum].rockSmashMonsInfo;

        if (wildPokemonInfo == NULL)
        {
            gSpecialVar_Result = 0;
            return;
        }
        else if (DoWildEncounterTest(wildPokemonInfo->encounterRate, 1) == TRUE
         && GenerateWildMon(wildPokemonInfo, 2, TRUE) == TRUE)
        {
            BattleSetup_StartWildBattle();
            gSpecialVar_Result = 1;
            return;
        }
    }
    gSpecialVar_Result = 0;
    return;
}

bool8 SweetScentWildEncounter(void)
{
    s16 x;
    s16 y;
    u16 headerNum;
    const struct WildPokemonInfo *wildPokemonInfo;

    PlayerGetDestCoords(&x, &y);
    if ((headerNum = GetCurrentMapWildMonHeader()) != 0xFFFF)
    {
        if (MetatileBehavior_IsLandWildEncounter(MapGridGetMetatileBehaviorAt(x, y)) == 1)
        {
            wildPokemonInfo = gWildMonHeaders[headerNum].landMonsInfo;
            if (wildPokemonInfo == NULL)
                return FALSE;
            if (TryStartRoamerEncounter() == TRUE)
            {
                BattleSetup_StartRoamerBattle();
                return TRUE;
            }
            if (DoMassOutbreakEncounterTest() == TRUE)
                SetUpMassOutbreakEncounter(FALSE);
            else
                GenerateWildMon(wildPokemonInfo, 0, FALSE);
            BattleSetup_StartWildBattle();
            return TRUE;
        }
        else if (MetatileBehavior_IsWaterWildEncounter(MapGridGetMetatileBehaviorAt(x, y)) == 1)
        {
            wildPokemonInfo = gWildMonHeaders[headerNum].waterMonsInfo;
            if (wildPokemonInfo == NULL)
                return FALSE;
            if (TryStartRoamerEncounter() == TRUE)
            {
                BattleSetup_StartRoamerBattle();
                return TRUE;
            }
            GenerateWildMon(wildPokemonInfo, 1, FALSE);
            BattleSetup_StartWildBattle();
            return TRUE;
        }
    }
    return FALSE;
}

bool8 DoesCurrentMapHaveFishingMons(void)
{
    u16 headerNum = GetCurrentMapWildMonHeader();

    if (headerNum != 0xFFFF && gWildMonHeaders[headerNum].fishingMonsInfo != NULL)
        return TRUE;
    else
        return FALSE;
}

void FishingWildEncounter(u8 rod)
{
    u16 species;

    if (CheckFeebas() == TRUE)
    {
        u8 level = ChooseWildMonLevel(&gWildFeebasRoute119Data);

        species = gWildFeebasRoute119Data.species;
        CreateWildMon(species, level);
    }
    else
    {
        species = GenerateFishingWildMon(
          gWildMonHeaders[GetCurrentMapWildMonHeader()].fishingMonsInfo,
          rod);
    }
    IncrementGameStat(GAME_STAT_FISHING_CAPTURES);
    sub_80BEA50(species);
    BattleSetup_StartWildBattle();
}

u16 GetLocalWildMon(bool8 *isWaterMon)
{
    u16 headerNum;
    const struct WildPokemonInfo *landMonsInfo;
    const struct WildPokemonInfo *waterMonsInfo;

    *isWaterMon = FALSE;
    headerNum = GetCurrentMapWildMonHeader();
    if (headerNum == 0xFFFF)
        return 0;
    landMonsInfo = gWildMonHeaders[headerNum].landMonsInfo;
    waterMonsInfo = gWildMonHeaders[headerNum].waterMonsInfo;
    //Neither
    if (landMonsInfo == NULL && waterMonsInfo == NULL)
        return 0;
    //Land Pokemon
    if (landMonsInfo != NULL && waterMonsInfo == NULL)
        return landMonsInfo->wildPokemon[ChooseWildMonIndex_Land()].species;
    //Water Pokemon
    if (landMonsInfo == NULL && waterMonsInfo != NULL)
    {
        *isWaterMon = TRUE;
        return waterMonsInfo->wildPokemon[ChooseWildMonIndex_Water()].species;
    }
    //Either land or water Pokemon
    if ((Random() % 100) < 80)
        return landMonsInfo->wildPokemon[ChooseWildMonIndex_Land()].species;
    else
    {
        *isWaterMon = TRUE;
        return waterMonsInfo->wildPokemon[ChooseWildMonIndex_Water()].species;
    }
}

u16 GetLocalWaterMon(void)
{
    u16 headerNum = GetCurrentMapWildMonHeader();

    if (headerNum != 0xFFFF)
    {
        const struct WildPokemonInfo *waterMonsInfo = gWildMonHeaders[headerNum].waterMonsInfo;

        if (waterMonsInfo)
            return waterMonsInfo->wildPokemon[ChooseWildMonIndex_Water()].species;
    }
    return 0;
}

bool8 UpdateRepelCounter(void)
{
    u16 steps = VarGet(VAR_REPEL_STEP_COUNT);

    if (steps != 0)
    {
        steps--;
        VarSet(VAR_REPEL_STEP_COUNT, steps);
        if (steps == 0)
        {
            ScriptContext1_SetupScript(S_RepelWoreOff);
            return TRUE;
        }
    }
    return FALSE;
}

static bool8 IsWildLevelAllowedByRepel(u8 wildLevel)
{
    u8 i;

    if (!VarGet(VAR_REPEL_STEP_COUNT))
    {
        return TRUE;
    }
    else
    {
        for (i = 0; i < 6; i++)
        {
            // UB: Too few arguments for function 'GetMonData'
            if (GetMonData(&gPlayerParty[i], MON_DATA_HP) && !GetMonData(&gPlayerParty[i], MON_DATA_IS_EGG))
            {
                u8 ourLevel = GetMonData(&gPlayerParty[i], MON_DATA_LEVEL);

                if (wildLevel < ourLevel)
                    return FALSE;
                else
                    return TRUE;
            }
        }
        return FALSE;
    }
}

static void ApplyFluteEncounterRateMod(u32 *encRate)
{
    if (FlagGet(FLAG_SYS_ENC_UP_ITEM) == TRUE)
        *encRate += *encRate / 2;
    else if (FlagGet(FLAG_SYS_ENC_DOWN_ITEM) == TRUE)
        *encRate = *encRate / 2;
}

static void ApplyCleanseTagEncounterRateMod(u32 *encRate)
{
    // UB: Too few arguments for function 'GetMonData'
    if (GetMonData(&gPlayerParty[0], MON_DATA_HELD_ITEM) == 0xBE)
        *encRate = *encRate * 2 / 3;
}
