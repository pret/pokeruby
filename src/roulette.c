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
	{255, 0, 0, 0, 7, 7, 0, 0, 0, 0, 0, 0, 0},
	{12, 4, 1, 0, 17, 7, 0, 0, 0, 2, 0x10842, 0xe000, 0},
	{13, 4, 2, 0, 20, 7, 0, 0, 0, 4, 0x21084, 0xe000, 0},
	{14, 4, 3, 0, 23, 7, 0, 0, 0, 8, 0x42108, 0xe000, 0},
	{15, 4, 4, 0, 26, 7, 0, 0, 0, 16, 0x84210, 0xe000, 0},
	{16, 3, 0, 1, 14, 10, 0, 12, 0, 32, 0x3e0, 0x249, 0},
	{0, 12, 1, 1, 17, 10, 3, 3, 0, 64, 64, 0x2001, 0},
	{9, 12, 2, 1, 20, 10, 3, 3, 0, 128, 128, 0x2200, 0},
	{6, 12, 3, 1, 23, 10, 3, 3, 0, 0x100, 0x100, 0x2040, 0},
	{3, 12, 4, 1, 26, 10, 3, 3, 0, 0x200, 0x200, 0x2008, 0},
	{17, 3, 0, 2, 14, 13, 3, 15, 0, 0x400, 0x7c00, 0x492, 0},
	{4, 12, 1, 2, 17, 13, 6, 6, 0, 0x800, 0x800, 0x2010, 0},
	{1, 12, 2, 2, 20, 13, 6, 6, 0, 0x1000, 0x1000, 0x2002, 0},
	{10, 12, 3, 2, 23, 13, 6, 6, 0, 0x2000, 0x2000, 0x2400, 0},
	{7, 12, 4, 2, 26, 13, 6, 6, 0, 0x4000, 0x4000, 0x2080, 0},
	{18, 3, 0, 3, 14, 16, 6, 18, 0, 0x8000, 0xf8000, 0x924, 0},
	{8, 12, 1, 3, 17, 16, 9, 9, 0, 0x10000, 0x10000, 0x2100, 0},
	{5, 12, 2, 3, 20, 16, 9, 9, 0, 0x20000, 0x20000, 0x2020, 0},
	{2, 12, 3, 3, 23, 16, 9, 9, 0, 0x40000, 0x40000, 0x2004, 0},
	{11, 12, 4, 3, 26, 16, 9, 9, 0, 0x80000, 0x80000, 0x2800, 0},
};

const struct StructgUnknown_083F8D90 gUnknown_083F8D90[] = {
    { 0,  1,  6, 64},
    { 1,  3, 12, 0x1000},
    { 2,  5, 18, 0x40000},
    { 3,  7,  9, 0x200},
    { 4,  9, 11, 0x800},
    { 5, 11, 17, 0x20000},
    { 6, 13,  8, 0x100},
    { 7, 15, 14, 0x4000},
    { 8, 17, 16, 0x10000},
    { 9, 19,  7, 128},
    {10, 21, 13, 0x2000},
    {11, 23, 19, 0x80000}
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
        .var02 = 5,
        .var04 = 1,
        .var05 = 1,
        .var06 = 255,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 10,
        .var04 = 1,
        .var05 = 1,
        .var06 = 255,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 21,
        .var04 = 1,
        .var05 = 1,
        .var06 = 255,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 85,
        .var04 = 1,
        .var05 = 1,
        .var06 = 255,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 90,
        .var04 = 1,
        .var05 = 1,
        .var06 = 255,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 101,
        .var04 = 1,
        .var05 = 1,
        .var06 = 255,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 117,
        .var04 = 1,
        .var05 = 1,
        .var06 = 255,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 122,
        .var04 = 1,
        .var05 = 1,
        .var06 = 255,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 133,
        .var04 = 1,
        .var05 = 1,
        .var06 = 255,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 149,
        .var04 = 1,
        .var05 = 1,
        .var06 = 255,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 154,
        .var04 = 1,
        .var05 = 1,
        .var06 = 255,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x8000,
        .var02 = 165,
        .var04 = 1,
        .var05 = 1,
        .var06 = 255,
        .var07_0 = 8,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x77d6,
        .var02 = 40,
        .var04 = 2,
        .var05 = 10,
        .var06 = 255,
        .var07_0 = 14,
        .var07_5 = 2,
        .var07_7 = FALSE
    }
};

const struct UnkStruct1 gUnknown_083F8E9C[] = {
    {
        .var00 = 0x53ff,
        .var02 = 0x101,
        .var04 = 5,
        .var05 = 30,
        .var06 = 255,
        .var07_0 = 14,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x7ffb,
        .var02 = 0x106,
        .var04 = 5,
        .var05 = 30,
        .var06 = 255,
        .var07_0 = 14,
        .var07_5 = 2,
        .var07_7 = FALSE
    }, {
        .var00 = 0x7f7f,
        .var02 = 0x10b,
        .var04 = 5,
        .var05 = 30,
        .var06 = 255,
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
        DmaCopy16(3, &gBGTilemapBuffers[1][224], (void *)(VRAM + 0x21c0), 0x340);
        eRoulette->var2A = 0;
    }
    switch (eRoulette->var28)
    {
    case 1:
        REG_BG0CNT = (32 * 248);
        DmaCopy16(3, &gBGTilemapBuffers[2][224], (void *)(VRAM + 0xf9c0), 0x340);
        eRoulette->var28 = 2;
    break;
    case 2:
        DmaCopy16(3, &gBGTilemapBuffers[2][224], (void *)(VRAM + 0xf9c0), 0x340);
    break;
    case 255:
        REG_BG0CNT = 0x1f08;
        DmaFill16(3, 0, (void *)(VRAM + 0xf9c0), 0x340);
        eRoulette->var28 = 0;
    case 0:
        break;
    }
}

void sub_8115238(void)
{
    u8 i;
    u32 temp;
    const struct StructgUnknown_083F8DF4 *s0;
    u16 arr[] = {RGB(24, 4, 10), RGB(10, 19, 6), RGB(24, 4, 10)};
    memset(eRoulette, 0, sizeof(*eRoulette));
    eRoulette->var04_0 = (gSpecialVar_0x8004 & 1);
    if (gSpecialVar_0x8004 & 0x80)
        eRoulette->var04_7 = 1;
    s0 = gUnknown_083F8DF4;
    eRoulette->var22   = s0[eRoulette->var04_0].var03;
    eRoulette->var23   = s0[eRoulette->var04_0].var04;
    eRoulette->var19 = temp = gUnknown_083F8DF0[eRoulette->var04_0 + eRoulette->var04_7 * 2];
    eRoulette->var1A_4 = 1;
    if (temp == 1)
        gPlttBufferUnfaded[0] = gPlttBufferUnfaded[81] = gPlttBufferFaded[0] = gPlttBufferFaded[81] = arr[0];
    else
        gPlttBufferUnfaded[0] = gPlttBufferUnfaded[81] = gPlttBufferFaded[0] = gPlttBufferFaded[81] = arr[1];
    sub_8124918((&eRoulette->varB8));
    for (i = 0; i < 13; i++)
        sub_812492C((&eRoulette->varB8), i, &gUnknown_083F8E34[i]);
    for (i = 0; i < 6; i++)
    {
        switch (GetMonData(&gPlayerParty[i], MON_DATA_SPECIES2))
        {
        case SPECIES_SHROOMISH:
            eRoulette->var02 |= 1;
            break;
        case SPECIES_TAILLOW:
            eRoulette->var02 |= 2;
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
    case 0:
        SetVBlankCallback(NULL);
        ScanlineEffect_Stop();
        ClearVideoCallbacks();
        sub_80F9368();
        REG_BG2CNT   = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(1) | BGCNT_256COLOR | BGCNT_SCREENBASE(6) | BGCNT_TXT512x256;
        REG_BG1CNT   = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_16COLOR | BGCNT_SCREENBASE(4) | BGCNT_TXT512x256;
        REG_BLDCNT   = BLDCNT_EFFECT_NONE | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BD;
        REG_BLDALPHA = BLDALPHA_BLEND(10, 6);
        LZ77UnCompVram(gUnknown_08E8096C, (void *)VRAM);
        LZ77UnCompVram(gRouletteWheelTiles, (void *)(VRAM + 0x4000));
        gMain.state++;
        break;
    case 1:
        ResetPaletteFade();
        ResetSpriteData();
        ResetTasks();
        gMain.state++;
        break;
    case 2:
        Text_LoadWindowTemplate(&gWindowTemplate_81E6C3C);
        InitMenuWindow(&gMenuTextWindowTemplate);
        LoadPalette(gUnknown_083F86BC, 0, 0x1c0);
        gMain.state++;
        break;
    case 3:
        sub_8115238();
        ClearBGTilemapBuffers();
        LZ77UnCompWram(gUnknown_083F88BC, (void *)(ewram18800));
        LZ77UnCompVram(gUnknown_083F8A60, (void *)(VRAM + 0x3000));
        gMain.state++;
        break;
    case 4:
        sub_8117838(0);
        sub_811857C();
        sub_81184D8();
        sub_8117F2C();
        sub_8117900();
        sub_8117BBC();
        sub_8117DF4();
        gMain.state++;
        break;
    case 5:
        AnimateSprites();
        BuildOamBuffer();
        sub_81180F4(gSaveBlock1.coins);
        sub_81182F8(6);
        sub_811829C(0);
        sub_8117158(0);
        Menu_DrawStdWindowFrame(0, 14, 29, 19);
        Menu_PrintText(gUnknown_081C4157, 1, 15);
        gSpriteCoordOffsetX = -60;
        gSpriteCoordOffsetY = 0;
        gMain.state++;
        break;
    case 6:
        REG_DISPCNT = DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG0_ON | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
        gMain.state++;
        break;
    case 7:
        temp_IME      = REG_IME;
        REG_IME       = 0;
        REG_IE       |= INTR_FLAG_VBLANK;
        REG_IME       = temp_IME;
        REG_DISPSTAT |= 8;
        SetVBlankCallback(sub_8115124);
        BeginHardwarePaletteFade(255, 0, 16, 0 , 1);
        taskid = eRoulette->varA4 = CreateTask(sub_81156BC, 0);
        gTasks[taskid].data[6] = 6;
        gTasks[taskid].data[13] = gSaveBlock1.coins;
        eRoulette->varA5 = CreateTask(sub_8115634, 1);
        SetMainCallback2(sub_81150FC);
        break;
    }
}

void sub_8115634(u8 taskId)
{
    s16 sin;
    s16 cos;
    s32 cos32;

    if (eRoulette->var21++ == eRoulette->var23)
    {
        eRoulette->var21 = 0;
        if ((eRoulette->var24 -= eRoulette->var22) < 0)
            eRoulette->var24 = 360 - eRoulette->var22;
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
    if (unk_203955C[0] != 0 && JOY_NEW(START_BUTTON))
    {
        gTasks[eRoulette->varA4].func = sub_81157AC;
        m4aMPlayStop(&gMPlayInfo_SE1);
        m4aMPlayStop(&gMPlayInfo_SE2);
        m4aMPlayStop(&gMPlayInfo_SE3);
    }
#endif
}

void sub_81156BC(u8 taskid)
{
    if (UpdatePaletteFade() == 0)
    {
        REG_BLDCNT   |= BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BD;
        REG_BLDALPHA  = BLDALPHA_BLEND(8, 8);
        gTasks[taskid].data[6] = 0;
        sub_8116CAC(taskid);
        sub_8116CF8();
        sub_81185E8();
        sub_8117158(0);
        sub_81182F8(6);
        sub_8116C34(taskid, sub_81159BC, 0xffff, 3);
    }
}

void sub_8115734(u8 taskid)
{
    DisplayYesNoMenu(20, 8, 1);
    sub_814AAF8(RGB(30, 12, 11));
    Menu_DrawStdWindowFrame(0, 14, 29, 19);
    Menu_PrintText(&gUnknown_081C41E3, 1, 15);
    DoYesNoFuncWithChoice(taskid, &gUnknown_083F8EBC);
}

void sub_811577C(u8 taskid)
{
    Menu_EraseWindowRect(20, 8, 26, 13);
    gTasks[taskid].func = sub_81159BC;
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
    case 0:
        sub_8124DDC(&gBGTilemapBuffers[2][0], 0, 14, 7, 16, 13);
        break;
    case 1:
    case 2:
    case 3:
    case 4:
        temp0 = (r0 * 3 + 14);
        sub_8124DDC(&gBGTilemapBuffers[2][0], 0, 14, 7, 16, 13);
        sub_8124E2C(&gBGTilemapBuffers[2][0], ewram18800 + 0x119, temp0, 7, 3, 13);
        break;
    case 5:
    case 10:
    case 15:
        temp1 = ((r0 - 1) / 5 * 3 + 10);
        sub_8124DDC(&gBGTilemapBuffers[2][0], 0, 14, 7, 16, 13);
        sub_8124E2C(&gBGTilemapBuffers[2][0], ewram18800 + 0x140, 14, temp1, 16, 3);
        break;
    default:
        temp0 = ((r0 % 5) * 3 + 14);
        temp1 = ((r0 - 1) / 5 * 3 + 7);
        sub_8124DDC(&gBGTilemapBuffers[2][0], 0, 14, 7, 16, 13);
        sub_8124E2C(&gBGTilemapBuffers[2][0], ewram18800 + 0x110, temp0, temp1, 3, 3);
        break;
    }
}

void sub_8115928(u8 taskid, u8 r1)
{
    if (!r1)
        sub_811829C(gTasks[taskid].data[4]);
    else
        sub_811829C(eRoulette->var1B[eRoulette->var1A_0]);
    sub_81157D0(gTasks[taskid].data[4]);
}

void sub_811597C(u8 taskid)
{
    eRoulette->var28 = 1;
    sub_81157D0(gTasks[taskid].data[4]);
    eRoulette->var23 = 2;
    eRoulette->var21 = 0;
    gTasks[taskid].func = sub_8115E14;
}

void sub_81159BC(u8 taskid)
{
    s16 i;

    if (eRoulette->var08 & 0x20)
    {
        for (i = 11; (i < 14); i++)
            if ((eRoulette->var08 & gUnknown_083F8C00[i].var08) == 0)
                break;
    }
    else
    {
        for (i = 6; (i < 10); i++)
            if ((eRoulette->var08 & gUnknown_083F8C00[i].var08) == 0)
                break;
    }
    gTasks[taskid].data[4] = i;
    sub_8116CAC(taskid);
    sub_8117158(gTasks[taskid].data[4]);
    sub_811829C(gTasks[taskid].data[4]);
    sub_8116EF8(gTasks[taskid].data[4]);
    gTasks[taskid].data[1] = 0;
    gTasks[taskid].func = sub_811597C;
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
    case 0:
    case 1:
        temp1 = (*r0 % 5);
        temp = temp1 + 15;
        if (temp1 == 0)
            temp1 = 5;
        break;
    case 2:
    case 3:
        temp1 = (s16)(*r0 / 5) * 5;
        temp = temp1 + 4;
        if (temp1 == 0)
            temp1 = 1;
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
    u8 z = 0;
    bool8 var0 = FALSE;
    if (JOY_NEW(DPAD_UP))
    {
        var0 = TRUE;
        if (!sub_8115A94(&gTasks[r0].data[4], 0))
            return;
    }
    if (JOY_NEW(DPAD_DOWN))
    {
        var0 = TRUE;
        if (!sub_8115A94(&gTasks[r0].data[4], 1))
            return;
    }
    if (JOY_NEW(DPAD_LEFT))
    {
        var0 = TRUE;
        if (!sub_8115A94(&gTasks[r0].data[4], 2))
            return;
    }
    if (JOY_NEW(DPAD_RIGHT))
    {
        var0 = TRUE;
        if (!sub_8115A94(&gTasks[r0].data[4], 3))
            return;
    }
    if (var0)
    {
        u8 i;
        sub_8117158(gTasks[r0].data[4]);
        sub_8115928(r0, FALSE);
        gTasks[r0].data[1] = z;
        PlaySE(SE_SELECT);
        sub_8124D3C((&eRoulette->varB8), 0xffff);
        eRoulette->varB8.var04[15].var00_7 = 0;
        eRoulette->varB8.var04[14].var00_7 = 0;
        eRoulette->varB8.var04[13].var00_7 = 0;
        sub_8116EF8(gTasks[r0].data[4]);
        for (i = 0; i < 4; i++)
        {
            gSprites[eRoulette->var3C[i + 41]].oam.tileNum =
            gSprites[eRoulette->var3C[i + 41]].sheetTileStart
            + (*gSprites[eRoulette->var3C[i + 41]].anims)->type;
        }
        if ((u16)(gTasks[r0].data[4] - 1) < 4 && !(eRoulette->var08 & gUnknown_083F8C00[gTasks[r0].data[4]].var08) )
        {
            z = gTasks[r0].data[4] - 1;
            gSprites[eRoulette->var3C[z + 41]].oam.tileNum =
            gSprites[eRoulette->var3C[z + 41]].sheetTileStart
            + (*gSprites[eRoulette->var3C[z + 41]].anims + 1)->type;
        }
    }
}

void sub_8115D58(u8 r0)
{
    eRoulette->var28 = 255;
    if (eRoulette->var19 == 1)
        eRoulette->var23 = 1;
    else
        eRoulette->var23 = 0;
    eRoulette->var21 = 0;
    gTasks[r0].data[1] = 32;
    gTasks[r0].func = sub_8115ECC;
}

void sub_8115DA0(u8 taskid)
{
    eRoulette->var1B[eRoulette->var1A_0] = gTasks[taskid].data[4];
    gTasks[taskid].data[2] = sub_8117380(eRoulette->var1B[eRoulette->var1A_0]);
    sub_811829C(eRoulette->var1B[eRoulette->var1A_0]);
    if ((gTasks[taskid].data[13] -= eRoulette->var19) < 0)
        gTasks[taskid].data[13] = 0;
    sub_81180F4(gTasks[taskid].data[13]);
    gTasks[taskid].func = sub_8115D58;
}

void sub_8115E14(u8 taskid)
{
    sub_8115B58(taskid);
    switch (gTasks[taskid].data[1])
    {
    case 0:
        sub_81157D0(gTasks[taskid].data[4]);
        gTasks[taskid].data[1]+= 1;
    break;
    case 30:
        sub_81157D0(0);
        gTasks[taskid].data[1]+= 1;
    break;
    case 59:
        gTasks[taskid].data[1] = 0;
    break;
    default:
        gTasks[taskid].data[1]++;
    }
    if (JOY_NEW(A_BUTTON))
    {
        if ((eRoulette->var08 & gUnknown_083F8C00[gTasks[taskid].data[4]].var08))
            PlaySE(SE_BOO);
        else
        {
            m4aSongNumStart(SE_SHOP);
            gTasks[taskid].func = sub_8115DA0;
        }
    }
}

void sub_8115ECC(u8 taskid)
{
    if (gTasks[taskid].data[1]-- > 0)
    {
        if (gTasks[taskid].data[1] > 2)
            gSpriteCoordOffsetX += 2;
        if ((eRoulette->var26 += 4) == 104)
            gSprites[eRoulette->var3C[25]].callback = &SpriteCallbackDummy;
    }
    else
    {
        sub_8117AA8(1, 255);
        sub_8117C60(1, 255);
        gTasks[taskid].func = sub_8116100;
        gTasks[taskid].data[1] = 0;
    }
}

u8 sub_8115F58(u16 r0, u16 r1)
{
    u8 timeh;
    switch (eRoulette->var02)
    {
    case 1: // SHROOMISH
    case 2: // TAILLOW
        // one of the two is in party
        timeh = gLocalTime.hours - 4;
        if (!(timeh > 5))
        {
            if (!(r0 < 12 || (r1 & 1)))
                return 1;
            else
            {
                const struct StructgUnknown_083F8DF4 *p = gUnknown_083F8DF4;
                return p[eRoulette->var04_0].var02 / 2;
            }
        }
        else if (!(r1 & 3))
        {
            const struct StructgUnknown_083F8DF4 *p = gUnknown_083F8DF4;
            return p[eRoulette->var04_0].var02 / 2;
        }
        else
        {
            const struct StructgUnknown_083F8DF4 *p = gUnknown_083F8DF4;
            return p[eRoulette->var04_0].var02;
        }
        break;
    case 3:
        // both are in party
        timeh = gLocalTime.hours - 4;
        if (!(timeh > 6))
        {
            if (r0 < 6 || (r1 & 1))
            {
                const struct StructgUnknown_083F8DF4 *p = gUnknown_083F8DF4;
                return p[eRoulette->var04_0].var02 / 2;
            }
            else
            {
                return 1;
            }
        }
        else if ((r1 & 1) && !(r0 < 7))
        {
            const struct StructgUnknown_083F8DF4 *p = gUnknown_083F8DF4;
            return p[eRoulette->var04_0].var02 / 4;
        }
        else
        {
            const struct StructgUnknown_083F8DF4 *p = gUnknown_083F8DF4;
            return p[eRoulette->var04_0].var02 / 2;
        }
        break;
    case 0:
    default:
        // neither is in party
        timeh = gLocalTime.hours - 4;
        if (!(timeh > 5))
        {
            if (!(r1 & 3))
            {
                return 1;
            }
            else
            {
                const struct StructgUnknown_083F8DF4 *p = gUnknown_083F8DF4;
                return p[eRoulette->var04_0].var02 / 2;
            }
        }
        else if (!(r1 & 3))
        {
            if (!(r0 < 13))
            {
                const struct StructgUnknown_083F8DF4 *p = gUnknown_083F8DF4;
                return p[eRoulette->var04_0].var02 / 2;
            }
            else
            {
                const struct StructgUnknown_083F8DF4 *p = gUnknown_083F8DF4;
                return p[eRoulette->var04_0].var02;
            }
        }
        else if (r1 & (128 << 8))
        {
            if (!(r0 < 13))
            {
                const struct StructgUnknown_083F8DF4 *p = gUnknown_083F8DF4;
                return p[eRoulette->var04_0].var02;
            }
            else
            {
                const struct StructgUnknown_083F8DF4 *p = gUnknown_083F8DF4;
                return p[eRoulette->var04_0].var01;
            }
        }
        else
        {
            const struct StructgUnknown_083F8DF4 *p = gUnknown_083F8DF4;
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
    randmod = rand % 100;
    eRoulette->var7C = gTasks[taskid].data[6];
    eRoulette->var7F = g;
    eRoulette->var7E = g;
    eRoulette->var7D = g;
    randf = sub_8115F58(gTasks[taskid].data[8], rand);
    randfinal = (rand % randf) - (randf / 2);
    if (gLocalTime.hours < 13)
        r5 = 0;
    else
        r5 = 1;
    if (randmod < 80)
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
    eRoulette->var88 = S16TOPOSFLOAT(angles[(rand & 1) + r5]);
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
    gTasks[taskid].data[6]++;
    gTasks[taskid].data[8]++;
    sub_81182F8(6 - gTasks[taskid].data[6]);
    m4aSongNumStart(SE_ROULETTE_BALL);
    gTasks[taskid].func = sub_811637C;
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
            if (!gTasks[taskid].data[1])
            {
                u8 temp = sub_8116E5C(sub_8116D54(taskid, eRoulette->var7E), eRoulette->var1B[eRoulette->var1A_0]);
                gTasks[taskid].data[5] = temp;
                if (temp == 1)
                    sub_8124CE8((&eRoulette->varB8), 0x1000);
            }
            if (gTasks[taskid].data[1] < 61)
            {
                if (JOY_NEW(A_BUTTON))
                    gTasks[taskid].data[1] = 60;
                gTasks[taskid].data[1]++;
            }
            else
            {
                sub_8117158(eRoulette->var1B[eRoulette->var1A_0]);
                sub_8117AA8(0, (u8)gTasks[taskid].data[12]);
                sub_8117C60(0, (u8)gTasks[taskid].data[6] - 1);
                gTasks[taskid].data[1] = 32;
                gTasks[taskid].func = sub_8116474;
            }
        }
    }
}

void sub_8116474(u8 taskid)
{
    if (gTasks[taskid].data[1]-- > 0)
    {
        if (gTasks[taskid].data[1] > 2)
            gSpriteCoordOffsetX -= 2;
        if ((eRoulette->var26 -= 4) == 104)
            gSprites[eRoulette->var3C[25]].callback = sub_81184CC;
    }
    else
    {
        sub_8117D68(gTasks[taskid].data[12]);
        if (gTasks[taskid].data[5] == 1)
            gTasks[taskid].data[1] = 121;
        else
            gTasks[taskid].data[1] = 61;
        gTasks[taskid].func = sub_8116514;
    }
}

void sub_8116514(u8 taskid)
{
    if (gTasks[taskid].data[1]-- > 1)
    {
        switch (gTasks[taskid].data[1] % 16)
        {
        case 8:
            sub_8117AA8(0, 255);
            sub_8117C60(0, 255);
            break;
        case 0:
            sub_8117AA8(0, (u8)gTasks[taskid].data[12]);
            sub_8117C60(0, (u8)gTasks[taskid].data[6] - 1);
            break;
        }
    }
    else
    {
        sub_8116C34(taskid, sub_8116638, 30, 0);
    }
}

void sub_811659C(u8 taskid)
{
    switch (gTasks[taskid].data[5])
    {
    case 1:
    case 2:
        if (IsFanfareTaskInactive())
        {
            u32 wins = GetGameStat(GAME_STAT_CONSECUTIVE_ROULETTE_WINS);
            if (wins < ++gTasks[taskid].data[11])
                SetGameStat(GAME_STAT_CONSECUTIVE_ROULETTE_WINS, gTasks[taskid].data[11]);
            sub_8116C34(taskid, sub_811677C, 0xffff, 3);
        }
        break;
    case 0:
    default:
        if (!IsSEPlaying())
        {
            gTasks[taskid].data[11] = FALSE;
            sub_8116C34(taskid, sub_81167F4, 0xffff, 3);
        }
    }
}

void sub_8116638(u8 taskid)
{
    switch (gTasks[taskid].data[5])
    {
    case 1:
    case 2:
        if (gTasks[taskid].data[2] == 12)
        {
            PlayFanfare(MUS_SLOTS_JACKPOT);
            Menu_DrawStdWindowFrame(0, 14, 29, 19);
            Menu_PrintText(&gUnknown_081C41A5, 1, 15);
        }
        else
        {
            PlayFanfare(MUS_SLOTS_WIN);
            Menu_DrawStdWindowFrame(0, 14, 29, 19);
            Menu_PrintText(&gUnknown_081C4199, 1, 15);
        }
        break;
    case 0:
    default:
        m4aSongNumStart(SE_FAILURE);
        Menu_DrawStdWindowFrame(0, 14, 29, 19);
        Menu_PrintText(&gUnknown_081C41AE, 1, 15);
    }
    gTasks[taskid].data[1] = 0;
    gTasks[taskid].func = sub_811659C;
}

void sub_81166E8(u8 taskid)
{
    s32 r0 = gTasks[taskid].data[7];
    switch (r0)
    {
    case 0:
        gTasks[taskid].data[13]++;
        m4aSongNumStart(SE_PIN);
        sub_81180F4(gTasks[taskid].data[13]);
        if (gTasks[taskid].data[13] > 0x270e)
        {
            gTasks[taskid].data[1] = r0;
        }
        else
        {
            gTasks[taskid].data[1]--;
            gTasks[taskid].data[7]++;
        }
        break;
    case 3:
        m4aSongNumStop(SE_PIN);
        gTasks[taskid].data[7] = 0;
        break;
    default:
        gTasks[taskid].data[7]++;
    }
    if (gTasks[taskid].data[1] == 0)
        sub_8116C34(taskid, sub_81167F4, 0xffff, 3);
}

void sub_811677C(u8 taskid)
{
    ConvertIntToDecimalStringN((u8 *)&gStringVar1, (eRoulette->var19 * gTasks[taskid].data[2]), STR_CONV_MODE_LEFT_ALIGN, 2);
    StringExpandPlaceholders((u8 *)&gStringVar4, &gUnknown_081C41BD);
    Menu_DrawStdWindowFrame(0, 14, 29, 19);
    Menu_PrintText((u8 *)&gStringVar4, 1, 15);
    gTasks[taskid].data[1] = (eRoulette->var19 * gTasks[taskid].data[2]);
    gTasks[taskid].data[7] = 0;
    gTasks[taskid].func = sub_81166E8;
}

void sub_81167F4(u8 taskid)
{
    sub_8124D3C((&eRoulette->varB8), 0xffff);
    eRoulette->varB8.var04[15].var00_7 = 0;
    eRoulette->varB8.var04[14].var00_7 = 0;
    eRoulette->varB8.var04[13].var00_7 = 0;
    gSprites[eRoulette->var3C[7 + gUnknown_083F8C00[gTasks[taskid].data[12]].var00]].invisible = TRUE;
    gTasks[taskid].func = sub_8116880;
}

void sub_8116880(u8 taskid)
{
    u8 i = 0;
    gTasks[taskid].data[4] = i;
    eRoulette->var1B[eRoulette->var1A_0] = 0;
    sub_8117158(0);
    gSprites[eRoulette->var3C[48]].invisible = TRUE;
    for (i = 0; i < 4; i++)
    {
        gSprites[eRoulette->var3C[i + 41]].oam.tileNum =
        gSprites[eRoulette->var3C[i + 41]].sheetTileStart
        + (*gSprites[eRoulette->var3C[i + 41]].anims)->type;
    }
    if (!(gTasks[taskid].data[13] < eRoulette->var19))
    {
        if (gTasks[taskid].data[6] == 6)
        {
            Menu_DrawStdWindowFrame(0, 14, 29, 19);
            Menu_PrintText(&gUnknown_081C41F1, 1, 15);
            sub_8116C34(taskid, &dp01t_12_3_battle_menu, 0xffff, 3);
        }
        else if (gTasks[taskid].data[13] == 0x270f)
        {
            Menu_DrawStdWindowFrame(0, 14, 29, 19);
            Menu_PrintText(&gUnknown_081C4231, 1, 15);
            sub_8116C34(taskid, sub_8115734, 0xffff, 3);
        }
        else
        {
            gTasks[taskid].func = sub_8115734;
        }
    }
    else
    {
        Menu_DrawStdWindowFrame(0, 14, 29, 19);
        Menu_PrintText(&gUnknown_081C41D2, 1, 15);
        sub_8116C34(taskid, sub_81157AC, 60, 3);
    }
}

void dp01t_12_3_battle_menu(u8 taskid)
{
    u8 i = 0;
    gTasks[taskid].data[6] = 0;
    sub_8116CAC(taskid);
    sub_8116CF8();
    sub_81185E8();
    sub_8117158(0);
    sub_81182F8(6);
    for (i = 0; i < 12; i++)
        gSprites[eRoulette->var3C[i + 7]].invisible = FALSE;
    if (gTasks[taskid].data[13] == 0x270f)
    {
        Menu_DrawStdWindowFrame(0, 14, 29, 19);
        Menu_PrintText(&gUnknown_081C4231, 1, 15);
        sub_8116C34(taskid, sub_8115734, 0xffff, 3);
    }
    else
    {
        gTasks[taskid].func = sub_8115734;
    }
}

void sub_8116AB0(u8 taskid)
{
    sub_8124D3C((&eRoulette->varB8), 0xffff);
    sub_8124918((&eRoulette->varB8));
    gSaveBlock1.coins = gTasks[taskid].data[13];
    if (gSaveBlock1.coins < eRoulette->var19)
        gSpecialVar_0x8004 = TRUE;
    else
        gSpecialVar_0x8004 = FALSE;
    BeginHardwarePaletteFade(255, 0, 0, 16, 0);
    gTasks[taskid].func = sub_8116B40;
}

void sub_8116B40(u8 taskId) // end roulette ?
{
    if (UpdatePaletteFade() == 0)
    {
        SetVBlankCallback(NULL);
        memset(eRoulette, 0, 0x17c);
        gSpriteCoordOffsetX = gSpriteCoordOffsetY = 0;
        sub_80F9368();
        FreeAllSpritePalettes();
        ResetPaletteFade();
        ResetSpriteData();
        ClearBGTilemapBuffers();
        REG_BLDCNT = 0;
        REG_BLDALPHA = 0;
        REG_BLDY = 0;
        gFieldCallback = sub_8080990;
        SetMainCallback2(&CB2_ReturnToField);
        DestroyTask(taskId);
#if DEBUG
        unk_203955C[0] = 0;
#endif
    }
}

void sub_8116BC0(u8 taskid)
{
    if (eRoulette->varA8 == 0 || JOY_NEW(eRoulette->varAA))
    {
        gTasks[taskid].func = eRoulette->varAC;
        if (eRoulette->varAA > 0)
            PlaySE(SE_SELECT);
        eRoulette->varAC = NULL;
        eRoulette->varAA = 0;
        eRoulette->varA8 = 0;
    }
    if (eRoulette->varA8 != 0xffff)
        eRoulette->varA8--;
}

void sub_8116C34(u8 taskid, TaskFunc r1, u16 r2, u16 r3)
{
    eRoulette->varB4 = gTasks[taskid].func;
    if (r1 == NULL)
        r1 = eRoulette->varB4;
    eRoulette->varAC = r1;
    eRoulette->varA8 = r2;
    if (r2 == 0xffff && r3 == 0)
        eRoulette->varAA = 0xffff;
    else
        eRoulette->varAA = r3;
    gTasks[taskid].func = sub_8116BC0;
}

void sub_8116CAC(u8 taskid)
{
    u8 i = 0;
    eRoulette->var00 = i;
    eRoulette->var03_0 = 0;
    eRoulette->var03_5 = 0;
    eRoulette->var03_6 = 0;
    eRoulette->var03_7 = 0;
    for (i = 0; i < 6; i++)
        eRoulette->var1B[i] = 0;
    eRoulette->var1A_0 = 0;
    gTasks[taskid].data[1] = 0;
}

void sub_8116CF8(void)
{
    u8 i;
    eRoulette->var08 = 0;
    for (i = 0; i < 6; i++)
        eRoulette->var0C[i] = 0;
    for (i = 0; i < 4; i++)
        eRoulette->var12[i] = 0;
    for (i = 0; i < 3; i++)
        eRoulette->var16[i] = 0;
    sub_8117C60(1, 255);
}

u8 sub_8116D54(u8 taskid, u8 r1)
{
    u32 t0[] = {67650, 135300, 270600, 541200};
    u32 t1[] = {0x3e0, 0x7c00, 0xf8000};
    if (r1 > 11)
    {
        return 0;
    }
    else
    {
        u8 i;
        u8 z;
        eRoulette->var0C[gTasks[taskid].data[6] - 1] = gUnknown_083F8D90[r1].var02;
        gTasks[taskid].data[12] = gUnknown_083F8D90[r1].var02;
        eRoulette->var08 |= gUnknown_083F8D90[r1].var04;
        for (i = 0; i < 4; i++)
        {
            if (gUnknown_083F8D90[r1].var04 & t0[i])
                eRoulette->var12[i]++;
            if (eRoulette->var12[i] > 2)
                eRoulette->var08 |= t0[i];
        }
        for (z = 0; z < 3; z++)
        {
            if (gUnknown_083F8D90[r1].var04 & t1[z])
                eRoulette->var16[z]++;
            if (eRoulette->var16[z] > 3)
                eRoulette->var08 |= t1[z];
        }
        return gUnknown_083F8D90[r1].var02;
    }
}

u8 sub_8116E5C(u8 r0, u8 r1)
{
    u8 t = r0;
    if (--r0 < 19)
    {
        switch (r1)
        {
        case 0:
            return 3;
            break;
        case 1 ... 4:
            if (t == r1 + 5 || t == r1 + 10 || t == r1 + 15)
                return 1;
            break;
        case 5:
        case 10:
        case 15:
            if (!(t < r1 + 1) && !(t > r1 + 4))
                return 1;
            break;
        default:
            if (t == r1)
                return 1;
        }
    }
    return 0;
}

void sub_8116EF8(u8 r0)
{

    u16 var0 = 0;
    u8 var2;
    u16 var3;
    u8 i;
    switch (r0)
    {
    case 5:
    case 10:
    case 15:
        for (i = (r0 + 1); i < (r0 + 5); i++)
            if (!(eRoulette->var08 & gUnknown_083F8C00[i].var08))
                var0 |= gUnknown_083F8C00[i].var10;
        sub_8124CE8(&eRoulette->varB8, var0 &= 0xdfff);
        break;
    default:
    {
        struct UnkStruct1 var1[3];
        memcpy(var1, gUnknown_083F8E9C, sizeof var1);
        if (r0 > 0 && r0 < 5)
            var2 = 3;
        else
            var2 = 1;
        var3 = r0 / 5 - 1;
        switch (r0 % 5)
        {
            case 1:
                var3 = gSprites[eRoulette->var3C[7 + 0]].oam.paletteNum * 16;
                break;
            case 2:
                var3 = gSprites[eRoulette->var3C[7 + 1]].oam.paletteNum * 16;
                break;
            case 3:
                var3 = gSprites[eRoulette->var3C[7 + 2]].oam.paletteNum * 16;
                break;
            case 4:
                var3 = gSprites[eRoulette->var3C[7 + 3]].oam.paletteNum * 16;
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
    u8 v[5];
    u8 l;
    eRoulette->var2A = 1;
    sub_8117AA8(0, 0);
    sub_8124E2C(gBGTilemapBuffers[1], (u16 *)ewram18800, 14, 7, 16, 13);
    switch (r0)
    {
    case 0:
        return;
    case 1 ... 4:
        l = 4;
        for (i = 0; i < l; i++)
            v[i] = i * 5 + r0;
        break;
    case 5:
    case 10:
    case 15:
        l = 5;
        for (i = 0; i < l; i++)
            v[i] = i + r0;
        break;
    default:
        l = 1;
        v[0] = r0;
    }
    for (i = 0; i < l; i++)
    {
        var0 = gUnknown_083F8C00[v[i]].var06;
        var1 = gUnknown_083F8C00[v[i]].var03;
        for (z = 0; z < 3; z++)
        {
            var2 = (gUnknown_083F8C00[v[i]].var04 + z) * 32;
            gBGTilemapBuffers[1][var1 + var2 + 0] = ewram18800[0xD0 + (var0 + z) * 3 + 0];
            gBGTilemapBuffers[1][var1 + var2 + 1] = ewram18800[0xD0 + (var0 + z) * 3 + 1];
            gBGTilemapBuffers[1][var1 + var2 + 2] = ewram18800[0xD0 + (var0 + z) * 3 + 2];
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
            return 0;
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
    x1 = 0x7400 - eRoulette->var2C.a * (gSpriteCoordOffsetX + 116)
                - eRoulette->var2C.b * (gSpriteCoordOffsetY + 80);
    x2 = 0x5400 - eRoulette->var2C.c * (gSpriteCoordOffsetX + 116)
                - eRoulette->var2C.d * (gSpriteCoordOffsetY + 80);
    REG_BG2X_L = x1;
    REG_BG2X_H = (x1 & 0xfff0000) >> 16;
    REG_BG2Y_L = x2;
    REG_BG2Y_H = (x2 & 0xfff0000) >> 16;
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
    DisplayYesNoMenu(20, 8, 1);
    sub_814AAF8(RGB(30, 12, 11));
    DoYesNoFuncWithChoice(r0, &gUnknown_083F8EB4);
}

void sub_8117528(u8 taskid)
{
    if (!gPaletteFade.active)
    {
        SetVBlankCallback(NULL);
        SetMainCallback2(sub_8115384);
        DestroyTask(taskid);
    }
}

void sub_811755C(u8 taskid)
{
    Menu_EraseWindowRect(20, 8, 26, 13);
    Menu_EraseScreen();
    BeginNormalPaletteFade(0xffffffff, 0, 0, 16, RGB(0, 0, 0));
    gPaletteFade.delayCounter = gPaletteFade.multipurpose2;
    UpdatePaletteFade();
    gTasks[taskid].func = sub_8117528;
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
    if (!JOY_NEW(A_BUTTON | B_BUTTON) && gTasks[taskid].data[0] < 61)
        return;
    gSpecialVar_0x8004 = 1;
    Menu_EraseScreen();
    ScriptContext2_Disable();
    DestroyTask(taskid);
}

void sub_8117630(u8 taskid)
{
    u32 temp = gUnknown_083F8DF0[(gSpecialVar_0x8004 & 1) + (gSpecialVar_0x8004 >> 7 << 1)];
    ConvertIntToDecimalStringN(gStringVar1, temp, 2, 1);
    StringExpandPlaceholders(gStringVar4, &gUnknown_081C40DF);
    Menu_DrawStdWindowFrame(0, 14, 29, 19);
    Menu_PrintText(gStringVar4, 1, 15);
    gTasks[taskid].func = sub_81174F8;
}

void Task_Roulette_0(u8 taskid)
{
    s32 temp;
    ConvertIntToDecimalStringN(gStringVar1, gTasks[taskid].data[13], 1, 4);
    StringExpandPlaceholders(gStringVar4, gOtherText_Coins);
    Menu_DrawStdWindowFrame(0, 0, 9, 3);
    MenuPrint_RightAligned(gStringVar4, 9, 1);
    temp = gUnknown_083F8DF0[(gSpecialVar_0x8004 & 1) + (gSpecialVar_0x8004 >> 7 << 1)];
    ConvertIntToDecimalStringN(gStringVar1, temp, 2, 1);
    if (gTasks[taskid].data[13] >= temp)
    {
        if ((gSpecialVar_0x8004 & 0x80) && (gSpecialVar_0x8004 & 1))
        {
            Menu_DrawStdWindowFrame(0, 14, 29, 19);
            Menu_PrintText(&gUnknown_081C4139, 1, 15);
            sub_8116C34(taskid , sub_8117630, 0xffff, 3);
        }
        else
        {
            StringExpandPlaceholders(gStringVar4, &gUnknown_081C40DF);
            Menu_DrawStdWindowFrame(0, 14, 29, 19);
            Menu_PrintText(gStringVar4, 1, 15);
            gTasks[taskid].func = sub_81174F8;
        }
    }
    else
    {
        StringExpandPlaceholders(gStringVar4, &gUnknown_081C411C);
        Menu_DrawStdWindowFrame(0, 14, 29, 19);
        Menu_PrintText(gStringVar4, 1, 15);
        gTasks[taskid].func = sub_81175DC;
        gTasks[taskid].data[13] = 0;
        gTasks[taskid].data[0] = 0;
    }
}

#if DEBUG

#if (ENGLISH && REVISION == 0)
    static const u8 gUnknown_Debug_0842510D[] = _("コインの かず STARTで きめて\nAーp1　Bーm1　R:Lー×10");
#else
    static const u8 gUnknown_Debug_0842510D[] = _("Set　COIN　and　Press　START\nAーp1　Bーm1　R:Lー×10");
#endif

void debug_sub_812CDE4(u8 taskId)
{
#if (ENGLISH && REVISION == 0)
    u8 coinText[] = {0xFD, 0x02, 0xFF};
#endif

    if (JOY_NEW(A_BUTTON))
    {
        gTasks[taskId].data[13]++;
        if (gTasks[taskId].data[13] == 10000)
            gTasks[taskId].data[13] = 0;
        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].data[13], 1, 4);
#if (ENGLISH && REVISION == 0)
        StringExpandPlaceholders(gStringVar4, coinText);
        Menu_PrintText(gStringVar4, 2, 1);
#else
        StringExpandPlaceholders(gStringVar4, gOtherText_Coins);
        MenuPrint_RightAligned(gStringVar4, 9, 1);
#endif
    }
    else if (JOY_NEW(B_BUTTON))
    {
        gTasks[taskId].data[13]--;
        if (gTasks[taskId].data[13] == -1)
            gTasks[taskId].data[13] = 9999;
        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].data[13], 1, 4);
#if (ENGLISH && REVISION == 0)
        StringExpandPlaceholders(gStringVar4, coinText);
        Menu_PrintText(gStringVar4, 2, 1);
#else
        StringExpandPlaceholders(gStringVar4, gOtherText_Coins);
        MenuPrint_RightAligned(gStringVar4, 9, 1);
#endif
    }
    else if (JOY_NEW(R_BUTTON))
    {
        gTasks[taskId].data[13] += 10;
        if (gTasks[taskId].data[13] > 9999)
            gTasks[taskId].data[13] -= 9999;
        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].data[13], 1, 4);
#if (ENGLISH && REVISION == 0)
        StringExpandPlaceholders(gStringVar4, coinText);
        Menu_PrintText(gStringVar4, 2, 1);
#else
        StringExpandPlaceholders(gStringVar4, gOtherText_Coins);
        MenuPrint_RightAligned(gStringVar4, 9, 1);
#endif
    }
    else if (JOY_NEW(L_BUTTON))
    {
        gTasks[taskId].data[13] -= 10;
        if (gTasks[taskId].data[13] < 0)
            gTasks[taskId].data[13] += 9999;
        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].data[13], 1, 4);
#if (ENGLISH && REVISION == 0)
        StringExpandPlaceholders(gStringVar4, coinText);
        Menu_PrintText(gStringVar4, 2, 1);
#else
        StringExpandPlaceholders(gStringVar4, gOtherText_Coins);
        MenuPrint_RightAligned(gStringVar4, 9, 1);
#endif
    }
    else if (JOY_NEW(START_BUTTON))
    {
        gSaveBlock1.coins = gTasks[taskId].data[13];
        gTasks[taskId].func = Task_Roulette_0;
        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].data[13], 1, 4);
#if (ENGLISH && REVISION == 0)
        StringExpandPlaceholders(gStringVar4, coinText);
        Menu_PrintText(gStringVar4, 2, 1);
#else
        StringExpandPlaceholders(gStringVar4, gOtherText_Coins);
        MenuPrint_RightAligned(gStringVar4, 9, 1);
#endif
        unk_2039560 = 0;
    }
    else if (JOY_NEW(SELECT_BUTTON))
    {
        gSaveBlock1.coins = gTasks[taskId].data[13];
        gTasks[taskId].func = Task_Roulette_0;
        ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].data[13], 1, 4);
#if (ENGLISH && REVISION == 0)
        StringExpandPlaceholders(gStringVar4, coinText);
        Menu_PrintText(gStringVar4, 2, 1);
#else
        StringExpandPlaceholders(gStringVar4, gOtherText_Coins);
        MenuPrint_RightAligned(gStringVar4, 9, 1);
#endif
        unk_2039560 = 1;
    }
}

void debug_sub_812CFE8(u8 taskId)
{
    gTasks[taskId].data[13] = gSaveBlock1.coins;
    if (Random() & 1)
        gSpecialVar_0x8004 |= 128;
    ConvertIntToDecimalStringN(gStringVar1, gTasks[taskId].data[13], 1, 4);
    StringExpandPlaceholders(gStringVar4, gOtherText_Coins);
    Menu_DrawStdWindowFrame(0, 0, 9, 3);
#if (ENGLISH && REVISION == 0)
    Menu_PrintText(gStringVar4, 2, 1);
#else
    MenuPrint_RightAligned(gStringVar4, 9, 1);
#endif
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
    gTasks[taskid].data[13] = gSaveBlock1.coins;
}
