#ifndef GUARD_BIKE_H
#define GUARD_BIKE_H

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

void MovePlayerOnBike(u8 direction, u16 newKeys, u16 heldKeys);
void sub_80E5B38(u16 a, u16 b);
bool8 IsRunningDisallowed(u8 tile);
bool8 IsBikingDisallowedByPlayer(void);
bool8 player_should_look_direction_be_enforced_upon_movement(void);
void GetOnOffBike(u8 var);
void BikeClearState(int var1, int var2);
void sub_80E6010(u8 var);
s16 GetPlayerSpeed(void);
void sub_80E6084(void);

#endif
