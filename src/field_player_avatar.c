#include "global.h"
#include "field_player_avatar.h"
#include "asm.h"
#include "field_map_obj.h"
#include "rom4.h"
#include "event_data.h"
#include "main.h"
#include "menu.h"
#include "rng.h"
#include "script.h"
#include "songs.h"
#include "sound.h"
#include "task.h"
#include "field_effect.h"
#include "wild_encounter.h"
#include "asm_fieldmap.h"
#include "metatile_behavior.h"

extern u8 gOtherText_OhABite[];
extern u8 gOtherText_PokeOnHook[];
extern u8 gOtherText_NotEvenANibble[];
extern u8 gOtherText_ItGotAway[];

extern struct
{
    s32 x;
    s32 y;
    u32 unk8;
    u32 unkC;
} gUnknown_0202FF84;

extern bool8 (*gUnknown_0830FB58[])(u8);
extern u8 (*gUnknown_0830FBA0[])(void);
extern void (*gUnknown_0830FBEC[])(u8, u16);
extern bool8 (*gUnknown_0830FBF8[])(u8);
extern u8 gUnknown_0830FC0C[];
extern void (*gUnknown_0830FC14[])(struct MapObject *);
extern bool8 (*gUnknown_0830FC34[])(u8);
extern u8 gUnknown_0830FC44[][2];
extern u8 gUnknown_0830FC54[][2];
extern u8 gUnknown_0830FC64[2][5][2];
extern bool8 (*gUnknown_0830FC78[])(u8); //Duplicate of gUnknown_0830FC34
extern u8 (*gUnknown_0830FC88[])(struct Task *, struct MapObject *, struct MapObject *);
extern u8 (*gUnknown_0830FC94[])(struct Task *, struct MapObject *);
extern u8 (*gUnknown_0830FC98[])(struct Task *, struct MapObject *);
extern u8 gUnknown_0830FCA8[];
extern u8 gUnknown_0830FCAC[];
extern u8 (*gUnknown_0830FCB4[])(struct Task *);
extern s16 gUnknown_0830FCF4[];
extern s16 gUnknown_0830FCFA[];
extern u8 gUnknown_0830FD00[];
extern s16 gUnknown_0830FD02[];
extern s16 gUnknown_0830FD08[];

//Functions
static u32 sub_80587D8(void);
static bool8 sub_8058854(struct MapObject *, u8);
static void npc_clear_strange_bits(struct MapObject *a);
static void MovePlayerAvatarUsingKeypadInput(u8 a, u16 b, u16 c);
static void PlayerAllowForcedMovementIfMovingSameDirection(void);
static u8 TryDoMetatileBehaviorForcedMovement(void);
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
static void sub_8059F94(void);
static void sub_805A06C(void);

void sub_80587B4(struct Sprite *sprite)
{
    meta_step(&gMapObjects[sprite->data0], sprite, sub_80587D8);
}

static u32 sub_80587D8(void)
{
    return 0;
}

void player_step(u8 a, u16 b, u16 c)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    sub_8059D60(playerMapObj);
    if (gPlayerAvatar.unk6 == 0)
    {
        sub_80E5B38(b, c);
        if (sub_8058854(playerMapObj, a) == 0)
        {
            npc_clear_strange_bits(playerMapObj);
            DoPlayerAvatarTransition();
            if (TryDoMetatileBehaviorForcedMovement() == 0)
            {
                MovePlayerAvatarUsingKeypadInput(a, b, c);
                PlayerAllowForcedMovementIfMovingSameDirection();
            }
        }
    }
}

static bool8 sub_8058854(struct MapObject *a, u8 b)
{
    if (FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(a)
     && !FieldObjectClearAnimIfSpecialAnimFinished(a))
    {
        u8 specialAnim = FieldObjectGetSpecialAnim(a);
        
        if (specialAnim > 24 && specialAnim < 29 && b != 0 && a->placeholder18 != b)
        {
            FieldObjectClearAnim(a);
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

static void MovePlayerAvatarUsingKeypadInput(u8 a, u16 b, u16 c)
{
    if ((gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_MACH_BIKE)
     || (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_ACRO_BIKE))
        MovePlayerOnBike(a, b, c);
    else
        MovePlayerNotOnBike(a, c);
}

static void PlayerAllowForcedMovementIfMovingSameDirection(void)
{
    if (gPlayerAvatar.running2 == 2)
        gPlayerAvatar.flags &= ~PLAYER_AVATAR_FLAG_5;
}

static u8 TryDoMetatileBehaviorForcedMovement(void)
{
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

u8 ForcedMovement_None(void)
{
    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_6)
    {
        struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
        
        playerMapObj->mapobj_bit_9 = 0;
        playerMapObj->mapobj_bit_11 = 1;
        FieldObjectSetDirection(playerMapObj, playerMapObj->mapobj_unk_18);
        gPlayerAvatar.flags &= ~PLAYER_AVATAR_FLAG_6;
    }
    return 0;
}

static u8 DoForcedMovement(u8 a, void (*b)(u8))
{
    struct PlayerAvatar *playerAvatar = &gPlayerAvatar;
    u8 r7 = CheckForPlayerAvatarCollision(a);
    
    playerAvatar->flags |= PLAYER_AVATAR_FLAG_6;
    if (r7 != 0)
    {
        ForcedMovement_None();
        if (r7 <= 4)
        {
            return 0;
        }
        else
        {
            if (r7 == 6)
                PlayerJumpLedge(a);
            playerAvatar->flags |= PLAYER_AVATAR_FLAG_6;
            playerAvatar->running2 = 2;
            return 1;
        }
    }
    else
    {
        playerAvatar->running2 = 2;
        b(a);
        return 1;
    }
}

static u8 DoForcedMovementInCurrentDirection(void (*a)(u8))
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    playerMapObj->mapobj_bit_10 = 1;
    return DoForcedMovement(playerMapObj->placeholder18, a);
}

u8 ForcedMovement_Slip(void)
{
    return DoForcedMovementInCurrentDirection(sub_80593C4);
}

u8 sub_8058AAC(void)
{
    return DoForcedMovement(1, PlayerGoSpeed0);
}

u8 sub_8058AC4(void)
{
    return DoForcedMovement(2, PlayerGoSpeed0);
}

u8 sub_8058ADC(void)
{
    return DoForcedMovement(3, PlayerGoSpeed0);
}

u8 sub_8058AF4(void)
{
    return DoForcedMovement(4, PlayerGoSpeed0);
}

u8 sub_8058B0C(void)
{
    return DoForcedMovement(1, npc_use_some_d2s);
}

u8 sub_8058B24(void)
{
    return DoForcedMovement(2, npc_use_some_d2s);
}

u8 sub_8058B3C(void)
{
    return DoForcedMovement(3, npc_use_some_d2s);
}

u8 sub_8058B54(void)
{
    return DoForcedMovement(4, npc_use_some_d2s);
}

static u8 ForcedMovement_Slide(u8 a, void (*b)(u8))
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    playerMapObj->mapobj_bit_10 = 1;
    playerMapObj->mapobj_bit_9 = 1;
    return DoForcedMovement(a, b);
}

u8 ForcedMovement_SlideSouth(void)
{
    return ForcedMovement_Slide(1, sub_80593C4);
}

u8 ForcedMovement_SlideNorth(void)
{
    return ForcedMovement_Slide(2, sub_80593C4);
}

u8 ForcedMovement_SlideWest(void)
{
    return ForcedMovement_Slide(3, sub_80593C4);
}

u8 ForcedMovement_SlideEast(void)
{
    return ForcedMovement_Slide(4, sub_80593C4);
}

u8 sub_8058C04(void)
{
    sub_8059F94();
    return 1;
}

u8 sub_8058C10(void)
{
    sub_805A06C();
    return 1;
}

u8 ForcedMovement_MuddySlope(void)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    if (playerMapObj->placeholder18 != 2 || sub_80E6034() <= 3)
    {
        sub_80E6010(0);
        playerMapObj->mapobj_bit_9 = 1;
        return DoForcedMovement(1, sub_80593C4);
    }
    else
    {
        return 0;
    }
}

static void MovePlayerNotOnBike(u8 a, u16 b)
{
    gUnknown_0830FBEC[CheckMovementInputNotOnBike(a)](a, b);
}

static u8 CheckMovementInputNotOnBike(u8 a)
{
    if (a == 0)
    {
        gPlayerAvatar.running2 = 0;
        return 0;
    }
    else if (a != player_get_direction_upper_nybble() && gPlayerAvatar.running2 != 2)
    {
        gPlayerAvatar.running2 = 1;
        return 1;
    }
    else
    {
        gPlayerAvatar.running2 = 2;
        return 2;
    }
}

void PlayerNotOnBikeNotMoving(u8 a, u16 b)
{
    PlayerFaceDirection(player_get_direction_lower_nybble());
}

void PlayerNotOnBikeTurningInPlace(u8 a, u16 b)
{
    PlayerTurnInPlace(a);
}

void sub_8058D0C(u8 a, u16 b)
{
    u8 r1 = CheckForPlayerAvatarCollision(a);
    
    switch (r1)
    {
    case 6:
        PlayerJumpLedge(a);
        return;
    default:
        if (r1 > 8 || r1 < 5)
            PlayerNotOnBikeCollide(a);
        return;
    case 0:
        if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING)
        {
            sub_80593C4(a);
            return;
        }
        if (!(gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_4) && (b & 2) && FlagGet(SYS_B_DASH)
         && sub_80E5DEC(gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1E) == 0)
        {
            sub_805940C(a);
            gPlayerAvatar.flags |= PLAYER_AVATAR_FLAG_DASH;
        }
        else
        {
            PlayerGoSpeed0(a);
        }
    }
}

static u8 CheckForPlayerAvatarCollision(u8 a)
{
    s16 x, y;
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    x = playerMapObj->coords2.x;
    y = playerMapObj->coords2.y;
    MoveCoords(a, &x, &y);
    return CheckForFieldObjectCollision(playerMapObj, x, y, a, MapGridGetMetatileBehaviorAt(x, y));
}

u8 CheckForFieldObjectCollision(struct MapObject *a, s16 b, s16 c, u8 d, u8 e)
{
    u8 sp0;
    
    sp0 = npc_block_way(a, b, c, d);
    if (sp0 == 3 && sub_8058EF0(b, c, d))
        return 5;
    if (ShouldJumpLedge(b, c, d))
    {
        sav12_xor_increment(0x2B);
        return 6;
    }
    if (sp0 == 4 && sub_8058F6C(b, c, d))
        return 7;
    
    if (sp0 == 0)
    {
        if (CheckForRotatingGatePuzzleCollision(d, b, c))
            return 8;
        check_acro_bike_metatile(b, c, e, &sp0);
    }
    return sp0;
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
    if (FlagGet(SYS_USE_STRENGTH))
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
                 && sub_8056F08(MapGridGetMetatileBehaviorAt(a, b)) == 0)
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
    gPlayerAvatar.bike |= a;
    DoPlayerAvatarTransition();
}

static void DoPlayerAvatarTransition(void)
{
    u8 i;
    u32 flags = gPlayerAvatar.bike;
    
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
                register void (**funcs)(struct MapObject *) asm("r0") = gUnknown_0830FC14;
                funcs[i](&gMapObjects[gPlayerAvatar.mapObjectId]);
            }
#endif
        }
        gPlayerAvatar.bike = 0;
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
    sub_80E5FCC(0, 0);
}

void PlayerAvatarTransition_AcroBike(struct MapObject *a)
{
    sub_805B980(a, GetPlayerAvatarGraphicsIdByStateId(2));
    FieldObjectTurn(a, a->placeholder18);
    SetPlayerAvatarStateMask(4);
    sub_80E5FCC(0, 0);
    sub_80E6084();
}

void PlayerAvatarTransition_Surfing(struct MapObject *a)
{
    u8 unk;
    
    sub_805B980(a, GetPlayerAvatarGraphicsIdByStateId(3));
    FieldObjectTurn(a, a->placeholder18);
    SetPlayerAvatarStateMask(8);
    gUnknown_0202FF84.x = a->coords2.x;
    gUnknown_0202FF84.y = a->coords2.y;
    gUnknown_0202FF84.unk8 = gPlayerAvatar.mapObjectId;
    unk = FieldEffectStart(8);
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
    gPlayerAvatar.running1 = 0;
    if (PlayerIsAnimActive())
    {
        if (!PlayerCheckIfAnimFinishedOrInactive())
        {
            if (!player_is_anim_in_certain_ranges())
                gPlayerAvatar.running1 = 1;
        }
        else
        {
            if (!sub_80592A4())
                gPlayerAvatar.running1 = 2;
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
    if (player_is_anim_in_certain_ranges() && gPlayerAvatar.running2 != 1)
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
    gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_22 = a;
}

u8 player_get_x22(void)
{
    return gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_22;
}

static void sub_8059348(u8 a)
{
    FieldObjectForceSetSpecialAnim(&gMapObjects[gPlayerAvatar.mapObjectId], a);
}

void player_npc_set_state_and_x22_etc(u8 a, u8 b)
{
    if (!PlayerIsAnimActive())
    {
        player_set_x22(b);
        FieldObjectSetSpecialAnim(&gMapObjects[gPlayerAvatar.mapObjectId], a);
    }
}

void PlayerGoSpeed0(u8 a)
{
    player_npc_set_state_and_x22_etc(GetGoSpeed0AnimId(a), 2);
}

void sub_80593C4(u8 a)
{
    player_npc_set_state_and_x22_etc(sub_8060744(a), 2);
}

void npc_use_some_d2s(u8 a)
{
    player_npc_set_state_and_x22_etc(d2s_08064034(a), 2);
}

void sub_80593F4(u8 a)
{
    player_npc_set_state_and_x22_etc(sub_806079C(a), 2);
}

void sub_805940C(u8 a)
{
    player_npc_set_state_and_x22_etc(sub_80607F4(a), 2);
}

void PlayerOnBikeCollide(u8 a)
{
    PlayCollisionSoundIfNotFacingWarp(a);
    player_npc_set_state_and_x22_etc(GetStepInPlaceDelay16AnimId(a), 2);
}

static void PlayerNotOnBikeCollide(u8 a)
{
    PlayCollisionSoundIfNotFacingWarp(a);
    player_npc_set_state_and_x22_etc(GetStepInPlaceDelay32AnimId(a), 2);
}

void PlayerFaceDirection(u8 a)
{
    player_npc_set_state_and_x22_etc(GetFaceDirectionAnimId(a), 1);
}

void PlayerTurnInPlace(u8 a)
{
    player_npc_set_state_and_x22_etc(GetStepInPlaceDelay8AnimId(a), 1);
}

void PlayerJumpLedge(u8 a)
{
    PlaySE(SE_DANSA);
    player_npc_set_state_and_x22_etc(GetJumpLedgeAnimId(a), 8);
}

void sub_80594C0(void)
{
    if (gPlayerAvatar.running1 == 2 || gPlayerAvatar.running1 == 0)
    {
        if (player_should_look_direction_be_enforced_upon_movement())
            sub_8059348(GetFaceDirectionAnimId(gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_18));
    }
}

void sub_8059504(u8 a)
{
    player_npc_set_state_and_x22_etc(sub_80609D8(a), 1);
}

void sub_805951C(u8 a)
{
    player_npc_set_state_and_x22_etc(sub_8060A04(a), 1);
}

void sub_8059534(u8 a)
{
    player_npc_set_state_and_x22_etc(sub_8060A30(a), 1);
}

void sub_805954C(u8 a)
{
    PlaySE(SE_JITE_PYOKO);
    player_npc_set_state_and_x22_etc(sub_8060A5C(a), 1);
}

void sub_8059570(u8 a)
{
    PlaySE(SE_JITE_PYOKO);
    player_npc_set_state_and_x22_etc(sub_8060A88(a), 2);
}

void sub_8059594(u8 a)
{
    PlaySE(SE_JITE_PYOKO);
    player_npc_set_state_and_x22_etc(sub_8060AB4(a), 8);
}

void sub_80595B8(u8 a)
{
    PlaySE(SE_JITE_PYOKO);
    player_npc_set_state_and_x22_etc(sub_8060878(a), 1);
}

void sub_80595DC(u8 a)
{
    PlaySE(SE_WALL_HIT);
    player_npc_set_state_and_x22_etc(sub_8060AE0(a), 2);
}

void sub_8059600(u8 a)
{
    player_npc_set_state_and_x22_etc(sub_8060B0C(a), 2);
}

void sub_8059618(u8 a)
{
    player_npc_set_state_and_x22_etc(sub_8060B38(a), 2);
}

void sub_8059630(u8 a)
{
    player_npc_set_state_and_x22_etc(sub_8060B64(a), 2);
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
            if (is_tile_x69_2_warp_door(MapGridGetMetatileBehaviorAt(x, y)))
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
        sub_80E6084();
        sub_80E6010(0);
    }
}

u8 sub_805983C(u8 a, u8 b)
{
    return gUnknown_0830FC44[a][b];
}

static u8 GetPlayerAvatarGraphicsIdByStateIdAndGender(u8 a, u8 b)
{
    return gUnknown_0830FC54[a][b];
}

u8 GetPlayerAvatarGraphicsIdByStateId(u8 a)
{
    return GetPlayerAvatarGraphicsIdByStateIdAndGender(a, gPlayerAvatar.gender);
}

u8 unref_sub_8059888(u8 a)
{
    switch (a)
    {
    case 0x69:
    case 0x6A:
    case 0x6B:
    case 0x6C:
    case 0x6D:
    case 0x70:
    case 0x8A:
    case 0xC0:
        return FEMALE;
    default:
        return MALE;
    }
}

u8 GetPlayerAvatarGenderByGraphicsId(u8 a)
{
    switch (a)
    {
    case 0x59:
    case 0x5A:
    case 0x5B:
    case 0x5C:
    case 0x5D:
    case 0x70:
    case 0x8A:
    case 0xC0:
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
    if (player_get_direction_upper_nybble() == 2 && TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_SURFING))
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
    //TODO: 0x24 should be the size of gPlayerAvatar
    memset(&gPlayerAvatar, 0, 0x24);
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
    
    gPlayerAvatar.bike |= unk | b;
    DoPlayerAvatarTransition();
}

void InitPlayerAvatar(s16 a, s16 b, u8 c, u8 d)
{
    struct UnknownStruct_FPA s;
    u8 mapObjectId;
    struct MapObject *mapObject;
    
    s.unk0 = 0xFF;
    s.unk1 = GetPlayerAvatarGraphicsIdByStateIdAndGender(0, d);
    s.unk4 = a - 7;
    s.unk6 = b - 7;
    s.unk8 = 0;
    s.unk9 = 11;
    s.unkA_0 = 0;
    s.unkA_4 = 0;
    s.unkC = 0;
    s.unkE = 0;
    s.unk10 = 0;
    s.unk14 = 0;
    mapObjectId = SpawnSpecialFieldObject(&s);
    mapObject = &gMapObjects[mapObjectId];
    mapObject->mapobj_bit_16 = 1;
    mapObject->mapobj_unk_1B = sub_8126B54();
    FieldObjectTurn(mapObject, c);
    ClearPlayerAvatarInfo();
    gPlayerAvatar.running2 = 0;
    gPlayerAvatar.running1 = 0;
    gPlayerAvatar.mapObjectId = mapObjectId;
    gPlayerAvatar.spriteId = mapObject->spriteId;
    gPlayerAvatar.gender = d;
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
    gPlayerAvatar.unk6 = 1;
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
        FieldObjectSetSpecialAnim(b, GetStepInPlaceDelay16AnimId(task->data[2]));
        FieldObjectSetSpecialAnim(c, GetSimpleGoAnimId(task->data[2]));
        gUnknown_0202FF84.x = c->coords2.x;
        gUnknown_0202FF84.y = c->coords2.y;
        gUnknown_0202FF84.unk8 = c->elevation;
        gUnknown_0202FF84.unkC = gSprites[c->spriteId].oam.priority;
        FieldEffectStart(10);
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
        gPlayerAvatar.unk6 = 0;
        ScriptContext2_Disable();
        DestroyTask(FindTaskIdByFunc(sub_8059E2C));
    }
    return 0;
}

/* Some field effect */

static void sub_8059FB4(u8 taskId);

static void sub_8059F94(void)
{
    u8 taskId = CreateTask(sub_8059FB4, 0xFF);
    
    sub_8059FB4(taskId);
}

static void sub_8059FB4(u8 taskId)
{
    while (gUnknown_0830FC94[gTasks[taskId].data[0]](&gTasks[taskId], &gMapObjects[gPlayerAvatar.mapObjectId]))
        ;
}

u8 sub_805A000(struct Task *task, struct MapObject *mapObject)
{
    gPlayerAvatar.unk6 = 1;
    if (FieldObjectClearAnimIfSpecialAnimFinished(mapObject))
    {
        PlaySE(SE_DANSA);
        FieldObjectSetSpecialAnim(mapObject, sub_806084C(mapObject->mapobj_unk_18));
        task->data[1]++;
        if (task->data[1] > 1)
        {
            gPlayerAvatar.unk6 = 0;
            gPlayerAvatar.bike |= 0x20;
            DestroyTask(FindTaskIdByFunc(sub_8059FB4));
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
    gPlayerAvatar.unk6 = 1;
    ScriptContext2_Enable();
    PlaySE(SE_TK_WARPIN);
    return 1;
}

u8 sub_805A100(struct Task *task, struct MapObject *mapObject)
{
    u8 directions[4];
    
    memcpy(directions, gUnknown_0830FCA8, sizeof(directions));
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
    u8 arr[5];
    
    memcpy(arr, gUnknown_0830FCAC, sizeof(arr));
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
        gPlayerAvatar.unk6 = 0;
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
    sav1_reset_battle_music_maybe();
    sub_8053F84();
    gPlayerAvatar.flags &= ~PLAYER_AVATAR_FLAG_SURFING;
    gPlayerAvatar.flags |= PLAYER_AVATAR_FLAG_ON_FOOT;
    gPlayerAvatar.unk6 = 1;
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
    FieldObjectSetSpecialAnim(playerMapObj, sub_80608D0(gTasks[taskId].data[0]));
    gTasks[taskId].func = sub_805A2D0;
}

static void sub_805A2D0(u8 taskId)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    if (FieldObjectClearAnimIfSpecialAnimFinished(playerMapObj))
    {
        sub_805B980(playerMapObj, GetPlayerAvatarGraphicsIdByStateId(0));
        FieldObjectSetSpecialAnim(playerMapObj, GetFaceDirectionAnimId(playerMapObj->mapobj_unk_18));
        gPlayerAvatar.unk6 = 0;
        ScriptContext2_Disable();
        DestroySprite(&gSprites[playerMapObj->mapobj_unk_1A]);
        DestroyTask(taskId);
    }
}

/* Fishing */

static void Task_Fishing(u8 taskId);
static void sub_805A954(void);

void StartFishing(u8 a)
{
    u8 taskId = CreateTask(Task_Fishing, 0xFF);
    
    gTasks[taskId].data[15] = a;
    Task_Fishing(taskId);
}

static void Task_Fishing(u8 taskId)
{
    while (gUnknown_0830FCB4[gTasks[taskId].data[0]](&gTasks[taskId]))
        ;
}

u8 Fishing1(struct Task *task)
{
    ScriptContext2_Enable();
    gPlayerAvatar.unk6 = 1;
    task->data[0]++;
    return 0;
}

u8 Fishing2(struct Task *task)
{
    s16 arr1[3];
    s16 arr2[3];
    struct MapObject *playerMapObj;
    
    memcpy(arr1, gUnknown_0830FCF4, sizeof(arr1));
    memcpy(arr2, gUnknown_0830FCFA, sizeof(arr2));
    task->data[12] = 0;
    task->data[13] = arr1[task->data[15]] + (Random() % arr2[task->data[15]]);
    task->data[14] = gMapObjects[gPlayerAvatar.mapObjectId].graphicsId;
    playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    FieldObjectClearAnimIfSpecialAnimActive(playerMapObj);
    playerMapObj->mapobj_bit_11 = 1;
    sub_8059C3C(playerMapObj->mapobj_unk_18);
    task->data[0]++;
    return 0;
}

u8 Fishing3(struct Task *task)
{
    sub_805A954();
    task->data[1]++;
    if (task->data[1] > 0x3B)
        task->data[0]++;
    return 0;
}

u8 Fishing4(struct Task *task)
{
    u32 randVal;
    
    MenuDisplayMessageBox();
    task->data[0]++;
    task->data[1] = 0;
    task->data[2] = 0;
    randVal = Random();
    randVal %= 10;
    task->data[3] = randVal + 1;
    if (task->data[12] == 0)
        task->data[3] = randVal + 4;
    if (task->data[3] > 9)
        task->data[3] = 10;
    return 1;
}

u8 Fishing5(struct Task *task)
{
    u8 dot[2];
    
    memcpy(dot, gUnknown_0830FD00, sizeof(dot));
    sub_805A954();
    task->data[1]++;
    if (gMain.newKeys & A_BUTTON)
    {
        task->data[0] = 11;
        if (task->data[12] != 0)
            task->data[0] = 12;
        return 1;
    }
    else
    {
        if (task->data[1] > 0x13)
        {
            task->data[1] = 0;
            if (task->data[2] >= task->data[3])
            {
                task->data[0]++;
                if (task->data[12] != 0)
                    task->data[0]++;
                task->data[12]++;
            }
            else
            {
                MenuPrint(dot, task->data[2] + 4, 15);
                task->data[2]++;
            }
        }
        return 0;
    }
}

u8 Fishing6(struct Task *task)
{
    sub_805A954();
    task->data[0]++;
    if (!GetFishingWildMonListHeader() || (Random() & 1))
        task->data[0] = 11;
    else
        StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], sub_805FE08(player_get_direction_lower_nybble()));
    return 1;
}

u8 Fishing7(struct Task *task)
{
    sub_805A954();
    MenuPrint(gOtherText_OhABite, 4, 17);
    task->data[0]++;
    task->data[1] = 0;
    return 0;
}

u8 Fishing8(struct Task *task)
{
    s16 arr[3];
    
    memcpy(arr, gUnknown_0830FD02, sizeof(arr));
    sub_805A954();
    task->data[1]++;
    if (task->data[1] >= arr[task->data[15]])
        task->data[0] = 12;
    else if (gMain.newKeys & A_BUTTON)
        task->data[0]++;
    return 0;
}

u8 Fishing9(struct Task *task)
{
    s16 arr[3][2];
    
    memcpy(arr, gUnknown_0830FD08, sizeof(arr));
    sub_805A954();
    task->data[0]++;
    if (task->data[12] < task->data[13])
    {
        task->data[0] = 3;
    }
    else if (task->data[12] < 2)
    {
        s16 randVal = Random() % 100;
        
        if (arr[task->data[15]][task->data[12]] > randVal)
            task->data[0] = 3;
    }
    return 0;
}

u8 Fishing10(struct Task *task)
{
    sub_805A954();
    sub_8072044(gOtherText_PokeOnHook);
    MenuDisplayMessageBox();
    task->data[0]++;
    task->data[1] = 0;
    return 0;
}

u8 Fishing11(struct Task *task)
{
    if (task->data[1] == 0)
    {
        sub_805A954();
        if (task->data[1] == 0)
        {
            if (MenuUpdateWindowText())
            {
                struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
                
                sub_805B980(playerMapObj, task->data[14]);
                FieldObjectTurn(playerMapObj, playerMapObj->placeholder18);
                if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING)
                    sub_8127F28(gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1A, 0, 0);
                gSprites[gPlayerAvatar.spriteId].pos2.x = 0;
                gSprites[gPlayerAvatar.spriteId].pos2.y = 0;
                MenuZeroFillScreen();
                task->data[1]++;
                return 0;
            }
            else
            {
                if (task->data[1] == 0)
                    return 0;
            }
        }
    }
    gPlayerAvatar.unk6 = 0;
    ScriptContext2_Disable();
    FishingWildEncounter(task->data[15]);
    sub_80BE97C(1);
    DestroyTask(FindTaskIdByFunc(Task_Fishing));
    return 0;
}

u8 Fishing12(struct Task *task)
{
    sub_805A954();
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], sub_805FDF8(player_get_direction_lower_nybble()));
    sub_8072044(gOtherText_NotEvenANibble);
    task->data[0] = 13;
    return 1;
}

u8 Fishing13(struct Task *task)
{
    sub_805A954();
    StartSpriteAnim(&gSprites[gPlayerAvatar.spriteId], sub_805FDF8(player_get_direction_lower_nybble()));
    sub_8072044(gOtherText_ItGotAway);
    task->data[0]++;
    return 1;
}

u8 Fishing14(struct Task *task)
{
    sub_805A954();
    MenuDisplayMessageBox();
    task->data[0]++;
    return 0;
}

u8 Fishing15(struct Task *task)
{
    sub_805A954();
    if (gSprites[gPlayerAvatar.spriteId].animEnded)
    {
        struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
        
        sub_805B980(playerMapObj, task->data[14]);
        FieldObjectTurn(playerMapObj, playerMapObj->placeholder18);
        if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_SURFING)
            sub_8127F28(gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1A, 0, 0);
        gSprites[gPlayerAvatar.spriteId].pos2.x = 0;
        gSprites[gPlayerAvatar.spriteId].pos2.y = 0;
        task->data[0]++;
    }
    return 0;
}

u8 Fishing16(struct Task *task)
{
    if (MenuUpdateWindowText())
    {
        gPlayerAvatar.unk6 = 0;
        ScriptContext2_Disable();
        sub_806451C();
        MenuZeroFillScreen();
        sub_80BE97C(0);
        DestroyTask(FindTaskIdByFunc(Task_Fishing));
    }
    return 0;
}

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
