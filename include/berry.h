#ifndef GUARD_BERRY_H
#define GUARD_BERRY_H

struct Berry
{
    u8 name[7];
    u8 firmness;
    u16 size;
    u8 maxYield;
    u8 minYield;
    u8 *description1;
    u8 *description2;
    u8 stageDuration;
    u8 spicy;
    u8 dry;
    u8 sweet;
    u8 bitter;
    u8 sour;
    u8 smoothness;
};

struct EnigmaBerry
{
    u8 name[7];
    u8 holdEffect;
    u8 unknown[18];
    u8 holdEffectParam;
};

#endif // GUARD_BERRY_H
