#ifndef GUARD_POKENAV_H
#define GUARD_POKENAV_H

struct UnkPokenavStruct_Sub {
    /*0x0*/ u16 unk0;
    /*0x2*/ u8 filler2[6];
};

struct UnkPokenavStruct {
    /*0x0000*/ u8 filler0000[0xCEE8];
    /*0xCEE8*/ struct UnkPokenavStruct_Sub unkCEE8[78];
    /*0xD158*/ u16 unkD158;
};

extern struct UnkPokenavStruct *gUnknown_083DFEC4;

void sub_80EBA5C(void);

#endif // GUARD_POKENAV_H
