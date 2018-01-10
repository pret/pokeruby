#include "global.h"
#include "data2.h"
#include "task.h"
#include "trig.h"
#include "scanline_effect.h"

// Control value to ransfer a single 16-bit value at HBlank
#define HBLANK_DMA_CONTROL_16BIT (((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | 1)

static void sub_80896F4(void);
static void sub_8089714(void);

extern u16 gUnknown_030041B0;
extern u16 gBattle_BG1_Y;
extern u16 gUnknown_030041B8;
extern u16 gBattle_BG2_Y;
extern u16 gBattle_BG2_X;
extern u16 gBattle_BG0_Y;
extern u16 gBattle_BG0_X;
extern u16 gBattle_BG1_X;

extern u8 gUnknown_0202FFA4;

extern struct ScanlineEffect gScanlineEffect;

// Is this a struct?
extern u16 gUnknown_03004DE0[][0x3C0];

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
    CpuFill16(0, gUnknown_03004DE0, 0x780 * 2);
    gScanlineEffect.src[0] = 0;
    gScanlineEffect.src[1] = 0;
    gScanlineEffect.dest = 0;
    gScanlineEffect.unkC = 0;
    gScanlineEffect.srcBank = 0;
    gScanlineEffect.unk15 = 0;
    gScanlineEffect.unk16 = 0;
    gScanlineEffect.unk17 = 0;
    gScanlineEffect.taskId = 0xFF;
}

void sub_80895F8(struct UnknownTaskStruct unk)
{
    if (unk.control == HBLANK_DMA_CONTROL_16BIT)  // 16 bit
    {
        gScanlineEffect.src[0] = &gUnknown_03004DE0[0][1];
        gScanlineEffect.src[1] = &gUnknown_03004DE0[1][1];
        gScanlineEffect.unk10 = sub_80896F4;
    }
    else  // assume 32-bit
    {
        gScanlineEffect.src[0] = &gUnknown_03004DE0[0][2];
        gScanlineEffect.src[1] = &gUnknown_03004DE0[1][2];
        gScanlineEffect.unk10 = sub_8089714;
    }

    gScanlineEffect.unkC = unk.control;
    gScanlineEffect.dest = unk.dest;
    gScanlineEffect.unk15 = unk.unk8;
    gScanlineEffect.unk16 = unk.unk9;
    gScanlineEffect.unk17 = unk.unk9;
}

void ScanlineEffect_TransferDma(void)
{
    if (gScanlineEffect.unk15)
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
            DmaSet(0, gScanlineEffect.src[gScanlineEffect.srcBank], gScanlineEffect.dest, gScanlineEffect.unkC);
            gScanlineEffect.unk10();
            gScanlineEffect.srcBank ^= 1;
        }
    }
}

static void sub_80896F4(void)
{
    u16 *dest = (u16 *)gScanlineEffect.dest;
    u16 *src = (u16 *)&gUnknown_03004DE0[gScanlineEffect.srcBank];
    *dest = *src;
}

static void sub_8089714(void)
{
    u32 *dest = (u32 *)gScanlineEffect.dest;
    u32 *src = (u32 *)&gUnknown_03004DE0[gScanlineEffect.srcBank];
    *dest = *src;
}

static void task00_for_dp12(u8 taskId)
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
            switch (gTasks[taskId].data[6])
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
        if (gTasks[taskId].data[4])
        {
            int i;
            int offset;
            gTasks[taskId].data[4]--;
            offset = gTasks[taskId].data[3] + 320;
            for (i = gTasks[taskId].data[0]; i < gTasks[taskId].data[1]; i++)
            {
                gUnknown_03004DE0[gScanlineEffect.srcBank][i] = gUnknown_03004DE0[0][offset] + value;
                offset++;
            }
        }
        else
        {
            int i;
            int offset;
            gTasks[taskId].data[4] = gTasks[taskId].data[5];
            offset = gTasks[taskId].data[3] + 320;
            for (i = gTasks[taskId].data[0]; i < gTasks[taskId].data[1]; i++)
            {
                gUnknown_03004DE0[gScanlineEffect.srcBank][i] = gUnknown_03004DE0[0][offset] + value;
                offset++;
            }
            gTasks[taskId].data[3]++;
            if (gTasks[taskId].data[3] == gTasks[taskId].data[2])
            {
                gTasks[taskId].data[3] = 0;
            }
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

u8 ScanlineEffect_InitWave(u8 a1, u8 a2, u8 frequency, u8 amplitude, u8 a5, u8 a6, u8 a7)
{
    int i;
    int offset;
    struct UnknownTaskStruct unk;
    u8 taskId;

    dp12_8087EA4();

    unk.dest = (void *)(REG_ADDR_BG0HOFS + a6);
    unk.control = HBLANK_DMA_CONTROL_16BIT;
    unk.unk8 = 1;
    unk.unk9 = 0;

    sub_80895F8(unk);

    taskId = CreateTask(task00_for_dp12, 0);

    gTasks[taskId].data[0] = a1;
    gTasks[taskId].data[1] = a2;
    gTasks[taskId].data[2] = 256 / frequency;
    gTasks[taskId].data[3] = 0;
    gTasks[taskId].data[4] = a5;
    gTasks[taskId].data[5] = a5;
    gTasks[taskId].data[6] = a6;
    gTasks[taskId].data[7] = a7;

    gScanlineEffect.taskId = taskId;
    gUnknown_0202FFA4 = 0;

    GenerateWave(&gUnknown_03004DE0[0][320], frequency, amplitude, a2 - a1);

    offset = 320;

    for (i = a1; i < a2; i++)
    {
        gUnknown_03004DE0[0][i] = gUnknown_03004DE0[0][offset];
        gUnknown_03004DE0[1][i] = gUnknown_03004DE0[0][offset];
        offset++;
    }

    return taskId;
}
