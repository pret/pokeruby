#include "global.h"
#include "data2.h"
#include "task.h"
#include "trig.h"
#include "scanline_effect.h"

static void CopyValue16Bit(void);
static void CopyValue32Bit(void);

extern u16 gBattle_BG0_Y;
extern u16 gBattle_BG0_X;
extern u16 gBattle_BG1_X;
extern u16 gBattle_BG1_Y;
extern u16 gBattle_BG2_X;
extern u16 gBattle_BG2_Y;
extern u16 gUnknown_030041B0;
extern u16 gUnknown_030041B8;

EWRAM_DATA static u8 gUnknown_0202FFA4 = 0;

struct ScanlineEffect gScanlineEffect;

// Per-scanline register values.
// This is double buffered so that it can be safely written to at any time
// without overwriting the buffer that the DMA is currently reading
u16 gScanlineEffectRegBuffers[2][0x3C0];

void ScanlineEffect_Stop(void)
{
    gScanlineEffect.unk15 = 0;
    DmaStop(0);
    if (gScanlineEffect.taskId != 0xFF)
    {
        DestroyTask(gScanlineEffect.taskId);
        gScanlineEffect.taskId = 0xFF;
    }
}

void dp12_8087EA4(void)
{
    CpuFill16(0, gScanlineEffectRegBuffers, sizeof(gScanlineEffectRegBuffers));
    gScanlineEffect.src[0] = NULL;
    gScanlineEffect.src[1] = NULL;
    gScanlineEffect.dmaDest = NULL;
    gScanlineEffect.dmaControl = 0;
    gScanlineEffect.srcBank = 0;
    gScanlineEffect.unk15 = 0;
    gScanlineEffect.unk16 = 0;
    gScanlineEffect.unk17 = 0;
    gScanlineEffect.taskId = 0xFF;
}

void ScanlineEffect_SetParams(struct ScanlineEffectParams params)
{
    if (params.dmaControl == SCANLINE_EFFECT_DMACNT_16BIT)  // 16-bit
    {
        // Set the DMA src to the value for the second scanline because the
        // first DMA transfer occurs in HBlank *after* the first scanline is drawn
        gScanlineEffect.src[0] = (u16 *)gScanlineEffectRegBuffers[0] + 1;
        gScanlineEffect.src[1] = (u16 *)gScanlineEffectRegBuffers[1] + 1;
        gScanlineEffect.setFirstScanlineReg = CopyValue16Bit;
    }
    else  // assume 32-bit
    {
        // Set the DMA src to the value for the second scanline because the
        // first DMA transfer occurs in HBlank *after* the first scanline is drawn
        gScanlineEffect.src[0] = (u32 *)gScanlineEffectRegBuffers[0] + 1;
        gScanlineEffect.src[1] = (u32 *)gScanlineEffectRegBuffers[1] + 1;
        gScanlineEffect.setFirstScanlineReg = CopyValue32Bit;
    }

    gScanlineEffect.dmaControl = params.dmaControl;
    gScanlineEffect.dmaDest = params.dmaDest;
    gScanlineEffect.unk15 = params.unk8;
    gScanlineEffect.unk16 = params.unk9;
    gScanlineEffect.unk17 = params.unk9;
}

void ScanlineEffect_InitHBlankDmaTransfer(void)
{
    if (gScanlineEffect.unk15 != 0)
    {
        if (gScanlineEffect.unk15 == 3)
        {
            gScanlineEffect.unk15 = 0;
            DmaStop(0);
            gUnknown_0202FFA4 = 1;
        }
        else
        {
            DmaStop(0);
            // Set DMA to copy to dest register on each HBlank for the next frame.
            // The HBlank DMA transfers do not occurr during VBlank, so the transfer
            // will begin on the HBlank after the first scanline
            DmaSet(0, gScanlineEffect.src[gScanlineEffect.srcBank], gScanlineEffect.dmaDest, gScanlineEffect.dmaControl);
            // Manually set the reg for the first scanline
            gScanlineEffect.setFirstScanlineReg();
            // Swap current buffer
            gScanlineEffect.srcBank ^= 1;
        }
    }
}

// These two functions are used to copy the register for the first scanline,
// depending whether it is a 16-bit register or a 32-bit register.

static void CopyValue16Bit(void)
{
    u16 *dest = (u16 *)gScanlineEffect.dmaDest;
    u16 *src = (u16 *)&gScanlineEffectRegBuffers[gScanlineEffect.srcBank];

    *dest = *src;
}

static void CopyValue32Bit(void)
{
    u32 *dest = (u32 *)gScanlineEffect.dmaDest;
    u32 *src = (u32 *)&gScanlineEffectRegBuffers[gScanlineEffect.srcBank];

    *dest = *src;
}

#define tStartLine      data[0]
#define tEndLine        data[1]
#define framesUntilMove data[4]
#define tDelayInterval  data[5]
#define tRegOffset      data[6]

static void TaskFunc_UpdateWavePerFrame(u8 taskId)
{
    int value = 0;

    if (gUnknown_0202FFA4)
    {
        DestroyTask(taskId);
        gScanlineEffect.taskId = 0xFF;
    }
    else
    {
        if (gTasks[taskId].data[7])
        {
            switch (gTasks[taskId].tRegOffset)
            {
            case 0x0:
                value = gBattle_BG0_X;
                break;
            case 0x2:
                value = gBattle_BG0_Y;
                break;
            case 0x4:
                value = gBattle_BG1_X;
                break;
            case 0x6:
                value = gBattle_BG1_Y;
                break;
            case 0x8:
                value = gBattle_BG2_X;
                break;
            case 0xA:
                value = gBattle_BG2_Y;
                break;
            case 0xC:
                value = gUnknown_030041B0;
                break;
            case 0xE:
                value = gUnknown_030041B8;
                break;
            }
        }
        if (gTasks[taskId].framesUntilMove != 0)
        {
            int i;
            int offset;

            gTasks[taskId].framesUntilMove--;
            offset = gTasks[taskId].data[3] + 320;
            for (i = gTasks[taskId].tStartLine; i < gTasks[taskId].tEndLine; i++)
            {
                gScanlineEffectRegBuffers[gScanlineEffect.srcBank][i] = gScanlineEffectRegBuffers[0][offset] + value;
                offset++;
            }
        }
        else
        {
            int i;
            int offset;

            gTasks[taskId].framesUntilMove = gTasks[taskId].tDelayInterval;
            offset = gTasks[taskId].data[3] + 320;
            for (i = gTasks[taskId].tStartLine; i < gTasks[taskId].tEndLine; i++)
            {
                gScanlineEffectRegBuffers[gScanlineEffect.srcBank][i] = gScanlineEffectRegBuffers[0][offset] + value;
                offset++;
            }
            gTasks[taskId].data[3]++;
            if (gTasks[taskId].data[3] == gTasks[taskId].data[2])
                gTasks[taskId].data[3] = 0;
        }
    }
}

static void GenerateWave(u16 *buffer, u8 frequency, u8 amplitude, u8 unused)
{
    u16 i = 0;
    u8 theta = 0;

    while (i < 256)
    {
        buffer[i] = (gSineTable[theta] * amplitude) / 256;
        theta += frequency;
        i++;
    }
}

// Initializes a background "wave" effect that affects scanlines startLine (inclusive) to endLine (exclusive).
// 'frequency' and 'amplitude' control the frequency and amplitude of the wave.
// 'delayInterval' controls how fast the wave travels up the screen. The wave will shift upwards one scanline every 'delayInterval'+1 frames.
// 'regOffset' is the offset of the video register to modify.
u8 ScanlineEffect_InitWave(u8 startLine, u8 endLine, u8 frequency, u8 amplitude, u8 delayInterval, u8 regOffset, bool8 a7)
{
    int i;
    int offset;
    struct ScanlineEffectParams params;
    u8 taskId;

    dp12_8087EA4();

    params.dmaDest = (void *)(REG_ADDR_BG0HOFS + regOffset);
    params.dmaControl = SCANLINE_EFFECT_DMACNT_16BIT;
    params.unk8 = 1;
    params.unk9 = 0;
    ScanlineEffect_SetParams(params);

    taskId = CreateTask(TaskFunc_UpdateWavePerFrame, 0);

    gTasks[taskId].tStartLine      = startLine;
    gTasks[taskId].tEndLine        = endLine;
    gTasks[taskId].data[2]         = 256 / frequency;
    gTasks[taskId].data[3]         = 0;
    gTasks[taskId].framesUntilMove = delayInterval;
    gTasks[taskId].tDelayInterval  = delayInterval;
    gTasks[taskId].tRegOffset      = regOffset;
    gTasks[taskId].data[7]         = a7;

    gScanlineEffect.taskId = taskId;
    gUnknown_0202FFA4 = 0;

    GenerateWave(&gScanlineEffectRegBuffers[0][320], frequency, amplitude, endLine - startLine);

    offset = 320;

    for (i = startLine; i < endLine; i++)
    {
        gScanlineEffectRegBuffers[0][i] = gScanlineEffectRegBuffers[0][offset];
        gScanlineEffectRegBuffers[1][i] = gScanlineEffectRegBuffers[0][offset];
        offset++;
    }

    return taskId;
}
