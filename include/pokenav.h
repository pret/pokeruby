#ifndef GUARD_POKENAV_H
#define GUARD_POKENAV_H

struct UnkPokenavStruct_Sub {
    /*0x0*/ u16 unk0;
    /*0x2*/ u8 filler2[6];
};

struct UnkPokenavStruct_Sub1 {
    /*0x00*/ void (*unk0)(void);
    /*0x04*/ MainCallback callback;
    /*0x08*/ struct Pokeblock *pokeblock;
    /*0x0C*/ u8 fillerC[0x44];
    /*0x50*/ u8 unk50;
    /*0x51*/ u8 unk51[4];
    /*0x56*/ u8 unk55;
    /*0x56*/ u8 unk56;
};

struct UnkPokenavStruct_Sub2 {
    /*0x00*/ u8 filler_00[0x26];
    /*0x26*/ u16 unk26;
};

struct UnkPokenavStruct {
    /*0x0000*/ u8 filler0000[0x30c];
    /*0x0000*/ u16 unk030C;
    /*0x0000*/ u8 filler030E[0x6a9e];
    /*0x6DAC*/ u8 unk6DAC;
    /*0x6DAD*/ u8 filler6DAD[0x8fd];
    /*0x6DAD*/ u8 unk76AA;
    /*0x6DAD*/ u8 filler76AB[0x10bd];
    /*0x6DAD*/ struct UnkPokenavStruct_Sub2 *unk8768;
    /*0x6DAD*/ u8 filler876C[0x74];
    /*0x6DAD*/ void *unk87E0;
    /*0x6DAD*/ u8 filler87E4[0x44];
    /*0x6DAD*/ u8 unk8828;
    /*0x6DAD*/ u8 filler8829[0x7c7];
    /*0x6DAD*/ u8 unk8ff0;
    /*0x6DAD*/ u8 filler8ff1[0x13];
    /*0x6DAD*/ u8 unk9004;
    /*0x6DAD*/ u8 filler9005[0x33f];
    /*0x6DAD*/ u8 unk9344;
    /*0x6DAD*/ u8 filler9345[0x3ba3];
    /*0xCEE8*/ struct UnkPokenavStruct_Sub unkCEE8[78];
    /*0xD158*/ u16 unkD158;
    /*0xd15a*/ u8 fillerD15A[6];
    /*0xd162*/ u16 unkD160;
    /*0xd162*/ u8 unkD162[2];
    /*0xd164*/ struct UnkPokenavStruct_Sub1 unkD164;
};

extern struct UnkPokenavStruct *const gUnknown_083DFEC4;

bool8 sub_80F170C(void);
bool8 sub_80F1778(void);
void sub_80F1934(void);
void sub_80F2C80(u8);
void sub_80F2688(void);
bool8 sub_80F26BC(void);
bool8 sub_80F2CBC(u8);
void sub_80F2E18(u8);
void sub_80F33A8(void);
void sub_80F3C94(void);
void sub_80F3D00(void);
void sub_80F4BD0(void);
void sub_80F556C(void *);
void sub_80F567C(void *, void *);
void sub_80F5B38(void);
bool8 sub_80F5B50(void);
void sub_80F5CDC(u8);
void sub_80EBA5C(void);

#endif // GUARD_POKENAV_H
