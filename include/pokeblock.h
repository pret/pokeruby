#ifndef GUARD_POKEBLOCK_H
#define GUARD_POKEBLOCK_H

extern u8 ewram[];
extern u8 gUnknown_02039244;
extern u8 gUnknown_02039248[2];

void sub_810B96C(void);
void sub_810BA7C(u8);
void ClearPokeblocks(void);
void sub_810CA6C(s32);
s16 sub_810CAE4(u8, struct Pokeblock *);

#endif // GUARD_POKEBLOCK_H
