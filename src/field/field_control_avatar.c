#include "global.h"
#include "field_control_avatar.h"
#include "battle_setup.h"
#include "bike.h"
#include "coord_event_weather.h"
#include "daycare.h"
#include "event_data.h"
#include "field_fadetransition.h"
#include "field_player_avatar.h"
#include "field_poison.h"
#include "field_specials.h"
#include "fieldmap.h"
#include "constants/flags.h"
#include "item_menu.h"
#include "metatile_behavior.h"
#include "overworld.h"
#include "safari_zone.h"
#include "script.h"
#include "secret_base.h"
#include "constants/songs.h"
#include "sound.h"
#include "start_menu.h"
#include "trainer_see.h"
#include "constants/vars.h"
#include "wild_encounter.h"

struct Coords32
{
    s32 x;
    s32 y;
};

extern u16 gSpecialVar_LastTalked;
extern u16 gSpecialVar_Facing;
extern struct LinkPlayerMapObject gLinkPlayerMapObjects[];
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;

static EWRAM_DATA u8 gUnknown_0202E8C0 = 0;
static EWRAM_DATA u16 gUnknown_0202E8C2 = 0;

u8 gSelectedMapObject;

//scripts
extern u8 gUnknown_081A2C51[];
extern u8 gUnknown_0815281E[];
extern u8 gUnknown_08152C39[];
extern u8 gUnknown_0815F36C[];
extern u8 gUnknown_0815F43A[];
extern u8 gUnknown_081A0009[];
extern u8 gUnknown_081C6C02[];
extern u8 HiddenItemScript[];
extern u8 Event_TV[];
extern u8 gUnknown_081A0009[];
extern u8 ClosedSootopolisGymDoorScript[];
extern u8 gUnknown_081A4363[];
extern u8 gUnknown_081C346A[];
extern u8 gUnknown_081616E1[];
extern u8 Event_WorldMap[];
extern u8 S_RunningShoesManual[];
extern u8 PictureBookShelfScript[];
extern u8 BookshelfScript[];
extern u8 PokemonCenterBookshelfScript[];
extern u8 VaseScript[];
extern u8 TrashCanScript[];
extern u8 ShopShelfScript[];
extern u8 BlueprintScript[];
extern u8 gUnknown_0815F36C[];
extern u8 gUnknown_0815F43A[];
extern u8 gUnknown_0815F523[];
extern u8 gUnknown_0815F528[];
extern u8 UseSurfScript[];
extern u8 S_UseWaterfall[];
extern u8 S_CannotUseWaterfall[];
extern u8 UseDiveScript[];
extern u8 S_UseDiveUnderwater[];
extern u8 S_FallDownHole[];
extern u8 gUnknown_081A14B8[];
extern u8 S_EggHatch[];
extern u8 gUnknown_0815FD0D[];
extern u8 gUnknown_081C6BDE[];

static void player_get_pos_to_and_height(struct MapPosition *);
static void player_get_next_pos_and_height(struct MapPosition *);
static u16 cur_mapdata_block_role_at_player_pos(int);
static bool8 sub_80681F0(struct MapPosition *position, u16 b, u8 c);
static u8 *TryGetScriptOnPressingA(struct MapPosition *position, u8 b, u8 c);
static u8 *sub_8068364(struct MapPosition *, u8, u8);
static u8 *TryGetInvisibleMapObjectScript(struct MapPosition *, u8, u8 c);
static u8 *sub_8068500(struct MapPosition *, u8, u8);
static u8 *TryGetFieldMoveScript(struct MapPosition *, u8, u8);
static bool32 sub_8068770(void);
static bool32 sub_80687A4(void);
static bool8 sub_80687E4(struct MapPosition *, u16, u16);
static void happiness_algorithm_step(void);
static bool8 overworld_poison_step(void);
static bool8 is_it_battle_time_3(u16);
static bool8 mapheader_run_first_tag2_script_list_match_conditionally(struct MapPosition *, u16, u8);
static bool8 sub_8068B30(u16);
static bool8 is_non_stair_warp_tile(u16, u8);
static s8 map_warp_check_packed(struct MapHeader *, struct MapPosition *);
static void sub_8068C30(struct MapHeader *, s8, struct MapPosition *);
static bool8 map_warp_consider_2_to_inside(struct MapPosition *, u16, u8);
static s8 map_warp_check(struct MapHeader *, u16, u16, u8);
static u8 *mapheader_trigger_activate_at(struct MapHeader *, u16, u16, u8);
static struct BgEvent *FindInvisibleMapObjectByPosition(struct MapHeader *, u16, u16, u8);

void FieldClearPlayerInput(struct FieldInput *input)
{
    input->pressedAButton = 0;
    input->input_field_0_1 = 0;
    input->pressedStartButton = 0;
    input->pressedSelectButton = 0;
    input->input_field_0_4 = 0;
    input->input_field_0_5 = 0;
    input->input_field_0_6 = 0;
    input->pressedBButton = 0;
    input->input_field_1_0 = 0;
    input->input_field_1_1 = 0;
    input->input_field_1_2 = 0;
    input->input_field_1_3 = 0;
    input->dpadDirection = 0;
}

void FieldGetPlayerInput(struct FieldInput *input, u16 newKeys, u16 heldKeys)
{
    u8 r6 = gPlayerAvatar.tileTransitionState;
    u8 r9 = gPlayerAvatar.runningState;
    bool8 forcedMove = MetatileBehavior_IsMoveTile(cur_mapdata_block_role_at_player_pos(r9));

    if ((r6 == 2 && forcedMove == FALSE) || r6 == 0)
    {
        if (GetPlayerSpeed() != 4)
        {
            if (newKeys & START_BUTTON)
                input->pressedStartButton = TRUE;
            if (newKeys & SELECT_BUTTON)
                input->pressedSelectButton = TRUE;
            if (newKeys & A_BUTTON)
                input->pressedAButton = TRUE;
            if (newKeys & B_BUTTON)
                input->pressedBButton = TRUE;
        }
        if (heldKeys & (DPAD_UP | DPAD_DOWN | DPAD_LEFT | DPAD_RIGHT))
        {
            input->input_field_0_4 = TRUE;
            input->input_field_0_5 = TRUE;
        }
    }
    if (forcedMove == FALSE)
    {
        if (r6 == 2 && r9 == 2)
            input->input_field_0_6 = TRUE;
        if (forcedMove == FALSE && r6 == 2)
            input->input_field_0_1 = TRUE;
    }
    if (heldKeys & DPAD_UP)
        input->dpadDirection = DIR_NORTH;
    else if (heldKeys & DPAD_DOWN)
        input->dpadDirection = DIR_SOUTH;
    else if (heldKeys & DPAD_LEFT)
        input->dpadDirection = DIR_WEST;
    else if (heldKeys & DPAD_RIGHT)
        input->dpadDirection = DIR_EAST;
}

int sub_8068024(struct FieldInput *input)
{
    struct MapPosition position;
    u8 r6;
    u16 r4;

    r6 = player_get_direction_lower_nybble();
    player_get_pos_to_and_height(&position);
    r4 = MapGridGetMetatileBehaviorAt(position.x, position.y);
    if (CheckTrainers() == TRUE)
        return TRUE;
    if (mapheader_run_first_tag2_script_list_match() == 1)
        return TRUE;
    if (input->pressedBButton && sub_80687A4() == 1)
        return TRUE;
    if (input->input_field_0_6)
    {
        IncrementGameStat(GAME_STAT_STEPS);
        if (sub_80687E4(&position, r4, r6) == 1)
            return TRUE;
    }
    if (input->input_field_0_1 && is_it_battle_time_3(r4) == 1)
        return TRUE;
    if (input->input_field_0_4 && input->dpadDirection == r6)
    {
        if (mapheader_run_first_tag2_script_list_match_conditionally(&position, r4, r6) == 1)
            return TRUE;
    }
    player_get_next_pos_and_height(&position);
    r4 = MapGridGetMetatileBehaviorAt(position.x, position.y);
    if (input->pressedAButton && sub_80681F0(&position, r4, r6) == 1)
        return TRUE;
    if (input->input_field_0_5 && input->dpadDirection == r6)
    {
        if (map_warp_consider_2_to_inside(&position, r4, r6) == 1)
            return TRUE;
    }
    if (input->pressedAButton && sub_8068770() == 1)
        return TRUE;
    if (input->pressedStartButton)
    {
        PlaySE(SE_WIN_OPEN);
        sub_8071310();
        return TRUE;
    }
    if (input->pressedSelectButton && sub_80A6D1C() == TRUE)
        return TRUE;
    return FALSE;
}

static void player_get_pos_to_and_height(struct MapPosition *position)
{
    PlayerGetDestCoords(&position->x, &position->y);
    position->height = PlayerGetZCoord();
}

static void player_get_next_pos_and_height(struct MapPosition *position)
{
    s16 x, y;

    GetXYCoordsOneStepInFrontOfPlayer(&position->x, &position->y);
    PlayerGetDestCoords(&x, &y);
    if (MapGridGetZCoordAt(x, y) != 0)
        position->height = PlayerGetZCoord();
    else
        position->height = 0;
}

static u16 cur_mapdata_block_role_at_player_pos(int unused)
{
    s16 x, y;

    PlayerGetDestCoords(&x, &y);
    return MapGridGetMetatileBehaviorAt(x, y);
}

static bool8 sub_80681F0(struct MapPosition *position, u16 b, u8 c)
{
    u8 *script = TryGetScriptOnPressingA(position, b, c);

    if (script == NULL)
        return FALSE;

    if (script != gUnknown_0815281E
     && script != gUnknown_08152C39
     && script != gUnknown_0815F36C
     && script != gUnknown_0815F43A
     && script != gUnknown_081A0009)
        PlaySE(5);

    ScriptContext1_SetupScript(script);
    return TRUE;
}

static u8 *TryGetScriptOnPressingA(struct MapPosition *position, u8 b, u8 c)
{
    u8 *script;

    script = sub_8068364(position, b, c);
    if (script != NULL)
        return script;
    script = TryGetInvisibleMapObjectScript(position, b, c);
    if (script != NULL)
        return script;
    script = sub_8068500(position, b, c);
    if (script != NULL)
        return script;
    script = TryGetFieldMoveScript(position, b, c);
    if (script != NULL)
        return script;

    return NULL;
}

u8 *sub_80682A8(struct MapPosition *position, u8 unused, u8 c)
{
    u8 r3;
    s32 i;

    if (!MetatileBehavior_IsCounter(MapGridGetMetatileBehaviorAt(position->x, position->y)))
        r3 = GetFieldObjectIdByXYZ(position->x, position->y, position->height);
    else
        r3 = GetFieldObjectIdByXYZ(position->x + gUnknown_0821664C[c].x, position->y + gUnknown_0821664C[c].y, position->height);
    if (r3 == 16 || gMapObjects[r3].localId == 0xFF)
        return NULL;
    for (i = 0; i < 4; i++)
    {
        if (gLinkPlayerMapObjects[i].active == TRUE && gLinkPlayerMapObjects[i].mapObjId == r3)
            return NULL;
    }
    gSelectedMapObject = r3;
    gSpecialVar_LastTalked = gMapObjects[r3].localId;
    gSpecialVar_Facing = c;
    return GetFieldObjectScriptPointerByFieldObjectId(r3);
}

static u8 *sub_8068364(struct MapPosition *position, u8 b, u8 c)
{
    u8 r3;
    u8 *script;

    r3 = GetFieldObjectIdByXYZ(position->x, position->y, position->height);
    if (r3 == 16 || gMapObjects[r3].localId == 0xFF)
    {
        if (MetatileBehavior_IsCounter(b) != TRUE)
            return NULL;
        r3 = GetFieldObjectIdByXYZ(position->x + gUnknown_0821664C[c].x, position->y + gUnknown_0821664C[c].y, position->height);
        if (r3 == 16 || gMapObjects[r3].localId == 0xFF)
            return NULL;
    }
    //_080683E8
    gSelectedMapObject = r3;
    gSpecialVar_LastTalked = gMapObjects[r3].localId;
    gSpecialVar_Facing = c;
    script = GetFieldObjectScriptPointerByFieldObjectId(r3);
    script = GetRamScript(gSpecialVar_LastTalked, script);
    return script;
}

static u8 *TryGetInvisibleMapObjectScript(struct MapPosition *position, u8 unused, u8 c)
{
    struct BgEvent *bgEvent = FindInvisibleMapObjectByPosition(&gMapHeader, position->x - 7, position->y - 7, position->height);

    if (bgEvent == NULL)
        return NULL;
    if (bgEvent->bgUnion.script == NULL)
        return gUnknown_081C6C02;
    switch (bgEvent->kind)
    {
    case 0:
    default:
        return bgEvent->bgUnion.script;
    case 1:
        if (c != 2)
            return NULL;
        break;
    case 2:
        if (c != 1)
            return NULL;
        break;
    case 3:
        if (c != 4)
            return NULL;
        break;
    case 4:
        if (c != 3)
            return NULL;
        break;
    case 5:
    case 6:
    case 7:
        gSpecialVar_0x8004 = ((u32)bgEvent->bgUnion.script >> 16) + FLAG_HIDDEN_ITEMS_START;
        gSpecialVar_0x8005 = (u32)bgEvent->bgUnion.script;
        if (FlagGet(gSpecialVar_0x8004) == TRUE)
            return NULL;
        return HiddenItemScript;
    case 8:
        if (c == 2)
        {
            gSpecialVar_0x8004 = bgEvent->bgUnion.secretBaseId;
            if (sub_80BC050())
                return gUnknown_081A2C51;
        }
        return NULL;
    }
    return bgEvent->bgUnion.script;
}

static u8 *sub_8068500(struct MapPosition *position, u8 b, u8 c)
{
    s8 height;

    if (MetatileBehavior_IsPlayerFacingTVScreen(b, c) == TRUE)
        return Event_TV;
    if (MetatileBehavior_IsPC(b) == TRUE)
        return gUnknown_081A0009;
    if (MetatileBehavior_IsClosedSootopolisGymDoor(b) == TRUE)
        return ClosedSootopolisGymDoorScript;
    if (is_tile_x84(b) == TRUE)
        return gUnknown_081A4363;
    if (MetatileBehavior_IsPokeblockFeeder(b) == TRUE)
        return gUnknown_081C346A;
    if (MetatileBehavior_IsTrickHousePuzzleDoor(b) == TRUE)
        return gUnknown_081616E1;
    if (MetatileBehavior_IsRegionMap(b) == TRUE)
        return Event_WorldMap;
    if (sub_805791C(b) == TRUE)
        return S_RunningShoesManual;
    if (MetatileBehavior_IsPictureBookShelf(b) == TRUE)
        return PictureBookShelfScript;
    if (MetatileBehavior_IsBookShelf(b) == TRUE)
        return BookshelfScript;
    if (MetatileBehavior_IsPokeCenterBookShelf(b) == TRUE)
        return PokemonCenterBookshelfScript;
    if (MetatileBehavior_IsVase(b) == TRUE)
        return VaseScript;
    if (MetatileBehavior_IsTrashCan(b) == TRUE)
        return TrashCanScript;
    if (MetatileBehavior_IsShopShelf(b) == TRUE)
        return ShopShelfScript;
    if (MetatileBehavior_IsBlueprint(b) == TRUE)
        return BlueprintScript;
    height = position->height;
    if (height == MapGridGetZCoordAt(position->x, position->y))
    {
        if (MetatileBehavior_IsSecretBasePC(b) == TRUE)
            return gUnknown_0815F36C;
        if (sub_805724C(b) == TRUE)
            return gUnknown_0815F43A;
        if (sub_8057364(b) == TRUE)
            return gUnknown_0815F523;
        if (sub_8057378(b) == TRUE)
            return gUnknown_0815F528;
    }
    return NULL;
}

static u8 *TryGetFieldMoveScript(struct MapPosition *unused1, u8 b, u8 unused2)
{
    if (FlagGet(FLAG_BADGE05_GET) == TRUE && PartyHasMonWithSurf() == TRUE && IsPlayerFacingSurfableFishableWater() == TRUE)
        return UseSurfScript;
    if (MetatileBehavior_IsWaterfall(b) == TRUE)
    {
        if (FlagGet(FLAG_BADGE08_GET) == TRUE && IsPlayerSurfingNorth() == TRUE)
            return S_UseWaterfall;
        else
            return S_CannotUseWaterfall;
    }
    return NULL;
}

static bool32 sub_8068770(void)
{
    if (FlagGet(FLAG_BADGE07_GET) && sub_8068F18() == 2)
    {
        ScriptContext1_SetupScript(UseDiveScript);
        return TRUE;
    }
    return FALSE;
}

static bool32 sub_80687A4(void)
{
    if (FlagGet(FLAG_BADGE07_GET) && gMapHeader.mapType == MAP_TYPE_UNDERWATER && sub_8068F18() == 1)
    {
        ScriptContext1_SetupScript(S_UseDiveUnderwater);
        return TRUE;
    }
    return FALSE;
}

static bool8 sub_80687E4(struct MapPosition *position, u16 b, u16 unused)
{
    if (mapheader_trigger_activate_at__run_now(position) == TRUE)
        return TRUE;
    if (sub_8068A64(position, b) == TRUE)
        return TRUE;
    if (sub_8068870(b) == TRUE)
        return TRUE;
    if (sub_8068894() == TRUE)
        return TRUE;
    if (UpdateRepelCounter() == TRUE)
        return TRUE;
    return FALSE;
}

bool8 mapheader_trigger_activate_at__run_now(struct MapPosition *position)
{
    u8 *script = mapheader_trigger_activate_at(&gMapHeader, position->x - 7, position->y - 7, position->height);

    if (script == NULL)
        return FALSE;
    ScriptContext1_SetupScript(script);
    return TRUE;
}

//can be u8, u16, or u32
bool8 sub_8068870(u16 a)
{
    if (MetatileBehavior_IsCrackedFloorHole(a))
    {
        ScriptContext1_SetupScript(S_FallDownHole);
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8068894(void)
{
    IncrementRematchStepCounter();
    happiness_algorithm_step();
    if (overworld_poison_step() == TRUE)
    {
        ScriptContext1_SetupScript(gUnknown_081A14B8);
        return TRUE;
    }
    if (ShouldEggHatch())
    {
        IncrementGameStat(GAME_STAT_HATCHED_EGGS);
        ScriptContext1_SetupScript(S_EggHatch);
        return TRUE;
    }
    if (SafariZoneTakeStep() == TRUE)
        return TRUE;
    if (CountSSTidalStep(1) == TRUE)
    {
        ScriptContext1_SetupScript(gUnknown_0815FD0D);
        return TRUE;
    }
    return FALSE;
}

void unref_sub_80688F8(void)
{
    VarSet(VAR_HAPPINESS_STEP_COUNTER, 0);
}

static void happiness_algorithm_step(void)
{
    u16 *ptr = GetVarPointer(VAR_HAPPINESS_STEP_COUNTER);
    int i;

    (*ptr)++;
    (*ptr) %= 128;
    if (*ptr == 0)
    {
        struct Pokemon *pkmn = gPlayerParty;

        for (i = 5; i >= 0; i--)
        {
            AdjustFriendship(pkmn, 5);
            pkmn++;
        }
    }
}

void overworld_poison_timer_set(void)
{
    VarSet(VAR_POISON_STEP_COUNTER, 0);
}

static bool8 overworld_poison_step(void)
{
    u16 *ptr;

    if (gMapHeader.mapType != MAP_TYPE_SECRET_BASE)
    {
        ptr = GetVarPointer(VAR_POISON_STEP_COUNTER);
        (*ptr)++;
        (*ptr) %= 4;
        if (*ptr == 0)
        {
            switch (DoPoisonFieldEffect())
            {
            case 0:
                return FALSE;
            case 1:
                return FALSE;
            case 2:
                return TRUE;
            }
        }
    }
    return FALSE;
}

void prev_quest_postbuffer_cursor_backup_reset(void)
{
    gUnknown_0202E8C0 = 0;
}

static bool8 is_it_battle_time_3(u16 a)
{
    if (gUnknown_0202E8C0 < 4)
    {
        gUnknown_0202E8C0++;
        gUnknown_0202E8C2 = a;
        return FALSE;
    }
    if (StandardWildEncounter(a, gUnknown_0202E8C2) == TRUE)
    {
        gUnknown_0202E8C0 = 0;
        gUnknown_0202E8C2 = a;
        return TRUE;
    }
    else
    {
        gUnknown_0202E8C2 = a;
        return FALSE;
    }
}

static bool8 mapheader_run_first_tag2_script_list_match_conditionally(struct MapPosition *position, u16 b, u8 c)
{
    s8 r6 = map_warp_check_packed(&gMapHeader, position);

    if (is_non_stair_warp_tile(b, c) == TRUE && r6 != -1)
    {
        walkrun_find_lowest_active_bit_in_bitfield();
        sub_8068C30(&gMapHeader, r6, position);
        sub_8080E88();
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8068A64(struct MapPosition *position, u16 b)
{
    s8 r4 = map_warp_check_packed(&gMapHeader, position);

    if (r4 != -1 && sub_8068B30(b) == TRUE)
    {
        walkrun_find_lowest_active_bit_in_bitfield();
        sub_8068C30(&gMapHeader, r4, position);
        if (MetatileBehavior_IsEscalator(b) == TRUE)
        {
            sub_8080F2C(b);
            return TRUE;
        }
        if (MetatileBehavior_IsLavaridgeB1FWarp(b) == TRUE)
        {
            sub_8080F48();
            return TRUE;
        }
        if (MetatileBehavior_IsLavaridge1FWarp(b) == TRUE)
        {
            sub_8080F58();
            return TRUE;
        }
        if (MetatileBehavior_IsAquaHideoutWarp(b) == TRUE)
        {
            sub_8080F68();
            return TRUE;
        }
        if (MetatileBehavior_IsMtPyreHole(b) == TRUE)
        {
            ScriptContext1_SetupScript(gUnknown_081C6BDE);
            return TRUE;
        }
        sub_8080E88();
        return TRUE;
    }
    return FALSE;
}

static bool8 sub_8068B30(u16 a)
{
    if (MetatileBehavior_IsWarpDoor(a) != TRUE
     && MetatileBehavior_IsLadder(a) != TRUE
     && MetatileBehavior_IsEscalator(a) != TRUE
     && MetatileBehavior_IsNonAnimDoor(a) != TRUE
     && MetatileBehavior_IsLavaridgeB1FWarp(a) != TRUE
     && MetatileBehavior_IsLavaridge1FWarp(a) != TRUE
     && MetatileBehavior_IsAquaHideoutWarp(a) != TRUE
     && MetatileBehavior_IsMtPyreHole(a) != TRUE)
        return FALSE;
    return TRUE;
}

static bool8 is_non_stair_warp_tile(u16 a, u8 b)
{
    switch (b)
    {
    case 2:
        return MetatileBehavior_IsNorthArrowWarp(a);
    case 1:
        return MetatileBehavior_IsSouthArrowWarp(a);
    case 3:
        return MetatileBehavior_IsWestArrowWarp(a);
    case 4:
        return MetatileBehavior_IsEastArrowWarp(a);
    }
    return FALSE;
}

static s8 map_warp_check_packed(struct MapHeader *mapHeader, struct MapPosition *position)
{
    return map_warp_check(mapHeader, position->x - 7, position->y - 7, position->height);
}

static void sub_8068C30(struct MapHeader *unused, s8 b, struct MapPosition *position)
{
    struct WarpEvent *warpEvent = &gMapHeader.events->warps[b];

    if (warpEvent->mapNum == 0x7F)
    {
        copy_saved_warp2_bank_and_enter_x_to_warp1(warpEvent->mapGroup);
    }
    else
    {
        struct MapHeader *mapHeader;

        warp1_set_2(warpEvent->unk7, warpEvent->mapNum, warpEvent->mapGroup);
        sub_80535C4(position->x, position->y);
        mapHeader = Overworld_GetMapHeaderByGroupAndId(warpEvent->unk7, warpEvent->mapNum);
        if (mapHeader->events->warps[warpEvent->mapGroup].mapNum == 0x7F)
            saved_warp2_set(mapHeader->events->warps[b].mapGroup, gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum, b);
    }
}

static bool8 map_warp_consider_2_to_inside(struct MapPosition *position, u16 b, u8 c)
{
    s8 r4;

    if (c == 2)
    {
        if (sub_80571C0(b) == TRUE)
        {
            sub_80BC038(position, gMapHeader.events);
            return TRUE;
        }
        if (MetatileBehavior_IsWarpDoor(b) == TRUE)
        {
            r4 = map_warp_check_packed(&gMapHeader, position);
            if (r4 != -1 && sub_8068B30(b) == TRUE)
            {
                walkrun_find_lowest_active_bit_in_bitfield();
                sub_8068C30(&gMapHeader, r4, position);
                sub_8080EF0();
                return TRUE;
            }
        }
    }
    return FALSE;
}

static s8 map_warp_check(struct MapHeader *mapHeader, u16 x, u16 y, u8 warpId)
{
    s32 i;
    struct WarpEvent *warpEvent = mapHeader->events->warps;
    u8 warpCount = mapHeader->events->warpCount;

    for (i = 0; i < warpCount; i++, warpEvent++)
    {
        if ((u16)warpEvent->x == x && (u16)warpEvent->y == y)
        {
            if ((u8)warpEvent->warpId == warpId || (u8)warpEvent->warpId == 0)
                return i;
        }
    }
    return -1;
}

static u8 *trigger_activate(struct CoordEvent *coordEvent)
{
    if (coordEvent != NULL)
    {
        if (coordEvent->script == NULL)
        {
            DoCoordEventWeather(coordEvent->trigger);
            return NULL;
        }
        if (coordEvent->trigger == 0)
        {
            ScriptContext2_RunNewScript(coordEvent->script);
            return NULL;
        }
        if (VarGet(coordEvent->trigger) == (u8)coordEvent->index)
            return coordEvent->script;
    }
    return NULL;
}

static u8 *mapheader_trigger_activate_at(struct MapHeader *mapHeader, u16 x, u16 y, u8 elevation)
{
    s32 i;
    struct CoordEvent *coordEvents = mapHeader->events->coordEvents;
    u8 coordEventCount = mapHeader->events->coordEventCount;

    for (i = 0; i < coordEventCount; i++)
    {
        if ((u16)coordEvents[i].x == x && (u16)coordEvents[i].y == y)
        {
            if (coordEvents[i].elevation == elevation || coordEvents[i].elevation == 0)
            {
                u8 *script = trigger_activate(&coordEvents[i]);
                if (script != NULL)
                    return script;
            }
        }
    }
    return NULL;
}

u8 *sub_8068E24(struct MapPosition *position)
{
    return mapheader_trigger_activate_at(&gMapHeader, position->x - 7, position->y - 7, position->height);
}

static struct BgEvent *FindInvisibleMapObjectByPosition(struct MapHeader *mapHeader, u16 b, u16 c, u8 d)
{
    u8 i;
    struct BgEvent *bgEvents = mapHeader->events->bgEvents;
    u8 bgEventCount = mapHeader->events->bgEventCount;

    for (i = 0; i < bgEventCount; i++)
    {
        if ((u16)bgEvents[i].x == b && (u16)bgEvents[i].y == c)
        {
            if (bgEvents[i].unk4 == d || bgEvents[i].unk4 == 0)
                return &bgEvents[i];
        }
    }
    return NULL;
}

int dive_warp(struct MapPosition *position, u16 b)
{
    if (gMapHeader.mapType == MAP_TYPE_UNDERWATER && sub_805750C(b) == 0)
    {
        if (sub_80538B0(position->x - 7, position->y - 7))
        {
            walkrun_find_lowest_active_bit_in_bitfield();
            sp13E_warp_to_last_warp();
            PlaySE(SE_W291);
            return TRUE;
        }
    }
    else if (sub_80574EC(b) == TRUE)
    {
        if (sub_80538D0(position->x - 7, position->y - 7))
        {
            walkrun_find_lowest_active_bit_in_bitfield();
            sp13E_warp_to_last_warp();
            PlaySE(SE_W291);
            return TRUE;
        }
    }
    return FALSE;
}

u8 sub_8068F18(void)
{
    s16 x, y;
    u8 r5;

    PlayerGetDestCoords(&x, &y);
    r5 = MapGridGetMetatileBehaviorAt(x, y);
    if (gMapHeader.mapType == MAP_TYPE_UNDERWATER && sub_805750C(r5) == 0)
    {
        if (sub_80538B0(x - 7, y - 7) == TRUE)
            return 1;
    }
    else if (sub_80574EC(r5) == TRUE)
    {
        if (sub_80538D0(x - 7, y - 7) == TRUE)
            return 2;
    }
    return 0;
}

u8 *GetFieldObjectScriptPointerPlayerFacing(void)
{
    u8 r4;
    struct MapPosition position;

    r4 = player_get_direction_upper_nybble();
    player_get_next_pos_and_height(&position);
    return sub_8068364(&position, MapGridGetMetatileBehaviorAt(position.x, position.y), r4);
}

int SetCableClubWarp(void)
{
    struct MapPosition position;

    player_get_direction_upper_nybble();  //unnecessary
    player_get_pos_to_and_height(&position);
    MapGridGetMetatileBehaviorAt(position.x, position.y);  //unnecessary
    sub_8068C30(&gMapHeader, map_warp_check_packed(&gMapHeader, &position), &position);
    return 0;
}
