#ifndef GUARD_POKEBLOCK_H
#define GUARD_POKEBLOCK_H

enum {
    PBLOCK_CLR_BLACK,
    PBLOCK_CLR_RED,
    PBLOCK_CLR_BLUE,
    PBLOCK_CLR_PINK,
    PBLOCK_CLR_GREEN,
    PBLOCK_CLR_YELLOW
};

void sub_810B96C(void);
u8 sub_810BA50(s16, s16, u8);
u8 sub_810C9B0(struct Pokeblock *);
s16 sub_810CA9C(const struct Pokeblock *, u8);
u8 sub_810C9E8(struct Pokeblock *);
void sub_810BA7C(u8);
void ClearPokeblocks(void);
bool8 sub_810CA6C(u8);
s16 sub_810CAE4(u8, const struct Pokeblock *);
u8 sub_810CB68(u8, u8*);

#endif // GUARD_POKEBLOCK_H
