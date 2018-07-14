#include "global.h"
#include "field_specials.h"
#include "diploma.h"
#include "fieldmap.h"
#include "event_data.h"
#include "battle_tower.h"
#include "event_object_movement.h"
#include "region_map.h"
#include "field_region_map.h"
#include "field_message_box.h"
#include "field_camera.h"
#include "field_player_avatar.h"
#include "main.h"
#include "constants/maps.h"
#include "overworld.h"
#include "script.h"
#include "constants/songs.h"
#include "string_util.h"
#include "strings.h"
#include "pokeblock.h"
#include "text.h"
#include "wallclock.h"
#include "tv.h"
#include "rtc.h"
#include "link.h"
#include "constants/songs.h"
#include "sound.h"
#include "menu.h"
#include "starter_choose.h"
#include "menu_helpers.h"
#include "battle_tower.h"
#include "field_weather.h"
#include "pokemon_summary_screen.h"
#include "random.h"
#include "constants/abilities.h"
#include "constants/event_object_movement_constants.h"
#include "constants/moves.h"
#include "constants/species.h"
#include "constants/weather.h"

#if ENGLISH
#define CHAR_DECIMAL_SEPARATOR CHAR_PERIOD
#elif GERMAN
#define CHAR_DECIMAL_SEPARATOR CHAR_COMMA
#endif

extern struct WarpData gLastUsedWarp;
extern u8 gBattleOutcome;
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u16 gSpecialVar_Result;

extern u8 *const gUnknown_083D1464[3];

EWRAM_DATA bool8 gBikeCyclingChallenge = FALSE;
EWRAM_DATA u8 gBikeCollisions = 0;
EWRAM_DATA u32 gBikeCyclingTimer = 0;
EWRAM_DATA u8 gUnknown_02039258 = 0;
EWRAM_DATA u8 gPetalburgGymSlidingDoorIndex = 0;
EWRAM_DATA u8 gUnknown_0203925A = 0;
EWRAM_DATA u8 gUnknown_0203925B = 0;
EWRAM_DATA u8 gUnknown_0203925C = 0;

static void RecordCyclingRoadResults(u32, u8);

static struct ElevatorMenu gUnknown_03000760[20];

void ScrSpecial_ShowDiploma(void)
{
    SetMainCallback2(CB2_ShowDiploma);
    ScriptContext2_Enable();
}

void ScrSpecial_ViewWallClock(void)
{
    gMain.savedCallback = c2_exit_to_overworld_2_switch;
    SetMainCallback2(CB2_ViewWallClock);
    ScriptContext2_Enable();
}

void ResetCyclingRoadChallengeData(void)
{
    gBikeCyclingChallenge = FALSE;
    gBikeCollisions = 0;
    gBikeCyclingTimer = 0;
}

void ScrSpecial_BeginCyclingRoadChallenge(void)
{
    gBikeCyclingChallenge = TRUE;
    gBikeCollisions = 0;
    gBikeCyclingTimer = gMain.vblankCounter1;
}

u16 GetPlayerAvatarBike(void)
{
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_ACRO_BIKE))
        return 1;
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_MACH_BIKE))
        return 2;
    return 0;
}

static void DetermineCyclingRoadResults(u32 numFrames, u8 numBikeCollisions)
{
    u8 result;

    if (numBikeCollisions <= 99)
    {
        ConvertIntToDecimalStringN(gStringVar1, numBikeCollisions, STR_CONV_MODE_LEFT_ALIGN, 2);
        StringAppend(gStringVar1, gOtherText_Times);
    }
    else
    {
        StringCopy(gStringVar1, gOtherText_99Times);
    }

    if (numFrames < 3600)
    {
        ConvertIntToDecimalStringN(gStringVar2, numFrames / 60, STR_CONV_MODE_RIGHT_ALIGN, 2);
        gStringVar2[2] = CHAR_DECIMAL_SEPARATOR;
        ConvertIntToDecimalStringN(&gStringVar2[3], ((numFrames % 60) * 100) / 60, STR_CONV_MODE_LEADING_ZEROS, 2);
        StringAppend(gStringVar2, gOtherText_Seconds);
    }
    else
    {
        StringCopy(gStringVar2, gOtherText_1Minute);
    }

    result = 0;
    if (numBikeCollisions == 0)
    {
        result = 5;
    }
    else if (numBikeCollisions < 4)
    {
        result = 4;
    }
    else if (numBikeCollisions < 10)
    {
        result = 3;
    }
    else if (numBikeCollisions < 20)
    {
        result = 2;
    }
    else if (numBikeCollisions < 100)
    {
        result = 1;
    }

    if (numFrames / 60 <= 10)
    {
        result += 5;
    }
    else if (numFrames / 60 <= 15)
    {
        result += 4;
    }
    else if (numFrames / 60 <= 20)
    {
        result += 3;
    }
    else if (numFrames / 60 <= 40)
    {
        result += 2;
    }
    else if (numFrames / 60 < 60)
    {
        result += 1;
    }


    gSpecialVar_Result = result;
}

void FinishCyclingRoadChallenge(void) {
    const u32 numFrames = gMain.vblankCounter1 - gBikeCyclingTimer;

    DetermineCyclingRoadResults(numFrames, gBikeCollisions);
    RecordCyclingRoadResults(numFrames, gBikeCollisions);
}

static void RecordCyclingRoadResults(u32 numFrames, u8 numBikeCollisions) {
    u16 low = VarGet(VAR_CYCLING_ROAD_RECORD_TIME_L);
    u16 high = VarGet(VAR_CYCLING_ROAD_RECORD_TIME_H);
    u32 framesRecord = low + (high << 16);

    if (framesRecord > numFrames || framesRecord == 0)
    {
        VarSet(VAR_CYCLING_ROAD_RECORD_TIME_L, numFrames);
        VarSet(VAR_CYCLING_ROAD_RECORD_TIME_H, numFrames >> 16);
        VarSet(VAR_CYCLING_ROAD_RECORD_COLLISIONS, numBikeCollisions);
    }
}

u16 GetRecordedCyclingRoadResults(void) {
    u16 low = VarGet(VAR_CYCLING_ROAD_RECORD_TIME_L);
    u16 high = VarGet(VAR_CYCLING_ROAD_RECORD_TIME_H);
    u32 framesRecord = low + (high << 16);

    if (framesRecord == 0)
    {
        return FALSE;
    }

    DetermineCyclingRoadResults(framesRecord, VarGet(VAR_CYCLING_ROAD_RECORD_COLLISIONS));
    return TRUE;
}

void UpdateCyclingRoadState(void) {
    if (gLastUsedWarp.mapNum == MAP_NUM(ROUTE110_SEASIDE_CYCLING_ROAD_NORTH_ENTRANCE) && gLastUsedWarp.mapGroup == MAP_GROUP(ROUTE110_SEASIDE_CYCLING_ROAD_NORTH_ENTRANCE))
    {
        return;
    }

    if (VarGet(VAR_CYCLING_CHALLENGE_STATE) == 2 || VarGet(VAR_CYCLING_CHALLENGE_STATE) == 3)
    {
        VarSet(VAR_CYCLING_CHALLENGE_STATE, 0);
        Overworld_SetSavedMusic(SE_STOP);
    }
}

void SetSSTidalFlag(void)
{
    FlagSet(FLAG_SYS_CRUISE_MODE);
    *GetVarPointer(VAR_CRUISE_STEP_COUNT) = 0;
}

void ResetSSTidalFlag(void)
{
    FlagClear(FLAG_SYS_CRUISE_MODE);
}

bool32 CountSSTidalStep(u16 delta)
{
    if (!FlagGet(FLAG_SYS_CRUISE_MODE) || (*GetVarPointer(VAR_CRUISE_STEP_COUNT) += delta) <= 0xcc)
    {
        return FALSE;
    }
    return TRUE;
}

u8 GetSSTidalLocation(s8 *mapGroup, s8 *mapNum, s16 *x, s16 *y)
{
    u16 *varCruiseStepCount = GetVarPointer(VAR_CRUISE_STEP_COUNT);
    switch (*GetVarPointer(VAR_PORTHOLE_STATE))
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
                *mapNum = MAP_NUM(ROUTE134);
                *x = *varCruiseStepCount + 19;
            }
            else if (*varCruiseStepCount < 140)
            {
                *mapNum = MAP_NUM(ROUTE133);
                *x = *varCruiseStepCount - 60;
            }
            else
            {
                *mapNum = MAP_NUM(ROUTE132);
                *x = *varCruiseStepCount - 140;
            }
            break;
        case 7:
            if (*varCruiseStepCount < 66)
            {
                *mapNum = MAP_NUM(ROUTE132);
                *x = 65 - *varCruiseStepCount;
            }
            else if (*varCruiseStepCount < 146) {
                *mapNum = MAP_NUM(ROUTE133);
                *x = 145 - *varCruiseStepCount;
            }
            else
            {
                *mapNum = MAP_NUM(ROUTE134);
                *x = 224 - *varCruiseStepCount;
            }
            break;
    }
    *mapGroup = MAP_GROUP(ROUTE132);
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

void SpawnBerryBlenderLinkPlayerSprites(void)
{
    u8 j = 0;
    s16 x = 0;
    s16 y = 0;
    u8 facingDirectionMovementTypes[] = {
        MOVEMENT_TYPE_FACE_UP,
        MOVEMENT_TYPE_FACE_LEFT,
        MOVEMENT_TYPE_FACE_DOWN,
        MOVEMENT_TYPE_FACE_RIGHT,
    };
    s8 unknown_083F835C[][2] = {
        { 0,  1},
        { 1,  0},
        { 0, -1},
        {-1,  0}
    };
    u8 myLinkPlayerNumber;
    u8 playerDirectionLowerNybble;
    u8 rivalAvatarGraphicsId;
    u8 i;

    myLinkPlayerNumber = sub_8008218();
    playerDirectionLowerNybble = GetPlayerFacingDirection();
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
            rivalAvatarGraphicsId = GetRivalAvatarGraphicsIdByStateIdAndGender(PLAYER_AVATAR_STATE_NORMAL, gLinkPlayers[i].gender);
            SpawnSpecialEventObjectParametrized(rivalAvatarGraphicsId, facingDirectionMovementTypes[j], 0xf0 - i, unknown_083F835C[j][0] + x + 7, unknown_083F835C[j][1] + y + 7, 0);
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

static void Task_SlideOpenPetalburgGymDoors(u8);
static void SetPetalburgGymDoorTiles(u8, u16);
const u8 gUnknown_083F8370[] = {0, 1, 1, 1, 1};
const u16 gPetalburgGymSlidingDoorMetatiles[] = {0x218, 0x219, 0x21a, 0x21b, 0x21c};

void PetalburgGymSlideOpenDoors(void)
{
    gUnknown_02039258 = 0;
    gPetalburgGymSlidingDoorIndex = 0;
    PlaySE(SE_KI_GASYAN);
    CreateTask(Task_SlideOpenPetalburgGymDoors, 8);
}

static void Task_SlideOpenPetalburgGymDoors(u8 taskId)
{
    if (gUnknown_083F8370[gPetalburgGymSlidingDoorIndex] == gUnknown_02039258)
    {
        SetPetalburgGymDoorTiles(gSpecialVar_0x8004, gPetalburgGymSlidingDoorMetatiles[gPetalburgGymSlidingDoorIndex]);
        gUnknown_02039258 = 0;
        if ((++gPetalburgGymSlidingDoorIndex) == 5)
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

static void SetPetalburgGymDoorTiles(u8 roomIndex, u16 metatile)
{
    u16 x[4];
    u16 y[4];
    u8 i;
    u8 numDoors = 0;
    switch (roomIndex)
    {
        case 1:
            numDoors = 2;
            x[0] = 1;
            x[1] = 7;
            y[0] = 0x68;
            y[1] = 0x68;
            break;
        case 2:
            numDoors = 2;
            x[0] = 1;
            x[1] = 7;
            y[0] = 0x4e;
            y[1] = 0x4e;
            break;
        case 3:
            numDoors = 2;
            x[0] = 1;
            x[1] = 7;
            y[0] = 0x5b;
            y[1] = 0x5b;
            break;
        case 4:
            numDoors = 1;
            x[0] = 7;
            y[0] = 0x27;
            break;
        case 5:
            numDoors = 2;
            x[0] = 1;
            x[1] = 7;
            y[0] = 0x34;
            y[1] = 0x34;
            break;
        case 6:
            numDoors = 1;
            x[0] = 1;
            y[0] = 0x41;
            break;
        case 7:
            numDoors = 1;
            x[0] = 7;
            y[0] = 0xd;
            break;
        case 8:
            numDoors = 1;
            x[0] = 1;
            y[0] = 0x1a;
            break;
    }

    for (i = 0; i < numDoors; i++)
    {
        MapGridSetMetatileIdAt(x[i] + 7, y[i] + 7, metatile | 0xc00);
        MapGridSetMetatileIdAt(x[i] + 7, y[i] + 8, (metatile + 8) | 0xc00);
    }

    DrawWholeMapView();
}

void PetalburgGymOpenDoorsInstantly(void)
{
    SetPetalburgGymDoorTiles(gSpecialVar_0x8004, gPetalburgGymSlidingDoorMetatiles[4]);
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

u8 GetBattleOutcome(void)
{
    return gBattleOutcome;
}

void CableCarWarp(void)
{
    if (gSpecialVar_0x8004 != 0)
    {
        Overworld_SetWarpDestination(MAP_GROUP(ROUTE112_CABLE_CAR_STATION), MAP_NUM(ROUTE112_CABLE_CAR_STATION), -1, 6, 4);
    }
    else
    {
        Overworld_SetWarpDestination(MAP_GROUP(MT_CHIMNEY_CABLE_CAR_STATION), MAP_NUM(MT_CHIMNEY_CABLE_CAR_STATION), -1, 6, 4);
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
        playerDirectionLowerNybble = GetPlayerFacingDirection();
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
    u8 playerDirectionLowerNybble = GetPlayerFacingDirection();
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
void DisplayCurrentElevatorFloor(void);
void sub_810E984(u8);
bool8 sub_810EAC8(u8, u8);
void sub_810EB90(u8, u8);
void ShakeScreenInElevator(void);
void sub_810EC34(u8);
void sub_810EC9C(u8);
void sub_810ECB0(void);
void sub_810ECD4(void);
void sub_810ECFC(void);
void sub_810ED40(u8);
void sub_810ED60(struct Task *);
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
        case MAP_NUM(LILYCOVE_CITY_DEPARTMENT_STORE_1F):
            deptStoreFloor = 0;
            break;
        case MAP_NUM(LILYCOVE_CITY_DEPARTMENT_STORE_2F):
            deptStoreFloor = 1;
            break;
        case MAP_NUM(LILYCOVE_CITY_DEPARTMENT_STORE_3F):
            deptStoreFloor = 2;
            break;
        case MAP_NUM(LILYCOVE_CITY_DEPARTMENT_STORE_4F):
            deptStoreFloor = 3;
            break;
        case MAP_NUM(LILYCOVE_CITY_DEPARTMENT_STORE_5F):
            deptStoreFloor = 4;
            break;
        case MAP_NUM(LILYCOVE_CITY_DEPARTMENT_STORE_ROOFTOP):
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
        Menu_DrawStdWindowFrame(0, 0, 8, 11);
        InitMenu(0, 1, 1, 5, 0, 7);
        gUnknown_0203925C = 0;
        ClearVerticalScrollIndicatorPalettes();
        LoadScrollIndicatorPalette();
        sub_810ECD4();
    }
    else
    {
        Menu_DrawStdWindowFrame(0, 0, 8, 2 * gUnknown_0203925A + 1);
        InitMenu(0, 1, 1, gUnknown_0203925A, 0, 7);
    }
    for (i = 0; i < 5 && gUnknown_03000760[i].var0 != 16; i ++)
    {
        Menu_PrintText(gUnknown_083F8380[gUnknown_03000760[i].var0], 1, 2 * i + 1);
    }
    DisplayCurrentElevatorFloor();
    CreateTask(sub_810E984, 8);
}

void DisplayCurrentElevatorFloor(void)
{
    Menu_DrawStdWindowFrame(20, 0, 29, 5);
    MenuPrint_Centered(gOtherText_NowOn, 21, 1, 64);
    MenuPrint_Centered(gUnknown_083F8380[gSpecialVar_0x8005], 21, 3, 64);
}

void sub_810E984(u8 taskId)
{
    u8 curMenuPos;
    if (gMain.newKeys == DPAD_UP && gUnknown_0203925B != 0)
    {
        gUnknown_0203925B--;
        curMenuPos = Menu_GetCursorPos();
        Menu_MoveCursorNoWrap(-1);
        sub_810EAC8(curMenuPos, DPAD_UP);
    }
    if (gMain.newKeys == DPAD_DOWN && gUnknown_0203925B != gUnknown_0203925A - 1)
    {
        gUnknown_0203925B++;
        curMenuPos = Menu_GetCursorPos();
        Menu_MoveCursorNoWrap(+1);
        sub_810EAC8(curMenuPos, DPAD_DOWN);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        saved_warp2_set_2(0, gUnknown_03000760[gUnknown_0203925B].var1, gUnknown_03000760[gUnknown_0203925B].var2, -1, 2, 1);
        if (gSpecialVar_0x8005 == gUnknown_0203925B)
        {
            gSpecialVar_Result = 0;
            PlaySE(SE_SELECT);
            Menu_EraseWindowRect(0, 0, 29, 12);
            sub_810EC9C(taskId);
        }
        else
        {
            gSpecialVar_Result = 1;
            gSpecialVar_0x8005 = gUnknown_0203925B;
            ShakeScreenInElevator();
            EventObjectTurnByLocalIdAndMap(gSpecialVar_LastTalked, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup, DIR_SOUTH);
            sub_810EEDC();
            Menu_EraseScreen();
            DestroyTask(taskId);
        }
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        gSpecialVar_Result = 0;
        PlaySE(SE_SELECT);
        sub_810EEDC();
        Menu_EraseWindowRect(0, 0, 29, 12);
        sub_810EC9C(taskId);
    }
}

// This function, as written, swaps the roles of r4 and r5 throughout.
#ifdef NONMATCHING
bool8 sub_810EAC8(u8 prevMenuPos, u8 dpadInput)
{
    u8 i;
    bool8 flag = 0;
    u8 newPos = 0;
    if (gUnknown_0203925A < 5)
    {
        return FALSE;
    }
    if (dpadInput == DPAD_UP)
    {
        if (prevMenuPos == 0)
        {
            newPos = gUnknown_0203925B;
            flag = 1;
        }
    }
    else if (dpadInput == DPAD_DOWN)
    {
        if (prevMenuPos == 4)
        {
            newPos = gUnknown_0203925B - 4;
            flag = 1;
        }
    }
    if (flag)
    {
        sub_810EB90(newPos, 5);
        Menu_BlankWindowRect(2, 1, 7, 10);
        for (i=0; i<5 && gUnknown_03000760[newPos].var0 != 16; newPos++, i++)
        {
            Menu_PrintText(gUnknown_083F8380[gUnknown_03000760[newPos].var0], 1, i * 2 + 1);
        }
    }
    return flag;
}
#else
NAKED
bool8 sub_810EAC8(u8 prevMenuPos, u8 dpadInput)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tmov r7, r8\n"
                    "\tpush {r7}\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r2, r0, 24\n"
                    "\tadds r5, r2, 0\n"
                    "\tlsls r1, 24\n"
                    "\tlsrs r1, 24\n"
                    "\tadds r3, r1, 0\n"
                    "\tmovs r7, 0\n"
                    "\tmovs r4, 0\n"
                    "\tldr r0, _0810EAEC @ =gUnknown_0203925A\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r0, 0x4\n"
                    "\tbhi _0810EAF0\n"
                    "\tmovs r0, 0\n"
                    "\tb _0810EB78\n"
                    "\t.align 2, 0\n"
                    "_0810EAEC: .4byte gUnknown_0203925A\n"
                    "_0810EAF0:\n"
                    "\tcmp r1, 0x40\n"
                    "\tbne _0810EB04\n"
                    "\tcmp r2, 0\n"
                    "\tbne _0810EB18\n"
                    "\tldr r0, _0810EB00 @ =gUnknown_0203925B\n"
                    "\tldrb r4, [r0]\n"
                    "\tmovs r7, 0x1\n"
                    "\tb _0810EB1C\n"
                    "\t.align 2, 0\n"
                    "_0810EB00: .4byte gUnknown_0203925B\n"
                    "_0810EB04:\n"
                    "\tcmp r3, 0x80\n"
                    "\tbne _0810EB18\n"
                    "\tcmp r5, 0x4\n"
                    "\tbne _0810EB18\n"
                    "\tldr r0, _0810EB84 @ =gUnknown_0203925B\n"
                    "\tldrb r0, [r0]\n"
                    "\tsubs r0, 0x4\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r4, r0, 24\n"
                    "\tmovs r7, 0x1\n"
                    "_0810EB18:\n"
                    "\tcmp r7, 0\n"
                    "\tbeq _0810EB76\n"
                    "_0810EB1C:\n"
                    "\tadds r0, r4, 0\n"
                    "\tmovs r1, 0x5\n"
                    "\tbl sub_810EB90\n"
                    "\tmovs r0, 0x2\n"
                    "\tmovs r1, 0x1\n"
                    "\tmovs r2, 0x7\n"
                    "\tmovs r3, 0xA\n"
                    "\tbl Menu_BlankWindowRect\n"
                    "\tmovs r5, 0\n"
                    "\tldr r2, _0810EB88 @ =gUnknown_03000760\n"
                    "\tlsls r1, r4, 2\n"
                    "\tadds r0, r1, r2\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r0, 0x10\n"
                    "\tbeq _0810EB76\n"
                    "\tldr r0, _0810EB8C @ =gUnknown_083F8380\n"
                    "\tmov r8, r0\n"
                    "\tadds r6, r2, 0\n"
                    "_0810EB44:\n"
                    "\tadds r0, r1, r6\n"
                    "\tldrb r0, [r0]\n"
                    "\tlsls r0, 2\n"
                    "\tadd r0, r8\n"
                    "\tldr r0, [r0]\n"
                    "\tlsls r2, r5, 1\n"
                    "\tadds r2, 0x1\n"
                    "\tlsls r2, 24\n"
                    "\tlsrs r2, 24\n"
                    "\tmovs r1, 0x1\n"
                    "\tbl Menu_PrintText\n"
                    "\tadds r0, r4, 0x1\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r4, r0, 24\n"
                    "\tadds r0, r5, 0x1\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r5, r0, 24\n"
                    "\tcmp r5, 0x4\n"
                    "\tbhi _0810EB76\n"
                    "\tlsls r1, r4, 2\n"
                    "\tadds r0, r1, r6\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r0, 0x10\n"
                    "\tbne _0810EB44\n"
                    "_0810EB76:\n"
                    "\tadds r0, r7, 0\n"
                    "_0810EB78:\n"
                    "\tpop {r3}\n"
                    "\tmov r8, r3\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r1}\n"
                    "\tbx r1\n"
                    "\t.align 2, 0\n"
                    "_0810EB84: .4byte gUnknown_0203925B\n"
                    "_0810EB88: .4byte gUnknown_03000760\n"
                    "_0810EB8C: .4byte gUnknown_083F8380");
}
#endif

void sub_810EB90(u8 newPos, u8 maxItems)
{
    if (newPos == 0)
    {
        gUnknown_0203925C ^= 0x02;
        DestroyVerticalScrollIndicator(TOP_ARROW);
    }
    else
    {
        sub_810ECB0();
    }
    if (newPos + maxItems < gUnknown_0203925A)
    {
        sub_810ECD4();
    }
    else if (newPos + maxItems == gUnknown_0203925A)
    {
        gUnknown_0203925C ^= 0x01;
        DestroyVerticalScrollIndicator(BOTTOM_ARROW);
    }
}

void ShakeScreenInElevator(void)
{
    u8 taskId = CreateTask(sub_810EC34, 9);
    gTasks[taskId].data[0] = 1;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = 0;
    gTasks[taskId].data[4] = 1;
    gTasks[taskId].data[5] = 3;
    SetCameraPanningCallback(NULL);
    sub_810ECFC();
    PlaySE(SE_ELEBETA);
}

void sub_810EC34(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    task->data[1] ++;
    if (task->data[1] % task->data[5] == 0)
    {
        task->data[1] = 0;
        task->data[2] ++;
        if (task->data[3] == 0)
        {
            task->data[4] = -task->data[4];
            SetCameraPanning(0, task->data[4]);
            if (task->data[2] == 23)
            {
                PlaySE(SE_PINPON);
                sub_810EC9C(taskId);
                InstallCameraPanAheadCallback();
            }
        }
    }
}

void sub_810EC9C(u8 taskId)
{
    DestroyTask(taskId);
    EnableBothScriptContexts();
}

void sub_810ECB0(void)
{
    if (gUnknown_0203925C >> 1 != 1)
    {
        gUnknown_0203925C |= 0x2;
        CreateVerticalScrollIndicators(TOP_ARROW, 0x24, 0x08);
    }
}

void sub_810ECD4(void)
{
    if ((gUnknown_0203925C & 1) == 0)
    {
        gUnknown_0203925C |= 0x1;
        CreateVerticalScrollIndicators(BOTTOM_ARROW, 0x24, 0x48);
    }
}

void sub_810ECFC(void)
{
    if (FuncIsActiveTask(sub_810ED40) != TRUE)
    {
        u8 taskId = CreateTask(sub_810ED40, 8);
        gTasks[taskId].data[0] = 0;
        gTasks[taskId].data[1] = taskId;
        gTasks[taskId].data[2] = 0;
        gTasks[taskId].data[3] = 0;
        gTasks[taskId].data[4] = 0;
    }
}

void sub_810ED40(u8 taskId)
{
    sub_810ED60(&gTasks[taskId]);
}

void sub_810ED60(struct Task *task)
{
    if (task->data[3] == 8)
    {
        task->data[3] = 0;
        if (task->data[4] != 0)
        {
            MapGridSetMetatileIdAt( 7,  7, 0xe68);
            MapGridSetMetatileIdAt( 8,  7, 0xe69);
            MapGridSetMetatileIdAt( 9,  7, 0xe69);
            MapGridSetMetatileIdAt(10,  7, 0xe6a);
            MapGridSetMetatileIdAt( 7,  8, 0xe70);
            MapGridSetMetatileIdAt( 8,  8, 0xe71);
            MapGridSetMetatileIdAt( 9,  8, 0xe71);
            MapGridSetMetatileIdAt(10,  8, 0xe72);
            MapGridSetMetatileIdAt( 7,  9, 0xe78);
            MapGridSetMetatileIdAt( 8,  9, 0xe79);
            MapGridSetMetatileIdAt( 9,  9, 0xe79);
            MapGridSetMetatileIdAt(10,  9, 0xe7a);
        }
        else
        {
            MapGridSetMetatileIdAt( 7,  7, 0xe6b);
            MapGridSetMetatileIdAt( 8,  7, 0xe6c);
            MapGridSetMetatileIdAt( 9,  7, 0xe6c);
            MapGridSetMetatileIdAt(10,  7, 0xe6d);
            MapGridSetMetatileIdAt( 7,  8, 0xe73);
            MapGridSetMetatileIdAt( 8,  8, 0xe74);
            MapGridSetMetatileIdAt( 9,  8, 0xe74);
            MapGridSetMetatileIdAt(10,  8, 0xe75);
            MapGridSetMetatileIdAt( 7,  9, 0xe7b);
            MapGridSetMetatileIdAt( 8,  9, 0xe7c);
            MapGridSetMetatileIdAt( 9,  9, 0xe7c);
            MapGridSetMetatileIdAt(10,  9, 0xe7d);
        }
        DrawWholeMapView();
        task->data[4] ^= 1;
        task->data[2]++;
        if (task->data[2] == 8)
        {
            DestroyTask(task->data[1]);
        }
    }
    task->data[3]++;
}

void sub_810EEDC(void)
{
    if ((gUnknown_0203925C & 1) != 0)
    {
        DestroyVerticalScrollIndicator(BOTTOM_ARROW);
    }
    if ((gUnknown_0203925C >> 1) == 1)
    {
        DestroyVerticalScrollIndicator(TOP_ARROW);
    }
    BuyMenuFreeMemory();
}

void SetTrickHouseEndRoomFlag(void)
{
    u16 *specVar = &gSpecialVar_0x8004;
    u16 flag = 0x259;
    *specVar = flag;
    FlagSet(flag);
}

void ResetTrickHouseEndRoomFlag(void)
{
    u16 *specVar = &gSpecialVar_0x8004;
    u16 flag = 0x259;
    *specVar = flag;
    FlagClear(flag);
}

bool8 CheckLeadMonCool(void)
{
    if (GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_COOL) < 200)
    {
        return FALSE;
    }
    return TRUE;
}

bool8 CheckLeadMonBeauty(void)
{
    if (GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_BEAUTY) < 200)
    {
        return FALSE;
    }
    return TRUE;
}

bool8 CheckLeadMonCute(void)
{
    if (GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_CUTE) < 200)
    {
        return FALSE;
    }
    return TRUE;
}

bool8 CheckLeadMonSmart(void)
{
    if (GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_SMART) < 200)
    {
        return FALSE;
    }
    return TRUE;
}

bool8 CheckLeadMonTough(void)
{
    if (GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_TOUGH) < 200)
    {
        return FALSE;
    }
    return TRUE;
}

void IsGrassTypeInParty(void)
{
    u8 i;
    u16 species;
    struct Pokemon *pokemon;
    for (i=0; i<PARTY_SIZE; i++)
    {
        pokemon = &gPlayerParty[i];
        if (GetMonData(pokemon, MON_DATA_SANITY_BIT2) && !GetMonData(pokemon, MON_DATA_IS_EGG))
        {
            species = GetMonData(pokemon, MON_DATA_SPECIES);
            if (gBaseStats[species].type1 == TYPE_GRASS || gBaseStats[species].type2 == TYPE_GRASS)
            {
                gSpecialVar_Result = TRUE;
                return;
            }
        }
    }
    gSpecialVar_Result = FALSE;
}

const u8 *const gUnknown_083F83C0[] = {
    OtherText_BlueFlute,
    OtherText_YellowFlute,
    OtherText_RedFlute,
    OtherText_WhiteFlute,
    OtherText_BlackFlute,
    OtherText_PrettyChair,
    OtherText_PrettyDesk,
    gOtherText_CancelNoTerminator
};

void sub_810F118(u8);
bool8 sub_810F1F4(u8, u8);
void sub_810F2B4(void);
void GlassWorkshopUpdateScrollIndicators(u8, u8);

void ShowGlassWorkshopMenu(void)
{
    u8 i;
    ScriptContext2_Enable();
    Menu_DrawStdWindowFrame(0, 0, 10, 11);
    InitMenu(0, 1, 1, 5, 0, 9);
    gUnknown_0203925C = 0;
    ClearVerticalScrollIndicatorPalettes();
    LoadScrollIndicatorPalette();
    sub_810F2B4();
    for (i=0; i<5; i++)
    {
        Menu_PrintText(gUnknown_083F83C0[i], 1, 2 * i + 1);
    }
    gUnknown_0203925B = 0;
    gUnknown_0203925A = ARRAY_COUNT(gUnknown_083F83C0);
    CreateTask(sub_810F118, 8);
}

void sub_810F118(u8 taskId)
{
    u8 prevCursorPos;
    if (gMain.newKeys == DPAD_UP && gUnknown_0203925B != 0)
    {
        gUnknown_0203925B--;
        prevCursorPos = Menu_GetCursorPos();
        Menu_MoveCursorNoWrap(-1);
        sub_810F1F4(prevCursorPos, DPAD_UP);
    }
    if (gMain.newKeys == DPAD_DOWN && gUnknown_0203925B != gUnknown_0203925A - 1)
    {
        gUnknown_0203925B++;
        prevCursorPos = Menu_GetCursorPos();
        Menu_MoveCursorNoWrap(1);
        sub_810F1F4(prevCursorPos, DPAD_DOWN);
    }
    if (gMain.newKeys & A_BUTTON)
    {
        Menu_DestroyCursor();
        gSpecialVar_Result = gUnknown_0203925B;
        PlaySE(SE_SELECT);
        sub_810EEDC();
        Menu_EraseWindowRect(0, 0, 29, 12);
        sub_810EC9C(taskId);
    }
    if (gMain.newKeys & B_BUTTON)
    {
        Menu_DestroyCursor();
        gSpecialVar_Result = 0x7f;
        PlaySE(SE_SELECT);
        sub_810EEDC();
        Menu_EraseWindowRect(0, 0, 29, 12);
        sub_810EC9C(taskId);
    }
}

// Second verse, same as the first
#ifdef NONMATCHING
bool8 sub_810F1F4(u8 prevCursorPos, u8 dpadInput)
{
    u8 i;
    u8 flag = 0;
    u8 newPos = 0;
    if (gUnknown_0203925A < 5)
    {
        return FALSE;
    }
    if (dpadInput == DPAD_UP)
    {
        if (prevCursorPos == 0)
        {
            newPos = gUnknown_0203925B;
            flag = TRUE;
        }
    }
    else if (dpadInput == DPAD_DOWN)
    {
        if (prevCursorPos == 4)
        {
            newPos = gUnknown_0203925B - 4;
            flag = TRUE;
        }
    }
    if (flag)
    {
        GlassWorkshopUpdateScrollIndicators(newPos, 5);
        Menu_BlankWindowRect(2, 1, 9, 10);
        for (i=0; i<5; newPos++, i++)
        {
            Menu_PrintText(gUnknown_083F83C0[newPos], 1, 2 * i + 1);
        }
    }
    return flag;
}
#else
NAKED
bool8 sub_810F1F4(u8 prevCursorPos, u8 dpadInput)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r2, r0, 24\n"
                    "\tadds r5, r2, 0\n"
                    "\tlsls r1, 24\n"
                    "\tlsrs r1, 24\n"
                    "\tadds r3, r1, 0\n"
                    "\tmovs r6, 0\n"
                    "\tmovs r4, 0\n"
                    "\tldr r0, _0810F214 @ =gUnknown_0203925A\n"
                    "\tldrb r0, [r0]\n"
                    "\tcmp r0, 0x4\n"
                    "\tbhi _0810F218\n"
                    "\tmovs r0, 0\n"
                    "\tb _0810F282\n"
                    "\t.align 2, 0\n"
                    "_0810F214: .4byte gUnknown_0203925A\n"
                    "_0810F218:\n"
                    "\tcmp r1, 0x40\n"
                    "\tbne _0810F22C\n"
                    "\tcmp r2, 0\n"
                    "\tbne _0810F240\n"
                    "\tldr r0, _0810F228 @ =gUnknown_0203925B\n"
                    "\tldrb r4, [r0]\n"
                    "\tmovs r6, 0x1\n"
                    "\tb _0810F244\n"
                    "\t.align 2, 0\n"
                    "_0810F228: .4byte gUnknown_0203925B\n"
                    "_0810F22C:\n"
                    "\tcmp r3, 0x80\n"
                    "\tbne _0810F240\n"
                    "\tcmp r5, 0x4\n"
                    "\tbne _0810F240\n"
                    "\tldr r0, _0810F288 @ =gUnknown_0203925B\n"
                    "\tldrb r0, [r0]\n"
                    "\tsubs r0, 0x4\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r4, r0, 24\n"
                    "\tmovs r6, 0x1\n"
                    "_0810F240:\n"
                    "\tcmp r6, 0\n"
                    "\tbeq _0810F280\n"
                    "_0810F244:\n"
                    "\tadds r0, r4, 0\n"
                    "\tmovs r1, 0x5\n"
                    "\tbl GlassWorkshopUpdateScrollIndicators\n"
                    "\tmovs r0, 0x2\n"
                    "\tmovs r1, 0x1\n"
                    "\tmovs r2, 0x9\n"
                    "\tmovs r3, 0xA\n"
                    "\tbl Menu_BlankWindowRect\n"
                    "\tmovs r5, 0\n"
                    "\tldr r7, _0810F28C @ =gUnknown_083F83C0\n"
                    "_0810F25C:\n"
                    "\tlsls r0, r4, 2\n"
                    "\tadds r0, r7\n"
                    "\tldr r0, [r0]\n"
                    "\tlsls r2, r5, 1\n"
                    "\tadds r2, 0x1\n"
                    "\tlsls r2, 24\n"
                    "\tlsrs r2, 24\n"
                    "\tmovs r1, 0x1\n"
                    "\tbl Menu_PrintText\n"
                    "\tadds r0, r4, 0x1\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r4, r0, 24\n"
                    "\tadds r0, r5, 0x1\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r5, r0, 24\n"
                    "\tcmp r5, 0x4\n"
                    "\tbls _0810F25C\n"
                    "_0810F280:\n"
                    "\tadds r0, r6, 0\n"
                    "_0810F282:\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r1}\n"
                    "\tbx r1\n"
                    "\t.align 2, 0\n"
                    "_0810F288: .4byte gUnknown_0203925B\n"
                    "_0810F28C: .4byte gUnknown_083F83C0");
}
#endif

void sub_810F290(void)
{
    if (gUnknown_0203925C >> 1 != 1)
    {
        gUnknown_0203925C |= 0x02;
        CreateVerticalScrollIndicators(TOP_ARROW, 0x2c, 0x08);
    }
}

void sub_810F2B4(void)
{
    if (!(gUnknown_0203925C & 0x01))
    {
        gUnknown_0203925C |= 0x01;
        CreateVerticalScrollIndicators(BOTTOM_ARROW, 0x2c, 0x58);
    }
}

void GlassWorkshopUpdateScrollIndicators(u8 newPos, u8 maxItems)
{
    if (newPos == 0)
    {
        gUnknown_0203925C ^= 0x02;
        DestroyVerticalScrollIndicator(TOP_ARROW);
    }
    else
    {
        sub_810F290();
    }
    if (newPos + maxItems < gUnknown_0203925A)
    {
        sub_810F2B4();
    }
    else if (newPos + maxItems == gUnknown_0203925A)
    {
        gUnknown_0203925C ^= 0x01;
        DestroyVerticalScrollIndicator(BOTTOM_ARROW);
    }
}

void SpawnCameraDummy(void)
{
    u8 eventObjectId = SpawnSpecialEventObjectParametrized(7, MOVEMENT_TYPE_FACE_DOWN, 0x7f, gSaveBlock1.pos.x + 7, gSaveBlock1.pos.y + 7, 3);
    gEventObjects[eventObjectId].invisible = 1;
    CameraObjectSetFollowedObjectId(gEventObjects[eventObjectId].spriteId);
}

void RemoveCameraDummy(void)
{
    CameraObjectSetFollowedObjectId(GetPlayerAvatarObjectId());
    RemoveEventObjectByLocalIdAndMap(0x7f, gSaveBlock1.location.mapNum, gSaveBlock1.location.mapGroup);
}

u8 GetPokeblockNameByMonNature(void)
{
    return sub_810CB68(GetNature(&gPlayerParty[GetLeadMonIndex()]), gStringVar1);
}

void GetSecretBaseNearbyMapName(void)
{
    GetMapSectionName(gStringVar1, VarGet(VAR_SECRET_BASE_MAP), 0);
}

u16 GetBestBattleTowerStreak(void)
{
    return GetGameStat(GAME_STAT_BATTLE_TOWER_BEST_STREAK);
}

void BufferEReaderTrainerName(void)
{
    SetEReaderTrainerName(gStringVar1);
}

const u8 gUnknown_083F83E0[] = {12, 2, 4, 5, 1, 8, 7, 11, 3, 10, 9, 6};
const u8 gUnknown_083F83EC[] = {0, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5};
const u8 gUnknown_083F83F8[] = {3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5};

u16 GetSlotMachineId(void)
{
    u32 v0 = gSaveBlock1.easyChatPairs[0].unk0_0 + gSaveBlock1.easyChatPairs[0].unk2 + gUnknown_083F83E0[gSpecialVar_0x8004];
    if (GetPriceReduction(2))
    {
        return gUnknown_083F83F8[v0 % 12];
    }
    return gUnknown_083F83EC[v0 % 12];
}

bool8 FoundAbandonedShipRoom1Key(void)
{
    u16 *specVar = &gSpecialVar_0x8004;
    u16 flag = FLAG_HIDDEN_ITEM_1F;
    *specVar = flag;
    if (!FlagGet(flag))
    {
        return FALSE;
    }
    return TRUE;
}

bool8 FoundAbandonedShipRoom2Key(void)
{
    u16 *specVar = &gSpecialVar_0x8004;
    u16 flag = FLAG_HIDDEN_ITEM_20;
    *specVar = flag;
    if (!FlagGet(flag))
    {
        return FALSE;
    }
    return TRUE;
}

bool8 FoundAbandonedShipRoom4Key(void)
{
    u16 *specVar = &gSpecialVar_0x8004;
    u16 flag = FLAG_HIDDEN_ITEM_21;
    *specVar = flag;
    if (!FlagGet(flag))
    {
        return FALSE;
    }
    return TRUE;
}

bool8 FoundAbandonedShipRoom6Key(void)
{
    u16 *specVar = &gSpecialVar_0x8004;
    u16 flag = FLAG_HIDDEN_ITEM_22;
    *specVar = flag;
    if (!FlagGet(flag))
    {
        return FALSE;
    }
    return TRUE;
}

bool8 LeadMonHasEffortRibbon(void)
{
    return GetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_EFFORT_RIBBON, NULL);
}

void GivLeadMonEffortRibbon(void)
{
    bool8 ribbonSet;
    IncrementGameStat(GAME_STAT_RECEIVED_RIBBONS);
    FlagSet(FLAG_SYS_RIBBON_GET);
    ribbonSet = TRUE;
    SetMonData(&gPlayerParty[GetLeadMonIndex()], MON_DATA_EFFORT_RIBBON, &ribbonSet);
}

bool8 ScrSpecial_AreLeadMonEVsMaxedOut(void)
{
    if (GetMonEVCount(&gPlayerParty[GetLeadMonIndex()]) >= 510)
    {
        return TRUE;
    }
    return FALSE;
}

u8 TryUpdateRusturfTunnelState(void)
{
    if (!FlagGet(FLAG_RUSTURF_TUNNEL_OPENED) && gSaveBlock1.location.mapGroup == MAP_GROUP(RUSTURF_TUNNEL) && gSaveBlock1.location.mapNum == MAP_NUM(RUSTURF_TUNNEL))
    {
        if (FlagGet(FLAG_HIDE_RUSTURF_TUNNEL_ROCK_1))
        {
            VarSet(VAR_RUSTURF_TUNNEL_STATE, 4);
            return TRUE;
        }
        else if (FlagGet(FLAG_HIDE_RUSTURF_TUNNEL_ROCK_2))
        {
            VarSet(VAR_RUSTURF_TUNNEL_STATE, 5);
            return TRUE;
        }
    }
    return FALSE;
}

void SetShoalItemFlag(u16 v0)
{
    FlagSet(0x85f);
}

void PutZigzagoonInPlayerParty(void)
{
    u16 monData;
    CreateMon(&gPlayerParty[0], SPECIES_ZIGZAGOON, 7, 0x20, FALSE, 0, FALSE, 0);
    monData = TRUE;
    SetMonData(&gPlayerParty[0], MON_DATA_ALT_ABILITY, &monData);
    monData = MOVE_TACKLE;
    SetMonData(&gPlayerParty[0], MON_DATA_MOVE1, &monData);
    monData = MOVE_NONE;
    SetMonData(&gPlayerParty[0], MON_DATA_MOVE2, &monData);
    SetMonData(&gPlayerParty[0], MON_DATA_MOVE3, &monData);
    SetMonData(&gPlayerParty[0], MON_DATA_MOVE4, &monData);
}

bool8 IsStarterInParty(void)
{
    u8 i;
    u16 starter = GetStarterPokemon(VarGet(VAR_STARTER_MON));
    u8 partyCount = CalculatePlayerPartyCount();
    for (i = 0; i < partyCount; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL) == starter)
        {
            return TRUE;
        }
    }
    return FALSE;
}

bool8 CheckFreePokemonStorageSpace(void)
{
    u16 i, j;
    for (i=0; i<14; i++)
    {
        for (j=0; j<30; j++)
        {
            if (GetBoxMonData(&gPokemonStorage.boxes[i][j], MON_DATA_SPECIES, NULL) == SPECIES_NONE)
            {
                return TRUE;
            }
        }
    }
    return FALSE;
}

bool8 IsPokerusInParty(void)
{
    if (!CheckPartyPokerus(gPlayerParty, 0x3f))
    {
        return FALSE;
    }
    return TRUE;
}

static void sub_810F7A8(u8);
static void sub_810F814(u8);

void sub_810F758(void)
{
    u8 taskId = CreateTask(sub_810F7A8, 9);
    gTasks[taskId].data[0] = gSpecialVar_0x8005;
    gTasks[taskId].data[1] = 0;
    gTasks[taskId].data[2] = 0;
    gTasks[taskId].data[3] = 0;
    gTasks[taskId].data[4] = gSpecialVar_0x8004;
    gTasks[taskId].data[5] = 5;
    SetCameraPanningCallback(NULL);
    PlaySE(SE_W070);
}

static void sub_810F7A8(u8 taskId)
{
    struct Task *task = &gTasks[taskId];
    task->data[1]++;
    if ((task->data[1] % task->data[5]) == 0)
    {
        task->data[1] = 0;
        task->data[2]++;
        if (task->data[3] == 0)
        {
            task->data[0] = -task->data[0];
            task->data[4] = -task->data[4];
            SetCameraPanning(task->data[0], task->data[4]);
            if (task->data[2] == 8)
            {
                sub_810F814(taskId);
                InstallCameraPanAheadCallback();
            }
        }
    }
}

static void sub_810F814(u8 taskId)
{
    DestroyTask(taskId);
    EnableBothScriptContexts();
}

bool8 FoundBlackGlasses(void)
{
    return FlagGet(FLAG_HIDDEN_ITEM_BLACK_GLASSES);
}

void SetRoute119Weather(void)
{
    if (is_map_type_1_2_3_5_or_6(GetLastUsedWarpMapType()) != TRUE)
    {
        SetSav1Weather(WEATHER_ROUTE119_CYCLE);
    }
}

void SetRoute123Weather(void)
{
    if (is_map_type_1_2_3_5_or_6(GetLastUsedWarpMapType()) != TRUE)
    {
        SetSav1Weather(WEATHER_ROUTE123_CYCLE);
    }
}

u8 GetLeadMonIndex(void)
{
    u8 i;
    u8 partyCount = CalculatePlayerPartyCount();
    for (i = 0; i < partyCount; i++)
    {
        if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL) != SPECIES_EGG && GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2, NULL) != 0)
            return i;
    }

    return 0;
}

u16 ScriptGetPartyMonSpecies(void)
{
    return GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_SPECIES2, NULL);
}

void TryInitBattleTowerAwardManEventObject(void)
{
    TryInitLocalEventObject(6);
}

u16 GetDaysUntilPacifidlogTMAvailable(void)
{
    u16 tmReceivedDay = VarGet(VAR_PACIFIDLOG_TM_RECEIVED_DAY);
    if (gLocalTime.days - tmReceivedDay >= 7)
    {
        return 0;
    }
    else if (gLocalTime.days < 0)
    {
        return 8;
    }
    return 7 - (gLocalTime.days - tmReceivedDay);
}

u16 SetPacifidlogTMReceivedDay(void)
{
    VarSet(VAR_PACIFIDLOG_TM_RECEIVED_DAY, gLocalTime.days);
    return gLocalTime.days;
}

bool8 MonOTNameMatchesPlayer(void)
{
    GetMonData(&gPlayerParty[gSpecialVar_0x8004], MON_DATA_OT_NAME, gStringVar1);
    if (!StringCompareWithoutExtCtrlCodes(gSaveBlock2.playerName, gStringVar1))
    {
        return FALSE;
    }
    return TRUE;
}

void BufferLottoTicketNumber(void)
{
    if (gSpecialVar_Result >= 10000)
    {
        sub_80BF088(0, gSpecialVar_Result);
    }
    else if (gSpecialVar_Result >= 1000)
    {
        gStringVar1[0] = CHAR_0;
        ConvertIntToDecimalStringN(gStringVar1 + 1, gSpecialVar_Result, 0, sub_80BF0B8(gSpecialVar_Result));
    }
    else if (gSpecialVar_Result >= 100)
    {
        gStringVar1[0] = CHAR_0;
        gStringVar1[1] = CHAR_0;
        ConvertIntToDecimalStringN(gStringVar1 + 2, gSpecialVar_Result, 0, sub_80BF0B8(gSpecialVar_Result));
    }
    else if (gSpecialVar_Result >= 10)
    {
        gStringVar1[0] = CHAR_0;
        gStringVar1[1] = CHAR_0;
        gStringVar1[2] = CHAR_0;
        ConvertIntToDecimalStringN(gStringVar1 + 3, gSpecialVar_Result, 0, sub_80BF0B8(gSpecialVar_Result));
    }
    else
    {
        gStringVar1[0] = CHAR_0;
        gStringVar1[1] = CHAR_0;
        gStringVar1[2] = CHAR_0;
        gStringVar1[3] = CHAR_0;
        ConvertIntToDecimalStringN(gStringVar1 + 4, gSpecialVar_Result, 0, sub_80BF0B8(gSpecialVar_Result));
    }
}

const u8 gUnknown_083F8404[] = {2, 1, 2, 1};
const u8 gUnknown_083F8408[] = {8,  9, 10, 11, 12, 13, 14, 15};
const u8 gUnknown_083F8410[] = {8, 13, 14, 11, 10, 12, 15,  9};

bool8 sub_810FF30(void);
void UpdateMovedLilycoveFanClubMembers(void);
void sub_810FF48(void);
void sub_810FD80(void);
u16 GetNumMovedLilycoveFanClubMembers(void);
int sub_810FB9C(void);

void ResetFanClub(void)
{
    gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] = 0;
    gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_2 - VARS_START] = 0;
}

void sub_810FA74(void)
{
    if (sub_810FF30())
    {
        UpdateMovedLilycoveFanClubMembers();
        gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_2 - VARS_START] = gSaveBlock2.playTimeHours;
    }
}

void sub_810FAA0(void)
{
    if (!((gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] >> 7) & 1))
    {
        sub_810FF48();
        sub_810FD80();
        gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_2 - VARS_START] = gSaveBlock2.playTimeHours;
        FlagClear(FLAG_HIDE_FANCLUB_OLD_LADY);
        FlagClear(FLAG_HIDE_FANCLUB_BOY);
        FlagClear(FLAG_HIDE_FANCLUB_LITTLE_BOY);
        FlagClear(FLAG_HIDE_FANCLUB_LADY);
        VarSet(VAR_LILYCOVE_FAN_CLUB_STATE, 1);
    }
}

u8 sub_810FB10(u8 a0)
{
    if (VarGet(VAR_LILYCOVE_FAN_CLUB_STATE) == 2)
    {
        if ((gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] & 0x7f) + gUnknown_083F8404[a0] >= 20)
        {
            if (GetNumMovedLilycoveFanClubMembers() < 3)
            {
                sub_810FB9C();
                gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] &= 0xff80;
            }
            else
            {
                gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] = (gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] & 0xff80) | 20;
            }
        }
        else
        {
            gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] += gUnknown_083F8404[a0];
        }
    }
    return gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] & 0x7f;
}

int sub_810FB9C(void)
{
    u8 i;
    int retval = 0;
    for (i=0; i<8; i++)
    {
        if (!((gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] >> gUnknown_083F8408[i]) & 0x01))
        {
            retval = i;
            if (Random() & 1)
            {
                gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] |= (1 << gUnknown_083F8408[i]);
                return retval;
            }
        }
    }
    gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] |= (1 << gUnknown_083F8408[retval]);
    return retval;
}

int sub_810FC18(void)
{
    u8 i;
    int retval = 0;
    if (GetNumMovedLilycoveFanClubMembers() == 1)
    {
        return 0;
    }
    for (i=0; i<8; i++)
    {
        if ((gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] >> gUnknown_083F8410[i]) & 1)
        {
            retval = i;
            if (Random() & 1)
            {
                gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] ^= (1 << gUnknown_083F8410[i]);
                return retval;
            }
        }
    }
    if ((gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] >> gUnknown_083F8410[retval]) & 1)
    {
        gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] ^= (1 << gUnknown_083F8410[retval]);
    }
    return retval;
}

u16 GetNumMovedLilycoveFanClubMembers(void)
{
    u8 i;
    u8 retval = 0;
    for (i = 0; i < 8; i++)
    {
        if ((gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] >> (i + 8)) & 1)
        {
            retval++;
        }
    }

    return retval;
}

void UpdateMovedLilycoveFanClubMembers(void)
{
    u8 i = 0;
    if (gSaveBlock2.playTimeHours < 999)
    {
        while (1)
        {
            if (GetNumMovedLilycoveFanClubMembers() < 5)
            {
                gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_2 - VARS_START] = gSaveBlock2.playTimeHours;
                break;
            }
            else if (i == 8)
            {
                break;
            }
            else if (gSaveBlock2.playTimeHours - gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_2 - VARS_START] < 12)
            {
                return;
            }
            sub_810FC18();
            gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_2 - VARS_START] += 12;
            i++;
        }
    }
}

bool8 ShouldMoveLilycoveFanClubMember(void)
{
    return (gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] >> gSpecialVar_0x8004) & 0x01;
}

void sub_810FD80(void)
{
    gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] |= 0x2000;
    gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] |= 0x100;
    gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] |= 0x400;
}

void sub_810FE1C(void *, u8, u8);

void BufferStreakTrainerText(void)
{
    u8 a = 0;
    u8 b = 0;
    switch (gSpecialVar_0x8004)
    {
        case 8:
            break;
        case 9:
            break;
        case 10:
            a = 0;
            b = 3;
            break;
        case 11:
            a = 0;
            b = 1;
            break;
        case 12:
            a = 1;
            b = 0;
            break;
        case 13:
            a = 0;
            b = 4;
            break;
        case 14:
            a = 1;
            b = 5;
            break;
        case 15:
            break;
    }
    sub_810FE1C(gSaveBlock1.linkBattleRecords, a, b);
}

void sub_810FE1C(void *linkRecords, u8 a, u8 b)
{
    u8 *curRecord = (linkRecords + 16 * a);
    if (*curRecord == EOS)
    {
        switch (b)
        {
            case 0:
                StringCopy(gStringVar1, gOtherText_Wallace);
                break;
            case 1:
                StringCopy(gStringVar1, gOtherText_Steven);
                break;
            case 2:
                StringCopy(gStringVar1, gOtherText_Brawly);
                break;
            case 3:
                StringCopy(gStringVar1, gOtherText_Winona);
                break;
            case 4:
                StringCopy(gStringVar1, gOtherText_Phoebe);
                break;
            case 5:
                StringCopy(gStringVar1, gOtherText_Glacia);
                break;
            default:
                StringCopy(gStringVar1, gOtherText_Wallace);
                break;
        }
    }
    else
    {
        StringCopyN(gStringVar1, curRecord, 7);
        gStringVar1[7] = EOS;
        if (gStringVar1[0] == 0xfc && gStringVar1[1] == 0x15)
        {
            ConvertInternationalString(gStringVar1, 1);
        }
    }
}

void sub_810FEFC(void)
{
    if (VarGet(VAR_LILYCOVE_FAN_CLUB_STATE) == 2)
    {
        sub_810FA74();
        if (gBattleOutcome == 1)
        {
            sub_810FB9C();
        }
        else
        {
            sub_810FC18();
        }
    }
}

bool8 sub_810FF30(void)
{
    return (gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] >> 7) & 0x01;
}

void sub_810FF48(void)
{
    gSaveBlock1.vars[VAR_FANCLUB_UNKNOWN_1 - VARS_START] |= 0x80;
}

u8 sub_810FF60(void)
{
    return sub_810FB10(gSpecialVar_0x8004);
}
