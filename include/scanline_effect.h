#ifndef GUARD_SCANLINE_EFFECT_H
#define GUARD_SCANLINE_EFFECT_H

// DMA control value to ransfer a single 16-bit value at HBlank
#define SCANLINE_EFFECT_DMACNT_16BIT (((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_SRC_INC | DMA_DEST_INC | DMA_16BIT | DMA_DEST_RELOAD) << 16) | 1)

struct ScanlineEffectParams
{
    volatile void *dmaDest;
    u32 dmaControl;
    u8 unk8;
    u8 unk9;
};

struct ScanlineEffect
{
    void *src[2];
    volatile void *dmaDest;
    u32 dmaControl;
    void (*setFirstScanlineReg)(void);
    u8 srcBank;
    u8 unk15;
    u8 unk16;
    u8 unk17;
    u8 taskId;
    u8 filler19[0x7];
};

extern struct ScanlineEffect gScanlineEffect;

extern u16 gScanlineEffectRegBuffers[][0x3C0];

void ScanlineEffect_Stop(void);
void ScanlineEffect_Stop(void);
void dp12_8087EA4(void);
void dp12_8087EA4(void);
//void ScanlineEffect_SetParams(u32 i, u32 i1, u32 i2);
//void ScanlineEffect_SetParams();
void ScanlineEffect_SetParams(struct ScanlineEffectParams unk);
void ScanlineEffect_InitHBlankDmaTransfer(void);
void ScanlineEffect_InitHBlankDmaTransfer();
//void ScanlineEffect_InitWave(int i, int i1, int i2, int i3, int i4, int i5, int i6);
u8 ScanlineEffect_InitWave(u8 a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, u8 a7);

#endif // GUARD_SCANLINE_EFFECT_H
