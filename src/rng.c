#include "global.h"

extern u32 gRngValue;

u16 Random(void)
{
    gRngValue = 0x41c64e6d * gRngValue + 0x00006073;
    return gRngValue >> 16;
}

void SeedRng(u16 seed)
{
    gRngValue = seed;
}
