#include "global.h"
#include "data2.h"
#include "task.h"
#include "trig.h"
#include "unknown_task.h"

struct UnknownStruct1
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

static void sub_80896F4(void);
static void sub_8089714(void);

extern u16 gUnknown_030041B0;
extern u16 gUnknown_030041B4;
extern u16 gUnknown_030041B8;
extern u16 gUnknown_03004280;
extern u16 gUnknown_03004288;
extern u16 gUnknown_030042A0;
extern u16 gUnknown_030042A4;
extern u16 gUnknown_030042C0;

extern u8 gUnknown_0202FFA4;

extern struct UnknownStruct1 gUnknown_03004DC0;

extern u16 gUnknown_03004DE0[][0x3C0];

void remove_some_task(void)
{
    gUnknown_03004DC0.unk15 = 0;
    DmaStop(0);
    if (gUnknown_03004DC0.taskId != 0xFF)
    {
        DestroyTask(gUnknown_03004DC0.taskId);
        gUnknown_03004DC0.taskId = 0xFF;
    }
}

void dp12_8087EA4(void)
{
    CpuFill16(0, gUnknown_03004DE0, 0x780 * 2);
    gUnknown_03004DC0.src[0] = 0;
    gUnknown_03004DC0.src[1] = 0;
    gUnknown_03004DC0.dest = 0;
    gUnknown_03004DC0.unkC = 0;
    gUnknown_03004DC0.srcBank = 0;
    gUnknown_03004DC0.unk15 = 0;
    gUnknown_03004DC0.unk16 = 0;
    gUnknown_03004DC0.unk17 = 0;
    gUnknown_03004DC0.taskId = 0xFF;
}

void sub_80895F8(struct UnknownTaskStruct unk)
{
    if (unk.control == (((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | 1))
    {
        gUnknown_03004DC0.src[0] = &gUnknown_03004DE0[0][1];
        gUnknown_03004DC0.src[1] = &gUnknown_03004DE0[1][1];
        gUnknown_03004DC0.unk10 = sub_80896F4;
    }
    else
    {
        gUnknown_03004DC0.src[0] = &gUnknown_03004DE0[0][2];
        gUnknown_03004DC0.src[1] = &gUnknown_03004DE0[1][2];
        gUnknown_03004DC0.unk10 = sub_8089714;
    }

    gUnknown_03004DC0.unkC = unk.control;
    gUnknown_03004DC0.dest = unk.dest;
    gUnknown_03004DC0.unk15 = unk.unk8;
    gUnknown_03004DC0.unk16 = unk.unk9;
    gUnknown_03004DC0.unk17 = unk.unk9;
}

void sub_8089668(void)
{
    if (gUnknown_03004DC0.unk15)
    {
        if (gUnknown_03004DC0.unk15 == 3)
        {
            gUnknown_03004DC0.unk15 = 0;
            DmaStop(0);
            gUnknown_0202FFA4 = 1;
        }
        else
        {
            DmaStop(0);
            DmaSet(0, gUnknown_03004DC0.src[gUnknown_03004DC0.srcBank], gUnknown_03004DC0.dest, gUnknown_03004DC0.unkC);
            gUnknown_03004DC0.unk10();
            gUnknown_03004DC0.srcBank ^= 1;
        }
    }
}

static void sub_80896F4(void)
{
    u16 *dest = (u16 *)gUnknown_03004DC0.dest;
    u16 *src = (u16 *)&gUnknown_03004DE0[gUnknown_03004DC0.srcBank];
    *dest = *src;
}

static void sub_8089714(void)
{
    u32 *dest = (u32 *)gUnknown_03004DC0.dest;
    u32 *src = (u32 *)&gUnknown_03004DE0[gUnknown_03004DC0.srcBank];
    *dest = *src;
}

static void task00_for_dp12(u8 taskId)
{
    int value = 0;

    if (gUnknown_0202FFA4)
    {
        DestroyTask(taskId);
        gUnknown_03004DC0.taskId = 0xFF;
    }
    else
    {
        if (gTasks[taskId].data[7])
        {
            switch (gTasks[taskId].data[6])
            {
            case 0x0:
                value = gUnknown_030042A4;
                break;
            case 0x2:
                value = gUnknown_030042A0;
                break;
            case 0x4:
                value = gUnknown_030042C0;
                break;
            case 0x6:
                value = gUnknown_030041B4;
                break;
            case 0x8:
                value = gUnknown_03004288;
                break;
            case 0xA:
                value = gUnknown_03004280;
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
                gUnknown_03004DE0[gUnknown_03004DC0.srcBank][i] = gUnknown_03004DE0[0][offset] + value;
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
                gUnknown_03004DE0[gUnknown_03004DC0.srcBank][i] = gUnknown_03004DE0[0][offset] + value;
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

static void sub_80898FC(u16 *a1, u8 a2, u8 a3, u8 a4)
{
    u16 i = 0;
    u8 offset = 0;

    while (i < 0x100)
    {
        a1[i] = (gSineTable[offset] * a3) / 256;
        offset += a2;
        i++;
    }
}

u8 sub_8089944(u8 a1, u8 a2, u8 a3, u8 a4, u8 a5, u8 a6, u8 a7)
{
    int i;
    int offset;
    struct UnknownTaskStruct unk;
    u8 taskId;

    dp12_8087EA4();

    unk.dest = (void *)(REG_ADDR_BG0HOFS + a6);
    unk.control = ((DMA_ENABLE | DMA_START_HBLANK | DMA_REPEAT | DMA_DEST_RELOAD) << 16) | 1;
    unk.unk8 = 1;
    unk.unk9 = 0;

    sub_80895F8(unk);

    taskId = CreateTask(task00_for_dp12, 0);

    gTasks[taskId].data[0] = a1;
    gTasks[taskId].data[1] = a2;
    gTasks[taskId].data[2] = 256 / a3;
    gTasks[taskId].data[3] = 0;
    gTasks[taskId].data[4] = a5;
    gTasks[taskId].data[5] = a5;
    gTasks[taskId].data[6] = a6;
    gTasks[taskId].data[7] = a7;

    gUnknown_03004DC0.taskId = taskId;
    gUnknown_0202FFA4 = 0;

    sub_80898FC(&gUnknown_03004DE0[0][320], a3, a4, a2 - a1);

    offset = 320;

    for (i = a1; i < a2; i++)
    {
        gUnknown_03004DE0[0][i] = gUnknown_03004DE0[0][offset];
        gUnknown_03004DE0[1][i] = gUnknown_03004DE0[0][offset];
        offset++;
    }

    return taskId;
}
