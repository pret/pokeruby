#include "global.h"
#include "asm.h"

struct BardSound
{
    u8 pad_00[48];
};

struct UnkBard
{
    /*0x00*/ u8 var00;
    /*0x01*/ s8 var01;
    /*0x02*/ u16 var02;
    /*0x04*/ u16 var04;
    /*0x06*/ u16 var06;
};

struct UnkBard3
{
    /*0x00*/ u16 var00;
    /*0x02*/ u16 var02;
    /*0x04*/ s16 var04;
    /*0x06*/ u16 var06;
};

struct UnkBard2
{
    /*0x00*/ u8 var00;
    /*0x01*/ u8 var01;
    /*0x02*/ u8 var02;
    /*0x03*/ u8 var03;
    /*0x04*/ u16 var04;
    u8 pad06[4];
    /*0x0A*/ u16 var0A;
    u8 pad0C[12];
    /*0x18*/ struct UnkBard3 var18[6];
};

extern struct BardSound *gBardMusicTable[];
extern s16 *gUnknown_08417068[];
extern u32 gUnknown_084170F4[];

static s16 sub_814A2B8(u32 arg0, u32 arg1)
{
    return gUnknown_08417068[arg0][arg1];
}

struct BardSound *sub_814A2D0(u16 arg0, u16 arg1)
{
    struct BardSound *sounds = gBardMusicTable[arg0];

    return &sounds[arg1];
}

s32 sub_814A2EC(struct UnkBard2 *dest, struct UnkBard *src, u16 arg2)
{
    s32 i;
    s32 j;
    s32 thirty;

    for (i = 0; i < 6; i++)
    {
        dest->var18[i].var00 = src[i].var00;
        if (src[i].var00 != 0xFF)
        {
            s32 r1 = src[i].var01 + gUnknown_084170F4[src[i].var00];

            dest->var18[i].var02 = r1;
            dest->var18[i].var06 = src[i].var04;
            dest->var04 += r1;
        }
    }

    for (j = 0, thirty = 30; j < i; j++)
        dest->var18[j].var04 = sub_814A2B8(thirty + arg2, j);

    dest->var00++;
    dest->var01 = 0;
    dest->var02 = 0;
    dest->var03 = 0;
    dest->var0A = 0;

    //warning: no return statement in function returning non-void
}
