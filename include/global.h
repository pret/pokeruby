#ifndef GUARD_GLOBAL_H
#define GUARD_GLOBAL_H

#include "gba/gba.h"

#ifndef REVISION
#define REVISION 0
#endif

// Prevent cross-jump optimization.
#define BLOCK_CROSS_JUMP asm("");

#define ARRAY_COUNT(array) (sizeof(array) / sizeof((array)[0]))

extern u8 gStringVar1[];
extern u8 gStringVar2[];
extern u8 gStringVar3[];

enum
{
    MALE,
    FEMALE
};

enum
{
    OPTIONS_BUTTON_MODE_NORMAL,
    OPTIONS_BUTTON_MODE_LR,
    OPTIONS_BUTTON_MODE_L_EQUALS_A
};

enum
{
    OPTIONS_TEXT_SPEED_SLOW,
    OPTIONS_TEXT_SPEED_MID,
    OPTIONS_TEXT_SPEED_FAST
};

struct Coords16
{
    s16 x;
    s16 y;
};

struct Time
{
    s16 days;
    s8 hours;
    s8 minutes;
    s8 seconds;
};

struct SaveBlock2
{
    u8 playerName[8];

    u8 playerGender; // MALE, FEMALE
    u8 sb2_field_9;
    u8 playerTrainerId[4];
    u16 playTimeHours;
    u8 playTimeMinutes;
    u8 playTimeSeconds;
    u8 playTimeVBlanks;
    u8 optionsButtonMode;  // OPTIONS_BUTTON_MODE_[NORMAL/LR/L_EQUALS_A]
    u8 optionsTextSpeed:3; // OPTIONS_TEXT_SPEED_[SLOW/MID/FAST]
    u8 optionsWindowFrameType:5; // Specifies one of the 20 decorative borders for text boxes
    u8 filler[0x83];
    struct Time localTimeOffset;
};

extern struct SaveBlock2 gSaveBlock2;

#endif // GUARD_GLOBAL_H
