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
    /*0x00*/ void (*unk0)(void);
    /*0x04*/ void *unk4;
    /*0x08*/ void *unk8;
    /*0x0C*/ u8 fillerC[0x44];
    /*0x50*/ u8 unk50;
    /*0x51*/ u8 unk51[5];
    /*0x56*/ u8 unk56;
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

void sub_80F5CDC(u8);

#endif //POKERUBY_POKENAV_H
