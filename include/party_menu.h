#ifndef GUARD_PARTY_MENU_H
#define GUARD_PARTY_MENU_H

// TODO: Unify these two structs

#define DATA_COUNT (6)
struct Unk201B000
{
    //u8 filler0[0x260];
    struct Pokemon unk0[6];
    u8 filler258[1];
    u8 unk259;
    u8 filler25A[6];
    u8 unk260;
    u8 unk261;
    u8 unk262;
    u8 unk263;
    s16 unk264[DATA_COUNT * 2];  // This may be a union
    u8 filler27C[2];
    s16 unk27E;
    s16 unk280;
    s16 unk282;
};

struct Struct201B000
{
    u8 filler0[0x259];
    u8 unk259;
    u8 filler25A[6];
    u8 unk260;
    u8 filler261[1];
    u8 unk262;
    s16 unk264;
    s16 unk266;
};

extern u8 ewram[];
#define ewram1B000 (*(struct Unk201B000 *)(ewram + 0x1B000))
#define ewram1B000_alt (*(struct Struct201B000 *)(ewram + 0x1B000))
#define EWRAM_1B000 ewram1B000_alt

#endif  // GUARD_PARTY_MENU_H
