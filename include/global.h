#ifndef GUARD_GLOBAL_H
#define GUARD_GLOBAL_H

#include "gba/gba.h"

#ifndef REVISION
#define REVISION 0
#endif

extern u8 gStringVar1[];
extern u8 gStringVar2[];
extern u8 gStringVar3[];

enum
{
    MALE,
    FEMALE
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
    u8 playerGender;
    u16 playerTrainerId;
    u16 playerSecretId;
    u16 playTimeHours;
    u8 playTimeMinutes;
    u8 playTimeSeconds;
    u8 playTimeVBlanks;
    u8 filler[0x85];
    struct Time localTimeOffset;
};

extern struct SaveBlock2 gSaveBlock2;

#endif // GUARD_GLOBAL_H
