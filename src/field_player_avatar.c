#include "global.h"
#include "bike.h"
#include "event_data.h"
#include "event_object_movement.h"
#include "field_effect.h"
#include "field_effect_helpers.h"
#include "field_player_avatar.h"
#include "fieldmap.h"
#include "main.h"
#include "menu.h"
#include "metatile_behavior.h"
#include "new_game.h"
#include "overworld.h"
#include "party_menu.h"
#include "random.h"
#include "rotating_gate.h"
#include "script.h"
#include "sound.h"
#include "strings2.h"
#include "task.h"
#include "tv.h"
#include "wild_encounter.h"
#include "constants/event_object_movement.h"
#include "constants/event_objects.h"
#include "constants/field_effects.h"
#include "constants/moves.h"
#include "constants/songs.h"
#include "constants/species.h"
#include "constants/trainer_types.h"

EWRAM_DATA struct PlayerAvatar gPlayerAvatar = {0};

// Static declarations

static bool8 sub_8058854(struct ObjectEvent *, u8);
static void npc_clear_strange_bits(struct ObjectEvent *a);
static void MovePlayerAvatarUsingKeypadInput(u8 a, u16 b, u16 c);
static void PlayerAllowForcedMovementIfMovingSameDirection(void);
static bool8 TryDoMetatileBehaviorForcedMovement(void);
static u8 GetForcedMovementByMetatileBehavior(void);
static bool8 ForcedMovement_None(void);
static bool8 ForcedMovement_Slip(void);
static bool8 ForcedMovement_WalkSouth(void);
static bool8 ForcedMovement_WalkNorth(void);
static bool8 ForcedMovement_WalkWest(void);
static bool8 ForcedMovement_WalkEast(void);
static bool8 ForcedMovement_RideCurrentSouth(void);
static bool8 ForcedMovement_RideCurrentNorth(void);
static bool8 ForcedMovement_RideCurrentWest(void);
static bool8 ForcedMovement_RideCurrentEast(void);
static bool8 ForcedMovement_SlideSouth(void);
static bool8 ForcedMovement_SlideNorth(void);
static bool8 ForcedMovement_SlideWest(void);
static bool8 ForcedMovement_SlideEast(void);
static bool8 ForcedMovement_SecretBaseJumpMat(void);
static bool8 ForcedMovement_SecretBaseSpinMat(void);
static bool8 ForcedMovement_MuddySlope(void);
static void MovePlayerNotOnBike(u8 a, u16 b);
static u8 CheckMovementInputNotOnBike(u8 a);
static void PlayerNotOnBikeNotMoving(u8 direction, u16 heldKeys);
static void PlayerNotOnBikeTurningInPlace(u8 direction, u16 heldKeys);
static void sub_8058D0C(u8 direction, u16 heldKeys);
static u8 CheckForPlayerAvatarCollision(u8 a);
static bool8 sub_8058EF0(s16 x, s16 y, u8 direction);
static bool8 ShouldJumpLedge(s16 a, s16 b, u8 c);
static u8 sub_8058F6C(s16 a, s16 b, u8 c);
static void check_acro_bike_metatile(s16 unused1, s16 unused2, u8 c, u8 *d);
static void DoPlayerAvatarTransition(void);
static void nullsub_49(struct ObjectEvent *a);
static void PlayerAvatarTransition_Normal(struct ObjectEvent *a);
static void PlayerAvatarTransition_MachBike(struct ObjectEvent *a);
static void PlayerAvatarTransition_AcroBike(struct ObjectEvent *a);
static void PlayerAvatarTransition_Surfing(struct ObjectEvent *a);
static void PlayerAvatarTransition_Underwater(struct ObjectEvent *a);
static void PlayerAvatarTransition_ReturnToField(struct ObjectEvent *objEvent);
static bool8 player_is_anim_in_certain_ranges(void);
static bool8 sub_80592A4(void);
static bool8 PlayerIsAnimActive(void);
static bool8 PlayerCheckIfAnimFinishedOrInactive(void);
static void PlayerRun(u8 a);
static void PlayerNotOnBikeCollide(u8 a);
static void PlayCollisionSoundIfNotFacingWarp(u8 a);
static void sub_8059D60(struct ObjectEvent *a);
static void StartStrengthAnim(u8 a, u8 b);
static void Task_BumpBoulder(u8 taskId);
static bool8 sub_8059E84(struct Task *task, struct ObjectEvent *b, struct ObjectEvent *c);
static bool8 do_boulder_dust(struct Task *task, struct ObjectEvent *b, struct ObjectEvent *c);
static bool8 sub_8059F40(struct Task *task, struct ObjectEvent *b, struct ObjectEvent *c);
static void DoPlayerMatJump(void);
static void DoPlayerAvatarSecretBaseMatJump(u8 taskId);
static u8 PlayerAvatar_DoSecretBaseMatJump(struct Task *task, struct ObjectEvent *objectEvent);
static void DoPlayerMatSpin(void);
static void PlayerAvatar_DoSecretBaseMatSpin(u8 taskId);
static bool8 PlayerAvatar_SecretBaseMatSpinStep0(struct Task *task, struct ObjectEvent *objectEvent);
static bool8 PlayerAvatar_SecretBaseMatSpinStep1(struct Task *task, struct ObjectEvent *objectEvent);
static bool8 PlayerAvatar_SecretBaseMatSpinStep2(struct Task *task, struct ObjectEvent *objectEvent);
static bool8 PlayerAvatar_SecretBaseMatSpinStep3(struct Task *task, struct ObjectEvent *objectEvent);
static void sub_805A20C(u8 a);
static void taskFF_0805D1D4(u8 taskId);
static void sub_805A2D0(u8 taskId);
static void Task_Fishing(u8 taskId);
static bool8 Fishing1(struct Task *task);
static bool8 Fishing2(struct Task *task);
static bool8 Fishing3(struct Task *task);
static bool8 Fishing4(struct Task *task);
static bool8 Fishing5(struct Task *task);
static bool8 Fishing6(struct Task *task);
static bool8 Fishing7(struct Task *task);
static bool8 Fishing8(struct Task *task);
static bool8 Fishing9(struct Task *task);
static bool8 Fishing10(struct Task *task);
static bool8 Fishing11(struct Task *task);
static bool8 Fishing12(struct Task *task);
static bool8 Fishing13(struct Task *task);
static bool8 Fishing14(struct Task *task);
static bool8 Fishing15(struct Task *task);
static bool8 Fishing16(struct Task *task);
static void AlignFishingAnimationFrames(void);

u8 debug_sub_805F2B0(u8);
u8 debug_sub_805F2DC(u8);

static bool8 (*const sForcedMovementTestFuncs[])(u8) =
{
    MetatileBehavior_IsTrickHouseSlipperyFloor,
    MetatileBehavior_IsIce_2,
    MetatileBehavior_IsWalkSouth,
    MetatileBehavior_IsWalkNorth,
    MetatileBehavior_IsWalkWest,
    MetatileBehavior_IsWalkEast,
    MetatileBehavior_IsSouthwardCurrent,
    MetatileBehavior_IsNorthwardCurrent,
    MetatileBehavior_IsWestwardCurrent,
    MetatileBehavior_IsEastwardCurrent,
    MetatileBehavior_IsSlideSouth,
    MetatileBehavior_IsSlideNorth,
    MetatileBehavior_IsSlideWest,
    MetatileBehavior_IsSlideEast,
    MetatileBehavior_IsWaterfall,
    MetatileBehavior_IsSecretBaseJumpMat,
    MetatileBehavior_IsSecretBaseSpinMat,
    MetatileBehavior_IsMuddySlope,
};
static bool8 (*const sForcedMovementFuncs[])(void) =
{
    ForcedMovement_None,
    ForcedMovement_Slip,
    ForcedMovement_Slip,
    ForcedMovement_WalkSouth,
    ForcedMovement_WalkNorth,
    ForcedMovement_WalkWest,
    ForcedMovement_WalkEast,
    ForcedMovement_RideCurrentSouth,
    ForcedMovement_RideCurrentNorth,
    ForcedMovement_RideCurrentWest,
    ForcedMovement_RideCurrentEast,
    ForcedMovement_SlideSouth,
    ForcedMovement_SlideNorth,
    ForcedMovement_SlideWest,
    ForcedMovement_SlideEast,
    ForcedMovement_RideCurrentSouth,
    ForcedMovement_SecretBaseJumpMat,
    ForcedMovement_SecretBaseSpinMat,
    ForcedMovement_MuddySlope,
};
static void (*const gUnknown_0830FBEC[])(u8, u16) =
{
    PlayerNotOnBikeNotMoving,
    PlayerNotOnBikeTurningInPlace,
    sub_8058D0C,
};
static bool8 (*const gUnknown_0830FBF8[])(u8) =
{
    MetatileBehavior_IsBumpySlope,
    MetatileBehavior_IsIsolatedVerticalRail,
    MetatileBehavior_IsIsolatedHorizontalRail,
    MetatileBehavior_IsVerticalRail,
    MetatileBehavior_IsHorizontalRail,
};
static const u8 gUnknown_0830FC0C[] = {9, 10, 11, 12, 13};
static void (*const gUnknown_0830FC14[])(struct ObjectEvent *) =
{
    PlayerAvatarTransition_Normal,
    PlayerAvatarTransition_MachBike,
    PlayerAvatarTransition_AcroBike,
    PlayerAvatarTransition_Surfing,
    PlayerAvatarTransition_Underwater,
    PlayerAvatarTransition_ReturnToField,
    nullsub_49,
    nullsub_49,
};
static bool8 (*const sArrowWarpMetatileBehaviorChecks[])(u8) =
{
    MetatileBehavior_IsSouthArrowWarp,
    MetatileBehavior_IsNorthArrowWarp,
    MetatileBehavior_IsWestArrowWarp,
    MetatileBehavior_IsEastArrowWarp,
};
static const u8 sRivalAvatarGfxIds[][2] =
{
    {OBJ_EVENT_GFX_RIVAL_BRENDAN_NORMAL,     OBJ_EVENT_GFX_RIVAL_MAY_NORMAL},
    {OBJ_EVENT_GFX_RIVAL_BRENDAN_MACH_BIKE,  OBJ_EVENT_GFX_RIVAL_MAY_MACH_BIKE},
    {OBJ_EVENT_GFX_RIVAL_BRENDAN_ACRO_BIKE,  OBJ_EVENT_GFX_RIVAL_MAY_ACRO_BIKE},
    {OBJ_EVENT_GFX_RIVAL_BRENDAN_SURFING,    OBJ_EVENT_GFX_RIVAL_MAY_SURFING},
    {OBJ_EVENT_GFX_BRENDAN_UNDERWATER,       OBJ_EVENT_GFX_MAY_UNDERWATER},
    {OBJ_EVENT_GFX_RIVAL_BRENDAN_FIELD_MOVE, OBJ_EVENT_GFX_RIVAL_MAY_FIELD_MOVE},
    {OBJ_EVENT_GFX_BRENDAN_FISHING,          OBJ_EVENT_GFX_MAY_FISHING},
    {OBJ_EVENT_GFX_BRENDAN_WATERING,         OBJ_EVENT_GFX_MAY_WATERING},
};
static const u8 sPlayerAvatarGfxIds[][2] =
{
    {OBJ_EVENT_GFX_BRENDAN_NORMAL,     OBJ_EVENT_GFX_MAY_NORMAL},
    {OBJ_EVENT_GFX_BRENDAN_MACH_BIKE,  OBJ_EVENT_GFX_MAY_MACH_BIKE},
    {OBJ_EVENT_GFX_BRENDAN_ACRO_BIKE,  OBJ_EVENT_GFX_MAY_ACRO_BIKE},
    {OBJ_EVENT_GFX_BRENDAN_SURFING,    OBJ_EVENT_GFX_MAY_SURFING},
    {OBJ_EVENT_GFX_BRENDAN_UNDERWATER, OBJ_EVENT_GFX_MAY_UNDERWATER},
    {OBJ_EVENT_GFX_BRENDAN_FIELD_MOVE, OBJ_EVENT_GFX_MAY_FIELD_MOVE},
    {OBJ_EVENT_GFX_BRENDAN_FISHING,    OBJ_EVENT_GFX_MAY_FISHING},
    {OBJ_EVENT_GFX_BRENDAN_WATERING,   OBJ_EVENT_GFX_MAY_WATERING},
};
static const u8 gUnknown_0830FC64[2][5][2] =
{
    //male
    {
        {OBJ_EVENT_GFX_BRENDAN_NORMAL, 1},
        {OBJ_EVENT_GFX_BRENDAN_MACH_BIKE, 2},
        {OBJ_EVENT_GFX_BRENDAN_ACRO_BIKE, 4},
        {OBJ_EVENT_GFX_BRENDAN_SURFING, 8},
        {OBJ_EVENT_GFX_BRENDAN_UNDERWATER, 16},
    },
    //female
    {
        {OBJ_EVENT_GFX_MAY_NORMAL, 1},
        {OBJ_EVENT_GFX_MAY_MACH_BIKE, 2},
        {OBJ_EVENT_GFX_MAY_ACRO_BIKE, 4},
        {OBJ_EVENT_GFX_MAY_SURFING, 8},
        {OBJ_EVENT_GFX_MAY_UNDERWATER, 16},
    }
};
static bool8 (*const sArrowWarpMetatileBehaviorChecks2[])(u8) =  //Duplicate of sArrowWarpMetatileBehaviorChecks
{
    MetatileBehavior_IsSouthArrowWarp,
    MetatileBehavior_IsNorthArrowWarp,
    MetatileBehavior_IsWestArrowWarp,
    MetatileBehavior_IsEastArrowWarp,
};
static u8 (*const gUnknown_0830FC88[])(struct Task *, struct ObjectEvent *, struct ObjectEvent *) =
{
    sub_8059E84,
    do_boulder_dust,
    sub_8059F40,
};
static u8 (*const sPlayerAvatarSecretBaseMatJump[])(struct Task *, struct ObjectEvent *) =
{
    PlayerAvatar_DoSecretBaseMatJump,
};
static u8 (*const sPlayerAvatarSecretBaseMatSpin[])(struct Task *, struct ObjectEvent *) =
{
    PlayerAvatar_SecretBaseMatSpinStep0,
    PlayerAvatar_SecretBaseMatSpinStep1,
    PlayerAvatar_SecretBaseMatSpinStep2,
    PlayerAvatar_SecretBaseMatSpinStep3,
};

movement_type_empty_callback(MovementType_Player);

void player_step(u8 direction, u16 newKeys, u16 heldKeys)
{
    struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];

    sub_8059D60(playerObjEvent);
    if (gPlayerAvatar.preventStep == FALSE)
    {
        Bike_TryAcroBikeHistoryUpdate(newKeys, heldKeys);
        if (!sub_8058854(playerObjEvent, direction))
        {
            npc_clear_strange_bits(playerObjEvent);
            DoPlayerAvatarTransition();
            if (TryDoMetatileBehaviorForcedMovement() == 0)
            {
                MovePlayerAvatarUsingKeypadInput(direction, newKeys, heldKeys);
                PlayerAllowForcedMovementIfMovingSameDirection();
            }
        }
    }
}

static bool8 sub_8058854(struct ObjectEvent *playerObjEvent, u8 direction)
{
    if (ObjectEventIsMovementOverridden(playerObjEvent)
     && !ObjectEventClearHeldMovementIfFinished(playerObjEvent))
    {
        u8 heldMovementActionId = ObjectEventGetHeldMovementActionId(playerObjEvent);
        if (heldMovementActionId > 24 && heldMovementActionId < 29 && direction != DIR_NONE && playerObjEvent->movementDirection != direction)
        {
            ObjectEventClearHeldMovement(playerObjEvent);
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    }
    return FALSE;
}

static void npc_clear_strange_bits(struct ObjectEvent *objEvent)
{
    objEvent->inanimate = 0;
    objEvent->disableAnim = 0;
    objEvent->facingDirectionLocked = 0;
    gPlayerAvatar.flags &= ~PLAYER_AVATAR_FLAG_DASH;
}

static void MovePlayerAvatarUsingKeypadInput(u8 direction, u16 newKeys, u16 heldKeys)
{
    if ((gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_MACH_BIKE)
     || (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_ACRO_BIKE))
        MovePlayerOnBike(direction, newKeys, heldKeys);
    else
        MovePlayerNotOnBike(direction, heldKeys);
}

static void PlayerAllowForcedMovementIfMovingSameDirection(void)
{
    if (gPlayerAvatar.runningState == MOVING)
        gPlayerAvatar.flags &= ~PLAYER_AVATAR_FLAG_5;
}

static bool8 TryDoMetatileBehaviorForcedMovement(void)
{
#if DEBUG
    if (gUnknown_020297ED != 0 && (gMain.heldKeys & R_BUTTON))
        return 0;
#endif
    return sForcedMovementFuncs[GetForcedMovementByMetatileBehavior()]();
}

static u8 GetForcedMovementByMetatileBehavior(void)
{
    u8 i;

    if (!(gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_5))
    {
        u8 metatileBehavior = gObjectEvents[gPlayerAvatar.objectEventId].currentMetatileBehavior;

        for (i = 0; i < 18; i++)
        {
            if (sForcedMovementTestFuncs[i](metatileBehavior))
                return i + 1;
        }
    }
    return 0;
}

static bool8 ForcedMovement_None(void)
{
    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_6)
    {
        struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];

        playerObjEvent->facingDirectionLocked = 0;
        playerObjEvent->enableAnim = 1;
        SetObjectEventDirection(playerObjEvent, playerObjEvent->facingDirection);
        gPlayerAvatar.flags &= ~PLAYER_AVATAR_FLAG_6;
    }
    return FALSE;
}

static u8 DoForcedMovement(u8 direction, void (*b)(u8))
{
    struct PlayerAvatar *playerAvatar = &gPlayerAvatar;
    u8 collisionType = CheckForPlayerAvatarCollision(direction);

    playerAvatar->flags |= PLAYER_AVATAR_FLAG_6;
    if (collisionType != 0)
    {
        ForcedMovement_None();
        if (collisionType <= 4)
        {
            return 0;
        }
        else
        {
            if (collisionType == COLLISION_LEDGE_JUMP)
                PlayerJumpLedge(direction);
            playerAvatar->flags |= PLAYER_AVATAR_FLAG_6;
            playerAvatar->runningState = MOVING;
            return 1;
        }
    }
    else
    {
        playerAvatar->runningState = MOVING;
        b(direction);
        return 1;
    }
}

static u8 DoForcedMovementInCurrentDirection(void (*a)(u8))
{
    struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];

    playerObjEvent->disableAnim = 1;
    return DoForcedMovement(playerObjEvent->movementDirection, a);
}

static bool8 ForcedMovement_Slip(void)
{
    return DoForcedMovementInCurrentDirection(PlayerGoSpeed2);
}

static bool8 ForcedMovement_WalkSouth(void)
{
    return DoForcedMovement(DIR_SOUTH, PlayerGoSpeed1);
}

static bool8 ForcedMovement_WalkNorth(void)
{
    return DoForcedMovement(DIR_NORTH, PlayerGoSpeed1);
}

static bool8 ForcedMovement_WalkWest(void)
{
    return DoForcedMovement(DIR_WEST, PlayerGoSpeed1);
}

static bool8 ForcedMovement_WalkEast(void)
{
    return DoForcedMovement(DIR_EAST, PlayerGoSpeed1);
}

static bool8 ForcedMovement_RideCurrentSouth(void)
{
    return DoForcedMovement(DIR_SOUTH, PlayerRideWaterCurrent);
}

static bool8 ForcedMovement_RideCurrentNorth(void)
{
    return DoForcedMovement(DIR_NORTH, PlayerRideWaterCurrent);
}

static bool8 ForcedMovement_RideCurrentWest(void)
{
    return DoForcedMovement(DIR_WEST, PlayerRideWaterCurrent);
}

static bool8 ForcedMovement_RideCurrentEast(void)
{
    return DoForcedMovement(DIR_EAST, PlayerRideWaterCurrent);
}

static u8 ForcedMovement_Slide(u8 direction, void (*b)(u8))
{
    struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];

    playerObjEvent->disableAnim = 1;
    playerObjEvent->facingDirectionLocked = 1;
    return DoForcedMovement(direction, b);
}

static bool8 ForcedMovement_SlideSouth(void)
{
    return ForcedMovement_Slide(DIR_SOUTH, PlayerGoSpeed2);
}

static bool8 ForcedMovement_SlideNorth(void)
{
    return ForcedMovement_Slide(DIR_NORTH, PlayerGoSpeed2);
}

static bool8 ForcedMovement_SlideWest(void)
{
    return ForcedMovement_Slide(DIR_WEST, PlayerGoSpeed2);
}

static bool8 ForcedMovement_SlideEast(void)
{
    return ForcedMovement_Slide(DIR_EAST, PlayerGoSpeed2);
}

static bool8 ForcedMovement_SecretBaseJumpMat(void)
{
    DoPlayerMatJump();
    return TRUE;
}

static bool8 ForcedMovement_SecretBaseSpinMat(void)
{
    DoPlayerMatSpin();
    return TRUE;
}

static bool8 ForcedMovement_MuddySlope(void)
{
    struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];

    if (playerObjEvent->movementDirection != DIR_NORTH || GetPlayerSpeed() <= 3)
    {
        Bike_UpdateBikeCounterSpeed(0);
        playerObjEvent->facingDirectionLocked = 1;
        return DoForcedMovement(1, PlayerGoSpeed2);
    }
    else
    {
        return FALSE;
    }
}

static void MovePlayerNotOnBike(u8 direction, u16 heldKeys)
{
#if DEBUG
    if (gUnknown_020297ED != 0 && debug_sub_805F2B0(direction) != 0)
        return;
#endif
    gUnknown_0830FBEC[CheckMovementInputNotOnBike(direction)](direction, heldKeys);
}

static u8 CheckMovementInputNotOnBike(u8 direction)
{
    if (direction == DIR_NONE)
    {
        gPlayerAvatar.runningState = NOT_MOVING;
        return 0;
    }
    else if (direction != GetPlayerMovementDirection() && gPlayerAvatar.runningState != MOVING)
    {
        gPlayerAvatar.runningState = TURN_DIRECTION;
        return 1;
    }
    else
    {
        gPlayerAvatar.runningState = MOVING;
        return 2;
    }
}

static void PlayerNotOnBikeNotMoving(u8 direction, u16 heldKeys)
{
    PlayerFaceDirection(GetPlayerFacingDirection());
}

static void PlayerNotOnBikeTurningInPlace(u8 direction, u16 heldKeys)
{
    PlayerTurnInPlace(direction);
}

static void sub_8058D0C(u8 direction, u16 heldKeys)
{
    u8 r1 = CheckForPlayerAvatarCollision(direction);

    switch (r1)
    {
    case 6:
        PlayerJumpLedge(direction);
        return;
    default:
        if (r1 > 8 || r1 < 5)
            PlayerNotOnBikeCollide(direction);
        return;
    case 0:
        if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING)
        {
			// speed 2 is fast, same speed as running
            PlayerGoSpeed2(direction);
            return;
        }
        if (!(gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_UNDERWATER) && (heldKeys & B_BUTTON) && FlagGet(FLAG_SYS_B_DASH)
         && IsRunningDisallowed(gObjectEvents[gPlayerAvatar.objectEventId].currentMetatileBehavior) == 0)
        {
            PlayerRun(direction);
            gPlayerAvatar.flags |= PLAYER_AVATAR_FLAG_DASH;
        }
        else
        {
            PlayerGoSpeed1(direction);
        }
    }
}

static u8 CheckForPlayerAvatarCollision(u8 direction)
{
    s16 x, y;
    struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];

    x = playerObjEvent->currentCoords.x;
    y = playerObjEvent->currentCoords.y;
    MoveCoords(direction, &x, &y);
    return CheckForObjectEventCollision(playerObjEvent, x, y, direction, MapGridGetMetatileBehaviorAt(x, y));
}

u8 CheckForObjectEventCollision(struct ObjectEvent *a, s16 x, s16 y, u8 direction, u8 e)
{
    u8 collision;

    collision = GetCollisionAtCoords(a, x, y, direction);
    if (collision == 3 && sub_8058EF0(x, y, direction))
        return 5;
    if (ShouldJumpLedge(x, y, direction))
    {
        IncrementGameStat(GAME_STAT_JUMPED_DOWN_LEDGES);
        return COLLISION_LEDGE_JUMP;
    }
    if (collision == 4 && sub_8058F6C(x, y, direction))
        return 7;

    if (collision == 0)
    {
        if (CheckForRotatingGatePuzzleCollision(direction, x, y))
            return 8;
        check_acro_bike_metatile(x, y, e, &collision);
    }
    return collision;
}

static bool8 sub_8058EF0(s16 x, s16 y, u8 direction)
{
    if ((gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING)
     && MapGridGetElevationAt(x, y) == 3
     && GetObjectEventIdByPosition(x, y, 3) == 16)
    {
        sub_805A20C(direction);
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

static bool8 ShouldJumpLedge(s16 x, s16 y, u8 z)
{
    if (GetLedgeJumpDirection(x, y, z) != 0)
        return TRUE;
    else
        return FALSE;
}

static u8 sub_8058F6C(s16 x, s16 y, u8 direction)
{
    if (FlagGet(FLAG_SYS_USE_STRENGTH))
    {
        u8 objectEventId = GetObjectEventIdByXY(x, y);

        if (objectEventId != 16 && gObjectEvents[objectEventId].graphicsId == OBJ_EVENT_GFX_PUSHABLE_BOULDER)
        {
            x = gObjectEvents[objectEventId].currentCoords.x;
            y = gObjectEvents[objectEventId].currentCoords.y;
            MoveCoords(direction, &x, &y);
            if (GetCollisionAtCoords(&gObjectEvents[objectEventId], x, y, direction) == 0
             && MetatileBehavior_IsNonAnimDoor(MapGridGetMetatileBehaviorAt(x, y)) == 0)
            {
                StartStrengthAnim(objectEventId, direction);
                return 1;
            }
        }
    }
    return 0;
}

static void check_acro_bike_metatile(s16 unused1, s16 unused2, u8 c, u8 *d)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        if (gUnknown_0830FBF8[i](c))
        {
            *d = gUnknown_0830FC0C[i];
            return;
        }
    }
}

void SetPlayerAvatarTransitionFlags(u16 a)
{
    gPlayerAvatar.unk1 |= a;
    DoPlayerAvatarTransition();
}

static void DoPlayerAvatarTransition(void)
{
    u8 i;
    u8 flags = gPlayerAvatar.unk1;

    if (flags != 0)
    {
        for (i = 0; i < ARRAY_COUNT(gUnknown_0830FC14); i++, flags >>= 1)
        {
            if (flags & 1)
            {
                gUnknown_0830FC14[i](&gObjectEvents[gPlayerAvatar.objectEventId]);
            }
        }
        gPlayerAvatar.unk1 = 0;
    }
}

static void nullsub_49(struct ObjectEvent *objEvent)
{
}

static void PlayerAvatarTransition_Normal(struct ObjectEvent *objEvent)
{
    ObjectEventSetGraphicsId(objEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_STATE_NORMAL));
    ObjectEventTurn(objEvent, objEvent->movementDirection);
    SetPlayerAvatarStateMask(PLAYER_AVATAR_FLAG_ON_FOOT);
}

static void PlayerAvatarTransition_MachBike(struct ObjectEvent *objEvent)
{
    ObjectEventSetGraphicsId(objEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_STATE_MACH_BIKE));
    ObjectEventTurn(objEvent, objEvent->movementDirection);
    SetPlayerAvatarStateMask(PLAYER_AVATAR_FLAG_MACH_BIKE);
    BikeClearState(0, 0);
}

static void PlayerAvatarTransition_AcroBike(struct ObjectEvent *objEvent)
{
    ObjectEventSetGraphicsId(objEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_STATE_ACRO_BIKE));
    ObjectEventTurn(objEvent, objEvent->movementDirection);
    SetPlayerAvatarStateMask(PLAYER_AVATAR_FLAG_ACRO_BIKE);
    BikeClearState(0, 0);
    Bike_HandleBumpySlopeJump();
}

static void PlayerAvatarTransition_Surfing(struct ObjectEvent *objEvent)
{
    u8 spriteId;

    ObjectEventSetGraphicsId(objEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_STATE_SURFING));
    ObjectEventTurn(objEvent, objEvent->movementDirection);
    SetPlayerAvatarStateMask(PLAYER_AVATAR_FLAG_SURFING);
    gFieldEffectArguments[0] = objEvent->currentCoords.x;
    gFieldEffectArguments[1] = objEvent->currentCoords.y;
    gFieldEffectArguments[2] = gPlayerAvatar.objectEventId;
    spriteId = FieldEffectStart(FLDEFF_SURF_BLOB);
    objEvent->fieldEffectSpriteId = spriteId;
    SetSurfBlob_BobState(spriteId, 1);
}

static void PlayerAvatarTransition_Underwater(struct ObjectEvent *objEvent)
{
    ObjectEventSetGraphicsId(objEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_STATE_UNDERWATER));
    ObjectEventTurn(objEvent, objEvent->movementDirection);
    SetPlayerAvatarStateMask(PLAYER_AVATAR_FLAG_UNDERWATER);
    objEvent->fieldEffectSpriteId = sub_8128124(objEvent->spriteId);
}

static void PlayerAvatarTransition_ReturnToField(struct ObjectEvent *objEvent)
{
    gPlayerAvatar.flags |= PLAYER_AVATAR_FLAG_5;
}

void sub_8059204(void)
{
    gPlayerAvatar.tileTransitionState = T_NOT_MOVING;
    if (PlayerIsAnimActive())
    {
        if (!PlayerCheckIfAnimFinishedOrInactive())
        {
            if (!player_is_anim_in_certain_ranges())
                gPlayerAvatar.tileTransitionState = T_TILE_TRANSITION;
        }
        else
        {
            if (!sub_80592A4())
                gPlayerAvatar.tileTransitionState = T_TILE_CENTER;
        }
    }
}

static bool8 player_is_anim_in_certain_ranges(void)
{
    u8 movementActionId = gObjectEvents[gPlayerAvatar.objectEventId].movementActionId;

    if (movementActionId < 4
     || (movementActionId >= 16 && movementActionId < 0x15)
     || (movementActionId >= 25 && movementActionId < 41)
     || (movementActionId >= 98 && movementActionId < 110)
     || (movementActionId >= 122 && movementActionId < 126))
        return TRUE;
    else
        return FALSE;
}

static bool8 sub_80592A4(void)
{
    if (player_is_anim_in_certain_ranges() && gPlayerAvatar.runningState != TURN_DIRECTION)
        return TRUE;
    else
        return FALSE;
}

static bool8 PlayerIsAnimActive(void)
{
    return ObjectEventIsMovementOverridden(&gObjectEvents[gPlayerAvatar.objectEventId]);
}

static bool8 PlayerCheckIfAnimFinishedOrInactive(void)
{
    return ObjectEventCheckHeldMovementStatus(&gObjectEvents[gPlayerAvatar.objectEventId]);
}

static void PlayerSetCopyableMovement(u8 a)
{
    gObjectEvents[gPlayerAvatar.objectEventId].playerCopyableMovement = a;
}

u8 PlayerGetCopyableMovement(void)
{
    return gObjectEvents[gPlayerAvatar.objectEventId].playerCopyableMovement;
}

static void sub_8059348(u8 a)
{
    ObjectEventForceSetHeldMovement(&gObjectEvents[gPlayerAvatar.objectEventId], a);
}

void PlayerSetAnimId(u8 movementActionId, u8 copyableMovement)
{
    if (!PlayerIsAnimActive())
    {
        PlayerSetCopyableMovement(copyableMovement);
        ObjectEventSetHeldMovement(&gObjectEvents[gPlayerAvatar.objectEventId], movementActionId);
    }
}

// normal speed (1 speed)
void PlayerGoSpeed1(u8 a)
{
    PlayerSetAnimId(GetWalkNormalMovementAction(a), 2);
}

// fast speed (2 speed)
void PlayerGoSpeed2(u8 a)
{
    PlayerSetAnimId(GetWalkFastMovementAction(a), 2);
}

void PlayerRideWaterCurrent(u8 a)
{
    PlayerSetAnimId(GetRideWaterCurrentMovementAction(a), 2);
}

// fastest speed (4 speed)
void PlayerGoSpeed4(u8 a)
{
    PlayerSetAnimId(GetWalkFastestMovementAction(a), 2);
}

static void PlayerRun(u8 a)
{
    PlayerSetAnimId(GetPlayerRunMovementAction(a), 2);
}

void PlayerOnBikeCollide(u8 a)
{
    PlayCollisionSoundIfNotFacingWarp(a);
    PlayerSetAnimId(GetWalkInPlaceNormalMovementAction(a), 2);
}

static void PlayerNotOnBikeCollide(u8 a)
{
    PlayCollisionSoundIfNotFacingWarp(a);
    PlayerSetAnimId(GetWalkInPlaceSlowMovementAction(a), 2);
}

void PlayerFaceDirection(u8 direction)
{
    PlayerSetAnimId(GetFaceDirectionMovementAction(direction), 1);
}

void PlayerTurnInPlace(u8 direction)
{
    PlayerSetAnimId(GetWalkInPlaceFastMovementAction(direction), 1);
}

void PlayerJumpLedge(u8 direction)
{
    PlaySE(SE_LEDGE);
    PlayerSetAnimId(GetJump2MovementAction(direction), 8);
}

void sub_80594C0(void)
{
    if (gPlayerAvatar.tileTransitionState == T_TILE_CENTER || gPlayerAvatar.tileTransitionState == T_NOT_MOVING)
    {
        if (player_should_look_direction_be_enforced_upon_movement())
            sub_8059348(GetFaceDirectionMovementAction(gObjectEvents[gPlayerAvatar.objectEventId].facingDirection));
    }
}

// wheelie idle
void PlayerIdleWheelie(u8 direction)
{
    PlayerSetAnimId(GetAcroWheelieFaceDirectionMovementAction(direction), 1);
}

// normal to wheelie
void PlayerStartWheelie(u8 direction)
{
    PlayerSetAnimId(GetAcroPopWheelieFaceDirectionMovementAction(direction), 1);
}

// wheelie to normal
void PlayerEndWheelie(u8 direction)
{
    PlayerSetAnimId(GetAcroEndWheelieFaceDirectionMovementAction(direction), 1);
}

// wheelie hopping standing
void PlayerStandingHoppingWheelie(u8 a)
{
    PlaySE(SE_BIKE_HOP);
    PlayerSetAnimId(GetAcroWheelieHopFaceDirectionMovementAction(a), 1);
}

// wheelie hopping moving
void PlayerMovingHoppingWheelie(u8 a)
{
    PlaySE(SE_BIKE_HOP);
    PlayerSetAnimId(GetAcroWheelieHopDirectionMovementAction(a), 2);
}

// wheelie hopping ledge
void PlayerLedgeHoppingWheelie(u8 a)
{
    PlaySE(SE_BIKE_HOP);
    PlayerSetAnimId(GetAcroWheelieJumpDirectionMovementAction(a), 8);
}

// acro turn jump
void PlayerAcroTurnJump(u8 direction)
{
    PlaySE(SE_BIKE_HOP);
    PlayerSetAnimId(GetJumpInPlaceTurnAroundMovementAction(direction), 1);
}

void PlayerWheelieInPlace(u8 direction)
{
    PlaySE(SE_WALL_HIT);
    PlayerSetAnimId(GetAcroWheelieInPlaceDirectionMovementAction(direction), 2);
}

void PlayerPopWheelieWhileMoving(u8 direction)
{
    PlayerSetAnimId(GetAcroPopWheelieMoveDirectionMovementAction(direction), 2);
}

void PlayerWheelieMove(u8 direction)
{
    PlayerSetAnimId(GetAcroWheelieMoveDirectionMovementAction(direction), 2);
}

void PlayerEndWheelieWhileMoving(u8 direction)
{
    PlayerSetAnimId(GetAcroEndWheelieMoveDirectionMovementAction(direction), 2);
}

static void PlayCollisionSoundIfNotFacingWarp(u8 a)
{
    s16 x, y;
    u8 metatileBehavior = gObjectEvents[gPlayerAvatar.objectEventId].currentMetatileBehavior;

    if (!sArrowWarpMetatileBehaviorChecks[a - 1](metatileBehavior))
    {
        if (a == 2)
        {
            PlayerGetDestCoords(&x, &y);
            MoveCoords(2, &x, &y);
            if (MetatileBehavior_IsWarpDoor(MapGridGetMetatileBehaviorAt(x, y)))
                return;
        }
        PlaySE(SE_WALL_HIT);
    }
}

void GetXYCoordsOneStepInFrontOfPlayer(s16 *x, s16 *y)
{
    *x = gObjectEvents[gPlayerAvatar.objectEventId].currentCoords.x;
    *y = gObjectEvents[gPlayerAvatar.objectEventId].currentCoords.y;
    MoveCoords(GetPlayerFacingDirection(), x, y);
}

void PlayerGetDestCoords(s16 *x, s16 *y)
{
    *x = gObjectEvents[gPlayerAvatar.objectEventId].currentCoords.x;
    *y = gObjectEvents[gPlayerAvatar.objectEventId].currentCoords.y;
}

u8 GetPlayerFacingDirection(void)
{
    return gObjectEvents[gPlayerAvatar.objectEventId].facingDirection;
}

u8 GetPlayerMovementDirection(void)
{
    return gObjectEvents[gPlayerAvatar.objectEventId].movementDirection;
}

u8 PlayerGetZCoord(void)
{
    return gObjectEvents[gPlayerAvatar.objectEventId].previousElevation;
}

void unref_sub_8059790(s16 a, s16 b)
{
    MoveObjectEventToMapCoords(&gObjectEvents[gPlayerAvatar.objectEventId], a, b);
}

u8 TestPlayerAvatarFlags(u8 a)
{
    return gPlayerAvatar.flags & a;
}

u8 sub_80597D0(void)
{
    return gPlayerAvatar.flags;
}

u8 GetPlayerAvatarObjectId(void)
{
    return gPlayerAvatar.spriteId;
}

void sub_80597E8(void)
{
    ForcedMovement_None();
}

void sub_80597F4(void)
{
    struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];

    npc_clear_strange_bits(playerObjEvent);
    SetObjectEventDirection(playerObjEvent, playerObjEvent->facingDirection);
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE))
    {
        Bike_HandleBumpySlopeJump();
        Bike_UpdateBikeCounterSpeed(0);
    }
}

u8 GetRivalAvatarGraphicsIdByStateIdAndGender(u8 state, u8 gender)
{
    return sRivalAvatarGfxIds[state][gender];
}

static u8 GetPlayerAvatarGraphicsIdByStateIdAndGender(u8 state, u8 gender)
{
    return sPlayerAvatarGfxIds[state][gender];
}

u8 GetPlayerAvatarGraphicsIdByStateId(u8 state)
{
    return GetPlayerAvatarGraphicsIdByStateIdAndGender(state, gPlayerAvatar.gender);
}

u8 unref_GetRivalAvatarGenderByGraphicsId(u8 gfxId)
{
    switch (gfxId)
    {
    case OBJ_EVENT_GFX_RIVAL_MAY_NORMAL:
    case OBJ_EVENT_GFX_RIVAL_MAY_MACH_BIKE:
    case OBJ_EVENT_GFX_RIVAL_MAY_ACRO_BIKE:
    case OBJ_EVENT_GFX_RIVAL_MAY_SURFING:
    case OBJ_EVENT_GFX_RIVAL_MAY_FIELD_MOVE:
    case OBJ_EVENT_GFX_MAY_UNDERWATER:
    case OBJ_EVENT_GFX_MAY_FISHING:
    case OBJ_EVENT_GFX_MAY_WATERING:
        return FEMALE;
    default:
        return MALE;
    }
}

u8 GetPlayerAvatarGenderByGraphicsId(u8 gfxId)
{
    switch (gfxId)
    {
    case OBJ_EVENT_GFX_MAY_NORMAL:
    case OBJ_EVENT_GFX_MAY_MACH_BIKE:
    case OBJ_EVENT_GFX_MAY_ACRO_BIKE:
    case OBJ_EVENT_GFX_MAY_SURFING:
    case OBJ_EVENT_GFX_MAY_FIELD_MOVE:
    case OBJ_EVENT_GFX_MAY_UNDERWATER:
    case OBJ_EVENT_GFX_MAY_FISHING:
    case OBJ_EVENT_GFX_MAY_WATERING:
        return FEMALE;
    default:
        return MALE;
    }
}

bool8 PartyHasMonWithSurf(void)
{
    u8 i;

    if (!TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
    {
        for (i = 0; i < 6; i++)
        {
            if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) == SPECIES_NONE)
                break;
            if (pokemon_has_move(&gPlayerParty[i], MOVE_SURF))
                return TRUE;
        }
    }
    return FALSE;
}

bool8 IsPlayerSurfingNorth(void)
{
    if (GetPlayerMovementDirection() == DIR_NORTH && TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
        return TRUE;
    else
        return FALSE;
}

bool8 IsPlayerFacingSurfableFishableWater(void)
{
    struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    s16 x = playerObjEvent->currentCoords.x;
    s16 y = playerObjEvent->currentCoords.y;

    MoveCoords(playerObjEvent->facingDirection, &x, &y);
    if (GetCollisionAtCoords(playerObjEvent, x, y, playerObjEvent->facingDirection) == 3 && PlayerGetZCoord() == 3
     && MetatileBehavior_IsSurfableFishableWater(MapGridGetMetatileBehaviorAt(x, y)))
        return TRUE;
    else
        return FALSE;
}

void ClearPlayerAvatarInfo(void)
{
    memset(&gPlayerAvatar, 0, sizeof(struct PlayerAvatar));
}

void SetPlayerAvatarStateMask(u8 flags)
{
    gPlayerAvatar.flags &= (PLAYER_AVATAR_FLAG_DASH | PLAYER_AVATAR_FLAG_6 | PLAYER_AVATAR_FLAG_5);
    gPlayerAvatar.flags |= flags;
}

static u8 GetPlayerAvatarStateTransitionByGraphicsId(u8 a, u8 gender)
{
    u8 i;

    for (i = 0; i < 5; i++)
    {
        if (gUnknown_0830FC64[gender][i][0] == a)
            return gUnknown_0830FC64[gender][i][1];
    }
    return 1;
}

u8 GetPlayerAvatarGraphicsIdByCurrentState(void)
{
    u8 i;
    u8 r5 = gPlayerAvatar.flags;

    for (i = 0; i < 5; i++)
    {
        if (gUnknown_0830FC64[gPlayerAvatar.gender][i][1] & r5)
            return gUnknown_0830FC64[gPlayerAvatar.gender][i][0];
    }
    return 0;
}

void SetPlayerAvatarExtraStateTransition(u8 a, u8 b)
{
    u8 unk = GetPlayerAvatarStateTransitionByGraphicsId(a, gPlayerAvatar.gender);

    gPlayerAvatar.unk1 |= unk | b;
    DoPlayerAvatarTransition();
}

void InitPlayerAvatar(s16 x, s16 y, u8 direction, u8 gender)
{
    struct ObjectEventTemplate playerObjEventTemplate;
    u8 objectEventId;
    struct ObjectEvent *objectEvent;

    playerObjEventTemplate.localId = 0xFF;
    playerObjEventTemplate.graphicsId = GetPlayerAvatarGraphicsIdByStateIdAndGender(PLAYER_AVATAR_STATE_NORMAL, gender);
    playerObjEventTemplate.x = x - 7;
    playerObjEventTemplate.y = y - 7;
    playerObjEventTemplate.elevation = 0;
    playerObjEventTemplate.movementType = MOVEMENT_TYPE_PLAYER;
    playerObjEventTemplate.movementRangeX = 0;
    playerObjEventTemplate.movementRangeY = 0;
    playerObjEventTemplate.trainerType = TRAINER_TYPE_NONE;
    playerObjEventTemplate.trainerRange_berryTreeId = 0;
    playerObjEventTemplate.script = NULL;
    playerObjEventTemplate.flagId = 0;
    objectEventId = SpawnSpecialObjectEvent(&playerObjEventTemplate);
    objectEvent = &gObjectEvents[objectEventId];
    objectEvent->isPlayer = 1;
    objectEvent->warpArrowSpriteId = CreateWarpArrowSprite();
    ObjectEventTurn(objectEvent, direction);
    ClearPlayerAvatarInfo();
    gPlayerAvatar.runningState = NOT_MOVING;
    gPlayerAvatar.tileTransitionState = T_NOT_MOVING;
    gPlayerAvatar.objectEventId = objectEventId;
    gPlayerAvatar.spriteId = objectEvent->spriteId;
    gPlayerAvatar.gender = gender;
    SetPlayerAvatarStateMask(PLAYER_AVATAR_FLAG_5 | PLAYER_AVATAR_FLAG_ON_FOOT);
}

void sub_8059B88(u8 a)
{
    gObjectEvents[gPlayerAvatar.objectEventId].invisible = a;
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
        gSprites[gObjectEvents[gPlayerAvatar.objectEventId].fieldEffectSpriteId].invisible = a;
}

void SetPlayerAvatarFieldMove(void)
{
    ObjectEventSetGraphicsId(&gObjectEvents[gPlayerAvatar.objectEventId], GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_STATE_FIELD_MOVE));
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], 0);
}

static void sub_8059C3C(u8 direction)
{
    ObjectEventSetGraphicsId(&gObjectEvents[gPlayerAvatar.objectEventId], GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_STATE_FISHING));
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], GetFishingDirectionAnimNum(direction));
}

void sub_8059C94(u8 direction)
{
    ObjectEventSetGraphicsId(&gObjectEvents[gPlayerAvatar.objectEventId], GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_STATE_ACRO_BIKE));
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], GetAcroWheelieDirectionAnimNum(direction));
    SeekSpriteAnim(&gSprites[gPlayerAvatar.spriteId], 1);
}

void sub_8059D08(u8 direction)
{
    ObjectEventSetGraphicsId(&gObjectEvents[gPlayerAvatar.objectEventId], GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_STATE_WATERING));
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], GetFaceDirectionAnimNum(direction));
}

static void sub_8059D60(struct ObjectEvent *objectEvent)
{
    s16 x;
    s16 y;
    u8 direction;
    u8 metatileBehavior = objectEvent->currentMetatileBehavior;

    for (x = 0, direction = DIR_SOUTH; x < 4; x++, direction++)
    {
        if (sArrowWarpMetatileBehaviorChecks2[x](metatileBehavior) && direction == objectEvent->movementDirection)
        {
            x = objectEvent->currentCoords.x;
            y = objectEvent->currentCoords.y;
            MoveCoords(direction, &x, &y);
            ShowWarpArrowSprite(objectEvent->warpArrowSpriteId, direction, x, y);
            return;
        }
    }
    SetSpriteInvisible(objectEvent->warpArrowSpriteId);
}

/* Strength */

static void StartStrengthAnim(u8 a, u8 b)
{
    u8 taskId = CreateTask(Task_BumpBoulder, 0xFF);

    gTasks[taskId].data[1] = a;
    gTasks[taskId].data[2] = b;
    Task_BumpBoulder(taskId);
}

static void Task_BumpBoulder(u8 taskId)
{
    while (gUnknown_0830FC88[gTasks[taskId].data[0]](&gTasks[taskId],
                                                     &gObjectEvents[gPlayerAvatar.objectEventId],
                                                     &gObjectEvents[gTasks[taskId].data[1]]))
        ;
}

static bool8 sub_8059E84(struct Task *task, struct ObjectEvent *playerObject, struct ObjectEvent *strengthObject)
{
    ScriptContext2_Enable();
    gPlayerAvatar.preventStep = TRUE;
    task->data[0]++;
    return FALSE;
}

static bool8 do_boulder_dust(struct Task *task, struct ObjectEvent *playerObject, struct ObjectEvent *strengthObject)
{
    if (!ObjectEventIsMovementOverridden(playerObject)
     && !ObjectEventIsMovementOverridden(strengthObject))
    {
        ObjectEventClearHeldMovementIfFinished(playerObject);
        ObjectEventClearHeldMovementIfFinished(strengthObject);
        ObjectEventSetHeldMovement(playerObject, GetWalkInPlaceNormalMovementAction((u8)task->data[2]));
        ObjectEventSetHeldMovement(strengthObject, GetWalkSlowMovementAction((u8)task->data[2]));
        gFieldEffectArguments[0] = strengthObject->currentCoords.x;
        gFieldEffectArguments[1] = strengthObject->currentCoords.y;
        gFieldEffectArguments[2] = strengthObject->previousElevation;
        gFieldEffectArguments[3] = gSprites[strengthObject->spriteId].oam.priority;
        FieldEffectStart(FLDEFF_DUST);
        PlaySE(SE_M_STRENGTH);
        task->data[0]++;
    }
    return FALSE;
}

static bool8 sub_8059F40(struct Task *task, struct ObjectEvent *playerObject, struct ObjectEvent *strengthObject)
{
    if (ObjectEventCheckHeldMovementStatus(playerObject)
     && ObjectEventCheckHeldMovementStatus(strengthObject))
    {
        ObjectEventClearHeldMovementIfFinished(playerObject);
        ObjectEventClearHeldMovementIfFinished(strengthObject);
        gPlayerAvatar.preventStep = FALSE;
        ScriptContext2_Disable();
        DestroyTask(FindTaskIdByFunc(Task_BumpBoulder));
    }
    return FALSE;
}

/* Some field effect */

static void DoPlayerMatJump(void)
{
    DoPlayerAvatarSecretBaseMatJump(CreateTask(DoPlayerAvatarSecretBaseMatJump, 0xFF));
}

static void DoPlayerAvatarSecretBaseMatJump(u8 taskId)
{
    while (sPlayerAvatarSecretBaseMatJump[gTasks[taskId].data[0]](&gTasks[taskId], &gObjectEvents[gPlayerAvatar.objectEventId]))
        ;
}

// because data[0] is used to call this, it can be inferred that there may have been multiple mat jump functions at one point, so the name for these groups of functions is appropriate in assuming the sole use of mat jump.
static u8 PlayerAvatar_DoSecretBaseMatJump(struct Task *task, struct ObjectEvent *objectEvent)
{
    gPlayerAvatar.preventStep = TRUE;
    if (ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        PlaySE(SE_LEDGE);
        ObjectEventSetHeldMovement(objectEvent, GetJumpInPlaceMovementAction(objectEvent->facingDirection));
        task->data[1]++;
        if (task->data[1] > 1)
        {
            gPlayerAvatar.preventStep = FALSE;
            gPlayerAvatar.unk1 |= 0x20;
            DestroyTask(FindTaskIdByFunc(DoPlayerAvatarSecretBaseMatJump));
        }
    }
    return FALSE;
}

/* Some field effect */

static void DoPlayerMatSpin(void)
{
    u8 taskId = CreateTask(PlayerAvatar_DoSecretBaseMatSpin, 0xFF);

    PlayerAvatar_DoSecretBaseMatSpin(taskId);
}

static void PlayerAvatar_DoSecretBaseMatSpin(u8 taskId)
{
    while (sPlayerAvatarSecretBaseMatSpin[gTasks[taskId].data[0]](&gTasks[taskId], &gObjectEvents[gPlayerAvatar.objectEventId]))
        ;
}

static bool8 PlayerAvatar_SecretBaseMatSpinStep0(struct Task *task, struct ObjectEvent *objectEvent)
{
    task->data[0]++;
    task->data[1] = objectEvent->movementDirection;
    gPlayerAvatar.preventStep = TRUE;
    ScriptContext2_Enable();
    PlaySE(SE_WARP_IN);
    return TRUE;
}

static bool8 PlayerAvatar_SecretBaseMatSpinStep1(struct Task *task, struct ObjectEvent *objectEvent)
{
    u8 directions[] = {DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH};

    if (ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        u8 direction;

        ObjectEventSetHeldMovement(objectEvent, GetFaceDirectionMovementAction(direction = directions[objectEvent->movementDirection - 1]));
        if (direction == (u8)task->data[1])
            task->data[2]++;
        task->data[0]++;
        if (task->data[2] > 3 && direction == GetOppositeDirection(task->data[1]))
            task->data[0]++;
    }
    return FALSE;
}

static bool8 PlayerAvatar_SecretBaseMatSpinStep2(struct Task *task, struct ObjectEvent *objectEvent)
{
    const u8 actions[] = {
        MOVEMENT_ACTION_DELAY_1,
        MOVEMENT_ACTION_DELAY_1,
        MOVEMENT_ACTION_DELAY_2,
        MOVEMENT_ACTION_DELAY_4,
        MOVEMENT_ACTION_DELAY_8,
    };

    if (ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        ObjectEventSetHeldMovement(objectEvent, actions[task->data[2]]);
        task->data[0] = 1;
    }
    return FALSE;
}

static bool8 PlayerAvatar_SecretBaseMatSpinStep3(struct Task *task, struct ObjectEvent *objectEvent)
{
    if (ObjectEventClearHeldMovementIfFinished(objectEvent))
    {
        ObjectEventSetHeldMovement(objectEvent, GetWalkSlowMovementAction(GetOppositeDirection(task->data[1])));
        ScriptContext2_Disable();
        gPlayerAvatar.preventStep = FALSE;
        DestroyTask(FindTaskIdByFunc(PlayerAvatar_DoSecretBaseMatSpin));
    }
    return FALSE;
}

/* Some Field effect */

static void sub_805A20C(u8 a)
{
    u8 taskId;

    ScriptContext2_Enable();
    Overworld_ClearSavedMusic();
    Overworld_ChangeMusicToDefault();
    gPlayerAvatar.flags &= ~PLAYER_AVATAR_FLAG_SURFING;
    gPlayerAvatar.flags |= PLAYER_AVATAR_FLAG_ON_FOOT;
    gPlayerAvatar.preventStep = TRUE;
    taskId = CreateTask(taskFF_0805D1D4, 0xFF);
    gTasks[taskId].data[0] = a;
    taskFF_0805D1D4(taskId);
}

static void taskFF_0805D1D4(u8 taskId)
{
    struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];

    if (ObjectEventIsMovementOverridden(playerObjEvent))
    {
        if (!ObjectEventClearHeldMovementIfFinished(playerObjEvent))
            return;
    }
    SetSurfBlob_BobState(playerObjEvent->fieldEffectSpriteId, 2);
    ObjectEventSetHeldMovement(playerObjEvent, GetJumpSpecialMovementAction((u8)gTasks[taskId].data[0]));
    gTasks[taskId].func = sub_805A2D0;
}

static void sub_805A2D0(u8 taskId)
{
    struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];

    if (ObjectEventClearHeldMovementIfFinished(playerObjEvent))
    {
        ObjectEventSetGraphicsId(playerObjEvent, GetPlayerAvatarGraphicsIdByStateId(PLAYER_AVATAR_STATE_NORMAL));
        ObjectEventSetHeldMovement(playerObjEvent, GetFaceDirectionMovementAction(playerObjEvent->facingDirection));
        gPlayerAvatar.preventStep = FALSE;
        ScriptContext2_Disable();
        DestroySprite(&gSprites[playerObjEvent->fieldEffectSpriteId]);
        DestroyTask(taskId);
    }
}

/* Fishing */

static bool8 (*const sFishingStateFuncs[])(struct Task *) =
{
    Fishing1,
    Fishing2,
    Fishing3,
    Fishing4,
    Fishing5,
    Fishing6,
    Fishing7,
    Fishing8,
    Fishing9,
    Fishing10,
    Fishing11,
    Fishing12,
    Fishing13,
    Fishing14,
    Fishing15,
    Fishing16,
};

#define tStep              data[0]
#define tFrameCounter      data[1]
#define tNumDots           data[2]
#define tDotsRequired      data[3]
#define tRoundsPlayed      data[12]
#define tMinRoundsRequired data[13]
#define tPlayerGfxId       data[14]
#define tFishingRod        data[15]

#define FISHING_START_ROUND 3
#define FISHING_GOT_BITE 6
#define FISHING_ON_HOOK 9
#define FISHING_NO_BITE 11
#define FISHING_GOT_AWAY 12
#define FISHING_SHOW_RESULT 13

void StartFishing(u8 rod)
{
    u8 taskId = CreateTask(Task_Fishing, 0xFF);

    gTasks[taskId].tFishingRod = rod;
    Task_Fishing(taskId);
}

static void Task_Fishing(u8 taskId)
{
    while (sFishingStateFuncs[gTasks[taskId].tStep](&gTasks[taskId]))
        ;
}

static bool8 Fishing1(struct Task *task)
{
    ScriptContext2_Enable();
    gPlayerAvatar.preventStep = TRUE;
    task->tStep++;
    return FALSE;
}

static bool8 Fishing2(struct Task *task)
{
    struct ObjectEvent *playerObjEvent;
    const s16 arr1[] = {1, 1, 1};
    const s16 arr2[] = {1, 3, 6};

    task->tRoundsPlayed = 0;
    task->tMinRoundsRequired = arr1[task->tFishingRod] + (Random() % arr2[task->tFishingRod]);
    task->tPlayerGfxId = gObjectEvents[gPlayerAvatar.objectEventId].graphicsId;
    playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];
    ObjectEventClearHeldMovementIfActive(playerObjEvent);
    playerObjEvent->enableAnim = 1;
    sub_8059C3C(playerObjEvent->facingDirection);
    task->tStep++;
    return FALSE;
}

static bool8 Fishing3(struct Task *task)
{
    AlignFishingAnimationFrames();
    
    // Wait one second before starting dot game
    task->tFrameCounter++;
    if (task->tFrameCounter >= 60)
        task->tStep++;
    return FALSE;
}

static bool8 Fishing4(struct Task *task)
{
    u32 randVal;

    Menu_DisplayDialogueFrame();
    task->tStep++;
    task->tFrameCounter = 0;
    task->tNumDots = 0;
    randVal = Random();
    randVal %= 10;
    task->tDotsRequired = randVal + 1;
    if (task->tRoundsPlayed == 0)
        task->tDotsRequired = randVal + 4;
    if (task->tDotsRequired >= 10)
        task->tDotsRequired = 10;
    return TRUE;
}

// Play a round of the dot game
static bool8 Fishing5(struct Task *task)
{
    const u8 dot[] = _("·");

    AlignFishingAnimationFrames();
    task->tFrameCounter++;
    if (gMain.newKeys & A_BUTTON)
    {
        task->tStep = FISHING_NO_BITE;
        if (task->tRoundsPlayed != 0)
            task->tStep = FISHING_GOT_AWAY;
        return 1;
    }
    else
    {
        if (task->tFrameCounter >= 20)
        {
            task->tFrameCounter = 0;
            if (task->tNumDots >= task->tDotsRequired)
            {
                task->tStep++;
                if (task->tRoundsPlayed != 0)
                    task->tStep++;
                task->tRoundsPlayed++;
            }
            else
            {
                Menu_PrintText(dot, task->tNumDots + 4, 15);
                task->tNumDots++;
            }
        }
        return FALSE;
    }
}

// Determine if fish bites
static bool8 Fishing6(struct Task *task)
{
    AlignFishingAnimationFrames();
    task->tStep++;
    if (!DoesCurrentMapHaveFishingMons() || (Random() & 1))
        task->tStep = FISHING_NO_BITE;
    else
        StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], GetFishingBiteDirectionAnimNum(GetPlayerFacingDirection()));
    return TRUE;
}

// Oh! A Bite!
static bool8 Fishing7(struct Task *task)
{
    AlignFishingAnimationFrames();
    Menu_PrintText(gOtherText_OhABite, 4, 17);
    task->tStep++;
    task->tFrameCounter = 0;
    return FALSE;
}

// We have a bite. Now, wait for the player to press A, or the timer to expire.
static bool8 Fishing8(struct Task *task)
{
    const s16 reelTimeouts[3] = {36, 33, 30};

    AlignFishingAnimationFrames();
    task->tFrameCounter++;
    if (task->tFrameCounter >= reelTimeouts[task->tFishingRod])
        task->tStep = FISHING_GOT_AWAY;
    else if (gMain.newKeys & A_BUTTON)
        task->tStep++;
    return FALSE;
}

// Determine if we're going to play the dot game again
static bool8 Fishing9(struct Task *task)
{
    const s16 arr[][2] =
    {
        {0, 0},
        {40, 10},
        {70, 30}
    };

    AlignFishingAnimationFrames();
    task->tStep++;
    if (task->tRoundsPlayed < task->tMinRoundsRequired)
    {
        task->tStep = FISHING_START_ROUND;
    }
    else if (task->tRoundsPlayed < 2)
    {
        // probability of having to play another round
        s16 probability = Random() % 100;

        if (arr[task->tFishingRod][task->tRoundsPlayed] > probability)
            task->tStep = FISHING_START_ROUND;
    }
    return FALSE;
}

static bool8 Fishing10(struct Task *task)
{
    AlignFishingAnimationFrames();
    MenuPrintMessageDefaultCoords(gOtherText_PokeOnHook);
    Menu_DisplayDialogueFrame();
    task->tStep++;
    task->tFrameCounter = 0;
    return FALSE;
}

static bool8 Fishing11(struct Task *task)
{
    if (task->tFrameCounter == 0)
        AlignFishingAnimationFrames();

    if (task->tFrameCounter == 0)
    {
        if (Menu_UpdateWindowText())
        {
            struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];

            ObjectEventSetGraphicsId(playerObjEvent, task->tPlayerGfxId);
            ObjectEventTurn(playerObjEvent, playerObjEvent->movementDirection);
            if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING)
                sub_8127F28(gObjectEvents[gPlayerAvatar.objectEventId].fieldEffectSpriteId, 0, 0);
            gSprites[gPlayerAvatar.spriteId].x2 = 0;
            gSprites[gPlayerAvatar.spriteId].y2 = 0;
            Menu_EraseScreen();
            task->tFrameCounter++;
            return FALSE;
        }
    }

    if (task->tFrameCounter != 0)
    {
        gPlayerAvatar.preventStep = FALSE;
        ScriptContext2_Disable();
        FishingWildEncounter(task->tFishingRod);
        sub_80BE97C(1);
        DestroyTask(FindTaskIdByFunc(Task_Fishing));
    }
    return FALSE;
}

// Not even a nibble
static bool8 Fishing12(struct Task *task)
{
    AlignFishingAnimationFrames();
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], GetFishingNoCatchDirectionAnimNum(GetPlayerFacingDirection()));
    MenuPrintMessageDefaultCoords(gOtherText_NotEvenANibble);
    task->tStep = FISHING_SHOW_RESULT;
    return TRUE;
}

// It got away
static bool8 Fishing13(struct Task *task)
{
    AlignFishingAnimationFrames();
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], GetFishingNoCatchDirectionAnimNum(GetPlayerFacingDirection()));
    MenuPrintMessageDefaultCoords(gOtherText_ItGotAway);
    task->tStep++;
    return TRUE;
}

// Display the message
static bool8 Fishing14(struct Task *task)
{
    AlignFishingAnimationFrames();
    Menu_DisplayDialogueFrame();
    task->tStep++;
    return FALSE;
}

static bool8 Fishing15(struct Task *task)
{
    AlignFishingAnimationFrames();
    if (gSprites[gPlayerAvatar.spriteId].animEnded)
    {
        struct ObjectEvent *playerObjEvent = &gObjectEvents[gPlayerAvatar.objectEventId];

        ObjectEventSetGraphicsId(playerObjEvent, task->tPlayerGfxId);
        ObjectEventTurn(playerObjEvent, playerObjEvent->movementDirection);
        if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING)
            sub_8127F28(gObjectEvents[gPlayerAvatar.objectEventId].fieldEffectSpriteId, 0, 0);
        gSprites[gPlayerAvatar.spriteId].x2 = 0;
        gSprites[gPlayerAvatar.spriteId].y2 = 0;
        task->tStep++;
    }
    return FALSE;
}

static bool8 Fishing16(struct Task *task)
{
    if (Menu_UpdateWindowText())
    {
        gPlayerAvatar.preventStep = FALSE;
        ScriptContext2_Disable();
        UnfreezeObjectEvents();
        Menu_EraseScreen();
        sub_80BE97C(0);
        DestroyTask(FindTaskIdByFunc(Task_Fishing));
    }
    return FALSE;
}

#undef tStep
#undef tFrameCounter
#undef tFishingRod

static void AlignFishingAnimationFrames(void)
{
    struct Sprite *playerSprite = &gSprites[gPlayerAvatar.spriteId];
    u8 animCmdIndex;
    u8 animType;

    AnimateSprite(playerSprite);
    playerSprite->x2 = 0;
    playerSprite->y2 = 0;
    animCmdIndex = playerSprite->animCmdIndex;
    if (playerSprite->anims[playerSprite->animNum][animCmdIndex].type == -1)
    {
        animCmdIndex--;
    }
    else
    {
        playerSprite->animDelayCounter++;
        if (playerSprite->anims[playerSprite->animNum][animCmdIndex].type == -1)
            animCmdIndex--;
    }
    animType = playerSprite->anims[playerSprite->animNum][animCmdIndex].type;
    if (animType == 1 || animType == 2 || animType == 3)
    {
        playerSprite->x2 = 8;
        if (GetPlayerFacingDirection() == 3)
            playerSprite->x2 = -8;
    }
    if (animType == 5)
        playerSprite->y2 = -8;
    if (animType == 10 || animType == 11)
        playerSprite->y2 = 8;
    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING)
        sub_8127F28(gObjectEvents[gPlayerAvatar.objectEventId].fieldEffectSpriteId, 1, playerSprite->y2);
}

#if DEBUG

u8 debug_sub_805F2B0(u8 a)
{
    if (gMain.heldKeys & 0x100)
        return debug_sub_805F2DC(a);
    else
        return 0;
}

u8 debug_sub_805F2DC(u8 a)
{
    if (a == 0)
        PlayerFaceDirection(gObjectEvents[gPlayerAvatar.objectEventId].movementDirection);
    else if (gObjectEvents[gPlayerAvatar.objectEventId].trackedByCamera && !CanCameraMoveInDirection(a))
        PlayerOnBikeCollide(a);
    else
        PlayerGoSpeed4(a);
    return 1;
}

#endif
