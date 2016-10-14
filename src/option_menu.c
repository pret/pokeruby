#include "gba/gba.h"

//Belongs in pokedex.c, but I'm just experimenting here.


struct UnknownStruct2 {
    u16 a;
    u8 b;
    u8 c;
};

struct UnknownStruct3 {
    u16 a;
    u16 b;
};

struct UnknownStruct {
    struct UnknownStruct2 unk0[0x181];
    u8 filler604[4];
    u16 unk608;
    u8 unk60A_1:1;
    u8 unk60A_2:1;
    u8 unk60B;
    //ToDo: figure out how to make the compiler not optimize these offsets
    struct UnknownStruct3 unk60C;
    struct UnknownStruct3 unk610;
    struct UnknownStruct3 unk614;
    struct UnknownStruct3 unk618;
    struct UnknownStruct3 unk61C;
    u8 filler620[0x06];
    u16 unk626;
    u8 filler628[2];
    u16 unk62A;
    u8 unk62C;
    u8 unk62D;
    u8 unk62E;
    u8 unk62F;
    u8 filler630[4];
    u8 unk634;
    u8 unk635;
    u8 unk636;
    u8 filler637[0x13];
    u8 unk64A;
    u8 unk64B;
    u8 unk1:1;
    u8 unk64D;
    u8 unk64E;
    u8 unk64F;
    u8 unk650;
    u8 unk651;
    u16 unk652;
    s16 unk654;
};

/*
struct UnknownStruct {
    struct UnknownStruct2 unk0[0x181];
    u8 filler604[4];
    u16 unk608;
    u8 unk60A_1:1;
    u8 unk60A_2:1;
    u8 unk60B;
    //ToDo: figure out how to make the compiler not optimize these offsets
    u16 unk60C;
    u16 unk60E;
    u16 unk610;
    u16 unk612;
    u16 unk614;
    u16 unk616;
    u16 unk618;
    u16 unk61A;
    u16 unk61C;
    u8 filler61E[0x08];
    u16 unk626;
    u8 filler628[2];
    u16 unk62A;
    u8 unk62C;
    u8 unk62D;
    u8 unk62E;
    u8 unk62F;
    u8 filler630[4];
    u8 unk634;
    u8 unk635;
    u8 unk636;
    u8 filler637[0x13];
    u8 unk64A;
    u8 unk64B;
    u8 unk1:1;
    u8 unk64D;
    u8 unk64E;
    u8 unk64F;
    u8 unk650;
    u8 unk651;
    u16 unk652;
    s16 unk654;
};
*/

#define CLEAR(p)                    \
{                                   \
    //struct UnknownStruct3 *_p = p;  \
    (p)->a = 0;                       \
    (p)->b = 0;                       \
}

void sub_808C0CC(struct UnknownStruct *ptr)
{
    u16 i;
    
    for(i = 0; i <= 0x181; i++)
    {
        ptr->unk0[i].a |= 0x0000FFFF;
        ptr->unk0[i].b = (0xFFFFFFFE & ptr->unk0[i].b) & 0xFFFFFFFD;
    }
    ptr->unk608 = 0;
    ptr->unk60A_1 = 0;
    ptr->unk60A_2 = 0;
    
    /*
    {
    ptr->unk60C.a = 0;
    ptr->unk60C.b = 0;
    }
    {
    ptr->unk610.a = 0;
    ptr->unk610.b = 0;
    }
    {
    ptr->unk614.a = 0;
    ptr->unk618.b = 0;
    }
    */
    
    /*
    ptr->unk60C = (struct UnknownStruct3){0, 0};
    ptr->unk610 = (struct UnknownStruct3){0, 0};
    ptr->unk614 = (struct UnknownStruct3){0, 0};
    */
    
    CLEAR(&ptr->unk60C);
    CLEAR(&ptr->unk610);
    CLEAR(&ptr->unk614);
    
    /*
    ptr->unk60C = 0;
    ptr->unk60E = 0;
    
    ptr->unk610 = 0;
    ptr->unk612 = 0;
    ptr->unk614 = 0;
    ptr->unk616 = 0;
    ptr->unk618 = 0;
    ptr->unk61A = 0;
    ptr->unk61C = 0;
    */
}