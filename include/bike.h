#ifndef GUARD_BIKE_H
#define GUARD_BIKE_H

// BikeHistoryInputInfo
struct BikeHistoryInputInfo
{
    u32 dirHistoryMatch;
    u32 abStartSelectHistoryMatch;
    u32 dirHistoryMask;
    u32 abStartSelectHistoryMask;
    const u8 *dirTimerHistoryList;
    const u8 *abStartSelectHistoryList;
    u32 direction;
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

// mach bike transitions enum
enum
{
    MBT_FACE_DIRECTION,
    MBT_TURN_FRAME,
    MBT_KEEP_MOVING,
    MBT_START_MOVING
};

//Acro bike states
enum
{
    ACRO_STATE_NORMAL,
    ACRO_STATE_TURNING,
    ACRO_STATE_WHEELIE_STANDING,
    ACRO_STATE_BUNNY_HOP,
    ACRO_STATE_WHEELIE_MOVING,
    ACRO_STATE_SIDE_JUMP,
    ACRO_STATE_TURN_JUMP,
};

//Acro bike transitions
enum
{
    ACRO_TRANS_FACE_DIRECTION,
    ACRO_TRANS_TURN_DIRECTION,
    ACRO_TRANS_MOVING,
    ACRO_TRANS_NORMAL_TO_WHEELIE,
    ACRO_TRANS_WHEELIE_TO_NORMAL,
    ACRO_TRANS_WHEELIE_IDLE,
    ACRO_TRANS_WHEELIE_HOPPING_STANDING,
    ACRO_TRANS_WHEELIE_HOPPING_MOVING,
    ACRO_TRANS_SIDE_JUMP,
    ACRO_TRANS_TURN_JUMP,
    ACRO_TRANS_WHEELIE_MOVING,
    ACRO_TRANS_WHEELIE_RISING_MOVING,
    ACRO_TRANS_WHEELIE_LOWERING_MOVING,
};

void MovePlayerOnBike(u8 direction, u16 newKeys, u16 heldKeys);
void Bike_TryAcroBikeHistoryUpdate(u16 a, u16 b);
bool8 IsRunningDisallowed(u8 tile);
bool8 IsBikingDisallowedByPlayer(void);
bool8 player_should_look_direction_be_enforced_upon_movement(void);
void GetOnOffBike(u8 var);
void BikeClearState(int var1, int var2);
void Bike_UpdateBikeCounterSpeed(u8 var);
s16 GetPlayerSpeed(void);
void Bike_HandleBumpySlopeJump(void);

#endif
