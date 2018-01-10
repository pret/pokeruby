#ifndef GUARD_SCANLINE_EFFECT_H
#define GUARD_SCANLINE_EFFECT_H

struct UnknownTaskStruct
{
    volatile void *dest;
    u32 control;
    u8 unk8;
    u8 unk9;
};

struct ScanlineEffect
{
    void *src[2];
    volatile void *dest;
    u32 unkC;
    void (*unk10)(void);
    u8 srcBank;
    u8 unk15;
    u8 unk16;
    u8 unk17;
    u8 taskId;
    u8 filler19[0x7];
};

extern struct ScanlineEffect gScanlineEffect;

extern u16 gUnknown_03004DE0[][0x3C0];

void ScanlineEffect_Stop(void);
void ScanlineEffect_Stop(void);
void dp12_8087EA4(void);
void dp12_8087EA4(void);
//void sub_80895F8(u32 i, u32 i1, u32 i2);
//void sub_80895F8();
void sub_80895F8(struct UnknownTaskStruct unk);
void ScanlineEffect_TransferDma(void);
void ScanlineEffect_TransferDma();
//void ScanlineEffect_InitWave(int i, int i1, int i2, int i3, int i4, int i5, int i6);
u8 ScanlineEffect_InitWave(u8 a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, u8 a7);

#endif // GUARD_SCANLINE_EFFECT_H
