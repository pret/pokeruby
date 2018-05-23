#ifndef GUARD_PALETTE_H
#define GUARD_PALETTE_H

#define gPaletteFade_selectedPalettes (gPaletteFade.multipurpose1) // normal and fast fade
#define gPaletteFade_blendCnt         (gPaletteFade.multipurpose1) // hardware fade
#define gPaletteFade_delay            (gPaletteFade.multipurpose2) // normal and hardware fade
#define gPaletteFade_submode          (gPaletteFade.multipurpose2) // fast fade

#define FADE_COLOR_WHITE (RGB(31, 31, 31) | 0x8000)

enum
{
    FAST_FADE_IN_FROM_WHITE,
    FAST_FADE_OUT_TO_WHTIE,
    FAST_FADE_IN_FROM_BLACK,
    FAST_FADE_OUT_TO_BLACK,
};

struct PaletteFadeControl
{
    /*0x00*/    u32 multipurpose1;
    /*0x04*/    u8 delayCounter:6;
    /*0x05*/    u16 y:5; // blend coefficient
    /*0x05-06*/ u16 targetY:5; // target blend coefficient
    /*0x07*/    u16 blendColor:15;
    /*0x07*/    u16 active:1;
    /*0x08*/    u16 multipurpose2:6;
    /*0x08*/    u16 yDec:1; // whether blend coefficient is decreasing
    /*0x08*/    u16 bufferTransferDisabled:1;
    /*0x09*/    u16 mode:2;
    /*0x09*/    u16 shouldResetBlendRegisters:1;
    /*0x09*/    u16 hardwareFadeFinishing:1;
    /*0x09-0a*/ u16 softwareFadeFinishingCounter:5;
    /*0x0a*/    u16 softwareFadeFinishing:1;
    /*0x0a*/    u16 objPaletteToggle:1;
    /*0x0a*/    u8 deltaY:4; // rate of change of blend coefficient
};

extern struct PaletteFadeControl gPaletteFade;
extern u32 gPlttBufferTransferPending;
extern u8 gPaletteDecompressionBuffer[];
extern u16 gPlttBufferUnfaded[];
extern u16 gPlttBufferFaded[];

void LoadCompressedPalette(const void *, u16, u16);
void LoadPalette(const void *, u16, u16);
void FillPalette(u16, u16, u16);
void TransferPlttBuffer(void);
u8 UpdatePaletteFade(void);
void ResetPaletteFade(void);
void ReadPlttIntoBuffers(void);
bool8 BeginNormalPaletteFade(u32, s8, u8, u8, u16);
void unref_sub_8073D84(u8, u32 *);
void ResetPaletteStructByUid(u16);
void ResetPaletteStruct(u8);
void ResetPaletteFadeControl(void);
void unref_sub_8074168(u16);
void unref_sub_8074194(u16);
void InvertPlttBuffer(u32);
void TintPlttBuffer(u32, s8, s8, s8);
void UnfadePlttBuffer(u32);
void BeginFastPaletteFade(u8);
void BeginHardwarePaletteFade(u8, u8, u8, u8, u8);
void BlendPalettes(u32, u8, u16);
void BlendPalettesUnfaded(u32, u8, u16);

#endif // GUARD_PALETTE_H
