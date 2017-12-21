#include "global.h"
#include "random.h"
#include "sound.h"
#include "main.h"
#include "slot_machine.h"
#include "decompress.h"
#include "palette.h"
#include "task.h"
#include "util.h"
#include "text.h"
#include "menu.h"
#include "ewram.h"

struct UnkStruct1 {
    /*0x00*/ u8 unk00;
    /*0x01*/ u8 unk01;
    /*0x02*/ s16 unk02;
};

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

void sub_81018B8(void);
void sub_8101954(void);
void sub_81019B0(u8 arg0, void *ptr);
void nullsub_67(u8 taskId);
void sub_8101A28(void);
void sub_8101A44(void);
void sub_8101A8C(void);
void sub_8101AE0(void);
void sub_8101B04(void);
void sub_8101BA4(void);
void sub_8101C84(void);
void sub_8101CA0(void);
void sub_8101CC0(void);
void sub_8101CD4(void);
void sub_8101CEC(void);
void sub_8101D04(void);
void sub_8101D24(u8 taskId);

void sub_8102DA8(void);
void sub_8103DC8(void);
void sub_8104048(void);
void sub_810423C(u8 a0);
void sub_8104C5C(void);
void sub_8104EA8(void);
void sub_8104F8C(void);
void sub_81050C4(void);
void sub_8106448(void);
void sub_81064B8(void);
void sub_81063C0(void);

void PlaySlotMachine(u8 arg0, void *ptr)
{
    sub_81019B0(arg0, ptr);
    SetMainCallback2(sub_81018B8);
}

void sub_81018B8(void)
{
    switch (gMain.state)
    {
        case 0:
            sub_8101A28();
            sub_8101BA4();
            gMain.state++;
            break;
        case 1:
            sub_8101A8C();
            gMain.state++;
            break;
        case 2:
            sub_8101AE0();
            sub_8101B04();
            gMain.state++;
            break;
        case 3:
            sub_8101C84();
            gMain.state++;
            break;
        case 4:
            sub_8101CA0();
            gMain.state++;
            break;
        case 5:
            sub_8101CC0();
            gMain.state++;
            break;
        case 6:
            sub_8101CD4();
            sub_8101CEC();
            sub_8101A44();
            SetMainCallback2(sub_8101954);
            break;
    }
}

void sub_8101954(void)
{
    RunTasks();
    AnimateSprites();
    BuildOamBuffer();
    UpdatePaletteFade();
}

void sub_810196C(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    REG_WIN0H = eSlotMachine->win0h;
    REG_WIN0V = eSlotMachine->win0v;
    REG_WININ = eSlotMachine->winIn;
    REG_WINOUT = eSlotMachine->winOut;
}

void sub_81019B0(u8 arg0, void *ptr)
{
    struct Task *task = &gTasks[CreateTask(nullsub_67, 0xFF)];
    task->data[0] = arg0;
    StoreWordInTwoHalfwords(task->data + 1, (intptr_t)ptr);
}

void sub_81019EC(void)
{
    struct Task *task = &gTasks[FindTaskIdByFunc(nullsub_67)];
    eSlotMachine->unk01 = task->data[0];
    LoadWordFromTwoHalfwords((u16 *)(task->data + 1), (u32 *)&eSlotMachine->unk64);
}

void nullsub_67(u8 taskId)
{
}

void sub_8101A28(void)
{
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
    REG_DISPCNT = 0;
}

void sub_8101A44(void)
{
    u16 imeBak;
    SetVBlankCallback(sub_810196C);
    imeBak = REG_IME;
    REG_IME = 0;
    REG_IE |= INTR_FLAG_VBLANK;
    REG_IME = imeBak;
    REG_DISPSTAT |= DISPSTAT_VBLANK_INTR;
    REG_DISPCNT = DISPCNT_OBJ_1D_MAP | DISPCNT_BG_ALL_ON | DISPCNT_OBJ_ON | DISPCNT_WIN0_ON;
}

void sub_8101A8C(void)
{
    DmaClearLarge16(3, (u16 *)(BG_VRAM), BG_VRAM_SIZE, 0x1000);
}

void sub_8101AE0(void)
{
    DmaClear16(3, (u16 *)OAM, OAM_SIZE);
}

void sub_8101B04(void)
{
    REG_BG0CNT = 0;
    REG_BG1CNT = 0;
    REG_BG2CNT = 0;
    REG_BG3CNT = 0;
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG3HOFS = 0;
    REG_BG3VOFS = 0;
    REG_BG0CNT = BGCNT_PRIORITY(0) | BGCNT_SCREENBASE(31) | BGCNT_CHARBASE(2);
    REG_BG1CNT = BGCNT_PRIORITY(1) | BGCNT_SCREENBASE(28);
    REG_BG2CNT = BGCNT_PRIORITY(2) | BGCNT_SCREENBASE(29);
    REG_BG3CNT = BGCNT_PRIORITY(2) | BGCNT_SCREENBASE(30);
    REG_WININ = 0x3f;
    REG_WINOUT = 0x3f;
    REG_BLDCNT = BLDCNT_TGT1_BG3 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_OBJ;
    REG_BLDALPHA = 0x809;
}

extern const s16 gUnknown_083ECCF8[3][2];

void sub_8101BA4(void)
{
    u8 i;

    sub_81019EC();
    eSlotMachine->unk00 = 0;
    eSlotMachine->unk02 = 0;
    eSlotMachine->unk03 = Random() & 1;
    eSlotMachine->unk04 = 0;
    eSlotMachine->unk08 = 0;
    eSlotMachine->unk0A = 0;
    eSlotMachine->unk0B = 0;
    eSlotMachine->coins = gSaveBlock1.coins;
    eSlotMachine->unk0E = 0;
    eSlotMachine->unk10 = 0;
    eSlotMachine->unk12 = 0;
    eSlotMachine->unk18 = 0;
    eSlotMachine->unk1A = 8;
    eSlotMachine->win0h = 0xf0;
    eSlotMachine->win0v = 0xa0;
    eSlotMachine->winIn = 0x3f;
    eSlotMachine->winOut = 0x3f;
    eSlotMachine->backupMapMusic = GetCurrentMapMusic();
    for (i = 0; i < 3; i++)
    {
        eSlotMachine->unk22[i] = 0;
        eSlotMachine->unk28[i] = gUnknown_083ECCF8[i][eSlotMachine->unk03] % 21;
        eSlotMachine->unk1C[i] = 0x1f8 - eSlotMachine->unk28[i] * 24;
        eSlotMachine->unk1C[i] %= 0x1f8;
    }
}

void sub_8101C84(void)
{
    SetUpWindowConfig(&gWindowConfig_81E7128);
    InitMenuWindow(&gWindowConfig_81E7128);
}

void sub_8101CA0(void)
{
    ResetPaletteFade();
    ResetSpriteData();
    gOamLimit = 128;
    FreeAllSpritePalettes();
    ResetTasks();
}

void sub_8101CC0(void)
{
    sub_8106448();
    sub_81064B8();
    sub_81063C0();
}

void sub_8101CD4(void)
{
    sub_8104EA8();
    sub_8104F8C();
    sub_8103DC8();
    sub_81050C4();
}

void sub_8101CEC(void)
{
    sub_8104048();
    sub_8102DA8();
    sub_8104C5C();
    sub_8101D04();
}

extern bool8 (*const gUnknown_083ECAAC[])(struct Task *task);

void sub_8101D04(void)
{
    sub_8101D24(CreateTask(sub_8101D24, 0));
}

void sub_8101D24(u8 taskId)
{
    while (gUnknown_083ECAAC[eSlotMachine->unk00](gTasks + taskId));
}

bool8 sub_8101D5C(struct Task *task)
{
    BeginNormalPaletteFade(-1, 0, 16, 0, 0);
    sub_810423C(eSlotMachine->unk02);
    eSlotMachine->unk00++;
    return FALSE;
}

bool8 sub_8101D8C(struct Task *task)
{
    if (!gPaletteFade.active)
    {
        eSlotMachine->unk00++;
    }
    return FALSE;
}

asm(".section .text_a");

static void LoadSlotMachineWheelOverlay(void);

void sub_8104CAC(u8 arg0) {
    u8 i;
    struct Task *task;

    sub_8104DA4();

    task = &gTasks[eSlotMachine->unk3D];
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

    LZDecompressWram(gSlotMachine_Gfx, ewram10000_2);

    offsetRead = (u32)ewram10000_2;
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
    CpuCopy16(gUnknown_08E95AB8, BG_SCREEN_ADDR(29), 20 * 32 * 2);
    LoadSlotMachineWheelOverlay();
}

static void LoadSlotMachineWheelOverlay(void) {
    s16 x, y, dx;
    u16 *screen;

    screen = BG_SCREEN_ADDR(30);

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
    u16 *vram = BG_SCREEN_ADDR(29);

    vram[15 * 32 + arg0] = arg1;
    vram[15 * 32 + 1 + arg0] = arg2;
    vram[16 * 32 + arg0] = arg3;
    vram[16 * 32 + 1 + arg0] = arg4;
}

void sub_81065DC(void) {
    s16 y, x;
    u16 *screen;

    CpuCopy16(gUnknown_08E95FB8, BG_SCREEN_ADDR(29), 20 * 32 * 2);

    screen = BG_SCREEN_ADDR(30);
    for (y = 0; y < 20; y++)
    {
        for (x = 0; x < 30; x++)
        {
            screen[x + y * 32] = 0;
        }
    }
}
