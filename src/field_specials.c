#include "global.h"
#include "field_specials.h"
#include "diploma.h"
#include "fieldmap.h"
#include "event_data.h"
#include "field_map_obj.h"
#include "field_message_box.h"
#include "field_camera.h"
#include "field_player_avatar.h"
#include "main.h"
#include "map_constants.h"
#include "rom4.h"
#include "script.h"
#include "songs.h"
#include "string_util.h"
#include "strings.h"
#include "text.h"
#include "wallclock.h"
#include "tv.h"
#include "rtc.h"
#include "link.h"
#include "songs.h"
#include "sound.h"

#if ENGLISH
#define CHAR_DECIMAL_SEPARATOR CHAR_PERIOD
#elif GERMAN
#define CHAR_DECIMAL_SEPARATOR CHAR_COMMA
#endif
static void RecordCyclingRoadResults(u32, u8);

void sub_810D6A4(void) {
    SetMainCallback2(sub_8145D88);
    ScriptContext2_Enable();
}

void sub_810D6B8(void) {
    gMain.savedCallback = c2_exit_to_overworld_2_switch;
    SetMainCallback2(CB2_ViewWallClock);
    ScriptContext2_Enable();
}

void ResetCyclingRoadChallengeData(void) {
    gUnknown_02039250 = 0;
    gUnknown_02039251 = 0;
    gUnknown_02039254 = 0;
}

void BeginCyclingRoadChallenge(void) {
    gUnknown_02039250 = 1;
    gUnknown_02039251 = 0;
    gUnknown_02039254 = gMain.vblankCounter1;
}

u16 GetPlayerAvatarBike(void) {
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_ACRO_BIKE))
    {
        return 1;
    }

    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_MACH_BIKE))
    {
        return 2;
    }

    return 0;
}

void DetermineCyclingRoadResults(u32 arg0, u8 arg1) {
    u8 result;

    if (arg1 <= 99)
    {
        ConvertIntToDecimalStringN(gStringVar1, arg1, STR_CONV_MODE_LEFT_ALIGN, 2);
        StringAppend(gStringVar1, gOtherText_Times);
    }
    else
    {
        StringCopy(gStringVar1, gOtherText_99Times);
    }

    if (arg0 < 3600)
    {
        ConvertIntToDecimalStringN(gStringVar2, arg0 / 60, STR_CONV_MODE_RIGHT_ALIGN, 2);
        gStringVar2[2] = CHAR_DECIMAL_SEPARATOR;
        ConvertIntToDecimalStringN(&gStringVar2[3], ((arg0 % 60) * 100) / 60, STR_CONV_MODE_LEADING_ZEROS, 2);
        StringAppend(gStringVar2, gOtherText_Seconds);
    }
    else
    {
        StringCopy(gStringVar2, gOtherText_1Minute);
    }

    result = 0;
    if (arg1 == 0)
    {
        result = 5;
    }
    else if (arg1 < 4)
    {
        result = 4;
    }
    else if (arg1 < 10)
    {
        result = 3;
    }
    else if (arg1 < 20)
    {
        result = 2;
    }
    else if (arg1 < 100)
    {
        result = 1;
    }

    if (arg0 / 60 <= 10)
    {
        result += 5;
    }
    else if (arg0 / 60 <= 15)
    {
        result += 4;
    }
    else if (arg0 / 60 <= 20)
    {
        result += 3;
    }
    else if (arg0 / 60 <= 40)
    {
        result += 2;
    }
    else if (arg0 / 60 < 60)
    {
        result += 1;
    }


    gScriptResult = result;
}

void FinishCyclingRoadChallenge(void) {
    const u32 time = gMain.vblankCounter1 - gUnknown_02039254;

    DetermineCyclingRoadResults(time, gUnknown_02039251);
    RecordCyclingRoadResults(time, gUnknown_02039251);
}

static void RecordCyclingRoadResults(u32 arg0, u8 arg1) {
    u16 high, low;
    u32 record;

    high = VarGet(0x4028);
    low = VarGet(0x4029);
    record = high + (low << 16);

    if (record > arg0 || record == 0)
    {
        VarSet(0x4028, arg0);
        VarSet(0x4029, arg0 >> 16);
        VarSet(0x4027, arg1);
    }
}

u16 GetRecordedCyclingRoadResults(void) {
    u16 high, low;
    u32 record;

    high = VarGet(0x4028);
    low = VarGet(0x4029);
    record = high + (low << 16);

    if (record == 0)
    {
        return FALSE;
    }

    DetermineCyclingRoadResults(record, VarGet(0x4027));
    return TRUE;
}

void UpdateCyclingRoadState(void) {
    if (gUnknown_020297F0.mapNum == MAP_ID_ROUTE110_SEASIDE_CYCLING_ROAD_NORTH_ENTRANCE && gUnknown_020297F0.mapGroup == MAP_GROUP_ROUTE110_SEASIDE_CYCLING_ROAD_NORTH_ENTRANCE)
    {
        return;
    }

    if (VarGet(0x40a9) == 2 || VarGet(0x40a9) == 3)
    {
        VarSet(0x40a9, 0);
        sav1_set_battle_music_maybe(SE_STOP);
    }
}

void SetSSTidalFlag(void)
{
    FlagSet(SYS_CRUISE_MODE);
    *GetVarPointer(VAR_CRUISE_STEP_COUNT) = 0;
}

void ResetSSTidalFlag(void)
{
    FlagReset(SYS_CRUISE_MODE);
}

bool32 CountSSTidalStep(u16 delta)
{
    if (!FlagGet(SYS_CRUISE_MODE) || (*GetVarPointer(VAR_CRUISE_STEP_COUNT) += delta) <= 0xcc)
    {
        return FALSE;
    }
    return TRUE;
}

u8 GetSSTidalLocation(s8 *mapGroup, s8 *mapNum, s16 *x, s16 *y)
{
    u16 *varCruiseStepCount = GetVarPointer(VAR_CRUISE_STEP_COUNT);
    switch (*GetVarPointer(VAR_PORTHOLE))
    {
        case 1:
        case 8:
            return 1;
        case 3:
        case 9:
            return 4;
        case 4:
        case 5:
            return 2;
        case 6:
        case 10:
            return 3;
        case 2:
            if (*varCruiseStepCount < 60)
            {
                *mapNum = MAP_ID_ROUTE134;
                *x = *varCruiseStepCount + 19;
            }
            else if (*varCruiseStepCount < 140)
            {
                *mapNum = MAP_ID_ROUTE133;
                *x = *varCruiseStepCount - 60;
            }
            else
            {
                *mapNum = MAP_ID_ROUTE132;
                *x = *varCruiseStepCount - 140;
            }
            break;
        case 7:
            if (*varCruiseStepCount < 66)
            {
                *mapNum = MAP_ID_ROUTE132;
                *x = 65 - *varCruiseStepCount;
            }
            else if (*varCruiseStepCount < 146) {
                *mapNum = MAP_ID_ROUTE133;
                *x = 145 - *varCruiseStepCount;
            }
            else
            {
                *mapNum = MAP_ID_ROUTE134;
                *x = 224 - *varCruiseStepCount;
            }
            break;
    }
    *mapGroup = MAP_GROUP_ROUTE132;
    *y = 20;
    return 0;
}

u8 GetLinkPartnerNames(void)
{
    u8 i;
    u8 j = 0;
    u8 myLinkPlayerNumber = sub_8008218();
    u8 nLinkPlayers = sub_800820C();
    for (i=0; i<nLinkPlayers; i++)
    {
        if (myLinkPlayerNumber != i)
        {
            StringCopy(gUnknown_083D1464[j], gLinkPlayers[i].name);
            j++;
        }
    }
    return nLinkPlayers;
}

const u8 gUnknown_083F8358[4] = {7, 9, 8, 10};
const s8 gUnknown_083F835C[4][2] = {
    { 0,  1},
    { 1,  0},
    { 0, -1},
    {-1,  0}
};

void SpawnBerryBlenderLinkPlayerSprites(void)
{
    u8 unknown_083F8358[4];
    u8 unknown_083F835C[4][2];
    u8 myLinkPlayerNumber;
    u8 playerDirectionLowerNybble;
    s16 x;
    s16 y;
    u8 i;
    u8 j;
    u8 rivalAvatarGraphicsId;

    j = 0;
    x = 0;
    y = 0;
    memcpy(unknown_083F8358, gUnknown_083F8358, sizeof gUnknown_083F8358);
    memcpy(unknown_083F835C, gUnknown_083F835C, sizeof gUnknown_083F835C);
    myLinkPlayerNumber = sub_8008218();
    playerDirectionLowerNybble = player_get_direction_lower_nybble();
    switch (playerDirectionLowerNybble)
    {
        case DIR_WEST:
            j = 2;
            x = gSaveBlock1.pos.x - 1;
            y = gSaveBlock1.pos.y;
            break;
        case DIR_NORTH:
            j = 1;
            x = gSaveBlock1.pos.x;
            y = gSaveBlock1.pos.y - 1;
            break;
        case DIR_EAST:
            x = gSaveBlock1.pos.x + 1;
            y = gSaveBlock1.pos.y;
            break;
        case DIR_SOUTH:
            j = 3;
            x = gSaveBlock1.pos.x;
            y = gSaveBlock1.pos.y + 1;
    }
    for (i=0; i<gSpecialVar_0x8004; i++)
    {
        if (myLinkPlayerNumber != i)
        {
            rivalAvatarGraphicsId = GetRivalAvatarGraphicsIdByStateIdAndGender(0, gLinkPlayers[i].gender);
            SpawnSpecialFieldObjectParametrized(rivalAvatarGraphicsId, unknown_083F8358[j], 0xf0 - i, (s8)unknown_083F835C[j][0] + x + 7, (s8)unknown_083F835C[j][1] + y + 7, 0);
            j++;
            if (j == 4)
            {
                j = 0;
            }
        }
    }
}

struct Coords8 {
    u8 x;
    u8 y;
};

const struct Coords8 gUnknown_083F8364[3] = {
    { 7, 16},
    {15, 18},
    {11, 22}
};

void MauvilleGymSpecial1(void)
{
    u8 i;
    for (i=0; i<3; i++)
    {
        if (i == gSpecialVar_0x8004)
        {
            MapGridSetMetatileIdAt(gUnknown_083F8364[i].x, gUnknown_083F8364[i].y, 0x206);
        }
        else
        {
            MapGridSetMetatileIdAt(gUnknown_083F8364[i].x, gUnknown_083F8364[i].y, 0x205);
        }
    }
}

void MauvilleGymSpecial2(void)
{
    int x, y;
    for (y=12; y<24; y++)
    {
        for (x=7; x<16; x++)
        {
            switch (MapGridGetMetatileIdAt(x, y))
            {
                case 0x220:
                    MapGridSetMetatileIdAt(x, y, 0x230);
                    break;
                case 0x221:
                    MapGridSetMetatileIdAt(x, y, 0x231);
                    break;
                case 0x228:
                    MapGridSetMetatileIdAt(x, y, 0x238);
                    break;
                case 0x229:
                    MapGridSetMetatileIdAt(x, y, 0x239);
                    break;
                case 0x230:
                    MapGridSetMetatileIdAt(x, y, 0x220);
                    break;
                case 0x231:
                    MapGridSetMetatileIdAt(x, y, 0x221);
                    break;
                case 0x238:
                    MapGridSetMetatileIdAt(x, y, 0xe28);
                    break;
                case 0x239:
                    MapGridSetMetatileIdAt(x, y, 0xe29);
                    break;
                case 0x222:
                    MapGridSetMetatileIdAt(x, y, 0x232);
                    break;
                case 0x223:
                    MapGridSetMetatileIdAt(x, y, 0x233);
                    break;
                case 0x22a:
                    MapGridSetMetatileIdAt(x, y, 0x23a);
                    break;
                case 0x22b:
                    MapGridSetMetatileIdAt(x, y, 0x23b);
                    break;
                case 0x232:
                    MapGridSetMetatileIdAt(x, y, 0x222);
                    break;
                case 0x233:
                    MapGridSetMetatileIdAt(x, y, 0x223);
                    break;
                case 0x23a:
                    MapGridSetMetatileIdAt(x, y, 0xe2a);
                    break;
                case 0x23b:
                    MapGridSetMetatileIdAt(x, y, 0xe2b);
                    break;
                case 0x240:
                    MapGridSetMetatileIdAt(x, y, 0xe42);
                    break;
                case 0x248:
                    MapGridSetMetatileIdAt(x, y, 0x21a);
                    break;
                case 0x241:
                    MapGridSetMetatileIdAt(x, y, 0xe43);
                    break;
                case 0x249:
                    MapGridSetMetatileIdAt(x, y, 0x21a);
                    break;
                case 0x242:
                    MapGridSetMetatileIdAt(x, y, 0xe40);
                    break;
                case 0x21a:
                    if (MapGridGetMetatileIdAt(x, y - 1) == 0x240)
                    {
                        MapGridSetMetatileIdAt(x, y, 0xe48);
                    }
                    else
                    {
                        MapGridSetMetatileIdAt(x, y, 0xe49);
                    }
                    break;
                case 0x243:
                    MapGridSetMetatileIdAt(x, y, 0xe41);
                    break;
                case 0x251:
                    MapGridSetMetatileIdAt(x, y, 0xe50);
                    break;
                case 0x250:
                    MapGridSetMetatileIdAt(x, y, 0x251);
                    break;
            }
        }
    }
}

void MauvilleGymSpecial3(void)
{
    int i, x, y;
    const struct Coords8 *switchCoords = gUnknown_083F8364;
    for (i=ARRAY_COUNT(gUnknown_083F8364)-1; i>=0; i--)
    {
        MapGridSetMetatileIdAt(switchCoords->x, switchCoords->y, 0x206);
        switchCoords++;
    }
    for (y=12; y<24; y++)
    {
        for (x=7; x<16; x++)
        {
            switch (MapGridGetMetatileIdAt(x, y))
            {
                case 0x220:
                    MapGridSetMetatileIdAt(x, y, 0x230);
                    break;
                case 0x221:
                    MapGridSetMetatileIdAt(x, y, 0x231);
                    break;
                case 0x228:
                    MapGridSetMetatileIdAt(x, y, 0x238);
                    break;
                case 0x229:
                    MapGridSetMetatileIdAt(x, y, 0x239);
                    break;
                case 0x222:
                    MapGridSetMetatileIdAt(x, y, 0x232);
                    break;
                case 0x223:
                    MapGridSetMetatileIdAt(x, y, 0x233);
                    break;
                case 0x22a:
                    MapGridSetMetatileIdAt(x, y, 0x23a);
                    break;
                case 0x22b:
                    MapGridSetMetatileIdAt(x, y, 0x23b);
                    break;
                case 0x240:
                    MapGridSetMetatileIdAt(x, y, 0xe42);
                    break;
                case 0x241:
                    MapGridSetMetatileIdAt(x, y, 0xe43);
                    break;
                case 0x248:
                case 0x249:
                    MapGridSetMetatileIdAt(x, y, 0x21a);
                    break;
                case 0x250:
                    MapGridSetMetatileIdAt(x, y, 0x251);
                    break;
            }
        }
    }
}

static void Task_PetalburgGym(u8);
static void PetalburgGymFunc(u8, u16);
const u8 gUnknown_083F8370[] = {0, 1, 1, 1, 1};
const u16 gUnknown_083F8376[] = {0x218, 0x219, 0x21a, 0x21b, 0x21c};

void PetalburgGymSpecial1(void)
{
    gUnknown_02039258 = 0;
    gUnknown_02039259 = 0;
    PlaySE(SE_KI_GASYAN);
    CreateTask(Task_PetalburgGym, 8);
}

static void Task_PetalburgGym(u8 taskId)
{
    if (gUnknown_083F8370[gUnknown_02039259] == gUnknown_02039258)
    {
        PetalburgGymFunc(gSpecialVar_0x8004, gUnknown_083F8376[gUnknown_02039259]);
        gUnknown_02039258 = 0;
        if ((++gUnknown_02039259) == 5)
        {
            DestroyTask(taskId);
            EnableBothScriptContexts();
        }
    }
    else
    {
        gUnknown_02039258++;
    }
}

static void PetalburgGymFunc(u8 a0, u16 a1)
{
    u16 x[4];
    u16 y[4];
    u8 i;
    u8 nDoors;
    nDoors = 0;
    switch (a0)
    {
        case 1:
            nDoors = 2;
            x[0] = 1;
            x[1] = 7;
            y[0] = 0x68;
            y[1] = 0x68;
            break;
        case 2:
            nDoors = 2;
            x[0] = 1;
            x[1] = 7;
            y[0] = 0x4e;
            y[1] = 0x4e;
            break;
        case 3:
            nDoors = 2;
            x[0] = 1;
            x[1] = 7;
            y[0] = 0x5b;
            y[1] = 0x5b;
            break;
        case 4:
            nDoors = 1;
            x[0] = 7;
            y[0] = 0x27;
            break;
        case 5:
            nDoors = 2;
            x[0] = 1;
            x[1] = 7;
            y[0] = 0x34;
            y[1] = 0x34;
            break;
        case 6:
            nDoors = 1;
            x[0] = 1;
            y[0] = 0x41;
            break;
        case 7:
            nDoors = 1;
            x[0] = 7;
            y[0] = 0xd;
            break;
        case 8:
            nDoors = 1;
            x[0] = 1;
            y[0] = 0x1a;
            break;
    }
    for (i=0; i<nDoors; i++)
    {
        MapGridSetMetatileIdAt(x[i] + 7, y[i] + 7, a1 | 0xc00);
        MapGridSetMetatileIdAt(x[i] + 7, y[i] + 8, (a1 + 8) | 0xc00);
    }
    DrawWholeMapView();
}

void PetalburgGymSpecial2(void)
{
    PetalburgGymFunc(gSpecialVar_0x8004, gUnknown_083F8376[4]);
}

void ShowFieldMessageStringVar4(void)
{
    ShowFieldMessage(gStringVar4);
}

void StorePlayerCoordsInVars(void)
{
    gSpecialVar_0x8004 = gSaveBlock1.pos.x;
    gSpecialVar_0x8005 = gSaveBlock1.pos.y;
}

u8 GetPlayerTrainerIdOnesDigit(void)
{
    return (u16)((gSaveBlock2.playerTrainerId[1] << 8) | gSaveBlock2.playerTrainerId[0]) % 10;
}

void GetPlayerBigGuyGirlString(void)
{
    if (gSaveBlock2.playerGender == MALE)
    {
        StringCopy(gStringVar1, gOtherText_BigGuy);
    }
    else
    {
        StringCopy(gStringVar1, gOtherText_BigGirl);
    }
}

void GetRivalSonDaughterString(void)
{
    if (gSaveBlock2.playerGender == MALE)
    {
        StringCopy(gStringVar1, gOtherText_Daughter);
    }
    else
    {
        StringCopy(gStringVar1, gOtherText_Son);
    }
}

u8 sub_810E300(void)
{
    return gUnknown_02024D26;
}

void CableCarWarp(void)
{
    if (gSpecialVar_0x8004 != 0)
    {
        warp1_set(MAP_GROUP_ROUTE112_CABLE_CAR_STATION, MAP_ID_ROUTE112_CABLE_CAR_STATION, -1, 6, 4);
    }
    else
    {
        warp1_set(MAP_GROUP_MT_CHIMNEY_CABLE_CAR_STATION, MAP_ID_MT_CHIMNEY_CABLE_CAR_STATION, -1, 6, 4);
    }
}

void SetFlagInVar(void)
{
    FlagSet(gSpecialVar_0x8004);
}

u16 GetWeekCount(void)
{
    u16 weekCount = gLocalTime.days / 7;
    if (weekCount > 9999)
    {
        weekCount = 9999;
    }
    return weekCount;
}

u8 GetLeadMonFriendshipScore(void)
{
    struct Pokemon *pokemon = &gPlayerParty[GetLeadMonIndex()];
    if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) == 255)
    {
        return 6;
    }
    if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) >= 200)
    {
        return 5;
    }
    if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) >= 150)
    {
        return 4;
    }
    if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) >= 100)
    {
        return 3;
    }
    if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) >= 50)
    {
        return 2;
    }
    if (GetMonData(pokemon, MON_DATA_FRIENDSHIP) >= 1)
    {
        return 1;
    }
    return 0;
}
