#ifndef GUARD_BARD_MUSIC_H
#define GUARD_BARD_MUSIC_H

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
    /*0x04*/ s16 var04;
    /*0x06*/ u16 volume;
    /*0x08*/ s16 pitch;
    /*0x0A*/ s16 var0A;
    /*0x0C*/ u16 var0C[6];
    /*0x18*/ struct UnkBard3 var18[6];
};

struct BardSound *sub_814A2D0(u16 arg0, u16 arg1);
s32 sub_814A2EC(struct UnkBard2 *dest, struct UnkBard *src, u16 arg2);

#endif  // GUARD_BARD_MUSIC_H
