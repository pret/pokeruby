#include "global.h"
#include "overworld.h"
#include "battle_setup.h"
#include "berry.h"
#include "cable_club.h"
#include "clock.h"
#include "event_data.h"
#include "field_camera.h"
#include "field_control_avatar.h"
#include "field_effect.h"
#include "field_fadetransition.h"
#include "event_object_movement.h"
#include "field_message_box.h"
#include "field_player_avatar.h"
#include "field_screen_effect.h"
#include "field_special_scene.h"
#include "field_specials.h"
#include "field_tasks.h"
#include "field_weather.h"
#include "fieldmap.h"
#include "fldeff_flash.h"
#include "heal_location.h"
#include "link.h"
#include "load_save.h"
#include "main.h"
#include "m4a.h"
#include "map_name_popup.h"
#include "menu.h"
#include "metatile_behavior.h"
#include "new_game.h"
#include "palette.h"
#include "play_time.h"
#include "random.h"
#include "roamer.h"
#include "rotating_gate.h"
#include "safari_zone.h"
#include "script.h"
#include "script_pokemon_80C4.h"
#include "secret_base.h"
#include "sound.h"
#include "start_menu.h"
#include "task.h"
#include "tileset_anim.h"
#include "time_events.h"
#include "tv.h"
#include "scanline_effect.h"
#include "wild_encounter.h"
#include "constants/map_types.h"
#include "constants/maps.h"
#include "constants/songs.h"
#include "constants/species.h"

#ifdef SAPPHIRE
#define LEGENDARY_MUSIC MUS_OOAME  // Heavy Rain
#else
#define LEGENDARY_MUSIC MUS_HIDERI // Drought
#endif

extern u8 gUnknown_020297ED;
extern u16 gTotalCameraPixelOffsetY;
extern u16 gTotalCameraPixelOffsetX;

extern u8 S_WhiteOut[];
extern u8 gUnknown_0819FC9F[];
extern u8 SingleBattleColosseum_EventScript_1A436F[];
extern u8 SingleBattleColosseum_EventScript_1A4379[];
extern u8 DoubleBattleColosseum_EventScript_1A4383[];
extern u8 DoubleBattleColosseum_EventScript_1A439E[];
extern u8 DoubleBattleColosseum_EventScript_1A43B9[];
extern u8 DoubleBattleColosseum_EventScript_1A43D4[];
extern u8 TradeCenter_EventScript_1A43F0[];
extern u8 TradeCenter_EventScript_1A43FA[];
extern u8 RecordCorner_EventScript_1A4418[];
extern u8 RecordCorner_EventScript_1A442D[];
extern u8 RecordCorner_EventScript_1A4442[];
extern u8 RecordCorner_EventScript_1A4457[];
extern u8 TradeRoom_ReadTrainerCard1[];
extern u8 TradeRoom_ReadTrainerCard2[];
extern u8 TradeRoom_TooBusyToNotice[];
extern u8 TradeRoom_PromptToCancelLink[];
extern u8 TradeRoom_TerminateLink[];
extern u8 gUnknown_081A4508[];

extern struct MapLayout * const gMapLayouts[];
extern struct MapHeader * const * const gMapGroups[];
extern s32 gMaxFlashLevel;

EWRAM_DATA struct WarpData gLastUsedWarp = {0};
EWRAM_DATA struct WarpData gWarpDestination = {0};
EWRAM_DATA struct WarpData gFixedDiveWarp = {0};
EWRAM_DATA struct WarpData gFixedHoleWarp = {0};
EWRAM_DATA struct InitialPlayerAvatarState gInitialPlayerAvatarState = {0};
EWRAM_DATA static u16 sAmbientCrySpecies = 0;
EWRAM_DATA static bool8 sIsAmbientCryWaterMon = FALSE;
EWRAM_DATA struct LinkPlayerEventObject gLinkPlayerEventObjects[4] = {0};

static u8 gUnknown_03000580[4];
static u16 (*gUnknown_03000584)(u32);
static u8 gUnknown_03000588;

u16 word_3004858;
extern void (*gFieldCallback)(void);
u8 gUnknown_03004860;
u8 gFieldLinkPlayerCount;

static u8 GetAdjustedInitialTransitionFlags(struct InitialPlayerAvatarState*, u16, u8);
static u8 GetAdjustedInitialDirection(struct InitialPlayerAvatarState*, u8, u16, u8);
static bool32 sub_805483C(u8*);
static void c2_80567AC(void);
static void InitOverworldGraphicsRegisters(void);

static const struct WarpData sDummyWarpData =
{
    .mapGroup = -1,
    .mapNum = -1,
    .warpId = -1,
    .x = -1,
    .y = -1,
};

static const u8 sUnusedData[] =
{
    0xB0, 0x04, 0x00, 0x00,
    0x10, 0x0E, 0x00, 0x00,
    0xB0, 0x04, 0x00, 0x00,
    0x60, 0x09, 0x00, 0x00,
    0x32, 0x00, 0x00, 0x00,
    0x50, 0x00, 0x00, 0x00,
    0xD4, 0xFF, 0xFF, 0xFF,
    0x2C, 0x00, 0x00, 0x00,
};

const struct UCoords32 gDirectionToVectors[] =
{
    { 0,  0}, // DIR_NONE
    { 0,  1}, // DIR_SOUTH
    { 0, -1}, // DIR_NORTH
    {-1,  0}, // DIR_WEST
    { 1,  0}, // DIR_EAST
    {-1,  1}, // DIR_SOUTHWEST
    { 1,  1}, // DIR_SOUTHEAST
    {-1, -1}, // DIR_NORTHWEST
    { 1, -1}, // DIR_NORTHEAST
};

static const struct ScanlineEffectParams sFlashEffectParams =
{
    (void *)REG_ADDR_WIN0H,
    ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | 1,
    1,
    0,
};

static u8 sub_8055C68(struct LinkPlayerEventObject *, struct EventObject *, u8);
static u8 sub_8055C88(struct LinkPlayerEventObject *, struct EventObject *, u8);
static u8 sub_8055C8C(struct LinkPlayerEventObject *, struct EventObject *, u8);

static u8 (*const gUnknown_082166A0[])(struct LinkPlayerEventObject *, struct EventObject *, u8) =
{
    sub_8055C68,
    sub_8055C88,
    sub_8055C8C,
};

static u8 sub_8055CAC(struct LinkPlayerEventObject *, struct EventObject *, u8);
static u8 sub_8055CB0(struct LinkPlayerEventObject *, struct EventObject *, u8);
static u8 sub_8055D18(struct LinkPlayerEventObject *, struct EventObject *, u8);

static u8 (*const gUnknown_082166AC[])(struct LinkPlayerEventObject *, struct EventObject *, u8) =
{
    sub_8055CAC,
    sub_8055CB0,
    sub_8055CB0,
    sub_8055CB0,
    sub_8055CB0,
    sub_8055CAC,
    sub_8055CAC,
    sub_8055D18,
    sub_8055D18,
    sub_8055D18,
    sub_8055D18,
};

static void sub_8055D30(struct LinkPlayerEventObject *, struct EventObject *);
static void sub_8055D38(struct LinkPlayerEventObject *, struct EventObject *);

static void (*const gUnknown_082166D8[])(struct LinkPlayerEventObject *, struct EventObject *) =
{
    sub_8055D30,
    sub_8055D38,
};


static void DoWhiteOut(void)
{
    ScriptContext2_RunNewScript(S_WhiteOut);
    gSaveBlock1.money /= 2;
    ScrSpecial_HealPlayerParty();
    Overworld_ResetStateAfterWhiteOut();
    Overworld_SetWarpDestToLastHealLoc();
    WarpIntoMap();
}

void Overworld_ResetStateAfterFly(void)
{
    ResetInitialPlayerAvatarState();
    FlagClear(FLAG_SYS_CYCLING_ROAD);
    FlagClear(FLAG_SYS_CRUISE_MODE);
    FlagClear(FLAG_SYS_SAFARI_MODE);
    FlagClear(FLAG_SYS_USE_STRENGTH);
    FlagClear(FLAG_SYS_USE_FLASH);
}

void Overworld_ResetStateAfterTeleport(void)
{
    ResetInitialPlayerAvatarState();
    FlagClear(FLAG_SYS_CYCLING_ROAD);
    FlagClear(FLAG_SYS_CRUISE_MODE);
    FlagClear(FLAG_SYS_SAFARI_MODE);
    FlagClear(FLAG_SYS_USE_STRENGTH);
    FlagClear(FLAG_SYS_USE_FLASH);
    ScriptContext2_RunNewScript(gUnknown_0819FC9F);
}

void Overworld_ResetStateAfterDigEscRope(void)
{
    ResetInitialPlayerAvatarState();
    FlagClear(FLAG_SYS_CYCLING_ROAD);
    FlagClear(FLAG_SYS_CRUISE_MODE);
    FlagClear(FLAG_SYS_SAFARI_MODE);
    FlagClear(FLAG_SYS_USE_STRENGTH);
    FlagClear(FLAG_SYS_USE_FLASH);
}

void Overworld_ResetStateAfterWhiteOut(void)
{
    ResetInitialPlayerAvatarState();
    FlagClear(FLAG_SYS_CYCLING_ROAD);
    FlagClear(FLAG_SYS_CRUISE_MODE);
    FlagClear(FLAG_SYS_SAFARI_MODE);
    FlagClear(FLAG_SYS_USE_STRENGTH);
    FlagClear(FLAG_SYS_USE_FLASH);
}

static void sub_805308C(void)
{
    FlagClear(FLAG_SYS_SAFARI_MODE);
    ChooseAmbientCrySpecies();
    ResetCyclingRoadChallengeData();
    UpdateLocationHistoryForRoamer();
    RoamerMoveToOtherLocationSet();
}

void ResetGameStats(void)
{
    s32 i;

    for (i = 0; i < NUM_GAME_STATS; i++)
        gSaveBlock1.gameStats[i] = 0;
}

void IncrementGameStat(u8 index)
{
    if (index < NUM_GAME_STATS)
    {
        if (gSaveBlock1.gameStats[index] < 0xFFFFFF)
            gSaveBlock1.gameStats[index]++;
        else
            gSaveBlock1.gameStats[index] = 0xFFFFFF;
    }
}

u32 GetGameStat(u8 stat)
{
    if (stat >= NUM_GAME_STATS)
        return 0;

    return gSaveBlock1.gameStats[stat];
}

void SetGameStat(u8 stat, u32 value)
{
    if (stat < NUM_GAME_STATS)
        gSaveBlock1.gameStats[stat] = value;
}

void LoadEventObjTemplatesFromHeader(void)
{
    // Clear event object templates
    CpuFill32(0, gSaveBlock1.eventObjectTemplates, sizeof(gSaveBlock1.eventObjectTemplates));

    // Copy map header events to save block
    CpuCopy32(gMapHeader.events->eventObjects,
              gSaveBlock1.eventObjectTemplates,
              gMapHeader.events->eventObjectCount * sizeof(struct EventObjectTemplate));
}

static void LoadSaveblockEventObjScripts(void)
{
    struct EventObjectTemplate *eventObjectTemplates = gSaveBlock1.eventObjectTemplates;
    s32 i;

    for (i = 0; i < 64; i++)
        eventObjectTemplates[i].script = gMapHeader.events->eventObjects[i].script;
}

void Overworld_SetEventObjTemplateCoords(u8 localId, s16 x, s16 y)
{
    s32 i;
    for (i = 0; i < 64; i++)
    {
        struct EventObjectTemplate *eventObjectTemplate = &gSaveBlock1.eventObjectTemplates[i];
        if (eventObjectTemplate->localId == localId)
        {
            eventObjectTemplate->x = x;
            eventObjectTemplate->y = y;
            return;
        }
    }
}

void Overworld_SetEventObjTemplateMovementType(u8 localId, u8 movementType)
{
    s32 i;

    for (i = 0; i < 64; i++)
    {
        struct EventObjectTemplate *eventObjectTemplate = &gSaveBlock1.eventObjectTemplates[i];
        if (eventObjectTemplate->localId == localId)
        {
            eventObjectTemplate->movementType = movementType;
            return;
        }
    }
}

static void mapdata_load_assets_to_gpu_and_full_redraw(void)
{
    move_tilemap_camera_to_upper_left_corner();
    copy_map_tileset1_tileset2_to_vram(gMapHeader.mapLayout);
    apply_map_tileset1_tileset2_palette(gMapHeader.mapLayout);
    DrawWholeMapView();
    cur_mapheader_run_tileset_funcs_after_some_cpuset();
}

static struct MapLayout *GetMapLayout(void)
{
    u16 mapLayoutId = gSaveBlock1.mapLayoutId;
    if (mapLayoutId)
        return gMapLayouts[mapLayoutId - 1];
    return NULL;
}

static void ApplyCurrentWarp(void)
{
    gLastUsedWarp = gSaveBlock1.location;
    gSaveBlock1.location = gWarpDestination;
    gFixedDiveWarp = sDummyWarpData;
    gFixedHoleWarp = sDummyWarpData;
}

static void SetWarpData(struct WarpData *warp, s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y)
{
    warp->mapGroup = mapGroup;
    warp->mapNum = mapNum;
    warp->warpId = warpId;
    warp->x = x;
    warp->y = y;
}

static bool32 IsDummyWarp(struct WarpData *warp)
{
    if (warp->mapGroup != -1)
        return FALSE;
    if (warp->mapNum != -1)
        return FALSE;
    if (warp->warpId != -1)
        return FALSE;
    if (warp->x != -1)
        return FALSE;
    if (warp->y != -1)
        return FALSE;
    return TRUE;
}

struct MapHeader *const Overworld_GetMapHeaderByGroupAndId(u16 mapGroup, u16 mapNum)
{
    return gMapGroups[mapGroup][mapNum];
}

struct MapHeader *const GetDestinationWarpMapHeader(void)
{
    return Overworld_GetMapHeaderByGroupAndId(gWarpDestination.mapGroup, gWarpDestination.mapNum);
}

static void LoadCurrentMapData(void)
{
    gMapHeader = *Overworld_GetMapHeaderByGroupAndId(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum);
    gSaveBlock1.mapLayoutId = gMapHeader.mapLayoutId;
    gMapHeader.mapLayout = GetMapLayout();
}

static void LoadSaveblockMapHeader(void)
{
    gMapHeader = *Overworld_GetMapHeaderByGroupAndId(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum);
    gMapHeader.mapLayout = GetMapLayout();
}

static void SetPlayerCoordsFromWarp(void)
{
    if (gSaveBlock1.location.warpId >= 0 && gSaveBlock1.location.warpId < gMapHeader.events->warpCount)
    {
        gSaveBlock1.pos.x = gMapHeader.events->warps[gSaveBlock1.location.warpId].x;
        gSaveBlock1.pos.y = gMapHeader.events->warps[gSaveBlock1.location.warpId].y;
    }
    else if (gSaveBlock1.location.x >= 0 && gSaveBlock1.location.y >= 0)
    {
        gSaveBlock1.pos.x = gSaveBlock1.location.x;
        gSaveBlock1.pos.y = gSaveBlock1.location.y;
    }
    else
    {
        gSaveBlock1.pos.x = gMapHeader.mapLayout->width / 2;
        gSaveBlock1.pos.y = gMapHeader.mapLayout->height / 2;
    }
}

void WarpIntoMap(void)
{
    ApplyCurrentWarp();
    LoadCurrentMapData();
    SetPlayerCoordsFromWarp();
}

void Overworld_SetWarpDestination(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y)
{
    SetWarpData(&gWarpDestination, mapGroup, mapNum, warpId, x, y);
}

void warp1_set_2(s8 mapGroup, s8 mapNum, s8 warpId)
{
    Overworld_SetWarpDestination(mapGroup, mapNum, warpId, -1, -1);
}

void saved_warp2_set(int unused, s8 mapGroup, s8 mapNum, s8 warpId)
{
    SetWarpData(&gSaveBlock1.warp2, mapGroup, mapNum, warpId, gSaveBlock1.pos.x, gSaveBlock1.pos.y);
}

void saved_warp2_set_2(int unused, s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y)
{
    SetWarpData(&gSaveBlock1.warp2, mapGroup, mapNum, warpId, x, y);
}

void copy_saved_warp2_bank_and_enter_x_to_warp1(u8 unused)
{
    gWarpDestination = gSaveBlock1.warp2;
}

void sub_8053538(u8 a1)
{
    const struct HealLocation *warp = GetHealLocation(a1);

    if (warp)
        Overworld_SetWarpDestination(warp->group, warp->map, -1, warp->x, warp->y);
}

void Overworld_SetWarpDestToLastHealLoc(void)
{
    gWarpDestination = gSaveBlock1.lastHealLocation;
}

void Overworld_SetHealLocationWarp(u8 healLocationId)
{
    const struct HealLocation *healLocation = GetHealLocation(healLocationId);

    if (healLocation != NULL)
        SetWarpData(&gSaveBlock1.lastHealLocation, healLocation->group, healLocation->map, -1, healLocation->x, healLocation->y);
}

void sub_80535C4(s16 a1, s16 a2)
{
    u8 currMapType = Overworld_GetMapTypeOfSaveblockLocation();
    u8 destMapType = GetMapTypeByGroupAndId(gWarpDestination.mapGroup, gWarpDestination.mapNum);
    if (is_map_type_1_2_3_5_or_6(currMapType) && is_map_type_1_2_3_5_or_6(destMapType) != TRUE)
        sub_805363C(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum, -1, a1 - 7, a2 - 6);
}

void sub_805363C(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y)
{
    SetWarpData(&gSaveBlock1.warp4, mapGroup, mapNum, warpId, x, y);
}

void sub_8053678(void)
{
    gWarpDestination = gSaveBlock1.warp4;
}

void SetFixedDiveWarp(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y)
{
    SetWarpData(&gFixedDiveWarp, mapGroup, mapNum, warpId, x, y);
}

static void SetFixedDiveWarpAsDestination(void)
{
    gWarpDestination = gFixedDiveWarp;
}

void SetFixedHoleWarp(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y)
{
    SetWarpData(&gFixedHoleWarp, mapGroup, mapNum, warpId, x, y);
}

void SetFixedHoleWarpAsDestination(s16 x, s16 y)
{
    if (IsDummyWarp(&gFixedHoleWarp) == TRUE)
        gWarpDestination = gLastUsedWarp;
    else
        Overworld_SetWarpDestination(gFixedHoleWarp.mapGroup, gFixedHoleWarp.mapNum, -1, x, y);
}

void sub_8053778(void)
{
    gWarpDestination = gSaveBlock1.warp1;
}

void unref_sub_8053790(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y)
{
    SetWarpData(&gSaveBlock1.warp1, mapGroup, mapNum, warpId, x, y);
}

void sub_80537CC(u8 a1)
{
    const struct HealLocation *warp = GetHealLocation(a1);
    if (warp)
        SetWarpData(&gSaveBlock1.warp1, warp->group, warp->map, -1, warp->x, warp->y);
}

void gpu_sync_bg_hide()
{
    gSaveBlock1.warp1 = gSaveBlock1.warp2;
}

struct MapConnection *GetMapConnection(u8 dir)
{
    s32 i;
    s32 count = gMapHeader.connections->count;
    struct MapConnection *connection = gMapHeader.connections->connections;

    if (connection == NULL)
        return NULL;

    for(i = 0; i < count; i++, connection++)
        if (connection->direction == dir)
            return connection;

    return NULL;
}

static bool8 SetDiveWarp(u8 direction, u16 x, u16 y)
{
    struct MapConnection *connection = GetMapConnection(direction);
    if (connection != NULL)
    {
        Overworld_SetWarpDestination(connection->mapGroup, connection->mapNum, -1, x, y);
    }
    else
    {
        mapheader_run_script_with_tag_x6();
        if (IsDummyWarp(&gFixedDiveWarp))
            return FALSE;

        SetFixedDiveWarpAsDestination();
    }

    return TRUE;
}

bool8 SetDiveWarpEmerge(u16 x, u16 y)
{
    return SetDiveWarp(CONNECTION_EMERGE, x, y);
}

bool8 SetDiveWarpDive(u16 x, u16 y)
{
    return SetDiveWarp(CONNECTION_DIVE, x, y);
}

void sub_80538F0(u8 mapGroup, u8 mapNum)
{
    s32 paletteIndex;

    Overworld_SetWarpDestination(mapGroup, mapNum, -1, -1, -1);
    sub_8053F0C();
    ApplyCurrentWarp();
    LoadCurrentMapData();
    LoadEventObjTemplatesFromHeader();
    ClearTempFieldEventData();
    ResetCyclingRoadChallengeData();
    RestartWildEncounterImmunitySteps();
    TryUpdateRandomTrainerRematches(mapGroup, mapNum);
    DoTimeBasedEvents();
    SetSav1WeatherFromCurrMapHeader();
    ChooseAmbientCrySpecies();
    SetDefaultFlashLevel();
    Overworld_ClearSavedMusic();
    mapheader_run_script_with_tag_x3();
    not_trainer_hill_battle_pyramid();
    sub_8056D38(gMapHeader.mapLayout);
    apply_map_tileset2_palette(gMapHeader.mapLayout);

    for (paletteIndex = 6; paletteIndex < 12; paletteIndex++)
        ApplyWeatherGammaShiftToPal(paletteIndex);

    sub_8072ED0();
    UpdateLocationHistoryForRoamer();
    RoamerMove();
    DoCurrentWeather();
    ResetFieldTasksArgs();
    mapheader_run_script_with_tag_x5();
    ShowMapNamePopup();
}

void sub_8053994(u32 a1)
{
    bool8 v2;
    bool8 v3;

    LoadCurrentMapData();
    LoadEventObjTemplatesFromHeader();
    v2 = is_map_type_1_2_3_5_or_6(gMapHeader.mapType);
    v3 = Overworld_MapTypeIsIndoors(gMapHeader.mapType);
    ClearTempFieldEventData();
    ResetCyclingRoadChallengeData();
    RestartWildEncounterImmunitySteps();
    TryUpdateRandomTrainerRematches(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum);
    if (a1 != 1)
        DoTimeBasedEvents();
    SetSav1WeatherFromCurrMapHeader();
    ChooseAmbientCrySpecies();
    if (v2)
        FlagClear(FLAG_SYS_USE_FLASH);
    SetDefaultFlashLevel();
    Overworld_ClearSavedMusic();
    mapheader_run_script_with_tag_x3();
    UpdateLocationHistoryForRoamer();
    RoamerMoveToOtherLocationSet();
    not_trainer_hill_battle_pyramid();
    if (a1 != 1 && v3)
    {
        UpdateTVScreensOnMap(gUnknown_03004870.width, gUnknown_03004870.height);
        sub_80BBCCC(1);
    }
}

void ResetInitialPlayerAvatarState(void)
{
    gInitialPlayerAvatarState.direction = DIR_SOUTH;
    gInitialPlayerAvatarState.transitionFlags = PLAYER_AVATAR_FLAG_ON_FOOT;
}

void StoreInitialPlayerAvatarState(void)
{
    gInitialPlayerAvatarState.direction = GetPlayerFacingDirection();

    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_MACH_BIKE))
        gInitialPlayerAvatarState.transitionFlags = PLAYER_AVATAR_FLAG_MACH_BIKE;
    else if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_ACRO_BIKE))
        gInitialPlayerAvatarState.transitionFlags = PLAYER_AVATAR_FLAG_ACRO_BIKE;
    else if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
        gInitialPlayerAvatarState.transitionFlags = PLAYER_AVATAR_FLAG_SURFING;
    else if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_UNDERWATER))
        gInitialPlayerAvatarState.transitionFlags = PLAYER_AVATAR_FLAG_UNDERWATER;
    else
        gInitialPlayerAvatarState.transitionFlags = PLAYER_AVATAR_FLAG_ON_FOOT;
}

static struct InitialPlayerAvatarState *GetInitialPlayerAvatarState(void)
{
    struct InitialPlayerAvatarState playerStruct;
    u8 mapType = Overworld_GetMapTypeOfSaveblockLocation();
    u16 metatileBehavior = GetCenterScreenMetatileBehavior();
    u8 transitionFlags = GetAdjustedInitialTransitionFlags(&gInitialPlayerAvatarState, metatileBehavior, mapType);
    playerStruct.transitionFlags = transitionFlags;
    playerStruct.direction = GetAdjustedInitialDirection(&gInitialPlayerAvatarState, transitionFlags, metatileBehavior, mapType);
    gInitialPlayerAvatarState = playerStruct;
    return &gInitialPlayerAvatarState;
}

static u8 GetAdjustedInitialTransitionFlags(struct InitialPlayerAvatarState *playerStruct, u16 metatileBehavior, u8 mapType)
{
    if (mapType != MAP_TYPE_INDOOR && FlagGet(FLAG_SYS_CRUISE_MODE))
        return PLAYER_AVATAR_FLAG_ON_FOOT;
    if (mapType == MAP_TYPE_UNDERWATER)
        return PLAYER_AVATAR_FLAG_UNDERWATER;
    if (MetatileBehavior_IsSurfableWaterOrUnderwater(metatileBehavior) == TRUE)
        return PLAYER_AVATAR_FLAG_SURFING;
    if (Overworld_IsBikingAllowed() != TRUE)
        return PLAYER_AVATAR_FLAG_ON_FOOT;
    if (playerStruct->transitionFlags == PLAYER_AVATAR_FLAG_MACH_BIKE)
        return PLAYER_AVATAR_FLAG_MACH_BIKE;
    if (playerStruct->transitionFlags != PLAYER_AVATAR_FLAG_ACRO_BIKE)
        return PLAYER_AVATAR_FLAG_ON_FOOT;
    return PLAYER_AVATAR_FLAG_ACRO_BIKE;
}

static u8 GetAdjustedInitialDirection(struct InitialPlayerAvatarState *playerStruct, u8 transitionFlags, u16 metatileBehavior, u8 mapType)
{
    if (FlagGet(FLAG_SYS_CRUISE_MODE) && mapType == MAP_TYPE_6)
        return DIR_EAST;
    if (MetatileBehavior_IsDeepSouthWarp(metatileBehavior) == TRUE)
        return DIR_NORTH;
    if (MetatileBehavior_IsNonAnimDoor(metatileBehavior) == TRUE || MetatileBehavior_IsDoor(metatileBehavior) == TRUE)
        return DIR_SOUTH;
    if (MetatileBehavior_IsSouthArrowWarp(metatileBehavior) == TRUE)
        return DIR_NORTH;
    if (MetatileBehavior_IsNorthArrowWarp(metatileBehavior) == TRUE)
        return DIR_SOUTH;
    if (MetatileBehavior_IsWestArrowWarp(metatileBehavior) == TRUE)
        return DIR_EAST;
    if (MetatileBehavior_IsEastArrowWarp(metatileBehavior) == TRUE)
        return DIR_WEST;
    if ((playerStruct->transitionFlags == PLAYER_AVATAR_FLAG_UNDERWATER && transitionFlags == PLAYER_AVATAR_FLAG_SURFING)
     || (playerStruct->transitionFlags == PLAYER_AVATAR_FLAG_SURFING && transitionFlags == PLAYER_AVATAR_FLAG_UNDERWATER))
        return playerStruct->direction;
    if (MetatileBehavior_IsLadder(metatileBehavior) == TRUE)
        return playerStruct->direction;
    return DIR_SOUTH;
}

u16 GetCenterScreenMetatileBehavior(void)
{
    return MapGridGetMetatileBehaviorAt(gSaveBlock1.pos.x + 7, gSaveBlock1.pos.y + 7);
}

bool32 Overworld_IsBikingAllowed(void)
{
    // is player in cycling road entrance?
    if (gSaveBlock1.location.mapGroup == MAP_GROUP(ROUTE110_SEASIDE_CYCLING_ROAD_SOUTH_ENTRANCE)
     && (gSaveBlock1.location.mapNum == MAP_NUM(ROUTE110_SEASIDE_CYCLING_ROAD_SOUTH_ENTRANCE)
      || gSaveBlock1.location.mapNum == MAP_NUM(ROUTE110_SEASIDE_CYCLING_ROAD_NORTH_ENTRANCE)))
        return TRUE;

    // is player indoor, in a secret base, or underwater?
    if (gMapHeader.mapType == MAP_TYPE_INDOOR)
        return FALSE;
    if (gMapHeader.mapType == MAP_TYPE_SECRET_BASE)
        return FALSE;
    if (gMapHeader.mapType == MAP_TYPE_UNDERWATER)
        return FALSE;

    // Thou shalt not bike on the sacred resting grounds of Kyogre/Groudon.
    if (gSaveBlock1.location.mapGroup == MAP_GROUP(SEAFLOOR_CAVERN_ROOM9)
     && gSaveBlock1.location.mapNum == MAP_NUM(SEAFLOOR_CAVERN_ROOM9))
        return FALSE;
    if (gSaveBlock1.location.mapGroup == MAP_GROUP(CAVE_OF_ORIGIN_B4F)
     && gSaveBlock1.location.mapNum == MAP_NUM(CAVE_OF_ORIGIN_B4F))
        return FALSE;

    return TRUE;
}

void SetDefaultFlashLevel(void)
{
    if (!gMapHeader.cave)
        gSaveBlock1.flashLevel = 0;
    else if (FlagGet(FLAG_SYS_USE_FLASH))
        gSaveBlock1.flashLevel = 1;
    else
        gSaveBlock1.flashLevel = gMaxFlashLevel;
}

void Overworld_SetFlashLevel(s32 flashLevel)
{
    if (flashLevel < 0 || flashLevel > gMaxFlashLevel)
        flashLevel = 0;
    gSaveBlock1.flashLevel = flashLevel;
}

u8 Overworld_GetFlashLevel(void)
{
    return gSaveBlock1.flashLevel;
}

void sub_8053D14(u16 mapLayoutId)
{
    gSaveBlock1.mapLayoutId = mapLayoutId;
    gMapHeader.mapLayout = GetMapLayout();
}

static bool16 ShouldLegendaryMusicPlayAtLocation(struct WarpData *warp)
{
    if (!FlagGet(FLAG_SYS_WEATHER_CTRL))
        return FALSE;
    if (warp->mapGroup == 0)
    {
        switch (warp->mapNum)
        {
        case MAP_NUM(LILYCOVE_CITY):
        case MAP_NUM(MOSSDEEP_CITY):
        case MAP_NUM(SOOTOPOLIS_CITY):
        case MAP_NUM(EVER_GRANDE_CITY):
            return TRUE;
        case MAP_NUM(ROUTE124):
        case MAP_NUM(ROUTE125):
        case MAP_NUM(ROUTE126):
        case MAP_NUM(ROUTE127):
        case MAP_NUM(ROUTE128):
            return TRUE;
        }
    }
    return FALSE;
}

static bool16 IsInfiltratedWeatherInstitute(struct WarpData *warp)
{
    if (VarGet(VAR_WEATHER_INSTITUTE_STATE))
        return FALSE;
    if (warp->mapGroup != MAP_GROUP(ROUTE119_WEATHER_INSTITUTE_1F))
        return FALSE;
    if (warp->mapNum == MAP_NUM(ROUTE119_WEATHER_INSTITUTE_1F)
     || warp->mapNum == MAP_NUM(ROUTE119_WEATHER_INSTITUTE_2F))
        return TRUE;
    return FALSE;
}

static u16 GetLocationMusic(struct WarpData *warp)
{
    if (ShouldLegendaryMusicPlayAtLocation(warp) == TRUE)
        return LEGENDARY_MUSIC;
    else if (IsInfiltratedWeatherInstitute(warp) == TRUE)
        return MUS_TOZAN;
    else
        return Overworld_GetMapHeaderByGroupAndId(warp->mapGroup, warp->mapNum)->music;
}

u16 GetCurrLocationDefaultMusic(void)
{
    u16 music;

    // Play the desert music only when the sandstorm is active on Route 111.
    if (gSaveBlock1.location.mapGroup == MAP_GROUP(ROUTE111)
     && gSaveBlock1.location.mapNum == MAP_NUM(ROUTE111)
     && GetSav1Weather() == 8)
        return MUS_ASHROAD;

    music = GetLocationMusic(&gSaveBlock1.location);
    if (music != 0x7FFF)
    {
        return music;
    }
    else
    {
        if (gSaveBlock1.pos.x < 24)
            return MUS_DOORO_X1;
        else
            return MUS_GRANROAD;
    }
}

u16 GetWarpDestinationMusic(void)
{
    u16 music = GetLocationMusic(&gWarpDestination);
    if (music != 0x7FFF)
    {
        return music;
    }
    else
    {
        if (gSaveBlock1.location.mapGroup == MAP_GROUP(MAUVILLE_CITY)
         && gSaveBlock1.location.mapNum == MAP_NUM(MAUVILLE_CITY))
            return MUS_DOORO_X1;
        else
            return MUS_GRANROAD;
    }
}

void Overworld_ResetMapMusic(void)
{
    ResetMapMusic();
}

void Overworld_PlaySpecialMapMusic(void)
{
    u16 music = GetCurrLocationDefaultMusic();

    if (music != LEGENDARY_MUSIC)
    {
        if (gSaveBlock1.savedMusic)
            music = gSaveBlock1.savedMusic;
        else if (Overworld_GetMapTypeOfSaveblockLocation() == MAP_TYPE_UNDERWATER)
            music = MUS_DEEPDEEP;
        else if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
            music = MUS_NAMINORI;
    }

    if (music != GetCurrentMapMusic())
        PlayNewMapMusic(music);
}

void Overworld_SetSavedMusic(u16 songNum)
{
    gSaveBlock1.savedMusic = songNum;
}

void Overworld_ClearSavedMusic(void)
{
    gSaveBlock1.savedMusic = 0;
}

void sub_8053F0C(void)
{
    if (FlagGet(FLAG_SPECIAL_FLAG_1) != TRUE)
    {
        u16 newMusic = GetWarpDestinationMusic();
        u16 currentMusic = GetCurrentMapMusic();
        if (newMusic != LEGENDARY_MUSIC)
        {
            if (currentMusic == MUS_DEEPDEEP || currentMusic == MUS_NAMINORI)
                return;
            if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
                newMusic = MUS_NAMINORI;
        }
        if (newMusic != currentMusic)
        {
            if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE))
                FadeOutAndFadeInNewMapMusic(newMusic, 4, 4);
            else
                FadeOutAndPlayNewMapMusic(newMusic, 8);
        }
    }
}

void Overworld_ChangeMusicToDefault(void)
{
    u16 currentMusic = GetCurrentMapMusic();
    if (currentMusic != GetCurrLocationDefaultMusic())
        FadeOutAndPlayNewMapMusic(GetCurrLocationDefaultMusic(), 8);
}

void Overworld_ChangeMusicTo(u16 newMusic)
{
    u16 currentMusic = GetCurrentMapMusic();
    if (currentMusic != newMusic && currentMusic != LEGENDARY_MUSIC)
        FadeOutAndPlayNewMapMusic(newMusic, 8);
}

u8 GetMapMusicFadeoutSpeed(void)
{
    struct MapHeader *mapHeader = GetDestinationWarpMapHeader();
    if (Overworld_MapTypeIsIndoors(mapHeader->mapType) == TRUE)
        return 2;
    else
        return 4;
}

void TryFadeOutOldMapMusic(void)
{
    u16 music = GetWarpDestinationMusic();
    if (FlagGet(FLAG_SPECIAL_FLAG_1) != TRUE && music != GetCurrentMapMusic())
    {
        u8 speed = GetMapMusicFadeoutSpeed();
        FadeOutMapMusic(speed);
    }
}

bool8 BGMusicStopped(void)
{
    return IsNotWaitingForBGMStop();
}

void Overworld_FadeOutMapMusic(void)
{
    FadeOutMapMusic(4);
}

static void PlayAmbientCry(void)
{
    s16 x, y;
    s8 pan;
    s8 volume;

    PlayerGetDestCoords(&x, &y);
    if (sIsAmbientCryWaterMon == TRUE
     && !MetatileBehavior_IsSurfableWaterOrUnderwater(MapGridGetMetatileBehaviorAt(x, y)))
        return;
    pan = (Random() % 88) + 212;
    volume = (Random() % 30) + 50;
    PlayCry2(sAmbientCrySpecies, pan, volume, 1);
}

void UpdateAmbientCry(s16 *state, u16 *delayCounter)
{
    switch (*state)
    {
    case 0:
        if (sAmbientCrySpecies == SPECIES_NONE)
            *state = 4;
        else
            *state = 1;
        break;
    case 1:
        *delayCounter = (Random() % 2400) + 1200;
        *state = 3;
        break;
    case 2:
        *delayCounter = (Random() % 1200) + 1200;
        *state = 3;
        break;
    case 3:
        (*delayCounter)--;
        if (*delayCounter == 0)
        {
            PlayAmbientCry();
            *state = 2;
        }
        break;
    case 4:
        break;
    }
}

void ChooseAmbientCrySpecies(void)
{
    if ((gSaveBlock1.location.mapGroup == MAP_GROUP(ROUTE130)
     && gSaveBlock1.location.mapNum == MAP_NUM(ROUTE130))
     && !IsMirageIslandPresent())
    {
        // Only play water pokemon cries on this route
        // when Mirage Island is not present
        sIsAmbientCryWaterMon = TRUE;
        sAmbientCrySpecies = GetLocalWaterMon();
    }
    else
    {
        sAmbientCrySpecies = GetLocalWildMon(&sIsAmbientCryWaterMon);
    }
}

u8 GetMapTypeByGroupAndId(s8 mapGroup, s8 mapNum)
{
    return Overworld_GetMapHeaderByGroupAndId(mapGroup, mapNum)->mapType;
}

u8 GetMapTypeByWarpData(struct WarpData *warp)
{
    return GetMapTypeByGroupAndId(warp->mapGroup, warp->mapNum);
}

u8 Overworld_GetMapTypeOfSaveblockLocation(void)
{
    return GetMapTypeByWarpData(&gSaveBlock1.location);
}

u8 GetLastUsedWarpMapType(void)
{
    return GetMapTypeByWarpData(&gLastUsedWarp);
}

bool8 is_map_type_1_2_3_5_or_6(u8 mapType)
{
    if (mapType == MAP_TYPE_ROUTE
     || mapType == MAP_TYPE_TOWN
     || mapType == MAP_TYPE_UNDERWATER
     || mapType == MAP_TYPE_CITY
     || mapType == MAP_TYPE_6)
        return TRUE;
    else
        return FALSE;
}

bool8 Overworld_MapTypeAllowsTeleportAndFly(u8 mapType)
{
    if (mapType == MAP_TYPE_ROUTE
     || mapType == MAP_TYPE_TOWN
     || mapType == MAP_TYPE_6
     || mapType == MAP_TYPE_CITY)
        return TRUE;
    else
        return FALSE;
}

bool8 Overworld_MapTypeIsIndoors(u8 mapType)
{
    if (mapType == MAP_TYPE_INDOOR
     || mapType == MAP_TYPE_SECRET_BASE)
        return TRUE;
    else
        return FALSE;
}

u8 unref_sub_8054260(void)
{
    return Overworld_GetMapHeaderByGroupAndId(gSaveBlock1.warp2.mapGroup, gSaveBlock1.warp2.mapNum)->regionMapSectionId;
}

u8 sav1_map_get_name(void)
{
    return Overworld_GetMapHeaderByGroupAndId(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum)->regionMapSectionId;
}

u8 sav1_map_get_battletype(void)
{
    return Overworld_GetMapHeaderByGroupAndId(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum)->battleType;
}

#if DEBUG

void debug_sub_8076B68(void);

void debug_sub_80589D8(void);

void debug_sub_8058A50(void);

void CB2_InitTestMenu(void)
{
    m4aSoundVSyncOff();
    SetVBlankCallback(NULL);
    DmaFill32(3, 0, (void *) VRAM, VRAM_SIZE);
    DmaFill32(3, 0, (void *) PLTT, PLTT_SIZE);
    ResetPaletteFade();
    ResetSpriteData();
    ResetTasks();
    ScanlineEffect_Stop();
    Text_LoadWindowTemplate(&gMenuTextWindowTemplate);
    InitMenuWindow(&gMenuTextWindowTemplate);
    debug_sub_8076B68();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 16, 0, RGB(0, 0, 0));
    REG_IE |= 1;
    REG_DISPCNT = DISPCNT_OBJ_ON | DISPCNT_BG0_ON | DISPCNT_OBJ_1D_MAP;
    m4aSoundVSyncOn();
    SetVBlankCallback(debug_sub_8058A50);
    m4aSongNumStart(0x19D);
    SetMainCallback2(debug_sub_80589D8);
}

void debug_sub_80589D8(void)
{
    if (UpdatePaletteFade())
        return;

    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
}

void debug_sub_80589F4(void)
{
    if (UpdatePaletteFade())
        return;

    SetVBlankCallback(NULL);

    DmaFill32(3, 0, (void *) VRAM, VRAM_SIZE);
    DmaFill32(3, 0, (void *) PLTT, PLTT_SIZE);

    SetMainCallback2(gMain.savedCallback);
}

void debug_sub_8058A50(void)
{
    ProcessSpriteCopyRequests();
    LoadOam();
    TransferPlttBuffer();
}

#endif

void ResetSafariZoneFlag_(void)
{
    ResetSafariZoneFlag();
}

bool32 is_c1_link_related_active(void)
{
    if (gMain.callback1 == sub_8055354)
        return TRUE;
    else
        return FALSE;
}

void c1_overworld_normal(u16 newKeys, u16 heldKeys)
{
    struct FieldInput fieldInput;

    sub_8059204();
    ClearPlayerFieldInput(&fieldInput);
    GetPlayerFieldInput(&fieldInput, newKeys, heldKeys);
    if (!ScriptContext2_IsEnabled())
    {
        if (ProcessPlayerFieldInput(&fieldInput) == 1)
        {
            ScriptContext2_Enable();
            HideMapNamePopup();
        }
        else
        {
            player_step(fieldInput.dpadDirection, newKeys, heldKeys);
        }
    }
}

void c1_overworld(void)
{
    if (gMain.callback2 == c2_overworld)
        c1_overworld_normal(gMain.newKeys, gMain.heldKeys);
}

void OverworldBasic(void)
{
    ScriptContext2_RunScript();
    RunTasks();
    AnimateSprites();
    CameraUpdate();
    UpdateCameraPanning();
    BuildOamBuffer();
    UpdatePaletteFade();
    sub_8072EDC();
}

// This CB2 is used when starting
void CB2_OverworldBasic(void)
{
    OverworldBasic();
}

void c2_overworld(void)
{
    int fading = (gPaletteFade.active != 0);
    if (fading)
        SetVBlankCallback(NULL);
    OverworldBasic();
    if (fading)
        SetFieldVBlankCallback();
}

void set_callback1(MainCallback cb)
{
    gMain.callback1 = cb;
}

void sub_80543DC(u16 (*a1)(u32))
{
    gUnknown_03000584 = a1;
}

static void RunFieldCallback(void)
{
    if (gFieldCallback != NULL)
        gFieldCallback();
    else
        mapldr_default();
    gFieldCallback = NULL;
}

void CB2_NewGame(void)
{
    FieldClearVBlankHBlankCallbacks();
    StopMapMusic();
    ResetSafariZoneFlag_();
    NewGameInitData();
    ResetInitialPlayerAvatarState();
    PlayTimeCounter_Start();
    ScriptContext1_Init();
    ScriptContext2_Disable();
    gFieldCallback = ExecuteTruckSequence;
    do_load_map_stuff_loop(&gMain.state);
    SetFieldVBlankCallback();
    set_callback1(c1_overworld);
    SetMainCallback2(c2_overworld);
}

#if DEBUG

void debug_sub_8058C00(void)
{
    FieldClearVBlankHBlankCallbacks();
    StopMapMusic();
    ResetSafariZoneFlag_();
    ResetInitialPlayerAvatarState();
    PlayTimeCounter_Start();
    ScriptContext1_Init();
    ScriptContext2_Disable();

    if (gMain.heldKeys & R_BUTTON)
        gFieldCallback = ExecuteTruckSequence;
    else
        gFieldCallback = sub_8080B60;

    do_load_map_stuff_loop(&gMain.state);
    SetFieldVBlankCallback();
    set_callback1(c1_overworld);
    SetMainCallback2(c2_overworld);
}

#endif

void CB2_WhiteOut(void)
{
    u8 val;
    gMain.state++;
    if (gMain.state >= 120)
    {
        FieldClearVBlankHBlankCallbacks();
        StopMapMusic();
        ResetSafariZoneFlag_();
        DoWhiteOut();
        ResetInitialPlayerAvatarState();
        ScriptContext1_Init();
        ScriptContext2_Disable();
        gFieldCallback = sub_8080B60;
        val = 0;
        do_load_map_stuff_loop(&val);
        SetFieldVBlankCallback();
        set_callback1(c1_overworld);
        SetMainCallback2(c2_overworld);
    }
}

void CB2_LoadMap(void)
{
    FieldClearVBlankHBlankCallbacks();
    ScriptContext1_Init();
    ScriptContext2_Disable();
    set_callback1(NULL);
    SetMainCallback2(sub_810CC80);
    gMain.savedCallback = CB2_LoadMap2;
}

void CB2_LoadMap2(void)
{
    do_load_map_stuff_loop(&gMain.state);
    SetFieldVBlankCallback();
    set_callback1(c1_overworld);
    SetMainCallback2(c2_overworld);
}

void sub_8054534(void)
{
    if (!gMain.state)
    {
        FieldClearVBlankHBlankCallbacks();
        ScriptContext1_Init();
        ScriptContext2_Disable();
        set_callback1(NULL);
    }
    if (sub_805493C(&gMain.state, 1))
    {
        SetFieldVBlankCallback();
        set_callback1(c1_overworld);
        SetMainCallback2(c2_overworld);
    }
}

void sub_8054588(void)
{
    FieldClearVBlankHBlankCallbacks();
    gFieldCallback = sub_8080AC4;
    SetMainCallback2(c2_80567AC);
}

static void c2_80567AC(void)
{
    if (sub_805483C(&gMain.state))
    {
        SetFieldVBlankCallback();
        set_callback1(sub_8055354);
        sub_80543DC(sub_8055390);
        SetMainCallback2(c2_overworld);
    }
}

void c2_exit_to_overworld_2_switch(void)
{
    if (is_c1_link_related_active() == TRUE)
    {
        SetMainCallback2(c2_exit_to_overworld_2_link);
    }
    else
    {
        FieldClearVBlankHBlankCallbacks();
        SetMainCallback2(c2_exit_to_overworld_2_local);
    }
}

void c2_exit_to_overworld_2_local(void)
{
    if (sub_8054A4C(&gMain.state))
    {
        SetFieldVBlankCallback();
        SetMainCallback2(c2_overworld);
    }
}

void c2_exit_to_overworld_2_link(void)
{
    if (!sub_8055870() && sub_8054A9C(&gMain.state))
        SetMainCallback2(c2_overworld);
}

void sub_805465C(void)
{
    FieldClearVBlankHBlankCallbacks();
    StopMapMusic();
    sub_8054F70();
    set_callback1(sub_8055354);
    sub_80543DC(sub_8055390);
    gFieldCallback = sub_8080A3C;
    ScriptContext1_Init();
    ScriptContext2_Disable();
    c2_exit_to_overworld_2_switch();
}

void c2_exit_to_overworld_1_sub_8080DEC(void)
{
    FieldClearVBlankHBlankCallbacks();
    gFieldCallback = sub_8080DEC;
    c2_exit_to_overworld_2_switch();
}

void sub_80546B8(void)
{
    FieldClearVBlankHBlankCallbacks();
    gFieldCallback = sub_80809B0;
    c2_exit_to_overworld_2_switch();
}

void c2_exit_to_overworld_1_continue_scripts_restart_music(void)
{
    FieldClearVBlankHBlankCallbacks();
    gFieldCallback = sub_8080990;
    c2_exit_to_overworld_2_switch();
}

void sub_80546F0(void)
{
    FieldClearVBlankHBlankCallbacks();
    gFieldCallback = sub_8080B60;
    c2_exit_to_overworld_2_switch();
}

void sub_805470C(void)
{
    if (gMapHeader.flags == 1 && sub_80BBB24() == 1)
        ShowMapNamePopup();
    sub_8080B60();
}

void CB2_ContinueSavedGame(void)
{
    FieldClearVBlankHBlankCallbacks();
    StopMapMusic();
#if DEBUG
    if (gMain.heldKeys & R_BUTTON)
        gUnknown_020297ED = TRUE;
#endif
    ResetSafariZoneFlag_();
    LoadSaveblockMapHeader();
    LoadSaveblockEventObjScripts();
    UnfreezeEventObjects();
    DoTimeBasedEvents();
    sub_805308C();
    sub_8055FC0();
    PlayTimeCounter_Start();
    ScriptContext1_Init();
    ScriptContext2_Disable();
    if (GetSecretBase2Field_9() == 1)
    {
        ClearSecretBase2Field_9();
        sub_8053778();
        WarpIntoMap();
        SetMainCallback2(CB2_LoadMap);
    }
    else
    {
        gFieldCallback = sub_805470C;
        set_callback1(c1_overworld);
        c2_exit_to_overworld_2_switch();
    }
}

void FieldClearVBlankHBlankCallbacks(void)
{
    u16 savedIme = REG_IME;
    REG_IME = 0;
    REG_IE &= ~INTR_FLAG_HBLANK;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = savedIme;
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
}

void SetFieldVBlankCallback(void)
{
    SetVBlankCallback(VBlankCB_Field);
}

void VBlankCB_Field(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    ScanlineEffect_InitHBlankDmaTransfer();
    sub_8057A58();
    TransferPlttBuffer();
    sub_8072E74();
}

static void InitCurrentFlashLevelScanlineEffect(void)
{
    u8 flashLevel = Overworld_GetFlashLevel();
    if (flashLevel)
    {
        WriteFlashScanlineEffectBuffer(flashLevel);
        ScanlineEffect_SetParams(sFlashEffectParams);
    }
}

static bool32 sub_805483C(u8 *state)
{
    switch (*state)
    {
    case 0:
        FieldClearVBlankHBlankCallbacks();
        ScriptContext1_Init();
        ScriptContext2_Disable();
        sub_8054F70();
        sub_8054BA8();
        (*state)++;
        break;
    case 1:
        sub_8053994(1);
        (*state)++;
        break;
    case 2:
        sub_8054D4C(1);
        (*state)++;
        break;
    case 3:
        sub_8054E98();
        sub_8054D90();
        sub_8054EC8();
        sub_8054E60();
        (*state)++;
        break;
    case 4:
        InitCurrentFlashLevelScanlineEffect();
        InitOverworldGraphicsRegisters();
        Text_LoadWindowTemplate(&gWindowTemplate_81E6C3C);
        InitMenuWindow(&gMenuTextWindowTemplate);
        (*state)++;
        break;
    case 5:
        move_tilemap_camera_to_upper_left_corner();
        (*state)++;
        break;
    case 6:
        sub_8056D28(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 7:
        sub_8056D38(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 8:
        apply_map_tileset1_tileset2_palette(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 9:
        DrawWholeMapView();
        (*state)++;
        break;
    case 10:
        cur_mapheader_run_tileset_funcs_after_some_cpuset();
        (*state)++;
        break;
    case 12:
        RunFieldCallback();
        (*state)++;
        break;
    case 11:
        (*state)++;
        break;
    case 13:
        return 1;
    }
    return 0;
}

bool32 sub_805493C(u8 *state, u32 a2)
{
    switch (*state)
    {
    case 0:
        FieldClearVBlankHBlankCallbacks();
        sub_8053994(a2);
        (*state)++;
        break;
    case 1:
        sub_8054BA8();
        (*state)++;
        break;
    case 2:
        sub_8054D4C(a2);
        (*state)++;
        break;
    case 3:
        mli4_mapscripts_and_other();
        sub_8054E34();
        (*state)++;
        break;
    case 4:
        InitCurrentFlashLevelScanlineEffect();
        InitOverworldGraphicsRegisters();
        Text_LoadWindowTemplate(&gWindowTemplate_81E6C3C);
        InitMenuWindow(&gMenuTextWindowTemplate);
        (*state)++;
        break;
    case 5:
        move_tilemap_camera_to_upper_left_corner();
        (*state)++;
        break;
    case 6:
        sub_8056D28(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 7:
        sub_8056D38(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 8:
        apply_map_tileset1_tileset2_palette(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 9:
        DrawWholeMapView();
        (*state)++;
        break;
    case 10:
        cur_mapheader_run_tileset_funcs_after_some_cpuset();
        (*state)++;
        break;
    case 11:
        if (gMapHeader.flags == 1 && sub_80BBB24() == 1)
            ShowMapNamePopup();
        (*state)++;
        break;
    case 12:
        RunFieldCallback();
        (*state)++;
        break;
    case 13:
        return 1;
    }
    return 0;
}

bool32 sub_8054A4C(u8 *state)
{
    switch (*state)
    {
    case 0:
        sub_8054BA8();
        sub_8054D4C(0);
        sub_8054E20();
        sub_8054E34();
        (*state)++;
        break;
    case 1:
        sub_8054C2C();
        (*state)++;
        break;
    case 2:
        RunFieldCallback();
        (*state)++;
        break;
    case 3:
        return 1;
    }
    return 0;
}

bool32 sub_8054A9C(u8 *state)
{
    switch (*state)
    {
    case 0:
        FieldClearVBlankHBlankCallbacks();
        sub_8054BA8();
        (*state)++;
        break;
    case 1:
        sub_8054D4C(1);
        (*state)++;
        break;
    case 2:
        sub_8054F48();
        sub_8054E20();
        sub_8054E7C();
        (*state)++;
        break;
    case 3:
        InitCurrentFlashLevelScanlineEffect();
        InitOverworldGraphicsRegisters();
        Text_LoadWindowTemplate(&gWindowTemplate_81E6C3C);
        InitMenuWindow(&gMenuTextWindowTemplate);
        (*state)++;
        break;
    case 4:
        move_tilemap_camera_to_upper_left_corner();
        (*state)++;
        break;
    case 5:
        sub_8056D28(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 6:
        sub_8056D38(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 7:
        apply_map_tileset1_tileset2_palette(gMapHeader.mapLayout);
        (*state)++;
        break;
    case 8:
        DrawWholeMapView();
        (*state)++;
        break;
    case 9:
        cur_mapheader_run_tileset_funcs_after_some_cpuset();
        (*state)++;
        break;
    case 12:
        RunFieldCallback();
        (*state)++;
        break;
    case 10:
    case 11:
        (*state)++;
        break;
    case 13:
        SetFieldVBlankCallback();
        (*state)++;
        return 1;
    }
    return 0;
}

void do_load_map_stuff_loop(u8 *a1)
{
    while (!sub_805493C(a1, 0))
        ;
}

void sub_8054BA8(void)
{
    REG_DISPCNT = 0;

    ScanlineEffect_Stop();

    DmaClear16(3, PLTT + 2, PLTT_SIZE - 2);
    DmaFill16Large(3, 0, (void *)(VRAM + 0x0), 0x18000, 0x1000);
    ResetOamRange(0, 128);
    LoadOam();
}

void sub_8054C2C(void)
{
    InitCurrentFlashLevelScanlineEffect();
    InitOverworldGraphicsRegisters();
    Text_LoadWindowTemplate(&gWindowTemplate_81E6C3C);
    InitMenuWindow(&gMenuTextWindowTemplate);
    mapdata_load_assets_to_gpu_and_full_redraw();
}

static void InitOverworldGraphicsRegisters(void)
{
    REG_MOSAIC = 0;
    REG_WININ = 7967;
    REG_WINOUT = 257;
    REG_WIN0H = 255;
    REG_WIN0V = 255;
    REG_WIN1H = -1;
    REG_WIN1V = -1;
    REG_BLDCNT = gUnknown_081E29E0[1] | gUnknown_081E29E0[2] | gUnknown_081E29E0[3] | 0x1040;
    REG_BLDALPHA = 1805;
    *gBGHOffsetRegs[0] = 0;
    *gBGVOffsetRegs[0] = 0;
    *gBGControlRegs[0] = 0;
    *gBGHOffsetRegs[1] = 0;
    *gBGVOffsetRegs[1] = 0;
    *gBGControlRegs[1] = 7489;
    *gBGHOffsetRegs[2] = 0;
    *gBGVOffsetRegs[2] = 0;
    *gBGControlRegs[2] = 7234;
    *gBGHOffsetRegs[3] = 0;
    *gBGVOffsetRegs[3] = 0;
    *gBGControlRegs[3] = 7747;
    REG_DISPCNT = gUnknown_081E29D8[1] | 0x7060 | gUnknown_081E29D8[2] | gUnknown_081E29D8[0] | gUnknown_081E29D8[3];
}

void sub_8054D4C(u32 a1)
{
    ResetTasks();
    ResetSpriteData();
    ResetPaletteFade();
    ScanlineEffect_Clear();
    ResetCameraUpdateInfo();
    InstallCameraPanAheadCallback();
    InitEventObjectPalettes(0);
    FieldEffectActiveListClear();
    InitFieldMessageBox();
    StartWeather();
    sub_8080750();
    if (!a1)
        SetUpFieldTasks();
    mapheader_run_script_with_tag_x5();
}

void sub_8054D90(void)
{
    gTotalCameraPixelOffsetX = 0;
    gTotalCameraPixelOffsetY = 0;
    ResetEventObjects();
    TrySpawnEventObjects(0, 0);
    mapheader_run_first_tag4_script_list_match();
}

void mli4_mapscripts_and_other(void)
{
    s16 x, y;
    struct InitialPlayerAvatarState *initialPlayerAvatarState;
    gTotalCameraPixelOffsetX = 0;
    gTotalCameraPixelOffsetY = 0;
    ResetEventObjects();
    sav1_camera_get_focus_coords(&x, &y);
    initialPlayerAvatarState = GetInitialPlayerAvatarState();
    InitPlayerAvatar(x, y, initialPlayerAvatarState->direction, gSaveBlock2.playerGender);
    SetPlayerAvatarTransitionFlags(initialPlayerAvatarState->transitionFlags);
    ResetInitialPlayerAvatarState();
    TrySpawnEventObjects(0, 0);
    ResetBerryTreeSparkleFlags();
    mapheader_run_first_tag4_script_list_match();
}

void sub_8054E20(void)
{
    sub_805B710(0, 0);
    RotatingGate_InitPuzzleAndGraphics();
}

void sub_8054E34(void)
{
    gEventObjects[gPlayerAvatar.eventObjectId].trackedByCamera = 1;
    InitCameraUpdateCallback(gPlayerAvatar.spriteId);
}

void sub_8054E60(void)
{
    InitCameraUpdateCallback(sub_8055AE8(gUnknown_03004860));
}

void sub_8054E7C(void)
{
    InitCameraUpdateCallback(sub_8055AE8(gUnknown_03004860));
}

void sub_8054E98(void)
{
    u16 x, y;
    sav1_camera_get_focus_coords(&x, &y);
    sub_8056C50(x + gUnknown_03004860, y);
}

void sub_8054EC8(void)
{
    u16 i;
    u16 x, y;

    sav1_camera_get_focus_coords(&x, &y);
    x -= gUnknown_03004860;

    for (i = 0; i < gFieldLinkPlayerCount; i++)
    {
        SpawnLinkPlayerEventObject(i, i + x, y, gLinkPlayers[i].gender);
        CreateLinkPlayerSprite(i);
    }

    sub_8055340(word_3002910);
}

void sub_8054F48(void)
{
    u16 i;
    for (i = 0; i < gFieldLinkPlayerCount; i++)
        CreateLinkPlayerSprite(i);
}

void sub_8054F70(void)
{
    int i;
    for (i = 0; i < 4; i++)
        gUnknown_03000580[i] = 0x80;
}

bool32 sub_8054F88(u16 a1)
{
    int i;
    int count = gFieldLinkPlayerCount;

    for (i = 0; i < count; i++)
        if (gUnknown_03000580[i] != a1)
            return FALSE;
    return TRUE;
}

bool32 sub_8054FC0(u16 a1)
{
    int i;
    int count = gFieldLinkPlayerCount;

    for (i = 0; i < count; i++)
        if (gUnknown_03000580[i] == a1)
            return TRUE;
    return FALSE;
}

void sub_8054FF8(u32 a1, u16 a2, struct UnkStruct_8054FF8 *a3, u16 *a4)
{
    u8 *script;

    if (gUnknown_03000580[a1] == 0x80)
    {
        script = sub_8055648(a3);
        if (script)
        {
            *a4 = sub_8055758(script);
            gUnknown_03000580[a1] = 0x81;
            if (a3->b)
            {
                sub_80543DC(sub_80553E4);
                sub_8055808(script);
            }
            return;
        }
        if (sub_8054FC0(0x83) == 1)
        {
            gUnknown_03000580[a1] = 0x81;
            if (a3->b)
            {
                sub_80543DC(sub_80553E4);
                sub_805585C();
            }
            return;
        }
        switch (a2)
        {
        case 24:
            if (sub_8055630(a3))
            {
                gUnknown_03000580[a1] = 0x81;
                if (a3->b)
                {
                    sub_80543DC(sub_80553E4);
                    sub_80557F4();
                }
            }
            break;
        case 18:
            if (sub_8055660(a3) == 1)
            {
                gUnknown_03000580[a1] = 0x81;
                if (a3->b)
                {
                    sub_80543DC(sub_80553E4);
                    sub_8055824();
                }
            }
            break;
        case 25:
            script = sub_805568C(a3);
            if (script)
            {
                gUnknown_03000580[a1] = 0x81;
                if (a3->b)
                {
                    sub_80543DC(sub_80553E4);
                    sub_8055840(script);
                }
            }
            break;
        case 27:
            if (sub_8055618(a3))
            {
                gUnknown_03000580[a1] = 0x81;
                if (a3->b)
                {
                    sub_80543DC(sub_8055408);
                    sub_80557E8();
                }
            }
            break;
        case 28:
            if (sub_8055618(a3))
            {
                gUnknown_03000580[a1] = 0x81;
                if (a3->b)
                {
                    sub_80543DC(sub_8055438);
                    sub_80557E8();
                }
            }
            break;
        }
    }

    switch (a2)
    {
    case 23:
        gUnknown_03000580[a1] = 0x83;
        break;
    case 22:
        gUnknown_03000580[a1] = 0x82;
        break;
    case 26:
        gUnknown_03000580[a1] = 0x80;
        if (a3->b)
            sub_80543DC(sub_8055390);
        break;
    case 29:
        if (gUnknown_03000580[a1] == 0x82)
            gUnknown_03000580[a1] = 0x81;
        break;
    }
}

void sub_8055218(u16 *a1, int a2)
{
    struct UnkStruct_8054FF8 st;
    int i;
    for (i = 0; i < 4; i++)
    {
        u16 v5 = a1[i];
        u16 v8 = 0;
        sub_80555B0(i, a2, &st);
        sub_8054FF8(i, v5, &st, &v8);
        if (gUnknown_03000580[i] == 0x80)
            v8 = sub_805530C(v5);
        sub_8055BFC(i, v8);
    }
}

void sub_8055280(u16 a1)
{
    if (a1 >= 17 && a1 < 30)
        word_3004858 = a1;
    else
        word_3004858 = 17;
}

u16 sub_80552B0(u32 a1)
{
    if (gMain.heldKeys & DPAD_UP)
    {
        return 19;
    }
    else if (gMain.heldKeys & DPAD_DOWN)
    {
        return 18;
    }
    else if (gMain.heldKeys & DPAD_LEFT)
    {
        return 20;
    }
    else if (gMain.heldKeys & DPAD_RIGHT)
    {
        return 21;
    }
    else if (gMain.newKeys & START_BUTTON)
    {
        return 24;
    }
    else if (gMain.newKeys & A_BUTTON)
    {
        return 25;
    }
    else
    {
        return 17;
    }
}

u16 sub_805530C(u16 a1)
{
    switch (a1)
    {
    case 21:
        return 4;
    case 20:
        return 3;
    case 19:
        return 1;
    case 18:
        return 2;
    default:
        return 0;
    }
}

void sub_8055340(u16 *a1)
{
    int i;
    for (i = 0; i < 4; i++)
        a1[i] = 17;
}

void sub_8055354(void)
{
    u8 val = gUnknown_03004860;
    sub_8055218(word_3002910, val);
    sub_8055280(gUnknown_03000584(val));
    sub_8055340(word_3002910);
}

u16 sub_8055390(u32 a1)
{
    if (ScriptContext2_IsEnabled() == 1)
        return 17;
    if (gLink.recvQueue.count > 4)
        return 27;
    if (gLink.sendQueue.count <= 4)
        return sub_80552B0(a1);
    return 28;
}

u16 sub_80553E0(u32 a1)
{
    return 17;
}

u16 sub_80553E4(u32 a1)
{
    u16 retVal;
    if (ScriptContext2_IsEnabled() == 1)
    {
        retVal = 17;
    }
    else
    {
        retVal = 26;
        sub_80543DC(sub_80553E0);
    }
    return retVal;
}

u16 sub_8055408(u32 a1)
{
    u16 retVal;
    if (gLink.recvQueue.count > 2)
    {
        retVal = 17;
    }
    else
    {
        retVal = 26;
        ScriptContext2_Disable();
        sub_80543DC(sub_80553E0);
    }
    return retVal;
}

u16 sub_8055438(u32 a1)
{
    u16 retVal;
    if (gLink.sendQueue.count > 2)
    {
        retVal = 17;
    }
    else
    {
        retVal = 26;
        ScriptContext2_Disable();
        sub_80543DC(sub_80553E0);
    }
    return retVal;
}

u16 sub_8055468(u32 a1)
{
    return 17;
}

u16 sub_805546C(u32 linkPlayerId)
{
    if (gUnknown_03000580[linkPlayerId] == 0x82 && (gMain.newKeys & B_BUTTON))
    {
        sub_80543DC(sub_8055468);
        return 29;
    }
    else
    {
        return 17;
    }
}

u16 sub_80554A4(u32 a1)
{
    sub_80543DC(sub_805546C);
    return 22;
}

u16 sub_80554B8(u32 a1)
{
    return 17;
}

u16 sub_80554BC(u32 a1)
{
    if (sub_8054F88(0x83) == TRUE)
    {
        ScriptContext1_SetupScript(gUnknown_081A4508);
        sub_80543DC(sub_80554B8);
    }
    return 17;
}

u16 sub_80554E4(u32 a1)
{
    sub_80543DC(sub_80554BC);
    return 23;
}

s32 sub_80554F8(void)
{
    if (sub_8054FC0(0x83) == TRUE)
        return 2;
    if (gUnknown_03000584 == sub_805546C && gUnknown_03000580[gUnknown_03004860] != 0x82)
        return 0;
    if (gUnknown_03000584 == sub_8055468 && gUnknown_03000580[gUnknown_03004860] == 0x81)
        return 2;
    return sub_8054F88(0x82);
}

bool32 unref_sub_8055568(void)
{
    return sub_8054FC0(0x83);
}

u16 sub_8055574(void)
{
    sub_80543DC(sub_80554A4);
    return 0;
}

u16 sub_8055588(void)
{
    sub_80543DC(sub_80553E4);
    return 0;
}

u16 sub_805559C(void)
{
    sub_80543DC(sub_80554E4);
    return 0;
}

void sub_80555B0(int linkPlayerId, int a2, struct UnkStruct_8054FF8 *a3)
{
    s16 x, y;

    a3->a = linkPlayerId;
    a3->b = (linkPlayerId == a2) ? 1 : 0;
    a3->c = gLinkPlayerEventObjects[linkPlayerId].mode;
    a3->d = sub_8055B30(linkPlayerId);
    sub_8055B08(linkPlayerId, &x, &y);
    a3->sub.x = x;
    a3->sub.y = y;
    a3->sub.height = sub_8055B50(linkPlayerId);
    a3->field_C = MapGridGetMetatileBehaviorAt(x, y);
}

bool32 sub_8055618(struct UnkStruct_8054FF8 *a1)
{
    u8 v1 = a1->c;
    if (v1 == 2 || v1 == 0)
        return TRUE;
    else
        return FALSE;
}

bool32 sub_8055630(struct UnkStruct_8054FF8 *a1)
{
    u8 v1 = a1->c;
    if (v1 == 2 || v1 == 0)
        return TRUE;
    else
        return FALSE;
}

u8 *sub_8055648(struct UnkStruct_8054FF8 *a1)
{
    if (a1->c != 2)
        return 0;
    return GetCoordEventScriptAtMapPosition(&a1->sub);
}

bool32 sub_8055660(struct UnkStruct_8054FF8 *a1)
{
    if (a1->c != 2 && a1->c != 0)
        return FALSE;
    if (!MetatileBehavior_IsSouthArrowWarp(a1->field_C))
        return FALSE;
    if (a1->d != 1)
        return FALSE;
    return TRUE;
}

u8 *sub_805568C(struct UnkStruct_8054FF8 *a1)
{
    struct MapPosition unkStruct;
    u8 linkPlayerId;

    if (a1->c && a1->c != 2)
        return 0;

    unkStruct = a1->sub;
    unkStruct.x += gDirectionToVectors[a1->d].x;
    unkStruct.y += gDirectionToVectors[a1->d].y;
    unkStruct.height = 0;
    linkPlayerId = GetLinkPlayerIdAt(unkStruct.x, unkStruct.y);

    if (linkPlayerId != 4)
    {
        if (!a1->b)
            return TradeRoom_TooBusyToNotice;
        if (gUnknown_03000580[linkPlayerId] != 0x80)
            return TradeRoom_TooBusyToNotice;
        if (!sub_8083BF4(linkPlayerId))
            return TradeRoom_ReadTrainerCard1;
        else
            return TradeRoom_ReadTrainerCard2;
    }

    return GetInteractedLinkPlayerScript(&unkStruct, a1->field_C, a1->d);
}

u16 sub_8055758(u8 *script)
{
    if (script == DoubleBattleColosseum_EventScript_1A4383)
        return 10;
    if (script == DoubleBattleColosseum_EventScript_1A439E)
        return 9;
    if (script == DoubleBattleColosseum_EventScript_1A43B9)
        return 10;
    if (script == DoubleBattleColosseum_EventScript_1A43D4)
        return 9;
    if (script == RecordCorner_EventScript_1A4418)
        return 10;
    if (script == RecordCorner_EventScript_1A442D)
        return 9;
    if (script == RecordCorner_EventScript_1A4442)
        return 10;
    if (script == RecordCorner_EventScript_1A4457)
        return 9;
    if (script == SingleBattleColosseum_EventScript_1A436F)
        return 10;
    if (script == SingleBattleColosseum_EventScript_1A4379)
        return 9;
    if (script == TradeCenter_EventScript_1A43F0)
        return 10;
    if (script == TradeCenter_EventScript_1A43FA)
        return 9;
    return 0;
}

void sub_80557E8(void)
{
    ScriptContext2_Enable();
}

void sub_80557F4(void)
{
    PlaySE(SE_WIN_OPEN);
    sub_8071310();
    ScriptContext2_Enable();
}

void sub_8055808(u8 *script)
{
    PlaySE(SE_SELECT);
    ScriptContext1_SetupScript(script);
    ScriptContext2_Enable();
}

void sub_8055824(void)
{
    PlaySE(SE_WIN_OPEN);
    ScriptContext1_SetupScript(TradeRoom_PromptToCancelLink);
    ScriptContext2_Enable();
}

void sub_8055840(u8 *script)
{
    PlaySE(SE_SELECT);
    ScriptContext1_SetupScript(script);
    ScriptContext2_Enable();
}

void sub_805585C(void)
{
    ScriptContext1_SetupScript(TradeRoom_TerminateLink);
    ScriptContext2_Enable();
}

bool32 sub_8055870(void)
{
    if (!is_c1_link_related_active())
        return 0;
    if (gLink.recvQueue.count >= 3)
        gUnknown_03000588 = 1;
    else
        gUnknown_03000588 = 0;
    return gUnknown_03000588;
}

bool32 sub_80558AC(void)
{
    u8 temp;

    if (is_c1_link_related_active() != TRUE)
        return FALSE;

    if (sub_8007B24() != TRUE)
        return FALSE;

    if (gUnknown_03000584 == sub_8055408)
        return TRUE;

    if (gUnknown_03000584 != sub_80553E4)
        return FALSE;

    temp = gUnknown_03000588;
    gUnknown_03000588 = 0;

    if (temp == TRUE)
        return TRUE;

    if (gPaletteFade.active && gPaletteFade.softwareFadeFinishing)
        return TRUE;

    return FALSE;
}

bool32 sub_8055910(void)
{
    if (is_c1_link_related_active() != TRUE)
        return FALSE;

    if (sub_8007B24() != TRUE)
        return FALSE;

    if (gUnknown_03000584 == sub_8055438)
        return TRUE;

    return FALSE;
}

bool32 sub_8055940(void)
{
    if (!sub_8007B24())
        return FALSE;
    return TRUE;
}

void ClearLinkPlayerEventObject(struct LinkPlayerEventObject *linkPlayerEventObj)
{
    memset(linkPlayerEventObj, 0, sizeof(struct LinkPlayerEventObject));
}

void ClearLinkPlayerEventObjects(void)
{
    memset(gLinkPlayerEventObjects, 0, sizeof(gLinkPlayerEventObjects));
}

static void ClearEventObject(struct EventObject *eventObj)
{
    memset(eventObj, 0, sizeof(struct EventObject));
}

void SpawnLinkPlayerEventObject(u8 linkPlayerId, s16 x, s16 y, u8 a4)
{
    u8 eventObjId = GetFirstInactiveEventObjectId();
    struct LinkPlayerEventObject *linkPlayerEventObj = &gLinkPlayerEventObjects[linkPlayerId];
    struct EventObject *eventObj = &gEventObjects[eventObjId];

    ClearLinkPlayerEventObject(linkPlayerEventObj);
    ClearEventObject(eventObj);

    linkPlayerEventObj->active = 1;
    linkPlayerEventObj->linkPlayerId = linkPlayerId;
    linkPlayerEventObj->eventObjId = eventObjId;
    linkPlayerEventObj->mode = 0;

    eventObj->active = 1;
    eventObj->singleMovementActive = a4;
    eventObj->range.as_byte = 2;
    eventObj->spriteId = 64;

    InitLinkPlayerEventObjectPos(eventObj, x, y);
}

void InitLinkPlayerEventObjectPos(struct EventObject *eventObj, s16 x, s16 y)
{
    eventObj->currentCoords.x = x;
    eventObj->currentCoords.y = y;
    eventObj->previousCoords.x = x;
    eventObj->previousCoords.y = y;
    sub_80603CC(x, y, &eventObj->initialCoords.x, &eventObj->initialCoords.y);
    eventObj->initialCoords.x += 8;
    EventObjectUpdateZCoord(eventObj);
}

void unref_sub_8055A6C(u8 linkPlayerId, u8 a2)
{
    if (gLinkPlayerEventObjects[linkPlayerId].active)
    {
        u8 eventObjId = gLinkPlayerEventObjects[linkPlayerId].eventObjId;
        struct EventObject *eventObj = &gEventObjects[eventObjId];
        eventObj->range.as_byte = a2;
    }
}

void unref_sub_8055A9C(u8 linkPlayerId)
{
    struct LinkPlayerEventObject *linkPlayerEventObj = &gLinkPlayerEventObjects[linkPlayerId];
    u8 eventObjId = linkPlayerEventObj->eventObjId;
    struct EventObject *eventObj = &gEventObjects[eventObjId];
    if (eventObj->spriteId != 64 )
        DestroySprite(&gSprites[eventObj->spriteId]);
    linkPlayerEventObj->active = 0;
    eventObj->active = 0;
}

u8 sub_8055AE8(u8 linkPlayerId)
{
    u8 eventObjId = gLinkPlayerEventObjects[linkPlayerId].eventObjId;
    struct EventObject *eventObj = &gEventObjects[eventObjId];
    return eventObj->spriteId;
}

void sub_8055B08(u8 linkPlayerId, u16 *x, u16 *y)
{
    u8 eventObjId = gLinkPlayerEventObjects[linkPlayerId].eventObjId;
    struct EventObject *eventObj = &gEventObjects[eventObjId];
    *x = eventObj->currentCoords.x;
    *y = eventObj->currentCoords.y;
}

u8 sub_8055B30(u8 linkPlayerId)
{
    u8 eventObjId = gLinkPlayerEventObjects[linkPlayerId].eventObjId;
    struct EventObject *eventObj = &gEventObjects[eventObjId];
    return eventObj->range.as_byte;
}

u8 sub_8055B50(u8 linkPlayerId)
{
    u8 eventObjId = gLinkPlayerEventObjects[linkPlayerId].eventObjId;
    struct EventObject *eventObj = &gEventObjects[eventObjId];
    return eventObj->currentElevation;
}

s32 unref_sub_8055B74(u8 linkPlayerId)
{
    u8 eventObjId = gLinkPlayerEventObjects[linkPlayerId].eventObjId;
    struct EventObject *eventObj = &gEventObjects[eventObjId];
    return 16 - (s8)eventObj->directionSequenceIndex;
}

u8 GetLinkPlayerIdAt(s16 x, s16 y)
{
    u8 i;
    for (i = 0; i < 4; i++)
    {
        if (gLinkPlayerEventObjects[i].active
         && (gLinkPlayerEventObjects[i].mode == 0 || gLinkPlayerEventObjects[i].mode == 2))
        {
            struct EventObject *eventObj = &gEventObjects[gLinkPlayerEventObjects[i].eventObjId];
            if (eventObj->currentCoords.x == x && eventObj->currentCoords.y == y)
                return i;
        }
    }
    return 4;
}

void sub_8055BFC(u8 linkPlayerId, u8 a2)
{
    struct LinkPlayerEventObject *linkPlayerEventObj = &gLinkPlayerEventObjects[linkPlayerId];
    u8 eventObjId = linkPlayerEventObj->eventObjId;
    struct EventObject *eventObj = &gEventObjects[eventObjId];

    if (linkPlayerEventObj->active)
    {
        if (a2 > 10)
            eventObj->triggerGroundEffectsOnMove = 1;
        else
            gUnknown_082166D8[gUnknown_082166A0[linkPlayerEventObj->mode](linkPlayerEventObj, eventObj, a2)](linkPlayerEventObj, eventObj);
    }
}

static u8 sub_8055C68(struct LinkPlayerEventObject *linkPlayerEventObj, struct EventObject *eventObj, u8 a3)
{
    return gUnknown_082166AC[a3](linkPlayerEventObj, eventObj, a3);
}

static u8 sub_8055C88(struct LinkPlayerEventObject *linkPlayerEventObj, struct EventObject *eventObj, u8 a3)
{
    return 1;
}

static u8 sub_8055C8C(struct LinkPlayerEventObject *linkPlayerEventObj, struct EventObject *eventObj, u8 a3)
{
    return gUnknown_082166AC[a3](linkPlayerEventObj, eventObj, a3);
}

static u8 sub_8055CAC(struct LinkPlayerEventObject *linkPlayerEventObj, struct EventObject *eventObj, u8 a3)
{
    return 0;
}

static u8 sub_8055CB0(struct LinkPlayerEventObject *linkPlayerEventObj, struct EventObject *eventObj, u8 a3)
{
    s16 x, y;

    eventObj->range.as_byte = npc_something3(a3, eventObj->range.as_byte);
    EventObjectMoveDestCoords(eventObj, eventObj->range.as_byte, &x, &y);

    if (LinkPlayerDetectCollision(linkPlayerEventObj->eventObjId, eventObj->range.as_byte, x, y))
    {
        return 0;
    }
    else
    {
        eventObj->directionSequenceIndex = 16;
        ShiftEventObjectCoords(eventObj, x, y);
        EventObjectUpdateZCoord(eventObj);
        return 1;
    }
}

static u8 sub_8055D18(struct LinkPlayerEventObject *linkPlayerEventObj, struct EventObject *eventObj, u8 a3)
{
    eventObj->range.as_byte = npc_something3(a3, eventObj->range.as_byte);
    return 0;
}

static void sub_8055D30(struct LinkPlayerEventObject *linkPlayerEventObj, struct EventObject *eventObj)
{
    linkPlayerEventObj->mode = 0;
}

static void sub_8055D38(struct LinkPlayerEventObject *linkPlayerEventObj, struct EventObject *eventObj)
{
    eventObj->directionSequenceIndex--;
    linkPlayerEventObj->mode = 1;
    MoveCoords(eventObj->range.as_byte, &eventObj->initialCoords.x, &eventObj->initialCoords.y);
    if (!eventObj->directionSequenceIndex)
    {
        ShiftStillEventObjectCoords(eventObj);
        linkPlayerEventObj->mode = 2;
    }
}

u8 npc_something3(u8 a1, u8 a2)
{
    switch (a1 - 1)
    {
    case 0:
    case 6:
        return 2;
    case 1:
    case 7:
        return 1;
    case 2:
    case 8:
        return 3;
    case 3:
    case 9:
        return 4;
    }
    return a2;
}

u8 LinkPlayerDetectCollision(u8 selfEventObjId, u8 a2, s16 x, s16 y)
{
    u8 i;
    for (i = 0; i < 16; i++)
    {
        if (i != selfEventObjId)
        {
            if ((gEventObjects[i].currentCoords.x == x && gEventObjects[i].currentCoords.y == y)
             || (gEventObjects[i].previousCoords.x == x && gEventObjects[i].previousCoords.y == y))
            {
                return 1;
            }
        }
    }
    return MapGridIsImpassableAt(x, y);
}

void CreateLinkPlayerSprite(u8 linkPlayerId)
{
    struct LinkPlayerEventObject *linkPlayerEventObj = &gLinkPlayerEventObjects[linkPlayerId];
    u8 eventObjId = linkPlayerEventObj->eventObjId;
    struct EventObject *eventObj = &gEventObjects[eventObjId];
    struct Sprite *sprite;

    if (linkPlayerEventObj->active)
    {
        u8 val = GetRivalAvatarGraphicsIdByStateIdAndGender(PLAYER_AVATAR_STATE_NORMAL, eventObj->singleMovementActive);
        eventObj->spriteId = AddPseudoEventObject(val, SpriteCB_LinkPlayer, 0, 0, 0);
        sprite = &gSprites[eventObj->spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->data[0] = linkPlayerId;
        eventObj->triggerGroundEffectsOnMove = 0;
    }
}

void SpriteCB_LinkPlayer(struct Sprite *sprite)
{
    struct LinkPlayerEventObject *linkPlayerEventObj = &gLinkPlayerEventObjects[sprite->data[0]];
    struct EventObject *eventObj = &gEventObjects[linkPlayerEventObj->eventObjId];
    sprite->pos1.x = eventObj->initialCoords.x;
    sprite->pos1.y = eventObj->initialCoords.y;
    SetObjectSubpriorityByZCoord(eventObj->previousElevation, sprite, 1);
    sprite->oam.priority = ZCoordToPriority(eventObj->previousElevation);
    if (!linkPlayerEventObj->mode)
        StartSpriteAnim(sprite, GetFaceDirectionAnimNum(eventObj->range.as_byte));
    else
        StartSpriteAnimIfDifferent(sprite, GetMoveDirectionAnimNum(eventObj->range.as_byte));
    UpdateEventObjectSpriteVisibility(sprite, 0);
    if (eventObj->triggerGroundEffectsOnMove)
    {
        sprite->invisible = ((sprite->data[7] & 4) >> 2);
        sprite->data[7]++;
    }
}
