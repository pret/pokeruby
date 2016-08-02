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

    // 0 = Male
    // 1 = Female
    u8 playerGender;
    u8 sb2_field_9;
    u8 playerTrainerId[4];
    u16 playTimeHours;
    u8 playTimeMinutes;
    u8 playTimeSeconds;
    u8 playTimeVBlanks;

    // 0 = "NORMAL"
    // 1 = "LR"
    // 2 = "L=A"
    u8 optionsButtonMode;

    // 0 = "SLOW"
    // 1 = "MID"
    // 2 = "FAST"
    u8 optionsTextSpeed:3;

    // Specifies one of the 20 decorative borders for text boxes
    u8 optionsTextBoxFrameType:5;
    u8 filler[0x83];
    struct Time localTimeOffset;
};

extern struct SaveBlock2 gSaveBlock2;

#endif // GUARD_GLOBAL_H
