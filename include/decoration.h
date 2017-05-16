#ifndef GUARD_DECORATION_H
#define GUARD_DECORATION_H

struct Decoration
{
    /*0x00*/ u8 id;
    /*0x01*/ u8 name[16];
    /*0x11*/ u8 decor_field_11;
    /*0x12*/ u8 decor_field_12;
    /*0x13*/ u8 decor_field_13;
    /*0x14*/ u16 price;
    /*0x16*/ u8 *description;
    /*0x1A*/ void *tiles;
};

extern struct Decoration gDecorations[0x77];
extern void sub_80FF394(u16 unkr0, u16 unkr1, u16 unkr2);

#endif // GUARD_DECORATION_H
