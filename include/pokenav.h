#ifndef GUARD_POKENAV_H
#define GUARD_POKENAV_H

#include "region_map.h"

struct UnkPokenavStruct_Sub {
    /*0x0*/ u16 unk0;
    /*0x2*/ u8 filler2[6];
};

struct UnkPokenavStruct_Sub1 {
    /*0x00*/ void (*unk0)(void);
    /*0x04*/ MainCallback callback;
    /*0x08*/ struct Pokeblock *pokeblock;
    /*0x0C*/ struct Pokemon *pokemon;
    /*0x10*/ u8 stringBuffer[0x40];
    /*0x50*/ u8 unk50;
    /*0x51*/ u8 unk51;
    /*0x52*/ u8 unk52;
    /*0x53*/ u8 unk53;
    /*0x54*/ u8 unk54;
    /*0x55*/ u8 unk55;
    /*0x56*/ u8 unk56;
    /*0x57*/ u8 unk57[5];
    /*0x5c*/ u8 unk5c[5];
    /*0x61*/ u8 unk61[5];
    /*0x66*/ s16 unk66[5];
};

struct UnkPokenavStruct_Sub2 {
    /*0x00*/ u8 filler_00[0x26];
    /*0x26*/ u16 unk26;
};

struct UnkPokenavStruct_Sub3 {
    /*0x00*/s16 unk0;
};

struct UnkUsePokeblockSub {
    /*0*/ u8 fil0[2];
    /*2*/ u8 partyIdx:5;
    /*2*/ u16 unk2:9;
};

struct UnkPokenavStruct {
    /*0x0000*/ u8 filler0000[0x306];
    /*0x0306*/ u16 unk306;
    /*0x0306*/ u8 filler0308[0x4];
    /*0x030C*/ union { // TODO: what?
        u16 val;
        struct UnkPokenavStruct_Sub3 unk030C;
    } unk030C;
    /*0x0310*/ u8 filler030E[0x6a90];
    /*0x6DA0*/ u16 unk6DA0;
    /*0x6DA2*/ u16 unk6DA2;
    /*0x6DA4*/ u16 taskId6DA4;
    /*0x6DA6*/ u8 filler6DA6[0x6];
    /*0x6DAC*/ u8 unk6DAC;
    /*0x6DAD*/ u8 filler6DAD[0x6B];
    /*0x6E18*/ struct RegionMap regionMap;
    /*0x7698*/ u16 unk7698;
    /*0x769A*/ u16 unk769A;
    /*0x769C*/ u8 unk769C;
    /*0x769D*/ u8 unk769D;
    /*0x769E*/ u8 unk769E;
    /*0x769F*/ u8 filler769F[0xB];
    /*0x76AA*/ u8 unk76AA;
    /*0x76AB*/ u8 filler76AB[0x10bd];
    /*0x8768*/ struct UnkPokenavStruct_Sub2 *unk8768;
    /*0x876C*/ u8 filler876C[0x2];
    /*0x876E*/ u8 unk876E;
    /*0x876F*/ u8 filler876F[0x1];
    /*0x8770*/ u16 unk8770;
    /*0x8772*/ u16 unk8772;
    /*0x8774*/ u16 unk8774;
    /*0x8776*/ u16 unk8776;
    /*0x8778*/ u16 unk8778;
    /*0x877A*/ u16 unk877A;
    /*0x877C*/ u16 unk877C;
    /*0x8780*/ u8 filler8780[0x8];
    /*0x8788*/ u8 unk8788[0x40];
    /*0x87C8*/ u8 unk87C8;
    /*0x87C9*/ u8 filler87C9;
    /*0x87CA*/ u8 unk87CA;
    /*0x87CB*/ u8 filler87CB[0xF];
    /*0x87DA*/ s16 unk87DA;
    /*0x87DC*/ s16 unk87DC;
    /*0x87DE*/ s16 unk87DE;
    /*0x87E0*/ void *unk87E0;
    /*0x87E4*/ u8 filler87E4[0x44];
    /*0x8828*/ u8 unk8828;
    /*0x8829*/ u8 unk8829[3][64];
    /*0x88E9*/ u8 unk88E9[3][24];
    /*0x8931*/ u8 unk8931[11];
    /*0x893C*/ struct UnkUsePokeblockSub unk893c[0x1ab];
    /*0x8fe8*/ u8 fil8fe8[1];
    /*0x8fe9*/ s8 unk8fe9;
    /*0x8fea*/ u8 fil8fea[6];
    /*0x8ff0*/ u8 unk8ff0;
    /*0x8ff1*/ u8 filler8ff1[0x13];
    /*0x9004*/ u8 unk9004[3][20];
    /*0x9040*/ u8 unk9040[0x304];
    /*0x9344*/ u8 unk9344;
    /*0x9345*/ u8 filler9345[0x2955];
    /*0xBC9A*/ u8 unkBC9A;
    /*0xBC9B*/ u8 unkBC9B;
    /*0xBC9C*/ u8 unkBC9C[22][200];
    /*0xCDCC*/ const u8 *unkCDCC[16][2];
    /*0xCE4C*/ u16 unkCE4C;
    /*0xCE4E*/ u16 unkCE4E;
    /*0xCE50*/ u16 unkCE50;
    /*0xCE52*/ u16 palettesCE52[30];
    /*0xCE8E*/ u16 palettesCE8E[0x2D];
    /*0xCEE8*/ struct UnkPokenavStruct_Sub unkCEE8[78];
    /*0xD158*/ u16 unkD158;
    /*0xD15A*/ u8 fillerD15A[6];
    /*0xD160*/ u16 unkD160;
    /*0xD162*/ u8 unkD162[2];
    /*0xD164*/ struct UnkPokenavStruct_Sub1 unkD164;
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
void sub_80F5060(bool8);
void move_anim_execute(void);
bool8 gpu_sync_bg_show(void);
void sub_80F5550(void *, void *);
bool8 sub_80F555C(void);
void sub_80F7224(u8);
void sub_80F5BDC(void);

#endif // GUARD_POKENAV_H
