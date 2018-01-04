#include "global.h"
#include "constants/songs.h"
#include "strings2.h"
#include "overworld.h"
#include "menu_cursor.h"
#include "field_effect.h"
#include "random.h"
#include "sound.h"
#include "main.h"
#include "slot_machine.h"
#include "decompress.h"
#include "trig.h"
#include "graphics.h"
#include "palette.h"
#include "util.h"
#include "text.h"
#include "menu.h"
#include "ewram.h"

struct UnkStruct1 {
    /*0x00*/ u8 unk00;
    /*0x01*/ u8 unk01;
    /*0x02*/ s16 unk02;
};

#if ENGLISH
#define SLOTMACHINE_GFX_TILES 233
#elif GERMAN
#define SLOTMACHINE_GFX_TILES 236
#endif


static void sub_81018B8(void);
static void sub_8101954(void);
static void sub_81019B0(u8 arg0, void *ptr);
static void nullsub_67(u8 taskId);
static void sub_8101A28(void);
static void sub_8101A44(void);
static void sub_8101A8C(void);
static void sub_8101AE0(void);
static void sub_8101B04(void);
static void sub_8101BA4(void);
static void sub_8101C84(void);
static void sub_8101CA0(void);
static void sub_8101CC0(void);
static void sub_8101CD4(void);
static void sub_8101CEC(void);
static void sub_8101D04(void);
static void sub_8101D24(u8 taskId);
static bool8 sub_8101D5C(struct Task *task);
static bool8 sub_8101D8C(struct Task *task);
static bool8 sub_8101DB0(struct Task *task);
static bool8 sub_8101DF4(struct Task *task);
static bool8 sub_8101E10(struct Task *task);
static bool8 sub_8101E3C(struct Task *task);
static bool8 sub_8101F44(struct Task *task);
static bool8 sub_8101F60(struct Task *task);
static bool8 sub_8101F88(struct Task *task);
static bool8 sub_8101FA4(struct Task *task);
static bool8 sub_8102008(struct Task *task);
static bool8 sub_8102034(struct Task *task);
static bool8 sub_8102058(struct Task *task);
static bool8 sub_8102090(struct Task *task);
static bool8 sub_81020C8(struct Task *task);
static bool8 sub_81021E0(struct Task *task);
static bool8 sub_81021FC(struct Task *task);
static bool8 sub_8102264(struct Task *task);
static bool8 sub_81022A0(struct Task *task);
static bool8 sub_81022CC(struct Task *task);
static bool8 sub_81022F0(struct Task *task);
static bool8 sub_8102318(struct Task *task);
static bool8 sub_8102344(struct Task *task);
static bool8 sub_810239C(struct Task *task);
static bool8 sub_81023B8(struct Task *task);
static bool8 sub_81023E0(struct Task *task);
static bool8 sub_81023FC(struct Task *task);
static bool8 sub_8102424(struct Task *task);
static bool8 sub_8102460(struct Task *task);
static void sub_8102484(void);
static void sub_81024F0(void);
static bool8 sub_8102540(void);
static u8 sub_8102578(void);
u16 dp15_jump_random_unknown(void);
static u8 sub_81025BC(void);
static void sub_81027A0(void);
static void sub_81027D0(void);
static void sub_8102840(void);
static void sub_810290C(void);
static u8 sub_81029D4(u8 c1, u8 c2, u8 c3);
static void sub_8102A24(void);
static void sub_8102A64(u8 taskId);
static bool8 sub_8102A44(void);
bool8 sub_8102A9C(struct Task *task);
bool8 sub_8102AD0(struct Task *task);
bool8 sub_8102B80(struct Task *task);
u8 sub_8102BA4(u8 x, s16 y);
static void sub_8102DA8(void);
static void sub_8102DEC(u8 a0);
static void sub_8102E1C(u8 a0);
static bool8 sub_8102E40(u8 a0);
static void sub_8102E68(u8 taskId);
bool8 sub_8102EA0(struct Task *task);
bool8 sub_8102EA4(struct Task *task);
bool8 sub_8102EC0(struct Task *task);
bool8 sub_8102F4C(struct Task *task);
bool8 sub_8103008(struct Task *task);
bool8 sub_810305C(void);
bool8 sub_8103154(u8 a0, u8 a1);
bool8 sub_81031B4(u8 a0, u8 a1);
bool8 sub_81032C0(void);
bool8 sub_81032E8(void);
bool8 sub_810333C(void);
bool8 sub_81033DC(void);
bool8 sub_810341C(u8 a0);
bool8 sub_810347C(u8 a0);
void sub_81034F4(void);
void sub_8103540(void);
void sub_8103564(void);
void j5_08111E84(void);
void sub_8103668(void);
void sub_810380C(void);
void sub_8103830(void);
void sub_8103910(void);
void sub_8103A78(void);
static void sub_8103C14(u8 a0);
static void sub_8103C48(u8 taskId);
static void sub_8103D50(u8 a0);
void sub_8103C78(struct Task *task, u8 taskId);
void sub_8103CAC(struct Task *task, u8 taskId);
void sub_8103CC8(struct Task *task, u8 taskId);
static void sub_8103D8C(u8 a0);
static void sub_8103DC8(void);
static void sub_8103E04(u8 a0);
static bool8 sub_8103E38(void);
static bool8 sub_8103E7C(void);
static bool8 sub_8103EAC(u8 spriteId);
static void sub_8103EE4(struct Sprite *sprite);
static void sub_8103F70(void);
static bool8 sub_8103FA0(void);
static void sub_8103FE8(u8 taskId);
static void sub_8104048(void);
static void sub_8104064(u8 unused);
bool8 sub_81040C8(void);
static void sub_81040E8(u8 taskId);
void nullsub_68(struct Task *task);
void sub_810411C(struct Task *task);
void sub_8104144(struct Task *task);
void sub_81041AC(struct Task *task);
static void sub_810421C(struct Task *task);
void sub_810423C(u8 a0);
static void sub_810430C(void);
static bool8 sub_810432C(void);
void sub_810434C(u8 taskId);
void sub_810437C(struct Task *task);
void sub_81043EC(struct Task *task);
void sub_8104468(struct Task *task);
void sub_8104498(struct Task *task);
void sub_8104548(struct Task *task);
void sub_8104598(struct Task *task);
void sub_81045CC(struct Task *task);
void sub_810463C(struct Task *task);
void sub_81046C0(struct Task *task);
void sub_8104764(struct Task *task);
void sub_8104794(struct Task *task);
void sub_81047EC(struct Task *task);
void sub_8104860(struct Task *task);
void sub_81048A8(struct Task *task);
void sub_81048CC(struct Task *task);
void sub_8104940(struct Task *task);
void sub_81049C8(struct Task *task);
void sub_81049F8(struct Task *task);
void sub_8104A40(s16 a0, s16 a1);
void sub_8104A88(s16 a0);
void sub_8104AB8(u8 a0);
bool8 sub_8104AEC(void);
void sub_8104B0C(u8 taskId);
void sub_8104B3C(struct Task *task);
void sub_8104B60(struct Task *task);
void sub_8104B80(struct Task *task);
void sub_8104BC8(struct Task *task);
void sub_8104BFC(struct Task *task);
void sub_8104C44(struct Task *task);
void sub_8104C5C(void);
void sub_8104CAC(u8 arg0);
bool8 sub_8104E18(void);
void nullsub_69(struct Task *task);
void sub_8104E74(u8 taskId);
void sub_8104EA8(void);
void sub_8104F8C(void);
void sub_8104FF4(s16 x, s16 y, u8 a2, s16 a3);
void sub_81050C4(void);
void sub_8105100(void);
void sub_810514C(void);
void sub_81051C0(void);
void sub_8105284(void);
void sub_81052EC(void);
void sub_81053A0(void);
void sub_810545C(void);
void sub_81054B8(void);
void sub_8105524(void);
void sub_8105554(void);
void sub_8105578(void);
void sub_8105688(s16 a0);
void sub_81056C0(void);
void sub_81056F0(void);
void sub_81057E8(s16 a0);
void sub_8105804(void);
void sub_8105854(void);
void sub_81058A0(void);
void sub_81058C4(void);
void sub_81059B8(void);
void sub_81059E8(void);
bool8 sub_8105ACC(void);
void sub_8105AEC(void);
u8 sub_8105B1C(s16 x, s16 y);
void sub_8105B88(u8 spriteId);
u8 sub_8105BF8(u8 templateIdx, SpriteCallback callback, s16 x, s16 y, s16 a4);
void sub_81063C0(void);
void sub_8106404(void);
static void sub_8106448(void);
void sub_81064B8(void);
void sub_81065A8(s16 arg0, u16 arg1, u16 arg2, u16 arg3, u16 arg4);
void sub_81065DC(void);

const struct UnkStruct1 *const gUnknown_083ED048[];
extern const u16 gPalette_83EDE24[];
extern const u8 gSlotMachine_Gfx[];
extern const u16 gUnknown_08E95A18[];
extern const u16 gUnknown_08E95AB8[];
extern const u16 gUnknown_08E95FB8[];
const u8 gUnknown_083ECD04[][3];
const u8 gUnknown_083ECE3A[];
const u16 gUnknown_083ECE42[];
const u16 gUnknown_083ECE48[];

void PlaySlotMachine(u8 arg0, void *ptr)
{
    sub_81019B0(arg0, ptr);
    SetMainCallback2(sub_81018B8);
}

static void sub_81018B8(void)
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

static void sub_8101954(void)
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

static void sub_81019B0(u8 arg0, void *ptr)
{
    struct Task *task = &gTasks[CreateTask(nullsub_67, 0xFF)];
    task->data[0] = arg0;
    StoreWordInTwoHalfwords(task->data + 1, (intptr_t)ptr);
}

void sub_81019EC(void)
{
    struct Task *task = &gTasks[FindTaskIdByFunc(nullsub_67)];
    eSlotMachine->unk01 = task->data[0];
    LoadWordFromTwoHalfwords((u16 *)(task->data + 1), (u32 *)&eSlotMachine->prevMainCb);
}

static void nullsub_67(u8 taskId)
{
}

static void sub_8101A28(void)
{
    SetVBlankCallback(NULL);
    SetHBlankCallback(NULL);
    REG_DISPCNT = 0;
}

static void sub_8101A44(void)
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

static void sub_8101A8C(void)
{
    DmaClearLarge16(3, (u16 *)(BG_VRAM), BG_VRAM_SIZE, 0x1000);
}

static void sub_8101AE0(void)
{
    DmaClear16(3, (u16 *)OAM, OAM_SIZE);
}

static void sub_8101B04(void)
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

const s16 gUnknown_083ECCF8[][2];

static void sub_8101BA4(void)
{
    u8 i;

    sub_81019EC();
    eSlotMachine->state = 0;
    eSlotMachine->unk02 = 0;
    eSlotMachine->unk03 = Random() & 1;
    eSlotMachine->unk04 = 0;
    eSlotMachine->unk08 = 0;
    eSlotMachine->unk0A = 0;
    eSlotMachine->unk0B = 0;
    eSlotMachine->coins = gSaveBlock1.coins;
    eSlotMachine->unk0E = 0;
    eSlotMachine->unk10 = 0;
    eSlotMachine->bet = 0;
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

static void sub_8101C84(void)
{
    SetUpWindowConfig(&gWindowConfig_81E7128);
    InitMenuWindow(&gWindowConfig_81E7128);
}

static void sub_8101CA0(void)
{
    ResetPaletteFade();
    ResetSpriteData();
    gOamLimit = 128;
    FreeAllSpritePalettes();
    ResetTasks();
}

static void sub_8101CC0(void)
{
    sub_8106448();
    sub_81064B8();
    sub_81063C0();
}

static void sub_8101CD4(void)
{
    sub_8104EA8();
    sub_8104F8C();
    sub_8103DC8();
    sub_81050C4();
}

static void sub_8101CEC(void)
{
    sub_8104048();
    sub_8102DA8();
    sub_8104C5C();
    sub_8101D04();
}

static void sub_8101D04(void)
{
    sub_8101D24(CreateTask(sub_8101D24, 0));
}

static bool8 (*const gUnknown_083ECAAC[])(struct Task *task) = {
    sub_8101D5C,
    sub_8101D8C,
    sub_8101DB0,
    sub_8101DF4,
    sub_8101E10,
    sub_8101E3C,
    sub_8101F44,
    sub_8101F60,
    sub_8101F88,
    sub_8101FA4,
    sub_8102008,
    sub_8102034,
    sub_8102058,
    sub_8102090,
    sub_81020C8,
    sub_81021E0,
    sub_81021FC,
    sub_8102264,
    sub_81022A0,
    sub_81022CC,
    sub_81022F0,
    sub_8102318,
    sub_8102344,
    sub_810239C,
    sub_81023B8,
    sub_81023E0,
    sub_81023FC,
    sub_8102424,
    sub_8102460
};

static void sub_8101D24(u8 taskId)
{
    while (gUnknown_083ECAAC[eSlotMachine->state](gTasks + taskId));
}

static bool8 sub_8101D5C(struct Task *task)
{
    BeginNormalPaletteFade(-1, 0, 16, 0, 0);
    sub_810423C(eSlotMachine->unk02);
    eSlotMachine->state++;
    return FALSE;
}

static bool8 sub_8101D8C(struct Task *task)
{
    if (!gPaletteFade.active)
    {
        eSlotMachine->state++;
    }
    return FALSE;
}

static bool8 sub_8101DB0(struct Task *task)
{
    eSlotMachine->unk0E = 0;
    eSlotMachine->bet = 0;
    eSlotMachine->unk18 = 0;
    eSlotMachine->unk04 &= 0xc0;
    eSlotMachine->state = 4;
    if (eSlotMachine->coins <= 0)
    {
        eSlotMachine->state = 25;
    }
    else if (eSlotMachine->unk0A)
    {
        eSlotMachine->state = 3;
        sub_8104CAC(4);
    }
    return TRUE;
}

static bool8 sub_8101DF4(struct Task *task)
{
    if (sub_8104E18())
    {
        eSlotMachine->state = 4;
    }
    return FALSE;
}

static bool8 sub_8101E10(struct Task *task)
{
    sub_8104CAC(0);
    eSlotMachine->state = 5;
    if (eSlotMachine->coins >= 9999)
    {
        eSlotMachine->state = 23;
    }
    return TRUE;
}

static bool8 sub_8101E3C(struct Task *task)
{
    s16 i;

    if (gMain.newKeys & SELECT_BUTTON)
    {
        sub_8104AB8(0);
        eSlotMachine->state = 8;
    }
    else if (gMain.newKeys & R_BUTTON)
    {
        if (eSlotMachine->coins - (3 - eSlotMachine->bet) >= 0)
        {
            for (i = eSlotMachine->bet; i < 3; i++)
            {
                sub_8103D50(i);
            }
            eSlotMachine->coins -= (3 - eSlotMachine->bet);
            eSlotMachine->bet = 3;
            eSlotMachine->state = 9;
            PlaySE(SE_REGI);
        }
        else
        {
            eSlotMachine->state = 6;
        }
    }
    else
    {
        if (gMain.newKeys & DPAD_DOWN && eSlotMachine->coins != 0)
        {
            PlaySE(SE_REGI);
            sub_8103D50(eSlotMachine->bet);
            eSlotMachine->coins--;
            eSlotMachine->bet++;
        }
        if (eSlotMachine->bet >= 3 || (eSlotMachine->bet != 0 && gMain.newKeys & A_BUTTON))
        {
            eSlotMachine->state = 9;
        }
        if (gMain.newKeys & B_BUTTON)
        {
            eSlotMachine->state = 21;
        }
    }
    return FALSE;
}

void sub_8101F2C(const u8 *str)
{
    MenuDisplayMessageBox();
    MenuPrint(str, 2, 15);
}

static bool8 sub_8101F44(struct Task *task)
{
    sub_8101F2C(gOtherText_DontHaveThreeCoins);
    eSlotMachine->state = 7;
    return FALSE;
}

static bool8 sub_8101F60(struct Task *task)
{
    if (gMain.newKeys & (A_BUTTON | B_BUTTON))
    {
        MenuZeroFillScreen();
        eSlotMachine->state = 5;
    }
    return FALSE;
}

static bool8 sub_8101F88(struct Task *task)
{
    if (sub_8104AEC())
    {
        eSlotMachine->state = 5;
    }
    return FALSE;
}

static bool8 sub_8101FA4(struct Task *task)
{
    sub_8102484();
    sub_8104DA4();
    sub_8102DEC(0);
    sub_8102DEC(1);
    sub_8102DEC(2);
    task->data[0] = 0;
    if (eSlotMachine->unk04 & 0x20)
    {
        sub_810430C();
        eSlotMachine->state = 10;
    }
    else
    {
        sub_8104CAC(1);
        eSlotMachine->state = 11;
    }
    eSlotMachine->unk1A = 8;
    if (eSlotMachine->unk0A)
    {
        eSlotMachine->unk1A = dp15_jump_random_unknown();
    }
    return FALSE;
}

static bool8 sub_8102008(struct Task *task)
{
    if (sub_810432C())
    {
        sub_8104CAC(1);
        eSlotMachine->unk04 &= 0xDF;
        eSlotMachine->state = 11;
    }
    return FALSE;
}

static bool8 sub_8102034(struct Task *task)
{
    if (++task->data[0] >= 30)
    {
        sub_81024F0();
        eSlotMachine->state = 12;
    }
    return FALSE;
}

static bool8 sub_8102058(struct Task *task)
{
    if (gMain.newKeys & A_BUTTON)
    {
        PlaySE(SE_JYUNI);
        sub_8102E1C(eSlotMachine->unk18);
        sub_8103C14(eSlotMachine->unk18);
        eSlotMachine->state = 13;
    }
    return FALSE;
}

static bool8 sub_8102090(struct Task *task)
{
    if (!sub_8102E40(eSlotMachine->unk18))
    {
        eSlotMachine->unk18++;
        eSlotMachine->state = 12;
        if (eSlotMachine->unk18 > 2)
        {
            eSlotMachine->state = 14;
        }
        return TRUE;
    }
    return FALSE;
}

static bool8 sub_81020C8(struct Task *task)
{
    eSlotMachine->unk04 &= 0xc0;
    sub_81027A0();
    if (eSlotMachine->unk0A)
    {
        eSlotMachine->unk0A--;
        eSlotMachine->unk0B++;
    }
    if (eSlotMachine->unk08)
    {
        eSlotMachine->state = 15;
        sub_8102A24();
        sub_8103F70();
        if ((eSlotMachine->unk10 -= eSlotMachine->unk0E) < 0)
        {
            eSlotMachine->unk10 = 0;
        }
        if (eSlotMachine->unk08 & 0x180)
        {
            PlayFanfare(BGM_ME_B_BIG);
            sub_8104CAC(6);
        }
        else if (eSlotMachine->unk08 & 0x40)
        {
            PlayFanfare(BGM_ME_B_BIG);
            sub_8104CAC(5);
        }
        else
        {
            PlayFanfare(BGM_ME_B_SMALL);
            sub_8104CAC(2);
        }
        if (eSlotMachine->unk08 & 0x1c0)
        {
            eSlotMachine->unk04 &= 0x3f;
            if (eSlotMachine->unk08 & 0x180)
            {
                eSlotMachine->unk0A = 0;
                eSlotMachine->unk0B = 0;
                eSlotMachine->unk03 = 0;
                if (eSlotMachine->unk08 & 0x100)
                {
                    eSlotMachine->unk03 = 1;
                }
            }
        }
        if (eSlotMachine->unk08 & 0x20 && eSlotMachine->unk02 < 16)
        {
            eSlotMachine->unk02++;
            sub_8104064(eSlotMachine->unk02);
        }
    }
    else
    {
        sub_8104CAC(3);
        eSlotMachine->state = 20;
        if ((eSlotMachine->unk10 += eSlotMachine->bet) > 9999)
        {
            eSlotMachine->unk10 = 9999;
        }
    }
    return FALSE;
}

static bool8 sub_81021E0(struct Task *task)
{
    if (sub_8102A44())
    {
        eSlotMachine->state = 16;
    }
    return FALSE;
}

static bool8 sub_81021FC(struct Task *task)
{
    if (sub_8103FA0())
    {
        eSlotMachine->state = 19;
        if (eSlotMachine->unk08 & 0x180)
        {
            IncrementGameStat(GAME_STAT_SLOT_JACKPOTS);
        }
        if (eSlotMachine->unk08 & 0x04)
        {
            eSlotMachine->unk18 = 0;
            eSlotMachine->state = 9;
        }
        if (eSlotMachine->unk08 & 0x20)
        {
            eSlotMachine->state = 17;
        }
        if (eSlotMachine->unk0A && eSlotMachine->unk08 & 0x04)
        {
            sub_8104CAC(4);
            eSlotMachine->state = 18;
        }
    }
    return FALSE;
}

static bool8 sub_8102264(struct Task *task)
{
    if (!sub_81040C8())
    {
        eSlotMachine->state = 19;
        if (eSlotMachine->unk08 & 0x04)
        {
            eSlotMachine->state = 9;
            if (eSlotMachine->unk0A)
            {
                sub_8104CAC(4);
                eSlotMachine->state = 18;
            }
        }
    }
    return FALSE;
}

static bool8 sub_81022A0(struct Task *task)
{
    if (sub_8104E18())
    {
        eSlotMachine->state = 19;
        if (eSlotMachine->unk08 & 0x04)
        {
            eSlotMachine->state = 9;
        }
    }
    return FALSE;
}

static bool8 sub_81022CC(struct Task *task)
{
    sub_8103D8C(0);
    sub_8103D8C(1);
    sub_8103D8C(2);
    eSlotMachine->state = 2;
    return FALSE;
}

static bool8 sub_81022F0(struct Task *task)
{
    if (++task->data[1] > 64)
    {
        task->data[1] = 0;
        eSlotMachine->state = 19;
    }
    return FALSE;
}

static bool8 sub_8102318(struct Task *task)
{
    sub_8101F2C(gOtherText_QuitGamePrompt);
    DisplayYesNoMenu(21, 7, 1);
    sub_814AB84();
    eSlotMachine->state = 22;
    return FALSE;
}

static bool8 sub_8102344(struct Task *task)
{
    s8 input = ProcessMenuInputNoWrap_();
    if (input == 0)
    {
        MenuZeroFillScreen();
        sub_8103D8C(0);
        sub_8103D8C(1);
        sub_8103D8C(2);
        eSlotMachine->coins += eSlotMachine->bet;
        eSlotMachine->state = 27;
    }
    else if (input == 1 || input == -1)
    {
        MenuZeroFillScreen();
        eSlotMachine->state = 5;
    }
    return FALSE;
}

static bool8 sub_810239C(struct Task *task)
{
    sub_8101F2C(gOtherText_MaxCoins);
    eSlotMachine->state = 24;
    return FALSE;
}

static bool8 sub_81023B8(struct Task *task)
{
    if (gMain.newKeys & (A_BUTTON | B_BUTTON))
    {
        MenuZeroFillScreen();
        eSlotMachine->state = 5;
    }
    return FALSE;
}

static bool8 sub_81023E0(struct Task *task)
{
    sub_8101F2C(gOtherText_OutOfCoins);
    eSlotMachine->state = 26;
    return FALSE;
}

static bool8 sub_81023FC(struct Task *task)
{
    if (gMain.newKeys & (A_BUTTON | B_BUTTON))
    {
        MenuZeroFillScreen();
        eSlotMachine->state = 27;
    }
    return FALSE;
}

static bool8 sub_8102424(struct Task *task)
{
    gSaveBlock1.coins = eSlotMachine->coins;
    BeginNormalPaletteFade(-1, 0, 0, 16, 0);
    eSlotMachine->state++;
    return FALSE;
}

static bool8 sub_8102460(struct Task *task)
{
    if (!gPaletteFade.active)
    {
        SetMainCallback2(eSlotMachine->prevMainCb);
    }
    return FALSE;
}

static void sub_8102484(void)
{
    u8 r3;

    if (eSlotMachine->unk0A == 0 && !(eSlotMachine->unk04 & 0xc0))
    {
        if (sub_8102540())
        {
            r3 = sub_8102578();
            if (r3 != 3)
            {
                eSlotMachine->unk04 |= gUnknown_083ECE42[r3];
                if (r3 != 1)
                {
                    return;
                }
            }
        }
        r3 = sub_81025BC();
        if (r3 != 5)
        {
            eSlotMachine->unk04 |= gUnknown_083ECE48[r3];
        }
    }
}

static void sub_81024F0(void)
{
    eSlotMachine->unk06 = 0;
    if (eSlotMachine->unk04)
    {
        eSlotMachine->unk06 = 1;
    }
}

u8 sub_810250C(u8 a0)
{
    u8 i;

    for (i = 0; i < 8; i++)
    {
        if (a0 & 1)
        {
            return gUnknown_083ECE3A[i];
        }
        a0 >>= 1;
    }
    return 0;
}

static bool8 sub_8102540(void)
{
    u8 rval = Random();
    if (gUnknown_083ECD04[eSlotMachine->unk01][eSlotMachine->bet - 1] > rval)
    {
        return TRUE;
    }
    return FALSE;
}

const u8 gUnknown_083ECD16[][6];

static u8 sub_8102578(void)
{
    s16 i;

    for (i = 0; i < 3; i++)
    {
        s16 rval = Random() & 0xff;
        s16 value = gUnknown_083ECD16[i][eSlotMachine->unk01];
        if (value > rval)
        {
            break;
        }
    }
    return i;
}

const u8 gUnknown_083ECD28[][6];

static u8 sub_81025BC(void)
{
    s16 i;

    for (i = 0; i < 5; i++)
    {
        s16 rval = Random() & 0xff;
        s16 r3 = gUnknown_083ECD28[i][eSlotMachine->unk01];
        if (i == 0 && eSlotMachine->unk03 == 1)
        {
            r3 += 10;
            if (r3 > 0x100)
            {
                r3 = 0x100;
            }
        }
        else if (i == 4 && eSlotMachine->unk03 == 1)
        {
            r3 -= 10;
            if (r3 < 0)
            {
                r3 = 0;
            }
        }
        if (r3 > rval)
        {
            break;
        }
    }
    return i;
}

const u8 gUnknown_083ECD46[][17];
const u8 gUnknown_083ECDAC[][17];

u8 sub_810264C(u8 a0)
{
    if (eSlotMachine->unk03 == 0)
    {
        return gUnknown_083ECD46[a0][eSlotMachine->unk02];
    }
    return gUnknown_083ECDAC[a0][eSlotMachine->unk02];
}

void sub_8102680(void)
{
    u8 rval;
    s16 i;

    eSlotMachine->unk05 = 0;
    rval = Random();
    if (rval < sub_810264C(0))
    {
        return;
    }
    for (i = 5; i > 0; i--)
    {
        rval = Random();
        if (rval < sub_810264C(i))
        {
            break;
        }
    }
    eSlotMachine->unk05 = i;
}

const u16 gUnknown_083ECE12[];

bool8 sub_81026DC(u16 a0)
{
    u16 rval = Random() & 0xff;
    if (rval < gUnknown_083ECE12[a0])
    {
        return TRUE;
    }
    return FALSE;
}

const u16 gUnknown_083ECE1C[][2];
const u16 gUnknown_083ECE30[];

u16 dp15_jump_random_unknown(void)
{
    u8 r4 = 0;
    u8 rval;
    u8 value;
    if (eSlotMachine->unk10 >= 300)
    {
        r4 = 4;
    }
    else if (eSlotMachine->unk10 >= 250)
    {
        r4 = 3;
    }
    else if (eSlotMachine->unk10 >= 200)
    {
        r4 = 2;
    }
    else if (eSlotMachine->unk10 >= 150)
    {
        r4 = 1;
    }
    rval = Random() % 100;
    value = gUnknown_083ECE1C[r4][0];
    if (rval < value)
    {
        return 4;
    }
    rval = Random() % 100;
    value = gUnknown_083ECE1C[r4][1] + gUnknown_083ECE30[eSlotMachine->unk0B];
    if (rval < value)
    {
        return 2;
    }
    return 8;
}

static void sub_81027A0(void)
{
    eSlotMachine->unk08 = 0;
    sub_81027D0();
    if (eSlotMachine->bet > 1)
    {
        sub_8102840();
    }
    if (eSlotMachine->bet > 2)
    {
        sub_810290C();
    }
}

extern const u16 gUnknown_083ECE5A[];
extern const u16 gUnknown_083ECE6C[];

static void sub_81027D0(void)
{
    u8 c1, c2, c3, payout;

    c1 = sub_8102BA4(0, 2);
    c2 = sub_8102BA4(1, 2);
    c3 = sub_8102BA4(2, 2);
    payout = sub_81029D4(c1, c2, c3);
    if (payout != 9)
    {
        eSlotMachine->unk0E += gUnknown_083ECE6C[payout];
        eSlotMachine->unk08 |= gUnknown_083ECE5A[payout];
        sub_8103E04(0);
    }
}

static void sub_8102840(void)
{
    u8 c1, c2, c3, payout;

    c1 = sub_8102BA4(0, 1);
    c2 = sub_8102BA4(1, 1);
    c3 = sub_8102BA4(2, 1);
    payout = sub_81029D4(c1, c2, c3);
    if (payout != 9)
    {
        if (payout == 0)
        {
            payout = 1;
        }
        eSlotMachine->unk0E += gUnknown_083ECE6C[payout];
        eSlotMachine->unk08 |= gUnknown_083ECE5A[payout];
        sub_8103E04(1);
    }
    c1 = sub_8102BA4(0, 3);
    c2 = sub_8102BA4(1, 3);
    c3 = sub_8102BA4(2, 3);
    payout = sub_81029D4(c1, c2, c3);
    if (payout != 9)
    {
        if (payout == 0)
        {
            payout = 1;
        }
        eSlotMachine->unk0E += gUnknown_083ECE6C[payout];
        eSlotMachine->unk08 |= gUnknown_083ECE5A[payout];
        sub_8103E04(2);
    }
}

static void sub_810290C(void)
{
    u8 c1, c2, c3, payout;

    c1 = sub_8102BA4(0, 1);
    c2 = sub_8102BA4(1, 2);
    c3 = sub_8102BA4(2, 3);
    payout = sub_81029D4(c1, c2, c3);
    if (payout != 9)
    {
        if (payout != 0)
        {
            eSlotMachine->unk0E += gUnknown_083ECE6C[payout];
            eSlotMachine->unk08 |= gUnknown_083ECE5A[payout];
        }
        sub_8103E04(3);
    }
    c1 = sub_8102BA4(0, 3);
    c2 = sub_8102BA4(1, 2);
    c3 = sub_8102BA4(2, 1);
    payout = sub_81029D4(c1, c2, c3);
    if (payout != 9)
    {
        if (payout != 0)
        {
            eSlotMachine->unk0E += gUnknown_083ECE6C[payout];
            eSlotMachine->unk08 |= gUnknown_083ECE5A[payout];
        }
        sub_8103E04(4);
    }
}

const u8 gUnknown_083ECE52[];

static u8 sub_81029D4(u8 c1, u8 c2, u8 c3)
{
    if (c1 == c2 && c1 == c3)
    {
        return gUnknown_083ECE52[c1];
    }
    if (c1 == 0 && c2 == 0 && c3 == 1)
    {
        return 6;
    }
    if (c1 == 1 && c2 == 1 && c3 == 0)
    {
        return 6;
    }
    if (c1 == 4)
    {
        return 0;
    }
    return 9;
}

static void sub_8102A24(void)
{
    sub_8102A64(CreateTask(sub_8102A64, 4));
}

static bool8 sub_8102A44(void)
{
    if (FindTaskIdByFunc(sub_8102A64) == 0xff)
    {
        return TRUE;
    }
    return FALSE;
}

bool8 (*const gUnknown_083ECB20[])(struct Task *task) = {
    sub_8102A9C,
    sub_8102AD0,
    sub_8102B80
};

static void sub_8102A64(u8 taskId)
{
    while (gUnknown_083ECB20[gTasks[taskId].data[0]](gTasks + taskId));
}

bool8 sub_8102A9C(struct Task *task)
{
    if (sub_8103E38())
    {
        task->data[0]++;
        if (eSlotMachine->unk0E == 0)
        {
            task->data[0] = 2;
            return TRUE;
        }
    }
    return FALSE;
}

bool8 sub_8102AD0(struct Task *task)
{
    if (!task->data[1]--)
    {
        if (IsFanfareTaskInactive())
        {
            PlaySE(SE_PIN);
        }
        eSlotMachine->unk0E--;
        if (eSlotMachine->coins < 9999)
        {
            eSlotMachine->coins++;
        }
        task->data[1] = 8;
        if (gMain.heldKeys & A_BUTTON)
        {
            task->data[1] = 4;
        }
    }
    if (IsFanfareTaskInactive() && gMain.newKeys & START_BUTTON)
    {
        PlaySE(SE_PIN);
        eSlotMachine->coins += eSlotMachine->unk0E;
        if (eSlotMachine->coins > 9999)
        {
            eSlotMachine->coins = 9999;
        }
        eSlotMachine->unk0E = 0;
    }
    if (eSlotMachine->unk0E == 0)
    {
        task->data[0]++;
    }
    return FALSE;
}

bool8 sub_8102B80(struct Task *task)
{
    if (sub_8103E7C())
    {
        DestroyTask(FindTaskIdByFunc(sub_8102A64));
    }
    return FALSE;
}

const u8 gUnknown_083ECCB2[][21];

u8 sub_8102BA4(u8 x, s16 y)
{
    s16 offset = (eSlotMachine->unk28[x] + y) % 21;
    if (offset < 0)
    {
        offset += 21;
    }
    return gUnknown_083ECCB2[x][offset];
}

u8 sub_8102BF8(u8 x, s16 y)
{
    s16 r6 = 0;
    if ((eSlotMachine->unk1C[x]) % 24)
        r6 = -1;
    return sub_8102BA4(x, y + r6);
}

const u8 gUnknown_083ECCF1[];

u8 sub_8102C48(s16 a0)
{
    s16 r1 = (eSlotMachine->unk16 + a0) % 6;
    if (r1 < 0)
        r1 += 6;
    return gUnknown_083ECCF1[r1];
}

void sub_8102C84(u8 a0, s16 a1)
{
    eSlotMachine->unk1C[a0] += a1;
    eSlotMachine->unk1C[a0] %= 504;
    eSlotMachine->unk28[a0] = 21 - eSlotMachine->unk1C[a0] / 24;
}

s16 sub_8102CCC(u8 a0, s16 a1)
{
    s16 r1 = eSlotMachine->unk1C[a0] % 24;
    if (r1 != 0)
    {
        if (r1 < a1)
            a1 = r1;
        sub_8102C84(a0, a1);
        r1 = eSlotMachine->unk1C[a0] % 24;
    }
    return r1;
}

void sub_8102D28(s16 a0)
{
    eSlotMachine->unk14 += a0;
    eSlotMachine->unk14 %= 120;
    eSlotMachine->unk16 = 6 - eSlotMachine->unk14 / 20;
}

s16 sub_8102D5C(s16 a0)
{
    s16 r1 = eSlotMachine->unk14 % 20;
    if (r1 != 0)
    {
        if (r1 < a0)
            a0 = r1;
        sub_8102D28(a0);
        r1 = eSlotMachine->unk14 % 20;
    }
    return r1;
}

static void sub_8102DA8(void)
{
    u8 i;
    for (i = 0; i < 3; i++)
    {
        u8 taskId = CreateTask(sub_8102E68, 2);
        gTasks[taskId].data[15] = i;
        eSlotMachine->unk3A[i] = taskId;
        sub_8102E68(taskId);
    }
}

static void sub_8102DEC(u8 a0)
{
    gTasks[eSlotMachine->unk3A[a0]].data[0] = 1;
    gTasks[eSlotMachine->unk3A[a0]].data[14] = 1;
}

static void sub_8102E1C(u8 a0)
{
    gTasks[eSlotMachine->unk3A[a0]].data[0] = 2;
}

static bool8 sub_8102E40(u8 a0)
{
    return gTasks[eSlotMachine->unk3A[a0]].data[14];
}

bool8 (*const gUnknown_083ECB2C[])(struct Task *task) = {
    sub_8102EA0,
    sub_8102EA4,
    sub_8102EC0,
    sub_8102F4C,
    sub_8103008
};

static void sub_8102E68(u8 taskId)
{
    while (gUnknown_083ECB2C[gTasks[taskId].data[0]](gTasks + taskId));
}

bool8 sub_8102EA0(struct Task *task)
{
    return FALSE;
}

bool8 sub_8102EA4(struct Task *task)
{
    sub_8102C84(task->data[15], eSlotMachine->unk1A);
    return FALSE;
}

bool8 (*const gUnknown_083ECB40[])(void) = {
    sub_810305C,
    sub_81032C0,
    sub_81033DC
};
void (*const gUnknown_083ECB4C[])(void) = {
    sub_81034F4,
    sub_8103540,
    sub_810380C
};

bool8 sub_8102EC0(struct Task *task)
{
    task->data[0]++;
    eSlotMachine->unk34[task->data[15]] = 0;
    eSlotMachine->unk2E[task->data[15]] = 0;
    if (eSlotMachine->unk0A == 0 && (eSlotMachine->unk04 == 0 || eSlotMachine->unk06 == 0 || !gUnknown_083ECB40[task->data[15]]()))
    {
        eSlotMachine->unk06 = 0;
        gUnknown_083ECB4C[task->data[15]]();
    }
    task->data[1] = eSlotMachine->unk2E[task->data[15]];
    return TRUE;
}

bool8 sub_8102F4C(struct Task *task)
{
    u16 sp[] = {2, 4, 4, 4, 8};
    s16 r2 = eSlotMachine->unk1C[task->data[15]] % 24;
    if (r2 != 0)
    {
        r2 = sub_8102CCC(task->data[15], eSlotMachine->unk1A);
    }
    else if (eSlotMachine->unk2E[task->data[15]])
    {
        eSlotMachine->unk2E[task->data[15]]--;
        sub_8102C84(task->data[15], eSlotMachine->unk1A);
        r2 = eSlotMachine->unk1C[task->data[15]] % 24;
    }
    if (r2 == 0 && eSlotMachine->unk2E[task->data[15]] == 0)
    {
        task->data[0]++;
        task->data[1] = sp[task->data[1]];
        task->data[2] = 0;
    }
    return FALSE;
}

bool8 sub_8103008(struct Task *task)
{
    eSlotMachine->unk22[task->data[15]] = task->data[1];
    task->data[1] = -task->data[1];
    task->data[2]++;
    if ((task->data[2] & 0x3) == 0)
    {
        task->data[1] >>= 1;
    }
    if (task->data[1] == 0)
    {
        task->data[0] = 0;
        task->data[14] = 0;
        eSlotMachine->unk22[task->data[15]] = 0;
    }
    return FALSE;
}

bool8 (*const gUnknown_083ECB64[])(u8 a0, u8 a1) = {
    sub_8103154,
    sub_81031B4,
    sub_81031B4
};

bool8 sub_810305C(void)
{
    u8 r3 = sub_810250C(eSlotMachine->unk04);
    u8 r5 = r3;
    if (eSlotMachine->unk04 & 0xc0)
    {
        r5 = 0;
        r3 = 1;
    }
    return gUnknown_083ECB64[eSlotMachine->bet - 1](r5, r3);
}

bool8 sub_81030A4(s16 a0, u8 a1, u8 a2)
{
    u8 r1 = sub_8102BF8(0, a0);
    if (r1 == a1 || r1 == a2)
    {
        eSlotMachine->unk07 = r1;
        return TRUE;
    }
    return FALSE;
}

bool8 sub_81030E0(s16 a0)
{
    if (sub_8102BF8(0, 1 - a0) == 4 || sub_8102BF8(0, 2 - a0) == 4 || sub_8102BF8(0, 3 - a0) == 4)
    {
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8103134(void)
{
    if (eSlotMachine->unk04 & 0xc2)
    {
        return TRUE;
    }
    return FALSE;
}

bool8 sub_8103154(u8 a0, u8 a1)
{
    s16 i;

    for (i = 0; i < 5; i++)
    {
        if (sub_81030A4(2 - i, a0, a1))
        {
            eSlotMachine->unk34[0] = 2;
            eSlotMachine->unk2E[0] = i;
            return TRUE;
        }
    }
    return FALSE;
}

bool8 sub_81031B4(u8 a0, u8 a1)
{
    s16 i;
    bool8 r6 = sub_8103134();
    if (r6 || !sub_81030E0(0))
    {
        for (i = 1; i < 4; i++)
        {
            if (sub_81030A4(i, a0, a1))
            {
                eSlotMachine->unk34[0] = i;
                eSlotMachine->unk2E[0] = 0;
                return TRUE;
            }
        }
    }
    for (i = 1; i < 5; i++)
    {
        bool8 r7 = r6;
        if (r7 || !sub_81030E0(i))
        {
            if (sub_81030A4(1 - i, a0, a1))
            {
                if (i == 1 && (r7 || !sub_81030E0(3)))
                {
                    eSlotMachine->unk34[0] = 3;
                    eSlotMachine->unk2E[0] = 3;
                    return TRUE;
                }
                if (i < 4 && (r7 || !sub_81030E0(i + 1)))
                {
                    eSlotMachine->unk34[0] = 2;
                    eSlotMachine->unk2E[0] = i + 1;
                    return TRUE;
                }
                eSlotMachine->unk34[0] = 1;
                eSlotMachine->unk2E[0] = i;
                return TRUE;
            }
        }
    }
    return FALSE;
}

bool8 (*const gUnknown_083ECB70[])(void) = {
    sub_81032E8,
    sub_81032E8,
    sub_810333C
};

bool8 sub_81032C0(void)
{
    return gUnknown_083ECB70[eSlotMachine->bet - 1]();
}

bool8 sub_81032E8(void)
{
    s16 i;
    s16 unk34_0 = eSlotMachine->unk34[0];

    for (i = 0; i < 5; i++)
    {
        if (sub_8102BF8(1, unk34_0 - i) == eSlotMachine->unk07)
        {
            eSlotMachine->unk34[1] = unk34_0;
            eSlotMachine->unk2E[1] = i;
            return TRUE;
        }
    }
    return FALSE;
}

bool8 sub_810333C(void)
{
    s16 i;
    if (sub_81032E8())
    {
        if (eSlotMachine->unk34[0] != 2 && eSlotMachine->unk2E[1] > 1 && eSlotMachine->unk2E[1] != 4)
        {
            for (i = 0; i < 5; i++)
            {
                if (sub_8102BF8(1, 2 - i) == eSlotMachine->unk07)
                {
                    eSlotMachine->unk34[1] = 2;
                    eSlotMachine->unk2E[1] = i;
                    break;
                }
            }
        }
        return TRUE;
    }
    if (eSlotMachine->unk34[0] != 2)
    {
        for (i = 0; i < 5; i++)
        {
            if (sub_8102BF8(1, 2 - i) == eSlotMachine->unk07)
            {
                eSlotMachine->unk34[1] = 2;
                eSlotMachine->unk2E[1] = i;
                return TRUE;
            }
        }
    }
    return FALSE;
}

bool8 (*const gUnknown_083ECB7C[])(u8 a0) = {
    sub_810341C,
    sub_810341C,
    sub_810347C
};

bool8 sub_81033DC(void)
{
    u8 r3 = eSlotMachine->unk07;
    if (eSlotMachine->unk04 & 0x40)
    {
        r3 = 0;
        if (eSlotMachine->unk07 == 0)
        {
            r3 = 1;
        }
    }
    return gUnknown_083ECB7C[eSlotMachine->bet - 1](r3);
}

bool8 sub_810341C(u8 a0)
{
    s16 i;
    s16 unk34_1 = eSlotMachine->unk34[1];

    for (i = 0; i < 5; i++)
    {
        if (sub_8102BF8(2, unk34_1 - i) == a0)
        {
            eSlotMachine->unk34[2] = unk34_1;
            eSlotMachine->unk2E[2] = i;
            return TRUE;
        }
    }
    return FALSE;
}

bool8 sub_810347C(u8 a0)
{
    s16 i;
    s16 r8;
    if (eSlotMachine->unk34[0] == eSlotMachine->unk34[1])
    {
        return sub_810341C(a0);
    }
    r8 = 1;
    if (eSlotMachine->unk34[0] == 1)
    {
        r8 = 3;
    }
    for (i = 0; i < 5; i++)
    {
        if (sub_8102BF8(2, r8 - i) == a0)
        {
            eSlotMachine->unk2E[2] = i;
            eSlotMachine->unk34[2] = r8;
            return TRUE;
        }
    }
    return FALSE;
}

void sub_81034F4(void)
{
    s16 i;
    for (i = 0; sub_81030E0(i); i++);
    eSlotMachine->unk2E[0] = i;
}

bool8 sub_8103520(u8 *a0)
{
    if (*a0 == 0)
    {
        *a0 = 1;
        return TRUE;
    }
    if (*a0 == 1)
    {
        *a0 = 0;
        return TRUE;
    }
    return FALSE;
}

void (*const gUnknown_083ECB88[])(void) = {
    sub_8103564,
    j5_08111E84,
    sub_8103668
};

void sub_8103540(void)
{
    gUnknown_083ECB88[eSlotMachine->bet - 1]();
}

void sub_8103564(void)
{
    if (eSlotMachine->unk34[0] != 0 && eSlotMachine->unk04 & 0x80)
    {
        u8 sp0 = sub_8102BF8(0, 2 - eSlotMachine->unk2E[0]);
        if (sub_8103520(&sp0))
        {
            s16 i;
            for (i = 0; i < 5; i++)
            {
                if (sp0 == sub_8102BF8(1, 2 - i))
                {
                    eSlotMachine->unk34[1] = 2;
                    eSlotMachine->unk2E[1] = i;
                    break;
                }
            }
        }
    }
}

void j5_08111E84(void)
{
    if (eSlotMachine->unk34[0] != 0 && eSlotMachine->unk04 & 0x80)
    {
        u8 sp0 = sub_8102BF8(0, eSlotMachine->unk34[0] - eSlotMachine->unk2E[0]);
        if (sub_8103520(&sp0))
        {
            s16 i;
            for (i = 0; i < 5; i++)
            {
                if (sp0 == sub_8102BF8(1, eSlotMachine->unk34[0] - i))
                {
                    eSlotMachine->unk34[1] = eSlotMachine->unk34[0];
                    eSlotMachine->unk2E[1] = i;
                    break;
                }
            }
        }
    }
}

#ifdef NONMATCHING // variable r6 is mistakenly plopped into r5,
                   // and variable i is mistakenly plopped into r6
void sub_8103668(void)
{
    s16 i;
    s16 r6;
    if (eSlotMachine->unk34[0] != 0 && eSlotMachine->unk04 & 0x80)
    {
        if (eSlotMachine->unk34[0] == 2)
        {
            j5_08111E84();
        }
        else
        {
            u8 sp0 = sub_8102BF8(0, eSlotMachine->unk34[0] - eSlotMachine->unk2E[0]);
            if (sub_8103520(&sp0))
            {
                r6 = 2;
                if (eSlotMachine->unk34[0] == 3)
                    r6 = 3;
                for (i = 0; i < 2; i++, r6--)
                {
                    if (sp0 == sub_8102BF8(1, r6))
                    {
                        eSlotMachine->unk34[1] = r6;
                        eSlotMachine->unk2E[1] = 0;
                        return;
                    }
                }
                for (i = 1; i < 5; i++)
                {
                    if (sp0 == sub_8102BF8(1, eSlotMachine->unk34[0] - i))
                    {
                        if (eSlotMachine->unk34[0] == 1)
                        {
                            if (i < 3)
                            {
                                eSlotMachine->unk34[1] = 2;
                                eSlotMachine->unk2E[1] = i + 1;
                            }
                            else
                            {
                                eSlotMachine->unk34[1] = 1;
                                eSlotMachine->unk2E[1] = i;
                            }
                        }
                        else
                        {
                            if (i < 3)
                            {
                                eSlotMachine->unk34[1] = 3;
                                eSlotMachine->unk2E[1] = i;
                            }
                            else
                            {
                                eSlotMachine->unk34[1] = 2;
                                eSlotMachine->unk2E[1] = i - 1;
                            }
                        }
                        return;
                    }
                }
            }
        }
    }
}
#else
__attribute__((naked)) void sub_8103668(void)
{
    asm_unified("\tpush {r4-r7,lr}\n"
                    "\tsub sp, 0x4\n"
                    "\tldr r4, _0810368C @ =gSharedMem\n"
                    "\tldrh r3, [r4, 0x34]\n"
                    "\tmovs r0, 0x34\n"
                    "\tldrsh r2, [r4, r0]\n"
                    "\tcmp r2, 0\n"
                    "\tbeq _0810375A\n"
                    "\tldrb r1, [r4, 0x4]\n"
                    "\tmovs r0, 0x80\n"
                    "\tands r0, r1\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0810375A\n"
                    "\tcmp r2, 0x2\n"
                    "\tbne _081036AE\n"
                    "\tbl j5_08111E84\n"
                    "\tb _0810375A\n"
                    "\t.align 2, 0\n"
                    "_0810368C: .4byte gSharedMem\n"
                    "_08103690:\n"
                    "\tldr r0, _0810369C @ =gSharedMem\n"
                    "\tmovs r1, 0\n"
                    "\tstrh r6, [r0, 0x36]\n"
                    "\tstrh r1, [r0, 0x30]\n"
                    "\tb _0810375A\n"
                    "\t.align 2, 0\n"
                    "_0810369C: .4byte gSharedMem\n"
                    "_081036A0:\n"
                    "\tmovs r0, 0x2\n"
                    "\tstrh r0, [r5, 0x36]\n"
                    "\tadds r0, r4, 0x1\n"
                    "\tstrh r0, [r5, 0x30]\n"
                    "\tb _0810375A\n"
                    "_081036AA:\n"
                    "\tmovs r0, 0x3\n"
                    "\tb _08103736\n"
                    "_081036AE:\n"
                    "\tldrh r1, [r4, 0x2E]\n"
                    "\tsubs r1, r3, r1\n"
                    "\tlsls r1, 16\n"
                    "\tasrs r1, 16\n"
                    "\tmovs r0, 0\n"
                    "\tbl sub_8102BF8\n"
                    "\tmov r1, sp\n"
                    "\tstrb r0, [r1]\n"
                    "\tmov r0, sp\n"
                    "\tbl sub_8103520\n"
                    "\tlsls r0, 24\n"
                    "\tcmp r0, 0\n"
                    "\tbeq _0810375A\n"
                    "\tmovs r6, 0x2\n"
                    "\tmovs r1, 0x34\n"
                    "\tldrsh r0, [r4, r1]\n"
                    "\tcmp r0, 0x3\n"
                    "\tbne _081036D8\n"
                    "\tmovs r6, 0x3\n"
                    "_081036D8:\n"
                    "\tmovs r5, 0\n"
                    "\tmov r7, sp\n"
                    "_081036DC:\n"
                    "\tlsls r0, r6, 16\n"
                    "\tasrs r4, r0, 16\n"
                    "\tmovs r0, 0x1\n"
                    "\tadds r1, r4, 0\n"
                    "\tbl sub_8102BF8\n"
                    "\tldrb r1, [r7]\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tcmp r1, r0\n"
                    "\tbeq _08103690\n"
                    "\tlsls r1, r5, 16\n"
                    "\tmovs r0, 0x80\n"
                    "\tlsls r0, 9\n"
                    "\tadds r1, r0\n"
                    "\tsubs r0, r4, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r6, r0, 16\n"
                    "\tlsrs r5, r1, 16\n"
                    "\tasrs r1, 16\n"
                    "\tcmp r1, 0x1\n"
                    "\tble _081036DC\n"
                    "\tmovs r6, 0x1\n"
                    "\tmov r7, sp\n"
                    "\tldr r5, _0810373C @ =gSharedMem\n"
                    "_0810370E:\n"
                    "\tldrh r1, [r5, 0x34]\n"
                    "\tlsls r0, r6, 16\n"
                    "\tasrs r4, r0, 16\n"
                    "\tsubs r1, r4\n"
                    "\tlsls r1, 16\n"
                    "\tasrs r1, 16\n"
                    "\tmovs r0, 0x1\n"
                    "\tbl sub_8102BF8\n"
                    "\tldrb r1, [r7]\n"
                    "\tlsls r0, 24\n"
                    "\tlsrs r0, 24\n"
                    "\tcmp r1, r0\n"
                    "\tbne _0810374E\n"
                    "\tmovs r1, 0x34\n"
                    "\tldrsh r0, [r5, r1]\n"
                    "\tcmp r0, 0x1\n"
                    "\tbne _08103740\n"
                    "\tcmp r4, 0x2\n"
                    "\tble _081036A0\n"
                    "_08103736:\n"
                    "\tstrh r0, [r5, 0x36]\n"
                    "\tstrh r6, [r5, 0x30]\n"
                    "\tb _0810375A\n"
                    "\t.align 2, 0\n"
                    "_0810373C: .4byte gSharedMem\n"
                    "_08103740:\n"
                    "\tcmp r4, 0x2\n"
                    "\tble _081036AA\n"
                    "\tmovs r0, 0x2\n"
                    "\tstrh r0, [r5, 0x36]\n"
                    "\tsubs r0, r4, 0x1\n"
                    "\tstrh r0, [r5, 0x30]\n"
                    "\tb _0810375A\n"
                    "_0810374E:\n"
                    "\tadds r0, r4, 0x1\n"
                    "\tlsls r0, 16\n"
                    "\tlsrs r6, r0, 16\n"
                    "\tasrs r0, 16\n"
                    "\tcmp r0, 0x4\n"
                    "\tble _0810370E\n"
                    "_0810375A:\n"
                    "\tadd sp, 0x4\n"
                    "\tpop {r4-r7}\n"
                    "\tpop {r0}\n"
                    "\tbx r0");
}
#endif // NONMATCHING

bool8 sub_8103764(u8 a0, u8 a1)
{
    if ((a0 == 0 && a1 == 1) || (a0 == 1 && a1 == 0))
    {
        return TRUE;
    }
    return FALSE;
}

bool8 sub_810378C(u8 a0, u8 a1, u8 a2)
{
    if ((a0 == 0 && a1 == 1 && a2 == 0) || (a0 == 1 && a1 == 0 && a2 == 1))
    {
        return TRUE;
    }
    return FALSE;
}

bool8 sub_81037BC(u8 a0, u8 a1, u8 a2)
{
    if ((a0 == 0 && a1 == 1 && a2 == 0) ||
        (a0 == 1 && a1 == 0 && a2 == 1) ||
        (a0 == 0 && a1 == 0 && a2 == 1) ||
        (a0 == 1 && a1 == 1 && a2 == 0) ||
        (a0 == a1 && a0 == a2))
    {
        return FALSE;
    }
    return TRUE;
}

void (*const gUnknown_083ECB94[])(void) = {
    sub_8103830,
    sub_8103910,
    sub_8103A78
};

void sub_810380C(void)
{
    gUnknown_083ECB94[eSlotMachine->bet - 1]();
}

void sub_8103830(void)
{
    s16 i = 0;
    u8 r5 = sub_8102BF8(0, 2 - eSlotMachine->unk2E[0]);
    u8 r1 = sub_8102BF8(1, 2 - eSlotMachine->unk2E[1]);
    if (r5 == r1)
    {
        while (1)
        {
            u8 r0;
            if (!(r5 == (r0 = sub_8102BF8(2, 2 - i)) || (r5 == 0 && r0 == 1) || (r5 == 1 && r0 == 0)))
            {
                break;
            }
            i++;
        }
    }
    else if (sub_8103764(r5, r1))
    {
        if (eSlotMachine->unk04 & 0x80)
        {
            for (i = 0; i < 5; i++)
            {
                if (r5 == sub_8102BF8(2, 2 - i))
                {
                    eSlotMachine->unk2E[2] = i;
                    return;
                }
            }
        }
        i = 0;
        while (1)
        {
            if (r5 != sub_8102BF8(2, 2 - i))
            {
                break;
            }
            i++;
        }
    }
    eSlotMachine->unk2E[2] = i;
}

void sub_8103910(void)
{
    s16 sp0 = 0;
    s16 i;
    u8 r7;
    u8 r6;
    u8 r4;

    if (eSlotMachine->unk34[1] != 0 && eSlotMachine->unk34[0] == eSlotMachine->unk34[1] && eSlotMachine->unk04 & 0x80)
    {
        r7 = sub_8102BF8(0, eSlotMachine->unk34[0] - eSlotMachine->unk2E[0]);
        r6 = sub_8102BF8(1, eSlotMachine->unk34[1] - eSlotMachine->unk2E[1]);
        if (sub_8103764(r7, r6))
        {
            for (i = 0; i < 5; i++)
            {
                r4 = sub_8102BF8(2, eSlotMachine->unk34[1] - i);
                if (r7 == r4)
                {
                    sp0 = i;
                    break;
                }
            }
        }
    }
    while (1)
    {
        s16 r8;
        for (i = 1, r8 = 0; i < 4; i++)
        {
            r7 = sub_8102BF8(0, i - eSlotMachine->unk2E[0]);
            r6 = sub_8102BF8(1, i - eSlotMachine->unk2E[1]);
            r4 = sub_8102BF8(2, i - sp0);
            if (!sub_81037BC(r7, r6, r4) && (!sub_810378C(r7, r6, r4) || !(eSlotMachine->unk04 & 0x80)))
            {
                r8++;
                break;
            }
        }
        if (r8 == 0)
        {
            break;
        }
        sp0++;
    }
    eSlotMachine->unk2E[2] = sp0;
}

void sub_8103A78(void)
{
    u8 r6;
    u8 r5;
    u8 r4;
    s16 r8;
    s16 i;

    sub_8103910();
    if (eSlotMachine->unk34[1] != 0 && eSlotMachine->unk34[0] != eSlotMachine->unk34[1] && eSlotMachine->unk04 & 0x80)
    {
        r6 = sub_8102BF8(0, eSlotMachine->unk34[0] - eSlotMachine->unk2E[0]);
        r5 = sub_8102BF8(1, eSlotMachine->unk34[1] - eSlotMachine->unk2E[1]);
        if (sub_8103764(r6, r5))
        {
            r8 = 1;
            if (eSlotMachine->unk34[0] == 1)
                r8 = 3;
            for (i = 0; i < 5; i++)
            {
                r4 = sub_8102BF8(2, r8 - (eSlotMachine->unk2E[2] + i));
                if (r6 == r4)
                {
                    eSlotMachine->unk2E[2] += i;
                    break;
                }
            }
        }
    }
    while (1)
    {
        r6 = sub_8102BF8(0, 1 - eSlotMachine->unk2E[0]);
        r5 = sub_8102BF8(1, 2 - eSlotMachine->unk2E[1]);
        r4 = sub_8102BF8(2, 3 - eSlotMachine->unk2E[2]);
        if (sub_81037BC(r6, r5, r4) || (sub_810378C(r6, r5, r4) && eSlotMachine->unk04 & 0x80))
            break;
        eSlotMachine->unk2E[2]++;
    }
    while (1)
    {
        r6 = sub_8102BF8(0, 3 - eSlotMachine->unk2E[0]);
        r5 = sub_8102BF8(1, 2 - eSlotMachine->unk2E[1]);
        r4 = sub_8102BF8(2, 1 - eSlotMachine->unk2E[2]);
        if (sub_81037BC(r6, r5, r4) || (sub_810378C(r6, r5, r4) && eSlotMachine->unk04 & 0x80))
            break;
        eSlotMachine->unk2E[2]++;
    }
}

static void sub_8103C14(u8 a0)
{
    u8 taskId = CreateTask(sub_8103C48, 5);
    gTasks[taskId].data[15] = a0;
    sub_8103C48(taskId);
}

void (*const gUnknown_083ECBA0[])(struct Task *task, u8 taskId) = {
    sub_8103C78,
    sub_8103CAC,
    sub_8103CC8
};

static void sub_8103C48(u8 taskId)
{
    gUnknown_083ECBA0[gTasks[taskId].data[0]](gTasks + taskId, taskId);
}

const s16 gUnknown_083ECBAC[] = {5, 10, 15};

void sub_8103C78(struct Task *task, u8 taskId)
{
    sub_81065A8(gUnknown_083ECBAC[task->data[15]], 0x62, 0x63, 0x72, 0x73);
    task->data[0]++;
}

void sub_8103CAC(struct Task *task, u8 taskId)
{
    if (++task->data[1] > 11)
        task->data[0]++;
}

void sub_8103CC8(struct Task *task, u8 taskId)
{
    sub_81065A8(gUnknown_083ECBAC[task->data[15]], 0x42, 0x43, 0x52, 0x53);
    DestroyTask(taskId);
}

extern const u16 *const gUnknown_083EDD08[];
const u16 *const gUnknown_083EDD1C[];
const u8 gUnknown_083EDD30[];

static void sub_8103D00(u8 a0)
{
    LoadPalette(gUnknown_083EDD08[a0], gUnknown_083EDD30[a0], 2);
}

static void sub_8103D28(u8 a0)
{
    LoadPalette(gUnknown_083EDD1C[a0], gUnknown_083EDD30[a0], 2);
}

const u8 gUnknown_083EDD35[][2];
const u8 gUnknown_083EDD3B[];

static void sub_8103D50(u8 a0)
{
    u8 i;
    for (i = 0; i < gUnknown_083EDD3B[a0]; i++)
    {
        sub_8103D00(gUnknown_083EDD35[a0][i]);
    }
}

static void sub_8103D8C(u8 a0)
{
    u8 i;
    for (i = 0; i < gUnknown_083EDD3B[a0]; i++)
    {
        sub_8103D28(gUnknown_083EDD35[a0][i]);
    }
}

static void sub_8103DC8(void)
{
    u8 i;
    for (i = 0; i < 5; i++)
    {
        u8 spriteId = CreateInvisibleSprite(sub_8103EE4);
        gSprites[spriteId].data[0] = i;
        eSlotMachine->unk44[i] = spriteId;
    }
}

static void sub_8103E04(u8 a0)
{
    struct Sprite *sprite = gSprites + eSlotMachine->unk44[a0];
    sprite->data[1] = 1;
    sprite->data[2] = 4;
    sprite->data[3] = 0;
    sprite->data[4] = 0;
    sprite->data[5] = 2;
    sprite->data[7] = 0;
}

static bool8 sub_8103E38(void)
{
    u8 i;
    for (i = 0; i < 5; i++)
    {
        struct Sprite *sprite = gSprites + eSlotMachine->unk44[i];
        if (sprite->data[1] && sprite->data[2])
            return FALSE;
    }
    return TRUE;
}

static bool8 sub_8103E7C(void)
{
    u8 i;
    for (i = 0; i < 5; i++)
    {
        if (!sub_8103EAC(eSlotMachine->unk44[i]))
            return FALSE;
    }
    return TRUE;
}

static bool8 sub_8103EAC(u8 spriteId)
{
    struct Sprite *sprite = gSprites + spriteId;
    if (!sprite->data[1])
        return TRUE;
    if (sprite->data[7])
        sprite->data[1] = 0;
    return sprite->data[7];
}

static void sub_8103EE4(struct Sprite *sprite)
{
    s16 r4;
    if (sprite->data[1])
    {
        if (!sprite->data[3]--)
        {
            sprite->data[7] = 0;
            sprite->data[3] = 1;
            sprite->data[4] += sprite->data[5];
            r4 = 4;
            if (sprite->data[2])
                r4 = 8;
            if (sprite->data[4] <= 0)
            {
                sprite->data[7] = 1;
                sprite->data[5] = -sprite->data[5];
                if (sprite->data[2])
                    sprite->data[2]--;
            }
            else if (sprite->data[4] >= r4)
                sprite->data[5] = -sprite->data[5];
            if (sprite->data[2])
                sprite->data[3] <<= 1;
        }
        MultiplyPaletteRGBComponents(gUnknown_083EDD30[sprite->data[0]], sprite->data[4], sprite->data[4], sprite->data[4]);
    }
}

static void sub_8103F70(void)
{
    u8 taskId = CreateTask(sub_8103FE8, 6);
    gTasks[taskId].data[3] = 1;
    sub_8103FE8(taskId);
}

const u16 *const gUnknown_083EDDA0[];
const u16 *const gUnknown_083EDDAC;

static bool8 sub_8103FA0(void)
{
    u8 taskId = FindTaskIdByFunc(sub_8103FE8);
    if (!gTasks[taskId].data[2])
    {
        DestroyTask(taskId);
        LoadPalette(gUnknown_083EDDAC, 0x10, 0x20);
        return TRUE;
    }
    return FALSE;
}

static void sub_8103FE8(u8 taskId)
{
    struct Task *task = gTasks + taskId;
    if (!task->data[1]--)
    {
        task->data[1] = 4;
        task->data[2] += task->data[3];
        if (task->data[2] == 0 || task->data[2] == 2)
        {
            task->data[3] = -task->data[3];
        }
    }
    LoadPalette(gUnknown_083EDDA0[task->data[2]], 0x10, 0x20);
}

static void sub_8104048(void)
{
    eSlotMachine->unk3E = CreateTask(sub_81040E8, 8);
}

static void sub_8104064(u8 unused)
{
    struct Task *task = gTasks + eSlotMachine->unk3E;
    sub_810421C(task);
    task->data[0] = 1;
    task->data[1]++;
    task->data[15] = 1;
}

void sub_8104098(void)
{
    struct Task *task = gTasks + eSlotMachine->unk3E;
    sub_810421C(task);
    task->data[0] = 3;
    task->data[15] = 1;
}

bool8 sub_81040C8(void)
{
    return gTasks[eSlotMachine->unk3E].data[15];
}

void (*const gUnknown_083ECBB4[])(struct Task *task) = {
    nullsub_68,
    sub_810411C,
    sub_8104144,
    sub_81041AC
};

static void sub_81040E8(u8 taskId)
{
    gUnknown_083ECBB4[gTasks[taskId].data[0]](gTasks + taskId);
}

void nullsub_68(struct Task *task)
{

}

void sub_810411C(struct Task *task)
{
    task->data[2] = sub_8105B1C((task->data[1] << 3) + 20, 20);
    task->data[0]++;
}

const u16 gUnknown_083ECBC4[][2] = {
    {0x9e, 0x6e},
    {0x9f, 0x6f},
    {0xaf, 0x7f}
};

void sub_8104144(struct Task *task)
{
    u16 *vaddr = (u16 *)BG_SCREEN_ADDR(29);
    if (gSprites[task->data[2]].data[7])
    {
        s16 r2 = task->data[1] + 2;
        u8 r0 = 0;
        if (task->data[1] == 1)
            r0 = 1;
        else if (task->data[1] == 16)
            r0 = 2;
        vaddr[r2 + 0x40] = gUnknown_083ECBC4[r0][0];
        sub_8105B88(task->data[2]);
        task->data[0] = 0;
        task->data[15] = 0;
    }
}

void sub_81041AC(struct Task *task)
{
    u16 *vaddr = (u16 *)BG_SCREEN_ADDR(29);
    s16 r4 = task->data[1] + 2;
    u8 r2 = 0;
    if (task->data[1] == 1)
        r2 = 1;
    else if (task->data[1] == 16)
        r2 = 2;
    if (task->data[2] == 0)
    {
        vaddr[r4 + 0x40] = gUnknown_083ECBC4[r2][1];
        task->data[1]--;
    }
    if (++task->data[2] >= 20)
        task->data[2] = 0;
    if (task->data[1] == 0)
    {
        task->data[0] = 0;
        task->data[15] = 0;
    }
}

static void sub_810421C(struct Task *task)
{
    u8 i;

    for (i = 2; i < 16; i++)
        task->data[i] = 0;
}

void sub_810423C(u8 a0)
{
    s16 i;
    u8 r3;
    s16 r2 = 3;
    u16 *vaddr = (u16 *)BG_SCREEN_ADDR(29);
    for (i = 0; i < a0; i++, r2++)
    {
        r3 = 0;
        if (i == 0)
            r3 = 1;
        else if (i == 15)
            r3 = 2;
        vaddr[r2 + 0x40] = gUnknown_083ECBC4[r3][0];
    }
    for (; i < 16; i++, r2++)
    {
        r3 = 0;
        if (i == 0)
            r3 = 1;
        else if (i == 15)
            r3 = 2;
        vaddr[r2 + 0x40] = gUnknown_083ECBC4[r3][1];
    }
    gTasks[eSlotMachine->unk3E].data[1] = a0;
}

static void sub_810430C(void)
{
    u8 taskId = CreateTask(sub_810434C, 7);
    sub_810434C(taskId);
}

static bool8 sub_810432C(void)
{
    if (FindTaskIdByFunc(sub_810434C) == 0xFF)
        return TRUE;
    return FALSE;
}

void (*const gUnknown_083ECBD0[])(struct Task *task) = {
    sub_810437C,
    sub_81043EC,
    sub_8104468,
    sub_8104498,
    sub_8104548,
    sub_8104598,
    sub_81045CC,
    sub_810463C,
    sub_81046C0,
    sub_8104764,
    sub_8104794,
    sub_81047EC,
    sub_8104860,
    sub_81048A8,
    sub_81048CC,
    sub_8104940,
    sub_81049C8,
    sub_8104794,
    sub_81049F8
};

void sub_810434C(u8 taskId)
{
    gUnknown_083ECBD0[gTasks[taskId].data[0]](gTasks + taskId);
}

void sub_810437C(struct Task *task)
{
    eSlotMachine->unk0A = 0;
    eSlotMachine->unk14 = 0;
    eSlotMachine->unk16 = 0;
    task->data[0]++;
    task->data[1] = 0;
    task->data[2] = 30;
    task->data[4] = 1280;
    gSpriteCoordOffsetX = 0;
    gSpriteCoordOffsetY = 0;
    REG_BG1HOFS = 0;
    REG_BG1VOFS = 0;
    sub_8104A40(30, 0);
    sub_81051C0();
    sub_8105100();
    sub_81052EC();
    sub_81053A0();
    sub_810545C();
    sub_8102680();
    StopMapMusic();
    PlayNewMapMusic(BGM_BD_TIME);
}

void sub_81043EC(struct Task *task)
{
    s16 r3;
    gSpriteCoordOffsetX -= 8;
    task->data[1] += 8;
    r3 = ((task->data[1] + 240) & 0xff) >> 3;
    REG_BG1HOFS = task->data[1] & 0x1ff;
    if (r3 != task->data[2] && task->data[3] <= 18)
    {
        task->data[2] = r3;
        task->data[3] = task->data[1] >> 3;
        sub_8104A40(r3, task->data[3]);
    }
    if (task->data[1] >= 200)
    {
        task->data[0]++;
        task->data[3] = 0;
    }
    sub_8102D28(task->data[4] >> 8);
}

void sub_8104468(struct Task *task)
{
    sub_8102D28(task->data[4] >> 8);
    if (++task->data[5] >= 60)
    {
        task->data[0]++;
        sub_8105578();
        sub_81056F0();
    }
}

void sub_8104498(struct Task *task)
{
    int r5;
    u8 sp0[] = {1, 1, 2, 2};
    s16 sp4[] = {0x40, 0x30, 0x18, 0x08};
    s16 spC[] = {10, 8, 6, 4};

    sub_8102D28(task->data[4] >> 8);
    task->data[4] -= 4;
    r5 = 4 - (task->data[4] >> 8);
    sub_8105688(sp4[r5]);
    sub_81057E8(spC[r5]);
    StartSpriteAnimIfDifferent(gSprites + eSlotMachine->unk3F, sp0[r5]);
    if (task->data[4] <= 0x100)
    {
        task->data[0]++;
        task->data[4] = 0x100;
        task->data[5] = 0;
    }
}

void sub_8104548(struct Task *task)
{
    sub_8102D28(task->data[4] >> 8);
    if (++task->data[5] >= 80)
    {
        task->data[0]++;
        task->data[5] = 0;
        sub_81057E8(2);
        StartSpriteAnimIfDifferent(gSprites + eSlotMachine->unk3F, 3);
    }
}

void sub_8104598(struct Task *task)
{
    sub_8102D28(task->data[4] >> 8);
    task->data[4] = (u8)task->data[4] + 0x80;
    if (++task->data[5] >= 80)
    {
        task->data[0]++;
        task->data[5] = 0;
    }
}

void sub_81045CC(struct Task *task)
{
    sub_8102D28(task->data[4] >> 8);
    task->data[4] = (u8)task->data[4] + 0x40;
    if (++task->data[5] >= 40)
    {
        task->data[5] = 0;
        if (eSlotMachine->unk05)
        {
            if (eSlotMachine->unk0A <= task->data[6])
            {
                task->data[0]++;
            }
        }
        else if (task->data[6] > 3)
        {
            task->data[0]++;
        }
        else if (sub_81026DC(task->data[6]))
        {
            task->data[0] = 14;
        }
        task->data[6]++;
    }
}

void sub_810463C(struct Task *task)
{
    s16 r5 = eSlotMachine->unk14 % 20;
    if (r5)
    {
        r5 = sub_8102D5C(task->data[4] >> 8);
        task->data[4] = (u8)task->data[4] + 0x40;
    }
    else if (sub_8102C48(1) != eSlotMachine->unk05)
    {
        sub_8102D28(task->data[4] >> 8);
        r5 = eSlotMachine->unk14 % 20;
        task->data[4] = (u8)task->data[4] + 0x40;
    }
    if (r5 == 0 && sub_8102C48(1) == eSlotMachine->unk05)
    {
        task->data[4] = 0;
        task->data[0]++;
    }
}

void sub_81046C0(struct Task *task)
{
    if (++task->data[4] >= 60)
    {
        StopMapMusic();
        sub_81056C0();
        sub_8105804();
        task->data[0]++;
        if(eSlotMachine->unk05 == 0)
        {
            task->data[4] = 0xa0;
            StartSpriteAnimIfDifferent(gSprites + eSlotMachine->unk3F, 5);
            PlayFanfare(BGM_ME_ZANNEN);
        }
        else
        {
            task->data[4] = 0xc0;
            StartSpriteAnimIfDifferent(gSprites + eSlotMachine->unk3F, 4);
            gSprites[eSlotMachine->unk3F].animCmdIndex = 0;
            if (eSlotMachine->unk02)
            {
                sub_8104098();
                eSlotMachine->unk02 = 0;
            }
            PlayFanfare(BGM_ME_B_SMALL);
        }
    }
}

void sub_8104764(struct Task *task)
{
    if ((task->data[4] == 0 || --task->data[4] == 0) && !sub_81040C8())
    {
        task->data[0]++;
    }
}

void sub_8104794(struct Task *task)
{
    s16 r4;
    gSpriteCoordOffsetX -= 8;
    task->data[1] += 8;
    task->data[3] += 8;
    r4 = ((task->data[1] - 8) & 0xff) >> 3;
    REG_BG1HOFS = task->data[1] & 0x1ff;
    if (task->data[3] >> 3 <= 25)
    {
        sub_8104A88(r4);
    }
    else
    {
        task->data[0]++;
    }
}

void sub_81047EC(struct Task *task)
{
    eSlotMachine->unk0B = 0;
    eSlotMachine->unk0A = eSlotMachine->unk05;
    gSpriteCoordOffsetX = 0;
    REG_BG1HOFS = 0;
    eSlotMachine->unk1A = 8;
    sub_810514C();
    sub_81054B8();
    sub_8105524();
    PlayNewMapMusic(eSlotMachine->backupMapMusic);
    if (eSlotMachine->unk0A == 0)
    {
        DestroyTask(FindTaskIdByFunc(sub_810434C));
    }
    else
    {
        sub_8104CAC(4);
        task->data[1] = dp15_jump_random_unknown();
        task->data[2] = 0;
        task->data[3] = 0;
        task->data[0]++;
    }
}

void sub_8104860(struct Task *task)
{
    if (eSlotMachine->unk1A == task->data[1])
    {
        task->data[0]++;
    }
    else if (eSlotMachine->unk1C[0] % 24 == 0 && (++task->data[2]& 0x07) == 0)
    {
        eSlotMachine->unk1A >>= 1;
    }
}

void sub_81048A8(struct Task *task)
{
    if (sub_8104E18())
    {
        DestroyTask(FindTaskIdByFunc(sub_810434C));
    }
}

void sub_81048CC(struct Task *task)
{
    sub_81054B8();
    sub_81056C0();
    sub_8105804();
    sub_8105854();
    gSprites[eSlotMachine->unk4E[0]].invisible = TRUE;
    StartSpriteAnimIfDifferent(gSprites + eSlotMachine->unk3F, 5);
    task->data[0]++;
    task->data[4] = 4;
    task->data[5] = 0;
    StopMapMusic();
    PlayFanfare(BGM_ME_ZANNEN);
    PlaySE(SE_W153);
}

void sub_8104940(struct Task *task)
{
    gSpriteCoordOffsetY = task->data[4];
    REG_BG1VOFS = task->data[4];
    if (task->data[5] & 0x01)
        task->data[4] = -task->data[4];
    if ((++task->data[5] & 0x1f) == 0)
        task->data[4] >>= 1;
    if (task->data[4] == 0)
    {
        sub_81058A0();
        sub_81058C4();
        sub_8105284();
        sub_81059E8();
        gSprites[eSlotMachine->unk4E[0]].invisible = FALSE;
        task->data[0]++;
        task->data[5] = 0;
    }
}

void sub_81049C8(struct Task *task)
{
    gSpriteCoordOffsetY = 0;
    REG_BG1VOFS = 0;
    if (sub_8105ACC())
    {
        task->data[0]++;
        sub_8105AEC();
    }
}

void sub_81049F8(struct Task *task)
{
    gSpriteCoordOffsetX = 0;
    REG_BG1HOFS = 0;
    PlayNewMapMusic(eSlotMachine->backupMapMusic);
    sub_810514C();
    sub_8105554();
    sub_8105524();
    sub_81059B8();
    DestroyTask(FindTaskIdByFunc(sub_810434C));
}

extern const u16 gReelTimeWindowTilemap[];

void sub_8104A40(s16 a0, s16 a1)
{
    s16 i;

    for (i = 4; i < 15; i++)
    {
        u16 tile = gReelTimeWindowTilemap[a1 + (i - 4) * 20];
        ((u16 *)BG_SCREEN_ADDR(28))[32 * i + a0] = tile;
    }
}

void sub_8104A88(s16 a0)
{
    s16 i;

    for (i = 4; i < 15; i++)
    {
        ((u16 *)BG_SCREEN_ADDR(28))[32 * i + a0] = 0;
    }
}

void sub_8104AB8(u8 a0)
{
    u8 taskId = CreateTask(sub_8104B0C, 1);
    gTasks[taskId].data[1] = a0;
    sub_8104B0C(taskId);
}

bool8 sub_8104AEC(void)
{
    if (FindTaskIdByFunc(sub_8104B0C) == 0xFF)
        return TRUE;
    return FALSE;
}

void (*const gUnknown_083ECC30[])(struct Task *task) = {
    sub_8104B3C,
    sub_8104B60,
    sub_8104B80,
    sub_8104B60,
    sub_8104BC8,
    sub_8104B60,
    sub_8104BFC,
    sub_8104B60,
    sub_8104C44
};

void sub_8104B0C(u8 taskId)
{
    gUnknown_083ECC30[gTasks[taskId].data[0]](gTasks + taskId);
}

void sub_8104B3C(struct Task *task)
{
    BeginNormalPaletteFade(-1, 0, 0, 16, 0);
    task->data[0]++;
}

void sub_8104B60(struct Task *task)
{
    if (!gPaletteFade.active)
    {
        task->data[0]++;
    }
}

void sub_8104B80(struct Task *task)
{
    sub_8104DA4();
    sub_81065DC();
    BasicInitMenuWindow(&gWindowConfig_81E7144);
    MenuPrint_PixelCoords(gOtherText_ReelTime, 10, 32, 1);
    BeginNormalPaletteFade(-1, 0, 16, 0, 0);
    task->data[0]++;
}

void sub_8104BC8(struct Task *task)
{
    if (gMain.newKeys & (B_BUTTON | SELECT_BUTTON))
    {
        BeginNormalPaletteFade(-1, 0, 0, 16, 0);
        task->data[0]++;
    }
}

void sub_8104BFC(struct Task *task)
{
    MenuZeroFillScreen();
    BasicInitMenuWindow(&gWindowConfig_81E7128);
    sub_81064B8();
    sub_8104CAC(task->data[1]);
    sub_810423C(eSlotMachine->unk02);
    BeginNormalPaletteFade(-1, 0, 16, 0, 0);
    task->data[0]++;
}

void sub_8104C44(struct Task *task)
{
    DestroyTask(FindTaskIdByFunc(sub_8104B0C));
}

void sub_8104C5C(void)
{
    u8 i;
    struct Task *task;
    i = CreateTask(sub_8104E74, 3);
    eSlotMachine->unk3D = i;
    task = gTasks + i;
    task->data[1] = -1;
    for (i = 4; i < 16; i++)
    {
        task->data[i] = MAX_SPRITES;
    }
}

static void LoadSlotMachineWheelOverlay(void);

void sub_8104CAC(u8 arg0) {
    u8 i;
    struct Task *task;

    sub_8104DA4();

    task = &gTasks[eSlotMachine->unk3D];
    task->data[1] = arg0;

    for (i = 0; gUnknown_083ED048[arg0][i].unk00 != 0xFF; i++)
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
    }
}

void sub_8104D30(u8 a0, SpriteCallback a1, s16 a2, s16 a3, s16 a4)
{
    u8 i;
    struct Task *task = gTasks + eSlotMachine->unk3D;
    for (i = 4; i < 16; i++)
    {
        if (task->data[i] == MAX_SPRITES)
        {
            task->data[i] = sub_8105BF8(a0, a1, a2, a3, a4);
            break;
        }
    }
}

void (*const gUnknown_083ED064[])(void);

void sub_8104DA4(void)
{
    u8 i;
    struct Task *task = gTasks + eSlotMachine->unk3D;
    if ((u16)task->data[1] != 0xFFFF)
        gUnknown_083ED064[task->data[1]]();
    for (i = 4; i < 16; i++)
    {
        if (task->data[i] != MAX_SPRITES)
        {
            DestroySprite(gSprites + task->data[i]);
            task->data[i] = MAX_SPRITES;
        }
    }
}

bool8 sub_8104E18(void)
{
    u8 i;
    struct Task *task = gTasks + eSlotMachine->unk3D;
    for (i = 4; i < 16; i++)
    {
        if (task->data[i] != MAX_SPRITES)
        {
            if (gSprites[task->data[i]].data[7])
                return FALSE;
        }
    }
    return TRUE;
}

void (*const gUnknown_083ECC54[])(struct Task *task) = {
    nullsub_69
};

void sub_8104E74(u8 taskId)
{
    gUnknown_083ECC54[gTasks[taskId].data[0]](gTasks + taskId);
}

void nullsub_69(struct Task *task)
{

}

extern const struct SpriteTemplate gSpriteTemplate_83ED414;

void sub_8104EA8(void)
{
    s16 i;
    s16 j;
    s16 x;
    for (i = 0, x = 0x30; i < 3; i++, x += 0x28)
    {
        for (j = 0; j < 120; j += 24)
        {
            struct Sprite *sprite = gSprites + CreateSprite(&gSpriteTemplate_83ED414, x, 0, 14);
            sprite->oam.priority = 3;
            sprite->data[0] = i;
            sprite->data[1] = j;
            sprite->data[3] = -1;
        }
    }
}

void sub_8104F18(struct Sprite *sprite)
{
    sprite->data[2] = eSlotMachine->unk1C[sprite->data[0]] + sprite->data[1];
    sprite->data[2] %= 120;
    sprite->pos1.y = eSlotMachine->unk22[sprite->data[0]] + 28 + sprite->data[2];
    sprite->sheetTileStart = GetSpriteTileStartByTag(sub_8102BA4(sprite->data[0], sprite->data[2] / 24));
    SetSpriteSheetFrameTileNum(sprite);
}

void sub_8104F8C(void)
{
    s16 i;
    s16 x;
    for (x = 203, i = 1; i < 10000; i *= 10, x -= 7)
    {
        sub_8104FF4(x, 23, 0, i);
    }
    for (x = 235, i = 1; i < 10000; i *= 10, x -= 7)
    {
        sub_8104FF4(x, 23, 1, i);
    }
}

extern const struct SpriteTemplate gSpriteTemplate_83ED42C;

void sub_8104FF4(s16 x, s16 y, u8 a2, s16 a3)
{
    struct Sprite *sprite = gSprites + CreateSprite(&gSpriteTemplate_83ED42C, x, y, 13);
    sprite->oam.priority = 2;
    sprite->data[0] = a2;
    sprite->data[1] = a3;
    sprite->data[2] = a3 * 10;
    sprite->data[3] = -1;
}

void sub_810506C(struct Sprite *sprite)
{
    u16 tag = eSlotMachine->coins;
    if (sprite->data[0])
        tag = eSlotMachine->unk0E;
    if (sprite->data[3] != tag)
    {
        sprite->data[3] = tag;
        tag %= (u16)sprite->data[2];
        tag /= (u16)sprite->data[1];
        tag += 7;
        sprite->sheetTileStart = GetSpriteTileStartByTag(tag);
        SetSpriteSheetFrameTileNum(sprite);
    }
}

extern const struct SpriteTemplate gSpriteTemplate_83ED444;
extern const struct SubspriteTable gSubspriteTables_83ED704[];

void sub_81050C4(void)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_83ED444, 0x58, 0x48, 15);
    gSprites[spriteId].oam.priority = 3;
    SetSubspriteTables(gSprites + spriteId, gSubspriteTables_83ED704);
}

extern const struct SpriteTemplate gSpriteTemplate_83ED45C;

void sub_8105100(void)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_83ED45C, 0x118, 0x50, 1);
    gSprites[spriteId].oam.priority = 1;
    gSprites[spriteId].coordOffsetEnabled = TRUE;
    eSlotMachine->unk3F = spriteId;
}

void sub_810514C(void)
{
    DestroySprite(gSprites + eSlotMachine->unk3F);
}

void sub_8105170(struct Sprite *sprite)
{
    sprite->pos2.y = sprite->pos2.x = 0;
    if (sprite->animNum == 4)
    {
        sprite->pos2.y = sprite->pos2.x = 8;
        if ((sprite->animCmdIndex != 0 && sprite->animDelayCounter != 0) || (sprite->animCmdIndex == 0 && sprite->animDelayCounter == 0))
        {
            sprite->pos2.y = -8;
        }
    }
}

extern const struct SpriteTemplate gSpriteTemplate_83ED474;
extern const struct SpriteTemplate gSpriteTemplate_83ED48C;
extern const struct SubspriteTable gSubspriteTables_83ED73C[];
extern const struct SubspriteTable gSubspriteTables_83ED75C[];

void sub_81051C0(void)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_83ED474, 0x170, 0x34, 7);
    struct Sprite *sprite = gSprites + spriteId;
    sprite->oam.priority = 1;
    sprite->coordOffsetEnabled = TRUE;
    SetSubspriteTables(sprite, gSubspriteTables_83ED73C);
    eSlotMachine->unk49[0] = spriteId;

    spriteId = CreateSprite(&gSpriteTemplate_83ED48C, 0x170, 0x54, 7);
    sprite = gSprites + spriteId;
    sprite->oam.priority = 1;
    sprite->coordOffsetEnabled = TRUE;
    SetSubspriteTables(sprite, gSubspriteTables_83ED75C);
    eSlotMachine->unk49[1] = spriteId;
}

extern const struct SpriteTemplate gSpriteTemplate_83ED4A4;
extern const struct SubspriteTable gSubspriteTables_83ED78C[];

void sub_8105284(void)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_83ED4A4, 0xa8 - gSpriteCoordOffsetX, 0x50, 7);
    struct Sprite *sprite = gSprites + spriteId;
    sprite->oam.priority = 1;
    sprite->coordOffsetEnabled = TRUE;
    SetSubspriteTables(sprite, gSubspriteTables_83ED78C);
    eSlotMachine->unk42 = spriteId;
}

extern const struct SpriteTemplate gSpriteTemplate_83ED4BC;

void sub_81052EC(void)
{
    u8 i;
    s16 r5;
    for (i = 0, r5 = 0; i < 3; i++, r5 += 20)
    {
        u8 spriteId = CreateSprite(&gSpriteTemplate_83ED4BC, 0x170, 0x00, 10);
        struct Sprite *sprite = gSprites + spriteId;
        sprite->oam.priority = 1;
        sprite->coordOffsetEnabled = TRUE;
        sprite->data[7] = r5;
        eSlotMachine->unk4B[i] = spriteId;
    }
}

void sub_810535C(struct Sprite *sprite)
{
    s16 r0 = (u16)(eSlotMachine->unk14 + sprite->data[7]);
    r0 %= 40;
    sprite->pos1.y = r0 + 59;
    StartSpriteAnimIfDifferent(sprite, sub_8102C48(r0 / 20));
}

extern const struct SpriteTemplate gSpriteTemplate_83ED4D4;
extern const struct SubspriteTable gSubspriteTables_83ED7B4[];

void sub_81053A0(void)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_83ED4D4, 0x170, 0x64, 9);
    struct Sprite *sprite = gSprites + spriteId;
    sprite->coordOffsetEnabled = TRUE;
    sprite->oam.priority = 1;
    SetSubspriteTables(sprite, gSubspriteTables_83ED7B4);
    eSlotMachine->unk4E[0] = spriteId;

    spriteId = CreateSprite(&gSpriteTemplate_83ED4D4, 0x120, 0x68, 4);
    sprite = gSprites + spriteId;
    sprite->coordOffsetEnabled = TRUE;
    sprite->oam.priority = 1;
    SetSubspriteTables(sprite, gSubspriteTables_83ED7B4);
    eSlotMachine->unk4E[1] = spriteId;
}

extern const struct SpriteTemplate gSpriteTemplate_83ED4EC;
extern const struct SubspriteTable gSubspriteTables_83ED7D4[];

void sub_810545C(void)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_83ED4EC, 0x170, 0x4c, 11);
    struct Sprite *sprite = gSprites + spriteId;
    sprite->coordOffsetEnabled = TRUE;
    sprite->oam.priority = 1;
    SetSubspriteTables(sprite, gSubspriteTables_83ED7D4);
    eSlotMachine->unk40 = spriteId;
}

void sub_81054B8(void)
{
    u8 i;

    DestroySprite(gSprites + eSlotMachine->unk40);
    for (i = 0; i < 2; i++)
    {
        DestroySprite(gSprites + eSlotMachine->unk49[i]);
    }
    for (i = 0; i < 3; i++)
    {
        DestroySprite(gSprites + eSlotMachine->unk4B[i]);
    }
}

void sub_8105524(void)
{
    u8 i;
    for (i = 0; i < 2; i++)
    {
        DestroySprite(gSprites + eSlotMachine->unk4E[i]);
    }
}

void sub_8105554(void)
{
    DestroySprite(gSprites + eSlotMachine->unk42);
}

extern const struct SpriteTemplate gSpriteTemplate_83ED504;

void sub_8105578(void)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_83ED504, 0x98, 0x20, 5);
    struct Sprite *sprite = gSprites + spriteId;
    sprite->oam.priority = 1;
    sprite->hFlip = TRUE;
    eSlotMachine->unk50[0] = spriteId;
    sprite->data[0] = 8;
    sprite->data[1] = -1;
    sprite->data[2] = -1;
    sprite->data[7] = 0x20;

    spriteId = CreateSprite(&gSpriteTemplate_83ED504, 0xb8, 0x20, 5);
    sprite = gSprites + spriteId;
    sprite->oam.priority = 1;
    eSlotMachine->unk50[1] = spriteId;
    sprite->data[1] = 1;
    sprite->data[2] = -1;
    sprite->data[7] = 0x20;
}

void sub_810562C(struct Sprite *sprite)
{
    if (sprite->data[0] != 0)
    {
        sprite->data[0]--;
        sprite->pos2.x = 0;
        sprite->pos2.y = 0;
        sprite->invisible = TRUE;
    }
    else
    {
        sprite->invisible = FALSE;
        sprite->pos2.x += sprite->data[1];
        sprite->pos2.y += sprite->data[2];
        if (++sprite->data[3] >= 8)
        {
            sprite->data[0] = sprite->data[7];
            sprite->data[3] = 0;
        }
    }
}

void sub_8105688(s16 a0)
{
    gSprites[eSlotMachine->unk50[0]].data[7] = a0;
    gSprites[eSlotMachine->unk50[1]].data[7] = a0;
}

void sub_81056C0(void)
{
    u8 i;

    for (i = 0; i < 2; i++)
    {
        DestroySprite(gSprites + eSlotMachine->unk50[i]);
    }
}

extern const struct SpriteTemplate gSpriteTemplate_83ED51C;

void sub_81056F0(void)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_83ED51C, 0x48, 0x50, 3);
    gSprites[spriteId].oam.priority = 1;
    gSprites[spriteId].data[0] = 1;
    gSprites[spriteId].data[5] = 0;
    gSprites[spriteId].data[6] = 16;
    gSprites[spriteId].data[7] = 8;
    eSlotMachine->unk52[0] = spriteId;

    spriteId = CreateSprite(&gSpriteTemplate_83ED51C, 0x68, 0x50, 3);
    gSprites[spriteId].oam.priority = 1;
    gSprites[spriteId].hFlip = TRUE;
    eSlotMachine->unk52[1] = spriteId;
}

extern const u8 gUnknown_083ECC58[2]; // don't remove this until decompiled through gUnknown_083ECCF8

void sub_8105784(struct Sprite *sprite)
{
    u8 sp[] = {16, 0};
    if (sprite->data[0] && --sprite->data[6] <= 0)
    {
        MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(7) << 4) + 0x103, sp[sprite->data[5]], sp[sprite->data[5]], sp[sprite->data[5]]);
        ++sprite->data[5];
        sprite->data[5] &= 1;
        sprite->data[6] = sprite->data[7];
    }
}

void sub_81057E8(s16 a0)
{
    gSprites[eSlotMachine->unk52[0]].data[7] = a0;
}

void sub_8105804(void)
{
    u8 i;
    MultiplyInvertedPaletteRGBComponents((IndexOfSpritePaletteTag(7) << 4) + 0x103, 0, 0, 0);
    for (i = 0; i < 2; i++)
    {
        DestroySprite(gSprites + eSlotMachine->unk52[i]);
    }
}

extern const struct SpriteTemplate gSpriteTemplate_83ED534;

void sub_8105854(void)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_83ED534, 0xa8, 0x50, 6);
    gSprites[spriteId].oam.priority = 1;
    eSlotMachine->unk41 = spriteId;
}

void sub_8105894(struct Sprite *sprite)
{
    sprite->pos2.y = gSpriteCoordOffsetY;
}

void sub_81058A0(void)
{
    DestroySprite(gSprites + eSlotMachine->unk41);
}

extern const struct SpriteTemplate gSpriteTemplate_83ED54C;

void sub_81058C4(void)
{
    u8 i;
    u16 sp[] = {0x0, 0x40, 0x80, 0xC0};
    for (i = 0; i < 4; i++)
    {
        u8 spriteId = CreateSprite(&gSpriteTemplate_83ED54C, 0x50 - gSpriteCoordOffsetX, 0x44, 0);
        struct Sprite *sprite = gSprites + spriteId;
        sprite->oam.priority = 1;
        sprite->coordOffsetEnabled = TRUE;
        sprite->data[0] = sp[i];
        eSlotMachine->unk54[i] = spriteId;
    }
}

void sub_810594C(struct Sprite *sprite)
{
    sprite->data[0] -= 2;
    sprite->data[0] &= 0xff;
    sprite->pos2.x = Cos(sprite->data[0], 20);
    sprite->pos2.y = Sin(sprite->data[0], 6);
    sprite->subpriority = 0;
    if (sprite->data[0] >= 0x80)
    {
        sprite->subpriority = 2;
    }
    if (++sprite->data[1] >= 16)
    {
        sprite->hFlip ^= 1;
        sprite->data[1] = 0;
    }
}

void sub_81059B8(void)
{
    u8 i;
    for (i = 0; i < 4; i++)
    {
        DestroySprite(gSprites + eSlotMachine->unk54[i]);
    }
}

extern const struct SpriteTemplate gSpriteTemplate_83ED564;

void sub_81059E8(void)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_83ED564, 0xa8, 0x3c, 8);
    struct Sprite *sprite = gSprites + spriteId;
    sprite->oam.priority = 1;
    sprite->oam.affineMode = ST_OAM_AFFINE_DOUBLE;
    InitSpriteAffineAnim(sprite);
    eSlotMachine->unk43 = spriteId;
}

void sub_8105A38(struct Sprite *sprite)
{
    if (sprite->data[0] == 0)
    {
        if (sprite->affineAnimEnded)
            sprite->data[0]++;
    }
    else if (sprite->data[0] == 1)
    {
        sprite->invisible ^= 1;
        if (++sprite->data[2] >= 24)
        {
            sprite->data[0]++;
            sprite->data[2] = 0;
        }
    }
    else
    {
        sprite->invisible = TRUE;
        if (++sprite->data[2] >= 16)
            sprite->data[7] = 1;
    }
    sprite->data[1] &= 0xff;
    sprite->data[1] += 16;
    sprite->pos2.y -= (sprite->data[1] >> 8);
}

u8 sub_8105ACC(void)
{
    return gSprites[eSlotMachine->unk43].data[7];
}

void sub_8105AEC(void)
{
    struct Sprite *sprite = gSprites + eSlotMachine->unk43;
    FreeOamMatrix(sprite->oam.matrixNum);
    DestroySprite(sprite);
}

extern const struct SpriteTemplate gSpriteTemplate_83ED6CC;

u8 sub_8105B1C(s16 x, s16 y)
{
    u8 spriteId = CreateSprite(&gSpriteTemplate_83ED6CC, x, y, 12);
    struct Sprite *sprite = gSprites + spriteId;
    sprite->oam.priority = 2;
    sprite->oam.affineMode = ST_OAM_AFFINE_DOUBLE;
    InitSpriteAffineAnim(sprite);
    return spriteId;
}

void sub_8105B70(struct Sprite *sprite)
{
    if (sprite->affineAnimEnded)
        sprite->data[7] = 1;
}

void sub_8105B88(u8 spriteId)
{
    struct Sprite *sprite = gSprites + spriteId;
    FreeOamMatrix(sprite->oam.matrixNum);
    DestroySprite(sprite);
}

const s16 gUnknown_083ECE7E[][2];
const SpriteCallback gUnknown_083ECF0C[];

u8 sub_8105BB4(u8 a0, u8 a1, s16 a2)
{
    return sub_8105BF8(a0, gUnknown_083ECF0C[a1], gUnknown_083ECE7E[a1][0], gUnknown_083ECE7E[a1][1], a2);
}

const struct SpriteTemplate *const gUnknown_083EDB5C[];
const struct SubspriteTable *const gUnknown_083EDBC4[];

u8 sub_8105BF8(u8 templateIdx, SpriteCallback callback, s16 x, s16 y, s16 a4)
{
    u8 spriteId = CreateSprite(gUnknown_083EDB5C[templateIdx], x, y, 16);
    struct Sprite *sprite = gSprites + spriteId;
    sprite->oam.priority = 3;
    sprite->callback = callback;
    sprite->data[6] = a4;
    sprite->data[7] = 1;
    if (gUnknown_083EDBC4[templateIdx])
        SetSubspriteTables(sprite, gUnknown_083EDBC4[templateIdx]);
    return spriteId;
}

void sub_8105C64(struct Sprite *sprite)
{
    sprite->data[7] = 0;
}

void sub_8105C6C(struct Sprite *sprite)
{
    s16 sp0[] = {4, -4, 4, -4};
    s16 sp8[] = {4, 4, -4, -4};

    if (sprite->data[1]++ >= 16)
    {
        sprite->subspriteTableNum ^= 1;
        sprite->data[1] = 0;
    }
    sprite->pos2.x = 0;
    sprite->pos2.y = 0;
    if (sprite->subspriteTableNum != 0)
    {
        sprite->pos2.x = sp0[sprite->data[6]];
        sprite->pos2.y = sp8[sprite->data[6]];
    }
}

void sub_8105CF0(struct Sprite *sprite)
{
    sprite->hFlip = TRUE;
    sub_8105C6C(sprite);
}

void sub_8105D08(struct Sprite *sprite)
{
    sprite->vFlip = TRUE;
    sub_8105C6C(sprite);
}

void sub_8105D20(struct Sprite *sprite)
{
    sprite->hFlip = TRUE;
    sprite->vFlip = TRUE;
    sub_8105C6C(sprite);
}

void sub_8105D3C(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
        case 0:
            sprite->pos1.x += 4;
            if (sprite->pos1.x >= 0xd0)
            {
                sprite->pos1.x = 0xd0;
                sprite->data[0]++;
            }
            break;
        case 1:
            if (++sprite->data[1] > 90)
            {
                sprite->data[0]++;
            }
            break;
        case 2:
            sprite->pos1.x += 4;
            if (sprite->pos1.x >= 0x110)
            {
                sprite->data[0]++;
            }
            break;
        case 3:
            sprite->data[7] = 0;
            break;
    }
}

void sub_8105DA4(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
        case 0:
            sprite->pos1.x -= 4;
            if (sprite->pos1.x <= 0xd0)
            {
                sprite->pos1.x = 0xd0;
                sprite->data[0]++;
            }
            break;
        case 1:
            if (++sprite->data[1] > 90)
            {
                sprite->data[0]++;
            }
            break;
        case 2:
            sprite->pos1.x -= 4;
            if (sprite->pos1.x <= 0x90)
            {
                sprite->data[0]++;
            }
            break;
        case 3:
            sprite->data[7] = 0;
            break;
    }
}

void sub_8105E08(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
        case 0:
            StartSpriteAnim(sprite, eSlotMachine->unk0A - 1);
            sprite->data[0]++;
            // fallthrough
        case 1:
            if (++sprite->data[1] >= 4)
            {
                sprite->data[0]++;
                sprite->data[1] = 0;
            }
            break;
        case 2:
            sprite->pos1.x += 4;
            if (sprite->pos1.x >= 0xd0)
            {
                sprite->pos1.x = 0xd0;
                sprite->data[0]++;
            }
            break;
        case 3:
            if (++sprite->data[1] > 90)
            {
                sprite->data[0]++;
            }
            break;
        case 4:
            sprite->pos1.x += 4;
            if (sprite->pos1.x >= 0xf8)
            {
                sprite->data[0]++;
            }
            break;
        case 5:
            sprite->data[7] = 0;
            break;
    }
}

void sub_8105EB4(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
        case 0:
            sprite->animPaused = TRUE;
            sprite->data[0]++;
            // fallthrough
        case 1:
            sprite->pos1.y += 8;
            if (sprite->pos1.y >= 0x70)
            {
                sprite->pos1.y = 0x70;
                sprite->data[1] = 16;
                sprite->data[0]++;
            }
            break;
        case 2:
            if (sprite->data[2] == 0)
            {
                sprite->pos1.y -= sprite->data[1];
                sprite->data[1] = -sprite->data[1];
                if (++sprite->data[3] >= 2)
                {
                    sprite->data[1] >>= 2;
                    sprite->data[3] = 0;
                    if (sprite->data[1] == 0)
                    {
                        sprite->data[0]++;
                        sprite->data[7] = 0;
                        sprite->animPaused = FALSE;
                    }
                }
            }
            sprite->data[2]++;
            sprite->data[2] &= 0x07;
            break;
    }
}

void sub_8105F54(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
        case 0:
            if (++sprite->data[1] > 8)
            {
                sprite->data[0]++;
            }
            break;
        case 1:
            sprite->pos1.y += 2;
            if (sprite->pos1.y >= 0x30)
            {
                sprite->pos1.y = 0x30;
                sprite->data[0]++;
                sprite->data[7] = 0;
            }
            break;
    }
}

void sub_8105F9C(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
        case 0:
            sprite->invisible = TRUE;
            if (++sprite->data[1] > 0x20)
            {
                sprite->data[0]++;
                sprite->data[1] = 5;
                sprite->oam.mosaic = TRUE;
                sprite->invisible = FALSE;
                StartSpriteAnim(sprite, 1);
                REG_MOSAIC = ((sprite->data[1] << 4) | sprite->data[1]) << 8;
            }
            break;
        case 1:
            sprite->data[1] -= (sprite->data[2] >> 8);
            if (sprite->data[1] < 0)
            {
                sprite->data[1] = 0;
            }
            REG_MOSAIC = ((sprite->data[1] << 4) | sprite->data[1]) << 8;
            sprite->data[2] &= 0xff;
            sprite->data[2] += 0x80;
            if (sprite->data[1] == 0)
            {
                sprite->data[0]++;
                sprite->data[7] = 0;
                sprite->oam.mosaic = FALSE;
                StartSpriteAnim(sprite, 0);
            }
            break;
    }
}

extern const u16 *const gUnknown_083EDE10[];

void sub_8106058(struct Sprite *sprite)
{
    if (sprite->data[1] < 3)
    {
        LoadPalette(gUnknown_083EDE10[sprite->data[1]], (IndexOfSpritePaletteTag(6) << 4) + 0x100, 0x20);
        if (++sprite->data[2] >= 4)
        {
            sprite->data[1]++;
            sprite->data[2] = 0;
        }
    }
    else
    {
        LoadPalette(gUnknown_083EDE10[sprite->data[1]], (IndexOfSpritePaletteTag(6) << 4) + 0x100, 0x20);
        if (++sprite->data[2] >= 25)
        {
            sprite->data[1] = 0;
            sprite->data[2] = 0;
        }
    }
    StartSpriteAnimIfDifferent(sprite, 1);
    sprite->data[7] = 0;
}

void sub_81060FC(struct Sprite *sprite)
{
    s16 sp00[] = {0, -40, 0, 0, 48, 0, 24, 0};
    s16 sp10[] = {-32, 0, -32, -48, 0, -48, 0, -48};
    s16 sp20[] = {16, 12, 16, 0, 0, 4, 8, 8};

    switch (sprite->data[0])
    {
        case 0:
            sprite->pos2.x = sp00[sprite->data[6]];
            sprite->pos2.y = sp10[sprite->data[6]];
            sprite->data[1] = sp20[sprite->data[6]];
            sprite->data[0]++;
            // fallthrough
        case 1:
            if (sprite->data[1]-- == 0)
            {
                sprite->data[0]++;
            }
            break;
        case 2:
            if (sprite->pos2.x > 0)
            {
                sprite->pos2.x -= 4;
            }
            else if (sprite->pos2.x < 0)
            {
                sprite->pos2.x += 4;
            }
            if (sprite->pos2.y > 0)
            {
                sprite->pos2.y -= 4;
            }
            else if (sprite->pos2.y < 0)
            {
                sprite->pos2.y += 4;
            }
            if (sprite->pos2.x == 0 && sprite->pos2.y == 0)
            {
                sprite->data[0]++;
            }
            break;
    }
}

void sub_81061C8(struct Sprite *sprite)
{
    s16 sp0[] = {160, 192, 224, 104, 80, 64, 48, 24};

    if (sprite->data[0] == 0)
    {
        sprite->data[0]++;
        sprite->data[1] = 12;
    }
    sprite->pos2.x = Cos(sp0[sprite->data[6]], sprite->data[1]);
    sprite->pos2.y = Sin(sp0[sprite->data[6]], sprite->data[1]);
    if (sprite->data[1])
    {
        sprite->data[1]--;
    }
}

void sub_8106230(struct Sprite *sprite)
{
    switch (sprite->data[0])
    {
        case 0:
            eSlotMachine->winIn = 0x2f;
            eSlotMachine->winOut = 0x3f;
            eSlotMachine->win0v = 0x2088;
            sprite->invisible = TRUE;
            sprite->data[0]++;
            // fallthrough
        case 1:
            sprite->data[1] += 2;
            sprite->data[2] = sprite->data[1] + 0xb0;
            sprite->data[3] = 0xf0 - sprite->data[1];
            if (sprite->data[2] > 0xd0)
            {
                sprite->data[2] = 0xd0;
            }
            if (sprite->data[3] < 0xd0)
            {
                sprite->data[3] = 0xd0;
            }
            eSlotMachine->win0h = (sprite->data[2] << 8) | sprite->data[3];
            if (sprite->data[1] > 0x33)
            {
                sprite->data[0]++;
                eSlotMachine->winIn = 0x3f;
            }
            break;
        case 2:
            if (eSlotMachine->bet == 0)
            {
                break;
            }
            sub_8104D30(5, SpriteCallbackDummy, 0xd0, 0x74, 0);
            eSlotMachine->win0h = 0xc0e0;
            eSlotMachine->win0v = 0x6880;
            eSlotMachine->winIn = 0x2f;
            sprite->data[0]++;
            sprite->data[1] = 0;
            // fallthrough
        case 3:
            sprite->data[1] += 2;
            sprite->data[2] = sprite->data[1] + 0xc0;
            sprite->data[3] = 0xe0 - sprite->data[1];
            if (sprite->data[2] > 0xd0)
            {
                sprite->data[2] = 0xd0;
            }
            if (sprite->data[3] < 0xd0)
            {
                sprite->data[3] = 0xd0;
            }
            eSlotMachine->win0h = (sprite->data[2] << 8) | sprite->data[3];
            if (sprite->data[1] > 0x0f)
            {
                sprite->data[0]++;
                eSlotMachine->winIn = 0x3f;
            }
            break;
    }
}

void nullsub_70(void)
{

}

void sub_8106364(void)
{
    REG_MOSAIC = 0;
}

extern const u16 *const gUnknown_083EDE20;

void sub_8106370(void)
{
    LoadPalette(gUnknown_083EDE20, (IndexOfSpritePaletteTag(6) << 4) + 0x100, 0x20);
}

void sub_810639C(void)
{
    eSlotMachine->win0h = 0xf0;
    eSlotMachine->win0v = 0xa0;
    eSlotMachine->winIn = 0x3f;
    eSlotMachine->winOut = 0x3f;
}

extern const u8 gSlotMachineReelTimeLights_Gfx[];
extern const u8 gUnknown_083EDE8C[];
const struct SpriteSheet gUnknown_083EDC2C[];
extern const struct SpritePalette gSlotMachineSpritePalettes[];

void sub_81063C0(void)
{
    sub_8106404();
    LZDecompressWram(gSlotMachineReelTimeLights_Gfx, ewram10000);
    LZDecompressWram(gUnknown_083EDE8C, ewram13200);
    LoadSpriteSheets(gUnknown_083EDC2C);
    LoadSpritePalettes(gSlotMachineSpritePalettes);
}

const u8 *const gUnknown_083EDCE4;
const struct SpriteSheet gUnknown_083EDCDC;

void sub_8106404(void)
{
    u8 *dest = ewram10000;
    u8 i = 0;
    const struct SpriteSheet *sheet = &gUnknown_083EDCDC;
    const u8 *src = gUnknown_083EDCE4;
    for (i = 0; i < 0x40; i++)
    {
        u8 j;
        for (j = 0; j < 0x20; j++, dest++)
        {
            *dest = src[j];
        }
    }
    LoadSpriteSheet(sheet);
}

static void sub_8106448(void) {
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

const u8 gUnknown_083ECCB2[][21] = {
    {0, 4, 2, 6, 5, 3, 1, 3, 4, 5, 6, 2, 0, 5, 3, 6, 2, 1, 5, 3, 6},
    {0, 4, 6, 3, 2, 4, 6, 5, 5, 3, 1, 3, 6, 4, 2, 3, 6, 4, 3, 6, 4},
    {0, 5, 1, 6, 3, 2, 6, 3, 5, 2, 6, 3, 2, 5, 6, 3, 2, 5, 6, 3, 4}
};

const u8 gUnknown_083ECCF1[] = {
    1, 0, 5, 4, 3, 2
};

const s16 gUnknown_083ECCF8[][2] = {
    {0,  6},
    {0, 10},
    {0,  2}
};

const u8 gUnknown_083ECD04[][3] = {
    {1, 1, 12},
    {1, 1, 14},
    {2, 2, 14},
    {2, 2, 14},
    {2, 3, 16},
    {3, 3, 16}
};

const u8 gUnknown_083ECD16[][6] = {
    {25, 25, 30, 40, 40, 50},
    {25, 25, 30, 30, 35, 35},
    {25, 25, 30, 25, 25, 30}
};

const u8 gUnknown_083ECD28[][6] = {
    {20, 25, 25, 20, 25, 25},
    {12, 15, 15, 18, 19, 22},
    {25, 25, 25, 30, 30, 40},
    {25, 25, 20, 20, 15, 15},
    {40, 40, 35, 35, 40, 40}
};

const u8 gUnknown_083ECD46[][17] = {
    {243, 243, 243,  80,  80,  80,  80,  40,  40,  40,  40,  40,  40,   5,   5,   5,   5},
    {  5,   5,   5, 150, 150, 150, 150, 130, 130, 130, 130, 130, 130, 100, 100, 100,   5},
    {  4,   4,   4,  20,  20,  20,  20,  80,  80,  80,  80,  80,  80, 100, 100, 100,  40},
    {  2,   2,   2,   3,   3,   3,   3,   3,   3,   3,   3,   3,   3,  45,  45,  45, 100},
    {  1,   1,   1,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   5,   5,   5, 100},
    {  1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   6}
};

const u8 gUnknown_083ECDAC[][17] = {
    { 243, 243, 243, 200, 200, 200, 200, 160, 160, 160, 160, 160, 160,  70,  70,  70,   5},
    {   5,   5,   5,  25,  25,  25,  25,   5,   5,   5,   5,   5,   5,   2,   2,   2,   6},
    {   4,   4,   4,  25,  25,  25,  25,  30,  30,  30,  30,  30,  30,  40,  40,  40,  35},
    {   2,   2,   2,   3,   3,   3,   3,  30,  30,  30,  30,  30,  30, 100, 100, 100,  50},
    {   1,   1,   1,   2,   2,   2,   2,  30,  30,  30,  30,  30,  30,  40,  40,  40, 100},
    {   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   4,   4,   4,  60}
};

const u16 gUnknown_083ECE12[] = {
    0x80, 0xaf, 0xc8, 0xe1, 0x100
};

const u16 gUnknown_083ECE1C[][2] = {
    {10,  5},
    {10, 10},
    {10, 15},
    {10, 25},
    {10, 35}
};

const u16 gUnknown_083ECE30[] = {
    0, 5, 10, 15, 20
};


const u8 gUnknown_083ECE3A[] = {
    6, 4, 3, 2, 5, 0, 0, 0
};

const u16 gUnknown_083ECE42[] = {
    0x80, 0x20, 0x40
};

const u16 gUnknown_083ECE48[] = {
    0x10, 0x08, 0x04, 0x02, 0x01
};

const u8 gUnknown_083ECE52[] = {
    7, 8, 4, 3, 0, 5, 2
};

const u16 gUnknown_083ECE5A[] = {
    0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x100
};

const u16 gUnknown_083ECE6C[] = {
    2, 4, 0, 6, 12, 3, 90, 300, 300
};

const s16 gUnknown_083ECE7E[][2] = {
    { 0xd0, 0x38},
    { 0xb8, 0x00},
    { 0xc8, 0x08},
    { 0xd8, 0x10},
    { 0xe8, 0x18},
    { 0xd0, 0x48},
    { 0xd0, 0x08},
    { 0xd0, 0x40},
    { 0xd0, 0x38},
    { 0xc0, 0x58},
    { 0xe0, 0x58},
    { 0xc0, 0x78},
    { 0xe0, 0x78},
    { 0x90, 0x38},
    {0x110, 0x58},
    { 0xa8, 0x70},
    { 0xd0, 0x54},
    { 0xd0, 0x70},
    { 0xbc, 0x34},
    { 0xd0, 0x34},
    { 0xe4, 0x34},
    { 0xb8, 0x48},
    { 0xc4, 0x48},
    { 0xd0, 0x48},
    { 0xdc, 0x48},
    { 0xe8, 0x48},
    { 0xbc, 0x34},
    { 0xd0, 0x34},
    { 0xe4, 0x34},
    { 0xb8, 0x48},
    { 0xc4, 0x48},
    { 0xd0, 0x48},
    { 0xdc, 0x48},
    { 0xe8, 0x48},
    { 0x00, 0x00}
};

const SpriteCallback gUnknown_083ECF0C[] = {
    sub_8105C64,
    sub_8105F54,
    sub_8105F54,
    sub_8105F54,
    sub_8105F54,
    sub_8105F9C,
    sub_8105EB4,
    sub_8105C64,
    sub_8105C64,
    sub_8105C6C,
    sub_8105CF0,
    sub_8105D08,
    sub_8105D20,
    sub_8105D3C,
    sub_8105DA4,
    sub_8105E08,
    sub_8105C64,
    sub_8106058,
    sub_81060FC,
    sub_81060FC,
    sub_81060FC,
    sub_81060FC,
    sub_81060FC,
    sub_81060FC,
    sub_81060FC,
    sub_81060FC,
    sub_81061C8,
    sub_81061C8,
    sub_81061C8,
    sub_81061C8,
    sub_81061C8,
    sub_81061C8,
    sub_81061C8,
    sub_81061C8,
    sub_8106230
};

static const struct UnkStruct1 Unknown_83ECF98[] = {
    {25, 34, 0},
    {2, 0, 0},
    {9, 16, 0},
    {255, 0, 0}
};

static const struct UnkStruct1 Unknown_83ECFA8[] = {
    {10, 1, 0},
    {11, 2, 0},
    {12, 3, 0},
    {13, 4, 0},
    {5, 5, 0},
    {8, 6, 0},
    {255, 0, 0}
};

static const struct UnkStruct1 Unknown_83ECFC4[] = {
    {3, 7, 0},
    {8, 17, 0},
    {255, 0, 0}
};

static const struct UnkStruct1 Unknown_83ECFD0[] = {
    {4, 8, 0},
    {6, 9, 0},
    {6, 10, 1},
    {6, 11, 2},
    {6, 12, 3},
    {255, 0, 0}
};

static const struct UnkStruct1 Unknown_83ECFE8[] = {
    {0, 13, 0},
    {1, 14, 0},
    {7, 15, 0},
    {255, 0, 0}
};

static const struct UnkStruct1 Unknown_83ECFF8[] = {
    {19, 26, 0},
    {20, 27, 1},
    {21, 28, 2},
    {14, 29, 3},
    {15, 30, 4},
    {16, 31, 5},
    {17, 32, 6},
    {18, 33, 7},
    {8, 17, 0},
    {255, 0, 0}
};

static const struct UnkStruct1 Unknown_83ED020[] = {
    {22, 18, 0},
    {23, 19, 1},
    {24, 20, 2},
    {14, 21, 3},
    {15, 22, 4},
    {16, 23, 5},
    {17, 24, 6},
    {18, 25, 7},
    {8, 17, 0},
    {255, 0, 0}
};

const struct UnkStruct1 *const gUnknown_083ED048[] = {
    Unknown_83ECF98,
    Unknown_83ECFA8,
    Unknown_83ECFC4,
    Unknown_83ECFD0,
    Unknown_83ECFE8,
    Unknown_83ED020,
    Unknown_83ECFF8
};

void (*const gUnknown_083ED064[])(void) = {
    sub_810639C,
    sub_8106364,
    sub_8106370,
    nullsub_70,
    nullsub_70,
    sub_8106370,
    sub_8106370
};


const struct OamData gOamData_83ED080 = {
    .y = 0x0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .x = 0x0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0
};

const struct OamData gOamData_83ED088 = {
    .y = 0x0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_V_RECTANGLE,
    .x = 0x0,
    .matrixNum = 0,
    .size = 0,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0
};

const struct OamData gOamData_83ED090 = {
    .y = 0x0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .x = 0x0,
    .matrixNum = 0,
    .size = 1,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0
};

const struct OamData gOamData_83ED098 = {
    .y = 0x0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_V_RECTANGLE,
    .x = 0x0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0
};

const struct OamData gOamData_83ED0A0 = {
    .y = 0x0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .x = 0x0,
    .matrixNum = 0,
    .size = 2,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0
};

const struct OamData gOamData_83ED0A8 = {
    .y = 0x0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_V_RECTANGLE,
    .x = 0x0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0
};

const struct OamData gOamData_83ED0B0 = {
    .y = 0x0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_H_RECTANGLE,
    .x = 0x0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0
};

const struct OamData gOamData_83ED0B8 = {
    .y = 0x0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .mosaic = FALSE,
    .bpp = ST_OAM_4BPP,
    .shape = ST_OAM_SQUARE,
    .x = 0x0,
    .matrixNum = 0,
    .size = 3,
    .tileNum = 0x0,
    .priority = 0,
    .paletteNum = 0,
    .affineParam = 0
};

const struct SpriteFrameImage gSpriteImageTable_83ED0C0[] = {
    {ewram13200 + 0x0000, 0x800},
    {ewram13200 + 0x0800, 0x800},
    {ewram13200 + 0x1000, 0x800},
    {ewram13200 + 0x1800, 0x800},
    {ewram13200 + 0x2000, 0x800}
};

const struct SpriteFrameImage gSpriteImageTable_83ED0E8[] = {
    {ewram13200 + 0x2800, 0x300}
};

const struct SpriteFrameImage gSpriteImageTable_83ED0F0[] = {
    {ewram13200 + 0x2B00, 0x500}
};

const struct SpriteFrameImage gSpriteImageTable_83ED0F8[] = {
    {ewram13200 + 0x3000, 0x600}
};

const struct SpriteFrameImage gSpriteImageTable_83ED100[] = {
    {gSpriteImage_8E988E8, 0x80},
    {gSpriteImage_8E98968, 0x80},
    {gSpriteImage_8E989E8, 0x80},
    {gSpriteImage_8E98A68, 0x80},
    {gSpriteImage_8E98AE8, 0x80},
    {gSpriteImage_8E98B68, 0x80}
};

const struct SpriteFrameImage gSpriteImageTable_83ED130[] = {
    {gSpriteImage_8E991E8, 0x200}
};

const struct SpriteFrameImage gSpriteImageTable_83ED138[] = {
    {gSpriteImage_8E99808, 0x40}
};

const struct SpriteFrameImage gSpriteImageTable_83ED140[] = {
    {gSpriteImage_8E98BE8, 0x100},
    {gSpriteImage_8E98CE8, 0x100}
};

const struct SpriteFrameImage gSpriteImageTable_83ED150[] = {
    {gSpriteImage_8E993E8, 0x400}
};

const struct SpriteFrameImage gSpriteImageTable_83ED158[] = {
    {gSpriteImage_8E98DE8, 0x200},
    {gSpriteImage_8E98FE8, 0x200}
};

const struct SpriteFrameImage gSpriteImageTable_83ED168[] = {
    {gSpriteImage_8E98848, 0x20}
};

const struct SpriteFrameImage gSpriteImageTable_83ED170[] = {
    {gSpriteImage_8E98868, 0x80}
};

const struct SpriteFrameImage gSpriteImageTable_83ED178[] = {
    {ewram10000 + 0x0000, 0x600}
};

const struct SpriteFrameImage gSpriteImageTable_83ED180[] = {
    {ewram10000 + 0x0600, 0x200}
};

const struct SpriteFrameImage gSpriteImageTable_83ED188[] = {
    {ewram10000 + 0x0800, 0x200}
};

const struct SpriteFrameImage gSpriteImageTable_83ED190[] = {
    {ewram10000 + 0x0A00, 0x200}
};

const struct SpriteFrameImage gSpriteImageTable_83ED198[] = {
    {ewram10000 + 0x0C00, 0x300}
};

const struct SpriteFrameImage gSpriteImageTable_83ED1A0[] = {
    {ewram10000 + 0x1000, 0x400}
};

const struct SpriteFrameImage gSpriteImageTable_83ED1A8[] = {
    {ewram10000 + 0x1400, 0x200}
};

const struct SpriteFrameImage gSpriteImageTable_83ED1B0[] = {
    {ewram10000 + 0x1600, 0x300}
};

const struct SpriteFrameImage gSpriteImageTable_83ED1B8[] = {
    {ewram10000 + 0x1900, 0x300}
};

const struct SpriteFrameImage gSpriteImageTable_83ED1C0[] = {
    {ewram10000 + 0x1C00, 0x200},
    {ewram10000 + 0x1E00, 0x200},
    {ewram10000 + 0x1E00, 0x200} // is this a typo?
};

const struct SpriteFrameImage gSpriteImageTable_83ED1D8[] = {
    {ewram10000 + 0x2000, 0x280}
};

const struct SpriteFrameImage gSpriteImageTable_83ED1E0[] = {
    {ewram10000 + 0x2280, 0x80},
    {ewram10000 + 0x2300, 0x80},
    {ewram10000 + 0x2380, 0x80},
    {ewram10000 + 0x2400, 0x80},
    {ewram10000 + 0x2480, 0x80}
};

const struct SpriteFrameImage gSpriteImageTable_83ED208[] = {
    {ewram10000 + 0x2600, 0x480},
    {ewram10000 + 0x2A80, 0x480}
};

const struct SpriteFrameImage gSpriteImageTable_83ED218[] = {
    {ewram10000 + 0x2F00, 0x180},
    {ewram10000 + 0x3080, 0x180}
};

const struct SpriteFrameImage gSpriteImageTable_83ED228[] = {
    {gSpriteImage_8E98828, 0x20}
};

const union AnimCmd gSpriteAnim_83ED230[] = {
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83ED238[] = {
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_83ED240[] = {
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83ED248[] = {
    ANIMCMD_FRAME(1, 16),
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_83ED254[] = {
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_83ED260[] = {
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_83ED26C[] = {
    ANIMCMD_FRAME(2, 32),
    ANIMCMD_FRAME(3, 32),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_83ED278[] = {
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83ED280[] = {
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83ED288[] = {
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83ED290[] = {
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83ED298[] = {
    ANIMCMD_FRAME(3, 1),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83ED2A0[] = {
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83ED2A8[] = {
    ANIMCMD_FRAME(5, 1),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83ED2B0[] = {
    ANIMCMD_FRAME(0, 4),
    ANIMCMD_FRAME(1, 4),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_83ED2BC[] = {
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_FRAME(1, 16),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_83ED2C8[] = {
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_FRAME(1, 30),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_83ED2D4[] = {
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83ED2DC[] = {
    ANIMCMD_FRAME(0, 30),
    ANIMCMD_FRAME(1, 30),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_83ED2E8[] = {
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_FRAME(1, 16),
    ANIMCMD_FRAME(0, 16),
    ANIMCMD_FRAME(1, 16, .hFlip = TRUE),
    ANIMCMD_JUMP(0)
};

const union AnimCmd gSpriteAnim_83ED2FC[] = {
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83ED304[] = {
    ANIMCMD_FRAME(0, 1),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83ED30C[] = {
    ANIMCMD_FRAME(1, 1),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83ED314[] = {
    ANIMCMD_FRAME(2, 1),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83ED31C[] = {
    ANIMCMD_FRAME(3, 1),
    ANIMCMD_END
};

const union AnimCmd gSpriteAnim_83ED324[] = {
    ANIMCMD_FRAME(4, 1),
    ANIMCMD_END
};

const union AnimCmd *const gSpriteAnimTable_83ED32C[] = {
    gSpriteAnim_83ED230
};

const union AnimCmd *const gSpriteAnimTable_83ED330[] = {
    gSpriteAnim_83ED238
};

const union AnimCmd *const gSpriteAnimTable_83ED334[] = {
    gSpriteAnim_83ED240,
    gSpriteAnim_83ED248,
    gSpriteAnim_83ED254,
    gSpriteAnim_83ED260,
    gSpriteAnim_83ED26C,
    gSpriteAnim_83ED278
};

const union AnimCmd *const gSpriteAnimTable_83ED34C[] = {
    gSpriteAnim_83ED280,
    gSpriteAnim_83ED288,
    gSpriteAnim_83ED290,
    gSpriteAnim_83ED298,
    gSpriteAnim_83ED2A0,
    gSpriteAnim_83ED2A8
};

const union AnimCmd *const gSpriteAnimTable_83ED364[] = {
    gSpriteAnim_83ED2B0
};

const union AnimCmd *const gSpriteAnimTable_83ED368[] = {
    gSpriteAnim_83ED2BC
};

const union AnimCmd *const gSpriteAnimTable_83ED36C[] = {
    gSpriteAnim_83ED2C8,
    gSpriteAnim_83ED2D4
};

const union AnimCmd *const gSpriteAnimTable_83ED374[] = {
    gSpriteAnim_83ED2DC
};

const union AnimCmd *const gSpriteAnimTable_83ED378[] = {
    gSpriteAnim_83ED2E8,
    gSpriteAnim_83ED2FC
};

const union AnimCmd *const gSpriteAnimTable_83ED380[] = {
    gSpriteAnim_83ED304,
    gSpriteAnim_83ED30C,
    gSpriteAnim_83ED314,
    gSpriteAnim_83ED31C,
    gSpriteAnim_83ED324
};

const union AffineAnimCmd gSpriteAffineAnim_83ED394[] = {
    AFFINEANIMCMD_FRAME(0x10, 0x10, 0, 0),
    AFFINEANIMCMD_LOOP(0),
    AFFINEANIMCMD_FRAME(0x1, 0x1, 0, 1),
    AFFINEANIMCMD_LOOP(255),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83ED3BC[] = {
    gSpriteAffineAnim_83ED394
};

const union AffineAnimCmd gSpriteAffineAnim_83ED3C0[] = {
    AFFINEANIMCMD_FRAME(0x0, 0x0, 8, 32),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 6, 32),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 4, 16),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 12, 2),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -12, 4),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 12, 2),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 12, 2),
    AFFINEANIMCMD_FRAME(0x0, 0x0, -12, 4),
    AFFINEANIMCMD_FRAME(0x0, 0x0, 12, 2),
    AFFINEANIMCMD_END
};

const union AffineAnimCmd *const gSpriteAffineAnimTable_83ED410[] = {
    gSpriteAffineAnim_83ED3C0
};

const struct SpriteTemplate gSpriteTemplate_83ED414 = {
    0, 0, &gOamData_83ED0A0, gSpriteAnimTable_83ED32C, NULL, gDummySpriteAffineAnimTable, sub_8104F18
};

const struct SpriteTemplate gSpriteTemplate_83ED42C = {
    7, 4, &gOamData_83ED088, gSpriteAnimTable_83ED32C, NULL, gDummySpriteAffineAnimTable, sub_810506C
};

const struct SpriteTemplate gSpriteTemplate_83ED444 = {
    17, 0, &gOamData_83ED0B8, gSpriteAnimTable_83ED32C, NULL, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED45C = {
    0xFFFF, 1, &gOamData_83ED0B8, gSpriteAnimTable_83ED334, gSpriteImageTable_83ED0C0, gDummySpriteAffineAnimTable, sub_8105170
};

const struct SpriteTemplate gSpriteTemplate_83ED474 = {
    0xFFFF, 2, &gOamData_83ED088, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED0E8, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED48C = {
    0xFFFF, 3, &gOamData_83ED088, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED0F0, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED4A4 = {
    0xFFFF, 3, &gOamData_83ED088, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED0F8, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED4BC = {
    0xFFFF, 4, &gOamData_83ED090, gSpriteAnimTable_83ED34C, gSpriteImageTable_83ED100, gDummySpriteAffineAnimTable, sub_810535C
};

const struct SpriteTemplate gSpriteTemplate_83ED4D4 = {
    0xFFFF, 4, &gOamData_83ED090, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED130, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED4EC = {
    0xFFFF, 4, &gOamData_83ED090, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED138, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED504 = {
    0xFFFF, 4, &gOamData_83ED098, gSpriteAnimTable_83ED364, gSpriteImageTable_83ED140, gDummySpriteAffineAnimTable, sub_810562C
};

const struct SpriteTemplate gSpriteTemplate_83ED51C = {
    0xFFFF, 7, &gOamData_83ED0A8, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED150, gDummySpriteAffineAnimTable, sub_8105784
};

const struct SpriteTemplate gSpriteTemplate_83ED534 = {
    0xFFFF, 5, &gOamData_83ED0A0, gSpriteAnimTable_83ED368, gSpriteImageTable_83ED158, gDummySpriteAffineAnimTable, sub_8105894
};

const struct SpriteTemplate gSpriteTemplate_83ED54C = {
    0xFFFF, 4, &gOamData_83ED080, gSpriteAnimTable_83ED330, gSpriteImageTable_83ED168, gDummySpriteAffineAnimTable, sub_810594C
};

const struct SpriteTemplate gSpriteTemplate_83ED564 = {
    0xFFFF, 4, &gOamData_83ED090, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED170, gSpriteAffineAnimTable_83ED3BC, sub_8105A38
};

const struct SpriteTemplate gSpriteTemplate_83ED57C = {
    0xFFFF, 6, &gOamData_83ED080, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED178, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED594 = {
    0xFFFF, 6, &gOamData_83ED080, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED180, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED5AC = {
    0xFFFF, 6, &gOamData_83ED080, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED188, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED5C4 = {
    18, 6, &gOamData_83ED080, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED190, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED5DC = {
    0xFFFF, 6, &gOamData_83ED0B0, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED198, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED5F4 = {
    0xFFFF, 6, &gOamData_83ED0B0, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED1A0, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED60C = {
    19, 6, &gOamData_83ED080, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED1A8, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED624 = {
    20, 6, &gOamData_83ED080, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED1B0, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED63C = {
    21, 6, &gOamData_83ED080, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED1B8, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED654 = {
    0xFFFF, 6, &gOamData_83ED0A0, gSpriteAnimTable_83ED36C, gSpriteImageTable_83ED1C0, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED66C = {
    0xFFFF, 6, &gOamData_83ED080, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED1D8, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED684 = {
    0xFFFF, 6, &gOamData_83ED090, gSpriteAnimTable_83ED380, gSpriteImageTable_83ED1E0, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED69C = {
    0xFFFF, 6, &gOamData_83ED080, gSpriteAnimTable_83ED378, gSpriteImageTable_83ED208, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED6B4 = {
    0xFFFF, 6, &gOamData_83ED080, gSpriteAnimTable_83ED374, gSpriteImageTable_83ED218, gDummySpriteAffineAnimTable, SpriteCallbackDummy
};

const struct SpriteTemplate gSpriteTemplate_83ED6CC = {
    0xFFFF, 4, &gOamData_83ED080, gSpriteAnimTable_83ED32C, gSpriteImageTable_83ED228, gSpriteAffineAnimTable_83ED410, sub_8105B70
};

const struct Subsprite gSubspriteTable_83ED6E4[] = {
    {-64, -64, ST_OAM_SQUARE, 3, 0x0, 3},
    {0, -64, ST_OAM_SQUARE, 3, 0x0, 3},
    {-64, 0, ST_OAM_SQUARE, 3, 0x0, 3},
    {0, 0, ST_OAM_SQUARE, 3, 0x0, 3}
};

const struct SubspriteTable gSubspriteTables_83ED704[] = {
    {4, gSubspriteTable_83ED6E4}
};

const struct Subsprite gSubspriteTable_83ED70C[] = {
    {-32, -12, ST_OAM_H_RECTANGLE, 1, 0x0, 1},
    {0, -12, ST_OAM_H_RECTANGLE, 1, 0x4, 1},
    {-32, -4, ST_OAM_H_RECTANGLE, 1, 0x8, 1},
    {0, -4, ST_OAM_H_RECTANGLE, 1, 0xc, 1},
    {-32, 4, ST_OAM_H_RECTANGLE, 1, 0x10, 1},
    {0, 4, ST_OAM_H_RECTANGLE, 1, 0x14, 1}
};

const struct SubspriteTable gSubspriteTables_83ED73C[] = {
    {6, gSubspriteTable_83ED70C}
};

const struct Subsprite gSubspriteTable_83ED744[] = {
    {-32, -20, ST_OAM_H_RECTANGLE, 3, 0x0, 1},
    {-32, 12, ST_OAM_H_RECTANGLE, 1, 0x20, 1},
    {0, 12, ST_OAM_H_RECTANGLE, 1, 0x24, 1}
};

const struct SubspriteTable gSubspriteTables_83ED75C[] = {
    {3, gSubspriteTable_83ED744}
};

const struct Subsprite gSubspriteTable_83ED764[] = {
    {-32, -24, ST_OAM_H_RECTANGLE, 3, 0x0, 1},
    {-32, 8, ST_OAM_H_RECTANGLE, 1, 0x20, 1},
    {0, 8, ST_OAM_H_RECTANGLE, 1, 0x24, 1},
    {-32, 16, ST_OAM_H_RECTANGLE, 1, 0x28, 1},
    {0, 16, ST_OAM_H_RECTANGLE, 1, 0x2c, 1}
};

const struct SubspriteTable gSubspriteTables_83ED78C[] = {
    {5, gSubspriteTable_83ED764}
};

const struct Subsprite gSubspriteTable_83ED794[] = {
    {-32, -8, ST_OAM_H_RECTANGLE, 1, 0x0, 1},
    {0, -8, ST_OAM_H_RECTANGLE, 1, 0x4, 1},
    {-32, 0, ST_OAM_H_RECTANGLE, 1, 0x8, 1},
    {0, 0, ST_OAM_H_RECTANGLE, 1, 0xc, 1}
};

const struct SubspriteTable gSubspriteTables_83ED7B4[] = {
    {4, gSubspriteTable_83ED794}
};

const struct Subsprite gSubspriteTable_83ED7BC[] = {
    {-8, -12, ST_OAM_H_RECTANGLE, 0, 0x0, 1},
    {-8, -4, ST_OAM_H_RECTANGLE, 0, 0x0, 1},
    {-8, 4, ST_OAM_H_RECTANGLE, 0, 0x0, 1}
};

const struct SubspriteTable gSubspriteTables_83ED7D4[] = {
    {3, gSubspriteTable_83ED7BC}
};

const struct Subsprite gSubspriteTable_83ED7DC[] = {
    {-32, -24, ST_OAM_H_RECTANGLE, 3, 0x0, 3},
    {-32, 8, ST_OAM_H_RECTANGLE, 1, 0x20, 3},
    {0, 8, ST_OAM_H_RECTANGLE, 1, 0x24, 3},
    {-32, 16, ST_OAM_H_RECTANGLE, 1, 0x28, 3},
    {0, 16, ST_OAM_H_RECTANGLE, 1, 0x2c, 3}
};

const struct SubspriteTable gSubspriteTables_83ED804[] = {
    {5, gSubspriteTable_83ED7DC}
};

const struct Subsprite gSubspriteTable_83ED80C[] = {
    {-32, -8, ST_OAM_H_RECTANGLE, 1, 0x0, 3},
    {0, -8, ST_OAM_H_RECTANGLE, 1, 0x4, 3},
    {-32, 0, ST_OAM_H_RECTANGLE, 1, 0x8, 3},
    {0, 0, ST_OAM_H_RECTANGLE, 1, 0xc, 3}
};

const struct SubspriteTable gSubspriteTables_83ED82C[] = {
    {4, gSubspriteTable_83ED80C}
};

const struct Subsprite gSubspriteTable_83ED834[] = {
    {-32, -8, ST_OAM_H_RECTANGLE, 1, 0x0, 3},
    {0, -8, ST_OAM_H_RECTANGLE, 1, 0x4, 3},
    {-32, 0, ST_OAM_H_RECTANGLE, 1, 0x8, 3},
    {0, 0, ST_OAM_H_RECTANGLE, 1, 0xc, 3}
};

const struct SubspriteTable gSubspriteTables_83ED854[] = {
    {4, gSubspriteTable_83ED834}
};

const struct Subsprite gSubspriteTable_83ED85C[] = {
    {-32, -8, ST_OAM_H_RECTANGLE, 1, 0x0, 3},
    {0, -8, ST_OAM_H_RECTANGLE, 1, 0x4, 3},
    {-32, 0, ST_OAM_H_RECTANGLE, 1, 0x8, 3},
    {0, 0, ST_OAM_H_RECTANGLE, 1, 0xc, 3}
};

const struct SubspriteTable gSubspriteTables_83ED87C[] = {
    {4, gSubspriteTable_83ED85C}
};

const struct Subsprite gSubspriteTable_83ED884[] = {
    {-32, -12, ST_OAM_H_RECTANGLE, 1, 0x0, 3},
    {0, -12, ST_OAM_H_RECTANGLE, 1, 0x4, 3},
    {-32, -4, ST_OAM_H_RECTANGLE, 1, 0x8, 3},
    {0, -4, ST_OAM_H_RECTANGLE, 1, 0xc, 3},
    {-32, 4, ST_OAM_H_RECTANGLE, 1, 0x10, 3},
    {0, 4, ST_OAM_H_RECTANGLE, 1, 0x14, 3}
};

const struct SubspriteTable gSubspriteTables_83ED8B4[] = {
    {6, gSubspriteTable_83ED884}
};

const struct Subsprite gSubspriteTable_83ED8BC[] = {
    {-16, -16, ST_OAM_SQUARE, 2, 0x0, 3}
};

const struct Subsprite gSubspriteTable_83ED8C4[] = {
    {-8, -8, ST_OAM_SQUARE, 1, 0x10, 3}
};

const struct SubspriteTable gSubspriteTables_83ED8CC[] = {
    {1, gSubspriteTable_83ED8BC},
    {1, gSubspriteTable_83ED8C4}
};

const struct Subsprite gSubspriteTable_83ED8DC[] = {
    {-24, -24, ST_OAM_H_RECTANGLE, 1, 0x0, 3},
    {8, -24, ST_OAM_H_RECTANGLE, 0, 0x4, 3},
    {-24, -16, ST_OAM_H_RECTANGLE, 1, 0x6, 3},
    {8, -16, ST_OAM_H_RECTANGLE, 0, 0xa, 3},
    {-24, -8, ST_OAM_H_RECTANGLE, 1, 0xc, 3},
    {8, -8, ST_OAM_H_RECTANGLE, 0, 0x10, 3},
    {-24, 0, ST_OAM_H_RECTANGLE, 1, 0x12, 3},
    {8, 0, ST_OAM_H_RECTANGLE, 0, 0x16, 3},
    {-24, 8, ST_OAM_H_RECTANGLE, 1, 0x18, 3},
    {8, 8, ST_OAM_H_RECTANGLE, 0, 0x1c, 3},
    {-24, 16, ST_OAM_H_RECTANGLE, 1, 0x1e, 3},
    {8, 16, ST_OAM_H_RECTANGLE, 0, 0x22, 3}
};

const struct SubspriteTable gSubspriteTables_83ED93C[] = {
    12, gSubspriteTable_83ED8DC
};

const struct Subsprite gSubspriteTable_83ED944[] = {
    {-16, -12, ST_OAM_H_RECTANGLE, 2, 0x0, 3},
    {-16, 4, ST_OAM_H_RECTANGLE, 0, 0x8, 3},
    {0, 4, ST_OAM_H_RECTANGLE, 0, 0xa, 3}
};

const struct SubspriteTable gSubspriteTables_83ED95C[] = {
    {3, gSubspriteTable_83ED944}
};

const struct Subsprite gSubspriteTable_83ED964[] = {
    {-8, -8, ST_OAM_H_RECTANGLE, 0, 0x0, 3},
    {-8, 0, ST_OAM_H_RECTANGLE, 0, 0x8, 3}
};

const struct SubspriteTable gSubspriteTables_83ED974[] = {
    {2, gSubspriteTable_83ED964}
};

const struct Subsprite gSubspriteTable_83ED97C[] = {
    {-8, -8, ST_OAM_H_RECTANGLE, 0, 0x2, 3},
    {-8, 0, ST_OAM_H_RECTANGLE, 0, 0xa, 3}
};

const struct SubspriteTable gSubspriteTables_83ED98C[] = {
    {2, gSubspriteTable_83ED97C}
};

const struct Subsprite gSubspriteTable_83ED994[] = {
    {-8, -8, ST_OAM_H_RECTANGLE, 0, 0x4, 3},
    {-8, 0, ST_OAM_H_RECTANGLE, 0, 0xc, 3}
};

const struct SubspriteTable gSubspriteTables_83ED9A4[] = {
    {2, gSubspriteTable_83ED994}
};

const struct Subsprite gSubspriteTable_83ED9AC[] = {
    {-8, -8, ST_OAM_H_RECTANGLE, 0, 0x6, 3},
    {-8, 0, ST_OAM_H_RECTANGLE, 0, 0xe, 3}
};

const struct SubspriteTable gSubspriteTables_83ED9BC[] = {
    {2, gSubspriteTable_83ED9AC}
};

const struct Subsprite gSubspriteTable_83ED9C4[] = {
    {-8, -8, ST_OAM_H_RECTANGLE, 0, 0x0, 3},
    {-8, 0, ST_OAM_H_RECTANGLE, 0, 0x8, 3}
};

const struct SubspriteTable gSubspriteTables_83ED9D4[] = {
    {2, gSubspriteTable_83ED9C4}
};

const struct Subsprite gSubspriteTable_83ED9DC[] = {
    {-4, -8, ST_OAM_SQUARE, 0, 0x2, 3},
    {-4, 0, ST_OAM_SQUARE, 0, 0xa, 3}
};

const struct SubspriteTable gSubspriteTables_83ED9EC[] = {
    {2, gSubspriteTable_83ED9DC}
};

const struct Subsprite gSubspriteTable_83ED9F4[] = {
    {-8, -8, ST_OAM_H_RECTANGLE, 0, 0x3, 3},
    {-8, 0, ST_OAM_H_RECTANGLE, 0, 0xb, 3}
};

const struct SubspriteTable gSubspriteTables_83EDA04[] = {
    {2, gSubspriteTable_83ED9F4}
};

const struct Subsprite gSubspriteTable_83EDA0C[] = {
    {-4, -8, ST_OAM_SQUARE, 0, 0x5, 3},
    {-4, 0, ST_OAM_SQUARE, 0, 0xd, 3}
};

const struct SubspriteTable gSubspriteTables_83EDA1C[] = {
    {2, gSubspriteTable_83EDA0C}
};

const struct Subsprite gSubspriteTable_83EDA24[] = {
    {-8, -8, ST_OAM_H_RECTANGLE, 0, 0x6, 3},
    {-8, 0, ST_OAM_H_RECTANGLE, 0, 0xe, 3}
};

const struct SubspriteTable gSubspriteTables_83EDA34[] = {
    {2, gSubspriteTable_83EDA24}
};

const struct Subsprite gSubspriteTable_83EDA3C[] = {
    {-12, -12, ST_OAM_H_RECTANGLE, 0, 0x0, 3},
    {4, -12, ST_OAM_SQUARE, 0, 0x2, 3},
    {-12, -4, ST_OAM_H_RECTANGLE, 0, 0x8, 3},
    {4, -4, ST_OAM_SQUARE, 0, 0xa, 3},
    {-12, 4, ST_OAM_H_RECTANGLE, 0, 0x10, 3},
    {4, 4, ST_OAM_SQUARE, 0, 0x12, 3}
};

const struct SubspriteTable gSubspriteTables_83EDA6C[] = {
    {6, gSubspriteTable_83EDA3C}
};

const struct Subsprite gSubspriteTable_83EDA74[] = {
    {-8, -12, ST_OAM_H_RECTANGLE, 0, 0x3, 3},
    {-8, -4, ST_OAM_H_RECTANGLE, 0, 0xb, 3},
    {-8, 4, ST_OAM_H_RECTANGLE, 0, 0x13, 3}
};

const struct SubspriteTable gSubspriteTables_83EDA8C[] = {
    {3, gSubspriteTable_83EDA74}
};

const struct Subsprite gSubspriteTable_83EDA94[] = {
    {-12, -12, ST_OAM_H_RECTANGLE, 0, 0x5, 3},
    {4, -12, ST_OAM_SQUARE, 0, 0x7, 3},
    {-12, -4, ST_OAM_H_RECTANGLE, 0, 0xd, 3},
    {4, -4, ST_OAM_SQUARE, 0, 0xf, 3},
    {-12, 4, ST_OAM_H_RECTANGLE, 0, 0x15, 3},
    {4, 4, ST_OAM_SQUARE, 0, 0x17, 3}
};

const struct SubspriteTable gSubspriteTables_83EDAC4[] = {
    {6, gSubspriteTable_83EDA94}
};

const struct Subsprite gSubspriteTable_83EDACC[] = {
    {-12, -12, ST_OAM_H_RECTANGLE, 0, 0x0, 3},
    {4, -12, ST_OAM_SQUARE, 0, 0x2, 3},
    {-12, -4, ST_OAM_H_RECTANGLE, 0, 0x8, 3},
    {4, -4, ST_OAM_SQUARE, 0, 0xa, 3},
    {-12, 4, ST_OAM_H_RECTANGLE, 0, 0x10, 3},
    {4, 4, ST_OAM_SQUARE, 0, 0x12, 3}
};

const struct SubspriteTable gSubspriteTables_83EDAFC[] = {
    {6, gSubspriteTable_83EDACC}
};

const struct Subsprite gSubspriteTable_83EDB04[] = {
    {-8, -12, ST_OAM_H_RECTANGLE, 0, 0x3, 3},
    {-8, -4, ST_OAM_H_RECTANGLE, 0, 0xb, 3},
    {-8, 4, ST_OAM_H_RECTANGLE, 0, 0x13, 3}
};

const struct SubspriteTable gSubspriteTables_83EDB1C[] = {
    {3, gSubspriteTable_83EDB04}
};

const struct Subsprite gSubspriteTable_83EDB24[] = {
    {-12, -12, ST_OAM_H_RECTANGLE, 0, 0x5, 3},
    {4, -12, ST_OAM_SQUARE, 0, 0x7, 3},
    {-12, -4, ST_OAM_H_RECTANGLE, 0, 0xd, 3},
    {4, -4, ST_OAM_SQUARE, 0, 0xf, 3},
    {-12, 4, ST_OAM_H_RECTANGLE, 0, 0x15, 3},
    {4, 4, ST_OAM_SQUARE, 0, 0x17, 3}
};

const struct SubspriteTable gSubspriteTables_83EDB54[] = {
    {6, gSubspriteTable_83EDB24}
};

const struct SpriteTemplate *const gUnknown_083EDB5C[] = {
    &gSpriteTemplate_83ED57C,
    &gSpriteTemplate_83ED594,
    &gSpriteTemplate_83ED5AC,
    &gSpriteTemplate_83ED5DC,
    &gSpriteTemplate_83ED5F4,
    &gSpriteTemplate_83ED654,
    &gSpriteTemplate_83ED66C,
    &gSpriteTemplate_83ED684,
    &gSpriteTemplate_83ED69C,
    &gSpriteTemplate_83ED6B4,
    &gSpriteTemplate_83ED5C4,
    &gSpriteTemplate_83ED5C4,
    &gSpriteTemplate_83ED5C4,
    &gSpriteTemplate_83ED5C4,
    &gSpriteTemplate_83ED60C,
    &gSpriteTemplate_83ED60C,
    &gSpriteTemplate_83ED60C,
    &gSpriteTemplate_83ED60C,
    &gSpriteTemplate_83ED60C,
    &gSpriteTemplate_83ED624,
    &gSpriteTemplate_83ED624,
    &gSpriteTemplate_83ED624,
    &gSpriteTemplate_83ED63C,
    &gSpriteTemplate_83ED63C,
    &gSpriteTemplate_83ED63C,
    &gDummySpriteTemplate
};

const struct SubspriteTable *const gUnknown_083EDBC4[] = {
    gSubspriteTables_83ED804,
    gSubspriteTables_83ED82C,
    gSubspriteTables_83ED854,
    gSubspriteTables_83ED8B4,
    NULL,
    NULL,
    gSubspriteTables_83ED8CC,
    NULL,
    gSubspriteTables_83ED93C,
    gSubspriteTables_83ED95C,
    gSubspriteTables_83ED974,
    gSubspriteTables_83ED98C,
    gSubspriteTables_83ED9A4,
    gSubspriteTables_83ED9BC,
    gSubspriteTables_83ED9D4,
    gSubspriteTables_83ED9EC,
    gSubspriteTables_83EDA04,
    gSubspriteTables_83EDA1C,
    gSubspriteTables_83EDA34,
    gSubspriteTables_83EDA6C,
    gSubspriteTables_83EDA8C,
    gSubspriteTables_83EDAC4,
    gSubspriteTables_83EDAFC,
    gSubspriteTables_83EDB1C,
    gSubspriteTables_83EDB54,
    NULL
};

const struct SpriteSheet gUnknown_083EDC2C[] = {
    {gSlotMachineReelSymbol1Tiles, 0x200, 0},
    {gSlotMachineReelSymbol2Tiles, 0x200, 1},
    {gSlotMachineReelSymbol3Tiles, 0x200, 2},
    {gSlotMachineReelSymbol4Tiles, 0x200, 3},
    {gSlotMachineReelSymbol5Tiles, 0x200, 4},
    {gSlotMachineReelSymbol6Tiles, 0x200, 5},
    {gSlotMachineReelSymbol7Tiles, 0x200, 6},
    {gSlotMachineNumber0Tiles, 0x40, 7},
    {gSlotMachineNumber1Tiles, 0x40, 8},
    {gSlotMachineNumber2Tiles, 0x40, 9},
    {gSlotMachineNumber3Tiles, 0x40, 10},
    {gSlotMachineNumber4Tiles, 0x40, 11},
    {gSlotMachineNumber5Tiles, 0x40, 12},
    {gSlotMachineNumber6Tiles, 0x40, 13},
    {gSlotMachineNumber7Tiles, 0x40, 14},
    {gSlotMachineNumber8Tiles, 0x40, 15},
    {gSlotMachineNumber9Tiles, 0x40, 16},
    {ewram10000 + 0x0A00, 0x200, 18},
    {ewram10000 + 0x1400, 0x200, 19},
    {ewram10000 + 0x1600, 0x300, 20},
    {ewram10000 + 0x1900, 0x300, 21},
    {}
};

const struct SpriteSheet gUnknown_083EDCDC = {
    ewram10000 + 0x0000, 0x800, 17
};

const u8 *const gUnknown_083EDCE4 = gUnknownPalette_08E997E8;

#ifdef SAPPHIRE
const u16 UnknownPalette_83EDCE8[] = INCBIN_U16("graphics/unknown/sapphire_83EDD40.gbapal");
#elif defined(RUBY)
const u16 UnknownPalette_83EDCE8[] = INCBIN_U16("graphics/unknown/ruby_83EDCE8.gbapal");
#endif // RS

const u16 *const gUnknown_083EDD08[] = {
    UnknownPalette_83EDCE8 + 10,
    UnknownPalette_83EDCE8 + 11,
    UnknownPalette_83EDCE8 + 12,
    UnknownPalette_83EDCE8 + 13,
    UnknownPalette_83EDCE8 + 14
};

const u16 *const gUnknown_083EDD1C[] = {
    gUnknown_08E95A18 + 74,
    gUnknown_08E95A18 + 75,
    gUnknown_08E95A18 + 76,
    gUnknown_08E95A18 + 77,
    gUnknown_08E95A18 + 78
};

const u8 gUnknown_083EDD30[] = {
    0x4a, 0x4b, 0x4c, 0x4e, 0x4d
};

const u8 gUnknown_083EDD35[][2] = {
    {0, 0},
    {1, 2},
    {3, 4}
};
const u8 gUnknown_083EDD3B[] = {1, 2, 2};

#ifdef SAPPHIRE
const u16 Unknown_83EDD3E[] = INCBIN_U16("graphics/unknown/sapphire_83EDD96.gbapal");
const u16 Unknown_83EDD5E[] = INCBIN_U16("graphics/unknown/sapphire_83EDDB6.gbapal");
const u16 Unknown_83EDD7E[] = INCBIN_U16("graphics/unknown/sapphire_83EDDD6.gbapal");
#elif defined (RUBY)
const u16 Unknown_83EDD3E[] = INCBIN_U16("graphics/unknown/ruby_83EDD3E.gbapal");
const u16 Unknown_83EDD5E[] = INCBIN_U16("graphics/unknown/ruby_83EDD5E.gbapal");
const u16 Unknown_83EDD7E[] = INCBIN_U16("graphics/unknown/ruby_83EDD7E.gbapal");
#endif // RS

const u16 *const gUnknown_083EDDA0[] = {
    Unknown_83EDD3E,
    Unknown_83EDD5E,
    Unknown_83EDD7E
};

const u16 *const gUnknown_083EDDAC = gUnknown_08E95A18 + 16;

const u16 Palette_83EDDB0[] = INCBIN_U16("graphics/slot_machine/83EDDB0.gbapal");
const u16 Palette_83EDDD0[] = INCBIN_U16("graphics/slot_machine/83EDDD0.gbapal");
const u16 Palette_83EDDF0[] = INCBIN_U16("graphics/slot_machine/83EDDF0.gbapal");

const u16 *const gUnknown_083EDE10[] = {
    Palette_83EDDB0,
    Palette_83EDDD0,
    Palette_83EDDF0,
    gSlotMachineSpritePalette6
};

const u16 *const gUnknown_083EDE20 = gSlotMachineSpritePalette6;

const u16 gPalette_83EDE24[] = INCBIN_U16("graphics/slot_machine/83EDE24_pal.bin");

const struct SpritePalette gSlotMachineSpritePalettes[] = {
    {gSlotMachineSpritePalette0, 0},
    {gSlotMachineSpritePalette1, 1},
    {gSlotMachineSpritePalette2, 2},
    {gSlotMachineSpritePalette3, 3},
    {gSlotMachineSpritePalette4, 4},
    {gSlotMachineSpritePalette5, 5},
    {gSlotMachineSpritePalette6, 6},
    {gSlotMachineSpritePalette4, 7},
    {}
};

const u8 gUnknown_083EDE8C[] = INCBIN_U8("graphics/slot_machine/reel_time.4bpp.lz");

const u16 gReelTimeWindowTilemap[] = INCBIN_U16("graphics/slot_machine/reel_time_window_map.bin");
