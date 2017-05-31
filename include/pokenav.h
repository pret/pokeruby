//
// Created by Scott Norton on 5/31/17.
//

#ifndef POKERUBY_POKENAV_H
#define POKERUBY_POKENAV_H

struct UnkPokenavStruct_Sub {
    /*0x0*/ u16 unk0;
    /*0x2*/ u8 filler2[6];
};

struct UnkPokenavStruct_Sub1 {
    /*0x0*/ u32 unk0;
    /*0x1*/ u32 unk4;
    /*0x2*/ u32 unk8;
};

struct UnkPokenavStruct {
    /*0x0000*/ u8 filler0000[0xCEE8];
    /*0xCEE8*/ struct UnkPokenavStruct_Sub unkCEE8[78];
    /*0xD158*/ u16 unkD158;
    /*0xd15a*/ u8 fillerD15A[8];
    /*0xd162*/ u8 unkD162[2];
    /*0xd164*/ struct UnkPokenavStruct_Sub1 unkD164;
};

extern struct UnkPokenavStruct *gUnknown_083DFEC4;


#endif //POKERUBY_POKENAV_H
