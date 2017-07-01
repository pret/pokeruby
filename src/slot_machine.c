#include "global.h"
#include "slot_machine.h"
#include "decompress.h"
#include "palette.h"
#include "task.h"

struct UnkStruct2000000 {
    /*0x00*/ u8 filler00[61];
    /*0x3D*/ u8 unk3D;
};

struct UnkStruct1 {
    /*0x00*/ u8 unk00;
    /*0x01*/ u8 unk01;
    /*0x02*/ s16 unk02;
};

extern struct UnkStruct2000000 unk_2000000;

extern struct UnkStruct1 *gUnknown_083ED048[];
extern const u16 gPalette_83EDE24[];

extern const u8 gSlotMachine_Gfx[];
#if ENGLISH
#define SLOTMACHINE_GFX_TILES 233
#elif GERMAN
#define SLOTMACHINE_GFX_TILES 236
#endif

extern const u16 gUnknown_08E95A18[];

extern u16 gUnknown_08E95AB8[];
extern u16 gUnknown_08E95FB8[];

static void LoadSlotMachineWheelOverlay(void);

void sub_8104CAC(u8 arg0) {
    u8 i;
    struct Task *task;

    sub_8104DA4();

    task = &gTasks[unk_2000000.unk3D];
    task->data[1] = arg0;

    i = 0;
    while (gUnknown_083ED048[arg0][i].unk00 != 0xFF)
    {
        u8 spriteId;
        spriteId = sub_8105BB4(
                gUnknown_083ED048[arg0][i].unk00,
                gUnknown_083ED048[arg0][i].unk01,
                gUnknown_083ED048[arg0][i].unk02
        );
        task->data[4 + i] = spriteId;

#ifdef GERMAN
        if (arg0 == 5 && i <= 2)
        {
            gSprites[spriteId].invisible = TRUE;
        }
#endif

        i += 1;
    }
}

asm(".section .text_b");

void sub_8106448(void) {
    u32 offsetRead, offsetWrite;
    u32 size;

    sub_800D238(gSlotMachine_Gfx, (void *) 0x02010000);

    offsetRead = 0x02010000;
    offsetWrite = BG_VRAM;
    size = SLOTMACHINE_GFX_TILES * 32;
    while (TRUE)
    {
        DmaCopy16(3, offsetRead, (void *) (offsetWrite), 0x1000);
        offsetRead += 0x1000;
        offsetWrite += 0x1000;
        size -= 0x1000;
        if (size <= 0x1000)
        {
            DmaCopy16(3, offsetRead, (void *) (offsetWrite), size);
            break;
        }
    }

    LoadPalette(gUnknown_08E95A18, 0, 160);
    LoadPalette(gPalette_83EDE24, 208, 32);
}

void sub_81064B8(void) {
    CpuCopy16(gUnknown_08E95AB8, (void *) BG_SCREEN_ADDR(29), 20 * 32 * 2);
    LoadSlotMachineWheelOverlay();
}

static void LoadSlotMachineWheelOverlay(void) {
    s16 x, y, dx;
    u16 *screen;

    screen = (u16 *) BG_SCREEN_ADDR(30);

    for (x = 4; x < 18; x += 5)
    {
        for (dx = 0; dx < 4; dx++)
        {
            screen[5 * 32 + dx + x] = 0x2051;
            screen[13 * 32 + dx + x] = 0x2851;
            screen[6 * 32 + dx + x] = 0x2061;
            screen[12 * 32 + dx + x] = 0x2861;
        }

        screen[6 * 32 + x] = 0x20BE;
        screen[12 * 32 + x] = 0x28BE;

        for (y = 7; y <= 11; y++)
        {
            screen[y * 32 + x] = 0x20BF;
        }
    }
}

void sub_81065A8(s16 arg0, u16 arg1, u16 arg2, u16 arg3, u16 arg4) {
    u16 *vram = (u16 *) BG_SCREEN_ADDR(29);

    vram[15 * 32 + arg0] = arg1;
    vram[15 * 32 + 1 + arg0] = arg2;
    vram[16 * 32 + arg0] = arg3;
    vram[16 * 32 + 1 + arg0] = arg4;
}

void sub_81065DC(void) {
    s16 y, x;
    u16 *screen;

    CpuCopy16(gUnknown_08E95FB8, (void *) BG_SCREEN_ADDR(29), 20 * 32 * 2);

    screen = (u16 *) BG_SCREEN_ADDR(30);
    for (y = 0; y < 20; y++)
    {
        for (x = 0; x < 30; x++)
        {
            screen[x + y * 32] = 0;
        }
    }
}
