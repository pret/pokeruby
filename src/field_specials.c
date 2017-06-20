#include "global.h"
#include "field_specials.h"
#include "diploma.h"
#include "fieldmap.h"
#include "event_data.h"
#include "field_map_obj.h"
#include "field_region_map.h"
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
#include "menu.h"
#include "menu_helpers.h"

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
    u16 high = VarGet(0x4028);
    u16 low = VarGet(0x4029);
    u32 record = high + (low << 16);

    if (record > arg0 || record == 0)
    {
        VarSet(0x4028, arg0);
        VarSet(0x4029, arg0 >> 16);
        VarSet(0x4027, arg1);
    }
}

u16 GetRecordedCyclingRoadResults(void) {
    u16 high = VarGet(0x4028);
    u16 low = VarGet(0x4029);
    u32 record = high + (low << 16);

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
    u8 rivalAvatarGraphicsId;
    u8 i;
    u8 j = 0;
    s16 x = 0;
    s16 y = 0;

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
    u8 nDoors = 0;
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

void CB2_FieldShowRegionMap(void)
{
    FieldInitRegionMap(c2_exit_to_overworld_1_continue_scripts_restart_music);
}

void FieldShowRegionMap(void)
{
    SetMainCallback2(CB2_FieldShowRegionMap);
}

static void Task_PCTurnOnEffect(u8);
static void PCTurnOffEffect_0(struct Task *);
static void PCTurnOffEffect_1(s16, s8, s8);
static void PCTurnOffEffect(void);

void DoPCTurnOnEffect(void)
{
    if (FuncIsActiveTask(Task_PCTurnOnEffect) != TRUE)
    {
        u8 taskId = CreateTask(Task_PCTurnOnEffect, 8);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = taskId;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[3] = 0;
        gTasks[taskId].data[4] = 0;
    }
}

static void Task_PCTurnOnEffect(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    if (task->data[0] == 0)
    {
        PCTurnOffEffect_0(task);
    }
}

static void PCTurnOffEffect_0(struct Task *task)
{
    u8 playerDirectionLowerNybble;
    s8 dx = 0;
    s8 dy = 0;
    if (task->data[3] == 6)
    {
        task->data[3] = 0;
        playerDirectionLowerNybble = player_get_direction_lower_nybble();
        switch (playerDirectionLowerNybble)
        {
            case DIR_NORTH:
                dx = 0;
                dy = -1;
                break;
            case DIR_WEST:
                dx = -1;
                dy = -1;
                break;
            case DIR_EAST:
                dx = 1;
                dy = -1;
                break;
        }
        PCTurnOffEffect_1(task->data[4], dx, dy);
        DrawWholeMapView();
        task->data[4] ^= 1;
        if ((++task->data[2]) == 5)
        {
            DestroyTask(task->data[1]);
        }
    }
    task->data[3]++;
}

static void PCTurnOffEffect_1(s16 flag, s8 dx, s8 dy)
{
    u16 tileId = 0;
    if (flag != 0)
    {
        if (gSpecialVar_0x8004 == 0)
        {
            tileId = 0x4;
        }
        else if (gSpecialVar_0x8004 == 1)
        {
            tileId = 0x25a;
        }
        else if (gSpecialVar_0x8004 == 2)
        {
            tileId = 0x259;
        }
    }
    else
    {
        if (gSpecialVar_0x8004 == 0)
        {
            tileId = 0x5;
        }
        else if (gSpecialVar_0x8004 == 1)
        {
            tileId = 0x27f;
        }
        else if (gSpecialVar_0x8004 == 2)
        {
            tileId = 0x27e;
        }
    }
    MapGridSetMetatileIdAt(gSaveBlock1.pos.x + dx + 7, gSaveBlock1.pos.y + dy + 7, tileId | 0xc00);
}

void DoPCTurnOffEffect(void)
{
    PCTurnOffEffect();
}

static void PCTurnOffEffect(void)
{
    s8 dx = 0;
    s8 dy = 0;
    u16 tileId = 0;
    u8 playerDirectionLowerNybble = player_get_direction_lower_nybble();
    switch (playerDirectionLowerNybble)
    {
        case DIR_NORTH:
            dx = 0;
            dy = -1;
            break;
        case DIR_WEST:
            dx = -1;
            dy = -1;
            break;
        case DIR_EAST:
            dx = 1;
            dy = -1;
            break;
    }
    if (gSpecialVar_0x8004 == 0)
    {
        tileId = 0x4;
    }
    else if (gSpecialVar_0x8004 == 1)
    {
        tileId = 0x25a;
    }
    else if (gSpecialVar_0x8004 == 2)
    {
        tileId = 0x259;
    }
    MapGridSetMetatileIdAt(gSaveBlock1.pos.x + dx + 7, gSaveBlock1.pos.y + dy + 7, tileId | 0xc00);
    DrawWholeMapView();
}

static void Task_LotteryCornerComputerEffect(u8);
static void LotteryCornerComputerEffect(struct Task *);

void DoLotteryCornerComputerEffect(void)
{
    if (FuncIsActiveTask(Task_LotteryCornerComputerEffect) != TRUE)
    {
        u8 taskId = CreateTask(Task_LotteryCornerComputerEffect, 8);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = taskId;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[3] = 0;
        gTasks[taskId].data[4] = 0;
    }
}

static void Task_LotteryCornerComputerEffect(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    if (task->data[0] == 0)
    {
        LotteryCornerComputerEffect(task);
    }
}

static void LotteryCornerComputerEffect(struct Task *task)
{
    if (task->data[3] == 6)
    {
        task->data[3] = 0;
        if (task->data[4] != 0)
        {
            MapGridSetMetatileIdAt(18, 8, 0xe9d);
            MapGridSetMetatileIdAt(18, 9, 0xea5);
        }
        else
        {
            MapGridSetMetatileIdAt(18, 8, 0xe58);
            MapGridSetMetatileIdAt(18, 9, 0xe60);
        }
        DrawWholeMapView();
        task->data[4] ^= 1;
        if ((++task->data[2]) == 5)
        {
            DestroyTask(task->data[1]);
        }
    }
    task->data[3]++;
}

void EndLotteryCornerComputerEffect(void)
{
    MapGridSetMetatileIdAt(18, 8, 0xe9d);
    MapGridSetMetatileIdAt(18, 9, 0xea5);
    DrawWholeMapView();
}

static void sub_810E874(void);
void sub_810E944(void);
void sub_810E984(u8);
void sub_810EAC8(u8, u8);
void sub_810EBEC(void);
void sub_810EC9C(u8);
void sub_810ECD4(void);
void sub_810EEDC(void);

const u8 *const gUnknown_083F8380[] = {
    OtherText_1F,
    OtherText_2F,
    OtherText_3F,
    OtherText_4F,
    OtherText_5F,
    OtherText_6F,
    OtherText_7F,
    OtherText_8F,
    OtherText_9F,
    OtherText_10F,
    OtherText_11F,
    OtherText_B1F,
    OtherText_B2F,
    OtherText_B3F,
    OtherText_B4F,
    OtherText_Rooftop
};

void SetDepartmentStoreFloorVar(void)
{
    u8 deptStoreFloor;
    switch (gSaveBlock1.warp2.mapNum)
    {
        case MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_1F:
            deptStoreFloor = 0;
            break;
        case MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_2F:
            deptStoreFloor = 1;
            break;
        case MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_3F:
            deptStoreFloor = 2;
            break;
        case MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_4F:
            deptStoreFloor = 3;
            break;
        case MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_5F:
            deptStoreFloor = 4;
            break;
        case MAP_ID_LILYCOVE_CITY_DEPARTMENT_STORE_ROOFTOP:
            deptStoreFloor = 15;
            break;
        default:
            deptStoreFloor = 0;
            break;
    }
    VarSet(VAR_DEPT_STORE_FLOOR, deptStoreFloor);
}

void ScriptAddElevatorMenuItem(u8 a0, u8 a1, u8 a2, u8 a3)
{
    u8 i;
    if (gSpecialVar_0x8004 == 0)
    {
        for (i=0; i<20; i++)
        {
            gUnknown_03000760[i].var0 = 16;
        }
    }
    gUnknown_03000760[gSpecialVar_0x8004].var0 = a0;
    gUnknown_03000760[gSpecialVar_0x8004].var1 = a1;
    gUnknown_03000760[gSpecialVar_0x8004].var2 = a2;
    gUnknown_03000760[gSpecialVar_0x8004].var3 = a3;
    gSpecialVar_0x8004++;
}

void ScriptShowElevatorMenu(void)
{
    u8 i = 0;
    gUnknown_0203925A = 0;
    gUnknown_0203925B = 0;
    ScriptAddElevatorMenuItem(16, 0, 0, 0);
    while (gUnknown_03000760[i].var0 != 16)
    {
        gUnknown_0203925A++;
        i++;
    }
    sub_810E874();
}

static void sub_810E874(void)
{
    u8 i;
    ScriptContext2_Enable();
    if (gUnknown_0203925A > 5)
    {
        MenuDrawTextWindow(0, 0, 8, 11);
        InitMenu(0, 1, 1, 5, 0, 7);
        gUnknown_0203925C = 0;
        sub_80F944C();
        LoadScrollIndicatorPalette();
        sub_810ECD4();
    }
    else
    {
        MenuDrawTextWindow(0, 0, 8, 2 * gUnknown_0203925A + 1);
        InitMenu(0, 1, 1, gUnknown_0203925A, 0, 7);
    }
    for (i = 0; i < 5 && gUnknown_03000760[i].var0 != 16; i ++)
    {
        MenuPrint(gUnknown_083F8380[gUnknown_03000760[i].var0], 1, 2 * i + 1);
    }
    sub_810E944();
    CreateTask(sub_810E984, 8);
}

void sub_810E944(void)
{
    MenuDrawTextWindow(20, 0, 29, 5);
    sub_8072BD8(gOtherText_NowOn, 21, 1, 64);
    sub_8072BD8(gUnknown_083F8380[gSpecialVar_0x8005], 21, 3, 64);
}

void sub_810E984(u8 taskId)
{
    u8 curMenuPos;
    if (gMain.newKeys == DPAD_UP && gUnknown_0203925B != 0)
    {
        gUnknown_0203925B--;
        curMenuPos = GetMenuCursorPos();
        MoveMenuCursorNoWrap(-1);
        sub_810EAC8(curMenuPos, DPAD_UP);
    }
    if (gMain.newKeys == DPAD_DOWN && gUnknown_0203925B != gUnknown_0203925A - 1)
    {
        gUnknown_0203925B++;
        curMenuPos = GetMenuCursorPos();
        MoveMenuCursorNoWrap(+1);
        sub_810EAC8(curMenuPos, DPAD_DOWN);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        saved_warp2_set_2(0, gUnknown_03000760[gUnknown_0203925B].var1, gUnknown_03000760[gUnknown_0203925B].var2, -1, 2, 1);
        if (gSpecialVar_0x8005 == gUnknown_0203925B)
        {
            gScriptResult = 0;
            PlaySE(SE_SELECT);
            MenuZeroFillWindowRect(0, 0, 29, 12);
            sub_810EC9C(taskId);
        }
        else
        {
            gScriptResult = 1;
            gSpecialVar_0x8005 = gUnknown_0203925B;
            sub_810EBEC();
            FieldObjectTurnByLocalIdAndMap(gScriptLastTalked, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, DIR_SOUTH);
            sub_810EEDC();
            MenuZeroFillScreen();
            DestroyTask(taskId);
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        gScriptResult = 0;
        PlaySE(SE_SELECT);
        sub_810EEDC();
        MenuZeroFillWindowRect(0, 0, 29, 12);
        sub_810EC9C(taskId);
    }
}
