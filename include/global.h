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
    u8 playerName[8];               //0x00
    u8 playerGender;                //0x08
    u8 sb2_field_9;                 //0x09
    u8 playerTrainerId[4];          //0x0A
    u16 playTimeHours;              //0x0E
    u8 playTimeMinutes;             //0x10
    u8 playTimeSeconds;             //0x11
    u8 playTimeVBlanks;             //0x12
    u8 optionsButtonMode;           //0x13
    u8 optionsTextSpeed:3;          //0x14
    u8 optionsUnk:5;
    u8 filler[0x83];                //0x15
    struct Time localTimeOffset;
};

extern struct SaveBlock2 gSaveBlock2;

#endif // GUARD_GLOBAL_H
