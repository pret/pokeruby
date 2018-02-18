#include "global.h"
#include "field_player_avatar.h"
#include "bike.h"
#include "event_data.h"
#include "field_effect.h"
#include "field_effect_helpers.h"
#include "event_object_movement.h"
#include "fieldmap.h"
#include "main.h"
#include "constants/map_objects.h"
#include "menu.h"
#include "metatile_behavior.h"
#include "new_game.h"
#include "party_menu.h"
#include "random.h"
#include "overworld.h"
#include "rotating_gate.h"
#include "script.h"
#include "constants/songs.h"
#include "sound.h"
#include "strings2.h"
#include "task.h"
#include "tv.h"
#include "wild_encounter.h"

EWRAM_DATA struct PlayerAvatar gPlayerAvatar = {0};

//Functions
static bool8 sub_8058854(struct MapObject *, u8);
static void npc_clear_strange_bits(struct MapObject *a);
static void MovePlayerAvatarUsingKeypadInput(u8 a, u16 b, u16 c);
static void PlayerAllowForcedMovementIfMovingSameDirection(void);
static bool8 TryDoMetatileBehaviorForcedMovement(void);
static u8 GetForcedMovementByMetatileBehavior(void);
static void MovePlayerNotOnBike(u8 a, u16 b);
static u8 CheckMovementInputNotOnBike(u8 a);
static u8 CheckForPlayerAvatarCollision(u8 a);
static u8 sub_8058EF0(s16 a, s16 b, u8 c);
static bool8 ShouldJumpLedge(s16 a, s16 b, u8 c);
static u8 sub_8058F6C(s16 a, s16 b, u8 c);
static void check_acro_bike_metatile(int unused1, int unused2, u8 c, u8 *d);
static void DoPlayerAvatarTransition(void);
static bool8 player_is_anim_in_certain_ranges(void);
static bool8 sub_80592A4(void);
static bool8 PlayerIsAnimActive(void);
static bool8 PlayerCheckIfAnimFinishedOrInactive(void);
static void PlayerNotOnBikeCollide(u8 a);
static void PlayCollisionSoundIfNotFacingWarp(u8 a);
static void sub_8059D60(struct MapObject *a);
static void StartStrengthAnim(u8 a, u8 b);
static void DoPlayerMatJump(void);
static void sub_805A06C(void);
u8 debug_sub_805F2B0(u8);
u8 debug_sub_805F2DC(u8);

static bool8 (*const gUnknown_0830FB58[])(u8) =
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
    MetatileBehavior_0xBB,
    MetatileBehavior_0xBC,
    MetatileBehavior_IsMuddySlope,
};
static bool8 (*const gUnknown_0830FBA0[])(void) =
{
    ForcedMovement_None,
    ForcedMovement_Slip,
    ForcedMovement_Slip,
    sub_8058AAC,
    sub_8058AC4,
    sub_8058ADC,
    sub_8058AF4,
    sub_8058B0C,
    sub_8058B24,
    sub_8058B3C,
    sub_8058B54,
    ForcedMovement_SlideSouth,
    ForcedMovement_SlideNorth,
    ForcedMovement_SlideWest,
    ForcedMovement_SlideEast,
    sub_8058B0C,
    ForcedMovement_MatJump,
    sub_8058C10,
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
static void (*const gUnknown_0830FC14[])(struct MapObject *) =
{
    PlayerAvatarTransition_Normal,
    PlayerAvatarTransition_MachBike,
    PlayerAvatarTransition_AcroBike,
    PlayerAvatarTransition_Surfing,
    PlayerAvatarTransition_Underwater,
    sub_80591F4,
    nullsub_49,
    nullsub_49,
};
static bool8 (*const gUnknown_0830FC34[])(u8) =
{
    MetatileBehavior_IsSouthArrowWarp,
    MetatileBehavior_IsNorthArrowWarp,
    MetatileBehavior_IsWestArrowWarp,
    MetatileBehavior_IsEastArrowWarp,
};
static const u8 sRivalAvatarGfxIds[][2] =
{
    {MAP_OBJ_GFX_RIVAL_BRENDAN_NORMAL,     MAP_OBJ_GFX_RIVAL_MAY_NORMAL},
    {MAP_OBJ_GFX_RIVAL_BRENDAN_MACH_BIKE,  MAP_OBJ_GFX_RIVAL_MAY_MACH_BIKE},
    {MAP_OBJ_GFX_RIVAL_BRENDAN_ACRO_BIKE,  MAP_OBJ_GFX_RIVAL_MAY_ACRO_BIKE},
    {MAP_OBJ_GFX_RIVAL_BRENDAN_SURFING,    MAP_OBJ_GFX_RIVAL_MAY_SURFING},
    {MAP_OBJ_GFX_BRENDAN_UNDERWATER,       MAP_OBJ_GFX_MAY_UNDERWATER},
    {MAP_OBJ_GFX_RIVAL_BRENDAN_FIELD_MOVE, MAP_OBJ_GFX_RIVAL_MAY_FIELD_MOVE},
    {MAP_OBJ_GFX_BRENDAN_FISHING,          MAP_OBJ_GFX_MAY_FISHING},
    {MAP_OBJ_GFX_BRENDAN_WATERING,         MAP_OBJ_GFX_MAY_WATERING},
};
static const u8 sPlayerAvatarGfxIds[][2] =
{
    {MAP_OBJ_GFX_BRENDAN_NORMAL,     MAP_OBJ_GFX_MAY_NORMAL},
    {MAP_OBJ_GFX_BRENDAN_MACH_BIKE,  MAP_OBJ_GFX_MAY_MACH_BIKE},
    {MAP_OBJ_GFX_BRENDAN_ACRO_BIKE,  MAP_OBJ_GFX_MAY_ACRO_BIKE},
    {MAP_OBJ_GFX_BRENDAN_SURFING,    MAP_OBJ_GFX_MAY_SURFING},
    {MAP_OBJ_GFX_BRENDAN_UNDERWATER, MAP_OBJ_GFX_MAY_UNDERWATER},
    {MAP_OBJ_GFX_BRENDAN_FIELD_MOVE, MAP_OBJ_GFX_MAY_FIELD_MOVE},
    {MAP_OBJ_GFX_BRENDAN_FISHING,    MAP_OBJ_GFX_MAY_FISHING},
    {MAP_OBJ_GFX_BRENDAN_WATERING,   MAP_OBJ_GFX_MAY_WATERING},
};
static const u8 gUnknown_0830FC64[2][5][2] =
{
    //male
    {
        {MAP_OBJ_GFX_BRENDAN_NORMAL, 1},
        {MAP_OBJ_GFX_BRENDAN_MACH_BIKE, 2},
        {MAP_OBJ_GFX_BRENDAN_ACRO_BIKE, 4},
        {MAP_OBJ_GFX_BRENDAN_SURFING, 8},
        {MAP_OBJ_GFX_BRENDAN_UNDERWATER, 16},
    },
    //female
    {
        {MAP_OBJ_GFX_MAY_NORMAL, 1},
        {MAP_OBJ_GFX_MAY_MACH_BIKE, 2},
        {MAP_OBJ_GFX_MAY_ACRO_BIKE, 4},
        {MAP_OBJ_GFX_MAY_SURFING, 8},
        {MAP_OBJ_GFX_MAY_UNDERWATER, 16},
    }
};
static bool8 (*const gUnknown_0830FC78[])(u8) =  //Duplicate of gUnknown_0830FC34
{
    MetatileBehavior_IsSouthArrowWarp,
    MetatileBehavior_IsNorthArrowWarp,
    MetatileBehavior_IsWestArrowWarp,
    MetatileBehavior_IsEastArrowWarp,
};
static u8 (*const gUnknown_0830FC88[])(struct Task *, struct MapObject *, struct MapObject *) =
{
    sub_8059E84,
    sub_8059EA4,
    sub_8059F40,
};
static u8 (*const sPlayerAvatarSecretBaseMatJump[])(struct Task *, struct MapObject *) =
{
    PlayerAvatar_DoSecretBaseMatJump,
};
static u8 (*const gUnknown_0830FC98[])(struct Task *, struct MapObject *) =
{
    sub_805A0D8,
    sub_805A100,
    sub_805A178,
    sub_805A1B8,
};

fieldmap_object_null_cb(sub_80587B4, sub_80587D8);

void player_step(u8 direction, u16 newKeys, u16 heldKeys)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    sub_8059D60(playerMapObj);
    if (gPlayerAvatar.preventStep == FALSE)
    {
        Bike_TryAcroBikeHistoryUpdate(newKeys, heldKeys);
        if (!sub_8058854(playerMapObj, direction))
        {
            npc_clear_strange_bits(playerMapObj);
            DoPlayerAvatarTransition();
            if (TryDoMetatileBehaviorForcedMovement() == 0)
            {
                MovePlayerAvatarUsingKeypadInput(direction, newKeys, heldKeys);
                PlayerAllowForcedMovementIfMovingSameDirection();
            }
        }
    }
}

static bool8 sub_8058854(struct MapObject *playerMapObj, u8 direction)
{
    if (FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(playerMapObj)
     && !FieldObjectClearAnimIfSpecialAnimFinished(playerMapObj))
    {
        u8 specialAnim = FieldObjectGetSpecialAnim(playerMapObj);

        if (specialAnim > 24 && specialAnim < 29 && direction != DIR_NONE && playerMapObj->placeholder18 != direction)
        {
            FieldObjectClearAnim(playerMapObj);
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    }
    return FALSE;
}

static void npc_clear_strange_bits(struct MapObject *a)
{
    a->mapobj_bit_12 = 0;
    a->mapobj_bit_10 = 0;
    a->mapobj_bit_9 = 0;
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
    if (gUnknown_020297ED != 0 && (gMain.heldKeys & 0x100))
        return 0;
#endif
    return gUnknown_0830FBA0[GetForcedMovementByMetatileBehavior()]();
}

static u8 GetForcedMovementByMetatileBehavior(void)
{
    u8 i;

    if (!(gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_5))
    {
        u8 r5 = gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1E;

        for (i = 0; i < 18; i++)
        {
            if (gUnknown_0830FB58[i](r5))
                return i + 1;
        }
    }
    return 0;
}

bool8 ForcedMovement_None(void)
{
    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_6)
    {
        struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

        playerMapObj->mapobj_bit_9 = 0;
        playerMapObj->mapobj_bit_11 = 1;
        FieldObjectSetDirection(playerMapObj, playerMapObj->mapobj_unk_18);
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
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    playerMapObj->mapobj_bit_10 = 1;
    return DoForcedMovement(playerMapObj->placeholder18, a);
}

bool8 ForcedMovement_Slip(void)
{
    return DoForcedMovementInCurrentDirection(PlayerGoSpeed2);
}

bool8 sub_8058AAC(void)
{
    return DoForcedMovement(1, PlayerGoSpeed1);
}

bool8 sub_8058AC4(void)
{
    return DoForcedMovement(2, PlayerGoSpeed1);
}

bool8 sub_8058ADC(void)
{
    return DoForcedMovement(3, PlayerGoSpeed1);
}

bool8 sub_8058AF4(void)
{
    return DoForcedMovement(4, PlayerGoSpeed1);
}

bool8 sub_8058B0C(void)
{
    return DoForcedMovement(1, npc_use_some_d2s);
}

bool8 sub_8058B24(void)
{
    return DoForcedMovement(2, npc_use_some_d2s);
}

bool8 sub_8058B3C(void)
{
    return DoForcedMovement(3, npc_use_some_d2s);
}

bool8 sub_8058B54(void)
{
    return DoForcedMovement(4, npc_use_some_d2s);
}

static u8 ForcedMovement_Slide(u8 direction, void (*b)(u8))
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    playerMapObj->mapobj_bit_10 = 1;
    playerMapObj->mapobj_bit_9 = 1;
    return DoForcedMovement(direction, b);
}

bool8 ForcedMovement_SlideSouth(void)
{
    return ForcedMovement_Slide(1, PlayerGoSpeed2);
}

bool8 ForcedMovement_SlideNorth(void)
{
    return ForcedMovement_Slide(2, PlayerGoSpeed2);
}

bool8 ForcedMovement_SlideWest(void)
{
    return ForcedMovement_Slide(3, PlayerGoSpeed2);
}

bool8 ForcedMovement_SlideEast(void)
{
    return ForcedMovement_Slide(4, PlayerGoSpeed2);
}

bool8 ForcedMovement_MatJump(void)
{
    DoPlayerMatJump();
    return TRUE;
}

bool8 sub_8058C10(void)
{
    sub_805A06C();
    return TRUE;
}

bool8 ForcedMovement_MuddySlope(void)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (playerMapObj->placeholder18 != 2 || GetPlayerSpeed() <= 3)
    {
        Bike_UpdateBikeCounterSpeed(0);
        playerMapObj->mapobj_bit_9 = 1;
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
    else if (direction != player_get_direction_upper_nybble() && gPlayerAvatar.runningState != MOVING)
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

void PlayerNotOnBikeNotMoving(u8 direction, u16 heldKeys)
{
    PlayerFaceDirection(player_get_direction_lower_nybble());
}

void PlayerNotOnBikeTurningInPlace(u8 direction, u16 heldKeys)
{
    PlayerTurnInPlace(direction);
}

void sub_8058D0C(u8 direction, u16 heldKeys)
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
        if (!(gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_4) && (heldKeys & B_BUTTON) && FlagGet(FLAG_SYS_B_DASH)
         && IsRunningDisallowed(gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1E) == 0)
        {
            sub_805940C(direction);
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
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    x = playerMapObj->coords2.x;
    y = playerMapObj->coords2.y;
    MoveCoords(direction, &x, &y);
    return CheckForFieldObjectCollision(playerMapObj, x, y, direction, MapGridGetMetatileBehaviorAt(x, y));
}

u8 CheckForFieldObjectCollision(struct MapObject *a, s16 x, s16 y, u8 direction, u8 e)
{
    u8 collision;

    collision = npc_block_way(a, x, y, direction);
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

static u8 sub_8058EF0(s16 a, s16 b, u8 c)
{
    if ((gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING)
     && MapGridGetZCoordAt(a, b) == 3
     && GetFieldObjectIdByXYZ(a, b, 3) == 16)
    {
        sub_805A20C(c);
        return 1;
    }
    else
    {
        return 0;
    }
}

static bool8 ShouldJumpLedge(s16 a, s16 b, u8 c)
{
    if (GetLedgeJumpDirection(a, b, c) != 0)
        return 1;
    else
        return 0;
}

static u8 sub_8058F6C(s16 a, s16 b, u8 c)
{
    if (FlagGet(FLAG_SYS_USE_STRENGTH))
    {
        u8 mapObjectId = GetFieldObjectIdByXY(a, b);

        if (mapObjectId != 16)
        {
            if (gMapObjects[mapObjectId].graphicsId == 0x57)
            {
                a = gMapObjects[mapObjectId].coords2.x;
                b = gMapObjects[mapObjectId].coords2.y;
                MoveCoords(c, &a, &b);
                if (npc_block_way(&gMapObjects[mapObjectId], a, b, c) == 0
                 && MetatileBehavior_IsNonAnimDoor(MapGridGetMetatileBehaviorAt(a, b)) == 0)
                {
                    StartStrengthAnim(mapObjectId, c);
                    return 1;
                }
            }
        }
    }
    return 0;
}

static void check_acro_bike_metatile(int unused1, int unused2, u8 c, u8 *d)
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
    u32 flags = gPlayerAvatar.unk1;

    if (flags != 0)
    {
        for (i = 0; i < 8; i++, flags >>= 1)
        {
#ifdef NONMATCHING
            if (flags & 1)
            {
                gUnknown_0830FC14[i](&gMapObjects[gPlayerAvatar.mapObjectId]);
            }
#else
            if (flags & 1)
            {
                register void (*const *funcs)(struct MapObject *) asm("r0") = gUnknown_0830FC14;
                funcs[i](&gMapObjects[gPlayerAvatar.mapObjectId]);
            }
#endif
        }
        gPlayerAvatar.unk1 = 0;
    }
}

void nullsub_49(struct MapObject *a)
{
}

void PlayerAvatarTransition_Normal(struct MapObject *a)
{
    sub_805B980(a, GetPlayerAvatarGraphicsIdByStateId(0));
    FieldObjectTurn(a, a->placeholder18);
    SetPlayerAvatarStateMask(1);
}

void PlayerAvatarTransition_MachBike(struct MapObject *a)
{
    sub_805B980(a, GetPlayerAvatarGraphicsIdByStateId(1));
    FieldObjectTurn(a, a->placeholder18);
    SetPlayerAvatarStateMask(2);
    BikeClearState(0, 0);
}

void PlayerAvatarTransition_AcroBike(struct MapObject *a)
{
    sub_805B980(a, GetPlayerAvatarGraphicsIdByStateId(2));
    FieldObjectTurn(a, a->placeholder18);
    SetPlayerAvatarStateMask(4);
    BikeClearState(0, 0);
    Bike_HandleBumpySlopeJump();
}

void PlayerAvatarTransition_Surfing(struct MapObject *a)
{
    u8 unk;

    sub_805B980(a, GetPlayerAvatarGraphicsIdByStateId(3));
    FieldObjectTurn(a, a->placeholder18);
    SetPlayerAvatarStateMask(8);
    gFieldEffectArguments[0] = a->coords2.x;
    gFieldEffectArguments[1] = a->coords2.y;
    gFieldEffectArguments[2] = gPlayerAvatar.mapObjectId;
    unk = FieldEffectStart(FLDEFF_SURF_BLOB);
    a->mapobj_unk_1A = unk;
    sub_8127ED0(unk, 1);
}

void PlayerAvatarTransition_Underwater(struct MapObject *a)
{
    sub_805B980(a, GetPlayerAvatarGraphicsIdByStateId(4));
    FieldObjectTurn(a, a->placeholder18);
    SetPlayerAvatarStateMask(16);
    a->mapobj_unk_1A = sub_8128124(a->spriteId);
}

void sub_80591F4(struct MapObject *a)
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
    u8 unk = gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1C;

    if (unk < 4
     || (unk >= 16 && unk < 0x15)
     || (unk >= 25 && unk < 41)
     || (unk >= 98 && unk < 110)
     || (unk >= 122 && unk < 126))
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
    return FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(&gMapObjects[gPlayerAvatar.mapObjectId]);
}

static bool8 PlayerCheckIfAnimFinishedOrInactive(void)
{
    return FieldObjectCheckIfSpecialAnimFinishedOrInactive(&gMapObjects[gPlayerAvatar.mapObjectId]);
}

static void player_set_x22(u8 a)
{
    gMapObjects[gPlayerAvatar.mapObjectId].animId = a;
}

u8 player_get_x22(void)
{
    return gMapObjects[gPlayerAvatar.mapObjectId].animId;
}

static void sub_8059348(u8 a)
{
    FieldObjectForceSetSpecialAnim(&gMapObjects[gPlayerAvatar.mapObjectId], a);
}

void PlayerSetAnimId(u8 animId, u8 b)
{
    if (!PlayerIsAnimActive())
    {
        player_set_x22(b);
        FieldObjectSetSpecialAnim(&gMapObjects[gPlayerAvatar.mapObjectId], animId);
    }
}

// normal speed (1 speed)
void PlayerGoSpeed1(u8 a)
{
    PlayerSetAnimId(GetGoSpeed0AnimId(a), 2);
}

// fast speed (2 speed)
void PlayerGoSpeed2(u8 a)
{
    PlayerSetAnimId(sub_8060744(a), 2);
}

void npc_use_some_d2s(u8 a)
{
    PlayerSetAnimId(d2s_08064034(a), 2);
}

// fastest speed (4 speed)
void PlayerGoSpeed4(u8 a)
{
    PlayerSetAnimId(sub_806079C(a), 2);
}

void sub_805940C(u8 a)
{
    PlayerSetAnimId(sub_80607F4(a), 2);
}

void PlayerOnBikeCollide(u8 a)
{
    PlayCollisionSoundIfNotFacingWarp(a);
    PlayerSetAnimId(GetStepInPlaceDelay16AnimId(a), 2);
}

static void PlayerNotOnBikeCollide(u8 a)
{
    PlayCollisionSoundIfNotFacingWarp(a);
    PlayerSetAnimId(GetStepInPlaceDelay32AnimId(a), 2);
}

void PlayerFaceDirection(u8 direction)
{
    PlayerSetAnimId(GetFaceDirectionAnimId(direction), 1);
}

void PlayerTurnInPlace(u8 direction)
{
    PlayerSetAnimId(GetStepInPlaceDelay8AnimId(direction), 1);
}

void PlayerJumpLedge(u8 direction)
{
    PlaySE(SE_DANSA);
    PlayerSetAnimId(GetJumpLedgeAnimId(direction), 8);
}

void sub_80594C0(void)
{
    if (gPlayerAvatar.tileTransitionState == T_TILE_CENTER || gPlayerAvatar.tileTransitionState == T_NOT_MOVING)
    {
        if (player_should_look_direction_be_enforced_upon_movement())
            sub_8059348(GetFaceDirectionAnimId(gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_18));
    }
}

// wheelie idle
void PlayerIdleWheelie(u8 a)
{
    PlayerSetAnimId(sub_80609D8(a), 1);
}

// normal to wheelie
void PlayerStartWheelie(u8 a)
{
    PlayerSetAnimId(sub_8060A04(a), 1);
}

// wheelie to normal
void PlayerEndWheelie(u8 a)
{
    PlayerSetAnimId(sub_8060A30(a), 1);
}

// wheelie hopping standing
void PlayerStandingHoppingWheelie(u8 a)
{
    PlaySE(SE_JITE_PYOKO);
    PlayerSetAnimId(sub_8060A5C(a), 1);
}

// wheelie hopping moving
void PlayerMovingHoppingWheelie(u8 a)
{
    PlaySE(SE_JITE_PYOKO);
    PlayerSetAnimId(sub_8060A88(a), 2);
}

// wheelie hopping ledge
void PlayerLedgeHoppingWheelie(u8 a)
{
    PlaySE(SE_JITE_PYOKO);
    PlayerSetAnimId(sub_8060AB4(a), 8);
}

// acro turn jump
void PlayerAcroTurnJump(u8 direction)
{
    PlaySE(SE_JITE_PYOKO);
    PlayerSetAnimId(sub_8060878(direction), 1);
}

void sub_80595DC(u8 direction)
{
    PlaySE(SE_WALL_HIT);
    PlayerSetAnimId(sub_8060AE0(direction), 2);
}

void sub_8059600(u8 a)
{
    PlayerSetAnimId(sub_8060B0C(a), 2);
}

void sub_8059618(u8 a)
{
    PlayerSetAnimId(sub_8060B38(a), 2);
}

void sub_8059630(u8 a)
{
    PlayerSetAnimId(sub_8060B64(a), 2);
}

static void PlayCollisionSoundIfNotFacingWarp(u8 a)
{
    s16 x, y;
    u8 unk = gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1E;

    if (!gUnknown_0830FC34[a - 1](unk))
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
    *x = gMapObjects[gPlayerAvatar.mapObjectId].coords2.x;
    *y = gMapObjects[gPlayerAvatar.mapObjectId].coords2.y;
    MoveCoords(player_get_direction_lower_nybble(), x, y);
}

void PlayerGetDestCoords(s16 *x, s16 *y)
{
    *x = gMapObjects[gPlayerAvatar.mapObjectId].coords2.x;
    *y = gMapObjects[gPlayerAvatar.mapObjectId].coords2.y;
}

u8 player_get_direction_lower_nybble(void)
{
    return gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_18;
}

u8 player_get_direction_upper_nybble(void)
{
    return gMapObjects[gPlayerAvatar.mapObjectId].placeholder18;
}

u8 PlayerGetZCoord(void)
{
    return gMapObjects[gPlayerAvatar.mapObjectId].elevation;
}

void unref_sub_8059790(s16 a, s16 b)
{
    sub_805C058(&gMapObjects[gPlayerAvatar.mapObjectId], a, b);
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
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    npc_clear_strange_bits(playerMapObj);
    FieldObjectSetDirection(playerMapObj, playerMapObj->mapobj_unk_18);
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

u8 unref_GetRivalAvatarGenderByGraphcsId(u8 gfxId)
{
    switch (gfxId)
    {
    case MAP_OBJ_GFX_RIVAL_MAY_NORMAL:
    case MAP_OBJ_GFX_RIVAL_MAY_MACH_BIKE:
    case MAP_OBJ_GFX_RIVAL_MAY_ACRO_BIKE:
    case MAP_OBJ_GFX_RIVAL_MAY_SURFING:
    case MAP_OBJ_GFX_RIVAL_MAY_FIELD_MOVE:
    case MAP_OBJ_GFX_MAY_UNDERWATER:
    case MAP_OBJ_GFX_MAY_FISHING:
    case MAP_OBJ_GFX_MAY_WATERING:
        return FEMALE;
    default:
        return MALE;
    }
}

u8 GetPlayerAvatarGenderByGraphicsId(u8 gfxId)
{
    switch (gfxId)
    {
    case MAP_OBJ_GFX_MAY_NORMAL:
    case MAP_OBJ_GFX_MAY_MACH_BIKE:
    case MAP_OBJ_GFX_MAY_ACRO_BIKE:
    case MAP_OBJ_GFX_MAY_SURFING:
    case MAP_OBJ_GFX_MAY_FIELD_MOVE:
    case MAP_OBJ_GFX_MAY_UNDERWATER:
    case MAP_OBJ_GFX_MAY_FISHING:
    case MAP_OBJ_GFX_MAY_WATERING:
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
            if (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES) == 0)
                break;
            if (pokemon_has_move(&gPlayerParty[i], 0x39))
                return TRUE;
        }
    }
    return FALSE;
}

bool8 IsPlayerSurfingNorth(void)
{
    if (player_get_direction_upper_nybble() == DIR_NORTH && TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
        return TRUE;
    else
        return FALSE;
}

bool8 IsPlayerFacingSurfableFishableWater(void)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    s16 x = playerMapObj->coords2.x;
    s16 y = playerMapObj->coords2.y;

    MoveCoords(playerMapObj->mapobj_unk_18, &x, &y);
    if (npc_block_way(playerMapObj, x, y, playerMapObj->mapobj_unk_18) == 3 && PlayerGetZCoord() == 3
     && MetatileBehavior_IsSurfableFishableWater(MapGridGetMetatileBehaviorAt(x, y)))
        return TRUE;
    else
        return FALSE;
}

void ClearPlayerAvatarInfo(void)
{
    memset(&gPlayerAvatar, 0, sizeof(struct PlayerAvatar));
}

void SetPlayerAvatarStateMask(u8 a)
{
    gPlayerAvatar.flags &= 0xE0;
    gPlayerAvatar.flags |= a;
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
    struct MapObjectTemplate playerMapObjTemplate;
    u8 mapObjectId;
    struct MapObject *mapObject;

    playerMapObjTemplate.localId = 0xFF;
    playerMapObjTemplate.graphicsId = GetPlayerAvatarGraphicsIdByStateIdAndGender(0, gender);
    playerMapObjTemplate.x = x - 7;
    playerMapObjTemplate.y = y - 7;
    playerMapObjTemplate.elevation = 0;
    playerMapObjTemplate.movementType = 11;
    playerMapObjTemplate.unkA_0 = 0;
    playerMapObjTemplate.unkA_4 = 0;
    playerMapObjTemplate.unkC = 0;
    playerMapObjTemplate.unkE = 0;
    playerMapObjTemplate.script = NULL;
    playerMapObjTemplate.flagId = 0;
    mapObjectId = SpawnSpecialFieldObject(&playerMapObjTemplate);
    mapObject = &gMapObjects[mapObjectId];
    mapObject->mapobj_bit_16 = 1;
    mapObject->mapobj_unk_1B = sub_8126B54();
    FieldObjectTurn(mapObject, direction);
    ClearPlayerAvatarInfo();
    gPlayerAvatar.runningState = NOT_MOVING;
    gPlayerAvatar.tileTransitionState = T_NOT_MOVING;
    gPlayerAvatar.mapObjectId = mapObjectId;
    gPlayerAvatar.spriteId = mapObject->spriteId;
    gPlayerAvatar.gender = gender;
    SetPlayerAvatarStateMask(0x21);
}

void sub_8059B88(u8 a)
{
    gMapObjects[gPlayerAvatar.mapObjectId].mapobj_bit_13 = a;
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
        gSprites[gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1A].invisible = a;
}

void sub_8059BF4(void)
{
    sub_805B980(&gMapObjects[gPlayerAvatar.mapObjectId], GetPlayerAvatarGraphicsIdByStateId(5));
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], 0);
}

void sub_8059C3C(u8 a)
{
    sub_805B980(&gMapObjects[gPlayerAvatar.mapObjectId], GetPlayerAvatarGraphicsIdByStateId(6));
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], sub_805FDE8(a));
}

void sub_8059C94(u8 a)
{
    sub_805B980(&gMapObjects[gPlayerAvatar.mapObjectId], GetPlayerAvatarGraphicsIdByStateId(2));
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], sub_805FD98(a));
    SeekSpriteAnim(&gSprites[gPlayerAvatar.spriteId], 1);
}

void sub_8059D08(u8 a)
{
    sub_805B980(&gMapObjects[gPlayerAvatar.mapObjectId], GetPlayerAvatarGraphicsIdByStateId(7));
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], FieldObjectDirectionToImageAnimId(a));
}

static void sub_8059D60(struct MapObject *a)
{
    s16 x;
    s16 y;
    u8 r6;
    u8 r8 = a->mapobj_unk_1E;

    for (x = 0, r6 = 1; x < 4; x++, r6++)
    {
        if (gUnknown_0830FC78[x](r8) && r6 == a->placeholder18)
        {
            x = a->coords2.x;
            y = a->coords2.y;
            MoveCoords(r6, &x, &y);
            sub_8126BC4(a->mapobj_unk_1B, r6, x, y);
            return;
        }
    }
    objid_set_invisible(a->mapobj_unk_1B);
}

/* Strength */

static void sub_8059E2C(u8 taskId);

static void StartStrengthAnim(u8 a, u8 b)
{
    u8 taskId = CreateTask(sub_8059E2C, 0xFF);

    gTasks[taskId].data[1] = a;
    gTasks[taskId].data[2] = b;
    sub_8059E2C(taskId);
}

static void sub_8059E2C(u8 taskId)
{
    while (gUnknown_0830FC88[gTasks[taskId].data[0]](&gTasks[taskId],
                                                     &gMapObjects[gPlayerAvatar.mapObjectId],
                                                     &gMapObjects[gTasks[taskId].data[1]]))
        ;
}

u8 sub_8059E84(struct Task *task, struct MapObject *b, struct MapObject *c)
{
    ScriptContext2_Enable();
    gPlayerAvatar.preventStep = TRUE;
    task->data[0]++;
    return 0;
}

u8 sub_8059EA4(struct Task *task, struct MapObject *b, struct MapObject *c)
{
    if (!FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(b)
     && !FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(c))
    {
        FieldObjectClearAnimIfSpecialAnimFinished(b);
        FieldObjectClearAnimIfSpecialAnimFinished(c);
        FieldObjectSetSpecialAnim(b, GetStepInPlaceDelay16AnimId((u8)task->data[2]));
        FieldObjectSetSpecialAnim(c, GetSimpleGoAnimId((u8)task->data[2]));
        gFieldEffectArguments[0] = c->coords2.x;
        gFieldEffectArguments[1] = c->coords2.y;
        gFieldEffectArguments[2] = c->elevation;
        gFieldEffectArguments[3] = gSprites[c->spriteId].oam.priority;
        FieldEffectStart(FLDEFF_DUST);
        PlaySE(SE_W070);
        task->data[0]++;
    }
    return 0;
}

u8 sub_8059F40(struct Task *task, struct MapObject *b, struct MapObject *c)
{
    if (FieldObjectCheckIfSpecialAnimFinishedOrInactive(b)
     && FieldObjectCheckIfSpecialAnimFinishedOrInactive(c))
    {
        FieldObjectClearAnimIfSpecialAnimFinished(b);
        FieldObjectClearAnimIfSpecialAnimFinished(c);
        gPlayerAvatar.preventStep = FALSE;
        ScriptContext2_Disable();
        DestroyTask(FindTaskIdByFunc(sub_8059E2C));
    }
    return 0;
}

/* Some field effect */

static void DoPlayerAvatarSecretBaseMatJump(u8 taskId);

static void DoPlayerMatJump(void)
{
    DoPlayerAvatarSecretBaseMatJump(CreateTask(DoPlayerAvatarSecretBaseMatJump, 0xFF));
}

static void DoPlayerAvatarSecretBaseMatJump(u8 taskId)
{
    while (sPlayerAvatarSecretBaseMatJump[gTasks[taskId].data[0]](&gTasks[taskId], &gMapObjects[gPlayerAvatar.mapObjectId]))
        ;
}

// because data[0] is used to call this, it can be inferred that there may have been multiple mat jump functions at one point, so the name for these groups of functions is appropriate in assuming the sole use of mat jump.
u8 PlayerAvatar_DoSecretBaseMatJump(struct Task *task, struct MapObject *mapObject)
{
    gPlayerAvatar.preventStep = TRUE;
    if (FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        PlaySE(SE_DANSA);
        FieldObjectSetSpecialAnim(mapObject, sub_806084C(mapObject->mapobj_unk_18));
        task->data[1]++;
        if (task->data[1] > 1)
        {
            gPlayerAvatar.preventStep = FALSE;
            gPlayerAvatar.unk1 |= 0x20;
            DestroyTask(FindTaskIdByFunc(DoPlayerAvatarSecretBaseMatJump));
        }
    }
    return 0;
}

/* Some field effect */

static void sub_805A08C(u8 taskId);

static void sub_805A06C(void)
{
    u8 taskId = CreateTask(sub_805A08C, 0xFF);

    sub_805A08C(taskId);
}

static void sub_805A08C(u8 taskId)
{
    while (gUnknown_0830FC98[gTasks[taskId].data[0]](&gTasks[taskId], &gMapObjects[gPlayerAvatar.mapObjectId]))
        ;
}

u8 sub_805A0D8(struct Task *task, struct MapObject *mapObject)
{
    task->data[0]++;
    task->data[1] = mapObject->placeholder18;
    gPlayerAvatar.preventStep = TRUE;
    ScriptContext2_Enable();
    PlaySE(SE_TK_WARPIN);
    return 1;
}

u8 sub_805A100(struct Task *task, struct MapObject *mapObject)
{
    u8 directions[] = {DIR_WEST, DIR_EAST, DIR_NORTH, DIR_SOUTH};

    if (FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        u8 direction;

        FieldObjectSetSpecialAnim(mapObject, GetFaceDirectionAnimId(direction = directions[mapObject->placeholder18 - 1]));
        if (direction == (u8)task->data[1])
            task->data[2]++;
        task->data[0]++;
        if (task->data[2] > 3 && direction == GetOppositeDirection(task->data[1]))
            task->data[0]++;
    }
    return 0;
}

u8 sub_805A178(struct Task *task, struct MapObject *mapObject)
{
    const u8 arr[] = {16, 16, 17, 18, 19};

    if (FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        FieldObjectSetSpecialAnim(mapObject, arr[task->data[2]]);
        task->data[0] = 1;
    }
    return 0;
}

u8 sub_805A1B8(struct Task *task, struct MapObject *mapObject)
{
    if (FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        FieldObjectSetSpecialAnim(mapObject, GetSimpleGoAnimId(GetOppositeDirection(task->data[1])));
        ScriptContext2_Disable();
        gPlayerAvatar.preventStep = FALSE;
        DestroyTask(FindTaskIdByFunc(sub_805A08C));
    }
    return 0;
}

/* Some Field effect */

static void taskFF_0805D1D4(u8 taskId);
static void sub_805A2D0(u8 taskId);

void sub_805A20C(u8 a)
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
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(playerMapObj))
    {
        if (!FieldObjectClearAnimIfSpecialAnimFinished(playerMapObj))
            return;
    }
    sub_8127ED0(playerMapObj->mapobj_unk_1A, 2);
    FieldObjectSetSpecialAnim(playerMapObj, sub_80608D0((u8)gTasks[taskId].data[0]));
    gTasks[taskId].func = sub_805A2D0;
}

static void sub_805A2D0(u8 taskId)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (FieldObjectClearAnimIfSpecialAnimFinished(playerMapObj))
    {
        sub_805B980(playerMapObj, GetPlayerAvatarGraphicsIdByStateId(0));
        FieldObjectSetSpecialAnim(playerMapObj, GetFaceDirectionAnimId(playerMapObj->mapobj_unk_18));
        gPlayerAvatar.preventStep = FALSE;
        ScriptContext2_Disable();
        DestroySprite(&gSprites[playerMapObj->mapobj_unk_1A]);
        DestroyTask(taskId);
    }
}

/* Fishing */

static u8 (*const sFishingStateFuncs[])(struct Task *) =
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

static void Task_Fishing(u8 taskId);
static void sub_805A954(void);

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

u8 Fishing1(struct Task *task)
{
    ScriptContext2_Enable();
    gPlayerAvatar.preventStep = TRUE;
    task->tStep++;
    return 0;
}

u8 Fishing2(struct Task *task)
{
    struct MapObject *playerMapObj;
    const s16 arr1[] = {1, 1, 1};
    const s16 arr2[] = {1, 3, 6};

    task->tRoundsPlayed = 0;
    task->tMinRoundsRequired = arr1[task->tFishingRod] + (Random() % arr2[task->tFishingRod]);
    task->tPlayerGfxId = gMapObjects[gPlayerAvatar.mapObjectId].graphicsId;
    playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    FieldObjectClearAnimIfSpecialAnimActive(playerMapObj);
    playerMapObj->mapobj_bit_11 = 1;
    sub_8059C3C(playerMapObj->mapobj_unk_18);
    task->tStep++;
    return 0;
}

u8 Fishing3(struct Task *task)
{
    sub_805A954();
    
    // Wait one second before starting dot game
    task->tFrameCounter++;
    if (task->tFrameCounter >= 60)
        task->tStep++;
    return 0;
}

u8 Fishing4(struct Task *task)
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
    return 1;
}

// Play a round of the dot game
u8 Fishing5(struct Task *task)
{
    const u8 dot[] = _("·");

    sub_805A954();
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
        return 0;
    }
}

// Determine if fish bites
u8 Fishing6(struct Task *task)
{
    sub_805A954();
    task->tStep++;
    if (!DoesCurrentMapHaveFishingMons() || (Random() & 1))
        task->tStep = FISHING_NO_BITE;
    else
        StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], sub_805FE08(player_get_direction_lower_nybble()));
    return 1;
}

// Oh! A Bite!
u8 Fishing7(struct Task *task)
{
    sub_805A954();
    Menu_PrintText(gOtherText_OhABite, 4, 17);
    task->tStep++;
    task->tFrameCounter = 0;
    return 0;
}

// We have a bite. Now, wait for the player to press A, or the timer to expire.
u8 Fishing8(struct Task *task)
{
    const s16 reelTimeouts[3] = {36, 33, 30};

    sub_805A954();
    task->tFrameCounter++;
    if (task->tFrameCounter >= reelTimeouts[task->tFishingRod])
        task->tStep = FISHING_GOT_AWAY;
    else if (gMain.newKeys & A_BUTTON)
        task->tStep++;
    return 0;
}

// Determine if we're going to play the dot game again
u8 Fishing9(struct Task *task)
{
    const s16 arr[][2] =
    {
        {0, 0},
        {40, 10},
        {70, 30}
    };

    sub_805A954();
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
    return 0;
}

u8 Fishing10(struct Task *task)
{
    sub_805A954();
    MenuPrintMessageDefaultCoords(gOtherText_PokeOnHook);
    Menu_DisplayDialogueFrame();
    task->tStep++;
    task->tFrameCounter = 0;
    return 0;
}

u8 Fishing11(struct Task *task)
{
    if (task->tFrameCounter == 0)
        sub_805A954();

    if (task->tFrameCounter == 0)
    {
        if (Menu_UpdateWindowText())
        {
            struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

            sub_805B980(playerMapObj, task->tPlayerGfxId);
            FieldObjectTurn(playerMapObj, playerMapObj->placeholder18);
            if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING)
                sub_8127F28(gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1A, 0, 0);
            gSprites[gPlayerAvatar.spriteId].pos2.x = 0;
            gSprites[gPlayerAvatar.spriteId].pos2.y = 0;
            Menu_EraseScreen();
            task->tFrameCounter++;
            return 0;
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
    return 0;
}

// Not even a nibble
u8 Fishing12(struct Task *task)
{
    sub_805A954();
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], sub_805FDF8(player_get_direction_lower_nybble()));
    MenuPrintMessageDefaultCoords(gOtherText_NotEvenANibble);
    task->tStep = FISHING_SHOW_RESULT;
    return 1;
}

// It got away
u8 Fishing13(struct Task *task)
{
    sub_805A954();
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], sub_805FDF8(player_get_direction_lower_nybble()));
    MenuPrintMessageDefaultCoords(gOtherText_ItGotAway);
    task->tStep++;
    return 1;
}

// Display the message
u8 Fishing14(struct Task *task)
{
    sub_805A954();
    Menu_DisplayDialogueFrame();
    task->tStep++;
    return 0;
}

u8 Fishing15(struct Task *task)
{
    sub_805A954();
    if (gSprites[gPlayerAvatar.spriteId].animEnded)
    {
        struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

        sub_805B980(playerMapObj, task->tPlayerGfxId);
        FieldObjectTurn(playerMapObj, playerMapObj->placeholder18);
        if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING)
            sub_8127F28(gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1A, 0, 0);
        gSprites[gPlayerAvatar.spriteId].pos2.x = 0;
        gSprites[gPlayerAvatar.spriteId].pos2.y = 0;
        task->tStep++;
    }
    return 0;
}

u8 Fishing16(struct Task *task)
{
    if (Menu_UpdateWindowText())
    {
        gPlayerAvatar.preventStep = FALSE;
        ScriptContext2_Disable();
        UnfreezeMapObjects();
        Menu_EraseScreen();
        sub_80BE97C(0);
        DestroyTask(FindTaskIdByFunc(Task_Fishing));
    }
    return 0;
}

#undef tStep
#undef tFrameCounter
#undef tFishingRod

static void sub_805A954(void)
{
    struct Sprite *playerSprite = &gSprites[gPlayerAvatar.spriteId];
    u8 animCmdIndex;
    u8 animType;

    AnimateSprite(playerSprite);
    playerSprite->pos2.x = 0;
    playerSprite->pos2.y = 0;
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
        playerSprite->pos2.x = 8;
        if (player_get_direction_lower_nybble() == 3)
            playerSprite->pos2.x = -8;
    }
    if (animType == 5)
        playerSprite->pos2.y = -8;
    if (animType == 10 || animType == 11)
        playerSprite->pos2.y = 8;
    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING)
        sub_8127F28(gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1A, 1, playerSprite->pos2.y);
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
        PlayerFaceDirection(gMapObjects[gPlayerAvatar.mapObjectId].placeholder18);
    else if (gMapObjects[gPlayerAvatar.mapObjectId].mapobj_bit_15 && !CanCameraMoveInDirection(a))
        PlayerOnBikeCollide(a);
    else
        PlayerGoSpeed4(a);
    return 1;
}

#endif
