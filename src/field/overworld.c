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
#include "field_ground_effect.h"
#include "field_map_obj.h"
#include "field_map_obj_helpers.h"
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
#include "constants/maps.h"
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
#include "constants/songs.h"
#include "sound.h"
#include "constants/species.h"
#include "start_menu.h"
#include "task.h"
#include "tileset_anim.h"
#include "time_events.h"
#include "tv.h"
#include "unknown_task.h"
#include "wild_encounter.h"

#ifdef SAPPHIRE
#define LEGENDARY_MUSIC BGM_OOAME  // Heavy Rain
#else
#define LEGENDARY_MUSIC BGM_HIDERI // Drought
#endif

struct UnkTVStruct
{
    u32 tv_field_0;
    u32 tv_field_4;
};

extern u16 gUnknown_03004898;
extern u16 gUnknown_0300489C;

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

extern struct MapData * const gMapAttributes[];
extern struct MapHeader * const * const gMapGroups[];
extern s32 gMaxFlashLevel;

EWRAM_DATA struct WarpData gUnknown_020297F0 = {0};
EWRAM_DATA struct WarpData gWarpDestination = {0};  // new warp position
EWRAM_DATA struct WarpData gUnknown_02029800 = {0};
EWRAM_DATA struct WarpData gUnknown_02029808 = {0};
EWRAM_DATA struct UnkPlayerStruct gUnknown_02029810 = {0};
EWRAM_DATA static u16 sAmbientCrySpecies = 0;
EWRAM_DATA static bool8 sIsAmbientCryWaterMon = FALSE;
EWRAM_DATA struct LinkPlayerMapObject gLinkPlayerMapObjects[4] = {0};

static u8 gUnknown_03000580[4];
static u16 (*gUnknown_03000584)(u32);
static u8 gUnknown_03000588;

u16 word_3004858;
void (*gFieldCallback)(void);
u8 gUnknown_03004860;
u8 gFieldLinkPlayerCount;

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

const struct UCoords32 gUnknown_0821664C[] =
{
    { 0,  0},
    { 0,  1},
    { 0, -1},
    {-1,  0},
    { 1,  0},
    {-1,  1},
    { 1,  1},
    {-1, -1},
    { 1, -1},
};

const struct UnknownTaskStruct gUnknown_08216694 =
{
    (void *)REG_ADDR_WIN0H,
    ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | 1,
    1,
    0,
};

static u8 sub_8055C68(struct LinkPlayerMapObject *, struct MapObject *, u8);
static u8 sub_8055C88(struct LinkPlayerMapObject *, struct MapObject *, u8);
static u8 sub_8055C8C(struct LinkPlayerMapObject *, struct MapObject *, u8);

static u8 (*const gUnknown_082166A0[])(struct LinkPlayerMapObject *, struct MapObject *, u8) =
{
    sub_8055C68,
    sub_8055C88,
    sub_8055C8C,
};

static u8 sub_8055CAC(struct LinkPlayerMapObject *, struct MapObject *, u8);
static u8 sub_8055CB0(struct LinkPlayerMapObject *, struct MapObject *, u8);
static u8 sub_8055D18(struct LinkPlayerMapObject *, struct MapObject *, u8);

static u8 (*const gUnknown_082166AC[])(struct LinkPlayerMapObject *, struct MapObject *, u8) =
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

static void sub_8055D30(struct LinkPlayerMapObject *, struct MapObject *);
static void sub_8055D38(struct LinkPlayerMapObject *, struct MapObject *);

static void (*const gUnknown_082166D8[])(struct LinkPlayerMapObject *, struct MapObject *) =
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
    warp_in();
}

void Overworld_ResetStateAfterFly(void)
{
    player_avatar_init_params_reset();
    FlagClear(SYS_CYCLING_ROAD);
    FlagClear(SYS_CRUISE_MODE);
    FlagClear(SYS_SAFARI_MODE);
    FlagClear(SYS_USE_STRENGTH);
    FlagClear(SYS_USE_FLASH);
}

void Overworld_ResetStateAfterTeleport(void)
{
    player_avatar_init_params_reset();
    FlagClear(SYS_CYCLING_ROAD);
    FlagClear(SYS_CRUISE_MODE);
    FlagClear(SYS_SAFARI_MODE);
    FlagClear(SYS_USE_STRENGTH);
    FlagClear(SYS_USE_FLASH);
    ScriptContext2_RunNewScript(gUnknown_0819FC9F);
}

void Overworld_ResetStateAfterDigEscRope(void)
{
    player_avatar_init_params_reset();
    FlagClear(SYS_CYCLING_ROAD);
    FlagClear(SYS_CRUISE_MODE);
    FlagClear(SYS_SAFARI_MODE);
    FlagClear(SYS_USE_STRENGTH);
    FlagClear(SYS_USE_FLASH);
}

void Overworld_ResetStateAfterWhiteOut(void)
{
    player_avatar_init_params_reset();
    FlagClear(SYS_CYCLING_ROAD);
    FlagClear(SYS_CRUISE_MODE);
    FlagClear(SYS_SAFARI_MODE);
    FlagClear(SYS_USE_STRENGTH);
    FlagClear(SYS_USE_FLASH);
}

void sub_805308C(void)
{
    FlagClear(SYS_SAFARI_MODE);
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

u32 GetGameStat(u8 index)
{
    if (index >= NUM_GAME_STATS)
        return 0;

    return gSaveBlock1.gameStats[index];
}

void SetGameStat(u8 index, u32 value)
{
    if (index < NUM_GAME_STATS)
        gSaveBlock1.gameStats[index] = value;
}

void LoadMapObjTemplatesFromHeader(void)
{
    // Clear map object templates
    CpuFill32(0, gSaveBlock1.mapObjectTemplates, sizeof(gSaveBlock1.mapObjectTemplates));

    // Copy map header events to save block
    CpuCopy32(gMapHeader.events->mapObjects,
              gSaveBlock1.mapObjectTemplates,
              gMapHeader.events->mapObjectCount * sizeof(struct MapObjectTemplate));
}

static void LoadSaveblockMapObjScripts(void)
{
    struct MapObjectTemplate *mapObjectTemplates = gSaveBlock1.mapObjectTemplates;
    s32 i;

    for (i = 0; i < 64; i++)
        mapObjectTemplates[i].script = gMapHeader.events->mapObjects[i].script;
}

void Overworld_SetMapObjTemplateCoords(u8 localId, s16 x, s16 y)
{
    s32 i;
    for (i = 0; i < 64; i++)
    {
        struct MapObjectTemplate *mapObjectTemplate = &gSaveBlock1.mapObjectTemplates[i];
        if (mapObjectTemplate->localId == localId)
        {
            mapObjectTemplate->x = x;
            mapObjectTemplate->y = y;
            return;
        }
    }
}

void Overworld_SetMapObjTemplateMovementType(u8 localId, u8 movementType)
{
    s32 i;

    for (i = 0; i < 64; i++)
    {
        struct MapObjectTemplate *mapObjectTemplate = &gSaveBlock1.mapObjectTemplates[i];
        if (mapObjectTemplate->localId == localId)
        {
            mapObjectTemplate->movementType = movementType;
            return;
        }
    }
}

static void mapdata_load_assets_to_gpu_and_full_redraw(void)
{
    move_tilemap_camera_to_upper_left_corner();
    copy_map_tileset1_tileset2_to_vram(gMapHeader.mapData);
    apply_map_tileset1_tileset2_palette(gMapHeader.mapData);
    DrawWholeMapView();
    cur_mapheader_run_tileset_funcs_after_some_cpuset();
}

static struct MapData *get_mapdata_header(void)
{
    u16 mapDataId = gSaveBlock1.mapDataId;
    if (mapDataId)
        return gMapAttributes[mapDataId - 1];
    return NULL;
}

static void ApplyCurrentWarp(void)
{
    gUnknown_020297F0 = gSaveBlock1.location;
    gSaveBlock1.location = gWarpDestination;
    gUnknown_02029800 = sDummyWarpData;
    gUnknown_02029808 = sDummyWarpData;
}

static void SetWarpData(struct WarpData *warp, s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y)
{
    warp->mapGroup = mapGroup;
    warp->mapNum = mapNum;
    warp->warpId = warpId;
    warp->x = x;
    warp->y = y;
}

static bool32 warp_data_is_not_neg_1(struct WarpData *warp)
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

struct MapHeader *const warp1_get_mapheader(void)
{
    return Overworld_GetMapHeaderByGroupAndId(gWarpDestination.mapGroup, gWarpDestination.mapNum);
}

static void set_current_map_header_from_sav1_save_old_name(void)
{
    gMapHeader = *Overworld_GetMapHeaderByGroupAndId(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum);
    gSaveBlock1.mapDataId = gMapHeader.mapDataId;
    gMapHeader.mapData = get_mapdata_header();
}

static void LoadSaveblockMapHeader(void)
{
    gMapHeader = *Overworld_GetMapHeaderByGroupAndId(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum);
    gMapHeader.mapData = get_mapdata_header();
}

void sub_80533CC(void)
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
        gSaveBlock1.pos.x = gMapHeader.mapData->width / 2;
        gSaveBlock1.pos.y = gMapHeader.mapData->height / 2;
    }
}

void warp_in(void)
{
    ApplyCurrentWarp();
    set_current_map_header_from_sav1_save_old_name();
    sub_80533CC();
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

void sub_8053690(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y)
{
    SetWarpData(&gUnknown_02029800, mapGroup, mapNum, warpId, x, y);
}

static void warp1_set_to_warp2(void)
{
    gWarpDestination = gUnknown_02029800;
}

void sub_80536E4(s8 mapGroup, s8 mapNum, s8 warpId, s8 x, s8 y)
{
    SetWarpData(&gUnknown_02029808, mapGroup, mapNum, warpId, x, y);
}

void sub_8053720(s16 x, s16 y)
{
    if (warp_data_is_not_neg_1(&gUnknown_02029808) == TRUE)
    {
        gWarpDestination = gUnknown_020297F0;
    }
    else
    {
        Overworld_SetWarpDestination(gUnknown_02029808.mapGroup, gUnknown_02029808.mapNum, -1, x, y);
    }
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

bool8 sub_8053850(u8 dir, u16 x, u16 y)
{
    struct MapConnection *connection = GetMapConnection(dir);

    if (connection != NULL)
    {
        Overworld_SetWarpDestination(connection->mapGroup, connection->mapNum, -1, x, y);
    }
    else
    {
        mapheader_run_script_with_tag_x6();
        if (warp_data_is_not_neg_1(&gUnknown_02029800))
            return FALSE;
        warp1_set_to_warp2();
    }
    return TRUE;
}

bool8 sub_80538B0(u16 x, u16 y)
{
    return sub_8053850(CONNECTION_EMERGE, x, y);
}

bool8 sub_80538D0(u16 x, u16 y)
{
    return sub_8053850(CONNECTION_DIVE, x, y);
}

void sub_80538F0(u8 mapGroup, u8 mapNum)
{
    s32 i;

    Overworld_SetWarpDestination(mapGroup, mapNum, -1, -1, -1);
    sub_8053F0C();
    ApplyCurrentWarp();
    set_current_map_header_from_sav1_save_old_name();
    LoadMapObjTemplatesFromHeader();
    ClearTempFieldEventData();
    ResetCyclingRoadChallengeData();
    prev_quest_postbuffer_cursor_backup_reset();
    sub_8082BD0(mapGroup, mapNum);
    DoTimeBasedEvents();
    SetSav1WeatherFromCurrMapHeader();
    ChooseAmbientCrySpecies();
    SetDefaultFlashLevel();
    Overworld_ClearSavedMusic();
    mapheader_run_script_with_tag_x3();
    not_trainer_hill_battle_pyramid();
    sub_8056D38(gMapHeader.mapData);
    apply_map_tileset2_palette(gMapHeader.mapData);

    for (i = 6; i < 12; i++)
        sub_807D874(i);

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

    set_current_map_header_from_sav1_save_old_name();
    LoadMapObjTemplatesFromHeader();
    v2 = is_map_type_1_2_3_5_or_6(gMapHeader.mapType);
    v3 = Overworld_MapTypeIsIndoors(gMapHeader.mapType);
    ClearTempFieldEventData();
    ResetCyclingRoadChallengeData();
    prev_quest_postbuffer_cursor_backup_reset();
    sub_8082BD0(gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum);
    if (a1 != 1)
        DoTimeBasedEvents();
    SetSav1WeatherFromCurrMapHeader();
    ChooseAmbientCrySpecies();
    if (v2)
        FlagClear(SYS_USE_FLASH);
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

void player_avatar_init_params_reset(void)
{
    gUnknown_02029810.player_field_1 = 1;
    gUnknown_02029810.player_field_0 = 1;
}

void walkrun_find_lowest_active_bit_in_bitfield(void)
{
    gUnknown_02029810.player_field_1 = player_get_direction_lower_nybble();

    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_MACH_BIKE))
        gUnknown_02029810.player_field_0 = 2;
    else if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_ACRO_BIKE))
        gUnknown_02029810.player_field_0 = 4;
    else if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
        gUnknown_02029810.player_field_0 = 8;
    else if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_4))
        gUnknown_02029810.player_field_0 = 16;
    else
        gUnknown_02029810.player_field_0 = 1;
}

struct UnkPlayerStruct *sub_8053AA8(void)
{
    struct UnkPlayerStruct playerStruct;
    u8 mapType = Overworld_GetMapTypeOfSaveblockLocation();
    u16 v2 = cur_mapdata_block_role_at_screen_center_acc_to_sav1();
    u8 v4 = sub_8053B00(&gUnknown_02029810, v2, mapType);
    playerStruct.player_field_0 = v4;
    playerStruct.player_field_1 = sub_8053B60(&gUnknown_02029810, v4, v2, mapType);
    gUnknown_02029810 = playerStruct;
    return &gUnknown_02029810;
}

u8 sub_8053B00(struct UnkPlayerStruct *playerStruct, u16 a2, u8 a3)
{
    if (a3 != 8 && FlagGet(SYS_CRUISE_MODE))
        return 1;
    if (a3 == 5)
        return 16;
    if (MetatileBehavior_IsSurfableWaterOrUnderwater(a2) == 1)
        return 8;
    if (Overworld_IsBikingAllowed() != TRUE)
        return 1;
    if (playerStruct->player_field_0 == 2)
        return 2;
    if (playerStruct->player_field_0 != 4)
        return 1;
    return 4;
}

u8 sub_8053B60(struct UnkPlayerStruct *playerStruct, u8 a2, u16 a3, u8 a4)
{
    if (FlagGet(SYS_CRUISE_MODE) && a4 == 6)
        return 4;
    if (MetatileBehavior_IsDeepSouthWarp(a3) == TRUE)
        return 2;
    if (MetatileBehavior_IsNonAnimDoor(a3) == TRUE || MetatileBehavior_IsDoor(a3) == TRUE)
        return 1;
    if (MetatileBehavior_IsSouthArrowWarp(a3) == TRUE)
        return 2;
    if (MetatileBehavior_IsNorthArrowWarp(a3) == TRUE)
        return 1;
    if (MetatileBehavior_IsWestArrowWarp(a3) == TRUE)
        return 4;
    if (MetatileBehavior_IsEastArrowWarp(a3) == TRUE)
        return 3;
    if ((playerStruct->player_field_0 == 16 && a2 == 8)
     || (playerStruct->player_field_0 == 8 && a2 == 16))
        return playerStruct->player_field_1;
    if (MetatileBehavior_IsLadder(a3) == TRUE)
        return playerStruct->player_field_1;
    return 1;
}

u16 cur_mapdata_block_role_at_screen_center_acc_to_sav1(void)
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
    else if (FlagGet(SYS_USE_FLASH))
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

void sub_8053D14(u16 mapDataId)
{
    gSaveBlock1.mapDataId = mapDataId;
    gMapHeader.mapData = get_mapdata_header();
}

static bool16 ShouldLegendaryMusicPlayAtLocation(struct WarpData *warp)
{
    if (!FlagGet(SYS_WEATHER_CTRL))
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
    if (VarGet(VAR_WEATHER_INSTITUTE_CLEARED))
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
        return BGM_TOZAN;
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
        return BGM_ASHROAD;

    music = GetLocationMusic(&gSaveBlock1.location);
    if (music != 0x7FFF)
    {
        return music;
    }
    else
    {
        if (gSaveBlock1.pos.x < 24)
            return BGM_DOORO_X1;
        else
            return BGM_GRANROAD;
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
            return BGM_DOORO_X1;
        else
            return BGM_GRANROAD;
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
            music = BGM_DEEPDEEP;
        else if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
            music = BGM_NAMINORI;
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
    if (FlagGet(SPECIAL_FLAG_1) != TRUE)
    {
        u16 newMusic = GetWarpDestinationMusic();
        u16 currentMusic = GetCurrentMapMusic();
        if (newMusic != LEGENDARY_MUSIC)
        {
            if (currentMusic == BGM_DEEPDEEP || currentMusic == BGM_NAMINORI)
                return;
            if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
                newMusic = BGM_NAMINORI;
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
    struct MapHeader *mapHeader = warp1_get_mapheader();
    if (Overworld_MapTypeIsIndoors(mapHeader->mapType) == TRUE)
        return 2;
    else
        return 4;
}

void sub_8053FF8(void)
{
    u16 music = GetWarpDestinationMusic();
    if (FlagGet(SPECIAL_FLAG_1) != TRUE && music != GetCurrentMapMusic())
    {
        u8 speed = GetMapMusicFadeoutSpeed();
        FadeOutMapMusic(speed);
    }
}

bool8 sub_8054034(void)
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

u8 get_map_type_from_warp0(void)
{
    return GetMapTypeByWarpData(&gUnknown_020297F0);
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
    struct FieldInput inputStruct;

    sub_8059204();
    FieldClearPlayerInput(&inputStruct);
    FieldGetPlayerInput(&inputStruct, newKeys, heldKeys);
    if (!ScriptContext2_IsEnabled())
    {
        if (sub_8068024(&inputStruct) == 1)
        {
            ScriptContext2_Enable();
            HideMapNamePopup();
        }
        else
        {
            player_step(inputStruct.dpadDirection, newKeys, heldKeys);
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

void sub_80543E8(void)
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
    player_avatar_init_params_reset();
    PlayTimeCounter_Start();
    ScriptContext1_Init();
    ScriptContext2_Disable();
    gFieldCallback = ExecuteTruckSequence;
    do_load_map_stuff_loop(&gMain.state);
    SetFieldVBlankCallback();
    set_callback1(c1_overworld);
    SetMainCallback2(c2_overworld);
}

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
        player_avatar_init_params_reset();
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

void c2_80567AC(void)
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

void sub_805469C(void)
{
    FieldClearVBlankHBlankCallbacks();
    gFieldCallback = atk17_seteffectuser;
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
    ResetSafariZoneFlag_();
    LoadSaveblockMapHeader();
    LoadSaveblockMapObjScripts();
    UnfreezeMapObjects();
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
        warp_in();
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
    sub_8089668();
    sub_8057A58();
    TransferPlttBuffer();
    sub_8072E74();
}

void sub_8054814(void)
{
    u8 val = Overworld_GetFlashLevel();
    if (val)
    {
        sub_80815E0(val);
        sub_80895F8(gUnknown_08216694);
    }
}

bool32 sub_805483C(u8 *a1)
{
    switch (*a1)
    {
    case 0:
        FieldClearVBlankHBlankCallbacks();
        ScriptContext1_Init();
        ScriptContext2_Disable();
        sub_8054F70();
        sub_8054BA8();
        (*a1)++;
        break;
    case 1:
        sub_8053994(1);
        (*a1)++;
        break;
    case 2:
        sub_8054D4C(1);
        (*a1)++;
        break;
    case 3:
        sub_8054E98();
        sub_8054D90();
        sub_8054EC8();
        sub_8054E60();
        (*a1)++;
        break;
    case 4:
        sub_8054814();
        sub_8054C54();
        SetUpWindowConfig(&gWindowConfig_81E6C3C);
        InitMenuWindow(&gWindowConfig_81E6CE4);
        (*a1)++;
        break;
    case 5:
        move_tilemap_camera_to_upper_left_corner();
        (*a1)++;
        break;
    case 6:
        sub_8056D28(gMapHeader.mapData);
        (*a1)++;
        break;
    case 7:
        sub_8056D38(gMapHeader.mapData);
        (*a1)++;
        break;
    case 8:
        apply_map_tileset1_tileset2_palette(gMapHeader.mapData);
        (*a1)++;
        break;
    case 9:
        DrawWholeMapView();
        (*a1)++;
        break;
    case 10:
        cur_mapheader_run_tileset_funcs_after_some_cpuset();
        (*a1)++;
        break;
    case 12:
        sub_80543E8();
        (*a1)++;
        break;
    case 11:
        (*a1)++;
        break;
    case 13:
        return 1;
    }
    return 0;
}

bool32 sub_805493C(u8 *a1, u32 a2)
{
    switch (*a1)
    {
    case 0:
        FieldClearVBlankHBlankCallbacks();
        sub_8053994(a2);
        (*a1)++;
        break;
    case 1:
        sub_8054BA8();
        (*a1)++;
        break;
    case 2:
        sub_8054D4C(a2);
        (*a1)++;
        break;
    case 3:
        mli4_mapscripts_and_other();
        sub_8054E34();
        (*a1)++;
        break;
    case 4:
        sub_8054814();
        sub_8054C54();
        SetUpWindowConfig(&gWindowConfig_81E6C3C);
        InitMenuWindow(&gWindowConfig_81E6CE4);
        (*a1)++;
        break;
    case 5:
        move_tilemap_camera_to_upper_left_corner();
        (*a1)++;
        break;
    case 6:
        sub_8056D28(gMapHeader.mapData);
        (*a1)++;
        break;
    case 7:
        sub_8056D38(gMapHeader.mapData);
        (*a1)++;
        break;
    case 8:
        apply_map_tileset1_tileset2_palette(gMapHeader.mapData);
        (*a1)++;
        break;
    case 9:
        DrawWholeMapView();
        (*a1)++;
        break;
    case 10:
        cur_mapheader_run_tileset_funcs_after_some_cpuset();
        (*a1)++;
        break;
    case 11:
        if (gMapHeader.flags == 1 && sub_80BBB24() == 1)
            ShowMapNamePopup();
        (*a1)++;
        break;
    case 12:
        sub_80543E8();
        (*a1)++;
        break;
    case 13:
        return 1;
    }
    return 0;
}

bool32 sub_8054A4C(u8 *a1)
{
    switch (*a1)
    {
    case 0:
        sub_8054BA8();
        sub_8054D4C(0);
        sub_8054E20();
        sub_8054E34();
        (*a1)++;
        break;
    case 1:
        sub_8054C2C();
        (*a1)++;
        break;
    case 2:
        sub_80543E8();
        (*a1)++;
        break;
    case 3:
        return 1;
    }
    return 0;
}

bool32 sub_8054A9C(u8 *a1)
{
    switch (*a1)
    {
    case 0:
        FieldClearVBlankHBlankCallbacks();
        sub_8054BA8();
        (*a1)++;
        break;
    case 1:
        sub_8054D4C(1);
        (*a1)++;
        break;
    case 2:
        sub_8054F48();
        sub_8054E20();
        sub_8054E7C();
        (*a1)++;
        break;
    case 3:
        sub_8054814();
        sub_8054C54();
        SetUpWindowConfig(&gWindowConfig_81E6C3C);
        InitMenuWindow(&gWindowConfig_81E6CE4);
        (*a1)++;
        break;
    case 4:
        move_tilemap_camera_to_upper_left_corner();
        (*a1)++;
        break;
    case 5:
        sub_8056D28(gMapHeader.mapData);
        (*a1)++;
        break;
    case 6:
        sub_8056D38(gMapHeader.mapData);
        (*a1)++;
        break;
    case 7:
        apply_map_tileset1_tileset2_palette(gMapHeader.mapData);
        (*a1)++;
        break;
    case 8:
        DrawWholeMapView();
        (*a1)++;
        break;
    case 9:
        cur_mapheader_run_tileset_funcs_after_some_cpuset();
        (*a1)++;
        break;
    case 12:
        sub_80543E8();
        (*a1)++;
        break;
    case 10:
    case 11:
        (*a1)++;
        break;
    case 13:
        SetFieldVBlankCallback();
        (*a1)++;
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
    u8 *addr;
    u32 size;

    REG_DISPCNT = 0;

    remove_some_task();

    DmaClear16(3, PLTT + 2, PLTT_SIZE - 2);

    addr = (void *)VRAM;
    size = 0x18000;
    while (1)
    {
        DmaFill16(3, 0, addr, 0x1000);
        addr += 0x1000;
        size -= 0x1000;
        if (size <= 0x1000)
        {
            DmaFill16(3, 0, addr, size);
            break;
        }
    }

    ResetOamRange(0, 128);
    LoadOam();
}

void sub_8054C2C(void)
{
    sub_8054814();
    sub_8054C54();
    SetUpWindowConfig(&gWindowConfig_81E6C3C);
    InitMenuWindow(&gWindowConfig_81E6CE4);
    mapdata_load_assets_to_gpu_and_full_redraw();
}

void sub_8054C54(void)
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
    dp12_8087EA4();
    ResetCameraUpdateInfo();
    InstallCameraPanAheadCallback();
    sub_805C7C4(0);
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
    gUnknown_0300489C = 0;
    gUnknown_03004898 = 0;
    sub_805AA98();
    sub_805B55C(0, 0);
    mapheader_run_first_tag4_script_list_match();
}

void mli4_mapscripts_and_other(void)
{
    s16 x, y;
    struct UnkPlayerStruct *player;
    gUnknown_0300489C = 0;
    gUnknown_03004898 = 0;
    sub_805AA98();
    sav1_camera_get_focus_coords(&x, &y);
    player = sub_8053AA8();
    InitPlayerAvatar(x, y, player->player_field_1, gSaveBlock2.playerGender);
    SetPlayerAvatarTransitionFlags(player->player_field_0);
    player_avatar_init_params_reset();
    sub_805B55C(0, 0);
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
    gMapObjects[gPlayerAvatar.mapObjectId].mapobj_bit_15 = 1;
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
        SpawnLinkPlayerMapObject(i, i + x, y, gLinkPlayers[i].gender);
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

u32 sub_80554F8(void)
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
    a3->c = gLinkPlayerMapObjects[linkPlayerId].mode;
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
    return sub_8068E24(&a1->sub);
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
    unkStruct.x += gUnknown_0821664C[a1->d].x;
    unkStruct.y += gUnknown_0821664C[a1->d].y;
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

    return sub_80682A8(&unkStruct, a1->field_C, a1->d);
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

void ZeroLinkPlayerMapObject(struct LinkPlayerMapObject *linkPlayerMapObj)
{
    memset(linkPlayerMapObj, 0, sizeof(struct LinkPlayerMapObject));
}

void strange_npc_table_clear(void)
{
    memset(gLinkPlayerMapObjects, 0, sizeof(gLinkPlayerMapObjects));
}

void ZeroMapObject(struct MapObject *mapObj)
{
    memset(mapObj, 0, sizeof(struct MapObject));
}

void SpawnLinkPlayerMapObject(u8 linkPlayerId, s16 x, s16 y, u8 a4)
{
    u8 mapObjId = sub_805AB54();
    struct LinkPlayerMapObject *linkPlayerMapObj = &gLinkPlayerMapObjects[linkPlayerId];
    struct MapObject *mapObj = &gMapObjects[mapObjId];

    ZeroLinkPlayerMapObject(linkPlayerMapObj);
    ZeroMapObject(mapObj);

    linkPlayerMapObj->active = 1;
    linkPlayerMapObj->linkPlayerId = linkPlayerId;
    linkPlayerMapObj->mapObjId = mapObjId;
    linkPlayerMapObj->mode = 0;

    mapObj->active = 1;
    mapObj->mapobj_bit_1 = a4;
    mapObj->range.as_byte = 2;
    mapObj->spriteId = 64;

    InitLinkPlayerMapObjectPos(mapObj, x, y);
}

void InitLinkPlayerMapObjectPos(struct MapObject *mapObj, s16 x, s16 y)
{
    mapObj->coords2.x = x;
    mapObj->coords2.y = y;
    mapObj->coords3.x = x;
    mapObj->coords3.y = y;
    sub_80603CC(x, y, &mapObj->coords1.x, &mapObj->coords1.y);
    mapObj->coords1.x += 8;
    FieldObjectUpdateZCoord(mapObj);
}

void unref_sub_8055A6C(u8 linkPlayerId, u8 a2)
{
    if (gLinkPlayerMapObjects[linkPlayerId].active)
    {
        u8 mapObjId = gLinkPlayerMapObjects[linkPlayerId].mapObjId;
        struct MapObject *mapObj = &gMapObjects[mapObjId];
        mapObj->range.as_byte = a2;
    }
}

void unref_sub_8055A9C(u8 linkPlayerId)
{
    struct LinkPlayerMapObject *linkPlayerMapObj = &gLinkPlayerMapObjects[linkPlayerId];
    u8 mapObjId = linkPlayerMapObj->mapObjId;
    struct MapObject *mapObj = &gMapObjects[mapObjId];
    if (mapObj->spriteId != 64 )
        DestroySprite(&gSprites[mapObj->spriteId]);
    linkPlayerMapObj->active = 0;
    mapObj->active = 0;
}

u8 sub_8055AE8(u8 linkPlayerId)
{
    u8 mapObjId = gLinkPlayerMapObjects[linkPlayerId].mapObjId;
    struct MapObject *mapObj = &gMapObjects[mapObjId];
    return mapObj->spriteId;
}

void sub_8055B08(u8 linkPlayerId, u16 *x, u16 *y)
{
    u8 mapObjId = gLinkPlayerMapObjects[linkPlayerId].mapObjId;
    struct MapObject *mapObj = &gMapObjects[mapObjId];
    *x = mapObj->coords2.x;
    *y = mapObj->coords2.y;
}

u8 sub_8055B30(u8 linkPlayerId)
{
    u8 mapObjId = gLinkPlayerMapObjects[linkPlayerId].mapObjId;
    struct MapObject *mapObj = &gMapObjects[mapObjId];
    return mapObj->range.as_byte;
}

u8 sub_8055B50(u8 linkPlayerId)
{
    u8 mapObjId = gLinkPlayerMapObjects[linkPlayerId].mapObjId;
    struct MapObject *mapObj = &gMapObjects[mapObjId];
    return mapObj->mapobj_unk_0B_0;
}

s32 unref_sub_8055B74(u8 linkPlayerId)
{
    u8 mapObjId = gLinkPlayerMapObjects[linkPlayerId].mapObjId;
    struct MapObject *mapObj = &gMapObjects[mapObjId];
    return 16 - (s8)mapObj->mapobj_unk_21;
}

u8 GetLinkPlayerIdAt(s16 x, s16 y)
{
    u8 i;
    for (i = 0; i < 4; i++)
    {
        if (gLinkPlayerMapObjects[i].active
         && (gLinkPlayerMapObjects[i].mode == 0 || gLinkPlayerMapObjects[i].mode == 2))
        {
            struct MapObject *mapObj = &gMapObjects[gLinkPlayerMapObjects[i].mapObjId];
            if (mapObj->coords2.x == x && mapObj->coords2.y == y)
                return i;
        }
    }
    return 4;
}

void sub_8055BFC(u8 linkPlayerId, u8 a2)
{
    struct LinkPlayerMapObject *linkPlayerMapObj = &gLinkPlayerMapObjects[linkPlayerId];
    u8 mapObjId = linkPlayerMapObj->mapObjId;
    struct MapObject *mapObj = &gMapObjects[mapObjId];

    if (linkPlayerMapObj->active)
    {
        if (a2 > 10)
            mapObj->mapobj_bit_2 = 1;
        else
            gUnknown_082166D8[gUnknown_082166A0[linkPlayerMapObj->mode](linkPlayerMapObj, mapObj, a2)](linkPlayerMapObj, mapObj);
    }
}

static u8 sub_8055C68(struct LinkPlayerMapObject *linkPlayerMapObj, struct MapObject *mapObj, u8 a3)
{
    return gUnknown_082166AC[a3](linkPlayerMapObj, mapObj, a3);
}

static u8 sub_8055C88(struct LinkPlayerMapObject *linkPlayerMapObj, struct MapObject *mapObj, u8 a3)
{
    return 1;
}

static u8 sub_8055C8C(struct LinkPlayerMapObject *linkPlayerMapObj, struct MapObject *mapObj, u8 a3)
{
    return gUnknown_082166AC[a3](linkPlayerMapObj, mapObj, a3);
}

static u8 sub_8055CAC(struct LinkPlayerMapObject *linkPlayerMapObj, struct MapObject *mapObj, u8 a3)
{
    return 0;
}

static u8 sub_8055CB0(struct LinkPlayerMapObject *linkPlayerMapObj, struct MapObject *mapObj, u8 a3)
{
    s16 x, y;

    mapObj->range.as_byte = npc_something3(a3, mapObj->range.as_byte);
    FieldObjectMoveDestCoords(mapObj, mapObj->range.as_byte, &x, &y);

    if (LinkPlayerDetectCollision(linkPlayerMapObj->mapObjId, mapObj->range.as_byte, x, y))
    {
        return 0;
    }
    else
    {
        mapObj->mapobj_unk_21 = 16;
        npc_coords_shift(mapObj, x, y);
        FieldObjectUpdateZCoord(mapObj);
        return 1;
    }
}

static u8 sub_8055D18(struct LinkPlayerMapObject *linkPlayerMapObj, struct MapObject *mapObj, u8 a3)
{
    mapObj->range.as_byte = npc_something3(a3, mapObj->range.as_byte);
    return 0;
}

static void sub_8055D30(struct LinkPlayerMapObject *linkPlayerMapObj, struct MapObject *mapObj)
{
    linkPlayerMapObj->mode = 0;
}

static void sub_8055D38(struct LinkPlayerMapObject *linkPlayerMapObj, struct MapObject *mapObj)
{
    mapObj->mapobj_unk_21--;
    linkPlayerMapObj->mode = 1;
    MoveCoords(mapObj->range.as_byte, &mapObj->coords1.x, &mapObj->coords1.y);
    if (!mapObj->mapobj_unk_21)
    {
        npc_coords_shift_still(mapObj);
        linkPlayerMapObj->mode = 2;
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

u8 LinkPlayerDetectCollision(u8 selfMapObjId, u8 a2, s16 x, s16 y)
{
    u8 i;
    for (i = 0; i < 16; i++)
    {
        if (i != selfMapObjId)
        {
            if ((gMapObjects[i].coords2.x == x && gMapObjects[i].coords2.y == y)
             || (gMapObjects[i].coords3.x == x && gMapObjects[i].coords3.y == y))
            {
                return 1;
            }
        }
    }
    return MapGridIsImpassableAt(x, y);
}

void CreateLinkPlayerSprite(u8 linkPlayerId)
{
    struct LinkPlayerMapObject *linkPlayerMapObj = &gLinkPlayerMapObjects[linkPlayerId];
    u8 mapObjId = linkPlayerMapObj->mapObjId;
    struct MapObject *mapObj = &gMapObjects[mapObjId];
    struct Sprite *sprite;

    if (linkPlayerMapObj->active)
    {
        u8 val = GetRivalAvatarGraphicsIdByStateIdAndGender(0, mapObj->mapobj_bit_1);
        mapObj->spriteId = AddPseudoFieldObject(val, SpriteCB_LinkPlayer, 0, 0, 0);
        sprite = &gSprites[mapObj->spriteId];
        sprite->coordOffsetEnabled = TRUE;
        sprite->data[0] = linkPlayerId;
        mapObj->mapobj_bit_2 = 0;
    }
}

void SpriteCB_LinkPlayer(struct Sprite *sprite)
{
    struct LinkPlayerMapObject *linkPlayerMapObj = &gLinkPlayerMapObjects[sprite->data[0]];
    struct MapObject *mapObj = &gMapObjects[linkPlayerMapObj->mapObjId];
    sprite->pos1.x = mapObj->coords1.x;
    sprite->pos1.y = mapObj->coords1.y;
    SetObjectSubpriorityByZCoord(mapObj->elevation, sprite, 1);
    sprite->oam.priority = ZCoordToPriority(mapObj->elevation);
    if (!linkPlayerMapObj->mode)
        StartSpriteAnim(sprite, FieldObjectDirectionToImageAnimId(mapObj->range.as_byte));
    else
        StartSpriteAnimIfDifferent(sprite, get_go_image_anim_num(mapObj->range.as_byte));
    sub_806487C(sprite, 0);
    if (mapObj->mapobj_bit_2)
    {
        sprite->invisible = ((sprite->data[7] & 4) >> 2);
        sprite->data[7]++;
    }
}
