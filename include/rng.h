#ifndef GUARD_RNG_H
#define GUARD_RNG_H

extern u32 gRngValue;

u16 Random(void);
void SeedRng(u16 seed);

#endif // GUARD_RNG_H
