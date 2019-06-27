#include "global.h"
#include "random.h"
#include "graphics.h"
#include "ewram.h"
#include "field_fadetransition.h"
#include "constants/game_stat.h"
#include "m4a.h"
#include "main.h"
#include "menu.h"
#include "menu_cursor.h"
#include "menu_helpers.h"
#include "overworld.h"
#include "palette.h"
#include "pokemon.h"
#include "roulette.h"
#include "roulette_util.h"
#include "rtc.h"
#include "constants/songs.h"
#include "sound.h"
#include "script.h"
#include "constants/species.h"
#include "sprite.h"
#include "strings2.h"
#include "string_util.h"
#include "task.h"
#include "text.h"
#include "trig.h"
#include "scanline_effect.h"

asm(".include \"constants/gba_constants.inc\"");

#if DEBUG
void *gUnknown_Debug_03005FB8;
#endif

#define static

void sub_81150FC(void);
void sub_8115124(void);
void sub_8115238(void);
void sub_8115384(void);
void sub_8115634(u8);
void sub_81156BC(u8);
void sub_8115734(u8);
void sub_811577C(u8);
void sub_81157AC(u8);
void sub_81157D0(u8);
void sub_8115928(u8, u8);
void sub_811597C(u8);
void sub_81159BC(u8);
u8 sub_8115A94(s16 *, u8);
void sub_8115B58(u8);
void sub_8115DA0(u8);
void sub_8115E14(u8);
void sub_8115ECC(u8);
u8 sub_8115F58(u16, u16);
void sub_8116100(u8);
void sub_8116308(u8);
void sub_811637C(u8);
void sub_8116474(u8);
void sub_8116514(u8);
void sub_811659C(u8);
void sub_8116638(u8);
void sub_81166E8(u8);
void sub_811677C(u8);
void sub_81167F4(u8);
void sub_8116880(u8);
void dp01t_12_3_battle_menu(u8);
void sub_8116AB0(u8);
void sub_8116B40(u8);
void sub_8116BC0(u8);
void sub_8116C34(u8, TaskFunc, u16, u16);
void sub_8116CAC(u8);
void sub_8116CF8(void);
u8 sub_8116D54(u8, u8);
u8 sub_8116E5C(u8, u8);
void sub_8116EF8(u8);
void sub_8117158(u8);
u8 sub_8117380(u8);
void sub_8117434(void);
void sub_81174F8(u8);
void sub_8117528(u8);
void sub_811755C(u8);
void sub_81175C0(u8);
void sub_81175DC(u8);
void sub_8117630(u8);
void Task_Roulette_0(u8);

const u16 gUnknown_083F86BC[] = INCBIN_U16("graphics/roulette/83F86BC.gbapal");
const u8 gUnknown_083F88BC[] = INCBIN_U8("graphics/roulette/83F88BC.bin.lz");
const u8 gUnknown_083F8A60[] = INCBIN_U8("graphics/roulette/wheel_map.bin.lz");

const struct StructgUnknown_083F8C00 gUnknown_083F8C00[] = {
	{0xFF, 0x0, 0x0, 0x00, 0x07, 0x07, 0x00, 0x00, 0x00, 0x00000000, 0x00000000, 0x0000, 0x0000},
	{0x0C, 0x4, 0x1, 0x00, 0x11, 0x07, 0x00, 0x00, 0x00, 0x00000002, 0x00010842, 0xE000, 0x0000},
	{0x0D, 0x4, 0x2, 0x00, 0x14, 0x07, 0x00, 0x00, 0x00, 0x00000004, 0x00021084, 0xE000, 0x0000},
	{0x0E, 0x4, 0x3, 0x00, 0x17, 0x07, 0x00, 0x00, 0x00, 0x00000008, 0x00042108, 0xE000, 0x0000},
	{0x0F, 0x4, 0x4, 0x00, 0x1A, 0x07, 0x00, 0x00, 0x00, 0x00000010, 0x00084210, 0xE000, 0x0000},
	{0x10, 0x3, 0x0, 0x01, 0x0E, 0x0A, 0x00, 0x0C, 0x00, 0x00000020, 0x000003E0, 0x0249, 0x0000},
	{0x00, 0xC, 0x1, 0x01, 0x11, 0x0A, 0x03, 0x03, 0x00, 0x00000040, 0x00000040, 0x2001, 0x0000},
	{0x09, 0xC, 0x2, 0x01, 0x14, 0x0A, 0x03, 0x03, 0x00, 0x00000080, 0x00000080, 0x2200, 0x0000},
	{0x06, 0xC, 0x3, 0x01, 0x17, 0x0A, 0x03, 0x03, 0x00, 0x00000100, 0x00000100, 0x2040, 0x0000},
	{0x03, 0xC, 0x4, 0x01, 0x1A, 0x0A, 0x03, 0x03, 0x00, 0x00000200, 0x00000200, 0x2008, 0x0000},
	{0x11, 0x3, 0x0, 0x02, 0x0E, 0x0D, 0x03, 0x0F, 0x00, 0x00000400, 0x00007C00, 0x0492, 0x0000},
	{0x04, 0xC, 0x1, 0x02, 0x11, 0x0D, 0x06, 0x06, 0x00, 0x00000800, 0x00000800, 0x2010, 0x0000},
	{0x01, 0xC, 0x2, 0x02, 0x14, 0x0D, 0x06, 0x06, 0x00, 0x00001000, 0x00001000, 0x2002, 0x0000},
	{0x0A, 0xC, 0x3, 0x02, 0x17, 0x0D, 0x06, 0x06, 0x00, 0x00002000, 0x00002000, 0x2400, 0x0000},
	{0x07, 0xC, 0x4, 0x02, 0x1A, 0x0D, 0x06, 0x06, 0x00, 0x00004000, 0x00004000, 0x2080, 0x0000},
	{0x12, 0x3, 0x0, 0x03, 0x0E, 0x10, 0x06, 0x12, 0x00, 0x00008000, 0x000F8000, 0x0924, 0x0000},
	{0x08, 0xC, 0x1, 0x03, 0x11, 0x10, 0x09, 0x09, 0x00, 0x00010000, 0x00010000, 0x2100, 0x0000},
	{0x05, 0xC, 0x2, 0x03, 0x14, 0x10, 0x09, 0x09, 0x00, 0x00020000, 0x00020000, 0x2020, 0x0000},
	{0x02, 0xC, 0x3, 0x03, 0x17, 0x10, 0x09, 0x09, 0x00, 0x00040000, 0x00040000, 0x2004, 0x0000},
	{0x0B, 0xC, 0x4, 0x03, 0x1A, 0x10, 0x09, 0x09, 0x00, 0x00080000, 0x00080000, 0x2800, 0x0000},
};

const struct StructgUnknown_083F8D90 gUnknown_083F8D90[] = {
    { 0,  1,  6, 0x00000040},
    { 1,  3, 12, 0x00001000},
    { 2,  5, 18, 0x00040000},
    { 3,  7,  9, 0x00000200},
    { 4,  9, 11, 0x00000800},
    { 5, 11, 17, 0x00020000},
    { 6, 13,  8, 0x00000100},
    { 7, 15, 14, 0x00004000},
    { 8, 17, 16, 0x00010000},
    { 9, 19,  7, 0x00000080},
    {10, 21, 13, 0x00002000},
    {11, 23, 19, 0x00080000}
};

const u8 gUnknown_083F8DF0[] = {
    1, 3,
    1, 6,
};

const struct StructgUnknown_083F8DF4 gUnknown_083F8DF4[] = {
    {
        .var00 = 1,
        .var01 = 60,
        .var02 = 30,
        .var03 = 1,
        .var04 = 1,
        .var08 = 45,
        .var0A = 30,
        .var0C = 1,
        .var10 = 75,
        .var12 = 27,
        .var14 = 24,
        .var18 = 10,
        .var1A = 360,
        .var1C = -0.5f
    }, {
        .var00 = 3,
        .var01 = 30,
        .var02 = 15,
        .var03 = 1,
        .var04 = 0,
        .var08 = 75,
        .var0A = 60,
        .var0C = 2,
        .var10 = 0,
        .var12 = 54,
        .var14 = 48,
        .var18 = 10,
        .var1A = 270,
        .var1C = -1.0f
    }
};

const struct UnkStruct1 gUnknown_083F8E34[] = {
	{
        .var00 = 0x8000,
        .var02 = 0x0005,
        .var04 = 0x01,
        .var05 = 0x01,
        .var06 = 0xFF,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 0x000A,
        .var04 = 0x01,
        .var05 = 0x01,
        .var06 = 0xFF,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 0x0015,
        .var04 = 0x01,
        .var05 = 0x01,
        .var06 = 0xFF,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 0x0055,
        .var04 = 0x01,
        .var05 = 0x01,
        .var06 = 0xFF,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 0x005A,
        .var04 = 0x01,
        .var05 = 0x01,
        .var06 = 0xFF,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 0x0065,
        .var04 = 0x01,
        .var05 = 0x01,
        .var06 = 0xFF,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 0x0075,
        .var04 = 0x01,
        .var05 = 0x01,
        .var06 = 0xFF,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 0x007A,
        .var04 = 0x01,
        .var05 = 0x01,
        .var06 = 0xFF,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 0x0085,
        .var04 = 0x01,
        .var05 = 0x01,
        .var06 = 0xFF,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 0x0095,
        .var04 = 0x01,
        .var05 = 0x01,
        .var06 = 0xFF,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 0x009A,
        .var04 = 0x01,
        .var05 = 0x01,
        .var06 = 0xFF,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 0x00A5,
        .var04 = 0x01,
        .var05 = 0x01,
        .var06 = 0xFF,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x77D6,
        .var02 = 0x0028,
        .var04 = 0x02,
        .var05 = 0x0A,
        .var06 = 0xFF,
        .var07_0 = 14,
        .var07_5 = 2,
        .var07_7 = FALSE
    }
};

const struct UnkStruct1 gUnknown_083F8E9C[] = {
    {
        .var00 = 0x53ff,
        .var02 = 0x0101,
        .var04 = 0x05,
        .var05 = 0x1e,
        .var06 = 0xff,
        .var07_0 = 14,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x7ffb,
        .var02 = 0x0106,
        .var04 = 0x05,
        .var05 = 0x1e,
        .var06 = 0xff,
        .var07_0 = 14,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x7f7f,
        .var02 = 0x010b,
        .var04 = 0x05,
        .var05 = 0x1e,
        .var06 = 0xff,
        .var07_0 = 14,
        .var07_5 = 2,
        .var07_7 = FALSE
    }
};

const struct YesNoFuncTable gUnknown_083F8EB4 = {
    sub_811755C,
    sub_81175C0
};

const struct YesNoFuncTable gUnknown_083F8EBC = {
    sub_811577C,
    sub_81157AC
};

extern u8 gUnknown_02019000[];
extern u16 gSpecialVar_0x8004;
extern u16 gPlttBufferFaded[];
extern u16 gPlttBufferUnfaded[];
extern const u8 gUnknown_081C4157[];
extern const u8 gUnknown_081C41E3;
extern const u16 gUnknown_083F8ECE;
const extern u8 gUnknown_083F8ECA[];
const extern u8 gUnknown_081C41A5;
const extern u8 gUnknown_081C4199;
const extern u8 gUnknown_081C41AE;
const extern u8 gUnknown_081C41BD;
const extern u8 gUnknown_081C41F1;
const extern u8 gUnknown_081C4231;
const extern u8 gUnknown_081C41D2;
extern const u32 gUnknown_083F8ED8[];
extern const u32 gUnknown_083F8EE8[];
extern const u8 gUnknown_083F8EF4[];
extern const u8 gUnknown_081C40DF;
extern const u8 gUnknown_081C4139;
extern const u8 gUnknown_081C411C;
#if DEBUG
EWRAM_DATA u8 unk_203955C[4] = { 0 };
EWRAM_DATA u8 unk_2039560 = 0;
#endif


void sub_81150FC(void)
{
	RunTasks();
	AnimateSprites();
	BuildOamBuffer();
	if (eRoulette->varB8.var00)
	   task_tutorial_controls_fadein(&eRoulette->varB8);
}

void sub_8115124(void)
{
    LoadOam();
    ProcessSpriteCopyRequests();
    TransferPlttBuffer();
    sub_8117434();
    REG_BG1HOFS = 0x200 - eRoulette->var26;
    if (eRoulette->var01)
        REG_BLDALPHA = eRoulette->var34;
    if (eRoulette->var2A != 0)
    {
        DmaCopy16(3, &gBGTilemapBuffers[1][0xE0], (void *)(VRAM + 0x21C0), 0x340);
        eRoulette->var2A = 0x0;
    }
    switch (eRoulette->var28)
    {
    case 0x1:
        REG_BG0CNT = (0x20 * 0xF8);
        DmaCopy16(3, &gBGTilemapBuffers[2][0xE0], (void *)(VRAM + 0xF9C0), 0x340);
        eRoulette->var28 = 0x2;
    break;
    case 0x2:
        DmaCopy16(3, &gBGTilemapBuffers[2][0xE0], (void *)(VRAM + 0xF9C0), 0x340);
    break;
    case 0xFF:
        REG_BG0CNT = 0x1F08;
        DmaFill16(3, 0x0, (void *)(VRAM + 0xF9C0), 0x340);
        eRoulette->var28 = 0x0;
    case 0x0:
        break;
    }
}

void sub_8115238(void)
{
    u8 i;
    u32 temp;
    const struct StructgUnknown_083F8DF4 *s0;
    u16 arr[] = {RGB(24, 4, 10), RGB(10, 19, 6), RGB(24, 4, 10)};
    memset(eRoulette, 0x0, 0x17C);
    eRoulette->var04_0 = (gSpecialVar_0x8004 & 0x1);
    if (gSpecialVar_0x8004 & 0x80)
        eRoulette->var04_7 = 0x1;
    s0 = &gUnknown_083F8DF4[0];
    eRoulette->var22   = s0[eRoulette->var04_0].var03;
    eRoulette->var23   = s0[eRoulette->var04_0].var04;
    eRoulette->var19 = temp = gUnknown_083F8DF0[eRoulette->var04_0 + eRoulette->var04_7 * 2];
    eRoulette->var1A_4 = 0x1;
    if (temp == 0x1)
        gPlttBufferUnfaded[0] = gPlttBufferUnfaded[0x51] = gPlttBufferFaded[0] = gPlttBufferFaded[0x51] = arr[0];
    else
        gPlttBufferUnfaded[0] = gPlttBufferUnfaded[0x51] = gPlttBufferFaded[0] = gPlttBufferFaded[0x51] = arr[1];
    sub_8124918((&eRoulette->varB8));
    for (i = 0; i < 0xD; i++)
        sub_812492C((&eRoulette->varB8), i, &gUnknown_083F8E34[i]);
    for (i = 0; i < 0x6; i++)
    {
        switch (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2))
        {
        case SPECIES_SHROOMISH:
            eRoulette->var02 |= 0x1;
            break;
        case SPECIES_TAILLOW:
            eRoulette->var02 |= 0x2;
            break;
        }
    }
    RtcCalcLocalTime();
}

void sub_8115384(void)
{
    u32 temp_IME;
    u8 taskid;

#if DEBUG
    gUnknown_Debug_03005FB8 = eRoulette;
#endif

    switch (gMain.state)
    {
    case 0x0:
        SetVBlankCallback(NULL);
        ScanlineEffect_Stop();
        ClearVideoCallbacks();
        sub_80F9368();
        REG_BG2CNT   = 0x4686;
        REG_BG1CNT   = 0x4401;
        REG_BLDCNT   = 0x2400;
        REG_BLDALPHA = 0x060A;
        LZ77UnCompVram(&gUnknown_08E8096C, (void *)VRAM);
        LZ77UnCompVram(&gRouletteWheelTiles, (void *)(VRAM + 0x4000));
        gMain.state++;
        break;
    case 0x1:
        ResetPaletteFade();
        ResetSpriteData();
        ResetTasks();
        gMain.state++;
        break;
    case 0x2:
        Text_LoadWindowTemplate(&gWindowTemplate_81E6C3C);
        InitMenuWindow(&gMenuTextWindowTemplate);
        LoadPalette(&gUnknown_083F86BC, 0x0, 0x1C0);
        gMain.state++;
        break;
    case 0x3:
        sub_8115238();
        ClearBGTilemapBuffers();
        LZ77UnCompWram(&gUnknown_083F88BC, (void *)(ewram18800));
        LZ77UnCompVram(&gUnknown_083F8A60, (void *)(VRAM + 0x3000));
        gMain.state++;
        break;
    case 0x4:
        sub_8117838(0x0);
        sub_811857C();
        sub_81184D8();
        sub_8117F2C();
        sub_8117900();
        sub_8117BBC();
        sub_8117DF4();
        gMain.state++;
        break;
    case 0x5:
        AnimateSprites();
        BuildOamBuffer();
        sub_81180F4(gSaveBlock1.coins);
        sub_81182F8(0x6);
        sub_811829C(0x0);
        sub_8117158(0x0);
        Menu_DrawStdWindowFrame(0x0, 0xE, 0x1D, 0x13);
        Menu_PrintText(&gUnknown_081C4157[0], 0x1, 0xF);
        gSpriteCoordOffsetX = -0x3C;
        gSpriteCoordOffsetY = 0x0;
        gMain.state++;
        break;
    case 0x6:
        REG_DISPCNT = 0x1741;
        gMain.state++;
        break;
    case 0x7:
        temp_IME      = REG_IME;
        REG_IME       = 0x0;      //disable interrupts
        REG_IE       |= 0x1;      //enable VBlank interrupt
        REG_IME       = temp_IME; //reenable interrupts
        REG_DISPSTAT |= 0x8;
        SetVBlankCallback(&sub_8115124);
        BeginHardwarePaletteFade(0xFF, 0x0, 0x10, 0x0 , 0x1);
        taskid = eRoulette->varA4 = CreateTask(&sub_81156BC, 0x0);
        gTasks[taskid].data[0x6] = 0x6;
        gTasks[taskid].data[0xD] = gSaveBlock1.coins;
        eRoulette->varA5 = CreateTask(&sub_8115634, 0x1);
        SetMainCallback2(&sub_81150FC);
        break;
    }
}

void sub_8115634(u8 unused)
{
    s16 sin;
    s16 cos;
    s32 cos32;

    if (eRoulette->var21++ == eRoulette->var23)
    {
        eRoulette->var21 = 0x0;
        if ((eRoulette->var24 -= eRoulette->var22) < 0)
            eRoulette->var24 = 0x168 - eRoulette->var22;
    }
    sin = Sin2(eRoulette->var24);
    cos = Cos2(eRoulette->var24);
    sin = sin / 16;
    cos32 = cos / 16;
    eRoulette->var2C.d =  cos32;
    eRoulette->var2C.a =  cos32;
    eRoulette->var2C.b =  sin;
    eRoulette->var2C.c = -sin;
#if DEBUG
    if (unk_203955C[0] != 0 && (gMain.newKeys & 8))
    {
        gTasks[eRoulette->varA4].func = sub_81157AC;
        m4aMPlayStop(&gMPlay_SE1);
        m4aMPlayStop(&gMPlay_SE2);
        m4aMPlayStop(&gMPlay_SE3);
    }
#endif
}

void sub_81156BC(u8 taskid)
{
    if (UpdatePaletteFade() == 0)
    {
        REG_BLDCNT   |= 0x2400;
        REG_BLDALPHA  = 0x0808;
        gTasks[taskid].data[0x6] = 0;
        sub_8116CAC(taskid);
        sub_8116CF8();
        sub_81185E8();
        sub_8117158(0);
        sub_81182F8(0x6);
        sub_8116C34(taskid, &sub_81159BC, 0xFFFF, 0x3);
    }
}

void sub_8115734(u8 taskid)
{
    DisplayYesNoMenu(0x14, 0x8, 0x1);
    sub_814AAF8(0x2D9E);
    Menu_DrawStdWindowFrame(0x0, 0xE, 0x1D, 0x13);
    Menu_PrintText(&gUnknown_081C41E3, 0x1, 0xF);
    DoYesNoFuncWithChoice(taskid, &gUnknown_083F8EBC);
}

void sub_811577C(u8 taskid)
{
    Menu_EraseWindowRect(0x14, 0x8, 0x1A, 0xD);
    gTasks[taskid].func = &sub_81159BC;
}

void sub_81157AC(u8 taskid)
{
    DestroyTask(eRoulette->varA5);
    sub_8116AB0(taskid);
}

void sub_81157D0(u8 r0)
{
    u8 temp0, temp1;
    switch (r0)
    {
    case 0x0:
        sub_8124DDC(&gBGTilemapBuffers[2][0], 0x0, 0xE, 0x7, 0x10, 0xD);
        break;
    case 0x1:
    case 0x2:
    case 0x3:
    case 0x4:
        temp0 = (r0 * 3 + 0xE);
        sub_8124DDC(&gBGTilemapBuffers[2][0], 0x0, 0xE, 0x7, 0x10, 0xD);
        sub_8124E2C(&gBGTilemapBuffers[2][0], ewram18a32, temp0, 0x7, 0x3, 0xD);
        break;
    case 0x5:
    case 0xA:
    case 0xF:
        temp1 = ((r0 - 1) / 5 * 3 + 0xA);
        sub_8124DDC(&gBGTilemapBuffers[2][0], 0x0, 0xE, 0x7, 0x10, 0xD);
        sub_8124E2C(&gBGTilemapBuffers[2][0], ewram18a80, 0xE, temp1, 0x10, 0x3);
        break;
    default:
        temp0 = ((r0 % 5) * 3 + 0xE);
        temp1 = ((r0 - 1) / 5 * 3 + 0x7);
        sub_8124DDC(&gBGTilemapBuffers[2][0], 0x0, 0xE, 0x7, 0x10, 0xD);
        sub_8124E2C(&gBGTilemapBuffers[2][0], ewram18a20, temp0, temp1, 0x3, 0x3);
        break;
    }
}

void sub_8115928(u8 taskid, u8 r1)
{
    if (!r1)
        sub_811829C(gTasks[taskid].data[0x4]);
    else
        sub_811829C(eRoulette->var1B[eRoulette->var1A_0]);
    sub_81157D0(gTasks[taskid].data[0x4]);
}

void sub_811597C(u8 taskid)
{
    eRoulette->var28 = 0x1;
    sub_81157D0(gTasks[taskid].data[0x4]);
    eRoulette->var23 = 0x2;
    eRoulette->var21 = 0x0;
    gTasks[taskid].func = &sub_8115E14;
}

void sub_81159BC(u8 taskid)
{
    s16 i;

    if (eRoulette->var08 & 0x20)
    {
        for (i = 0xB; (i < 0xE); i++)
            if ((eRoulette->var08 & gUnknown_083F8C00[i].var08) == 0)
                break;
    }
    else
    {
        for (i = 0x6; (i < 0xA); i++)
            if ((eRoulette->var08 & gUnknown_083F8C00[i].var08) == 0)
                break;
    }
    gTasks[taskid].data[0x4] = i;
    sub_8116CAC(taskid);
    sub_8117158(gTasks[taskid].data[0x4]);
    sub_811829C(gTasks[taskid].data[0x4]);
    sub_8116EF8(gTasks[taskid].data[0x4]);
    gTasks[taskid].data[0x1] = 0x0;
    gTasks[taskid].func = &sub_811597C;
}

u8 sub_8115A94(s16 *r0, u8 r1)
{
    s8 temp1 = 0;
    s8 temp = 0;
    s8 arr[4] = {-5, 5, -1, 1};
    s8 t;
    t = (u8)*r0;
    switch (r1)
    {
    case 0x0:
    case 0x1:
        temp1 = (*r0 % 5);
        temp = temp1 + 0xF;
        if (temp1 == 0)
            temp1 = 0x5;
        break;
    case 0x2:
    case 0x3:
        temp1 = (s16)(*r0 / 5) * 5;
        temp = temp1 + 0x4;
        if (temp1 == 0)
            temp1 = 0x1;
        break;
    }
    *r0 += arr[r1];
    if (*r0 < temp1)
        *r0 = temp;
    if (*r0 > temp)
        *r0 = temp1;
    if (*r0 != t)
        return TRUE;
    return FALSE;
}

void sub_8115B58(u8 r0)
{
    u8 z = 0x0;
    bool8 var0 = FALSE;
    if (!(gMain.newKeys & DPAD_UP) || ((var0 = TRUE), sub_8115A94(&gTasks[r0].data[0x4], 0x0)))
        if (!(gMain.newKeys & DPAD_DOWN) || ((var0 = TRUE), sub_8115A94(&gTasks[r0].data[0x4], 0x1)))
            if (!(gMain.newKeys & DPAD_LEFT) || ((var0 = TRUE), sub_8115A94(&gTasks[r0].data[0x4], 0x2)))
                if (!(gMain.newKeys & DPAD_RIGHT) || ((var0 = TRUE), sub_8115A94(&gTasks[r0].data[0x4], 0x3)))
                    if (var0)
                    {
                        u8 i;
                        sub_8117158(gTasks[r0].data[0x4]);
                        sub_8115928(r0, FALSE);
                        gTasks[r0].data[0x1] = z;
                        PlaySE(SE_SELECT);
                        sub_8124D3C((&eRoulette->varB8), 0xFFFF);
                        eRoulette->varB8.var04[0xF].var00_7 = 0x0;
                        eRoulette->varB8.var04[0xE].var00_7 = 0x0;
                        eRoulette->varB8.var04[0xD].var00_7 = 0x0;
                        sub_8116EF8(gTasks[r0].data[0x4]);
                        for (i = 0; i < 0x4; i++)
                        {
                            gSprites[eRoulette->var3C[i + 0x29]].oam.tileNum =
                            gSprites[eRoulette->var3C[i + 0x29]].sheetTileStart
                            + (*gSprites[eRoulette->var3C[i + 0x29]].anims)->type;
                        }
                        if ((u16)(gTasks[r0].data[0x4] - 1) < 0x4 && !(eRoulette->var08 & gUnknown_083F8C00[gTasks[r0].data[0x4]].var08) )
                        {
                            z = gTasks[r0].data[0x4] - 1;
                            gSprites[eRoulette->var3C[z + 0x29]].oam.tileNum =
                            gSprites[eRoulette->var3C[z + 0x29]].sheetTileStart
                            + (*gSprites[eRoulette->var3C[z + 0x29]].anims + 1)->type;
                        }
                    }
}

void sub_8115D58(u8 r0)
{
    eRoulette->var28 = 0xFF;
    if (eRoulette->var19 == 1)
        eRoulette->var23 = 1;
    else
        eRoulette->var23 = 0;
    eRoulette->var21 = 0;
    gTasks[r0].data[0x1] = 0x20;
    gTasks[r0].func = &sub_8115ECC;
}

void sub_8115DA0(u8 taskid)
{
    eRoulette->var1B[eRoulette->var1A_0] = gTasks[taskid].data[0x4];
    gTasks[taskid].data[0x2] = sub_8117380(eRoulette->var1B[eRoulette->var1A_0]);
    sub_811829C(eRoulette->var1B[eRoulette->var1A_0]);
    if ((gTasks[taskid].data[0xD] -= eRoulette->var19) < 0)
        gTasks[taskid].data[0xD] = 0;
    sub_81180F4(gTasks[taskid].data[0xD]);
    gTasks[taskid].func = &sub_8115D58;
}

void sub_8115E14(u8 taskid)
{
    sub_8115B58(taskid);
    switch (gTasks[taskid].data[0x1])
    {
    case 0x0:
        sub_81157D0(gTasks[taskid].data[0x4]);
        gTasks[taskid].data[0x1]+= 1;
    break;
    case 0x1E:
        sub_81157D0(0);
        gTasks[taskid].data[0x1]+= 1;
    break;
    case 0x3B:
        gTasks[taskid].data[0x1] = 0;
    break;
    default:
        gTasks[taskid].data[0x1]++;
    }
    if (gMain.newKeys & A_BUTTON)
    {
        if ((eRoulette->var08 & gUnknown_083F8C00[gTasks[taskid].data[0x4]].var08))
            PlaySE(SE_BOO);
        else
        {
            m4aSongNumStart(SE_REGI);
            gTasks[taskid].func = &sub_8115DA0;
        }
    }
}

void sub_8115ECC(u8 taskid)
{
    if (gTasks[taskid].data[0x1]-- > 0)
    {
        if (gTasks[taskid].data[0x1] > 0x2)
            gSpriteCoordOffsetX += 0x2;
        if ((eRoulette->var26 += 0x4) == 0x68)
            gSprites[eRoulette->var3C[0x19]].callback = &SpriteCallbackDummy;
    }
    else
    {
        sub_8117AA8(0x1, 0xFF);
        sub_8117C60(0x1, 0xFF);
        gTasks[taskid].func = &sub_8116100;
        gTasks[taskid].data[0x1] = 0;
    }
}

u8 sub_8115F58(u16 r0, u16 r1)
{
    u8 timeh;
    switch (eRoulette->var02)
    {
    case 0x1: // SHROOMISH
    case 0x2: // TAILLOW
        // one of the two is in party
        timeh = gLocalTime.hours - 0x4;
        if (!(timeh > 0x5))
        {
            if (!(r0 < 0xC || (r1 & 0x1)))
                return 0x1;
            else
            {
                const struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[eRoulette->var04_0].var02 / 2;
            }
        }
        else if (!(r1 & 0x3))
        {
            const struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
            return p[eRoulette->var04_0].var02 / 2;
        }
        else
        {
            const struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
            return p[eRoulette->var04_0].var02;
        }
        break;
    case 0x3:
        // both are in party
        timeh = gLocalTime.hours - 0x4;
        if (!(timeh > 0x6))
        {
            if (r0 < 0x6 || (r1 & 0x1))
            {
                const struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[eRoulette->var04_0].var02 / 2;
            }
            else
            {
                return 0x1;
            }
        }
        else if ((r1 & 0x1) && !(r0 < 0x7))
        {
            const struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
            return p[eRoulette->var04_0].var02 / 4;
        }
        else
        {
            const struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
            return p[eRoulette->var04_0].var02 / 2;
        }
        break;
    case 0:
    default:
        // neither is in party
        timeh = gLocalTime.hours - 0x4;
        if (!(timeh > 5))
        {
            if (!(r1 & 0x3))
            {
                return 0x1;
            }
            else
            {
                const struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[eRoulette->var04_0].var02 / 2;
            }
        }
        else if (!(r1 & 0x3))
        {
            if (!(r0 < 0xD))
            {
                const struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[eRoulette->var04_0].var02 / 2;
            }
            else
            {
                const struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[eRoulette->var04_0].var02;
            }
        }
        else if (r1 & (0x80 << 8))
        {
            if (!(r0 < 0xD))
            {
                const struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[eRoulette->var04_0].var02;
            }
            else
            {
                const struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
                return p[eRoulette->var04_0].var01;
            }
        }
        else
        {
            const struct StructgUnknown_083F8DF4 *p = &gUnknown_083F8DF4[0];
            return p[eRoulette->var04_0].var01 * 2;
        }
    }
}

void sub_8116100(u8 taskid)
{
    u8 randf;
    s8 randfinal;
    s8 r5;
    u16 g = 0;
    u16 rand;
    u16 randmod;
    u16 angles[] = {0, 180, 90, 270};
    rand = Random();
    randmod = rand % 0x64;
    eRoulette->var7C = gTasks[taskid].data[0x6];
    eRoulette->var7F = g;
    eRoulette->var7E = g;
    eRoulette->var7D = g;
    randf = sub_8115F58(gTasks[taskid].data[0x8], rand);
    randfinal = (rand % randf) - (randf / 2);
    if (gLocalTime.hours < 0xD)
        r5 = 0x0;
    else
        r5 = 0x1;
    if (randmod < 0x50)
        r5 *= 2;
    else
        r5 = (1 - r5) * 2;
    eRoulette->var80 = g = gUnknown_083F8DF4[eRoulette->var04_0].var1A + randfinal;
    //
    g = S16TOPOSFLOAT(g) / 5.0f;
    eRoulette->var82 = g * 3;
    eRoulette->var84 = g;
    eRoulette->var86 = g;
    //
    eRoulette->var88 = S16TOPOSFLOAT(angles[(rand & 0x1) + r5]);
    eRoulette->var8C = S16TOPOSFLOAT(gUnknown_083F8DF4[eRoulette->var04_0].var18);
    eRoulette->var90 = ((eRoulette->var8C * 0.5f) - eRoulette->var8C) / S16TOPOSFLOAT(g * 3);
    eRoulette->var94 = 68.0f;
    eRoulette->var9C = 0.0f;
    eRoulette->var98 = -(8.0f / S16TOPOSFLOAT(g * 3));
    eRoulette->varA0 = 36.0f;
    gTasks[taskid].func = sub_8116308;
}

void sub_8116308(u8 taskid)
{
    u8 index;
    eRoulette->var03_7 = 1;
    index = eRoulette->var3C[eRoulette->var7C];
    eRoulette->var38 = &gSprites[index];
    eRoulette->var38->callback = sub_81191F4;
    gTasks[taskid].data[0x6]++;
    gTasks[taskid].data[0x8]++;
    sub_81182F8(0x6 - gTasks[taskid].data[0x6]);
    m4aSongNumStart(SE_TAMAKORO);
    gTasks[taskid].func = &sub_811637C;
}

void sub_811637C(u8 taskid)
{
    if (eRoulette->var7D)
    {
        if (eRoulette->var03_5)
        {
            if (eRoulette->var03_6)
            {
                eRoulette->var03_6 = FALSE;
                eRoulette->var03_5 = FALSE;
            }
        }
        else
        {
            if (!gTasks[taskid].data[0x1])
            {
                u8 temp = sub_8116E5C(sub_8116D54(taskid, eRoulette->var7E), eRoulette->var1B[eRoulette->var1A_0]);
                gTasks[taskid].data[0x5] = temp;
                if (temp == 1)
                    sub_8124CE8((&eRoulette->varB8), 0x1000);
            }
            if (gTasks[taskid].data[0x1] < 0x3D)
            {
                if (gMain.newKeys & A_BUTTON)
                    gTasks[taskid].data[0x1] = 0x3C;
                gTasks[taskid].data[0x1]++;
            }
            else
            {
                sub_8117158(eRoulette->var1B[eRoulette->var1A_0]);
                sub_8117AA8(0x0, (u8)gTasks[taskid].data[0xC]);
                sub_8117C60(0x0, (u8)gTasks[taskid].data[0x6] - 0x1);
                gTasks[taskid].data[0x1] = 0x20;
                gTasks[taskid].func = &sub_8116474;
            }
        }
    }
}

void sub_8116474(u8 taskid)
{
    if (gTasks[taskid].data[0x1]-- > 0x0)
    {
        if (gTasks[taskid].data[0x1] > 0x2)
            gSpriteCoordOffsetX -= 0x2;
        if ((eRoulette->var26 -= 0x4) == 0x68)
            gSprites[eRoulette->var3C[0x19]].callback = &sub_81184CC;
    }
    else
    {
        sub_8117D68(gTasks[taskid].data[0xC]);
        if (gTasks[taskid].data[0x5] == 1)
            gTasks[taskid].data[0x1] = 0x79;
        else
            gTasks[taskid].data[0x1] = 0x3D;
        gTasks[taskid].func = &sub_8116514;
    }
}

void sub_8116514(u8 taskid)
{
    if (gTasks[taskid].data[0x1]-- > 0x1)
    {
        switch (gTasks[taskid].data[0x1] % 0x10)
        {
        case 0x8:
            sub_8117AA8(0x0, 0xFF);
            sub_8117C60(0x0, 0xFF);
            break;
        case 0x0:
            sub_8117AA8(0x0, (u8)gTasks[taskid].data[0xC]);
            sub_8117C60(0x0, (u8)gTasks[taskid].data[0x6] - 0x1);
            break;
        }
    }
    else
    {
        sub_8116C34(taskid, &sub_8116638, 0x1E, 0x0);
    }
}

void sub_811659C(u8 taskid)
{
    switch (gTasks[taskid].data[0x5])
    {
    case 0x1:
    case 0x2:
        if (IsFanfareTaskInactive())
        {
            u32 wins = GetGameStat(GAME_STAT_CONSECUTIVE_ROULETTE_WINS);
            if (wins < ++gTasks[taskid].data[0xB])
                SetGameStat(GAME_STAT_CONSECUTIVE_ROULETTE_WINS, gTasks[taskid].data[0xB]);
            sub_8116C34(taskid, &sub_811677C, 0xFFFF, 0x3);
        }
        break;
    case 0:
    default:
        if (!IsSEPlaying())
        {
            gTasks[taskid].data[0xB] = FALSE;
            sub_8116C34(taskid, &sub_81167F4, 0xFFFF, 0x3);
        }
    }
}

void sub_8116638(u8 taskid)
{
    switch (gTasks[taskid].data[0x5])
    {
    case 0x1:
    case 0x2:
        if (gTasks[taskid].data[0x2] == 0xC)
        {
            PlayFanfare(MUS_ME_B_BIG);
            Menu_DrawStdWindowFrame(0x0, 0xE, 0x1D, 0x13);
            Menu_PrintText(&gUnknown_081C41A5, 0x1, 0xF);
        }
        else
        {
            PlayFanfare(MUS_ME_B_SMALL);
            Menu_DrawStdWindowFrame(0x0, 0xE, 0x1D, 0x13);
            Menu_PrintText(&gUnknown_081C4199, 0x1, 0xF);
        }
        break;
    case 0:
    default:
        m4aSongNumStart(SE_HAZURE);
        Menu_DrawStdWindowFrame(0x0, 0xE, 0x1D, 0x13);
        Menu_PrintText(&gUnknown_081C41AE, 0x1, 0xF);
    }
    gTasks[taskid].data[0x1] = 0x0;
    gTasks[taskid].func = &sub_811659C;
}

void sub_81166E8(u8 taskid)
{
    s32 r0 = gTasks[taskid].data[0x7];
    switch (r0)
    {
    case 0x0:
        gTasks[taskid].data[0xD]++;
        m4aSongNumStart(SE_PIN);
        sub_81180F4(gTasks[taskid].data[0xD]);
        if (gTasks[taskid].data[0xD] > 0x270E)
        {
            gTasks[taskid].data[0x1] = r0;
        }
        else
        {
            gTasks[taskid].data[0x1]--;
            gTasks[taskid].data[0x7]++;
        }
        break;
    case 0x3:
        m4aSongNumStop(SE_PIN);
        gTasks[taskid].data[0x7] = 0x0;
        break;
    default:
        gTasks[taskid].data[0x7]++;
    }
    if (gTasks[taskid].data[0x1] == 0x0)
        sub_8116C34(taskid, &sub_81167F4, 0xFFFF, 0x3);
}

void sub_811677C(u8 taskid)
{
    ConvertIntToDecimalStringN((u8 *)&gStringVar1, (eRoulette->var19 * gTasks[taskid].data[0x2]), STR_CONV_MODE_LEFT_ALIGN, 0x2);
    StringExpandPlaceholders((u8 *)&gStringVar4, &gUnknown_081C41BD);
    Menu_DrawStdWindowFrame(0x0, 0xE, 0x1D, 0x13);
    Menu_PrintText((u8 *)&gStringVar4, 0x1, 0xF);
    gTasks[taskid].data[0x1] = (eRoulette->var19 * gTasks[taskid].data[0x2]);
    gTasks[taskid].data[0x7] = 0x0;
    gTasks[taskid].func = &sub_81166E8;
}

void sub_81167F4(u8 taskid)
{
    sub_8124D3C((&eRoulette->varB8), 0xFFFF);
    eRoulette->varB8.var04[0xF].var00_7 = 0x0;
    eRoulette->varB8.var04[0xE].var00_7 = 0x0;
    eRoulette->varB8.var04[0xD].var00_7 = 0x0;
    gSprites[eRoulette->var3C[0x7 + gUnknown_083F8C00[gTasks[taskid].data[0xC]].var00]].invisible = TRUE;
    gTasks[taskid].func = &sub_8116880;
}

void sub_8116880(u8 taskid)
{
    u8 i = 0;
    gTasks[taskid].data[0x4] = i;
    eRoulette->var1B[eRoulette->var1A_0] = 0x0;
    sub_8117158(0x0);
    gSprites[eRoulette->var3C[0x30]].invisible = TRUE;
    for (i = 0; i < 0x4; i++)
    {
        gSprites[eRoulette->var3C[i + 0x29]].oam.tileNum =
        gSprites[eRoulette->var3C[i + 0x29]].sheetTileStart
        + (*gSprites[eRoulette->var3C[i + 0x29]].anims)->type;
    }
    if (!(gTasks[taskid].data[0xD] < eRoulette->var19))
    {
        if (gTasks[taskid].data[0x6] == 0x6)
        {
            Menu_DrawStdWindowFrame(0x0, 0xE, 0x1D, 0x13);
            Menu_PrintText(&gUnknown_081C41F1, 0x1, 0xF);
            sub_8116C34(taskid, &dp01t_12_3_battle_menu, 0xFFFF, 0x3);
        }
        else if (gTasks[taskid].data[0xD] == 0x270F)
        {
            Menu_DrawStdWindowFrame(0x0, 0xE, 0x1D, 0x13);
            Menu_PrintText(&gUnknown_081C4231, 0x1, 0xF);
            sub_8116C34(taskid, &sub_8115734, 0xFFFF, 0x3);
        }
        else
        {
            gTasks[taskid].func = &sub_8115734;
        }
    }
    else
    {
        Menu_DrawStdWindowFrame(0x0, 0xE, 0x1D, 0x13);
        Menu_PrintText(&gUnknown_081C41D2, 0x1, 0xF);
        sub_8116C34(taskid, &sub_81157AC, 0x3C, 0x3);
    }
}

void dp01t_12_3_battle_menu(u8 taskid)
{
    u8 i = 0x0;
    gTasks[taskid].data[0x6] = 0x0;
    sub_8116CAC(taskid);
    sub_8116CF8();
    sub_81185E8();
    sub_8117158(0x0);
    sub_81182F8(0x6);
    for (i = 0; i < 0xC; i++)
        gSprites[eRoulette->var3C[i + 0x7]].invisible = FALSE;
    if (gTasks[taskid].data[0xD] == 0x270F)
    {
        Menu_DrawStdWindowFrame(0x0, 0xE, 0x1D, 0x13);
        Menu_PrintText(&gUnknown_081C4231, 0x1, 0xF);
        sub_8116C34(taskid, &sub_8115734, 0xFFFF, 0x3);
    }
    else
    {
        gTasks[taskid].func = &sub_8115734;
    }
}

void sub_8116AB0(u8 taskid)
{
    sub_8124D3C((&eRoulette->varB8), 0xFFFF);
    sub_8124918((&eRoulette->varB8));
    gSaveBlock1.coins = gTasks[taskid].data[0xD];
    if (gSaveBlock1.coins < eRoulette->var19)
        gSpecialVar_0x8004 = TRUE;
    else
        gSpecialVar_0x8004 = FALSE;
    BeginHardwarePaletteFade(0xFF, 0x0, 0x0, 0x10, 0x0);
    gTasks[taskid].func = &sub_8116B40;
}

void sub_8116B40(u8 taskId) // end roulette ?
{
    if (UpdatePaletteFade() == 0)
    {
        SetVBlankCallback(NULL);
        memset(eRoulette, 0x0, 0x17C);
        gSpriteCoordOffsetX = gSpriteCoordOffsetY = 0x0;
        sub_80F9368();
        FreeAllSpritePalettes();
        ResetPaletteFade();
        ResetSpriteData();
        ClearBGTilemapBuffers();
        REG_BLDCNT = 0x0;
        REG_BLDALPHA = 0x0;
        REG_BLDY = 0x0;
        gFieldCallback = &sub_8080990;
        SetMainCallback2(&CB2_ReturnToField);
        DestroyTask(taskId);
#if DEBUG
        unk_203955C[0] = 0;
#endif
    }
}

void sub_8116BC0(u8 taskid)
{
    if (eRoulette->varA8 == 0 || gMain.newKeys & eRoulette->varAA)
    {
        gTasks[taskid].func = eRoulette->varAC;
        if (eRoulette->varAA > 0)
            PlaySE(SE_SELECT);
        eRoulette->varAC = NULL;
        eRoulette->varAA = 0x0;
        eRoulette->varA8 = 0x0;
    }
    if (eRoulette->varA8 != 0xFFFF)
        eRoulette->varA8--;
}

void sub_8116C34(u8 taskid, TaskFunc r1, u16 r2, u16 r3)
{
    eRoulette->varB4 = gTasks[taskid].func;
    if (r1 == NULL)
        r1 = eRoulette->varB4;
    eRoulette->varAC = r1;
    eRoulette->varA8 = r2;
    if (r2 == 0xFFFF && r3 == 0)
        eRoulette->varAA = 0xFFFF;
    else
        eRoulette->varAA = r3;
    gTasks[taskid].func = &sub_8116BC0;
}

void sub_8116CAC(u8 taskid)
{
    u8 i = 0;
    eRoulette->var00 = i;
    eRoulette->var03_0 = 0x0;
    eRoulette->var03_5 = 0x0;
    eRoulette->var03_6 = 0x0;
    eRoulette->var03_7 = 0x0;
    for (i = 0; i < 0x6; i++)
        eRoulette->var1B[i] = 0x0;
    eRoulette->var1A_0 = 0x0;
    gTasks[taskid].data[0x1] = 0x0;
}

void sub_8116CF8(void)
{
    u8 i;
    eRoulette->var08 = 0x0;
    for (i = 0; i < 0x6; i++)
        eRoulette->var0C[i] = 0x0;
    for (i = 0; i < 0x4; i++)
        eRoulette->var12[i] = 0x0;
    for (i = 0; i < 0x3; i++)
        eRoulette->var16[i] = 0x0;
    sub_8117C60(0x1, 0xFF);
}

u8 sub_8116D54(u8 taskid, u8 r1)
{
    u32 t0[] = {67650, 135300, 270600, 541200};
    u32 t1[] = {0x3e0, 0x7c00, 0xf8000};
    if (r1 > 0xB)
    {
        return 0x0;
    }
    else
    {
        u8 i;
        u8 z;
        eRoulette->var0C[gTasks[taskid].data[0x6] - 1] = gUnknown_083F8D90[r1].var02;
        gTasks[taskid].data[0xC] = gUnknown_083F8D90[r1].var02;
        eRoulette->var08 |= gUnknown_083F8D90[r1].var04;
        for (i = 0; i < 0x4; i++)
        {
            if (gUnknown_083F8D90[r1].var04 & t0[i])
                eRoulette->var12[i]++;
            if (eRoulette->var12[i] > 0x2)
                eRoulette->var08 |= t0[i];
        }
        for (z = 0; z < 0x3; z++)
        {
            if (gUnknown_083F8D90[r1].var04 & t1[z])
                eRoulette->var16[z]++;
            if (eRoulette->var16[z] > 0x3)
                eRoulette->var08 |= t1[z];
        }
        return gUnknown_083F8D90[r1].var02;
    }
}

u8 sub_8116E5C(u8 r0, u8 r1)
{
    u8 t = r0;
    if (--r0 < 0x13)
    {
        switch (r1)
        {
        case 0x0:
            return 0x3;
            break;
        case 0x1 ... 0x4:
            if (t == r1 + 5 || t == r1 + 10 || t == r1 + 15)
                return 0x1;
            break;
        case 0x5:
        case 0xA:
        case 0xF:
            if (!(t < r1 + 1) && !(t > r1 + 4))
                return 0x1;
            break;
        default:
            if (t == r1)
                return 0x1;
        }
    }
    return 0x0;
}

void sub_8116EF8(u8 r0)
{

    u16 var0 = 0x0;
    u8 var2;
    u16 var3;
    u8 i;
    switch (r0)
    {
    case 0x5:
    case 0xA:
    case 0xF:
        for (i = (r0 + 0x1); i < (r0 + 0x5); i++)
            if (!(eRoulette->var08 & gUnknown_083F8C00[i].var08))
                var0 |= gUnknown_083F8C00[i].var10;
        sub_8124CE8(&eRoulette->varB8, var0 &= 0xDFFF);
        break;
    default:
    {
        struct UnkStruct1 var1[0x3];
        memcpy(var1, gUnknown_083F8E9C, sizeof var1);
        if (r0 > 0 && r0 < 5)
            var2 = 3;
        else
            var2 = 1;
        var3 = r0 / 5 - 1;
        switch (r0 % 5)
        {
            case 0x1:
                var3 = gSprites[eRoulette->var3C[7 + 0]].oam.paletteNum * 0x10;
                break;
            case 0x2:
                var3 = gSprites[eRoulette->var3C[7 + 1]].oam.paletteNum * 0x10;
                break;
            case 0x3:
                var3 = gSprites[eRoulette->var3C[7 + 2]].oam.paletteNum * 0x10;
                break;
            case 0x4:
                var3 = gSprites[eRoulette->var3C[7 + 3]].oam.paletteNum * 0x10;
                break;
        }
        if (var2 == 1)
        {
            if (!(eRoulette->var08 & gUnknown_083F8C00[r0].var08))
            {
                var1[r0 / 5 - 1].var02 += var3;
                sub_812492C(&eRoulette->varB8, 13, &var1[r0 / 5 - 1]);
            }
            else
                return;
        }
        else
        {
            for (i = 0; i < 3; i++)
            {
                u8 var4 = i * 5 + r0 + 5;
                if (!(eRoulette->var08 & gUnknown_083F8C00[var4].var08))
                {
                    var1[var4 / 5 - 1].var02 += var3;
                    sub_812492C(&eRoulette->varB8, i + 13, &var1[var4 / 5 - 1]);
                    if (var2 == 3)
                        var0 = gUnknown_083F8C00[var4].var10;
                    var2--;
                }
            }
            if (var2 != 2)
                var0 = 0;
        }
        sub_8124CE8(&eRoulette->varB8, var0 |= gUnknown_083F8C00[r0].var10);
        break;
    }
    }
}

void sub_8117158(u8 r0)
{
    vu8 i;
    vu8 z;
    vu16 var1;
    vu16 var2;
    vu8 var0;
    u8 v[0x5];
    u8 l;
    eRoulette->var2A = 0x1;
    sub_8117AA8(0x0, 0x0);
    sub_8124E2C(gBGTilemapBuffers[1], (u16 *)ewram18800, 0xE, 0x7, 0x10, 0xD);
    switch (r0)
    {
    case 0x0:
        return;
    case 0x1 ... 0x4:
        l = 0x4;
        for (i = 0x0; i < l; i++)
            v[i] = i * 0x5 + r0;
        break;
    case 0x5:
    case 0xA:
    case 0xF:
        l = 0x5;
        for (i = 0x0; i < l; i++)
            v[i] = i + r0;
        break;
    default:
        l = 0x1;
        v[0] = r0;
    }
    for (i = 0x0; i < l; i++)
    {
        var0 = gUnknown_083F8C00[v[i]].var06;
        var1 = gUnknown_083F8C00[v[i]].var03;
        for (z = 0; z < 0x3; z++)
        {
            var2 = (gUnknown_083F8C00[v[i]].var04 + z) * 0x20;
            gBGTilemapBuffers[1][var1 + var2 + 0x0] = ewram189a0[(var0 + z) * 0x3 + 0x0];
            gBGTilemapBuffers[1][var1 + var2 + 0x1] = ewram189a0[(var0 + z) * 0x3 + 0x1];
            gBGTilemapBuffers[1][var1 + var2 + 0x2] = ewram189a0[(var0 + z) * 0x3 + 0x2];
        }
    }
}

u8 sub_8117380(u8 r0)
{
    u8 var0[] = {0, 3, 4, 6, 12};
    if (r0 > 19)
        r0 = 0;
    switch (gUnknown_083F8C00[r0].var01_0)
    {
    case 3:
        r0 = r0 / 5 - 1;
        if (eRoulette->var16[r0] > 3)
            return 0x0;
        return var0[eRoulette->var16[r0] + 1];
    case 4:
        r0--;
        if (eRoulette->var12[r0] > 2)
            return 0;
        return var0[eRoulette->var12[r0] + 2];
    case 12:
        if (eRoulette->var08 & gUnknown_083F8C00[r0].var08)
            return 0;
        return var0[4];
    }
    return 0;
}

void sub_8117434(void)
{
    s32 x1;
    s32 x2;
    REG_BG2PA = eRoulette->var2C.a;
    REG_BG2PB = eRoulette->var2C.b;
    REG_BG2PC = eRoulette->var2C.c;
    REG_BG2PD = eRoulette->var2C.d;
    x1 = 0x7400 - eRoulette->var2C.a * (gSpriteCoordOffsetX + 0x74)
                - eRoulette->var2C.b * (gSpriteCoordOffsetY + 0x50);
    x2 = 0x5400 - eRoulette->var2C.c * (gSpriteCoordOffsetX + 0x74)
                - eRoulette->var2C.d * (gSpriteCoordOffsetY + 0x50);
    REG_BG2X_L = x1;
    REG_BG2X_H = (x1 & 0x0fff0000) >> 16;
    REG_BG2Y_L = x2;
    REG_BG2Y_H = (x2 & 0x0fff0000) >> 16;
}

s16 sub_81174C4(s16 r0, s16 r1)
{
    s32 t = r0 * r1;
    t /= 0x100;
    return t;
}

s16 sub_81174E0(s16 r0)
{
    s32 t = 0x10000;
    return t / r0;
}

void sub_81174F8(u8 r0)
{
    DisplayYesNoMenu(0x14, 0x8, 0x1);
    sub_814AAF8(0x2D9E);
    DoYesNoFuncWithChoice(r0, &gUnknown_083F8EB4);
}

void sub_8117528(u8 taskid)
{
    if (!gPaletteFade.active)
    {
        SetVBlankCallback(NULL);
        SetMainCallback2(&sub_8115384);
        DestroyTask(taskid);
    }
}

void sub_811755C(u8 taskid)
{
    Menu_EraseWindowRect(0x14, 0x8, 0x1A, 0xD);
    Menu_EraseScreen();
    BeginNormalPaletteFade(0xFFFFFFFF, 0, 0, 16, RGB(0, 0, 0));
    gPaletteFade.delayCounter = gPaletteFade.multipurpose2;
    UpdatePaletteFade();
    gTasks[taskid].func = &sub_8117528;
}

void sub_81175C0(u8 taskid)
{
#if DEBUG
    unk_203955C[0] = 0;
#endif
    Menu_EraseScreen();
    ScriptContext2_Disable();
    DestroyTask(taskid);
}

void sub_81175DC(u8 taskid)
{
    gTasks[taskid].data[0]++;
    if (!(gMain.newKeys & (A_BUTTON | B_BUTTON)) && gTasks[taskid].data[0] < 0x3D)
        return;
    gSpecialVar_0x8004 = 0x1;
    Menu_EraseScreen();
    ScriptContext2_Disable();
    DestroyTask(taskid);
}

void sub_8117630(u8 taskid)
{
    u32 temp = gUnknown_083F8DF0[(gSpecialVar_0x8004 & 0x1) + (gSpecialVar_0x8004 >> 0x7 << 0x1)];
    ConvertIntToDecimalStringN(gStringVar1, temp, 0x2, 0x1);
    StringExpandPlaceholders(gStringVar4, &gUnknown_081C40DF);
    Menu_DrawStdWindowFrame(0x0, 0xE, 0x1D, 0x13);
    Menu_PrintText(gStringVar4, 0x1, 0xF);
    gTasks[taskid].func = &sub_81174F8;
}

void Task_Roulette_0(u8 taskid)
{
    s32 temp;
    ConvertIntToDecimalStringN(gStringVar1, gTasks[taskid].data[0xD], 0x1, 0x4);
    StringExpandPlaceholders(gStringVar4, gOtherText_Coins);
    Menu_DrawStdWindowFrame(0x0, 0x0, 0x9, 0x3);
    MenuPrint_RightAligned(gStringVar4, 0x9, 0x1);
    temp = gUnknown_083F8DF0[(gSpecialVar_0x8004 & 0x1) + (gSpecialVar_0x8004 >> 0x7 << 0x1)];
    ConvertIntToDecimalStringN(gStringVar1, temp, 0x2, 0x1);
    if (gTasks[taskid].data[0xD] >= temp)
    {
        if ((gSpecialVar_0x8004 & 0x80) && (gSpecialVar_0x8004 & 0x1))
        {
            Menu_DrawStdWindowFrame(0x0, 0xE, 0x1D, 0x13);
            Menu_PrintText(&gUnknown_081C4139, 0x1, 0xF);
            sub_8116C34(taskid , &sub_8117630, 0xFFFF, 0x3);
        }
        else
        {
            StringExpandPlaceholders(gStringVar4, &gUnknown_081C40DF);
            Menu_DrawStdWindowFrame(0x0, 0xE, 0x1D, 0x13);
            Menu_PrintText(gStringVar4, 0x1, 0xF);
            gTasks[taskid].func = &sub_81174F8;
        }
    }
    else
    {
        StringExpandPlaceholders(gStringVar4, &gUnknown_081C411C);
        Menu_DrawStdWindowFrame(0x0, 0xE, 0x1D, 0x13);
        Menu_PrintText(gStringVar4, 0x1, 0xF);
        gTasks[taskid].func = &sub_81175DC;
        gTasks[taskid].data[0xD] = 0x0;
        gTasks[taskid].data[0x0] = 0x0;
    }
}

#if DEBUG

void debug_sub_812CDE4(u8 taskId)
{
    if (gMain.newKeys & A_BUTTON)
    {
        gTasks[taskId].data[13]++;
        if (gTasks[taskId].data[13] == 10000)
            gTasks[taskId].data[13] = 0;
        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].data[13], 1, 4);
        StringExpandPlaceholders(gStringVar4, gOtherText_Coins);
        MenuPrint_RightAligned(gStringVar4, 9, 1);
    }
    else if (gMain.newKeys & B_BUTTON)
    {
        gTasks[taskId].data[13]--;
        if (gTasks[taskId].data[13] == -1)
            gTasks[taskId].data[13] = 9999;
        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].data[13], 1, 4);
        StringExpandPlaceholders(gStringVar4, gOtherText_Coins);
        MenuPrint_RightAligned(gStringVar4, 9, 1);
    }
    else if (gMain.newKeys & 0x100)
    {
        gTasks[taskId].data[13] += 10;
        if (gTasks[taskId].data[13] > 9999)
            gTasks[taskId].data[13] -= 9999;
        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].data[13], 1, 4);
        StringExpandPlaceholders(gStringVar4, gOtherText_Coins);
        MenuPrint_RightAligned(gStringVar4, 9, 1);
    }
    else if (gMain.newKeys & 0x200)
    {
        gTasks[taskId].data[13] -= 10;
        if (gTasks[taskId].data[13] < 0)
            gTasks[taskId].data[13] += 9999;
        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].data[13], 1, 4);
        StringExpandPlaceholders(gStringVar4, gOtherText_Coins);
        MenuPrint_RightAligned(gStringVar4, 9, 1);
    }
    else if (gMain.newKeys & 8)
    {
        gSaveBlock1.coins = gTasks[taskId].data[13];
        gTasks[taskId].func = Task_Roulette_0;
        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].data[13], 1, 4);
        StringExpandPlaceholders(gStringVar4, gOtherText_Coins);
        MenuPrint_RightAligned(gStringVar4, 9, 1);
        unk_2039560 = 0;
    }
    else if (gMain.newKeys & 4)
    {
        gSaveBlock1.coins = gTasks[taskId].data[13];
        gTasks[taskId].func = Task_Roulette_0;
        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].data[13], 1, 4);
        StringExpandPlaceholders(gStringVar4, gOtherText_Coins);
        MenuPrint_RightAligned(gStringVar4, 9, 1);
        unk_2039560 = 1;
    }
}

const u8 gUnknown_Debug_0842510D[] = _("Set　COIN　and　Press　START\nAーp1　Bーm1　R:Lー×10");

void debug_sub_812CFE8(u8 taskId)
{
    gTasks[taskId].data[13] = gSaveBlock1.coins;
    if (Random() & 1)
        gSpecialVar_0x8004 |= 0x80;
    ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].data[13], 1, 4);
    StringExpandPlaceholders(gStringVar4, gOtherText_Coins);
    Menu_DrawStdWindowFrame(0, 0, 9, 3);
    MenuPrint_RightAligned(gStringVar4, 9, 1);
    Menu_DrawStdWindowFrame(0, 14, 29, 19);
    Menu_PrintText(gUnknown_Debug_0842510D, 1, 15);
    gTasks[taskId].func = debug_sub_812CDE4;
}

#endif

void PlayRoulette(void)
{
    u8 taskid;

    ScriptContext2_Enable();
#if DEBUG
    unk_2039560 = 0;
    if (unk_203955C[0] != 0)
    {
	    CreateTask(debug_sub_812CFE8, 0);
	    return;
    }
#endif
    taskid = CreateTask(Task_Roulette_0, 0);
    gTasks[taskid].data[0xD] = gSaveBlock1.coins;
}
