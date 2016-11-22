#include "global.h"
#include "fieldmap.h"
#include "flag.h"
#include "sprite.h"

extern bool8 FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive(struct MapObject *);
extern u8 FieldObjectClearAnimIfSpecialAnimFinished(struct MapObject *);
extern u8 FieldObjectGetSpecialAnim(struct MapObject *);
extern void FieldObjectClearAnim(struct MapObject *);
extern u8 sub_80E5DEC(u8);
extern s16 sub_80E6034(void);
extern u8 player_get_direction_upper_nybble(void);
extern u8 player_get_direction_lower_nybble(void);
extern u8 MapGridGetMetatileBehaviorAt(s32, s32);

extern bool8 (*gUnknown_0830FB58[])(u8);
extern u8 (*gUnknown_0830FBA0[])(void);
extern void (*gUnknown_0830FBEC[])(u8, u16);

u32 sub_80587D8(void);
bool8 sub_8058854(struct MapObject *a, u8 b);
void npc_clear_strange_bits(struct MapObject *a);
void MovePlayerAvatarUsingKeypadInput(u8 a, u16 b, u16 c);
void PlayerAllowForcedMovementIfMovingSameDirection(void);
u8 TryDoMetatileBehaviorForcedMovment(void);
u8 GetForcedMovementByMetatileBehavior(void);
u8 CheckForPlayerAvatarCollision(u8);
void MovePlayerNotOnBike(u8 a, u16 b);
u8 CheckMovementInputNotOnBike(u8);
void sub_80593C4(u8);
void PlayerGoSpeed0(u8);
void npc_use_some_d2s(u8);

void sub_80587B4(struct Sprite *sprite)
{
    meta_step(&gMapObjects[sprite->data0], sprite, sub_80587D8);
}

u32 sub_80587D8(void)
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
            //Misspelled
            if (TryDoMetatileBehaviorForcedMovment() == 0)
            {
                MovePlayerAvatarUsingKeypadInput(a, b, c);
                PlayerAllowForcedMovementIfMovingSameDirection();
            }
        }
    }
}

bool8 sub_8058854(struct MapObject *a, u8 b)
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

void npc_clear_strange_bits(struct MapObject *a)
{
    a->mapobj_bit_12 = 0;
    a->mapobj_bit_10 = 0;
    a->mapobj_bit_9 = 0;
    gPlayerAvatar.flags &= ~PLAYER_AVATAR_FLAG_7;
}

void MovePlayerAvatarUsingKeypadInput(u8 a, u16 b, u16 c)
{
    if ((gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_1) || (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_2))
        MovePlayerOnBike(a, b);
    else
        MovePlayerNotOnBike(a, c);
}

void PlayerAllowForcedMovementIfMovingSameDirection(void)
{
    if (gPlayerAvatar.running2 == 2)
        gPlayerAvatar.flags &= ~PLAYER_AVATAR_FLAG_5;
}

u8 TryDoMetatileBehaviorForcedMovment(void)
{
    return gUnknown_0830FBA0[GetForcedMovementByMetatileBehavior()]();
}

u8 GetForcedMovementByMetatileBehavior(void)
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

u8 DoForcedMovement(u8 a, void (*b)(u8))
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

u8 DoForcedMovementInCurrentDirection(void (*a)(u8))
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

u8 ForcedMovement_Slide(u8 a, void (*b)(u8))
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

sub_8058C04()
{
    sub_8059F94();
    return 1;
}

sub_8058C10()
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

void MovePlayerNotOnBike(u8 a, u16 b)
{
    gUnknown_0830FBEC[CheckMovementInputNotOnBike(a)](a, b);
}

u8 CheckMovementInputNotOnBike(u8 a)
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
        if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_3)
        {
            sub_80593C4(a);
            return;
        }
        if (!(gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_4) && (b & 2) && FlagGet(0x860)
         && sub_80E5DEC(gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1E) == 0)
        {
            sub_805940C(a);
            gPlayerAvatar.flags |= PLAYER_AVATAR_FLAG_7;
        }
        else
        {
            PlayerGoSpeed0(a);
        }
    }
}

u8 CheckForPlayerAvatarCollision(u8 a)
{
    s16 x, y;
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    
    x = playerMapObj->coords2.x;
    y = playerMapObj->coords2.y;
    MoveCoords(a, &x, &y);
    return CheckForFieldObjectCollision(playerMapObj, x, y, a, MapGridGetMetatileBehaviorAt(x, y));
}

/*
u8 CheckForFieldObjectCollision(struct MapObject *a, )
*/