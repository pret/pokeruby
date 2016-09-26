#ifndef GUARD_DECORATION_H
#define GUARD_DECORATION_H

struct Decoration
{
    u8 id;
    u8 name[16];
    u8 decor_field_11;
    u8 decor_field_12;
    u8 decor_field_13;
    u16 price;
    u8 *description;
    void *tiles;
};

#endif // GUARD_DECORATION_H
