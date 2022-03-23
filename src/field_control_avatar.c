#include "global.h"
#include "field_control_avatar.h"
#include "battle_setup.h"
#include "bike.h"
#include "coord_event_weather.h"
#include "daycare.h"
#include "debug.h"
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
#include "constants/event_bg.h"
#include "constants/map_types.h"

struct Coords32
{
    s32 x;
    s32 y;
};

extern u16 gSpecialVar_LastTalked;
extern u16 gSpecialVar_Facing;
extern struct LinkPlayerObjectEvent gLinkPlayerObjectEvents[];
extern u16 gSpecialVar_0x8004;
extern u16 gSpecialVar_0x8005;
extern u8 gUnknown_020297ED;

static EWRAM_DATA u8 sWildEncounterImmunitySteps = 0;
static EWRAM_DATA u16 sPreviousPlayerMetatileBehavior = 0;

extern u8 gSelectedObjectEvent;

//scripts
extern u8 SecretBase_EventScript_CheckEntrance[];
extern u8 gUnknown_0815281E[];
extern u8 gUnknown_08152C39[];
extern u8 SecretBase_EventScript_PC[];
extern u8 SecretBase_EventScript_RecordMixingPC[];
extern u8 EventScript_PC[];
extern u8 gUnknown_081C6C02[];
extern u8 EventScript_HiddenItem[];
extern u8 Event_TV[];
extern u8 ClosedSootopolisDoorScript[];
extern u8 gUnknown_081A4363[];
extern u8 gUnknown_081C346A[];
extern u8 gUnknown_081616E1[];
extern u8 EventScript_RegionMap[];
extern u8 S_RunningShoesManual[];
extern u8 EventScript_PictureBookshelf[];
extern u8 EventScript_Bookshelf[];
extern u8 EventScript_PokemonCenterBookshelf[];
extern u8 EventScript_Vase[];
extern u8 EventScript_EmptyTrashCan[];
extern u8 EventScript_ShopShelf[];
extern u8 EventScript_Blueprint[];
extern u8 SecretBase_EventScript_SandOrnament[];
extern u8 SecretBase_EventScript_ShieldOrToyTV[];
extern u8 EventScript_UseSurf[];
extern u8 EventScript_UseWaterfall[];
extern u8 EventScript_CannotUseWaterfall[];
extern u8 UseDiveScript[];
extern u8 S_UseDiveUnderwater[];
extern u8 EventScript_FallDownHole[];
extern u8 gUnknown_081A14B8[];
extern u8 S_EggHatch[];
extern u8 gUnknown_0815FD0D[];
extern u8 EventScript_FallDownHoleMtPyre[];

static void GetPlayerPosition(struct MapPosition *);
static void GetInFrontOfPlayerPosition(struct MapPosition *);
static u16 GetPlayerCurMetatileBehavior(void);
static bool8 TryStartInteractionScript(struct MapPosition*, u16, u8);
static const u8 *GetInteractionScript(struct MapPosition*, u8, u8);
static const u8 *GetInteractedObjectEventScript(struct MapPosition *, u8, u8);
static u8 *GetInteractedBackgroundEventScript(struct MapPosition *, u8, u8);
static u8 *GetInteractedMetatileScript(struct MapPosition *, u8, u8);
static u8 *GetInteractedWaterScript(struct MapPosition *, u8, u8);
static bool32 TrySetupDiveDownScript(void);
static bool32 TrySetupDiveEmergeScript(void);
static bool8 TryStartStepBasedScript(struct MapPosition *, u16, u16);
static void UpdateFriendshipStepCounter(void);
static bool8 UpdatePoisonStepCounter(void);
static bool8 CheckStandardWildEncounter(u16);
static bool8 TryArrowWarp(struct MapPosition *, u16, u8);
static bool8 IsWarpMetatileBehavior(u16);
static bool8 IsArrowWarpMetatileBehavior(u16, u8);
static s8 GetWarpEventAtMapPosition(struct MapHeader *, struct MapPosition *);
static void SetupWarp(struct MapHeader *, s8, struct MapPosition *);
static bool8 TryDoorWarp(struct MapPosition *, u16, u8);
static s8 GetWarpEventAtPosition(struct MapHeader *, u16, u16, u8);
static u8 *GetCoordEventScriptAtPosition(struct MapHeader *, u16, u16, u8);
static struct BgEvent *GetBackgroundEventAtPosition(struct MapHeader *, u16, u16, u8);
static bool8 TryStartCoordEventScript(struct MapPosition *);
static bool8 TryStartWarpEventScript(struct MapPosition *, u16);
static bool8 TryStartCrackedFloorHoleScript(u16);
static bool8 TryStartStepCountScript(void);

void ClearPlayerFieldInput(struct FieldInput *input)
{
    input->pressedAButton = 0;
    input->checkStandardWildEncounter = 0;
    input->pressedStartButton = 0;
    input->pressedSelectButton = 0;
    input->input_field_0_4 = 0;
    input->input_field_0_5 = 0;
    input->tookStep = 0;
    input->pressedBButton = 0;
    input->input_field_1_0 = 0;
    input->input_field_1_1 = 0;
    input->input_field_1_2 = 0;
    input->input_field_1_3 = 0;
    input->dpadDirection = 0;
}

void GetPlayerFieldInput(struct FieldInput *input, u16 newKeys, u16 heldKeys)
{
    u8 tileTransitionState = gPlayerAvatar.tileTransitionState;
    u8 runningState = gPlayerAvatar.runningState;
    bool8 forcedMove = MetatileBehavior_IsForcedMovementTile(GetPlayerCurMetatileBehavior());

    if ((tileTransitionState == T_TILE_CENTER && forcedMove == FALSE) || tileTransitionState == T_NOT_MOVING)
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
        if (tileTransitionState == T_TILE_CENTER && runningState == MOVING)
            input->tookStep = TRUE;
        if (forcedMove == FALSE && tileTransitionState == T_TILE_CENTER)
            input->checkStandardWildEncounter = TRUE;
    }

    if (heldKeys & DPAD_UP)
        input->dpadDirection = DIR_NORTH;
    else if (heldKeys & DPAD_DOWN)
        input->dpadDirection = DIR_SOUTH;
    else if (heldKeys & DPAD_LEFT)
        input->dpadDirection = DIR_WEST;
    else if (heldKeys & DPAD_RIGHT)
        input->dpadDirection = DIR_EAST;

#if DEBUG
    if ((heldKeys & R_BUTTON) && input->pressedStartButton)
    {
        input->input_field_1_2 = TRUE;
        input->pressedStartButton = FALSE;
    }

    if (gUnknown_020297ED)
    {
        if (heldKeys & R_BUTTON)
        {
            input->input_field_1_1 = TRUE;
            input->tookStep = FALSE;
            input->checkStandardWildEncounter = FALSE;
            input->input_field_0_4 = FALSE;
            input->input_field_0_5 = FALSE;
            if (newKeys & SELECT_BUTTON)
            {
                input->input_field_1_0 = TRUE;
                input->pressedSelectButton = FALSE;
            }
        }

        if (heldKeys & L_BUTTON)
            input->input_field_1_3 = TRUE;
    }
#endif
}

int ProcessPlayerFieldInput(struct FieldInput *input)
{
    struct MapPosition position;
    u8 playerDirection;
    u16 metatileBehavior;

    playerDirection = GetPlayerFacingDirection();
    GetPlayerPosition(&position);
    metatileBehavior = MapGridGetMetatileBehaviorAt(position.x, position.y);
#if DEBUG
    if (input->input_field_1_3 && dive_warp(&position, metatileBehavior) == TRUE)
        return TRUE;
#endif

    if (
#if DEBUG
     !input->input_field_1_1 &&
#endif
     CheckTrainers() == TRUE)
        return TRUE;

    if (
#if DEBUG
     !input->input_field_1_1 &&
#endif
     TryRunOnFrameMapScript() == TRUE)
        return TRUE;

    if (input->pressedBButton && TrySetupDiveEmergeScript() == TRUE)
        return TRUE;
    if (input->tookStep)
    {
        IncrementGameStat(GAME_STAT_STEPS);
        if (TryStartStepBasedScript(&position, metatileBehavior, playerDirection) == TRUE)
            return TRUE;
    }
    if (input->checkStandardWildEncounter && CheckStandardWildEncounter(metatileBehavior) == TRUE)
        return TRUE;
    if (input->input_field_0_4 && input->dpadDirection == playerDirection)
    {
        if (TryArrowWarp(&position, metatileBehavior, playerDirection) == TRUE)
            return TRUE;
    }

    GetInFrontOfPlayerPosition(&position);
    metatileBehavior = MapGridGetMetatileBehaviorAt(position.x, position.y);
    if (input->pressedAButton && TryStartInteractionScript(&position, metatileBehavior, playerDirection) == TRUE)
        return TRUE;

    if (input->input_field_0_5 && input->dpadDirection == playerDirection)
    {
        if (TryDoorWarp(&position, metatileBehavior, playerDirection) == TRUE)
            return TRUE;
    }
    if (input->pressedAButton && TrySetupDiveDownScript() == TRUE)
        return TRUE;
    if (input->pressedStartButton)
    {
        PlaySE(SE_WIN_OPEN);
        ShowStartMenu();
        return TRUE;
    }
    if (input->pressedSelectButton && UseRegisteredKeyItem() == TRUE)
        return TRUE;

#if DEBUG
    if (input->input_field_1_0)
    {
        debug_sub_80888D8();
        return TRUE;
    }
    if (input->input_field_1_2)
    {
        PlaySE(SE_WIN_OPEN);
        DebugMenu_8077048();
        return TRUE;
    }
#endif

    return FALSE;
}

static void GetPlayerPosition(struct MapPosition *position)
{
    PlayerGetDestCoords(&position->x, &position->y);
    position->height = PlayerGetZCoord();
}

static void GetInFrontOfPlayerPosition(struct MapPosition *position)
{
    s16 x, y;

    GetXYCoordsOneStepInFrontOfPlayer(&position->x, &position->y);
    PlayerGetDestCoords(&x, &y);
    if (MapGridGetElevationAt(x, y) == 0)
        position->height = 0;
    else
        position->height = PlayerGetZCoord();
}

static u16 GetPlayerCurMetatileBehavior(void)
{
    s16 x, y;

    PlayerGetDestCoords(&x, &y);
    return MapGridGetMetatileBehaviorAt(x, y);
}

static bool8 TryStartInteractionScript(struct MapPosition *position, u16 metatileBehavior, u8 direction)
{
    const u8 *script = GetInteractionScript(position, metatileBehavior, direction);
    if (script == NULL)
        return FALSE;

    // Play computer noise for PC-related scripts.
    if (script != gUnknown_0815281E
     && script != gUnknown_08152C39
     && script != SecretBase_EventScript_PC
     && script != SecretBase_EventScript_RecordMixingPC
     && script != EventScript_PC)
        PlaySE(5);

    ScriptContext1_SetupScript(script);
    return TRUE;
}

static const u8 *GetInteractionScript(struct MapPosition *position, u8 metatileBehavior, u8 direction)
{
    const u8 *script = GetInteractedObjectEventScript(position, metatileBehavior, direction);
    if (script != NULL)
        return script;

    script = GetInteractedBackgroundEventScript(position, metatileBehavior, direction);
    if (script != NULL)
        return script;

    script = GetInteractedMetatileScript(position, metatileBehavior, direction);
    if (script != NULL)
        return script;

    script = GetInteractedWaterScript(position, metatileBehavior, direction);
    if (script != NULL)
        return script;

    return NULL;
}

const u8 *GetInteractedLinkPlayerScript(struct MapPosition *position, u8 metatileBehavior, u8 direction)
{
    u8 objectEventId;
    s32 i;

    if (!MetatileBehavior_IsCounter(MapGridGetMetatileBehaviorAt(position->x, position->y)))
        objectEventId = GetObjectEventIdByPosition(position->x, position->y, position->height);
    else
        objectEventId = GetObjectEventIdByPosition(position->x + gDirectionToVectors[direction].x, position->y + gDirectionToVectors[direction].y, position->height);

    if (objectEventId == 16 || gObjectEvents[objectEventId].localId == 0xFF)
        return NULL;

    for (i = 0; i < 4; i++)
    {
        if (gLinkPlayerObjectEvents[i].active == TRUE && gLinkPlayerObjectEvents[i].objEventId == objectEventId)
            return NULL;
    }

    gSelectedObjectEvent = objectEventId;
    gSpecialVar_LastTalked = gObjectEvents[objectEventId].localId;
    gSpecialVar_Facing = direction;
    return GetObjectEventScriptPointerByObjectEventId(objectEventId);
}

static const u8 *GetInteractedObjectEventScript(struct MapPosition *position, u8 metatileBehavior, u8 direction)
{
    u8 objectEventId;
    const u8 *script;

    objectEventId = GetObjectEventIdByPosition(position->x, position->y, position->height);
    if (objectEventId == 16 || gObjectEvents[objectEventId].localId == 0xFF)
    {
        if (MetatileBehavior_IsCounter(metatileBehavior) != TRUE)
            return NULL;

        // Look for an object event on the other side of the counter.
        objectEventId = GetObjectEventIdByPosition(position->x + gDirectionToVectors[direction].x, position->y + gDirectionToVectors[direction].y, position->height);
        if (objectEventId == 16 || gObjectEvents[objectEventId].localId == 0xFF)
            return NULL;
    }

    gSelectedObjectEvent = objectEventId;
    gSpecialVar_LastTalked = gObjectEvents[objectEventId].localId;
    gSpecialVar_Facing = direction;
    script = GetObjectEventScriptPointerByObjectEventId(objectEventId);
    script = GetRamScript(gSpecialVar_LastTalked, script);
    return script;
}

static u8 *GetInteractedBackgroundEventScript(struct MapPosition *position, u8 metatileBehavior, u8 direction)
{
    struct BgEvent *bgEvent = GetBackgroundEventAtPosition(&gMapHeader, position->x - 7, position->y - 7, position->height);

    if (bgEvent == NULL)
        return NULL;
    if (bgEvent->bgUnion.script == NULL)
        return gUnknown_081C6C02;

    switch (bgEvent->kind)
    {
    default:
    case BG_EVENT_PLAYER_FACING_ANY:
        return bgEvent->bgUnion.script;
    case BG_EVENT_PLAYER_FACING_NORTH:
        if (direction != DIR_NORTH)
            return NULL;
        break;
    case BG_EVENT_PLAYER_FACING_SOUTH:
        if (direction != DIR_SOUTH)
            return NULL;
        break;
    case BG_EVENT_PLAYER_FACING_EAST:
        if (direction != DIR_EAST)
            return NULL;
        break;
    case BG_EVENT_PLAYER_FACING_WEST:
        if (direction != DIR_WEST)
            return NULL;
        break;
    case 5:
    case 6:
    case BG_EVENT_HIDDEN_ITEM:
        gSpecialVar_0x8004 = ((u32)bgEvent->bgUnion.script >> 16) + FLAG_HIDDEN_ITEMS_START;
        gSpecialVar_0x8005 = (u32)bgEvent->bgUnion.script;
        if (FlagGet(gSpecialVar_0x8004) == TRUE)
            return NULL;
        return EventScript_HiddenItem;
    case BG_EVENT_SECRET_BASE:
        if (direction == DIR_NORTH)
        {
            gSpecialVar_0x8004 = bgEvent->bgUnion.secretBaseId;
            if (TrySetCurSecretBase())
                return SecretBase_EventScript_CheckEntrance;
        }
        return NULL;
    }

    return bgEvent->bgUnion.script;
}

static u8 *GetInteractedMetatileScript(struct MapPosition *position, u8 metatileBehavior, u8 direction)
{
    if (MetatileBehavior_IsPlayerFacingTVScreen(metatileBehavior, direction) == TRUE)
        return Event_TV;
    if (MetatileBehavior_IsPC(metatileBehavior) == TRUE)
        return EventScript_PC;
    if (MetatileBehavior_IsClosedSootopolisDoor(metatileBehavior) == TRUE)
        return ClosedSootopolisDoorScript;
    if (MetatileBehavior_IsLinkBattleRecords(metatileBehavior) == TRUE)
        return gUnknown_081A4363;
    if (MetatileBehavior_IsPokeblockFeeder(metatileBehavior) == TRUE)
        return gUnknown_081C346A;
    if (MetatileBehavior_IsTrickHousePuzzleDoor(metatileBehavior) == TRUE)
        return gUnknown_081616E1;
    if (MetatileBehavior_IsRegionMap(metatileBehavior) == TRUE)
        return EventScript_RegionMap;
    if (MetatileBehavior_IsRunningShoesManual(metatileBehavior) == TRUE)
        return S_RunningShoesManual;
    if (MetatileBehavior_IsPictureBookShelf(metatileBehavior) == TRUE)
        return EventScript_PictureBookshelf;
    if (MetatileBehavior_IsBookShelf(metatileBehavior) == TRUE)
        return EventScript_Bookshelf;
    if (MetatileBehavior_IsPokeCenterBookShelf(metatileBehavior) == TRUE)
        return EventScript_PokemonCenterBookshelf;
    if (MetatileBehavior_IsVase(metatileBehavior) == TRUE)
        return EventScript_Vase;
    if (MetatileBehavior_IsTrashCan(metatileBehavior) == TRUE)
        return EventScript_EmptyTrashCan;
    if (MetatileBehavior_IsShopShelf(metatileBehavior) == TRUE)
        return EventScript_ShopShelf;
    if (MetatileBehavior_IsBlueprint(metatileBehavior) == TRUE)
        return EventScript_Blueprint;

    if (position->height == MapGridGetElevationAt(position->x, position->y))
    {
        if (MetatileBehavior_IsSecretBasePC(metatileBehavior) == TRUE)
            return SecretBase_EventScript_PC;
        if (MetatileBehavior_IsRecordMixingSecretBasePC(metatileBehavior) == TRUE)
            return SecretBase_EventScript_RecordMixingPC;
        if (MetatileBehavior_IsSecretBaseSandOrnament(metatileBehavior) == TRUE)
            return SecretBase_EventScript_SandOrnament;
        if (MetatileBehavior_IsSecretBaseShieldOrToyTV(metatileBehavior) == TRUE)
            return SecretBase_EventScript_ShieldOrToyTV;
    }

    return NULL;
}

static u8 *GetInteractedWaterScript(struct MapPosition *unused1, u8 metatileBehavior, u8 direction)
{
    if (FlagGet(FLAG_BADGE05_GET) == TRUE && PartyHasMonWithSurf() == TRUE && IsPlayerFacingSurfableFishableWater() == TRUE)
        return EventScript_UseSurf;

    if (MetatileBehavior_IsWaterfall(metatileBehavior) == TRUE)
    {
        if (FlagGet(FLAG_BADGE08_GET) == TRUE && IsPlayerSurfingNorth() == TRUE)
            return EventScript_UseWaterfall;
        else
            return EventScript_CannotUseWaterfall;
    }
    return NULL;
}

static bool32 TrySetupDiveDownScript(void)
{
    if (FlagGet(FLAG_BADGE07_GET) && TrySetDiveWarp() == 2)
    {
        ScriptContext1_SetupScript(UseDiveScript);
        return TRUE;
    }
    return FALSE;
}

static bool32 TrySetupDiveEmergeScript(void)
{
    if (FlagGet(FLAG_BADGE07_GET) && gMapHeader.mapType == MAP_TYPE_UNDERWATER && TrySetDiveWarp() == 1)
    {
        ScriptContext1_SetupScript(S_UseDiveUnderwater);
        return TRUE;
    }
    return FALSE;
}

static bool8 TryStartStepBasedScript(struct MapPosition *position, u16 metatileBehavior, u16 direction)
{
    if (TryStartCoordEventScript(position) == TRUE)
        return TRUE;
    if (TryStartWarpEventScript(position, metatileBehavior) == TRUE)
        return TRUE;
    if (TryStartCrackedFloorHoleScript(metatileBehavior) == TRUE)
        return TRUE;
    if (TryStartStepCountScript() == TRUE)
        return TRUE;
    if (UpdateRepelCounter() == TRUE)
        return TRUE;
    return FALSE;
}

bool8 TryStartCoordEventScript(struct MapPosition *position)
{
    u8 *script = GetCoordEventScriptAtPosition(&gMapHeader, position->x - 7, position->y - 7, position->height);

    if (script == NULL)
        return FALSE;
    ScriptContext1_SetupScript(script);
    return TRUE;
}

bool8 TryStartCrackedFloorHoleScript(u16 metatileBehavior)
{
    if (MetatileBehavior_IsCrackedFloorHole(metatileBehavior))
    {
        ScriptContext1_SetupScript(EventScript_FallDownHole);
        return TRUE;
    }
    return FALSE;
}

bool8 TryStartStepCountScript(void)
{
    IncrementRematchStepCounter();
    UpdateFriendshipStepCounter();
    if (UpdatePoisonStepCounter() == TRUE)
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

void Unref_ClearHappinessStepCounter(void)
{
    VarSet(VAR_HAPPINESS_STEP_COUNTER, 0);
}

static void UpdateFriendshipStepCounter(void)
{
    u16 *ptr = GetVarPointer(VAR_HAPPINESS_STEP_COUNTER);
    int i;

    (*ptr)++;
    (*ptr) %= 128;
    if (*ptr == 0)
    {
        struct Pokemon *mon = gPlayerParty;
        for (i = 0; i < PARTY_SIZE; i++)
        {
            AdjustFriendship(mon, FRIENDSHIP_EVENT_WALKING);
            mon++;
        }
    }
}

void ClearPoisonStepCounter(void)
{
    VarSet(VAR_POISON_STEP_COUNTER, 0);
}

static bool8 UpdatePoisonStepCounter(void)
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

void RestartWildEncounterImmunitySteps(void)
{
    // Starts at 0 and counts up to 4 steps.
    sWildEncounterImmunitySteps = 0;
}

static bool8 CheckStandardWildEncounter(u16 metatileBehavior)
{
    if (sWildEncounterImmunitySteps < 4)
    {
        sWildEncounterImmunitySteps++;
        sPreviousPlayerMetatileBehavior = metatileBehavior;
        return FALSE;
    }

    if (StandardWildEncounter(metatileBehavior, sPreviousPlayerMetatileBehavior) == TRUE)
    {
        sWildEncounterImmunitySteps = 0;
        sPreviousPlayerMetatileBehavior = metatileBehavior;
        return TRUE;
    }

    sPreviousPlayerMetatileBehavior = metatileBehavior;
    return FALSE;
}

static bool8 TryArrowWarp(struct MapPosition *position, u16 metatileBehavior, u8 direction)
{
    s8 warpEventId = GetWarpEventAtMapPosition(&gMapHeader, position);

    if (IsArrowWarpMetatileBehavior(metatileBehavior, direction) == TRUE && warpEventId != -1)
    {
        StoreInitialPlayerAvatarState();
        SetupWarp(&gMapHeader, warpEventId, position);
        DoWarp();
        return TRUE;
    }
    return FALSE;
}

bool8 TryStartWarpEventScript(struct MapPosition *position, u16 metatileBehavior)
{
    s8 warpEventId = GetWarpEventAtMapPosition(&gMapHeader, position);

    if (warpEventId != -1 && IsWarpMetatileBehavior(metatileBehavior) == TRUE)
    {
        StoreInitialPlayerAvatarState();
        SetupWarp(&gMapHeader, warpEventId, position);
        if (MetatileBehavior_IsEscalator(metatileBehavior) == TRUE)
        {
            DoEscalatorWarp(metatileBehavior);
            return TRUE;
        }
        if (MetatileBehavior_IsLavaridgeB1FWarp(metatileBehavior) == TRUE)
        {
            DoLavaridgeGymB1FWarp();
            return TRUE;
        }
        if (MetatileBehavior_IsLavaridge1FWarp(metatileBehavior) == TRUE)
        {
            DoLavaridgeGym1FWarp();
            return TRUE;
        }
        if (MetatileBehavior_IsAquaHideoutWarp(metatileBehavior) == TRUE)
        {
            DoSpinExitWarp();
            return TRUE;
        }
        if (MetatileBehavior_IsMtPyreHole(metatileBehavior) == TRUE)
        {
            ScriptContext1_SetupScript(EventScript_FallDownHoleMtPyre);
            return TRUE;
        }
        DoWarp();
        return TRUE;
    }
    return FALSE;
}

static bool8 IsWarpMetatileBehavior(u16 metatileBehavior)
{
    if (MetatileBehavior_IsWarpDoor(metatileBehavior) != TRUE
     && MetatileBehavior_IsLadder(metatileBehavior) != TRUE
     && MetatileBehavior_IsEscalator(metatileBehavior) != TRUE
     && MetatileBehavior_IsNonAnimDoor(metatileBehavior) != TRUE
     && MetatileBehavior_IsLavaridgeB1FWarp(metatileBehavior) != TRUE
     && MetatileBehavior_IsLavaridge1FWarp(metatileBehavior) != TRUE
     && MetatileBehavior_IsAquaHideoutWarp(metatileBehavior) != TRUE
     && MetatileBehavior_IsMtPyreHole(metatileBehavior) != TRUE)
        return FALSE;
    return TRUE;
}

static bool8 IsArrowWarpMetatileBehavior(u16 metatileBehavior, u8 direction)
{
    switch (direction)
    {
    case DIR_NORTH:
        return MetatileBehavior_IsNorthArrowWarp(metatileBehavior);
    case DIR_SOUTH:
        return MetatileBehavior_IsSouthArrowWarp(metatileBehavior);
    case DIR_WEST:
        return MetatileBehavior_IsWestArrowWarp(metatileBehavior);
    case DIR_EAST:
        return MetatileBehavior_IsEastArrowWarp(metatileBehavior);
    }
    return FALSE;
}

static s8 GetWarpEventAtMapPosition(struct MapHeader *mapHeader, struct MapPosition *position)
{
    return GetWarpEventAtPosition(mapHeader, position->x - 7, position->y - 7, position->height);
}

static void SetupWarp(struct MapHeader *unused, s8 warpEventId, struct MapPosition *position)
{
    struct WarpEvent *warpEvent = &gMapHeader.events->warps[warpEventId];

    if (warpEvent->mapNum == 0x7F)
    {
        SetWarpDestinationToDynamicWarp(warpEvent->warpId);
    }
    else
    {
        const struct MapHeader *mapHeader;

        SetWarpDestinationToMapWarp(warpEvent->mapGroup, warpEvent->mapNum, warpEvent->warpId);
        UpdateEscapeWarp(position->x, position->y);
        mapHeader = Overworld_GetMapHeaderByGroupAndId(warpEvent->mapGroup, warpEvent->mapNum);
        if (mapHeader->events->warps[warpEvent->warpId].mapNum == 0x7F)
            SetDynamicWarp(mapHeader->events->warps[warpEventId].warpId, gSaveBlock1.location.mapGroup, gSaveBlock1.location.mapNum, warpEventId);
    }
}

static bool8 TryDoorWarp(struct MapPosition *position, u16 metatileBehavior, u8 direction)
{
    s8 warpEventId;

    if (direction == DIR_NORTH)
    {
        if (MetatileBehavior_IsOpenSecretBaseDoor(metatileBehavior) == TRUE)
        {
            WarpIntoSecretBase(position, gMapHeader.events);
            return TRUE;
        }
        if (MetatileBehavior_IsWarpDoor(metatileBehavior) == TRUE)
        {
            warpEventId = GetWarpEventAtMapPosition(&gMapHeader, position);
            if (warpEventId != -1 && IsWarpMetatileBehavior(metatileBehavior) == TRUE)
            {
                StoreInitialPlayerAvatarState();
                SetupWarp(&gMapHeader, warpEventId, position);
                DoDoorWarp();
                return TRUE;
            }
        }
    }
    return FALSE;
}

static s8 GetWarpEventAtPosition(struct MapHeader *mapHeader, u16 x, u16 y, u8 elevation)
{
    s32 i;
    struct WarpEvent *warpEvent = mapHeader->events->warps;
    u8 warpCount = mapHeader->events->warpCount;

    for (i = 0; i < warpCount; i++, warpEvent++)
    {
        if (warpEvent->x == x && warpEvent->y == y)
        {
            if (warpEvent->elevation == elevation || warpEvent->elevation == 0)
                return i;
        }
    }
    return -1;
}

static u8 *TryRunCoordEventScript(struct CoordEvent *coordEvent)
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

static u8 *GetCoordEventScriptAtPosition(struct MapHeader *mapHeader, u16 x, u16 y, u8 elevation)
{
    s32 i;
    struct CoordEvent *coordEvents = mapHeader->events->coordEvents;
    u8 coordEventCount = mapHeader->events->coordEventCount;

    for (i = 0; i < coordEventCount; i++)
    {
        if (coordEvents[i].x == x && coordEvents[i].y == y)
        {
            if (coordEvents[i].elevation == elevation || coordEvents[i].elevation == 0)
            {
                u8 *script = TryRunCoordEventScript(&coordEvents[i]);
                if (script != NULL)
                    return script;
            }
        }
    }
    return NULL;
}

u8 *GetCoordEventScriptAtMapPosition(struct MapPosition *position)
{
    return GetCoordEventScriptAtPosition(&gMapHeader, position->x - 7, position->y - 7, position->height);
}

static struct BgEvent *GetBackgroundEventAtPosition(struct MapHeader *mapHeader, u16 x, u16 y, u8 elevation)
{
    u8 i;
    struct BgEvent *bgEvents = mapHeader->events->bgEvents;
    u8 bgEventCount = mapHeader->events->bgEventCount;

    for (i = 0; i < bgEventCount; i++)
    {
        if (bgEvents[i].x == x && bgEvents[i].y == y)
        {
            if (bgEvents[i].elevation == elevation || bgEvents[i].elevation == 0)
                return &bgEvents[i];
        }
    }
    return NULL;
}

bool8 dive_warp(struct MapPosition *position, u16 metatileBehavior)
{
    if (gMapHeader.mapType == MAP_TYPE_UNDERWATER && !MetatileBehavior_IsNotSurfacable(metatileBehavior))
    {
        if (SetDiveWarpEmerge(position->x - 7, position->y - 7))
        {
            StoreInitialPlayerAvatarState();
            DoDiveWarp();
            PlaySE(SE_M_DIVE);
            return TRUE;
        }
    }
    else if (MetatileBehavior_IsDiveable(metatileBehavior) == TRUE)
    {
        if (SetDiveWarpDive(position->x - 7, position->y - 7))
        {
            StoreInitialPlayerAvatarState();
            DoDiveWarp();
            PlaySE(SE_M_DIVE);
            return TRUE;
        }
    }
    return FALSE;
}

u8 TrySetDiveWarp(void)
{
    s16 x, y;
    u8 metatileBehavior;

    PlayerGetDestCoords(&x, &y);
    metatileBehavior = MapGridGetMetatileBehaviorAt(x, y);
    if (gMapHeader.mapType == MAP_TYPE_UNDERWATER && !MetatileBehavior_IsNotSurfacable(metatileBehavior))
    {
        if (SetDiveWarpEmerge(x - 7, y - 7) == TRUE)
            return 1;
    }
    else if (MetatileBehavior_IsDiveable(metatileBehavior) == TRUE)
    {
        if (SetDiveWarpDive(x - 7, y - 7) == TRUE)
            return 2;
    }
    return 0;
}

const u8 *GetObjectEventScriptPointerPlayerFacing(void)
{
    u8 direction;
    struct MapPosition position;

    direction = GetPlayerMovementDirection();
    GetInFrontOfPlayerPosition(&position);
    return GetInteractedObjectEventScript(&position, MapGridGetMetatileBehaviorAt(position.x, position.y), direction);
}

u8 SetCableClubWarp(void)
{
    struct MapPosition position;

    GetPlayerMovementDirection();  //unnecessary
    GetPlayerPosition(&position);
    MapGridGetMetatileBehaviorAt(position.x, position.y);  //unnecessary
    SetupWarp(&gMapHeader, GetWarpEventAtMapPosition(&gMapHeader, &position), &position);
    return 0;
}
