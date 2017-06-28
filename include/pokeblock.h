#ifndef GUARD_POKEBLOCK_H
#define GUARD_POKEBLOCK_H

struct YesNoCBTable {
    void (*yesFunc)(void);
    void (*noFunc)(void);
};

extern u8 ewram[];
extern u8 gUnknown_02039244;
extern u8 gUnknown_02039248[4];
extern u8 gUnknown_0203924C;
extern const u8 *gUnknown_03000758;

void sub_810B96C(void);
void sub_810BA7C(u8);
void ClearPokeblocks(void);
void sub_810CA6C(s32);
s16 sub_810CAE4(u8, struct Pokeblock *);

#endif // GUARD_POKEBLOCK_H
