#include "global.h"
#include "debug.h"
#include "roamer.h"
#include "pokemon.h"
#include "random.h"
#include "region_map.h"
#include "constants/species.h"

enum
{
    MAP_GRP = 0, // map group
    MAP_NUM = 1, // map number
};

EWRAM_DATA static u8 sLocationHistory[3][2] = {0};
EWRAM_DATA static u8 sRoamerLocation[2] = {0};

static const u8 sRoamerLocations[][6] =
{
    { 0x19, 0x1A, 0x20, 0x21, 0x31, 0xFF },
    { 0x1A, 0x19, 0x20, 0x21, 0xFF, 0xFF },
    { 0x20, 0x1A, 0x19, 0x21, 0xFF, 0xFF },
    { 0x21, 0x20, 0x19, 0x1A, 0x22, 0x26 },
    { 0x22, 0x21, 0x23, 0xFF, 0xFF, 0xFF },
    { 0x23, 0x22, 0x24, 0xFF, 0xFF, 0xFF },
    { 0x24, 0x23, 0x25, 0x26, 0xFF, 0xFF },
    { 0x25, 0x24, 0x26, 0xFF, 0xFF, 0xFF },
    { 0x26, 0x25, 0x21, 0xFF, 0xFF, 0xFF },
    { 0x27, 0x24, 0x28, 0x29, 0xFF, 0xFF },
    { 0x28, 0x27, 0x2A, 0xFF, 0xFF, 0xFF },
    { 0x29, 0x27, 0x2A, 0xFF, 0xFF, 0xFF },
    { 0x2A, 0x28, 0x29, 0x2B, 0xFF, 0xFF },
    { 0x2B, 0x2A, 0x2C, 0xFF, 0xFF, 0xFF },
    { 0x2C, 0x2B, 0x2D, 0xFF, 0xFF, 0xFF },
    { 0x2D, 0x2C, 0x2E, 0xFF, 0xFF, 0xFF },
    { 0x2E, 0x2D, 0x2F, 0xFF, 0xFF, 0xFF },
    { 0x2F, 0x2E, 0x30, 0xFF, 0xFF, 0xFF },
    { 0x30, 0x2F, 0x31, 0xFF, 0xFF, 0xFF },
    { 0x31, 0x30, 0x19, 0xFF, 0xFF, 0xFF },
    { 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF },
};

void ClearRoamerData(void)
{
    memset(&gSaveBlock1.roamer, 0, sizeof(gSaveBlock1.roamer));
}

void ClearRoamerLocationData(void)
{
    u8 i;

    for (i = 0; i < 3; i++)
    {
        sLocationHistory[i][MAP_GRP] = 0;
        sLocationHistory[i][MAP_NUM] = 0;
    }

    sRoamerLocation[MAP_GRP] = 0;
    sRoamerLocation[MAP_NUM] = 0;
}

void CreateInitialRoamerMon(void)
{
    struct Roamer *roamer;
    CreateMon(&gEnemyParty[0], ROAMER_SPECIES, 40, 0x20, 0, 0, 0, 0);
    roamer = &gSaveBlock1.roamer;
    roamer->species = ROAMER_SPECIES;
    roamer->level = 40;
    roamer->status = 0;
    roamer->active = TRUE;
    roamer->ivs = GetMonData(&gEnemyParty[0], MON_DATA_IVS);
    roamer->personality = GetMonData(&gEnemyParty[0], MON_DATA_PERSONALITY);
    roamer->hp = GetMonData(&gEnemyParty[0], MON_DATA_MAX_HP);
    roamer->cool = GetMonData(&gEnemyParty[0], MON_DATA_COOL);
    roamer->beauty = GetMonData(&gEnemyParty[0], MON_DATA_BEAUTY);
    roamer->cute = GetMonData(&gEnemyParty[0], MON_DATA_CUTE);
    roamer->smart = GetMonData(&gEnemyParty[0], MON_DATA_SMART);
    roamer->tough = GetMonData(&gEnemyParty[0], MON_DATA_TOUGH);
    sRoamerLocation[MAP_GRP] = 0;
    sRoamerLocation[MAP_NUM] = sRoamerLocations[Random() % 20][0];
}

void InitRoamer(void)
{
    ClearRoamerData();
    ClearRoamerLocationData();
    CreateInitialRoamerMon();
}

void UpdateLocationHistoryForRoamer(void)
{
    sLocationHistory[2][MAP_GRP] = sLocationHistory[1][MAP_GRP];
    sLocationHistory[2][MAP_NUM] = sLocationHistory[1][MAP_NUM];

    sLocationHistory[1][MAP_GRP] = sLocationHistory[0][MAP_GRP];
    sLocationHistory[1][MAP_NUM] = sLocationHistory[0][MAP_NUM];

    sLocationHistory[0][MAP_GRP] = gSaveBlock1.location.mapGroup;
    sLocationHistory[0][MAP_NUM] = gSaveBlock1.location.mapNum;
}

void RoamerMoveToOtherLocationSet(void)
{
    u8 val = 0;
    struct Roamer *roamer = &gSaveBlock1.roamer;

    if (!roamer->active)
        return;

    sRoamerLocation[MAP_GRP] = val;

    while (1)
    {
        val = sRoamerLocations[Random() % 20][0];
        if (sRoamerLocation[MAP_NUM] != val)
        {
            sRoamerLocation[MAP_NUM] = val;
            return;
        }
    }
}

void RoamerMove(void)
{
    u8 locSet = 0;

    if ((Random() % 16) == 0)
    {
        RoamerMoveToOtherLocationSet();
    }
    else
    {
        struct Roamer *roamer = &gSaveBlock1.roamer;

        if (!roamer->active)
            return;

        while (locSet < 20)
        {
            if (sRoamerLocation[MAP_NUM] == sRoamerLocations[locSet][0])
            {
                u8 mapNum;
                while (1)
                {
                    mapNum = sRoamerLocations[locSet][(Random() % 5) + 1];
                    if (!(sLocationHistory[2][MAP_GRP] == 0 && sLocationHistory[2][MAP_NUM] == mapNum) && mapNum != 0xFF)
                        break;
                }
                sRoamerLocation[MAP_NUM] = mapNum;
                return;
            }
            locSet++;
        }
    }
}

bool8 IsRoamerAt(u8 mapGroup, u8 mapNum)
{
    struct Roamer *roamer = &gSaveBlock1.roamer;

    if (roamer->active && mapGroup == sRoamerLocation[MAP_GRP] && mapNum == sRoamerLocation[MAP_NUM])
        return TRUE;
    else
        return FALSE;
}

void CreateRoamerMonInstance(void)
{
    struct Pokemon *mon = &gEnemyParty[0];
    struct Roamer *roamer = &gSaveBlock1.roamer;
    CreateMonWithIVsPersonality(mon, roamer->species, roamer->level, roamer->ivs, roamer->personality);
    SetMonData(mon, MON_DATA_STATUS, &roamer->status);
    SetMonData(mon, MON_DATA_HP, &roamer->hp);
    SetMonData(mon, MON_DATA_COOL, &roamer->cool);
    SetMonData(mon, MON_DATA_BEAUTY, &roamer->beauty);
    SetMonData(mon, MON_DATA_CUTE, &roamer->cute);
    SetMonData(mon, MON_DATA_SMART, &roamer->smart);
    SetMonData(mon, MON_DATA_TOUGH, &roamer->tough);
}

bool8 TryStartRoamerEncounter(void)
{
    if (IsRoamerAt(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum) == TRUE && (Random() % 4) == 0)
    {
        CreateRoamerMonInstance();
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

void UpdateRoamerHPStatus(struct Pokemon *mon)
{
    struct Roamer *roamer;
    u16 hp;
    u8 status;

    hp = GetMonData(mon, MON_DATA_HP);

    roamer = &gSaveBlock1.roamer;
    roamer->hp = hp;

    status = GetMonData(mon, MON_DATA_STATUS);

    roamer->status = status;

    RoamerMoveToOtherLocationSet();
}

void SetRoamerInactive(void)
{
    struct Roamer *roamer = &gSaveBlock1.roamer;
    roamer->active = FALSE;
}

void GetRoamerLocation(u8 *mapGroup, u8 *mapNum)
{
    *mapGroup = sRoamerLocation[MAP_GRP];
    *mapNum = sRoamerLocation[MAP_NUM];
}

#if DEBUG
void Debug_CreateRoamer(void)
{
    if (gSaveBlock1.location.mapGroup == 0)
    {
        CreateInitialRoamerMon();
        sRoamerLocation[0] = 0;
        sRoamerLocation[1] = gSaveBlock1.location.mapNum;
    }
}

void Debug_GetRoamerLocation(u8* str)
{
    GetMapSectionName(str, sRoamerLocation[1], 0);
}
#endif
