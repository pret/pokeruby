#include "global.h"
#include "constants/songs.h"
#include "strings2.h"
#include "overworld.h"
#include "menu_cursor.h"
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
void sub_81027D0(void);
void sub_8102840(void);
void sub_810290C(void);
u8 sub_81029D4(u8 a0, u8 a1, u8 a2);
void sub_8102A24(void);
bool8 sub_8102A44(void);
u8 sub_8102BA4(u8 a0, u8 a1);
void sub_8102DA8(void);
void sub_8102DEC(u8 a0);
void sub_8102E1C(u8 a0);
bool8 sub_8102E40(u8 a0);
void sub_8103C14(u8 a0);
void sub_8103D50(u8 a0);
void sub_8103D8C(u8 a0);
void sub_8103DC8(void);
void sub_8103E04(u8 a0);
void sub_8103F70(void);
bool8 sub_8103FA0(void);
void sub_8104048(void);
void sub_8104064(u8 a0);
bool8 sub_81040C8(void);
void sub_810423C(u8 a0);
void sub_810430C(void);
bool8 sub_810432C(void);
void sub_8104AB8(u8 a0);
bool8 sub_8104AEC(void);
void sub_8104C5C(void);
void sub_8104CAC(u8 arg0);
bool8 sub_8104E18(void);
void sub_8104EA8(void);
void sub_8104F8C(void);
void sub_81050C4(void);
void sub_81063C0(void);
static void sub_8106448(void);
void sub_81064B8(void);

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

extern const u8 gUnknown_083ECD04[][3];
extern const u8 gUnknown_083ECE3A[];
extern const u16 gUnknown_083ECE42[];
extern const u16 gUnknown_083ECE48[];

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

extern const s16 gUnknown_083ECCF8[3][2];

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

extern const u8 gUnknown_083ECD16[][6];

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

extern const u8 gUnknown_083ECD28[][6];

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

extern const u8 gUnknown_083ECDAC[][17];
extern const u8 gUnknown_083ECD46[][17];

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

extern const u16 gUnknown_083ECE12[];

bool8 sub_81026DC(u16 a0)
{
    u16 rval = Random() & 0xff;
    if (rval < gUnknown_083ECE12[a0])
    {
        return TRUE;
    }
    return FALSE;
}

extern const u16 gUnknown_083ECE1C[][2];
extern const u16 gUnknown_083ECE30[];

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

extern const u16 gUnknown_083ECE6C[];
extern const u16 gUnknown_083ECE5A[];

void sub_81027D0(void)
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

void sub_8102840(void)
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

void sub_810290C(void)
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

asm(".section .text_a");

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
asm(".section .text_b");

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
