#include "global.h"
#include "global.fieldmap.h"
#include "flags.h"
#include "asm.h"
#include "field_map_obj.h"
#include "field_player_avatar.h"
#include "metatile_behavior.h"
#include "songs.h"
#include "sound.h"
#include "rom4.h"

extern u8 sub_80608A4(u8);

struct UnknownStruct1
{
    u32 unk0;
    u32 unk4;
    u32 unk8;
    u32 unkC;
    const u8 *unk10;
    const u8 *unk14;
    u32 unk18;
};

extern u8 gUnknown_02039250;
extern u8 gUnknown_02039251;
extern u8 gUnknown_0202E854;
extern u8 gUnknown_0202E86C[];
extern u8 gUnknown_0202E874[];

static void MovePlayerOnMachBike(u8, u16, u16);
static u8 GetMachBikeTransition(u8 *);
static void MachBikeTransition_FaceDirection(u8);
static void MachBikeTransition_80E517C(u8);
static void MachBikeTransition_80E51C4(u8);
static void MachBikeTransition_80E5270(u8);
static void MovePlayerOnAcroBike(u8, u16, u16);
static u8 CheckMovementInputAcroBike(u8 *, u16, u16);
static u8 AcroBikeHandleInputNormal(u8 *, u16, u16);
static u8 AcroBikeHandleInputTurning(u8 *, u16, u16);
static u8 AcroBikeHandleInputWheelieStanding(u8 *, u16, u16);
static u8 AcroBikeHandleInputBunnyHop(u8 *, u16, u16);
static u8 AcroBikeHandleInputWheelieMoving(u8 *, u16, u16);
static u8 AcroBikeHandleInputState5(u8 *, u16, u16);
static u8 AcroBikeHandleInputState6(u8 *, u16, u16);
static void AcroBikeTransition_FaceDirection(u8);
static void AcroBikeTransition_80E5708(u8);
static void AcroBikeTransition_80E5744(u8);
static void AcroBikeTransition_NormalToWheelie(u8);
static void AcroBikeTransition_80E57F8(u8);
static void AcroBikeTransition_80E5834(u8);
static void AcroBikeTransition_80E5870(u8);
static void AcroBikeTransition_80E58AC(u8);
static void AcroBikeTransition_80E5920(u8);
static void AcroBikeTransition_80E5990(u8);
static void AcroBikeTransition_80E59A0(u8);
static void AcroBikeTransition_80E5A30(u8);
static void AcroBikeTransition_80E5AC0(u8);
static void sub_80E5B60(u16, u16);
static u8 sub_80E5C2C(void);
static void sub_80E5C7C(u8);
static void sub_80E5CB8(u8);
static u8 sub_80E5CF4(u16);
static u8 get_some_collision(u8);
static u8 sub_80E5DA0(struct MapObject *, s16, s16, u8, u8);
static bool8 IsRunningDisallowedByMetatile(u8);
static void sub_80E5E4C();
static u8 CanBikeFaceDirOnMetatile(u8, u8);
static bool8 sub_80E5EC0(u8, u8);
static void sub_80E6024(void);

static void (*const sMachBikeTransitions[])(u8) =
{
    MachBikeTransition_FaceDirection,
    MachBikeTransition_80E517C,
    MachBikeTransition_80E51C4,
    MachBikeTransition_80E5270,
};

static void (*const gUnknown_083DB5A4[])(u8) =
{
    PlayerGoSpeed0,
    sub_80593C4,
    sub_80593F4,
};

// Player speeds
enum
{
    SPEED_STANDING,
    SPEED_NORMAL,
    SPEED_FAST,
    SPEED_FASTER,
    SPEED_FASTEST,
};

//Acro bike states
enum
{
    ACRO_STATE_NORMAL,
    ACRO_STATE_TURNING,
    ACRO_STATE_WHEELIE_STANDING,
    ACRO_STATE_BUNNY_HOP,
    ACRO_STATE_WHEELIE_MOVING,
    ACRO_STATE_5,
    ACRO_STATE_6,
};

//Acro bike transitions
enum
{
    ACRO_TRANS_FACE_DIRECTION,
    ACRO_TRANS_NORMAL_TO_WHEELIE = 3,
    ACRO_TRANS_WHEELIE_TO_NORMAL,
};

static void (*const sAcroBikeTransitions[])(u8) =
{
    AcroBikeTransition_FaceDirection,
    AcroBikeTransition_80E5708,
    AcroBikeTransition_80E5744,
    AcroBikeTransition_NormalToWheelie,
    AcroBikeTransition_80E57F8,
    AcroBikeTransition_80E5834,
    AcroBikeTransition_80E5870,
    AcroBikeTransition_80E58AC,
    AcroBikeTransition_80E5920,
    AcroBikeTransition_80E5990,
    AcroBikeTransition_80E59A0,
    AcroBikeTransition_80E5A30,
    AcroBikeTransition_80E5AC0,
};

static u8 (*const sAcroBikeInputHandlers[])(u8 *, u16, u16) =
{
    AcroBikeHandleInputNormal,
    AcroBikeHandleInputTurning,
    AcroBikeHandleInputWheelieStanding,
    AcroBikeHandleInputBunnyHop,
    AcroBikeHandleInputWheelieMoving,
    AcroBikeHandleInputState5,
    AcroBikeHandleInputState6,
};

const u16 gMachBikeSpeeds[] = {SPEED_NORMAL, SPEED_FAST, SPEED_FASTEST};
static const u8 Unknown_3DB606[] = {4, 0};

static const struct UnknownStruct1 gUnknown_083DB608[] =
{
    {1, 2, 15, 15, Unknown_3DB606, Unknown_3DB606, 1},
    {2, 2, 15, 15, Unknown_3DB606, Unknown_3DB606, 2},
    {3, 2, 15, 15, Unknown_3DB606, Unknown_3DB606, 3},
    {4, 2, 15, 15, Unknown_3DB606, Unknown_3DB606, 4},
};

void MovePlayerOnBike(u8 direction, u16 newKeys, u16 heldKeys)
{
    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_MACH_BIKE)
        MovePlayerOnMachBike(direction, newKeys, heldKeys);
    else
        MovePlayerOnAcroBike(direction, newKeys, heldKeys);
}

static void MovePlayerOnMachBike(u8 direction, u16 newKeys, u16 heldKeys)
{
    sMachBikeTransitions[GetMachBikeTransition(&direction)](direction);
}

static u8 GetMachBikeTransition(u8 *ptr)
{
    u8 direction = player_get_direction_upper_nybble();

    if (*ptr == 0)
    {
        *ptr = direction;
        if (gPlayerAvatar.unkB == 0)
        {
            gPlayerAvatar.running2 = 0;
            return 0;
        }
        gPlayerAvatar.running2 = 2;
        return 3;
    }

    if (*ptr != direction && gPlayerAvatar.running2 != 2)
    {
        if (gPlayerAvatar.unkB != 0)
        {
            *ptr = direction;
            gPlayerAvatar.running2 = 2;
            return 3;
        }
        gPlayerAvatar.running2 = 1;
        return 1;
    }
    else
    {
        gPlayerAvatar.running2 = 2;
        return 2;
    }
}

static void MachBikeTransition_FaceDirection(u8 direction)
{
    PlayerFaceDirection(direction);
    sub_80E6024();
}

static void MachBikeTransition_80E517C(u8 direction)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (CanBikeFaceDirOnMetatile(direction, playerMapObj->mapobj_unk_1E))
    {
        PlayerTurnInPlace(direction);
        sub_80E6024();
    }
    else
    {
        MachBikeTransition_FaceDirection(playerMapObj->mapobj_unk_18);
    }
}

static void MachBikeTransition_80E51C4(u8 direction)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    u8 collision;

    if (CanBikeFaceDirOnMetatile(direction, playerMapObj->mapobj_unk_1E) == 0)
    {
        if (gPlayerAvatar.unkB)
            MachBikeTransition_80E5270(playerMapObj->placeholder18);
        else
            MachBikeTransition_FaceDirection(playerMapObj->placeholder18);
    }
    else
    {
        collision = get_some_collision(direction);
        if (collision > 0 && collision < 12)
        {
            if (collision == COLLISION_LEDGE_JUMP)
            {
                PlayerJumpLedge(direction);
            }
            else
            {
                sub_80E6024();
                if (collision < 5 || collision > 8)
                    PlayerOnBikeCollide(direction);
            }
        }
        else
        {
            gUnknown_083DB5A4[gPlayerAvatar.bikeFrameCounter](direction);
            gPlayerAvatar.unkB = gPlayerAvatar.bikeFrameCounter + (gPlayerAvatar.bikeFrameCounter >> 1); // same as dividing by 2, but compiler is insistent on >> 1
            if (gPlayerAvatar.bikeFrameCounter < 2) // do not go faster than the last element in the mach bike array
                gPlayerAvatar.bikeFrameCounter++;
        }
    }
}

static void MachBikeTransition_80E5270(u8 var)
{
    u8 collision;

    if (gPlayerAvatar.unkB != 0)
        gPlayerAvatar.bikeFrameCounter = --gPlayerAvatar.unkB;

    collision = get_some_collision(var);

    if (collision > 0 && collision < 12)
    {
        if (collision == COLLISION_LEDGE_JUMP)
        {
            PlayerJumpLedge(var);
        }
        else
        {
            sub_80E6024();
            if (collision < 5 || collision > 8)
                PlayerOnBikeCollide(var);
        }
    }
    else
    {
        gUnknown_083DB5A4[gPlayerAvatar.bikeFrameCounter](var);
    }
}

static void MovePlayerOnAcroBike(u8 newDirection, u16 newKeys, u16 heldKeys)
{
    sAcroBikeTransitions[CheckMovementInputAcroBike(&newDirection, newKeys, heldKeys)](newDirection);
}

static u8 CheckMovementInputAcroBike(u8 *newDirection, u16 newKeys, u16 heldKeys)
{
    return sAcroBikeInputHandlers[gPlayerAvatar.acroBikeState](newDirection, newKeys, heldKeys);
}

static u8 AcroBikeHandleInputNormal(u8 *newDirection, u16 newKeys, u16 heldKeys)
{
    u8 direction = player_get_direction_upper_nybble();

    gPlayerAvatar.bikeFrameCounter = 0;
    if (*newDirection == DIR_NONE)
    {
        if (newKeys & B_BUTTON)
        {
            //We're standing still with the B button held.
            //Do a wheelie.
            *newDirection = direction;
            gPlayerAvatar.running2 = 0;
            gPlayerAvatar.acroBikeState = ACRO_STATE_WHEELIE_STANDING;
            return ACRO_TRANS_NORMAL_TO_WHEELIE;
        }
        else
        {
            *newDirection = direction;
            gPlayerAvatar.running2 = 0;
            return ACRO_TRANS_FACE_DIRECTION;
        }
    }
    if (*newDirection == direction && (heldKeys & B_BUTTON) && gPlayerAvatar.unkB == 0)
    {
        gPlayerAvatar.unkB++;
        gPlayerAvatar.acroBikeState = ACRO_STATE_WHEELIE_MOVING;
        return 11;
    }
    if (*newDirection != direction && gPlayerAvatar.running2 != 2)
    {
        gPlayerAvatar.acroBikeState = ACRO_STATE_TURNING;
        gPlayerAvatar.unk9 = *newDirection;
        gPlayerAvatar.running2 = 0;
        return CheckMovementInputAcroBike(newDirection, newKeys, heldKeys);
    }
    gPlayerAvatar.running2 = 2;
    return 2;
}

static u8 AcroBikeHandleInputTurning(u8 *newDirection, u16 newKeys, u16 heldKeys)
{
    u8 direction;

    *newDirection = gPlayerAvatar.unk9;
    gPlayerAvatar.bikeFrameCounter++;
    
    //Wait 6 frames before actually changing direction
    if (gPlayerAvatar.bikeFrameCounter > 6)
    {
        gPlayerAvatar.running2 = 1;
        gPlayerAvatar.acroBikeState = ACRO_STATE_NORMAL;
        sub_80E6024();
        return 1;
    }
    direction = player_get_direction_upper_nybble();
    if (*newDirection == sub_80E5C2C())
    {
        sub_80E6024();
        gPlayerAvatar.unkB = 1;
        if (*newDirection == GetOppositeDirection(direction))
        {
            gPlayerAvatar.acroBikeState = ACRO_STATE_6;
            return 9;
        }
        else
        {
            gPlayerAvatar.running2 = 2;
            gPlayerAvatar.acroBikeState = ACRO_STATE_5;
            return 8;
        }
    }
    *newDirection = direction;
    return 0;
}

static u8 AcroBikeHandleInputWheelieStanding(u8 *ptr, u16 newKeys, u16 heldKeys)
{
    u8 direction;
    struct MapObject *playerMapObj;

    direction = player_get_direction_upper_nybble();
    playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    gPlayerAvatar.running2 = 0;
    
    if (heldKeys & B_BUTTON)
        gPlayerAvatar.bikeFrameCounter++;
    else
    {
        //B button was released.
        gPlayerAvatar.bikeFrameCounter = 0;
        if (!MetatileBehavior_IsBumpySlope(playerMapObj->mapobj_unk_1E))
        {
            //Go back to normal on flat ground
            *ptr = direction;
            gPlayerAvatar.acroBikeState = ACRO_STATE_NORMAL;
            sub_80E6024();
            return 4;
        }
    }
    if (gPlayerAvatar.bikeFrameCounter >= 40)
    {
        *ptr = direction;
        gPlayerAvatar.acroBikeState = ACRO_STATE_BUNNY_HOP;
        sub_80E6024();
        return 6;
    }
    if (*ptr == direction)
    {
        gPlayerAvatar.running2 = 2;
        gPlayerAvatar.acroBikeState = ACRO_STATE_WHEELIE_MOVING;
        sub_80E6024();
        return 10;
    }
    if (*ptr == 0)
    {
        *ptr = direction;
        return 5;
    }
    gPlayerAvatar.running2 = 1;
    return 5;
}

static u8 AcroBikeHandleInputBunnyHop(u8 *ptr, u16 newKeys, u16 heldKeys)
{
    u8 direction;
    struct MapObject *playerMapObj;

    direction = player_get_direction_upper_nybble();
    playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (!(heldKeys & B_BUTTON))
    {
        //B button was released
        sub_80E6024();
        if (MetatileBehavior_IsBumpySlope(playerMapObj->mapobj_unk_1E))
        {
            //Do a standing wheelie on a bumpy slope
            gPlayerAvatar.acroBikeState = ACRO_STATE_WHEELIE_STANDING;
            return CheckMovementInputAcroBike(ptr, newKeys, heldKeys);
        }
        else
        {
            //Go back to normal on flat ground
            *ptr = direction;
            gPlayerAvatar.running2 = 0;
            gPlayerAvatar.acroBikeState = ACRO_STATE_NORMAL;
            return 4;
        }
    }
    
    //B Button is still held
    
    if (*ptr == DIR_NONE)
    {
        *ptr = direction;
        gPlayerAvatar.running2 = 0;
        return 6;
    }
    if (*ptr != direction && gPlayerAvatar.running2 != 2)
    {
        gPlayerAvatar.running2 = 1;
        return 6;
    }
    gPlayerAvatar.running2 = 2;
    return 7;
}

static u8 AcroBikeHandleInputWheelieMoving(u8 *ptr, u16 newKeys, u16 heldKeys)
{
    u8 direction;
    struct MapObject *playerMapObj;

    direction = player_get_direction_lower_nybble();
    playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    if (!(heldKeys & B_BUTTON))
    {
        sub_80E6024();
        if (!MetatileBehavior_IsBumpySlope(playerMapObj->mapobj_unk_1E))
        {
            gPlayerAvatar.acroBikeState = ACRO_STATE_NORMAL;
            if (*ptr == 0)
            {
                *ptr = direction;
                gPlayerAvatar.running2 = 0;
                return 4;
            }
            if (*ptr != direction && gPlayerAvatar.running2 != 2)
            {
                gPlayerAvatar.running2 = 0;
                return 4;
            }
            gPlayerAvatar.running2 = 2;
            return 12;
        }
        gPlayerAvatar.acroBikeState = ACRO_STATE_WHEELIE_STANDING;
        return CheckMovementInputAcroBike(ptr, newKeys, heldKeys);
    }
    if (*ptr == 0)
    {
        *ptr = direction;
        gPlayerAvatar.acroBikeState = ACRO_STATE_WHEELIE_STANDING;
        gPlayerAvatar.running2 = 0;
        sub_80E6024();
        return 5;
    }
    if (direction != *ptr && gPlayerAvatar.running2 != 2)
    {
        gPlayerAvatar.running2 = 0;
        return 5;
    }
    gPlayerAvatar.running2 = 2;
    return 10;
}

static u8 AcroBikeHandleInputState5(u8 *ptr, u16 newKeys, u16 heldKeys)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    playerMapObj->mapobj_bit_9 = 0;
    FieldObjectSetDirection(playerMapObj, playerMapObj->mapobj_unk_18);
    gPlayerAvatar.acroBikeState = ACRO_STATE_NORMAL;
    return CheckMovementInputAcroBike(ptr, newKeys, heldKeys);
}

static u8 AcroBikeHandleInputState6(u8 *ptr, u16 newKeys, u16 heldKeys)
{
    gPlayerAvatar.acroBikeState = ACRO_STATE_NORMAL;
    return CheckMovementInputAcroBike(ptr, newKeys, heldKeys);
}

static void AcroBikeTransition_FaceDirection(u8 direction)
{
    PlayerFaceDirection(direction);
}

static void AcroBikeTransition_80E5708(u8 direction)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (CanBikeFaceDirOnMetatile(direction, playerMapObj->mapobj_unk_1E) == 0)
        direction = playerMapObj->placeholder18;
    PlayerFaceDirection(direction);
}

static void AcroBikeTransition_80E5744(u8 direction)
{
    u8 collision;
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (CanBikeFaceDirOnMetatile(direction, playerMapObj->mapobj_unk_1E) == 0)
    {
        AcroBikeTransition_FaceDirection(playerMapObj->placeholder18);
        return;
    }
    collision = get_some_collision(direction);
    if (collision > 0 && collision < 12)
    {
        if (collision == COLLISION_LEDGE_JUMP)
            PlayerJumpLedge(direction);
        else if (collision < 5 || collision > 8)
            PlayerOnBikeCollide(direction);
    }
    else
    {
        npc_use_some_d2s(direction);
    }
}

static void AcroBikeTransition_NormalToWheelie(u8 direction)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (CanBikeFaceDirOnMetatile(direction, playerMapObj->mapobj_unk_1E) == 0)
        direction = playerMapObj->placeholder18;
    PlayerStartWheelie(direction);
}

static void AcroBikeTransition_80E57F8(u8 direction)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (CanBikeFaceDirOnMetatile(direction, playerMapObj->mapobj_unk_1E) == 0)
        direction = playerMapObj->placeholder18;
    sub_8059534(direction);
}

static void AcroBikeTransition_80E5834(u8 direction)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (CanBikeFaceDirOnMetatile(direction, playerMapObj->mapobj_unk_1E) == 0)
        direction = playerMapObj->placeholder18;
    sub_8059504(direction);
}

static void AcroBikeTransition_80E5870(u8 direction)
{
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (CanBikeFaceDirOnMetatile(direction, playerMapObj->mapobj_unk_1E) == 0)
        direction = playerMapObj->placeholder18;
    sub_805954C(direction);
}

static void AcroBikeTransition_80E58AC(u8 direction)
{
    u8 var;
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (CanBikeFaceDirOnMetatile(direction, playerMapObj->mapobj_unk_1E) == 0)
    {
        AcroBikeTransition_80E5870(playerMapObj->placeholder18);
        return;
    }
    var = get_some_collision(direction);
    //TODO: Try to get rid of this goto
    if (var == 0 || var == 9)
    {
        goto derp;
    }
    else if (var == 6)
    {
        sub_8059594(direction);
    }
    else if (var < 5 || var > 8)
    {
        if (var <= 11)
        {
            AcroBikeTransition_80E5870(direction);
        }
        else
        {
          derp:
            sub_8059570(direction);
        }
    }
}

static void AcroBikeTransition_80E5920(u8 direction)
{
    u8 var;
    struct MapObject *playerMapObj;

    var = get_some_collision(direction);
    if (var != 0)
    {
        if (var == 7)
            return;
        if (var < 10)
        {
            AcroBikeTransition_80E5708(direction);
            return;
        }
        if (sub_80E5EC0(var, direction) == 0)
        {
            AcroBikeTransition_80E5708(direction);
            return;
        }
    }
    playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];
    PlaySE(SE_JITE_PYOKO);
    playerMapObj->mapobj_bit_9 = 1;
    PlayerSetAnimId(sub_80608A4(direction), 2);
}

static void AcroBikeTransition_80E5990(u8 direction)
{
    sub_80595B8(direction);
}

static void AcroBikeTransition_80E59A0(u8 direction)
{
    u8 var;
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (CanBikeFaceDirOnMetatile(direction, playerMapObj->mapobj_unk_1E) == 0)
    {
        sub_8059504(playerMapObj->placeholder18);
        return;
    }
    var = get_some_collision(direction);
    if (var > 0 && var < 12)
    {
        if (var == 6)
        {
            sub_8059594(direction);
        }
        else if (var == 9)
        {
            sub_8059504(direction);
        }
        else if (var <= 4)
        {
            if (MetatileBehavior_IsBumpySlope(playerMapObj->mapobj_unk_1E))
                sub_8059504(direction);
            else
                sub_80595DC(direction);  //hit wall?
        }
        return;
    }
    sub_8059618(direction);
    gPlayerAvatar.running2 = 2;
}

static void AcroBikeTransition_80E5A30(u8 direction)
{
    u8 var;
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (CanBikeFaceDirOnMetatile(direction, playerMapObj->mapobj_unk_1E) == 0)
    {
        PlayerStartWheelie(playerMapObj->placeholder18);
        return;
    }
    var = get_some_collision(direction);
    if (var > 0 && var < 12)
    {
        if (var == 6)
        {
            sub_8059594(direction);
        }
        else if (var == 9)
        {
            sub_8059504(direction);
        }
        else if (var <= 4)
        {
            if (MetatileBehavior_IsBumpySlope(playerMapObj->mapobj_unk_1E))
                sub_8059504(direction);
            else
                sub_80595DC(direction);  //hit wall?
        }
        return;
    }
    sub_8059600(direction);
    gPlayerAvatar.running2 = 2;
}

static void AcroBikeTransition_80E5AC0(u8 direction)
{
    u8 var;
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    if (CanBikeFaceDirOnMetatile(direction, playerMapObj->mapobj_unk_1E) == 0)
    {
        sub_8059534(playerMapObj->placeholder18);
        return;
    }
    var = get_some_collision(direction);
    if (var > 0 && var < 12)
    {
        if (var == 6)
            PlayerJumpLedge(direction);
        else if (var < 5 || var > 8)
            sub_8059534(direction);
        return;
    }
    sub_8059630(direction);
}

void sub_80E5B38(u16 a, u16 b)
{
    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_ACRO_BIKE)
        sub_80E5B60(a, b);
}

static void sub_80E5B60(u16 unused, u16 b)
{
    u8 var;

    var = sub_80E5CF4(b);
    if (var == (gPlayerAvatar.unkC & 0xF))
    {
        if (gPlayerAvatar.unk14[0] < 0xFF)
            gPlayerAvatar.unk14[0]++;
    }
    else
    {
        sub_80E5C7C(var);
        gPlayerAvatar.unkB = 0;
    }

    var = b & 0xF;
    if (var == (gPlayerAvatar.unk10 & 0xF))
    {
        if (gPlayerAvatar.unk1C[0] < 0xFF)
            gPlayerAvatar.unk1C[0]++;
    }
    else
    {
        sub_80E5CB8(var);
        gPlayerAvatar.unkB = 0;
    }
}

static bool8 sub_80E5BC8(const u8 *a, const u8 *b)
{
    u8 i;

    for (i = 0; a[i] != 0; i++)
    {
        if (gUnknown_0202E86C[i] > a[i])
            return FALSE;
    }
    for (i = 0; b[i] != 0; i++)
    {
        if (gUnknown_0202E874[i] > b[i])
            return FALSE;
    }
    return TRUE;
}

static u8 sub_80E5C2C(void)
{
    u32 i;

    for (i = 0; i < 4; i++)
    {
        const struct UnknownStruct1 *s = &gUnknown_083DB608[i];
        u32 r1 = gPlayerAvatar.unkC;
        u32 r2 = gPlayerAvatar.unk10;

        r1 &= s->unk8;
        r2 &= s->unkC;
        if (r1 == s->unk0 && r2 == s->unk4 && sub_80E5BC8(s->unk10, s->unk14))
            return s->unk18;
    }
    return 0;
}

static void sub_80E5C7C(u8 a)
{
    u8 i;

    gPlayerAvatar.unkC = (gPlayerAvatar.unkC << 4) | (a & 0xF);

    for (i = 7; i != 0; i--)
        gPlayerAvatar.unk14[i] = gPlayerAvatar.unk14[i - 1];
    gPlayerAvatar.unk14[0] = 1;
}

static void sub_80E5CB8(u8 a)
{
    u8 i;

    gPlayerAvatar.unk10 = (gPlayerAvatar.unk10 << 4) | (a & 0xF);

    for (i = 7; i != 0; i--)
        gPlayerAvatar.unk1C[i] = gPlayerAvatar.unk1C[i - 1];
    gPlayerAvatar.unk1C[0] = 1;
}

static u8 sub_80E5CF4(u16 a)
{
    if (a & 0x40)
        return 2;
    if (a & 0x80)
        return 1;
    if (a & 0x20)
        return 3;
    if (a & 0x10)
        return 4;
    return 0;
}

static u8 get_some_collision(u8 direction)
{
    s16 x;
    s16 y;
    u8 metatitleBehavior;
    struct MapObject *playerMapObj = &gMapObjects[gPlayerAvatar.mapObjectId];

    x = playerMapObj->coords2.x;
    y = playerMapObj->coords2.y;
    MoveCoords(direction, &x, &y);
    metatitleBehavior = MapGridGetMetatileBehaviorAt(x, y);
    return sub_80E5DA0(playerMapObj, x, y, direction, metatitleBehavior);
}

static u8 sub_80E5DA0(struct MapObject *mapObject, s16 x, s16 y, u8 direction, u8 metatitleBehavior)
{
    u8 collision = CheckForFieldObjectCollision(mapObject, x, y, direction, metatitleBehavior);

    if (collision > 4)
        return collision;

    if (collision == 0 && IsRunningDisallowedByMetatile(metatitleBehavior))
        collision = 2;

    if (collision)
        sub_80E5E4C();

    return collision;
}

bool8 IsRunningDisallowed(u8 tile)
{
    if (IsRunningDisallowedByMetatile(tile) != FALSE || gMapHeader.mapType == MAP_TYPE_INDOOR)
        return TRUE;
    else
        return FALSE;
}

static bool8 IsRunningDisallowedByMetatile(u8 tile)
{
    if (MetatileBehavior_IsRunningDisallowed(tile))
        return TRUE;
    if (MetatileBehavior_IsFortreeBridge(tile) && (PlayerGetZCoord() & 1) == 0)
        return TRUE;
    return FALSE;
}

static void sub_80E5E4C(void)
{
    if (gUnknown_02039250 != 0 && gUnknown_02039251 < 100)
        gUnknown_02039251++;
}

static bool8 CanBikeFaceDirOnMetatile(u8 direction, u8 tile)
{
    if (direction == DIR_EAST || direction == DIR_WEST)
    {
        //Bike cannot face east or west on a vertical rail
        if (MetatileBehavior_IsIsolatedVerticalRail(tile)
         || MetatileBehavior_IsVerticalRail(tile))
            return FALSE;
    }
    else
    {
        //Bike cannot face north or south on a horizontal rail
        if (MetatileBehavior_IsIsolatedHorizontalRail(tile)
         || MetatileBehavior_IsHorizontalRail(tile))
            return FALSE;
    }
    return TRUE;
}

static bool8 sub_80E5EC0(u8 var1, u8 direction)
{
    if (direction == DIR_NORTH || direction == DIR_SOUTH)
    {
        if (var1 == 10 || var1 == 12)
            return FALSE;
    }
    else if (var1 == 11 || var1 == 13)
    {
        return FALSE;
    }

    return TRUE;
}

bool8 IsBikingDisallowedByPlayer(void)
{
    s16 x, y;
    u8 tileBehavior;

    if (!(gPlayerAvatar.flags & (PLAYER_AVATAR_FLAG_SURFING | PLAYER_AVATAR_FLAG_4)))
    {
        PlayerGetDestCoords(&x, &y);
        tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
        if (!IsRunningDisallowedByMetatile(tileBehavior))
            return FALSE;
    }
    return TRUE;
}

bool8 player_should_look_direction_be_enforced_upon_movement(void)
{
    if (TestPlayerAvatarFlags(PLAYER_AVATAR_FLAG_ACRO_BIKE) != FALSE && MetatileBehavior_IsBumpySlope(gMapObjects[gPlayerAvatar.mapObjectId].mapobj_unk_1E) != FALSE)
        return FALSE;
    else
        return TRUE;
}

void GetOnOffBike(u8 var)
{
    gUnknown_0202E854 = 0;

    if (gPlayerAvatar.flags & (PLAYER_AVATAR_FLAG_MACH_BIKE | PLAYER_AVATAR_FLAG_ACRO_BIKE))
    {
        SetPlayerAvatarTransitionFlags(PLAYER_AVATAR_FLAG_ON_FOOT);
        sav1_reset_battle_music_maybe();
        sub_8053E90();
    }
    else
    {
        SetPlayerAvatarTransitionFlags(var);
        sav1_set_battle_music_maybe(BGM_CYCLING);
        sub_8053FB0(BGM_CYCLING);
    }
}

void BikeClearState(int var1, int var2)
{
    u8 i;

    gPlayerAvatar.acroBikeState = ACRO_STATE_NORMAL;
    gPlayerAvatar.unk9 = 0;
    gPlayerAvatar.bikeFrameCounter = 0;
    gPlayerAvatar.unkB = 0;
    gPlayerAvatar.unkC = var1;
    gPlayerAvatar.unk10 = var2;

    for (i = 0; i < 8; i++)
        gPlayerAvatar.unk14[i] = 0;

    for (i = 0; i < 8; i++)
        gPlayerAvatar.unk1C[i] = 0;
}

void sub_80E6010(u8 var)
{
    gPlayerAvatar.bikeFrameCounter = var;
    gPlayerAvatar.unkB = gPlayerAvatar.bikeFrameCounter + (gPlayerAvatar.bikeFrameCounter >> 1); // lazy way of multiplying by 1.5.
}

static void sub_80E6024(void)
{
    gPlayerAvatar.bikeFrameCounter = 0;
    gPlayerAvatar.unkB = 0;
}

s16 GetPlayerSpeed(void)
{
    // because the player pressed a direction, it won't ever return a speed of 0 since this function returns the player's current speed.
    s16 machSpeeds[3];

    memcpy(machSpeeds, gMachBikeSpeeds, sizeof(machSpeeds));

    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_MACH_BIKE)
        return machSpeeds[gPlayerAvatar.bikeFrameCounter];
    else if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_ACRO_BIKE)
        return SPEED_FASTER;
    else if (gPlayerAvatar.flags & (PLAYER_AVATAR_FLAG_SURFING | PLAYER_AVATAR_FLAG_DASH))
        return SPEED_FAST;
    else
        return SPEED_NORMAL;
}

void sub_80E6084(void)
{
    s16 x, y;
    u8 tileBehavior;

    if (gPlayerAvatar.flags & PLAYER_AVATAR_FLAG_ACRO_BIKE)
    {
        PlayerGetDestCoords(&x, &y);
        tileBehavior = MapGridGetMetatileBehaviorAt(x, y);
        if (MetatileBehavior_IsBumpySlope(tileBehavior))
        {
            gPlayerAvatar.acroBikeState = ACRO_STATE_WHEELIE_STANDING;
            sub_8059C94(player_get_direction_upper_nybble());
        }
    }
}
