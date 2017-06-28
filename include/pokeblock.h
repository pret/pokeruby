#ifndef GUARD_POKEBLOCK_H
#define GUARD_POKEBLOCK_H

struct YesNoCBTable {
    void (*yesFunc)(void);
    void (*noFunc)(void);
};

enum {
    PBLOCK_CLR_BLACK,
    PBLOCK_CLR_RED,
    PBLOCK_CLR_BLUE,
    PBLOCK_CLR_PINK,
    PBLOCK_CLR_GREEN,
    PBLOCK_CLR_YELLOW
};

extern u8 ewram[];
extern u8 gUnknown_02039244;
extern u8 gUnknown_02039248[4];
extern u8 gUnknown_0203924C;
extern const u8 *gUnknown_03000758;

void sub_810B96C(void);
void sub_810BA7C(u8);
void ClearPokeblocks(void);
bool8 sub_810CA6C(u8);
s16 sub_810CAE4(u8, const struct Pokeblock *);

#endif // GUARD_POKEBLOCK_H
